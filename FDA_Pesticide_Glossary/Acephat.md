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
-3.719605, -0.009158343, -2.962142, 1, 0, 0, 1,
-3.70404, 0.5753677, -2.128604, 1, 0.007843138, 0, 1,
-3.196089, -0.2338098, -1.388701, 1, 0.01176471, 0, 1,
-3.083702, 0.8594609, -1.836997, 1, 0.01960784, 0, 1,
-3.04545, 0.05593369, -0.09982993, 1, 0.02352941, 0, 1,
-3.015452, -0.6031864, -0.8283194, 1, 0.03137255, 0, 1,
-2.744318, 1.21124, -1.128884, 1, 0.03529412, 0, 1,
-2.576149, 1.937577, -3.274633, 1, 0.04313726, 0, 1,
-2.546352, 0.8542293, -1.582947, 1, 0.04705882, 0, 1,
-2.541083, 1.321408, -1.315887, 1, 0.05490196, 0, 1,
-2.487933, -0.2872981, -0.365143, 1, 0.05882353, 0, 1,
-2.475333, 1.677805, -2.66428, 1, 0.06666667, 0, 1,
-2.444288, -0.9876749, -1.321988, 1, 0.07058824, 0, 1,
-2.429815, 0.4210078, -2.017531, 1, 0.07843138, 0, 1,
-2.401834, -1.529066, -2.443865, 1, 0.08235294, 0, 1,
-2.341188, 0.1634822, 0.376543, 1, 0.09019608, 0, 1,
-2.293193, -1.119468, 0.5347636, 1, 0.09411765, 0, 1,
-2.253709, -0.07319991, -3.406269, 1, 0.1019608, 0, 1,
-2.240583, 0.793736, -1.783719, 1, 0.1098039, 0, 1,
-2.200969, 0.5293867, 0.607338, 1, 0.1137255, 0, 1,
-2.10273, 0.7510471, 0.7557083, 1, 0.1215686, 0, 1,
-2.083672, -0.296222, -4.335577, 1, 0.1254902, 0, 1,
-2.074849, 1.071306, -2.123784, 1, 0.1333333, 0, 1,
-2.052707, -0.3713934, -1.966901, 1, 0.1372549, 0, 1,
-2.023211, 2.12869, 0.4793864, 1, 0.145098, 0, 1,
-1.981421, -1.45621, -1.352503, 1, 0.1490196, 0, 1,
-1.96279, -1.695318, -3.11165, 1, 0.1568628, 0, 1,
-1.939074, 1.839414, -1.94572, 1, 0.1607843, 0, 1,
-1.934951, 0.08957254, -1.079431, 1, 0.1686275, 0, 1,
-1.897038, -1.251682, -2.180726, 1, 0.172549, 0, 1,
-1.880767, 1.101218, 0.7623572, 1, 0.1803922, 0, 1,
-1.84949, -1.92154, -1.672329, 1, 0.1843137, 0, 1,
-1.842873, 0.9505929, -1.507684, 1, 0.1921569, 0, 1,
-1.82922, 0.9993289, -1.975903, 1, 0.1960784, 0, 1,
-1.821929, 0.05890062, -2.4188, 1, 0.2039216, 0, 1,
-1.806152, -1.911988, -1.705684, 1, 0.2117647, 0, 1,
-1.787942, 0.2591161, -0.7395667, 1, 0.2156863, 0, 1,
-1.772954, 0.8187792, -0.7408723, 1, 0.2235294, 0, 1,
-1.770078, -0.2103704, -1.016961, 1, 0.227451, 0, 1,
-1.761323, -1.023998, -0.1784379, 1, 0.2352941, 0, 1,
-1.754134, 1.805151, -2.007496, 1, 0.2392157, 0, 1,
-1.737048, 0.3396267, -1.229676, 1, 0.2470588, 0, 1,
-1.700597, -1.489224, -2.760709, 1, 0.2509804, 0, 1,
-1.700252, 0.1004371, 0.01096104, 1, 0.2588235, 0, 1,
-1.690952, 0.350733, -2.568379, 1, 0.2627451, 0, 1,
-1.685574, 1.946203, 0.3987238, 1, 0.2705882, 0, 1,
-1.664008, 0.6243309, -0.8715057, 1, 0.2745098, 0, 1,
-1.656279, -0.3496638, -0.4240614, 1, 0.282353, 0, 1,
-1.633417, -0.3610694, -1.766566, 1, 0.2862745, 0, 1,
-1.598887, -0.07994436, -1.986369, 1, 0.2941177, 0, 1,
-1.596143, 0.8495837, -0.7103077, 1, 0.3019608, 0, 1,
-1.549191, -0.5829129, -1.746207, 1, 0.3058824, 0, 1,
-1.538407, -0.6328999, -0.8761473, 1, 0.3137255, 0, 1,
-1.529438, 0.7132302, -0.7462122, 1, 0.3176471, 0, 1,
-1.524012, -0.07564813, -0.2201924, 1, 0.3254902, 0, 1,
-1.517873, -1.363332, -0.5602411, 1, 0.3294118, 0, 1,
-1.515914, 0.7974319, -0.656374, 1, 0.3372549, 0, 1,
-1.511474, -1.428957, -3.164211, 1, 0.3411765, 0, 1,
-1.499325, 0.9582831, -1.26398, 1, 0.3490196, 0, 1,
-1.498299, 2.121268, 0.9852616, 1, 0.3529412, 0, 1,
-1.487148, 0.5217325, -0.7246087, 1, 0.3607843, 0, 1,
-1.483947, 1.492039, 0.6822286, 1, 0.3647059, 0, 1,
-1.479218, 1.397111, 0.3618678, 1, 0.372549, 0, 1,
-1.466403, 0.1351709, -3.31349, 1, 0.3764706, 0, 1,
-1.46345, 0.9718412, 0.05482957, 1, 0.3843137, 0, 1,
-1.460432, -0.4877244, -2.696333, 1, 0.3882353, 0, 1,
-1.444285, -0.417845, -0.9575435, 1, 0.3960784, 0, 1,
-1.444225, 0.1835723, 0.01087247, 1, 0.4039216, 0, 1,
-1.430526, 0.6365313, -1.553078, 1, 0.4078431, 0, 1,
-1.416549, -0.3438969, -2.727215, 1, 0.4156863, 0, 1,
-1.406293, -0.09823173, -2.960228, 1, 0.4196078, 0, 1,
-1.404354, -1.074817, -1.920658, 1, 0.427451, 0, 1,
-1.400489, -0.9870044, -3.098745, 1, 0.4313726, 0, 1,
-1.38917, 0.8427971, -1.162137, 1, 0.4392157, 0, 1,
-1.38814, 0.4097371, -2.145587, 1, 0.4431373, 0, 1,
-1.38691, 1.374926, -0.5210038, 1, 0.4509804, 0, 1,
-1.371085, 1.350985, 1.006111, 1, 0.454902, 0, 1,
-1.370692, 0.7114847, -1.123402, 1, 0.4627451, 0, 1,
-1.368233, 0.3727034, -2.417403, 1, 0.4666667, 0, 1,
-1.362823, -1.312017, -4.259757, 1, 0.4745098, 0, 1,
-1.36231, 0.7669495, -1.205813, 1, 0.4784314, 0, 1,
-1.357745, 0.8897346, -0.09852039, 1, 0.4862745, 0, 1,
-1.354687, 0.6601646, -0.4716679, 1, 0.4901961, 0, 1,
-1.347493, 1.171404, -0.9761928, 1, 0.4980392, 0, 1,
-1.336096, 0.3328882, -0.4169607, 1, 0.5058824, 0, 1,
-1.335496, -0.07201035, -2.795608, 1, 0.509804, 0, 1,
-1.329861, -0.8793291, -1.706185, 1, 0.5176471, 0, 1,
-1.314651, 0.4047153, -0.2119409, 1, 0.5215687, 0, 1,
-1.303016, 0.3406262, -0.7141255, 1, 0.5294118, 0, 1,
-1.302923, -0.4896064, 0.04248164, 1, 0.5333334, 0, 1,
-1.286531, -1.333225, -1.579398, 1, 0.5411765, 0, 1,
-1.278603, 0.7095526, -1.122148, 1, 0.5450981, 0, 1,
-1.271185, -1.442128, -3.298594, 1, 0.5529412, 0, 1,
-1.269533, 0.5857815, -1.988698, 1, 0.5568628, 0, 1,
-1.264983, 0.1228194, -2.369549, 1, 0.5647059, 0, 1,
-1.262447, -0.6557229, -2.719236, 1, 0.5686275, 0, 1,
-1.259277, 1.332898, -2.449785, 1, 0.5764706, 0, 1,
-1.258056, 0.1194436, -1.447, 1, 0.5803922, 0, 1,
-1.25553, 0.02449778, -2.961173, 1, 0.5882353, 0, 1,
-1.252655, 0.813253, 0.1273065, 1, 0.5921569, 0, 1,
-1.248258, 0.3906378, -3.200145, 1, 0.6, 0, 1,
-1.247711, -1.751853, -2.651246, 1, 0.6078432, 0, 1,
-1.235718, -0.2193577, -2.340285, 1, 0.6117647, 0, 1,
-1.2356, 0.6672655, 0.6817799, 1, 0.6196079, 0, 1,
-1.234168, 0.3060447, -0.7558116, 1, 0.6235294, 0, 1,
-1.225227, 0.4711555, -1.499026, 1, 0.6313726, 0, 1,
-1.218569, 0.3487352, -0.7929605, 1, 0.6352941, 0, 1,
-1.218211, 0.7668886, -1.297794, 1, 0.6431373, 0, 1,
-1.21621, 1.254491, -2.809296, 1, 0.6470588, 0, 1,
-1.216075, 0.08677867, -1.088085, 1, 0.654902, 0, 1,
-1.215355, 0.5958565, -0.4425367, 1, 0.6588235, 0, 1,
-1.215289, -0.7613194, -4.430207, 1, 0.6666667, 0, 1,
-1.208888, -0.5090022, -1.871828, 1, 0.6705883, 0, 1,
-1.207485, -0.9706979, -2.126732, 1, 0.6784314, 0, 1,
-1.204247, 0.394913, -2.070787, 1, 0.682353, 0, 1,
-1.197598, 0.6247185, -2.17877, 1, 0.6901961, 0, 1,
-1.187662, 1.057752, -1.487846, 1, 0.6941177, 0, 1,
-1.184785, -1.92709, -3.157401, 1, 0.7019608, 0, 1,
-1.181157, -0.1484409, -1.710707, 1, 0.7098039, 0, 1,
-1.179592, -0.7668621, -0.8194688, 1, 0.7137255, 0, 1,
-1.169525, 0.2853072, -0.7220094, 1, 0.7215686, 0, 1,
-1.167856, 0.1865751, -2.103616, 1, 0.7254902, 0, 1,
-1.167739, 1.277363, -0.4937905, 1, 0.7333333, 0, 1,
-1.161886, -0.9473478, -3.427394, 1, 0.7372549, 0, 1,
-1.152113, -1.001125, -0.427773, 1, 0.7450981, 0, 1,
-1.135658, -1.448542, -4.543858, 1, 0.7490196, 0, 1,
-1.135218, 0.3859829, -1.399052, 1, 0.7568628, 0, 1,
-1.132647, 0.7388636, 0.1245385, 1, 0.7607843, 0, 1,
-1.125497, -0.6291515, -1.436774, 1, 0.7686275, 0, 1,
-1.121101, -1.048949, -1.803767, 1, 0.772549, 0, 1,
-1.114459, 1.216433, 0.6758953, 1, 0.7803922, 0, 1,
-1.113729, -0.3219572, -1.455717, 1, 0.7843137, 0, 1,
-1.11177, -0.4471151, -2.376384, 1, 0.7921569, 0, 1,
-1.110048, -0.315888, 0.954864, 1, 0.7960784, 0, 1,
-1.10187, 0.6282626, -2.473397, 1, 0.8039216, 0, 1,
-1.09687, 0.006756329, -2.714592, 1, 0.8117647, 0, 1,
-1.088119, 0.4830499, -1.840239, 1, 0.8156863, 0, 1,
-1.078484, 0.6937414, -0.7500294, 1, 0.8235294, 0, 1,
-1.0594, 0.1974773, -2.781453, 1, 0.827451, 0, 1,
-1.056429, 0.07397463, -2.648902, 1, 0.8352941, 0, 1,
-1.038663, 0.3201846, -2.173645, 1, 0.8392157, 0, 1,
-1.03651, 0.3276134, -2.071107, 1, 0.8470588, 0, 1,
-1.032013, 0.08909592, -0.1854409, 1, 0.8509804, 0, 1,
-1.026473, -0.1027083, -3.735777, 1, 0.8588235, 0, 1,
-1.025883, 0.002341561, -1.772393, 1, 0.8627451, 0, 1,
-1.021181, 0.927969, 0.4165095, 1, 0.8705882, 0, 1,
-1.019587, -0.6231945, -0.4459228, 1, 0.8745098, 0, 1,
-1.01769, 1.761639, 0.7323164, 1, 0.8823529, 0, 1,
-1.01694, -0.6060966, -1.587181, 1, 0.8862745, 0, 1,
-1.016809, -0.2748584, -2.502939, 1, 0.8941177, 0, 1,
-1.012068, -0.6066626, -2.345029, 1, 0.8980392, 0, 1,
-1.010039, 0.885985, -0.622326, 1, 0.9058824, 0, 1,
-1.009911, -1.268157, -1.689369, 1, 0.9137255, 0, 1,
-1.001637, -0.2651556, -0.7935672, 1, 0.9176471, 0, 1,
-0.9992336, 0.5206879, -0.6541331, 1, 0.9254902, 0, 1,
-0.9976799, -0.3083382, -2.793099, 1, 0.9294118, 0, 1,
-0.9967109, 1.443829, -0.856564, 1, 0.9372549, 0, 1,
-0.9963644, -0.1759833, -1.291585, 1, 0.9411765, 0, 1,
-0.9945418, 0.03845137, -1.926982, 1, 0.9490196, 0, 1,
-0.9927817, 0.03779504, -1.315477, 1, 0.9529412, 0, 1,
-0.9890514, 0.2130901, -2.821752, 1, 0.9607843, 0, 1,
-0.9886721, 0.2967976, -0.7690558, 1, 0.9647059, 0, 1,
-0.9879086, -1.183524, -2.633511, 1, 0.972549, 0, 1,
-0.9867727, -0.4664882, -1.611152, 1, 0.9764706, 0, 1,
-0.9860286, -2.181214, -4.173883, 1, 0.9843137, 0, 1,
-0.9769027, -0.4256158, -2.406246, 1, 0.9882353, 0, 1,
-0.9719716, -0.02749882, -2.073081, 1, 0.9960784, 0, 1,
-0.9636618, -0.1937127, -2.331727, 0.9960784, 1, 0, 1,
-0.9630014, 0.4463555, -0.8753823, 0.9921569, 1, 0, 1,
-0.9583834, -0.08343145, -0.6763456, 0.9843137, 1, 0, 1,
-0.9565508, -1.247866, -1.0556, 0.9803922, 1, 0, 1,
-0.9560543, 0.5059475, -1.043034, 0.972549, 1, 0, 1,
-0.9514635, -1.313286, -3.290566, 0.9686275, 1, 0, 1,
-0.9487592, 2.538556, -2.126596, 0.9607843, 1, 0, 1,
-0.9400306, 0.1432552, -0.2616269, 0.9568627, 1, 0, 1,
-0.9376367, -0.5280117, -1.115457, 0.9490196, 1, 0, 1,
-0.9362758, -0.5926533, -1.820315, 0.945098, 1, 0, 1,
-0.934367, -0.1020161, -1.573895, 0.9372549, 1, 0, 1,
-0.9340439, -0.2843843, -1.875347, 0.9333333, 1, 0, 1,
-0.9327577, 1.211878, 0.1846903, 0.9254902, 1, 0, 1,
-0.9323003, 0.2099195, -0.8124353, 0.9215686, 1, 0, 1,
-0.9318575, 0.08661666, -1.178125, 0.9137255, 1, 0, 1,
-0.931433, 0.9758903, -0.4419354, 0.9098039, 1, 0, 1,
-0.9268697, 1.235365, -2.7085, 0.9019608, 1, 0, 1,
-0.9258579, -0.7754375, -4.555023, 0.8941177, 1, 0, 1,
-0.9224163, 0.3666534, -1.158408, 0.8901961, 1, 0, 1,
-0.919862, -0.1130461, -1.720852, 0.8823529, 1, 0, 1,
-0.919584, 0.5420511, -0.6823531, 0.8784314, 1, 0, 1,
-0.9133506, 1.055924, -1.798834, 0.8705882, 1, 0, 1,
-0.9131359, -0.4451109, -2.084417, 0.8666667, 1, 0, 1,
-0.9120814, -0.2169233, -2.689678, 0.8588235, 1, 0, 1,
-0.9101169, -0.3618728, -1.592298, 0.854902, 1, 0, 1,
-0.9069936, -1.11306, -2.437089, 0.8470588, 1, 0, 1,
-0.899366, 0.1501472, -2.662164, 0.8431373, 1, 0, 1,
-0.8989425, -0.7204092, -4.805962, 0.8352941, 1, 0, 1,
-0.8906739, -1.239276, -3.412438, 0.8313726, 1, 0, 1,
-0.8899392, -0.2357433, -0.6806051, 0.8235294, 1, 0, 1,
-0.8880962, -1.070212, -0.9665385, 0.8196079, 1, 0, 1,
-0.8874486, -0.8491841, -0.6005608, 0.8117647, 1, 0, 1,
-0.8802142, 1.137714, -2.025666, 0.8078431, 1, 0, 1,
-0.8769134, 0.6663145, -0.3106244, 0.8, 1, 0, 1,
-0.874298, -0.4857011, -2.561965, 0.7921569, 1, 0, 1,
-0.868516, 0.948039, -0.7347298, 0.7882353, 1, 0, 1,
-0.8684087, 0.8534974, -0.9217322, 0.7803922, 1, 0, 1,
-0.862027, 0.1319497, -1.18297, 0.7764706, 1, 0, 1,
-0.8610713, 0.7037018, -2.232438, 0.7686275, 1, 0, 1,
-0.8551279, -0.4025079, -0.5181659, 0.7647059, 1, 0, 1,
-0.8451945, -1.529331, -3.965049, 0.7568628, 1, 0, 1,
-0.8414407, 0.7945391, 1.089998, 0.7529412, 1, 0, 1,
-0.8410647, 0.2203617, -1.686511, 0.7450981, 1, 0, 1,
-0.8406492, 0.04874829, -3.695235, 0.7411765, 1, 0, 1,
-0.8376148, 0.4953087, -0.8757825, 0.7333333, 1, 0, 1,
-0.8369483, 0.2072916, -1.820522, 0.7294118, 1, 0, 1,
-0.8245789, 0.4800598, -1.999078, 0.7215686, 1, 0, 1,
-0.8181016, 1.583083, -2.169073, 0.7176471, 1, 0, 1,
-0.8076369, 1.614513, -1.404318, 0.7098039, 1, 0, 1,
-0.8061355, 0.7723289, -0.9446265, 0.7058824, 1, 0, 1,
-0.8019062, 0.7271788, -1.346434, 0.6980392, 1, 0, 1,
-0.8016949, -0.3451624, -1.206831, 0.6901961, 1, 0, 1,
-0.7986552, -1.286209, -0.9019346, 0.6862745, 1, 0, 1,
-0.7885612, 0.2533189, -0.2961584, 0.6784314, 1, 0, 1,
-0.7877513, -0.5101947, -2.469891, 0.6745098, 1, 0, 1,
-0.7867663, 1.235407, -1.91895, 0.6666667, 1, 0, 1,
-0.7843912, 0.7360375, 1.749711, 0.6627451, 1, 0, 1,
-0.7831339, 1.531934, -2.215503, 0.654902, 1, 0, 1,
-0.7756534, 0.5930439, -0.6235573, 0.6509804, 1, 0, 1,
-0.7741435, 1.984878, 1.045373, 0.6431373, 1, 0, 1,
-0.7725949, 0.2567065, -0.1709179, 0.6392157, 1, 0, 1,
-0.772151, 1.338058, -0.09419115, 0.6313726, 1, 0, 1,
-0.7717835, -0.8101131, -2.801672, 0.627451, 1, 0, 1,
-0.7708036, -0.762419, -2.51327, 0.6196079, 1, 0, 1,
-0.7700277, 0.9678279, -2.510865, 0.6156863, 1, 0, 1,
-0.7673668, -0.7107144, -4.15622, 0.6078432, 1, 0, 1,
-0.7669343, 0.6376167, -1.400135, 0.6039216, 1, 0, 1,
-0.7649022, -0.2276089, -1.159027, 0.5960785, 1, 0, 1,
-0.7641159, -1.619446, -2.659672, 0.5882353, 1, 0, 1,
-0.7620738, 1.394271, 1.173689, 0.5843138, 1, 0, 1,
-0.7618241, 0.8806674, -0.01445119, 0.5764706, 1, 0, 1,
-0.7562931, 0.946367, -1.999247, 0.572549, 1, 0, 1,
-0.7545518, 0.2900619, -3.016987, 0.5647059, 1, 0, 1,
-0.7499574, 0.6689149, 0.4224206, 0.5607843, 1, 0, 1,
-0.7459279, 0.4079443, -0.1679977, 0.5529412, 1, 0, 1,
-0.7438737, 2.38966, 0.4006089, 0.5490196, 1, 0, 1,
-0.7425986, -0.772255, -0.861658, 0.5411765, 1, 0, 1,
-0.7423617, 1.514301, -1.116475, 0.5372549, 1, 0, 1,
-0.7364497, -1.591043, -3.352644, 0.5294118, 1, 0, 1,
-0.7353263, 0.5732411, -1.249462, 0.5254902, 1, 0, 1,
-0.7343422, -1.630287, -4.196311, 0.5176471, 1, 0, 1,
-0.7316045, 0.05281132, -1.530937, 0.5137255, 1, 0, 1,
-0.7256756, -0.01837116, -1.6626, 0.5058824, 1, 0, 1,
-0.7239817, -0.4579437, -1.808386, 0.5019608, 1, 0, 1,
-0.7192797, 1.941312, -0.3524715, 0.4941176, 1, 0, 1,
-0.7166293, -0.0727232, -2.368295, 0.4862745, 1, 0, 1,
-0.7152857, -1.382833, -2.874317, 0.4823529, 1, 0, 1,
-0.7066727, -0.6855034, -1.76555, 0.4745098, 1, 0, 1,
-0.7044669, -2.036903, -2.546522, 0.4705882, 1, 0, 1,
-0.6999422, -2.597684, -1.994984, 0.4627451, 1, 0, 1,
-0.6994741, -0.07707248, -2.410598, 0.4588235, 1, 0, 1,
-0.6956055, -1.190577, -2.179349, 0.4509804, 1, 0, 1,
-0.6783509, 0.1541752, -0.7839364, 0.4470588, 1, 0, 1,
-0.6761844, -1.328547, -3.014926, 0.4392157, 1, 0, 1,
-0.6693141, -1.016577, -1.852441, 0.4352941, 1, 0, 1,
-0.6676522, 1.163286, -1.189051, 0.427451, 1, 0, 1,
-0.6626937, 2.562113, 0.808693, 0.4235294, 1, 0, 1,
-0.6624773, -0.733401, -3.821171, 0.4156863, 1, 0, 1,
-0.6615456, -0.244717, -0.9824369, 0.4117647, 1, 0, 1,
-0.6543629, -0.09960336, -0.3605831, 0.4039216, 1, 0, 1,
-0.643215, -0.8882309, -1.982382, 0.3960784, 1, 0, 1,
-0.6430629, 1.597888, -1.560621, 0.3921569, 1, 0, 1,
-0.6415316, 1.715324, -1.060313, 0.3843137, 1, 0, 1,
-0.638694, 0.470101, -0.7156695, 0.3803922, 1, 0, 1,
-0.6351497, 0.7991757, -0.659506, 0.372549, 1, 0, 1,
-0.6343181, -1.673602, -3.246695, 0.3686275, 1, 0, 1,
-0.6319541, -0.7429191, -4.120569, 0.3607843, 1, 0, 1,
-0.622125, -1.101435, -3.249084, 0.3568628, 1, 0, 1,
-0.6190453, -0.7246112, -2.110564, 0.3490196, 1, 0, 1,
-0.6178722, -0.7668951, -2.178852, 0.345098, 1, 0, 1,
-0.6166028, 0.8400428, -0.1710329, 0.3372549, 1, 0, 1,
-0.6161461, 0.8735213, 0.5272519, 0.3333333, 1, 0, 1,
-0.6150918, 0.001214092, -0.7526305, 0.3254902, 1, 0, 1,
-0.6067836, 0.6768054, -1.292058, 0.3215686, 1, 0, 1,
-0.6046479, 1.210026, -0.1358, 0.3137255, 1, 0, 1,
-0.6039083, -0.5407732, -2.890013, 0.3098039, 1, 0, 1,
-0.6032799, 1.365932, 0.1622237, 0.3019608, 1, 0, 1,
-0.6019014, -0.9252216, -2.960628, 0.2941177, 1, 0, 1,
-0.6010001, 1.425609, 0.2809677, 0.2901961, 1, 0, 1,
-0.6002851, -0.08398736, -0.4996777, 0.282353, 1, 0, 1,
-0.5986486, 0.1696537, -1.69633, 0.2784314, 1, 0, 1,
-0.5967963, 0.1308823, -3.136027, 0.2705882, 1, 0, 1,
-0.5965502, -0.3282916, -2.140167, 0.2666667, 1, 0, 1,
-0.5941207, 0.591714, -2.547436, 0.2588235, 1, 0, 1,
-0.5927708, -1.275953, -2.651586, 0.254902, 1, 0, 1,
-0.590225, 0.416148, -1.231153, 0.2470588, 1, 0, 1,
-0.5858444, -0.3629356, -0.2258828, 0.2431373, 1, 0, 1,
-0.5856274, -0.6452719, -1.507731, 0.2352941, 1, 0, 1,
-0.5823494, 1.599065, 1.172619, 0.2313726, 1, 0, 1,
-0.5799333, 0.4075107, -2.157475, 0.2235294, 1, 0, 1,
-0.5788068, 0.2360991, -2.033159, 0.2196078, 1, 0, 1,
-0.575511, -0.4304653, -1.888585, 0.2117647, 1, 0, 1,
-0.5749993, 0.483905, 0.5687606, 0.2078431, 1, 0, 1,
-0.5739659, 0.1329021, -0.7201055, 0.2, 1, 0, 1,
-0.57142, -1.216159, -3.206399, 0.1921569, 1, 0, 1,
-0.5669169, -0.6951289, -2.571333, 0.1882353, 1, 0, 1,
-0.5667496, 0.5259699, -0.03686349, 0.1803922, 1, 0, 1,
-0.5635161, 0.4796184, 2.014872, 0.1764706, 1, 0, 1,
-0.5558795, -0.4169403, -2.611485, 0.1686275, 1, 0, 1,
-0.5530264, 0.1618136, -2.022784, 0.1647059, 1, 0, 1,
-0.552323, 0.7365177, 1.165695, 0.1568628, 1, 0, 1,
-0.546282, -1.449274, -1.699773, 0.1529412, 1, 0, 1,
-0.5452275, -1.379256, -3.32425, 0.145098, 1, 0, 1,
-0.5441094, -1.071242, -2.777692, 0.1411765, 1, 0, 1,
-0.5397109, 0.8862513, -1.119387, 0.1333333, 1, 0, 1,
-0.5370986, 0.6573565, -0.7626242, 0.1294118, 1, 0, 1,
-0.5366092, -0.4053319, -2.165555, 0.1215686, 1, 0, 1,
-0.5346149, 0.8375595, -1.357665, 0.1176471, 1, 0, 1,
-0.5325258, -1.887508, -3.631437, 0.1098039, 1, 0, 1,
-0.5250921, -1.294445, -2.22262, 0.1058824, 1, 0, 1,
-0.5238299, -0.1005665, -1.645755, 0.09803922, 1, 0, 1,
-0.5211942, -0.3586883, -2.016909, 0.09019608, 1, 0, 1,
-0.5208941, -1.033027, -3.692528, 0.08627451, 1, 0, 1,
-0.5196164, -1.26138, -4.166342, 0.07843138, 1, 0, 1,
-0.5187121, 0.2175912, 0.7530531, 0.07450981, 1, 0, 1,
-0.5139024, -0.1909237, -0.8040959, 0.06666667, 1, 0, 1,
-0.5132272, -0.872255, -1.602993, 0.0627451, 1, 0, 1,
-0.5100382, -2.611161, -1.656417, 0.05490196, 1, 0, 1,
-0.5084072, -0.6813286, -2.610431, 0.05098039, 1, 0, 1,
-0.5082452, -0.7864727, -2.482845, 0.04313726, 1, 0, 1,
-0.5076383, -1.55414, -1.938393, 0.03921569, 1, 0, 1,
-0.5075215, 2.210368, 0.9760743, 0.03137255, 1, 0, 1,
-0.5061952, 0.7313042, 0.0332178, 0.02745098, 1, 0, 1,
-0.5029584, 1.403219, -0.7349882, 0.01960784, 1, 0, 1,
-0.5004596, 0.5004258, -2.089825, 0.01568628, 1, 0, 1,
-0.4904862, 1.507514, -0.8391684, 0.007843138, 1, 0, 1,
-0.4902291, -0.1372793, -3.004953, 0.003921569, 1, 0, 1,
-0.4899386, -0.1651299, -2.225319, 0, 1, 0.003921569, 1,
-0.4837488, -0.5473474, -3.491252, 0, 1, 0.01176471, 1,
-0.4817378, -1.143332, -2.217225, 0, 1, 0.01568628, 1,
-0.4762249, 0.09113435, -1.218517, 0, 1, 0.02352941, 1,
-0.473685, 0.5804057, 0.3435662, 0, 1, 0.02745098, 1,
-0.4723467, -0.8794719, -2.022838, 0, 1, 0.03529412, 1,
-0.4704262, -1.513016, -1.975975, 0, 1, 0.03921569, 1,
-0.4656449, -1.546054, -3.912232, 0, 1, 0.04705882, 1,
-0.4633905, 0.3876375, -1.297351, 0, 1, 0.05098039, 1,
-0.4622051, 1.303163, 0.4634589, 0, 1, 0.05882353, 1,
-0.4608555, -2.018913, -2.332102, 0, 1, 0.0627451, 1,
-0.4599615, 0.6750862, -0.8227676, 0, 1, 0.07058824, 1,
-0.4577129, -0.9764088, -2.55632, 0, 1, 0.07450981, 1,
-0.4470822, -0.7069854, -4.550182, 0, 1, 0.08235294, 1,
-0.4465022, 0.32502, -1.323786, 0, 1, 0.08627451, 1,
-0.4456755, 0.4893842, -0.2179559, 0, 1, 0.09411765, 1,
-0.4452237, 0.1559778, -1.053115, 0, 1, 0.1019608, 1,
-0.4443718, -1.525364, -3.757935, 0, 1, 0.1058824, 1,
-0.4431673, -1.567576, -2.184843, 0, 1, 0.1137255, 1,
-0.4428803, -1.054396, -1.460852, 0, 1, 0.1176471, 1,
-0.4409618, 1.300059, 0.4755847, 0, 1, 0.1254902, 1,
-0.4397863, 0.9836868, -2.43593, 0, 1, 0.1294118, 1,
-0.4375778, -1.573904, -2.268551, 0, 1, 0.1372549, 1,
-0.4295496, 0.8833487, -2.68863, 0, 1, 0.1411765, 1,
-0.4268533, 0.3786417, -0.306706, 0, 1, 0.1490196, 1,
-0.4238201, 1.044873, 0.3620521, 0, 1, 0.1529412, 1,
-0.4187877, 0.4821803, -0.4638004, 0, 1, 0.1607843, 1,
-0.4154598, -0.1300709, -3.728832, 0, 1, 0.1647059, 1,
-0.4126087, 1.091887, -1.625393, 0, 1, 0.172549, 1,
-0.4111644, -0.5228525, -2.989401, 0, 1, 0.1764706, 1,
-0.4111625, 0.8311673, -2.076963, 0, 1, 0.1843137, 1,
-0.4098593, 1.097499, -0.01525734, 0, 1, 0.1882353, 1,
-0.4085705, 0.7776093, -0.03483553, 0, 1, 0.1960784, 1,
-0.3999399, 1.148929, 0.04817163, 0, 1, 0.2039216, 1,
-0.3950633, -1.48754, -2.036382, 0, 1, 0.2078431, 1,
-0.3949307, 0.0654106, -0.7723514, 0, 1, 0.2156863, 1,
-0.3948115, 1.853312, 1.060875, 0, 1, 0.2196078, 1,
-0.3834852, 1.62032, -0.6980258, 0, 1, 0.227451, 1,
-0.3797649, -0.2663899, -2.694482, 0, 1, 0.2313726, 1,
-0.3714913, -1.30545, -3.254465, 0, 1, 0.2392157, 1,
-0.3699088, 0.5454271, -0.454839, 0, 1, 0.2431373, 1,
-0.3668087, -0.08310852, -1.550394, 0, 1, 0.2509804, 1,
-0.3593606, 0.3281729, -1.49746, 0, 1, 0.254902, 1,
-0.3574786, -0.7985924, -4.002528, 0, 1, 0.2627451, 1,
-0.3506737, -0.6434723, -2.076168, 0, 1, 0.2666667, 1,
-0.3461949, 0.5605797, 0.485276, 0, 1, 0.2745098, 1,
-0.3435495, -0.5270299, -2.458989, 0, 1, 0.2784314, 1,
-0.3397406, -0.1936238, -2.809172, 0, 1, 0.2862745, 1,
-0.3355089, -1.514898, 0.03770742, 0, 1, 0.2901961, 1,
-0.3338821, 0.1553647, -1.808889, 0, 1, 0.2980392, 1,
-0.3330198, 1.061641, -1.667772, 0, 1, 0.3058824, 1,
-0.3328508, -0.6084375, -3.023606, 0, 1, 0.3098039, 1,
-0.3324693, -0.7728002, -1.134601, 0, 1, 0.3176471, 1,
-0.3308131, -0.1496166, -2.624051, 0, 1, 0.3215686, 1,
-0.3285625, -1.228481, -4.177706, 0, 1, 0.3294118, 1,
-0.3274274, 0.5663019, 1.229614, 0, 1, 0.3333333, 1,
-0.3228673, 0.8226714, 0.7889481, 0, 1, 0.3411765, 1,
-0.3186638, 1.977478, -2.126744, 0, 1, 0.345098, 1,
-0.3180565, -0.4032371, -1.860371, 0, 1, 0.3529412, 1,
-0.3175596, 0.2840214, 0.2834965, 0, 1, 0.3568628, 1,
-0.3139855, -0.8896635, -3.730157, 0, 1, 0.3647059, 1,
-0.309626, 0.6517206, -0.5573096, 0, 1, 0.3686275, 1,
-0.3048304, 0.1187472, 0.2921624, 0, 1, 0.3764706, 1,
-0.3042539, -0.09939617, -1.255223, 0, 1, 0.3803922, 1,
-0.2967757, -0.6726583, -3.315359, 0, 1, 0.3882353, 1,
-0.2966488, -0.01534239, -1.890199, 0, 1, 0.3921569, 1,
-0.2911118, 1.34955, -0.5699601, 0, 1, 0.4, 1,
-0.2846929, 1.895941, -0.8325294, 0, 1, 0.4078431, 1,
-0.2837722, -0.8812696, -2.613467, 0, 1, 0.4117647, 1,
-0.2837719, 0.979007, 0.2962146, 0, 1, 0.4196078, 1,
-0.2808099, 0.8117782, -1.750469, 0, 1, 0.4235294, 1,
-0.2804742, 1.75914, -1.695868, 0, 1, 0.4313726, 1,
-0.279783, -0.8196513, -3.601522, 0, 1, 0.4352941, 1,
-0.2756512, -1.016584, -3.838036, 0, 1, 0.4431373, 1,
-0.2697132, -1.231154, -1.220925, 0, 1, 0.4470588, 1,
-0.2684514, -0.8227581, -4.20342, 0, 1, 0.454902, 1,
-0.2652221, 1.281954, -0.5814345, 0, 1, 0.4588235, 1,
-0.263833, -1.297015, -2.182621, 0, 1, 0.4666667, 1,
-0.2588794, 0.4945736, -1.360512, 0, 1, 0.4705882, 1,
-0.2547778, 0.09772066, -2.956196, 0, 1, 0.4784314, 1,
-0.2539738, 1.307556, 0.7606102, 0, 1, 0.4823529, 1,
-0.2495257, -0.1114612, -0.2291753, 0, 1, 0.4901961, 1,
-0.249088, -0.7551739, -3.494464, 0, 1, 0.4941176, 1,
-0.2461911, -1.818945, -3.019354, 0, 1, 0.5019608, 1,
-0.2461035, -0.8886885, -3.001451, 0, 1, 0.509804, 1,
-0.2434121, 1.614695, 0.3056752, 0, 1, 0.5137255, 1,
-0.2407922, 0.223653, -0.1091628, 0, 1, 0.5215687, 1,
-0.2392558, -0.9516392, -4.052668, 0, 1, 0.5254902, 1,
-0.2364806, 0.3652095, -0.2401383, 0, 1, 0.5333334, 1,
-0.2363587, 1.715422, 0.06627049, 0, 1, 0.5372549, 1,
-0.2358304, -0.401833, -1.912426, 0, 1, 0.5450981, 1,
-0.2351787, 2.259624, -0.978449, 0, 1, 0.5490196, 1,
-0.23354, 1.678168, -0.2855835, 0, 1, 0.5568628, 1,
-0.2324903, -0.7543657, -2.515245, 0, 1, 0.5607843, 1,
-0.2317848, -0.4368573, -3.487411, 0, 1, 0.5686275, 1,
-0.2316622, 0.7459329, -0.5540153, 0, 1, 0.572549, 1,
-0.2316116, -0.5931739, -1.5204, 0, 1, 0.5803922, 1,
-0.2296267, -1.110385, -1.993457, 0, 1, 0.5843138, 1,
-0.2288202, 0.3694761, -0.6856874, 0, 1, 0.5921569, 1,
-0.2275021, -2.00045, -2.846659, 0, 1, 0.5960785, 1,
-0.2261374, 1.87029, -0.609319, 0, 1, 0.6039216, 1,
-0.2251543, -0.2189001, -0.8427466, 0, 1, 0.6117647, 1,
-0.2246343, 0.4115011, 0.7140189, 0, 1, 0.6156863, 1,
-0.2228736, -1.129741, -2.939807, 0, 1, 0.6235294, 1,
-0.2158451, 0.08547074, -0.5443103, 0, 1, 0.627451, 1,
-0.2128038, -1.945767, -3.387235, 0, 1, 0.6352941, 1,
-0.2111666, -1.14996, -2.142471, 0, 1, 0.6392157, 1,
-0.2098062, -1.398055, -2.847567, 0, 1, 0.6470588, 1,
-0.2072656, 1.500479, 0.9424389, 0, 1, 0.6509804, 1,
-0.2064619, -2.360135, -4.82591, 0, 1, 0.6588235, 1,
-0.2037968, -0.7760485, -3.146437, 0, 1, 0.6627451, 1,
-0.1990309, 0.7578274, -0.2422735, 0, 1, 0.6705883, 1,
-0.1975767, -0.008742678, -2.049691, 0, 1, 0.6745098, 1,
-0.1974965, -1.2895, -3.680077, 0, 1, 0.682353, 1,
-0.1967079, 0.9949694, 0.1710496, 0, 1, 0.6862745, 1,
-0.1933514, 2.585665, -0.1463924, 0, 1, 0.6941177, 1,
-0.1922055, 0.5933165, -0.9099624, 0, 1, 0.7019608, 1,
-0.1833888, -0.7419912, -1.080681, 0, 1, 0.7058824, 1,
-0.1832986, 0.1135652, -3.650274, 0, 1, 0.7137255, 1,
-0.1800706, 1.568682, -0.0001259134, 0, 1, 0.7176471, 1,
-0.1764988, 0.7772926, -0.8462798, 0, 1, 0.7254902, 1,
-0.1711085, 0.4197248, -0.1203923, 0, 1, 0.7294118, 1,
-0.1701972, -0.7353843, -1.773204, 0, 1, 0.7372549, 1,
-0.1693453, 1.340716, -2.276037, 0, 1, 0.7411765, 1,
-0.1595128, 0.477996, 0.7717797, 0, 1, 0.7490196, 1,
-0.1568986, -1.880905, -2.796335, 0, 1, 0.7529412, 1,
-0.1541122, -0.5580812, -3.78934, 0, 1, 0.7607843, 1,
-0.153869, 0.6222149, -0.1076194, 0, 1, 0.7647059, 1,
-0.1477533, -0.3698139, -2.186831, 0, 1, 0.772549, 1,
-0.1438247, -0.02856648, -0.7423311, 0, 1, 0.7764706, 1,
-0.1432064, 1.048017, -1.58838, 0, 1, 0.7843137, 1,
-0.1426861, -0.3294475, -3.914225, 0, 1, 0.7882353, 1,
-0.1371794, -1.381551, -3.343804, 0, 1, 0.7960784, 1,
-0.1355134, 1.765146, -0.6946977, 0, 1, 0.8039216, 1,
-0.1342901, -0.6779232, -2.927907, 0, 1, 0.8078431, 1,
-0.1321063, 0.1548218, -0.945838, 0, 1, 0.8156863, 1,
-0.1318435, -0.09139385, -1.758322, 0, 1, 0.8196079, 1,
-0.1287889, -1.145012, -3.950823, 0, 1, 0.827451, 1,
-0.1273976, 1.12192, -1.705264, 0, 1, 0.8313726, 1,
-0.1268487, 0.1425583, 1.551857, 0, 1, 0.8392157, 1,
-0.1224767, -0.2189475, -4.18996, 0, 1, 0.8431373, 1,
-0.119569, -0.6839471, -2.650824, 0, 1, 0.8509804, 1,
-0.1104995, 0.943073, 0.2280778, 0, 1, 0.854902, 1,
-0.1094518, 0.4634547, -0.8983774, 0, 1, 0.8627451, 1,
-0.1093547, 0.9205664, -1.755211, 0, 1, 0.8666667, 1,
-0.1090912, -0.121474, -2.452978, 0, 1, 0.8745098, 1,
-0.1068487, 0.6702356, 1.518233, 0, 1, 0.8784314, 1,
-0.1013819, -0.008185367, -2.237204, 0, 1, 0.8862745, 1,
-0.09837352, -0.1686828, -2.553723, 0, 1, 0.8901961, 1,
-0.09715305, 0.04669668, -1.635635, 0, 1, 0.8980392, 1,
-0.09449133, 0.5617453, -0.05888132, 0, 1, 0.9058824, 1,
-0.09164869, -0.9204279, -4.106727, 0, 1, 0.9098039, 1,
-0.09026238, 1.101979, -0.4461392, 0, 1, 0.9176471, 1,
-0.0855996, -1.513841, -1.215412, 0, 1, 0.9215686, 1,
-0.08301454, 0.7741539, -0.1263956, 0, 1, 0.9294118, 1,
-0.07324185, -0.875151, -3.655022, 0, 1, 0.9333333, 1,
-0.06949728, -0.1313401, -2.586434, 0, 1, 0.9411765, 1,
-0.0693578, 1.842426, -1.010409, 0, 1, 0.945098, 1,
-0.06856969, 0.169777, -0.7032536, 0, 1, 0.9529412, 1,
-0.06703867, -1.08587, -4.167217, 0, 1, 0.9568627, 1,
-0.06644838, -0.8051351, -2.962645, 0, 1, 0.9647059, 1,
-0.06355576, -0.0007178371, 0.2074756, 0, 1, 0.9686275, 1,
-0.06172223, 0.2929305, 0.9025376, 0, 1, 0.9764706, 1,
-0.05708611, -1.453519, -3.525992, 0, 1, 0.9803922, 1,
-0.0559273, 0.1121524, -1.625371, 0, 1, 0.9882353, 1,
-0.05451258, 0.1628831, -0.5123698, 0, 1, 0.9921569, 1,
-0.0481552, -0.9044402, -4.866404, 0, 1, 1, 1,
-0.04501614, 0.2208557, -0.8570143, 0, 0.9921569, 1, 1,
-0.04356289, 0.5357326, -0.1905769, 0, 0.9882353, 1, 1,
-0.04320116, -1.108927, -3.094808, 0, 0.9803922, 1, 1,
-0.03357626, 0.1136508, -0.8223315, 0, 0.9764706, 1, 1,
-0.0303489, -0.3673112, -2.976746, 0, 0.9686275, 1, 1,
-0.02180636, -1.584517, -4.800401, 0, 0.9647059, 1, 1,
-0.02174882, 1.20162, -1.193713, 0, 0.9568627, 1, 1,
-0.01738221, -0.01938238, -1.302251, 0, 0.9529412, 1, 1,
-0.01444065, -0.06062841, -4.667688, 0, 0.945098, 1, 1,
-0.01304535, -0.7080988, -1.959671, 0, 0.9411765, 1, 1,
-0.01048943, 0.5304238, -0.3820335, 0, 0.9333333, 1, 1,
-0.01020115, 1.288825, 0.6790013, 0, 0.9294118, 1, 1,
-0.009343622, 1.343779, 2.197093, 0, 0.9215686, 1, 1,
-0.00882233, -0.7514155, -4.211031, 0, 0.9176471, 1, 1,
-0.00127706, -1.362167, -2.529845, 0, 0.9098039, 1, 1,
-0.0004102011, -0.7615246, -4.101564, 0, 0.9058824, 1, 1,
0.003559899, -0.2494596, 2.799043, 0, 0.8980392, 1, 1,
0.003810453, 0.9613758, 0.6764811, 0, 0.8901961, 1, 1,
0.004044544, -1.517749, 2.570884, 0, 0.8862745, 1, 1,
0.00727062, 0.5339681, 1.879084, 0, 0.8784314, 1, 1,
0.009861074, -0.323389, 3.914019, 0, 0.8745098, 1, 1,
0.01235845, 0.930039, 0.1675966, 0, 0.8666667, 1, 1,
0.01384331, -1.363636, 3.342587, 0, 0.8627451, 1, 1,
0.01393143, -1.999577, 2.026943, 0, 0.854902, 1, 1,
0.01797451, -1.739802, 5.028469, 0, 0.8509804, 1, 1,
0.01806238, 0.2411234, -1.176451, 0, 0.8431373, 1, 1,
0.01950859, 1.324299, 0.2382, 0, 0.8392157, 1, 1,
0.02113633, -1.03622, 4.192993, 0, 0.8313726, 1, 1,
0.02339345, -1.85352, 2.595747, 0, 0.827451, 1, 1,
0.02749339, -0.5839753, 2.404644, 0, 0.8196079, 1, 1,
0.03096098, -0.9853361, 2.188135, 0, 0.8156863, 1, 1,
0.03434784, 0.560691, 1.54875, 0, 0.8078431, 1, 1,
0.03495004, -0.05675326, 3.138528, 0, 0.8039216, 1, 1,
0.0354201, -2.093661, 2.866812, 0, 0.7960784, 1, 1,
0.03885138, -1.750585, 4.662999, 0, 0.7882353, 1, 1,
0.03900661, 0.3808124, -1.0811, 0, 0.7843137, 1, 1,
0.04163791, 0.7828567, -1.596985, 0, 0.7764706, 1, 1,
0.04308532, -1.46866, 2.064426, 0, 0.772549, 1, 1,
0.04715486, -0.7975798, 4.056135, 0, 0.7647059, 1, 1,
0.04810461, 0.569995, -1.731009, 0, 0.7607843, 1, 1,
0.05403323, 0.7348086, 1.427352, 0, 0.7529412, 1, 1,
0.05617619, -1.529366, 1.622912, 0, 0.7490196, 1, 1,
0.05694867, 0.5050054, 1.721283, 0, 0.7411765, 1, 1,
0.05780539, -0.6595789, 4.023181, 0, 0.7372549, 1, 1,
0.06053281, -0.04093513, 0.8412424, 0, 0.7294118, 1, 1,
0.06297784, -0.8664997, 1.933002, 0, 0.7254902, 1, 1,
0.06409843, 1.812023, -0.3418344, 0, 0.7176471, 1, 1,
0.06669141, -2.24943, 3.318416, 0, 0.7137255, 1, 1,
0.06677464, 0.1869831, 1.308381, 0, 0.7058824, 1, 1,
0.0667921, 0.121472, 0.5812155, 0, 0.6980392, 1, 1,
0.07124031, -0.5244984, 3.00058, 0, 0.6941177, 1, 1,
0.07339496, 0.8803974, -0.569628, 0, 0.6862745, 1, 1,
0.07433047, -0.2650811, 2.189344, 0, 0.682353, 1, 1,
0.07891037, -0.5068333, 0.9384848, 0, 0.6745098, 1, 1,
0.08093393, -1.681398, 3.75434, 0, 0.6705883, 1, 1,
0.08189028, -0.342766, 0.3150707, 0, 0.6627451, 1, 1,
0.08580591, -0.5443448, 1.359126, 0, 0.6588235, 1, 1,
0.08781017, -1.743552, 1.782323, 0, 0.6509804, 1, 1,
0.08859845, 0.5072768, 0.4995057, 0, 0.6470588, 1, 1,
0.09685717, -1.547324, 2.034538, 0, 0.6392157, 1, 1,
0.1012313, -0.3126082, 2.570478, 0, 0.6352941, 1, 1,
0.1039466, -0.6212634, 1.770286, 0, 0.627451, 1, 1,
0.1063824, 0.6974912, -1.046345, 0, 0.6235294, 1, 1,
0.1160721, 0.718645, 0.9121459, 0, 0.6156863, 1, 1,
0.1170205, 1.421907, 0.8357902, 0, 0.6117647, 1, 1,
0.1179514, -2.006423, 3.097868, 0, 0.6039216, 1, 1,
0.1180643, -0.7229431, 3.546108, 0, 0.5960785, 1, 1,
0.1187166, -0.2028262, 1.698734, 0, 0.5921569, 1, 1,
0.1189151, 0.2636472, -0.04180793, 0, 0.5843138, 1, 1,
0.1211757, -1.667803, 2.590497, 0, 0.5803922, 1, 1,
0.1222434, -0.04902879, 1.239382, 0, 0.572549, 1, 1,
0.1253497, -0.0311145, 2.859255, 0, 0.5686275, 1, 1,
0.1280453, -0.7008593, 0.8042263, 0, 0.5607843, 1, 1,
0.1280686, -0.7419379, 4.115938, 0, 0.5568628, 1, 1,
0.1291301, 0.5200544, 0.534866, 0, 0.5490196, 1, 1,
0.1292934, -2.69398, 2.427001, 0, 0.5450981, 1, 1,
0.1347958, 0.8725872, 0.8520218, 0, 0.5372549, 1, 1,
0.1390904, -0.05436954, 2.762473, 0, 0.5333334, 1, 1,
0.1394374, 0.1316267, 1.134829, 0, 0.5254902, 1, 1,
0.1399009, -0.07129197, 2.153467, 0, 0.5215687, 1, 1,
0.1399316, 0.5290328, -0.4456488, 0, 0.5137255, 1, 1,
0.1408413, -0.2592751, 3.013113, 0, 0.509804, 1, 1,
0.1440578, -1.696665, 3.348349, 0, 0.5019608, 1, 1,
0.1500448, -0.5157536, 2.354745, 0, 0.4941176, 1, 1,
0.1509845, -0.5247134, 5.302249, 0, 0.4901961, 1, 1,
0.1538622, -2.696965, 1.537759, 0, 0.4823529, 1, 1,
0.1641644, -1.853202, 3.419962, 0, 0.4784314, 1, 1,
0.1650538, -0.6363068, 3.341525, 0, 0.4705882, 1, 1,
0.1666615, -1.218605, 2.746888, 0, 0.4666667, 1, 1,
0.1684099, 1.128109, 0.4769284, 0, 0.4588235, 1, 1,
0.1717768, -0.6523585, 2.988086, 0, 0.454902, 1, 1,
0.1739572, -0.2373938, 2.720854, 0, 0.4470588, 1, 1,
0.1745867, 0.4009698, 1.007319, 0, 0.4431373, 1, 1,
0.1750612, -0.1412766, 3.171628, 0, 0.4352941, 1, 1,
0.1762607, 1.870675, 0.7754129, 0, 0.4313726, 1, 1,
0.1774407, 0.5147325, 0.5695723, 0, 0.4235294, 1, 1,
0.1779044, -0.2753264, 1.253124, 0, 0.4196078, 1, 1,
0.1805604, 0.8938047, 0.05689022, 0, 0.4117647, 1, 1,
0.1813131, 0.315658, -1.202633, 0, 0.4078431, 1, 1,
0.1828974, -0.1244487, 2.580053, 0, 0.4, 1, 1,
0.193084, -0.3841104, 2.601491, 0, 0.3921569, 1, 1,
0.1987675, -0.708708, 3.050469, 0, 0.3882353, 1, 1,
0.2105878, 0.05778471, 2.277285, 0, 0.3803922, 1, 1,
0.2195748, -0.06807788, 2.920599, 0, 0.3764706, 1, 1,
0.2245402, -0.107604, 2.07064, 0, 0.3686275, 1, 1,
0.2247522, 0.2230721, 0.2738871, 0, 0.3647059, 1, 1,
0.2248171, 0.2441043, 1.285309, 0, 0.3568628, 1, 1,
0.2306865, 0.4575822, 0.8116165, 0, 0.3529412, 1, 1,
0.231622, 1.084238, -0.2857633, 0, 0.345098, 1, 1,
0.2322273, 2.27485, 1.771207, 0, 0.3411765, 1, 1,
0.2341228, -0.4456869, 3.529515, 0, 0.3333333, 1, 1,
0.2368464, -0.818051, 2.847703, 0, 0.3294118, 1, 1,
0.2405724, 0.7469286, 0.2256461, 0, 0.3215686, 1, 1,
0.2430898, -0.2699619, 3.786605, 0, 0.3176471, 1, 1,
0.2433941, 0.9491577, -0.4681644, 0, 0.3098039, 1, 1,
0.2478656, -0.8597944, 3.108454, 0, 0.3058824, 1, 1,
0.2517948, -0.6191094, 2.060143, 0, 0.2980392, 1, 1,
0.2570049, 1.15717, 0.2391781, 0, 0.2901961, 1, 1,
0.2578115, 0.2852505, 0.7738177, 0, 0.2862745, 1, 1,
0.2610814, -0.01750876, 1.687496, 0, 0.2784314, 1, 1,
0.2644298, -0.7316984, 4.259539, 0, 0.2745098, 1, 1,
0.2701975, 1.677809, 0.4035685, 0, 0.2666667, 1, 1,
0.2703259, 0.1539593, 2.117435, 0, 0.2627451, 1, 1,
0.2742424, 0.4058235, 1.088372, 0, 0.254902, 1, 1,
0.2779456, -0.2014795, 3.019651, 0, 0.2509804, 1, 1,
0.2814381, -1.618537, 3.298243, 0, 0.2431373, 1, 1,
0.2817805, -1.353588, 1.872836, 0, 0.2392157, 1, 1,
0.2824661, 1.130741, -0.6409522, 0, 0.2313726, 1, 1,
0.2842258, -0.7419873, 1.46765, 0, 0.227451, 1, 1,
0.2855726, 0.05306616, 0.06644287, 0, 0.2196078, 1, 1,
0.2876224, 1.518976, 0.4987143, 0, 0.2156863, 1, 1,
0.2918855, 0.5044904, 1.556282, 0, 0.2078431, 1, 1,
0.2938744, -1.000911, 3.114279, 0, 0.2039216, 1, 1,
0.2941649, 1.244275, 0.2873219, 0, 0.1960784, 1, 1,
0.2948607, -0.895735, 3.070387, 0, 0.1882353, 1, 1,
0.2961711, 1.805794, -0.3092748, 0, 0.1843137, 1, 1,
0.2971163, 0.9764608, -0.3611107, 0, 0.1764706, 1, 1,
0.2974526, -0.6217261, 2.005322, 0, 0.172549, 1, 1,
0.3040375, 0.4331988, -1.39961, 0, 0.1647059, 1, 1,
0.3151459, 0.171944, 0.9649438, 0, 0.1607843, 1, 1,
0.3212566, -0.4729968, 2.433298, 0, 0.1529412, 1, 1,
0.3238857, -1.193703, 1.793823, 0, 0.1490196, 1, 1,
0.3247402, -0.9988065, 4.022256, 0, 0.1411765, 1, 1,
0.3272078, 0.3596768, -0.500401, 0, 0.1372549, 1, 1,
0.3275953, -1.226464, 3.990139, 0, 0.1294118, 1, 1,
0.3282668, 1.019579, -0.5173712, 0, 0.1254902, 1, 1,
0.3292561, -1.218577, 2.324253, 0, 0.1176471, 1, 1,
0.3364228, -0.8069617, 1.946137, 0, 0.1137255, 1, 1,
0.3378649, 0.4161161, 2.679753, 0, 0.1058824, 1, 1,
0.3404417, -0.6285401, 3.793002, 0, 0.09803922, 1, 1,
0.3408104, -0.3516586, 2.757721, 0, 0.09411765, 1, 1,
0.3463056, -0.03843426, 3.062054, 0, 0.08627451, 1, 1,
0.346788, -0.7894015, 3.611998, 0, 0.08235294, 1, 1,
0.3473084, 0.5415633, 0.7181622, 0, 0.07450981, 1, 1,
0.3481568, -0.5227011, 1.09175, 0, 0.07058824, 1, 1,
0.355084, -1.083215, 3.792943, 0, 0.0627451, 1, 1,
0.358346, 0.3238626, 0.3932306, 0, 0.05882353, 1, 1,
0.358536, 1.469195, 1.388047, 0, 0.05098039, 1, 1,
0.3588951, 1.510644, 0.7076463, 0, 0.04705882, 1, 1,
0.361838, 0.8567316, -0.4427181, 0, 0.03921569, 1, 1,
0.3657808, 0.3191754, 1.088949, 0, 0.03529412, 1, 1,
0.3668318, 1.38924, 0.1878748, 0, 0.02745098, 1, 1,
0.3688353, -0.187878, 3.625377, 0, 0.02352941, 1, 1,
0.3707584, -1.079073, 3.106319, 0, 0.01568628, 1, 1,
0.3737231, -0.3643361, 2.697582, 0, 0.01176471, 1, 1,
0.3786363, 0.424939, 0.3358891, 0, 0.003921569, 1, 1,
0.3794202, -0.3715236, 2.989899, 0.003921569, 0, 1, 1,
0.3798113, 0.1663064, -0.6709631, 0.007843138, 0, 1, 1,
0.3875375, -1.78681, 2.771339, 0.01568628, 0, 1, 1,
0.391737, -0.01322674, 1.066399, 0.01960784, 0, 1, 1,
0.395565, -2.14345, 4.286969, 0.02745098, 0, 1, 1,
0.3967613, -1.585732, 2.126893, 0.03137255, 0, 1, 1,
0.4178184, 0.3707715, -0.645864, 0.03921569, 0, 1, 1,
0.4186523, 0.6809118, -0.1167932, 0.04313726, 0, 1, 1,
0.4316301, -0.1154571, 0.5818669, 0.05098039, 0, 1, 1,
0.4338981, 0.5442474, 0.8080174, 0.05490196, 0, 1, 1,
0.4348346, 1.093182, -1.339201, 0.0627451, 0, 1, 1,
0.4379573, 1.100019, 0.1509916, 0.06666667, 0, 1, 1,
0.4411014, 0.9379914, 0.09220754, 0.07450981, 0, 1, 1,
0.4432498, -2.540279, 3.677569, 0.07843138, 0, 1, 1,
0.4438821, 1.538646, 0.3646768, 0.08627451, 0, 1, 1,
0.4448759, -1.39445, 1.516892, 0.09019608, 0, 1, 1,
0.445477, -0.4476701, 2.732122, 0.09803922, 0, 1, 1,
0.4456986, 0.7385815, 2.879618, 0.1058824, 0, 1, 1,
0.4476667, 1.232509, 0.9964465, 0.1098039, 0, 1, 1,
0.4483183, -0.1888546, 2.752458, 0.1176471, 0, 1, 1,
0.4555765, 1.347166, 1.004408, 0.1215686, 0, 1, 1,
0.4566564, -0.410439, 3.493595, 0.1294118, 0, 1, 1,
0.4610775, -0.07229115, 2.595985, 0.1333333, 0, 1, 1,
0.4625151, 0.3614953, 1.32382, 0.1411765, 0, 1, 1,
0.4649169, 0.5210053, -0.699942, 0.145098, 0, 1, 1,
0.4781162, 0.5708718, 0.7259096, 0.1529412, 0, 1, 1,
0.4782383, 0.5925316, 0.9560669, 0.1568628, 0, 1, 1,
0.4782697, -1.603025, 4.734471, 0.1647059, 0, 1, 1,
0.4789419, -0.1806189, 2.268526, 0.1686275, 0, 1, 1,
0.4807473, -0.337081, 3.713771, 0.1764706, 0, 1, 1,
0.4818786, -2.00911, 2.27437, 0.1803922, 0, 1, 1,
0.4825424, -0.9066228, 3.620004, 0.1882353, 0, 1, 1,
0.4972623, -0.2653301, -1.187345, 0.1921569, 0, 1, 1,
0.4993302, 0.2831261, 1.433165, 0.2, 0, 1, 1,
0.5001333, 0.5036217, 0.5630457, 0.2078431, 0, 1, 1,
0.5096522, -0.6453915, 2.057314, 0.2117647, 0, 1, 1,
0.5114609, 0.6555182, 0.8719806, 0.2196078, 0, 1, 1,
0.519935, 0.508271, -1.046502, 0.2235294, 0, 1, 1,
0.5203163, -0.4305144, 2.719076, 0.2313726, 0, 1, 1,
0.5258132, -2.149917, 4.319613, 0.2352941, 0, 1, 1,
0.5369262, -0.6544843, 3.247501, 0.2431373, 0, 1, 1,
0.5385522, -1.427548, 1.810275, 0.2470588, 0, 1, 1,
0.5393916, -0.8002144, 1.892926, 0.254902, 0, 1, 1,
0.5397282, 0.5176948, 1.624107, 0.2588235, 0, 1, 1,
0.5529506, -2.48668, 2.378242, 0.2666667, 0, 1, 1,
0.5554572, -0.001352612, 2.121597, 0.2705882, 0, 1, 1,
0.5563678, 0.8570509, 1.743703, 0.2784314, 0, 1, 1,
0.5587627, -0.2569563, 4.603311, 0.282353, 0, 1, 1,
0.5613346, 0.3414506, 0.838416, 0.2901961, 0, 1, 1,
0.5613611, 0.1038, 2.870555, 0.2941177, 0, 1, 1,
0.5614768, 1.819833, -0.4004011, 0.3019608, 0, 1, 1,
0.5620341, 0.7908031, 0.4052421, 0.3098039, 0, 1, 1,
0.5631897, 0.3588227, 0.9821014, 0.3137255, 0, 1, 1,
0.5641404, -0.818443, 2.719656, 0.3215686, 0, 1, 1,
0.5746695, -1.268961, 1.302017, 0.3254902, 0, 1, 1,
0.5784493, -0.6516798, 0.9589639, 0.3333333, 0, 1, 1,
0.5880722, 1.800582, -0.6453599, 0.3372549, 0, 1, 1,
0.5903453, -0.0972721, 1.851289, 0.345098, 0, 1, 1,
0.5928246, 0.2872789, -0.1792793, 0.3490196, 0, 1, 1,
0.5930705, 0.6103733, 0.5039873, 0.3568628, 0, 1, 1,
0.5958148, 0.5339676, 1.129927, 0.3607843, 0, 1, 1,
0.597382, 0.3909325, 1.385266, 0.3686275, 0, 1, 1,
0.5976852, -0.02944287, 2.142844, 0.372549, 0, 1, 1,
0.6018, 1.237554, -1.625806, 0.3803922, 0, 1, 1,
0.6021873, -0.6486493, 0.7306846, 0.3843137, 0, 1, 1,
0.6035624, 0.4312259, 0.1695713, 0.3921569, 0, 1, 1,
0.6037688, 1.727184, 1.127765, 0.3960784, 0, 1, 1,
0.6174709, 1.396693, 0.9885492, 0.4039216, 0, 1, 1,
0.6197729, 0.8379012, -0.2209709, 0.4117647, 0, 1, 1,
0.6275582, -1.897128, 3.603551, 0.4156863, 0, 1, 1,
0.6293329, -0.9839365, 3.476264, 0.4235294, 0, 1, 1,
0.6305709, 1.315544, 0.8996776, 0.427451, 0, 1, 1,
0.6408082, -0.3085597, 3.9147, 0.4352941, 0, 1, 1,
0.6419517, -1.48779, 2.783748, 0.4392157, 0, 1, 1,
0.6440716, 0.2221277, -0.1247491, 0.4470588, 0, 1, 1,
0.6478611, -1.007294, 1.650004, 0.4509804, 0, 1, 1,
0.6497653, 0.3270767, 0.3057867, 0.4588235, 0, 1, 1,
0.649888, 1.270179, -1.45849, 0.4627451, 0, 1, 1,
0.6541051, -1.601975, 1.911609, 0.4705882, 0, 1, 1,
0.6548737, 0.4688106, 0.9585871, 0.4745098, 0, 1, 1,
0.6552092, 2.844114, 1.510275, 0.4823529, 0, 1, 1,
0.6564307, -0.7481763, 2.330892, 0.4862745, 0, 1, 1,
0.656659, -1.83304, 2.612213, 0.4941176, 0, 1, 1,
0.6592488, -1.435901, 4.067949, 0.5019608, 0, 1, 1,
0.6598621, 1.631629, 1.140543, 0.5058824, 0, 1, 1,
0.6625376, -1.275005, 2.896845, 0.5137255, 0, 1, 1,
0.6702628, -0.4893288, 1.02223, 0.5176471, 0, 1, 1,
0.6708121, -1.052251, 2.140787, 0.5254902, 0, 1, 1,
0.6797137, -0.5766063, 2.917033, 0.5294118, 0, 1, 1,
0.6825289, -0.5782014, 3.453888, 0.5372549, 0, 1, 1,
0.6844496, -2.053326, 2.250841, 0.5411765, 0, 1, 1,
0.6858014, -1.010548, 0.9988537, 0.5490196, 0, 1, 1,
0.6899695, 0.287914, 1.178723, 0.5529412, 0, 1, 1,
0.6910718, -0.4193985, 1.816807, 0.5607843, 0, 1, 1,
0.6921782, 1.349538, -0.401358, 0.5647059, 0, 1, 1,
0.6932288, 0.9864895, -0.1619671, 0.572549, 0, 1, 1,
0.7021381, -0.9898555, 1.33981, 0.5764706, 0, 1, 1,
0.7056208, -0.2565764, 1.649658, 0.5843138, 0, 1, 1,
0.7075421, 1.593361, -0.05817487, 0.5882353, 0, 1, 1,
0.7186931, -1.059061, 3.203429, 0.5960785, 0, 1, 1,
0.7296024, 0.1108846, 0.7125877, 0.6039216, 0, 1, 1,
0.7320975, 1.570977, 0.3930691, 0.6078432, 0, 1, 1,
0.7342111, -1.114391, 4.093904, 0.6156863, 0, 1, 1,
0.73717, -0.2135907, 2.603271, 0.6196079, 0, 1, 1,
0.738117, -0.5048343, 2.67697, 0.627451, 0, 1, 1,
0.7393806, -0.1389588, 2.129299, 0.6313726, 0, 1, 1,
0.7416171, -0.1273515, 0.7181791, 0.6392157, 0, 1, 1,
0.7474382, -1.023545, 0.5097829, 0.6431373, 0, 1, 1,
0.751334, 0.6738425, -0.7994303, 0.6509804, 0, 1, 1,
0.7518868, 1.049337, 0.09432624, 0.654902, 0, 1, 1,
0.7564239, 0.3187689, 1.272041, 0.6627451, 0, 1, 1,
0.760818, -0.2929752, 1.334813, 0.6666667, 0, 1, 1,
0.7665359, -0.009969776, -0.669908, 0.6745098, 0, 1, 1,
0.7674943, 0.3448372, -1.067081, 0.6784314, 0, 1, 1,
0.7687235, 0.492004, 2.023349, 0.6862745, 0, 1, 1,
0.7719361, 0.4015588, 0.8156927, 0.6901961, 0, 1, 1,
0.7723538, 1.680317, 0.8438718, 0.6980392, 0, 1, 1,
0.7751783, -0.3993316, 1.181196, 0.7058824, 0, 1, 1,
0.7816687, -1.300185, 2.123129, 0.7098039, 0, 1, 1,
0.7838794, 0.2445026, 0.766024, 0.7176471, 0, 1, 1,
0.7841346, 1.950475, 1.284019, 0.7215686, 0, 1, 1,
0.7848068, -0.543045, 2.802214, 0.7294118, 0, 1, 1,
0.7948181, -1.540841, 1.219745, 0.7333333, 0, 1, 1,
0.8013278, -0.2725835, 2.325752, 0.7411765, 0, 1, 1,
0.8015788, -0.6685603, 2.966884, 0.7450981, 0, 1, 1,
0.8063899, 0.9044223, -0.6253727, 0.7529412, 0, 1, 1,
0.8126488, 1.544836, 0.1963288, 0.7568628, 0, 1, 1,
0.8144819, -1.024754, 2.71205, 0.7647059, 0, 1, 1,
0.815378, -0.08714317, 4.450195, 0.7686275, 0, 1, 1,
0.8189359, 0.4143825, -0.3500637, 0.7764706, 0, 1, 1,
0.8215523, 0.4339558, 0.4906769, 0.7803922, 0, 1, 1,
0.8292061, -0.6706878, 2.132969, 0.7882353, 0, 1, 1,
0.835689, -0.2902873, 1.853195, 0.7921569, 0, 1, 1,
0.8379833, -0.5980827, 1.510587, 0.8, 0, 1, 1,
0.8392708, -0.9063206, 1.772569, 0.8078431, 0, 1, 1,
0.8429339, 1.433968, 0.9299656, 0.8117647, 0, 1, 1,
0.8461927, -1.044638, 3.824881, 0.8196079, 0, 1, 1,
0.8523708, 0.9208572, -0.1526177, 0.8235294, 0, 1, 1,
0.8544366, 0.8162503, 0.5722755, 0.8313726, 0, 1, 1,
0.860305, 0.2801559, 1.077607, 0.8352941, 0, 1, 1,
0.8664057, -0.04124634, 0.6383955, 0.8431373, 0, 1, 1,
0.8673449, -0.6509786, 2.768507, 0.8470588, 0, 1, 1,
0.8678448, -0.3290271, 4.181094, 0.854902, 0, 1, 1,
0.8812252, 0.7371952, 0.3988003, 0.8588235, 0, 1, 1,
0.8883429, 1.000729, 0.4635298, 0.8666667, 0, 1, 1,
0.8959065, -0.08230578, 2.532209, 0.8705882, 0, 1, 1,
0.896166, 0.4711393, 0.857544, 0.8784314, 0, 1, 1,
0.8972337, -1.334087, 2.50424, 0.8823529, 0, 1, 1,
0.9007923, 1.946939, 0.598815, 0.8901961, 0, 1, 1,
0.9013079, -0.4846473, 2.038673, 0.8941177, 0, 1, 1,
0.9023026, 0.9100641, 1.826885, 0.9019608, 0, 1, 1,
0.9047062, 1.288349, 0.04185504, 0.9098039, 0, 1, 1,
0.9173666, -0.1999399, 0.7858583, 0.9137255, 0, 1, 1,
0.9250249, -1.760966, 2.395671, 0.9215686, 0, 1, 1,
0.9287337, 0.8373885, 0.8038912, 0.9254902, 0, 1, 1,
0.930492, 1.675136, -0.5221236, 0.9333333, 0, 1, 1,
0.930834, -1.501921, 2.737797, 0.9372549, 0, 1, 1,
0.9385186, -0.2767179, 2.786447, 0.945098, 0, 1, 1,
0.9419917, -1.075393, 2.783006, 0.9490196, 0, 1, 1,
0.9502226, -2.022469, 0.5450568, 0.9568627, 0, 1, 1,
0.9590531, -0.6114231, 2.223462, 0.9607843, 0, 1, 1,
0.9603254, 0.6676037, 2.719218, 0.9686275, 0, 1, 1,
0.9800823, -1.177144, 2.110667, 0.972549, 0, 1, 1,
0.990003, 2.022918, -0.741875, 0.9803922, 0, 1, 1,
0.9960673, -0.6503701, 3.431786, 0.9843137, 0, 1, 1,
0.9964366, 0.01625575, 1.961406, 0.9921569, 0, 1, 1,
1.000041, 0.2729627, 1.30048, 0.9960784, 0, 1, 1,
1.001337, -0.4790814, 3.7244, 1, 0, 0.9960784, 1,
1.002601, -0.855629, 2.029205, 1, 0, 0.9882353, 1,
1.009206, 0.7120294, 1.520856, 1, 0, 0.9843137, 1,
1.009532, -0.126954, 0.1638333, 1, 0, 0.9764706, 1,
1.011279, -0.5871363, 3.167015, 1, 0, 0.972549, 1,
1.014096, -0.6168727, 1.070949, 1, 0, 0.9647059, 1,
1.017691, 0.02271863, 2.298018, 1, 0, 0.9607843, 1,
1.018709, 0.1411117, 1.659612, 1, 0, 0.9529412, 1,
1.022719, -0.6051564, -1.148701, 1, 0, 0.9490196, 1,
1.025553, 0.03704637, 1.425224, 1, 0, 0.9411765, 1,
1.028768, 0.7757788, 0.04699828, 1, 0, 0.9372549, 1,
1.032557, 2.608602, 0.4363629, 1, 0, 0.9294118, 1,
1.036284, 0.5647452, 0.06734435, 1, 0, 0.9254902, 1,
1.045041, -0.9524852, 2.815276, 1, 0, 0.9176471, 1,
1.045277, 1.253868, 0.7541968, 1, 0, 0.9137255, 1,
1.046647, -0.3993096, 3.376566, 1, 0, 0.9058824, 1,
1.05031, 0.9651952, 1.929166, 1, 0, 0.9019608, 1,
1.052245, 1.095569, 1.373352, 1, 0, 0.8941177, 1,
1.073866, -0.06416223, 2.244213, 1, 0, 0.8862745, 1,
1.081603, 0.9172552, 1.889687, 1, 0, 0.8823529, 1,
1.082587, 0.1298089, 0.7058781, 1, 0, 0.8745098, 1,
1.084504, -1.963757, 2.5091, 1, 0, 0.8705882, 1,
1.087727, -0.3738363, 0.5843221, 1, 0, 0.8627451, 1,
1.09029, -1.981157, 4.038245, 1, 0, 0.8588235, 1,
1.090552, -0.6520339, 2.094967, 1, 0, 0.8509804, 1,
1.090992, 1.642003, -0.5825502, 1, 0, 0.8470588, 1,
1.100332, 0.1766072, 1.485738, 1, 0, 0.8392157, 1,
1.10868, 0.05908282, 1.921048, 1, 0, 0.8352941, 1,
1.109986, 0.5285785, -0.6132356, 1, 0, 0.827451, 1,
1.12021, -1.232286, 1.646011, 1, 0, 0.8235294, 1,
1.122945, -0.1549563, 2.013762, 1, 0, 0.8156863, 1,
1.1278, -0.39434, 1.360701, 1, 0, 0.8117647, 1,
1.134564, 0.6240395, 1.053329, 1, 0, 0.8039216, 1,
1.13564, -0.9453377, 0.4718791, 1, 0, 0.7960784, 1,
1.135652, 1.092196, 2.22089, 1, 0, 0.7921569, 1,
1.141135, 0.7011883, 0.9651232, 1, 0, 0.7843137, 1,
1.144532, -1.256797, 1.105035, 1, 0, 0.7803922, 1,
1.148411, 0.9695333, 1.152651, 1, 0, 0.772549, 1,
1.150112, -0.08925193, 1.613708, 1, 0, 0.7686275, 1,
1.156267, 0.2759891, 2.387258, 1, 0, 0.7607843, 1,
1.156756, -1.458226, 3.534973, 1, 0, 0.7568628, 1,
1.169935, -1.10396, 2.289195, 1, 0, 0.7490196, 1,
1.177611, 0.002096939, 1.214778, 1, 0, 0.7450981, 1,
1.180719, 0.134288, 2.349462, 1, 0, 0.7372549, 1,
1.181903, -0.09077523, 0.1983238, 1, 0, 0.7333333, 1,
1.182292, -0.7380424, 2.796632, 1, 0, 0.7254902, 1,
1.199458, 1.426065, 2.32848, 1, 0, 0.7215686, 1,
1.200195, 0.7679669, 1.504754, 1, 0, 0.7137255, 1,
1.202552, -0.4907917, 3.759969, 1, 0, 0.7098039, 1,
1.203317, -0.6046858, 2.411633, 1, 0, 0.7019608, 1,
1.205121, -0.03880519, 2.032221, 1, 0, 0.6941177, 1,
1.229789, -0.7644117, 1.011134, 1, 0, 0.6901961, 1,
1.231923, 0.5426274, 1.644973, 1, 0, 0.682353, 1,
1.234152, 0.377269, 3.556464, 1, 0, 0.6784314, 1,
1.235203, -0.707936, 1.747002, 1, 0, 0.6705883, 1,
1.239849, 0.5209039, 2.253466, 1, 0, 0.6666667, 1,
1.251666, -0.4705256, 0.4285396, 1, 0, 0.6588235, 1,
1.262102, 0.4411729, 2.212186, 1, 0, 0.654902, 1,
1.268344, -1.562144, 3.429486, 1, 0, 0.6470588, 1,
1.273896, 0.8828166, 2.079261, 1, 0, 0.6431373, 1,
1.277713, 1.785185, 1.427943, 1, 0, 0.6352941, 1,
1.286629, -0.07636753, 0.4566078, 1, 0, 0.6313726, 1,
1.293304, -0.1820239, 3.019812, 1, 0, 0.6235294, 1,
1.296963, -1.192408, 1.664506, 1, 0, 0.6196079, 1,
1.307244, -1.262316, 2.72437, 1, 0, 0.6117647, 1,
1.307665, -0.5836349, 2.567875, 1, 0, 0.6078432, 1,
1.311932, -1.201739, 2.725745, 1, 0, 0.6, 1,
1.314314, 1.0789, 1.860102, 1, 0, 0.5921569, 1,
1.32391, -1.929725, 1.91977, 1, 0, 0.5882353, 1,
1.338876, 0.7463702, 2.66921, 1, 0, 0.5803922, 1,
1.338937, -0.1676952, 0.9874778, 1, 0, 0.5764706, 1,
1.349727, -1.136729, 2.781321, 1, 0, 0.5686275, 1,
1.35199, 1.932137, 2.711043, 1, 0, 0.5647059, 1,
1.352254, 1.711853, 0.05937846, 1, 0, 0.5568628, 1,
1.355762, -1.121073, 1.862618, 1, 0, 0.5529412, 1,
1.369233, -0.3366273, 1.936337, 1, 0, 0.5450981, 1,
1.373804, -1.734609, 1.97604, 1, 0, 0.5411765, 1,
1.373872, -0.548362, 2.158537, 1, 0, 0.5333334, 1,
1.376256, 0.9799366, -0.7473537, 1, 0, 0.5294118, 1,
1.382459, 1.862886, 0.2920877, 1, 0, 0.5215687, 1,
1.391682, -0.359464, 1.098986, 1, 0, 0.5176471, 1,
1.395369, 0.321453, 1.125739, 1, 0, 0.509804, 1,
1.400371, 0.6285395, 2.542576, 1, 0, 0.5058824, 1,
1.402103, -1.212936, 1.063869, 1, 0, 0.4980392, 1,
1.411271, -0.6770098, 2.024706, 1, 0, 0.4901961, 1,
1.420796, -1.664794, 2.185446, 1, 0, 0.4862745, 1,
1.440893, 2.361727, 1.781576, 1, 0, 0.4784314, 1,
1.446925, -0.5888258, 1.601503, 1, 0, 0.4745098, 1,
1.448012, 0.02102312, 2.739999, 1, 0, 0.4666667, 1,
1.44807, -2.031062, 2.275225, 1, 0, 0.4627451, 1,
1.458092, -0.3087475, 0.08730639, 1, 0, 0.454902, 1,
1.460614, -1.424337, 1.118347, 1, 0, 0.4509804, 1,
1.4638, -2.073417, 3.322909, 1, 0, 0.4431373, 1,
1.4651, -0.1625576, 2.316085, 1, 0, 0.4392157, 1,
1.466807, -1.120873, 2.875799, 1, 0, 0.4313726, 1,
1.466828, -1.28763, 2.232442, 1, 0, 0.427451, 1,
1.468242, 0.1296684, 1.349202, 1, 0, 0.4196078, 1,
1.469749, -1.677273, 1.639064, 1, 0, 0.4156863, 1,
1.470414, -1.054227, 3.62062, 1, 0, 0.4078431, 1,
1.484165, -1.594953, 1.504484, 1, 0, 0.4039216, 1,
1.492147, -0.08772102, 3.744007, 1, 0, 0.3960784, 1,
1.507496, 0.5628012, 0.979112, 1, 0, 0.3882353, 1,
1.509922, -1.054603, -0.02212952, 1, 0, 0.3843137, 1,
1.51084, -0.04518246, 0.5738031, 1, 0, 0.3764706, 1,
1.519718, 1.729068, 0.7802373, 1, 0, 0.372549, 1,
1.525744, -0.3396747, 3.685516, 1, 0, 0.3647059, 1,
1.53481, 0.7123395, 1.579919, 1, 0, 0.3607843, 1,
1.53966, 1.483416, 1.75824, 1, 0, 0.3529412, 1,
1.558222, 0.02132387, 2.989171, 1, 0, 0.3490196, 1,
1.562943, 0.1013318, 1.348581, 1, 0, 0.3411765, 1,
1.564383, -0.2294044, 2.323738, 1, 0, 0.3372549, 1,
1.569479, 1.340148, 0.4705038, 1, 0, 0.3294118, 1,
1.57892, -0.9824051, 0.5495665, 1, 0, 0.3254902, 1,
1.585028, 0.7830222, 0.8385355, 1, 0, 0.3176471, 1,
1.588336, 0.7134831, 0.6325551, 1, 0, 0.3137255, 1,
1.606609, 1.125996, 2.625093, 1, 0, 0.3058824, 1,
1.607, 0.3245336, 2.062112, 1, 0, 0.2980392, 1,
1.620163, -0.3184116, 1.466672, 1, 0, 0.2941177, 1,
1.625815, -0.9999556, 2.343024, 1, 0, 0.2862745, 1,
1.628399, -1.09235, 0.929085, 1, 0, 0.282353, 1,
1.631067, 0.1034481, 1.93581, 1, 0, 0.2745098, 1,
1.634988, 1.100115, 3.57572, 1, 0, 0.2705882, 1,
1.638507, -0.2192491, 4.677126, 1, 0, 0.2627451, 1,
1.645698, 0.4745766, 1.390594, 1, 0, 0.2588235, 1,
1.657685, 0.05590568, 1.636406, 1, 0, 0.2509804, 1,
1.658718, -0.3276572, 1.988876, 1, 0, 0.2470588, 1,
1.659267, -1.980141, 1.194267, 1, 0, 0.2392157, 1,
1.675946, 0.9888201, 2.128417, 1, 0, 0.2352941, 1,
1.704132, 0.5622433, 0.8541437, 1, 0, 0.227451, 1,
1.75431, -1.185243, 2.897362, 1, 0, 0.2235294, 1,
1.765284, -0.762214, 0.7589304, 1, 0, 0.2156863, 1,
1.785068, 0.07171428, 3.222261, 1, 0, 0.2117647, 1,
1.790688, 1.041049, 0.8743828, 1, 0, 0.2039216, 1,
1.793059, 1.539474, 0.745855, 1, 0, 0.1960784, 1,
1.799811, -0.9296855, 2.65123, 1, 0, 0.1921569, 1,
1.808709, -0.970374, 1.457783, 1, 0, 0.1843137, 1,
1.836967, -0.2657564, 0.2894797, 1, 0, 0.1803922, 1,
1.842363, -1.678665, 4.735514, 1, 0, 0.172549, 1,
1.851998, 0.3418585, 2.018086, 1, 0, 0.1686275, 1,
1.860606, 0.2461492, 1.44799, 1, 0, 0.1607843, 1,
1.863076, -0.8411976, 2.078657, 1, 0, 0.1568628, 1,
1.872708, -1.073577, 1.874208, 1, 0, 0.1490196, 1,
1.889875, -0.7551119, 1.013035, 1, 0, 0.145098, 1,
1.894834, 0.8074948, 1.284003, 1, 0, 0.1372549, 1,
1.900133, 1.578529, 0.2407908, 1, 0, 0.1333333, 1,
1.92695, -1.618879, 3.213139, 1, 0, 0.1254902, 1,
1.931536, -0.4744275, 2.364429, 1, 0, 0.1215686, 1,
1.944925, -1.535365, 1.908495, 1, 0, 0.1137255, 1,
1.945662, 0.9704547, 0.5368026, 1, 0, 0.1098039, 1,
1.988469, 0.1415206, 2.574178, 1, 0, 0.1019608, 1,
1.989508, -0.6232549, 1.862701, 1, 0, 0.09411765, 1,
2.008749, 0.08251794, 1.126633, 1, 0, 0.09019608, 1,
2.075957, 0.1906595, 0.7293607, 1, 0, 0.08235294, 1,
2.137191, -0.6678103, 2.267596, 1, 0, 0.07843138, 1,
2.163932, -0.620048, 1.324505, 1, 0, 0.07058824, 1,
2.269039, 0.424365, 1.887336, 1, 0, 0.06666667, 1,
2.329813, 0.8876628, -0.9264163, 1, 0, 0.05882353, 1,
2.366424, 0.6974448, 0.4508263, 1, 0, 0.05490196, 1,
2.366827, -1.443396, 2.913627, 1, 0, 0.04705882, 1,
2.381344, -0.4301859, 2.518116, 1, 0, 0.04313726, 1,
2.416764, 0.1174773, 1.066775, 1, 0, 0.03529412, 1,
2.633861, 1.409078, 1.513374, 1, 0, 0.03137255, 1,
2.640249, 0.1711784, 2.045163, 1, 0, 0.02352941, 1,
2.713054, -0.7765043, 2.888466, 1, 0, 0.01960784, 1,
2.790916, 1.023354, 2.321408, 1, 0, 0.01176471, 1,
3.538081, 1.851851, 2.149487, 1, 0, 0.007843138, 1
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
-0.09076166, -3.636178, -6.58999, 0, -0.5, 0.5, 0.5,
-0.09076166, -3.636178, -6.58999, 1, -0.5, 0.5, 0.5,
-0.09076166, -3.636178, -6.58999, 1, 1.5, 0.5, 0.5,
-0.09076166, -3.636178, -6.58999, 0, 1.5, 0.5, 0.5
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
-4.949782, 0.07357419, -6.58999, 0, -0.5, 0.5, 0.5,
-4.949782, 0.07357419, -6.58999, 1, -0.5, 0.5, 0.5,
-4.949782, 0.07357419, -6.58999, 1, 1.5, 0.5, 0.5,
-4.949782, 0.07357419, -6.58999, 0, 1.5, 0.5, 0.5
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
-4.949782, -3.636178, 0.2179229, 0, -0.5, 0.5, 0.5,
-4.949782, -3.636178, 0.2179229, 1, -0.5, 0.5, 0.5,
-4.949782, -3.636178, 0.2179229, 1, 1.5, 0.5, 0.5,
-4.949782, -3.636178, 0.2179229, 0, 1.5, 0.5, 0.5
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
-2, -2.780082, -5.018933,
2, -2.780082, -5.018933,
-2, -2.780082, -5.018933,
-2, -2.922764, -5.280776,
0, -2.780082, -5.018933,
0, -2.922764, -5.280776,
2, -2.780082, -5.018933,
2, -2.922764, -5.280776
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
-2, -3.20813, -5.804462, 0, -0.5, 0.5, 0.5,
-2, -3.20813, -5.804462, 1, -0.5, 0.5, 0.5,
-2, -3.20813, -5.804462, 1, 1.5, 0.5, 0.5,
-2, -3.20813, -5.804462, 0, 1.5, 0.5, 0.5,
0, -3.20813, -5.804462, 0, -0.5, 0.5, 0.5,
0, -3.20813, -5.804462, 1, -0.5, 0.5, 0.5,
0, -3.20813, -5.804462, 1, 1.5, 0.5, 0.5,
0, -3.20813, -5.804462, 0, 1.5, 0.5, 0.5,
2, -3.20813, -5.804462, 0, -0.5, 0.5, 0.5,
2, -3.20813, -5.804462, 1, -0.5, 0.5, 0.5,
2, -3.20813, -5.804462, 1, 1.5, 0.5, 0.5,
2, -3.20813, -5.804462, 0, 1.5, 0.5, 0.5
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
-3.82847, -2, -5.018933,
-3.82847, 2, -5.018933,
-3.82847, -2, -5.018933,
-4.015356, -2, -5.280776,
-3.82847, -1, -5.018933,
-4.015356, -1, -5.280776,
-3.82847, 0, -5.018933,
-4.015356, 0, -5.280776,
-3.82847, 1, -5.018933,
-4.015356, 1, -5.280776,
-3.82847, 2, -5.018933,
-4.015356, 2, -5.280776
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
-4.389126, -2, -5.804462, 0, -0.5, 0.5, 0.5,
-4.389126, -2, -5.804462, 1, -0.5, 0.5, 0.5,
-4.389126, -2, -5.804462, 1, 1.5, 0.5, 0.5,
-4.389126, -2, -5.804462, 0, 1.5, 0.5, 0.5,
-4.389126, -1, -5.804462, 0, -0.5, 0.5, 0.5,
-4.389126, -1, -5.804462, 1, -0.5, 0.5, 0.5,
-4.389126, -1, -5.804462, 1, 1.5, 0.5, 0.5,
-4.389126, -1, -5.804462, 0, 1.5, 0.5, 0.5,
-4.389126, 0, -5.804462, 0, -0.5, 0.5, 0.5,
-4.389126, 0, -5.804462, 1, -0.5, 0.5, 0.5,
-4.389126, 0, -5.804462, 1, 1.5, 0.5, 0.5,
-4.389126, 0, -5.804462, 0, 1.5, 0.5, 0.5,
-4.389126, 1, -5.804462, 0, -0.5, 0.5, 0.5,
-4.389126, 1, -5.804462, 1, -0.5, 0.5, 0.5,
-4.389126, 1, -5.804462, 1, 1.5, 0.5, 0.5,
-4.389126, 1, -5.804462, 0, 1.5, 0.5, 0.5,
-4.389126, 2, -5.804462, 0, -0.5, 0.5, 0.5,
-4.389126, 2, -5.804462, 1, -0.5, 0.5, 0.5,
-4.389126, 2, -5.804462, 1, 1.5, 0.5, 0.5,
-4.389126, 2, -5.804462, 0, 1.5, 0.5, 0.5
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
-3.82847, -2.780082, -4,
-3.82847, -2.780082, 4,
-3.82847, -2.780082, -4,
-4.015356, -2.922764, -4,
-3.82847, -2.780082, -2,
-4.015356, -2.922764, -2,
-3.82847, -2.780082, 0,
-4.015356, -2.922764, 0,
-3.82847, -2.780082, 2,
-4.015356, -2.922764, 2,
-3.82847, -2.780082, 4,
-4.015356, -2.922764, 4
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
-4.389126, -3.20813, -4, 0, -0.5, 0.5, 0.5,
-4.389126, -3.20813, -4, 1, -0.5, 0.5, 0.5,
-4.389126, -3.20813, -4, 1, 1.5, 0.5, 0.5,
-4.389126, -3.20813, -4, 0, 1.5, 0.5, 0.5,
-4.389126, -3.20813, -2, 0, -0.5, 0.5, 0.5,
-4.389126, -3.20813, -2, 1, -0.5, 0.5, 0.5,
-4.389126, -3.20813, -2, 1, 1.5, 0.5, 0.5,
-4.389126, -3.20813, -2, 0, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 0, 0, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 0, 1, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 0, 1, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 0, 0, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 2, 0, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 2, 1, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 2, 1, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 2, 0, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 4, 0, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 4, 1, -0.5, 0.5, 0.5,
-4.389126, -3.20813, 4, 1, 1.5, 0.5, 0.5,
-4.389126, -3.20813, 4, 0, 1.5, 0.5, 0.5
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
-3.82847, -2.780082, -5.018933,
-3.82847, 2.92723, -5.018933,
-3.82847, -2.780082, 5.454779,
-3.82847, 2.92723, 5.454779,
-3.82847, -2.780082, -5.018933,
-3.82847, -2.780082, 5.454779,
-3.82847, 2.92723, -5.018933,
-3.82847, 2.92723, 5.454779,
-3.82847, -2.780082, -5.018933,
3.646947, -2.780082, -5.018933,
-3.82847, -2.780082, 5.454779,
3.646947, -2.780082, 5.454779,
-3.82847, 2.92723, -5.018933,
3.646947, 2.92723, -5.018933,
-3.82847, 2.92723, 5.454779,
3.646947, 2.92723, 5.454779,
3.646947, -2.780082, -5.018933,
3.646947, 2.92723, -5.018933,
3.646947, -2.780082, 5.454779,
3.646947, 2.92723, 5.454779,
3.646947, -2.780082, -5.018933,
3.646947, -2.780082, 5.454779,
3.646947, 2.92723, -5.018933,
3.646947, 2.92723, 5.454779
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
var radius = 7.516693;
var distance = 33.44262;
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
mvMatrix.translate( 0.09076166, -0.07357419, -0.2179229 );
mvMatrix.scale( 1.08719, 1.423997, 0.7759613 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.44262);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Acephat<-read.table("Acephat.xyz")
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
-3.719605, -0.009158343, -2.962142, 0, 0, 1, 1, 1,
-3.70404, 0.5753677, -2.128604, 1, 0, 0, 1, 1,
-3.196089, -0.2338098, -1.388701, 1, 0, 0, 1, 1,
-3.083702, 0.8594609, -1.836997, 1, 0, 0, 1, 1,
-3.04545, 0.05593369, -0.09982993, 1, 0, 0, 1, 1,
-3.015452, -0.6031864, -0.8283194, 1, 0, 0, 1, 1,
-2.744318, 1.21124, -1.128884, 0, 0, 0, 1, 1,
-2.576149, 1.937577, -3.274633, 0, 0, 0, 1, 1,
-2.546352, 0.8542293, -1.582947, 0, 0, 0, 1, 1,
-2.541083, 1.321408, -1.315887, 0, 0, 0, 1, 1,
-2.487933, -0.2872981, -0.365143, 0, 0, 0, 1, 1,
-2.475333, 1.677805, -2.66428, 0, 0, 0, 1, 1,
-2.444288, -0.9876749, -1.321988, 0, 0, 0, 1, 1,
-2.429815, 0.4210078, -2.017531, 1, 1, 1, 1, 1,
-2.401834, -1.529066, -2.443865, 1, 1, 1, 1, 1,
-2.341188, 0.1634822, 0.376543, 1, 1, 1, 1, 1,
-2.293193, -1.119468, 0.5347636, 1, 1, 1, 1, 1,
-2.253709, -0.07319991, -3.406269, 1, 1, 1, 1, 1,
-2.240583, 0.793736, -1.783719, 1, 1, 1, 1, 1,
-2.200969, 0.5293867, 0.607338, 1, 1, 1, 1, 1,
-2.10273, 0.7510471, 0.7557083, 1, 1, 1, 1, 1,
-2.083672, -0.296222, -4.335577, 1, 1, 1, 1, 1,
-2.074849, 1.071306, -2.123784, 1, 1, 1, 1, 1,
-2.052707, -0.3713934, -1.966901, 1, 1, 1, 1, 1,
-2.023211, 2.12869, 0.4793864, 1, 1, 1, 1, 1,
-1.981421, -1.45621, -1.352503, 1, 1, 1, 1, 1,
-1.96279, -1.695318, -3.11165, 1, 1, 1, 1, 1,
-1.939074, 1.839414, -1.94572, 1, 1, 1, 1, 1,
-1.934951, 0.08957254, -1.079431, 0, 0, 1, 1, 1,
-1.897038, -1.251682, -2.180726, 1, 0, 0, 1, 1,
-1.880767, 1.101218, 0.7623572, 1, 0, 0, 1, 1,
-1.84949, -1.92154, -1.672329, 1, 0, 0, 1, 1,
-1.842873, 0.9505929, -1.507684, 1, 0, 0, 1, 1,
-1.82922, 0.9993289, -1.975903, 1, 0, 0, 1, 1,
-1.821929, 0.05890062, -2.4188, 0, 0, 0, 1, 1,
-1.806152, -1.911988, -1.705684, 0, 0, 0, 1, 1,
-1.787942, 0.2591161, -0.7395667, 0, 0, 0, 1, 1,
-1.772954, 0.8187792, -0.7408723, 0, 0, 0, 1, 1,
-1.770078, -0.2103704, -1.016961, 0, 0, 0, 1, 1,
-1.761323, -1.023998, -0.1784379, 0, 0, 0, 1, 1,
-1.754134, 1.805151, -2.007496, 0, 0, 0, 1, 1,
-1.737048, 0.3396267, -1.229676, 1, 1, 1, 1, 1,
-1.700597, -1.489224, -2.760709, 1, 1, 1, 1, 1,
-1.700252, 0.1004371, 0.01096104, 1, 1, 1, 1, 1,
-1.690952, 0.350733, -2.568379, 1, 1, 1, 1, 1,
-1.685574, 1.946203, 0.3987238, 1, 1, 1, 1, 1,
-1.664008, 0.6243309, -0.8715057, 1, 1, 1, 1, 1,
-1.656279, -0.3496638, -0.4240614, 1, 1, 1, 1, 1,
-1.633417, -0.3610694, -1.766566, 1, 1, 1, 1, 1,
-1.598887, -0.07994436, -1.986369, 1, 1, 1, 1, 1,
-1.596143, 0.8495837, -0.7103077, 1, 1, 1, 1, 1,
-1.549191, -0.5829129, -1.746207, 1, 1, 1, 1, 1,
-1.538407, -0.6328999, -0.8761473, 1, 1, 1, 1, 1,
-1.529438, 0.7132302, -0.7462122, 1, 1, 1, 1, 1,
-1.524012, -0.07564813, -0.2201924, 1, 1, 1, 1, 1,
-1.517873, -1.363332, -0.5602411, 1, 1, 1, 1, 1,
-1.515914, 0.7974319, -0.656374, 0, 0, 1, 1, 1,
-1.511474, -1.428957, -3.164211, 1, 0, 0, 1, 1,
-1.499325, 0.9582831, -1.26398, 1, 0, 0, 1, 1,
-1.498299, 2.121268, 0.9852616, 1, 0, 0, 1, 1,
-1.487148, 0.5217325, -0.7246087, 1, 0, 0, 1, 1,
-1.483947, 1.492039, 0.6822286, 1, 0, 0, 1, 1,
-1.479218, 1.397111, 0.3618678, 0, 0, 0, 1, 1,
-1.466403, 0.1351709, -3.31349, 0, 0, 0, 1, 1,
-1.46345, 0.9718412, 0.05482957, 0, 0, 0, 1, 1,
-1.460432, -0.4877244, -2.696333, 0, 0, 0, 1, 1,
-1.444285, -0.417845, -0.9575435, 0, 0, 0, 1, 1,
-1.444225, 0.1835723, 0.01087247, 0, 0, 0, 1, 1,
-1.430526, 0.6365313, -1.553078, 0, 0, 0, 1, 1,
-1.416549, -0.3438969, -2.727215, 1, 1, 1, 1, 1,
-1.406293, -0.09823173, -2.960228, 1, 1, 1, 1, 1,
-1.404354, -1.074817, -1.920658, 1, 1, 1, 1, 1,
-1.400489, -0.9870044, -3.098745, 1, 1, 1, 1, 1,
-1.38917, 0.8427971, -1.162137, 1, 1, 1, 1, 1,
-1.38814, 0.4097371, -2.145587, 1, 1, 1, 1, 1,
-1.38691, 1.374926, -0.5210038, 1, 1, 1, 1, 1,
-1.371085, 1.350985, 1.006111, 1, 1, 1, 1, 1,
-1.370692, 0.7114847, -1.123402, 1, 1, 1, 1, 1,
-1.368233, 0.3727034, -2.417403, 1, 1, 1, 1, 1,
-1.362823, -1.312017, -4.259757, 1, 1, 1, 1, 1,
-1.36231, 0.7669495, -1.205813, 1, 1, 1, 1, 1,
-1.357745, 0.8897346, -0.09852039, 1, 1, 1, 1, 1,
-1.354687, 0.6601646, -0.4716679, 1, 1, 1, 1, 1,
-1.347493, 1.171404, -0.9761928, 1, 1, 1, 1, 1,
-1.336096, 0.3328882, -0.4169607, 0, 0, 1, 1, 1,
-1.335496, -0.07201035, -2.795608, 1, 0, 0, 1, 1,
-1.329861, -0.8793291, -1.706185, 1, 0, 0, 1, 1,
-1.314651, 0.4047153, -0.2119409, 1, 0, 0, 1, 1,
-1.303016, 0.3406262, -0.7141255, 1, 0, 0, 1, 1,
-1.302923, -0.4896064, 0.04248164, 1, 0, 0, 1, 1,
-1.286531, -1.333225, -1.579398, 0, 0, 0, 1, 1,
-1.278603, 0.7095526, -1.122148, 0, 0, 0, 1, 1,
-1.271185, -1.442128, -3.298594, 0, 0, 0, 1, 1,
-1.269533, 0.5857815, -1.988698, 0, 0, 0, 1, 1,
-1.264983, 0.1228194, -2.369549, 0, 0, 0, 1, 1,
-1.262447, -0.6557229, -2.719236, 0, 0, 0, 1, 1,
-1.259277, 1.332898, -2.449785, 0, 0, 0, 1, 1,
-1.258056, 0.1194436, -1.447, 1, 1, 1, 1, 1,
-1.25553, 0.02449778, -2.961173, 1, 1, 1, 1, 1,
-1.252655, 0.813253, 0.1273065, 1, 1, 1, 1, 1,
-1.248258, 0.3906378, -3.200145, 1, 1, 1, 1, 1,
-1.247711, -1.751853, -2.651246, 1, 1, 1, 1, 1,
-1.235718, -0.2193577, -2.340285, 1, 1, 1, 1, 1,
-1.2356, 0.6672655, 0.6817799, 1, 1, 1, 1, 1,
-1.234168, 0.3060447, -0.7558116, 1, 1, 1, 1, 1,
-1.225227, 0.4711555, -1.499026, 1, 1, 1, 1, 1,
-1.218569, 0.3487352, -0.7929605, 1, 1, 1, 1, 1,
-1.218211, 0.7668886, -1.297794, 1, 1, 1, 1, 1,
-1.21621, 1.254491, -2.809296, 1, 1, 1, 1, 1,
-1.216075, 0.08677867, -1.088085, 1, 1, 1, 1, 1,
-1.215355, 0.5958565, -0.4425367, 1, 1, 1, 1, 1,
-1.215289, -0.7613194, -4.430207, 1, 1, 1, 1, 1,
-1.208888, -0.5090022, -1.871828, 0, 0, 1, 1, 1,
-1.207485, -0.9706979, -2.126732, 1, 0, 0, 1, 1,
-1.204247, 0.394913, -2.070787, 1, 0, 0, 1, 1,
-1.197598, 0.6247185, -2.17877, 1, 0, 0, 1, 1,
-1.187662, 1.057752, -1.487846, 1, 0, 0, 1, 1,
-1.184785, -1.92709, -3.157401, 1, 0, 0, 1, 1,
-1.181157, -0.1484409, -1.710707, 0, 0, 0, 1, 1,
-1.179592, -0.7668621, -0.8194688, 0, 0, 0, 1, 1,
-1.169525, 0.2853072, -0.7220094, 0, 0, 0, 1, 1,
-1.167856, 0.1865751, -2.103616, 0, 0, 0, 1, 1,
-1.167739, 1.277363, -0.4937905, 0, 0, 0, 1, 1,
-1.161886, -0.9473478, -3.427394, 0, 0, 0, 1, 1,
-1.152113, -1.001125, -0.427773, 0, 0, 0, 1, 1,
-1.135658, -1.448542, -4.543858, 1, 1, 1, 1, 1,
-1.135218, 0.3859829, -1.399052, 1, 1, 1, 1, 1,
-1.132647, 0.7388636, 0.1245385, 1, 1, 1, 1, 1,
-1.125497, -0.6291515, -1.436774, 1, 1, 1, 1, 1,
-1.121101, -1.048949, -1.803767, 1, 1, 1, 1, 1,
-1.114459, 1.216433, 0.6758953, 1, 1, 1, 1, 1,
-1.113729, -0.3219572, -1.455717, 1, 1, 1, 1, 1,
-1.11177, -0.4471151, -2.376384, 1, 1, 1, 1, 1,
-1.110048, -0.315888, 0.954864, 1, 1, 1, 1, 1,
-1.10187, 0.6282626, -2.473397, 1, 1, 1, 1, 1,
-1.09687, 0.006756329, -2.714592, 1, 1, 1, 1, 1,
-1.088119, 0.4830499, -1.840239, 1, 1, 1, 1, 1,
-1.078484, 0.6937414, -0.7500294, 1, 1, 1, 1, 1,
-1.0594, 0.1974773, -2.781453, 1, 1, 1, 1, 1,
-1.056429, 0.07397463, -2.648902, 1, 1, 1, 1, 1,
-1.038663, 0.3201846, -2.173645, 0, 0, 1, 1, 1,
-1.03651, 0.3276134, -2.071107, 1, 0, 0, 1, 1,
-1.032013, 0.08909592, -0.1854409, 1, 0, 0, 1, 1,
-1.026473, -0.1027083, -3.735777, 1, 0, 0, 1, 1,
-1.025883, 0.002341561, -1.772393, 1, 0, 0, 1, 1,
-1.021181, 0.927969, 0.4165095, 1, 0, 0, 1, 1,
-1.019587, -0.6231945, -0.4459228, 0, 0, 0, 1, 1,
-1.01769, 1.761639, 0.7323164, 0, 0, 0, 1, 1,
-1.01694, -0.6060966, -1.587181, 0, 0, 0, 1, 1,
-1.016809, -0.2748584, -2.502939, 0, 0, 0, 1, 1,
-1.012068, -0.6066626, -2.345029, 0, 0, 0, 1, 1,
-1.010039, 0.885985, -0.622326, 0, 0, 0, 1, 1,
-1.009911, -1.268157, -1.689369, 0, 0, 0, 1, 1,
-1.001637, -0.2651556, -0.7935672, 1, 1, 1, 1, 1,
-0.9992336, 0.5206879, -0.6541331, 1, 1, 1, 1, 1,
-0.9976799, -0.3083382, -2.793099, 1, 1, 1, 1, 1,
-0.9967109, 1.443829, -0.856564, 1, 1, 1, 1, 1,
-0.9963644, -0.1759833, -1.291585, 1, 1, 1, 1, 1,
-0.9945418, 0.03845137, -1.926982, 1, 1, 1, 1, 1,
-0.9927817, 0.03779504, -1.315477, 1, 1, 1, 1, 1,
-0.9890514, 0.2130901, -2.821752, 1, 1, 1, 1, 1,
-0.9886721, 0.2967976, -0.7690558, 1, 1, 1, 1, 1,
-0.9879086, -1.183524, -2.633511, 1, 1, 1, 1, 1,
-0.9867727, -0.4664882, -1.611152, 1, 1, 1, 1, 1,
-0.9860286, -2.181214, -4.173883, 1, 1, 1, 1, 1,
-0.9769027, -0.4256158, -2.406246, 1, 1, 1, 1, 1,
-0.9719716, -0.02749882, -2.073081, 1, 1, 1, 1, 1,
-0.9636618, -0.1937127, -2.331727, 1, 1, 1, 1, 1,
-0.9630014, 0.4463555, -0.8753823, 0, 0, 1, 1, 1,
-0.9583834, -0.08343145, -0.6763456, 1, 0, 0, 1, 1,
-0.9565508, -1.247866, -1.0556, 1, 0, 0, 1, 1,
-0.9560543, 0.5059475, -1.043034, 1, 0, 0, 1, 1,
-0.9514635, -1.313286, -3.290566, 1, 0, 0, 1, 1,
-0.9487592, 2.538556, -2.126596, 1, 0, 0, 1, 1,
-0.9400306, 0.1432552, -0.2616269, 0, 0, 0, 1, 1,
-0.9376367, -0.5280117, -1.115457, 0, 0, 0, 1, 1,
-0.9362758, -0.5926533, -1.820315, 0, 0, 0, 1, 1,
-0.934367, -0.1020161, -1.573895, 0, 0, 0, 1, 1,
-0.9340439, -0.2843843, -1.875347, 0, 0, 0, 1, 1,
-0.9327577, 1.211878, 0.1846903, 0, 0, 0, 1, 1,
-0.9323003, 0.2099195, -0.8124353, 0, 0, 0, 1, 1,
-0.9318575, 0.08661666, -1.178125, 1, 1, 1, 1, 1,
-0.931433, 0.9758903, -0.4419354, 1, 1, 1, 1, 1,
-0.9268697, 1.235365, -2.7085, 1, 1, 1, 1, 1,
-0.9258579, -0.7754375, -4.555023, 1, 1, 1, 1, 1,
-0.9224163, 0.3666534, -1.158408, 1, 1, 1, 1, 1,
-0.919862, -0.1130461, -1.720852, 1, 1, 1, 1, 1,
-0.919584, 0.5420511, -0.6823531, 1, 1, 1, 1, 1,
-0.9133506, 1.055924, -1.798834, 1, 1, 1, 1, 1,
-0.9131359, -0.4451109, -2.084417, 1, 1, 1, 1, 1,
-0.9120814, -0.2169233, -2.689678, 1, 1, 1, 1, 1,
-0.9101169, -0.3618728, -1.592298, 1, 1, 1, 1, 1,
-0.9069936, -1.11306, -2.437089, 1, 1, 1, 1, 1,
-0.899366, 0.1501472, -2.662164, 1, 1, 1, 1, 1,
-0.8989425, -0.7204092, -4.805962, 1, 1, 1, 1, 1,
-0.8906739, -1.239276, -3.412438, 1, 1, 1, 1, 1,
-0.8899392, -0.2357433, -0.6806051, 0, 0, 1, 1, 1,
-0.8880962, -1.070212, -0.9665385, 1, 0, 0, 1, 1,
-0.8874486, -0.8491841, -0.6005608, 1, 0, 0, 1, 1,
-0.8802142, 1.137714, -2.025666, 1, 0, 0, 1, 1,
-0.8769134, 0.6663145, -0.3106244, 1, 0, 0, 1, 1,
-0.874298, -0.4857011, -2.561965, 1, 0, 0, 1, 1,
-0.868516, 0.948039, -0.7347298, 0, 0, 0, 1, 1,
-0.8684087, 0.8534974, -0.9217322, 0, 0, 0, 1, 1,
-0.862027, 0.1319497, -1.18297, 0, 0, 0, 1, 1,
-0.8610713, 0.7037018, -2.232438, 0, 0, 0, 1, 1,
-0.8551279, -0.4025079, -0.5181659, 0, 0, 0, 1, 1,
-0.8451945, -1.529331, -3.965049, 0, 0, 0, 1, 1,
-0.8414407, 0.7945391, 1.089998, 0, 0, 0, 1, 1,
-0.8410647, 0.2203617, -1.686511, 1, 1, 1, 1, 1,
-0.8406492, 0.04874829, -3.695235, 1, 1, 1, 1, 1,
-0.8376148, 0.4953087, -0.8757825, 1, 1, 1, 1, 1,
-0.8369483, 0.2072916, -1.820522, 1, 1, 1, 1, 1,
-0.8245789, 0.4800598, -1.999078, 1, 1, 1, 1, 1,
-0.8181016, 1.583083, -2.169073, 1, 1, 1, 1, 1,
-0.8076369, 1.614513, -1.404318, 1, 1, 1, 1, 1,
-0.8061355, 0.7723289, -0.9446265, 1, 1, 1, 1, 1,
-0.8019062, 0.7271788, -1.346434, 1, 1, 1, 1, 1,
-0.8016949, -0.3451624, -1.206831, 1, 1, 1, 1, 1,
-0.7986552, -1.286209, -0.9019346, 1, 1, 1, 1, 1,
-0.7885612, 0.2533189, -0.2961584, 1, 1, 1, 1, 1,
-0.7877513, -0.5101947, -2.469891, 1, 1, 1, 1, 1,
-0.7867663, 1.235407, -1.91895, 1, 1, 1, 1, 1,
-0.7843912, 0.7360375, 1.749711, 1, 1, 1, 1, 1,
-0.7831339, 1.531934, -2.215503, 0, 0, 1, 1, 1,
-0.7756534, 0.5930439, -0.6235573, 1, 0, 0, 1, 1,
-0.7741435, 1.984878, 1.045373, 1, 0, 0, 1, 1,
-0.7725949, 0.2567065, -0.1709179, 1, 0, 0, 1, 1,
-0.772151, 1.338058, -0.09419115, 1, 0, 0, 1, 1,
-0.7717835, -0.8101131, -2.801672, 1, 0, 0, 1, 1,
-0.7708036, -0.762419, -2.51327, 0, 0, 0, 1, 1,
-0.7700277, 0.9678279, -2.510865, 0, 0, 0, 1, 1,
-0.7673668, -0.7107144, -4.15622, 0, 0, 0, 1, 1,
-0.7669343, 0.6376167, -1.400135, 0, 0, 0, 1, 1,
-0.7649022, -0.2276089, -1.159027, 0, 0, 0, 1, 1,
-0.7641159, -1.619446, -2.659672, 0, 0, 0, 1, 1,
-0.7620738, 1.394271, 1.173689, 0, 0, 0, 1, 1,
-0.7618241, 0.8806674, -0.01445119, 1, 1, 1, 1, 1,
-0.7562931, 0.946367, -1.999247, 1, 1, 1, 1, 1,
-0.7545518, 0.2900619, -3.016987, 1, 1, 1, 1, 1,
-0.7499574, 0.6689149, 0.4224206, 1, 1, 1, 1, 1,
-0.7459279, 0.4079443, -0.1679977, 1, 1, 1, 1, 1,
-0.7438737, 2.38966, 0.4006089, 1, 1, 1, 1, 1,
-0.7425986, -0.772255, -0.861658, 1, 1, 1, 1, 1,
-0.7423617, 1.514301, -1.116475, 1, 1, 1, 1, 1,
-0.7364497, -1.591043, -3.352644, 1, 1, 1, 1, 1,
-0.7353263, 0.5732411, -1.249462, 1, 1, 1, 1, 1,
-0.7343422, -1.630287, -4.196311, 1, 1, 1, 1, 1,
-0.7316045, 0.05281132, -1.530937, 1, 1, 1, 1, 1,
-0.7256756, -0.01837116, -1.6626, 1, 1, 1, 1, 1,
-0.7239817, -0.4579437, -1.808386, 1, 1, 1, 1, 1,
-0.7192797, 1.941312, -0.3524715, 1, 1, 1, 1, 1,
-0.7166293, -0.0727232, -2.368295, 0, 0, 1, 1, 1,
-0.7152857, -1.382833, -2.874317, 1, 0, 0, 1, 1,
-0.7066727, -0.6855034, -1.76555, 1, 0, 0, 1, 1,
-0.7044669, -2.036903, -2.546522, 1, 0, 0, 1, 1,
-0.6999422, -2.597684, -1.994984, 1, 0, 0, 1, 1,
-0.6994741, -0.07707248, -2.410598, 1, 0, 0, 1, 1,
-0.6956055, -1.190577, -2.179349, 0, 0, 0, 1, 1,
-0.6783509, 0.1541752, -0.7839364, 0, 0, 0, 1, 1,
-0.6761844, -1.328547, -3.014926, 0, 0, 0, 1, 1,
-0.6693141, -1.016577, -1.852441, 0, 0, 0, 1, 1,
-0.6676522, 1.163286, -1.189051, 0, 0, 0, 1, 1,
-0.6626937, 2.562113, 0.808693, 0, 0, 0, 1, 1,
-0.6624773, -0.733401, -3.821171, 0, 0, 0, 1, 1,
-0.6615456, -0.244717, -0.9824369, 1, 1, 1, 1, 1,
-0.6543629, -0.09960336, -0.3605831, 1, 1, 1, 1, 1,
-0.643215, -0.8882309, -1.982382, 1, 1, 1, 1, 1,
-0.6430629, 1.597888, -1.560621, 1, 1, 1, 1, 1,
-0.6415316, 1.715324, -1.060313, 1, 1, 1, 1, 1,
-0.638694, 0.470101, -0.7156695, 1, 1, 1, 1, 1,
-0.6351497, 0.7991757, -0.659506, 1, 1, 1, 1, 1,
-0.6343181, -1.673602, -3.246695, 1, 1, 1, 1, 1,
-0.6319541, -0.7429191, -4.120569, 1, 1, 1, 1, 1,
-0.622125, -1.101435, -3.249084, 1, 1, 1, 1, 1,
-0.6190453, -0.7246112, -2.110564, 1, 1, 1, 1, 1,
-0.6178722, -0.7668951, -2.178852, 1, 1, 1, 1, 1,
-0.6166028, 0.8400428, -0.1710329, 1, 1, 1, 1, 1,
-0.6161461, 0.8735213, 0.5272519, 1, 1, 1, 1, 1,
-0.6150918, 0.001214092, -0.7526305, 1, 1, 1, 1, 1,
-0.6067836, 0.6768054, -1.292058, 0, 0, 1, 1, 1,
-0.6046479, 1.210026, -0.1358, 1, 0, 0, 1, 1,
-0.6039083, -0.5407732, -2.890013, 1, 0, 0, 1, 1,
-0.6032799, 1.365932, 0.1622237, 1, 0, 0, 1, 1,
-0.6019014, -0.9252216, -2.960628, 1, 0, 0, 1, 1,
-0.6010001, 1.425609, 0.2809677, 1, 0, 0, 1, 1,
-0.6002851, -0.08398736, -0.4996777, 0, 0, 0, 1, 1,
-0.5986486, 0.1696537, -1.69633, 0, 0, 0, 1, 1,
-0.5967963, 0.1308823, -3.136027, 0, 0, 0, 1, 1,
-0.5965502, -0.3282916, -2.140167, 0, 0, 0, 1, 1,
-0.5941207, 0.591714, -2.547436, 0, 0, 0, 1, 1,
-0.5927708, -1.275953, -2.651586, 0, 0, 0, 1, 1,
-0.590225, 0.416148, -1.231153, 0, 0, 0, 1, 1,
-0.5858444, -0.3629356, -0.2258828, 1, 1, 1, 1, 1,
-0.5856274, -0.6452719, -1.507731, 1, 1, 1, 1, 1,
-0.5823494, 1.599065, 1.172619, 1, 1, 1, 1, 1,
-0.5799333, 0.4075107, -2.157475, 1, 1, 1, 1, 1,
-0.5788068, 0.2360991, -2.033159, 1, 1, 1, 1, 1,
-0.575511, -0.4304653, -1.888585, 1, 1, 1, 1, 1,
-0.5749993, 0.483905, 0.5687606, 1, 1, 1, 1, 1,
-0.5739659, 0.1329021, -0.7201055, 1, 1, 1, 1, 1,
-0.57142, -1.216159, -3.206399, 1, 1, 1, 1, 1,
-0.5669169, -0.6951289, -2.571333, 1, 1, 1, 1, 1,
-0.5667496, 0.5259699, -0.03686349, 1, 1, 1, 1, 1,
-0.5635161, 0.4796184, 2.014872, 1, 1, 1, 1, 1,
-0.5558795, -0.4169403, -2.611485, 1, 1, 1, 1, 1,
-0.5530264, 0.1618136, -2.022784, 1, 1, 1, 1, 1,
-0.552323, 0.7365177, 1.165695, 1, 1, 1, 1, 1,
-0.546282, -1.449274, -1.699773, 0, 0, 1, 1, 1,
-0.5452275, -1.379256, -3.32425, 1, 0, 0, 1, 1,
-0.5441094, -1.071242, -2.777692, 1, 0, 0, 1, 1,
-0.5397109, 0.8862513, -1.119387, 1, 0, 0, 1, 1,
-0.5370986, 0.6573565, -0.7626242, 1, 0, 0, 1, 1,
-0.5366092, -0.4053319, -2.165555, 1, 0, 0, 1, 1,
-0.5346149, 0.8375595, -1.357665, 0, 0, 0, 1, 1,
-0.5325258, -1.887508, -3.631437, 0, 0, 0, 1, 1,
-0.5250921, -1.294445, -2.22262, 0, 0, 0, 1, 1,
-0.5238299, -0.1005665, -1.645755, 0, 0, 0, 1, 1,
-0.5211942, -0.3586883, -2.016909, 0, 0, 0, 1, 1,
-0.5208941, -1.033027, -3.692528, 0, 0, 0, 1, 1,
-0.5196164, -1.26138, -4.166342, 0, 0, 0, 1, 1,
-0.5187121, 0.2175912, 0.7530531, 1, 1, 1, 1, 1,
-0.5139024, -0.1909237, -0.8040959, 1, 1, 1, 1, 1,
-0.5132272, -0.872255, -1.602993, 1, 1, 1, 1, 1,
-0.5100382, -2.611161, -1.656417, 1, 1, 1, 1, 1,
-0.5084072, -0.6813286, -2.610431, 1, 1, 1, 1, 1,
-0.5082452, -0.7864727, -2.482845, 1, 1, 1, 1, 1,
-0.5076383, -1.55414, -1.938393, 1, 1, 1, 1, 1,
-0.5075215, 2.210368, 0.9760743, 1, 1, 1, 1, 1,
-0.5061952, 0.7313042, 0.0332178, 1, 1, 1, 1, 1,
-0.5029584, 1.403219, -0.7349882, 1, 1, 1, 1, 1,
-0.5004596, 0.5004258, -2.089825, 1, 1, 1, 1, 1,
-0.4904862, 1.507514, -0.8391684, 1, 1, 1, 1, 1,
-0.4902291, -0.1372793, -3.004953, 1, 1, 1, 1, 1,
-0.4899386, -0.1651299, -2.225319, 1, 1, 1, 1, 1,
-0.4837488, -0.5473474, -3.491252, 1, 1, 1, 1, 1,
-0.4817378, -1.143332, -2.217225, 0, 0, 1, 1, 1,
-0.4762249, 0.09113435, -1.218517, 1, 0, 0, 1, 1,
-0.473685, 0.5804057, 0.3435662, 1, 0, 0, 1, 1,
-0.4723467, -0.8794719, -2.022838, 1, 0, 0, 1, 1,
-0.4704262, -1.513016, -1.975975, 1, 0, 0, 1, 1,
-0.4656449, -1.546054, -3.912232, 1, 0, 0, 1, 1,
-0.4633905, 0.3876375, -1.297351, 0, 0, 0, 1, 1,
-0.4622051, 1.303163, 0.4634589, 0, 0, 0, 1, 1,
-0.4608555, -2.018913, -2.332102, 0, 0, 0, 1, 1,
-0.4599615, 0.6750862, -0.8227676, 0, 0, 0, 1, 1,
-0.4577129, -0.9764088, -2.55632, 0, 0, 0, 1, 1,
-0.4470822, -0.7069854, -4.550182, 0, 0, 0, 1, 1,
-0.4465022, 0.32502, -1.323786, 0, 0, 0, 1, 1,
-0.4456755, 0.4893842, -0.2179559, 1, 1, 1, 1, 1,
-0.4452237, 0.1559778, -1.053115, 1, 1, 1, 1, 1,
-0.4443718, -1.525364, -3.757935, 1, 1, 1, 1, 1,
-0.4431673, -1.567576, -2.184843, 1, 1, 1, 1, 1,
-0.4428803, -1.054396, -1.460852, 1, 1, 1, 1, 1,
-0.4409618, 1.300059, 0.4755847, 1, 1, 1, 1, 1,
-0.4397863, 0.9836868, -2.43593, 1, 1, 1, 1, 1,
-0.4375778, -1.573904, -2.268551, 1, 1, 1, 1, 1,
-0.4295496, 0.8833487, -2.68863, 1, 1, 1, 1, 1,
-0.4268533, 0.3786417, -0.306706, 1, 1, 1, 1, 1,
-0.4238201, 1.044873, 0.3620521, 1, 1, 1, 1, 1,
-0.4187877, 0.4821803, -0.4638004, 1, 1, 1, 1, 1,
-0.4154598, -0.1300709, -3.728832, 1, 1, 1, 1, 1,
-0.4126087, 1.091887, -1.625393, 1, 1, 1, 1, 1,
-0.4111644, -0.5228525, -2.989401, 1, 1, 1, 1, 1,
-0.4111625, 0.8311673, -2.076963, 0, 0, 1, 1, 1,
-0.4098593, 1.097499, -0.01525734, 1, 0, 0, 1, 1,
-0.4085705, 0.7776093, -0.03483553, 1, 0, 0, 1, 1,
-0.3999399, 1.148929, 0.04817163, 1, 0, 0, 1, 1,
-0.3950633, -1.48754, -2.036382, 1, 0, 0, 1, 1,
-0.3949307, 0.0654106, -0.7723514, 1, 0, 0, 1, 1,
-0.3948115, 1.853312, 1.060875, 0, 0, 0, 1, 1,
-0.3834852, 1.62032, -0.6980258, 0, 0, 0, 1, 1,
-0.3797649, -0.2663899, -2.694482, 0, 0, 0, 1, 1,
-0.3714913, -1.30545, -3.254465, 0, 0, 0, 1, 1,
-0.3699088, 0.5454271, -0.454839, 0, 0, 0, 1, 1,
-0.3668087, -0.08310852, -1.550394, 0, 0, 0, 1, 1,
-0.3593606, 0.3281729, -1.49746, 0, 0, 0, 1, 1,
-0.3574786, -0.7985924, -4.002528, 1, 1, 1, 1, 1,
-0.3506737, -0.6434723, -2.076168, 1, 1, 1, 1, 1,
-0.3461949, 0.5605797, 0.485276, 1, 1, 1, 1, 1,
-0.3435495, -0.5270299, -2.458989, 1, 1, 1, 1, 1,
-0.3397406, -0.1936238, -2.809172, 1, 1, 1, 1, 1,
-0.3355089, -1.514898, 0.03770742, 1, 1, 1, 1, 1,
-0.3338821, 0.1553647, -1.808889, 1, 1, 1, 1, 1,
-0.3330198, 1.061641, -1.667772, 1, 1, 1, 1, 1,
-0.3328508, -0.6084375, -3.023606, 1, 1, 1, 1, 1,
-0.3324693, -0.7728002, -1.134601, 1, 1, 1, 1, 1,
-0.3308131, -0.1496166, -2.624051, 1, 1, 1, 1, 1,
-0.3285625, -1.228481, -4.177706, 1, 1, 1, 1, 1,
-0.3274274, 0.5663019, 1.229614, 1, 1, 1, 1, 1,
-0.3228673, 0.8226714, 0.7889481, 1, 1, 1, 1, 1,
-0.3186638, 1.977478, -2.126744, 1, 1, 1, 1, 1,
-0.3180565, -0.4032371, -1.860371, 0, 0, 1, 1, 1,
-0.3175596, 0.2840214, 0.2834965, 1, 0, 0, 1, 1,
-0.3139855, -0.8896635, -3.730157, 1, 0, 0, 1, 1,
-0.309626, 0.6517206, -0.5573096, 1, 0, 0, 1, 1,
-0.3048304, 0.1187472, 0.2921624, 1, 0, 0, 1, 1,
-0.3042539, -0.09939617, -1.255223, 1, 0, 0, 1, 1,
-0.2967757, -0.6726583, -3.315359, 0, 0, 0, 1, 1,
-0.2966488, -0.01534239, -1.890199, 0, 0, 0, 1, 1,
-0.2911118, 1.34955, -0.5699601, 0, 0, 0, 1, 1,
-0.2846929, 1.895941, -0.8325294, 0, 0, 0, 1, 1,
-0.2837722, -0.8812696, -2.613467, 0, 0, 0, 1, 1,
-0.2837719, 0.979007, 0.2962146, 0, 0, 0, 1, 1,
-0.2808099, 0.8117782, -1.750469, 0, 0, 0, 1, 1,
-0.2804742, 1.75914, -1.695868, 1, 1, 1, 1, 1,
-0.279783, -0.8196513, -3.601522, 1, 1, 1, 1, 1,
-0.2756512, -1.016584, -3.838036, 1, 1, 1, 1, 1,
-0.2697132, -1.231154, -1.220925, 1, 1, 1, 1, 1,
-0.2684514, -0.8227581, -4.20342, 1, 1, 1, 1, 1,
-0.2652221, 1.281954, -0.5814345, 1, 1, 1, 1, 1,
-0.263833, -1.297015, -2.182621, 1, 1, 1, 1, 1,
-0.2588794, 0.4945736, -1.360512, 1, 1, 1, 1, 1,
-0.2547778, 0.09772066, -2.956196, 1, 1, 1, 1, 1,
-0.2539738, 1.307556, 0.7606102, 1, 1, 1, 1, 1,
-0.2495257, -0.1114612, -0.2291753, 1, 1, 1, 1, 1,
-0.249088, -0.7551739, -3.494464, 1, 1, 1, 1, 1,
-0.2461911, -1.818945, -3.019354, 1, 1, 1, 1, 1,
-0.2461035, -0.8886885, -3.001451, 1, 1, 1, 1, 1,
-0.2434121, 1.614695, 0.3056752, 1, 1, 1, 1, 1,
-0.2407922, 0.223653, -0.1091628, 0, 0, 1, 1, 1,
-0.2392558, -0.9516392, -4.052668, 1, 0, 0, 1, 1,
-0.2364806, 0.3652095, -0.2401383, 1, 0, 0, 1, 1,
-0.2363587, 1.715422, 0.06627049, 1, 0, 0, 1, 1,
-0.2358304, -0.401833, -1.912426, 1, 0, 0, 1, 1,
-0.2351787, 2.259624, -0.978449, 1, 0, 0, 1, 1,
-0.23354, 1.678168, -0.2855835, 0, 0, 0, 1, 1,
-0.2324903, -0.7543657, -2.515245, 0, 0, 0, 1, 1,
-0.2317848, -0.4368573, -3.487411, 0, 0, 0, 1, 1,
-0.2316622, 0.7459329, -0.5540153, 0, 0, 0, 1, 1,
-0.2316116, -0.5931739, -1.5204, 0, 0, 0, 1, 1,
-0.2296267, -1.110385, -1.993457, 0, 0, 0, 1, 1,
-0.2288202, 0.3694761, -0.6856874, 0, 0, 0, 1, 1,
-0.2275021, -2.00045, -2.846659, 1, 1, 1, 1, 1,
-0.2261374, 1.87029, -0.609319, 1, 1, 1, 1, 1,
-0.2251543, -0.2189001, -0.8427466, 1, 1, 1, 1, 1,
-0.2246343, 0.4115011, 0.7140189, 1, 1, 1, 1, 1,
-0.2228736, -1.129741, -2.939807, 1, 1, 1, 1, 1,
-0.2158451, 0.08547074, -0.5443103, 1, 1, 1, 1, 1,
-0.2128038, -1.945767, -3.387235, 1, 1, 1, 1, 1,
-0.2111666, -1.14996, -2.142471, 1, 1, 1, 1, 1,
-0.2098062, -1.398055, -2.847567, 1, 1, 1, 1, 1,
-0.2072656, 1.500479, 0.9424389, 1, 1, 1, 1, 1,
-0.2064619, -2.360135, -4.82591, 1, 1, 1, 1, 1,
-0.2037968, -0.7760485, -3.146437, 1, 1, 1, 1, 1,
-0.1990309, 0.7578274, -0.2422735, 1, 1, 1, 1, 1,
-0.1975767, -0.008742678, -2.049691, 1, 1, 1, 1, 1,
-0.1974965, -1.2895, -3.680077, 1, 1, 1, 1, 1,
-0.1967079, 0.9949694, 0.1710496, 0, 0, 1, 1, 1,
-0.1933514, 2.585665, -0.1463924, 1, 0, 0, 1, 1,
-0.1922055, 0.5933165, -0.9099624, 1, 0, 0, 1, 1,
-0.1833888, -0.7419912, -1.080681, 1, 0, 0, 1, 1,
-0.1832986, 0.1135652, -3.650274, 1, 0, 0, 1, 1,
-0.1800706, 1.568682, -0.0001259134, 1, 0, 0, 1, 1,
-0.1764988, 0.7772926, -0.8462798, 0, 0, 0, 1, 1,
-0.1711085, 0.4197248, -0.1203923, 0, 0, 0, 1, 1,
-0.1701972, -0.7353843, -1.773204, 0, 0, 0, 1, 1,
-0.1693453, 1.340716, -2.276037, 0, 0, 0, 1, 1,
-0.1595128, 0.477996, 0.7717797, 0, 0, 0, 1, 1,
-0.1568986, -1.880905, -2.796335, 0, 0, 0, 1, 1,
-0.1541122, -0.5580812, -3.78934, 0, 0, 0, 1, 1,
-0.153869, 0.6222149, -0.1076194, 1, 1, 1, 1, 1,
-0.1477533, -0.3698139, -2.186831, 1, 1, 1, 1, 1,
-0.1438247, -0.02856648, -0.7423311, 1, 1, 1, 1, 1,
-0.1432064, 1.048017, -1.58838, 1, 1, 1, 1, 1,
-0.1426861, -0.3294475, -3.914225, 1, 1, 1, 1, 1,
-0.1371794, -1.381551, -3.343804, 1, 1, 1, 1, 1,
-0.1355134, 1.765146, -0.6946977, 1, 1, 1, 1, 1,
-0.1342901, -0.6779232, -2.927907, 1, 1, 1, 1, 1,
-0.1321063, 0.1548218, -0.945838, 1, 1, 1, 1, 1,
-0.1318435, -0.09139385, -1.758322, 1, 1, 1, 1, 1,
-0.1287889, -1.145012, -3.950823, 1, 1, 1, 1, 1,
-0.1273976, 1.12192, -1.705264, 1, 1, 1, 1, 1,
-0.1268487, 0.1425583, 1.551857, 1, 1, 1, 1, 1,
-0.1224767, -0.2189475, -4.18996, 1, 1, 1, 1, 1,
-0.119569, -0.6839471, -2.650824, 1, 1, 1, 1, 1,
-0.1104995, 0.943073, 0.2280778, 0, 0, 1, 1, 1,
-0.1094518, 0.4634547, -0.8983774, 1, 0, 0, 1, 1,
-0.1093547, 0.9205664, -1.755211, 1, 0, 0, 1, 1,
-0.1090912, -0.121474, -2.452978, 1, 0, 0, 1, 1,
-0.1068487, 0.6702356, 1.518233, 1, 0, 0, 1, 1,
-0.1013819, -0.008185367, -2.237204, 1, 0, 0, 1, 1,
-0.09837352, -0.1686828, -2.553723, 0, 0, 0, 1, 1,
-0.09715305, 0.04669668, -1.635635, 0, 0, 0, 1, 1,
-0.09449133, 0.5617453, -0.05888132, 0, 0, 0, 1, 1,
-0.09164869, -0.9204279, -4.106727, 0, 0, 0, 1, 1,
-0.09026238, 1.101979, -0.4461392, 0, 0, 0, 1, 1,
-0.0855996, -1.513841, -1.215412, 0, 0, 0, 1, 1,
-0.08301454, 0.7741539, -0.1263956, 0, 0, 0, 1, 1,
-0.07324185, -0.875151, -3.655022, 1, 1, 1, 1, 1,
-0.06949728, -0.1313401, -2.586434, 1, 1, 1, 1, 1,
-0.0693578, 1.842426, -1.010409, 1, 1, 1, 1, 1,
-0.06856969, 0.169777, -0.7032536, 1, 1, 1, 1, 1,
-0.06703867, -1.08587, -4.167217, 1, 1, 1, 1, 1,
-0.06644838, -0.8051351, -2.962645, 1, 1, 1, 1, 1,
-0.06355576, -0.0007178371, 0.2074756, 1, 1, 1, 1, 1,
-0.06172223, 0.2929305, 0.9025376, 1, 1, 1, 1, 1,
-0.05708611, -1.453519, -3.525992, 1, 1, 1, 1, 1,
-0.0559273, 0.1121524, -1.625371, 1, 1, 1, 1, 1,
-0.05451258, 0.1628831, -0.5123698, 1, 1, 1, 1, 1,
-0.0481552, -0.9044402, -4.866404, 1, 1, 1, 1, 1,
-0.04501614, 0.2208557, -0.8570143, 1, 1, 1, 1, 1,
-0.04356289, 0.5357326, -0.1905769, 1, 1, 1, 1, 1,
-0.04320116, -1.108927, -3.094808, 1, 1, 1, 1, 1,
-0.03357626, 0.1136508, -0.8223315, 0, 0, 1, 1, 1,
-0.0303489, -0.3673112, -2.976746, 1, 0, 0, 1, 1,
-0.02180636, -1.584517, -4.800401, 1, 0, 0, 1, 1,
-0.02174882, 1.20162, -1.193713, 1, 0, 0, 1, 1,
-0.01738221, -0.01938238, -1.302251, 1, 0, 0, 1, 1,
-0.01444065, -0.06062841, -4.667688, 1, 0, 0, 1, 1,
-0.01304535, -0.7080988, -1.959671, 0, 0, 0, 1, 1,
-0.01048943, 0.5304238, -0.3820335, 0, 0, 0, 1, 1,
-0.01020115, 1.288825, 0.6790013, 0, 0, 0, 1, 1,
-0.009343622, 1.343779, 2.197093, 0, 0, 0, 1, 1,
-0.00882233, -0.7514155, -4.211031, 0, 0, 0, 1, 1,
-0.00127706, -1.362167, -2.529845, 0, 0, 0, 1, 1,
-0.0004102011, -0.7615246, -4.101564, 0, 0, 0, 1, 1,
0.003559899, -0.2494596, 2.799043, 1, 1, 1, 1, 1,
0.003810453, 0.9613758, 0.6764811, 1, 1, 1, 1, 1,
0.004044544, -1.517749, 2.570884, 1, 1, 1, 1, 1,
0.00727062, 0.5339681, 1.879084, 1, 1, 1, 1, 1,
0.009861074, -0.323389, 3.914019, 1, 1, 1, 1, 1,
0.01235845, 0.930039, 0.1675966, 1, 1, 1, 1, 1,
0.01384331, -1.363636, 3.342587, 1, 1, 1, 1, 1,
0.01393143, -1.999577, 2.026943, 1, 1, 1, 1, 1,
0.01797451, -1.739802, 5.028469, 1, 1, 1, 1, 1,
0.01806238, 0.2411234, -1.176451, 1, 1, 1, 1, 1,
0.01950859, 1.324299, 0.2382, 1, 1, 1, 1, 1,
0.02113633, -1.03622, 4.192993, 1, 1, 1, 1, 1,
0.02339345, -1.85352, 2.595747, 1, 1, 1, 1, 1,
0.02749339, -0.5839753, 2.404644, 1, 1, 1, 1, 1,
0.03096098, -0.9853361, 2.188135, 1, 1, 1, 1, 1,
0.03434784, 0.560691, 1.54875, 0, 0, 1, 1, 1,
0.03495004, -0.05675326, 3.138528, 1, 0, 0, 1, 1,
0.0354201, -2.093661, 2.866812, 1, 0, 0, 1, 1,
0.03885138, -1.750585, 4.662999, 1, 0, 0, 1, 1,
0.03900661, 0.3808124, -1.0811, 1, 0, 0, 1, 1,
0.04163791, 0.7828567, -1.596985, 1, 0, 0, 1, 1,
0.04308532, -1.46866, 2.064426, 0, 0, 0, 1, 1,
0.04715486, -0.7975798, 4.056135, 0, 0, 0, 1, 1,
0.04810461, 0.569995, -1.731009, 0, 0, 0, 1, 1,
0.05403323, 0.7348086, 1.427352, 0, 0, 0, 1, 1,
0.05617619, -1.529366, 1.622912, 0, 0, 0, 1, 1,
0.05694867, 0.5050054, 1.721283, 0, 0, 0, 1, 1,
0.05780539, -0.6595789, 4.023181, 0, 0, 0, 1, 1,
0.06053281, -0.04093513, 0.8412424, 1, 1, 1, 1, 1,
0.06297784, -0.8664997, 1.933002, 1, 1, 1, 1, 1,
0.06409843, 1.812023, -0.3418344, 1, 1, 1, 1, 1,
0.06669141, -2.24943, 3.318416, 1, 1, 1, 1, 1,
0.06677464, 0.1869831, 1.308381, 1, 1, 1, 1, 1,
0.0667921, 0.121472, 0.5812155, 1, 1, 1, 1, 1,
0.07124031, -0.5244984, 3.00058, 1, 1, 1, 1, 1,
0.07339496, 0.8803974, -0.569628, 1, 1, 1, 1, 1,
0.07433047, -0.2650811, 2.189344, 1, 1, 1, 1, 1,
0.07891037, -0.5068333, 0.9384848, 1, 1, 1, 1, 1,
0.08093393, -1.681398, 3.75434, 1, 1, 1, 1, 1,
0.08189028, -0.342766, 0.3150707, 1, 1, 1, 1, 1,
0.08580591, -0.5443448, 1.359126, 1, 1, 1, 1, 1,
0.08781017, -1.743552, 1.782323, 1, 1, 1, 1, 1,
0.08859845, 0.5072768, 0.4995057, 1, 1, 1, 1, 1,
0.09685717, -1.547324, 2.034538, 0, 0, 1, 1, 1,
0.1012313, -0.3126082, 2.570478, 1, 0, 0, 1, 1,
0.1039466, -0.6212634, 1.770286, 1, 0, 0, 1, 1,
0.1063824, 0.6974912, -1.046345, 1, 0, 0, 1, 1,
0.1160721, 0.718645, 0.9121459, 1, 0, 0, 1, 1,
0.1170205, 1.421907, 0.8357902, 1, 0, 0, 1, 1,
0.1179514, -2.006423, 3.097868, 0, 0, 0, 1, 1,
0.1180643, -0.7229431, 3.546108, 0, 0, 0, 1, 1,
0.1187166, -0.2028262, 1.698734, 0, 0, 0, 1, 1,
0.1189151, 0.2636472, -0.04180793, 0, 0, 0, 1, 1,
0.1211757, -1.667803, 2.590497, 0, 0, 0, 1, 1,
0.1222434, -0.04902879, 1.239382, 0, 0, 0, 1, 1,
0.1253497, -0.0311145, 2.859255, 0, 0, 0, 1, 1,
0.1280453, -0.7008593, 0.8042263, 1, 1, 1, 1, 1,
0.1280686, -0.7419379, 4.115938, 1, 1, 1, 1, 1,
0.1291301, 0.5200544, 0.534866, 1, 1, 1, 1, 1,
0.1292934, -2.69398, 2.427001, 1, 1, 1, 1, 1,
0.1347958, 0.8725872, 0.8520218, 1, 1, 1, 1, 1,
0.1390904, -0.05436954, 2.762473, 1, 1, 1, 1, 1,
0.1394374, 0.1316267, 1.134829, 1, 1, 1, 1, 1,
0.1399009, -0.07129197, 2.153467, 1, 1, 1, 1, 1,
0.1399316, 0.5290328, -0.4456488, 1, 1, 1, 1, 1,
0.1408413, -0.2592751, 3.013113, 1, 1, 1, 1, 1,
0.1440578, -1.696665, 3.348349, 1, 1, 1, 1, 1,
0.1500448, -0.5157536, 2.354745, 1, 1, 1, 1, 1,
0.1509845, -0.5247134, 5.302249, 1, 1, 1, 1, 1,
0.1538622, -2.696965, 1.537759, 1, 1, 1, 1, 1,
0.1641644, -1.853202, 3.419962, 1, 1, 1, 1, 1,
0.1650538, -0.6363068, 3.341525, 0, 0, 1, 1, 1,
0.1666615, -1.218605, 2.746888, 1, 0, 0, 1, 1,
0.1684099, 1.128109, 0.4769284, 1, 0, 0, 1, 1,
0.1717768, -0.6523585, 2.988086, 1, 0, 0, 1, 1,
0.1739572, -0.2373938, 2.720854, 1, 0, 0, 1, 1,
0.1745867, 0.4009698, 1.007319, 1, 0, 0, 1, 1,
0.1750612, -0.1412766, 3.171628, 0, 0, 0, 1, 1,
0.1762607, 1.870675, 0.7754129, 0, 0, 0, 1, 1,
0.1774407, 0.5147325, 0.5695723, 0, 0, 0, 1, 1,
0.1779044, -0.2753264, 1.253124, 0, 0, 0, 1, 1,
0.1805604, 0.8938047, 0.05689022, 0, 0, 0, 1, 1,
0.1813131, 0.315658, -1.202633, 0, 0, 0, 1, 1,
0.1828974, -0.1244487, 2.580053, 0, 0, 0, 1, 1,
0.193084, -0.3841104, 2.601491, 1, 1, 1, 1, 1,
0.1987675, -0.708708, 3.050469, 1, 1, 1, 1, 1,
0.2105878, 0.05778471, 2.277285, 1, 1, 1, 1, 1,
0.2195748, -0.06807788, 2.920599, 1, 1, 1, 1, 1,
0.2245402, -0.107604, 2.07064, 1, 1, 1, 1, 1,
0.2247522, 0.2230721, 0.2738871, 1, 1, 1, 1, 1,
0.2248171, 0.2441043, 1.285309, 1, 1, 1, 1, 1,
0.2306865, 0.4575822, 0.8116165, 1, 1, 1, 1, 1,
0.231622, 1.084238, -0.2857633, 1, 1, 1, 1, 1,
0.2322273, 2.27485, 1.771207, 1, 1, 1, 1, 1,
0.2341228, -0.4456869, 3.529515, 1, 1, 1, 1, 1,
0.2368464, -0.818051, 2.847703, 1, 1, 1, 1, 1,
0.2405724, 0.7469286, 0.2256461, 1, 1, 1, 1, 1,
0.2430898, -0.2699619, 3.786605, 1, 1, 1, 1, 1,
0.2433941, 0.9491577, -0.4681644, 1, 1, 1, 1, 1,
0.2478656, -0.8597944, 3.108454, 0, 0, 1, 1, 1,
0.2517948, -0.6191094, 2.060143, 1, 0, 0, 1, 1,
0.2570049, 1.15717, 0.2391781, 1, 0, 0, 1, 1,
0.2578115, 0.2852505, 0.7738177, 1, 0, 0, 1, 1,
0.2610814, -0.01750876, 1.687496, 1, 0, 0, 1, 1,
0.2644298, -0.7316984, 4.259539, 1, 0, 0, 1, 1,
0.2701975, 1.677809, 0.4035685, 0, 0, 0, 1, 1,
0.2703259, 0.1539593, 2.117435, 0, 0, 0, 1, 1,
0.2742424, 0.4058235, 1.088372, 0, 0, 0, 1, 1,
0.2779456, -0.2014795, 3.019651, 0, 0, 0, 1, 1,
0.2814381, -1.618537, 3.298243, 0, 0, 0, 1, 1,
0.2817805, -1.353588, 1.872836, 0, 0, 0, 1, 1,
0.2824661, 1.130741, -0.6409522, 0, 0, 0, 1, 1,
0.2842258, -0.7419873, 1.46765, 1, 1, 1, 1, 1,
0.2855726, 0.05306616, 0.06644287, 1, 1, 1, 1, 1,
0.2876224, 1.518976, 0.4987143, 1, 1, 1, 1, 1,
0.2918855, 0.5044904, 1.556282, 1, 1, 1, 1, 1,
0.2938744, -1.000911, 3.114279, 1, 1, 1, 1, 1,
0.2941649, 1.244275, 0.2873219, 1, 1, 1, 1, 1,
0.2948607, -0.895735, 3.070387, 1, 1, 1, 1, 1,
0.2961711, 1.805794, -0.3092748, 1, 1, 1, 1, 1,
0.2971163, 0.9764608, -0.3611107, 1, 1, 1, 1, 1,
0.2974526, -0.6217261, 2.005322, 1, 1, 1, 1, 1,
0.3040375, 0.4331988, -1.39961, 1, 1, 1, 1, 1,
0.3151459, 0.171944, 0.9649438, 1, 1, 1, 1, 1,
0.3212566, -0.4729968, 2.433298, 1, 1, 1, 1, 1,
0.3238857, -1.193703, 1.793823, 1, 1, 1, 1, 1,
0.3247402, -0.9988065, 4.022256, 1, 1, 1, 1, 1,
0.3272078, 0.3596768, -0.500401, 0, 0, 1, 1, 1,
0.3275953, -1.226464, 3.990139, 1, 0, 0, 1, 1,
0.3282668, 1.019579, -0.5173712, 1, 0, 0, 1, 1,
0.3292561, -1.218577, 2.324253, 1, 0, 0, 1, 1,
0.3364228, -0.8069617, 1.946137, 1, 0, 0, 1, 1,
0.3378649, 0.4161161, 2.679753, 1, 0, 0, 1, 1,
0.3404417, -0.6285401, 3.793002, 0, 0, 0, 1, 1,
0.3408104, -0.3516586, 2.757721, 0, 0, 0, 1, 1,
0.3463056, -0.03843426, 3.062054, 0, 0, 0, 1, 1,
0.346788, -0.7894015, 3.611998, 0, 0, 0, 1, 1,
0.3473084, 0.5415633, 0.7181622, 0, 0, 0, 1, 1,
0.3481568, -0.5227011, 1.09175, 0, 0, 0, 1, 1,
0.355084, -1.083215, 3.792943, 0, 0, 0, 1, 1,
0.358346, 0.3238626, 0.3932306, 1, 1, 1, 1, 1,
0.358536, 1.469195, 1.388047, 1, 1, 1, 1, 1,
0.3588951, 1.510644, 0.7076463, 1, 1, 1, 1, 1,
0.361838, 0.8567316, -0.4427181, 1, 1, 1, 1, 1,
0.3657808, 0.3191754, 1.088949, 1, 1, 1, 1, 1,
0.3668318, 1.38924, 0.1878748, 1, 1, 1, 1, 1,
0.3688353, -0.187878, 3.625377, 1, 1, 1, 1, 1,
0.3707584, -1.079073, 3.106319, 1, 1, 1, 1, 1,
0.3737231, -0.3643361, 2.697582, 1, 1, 1, 1, 1,
0.3786363, 0.424939, 0.3358891, 1, 1, 1, 1, 1,
0.3794202, -0.3715236, 2.989899, 1, 1, 1, 1, 1,
0.3798113, 0.1663064, -0.6709631, 1, 1, 1, 1, 1,
0.3875375, -1.78681, 2.771339, 1, 1, 1, 1, 1,
0.391737, -0.01322674, 1.066399, 1, 1, 1, 1, 1,
0.395565, -2.14345, 4.286969, 1, 1, 1, 1, 1,
0.3967613, -1.585732, 2.126893, 0, 0, 1, 1, 1,
0.4178184, 0.3707715, -0.645864, 1, 0, 0, 1, 1,
0.4186523, 0.6809118, -0.1167932, 1, 0, 0, 1, 1,
0.4316301, -0.1154571, 0.5818669, 1, 0, 0, 1, 1,
0.4338981, 0.5442474, 0.8080174, 1, 0, 0, 1, 1,
0.4348346, 1.093182, -1.339201, 1, 0, 0, 1, 1,
0.4379573, 1.100019, 0.1509916, 0, 0, 0, 1, 1,
0.4411014, 0.9379914, 0.09220754, 0, 0, 0, 1, 1,
0.4432498, -2.540279, 3.677569, 0, 0, 0, 1, 1,
0.4438821, 1.538646, 0.3646768, 0, 0, 0, 1, 1,
0.4448759, -1.39445, 1.516892, 0, 0, 0, 1, 1,
0.445477, -0.4476701, 2.732122, 0, 0, 0, 1, 1,
0.4456986, 0.7385815, 2.879618, 0, 0, 0, 1, 1,
0.4476667, 1.232509, 0.9964465, 1, 1, 1, 1, 1,
0.4483183, -0.1888546, 2.752458, 1, 1, 1, 1, 1,
0.4555765, 1.347166, 1.004408, 1, 1, 1, 1, 1,
0.4566564, -0.410439, 3.493595, 1, 1, 1, 1, 1,
0.4610775, -0.07229115, 2.595985, 1, 1, 1, 1, 1,
0.4625151, 0.3614953, 1.32382, 1, 1, 1, 1, 1,
0.4649169, 0.5210053, -0.699942, 1, 1, 1, 1, 1,
0.4781162, 0.5708718, 0.7259096, 1, 1, 1, 1, 1,
0.4782383, 0.5925316, 0.9560669, 1, 1, 1, 1, 1,
0.4782697, -1.603025, 4.734471, 1, 1, 1, 1, 1,
0.4789419, -0.1806189, 2.268526, 1, 1, 1, 1, 1,
0.4807473, -0.337081, 3.713771, 1, 1, 1, 1, 1,
0.4818786, -2.00911, 2.27437, 1, 1, 1, 1, 1,
0.4825424, -0.9066228, 3.620004, 1, 1, 1, 1, 1,
0.4972623, -0.2653301, -1.187345, 1, 1, 1, 1, 1,
0.4993302, 0.2831261, 1.433165, 0, 0, 1, 1, 1,
0.5001333, 0.5036217, 0.5630457, 1, 0, 0, 1, 1,
0.5096522, -0.6453915, 2.057314, 1, 0, 0, 1, 1,
0.5114609, 0.6555182, 0.8719806, 1, 0, 0, 1, 1,
0.519935, 0.508271, -1.046502, 1, 0, 0, 1, 1,
0.5203163, -0.4305144, 2.719076, 1, 0, 0, 1, 1,
0.5258132, -2.149917, 4.319613, 0, 0, 0, 1, 1,
0.5369262, -0.6544843, 3.247501, 0, 0, 0, 1, 1,
0.5385522, -1.427548, 1.810275, 0, 0, 0, 1, 1,
0.5393916, -0.8002144, 1.892926, 0, 0, 0, 1, 1,
0.5397282, 0.5176948, 1.624107, 0, 0, 0, 1, 1,
0.5529506, -2.48668, 2.378242, 0, 0, 0, 1, 1,
0.5554572, -0.001352612, 2.121597, 0, 0, 0, 1, 1,
0.5563678, 0.8570509, 1.743703, 1, 1, 1, 1, 1,
0.5587627, -0.2569563, 4.603311, 1, 1, 1, 1, 1,
0.5613346, 0.3414506, 0.838416, 1, 1, 1, 1, 1,
0.5613611, 0.1038, 2.870555, 1, 1, 1, 1, 1,
0.5614768, 1.819833, -0.4004011, 1, 1, 1, 1, 1,
0.5620341, 0.7908031, 0.4052421, 1, 1, 1, 1, 1,
0.5631897, 0.3588227, 0.9821014, 1, 1, 1, 1, 1,
0.5641404, -0.818443, 2.719656, 1, 1, 1, 1, 1,
0.5746695, -1.268961, 1.302017, 1, 1, 1, 1, 1,
0.5784493, -0.6516798, 0.9589639, 1, 1, 1, 1, 1,
0.5880722, 1.800582, -0.6453599, 1, 1, 1, 1, 1,
0.5903453, -0.0972721, 1.851289, 1, 1, 1, 1, 1,
0.5928246, 0.2872789, -0.1792793, 1, 1, 1, 1, 1,
0.5930705, 0.6103733, 0.5039873, 1, 1, 1, 1, 1,
0.5958148, 0.5339676, 1.129927, 1, 1, 1, 1, 1,
0.597382, 0.3909325, 1.385266, 0, 0, 1, 1, 1,
0.5976852, -0.02944287, 2.142844, 1, 0, 0, 1, 1,
0.6018, 1.237554, -1.625806, 1, 0, 0, 1, 1,
0.6021873, -0.6486493, 0.7306846, 1, 0, 0, 1, 1,
0.6035624, 0.4312259, 0.1695713, 1, 0, 0, 1, 1,
0.6037688, 1.727184, 1.127765, 1, 0, 0, 1, 1,
0.6174709, 1.396693, 0.9885492, 0, 0, 0, 1, 1,
0.6197729, 0.8379012, -0.2209709, 0, 0, 0, 1, 1,
0.6275582, -1.897128, 3.603551, 0, 0, 0, 1, 1,
0.6293329, -0.9839365, 3.476264, 0, 0, 0, 1, 1,
0.6305709, 1.315544, 0.8996776, 0, 0, 0, 1, 1,
0.6408082, -0.3085597, 3.9147, 0, 0, 0, 1, 1,
0.6419517, -1.48779, 2.783748, 0, 0, 0, 1, 1,
0.6440716, 0.2221277, -0.1247491, 1, 1, 1, 1, 1,
0.6478611, -1.007294, 1.650004, 1, 1, 1, 1, 1,
0.6497653, 0.3270767, 0.3057867, 1, 1, 1, 1, 1,
0.649888, 1.270179, -1.45849, 1, 1, 1, 1, 1,
0.6541051, -1.601975, 1.911609, 1, 1, 1, 1, 1,
0.6548737, 0.4688106, 0.9585871, 1, 1, 1, 1, 1,
0.6552092, 2.844114, 1.510275, 1, 1, 1, 1, 1,
0.6564307, -0.7481763, 2.330892, 1, 1, 1, 1, 1,
0.656659, -1.83304, 2.612213, 1, 1, 1, 1, 1,
0.6592488, -1.435901, 4.067949, 1, 1, 1, 1, 1,
0.6598621, 1.631629, 1.140543, 1, 1, 1, 1, 1,
0.6625376, -1.275005, 2.896845, 1, 1, 1, 1, 1,
0.6702628, -0.4893288, 1.02223, 1, 1, 1, 1, 1,
0.6708121, -1.052251, 2.140787, 1, 1, 1, 1, 1,
0.6797137, -0.5766063, 2.917033, 1, 1, 1, 1, 1,
0.6825289, -0.5782014, 3.453888, 0, 0, 1, 1, 1,
0.6844496, -2.053326, 2.250841, 1, 0, 0, 1, 1,
0.6858014, -1.010548, 0.9988537, 1, 0, 0, 1, 1,
0.6899695, 0.287914, 1.178723, 1, 0, 0, 1, 1,
0.6910718, -0.4193985, 1.816807, 1, 0, 0, 1, 1,
0.6921782, 1.349538, -0.401358, 1, 0, 0, 1, 1,
0.6932288, 0.9864895, -0.1619671, 0, 0, 0, 1, 1,
0.7021381, -0.9898555, 1.33981, 0, 0, 0, 1, 1,
0.7056208, -0.2565764, 1.649658, 0, 0, 0, 1, 1,
0.7075421, 1.593361, -0.05817487, 0, 0, 0, 1, 1,
0.7186931, -1.059061, 3.203429, 0, 0, 0, 1, 1,
0.7296024, 0.1108846, 0.7125877, 0, 0, 0, 1, 1,
0.7320975, 1.570977, 0.3930691, 0, 0, 0, 1, 1,
0.7342111, -1.114391, 4.093904, 1, 1, 1, 1, 1,
0.73717, -0.2135907, 2.603271, 1, 1, 1, 1, 1,
0.738117, -0.5048343, 2.67697, 1, 1, 1, 1, 1,
0.7393806, -0.1389588, 2.129299, 1, 1, 1, 1, 1,
0.7416171, -0.1273515, 0.7181791, 1, 1, 1, 1, 1,
0.7474382, -1.023545, 0.5097829, 1, 1, 1, 1, 1,
0.751334, 0.6738425, -0.7994303, 1, 1, 1, 1, 1,
0.7518868, 1.049337, 0.09432624, 1, 1, 1, 1, 1,
0.7564239, 0.3187689, 1.272041, 1, 1, 1, 1, 1,
0.760818, -0.2929752, 1.334813, 1, 1, 1, 1, 1,
0.7665359, -0.009969776, -0.669908, 1, 1, 1, 1, 1,
0.7674943, 0.3448372, -1.067081, 1, 1, 1, 1, 1,
0.7687235, 0.492004, 2.023349, 1, 1, 1, 1, 1,
0.7719361, 0.4015588, 0.8156927, 1, 1, 1, 1, 1,
0.7723538, 1.680317, 0.8438718, 1, 1, 1, 1, 1,
0.7751783, -0.3993316, 1.181196, 0, 0, 1, 1, 1,
0.7816687, -1.300185, 2.123129, 1, 0, 0, 1, 1,
0.7838794, 0.2445026, 0.766024, 1, 0, 0, 1, 1,
0.7841346, 1.950475, 1.284019, 1, 0, 0, 1, 1,
0.7848068, -0.543045, 2.802214, 1, 0, 0, 1, 1,
0.7948181, -1.540841, 1.219745, 1, 0, 0, 1, 1,
0.8013278, -0.2725835, 2.325752, 0, 0, 0, 1, 1,
0.8015788, -0.6685603, 2.966884, 0, 0, 0, 1, 1,
0.8063899, 0.9044223, -0.6253727, 0, 0, 0, 1, 1,
0.8126488, 1.544836, 0.1963288, 0, 0, 0, 1, 1,
0.8144819, -1.024754, 2.71205, 0, 0, 0, 1, 1,
0.815378, -0.08714317, 4.450195, 0, 0, 0, 1, 1,
0.8189359, 0.4143825, -0.3500637, 0, 0, 0, 1, 1,
0.8215523, 0.4339558, 0.4906769, 1, 1, 1, 1, 1,
0.8292061, -0.6706878, 2.132969, 1, 1, 1, 1, 1,
0.835689, -0.2902873, 1.853195, 1, 1, 1, 1, 1,
0.8379833, -0.5980827, 1.510587, 1, 1, 1, 1, 1,
0.8392708, -0.9063206, 1.772569, 1, 1, 1, 1, 1,
0.8429339, 1.433968, 0.9299656, 1, 1, 1, 1, 1,
0.8461927, -1.044638, 3.824881, 1, 1, 1, 1, 1,
0.8523708, 0.9208572, -0.1526177, 1, 1, 1, 1, 1,
0.8544366, 0.8162503, 0.5722755, 1, 1, 1, 1, 1,
0.860305, 0.2801559, 1.077607, 1, 1, 1, 1, 1,
0.8664057, -0.04124634, 0.6383955, 1, 1, 1, 1, 1,
0.8673449, -0.6509786, 2.768507, 1, 1, 1, 1, 1,
0.8678448, -0.3290271, 4.181094, 1, 1, 1, 1, 1,
0.8812252, 0.7371952, 0.3988003, 1, 1, 1, 1, 1,
0.8883429, 1.000729, 0.4635298, 1, 1, 1, 1, 1,
0.8959065, -0.08230578, 2.532209, 0, 0, 1, 1, 1,
0.896166, 0.4711393, 0.857544, 1, 0, 0, 1, 1,
0.8972337, -1.334087, 2.50424, 1, 0, 0, 1, 1,
0.9007923, 1.946939, 0.598815, 1, 0, 0, 1, 1,
0.9013079, -0.4846473, 2.038673, 1, 0, 0, 1, 1,
0.9023026, 0.9100641, 1.826885, 1, 0, 0, 1, 1,
0.9047062, 1.288349, 0.04185504, 0, 0, 0, 1, 1,
0.9173666, -0.1999399, 0.7858583, 0, 0, 0, 1, 1,
0.9250249, -1.760966, 2.395671, 0, 0, 0, 1, 1,
0.9287337, 0.8373885, 0.8038912, 0, 0, 0, 1, 1,
0.930492, 1.675136, -0.5221236, 0, 0, 0, 1, 1,
0.930834, -1.501921, 2.737797, 0, 0, 0, 1, 1,
0.9385186, -0.2767179, 2.786447, 0, 0, 0, 1, 1,
0.9419917, -1.075393, 2.783006, 1, 1, 1, 1, 1,
0.9502226, -2.022469, 0.5450568, 1, 1, 1, 1, 1,
0.9590531, -0.6114231, 2.223462, 1, 1, 1, 1, 1,
0.9603254, 0.6676037, 2.719218, 1, 1, 1, 1, 1,
0.9800823, -1.177144, 2.110667, 1, 1, 1, 1, 1,
0.990003, 2.022918, -0.741875, 1, 1, 1, 1, 1,
0.9960673, -0.6503701, 3.431786, 1, 1, 1, 1, 1,
0.9964366, 0.01625575, 1.961406, 1, 1, 1, 1, 1,
1.000041, 0.2729627, 1.30048, 1, 1, 1, 1, 1,
1.001337, -0.4790814, 3.7244, 1, 1, 1, 1, 1,
1.002601, -0.855629, 2.029205, 1, 1, 1, 1, 1,
1.009206, 0.7120294, 1.520856, 1, 1, 1, 1, 1,
1.009532, -0.126954, 0.1638333, 1, 1, 1, 1, 1,
1.011279, -0.5871363, 3.167015, 1, 1, 1, 1, 1,
1.014096, -0.6168727, 1.070949, 1, 1, 1, 1, 1,
1.017691, 0.02271863, 2.298018, 0, 0, 1, 1, 1,
1.018709, 0.1411117, 1.659612, 1, 0, 0, 1, 1,
1.022719, -0.6051564, -1.148701, 1, 0, 0, 1, 1,
1.025553, 0.03704637, 1.425224, 1, 0, 0, 1, 1,
1.028768, 0.7757788, 0.04699828, 1, 0, 0, 1, 1,
1.032557, 2.608602, 0.4363629, 1, 0, 0, 1, 1,
1.036284, 0.5647452, 0.06734435, 0, 0, 0, 1, 1,
1.045041, -0.9524852, 2.815276, 0, 0, 0, 1, 1,
1.045277, 1.253868, 0.7541968, 0, 0, 0, 1, 1,
1.046647, -0.3993096, 3.376566, 0, 0, 0, 1, 1,
1.05031, 0.9651952, 1.929166, 0, 0, 0, 1, 1,
1.052245, 1.095569, 1.373352, 0, 0, 0, 1, 1,
1.073866, -0.06416223, 2.244213, 0, 0, 0, 1, 1,
1.081603, 0.9172552, 1.889687, 1, 1, 1, 1, 1,
1.082587, 0.1298089, 0.7058781, 1, 1, 1, 1, 1,
1.084504, -1.963757, 2.5091, 1, 1, 1, 1, 1,
1.087727, -0.3738363, 0.5843221, 1, 1, 1, 1, 1,
1.09029, -1.981157, 4.038245, 1, 1, 1, 1, 1,
1.090552, -0.6520339, 2.094967, 1, 1, 1, 1, 1,
1.090992, 1.642003, -0.5825502, 1, 1, 1, 1, 1,
1.100332, 0.1766072, 1.485738, 1, 1, 1, 1, 1,
1.10868, 0.05908282, 1.921048, 1, 1, 1, 1, 1,
1.109986, 0.5285785, -0.6132356, 1, 1, 1, 1, 1,
1.12021, -1.232286, 1.646011, 1, 1, 1, 1, 1,
1.122945, -0.1549563, 2.013762, 1, 1, 1, 1, 1,
1.1278, -0.39434, 1.360701, 1, 1, 1, 1, 1,
1.134564, 0.6240395, 1.053329, 1, 1, 1, 1, 1,
1.13564, -0.9453377, 0.4718791, 1, 1, 1, 1, 1,
1.135652, 1.092196, 2.22089, 0, 0, 1, 1, 1,
1.141135, 0.7011883, 0.9651232, 1, 0, 0, 1, 1,
1.144532, -1.256797, 1.105035, 1, 0, 0, 1, 1,
1.148411, 0.9695333, 1.152651, 1, 0, 0, 1, 1,
1.150112, -0.08925193, 1.613708, 1, 0, 0, 1, 1,
1.156267, 0.2759891, 2.387258, 1, 0, 0, 1, 1,
1.156756, -1.458226, 3.534973, 0, 0, 0, 1, 1,
1.169935, -1.10396, 2.289195, 0, 0, 0, 1, 1,
1.177611, 0.002096939, 1.214778, 0, 0, 0, 1, 1,
1.180719, 0.134288, 2.349462, 0, 0, 0, 1, 1,
1.181903, -0.09077523, 0.1983238, 0, 0, 0, 1, 1,
1.182292, -0.7380424, 2.796632, 0, 0, 0, 1, 1,
1.199458, 1.426065, 2.32848, 0, 0, 0, 1, 1,
1.200195, 0.7679669, 1.504754, 1, 1, 1, 1, 1,
1.202552, -0.4907917, 3.759969, 1, 1, 1, 1, 1,
1.203317, -0.6046858, 2.411633, 1, 1, 1, 1, 1,
1.205121, -0.03880519, 2.032221, 1, 1, 1, 1, 1,
1.229789, -0.7644117, 1.011134, 1, 1, 1, 1, 1,
1.231923, 0.5426274, 1.644973, 1, 1, 1, 1, 1,
1.234152, 0.377269, 3.556464, 1, 1, 1, 1, 1,
1.235203, -0.707936, 1.747002, 1, 1, 1, 1, 1,
1.239849, 0.5209039, 2.253466, 1, 1, 1, 1, 1,
1.251666, -0.4705256, 0.4285396, 1, 1, 1, 1, 1,
1.262102, 0.4411729, 2.212186, 1, 1, 1, 1, 1,
1.268344, -1.562144, 3.429486, 1, 1, 1, 1, 1,
1.273896, 0.8828166, 2.079261, 1, 1, 1, 1, 1,
1.277713, 1.785185, 1.427943, 1, 1, 1, 1, 1,
1.286629, -0.07636753, 0.4566078, 1, 1, 1, 1, 1,
1.293304, -0.1820239, 3.019812, 0, 0, 1, 1, 1,
1.296963, -1.192408, 1.664506, 1, 0, 0, 1, 1,
1.307244, -1.262316, 2.72437, 1, 0, 0, 1, 1,
1.307665, -0.5836349, 2.567875, 1, 0, 0, 1, 1,
1.311932, -1.201739, 2.725745, 1, 0, 0, 1, 1,
1.314314, 1.0789, 1.860102, 1, 0, 0, 1, 1,
1.32391, -1.929725, 1.91977, 0, 0, 0, 1, 1,
1.338876, 0.7463702, 2.66921, 0, 0, 0, 1, 1,
1.338937, -0.1676952, 0.9874778, 0, 0, 0, 1, 1,
1.349727, -1.136729, 2.781321, 0, 0, 0, 1, 1,
1.35199, 1.932137, 2.711043, 0, 0, 0, 1, 1,
1.352254, 1.711853, 0.05937846, 0, 0, 0, 1, 1,
1.355762, -1.121073, 1.862618, 0, 0, 0, 1, 1,
1.369233, -0.3366273, 1.936337, 1, 1, 1, 1, 1,
1.373804, -1.734609, 1.97604, 1, 1, 1, 1, 1,
1.373872, -0.548362, 2.158537, 1, 1, 1, 1, 1,
1.376256, 0.9799366, -0.7473537, 1, 1, 1, 1, 1,
1.382459, 1.862886, 0.2920877, 1, 1, 1, 1, 1,
1.391682, -0.359464, 1.098986, 1, 1, 1, 1, 1,
1.395369, 0.321453, 1.125739, 1, 1, 1, 1, 1,
1.400371, 0.6285395, 2.542576, 1, 1, 1, 1, 1,
1.402103, -1.212936, 1.063869, 1, 1, 1, 1, 1,
1.411271, -0.6770098, 2.024706, 1, 1, 1, 1, 1,
1.420796, -1.664794, 2.185446, 1, 1, 1, 1, 1,
1.440893, 2.361727, 1.781576, 1, 1, 1, 1, 1,
1.446925, -0.5888258, 1.601503, 1, 1, 1, 1, 1,
1.448012, 0.02102312, 2.739999, 1, 1, 1, 1, 1,
1.44807, -2.031062, 2.275225, 1, 1, 1, 1, 1,
1.458092, -0.3087475, 0.08730639, 0, 0, 1, 1, 1,
1.460614, -1.424337, 1.118347, 1, 0, 0, 1, 1,
1.4638, -2.073417, 3.322909, 1, 0, 0, 1, 1,
1.4651, -0.1625576, 2.316085, 1, 0, 0, 1, 1,
1.466807, -1.120873, 2.875799, 1, 0, 0, 1, 1,
1.466828, -1.28763, 2.232442, 1, 0, 0, 1, 1,
1.468242, 0.1296684, 1.349202, 0, 0, 0, 1, 1,
1.469749, -1.677273, 1.639064, 0, 0, 0, 1, 1,
1.470414, -1.054227, 3.62062, 0, 0, 0, 1, 1,
1.484165, -1.594953, 1.504484, 0, 0, 0, 1, 1,
1.492147, -0.08772102, 3.744007, 0, 0, 0, 1, 1,
1.507496, 0.5628012, 0.979112, 0, 0, 0, 1, 1,
1.509922, -1.054603, -0.02212952, 0, 0, 0, 1, 1,
1.51084, -0.04518246, 0.5738031, 1, 1, 1, 1, 1,
1.519718, 1.729068, 0.7802373, 1, 1, 1, 1, 1,
1.525744, -0.3396747, 3.685516, 1, 1, 1, 1, 1,
1.53481, 0.7123395, 1.579919, 1, 1, 1, 1, 1,
1.53966, 1.483416, 1.75824, 1, 1, 1, 1, 1,
1.558222, 0.02132387, 2.989171, 1, 1, 1, 1, 1,
1.562943, 0.1013318, 1.348581, 1, 1, 1, 1, 1,
1.564383, -0.2294044, 2.323738, 1, 1, 1, 1, 1,
1.569479, 1.340148, 0.4705038, 1, 1, 1, 1, 1,
1.57892, -0.9824051, 0.5495665, 1, 1, 1, 1, 1,
1.585028, 0.7830222, 0.8385355, 1, 1, 1, 1, 1,
1.588336, 0.7134831, 0.6325551, 1, 1, 1, 1, 1,
1.606609, 1.125996, 2.625093, 1, 1, 1, 1, 1,
1.607, 0.3245336, 2.062112, 1, 1, 1, 1, 1,
1.620163, -0.3184116, 1.466672, 1, 1, 1, 1, 1,
1.625815, -0.9999556, 2.343024, 0, 0, 1, 1, 1,
1.628399, -1.09235, 0.929085, 1, 0, 0, 1, 1,
1.631067, 0.1034481, 1.93581, 1, 0, 0, 1, 1,
1.634988, 1.100115, 3.57572, 1, 0, 0, 1, 1,
1.638507, -0.2192491, 4.677126, 1, 0, 0, 1, 1,
1.645698, 0.4745766, 1.390594, 1, 0, 0, 1, 1,
1.657685, 0.05590568, 1.636406, 0, 0, 0, 1, 1,
1.658718, -0.3276572, 1.988876, 0, 0, 0, 1, 1,
1.659267, -1.980141, 1.194267, 0, 0, 0, 1, 1,
1.675946, 0.9888201, 2.128417, 0, 0, 0, 1, 1,
1.704132, 0.5622433, 0.8541437, 0, 0, 0, 1, 1,
1.75431, -1.185243, 2.897362, 0, 0, 0, 1, 1,
1.765284, -0.762214, 0.7589304, 0, 0, 0, 1, 1,
1.785068, 0.07171428, 3.222261, 1, 1, 1, 1, 1,
1.790688, 1.041049, 0.8743828, 1, 1, 1, 1, 1,
1.793059, 1.539474, 0.745855, 1, 1, 1, 1, 1,
1.799811, -0.9296855, 2.65123, 1, 1, 1, 1, 1,
1.808709, -0.970374, 1.457783, 1, 1, 1, 1, 1,
1.836967, -0.2657564, 0.2894797, 1, 1, 1, 1, 1,
1.842363, -1.678665, 4.735514, 1, 1, 1, 1, 1,
1.851998, 0.3418585, 2.018086, 1, 1, 1, 1, 1,
1.860606, 0.2461492, 1.44799, 1, 1, 1, 1, 1,
1.863076, -0.8411976, 2.078657, 1, 1, 1, 1, 1,
1.872708, -1.073577, 1.874208, 1, 1, 1, 1, 1,
1.889875, -0.7551119, 1.013035, 1, 1, 1, 1, 1,
1.894834, 0.8074948, 1.284003, 1, 1, 1, 1, 1,
1.900133, 1.578529, 0.2407908, 1, 1, 1, 1, 1,
1.92695, -1.618879, 3.213139, 1, 1, 1, 1, 1,
1.931536, -0.4744275, 2.364429, 0, 0, 1, 1, 1,
1.944925, -1.535365, 1.908495, 1, 0, 0, 1, 1,
1.945662, 0.9704547, 0.5368026, 1, 0, 0, 1, 1,
1.988469, 0.1415206, 2.574178, 1, 0, 0, 1, 1,
1.989508, -0.6232549, 1.862701, 1, 0, 0, 1, 1,
2.008749, 0.08251794, 1.126633, 1, 0, 0, 1, 1,
2.075957, 0.1906595, 0.7293607, 0, 0, 0, 1, 1,
2.137191, -0.6678103, 2.267596, 0, 0, 0, 1, 1,
2.163932, -0.620048, 1.324505, 0, 0, 0, 1, 1,
2.269039, 0.424365, 1.887336, 0, 0, 0, 1, 1,
2.329813, 0.8876628, -0.9264163, 0, 0, 0, 1, 1,
2.366424, 0.6974448, 0.4508263, 0, 0, 0, 1, 1,
2.366827, -1.443396, 2.913627, 0, 0, 0, 1, 1,
2.381344, -0.4301859, 2.518116, 1, 1, 1, 1, 1,
2.416764, 0.1174773, 1.066775, 1, 1, 1, 1, 1,
2.633861, 1.409078, 1.513374, 1, 1, 1, 1, 1,
2.640249, 0.1711784, 2.045163, 1, 1, 1, 1, 1,
2.713054, -0.7765043, 2.888466, 1, 1, 1, 1, 1,
2.790916, 1.023354, 2.321408, 1, 1, 1, 1, 1,
3.538081, 1.851851, 2.149487, 1, 1, 1, 1, 1
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
var radius = 9.376633;
var distance = 32.93502;
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
mvMatrix.translate( 0.09076166, -0.07357419, -0.2179229 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93502);
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
