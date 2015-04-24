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
-3.302669, 1.067643, -1.19182, 1, 0, 0, 1,
-3.142587, -0.1113451, -1.365095, 1, 0.007843138, 0, 1,
-2.898725, 0.1832177, -2.001252, 1, 0.01176471, 0, 1,
-2.816045, 1.258607, -1.091186, 1, 0.01960784, 0, 1,
-2.744552, 1.954919, -0.7734929, 1, 0.02352941, 0, 1,
-2.515321, -1.773654, -2.405617, 1, 0.03137255, 0, 1,
-2.482898, -0.3048511, -0.1730928, 1, 0.03529412, 0, 1,
-2.478162, -0.9077644, -2.188989, 1, 0.04313726, 0, 1,
-2.335597, -0.4662119, -2.84081, 1, 0.04705882, 0, 1,
-2.333981, -0.634939, -1.06233, 1, 0.05490196, 0, 1,
-2.3247, 0.5204893, -0.6727703, 1, 0.05882353, 0, 1,
-2.310911, 0.3978606, -1.818626, 1, 0.06666667, 0, 1,
-2.227736, -1.799664, -2.263133, 1, 0.07058824, 0, 1,
-2.222528, -1.927889, -3.853005, 1, 0.07843138, 0, 1,
-2.215499, 0.3407971, -0.8444639, 1, 0.08235294, 0, 1,
-2.20648, -0.9135395, -2.166174, 1, 0.09019608, 0, 1,
-2.152055, -0.002308203, -1.379742, 1, 0.09411765, 0, 1,
-2.119775, -1.329369, -2.062471, 1, 0.1019608, 0, 1,
-2.116514, 0.6124848, -2.110791, 1, 0.1098039, 0, 1,
-2.112948, -2.133616, -1.096594, 1, 0.1137255, 0, 1,
-2.107144, -1.117425, -2.981715, 1, 0.1215686, 0, 1,
-2.085767, 0.3047537, -0.3599826, 1, 0.1254902, 0, 1,
-2.07184, -1.689562, -0.747124, 1, 0.1333333, 0, 1,
-2.070785, 1.176419, -0.2382407, 1, 0.1372549, 0, 1,
-2.032172, -0.9338911, -2.945681, 1, 0.145098, 0, 1,
-2.017257, 0.2322031, -2.003035, 1, 0.1490196, 0, 1,
-2.00488, -0.8564412, -1.564792, 1, 0.1568628, 0, 1,
-1.987446, 1.864924, -1.479406, 1, 0.1607843, 0, 1,
-1.962505, 0.4766606, -1.745106, 1, 0.1686275, 0, 1,
-1.949083, -1.199352, -2.393583, 1, 0.172549, 0, 1,
-1.908974, -0.4653074, -2.273869, 1, 0.1803922, 0, 1,
-1.905493, 0.01528533, -0.8176377, 1, 0.1843137, 0, 1,
-1.892928, 1.203468, -0.7747356, 1, 0.1921569, 0, 1,
-1.889813, 0.2444932, -1.315363, 1, 0.1960784, 0, 1,
-1.874406, -2.099792, -2.420719, 1, 0.2039216, 0, 1,
-1.867993, 0.445174, -2.235049, 1, 0.2117647, 0, 1,
-1.817959, 0.4884619, -1.156427, 1, 0.2156863, 0, 1,
-1.803106, 0.04874626, -2.0051, 1, 0.2235294, 0, 1,
-1.802853, 0.003087549, -0.5174814, 1, 0.227451, 0, 1,
-1.797592, 0.8083292, -1.497456, 1, 0.2352941, 0, 1,
-1.775494, 0.1811863, -0.8730441, 1, 0.2392157, 0, 1,
-1.743305, -0.1862307, -2.495087, 1, 0.2470588, 0, 1,
-1.739494, -0.1632226, 0.4167882, 1, 0.2509804, 0, 1,
-1.72382, -0.9839094, -1.72211, 1, 0.2588235, 0, 1,
-1.715758, 0.5913404, -0.8294616, 1, 0.2627451, 0, 1,
-1.705055, -1.051169, -1.135774, 1, 0.2705882, 0, 1,
-1.704425, 0.542632, 0.003520843, 1, 0.2745098, 0, 1,
-1.703722, -0.5811679, -0.3378674, 1, 0.282353, 0, 1,
-1.699435, -0.6663383, -2.481916, 1, 0.2862745, 0, 1,
-1.694296, -0.8604614, -0.2645499, 1, 0.2941177, 0, 1,
-1.690396, -0.840531, -1.550349, 1, 0.3019608, 0, 1,
-1.689672, -1.0736, -2.263298, 1, 0.3058824, 0, 1,
-1.687472, 0.5457057, -1.36385, 1, 0.3137255, 0, 1,
-1.671481, 0.07350628, -1.175184, 1, 0.3176471, 0, 1,
-1.670132, -0.2380056, -0.1773844, 1, 0.3254902, 0, 1,
-1.666861, -0.486117, -1.811281, 1, 0.3294118, 0, 1,
-1.662852, 0.6220572, 0.3059638, 1, 0.3372549, 0, 1,
-1.65719, 0.3361672, -1.66802, 1, 0.3411765, 0, 1,
-1.644453, -0.3462898, 0.570552, 1, 0.3490196, 0, 1,
-1.640593, 1.134323, 0.2680607, 1, 0.3529412, 0, 1,
-1.635983, 0.9610156, -3.05894, 1, 0.3607843, 0, 1,
-1.632181, 0.5974584, -1.967428, 1, 0.3647059, 0, 1,
-1.629277, -1.140778, 0.2034016, 1, 0.372549, 0, 1,
-1.623763, -0.8920326, -1.582227, 1, 0.3764706, 0, 1,
-1.601156, -0.2461411, -1.793387, 1, 0.3843137, 0, 1,
-1.544917, 0.224664, -1.491383, 1, 0.3882353, 0, 1,
-1.524581, 0.412388, -0.390066, 1, 0.3960784, 0, 1,
-1.521039, -0.8344173, -1.672693, 1, 0.4039216, 0, 1,
-1.520629, 0.2975283, -1.050337, 1, 0.4078431, 0, 1,
-1.514599, -0.9628688, -0.9818297, 1, 0.4156863, 0, 1,
-1.511286, -1.277964, -2.813416, 1, 0.4196078, 0, 1,
-1.511205, -0.6039576, 0.2379201, 1, 0.427451, 0, 1,
-1.510005, -1.19007, -2.545979, 1, 0.4313726, 0, 1,
-1.508896, -0.6120073, -1.892449, 1, 0.4392157, 0, 1,
-1.491789, -3.049319, -2.1423, 1, 0.4431373, 0, 1,
-1.47902, 0.8075069, -2.72135, 1, 0.4509804, 0, 1,
-1.470905, 0.4733072, -2.165886, 1, 0.454902, 0, 1,
-1.461216, 0.7223824, -1.398904, 1, 0.4627451, 0, 1,
-1.454016, 0.8801486, -3.05257, 1, 0.4666667, 0, 1,
-1.443391, 0.4550469, -0.2525287, 1, 0.4745098, 0, 1,
-1.439075, 0.1397568, -2.028274, 1, 0.4784314, 0, 1,
-1.431481, 2.385213, -1.22164, 1, 0.4862745, 0, 1,
-1.427969, -1.137179, -2.513196, 1, 0.4901961, 0, 1,
-1.423357, 0.2901932, -3.184211, 1, 0.4980392, 0, 1,
-1.411395, 0.5075976, -0.5434674, 1, 0.5058824, 0, 1,
-1.403492, -0.5389408, -0.6801468, 1, 0.509804, 0, 1,
-1.403028, -1.573607, -1.541202, 1, 0.5176471, 0, 1,
-1.400173, -1.088299, -1.198562, 1, 0.5215687, 0, 1,
-1.389082, 1.416257, -3.477975, 1, 0.5294118, 0, 1,
-1.387232, 0.0588567, -1.226273, 1, 0.5333334, 0, 1,
-1.384912, -0.4939493, -3.304338, 1, 0.5411765, 0, 1,
-1.38443, 0.1243945, -0.855517, 1, 0.5450981, 0, 1,
-1.379948, 2.682249, -0.3785686, 1, 0.5529412, 0, 1,
-1.371741, 1.288839, -0.3356755, 1, 0.5568628, 0, 1,
-1.363833, -0.009658472, 0.02192236, 1, 0.5647059, 0, 1,
-1.362726, 1.787187, -1.081753, 1, 0.5686275, 0, 1,
-1.350307, -1.999205, -3.321027, 1, 0.5764706, 0, 1,
-1.349222, -0.08616219, -1.473686, 1, 0.5803922, 0, 1,
-1.347525, -0.1322726, -2.631518, 1, 0.5882353, 0, 1,
-1.34571, -0.4854657, -2.666182, 1, 0.5921569, 0, 1,
-1.343304, -1.026266, -0.7977442, 1, 0.6, 0, 1,
-1.340264, -0.7943347, -1.740885, 1, 0.6078432, 0, 1,
-1.340168, 0.3569474, -2.998283, 1, 0.6117647, 0, 1,
-1.323521, 0.4529005, 1.082873, 1, 0.6196079, 0, 1,
-1.311113, -0.5162265, -3.268176, 1, 0.6235294, 0, 1,
-1.309479, -1.028894, -1.683726, 1, 0.6313726, 0, 1,
-1.307107, -0.4318265, -2.598226, 1, 0.6352941, 0, 1,
-1.294918, 0.531046, -0.1335417, 1, 0.6431373, 0, 1,
-1.28321, -1.751595, -1.289156, 1, 0.6470588, 0, 1,
-1.281706, 1.733064, -0.01342815, 1, 0.654902, 0, 1,
-1.277946, -0.06616306, -1.565759, 1, 0.6588235, 0, 1,
-1.269747, 0.3691004, -2.51222, 1, 0.6666667, 0, 1,
-1.266904, 0.737034, 0.5947512, 1, 0.6705883, 0, 1,
-1.237161, 0.04515532, 1.182237, 1, 0.6784314, 0, 1,
-1.233514, 0.4264525, -1.927683, 1, 0.682353, 0, 1,
-1.231781, 0.05361453, -1.840074, 1, 0.6901961, 0, 1,
-1.231007, -1.449261, -1.444761, 1, 0.6941177, 0, 1,
-1.230612, 1.164867, -0.8864347, 1, 0.7019608, 0, 1,
-1.227433, -1.148032, -2.5373, 1, 0.7098039, 0, 1,
-1.219039, -0.2478194, -0.9395681, 1, 0.7137255, 0, 1,
-1.217149, 0.3953927, -0.9162355, 1, 0.7215686, 0, 1,
-1.210464, 0.3616661, -1.766256, 1, 0.7254902, 0, 1,
-1.210291, -0.2132959, -1.425563, 1, 0.7333333, 0, 1,
-1.208425, 0.245471, -1.143018, 1, 0.7372549, 0, 1,
-1.192779, 0.6373708, -2.262623, 1, 0.7450981, 0, 1,
-1.192048, -1.57866, -3.154574, 1, 0.7490196, 0, 1,
-1.189122, -1.125744, -1.907321, 1, 0.7568628, 0, 1,
-1.187376, 0.2885177, -1.562441, 1, 0.7607843, 0, 1,
-1.186898, -0.1896289, 1.077211, 1, 0.7686275, 0, 1,
-1.172074, -1.82134, -4.087065, 1, 0.772549, 0, 1,
-1.161428, -1.250935, -0.3166414, 1, 0.7803922, 0, 1,
-1.159908, -0.6370453, -3.056103, 1, 0.7843137, 0, 1,
-1.150833, 0.5594922, -0.474236, 1, 0.7921569, 0, 1,
-1.147039, -0.9816403, -2.563539, 1, 0.7960784, 0, 1,
-1.143611, 1.210467, -2.367596, 1, 0.8039216, 0, 1,
-1.130555, -0.3323414, -0.8810043, 1, 0.8117647, 0, 1,
-1.13018, 1.195422, -0.5465346, 1, 0.8156863, 0, 1,
-1.125727, 0.4200003, -3.648064, 1, 0.8235294, 0, 1,
-1.120933, -1.037595, -3.282525, 1, 0.827451, 0, 1,
-1.120183, -0.03534813, -1.807527, 1, 0.8352941, 0, 1,
-1.119443, -1.055181, -2.33476, 1, 0.8392157, 0, 1,
-1.117784, 0.5067158, -0.520189, 1, 0.8470588, 0, 1,
-1.115497, -0.4423405, -0.9116377, 1, 0.8509804, 0, 1,
-1.099183, -0.477388, -2.769677, 1, 0.8588235, 0, 1,
-1.090652, 0.3020028, -0.1384431, 1, 0.8627451, 0, 1,
-1.090301, 0.3884475, -1.297154, 1, 0.8705882, 0, 1,
-1.085287, 0.1008858, -1.820851, 1, 0.8745098, 0, 1,
-1.077779, 0.5184169, -0.9755483, 1, 0.8823529, 0, 1,
-1.076251, 0.8232902, 0.3233107, 1, 0.8862745, 0, 1,
-1.074112, -2.57857, -2.488495, 1, 0.8941177, 0, 1,
-1.074, -0.8984247, -0.5483345, 1, 0.8980392, 0, 1,
-1.066047, -0.13163, -3.343196, 1, 0.9058824, 0, 1,
-1.052512, -0.03477943, -0.9797511, 1, 0.9137255, 0, 1,
-1.04987, -0.4508516, -2.90173, 1, 0.9176471, 0, 1,
-1.047886, -2.023192, -3.556389, 1, 0.9254902, 0, 1,
-1.04082, -0.5358277, -2.679224, 1, 0.9294118, 0, 1,
-1.04047, -1.104695, -1.238267, 1, 0.9372549, 0, 1,
-1.040381, -0.4464727, -3.183913, 1, 0.9411765, 0, 1,
-1.03755, 0.7445169, -0.7355276, 1, 0.9490196, 0, 1,
-1.0366, 0.2705821, -0.2853746, 1, 0.9529412, 0, 1,
-1.035161, 0.2372147, -1.292285, 1, 0.9607843, 0, 1,
-1.032392, -0.45084, -2.56008, 1, 0.9647059, 0, 1,
-1.022357, -0.4905077, -1.818494, 1, 0.972549, 0, 1,
-1.019612, -0.9148378, -1.039851, 1, 0.9764706, 0, 1,
-1.018577, 0.9554437, -1.983297, 1, 0.9843137, 0, 1,
-1.018491, 0.7693868, -2.603824, 1, 0.9882353, 0, 1,
-1.018116, -0.06362405, -1.636512, 1, 0.9960784, 0, 1,
-1.016019, 1.044287, -0.3605714, 0.9960784, 1, 0, 1,
-1.015586, 0.3418414, -0.1290189, 0.9921569, 1, 0, 1,
-1.011756, 1.055743, 0.9970373, 0.9843137, 1, 0, 1,
-1.011423, -2.443089, -3.872924, 0.9803922, 1, 0, 1,
-1.003595, 0.02972327, -1.61183, 0.972549, 1, 0, 1,
-1.001987, 1.309926, -1.138838, 0.9686275, 1, 0, 1,
-1.000792, 1.116255, -0.3512512, 0.9607843, 1, 0, 1,
-0.9988738, 0.5248407, -1.44245, 0.9568627, 1, 0, 1,
-0.9961688, 1.053596, 0.6040283, 0.9490196, 1, 0, 1,
-0.991078, 0.07648932, -3.232816, 0.945098, 1, 0, 1,
-0.9906069, 1.888729, -2.950767, 0.9372549, 1, 0, 1,
-0.9880421, -0.07514399, -0.7837294, 0.9333333, 1, 0, 1,
-0.9865782, 1.893508, -0.5037534, 0.9254902, 1, 0, 1,
-0.9859068, 0.5454556, -1.54245, 0.9215686, 1, 0, 1,
-0.9855505, 1.485411, -0.5560846, 0.9137255, 1, 0, 1,
-0.9845414, -0.3715759, -3.043541, 0.9098039, 1, 0, 1,
-0.9752583, 1.766389, 2.461487, 0.9019608, 1, 0, 1,
-0.9692372, -0.4114796, -2.156314, 0.8941177, 1, 0, 1,
-0.9679329, -0.3846302, -2.224894, 0.8901961, 1, 0, 1,
-0.9654924, 0.626697, -0.2142554, 0.8823529, 1, 0, 1,
-0.9649095, 0.7776079, -0.5391735, 0.8784314, 1, 0, 1,
-0.9565325, 0.3949141, -2.861727, 0.8705882, 1, 0, 1,
-0.9501005, 0.9712932, -0.6563182, 0.8666667, 1, 0, 1,
-0.9488474, 1.752365, -1.592758, 0.8588235, 1, 0, 1,
-0.9450046, -0.5975463, -2.118249, 0.854902, 1, 0, 1,
-0.9429315, -0.6876933, -3.309962, 0.8470588, 1, 0, 1,
-0.93762, -0.9054738, -0.5583113, 0.8431373, 1, 0, 1,
-0.9311312, 0.5296026, 0.5762293, 0.8352941, 1, 0, 1,
-0.9285048, 0.8640448, -1.939981, 0.8313726, 1, 0, 1,
-0.9191247, -0.8797178, -3.275276, 0.8235294, 1, 0, 1,
-0.9179915, 0.4326774, -0.3096493, 0.8196079, 1, 0, 1,
-0.9145101, -0.7691522, -1.93227, 0.8117647, 1, 0, 1,
-0.9116822, -0.986395, -2.643628, 0.8078431, 1, 0, 1,
-0.9108828, -0.9893477, -2.55989, 0.8, 1, 0, 1,
-0.9043152, 0.4804825, -2.070009, 0.7921569, 1, 0, 1,
-0.8993443, 0.2936181, -0.9805416, 0.7882353, 1, 0, 1,
-0.8941212, 0.4771799, -1.705024, 0.7803922, 1, 0, 1,
-0.893933, -0.9896845, -3.831686, 0.7764706, 1, 0, 1,
-0.888599, -0.1770786, -1.959227, 0.7686275, 1, 0, 1,
-0.8850613, -0.332691, -1.603856, 0.7647059, 1, 0, 1,
-0.881303, -0.3365526, -2.785057, 0.7568628, 1, 0, 1,
-0.8682218, -1.202837, -1.907862, 0.7529412, 1, 0, 1,
-0.8561441, -0.7149875, -3.701887, 0.7450981, 1, 0, 1,
-0.8545107, 1.076561, -2.22628, 0.7411765, 1, 0, 1,
-0.8478867, -0.3997271, -2.255907, 0.7333333, 1, 0, 1,
-0.8474838, -0.4116786, -3.208871, 0.7294118, 1, 0, 1,
-0.8409237, 0.2633231, -1.275672, 0.7215686, 1, 0, 1,
-0.8381895, -0.8236393, -2.004207, 0.7176471, 1, 0, 1,
-0.8369317, -0.6748363, -2.738969, 0.7098039, 1, 0, 1,
-0.8175895, 1.002475, -1.319905, 0.7058824, 1, 0, 1,
-0.8087752, -0.2047962, -1.560229, 0.6980392, 1, 0, 1,
-0.8069041, 0.2914128, 0.6065302, 0.6901961, 1, 0, 1,
-0.8047251, -0.1238295, -0.4097287, 0.6862745, 1, 0, 1,
-0.8039453, 1.99705, -0.7399738, 0.6784314, 1, 0, 1,
-0.8016307, -0.03583192, -1.075532, 0.6745098, 1, 0, 1,
-0.8009204, 0.6246281, -0.4017949, 0.6666667, 1, 0, 1,
-0.7965196, -0.1515048, -2.12985, 0.6627451, 1, 0, 1,
-0.7959675, 1.785381, -0.2586254, 0.654902, 1, 0, 1,
-0.7932595, -1.045384, -1.09884, 0.6509804, 1, 0, 1,
-0.7892689, 0.9179221, 0.5464312, 0.6431373, 1, 0, 1,
-0.7799054, -0.7894107, -2.093645, 0.6392157, 1, 0, 1,
-0.7739167, -1.37504, -1.987487, 0.6313726, 1, 0, 1,
-0.7736189, -0.02894463, -2.70437, 0.627451, 1, 0, 1,
-0.7725307, -1.5257, -2.125752, 0.6196079, 1, 0, 1,
-0.7711464, 2.162484, -0.7910293, 0.6156863, 1, 0, 1,
-0.7665008, -1.763701, -0.9776789, 0.6078432, 1, 0, 1,
-0.7659075, -0.3363238, -1.907855, 0.6039216, 1, 0, 1,
-0.7656779, -0.5182853, -2.422339, 0.5960785, 1, 0, 1,
-0.759313, -0.733765, -1.252706, 0.5882353, 1, 0, 1,
-0.7575954, 0.8020103, -1.024099, 0.5843138, 1, 0, 1,
-0.7556301, -1.00745, -3.084209, 0.5764706, 1, 0, 1,
-0.7546748, -1.064005, -1.845521, 0.572549, 1, 0, 1,
-0.7504019, 0.07456541, -1.012781, 0.5647059, 1, 0, 1,
-0.740878, 0.1497227, -2.42634, 0.5607843, 1, 0, 1,
-0.7404858, -0.5214657, -2.083471, 0.5529412, 1, 0, 1,
-0.7295411, 0.7152143, -1.381371, 0.5490196, 1, 0, 1,
-0.7248027, -0.5617262, -0.8134069, 0.5411765, 1, 0, 1,
-0.7234942, -1.061228, -2.741897, 0.5372549, 1, 0, 1,
-0.7222281, 0.08990076, -1.250419, 0.5294118, 1, 0, 1,
-0.7211267, 0.958609, 1.389803, 0.5254902, 1, 0, 1,
-0.7137098, -0.1070189, -2.996373, 0.5176471, 1, 0, 1,
-0.7125781, 1.508582, 0.4945986, 0.5137255, 1, 0, 1,
-0.7093097, -0.1218777, -1.830819, 0.5058824, 1, 0, 1,
-0.7058886, 1.304388, -0.2477533, 0.5019608, 1, 0, 1,
-0.7058612, 0.8793519, -0.7596051, 0.4941176, 1, 0, 1,
-0.7050832, 1.681119, -0.0643311, 0.4862745, 1, 0, 1,
-0.7047422, -0.4013397, -0.400532, 0.4823529, 1, 0, 1,
-0.7027297, 1.08713, -1.623776, 0.4745098, 1, 0, 1,
-0.7022598, -1.275416, -2.149671, 0.4705882, 1, 0, 1,
-0.6983333, -0.9774157, -2.74855, 0.4627451, 1, 0, 1,
-0.6926101, 0.016013, -2.223439, 0.4588235, 1, 0, 1,
-0.6913456, -0.01330473, -0.1326434, 0.4509804, 1, 0, 1,
-0.6895208, -1.211077, -2.134407, 0.4470588, 1, 0, 1,
-0.6866165, -0.6100754, -3.398761, 0.4392157, 1, 0, 1,
-0.6851073, 0.8223928, -1.600546, 0.4352941, 1, 0, 1,
-0.6828799, 1.201673, -1.04999, 0.427451, 1, 0, 1,
-0.6826546, 2.166772, -0.6124741, 0.4235294, 1, 0, 1,
-0.6808171, 1.582966, 0.6182954, 0.4156863, 1, 0, 1,
-0.6807328, 0.09760179, -0.893381, 0.4117647, 1, 0, 1,
-0.6797151, -0.7856998, -2.24307, 0.4039216, 1, 0, 1,
-0.6786258, 0.2571855, -3.757642, 0.3960784, 1, 0, 1,
-0.6759298, -0.7079803, -2.783091, 0.3921569, 1, 0, 1,
-0.6732478, 0.2264666, 1.897361, 0.3843137, 1, 0, 1,
-0.6691066, 0.6849622, -0.438996, 0.3803922, 1, 0, 1,
-0.6542774, 1.260892, -0.922547, 0.372549, 1, 0, 1,
-0.6501599, -1.081586, -2.094543, 0.3686275, 1, 0, 1,
-0.64985, -0.1419195, -1.606901, 0.3607843, 1, 0, 1,
-0.6469115, -1.723032, -3.249568, 0.3568628, 1, 0, 1,
-0.6461364, -0.03931687, -0.06948856, 0.3490196, 1, 0, 1,
-0.6412054, -0.6653566, -3.953947, 0.345098, 1, 0, 1,
-0.6368877, -0.9526652, -3.891904, 0.3372549, 1, 0, 1,
-0.6322702, -0.09765795, -2.871682, 0.3333333, 1, 0, 1,
-0.6310484, -0.5907165, -1.852865, 0.3254902, 1, 0, 1,
-0.6296968, 0.9560849, -1.28096, 0.3215686, 1, 0, 1,
-0.6277797, -0.7967788, -0.2659938, 0.3137255, 1, 0, 1,
-0.6273872, 1.050093, -0.5575305, 0.3098039, 1, 0, 1,
-0.6244765, 0.4804626, -1.6846, 0.3019608, 1, 0, 1,
-0.6144925, 0.4189367, -0.4660495, 0.2941177, 1, 0, 1,
-0.6108282, 0.4129666, -0.2101595, 0.2901961, 1, 0, 1,
-0.6079745, 0.1364725, -1.454802, 0.282353, 1, 0, 1,
-0.6078365, 0.2285582, -1.321062, 0.2784314, 1, 0, 1,
-0.5948302, -0.4084404, -1.762747, 0.2705882, 1, 0, 1,
-0.5942078, -1.278106, -2.394196, 0.2666667, 1, 0, 1,
-0.592912, 0.3391311, -0.4178214, 0.2588235, 1, 0, 1,
-0.586394, 1.236661, -0.8855007, 0.254902, 1, 0, 1,
-0.5862183, 0.4083349, -1.074552, 0.2470588, 1, 0, 1,
-0.5853524, 0.4836321, -1.654189, 0.2431373, 1, 0, 1,
-0.5833044, -0.3558527, -2.492913, 0.2352941, 1, 0, 1,
-0.5821509, 0.02975914, -1.508249, 0.2313726, 1, 0, 1,
-0.5802372, -0.04356221, -1.309572, 0.2235294, 1, 0, 1,
-0.5754269, -0.170455, -1.122185, 0.2196078, 1, 0, 1,
-0.5745808, 0.7135027, 0.1290407, 0.2117647, 1, 0, 1,
-0.5740448, -1.054698, -4.839653, 0.2078431, 1, 0, 1,
-0.569251, -0.1266952, -2.538129, 0.2, 1, 0, 1,
-0.569132, -0.5127993, -2.397792, 0.1921569, 1, 0, 1,
-0.5646824, 1.231281, -0.7753533, 0.1882353, 1, 0, 1,
-0.5624144, 0.8298129, 1.066175, 0.1803922, 1, 0, 1,
-0.5552348, -0.3044922, -1.026306, 0.1764706, 1, 0, 1,
-0.5541229, 1.294213, -0.6654051, 0.1686275, 1, 0, 1,
-0.5433264, -0.796371, -2.981254, 0.1647059, 1, 0, 1,
-0.5387066, 1.157802, -1.185815, 0.1568628, 1, 0, 1,
-0.5384753, -1.014989, -2.554085, 0.1529412, 1, 0, 1,
-0.5172237, -1.558887, -2.820175, 0.145098, 1, 0, 1,
-0.5167553, -0.8089882, -3.271466, 0.1411765, 1, 0, 1,
-0.5159058, -1.099814, -4.758426, 0.1333333, 1, 0, 1,
-0.5143325, -0.6759198, -3.288293, 0.1294118, 1, 0, 1,
-0.5142801, 1.095515, -1.114699, 0.1215686, 1, 0, 1,
-0.512162, 1.095873, -0.8039876, 0.1176471, 1, 0, 1,
-0.5087648, 0.2246649, -1.695158, 0.1098039, 1, 0, 1,
-0.5054654, -1.049588, -3.64801, 0.1058824, 1, 0, 1,
-0.5024101, 1.275802, -0.8876582, 0.09803922, 1, 0, 1,
-0.5019545, -1.317875, -4.159094, 0.09019608, 1, 0, 1,
-0.5006105, -0.3209553, -1.85251, 0.08627451, 1, 0, 1,
-0.497838, -2.348955, -1.881824, 0.07843138, 1, 0, 1,
-0.4955661, 0.6097171, -0.8141916, 0.07450981, 1, 0, 1,
-0.4954635, 0.1804815, -0.8394193, 0.06666667, 1, 0, 1,
-0.4903736, -1.275122, -3.20262, 0.0627451, 1, 0, 1,
-0.4856729, -0.5508395, -2.507491, 0.05490196, 1, 0, 1,
-0.4849816, -0.396733, -1.662136, 0.05098039, 1, 0, 1,
-0.4847099, -0.7945217, -2.99464, 0.04313726, 1, 0, 1,
-0.4785943, -0.9898047, -4.198021, 0.03921569, 1, 0, 1,
-0.477455, -1.387671, -0.9309371, 0.03137255, 1, 0, 1,
-0.4735561, 0.5431733, -0.2407691, 0.02745098, 1, 0, 1,
-0.4713072, 0.7291386, 0.489687, 0.01960784, 1, 0, 1,
-0.4661029, 2.564605, -0.1198064, 0.01568628, 1, 0, 1,
-0.4654215, 0.04690323, -2.603853, 0.007843138, 1, 0, 1,
-0.4608361, 0.6684503, -1.18778, 0.003921569, 1, 0, 1,
-0.4596865, -0.6521795, -0.904397, 0, 1, 0.003921569, 1,
-0.4566612, 0.5367978, -0.6230361, 0, 1, 0.01176471, 1,
-0.4511688, -0.4347957, -0.9783208, 0, 1, 0.01568628, 1,
-0.4471997, 0.7977181, -1.254931, 0, 1, 0.02352941, 1,
-0.4465494, 1.88448, 0.9705612, 0, 1, 0.02745098, 1,
-0.4455204, 0.6015726, -0.2399447, 0, 1, 0.03529412, 1,
-0.4424188, -0.08262498, -1.587182, 0, 1, 0.03921569, 1,
-0.4417982, 1.300152, 1.942902, 0, 1, 0.04705882, 1,
-0.4336661, 0.09609006, -0.738424, 0, 1, 0.05098039, 1,
-0.4328886, 0.5166122, -1.007141, 0, 1, 0.05882353, 1,
-0.4317097, 1.57959, 0.2158885, 0, 1, 0.0627451, 1,
-0.431549, -1.178925, -4.64538, 0, 1, 0.07058824, 1,
-0.4299729, -1.340027, -2.440407, 0, 1, 0.07450981, 1,
-0.4283723, -0.2267925, -0.8884416, 0, 1, 0.08235294, 1,
-0.4275377, -0.5193868, -1.867848, 0, 1, 0.08627451, 1,
-0.4262679, 0.288603, 0.9030034, 0, 1, 0.09411765, 1,
-0.4203629, -0.4975905, -2.958972, 0, 1, 0.1019608, 1,
-0.4194485, -0.3970562, -1.453454, 0, 1, 0.1058824, 1,
-0.4122741, -0.07072823, -1.558012, 0, 1, 0.1137255, 1,
-0.4099396, 1.665973, 0.2794507, 0, 1, 0.1176471, 1,
-0.4078794, -0.1027584, -1.463926, 0, 1, 0.1254902, 1,
-0.40178, -0.3043648, -1.773385, 0, 1, 0.1294118, 1,
-0.4006298, 0.3740085, 0.8497751, 0, 1, 0.1372549, 1,
-0.4002282, -2.231529, -3.158038, 0, 1, 0.1411765, 1,
-0.39919, -0.1739249, -1.239703, 0, 1, 0.1490196, 1,
-0.3987095, 2.091245, -0.9768174, 0, 1, 0.1529412, 1,
-0.3980279, 0.07447053, -1.92766, 0, 1, 0.1607843, 1,
-0.3947318, -1.69232, -2.95725, 0, 1, 0.1647059, 1,
-0.3934838, 0.08218322, -2.071238, 0, 1, 0.172549, 1,
-0.3875118, -0.4861057, -3.443779, 0, 1, 0.1764706, 1,
-0.3835702, 1.92964, -0.4627806, 0, 1, 0.1843137, 1,
-0.3821412, 0.4875162, -0.9181609, 0, 1, 0.1882353, 1,
-0.381508, 2.068461, -0.517946, 0, 1, 0.1960784, 1,
-0.3804935, -1.157664, -3.452021, 0, 1, 0.2039216, 1,
-0.3743359, 0.04319138, 1.180507, 0, 1, 0.2078431, 1,
-0.3728729, 0.550521, -0.7939143, 0, 1, 0.2156863, 1,
-0.3668264, 0.1377467, -1.206115, 0, 1, 0.2196078, 1,
-0.3668043, 0.7272789, -2.737647, 0, 1, 0.227451, 1,
-0.3616988, -1.661765, -3.265552, 0, 1, 0.2313726, 1,
-0.3592406, 0.3613446, -0.8367558, 0, 1, 0.2392157, 1,
-0.3560863, 0.2419242, -0.968531, 0, 1, 0.2431373, 1,
-0.355468, -0.04777415, -1.745561, 0, 1, 0.2509804, 1,
-0.3549353, -1.094883, -2.920294, 0, 1, 0.254902, 1,
-0.3526577, -0.7638103, -2.405473, 0, 1, 0.2627451, 1,
-0.3515326, -0.8466762, -1.631496, 0, 1, 0.2666667, 1,
-0.3511112, 0.2598292, -1.896674, 0, 1, 0.2745098, 1,
-0.3438574, -0.5259067, -0.7578467, 0, 1, 0.2784314, 1,
-0.3429097, -1.560051, -3.735348, 0, 1, 0.2862745, 1,
-0.3415999, 1.626283, 0.1668335, 0, 1, 0.2901961, 1,
-0.3396265, 0.9412644, -0.2748331, 0, 1, 0.2980392, 1,
-0.3384843, 0.6564918, -0.761185, 0, 1, 0.3058824, 1,
-0.330095, -0.3025439, -3.203473, 0, 1, 0.3098039, 1,
-0.3281132, 0.3067442, -0.2801561, 0, 1, 0.3176471, 1,
-0.3253409, -0.8310696, -2.486821, 0, 1, 0.3215686, 1,
-0.3235478, -0.2431281, -2.280205, 0, 1, 0.3294118, 1,
-0.3188216, 0.8916036, -0.9986505, 0, 1, 0.3333333, 1,
-0.3177346, 1.574695, -0.5513789, 0, 1, 0.3411765, 1,
-0.3084586, 1.220695, -1.024632, 0, 1, 0.345098, 1,
-0.3036172, 1.145322, 0.9204823, 0, 1, 0.3529412, 1,
-0.3032007, -0.9599848, -3.893122, 0, 1, 0.3568628, 1,
-0.3030172, -2.429359, -3.961814, 0, 1, 0.3647059, 1,
-0.3022797, 0.6785452, -0.8936051, 0, 1, 0.3686275, 1,
-0.3000665, 1.841867, -1.77115, 0, 1, 0.3764706, 1,
-0.2984089, 0.1414995, -1.89551, 0, 1, 0.3803922, 1,
-0.2980556, -0.3368354, -1.374909, 0, 1, 0.3882353, 1,
-0.2964729, 2.220053, -0.125152, 0, 1, 0.3921569, 1,
-0.2933046, -0.8346692, -4.041469, 0, 1, 0.4, 1,
-0.2894168, 1.033606, 1.441365, 0, 1, 0.4078431, 1,
-0.2792653, 1.283638, -0.145054, 0, 1, 0.4117647, 1,
-0.278868, 2.005875, -0.3406382, 0, 1, 0.4196078, 1,
-0.2777985, 2.05689, 1.854894, 0, 1, 0.4235294, 1,
-0.276194, 1.384765, 0.7842262, 0, 1, 0.4313726, 1,
-0.2761742, -1.780143, -2.715101, 0, 1, 0.4352941, 1,
-0.2759702, 0.8774858, -0.5567868, 0, 1, 0.4431373, 1,
-0.2753034, -1.245731, -0.4943373, 0, 1, 0.4470588, 1,
-0.2716083, -1.089828, -3.289224, 0, 1, 0.454902, 1,
-0.2704578, 0.1397909, -0.7282258, 0, 1, 0.4588235, 1,
-0.2576901, 0.1007246, -1.981825, 0, 1, 0.4666667, 1,
-0.2567479, -0.807534, -2.561772, 0, 1, 0.4705882, 1,
-0.256342, -0.7646692, -2.633693, 0, 1, 0.4784314, 1,
-0.2533785, 0.4510269, -0.0280091, 0, 1, 0.4823529, 1,
-0.2515867, -0.5561389, -4.078527, 0, 1, 0.4901961, 1,
-0.2496502, -1.706217, -1.913834, 0, 1, 0.4941176, 1,
-0.248641, -0.6921275, -3.198507, 0, 1, 0.5019608, 1,
-0.2482257, -1.412002, -2.22928, 0, 1, 0.509804, 1,
-0.2475461, -1.240238, -4.687718, 0, 1, 0.5137255, 1,
-0.2473911, 1.818658, 0.3441949, 0, 1, 0.5215687, 1,
-0.2419519, 0.1750928, -1.188322, 0, 1, 0.5254902, 1,
-0.241408, -0.2106386, -3.39965, 0, 1, 0.5333334, 1,
-0.2408025, -0.6621755, -1.934817, 0, 1, 0.5372549, 1,
-0.240354, 1.127814, -1.5236, 0, 1, 0.5450981, 1,
-0.2395258, 1.029736, -1.295741, 0, 1, 0.5490196, 1,
-0.2373752, -1.213532, -3.629541, 0, 1, 0.5568628, 1,
-0.2366717, -0.7423313, -2.910562, 0, 1, 0.5607843, 1,
-0.231326, -0.26524, -3.127527, 0, 1, 0.5686275, 1,
-0.2312409, 0.3187713, -2.445955, 0, 1, 0.572549, 1,
-0.2280467, 1.894867, 1.604397, 0, 1, 0.5803922, 1,
-0.2247217, -0.8068548, -2.325241, 0, 1, 0.5843138, 1,
-0.221794, -0.8382953, -2.057064, 0, 1, 0.5921569, 1,
-0.2170533, 0.8343353, -1.840411, 0, 1, 0.5960785, 1,
-0.2113288, 0.6220646, -0.2381732, 0, 1, 0.6039216, 1,
-0.2055807, -0.2079517, -0.1149276, 0, 1, 0.6117647, 1,
-0.205451, 0.147908, -0.7084265, 0, 1, 0.6156863, 1,
-0.2040105, -0.6873198, -4.082338, 0, 1, 0.6235294, 1,
-0.1963438, -0.03184473, -2.931814, 0, 1, 0.627451, 1,
-0.1954968, -1.974367, -3.953634, 0, 1, 0.6352941, 1,
-0.1934347, 0.5244067, -1.176925, 0, 1, 0.6392157, 1,
-0.193401, -0.1237347, -2.992991, 0, 1, 0.6470588, 1,
-0.1917415, -1.844859, -2.197749, 0, 1, 0.6509804, 1,
-0.1826466, 0.9875001, -1.214896, 0, 1, 0.6588235, 1,
-0.1789576, -0.8477565, -3.164499, 0, 1, 0.6627451, 1,
-0.1789313, -1.865692, -4.250579, 0, 1, 0.6705883, 1,
-0.175715, -1.517995, -2.696239, 0, 1, 0.6745098, 1,
-0.1717514, 0.655093, -0.2765512, 0, 1, 0.682353, 1,
-0.1711395, 0.4757565, -1.035089, 0, 1, 0.6862745, 1,
-0.1708075, 0.3843613, 0.451117, 0, 1, 0.6941177, 1,
-0.169304, -0.6619079, -2.686234, 0, 1, 0.7019608, 1,
-0.1652248, -0.007142692, -2.354145, 0, 1, 0.7058824, 1,
-0.1651806, 0.3329633, -0.8739476, 0, 1, 0.7137255, 1,
-0.1610452, 1.269048, 1.400727, 0, 1, 0.7176471, 1,
-0.1556134, 0.3313426, -1.02732, 0, 1, 0.7254902, 1,
-0.1516912, 0.5448484, 0.5566612, 0, 1, 0.7294118, 1,
-0.1501777, 0.1954945, -1.023136, 0, 1, 0.7372549, 1,
-0.149926, 0.9790152, -1.334919, 0, 1, 0.7411765, 1,
-0.1460934, -1.037331, -3.193506, 0, 1, 0.7490196, 1,
-0.1397282, -0.09738833, -1.611395, 0, 1, 0.7529412, 1,
-0.1393857, 0.6192065, 0.7265876, 0, 1, 0.7607843, 1,
-0.1393003, 0.3512635, 0.1158112, 0, 1, 0.7647059, 1,
-0.1387227, -0.3220325, -4.097564, 0, 1, 0.772549, 1,
-0.1358376, -0.6041608, -2.61904, 0, 1, 0.7764706, 1,
-0.127298, 0.4664212, -0.4659473, 0, 1, 0.7843137, 1,
-0.1242345, 0.7421838, -0.8362922, 0, 1, 0.7882353, 1,
-0.1240597, 1.440823, 1.739745, 0, 1, 0.7960784, 1,
-0.1219712, 0.8485794, -0.3507315, 0, 1, 0.8039216, 1,
-0.1199717, 1.94198, -0.2294466, 0, 1, 0.8078431, 1,
-0.118836, -1.218207, -2.398124, 0, 1, 0.8156863, 1,
-0.1099657, -0.3533145, -2.562695, 0, 1, 0.8196079, 1,
-0.1084617, -1.077495, -2.986426, 0, 1, 0.827451, 1,
-0.108145, 0.3276192, -1.775739, 0, 1, 0.8313726, 1,
-0.1062549, 0.0186873, -2.134414, 0, 1, 0.8392157, 1,
-0.1044227, 0.1897366, -0.1309037, 0, 1, 0.8431373, 1,
-0.102555, -0.7028716, -3.532439, 0, 1, 0.8509804, 1,
-0.100637, -1.459485, -2.855098, 0, 1, 0.854902, 1,
-0.09944025, 1.053125, 1.034679, 0, 1, 0.8627451, 1,
-0.09025931, 0.80883, -0.3021846, 0, 1, 0.8666667, 1,
-0.08233298, -0.9925644, -2.251021, 0, 1, 0.8745098, 1,
-0.07717357, 0.4130281, -0.9382987, 0, 1, 0.8784314, 1,
-0.07540445, 0.1450132, 0.3739969, 0, 1, 0.8862745, 1,
-0.07219312, -0.1707514, -0.3060777, 0, 1, 0.8901961, 1,
-0.0708389, 0.1405831, 0.041672, 0, 1, 0.8980392, 1,
-0.06719198, 0.7950158, -0.1471078, 0, 1, 0.9058824, 1,
-0.06617042, -0.8942397, -3.751819, 0, 1, 0.9098039, 1,
-0.06159925, -0.1036637, -2.260968, 0, 1, 0.9176471, 1,
-0.06111433, -1.437793, -3.510621, 0, 1, 0.9215686, 1,
-0.05934189, 0.1090535, -1.129615, 0, 1, 0.9294118, 1,
-0.0548717, -0.1671766, -2.560193, 0, 1, 0.9333333, 1,
-0.05347934, 0.0179764, -1.020951, 0, 1, 0.9411765, 1,
-0.05315153, -0.09860174, -3.141669, 0, 1, 0.945098, 1,
-0.0523585, -0.4713001, -5.427065, 0, 1, 0.9529412, 1,
-0.05223138, -0.3517196, -1.01342, 0, 1, 0.9568627, 1,
-0.05098339, -0.9613676, -1.882091, 0, 1, 0.9647059, 1,
-0.04821758, -0.3155545, -3.913543, 0, 1, 0.9686275, 1,
-0.04401303, 1.197307, -0.5739246, 0, 1, 0.9764706, 1,
-0.04339502, 1.238367, -2.211511, 0, 1, 0.9803922, 1,
-0.04307928, -0.8715008, -1.839132, 0, 1, 0.9882353, 1,
-0.03745957, -0.7707837, -3.102247, 0, 1, 0.9921569, 1,
-0.03693525, 0.1622985, -0.2864276, 0, 1, 1, 1,
-0.03582519, -0.022803, -2.591671, 0, 0.9921569, 1, 1,
-0.03459022, -0.3953743, -2.917572, 0, 0.9882353, 1, 1,
-0.0334729, 0.5172176, -0.5952169, 0, 0.9803922, 1, 1,
-0.03250055, 0.144799, -0.9032433, 0, 0.9764706, 1, 1,
-0.03132236, 1.873956, -0.2720375, 0, 0.9686275, 1, 1,
-0.02696279, 0.40589, -1.142892, 0, 0.9647059, 1, 1,
-0.02665502, -0.2608678, -3.483197, 0, 0.9568627, 1, 1,
-0.02540012, 1.619266, 0.006827518, 0, 0.9529412, 1, 1,
-0.02539024, 0.5060506, 0.9433287, 0, 0.945098, 1, 1,
-0.02492299, -2.49405, -2.721951, 0, 0.9411765, 1, 1,
-0.02479674, -0.04059917, -1.248176, 0, 0.9333333, 1, 1,
-0.01974139, -1.027794, -2.584624, 0, 0.9294118, 1, 1,
-0.01849005, 3.136544, -0.550693, 0, 0.9215686, 1, 1,
-0.01795493, -0.8251999, -2.69877, 0, 0.9176471, 1, 1,
-0.01775438, 0.06743818, -1.585434, 0, 0.9098039, 1, 1,
-0.01629035, 0.04933023, -1.657313, 0, 0.9058824, 1, 1,
-0.01619136, -0.4722459, -2.374984, 0, 0.8980392, 1, 1,
-0.01396495, 0.181424, 1.016313, 0, 0.8901961, 1, 1,
-0.01273996, -0.06792242, -3.030333, 0, 0.8862745, 1, 1,
-0.009037998, 0.5864302, 1.123977, 0, 0.8784314, 1, 1,
-0.007634821, 0.3263122, 0.3166421, 0, 0.8745098, 1, 1,
-0.004187637, -1.312392, -2.302902, 0, 0.8666667, 1, 1,
-0.002021883, 0.543178, 1.167333, 0, 0.8627451, 1, 1,
0.00403976, 0.6389731, 0.4691155, 0, 0.854902, 1, 1,
0.004876459, -0.2031618, 4.627583, 0, 0.8509804, 1, 1,
0.01000773, 0.5590759, 0.177704, 0, 0.8431373, 1, 1,
0.01291577, -0.2939218, 2.624612, 0, 0.8392157, 1, 1,
0.01459039, -0.3434644, 2.773526, 0, 0.8313726, 1, 1,
0.01632149, 1.276698, 0.3527274, 0, 0.827451, 1, 1,
0.01772143, -0.7421384, 2.19324, 0, 0.8196079, 1, 1,
0.01967984, 1.181689, -0.7448704, 0, 0.8156863, 1, 1,
0.02061075, -0.1974456, 1.388991, 0, 0.8078431, 1, 1,
0.02182196, 1.039954, -0.3085467, 0, 0.8039216, 1, 1,
0.02198472, -1.168306, 3.531496, 0, 0.7960784, 1, 1,
0.02249313, 0.3328099, 0.3366772, 0, 0.7882353, 1, 1,
0.02433768, -1.798244, 2.908689, 0, 0.7843137, 1, 1,
0.02479599, 1.259919, 2.136895, 0, 0.7764706, 1, 1,
0.02526433, 0.2042631, -0.7198993, 0, 0.772549, 1, 1,
0.02580212, -1.151292, 1.532438, 0, 0.7647059, 1, 1,
0.02643218, -0.05075631, 2.768609, 0, 0.7607843, 1, 1,
0.03048298, 0.4240409, 1.086606, 0, 0.7529412, 1, 1,
0.03069516, -0.01627846, 3.829976, 0, 0.7490196, 1, 1,
0.03275764, 1.580604, 1.069833, 0, 0.7411765, 1, 1,
0.03818397, -0.2620991, 3.607415, 0, 0.7372549, 1, 1,
0.03904769, -2.39174, 3.147653, 0, 0.7294118, 1, 1,
0.04099567, 0.7877823, 0.1846689, 0, 0.7254902, 1, 1,
0.04213331, -0.5733075, 3.04144, 0, 0.7176471, 1, 1,
0.04265591, -1.435665, 3.410432, 0, 0.7137255, 1, 1,
0.04331169, 0.1864908, 1.664741, 0, 0.7058824, 1, 1,
0.04603992, 0.2882302, 1.109683, 0, 0.6980392, 1, 1,
0.04895206, 0.1051265, 1.382804, 0, 0.6941177, 1, 1,
0.04984726, -0.2089125, 2.075114, 0, 0.6862745, 1, 1,
0.04995471, 0.4026721, 0.2416336, 0, 0.682353, 1, 1,
0.05012109, -0.1390978, 2.54972, 0, 0.6745098, 1, 1,
0.05169542, 0.3916055, 1.399154, 0, 0.6705883, 1, 1,
0.06257372, 0.5414609, 0.8585958, 0, 0.6627451, 1, 1,
0.06319521, -0.9091792, 2.65949, 0, 0.6588235, 1, 1,
0.06927677, -0.8581867, 4.363325, 0, 0.6509804, 1, 1,
0.06953464, 0.3890986, 1.530571, 0, 0.6470588, 1, 1,
0.07493171, 0.1454883, 0.6710933, 0, 0.6392157, 1, 1,
0.07770343, 0.7333105, 1.108767, 0, 0.6352941, 1, 1,
0.07821763, 0.6529517, 1.565469, 0, 0.627451, 1, 1,
0.07841472, 0.5795248, -0.8604301, 0, 0.6235294, 1, 1,
0.08234522, 0.8589656, -0.4461781, 0, 0.6156863, 1, 1,
0.0835456, 0.8162206, -1.800405, 0, 0.6117647, 1, 1,
0.08545666, -1.582767, 2.517155, 0, 0.6039216, 1, 1,
0.08982208, -0.7298792, 1.603904, 0, 0.5960785, 1, 1,
0.09008889, 2.19528, 0.9030623, 0, 0.5921569, 1, 1,
0.09417178, -0.2716252, 3.598409, 0, 0.5843138, 1, 1,
0.09792364, 0.547902, -0.952638, 0, 0.5803922, 1, 1,
0.101903, -0.2919389, 3.166302, 0, 0.572549, 1, 1,
0.1045281, 0.810178, 0.01394596, 0, 0.5686275, 1, 1,
0.1086892, 0.0940093, 0.2188942, 0, 0.5607843, 1, 1,
0.112094, -0.2467665, 3.728406, 0, 0.5568628, 1, 1,
0.1189583, 0.2269515, 1.184741, 0, 0.5490196, 1, 1,
0.1190514, 0.433146, -0.8216381, 0, 0.5450981, 1, 1,
0.1196901, -0.4903806, 0.7297431, 0, 0.5372549, 1, 1,
0.120227, 0.6537095, 0.529261, 0, 0.5333334, 1, 1,
0.1204324, 1.10624, -0.966503, 0, 0.5254902, 1, 1,
0.1204864, 0.9021505, -1.483645, 0, 0.5215687, 1, 1,
0.1209247, -0.7581925, 3.833618, 0, 0.5137255, 1, 1,
0.1212824, 1.926612, -0.03353561, 0, 0.509804, 1, 1,
0.1225081, -1.179038, 3.895585, 0, 0.5019608, 1, 1,
0.1229225, -0.3768764, 4.458407, 0, 0.4941176, 1, 1,
0.1290994, -2.181312, 2.973896, 0, 0.4901961, 1, 1,
0.1328796, 1.580002, -0.6066954, 0, 0.4823529, 1, 1,
0.1343435, -1.137664, 2.235469, 0, 0.4784314, 1, 1,
0.13444, 0.3224354, 0.381932, 0, 0.4705882, 1, 1,
0.1430804, 0.1995519, 1.107816, 0, 0.4666667, 1, 1,
0.1436367, -1.589433, 4.068174, 0, 0.4588235, 1, 1,
0.1481017, 0.3489901, -1.042404, 0, 0.454902, 1, 1,
0.1492425, 1.430008, 1.162395, 0, 0.4470588, 1, 1,
0.1545375, 0.2134439, 0.2386141, 0, 0.4431373, 1, 1,
0.1573603, -0.7298089, 2.311183, 0, 0.4352941, 1, 1,
0.1575094, -0.1955754, 2.025237, 0, 0.4313726, 1, 1,
0.1590881, -0.1148373, 1.183136, 0, 0.4235294, 1, 1,
0.1591422, -0.9993976, 2.26621, 0, 0.4196078, 1, 1,
0.1612609, 0.4256171, -1.218872, 0, 0.4117647, 1, 1,
0.1625301, 1.33652, 0.2045299, 0, 0.4078431, 1, 1,
0.1686108, 1.451691, 0.4930456, 0, 0.4, 1, 1,
0.1707243, 0.8009915, -0.9150189, 0, 0.3921569, 1, 1,
0.1725082, -0.262592, 3.354348, 0, 0.3882353, 1, 1,
0.1734645, 0.3760504, 0.5456799, 0, 0.3803922, 1, 1,
0.1784547, -0.5191779, 2.464517, 0, 0.3764706, 1, 1,
0.1846909, 0.8006919, 0.096029, 0, 0.3686275, 1, 1,
0.1848598, -0.7284863, 3.018212, 0, 0.3647059, 1, 1,
0.1863669, 2.676407, -0.9061261, 0, 0.3568628, 1, 1,
0.1953933, -0.8928421, 1.214193, 0, 0.3529412, 1, 1,
0.1984803, -0.4870985, 1.600637, 0, 0.345098, 1, 1,
0.2045355, 0.7945303, -0.5982745, 0, 0.3411765, 1, 1,
0.2051418, -0.6879002, 3.178021, 0, 0.3333333, 1, 1,
0.2079329, 1.359671, 1.048947, 0, 0.3294118, 1, 1,
0.2090706, 2.384997, 1.621882, 0, 0.3215686, 1, 1,
0.2094501, 0.7516656, 1.175488, 0, 0.3176471, 1, 1,
0.2127341, -0.2332515, 1.884758, 0, 0.3098039, 1, 1,
0.2132131, 0.3283004, 0.5439259, 0, 0.3058824, 1, 1,
0.2163304, 1.066591, -0.4512985, 0, 0.2980392, 1, 1,
0.2257082, -0.05776873, 2.880684, 0, 0.2901961, 1, 1,
0.227536, 1.185313, -0.5569965, 0, 0.2862745, 1, 1,
0.2282174, -1.635437, 1.412244, 0, 0.2784314, 1, 1,
0.2285779, -0.07220241, 1.261443, 0, 0.2745098, 1, 1,
0.229086, 1.397591, 0.6794143, 0, 0.2666667, 1, 1,
0.2319838, 0.1865578, -0.01366547, 0, 0.2627451, 1, 1,
0.234279, -0.1598399, 1.828112, 0, 0.254902, 1, 1,
0.2365868, 0.6793457, 1.549941, 0, 0.2509804, 1, 1,
0.238777, -1.319275, 1.56826, 0, 0.2431373, 1, 1,
0.243587, 0.2433652, 0.5945354, 0, 0.2392157, 1, 1,
0.245598, -0.3177774, 2.611338, 0, 0.2313726, 1, 1,
0.2465165, 1.928737, -0.8000435, 0, 0.227451, 1, 1,
0.2511826, 0.8063488, 0.8580586, 0, 0.2196078, 1, 1,
0.2516267, 0.5235023, 1.072282, 0, 0.2156863, 1, 1,
0.2543141, 0.7217374, 0.2082124, 0, 0.2078431, 1, 1,
0.2551114, -0.3560725, 1.319967, 0, 0.2039216, 1, 1,
0.2551913, 1.409182, 0.6094285, 0, 0.1960784, 1, 1,
0.2578925, 0.6303375, -0.3649551, 0, 0.1882353, 1, 1,
0.2636121, -0.9337157, 1.878417, 0, 0.1843137, 1, 1,
0.265347, -0.03612548, 1.042001, 0, 0.1764706, 1, 1,
0.2658264, -0.4984631, 3.206562, 0, 0.172549, 1, 1,
0.2695994, -0.08608196, 3.029372, 0, 0.1647059, 1, 1,
0.2742548, 0.5587897, 1.864363, 0, 0.1607843, 1, 1,
0.2751035, -0.7204053, 3.266142, 0, 0.1529412, 1, 1,
0.2860875, 0.1964668, 0.005009448, 0, 0.1490196, 1, 1,
0.2868012, 0.2547977, 1.706411, 0, 0.1411765, 1, 1,
0.2913719, 0.7654207, 2.262356, 0, 0.1372549, 1, 1,
0.2980269, 0.5188437, -1.390114, 0, 0.1294118, 1, 1,
0.3009582, -0.8832178, 2.085652, 0, 0.1254902, 1, 1,
0.3114268, 1.336773, -0.6181805, 0, 0.1176471, 1, 1,
0.3120679, 0.1725454, 1.421434, 0, 0.1137255, 1, 1,
0.3218496, 1.532361, -0.1772617, 0, 0.1058824, 1, 1,
0.3243777, -0.1693522, 1.034262, 0, 0.09803922, 1, 1,
0.3291908, 0.8024889, 1.891413, 0, 0.09411765, 1, 1,
0.3333152, 0.2824633, 0.9000031, 0, 0.08627451, 1, 1,
0.3336759, 0.6459835, 1.381153, 0, 0.08235294, 1, 1,
0.3439727, -1.007987, 3.657125, 0, 0.07450981, 1, 1,
0.344991, 0.5351036, 0.436851, 0, 0.07058824, 1, 1,
0.3503613, -0.6968086, 2.65101, 0, 0.0627451, 1, 1,
0.3541814, 0.2143801, 0.1253428, 0, 0.05882353, 1, 1,
0.369783, 1.194813, 0.8369526, 0, 0.05098039, 1, 1,
0.3799085, -0.1810697, 2.961651, 0, 0.04705882, 1, 1,
0.3799298, 0.8551883, 1.604233, 0, 0.03921569, 1, 1,
0.3821489, 0.2105235, 1.396393, 0, 0.03529412, 1, 1,
0.3850535, -0.2128464, 3.299114, 0, 0.02745098, 1, 1,
0.385338, 0.06430205, 0.9355293, 0, 0.02352941, 1, 1,
0.3855481, -0.008123081, 1.712777, 0, 0.01568628, 1, 1,
0.3862172, 0.9730329, 0.03633469, 0, 0.01176471, 1, 1,
0.388825, 1.579545, 1.913662, 0, 0.003921569, 1, 1,
0.3890707, -0.7476165, 2.64117, 0.003921569, 0, 1, 1,
0.3931484, 1.675732, 1.145987, 0.007843138, 0, 1, 1,
0.3941471, 1.348154, 0.01522806, 0.01568628, 0, 1, 1,
0.3950342, -1.459784, 2.545027, 0.01960784, 0, 1, 1,
0.4002255, 0.4296611, -0.1447997, 0.02745098, 0, 1, 1,
0.4115679, 0.3890991, 0.3124338, 0.03137255, 0, 1, 1,
0.4207562, 2.381318, 0.3022893, 0.03921569, 0, 1, 1,
0.4252118, 0.6066732, 3.784413, 0.04313726, 0, 1, 1,
0.4258466, 2.087517, -3.318418, 0.05098039, 0, 1, 1,
0.42669, 0.3251154, 0.939591, 0.05490196, 0, 1, 1,
0.4291175, 0.2357362, 0.4979984, 0.0627451, 0, 1, 1,
0.4295345, 1.136804, 0.5941592, 0.06666667, 0, 1, 1,
0.4316046, 0.2731705, 1.493889, 0.07450981, 0, 1, 1,
0.4325573, 0.4111173, 1.413191, 0.07843138, 0, 1, 1,
0.4342878, 0.08632701, -0.5159247, 0.08627451, 0, 1, 1,
0.4343355, -0.9340281, 2.460273, 0.09019608, 0, 1, 1,
0.4360447, 0.9993208, 1.608675, 0.09803922, 0, 1, 1,
0.4361346, -0.8934752, 2.696921, 0.1058824, 0, 1, 1,
0.4370192, 0.578347, 1.83186, 0.1098039, 0, 1, 1,
0.4412067, -0.75512, 2.759146, 0.1176471, 0, 1, 1,
0.4435131, -1.095014, 3.54076, 0.1215686, 0, 1, 1,
0.4494766, -0.6348883, 1.145289, 0.1294118, 0, 1, 1,
0.4507694, -0.05407016, 1.516325, 0.1333333, 0, 1, 1,
0.4512289, -1.017417, 3.06951, 0.1411765, 0, 1, 1,
0.455092, 0.4486254, 0.2420776, 0.145098, 0, 1, 1,
0.4552557, -0.1021606, 0.8189685, 0.1529412, 0, 1, 1,
0.456261, -1.019509, 2.943147, 0.1568628, 0, 1, 1,
0.4564501, -1.255293, 2.411219, 0.1647059, 0, 1, 1,
0.4571583, -0.337091, 2.722019, 0.1686275, 0, 1, 1,
0.4634958, 1.33473, 0.9487798, 0.1764706, 0, 1, 1,
0.4663961, 1.393127, -1.543092, 0.1803922, 0, 1, 1,
0.4702126, 0.8041679, 2.444963, 0.1882353, 0, 1, 1,
0.4717827, 0.93355, 0.6279495, 0.1921569, 0, 1, 1,
0.4725684, 1.182832, -0.5041247, 0.2, 0, 1, 1,
0.4753916, 0.3013933, 0.3847118, 0.2078431, 0, 1, 1,
0.4772603, 1.253426, -2.267736, 0.2117647, 0, 1, 1,
0.4788063, 0.5288405, 0.5872699, 0.2196078, 0, 1, 1,
0.4790854, -0.9893152, 2.846913, 0.2235294, 0, 1, 1,
0.4807315, 0.1406212, 2.450859, 0.2313726, 0, 1, 1,
0.4827053, 0.9647447, 0.4664817, 0.2352941, 0, 1, 1,
0.4837508, -0.0285356, 0.8838693, 0.2431373, 0, 1, 1,
0.4846627, -1.595127, 3.037686, 0.2470588, 0, 1, 1,
0.4849925, 2.681622, -0.6496416, 0.254902, 0, 1, 1,
0.4867913, 0.2732596, 1.972225, 0.2588235, 0, 1, 1,
0.4877345, 0.1702801, -0.5900823, 0.2666667, 0, 1, 1,
0.4909362, -1.679432, 4.120142, 0.2705882, 0, 1, 1,
0.4915336, -0.1036236, 2.357012, 0.2784314, 0, 1, 1,
0.4927833, -0.3463502, 3.077171, 0.282353, 0, 1, 1,
0.4938097, 0.6755731, -1.552607, 0.2901961, 0, 1, 1,
0.5059651, 0.1897494, 3.542163, 0.2941177, 0, 1, 1,
0.506559, -1.823419, 2.891636, 0.3019608, 0, 1, 1,
0.5242957, 0.07242055, 2.248425, 0.3098039, 0, 1, 1,
0.5271506, 0.9499876, -1.108287, 0.3137255, 0, 1, 1,
0.5271823, -0.1469033, -0.4652785, 0.3215686, 0, 1, 1,
0.5290884, 1.021944, 1.636247, 0.3254902, 0, 1, 1,
0.5315353, 0.8065037, 2.081805, 0.3333333, 0, 1, 1,
0.5333259, -0.5616715, 2.693863, 0.3372549, 0, 1, 1,
0.5362101, -1.205592, 1.692078, 0.345098, 0, 1, 1,
0.5374091, -0.7506574, 2.486418, 0.3490196, 0, 1, 1,
0.5376887, -0.5547285, -0.5117015, 0.3568628, 0, 1, 1,
0.5424419, -0.695238, 1.718462, 0.3607843, 0, 1, 1,
0.5463102, -0.8647854, 4.850149, 0.3686275, 0, 1, 1,
0.5478866, 1.878118, 1.266422, 0.372549, 0, 1, 1,
0.5541817, 0.7006457, 0.5563715, 0.3803922, 0, 1, 1,
0.5639063, 0.01245469, 1.610757, 0.3843137, 0, 1, 1,
0.5689958, -0.7255539, 3.460924, 0.3921569, 0, 1, 1,
0.5690941, -0.9678829, 3.135111, 0.3960784, 0, 1, 1,
0.5767214, -0.0969908, 1.237386, 0.4039216, 0, 1, 1,
0.5789528, -0.5139505, 1.88605, 0.4117647, 0, 1, 1,
0.5814967, 1.653258, 1.931776, 0.4156863, 0, 1, 1,
0.5916414, 1.215088, -0.539821, 0.4235294, 0, 1, 1,
0.5919846, -0.03226334, 2.307997, 0.427451, 0, 1, 1,
0.5973055, -0.4716615, 3.292404, 0.4352941, 0, 1, 1,
0.5988894, -1.476299, 2.011644, 0.4392157, 0, 1, 1,
0.59896, 1.263884, 0.4336801, 0.4470588, 0, 1, 1,
0.6010549, 1.0105, 0.296775, 0.4509804, 0, 1, 1,
0.6033106, -0.6385595, 1.982103, 0.4588235, 0, 1, 1,
0.6040735, 0.01342038, 1.290643, 0.4627451, 0, 1, 1,
0.6111104, -1.431643, 1.307491, 0.4705882, 0, 1, 1,
0.6114521, -1.829578, 1.677833, 0.4745098, 0, 1, 1,
0.6127385, 0.06022251, 1.78684, 0.4823529, 0, 1, 1,
0.6130993, -0.4683133, 0.7806881, 0.4862745, 0, 1, 1,
0.6185449, -0.5836049, 2.313037, 0.4941176, 0, 1, 1,
0.6207291, -0.7694523, 2.780863, 0.5019608, 0, 1, 1,
0.6227635, -3.356837, 1.700465, 0.5058824, 0, 1, 1,
0.6250308, -0.7162117, 2.332748, 0.5137255, 0, 1, 1,
0.6268189, 0.6448781, -0.5061253, 0.5176471, 0, 1, 1,
0.628325, 1.15121, 0.894571, 0.5254902, 0, 1, 1,
0.6364601, -0.4215576, 3.742375, 0.5294118, 0, 1, 1,
0.6394983, 0.2476792, 1.878217, 0.5372549, 0, 1, 1,
0.6397647, -0.8021109, 1.52916, 0.5411765, 0, 1, 1,
0.6515827, -0.8449292, 1.108148, 0.5490196, 0, 1, 1,
0.651759, -1.338965, 1.939759, 0.5529412, 0, 1, 1,
0.6518201, 0.6766799, 3.226615, 0.5607843, 0, 1, 1,
0.6592454, 0.02059836, 2.861218, 0.5647059, 0, 1, 1,
0.66978, -0.8577254, 2.981699, 0.572549, 0, 1, 1,
0.6718403, -0.190416, 1.475803, 0.5764706, 0, 1, 1,
0.6726082, 0.6253545, 0.3832399, 0.5843138, 0, 1, 1,
0.6843758, 1.435845, 1.926095, 0.5882353, 0, 1, 1,
0.6921301, -0.2313884, 0.8712277, 0.5960785, 0, 1, 1,
0.6970138, -0.05637592, 0.7807449, 0.6039216, 0, 1, 1,
0.7179863, -2.105093, 3.865693, 0.6078432, 0, 1, 1,
0.7194628, 0.5579709, -0.03153994, 0.6156863, 0, 1, 1,
0.7198426, 0.3439951, 2.525257, 0.6196079, 0, 1, 1,
0.7214786, 1.410141, 0.2616592, 0.627451, 0, 1, 1,
0.72175, 0.09668205, 2.334074, 0.6313726, 0, 1, 1,
0.7252065, -0.5912196, 3.9942, 0.6392157, 0, 1, 1,
0.7301372, 2.799527, 0.4133235, 0.6431373, 0, 1, 1,
0.7329065, 0.4499148, -0.0355637, 0.6509804, 0, 1, 1,
0.7366622, 0.1420911, 3.826069, 0.654902, 0, 1, 1,
0.7411424, -0.7680139, 2.992764, 0.6627451, 0, 1, 1,
0.7415959, -1.19289, 0.2926431, 0.6666667, 0, 1, 1,
0.7469233, -0.7095319, 1.390234, 0.6745098, 0, 1, 1,
0.7511234, -0.5442097, 3.474744, 0.6784314, 0, 1, 1,
0.7530631, -0.472529, 2.412835, 0.6862745, 0, 1, 1,
0.7542429, 0.64011, 1.924107, 0.6901961, 0, 1, 1,
0.7573864, -1.363935, 1.613999, 0.6980392, 0, 1, 1,
0.7598702, -0.06739016, 2.500122, 0.7058824, 0, 1, 1,
0.7610344, -0.5071321, 2.792657, 0.7098039, 0, 1, 1,
0.7616012, 0.5063614, 0.2916421, 0.7176471, 0, 1, 1,
0.7617088, 0.08960669, 2.451236, 0.7215686, 0, 1, 1,
0.7652605, -0.4928523, 3.91996, 0.7294118, 0, 1, 1,
0.7654995, 0.2730469, 0.8859258, 0.7333333, 0, 1, 1,
0.7716856, 1.493612, -0.1283985, 0.7411765, 0, 1, 1,
0.7732839, -0.5309922, 3.425808, 0.7450981, 0, 1, 1,
0.7760661, -0.5553985, 1.373289, 0.7529412, 0, 1, 1,
0.7884523, -1.600314, 1.969313, 0.7568628, 0, 1, 1,
0.7894896, -0.6766396, 1.925624, 0.7647059, 0, 1, 1,
0.7905406, 0.4325325, 0.1989042, 0.7686275, 0, 1, 1,
0.7911495, -0.5849728, 1.543904, 0.7764706, 0, 1, 1,
0.791766, 0.6147507, 0.2436554, 0.7803922, 0, 1, 1,
0.7951969, 1.161282, -0.8743016, 0.7882353, 0, 1, 1,
0.8029975, 0.9757801, 1.797678, 0.7921569, 0, 1, 1,
0.8171073, -0.8347477, 1.725095, 0.8, 0, 1, 1,
0.8240365, -0.1525436, -0.5790913, 0.8078431, 0, 1, 1,
0.8257188, 0.2722078, 1.516925, 0.8117647, 0, 1, 1,
0.8266691, -1.160704, 1.652517, 0.8196079, 0, 1, 1,
0.8271125, 0.9872469, 0.07353627, 0.8235294, 0, 1, 1,
0.8287721, 1.152032, 0.6153992, 0.8313726, 0, 1, 1,
0.8310171, 0.2476819, 2.955222, 0.8352941, 0, 1, 1,
0.8340425, -1.175475, 3.592217, 0.8431373, 0, 1, 1,
0.8384771, -2.270458, 1.91227, 0.8470588, 0, 1, 1,
0.8447677, -0.6296586, 2.506776, 0.854902, 0, 1, 1,
0.8474783, 2.111186, 0.1082409, 0.8588235, 0, 1, 1,
0.8546833, 0.0002477226, 1.100437, 0.8666667, 0, 1, 1,
0.8552613, 1.283462, 0.02394042, 0.8705882, 0, 1, 1,
0.8568095, 0.5642464, 1.10306, 0.8784314, 0, 1, 1,
0.8659213, 0.5989391, 1.497617, 0.8823529, 0, 1, 1,
0.8721084, 0.004975121, 1.094213, 0.8901961, 0, 1, 1,
0.8754469, -0.6304296, 1.121728, 0.8941177, 0, 1, 1,
0.883729, -0.001859337, 2.078726, 0.9019608, 0, 1, 1,
0.8853813, 0.02463914, 3.12224, 0.9098039, 0, 1, 1,
0.8857886, -0.7577395, 1.167801, 0.9137255, 0, 1, 1,
0.889949, 1.721669, -0.6765343, 0.9215686, 0, 1, 1,
0.896359, -0.3208249, 0.752349, 0.9254902, 0, 1, 1,
0.9014603, 0.6933635, 0.5492376, 0.9333333, 0, 1, 1,
0.9092762, -0.5485771, 3.006503, 0.9372549, 0, 1, 1,
0.9117329, -0.110094, 0.8243579, 0.945098, 0, 1, 1,
0.9161016, -0.5112811, 2.173928, 0.9490196, 0, 1, 1,
0.9161077, 0.005137117, 0.5819178, 0.9568627, 0, 1, 1,
0.9201142, -0.5430381, 1.825046, 0.9607843, 0, 1, 1,
0.9233611, -0.3286201, 2.647317, 0.9686275, 0, 1, 1,
0.9246774, 1.523691, 1.448822, 0.972549, 0, 1, 1,
0.9280332, 0.6242594, 1.173208, 0.9803922, 0, 1, 1,
0.9280683, 0.661478, -0.4980756, 0.9843137, 0, 1, 1,
0.9327225, 0.549948, 0.6963543, 0.9921569, 0, 1, 1,
0.9372675, -0.8283317, 4.130948, 0.9960784, 0, 1, 1,
0.939635, 2.774492, -0.6774024, 1, 0, 0.9960784, 1,
0.9407285, -0.1373381, 0.9048135, 1, 0, 0.9882353, 1,
0.9423416, -0.8074664, 3.818939, 1, 0, 0.9843137, 1,
0.9428928, 0.08606856, 1.213989, 1, 0, 0.9764706, 1,
0.9445643, -0.1975527, 2.536346, 1, 0, 0.972549, 1,
0.9450236, -0.1127138, 1.407664, 1, 0, 0.9647059, 1,
0.9494199, -0.3887452, 1.860447, 1, 0, 0.9607843, 1,
0.9510621, -1.080625, 2.121459, 1, 0, 0.9529412, 1,
0.9563187, 0.5264199, 0.2530524, 1, 0, 0.9490196, 1,
0.9571881, -0.2537202, 0.6803281, 1, 0, 0.9411765, 1,
0.9599943, 0.4276884, 1.739826, 1, 0, 0.9372549, 1,
0.9628915, -0.1479366, 2.461603, 1, 0, 0.9294118, 1,
0.9639298, -0.1327859, 2.571909, 1, 0, 0.9254902, 1,
0.9728113, 0.9567618, 2.607803, 1, 0, 0.9176471, 1,
0.9788503, -0.08173297, 3.070083, 1, 0, 0.9137255, 1,
0.9825677, 0.7108842, 0.4743908, 1, 0, 0.9058824, 1,
0.9826233, 2.127945, 0.7257826, 1, 0, 0.9019608, 1,
0.9879324, 0.276245, -0.4370406, 1, 0, 0.8941177, 1,
0.9903496, -0.06116737, 1.202113, 1, 0, 0.8862745, 1,
1.002069, -0.1560919, 2.735213, 1, 0, 0.8823529, 1,
1.002849, 0.825955, -0.9920964, 1, 0, 0.8745098, 1,
1.012418, 1.104561, 0.9891699, 1, 0, 0.8705882, 1,
1.013341, -0.03722925, 2.739307, 1, 0, 0.8627451, 1,
1.020549, -2.870615, 3.260974, 1, 0, 0.8588235, 1,
1.026527, 0.709137, 0.2867628, 1, 0, 0.8509804, 1,
1.031324, -1.598182, 2.813078, 1, 0, 0.8470588, 1,
1.031617, 0.03093458, 3.143244, 1, 0, 0.8392157, 1,
1.035353, -0.7042413, 2.615658, 1, 0, 0.8352941, 1,
1.037579, -0.4888461, 2.273356, 1, 0, 0.827451, 1,
1.039749, -1.575693, 4.520698, 1, 0, 0.8235294, 1,
1.041388, -1.431833, 2.817811, 1, 0, 0.8156863, 1,
1.046153, 1.941716, 0.8741809, 1, 0, 0.8117647, 1,
1.047317, 0.0204716, 1.226177, 1, 0, 0.8039216, 1,
1.047643, 0.01105151, 2.800913, 1, 0, 0.7960784, 1,
1.049807, -0.924061, 2.034171, 1, 0, 0.7921569, 1,
1.051372, -1.139766, 1.773685, 1, 0, 0.7843137, 1,
1.05739, -0.6686606, 1.347242, 1, 0, 0.7803922, 1,
1.05814, -0.1229043, 1.688287, 1, 0, 0.772549, 1,
1.059394, 0.1738583, -0.8463117, 1, 0, 0.7686275, 1,
1.074293, 0.05839038, 1.853039, 1, 0, 0.7607843, 1,
1.079868, 0.06238568, 0.5762879, 1, 0, 0.7568628, 1,
1.081495, 0.02185761, -0.6982701, 1, 0, 0.7490196, 1,
1.081819, -0.2546336, 1.549112, 1, 0, 0.7450981, 1,
1.084143, 0.7597795, 0.5970028, 1, 0, 0.7372549, 1,
1.085914, -1.034273, 1.634264, 1, 0, 0.7333333, 1,
1.092124, 0.1832475, 0.3262602, 1, 0, 0.7254902, 1,
1.095773, -0.1766294, 2.176224, 1, 0, 0.7215686, 1,
1.100545, -0.7372442, 3.975922, 1, 0, 0.7137255, 1,
1.107541, 0.3815657, 0.366277, 1, 0, 0.7098039, 1,
1.114169, -1.162727, 1.436982, 1, 0, 0.7019608, 1,
1.11735, -1.07147, 2.947896, 1, 0, 0.6941177, 1,
1.119107, 1.826793, 0.9260216, 1, 0, 0.6901961, 1,
1.119418, -0.49528, 1.788382, 1, 0, 0.682353, 1,
1.126925, 0.6510634, 2.116633, 1, 0, 0.6784314, 1,
1.127087, -0.4925617, 3.556741, 1, 0, 0.6705883, 1,
1.130126, 0.5749254, -0.7968162, 1, 0, 0.6666667, 1,
1.147072, -0.07695307, 1.167852, 1, 0, 0.6588235, 1,
1.152293, 2.849304, 1.244376, 1, 0, 0.654902, 1,
1.15403, -0.8625455, -0.1214564, 1, 0, 0.6470588, 1,
1.154843, 1.501774, 0.3981304, 1, 0, 0.6431373, 1,
1.15594, 1.86118, 0.6071705, 1, 0, 0.6352941, 1,
1.15654, -2.101951, 2.898543, 1, 0, 0.6313726, 1,
1.158792, -1.326372, 3.42115, 1, 0, 0.6235294, 1,
1.166089, 1.349066, 1.900773, 1, 0, 0.6196079, 1,
1.17395, 1.097926, 1.843437, 1, 0, 0.6117647, 1,
1.175354, 0.8981121, 0.01107372, 1, 0, 0.6078432, 1,
1.177539, -1.51413, 1.226108, 1, 0, 0.6, 1,
1.17838, -2.00078, 3.0024, 1, 0, 0.5921569, 1,
1.179527, -0.7354593, 2.289045, 1, 0, 0.5882353, 1,
1.185626, -0.7457619, 2.410454, 1, 0, 0.5803922, 1,
1.185855, 1.59781, -0.9944197, 1, 0, 0.5764706, 1,
1.199089, 1.921628, 0.6750595, 1, 0, 0.5686275, 1,
1.201008, -0.2481045, 1.983777, 1, 0, 0.5647059, 1,
1.203042, 0.03272616, 0.6403227, 1, 0, 0.5568628, 1,
1.214652, -0.3461604, 2.005832, 1, 0, 0.5529412, 1,
1.22394, -0.6268972, 2.226581, 1, 0, 0.5450981, 1,
1.229229, 0.339994, 1.129184, 1, 0, 0.5411765, 1,
1.230417, 0.8212404, -0.1884094, 1, 0, 0.5333334, 1,
1.250713, 0.0006072344, 3.818951, 1, 0, 0.5294118, 1,
1.251892, 0.9656401, 0.7765174, 1, 0, 0.5215687, 1,
1.254038, -0.5899336, 2.224478, 1, 0, 0.5176471, 1,
1.255455, -0.65358, 0.427108, 1, 0, 0.509804, 1,
1.257433, -0.5558321, -0.5390468, 1, 0, 0.5058824, 1,
1.261082, -1.648279, 1.296978, 1, 0, 0.4980392, 1,
1.2791, -0.2825548, 1.881234, 1, 0, 0.4901961, 1,
1.293258, 0.7906941, 1.486366, 1, 0, 0.4862745, 1,
1.294647, 0.7559803, 2.143987, 1, 0, 0.4784314, 1,
1.297979, -0.1983338, 1.432303, 1, 0, 0.4745098, 1,
1.299151, 0.6861966, 0.9309402, 1, 0, 0.4666667, 1,
1.307523, -1.16169, 2.64613, 1, 0, 0.4627451, 1,
1.313609, -0.9293951, 1.349562, 1, 0, 0.454902, 1,
1.316665, 0.2846071, 1.032133, 1, 0, 0.4509804, 1,
1.32401, 1.40964, 1.574577, 1, 0, 0.4431373, 1,
1.324374, -0.8716112, 0.3820656, 1, 0, 0.4392157, 1,
1.326055, 0.3392795, 2.289919, 1, 0, 0.4313726, 1,
1.327018, -0.4933941, 1.471875, 1, 0, 0.427451, 1,
1.328046, -1.510068, 3.158919, 1, 0, 0.4196078, 1,
1.336891, 2.030803, 0.4332302, 1, 0, 0.4156863, 1,
1.354758, -0.6890739, 0.5304806, 1, 0, 0.4078431, 1,
1.358341, -0.1305736, 1.59942, 1, 0, 0.4039216, 1,
1.360748, -0.5970961, 2.094444, 1, 0, 0.3960784, 1,
1.371011, -1.312815, 1.464733, 1, 0, 0.3882353, 1,
1.40801, 0.2132729, 0.3404986, 1, 0, 0.3843137, 1,
1.411662, -2.862096, 2.579468, 1, 0, 0.3764706, 1,
1.420299, 0.952786, 0.7315738, 1, 0, 0.372549, 1,
1.429497, 0.4893213, 0.7657584, 1, 0, 0.3647059, 1,
1.436032, 0.5772066, -0.1362658, 1, 0, 0.3607843, 1,
1.441088, -0.2362914, 2.621923, 1, 0, 0.3529412, 1,
1.455488, -0.9776224, 0.3539833, 1, 0, 0.3490196, 1,
1.459972, -1.458248, 3.800163, 1, 0, 0.3411765, 1,
1.465375, 1.046258, 0.6793037, 1, 0, 0.3372549, 1,
1.477006, -0.6210977, 3.044478, 1, 0, 0.3294118, 1,
1.490689, 0.8381507, -0.2711231, 1, 0, 0.3254902, 1,
1.494248, -0.4541407, 2.342182, 1, 0, 0.3176471, 1,
1.49728, 0.003739476, -1.019552, 1, 0, 0.3137255, 1,
1.498045, 0.2230904, 0.3629201, 1, 0, 0.3058824, 1,
1.501808, -1.115154, 2.570033, 1, 0, 0.2980392, 1,
1.520996, -0.796806, 1.892043, 1, 0, 0.2941177, 1,
1.574896, -0.325966, 2.136463, 1, 0, 0.2862745, 1,
1.596284, -0.7847133, 2.509026, 1, 0, 0.282353, 1,
1.601171, 0.1895379, -0.9599784, 1, 0, 0.2745098, 1,
1.601282, 0.3618141, -0.4096808, 1, 0, 0.2705882, 1,
1.608078, -1.440321, 2.233614, 1, 0, 0.2627451, 1,
1.617629, -0.9424939, 2.471113, 1, 0, 0.2588235, 1,
1.624434, 0.3820916, 2.295785, 1, 0, 0.2509804, 1,
1.625767, -0.989415, 2.803641, 1, 0, 0.2470588, 1,
1.632025, 0.2196092, 0.8399634, 1, 0, 0.2392157, 1,
1.648667, -0.968951, 0.9400001, 1, 0, 0.2352941, 1,
1.665615, -0.09370596, 0.8843663, 1, 0, 0.227451, 1,
1.667766, -0.718033, 0.3964774, 1, 0, 0.2235294, 1,
1.701837, -1.211366, 2.311717, 1, 0, 0.2156863, 1,
1.723551, -0.6667985, -0.1931403, 1, 0, 0.2117647, 1,
1.729362, 1.501167, 0.6689342, 1, 0, 0.2039216, 1,
1.752782, -0.4389751, 3.460069, 1, 0, 0.1960784, 1,
1.765018, -0.08869239, 1.380043, 1, 0, 0.1921569, 1,
1.770096, -0.6880272, 2.921731, 1, 0, 0.1843137, 1,
1.774631, -2.85459, 3.143567, 1, 0, 0.1803922, 1,
1.789895, 0.4386671, 0.3634141, 1, 0, 0.172549, 1,
1.826038, -1.452418, 2.024658, 1, 0, 0.1686275, 1,
1.836489, -0.9342451, 3.83632, 1, 0, 0.1607843, 1,
1.841591, -0.8420293, 2.90436, 1, 0, 0.1568628, 1,
1.846182, -0.08036451, 0.4359805, 1, 0, 0.1490196, 1,
1.875213, -0.7979692, 1.206092, 1, 0, 0.145098, 1,
1.886231, -0.387842, 1.541873, 1, 0, 0.1372549, 1,
1.911711, -0.7328219, 1.805112, 1, 0, 0.1333333, 1,
1.913689, 0.395834, 2.557927, 1, 0, 0.1254902, 1,
1.925935, 0.5725728, 0.04046683, 1, 0, 0.1215686, 1,
1.929537, 0.3823591, 0.8629242, 1, 0, 0.1137255, 1,
1.963279, -0.6210488, 1.747269, 1, 0, 0.1098039, 1,
1.978197, -2.357048, 1.517589, 1, 0, 0.1019608, 1,
2.041976, 0.434761, 1.022146, 1, 0, 0.09411765, 1,
2.042764, 1.813774, -0.06875792, 1, 0, 0.09019608, 1,
2.078315, 1.386667, 0.3900834, 1, 0, 0.08235294, 1,
2.091572, -0.0436423, 1.44277, 1, 0, 0.07843138, 1,
2.105217, -0.1709728, 0.1832512, 1, 0, 0.07058824, 1,
2.254647, 0.4796079, 1.781656, 1, 0, 0.06666667, 1,
2.395089, -1.022987, 1.556871, 1, 0, 0.05882353, 1,
2.44123, 1.333818, 0.7629305, 1, 0, 0.05490196, 1,
2.444137, 0.3659851, 0.2097683, 1, 0, 0.04705882, 1,
2.564036, -1.061747, 2.848635, 1, 0, 0.04313726, 1,
2.573225, -0.1382314, 1.764373, 1, 0, 0.03529412, 1,
2.582975, -0.1140367, 0.8663125, 1, 0, 0.03137255, 1,
2.614805, 0.6218541, 1.003127, 1, 0, 0.02352941, 1,
2.835388, -0.7197353, 1.958898, 1, 0, 0.01960784, 1,
2.861316, 0.3300605, 1.190926, 1, 0, 0.01176471, 1,
3.228474, 0.2574458, 2.079755, 1, 0, 0.007843138, 1
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
-0.03709733, -4.457465, -7.169053, 0, -0.5, 0.5, 0.5,
-0.03709733, -4.457465, -7.169053, 1, -0.5, 0.5, 0.5,
-0.03709733, -4.457465, -7.169053, 1, 1.5, 0.5, 0.5,
-0.03709733, -4.457465, -7.169053, 0, 1.5, 0.5, 0.5
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
-4.409698, -0.1101464, -7.169053, 0, -0.5, 0.5, 0.5,
-4.409698, -0.1101464, -7.169053, 1, -0.5, 0.5, 0.5,
-4.409698, -0.1101464, -7.169053, 1, 1.5, 0.5, 0.5,
-4.409698, -0.1101464, -7.169053, 0, 1.5, 0.5, 0.5
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
-4.409698, -4.457465, -0.2884581, 0, -0.5, 0.5, 0.5,
-4.409698, -4.457465, -0.2884581, 1, -0.5, 0.5, 0.5,
-4.409698, -4.457465, -0.2884581, 1, 1.5, 0.5, 0.5,
-4.409698, -4.457465, -0.2884581, 0, 1.5, 0.5, 0.5
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
-3, -3.454237, -5.581223,
3, -3.454237, -5.581223,
-3, -3.454237, -5.581223,
-3, -3.621442, -5.845861,
-2, -3.454237, -5.581223,
-2, -3.621442, -5.845861,
-1, -3.454237, -5.581223,
-1, -3.621442, -5.845861,
0, -3.454237, -5.581223,
0, -3.621442, -5.845861,
1, -3.454237, -5.581223,
1, -3.621442, -5.845861,
2, -3.454237, -5.581223,
2, -3.621442, -5.845861,
3, -3.454237, -5.581223,
3, -3.621442, -5.845861
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
-3, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
-3, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
-3, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
-3, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
-2, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
-2, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
-2, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
-2, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
-1, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
-1, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
-1, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
-1, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
0, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
0, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
0, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
0, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
1, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
1, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
1, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
1, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
2, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
2, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
2, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
2, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5,
3, -3.955851, -6.375138, 0, -0.5, 0.5, 0.5,
3, -3.955851, -6.375138, 1, -0.5, 0.5, 0.5,
3, -3.955851, -6.375138, 1, 1.5, 0.5, 0.5,
3, -3.955851, -6.375138, 0, 1.5, 0.5, 0.5
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
-3.400636, -3, -5.581223,
-3.400636, 3, -5.581223,
-3.400636, -3, -5.581223,
-3.568813, -3, -5.845861,
-3.400636, -2, -5.581223,
-3.568813, -2, -5.845861,
-3.400636, -1, -5.581223,
-3.568813, -1, -5.845861,
-3.400636, 0, -5.581223,
-3.568813, 0, -5.845861,
-3.400636, 1, -5.581223,
-3.568813, 1, -5.845861,
-3.400636, 2, -5.581223,
-3.568813, 2, -5.845861,
-3.400636, 3, -5.581223,
-3.568813, 3, -5.845861
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
-3.905167, -3, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, -3, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, -3, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, -3, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, -2, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, -2, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, -2, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, -2, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, -1, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, -1, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, -1, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, -1, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, 0, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, 0, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, 0, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, 0, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, 1, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, 1, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, 1, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, 1, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, 2, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, 2, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, 2, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, 2, -6.375138, 0, 1.5, 0.5, 0.5,
-3.905167, 3, -6.375138, 0, -0.5, 0.5, 0.5,
-3.905167, 3, -6.375138, 1, -0.5, 0.5, 0.5,
-3.905167, 3, -6.375138, 1, 1.5, 0.5, 0.5,
-3.905167, 3, -6.375138, 0, 1.5, 0.5, 0.5
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
-3.400636, -3.454237, -4,
-3.400636, -3.454237, 4,
-3.400636, -3.454237, -4,
-3.568813, -3.621442, -4,
-3.400636, -3.454237, -2,
-3.568813, -3.621442, -2,
-3.400636, -3.454237, 0,
-3.568813, -3.621442, 0,
-3.400636, -3.454237, 2,
-3.568813, -3.621442, 2,
-3.400636, -3.454237, 4,
-3.568813, -3.621442, 4
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
-3.905167, -3.955851, -4, 0, -0.5, 0.5, 0.5,
-3.905167, -3.955851, -4, 1, -0.5, 0.5, 0.5,
-3.905167, -3.955851, -4, 1, 1.5, 0.5, 0.5,
-3.905167, -3.955851, -4, 0, 1.5, 0.5, 0.5,
-3.905167, -3.955851, -2, 0, -0.5, 0.5, 0.5,
-3.905167, -3.955851, -2, 1, -0.5, 0.5, 0.5,
-3.905167, -3.955851, -2, 1, 1.5, 0.5, 0.5,
-3.905167, -3.955851, -2, 0, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 0, 0, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 0, 1, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 0, 1, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 0, 0, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 2, 0, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 2, 1, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 2, 1, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 2, 0, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 4, 0, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 4, 1, -0.5, 0.5, 0.5,
-3.905167, -3.955851, 4, 1, 1.5, 0.5, 0.5,
-3.905167, -3.955851, 4, 0, 1.5, 0.5, 0.5
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
-3.400636, -3.454237, -5.581223,
-3.400636, 3.233945, -5.581223,
-3.400636, -3.454237, 5.004307,
-3.400636, 3.233945, 5.004307,
-3.400636, -3.454237, -5.581223,
-3.400636, -3.454237, 5.004307,
-3.400636, 3.233945, -5.581223,
-3.400636, 3.233945, 5.004307,
-3.400636, -3.454237, -5.581223,
3.326442, -3.454237, -5.581223,
-3.400636, -3.454237, 5.004307,
3.326442, -3.454237, 5.004307,
-3.400636, 3.233945, -5.581223,
3.326442, 3.233945, -5.581223,
-3.400636, 3.233945, 5.004307,
3.326442, 3.233945, 5.004307,
3.326442, -3.454237, -5.581223,
3.326442, 3.233945, -5.581223,
3.326442, -3.454237, 5.004307,
3.326442, 3.233945, 5.004307,
3.326442, -3.454237, -5.581223,
3.326442, -3.454237, 5.004307,
3.326442, 3.233945, -5.581223,
3.326442, 3.233945, 5.004307
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
var radius = 7.590019;
var distance = 33.76885;
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
mvMatrix.translate( 0.03709733, 0.1101464, 0.2884581 );
mvMatrix.scale( 1.219917, 1.227012, 0.7752542 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76885);
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
Acephate<-read.table("Acephate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Acephate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Acephate' not found
```

```r
y<-Acephate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Acephate' not found
```

```r
z<-Acephate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Acephate' not found
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
-3.302669, 1.067643, -1.19182, 0, 0, 1, 1, 1,
-3.142587, -0.1113451, -1.365095, 1, 0, 0, 1, 1,
-2.898725, 0.1832177, -2.001252, 1, 0, 0, 1, 1,
-2.816045, 1.258607, -1.091186, 1, 0, 0, 1, 1,
-2.744552, 1.954919, -0.7734929, 1, 0, 0, 1, 1,
-2.515321, -1.773654, -2.405617, 1, 0, 0, 1, 1,
-2.482898, -0.3048511, -0.1730928, 0, 0, 0, 1, 1,
-2.478162, -0.9077644, -2.188989, 0, 0, 0, 1, 1,
-2.335597, -0.4662119, -2.84081, 0, 0, 0, 1, 1,
-2.333981, -0.634939, -1.06233, 0, 0, 0, 1, 1,
-2.3247, 0.5204893, -0.6727703, 0, 0, 0, 1, 1,
-2.310911, 0.3978606, -1.818626, 0, 0, 0, 1, 1,
-2.227736, -1.799664, -2.263133, 0, 0, 0, 1, 1,
-2.222528, -1.927889, -3.853005, 1, 1, 1, 1, 1,
-2.215499, 0.3407971, -0.8444639, 1, 1, 1, 1, 1,
-2.20648, -0.9135395, -2.166174, 1, 1, 1, 1, 1,
-2.152055, -0.002308203, -1.379742, 1, 1, 1, 1, 1,
-2.119775, -1.329369, -2.062471, 1, 1, 1, 1, 1,
-2.116514, 0.6124848, -2.110791, 1, 1, 1, 1, 1,
-2.112948, -2.133616, -1.096594, 1, 1, 1, 1, 1,
-2.107144, -1.117425, -2.981715, 1, 1, 1, 1, 1,
-2.085767, 0.3047537, -0.3599826, 1, 1, 1, 1, 1,
-2.07184, -1.689562, -0.747124, 1, 1, 1, 1, 1,
-2.070785, 1.176419, -0.2382407, 1, 1, 1, 1, 1,
-2.032172, -0.9338911, -2.945681, 1, 1, 1, 1, 1,
-2.017257, 0.2322031, -2.003035, 1, 1, 1, 1, 1,
-2.00488, -0.8564412, -1.564792, 1, 1, 1, 1, 1,
-1.987446, 1.864924, -1.479406, 1, 1, 1, 1, 1,
-1.962505, 0.4766606, -1.745106, 0, 0, 1, 1, 1,
-1.949083, -1.199352, -2.393583, 1, 0, 0, 1, 1,
-1.908974, -0.4653074, -2.273869, 1, 0, 0, 1, 1,
-1.905493, 0.01528533, -0.8176377, 1, 0, 0, 1, 1,
-1.892928, 1.203468, -0.7747356, 1, 0, 0, 1, 1,
-1.889813, 0.2444932, -1.315363, 1, 0, 0, 1, 1,
-1.874406, -2.099792, -2.420719, 0, 0, 0, 1, 1,
-1.867993, 0.445174, -2.235049, 0, 0, 0, 1, 1,
-1.817959, 0.4884619, -1.156427, 0, 0, 0, 1, 1,
-1.803106, 0.04874626, -2.0051, 0, 0, 0, 1, 1,
-1.802853, 0.003087549, -0.5174814, 0, 0, 0, 1, 1,
-1.797592, 0.8083292, -1.497456, 0, 0, 0, 1, 1,
-1.775494, 0.1811863, -0.8730441, 0, 0, 0, 1, 1,
-1.743305, -0.1862307, -2.495087, 1, 1, 1, 1, 1,
-1.739494, -0.1632226, 0.4167882, 1, 1, 1, 1, 1,
-1.72382, -0.9839094, -1.72211, 1, 1, 1, 1, 1,
-1.715758, 0.5913404, -0.8294616, 1, 1, 1, 1, 1,
-1.705055, -1.051169, -1.135774, 1, 1, 1, 1, 1,
-1.704425, 0.542632, 0.003520843, 1, 1, 1, 1, 1,
-1.703722, -0.5811679, -0.3378674, 1, 1, 1, 1, 1,
-1.699435, -0.6663383, -2.481916, 1, 1, 1, 1, 1,
-1.694296, -0.8604614, -0.2645499, 1, 1, 1, 1, 1,
-1.690396, -0.840531, -1.550349, 1, 1, 1, 1, 1,
-1.689672, -1.0736, -2.263298, 1, 1, 1, 1, 1,
-1.687472, 0.5457057, -1.36385, 1, 1, 1, 1, 1,
-1.671481, 0.07350628, -1.175184, 1, 1, 1, 1, 1,
-1.670132, -0.2380056, -0.1773844, 1, 1, 1, 1, 1,
-1.666861, -0.486117, -1.811281, 1, 1, 1, 1, 1,
-1.662852, 0.6220572, 0.3059638, 0, 0, 1, 1, 1,
-1.65719, 0.3361672, -1.66802, 1, 0, 0, 1, 1,
-1.644453, -0.3462898, 0.570552, 1, 0, 0, 1, 1,
-1.640593, 1.134323, 0.2680607, 1, 0, 0, 1, 1,
-1.635983, 0.9610156, -3.05894, 1, 0, 0, 1, 1,
-1.632181, 0.5974584, -1.967428, 1, 0, 0, 1, 1,
-1.629277, -1.140778, 0.2034016, 0, 0, 0, 1, 1,
-1.623763, -0.8920326, -1.582227, 0, 0, 0, 1, 1,
-1.601156, -0.2461411, -1.793387, 0, 0, 0, 1, 1,
-1.544917, 0.224664, -1.491383, 0, 0, 0, 1, 1,
-1.524581, 0.412388, -0.390066, 0, 0, 0, 1, 1,
-1.521039, -0.8344173, -1.672693, 0, 0, 0, 1, 1,
-1.520629, 0.2975283, -1.050337, 0, 0, 0, 1, 1,
-1.514599, -0.9628688, -0.9818297, 1, 1, 1, 1, 1,
-1.511286, -1.277964, -2.813416, 1, 1, 1, 1, 1,
-1.511205, -0.6039576, 0.2379201, 1, 1, 1, 1, 1,
-1.510005, -1.19007, -2.545979, 1, 1, 1, 1, 1,
-1.508896, -0.6120073, -1.892449, 1, 1, 1, 1, 1,
-1.491789, -3.049319, -2.1423, 1, 1, 1, 1, 1,
-1.47902, 0.8075069, -2.72135, 1, 1, 1, 1, 1,
-1.470905, 0.4733072, -2.165886, 1, 1, 1, 1, 1,
-1.461216, 0.7223824, -1.398904, 1, 1, 1, 1, 1,
-1.454016, 0.8801486, -3.05257, 1, 1, 1, 1, 1,
-1.443391, 0.4550469, -0.2525287, 1, 1, 1, 1, 1,
-1.439075, 0.1397568, -2.028274, 1, 1, 1, 1, 1,
-1.431481, 2.385213, -1.22164, 1, 1, 1, 1, 1,
-1.427969, -1.137179, -2.513196, 1, 1, 1, 1, 1,
-1.423357, 0.2901932, -3.184211, 1, 1, 1, 1, 1,
-1.411395, 0.5075976, -0.5434674, 0, 0, 1, 1, 1,
-1.403492, -0.5389408, -0.6801468, 1, 0, 0, 1, 1,
-1.403028, -1.573607, -1.541202, 1, 0, 0, 1, 1,
-1.400173, -1.088299, -1.198562, 1, 0, 0, 1, 1,
-1.389082, 1.416257, -3.477975, 1, 0, 0, 1, 1,
-1.387232, 0.0588567, -1.226273, 1, 0, 0, 1, 1,
-1.384912, -0.4939493, -3.304338, 0, 0, 0, 1, 1,
-1.38443, 0.1243945, -0.855517, 0, 0, 0, 1, 1,
-1.379948, 2.682249, -0.3785686, 0, 0, 0, 1, 1,
-1.371741, 1.288839, -0.3356755, 0, 0, 0, 1, 1,
-1.363833, -0.009658472, 0.02192236, 0, 0, 0, 1, 1,
-1.362726, 1.787187, -1.081753, 0, 0, 0, 1, 1,
-1.350307, -1.999205, -3.321027, 0, 0, 0, 1, 1,
-1.349222, -0.08616219, -1.473686, 1, 1, 1, 1, 1,
-1.347525, -0.1322726, -2.631518, 1, 1, 1, 1, 1,
-1.34571, -0.4854657, -2.666182, 1, 1, 1, 1, 1,
-1.343304, -1.026266, -0.7977442, 1, 1, 1, 1, 1,
-1.340264, -0.7943347, -1.740885, 1, 1, 1, 1, 1,
-1.340168, 0.3569474, -2.998283, 1, 1, 1, 1, 1,
-1.323521, 0.4529005, 1.082873, 1, 1, 1, 1, 1,
-1.311113, -0.5162265, -3.268176, 1, 1, 1, 1, 1,
-1.309479, -1.028894, -1.683726, 1, 1, 1, 1, 1,
-1.307107, -0.4318265, -2.598226, 1, 1, 1, 1, 1,
-1.294918, 0.531046, -0.1335417, 1, 1, 1, 1, 1,
-1.28321, -1.751595, -1.289156, 1, 1, 1, 1, 1,
-1.281706, 1.733064, -0.01342815, 1, 1, 1, 1, 1,
-1.277946, -0.06616306, -1.565759, 1, 1, 1, 1, 1,
-1.269747, 0.3691004, -2.51222, 1, 1, 1, 1, 1,
-1.266904, 0.737034, 0.5947512, 0, 0, 1, 1, 1,
-1.237161, 0.04515532, 1.182237, 1, 0, 0, 1, 1,
-1.233514, 0.4264525, -1.927683, 1, 0, 0, 1, 1,
-1.231781, 0.05361453, -1.840074, 1, 0, 0, 1, 1,
-1.231007, -1.449261, -1.444761, 1, 0, 0, 1, 1,
-1.230612, 1.164867, -0.8864347, 1, 0, 0, 1, 1,
-1.227433, -1.148032, -2.5373, 0, 0, 0, 1, 1,
-1.219039, -0.2478194, -0.9395681, 0, 0, 0, 1, 1,
-1.217149, 0.3953927, -0.9162355, 0, 0, 0, 1, 1,
-1.210464, 0.3616661, -1.766256, 0, 0, 0, 1, 1,
-1.210291, -0.2132959, -1.425563, 0, 0, 0, 1, 1,
-1.208425, 0.245471, -1.143018, 0, 0, 0, 1, 1,
-1.192779, 0.6373708, -2.262623, 0, 0, 0, 1, 1,
-1.192048, -1.57866, -3.154574, 1, 1, 1, 1, 1,
-1.189122, -1.125744, -1.907321, 1, 1, 1, 1, 1,
-1.187376, 0.2885177, -1.562441, 1, 1, 1, 1, 1,
-1.186898, -0.1896289, 1.077211, 1, 1, 1, 1, 1,
-1.172074, -1.82134, -4.087065, 1, 1, 1, 1, 1,
-1.161428, -1.250935, -0.3166414, 1, 1, 1, 1, 1,
-1.159908, -0.6370453, -3.056103, 1, 1, 1, 1, 1,
-1.150833, 0.5594922, -0.474236, 1, 1, 1, 1, 1,
-1.147039, -0.9816403, -2.563539, 1, 1, 1, 1, 1,
-1.143611, 1.210467, -2.367596, 1, 1, 1, 1, 1,
-1.130555, -0.3323414, -0.8810043, 1, 1, 1, 1, 1,
-1.13018, 1.195422, -0.5465346, 1, 1, 1, 1, 1,
-1.125727, 0.4200003, -3.648064, 1, 1, 1, 1, 1,
-1.120933, -1.037595, -3.282525, 1, 1, 1, 1, 1,
-1.120183, -0.03534813, -1.807527, 1, 1, 1, 1, 1,
-1.119443, -1.055181, -2.33476, 0, 0, 1, 1, 1,
-1.117784, 0.5067158, -0.520189, 1, 0, 0, 1, 1,
-1.115497, -0.4423405, -0.9116377, 1, 0, 0, 1, 1,
-1.099183, -0.477388, -2.769677, 1, 0, 0, 1, 1,
-1.090652, 0.3020028, -0.1384431, 1, 0, 0, 1, 1,
-1.090301, 0.3884475, -1.297154, 1, 0, 0, 1, 1,
-1.085287, 0.1008858, -1.820851, 0, 0, 0, 1, 1,
-1.077779, 0.5184169, -0.9755483, 0, 0, 0, 1, 1,
-1.076251, 0.8232902, 0.3233107, 0, 0, 0, 1, 1,
-1.074112, -2.57857, -2.488495, 0, 0, 0, 1, 1,
-1.074, -0.8984247, -0.5483345, 0, 0, 0, 1, 1,
-1.066047, -0.13163, -3.343196, 0, 0, 0, 1, 1,
-1.052512, -0.03477943, -0.9797511, 0, 0, 0, 1, 1,
-1.04987, -0.4508516, -2.90173, 1, 1, 1, 1, 1,
-1.047886, -2.023192, -3.556389, 1, 1, 1, 1, 1,
-1.04082, -0.5358277, -2.679224, 1, 1, 1, 1, 1,
-1.04047, -1.104695, -1.238267, 1, 1, 1, 1, 1,
-1.040381, -0.4464727, -3.183913, 1, 1, 1, 1, 1,
-1.03755, 0.7445169, -0.7355276, 1, 1, 1, 1, 1,
-1.0366, 0.2705821, -0.2853746, 1, 1, 1, 1, 1,
-1.035161, 0.2372147, -1.292285, 1, 1, 1, 1, 1,
-1.032392, -0.45084, -2.56008, 1, 1, 1, 1, 1,
-1.022357, -0.4905077, -1.818494, 1, 1, 1, 1, 1,
-1.019612, -0.9148378, -1.039851, 1, 1, 1, 1, 1,
-1.018577, 0.9554437, -1.983297, 1, 1, 1, 1, 1,
-1.018491, 0.7693868, -2.603824, 1, 1, 1, 1, 1,
-1.018116, -0.06362405, -1.636512, 1, 1, 1, 1, 1,
-1.016019, 1.044287, -0.3605714, 1, 1, 1, 1, 1,
-1.015586, 0.3418414, -0.1290189, 0, 0, 1, 1, 1,
-1.011756, 1.055743, 0.9970373, 1, 0, 0, 1, 1,
-1.011423, -2.443089, -3.872924, 1, 0, 0, 1, 1,
-1.003595, 0.02972327, -1.61183, 1, 0, 0, 1, 1,
-1.001987, 1.309926, -1.138838, 1, 0, 0, 1, 1,
-1.000792, 1.116255, -0.3512512, 1, 0, 0, 1, 1,
-0.9988738, 0.5248407, -1.44245, 0, 0, 0, 1, 1,
-0.9961688, 1.053596, 0.6040283, 0, 0, 0, 1, 1,
-0.991078, 0.07648932, -3.232816, 0, 0, 0, 1, 1,
-0.9906069, 1.888729, -2.950767, 0, 0, 0, 1, 1,
-0.9880421, -0.07514399, -0.7837294, 0, 0, 0, 1, 1,
-0.9865782, 1.893508, -0.5037534, 0, 0, 0, 1, 1,
-0.9859068, 0.5454556, -1.54245, 0, 0, 0, 1, 1,
-0.9855505, 1.485411, -0.5560846, 1, 1, 1, 1, 1,
-0.9845414, -0.3715759, -3.043541, 1, 1, 1, 1, 1,
-0.9752583, 1.766389, 2.461487, 1, 1, 1, 1, 1,
-0.9692372, -0.4114796, -2.156314, 1, 1, 1, 1, 1,
-0.9679329, -0.3846302, -2.224894, 1, 1, 1, 1, 1,
-0.9654924, 0.626697, -0.2142554, 1, 1, 1, 1, 1,
-0.9649095, 0.7776079, -0.5391735, 1, 1, 1, 1, 1,
-0.9565325, 0.3949141, -2.861727, 1, 1, 1, 1, 1,
-0.9501005, 0.9712932, -0.6563182, 1, 1, 1, 1, 1,
-0.9488474, 1.752365, -1.592758, 1, 1, 1, 1, 1,
-0.9450046, -0.5975463, -2.118249, 1, 1, 1, 1, 1,
-0.9429315, -0.6876933, -3.309962, 1, 1, 1, 1, 1,
-0.93762, -0.9054738, -0.5583113, 1, 1, 1, 1, 1,
-0.9311312, 0.5296026, 0.5762293, 1, 1, 1, 1, 1,
-0.9285048, 0.8640448, -1.939981, 1, 1, 1, 1, 1,
-0.9191247, -0.8797178, -3.275276, 0, 0, 1, 1, 1,
-0.9179915, 0.4326774, -0.3096493, 1, 0, 0, 1, 1,
-0.9145101, -0.7691522, -1.93227, 1, 0, 0, 1, 1,
-0.9116822, -0.986395, -2.643628, 1, 0, 0, 1, 1,
-0.9108828, -0.9893477, -2.55989, 1, 0, 0, 1, 1,
-0.9043152, 0.4804825, -2.070009, 1, 0, 0, 1, 1,
-0.8993443, 0.2936181, -0.9805416, 0, 0, 0, 1, 1,
-0.8941212, 0.4771799, -1.705024, 0, 0, 0, 1, 1,
-0.893933, -0.9896845, -3.831686, 0, 0, 0, 1, 1,
-0.888599, -0.1770786, -1.959227, 0, 0, 0, 1, 1,
-0.8850613, -0.332691, -1.603856, 0, 0, 0, 1, 1,
-0.881303, -0.3365526, -2.785057, 0, 0, 0, 1, 1,
-0.8682218, -1.202837, -1.907862, 0, 0, 0, 1, 1,
-0.8561441, -0.7149875, -3.701887, 1, 1, 1, 1, 1,
-0.8545107, 1.076561, -2.22628, 1, 1, 1, 1, 1,
-0.8478867, -0.3997271, -2.255907, 1, 1, 1, 1, 1,
-0.8474838, -0.4116786, -3.208871, 1, 1, 1, 1, 1,
-0.8409237, 0.2633231, -1.275672, 1, 1, 1, 1, 1,
-0.8381895, -0.8236393, -2.004207, 1, 1, 1, 1, 1,
-0.8369317, -0.6748363, -2.738969, 1, 1, 1, 1, 1,
-0.8175895, 1.002475, -1.319905, 1, 1, 1, 1, 1,
-0.8087752, -0.2047962, -1.560229, 1, 1, 1, 1, 1,
-0.8069041, 0.2914128, 0.6065302, 1, 1, 1, 1, 1,
-0.8047251, -0.1238295, -0.4097287, 1, 1, 1, 1, 1,
-0.8039453, 1.99705, -0.7399738, 1, 1, 1, 1, 1,
-0.8016307, -0.03583192, -1.075532, 1, 1, 1, 1, 1,
-0.8009204, 0.6246281, -0.4017949, 1, 1, 1, 1, 1,
-0.7965196, -0.1515048, -2.12985, 1, 1, 1, 1, 1,
-0.7959675, 1.785381, -0.2586254, 0, 0, 1, 1, 1,
-0.7932595, -1.045384, -1.09884, 1, 0, 0, 1, 1,
-0.7892689, 0.9179221, 0.5464312, 1, 0, 0, 1, 1,
-0.7799054, -0.7894107, -2.093645, 1, 0, 0, 1, 1,
-0.7739167, -1.37504, -1.987487, 1, 0, 0, 1, 1,
-0.7736189, -0.02894463, -2.70437, 1, 0, 0, 1, 1,
-0.7725307, -1.5257, -2.125752, 0, 0, 0, 1, 1,
-0.7711464, 2.162484, -0.7910293, 0, 0, 0, 1, 1,
-0.7665008, -1.763701, -0.9776789, 0, 0, 0, 1, 1,
-0.7659075, -0.3363238, -1.907855, 0, 0, 0, 1, 1,
-0.7656779, -0.5182853, -2.422339, 0, 0, 0, 1, 1,
-0.759313, -0.733765, -1.252706, 0, 0, 0, 1, 1,
-0.7575954, 0.8020103, -1.024099, 0, 0, 0, 1, 1,
-0.7556301, -1.00745, -3.084209, 1, 1, 1, 1, 1,
-0.7546748, -1.064005, -1.845521, 1, 1, 1, 1, 1,
-0.7504019, 0.07456541, -1.012781, 1, 1, 1, 1, 1,
-0.740878, 0.1497227, -2.42634, 1, 1, 1, 1, 1,
-0.7404858, -0.5214657, -2.083471, 1, 1, 1, 1, 1,
-0.7295411, 0.7152143, -1.381371, 1, 1, 1, 1, 1,
-0.7248027, -0.5617262, -0.8134069, 1, 1, 1, 1, 1,
-0.7234942, -1.061228, -2.741897, 1, 1, 1, 1, 1,
-0.7222281, 0.08990076, -1.250419, 1, 1, 1, 1, 1,
-0.7211267, 0.958609, 1.389803, 1, 1, 1, 1, 1,
-0.7137098, -0.1070189, -2.996373, 1, 1, 1, 1, 1,
-0.7125781, 1.508582, 0.4945986, 1, 1, 1, 1, 1,
-0.7093097, -0.1218777, -1.830819, 1, 1, 1, 1, 1,
-0.7058886, 1.304388, -0.2477533, 1, 1, 1, 1, 1,
-0.7058612, 0.8793519, -0.7596051, 1, 1, 1, 1, 1,
-0.7050832, 1.681119, -0.0643311, 0, 0, 1, 1, 1,
-0.7047422, -0.4013397, -0.400532, 1, 0, 0, 1, 1,
-0.7027297, 1.08713, -1.623776, 1, 0, 0, 1, 1,
-0.7022598, -1.275416, -2.149671, 1, 0, 0, 1, 1,
-0.6983333, -0.9774157, -2.74855, 1, 0, 0, 1, 1,
-0.6926101, 0.016013, -2.223439, 1, 0, 0, 1, 1,
-0.6913456, -0.01330473, -0.1326434, 0, 0, 0, 1, 1,
-0.6895208, -1.211077, -2.134407, 0, 0, 0, 1, 1,
-0.6866165, -0.6100754, -3.398761, 0, 0, 0, 1, 1,
-0.6851073, 0.8223928, -1.600546, 0, 0, 0, 1, 1,
-0.6828799, 1.201673, -1.04999, 0, 0, 0, 1, 1,
-0.6826546, 2.166772, -0.6124741, 0, 0, 0, 1, 1,
-0.6808171, 1.582966, 0.6182954, 0, 0, 0, 1, 1,
-0.6807328, 0.09760179, -0.893381, 1, 1, 1, 1, 1,
-0.6797151, -0.7856998, -2.24307, 1, 1, 1, 1, 1,
-0.6786258, 0.2571855, -3.757642, 1, 1, 1, 1, 1,
-0.6759298, -0.7079803, -2.783091, 1, 1, 1, 1, 1,
-0.6732478, 0.2264666, 1.897361, 1, 1, 1, 1, 1,
-0.6691066, 0.6849622, -0.438996, 1, 1, 1, 1, 1,
-0.6542774, 1.260892, -0.922547, 1, 1, 1, 1, 1,
-0.6501599, -1.081586, -2.094543, 1, 1, 1, 1, 1,
-0.64985, -0.1419195, -1.606901, 1, 1, 1, 1, 1,
-0.6469115, -1.723032, -3.249568, 1, 1, 1, 1, 1,
-0.6461364, -0.03931687, -0.06948856, 1, 1, 1, 1, 1,
-0.6412054, -0.6653566, -3.953947, 1, 1, 1, 1, 1,
-0.6368877, -0.9526652, -3.891904, 1, 1, 1, 1, 1,
-0.6322702, -0.09765795, -2.871682, 1, 1, 1, 1, 1,
-0.6310484, -0.5907165, -1.852865, 1, 1, 1, 1, 1,
-0.6296968, 0.9560849, -1.28096, 0, 0, 1, 1, 1,
-0.6277797, -0.7967788, -0.2659938, 1, 0, 0, 1, 1,
-0.6273872, 1.050093, -0.5575305, 1, 0, 0, 1, 1,
-0.6244765, 0.4804626, -1.6846, 1, 0, 0, 1, 1,
-0.6144925, 0.4189367, -0.4660495, 1, 0, 0, 1, 1,
-0.6108282, 0.4129666, -0.2101595, 1, 0, 0, 1, 1,
-0.6079745, 0.1364725, -1.454802, 0, 0, 0, 1, 1,
-0.6078365, 0.2285582, -1.321062, 0, 0, 0, 1, 1,
-0.5948302, -0.4084404, -1.762747, 0, 0, 0, 1, 1,
-0.5942078, -1.278106, -2.394196, 0, 0, 0, 1, 1,
-0.592912, 0.3391311, -0.4178214, 0, 0, 0, 1, 1,
-0.586394, 1.236661, -0.8855007, 0, 0, 0, 1, 1,
-0.5862183, 0.4083349, -1.074552, 0, 0, 0, 1, 1,
-0.5853524, 0.4836321, -1.654189, 1, 1, 1, 1, 1,
-0.5833044, -0.3558527, -2.492913, 1, 1, 1, 1, 1,
-0.5821509, 0.02975914, -1.508249, 1, 1, 1, 1, 1,
-0.5802372, -0.04356221, -1.309572, 1, 1, 1, 1, 1,
-0.5754269, -0.170455, -1.122185, 1, 1, 1, 1, 1,
-0.5745808, 0.7135027, 0.1290407, 1, 1, 1, 1, 1,
-0.5740448, -1.054698, -4.839653, 1, 1, 1, 1, 1,
-0.569251, -0.1266952, -2.538129, 1, 1, 1, 1, 1,
-0.569132, -0.5127993, -2.397792, 1, 1, 1, 1, 1,
-0.5646824, 1.231281, -0.7753533, 1, 1, 1, 1, 1,
-0.5624144, 0.8298129, 1.066175, 1, 1, 1, 1, 1,
-0.5552348, -0.3044922, -1.026306, 1, 1, 1, 1, 1,
-0.5541229, 1.294213, -0.6654051, 1, 1, 1, 1, 1,
-0.5433264, -0.796371, -2.981254, 1, 1, 1, 1, 1,
-0.5387066, 1.157802, -1.185815, 1, 1, 1, 1, 1,
-0.5384753, -1.014989, -2.554085, 0, 0, 1, 1, 1,
-0.5172237, -1.558887, -2.820175, 1, 0, 0, 1, 1,
-0.5167553, -0.8089882, -3.271466, 1, 0, 0, 1, 1,
-0.5159058, -1.099814, -4.758426, 1, 0, 0, 1, 1,
-0.5143325, -0.6759198, -3.288293, 1, 0, 0, 1, 1,
-0.5142801, 1.095515, -1.114699, 1, 0, 0, 1, 1,
-0.512162, 1.095873, -0.8039876, 0, 0, 0, 1, 1,
-0.5087648, 0.2246649, -1.695158, 0, 0, 0, 1, 1,
-0.5054654, -1.049588, -3.64801, 0, 0, 0, 1, 1,
-0.5024101, 1.275802, -0.8876582, 0, 0, 0, 1, 1,
-0.5019545, -1.317875, -4.159094, 0, 0, 0, 1, 1,
-0.5006105, -0.3209553, -1.85251, 0, 0, 0, 1, 1,
-0.497838, -2.348955, -1.881824, 0, 0, 0, 1, 1,
-0.4955661, 0.6097171, -0.8141916, 1, 1, 1, 1, 1,
-0.4954635, 0.1804815, -0.8394193, 1, 1, 1, 1, 1,
-0.4903736, -1.275122, -3.20262, 1, 1, 1, 1, 1,
-0.4856729, -0.5508395, -2.507491, 1, 1, 1, 1, 1,
-0.4849816, -0.396733, -1.662136, 1, 1, 1, 1, 1,
-0.4847099, -0.7945217, -2.99464, 1, 1, 1, 1, 1,
-0.4785943, -0.9898047, -4.198021, 1, 1, 1, 1, 1,
-0.477455, -1.387671, -0.9309371, 1, 1, 1, 1, 1,
-0.4735561, 0.5431733, -0.2407691, 1, 1, 1, 1, 1,
-0.4713072, 0.7291386, 0.489687, 1, 1, 1, 1, 1,
-0.4661029, 2.564605, -0.1198064, 1, 1, 1, 1, 1,
-0.4654215, 0.04690323, -2.603853, 1, 1, 1, 1, 1,
-0.4608361, 0.6684503, -1.18778, 1, 1, 1, 1, 1,
-0.4596865, -0.6521795, -0.904397, 1, 1, 1, 1, 1,
-0.4566612, 0.5367978, -0.6230361, 1, 1, 1, 1, 1,
-0.4511688, -0.4347957, -0.9783208, 0, 0, 1, 1, 1,
-0.4471997, 0.7977181, -1.254931, 1, 0, 0, 1, 1,
-0.4465494, 1.88448, 0.9705612, 1, 0, 0, 1, 1,
-0.4455204, 0.6015726, -0.2399447, 1, 0, 0, 1, 1,
-0.4424188, -0.08262498, -1.587182, 1, 0, 0, 1, 1,
-0.4417982, 1.300152, 1.942902, 1, 0, 0, 1, 1,
-0.4336661, 0.09609006, -0.738424, 0, 0, 0, 1, 1,
-0.4328886, 0.5166122, -1.007141, 0, 0, 0, 1, 1,
-0.4317097, 1.57959, 0.2158885, 0, 0, 0, 1, 1,
-0.431549, -1.178925, -4.64538, 0, 0, 0, 1, 1,
-0.4299729, -1.340027, -2.440407, 0, 0, 0, 1, 1,
-0.4283723, -0.2267925, -0.8884416, 0, 0, 0, 1, 1,
-0.4275377, -0.5193868, -1.867848, 0, 0, 0, 1, 1,
-0.4262679, 0.288603, 0.9030034, 1, 1, 1, 1, 1,
-0.4203629, -0.4975905, -2.958972, 1, 1, 1, 1, 1,
-0.4194485, -0.3970562, -1.453454, 1, 1, 1, 1, 1,
-0.4122741, -0.07072823, -1.558012, 1, 1, 1, 1, 1,
-0.4099396, 1.665973, 0.2794507, 1, 1, 1, 1, 1,
-0.4078794, -0.1027584, -1.463926, 1, 1, 1, 1, 1,
-0.40178, -0.3043648, -1.773385, 1, 1, 1, 1, 1,
-0.4006298, 0.3740085, 0.8497751, 1, 1, 1, 1, 1,
-0.4002282, -2.231529, -3.158038, 1, 1, 1, 1, 1,
-0.39919, -0.1739249, -1.239703, 1, 1, 1, 1, 1,
-0.3987095, 2.091245, -0.9768174, 1, 1, 1, 1, 1,
-0.3980279, 0.07447053, -1.92766, 1, 1, 1, 1, 1,
-0.3947318, -1.69232, -2.95725, 1, 1, 1, 1, 1,
-0.3934838, 0.08218322, -2.071238, 1, 1, 1, 1, 1,
-0.3875118, -0.4861057, -3.443779, 1, 1, 1, 1, 1,
-0.3835702, 1.92964, -0.4627806, 0, 0, 1, 1, 1,
-0.3821412, 0.4875162, -0.9181609, 1, 0, 0, 1, 1,
-0.381508, 2.068461, -0.517946, 1, 0, 0, 1, 1,
-0.3804935, -1.157664, -3.452021, 1, 0, 0, 1, 1,
-0.3743359, 0.04319138, 1.180507, 1, 0, 0, 1, 1,
-0.3728729, 0.550521, -0.7939143, 1, 0, 0, 1, 1,
-0.3668264, 0.1377467, -1.206115, 0, 0, 0, 1, 1,
-0.3668043, 0.7272789, -2.737647, 0, 0, 0, 1, 1,
-0.3616988, -1.661765, -3.265552, 0, 0, 0, 1, 1,
-0.3592406, 0.3613446, -0.8367558, 0, 0, 0, 1, 1,
-0.3560863, 0.2419242, -0.968531, 0, 0, 0, 1, 1,
-0.355468, -0.04777415, -1.745561, 0, 0, 0, 1, 1,
-0.3549353, -1.094883, -2.920294, 0, 0, 0, 1, 1,
-0.3526577, -0.7638103, -2.405473, 1, 1, 1, 1, 1,
-0.3515326, -0.8466762, -1.631496, 1, 1, 1, 1, 1,
-0.3511112, 0.2598292, -1.896674, 1, 1, 1, 1, 1,
-0.3438574, -0.5259067, -0.7578467, 1, 1, 1, 1, 1,
-0.3429097, -1.560051, -3.735348, 1, 1, 1, 1, 1,
-0.3415999, 1.626283, 0.1668335, 1, 1, 1, 1, 1,
-0.3396265, 0.9412644, -0.2748331, 1, 1, 1, 1, 1,
-0.3384843, 0.6564918, -0.761185, 1, 1, 1, 1, 1,
-0.330095, -0.3025439, -3.203473, 1, 1, 1, 1, 1,
-0.3281132, 0.3067442, -0.2801561, 1, 1, 1, 1, 1,
-0.3253409, -0.8310696, -2.486821, 1, 1, 1, 1, 1,
-0.3235478, -0.2431281, -2.280205, 1, 1, 1, 1, 1,
-0.3188216, 0.8916036, -0.9986505, 1, 1, 1, 1, 1,
-0.3177346, 1.574695, -0.5513789, 1, 1, 1, 1, 1,
-0.3084586, 1.220695, -1.024632, 1, 1, 1, 1, 1,
-0.3036172, 1.145322, 0.9204823, 0, 0, 1, 1, 1,
-0.3032007, -0.9599848, -3.893122, 1, 0, 0, 1, 1,
-0.3030172, -2.429359, -3.961814, 1, 0, 0, 1, 1,
-0.3022797, 0.6785452, -0.8936051, 1, 0, 0, 1, 1,
-0.3000665, 1.841867, -1.77115, 1, 0, 0, 1, 1,
-0.2984089, 0.1414995, -1.89551, 1, 0, 0, 1, 1,
-0.2980556, -0.3368354, -1.374909, 0, 0, 0, 1, 1,
-0.2964729, 2.220053, -0.125152, 0, 0, 0, 1, 1,
-0.2933046, -0.8346692, -4.041469, 0, 0, 0, 1, 1,
-0.2894168, 1.033606, 1.441365, 0, 0, 0, 1, 1,
-0.2792653, 1.283638, -0.145054, 0, 0, 0, 1, 1,
-0.278868, 2.005875, -0.3406382, 0, 0, 0, 1, 1,
-0.2777985, 2.05689, 1.854894, 0, 0, 0, 1, 1,
-0.276194, 1.384765, 0.7842262, 1, 1, 1, 1, 1,
-0.2761742, -1.780143, -2.715101, 1, 1, 1, 1, 1,
-0.2759702, 0.8774858, -0.5567868, 1, 1, 1, 1, 1,
-0.2753034, -1.245731, -0.4943373, 1, 1, 1, 1, 1,
-0.2716083, -1.089828, -3.289224, 1, 1, 1, 1, 1,
-0.2704578, 0.1397909, -0.7282258, 1, 1, 1, 1, 1,
-0.2576901, 0.1007246, -1.981825, 1, 1, 1, 1, 1,
-0.2567479, -0.807534, -2.561772, 1, 1, 1, 1, 1,
-0.256342, -0.7646692, -2.633693, 1, 1, 1, 1, 1,
-0.2533785, 0.4510269, -0.0280091, 1, 1, 1, 1, 1,
-0.2515867, -0.5561389, -4.078527, 1, 1, 1, 1, 1,
-0.2496502, -1.706217, -1.913834, 1, 1, 1, 1, 1,
-0.248641, -0.6921275, -3.198507, 1, 1, 1, 1, 1,
-0.2482257, -1.412002, -2.22928, 1, 1, 1, 1, 1,
-0.2475461, -1.240238, -4.687718, 1, 1, 1, 1, 1,
-0.2473911, 1.818658, 0.3441949, 0, 0, 1, 1, 1,
-0.2419519, 0.1750928, -1.188322, 1, 0, 0, 1, 1,
-0.241408, -0.2106386, -3.39965, 1, 0, 0, 1, 1,
-0.2408025, -0.6621755, -1.934817, 1, 0, 0, 1, 1,
-0.240354, 1.127814, -1.5236, 1, 0, 0, 1, 1,
-0.2395258, 1.029736, -1.295741, 1, 0, 0, 1, 1,
-0.2373752, -1.213532, -3.629541, 0, 0, 0, 1, 1,
-0.2366717, -0.7423313, -2.910562, 0, 0, 0, 1, 1,
-0.231326, -0.26524, -3.127527, 0, 0, 0, 1, 1,
-0.2312409, 0.3187713, -2.445955, 0, 0, 0, 1, 1,
-0.2280467, 1.894867, 1.604397, 0, 0, 0, 1, 1,
-0.2247217, -0.8068548, -2.325241, 0, 0, 0, 1, 1,
-0.221794, -0.8382953, -2.057064, 0, 0, 0, 1, 1,
-0.2170533, 0.8343353, -1.840411, 1, 1, 1, 1, 1,
-0.2113288, 0.6220646, -0.2381732, 1, 1, 1, 1, 1,
-0.2055807, -0.2079517, -0.1149276, 1, 1, 1, 1, 1,
-0.205451, 0.147908, -0.7084265, 1, 1, 1, 1, 1,
-0.2040105, -0.6873198, -4.082338, 1, 1, 1, 1, 1,
-0.1963438, -0.03184473, -2.931814, 1, 1, 1, 1, 1,
-0.1954968, -1.974367, -3.953634, 1, 1, 1, 1, 1,
-0.1934347, 0.5244067, -1.176925, 1, 1, 1, 1, 1,
-0.193401, -0.1237347, -2.992991, 1, 1, 1, 1, 1,
-0.1917415, -1.844859, -2.197749, 1, 1, 1, 1, 1,
-0.1826466, 0.9875001, -1.214896, 1, 1, 1, 1, 1,
-0.1789576, -0.8477565, -3.164499, 1, 1, 1, 1, 1,
-0.1789313, -1.865692, -4.250579, 1, 1, 1, 1, 1,
-0.175715, -1.517995, -2.696239, 1, 1, 1, 1, 1,
-0.1717514, 0.655093, -0.2765512, 1, 1, 1, 1, 1,
-0.1711395, 0.4757565, -1.035089, 0, 0, 1, 1, 1,
-0.1708075, 0.3843613, 0.451117, 1, 0, 0, 1, 1,
-0.169304, -0.6619079, -2.686234, 1, 0, 0, 1, 1,
-0.1652248, -0.007142692, -2.354145, 1, 0, 0, 1, 1,
-0.1651806, 0.3329633, -0.8739476, 1, 0, 0, 1, 1,
-0.1610452, 1.269048, 1.400727, 1, 0, 0, 1, 1,
-0.1556134, 0.3313426, -1.02732, 0, 0, 0, 1, 1,
-0.1516912, 0.5448484, 0.5566612, 0, 0, 0, 1, 1,
-0.1501777, 0.1954945, -1.023136, 0, 0, 0, 1, 1,
-0.149926, 0.9790152, -1.334919, 0, 0, 0, 1, 1,
-0.1460934, -1.037331, -3.193506, 0, 0, 0, 1, 1,
-0.1397282, -0.09738833, -1.611395, 0, 0, 0, 1, 1,
-0.1393857, 0.6192065, 0.7265876, 0, 0, 0, 1, 1,
-0.1393003, 0.3512635, 0.1158112, 1, 1, 1, 1, 1,
-0.1387227, -0.3220325, -4.097564, 1, 1, 1, 1, 1,
-0.1358376, -0.6041608, -2.61904, 1, 1, 1, 1, 1,
-0.127298, 0.4664212, -0.4659473, 1, 1, 1, 1, 1,
-0.1242345, 0.7421838, -0.8362922, 1, 1, 1, 1, 1,
-0.1240597, 1.440823, 1.739745, 1, 1, 1, 1, 1,
-0.1219712, 0.8485794, -0.3507315, 1, 1, 1, 1, 1,
-0.1199717, 1.94198, -0.2294466, 1, 1, 1, 1, 1,
-0.118836, -1.218207, -2.398124, 1, 1, 1, 1, 1,
-0.1099657, -0.3533145, -2.562695, 1, 1, 1, 1, 1,
-0.1084617, -1.077495, -2.986426, 1, 1, 1, 1, 1,
-0.108145, 0.3276192, -1.775739, 1, 1, 1, 1, 1,
-0.1062549, 0.0186873, -2.134414, 1, 1, 1, 1, 1,
-0.1044227, 0.1897366, -0.1309037, 1, 1, 1, 1, 1,
-0.102555, -0.7028716, -3.532439, 1, 1, 1, 1, 1,
-0.100637, -1.459485, -2.855098, 0, 0, 1, 1, 1,
-0.09944025, 1.053125, 1.034679, 1, 0, 0, 1, 1,
-0.09025931, 0.80883, -0.3021846, 1, 0, 0, 1, 1,
-0.08233298, -0.9925644, -2.251021, 1, 0, 0, 1, 1,
-0.07717357, 0.4130281, -0.9382987, 1, 0, 0, 1, 1,
-0.07540445, 0.1450132, 0.3739969, 1, 0, 0, 1, 1,
-0.07219312, -0.1707514, -0.3060777, 0, 0, 0, 1, 1,
-0.0708389, 0.1405831, 0.041672, 0, 0, 0, 1, 1,
-0.06719198, 0.7950158, -0.1471078, 0, 0, 0, 1, 1,
-0.06617042, -0.8942397, -3.751819, 0, 0, 0, 1, 1,
-0.06159925, -0.1036637, -2.260968, 0, 0, 0, 1, 1,
-0.06111433, -1.437793, -3.510621, 0, 0, 0, 1, 1,
-0.05934189, 0.1090535, -1.129615, 0, 0, 0, 1, 1,
-0.0548717, -0.1671766, -2.560193, 1, 1, 1, 1, 1,
-0.05347934, 0.0179764, -1.020951, 1, 1, 1, 1, 1,
-0.05315153, -0.09860174, -3.141669, 1, 1, 1, 1, 1,
-0.0523585, -0.4713001, -5.427065, 1, 1, 1, 1, 1,
-0.05223138, -0.3517196, -1.01342, 1, 1, 1, 1, 1,
-0.05098339, -0.9613676, -1.882091, 1, 1, 1, 1, 1,
-0.04821758, -0.3155545, -3.913543, 1, 1, 1, 1, 1,
-0.04401303, 1.197307, -0.5739246, 1, 1, 1, 1, 1,
-0.04339502, 1.238367, -2.211511, 1, 1, 1, 1, 1,
-0.04307928, -0.8715008, -1.839132, 1, 1, 1, 1, 1,
-0.03745957, -0.7707837, -3.102247, 1, 1, 1, 1, 1,
-0.03693525, 0.1622985, -0.2864276, 1, 1, 1, 1, 1,
-0.03582519, -0.022803, -2.591671, 1, 1, 1, 1, 1,
-0.03459022, -0.3953743, -2.917572, 1, 1, 1, 1, 1,
-0.0334729, 0.5172176, -0.5952169, 1, 1, 1, 1, 1,
-0.03250055, 0.144799, -0.9032433, 0, 0, 1, 1, 1,
-0.03132236, 1.873956, -0.2720375, 1, 0, 0, 1, 1,
-0.02696279, 0.40589, -1.142892, 1, 0, 0, 1, 1,
-0.02665502, -0.2608678, -3.483197, 1, 0, 0, 1, 1,
-0.02540012, 1.619266, 0.006827518, 1, 0, 0, 1, 1,
-0.02539024, 0.5060506, 0.9433287, 1, 0, 0, 1, 1,
-0.02492299, -2.49405, -2.721951, 0, 0, 0, 1, 1,
-0.02479674, -0.04059917, -1.248176, 0, 0, 0, 1, 1,
-0.01974139, -1.027794, -2.584624, 0, 0, 0, 1, 1,
-0.01849005, 3.136544, -0.550693, 0, 0, 0, 1, 1,
-0.01795493, -0.8251999, -2.69877, 0, 0, 0, 1, 1,
-0.01775438, 0.06743818, -1.585434, 0, 0, 0, 1, 1,
-0.01629035, 0.04933023, -1.657313, 0, 0, 0, 1, 1,
-0.01619136, -0.4722459, -2.374984, 1, 1, 1, 1, 1,
-0.01396495, 0.181424, 1.016313, 1, 1, 1, 1, 1,
-0.01273996, -0.06792242, -3.030333, 1, 1, 1, 1, 1,
-0.009037998, 0.5864302, 1.123977, 1, 1, 1, 1, 1,
-0.007634821, 0.3263122, 0.3166421, 1, 1, 1, 1, 1,
-0.004187637, -1.312392, -2.302902, 1, 1, 1, 1, 1,
-0.002021883, 0.543178, 1.167333, 1, 1, 1, 1, 1,
0.00403976, 0.6389731, 0.4691155, 1, 1, 1, 1, 1,
0.004876459, -0.2031618, 4.627583, 1, 1, 1, 1, 1,
0.01000773, 0.5590759, 0.177704, 1, 1, 1, 1, 1,
0.01291577, -0.2939218, 2.624612, 1, 1, 1, 1, 1,
0.01459039, -0.3434644, 2.773526, 1, 1, 1, 1, 1,
0.01632149, 1.276698, 0.3527274, 1, 1, 1, 1, 1,
0.01772143, -0.7421384, 2.19324, 1, 1, 1, 1, 1,
0.01967984, 1.181689, -0.7448704, 1, 1, 1, 1, 1,
0.02061075, -0.1974456, 1.388991, 0, 0, 1, 1, 1,
0.02182196, 1.039954, -0.3085467, 1, 0, 0, 1, 1,
0.02198472, -1.168306, 3.531496, 1, 0, 0, 1, 1,
0.02249313, 0.3328099, 0.3366772, 1, 0, 0, 1, 1,
0.02433768, -1.798244, 2.908689, 1, 0, 0, 1, 1,
0.02479599, 1.259919, 2.136895, 1, 0, 0, 1, 1,
0.02526433, 0.2042631, -0.7198993, 0, 0, 0, 1, 1,
0.02580212, -1.151292, 1.532438, 0, 0, 0, 1, 1,
0.02643218, -0.05075631, 2.768609, 0, 0, 0, 1, 1,
0.03048298, 0.4240409, 1.086606, 0, 0, 0, 1, 1,
0.03069516, -0.01627846, 3.829976, 0, 0, 0, 1, 1,
0.03275764, 1.580604, 1.069833, 0, 0, 0, 1, 1,
0.03818397, -0.2620991, 3.607415, 0, 0, 0, 1, 1,
0.03904769, -2.39174, 3.147653, 1, 1, 1, 1, 1,
0.04099567, 0.7877823, 0.1846689, 1, 1, 1, 1, 1,
0.04213331, -0.5733075, 3.04144, 1, 1, 1, 1, 1,
0.04265591, -1.435665, 3.410432, 1, 1, 1, 1, 1,
0.04331169, 0.1864908, 1.664741, 1, 1, 1, 1, 1,
0.04603992, 0.2882302, 1.109683, 1, 1, 1, 1, 1,
0.04895206, 0.1051265, 1.382804, 1, 1, 1, 1, 1,
0.04984726, -0.2089125, 2.075114, 1, 1, 1, 1, 1,
0.04995471, 0.4026721, 0.2416336, 1, 1, 1, 1, 1,
0.05012109, -0.1390978, 2.54972, 1, 1, 1, 1, 1,
0.05169542, 0.3916055, 1.399154, 1, 1, 1, 1, 1,
0.06257372, 0.5414609, 0.8585958, 1, 1, 1, 1, 1,
0.06319521, -0.9091792, 2.65949, 1, 1, 1, 1, 1,
0.06927677, -0.8581867, 4.363325, 1, 1, 1, 1, 1,
0.06953464, 0.3890986, 1.530571, 1, 1, 1, 1, 1,
0.07493171, 0.1454883, 0.6710933, 0, 0, 1, 1, 1,
0.07770343, 0.7333105, 1.108767, 1, 0, 0, 1, 1,
0.07821763, 0.6529517, 1.565469, 1, 0, 0, 1, 1,
0.07841472, 0.5795248, -0.8604301, 1, 0, 0, 1, 1,
0.08234522, 0.8589656, -0.4461781, 1, 0, 0, 1, 1,
0.0835456, 0.8162206, -1.800405, 1, 0, 0, 1, 1,
0.08545666, -1.582767, 2.517155, 0, 0, 0, 1, 1,
0.08982208, -0.7298792, 1.603904, 0, 0, 0, 1, 1,
0.09008889, 2.19528, 0.9030623, 0, 0, 0, 1, 1,
0.09417178, -0.2716252, 3.598409, 0, 0, 0, 1, 1,
0.09792364, 0.547902, -0.952638, 0, 0, 0, 1, 1,
0.101903, -0.2919389, 3.166302, 0, 0, 0, 1, 1,
0.1045281, 0.810178, 0.01394596, 0, 0, 0, 1, 1,
0.1086892, 0.0940093, 0.2188942, 1, 1, 1, 1, 1,
0.112094, -0.2467665, 3.728406, 1, 1, 1, 1, 1,
0.1189583, 0.2269515, 1.184741, 1, 1, 1, 1, 1,
0.1190514, 0.433146, -0.8216381, 1, 1, 1, 1, 1,
0.1196901, -0.4903806, 0.7297431, 1, 1, 1, 1, 1,
0.120227, 0.6537095, 0.529261, 1, 1, 1, 1, 1,
0.1204324, 1.10624, -0.966503, 1, 1, 1, 1, 1,
0.1204864, 0.9021505, -1.483645, 1, 1, 1, 1, 1,
0.1209247, -0.7581925, 3.833618, 1, 1, 1, 1, 1,
0.1212824, 1.926612, -0.03353561, 1, 1, 1, 1, 1,
0.1225081, -1.179038, 3.895585, 1, 1, 1, 1, 1,
0.1229225, -0.3768764, 4.458407, 1, 1, 1, 1, 1,
0.1290994, -2.181312, 2.973896, 1, 1, 1, 1, 1,
0.1328796, 1.580002, -0.6066954, 1, 1, 1, 1, 1,
0.1343435, -1.137664, 2.235469, 1, 1, 1, 1, 1,
0.13444, 0.3224354, 0.381932, 0, 0, 1, 1, 1,
0.1430804, 0.1995519, 1.107816, 1, 0, 0, 1, 1,
0.1436367, -1.589433, 4.068174, 1, 0, 0, 1, 1,
0.1481017, 0.3489901, -1.042404, 1, 0, 0, 1, 1,
0.1492425, 1.430008, 1.162395, 1, 0, 0, 1, 1,
0.1545375, 0.2134439, 0.2386141, 1, 0, 0, 1, 1,
0.1573603, -0.7298089, 2.311183, 0, 0, 0, 1, 1,
0.1575094, -0.1955754, 2.025237, 0, 0, 0, 1, 1,
0.1590881, -0.1148373, 1.183136, 0, 0, 0, 1, 1,
0.1591422, -0.9993976, 2.26621, 0, 0, 0, 1, 1,
0.1612609, 0.4256171, -1.218872, 0, 0, 0, 1, 1,
0.1625301, 1.33652, 0.2045299, 0, 0, 0, 1, 1,
0.1686108, 1.451691, 0.4930456, 0, 0, 0, 1, 1,
0.1707243, 0.8009915, -0.9150189, 1, 1, 1, 1, 1,
0.1725082, -0.262592, 3.354348, 1, 1, 1, 1, 1,
0.1734645, 0.3760504, 0.5456799, 1, 1, 1, 1, 1,
0.1784547, -0.5191779, 2.464517, 1, 1, 1, 1, 1,
0.1846909, 0.8006919, 0.096029, 1, 1, 1, 1, 1,
0.1848598, -0.7284863, 3.018212, 1, 1, 1, 1, 1,
0.1863669, 2.676407, -0.9061261, 1, 1, 1, 1, 1,
0.1953933, -0.8928421, 1.214193, 1, 1, 1, 1, 1,
0.1984803, -0.4870985, 1.600637, 1, 1, 1, 1, 1,
0.2045355, 0.7945303, -0.5982745, 1, 1, 1, 1, 1,
0.2051418, -0.6879002, 3.178021, 1, 1, 1, 1, 1,
0.2079329, 1.359671, 1.048947, 1, 1, 1, 1, 1,
0.2090706, 2.384997, 1.621882, 1, 1, 1, 1, 1,
0.2094501, 0.7516656, 1.175488, 1, 1, 1, 1, 1,
0.2127341, -0.2332515, 1.884758, 1, 1, 1, 1, 1,
0.2132131, 0.3283004, 0.5439259, 0, 0, 1, 1, 1,
0.2163304, 1.066591, -0.4512985, 1, 0, 0, 1, 1,
0.2257082, -0.05776873, 2.880684, 1, 0, 0, 1, 1,
0.227536, 1.185313, -0.5569965, 1, 0, 0, 1, 1,
0.2282174, -1.635437, 1.412244, 1, 0, 0, 1, 1,
0.2285779, -0.07220241, 1.261443, 1, 0, 0, 1, 1,
0.229086, 1.397591, 0.6794143, 0, 0, 0, 1, 1,
0.2319838, 0.1865578, -0.01366547, 0, 0, 0, 1, 1,
0.234279, -0.1598399, 1.828112, 0, 0, 0, 1, 1,
0.2365868, 0.6793457, 1.549941, 0, 0, 0, 1, 1,
0.238777, -1.319275, 1.56826, 0, 0, 0, 1, 1,
0.243587, 0.2433652, 0.5945354, 0, 0, 0, 1, 1,
0.245598, -0.3177774, 2.611338, 0, 0, 0, 1, 1,
0.2465165, 1.928737, -0.8000435, 1, 1, 1, 1, 1,
0.2511826, 0.8063488, 0.8580586, 1, 1, 1, 1, 1,
0.2516267, 0.5235023, 1.072282, 1, 1, 1, 1, 1,
0.2543141, 0.7217374, 0.2082124, 1, 1, 1, 1, 1,
0.2551114, -0.3560725, 1.319967, 1, 1, 1, 1, 1,
0.2551913, 1.409182, 0.6094285, 1, 1, 1, 1, 1,
0.2578925, 0.6303375, -0.3649551, 1, 1, 1, 1, 1,
0.2636121, -0.9337157, 1.878417, 1, 1, 1, 1, 1,
0.265347, -0.03612548, 1.042001, 1, 1, 1, 1, 1,
0.2658264, -0.4984631, 3.206562, 1, 1, 1, 1, 1,
0.2695994, -0.08608196, 3.029372, 1, 1, 1, 1, 1,
0.2742548, 0.5587897, 1.864363, 1, 1, 1, 1, 1,
0.2751035, -0.7204053, 3.266142, 1, 1, 1, 1, 1,
0.2860875, 0.1964668, 0.005009448, 1, 1, 1, 1, 1,
0.2868012, 0.2547977, 1.706411, 1, 1, 1, 1, 1,
0.2913719, 0.7654207, 2.262356, 0, 0, 1, 1, 1,
0.2980269, 0.5188437, -1.390114, 1, 0, 0, 1, 1,
0.3009582, -0.8832178, 2.085652, 1, 0, 0, 1, 1,
0.3114268, 1.336773, -0.6181805, 1, 0, 0, 1, 1,
0.3120679, 0.1725454, 1.421434, 1, 0, 0, 1, 1,
0.3218496, 1.532361, -0.1772617, 1, 0, 0, 1, 1,
0.3243777, -0.1693522, 1.034262, 0, 0, 0, 1, 1,
0.3291908, 0.8024889, 1.891413, 0, 0, 0, 1, 1,
0.3333152, 0.2824633, 0.9000031, 0, 0, 0, 1, 1,
0.3336759, 0.6459835, 1.381153, 0, 0, 0, 1, 1,
0.3439727, -1.007987, 3.657125, 0, 0, 0, 1, 1,
0.344991, 0.5351036, 0.436851, 0, 0, 0, 1, 1,
0.3503613, -0.6968086, 2.65101, 0, 0, 0, 1, 1,
0.3541814, 0.2143801, 0.1253428, 1, 1, 1, 1, 1,
0.369783, 1.194813, 0.8369526, 1, 1, 1, 1, 1,
0.3799085, -0.1810697, 2.961651, 1, 1, 1, 1, 1,
0.3799298, 0.8551883, 1.604233, 1, 1, 1, 1, 1,
0.3821489, 0.2105235, 1.396393, 1, 1, 1, 1, 1,
0.3850535, -0.2128464, 3.299114, 1, 1, 1, 1, 1,
0.385338, 0.06430205, 0.9355293, 1, 1, 1, 1, 1,
0.3855481, -0.008123081, 1.712777, 1, 1, 1, 1, 1,
0.3862172, 0.9730329, 0.03633469, 1, 1, 1, 1, 1,
0.388825, 1.579545, 1.913662, 1, 1, 1, 1, 1,
0.3890707, -0.7476165, 2.64117, 1, 1, 1, 1, 1,
0.3931484, 1.675732, 1.145987, 1, 1, 1, 1, 1,
0.3941471, 1.348154, 0.01522806, 1, 1, 1, 1, 1,
0.3950342, -1.459784, 2.545027, 1, 1, 1, 1, 1,
0.4002255, 0.4296611, -0.1447997, 1, 1, 1, 1, 1,
0.4115679, 0.3890991, 0.3124338, 0, 0, 1, 1, 1,
0.4207562, 2.381318, 0.3022893, 1, 0, 0, 1, 1,
0.4252118, 0.6066732, 3.784413, 1, 0, 0, 1, 1,
0.4258466, 2.087517, -3.318418, 1, 0, 0, 1, 1,
0.42669, 0.3251154, 0.939591, 1, 0, 0, 1, 1,
0.4291175, 0.2357362, 0.4979984, 1, 0, 0, 1, 1,
0.4295345, 1.136804, 0.5941592, 0, 0, 0, 1, 1,
0.4316046, 0.2731705, 1.493889, 0, 0, 0, 1, 1,
0.4325573, 0.4111173, 1.413191, 0, 0, 0, 1, 1,
0.4342878, 0.08632701, -0.5159247, 0, 0, 0, 1, 1,
0.4343355, -0.9340281, 2.460273, 0, 0, 0, 1, 1,
0.4360447, 0.9993208, 1.608675, 0, 0, 0, 1, 1,
0.4361346, -0.8934752, 2.696921, 0, 0, 0, 1, 1,
0.4370192, 0.578347, 1.83186, 1, 1, 1, 1, 1,
0.4412067, -0.75512, 2.759146, 1, 1, 1, 1, 1,
0.4435131, -1.095014, 3.54076, 1, 1, 1, 1, 1,
0.4494766, -0.6348883, 1.145289, 1, 1, 1, 1, 1,
0.4507694, -0.05407016, 1.516325, 1, 1, 1, 1, 1,
0.4512289, -1.017417, 3.06951, 1, 1, 1, 1, 1,
0.455092, 0.4486254, 0.2420776, 1, 1, 1, 1, 1,
0.4552557, -0.1021606, 0.8189685, 1, 1, 1, 1, 1,
0.456261, -1.019509, 2.943147, 1, 1, 1, 1, 1,
0.4564501, -1.255293, 2.411219, 1, 1, 1, 1, 1,
0.4571583, -0.337091, 2.722019, 1, 1, 1, 1, 1,
0.4634958, 1.33473, 0.9487798, 1, 1, 1, 1, 1,
0.4663961, 1.393127, -1.543092, 1, 1, 1, 1, 1,
0.4702126, 0.8041679, 2.444963, 1, 1, 1, 1, 1,
0.4717827, 0.93355, 0.6279495, 1, 1, 1, 1, 1,
0.4725684, 1.182832, -0.5041247, 0, 0, 1, 1, 1,
0.4753916, 0.3013933, 0.3847118, 1, 0, 0, 1, 1,
0.4772603, 1.253426, -2.267736, 1, 0, 0, 1, 1,
0.4788063, 0.5288405, 0.5872699, 1, 0, 0, 1, 1,
0.4790854, -0.9893152, 2.846913, 1, 0, 0, 1, 1,
0.4807315, 0.1406212, 2.450859, 1, 0, 0, 1, 1,
0.4827053, 0.9647447, 0.4664817, 0, 0, 0, 1, 1,
0.4837508, -0.0285356, 0.8838693, 0, 0, 0, 1, 1,
0.4846627, -1.595127, 3.037686, 0, 0, 0, 1, 1,
0.4849925, 2.681622, -0.6496416, 0, 0, 0, 1, 1,
0.4867913, 0.2732596, 1.972225, 0, 0, 0, 1, 1,
0.4877345, 0.1702801, -0.5900823, 0, 0, 0, 1, 1,
0.4909362, -1.679432, 4.120142, 0, 0, 0, 1, 1,
0.4915336, -0.1036236, 2.357012, 1, 1, 1, 1, 1,
0.4927833, -0.3463502, 3.077171, 1, 1, 1, 1, 1,
0.4938097, 0.6755731, -1.552607, 1, 1, 1, 1, 1,
0.5059651, 0.1897494, 3.542163, 1, 1, 1, 1, 1,
0.506559, -1.823419, 2.891636, 1, 1, 1, 1, 1,
0.5242957, 0.07242055, 2.248425, 1, 1, 1, 1, 1,
0.5271506, 0.9499876, -1.108287, 1, 1, 1, 1, 1,
0.5271823, -0.1469033, -0.4652785, 1, 1, 1, 1, 1,
0.5290884, 1.021944, 1.636247, 1, 1, 1, 1, 1,
0.5315353, 0.8065037, 2.081805, 1, 1, 1, 1, 1,
0.5333259, -0.5616715, 2.693863, 1, 1, 1, 1, 1,
0.5362101, -1.205592, 1.692078, 1, 1, 1, 1, 1,
0.5374091, -0.7506574, 2.486418, 1, 1, 1, 1, 1,
0.5376887, -0.5547285, -0.5117015, 1, 1, 1, 1, 1,
0.5424419, -0.695238, 1.718462, 1, 1, 1, 1, 1,
0.5463102, -0.8647854, 4.850149, 0, 0, 1, 1, 1,
0.5478866, 1.878118, 1.266422, 1, 0, 0, 1, 1,
0.5541817, 0.7006457, 0.5563715, 1, 0, 0, 1, 1,
0.5639063, 0.01245469, 1.610757, 1, 0, 0, 1, 1,
0.5689958, -0.7255539, 3.460924, 1, 0, 0, 1, 1,
0.5690941, -0.9678829, 3.135111, 1, 0, 0, 1, 1,
0.5767214, -0.0969908, 1.237386, 0, 0, 0, 1, 1,
0.5789528, -0.5139505, 1.88605, 0, 0, 0, 1, 1,
0.5814967, 1.653258, 1.931776, 0, 0, 0, 1, 1,
0.5916414, 1.215088, -0.539821, 0, 0, 0, 1, 1,
0.5919846, -0.03226334, 2.307997, 0, 0, 0, 1, 1,
0.5973055, -0.4716615, 3.292404, 0, 0, 0, 1, 1,
0.5988894, -1.476299, 2.011644, 0, 0, 0, 1, 1,
0.59896, 1.263884, 0.4336801, 1, 1, 1, 1, 1,
0.6010549, 1.0105, 0.296775, 1, 1, 1, 1, 1,
0.6033106, -0.6385595, 1.982103, 1, 1, 1, 1, 1,
0.6040735, 0.01342038, 1.290643, 1, 1, 1, 1, 1,
0.6111104, -1.431643, 1.307491, 1, 1, 1, 1, 1,
0.6114521, -1.829578, 1.677833, 1, 1, 1, 1, 1,
0.6127385, 0.06022251, 1.78684, 1, 1, 1, 1, 1,
0.6130993, -0.4683133, 0.7806881, 1, 1, 1, 1, 1,
0.6185449, -0.5836049, 2.313037, 1, 1, 1, 1, 1,
0.6207291, -0.7694523, 2.780863, 1, 1, 1, 1, 1,
0.6227635, -3.356837, 1.700465, 1, 1, 1, 1, 1,
0.6250308, -0.7162117, 2.332748, 1, 1, 1, 1, 1,
0.6268189, 0.6448781, -0.5061253, 1, 1, 1, 1, 1,
0.628325, 1.15121, 0.894571, 1, 1, 1, 1, 1,
0.6364601, -0.4215576, 3.742375, 1, 1, 1, 1, 1,
0.6394983, 0.2476792, 1.878217, 0, 0, 1, 1, 1,
0.6397647, -0.8021109, 1.52916, 1, 0, 0, 1, 1,
0.6515827, -0.8449292, 1.108148, 1, 0, 0, 1, 1,
0.651759, -1.338965, 1.939759, 1, 0, 0, 1, 1,
0.6518201, 0.6766799, 3.226615, 1, 0, 0, 1, 1,
0.6592454, 0.02059836, 2.861218, 1, 0, 0, 1, 1,
0.66978, -0.8577254, 2.981699, 0, 0, 0, 1, 1,
0.6718403, -0.190416, 1.475803, 0, 0, 0, 1, 1,
0.6726082, 0.6253545, 0.3832399, 0, 0, 0, 1, 1,
0.6843758, 1.435845, 1.926095, 0, 0, 0, 1, 1,
0.6921301, -0.2313884, 0.8712277, 0, 0, 0, 1, 1,
0.6970138, -0.05637592, 0.7807449, 0, 0, 0, 1, 1,
0.7179863, -2.105093, 3.865693, 0, 0, 0, 1, 1,
0.7194628, 0.5579709, -0.03153994, 1, 1, 1, 1, 1,
0.7198426, 0.3439951, 2.525257, 1, 1, 1, 1, 1,
0.7214786, 1.410141, 0.2616592, 1, 1, 1, 1, 1,
0.72175, 0.09668205, 2.334074, 1, 1, 1, 1, 1,
0.7252065, -0.5912196, 3.9942, 1, 1, 1, 1, 1,
0.7301372, 2.799527, 0.4133235, 1, 1, 1, 1, 1,
0.7329065, 0.4499148, -0.0355637, 1, 1, 1, 1, 1,
0.7366622, 0.1420911, 3.826069, 1, 1, 1, 1, 1,
0.7411424, -0.7680139, 2.992764, 1, 1, 1, 1, 1,
0.7415959, -1.19289, 0.2926431, 1, 1, 1, 1, 1,
0.7469233, -0.7095319, 1.390234, 1, 1, 1, 1, 1,
0.7511234, -0.5442097, 3.474744, 1, 1, 1, 1, 1,
0.7530631, -0.472529, 2.412835, 1, 1, 1, 1, 1,
0.7542429, 0.64011, 1.924107, 1, 1, 1, 1, 1,
0.7573864, -1.363935, 1.613999, 1, 1, 1, 1, 1,
0.7598702, -0.06739016, 2.500122, 0, 0, 1, 1, 1,
0.7610344, -0.5071321, 2.792657, 1, 0, 0, 1, 1,
0.7616012, 0.5063614, 0.2916421, 1, 0, 0, 1, 1,
0.7617088, 0.08960669, 2.451236, 1, 0, 0, 1, 1,
0.7652605, -0.4928523, 3.91996, 1, 0, 0, 1, 1,
0.7654995, 0.2730469, 0.8859258, 1, 0, 0, 1, 1,
0.7716856, 1.493612, -0.1283985, 0, 0, 0, 1, 1,
0.7732839, -0.5309922, 3.425808, 0, 0, 0, 1, 1,
0.7760661, -0.5553985, 1.373289, 0, 0, 0, 1, 1,
0.7884523, -1.600314, 1.969313, 0, 0, 0, 1, 1,
0.7894896, -0.6766396, 1.925624, 0, 0, 0, 1, 1,
0.7905406, 0.4325325, 0.1989042, 0, 0, 0, 1, 1,
0.7911495, -0.5849728, 1.543904, 0, 0, 0, 1, 1,
0.791766, 0.6147507, 0.2436554, 1, 1, 1, 1, 1,
0.7951969, 1.161282, -0.8743016, 1, 1, 1, 1, 1,
0.8029975, 0.9757801, 1.797678, 1, 1, 1, 1, 1,
0.8171073, -0.8347477, 1.725095, 1, 1, 1, 1, 1,
0.8240365, -0.1525436, -0.5790913, 1, 1, 1, 1, 1,
0.8257188, 0.2722078, 1.516925, 1, 1, 1, 1, 1,
0.8266691, -1.160704, 1.652517, 1, 1, 1, 1, 1,
0.8271125, 0.9872469, 0.07353627, 1, 1, 1, 1, 1,
0.8287721, 1.152032, 0.6153992, 1, 1, 1, 1, 1,
0.8310171, 0.2476819, 2.955222, 1, 1, 1, 1, 1,
0.8340425, -1.175475, 3.592217, 1, 1, 1, 1, 1,
0.8384771, -2.270458, 1.91227, 1, 1, 1, 1, 1,
0.8447677, -0.6296586, 2.506776, 1, 1, 1, 1, 1,
0.8474783, 2.111186, 0.1082409, 1, 1, 1, 1, 1,
0.8546833, 0.0002477226, 1.100437, 1, 1, 1, 1, 1,
0.8552613, 1.283462, 0.02394042, 0, 0, 1, 1, 1,
0.8568095, 0.5642464, 1.10306, 1, 0, 0, 1, 1,
0.8659213, 0.5989391, 1.497617, 1, 0, 0, 1, 1,
0.8721084, 0.004975121, 1.094213, 1, 0, 0, 1, 1,
0.8754469, -0.6304296, 1.121728, 1, 0, 0, 1, 1,
0.883729, -0.001859337, 2.078726, 1, 0, 0, 1, 1,
0.8853813, 0.02463914, 3.12224, 0, 0, 0, 1, 1,
0.8857886, -0.7577395, 1.167801, 0, 0, 0, 1, 1,
0.889949, 1.721669, -0.6765343, 0, 0, 0, 1, 1,
0.896359, -0.3208249, 0.752349, 0, 0, 0, 1, 1,
0.9014603, 0.6933635, 0.5492376, 0, 0, 0, 1, 1,
0.9092762, -0.5485771, 3.006503, 0, 0, 0, 1, 1,
0.9117329, -0.110094, 0.8243579, 0, 0, 0, 1, 1,
0.9161016, -0.5112811, 2.173928, 1, 1, 1, 1, 1,
0.9161077, 0.005137117, 0.5819178, 1, 1, 1, 1, 1,
0.9201142, -0.5430381, 1.825046, 1, 1, 1, 1, 1,
0.9233611, -0.3286201, 2.647317, 1, 1, 1, 1, 1,
0.9246774, 1.523691, 1.448822, 1, 1, 1, 1, 1,
0.9280332, 0.6242594, 1.173208, 1, 1, 1, 1, 1,
0.9280683, 0.661478, -0.4980756, 1, 1, 1, 1, 1,
0.9327225, 0.549948, 0.6963543, 1, 1, 1, 1, 1,
0.9372675, -0.8283317, 4.130948, 1, 1, 1, 1, 1,
0.939635, 2.774492, -0.6774024, 1, 1, 1, 1, 1,
0.9407285, -0.1373381, 0.9048135, 1, 1, 1, 1, 1,
0.9423416, -0.8074664, 3.818939, 1, 1, 1, 1, 1,
0.9428928, 0.08606856, 1.213989, 1, 1, 1, 1, 1,
0.9445643, -0.1975527, 2.536346, 1, 1, 1, 1, 1,
0.9450236, -0.1127138, 1.407664, 1, 1, 1, 1, 1,
0.9494199, -0.3887452, 1.860447, 0, 0, 1, 1, 1,
0.9510621, -1.080625, 2.121459, 1, 0, 0, 1, 1,
0.9563187, 0.5264199, 0.2530524, 1, 0, 0, 1, 1,
0.9571881, -0.2537202, 0.6803281, 1, 0, 0, 1, 1,
0.9599943, 0.4276884, 1.739826, 1, 0, 0, 1, 1,
0.9628915, -0.1479366, 2.461603, 1, 0, 0, 1, 1,
0.9639298, -0.1327859, 2.571909, 0, 0, 0, 1, 1,
0.9728113, 0.9567618, 2.607803, 0, 0, 0, 1, 1,
0.9788503, -0.08173297, 3.070083, 0, 0, 0, 1, 1,
0.9825677, 0.7108842, 0.4743908, 0, 0, 0, 1, 1,
0.9826233, 2.127945, 0.7257826, 0, 0, 0, 1, 1,
0.9879324, 0.276245, -0.4370406, 0, 0, 0, 1, 1,
0.9903496, -0.06116737, 1.202113, 0, 0, 0, 1, 1,
1.002069, -0.1560919, 2.735213, 1, 1, 1, 1, 1,
1.002849, 0.825955, -0.9920964, 1, 1, 1, 1, 1,
1.012418, 1.104561, 0.9891699, 1, 1, 1, 1, 1,
1.013341, -0.03722925, 2.739307, 1, 1, 1, 1, 1,
1.020549, -2.870615, 3.260974, 1, 1, 1, 1, 1,
1.026527, 0.709137, 0.2867628, 1, 1, 1, 1, 1,
1.031324, -1.598182, 2.813078, 1, 1, 1, 1, 1,
1.031617, 0.03093458, 3.143244, 1, 1, 1, 1, 1,
1.035353, -0.7042413, 2.615658, 1, 1, 1, 1, 1,
1.037579, -0.4888461, 2.273356, 1, 1, 1, 1, 1,
1.039749, -1.575693, 4.520698, 1, 1, 1, 1, 1,
1.041388, -1.431833, 2.817811, 1, 1, 1, 1, 1,
1.046153, 1.941716, 0.8741809, 1, 1, 1, 1, 1,
1.047317, 0.0204716, 1.226177, 1, 1, 1, 1, 1,
1.047643, 0.01105151, 2.800913, 1, 1, 1, 1, 1,
1.049807, -0.924061, 2.034171, 0, 0, 1, 1, 1,
1.051372, -1.139766, 1.773685, 1, 0, 0, 1, 1,
1.05739, -0.6686606, 1.347242, 1, 0, 0, 1, 1,
1.05814, -0.1229043, 1.688287, 1, 0, 0, 1, 1,
1.059394, 0.1738583, -0.8463117, 1, 0, 0, 1, 1,
1.074293, 0.05839038, 1.853039, 1, 0, 0, 1, 1,
1.079868, 0.06238568, 0.5762879, 0, 0, 0, 1, 1,
1.081495, 0.02185761, -0.6982701, 0, 0, 0, 1, 1,
1.081819, -0.2546336, 1.549112, 0, 0, 0, 1, 1,
1.084143, 0.7597795, 0.5970028, 0, 0, 0, 1, 1,
1.085914, -1.034273, 1.634264, 0, 0, 0, 1, 1,
1.092124, 0.1832475, 0.3262602, 0, 0, 0, 1, 1,
1.095773, -0.1766294, 2.176224, 0, 0, 0, 1, 1,
1.100545, -0.7372442, 3.975922, 1, 1, 1, 1, 1,
1.107541, 0.3815657, 0.366277, 1, 1, 1, 1, 1,
1.114169, -1.162727, 1.436982, 1, 1, 1, 1, 1,
1.11735, -1.07147, 2.947896, 1, 1, 1, 1, 1,
1.119107, 1.826793, 0.9260216, 1, 1, 1, 1, 1,
1.119418, -0.49528, 1.788382, 1, 1, 1, 1, 1,
1.126925, 0.6510634, 2.116633, 1, 1, 1, 1, 1,
1.127087, -0.4925617, 3.556741, 1, 1, 1, 1, 1,
1.130126, 0.5749254, -0.7968162, 1, 1, 1, 1, 1,
1.147072, -0.07695307, 1.167852, 1, 1, 1, 1, 1,
1.152293, 2.849304, 1.244376, 1, 1, 1, 1, 1,
1.15403, -0.8625455, -0.1214564, 1, 1, 1, 1, 1,
1.154843, 1.501774, 0.3981304, 1, 1, 1, 1, 1,
1.15594, 1.86118, 0.6071705, 1, 1, 1, 1, 1,
1.15654, -2.101951, 2.898543, 1, 1, 1, 1, 1,
1.158792, -1.326372, 3.42115, 0, 0, 1, 1, 1,
1.166089, 1.349066, 1.900773, 1, 0, 0, 1, 1,
1.17395, 1.097926, 1.843437, 1, 0, 0, 1, 1,
1.175354, 0.8981121, 0.01107372, 1, 0, 0, 1, 1,
1.177539, -1.51413, 1.226108, 1, 0, 0, 1, 1,
1.17838, -2.00078, 3.0024, 1, 0, 0, 1, 1,
1.179527, -0.7354593, 2.289045, 0, 0, 0, 1, 1,
1.185626, -0.7457619, 2.410454, 0, 0, 0, 1, 1,
1.185855, 1.59781, -0.9944197, 0, 0, 0, 1, 1,
1.199089, 1.921628, 0.6750595, 0, 0, 0, 1, 1,
1.201008, -0.2481045, 1.983777, 0, 0, 0, 1, 1,
1.203042, 0.03272616, 0.6403227, 0, 0, 0, 1, 1,
1.214652, -0.3461604, 2.005832, 0, 0, 0, 1, 1,
1.22394, -0.6268972, 2.226581, 1, 1, 1, 1, 1,
1.229229, 0.339994, 1.129184, 1, 1, 1, 1, 1,
1.230417, 0.8212404, -0.1884094, 1, 1, 1, 1, 1,
1.250713, 0.0006072344, 3.818951, 1, 1, 1, 1, 1,
1.251892, 0.9656401, 0.7765174, 1, 1, 1, 1, 1,
1.254038, -0.5899336, 2.224478, 1, 1, 1, 1, 1,
1.255455, -0.65358, 0.427108, 1, 1, 1, 1, 1,
1.257433, -0.5558321, -0.5390468, 1, 1, 1, 1, 1,
1.261082, -1.648279, 1.296978, 1, 1, 1, 1, 1,
1.2791, -0.2825548, 1.881234, 1, 1, 1, 1, 1,
1.293258, 0.7906941, 1.486366, 1, 1, 1, 1, 1,
1.294647, 0.7559803, 2.143987, 1, 1, 1, 1, 1,
1.297979, -0.1983338, 1.432303, 1, 1, 1, 1, 1,
1.299151, 0.6861966, 0.9309402, 1, 1, 1, 1, 1,
1.307523, -1.16169, 2.64613, 1, 1, 1, 1, 1,
1.313609, -0.9293951, 1.349562, 0, 0, 1, 1, 1,
1.316665, 0.2846071, 1.032133, 1, 0, 0, 1, 1,
1.32401, 1.40964, 1.574577, 1, 0, 0, 1, 1,
1.324374, -0.8716112, 0.3820656, 1, 0, 0, 1, 1,
1.326055, 0.3392795, 2.289919, 1, 0, 0, 1, 1,
1.327018, -0.4933941, 1.471875, 1, 0, 0, 1, 1,
1.328046, -1.510068, 3.158919, 0, 0, 0, 1, 1,
1.336891, 2.030803, 0.4332302, 0, 0, 0, 1, 1,
1.354758, -0.6890739, 0.5304806, 0, 0, 0, 1, 1,
1.358341, -0.1305736, 1.59942, 0, 0, 0, 1, 1,
1.360748, -0.5970961, 2.094444, 0, 0, 0, 1, 1,
1.371011, -1.312815, 1.464733, 0, 0, 0, 1, 1,
1.40801, 0.2132729, 0.3404986, 0, 0, 0, 1, 1,
1.411662, -2.862096, 2.579468, 1, 1, 1, 1, 1,
1.420299, 0.952786, 0.7315738, 1, 1, 1, 1, 1,
1.429497, 0.4893213, 0.7657584, 1, 1, 1, 1, 1,
1.436032, 0.5772066, -0.1362658, 1, 1, 1, 1, 1,
1.441088, -0.2362914, 2.621923, 1, 1, 1, 1, 1,
1.455488, -0.9776224, 0.3539833, 1, 1, 1, 1, 1,
1.459972, -1.458248, 3.800163, 1, 1, 1, 1, 1,
1.465375, 1.046258, 0.6793037, 1, 1, 1, 1, 1,
1.477006, -0.6210977, 3.044478, 1, 1, 1, 1, 1,
1.490689, 0.8381507, -0.2711231, 1, 1, 1, 1, 1,
1.494248, -0.4541407, 2.342182, 1, 1, 1, 1, 1,
1.49728, 0.003739476, -1.019552, 1, 1, 1, 1, 1,
1.498045, 0.2230904, 0.3629201, 1, 1, 1, 1, 1,
1.501808, -1.115154, 2.570033, 1, 1, 1, 1, 1,
1.520996, -0.796806, 1.892043, 1, 1, 1, 1, 1,
1.574896, -0.325966, 2.136463, 0, 0, 1, 1, 1,
1.596284, -0.7847133, 2.509026, 1, 0, 0, 1, 1,
1.601171, 0.1895379, -0.9599784, 1, 0, 0, 1, 1,
1.601282, 0.3618141, -0.4096808, 1, 0, 0, 1, 1,
1.608078, -1.440321, 2.233614, 1, 0, 0, 1, 1,
1.617629, -0.9424939, 2.471113, 1, 0, 0, 1, 1,
1.624434, 0.3820916, 2.295785, 0, 0, 0, 1, 1,
1.625767, -0.989415, 2.803641, 0, 0, 0, 1, 1,
1.632025, 0.2196092, 0.8399634, 0, 0, 0, 1, 1,
1.648667, -0.968951, 0.9400001, 0, 0, 0, 1, 1,
1.665615, -0.09370596, 0.8843663, 0, 0, 0, 1, 1,
1.667766, -0.718033, 0.3964774, 0, 0, 0, 1, 1,
1.701837, -1.211366, 2.311717, 0, 0, 0, 1, 1,
1.723551, -0.6667985, -0.1931403, 1, 1, 1, 1, 1,
1.729362, 1.501167, 0.6689342, 1, 1, 1, 1, 1,
1.752782, -0.4389751, 3.460069, 1, 1, 1, 1, 1,
1.765018, -0.08869239, 1.380043, 1, 1, 1, 1, 1,
1.770096, -0.6880272, 2.921731, 1, 1, 1, 1, 1,
1.774631, -2.85459, 3.143567, 1, 1, 1, 1, 1,
1.789895, 0.4386671, 0.3634141, 1, 1, 1, 1, 1,
1.826038, -1.452418, 2.024658, 1, 1, 1, 1, 1,
1.836489, -0.9342451, 3.83632, 1, 1, 1, 1, 1,
1.841591, -0.8420293, 2.90436, 1, 1, 1, 1, 1,
1.846182, -0.08036451, 0.4359805, 1, 1, 1, 1, 1,
1.875213, -0.7979692, 1.206092, 1, 1, 1, 1, 1,
1.886231, -0.387842, 1.541873, 1, 1, 1, 1, 1,
1.911711, -0.7328219, 1.805112, 1, 1, 1, 1, 1,
1.913689, 0.395834, 2.557927, 1, 1, 1, 1, 1,
1.925935, 0.5725728, 0.04046683, 0, 0, 1, 1, 1,
1.929537, 0.3823591, 0.8629242, 1, 0, 0, 1, 1,
1.963279, -0.6210488, 1.747269, 1, 0, 0, 1, 1,
1.978197, -2.357048, 1.517589, 1, 0, 0, 1, 1,
2.041976, 0.434761, 1.022146, 1, 0, 0, 1, 1,
2.042764, 1.813774, -0.06875792, 1, 0, 0, 1, 1,
2.078315, 1.386667, 0.3900834, 0, 0, 0, 1, 1,
2.091572, -0.0436423, 1.44277, 0, 0, 0, 1, 1,
2.105217, -0.1709728, 0.1832512, 0, 0, 0, 1, 1,
2.254647, 0.4796079, 1.781656, 0, 0, 0, 1, 1,
2.395089, -1.022987, 1.556871, 0, 0, 0, 1, 1,
2.44123, 1.333818, 0.7629305, 0, 0, 0, 1, 1,
2.444137, 0.3659851, 0.2097683, 0, 0, 0, 1, 1,
2.564036, -1.061747, 2.848635, 1, 1, 1, 1, 1,
2.573225, -0.1382314, 1.764373, 1, 1, 1, 1, 1,
2.582975, -0.1140367, 0.8663125, 1, 1, 1, 1, 1,
2.614805, 0.6218541, 1.003127, 1, 1, 1, 1, 1,
2.835388, -0.7197353, 1.958898, 1, 1, 1, 1, 1,
2.861316, 0.3300605, 1.190926, 1, 1, 1, 1, 1,
3.228474, 0.2574458, 2.079755, 1, 1, 1, 1, 1
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
var radius = 9.456928;
var distance = 33.21706;
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
mvMatrix.translate( 0.03709722, 0.1101463, 0.2884581 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21706);
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