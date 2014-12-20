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
-2.680187, -0.02544244, -2.640999, 1, 0, 0, 1,
-2.668865, 1.411211, -1.894325, 1, 0.007843138, 0, 1,
-2.50233, 0.05720323, -1.687196, 1, 0.01176471, 0, 1,
-2.405058, -0.2979645, -0.2680795, 1, 0.01960784, 0, 1,
-2.372829, 0.9930567, -0.4605241, 1, 0.02352941, 0, 1,
-2.357096, 0.1777495, -0.4773923, 1, 0.03137255, 0, 1,
-2.335742, 0.001351993, -0.9509885, 1, 0.03529412, 0, 1,
-2.331517, 0.4176233, 0.7353275, 1, 0.04313726, 0, 1,
-2.280183, 2.316457, -0.873456, 1, 0.04705882, 0, 1,
-2.246651, -1.544338, -1.511966, 1, 0.05490196, 0, 1,
-2.212005, 1.156822, -2.595013, 1, 0.05882353, 0, 1,
-2.165281, -0.2076934, -2.4764, 1, 0.06666667, 0, 1,
-2.16301, 0.4297806, -2.321183, 1, 0.07058824, 0, 1,
-2.144286, -1.809159, -1.830904, 1, 0.07843138, 0, 1,
-2.107317, -0.9425566, -2.235894, 1, 0.08235294, 0, 1,
-2.089304, -1.97993, -2.437274, 1, 0.09019608, 0, 1,
-2.077342, -0.7588285, -2.269767, 1, 0.09411765, 0, 1,
-2.075131, -1.263674, -1.430655, 1, 0.1019608, 0, 1,
-2.074551, 0.3831041, -2.365144, 1, 0.1098039, 0, 1,
-2.070065, 0.6489658, -1.013759, 1, 0.1137255, 0, 1,
-2.043867, 0.3868649, -1.680912, 1, 0.1215686, 0, 1,
-2.018638, -0.2797354, -0.9157845, 1, 0.1254902, 0, 1,
-2.017489, -0.6001927, -2.611857, 1, 0.1333333, 0, 1,
-2.014704, -1.650822, -1.101054, 1, 0.1372549, 0, 1,
-1.99585, 0.5832557, -0.910363, 1, 0.145098, 0, 1,
-1.972975, -0.270731, -2.837375, 1, 0.1490196, 0, 1,
-1.959133, 0.03607991, -0.2056524, 1, 0.1568628, 0, 1,
-1.947057, 1.107798, 0.5868714, 1, 0.1607843, 0, 1,
-1.941514, -1.426393, -2.029505, 1, 0.1686275, 0, 1,
-1.92435, 0.8985211, -1.090133, 1, 0.172549, 0, 1,
-1.923306, 0.9699623, -1.173369, 1, 0.1803922, 0, 1,
-1.906951, 1.227341, -0.2927665, 1, 0.1843137, 0, 1,
-1.902745, -0.07906596, -1.441084, 1, 0.1921569, 0, 1,
-1.853183, -1.296819, -4.050149, 1, 0.1960784, 0, 1,
-1.821454, -1.694085, -2.450507, 1, 0.2039216, 0, 1,
-1.819439, -0.4792942, -1.003278, 1, 0.2117647, 0, 1,
-1.804541, -1.103991, -2.434311, 1, 0.2156863, 0, 1,
-1.797947, -1.504593, -1.620112, 1, 0.2235294, 0, 1,
-1.79297, 0.935743, -0.357386, 1, 0.227451, 0, 1,
-1.775849, -0.9423578, -2.443289, 1, 0.2352941, 0, 1,
-1.771137, 0.3934886, -1.824402, 1, 0.2392157, 0, 1,
-1.760647, 0.5455273, -1.42218, 1, 0.2470588, 0, 1,
-1.757962, 0.5541828, -1.950655, 1, 0.2509804, 0, 1,
-1.755643, 1.235471, -1.089429, 1, 0.2588235, 0, 1,
-1.74489, -0.7837561, -1.166516, 1, 0.2627451, 0, 1,
-1.736564, -0.9161008, -2.928406, 1, 0.2705882, 0, 1,
-1.708341, 0.7351628, -1.242597, 1, 0.2745098, 0, 1,
-1.696926, 0.5291816, -3.410676, 1, 0.282353, 0, 1,
-1.681566, 2.909664, -0.5034087, 1, 0.2862745, 0, 1,
-1.66983, 0.4438848, -0.7994061, 1, 0.2941177, 0, 1,
-1.659422, -1.619566, -3.520726, 1, 0.3019608, 0, 1,
-1.656348, 0.6320423, 0.6973761, 1, 0.3058824, 0, 1,
-1.649683, 2.420632, -1.000547, 1, 0.3137255, 0, 1,
-1.649133, 0.5021521, 0.158692, 1, 0.3176471, 0, 1,
-1.64116, -1.128816, -2.509827, 1, 0.3254902, 0, 1,
-1.615355, -1.728119, -2.398731, 1, 0.3294118, 0, 1,
-1.608202, 1.117797, -1.818108, 1, 0.3372549, 0, 1,
-1.602869, -1.78033, -3.80343, 1, 0.3411765, 0, 1,
-1.598803, 1.262758, 0.942777, 1, 0.3490196, 0, 1,
-1.591433, -0.7820002, -1.593687, 1, 0.3529412, 0, 1,
-1.582534, 0.5608099, 1.307445, 1, 0.3607843, 0, 1,
-1.582423, -0.5119205, -2.447948, 1, 0.3647059, 0, 1,
-1.562167, 0.3325208, -1.437315, 1, 0.372549, 0, 1,
-1.557756, 0.08872204, -3.019506, 1, 0.3764706, 0, 1,
-1.547342, -0.1600437, -2.142082, 1, 0.3843137, 0, 1,
-1.544002, 0.02394153, -0.7008261, 1, 0.3882353, 0, 1,
-1.538293, 0.02842862, -2.284581, 1, 0.3960784, 0, 1,
-1.536025, -0.8677799, -2.344814, 1, 0.4039216, 0, 1,
-1.535813, 1.335467, -1.547771, 1, 0.4078431, 0, 1,
-1.528173, 1.068408, -0.8589743, 1, 0.4156863, 0, 1,
-1.527891, 1.143089, -2.238699, 1, 0.4196078, 0, 1,
-1.525731, 0.9466107, -1.32173, 1, 0.427451, 0, 1,
-1.513546, -0.6026905, -1.524708, 1, 0.4313726, 0, 1,
-1.512264, 1.789848, 0.4070576, 1, 0.4392157, 0, 1,
-1.504133, 1.142267, -1.435525, 1, 0.4431373, 0, 1,
-1.500994, -0.4372248, -0.6058546, 1, 0.4509804, 0, 1,
-1.496299, -0.8641226, -2.58141, 1, 0.454902, 0, 1,
-1.482964, 1.552638, -0.1156903, 1, 0.4627451, 0, 1,
-1.476747, 0.6918741, -1.370573, 1, 0.4666667, 0, 1,
-1.457969, 1.550602, -0.1954986, 1, 0.4745098, 0, 1,
-1.449768, -1.315386, -3.69257, 1, 0.4784314, 0, 1,
-1.419901, -0.7986921, -1.868824, 1, 0.4862745, 0, 1,
-1.418985, -0.4903937, -2.231965, 1, 0.4901961, 0, 1,
-1.417205, -0.1260382, -3.371941, 1, 0.4980392, 0, 1,
-1.412336, 0.1950746, -2.273929, 1, 0.5058824, 0, 1,
-1.398853, 0.03409724, -0.9365351, 1, 0.509804, 0, 1,
-1.397676, -0.3163001, -2.192688, 1, 0.5176471, 0, 1,
-1.392812, -0.6537462, -1.328516, 1, 0.5215687, 0, 1,
-1.390398, -2.869826, -2.935909, 1, 0.5294118, 0, 1,
-1.389835, -1.067695, -1.144769, 1, 0.5333334, 0, 1,
-1.388337, -0.5050319, -2.198724, 1, 0.5411765, 0, 1,
-1.387544, -1.576035, -2.338433, 1, 0.5450981, 0, 1,
-1.385464, -1.43214, -0.2467345, 1, 0.5529412, 0, 1,
-1.384311, -0.5098268, -2.142073, 1, 0.5568628, 0, 1,
-1.380709, 0.09246232, -0.8258995, 1, 0.5647059, 0, 1,
-1.369877, 0.453789, -3.212534, 1, 0.5686275, 0, 1,
-1.360512, 0.1663612, -1.080578, 1, 0.5764706, 0, 1,
-1.350655, 0.01042258, -0.02108657, 1, 0.5803922, 0, 1,
-1.348941, -0.1835761, -1.579205, 1, 0.5882353, 0, 1,
-1.346307, 1.318558, -0.05158662, 1, 0.5921569, 0, 1,
-1.344383, -1.712588, -0.9816349, 1, 0.6, 0, 1,
-1.335319, -0.8715764, -2.256651, 1, 0.6078432, 0, 1,
-1.332037, 0.6339466, -0.5742696, 1, 0.6117647, 0, 1,
-1.32953, 0.4731839, -2.437682, 1, 0.6196079, 0, 1,
-1.326572, -1.611906, -3.047266, 1, 0.6235294, 0, 1,
-1.325013, -0.4213994, -1.917594, 1, 0.6313726, 0, 1,
-1.30966, 1.235454, -0.009637853, 1, 0.6352941, 0, 1,
-1.302185, -0.8923323, -3.437959, 1, 0.6431373, 0, 1,
-1.289476, 0.05374917, -1.190302, 1, 0.6470588, 0, 1,
-1.282012, 0.8122137, -0.646691, 1, 0.654902, 0, 1,
-1.276711, -0.493292, -0.4016651, 1, 0.6588235, 0, 1,
-1.274796, 0.8452775, -0.8404808, 1, 0.6666667, 0, 1,
-1.270072, 0.4974923, -1.552883, 1, 0.6705883, 0, 1,
-1.262188, -0.4965018, -1.292634, 1, 0.6784314, 0, 1,
-1.254929, -0.2328658, -1.644958, 1, 0.682353, 0, 1,
-1.250971, 0.9016078, -0.5077924, 1, 0.6901961, 0, 1,
-1.249257, 0.7218111, -0.9557227, 1, 0.6941177, 0, 1,
-1.246308, 0.2431751, -1.173941, 1, 0.7019608, 0, 1,
-1.244469, -1.462366, -2.591638, 1, 0.7098039, 0, 1,
-1.235625, 0.4897734, 0.01014799, 1, 0.7137255, 0, 1,
-1.235143, 1.011717, -0.9694244, 1, 0.7215686, 0, 1,
-1.231771, 2.119395, -0.3298075, 1, 0.7254902, 0, 1,
-1.22767, -0.276757, -2.444714, 1, 0.7333333, 0, 1,
-1.22101, 0.5444107, -1.11767, 1, 0.7372549, 0, 1,
-1.215242, -0.3097444, -3.119984, 1, 0.7450981, 0, 1,
-1.213474, 0.319689, -0.1149869, 1, 0.7490196, 0, 1,
-1.211724, 2.024096, 0.8735167, 1, 0.7568628, 0, 1,
-1.207727, -0.9498206, -1.659126, 1, 0.7607843, 0, 1,
-1.201509, -0.09149506, -1.262956, 1, 0.7686275, 0, 1,
-1.197489, 0.1707979, -1.501015, 1, 0.772549, 0, 1,
-1.182698, 2.038323, -0.4640067, 1, 0.7803922, 0, 1,
-1.167096, 0.9399464, -1.470291, 1, 0.7843137, 0, 1,
-1.154394, -1.797659, -2.543964, 1, 0.7921569, 0, 1,
-1.150852, -0.7119728, -1.5013, 1, 0.7960784, 0, 1,
-1.148919, 0.05605437, -1.011695, 1, 0.8039216, 0, 1,
-1.148037, 0.2476237, -1.86384, 1, 0.8117647, 0, 1,
-1.137796, 0.6637846, -1.858278, 1, 0.8156863, 0, 1,
-1.137425, -0.1388481, -1.275334, 1, 0.8235294, 0, 1,
-1.135718, -3.09503, -3.99247, 1, 0.827451, 0, 1,
-1.135275, -0.942039, -1.461042, 1, 0.8352941, 0, 1,
-1.130615, -1.174482, -2.056495, 1, 0.8392157, 0, 1,
-1.13019, 1.237472, -0.7155111, 1, 0.8470588, 0, 1,
-1.121284, 1.762854, -0.3773911, 1, 0.8509804, 0, 1,
-1.12084, 0.548202, -1.422537, 1, 0.8588235, 0, 1,
-1.120581, -0.6403554, -1.754144, 1, 0.8627451, 0, 1,
-1.113371, -0.767925, -1.908162, 1, 0.8705882, 0, 1,
-1.109875, -0.9040398, -2.549587, 1, 0.8745098, 0, 1,
-1.104237, 0.1344767, -1.326301, 1, 0.8823529, 0, 1,
-1.098776, 0.3418599, -0.2416577, 1, 0.8862745, 0, 1,
-1.097639, -0.2901583, -1.523537, 1, 0.8941177, 0, 1,
-1.092019, -0.9589331, -2.600282, 1, 0.8980392, 0, 1,
-1.08545, -0.1725337, -2.520282, 1, 0.9058824, 0, 1,
-1.051519, 0.2012484, -2.725739, 1, 0.9137255, 0, 1,
-1.04913, 0.5882307, -0.372868, 1, 0.9176471, 0, 1,
-1.048903, -0.7830714, -1.708756, 1, 0.9254902, 0, 1,
-1.045852, 0.1427682, -0.8311311, 1, 0.9294118, 0, 1,
-1.040823, -1.582112, -1.625561, 1, 0.9372549, 0, 1,
-1.033397, 1.423018, -1.744308, 1, 0.9411765, 0, 1,
-1.031417, -1.316816, -2.646488, 1, 0.9490196, 0, 1,
-1.030592, -0.3896917, -4.752391, 1, 0.9529412, 0, 1,
-1.026068, 0.987889, -0.8184147, 1, 0.9607843, 0, 1,
-1.019925, 0.934324, -1.225678, 1, 0.9647059, 0, 1,
-1.01585, 1.279314, -0.2141859, 1, 0.972549, 0, 1,
-1.00609, -2.629156, -2.560681, 1, 0.9764706, 0, 1,
-0.9924795, 1.317992, 0.04729187, 1, 0.9843137, 0, 1,
-0.9910183, -0.8912097, -2.09112, 1, 0.9882353, 0, 1,
-0.9854564, 0.40681, 0.5814945, 1, 0.9960784, 0, 1,
-0.9779559, 0.5956497, -1.622205, 0.9960784, 1, 0, 1,
-0.9770763, 1.215335, -0.4024167, 0.9921569, 1, 0, 1,
-0.9703717, 2.190486, -2.624162, 0.9843137, 1, 0, 1,
-0.9618438, 0.9697036, -1.187103, 0.9803922, 1, 0, 1,
-0.9613143, 3.102931, -0.2001734, 0.972549, 1, 0, 1,
-0.9576161, -0.1049587, -1.884376, 0.9686275, 1, 0, 1,
-0.9576057, -0.6507584, -1.478312, 0.9607843, 1, 0, 1,
-0.9456776, 1.351841, -0.0454987, 0.9568627, 1, 0, 1,
-0.9441415, -0.08867963, -0.419747, 0.9490196, 1, 0, 1,
-0.9412398, -0.3904462, -0.8650951, 0.945098, 1, 0, 1,
-0.9322622, -1.402411, -1.300386, 0.9372549, 1, 0, 1,
-0.9314239, 0.2776608, -1.003683, 0.9333333, 1, 0, 1,
-0.9292863, 0.7619551, -1.255126, 0.9254902, 1, 0, 1,
-0.9274396, 0.3012613, -0.8479186, 0.9215686, 1, 0, 1,
-0.9263502, -1.052025, -2.19149, 0.9137255, 1, 0, 1,
-0.9250972, 0.5037814, -3.520021, 0.9098039, 1, 0, 1,
-0.9138061, 0.5066708, -1.890202, 0.9019608, 1, 0, 1,
-0.912759, -1.334642, -2.17687, 0.8941177, 1, 0, 1,
-0.9026541, 0.3060304, -1.789664, 0.8901961, 1, 0, 1,
-0.8996152, -0.1526092, -0.4484852, 0.8823529, 1, 0, 1,
-0.8936574, 0.2850087, 0.2203187, 0.8784314, 1, 0, 1,
-0.8904393, -0.7521683, -3.838323, 0.8705882, 1, 0, 1,
-0.889101, -0.9307905, -5.328933, 0.8666667, 1, 0, 1,
-0.8806936, 1.100712, -2.254632, 0.8588235, 1, 0, 1,
-0.8742746, -1.67073, -2.612204, 0.854902, 1, 0, 1,
-0.8724182, 0.8734068, -1.776354, 0.8470588, 1, 0, 1,
-0.869151, 0.8563729, 1.419847, 0.8431373, 1, 0, 1,
-0.8629394, 2.051628, -0.9041578, 0.8352941, 1, 0, 1,
-0.8569641, -0.6302516, -3.527719, 0.8313726, 1, 0, 1,
-0.8529496, 0.173644, -1.279921, 0.8235294, 1, 0, 1,
-0.8523805, -0.531849, -2.437189, 0.8196079, 1, 0, 1,
-0.8508012, 0.64841, -0.7280728, 0.8117647, 1, 0, 1,
-0.8462278, -1.898566, -3.013822, 0.8078431, 1, 0, 1,
-0.8432261, 0.1056736, -2.175875, 0.8, 1, 0, 1,
-0.8419061, 0.4345887, -1.672059, 0.7921569, 1, 0, 1,
-0.8340523, -0.01649794, -2.317726, 0.7882353, 1, 0, 1,
-0.8316697, -0.05828509, -0.8315501, 0.7803922, 1, 0, 1,
-0.8315422, 0.8826905, 0.6133406, 0.7764706, 1, 0, 1,
-0.8263265, 1.309471, -0.1816463, 0.7686275, 1, 0, 1,
-0.8160123, -0.3171951, -1.619156, 0.7647059, 1, 0, 1,
-0.8051569, 1.769454, -1.560656, 0.7568628, 1, 0, 1,
-0.8003077, -1.033175, -4.360044, 0.7529412, 1, 0, 1,
-0.7932501, 0.3536884, -0.440008, 0.7450981, 1, 0, 1,
-0.788784, 2.329205, -0.05549613, 0.7411765, 1, 0, 1,
-0.7878758, -1.29014, -2.64937, 0.7333333, 1, 0, 1,
-0.7811214, -0.03003015, -0.8429155, 0.7294118, 1, 0, 1,
-0.7761564, 0.847388, 0.2824655, 0.7215686, 1, 0, 1,
-0.7714286, 0.5099391, -0.9455912, 0.7176471, 1, 0, 1,
-0.7702189, -0.4935552, -1.451594, 0.7098039, 1, 0, 1,
-0.7688448, 1.088737, -1.050302, 0.7058824, 1, 0, 1,
-0.7634401, 1.868067, 1.102199, 0.6980392, 1, 0, 1,
-0.763422, 0.5282822, -1.604899, 0.6901961, 1, 0, 1,
-0.7620101, -1.11163, -1.653706, 0.6862745, 1, 0, 1,
-0.7600008, -1.344661, -1.838697, 0.6784314, 1, 0, 1,
-0.7577478, 0.7297485, -2.239144, 0.6745098, 1, 0, 1,
-0.7575545, 0.768661, -0.4874803, 0.6666667, 1, 0, 1,
-0.7495059, 0.2373655, -2.309096, 0.6627451, 1, 0, 1,
-0.7488315, 1.053101, 0.2097532, 0.654902, 1, 0, 1,
-0.7462489, 1.942208, -1.407567, 0.6509804, 1, 0, 1,
-0.7459303, -0.6017943, -3.411893, 0.6431373, 1, 0, 1,
-0.7457563, -0.2973797, -0.1439296, 0.6392157, 1, 0, 1,
-0.7402276, 0.1289368, -1.880349, 0.6313726, 1, 0, 1,
-0.7394243, -1.795167, -3.493538, 0.627451, 1, 0, 1,
-0.7392798, 0.204475, -1.755365, 0.6196079, 1, 0, 1,
-0.7328645, -0.6406983, -3.264396, 0.6156863, 1, 0, 1,
-0.7318379, -1.117055, -1.033338, 0.6078432, 1, 0, 1,
-0.7253414, -0.8919287, -2.296124, 0.6039216, 1, 0, 1,
-0.7219481, 0.4324767, -1.617623, 0.5960785, 1, 0, 1,
-0.7199886, 1.568428, -1.331254, 0.5882353, 1, 0, 1,
-0.7175529, 0.3763027, -2.269164, 0.5843138, 1, 0, 1,
-0.6957985, 0.6886243, -0.2690685, 0.5764706, 1, 0, 1,
-0.6904688, -1.456291, -3.11918, 0.572549, 1, 0, 1,
-0.6896371, -0.5280485, -3.107399, 0.5647059, 1, 0, 1,
-0.6816933, -0.7509286, -0.947996, 0.5607843, 1, 0, 1,
-0.6802117, -1.166204, -2.374837, 0.5529412, 1, 0, 1,
-0.6789484, 1.090903, -1.934098, 0.5490196, 1, 0, 1,
-0.6782831, 0.8471649, -0.391219, 0.5411765, 1, 0, 1,
-0.6742204, 0.8695732, -0.1349982, 0.5372549, 1, 0, 1,
-0.6719868, -0.5629043, -3.447929, 0.5294118, 1, 0, 1,
-0.6712124, 0.6937765, -0.4183176, 0.5254902, 1, 0, 1,
-0.6679171, -1.243014, -3.023564, 0.5176471, 1, 0, 1,
-0.6648885, 0.07446985, -0.5470341, 0.5137255, 1, 0, 1,
-0.6620322, -0.8539997, -1.798963, 0.5058824, 1, 0, 1,
-0.6613945, -1.833342, -1.981326, 0.5019608, 1, 0, 1,
-0.6587325, 1.324204, 0.1585436, 0.4941176, 1, 0, 1,
-0.6575855, -1.687159, -2.874106, 0.4862745, 1, 0, 1,
-0.6560947, -0.6323087, -2.937738, 0.4823529, 1, 0, 1,
-0.6505005, -0.1835376, -1.314946, 0.4745098, 1, 0, 1,
-0.649955, 0.368389, -3.161142, 0.4705882, 1, 0, 1,
-0.6449381, -1.127483, -1.991422, 0.4627451, 1, 0, 1,
-0.6439329, -0.05375887, -2.242628, 0.4588235, 1, 0, 1,
-0.6434297, 1.112089, -0.9136807, 0.4509804, 1, 0, 1,
-0.6410006, 1.045123, -1.425219, 0.4470588, 1, 0, 1,
-0.6397623, -0.09572482, -1.439583, 0.4392157, 1, 0, 1,
-0.6395476, -1.207523, -3.201107, 0.4352941, 1, 0, 1,
-0.6370412, -0.7624799, -2.407822, 0.427451, 1, 0, 1,
-0.6340814, 0.2202009, -1.885108, 0.4235294, 1, 0, 1,
-0.6338161, 0.9019839, 0.03268678, 0.4156863, 1, 0, 1,
-0.6294649, 1.794651, -0.2727491, 0.4117647, 1, 0, 1,
-0.6288984, 0.9212118, 0.368688, 0.4039216, 1, 0, 1,
-0.6237314, 0.4297898, -0.6428523, 0.3960784, 1, 0, 1,
-0.6196639, 1.10765, -0.01016629, 0.3921569, 1, 0, 1,
-0.6192172, 2.161268, -0.5681301, 0.3843137, 1, 0, 1,
-0.6180966, 0.7516538, -0.8906116, 0.3803922, 1, 0, 1,
-0.6179748, -0.07876396, 0.4353681, 0.372549, 1, 0, 1,
-0.6162951, 1.513808, 1.17357, 0.3686275, 1, 0, 1,
-0.6123774, 1.823968, 1.01722, 0.3607843, 1, 0, 1,
-0.6032362, -0.6400759, -1.538279, 0.3568628, 1, 0, 1,
-0.6010437, -0.6582496, -1.760989, 0.3490196, 1, 0, 1,
-0.5973055, 0.6877596, -1.112189, 0.345098, 1, 0, 1,
-0.5937132, -0.3122558, -3.10072, 0.3372549, 1, 0, 1,
-0.5935633, -1.037372, -3.05054, 0.3333333, 1, 0, 1,
-0.5920691, -0.8969193, -2.837441, 0.3254902, 1, 0, 1,
-0.5897404, 0.2071393, -3.363769, 0.3215686, 1, 0, 1,
-0.5870179, -0.1880522, -1.058442, 0.3137255, 1, 0, 1,
-0.5857637, 0.5323742, -1.32919, 0.3098039, 1, 0, 1,
-0.5844417, -0.2745237, -1.048903, 0.3019608, 1, 0, 1,
-0.575401, 0.1309747, -1.803109, 0.2941177, 1, 0, 1,
-0.574757, -1.436671, -3.381465, 0.2901961, 1, 0, 1,
-0.5714037, 1.589399, 0.7963182, 0.282353, 1, 0, 1,
-0.5705507, 0.4016718, -0.9151062, 0.2784314, 1, 0, 1,
-0.5693101, -0.01380972, -2.118938, 0.2705882, 1, 0, 1,
-0.5656784, -2.538921, -2.249542, 0.2666667, 1, 0, 1,
-0.5602217, 0.217947, -1.300496, 0.2588235, 1, 0, 1,
-0.557923, -0.2444512, -3.419135, 0.254902, 1, 0, 1,
-0.5559708, 1.413966, -0.8066256, 0.2470588, 1, 0, 1,
-0.5558003, -0.2392707, -1.082995, 0.2431373, 1, 0, 1,
-0.5445138, 1.295785, -0.4587192, 0.2352941, 1, 0, 1,
-0.5355628, -0.2215437, -3.102385, 0.2313726, 1, 0, 1,
-0.5332838, 0.1557017, -1.593971, 0.2235294, 1, 0, 1,
-0.5193464, 0.5575695, -0.6384326, 0.2196078, 1, 0, 1,
-0.517553, 0.9953572, -2.250758, 0.2117647, 1, 0, 1,
-0.5164064, 0.136033, -1.30031, 0.2078431, 1, 0, 1,
-0.5143717, 1.051025, 0.3593124, 0.2, 1, 0, 1,
-0.514091, -1.535471, -0.7214209, 0.1921569, 1, 0, 1,
-0.5135788, 0.8127201, 0.6752246, 0.1882353, 1, 0, 1,
-0.5127537, -1.613808, -2.956875, 0.1803922, 1, 0, 1,
-0.5121908, -0.7304509, -3.46092, 0.1764706, 1, 0, 1,
-0.5117449, -0.4816953, -3.2126, 0.1686275, 1, 0, 1,
-0.5085748, -1.049354, -4.075333, 0.1647059, 1, 0, 1,
-0.5081331, 0.02724047, -1.394763, 0.1568628, 1, 0, 1,
-0.4917802, 2.309707, 0.3152204, 0.1529412, 1, 0, 1,
-0.4903995, -0.7096109, -2.625361, 0.145098, 1, 0, 1,
-0.4898926, 0.6170816, -0.07888825, 0.1411765, 1, 0, 1,
-0.4851075, 1.162548, -1.448027, 0.1333333, 1, 0, 1,
-0.4822811, -1.081899, -2.036276, 0.1294118, 1, 0, 1,
-0.4814149, -0.6779249, -2.117755, 0.1215686, 1, 0, 1,
-0.4768015, -0.08284856, -3.114564, 0.1176471, 1, 0, 1,
-0.4757768, -0.2269304, -2.114708, 0.1098039, 1, 0, 1,
-0.4736736, -1.309874, -4.215265, 0.1058824, 1, 0, 1,
-0.4684129, -0.3137901, -0.174205, 0.09803922, 1, 0, 1,
-0.4650421, -0.8152835, -1.71936, 0.09019608, 1, 0, 1,
-0.4642824, 0.532964, 0.2983764, 0.08627451, 1, 0, 1,
-0.4637163, 1.686416, -0.779592, 0.07843138, 1, 0, 1,
-0.4609863, -0.3779069, -2.736605, 0.07450981, 1, 0, 1,
-0.4552358, -0.8955607, -3.906814, 0.06666667, 1, 0, 1,
-0.4547803, 0.0830133, -0.7823698, 0.0627451, 1, 0, 1,
-0.4537211, -0.3515716, -1.453715, 0.05490196, 1, 0, 1,
-0.4497549, 0.6431676, -0.1309331, 0.05098039, 1, 0, 1,
-0.448425, -0.2302335, -3.198681, 0.04313726, 1, 0, 1,
-0.4477052, 0.5330459, -1.272442, 0.03921569, 1, 0, 1,
-0.4441338, 0.144706, -1.551626, 0.03137255, 1, 0, 1,
-0.4357257, -0.8966151, -2.003156, 0.02745098, 1, 0, 1,
-0.4349649, -0.3245038, -2.455197, 0.01960784, 1, 0, 1,
-0.4317876, 0.1563306, -3.483665, 0.01568628, 1, 0, 1,
-0.4314912, -1.018918, -0.7502908, 0.007843138, 1, 0, 1,
-0.42803, -0.358721, -3.003099, 0.003921569, 1, 0, 1,
-0.4277292, 0.2923236, -1.84737, 0, 1, 0.003921569, 1,
-0.4275917, -1.556773, -1.693702, 0, 1, 0.01176471, 1,
-0.4260889, -1.843822, -4.907706, 0, 1, 0.01568628, 1,
-0.4259786, 0.005477758, -2.44673, 0, 1, 0.02352941, 1,
-0.4207511, -0.1141375, -0.5558951, 0, 1, 0.02745098, 1,
-0.4200956, 0.8691911, 0.1639061, 0, 1, 0.03529412, 1,
-0.415832, -0.2247682, -2.194542, 0, 1, 0.03921569, 1,
-0.4142696, -0.812387, -3.317166, 0, 1, 0.04705882, 1,
-0.4134738, 0.7494145, -0.4663564, 0, 1, 0.05098039, 1,
-0.4057053, -0.0433704, -0.901566, 0, 1, 0.05882353, 1,
-0.4051366, 0.757751, 0.2551366, 0, 1, 0.0627451, 1,
-0.4046893, 0.02468018, -2.623232, 0, 1, 0.07058824, 1,
-0.4004493, -0.7412152, -0.4919781, 0, 1, 0.07450981, 1,
-0.3954232, 0.06287615, 0.8886154, 0, 1, 0.08235294, 1,
-0.3884472, 0.1184578, -0.7200207, 0, 1, 0.08627451, 1,
-0.3855252, 1.691535, -2.459387, 0, 1, 0.09411765, 1,
-0.3835308, 1.624027, -0.9595625, 0, 1, 0.1019608, 1,
-0.3828636, 0.2909311, 0.5821724, 0, 1, 0.1058824, 1,
-0.3811572, 1.601995, -1.341597, 0, 1, 0.1137255, 1,
-0.378832, -0.9518189, -3.687805, 0, 1, 0.1176471, 1,
-0.377094, -0.2897512, -3.682149, 0, 1, 0.1254902, 1,
-0.3746282, 0.03708186, -2.599853, 0, 1, 0.1294118, 1,
-0.3682824, 0.7148954, -0.9089856, 0, 1, 0.1372549, 1,
-0.3681895, -0.1536581, -1.091995, 0, 1, 0.1411765, 1,
-0.3653306, 1.284141, 0.9162117, 0, 1, 0.1490196, 1,
-0.3644097, 0.2321485, -0.6304772, 0, 1, 0.1529412, 1,
-0.3599747, 0.1245106, -2.050339, 0, 1, 0.1607843, 1,
-0.357937, -1.900384, -2.534261, 0, 1, 0.1647059, 1,
-0.3569177, -1.292239, -3.48879, 0, 1, 0.172549, 1,
-0.3542703, -0.2611862, -1.574951, 0, 1, 0.1764706, 1,
-0.3530611, -1.699372, -3.392112, 0, 1, 0.1843137, 1,
-0.3527017, -1.009671, -3.12385, 0, 1, 0.1882353, 1,
-0.3489117, -0.0808045, -2.750335, 0, 1, 0.1960784, 1,
-0.3460591, -1.600903, -3.310997, 0, 1, 0.2039216, 1,
-0.345202, 0.8421978, 1.383003, 0, 1, 0.2078431, 1,
-0.3415882, -2.043698, -3.133396, 0, 1, 0.2156863, 1,
-0.3415553, -0.1220976, -2.779311, 0, 1, 0.2196078, 1,
-0.3405854, -1.665951, -2.527339, 0, 1, 0.227451, 1,
-0.3405653, -0.3055443, -2.697622, 0, 1, 0.2313726, 1,
-0.3381186, -0.4789293, 0.1231979, 0, 1, 0.2392157, 1,
-0.3298504, -0.6451786, -2.31237, 0, 1, 0.2431373, 1,
-0.3263693, 2.049937, 1.172672, 0, 1, 0.2509804, 1,
-0.3188324, -1.496637, -3.433547, 0, 1, 0.254902, 1,
-0.3178013, 0.2923208, -1.317579, 0, 1, 0.2627451, 1,
-0.3165572, 0.2799957, -0.3886313, 0, 1, 0.2666667, 1,
-0.3140478, 2.667116, 0.6617318, 0, 1, 0.2745098, 1,
-0.3075341, -1.695428, -3.464019, 0, 1, 0.2784314, 1,
-0.3057292, 0.6175977, 0.5533961, 0, 1, 0.2862745, 1,
-0.3024054, 0.8942519, -0.3064993, 0, 1, 0.2901961, 1,
-0.2986023, 0.1145543, -1.080989, 0, 1, 0.2980392, 1,
-0.2950429, -0.2871762, -1.171862, 0, 1, 0.3058824, 1,
-0.2914951, -0.3058447, -3.646348, 0, 1, 0.3098039, 1,
-0.2904481, -0.7050105, -1.52383, 0, 1, 0.3176471, 1,
-0.2875816, 0.2419577, -1.426458, 0, 1, 0.3215686, 1,
-0.2846738, -0.7932145, -3.617839, 0, 1, 0.3294118, 1,
-0.2816723, 0.9908472, -0.6753168, 0, 1, 0.3333333, 1,
-0.2800387, -1.8108, -2.219256, 0, 1, 0.3411765, 1,
-0.2761433, 2.02266, -0.02292664, 0, 1, 0.345098, 1,
-0.2746638, -0.634214, -3.636412, 0, 1, 0.3529412, 1,
-0.2708619, 1.705886, -0.8028598, 0, 1, 0.3568628, 1,
-0.2704373, 1.441926, -1.653029, 0, 1, 0.3647059, 1,
-0.2689465, -0.1110948, -2.847452, 0, 1, 0.3686275, 1,
-0.2681873, -1.076994, -1.938717, 0, 1, 0.3764706, 1,
-0.2650636, 1.783311, -0.4003782, 0, 1, 0.3803922, 1,
-0.2633476, 1.133749, -0.9339445, 0, 1, 0.3882353, 1,
-0.2614002, 0.7203896, 1.938399, 0, 1, 0.3921569, 1,
-0.2591329, -0.06845479, -0.9287959, 0, 1, 0.4, 1,
-0.2554632, 1.783064, 1.072364, 0, 1, 0.4078431, 1,
-0.2500609, -0.9147873, -3.395778, 0, 1, 0.4117647, 1,
-0.2479665, 1.36132, 0.7413227, 0, 1, 0.4196078, 1,
-0.2474259, 0.07551823, -1.88319, 0, 1, 0.4235294, 1,
-0.2460062, -1.218379, -4.63699, 0, 1, 0.4313726, 1,
-0.2421108, -1.056212, -3.742695, 0, 1, 0.4352941, 1,
-0.2413488, -0.1532677, -3.686691, 0, 1, 0.4431373, 1,
-0.2320482, -1.751499, -2.429744, 0, 1, 0.4470588, 1,
-0.2311234, -0.06655603, -1.440864, 0, 1, 0.454902, 1,
-0.229951, -1.005108, -4.296237, 0, 1, 0.4588235, 1,
-0.2278623, 0.9611066, 1.133211, 0, 1, 0.4666667, 1,
-0.2276408, 0.5358902, 0.08309258, 0, 1, 0.4705882, 1,
-0.2261021, -0.1735934, -1.539051, 0, 1, 0.4784314, 1,
-0.2237194, 0.4693017, -0.6678176, 0, 1, 0.4823529, 1,
-0.2211635, -0.9401484, -1.317545, 0, 1, 0.4901961, 1,
-0.2163741, 0.1991346, -0.7898355, 0, 1, 0.4941176, 1,
-0.2125242, -1.362557, -2.910818, 0, 1, 0.5019608, 1,
-0.2121172, -0.3364591, -1.979121, 0, 1, 0.509804, 1,
-0.2100386, -0.2151836, -3.35842, 0, 1, 0.5137255, 1,
-0.2061398, -1.347268, -3.628205, 0, 1, 0.5215687, 1,
-0.205354, -2.069548, -3.420128, 0, 1, 0.5254902, 1,
-0.1925334, 1.396148, 0.2479646, 0, 1, 0.5333334, 1,
-0.1920395, -0.6773959, -4.333232, 0, 1, 0.5372549, 1,
-0.1902908, -1.450523, -2.301892, 0, 1, 0.5450981, 1,
-0.1898698, 0.4523276, 1.822463, 0, 1, 0.5490196, 1,
-0.1890706, -0.07801981, -2.290099, 0, 1, 0.5568628, 1,
-0.1818896, 0.6431718, -0.4764187, 0, 1, 0.5607843, 1,
-0.1765754, 2.010717, -1.516241, 0, 1, 0.5686275, 1,
-0.1723537, -0.5404637, -4.27626, 0, 1, 0.572549, 1,
-0.1708815, -0.8352957, -5.066201, 0, 1, 0.5803922, 1,
-0.1657795, -1.784164, -4.335113, 0, 1, 0.5843138, 1,
-0.1644681, -0.7756616, -2.892533, 0, 1, 0.5921569, 1,
-0.1597352, 0.7270751, -1.469758, 0, 1, 0.5960785, 1,
-0.1590158, -0.7350488, -4.807215, 0, 1, 0.6039216, 1,
-0.1521682, -0.7208229, -3.197745, 0, 1, 0.6117647, 1,
-0.1472331, 0.6319351, 0.1254149, 0, 1, 0.6156863, 1,
-0.1457352, -0.5331017, -2.93646, 0, 1, 0.6235294, 1,
-0.1427387, 0.3028196, -0.9562286, 0, 1, 0.627451, 1,
-0.1382535, 0.6144707, -1.155254, 0, 1, 0.6352941, 1,
-0.1378425, -1.110626, -1.177268, 0, 1, 0.6392157, 1,
-0.1369212, -0.5125652, -2.777997, 0, 1, 0.6470588, 1,
-0.1360652, -0.5450789, -2.732496, 0, 1, 0.6509804, 1,
-0.1347, -0.350905, -3.786502, 0, 1, 0.6588235, 1,
-0.1341314, 0.8832428, -0.9421379, 0, 1, 0.6627451, 1,
-0.130894, -0.1821736, -3.635568, 0, 1, 0.6705883, 1,
-0.1290237, -0.1454117, -3.317081, 0, 1, 0.6745098, 1,
-0.1220861, -0.3415768, -1.509679, 0, 1, 0.682353, 1,
-0.1157492, 0.8793909, -0.5533687, 0, 1, 0.6862745, 1,
-0.1117228, -1.669838, -1.240639, 0, 1, 0.6941177, 1,
-0.1032622, 0.8031368, 0.1451331, 0, 1, 0.7019608, 1,
-0.1027879, -1.389664, -4.138733, 0, 1, 0.7058824, 1,
-0.1018541, -0.8802063, -1.427063, 0, 1, 0.7137255, 1,
-0.09890167, -0.02657965, -0.9533039, 0, 1, 0.7176471, 1,
-0.09369165, -0.3455109, -2.738354, 0, 1, 0.7254902, 1,
-0.09325963, 0.0003411397, -2.188162, 0, 1, 0.7294118, 1,
-0.0882661, 0.8568626, 0.2060603, 0, 1, 0.7372549, 1,
-0.0787826, 1.358553, 0.4224776, 0, 1, 0.7411765, 1,
-0.07766684, 0.1321108, 1.274775, 0, 1, 0.7490196, 1,
-0.07417837, -0.1404427, -1.669169, 0, 1, 0.7529412, 1,
-0.07373699, -0.7538468, -3.037096, 0, 1, 0.7607843, 1,
-0.07094359, 0.4758384, 0.2217493, 0, 1, 0.7647059, 1,
-0.06981052, 0.7572642, -1.754191, 0, 1, 0.772549, 1,
-0.06939577, 1.81028, -1.274597, 0, 1, 0.7764706, 1,
-0.06561112, 0.2866126, -0.6362899, 0, 1, 0.7843137, 1,
-0.06541664, 0.3189474, 0.9119338, 0, 1, 0.7882353, 1,
-0.06480883, 0.635932, -2.207934, 0, 1, 0.7960784, 1,
-0.06172936, 0.3143736, -0.9997699, 0, 1, 0.8039216, 1,
-0.0601428, -0.03049704, 0.3243787, 0, 1, 0.8078431, 1,
-0.05855362, -2.06044, -3.266993, 0, 1, 0.8156863, 1,
-0.05794855, 1.102686, 0.4737722, 0, 1, 0.8196079, 1,
-0.05707883, 0.7344087, 0.6002568, 0, 1, 0.827451, 1,
-0.05629712, -0.1655189, -3.434933, 0, 1, 0.8313726, 1,
-0.05564545, 0.9861699, 0.3537594, 0, 1, 0.8392157, 1,
-0.04774006, 0.6026132, -0.3072946, 0, 1, 0.8431373, 1,
-0.04755161, 0.9582944, -0.4081829, 0, 1, 0.8509804, 1,
-0.04397438, -2.162473, -1.590876, 0, 1, 0.854902, 1,
-0.04030281, -1.489126, -1.984513, 0, 1, 0.8627451, 1,
-0.03896156, -1.701213, -2.686954, 0, 1, 0.8666667, 1,
-0.03872498, 2.250837, 0.8811394, 0, 1, 0.8745098, 1,
-0.03685743, 0.8482531, 1.694021, 0, 1, 0.8784314, 1,
-0.03576528, 2.043802, 0.2612089, 0, 1, 0.8862745, 1,
-0.03507065, 0.1208644, 0.9665305, 0, 1, 0.8901961, 1,
-0.02884715, -0.1972687, -3.124007, 0, 1, 0.8980392, 1,
-0.02479401, -0.2779602, -1.791554, 0, 1, 0.9058824, 1,
-0.01831091, 0.5764906, 2.555571, 0, 1, 0.9098039, 1,
-0.01244347, -0.9409986, -4.483531, 0, 1, 0.9176471, 1,
-0.0119579, -0.829607, -2.558951, 0, 1, 0.9215686, 1,
-0.005674416, 0.1845663, -0.6719776, 0, 1, 0.9294118, 1,
-0.000688271, 1.001942, 1.288296, 0, 1, 0.9333333, 1,
-0.0004760344, 1.097296, 1.181628, 0, 1, 0.9411765, 1,
-4.122496e-05, 0.9709392, -0.8954887, 0, 1, 0.945098, 1,
0.003507121, -0.7468512, 3.242708, 0, 1, 0.9529412, 1,
0.005624105, -0.07854034, 4.025292, 0, 1, 0.9568627, 1,
0.005735466, -0.26348, 3.343972, 0, 1, 0.9647059, 1,
0.007277979, 1.232413, 0.1169772, 0, 1, 0.9686275, 1,
0.01013228, -0.02067547, 3.77214, 0, 1, 0.9764706, 1,
0.01156517, -0.2186447, 2.461124, 0, 1, 0.9803922, 1,
0.01180749, 1.260811, -0.5269895, 0, 1, 0.9882353, 1,
0.01323121, 0.5678344, 1.464763, 0, 1, 0.9921569, 1,
0.02178571, 0.2813727, 0.1487057, 0, 1, 1, 1,
0.02321212, 1.378166, 0.8629638, 0, 0.9921569, 1, 1,
0.02670025, 0.05802519, 1.158984, 0, 0.9882353, 1, 1,
0.03568593, -0.1275777, 3.455189, 0, 0.9803922, 1, 1,
0.03875571, -1.188295, 2.538548, 0, 0.9764706, 1, 1,
0.03895946, 2.006416, -0.6608918, 0, 0.9686275, 1, 1,
0.04116944, 1.780388, 0.7861375, 0, 0.9647059, 1, 1,
0.04419674, -0.3570544, 2.354155, 0, 0.9568627, 1, 1,
0.04966353, -0.8913732, 4.22325, 0, 0.9529412, 1, 1,
0.05254807, 1.575269, -0.01335855, 0, 0.945098, 1, 1,
0.05506748, -0.8702937, 3.623976, 0, 0.9411765, 1, 1,
0.05757446, 0.2409863, 0.418164, 0, 0.9333333, 1, 1,
0.06047878, -0.4592137, 1.887796, 0, 0.9294118, 1, 1,
0.06094127, 1.657954, -2.076484, 0, 0.9215686, 1, 1,
0.06460384, -1.430127, 4.482719, 0, 0.9176471, 1, 1,
0.06807938, -0.2420959, 2.654862, 0, 0.9098039, 1, 1,
0.07075041, -0.03392428, 0.2053668, 0, 0.9058824, 1, 1,
0.07451659, -0.03518782, 1.241483, 0, 0.8980392, 1, 1,
0.07876316, 0.9594166, 1.227018, 0, 0.8901961, 1, 1,
0.07878812, -2.85413, 1.851363, 0, 0.8862745, 1, 1,
0.08875386, -1.086163, 3.49236, 0, 0.8784314, 1, 1,
0.09363855, 0.005035608, 1.187434, 0, 0.8745098, 1, 1,
0.09946977, 0.9073846, 0.733098, 0, 0.8666667, 1, 1,
0.1002961, 0.2698167, 0.1641498, 0, 0.8627451, 1, 1,
0.100941, 0.1235906, -1.109357, 0, 0.854902, 1, 1,
0.1041562, -0.6396397, 2.147723, 0, 0.8509804, 1, 1,
0.1094705, 0.4206145, -0.8940729, 0, 0.8431373, 1, 1,
0.1106371, -1.944202, 2.660708, 0, 0.8392157, 1, 1,
0.1134269, -0.5194128, 2.581912, 0, 0.8313726, 1, 1,
0.1228441, -0.3612176, 2.632312, 0, 0.827451, 1, 1,
0.1247296, 0.7207932, -0.8774422, 0, 0.8196079, 1, 1,
0.1262162, -0.02251226, 1.318636, 0, 0.8156863, 1, 1,
0.1291742, 0.8460875, 0.05172039, 0, 0.8078431, 1, 1,
0.1303923, -0.0627996, 2.442452, 0, 0.8039216, 1, 1,
0.132294, -0.03604734, 0.7239338, 0, 0.7960784, 1, 1,
0.1329212, -1.494031, 4.726306, 0, 0.7882353, 1, 1,
0.1357125, -0.05868246, 0.1041661, 0, 0.7843137, 1, 1,
0.1379972, 0.5018306, -0.101106, 0, 0.7764706, 1, 1,
0.140509, 1.29421, 0.5082064, 0, 0.772549, 1, 1,
0.1411152, -0.4990326, 0.3959461, 0, 0.7647059, 1, 1,
0.1423158, -0.9307498, 2.032762, 0, 0.7607843, 1, 1,
0.1471888, 0.0007244232, 1.185368, 0, 0.7529412, 1, 1,
0.1504181, -1.771573, 3.668357, 0, 0.7490196, 1, 1,
0.1518749, 0.137498, 1.295409, 0, 0.7411765, 1, 1,
0.1538647, -0.1862875, 3.240464, 0, 0.7372549, 1, 1,
0.1541821, -1.190381, 1.362791, 0, 0.7294118, 1, 1,
0.165115, -0.2533917, 0.5347346, 0, 0.7254902, 1, 1,
0.1652737, 1.846862, -0.8494185, 0, 0.7176471, 1, 1,
0.1657739, -1.194664, 1.997199, 0, 0.7137255, 1, 1,
0.1663315, -0.1787563, 2.375981, 0, 0.7058824, 1, 1,
0.1679224, 0.04550207, 0.09191843, 0, 0.6980392, 1, 1,
0.1695943, 2.538763, -0.3165925, 0, 0.6941177, 1, 1,
0.1707268, 1.457051, 0.1854619, 0, 0.6862745, 1, 1,
0.1736273, 0.4958477, -0.821498, 0, 0.682353, 1, 1,
0.1741484, -1.222674, 2.412123, 0, 0.6745098, 1, 1,
0.176083, 0.6183358, -0.1657933, 0, 0.6705883, 1, 1,
0.1767983, -0.6996815, 3.247256, 0, 0.6627451, 1, 1,
0.1768463, 1.384098, 1.558695, 0, 0.6588235, 1, 1,
0.1771127, -0.3171227, 1.749653, 0, 0.6509804, 1, 1,
0.1790508, 0.1599469, 2.1069, 0, 0.6470588, 1, 1,
0.1798745, -1.397522, 4.050788, 0, 0.6392157, 1, 1,
0.1803238, 0.833115, -0.4417703, 0, 0.6352941, 1, 1,
0.1826327, -1.538984, 3.249886, 0, 0.627451, 1, 1,
0.1935674, -0.0939552, 1.247027, 0, 0.6235294, 1, 1,
0.1949352, -0.02176571, 1.738413, 0, 0.6156863, 1, 1,
0.1983321, 1.741251, 0.05319484, 0, 0.6117647, 1, 1,
0.1987842, 0.4327397, 0.8528565, 0, 0.6039216, 1, 1,
0.2027597, 0.536219, 0.3177127, 0, 0.5960785, 1, 1,
0.2029931, -0.2306215, 2.255323, 0, 0.5921569, 1, 1,
0.2032122, -1.308426, 3.39925, 0, 0.5843138, 1, 1,
0.2034072, 1.58876, -0.419157, 0, 0.5803922, 1, 1,
0.204276, -0.3898346, 1.259868, 0, 0.572549, 1, 1,
0.2068304, 0.09109861, 1.217527, 0, 0.5686275, 1, 1,
0.2096391, -0.9913258, 2.492342, 0, 0.5607843, 1, 1,
0.2144596, -0.4271702, 5.112873, 0, 0.5568628, 1, 1,
0.2210004, 2.030898, 0.2712018, 0, 0.5490196, 1, 1,
0.2241251, 1.259246, 0.05440916, 0, 0.5450981, 1, 1,
0.2258107, 0.7320716, 0.2211076, 0, 0.5372549, 1, 1,
0.2263427, -1.048774, 4.601601, 0, 0.5333334, 1, 1,
0.2272921, 0.4731628, 2.188579, 0, 0.5254902, 1, 1,
0.2334628, -0.4360432, 2.519137, 0, 0.5215687, 1, 1,
0.2410818, -1.211034, 3.091749, 0, 0.5137255, 1, 1,
0.2446429, -1.070074, 1.966671, 0, 0.509804, 1, 1,
0.2447151, -1.638237, 2.531159, 0, 0.5019608, 1, 1,
0.2454352, -0.3221498, 2.758909, 0, 0.4941176, 1, 1,
0.2480414, 0.8576201, 0.3876754, 0, 0.4901961, 1, 1,
0.2512576, -0.7688522, 2.39217, 0, 0.4823529, 1, 1,
0.2539188, 0.04951757, 1.465434, 0, 0.4784314, 1, 1,
0.2542259, 0.7978035, -1.33579, 0, 0.4705882, 1, 1,
0.2543219, -0.2969636, 2.004808, 0, 0.4666667, 1, 1,
0.2688541, 1.141551, 0.5857021, 0, 0.4588235, 1, 1,
0.2701594, 0.09967484, -0.1927482, 0, 0.454902, 1, 1,
0.2738928, 1.469596, -1.803303, 0, 0.4470588, 1, 1,
0.2754321, 0.7742306, -0.5247068, 0, 0.4431373, 1, 1,
0.2758117, 0.5359682, 1.519352, 0, 0.4352941, 1, 1,
0.2763298, 2.005509, -0.02578788, 0, 0.4313726, 1, 1,
0.2779675, -1.74471, 4.277462, 0, 0.4235294, 1, 1,
0.2827213, -0.2926127, 1.746584, 0, 0.4196078, 1, 1,
0.2857484, 0.9006701, -1.468663, 0, 0.4117647, 1, 1,
0.2940553, -1.271255, 1.620969, 0, 0.4078431, 1, 1,
0.298207, 0.984906, 0.9936417, 0, 0.4, 1, 1,
0.2995043, 0.355539, 0.8288894, 0, 0.3921569, 1, 1,
0.301146, 0.2476734, 1.856664, 0, 0.3882353, 1, 1,
0.3029059, 0.7743844, 0.6856479, 0, 0.3803922, 1, 1,
0.3031166, 0.4915999, 0.3226156, 0, 0.3764706, 1, 1,
0.3044738, 2.250453, 1.41722, 0, 0.3686275, 1, 1,
0.3064404, -0.7914184, 3.138189, 0, 0.3647059, 1, 1,
0.3096805, 0.5702505, 0.2013449, 0, 0.3568628, 1, 1,
0.3101241, 1.605903, 1.424155, 0, 0.3529412, 1, 1,
0.3171027, 0.2906777, 1.575345, 0, 0.345098, 1, 1,
0.3194791, 2.617707, 0.7479806, 0, 0.3411765, 1, 1,
0.3231274, 0.3854168, 2.377248, 0, 0.3333333, 1, 1,
0.3233906, -1.405354, 3.990654, 0, 0.3294118, 1, 1,
0.3248352, -1.314951, 1.756334, 0, 0.3215686, 1, 1,
0.3260083, -0.08338799, 1.878678, 0, 0.3176471, 1, 1,
0.3269444, 1.967501, 0.08066135, 0, 0.3098039, 1, 1,
0.3331575, 1.197359, -0.4359511, 0, 0.3058824, 1, 1,
0.3360931, 0.339217, 1.623584, 0, 0.2980392, 1, 1,
0.3380455, 2.470178, 1.680448, 0, 0.2901961, 1, 1,
0.3453029, 0.5337673, 0.3333246, 0, 0.2862745, 1, 1,
0.3453483, 0.2809392, 1.60315, 0, 0.2784314, 1, 1,
0.3500832, -0.01358493, 1.080038, 0, 0.2745098, 1, 1,
0.3515914, 0.6164098, 1.027677, 0, 0.2666667, 1, 1,
0.3522484, 0.3634456, 1.660246, 0, 0.2627451, 1, 1,
0.3525113, -0.176147, 1.267213, 0, 0.254902, 1, 1,
0.3544131, -0.09649765, 1.136454, 0, 0.2509804, 1, 1,
0.3552034, 1.231279, -0.9849551, 0, 0.2431373, 1, 1,
0.3565046, -0.1716716, 0.4035656, 0, 0.2392157, 1, 1,
0.3594719, 0.1940187, -0.0738896, 0, 0.2313726, 1, 1,
0.3614994, 2.102303, -1.181647, 0, 0.227451, 1, 1,
0.3632074, 1.185254, 0.1246516, 0, 0.2196078, 1, 1,
0.3655277, 1.222341, 0.1915837, 0, 0.2156863, 1, 1,
0.3660709, 0.8921071, 0.6426359, 0, 0.2078431, 1, 1,
0.3673427, -0.43551, 3.692252, 0, 0.2039216, 1, 1,
0.3697424, -1.234942, 3.298035, 0, 0.1960784, 1, 1,
0.3699152, -0.5247067, 1.190794, 0, 0.1882353, 1, 1,
0.3709576, -1.034641, 2.003087, 0, 0.1843137, 1, 1,
0.377672, 0.7506389, -0.4117511, 0, 0.1764706, 1, 1,
0.3785131, -0.1247853, 2.128981, 0, 0.172549, 1, 1,
0.3801964, 0.6514922, 1.044128, 0, 0.1647059, 1, 1,
0.3865796, 0.6776191, 1.943407, 0, 0.1607843, 1, 1,
0.3880462, 0.3520077, 1.668942, 0, 0.1529412, 1, 1,
0.3938176, 1.050815, -1.280601, 0, 0.1490196, 1, 1,
0.3940445, -1.520735, 2.817465, 0, 0.1411765, 1, 1,
0.396365, 1.655805, -1.522356, 0, 0.1372549, 1, 1,
0.4009145, 0.9632322, 2.163407, 0, 0.1294118, 1, 1,
0.4038979, -0.7995852, 2.458462, 0, 0.1254902, 1, 1,
0.4060005, -1.0014, 1.440236, 0, 0.1176471, 1, 1,
0.4075691, -0.3112954, 1.747777, 0, 0.1137255, 1, 1,
0.4114853, -1.596027, 3.705367, 0, 0.1058824, 1, 1,
0.417304, 1.485508, -2.575567, 0, 0.09803922, 1, 1,
0.4226793, -0.06870805, 0.6191407, 0, 0.09411765, 1, 1,
0.424207, 0.364962, 1.713511, 0, 0.08627451, 1, 1,
0.4255966, -1.948567, 2.558674, 0, 0.08235294, 1, 1,
0.4312972, 0.1138519, 0.8713169, 0, 0.07450981, 1, 1,
0.4314858, -0.5867881, 3.333098, 0, 0.07058824, 1, 1,
0.4489892, -3.345192, 4.548001, 0, 0.0627451, 1, 1,
0.4565563, 0.3918912, 0.3551022, 0, 0.05882353, 1, 1,
0.4576735, 0.2094907, 2.151322, 0, 0.05098039, 1, 1,
0.4585658, -0.549343, 1.10815, 0, 0.04705882, 1, 1,
0.4589416, -0.6399421, 2.375853, 0, 0.03921569, 1, 1,
0.4594505, 0.31155, 1.467821, 0, 0.03529412, 1, 1,
0.4691547, -0.792586, 2.43554, 0, 0.02745098, 1, 1,
0.4700879, 1.253607, 2.063181, 0, 0.02352941, 1, 1,
0.4762071, -0.932079, 4.323655, 0, 0.01568628, 1, 1,
0.476397, -0.7417121, 2.289819, 0, 0.01176471, 1, 1,
0.4785872, 0.7105905, 0.2510323, 0, 0.003921569, 1, 1,
0.4795986, -1.130303, 1.594165, 0.003921569, 0, 1, 1,
0.4798378, 1.137352, -0.2603843, 0.007843138, 0, 1, 1,
0.4830821, 0.5885692, 1.188517, 0.01568628, 0, 1, 1,
0.4838501, 0.1053196, 0.8012472, 0.01960784, 0, 1, 1,
0.4841868, 1.747675, -1.863849, 0.02745098, 0, 1, 1,
0.4843543, 0.85711, -0.284293, 0.03137255, 0, 1, 1,
0.485965, -0.06434834, 1.734083, 0.03921569, 0, 1, 1,
0.4886514, -0.4114628, 2.233593, 0.04313726, 0, 1, 1,
0.4922913, 0.3152608, -0.3445507, 0.05098039, 0, 1, 1,
0.4979636, -0.3591912, 3.85778, 0.05490196, 0, 1, 1,
0.4986014, -0.542616, 1.107246, 0.0627451, 0, 1, 1,
0.4990638, -0.2549012, 1.089072, 0.06666667, 0, 1, 1,
0.4993884, 0.6893443, 1.680139, 0.07450981, 0, 1, 1,
0.5001929, 0.4253982, 3.090179, 0.07843138, 0, 1, 1,
0.5002671, 0.6224704, -0.4924, 0.08627451, 0, 1, 1,
0.5023245, 0.1142331, 3.312698, 0.09019608, 0, 1, 1,
0.5024165, -0.349957, 2.725534, 0.09803922, 0, 1, 1,
0.5115638, 0.296789, 0.4636001, 0.1058824, 0, 1, 1,
0.5152896, -0.136539, 0.6858835, 0.1098039, 0, 1, 1,
0.5179391, -0.5371715, 1.947208, 0.1176471, 0, 1, 1,
0.5196943, -0.4225138, 1.25184, 0.1215686, 0, 1, 1,
0.5236789, -0.4338822, 2.863655, 0.1294118, 0, 1, 1,
0.5272207, 2.295153, -0.4141675, 0.1333333, 0, 1, 1,
0.5300096, 0.8311094, -0.3041397, 0.1411765, 0, 1, 1,
0.5302408, -0.4192067, 2.286983, 0.145098, 0, 1, 1,
0.5336002, 0.2784908, 1.424886, 0.1529412, 0, 1, 1,
0.5354004, 1.097101, 1.506865, 0.1568628, 0, 1, 1,
0.5396354, -0.9056781, 2.815776, 0.1647059, 0, 1, 1,
0.5413324, -0.1315037, 2.284561, 0.1686275, 0, 1, 1,
0.5419251, -0.3175453, 1.680685, 0.1764706, 0, 1, 1,
0.5422853, -1.743473, 1.916789, 0.1803922, 0, 1, 1,
0.5452154, -0.4501874, 2.818146, 0.1882353, 0, 1, 1,
0.5457986, -0.4394889, 0.4177804, 0.1921569, 0, 1, 1,
0.5462891, 1.145951, -0.5092244, 0.2, 0, 1, 1,
0.5463392, -1.941081, 3.709381, 0.2078431, 0, 1, 1,
0.551076, -1.263127, 3.781261, 0.2117647, 0, 1, 1,
0.5514513, -1.212925, 3.348641, 0.2196078, 0, 1, 1,
0.5538064, -1.298511, 2.576705, 0.2235294, 0, 1, 1,
0.5629733, 0.3870391, 0.3981015, 0.2313726, 0, 1, 1,
0.566031, -1.138447, 3.304662, 0.2352941, 0, 1, 1,
0.5661629, -0.6753965, 1.74909, 0.2431373, 0, 1, 1,
0.5693861, 0.4495331, 1.189369, 0.2470588, 0, 1, 1,
0.5713208, 0.8710643, 0.0169412, 0.254902, 0, 1, 1,
0.5763907, 0.6004941, 2.451264, 0.2588235, 0, 1, 1,
0.5799426, -1.069226, 2.801404, 0.2666667, 0, 1, 1,
0.581288, 0.5219806, 2.073627, 0.2705882, 0, 1, 1,
0.5836934, 0.05860886, 1.085477, 0.2784314, 0, 1, 1,
0.5852746, -1.540508, 2.98601, 0.282353, 0, 1, 1,
0.5889221, -0.8134135, 1.185794, 0.2901961, 0, 1, 1,
0.5903813, -0.5228519, 3.747152, 0.2941177, 0, 1, 1,
0.5983286, 0.4931308, -0.4721352, 0.3019608, 0, 1, 1,
0.6002135, 0.04356012, 0.6123594, 0.3098039, 0, 1, 1,
0.6015261, -1.748284, 2.650213, 0.3137255, 0, 1, 1,
0.6072152, -0.3596125, 3.491912, 0.3215686, 0, 1, 1,
0.6143087, 1.282477, -0.7750936, 0.3254902, 0, 1, 1,
0.6201297, -1.278754, 3.319077, 0.3333333, 0, 1, 1,
0.6243327, 0.1995655, 0.9691378, 0.3372549, 0, 1, 1,
0.6252801, 0.9651533, 1.673527, 0.345098, 0, 1, 1,
0.6255129, -0.2187082, 0.3500746, 0.3490196, 0, 1, 1,
0.6372018, -0.0462302, 1.89651, 0.3568628, 0, 1, 1,
0.6424304, 1.063774, 0.8485784, 0.3607843, 0, 1, 1,
0.6514391, 0.7927819, -0.2918794, 0.3686275, 0, 1, 1,
0.652983, 1.264124, 1.126786, 0.372549, 0, 1, 1,
0.6554609, -0.7870491, 3.877334, 0.3803922, 0, 1, 1,
0.6605664, -0.1892267, 3.86069, 0.3843137, 0, 1, 1,
0.6639665, -0.914664, 3.107184, 0.3921569, 0, 1, 1,
0.6744261, 0.052985, 1.911771, 0.3960784, 0, 1, 1,
0.679037, 0.1907439, -0.003274193, 0.4039216, 0, 1, 1,
0.6823996, -0.4600141, 3.809999, 0.4117647, 0, 1, 1,
0.6869835, 0.1751927, -0.5074763, 0.4156863, 0, 1, 1,
0.6896091, 0.4290671, 1.883742, 0.4235294, 0, 1, 1,
0.6900541, 0.8680742, 0.08512907, 0.427451, 0, 1, 1,
0.6960586, 1.052383, 0.4882747, 0.4352941, 0, 1, 1,
0.6982962, -0.3985295, 1.364411, 0.4392157, 0, 1, 1,
0.6986586, 0.5620418, 0.4700105, 0.4470588, 0, 1, 1,
0.6997923, 0.1195643, 1.724863, 0.4509804, 0, 1, 1,
0.7001035, 0.5807652, 0.765304, 0.4588235, 0, 1, 1,
0.7003315, -0.21749, 2.797942, 0.4627451, 0, 1, 1,
0.7021288, -1.128415, 2.096543, 0.4705882, 0, 1, 1,
0.7082533, 0.6059789, 0.4583899, 0.4745098, 0, 1, 1,
0.7087086, -1.26869, 2.484783, 0.4823529, 0, 1, 1,
0.7090118, 1.091351, 0.8624392, 0.4862745, 0, 1, 1,
0.712769, 0.76628, 0.7964782, 0.4941176, 0, 1, 1,
0.7206411, 0.05583843, 0.5706464, 0.5019608, 0, 1, 1,
0.7352251, 1.29143, -0.9781107, 0.5058824, 0, 1, 1,
0.7362263, 0.345628, 0.4414293, 0.5137255, 0, 1, 1,
0.7412163, 0.9215022, -0.358337, 0.5176471, 0, 1, 1,
0.7424325, -1.076971, 0.6976942, 0.5254902, 0, 1, 1,
0.7425843, 0.3603068, 2.610129, 0.5294118, 0, 1, 1,
0.7463278, 0.8851185, 0.562745, 0.5372549, 0, 1, 1,
0.7490661, 0.6833488, -0.06230401, 0.5411765, 0, 1, 1,
0.7497617, 1.200068, 0.6575716, 0.5490196, 0, 1, 1,
0.752292, 1.540674, 0.923599, 0.5529412, 0, 1, 1,
0.7530759, -0.626832, 3.152303, 0.5607843, 0, 1, 1,
0.7557208, -0.5392333, 1.698649, 0.5647059, 0, 1, 1,
0.7590045, 0.9555655, 1.056607, 0.572549, 0, 1, 1,
0.7593407, -0.4412999, 1.803829, 0.5764706, 0, 1, 1,
0.7616736, -0.4184224, 2.194254, 0.5843138, 0, 1, 1,
0.7756549, -0.3191709, 2.804856, 0.5882353, 0, 1, 1,
0.777878, -1.761271, 3.13675, 0.5960785, 0, 1, 1,
0.7794964, 1.431708, 2.818216, 0.6039216, 0, 1, 1,
0.7806674, 1.155593, 0.5649263, 0.6078432, 0, 1, 1,
0.7818931, -0.7997297, 0.8115821, 0.6156863, 0, 1, 1,
0.7861108, -0.904176, 2.035687, 0.6196079, 0, 1, 1,
0.7874492, 0.1070796, 1.133806, 0.627451, 0, 1, 1,
0.7895752, 0.714916, 2.891874, 0.6313726, 0, 1, 1,
0.7908211, -0.9733722, 5.931173, 0.6392157, 0, 1, 1,
0.7913336, -0.07501463, 1.984055, 0.6431373, 0, 1, 1,
0.7922204, 0.04424521, 2.542653, 0.6509804, 0, 1, 1,
0.7943448, 0.233034, 0.954683, 0.654902, 0, 1, 1,
0.8008833, -0.9776114, 1.90427, 0.6627451, 0, 1, 1,
0.8008979, -2.090198, 2.054079, 0.6666667, 0, 1, 1,
0.807879, 1.765629, -0.1492, 0.6745098, 0, 1, 1,
0.8112167, -0.8151864, 2.196707, 0.6784314, 0, 1, 1,
0.8116407, 0.5577397, -0.4688918, 0.6862745, 0, 1, 1,
0.8137528, 0.3920344, 1.062927, 0.6901961, 0, 1, 1,
0.817022, -1.37873, 3.448474, 0.6980392, 0, 1, 1,
0.8176803, -0.986051, 3.454228, 0.7058824, 0, 1, 1,
0.8194612, -0.8515062, 2.101757, 0.7098039, 0, 1, 1,
0.8206725, -0.5596687, 4.295959, 0.7176471, 0, 1, 1,
0.8223056, -1.603669, 1.918361, 0.7215686, 0, 1, 1,
0.825979, 0.3860829, 1.599028, 0.7294118, 0, 1, 1,
0.8461012, 0.1655237, 2.065807, 0.7333333, 0, 1, 1,
0.8461027, -0.8377035, 2.525387, 0.7411765, 0, 1, 1,
0.8483485, 0.9135512, -0.3570012, 0.7450981, 0, 1, 1,
0.8490497, 1.190974, 0.5601649, 0.7529412, 0, 1, 1,
0.8501851, -1.747304, 3.321382, 0.7568628, 0, 1, 1,
0.851629, -1.543826, 2.773978, 0.7647059, 0, 1, 1,
0.8519866, 1.081411, 0.5031957, 0.7686275, 0, 1, 1,
0.8540852, -0.81372, 1.334862, 0.7764706, 0, 1, 1,
0.8584727, 0.1541564, 1.705421, 0.7803922, 0, 1, 1,
0.8596392, 0.05401886, -0.7257569, 0.7882353, 0, 1, 1,
0.8603321, -0.02165748, 0.9584679, 0.7921569, 0, 1, 1,
0.8690468, -0.5132049, 1.199139, 0.8, 0, 1, 1,
0.8736483, 1.782176, 0.6267784, 0.8078431, 0, 1, 1,
0.8821573, -0.2201722, 0.9415448, 0.8117647, 0, 1, 1,
0.8863505, 0.9059272, -0.4010633, 0.8196079, 0, 1, 1,
0.8908505, -0.2296966, 2.181519, 0.8235294, 0, 1, 1,
0.899792, 0.4251165, 0.4794022, 0.8313726, 0, 1, 1,
0.9010606, -0.04022355, 1.807281, 0.8352941, 0, 1, 1,
0.9130828, 0.1120935, 1.572999, 0.8431373, 0, 1, 1,
0.9164227, 1.252818, -0.5226615, 0.8470588, 0, 1, 1,
0.9172598, 0.5713778, 1.551698, 0.854902, 0, 1, 1,
0.928597, 0.9821035, 0.477165, 0.8588235, 0, 1, 1,
0.9323349, 0.4734964, -0.05947033, 0.8666667, 0, 1, 1,
0.9338933, 0.05247293, 1.97413, 0.8705882, 0, 1, 1,
0.9404301, 0.2877692, 0.5704014, 0.8784314, 0, 1, 1,
0.941426, -0.6744646, 0.8006304, 0.8823529, 0, 1, 1,
0.9447588, 1.703241, 0.8807955, 0.8901961, 0, 1, 1,
0.945304, -0.8087114, 2.270417, 0.8941177, 0, 1, 1,
0.9470559, 1.628237, 0.8881285, 0.9019608, 0, 1, 1,
0.9517283, -0.2872384, 1.551788, 0.9098039, 0, 1, 1,
0.9587308, 1.356126, 0.376467, 0.9137255, 0, 1, 1,
0.9672473, 0.0838652, 0.6529842, 0.9215686, 0, 1, 1,
0.9710969, -0.9986351, 2.186951, 0.9254902, 0, 1, 1,
0.9900733, 0.1141689, 1.160092, 0.9333333, 0, 1, 1,
0.9984198, 1.39693, 0.1826226, 0.9372549, 0, 1, 1,
1.002842, 0.2081462, 0.5557317, 0.945098, 0, 1, 1,
1.009488, 0.7938712, 0.05641495, 0.9490196, 0, 1, 1,
1.010409, 0.2537404, 1.19616, 0.9568627, 0, 1, 1,
1.018917, -0.1230144, 2.241254, 0.9607843, 0, 1, 1,
1.019137, -0.8187426, 4.068894, 0.9686275, 0, 1, 1,
1.021404, 1.556037, 2.31322, 0.972549, 0, 1, 1,
1.02392, 0.7775543, 2.383445, 0.9803922, 0, 1, 1,
1.02836, -0.507776, 2.367746, 0.9843137, 0, 1, 1,
1.03892, 1.231462, 1.407571, 0.9921569, 0, 1, 1,
1.039132, 0.4571706, 2.195875, 0.9960784, 0, 1, 1,
1.039757, 0.7564847, 1.443715, 1, 0, 0.9960784, 1,
1.044755, -0.1464621, 1.581215, 1, 0, 0.9882353, 1,
1.04935, 0.7887627, 1.609273, 1, 0, 0.9843137, 1,
1.051965, 0.3223738, 1.750501, 1, 0, 0.9764706, 1,
1.063491, -0.8755974, 1.127258, 1, 0, 0.972549, 1,
1.064764, 0.3326635, 1.579983, 1, 0, 0.9647059, 1,
1.067405, 0.4621608, 2.071197, 1, 0, 0.9607843, 1,
1.080673, -0.05907265, 1.375499, 1, 0, 0.9529412, 1,
1.08809, 0.3662827, 0.2659215, 1, 0, 0.9490196, 1,
1.094328, -0.6314252, 1.549246, 1, 0, 0.9411765, 1,
1.097033, -0.05628791, 2.939382, 1, 0, 0.9372549, 1,
1.101945, -0.2562731, 0.2717491, 1, 0, 0.9294118, 1,
1.107729, 0.3838843, 2.107128, 1, 0, 0.9254902, 1,
1.107837, 0.3629765, 2.432065, 1, 0, 0.9176471, 1,
1.110858, 2.996042, -0.06495098, 1, 0, 0.9137255, 1,
1.113827, -1.392012, 1.932052, 1, 0, 0.9058824, 1,
1.114886, -0.8040833, 1.853261, 1, 0, 0.9019608, 1,
1.122413, -0.7093866, 2.697846, 1, 0, 0.8941177, 1,
1.127536, -1.35381, 1.69993, 1, 0, 0.8862745, 1,
1.134566, -0.604003, 2.217416, 1, 0, 0.8823529, 1,
1.139135, 1.061243, 0.9362773, 1, 0, 0.8745098, 1,
1.140127, 1.539554, 1.086696, 1, 0, 0.8705882, 1,
1.14324, 0.7478926, 0.5065164, 1, 0, 0.8627451, 1,
1.145209, -1.215917, 2.139319, 1, 0, 0.8588235, 1,
1.145311, 0.05830869, 1.083985, 1, 0, 0.8509804, 1,
1.146743, 0.2251818, 1.002019, 1, 0, 0.8470588, 1,
1.151115, 1.919091, -0.0001606394, 1, 0, 0.8392157, 1,
1.151884, 0.2905848, 1.866275, 1, 0, 0.8352941, 1,
1.169233, 1.173339, 1.590175, 1, 0, 0.827451, 1,
1.170244, -1.930729, 0.1915208, 1, 0, 0.8235294, 1,
1.172545, -0.5832793, 1.847691, 1, 0, 0.8156863, 1,
1.179328, 2.082486, 2.085123, 1, 0, 0.8117647, 1,
1.180805, 0.3157751, 0.7110755, 1, 0, 0.8039216, 1,
1.19086, 0.003783928, 2.429212, 1, 0, 0.7960784, 1,
1.195016, -0.9199651, -0.7423802, 1, 0, 0.7921569, 1,
1.198983, 0.8147646, 1.894181, 1, 0, 0.7843137, 1,
1.201154, 1.30106, 2.694698, 1, 0, 0.7803922, 1,
1.205827, 0.8628507, 3.315091, 1, 0, 0.772549, 1,
1.209659, 0.1063433, 1.679289, 1, 0, 0.7686275, 1,
1.210797, -1.181846, 2.562162, 1, 0, 0.7607843, 1,
1.219556, -0.1444548, 1.048849, 1, 0, 0.7568628, 1,
1.230854, -0.9215554, 2.466552, 1, 0, 0.7490196, 1,
1.2374, 0.9064775, 0.08428796, 1, 0, 0.7450981, 1,
1.238654, 1.045204, 1.517726, 1, 0, 0.7372549, 1,
1.246567, -1.376141, 2.017561, 1, 0, 0.7333333, 1,
1.248096, -1.230694, 3.993824, 1, 0, 0.7254902, 1,
1.248621, 1.038749, 0.506449, 1, 0, 0.7215686, 1,
1.256502, 0.7251813, 1.45125, 1, 0, 0.7137255, 1,
1.272816, -0.8609365, 1.989376, 1, 0, 0.7098039, 1,
1.286321, -0.5223866, 4.536357, 1, 0, 0.7019608, 1,
1.297128, 0.8165271, 1.81632, 1, 0, 0.6941177, 1,
1.312107, 0.6808958, 1.513493, 1, 0, 0.6901961, 1,
1.31211, -2.332151, 2.470017, 1, 0, 0.682353, 1,
1.313772, -0.7798122, 3.504842, 1, 0, 0.6784314, 1,
1.316466, -0.815959, 1.752698, 1, 0, 0.6705883, 1,
1.321462, 0.7704809, 1.550909, 1, 0, 0.6666667, 1,
1.323351, -1.042592, 1.915233, 1, 0, 0.6588235, 1,
1.325131, 0.3029546, 1.364941, 1, 0, 0.654902, 1,
1.32648, -0.4323056, 2.22189, 1, 0, 0.6470588, 1,
1.333281, -0.5779485, 3.252922, 1, 0, 0.6431373, 1,
1.336516, -0.1445294, 2.571702, 1, 0, 0.6352941, 1,
1.342901, 2.160396, 1.763273, 1, 0, 0.6313726, 1,
1.34712, -0.7466552, 1.429773, 1, 0, 0.6235294, 1,
1.362079, 1.469796, 0.530938, 1, 0, 0.6196079, 1,
1.364492, 0.2895877, 1.268703, 1, 0, 0.6117647, 1,
1.371774, -0.1501576, 1.701409, 1, 0, 0.6078432, 1,
1.374691, -1.199219, 4.61553, 1, 0, 0.6, 1,
1.37869, 0.680539, 1.984748, 1, 0, 0.5921569, 1,
1.380339, 0.2146599, 0.9076871, 1, 0, 0.5882353, 1,
1.390481, 0.2443961, 3.372773, 1, 0, 0.5803922, 1,
1.392728, 0.4048991, 1.120716, 1, 0, 0.5764706, 1,
1.406208, 2.335116, 1.743474, 1, 0, 0.5686275, 1,
1.409213, 1.079156, 2.140211, 1, 0, 0.5647059, 1,
1.414629, 0.6535445, -1.288591, 1, 0, 0.5568628, 1,
1.415118, 0.5495887, 3.321826, 1, 0, 0.5529412, 1,
1.423529, 0.5920299, 0.9087043, 1, 0, 0.5450981, 1,
1.425832, 0.5527481, 2.748154, 1, 0, 0.5411765, 1,
1.449492, 0.1562491, 1.445747, 1, 0, 0.5333334, 1,
1.451063, 0.09937239, 1.753312, 1, 0, 0.5294118, 1,
1.460155, -0.6896034, 2.591127, 1, 0, 0.5215687, 1,
1.462346, 0.0951986, 2.030595, 1, 0, 0.5176471, 1,
1.466123, -0.4899408, 1.600863, 1, 0, 0.509804, 1,
1.473111, 0.591466, 1.261134, 1, 0, 0.5058824, 1,
1.490733, -0.06521965, 2.64029, 1, 0, 0.4980392, 1,
1.508667, -0.1954357, 1.234293, 1, 0, 0.4901961, 1,
1.517089, 0.3909108, 0.6942037, 1, 0, 0.4862745, 1,
1.520957, 1.669251, 2.2123, 1, 0, 0.4784314, 1,
1.531435, 1.12612, 0.6202987, 1, 0, 0.4745098, 1,
1.53758, -0.9326674, 3.385918, 1, 0, 0.4666667, 1,
1.544418, 1.290889, 2.4151, 1, 0, 0.4627451, 1,
1.547661, 1.900884, 1.238584, 1, 0, 0.454902, 1,
1.557416, 0.8145503, 1.598919, 1, 0, 0.4509804, 1,
1.560279, 0.007882142, 1.094309, 1, 0, 0.4431373, 1,
1.568282, -0.2416753, 2.438707, 1, 0, 0.4392157, 1,
1.569337, -0.6395575, 3.480428, 1, 0, 0.4313726, 1,
1.573785, 2.341118, 0.5263731, 1, 0, 0.427451, 1,
1.590311, -1.495226, 0.6460128, 1, 0, 0.4196078, 1,
1.599603, 0.6025553, 1.95953, 1, 0, 0.4156863, 1,
1.610094, 1.335615, 0.1883659, 1, 0, 0.4078431, 1,
1.615436, 0.9239827, -0.348251, 1, 0, 0.4039216, 1,
1.621873, -0.850779, 3.603339, 1, 0, 0.3960784, 1,
1.628047, 0.5352927, 2.190033, 1, 0, 0.3882353, 1,
1.641393, 0.498594, 0.497541, 1, 0, 0.3843137, 1,
1.652337, -0.2702187, 2.019182, 1, 0, 0.3764706, 1,
1.672449, 1.494136, 1.755699, 1, 0, 0.372549, 1,
1.673887, 0.8174576, 1.548376, 1, 0, 0.3647059, 1,
1.67842, 2.176237, 1.144441, 1, 0, 0.3607843, 1,
1.713636, -0.07380301, 2.692645, 1, 0, 0.3529412, 1,
1.72455, 0.3267793, 0.4668249, 1, 0, 0.3490196, 1,
1.735176, -0.9853904, 1.463158, 1, 0, 0.3411765, 1,
1.736357, 0.311839, 1.595324, 1, 0, 0.3372549, 1,
1.742272, -1.259513, 3.551925, 1, 0, 0.3294118, 1,
1.745643, 0.9269573, -1.821265, 1, 0, 0.3254902, 1,
1.746113, 1.482192, 0.8776946, 1, 0, 0.3176471, 1,
1.762226, 0.3566203, 0.8775666, 1, 0, 0.3137255, 1,
1.806371, -0.7497027, 1.38784, 1, 0, 0.3058824, 1,
1.824292, -0.172462, 1.310357, 1, 0, 0.2980392, 1,
1.838295, 0.401842, 1.000964, 1, 0, 0.2941177, 1,
1.845824, -1.180587, 1.378767, 1, 0, 0.2862745, 1,
1.846159, 0.5825407, 2.252909, 1, 0, 0.282353, 1,
1.853126, 0.1371378, 1.559396, 1, 0, 0.2745098, 1,
1.854793, -0.8325085, 1.980088, 1, 0, 0.2705882, 1,
1.861047, -1.488976, 1.757925, 1, 0, 0.2627451, 1,
1.862891, 0.3807954, 0.6528065, 1, 0, 0.2588235, 1,
1.868963, 0.1564916, 1.704188, 1, 0, 0.2509804, 1,
1.873725, -1.973119, 2.55319, 1, 0, 0.2470588, 1,
1.874335, 3.056804, -0.4192472, 1, 0, 0.2392157, 1,
1.883626, -1.189513, -0.4045275, 1, 0, 0.2352941, 1,
1.885438, 0.6417854, -0.09487803, 1, 0, 0.227451, 1,
1.894397, -0.4427185, 2.271983, 1, 0, 0.2235294, 1,
1.895767, -0.1423532, 2.269337, 1, 0, 0.2156863, 1,
1.917734, 0.6070951, 1.409297, 1, 0, 0.2117647, 1,
1.918109, -0.4073702, 0.7171304, 1, 0, 0.2039216, 1,
1.944801, 0.6952304, -0.01047301, 1, 0, 0.1960784, 1,
1.946642, -2.698207, 1.501636, 1, 0, 0.1921569, 1,
1.979276, -0.8167277, 2.455497, 1, 0, 0.1843137, 1,
1.979289, 1.170837, 1.829223, 1, 0, 0.1803922, 1,
1.98048, 1.122262, 0.5907622, 1, 0, 0.172549, 1,
1.987109, 0.5134577, 3.194587, 1, 0, 0.1686275, 1,
2.007082, 0.5507309, 1.705653, 1, 0, 0.1607843, 1,
2.014626, 1.674755, 1.558858, 1, 0, 0.1568628, 1,
2.036791, 0.1627925, 0.5505944, 1, 0, 0.1490196, 1,
2.058244, -1.001986, 2.860516, 1, 0, 0.145098, 1,
2.063485, 1.112796, 0.1773314, 1, 0, 0.1372549, 1,
2.069051, -2.361327, 2.763979, 1, 0, 0.1333333, 1,
2.083344, -1.058274, 1.118559, 1, 0, 0.1254902, 1,
2.100441, -0.09927425, 0.1748049, 1, 0, 0.1215686, 1,
2.116074, -0.6608794, 3.060333, 1, 0, 0.1137255, 1,
2.135026, 0.5636245, 1.434669, 1, 0, 0.1098039, 1,
2.142381, 0.3575817, 1.220649, 1, 0, 0.1019608, 1,
2.15574, -0.0280828, 1.872574, 1, 0, 0.09411765, 1,
2.180336, -0.5056688, 0.9135503, 1, 0, 0.09019608, 1,
2.192228, 1.610764, 2.306671, 1, 0, 0.08235294, 1,
2.243619, -0.8310343, 3.287381, 1, 0, 0.07843138, 1,
2.280324, -1.586449, 1.804258, 1, 0, 0.07058824, 1,
2.312686, -0.7221046, 2.031837, 1, 0, 0.06666667, 1,
2.43264, 0.6262336, 2.043018, 1, 0, 0.05882353, 1,
2.489305, 1.52809, 1.223494, 1, 0, 0.05490196, 1,
2.500921, -0.0901603, 2.680775, 1, 0, 0.04705882, 1,
2.574264, -0.3904067, 1.493038, 1, 0, 0.04313726, 1,
2.608271, 0.6174768, 0.8675996, 1, 0, 0.03529412, 1,
2.816261, 0.3872003, 2.046111, 1, 0, 0.03137255, 1,
2.893289, 1.369018, 2.08652, 1, 0, 0.02352941, 1,
2.895681, -0.6092429, 2.029962, 1, 0, 0.01960784, 1,
3.075862, -0.18995, 1.214046, 1, 0, 0.01176471, 1,
3.616356, -0.115552, 2.291028, 1, 0, 0.007843138, 1
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
0.4680845, -4.438148, -7.237521, 0, -0.5, 0.5, 0.5,
0.4680845, -4.438148, -7.237521, 1, -0.5, 0.5, 0.5,
0.4680845, -4.438148, -7.237521, 1, 1.5, 0.5, 0.5,
0.4680845, -4.438148, -7.237521, 0, 1.5, 0.5, 0.5
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
-3.747451, -0.1211303, -7.237521, 0, -0.5, 0.5, 0.5,
-3.747451, -0.1211303, -7.237521, 1, -0.5, 0.5, 0.5,
-3.747451, -0.1211303, -7.237521, 1, 1.5, 0.5, 0.5,
-3.747451, -0.1211303, -7.237521, 0, 1.5, 0.5, 0.5
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
-3.747451, -4.438148, 0.3011203, 0, -0.5, 0.5, 0.5,
-3.747451, -4.438148, 0.3011203, 1, -0.5, 0.5, 0.5,
-3.747451, -4.438148, 0.3011203, 1, 1.5, 0.5, 0.5,
-3.747451, -4.438148, 0.3011203, 0, 1.5, 0.5, 0.5
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
-2, -3.441914, -5.497834,
3, -3.441914, -5.497834,
-2, -3.441914, -5.497834,
-2, -3.607953, -5.787782,
-1, -3.441914, -5.497834,
-1, -3.607953, -5.787782,
0, -3.441914, -5.497834,
0, -3.607953, -5.787782,
1, -3.441914, -5.497834,
1, -3.607953, -5.787782,
2, -3.441914, -5.497834,
2, -3.607953, -5.787782,
3, -3.441914, -5.497834,
3, -3.607953, -5.787782
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
-2, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
-2, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
-2, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
-2, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5,
-1, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
-1, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
-1, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
-1, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5,
0, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
0, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
0, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
0, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5,
1, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
1, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
1, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
1, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5,
2, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
2, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
2, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
2, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5,
3, -3.940031, -6.367678, 0, -0.5, 0.5, 0.5,
3, -3.940031, -6.367678, 1, -0.5, 0.5, 0.5,
3, -3.940031, -6.367678, 1, 1.5, 0.5, 0.5,
3, -3.940031, -6.367678, 0, 1.5, 0.5, 0.5
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
-2.774635, -3, -5.497834,
-2.774635, 3, -5.497834,
-2.774635, -3, -5.497834,
-2.936771, -3, -5.787782,
-2.774635, -2, -5.497834,
-2.936771, -2, -5.787782,
-2.774635, -1, -5.497834,
-2.936771, -1, -5.787782,
-2.774635, 0, -5.497834,
-2.936771, 0, -5.787782,
-2.774635, 1, -5.497834,
-2.936771, 1, -5.787782,
-2.774635, 2, -5.497834,
-2.936771, 2, -5.787782,
-2.774635, 3, -5.497834,
-2.936771, 3, -5.787782
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
-3.261043, -3, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, -3, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, -3, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, -3, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, -2, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, -2, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, -2, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, -2, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, -1, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, -1, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, -1, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, -1, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, 0, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, 0, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, 0, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, 0, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, 1, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, 1, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, 1, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, 1, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, 2, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, 2, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, 2, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, 2, -6.367678, 0, 1.5, 0.5, 0.5,
-3.261043, 3, -6.367678, 0, -0.5, 0.5, 0.5,
-3.261043, 3, -6.367678, 1, -0.5, 0.5, 0.5,
-3.261043, 3, -6.367678, 1, 1.5, 0.5, 0.5,
-3.261043, 3, -6.367678, 0, 1.5, 0.5, 0.5
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
-2.774635, -3.441914, -4,
-2.774635, -3.441914, 4,
-2.774635, -3.441914, -4,
-2.936771, -3.607953, -4,
-2.774635, -3.441914, -2,
-2.936771, -3.607953, -2,
-2.774635, -3.441914, 0,
-2.936771, -3.607953, 0,
-2.774635, -3.441914, 2,
-2.936771, -3.607953, 2,
-2.774635, -3.441914, 4,
-2.936771, -3.607953, 4
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
-3.261043, -3.940031, -4, 0, -0.5, 0.5, 0.5,
-3.261043, -3.940031, -4, 1, -0.5, 0.5, 0.5,
-3.261043, -3.940031, -4, 1, 1.5, 0.5, 0.5,
-3.261043, -3.940031, -4, 0, 1.5, 0.5, 0.5,
-3.261043, -3.940031, -2, 0, -0.5, 0.5, 0.5,
-3.261043, -3.940031, -2, 1, -0.5, 0.5, 0.5,
-3.261043, -3.940031, -2, 1, 1.5, 0.5, 0.5,
-3.261043, -3.940031, -2, 0, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 0, 0, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 0, 1, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 0, 1, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 0, 0, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 2, 0, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 2, 1, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 2, 1, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 2, 0, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 4, 0, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 4, 1, -0.5, 0.5, 0.5,
-3.261043, -3.940031, 4, 1, 1.5, 0.5, 0.5,
-3.261043, -3.940031, 4, 0, 1.5, 0.5, 0.5
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
-2.774635, -3.441914, -5.497834,
-2.774635, 3.199653, -5.497834,
-2.774635, -3.441914, 6.100075,
-2.774635, 3.199653, 6.100075,
-2.774635, -3.441914, -5.497834,
-2.774635, -3.441914, 6.100075,
-2.774635, 3.199653, -5.497834,
-2.774635, 3.199653, 6.100075,
-2.774635, -3.441914, -5.497834,
3.710804, -3.441914, -5.497834,
-2.774635, -3.441914, 6.100075,
3.710804, -3.441914, 6.100075,
-2.774635, 3.199653, -5.497834,
3.710804, 3.199653, -5.497834,
-2.774635, 3.199653, 6.100075,
3.710804, 3.199653, 6.100075,
3.710804, -3.441914, -5.497834,
3.710804, 3.199653, -5.497834,
3.710804, -3.441914, 6.100075,
3.710804, 3.199653, 6.100075,
3.710804, -3.441914, -5.497834,
3.710804, -3.441914, 6.100075,
3.710804, 3.199653, -5.497834,
3.710804, 3.199653, 6.100075
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
var radius = 7.932493;
var distance = 35.29256;
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
mvMatrix.translate( -0.4680845, 0.1211303, -0.3011203 );
mvMatrix.scale( 1.322465, 1.291377, 0.7395098 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29256);
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
ALLY<-read.table("ALLY.xyz")
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
-2.680187, -0.02544244, -2.640999, 0, 0, 1, 1, 1,
-2.668865, 1.411211, -1.894325, 1, 0, 0, 1, 1,
-2.50233, 0.05720323, -1.687196, 1, 0, 0, 1, 1,
-2.405058, -0.2979645, -0.2680795, 1, 0, 0, 1, 1,
-2.372829, 0.9930567, -0.4605241, 1, 0, 0, 1, 1,
-2.357096, 0.1777495, -0.4773923, 1, 0, 0, 1, 1,
-2.335742, 0.001351993, -0.9509885, 0, 0, 0, 1, 1,
-2.331517, 0.4176233, 0.7353275, 0, 0, 0, 1, 1,
-2.280183, 2.316457, -0.873456, 0, 0, 0, 1, 1,
-2.246651, -1.544338, -1.511966, 0, 0, 0, 1, 1,
-2.212005, 1.156822, -2.595013, 0, 0, 0, 1, 1,
-2.165281, -0.2076934, -2.4764, 0, 0, 0, 1, 1,
-2.16301, 0.4297806, -2.321183, 0, 0, 0, 1, 1,
-2.144286, -1.809159, -1.830904, 1, 1, 1, 1, 1,
-2.107317, -0.9425566, -2.235894, 1, 1, 1, 1, 1,
-2.089304, -1.97993, -2.437274, 1, 1, 1, 1, 1,
-2.077342, -0.7588285, -2.269767, 1, 1, 1, 1, 1,
-2.075131, -1.263674, -1.430655, 1, 1, 1, 1, 1,
-2.074551, 0.3831041, -2.365144, 1, 1, 1, 1, 1,
-2.070065, 0.6489658, -1.013759, 1, 1, 1, 1, 1,
-2.043867, 0.3868649, -1.680912, 1, 1, 1, 1, 1,
-2.018638, -0.2797354, -0.9157845, 1, 1, 1, 1, 1,
-2.017489, -0.6001927, -2.611857, 1, 1, 1, 1, 1,
-2.014704, -1.650822, -1.101054, 1, 1, 1, 1, 1,
-1.99585, 0.5832557, -0.910363, 1, 1, 1, 1, 1,
-1.972975, -0.270731, -2.837375, 1, 1, 1, 1, 1,
-1.959133, 0.03607991, -0.2056524, 1, 1, 1, 1, 1,
-1.947057, 1.107798, 0.5868714, 1, 1, 1, 1, 1,
-1.941514, -1.426393, -2.029505, 0, 0, 1, 1, 1,
-1.92435, 0.8985211, -1.090133, 1, 0, 0, 1, 1,
-1.923306, 0.9699623, -1.173369, 1, 0, 0, 1, 1,
-1.906951, 1.227341, -0.2927665, 1, 0, 0, 1, 1,
-1.902745, -0.07906596, -1.441084, 1, 0, 0, 1, 1,
-1.853183, -1.296819, -4.050149, 1, 0, 0, 1, 1,
-1.821454, -1.694085, -2.450507, 0, 0, 0, 1, 1,
-1.819439, -0.4792942, -1.003278, 0, 0, 0, 1, 1,
-1.804541, -1.103991, -2.434311, 0, 0, 0, 1, 1,
-1.797947, -1.504593, -1.620112, 0, 0, 0, 1, 1,
-1.79297, 0.935743, -0.357386, 0, 0, 0, 1, 1,
-1.775849, -0.9423578, -2.443289, 0, 0, 0, 1, 1,
-1.771137, 0.3934886, -1.824402, 0, 0, 0, 1, 1,
-1.760647, 0.5455273, -1.42218, 1, 1, 1, 1, 1,
-1.757962, 0.5541828, -1.950655, 1, 1, 1, 1, 1,
-1.755643, 1.235471, -1.089429, 1, 1, 1, 1, 1,
-1.74489, -0.7837561, -1.166516, 1, 1, 1, 1, 1,
-1.736564, -0.9161008, -2.928406, 1, 1, 1, 1, 1,
-1.708341, 0.7351628, -1.242597, 1, 1, 1, 1, 1,
-1.696926, 0.5291816, -3.410676, 1, 1, 1, 1, 1,
-1.681566, 2.909664, -0.5034087, 1, 1, 1, 1, 1,
-1.66983, 0.4438848, -0.7994061, 1, 1, 1, 1, 1,
-1.659422, -1.619566, -3.520726, 1, 1, 1, 1, 1,
-1.656348, 0.6320423, 0.6973761, 1, 1, 1, 1, 1,
-1.649683, 2.420632, -1.000547, 1, 1, 1, 1, 1,
-1.649133, 0.5021521, 0.158692, 1, 1, 1, 1, 1,
-1.64116, -1.128816, -2.509827, 1, 1, 1, 1, 1,
-1.615355, -1.728119, -2.398731, 1, 1, 1, 1, 1,
-1.608202, 1.117797, -1.818108, 0, 0, 1, 1, 1,
-1.602869, -1.78033, -3.80343, 1, 0, 0, 1, 1,
-1.598803, 1.262758, 0.942777, 1, 0, 0, 1, 1,
-1.591433, -0.7820002, -1.593687, 1, 0, 0, 1, 1,
-1.582534, 0.5608099, 1.307445, 1, 0, 0, 1, 1,
-1.582423, -0.5119205, -2.447948, 1, 0, 0, 1, 1,
-1.562167, 0.3325208, -1.437315, 0, 0, 0, 1, 1,
-1.557756, 0.08872204, -3.019506, 0, 0, 0, 1, 1,
-1.547342, -0.1600437, -2.142082, 0, 0, 0, 1, 1,
-1.544002, 0.02394153, -0.7008261, 0, 0, 0, 1, 1,
-1.538293, 0.02842862, -2.284581, 0, 0, 0, 1, 1,
-1.536025, -0.8677799, -2.344814, 0, 0, 0, 1, 1,
-1.535813, 1.335467, -1.547771, 0, 0, 0, 1, 1,
-1.528173, 1.068408, -0.8589743, 1, 1, 1, 1, 1,
-1.527891, 1.143089, -2.238699, 1, 1, 1, 1, 1,
-1.525731, 0.9466107, -1.32173, 1, 1, 1, 1, 1,
-1.513546, -0.6026905, -1.524708, 1, 1, 1, 1, 1,
-1.512264, 1.789848, 0.4070576, 1, 1, 1, 1, 1,
-1.504133, 1.142267, -1.435525, 1, 1, 1, 1, 1,
-1.500994, -0.4372248, -0.6058546, 1, 1, 1, 1, 1,
-1.496299, -0.8641226, -2.58141, 1, 1, 1, 1, 1,
-1.482964, 1.552638, -0.1156903, 1, 1, 1, 1, 1,
-1.476747, 0.6918741, -1.370573, 1, 1, 1, 1, 1,
-1.457969, 1.550602, -0.1954986, 1, 1, 1, 1, 1,
-1.449768, -1.315386, -3.69257, 1, 1, 1, 1, 1,
-1.419901, -0.7986921, -1.868824, 1, 1, 1, 1, 1,
-1.418985, -0.4903937, -2.231965, 1, 1, 1, 1, 1,
-1.417205, -0.1260382, -3.371941, 1, 1, 1, 1, 1,
-1.412336, 0.1950746, -2.273929, 0, 0, 1, 1, 1,
-1.398853, 0.03409724, -0.9365351, 1, 0, 0, 1, 1,
-1.397676, -0.3163001, -2.192688, 1, 0, 0, 1, 1,
-1.392812, -0.6537462, -1.328516, 1, 0, 0, 1, 1,
-1.390398, -2.869826, -2.935909, 1, 0, 0, 1, 1,
-1.389835, -1.067695, -1.144769, 1, 0, 0, 1, 1,
-1.388337, -0.5050319, -2.198724, 0, 0, 0, 1, 1,
-1.387544, -1.576035, -2.338433, 0, 0, 0, 1, 1,
-1.385464, -1.43214, -0.2467345, 0, 0, 0, 1, 1,
-1.384311, -0.5098268, -2.142073, 0, 0, 0, 1, 1,
-1.380709, 0.09246232, -0.8258995, 0, 0, 0, 1, 1,
-1.369877, 0.453789, -3.212534, 0, 0, 0, 1, 1,
-1.360512, 0.1663612, -1.080578, 0, 0, 0, 1, 1,
-1.350655, 0.01042258, -0.02108657, 1, 1, 1, 1, 1,
-1.348941, -0.1835761, -1.579205, 1, 1, 1, 1, 1,
-1.346307, 1.318558, -0.05158662, 1, 1, 1, 1, 1,
-1.344383, -1.712588, -0.9816349, 1, 1, 1, 1, 1,
-1.335319, -0.8715764, -2.256651, 1, 1, 1, 1, 1,
-1.332037, 0.6339466, -0.5742696, 1, 1, 1, 1, 1,
-1.32953, 0.4731839, -2.437682, 1, 1, 1, 1, 1,
-1.326572, -1.611906, -3.047266, 1, 1, 1, 1, 1,
-1.325013, -0.4213994, -1.917594, 1, 1, 1, 1, 1,
-1.30966, 1.235454, -0.009637853, 1, 1, 1, 1, 1,
-1.302185, -0.8923323, -3.437959, 1, 1, 1, 1, 1,
-1.289476, 0.05374917, -1.190302, 1, 1, 1, 1, 1,
-1.282012, 0.8122137, -0.646691, 1, 1, 1, 1, 1,
-1.276711, -0.493292, -0.4016651, 1, 1, 1, 1, 1,
-1.274796, 0.8452775, -0.8404808, 1, 1, 1, 1, 1,
-1.270072, 0.4974923, -1.552883, 0, 0, 1, 1, 1,
-1.262188, -0.4965018, -1.292634, 1, 0, 0, 1, 1,
-1.254929, -0.2328658, -1.644958, 1, 0, 0, 1, 1,
-1.250971, 0.9016078, -0.5077924, 1, 0, 0, 1, 1,
-1.249257, 0.7218111, -0.9557227, 1, 0, 0, 1, 1,
-1.246308, 0.2431751, -1.173941, 1, 0, 0, 1, 1,
-1.244469, -1.462366, -2.591638, 0, 0, 0, 1, 1,
-1.235625, 0.4897734, 0.01014799, 0, 0, 0, 1, 1,
-1.235143, 1.011717, -0.9694244, 0, 0, 0, 1, 1,
-1.231771, 2.119395, -0.3298075, 0, 0, 0, 1, 1,
-1.22767, -0.276757, -2.444714, 0, 0, 0, 1, 1,
-1.22101, 0.5444107, -1.11767, 0, 0, 0, 1, 1,
-1.215242, -0.3097444, -3.119984, 0, 0, 0, 1, 1,
-1.213474, 0.319689, -0.1149869, 1, 1, 1, 1, 1,
-1.211724, 2.024096, 0.8735167, 1, 1, 1, 1, 1,
-1.207727, -0.9498206, -1.659126, 1, 1, 1, 1, 1,
-1.201509, -0.09149506, -1.262956, 1, 1, 1, 1, 1,
-1.197489, 0.1707979, -1.501015, 1, 1, 1, 1, 1,
-1.182698, 2.038323, -0.4640067, 1, 1, 1, 1, 1,
-1.167096, 0.9399464, -1.470291, 1, 1, 1, 1, 1,
-1.154394, -1.797659, -2.543964, 1, 1, 1, 1, 1,
-1.150852, -0.7119728, -1.5013, 1, 1, 1, 1, 1,
-1.148919, 0.05605437, -1.011695, 1, 1, 1, 1, 1,
-1.148037, 0.2476237, -1.86384, 1, 1, 1, 1, 1,
-1.137796, 0.6637846, -1.858278, 1, 1, 1, 1, 1,
-1.137425, -0.1388481, -1.275334, 1, 1, 1, 1, 1,
-1.135718, -3.09503, -3.99247, 1, 1, 1, 1, 1,
-1.135275, -0.942039, -1.461042, 1, 1, 1, 1, 1,
-1.130615, -1.174482, -2.056495, 0, 0, 1, 1, 1,
-1.13019, 1.237472, -0.7155111, 1, 0, 0, 1, 1,
-1.121284, 1.762854, -0.3773911, 1, 0, 0, 1, 1,
-1.12084, 0.548202, -1.422537, 1, 0, 0, 1, 1,
-1.120581, -0.6403554, -1.754144, 1, 0, 0, 1, 1,
-1.113371, -0.767925, -1.908162, 1, 0, 0, 1, 1,
-1.109875, -0.9040398, -2.549587, 0, 0, 0, 1, 1,
-1.104237, 0.1344767, -1.326301, 0, 0, 0, 1, 1,
-1.098776, 0.3418599, -0.2416577, 0, 0, 0, 1, 1,
-1.097639, -0.2901583, -1.523537, 0, 0, 0, 1, 1,
-1.092019, -0.9589331, -2.600282, 0, 0, 0, 1, 1,
-1.08545, -0.1725337, -2.520282, 0, 0, 0, 1, 1,
-1.051519, 0.2012484, -2.725739, 0, 0, 0, 1, 1,
-1.04913, 0.5882307, -0.372868, 1, 1, 1, 1, 1,
-1.048903, -0.7830714, -1.708756, 1, 1, 1, 1, 1,
-1.045852, 0.1427682, -0.8311311, 1, 1, 1, 1, 1,
-1.040823, -1.582112, -1.625561, 1, 1, 1, 1, 1,
-1.033397, 1.423018, -1.744308, 1, 1, 1, 1, 1,
-1.031417, -1.316816, -2.646488, 1, 1, 1, 1, 1,
-1.030592, -0.3896917, -4.752391, 1, 1, 1, 1, 1,
-1.026068, 0.987889, -0.8184147, 1, 1, 1, 1, 1,
-1.019925, 0.934324, -1.225678, 1, 1, 1, 1, 1,
-1.01585, 1.279314, -0.2141859, 1, 1, 1, 1, 1,
-1.00609, -2.629156, -2.560681, 1, 1, 1, 1, 1,
-0.9924795, 1.317992, 0.04729187, 1, 1, 1, 1, 1,
-0.9910183, -0.8912097, -2.09112, 1, 1, 1, 1, 1,
-0.9854564, 0.40681, 0.5814945, 1, 1, 1, 1, 1,
-0.9779559, 0.5956497, -1.622205, 1, 1, 1, 1, 1,
-0.9770763, 1.215335, -0.4024167, 0, 0, 1, 1, 1,
-0.9703717, 2.190486, -2.624162, 1, 0, 0, 1, 1,
-0.9618438, 0.9697036, -1.187103, 1, 0, 0, 1, 1,
-0.9613143, 3.102931, -0.2001734, 1, 0, 0, 1, 1,
-0.9576161, -0.1049587, -1.884376, 1, 0, 0, 1, 1,
-0.9576057, -0.6507584, -1.478312, 1, 0, 0, 1, 1,
-0.9456776, 1.351841, -0.0454987, 0, 0, 0, 1, 1,
-0.9441415, -0.08867963, -0.419747, 0, 0, 0, 1, 1,
-0.9412398, -0.3904462, -0.8650951, 0, 0, 0, 1, 1,
-0.9322622, -1.402411, -1.300386, 0, 0, 0, 1, 1,
-0.9314239, 0.2776608, -1.003683, 0, 0, 0, 1, 1,
-0.9292863, 0.7619551, -1.255126, 0, 0, 0, 1, 1,
-0.9274396, 0.3012613, -0.8479186, 0, 0, 0, 1, 1,
-0.9263502, -1.052025, -2.19149, 1, 1, 1, 1, 1,
-0.9250972, 0.5037814, -3.520021, 1, 1, 1, 1, 1,
-0.9138061, 0.5066708, -1.890202, 1, 1, 1, 1, 1,
-0.912759, -1.334642, -2.17687, 1, 1, 1, 1, 1,
-0.9026541, 0.3060304, -1.789664, 1, 1, 1, 1, 1,
-0.8996152, -0.1526092, -0.4484852, 1, 1, 1, 1, 1,
-0.8936574, 0.2850087, 0.2203187, 1, 1, 1, 1, 1,
-0.8904393, -0.7521683, -3.838323, 1, 1, 1, 1, 1,
-0.889101, -0.9307905, -5.328933, 1, 1, 1, 1, 1,
-0.8806936, 1.100712, -2.254632, 1, 1, 1, 1, 1,
-0.8742746, -1.67073, -2.612204, 1, 1, 1, 1, 1,
-0.8724182, 0.8734068, -1.776354, 1, 1, 1, 1, 1,
-0.869151, 0.8563729, 1.419847, 1, 1, 1, 1, 1,
-0.8629394, 2.051628, -0.9041578, 1, 1, 1, 1, 1,
-0.8569641, -0.6302516, -3.527719, 1, 1, 1, 1, 1,
-0.8529496, 0.173644, -1.279921, 0, 0, 1, 1, 1,
-0.8523805, -0.531849, -2.437189, 1, 0, 0, 1, 1,
-0.8508012, 0.64841, -0.7280728, 1, 0, 0, 1, 1,
-0.8462278, -1.898566, -3.013822, 1, 0, 0, 1, 1,
-0.8432261, 0.1056736, -2.175875, 1, 0, 0, 1, 1,
-0.8419061, 0.4345887, -1.672059, 1, 0, 0, 1, 1,
-0.8340523, -0.01649794, -2.317726, 0, 0, 0, 1, 1,
-0.8316697, -0.05828509, -0.8315501, 0, 0, 0, 1, 1,
-0.8315422, 0.8826905, 0.6133406, 0, 0, 0, 1, 1,
-0.8263265, 1.309471, -0.1816463, 0, 0, 0, 1, 1,
-0.8160123, -0.3171951, -1.619156, 0, 0, 0, 1, 1,
-0.8051569, 1.769454, -1.560656, 0, 0, 0, 1, 1,
-0.8003077, -1.033175, -4.360044, 0, 0, 0, 1, 1,
-0.7932501, 0.3536884, -0.440008, 1, 1, 1, 1, 1,
-0.788784, 2.329205, -0.05549613, 1, 1, 1, 1, 1,
-0.7878758, -1.29014, -2.64937, 1, 1, 1, 1, 1,
-0.7811214, -0.03003015, -0.8429155, 1, 1, 1, 1, 1,
-0.7761564, 0.847388, 0.2824655, 1, 1, 1, 1, 1,
-0.7714286, 0.5099391, -0.9455912, 1, 1, 1, 1, 1,
-0.7702189, -0.4935552, -1.451594, 1, 1, 1, 1, 1,
-0.7688448, 1.088737, -1.050302, 1, 1, 1, 1, 1,
-0.7634401, 1.868067, 1.102199, 1, 1, 1, 1, 1,
-0.763422, 0.5282822, -1.604899, 1, 1, 1, 1, 1,
-0.7620101, -1.11163, -1.653706, 1, 1, 1, 1, 1,
-0.7600008, -1.344661, -1.838697, 1, 1, 1, 1, 1,
-0.7577478, 0.7297485, -2.239144, 1, 1, 1, 1, 1,
-0.7575545, 0.768661, -0.4874803, 1, 1, 1, 1, 1,
-0.7495059, 0.2373655, -2.309096, 1, 1, 1, 1, 1,
-0.7488315, 1.053101, 0.2097532, 0, 0, 1, 1, 1,
-0.7462489, 1.942208, -1.407567, 1, 0, 0, 1, 1,
-0.7459303, -0.6017943, -3.411893, 1, 0, 0, 1, 1,
-0.7457563, -0.2973797, -0.1439296, 1, 0, 0, 1, 1,
-0.7402276, 0.1289368, -1.880349, 1, 0, 0, 1, 1,
-0.7394243, -1.795167, -3.493538, 1, 0, 0, 1, 1,
-0.7392798, 0.204475, -1.755365, 0, 0, 0, 1, 1,
-0.7328645, -0.6406983, -3.264396, 0, 0, 0, 1, 1,
-0.7318379, -1.117055, -1.033338, 0, 0, 0, 1, 1,
-0.7253414, -0.8919287, -2.296124, 0, 0, 0, 1, 1,
-0.7219481, 0.4324767, -1.617623, 0, 0, 0, 1, 1,
-0.7199886, 1.568428, -1.331254, 0, 0, 0, 1, 1,
-0.7175529, 0.3763027, -2.269164, 0, 0, 0, 1, 1,
-0.6957985, 0.6886243, -0.2690685, 1, 1, 1, 1, 1,
-0.6904688, -1.456291, -3.11918, 1, 1, 1, 1, 1,
-0.6896371, -0.5280485, -3.107399, 1, 1, 1, 1, 1,
-0.6816933, -0.7509286, -0.947996, 1, 1, 1, 1, 1,
-0.6802117, -1.166204, -2.374837, 1, 1, 1, 1, 1,
-0.6789484, 1.090903, -1.934098, 1, 1, 1, 1, 1,
-0.6782831, 0.8471649, -0.391219, 1, 1, 1, 1, 1,
-0.6742204, 0.8695732, -0.1349982, 1, 1, 1, 1, 1,
-0.6719868, -0.5629043, -3.447929, 1, 1, 1, 1, 1,
-0.6712124, 0.6937765, -0.4183176, 1, 1, 1, 1, 1,
-0.6679171, -1.243014, -3.023564, 1, 1, 1, 1, 1,
-0.6648885, 0.07446985, -0.5470341, 1, 1, 1, 1, 1,
-0.6620322, -0.8539997, -1.798963, 1, 1, 1, 1, 1,
-0.6613945, -1.833342, -1.981326, 1, 1, 1, 1, 1,
-0.6587325, 1.324204, 0.1585436, 1, 1, 1, 1, 1,
-0.6575855, -1.687159, -2.874106, 0, 0, 1, 1, 1,
-0.6560947, -0.6323087, -2.937738, 1, 0, 0, 1, 1,
-0.6505005, -0.1835376, -1.314946, 1, 0, 0, 1, 1,
-0.649955, 0.368389, -3.161142, 1, 0, 0, 1, 1,
-0.6449381, -1.127483, -1.991422, 1, 0, 0, 1, 1,
-0.6439329, -0.05375887, -2.242628, 1, 0, 0, 1, 1,
-0.6434297, 1.112089, -0.9136807, 0, 0, 0, 1, 1,
-0.6410006, 1.045123, -1.425219, 0, 0, 0, 1, 1,
-0.6397623, -0.09572482, -1.439583, 0, 0, 0, 1, 1,
-0.6395476, -1.207523, -3.201107, 0, 0, 0, 1, 1,
-0.6370412, -0.7624799, -2.407822, 0, 0, 0, 1, 1,
-0.6340814, 0.2202009, -1.885108, 0, 0, 0, 1, 1,
-0.6338161, 0.9019839, 0.03268678, 0, 0, 0, 1, 1,
-0.6294649, 1.794651, -0.2727491, 1, 1, 1, 1, 1,
-0.6288984, 0.9212118, 0.368688, 1, 1, 1, 1, 1,
-0.6237314, 0.4297898, -0.6428523, 1, 1, 1, 1, 1,
-0.6196639, 1.10765, -0.01016629, 1, 1, 1, 1, 1,
-0.6192172, 2.161268, -0.5681301, 1, 1, 1, 1, 1,
-0.6180966, 0.7516538, -0.8906116, 1, 1, 1, 1, 1,
-0.6179748, -0.07876396, 0.4353681, 1, 1, 1, 1, 1,
-0.6162951, 1.513808, 1.17357, 1, 1, 1, 1, 1,
-0.6123774, 1.823968, 1.01722, 1, 1, 1, 1, 1,
-0.6032362, -0.6400759, -1.538279, 1, 1, 1, 1, 1,
-0.6010437, -0.6582496, -1.760989, 1, 1, 1, 1, 1,
-0.5973055, 0.6877596, -1.112189, 1, 1, 1, 1, 1,
-0.5937132, -0.3122558, -3.10072, 1, 1, 1, 1, 1,
-0.5935633, -1.037372, -3.05054, 1, 1, 1, 1, 1,
-0.5920691, -0.8969193, -2.837441, 1, 1, 1, 1, 1,
-0.5897404, 0.2071393, -3.363769, 0, 0, 1, 1, 1,
-0.5870179, -0.1880522, -1.058442, 1, 0, 0, 1, 1,
-0.5857637, 0.5323742, -1.32919, 1, 0, 0, 1, 1,
-0.5844417, -0.2745237, -1.048903, 1, 0, 0, 1, 1,
-0.575401, 0.1309747, -1.803109, 1, 0, 0, 1, 1,
-0.574757, -1.436671, -3.381465, 1, 0, 0, 1, 1,
-0.5714037, 1.589399, 0.7963182, 0, 0, 0, 1, 1,
-0.5705507, 0.4016718, -0.9151062, 0, 0, 0, 1, 1,
-0.5693101, -0.01380972, -2.118938, 0, 0, 0, 1, 1,
-0.5656784, -2.538921, -2.249542, 0, 0, 0, 1, 1,
-0.5602217, 0.217947, -1.300496, 0, 0, 0, 1, 1,
-0.557923, -0.2444512, -3.419135, 0, 0, 0, 1, 1,
-0.5559708, 1.413966, -0.8066256, 0, 0, 0, 1, 1,
-0.5558003, -0.2392707, -1.082995, 1, 1, 1, 1, 1,
-0.5445138, 1.295785, -0.4587192, 1, 1, 1, 1, 1,
-0.5355628, -0.2215437, -3.102385, 1, 1, 1, 1, 1,
-0.5332838, 0.1557017, -1.593971, 1, 1, 1, 1, 1,
-0.5193464, 0.5575695, -0.6384326, 1, 1, 1, 1, 1,
-0.517553, 0.9953572, -2.250758, 1, 1, 1, 1, 1,
-0.5164064, 0.136033, -1.30031, 1, 1, 1, 1, 1,
-0.5143717, 1.051025, 0.3593124, 1, 1, 1, 1, 1,
-0.514091, -1.535471, -0.7214209, 1, 1, 1, 1, 1,
-0.5135788, 0.8127201, 0.6752246, 1, 1, 1, 1, 1,
-0.5127537, -1.613808, -2.956875, 1, 1, 1, 1, 1,
-0.5121908, -0.7304509, -3.46092, 1, 1, 1, 1, 1,
-0.5117449, -0.4816953, -3.2126, 1, 1, 1, 1, 1,
-0.5085748, -1.049354, -4.075333, 1, 1, 1, 1, 1,
-0.5081331, 0.02724047, -1.394763, 1, 1, 1, 1, 1,
-0.4917802, 2.309707, 0.3152204, 0, 0, 1, 1, 1,
-0.4903995, -0.7096109, -2.625361, 1, 0, 0, 1, 1,
-0.4898926, 0.6170816, -0.07888825, 1, 0, 0, 1, 1,
-0.4851075, 1.162548, -1.448027, 1, 0, 0, 1, 1,
-0.4822811, -1.081899, -2.036276, 1, 0, 0, 1, 1,
-0.4814149, -0.6779249, -2.117755, 1, 0, 0, 1, 1,
-0.4768015, -0.08284856, -3.114564, 0, 0, 0, 1, 1,
-0.4757768, -0.2269304, -2.114708, 0, 0, 0, 1, 1,
-0.4736736, -1.309874, -4.215265, 0, 0, 0, 1, 1,
-0.4684129, -0.3137901, -0.174205, 0, 0, 0, 1, 1,
-0.4650421, -0.8152835, -1.71936, 0, 0, 0, 1, 1,
-0.4642824, 0.532964, 0.2983764, 0, 0, 0, 1, 1,
-0.4637163, 1.686416, -0.779592, 0, 0, 0, 1, 1,
-0.4609863, -0.3779069, -2.736605, 1, 1, 1, 1, 1,
-0.4552358, -0.8955607, -3.906814, 1, 1, 1, 1, 1,
-0.4547803, 0.0830133, -0.7823698, 1, 1, 1, 1, 1,
-0.4537211, -0.3515716, -1.453715, 1, 1, 1, 1, 1,
-0.4497549, 0.6431676, -0.1309331, 1, 1, 1, 1, 1,
-0.448425, -0.2302335, -3.198681, 1, 1, 1, 1, 1,
-0.4477052, 0.5330459, -1.272442, 1, 1, 1, 1, 1,
-0.4441338, 0.144706, -1.551626, 1, 1, 1, 1, 1,
-0.4357257, -0.8966151, -2.003156, 1, 1, 1, 1, 1,
-0.4349649, -0.3245038, -2.455197, 1, 1, 1, 1, 1,
-0.4317876, 0.1563306, -3.483665, 1, 1, 1, 1, 1,
-0.4314912, -1.018918, -0.7502908, 1, 1, 1, 1, 1,
-0.42803, -0.358721, -3.003099, 1, 1, 1, 1, 1,
-0.4277292, 0.2923236, -1.84737, 1, 1, 1, 1, 1,
-0.4275917, -1.556773, -1.693702, 1, 1, 1, 1, 1,
-0.4260889, -1.843822, -4.907706, 0, 0, 1, 1, 1,
-0.4259786, 0.005477758, -2.44673, 1, 0, 0, 1, 1,
-0.4207511, -0.1141375, -0.5558951, 1, 0, 0, 1, 1,
-0.4200956, 0.8691911, 0.1639061, 1, 0, 0, 1, 1,
-0.415832, -0.2247682, -2.194542, 1, 0, 0, 1, 1,
-0.4142696, -0.812387, -3.317166, 1, 0, 0, 1, 1,
-0.4134738, 0.7494145, -0.4663564, 0, 0, 0, 1, 1,
-0.4057053, -0.0433704, -0.901566, 0, 0, 0, 1, 1,
-0.4051366, 0.757751, 0.2551366, 0, 0, 0, 1, 1,
-0.4046893, 0.02468018, -2.623232, 0, 0, 0, 1, 1,
-0.4004493, -0.7412152, -0.4919781, 0, 0, 0, 1, 1,
-0.3954232, 0.06287615, 0.8886154, 0, 0, 0, 1, 1,
-0.3884472, 0.1184578, -0.7200207, 0, 0, 0, 1, 1,
-0.3855252, 1.691535, -2.459387, 1, 1, 1, 1, 1,
-0.3835308, 1.624027, -0.9595625, 1, 1, 1, 1, 1,
-0.3828636, 0.2909311, 0.5821724, 1, 1, 1, 1, 1,
-0.3811572, 1.601995, -1.341597, 1, 1, 1, 1, 1,
-0.378832, -0.9518189, -3.687805, 1, 1, 1, 1, 1,
-0.377094, -0.2897512, -3.682149, 1, 1, 1, 1, 1,
-0.3746282, 0.03708186, -2.599853, 1, 1, 1, 1, 1,
-0.3682824, 0.7148954, -0.9089856, 1, 1, 1, 1, 1,
-0.3681895, -0.1536581, -1.091995, 1, 1, 1, 1, 1,
-0.3653306, 1.284141, 0.9162117, 1, 1, 1, 1, 1,
-0.3644097, 0.2321485, -0.6304772, 1, 1, 1, 1, 1,
-0.3599747, 0.1245106, -2.050339, 1, 1, 1, 1, 1,
-0.357937, -1.900384, -2.534261, 1, 1, 1, 1, 1,
-0.3569177, -1.292239, -3.48879, 1, 1, 1, 1, 1,
-0.3542703, -0.2611862, -1.574951, 1, 1, 1, 1, 1,
-0.3530611, -1.699372, -3.392112, 0, 0, 1, 1, 1,
-0.3527017, -1.009671, -3.12385, 1, 0, 0, 1, 1,
-0.3489117, -0.0808045, -2.750335, 1, 0, 0, 1, 1,
-0.3460591, -1.600903, -3.310997, 1, 0, 0, 1, 1,
-0.345202, 0.8421978, 1.383003, 1, 0, 0, 1, 1,
-0.3415882, -2.043698, -3.133396, 1, 0, 0, 1, 1,
-0.3415553, -0.1220976, -2.779311, 0, 0, 0, 1, 1,
-0.3405854, -1.665951, -2.527339, 0, 0, 0, 1, 1,
-0.3405653, -0.3055443, -2.697622, 0, 0, 0, 1, 1,
-0.3381186, -0.4789293, 0.1231979, 0, 0, 0, 1, 1,
-0.3298504, -0.6451786, -2.31237, 0, 0, 0, 1, 1,
-0.3263693, 2.049937, 1.172672, 0, 0, 0, 1, 1,
-0.3188324, -1.496637, -3.433547, 0, 0, 0, 1, 1,
-0.3178013, 0.2923208, -1.317579, 1, 1, 1, 1, 1,
-0.3165572, 0.2799957, -0.3886313, 1, 1, 1, 1, 1,
-0.3140478, 2.667116, 0.6617318, 1, 1, 1, 1, 1,
-0.3075341, -1.695428, -3.464019, 1, 1, 1, 1, 1,
-0.3057292, 0.6175977, 0.5533961, 1, 1, 1, 1, 1,
-0.3024054, 0.8942519, -0.3064993, 1, 1, 1, 1, 1,
-0.2986023, 0.1145543, -1.080989, 1, 1, 1, 1, 1,
-0.2950429, -0.2871762, -1.171862, 1, 1, 1, 1, 1,
-0.2914951, -0.3058447, -3.646348, 1, 1, 1, 1, 1,
-0.2904481, -0.7050105, -1.52383, 1, 1, 1, 1, 1,
-0.2875816, 0.2419577, -1.426458, 1, 1, 1, 1, 1,
-0.2846738, -0.7932145, -3.617839, 1, 1, 1, 1, 1,
-0.2816723, 0.9908472, -0.6753168, 1, 1, 1, 1, 1,
-0.2800387, -1.8108, -2.219256, 1, 1, 1, 1, 1,
-0.2761433, 2.02266, -0.02292664, 1, 1, 1, 1, 1,
-0.2746638, -0.634214, -3.636412, 0, 0, 1, 1, 1,
-0.2708619, 1.705886, -0.8028598, 1, 0, 0, 1, 1,
-0.2704373, 1.441926, -1.653029, 1, 0, 0, 1, 1,
-0.2689465, -0.1110948, -2.847452, 1, 0, 0, 1, 1,
-0.2681873, -1.076994, -1.938717, 1, 0, 0, 1, 1,
-0.2650636, 1.783311, -0.4003782, 1, 0, 0, 1, 1,
-0.2633476, 1.133749, -0.9339445, 0, 0, 0, 1, 1,
-0.2614002, 0.7203896, 1.938399, 0, 0, 0, 1, 1,
-0.2591329, -0.06845479, -0.9287959, 0, 0, 0, 1, 1,
-0.2554632, 1.783064, 1.072364, 0, 0, 0, 1, 1,
-0.2500609, -0.9147873, -3.395778, 0, 0, 0, 1, 1,
-0.2479665, 1.36132, 0.7413227, 0, 0, 0, 1, 1,
-0.2474259, 0.07551823, -1.88319, 0, 0, 0, 1, 1,
-0.2460062, -1.218379, -4.63699, 1, 1, 1, 1, 1,
-0.2421108, -1.056212, -3.742695, 1, 1, 1, 1, 1,
-0.2413488, -0.1532677, -3.686691, 1, 1, 1, 1, 1,
-0.2320482, -1.751499, -2.429744, 1, 1, 1, 1, 1,
-0.2311234, -0.06655603, -1.440864, 1, 1, 1, 1, 1,
-0.229951, -1.005108, -4.296237, 1, 1, 1, 1, 1,
-0.2278623, 0.9611066, 1.133211, 1, 1, 1, 1, 1,
-0.2276408, 0.5358902, 0.08309258, 1, 1, 1, 1, 1,
-0.2261021, -0.1735934, -1.539051, 1, 1, 1, 1, 1,
-0.2237194, 0.4693017, -0.6678176, 1, 1, 1, 1, 1,
-0.2211635, -0.9401484, -1.317545, 1, 1, 1, 1, 1,
-0.2163741, 0.1991346, -0.7898355, 1, 1, 1, 1, 1,
-0.2125242, -1.362557, -2.910818, 1, 1, 1, 1, 1,
-0.2121172, -0.3364591, -1.979121, 1, 1, 1, 1, 1,
-0.2100386, -0.2151836, -3.35842, 1, 1, 1, 1, 1,
-0.2061398, -1.347268, -3.628205, 0, 0, 1, 1, 1,
-0.205354, -2.069548, -3.420128, 1, 0, 0, 1, 1,
-0.1925334, 1.396148, 0.2479646, 1, 0, 0, 1, 1,
-0.1920395, -0.6773959, -4.333232, 1, 0, 0, 1, 1,
-0.1902908, -1.450523, -2.301892, 1, 0, 0, 1, 1,
-0.1898698, 0.4523276, 1.822463, 1, 0, 0, 1, 1,
-0.1890706, -0.07801981, -2.290099, 0, 0, 0, 1, 1,
-0.1818896, 0.6431718, -0.4764187, 0, 0, 0, 1, 1,
-0.1765754, 2.010717, -1.516241, 0, 0, 0, 1, 1,
-0.1723537, -0.5404637, -4.27626, 0, 0, 0, 1, 1,
-0.1708815, -0.8352957, -5.066201, 0, 0, 0, 1, 1,
-0.1657795, -1.784164, -4.335113, 0, 0, 0, 1, 1,
-0.1644681, -0.7756616, -2.892533, 0, 0, 0, 1, 1,
-0.1597352, 0.7270751, -1.469758, 1, 1, 1, 1, 1,
-0.1590158, -0.7350488, -4.807215, 1, 1, 1, 1, 1,
-0.1521682, -0.7208229, -3.197745, 1, 1, 1, 1, 1,
-0.1472331, 0.6319351, 0.1254149, 1, 1, 1, 1, 1,
-0.1457352, -0.5331017, -2.93646, 1, 1, 1, 1, 1,
-0.1427387, 0.3028196, -0.9562286, 1, 1, 1, 1, 1,
-0.1382535, 0.6144707, -1.155254, 1, 1, 1, 1, 1,
-0.1378425, -1.110626, -1.177268, 1, 1, 1, 1, 1,
-0.1369212, -0.5125652, -2.777997, 1, 1, 1, 1, 1,
-0.1360652, -0.5450789, -2.732496, 1, 1, 1, 1, 1,
-0.1347, -0.350905, -3.786502, 1, 1, 1, 1, 1,
-0.1341314, 0.8832428, -0.9421379, 1, 1, 1, 1, 1,
-0.130894, -0.1821736, -3.635568, 1, 1, 1, 1, 1,
-0.1290237, -0.1454117, -3.317081, 1, 1, 1, 1, 1,
-0.1220861, -0.3415768, -1.509679, 1, 1, 1, 1, 1,
-0.1157492, 0.8793909, -0.5533687, 0, 0, 1, 1, 1,
-0.1117228, -1.669838, -1.240639, 1, 0, 0, 1, 1,
-0.1032622, 0.8031368, 0.1451331, 1, 0, 0, 1, 1,
-0.1027879, -1.389664, -4.138733, 1, 0, 0, 1, 1,
-0.1018541, -0.8802063, -1.427063, 1, 0, 0, 1, 1,
-0.09890167, -0.02657965, -0.9533039, 1, 0, 0, 1, 1,
-0.09369165, -0.3455109, -2.738354, 0, 0, 0, 1, 1,
-0.09325963, 0.0003411397, -2.188162, 0, 0, 0, 1, 1,
-0.0882661, 0.8568626, 0.2060603, 0, 0, 0, 1, 1,
-0.0787826, 1.358553, 0.4224776, 0, 0, 0, 1, 1,
-0.07766684, 0.1321108, 1.274775, 0, 0, 0, 1, 1,
-0.07417837, -0.1404427, -1.669169, 0, 0, 0, 1, 1,
-0.07373699, -0.7538468, -3.037096, 0, 0, 0, 1, 1,
-0.07094359, 0.4758384, 0.2217493, 1, 1, 1, 1, 1,
-0.06981052, 0.7572642, -1.754191, 1, 1, 1, 1, 1,
-0.06939577, 1.81028, -1.274597, 1, 1, 1, 1, 1,
-0.06561112, 0.2866126, -0.6362899, 1, 1, 1, 1, 1,
-0.06541664, 0.3189474, 0.9119338, 1, 1, 1, 1, 1,
-0.06480883, 0.635932, -2.207934, 1, 1, 1, 1, 1,
-0.06172936, 0.3143736, -0.9997699, 1, 1, 1, 1, 1,
-0.0601428, -0.03049704, 0.3243787, 1, 1, 1, 1, 1,
-0.05855362, -2.06044, -3.266993, 1, 1, 1, 1, 1,
-0.05794855, 1.102686, 0.4737722, 1, 1, 1, 1, 1,
-0.05707883, 0.7344087, 0.6002568, 1, 1, 1, 1, 1,
-0.05629712, -0.1655189, -3.434933, 1, 1, 1, 1, 1,
-0.05564545, 0.9861699, 0.3537594, 1, 1, 1, 1, 1,
-0.04774006, 0.6026132, -0.3072946, 1, 1, 1, 1, 1,
-0.04755161, 0.9582944, -0.4081829, 1, 1, 1, 1, 1,
-0.04397438, -2.162473, -1.590876, 0, 0, 1, 1, 1,
-0.04030281, -1.489126, -1.984513, 1, 0, 0, 1, 1,
-0.03896156, -1.701213, -2.686954, 1, 0, 0, 1, 1,
-0.03872498, 2.250837, 0.8811394, 1, 0, 0, 1, 1,
-0.03685743, 0.8482531, 1.694021, 1, 0, 0, 1, 1,
-0.03576528, 2.043802, 0.2612089, 1, 0, 0, 1, 1,
-0.03507065, 0.1208644, 0.9665305, 0, 0, 0, 1, 1,
-0.02884715, -0.1972687, -3.124007, 0, 0, 0, 1, 1,
-0.02479401, -0.2779602, -1.791554, 0, 0, 0, 1, 1,
-0.01831091, 0.5764906, 2.555571, 0, 0, 0, 1, 1,
-0.01244347, -0.9409986, -4.483531, 0, 0, 0, 1, 1,
-0.0119579, -0.829607, -2.558951, 0, 0, 0, 1, 1,
-0.005674416, 0.1845663, -0.6719776, 0, 0, 0, 1, 1,
-0.000688271, 1.001942, 1.288296, 1, 1, 1, 1, 1,
-0.0004760344, 1.097296, 1.181628, 1, 1, 1, 1, 1,
-4.122496e-05, 0.9709392, -0.8954887, 1, 1, 1, 1, 1,
0.003507121, -0.7468512, 3.242708, 1, 1, 1, 1, 1,
0.005624105, -0.07854034, 4.025292, 1, 1, 1, 1, 1,
0.005735466, -0.26348, 3.343972, 1, 1, 1, 1, 1,
0.007277979, 1.232413, 0.1169772, 1, 1, 1, 1, 1,
0.01013228, -0.02067547, 3.77214, 1, 1, 1, 1, 1,
0.01156517, -0.2186447, 2.461124, 1, 1, 1, 1, 1,
0.01180749, 1.260811, -0.5269895, 1, 1, 1, 1, 1,
0.01323121, 0.5678344, 1.464763, 1, 1, 1, 1, 1,
0.02178571, 0.2813727, 0.1487057, 1, 1, 1, 1, 1,
0.02321212, 1.378166, 0.8629638, 1, 1, 1, 1, 1,
0.02670025, 0.05802519, 1.158984, 1, 1, 1, 1, 1,
0.03568593, -0.1275777, 3.455189, 1, 1, 1, 1, 1,
0.03875571, -1.188295, 2.538548, 0, 0, 1, 1, 1,
0.03895946, 2.006416, -0.6608918, 1, 0, 0, 1, 1,
0.04116944, 1.780388, 0.7861375, 1, 0, 0, 1, 1,
0.04419674, -0.3570544, 2.354155, 1, 0, 0, 1, 1,
0.04966353, -0.8913732, 4.22325, 1, 0, 0, 1, 1,
0.05254807, 1.575269, -0.01335855, 1, 0, 0, 1, 1,
0.05506748, -0.8702937, 3.623976, 0, 0, 0, 1, 1,
0.05757446, 0.2409863, 0.418164, 0, 0, 0, 1, 1,
0.06047878, -0.4592137, 1.887796, 0, 0, 0, 1, 1,
0.06094127, 1.657954, -2.076484, 0, 0, 0, 1, 1,
0.06460384, -1.430127, 4.482719, 0, 0, 0, 1, 1,
0.06807938, -0.2420959, 2.654862, 0, 0, 0, 1, 1,
0.07075041, -0.03392428, 0.2053668, 0, 0, 0, 1, 1,
0.07451659, -0.03518782, 1.241483, 1, 1, 1, 1, 1,
0.07876316, 0.9594166, 1.227018, 1, 1, 1, 1, 1,
0.07878812, -2.85413, 1.851363, 1, 1, 1, 1, 1,
0.08875386, -1.086163, 3.49236, 1, 1, 1, 1, 1,
0.09363855, 0.005035608, 1.187434, 1, 1, 1, 1, 1,
0.09946977, 0.9073846, 0.733098, 1, 1, 1, 1, 1,
0.1002961, 0.2698167, 0.1641498, 1, 1, 1, 1, 1,
0.100941, 0.1235906, -1.109357, 1, 1, 1, 1, 1,
0.1041562, -0.6396397, 2.147723, 1, 1, 1, 1, 1,
0.1094705, 0.4206145, -0.8940729, 1, 1, 1, 1, 1,
0.1106371, -1.944202, 2.660708, 1, 1, 1, 1, 1,
0.1134269, -0.5194128, 2.581912, 1, 1, 1, 1, 1,
0.1228441, -0.3612176, 2.632312, 1, 1, 1, 1, 1,
0.1247296, 0.7207932, -0.8774422, 1, 1, 1, 1, 1,
0.1262162, -0.02251226, 1.318636, 1, 1, 1, 1, 1,
0.1291742, 0.8460875, 0.05172039, 0, 0, 1, 1, 1,
0.1303923, -0.0627996, 2.442452, 1, 0, 0, 1, 1,
0.132294, -0.03604734, 0.7239338, 1, 0, 0, 1, 1,
0.1329212, -1.494031, 4.726306, 1, 0, 0, 1, 1,
0.1357125, -0.05868246, 0.1041661, 1, 0, 0, 1, 1,
0.1379972, 0.5018306, -0.101106, 1, 0, 0, 1, 1,
0.140509, 1.29421, 0.5082064, 0, 0, 0, 1, 1,
0.1411152, -0.4990326, 0.3959461, 0, 0, 0, 1, 1,
0.1423158, -0.9307498, 2.032762, 0, 0, 0, 1, 1,
0.1471888, 0.0007244232, 1.185368, 0, 0, 0, 1, 1,
0.1504181, -1.771573, 3.668357, 0, 0, 0, 1, 1,
0.1518749, 0.137498, 1.295409, 0, 0, 0, 1, 1,
0.1538647, -0.1862875, 3.240464, 0, 0, 0, 1, 1,
0.1541821, -1.190381, 1.362791, 1, 1, 1, 1, 1,
0.165115, -0.2533917, 0.5347346, 1, 1, 1, 1, 1,
0.1652737, 1.846862, -0.8494185, 1, 1, 1, 1, 1,
0.1657739, -1.194664, 1.997199, 1, 1, 1, 1, 1,
0.1663315, -0.1787563, 2.375981, 1, 1, 1, 1, 1,
0.1679224, 0.04550207, 0.09191843, 1, 1, 1, 1, 1,
0.1695943, 2.538763, -0.3165925, 1, 1, 1, 1, 1,
0.1707268, 1.457051, 0.1854619, 1, 1, 1, 1, 1,
0.1736273, 0.4958477, -0.821498, 1, 1, 1, 1, 1,
0.1741484, -1.222674, 2.412123, 1, 1, 1, 1, 1,
0.176083, 0.6183358, -0.1657933, 1, 1, 1, 1, 1,
0.1767983, -0.6996815, 3.247256, 1, 1, 1, 1, 1,
0.1768463, 1.384098, 1.558695, 1, 1, 1, 1, 1,
0.1771127, -0.3171227, 1.749653, 1, 1, 1, 1, 1,
0.1790508, 0.1599469, 2.1069, 1, 1, 1, 1, 1,
0.1798745, -1.397522, 4.050788, 0, 0, 1, 1, 1,
0.1803238, 0.833115, -0.4417703, 1, 0, 0, 1, 1,
0.1826327, -1.538984, 3.249886, 1, 0, 0, 1, 1,
0.1935674, -0.0939552, 1.247027, 1, 0, 0, 1, 1,
0.1949352, -0.02176571, 1.738413, 1, 0, 0, 1, 1,
0.1983321, 1.741251, 0.05319484, 1, 0, 0, 1, 1,
0.1987842, 0.4327397, 0.8528565, 0, 0, 0, 1, 1,
0.2027597, 0.536219, 0.3177127, 0, 0, 0, 1, 1,
0.2029931, -0.2306215, 2.255323, 0, 0, 0, 1, 1,
0.2032122, -1.308426, 3.39925, 0, 0, 0, 1, 1,
0.2034072, 1.58876, -0.419157, 0, 0, 0, 1, 1,
0.204276, -0.3898346, 1.259868, 0, 0, 0, 1, 1,
0.2068304, 0.09109861, 1.217527, 0, 0, 0, 1, 1,
0.2096391, -0.9913258, 2.492342, 1, 1, 1, 1, 1,
0.2144596, -0.4271702, 5.112873, 1, 1, 1, 1, 1,
0.2210004, 2.030898, 0.2712018, 1, 1, 1, 1, 1,
0.2241251, 1.259246, 0.05440916, 1, 1, 1, 1, 1,
0.2258107, 0.7320716, 0.2211076, 1, 1, 1, 1, 1,
0.2263427, -1.048774, 4.601601, 1, 1, 1, 1, 1,
0.2272921, 0.4731628, 2.188579, 1, 1, 1, 1, 1,
0.2334628, -0.4360432, 2.519137, 1, 1, 1, 1, 1,
0.2410818, -1.211034, 3.091749, 1, 1, 1, 1, 1,
0.2446429, -1.070074, 1.966671, 1, 1, 1, 1, 1,
0.2447151, -1.638237, 2.531159, 1, 1, 1, 1, 1,
0.2454352, -0.3221498, 2.758909, 1, 1, 1, 1, 1,
0.2480414, 0.8576201, 0.3876754, 1, 1, 1, 1, 1,
0.2512576, -0.7688522, 2.39217, 1, 1, 1, 1, 1,
0.2539188, 0.04951757, 1.465434, 1, 1, 1, 1, 1,
0.2542259, 0.7978035, -1.33579, 0, 0, 1, 1, 1,
0.2543219, -0.2969636, 2.004808, 1, 0, 0, 1, 1,
0.2688541, 1.141551, 0.5857021, 1, 0, 0, 1, 1,
0.2701594, 0.09967484, -0.1927482, 1, 0, 0, 1, 1,
0.2738928, 1.469596, -1.803303, 1, 0, 0, 1, 1,
0.2754321, 0.7742306, -0.5247068, 1, 0, 0, 1, 1,
0.2758117, 0.5359682, 1.519352, 0, 0, 0, 1, 1,
0.2763298, 2.005509, -0.02578788, 0, 0, 0, 1, 1,
0.2779675, -1.74471, 4.277462, 0, 0, 0, 1, 1,
0.2827213, -0.2926127, 1.746584, 0, 0, 0, 1, 1,
0.2857484, 0.9006701, -1.468663, 0, 0, 0, 1, 1,
0.2940553, -1.271255, 1.620969, 0, 0, 0, 1, 1,
0.298207, 0.984906, 0.9936417, 0, 0, 0, 1, 1,
0.2995043, 0.355539, 0.8288894, 1, 1, 1, 1, 1,
0.301146, 0.2476734, 1.856664, 1, 1, 1, 1, 1,
0.3029059, 0.7743844, 0.6856479, 1, 1, 1, 1, 1,
0.3031166, 0.4915999, 0.3226156, 1, 1, 1, 1, 1,
0.3044738, 2.250453, 1.41722, 1, 1, 1, 1, 1,
0.3064404, -0.7914184, 3.138189, 1, 1, 1, 1, 1,
0.3096805, 0.5702505, 0.2013449, 1, 1, 1, 1, 1,
0.3101241, 1.605903, 1.424155, 1, 1, 1, 1, 1,
0.3171027, 0.2906777, 1.575345, 1, 1, 1, 1, 1,
0.3194791, 2.617707, 0.7479806, 1, 1, 1, 1, 1,
0.3231274, 0.3854168, 2.377248, 1, 1, 1, 1, 1,
0.3233906, -1.405354, 3.990654, 1, 1, 1, 1, 1,
0.3248352, -1.314951, 1.756334, 1, 1, 1, 1, 1,
0.3260083, -0.08338799, 1.878678, 1, 1, 1, 1, 1,
0.3269444, 1.967501, 0.08066135, 1, 1, 1, 1, 1,
0.3331575, 1.197359, -0.4359511, 0, 0, 1, 1, 1,
0.3360931, 0.339217, 1.623584, 1, 0, 0, 1, 1,
0.3380455, 2.470178, 1.680448, 1, 0, 0, 1, 1,
0.3453029, 0.5337673, 0.3333246, 1, 0, 0, 1, 1,
0.3453483, 0.2809392, 1.60315, 1, 0, 0, 1, 1,
0.3500832, -0.01358493, 1.080038, 1, 0, 0, 1, 1,
0.3515914, 0.6164098, 1.027677, 0, 0, 0, 1, 1,
0.3522484, 0.3634456, 1.660246, 0, 0, 0, 1, 1,
0.3525113, -0.176147, 1.267213, 0, 0, 0, 1, 1,
0.3544131, -0.09649765, 1.136454, 0, 0, 0, 1, 1,
0.3552034, 1.231279, -0.9849551, 0, 0, 0, 1, 1,
0.3565046, -0.1716716, 0.4035656, 0, 0, 0, 1, 1,
0.3594719, 0.1940187, -0.0738896, 0, 0, 0, 1, 1,
0.3614994, 2.102303, -1.181647, 1, 1, 1, 1, 1,
0.3632074, 1.185254, 0.1246516, 1, 1, 1, 1, 1,
0.3655277, 1.222341, 0.1915837, 1, 1, 1, 1, 1,
0.3660709, 0.8921071, 0.6426359, 1, 1, 1, 1, 1,
0.3673427, -0.43551, 3.692252, 1, 1, 1, 1, 1,
0.3697424, -1.234942, 3.298035, 1, 1, 1, 1, 1,
0.3699152, -0.5247067, 1.190794, 1, 1, 1, 1, 1,
0.3709576, -1.034641, 2.003087, 1, 1, 1, 1, 1,
0.377672, 0.7506389, -0.4117511, 1, 1, 1, 1, 1,
0.3785131, -0.1247853, 2.128981, 1, 1, 1, 1, 1,
0.3801964, 0.6514922, 1.044128, 1, 1, 1, 1, 1,
0.3865796, 0.6776191, 1.943407, 1, 1, 1, 1, 1,
0.3880462, 0.3520077, 1.668942, 1, 1, 1, 1, 1,
0.3938176, 1.050815, -1.280601, 1, 1, 1, 1, 1,
0.3940445, -1.520735, 2.817465, 1, 1, 1, 1, 1,
0.396365, 1.655805, -1.522356, 0, 0, 1, 1, 1,
0.4009145, 0.9632322, 2.163407, 1, 0, 0, 1, 1,
0.4038979, -0.7995852, 2.458462, 1, 0, 0, 1, 1,
0.4060005, -1.0014, 1.440236, 1, 0, 0, 1, 1,
0.4075691, -0.3112954, 1.747777, 1, 0, 0, 1, 1,
0.4114853, -1.596027, 3.705367, 1, 0, 0, 1, 1,
0.417304, 1.485508, -2.575567, 0, 0, 0, 1, 1,
0.4226793, -0.06870805, 0.6191407, 0, 0, 0, 1, 1,
0.424207, 0.364962, 1.713511, 0, 0, 0, 1, 1,
0.4255966, -1.948567, 2.558674, 0, 0, 0, 1, 1,
0.4312972, 0.1138519, 0.8713169, 0, 0, 0, 1, 1,
0.4314858, -0.5867881, 3.333098, 0, 0, 0, 1, 1,
0.4489892, -3.345192, 4.548001, 0, 0, 0, 1, 1,
0.4565563, 0.3918912, 0.3551022, 1, 1, 1, 1, 1,
0.4576735, 0.2094907, 2.151322, 1, 1, 1, 1, 1,
0.4585658, -0.549343, 1.10815, 1, 1, 1, 1, 1,
0.4589416, -0.6399421, 2.375853, 1, 1, 1, 1, 1,
0.4594505, 0.31155, 1.467821, 1, 1, 1, 1, 1,
0.4691547, -0.792586, 2.43554, 1, 1, 1, 1, 1,
0.4700879, 1.253607, 2.063181, 1, 1, 1, 1, 1,
0.4762071, -0.932079, 4.323655, 1, 1, 1, 1, 1,
0.476397, -0.7417121, 2.289819, 1, 1, 1, 1, 1,
0.4785872, 0.7105905, 0.2510323, 1, 1, 1, 1, 1,
0.4795986, -1.130303, 1.594165, 1, 1, 1, 1, 1,
0.4798378, 1.137352, -0.2603843, 1, 1, 1, 1, 1,
0.4830821, 0.5885692, 1.188517, 1, 1, 1, 1, 1,
0.4838501, 0.1053196, 0.8012472, 1, 1, 1, 1, 1,
0.4841868, 1.747675, -1.863849, 1, 1, 1, 1, 1,
0.4843543, 0.85711, -0.284293, 0, 0, 1, 1, 1,
0.485965, -0.06434834, 1.734083, 1, 0, 0, 1, 1,
0.4886514, -0.4114628, 2.233593, 1, 0, 0, 1, 1,
0.4922913, 0.3152608, -0.3445507, 1, 0, 0, 1, 1,
0.4979636, -0.3591912, 3.85778, 1, 0, 0, 1, 1,
0.4986014, -0.542616, 1.107246, 1, 0, 0, 1, 1,
0.4990638, -0.2549012, 1.089072, 0, 0, 0, 1, 1,
0.4993884, 0.6893443, 1.680139, 0, 0, 0, 1, 1,
0.5001929, 0.4253982, 3.090179, 0, 0, 0, 1, 1,
0.5002671, 0.6224704, -0.4924, 0, 0, 0, 1, 1,
0.5023245, 0.1142331, 3.312698, 0, 0, 0, 1, 1,
0.5024165, -0.349957, 2.725534, 0, 0, 0, 1, 1,
0.5115638, 0.296789, 0.4636001, 0, 0, 0, 1, 1,
0.5152896, -0.136539, 0.6858835, 1, 1, 1, 1, 1,
0.5179391, -0.5371715, 1.947208, 1, 1, 1, 1, 1,
0.5196943, -0.4225138, 1.25184, 1, 1, 1, 1, 1,
0.5236789, -0.4338822, 2.863655, 1, 1, 1, 1, 1,
0.5272207, 2.295153, -0.4141675, 1, 1, 1, 1, 1,
0.5300096, 0.8311094, -0.3041397, 1, 1, 1, 1, 1,
0.5302408, -0.4192067, 2.286983, 1, 1, 1, 1, 1,
0.5336002, 0.2784908, 1.424886, 1, 1, 1, 1, 1,
0.5354004, 1.097101, 1.506865, 1, 1, 1, 1, 1,
0.5396354, -0.9056781, 2.815776, 1, 1, 1, 1, 1,
0.5413324, -0.1315037, 2.284561, 1, 1, 1, 1, 1,
0.5419251, -0.3175453, 1.680685, 1, 1, 1, 1, 1,
0.5422853, -1.743473, 1.916789, 1, 1, 1, 1, 1,
0.5452154, -0.4501874, 2.818146, 1, 1, 1, 1, 1,
0.5457986, -0.4394889, 0.4177804, 1, 1, 1, 1, 1,
0.5462891, 1.145951, -0.5092244, 0, 0, 1, 1, 1,
0.5463392, -1.941081, 3.709381, 1, 0, 0, 1, 1,
0.551076, -1.263127, 3.781261, 1, 0, 0, 1, 1,
0.5514513, -1.212925, 3.348641, 1, 0, 0, 1, 1,
0.5538064, -1.298511, 2.576705, 1, 0, 0, 1, 1,
0.5629733, 0.3870391, 0.3981015, 1, 0, 0, 1, 1,
0.566031, -1.138447, 3.304662, 0, 0, 0, 1, 1,
0.5661629, -0.6753965, 1.74909, 0, 0, 0, 1, 1,
0.5693861, 0.4495331, 1.189369, 0, 0, 0, 1, 1,
0.5713208, 0.8710643, 0.0169412, 0, 0, 0, 1, 1,
0.5763907, 0.6004941, 2.451264, 0, 0, 0, 1, 1,
0.5799426, -1.069226, 2.801404, 0, 0, 0, 1, 1,
0.581288, 0.5219806, 2.073627, 0, 0, 0, 1, 1,
0.5836934, 0.05860886, 1.085477, 1, 1, 1, 1, 1,
0.5852746, -1.540508, 2.98601, 1, 1, 1, 1, 1,
0.5889221, -0.8134135, 1.185794, 1, 1, 1, 1, 1,
0.5903813, -0.5228519, 3.747152, 1, 1, 1, 1, 1,
0.5983286, 0.4931308, -0.4721352, 1, 1, 1, 1, 1,
0.6002135, 0.04356012, 0.6123594, 1, 1, 1, 1, 1,
0.6015261, -1.748284, 2.650213, 1, 1, 1, 1, 1,
0.6072152, -0.3596125, 3.491912, 1, 1, 1, 1, 1,
0.6143087, 1.282477, -0.7750936, 1, 1, 1, 1, 1,
0.6201297, -1.278754, 3.319077, 1, 1, 1, 1, 1,
0.6243327, 0.1995655, 0.9691378, 1, 1, 1, 1, 1,
0.6252801, 0.9651533, 1.673527, 1, 1, 1, 1, 1,
0.6255129, -0.2187082, 0.3500746, 1, 1, 1, 1, 1,
0.6372018, -0.0462302, 1.89651, 1, 1, 1, 1, 1,
0.6424304, 1.063774, 0.8485784, 1, 1, 1, 1, 1,
0.6514391, 0.7927819, -0.2918794, 0, 0, 1, 1, 1,
0.652983, 1.264124, 1.126786, 1, 0, 0, 1, 1,
0.6554609, -0.7870491, 3.877334, 1, 0, 0, 1, 1,
0.6605664, -0.1892267, 3.86069, 1, 0, 0, 1, 1,
0.6639665, -0.914664, 3.107184, 1, 0, 0, 1, 1,
0.6744261, 0.052985, 1.911771, 1, 0, 0, 1, 1,
0.679037, 0.1907439, -0.003274193, 0, 0, 0, 1, 1,
0.6823996, -0.4600141, 3.809999, 0, 0, 0, 1, 1,
0.6869835, 0.1751927, -0.5074763, 0, 0, 0, 1, 1,
0.6896091, 0.4290671, 1.883742, 0, 0, 0, 1, 1,
0.6900541, 0.8680742, 0.08512907, 0, 0, 0, 1, 1,
0.6960586, 1.052383, 0.4882747, 0, 0, 0, 1, 1,
0.6982962, -0.3985295, 1.364411, 0, 0, 0, 1, 1,
0.6986586, 0.5620418, 0.4700105, 1, 1, 1, 1, 1,
0.6997923, 0.1195643, 1.724863, 1, 1, 1, 1, 1,
0.7001035, 0.5807652, 0.765304, 1, 1, 1, 1, 1,
0.7003315, -0.21749, 2.797942, 1, 1, 1, 1, 1,
0.7021288, -1.128415, 2.096543, 1, 1, 1, 1, 1,
0.7082533, 0.6059789, 0.4583899, 1, 1, 1, 1, 1,
0.7087086, -1.26869, 2.484783, 1, 1, 1, 1, 1,
0.7090118, 1.091351, 0.8624392, 1, 1, 1, 1, 1,
0.712769, 0.76628, 0.7964782, 1, 1, 1, 1, 1,
0.7206411, 0.05583843, 0.5706464, 1, 1, 1, 1, 1,
0.7352251, 1.29143, -0.9781107, 1, 1, 1, 1, 1,
0.7362263, 0.345628, 0.4414293, 1, 1, 1, 1, 1,
0.7412163, 0.9215022, -0.358337, 1, 1, 1, 1, 1,
0.7424325, -1.076971, 0.6976942, 1, 1, 1, 1, 1,
0.7425843, 0.3603068, 2.610129, 1, 1, 1, 1, 1,
0.7463278, 0.8851185, 0.562745, 0, 0, 1, 1, 1,
0.7490661, 0.6833488, -0.06230401, 1, 0, 0, 1, 1,
0.7497617, 1.200068, 0.6575716, 1, 0, 0, 1, 1,
0.752292, 1.540674, 0.923599, 1, 0, 0, 1, 1,
0.7530759, -0.626832, 3.152303, 1, 0, 0, 1, 1,
0.7557208, -0.5392333, 1.698649, 1, 0, 0, 1, 1,
0.7590045, 0.9555655, 1.056607, 0, 0, 0, 1, 1,
0.7593407, -0.4412999, 1.803829, 0, 0, 0, 1, 1,
0.7616736, -0.4184224, 2.194254, 0, 0, 0, 1, 1,
0.7756549, -0.3191709, 2.804856, 0, 0, 0, 1, 1,
0.777878, -1.761271, 3.13675, 0, 0, 0, 1, 1,
0.7794964, 1.431708, 2.818216, 0, 0, 0, 1, 1,
0.7806674, 1.155593, 0.5649263, 0, 0, 0, 1, 1,
0.7818931, -0.7997297, 0.8115821, 1, 1, 1, 1, 1,
0.7861108, -0.904176, 2.035687, 1, 1, 1, 1, 1,
0.7874492, 0.1070796, 1.133806, 1, 1, 1, 1, 1,
0.7895752, 0.714916, 2.891874, 1, 1, 1, 1, 1,
0.7908211, -0.9733722, 5.931173, 1, 1, 1, 1, 1,
0.7913336, -0.07501463, 1.984055, 1, 1, 1, 1, 1,
0.7922204, 0.04424521, 2.542653, 1, 1, 1, 1, 1,
0.7943448, 0.233034, 0.954683, 1, 1, 1, 1, 1,
0.8008833, -0.9776114, 1.90427, 1, 1, 1, 1, 1,
0.8008979, -2.090198, 2.054079, 1, 1, 1, 1, 1,
0.807879, 1.765629, -0.1492, 1, 1, 1, 1, 1,
0.8112167, -0.8151864, 2.196707, 1, 1, 1, 1, 1,
0.8116407, 0.5577397, -0.4688918, 1, 1, 1, 1, 1,
0.8137528, 0.3920344, 1.062927, 1, 1, 1, 1, 1,
0.817022, -1.37873, 3.448474, 1, 1, 1, 1, 1,
0.8176803, -0.986051, 3.454228, 0, 0, 1, 1, 1,
0.8194612, -0.8515062, 2.101757, 1, 0, 0, 1, 1,
0.8206725, -0.5596687, 4.295959, 1, 0, 0, 1, 1,
0.8223056, -1.603669, 1.918361, 1, 0, 0, 1, 1,
0.825979, 0.3860829, 1.599028, 1, 0, 0, 1, 1,
0.8461012, 0.1655237, 2.065807, 1, 0, 0, 1, 1,
0.8461027, -0.8377035, 2.525387, 0, 0, 0, 1, 1,
0.8483485, 0.9135512, -0.3570012, 0, 0, 0, 1, 1,
0.8490497, 1.190974, 0.5601649, 0, 0, 0, 1, 1,
0.8501851, -1.747304, 3.321382, 0, 0, 0, 1, 1,
0.851629, -1.543826, 2.773978, 0, 0, 0, 1, 1,
0.8519866, 1.081411, 0.5031957, 0, 0, 0, 1, 1,
0.8540852, -0.81372, 1.334862, 0, 0, 0, 1, 1,
0.8584727, 0.1541564, 1.705421, 1, 1, 1, 1, 1,
0.8596392, 0.05401886, -0.7257569, 1, 1, 1, 1, 1,
0.8603321, -0.02165748, 0.9584679, 1, 1, 1, 1, 1,
0.8690468, -0.5132049, 1.199139, 1, 1, 1, 1, 1,
0.8736483, 1.782176, 0.6267784, 1, 1, 1, 1, 1,
0.8821573, -0.2201722, 0.9415448, 1, 1, 1, 1, 1,
0.8863505, 0.9059272, -0.4010633, 1, 1, 1, 1, 1,
0.8908505, -0.2296966, 2.181519, 1, 1, 1, 1, 1,
0.899792, 0.4251165, 0.4794022, 1, 1, 1, 1, 1,
0.9010606, -0.04022355, 1.807281, 1, 1, 1, 1, 1,
0.9130828, 0.1120935, 1.572999, 1, 1, 1, 1, 1,
0.9164227, 1.252818, -0.5226615, 1, 1, 1, 1, 1,
0.9172598, 0.5713778, 1.551698, 1, 1, 1, 1, 1,
0.928597, 0.9821035, 0.477165, 1, 1, 1, 1, 1,
0.9323349, 0.4734964, -0.05947033, 1, 1, 1, 1, 1,
0.9338933, 0.05247293, 1.97413, 0, 0, 1, 1, 1,
0.9404301, 0.2877692, 0.5704014, 1, 0, 0, 1, 1,
0.941426, -0.6744646, 0.8006304, 1, 0, 0, 1, 1,
0.9447588, 1.703241, 0.8807955, 1, 0, 0, 1, 1,
0.945304, -0.8087114, 2.270417, 1, 0, 0, 1, 1,
0.9470559, 1.628237, 0.8881285, 1, 0, 0, 1, 1,
0.9517283, -0.2872384, 1.551788, 0, 0, 0, 1, 1,
0.9587308, 1.356126, 0.376467, 0, 0, 0, 1, 1,
0.9672473, 0.0838652, 0.6529842, 0, 0, 0, 1, 1,
0.9710969, -0.9986351, 2.186951, 0, 0, 0, 1, 1,
0.9900733, 0.1141689, 1.160092, 0, 0, 0, 1, 1,
0.9984198, 1.39693, 0.1826226, 0, 0, 0, 1, 1,
1.002842, 0.2081462, 0.5557317, 0, 0, 0, 1, 1,
1.009488, 0.7938712, 0.05641495, 1, 1, 1, 1, 1,
1.010409, 0.2537404, 1.19616, 1, 1, 1, 1, 1,
1.018917, -0.1230144, 2.241254, 1, 1, 1, 1, 1,
1.019137, -0.8187426, 4.068894, 1, 1, 1, 1, 1,
1.021404, 1.556037, 2.31322, 1, 1, 1, 1, 1,
1.02392, 0.7775543, 2.383445, 1, 1, 1, 1, 1,
1.02836, -0.507776, 2.367746, 1, 1, 1, 1, 1,
1.03892, 1.231462, 1.407571, 1, 1, 1, 1, 1,
1.039132, 0.4571706, 2.195875, 1, 1, 1, 1, 1,
1.039757, 0.7564847, 1.443715, 1, 1, 1, 1, 1,
1.044755, -0.1464621, 1.581215, 1, 1, 1, 1, 1,
1.04935, 0.7887627, 1.609273, 1, 1, 1, 1, 1,
1.051965, 0.3223738, 1.750501, 1, 1, 1, 1, 1,
1.063491, -0.8755974, 1.127258, 1, 1, 1, 1, 1,
1.064764, 0.3326635, 1.579983, 1, 1, 1, 1, 1,
1.067405, 0.4621608, 2.071197, 0, 0, 1, 1, 1,
1.080673, -0.05907265, 1.375499, 1, 0, 0, 1, 1,
1.08809, 0.3662827, 0.2659215, 1, 0, 0, 1, 1,
1.094328, -0.6314252, 1.549246, 1, 0, 0, 1, 1,
1.097033, -0.05628791, 2.939382, 1, 0, 0, 1, 1,
1.101945, -0.2562731, 0.2717491, 1, 0, 0, 1, 1,
1.107729, 0.3838843, 2.107128, 0, 0, 0, 1, 1,
1.107837, 0.3629765, 2.432065, 0, 0, 0, 1, 1,
1.110858, 2.996042, -0.06495098, 0, 0, 0, 1, 1,
1.113827, -1.392012, 1.932052, 0, 0, 0, 1, 1,
1.114886, -0.8040833, 1.853261, 0, 0, 0, 1, 1,
1.122413, -0.7093866, 2.697846, 0, 0, 0, 1, 1,
1.127536, -1.35381, 1.69993, 0, 0, 0, 1, 1,
1.134566, -0.604003, 2.217416, 1, 1, 1, 1, 1,
1.139135, 1.061243, 0.9362773, 1, 1, 1, 1, 1,
1.140127, 1.539554, 1.086696, 1, 1, 1, 1, 1,
1.14324, 0.7478926, 0.5065164, 1, 1, 1, 1, 1,
1.145209, -1.215917, 2.139319, 1, 1, 1, 1, 1,
1.145311, 0.05830869, 1.083985, 1, 1, 1, 1, 1,
1.146743, 0.2251818, 1.002019, 1, 1, 1, 1, 1,
1.151115, 1.919091, -0.0001606394, 1, 1, 1, 1, 1,
1.151884, 0.2905848, 1.866275, 1, 1, 1, 1, 1,
1.169233, 1.173339, 1.590175, 1, 1, 1, 1, 1,
1.170244, -1.930729, 0.1915208, 1, 1, 1, 1, 1,
1.172545, -0.5832793, 1.847691, 1, 1, 1, 1, 1,
1.179328, 2.082486, 2.085123, 1, 1, 1, 1, 1,
1.180805, 0.3157751, 0.7110755, 1, 1, 1, 1, 1,
1.19086, 0.003783928, 2.429212, 1, 1, 1, 1, 1,
1.195016, -0.9199651, -0.7423802, 0, 0, 1, 1, 1,
1.198983, 0.8147646, 1.894181, 1, 0, 0, 1, 1,
1.201154, 1.30106, 2.694698, 1, 0, 0, 1, 1,
1.205827, 0.8628507, 3.315091, 1, 0, 0, 1, 1,
1.209659, 0.1063433, 1.679289, 1, 0, 0, 1, 1,
1.210797, -1.181846, 2.562162, 1, 0, 0, 1, 1,
1.219556, -0.1444548, 1.048849, 0, 0, 0, 1, 1,
1.230854, -0.9215554, 2.466552, 0, 0, 0, 1, 1,
1.2374, 0.9064775, 0.08428796, 0, 0, 0, 1, 1,
1.238654, 1.045204, 1.517726, 0, 0, 0, 1, 1,
1.246567, -1.376141, 2.017561, 0, 0, 0, 1, 1,
1.248096, -1.230694, 3.993824, 0, 0, 0, 1, 1,
1.248621, 1.038749, 0.506449, 0, 0, 0, 1, 1,
1.256502, 0.7251813, 1.45125, 1, 1, 1, 1, 1,
1.272816, -0.8609365, 1.989376, 1, 1, 1, 1, 1,
1.286321, -0.5223866, 4.536357, 1, 1, 1, 1, 1,
1.297128, 0.8165271, 1.81632, 1, 1, 1, 1, 1,
1.312107, 0.6808958, 1.513493, 1, 1, 1, 1, 1,
1.31211, -2.332151, 2.470017, 1, 1, 1, 1, 1,
1.313772, -0.7798122, 3.504842, 1, 1, 1, 1, 1,
1.316466, -0.815959, 1.752698, 1, 1, 1, 1, 1,
1.321462, 0.7704809, 1.550909, 1, 1, 1, 1, 1,
1.323351, -1.042592, 1.915233, 1, 1, 1, 1, 1,
1.325131, 0.3029546, 1.364941, 1, 1, 1, 1, 1,
1.32648, -0.4323056, 2.22189, 1, 1, 1, 1, 1,
1.333281, -0.5779485, 3.252922, 1, 1, 1, 1, 1,
1.336516, -0.1445294, 2.571702, 1, 1, 1, 1, 1,
1.342901, 2.160396, 1.763273, 1, 1, 1, 1, 1,
1.34712, -0.7466552, 1.429773, 0, 0, 1, 1, 1,
1.362079, 1.469796, 0.530938, 1, 0, 0, 1, 1,
1.364492, 0.2895877, 1.268703, 1, 0, 0, 1, 1,
1.371774, -0.1501576, 1.701409, 1, 0, 0, 1, 1,
1.374691, -1.199219, 4.61553, 1, 0, 0, 1, 1,
1.37869, 0.680539, 1.984748, 1, 0, 0, 1, 1,
1.380339, 0.2146599, 0.9076871, 0, 0, 0, 1, 1,
1.390481, 0.2443961, 3.372773, 0, 0, 0, 1, 1,
1.392728, 0.4048991, 1.120716, 0, 0, 0, 1, 1,
1.406208, 2.335116, 1.743474, 0, 0, 0, 1, 1,
1.409213, 1.079156, 2.140211, 0, 0, 0, 1, 1,
1.414629, 0.6535445, -1.288591, 0, 0, 0, 1, 1,
1.415118, 0.5495887, 3.321826, 0, 0, 0, 1, 1,
1.423529, 0.5920299, 0.9087043, 1, 1, 1, 1, 1,
1.425832, 0.5527481, 2.748154, 1, 1, 1, 1, 1,
1.449492, 0.1562491, 1.445747, 1, 1, 1, 1, 1,
1.451063, 0.09937239, 1.753312, 1, 1, 1, 1, 1,
1.460155, -0.6896034, 2.591127, 1, 1, 1, 1, 1,
1.462346, 0.0951986, 2.030595, 1, 1, 1, 1, 1,
1.466123, -0.4899408, 1.600863, 1, 1, 1, 1, 1,
1.473111, 0.591466, 1.261134, 1, 1, 1, 1, 1,
1.490733, -0.06521965, 2.64029, 1, 1, 1, 1, 1,
1.508667, -0.1954357, 1.234293, 1, 1, 1, 1, 1,
1.517089, 0.3909108, 0.6942037, 1, 1, 1, 1, 1,
1.520957, 1.669251, 2.2123, 1, 1, 1, 1, 1,
1.531435, 1.12612, 0.6202987, 1, 1, 1, 1, 1,
1.53758, -0.9326674, 3.385918, 1, 1, 1, 1, 1,
1.544418, 1.290889, 2.4151, 1, 1, 1, 1, 1,
1.547661, 1.900884, 1.238584, 0, 0, 1, 1, 1,
1.557416, 0.8145503, 1.598919, 1, 0, 0, 1, 1,
1.560279, 0.007882142, 1.094309, 1, 0, 0, 1, 1,
1.568282, -0.2416753, 2.438707, 1, 0, 0, 1, 1,
1.569337, -0.6395575, 3.480428, 1, 0, 0, 1, 1,
1.573785, 2.341118, 0.5263731, 1, 0, 0, 1, 1,
1.590311, -1.495226, 0.6460128, 0, 0, 0, 1, 1,
1.599603, 0.6025553, 1.95953, 0, 0, 0, 1, 1,
1.610094, 1.335615, 0.1883659, 0, 0, 0, 1, 1,
1.615436, 0.9239827, -0.348251, 0, 0, 0, 1, 1,
1.621873, -0.850779, 3.603339, 0, 0, 0, 1, 1,
1.628047, 0.5352927, 2.190033, 0, 0, 0, 1, 1,
1.641393, 0.498594, 0.497541, 0, 0, 0, 1, 1,
1.652337, -0.2702187, 2.019182, 1, 1, 1, 1, 1,
1.672449, 1.494136, 1.755699, 1, 1, 1, 1, 1,
1.673887, 0.8174576, 1.548376, 1, 1, 1, 1, 1,
1.67842, 2.176237, 1.144441, 1, 1, 1, 1, 1,
1.713636, -0.07380301, 2.692645, 1, 1, 1, 1, 1,
1.72455, 0.3267793, 0.4668249, 1, 1, 1, 1, 1,
1.735176, -0.9853904, 1.463158, 1, 1, 1, 1, 1,
1.736357, 0.311839, 1.595324, 1, 1, 1, 1, 1,
1.742272, -1.259513, 3.551925, 1, 1, 1, 1, 1,
1.745643, 0.9269573, -1.821265, 1, 1, 1, 1, 1,
1.746113, 1.482192, 0.8776946, 1, 1, 1, 1, 1,
1.762226, 0.3566203, 0.8775666, 1, 1, 1, 1, 1,
1.806371, -0.7497027, 1.38784, 1, 1, 1, 1, 1,
1.824292, -0.172462, 1.310357, 1, 1, 1, 1, 1,
1.838295, 0.401842, 1.000964, 1, 1, 1, 1, 1,
1.845824, -1.180587, 1.378767, 0, 0, 1, 1, 1,
1.846159, 0.5825407, 2.252909, 1, 0, 0, 1, 1,
1.853126, 0.1371378, 1.559396, 1, 0, 0, 1, 1,
1.854793, -0.8325085, 1.980088, 1, 0, 0, 1, 1,
1.861047, -1.488976, 1.757925, 1, 0, 0, 1, 1,
1.862891, 0.3807954, 0.6528065, 1, 0, 0, 1, 1,
1.868963, 0.1564916, 1.704188, 0, 0, 0, 1, 1,
1.873725, -1.973119, 2.55319, 0, 0, 0, 1, 1,
1.874335, 3.056804, -0.4192472, 0, 0, 0, 1, 1,
1.883626, -1.189513, -0.4045275, 0, 0, 0, 1, 1,
1.885438, 0.6417854, -0.09487803, 0, 0, 0, 1, 1,
1.894397, -0.4427185, 2.271983, 0, 0, 0, 1, 1,
1.895767, -0.1423532, 2.269337, 0, 0, 0, 1, 1,
1.917734, 0.6070951, 1.409297, 1, 1, 1, 1, 1,
1.918109, -0.4073702, 0.7171304, 1, 1, 1, 1, 1,
1.944801, 0.6952304, -0.01047301, 1, 1, 1, 1, 1,
1.946642, -2.698207, 1.501636, 1, 1, 1, 1, 1,
1.979276, -0.8167277, 2.455497, 1, 1, 1, 1, 1,
1.979289, 1.170837, 1.829223, 1, 1, 1, 1, 1,
1.98048, 1.122262, 0.5907622, 1, 1, 1, 1, 1,
1.987109, 0.5134577, 3.194587, 1, 1, 1, 1, 1,
2.007082, 0.5507309, 1.705653, 1, 1, 1, 1, 1,
2.014626, 1.674755, 1.558858, 1, 1, 1, 1, 1,
2.036791, 0.1627925, 0.5505944, 1, 1, 1, 1, 1,
2.058244, -1.001986, 2.860516, 1, 1, 1, 1, 1,
2.063485, 1.112796, 0.1773314, 1, 1, 1, 1, 1,
2.069051, -2.361327, 2.763979, 1, 1, 1, 1, 1,
2.083344, -1.058274, 1.118559, 1, 1, 1, 1, 1,
2.100441, -0.09927425, 0.1748049, 0, 0, 1, 1, 1,
2.116074, -0.6608794, 3.060333, 1, 0, 0, 1, 1,
2.135026, 0.5636245, 1.434669, 1, 0, 0, 1, 1,
2.142381, 0.3575817, 1.220649, 1, 0, 0, 1, 1,
2.15574, -0.0280828, 1.872574, 1, 0, 0, 1, 1,
2.180336, -0.5056688, 0.9135503, 1, 0, 0, 1, 1,
2.192228, 1.610764, 2.306671, 0, 0, 0, 1, 1,
2.243619, -0.8310343, 3.287381, 0, 0, 0, 1, 1,
2.280324, -1.586449, 1.804258, 0, 0, 0, 1, 1,
2.312686, -0.7221046, 2.031837, 0, 0, 0, 1, 1,
2.43264, 0.6262336, 2.043018, 0, 0, 0, 1, 1,
2.489305, 1.52809, 1.223494, 0, 0, 0, 1, 1,
2.500921, -0.0901603, 2.680775, 0, 0, 0, 1, 1,
2.574264, -0.3904067, 1.493038, 1, 1, 1, 1, 1,
2.608271, 0.6174768, 0.8675996, 1, 1, 1, 1, 1,
2.816261, 0.3872003, 2.046111, 1, 1, 1, 1, 1,
2.893289, 1.369018, 2.08652, 1, 1, 1, 1, 1,
2.895681, -0.6092429, 2.029962, 1, 1, 1, 1, 1,
3.075862, -0.18995, 1.214046, 1, 1, 1, 1, 1,
3.616356, -0.115552, 2.291028, 1, 1, 1, 1, 1
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
var radius = 9.777537;
var distance = 34.34319;
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
mvMatrix.translate( -0.4680846, 0.1211305, -0.3011203 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34319);
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
