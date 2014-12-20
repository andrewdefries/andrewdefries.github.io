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
-3.284197, 0.7247393, -2.215085, 1, 0, 0, 1,
-2.960225, -1.28642, -2.248434, 1, 0.007843138, 0, 1,
-2.720527, -0.6918519, -1.94783, 1, 0.01176471, 0, 1,
-2.627455, 0.7545413, -1.08807, 1, 0.01960784, 0, 1,
-2.523464, -0.423474, -2.598863, 1, 0.02352941, 0, 1,
-2.408957, 0.1244601, -2.44242, 1, 0.03137255, 0, 1,
-2.399325, 1.13185, -0.2993977, 1, 0.03529412, 0, 1,
-2.382963, -0.00822993, -1.635962, 1, 0.04313726, 0, 1,
-2.371011, 0.1496324, -2.01825, 1, 0.04705882, 0, 1,
-2.367543, 0.5607888, -0.9635438, 1, 0.05490196, 0, 1,
-2.333906, -1.971141, -1.63414, 1, 0.05882353, 0, 1,
-2.318022, -1.124437, -2.492432, 1, 0.06666667, 0, 1,
-2.317187, 0.09635814, -0.5772264, 1, 0.07058824, 0, 1,
-2.304552, 0.05537449, -1.873989, 1, 0.07843138, 0, 1,
-2.274244, -0.3962352, -0.9291197, 1, 0.08235294, 0, 1,
-2.251719, 0.393968, -2.270137, 1, 0.09019608, 0, 1,
-2.238922, 0.5482855, -2.064391, 1, 0.09411765, 0, 1,
-2.220691, -0.4955535, 0.2918439, 1, 0.1019608, 0, 1,
-2.163801, 0.1714482, -2.545376, 1, 0.1098039, 0, 1,
-2.15579, -1.49478, -0.9565964, 1, 0.1137255, 0, 1,
-2.142961, 0.6352939, -2.156495, 1, 0.1215686, 0, 1,
-2.105636, 0.3803138, -0.4951838, 1, 0.1254902, 0, 1,
-2.104073, -0.6128919, -0.1932284, 1, 0.1333333, 0, 1,
-2.079741, -0.4022438, -1.67079, 1, 0.1372549, 0, 1,
-2.077703, -0.01664092, -1.355169, 1, 0.145098, 0, 1,
-2.036322, -0.9224421, -3.471253, 1, 0.1490196, 0, 1,
-2.008574, -0.03001045, -2.675856, 1, 0.1568628, 0, 1,
-1.954969, 0.7599134, -1.768712, 1, 0.1607843, 0, 1,
-1.951754, 0.4729194, -2.074523, 1, 0.1686275, 0, 1,
-1.915838, 2.665482, -0.2905897, 1, 0.172549, 0, 1,
-1.906921, -2.203788, -2.277854, 1, 0.1803922, 0, 1,
-1.906238, 0.02163189, -1.826155, 1, 0.1843137, 0, 1,
-1.883681, 0.2286312, -2.3768, 1, 0.1921569, 0, 1,
-1.881329, 0.4313389, -3.650483, 1, 0.1960784, 0, 1,
-1.876202, 2.260074, -0.4049778, 1, 0.2039216, 0, 1,
-1.869986, -0.9523159, -1.960122, 1, 0.2117647, 0, 1,
-1.802081, 0.8517574, 0.2230048, 1, 0.2156863, 0, 1,
-1.785822, 0.4734182, -2.566397, 1, 0.2235294, 0, 1,
-1.762969, -0.8548604, -2.946398, 1, 0.227451, 0, 1,
-1.758106, -0.7590303, -1.178935, 1, 0.2352941, 0, 1,
-1.755216, -0.5714891, -0.7076061, 1, 0.2392157, 0, 1,
-1.748101, -0.1287192, -0.7498294, 1, 0.2470588, 0, 1,
-1.743946, -0.404766, -2.021802, 1, 0.2509804, 0, 1,
-1.706851, 0.4530834, 0.4211564, 1, 0.2588235, 0, 1,
-1.700927, -0.3948491, -2.96293, 1, 0.2627451, 0, 1,
-1.697423, -1.302676, -1.340802, 1, 0.2705882, 0, 1,
-1.69423, -1.285024, -2.191403, 1, 0.2745098, 0, 1,
-1.69104, -1.351469, -2.237083, 1, 0.282353, 0, 1,
-1.678844, 0.3175146, -1.582005, 1, 0.2862745, 0, 1,
-1.665287, -0.4563958, -0.6656042, 1, 0.2941177, 0, 1,
-1.656943, -0.1477235, -1.936411, 1, 0.3019608, 0, 1,
-1.635807, 0.8897268, -0.5803527, 1, 0.3058824, 0, 1,
-1.62116, -1.058314, -2.937502, 1, 0.3137255, 0, 1,
-1.612629, 1.36764, -1.703615, 1, 0.3176471, 0, 1,
-1.605712, -0.002519771, -1.498285, 1, 0.3254902, 0, 1,
-1.59901, -0.01017161, -1.044545, 1, 0.3294118, 0, 1,
-1.587927, -1.27519, -2.712588, 1, 0.3372549, 0, 1,
-1.576895, -0.1426956, -2.283931, 1, 0.3411765, 0, 1,
-1.562755, 1.082167, 1.533811, 1, 0.3490196, 0, 1,
-1.560694, 0.08877069, -1.427456, 1, 0.3529412, 0, 1,
-1.551573, -0.8759475, -4.134072, 1, 0.3607843, 0, 1,
-1.550385, 0.7958916, -0.4321991, 1, 0.3647059, 0, 1,
-1.547551, 0.8696874, -2.187756, 1, 0.372549, 0, 1,
-1.544561, 0.2964567, -2.047726, 1, 0.3764706, 0, 1,
-1.50768, -0.8482628, -2.826541, 1, 0.3843137, 0, 1,
-1.501591, -0.1602211, -1.399068, 1, 0.3882353, 0, 1,
-1.490317, -1.377009, -1.549844, 1, 0.3960784, 0, 1,
-1.488314, -0.7887644, -1.75221, 1, 0.4039216, 0, 1,
-1.482084, -0.2933078, -2.002909, 1, 0.4078431, 0, 1,
-1.472971, 1.685161, -1.449998, 1, 0.4156863, 0, 1,
-1.465604, 0.6189621, -2.173388, 1, 0.4196078, 0, 1,
-1.434004, 0.1667785, -0.9110138, 1, 0.427451, 0, 1,
-1.433616, 0.9863939, -2.067594, 1, 0.4313726, 0, 1,
-1.430014, -2.537955, -3.722741, 1, 0.4392157, 0, 1,
-1.423343, 1.02573, -1.13543, 1, 0.4431373, 0, 1,
-1.422378, -0.1555246, -1.876047, 1, 0.4509804, 0, 1,
-1.421935, 1.124372, -1.293749, 1, 0.454902, 0, 1,
-1.413912, 0.8448972, -0.06282138, 1, 0.4627451, 0, 1,
-1.409574, -1.148867, -1.54641, 1, 0.4666667, 0, 1,
-1.408801, -0.8754084, -0.9001853, 1, 0.4745098, 0, 1,
-1.404261, -0.7034642, -2.417104, 1, 0.4784314, 0, 1,
-1.393629, 0.5682769, 0.7647261, 1, 0.4862745, 0, 1,
-1.38308, 0.5273659, -1.321222, 1, 0.4901961, 0, 1,
-1.380329, -0.2706398, 0.796562, 1, 0.4980392, 0, 1,
-1.376309, 0.09558227, -2.776548, 1, 0.5058824, 0, 1,
-1.370678, -3.067395, -4.972381, 1, 0.509804, 0, 1,
-1.334596, 0.7692684, -0.5049784, 1, 0.5176471, 0, 1,
-1.332269, -0.5406, -2.017904, 1, 0.5215687, 0, 1,
-1.33211, -2.433459, -1.019021, 1, 0.5294118, 0, 1,
-1.327696, 0.7712476, -0.7312984, 1, 0.5333334, 0, 1,
-1.323338, -0.6956072, -1.096502, 1, 0.5411765, 0, 1,
-1.32053, -0.01378924, -2.500188, 1, 0.5450981, 0, 1,
-1.320374, 0.02402762, -1.76923, 1, 0.5529412, 0, 1,
-1.313337, -0.1428461, -1.074666, 1, 0.5568628, 0, 1,
-1.307763, 1.990111, 0.5937995, 1, 0.5647059, 0, 1,
-1.303255, -0.2561298, -2.450567, 1, 0.5686275, 0, 1,
-1.300416, 0.7633961, -0.8950751, 1, 0.5764706, 0, 1,
-1.290014, -0.3057395, -2.265563, 1, 0.5803922, 0, 1,
-1.285631, -0.7642067, -1.49962, 1, 0.5882353, 0, 1,
-1.284741, -0.1598438, -1.766189, 1, 0.5921569, 0, 1,
-1.278844, -0.8748026, -1.06313, 1, 0.6, 0, 1,
-1.250769, -1.725044, -0.8480935, 1, 0.6078432, 0, 1,
-1.225823, 0.4868149, -2.522016, 1, 0.6117647, 0, 1,
-1.220632, -1.841579, -2.993997, 1, 0.6196079, 0, 1,
-1.21372, 1.346688, -1.369398, 1, 0.6235294, 0, 1,
-1.203767, 0.4399841, -0.9793254, 1, 0.6313726, 0, 1,
-1.198567, 0.8076774, 0.06867221, 1, 0.6352941, 0, 1,
-1.197096, 0.629945, -0.5352209, 1, 0.6431373, 0, 1,
-1.197072, -0.09407409, -0.1005769, 1, 0.6470588, 0, 1,
-1.192268, -1.011971, -2.220952, 1, 0.654902, 0, 1,
-1.191301, 1.801618, -0.9782513, 1, 0.6588235, 0, 1,
-1.190481, -0.7936039, -3.454449, 1, 0.6666667, 0, 1,
-1.179476, -0.431572, -3.537969, 1, 0.6705883, 0, 1,
-1.176927, -0.8343707, -1.937031, 1, 0.6784314, 0, 1,
-1.174896, 2.064081, 0.9535028, 1, 0.682353, 0, 1,
-1.170876, 0.7932557, -1.436613, 1, 0.6901961, 0, 1,
-1.166025, -0.6757353, -2.561905, 1, 0.6941177, 0, 1,
-1.163375, -0.9565737, -1.352725, 1, 0.7019608, 0, 1,
-1.160727, -0.2627505, -5.221107, 1, 0.7098039, 0, 1,
-1.153025, 1.219862, -1.342012, 1, 0.7137255, 0, 1,
-1.137529, 1.190506, 1.05268, 1, 0.7215686, 0, 1,
-1.133216, 0.5677858, -0.3494594, 1, 0.7254902, 0, 1,
-1.131765, 0.8336814, 0.9623467, 1, 0.7333333, 0, 1,
-1.12576, 0.7192584, -2.238239, 1, 0.7372549, 0, 1,
-1.11578, -0.832602, -1.481253, 1, 0.7450981, 0, 1,
-1.107372, -0.08848012, -1.547321, 1, 0.7490196, 0, 1,
-1.092529, 1.003959, -3.100834, 1, 0.7568628, 0, 1,
-1.087181, 0.691018, -1.358976, 1, 0.7607843, 0, 1,
-1.082885, 1.317035, -0.879658, 1, 0.7686275, 0, 1,
-1.080294, 0.5290126, -3.052611, 1, 0.772549, 0, 1,
-1.07777, 0.5022135, -0.5427694, 1, 0.7803922, 0, 1,
-1.075702, 1.557697, -0.9409451, 1, 0.7843137, 0, 1,
-1.06906, 0.6906839, -2.601766, 1, 0.7921569, 0, 1,
-1.068648, 1.263305, -0.1625174, 1, 0.7960784, 0, 1,
-1.060367, -1.621441, -2.876117, 1, 0.8039216, 0, 1,
-1.05654, -0.4714578, -0.957277, 1, 0.8117647, 0, 1,
-1.054967, 2.229757, 1.033276, 1, 0.8156863, 0, 1,
-1.054364, 1.469822, -0.5553551, 1, 0.8235294, 0, 1,
-1.053144, -0.2787319, -1.617922, 1, 0.827451, 0, 1,
-1.048031, 0.5041444, -0.9810496, 1, 0.8352941, 0, 1,
-1.047665, -0.2508001, -0.6809086, 1, 0.8392157, 0, 1,
-1.043847, 2.263043, -0.05893287, 1, 0.8470588, 0, 1,
-1.031164, -1.336478, -1.395139, 1, 0.8509804, 0, 1,
-1.023684, 0.06345901, -1.783074, 1, 0.8588235, 0, 1,
-1.022019, 0.8092273, -0.7413052, 1, 0.8627451, 0, 1,
-1.021495, -0.3986423, -1.22449, 1, 0.8705882, 0, 1,
-1.01915, -2.413069, -3.22202, 1, 0.8745098, 0, 1,
-1.017579, 0.9129073, -1.01405, 1, 0.8823529, 0, 1,
-1.016815, 0.6157719, -0.8709756, 1, 0.8862745, 0, 1,
-1.014307, -0.7663413, -2.852168, 1, 0.8941177, 0, 1,
-1.012248, -2.12455, -3.733751, 1, 0.8980392, 0, 1,
-1.010033, 0.4899129, -0.6420492, 1, 0.9058824, 0, 1,
-1.007617, 1.475867, 0.2466348, 1, 0.9137255, 0, 1,
-0.9980374, -0.6096165, -2.825607, 1, 0.9176471, 0, 1,
-0.9787883, -1.818035, -1.175922, 1, 0.9254902, 0, 1,
-0.9753761, -1.009901, -1.529782, 1, 0.9294118, 0, 1,
-0.963135, -0.1182301, -2.205388, 1, 0.9372549, 0, 1,
-0.96204, 1.694474, 0.7467055, 1, 0.9411765, 0, 1,
-0.9597672, -0.826113, -2.347592, 1, 0.9490196, 0, 1,
-0.9590791, -1.308544, -1.907869, 1, 0.9529412, 0, 1,
-0.9489918, 0.665503, -0.1964094, 1, 0.9607843, 0, 1,
-0.9444038, -1.5931, -2.247672, 1, 0.9647059, 0, 1,
-0.9329969, -1.342817, -2.936194, 1, 0.972549, 0, 1,
-0.9326169, -1.57962, -3.307497, 1, 0.9764706, 0, 1,
-0.9281638, 1.088471, -0.6790583, 1, 0.9843137, 0, 1,
-0.919307, 0.396999, -1.297719, 1, 0.9882353, 0, 1,
-0.9145202, -0.4370918, -1.570951, 1, 0.9960784, 0, 1,
-0.911465, 1.889431, -1.079853, 0.9960784, 1, 0, 1,
-0.910528, 0.119403, -1.942491, 0.9921569, 1, 0, 1,
-0.9080858, 0.7241758, -0.1502438, 0.9843137, 1, 0, 1,
-0.9065722, -0.6069278, -1.424563, 0.9803922, 1, 0, 1,
-0.9059762, 1.771852, 1.324024, 0.972549, 1, 0, 1,
-0.9025605, -0.4601819, -1.518426, 0.9686275, 1, 0, 1,
-0.8924007, -1.101318, -1.369725, 0.9607843, 1, 0, 1,
-0.8900478, 1.037548, -0.3294423, 0.9568627, 1, 0, 1,
-0.8895175, 0.884872, -1.78953, 0.9490196, 1, 0, 1,
-0.888373, -0.8651936, -1.61186, 0.945098, 1, 0, 1,
-0.8883266, 0.2863686, -2.727608, 0.9372549, 1, 0, 1,
-0.883341, 0.7380349, -0.6463929, 0.9333333, 1, 0, 1,
-0.8773443, 1.231197, -2.39184, 0.9254902, 1, 0, 1,
-0.8750951, -0.793763, -3.057297, 0.9215686, 1, 0, 1,
-0.8742997, -0.7339392, -2.821063, 0.9137255, 1, 0, 1,
-0.872073, -0.02389806, -1.938148, 0.9098039, 1, 0, 1,
-0.871465, 0.7371222, -1.269374, 0.9019608, 1, 0, 1,
-0.8714132, 0.2805778, -0.1593829, 0.8941177, 1, 0, 1,
-0.8666416, 0.7837628, -0.6928268, 0.8901961, 1, 0, 1,
-0.8541358, -0.3535419, -2.01838, 0.8823529, 1, 0, 1,
-0.8536467, 2.280725, -1.37365, 0.8784314, 1, 0, 1,
-0.8531539, -0.2782955, -2.375018, 0.8705882, 1, 0, 1,
-0.8525996, -0.1071221, -1.824307, 0.8666667, 1, 0, 1,
-0.851777, 1.128652, -1.074629, 0.8588235, 1, 0, 1,
-0.8491704, -2.088287, -4.333407, 0.854902, 1, 0, 1,
-0.8491564, 1.795083, -0.6985577, 0.8470588, 1, 0, 1,
-0.8490573, 0.2167342, 0.3546281, 0.8431373, 1, 0, 1,
-0.8479244, -1.227143, -2.300776, 0.8352941, 1, 0, 1,
-0.8432546, 0.828886, -1.625643, 0.8313726, 1, 0, 1,
-0.843166, 0.2826447, 0.2471932, 0.8235294, 1, 0, 1,
-0.8430066, 0.1346839, -0.8990718, 0.8196079, 1, 0, 1,
-0.842968, -1.728075, -2.916594, 0.8117647, 1, 0, 1,
-0.8424321, 1.168105, 0.1889236, 0.8078431, 1, 0, 1,
-0.8402267, 0.4463775, -2.595615, 0.8, 1, 0, 1,
-0.8364616, -1.503644, -2.154269, 0.7921569, 1, 0, 1,
-0.8346325, -1.036339, -2.904858, 0.7882353, 1, 0, 1,
-0.8333251, 1.489037, -2.548067, 0.7803922, 1, 0, 1,
-0.8312967, 0.2770264, -0.4008218, 0.7764706, 1, 0, 1,
-0.8296347, 1.412289, -0.2455307, 0.7686275, 1, 0, 1,
-0.8282623, -1.218068, -1.979287, 0.7647059, 1, 0, 1,
-0.8250238, 0.1035201, -2.987143, 0.7568628, 1, 0, 1,
-0.8246833, 0.6608801, -0.09842467, 0.7529412, 1, 0, 1,
-0.8241734, 0.7297744, 0.2207022, 0.7450981, 1, 0, 1,
-0.8210123, 0.3322961, -0.8935918, 0.7411765, 1, 0, 1,
-0.8188067, 0.5243155, -1.739988, 0.7333333, 1, 0, 1,
-0.8153729, -0.4818432, -0.5278436, 0.7294118, 1, 0, 1,
-0.8106102, -0.4418725, -1.873678, 0.7215686, 1, 0, 1,
-0.8095787, 0.1321942, -2.821654, 0.7176471, 1, 0, 1,
-0.8034024, -0.4004588, -0.8273947, 0.7098039, 1, 0, 1,
-0.8026922, -0.7855884, -2.75999, 0.7058824, 1, 0, 1,
-0.8013105, 0.6419737, -0.7210391, 0.6980392, 1, 0, 1,
-0.7998284, -0.6551005, -1.126613, 0.6901961, 1, 0, 1,
-0.7909164, -2.131749, -2.269339, 0.6862745, 1, 0, 1,
-0.7882608, 1.369702, -1.122481, 0.6784314, 1, 0, 1,
-0.7876213, 0.8845651, -0.7195301, 0.6745098, 1, 0, 1,
-0.7851374, -0.5406718, -1.595816, 0.6666667, 1, 0, 1,
-0.7846335, -2.478555, -2.127397, 0.6627451, 1, 0, 1,
-0.7801412, -1.423653, -3.69336, 0.654902, 1, 0, 1,
-0.778155, -0.3423195, -1.456959, 0.6509804, 1, 0, 1,
-0.7766125, -0.7542332, -2.863108, 0.6431373, 1, 0, 1,
-0.7636391, 0.6620634, -0.1727274, 0.6392157, 1, 0, 1,
-0.7621733, -0.5265927, -2.878652, 0.6313726, 1, 0, 1,
-0.7607887, -0.7364122, -3.470554, 0.627451, 1, 0, 1,
-0.7587097, 0.8901374, -0.5725342, 0.6196079, 1, 0, 1,
-0.7552778, 0.8415053, -0.169856, 0.6156863, 1, 0, 1,
-0.7544574, -0.2137915, -0.9165588, 0.6078432, 1, 0, 1,
-0.7509094, -1.158987, -4.667086, 0.6039216, 1, 0, 1,
-0.7503591, -0.5757264, -0.7936699, 0.5960785, 1, 0, 1,
-0.7471736, 0.8029713, -0.3863357, 0.5882353, 1, 0, 1,
-0.7433055, 0.5866902, -0.5846479, 0.5843138, 1, 0, 1,
-0.7417122, -0.02883136, -1.106553, 0.5764706, 1, 0, 1,
-0.7337112, -0.9731265, -2.50508, 0.572549, 1, 0, 1,
-0.7227037, -0.9865061, -3.067548, 0.5647059, 1, 0, 1,
-0.7216444, -0.1624722, -2.525, 0.5607843, 1, 0, 1,
-0.7171121, 1.295477, -1.154414, 0.5529412, 1, 0, 1,
-0.7151725, -1.210775, -3.225424, 0.5490196, 1, 0, 1,
-0.7126619, 1.090725, 1.218805, 0.5411765, 1, 0, 1,
-0.71154, -0.3927411, -0.9488155, 0.5372549, 1, 0, 1,
-0.7085915, -0.4050237, -1.689131, 0.5294118, 1, 0, 1,
-0.7044528, -1.420375, -2.227461, 0.5254902, 1, 0, 1,
-0.7039883, 0.2649347, -0.2541003, 0.5176471, 1, 0, 1,
-0.7038833, -1.083293, -1.920938, 0.5137255, 1, 0, 1,
-0.7030285, -0.5353205, -3.213969, 0.5058824, 1, 0, 1,
-0.7027918, 0.221271, 0.5294459, 0.5019608, 1, 0, 1,
-0.6966342, -1.346629, -2.458375, 0.4941176, 1, 0, 1,
-0.694474, 1.345326, -0.9419976, 0.4862745, 1, 0, 1,
-0.6907402, -0.4956427, -1.034329, 0.4823529, 1, 0, 1,
-0.6838749, 0.6852698, -0.5366194, 0.4745098, 1, 0, 1,
-0.681588, 0.07551134, -1.846327, 0.4705882, 1, 0, 1,
-0.6814972, -0.3276415, -3.880595, 0.4627451, 1, 0, 1,
-0.6687374, -0.5799129, -1.570135, 0.4588235, 1, 0, 1,
-0.6641849, 0.09074434, -2.531039, 0.4509804, 1, 0, 1,
-0.6607527, 0.6144854, -1.111305, 0.4470588, 1, 0, 1,
-0.6591933, 1.087596, -0.07869478, 0.4392157, 1, 0, 1,
-0.657419, 0.6130113, -1.307835, 0.4352941, 1, 0, 1,
-0.6542068, 0.4989322, -0.8856328, 0.427451, 1, 0, 1,
-0.6479147, -1.031235, -2.298381, 0.4235294, 1, 0, 1,
-0.6471506, -0.319428, -2.239871, 0.4156863, 1, 0, 1,
-0.6449203, 1.413714, 0.3874488, 0.4117647, 1, 0, 1,
-0.6374784, 0.351802, -2.035359, 0.4039216, 1, 0, 1,
-0.6285306, -1.304402, -0.8984902, 0.3960784, 1, 0, 1,
-0.6247687, -1.113312, -1.864475, 0.3921569, 1, 0, 1,
-0.6231323, -1.637839, -3.511579, 0.3843137, 1, 0, 1,
-0.6199498, 1.280709, -1.445382, 0.3803922, 1, 0, 1,
-0.6132857, 0.2178293, -2.725973, 0.372549, 1, 0, 1,
-0.607531, -1.335359, -2.984169, 0.3686275, 1, 0, 1,
-0.6066643, -1.438094, -1.895773, 0.3607843, 1, 0, 1,
-0.6020834, 0.002367676, -1.512914, 0.3568628, 1, 0, 1,
-0.601028, 1.130853, -0.1035976, 0.3490196, 1, 0, 1,
-0.593925, -0.3499286, -1.717901, 0.345098, 1, 0, 1,
-0.5904413, 0.8565575, -1.191076, 0.3372549, 1, 0, 1,
-0.5878163, 0.1360246, -1.744759, 0.3333333, 1, 0, 1,
-0.5832933, 1.386053, 0.5291244, 0.3254902, 1, 0, 1,
-0.5827287, 0.2987959, -1.673253, 0.3215686, 1, 0, 1,
-0.580988, -0.8691887, -3.452162, 0.3137255, 1, 0, 1,
-0.5765337, 1.233134, 1.977786, 0.3098039, 1, 0, 1,
-0.5762948, -0.6294119, -1.998474, 0.3019608, 1, 0, 1,
-0.5619338, 0.05324867, -0.323318, 0.2941177, 1, 0, 1,
-0.5581646, -1.651145, -2.041445, 0.2901961, 1, 0, 1,
-0.558002, -0.2046183, -3.501303, 0.282353, 1, 0, 1,
-0.5548244, -0.1893004, -3.335822, 0.2784314, 1, 0, 1,
-0.5489588, -0.5490541, -3.15924, 0.2705882, 1, 0, 1,
-0.5465704, 1.0384, -1.027823, 0.2666667, 1, 0, 1,
-0.5444558, 0.5954619, -2.117079, 0.2588235, 1, 0, 1,
-0.5367451, 0.09280187, -2.234404, 0.254902, 1, 0, 1,
-0.5321869, 0.4816953, -2.326114, 0.2470588, 1, 0, 1,
-0.5278759, -1.117546, -1.597589, 0.2431373, 1, 0, 1,
-0.5236773, 0.03622657, -2.239488, 0.2352941, 1, 0, 1,
-0.5164934, -0.2701925, -1.983742, 0.2313726, 1, 0, 1,
-0.5075769, 0.8495116, -1.03486, 0.2235294, 1, 0, 1,
-0.5009426, 0.1399384, -1.936948, 0.2196078, 1, 0, 1,
-0.4999078, 0.1887029, 0.4710193, 0.2117647, 1, 0, 1,
-0.4943163, 1.83664, -1.110553, 0.2078431, 1, 0, 1,
-0.4935361, -0.3021416, -3.543816, 0.2, 1, 0, 1,
-0.492902, 1.185248, -0.3601953, 0.1921569, 1, 0, 1,
-0.4910606, -1.766747, -4.493133, 0.1882353, 1, 0, 1,
-0.4860401, -1.195129, -4.118023, 0.1803922, 1, 0, 1,
-0.4855916, 0.1147441, -0.5138372, 0.1764706, 1, 0, 1,
-0.4835799, 0.1757616, -3.794824, 0.1686275, 1, 0, 1,
-0.4816843, -0.1969065, -3.941452, 0.1647059, 1, 0, 1,
-0.4758759, 0.6024143, -0.748791, 0.1568628, 1, 0, 1,
-0.4753469, 0.2846287, 0.3752218, 0.1529412, 1, 0, 1,
-0.4732838, -0.7041189, -2.369047, 0.145098, 1, 0, 1,
-0.4703892, -0.6231853, -3.119686, 0.1411765, 1, 0, 1,
-0.4663637, 0.4455537, -3.006804, 0.1333333, 1, 0, 1,
-0.4660691, -1.319422, -2.54371, 0.1294118, 1, 0, 1,
-0.4648949, 1.562217, -0.08282449, 0.1215686, 1, 0, 1,
-0.4632553, 0.6323192, 2.010551, 0.1176471, 1, 0, 1,
-0.4591169, -0.6953239, -2.780285, 0.1098039, 1, 0, 1,
-0.4575472, -0.9053854, -2.816579, 0.1058824, 1, 0, 1,
-0.452756, -2.447636, -4.188782, 0.09803922, 1, 0, 1,
-0.4522686, 0.2162953, -1.221804, 0.09019608, 1, 0, 1,
-0.4506938, -0.2374044, -3.942663, 0.08627451, 1, 0, 1,
-0.4489681, 0.9028485, -0.5547367, 0.07843138, 1, 0, 1,
-0.4470278, 0.5831384, 0.2122366, 0.07450981, 1, 0, 1,
-0.4461239, -0.6914222, -1.47131, 0.06666667, 1, 0, 1,
-0.4407046, 0.521553, -0.9793113, 0.0627451, 1, 0, 1,
-0.4370471, -0.2828429, -2.512809, 0.05490196, 1, 0, 1,
-0.4363467, -0.7266551, -3.522062, 0.05098039, 1, 0, 1,
-0.4329624, 0.7901683, -0.1970843, 0.04313726, 1, 0, 1,
-0.4300392, 1.758842, 0.5368586, 0.03921569, 1, 0, 1,
-0.4292349, 1.546338, -0.8096312, 0.03137255, 1, 0, 1,
-0.4271203, -0.04253509, -1.813525, 0.02745098, 1, 0, 1,
-0.4270098, 1.150945, -0.5560964, 0.01960784, 1, 0, 1,
-0.4254078, 0.8979148, -0.03474331, 0.01568628, 1, 0, 1,
-0.4238436, 1.484809, -0.9704176, 0.007843138, 1, 0, 1,
-0.421758, -1.119342, -2.164704, 0.003921569, 1, 0, 1,
-0.4194874, 1.034208, -0.1737766, 0, 1, 0.003921569, 1,
-0.4188038, 6.458724e-05, -2.54758, 0, 1, 0.01176471, 1,
-0.4156561, -0.8695907, -0.725917, 0, 1, 0.01568628, 1,
-0.3969555, -1.222528, -1.427681, 0, 1, 0.02352941, 1,
-0.3964182, 0.9416312, 0.5239093, 0, 1, 0.02745098, 1,
-0.3898797, 0.445161, -1.310934, 0, 1, 0.03529412, 1,
-0.3831925, 0.5844074, -1.239037, 0, 1, 0.03921569, 1,
-0.3819923, 0.1098612, -1.168689, 0, 1, 0.04705882, 1,
-0.3811932, -1.29496, -4.013119, 0, 1, 0.05098039, 1,
-0.3809336, 0.2595234, -0.3932624, 0, 1, 0.05882353, 1,
-0.3799886, -2.047027, -2.366291, 0, 1, 0.0627451, 1,
-0.3762708, 0.2875423, -1.000047, 0, 1, 0.07058824, 1,
-0.3753784, -0.3106501, -3.088343, 0, 1, 0.07450981, 1,
-0.3734601, 1.272035, -2.4615, 0, 1, 0.08235294, 1,
-0.3673539, -0.8411475, -1.797276, 0, 1, 0.08627451, 1,
-0.3672267, 1.297527, -0.4247858, 0, 1, 0.09411765, 1,
-0.3634165, 0.5923798, -2.067224, 0, 1, 0.1019608, 1,
-0.3588968, 0.1646548, -2.302899, 0, 1, 0.1058824, 1,
-0.3526407, -0.7040915, -3.873639, 0, 1, 0.1137255, 1,
-0.3510675, 0.04414788, 0.009992432, 0, 1, 0.1176471, 1,
-0.3481716, -1.572571, -4.915375, 0, 1, 0.1254902, 1,
-0.3468924, -1.096794, -3.474441, 0, 1, 0.1294118, 1,
-0.3448806, 0.2594236, -0.3051143, 0, 1, 0.1372549, 1,
-0.3391359, 0.6795932, -0.2866434, 0, 1, 0.1411765, 1,
-0.3387978, 0.0447224, -2.553051, 0, 1, 0.1490196, 1,
-0.3316763, 0.3614346, -0.7346616, 0, 1, 0.1529412, 1,
-0.3243838, 1.025069, -0.2734898, 0, 1, 0.1607843, 1,
-0.3239081, -0.2632183, -2.821051, 0, 1, 0.1647059, 1,
-0.3214835, 1.291059, -1.249829, 0, 1, 0.172549, 1,
-0.3202341, 0.3023804, -1.95072, 0, 1, 0.1764706, 1,
-0.3166108, -1.084416, -2.500193, 0, 1, 0.1843137, 1,
-0.3142822, -0.3860469, -2.657653, 0, 1, 0.1882353, 1,
-0.3104929, -0.3082919, -2.923299, 0, 1, 0.1960784, 1,
-0.3088078, 0.1316251, -0.5248575, 0, 1, 0.2039216, 1,
-0.3053644, 0.8899046, -0.8417432, 0, 1, 0.2078431, 1,
-0.3030311, -0.7372756, -4.341487, 0, 1, 0.2156863, 1,
-0.3005177, 0.3923675, -3.424317, 0, 1, 0.2196078, 1,
-0.3004258, -0.7847347, -3.067673, 0, 1, 0.227451, 1,
-0.2997831, 0.4411578, -1.087582, 0, 1, 0.2313726, 1,
-0.2963051, 0.5473733, 1.240966, 0, 1, 0.2392157, 1,
-0.2915969, -0.6446152, -3.53422, 0, 1, 0.2431373, 1,
-0.2908108, 0.8449777, 0.7380985, 0, 1, 0.2509804, 1,
-0.2882089, -0.4489623, -2.883857, 0, 1, 0.254902, 1,
-0.2874897, -1.286895, -5.861232, 0, 1, 0.2627451, 1,
-0.2872867, 0.4791699, 0.5344221, 0, 1, 0.2666667, 1,
-0.2855643, -0.9442835, -3.992374, 0, 1, 0.2745098, 1,
-0.2805612, 0.2237785, 0.1004259, 0, 1, 0.2784314, 1,
-0.2782246, -1.438287, -3.057753, 0, 1, 0.2862745, 1,
-0.277948, 0.3019999, -1.175402, 0, 1, 0.2901961, 1,
-0.2764107, -0.2480762, -2.542304, 0, 1, 0.2980392, 1,
-0.2745417, -1.652717, -4.255561, 0, 1, 0.3058824, 1,
-0.2724852, -0.9363712, -2.999938, 0, 1, 0.3098039, 1,
-0.2707531, 0.7044013, -0.4840174, 0, 1, 0.3176471, 1,
-0.2690471, -1.024853, -2.492311, 0, 1, 0.3215686, 1,
-0.2666684, -0.9839482, -3.971774, 0, 1, 0.3294118, 1,
-0.2616756, -0.5872702, -2.984909, 0, 1, 0.3333333, 1,
-0.2584366, -0.7678814, -3.7391, 0, 1, 0.3411765, 1,
-0.2582057, -0.3738523, -3.132331, 0, 1, 0.345098, 1,
-0.2574405, 0.505789, -2.659934, 0, 1, 0.3529412, 1,
-0.2572183, -1.486472, -2.957611, 0, 1, 0.3568628, 1,
-0.2568226, 0.5007434, 1.037658, 0, 1, 0.3647059, 1,
-0.2562069, 0.7563684, 1.227318, 0, 1, 0.3686275, 1,
-0.2555618, 0.4548341, -0.1593725, 0, 1, 0.3764706, 1,
-0.2506506, 1.104734, 1.114447, 0, 1, 0.3803922, 1,
-0.2491822, 0.1044303, -2.782467, 0, 1, 0.3882353, 1,
-0.2441416, -0.536582, -3.688043, 0, 1, 0.3921569, 1,
-0.2419655, 1.760837, -0.6811983, 0, 1, 0.4, 1,
-0.2417391, 0.1664127, -0.1764243, 0, 1, 0.4078431, 1,
-0.2343238, 2.399561, 0.202279, 0, 1, 0.4117647, 1,
-0.2325787, 0.138997, -1.710733, 0, 1, 0.4196078, 1,
-0.2313472, -0.6130663, -3.837581, 0, 1, 0.4235294, 1,
-0.2309226, -0.5774259, -3.32231, 0, 1, 0.4313726, 1,
-0.2252075, -1.693674, -3.977292, 0, 1, 0.4352941, 1,
-0.2228816, 0.2532264, -0.3470805, 0, 1, 0.4431373, 1,
-0.2222211, 1.524017, 1.220912, 0, 1, 0.4470588, 1,
-0.2190536, -0.7065397, -2.356464, 0, 1, 0.454902, 1,
-0.2183932, 0.9251682, -1.374034, 0, 1, 0.4588235, 1,
-0.2151263, -0.03091743, -2.261832, 0, 1, 0.4666667, 1,
-0.2145693, 0.3850201, -2.074306, 0, 1, 0.4705882, 1,
-0.2145011, -0.7305264, -2.481282, 0, 1, 0.4784314, 1,
-0.2138987, 0.1765491, -0.1026601, 0, 1, 0.4823529, 1,
-0.2125139, -1.29361, -2.309083, 0, 1, 0.4901961, 1,
-0.2086313, 1.530154, -0.4653598, 0, 1, 0.4941176, 1,
-0.2073505, -0.1264886, -2.179289, 0, 1, 0.5019608, 1,
-0.2055092, -0.4842606, -2.0854, 0, 1, 0.509804, 1,
-0.2005486, 0.7900708, 0.6441293, 0, 1, 0.5137255, 1,
-0.1981788, -0.8707371, -3.883064, 0, 1, 0.5215687, 1,
-0.1970382, 0.785432, -1.295054, 0, 1, 0.5254902, 1,
-0.1932853, -1.994722, -2.545406, 0, 1, 0.5333334, 1,
-0.1871978, 0.9841023, 0.931201, 0, 1, 0.5372549, 1,
-0.1865679, 0.5148876, -0.5694792, 0, 1, 0.5450981, 1,
-0.1860954, 0.5227945, -1.241508, 0, 1, 0.5490196, 1,
-0.1857352, 0.02295337, -2.126801, 0, 1, 0.5568628, 1,
-0.1831241, -0.8686805, -4.11392, 0, 1, 0.5607843, 1,
-0.1804929, -1.171466, -3.051881, 0, 1, 0.5686275, 1,
-0.1739346, 1.873603, 0.9407114, 0, 1, 0.572549, 1,
-0.1695905, -1.8281, -2.888247, 0, 1, 0.5803922, 1,
-0.1690158, 0.2523519, -2.858186, 0, 1, 0.5843138, 1,
-0.1687614, 0.9177175, -0.5146205, 0, 1, 0.5921569, 1,
-0.1675704, 0.02481842, -1.974936, 0, 1, 0.5960785, 1,
-0.16575, 0.8211572, -0.8467019, 0, 1, 0.6039216, 1,
-0.1609389, -0.5096971, -3.548352, 0, 1, 0.6117647, 1,
-0.1605615, -0.7188559, -3.835174, 0, 1, 0.6156863, 1,
-0.1594465, 1.105469, -2.66515, 0, 1, 0.6235294, 1,
-0.1586229, -0.833769, -2.172931, 0, 1, 0.627451, 1,
-0.1577389, 0.1792582, -0.2820666, 0, 1, 0.6352941, 1,
-0.1572181, 0.6713611, -2.151752, 0, 1, 0.6392157, 1,
-0.1561625, 1.739211, 1.040094, 0, 1, 0.6470588, 1,
-0.152456, 0.5768383, -0.007345659, 0, 1, 0.6509804, 1,
-0.1521889, -0.6459906, -1.761991, 0, 1, 0.6588235, 1,
-0.1510551, -1.904727, -4.085272, 0, 1, 0.6627451, 1,
-0.1499085, 2.115344, -1.385238, 0, 1, 0.6705883, 1,
-0.1442405, 1.088809, -0.4636464, 0, 1, 0.6745098, 1,
-0.1431406, 1.393176, -1.193964, 0, 1, 0.682353, 1,
-0.1424813, -0.03992792, -1.513083, 0, 1, 0.6862745, 1,
-0.1404772, -0.9711827, -1.942868, 0, 1, 0.6941177, 1,
-0.1399823, -0.6441582, -2.580756, 0, 1, 0.7019608, 1,
-0.1366176, -1.195175, -2.31999, 0, 1, 0.7058824, 1,
-0.1359387, -1.388382, -1.690823, 0, 1, 0.7137255, 1,
-0.1347387, -1.074527, -3.349045, 0, 1, 0.7176471, 1,
-0.1319798, 1.98338, 0.3734136, 0, 1, 0.7254902, 1,
-0.1311745, -1.190696, -3.008368, 0, 1, 0.7294118, 1,
-0.1278097, 0.8003587, -0.3052595, 0, 1, 0.7372549, 1,
-0.1266184, 1.987728, 0.1361122, 0, 1, 0.7411765, 1,
-0.1223257, -0.6536823, -3.734131, 0, 1, 0.7490196, 1,
-0.1178992, 1.545096, 0.2519626, 0, 1, 0.7529412, 1,
-0.11622, 0.1510909, -0.4616798, 0, 1, 0.7607843, 1,
-0.1073552, -0.2281507, -1.280177, 0, 1, 0.7647059, 1,
-0.1061054, 0.2244414, 0.8725823, 0, 1, 0.772549, 1,
-0.1055931, -0.417114, -2.308087, 0, 1, 0.7764706, 1,
-0.1041972, 0.806245, 1.329091, 0, 1, 0.7843137, 1,
-0.1001697, 1.224662, -0.2198541, 0, 1, 0.7882353, 1,
-0.09909084, -2.400594, -2.982766, 0, 1, 0.7960784, 1,
-0.09658341, -0.2138214, -1.82155, 0, 1, 0.8039216, 1,
-0.09116897, -0.4391421, -2.128059, 0, 1, 0.8078431, 1,
-0.0851128, -1.716935, -3.794882, 0, 1, 0.8156863, 1,
-0.08343821, 1.434821, 0.825056, 0, 1, 0.8196079, 1,
-0.07655665, -0.8856119, -2.947653, 0, 1, 0.827451, 1,
-0.07325876, 1.528929, -1.05459, 0, 1, 0.8313726, 1,
-0.07191254, 0.5642143, -1.463499, 0, 1, 0.8392157, 1,
-0.07038485, 0.3836987, -0.6124386, 0, 1, 0.8431373, 1,
-0.0691549, 0.2020343, -0.8587227, 0, 1, 0.8509804, 1,
-0.06376885, -0.6110762, -3.436723, 0, 1, 0.854902, 1,
-0.06141902, -0.6862708, -4.551576, 0, 1, 0.8627451, 1,
-0.06002145, 0.5992489, 1.064769, 0, 1, 0.8666667, 1,
-0.05915006, 0.6460099, 0.06585194, 0, 1, 0.8745098, 1,
-0.0589407, -0.7718208, -3.538465, 0, 1, 0.8784314, 1,
-0.05410515, 1.019129, -1.278615, 0, 1, 0.8862745, 1,
-0.05303871, -0.1100966, -2.669375, 0, 1, 0.8901961, 1,
-0.05148837, 1.352311, -0.8125589, 0, 1, 0.8980392, 1,
-0.0510158, 0.1989925, -2.070152, 0, 1, 0.9058824, 1,
-0.04917286, -1.046214, -3.074375, 0, 1, 0.9098039, 1,
-0.0475869, 1.627245, -1.245403, 0, 1, 0.9176471, 1,
-0.04631996, -0.6273459, -4.189902, 0, 1, 0.9215686, 1,
-0.04387629, 1.791822, -0.1367933, 0, 1, 0.9294118, 1,
-0.04230506, -0.7681562, -4.074403, 0, 1, 0.9333333, 1,
-0.03405482, -1.920359, -2.592487, 0, 1, 0.9411765, 1,
-0.03044225, -1.223321, -1.336524, 0, 1, 0.945098, 1,
-0.02858604, -1.187728, -3.232205, 0, 1, 0.9529412, 1,
-0.02746386, 1.74024, -0.09300847, 0, 1, 0.9568627, 1,
-0.02676883, 0.7193, -0.5025648, 0, 1, 0.9647059, 1,
-0.02299006, 1.40165, 1.792636, 0, 1, 0.9686275, 1,
-0.01631406, 0.208789, 1.760687, 0, 1, 0.9764706, 1,
-0.01574578, -0.5670054, -1.948761, 0, 1, 0.9803922, 1,
-0.008539093, -0.5006851, -4.742025, 0, 1, 0.9882353, 1,
-0.00842958, 0.6867102, -2.931891, 0, 1, 0.9921569, 1,
-0.001738557, 0.7189197, -1.67927, 0, 1, 1, 1,
-0.0006734235, 0.04008386, -0.903314, 0, 0.9921569, 1, 1,
0.003638766, 0.3874068, -0.06046806, 0, 0.9882353, 1, 1,
0.003825788, -0.1383366, 0.7531426, 0, 0.9803922, 1, 1,
0.005222866, 0.321612, -1.656049, 0, 0.9764706, 1, 1,
0.008559739, 0.6544679, 0.3822432, 0, 0.9686275, 1, 1,
0.01731858, 0.2300899, -0.2314561, 0, 0.9647059, 1, 1,
0.01741578, 0.9348853, -0.3806928, 0, 0.9568627, 1, 1,
0.01818024, 0.8482143, 0.6111929, 0, 0.9529412, 1, 1,
0.0198421, 1.480355, -1.188914, 0, 0.945098, 1, 1,
0.02016211, 1.309162, -2.346243, 0, 0.9411765, 1, 1,
0.02164731, -1.261007, 3.356808, 0, 0.9333333, 1, 1,
0.02777769, 1.283772, 1.222336, 0, 0.9294118, 1, 1,
0.02939129, -0.07342294, 1.078125, 0, 0.9215686, 1, 1,
0.03013619, -0.3561364, 3.930778, 0, 0.9176471, 1, 1,
0.03140986, 0.7400739, 0.3898938, 0, 0.9098039, 1, 1,
0.0321889, 1.083908, 1.045131, 0, 0.9058824, 1, 1,
0.03255577, -0.06995642, 0.2614273, 0, 0.8980392, 1, 1,
0.0379047, 0.6599777, 0.6440802, 0, 0.8901961, 1, 1,
0.04143438, -0.4358043, 2.330625, 0, 0.8862745, 1, 1,
0.04278457, 0.3960982, 0.8241162, 0, 0.8784314, 1, 1,
0.04323413, 0.3735009, -0.5450224, 0, 0.8745098, 1, 1,
0.0468245, 0.7436908, 0.9578401, 0, 0.8666667, 1, 1,
0.04753144, -0.783318, 3.590168, 0, 0.8627451, 1, 1,
0.04868939, -0.2946104, 2.676559, 0, 0.854902, 1, 1,
0.05455878, 1.204178, 0.6057253, 0, 0.8509804, 1, 1,
0.05469796, 0.5146937, 0.1366935, 0, 0.8431373, 1, 1,
0.05780917, -0.4376809, 2.488413, 0, 0.8392157, 1, 1,
0.06131642, -0.4268491, 3.675409, 0, 0.8313726, 1, 1,
0.06413565, 0.8555017, -0.8338789, 0, 0.827451, 1, 1,
0.06579776, 1.285527, 1.655903, 0, 0.8196079, 1, 1,
0.06649137, 0.618731, -1.426278, 0, 0.8156863, 1, 1,
0.07155798, 0.9267299, -1.020999, 0, 0.8078431, 1, 1,
0.07251669, 1.255655, -0.1016496, 0, 0.8039216, 1, 1,
0.07965128, -1.319048, 3.526695, 0, 0.7960784, 1, 1,
0.08085489, 0.5082417, -1.07773, 0, 0.7882353, 1, 1,
0.08141258, 2.342091, -0.8177882, 0, 0.7843137, 1, 1,
0.08237484, -0.191412, 1.818605, 0, 0.7764706, 1, 1,
0.08328274, 0.9677519, 0.8271412, 0, 0.772549, 1, 1,
0.08333205, -1.261378, 3.104712, 0, 0.7647059, 1, 1,
0.08353811, 0.1398395, -0.435165, 0, 0.7607843, 1, 1,
0.08577222, 0.1741225, -0.3476385, 0, 0.7529412, 1, 1,
0.0931882, 0.2434929, 0.1352249, 0, 0.7490196, 1, 1,
0.09600338, 0.5284248, -0.2948257, 0, 0.7411765, 1, 1,
0.096256, 0.676857, -0.2594364, 0, 0.7372549, 1, 1,
0.09962364, 0.2532133, -1.13512, 0, 0.7294118, 1, 1,
0.09974178, -0.8280891, 3.478555, 0, 0.7254902, 1, 1,
0.09999917, 0.7901443, -0.0865607, 0, 0.7176471, 1, 1,
0.1033961, -0.07561114, 0.6398715, 0, 0.7137255, 1, 1,
0.105758, 0.2451254, -0.9969222, 0, 0.7058824, 1, 1,
0.1064719, 0.9073537, -0.5325133, 0, 0.6980392, 1, 1,
0.1087431, -0.1506094, 1.655793, 0, 0.6941177, 1, 1,
0.1090729, 0.7006051, 1.597478, 0, 0.6862745, 1, 1,
0.113152, 0.09071559, 1.34043, 0, 0.682353, 1, 1,
0.1148719, -1.516407, 0.4692641, 0, 0.6745098, 1, 1,
0.115149, 1.555737, 0.3850915, 0, 0.6705883, 1, 1,
0.1229107, -1.286926, 2.322547, 0, 0.6627451, 1, 1,
0.1245653, 1.584019, 0.384746, 0, 0.6588235, 1, 1,
0.1292266, -0.2319801, 3.333097, 0, 0.6509804, 1, 1,
0.1347216, 0.5042999, -1.77789, 0, 0.6470588, 1, 1,
0.1348282, -0.9656237, 3.367913, 0, 0.6392157, 1, 1,
0.1359146, 0.08909624, 0.2457566, 0, 0.6352941, 1, 1,
0.1412826, -0.6142575, 5.4955, 0, 0.627451, 1, 1,
0.1501372, -0.6269717, 3.059234, 0, 0.6235294, 1, 1,
0.1545874, -0.1432801, 3.228029, 0, 0.6156863, 1, 1,
0.1562188, -0.3638889, 3.659115, 0, 0.6117647, 1, 1,
0.1585186, -1.365393, 3.175462, 0, 0.6039216, 1, 1,
0.1593538, -0.2663433, 1.429155, 0, 0.5960785, 1, 1,
0.1600688, -0.02278937, 2.556041, 0, 0.5921569, 1, 1,
0.1601589, -0.4066032, 4.143773, 0, 0.5843138, 1, 1,
0.1674604, -0.8354368, 4.37403, 0, 0.5803922, 1, 1,
0.1687759, 0.9887493, 1.079703, 0, 0.572549, 1, 1,
0.1697221, 0.7837283, 1.373083, 0, 0.5686275, 1, 1,
0.1785912, 0.3504869, 0.2555579, 0, 0.5607843, 1, 1,
0.1815639, -0.2529647, 1.910139, 0, 0.5568628, 1, 1,
0.1843919, -2.312995, 2.935293, 0, 0.5490196, 1, 1,
0.1854715, -1.182568, 4.703199, 0, 0.5450981, 1, 1,
0.1933271, 0.1966603, -0.2560782, 0, 0.5372549, 1, 1,
0.1957465, -0.6214334, 4.227364, 0, 0.5333334, 1, 1,
0.2023733, 1.188105, 0.7132415, 0, 0.5254902, 1, 1,
0.2028361, 0.7085642, 1.621044, 0, 0.5215687, 1, 1,
0.205142, -0.4701863, 2.980011, 0, 0.5137255, 1, 1,
0.2068695, 0.05888426, 2.678913, 0, 0.509804, 1, 1,
0.2135221, 0.2139964, 0.8626387, 0, 0.5019608, 1, 1,
0.2168894, 1.398227, -0.6714187, 0, 0.4941176, 1, 1,
0.2186847, -0.6494471, 4.048741, 0, 0.4901961, 1, 1,
0.2214988, -0.680522, 1.905457, 0, 0.4823529, 1, 1,
0.2264239, -0.4325324, 1.807268, 0, 0.4784314, 1, 1,
0.2310695, 0.4744337, 1.087891, 0, 0.4705882, 1, 1,
0.2316674, -0.5069547, 4.041884, 0, 0.4666667, 1, 1,
0.2362992, 1.848887, 1.078001, 0, 0.4588235, 1, 1,
0.2417545, 1.033743, -1.725496, 0, 0.454902, 1, 1,
0.2469813, 0.6283713, 1.948473, 0, 0.4470588, 1, 1,
0.2484653, -0.7377158, 1.428919, 0, 0.4431373, 1, 1,
0.24954, 1.597977, 0.6000619, 0, 0.4352941, 1, 1,
0.251155, -0.7864051, 2.248068, 0, 0.4313726, 1, 1,
0.2512056, 0.1731946, 1.591312, 0, 0.4235294, 1, 1,
0.2514263, 0.2441161, 0.380146, 0, 0.4196078, 1, 1,
0.2559814, -0.4942985, 4.599584, 0, 0.4117647, 1, 1,
0.2595405, 0.3055397, 0.8856055, 0, 0.4078431, 1, 1,
0.259951, 0.5059432, 1.013597, 0, 0.4, 1, 1,
0.2606898, 0.139995, 2.263835, 0, 0.3921569, 1, 1,
0.2612516, 0.9685267, 0.5908571, 0, 0.3882353, 1, 1,
0.2636853, -1.400558, 2.29393, 0, 0.3803922, 1, 1,
0.2646871, -1.433208, 2.141312, 0, 0.3764706, 1, 1,
0.2652214, -0.571885, 2.179401, 0, 0.3686275, 1, 1,
0.2669824, -0.1730028, 1.876238, 0, 0.3647059, 1, 1,
0.2671009, 0.5108553, -0.5052478, 0, 0.3568628, 1, 1,
0.2700678, -0.3017615, 1.856194, 0, 0.3529412, 1, 1,
0.2719238, -0.2768804, 3.592078, 0, 0.345098, 1, 1,
0.274646, 0.6858591, 1.293894, 0, 0.3411765, 1, 1,
0.2801951, -0.6889614, 2.324023, 0, 0.3333333, 1, 1,
0.2847948, 0.4199503, -0.1370647, 0, 0.3294118, 1, 1,
0.2858515, -0.8043466, 1.763986, 0, 0.3215686, 1, 1,
0.2869786, -2.607242, 3.647747, 0, 0.3176471, 1, 1,
0.2887945, 0.09191202, 3.206614, 0, 0.3098039, 1, 1,
0.2893119, 0.4109653, -0.4212275, 0, 0.3058824, 1, 1,
0.2896743, -0.2871416, 2.044359, 0, 0.2980392, 1, 1,
0.29299, 0.9090932, -1.175296, 0, 0.2901961, 1, 1,
0.2934671, -0.8228597, 3.597573, 0, 0.2862745, 1, 1,
0.2935215, -0.8342127, 2.513314, 0, 0.2784314, 1, 1,
0.294277, -0.631538, 3.650161, 0, 0.2745098, 1, 1,
0.2958146, 1.12657, 1.361085, 0, 0.2666667, 1, 1,
0.2981235, 1.990857, 0.3581997, 0, 0.2627451, 1, 1,
0.3009438, 0.9975077, 1.561787, 0, 0.254902, 1, 1,
0.3030562, -1.0594, 3.679625, 0, 0.2509804, 1, 1,
0.3036082, 1.180458, -0.7673408, 0, 0.2431373, 1, 1,
0.3048188, 0.1525955, 1.176623, 0, 0.2392157, 1, 1,
0.309659, -0.3078409, 3.067199, 0, 0.2313726, 1, 1,
0.3156602, -1.659297, 4.233945, 0, 0.227451, 1, 1,
0.3156606, -0.2150541, 2.995085, 0, 0.2196078, 1, 1,
0.3252031, -1.659783, 1.80951, 0, 0.2156863, 1, 1,
0.3267335, 0.7277557, 1.901255, 0, 0.2078431, 1, 1,
0.3314187, 0.8935928, 0.1898175, 0, 0.2039216, 1, 1,
0.3327247, -1.003274, 4.297037, 0, 0.1960784, 1, 1,
0.3337412, 0.8858961, 1.748061, 0, 0.1882353, 1, 1,
0.3401887, 0.6206718, -0.3239562, 0, 0.1843137, 1, 1,
0.3418829, -0.2592455, 2.844069, 0, 0.1764706, 1, 1,
0.3422111, -0.3136552, 4.230758, 0, 0.172549, 1, 1,
0.346246, -1.763544, 4.226457, 0, 0.1647059, 1, 1,
0.3476951, 1.294924, -0.1887621, 0, 0.1607843, 1, 1,
0.3503085, -0.2105095, 3.141865, 0, 0.1529412, 1, 1,
0.3508384, 2.362663, 0.253351, 0, 0.1490196, 1, 1,
0.3555028, 1.052224, 1.159118, 0, 0.1411765, 1, 1,
0.3613516, 0.318474, 0.5958804, 0, 0.1372549, 1, 1,
0.3795654, 1.1626, 2.595056, 0, 0.1294118, 1, 1,
0.3845111, -0.4035988, 1.989828, 0, 0.1254902, 1, 1,
0.3857886, 0.3353185, 0.5032076, 0, 0.1176471, 1, 1,
0.3916428, -1.156031, 2.376933, 0, 0.1137255, 1, 1,
0.3967244, -0.4428219, 2.462498, 0, 0.1058824, 1, 1,
0.4034291, -0.2432013, 0.2839931, 0, 0.09803922, 1, 1,
0.4047297, -0.05192701, 1.652667, 0, 0.09411765, 1, 1,
0.4053304, 0.8481224, -0.5867321, 0, 0.08627451, 1, 1,
0.4114185, 0.04593771, 0.2832242, 0, 0.08235294, 1, 1,
0.4133841, -0.8246608, 1.59457, 0, 0.07450981, 1, 1,
0.4142047, -0.6880365, 3.674242, 0, 0.07058824, 1, 1,
0.416564, -1.242626, 1.762055, 0, 0.0627451, 1, 1,
0.4192921, -0.2468804, 2.800337, 0, 0.05882353, 1, 1,
0.4198422, 1.692665, -0.5931224, 0, 0.05098039, 1, 1,
0.4201583, 0.2818889, 2.264591, 0, 0.04705882, 1, 1,
0.4223861, -0.1267903, 1.646608, 0, 0.03921569, 1, 1,
0.4257796, 0.1745737, 1.457774, 0, 0.03529412, 1, 1,
0.4266456, 1.084136, 1.559806, 0, 0.02745098, 1, 1,
0.4355443, 0.344784, -0.1216507, 0, 0.02352941, 1, 1,
0.4375669, -0.7549456, 3.091633, 0, 0.01568628, 1, 1,
0.4388543, 0.4218033, 2.37094, 0, 0.01176471, 1, 1,
0.4392253, -0.7808912, 2.703346, 0, 0.003921569, 1, 1,
0.4416057, 1.444631, -0.4466821, 0.003921569, 0, 1, 1,
0.4424184, -0.3877348, 3.739907, 0.007843138, 0, 1, 1,
0.444198, 0.339319, 0.649012, 0.01568628, 0, 1, 1,
0.4447013, -0.950147, 3.466837, 0.01960784, 0, 1, 1,
0.4468946, -0.85984, 3.017551, 0.02745098, 0, 1, 1,
0.4478245, -0.7748226, 2.356735, 0.03137255, 0, 1, 1,
0.4482612, 0.1661577, 2.22134, 0.03921569, 0, 1, 1,
0.449049, -0.3090608, 2.201891, 0.04313726, 0, 1, 1,
0.44986, 0.6574824, 1.815305, 0.05098039, 0, 1, 1,
0.4519659, 1.135223, 0.4056925, 0.05490196, 0, 1, 1,
0.4540581, 1.114629, -1.641922, 0.0627451, 0, 1, 1,
0.4601553, 0.1744388, 1.964685, 0.06666667, 0, 1, 1,
0.4627776, 0.4561893, 0.9996724, 0.07450981, 0, 1, 1,
0.4634559, 1.139632, -1.308897, 0.07843138, 0, 1, 1,
0.4642426, 0.5255833, 0.6356161, 0.08627451, 0, 1, 1,
0.4661504, 1.264364, 1.767173, 0.09019608, 0, 1, 1,
0.4700792, 0.06494694, 0.2437802, 0.09803922, 0, 1, 1,
0.4706969, -0.5356446, 3.064898, 0.1058824, 0, 1, 1,
0.471152, -0.07842413, 0.2927079, 0.1098039, 0, 1, 1,
0.4720321, 1.302558, 0.5378981, 0.1176471, 0, 1, 1,
0.4745281, 0.0252145, 0.9712386, 0.1215686, 0, 1, 1,
0.4751128, -1.673235, 3.303554, 0.1294118, 0, 1, 1,
0.4754643, -0.7988654, 2.117157, 0.1333333, 0, 1, 1,
0.4757306, -0.2646492, 2.837818, 0.1411765, 0, 1, 1,
0.4804592, -0.328611, 1.582555, 0.145098, 0, 1, 1,
0.4907655, -0.8222888, 3.182385, 0.1529412, 0, 1, 1,
0.4908984, -0.9356683, 1.712114, 0.1568628, 0, 1, 1,
0.4924214, -0.2075467, 0.6901396, 0.1647059, 0, 1, 1,
0.4937778, -1.01518, 2.507898, 0.1686275, 0, 1, 1,
0.5030268, -0.4770196, 3.856262, 0.1764706, 0, 1, 1,
0.503233, 0.9936699, -0.7501445, 0.1803922, 0, 1, 1,
0.5045499, -0.2949449, 3.06309, 0.1882353, 0, 1, 1,
0.5061527, -1.399763, 3.900383, 0.1921569, 0, 1, 1,
0.5087715, 0.5641213, 1.317988, 0.2, 0, 1, 1,
0.5099707, 0.3774996, -0.4571513, 0.2078431, 0, 1, 1,
0.511635, -2.416264, 2.871406, 0.2117647, 0, 1, 1,
0.511869, 0.9408195, 1.360922, 0.2196078, 0, 1, 1,
0.5125356, -0.03957189, 2.79953, 0.2235294, 0, 1, 1,
0.5137407, -0.7349604, 4.829035, 0.2313726, 0, 1, 1,
0.5194685, 0.8440495, 0.3934036, 0.2352941, 0, 1, 1,
0.5216432, 0.3240878, 1.839687, 0.2431373, 0, 1, 1,
0.5225993, 0.6264189, -1.30685, 0.2470588, 0, 1, 1,
0.5249225, 0.2764074, 0.8485311, 0.254902, 0, 1, 1,
0.5253246, -2.360549, 1.590493, 0.2588235, 0, 1, 1,
0.5287088, -0.4107263, 0.7127733, 0.2666667, 0, 1, 1,
0.5330012, 0.3084645, 3.474418, 0.2705882, 0, 1, 1,
0.5342993, 2.053163, -0.3586353, 0.2784314, 0, 1, 1,
0.5366997, -0.1982923, 0.642188, 0.282353, 0, 1, 1,
0.5416952, -0.6343198, 2.414464, 0.2901961, 0, 1, 1,
0.543933, 1.000196, 1.580073, 0.2941177, 0, 1, 1,
0.5443968, 0.0681086, 1.627714, 0.3019608, 0, 1, 1,
0.5445083, -1.820923, 3.617081, 0.3098039, 0, 1, 1,
0.5484434, -1.78598, 3.724072, 0.3137255, 0, 1, 1,
0.5508093, 0.2107024, 1.664038, 0.3215686, 0, 1, 1,
0.5529192, -1.637716, 2.968799, 0.3254902, 0, 1, 1,
0.5533667, -0.01024454, 1.207918, 0.3333333, 0, 1, 1,
0.5537983, -0.3951798, 0.9221328, 0.3372549, 0, 1, 1,
0.5562161, -0.1046944, -1.577963, 0.345098, 0, 1, 1,
0.5679619, 2.048406, 0.304415, 0.3490196, 0, 1, 1,
0.5745533, 1.939737, 0.05857583, 0.3568628, 0, 1, 1,
0.578087, -0.617603, 3.243456, 0.3607843, 0, 1, 1,
0.5783917, -2.14012, 3.643113, 0.3686275, 0, 1, 1,
0.5790014, -1.750117, 5.000399, 0.372549, 0, 1, 1,
0.5791973, -0.4281805, 2.493732, 0.3803922, 0, 1, 1,
0.5793789, -1.623031, 3.622437, 0.3843137, 0, 1, 1,
0.5960507, 0.458951, 2.777475, 0.3921569, 0, 1, 1,
0.5995946, -0.3349053, -0.1354141, 0.3960784, 0, 1, 1,
0.6022907, -1.194419, 1.669041, 0.4039216, 0, 1, 1,
0.6105846, 0.02535067, 2.464276, 0.4117647, 0, 1, 1,
0.6112517, 1.622309, 0.7090487, 0.4156863, 0, 1, 1,
0.6121656, 0.3681079, 2.001778, 0.4235294, 0, 1, 1,
0.6164111, 1.731167, 1.250179, 0.427451, 0, 1, 1,
0.6193733, 0.09774466, 0.5378253, 0.4352941, 0, 1, 1,
0.6217584, 1.06364, -0.7119341, 0.4392157, 0, 1, 1,
0.6237161, 1.068075, 2.460631, 0.4470588, 0, 1, 1,
0.6250737, -1.409668, 2.05663, 0.4509804, 0, 1, 1,
0.6259873, 1.548765, -0.1848579, 0.4588235, 0, 1, 1,
0.6382233, -0.4806266, 0.3547343, 0.4627451, 0, 1, 1,
0.6409799, -1.260182, 3.157778, 0.4705882, 0, 1, 1,
0.6413301, 0.5641488, -0.495905, 0.4745098, 0, 1, 1,
0.6434082, -1.514671, 1.337414, 0.4823529, 0, 1, 1,
0.6462258, -0.2229063, 0.7900329, 0.4862745, 0, 1, 1,
0.647504, -1.330362, 4.463603, 0.4941176, 0, 1, 1,
0.6504367, 1.27496, 2.032269, 0.5019608, 0, 1, 1,
0.6535239, -1.367871, 2.16088, 0.5058824, 0, 1, 1,
0.6548095, -1.476197, 2.94161, 0.5137255, 0, 1, 1,
0.6551336, -1.652192, 2.82257, 0.5176471, 0, 1, 1,
0.6669289, 0.9582902, 1.166703, 0.5254902, 0, 1, 1,
0.6711357, -0.5502951, 1.189703, 0.5294118, 0, 1, 1,
0.6729671, 0.1660276, 2.922691, 0.5372549, 0, 1, 1,
0.6729995, 0.6011809, 1.869462, 0.5411765, 0, 1, 1,
0.6752065, -0.0399634, -0.4186575, 0.5490196, 0, 1, 1,
0.6762223, -1.297067, 0.2481762, 0.5529412, 0, 1, 1,
0.6806975, 1.180461, 1.513959, 0.5607843, 0, 1, 1,
0.6835753, -0.425971, 1.989249, 0.5647059, 0, 1, 1,
0.6882806, 1.05462, 0.03771706, 0.572549, 0, 1, 1,
0.6945753, -1.597955, 0.1871876, 0.5764706, 0, 1, 1,
0.7000257, -1.485971, 3.309898, 0.5843138, 0, 1, 1,
0.7082822, 0.3470947, 0.362734, 0.5882353, 0, 1, 1,
0.7097931, -1.218558, 2.768836, 0.5960785, 0, 1, 1,
0.7105318, -0.5004244, 3.626391, 0.6039216, 0, 1, 1,
0.7114407, -0.2692947, 1.970138, 0.6078432, 0, 1, 1,
0.7118414, -0.4801662, 2.638534, 0.6156863, 0, 1, 1,
0.7173675, 1.50607, 0.009612846, 0.6196079, 0, 1, 1,
0.7286355, -0.8849139, 0.7484474, 0.627451, 0, 1, 1,
0.7298905, 0.7222577, -0.2945706, 0.6313726, 0, 1, 1,
0.7346944, -0.6435495, 2.898517, 0.6392157, 0, 1, 1,
0.7362264, 0.1616486, -1.310389, 0.6431373, 0, 1, 1,
0.7379432, -0.3619454, 1.467026, 0.6509804, 0, 1, 1,
0.7379729, -0.6943907, 2.944932, 0.654902, 0, 1, 1,
0.7426922, -1.465587, 3.967703, 0.6627451, 0, 1, 1,
0.7445264, -2.814766, 2.753807, 0.6666667, 0, 1, 1,
0.7492124, 0.06051991, 1.243692, 0.6745098, 0, 1, 1,
0.7511135, 0.5002135, 1.390207, 0.6784314, 0, 1, 1,
0.7533746, -0.716823, 3.067066, 0.6862745, 0, 1, 1,
0.761686, -0.5425513, 1.189507, 0.6901961, 0, 1, 1,
0.7717974, -0.5514799, 2.586556, 0.6980392, 0, 1, 1,
0.772613, -0.2348682, 1.877495, 0.7058824, 0, 1, 1,
0.7732663, 0.9654727, -1.437134, 0.7098039, 0, 1, 1,
0.7838165, -1.966885, 1.006958, 0.7176471, 0, 1, 1,
0.7859175, -0.2053757, 3.045564, 0.7215686, 0, 1, 1,
0.7895461, -2.155847, 1.652989, 0.7294118, 0, 1, 1,
0.7908632, 1.109409, 1.600359, 0.7333333, 0, 1, 1,
0.7913191, -1.395785, 1.320078, 0.7411765, 0, 1, 1,
0.7940069, 0.3785206, 2.088346, 0.7450981, 0, 1, 1,
0.7980484, 0.2390623, 2.196862, 0.7529412, 0, 1, 1,
0.8001001, -0.6915231, 3.334856, 0.7568628, 0, 1, 1,
0.8011137, -1.28388, 1.94438, 0.7647059, 0, 1, 1,
0.8052265, 0.793781, 0.6435577, 0.7686275, 0, 1, 1,
0.8111563, -0.7026147, 1.333705, 0.7764706, 0, 1, 1,
0.818516, -0.3500466, 1.839454, 0.7803922, 0, 1, 1,
0.8224309, -1.661597, 2.190371, 0.7882353, 0, 1, 1,
0.8228523, -1.142687, 2.951813, 0.7921569, 0, 1, 1,
0.8243716, 0.9977157, 1.943397, 0.8, 0, 1, 1,
0.8278948, -2.666139, 5.238888, 0.8078431, 0, 1, 1,
0.8323705, -0.223118, 2.649575, 0.8117647, 0, 1, 1,
0.8345345, 1.053856, -0.6254876, 0.8196079, 0, 1, 1,
0.8357403, -2.281542, 3.10677, 0.8235294, 0, 1, 1,
0.8372757, 0.01046199, -0.1282019, 0.8313726, 0, 1, 1,
0.8414253, 0.8328011, 1.63337, 0.8352941, 0, 1, 1,
0.8429505, -1.945913, 4.648958, 0.8431373, 0, 1, 1,
0.8433589, -0.4385644, 2.64471, 0.8470588, 0, 1, 1,
0.8475971, -0.4217717, 1.593143, 0.854902, 0, 1, 1,
0.8709208, 0.6420317, 1.835992, 0.8588235, 0, 1, 1,
0.8740164, 0.217602, 1.026494, 0.8666667, 0, 1, 1,
0.8753748, 0.379173, 0.4542951, 0.8705882, 0, 1, 1,
0.8760238, 0.3925928, 0.8158767, 0.8784314, 0, 1, 1,
0.8766457, -0.685602, 1.257421, 0.8823529, 0, 1, 1,
0.8805382, -1.085004, 2.590099, 0.8901961, 0, 1, 1,
0.8820273, -1.745931, 2.072487, 0.8941177, 0, 1, 1,
0.8893124, 0.346768, 1.619245, 0.9019608, 0, 1, 1,
0.8898747, 0.1337633, 2.832067, 0.9098039, 0, 1, 1,
0.8904127, 1.454747, 0.5293451, 0.9137255, 0, 1, 1,
0.8905055, -1.868365, 2.073355, 0.9215686, 0, 1, 1,
0.8912167, 0.8438993, 1.731413, 0.9254902, 0, 1, 1,
0.8922652, 1.576257, 0.7362317, 0.9333333, 0, 1, 1,
0.8959926, 1.064366, 1.689965, 0.9372549, 0, 1, 1,
0.8992431, -0.2667588, 1.774984, 0.945098, 0, 1, 1,
0.8997168, 0.187333, 0.6391215, 0.9490196, 0, 1, 1,
0.900843, 0.897209, 1.019865, 0.9568627, 0, 1, 1,
0.9090416, -0.2100176, 1.748024, 0.9607843, 0, 1, 1,
0.9115909, 1.132923, -0.0657859, 0.9686275, 0, 1, 1,
0.9179258, 0.6902936, 1.407236, 0.972549, 0, 1, 1,
0.92551, -0.5766304, 1.423341, 0.9803922, 0, 1, 1,
0.9255664, 0.5206593, 1.234713, 0.9843137, 0, 1, 1,
0.928661, -0.6960791, 4.600772, 0.9921569, 0, 1, 1,
0.9330238, -0.6449884, 2.697958, 0.9960784, 0, 1, 1,
0.9515979, -0.6347404, 2.004454, 1, 0, 0.9960784, 1,
0.9559261, 0.5464044, 1.230756, 1, 0, 0.9882353, 1,
0.9636934, -0.4281644, 0.8243325, 1, 0, 0.9843137, 1,
0.9751634, -1.168314, 2.235978, 1, 0, 0.9764706, 1,
0.9880623, -0.34735, 1.216111, 1, 0, 0.972549, 1,
0.9947774, -0.8435746, 2.300112, 1, 0, 0.9647059, 1,
0.9987991, 0.70504, -0.05071056, 1, 0, 0.9607843, 1,
0.998836, 0.8601288, 0.6211877, 1, 0, 0.9529412, 1,
1.00082, -0.083209, 2.009492, 1, 0, 0.9490196, 1,
1.008603, 0.7212069, -0.1669805, 1, 0, 0.9411765, 1,
1.015076, -0.7624981, 2.497056, 1, 0, 0.9372549, 1,
1.022944, -1.306159, 2.951117, 1, 0, 0.9294118, 1,
1.026294, 0.506798, 1.059967, 1, 0, 0.9254902, 1,
1.026512, -1.565768, 2.117454, 1, 0, 0.9176471, 1,
1.030974, -2.27458, 1.992925, 1, 0, 0.9137255, 1,
1.032325, 0.04355463, 2.26699, 1, 0, 0.9058824, 1,
1.034851, -2.202121, 3.545752, 1, 0, 0.9019608, 1,
1.037111, 0.7968243, -0.2401484, 1, 0, 0.8941177, 1,
1.037303, 1.00169, 1.483294, 1, 0, 0.8862745, 1,
1.040401, 1.306435, 0.605288, 1, 0, 0.8823529, 1,
1.041214, -0.1843652, -0.2600409, 1, 0, 0.8745098, 1,
1.043441, 1.031048, 1.237371, 1, 0, 0.8705882, 1,
1.052362, 0.4347053, 0.7851456, 1, 0, 0.8627451, 1,
1.05433, -0.7376811, 1.988533, 1, 0, 0.8588235, 1,
1.055978, -0.01681696, 2.59269, 1, 0, 0.8509804, 1,
1.057239, 0.3652327, 0.7618603, 1, 0, 0.8470588, 1,
1.058275, -1.245792, 4.621188, 1, 0, 0.8392157, 1,
1.068326, 0.6808176, 0.8202784, 1, 0, 0.8352941, 1,
1.068864, 0.2443763, 2.066451, 1, 0, 0.827451, 1,
1.072939, -0.345032, 2.504252, 1, 0, 0.8235294, 1,
1.081774, 0.8934997, 1.469549, 1, 0, 0.8156863, 1,
1.086264, -0.1820375, 1.828719, 1, 0, 0.8117647, 1,
1.089552, 1.097079, 0.9476001, 1, 0, 0.8039216, 1,
1.095932, -0.2923135, 1.325241, 1, 0, 0.7960784, 1,
1.097492, 0.5305333, 0.02876301, 1, 0, 0.7921569, 1,
1.098176, 0.2600428, 1.494981, 1, 0, 0.7843137, 1,
1.109355, -1.727474, 1.126857, 1, 0, 0.7803922, 1,
1.111505, 0.9090043, -1.145782, 1, 0, 0.772549, 1,
1.116493, -0.4421697, 3.1719, 1, 0, 0.7686275, 1,
1.122339, 1.443284, 0.5900571, 1, 0, 0.7607843, 1,
1.126957, 0.2426034, 1.872085, 1, 0, 0.7568628, 1,
1.134709, -1.460197, 2.273817, 1, 0, 0.7490196, 1,
1.136574, 0.3208408, 2.671522, 1, 0, 0.7450981, 1,
1.144658, -0.9362687, 3.091819, 1, 0, 0.7372549, 1,
1.145829, 0.9701746, 1.045557, 1, 0, 0.7333333, 1,
1.152175, 1.163983, 1.73561, 1, 0, 0.7254902, 1,
1.154358, -0.7452428, 3.452459, 1, 0, 0.7215686, 1,
1.158435, -0.3280457, 2.618356, 1, 0, 0.7137255, 1,
1.162531, -0.1790024, 0.3442407, 1, 0, 0.7098039, 1,
1.163034, 1.87746, 0.1393861, 1, 0, 0.7019608, 1,
1.170865, -0.2083338, 3.021298, 1, 0, 0.6941177, 1,
1.17774, 0.07574724, 0.9152056, 1, 0, 0.6901961, 1,
1.188965, -0.5520355, 1.43929, 1, 0, 0.682353, 1,
1.199468, -1.569534, 2.111667, 1, 0, 0.6784314, 1,
1.208278, -1.304645, 2.414638, 1, 0, 0.6705883, 1,
1.209556, -1.566781, 4.138579, 1, 0, 0.6666667, 1,
1.212752, 1.80448, 0.6709247, 1, 0, 0.6588235, 1,
1.218364, 0.05421075, 1.869247, 1, 0, 0.654902, 1,
1.221908, 0.6978925, 3.385905, 1, 0, 0.6470588, 1,
1.224143, -0.9235314, 2.88678, 1, 0, 0.6431373, 1,
1.22617, 0.1212063, 3.080574, 1, 0, 0.6352941, 1,
1.233683, 0.7120789, -0.3024338, 1, 0, 0.6313726, 1,
1.246503, -0.1545732, 2.618517, 1, 0, 0.6235294, 1,
1.248419, 0.1854971, 0.622856, 1, 0, 0.6196079, 1,
1.253155, 0.2226354, 1.424216, 1, 0, 0.6117647, 1,
1.257388, -2.618106, 1.883088, 1, 0, 0.6078432, 1,
1.263326, 0.3385246, 1.54432, 1, 0, 0.6, 1,
1.263706, -1.579656, 1.513832, 1, 0, 0.5921569, 1,
1.26371, -0.2615967, 0.3026084, 1, 0, 0.5882353, 1,
1.264065, 0.2210227, 3.397936, 1, 0, 0.5803922, 1,
1.271598, -0.203284, 0.09904698, 1, 0, 0.5764706, 1,
1.272101, -0.1456706, 0.6784018, 1, 0, 0.5686275, 1,
1.274133, 0.9200489, 0.2719256, 1, 0, 0.5647059, 1,
1.283619, -0.733993, 0.6833017, 1, 0, 0.5568628, 1,
1.285383, 0.7637364, 1.313356, 1, 0, 0.5529412, 1,
1.296809, 1.517739, 0.1009395, 1, 0, 0.5450981, 1,
1.302714, -1.532026, 3.286011, 1, 0, 0.5411765, 1,
1.305284, -0.3309295, 3.996503, 1, 0, 0.5333334, 1,
1.310403, -1.216917, 2.697055, 1, 0, 0.5294118, 1,
1.321384, -0.1650815, 0.5347403, 1, 0, 0.5215687, 1,
1.330489, 1.308821, 1.022889, 1, 0, 0.5176471, 1,
1.340337, 2.336282, 1.290483, 1, 0, 0.509804, 1,
1.346089, 1.882535, 1.316503, 1, 0, 0.5058824, 1,
1.350086, 1.217984, 0.6619043, 1, 0, 0.4980392, 1,
1.351243, 1.745973, 0.8831505, 1, 0, 0.4901961, 1,
1.353649, -0.2372377, 0.747112, 1, 0, 0.4862745, 1,
1.356342, -0.8850554, 3.837926, 1, 0, 0.4784314, 1,
1.361281, 1.278472, 2.23134, 1, 0, 0.4745098, 1,
1.374589, 0.3716087, 2.34249, 1, 0, 0.4666667, 1,
1.379059, -0.144494, 1.593907, 1, 0, 0.4627451, 1,
1.38129, -1.055441, 2.428789, 1, 0, 0.454902, 1,
1.38549, 0.2660784, 2.255749, 1, 0, 0.4509804, 1,
1.38642, 0.05051764, 1.696, 1, 0, 0.4431373, 1,
1.397918, -0.4781021, 1.624646, 1, 0, 0.4392157, 1,
1.419619, -1.397721, 2.912125, 1, 0, 0.4313726, 1,
1.43747, 0.7192574, -0.9134512, 1, 0, 0.427451, 1,
1.449579, -0.006489928, 0.3050375, 1, 0, 0.4196078, 1,
1.452309, 0.1725615, 2.049995, 1, 0, 0.4156863, 1,
1.48971, 0.2088733, 2.002549, 1, 0, 0.4078431, 1,
1.507076, -1.021764, 1.07919, 1, 0, 0.4039216, 1,
1.516207, -0.6085463, 3.420689, 1, 0, 0.3960784, 1,
1.520839, 1.646464, 2.798119, 1, 0, 0.3882353, 1,
1.521671, 0.6690622, 0.8124982, 1, 0, 0.3843137, 1,
1.524557, -0.7732091, 0.8664234, 1, 0, 0.3764706, 1,
1.537443, 0.2359959, 0.7928343, 1, 0, 0.372549, 1,
1.537861, 1.295229, 1.3402, 1, 0, 0.3647059, 1,
1.541284, 0.3451104, 4.022288, 1, 0, 0.3607843, 1,
1.548331, -1.431873, 3.129871, 1, 0, 0.3529412, 1,
1.550343, 0.03400206, 1.324691, 1, 0, 0.3490196, 1,
1.55103, -0.5510423, 1.323122, 1, 0, 0.3411765, 1,
1.55633, -0.7235008, 3.223661, 1, 0, 0.3372549, 1,
1.56886, -0.1735517, 2.992993, 1, 0, 0.3294118, 1,
1.582303, 0.9346821, 0.6126273, 1, 0, 0.3254902, 1,
1.586318, 0.4245077, 0.1067955, 1, 0, 0.3176471, 1,
1.620708, -0.04840706, 1.315612, 1, 0, 0.3137255, 1,
1.65977, 2.010867, -0.8159857, 1, 0, 0.3058824, 1,
1.663746, -0.9113514, 2.967016, 1, 0, 0.2980392, 1,
1.664242, -0.2485473, 0.8409144, 1, 0, 0.2941177, 1,
1.692796, 0.02186625, 3.389601, 1, 0, 0.2862745, 1,
1.702807, -0.4720165, 3.109433, 1, 0, 0.282353, 1,
1.7355, 2.154944, -0.2513739, 1, 0, 0.2745098, 1,
1.741382, 0.4863339, 0.3843167, 1, 0, 0.2705882, 1,
1.741561, -1.347074, 3.602563, 1, 0, 0.2627451, 1,
1.747589, 1.127132, -0.6087994, 1, 0, 0.2588235, 1,
1.749173, 0.2390174, 0.5731472, 1, 0, 0.2509804, 1,
1.760029, -0.07410776, -0.4897876, 1, 0, 0.2470588, 1,
1.76822, 0.08343846, 2.111932, 1, 0, 0.2392157, 1,
1.772713, -0.4855857, 2.993212, 1, 0, 0.2352941, 1,
1.820711, -1.155295, 2.209309, 1, 0, 0.227451, 1,
1.845285, 0.6664565, 0.964628, 1, 0, 0.2235294, 1,
1.845385, 0.2824464, 1.345152, 1, 0, 0.2156863, 1,
1.871758, 0.3175775, 1.030496, 1, 0, 0.2117647, 1,
1.876902, -0.006360315, 0.3560704, 1, 0, 0.2039216, 1,
1.877294, 0.4571616, 0.8421841, 1, 0, 0.1960784, 1,
1.882076, 0.1245659, -0.1187637, 1, 0, 0.1921569, 1,
1.883772, 0.852014, 1.648261, 1, 0, 0.1843137, 1,
1.884499, 0.1689834, 1.332679, 1, 0, 0.1803922, 1,
1.885228, -0.4394723, 2.826823, 1, 0, 0.172549, 1,
1.891075, -0.5220657, 2.001895, 1, 0, 0.1686275, 1,
1.916341, -1.409562, 2.298709, 1, 0, 0.1607843, 1,
1.928148, -0.4509854, 1.691335, 1, 0, 0.1568628, 1,
1.93248, 0.2458979, 0.3130539, 1, 0, 0.1490196, 1,
1.947845, 0.7221717, 1.584515, 1, 0, 0.145098, 1,
2.001496, 0.2278914, 1.672874, 1, 0, 0.1372549, 1,
2.014131, 0.2741099, 0.3388663, 1, 0, 0.1333333, 1,
2.034294, 0.2237926, 2.572634, 1, 0, 0.1254902, 1,
2.046182, -0.4181984, 1.064244, 1, 0, 0.1215686, 1,
2.058951, -0.6238327, 2.577472, 1, 0, 0.1137255, 1,
2.059792, 0.7283659, 1.375345, 1, 0, 0.1098039, 1,
2.086696, 1.089873, -0.04434989, 1, 0, 0.1019608, 1,
2.103482, 2.702705, 1.697848, 1, 0, 0.09411765, 1,
2.156885, 0.624495, 1.274525, 1, 0, 0.09019608, 1,
2.164832, -0.03735458, 4.083319, 1, 0, 0.08235294, 1,
2.211976, -0.06801828, 1.055347, 1, 0, 0.07843138, 1,
2.231381, -1.281825, 0.8689418, 1, 0, 0.07058824, 1,
2.253501, -0.05036855, 1.873066, 1, 0, 0.06666667, 1,
2.29216, 0.5113262, 1.95578, 1, 0, 0.05882353, 1,
2.318229, 0.2909766, -0.06270475, 1, 0, 0.05490196, 1,
2.36798, 1.042607, 1.69248, 1, 0, 0.04705882, 1,
2.375273, 1.544029, 1.100553, 1, 0, 0.04313726, 1,
2.422571, -1.183294, 1.608839, 1, 0, 0.03529412, 1,
2.717275, -0.8113274, 2.387286, 1, 0, 0.03137255, 1,
2.813766, 0.3259137, 1.629489, 1, 0, 0.02352941, 1,
2.907043, -0.4034885, 2.247, 1, 0, 0.01960784, 1,
3.16279, -0.5450348, 3.741939, 1, 0, 0.01176471, 1,
3.310303, -0.6501147, 1.021726, 1, 0, 0.007843138, 1
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
0.01305342, -4.045427, -7.786199, 0, -0.5, 0.5, 0.5,
0.01305342, -4.045427, -7.786199, 1, -0.5, 0.5, 0.5,
0.01305342, -4.045427, -7.786199, 1, 1.5, 0.5, 0.5,
0.01305342, -4.045427, -7.786199, 0, 1.5, 0.5, 0.5
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
-4.401964, -0.182345, -7.786199, 0, -0.5, 0.5, 0.5,
-4.401964, -0.182345, -7.786199, 1, -0.5, 0.5, 0.5,
-4.401964, -0.182345, -7.786199, 1, 1.5, 0.5, 0.5,
-4.401964, -0.182345, -7.786199, 0, 1.5, 0.5, 0.5
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
-4.401964, -4.045427, -0.1828661, 0, -0.5, 0.5, 0.5,
-4.401964, -4.045427, -0.1828661, 1, -0.5, 0.5, 0.5,
-4.401964, -4.045427, -0.1828661, 1, 1.5, 0.5, 0.5,
-4.401964, -4.045427, -0.1828661, 0, 1.5, 0.5, 0.5
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
-3, -3.153947, -6.031583,
3, -3.153947, -6.031583,
-3, -3.153947, -6.031583,
-3, -3.302527, -6.324019,
-2, -3.153947, -6.031583,
-2, -3.302527, -6.324019,
-1, -3.153947, -6.031583,
-1, -3.302527, -6.324019,
0, -3.153947, -6.031583,
0, -3.302527, -6.324019,
1, -3.153947, -6.031583,
1, -3.302527, -6.324019,
2, -3.153947, -6.031583,
2, -3.302527, -6.324019,
3, -3.153947, -6.031583,
3, -3.302527, -6.324019
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
-3, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
-3, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
-3, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
-3, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
-2, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
-2, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
-2, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
-2, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
-1, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
-1, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
-1, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
-1, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
0, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
0, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
0, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
0, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
1, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
1, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
1, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
1, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
2, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
2, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
2, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
2, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5,
3, -3.599687, -6.908891, 0, -0.5, 0.5, 0.5,
3, -3.599687, -6.908891, 1, -0.5, 0.5, 0.5,
3, -3.599687, -6.908891, 1, 1.5, 0.5, 0.5,
3, -3.599687, -6.908891, 0, 1.5, 0.5, 0.5
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
-3.383114, -3, -6.031583,
-3.383114, 2, -6.031583,
-3.383114, -3, -6.031583,
-3.552922, -3, -6.324019,
-3.383114, -2, -6.031583,
-3.552922, -2, -6.324019,
-3.383114, -1, -6.031583,
-3.552922, -1, -6.324019,
-3.383114, 0, -6.031583,
-3.552922, 0, -6.324019,
-3.383114, 1, -6.031583,
-3.552922, 1, -6.324019,
-3.383114, 2, -6.031583,
-3.552922, 2, -6.324019
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
-3.892539, -3, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, -3, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, -3, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, -3, -6.908891, 0, 1.5, 0.5, 0.5,
-3.892539, -2, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, -2, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, -2, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, -2, -6.908891, 0, 1.5, 0.5, 0.5,
-3.892539, -1, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, -1, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, -1, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, -1, -6.908891, 0, 1.5, 0.5, 0.5,
-3.892539, 0, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, 0, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, 0, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, 0, -6.908891, 0, 1.5, 0.5, 0.5,
-3.892539, 1, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, 1, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, 1, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, 1, -6.908891, 0, 1.5, 0.5, 0.5,
-3.892539, 2, -6.908891, 0, -0.5, 0.5, 0.5,
-3.892539, 2, -6.908891, 1, -0.5, 0.5, 0.5,
-3.892539, 2, -6.908891, 1, 1.5, 0.5, 0.5,
-3.892539, 2, -6.908891, 0, 1.5, 0.5, 0.5
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
-3.383114, -3.153947, -4,
-3.383114, -3.153947, 4,
-3.383114, -3.153947, -4,
-3.552922, -3.302527, -4,
-3.383114, -3.153947, -2,
-3.552922, -3.302527, -2,
-3.383114, -3.153947, 0,
-3.552922, -3.302527, 0,
-3.383114, -3.153947, 2,
-3.552922, -3.302527, 2,
-3.383114, -3.153947, 4,
-3.552922, -3.302527, 4
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
-3.892539, -3.599687, -4, 0, -0.5, 0.5, 0.5,
-3.892539, -3.599687, -4, 1, -0.5, 0.5, 0.5,
-3.892539, -3.599687, -4, 1, 1.5, 0.5, 0.5,
-3.892539, -3.599687, -4, 0, 1.5, 0.5, 0.5,
-3.892539, -3.599687, -2, 0, -0.5, 0.5, 0.5,
-3.892539, -3.599687, -2, 1, -0.5, 0.5, 0.5,
-3.892539, -3.599687, -2, 1, 1.5, 0.5, 0.5,
-3.892539, -3.599687, -2, 0, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 0, 0, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 0, 1, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 0, 1, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 0, 0, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 2, 0, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 2, 1, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 2, 1, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 2, 0, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 4, 0, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 4, 1, -0.5, 0.5, 0.5,
-3.892539, -3.599687, 4, 1, 1.5, 0.5, 0.5,
-3.892539, -3.599687, 4, 0, 1.5, 0.5, 0.5
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
-3.383114, -3.153947, -6.031583,
-3.383114, 2.789257, -6.031583,
-3.383114, -3.153947, 5.665851,
-3.383114, 2.789257, 5.665851,
-3.383114, -3.153947, -6.031583,
-3.383114, -3.153947, 5.665851,
-3.383114, 2.789257, -6.031583,
-3.383114, 2.789257, 5.665851,
-3.383114, -3.153947, -6.031583,
3.409221, -3.153947, -6.031583,
-3.383114, -3.153947, 5.665851,
3.409221, -3.153947, 5.665851,
-3.383114, 2.789257, -6.031583,
3.409221, 2.789257, -6.031583,
-3.383114, 2.789257, 5.665851,
3.409221, 2.789257, 5.665851,
3.409221, -3.153947, -6.031583,
3.409221, 2.789257, -6.031583,
3.409221, -3.153947, 5.665851,
3.409221, 2.789257, 5.665851,
3.409221, -3.153947, -6.031583,
3.409221, -3.153947, 5.665851,
3.409221, 2.789257, -6.031583,
3.409221, 2.789257, 5.665851
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
var radius = 7.889325;
var distance = 35.1005;
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
mvMatrix.translate( -0.01305342, 0.182345, 0.1828661 );
mvMatrix.scale( 1.255841, 1.435269, 0.7292277 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1005);
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
Acetamiprid<-read.table("Acetamiprid.xyz")
```

```
## Error in read.table("Acetamiprid.xyz"): no lines available in input
```

```r
x<-Acetamiprid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Acetamiprid' not found
```

```r
y<-Acetamiprid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Acetamiprid' not found
```

```r
z<-Acetamiprid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Acetamiprid' not found
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
-3.284197, 0.7247393, -2.215085, 0, 0, 1, 1, 1,
-2.960225, -1.28642, -2.248434, 1, 0, 0, 1, 1,
-2.720527, -0.6918519, -1.94783, 1, 0, 0, 1, 1,
-2.627455, 0.7545413, -1.08807, 1, 0, 0, 1, 1,
-2.523464, -0.423474, -2.598863, 1, 0, 0, 1, 1,
-2.408957, 0.1244601, -2.44242, 1, 0, 0, 1, 1,
-2.399325, 1.13185, -0.2993977, 0, 0, 0, 1, 1,
-2.382963, -0.00822993, -1.635962, 0, 0, 0, 1, 1,
-2.371011, 0.1496324, -2.01825, 0, 0, 0, 1, 1,
-2.367543, 0.5607888, -0.9635438, 0, 0, 0, 1, 1,
-2.333906, -1.971141, -1.63414, 0, 0, 0, 1, 1,
-2.318022, -1.124437, -2.492432, 0, 0, 0, 1, 1,
-2.317187, 0.09635814, -0.5772264, 0, 0, 0, 1, 1,
-2.304552, 0.05537449, -1.873989, 1, 1, 1, 1, 1,
-2.274244, -0.3962352, -0.9291197, 1, 1, 1, 1, 1,
-2.251719, 0.393968, -2.270137, 1, 1, 1, 1, 1,
-2.238922, 0.5482855, -2.064391, 1, 1, 1, 1, 1,
-2.220691, -0.4955535, 0.2918439, 1, 1, 1, 1, 1,
-2.163801, 0.1714482, -2.545376, 1, 1, 1, 1, 1,
-2.15579, -1.49478, -0.9565964, 1, 1, 1, 1, 1,
-2.142961, 0.6352939, -2.156495, 1, 1, 1, 1, 1,
-2.105636, 0.3803138, -0.4951838, 1, 1, 1, 1, 1,
-2.104073, -0.6128919, -0.1932284, 1, 1, 1, 1, 1,
-2.079741, -0.4022438, -1.67079, 1, 1, 1, 1, 1,
-2.077703, -0.01664092, -1.355169, 1, 1, 1, 1, 1,
-2.036322, -0.9224421, -3.471253, 1, 1, 1, 1, 1,
-2.008574, -0.03001045, -2.675856, 1, 1, 1, 1, 1,
-1.954969, 0.7599134, -1.768712, 1, 1, 1, 1, 1,
-1.951754, 0.4729194, -2.074523, 0, 0, 1, 1, 1,
-1.915838, 2.665482, -0.2905897, 1, 0, 0, 1, 1,
-1.906921, -2.203788, -2.277854, 1, 0, 0, 1, 1,
-1.906238, 0.02163189, -1.826155, 1, 0, 0, 1, 1,
-1.883681, 0.2286312, -2.3768, 1, 0, 0, 1, 1,
-1.881329, 0.4313389, -3.650483, 1, 0, 0, 1, 1,
-1.876202, 2.260074, -0.4049778, 0, 0, 0, 1, 1,
-1.869986, -0.9523159, -1.960122, 0, 0, 0, 1, 1,
-1.802081, 0.8517574, 0.2230048, 0, 0, 0, 1, 1,
-1.785822, 0.4734182, -2.566397, 0, 0, 0, 1, 1,
-1.762969, -0.8548604, -2.946398, 0, 0, 0, 1, 1,
-1.758106, -0.7590303, -1.178935, 0, 0, 0, 1, 1,
-1.755216, -0.5714891, -0.7076061, 0, 0, 0, 1, 1,
-1.748101, -0.1287192, -0.7498294, 1, 1, 1, 1, 1,
-1.743946, -0.404766, -2.021802, 1, 1, 1, 1, 1,
-1.706851, 0.4530834, 0.4211564, 1, 1, 1, 1, 1,
-1.700927, -0.3948491, -2.96293, 1, 1, 1, 1, 1,
-1.697423, -1.302676, -1.340802, 1, 1, 1, 1, 1,
-1.69423, -1.285024, -2.191403, 1, 1, 1, 1, 1,
-1.69104, -1.351469, -2.237083, 1, 1, 1, 1, 1,
-1.678844, 0.3175146, -1.582005, 1, 1, 1, 1, 1,
-1.665287, -0.4563958, -0.6656042, 1, 1, 1, 1, 1,
-1.656943, -0.1477235, -1.936411, 1, 1, 1, 1, 1,
-1.635807, 0.8897268, -0.5803527, 1, 1, 1, 1, 1,
-1.62116, -1.058314, -2.937502, 1, 1, 1, 1, 1,
-1.612629, 1.36764, -1.703615, 1, 1, 1, 1, 1,
-1.605712, -0.002519771, -1.498285, 1, 1, 1, 1, 1,
-1.59901, -0.01017161, -1.044545, 1, 1, 1, 1, 1,
-1.587927, -1.27519, -2.712588, 0, 0, 1, 1, 1,
-1.576895, -0.1426956, -2.283931, 1, 0, 0, 1, 1,
-1.562755, 1.082167, 1.533811, 1, 0, 0, 1, 1,
-1.560694, 0.08877069, -1.427456, 1, 0, 0, 1, 1,
-1.551573, -0.8759475, -4.134072, 1, 0, 0, 1, 1,
-1.550385, 0.7958916, -0.4321991, 1, 0, 0, 1, 1,
-1.547551, 0.8696874, -2.187756, 0, 0, 0, 1, 1,
-1.544561, 0.2964567, -2.047726, 0, 0, 0, 1, 1,
-1.50768, -0.8482628, -2.826541, 0, 0, 0, 1, 1,
-1.501591, -0.1602211, -1.399068, 0, 0, 0, 1, 1,
-1.490317, -1.377009, -1.549844, 0, 0, 0, 1, 1,
-1.488314, -0.7887644, -1.75221, 0, 0, 0, 1, 1,
-1.482084, -0.2933078, -2.002909, 0, 0, 0, 1, 1,
-1.472971, 1.685161, -1.449998, 1, 1, 1, 1, 1,
-1.465604, 0.6189621, -2.173388, 1, 1, 1, 1, 1,
-1.434004, 0.1667785, -0.9110138, 1, 1, 1, 1, 1,
-1.433616, 0.9863939, -2.067594, 1, 1, 1, 1, 1,
-1.430014, -2.537955, -3.722741, 1, 1, 1, 1, 1,
-1.423343, 1.02573, -1.13543, 1, 1, 1, 1, 1,
-1.422378, -0.1555246, -1.876047, 1, 1, 1, 1, 1,
-1.421935, 1.124372, -1.293749, 1, 1, 1, 1, 1,
-1.413912, 0.8448972, -0.06282138, 1, 1, 1, 1, 1,
-1.409574, -1.148867, -1.54641, 1, 1, 1, 1, 1,
-1.408801, -0.8754084, -0.9001853, 1, 1, 1, 1, 1,
-1.404261, -0.7034642, -2.417104, 1, 1, 1, 1, 1,
-1.393629, 0.5682769, 0.7647261, 1, 1, 1, 1, 1,
-1.38308, 0.5273659, -1.321222, 1, 1, 1, 1, 1,
-1.380329, -0.2706398, 0.796562, 1, 1, 1, 1, 1,
-1.376309, 0.09558227, -2.776548, 0, 0, 1, 1, 1,
-1.370678, -3.067395, -4.972381, 1, 0, 0, 1, 1,
-1.334596, 0.7692684, -0.5049784, 1, 0, 0, 1, 1,
-1.332269, -0.5406, -2.017904, 1, 0, 0, 1, 1,
-1.33211, -2.433459, -1.019021, 1, 0, 0, 1, 1,
-1.327696, 0.7712476, -0.7312984, 1, 0, 0, 1, 1,
-1.323338, -0.6956072, -1.096502, 0, 0, 0, 1, 1,
-1.32053, -0.01378924, -2.500188, 0, 0, 0, 1, 1,
-1.320374, 0.02402762, -1.76923, 0, 0, 0, 1, 1,
-1.313337, -0.1428461, -1.074666, 0, 0, 0, 1, 1,
-1.307763, 1.990111, 0.5937995, 0, 0, 0, 1, 1,
-1.303255, -0.2561298, -2.450567, 0, 0, 0, 1, 1,
-1.300416, 0.7633961, -0.8950751, 0, 0, 0, 1, 1,
-1.290014, -0.3057395, -2.265563, 1, 1, 1, 1, 1,
-1.285631, -0.7642067, -1.49962, 1, 1, 1, 1, 1,
-1.284741, -0.1598438, -1.766189, 1, 1, 1, 1, 1,
-1.278844, -0.8748026, -1.06313, 1, 1, 1, 1, 1,
-1.250769, -1.725044, -0.8480935, 1, 1, 1, 1, 1,
-1.225823, 0.4868149, -2.522016, 1, 1, 1, 1, 1,
-1.220632, -1.841579, -2.993997, 1, 1, 1, 1, 1,
-1.21372, 1.346688, -1.369398, 1, 1, 1, 1, 1,
-1.203767, 0.4399841, -0.9793254, 1, 1, 1, 1, 1,
-1.198567, 0.8076774, 0.06867221, 1, 1, 1, 1, 1,
-1.197096, 0.629945, -0.5352209, 1, 1, 1, 1, 1,
-1.197072, -0.09407409, -0.1005769, 1, 1, 1, 1, 1,
-1.192268, -1.011971, -2.220952, 1, 1, 1, 1, 1,
-1.191301, 1.801618, -0.9782513, 1, 1, 1, 1, 1,
-1.190481, -0.7936039, -3.454449, 1, 1, 1, 1, 1,
-1.179476, -0.431572, -3.537969, 0, 0, 1, 1, 1,
-1.176927, -0.8343707, -1.937031, 1, 0, 0, 1, 1,
-1.174896, 2.064081, 0.9535028, 1, 0, 0, 1, 1,
-1.170876, 0.7932557, -1.436613, 1, 0, 0, 1, 1,
-1.166025, -0.6757353, -2.561905, 1, 0, 0, 1, 1,
-1.163375, -0.9565737, -1.352725, 1, 0, 0, 1, 1,
-1.160727, -0.2627505, -5.221107, 0, 0, 0, 1, 1,
-1.153025, 1.219862, -1.342012, 0, 0, 0, 1, 1,
-1.137529, 1.190506, 1.05268, 0, 0, 0, 1, 1,
-1.133216, 0.5677858, -0.3494594, 0, 0, 0, 1, 1,
-1.131765, 0.8336814, 0.9623467, 0, 0, 0, 1, 1,
-1.12576, 0.7192584, -2.238239, 0, 0, 0, 1, 1,
-1.11578, -0.832602, -1.481253, 0, 0, 0, 1, 1,
-1.107372, -0.08848012, -1.547321, 1, 1, 1, 1, 1,
-1.092529, 1.003959, -3.100834, 1, 1, 1, 1, 1,
-1.087181, 0.691018, -1.358976, 1, 1, 1, 1, 1,
-1.082885, 1.317035, -0.879658, 1, 1, 1, 1, 1,
-1.080294, 0.5290126, -3.052611, 1, 1, 1, 1, 1,
-1.07777, 0.5022135, -0.5427694, 1, 1, 1, 1, 1,
-1.075702, 1.557697, -0.9409451, 1, 1, 1, 1, 1,
-1.06906, 0.6906839, -2.601766, 1, 1, 1, 1, 1,
-1.068648, 1.263305, -0.1625174, 1, 1, 1, 1, 1,
-1.060367, -1.621441, -2.876117, 1, 1, 1, 1, 1,
-1.05654, -0.4714578, -0.957277, 1, 1, 1, 1, 1,
-1.054967, 2.229757, 1.033276, 1, 1, 1, 1, 1,
-1.054364, 1.469822, -0.5553551, 1, 1, 1, 1, 1,
-1.053144, -0.2787319, -1.617922, 1, 1, 1, 1, 1,
-1.048031, 0.5041444, -0.9810496, 1, 1, 1, 1, 1,
-1.047665, -0.2508001, -0.6809086, 0, 0, 1, 1, 1,
-1.043847, 2.263043, -0.05893287, 1, 0, 0, 1, 1,
-1.031164, -1.336478, -1.395139, 1, 0, 0, 1, 1,
-1.023684, 0.06345901, -1.783074, 1, 0, 0, 1, 1,
-1.022019, 0.8092273, -0.7413052, 1, 0, 0, 1, 1,
-1.021495, -0.3986423, -1.22449, 1, 0, 0, 1, 1,
-1.01915, -2.413069, -3.22202, 0, 0, 0, 1, 1,
-1.017579, 0.9129073, -1.01405, 0, 0, 0, 1, 1,
-1.016815, 0.6157719, -0.8709756, 0, 0, 0, 1, 1,
-1.014307, -0.7663413, -2.852168, 0, 0, 0, 1, 1,
-1.012248, -2.12455, -3.733751, 0, 0, 0, 1, 1,
-1.010033, 0.4899129, -0.6420492, 0, 0, 0, 1, 1,
-1.007617, 1.475867, 0.2466348, 0, 0, 0, 1, 1,
-0.9980374, -0.6096165, -2.825607, 1, 1, 1, 1, 1,
-0.9787883, -1.818035, -1.175922, 1, 1, 1, 1, 1,
-0.9753761, -1.009901, -1.529782, 1, 1, 1, 1, 1,
-0.963135, -0.1182301, -2.205388, 1, 1, 1, 1, 1,
-0.96204, 1.694474, 0.7467055, 1, 1, 1, 1, 1,
-0.9597672, -0.826113, -2.347592, 1, 1, 1, 1, 1,
-0.9590791, -1.308544, -1.907869, 1, 1, 1, 1, 1,
-0.9489918, 0.665503, -0.1964094, 1, 1, 1, 1, 1,
-0.9444038, -1.5931, -2.247672, 1, 1, 1, 1, 1,
-0.9329969, -1.342817, -2.936194, 1, 1, 1, 1, 1,
-0.9326169, -1.57962, -3.307497, 1, 1, 1, 1, 1,
-0.9281638, 1.088471, -0.6790583, 1, 1, 1, 1, 1,
-0.919307, 0.396999, -1.297719, 1, 1, 1, 1, 1,
-0.9145202, -0.4370918, -1.570951, 1, 1, 1, 1, 1,
-0.911465, 1.889431, -1.079853, 1, 1, 1, 1, 1,
-0.910528, 0.119403, -1.942491, 0, 0, 1, 1, 1,
-0.9080858, 0.7241758, -0.1502438, 1, 0, 0, 1, 1,
-0.9065722, -0.6069278, -1.424563, 1, 0, 0, 1, 1,
-0.9059762, 1.771852, 1.324024, 1, 0, 0, 1, 1,
-0.9025605, -0.4601819, -1.518426, 1, 0, 0, 1, 1,
-0.8924007, -1.101318, -1.369725, 1, 0, 0, 1, 1,
-0.8900478, 1.037548, -0.3294423, 0, 0, 0, 1, 1,
-0.8895175, 0.884872, -1.78953, 0, 0, 0, 1, 1,
-0.888373, -0.8651936, -1.61186, 0, 0, 0, 1, 1,
-0.8883266, 0.2863686, -2.727608, 0, 0, 0, 1, 1,
-0.883341, 0.7380349, -0.6463929, 0, 0, 0, 1, 1,
-0.8773443, 1.231197, -2.39184, 0, 0, 0, 1, 1,
-0.8750951, -0.793763, -3.057297, 0, 0, 0, 1, 1,
-0.8742997, -0.7339392, -2.821063, 1, 1, 1, 1, 1,
-0.872073, -0.02389806, -1.938148, 1, 1, 1, 1, 1,
-0.871465, 0.7371222, -1.269374, 1, 1, 1, 1, 1,
-0.8714132, 0.2805778, -0.1593829, 1, 1, 1, 1, 1,
-0.8666416, 0.7837628, -0.6928268, 1, 1, 1, 1, 1,
-0.8541358, -0.3535419, -2.01838, 1, 1, 1, 1, 1,
-0.8536467, 2.280725, -1.37365, 1, 1, 1, 1, 1,
-0.8531539, -0.2782955, -2.375018, 1, 1, 1, 1, 1,
-0.8525996, -0.1071221, -1.824307, 1, 1, 1, 1, 1,
-0.851777, 1.128652, -1.074629, 1, 1, 1, 1, 1,
-0.8491704, -2.088287, -4.333407, 1, 1, 1, 1, 1,
-0.8491564, 1.795083, -0.6985577, 1, 1, 1, 1, 1,
-0.8490573, 0.2167342, 0.3546281, 1, 1, 1, 1, 1,
-0.8479244, -1.227143, -2.300776, 1, 1, 1, 1, 1,
-0.8432546, 0.828886, -1.625643, 1, 1, 1, 1, 1,
-0.843166, 0.2826447, 0.2471932, 0, 0, 1, 1, 1,
-0.8430066, 0.1346839, -0.8990718, 1, 0, 0, 1, 1,
-0.842968, -1.728075, -2.916594, 1, 0, 0, 1, 1,
-0.8424321, 1.168105, 0.1889236, 1, 0, 0, 1, 1,
-0.8402267, 0.4463775, -2.595615, 1, 0, 0, 1, 1,
-0.8364616, -1.503644, -2.154269, 1, 0, 0, 1, 1,
-0.8346325, -1.036339, -2.904858, 0, 0, 0, 1, 1,
-0.8333251, 1.489037, -2.548067, 0, 0, 0, 1, 1,
-0.8312967, 0.2770264, -0.4008218, 0, 0, 0, 1, 1,
-0.8296347, 1.412289, -0.2455307, 0, 0, 0, 1, 1,
-0.8282623, -1.218068, -1.979287, 0, 0, 0, 1, 1,
-0.8250238, 0.1035201, -2.987143, 0, 0, 0, 1, 1,
-0.8246833, 0.6608801, -0.09842467, 0, 0, 0, 1, 1,
-0.8241734, 0.7297744, 0.2207022, 1, 1, 1, 1, 1,
-0.8210123, 0.3322961, -0.8935918, 1, 1, 1, 1, 1,
-0.8188067, 0.5243155, -1.739988, 1, 1, 1, 1, 1,
-0.8153729, -0.4818432, -0.5278436, 1, 1, 1, 1, 1,
-0.8106102, -0.4418725, -1.873678, 1, 1, 1, 1, 1,
-0.8095787, 0.1321942, -2.821654, 1, 1, 1, 1, 1,
-0.8034024, -0.4004588, -0.8273947, 1, 1, 1, 1, 1,
-0.8026922, -0.7855884, -2.75999, 1, 1, 1, 1, 1,
-0.8013105, 0.6419737, -0.7210391, 1, 1, 1, 1, 1,
-0.7998284, -0.6551005, -1.126613, 1, 1, 1, 1, 1,
-0.7909164, -2.131749, -2.269339, 1, 1, 1, 1, 1,
-0.7882608, 1.369702, -1.122481, 1, 1, 1, 1, 1,
-0.7876213, 0.8845651, -0.7195301, 1, 1, 1, 1, 1,
-0.7851374, -0.5406718, -1.595816, 1, 1, 1, 1, 1,
-0.7846335, -2.478555, -2.127397, 1, 1, 1, 1, 1,
-0.7801412, -1.423653, -3.69336, 0, 0, 1, 1, 1,
-0.778155, -0.3423195, -1.456959, 1, 0, 0, 1, 1,
-0.7766125, -0.7542332, -2.863108, 1, 0, 0, 1, 1,
-0.7636391, 0.6620634, -0.1727274, 1, 0, 0, 1, 1,
-0.7621733, -0.5265927, -2.878652, 1, 0, 0, 1, 1,
-0.7607887, -0.7364122, -3.470554, 1, 0, 0, 1, 1,
-0.7587097, 0.8901374, -0.5725342, 0, 0, 0, 1, 1,
-0.7552778, 0.8415053, -0.169856, 0, 0, 0, 1, 1,
-0.7544574, -0.2137915, -0.9165588, 0, 0, 0, 1, 1,
-0.7509094, -1.158987, -4.667086, 0, 0, 0, 1, 1,
-0.7503591, -0.5757264, -0.7936699, 0, 0, 0, 1, 1,
-0.7471736, 0.8029713, -0.3863357, 0, 0, 0, 1, 1,
-0.7433055, 0.5866902, -0.5846479, 0, 0, 0, 1, 1,
-0.7417122, -0.02883136, -1.106553, 1, 1, 1, 1, 1,
-0.7337112, -0.9731265, -2.50508, 1, 1, 1, 1, 1,
-0.7227037, -0.9865061, -3.067548, 1, 1, 1, 1, 1,
-0.7216444, -0.1624722, -2.525, 1, 1, 1, 1, 1,
-0.7171121, 1.295477, -1.154414, 1, 1, 1, 1, 1,
-0.7151725, -1.210775, -3.225424, 1, 1, 1, 1, 1,
-0.7126619, 1.090725, 1.218805, 1, 1, 1, 1, 1,
-0.71154, -0.3927411, -0.9488155, 1, 1, 1, 1, 1,
-0.7085915, -0.4050237, -1.689131, 1, 1, 1, 1, 1,
-0.7044528, -1.420375, -2.227461, 1, 1, 1, 1, 1,
-0.7039883, 0.2649347, -0.2541003, 1, 1, 1, 1, 1,
-0.7038833, -1.083293, -1.920938, 1, 1, 1, 1, 1,
-0.7030285, -0.5353205, -3.213969, 1, 1, 1, 1, 1,
-0.7027918, 0.221271, 0.5294459, 1, 1, 1, 1, 1,
-0.6966342, -1.346629, -2.458375, 1, 1, 1, 1, 1,
-0.694474, 1.345326, -0.9419976, 0, 0, 1, 1, 1,
-0.6907402, -0.4956427, -1.034329, 1, 0, 0, 1, 1,
-0.6838749, 0.6852698, -0.5366194, 1, 0, 0, 1, 1,
-0.681588, 0.07551134, -1.846327, 1, 0, 0, 1, 1,
-0.6814972, -0.3276415, -3.880595, 1, 0, 0, 1, 1,
-0.6687374, -0.5799129, -1.570135, 1, 0, 0, 1, 1,
-0.6641849, 0.09074434, -2.531039, 0, 0, 0, 1, 1,
-0.6607527, 0.6144854, -1.111305, 0, 0, 0, 1, 1,
-0.6591933, 1.087596, -0.07869478, 0, 0, 0, 1, 1,
-0.657419, 0.6130113, -1.307835, 0, 0, 0, 1, 1,
-0.6542068, 0.4989322, -0.8856328, 0, 0, 0, 1, 1,
-0.6479147, -1.031235, -2.298381, 0, 0, 0, 1, 1,
-0.6471506, -0.319428, -2.239871, 0, 0, 0, 1, 1,
-0.6449203, 1.413714, 0.3874488, 1, 1, 1, 1, 1,
-0.6374784, 0.351802, -2.035359, 1, 1, 1, 1, 1,
-0.6285306, -1.304402, -0.8984902, 1, 1, 1, 1, 1,
-0.6247687, -1.113312, -1.864475, 1, 1, 1, 1, 1,
-0.6231323, -1.637839, -3.511579, 1, 1, 1, 1, 1,
-0.6199498, 1.280709, -1.445382, 1, 1, 1, 1, 1,
-0.6132857, 0.2178293, -2.725973, 1, 1, 1, 1, 1,
-0.607531, -1.335359, -2.984169, 1, 1, 1, 1, 1,
-0.6066643, -1.438094, -1.895773, 1, 1, 1, 1, 1,
-0.6020834, 0.002367676, -1.512914, 1, 1, 1, 1, 1,
-0.601028, 1.130853, -0.1035976, 1, 1, 1, 1, 1,
-0.593925, -0.3499286, -1.717901, 1, 1, 1, 1, 1,
-0.5904413, 0.8565575, -1.191076, 1, 1, 1, 1, 1,
-0.5878163, 0.1360246, -1.744759, 1, 1, 1, 1, 1,
-0.5832933, 1.386053, 0.5291244, 1, 1, 1, 1, 1,
-0.5827287, 0.2987959, -1.673253, 0, 0, 1, 1, 1,
-0.580988, -0.8691887, -3.452162, 1, 0, 0, 1, 1,
-0.5765337, 1.233134, 1.977786, 1, 0, 0, 1, 1,
-0.5762948, -0.6294119, -1.998474, 1, 0, 0, 1, 1,
-0.5619338, 0.05324867, -0.323318, 1, 0, 0, 1, 1,
-0.5581646, -1.651145, -2.041445, 1, 0, 0, 1, 1,
-0.558002, -0.2046183, -3.501303, 0, 0, 0, 1, 1,
-0.5548244, -0.1893004, -3.335822, 0, 0, 0, 1, 1,
-0.5489588, -0.5490541, -3.15924, 0, 0, 0, 1, 1,
-0.5465704, 1.0384, -1.027823, 0, 0, 0, 1, 1,
-0.5444558, 0.5954619, -2.117079, 0, 0, 0, 1, 1,
-0.5367451, 0.09280187, -2.234404, 0, 0, 0, 1, 1,
-0.5321869, 0.4816953, -2.326114, 0, 0, 0, 1, 1,
-0.5278759, -1.117546, -1.597589, 1, 1, 1, 1, 1,
-0.5236773, 0.03622657, -2.239488, 1, 1, 1, 1, 1,
-0.5164934, -0.2701925, -1.983742, 1, 1, 1, 1, 1,
-0.5075769, 0.8495116, -1.03486, 1, 1, 1, 1, 1,
-0.5009426, 0.1399384, -1.936948, 1, 1, 1, 1, 1,
-0.4999078, 0.1887029, 0.4710193, 1, 1, 1, 1, 1,
-0.4943163, 1.83664, -1.110553, 1, 1, 1, 1, 1,
-0.4935361, -0.3021416, -3.543816, 1, 1, 1, 1, 1,
-0.492902, 1.185248, -0.3601953, 1, 1, 1, 1, 1,
-0.4910606, -1.766747, -4.493133, 1, 1, 1, 1, 1,
-0.4860401, -1.195129, -4.118023, 1, 1, 1, 1, 1,
-0.4855916, 0.1147441, -0.5138372, 1, 1, 1, 1, 1,
-0.4835799, 0.1757616, -3.794824, 1, 1, 1, 1, 1,
-0.4816843, -0.1969065, -3.941452, 1, 1, 1, 1, 1,
-0.4758759, 0.6024143, -0.748791, 1, 1, 1, 1, 1,
-0.4753469, 0.2846287, 0.3752218, 0, 0, 1, 1, 1,
-0.4732838, -0.7041189, -2.369047, 1, 0, 0, 1, 1,
-0.4703892, -0.6231853, -3.119686, 1, 0, 0, 1, 1,
-0.4663637, 0.4455537, -3.006804, 1, 0, 0, 1, 1,
-0.4660691, -1.319422, -2.54371, 1, 0, 0, 1, 1,
-0.4648949, 1.562217, -0.08282449, 1, 0, 0, 1, 1,
-0.4632553, 0.6323192, 2.010551, 0, 0, 0, 1, 1,
-0.4591169, -0.6953239, -2.780285, 0, 0, 0, 1, 1,
-0.4575472, -0.9053854, -2.816579, 0, 0, 0, 1, 1,
-0.452756, -2.447636, -4.188782, 0, 0, 0, 1, 1,
-0.4522686, 0.2162953, -1.221804, 0, 0, 0, 1, 1,
-0.4506938, -0.2374044, -3.942663, 0, 0, 0, 1, 1,
-0.4489681, 0.9028485, -0.5547367, 0, 0, 0, 1, 1,
-0.4470278, 0.5831384, 0.2122366, 1, 1, 1, 1, 1,
-0.4461239, -0.6914222, -1.47131, 1, 1, 1, 1, 1,
-0.4407046, 0.521553, -0.9793113, 1, 1, 1, 1, 1,
-0.4370471, -0.2828429, -2.512809, 1, 1, 1, 1, 1,
-0.4363467, -0.7266551, -3.522062, 1, 1, 1, 1, 1,
-0.4329624, 0.7901683, -0.1970843, 1, 1, 1, 1, 1,
-0.4300392, 1.758842, 0.5368586, 1, 1, 1, 1, 1,
-0.4292349, 1.546338, -0.8096312, 1, 1, 1, 1, 1,
-0.4271203, -0.04253509, -1.813525, 1, 1, 1, 1, 1,
-0.4270098, 1.150945, -0.5560964, 1, 1, 1, 1, 1,
-0.4254078, 0.8979148, -0.03474331, 1, 1, 1, 1, 1,
-0.4238436, 1.484809, -0.9704176, 1, 1, 1, 1, 1,
-0.421758, -1.119342, -2.164704, 1, 1, 1, 1, 1,
-0.4194874, 1.034208, -0.1737766, 1, 1, 1, 1, 1,
-0.4188038, 6.458724e-05, -2.54758, 1, 1, 1, 1, 1,
-0.4156561, -0.8695907, -0.725917, 0, 0, 1, 1, 1,
-0.3969555, -1.222528, -1.427681, 1, 0, 0, 1, 1,
-0.3964182, 0.9416312, 0.5239093, 1, 0, 0, 1, 1,
-0.3898797, 0.445161, -1.310934, 1, 0, 0, 1, 1,
-0.3831925, 0.5844074, -1.239037, 1, 0, 0, 1, 1,
-0.3819923, 0.1098612, -1.168689, 1, 0, 0, 1, 1,
-0.3811932, -1.29496, -4.013119, 0, 0, 0, 1, 1,
-0.3809336, 0.2595234, -0.3932624, 0, 0, 0, 1, 1,
-0.3799886, -2.047027, -2.366291, 0, 0, 0, 1, 1,
-0.3762708, 0.2875423, -1.000047, 0, 0, 0, 1, 1,
-0.3753784, -0.3106501, -3.088343, 0, 0, 0, 1, 1,
-0.3734601, 1.272035, -2.4615, 0, 0, 0, 1, 1,
-0.3673539, -0.8411475, -1.797276, 0, 0, 0, 1, 1,
-0.3672267, 1.297527, -0.4247858, 1, 1, 1, 1, 1,
-0.3634165, 0.5923798, -2.067224, 1, 1, 1, 1, 1,
-0.3588968, 0.1646548, -2.302899, 1, 1, 1, 1, 1,
-0.3526407, -0.7040915, -3.873639, 1, 1, 1, 1, 1,
-0.3510675, 0.04414788, 0.009992432, 1, 1, 1, 1, 1,
-0.3481716, -1.572571, -4.915375, 1, 1, 1, 1, 1,
-0.3468924, -1.096794, -3.474441, 1, 1, 1, 1, 1,
-0.3448806, 0.2594236, -0.3051143, 1, 1, 1, 1, 1,
-0.3391359, 0.6795932, -0.2866434, 1, 1, 1, 1, 1,
-0.3387978, 0.0447224, -2.553051, 1, 1, 1, 1, 1,
-0.3316763, 0.3614346, -0.7346616, 1, 1, 1, 1, 1,
-0.3243838, 1.025069, -0.2734898, 1, 1, 1, 1, 1,
-0.3239081, -0.2632183, -2.821051, 1, 1, 1, 1, 1,
-0.3214835, 1.291059, -1.249829, 1, 1, 1, 1, 1,
-0.3202341, 0.3023804, -1.95072, 1, 1, 1, 1, 1,
-0.3166108, -1.084416, -2.500193, 0, 0, 1, 1, 1,
-0.3142822, -0.3860469, -2.657653, 1, 0, 0, 1, 1,
-0.3104929, -0.3082919, -2.923299, 1, 0, 0, 1, 1,
-0.3088078, 0.1316251, -0.5248575, 1, 0, 0, 1, 1,
-0.3053644, 0.8899046, -0.8417432, 1, 0, 0, 1, 1,
-0.3030311, -0.7372756, -4.341487, 1, 0, 0, 1, 1,
-0.3005177, 0.3923675, -3.424317, 0, 0, 0, 1, 1,
-0.3004258, -0.7847347, -3.067673, 0, 0, 0, 1, 1,
-0.2997831, 0.4411578, -1.087582, 0, 0, 0, 1, 1,
-0.2963051, 0.5473733, 1.240966, 0, 0, 0, 1, 1,
-0.2915969, -0.6446152, -3.53422, 0, 0, 0, 1, 1,
-0.2908108, 0.8449777, 0.7380985, 0, 0, 0, 1, 1,
-0.2882089, -0.4489623, -2.883857, 0, 0, 0, 1, 1,
-0.2874897, -1.286895, -5.861232, 1, 1, 1, 1, 1,
-0.2872867, 0.4791699, 0.5344221, 1, 1, 1, 1, 1,
-0.2855643, -0.9442835, -3.992374, 1, 1, 1, 1, 1,
-0.2805612, 0.2237785, 0.1004259, 1, 1, 1, 1, 1,
-0.2782246, -1.438287, -3.057753, 1, 1, 1, 1, 1,
-0.277948, 0.3019999, -1.175402, 1, 1, 1, 1, 1,
-0.2764107, -0.2480762, -2.542304, 1, 1, 1, 1, 1,
-0.2745417, -1.652717, -4.255561, 1, 1, 1, 1, 1,
-0.2724852, -0.9363712, -2.999938, 1, 1, 1, 1, 1,
-0.2707531, 0.7044013, -0.4840174, 1, 1, 1, 1, 1,
-0.2690471, -1.024853, -2.492311, 1, 1, 1, 1, 1,
-0.2666684, -0.9839482, -3.971774, 1, 1, 1, 1, 1,
-0.2616756, -0.5872702, -2.984909, 1, 1, 1, 1, 1,
-0.2584366, -0.7678814, -3.7391, 1, 1, 1, 1, 1,
-0.2582057, -0.3738523, -3.132331, 1, 1, 1, 1, 1,
-0.2574405, 0.505789, -2.659934, 0, 0, 1, 1, 1,
-0.2572183, -1.486472, -2.957611, 1, 0, 0, 1, 1,
-0.2568226, 0.5007434, 1.037658, 1, 0, 0, 1, 1,
-0.2562069, 0.7563684, 1.227318, 1, 0, 0, 1, 1,
-0.2555618, 0.4548341, -0.1593725, 1, 0, 0, 1, 1,
-0.2506506, 1.104734, 1.114447, 1, 0, 0, 1, 1,
-0.2491822, 0.1044303, -2.782467, 0, 0, 0, 1, 1,
-0.2441416, -0.536582, -3.688043, 0, 0, 0, 1, 1,
-0.2419655, 1.760837, -0.6811983, 0, 0, 0, 1, 1,
-0.2417391, 0.1664127, -0.1764243, 0, 0, 0, 1, 1,
-0.2343238, 2.399561, 0.202279, 0, 0, 0, 1, 1,
-0.2325787, 0.138997, -1.710733, 0, 0, 0, 1, 1,
-0.2313472, -0.6130663, -3.837581, 0, 0, 0, 1, 1,
-0.2309226, -0.5774259, -3.32231, 1, 1, 1, 1, 1,
-0.2252075, -1.693674, -3.977292, 1, 1, 1, 1, 1,
-0.2228816, 0.2532264, -0.3470805, 1, 1, 1, 1, 1,
-0.2222211, 1.524017, 1.220912, 1, 1, 1, 1, 1,
-0.2190536, -0.7065397, -2.356464, 1, 1, 1, 1, 1,
-0.2183932, 0.9251682, -1.374034, 1, 1, 1, 1, 1,
-0.2151263, -0.03091743, -2.261832, 1, 1, 1, 1, 1,
-0.2145693, 0.3850201, -2.074306, 1, 1, 1, 1, 1,
-0.2145011, -0.7305264, -2.481282, 1, 1, 1, 1, 1,
-0.2138987, 0.1765491, -0.1026601, 1, 1, 1, 1, 1,
-0.2125139, -1.29361, -2.309083, 1, 1, 1, 1, 1,
-0.2086313, 1.530154, -0.4653598, 1, 1, 1, 1, 1,
-0.2073505, -0.1264886, -2.179289, 1, 1, 1, 1, 1,
-0.2055092, -0.4842606, -2.0854, 1, 1, 1, 1, 1,
-0.2005486, 0.7900708, 0.6441293, 1, 1, 1, 1, 1,
-0.1981788, -0.8707371, -3.883064, 0, 0, 1, 1, 1,
-0.1970382, 0.785432, -1.295054, 1, 0, 0, 1, 1,
-0.1932853, -1.994722, -2.545406, 1, 0, 0, 1, 1,
-0.1871978, 0.9841023, 0.931201, 1, 0, 0, 1, 1,
-0.1865679, 0.5148876, -0.5694792, 1, 0, 0, 1, 1,
-0.1860954, 0.5227945, -1.241508, 1, 0, 0, 1, 1,
-0.1857352, 0.02295337, -2.126801, 0, 0, 0, 1, 1,
-0.1831241, -0.8686805, -4.11392, 0, 0, 0, 1, 1,
-0.1804929, -1.171466, -3.051881, 0, 0, 0, 1, 1,
-0.1739346, 1.873603, 0.9407114, 0, 0, 0, 1, 1,
-0.1695905, -1.8281, -2.888247, 0, 0, 0, 1, 1,
-0.1690158, 0.2523519, -2.858186, 0, 0, 0, 1, 1,
-0.1687614, 0.9177175, -0.5146205, 0, 0, 0, 1, 1,
-0.1675704, 0.02481842, -1.974936, 1, 1, 1, 1, 1,
-0.16575, 0.8211572, -0.8467019, 1, 1, 1, 1, 1,
-0.1609389, -0.5096971, -3.548352, 1, 1, 1, 1, 1,
-0.1605615, -0.7188559, -3.835174, 1, 1, 1, 1, 1,
-0.1594465, 1.105469, -2.66515, 1, 1, 1, 1, 1,
-0.1586229, -0.833769, -2.172931, 1, 1, 1, 1, 1,
-0.1577389, 0.1792582, -0.2820666, 1, 1, 1, 1, 1,
-0.1572181, 0.6713611, -2.151752, 1, 1, 1, 1, 1,
-0.1561625, 1.739211, 1.040094, 1, 1, 1, 1, 1,
-0.152456, 0.5768383, -0.007345659, 1, 1, 1, 1, 1,
-0.1521889, -0.6459906, -1.761991, 1, 1, 1, 1, 1,
-0.1510551, -1.904727, -4.085272, 1, 1, 1, 1, 1,
-0.1499085, 2.115344, -1.385238, 1, 1, 1, 1, 1,
-0.1442405, 1.088809, -0.4636464, 1, 1, 1, 1, 1,
-0.1431406, 1.393176, -1.193964, 1, 1, 1, 1, 1,
-0.1424813, -0.03992792, -1.513083, 0, 0, 1, 1, 1,
-0.1404772, -0.9711827, -1.942868, 1, 0, 0, 1, 1,
-0.1399823, -0.6441582, -2.580756, 1, 0, 0, 1, 1,
-0.1366176, -1.195175, -2.31999, 1, 0, 0, 1, 1,
-0.1359387, -1.388382, -1.690823, 1, 0, 0, 1, 1,
-0.1347387, -1.074527, -3.349045, 1, 0, 0, 1, 1,
-0.1319798, 1.98338, 0.3734136, 0, 0, 0, 1, 1,
-0.1311745, -1.190696, -3.008368, 0, 0, 0, 1, 1,
-0.1278097, 0.8003587, -0.3052595, 0, 0, 0, 1, 1,
-0.1266184, 1.987728, 0.1361122, 0, 0, 0, 1, 1,
-0.1223257, -0.6536823, -3.734131, 0, 0, 0, 1, 1,
-0.1178992, 1.545096, 0.2519626, 0, 0, 0, 1, 1,
-0.11622, 0.1510909, -0.4616798, 0, 0, 0, 1, 1,
-0.1073552, -0.2281507, -1.280177, 1, 1, 1, 1, 1,
-0.1061054, 0.2244414, 0.8725823, 1, 1, 1, 1, 1,
-0.1055931, -0.417114, -2.308087, 1, 1, 1, 1, 1,
-0.1041972, 0.806245, 1.329091, 1, 1, 1, 1, 1,
-0.1001697, 1.224662, -0.2198541, 1, 1, 1, 1, 1,
-0.09909084, -2.400594, -2.982766, 1, 1, 1, 1, 1,
-0.09658341, -0.2138214, -1.82155, 1, 1, 1, 1, 1,
-0.09116897, -0.4391421, -2.128059, 1, 1, 1, 1, 1,
-0.0851128, -1.716935, -3.794882, 1, 1, 1, 1, 1,
-0.08343821, 1.434821, 0.825056, 1, 1, 1, 1, 1,
-0.07655665, -0.8856119, -2.947653, 1, 1, 1, 1, 1,
-0.07325876, 1.528929, -1.05459, 1, 1, 1, 1, 1,
-0.07191254, 0.5642143, -1.463499, 1, 1, 1, 1, 1,
-0.07038485, 0.3836987, -0.6124386, 1, 1, 1, 1, 1,
-0.0691549, 0.2020343, -0.8587227, 1, 1, 1, 1, 1,
-0.06376885, -0.6110762, -3.436723, 0, 0, 1, 1, 1,
-0.06141902, -0.6862708, -4.551576, 1, 0, 0, 1, 1,
-0.06002145, 0.5992489, 1.064769, 1, 0, 0, 1, 1,
-0.05915006, 0.6460099, 0.06585194, 1, 0, 0, 1, 1,
-0.0589407, -0.7718208, -3.538465, 1, 0, 0, 1, 1,
-0.05410515, 1.019129, -1.278615, 1, 0, 0, 1, 1,
-0.05303871, -0.1100966, -2.669375, 0, 0, 0, 1, 1,
-0.05148837, 1.352311, -0.8125589, 0, 0, 0, 1, 1,
-0.0510158, 0.1989925, -2.070152, 0, 0, 0, 1, 1,
-0.04917286, -1.046214, -3.074375, 0, 0, 0, 1, 1,
-0.0475869, 1.627245, -1.245403, 0, 0, 0, 1, 1,
-0.04631996, -0.6273459, -4.189902, 0, 0, 0, 1, 1,
-0.04387629, 1.791822, -0.1367933, 0, 0, 0, 1, 1,
-0.04230506, -0.7681562, -4.074403, 1, 1, 1, 1, 1,
-0.03405482, -1.920359, -2.592487, 1, 1, 1, 1, 1,
-0.03044225, -1.223321, -1.336524, 1, 1, 1, 1, 1,
-0.02858604, -1.187728, -3.232205, 1, 1, 1, 1, 1,
-0.02746386, 1.74024, -0.09300847, 1, 1, 1, 1, 1,
-0.02676883, 0.7193, -0.5025648, 1, 1, 1, 1, 1,
-0.02299006, 1.40165, 1.792636, 1, 1, 1, 1, 1,
-0.01631406, 0.208789, 1.760687, 1, 1, 1, 1, 1,
-0.01574578, -0.5670054, -1.948761, 1, 1, 1, 1, 1,
-0.008539093, -0.5006851, -4.742025, 1, 1, 1, 1, 1,
-0.00842958, 0.6867102, -2.931891, 1, 1, 1, 1, 1,
-0.001738557, 0.7189197, -1.67927, 1, 1, 1, 1, 1,
-0.0006734235, 0.04008386, -0.903314, 1, 1, 1, 1, 1,
0.003638766, 0.3874068, -0.06046806, 1, 1, 1, 1, 1,
0.003825788, -0.1383366, 0.7531426, 1, 1, 1, 1, 1,
0.005222866, 0.321612, -1.656049, 0, 0, 1, 1, 1,
0.008559739, 0.6544679, 0.3822432, 1, 0, 0, 1, 1,
0.01731858, 0.2300899, -0.2314561, 1, 0, 0, 1, 1,
0.01741578, 0.9348853, -0.3806928, 1, 0, 0, 1, 1,
0.01818024, 0.8482143, 0.6111929, 1, 0, 0, 1, 1,
0.0198421, 1.480355, -1.188914, 1, 0, 0, 1, 1,
0.02016211, 1.309162, -2.346243, 0, 0, 0, 1, 1,
0.02164731, -1.261007, 3.356808, 0, 0, 0, 1, 1,
0.02777769, 1.283772, 1.222336, 0, 0, 0, 1, 1,
0.02939129, -0.07342294, 1.078125, 0, 0, 0, 1, 1,
0.03013619, -0.3561364, 3.930778, 0, 0, 0, 1, 1,
0.03140986, 0.7400739, 0.3898938, 0, 0, 0, 1, 1,
0.0321889, 1.083908, 1.045131, 0, 0, 0, 1, 1,
0.03255577, -0.06995642, 0.2614273, 1, 1, 1, 1, 1,
0.0379047, 0.6599777, 0.6440802, 1, 1, 1, 1, 1,
0.04143438, -0.4358043, 2.330625, 1, 1, 1, 1, 1,
0.04278457, 0.3960982, 0.8241162, 1, 1, 1, 1, 1,
0.04323413, 0.3735009, -0.5450224, 1, 1, 1, 1, 1,
0.0468245, 0.7436908, 0.9578401, 1, 1, 1, 1, 1,
0.04753144, -0.783318, 3.590168, 1, 1, 1, 1, 1,
0.04868939, -0.2946104, 2.676559, 1, 1, 1, 1, 1,
0.05455878, 1.204178, 0.6057253, 1, 1, 1, 1, 1,
0.05469796, 0.5146937, 0.1366935, 1, 1, 1, 1, 1,
0.05780917, -0.4376809, 2.488413, 1, 1, 1, 1, 1,
0.06131642, -0.4268491, 3.675409, 1, 1, 1, 1, 1,
0.06413565, 0.8555017, -0.8338789, 1, 1, 1, 1, 1,
0.06579776, 1.285527, 1.655903, 1, 1, 1, 1, 1,
0.06649137, 0.618731, -1.426278, 1, 1, 1, 1, 1,
0.07155798, 0.9267299, -1.020999, 0, 0, 1, 1, 1,
0.07251669, 1.255655, -0.1016496, 1, 0, 0, 1, 1,
0.07965128, -1.319048, 3.526695, 1, 0, 0, 1, 1,
0.08085489, 0.5082417, -1.07773, 1, 0, 0, 1, 1,
0.08141258, 2.342091, -0.8177882, 1, 0, 0, 1, 1,
0.08237484, -0.191412, 1.818605, 1, 0, 0, 1, 1,
0.08328274, 0.9677519, 0.8271412, 0, 0, 0, 1, 1,
0.08333205, -1.261378, 3.104712, 0, 0, 0, 1, 1,
0.08353811, 0.1398395, -0.435165, 0, 0, 0, 1, 1,
0.08577222, 0.1741225, -0.3476385, 0, 0, 0, 1, 1,
0.0931882, 0.2434929, 0.1352249, 0, 0, 0, 1, 1,
0.09600338, 0.5284248, -0.2948257, 0, 0, 0, 1, 1,
0.096256, 0.676857, -0.2594364, 0, 0, 0, 1, 1,
0.09962364, 0.2532133, -1.13512, 1, 1, 1, 1, 1,
0.09974178, -0.8280891, 3.478555, 1, 1, 1, 1, 1,
0.09999917, 0.7901443, -0.0865607, 1, 1, 1, 1, 1,
0.1033961, -0.07561114, 0.6398715, 1, 1, 1, 1, 1,
0.105758, 0.2451254, -0.9969222, 1, 1, 1, 1, 1,
0.1064719, 0.9073537, -0.5325133, 1, 1, 1, 1, 1,
0.1087431, -0.1506094, 1.655793, 1, 1, 1, 1, 1,
0.1090729, 0.7006051, 1.597478, 1, 1, 1, 1, 1,
0.113152, 0.09071559, 1.34043, 1, 1, 1, 1, 1,
0.1148719, -1.516407, 0.4692641, 1, 1, 1, 1, 1,
0.115149, 1.555737, 0.3850915, 1, 1, 1, 1, 1,
0.1229107, -1.286926, 2.322547, 1, 1, 1, 1, 1,
0.1245653, 1.584019, 0.384746, 1, 1, 1, 1, 1,
0.1292266, -0.2319801, 3.333097, 1, 1, 1, 1, 1,
0.1347216, 0.5042999, -1.77789, 1, 1, 1, 1, 1,
0.1348282, -0.9656237, 3.367913, 0, 0, 1, 1, 1,
0.1359146, 0.08909624, 0.2457566, 1, 0, 0, 1, 1,
0.1412826, -0.6142575, 5.4955, 1, 0, 0, 1, 1,
0.1501372, -0.6269717, 3.059234, 1, 0, 0, 1, 1,
0.1545874, -0.1432801, 3.228029, 1, 0, 0, 1, 1,
0.1562188, -0.3638889, 3.659115, 1, 0, 0, 1, 1,
0.1585186, -1.365393, 3.175462, 0, 0, 0, 1, 1,
0.1593538, -0.2663433, 1.429155, 0, 0, 0, 1, 1,
0.1600688, -0.02278937, 2.556041, 0, 0, 0, 1, 1,
0.1601589, -0.4066032, 4.143773, 0, 0, 0, 1, 1,
0.1674604, -0.8354368, 4.37403, 0, 0, 0, 1, 1,
0.1687759, 0.9887493, 1.079703, 0, 0, 0, 1, 1,
0.1697221, 0.7837283, 1.373083, 0, 0, 0, 1, 1,
0.1785912, 0.3504869, 0.2555579, 1, 1, 1, 1, 1,
0.1815639, -0.2529647, 1.910139, 1, 1, 1, 1, 1,
0.1843919, -2.312995, 2.935293, 1, 1, 1, 1, 1,
0.1854715, -1.182568, 4.703199, 1, 1, 1, 1, 1,
0.1933271, 0.1966603, -0.2560782, 1, 1, 1, 1, 1,
0.1957465, -0.6214334, 4.227364, 1, 1, 1, 1, 1,
0.2023733, 1.188105, 0.7132415, 1, 1, 1, 1, 1,
0.2028361, 0.7085642, 1.621044, 1, 1, 1, 1, 1,
0.205142, -0.4701863, 2.980011, 1, 1, 1, 1, 1,
0.2068695, 0.05888426, 2.678913, 1, 1, 1, 1, 1,
0.2135221, 0.2139964, 0.8626387, 1, 1, 1, 1, 1,
0.2168894, 1.398227, -0.6714187, 1, 1, 1, 1, 1,
0.2186847, -0.6494471, 4.048741, 1, 1, 1, 1, 1,
0.2214988, -0.680522, 1.905457, 1, 1, 1, 1, 1,
0.2264239, -0.4325324, 1.807268, 1, 1, 1, 1, 1,
0.2310695, 0.4744337, 1.087891, 0, 0, 1, 1, 1,
0.2316674, -0.5069547, 4.041884, 1, 0, 0, 1, 1,
0.2362992, 1.848887, 1.078001, 1, 0, 0, 1, 1,
0.2417545, 1.033743, -1.725496, 1, 0, 0, 1, 1,
0.2469813, 0.6283713, 1.948473, 1, 0, 0, 1, 1,
0.2484653, -0.7377158, 1.428919, 1, 0, 0, 1, 1,
0.24954, 1.597977, 0.6000619, 0, 0, 0, 1, 1,
0.251155, -0.7864051, 2.248068, 0, 0, 0, 1, 1,
0.2512056, 0.1731946, 1.591312, 0, 0, 0, 1, 1,
0.2514263, 0.2441161, 0.380146, 0, 0, 0, 1, 1,
0.2559814, -0.4942985, 4.599584, 0, 0, 0, 1, 1,
0.2595405, 0.3055397, 0.8856055, 0, 0, 0, 1, 1,
0.259951, 0.5059432, 1.013597, 0, 0, 0, 1, 1,
0.2606898, 0.139995, 2.263835, 1, 1, 1, 1, 1,
0.2612516, 0.9685267, 0.5908571, 1, 1, 1, 1, 1,
0.2636853, -1.400558, 2.29393, 1, 1, 1, 1, 1,
0.2646871, -1.433208, 2.141312, 1, 1, 1, 1, 1,
0.2652214, -0.571885, 2.179401, 1, 1, 1, 1, 1,
0.2669824, -0.1730028, 1.876238, 1, 1, 1, 1, 1,
0.2671009, 0.5108553, -0.5052478, 1, 1, 1, 1, 1,
0.2700678, -0.3017615, 1.856194, 1, 1, 1, 1, 1,
0.2719238, -0.2768804, 3.592078, 1, 1, 1, 1, 1,
0.274646, 0.6858591, 1.293894, 1, 1, 1, 1, 1,
0.2801951, -0.6889614, 2.324023, 1, 1, 1, 1, 1,
0.2847948, 0.4199503, -0.1370647, 1, 1, 1, 1, 1,
0.2858515, -0.8043466, 1.763986, 1, 1, 1, 1, 1,
0.2869786, -2.607242, 3.647747, 1, 1, 1, 1, 1,
0.2887945, 0.09191202, 3.206614, 1, 1, 1, 1, 1,
0.2893119, 0.4109653, -0.4212275, 0, 0, 1, 1, 1,
0.2896743, -0.2871416, 2.044359, 1, 0, 0, 1, 1,
0.29299, 0.9090932, -1.175296, 1, 0, 0, 1, 1,
0.2934671, -0.8228597, 3.597573, 1, 0, 0, 1, 1,
0.2935215, -0.8342127, 2.513314, 1, 0, 0, 1, 1,
0.294277, -0.631538, 3.650161, 1, 0, 0, 1, 1,
0.2958146, 1.12657, 1.361085, 0, 0, 0, 1, 1,
0.2981235, 1.990857, 0.3581997, 0, 0, 0, 1, 1,
0.3009438, 0.9975077, 1.561787, 0, 0, 0, 1, 1,
0.3030562, -1.0594, 3.679625, 0, 0, 0, 1, 1,
0.3036082, 1.180458, -0.7673408, 0, 0, 0, 1, 1,
0.3048188, 0.1525955, 1.176623, 0, 0, 0, 1, 1,
0.309659, -0.3078409, 3.067199, 0, 0, 0, 1, 1,
0.3156602, -1.659297, 4.233945, 1, 1, 1, 1, 1,
0.3156606, -0.2150541, 2.995085, 1, 1, 1, 1, 1,
0.3252031, -1.659783, 1.80951, 1, 1, 1, 1, 1,
0.3267335, 0.7277557, 1.901255, 1, 1, 1, 1, 1,
0.3314187, 0.8935928, 0.1898175, 1, 1, 1, 1, 1,
0.3327247, -1.003274, 4.297037, 1, 1, 1, 1, 1,
0.3337412, 0.8858961, 1.748061, 1, 1, 1, 1, 1,
0.3401887, 0.6206718, -0.3239562, 1, 1, 1, 1, 1,
0.3418829, -0.2592455, 2.844069, 1, 1, 1, 1, 1,
0.3422111, -0.3136552, 4.230758, 1, 1, 1, 1, 1,
0.346246, -1.763544, 4.226457, 1, 1, 1, 1, 1,
0.3476951, 1.294924, -0.1887621, 1, 1, 1, 1, 1,
0.3503085, -0.2105095, 3.141865, 1, 1, 1, 1, 1,
0.3508384, 2.362663, 0.253351, 1, 1, 1, 1, 1,
0.3555028, 1.052224, 1.159118, 1, 1, 1, 1, 1,
0.3613516, 0.318474, 0.5958804, 0, 0, 1, 1, 1,
0.3795654, 1.1626, 2.595056, 1, 0, 0, 1, 1,
0.3845111, -0.4035988, 1.989828, 1, 0, 0, 1, 1,
0.3857886, 0.3353185, 0.5032076, 1, 0, 0, 1, 1,
0.3916428, -1.156031, 2.376933, 1, 0, 0, 1, 1,
0.3967244, -0.4428219, 2.462498, 1, 0, 0, 1, 1,
0.4034291, -0.2432013, 0.2839931, 0, 0, 0, 1, 1,
0.4047297, -0.05192701, 1.652667, 0, 0, 0, 1, 1,
0.4053304, 0.8481224, -0.5867321, 0, 0, 0, 1, 1,
0.4114185, 0.04593771, 0.2832242, 0, 0, 0, 1, 1,
0.4133841, -0.8246608, 1.59457, 0, 0, 0, 1, 1,
0.4142047, -0.6880365, 3.674242, 0, 0, 0, 1, 1,
0.416564, -1.242626, 1.762055, 0, 0, 0, 1, 1,
0.4192921, -0.2468804, 2.800337, 1, 1, 1, 1, 1,
0.4198422, 1.692665, -0.5931224, 1, 1, 1, 1, 1,
0.4201583, 0.2818889, 2.264591, 1, 1, 1, 1, 1,
0.4223861, -0.1267903, 1.646608, 1, 1, 1, 1, 1,
0.4257796, 0.1745737, 1.457774, 1, 1, 1, 1, 1,
0.4266456, 1.084136, 1.559806, 1, 1, 1, 1, 1,
0.4355443, 0.344784, -0.1216507, 1, 1, 1, 1, 1,
0.4375669, -0.7549456, 3.091633, 1, 1, 1, 1, 1,
0.4388543, 0.4218033, 2.37094, 1, 1, 1, 1, 1,
0.4392253, -0.7808912, 2.703346, 1, 1, 1, 1, 1,
0.4416057, 1.444631, -0.4466821, 1, 1, 1, 1, 1,
0.4424184, -0.3877348, 3.739907, 1, 1, 1, 1, 1,
0.444198, 0.339319, 0.649012, 1, 1, 1, 1, 1,
0.4447013, -0.950147, 3.466837, 1, 1, 1, 1, 1,
0.4468946, -0.85984, 3.017551, 1, 1, 1, 1, 1,
0.4478245, -0.7748226, 2.356735, 0, 0, 1, 1, 1,
0.4482612, 0.1661577, 2.22134, 1, 0, 0, 1, 1,
0.449049, -0.3090608, 2.201891, 1, 0, 0, 1, 1,
0.44986, 0.6574824, 1.815305, 1, 0, 0, 1, 1,
0.4519659, 1.135223, 0.4056925, 1, 0, 0, 1, 1,
0.4540581, 1.114629, -1.641922, 1, 0, 0, 1, 1,
0.4601553, 0.1744388, 1.964685, 0, 0, 0, 1, 1,
0.4627776, 0.4561893, 0.9996724, 0, 0, 0, 1, 1,
0.4634559, 1.139632, -1.308897, 0, 0, 0, 1, 1,
0.4642426, 0.5255833, 0.6356161, 0, 0, 0, 1, 1,
0.4661504, 1.264364, 1.767173, 0, 0, 0, 1, 1,
0.4700792, 0.06494694, 0.2437802, 0, 0, 0, 1, 1,
0.4706969, -0.5356446, 3.064898, 0, 0, 0, 1, 1,
0.471152, -0.07842413, 0.2927079, 1, 1, 1, 1, 1,
0.4720321, 1.302558, 0.5378981, 1, 1, 1, 1, 1,
0.4745281, 0.0252145, 0.9712386, 1, 1, 1, 1, 1,
0.4751128, -1.673235, 3.303554, 1, 1, 1, 1, 1,
0.4754643, -0.7988654, 2.117157, 1, 1, 1, 1, 1,
0.4757306, -0.2646492, 2.837818, 1, 1, 1, 1, 1,
0.4804592, -0.328611, 1.582555, 1, 1, 1, 1, 1,
0.4907655, -0.8222888, 3.182385, 1, 1, 1, 1, 1,
0.4908984, -0.9356683, 1.712114, 1, 1, 1, 1, 1,
0.4924214, -0.2075467, 0.6901396, 1, 1, 1, 1, 1,
0.4937778, -1.01518, 2.507898, 1, 1, 1, 1, 1,
0.5030268, -0.4770196, 3.856262, 1, 1, 1, 1, 1,
0.503233, 0.9936699, -0.7501445, 1, 1, 1, 1, 1,
0.5045499, -0.2949449, 3.06309, 1, 1, 1, 1, 1,
0.5061527, -1.399763, 3.900383, 1, 1, 1, 1, 1,
0.5087715, 0.5641213, 1.317988, 0, 0, 1, 1, 1,
0.5099707, 0.3774996, -0.4571513, 1, 0, 0, 1, 1,
0.511635, -2.416264, 2.871406, 1, 0, 0, 1, 1,
0.511869, 0.9408195, 1.360922, 1, 0, 0, 1, 1,
0.5125356, -0.03957189, 2.79953, 1, 0, 0, 1, 1,
0.5137407, -0.7349604, 4.829035, 1, 0, 0, 1, 1,
0.5194685, 0.8440495, 0.3934036, 0, 0, 0, 1, 1,
0.5216432, 0.3240878, 1.839687, 0, 0, 0, 1, 1,
0.5225993, 0.6264189, -1.30685, 0, 0, 0, 1, 1,
0.5249225, 0.2764074, 0.8485311, 0, 0, 0, 1, 1,
0.5253246, -2.360549, 1.590493, 0, 0, 0, 1, 1,
0.5287088, -0.4107263, 0.7127733, 0, 0, 0, 1, 1,
0.5330012, 0.3084645, 3.474418, 0, 0, 0, 1, 1,
0.5342993, 2.053163, -0.3586353, 1, 1, 1, 1, 1,
0.5366997, -0.1982923, 0.642188, 1, 1, 1, 1, 1,
0.5416952, -0.6343198, 2.414464, 1, 1, 1, 1, 1,
0.543933, 1.000196, 1.580073, 1, 1, 1, 1, 1,
0.5443968, 0.0681086, 1.627714, 1, 1, 1, 1, 1,
0.5445083, -1.820923, 3.617081, 1, 1, 1, 1, 1,
0.5484434, -1.78598, 3.724072, 1, 1, 1, 1, 1,
0.5508093, 0.2107024, 1.664038, 1, 1, 1, 1, 1,
0.5529192, -1.637716, 2.968799, 1, 1, 1, 1, 1,
0.5533667, -0.01024454, 1.207918, 1, 1, 1, 1, 1,
0.5537983, -0.3951798, 0.9221328, 1, 1, 1, 1, 1,
0.5562161, -0.1046944, -1.577963, 1, 1, 1, 1, 1,
0.5679619, 2.048406, 0.304415, 1, 1, 1, 1, 1,
0.5745533, 1.939737, 0.05857583, 1, 1, 1, 1, 1,
0.578087, -0.617603, 3.243456, 1, 1, 1, 1, 1,
0.5783917, -2.14012, 3.643113, 0, 0, 1, 1, 1,
0.5790014, -1.750117, 5.000399, 1, 0, 0, 1, 1,
0.5791973, -0.4281805, 2.493732, 1, 0, 0, 1, 1,
0.5793789, -1.623031, 3.622437, 1, 0, 0, 1, 1,
0.5960507, 0.458951, 2.777475, 1, 0, 0, 1, 1,
0.5995946, -0.3349053, -0.1354141, 1, 0, 0, 1, 1,
0.6022907, -1.194419, 1.669041, 0, 0, 0, 1, 1,
0.6105846, 0.02535067, 2.464276, 0, 0, 0, 1, 1,
0.6112517, 1.622309, 0.7090487, 0, 0, 0, 1, 1,
0.6121656, 0.3681079, 2.001778, 0, 0, 0, 1, 1,
0.6164111, 1.731167, 1.250179, 0, 0, 0, 1, 1,
0.6193733, 0.09774466, 0.5378253, 0, 0, 0, 1, 1,
0.6217584, 1.06364, -0.7119341, 0, 0, 0, 1, 1,
0.6237161, 1.068075, 2.460631, 1, 1, 1, 1, 1,
0.6250737, -1.409668, 2.05663, 1, 1, 1, 1, 1,
0.6259873, 1.548765, -0.1848579, 1, 1, 1, 1, 1,
0.6382233, -0.4806266, 0.3547343, 1, 1, 1, 1, 1,
0.6409799, -1.260182, 3.157778, 1, 1, 1, 1, 1,
0.6413301, 0.5641488, -0.495905, 1, 1, 1, 1, 1,
0.6434082, -1.514671, 1.337414, 1, 1, 1, 1, 1,
0.6462258, -0.2229063, 0.7900329, 1, 1, 1, 1, 1,
0.647504, -1.330362, 4.463603, 1, 1, 1, 1, 1,
0.6504367, 1.27496, 2.032269, 1, 1, 1, 1, 1,
0.6535239, -1.367871, 2.16088, 1, 1, 1, 1, 1,
0.6548095, -1.476197, 2.94161, 1, 1, 1, 1, 1,
0.6551336, -1.652192, 2.82257, 1, 1, 1, 1, 1,
0.6669289, 0.9582902, 1.166703, 1, 1, 1, 1, 1,
0.6711357, -0.5502951, 1.189703, 1, 1, 1, 1, 1,
0.6729671, 0.1660276, 2.922691, 0, 0, 1, 1, 1,
0.6729995, 0.6011809, 1.869462, 1, 0, 0, 1, 1,
0.6752065, -0.0399634, -0.4186575, 1, 0, 0, 1, 1,
0.6762223, -1.297067, 0.2481762, 1, 0, 0, 1, 1,
0.6806975, 1.180461, 1.513959, 1, 0, 0, 1, 1,
0.6835753, -0.425971, 1.989249, 1, 0, 0, 1, 1,
0.6882806, 1.05462, 0.03771706, 0, 0, 0, 1, 1,
0.6945753, -1.597955, 0.1871876, 0, 0, 0, 1, 1,
0.7000257, -1.485971, 3.309898, 0, 0, 0, 1, 1,
0.7082822, 0.3470947, 0.362734, 0, 0, 0, 1, 1,
0.7097931, -1.218558, 2.768836, 0, 0, 0, 1, 1,
0.7105318, -0.5004244, 3.626391, 0, 0, 0, 1, 1,
0.7114407, -0.2692947, 1.970138, 0, 0, 0, 1, 1,
0.7118414, -0.4801662, 2.638534, 1, 1, 1, 1, 1,
0.7173675, 1.50607, 0.009612846, 1, 1, 1, 1, 1,
0.7286355, -0.8849139, 0.7484474, 1, 1, 1, 1, 1,
0.7298905, 0.7222577, -0.2945706, 1, 1, 1, 1, 1,
0.7346944, -0.6435495, 2.898517, 1, 1, 1, 1, 1,
0.7362264, 0.1616486, -1.310389, 1, 1, 1, 1, 1,
0.7379432, -0.3619454, 1.467026, 1, 1, 1, 1, 1,
0.7379729, -0.6943907, 2.944932, 1, 1, 1, 1, 1,
0.7426922, -1.465587, 3.967703, 1, 1, 1, 1, 1,
0.7445264, -2.814766, 2.753807, 1, 1, 1, 1, 1,
0.7492124, 0.06051991, 1.243692, 1, 1, 1, 1, 1,
0.7511135, 0.5002135, 1.390207, 1, 1, 1, 1, 1,
0.7533746, -0.716823, 3.067066, 1, 1, 1, 1, 1,
0.761686, -0.5425513, 1.189507, 1, 1, 1, 1, 1,
0.7717974, -0.5514799, 2.586556, 1, 1, 1, 1, 1,
0.772613, -0.2348682, 1.877495, 0, 0, 1, 1, 1,
0.7732663, 0.9654727, -1.437134, 1, 0, 0, 1, 1,
0.7838165, -1.966885, 1.006958, 1, 0, 0, 1, 1,
0.7859175, -0.2053757, 3.045564, 1, 0, 0, 1, 1,
0.7895461, -2.155847, 1.652989, 1, 0, 0, 1, 1,
0.7908632, 1.109409, 1.600359, 1, 0, 0, 1, 1,
0.7913191, -1.395785, 1.320078, 0, 0, 0, 1, 1,
0.7940069, 0.3785206, 2.088346, 0, 0, 0, 1, 1,
0.7980484, 0.2390623, 2.196862, 0, 0, 0, 1, 1,
0.8001001, -0.6915231, 3.334856, 0, 0, 0, 1, 1,
0.8011137, -1.28388, 1.94438, 0, 0, 0, 1, 1,
0.8052265, 0.793781, 0.6435577, 0, 0, 0, 1, 1,
0.8111563, -0.7026147, 1.333705, 0, 0, 0, 1, 1,
0.818516, -0.3500466, 1.839454, 1, 1, 1, 1, 1,
0.8224309, -1.661597, 2.190371, 1, 1, 1, 1, 1,
0.8228523, -1.142687, 2.951813, 1, 1, 1, 1, 1,
0.8243716, 0.9977157, 1.943397, 1, 1, 1, 1, 1,
0.8278948, -2.666139, 5.238888, 1, 1, 1, 1, 1,
0.8323705, -0.223118, 2.649575, 1, 1, 1, 1, 1,
0.8345345, 1.053856, -0.6254876, 1, 1, 1, 1, 1,
0.8357403, -2.281542, 3.10677, 1, 1, 1, 1, 1,
0.8372757, 0.01046199, -0.1282019, 1, 1, 1, 1, 1,
0.8414253, 0.8328011, 1.63337, 1, 1, 1, 1, 1,
0.8429505, -1.945913, 4.648958, 1, 1, 1, 1, 1,
0.8433589, -0.4385644, 2.64471, 1, 1, 1, 1, 1,
0.8475971, -0.4217717, 1.593143, 1, 1, 1, 1, 1,
0.8709208, 0.6420317, 1.835992, 1, 1, 1, 1, 1,
0.8740164, 0.217602, 1.026494, 1, 1, 1, 1, 1,
0.8753748, 0.379173, 0.4542951, 0, 0, 1, 1, 1,
0.8760238, 0.3925928, 0.8158767, 1, 0, 0, 1, 1,
0.8766457, -0.685602, 1.257421, 1, 0, 0, 1, 1,
0.8805382, -1.085004, 2.590099, 1, 0, 0, 1, 1,
0.8820273, -1.745931, 2.072487, 1, 0, 0, 1, 1,
0.8893124, 0.346768, 1.619245, 1, 0, 0, 1, 1,
0.8898747, 0.1337633, 2.832067, 0, 0, 0, 1, 1,
0.8904127, 1.454747, 0.5293451, 0, 0, 0, 1, 1,
0.8905055, -1.868365, 2.073355, 0, 0, 0, 1, 1,
0.8912167, 0.8438993, 1.731413, 0, 0, 0, 1, 1,
0.8922652, 1.576257, 0.7362317, 0, 0, 0, 1, 1,
0.8959926, 1.064366, 1.689965, 0, 0, 0, 1, 1,
0.8992431, -0.2667588, 1.774984, 0, 0, 0, 1, 1,
0.8997168, 0.187333, 0.6391215, 1, 1, 1, 1, 1,
0.900843, 0.897209, 1.019865, 1, 1, 1, 1, 1,
0.9090416, -0.2100176, 1.748024, 1, 1, 1, 1, 1,
0.9115909, 1.132923, -0.0657859, 1, 1, 1, 1, 1,
0.9179258, 0.6902936, 1.407236, 1, 1, 1, 1, 1,
0.92551, -0.5766304, 1.423341, 1, 1, 1, 1, 1,
0.9255664, 0.5206593, 1.234713, 1, 1, 1, 1, 1,
0.928661, -0.6960791, 4.600772, 1, 1, 1, 1, 1,
0.9330238, -0.6449884, 2.697958, 1, 1, 1, 1, 1,
0.9515979, -0.6347404, 2.004454, 1, 1, 1, 1, 1,
0.9559261, 0.5464044, 1.230756, 1, 1, 1, 1, 1,
0.9636934, -0.4281644, 0.8243325, 1, 1, 1, 1, 1,
0.9751634, -1.168314, 2.235978, 1, 1, 1, 1, 1,
0.9880623, -0.34735, 1.216111, 1, 1, 1, 1, 1,
0.9947774, -0.8435746, 2.300112, 1, 1, 1, 1, 1,
0.9987991, 0.70504, -0.05071056, 0, 0, 1, 1, 1,
0.998836, 0.8601288, 0.6211877, 1, 0, 0, 1, 1,
1.00082, -0.083209, 2.009492, 1, 0, 0, 1, 1,
1.008603, 0.7212069, -0.1669805, 1, 0, 0, 1, 1,
1.015076, -0.7624981, 2.497056, 1, 0, 0, 1, 1,
1.022944, -1.306159, 2.951117, 1, 0, 0, 1, 1,
1.026294, 0.506798, 1.059967, 0, 0, 0, 1, 1,
1.026512, -1.565768, 2.117454, 0, 0, 0, 1, 1,
1.030974, -2.27458, 1.992925, 0, 0, 0, 1, 1,
1.032325, 0.04355463, 2.26699, 0, 0, 0, 1, 1,
1.034851, -2.202121, 3.545752, 0, 0, 0, 1, 1,
1.037111, 0.7968243, -0.2401484, 0, 0, 0, 1, 1,
1.037303, 1.00169, 1.483294, 0, 0, 0, 1, 1,
1.040401, 1.306435, 0.605288, 1, 1, 1, 1, 1,
1.041214, -0.1843652, -0.2600409, 1, 1, 1, 1, 1,
1.043441, 1.031048, 1.237371, 1, 1, 1, 1, 1,
1.052362, 0.4347053, 0.7851456, 1, 1, 1, 1, 1,
1.05433, -0.7376811, 1.988533, 1, 1, 1, 1, 1,
1.055978, -0.01681696, 2.59269, 1, 1, 1, 1, 1,
1.057239, 0.3652327, 0.7618603, 1, 1, 1, 1, 1,
1.058275, -1.245792, 4.621188, 1, 1, 1, 1, 1,
1.068326, 0.6808176, 0.8202784, 1, 1, 1, 1, 1,
1.068864, 0.2443763, 2.066451, 1, 1, 1, 1, 1,
1.072939, -0.345032, 2.504252, 1, 1, 1, 1, 1,
1.081774, 0.8934997, 1.469549, 1, 1, 1, 1, 1,
1.086264, -0.1820375, 1.828719, 1, 1, 1, 1, 1,
1.089552, 1.097079, 0.9476001, 1, 1, 1, 1, 1,
1.095932, -0.2923135, 1.325241, 1, 1, 1, 1, 1,
1.097492, 0.5305333, 0.02876301, 0, 0, 1, 1, 1,
1.098176, 0.2600428, 1.494981, 1, 0, 0, 1, 1,
1.109355, -1.727474, 1.126857, 1, 0, 0, 1, 1,
1.111505, 0.9090043, -1.145782, 1, 0, 0, 1, 1,
1.116493, -0.4421697, 3.1719, 1, 0, 0, 1, 1,
1.122339, 1.443284, 0.5900571, 1, 0, 0, 1, 1,
1.126957, 0.2426034, 1.872085, 0, 0, 0, 1, 1,
1.134709, -1.460197, 2.273817, 0, 0, 0, 1, 1,
1.136574, 0.3208408, 2.671522, 0, 0, 0, 1, 1,
1.144658, -0.9362687, 3.091819, 0, 0, 0, 1, 1,
1.145829, 0.9701746, 1.045557, 0, 0, 0, 1, 1,
1.152175, 1.163983, 1.73561, 0, 0, 0, 1, 1,
1.154358, -0.7452428, 3.452459, 0, 0, 0, 1, 1,
1.158435, -0.3280457, 2.618356, 1, 1, 1, 1, 1,
1.162531, -0.1790024, 0.3442407, 1, 1, 1, 1, 1,
1.163034, 1.87746, 0.1393861, 1, 1, 1, 1, 1,
1.170865, -0.2083338, 3.021298, 1, 1, 1, 1, 1,
1.17774, 0.07574724, 0.9152056, 1, 1, 1, 1, 1,
1.188965, -0.5520355, 1.43929, 1, 1, 1, 1, 1,
1.199468, -1.569534, 2.111667, 1, 1, 1, 1, 1,
1.208278, -1.304645, 2.414638, 1, 1, 1, 1, 1,
1.209556, -1.566781, 4.138579, 1, 1, 1, 1, 1,
1.212752, 1.80448, 0.6709247, 1, 1, 1, 1, 1,
1.218364, 0.05421075, 1.869247, 1, 1, 1, 1, 1,
1.221908, 0.6978925, 3.385905, 1, 1, 1, 1, 1,
1.224143, -0.9235314, 2.88678, 1, 1, 1, 1, 1,
1.22617, 0.1212063, 3.080574, 1, 1, 1, 1, 1,
1.233683, 0.7120789, -0.3024338, 1, 1, 1, 1, 1,
1.246503, -0.1545732, 2.618517, 0, 0, 1, 1, 1,
1.248419, 0.1854971, 0.622856, 1, 0, 0, 1, 1,
1.253155, 0.2226354, 1.424216, 1, 0, 0, 1, 1,
1.257388, -2.618106, 1.883088, 1, 0, 0, 1, 1,
1.263326, 0.3385246, 1.54432, 1, 0, 0, 1, 1,
1.263706, -1.579656, 1.513832, 1, 0, 0, 1, 1,
1.26371, -0.2615967, 0.3026084, 0, 0, 0, 1, 1,
1.264065, 0.2210227, 3.397936, 0, 0, 0, 1, 1,
1.271598, -0.203284, 0.09904698, 0, 0, 0, 1, 1,
1.272101, -0.1456706, 0.6784018, 0, 0, 0, 1, 1,
1.274133, 0.9200489, 0.2719256, 0, 0, 0, 1, 1,
1.283619, -0.733993, 0.6833017, 0, 0, 0, 1, 1,
1.285383, 0.7637364, 1.313356, 0, 0, 0, 1, 1,
1.296809, 1.517739, 0.1009395, 1, 1, 1, 1, 1,
1.302714, -1.532026, 3.286011, 1, 1, 1, 1, 1,
1.305284, -0.3309295, 3.996503, 1, 1, 1, 1, 1,
1.310403, -1.216917, 2.697055, 1, 1, 1, 1, 1,
1.321384, -0.1650815, 0.5347403, 1, 1, 1, 1, 1,
1.330489, 1.308821, 1.022889, 1, 1, 1, 1, 1,
1.340337, 2.336282, 1.290483, 1, 1, 1, 1, 1,
1.346089, 1.882535, 1.316503, 1, 1, 1, 1, 1,
1.350086, 1.217984, 0.6619043, 1, 1, 1, 1, 1,
1.351243, 1.745973, 0.8831505, 1, 1, 1, 1, 1,
1.353649, -0.2372377, 0.747112, 1, 1, 1, 1, 1,
1.356342, -0.8850554, 3.837926, 1, 1, 1, 1, 1,
1.361281, 1.278472, 2.23134, 1, 1, 1, 1, 1,
1.374589, 0.3716087, 2.34249, 1, 1, 1, 1, 1,
1.379059, -0.144494, 1.593907, 1, 1, 1, 1, 1,
1.38129, -1.055441, 2.428789, 0, 0, 1, 1, 1,
1.38549, 0.2660784, 2.255749, 1, 0, 0, 1, 1,
1.38642, 0.05051764, 1.696, 1, 0, 0, 1, 1,
1.397918, -0.4781021, 1.624646, 1, 0, 0, 1, 1,
1.419619, -1.397721, 2.912125, 1, 0, 0, 1, 1,
1.43747, 0.7192574, -0.9134512, 1, 0, 0, 1, 1,
1.449579, -0.006489928, 0.3050375, 0, 0, 0, 1, 1,
1.452309, 0.1725615, 2.049995, 0, 0, 0, 1, 1,
1.48971, 0.2088733, 2.002549, 0, 0, 0, 1, 1,
1.507076, -1.021764, 1.07919, 0, 0, 0, 1, 1,
1.516207, -0.6085463, 3.420689, 0, 0, 0, 1, 1,
1.520839, 1.646464, 2.798119, 0, 0, 0, 1, 1,
1.521671, 0.6690622, 0.8124982, 0, 0, 0, 1, 1,
1.524557, -0.7732091, 0.8664234, 1, 1, 1, 1, 1,
1.537443, 0.2359959, 0.7928343, 1, 1, 1, 1, 1,
1.537861, 1.295229, 1.3402, 1, 1, 1, 1, 1,
1.541284, 0.3451104, 4.022288, 1, 1, 1, 1, 1,
1.548331, -1.431873, 3.129871, 1, 1, 1, 1, 1,
1.550343, 0.03400206, 1.324691, 1, 1, 1, 1, 1,
1.55103, -0.5510423, 1.323122, 1, 1, 1, 1, 1,
1.55633, -0.7235008, 3.223661, 1, 1, 1, 1, 1,
1.56886, -0.1735517, 2.992993, 1, 1, 1, 1, 1,
1.582303, 0.9346821, 0.6126273, 1, 1, 1, 1, 1,
1.586318, 0.4245077, 0.1067955, 1, 1, 1, 1, 1,
1.620708, -0.04840706, 1.315612, 1, 1, 1, 1, 1,
1.65977, 2.010867, -0.8159857, 1, 1, 1, 1, 1,
1.663746, -0.9113514, 2.967016, 1, 1, 1, 1, 1,
1.664242, -0.2485473, 0.8409144, 1, 1, 1, 1, 1,
1.692796, 0.02186625, 3.389601, 0, 0, 1, 1, 1,
1.702807, -0.4720165, 3.109433, 1, 0, 0, 1, 1,
1.7355, 2.154944, -0.2513739, 1, 0, 0, 1, 1,
1.741382, 0.4863339, 0.3843167, 1, 0, 0, 1, 1,
1.741561, -1.347074, 3.602563, 1, 0, 0, 1, 1,
1.747589, 1.127132, -0.6087994, 1, 0, 0, 1, 1,
1.749173, 0.2390174, 0.5731472, 0, 0, 0, 1, 1,
1.760029, -0.07410776, -0.4897876, 0, 0, 0, 1, 1,
1.76822, 0.08343846, 2.111932, 0, 0, 0, 1, 1,
1.772713, -0.4855857, 2.993212, 0, 0, 0, 1, 1,
1.820711, -1.155295, 2.209309, 0, 0, 0, 1, 1,
1.845285, 0.6664565, 0.964628, 0, 0, 0, 1, 1,
1.845385, 0.2824464, 1.345152, 0, 0, 0, 1, 1,
1.871758, 0.3175775, 1.030496, 1, 1, 1, 1, 1,
1.876902, -0.006360315, 0.3560704, 1, 1, 1, 1, 1,
1.877294, 0.4571616, 0.8421841, 1, 1, 1, 1, 1,
1.882076, 0.1245659, -0.1187637, 1, 1, 1, 1, 1,
1.883772, 0.852014, 1.648261, 1, 1, 1, 1, 1,
1.884499, 0.1689834, 1.332679, 1, 1, 1, 1, 1,
1.885228, -0.4394723, 2.826823, 1, 1, 1, 1, 1,
1.891075, -0.5220657, 2.001895, 1, 1, 1, 1, 1,
1.916341, -1.409562, 2.298709, 1, 1, 1, 1, 1,
1.928148, -0.4509854, 1.691335, 1, 1, 1, 1, 1,
1.93248, 0.2458979, 0.3130539, 1, 1, 1, 1, 1,
1.947845, 0.7221717, 1.584515, 1, 1, 1, 1, 1,
2.001496, 0.2278914, 1.672874, 1, 1, 1, 1, 1,
2.014131, 0.2741099, 0.3388663, 1, 1, 1, 1, 1,
2.034294, 0.2237926, 2.572634, 1, 1, 1, 1, 1,
2.046182, -0.4181984, 1.064244, 0, 0, 1, 1, 1,
2.058951, -0.6238327, 2.577472, 1, 0, 0, 1, 1,
2.059792, 0.7283659, 1.375345, 1, 0, 0, 1, 1,
2.086696, 1.089873, -0.04434989, 1, 0, 0, 1, 1,
2.103482, 2.702705, 1.697848, 1, 0, 0, 1, 1,
2.156885, 0.624495, 1.274525, 1, 0, 0, 1, 1,
2.164832, -0.03735458, 4.083319, 0, 0, 0, 1, 1,
2.211976, -0.06801828, 1.055347, 0, 0, 0, 1, 1,
2.231381, -1.281825, 0.8689418, 0, 0, 0, 1, 1,
2.253501, -0.05036855, 1.873066, 0, 0, 0, 1, 1,
2.29216, 0.5113262, 1.95578, 0, 0, 0, 1, 1,
2.318229, 0.2909766, -0.06270475, 0, 0, 0, 1, 1,
2.36798, 1.042607, 1.69248, 0, 0, 0, 1, 1,
2.375273, 1.544029, 1.100553, 1, 1, 1, 1, 1,
2.422571, -1.183294, 1.608839, 1, 1, 1, 1, 1,
2.717275, -0.8113274, 2.387286, 1, 1, 1, 1, 1,
2.813766, 0.3259137, 1.629489, 1, 1, 1, 1, 1,
2.907043, -0.4034885, 2.247, 1, 1, 1, 1, 1,
3.16279, -0.5450348, 3.741939, 1, 1, 1, 1, 1,
3.310303, -0.6501147, 1.021726, 1, 1, 1, 1, 1
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
var radius = 9.72493;
var distance = 34.15841;
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
mvMatrix.translate( -0.01305342, 0.182345, 0.1828661 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15841);
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
