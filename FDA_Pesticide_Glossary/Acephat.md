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
-2.647155, -1.37834, -2.163799, 1, 0, 0, 1,
-2.55322, -0.02947808, -0.9703596, 1, 0.007843138, 0, 1,
-2.454399, 0.1315899, -1.101016, 1, 0.01176471, 0, 1,
-2.452201, 0.1639726, -2.134187, 1, 0.01960784, 0, 1,
-2.438756, -1.027373, -2.234798, 1, 0.02352941, 0, 1,
-2.432988, -0.09139118, -1.566076, 1, 0.03137255, 0, 1,
-2.354525, -0.9074097, -3.369114, 1, 0.03529412, 0, 1,
-2.336849, 0.823474, -2.307001, 1, 0.04313726, 0, 1,
-2.315028, -1.563109, -2.397531, 1, 0.04705882, 0, 1,
-2.296597, 0.2606224, -2.728281, 1, 0.05490196, 0, 1,
-2.294554, -0.08641423, -1.96717, 1, 0.05882353, 0, 1,
-2.286042, -1.375298, -0.8653832, 1, 0.06666667, 0, 1,
-2.272905, -1.045245, -0.2685809, 1, 0.07058824, 0, 1,
-2.232846, -1.544638, -2.179562, 1, 0.07843138, 0, 1,
-2.19676, -1.846576, -1.943095, 1, 0.08235294, 0, 1,
-2.158336, -0.09243421, -1.489037, 1, 0.09019608, 0, 1,
-2.115517, 0.0144941, -3.804918, 1, 0.09411765, 0, 1,
-2.102551, 1.029787, -0.7602426, 1, 0.1019608, 0, 1,
-2.086189, -0.07607248, -0.1218112, 1, 0.1098039, 0, 1,
-2.069826, 0.3023063, -0.434518, 1, 0.1137255, 0, 1,
-2.04522, 0.04747164, -2.367392, 1, 0.1215686, 0, 1,
-2.043958, -0.4065425, -0.7770141, 1, 0.1254902, 0, 1,
-2.040909, 2.400569, -0.758607, 1, 0.1333333, 0, 1,
-2.017169, -1.653027, -2.75425, 1, 0.1372549, 0, 1,
-2.015152, 0.2256016, -2.353079, 1, 0.145098, 0, 1,
-2.000795, 2.081132, -1.868641, 1, 0.1490196, 0, 1,
-1.995466, -1.479024, -4.461855, 1, 0.1568628, 0, 1,
-1.964722, 0.338805, -2.793066, 1, 0.1607843, 0, 1,
-1.954511, 0.02525588, -2.100555, 1, 0.1686275, 0, 1,
-1.932225, 0.1924637, -1.261349, 1, 0.172549, 0, 1,
-1.906937, 0.2190515, 0.08275354, 1, 0.1803922, 0, 1,
-1.897668, -0.7928212, -2.89115, 1, 0.1843137, 0, 1,
-1.849591, -1.936481, -1.967667, 1, 0.1921569, 0, 1,
-1.845386, -0.08086503, -0.824779, 1, 0.1960784, 0, 1,
-1.845374, 0.5146789, 1.086267, 1, 0.2039216, 0, 1,
-1.836408, -0.09428339, -3.344137, 1, 0.2117647, 0, 1,
-1.808791, -0.006274383, -1.837013, 1, 0.2156863, 0, 1,
-1.806969, -1.456534, -3.077031, 1, 0.2235294, 0, 1,
-1.805526, -0.1217228, -1.801853, 1, 0.227451, 0, 1,
-1.790334, -1.238306, -0.8381315, 1, 0.2352941, 0, 1,
-1.745868, 0.7274598, -2.335676, 1, 0.2392157, 0, 1,
-1.739274, -1.376668, -2.631917, 1, 0.2470588, 0, 1,
-1.738218, -0.005118322, -0.9943833, 1, 0.2509804, 0, 1,
-1.724377, 0.7396441, -0.9857259, 1, 0.2588235, 0, 1,
-1.708425, -1.007732, -2.774127, 1, 0.2627451, 0, 1,
-1.702331, 1.174927, -1.734275, 1, 0.2705882, 0, 1,
-1.696021, -0.2991235, -1.39402, 1, 0.2745098, 0, 1,
-1.693216, -0.8542997, -2.045316, 1, 0.282353, 0, 1,
-1.637734, -0.3640976, -2.379622, 1, 0.2862745, 0, 1,
-1.635682, -0.2156465, -2.244151, 1, 0.2941177, 0, 1,
-1.6354, 0.006944458, -1.109591, 1, 0.3019608, 0, 1,
-1.626774, 0.2767641, -1.448918, 1, 0.3058824, 0, 1,
-1.626438, -1.665084, -3.518159, 1, 0.3137255, 0, 1,
-1.617916, -0.1908351, -3.139995, 1, 0.3176471, 0, 1,
-1.612993, 1.083825, -0.7452712, 1, 0.3254902, 0, 1,
-1.572946, 0.58798, -0.6580828, 1, 0.3294118, 0, 1,
-1.552647, -0.4242395, -0.8548191, 1, 0.3372549, 0, 1,
-1.546853, 1.927176, -1.55349, 1, 0.3411765, 0, 1,
-1.544747, -0.03860665, -2.702974, 1, 0.3490196, 0, 1,
-1.543554, 1.045614, -1.525881, 1, 0.3529412, 0, 1,
-1.519446, 0.134898, -1.966409, 1, 0.3607843, 0, 1,
-1.504959, 1.811128, -0.8562758, 1, 0.3647059, 0, 1,
-1.491156, 1.359939, -2.249714, 1, 0.372549, 0, 1,
-1.477042, -0.2164964, -1.641174, 1, 0.3764706, 0, 1,
-1.476603, 1.068213, -1.140383, 1, 0.3843137, 0, 1,
-1.471019, -1.78485, -2.088974, 1, 0.3882353, 0, 1,
-1.466926, 0.8849509, -0.7852821, 1, 0.3960784, 0, 1,
-1.466576, -1.679819, -3.2112, 1, 0.4039216, 0, 1,
-1.45268, 0.7810371, -0.05284737, 1, 0.4078431, 0, 1,
-1.446823, 0.4432235, -1.045118, 1, 0.4156863, 0, 1,
-1.414024, -0.7977508, -1.837549, 1, 0.4196078, 0, 1,
-1.411183, 0.6416832, 0.2954051, 1, 0.427451, 0, 1,
-1.403221, 0.3145785, -2.257452, 1, 0.4313726, 0, 1,
-1.392444, 0.2021605, -2.472412, 1, 0.4392157, 0, 1,
-1.382163, -0.1148079, -2.926018, 1, 0.4431373, 0, 1,
-1.379531, 1.146027, -0.03524926, 1, 0.4509804, 0, 1,
-1.366983, 1.732029, -0.4925457, 1, 0.454902, 0, 1,
-1.355781, -0.7065004, -2.472545, 1, 0.4627451, 0, 1,
-1.353099, -0.1336024, -1.493751, 1, 0.4666667, 0, 1,
-1.351202, -0.7891004, -1.770656, 1, 0.4745098, 0, 1,
-1.34928, -0.1283388, -3.619724, 1, 0.4784314, 0, 1,
-1.34344, -2.132637, -1.442049, 1, 0.4862745, 0, 1,
-1.33512, -0.3754564, -0.9071211, 1, 0.4901961, 0, 1,
-1.330078, -1.029871, -3.078462, 1, 0.4980392, 0, 1,
-1.325064, 1.205398, 0.4114219, 1, 0.5058824, 0, 1,
-1.313169, -0.2467818, -1.989518, 1, 0.509804, 0, 1,
-1.311139, -0.2843184, -0.9040802, 1, 0.5176471, 0, 1,
-1.308941, -1.672596, -4.588859, 1, 0.5215687, 0, 1,
-1.307732, 0.9727538, -1.21475, 1, 0.5294118, 0, 1,
-1.302151, 0.1668347, -1.43127, 1, 0.5333334, 0, 1,
-1.295194, -0.6728183, -1.82803, 1, 0.5411765, 0, 1,
-1.284587, -0.2740353, -1.020374, 1, 0.5450981, 0, 1,
-1.278941, 0.1769805, -2.86668, 1, 0.5529412, 0, 1,
-1.277962, -0.7008758, -2.630771, 1, 0.5568628, 0, 1,
-1.275181, 0.9759812, 0.3610293, 1, 0.5647059, 0, 1,
-1.272674, 0.6636305, -1.352101, 1, 0.5686275, 0, 1,
-1.265583, -0.04267945, -2.963726, 1, 0.5764706, 0, 1,
-1.258811, 1.401867, -0.9951607, 1, 0.5803922, 0, 1,
-1.254572, 0.7992672, -0.5778013, 1, 0.5882353, 0, 1,
-1.248489, -0.2751667, -0.2990966, 1, 0.5921569, 0, 1,
-1.24292, 1.361022, -0.9134481, 1, 0.6, 0, 1,
-1.242802, -0.4080637, -1.525624, 1, 0.6078432, 0, 1,
-1.236912, -0.7261884, -2.241412, 1, 0.6117647, 0, 1,
-1.232056, 1.011786, -2.992369, 1, 0.6196079, 0, 1,
-1.226316, -0.4725353, -0.8342287, 1, 0.6235294, 0, 1,
-1.220571, -0.06301316, -0.1793155, 1, 0.6313726, 0, 1,
-1.218807, -1.172463, -2.501305, 1, 0.6352941, 0, 1,
-1.218186, 1.118464, -0.3748197, 1, 0.6431373, 0, 1,
-1.217915, 0.708034, -0.2609375, 1, 0.6470588, 0, 1,
-1.211099, -0.6158583, -0.4225795, 1, 0.654902, 0, 1,
-1.208324, 0.0397101, -1.443372, 1, 0.6588235, 0, 1,
-1.198004, 1.193571, -1.493614, 1, 0.6666667, 0, 1,
-1.196395, -0.1869785, -2.531681, 1, 0.6705883, 0, 1,
-1.185418, 0.2586425, -3.47648, 1, 0.6784314, 0, 1,
-1.174787, -0.08671317, -2.358567, 1, 0.682353, 0, 1,
-1.173365, -1.389985, -2.837251, 1, 0.6901961, 0, 1,
-1.173067, -0.5350608, -3.335176, 1, 0.6941177, 0, 1,
-1.168377, 0.01779902, -0.7752232, 1, 0.7019608, 0, 1,
-1.167492, -0.001524055, -0.1719052, 1, 0.7098039, 0, 1,
-1.160019, -0.2454661, -0.7025165, 1, 0.7137255, 0, 1,
-1.159535, -1.98044, -3.278252, 1, 0.7215686, 0, 1,
-1.157496, -0.5716597, -0.6093441, 1, 0.7254902, 0, 1,
-1.152415, -0.6804713, -2.795682, 1, 0.7333333, 0, 1,
-1.150073, -0.756367, -2.477579, 1, 0.7372549, 0, 1,
-1.146733, 2.112314, -0.902188, 1, 0.7450981, 0, 1,
-1.143981, -0.6952978, -2.206306, 1, 0.7490196, 0, 1,
-1.139686, -0.551088, -0.6493231, 1, 0.7568628, 0, 1,
-1.136801, -0.5529629, -1.841761, 1, 0.7607843, 0, 1,
-1.133027, 2.472909, -0.2331872, 1, 0.7686275, 0, 1,
-1.131001, 1.382241, 0.5369365, 1, 0.772549, 0, 1,
-1.13044, 1.363213, -2.517066, 1, 0.7803922, 0, 1,
-1.1191, 1.166533, -0.7655854, 1, 0.7843137, 0, 1,
-1.118645, 1.049609, -3.311807, 1, 0.7921569, 0, 1,
-1.11848, -0.4832024, -3.437135, 1, 0.7960784, 0, 1,
-1.115221, 1.704832, 1.173656, 1, 0.8039216, 0, 1,
-1.107718, 0.8294004, 0.8902172, 1, 0.8117647, 0, 1,
-1.098083, -1.759805, -3.258845, 1, 0.8156863, 0, 1,
-1.097009, -0.06127042, -2.465404, 1, 0.8235294, 0, 1,
-1.096615, 2.55294, -0.5549616, 1, 0.827451, 0, 1,
-1.096319, -1.696141, -1.772403, 1, 0.8352941, 0, 1,
-1.062514, 0.8925954, -1.633274, 1, 0.8392157, 0, 1,
-1.059635, 0.796658, -0.2572955, 1, 0.8470588, 0, 1,
-1.052977, 0.9554237, -1.250918, 1, 0.8509804, 0, 1,
-1.050187, -0.3203425, -1.781118, 1, 0.8588235, 0, 1,
-1.049152, -0.5940422, -1.88236, 1, 0.8627451, 0, 1,
-1.045015, 1.843338, -3.033177, 1, 0.8705882, 0, 1,
-1.031905, -1.090292, -2.604893, 1, 0.8745098, 0, 1,
-1.024994, -1.024419, -2.101979, 1, 0.8823529, 0, 1,
-1.023647, 0.08164486, -1.009795, 1, 0.8862745, 0, 1,
-1.019613, -0.5011463, -2.873242, 1, 0.8941177, 0, 1,
-1.0137, 0.7598323, -0.6878111, 1, 0.8980392, 0, 1,
-1.009816, -0.6897865, -1.320094, 1, 0.9058824, 0, 1,
-1.009124, 0.5971512, 0.7667443, 1, 0.9137255, 0, 1,
-1.003556, -0.4496912, -3.174904, 1, 0.9176471, 0, 1,
-1.002131, -0.2648206, -3.023647, 1, 0.9254902, 0, 1,
-1.001453, -0.2714145, -3.457764, 1, 0.9294118, 0, 1,
-0.9834453, -0.9194337, -0.628494, 1, 0.9372549, 0, 1,
-0.9831114, -0.5721636, -1.179389, 1, 0.9411765, 0, 1,
-0.9819317, 0.6124645, -1.812362, 1, 0.9490196, 0, 1,
-0.9815395, -0.6566119, -2.445868, 1, 0.9529412, 0, 1,
-0.9742553, 0.01895617, -2.020374, 1, 0.9607843, 0, 1,
-0.9735759, 0.5402578, -1.314999, 1, 0.9647059, 0, 1,
-0.9734939, 0.1067817, -1.116485, 1, 0.972549, 0, 1,
-0.970507, -0.6057004, -2.02404, 1, 0.9764706, 0, 1,
-0.9642697, -1.63482, -1.896394, 1, 0.9843137, 0, 1,
-0.9636763, -0.4024699, -1.04977, 1, 0.9882353, 0, 1,
-0.9629129, -0.9905311, -2.330776, 1, 0.9960784, 0, 1,
-0.9626334, 0.4672508, -0.6145092, 0.9960784, 1, 0, 1,
-0.957127, 0.7891793, -0.2685171, 0.9921569, 1, 0, 1,
-0.9545447, 0.2114389, 0.2773192, 0.9843137, 1, 0, 1,
-0.9511456, 0.9424815, 0.3521041, 0.9803922, 1, 0, 1,
-0.9461151, -1.770002, -1.626873, 0.972549, 1, 0, 1,
-0.938806, -0.2553928, -2.65932, 0.9686275, 1, 0, 1,
-0.9292998, 1.380403, -0.8177949, 0.9607843, 1, 0, 1,
-0.9281477, -1.523219, -4.111455, 0.9568627, 1, 0, 1,
-0.9257697, 0.4924113, -2.421073, 0.9490196, 1, 0, 1,
-0.9233882, 0.01389565, -0.996845, 0.945098, 1, 0, 1,
-0.9233124, 0.3174062, -0.9945549, 0.9372549, 1, 0, 1,
-0.9152964, 1.293226, -2.168052, 0.9333333, 1, 0, 1,
-0.9086914, -0.1028283, -1.972299, 0.9254902, 1, 0, 1,
-0.907896, 1.605182, -2.088259, 0.9215686, 1, 0, 1,
-0.9073892, -1.367524, -2.843201, 0.9137255, 1, 0, 1,
-0.9063435, -0.9575135, -4.138974, 0.9098039, 1, 0, 1,
-0.9045694, 0.2278448, -3.489267, 0.9019608, 1, 0, 1,
-0.9028348, 0.1792051, -2.942803, 0.8941177, 1, 0, 1,
-0.8998141, -0.4064189, -1.16464, 0.8901961, 1, 0, 1,
-0.8973837, -0.05009594, -0.5757563, 0.8823529, 1, 0, 1,
-0.8968425, 0.2602667, -0.1726402, 0.8784314, 1, 0, 1,
-0.894712, 2.312999, 0.4362087, 0.8705882, 1, 0, 1,
-0.8918741, 0.3855376, 0.3181842, 0.8666667, 1, 0, 1,
-0.8859166, 0.8590046, -1.715566, 0.8588235, 1, 0, 1,
-0.881197, 2.174819, 0.2564197, 0.854902, 1, 0, 1,
-0.8792433, -0.5343814, -0.1966337, 0.8470588, 1, 0, 1,
-0.8721036, 0.6823168, -1.66098, 0.8431373, 1, 0, 1,
-0.8665576, 0.4365493, -1.542264, 0.8352941, 1, 0, 1,
-0.8644841, -0.8593865, -3.068411, 0.8313726, 1, 0, 1,
-0.8612573, 0.4647757, -1.028789, 0.8235294, 1, 0, 1,
-0.86072, 0.5714617, -3.143726, 0.8196079, 1, 0, 1,
-0.8574789, -0.01010685, -0.8300835, 0.8117647, 1, 0, 1,
-0.8510858, -0.7645038, -3.088908, 0.8078431, 1, 0, 1,
-0.8495125, 0.9109935, -0.8661742, 0.8, 1, 0, 1,
-0.8418306, 1.892767, -0.6251267, 0.7921569, 1, 0, 1,
-0.8386337, 1.824167, -0.11152, 0.7882353, 1, 0, 1,
-0.8363443, 0.3027, 0.3978553, 0.7803922, 1, 0, 1,
-0.8358784, -0.8316606, -2.282982, 0.7764706, 1, 0, 1,
-0.822268, -1.60044, -1.827909, 0.7686275, 1, 0, 1,
-0.8211901, 0.4700238, 0.2417404, 0.7647059, 1, 0, 1,
-0.8135485, -0.01475796, -1.690034, 0.7568628, 1, 0, 1,
-0.8124744, -0.9723995, -2.951375, 0.7529412, 1, 0, 1,
-0.8096238, -1.422155, -2.380267, 0.7450981, 1, 0, 1,
-0.8071987, 2.40757, -0.07974543, 0.7411765, 1, 0, 1,
-0.8008867, -1.007514, -2.520254, 0.7333333, 1, 0, 1,
-0.7997136, 0.1510623, -1.997398, 0.7294118, 1, 0, 1,
-0.7953624, 1.090913, -1.185968, 0.7215686, 1, 0, 1,
-0.7821811, 0.7705677, -0.05532562, 0.7176471, 1, 0, 1,
-0.7819839, 0.07940251, -0.1079897, 0.7098039, 1, 0, 1,
-0.7742255, -0.1260033, -2.767577, 0.7058824, 1, 0, 1,
-0.7649118, 0.170066, -1.793448, 0.6980392, 1, 0, 1,
-0.7499822, 0.307231, -1.070022, 0.6901961, 1, 0, 1,
-0.7480051, 0.6845455, -0.4845141, 0.6862745, 1, 0, 1,
-0.7472974, -0.2738148, -0.597518, 0.6784314, 1, 0, 1,
-0.7450178, -0.7010276, -2.719343, 0.6745098, 1, 0, 1,
-0.743542, -1.403801, -3.698715, 0.6666667, 1, 0, 1,
-0.7323136, 0.1107063, -1.212803, 0.6627451, 1, 0, 1,
-0.7307922, -1.170128, -3.46809, 0.654902, 1, 0, 1,
-0.7304269, -0.821588, -2.602379, 0.6509804, 1, 0, 1,
-0.7251288, -0.3073837, -1.032225, 0.6431373, 1, 0, 1,
-0.7231762, 0.06624327, 0.04574411, 0.6392157, 1, 0, 1,
-0.7230849, -0.01518459, -1.321978, 0.6313726, 1, 0, 1,
-0.7191039, -1.090708, -2.894905, 0.627451, 1, 0, 1,
-0.7150226, -0.1108104, -1.338767, 0.6196079, 1, 0, 1,
-0.7142693, -0.06443064, -2.250963, 0.6156863, 1, 0, 1,
-0.7137039, -1.792727, -5.718501, 0.6078432, 1, 0, 1,
-0.7130775, 0.007709843, -2.986661, 0.6039216, 1, 0, 1,
-0.711691, -0.4394391, -3.238389, 0.5960785, 1, 0, 1,
-0.7104356, -0.162428, -3.322112, 0.5882353, 1, 0, 1,
-0.7066529, 0.5352111, -0.06596854, 0.5843138, 1, 0, 1,
-0.706405, -0.7133877, -2.796559, 0.5764706, 1, 0, 1,
-0.6994709, 0.3518137, 0.1209501, 0.572549, 1, 0, 1,
-0.6868579, -0.03607604, -2.0375, 0.5647059, 1, 0, 1,
-0.6856617, -0.5269721, -0.2641782, 0.5607843, 1, 0, 1,
-0.6822931, 0.2560702, -0.8448053, 0.5529412, 1, 0, 1,
-0.6803548, 1.268545, 0.5417535, 0.5490196, 1, 0, 1,
-0.6789277, -0.6805571, -1.75175, 0.5411765, 1, 0, 1,
-0.6749789, -1.546128, -3.374248, 0.5372549, 1, 0, 1,
-0.673673, -0.5318123, -3.481164, 0.5294118, 1, 0, 1,
-0.6695283, -0.001682695, -1.540365, 0.5254902, 1, 0, 1,
-0.6612699, 0.01447541, -1.430489, 0.5176471, 1, 0, 1,
-0.65026, -0.8402495, -4.057363, 0.5137255, 1, 0, 1,
-0.6458699, 0.3108155, -0.659379, 0.5058824, 1, 0, 1,
-0.6453501, 0.2056724, -1.492412, 0.5019608, 1, 0, 1,
-0.6383134, 0.3570908, -0.8284222, 0.4941176, 1, 0, 1,
-0.6352605, 0.3593544, -0.8779669, 0.4862745, 1, 0, 1,
-0.6351157, 0.8487337, 0.3273712, 0.4823529, 1, 0, 1,
-0.6316468, 0.02356432, -2.057016, 0.4745098, 1, 0, 1,
-0.6305751, 1.647949, 0.9566177, 0.4705882, 1, 0, 1,
-0.629931, 0.7513552, -0.1731999, 0.4627451, 1, 0, 1,
-0.6293749, -1.543671, -3.179267, 0.4588235, 1, 0, 1,
-0.6205924, 0.05509773, -2.680362, 0.4509804, 1, 0, 1,
-0.6186975, -0.07522207, -0.8535729, 0.4470588, 1, 0, 1,
-0.6149647, -0.6707283, -1.022842, 0.4392157, 1, 0, 1,
-0.6136887, -0.01021063, -1.09149, 0.4352941, 1, 0, 1,
-0.6093886, 1.087381, -1.547234, 0.427451, 1, 0, 1,
-0.6089455, -1.093569, -4.648345, 0.4235294, 1, 0, 1,
-0.6083243, -1.273385, -2.453822, 0.4156863, 1, 0, 1,
-0.5883322, -1.015218, -3.198721, 0.4117647, 1, 0, 1,
-0.5832946, -0.6856547, -1.989132, 0.4039216, 1, 0, 1,
-0.5797088, 0.5781505, -0.8658932, 0.3960784, 1, 0, 1,
-0.5767213, -1.063481, -1.480696, 0.3921569, 1, 0, 1,
-0.5758251, -0.5171934, -1.863217, 0.3843137, 1, 0, 1,
-0.5757571, 0.2827729, -0.6086412, 0.3803922, 1, 0, 1,
-0.5742886, -0.7061245, -3.799471, 0.372549, 1, 0, 1,
-0.5738684, -2.132203, -3.075606, 0.3686275, 1, 0, 1,
-0.5736089, -2.095205, -4.104703, 0.3607843, 1, 0, 1,
-0.5705823, -1.29379, -2.22194, 0.3568628, 1, 0, 1,
-0.5705671, 0.9849043, -0.5475482, 0.3490196, 1, 0, 1,
-0.5670054, 1.819783, -0.8409697, 0.345098, 1, 0, 1,
-0.5603089, 1.284612, -1.631669, 0.3372549, 1, 0, 1,
-0.5599777, -0.847072, -2.31897, 0.3333333, 1, 0, 1,
-0.5593317, -1.219599, -3.855751, 0.3254902, 1, 0, 1,
-0.5482468, 0.2348627, -1.609843, 0.3215686, 1, 0, 1,
-0.5461337, -0.576898, -1.760769, 0.3137255, 1, 0, 1,
-0.5448194, -1.290612, -0.6486312, 0.3098039, 1, 0, 1,
-0.5409184, 0.4298702, -1.155541, 0.3019608, 1, 0, 1,
-0.5405834, -0.09363101, -1.816099, 0.2941177, 1, 0, 1,
-0.5380608, 0.4636997, -0.4915502, 0.2901961, 1, 0, 1,
-0.532295, 1.209417, -2.436201, 0.282353, 1, 0, 1,
-0.5258271, -0.4452126, -2.481936, 0.2784314, 1, 0, 1,
-0.5257747, 0.9897041, -1.796525, 0.2705882, 1, 0, 1,
-0.5255405, 0.4107849, -0.9860788, 0.2666667, 1, 0, 1,
-0.523021, 0.6222981, 0.8019532, 0.2588235, 1, 0, 1,
-0.516497, 0.3428527, -0.5360594, 0.254902, 1, 0, 1,
-0.5142471, -0.7650964, -2.362128, 0.2470588, 1, 0, 1,
-0.5139644, -0.7330565, -3.088928, 0.2431373, 1, 0, 1,
-0.5121861, 0.2312358, -2.318425, 0.2352941, 1, 0, 1,
-0.5120943, 0.6059589, -0.4271676, 0.2313726, 1, 0, 1,
-0.5111141, -0.1579995, -1.540165, 0.2235294, 1, 0, 1,
-0.505823, 1.054201, -0.2598385, 0.2196078, 1, 0, 1,
-0.5038972, 0.7188499, -0.174824, 0.2117647, 1, 0, 1,
-0.5035492, 0.5614372, -2.729571, 0.2078431, 1, 0, 1,
-0.5028701, 1.756728, -1.19241, 0.2, 1, 0, 1,
-0.502637, -0.2249658, 0.5140324, 0.1921569, 1, 0, 1,
-0.4994659, -0.6962794, -4.321077, 0.1882353, 1, 0, 1,
-0.4947014, 1.673018, -0.8675597, 0.1803922, 1, 0, 1,
-0.4868416, 0.3067257, -2.93593, 0.1764706, 1, 0, 1,
-0.4789251, 1.35939, -1.702391, 0.1686275, 1, 0, 1,
-0.4782073, -2.070467, -3.313949, 0.1647059, 1, 0, 1,
-0.4772875, 0.5246068, -2.540863, 0.1568628, 1, 0, 1,
-0.475172, -2.138765, -3.591809, 0.1529412, 1, 0, 1,
-0.4734938, 1.07552, -0.1237324, 0.145098, 1, 0, 1,
-0.4713685, 0.8233028, -1.683401, 0.1411765, 1, 0, 1,
-0.4653788, -0.8641994, -1.82536, 0.1333333, 1, 0, 1,
-0.4649096, 1.398217, 0.5589294, 0.1294118, 1, 0, 1,
-0.4626326, -0.2617157, -0.5012761, 0.1215686, 1, 0, 1,
-0.46243, -0.4261726, -2.639416, 0.1176471, 1, 0, 1,
-0.4612769, -1.878607, -2.437291, 0.1098039, 1, 0, 1,
-0.4549831, 0.1521745, -2.592696, 0.1058824, 1, 0, 1,
-0.4532261, -0.464937, -3.391378, 0.09803922, 1, 0, 1,
-0.4531707, -1.316648, -4.503122, 0.09019608, 1, 0, 1,
-0.4526426, 1.719968, -0.7231187, 0.08627451, 1, 0, 1,
-0.4480495, -0.9245587, -1.802114, 0.07843138, 1, 0, 1,
-0.4395052, -0.1169448, -2.673583, 0.07450981, 1, 0, 1,
-0.4394259, 0.4626935, -0.8488496, 0.06666667, 1, 0, 1,
-0.4376048, -1.180753, -2.409495, 0.0627451, 1, 0, 1,
-0.4362457, 1.02588, -0.6407149, 0.05490196, 1, 0, 1,
-0.4300542, -0.1923576, -0.502516, 0.05098039, 1, 0, 1,
-0.4284425, -1.495365, -1.014011, 0.04313726, 1, 0, 1,
-0.4277376, -2.23525, -2.169105, 0.03921569, 1, 0, 1,
-0.4184133, 0.8192677, -0.5247169, 0.03137255, 1, 0, 1,
-0.415321, -0.0743512, -4.281334, 0.02745098, 1, 0, 1,
-0.4097022, -0.2248499, -1.83793, 0.01960784, 1, 0, 1,
-0.4091296, 0.2347755, -2.330017, 0.01568628, 1, 0, 1,
-0.4040267, -1.498237, -2.460107, 0.007843138, 1, 0, 1,
-0.4029757, 1.039521, -0.08581784, 0.003921569, 1, 0, 1,
-0.4029473, -0.19022, -3.218766, 0, 1, 0.003921569, 1,
-0.3984461, -0.7960896, -1.500369, 0, 1, 0.01176471, 1,
-0.3969673, 0.4019863, 0.0792959, 0, 1, 0.01568628, 1,
-0.3921763, 0.08427088, -1.408545, 0, 1, 0.02352941, 1,
-0.3866897, -0.7096682, -3.105403, 0, 1, 0.02745098, 1,
-0.3801614, -0.2064212, -1.339139, 0, 1, 0.03529412, 1,
-0.3776108, -1.396356, -2.137906, 0, 1, 0.03921569, 1,
-0.3660016, 2.84223, -0.4645151, 0, 1, 0.04705882, 1,
-0.3643922, 1.614093, -0.3926513, 0, 1, 0.05098039, 1,
-0.3627174, 2.179492, -0.4883151, 0, 1, 0.05882353, 1,
-0.3623625, 0.3939641, -2.27746, 0, 1, 0.0627451, 1,
-0.357736, -0.7774316, -2.375733, 0, 1, 0.07058824, 1,
-0.3542787, 0.6696852, -0.5826452, 0, 1, 0.07450981, 1,
-0.351686, 1.260388, -0.6075512, 0, 1, 0.08235294, 1,
-0.3497074, 2.574238, -1.528793, 0, 1, 0.08627451, 1,
-0.337206, 0.1107837, -0.3772759, 0, 1, 0.09411765, 1,
-0.3365768, 0.5438373, 0.955952, 0, 1, 0.1019608, 1,
-0.3335482, -1.762425, -3.766535, 0, 1, 0.1058824, 1,
-0.3284099, 1.095653, 1.564597, 0, 1, 0.1137255, 1,
-0.3277859, 1.392901, 1.010724, 0, 1, 0.1176471, 1,
-0.3243429, 0.01697754, -0.9760314, 0, 1, 0.1254902, 1,
-0.3240205, 0.5942799, -0.8055169, 0, 1, 0.1294118, 1,
-0.3236268, -0.1335268, -3.199528, 0, 1, 0.1372549, 1,
-0.3161717, -0.2087301, -2.710472, 0, 1, 0.1411765, 1,
-0.3127512, 1.037495, 0.2270059, 0, 1, 0.1490196, 1,
-0.3126827, 1.577434, -2.249285, 0, 1, 0.1529412, 1,
-0.3103099, 1.641672, -0.9847993, 0, 1, 0.1607843, 1,
-0.3092673, 0.689703, 0.303407, 0, 1, 0.1647059, 1,
-0.3089092, 0.2718125, 0.9303991, 0, 1, 0.172549, 1,
-0.3068416, -1.933777, -1.228035, 0, 1, 0.1764706, 1,
-0.3039412, 0.3355449, -0.6360931, 0, 1, 0.1843137, 1,
-0.3028034, 0.1553894, -2.046659, 0, 1, 0.1882353, 1,
-0.2980755, 0.5738031, -0.4664728, 0, 1, 0.1960784, 1,
-0.2972098, 0.9209719, -0.6020063, 0, 1, 0.2039216, 1,
-0.2948, -0.9278914, -2.248728, 0, 1, 0.2078431, 1,
-0.2879471, -1.420653, -3.530686, 0, 1, 0.2156863, 1,
-0.2868267, 0.1458148, -0.9167205, 0, 1, 0.2196078, 1,
-0.2853658, 0.6272863, -0.6953982, 0, 1, 0.227451, 1,
-0.2794538, -1.384238, -5.115337, 0, 1, 0.2313726, 1,
-0.2785746, 0.7168052, -1.936847, 0, 1, 0.2392157, 1,
-0.2737439, 1.529619, -0.5407494, 0, 1, 0.2431373, 1,
-0.2687007, 2.025592, -1.401532, 0, 1, 0.2509804, 1,
-0.2681564, 0.4906617, -0.08558801, 0, 1, 0.254902, 1,
-0.2668287, -0.571372, -4.328777, 0, 1, 0.2627451, 1,
-0.2657929, 0.2116427, -2.076113, 0, 1, 0.2666667, 1,
-0.2633584, -1.39584, -2.337066, 0, 1, 0.2745098, 1,
-0.2623512, -1.256479, -2.399598, 0, 1, 0.2784314, 1,
-0.2621328, -0.3061631, -0.5562654, 0, 1, 0.2862745, 1,
-0.2579927, -0.5859707, -3.570255, 0, 1, 0.2901961, 1,
-0.2569686, -0.2216177, -2.638445, 0, 1, 0.2980392, 1,
-0.2559489, -0.8556308, -2.618302, 0, 1, 0.3058824, 1,
-0.2556762, 0.0165973, -1.13235, 0, 1, 0.3098039, 1,
-0.2551477, -0.3117282, -2.770712, 0, 1, 0.3176471, 1,
-0.2548621, -2.846516, -2.790528, 0, 1, 0.3215686, 1,
-0.2532876, -1.359554, -2.159986, 0, 1, 0.3294118, 1,
-0.2527533, 0.003063497, -1.632381, 0, 1, 0.3333333, 1,
-0.2497647, 0.9084067, 1.13183, 0, 1, 0.3411765, 1,
-0.2487365, 0.6449054, 0.4755362, 0, 1, 0.345098, 1,
-0.2476587, 0.5098217, -1.338785, 0, 1, 0.3529412, 1,
-0.2455008, 0.8780888, -0.470145, 0, 1, 0.3568628, 1,
-0.2452475, 0.7712896, 1.548487, 0, 1, 0.3647059, 1,
-0.2448047, -0.4719164, -2.323645, 0, 1, 0.3686275, 1,
-0.2443783, 1.910446, 1.561609, 0, 1, 0.3764706, 1,
-0.2418378, 0.177411, -1.202859, 0, 1, 0.3803922, 1,
-0.2404655, -0.6417047, -4.714255, 0, 1, 0.3882353, 1,
-0.2381344, 1.220011, 1.185898, 0, 1, 0.3921569, 1,
-0.2378405, 0.3359247, -2.577987, 0, 1, 0.4, 1,
-0.2345095, 1.099042, 0.5941144, 0, 1, 0.4078431, 1,
-0.2334161, 0.3879844, -1.442964, 0, 1, 0.4117647, 1,
-0.2276164, 0.6686949, -0.8413051, 0, 1, 0.4196078, 1,
-0.2268362, -0.2000487, -1.377575, 0, 1, 0.4235294, 1,
-0.221486, -0.6007525, -1.329535, 0, 1, 0.4313726, 1,
-0.217436, -2.295987, -3.022867, 0, 1, 0.4352941, 1,
-0.2140988, 0.8581541, -0.8534911, 0, 1, 0.4431373, 1,
-0.2086233, -0.9226862, -2.433714, 0, 1, 0.4470588, 1,
-0.2073937, 0.2105891, -0.2902102, 0, 1, 0.454902, 1,
-0.2055892, -0.1583793, -2.75603, 0, 1, 0.4588235, 1,
-0.2053783, 1.772984, 0.5217056, 0, 1, 0.4666667, 1,
-0.2048513, 1.557801, -0.9942932, 0, 1, 0.4705882, 1,
-0.2010569, 0.9445425, -0.03014224, 0, 1, 0.4784314, 1,
-0.1987536, 0.1000636, -2.507932, 0, 1, 0.4823529, 1,
-0.1950354, -2.588595, -1.566358, 0, 1, 0.4901961, 1,
-0.1925164, -0.04810419, -2.689321, 0, 1, 0.4941176, 1,
-0.1895279, 0.6071479, 0.02910882, 0, 1, 0.5019608, 1,
-0.1889969, -0.8876113, -3.415883, 0, 1, 0.509804, 1,
-0.1729499, -0.8018873, -2.915961, 0, 1, 0.5137255, 1,
-0.1722684, 0.7159097, 1.174035, 0, 1, 0.5215687, 1,
-0.1700068, 1.022076, 0.4448426, 0, 1, 0.5254902, 1,
-0.1697491, 1.539765, -0.360252, 0, 1, 0.5333334, 1,
-0.1684304, 0.9975671, 0.004323424, 0, 1, 0.5372549, 1,
-0.1677735, 1.38833, -0.4831537, 0, 1, 0.5450981, 1,
-0.1666507, 0.1655232, -0.5839747, 0, 1, 0.5490196, 1,
-0.1662199, -1.42225, -4.854487, 0, 1, 0.5568628, 1,
-0.1653271, -1.501106, -3.803854, 0, 1, 0.5607843, 1,
-0.1601124, -1.355872, -2.315609, 0, 1, 0.5686275, 1,
-0.1597086, -0.2709609, -3.21037, 0, 1, 0.572549, 1,
-0.1590346, -0.8799978, -3.714332, 0, 1, 0.5803922, 1,
-0.1492234, 0.1794138, 0.7097589, 0, 1, 0.5843138, 1,
-0.1472857, 0.8923447, -0.3389884, 0, 1, 0.5921569, 1,
-0.1461513, -0.6861246, -3.061861, 0, 1, 0.5960785, 1,
-0.145221, -1.35883, -3.836665, 0, 1, 0.6039216, 1,
-0.1415918, -1.989691, -3.263971, 0, 1, 0.6117647, 1,
-0.1410701, -0.9399436, -3.325153, 0, 1, 0.6156863, 1,
-0.139488, 1.458865, 0.2545, 0, 1, 0.6235294, 1,
-0.1383636, 0.545079, 0.2992373, 0, 1, 0.627451, 1,
-0.1369335, 0.5461996, 1.461157, 0, 1, 0.6352941, 1,
-0.1351753, 0.1667202, 0.9623946, 0, 1, 0.6392157, 1,
-0.1329882, 1.370322, -0.8260932, 0, 1, 0.6470588, 1,
-0.1261438, 0.01857543, -1.656669, 0, 1, 0.6509804, 1,
-0.1204477, -1.480268, -1.919913, 0, 1, 0.6588235, 1,
-0.1197519, 1.823371, 0.4268372, 0, 1, 0.6627451, 1,
-0.1168526, -0.1300014, -0.09611437, 0, 1, 0.6705883, 1,
-0.1131925, -0.7036433, -2.886245, 0, 1, 0.6745098, 1,
-0.1000339, 0.2129637, -1.365529, 0, 1, 0.682353, 1,
-0.09510889, -1.004098, -2.427515, 0, 1, 0.6862745, 1,
-0.09367222, 0.2628569, 0.6124704, 0, 1, 0.6941177, 1,
-0.09304563, 0.5446873, -0.8319165, 0, 1, 0.7019608, 1,
-0.08596129, 0.8355298, -1.534158, 0, 1, 0.7058824, 1,
-0.08583156, -1.119826, -3.444749, 0, 1, 0.7137255, 1,
-0.08513095, -0.09409164, -1.784567, 0, 1, 0.7176471, 1,
-0.08251447, 1.666793, 0.7065809, 0, 1, 0.7254902, 1,
-0.08238453, -0.2978015, -1.746208, 0, 1, 0.7294118, 1,
-0.08032744, -0.2415786, -0.8874196, 0, 1, 0.7372549, 1,
-0.07973275, 1.031051, 0.06349769, 0, 1, 0.7411765, 1,
-0.0791592, 1.707562, 1.077773, 0, 1, 0.7490196, 1,
-0.07877344, -0.1453403, -2.758192, 0, 1, 0.7529412, 1,
-0.07701261, 0.4265664, -0.8084823, 0, 1, 0.7607843, 1,
-0.07638115, -0.2541143, -3.408102, 0, 1, 0.7647059, 1,
-0.07469263, 0.07005434, -0.4330717, 0, 1, 0.772549, 1,
-0.07162542, 0.9123749, 0.3072671, 0, 1, 0.7764706, 1,
-0.06992695, -0.04237412, -2.787526, 0, 1, 0.7843137, 1,
-0.0696895, 1.171972, -0.3706062, 0, 1, 0.7882353, 1,
-0.06556144, -0.2670447, -0.8002912, 0, 1, 0.7960784, 1,
-0.05668018, -2.3703, -3.358192, 0, 1, 0.8039216, 1,
-0.05361829, 2.51258, -0.2317965, 0, 1, 0.8078431, 1,
-0.04472121, -0.914614, -2.630967, 0, 1, 0.8156863, 1,
-0.03827498, 2.068467, -1.493411, 0, 1, 0.8196079, 1,
-0.03397943, 1.477381, -0.5422691, 0, 1, 0.827451, 1,
-0.03148158, 0.4158693, 1.673524, 0, 1, 0.8313726, 1,
-0.02980736, 0.2272071, -0.4090738, 0, 1, 0.8392157, 1,
-0.0239757, -3.537954, -3.313232, 0, 1, 0.8431373, 1,
-0.02161129, 0.2934251, 0.5233809, 0, 1, 0.8509804, 1,
-0.01887266, 0.6932808, -0.3674715, 0, 1, 0.854902, 1,
-0.01729386, -1.226798, -2.311152, 0, 1, 0.8627451, 1,
-0.0146546, 0.4914072, -0.4512267, 0, 1, 0.8666667, 1,
-0.01351817, 1.039544, -0.348171, 0, 1, 0.8745098, 1,
-0.01282195, -0.6853876, -5.093531, 0, 1, 0.8784314, 1,
-0.01219474, -0.1791444, -2.598958, 0, 1, 0.8862745, 1,
-0.01103332, 0.341527, -0.1609174, 0, 1, 0.8901961, 1,
-0.01076663, -0.3953708, -4.344942, 0, 1, 0.8980392, 1,
-0.01008833, -1.344235, -3.600946, 0, 1, 0.9058824, 1,
-0.009571319, 0.3527561, -0.02373248, 0, 1, 0.9098039, 1,
-0.009502289, -1.982791, -3.265307, 0, 1, 0.9176471, 1,
-0.004662724, 0.7520844, 1.546477, 0, 1, 0.9215686, 1,
0.003062215, -0.3559546, 3.246519, 0, 1, 0.9294118, 1,
0.009371098, -0.3304893, 2.781161, 0, 1, 0.9333333, 1,
0.01098212, 0.7573465, 0.9311241, 0, 1, 0.9411765, 1,
0.0167071, -0.7674927, 3.664704, 0, 1, 0.945098, 1,
0.01738372, 2.776068, 0.5116888, 0, 1, 0.9529412, 1,
0.02054717, 0.542746, -0.3062886, 0, 1, 0.9568627, 1,
0.02313366, 1.023742, 0.02722628, 0, 1, 0.9647059, 1,
0.02350183, 1.302279, -0.3873718, 0, 1, 0.9686275, 1,
0.02352026, -0.2963161, 3.13406, 0, 1, 0.9764706, 1,
0.02810611, 0.7771444, -0.7864627, 0, 1, 0.9803922, 1,
0.03080181, 0.3261248, -1.48194, 0, 1, 0.9882353, 1,
0.03126844, -0.6545269, 3.701478, 0, 1, 0.9921569, 1,
0.0373537, 0.9180986, 0.8479187, 0, 1, 1, 1,
0.04051198, -0.226529, 4.750394, 0, 0.9921569, 1, 1,
0.0411001, 0.865868, -1.242537, 0, 0.9882353, 1, 1,
0.04301097, 0.6850757, 0.8219526, 0, 0.9803922, 1, 1,
0.0438016, 0.4115532, 0.07471257, 0, 0.9764706, 1, 1,
0.04662489, 0.1064033, -0.6783373, 0, 0.9686275, 1, 1,
0.05343179, 0.1241935, 0.8384154, 0, 0.9647059, 1, 1,
0.05446559, -0.6596808, 2.991222, 0, 0.9568627, 1, 1,
0.06245414, -1.67067, 3.81443, 0, 0.9529412, 1, 1,
0.06421582, -1.324281, 4.366658, 0, 0.945098, 1, 1,
0.0675266, 0.3331769, -0.5717264, 0, 0.9411765, 1, 1,
0.0677413, -1.741339, 3.734346, 0, 0.9333333, 1, 1,
0.06918442, 0.9653621, 0.9046078, 0, 0.9294118, 1, 1,
0.07117868, 0.5448357, -0.168414, 0, 0.9215686, 1, 1,
0.07133444, 0.5181447, 0.3815517, 0, 0.9176471, 1, 1,
0.07490607, 0.5277446, 2.388834, 0, 0.9098039, 1, 1,
0.0791617, -0.104324, 3.015415, 0, 0.9058824, 1, 1,
0.08115046, -1.640159, 3.58071, 0, 0.8980392, 1, 1,
0.08320922, -0.9941012, 3.228544, 0, 0.8901961, 1, 1,
0.09036721, 1.250047, -0.6292102, 0, 0.8862745, 1, 1,
0.09080926, -0.1999607, 3.382408, 0, 0.8784314, 1, 1,
0.09114146, 0.6111642, -0.1879715, 0, 0.8745098, 1, 1,
0.09170985, -1.626671, 4.400089, 0, 0.8666667, 1, 1,
0.09362813, 0.225013, 0.6928309, 0, 0.8627451, 1, 1,
0.09969378, -2.06852, 1.985517, 0, 0.854902, 1, 1,
0.1019925, 1.665592, -0.8652673, 0, 0.8509804, 1, 1,
0.1034557, -0.06688919, 2.999804, 0, 0.8431373, 1, 1,
0.1057765, 1.618806, -0.3985349, 0, 0.8392157, 1, 1,
0.1076379, 0.2467861, 0.8861341, 0, 0.8313726, 1, 1,
0.1076409, 1.463005, 1.016165, 0, 0.827451, 1, 1,
0.1077168, 1.169667, -2.289831, 0, 0.8196079, 1, 1,
0.1089372, 1.249094, 1.765491, 0, 0.8156863, 1, 1,
0.1091475, 0.4893861, 0.04076469, 0, 0.8078431, 1, 1,
0.1095303, -0.08587756, 0.9785585, 0, 0.8039216, 1, 1,
0.1098254, -0.6327026, 1.78542, 0, 0.7960784, 1, 1,
0.1120139, -1.140012, 3.177874, 0, 0.7882353, 1, 1,
0.1129164, 0.3107402, 0.8786445, 0, 0.7843137, 1, 1,
0.1133095, 0.7229493, -0.7958093, 0, 0.7764706, 1, 1,
0.1139962, -0.3831946, 2.991932, 0, 0.772549, 1, 1,
0.1154382, 0.5776038, -0.9225484, 0, 0.7647059, 1, 1,
0.1186023, 0.9460748, -0.1689436, 0, 0.7607843, 1, 1,
0.126193, -0.07401899, 2.538772, 0, 0.7529412, 1, 1,
0.1276764, -1.780308, 2.757889, 0, 0.7490196, 1, 1,
0.1282802, 0.1671571, 0.2612568, 0, 0.7411765, 1, 1,
0.131038, -0.1587234, 2.220461, 0, 0.7372549, 1, 1,
0.1327482, -1.652403, 1.512685, 0, 0.7294118, 1, 1,
0.1351064, -2.284244, 4.476793, 0, 0.7254902, 1, 1,
0.1373748, -1.103848, 2.141178, 0, 0.7176471, 1, 1,
0.1377905, 0.4015696, -0.6234967, 0, 0.7137255, 1, 1,
0.13839, 2.246163, 0.8855681, 0, 0.7058824, 1, 1,
0.1414117, 0.4262906, -2.315111, 0, 0.6980392, 1, 1,
0.1440408, -0.3751271, 3.341583, 0, 0.6941177, 1, 1,
0.1446176, 0.2468376, -1.797709, 0, 0.6862745, 1, 1,
0.144888, -1.050221, 4.374685, 0, 0.682353, 1, 1,
0.1450409, -0.3386385, 2.084402, 0, 0.6745098, 1, 1,
0.1479613, -0.124123, 2.656417, 0, 0.6705883, 1, 1,
0.1480483, -0.01321472, 2.109936, 0, 0.6627451, 1, 1,
0.1558164, -1.15624, 3.33558, 0, 0.6588235, 1, 1,
0.1565938, 1.694727, -0.6282856, 0, 0.6509804, 1, 1,
0.1607209, -0.8360097, 4.386147, 0, 0.6470588, 1, 1,
0.161064, -0.9105842, 3.548091, 0, 0.6392157, 1, 1,
0.1613401, -1.457089, 2.94502, 0, 0.6352941, 1, 1,
0.1618372, -0.3107526, 3.812464, 0, 0.627451, 1, 1,
0.1660396, -0.7190198, 2.702446, 0, 0.6235294, 1, 1,
0.1747546, 0.6969725, 0.3982776, 0, 0.6156863, 1, 1,
0.1766522, 0.7732672, 1.450726, 0, 0.6117647, 1, 1,
0.17684, 0.9456749, 0.3722568, 0, 0.6039216, 1, 1,
0.1791594, -0.1089883, 3.716815, 0, 0.5960785, 1, 1,
0.1821506, -0.09538482, 3.358297, 0, 0.5921569, 1, 1,
0.1825252, -0.2293031, 3.445223, 0, 0.5843138, 1, 1,
0.1885642, -2.043433, 3.72646, 0, 0.5803922, 1, 1,
0.1899715, 1.269923, 1.608753, 0, 0.572549, 1, 1,
0.1912087, -0.4503527, 2.892826, 0, 0.5686275, 1, 1,
0.1930766, 0.8777229, 0.98918, 0, 0.5607843, 1, 1,
0.2004005, 1.331306, -2.966384, 0, 0.5568628, 1, 1,
0.2005087, -0.4685311, 4.178909, 0, 0.5490196, 1, 1,
0.2043022, 0.4007894, 0.9185079, 0, 0.5450981, 1, 1,
0.2065182, 0.03511005, -0.7267489, 0, 0.5372549, 1, 1,
0.20753, 0.06962459, 0.9681707, 0, 0.5333334, 1, 1,
0.2116399, 0.7994674, 0.855189, 0, 0.5254902, 1, 1,
0.213272, -1.143386, 4.754696, 0, 0.5215687, 1, 1,
0.2134648, 1.524403, -0.7700567, 0, 0.5137255, 1, 1,
0.2137189, -0.280972, 1.972624, 0, 0.509804, 1, 1,
0.2158229, 1.35796, -1.531075, 0, 0.5019608, 1, 1,
0.2204942, -1.250236, 3.683271, 0, 0.4941176, 1, 1,
0.2227616, -1.692354, 3.483644, 0, 0.4901961, 1, 1,
0.2233367, -1.252056, 1.195447, 0, 0.4823529, 1, 1,
0.2238909, 0.4054227, -1.141361, 0, 0.4784314, 1, 1,
0.2243864, -0.2635374, 0.08280807, 0, 0.4705882, 1, 1,
0.22494, -0.1996691, 0.4883064, 0, 0.4666667, 1, 1,
0.2250085, -0.3134338, 2.548866, 0, 0.4588235, 1, 1,
0.2265201, 1.211122, -1.018473, 0, 0.454902, 1, 1,
0.227545, 0.7610523, -0.5850047, 0, 0.4470588, 1, 1,
0.2306832, 0.02434716, 3.198713, 0, 0.4431373, 1, 1,
0.2315671, 1.600868, -0.3284159, 0, 0.4352941, 1, 1,
0.2340529, 1.058724, 2.082025, 0, 0.4313726, 1, 1,
0.2355551, -1.602784, 3.077049, 0, 0.4235294, 1, 1,
0.2392387, 0.1215329, 1.657724, 0, 0.4196078, 1, 1,
0.2393259, -0.4126998, 3.840862, 0, 0.4117647, 1, 1,
0.2396586, -0.675519, 3.185865, 0, 0.4078431, 1, 1,
0.2397, -0.3468329, 2.552915, 0, 0.4, 1, 1,
0.2402126, 1.676262, -0.1586427, 0, 0.3921569, 1, 1,
0.2410498, -0.3090952, 0.1054108, 0, 0.3882353, 1, 1,
0.2412573, -0.6886188, 2.305439, 0, 0.3803922, 1, 1,
0.2439649, 1.837401, 0.7782763, 0, 0.3764706, 1, 1,
0.2458766, -0.8137444, 1.720461, 0, 0.3686275, 1, 1,
0.2537548, -0.6512306, 5.198497, 0, 0.3647059, 1, 1,
0.2564688, -0.724086, 2.377229, 0, 0.3568628, 1, 1,
0.2573988, -0.2886455, 2.510879, 0, 0.3529412, 1, 1,
0.2582005, 1.533088, 0.1453271, 0, 0.345098, 1, 1,
0.2629931, -0.3221298, 3.589845, 0, 0.3411765, 1, 1,
0.2658189, 0.9075825, 0.1230735, 0, 0.3333333, 1, 1,
0.2662407, 0.2246642, -0.5560742, 0, 0.3294118, 1, 1,
0.269202, -0.6396322, 4.00307, 0, 0.3215686, 1, 1,
0.2697426, 1.624156, -1.976651, 0, 0.3176471, 1, 1,
0.2716691, 0.4117468, -0.8074245, 0, 0.3098039, 1, 1,
0.2758957, 0.8626246, -1.482249, 0, 0.3058824, 1, 1,
0.278745, 0.289297, 2.001818, 0, 0.2980392, 1, 1,
0.2805697, 0.2908384, 1.812186, 0, 0.2901961, 1, 1,
0.2828881, -1.417654, 4.251072, 0, 0.2862745, 1, 1,
0.2839135, -1.196042, 3.898319, 0, 0.2784314, 1, 1,
0.284436, 1.248482, 2.529197, 0, 0.2745098, 1, 1,
0.2917324, 0.2486445, 2.411442, 0, 0.2666667, 1, 1,
0.2919236, 0.1977169, -0.1895735, 0, 0.2627451, 1, 1,
0.3066389, 0.7467709, 0.9060618, 0, 0.254902, 1, 1,
0.3106199, -0.1942091, 1.500884, 0, 0.2509804, 1, 1,
0.3126311, 0.3682227, 2.039343, 0, 0.2431373, 1, 1,
0.3136654, -0.6769471, 2.65945, 0, 0.2392157, 1, 1,
0.3157695, 0.3898902, 0.6943888, 0, 0.2313726, 1, 1,
0.3193212, 0.275702, 0.2618327, 0, 0.227451, 1, 1,
0.3217143, -0.4756555, 1.943332, 0, 0.2196078, 1, 1,
0.3221693, 0.2264915, 1.029122, 0, 0.2156863, 1, 1,
0.3269505, -0.6111649, 2.092731, 0, 0.2078431, 1, 1,
0.3296295, -0.2202411, 1.429089, 0, 0.2039216, 1, 1,
0.3315047, 1.019229, 0.9139709, 0, 0.1960784, 1, 1,
0.3354613, 1.91536, -0.6097947, 0, 0.1882353, 1, 1,
0.3358366, -0.7305878, 2.232962, 0, 0.1843137, 1, 1,
0.3368918, -0.4574407, 2.806838, 0, 0.1764706, 1, 1,
0.3406173, 1.079514, 0.7255597, 0, 0.172549, 1, 1,
0.3464733, -0.08709664, 1.035754, 0, 0.1647059, 1, 1,
0.347555, -1.164466, 1.492806, 0, 0.1607843, 1, 1,
0.3504139, 1.721994, -0.6196374, 0, 0.1529412, 1, 1,
0.3510564, -0.9523286, 2.642177, 0, 0.1490196, 1, 1,
0.3554499, 0.806416, -0.09827606, 0, 0.1411765, 1, 1,
0.3561043, 1.318875, 0.3735055, 0, 0.1372549, 1, 1,
0.359312, 0.1994213, 1.996856, 0, 0.1294118, 1, 1,
0.366131, -0.1379228, 0.4153811, 0, 0.1254902, 1, 1,
0.3676564, -0.5234628, 1.33288, 0, 0.1176471, 1, 1,
0.369709, -0.1817811, 3.712079, 0, 0.1137255, 1, 1,
0.3708955, -1.458548, 4.117813, 0, 0.1058824, 1, 1,
0.3758044, 0.01283798, 0.494857, 0, 0.09803922, 1, 1,
0.3774462, -0.01341055, 1.523104, 0, 0.09411765, 1, 1,
0.3786601, -1.731382, 1.495943, 0, 0.08627451, 1, 1,
0.3790787, -0.9196644, 3.097557, 0, 0.08235294, 1, 1,
0.3799876, -1.78657, 3.275095, 0, 0.07450981, 1, 1,
0.3820051, -0.7326963, 4.105588, 0, 0.07058824, 1, 1,
0.3846663, -1.028642, 1.525875, 0, 0.0627451, 1, 1,
0.3850572, 1.200379, 0.7337339, 0, 0.05882353, 1, 1,
0.3858716, 0.9417526, 1.09951, 0, 0.05098039, 1, 1,
0.3914038, -0.3736029, 2.100347, 0, 0.04705882, 1, 1,
0.3939805, -0.2489557, 1.412662, 0, 0.03921569, 1, 1,
0.3955654, 1.777477, 0.5485288, 0, 0.03529412, 1, 1,
0.396107, -1.456337, 2.739526, 0, 0.02745098, 1, 1,
0.3977694, -0.6082904, 4.213592, 0, 0.02352941, 1, 1,
0.4024031, 1.066049, -0.7427712, 0, 0.01568628, 1, 1,
0.4085859, 0.7227784, 0.1109309, 0, 0.01176471, 1, 1,
0.4093581, -0.5242005, 3.137522, 0, 0.003921569, 1, 1,
0.4123062, -0.103835, 1.707422, 0.003921569, 0, 1, 1,
0.4143553, 0.05175411, 1.831081, 0.007843138, 0, 1, 1,
0.4144753, -0.6471604, 2.348269, 0.01568628, 0, 1, 1,
0.4145879, -1.183465, 2.492366, 0.01960784, 0, 1, 1,
0.4171234, 0.3269242, 0.8659545, 0.02745098, 0, 1, 1,
0.4179907, 0.88062, 3.092152, 0.03137255, 0, 1, 1,
0.4184522, -1.190819, 4.224242, 0.03921569, 0, 1, 1,
0.4212765, 0.2562787, -1.793313, 0.04313726, 0, 1, 1,
0.4242503, -0.1774675, 1.111823, 0.05098039, 0, 1, 1,
0.4257624, 0.1112032, 0.9728965, 0.05490196, 0, 1, 1,
0.4265082, -0.9160345, 3.937974, 0.0627451, 0, 1, 1,
0.4267423, 0.2764887, 0.3009146, 0.06666667, 0, 1, 1,
0.4288177, -0.8471853, 2.505849, 0.07450981, 0, 1, 1,
0.428963, -0.05374051, 1.278083, 0.07843138, 0, 1, 1,
0.4293402, 1.650831, 0.1831632, 0.08627451, 0, 1, 1,
0.4312356, -1.656622, 3.592305, 0.09019608, 0, 1, 1,
0.4380827, -1.512187, 2.999507, 0.09803922, 0, 1, 1,
0.4420888, 0.8964261, 1.126672, 0.1058824, 0, 1, 1,
0.4425038, -1.460721, 2.784972, 0.1098039, 0, 1, 1,
0.4425549, -0.7091584, 2.865503, 0.1176471, 0, 1, 1,
0.444119, 0.8357674, 1.246445, 0.1215686, 0, 1, 1,
0.4501646, -1.047402, 2.904665, 0.1294118, 0, 1, 1,
0.4502116, -1.905563, 3.051498, 0.1333333, 0, 1, 1,
0.4560628, -1.106791, 3.516965, 0.1411765, 0, 1, 1,
0.4566337, 1.325002, -0.2635474, 0.145098, 0, 1, 1,
0.4583061, -1.872887, 2.608588, 0.1529412, 0, 1, 1,
0.4659268, 1.205495, 0.007406751, 0.1568628, 0, 1, 1,
0.4660128, -3.41154, 2.293012, 0.1647059, 0, 1, 1,
0.4675582, -2.311806, 5.014434, 0.1686275, 0, 1, 1,
0.476446, -0.9333758, 2.302352, 0.1764706, 0, 1, 1,
0.4795088, -0.6032142, 2.946676, 0.1803922, 0, 1, 1,
0.4798956, -0.9387478, 1.335383, 0.1882353, 0, 1, 1,
0.4820982, -1.400398, 2.211818, 0.1921569, 0, 1, 1,
0.4822784, 0.1721513, 0.9757732, 0.2, 0, 1, 1,
0.4840015, 2.633518, -0.3395048, 0.2078431, 0, 1, 1,
0.494543, -0.1984586, 0.5460801, 0.2117647, 0, 1, 1,
0.498565, 0.8658744, 1.574598, 0.2196078, 0, 1, 1,
0.5013073, -0.3259974, 1.696077, 0.2235294, 0, 1, 1,
0.5038782, -1.760131, 3.06072, 0.2313726, 0, 1, 1,
0.5053099, 1.341469, 1.178228, 0.2352941, 0, 1, 1,
0.5085664, -0.6881225, 3.347618, 0.2431373, 0, 1, 1,
0.5095079, -2.880114, 3.998078, 0.2470588, 0, 1, 1,
0.5127488, 0.5224178, -0.1517654, 0.254902, 0, 1, 1,
0.5165211, -0.2066633, 3.481552, 0.2588235, 0, 1, 1,
0.5169686, -0.8508195, 2.574587, 0.2666667, 0, 1, 1,
0.5179349, 0.4841757, 0.6347727, 0.2705882, 0, 1, 1,
0.5202437, -1.078267, 1.311521, 0.2784314, 0, 1, 1,
0.5218962, -0.7098422, 2.979155, 0.282353, 0, 1, 1,
0.5280068, 0.6266034, 1.828803, 0.2901961, 0, 1, 1,
0.5302339, 1.229043, 0.233709, 0.2941177, 0, 1, 1,
0.5327153, 1.240616, 0.04155703, 0.3019608, 0, 1, 1,
0.5340605, 1.707036, 0.6095956, 0.3098039, 0, 1, 1,
0.5384341, 0.7963908, 0.85943, 0.3137255, 0, 1, 1,
0.5386341, -0.4128411, 2.39697, 0.3215686, 0, 1, 1,
0.5406864, -0.8809469, 2.747027, 0.3254902, 0, 1, 1,
0.5453408, -1.912773, 3.47311, 0.3333333, 0, 1, 1,
0.5535005, -0.9385332, 2.321156, 0.3372549, 0, 1, 1,
0.5544956, 0.1840144, 2.068039, 0.345098, 0, 1, 1,
0.5602454, 0.6901721, 0.2078932, 0.3490196, 0, 1, 1,
0.5602734, 0.01510637, 1.013208, 0.3568628, 0, 1, 1,
0.5630047, 1.784068, 0.01114947, 0.3607843, 0, 1, 1,
0.5671827, -0.2445621, 1.63505, 0.3686275, 0, 1, 1,
0.5692831, 2.046715, -0.2297163, 0.372549, 0, 1, 1,
0.5698393, -0.1881568, 2.600365, 0.3803922, 0, 1, 1,
0.5698863, 0.3890784, -0.8308381, 0.3843137, 0, 1, 1,
0.5717088, -0.1374385, 1.771137, 0.3921569, 0, 1, 1,
0.5813229, 0.6395963, 2.533486, 0.3960784, 0, 1, 1,
0.5822396, 0.909202, -0.4755842, 0.4039216, 0, 1, 1,
0.5860558, 0.5780303, 1.446915, 0.4117647, 0, 1, 1,
0.5861116, 0.99949, -0.7137482, 0.4156863, 0, 1, 1,
0.5873813, -0.3391527, 0.3232816, 0.4235294, 0, 1, 1,
0.5881568, -0.3278783, 4.191736, 0.427451, 0, 1, 1,
0.5919447, 0.1277952, 1.825207, 0.4352941, 0, 1, 1,
0.5939013, -1.230907, 4.637264, 0.4392157, 0, 1, 1,
0.5941175, -2.009973, 2.792132, 0.4470588, 0, 1, 1,
0.5975595, 0.9748821, 1.896719, 0.4509804, 0, 1, 1,
0.5996324, 1.71057, 1.028202, 0.4588235, 0, 1, 1,
0.6043447, -1.029366, 4.992519, 0.4627451, 0, 1, 1,
0.6069537, 1.05904, 2.497038, 0.4705882, 0, 1, 1,
0.6163133, -0.7469889, 3.040689, 0.4745098, 0, 1, 1,
0.618952, 0.2575166, 3.036924, 0.4823529, 0, 1, 1,
0.6192874, -0.532866, 2.58517, 0.4862745, 0, 1, 1,
0.6317835, 0.003197294, 2.743736, 0.4941176, 0, 1, 1,
0.6329489, 1.182603, -0.724998, 0.5019608, 0, 1, 1,
0.6370719, 0.8597216, 2.13971, 0.5058824, 0, 1, 1,
0.6496198, 0.5980524, 1.28457, 0.5137255, 0, 1, 1,
0.6621857, 0.5292604, 0.317487, 0.5176471, 0, 1, 1,
0.6624594, -0.0017251, 0.1448583, 0.5254902, 0, 1, 1,
0.6694072, -1.074353, 2.260429, 0.5294118, 0, 1, 1,
0.674234, 1.389098, 0.6201149, 0.5372549, 0, 1, 1,
0.6744743, -0.05818808, -0.5214915, 0.5411765, 0, 1, 1,
0.67619, -0.8058479, 1.587131, 0.5490196, 0, 1, 1,
0.6771974, 0.7266487, 0.5645099, 0.5529412, 0, 1, 1,
0.6821892, 0.1823242, -0.4921659, 0.5607843, 0, 1, 1,
0.6845165, 0.7991968, 2.053721, 0.5647059, 0, 1, 1,
0.6848632, -0.4649203, 1.99527, 0.572549, 0, 1, 1,
0.6898867, 0.2108695, 1.138054, 0.5764706, 0, 1, 1,
0.6982928, 1.204417, -0.251163, 0.5843138, 0, 1, 1,
0.6991411, 0.9520867, -1.858409, 0.5882353, 0, 1, 1,
0.7021525, -1.680645, 2.330333, 0.5960785, 0, 1, 1,
0.70993, 0.4900103, 2.630204, 0.6039216, 0, 1, 1,
0.7108306, 0.2372266, 1.202485, 0.6078432, 0, 1, 1,
0.7110515, -0.5560706, 0.9236709, 0.6156863, 0, 1, 1,
0.7168485, 0.9456363, 2.598894, 0.6196079, 0, 1, 1,
0.7206876, -0.3850734, 2.247388, 0.627451, 0, 1, 1,
0.73093, 0.425753, 2.169816, 0.6313726, 0, 1, 1,
0.7332768, -0.2668431, 0.7426233, 0.6392157, 0, 1, 1,
0.7333604, -1.041338, 1.917817, 0.6431373, 0, 1, 1,
0.7355848, -0.764664, 2.740029, 0.6509804, 0, 1, 1,
0.7358936, 0.1074682, 2.729284, 0.654902, 0, 1, 1,
0.7377031, -0.5678616, 2.570912, 0.6627451, 0, 1, 1,
0.738574, 0.05114775, -0.1466819, 0.6666667, 0, 1, 1,
0.7386945, 0.7501561, -0.06725168, 0.6745098, 0, 1, 1,
0.7418252, 0.7697757, 1.121222, 0.6784314, 0, 1, 1,
0.742359, 0.6773406, 0.6105334, 0.6862745, 0, 1, 1,
0.747215, 0.2768289, -0.5298351, 0.6901961, 0, 1, 1,
0.7523693, 0.6222585, 1.280847, 0.6980392, 0, 1, 1,
0.7560108, -0.4875341, 1.534716, 0.7058824, 0, 1, 1,
0.7567909, 0.01046437, 1.920418, 0.7098039, 0, 1, 1,
0.7578129, 0.2576331, 2.054203, 0.7176471, 0, 1, 1,
0.7599713, 0.5117436, 1.302484, 0.7215686, 0, 1, 1,
0.7660293, 0.6339248, 1.435415, 0.7294118, 0, 1, 1,
0.7696592, -2.254072, 3.458968, 0.7333333, 0, 1, 1,
0.7721217, 0.4553479, 1.228385, 0.7411765, 0, 1, 1,
0.7729656, 0.5953361, -0.7566499, 0.7450981, 0, 1, 1,
0.7734339, 0.002751407, 1.419993, 0.7529412, 0, 1, 1,
0.7739136, -0.8011475, 2.764368, 0.7568628, 0, 1, 1,
0.7744602, 1.13743, 1.000154, 0.7647059, 0, 1, 1,
0.7760454, 2.305141, 2.174868, 0.7686275, 0, 1, 1,
0.7782062, -0.2396277, 1.077822, 0.7764706, 0, 1, 1,
0.7867765, -1.754326, 2.614111, 0.7803922, 0, 1, 1,
0.7875285, 1.110012, -0.08008454, 0.7882353, 0, 1, 1,
0.7881839, 0.8418157, -0.1810094, 0.7921569, 0, 1, 1,
0.7910583, -0.6468367, 3.764501, 0.8, 0, 1, 1,
0.7959167, -0.04264606, 1.544299, 0.8078431, 0, 1, 1,
0.8015053, -1.332084, 3.481627, 0.8117647, 0, 1, 1,
0.8048905, 0.8246682, 1.932427, 0.8196079, 0, 1, 1,
0.8160363, 0.5745927, 2.153909, 0.8235294, 0, 1, 1,
0.8205826, -0.5553762, 1.300782, 0.8313726, 0, 1, 1,
0.8242015, 0.2225971, -0.8327022, 0.8352941, 0, 1, 1,
0.8246434, 1.009494, 1.008016, 0.8431373, 0, 1, 1,
0.8264638, 0.4883336, 1.841628, 0.8470588, 0, 1, 1,
0.8299136, -0.2340634, 3.163665, 0.854902, 0, 1, 1,
0.8309844, -0.8121552, 1.881917, 0.8588235, 0, 1, 1,
0.8339251, -2.792853, 2.649387, 0.8666667, 0, 1, 1,
0.8459302, -1.453221, 3.468931, 0.8705882, 0, 1, 1,
0.8466684, 0.04449588, 2.857851, 0.8784314, 0, 1, 1,
0.8509796, 1.185392, 0.8609365, 0.8823529, 0, 1, 1,
0.851997, 0.1747192, 1.806048, 0.8901961, 0, 1, 1,
0.8567399, 1.810498, 0.7578939, 0.8941177, 0, 1, 1,
0.8576814, 0.4822678, 0.6873277, 0.9019608, 0, 1, 1,
0.8631388, -0.5581389, 2.381174, 0.9098039, 0, 1, 1,
0.8662071, -1.061984, 0.436307, 0.9137255, 0, 1, 1,
0.8719926, 0.5422374, 2.155729, 0.9215686, 0, 1, 1,
0.875886, -1.546155, 5.662806, 0.9254902, 0, 1, 1,
0.8759322, 0.432418, 0.4282341, 0.9333333, 0, 1, 1,
0.8820832, 0.7507533, 0.3289788, 0.9372549, 0, 1, 1,
0.8933029, 0.6284193, 0.07639026, 0.945098, 0, 1, 1,
0.8962817, 0.02920811, 0.1099202, 0.9490196, 0, 1, 1,
0.8986639, -0.5598933, 2.570863, 0.9568627, 0, 1, 1,
0.9015002, -0.5696844, 1.912974, 0.9607843, 0, 1, 1,
0.9147266, 2.079218, 2.163981, 0.9686275, 0, 1, 1,
0.9158835, -0.8842651, 2.039029, 0.972549, 0, 1, 1,
0.919094, -1.639999, 1.860633, 0.9803922, 0, 1, 1,
0.9313083, 0.4479836, 1.488652, 0.9843137, 0, 1, 1,
0.9413731, 0.3969269, -0.002401472, 0.9921569, 0, 1, 1,
0.9501675, 0.4102953, 1.111829, 0.9960784, 0, 1, 1,
0.9537215, -0.09745966, -1.06051, 1, 0, 0.9960784, 1,
0.9566632, 0.1320261, 1.86768, 1, 0, 0.9882353, 1,
0.9581769, -0.9495321, 1.730837, 1, 0, 0.9843137, 1,
0.9632652, 0.04272064, 0.309358, 1, 0, 0.9764706, 1,
0.9655462, 0.3615497, 2.30443, 1, 0, 0.972549, 1,
0.9675093, 0.4862051, 0.6232488, 1, 0, 0.9647059, 1,
0.9698035, 0.06556959, 2.454088, 1, 0, 0.9607843, 1,
0.9712435, 1.546783, 1.358331, 1, 0, 0.9529412, 1,
0.9768973, 2.034849, 0.1910462, 1, 0, 0.9490196, 1,
0.9773054, 0.04468386, 0.3542816, 1, 0, 0.9411765, 1,
0.9832204, -0.8669901, 2.860631, 1, 0, 0.9372549, 1,
0.984916, 0.3876207, 2.207956, 1, 0, 0.9294118, 1,
0.9854675, -1.040336, 2.898678, 1, 0, 0.9254902, 1,
0.9855747, 0.03426024, 1.427201, 1, 0, 0.9176471, 1,
0.9932966, -1.921723, 4.029828, 1, 0, 0.9137255, 1,
0.9950334, 0.7219533, -0.438509, 1, 0, 0.9058824, 1,
0.995837, 0.5352625, -0.4835072, 1, 0, 0.9019608, 1,
1.000013, 1.02766, 1.993717, 1, 0, 0.8941177, 1,
1.00182, -0.4919397, 1.819703, 1, 0, 0.8862745, 1,
1.006936, 0.003277876, 1.99709, 1, 0, 0.8823529, 1,
1.011546, 0.2101451, 0.544831, 1, 0, 0.8745098, 1,
1.012275, -0.0471701, 2.433721, 1, 0, 0.8705882, 1,
1.013297, -2.762951, 2.789243, 1, 0, 0.8627451, 1,
1.013467, -1.218592, 4.505664, 1, 0, 0.8588235, 1,
1.014978, -0.1537709, 1.797351, 1, 0, 0.8509804, 1,
1.017936, 1.316637, 0.3118007, 1, 0, 0.8470588, 1,
1.017959, -0.1505622, 2.416394, 1, 0, 0.8392157, 1,
1.017999, -0.9835046, 2.514682, 1, 0, 0.8352941, 1,
1.028268, 0.220968, 1.297096, 1, 0, 0.827451, 1,
1.032255, -0.2270371, 2.896197, 1, 0, 0.8235294, 1,
1.034104, 0.2947886, 1.637264, 1, 0, 0.8156863, 1,
1.044132, 0.2257152, 1.643467, 1, 0, 0.8117647, 1,
1.049756, -0.5236199, 2.60394, 1, 0, 0.8039216, 1,
1.054096, -0.2165751, 1.76484, 1, 0, 0.7960784, 1,
1.057297, -0.4710166, 2.452688, 1, 0, 0.7921569, 1,
1.057914, -0.02352983, 1.798867, 1, 0, 0.7843137, 1,
1.059993, -0.1899023, 0.9256207, 1, 0, 0.7803922, 1,
1.062905, -0.2517418, 2.024289, 1, 0, 0.772549, 1,
1.063076, 0.08363252, 1.432073, 1, 0, 0.7686275, 1,
1.065438, -0.1564563, 2.867458, 1, 0, 0.7607843, 1,
1.076488, -0.6997634, 3.667243, 1, 0, 0.7568628, 1,
1.080512, 0.2225671, 2.389953, 1, 0, 0.7490196, 1,
1.082667, 0.4787797, 0.896046, 1, 0, 0.7450981, 1,
1.092885, -0.8562861, 3.057457, 1, 0, 0.7372549, 1,
1.098112, -1.717988, 2.262682, 1, 0, 0.7333333, 1,
1.099556, -0.4469023, 0.390184, 1, 0, 0.7254902, 1,
1.101146, -1.175844, 2.622317, 1, 0, 0.7215686, 1,
1.106974, -1.144482, -0.3915441, 1, 0, 0.7137255, 1,
1.107751, -0.4410701, 2.594583, 1, 0, 0.7098039, 1,
1.108518, -0.3557981, 1.704902, 1, 0, 0.7019608, 1,
1.11219, 0.04386881, 2.675262, 1, 0, 0.6941177, 1,
1.113106, 0.3601967, 0.6909007, 1, 0, 0.6901961, 1,
1.118272, -2.419021, 2.789117, 1, 0, 0.682353, 1,
1.130454, -0.06713068, 0.2060409, 1, 0, 0.6784314, 1,
1.145187, 0.8580598, -0.559927, 1, 0, 0.6705883, 1,
1.145689, 0.7328076, 1.290494, 1, 0, 0.6666667, 1,
1.154944, 1.258632, 2.766471, 1, 0, 0.6588235, 1,
1.156929, -0.6294077, 1.654296, 1, 0, 0.654902, 1,
1.159446, 0.359702, 1.96004, 1, 0, 0.6470588, 1,
1.162442, 0.1711636, 2.630394, 1, 0, 0.6431373, 1,
1.170578, 2.026911, 1.373082, 1, 0, 0.6352941, 1,
1.172812, 1.949739, 0.9471421, 1, 0, 0.6313726, 1,
1.182126, -0.6263001, 1.367563, 1, 0, 0.6235294, 1,
1.182485, 0.04652174, 1.05969, 1, 0, 0.6196079, 1,
1.184885, -0.6764287, 1.713512, 1, 0, 0.6117647, 1,
1.1902, 0.8951381, 1.040869, 1, 0, 0.6078432, 1,
1.195161, -0.1517745, 1.081983, 1, 0, 0.6, 1,
1.199928, -0.3408659, 0.4899787, 1, 0, 0.5921569, 1,
1.207077, 1.020222, 0.2164261, 1, 0, 0.5882353, 1,
1.213226, 0.7310193, -0.9130876, 1, 0, 0.5803922, 1,
1.215573, -1.442935, 1.166012, 1, 0, 0.5764706, 1,
1.227844, 0.4037186, 0.7003794, 1, 0, 0.5686275, 1,
1.229848, -0.5617895, 0.1619177, 1, 0, 0.5647059, 1,
1.232185, -0.1860148, 0.4498526, 1, 0, 0.5568628, 1,
1.249809, -0.0712913, 2.418165, 1, 0, 0.5529412, 1,
1.254979, 0.3389783, 0.6236611, 1, 0, 0.5450981, 1,
1.255533, -0.7833377, 1.756008, 1, 0, 0.5411765, 1,
1.265312, -0.2160724, 2.634161, 1, 0, 0.5333334, 1,
1.266638, 0.6930639, 3.052948, 1, 0, 0.5294118, 1,
1.284666, 1.062951, 0.375108, 1, 0, 0.5215687, 1,
1.289253, 0.6798736, -0.6283401, 1, 0, 0.5176471, 1,
1.301208, -0.2089013, 2.372189, 1, 0, 0.509804, 1,
1.305439, 0.4769454, 0.5650882, 1, 0, 0.5058824, 1,
1.318481, 1.102622, 2.063394, 1, 0, 0.4980392, 1,
1.323343, 2.260674, -0.2505448, 1, 0, 0.4901961, 1,
1.330786, 0.9134258, 0.7094827, 1, 0, 0.4862745, 1,
1.33559, -0.6564416, 2.78717, 1, 0, 0.4784314, 1,
1.339309, 1.668761, -0.06959084, 1, 0, 0.4745098, 1,
1.341251, -0.6897751, 1.024206, 1, 0, 0.4666667, 1,
1.359763, 1.602229, 0.4931816, 1, 0, 0.4627451, 1,
1.366387, -1.795995, 4.054523, 1, 0, 0.454902, 1,
1.367894, 1.040998, 1.686788, 1, 0, 0.4509804, 1,
1.378778, 1.380146, -0.2087358, 1, 0, 0.4431373, 1,
1.3882, 2.271399, 1.438, 1, 0, 0.4392157, 1,
1.395187, 1.806684, 0.2461554, 1, 0, 0.4313726, 1,
1.418588, 0.6494375, 1.100641, 1, 0, 0.427451, 1,
1.418997, -0.5522057, 0.9647822, 1, 0, 0.4196078, 1,
1.422766, -0.09075194, 1.666587, 1, 0, 0.4156863, 1,
1.453444, 0.03294153, 2.557842, 1, 0, 0.4078431, 1,
1.458385, -0.7282032, 3.680905, 1, 0, 0.4039216, 1,
1.462551, 0.8852468, 2.895629, 1, 0, 0.3960784, 1,
1.466444, -1.007888, 4.701978, 1, 0, 0.3882353, 1,
1.482264, -0.5260861, 2.618246, 1, 0, 0.3843137, 1,
1.482385, 0.8818541, 0.1513485, 1, 0, 0.3764706, 1,
1.489075, -0.7104686, 2.654524, 1, 0, 0.372549, 1,
1.510045, -1.298783, 2.541049, 1, 0, 0.3647059, 1,
1.513781, -0.5878578, 3.157297, 1, 0, 0.3607843, 1,
1.521841, -0.2305795, 1.508285, 1, 0, 0.3529412, 1,
1.526925, -0.0925624, 1.280011, 1, 0, 0.3490196, 1,
1.544018, -0.8987959, 4.647179, 1, 0, 0.3411765, 1,
1.550584, -0.9751209, 1.474601, 1, 0, 0.3372549, 1,
1.550685, -2.676752, 1.728911, 1, 0, 0.3294118, 1,
1.553133, -0.0828753, 2.241408, 1, 0, 0.3254902, 1,
1.563471, 0.9764832, 1.42552, 1, 0, 0.3176471, 1,
1.571966, -0.7627404, 2.140434, 1, 0, 0.3137255, 1,
1.572845, -0.8738407, 1.54232, 1, 0, 0.3058824, 1,
1.584042, -0.6231881, 3.25339, 1, 0, 0.2980392, 1,
1.610761, 2.522544, 1.535502, 1, 0, 0.2941177, 1,
1.621571, -0.1846222, 2.583213, 1, 0, 0.2862745, 1,
1.627991, 1.772768, 0.02602075, 1, 0, 0.282353, 1,
1.662472, 0.235727, 1.290957, 1, 0, 0.2745098, 1,
1.68478, -0.7526323, 2.084703, 1, 0, 0.2705882, 1,
1.694936, 0.4091738, 1.352953, 1, 0, 0.2627451, 1,
1.707441, -0.1100563, 3.087129, 1, 0, 0.2588235, 1,
1.711794, 0.3100087, 1.606686, 1, 0, 0.2509804, 1,
1.716459, -1.733063, 1.72627, 1, 0, 0.2470588, 1,
1.719706, -0.6730562, 2.906432, 1, 0, 0.2392157, 1,
1.729141, -0.6820796, 1.936678, 1, 0, 0.2352941, 1,
1.729424, 1.583306, 0.7948279, 1, 0, 0.227451, 1,
1.744391, -0.07417843, 1.598428, 1, 0, 0.2235294, 1,
1.75482, -0.849472, -0.9028336, 1, 0, 0.2156863, 1,
1.760783, 0.8769123, -0.9804689, 1, 0, 0.2117647, 1,
1.771367, -0.1638761, 3.610635, 1, 0, 0.2039216, 1,
1.77238, 0.7741037, 2.181308, 1, 0, 0.1960784, 1,
1.781032, 0.4773754, -0.09138885, 1, 0, 0.1921569, 1,
1.78727, 0.5981197, 1.959282, 1, 0, 0.1843137, 1,
1.790252, 1.349764, 0.4751844, 1, 0, 0.1803922, 1,
1.79097, 0.9431252, 0.6490403, 1, 0, 0.172549, 1,
1.84125, 1.076201, -0.953364, 1, 0, 0.1686275, 1,
1.855182, -0.05486287, 0.6733723, 1, 0, 0.1607843, 1,
1.882693, -0.8464925, 3.247258, 1, 0, 0.1568628, 1,
1.893164, 1.035436, -0.4389178, 1, 0, 0.1490196, 1,
1.948926, -0.63756, 1.098523, 1, 0, 0.145098, 1,
1.96641, -0.3081392, 0.7870267, 1, 0, 0.1372549, 1,
2.012993, 0.7466121, 1.673037, 1, 0, 0.1333333, 1,
2.037279, -0.8015352, 2.172263, 1, 0, 0.1254902, 1,
2.122648, -1.269354, 1.625004, 1, 0, 0.1215686, 1,
2.142976, 0.413719, 0.9178271, 1, 0, 0.1137255, 1,
2.144168, -0.2491619, 0.8473795, 1, 0, 0.1098039, 1,
2.17146, 2.95724, -0.3058701, 1, 0, 0.1019608, 1,
2.173887, 0.1945616, 1.009797, 1, 0, 0.09411765, 1,
2.181877, 1.92691, 0.97156, 1, 0, 0.09019608, 1,
2.229439, 1.088287, 0.8431997, 1, 0, 0.08235294, 1,
2.263116, -1.116163, -0.4725378, 1, 0, 0.07843138, 1,
2.266738, 1.196766, 2.48265, 1, 0, 0.07058824, 1,
2.279083, 1.613337, 0.1116126, 1, 0, 0.06666667, 1,
2.468105, -1.015812, -0.3279226, 1, 0, 0.05882353, 1,
2.470425, 1.183087, 0.1847169, 1, 0, 0.05490196, 1,
2.659369, -0.5220929, 1.16395, 1, 0, 0.04705882, 1,
2.663769, 0.2057795, 3.399347, 1, 0, 0.04313726, 1,
2.704849, -0.2761202, 1.891971, 1, 0, 0.03529412, 1,
2.76647, -1.859694, 3.126116, 1, 0, 0.03137255, 1,
3.01072, 0.20921, 0.9766542, 1, 0, 0.02352941, 1,
3.026947, -0.8363137, 2.266176, 1, 0, 0.01960784, 1,
3.228381, -0.680523, -0.6230751, 1, 0, 0.01176471, 1,
3.29387, -0.32458, 1.649667, 1, 0, 0.007843138, 1
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
0.3233576, -4.638889, -7.647633, 0, -0.5, 0.5, 0.5,
0.3233576, -4.638889, -7.647633, 1, -0.5, 0.5, 0.5,
0.3233576, -4.638889, -7.647633, 1, 1.5, 0.5, 0.5,
0.3233576, -4.638889, -7.647633, 0, 1.5, 0.5, 0.5
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
-3.654159, -0.290357, -7.647633, 0, -0.5, 0.5, 0.5,
-3.654159, -0.290357, -7.647633, 1, -0.5, 0.5, 0.5,
-3.654159, -0.290357, -7.647633, 1, 1.5, 0.5, 0.5,
-3.654159, -0.290357, -7.647633, 0, 1.5, 0.5, 0.5
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
-3.654159, -4.638889, -0.02784777, 0, -0.5, 0.5, 0.5,
-3.654159, -4.638889, -0.02784777, 1, -0.5, 0.5, 0.5,
-3.654159, -4.638889, -0.02784777, 1, 1.5, 0.5, 0.5,
-3.654159, -4.638889, -0.02784777, 0, 1.5, 0.5, 0.5
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
-2, -3.635382, -5.889221,
3, -3.635382, -5.889221,
-2, -3.635382, -5.889221,
-2, -3.802633, -6.182289,
-1, -3.635382, -5.889221,
-1, -3.802633, -6.182289,
0, -3.635382, -5.889221,
0, -3.802633, -6.182289,
1, -3.635382, -5.889221,
1, -3.802633, -6.182289,
2, -3.635382, -5.889221,
2, -3.802633, -6.182289,
3, -3.635382, -5.889221,
3, -3.802633, -6.182289
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
-2, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
-2, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
-2, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
-2, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5,
-1, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
-1, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
-1, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
-1, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5,
0, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
0, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
0, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
0, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5,
1, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
1, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
1, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
1, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5,
2, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
2, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
2, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
2, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5,
3, -4.137136, -6.768426, 0, -0.5, 0.5, 0.5,
3, -4.137136, -6.768426, 1, -0.5, 0.5, 0.5,
3, -4.137136, -6.768426, 1, 1.5, 0.5, 0.5,
3, -4.137136, -6.768426, 0, 1.5, 0.5, 0.5
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
-2.73627, -3, -5.889221,
-2.73627, 2, -5.889221,
-2.73627, -3, -5.889221,
-2.889252, -3, -6.182289,
-2.73627, -2, -5.889221,
-2.889252, -2, -6.182289,
-2.73627, -1, -5.889221,
-2.889252, -1, -6.182289,
-2.73627, 0, -5.889221,
-2.889252, 0, -6.182289,
-2.73627, 1, -5.889221,
-2.889252, 1, -6.182289,
-2.73627, 2, -5.889221,
-2.889252, 2, -6.182289
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
-3.195215, -3, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, -3, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, -3, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, -3, -6.768426, 0, 1.5, 0.5, 0.5,
-3.195215, -2, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, -2, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, -2, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, -2, -6.768426, 0, 1.5, 0.5, 0.5,
-3.195215, -1, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, -1, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, -1, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, -1, -6.768426, 0, 1.5, 0.5, 0.5,
-3.195215, 0, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, 0, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, 0, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, 0, -6.768426, 0, 1.5, 0.5, 0.5,
-3.195215, 1, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, 1, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, 1, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, 1, -6.768426, 0, 1.5, 0.5, 0.5,
-3.195215, 2, -6.768426, 0, -0.5, 0.5, 0.5,
-3.195215, 2, -6.768426, 1, -0.5, 0.5, 0.5,
-3.195215, 2, -6.768426, 1, 1.5, 0.5, 0.5,
-3.195215, 2, -6.768426, 0, 1.5, 0.5, 0.5
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
-2.73627, -3.635382, -4,
-2.73627, -3.635382, 4,
-2.73627, -3.635382, -4,
-2.889252, -3.802633, -4,
-2.73627, -3.635382, -2,
-2.889252, -3.802633, -2,
-2.73627, -3.635382, 0,
-2.889252, -3.802633, 0,
-2.73627, -3.635382, 2,
-2.889252, -3.802633, 2,
-2.73627, -3.635382, 4,
-2.889252, -3.802633, 4
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
-3.195215, -4.137136, -4, 0, -0.5, 0.5, 0.5,
-3.195215, -4.137136, -4, 1, -0.5, 0.5, 0.5,
-3.195215, -4.137136, -4, 1, 1.5, 0.5, 0.5,
-3.195215, -4.137136, -4, 0, 1.5, 0.5, 0.5,
-3.195215, -4.137136, -2, 0, -0.5, 0.5, 0.5,
-3.195215, -4.137136, -2, 1, -0.5, 0.5, 0.5,
-3.195215, -4.137136, -2, 1, 1.5, 0.5, 0.5,
-3.195215, -4.137136, -2, 0, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 0, 0, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 0, 1, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 0, 1, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 0, 0, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 2, 0, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 2, 1, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 2, 1, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 2, 0, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 4, 0, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 4, 1, -0.5, 0.5, 0.5,
-3.195215, -4.137136, 4, 1, 1.5, 0.5, 0.5,
-3.195215, -4.137136, 4, 0, 1.5, 0.5, 0.5
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
-2.73627, -3.635382, -5.889221,
-2.73627, 3.054668, -5.889221,
-2.73627, -3.635382, 5.833525,
-2.73627, 3.054668, 5.833525,
-2.73627, -3.635382, -5.889221,
-2.73627, -3.635382, 5.833525,
-2.73627, 3.054668, -5.889221,
-2.73627, 3.054668, 5.833525,
-2.73627, -3.635382, -5.889221,
3.382986, -3.635382, -5.889221,
-2.73627, -3.635382, 5.833525,
3.382986, -3.635382, 5.833525,
-2.73627, 3.054668, -5.889221,
3.382986, 3.054668, -5.889221,
-2.73627, 3.054668, 5.833525,
3.382986, 3.054668, 5.833525,
3.382986, -3.635382, -5.889221,
3.382986, 3.054668, -5.889221,
3.382986, -3.635382, 5.833525,
3.382986, 3.054668, 5.833525,
3.382986, -3.635382, -5.889221,
3.382986, -3.635382, 5.833525,
3.382986, 3.054668, -5.889221,
3.382986, 3.054668, 5.833525
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
var radius = 7.913456;
var distance = 35.20786;
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
mvMatrix.translate( -0.3233576, 0.290357, 0.02784777 );
mvMatrix.scale( 1.398239, 1.278942, 0.7298788 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.20786);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Acephat<-read.table("Acephat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Acephat$V2
```

```
## Error in eval(expr, envir, enclos): object 'Acephat' not found
```

```r
y<-Acephat$V3
```

```
## Error in eval(expr, envir, enclos): object 'Acephat' not found
```

```r
z<-Acephat$V4
```

```
## Error in eval(expr, envir, enclos): object 'Acephat' not found
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
-2.647155, -1.37834, -2.163799, 0, 0, 1, 1, 1,
-2.55322, -0.02947808, -0.9703596, 1, 0, 0, 1, 1,
-2.454399, 0.1315899, -1.101016, 1, 0, 0, 1, 1,
-2.452201, 0.1639726, -2.134187, 1, 0, 0, 1, 1,
-2.438756, -1.027373, -2.234798, 1, 0, 0, 1, 1,
-2.432988, -0.09139118, -1.566076, 1, 0, 0, 1, 1,
-2.354525, -0.9074097, -3.369114, 0, 0, 0, 1, 1,
-2.336849, 0.823474, -2.307001, 0, 0, 0, 1, 1,
-2.315028, -1.563109, -2.397531, 0, 0, 0, 1, 1,
-2.296597, 0.2606224, -2.728281, 0, 0, 0, 1, 1,
-2.294554, -0.08641423, -1.96717, 0, 0, 0, 1, 1,
-2.286042, -1.375298, -0.8653832, 0, 0, 0, 1, 1,
-2.272905, -1.045245, -0.2685809, 0, 0, 0, 1, 1,
-2.232846, -1.544638, -2.179562, 1, 1, 1, 1, 1,
-2.19676, -1.846576, -1.943095, 1, 1, 1, 1, 1,
-2.158336, -0.09243421, -1.489037, 1, 1, 1, 1, 1,
-2.115517, 0.0144941, -3.804918, 1, 1, 1, 1, 1,
-2.102551, 1.029787, -0.7602426, 1, 1, 1, 1, 1,
-2.086189, -0.07607248, -0.1218112, 1, 1, 1, 1, 1,
-2.069826, 0.3023063, -0.434518, 1, 1, 1, 1, 1,
-2.04522, 0.04747164, -2.367392, 1, 1, 1, 1, 1,
-2.043958, -0.4065425, -0.7770141, 1, 1, 1, 1, 1,
-2.040909, 2.400569, -0.758607, 1, 1, 1, 1, 1,
-2.017169, -1.653027, -2.75425, 1, 1, 1, 1, 1,
-2.015152, 0.2256016, -2.353079, 1, 1, 1, 1, 1,
-2.000795, 2.081132, -1.868641, 1, 1, 1, 1, 1,
-1.995466, -1.479024, -4.461855, 1, 1, 1, 1, 1,
-1.964722, 0.338805, -2.793066, 1, 1, 1, 1, 1,
-1.954511, 0.02525588, -2.100555, 0, 0, 1, 1, 1,
-1.932225, 0.1924637, -1.261349, 1, 0, 0, 1, 1,
-1.906937, 0.2190515, 0.08275354, 1, 0, 0, 1, 1,
-1.897668, -0.7928212, -2.89115, 1, 0, 0, 1, 1,
-1.849591, -1.936481, -1.967667, 1, 0, 0, 1, 1,
-1.845386, -0.08086503, -0.824779, 1, 0, 0, 1, 1,
-1.845374, 0.5146789, 1.086267, 0, 0, 0, 1, 1,
-1.836408, -0.09428339, -3.344137, 0, 0, 0, 1, 1,
-1.808791, -0.006274383, -1.837013, 0, 0, 0, 1, 1,
-1.806969, -1.456534, -3.077031, 0, 0, 0, 1, 1,
-1.805526, -0.1217228, -1.801853, 0, 0, 0, 1, 1,
-1.790334, -1.238306, -0.8381315, 0, 0, 0, 1, 1,
-1.745868, 0.7274598, -2.335676, 0, 0, 0, 1, 1,
-1.739274, -1.376668, -2.631917, 1, 1, 1, 1, 1,
-1.738218, -0.005118322, -0.9943833, 1, 1, 1, 1, 1,
-1.724377, 0.7396441, -0.9857259, 1, 1, 1, 1, 1,
-1.708425, -1.007732, -2.774127, 1, 1, 1, 1, 1,
-1.702331, 1.174927, -1.734275, 1, 1, 1, 1, 1,
-1.696021, -0.2991235, -1.39402, 1, 1, 1, 1, 1,
-1.693216, -0.8542997, -2.045316, 1, 1, 1, 1, 1,
-1.637734, -0.3640976, -2.379622, 1, 1, 1, 1, 1,
-1.635682, -0.2156465, -2.244151, 1, 1, 1, 1, 1,
-1.6354, 0.006944458, -1.109591, 1, 1, 1, 1, 1,
-1.626774, 0.2767641, -1.448918, 1, 1, 1, 1, 1,
-1.626438, -1.665084, -3.518159, 1, 1, 1, 1, 1,
-1.617916, -0.1908351, -3.139995, 1, 1, 1, 1, 1,
-1.612993, 1.083825, -0.7452712, 1, 1, 1, 1, 1,
-1.572946, 0.58798, -0.6580828, 1, 1, 1, 1, 1,
-1.552647, -0.4242395, -0.8548191, 0, 0, 1, 1, 1,
-1.546853, 1.927176, -1.55349, 1, 0, 0, 1, 1,
-1.544747, -0.03860665, -2.702974, 1, 0, 0, 1, 1,
-1.543554, 1.045614, -1.525881, 1, 0, 0, 1, 1,
-1.519446, 0.134898, -1.966409, 1, 0, 0, 1, 1,
-1.504959, 1.811128, -0.8562758, 1, 0, 0, 1, 1,
-1.491156, 1.359939, -2.249714, 0, 0, 0, 1, 1,
-1.477042, -0.2164964, -1.641174, 0, 0, 0, 1, 1,
-1.476603, 1.068213, -1.140383, 0, 0, 0, 1, 1,
-1.471019, -1.78485, -2.088974, 0, 0, 0, 1, 1,
-1.466926, 0.8849509, -0.7852821, 0, 0, 0, 1, 1,
-1.466576, -1.679819, -3.2112, 0, 0, 0, 1, 1,
-1.45268, 0.7810371, -0.05284737, 0, 0, 0, 1, 1,
-1.446823, 0.4432235, -1.045118, 1, 1, 1, 1, 1,
-1.414024, -0.7977508, -1.837549, 1, 1, 1, 1, 1,
-1.411183, 0.6416832, 0.2954051, 1, 1, 1, 1, 1,
-1.403221, 0.3145785, -2.257452, 1, 1, 1, 1, 1,
-1.392444, 0.2021605, -2.472412, 1, 1, 1, 1, 1,
-1.382163, -0.1148079, -2.926018, 1, 1, 1, 1, 1,
-1.379531, 1.146027, -0.03524926, 1, 1, 1, 1, 1,
-1.366983, 1.732029, -0.4925457, 1, 1, 1, 1, 1,
-1.355781, -0.7065004, -2.472545, 1, 1, 1, 1, 1,
-1.353099, -0.1336024, -1.493751, 1, 1, 1, 1, 1,
-1.351202, -0.7891004, -1.770656, 1, 1, 1, 1, 1,
-1.34928, -0.1283388, -3.619724, 1, 1, 1, 1, 1,
-1.34344, -2.132637, -1.442049, 1, 1, 1, 1, 1,
-1.33512, -0.3754564, -0.9071211, 1, 1, 1, 1, 1,
-1.330078, -1.029871, -3.078462, 1, 1, 1, 1, 1,
-1.325064, 1.205398, 0.4114219, 0, 0, 1, 1, 1,
-1.313169, -0.2467818, -1.989518, 1, 0, 0, 1, 1,
-1.311139, -0.2843184, -0.9040802, 1, 0, 0, 1, 1,
-1.308941, -1.672596, -4.588859, 1, 0, 0, 1, 1,
-1.307732, 0.9727538, -1.21475, 1, 0, 0, 1, 1,
-1.302151, 0.1668347, -1.43127, 1, 0, 0, 1, 1,
-1.295194, -0.6728183, -1.82803, 0, 0, 0, 1, 1,
-1.284587, -0.2740353, -1.020374, 0, 0, 0, 1, 1,
-1.278941, 0.1769805, -2.86668, 0, 0, 0, 1, 1,
-1.277962, -0.7008758, -2.630771, 0, 0, 0, 1, 1,
-1.275181, 0.9759812, 0.3610293, 0, 0, 0, 1, 1,
-1.272674, 0.6636305, -1.352101, 0, 0, 0, 1, 1,
-1.265583, -0.04267945, -2.963726, 0, 0, 0, 1, 1,
-1.258811, 1.401867, -0.9951607, 1, 1, 1, 1, 1,
-1.254572, 0.7992672, -0.5778013, 1, 1, 1, 1, 1,
-1.248489, -0.2751667, -0.2990966, 1, 1, 1, 1, 1,
-1.24292, 1.361022, -0.9134481, 1, 1, 1, 1, 1,
-1.242802, -0.4080637, -1.525624, 1, 1, 1, 1, 1,
-1.236912, -0.7261884, -2.241412, 1, 1, 1, 1, 1,
-1.232056, 1.011786, -2.992369, 1, 1, 1, 1, 1,
-1.226316, -0.4725353, -0.8342287, 1, 1, 1, 1, 1,
-1.220571, -0.06301316, -0.1793155, 1, 1, 1, 1, 1,
-1.218807, -1.172463, -2.501305, 1, 1, 1, 1, 1,
-1.218186, 1.118464, -0.3748197, 1, 1, 1, 1, 1,
-1.217915, 0.708034, -0.2609375, 1, 1, 1, 1, 1,
-1.211099, -0.6158583, -0.4225795, 1, 1, 1, 1, 1,
-1.208324, 0.0397101, -1.443372, 1, 1, 1, 1, 1,
-1.198004, 1.193571, -1.493614, 1, 1, 1, 1, 1,
-1.196395, -0.1869785, -2.531681, 0, 0, 1, 1, 1,
-1.185418, 0.2586425, -3.47648, 1, 0, 0, 1, 1,
-1.174787, -0.08671317, -2.358567, 1, 0, 0, 1, 1,
-1.173365, -1.389985, -2.837251, 1, 0, 0, 1, 1,
-1.173067, -0.5350608, -3.335176, 1, 0, 0, 1, 1,
-1.168377, 0.01779902, -0.7752232, 1, 0, 0, 1, 1,
-1.167492, -0.001524055, -0.1719052, 0, 0, 0, 1, 1,
-1.160019, -0.2454661, -0.7025165, 0, 0, 0, 1, 1,
-1.159535, -1.98044, -3.278252, 0, 0, 0, 1, 1,
-1.157496, -0.5716597, -0.6093441, 0, 0, 0, 1, 1,
-1.152415, -0.6804713, -2.795682, 0, 0, 0, 1, 1,
-1.150073, -0.756367, -2.477579, 0, 0, 0, 1, 1,
-1.146733, 2.112314, -0.902188, 0, 0, 0, 1, 1,
-1.143981, -0.6952978, -2.206306, 1, 1, 1, 1, 1,
-1.139686, -0.551088, -0.6493231, 1, 1, 1, 1, 1,
-1.136801, -0.5529629, -1.841761, 1, 1, 1, 1, 1,
-1.133027, 2.472909, -0.2331872, 1, 1, 1, 1, 1,
-1.131001, 1.382241, 0.5369365, 1, 1, 1, 1, 1,
-1.13044, 1.363213, -2.517066, 1, 1, 1, 1, 1,
-1.1191, 1.166533, -0.7655854, 1, 1, 1, 1, 1,
-1.118645, 1.049609, -3.311807, 1, 1, 1, 1, 1,
-1.11848, -0.4832024, -3.437135, 1, 1, 1, 1, 1,
-1.115221, 1.704832, 1.173656, 1, 1, 1, 1, 1,
-1.107718, 0.8294004, 0.8902172, 1, 1, 1, 1, 1,
-1.098083, -1.759805, -3.258845, 1, 1, 1, 1, 1,
-1.097009, -0.06127042, -2.465404, 1, 1, 1, 1, 1,
-1.096615, 2.55294, -0.5549616, 1, 1, 1, 1, 1,
-1.096319, -1.696141, -1.772403, 1, 1, 1, 1, 1,
-1.062514, 0.8925954, -1.633274, 0, 0, 1, 1, 1,
-1.059635, 0.796658, -0.2572955, 1, 0, 0, 1, 1,
-1.052977, 0.9554237, -1.250918, 1, 0, 0, 1, 1,
-1.050187, -0.3203425, -1.781118, 1, 0, 0, 1, 1,
-1.049152, -0.5940422, -1.88236, 1, 0, 0, 1, 1,
-1.045015, 1.843338, -3.033177, 1, 0, 0, 1, 1,
-1.031905, -1.090292, -2.604893, 0, 0, 0, 1, 1,
-1.024994, -1.024419, -2.101979, 0, 0, 0, 1, 1,
-1.023647, 0.08164486, -1.009795, 0, 0, 0, 1, 1,
-1.019613, -0.5011463, -2.873242, 0, 0, 0, 1, 1,
-1.0137, 0.7598323, -0.6878111, 0, 0, 0, 1, 1,
-1.009816, -0.6897865, -1.320094, 0, 0, 0, 1, 1,
-1.009124, 0.5971512, 0.7667443, 0, 0, 0, 1, 1,
-1.003556, -0.4496912, -3.174904, 1, 1, 1, 1, 1,
-1.002131, -0.2648206, -3.023647, 1, 1, 1, 1, 1,
-1.001453, -0.2714145, -3.457764, 1, 1, 1, 1, 1,
-0.9834453, -0.9194337, -0.628494, 1, 1, 1, 1, 1,
-0.9831114, -0.5721636, -1.179389, 1, 1, 1, 1, 1,
-0.9819317, 0.6124645, -1.812362, 1, 1, 1, 1, 1,
-0.9815395, -0.6566119, -2.445868, 1, 1, 1, 1, 1,
-0.9742553, 0.01895617, -2.020374, 1, 1, 1, 1, 1,
-0.9735759, 0.5402578, -1.314999, 1, 1, 1, 1, 1,
-0.9734939, 0.1067817, -1.116485, 1, 1, 1, 1, 1,
-0.970507, -0.6057004, -2.02404, 1, 1, 1, 1, 1,
-0.9642697, -1.63482, -1.896394, 1, 1, 1, 1, 1,
-0.9636763, -0.4024699, -1.04977, 1, 1, 1, 1, 1,
-0.9629129, -0.9905311, -2.330776, 1, 1, 1, 1, 1,
-0.9626334, 0.4672508, -0.6145092, 1, 1, 1, 1, 1,
-0.957127, 0.7891793, -0.2685171, 0, 0, 1, 1, 1,
-0.9545447, 0.2114389, 0.2773192, 1, 0, 0, 1, 1,
-0.9511456, 0.9424815, 0.3521041, 1, 0, 0, 1, 1,
-0.9461151, -1.770002, -1.626873, 1, 0, 0, 1, 1,
-0.938806, -0.2553928, -2.65932, 1, 0, 0, 1, 1,
-0.9292998, 1.380403, -0.8177949, 1, 0, 0, 1, 1,
-0.9281477, -1.523219, -4.111455, 0, 0, 0, 1, 1,
-0.9257697, 0.4924113, -2.421073, 0, 0, 0, 1, 1,
-0.9233882, 0.01389565, -0.996845, 0, 0, 0, 1, 1,
-0.9233124, 0.3174062, -0.9945549, 0, 0, 0, 1, 1,
-0.9152964, 1.293226, -2.168052, 0, 0, 0, 1, 1,
-0.9086914, -0.1028283, -1.972299, 0, 0, 0, 1, 1,
-0.907896, 1.605182, -2.088259, 0, 0, 0, 1, 1,
-0.9073892, -1.367524, -2.843201, 1, 1, 1, 1, 1,
-0.9063435, -0.9575135, -4.138974, 1, 1, 1, 1, 1,
-0.9045694, 0.2278448, -3.489267, 1, 1, 1, 1, 1,
-0.9028348, 0.1792051, -2.942803, 1, 1, 1, 1, 1,
-0.8998141, -0.4064189, -1.16464, 1, 1, 1, 1, 1,
-0.8973837, -0.05009594, -0.5757563, 1, 1, 1, 1, 1,
-0.8968425, 0.2602667, -0.1726402, 1, 1, 1, 1, 1,
-0.894712, 2.312999, 0.4362087, 1, 1, 1, 1, 1,
-0.8918741, 0.3855376, 0.3181842, 1, 1, 1, 1, 1,
-0.8859166, 0.8590046, -1.715566, 1, 1, 1, 1, 1,
-0.881197, 2.174819, 0.2564197, 1, 1, 1, 1, 1,
-0.8792433, -0.5343814, -0.1966337, 1, 1, 1, 1, 1,
-0.8721036, 0.6823168, -1.66098, 1, 1, 1, 1, 1,
-0.8665576, 0.4365493, -1.542264, 1, 1, 1, 1, 1,
-0.8644841, -0.8593865, -3.068411, 1, 1, 1, 1, 1,
-0.8612573, 0.4647757, -1.028789, 0, 0, 1, 1, 1,
-0.86072, 0.5714617, -3.143726, 1, 0, 0, 1, 1,
-0.8574789, -0.01010685, -0.8300835, 1, 0, 0, 1, 1,
-0.8510858, -0.7645038, -3.088908, 1, 0, 0, 1, 1,
-0.8495125, 0.9109935, -0.8661742, 1, 0, 0, 1, 1,
-0.8418306, 1.892767, -0.6251267, 1, 0, 0, 1, 1,
-0.8386337, 1.824167, -0.11152, 0, 0, 0, 1, 1,
-0.8363443, 0.3027, 0.3978553, 0, 0, 0, 1, 1,
-0.8358784, -0.8316606, -2.282982, 0, 0, 0, 1, 1,
-0.822268, -1.60044, -1.827909, 0, 0, 0, 1, 1,
-0.8211901, 0.4700238, 0.2417404, 0, 0, 0, 1, 1,
-0.8135485, -0.01475796, -1.690034, 0, 0, 0, 1, 1,
-0.8124744, -0.9723995, -2.951375, 0, 0, 0, 1, 1,
-0.8096238, -1.422155, -2.380267, 1, 1, 1, 1, 1,
-0.8071987, 2.40757, -0.07974543, 1, 1, 1, 1, 1,
-0.8008867, -1.007514, -2.520254, 1, 1, 1, 1, 1,
-0.7997136, 0.1510623, -1.997398, 1, 1, 1, 1, 1,
-0.7953624, 1.090913, -1.185968, 1, 1, 1, 1, 1,
-0.7821811, 0.7705677, -0.05532562, 1, 1, 1, 1, 1,
-0.7819839, 0.07940251, -0.1079897, 1, 1, 1, 1, 1,
-0.7742255, -0.1260033, -2.767577, 1, 1, 1, 1, 1,
-0.7649118, 0.170066, -1.793448, 1, 1, 1, 1, 1,
-0.7499822, 0.307231, -1.070022, 1, 1, 1, 1, 1,
-0.7480051, 0.6845455, -0.4845141, 1, 1, 1, 1, 1,
-0.7472974, -0.2738148, -0.597518, 1, 1, 1, 1, 1,
-0.7450178, -0.7010276, -2.719343, 1, 1, 1, 1, 1,
-0.743542, -1.403801, -3.698715, 1, 1, 1, 1, 1,
-0.7323136, 0.1107063, -1.212803, 1, 1, 1, 1, 1,
-0.7307922, -1.170128, -3.46809, 0, 0, 1, 1, 1,
-0.7304269, -0.821588, -2.602379, 1, 0, 0, 1, 1,
-0.7251288, -0.3073837, -1.032225, 1, 0, 0, 1, 1,
-0.7231762, 0.06624327, 0.04574411, 1, 0, 0, 1, 1,
-0.7230849, -0.01518459, -1.321978, 1, 0, 0, 1, 1,
-0.7191039, -1.090708, -2.894905, 1, 0, 0, 1, 1,
-0.7150226, -0.1108104, -1.338767, 0, 0, 0, 1, 1,
-0.7142693, -0.06443064, -2.250963, 0, 0, 0, 1, 1,
-0.7137039, -1.792727, -5.718501, 0, 0, 0, 1, 1,
-0.7130775, 0.007709843, -2.986661, 0, 0, 0, 1, 1,
-0.711691, -0.4394391, -3.238389, 0, 0, 0, 1, 1,
-0.7104356, -0.162428, -3.322112, 0, 0, 0, 1, 1,
-0.7066529, 0.5352111, -0.06596854, 0, 0, 0, 1, 1,
-0.706405, -0.7133877, -2.796559, 1, 1, 1, 1, 1,
-0.6994709, 0.3518137, 0.1209501, 1, 1, 1, 1, 1,
-0.6868579, -0.03607604, -2.0375, 1, 1, 1, 1, 1,
-0.6856617, -0.5269721, -0.2641782, 1, 1, 1, 1, 1,
-0.6822931, 0.2560702, -0.8448053, 1, 1, 1, 1, 1,
-0.6803548, 1.268545, 0.5417535, 1, 1, 1, 1, 1,
-0.6789277, -0.6805571, -1.75175, 1, 1, 1, 1, 1,
-0.6749789, -1.546128, -3.374248, 1, 1, 1, 1, 1,
-0.673673, -0.5318123, -3.481164, 1, 1, 1, 1, 1,
-0.6695283, -0.001682695, -1.540365, 1, 1, 1, 1, 1,
-0.6612699, 0.01447541, -1.430489, 1, 1, 1, 1, 1,
-0.65026, -0.8402495, -4.057363, 1, 1, 1, 1, 1,
-0.6458699, 0.3108155, -0.659379, 1, 1, 1, 1, 1,
-0.6453501, 0.2056724, -1.492412, 1, 1, 1, 1, 1,
-0.6383134, 0.3570908, -0.8284222, 1, 1, 1, 1, 1,
-0.6352605, 0.3593544, -0.8779669, 0, 0, 1, 1, 1,
-0.6351157, 0.8487337, 0.3273712, 1, 0, 0, 1, 1,
-0.6316468, 0.02356432, -2.057016, 1, 0, 0, 1, 1,
-0.6305751, 1.647949, 0.9566177, 1, 0, 0, 1, 1,
-0.629931, 0.7513552, -0.1731999, 1, 0, 0, 1, 1,
-0.6293749, -1.543671, -3.179267, 1, 0, 0, 1, 1,
-0.6205924, 0.05509773, -2.680362, 0, 0, 0, 1, 1,
-0.6186975, -0.07522207, -0.8535729, 0, 0, 0, 1, 1,
-0.6149647, -0.6707283, -1.022842, 0, 0, 0, 1, 1,
-0.6136887, -0.01021063, -1.09149, 0, 0, 0, 1, 1,
-0.6093886, 1.087381, -1.547234, 0, 0, 0, 1, 1,
-0.6089455, -1.093569, -4.648345, 0, 0, 0, 1, 1,
-0.6083243, -1.273385, -2.453822, 0, 0, 0, 1, 1,
-0.5883322, -1.015218, -3.198721, 1, 1, 1, 1, 1,
-0.5832946, -0.6856547, -1.989132, 1, 1, 1, 1, 1,
-0.5797088, 0.5781505, -0.8658932, 1, 1, 1, 1, 1,
-0.5767213, -1.063481, -1.480696, 1, 1, 1, 1, 1,
-0.5758251, -0.5171934, -1.863217, 1, 1, 1, 1, 1,
-0.5757571, 0.2827729, -0.6086412, 1, 1, 1, 1, 1,
-0.5742886, -0.7061245, -3.799471, 1, 1, 1, 1, 1,
-0.5738684, -2.132203, -3.075606, 1, 1, 1, 1, 1,
-0.5736089, -2.095205, -4.104703, 1, 1, 1, 1, 1,
-0.5705823, -1.29379, -2.22194, 1, 1, 1, 1, 1,
-0.5705671, 0.9849043, -0.5475482, 1, 1, 1, 1, 1,
-0.5670054, 1.819783, -0.8409697, 1, 1, 1, 1, 1,
-0.5603089, 1.284612, -1.631669, 1, 1, 1, 1, 1,
-0.5599777, -0.847072, -2.31897, 1, 1, 1, 1, 1,
-0.5593317, -1.219599, -3.855751, 1, 1, 1, 1, 1,
-0.5482468, 0.2348627, -1.609843, 0, 0, 1, 1, 1,
-0.5461337, -0.576898, -1.760769, 1, 0, 0, 1, 1,
-0.5448194, -1.290612, -0.6486312, 1, 0, 0, 1, 1,
-0.5409184, 0.4298702, -1.155541, 1, 0, 0, 1, 1,
-0.5405834, -0.09363101, -1.816099, 1, 0, 0, 1, 1,
-0.5380608, 0.4636997, -0.4915502, 1, 0, 0, 1, 1,
-0.532295, 1.209417, -2.436201, 0, 0, 0, 1, 1,
-0.5258271, -0.4452126, -2.481936, 0, 0, 0, 1, 1,
-0.5257747, 0.9897041, -1.796525, 0, 0, 0, 1, 1,
-0.5255405, 0.4107849, -0.9860788, 0, 0, 0, 1, 1,
-0.523021, 0.6222981, 0.8019532, 0, 0, 0, 1, 1,
-0.516497, 0.3428527, -0.5360594, 0, 0, 0, 1, 1,
-0.5142471, -0.7650964, -2.362128, 0, 0, 0, 1, 1,
-0.5139644, -0.7330565, -3.088928, 1, 1, 1, 1, 1,
-0.5121861, 0.2312358, -2.318425, 1, 1, 1, 1, 1,
-0.5120943, 0.6059589, -0.4271676, 1, 1, 1, 1, 1,
-0.5111141, -0.1579995, -1.540165, 1, 1, 1, 1, 1,
-0.505823, 1.054201, -0.2598385, 1, 1, 1, 1, 1,
-0.5038972, 0.7188499, -0.174824, 1, 1, 1, 1, 1,
-0.5035492, 0.5614372, -2.729571, 1, 1, 1, 1, 1,
-0.5028701, 1.756728, -1.19241, 1, 1, 1, 1, 1,
-0.502637, -0.2249658, 0.5140324, 1, 1, 1, 1, 1,
-0.4994659, -0.6962794, -4.321077, 1, 1, 1, 1, 1,
-0.4947014, 1.673018, -0.8675597, 1, 1, 1, 1, 1,
-0.4868416, 0.3067257, -2.93593, 1, 1, 1, 1, 1,
-0.4789251, 1.35939, -1.702391, 1, 1, 1, 1, 1,
-0.4782073, -2.070467, -3.313949, 1, 1, 1, 1, 1,
-0.4772875, 0.5246068, -2.540863, 1, 1, 1, 1, 1,
-0.475172, -2.138765, -3.591809, 0, 0, 1, 1, 1,
-0.4734938, 1.07552, -0.1237324, 1, 0, 0, 1, 1,
-0.4713685, 0.8233028, -1.683401, 1, 0, 0, 1, 1,
-0.4653788, -0.8641994, -1.82536, 1, 0, 0, 1, 1,
-0.4649096, 1.398217, 0.5589294, 1, 0, 0, 1, 1,
-0.4626326, -0.2617157, -0.5012761, 1, 0, 0, 1, 1,
-0.46243, -0.4261726, -2.639416, 0, 0, 0, 1, 1,
-0.4612769, -1.878607, -2.437291, 0, 0, 0, 1, 1,
-0.4549831, 0.1521745, -2.592696, 0, 0, 0, 1, 1,
-0.4532261, -0.464937, -3.391378, 0, 0, 0, 1, 1,
-0.4531707, -1.316648, -4.503122, 0, 0, 0, 1, 1,
-0.4526426, 1.719968, -0.7231187, 0, 0, 0, 1, 1,
-0.4480495, -0.9245587, -1.802114, 0, 0, 0, 1, 1,
-0.4395052, -0.1169448, -2.673583, 1, 1, 1, 1, 1,
-0.4394259, 0.4626935, -0.8488496, 1, 1, 1, 1, 1,
-0.4376048, -1.180753, -2.409495, 1, 1, 1, 1, 1,
-0.4362457, 1.02588, -0.6407149, 1, 1, 1, 1, 1,
-0.4300542, -0.1923576, -0.502516, 1, 1, 1, 1, 1,
-0.4284425, -1.495365, -1.014011, 1, 1, 1, 1, 1,
-0.4277376, -2.23525, -2.169105, 1, 1, 1, 1, 1,
-0.4184133, 0.8192677, -0.5247169, 1, 1, 1, 1, 1,
-0.415321, -0.0743512, -4.281334, 1, 1, 1, 1, 1,
-0.4097022, -0.2248499, -1.83793, 1, 1, 1, 1, 1,
-0.4091296, 0.2347755, -2.330017, 1, 1, 1, 1, 1,
-0.4040267, -1.498237, -2.460107, 1, 1, 1, 1, 1,
-0.4029757, 1.039521, -0.08581784, 1, 1, 1, 1, 1,
-0.4029473, -0.19022, -3.218766, 1, 1, 1, 1, 1,
-0.3984461, -0.7960896, -1.500369, 1, 1, 1, 1, 1,
-0.3969673, 0.4019863, 0.0792959, 0, 0, 1, 1, 1,
-0.3921763, 0.08427088, -1.408545, 1, 0, 0, 1, 1,
-0.3866897, -0.7096682, -3.105403, 1, 0, 0, 1, 1,
-0.3801614, -0.2064212, -1.339139, 1, 0, 0, 1, 1,
-0.3776108, -1.396356, -2.137906, 1, 0, 0, 1, 1,
-0.3660016, 2.84223, -0.4645151, 1, 0, 0, 1, 1,
-0.3643922, 1.614093, -0.3926513, 0, 0, 0, 1, 1,
-0.3627174, 2.179492, -0.4883151, 0, 0, 0, 1, 1,
-0.3623625, 0.3939641, -2.27746, 0, 0, 0, 1, 1,
-0.357736, -0.7774316, -2.375733, 0, 0, 0, 1, 1,
-0.3542787, 0.6696852, -0.5826452, 0, 0, 0, 1, 1,
-0.351686, 1.260388, -0.6075512, 0, 0, 0, 1, 1,
-0.3497074, 2.574238, -1.528793, 0, 0, 0, 1, 1,
-0.337206, 0.1107837, -0.3772759, 1, 1, 1, 1, 1,
-0.3365768, 0.5438373, 0.955952, 1, 1, 1, 1, 1,
-0.3335482, -1.762425, -3.766535, 1, 1, 1, 1, 1,
-0.3284099, 1.095653, 1.564597, 1, 1, 1, 1, 1,
-0.3277859, 1.392901, 1.010724, 1, 1, 1, 1, 1,
-0.3243429, 0.01697754, -0.9760314, 1, 1, 1, 1, 1,
-0.3240205, 0.5942799, -0.8055169, 1, 1, 1, 1, 1,
-0.3236268, -0.1335268, -3.199528, 1, 1, 1, 1, 1,
-0.3161717, -0.2087301, -2.710472, 1, 1, 1, 1, 1,
-0.3127512, 1.037495, 0.2270059, 1, 1, 1, 1, 1,
-0.3126827, 1.577434, -2.249285, 1, 1, 1, 1, 1,
-0.3103099, 1.641672, -0.9847993, 1, 1, 1, 1, 1,
-0.3092673, 0.689703, 0.303407, 1, 1, 1, 1, 1,
-0.3089092, 0.2718125, 0.9303991, 1, 1, 1, 1, 1,
-0.3068416, -1.933777, -1.228035, 1, 1, 1, 1, 1,
-0.3039412, 0.3355449, -0.6360931, 0, 0, 1, 1, 1,
-0.3028034, 0.1553894, -2.046659, 1, 0, 0, 1, 1,
-0.2980755, 0.5738031, -0.4664728, 1, 0, 0, 1, 1,
-0.2972098, 0.9209719, -0.6020063, 1, 0, 0, 1, 1,
-0.2948, -0.9278914, -2.248728, 1, 0, 0, 1, 1,
-0.2879471, -1.420653, -3.530686, 1, 0, 0, 1, 1,
-0.2868267, 0.1458148, -0.9167205, 0, 0, 0, 1, 1,
-0.2853658, 0.6272863, -0.6953982, 0, 0, 0, 1, 1,
-0.2794538, -1.384238, -5.115337, 0, 0, 0, 1, 1,
-0.2785746, 0.7168052, -1.936847, 0, 0, 0, 1, 1,
-0.2737439, 1.529619, -0.5407494, 0, 0, 0, 1, 1,
-0.2687007, 2.025592, -1.401532, 0, 0, 0, 1, 1,
-0.2681564, 0.4906617, -0.08558801, 0, 0, 0, 1, 1,
-0.2668287, -0.571372, -4.328777, 1, 1, 1, 1, 1,
-0.2657929, 0.2116427, -2.076113, 1, 1, 1, 1, 1,
-0.2633584, -1.39584, -2.337066, 1, 1, 1, 1, 1,
-0.2623512, -1.256479, -2.399598, 1, 1, 1, 1, 1,
-0.2621328, -0.3061631, -0.5562654, 1, 1, 1, 1, 1,
-0.2579927, -0.5859707, -3.570255, 1, 1, 1, 1, 1,
-0.2569686, -0.2216177, -2.638445, 1, 1, 1, 1, 1,
-0.2559489, -0.8556308, -2.618302, 1, 1, 1, 1, 1,
-0.2556762, 0.0165973, -1.13235, 1, 1, 1, 1, 1,
-0.2551477, -0.3117282, -2.770712, 1, 1, 1, 1, 1,
-0.2548621, -2.846516, -2.790528, 1, 1, 1, 1, 1,
-0.2532876, -1.359554, -2.159986, 1, 1, 1, 1, 1,
-0.2527533, 0.003063497, -1.632381, 1, 1, 1, 1, 1,
-0.2497647, 0.9084067, 1.13183, 1, 1, 1, 1, 1,
-0.2487365, 0.6449054, 0.4755362, 1, 1, 1, 1, 1,
-0.2476587, 0.5098217, -1.338785, 0, 0, 1, 1, 1,
-0.2455008, 0.8780888, -0.470145, 1, 0, 0, 1, 1,
-0.2452475, 0.7712896, 1.548487, 1, 0, 0, 1, 1,
-0.2448047, -0.4719164, -2.323645, 1, 0, 0, 1, 1,
-0.2443783, 1.910446, 1.561609, 1, 0, 0, 1, 1,
-0.2418378, 0.177411, -1.202859, 1, 0, 0, 1, 1,
-0.2404655, -0.6417047, -4.714255, 0, 0, 0, 1, 1,
-0.2381344, 1.220011, 1.185898, 0, 0, 0, 1, 1,
-0.2378405, 0.3359247, -2.577987, 0, 0, 0, 1, 1,
-0.2345095, 1.099042, 0.5941144, 0, 0, 0, 1, 1,
-0.2334161, 0.3879844, -1.442964, 0, 0, 0, 1, 1,
-0.2276164, 0.6686949, -0.8413051, 0, 0, 0, 1, 1,
-0.2268362, -0.2000487, -1.377575, 0, 0, 0, 1, 1,
-0.221486, -0.6007525, -1.329535, 1, 1, 1, 1, 1,
-0.217436, -2.295987, -3.022867, 1, 1, 1, 1, 1,
-0.2140988, 0.8581541, -0.8534911, 1, 1, 1, 1, 1,
-0.2086233, -0.9226862, -2.433714, 1, 1, 1, 1, 1,
-0.2073937, 0.2105891, -0.2902102, 1, 1, 1, 1, 1,
-0.2055892, -0.1583793, -2.75603, 1, 1, 1, 1, 1,
-0.2053783, 1.772984, 0.5217056, 1, 1, 1, 1, 1,
-0.2048513, 1.557801, -0.9942932, 1, 1, 1, 1, 1,
-0.2010569, 0.9445425, -0.03014224, 1, 1, 1, 1, 1,
-0.1987536, 0.1000636, -2.507932, 1, 1, 1, 1, 1,
-0.1950354, -2.588595, -1.566358, 1, 1, 1, 1, 1,
-0.1925164, -0.04810419, -2.689321, 1, 1, 1, 1, 1,
-0.1895279, 0.6071479, 0.02910882, 1, 1, 1, 1, 1,
-0.1889969, -0.8876113, -3.415883, 1, 1, 1, 1, 1,
-0.1729499, -0.8018873, -2.915961, 1, 1, 1, 1, 1,
-0.1722684, 0.7159097, 1.174035, 0, 0, 1, 1, 1,
-0.1700068, 1.022076, 0.4448426, 1, 0, 0, 1, 1,
-0.1697491, 1.539765, -0.360252, 1, 0, 0, 1, 1,
-0.1684304, 0.9975671, 0.004323424, 1, 0, 0, 1, 1,
-0.1677735, 1.38833, -0.4831537, 1, 0, 0, 1, 1,
-0.1666507, 0.1655232, -0.5839747, 1, 0, 0, 1, 1,
-0.1662199, -1.42225, -4.854487, 0, 0, 0, 1, 1,
-0.1653271, -1.501106, -3.803854, 0, 0, 0, 1, 1,
-0.1601124, -1.355872, -2.315609, 0, 0, 0, 1, 1,
-0.1597086, -0.2709609, -3.21037, 0, 0, 0, 1, 1,
-0.1590346, -0.8799978, -3.714332, 0, 0, 0, 1, 1,
-0.1492234, 0.1794138, 0.7097589, 0, 0, 0, 1, 1,
-0.1472857, 0.8923447, -0.3389884, 0, 0, 0, 1, 1,
-0.1461513, -0.6861246, -3.061861, 1, 1, 1, 1, 1,
-0.145221, -1.35883, -3.836665, 1, 1, 1, 1, 1,
-0.1415918, -1.989691, -3.263971, 1, 1, 1, 1, 1,
-0.1410701, -0.9399436, -3.325153, 1, 1, 1, 1, 1,
-0.139488, 1.458865, 0.2545, 1, 1, 1, 1, 1,
-0.1383636, 0.545079, 0.2992373, 1, 1, 1, 1, 1,
-0.1369335, 0.5461996, 1.461157, 1, 1, 1, 1, 1,
-0.1351753, 0.1667202, 0.9623946, 1, 1, 1, 1, 1,
-0.1329882, 1.370322, -0.8260932, 1, 1, 1, 1, 1,
-0.1261438, 0.01857543, -1.656669, 1, 1, 1, 1, 1,
-0.1204477, -1.480268, -1.919913, 1, 1, 1, 1, 1,
-0.1197519, 1.823371, 0.4268372, 1, 1, 1, 1, 1,
-0.1168526, -0.1300014, -0.09611437, 1, 1, 1, 1, 1,
-0.1131925, -0.7036433, -2.886245, 1, 1, 1, 1, 1,
-0.1000339, 0.2129637, -1.365529, 1, 1, 1, 1, 1,
-0.09510889, -1.004098, -2.427515, 0, 0, 1, 1, 1,
-0.09367222, 0.2628569, 0.6124704, 1, 0, 0, 1, 1,
-0.09304563, 0.5446873, -0.8319165, 1, 0, 0, 1, 1,
-0.08596129, 0.8355298, -1.534158, 1, 0, 0, 1, 1,
-0.08583156, -1.119826, -3.444749, 1, 0, 0, 1, 1,
-0.08513095, -0.09409164, -1.784567, 1, 0, 0, 1, 1,
-0.08251447, 1.666793, 0.7065809, 0, 0, 0, 1, 1,
-0.08238453, -0.2978015, -1.746208, 0, 0, 0, 1, 1,
-0.08032744, -0.2415786, -0.8874196, 0, 0, 0, 1, 1,
-0.07973275, 1.031051, 0.06349769, 0, 0, 0, 1, 1,
-0.0791592, 1.707562, 1.077773, 0, 0, 0, 1, 1,
-0.07877344, -0.1453403, -2.758192, 0, 0, 0, 1, 1,
-0.07701261, 0.4265664, -0.8084823, 0, 0, 0, 1, 1,
-0.07638115, -0.2541143, -3.408102, 1, 1, 1, 1, 1,
-0.07469263, 0.07005434, -0.4330717, 1, 1, 1, 1, 1,
-0.07162542, 0.9123749, 0.3072671, 1, 1, 1, 1, 1,
-0.06992695, -0.04237412, -2.787526, 1, 1, 1, 1, 1,
-0.0696895, 1.171972, -0.3706062, 1, 1, 1, 1, 1,
-0.06556144, -0.2670447, -0.8002912, 1, 1, 1, 1, 1,
-0.05668018, -2.3703, -3.358192, 1, 1, 1, 1, 1,
-0.05361829, 2.51258, -0.2317965, 1, 1, 1, 1, 1,
-0.04472121, -0.914614, -2.630967, 1, 1, 1, 1, 1,
-0.03827498, 2.068467, -1.493411, 1, 1, 1, 1, 1,
-0.03397943, 1.477381, -0.5422691, 1, 1, 1, 1, 1,
-0.03148158, 0.4158693, 1.673524, 1, 1, 1, 1, 1,
-0.02980736, 0.2272071, -0.4090738, 1, 1, 1, 1, 1,
-0.0239757, -3.537954, -3.313232, 1, 1, 1, 1, 1,
-0.02161129, 0.2934251, 0.5233809, 1, 1, 1, 1, 1,
-0.01887266, 0.6932808, -0.3674715, 0, 0, 1, 1, 1,
-0.01729386, -1.226798, -2.311152, 1, 0, 0, 1, 1,
-0.0146546, 0.4914072, -0.4512267, 1, 0, 0, 1, 1,
-0.01351817, 1.039544, -0.348171, 1, 0, 0, 1, 1,
-0.01282195, -0.6853876, -5.093531, 1, 0, 0, 1, 1,
-0.01219474, -0.1791444, -2.598958, 1, 0, 0, 1, 1,
-0.01103332, 0.341527, -0.1609174, 0, 0, 0, 1, 1,
-0.01076663, -0.3953708, -4.344942, 0, 0, 0, 1, 1,
-0.01008833, -1.344235, -3.600946, 0, 0, 0, 1, 1,
-0.009571319, 0.3527561, -0.02373248, 0, 0, 0, 1, 1,
-0.009502289, -1.982791, -3.265307, 0, 0, 0, 1, 1,
-0.004662724, 0.7520844, 1.546477, 0, 0, 0, 1, 1,
0.003062215, -0.3559546, 3.246519, 0, 0, 0, 1, 1,
0.009371098, -0.3304893, 2.781161, 1, 1, 1, 1, 1,
0.01098212, 0.7573465, 0.9311241, 1, 1, 1, 1, 1,
0.0167071, -0.7674927, 3.664704, 1, 1, 1, 1, 1,
0.01738372, 2.776068, 0.5116888, 1, 1, 1, 1, 1,
0.02054717, 0.542746, -0.3062886, 1, 1, 1, 1, 1,
0.02313366, 1.023742, 0.02722628, 1, 1, 1, 1, 1,
0.02350183, 1.302279, -0.3873718, 1, 1, 1, 1, 1,
0.02352026, -0.2963161, 3.13406, 1, 1, 1, 1, 1,
0.02810611, 0.7771444, -0.7864627, 1, 1, 1, 1, 1,
0.03080181, 0.3261248, -1.48194, 1, 1, 1, 1, 1,
0.03126844, -0.6545269, 3.701478, 1, 1, 1, 1, 1,
0.0373537, 0.9180986, 0.8479187, 1, 1, 1, 1, 1,
0.04051198, -0.226529, 4.750394, 1, 1, 1, 1, 1,
0.0411001, 0.865868, -1.242537, 1, 1, 1, 1, 1,
0.04301097, 0.6850757, 0.8219526, 1, 1, 1, 1, 1,
0.0438016, 0.4115532, 0.07471257, 0, 0, 1, 1, 1,
0.04662489, 0.1064033, -0.6783373, 1, 0, 0, 1, 1,
0.05343179, 0.1241935, 0.8384154, 1, 0, 0, 1, 1,
0.05446559, -0.6596808, 2.991222, 1, 0, 0, 1, 1,
0.06245414, -1.67067, 3.81443, 1, 0, 0, 1, 1,
0.06421582, -1.324281, 4.366658, 1, 0, 0, 1, 1,
0.0675266, 0.3331769, -0.5717264, 0, 0, 0, 1, 1,
0.0677413, -1.741339, 3.734346, 0, 0, 0, 1, 1,
0.06918442, 0.9653621, 0.9046078, 0, 0, 0, 1, 1,
0.07117868, 0.5448357, -0.168414, 0, 0, 0, 1, 1,
0.07133444, 0.5181447, 0.3815517, 0, 0, 0, 1, 1,
0.07490607, 0.5277446, 2.388834, 0, 0, 0, 1, 1,
0.0791617, -0.104324, 3.015415, 0, 0, 0, 1, 1,
0.08115046, -1.640159, 3.58071, 1, 1, 1, 1, 1,
0.08320922, -0.9941012, 3.228544, 1, 1, 1, 1, 1,
0.09036721, 1.250047, -0.6292102, 1, 1, 1, 1, 1,
0.09080926, -0.1999607, 3.382408, 1, 1, 1, 1, 1,
0.09114146, 0.6111642, -0.1879715, 1, 1, 1, 1, 1,
0.09170985, -1.626671, 4.400089, 1, 1, 1, 1, 1,
0.09362813, 0.225013, 0.6928309, 1, 1, 1, 1, 1,
0.09969378, -2.06852, 1.985517, 1, 1, 1, 1, 1,
0.1019925, 1.665592, -0.8652673, 1, 1, 1, 1, 1,
0.1034557, -0.06688919, 2.999804, 1, 1, 1, 1, 1,
0.1057765, 1.618806, -0.3985349, 1, 1, 1, 1, 1,
0.1076379, 0.2467861, 0.8861341, 1, 1, 1, 1, 1,
0.1076409, 1.463005, 1.016165, 1, 1, 1, 1, 1,
0.1077168, 1.169667, -2.289831, 1, 1, 1, 1, 1,
0.1089372, 1.249094, 1.765491, 1, 1, 1, 1, 1,
0.1091475, 0.4893861, 0.04076469, 0, 0, 1, 1, 1,
0.1095303, -0.08587756, 0.9785585, 1, 0, 0, 1, 1,
0.1098254, -0.6327026, 1.78542, 1, 0, 0, 1, 1,
0.1120139, -1.140012, 3.177874, 1, 0, 0, 1, 1,
0.1129164, 0.3107402, 0.8786445, 1, 0, 0, 1, 1,
0.1133095, 0.7229493, -0.7958093, 1, 0, 0, 1, 1,
0.1139962, -0.3831946, 2.991932, 0, 0, 0, 1, 1,
0.1154382, 0.5776038, -0.9225484, 0, 0, 0, 1, 1,
0.1186023, 0.9460748, -0.1689436, 0, 0, 0, 1, 1,
0.126193, -0.07401899, 2.538772, 0, 0, 0, 1, 1,
0.1276764, -1.780308, 2.757889, 0, 0, 0, 1, 1,
0.1282802, 0.1671571, 0.2612568, 0, 0, 0, 1, 1,
0.131038, -0.1587234, 2.220461, 0, 0, 0, 1, 1,
0.1327482, -1.652403, 1.512685, 1, 1, 1, 1, 1,
0.1351064, -2.284244, 4.476793, 1, 1, 1, 1, 1,
0.1373748, -1.103848, 2.141178, 1, 1, 1, 1, 1,
0.1377905, 0.4015696, -0.6234967, 1, 1, 1, 1, 1,
0.13839, 2.246163, 0.8855681, 1, 1, 1, 1, 1,
0.1414117, 0.4262906, -2.315111, 1, 1, 1, 1, 1,
0.1440408, -0.3751271, 3.341583, 1, 1, 1, 1, 1,
0.1446176, 0.2468376, -1.797709, 1, 1, 1, 1, 1,
0.144888, -1.050221, 4.374685, 1, 1, 1, 1, 1,
0.1450409, -0.3386385, 2.084402, 1, 1, 1, 1, 1,
0.1479613, -0.124123, 2.656417, 1, 1, 1, 1, 1,
0.1480483, -0.01321472, 2.109936, 1, 1, 1, 1, 1,
0.1558164, -1.15624, 3.33558, 1, 1, 1, 1, 1,
0.1565938, 1.694727, -0.6282856, 1, 1, 1, 1, 1,
0.1607209, -0.8360097, 4.386147, 1, 1, 1, 1, 1,
0.161064, -0.9105842, 3.548091, 0, 0, 1, 1, 1,
0.1613401, -1.457089, 2.94502, 1, 0, 0, 1, 1,
0.1618372, -0.3107526, 3.812464, 1, 0, 0, 1, 1,
0.1660396, -0.7190198, 2.702446, 1, 0, 0, 1, 1,
0.1747546, 0.6969725, 0.3982776, 1, 0, 0, 1, 1,
0.1766522, 0.7732672, 1.450726, 1, 0, 0, 1, 1,
0.17684, 0.9456749, 0.3722568, 0, 0, 0, 1, 1,
0.1791594, -0.1089883, 3.716815, 0, 0, 0, 1, 1,
0.1821506, -0.09538482, 3.358297, 0, 0, 0, 1, 1,
0.1825252, -0.2293031, 3.445223, 0, 0, 0, 1, 1,
0.1885642, -2.043433, 3.72646, 0, 0, 0, 1, 1,
0.1899715, 1.269923, 1.608753, 0, 0, 0, 1, 1,
0.1912087, -0.4503527, 2.892826, 0, 0, 0, 1, 1,
0.1930766, 0.8777229, 0.98918, 1, 1, 1, 1, 1,
0.2004005, 1.331306, -2.966384, 1, 1, 1, 1, 1,
0.2005087, -0.4685311, 4.178909, 1, 1, 1, 1, 1,
0.2043022, 0.4007894, 0.9185079, 1, 1, 1, 1, 1,
0.2065182, 0.03511005, -0.7267489, 1, 1, 1, 1, 1,
0.20753, 0.06962459, 0.9681707, 1, 1, 1, 1, 1,
0.2116399, 0.7994674, 0.855189, 1, 1, 1, 1, 1,
0.213272, -1.143386, 4.754696, 1, 1, 1, 1, 1,
0.2134648, 1.524403, -0.7700567, 1, 1, 1, 1, 1,
0.2137189, -0.280972, 1.972624, 1, 1, 1, 1, 1,
0.2158229, 1.35796, -1.531075, 1, 1, 1, 1, 1,
0.2204942, -1.250236, 3.683271, 1, 1, 1, 1, 1,
0.2227616, -1.692354, 3.483644, 1, 1, 1, 1, 1,
0.2233367, -1.252056, 1.195447, 1, 1, 1, 1, 1,
0.2238909, 0.4054227, -1.141361, 1, 1, 1, 1, 1,
0.2243864, -0.2635374, 0.08280807, 0, 0, 1, 1, 1,
0.22494, -0.1996691, 0.4883064, 1, 0, 0, 1, 1,
0.2250085, -0.3134338, 2.548866, 1, 0, 0, 1, 1,
0.2265201, 1.211122, -1.018473, 1, 0, 0, 1, 1,
0.227545, 0.7610523, -0.5850047, 1, 0, 0, 1, 1,
0.2306832, 0.02434716, 3.198713, 1, 0, 0, 1, 1,
0.2315671, 1.600868, -0.3284159, 0, 0, 0, 1, 1,
0.2340529, 1.058724, 2.082025, 0, 0, 0, 1, 1,
0.2355551, -1.602784, 3.077049, 0, 0, 0, 1, 1,
0.2392387, 0.1215329, 1.657724, 0, 0, 0, 1, 1,
0.2393259, -0.4126998, 3.840862, 0, 0, 0, 1, 1,
0.2396586, -0.675519, 3.185865, 0, 0, 0, 1, 1,
0.2397, -0.3468329, 2.552915, 0, 0, 0, 1, 1,
0.2402126, 1.676262, -0.1586427, 1, 1, 1, 1, 1,
0.2410498, -0.3090952, 0.1054108, 1, 1, 1, 1, 1,
0.2412573, -0.6886188, 2.305439, 1, 1, 1, 1, 1,
0.2439649, 1.837401, 0.7782763, 1, 1, 1, 1, 1,
0.2458766, -0.8137444, 1.720461, 1, 1, 1, 1, 1,
0.2537548, -0.6512306, 5.198497, 1, 1, 1, 1, 1,
0.2564688, -0.724086, 2.377229, 1, 1, 1, 1, 1,
0.2573988, -0.2886455, 2.510879, 1, 1, 1, 1, 1,
0.2582005, 1.533088, 0.1453271, 1, 1, 1, 1, 1,
0.2629931, -0.3221298, 3.589845, 1, 1, 1, 1, 1,
0.2658189, 0.9075825, 0.1230735, 1, 1, 1, 1, 1,
0.2662407, 0.2246642, -0.5560742, 1, 1, 1, 1, 1,
0.269202, -0.6396322, 4.00307, 1, 1, 1, 1, 1,
0.2697426, 1.624156, -1.976651, 1, 1, 1, 1, 1,
0.2716691, 0.4117468, -0.8074245, 1, 1, 1, 1, 1,
0.2758957, 0.8626246, -1.482249, 0, 0, 1, 1, 1,
0.278745, 0.289297, 2.001818, 1, 0, 0, 1, 1,
0.2805697, 0.2908384, 1.812186, 1, 0, 0, 1, 1,
0.2828881, -1.417654, 4.251072, 1, 0, 0, 1, 1,
0.2839135, -1.196042, 3.898319, 1, 0, 0, 1, 1,
0.284436, 1.248482, 2.529197, 1, 0, 0, 1, 1,
0.2917324, 0.2486445, 2.411442, 0, 0, 0, 1, 1,
0.2919236, 0.1977169, -0.1895735, 0, 0, 0, 1, 1,
0.3066389, 0.7467709, 0.9060618, 0, 0, 0, 1, 1,
0.3106199, -0.1942091, 1.500884, 0, 0, 0, 1, 1,
0.3126311, 0.3682227, 2.039343, 0, 0, 0, 1, 1,
0.3136654, -0.6769471, 2.65945, 0, 0, 0, 1, 1,
0.3157695, 0.3898902, 0.6943888, 0, 0, 0, 1, 1,
0.3193212, 0.275702, 0.2618327, 1, 1, 1, 1, 1,
0.3217143, -0.4756555, 1.943332, 1, 1, 1, 1, 1,
0.3221693, 0.2264915, 1.029122, 1, 1, 1, 1, 1,
0.3269505, -0.6111649, 2.092731, 1, 1, 1, 1, 1,
0.3296295, -0.2202411, 1.429089, 1, 1, 1, 1, 1,
0.3315047, 1.019229, 0.9139709, 1, 1, 1, 1, 1,
0.3354613, 1.91536, -0.6097947, 1, 1, 1, 1, 1,
0.3358366, -0.7305878, 2.232962, 1, 1, 1, 1, 1,
0.3368918, -0.4574407, 2.806838, 1, 1, 1, 1, 1,
0.3406173, 1.079514, 0.7255597, 1, 1, 1, 1, 1,
0.3464733, -0.08709664, 1.035754, 1, 1, 1, 1, 1,
0.347555, -1.164466, 1.492806, 1, 1, 1, 1, 1,
0.3504139, 1.721994, -0.6196374, 1, 1, 1, 1, 1,
0.3510564, -0.9523286, 2.642177, 1, 1, 1, 1, 1,
0.3554499, 0.806416, -0.09827606, 1, 1, 1, 1, 1,
0.3561043, 1.318875, 0.3735055, 0, 0, 1, 1, 1,
0.359312, 0.1994213, 1.996856, 1, 0, 0, 1, 1,
0.366131, -0.1379228, 0.4153811, 1, 0, 0, 1, 1,
0.3676564, -0.5234628, 1.33288, 1, 0, 0, 1, 1,
0.369709, -0.1817811, 3.712079, 1, 0, 0, 1, 1,
0.3708955, -1.458548, 4.117813, 1, 0, 0, 1, 1,
0.3758044, 0.01283798, 0.494857, 0, 0, 0, 1, 1,
0.3774462, -0.01341055, 1.523104, 0, 0, 0, 1, 1,
0.3786601, -1.731382, 1.495943, 0, 0, 0, 1, 1,
0.3790787, -0.9196644, 3.097557, 0, 0, 0, 1, 1,
0.3799876, -1.78657, 3.275095, 0, 0, 0, 1, 1,
0.3820051, -0.7326963, 4.105588, 0, 0, 0, 1, 1,
0.3846663, -1.028642, 1.525875, 0, 0, 0, 1, 1,
0.3850572, 1.200379, 0.7337339, 1, 1, 1, 1, 1,
0.3858716, 0.9417526, 1.09951, 1, 1, 1, 1, 1,
0.3914038, -0.3736029, 2.100347, 1, 1, 1, 1, 1,
0.3939805, -0.2489557, 1.412662, 1, 1, 1, 1, 1,
0.3955654, 1.777477, 0.5485288, 1, 1, 1, 1, 1,
0.396107, -1.456337, 2.739526, 1, 1, 1, 1, 1,
0.3977694, -0.6082904, 4.213592, 1, 1, 1, 1, 1,
0.4024031, 1.066049, -0.7427712, 1, 1, 1, 1, 1,
0.4085859, 0.7227784, 0.1109309, 1, 1, 1, 1, 1,
0.4093581, -0.5242005, 3.137522, 1, 1, 1, 1, 1,
0.4123062, -0.103835, 1.707422, 1, 1, 1, 1, 1,
0.4143553, 0.05175411, 1.831081, 1, 1, 1, 1, 1,
0.4144753, -0.6471604, 2.348269, 1, 1, 1, 1, 1,
0.4145879, -1.183465, 2.492366, 1, 1, 1, 1, 1,
0.4171234, 0.3269242, 0.8659545, 1, 1, 1, 1, 1,
0.4179907, 0.88062, 3.092152, 0, 0, 1, 1, 1,
0.4184522, -1.190819, 4.224242, 1, 0, 0, 1, 1,
0.4212765, 0.2562787, -1.793313, 1, 0, 0, 1, 1,
0.4242503, -0.1774675, 1.111823, 1, 0, 0, 1, 1,
0.4257624, 0.1112032, 0.9728965, 1, 0, 0, 1, 1,
0.4265082, -0.9160345, 3.937974, 1, 0, 0, 1, 1,
0.4267423, 0.2764887, 0.3009146, 0, 0, 0, 1, 1,
0.4288177, -0.8471853, 2.505849, 0, 0, 0, 1, 1,
0.428963, -0.05374051, 1.278083, 0, 0, 0, 1, 1,
0.4293402, 1.650831, 0.1831632, 0, 0, 0, 1, 1,
0.4312356, -1.656622, 3.592305, 0, 0, 0, 1, 1,
0.4380827, -1.512187, 2.999507, 0, 0, 0, 1, 1,
0.4420888, 0.8964261, 1.126672, 0, 0, 0, 1, 1,
0.4425038, -1.460721, 2.784972, 1, 1, 1, 1, 1,
0.4425549, -0.7091584, 2.865503, 1, 1, 1, 1, 1,
0.444119, 0.8357674, 1.246445, 1, 1, 1, 1, 1,
0.4501646, -1.047402, 2.904665, 1, 1, 1, 1, 1,
0.4502116, -1.905563, 3.051498, 1, 1, 1, 1, 1,
0.4560628, -1.106791, 3.516965, 1, 1, 1, 1, 1,
0.4566337, 1.325002, -0.2635474, 1, 1, 1, 1, 1,
0.4583061, -1.872887, 2.608588, 1, 1, 1, 1, 1,
0.4659268, 1.205495, 0.007406751, 1, 1, 1, 1, 1,
0.4660128, -3.41154, 2.293012, 1, 1, 1, 1, 1,
0.4675582, -2.311806, 5.014434, 1, 1, 1, 1, 1,
0.476446, -0.9333758, 2.302352, 1, 1, 1, 1, 1,
0.4795088, -0.6032142, 2.946676, 1, 1, 1, 1, 1,
0.4798956, -0.9387478, 1.335383, 1, 1, 1, 1, 1,
0.4820982, -1.400398, 2.211818, 1, 1, 1, 1, 1,
0.4822784, 0.1721513, 0.9757732, 0, 0, 1, 1, 1,
0.4840015, 2.633518, -0.3395048, 1, 0, 0, 1, 1,
0.494543, -0.1984586, 0.5460801, 1, 0, 0, 1, 1,
0.498565, 0.8658744, 1.574598, 1, 0, 0, 1, 1,
0.5013073, -0.3259974, 1.696077, 1, 0, 0, 1, 1,
0.5038782, -1.760131, 3.06072, 1, 0, 0, 1, 1,
0.5053099, 1.341469, 1.178228, 0, 0, 0, 1, 1,
0.5085664, -0.6881225, 3.347618, 0, 0, 0, 1, 1,
0.5095079, -2.880114, 3.998078, 0, 0, 0, 1, 1,
0.5127488, 0.5224178, -0.1517654, 0, 0, 0, 1, 1,
0.5165211, -0.2066633, 3.481552, 0, 0, 0, 1, 1,
0.5169686, -0.8508195, 2.574587, 0, 0, 0, 1, 1,
0.5179349, 0.4841757, 0.6347727, 0, 0, 0, 1, 1,
0.5202437, -1.078267, 1.311521, 1, 1, 1, 1, 1,
0.5218962, -0.7098422, 2.979155, 1, 1, 1, 1, 1,
0.5280068, 0.6266034, 1.828803, 1, 1, 1, 1, 1,
0.5302339, 1.229043, 0.233709, 1, 1, 1, 1, 1,
0.5327153, 1.240616, 0.04155703, 1, 1, 1, 1, 1,
0.5340605, 1.707036, 0.6095956, 1, 1, 1, 1, 1,
0.5384341, 0.7963908, 0.85943, 1, 1, 1, 1, 1,
0.5386341, -0.4128411, 2.39697, 1, 1, 1, 1, 1,
0.5406864, -0.8809469, 2.747027, 1, 1, 1, 1, 1,
0.5453408, -1.912773, 3.47311, 1, 1, 1, 1, 1,
0.5535005, -0.9385332, 2.321156, 1, 1, 1, 1, 1,
0.5544956, 0.1840144, 2.068039, 1, 1, 1, 1, 1,
0.5602454, 0.6901721, 0.2078932, 1, 1, 1, 1, 1,
0.5602734, 0.01510637, 1.013208, 1, 1, 1, 1, 1,
0.5630047, 1.784068, 0.01114947, 1, 1, 1, 1, 1,
0.5671827, -0.2445621, 1.63505, 0, 0, 1, 1, 1,
0.5692831, 2.046715, -0.2297163, 1, 0, 0, 1, 1,
0.5698393, -0.1881568, 2.600365, 1, 0, 0, 1, 1,
0.5698863, 0.3890784, -0.8308381, 1, 0, 0, 1, 1,
0.5717088, -0.1374385, 1.771137, 1, 0, 0, 1, 1,
0.5813229, 0.6395963, 2.533486, 1, 0, 0, 1, 1,
0.5822396, 0.909202, -0.4755842, 0, 0, 0, 1, 1,
0.5860558, 0.5780303, 1.446915, 0, 0, 0, 1, 1,
0.5861116, 0.99949, -0.7137482, 0, 0, 0, 1, 1,
0.5873813, -0.3391527, 0.3232816, 0, 0, 0, 1, 1,
0.5881568, -0.3278783, 4.191736, 0, 0, 0, 1, 1,
0.5919447, 0.1277952, 1.825207, 0, 0, 0, 1, 1,
0.5939013, -1.230907, 4.637264, 0, 0, 0, 1, 1,
0.5941175, -2.009973, 2.792132, 1, 1, 1, 1, 1,
0.5975595, 0.9748821, 1.896719, 1, 1, 1, 1, 1,
0.5996324, 1.71057, 1.028202, 1, 1, 1, 1, 1,
0.6043447, -1.029366, 4.992519, 1, 1, 1, 1, 1,
0.6069537, 1.05904, 2.497038, 1, 1, 1, 1, 1,
0.6163133, -0.7469889, 3.040689, 1, 1, 1, 1, 1,
0.618952, 0.2575166, 3.036924, 1, 1, 1, 1, 1,
0.6192874, -0.532866, 2.58517, 1, 1, 1, 1, 1,
0.6317835, 0.003197294, 2.743736, 1, 1, 1, 1, 1,
0.6329489, 1.182603, -0.724998, 1, 1, 1, 1, 1,
0.6370719, 0.8597216, 2.13971, 1, 1, 1, 1, 1,
0.6496198, 0.5980524, 1.28457, 1, 1, 1, 1, 1,
0.6621857, 0.5292604, 0.317487, 1, 1, 1, 1, 1,
0.6624594, -0.0017251, 0.1448583, 1, 1, 1, 1, 1,
0.6694072, -1.074353, 2.260429, 1, 1, 1, 1, 1,
0.674234, 1.389098, 0.6201149, 0, 0, 1, 1, 1,
0.6744743, -0.05818808, -0.5214915, 1, 0, 0, 1, 1,
0.67619, -0.8058479, 1.587131, 1, 0, 0, 1, 1,
0.6771974, 0.7266487, 0.5645099, 1, 0, 0, 1, 1,
0.6821892, 0.1823242, -0.4921659, 1, 0, 0, 1, 1,
0.6845165, 0.7991968, 2.053721, 1, 0, 0, 1, 1,
0.6848632, -0.4649203, 1.99527, 0, 0, 0, 1, 1,
0.6898867, 0.2108695, 1.138054, 0, 0, 0, 1, 1,
0.6982928, 1.204417, -0.251163, 0, 0, 0, 1, 1,
0.6991411, 0.9520867, -1.858409, 0, 0, 0, 1, 1,
0.7021525, -1.680645, 2.330333, 0, 0, 0, 1, 1,
0.70993, 0.4900103, 2.630204, 0, 0, 0, 1, 1,
0.7108306, 0.2372266, 1.202485, 0, 0, 0, 1, 1,
0.7110515, -0.5560706, 0.9236709, 1, 1, 1, 1, 1,
0.7168485, 0.9456363, 2.598894, 1, 1, 1, 1, 1,
0.7206876, -0.3850734, 2.247388, 1, 1, 1, 1, 1,
0.73093, 0.425753, 2.169816, 1, 1, 1, 1, 1,
0.7332768, -0.2668431, 0.7426233, 1, 1, 1, 1, 1,
0.7333604, -1.041338, 1.917817, 1, 1, 1, 1, 1,
0.7355848, -0.764664, 2.740029, 1, 1, 1, 1, 1,
0.7358936, 0.1074682, 2.729284, 1, 1, 1, 1, 1,
0.7377031, -0.5678616, 2.570912, 1, 1, 1, 1, 1,
0.738574, 0.05114775, -0.1466819, 1, 1, 1, 1, 1,
0.7386945, 0.7501561, -0.06725168, 1, 1, 1, 1, 1,
0.7418252, 0.7697757, 1.121222, 1, 1, 1, 1, 1,
0.742359, 0.6773406, 0.6105334, 1, 1, 1, 1, 1,
0.747215, 0.2768289, -0.5298351, 1, 1, 1, 1, 1,
0.7523693, 0.6222585, 1.280847, 1, 1, 1, 1, 1,
0.7560108, -0.4875341, 1.534716, 0, 0, 1, 1, 1,
0.7567909, 0.01046437, 1.920418, 1, 0, 0, 1, 1,
0.7578129, 0.2576331, 2.054203, 1, 0, 0, 1, 1,
0.7599713, 0.5117436, 1.302484, 1, 0, 0, 1, 1,
0.7660293, 0.6339248, 1.435415, 1, 0, 0, 1, 1,
0.7696592, -2.254072, 3.458968, 1, 0, 0, 1, 1,
0.7721217, 0.4553479, 1.228385, 0, 0, 0, 1, 1,
0.7729656, 0.5953361, -0.7566499, 0, 0, 0, 1, 1,
0.7734339, 0.002751407, 1.419993, 0, 0, 0, 1, 1,
0.7739136, -0.8011475, 2.764368, 0, 0, 0, 1, 1,
0.7744602, 1.13743, 1.000154, 0, 0, 0, 1, 1,
0.7760454, 2.305141, 2.174868, 0, 0, 0, 1, 1,
0.7782062, -0.2396277, 1.077822, 0, 0, 0, 1, 1,
0.7867765, -1.754326, 2.614111, 1, 1, 1, 1, 1,
0.7875285, 1.110012, -0.08008454, 1, 1, 1, 1, 1,
0.7881839, 0.8418157, -0.1810094, 1, 1, 1, 1, 1,
0.7910583, -0.6468367, 3.764501, 1, 1, 1, 1, 1,
0.7959167, -0.04264606, 1.544299, 1, 1, 1, 1, 1,
0.8015053, -1.332084, 3.481627, 1, 1, 1, 1, 1,
0.8048905, 0.8246682, 1.932427, 1, 1, 1, 1, 1,
0.8160363, 0.5745927, 2.153909, 1, 1, 1, 1, 1,
0.8205826, -0.5553762, 1.300782, 1, 1, 1, 1, 1,
0.8242015, 0.2225971, -0.8327022, 1, 1, 1, 1, 1,
0.8246434, 1.009494, 1.008016, 1, 1, 1, 1, 1,
0.8264638, 0.4883336, 1.841628, 1, 1, 1, 1, 1,
0.8299136, -0.2340634, 3.163665, 1, 1, 1, 1, 1,
0.8309844, -0.8121552, 1.881917, 1, 1, 1, 1, 1,
0.8339251, -2.792853, 2.649387, 1, 1, 1, 1, 1,
0.8459302, -1.453221, 3.468931, 0, 0, 1, 1, 1,
0.8466684, 0.04449588, 2.857851, 1, 0, 0, 1, 1,
0.8509796, 1.185392, 0.8609365, 1, 0, 0, 1, 1,
0.851997, 0.1747192, 1.806048, 1, 0, 0, 1, 1,
0.8567399, 1.810498, 0.7578939, 1, 0, 0, 1, 1,
0.8576814, 0.4822678, 0.6873277, 1, 0, 0, 1, 1,
0.8631388, -0.5581389, 2.381174, 0, 0, 0, 1, 1,
0.8662071, -1.061984, 0.436307, 0, 0, 0, 1, 1,
0.8719926, 0.5422374, 2.155729, 0, 0, 0, 1, 1,
0.875886, -1.546155, 5.662806, 0, 0, 0, 1, 1,
0.8759322, 0.432418, 0.4282341, 0, 0, 0, 1, 1,
0.8820832, 0.7507533, 0.3289788, 0, 0, 0, 1, 1,
0.8933029, 0.6284193, 0.07639026, 0, 0, 0, 1, 1,
0.8962817, 0.02920811, 0.1099202, 1, 1, 1, 1, 1,
0.8986639, -0.5598933, 2.570863, 1, 1, 1, 1, 1,
0.9015002, -0.5696844, 1.912974, 1, 1, 1, 1, 1,
0.9147266, 2.079218, 2.163981, 1, 1, 1, 1, 1,
0.9158835, -0.8842651, 2.039029, 1, 1, 1, 1, 1,
0.919094, -1.639999, 1.860633, 1, 1, 1, 1, 1,
0.9313083, 0.4479836, 1.488652, 1, 1, 1, 1, 1,
0.9413731, 0.3969269, -0.002401472, 1, 1, 1, 1, 1,
0.9501675, 0.4102953, 1.111829, 1, 1, 1, 1, 1,
0.9537215, -0.09745966, -1.06051, 1, 1, 1, 1, 1,
0.9566632, 0.1320261, 1.86768, 1, 1, 1, 1, 1,
0.9581769, -0.9495321, 1.730837, 1, 1, 1, 1, 1,
0.9632652, 0.04272064, 0.309358, 1, 1, 1, 1, 1,
0.9655462, 0.3615497, 2.30443, 1, 1, 1, 1, 1,
0.9675093, 0.4862051, 0.6232488, 1, 1, 1, 1, 1,
0.9698035, 0.06556959, 2.454088, 0, 0, 1, 1, 1,
0.9712435, 1.546783, 1.358331, 1, 0, 0, 1, 1,
0.9768973, 2.034849, 0.1910462, 1, 0, 0, 1, 1,
0.9773054, 0.04468386, 0.3542816, 1, 0, 0, 1, 1,
0.9832204, -0.8669901, 2.860631, 1, 0, 0, 1, 1,
0.984916, 0.3876207, 2.207956, 1, 0, 0, 1, 1,
0.9854675, -1.040336, 2.898678, 0, 0, 0, 1, 1,
0.9855747, 0.03426024, 1.427201, 0, 0, 0, 1, 1,
0.9932966, -1.921723, 4.029828, 0, 0, 0, 1, 1,
0.9950334, 0.7219533, -0.438509, 0, 0, 0, 1, 1,
0.995837, 0.5352625, -0.4835072, 0, 0, 0, 1, 1,
1.000013, 1.02766, 1.993717, 0, 0, 0, 1, 1,
1.00182, -0.4919397, 1.819703, 0, 0, 0, 1, 1,
1.006936, 0.003277876, 1.99709, 1, 1, 1, 1, 1,
1.011546, 0.2101451, 0.544831, 1, 1, 1, 1, 1,
1.012275, -0.0471701, 2.433721, 1, 1, 1, 1, 1,
1.013297, -2.762951, 2.789243, 1, 1, 1, 1, 1,
1.013467, -1.218592, 4.505664, 1, 1, 1, 1, 1,
1.014978, -0.1537709, 1.797351, 1, 1, 1, 1, 1,
1.017936, 1.316637, 0.3118007, 1, 1, 1, 1, 1,
1.017959, -0.1505622, 2.416394, 1, 1, 1, 1, 1,
1.017999, -0.9835046, 2.514682, 1, 1, 1, 1, 1,
1.028268, 0.220968, 1.297096, 1, 1, 1, 1, 1,
1.032255, -0.2270371, 2.896197, 1, 1, 1, 1, 1,
1.034104, 0.2947886, 1.637264, 1, 1, 1, 1, 1,
1.044132, 0.2257152, 1.643467, 1, 1, 1, 1, 1,
1.049756, -0.5236199, 2.60394, 1, 1, 1, 1, 1,
1.054096, -0.2165751, 1.76484, 1, 1, 1, 1, 1,
1.057297, -0.4710166, 2.452688, 0, 0, 1, 1, 1,
1.057914, -0.02352983, 1.798867, 1, 0, 0, 1, 1,
1.059993, -0.1899023, 0.9256207, 1, 0, 0, 1, 1,
1.062905, -0.2517418, 2.024289, 1, 0, 0, 1, 1,
1.063076, 0.08363252, 1.432073, 1, 0, 0, 1, 1,
1.065438, -0.1564563, 2.867458, 1, 0, 0, 1, 1,
1.076488, -0.6997634, 3.667243, 0, 0, 0, 1, 1,
1.080512, 0.2225671, 2.389953, 0, 0, 0, 1, 1,
1.082667, 0.4787797, 0.896046, 0, 0, 0, 1, 1,
1.092885, -0.8562861, 3.057457, 0, 0, 0, 1, 1,
1.098112, -1.717988, 2.262682, 0, 0, 0, 1, 1,
1.099556, -0.4469023, 0.390184, 0, 0, 0, 1, 1,
1.101146, -1.175844, 2.622317, 0, 0, 0, 1, 1,
1.106974, -1.144482, -0.3915441, 1, 1, 1, 1, 1,
1.107751, -0.4410701, 2.594583, 1, 1, 1, 1, 1,
1.108518, -0.3557981, 1.704902, 1, 1, 1, 1, 1,
1.11219, 0.04386881, 2.675262, 1, 1, 1, 1, 1,
1.113106, 0.3601967, 0.6909007, 1, 1, 1, 1, 1,
1.118272, -2.419021, 2.789117, 1, 1, 1, 1, 1,
1.130454, -0.06713068, 0.2060409, 1, 1, 1, 1, 1,
1.145187, 0.8580598, -0.559927, 1, 1, 1, 1, 1,
1.145689, 0.7328076, 1.290494, 1, 1, 1, 1, 1,
1.154944, 1.258632, 2.766471, 1, 1, 1, 1, 1,
1.156929, -0.6294077, 1.654296, 1, 1, 1, 1, 1,
1.159446, 0.359702, 1.96004, 1, 1, 1, 1, 1,
1.162442, 0.1711636, 2.630394, 1, 1, 1, 1, 1,
1.170578, 2.026911, 1.373082, 1, 1, 1, 1, 1,
1.172812, 1.949739, 0.9471421, 1, 1, 1, 1, 1,
1.182126, -0.6263001, 1.367563, 0, 0, 1, 1, 1,
1.182485, 0.04652174, 1.05969, 1, 0, 0, 1, 1,
1.184885, -0.6764287, 1.713512, 1, 0, 0, 1, 1,
1.1902, 0.8951381, 1.040869, 1, 0, 0, 1, 1,
1.195161, -0.1517745, 1.081983, 1, 0, 0, 1, 1,
1.199928, -0.3408659, 0.4899787, 1, 0, 0, 1, 1,
1.207077, 1.020222, 0.2164261, 0, 0, 0, 1, 1,
1.213226, 0.7310193, -0.9130876, 0, 0, 0, 1, 1,
1.215573, -1.442935, 1.166012, 0, 0, 0, 1, 1,
1.227844, 0.4037186, 0.7003794, 0, 0, 0, 1, 1,
1.229848, -0.5617895, 0.1619177, 0, 0, 0, 1, 1,
1.232185, -0.1860148, 0.4498526, 0, 0, 0, 1, 1,
1.249809, -0.0712913, 2.418165, 0, 0, 0, 1, 1,
1.254979, 0.3389783, 0.6236611, 1, 1, 1, 1, 1,
1.255533, -0.7833377, 1.756008, 1, 1, 1, 1, 1,
1.265312, -0.2160724, 2.634161, 1, 1, 1, 1, 1,
1.266638, 0.6930639, 3.052948, 1, 1, 1, 1, 1,
1.284666, 1.062951, 0.375108, 1, 1, 1, 1, 1,
1.289253, 0.6798736, -0.6283401, 1, 1, 1, 1, 1,
1.301208, -0.2089013, 2.372189, 1, 1, 1, 1, 1,
1.305439, 0.4769454, 0.5650882, 1, 1, 1, 1, 1,
1.318481, 1.102622, 2.063394, 1, 1, 1, 1, 1,
1.323343, 2.260674, -0.2505448, 1, 1, 1, 1, 1,
1.330786, 0.9134258, 0.7094827, 1, 1, 1, 1, 1,
1.33559, -0.6564416, 2.78717, 1, 1, 1, 1, 1,
1.339309, 1.668761, -0.06959084, 1, 1, 1, 1, 1,
1.341251, -0.6897751, 1.024206, 1, 1, 1, 1, 1,
1.359763, 1.602229, 0.4931816, 1, 1, 1, 1, 1,
1.366387, -1.795995, 4.054523, 0, 0, 1, 1, 1,
1.367894, 1.040998, 1.686788, 1, 0, 0, 1, 1,
1.378778, 1.380146, -0.2087358, 1, 0, 0, 1, 1,
1.3882, 2.271399, 1.438, 1, 0, 0, 1, 1,
1.395187, 1.806684, 0.2461554, 1, 0, 0, 1, 1,
1.418588, 0.6494375, 1.100641, 1, 0, 0, 1, 1,
1.418997, -0.5522057, 0.9647822, 0, 0, 0, 1, 1,
1.422766, -0.09075194, 1.666587, 0, 0, 0, 1, 1,
1.453444, 0.03294153, 2.557842, 0, 0, 0, 1, 1,
1.458385, -0.7282032, 3.680905, 0, 0, 0, 1, 1,
1.462551, 0.8852468, 2.895629, 0, 0, 0, 1, 1,
1.466444, -1.007888, 4.701978, 0, 0, 0, 1, 1,
1.482264, -0.5260861, 2.618246, 0, 0, 0, 1, 1,
1.482385, 0.8818541, 0.1513485, 1, 1, 1, 1, 1,
1.489075, -0.7104686, 2.654524, 1, 1, 1, 1, 1,
1.510045, -1.298783, 2.541049, 1, 1, 1, 1, 1,
1.513781, -0.5878578, 3.157297, 1, 1, 1, 1, 1,
1.521841, -0.2305795, 1.508285, 1, 1, 1, 1, 1,
1.526925, -0.0925624, 1.280011, 1, 1, 1, 1, 1,
1.544018, -0.8987959, 4.647179, 1, 1, 1, 1, 1,
1.550584, -0.9751209, 1.474601, 1, 1, 1, 1, 1,
1.550685, -2.676752, 1.728911, 1, 1, 1, 1, 1,
1.553133, -0.0828753, 2.241408, 1, 1, 1, 1, 1,
1.563471, 0.9764832, 1.42552, 1, 1, 1, 1, 1,
1.571966, -0.7627404, 2.140434, 1, 1, 1, 1, 1,
1.572845, -0.8738407, 1.54232, 1, 1, 1, 1, 1,
1.584042, -0.6231881, 3.25339, 1, 1, 1, 1, 1,
1.610761, 2.522544, 1.535502, 1, 1, 1, 1, 1,
1.621571, -0.1846222, 2.583213, 0, 0, 1, 1, 1,
1.627991, 1.772768, 0.02602075, 1, 0, 0, 1, 1,
1.662472, 0.235727, 1.290957, 1, 0, 0, 1, 1,
1.68478, -0.7526323, 2.084703, 1, 0, 0, 1, 1,
1.694936, 0.4091738, 1.352953, 1, 0, 0, 1, 1,
1.707441, -0.1100563, 3.087129, 1, 0, 0, 1, 1,
1.711794, 0.3100087, 1.606686, 0, 0, 0, 1, 1,
1.716459, -1.733063, 1.72627, 0, 0, 0, 1, 1,
1.719706, -0.6730562, 2.906432, 0, 0, 0, 1, 1,
1.729141, -0.6820796, 1.936678, 0, 0, 0, 1, 1,
1.729424, 1.583306, 0.7948279, 0, 0, 0, 1, 1,
1.744391, -0.07417843, 1.598428, 0, 0, 0, 1, 1,
1.75482, -0.849472, -0.9028336, 0, 0, 0, 1, 1,
1.760783, 0.8769123, -0.9804689, 1, 1, 1, 1, 1,
1.771367, -0.1638761, 3.610635, 1, 1, 1, 1, 1,
1.77238, 0.7741037, 2.181308, 1, 1, 1, 1, 1,
1.781032, 0.4773754, -0.09138885, 1, 1, 1, 1, 1,
1.78727, 0.5981197, 1.959282, 1, 1, 1, 1, 1,
1.790252, 1.349764, 0.4751844, 1, 1, 1, 1, 1,
1.79097, 0.9431252, 0.6490403, 1, 1, 1, 1, 1,
1.84125, 1.076201, -0.953364, 1, 1, 1, 1, 1,
1.855182, -0.05486287, 0.6733723, 1, 1, 1, 1, 1,
1.882693, -0.8464925, 3.247258, 1, 1, 1, 1, 1,
1.893164, 1.035436, -0.4389178, 1, 1, 1, 1, 1,
1.948926, -0.63756, 1.098523, 1, 1, 1, 1, 1,
1.96641, -0.3081392, 0.7870267, 1, 1, 1, 1, 1,
2.012993, 0.7466121, 1.673037, 1, 1, 1, 1, 1,
2.037279, -0.8015352, 2.172263, 1, 1, 1, 1, 1,
2.122648, -1.269354, 1.625004, 0, 0, 1, 1, 1,
2.142976, 0.413719, 0.9178271, 1, 0, 0, 1, 1,
2.144168, -0.2491619, 0.8473795, 1, 0, 0, 1, 1,
2.17146, 2.95724, -0.3058701, 1, 0, 0, 1, 1,
2.173887, 0.1945616, 1.009797, 1, 0, 0, 1, 1,
2.181877, 1.92691, 0.97156, 1, 0, 0, 1, 1,
2.229439, 1.088287, 0.8431997, 0, 0, 0, 1, 1,
2.263116, -1.116163, -0.4725378, 0, 0, 0, 1, 1,
2.266738, 1.196766, 2.48265, 0, 0, 0, 1, 1,
2.279083, 1.613337, 0.1116126, 0, 0, 0, 1, 1,
2.468105, -1.015812, -0.3279226, 0, 0, 0, 1, 1,
2.470425, 1.183087, 0.1847169, 0, 0, 0, 1, 1,
2.659369, -0.5220929, 1.16395, 0, 0, 0, 1, 1,
2.663769, 0.2057795, 3.399347, 1, 1, 1, 1, 1,
2.704849, -0.2761202, 1.891971, 1, 1, 1, 1, 1,
2.76647, -1.859694, 3.126116, 1, 1, 1, 1, 1,
3.01072, 0.20921, 0.9766542, 1, 1, 1, 1, 1,
3.026947, -0.8363137, 2.266176, 1, 1, 1, 1, 1,
3.228381, -0.680523, -0.6230751, 1, 1, 1, 1, 1,
3.29387, -0.32458, 1.649667, 1, 1, 1, 1, 1
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
var radius = 9.750487;
var distance = 34.24817;
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
mvMatrix.translate( -0.3233575, 0.2903571, 0.02784777 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24817);
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