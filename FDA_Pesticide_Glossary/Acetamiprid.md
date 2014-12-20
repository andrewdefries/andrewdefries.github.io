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
-3.107304, 0.5088482, -1.766384, 1, 0, 0, 1,
-3.035448, 0.4257031, -0.2084628, 1, 0.007843138, 0, 1,
-2.893899, 0.2260807, -2.005281, 1, 0.01176471, 0, 1,
-2.855292, 0.3799137, -1.581707, 1, 0.01960784, 0, 1,
-2.708349, -0.1418285, -0.3958426, 1, 0.02352941, 0, 1,
-2.705783, -0.5874969, -1.406191, 1, 0.03137255, 0, 1,
-2.663548, 1.176873, -1.088113, 1, 0.03529412, 0, 1,
-2.624795, -0.3809517, 0.5808778, 1, 0.04313726, 0, 1,
-2.59723, 1.289666, -0.2647693, 1, 0.04705882, 0, 1,
-2.481974, 0.7926232, -4.322363, 1, 0.05490196, 0, 1,
-2.481083, -1.043183, -1.86, 1, 0.05882353, 0, 1,
-2.345703, -0.5769839, -1.321771, 1, 0.06666667, 0, 1,
-2.306242, 2.379512, -0.175117, 1, 0.07058824, 0, 1,
-2.245719, -1.785471, -0.5851385, 1, 0.07843138, 0, 1,
-2.242085, -0.4088661, -2.222268, 1, 0.08235294, 0, 1,
-2.225049, -0.5146057, -0.9831782, 1, 0.09019608, 0, 1,
-2.156312, -0.3736903, -2.460911, 1, 0.09411765, 0, 1,
-2.141564, 0.06554283, -0.4013225, 1, 0.1019608, 0, 1,
-2.125944, 0.08561281, -2.360378, 1, 0.1098039, 0, 1,
-2.117636, 0.2363039, -1.217527, 1, 0.1137255, 0, 1,
-2.10466, 0.1165649, -3.863691, 1, 0.1215686, 0, 1,
-2.086646, -0.7849941, -1.761073, 1, 0.1254902, 0, 1,
-2.070245, -0.02151474, 0.09838313, 1, 0.1333333, 0, 1,
-2.033108, 0.854564, 0.9216326, 1, 0.1372549, 0, 1,
-2.022442, 0.3636216, -2.074288, 1, 0.145098, 0, 1,
-1.926698, -0.06760011, -0.8861507, 1, 0.1490196, 0, 1,
-1.918463, 0.5531455, -2.402658, 1, 0.1568628, 0, 1,
-1.917406, 1.060887, -1.935327, 1, 0.1607843, 0, 1,
-1.913986, 1.329737, -0.2529126, 1, 0.1686275, 0, 1,
-1.897724, -0.6348699, -3.627869, 1, 0.172549, 0, 1,
-1.883524, -1.071418, -2.253169, 1, 0.1803922, 0, 1,
-1.850489, -0.5511006, -3.047147, 1, 0.1843137, 0, 1,
-1.845568, 0.8737532, -1.371863, 1, 0.1921569, 0, 1,
-1.844033, -0.0845402, -0.5434541, 1, 0.1960784, 0, 1,
-1.841194, 0.3778019, 0.6298885, 1, 0.2039216, 0, 1,
-1.769828, 1.01673, -2.398194, 1, 0.2117647, 0, 1,
-1.768481, 0.1593085, -1.555403, 1, 0.2156863, 0, 1,
-1.762188, 1.488053, -0.5924107, 1, 0.2235294, 0, 1,
-1.755589, -1.134991, -1.995951, 1, 0.227451, 0, 1,
-1.749374, 0.4010377, -2.978636, 1, 0.2352941, 0, 1,
-1.743159, -1.977629, -2.624515, 1, 0.2392157, 0, 1,
-1.699316, 1.01766, 0.04615043, 1, 0.2470588, 0, 1,
-1.684872, 0.7916899, -1.355417, 1, 0.2509804, 0, 1,
-1.673055, -0.01896655, -1.694846, 1, 0.2588235, 0, 1,
-1.672588, -0.8501357, -1.206112, 1, 0.2627451, 0, 1,
-1.652158, 1.86717, -0.8291332, 1, 0.2705882, 0, 1,
-1.635334, -3.496919, -2.078605, 1, 0.2745098, 0, 1,
-1.634714, 0.4564871, 0.9256898, 1, 0.282353, 0, 1,
-1.632166, -0.07131094, -3.482589, 1, 0.2862745, 0, 1,
-1.622683, 0.2652071, -3.776002, 1, 0.2941177, 0, 1,
-1.621344, -0.9684466, -0.7282757, 1, 0.3019608, 0, 1,
-1.617359, -1.841188, -1.753115, 1, 0.3058824, 0, 1,
-1.602189, 1.167306, -1.106195, 1, 0.3137255, 0, 1,
-1.59206, 0.3391351, -2.696224, 1, 0.3176471, 0, 1,
-1.572668, -0.195324, -2.762382, 1, 0.3254902, 0, 1,
-1.566005, 0.1427958, -3.183712, 1, 0.3294118, 0, 1,
-1.55287, -1.700068, -2.622854, 1, 0.3372549, 0, 1,
-1.550144, -0.9941199, -2.720353, 1, 0.3411765, 0, 1,
-1.547631, -2.052321, -1.285598, 1, 0.3490196, 0, 1,
-1.537927, 0.04160601, -1.061858, 1, 0.3529412, 0, 1,
-1.533126, -0.3808419, -2.62133, 1, 0.3607843, 0, 1,
-1.529321, -0.06883328, -1.98672, 1, 0.3647059, 0, 1,
-1.522871, -0.6765896, -0.5459966, 1, 0.372549, 0, 1,
-1.517433, 1.200697, -0.09579471, 1, 0.3764706, 0, 1,
-1.463359, -0.2113109, -1.706879, 1, 0.3843137, 0, 1,
-1.456867, -0.3854599, -1.889931, 1, 0.3882353, 0, 1,
-1.45229, -1.497666, -2.323328, 1, 0.3960784, 0, 1,
-1.419033, -0.8738105, -3.516037, 1, 0.4039216, 0, 1,
-1.412984, -1.852929, -1.368356, 1, 0.4078431, 0, 1,
-1.412348, -0.2321685, -0.9672615, 1, 0.4156863, 0, 1,
-1.411756, 0.3499865, -1.176559, 1, 0.4196078, 0, 1,
-1.411619, 0.8954544, 0.0623765, 1, 0.427451, 0, 1,
-1.408306, -0.4884737, -2.241972, 1, 0.4313726, 0, 1,
-1.389255, 0.6223581, -1.953099, 1, 0.4392157, 0, 1,
-1.385963, -0.4715729, -0.8443872, 1, 0.4431373, 0, 1,
-1.379367, -0.09905346, -1.062653, 1, 0.4509804, 0, 1,
-1.36368, 0.2498016, 0.08038703, 1, 0.454902, 0, 1,
-1.361656, -0.7050475, -2.652588, 1, 0.4627451, 0, 1,
-1.353242, -2.150005, -2.099397, 1, 0.4666667, 0, 1,
-1.352941, -0.4221083, -2.170725, 1, 0.4745098, 0, 1,
-1.351841, -1.16542, -3.101253, 1, 0.4784314, 0, 1,
-1.351794, 0.752667, -0.7792589, 1, 0.4862745, 0, 1,
-1.342423, -0.729002, -3.237618, 1, 0.4901961, 0, 1,
-1.333668, -0.8340281, -2.536438, 1, 0.4980392, 0, 1,
-1.332166, -0.7081441, -1.189283, 1, 0.5058824, 0, 1,
-1.321384, 1.011418, 0.2095828, 1, 0.509804, 0, 1,
-1.308844, -0.3779762, -0.9763876, 1, 0.5176471, 0, 1,
-1.305642, -1.488344, -2.606758, 1, 0.5215687, 0, 1,
-1.305116, -0.09377757, -0.6439124, 1, 0.5294118, 0, 1,
-1.290712, -1.954625, -3.827105, 1, 0.5333334, 0, 1,
-1.283158, -0.02904849, -0.5444478, 1, 0.5411765, 0, 1,
-1.281209, -1.961191, -0.9426027, 1, 0.5450981, 0, 1,
-1.280381, -0.5321802, -2.459445, 1, 0.5529412, 0, 1,
-1.280081, 1.652958, -1.480579, 1, 0.5568628, 0, 1,
-1.279568, 1.254308, 0.7209356, 1, 0.5647059, 0, 1,
-1.279253, 1.259537, -1.418814, 1, 0.5686275, 0, 1,
-1.275086, 0.5179538, -1.007873, 1, 0.5764706, 0, 1,
-1.265337, 0.7939219, -0.6953954, 1, 0.5803922, 0, 1,
-1.265263, -1.148077, -2.584879, 1, 0.5882353, 0, 1,
-1.255687, -0.7600054, -2.395773, 1, 0.5921569, 0, 1,
-1.254712, -0.0693525, -1.676592, 1, 0.6, 0, 1,
-1.242444, -0.4486615, -0.9769383, 1, 0.6078432, 0, 1,
-1.238317, -1.089088, -3.983794, 1, 0.6117647, 0, 1,
-1.236001, -1.15173, -3.385896, 1, 0.6196079, 0, 1,
-1.23557, 1.106728, -0.06524914, 1, 0.6235294, 0, 1,
-1.234328, -0.8714415, -3.155502, 1, 0.6313726, 0, 1,
-1.227669, 0.2801504, -2.282592, 1, 0.6352941, 0, 1,
-1.222286, -1.230411, -2.20365, 1, 0.6431373, 0, 1,
-1.218396, -0.9462569, -2.358082, 1, 0.6470588, 0, 1,
-1.217809, -1.741892, -3.142613, 1, 0.654902, 0, 1,
-1.217358, 0.9990125, -1.106455, 1, 0.6588235, 0, 1,
-1.210265, 0.2409279, -2.292368, 1, 0.6666667, 0, 1,
-1.207231, 1.082129, -2.388794, 1, 0.6705883, 0, 1,
-1.206279, -0.6537793, -2.181577, 1, 0.6784314, 0, 1,
-1.204367, 0.04125457, 0.5989649, 1, 0.682353, 0, 1,
-1.200551, -0.3876222, -1.603853, 1, 0.6901961, 0, 1,
-1.199121, 0.6872646, 0.773038, 1, 0.6941177, 0, 1,
-1.19803, 1.546044, -0.9368463, 1, 0.7019608, 0, 1,
-1.195689, 0.5865355, -0.005851012, 1, 0.7098039, 0, 1,
-1.194068, 0.2213506, 1.129092, 1, 0.7137255, 0, 1,
-1.190781, 0.1854191, 0.1331172, 1, 0.7215686, 0, 1,
-1.183045, 0.2354516, -1.244516, 1, 0.7254902, 0, 1,
-1.175811, 0.7293355, -2.75162, 1, 0.7333333, 0, 1,
-1.170097, 0.7342732, -2.308661, 1, 0.7372549, 0, 1,
-1.161879, -1.682264, -1.298001, 1, 0.7450981, 0, 1,
-1.160608, -2.179491, -1.763006, 1, 0.7490196, 0, 1,
-1.155383, -0.05316141, -2.228762, 1, 0.7568628, 0, 1,
-1.154381, 0.1027763, -0.1910825, 1, 0.7607843, 0, 1,
-1.15263, 0.4836056, -1.499733, 1, 0.7686275, 0, 1,
-1.151249, 1.236287, -1.383118, 1, 0.772549, 0, 1,
-1.149943, -2.717954, -1.769511, 1, 0.7803922, 0, 1,
-1.147617, 0.811163, -1.502805, 1, 0.7843137, 0, 1,
-1.143919, -0.741892, -2.188619, 1, 0.7921569, 0, 1,
-1.142907, 0.5490131, -2.01201, 1, 0.7960784, 0, 1,
-1.136262, 2.630589, -1.860656, 1, 0.8039216, 0, 1,
-1.124925, -0.6150083, -2.03946, 1, 0.8117647, 0, 1,
-1.116844, 1.430625, -0.4364074, 1, 0.8156863, 0, 1,
-1.109906, -1.331815, -3.888034, 1, 0.8235294, 0, 1,
-1.098511, -0.4020867, -1.330715, 1, 0.827451, 0, 1,
-1.09793, -0.8198143, 0.7557911, 1, 0.8352941, 0, 1,
-1.075409, -0.02092313, -1.223966, 1, 0.8392157, 0, 1,
-1.067376, -0.2084331, -0.5228097, 1, 0.8470588, 0, 1,
-1.065837, 0.3684111, -1.841377, 1, 0.8509804, 0, 1,
-1.060665, -1.415393, -3.655679, 1, 0.8588235, 0, 1,
-1.05789, 0.01786709, -0.8708538, 1, 0.8627451, 0, 1,
-1.056947, -0.8046524, -1.884057, 1, 0.8705882, 0, 1,
-1.043899, 0.5916404, -0.5017525, 1, 0.8745098, 0, 1,
-1.03236, -1.748964, -1.735103, 1, 0.8823529, 0, 1,
-1.031667, 1.185363, -1.364017, 1, 0.8862745, 0, 1,
-1.028783, 1.048091, -2.008074, 1, 0.8941177, 0, 1,
-1.02714, -0.2432113, -0.07869841, 1, 0.8980392, 0, 1,
-1.021932, -0.3197915, -2.742467, 1, 0.9058824, 0, 1,
-1.009486, -0.3430307, -1.69642, 1, 0.9137255, 0, 1,
-0.9978119, 0.3983802, -1.332909, 1, 0.9176471, 0, 1,
-0.9879973, 0.01073357, -2.946184, 1, 0.9254902, 0, 1,
-0.987645, 1.292346, -0.4078837, 1, 0.9294118, 0, 1,
-0.9874225, 1.403148, 1.570893, 1, 0.9372549, 0, 1,
-0.9873276, 0.3215845, -1.482173, 1, 0.9411765, 0, 1,
-0.977893, -0.1997575, -1.406652, 1, 0.9490196, 0, 1,
-0.9773649, -2.000316, -2.319667, 1, 0.9529412, 0, 1,
-0.9770536, 1.419379, -1.744427, 1, 0.9607843, 0, 1,
-0.9713005, -1.794637, -2.004361, 1, 0.9647059, 0, 1,
-0.9671828, -0.7250256, -3.54161, 1, 0.972549, 0, 1,
-0.9642729, -0.2315723, -2.697404, 1, 0.9764706, 0, 1,
-0.9619579, 0.2933406, -2.873615, 1, 0.9843137, 0, 1,
-0.9595316, 0.5425503, 0.5387157, 1, 0.9882353, 0, 1,
-0.9548979, -0.5466346, -1.139577, 1, 0.9960784, 0, 1,
-0.9539582, 2.595711, 1.159524, 0.9960784, 1, 0, 1,
-0.9518077, 0.9471755, 0.07253321, 0.9921569, 1, 0, 1,
-0.951158, 1.211511, -1.085593, 0.9843137, 1, 0, 1,
-0.9507329, 1.448003, -0.8065808, 0.9803922, 1, 0, 1,
-0.9473853, 0.4131078, -1.500911, 0.972549, 1, 0, 1,
-0.9438544, 0.2753602, 0.5258588, 0.9686275, 1, 0, 1,
-0.9435467, -0.6071045, -2.811553, 0.9607843, 1, 0, 1,
-0.9405789, 0.387729, -2.647846, 0.9568627, 1, 0, 1,
-0.9303942, 0.2034434, -2.304214, 0.9490196, 1, 0, 1,
-0.93003, 0.899874, -1.088612, 0.945098, 1, 0, 1,
-0.9169983, 1.242725, -0.7184465, 0.9372549, 1, 0, 1,
-0.9165913, -1.490857, -3.138114, 0.9333333, 1, 0, 1,
-0.91606, 0.1894478, -0.1427165, 0.9254902, 1, 0, 1,
-0.9092119, 1.399185, -1.604378, 0.9215686, 1, 0, 1,
-0.9014596, 0.9446163, -1.613396, 0.9137255, 1, 0, 1,
-0.8996533, -1.259317, 0.2501347, 0.9098039, 1, 0, 1,
-0.8959258, 0.66269, -0.9900568, 0.9019608, 1, 0, 1,
-0.8920643, -0.134986, -2.901271, 0.8941177, 1, 0, 1,
-0.8908578, -0.4244193, -1.844677, 0.8901961, 1, 0, 1,
-0.8772488, 0.8213667, -0.05489289, 0.8823529, 1, 0, 1,
-0.8764943, -0.3675763, -1.796705, 0.8784314, 1, 0, 1,
-0.8752749, -0.4406011, -1.819802, 0.8705882, 1, 0, 1,
-0.8649241, 0.2227368, -1.306867, 0.8666667, 1, 0, 1,
-0.8642973, -0.3133017, -1.807229, 0.8588235, 1, 0, 1,
-0.8622738, -1.133913, -0.5689017, 0.854902, 1, 0, 1,
-0.8564119, -0.5517799, -2.061671, 0.8470588, 1, 0, 1,
-0.856039, 1.100044, -1.926861, 0.8431373, 1, 0, 1,
-0.8489633, 1.34094, -1.20948, 0.8352941, 1, 0, 1,
-0.8449336, 0.7505355, 0.1536534, 0.8313726, 1, 0, 1,
-0.8415058, 0.04661519, -2.327529, 0.8235294, 1, 0, 1,
-0.8383379, 1.079784, -1.542657, 0.8196079, 1, 0, 1,
-0.8359284, -0.2840234, -1.492565, 0.8117647, 1, 0, 1,
-0.835018, -1.426042, -1.705534, 0.8078431, 1, 0, 1,
-0.8348848, -1.034311, -2.828305, 0.8, 1, 0, 1,
-0.8279371, -0.5215793, -1.747326, 0.7921569, 1, 0, 1,
-0.8225542, 2.166715, 0.4531428, 0.7882353, 1, 0, 1,
-0.8195571, 0.09507019, -1.12818, 0.7803922, 1, 0, 1,
-0.8193775, 0.2441761, 0.6549115, 0.7764706, 1, 0, 1,
-0.8168436, 0.7285771, -1.762321, 0.7686275, 1, 0, 1,
-0.8158032, -1.516016, -2.540382, 0.7647059, 1, 0, 1,
-0.8131645, 1.361386, -1.006206, 0.7568628, 1, 0, 1,
-0.8101326, -0.2191103, -1.337607, 0.7529412, 1, 0, 1,
-0.8100177, 0.6068618, -1.326079, 0.7450981, 1, 0, 1,
-0.8039742, 0.2280593, -2.341337, 0.7411765, 1, 0, 1,
-0.8018896, -0.2813688, -4.932912, 0.7333333, 1, 0, 1,
-0.7989783, -0.4569198, -1.819252, 0.7294118, 1, 0, 1,
-0.7936913, 1.322435, 0.3002642, 0.7215686, 1, 0, 1,
-0.7904458, -0.1003301, -3.486625, 0.7176471, 1, 0, 1,
-0.7896287, -1.243545, -3.695917, 0.7098039, 1, 0, 1,
-0.7879143, 1.166615, -0.629227, 0.7058824, 1, 0, 1,
-0.7877417, -0.730927, -3.484868, 0.6980392, 1, 0, 1,
-0.7830694, -0.3956416, -1.427203, 0.6901961, 1, 0, 1,
-0.7827881, -0.5490898, -2.682978, 0.6862745, 1, 0, 1,
-0.7790666, 1.553033, -1.655314, 0.6784314, 1, 0, 1,
-0.7766096, 0.3441631, -1.264147, 0.6745098, 1, 0, 1,
-0.7755885, -1.206272, -1.919235, 0.6666667, 1, 0, 1,
-0.7717826, 4.161696, 0.1387687, 0.6627451, 1, 0, 1,
-0.7659179, 0.3750692, -2.749269, 0.654902, 1, 0, 1,
-0.7616384, 1.229638, 0.1208638, 0.6509804, 1, 0, 1,
-0.7568334, -0.08063856, -3.841487, 0.6431373, 1, 0, 1,
-0.7511435, 0.7538735, -1.296511, 0.6392157, 1, 0, 1,
-0.7463844, -0.5327233, -2.34174, 0.6313726, 1, 0, 1,
-0.7456864, -2.210827, -1.360388, 0.627451, 1, 0, 1,
-0.738047, -0.5981538, -2.026953, 0.6196079, 1, 0, 1,
-0.737078, -0.8457916, 0.2899434, 0.6156863, 1, 0, 1,
-0.7320494, -0.3014558, -3.427777, 0.6078432, 1, 0, 1,
-0.7316442, -2.121094, -4.452332, 0.6039216, 1, 0, 1,
-0.7307726, -1.104923, -2.440917, 0.5960785, 1, 0, 1,
-0.7269028, -0.2587636, -0.4310575, 0.5882353, 1, 0, 1,
-0.7210733, -0.907189, -3.322359, 0.5843138, 1, 0, 1,
-0.7184255, 1.43395, -1.273817, 0.5764706, 1, 0, 1,
-0.7171038, 1.716947, 0.7414464, 0.572549, 1, 0, 1,
-0.7115259, 0.5291378, -0.1963003, 0.5647059, 1, 0, 1,
-0.7076078, 2.73865, -0.6352915, 0.5607843, 1, 0, 1,
-0.7065175, 0.465327, -2.224773, 0.5529412, 1, 0, 1,
-0.7028474, 0.06761691, -2.375412, 0.5490196, 1, 0, 1,
-0.7027148, 0.1694696, -2.633842, 0.5411765, 1, 0, 1,
-0.7017561, 0.8001046, -0.4330151, 0.5372549, 1, 0, 1,
-0.6936775, 0.2143226, -0.7375877, 0.5294118, 1, 0, 1,
-0.6925199, 1.330679, -1.724971, 0.5254902, 1, 0, 1,
-0.6846626, 0.1785838, -1.438108, 0.5176471, 1, 0, 1,
-0.679626, 0.1113414, -2.061111, 0.5137255, 1, 0, 1,
-0.6752975, -0.4370314, -2.292434, 0.5058824, 1, 0, 1,
-0.6702117, -0.4635785, -2.713936, 0.5019608, 1, 0, 1,
-0.6687745, 1.135389, -1.668304, 0.4941176, 1, 0, 1,
-0.6659114, -1.096937, -1.316627, 0.4862745, 1, 0, 1,
-0.6636174, -0.6974041, -1.810367, 0.4823529, 1, 0, 1,
-0.6629681, -0.3382688, -2.039451, 0.4745098, 1, 0, 1,
-0.6527623, 0.4304186, -1.079884, 0.4705882, 1, 0, 1,
-0.6467766, -2.558989, -3.337845, 0.4627451, 1, 0, 1,
-0.6456846, 0.7444293, -0.6873954, 0.4588235, 1, 0, 1,
-0.6405121, -0.5686144, -3.320804, 0.4509804, 1, 0, 1,
-0.6388101, 0.5882021, -1.447568, 0.4470588, 1, 0, 1,
-0.6358854, -1.457112, -1.063518, 0.4392157, 1, 0, 1,
-0.6348226, -0.3240946, -1.088017, 0.4352941, 1, 0, 1,
-0.6283938, 0.635064, 1.003286, 0.427451, 1, 0, 1,
-0.6279001, 0.192144, -0.3539617, 0.4235294, 1, 0, 1,
-0.626484, 0.9644703, -1.041657, 0.4156863, 1, 0, 1,
-0.6239591, 1.101206, 0.1277338, 0.4117647, 1, 0, 1,
-0.6229218, 1.386206, -1.099188, 0.4039216, 1, 0, 1,
-0.6205456, 1.898987, 0.1069286, 0.3960784, 1, 0, 1,
-0.6200478, 0.1408332, -0.2975535, 0.3921569, 1, 0, 1,
-0.6169683, -1.199337, -2.354879, 0.3843137, 1, 0, 1,
-0.6169204, -0.3209953, -1.170618, 0.3803922, 1, 0, 1,
-0.6096886, -0.5512651, -2.193453, 0.372549, 1, 0, 1,
-0.6081851, -1.924459, -1.562218, 0.3686275, 1, 0, 1,
-0.6012195, 0.7388731, -2.338786, 0.3607843, 1, 0, 1,
-0.5988067, -0.5530164, -1.203594, 0.3568628, 1, 0, 1,
-0.5972415, -1.316943, -4.027334, 0.3490196, 1, 0, 1,
-0.593972, -1.256215, -1.399367, 0.345098, 1, 0, 1,
-0.5866911, -0.8405256, 0.2178481, 0.3372549, 1, 0, 1,
-0.5848046, -1.035973, -2.457994, 0.3333333, 1, 0, 1,
-0.5841424, -0.2603521, -1.368555, 0.3254902, 1, 0, 1,
-0.5838373, 0.027149, -0.3574364, 0.3215686, 1, 0, 1,
-0.5827851, 0.07389227, -2.024839, 0.3137255, 1, 0, 1,
-0.5807657, 0.5156938, -0.5418875, 0.3098039, 1, 0, 1,
-0.580757, -0.7133147, -3.084213, 0.3019608, 1, 0, 1,
-0.5794643, -0.2263482, -2.594383, 0.2941177, 1, 0, 1,
-0.5738982, -0.2864325, -1.445059, 0.2901961, 1, 0, 1,
-0.5624658, -0.2805155, -2.61314, 0.282353, 1, 0, 1,
-0.5588348, 0.817067, 1.42618, 0.2784314, 1, 0, 1,
-0.5559979, 0.2398557, -0.4267973, 0.2705882, 1, 0, 1,
-0.5530237, -1.001817, -4.05552, 0.2666667, 1, 0, 1,
-0.552689, -0.06587751, -3.010903, 0.2588235, 1, 0, 1,
-0.552343, -2.540964, -3.446065, 0.254902, 1, 0, 1,
-0.5502235, 1.378989, -0.4162448, 0.2470588, 1, 0, 1,
-0.5499172, -0.09525961, -2.573992, 0.2431373, 1, 0, 1,
-0.5479616, -1.589123, -2.861882, 0.2352941, 1, 0, 1,
-0.5465395, 0.3144116, -0.9993293, 0.2313726, 1, 0, 1,
-0.5431682, -0.08583913, -0.102957, 0.2235294, 1, 0, 1,
-0.5399392, -0.6491696, -2.40013, 0.2196078, 1, 0, 1,
-0.5364462, -0.3997538, -1.913983, 0.2117647, 1, 0, 1,
-0.5261055, -1.549899, -2.671244, 0.2078431, 1, 0, 1,
-0.5247642, -1.489605, -0.9932873, 0.2, 1, 0, 1,
-0.5236124, -0.1621714, -2.160074, 0.1921569, 1, 0, 1,
-0.5195943, 1.253126, 0.9690909, 0.1882353, 1, 0, 1,
-0.5181717, -0.5605322, -3.187045, 0.1803922, 1, 0, 1,
-0.5156056, 1.295397, 0.05278642, 0.1764706, 1, 0, 1,
-0.511628, 1.068462, -1.047101, 0.1686275, 1, 0, 1,
-0.5079954, -1.482783, -3.26505, 0.1647059, 1, 0, 1,
-0.5059434, -0.5298468, -2.311016, 0.1568628, 1, 0, 1,
-0.5057576, -0.7443277, -1.762624, 0.1529412, 1, 0, 1,
-0.503879, -1.892043, -3.762307, 0.145098, 1, 0, 1,
-0.5036252, 0.9328104, -0.6807249, 0.1411765, 1, 0, 1,
-0.4993426, 0.4039398, -0.1466059, 0.1333333, 1, 0, 1,
-0.4978869, 0.561946, -1.446271, 0.1294118, 1, 0, 1,
-0.4940402, -0.6131485, -3.72982, 0.1215686, 1, 0, 1,
-0.4934074, 1.956368, 0.9113268, 0.1176471, 1, 0, 1,
-0.4877433, 2.136701, -1.221941, 0.1098039, 1, 0, 1,
-0.4830794, 1.808126, -0.137513, 0.1058824, 1, 0, 1,
-0.4813808, 0.05181084, -1.168801, 0.09803922, 1, 0, 1,
-0.4742518, 1.05897, 1.116688, 0.09019608, 1, 0, 1,
-0.4718609, 0.2165931, -0.2896708, 0.08627451, 1, 0, 1,
-0.4708861, -0.8780579, -3.545474, 0.07843138, 1, 0, 1,
-0.470377, 1.787537, 0.3113225, 0.07450981, 1, 0, 1,
-0.4675146, -0.9366152, -4.323622, 0.06666667, 1, 0, 1,
-0.4672851, -1.432312, -2.288023, 0.0627451, 1, 0, 1,
-0.4651261, -1.614076, -2.006726, 0.05490196, 1, 0, 1,
-0.4649232, -0.2703052, -1.223038, 0.05098039, 1, 0, 1,
-0.460407, 0.1930621, -2.258793, 0.04313726, 1, 0, 1,
-0.4488894, -0.5389481, -1.657284, 0.03921569, 1, 0, 1,
-0.4458856, 0.4754615, -1.771008, 0.03137255, 1, 0, 1,
-0.4456812, 0.4336112, 0.2358082, 0.02745098, 1, 0, 1,
-0.4430434, -1.952568, -2.764872, 0.01960784, 1, 0, 1,
-0.441433, -2.163147, -1.71986, 0.01568628, 1, 0, 1,
-0.44076, 1.11568, -0.3811941, 0.007843138, 1, 0, 1,
-0.4391757, -0.06329509, -0.8985413, 0.003921569, 1, 0, 1,
-0.4371716, 1.137533, -0.8777011, 0, 1, 0.003921569, 1,
-0.4309622, -1.774206, -2.280564, 0, 1, 0.01176471, 1,
-0.4308938, -0.1288972, -2.009268, 0, 1, 0.01568628, 1,
-0.4308196, 0.9567471, -0.03740251, 0, 1, 0.02352941, 1,
-0.4277981, -0.04790298, -0.9899632, 0, 1, 0.02745098, 1,
-0.4206959, 0.4813198, 0.3514161, 0, 1, 0.03529412, 1,
-0.4199221, -0.6090404, -2.374499, 0, 1, 0.03921569, 1,
-0.4120825, 0.06307153, 0.4419751, 0, 1, 0.04705882, 1,
-0.411627, 0.6836649, -2.177188, 0, 1, 0.05098039, 1,
-0.404568, 0.3675709, 0.5430374, 0, 1, 0.05882353, 1,
-0.4027894, -0.5128698, -3.021667, 0, 1, 0.0627451, 1,
-0.3987386, 0.7513277, -1.132967, 0, 1, 0.07058824, 1,
-0.398593, -1.806138, -2.281687, 0, 1, 0.07450981, 1,
-0.3909402, -1.130281, -2.712189, 0, 1, 0.08235294, 1,
-0.3906832, -1.392102, -2.990332, 0, 1, 0.08627451, 1,
-0.3846208, -0.2211984, -2.320068, 0, 1, 0.09411765, 1,
-0.383478, -1.200576, -2.789503, 0, 1, 0.1019608, 1,
-0.3811815, 0.8105136, -3.195506, 0, 1, 0.1058824, 1,
-0.3810431, 1.085437, -1.437443, 0, 1, 0.1137255, 1,
-0.3808769, 1.05768, -1.6458, 0, 1, 0.1176471, 1,
-0.380255, 0.1942115, -0.7869895, 0, 1, 0.1254902, 1,
-0.3789931, 1.523337, 2.163451, 0, 1, 0.1294118, 1,
-0.377259, 0.08139349, -2.046482, 0, 1, 0.1372549, 1,
-0.3747591, 0.4329687, -1.855816, 0, 1, 0.1411765, 1,
-0.3722408, -0.7029808, -3.816721, 0, 1, 0.1490196, 1,
-0.371511, 0.2787244, -1.127026, 0, 1, 0.1529412, 1,
-0.3688816, 0.1292796, -1.969849, 0, 1, 0.1607843, 1,
-0.3666815, 0.9834093, 0.3775521, 0, 1, 0.1647059, 1,
-0.3656786, 0.2305854, -2.40578, 0, 1, 0.172549, 1,
-0.3636676, 0.3898226, 0.2722296, 0, 1, 0.1764706, 1,
-0.3632972, -1.058172, -3.799909, 0, 1, 0.1843137, 1,
-0.3589083, 0.6253222, -0.4951183, 0, 1, 0.1882353, 1,
-0.3561605, 0.1373774, -1.5275, 0, 1, 0.1960784, 1,
-0.3443853, -1.196404, -0.8909339, 0, 1, 0.2039216, 1,
-0.3377665, 0.03586868, -1.993167, 0, 1, 0.2078431, 1,
-0.3362904, -1.490905, -1.086517, 0, 1, 0.2156863, 1,
-0.3355148, 1.670366, -1.072223, 0, 1, 0.2196078, 1,
-0.3339334, -1.406071, -1.110144, 0, 1, 0.227451, 1,
-0.3315029, 0.1467005, -1.63777, 0, 1, 0.2313726, 1,
-0.3285353, 0.5818412, -1.073775, 0, 1, 0.2392157, 1,
-0.3268775, 1.171928, -0.6049539, 0, 1, 0.2431373, 1,
-0.3244896, 0.1856329, -0.2757008, 0, 1, 0.2509804, 1,
-0.322337, 0.2475053, -0.7814512, 0, 1, 0.254902, 1,
-0.3213788, -0.293298, -2.697474, 0, 1, 0.2627451, 1,
-0.3192535, -1.375349, -2.508911, 0, 1, 0.2666667, 1,
-0.3172752, -0.6519935, -5.047664, 0, 1, 0.2745098, 1,
-0.3156717, -0.3725377, -3.573854, 0, 1, 0.2784314, 1,
-0.3125995, -0.7927371, -4.804629, 0, 1, 0.2862745, 1,
-0.3071179, -1.036548, -2.597344, 0, 1, 0.2901961, 1,
-0.3059701, -0.1845876, -2.244795, 0, 1, 0.2980392, 1,
-0.305769, -0.3553447, -3.428252, 0, 1, 0.3058824, 1,
-0.3051288, 0.1153362, -1.538513, 0, 1, 0.3098039, 1,
-0.3028008, -0.5979745, -3.058973, 0, 1, 0.3176471, 1,
-0.2949935, 1.71716, 0.6419106, 0, 1, 0.3215686, 1,
-0.2829869, -0.2696033, -2.334125, 0, 1, 0.3294118, 1,
-0.2768577, 1.854936, 0.1831205, 0, 1, 0.3333333, 1,
-0.2702591, -1.04269, -2.908141, 0, 1, 0.3411765, 1,
-0.2698287, -0.304726, -3.667645, 0, 1, 0.345098, 1,
-0.2673497, -0.7644296, -4.264966, 0, 1, 0.3529412, 1,
-0.2666462, -0.002216978, -0.8114058, 0, 1, 0.3568628, 1,
-0.266555, 1.828272, 0.2149589, 0, 1, 0.3647059, 1,
-0.2637742, 0.1779113, -1.495609, 0, 1, 0.3686275, 1,
-0.2626148, -0.4483068, -2.960583, 0, 1, 0.3764706, 1,
-0.2620736, -0.6244903, -3.000244, 0, 1, 0.3803922, 1,
-0.2596592, -0.7108377, -1.392894, 0, 1, 0.3882353, 1,
-0.2564756, -0.7449847, -3.033864, 0, 1, 0.3921569, 1,
-0.2526802, -0.2785967, -1.444371, 0, 1, 0.4, 1,
-0.2508309, -0.5844977, -2.776515, 0, 1, 0.4078431, 1,
-0.2486518, -0.07436074, -0.9851052, 0, 1, 0.4117647, 1,
-0.2480921, -0.09145898, -2.47541, 0, 1, 0.4196078, 1,
-0.2442386, 0.07870081, -0.758298, 0, 1, 0.4235294, 1,
-0.2358168, -0.8141682, -0.3502033, 0, 1, 0.4313726, 1,
-0.2323796, 0.5584569, -1.948794, 0, 1, 0.4352941, 1,
-0.2315321, 0.6587303, 1.109635, 0, 1, 0.4431373, 1,
-0.231072, 0.5957504, -2.572567, 0, 1, 0.4470588, 1,
-0.2301725, 0.298314, -1.216304, 0, 1, 0.454902, 1,
-0.2289138, 1.381273, -0.7031901, 0, 1, 0.4588235, 1,
-0.2254127, -0.1128718, -3.108778, 0, 1, 0.4666667, 1,
-0.2248269, -1.238729, -2.975568, 0, 1, 0.4705882, 1,
-0.2235786, -0.4068336, -3.81777, 0, 1, 0.4784314, 1,
-0.2235221, 2.73344, -0.6460256, 0, 1, 0.4823529, 1,
-0.220221, -1.534153, -3.880548, 0, 1, 0.4901961, 1,
-0.2195166, 1.404976, 0.608859, 0, 1, 0.4941176, 1,
-0.2181135, 0.3478842, -0.9986176, 0, 1, 0.5019608, 1,
-0.2165474, -0.1358616, -3.177681, 0, 1, 0.509804, 1,
-0.2093567, -1.861504, -1.881435, 0, 1, 0.5137255, 1,
-0.2080169, 0.3917235, 0.3428556, 0, 1, 0.5215687, 1,
-0.2063611, -1.474069, -3.144557, 0, 1, 0.5254902, 1,
-0.204634, 2.375509, 0.4053738, 0, 1, 0.5333334, 1,
-0.2045609, -0.4666642, -2.955298, 0, 1, 0.5372549, 1,
-0.2036165, 0.3295042, -0.3413979, 0, 1, 0.5450981, 1,
-0.2023691, -0.8518988, 0.5427068, 0, 1, 0.5490196, 1,
-0.2016302, -0.6727415, -2.755962, 0, 1, 0.5568628, 1,
-0.1958156, 0.914014, -0.3346618, 0, 1, 0.5607843, 1,
-0.1957289, -1.695423, -2.05241, 0, 1, 0.5686275, 1,
-0.1955271, 1.657661, -1.246965, 0, 1, 0.572549, 1,
-0.1942106, 0.3187844, -0.1974481, 0, 1, 0.5803922, 1,
-0.1916001, -0.7408711, -3.893287, 0, 1, 0.5843138, 1,
-0.189553, 1.202071, -1.686671, 0, 1, 0.5921569, 1,
-0.1833847, -0.8844201, -2.04335, 0, 1, 0.5960785, 1,
-0.1779368, -0.08710457, -2.749487, 0, 1, 0.6039216, 1,
-0.1775138, 1.389878, -1.321118, 0, 1, 0.6117647, 1,
-0.1759482, -1.543198, -3.997396, 0, 1, 0.6156863, 1,
-0.1752617, 0.3286593, -1.2151, 0, 1, 0.6235294, 1,
-0.1725353, 1.079249, -0.8412386, 0, 1, 0.627451, 1,
-0.1610425, -2.040629, -1.184611, 0, 1, 0.6352941, 1,
-0.1592898, -1.174216, -3.784786, 0, 1, 0.6392157, 1,
-0.1582249, 0.1354158, -2.563758, 0, 1, 0.6470588, 1,
-0.1581302, -0.04249931, -1.570666, 0, 1, 0.6509804, 1,
-0.1577708, 1.47853, 1.566478, 0, 1, 0.6588235, 1,
-0.1575256, 0.04923607, 0.09842072, 0, 1, 0.6627451, 1,
-0.1562804, -2.033098, -0.5736106, 0, 1, 0.6705883, 1,
-0.155743, -0.1584204, -0.3517684, 0, 1, 0.6745098, 1,
-0.1538223, 0.7997553, 0.1351148, 0, 1, 0.682353, 1,
-0.152877, 0.4987564, 0.1645354, 0, 1, 0.6862745, 1,
-0.1520207, 2.165076, -1.800957, 0, 1, 0.6941177, 1,
-0.1518746, 1.288182, 0.5986231, 0, 1, 0.7019608, 1,
-0.1502835, 1.267519, -0.7409142, 0, 1, 0.7058824, 1,
-0.1383072, -0.6727629, -2.577134, 0, 1, 0.7137255, 1,
-0.1374124, -1.237511, -2.621903, 0, 1, 0.7176471, 1,
-0.1373288, -1.116374, -2.853078, 0, 1, 0.7254902, 1,
-0.1371047, 0.5762165, 0.5394, 0, 1, 0.7294118, 1,
-0.1369769, -0.4900844, -3.220401, 0, 1, 0.7372549, 1,
-0.1333513, 0.5746164, -2.084478, 0, 1, 0.7411765, 1,
-0.1315023, -0.5843346, -2.125564, 0, 1, 0.7490196, 1,
-0.1302381, -0.3760359, -2.771228, 0, 1, 0.7529412, 1,
-0.1300557, 1.41969, 0.2835164, 0, 1, 0.7607843, 1,
-0.1293482, 0.5918964, -0.1046925, 0, 1, 0.7647059, 1,
-0.12705, 0.6898916, -0.7526157, 0, 1, 0.772549, 1,
-0.1170557, 0.831532, -0.7561159, 0, 1, 0.7764706, 1,
-0.1160964, -1.885538, -3.277161, 0, 1, 0.7843137, 1,
-0.1145131, -0.6794791, -3.521513, 0, 1, 0.7882353, 1,
-0.1061425, -0.3412974, -2.818776, 0, 1, 0.7960784, 1,
-0.1052207, 0.6752806, 0.02755594, 0, 1, 0.8039216, 1,
-0.1037591, 1.205741, 0.9275203, 0, 1, 0.8078431, 1,
-0.09262647, 1.369607, -0.991587, 0, 1, 0.8156863, 1,
-0.09042316, 0.1144138, -0.8210918, 0, 1, 0.8196079, 1,
-0.08538363, -1.542669, -3.175445, 0, 1, 0.827451, 1,
-0.0816539, 0.06983966, 1.1604, 0, 1, 0.8313726, 1,
-0.08060436, 0.9310223, -0.3341404, 0, 1, 0.8392157, 1,
-0.08013079, 0.1675381, -1.055455, 0, 1, 0.8431373, 1,
-0.07943941, 0.291622, -0.07907504, 0, 1, 0.8509804, 1,
-0.07785634, -0.672371, -2.448673, 0, 1, 0.854902, 1,
-0.0744148, -0.9062032, -2.645085, 0, 1, 0.8627451, 1,
-0.07287911, 0.07013412, -2.328938, 0, 1, 0.8666667, 1,
-0.07183423, -0.2989538, -2.342135, 0, 1, 0.8745098, 1,
-0.06282269, 0.1554054, -1.464166, 0, 1, 0.8784314, 1,
-0.06262863, 0.9487091, -0.350207, 0, 1, 0.8862745, 1,
-0.06003493, -1.063223, -3.117441, 0, 1, 0.8901961, 1,
-0.05106791, -1.122083, -2.751085, 0, 1, 0.8980392, 1,
-0.05014274, 2.013422, -1.519112, 0, 1, 0.9058824, 1,
-0.05003982, -1.219511, -1.37288, 0, 1, 0.9098039, 1,
-0.04188373, -1.305809, -2.557207, 0, 1, 0.9176471, 1,
-0.03913097, 0.1509712, 0.1268478, 0, 1, 0.9215686, 1,
-0.03847104, 1.055906, 0.8585293, 0, 1, 0.9294118, 1,
-0.03553926, 0.03456989, 0.08626182, 0, 1, 0.9333333, 1,
-0.0295813, -0.0912274, -2.770934, 0, 1, 0.9411765, 1,
-0.02870061, -0.8815201, -2.411193, 0, 1, 0.945098, 1,
-0.0272081, -0.8282813, -1.986876, 0, 1, 0.9529412, 1,
-0.02688561, -0.05535862, -3.05484, 0, 1, 0.9568627, 1,
-0.02679585, -0.1480585, -1.548303, 0, 1, 0.9647059, 1,
-0.02615842, -1.37107, -2.784822, 0, 1, 0.9686275, 1,
-0.02518514, -1.730268, -2.836137, 0, 1, 0.9764706, 1,
-0.02003648, 1.056796, 0.3521502, 0, 1, 0.9803922, 1,
-0.0147911, 0.164551, -1.297922, 0, 1, 0.9882353, 1,
-0.00648639, -0.5030013, -1.782977, 0, 1, 0.9921569, 1,
0.001307291, -0.09637461, 1.717635, 0, 1, 1, 1,
0.00131968, -0.1372245, 5.022261, 0, 0.9921569, 1, 1,
0.002334161, -0.8627865, 2.514401, 0, 0.9882353, 1, 1,
0.005796602, -1.039109, 2.068531, 0, 0.9803922, 1, 1,
0.01353917, -1.287717, 3.384096, 0, 0.9764706, 1, 1,
0.01402734, -1.160745, 2.462537, 0, 0.9686275, 1, 1,
0.01526177, -0.4936683, 4.88251, 0, 0.9647059, 1, 1,
0.01535752, 0.2118162, -1.749354, 0, 0.9568627, 1, 1,
0.01790508, -0.6776667, 2.250052, 0, 0.9529412, 1, 1,
0.02274913, 1.009166, -0.3182184, 0, 0.945098, 1, 1,
0.02405257, -0.7045728, 4.963654, 0, 0.9411765, 1, 1,
0.02694961, 0.7145947, 0.2349007, 0, 0.9333333, 1, 1,
0.02869094, -0.8922709, 4.061616, 0, 0.9294118, 1, 1,
0.03234308, 0.3108627, 1.150225, 0, 0.9215686, 1, 1,
0.03257163, 2.512882, 0.05303985, 0, 0.9176471, 1, 1,
0.03411074, 2.293145, -1.226557, 0, 0.9098039, 1, 1,
0.0367871, 0.8937768, 0.7258322, 0, 0.9058824, 1, 1,
0.04068865, 0.6014453, -2.013082, 0, 0.8980392, 1, 1,
0.04206688, -0.6836391, 2.460118, 0, 0.8901961, 1, 1,
0.04450633, -0.832552, 3.435908, 0, 0.8862745, 1, 1,
0.04891733, 1.919586, 1.515634, 0, 0.8784314, 1, 1,
0.05038661, -1.837701, 2.335918, 0, 0.8745098, 1, 1,
0.05077221, 1.020591, -1.212996, 0, 0.8666667, 1, 1,
0.0548802, -1.931807, 2.113236, 0, 0.8627451, 1, 1,
0.05505011, -0.8761714, 3.950584, 0, 0.854902, 1, 1,
0.05597191, 0.892607, 0.6377875, 0, 0.8509804, 1, 1,
0.05804426, 1.066365, -0.4352885, 0, 0.8431373, 1, 1,
0.0610521, 0.007306837, 0.6905617, 0, 0.8392157, 1, 1,
0.06133153, 0.11873, 0.3852932, 0, 0.8313726, 1, 1,
0.06147683, -0.9722747, 3.714021, 0, 0.827451, 1, 1,
0.0615512, -1.898367, 0.9215795, 0, 0.8196079, 1, 1,
0.06171711, -0.3680816, 4.083737, 0, 0.8156863, 1, 1,
0.06185905, 1.017674, -0.5500156, 0, 0.8078431, 1, 1,
0.06322566, -0.1372182, 3.373749, 0, 0.8039216, 1, 1,
0.06508101, 0.3177108, 2.718664, 0, 0.7960784, 1, 1,
0.06529497, 1.557123, -0.3767484, 0, 0.7882353, 1, 1,
0.06582804, 0.1262185, 0.9827639, 0, 0.7843137, 1, 1,
0.06608109, 0.7514891, 0.4123154, 0, 0.7764706, 1, 1,
0.07099058, 1.108677, 1.645962, 0, 0.772549, 1, 1,
0.07286959, 0.8033311, 1.728726, 0, 0.7647059, 1, 1,
0.07430803, -0.8836088, 4.137395, 0, 0.7607843, 1, 1,
0.07996997, -0.2749658, 2.824151, 0, 0.7529412, 1, 1,
0.08096652, 1.22309, -0.7496631, 0, 0.7490196, 1, 1,
0.0837917, -0.1947093, 4.166119, 0, 0.7411765, 1, 1,
0.08485565, -0.7033317, 1.86405, 0, 0.7372549, 1, 1,
0.08934933, -0.1686063, 2.205406, 0, 0.7294118, 1, 1,
0.09069443, -1.584449, 3.243361, 0, 0.7254902, 1, 1,
0.09077789, -0.715767, 2.786901, 0, 0.7176471, 1, 1,
0.0917779, 0.146827, -0.476966, 0, 0.7137255, 1, 1,
0.09321291, -1.467434, 3.423987, 0, 0.7058824, 1, 1,
0.09510258, -0.6460751, 3.296504, 0, 0.6980392, 1, 1,
0.09675357, 1.654635, -0.2012249, 0, 0.6941177, 1, 1,
0.09686519, 0.5934436, 0.8318728, 0, 0.6862745, 1, 1,
0.09856746, 0.3096693, 0.7492787, 0, 0.682353, 1, 1,
0.09943065, -1.068402, 3.539946, 0, 0.6745098, 1, 1,
0.1002392, -0.3308625, 2.343827, 0, 0.6705883, 1, 1,
0.1012922, 0.8420901, -1.201021, 0, 0.6627451, 1, 1,
0.1019096, -0.582544, 4.077123, 0, 0.6588235, 1, 1,
0.1029101, 1.035949, 0.7496521, 0, 0.6509804, 1, 1,
0.1062412, -0.670684, 2.195753, 0, 0.6470588, 1, 1,
0.1100376, 1.270266, -1.11826, 0, 0.6392157, 1, 1,
0.110749, -0.282739, 3.513843, 0, 0.6352941, 1, 1,
0.1110713, -0.5672167, 1.868647, 0, 0.627451, 1, 1,
0.1137398, 1.190596, -1.134002, 0, 0.6235294, 1, 1,
0.1149218, -0.8216229, 2.321931, 0, 0.6156863, 1, 1,
0.1157644, -0.3650194, 0.3604774, 0, 0.6117647, 1, 1,
0.1166527, -2.110786, 4.065463, 0, 0.6039216, 1, 1,
0.1190953, -0.1154524, 2.38538, 0, 0.5960785, 1, 1,
0.1194775, 1.260097, 1.903423, 0, 0.5921569, 1, 1,
0.123131, 0.7513879, 0.7094234, 0, 0.5843138, 1, 1,
0.1248907, -0.5897959, 0.1286315, 0, 0.5803922, 1, 1,
0.1266294, -0.04437496, 2.229615, 0, 0.572549, 1, 1,
0.1305173, -0.2008388, 3.729199, 0, 0.5686275, 1, 1,
0.1340243, -1.066187, 2.832875, 0, 0.5607843, 1, 1,
0.1353592, -1.026935, 2.944285, 0, 0.5568628, 1, 1,
0.1488079, 0.6191806, 1.920752, 0, 0.5490196, 1, 1,
0.1518982, -0.5903078, 4.152776, 0, 0.5450981, 1, 1,
0.1565967, 1.157297, -1.433731, 0, 0.5372549, 1, 1,
0.1581108, -3.042637, 1.82639, 0, 0.5333334, 1, 1,
0.1689886, 0.1841898, 0.9406061, 0, 0.5254902, 1, 1,
0.1698927, -0.2732145, 2.924276, 0, 0.5215687, 1, 1,
0.1734496, -0.7479408, 2.389496, 0, 0.5137255, 1, 1,
0.1756589, 0.3848198, -0.07360653, 0, 0.509804, 1, 1,
0.1767314, 0.5925339, 1.005169, 0, 0.5019608, 1, 1,
0.1796462, 1.376454, 0.8551909, 0, 0.4941176, 1, 1,
0.1804983, 0.8243528, 0.6274698, 0, 0.4901961, 1, 1,
0.181958, 0.0008780026, 0.2569211, 0, 0.4823529, 1, 1,
0.1893308, -0.04805892, 1.482603, 0, 0.4784314, 1, 1,
0.1923481, 0.2252431, -0.3563821, 0, 0.4705882, 1, 1,
0.1926445, 0.9482574, -0.5943049, 0, 0.4666667, 1, 1,
0.1938941, 0.2372206, 0.04540654, 0, 0.4588235, 1, 1,
0.1939995, 0.8982798, -0.008712406, 0, 0.454902, 1, 1,
0.1962207, 1.517518, -0.8461165, 0, 0.4470588, 1, 1,
0.1964191, -0.3027622, 3.383016, 0, 0.4431373, 1, 1,
0.1964998, -1.187033, 4.265392, 0, 0.4352941, 1, 1,
0.1966896, 0.6048266, 1.129723, 0, 0.4313726, 1, 1,
0.1984097, 0.9466543, -0.1919231, 0, 0.4235294, 1, 1,
0.2012318, 0.7249787, 1.665762, 0, 0.4196078, 1, 1,
0.2062304, -2.57221, 2.035285, 0, 0.4117647, 1, 1,
0.2066517, 0.4876503, -0.3220433, 0, 0.4078431, 1, 1,
0.2071304, -1.132339, 2.454343, 0, 0.4, 1, 1,
0.2079537, 3.474148, 0.6881829, 0, 0.3921569, 1, 1,
0.2086007, 0.5746577, 1.942458, 0, 0.3882353, 1, 1,
0.2116804, 0.02777129, 1.558555, 0, 0.3803922, 1, 1,
0.2168021, 0.8127292, 1.495939, 0, 0.3764706, 1, 1,
0.2189399, -0.4250787, 2.168505, 0, 0.3686275, 1, 1,
0.2205762, -0.172458, 0.8396707, 0, 0.3647059, 1, 1,
0.2248078, -0.5427491, 2.085602, 0, 0.3568628, 1, 1,
0.228733, -0.8104753, 3.756793, 0, 0.3529412, 1, 1,
0.2289184, 0.6760763, -1.378121, 0, 0.345098, 1, 1,
0.2331298, 0.7360485, 2.194124, 0, 0.3411765, 1, 1,
0.2403501, 0.07851073, 3.43515, 0, 0.3333333, 1, 1,
0.2410029, 0.2137914, 1.143865, 0, 0.3294118, 1, 1,
0.2496883, -1.408794, 2.054477, 0, 0.3215686, 1, 1,
0.2498551, -1.709, 2.546449, 0, 0.3176471, 1, 1,
0.2524724, -0.1433987, 2.049963, 0, 0.3098039, 1, 1,
0.2654708, -0.1337818, 1.500684, 0, 0.3058824, 1, 1,
0.2664172, 1.03658, 2.914116, 0, 0.2980392, 1, 1,
0.2705612, -0.6893245, 1.264978, 0, 0.2901961, 1, 1,
0.2771007, 0.7003598, 0.2461051, 0, 0.2862745, 1, 1,
0.2781049, -0.2525459, 2.586919, 0, 0.2784314, 1, 1,
0.2811544, -1.666331, 3.287431, 0, 0.2745098, 1, 1,
0.2814698, -0.4694449, 3.903883, 0, 0.2666667, 1, 1,
0.287727, -0.10378, 2.659208, 0, 0.2627451, 1, 1,
0.2891781, 1.010936, 0.7050213, 0, 0.254902, 1, 1,
0.2906311, -0.1711581, 4.017147, 0, 0.2509804, 1, 1,
0.2907802, 2.882668, -0.9183275, 0, 0.2431373, 1, 1,
0.3019677, -0.3674252, 4.067451, 0, 0.2392157, 1, 1,
0.306219, 0.7793601, 2.042396, 0, 0.2313726, 1, 1,
0.3131196, 2.395024, -1.815019, 0, 0.227451, 1, 1,
0.3142955, -0.4114913, 3.01027, 0, 0.2196078, 1, 1,
0.3151807, -1.927212, 3.807075, 0, 0.2156863, 1, 1,
0.3153016, 1.219417, 1.40581, 0, 0.2078431, 1, 1,
0.3158596, -0.7993901, 2.107625, 0, 0.2039216, 1, 1,
0.3159913, -1.217004, 3.884494, 0, 0.1960784, 1, 1,
0.3161235, -0.5128528, 1.805792, 0, 0.1882353, 1, 1,
0.3164905, -1.974154, 3.242926, 0, 0.1843137, 1, 1,
0.3168603, 1.165735, -1.08567, 0, 0.1764706, 1, 1,
0.3170979, 1.266608, -0.4250291, 0, 0.172549, 1, 1,
0.3209569, 0.8634266, 0.1815421, 0, 0.1647059, 1, 1,
0.3221469, 0.3059883, -0.7670689, 0, 0.1607843, 1, 1,
0.3222396, 0.5084708, 2.320787, 0, 0.1529412, 1, 1,
0.323272, -1.501633, 1.706849, 0, 0.1490196, 1, 1,
0.3237613, 0.44924, -0.8596794, 0, 0.1411765, 1, 1,
0.3239346, 0.8367306, -0.7060663, 0, 0.1372549, 1, 1,
0.3246021, -0.1827707, 2.211713, 0, 0.1294118, 1, 1,
0.3252131, -1.234514, 3.252406, 0, 0.1254902, 1, 1,
0.3266911, -0.896026, 2.706532, 0, 0.1176471, 1, 1,
0.3280986, 0.07955185, 2.900672, 0, 0.1137255, 1, 1,
0.3317743, 0.4798615, 0.6926671, 0, 0.1058824, 1, 1,
0.3346503, -0.9243437, 4.789944, 0, 0.09803922, 1, 1,
0.3350538, 0.3348168, -0.2631304, 0, 0.09411765, 1, 1,
0.3367672, 1.58272, 0.09310088, 0, 0.08627451, 1, 1,
0.346025, -0.08844513, 3.528173, 0, 0.08235294, 1, 1,
0.3498638, 0.8954362, 2.04055, 0, 0.07450981, 1, 1,
0.3499142, 1.299911, 1.476462, 0, 0.07058824, 1, 1,
0.3538169, 0.7210561, 0.1707321, 0, 0.0627451, 1, 1,
0.3541247, -0.9659926, 4.154702, 0, 0.05882353, 1, 1,
0.3592687, 1.070161, 0.9709329, 0, 0.05098039, 1, 1,
0.3614323, -0.6542152, 1.208998, 0, 0.04705882, 1, 1,
0.3635299, -0.5468465, 3.135603, 0, 0.03921569, 1, 1,
0.3658423, -0.3057484, 2.380471, 0, 0.03529412, 1, 1,
0.3800796, 0.1925768, 0.04755951, 0, 0.02745098, 1, 1,
0.3863731, 1.94999, 1.108991, 0, 0.02352941, 1, 1,
0.3878224, 0.8086443, 1.941629, 0, 0.01568628, 1, 1,
0.3880481, -0.884482, 1.90769, 0, 0.01176471, 1, 1,
0.3892564, 1.016303, 2.008896, 0, 0.003921569, 1, 1,
0.3908013, 0.7683665, 0.7136505, 0.003921569, 0, 1, 1,
0.3940885, -0.0347034, 2.913337, 0.007843138, 0, 1, 1,
0.3966898, 1.169337, 1.267044, 0.01568628, 0, 1, 1,
0.4021569, 0.2482719, 0.1271852, 0.01960784, 0, 1, 1,
0.4036321, 1.439697, -1.54725, 0.02745098, 0, 1, 1,
0.4064901, -0.4368568, 0.7808436, 0.03137255, 0, 1, 1,
0.4078459, -0.9324052, 3.708377, 0.03921569, 0, 1, 1,
0.4094258, -1.368535, 4.829707, 0.04313726, 0, 1, 1,
0.4104439, -0.7205458, 3.087873, 0.05098039, 0, 1, 1,
0.4135663, -1.654146, 2.807994, 0.05490196, 0, 1, 1,
0.4220276, 0.7171338, 1.645053, 0.0627451, 0, 1, 1,
0.426192, 0.6543455, -0.2387678, 0.06666667, 0, 1, 1,
0.4279019, 1.267241, -0.1497529, 0.07450981, 0, 1, 1,
0.4300863, 0.8177738, -0.5875648, 0.07843138, 0, 1, 1,
0.4303571, -0.09711832, 2.398285, 0.08627451, 0, 1, 1,
0.4371896, -1.463985, 2.692684, 0.09019608, 0, 1, 1,
0.4394143, -0.9504924, 4.005903, 0.09803922, 0, 1, 1,
0.4466618, -1.583811, 2.58532, 0.1058824, 0, 1, 1,
0.4487124, -0.02267483, 2.77877, 0.1098039, 0, 1, 1,
0.4497125, 1.822323, 0.2419553, 0.1176471, 0, 1, 1,
0.4517018, 0.1142951, 1.073647, 0.1215686, 0, 1, 1,
0.4522939, -1.465745, 3.319841, 0.1294118, 0, 1, 1,
0.4574112, -2.064999, 2.987358, 0.1333333, 0, 1, 1,
0.4627227, 0.5020316, -0.2482072, 0.1411765, 0, 1, 1,
0.4634816, 0.602992, 1.118343, 0.145098, 0, 1, 1,
0.4661824, -1.066692, 2.718775, 0.1529412, 0, 1, 1,
0.4726643, -0.8236031, 3.312506, 0.1568628, 0, 1, 1,
0.479164, 2.026155, 1.725326, 0.1647059, 0, 1, 1,
0.4833762, -0.9874915, 2.981389, 0.1686275, 0, 1, 1,
0.4857121, 0.9804825, 0.2453471, 0.1764706, 0, 1, 1,
0.4866476, 1.51887, -1.206858, 0.1803922, 0, 1, 1,
0.4953994, -2.400616, 2.493906, 0.1882353, 0, 1, 1,
0.5017081, 0.4607251, 1.479819, 0.1921569, 0, 1, 1,
0.5110126, 0.3814051, 2.388873, 0.2, 0, 1, 1,
0.512092, -1.135562, 2.864497, 0.2078431, 0, 1, 1,
0.5128779, 0.2184609, -0.7354363, 0.2117647, 0, 1, 1,
0.5167461, -0.5738714, 2.029421, 0.2196078, 0, 1, 1,
0.516881, 2.149159, -0.8984879, 0.2235294, 0, 1, 1,
0.5203909, -0.9602073, 2.654838, 0.2313726, 0, 1, 1,
0.5235052, -0.07306721, 1.221207, 0.2352941, 0, 1, 1,
0.5250327, -1.365993, 3.583298, 0.2431373, 0, 1, 1,
0.5258884, -1.952071, 3.175481, 0.2470588, 0, 1, 1,
0.530752, -0.2514482, 0.5717118, 0.254902, 0, 1, 1,
0.5334513, -0.7475293, 1.184849, 0.2588235, 0, 1, 1,
0.5336323, 0.5881613, 1.541345, 0.2666667, 0, 1, 1,
0.5490891, -0.9629687, 3.258909, 0.2705882, 0, 1, 1,
0.5575994, 1.259586, 1.918512, 0.2784314, 0, 1, 1,
0.5593555, -0.01594063, 1.5649, 0.282353, 0, 1, 1,
0.5602083, -1.699584, 3.52766, 0.2901961, 0, 1, 1,
0.5611635, -1.508046, 3.417211, 0.2941177, 0, 1, 1,
0.5624158, 0.07255319, 1.539268, 0.3019608, 0, 1, 1,
0.5636888, 0.85038, 0.4591965, 0.3098039, 0, 1, 1,
0.5720229, -0.3844283, 3.833641, 0.3137255, 0, 1, 1,
0.5729746, -0.7311585, 2.650795, 0.3215686, 0, 1, 1,
0.5734651, 1.171663, 0.7330958, 0.3254902, 0, 1, 1,
0.5739363, 0.5191655, 1.841677, 0.3333333, 0, 1, 1,
0.5754724, -0.8258731, 3.830936, 0.3372549, 0, 1, 1,
0.5763602, -0.2908973, 0.6307689, 0.345098, 0, 1, 1,
0.5792909, -0.6258414, 2.345159, 0.3490196, 0, 1, 1,
0.5825401, 0.9343066, -1.370437, 0.3568628, 0, 1, 1,
0.5881938, -0.6528348, 1.988679, 0.3607843, 0, 1, 1,
0.5899722, -2.180269, 2.011711, 0.3686275, 0, 1, 1,
0.5951667, 1.275267, 0.4512663, 0.372549, 0, 1, 1,
0.6033677, -0.6582981, 2.312639, 0.3803922, 0, 1, 1,
0.6056787, 1.988295, 2.227624, 0.3843137, 0, 1, 1,
0.6062936, -0.1002697, 2.077657, 0.3921569, 0, 1, 1,
0.6104437, -0.003222359, 1.285925, 0.3960784, 0, 1, 1,
0.6114817, 0.6583325, 0.8870808, 0.4039216, 0, 1, 1,
0.6133331, -0.3498884, 0.5345615, 0.4117647, 0, 1, 1,
0.6150931, 0.5807319, 1.196456, 0.4156863, 0, 1, 1,
0.6260909, -0.4802637, 1.454047, 0.4235294, 0, 1, 1,
0.627471, -0.2220408, 2.986051, 0.427451, 0, 1, 1,
0.6276426, -1.128053, 1.755963, 0.4352941, 0, 1, 1,
0.6298689, -0.8838825, 3.206171, 0.4392157, 0, 1, 1,
0.6344012, -0.09814939, 2.220778, 0.4470588, 0, 1, 1,
0.6349262, 0.3344266, 1.227727, 0.4509804, 0, 1, 1,
0.6429439, -0.08493929, 1.73678, 0.4588235, 0, 1, 1,
0.6479675, -1.168825, 3.98517, 0.4627451, 0, 1, 1,
0.6500604, -0.3401629, 3.600085, 0.4705882, 0, 1, 1,
0.6508107, -0.1388332, 1.275194, 0.4745098, 0, 1, 1,
0.6527232, 2.25897, -1.434538, 0.4823529, 0, 1, 1,
0.6570506, -0.7503524, 0.5145945, 0.4862745, 0, 1, 1,
0.6571757, 0.6948327, 2.324412, 0.4941176, 0, 1, 1,
0.6600854, -0.9292026, 1.300356, 0.5019608, 0, 1, 1,
0.6610569, -0.8972605, 2.415608, 0.5058824, 0, 1, 1,
0.6669168, -0.2732392, 0.8086283, 0.5137255, 0, 1, 1,
0.6670839, 0.6126788, 1.399184, 0.5176471, 0, 1, 1,
0.6721246, 0.7085777, 0.4719569, 0.5254902, 0, 1, 1,
0.6731656, -1.738863, 3.813327, 0.5294118, 0, 1, 1,
0.676144, -0.4669774, 3.211119, 0.5372549, 0, 1, 1,
0.6796432, 0.09601073, 1.855314, 0.5411765, 0, 1, 1,
0.6811171, -0.2573467, 1.183004, 0.5490196, 0, 1, 1,
0.6816445, 1.67075, -0.5654977, 0.5529412, 0, 1, 1,
0.6817306, 1.39131, 0.6913363, 0.5607843, 0, 1, 1,
0.6833676, 1.679893, -0.7920714, 0.5647059, 0, 1, 1,
0.6854733, 1.092733, 0.9352367, 0.572549, 0, 1, 1,
0.6874499, 0.8925332, -0.08937482, 0.5764706, 0, 1, 1,
0.6905841, -0.5979348, 3.857181, 0.5843138, 0, 1, 1,
0.6918329, -2.618339, 4.107097, 0.5882353, 0, 1, 1,
0.6991016, 1.005831, 0.3860403, 0.5960785, 0, 1, 1,
0.7036278, -1.29398, 2.942712, 0.6039216, 0, 1, 1,
0.7043241, -0.8643808, 2.719486, 0.6078432, 0, 1, 1,
0.7116737, 0.05362711, 2.365745, 0.6156863, 0, 1, 1,
0.7147414, 1.643221, 1.162841, 0.6196079, 0, 1, 1,
0.7278655, 0.7569978, 1.127103, 0.627451, 0, 1, 1,
0.7278679, -0.289142, 1.251996, 0.6313726, 0, 1, 1,
0.7288338, -0.1301475, 1.746582, 0.6392157, 0, 1, 1,
0.7332172, -0.085505, 2.121691, 0.6431373, 0, 1, 1,
0.7407486, 0.9152076, 2.30718, 0.6509804, 0, 1, 1,
0.747273, 0.08934639, 1.306707, 0.654902, 0, 1, 1,
0.7521055, -0.8484774, 3.341441, 0.6627451, 0, 1, 1,
0.7525644, -2.079543, 1.783336, 0.6666667, 0, 1, 1,
0.7537333, 0.4292462, 0.4792287, 0.6745098, 0, 1, 1,
0.7595271, -0.5921082, 3.106823, 0.6784314, 0, 1, 1,
0.7655197, -0.8342637, 1.675788, 0.6862745, 0, 1, 1,
0.766184, -0.5394199, 0.5028624, 0.6901961, 0, 1, 1,
0.7733159, 0.3792438, 2.061256, 0.6980392, 0, 1, 1,
0.7759847, -2.361067, 0.7200489, 0.7058824, 0, 1, 1,
0.7781582, 0.07348406, -0.01191432, 0.7098039, 0, 1, 1,
0.7946289, 0.4519695, -0.2618544, 0.7176471, 0, 1, 1,
0.7989051, -0.5737615, 3.118482, 0.7215686, 0, 1, 1,
0.8005297, 1.154791, -0.1071146, 0.7294118, 0, 1, 1,
0.8026539, -0.1855572, 4.600719, 0.7333333, 0, 1, 1,
0.8043086, 1.27647, 1.647768, 0.7411765, 0, 1, 1,
0.8044723, -0.2062523, 0.9935709, 0.7450981, 0, 1, 1,
0.8072144, -1.597977, 3.590273, 0.7529412, 0, 1, 1,
0.8141536, -0.8928481, 3.400213, 0.7568628, 0, 1, 1,
0.8150361, 1.824858, 0.3067622, 0.7647059, 0, 1, 1,
0.8159436, 0.6561622, 2.482384, 0.7686275, 0, 1, 1,
0.8175946, -0.5575339, 2.180967, 0.7764706, 0, 1, 1,
0.8209245, 0.6335241, 0.9310203, 0.7803922, 0, 1, 1,
0.8295516, 0.8297254, -0.08403332, 0.7882353, 0, 1, 1,
0.8332817, -0.7782592, 2.158177, 0.7921569, 0, 1, 1,
0.8336931, -2.27002, 3.580183, 0.8, 0, 1, 1,
0.8368571, -0.9795395, 2.805566, 0.8078431, 0, 1, 1,
0.8394663, -0.8015807, 1.006832, 0.8117647, 0, 1, 1,
0.8401632, 0.6217309, -0.7314916, 0.8196079, 0, 1, 1,
0.8446498, -1.673524, 2.093292, 0.8235294, 0, 1, 1,
0.8501254, 0.812866, 3.084631, 0.8313726, 0, 1, 1,
0.8585576, 1.532523, -0.3086934, 0.8352941, 0, 1, 1,
0.8671786, -1.033782, 3.705065, 0.8431373, 0, 1, 1,
0.8687495, -1.19056, 3.258379, 0.8470588, 0, 1, 1,
0.8687733, -0.5687929, 0.8599172, 0.854902, 0, 1, 1,
0.8694556, 0.6655413, 0.6962836, 0.8588235, 0, 1, 1,
0.8711159, -1.337108, 3.484257, 0.8666667, 0, 1, 1,
0.8721455, 1.198297, 2.77117, 0.8705882, 0, 1, 1,
0.8721522, -1.304459, 2.186102, 0.8784314, 0, 1, 1,
0.8739454, -0.5603046, 3.349056, 0.8823529, 0, 1, 1,
0.8754478, 0.4691212, 1.187368, 0.8901961, 0, 1, 1,
0.8793728, -0.312452, 1.809312, 0.8941177, 0, 1, 1,
0.8843361, 0.2861579, 0.3099912, 0.9019608, 0, 1, 1,
0.8909388, -0.4302765, -0.1183702, 0.9098039, 0, 1, 1,
0.8957092, 0.2362335, 2.568154, 0.9137255, 0, 1, 1,
0.8972574, -1.011567, 5.492003, 0.9215686, 0, 1, 1,
0.8999366, 0.08852687, 1.239741, 0.9254902, 0, 1, 1,
0.9050217, -0.7845511, 3.545558, 0.9333333, 0, 1, 1,
0.906129, -0.3920124, 1.387152, 0.9372549, 0, 1, 1,
0.906692, 1.126197, -0.05685781, 0.945098, 0, 1, 1,
0.9108086, -1.907053, 3.059182, 0.9490196, 0, 1, 1,
0.9140425, 0.6321314, 2.840271, 0.9568627, 0, 1, 1,
0.9179192, 0.7527677, 1.802402, 0.9607843, 0, 1, 1,
0.928825, 0.2269693, 1.204224, 0.9686275, 0, 1, 1,
0.9313799, -0.8287881, 2.213924, 0.972549, 0, 1, 1,
0.9349904, 0.3385081, 0.4897648, 0.9803922, 0, 1, 1,
0.9353776, -0.4672073, 2.993626, 0.9843137, 0, 1, 1,
0.9358449, -1.057014, 2.860075, 0.9921569, 0, 1, 1,
0.9412816, 0.5720659, -0.4610508, 0.9960784, 0, 1, 1,
0.9450787, 1.032292, 0.9200515, 1, 0, 0.9960784, 1,
0.9554051, -0.6923406, 2.717142, 1, 0, 0.9882353, 1,
0.9606131, -0.002097191, 3.608079, 1, 0, 0.9843137, 1,
0.9657207, -1.159733, 2.794211, 1, 0, 0.9764706, 1,
0.9665483, 0.5879526, 0.6741125, 1, 0, 0.972549, 1,
0.9754071, 0.5587646, -0.8549444, 1, 0, 0.9647059, 1,
0.9756094, 0.3946523, 1.658643, 1, 0, 0.9607843, 1,
0.9760018, 0.5962159, -0.1908934, 1, 0, 0.9529412, 1,
0.9761696, 0.2786108, 1.647502, 1, 0, 0.9490196, 1,
0.9775698, 1.249868, 1.798836, 1, 0, 0.9411765, 1,
0.9788, 1.22102, 0.7040584, 1, 0, 0.9372549, 1,
0.9839718, -1.159106, 2.284977, 1, 0, 0.9294118, 1,
0.9886602, -2.573625, 1.561916, 1, 0, 0.9254902, 1,
0.9976226, -0.7218117, 1.976034, 1, 0, 0.9176471, 1,
1.003127, -0.04894141, 1.271831, 1, 0, 0.9137255, 1,
1.006688, 0.1243506, 2.593565, 1, 0, 0.9058824, 1,
1.007168, -3.217814, 3.934971, 1, 0, 0.9019608, 1,
1.015414, 0.2340814, -0.6150748, 1, 0, 0.8941177, 1,
1.018878, 0.5336831, 2.507777, 1, 0, 0.8862745, 1,
1.020824, -0.6984281, 1.252903, 1, 0, 0.8823529, 1,
1.031432, -0.7706133, 1.325817, 1, 0, 0.8745098, 1,
1.038, 0.7697751, 0.4814745, 1, 0, 0.8705882, 1,
1.044997, -0.3838473, 2.169679, 1, 0, 0.8627451, 1,
1.058385, 0.5527604, 0.7681, 1, 0, 0.8588235, 1,
1.060709, -1.599191, 1.413015, 1, 0, 0.8509804, 1,
1.063855, -0.9412855, 1.314185, 1, 0, 0.8470588, 1,
1.065244, 1.731518, 1.267333, 1, 0, 0.8392157, 1,
1.071859, 1.069702, -0.1264193, 1, 0, 0.8352941, 1,
1.0744, 1.675826, 1.12763, 1, 0, 0.827451, 1,
1.080308, -2.032351, 2.337723, 1, 0, 0.8235294, 1,
1.09004, 0.5866818, 0.693423, 1, 0, 0.8156863, 1,
1.092529, 0.700605, 0.3071918, 1, 0, 0.8117647, 1,
1.095751, 0.01357256, 0.6991056, 1, 0, 0.8039216, 1,
1.103213, -0.5259422, -0.8205733, 1, 0, 0.7960784, 1,
1.105845, 0.4747239, 2.186235, 1, 0, 0.7921569, 1,
1.108439, -0.226721, 2.992571, 1, 0, 0.7843137, 1,
1.1092, -0.2005648, 2.647066, 1, 0, 0.7803922, 1,
1.119808, 1.260351, 0.04459752, 1, 0, 0.772549, 1,
1.121332, -1.481448, 3.218971, 1, 0, 0.7686275, 1,
1.124808, -0.9368818, 2.504711, 1, 0, 0.7607843, 1,
1.125755, 0.6161055, 1.671713, 1, 0, 0.7568628, 1,
1.12789, 0.3756122, 0.6494372, 1, 0, 0.7490196, 1,
1.132482, -0.2637934, 1.396033, 1, 0, 0.7450981, 1,
1.13697, 0.5440218, 1.913719, 1, 0, 0.7372549, 1,
1.140962, -0.6362354, 3.919971, 1, 0, 0.7333333, 1,
1.145124, 2.448114, 0.6182337, 1, 0, 0.7254902, 1,
1.156983, 1.102793, 0.8699237, 1, 0, 0.7215686, 1,
1.162363, 0.2369732, 3.671905, 1, 0, 0.7137255, 1,
1.169196, -1.770125, 5.326714, 1, 0, 0.7098039, 1,
1.178777, -0.7644466, 2.130063, 1, 0, 0.7019608, 1,
1.182491, 0.9750847, 1.259624, 1, 0, 0.6941177, 1,
1.195803, -1.80139, 1.790946, 1, 0, 0.6901961, 1,
1.202419, 1.035843, 0.09569269, 1, 0, 0.682353, 1,
1.203392, -1.620557, 0.196441, 1, 0, 0.6784314, 1,
1.207715, 0.770541, -1.629074, 1, 0, 0.6705883, 1,
1.213444, -0.1080543, 1.017106, 1, 0, 0.6666667, 1,
1.2236, -0.9390107, 0.7218292, 1, 0, 0.6588235, 1,
1.223958, -0.4620038, 3.123587, 1, 0, 0.654902, 1,
1.231146, -0.8298233, 4.762422, 1, 0, 0.6470588, 1,
1.23427, -0.5786131, 1.779309, 1, 0, 0.6431373, 1,
1.251491, -0.2911187, 3.152438, 1, 0, 0.6352941, 1,
1.257253, 0.2210919, 0.8280353, 1, 0, 0.6313726, 1,
1.26287, -0.03640238, 1.301814, 1, 0, 0.6235294, 1,
1.278746, 0.687595, 1.032744, 1, 0, 0.6196079, 1,
1.280721, -1.347975, 2.256483, 1, 0, 0.6117647, 1,
1.288263, 0.9357706, 0.6113148, 1, 0, 0.6078432, 1,
1.296098, 1.098449, -1.081714, 1, 0, 0.6, 1,
1.310403, -0.5187385, 1.914862, 1, 0, 0.5921569, 1,
1.312944, -0.2901777, 3.162003, 1, 0, 0.5882353, 1,
1.313042, -0.09831177, -0.435874, 1, 0, 0.5803922, 1,
1.31742, -0.5666211, 3.315591, 1, 0, 0.5764706, 1,
1.319687, 0.006759631, 1.317708, 1, 0, 0.5686275, 1,
1.319785, 0.398182, -0.1793603, 1, 0, 0.5647059, 1,
1.320949, 0.3687741, 1.481441, 1, 0, 0.5568628, 1,
1.326263, 0.6999881, 2.505897, 1, 0, 0.5529412, 1,
1.327008, 0.2568322, 2.096377, 1, 0, 0.5450981, 1,
1.327616, -1.924689, 3.197769, 1, 0, 0.5411765, 1,
1.334174, -0.9779719, 0.7095276, 1, 0, 0.5333334, 1,
1.341445, 0.9471952, 2.879628, 1, 0, 0.5294118, 1,
1.343555, -0.7283754, 2.950409, 1, 0, 0.5215687, 1,
1.352969, 0.01693566, -0.3754074, 1, 0, 0.5176471, 1,
1.360515, 0.3453416, 2.280509, 1, 0, 0.509804, 1,
1.360716, -0.04048847, 1.45526, 1, 0, 0.5058824, 1,
1.368613, -0.7002871, 0.7560838, 1, 0, 0.4980392, 1,
1.373415, 1.045943, 1.658061, 1, 0, 0.4901961, 1,
1.377485, -1.656496, 3.586368, 1, 0, 0.4862745, 1,
1.378929, -1.794135, 3.286099, 1, 0, 0.4784314, 1,
1.382337, 0.2756234, 1.139602, 1, 0, 0.4745098, 1,
1.385736, 2.222023, -0.8998401, 1, 0, 0.4666667, 1,
1.38635, 0.08802731, 0.7195399, 1, 0, 0.4627451, 1,
1.395251, 0.3706825, 0.02285957, 1, 0, 0.454902, 1,
1.401474, 0.2239725, 1.750889, 1, 0, 0.4509804, 1,
1.410404, 0.605125, 0.3575751, 1, 0, 0.4431373, 1,
1.41756, -0.1492339, 1.389351, 1, 0, 0.4392157, 1,
1.421999, -0.6377955, 1.530716, 1, 0, 0.4313726, 1,
1.427704, 0.4109328, 2.257115, 1, 0, 0.427451, 1,
1.435391, 0.9040955, 0.6804146, 1, 0, 0.4196078, 1,
1.443335, 0.7324705, 3.571583, 1, 0, 0.4156863, 1,
1.444445, 2.891392, 0.333847, 1, 0, 0.4078431, 1,
1.474759, -0.7432142, 1.71775, 1, 0, 0.4039216, 1,
1.482208, -0.5985862, 3.234926, 1, 0, 0.3960784, 1,
1.490372, 0.4081969, 1.289575, 1, 0, 0.3882353, 1,
1.493116, 0.3573154, 0.9792087, 1, 0, 0.3843137, 1,
1.505741, 1.383455, 0.9649677, 1, 0, 0.3764706, 1,
1.511035, 0.4815171, 1.480533, 1, 0, 0.372549, 1,
1.513764, 0.1428748, 2.066351, 1, 0, 0.3647059, 1,
1.516826, -1.427379, 2.992118, 1, 0, 0.3607843, 1,
1.519847, 0.1734787, 0.4974622, 1, 0, 0.3529412, 1,
1.521762, 0.1391234, 1.151426, 1, 0, 0.3490196, 1,
1.521915, 0.1860242, 1.650763, 1, 0, 0.3411765, 1,
1.540567, 0.05363583, 1.529215, 1, 0, 0.3372549, 1,
1.546448, -0.4816383, 2.656748, 1, 0, 0.3294118, 1,
1.553213, -1.462882, 2.613269, 1, 0, 0.3254902, 1,
1.553276, 0.5153536, 0.2096897, 1, 0, 0.3176471, 1,
1.553853, -0.2420427, 1.601013, 1, 0, 0.3137255, 1,
1.575739, 0.4016062, 1.831786, 1, 0, 0.3058824, 1,
1.587476, -0.09937119, 2.302841, 1, 0, 0.2980392, 1,
1.600077, -0.4163609, 1.331107, 1, 0, 0.2941177, 1,
1.600808, 0.6502891, 2.04526, 1, 0, 0.2862745, 1,
1.618624, -2.043231, 2.20552, 1, 0, 0.282353, 1,
1.621894, 0.7108168, 0.7939916, 1, 0, 0.2745098, 1,
1.624779, -2.890663, 2.373699, 1, 0, 0.2705882, 1,
1.628232, -1.718202, 2.486513, 1, 0, 0.2627451, 1,
1.633218, -0.6599538, 1.572448, 1, 0, 0.2588235, 1,
1.636168, 0.9582483, 0.3032224, 1, 0, 0.2509804, 1,
1.639268, -0.640222, 0.6355423, 1, 0, 0.2470588, 1,
1.659104, -0.9869456, 2.753246, 1, 0, 0.2392157, 1,
1.665704, -0.3030725, 2.030845, 1, 0, 0.2352941, 1,
1.679229, -0.5412268, 1.327605, 1, 0, 0.227451, 1,
1.717672, 0.5940182, 1.952566, 1, 0, 0.2235294, 1,
1.723493, 0.2926667, 1.719532, 1, 0, 0.2156863, 1,
1.733901, 0.6325788, 1.614599, 1, 0, 0.2117647, 1,
1.738179, 0.1185442, 1.348748, 1, 0, 0.2039216, 1,
1.745317, -2.210751, 4.118084, 1, 0, 0.1960784, 1,
1.749797, -0.1034404, 1.64682, 1, 0, 0.1921569, 1,
1.760356, -0.3930129, 2.251616, 1, 0, 0.1843137, 1,
1.764192, -2.315783, 2.370379, 1, 0, 0.1803922, 1,
1.764718, 1.893526, 0.9808586, 1, 0, 0.172549, 1,
1.779801, 1.562551, 1.774086, 1, 0, 0.1686275, 1,
1.846295, 1.923603, -0.04099743, 1, 0, 0.1607843, 1,
1.861663, 0.4087864, 2.09976, 1, 0, 0.1568628, 1,
1.867907, -0.4461297, 1.635156, 1, 0, 0.1490196, 1,
1.8909, 0.2911142, 2.799017, 1, 0, 0.145098, 1,
1.909298, -0.5670871, 0.8157418, 1, 0, 0.1372549, 1,
1.91042, -1.191732, -0.1166594, 1, 0, 0.1333333, 1,
1.960963, -0.4754066, 2.056035, 1, 0, 0.1254902, 1,
1.968372, -0.9829728, 1.916455, 1, 0, 0.1215686, 1,
2.012499, 0.2632151, 1.00317, 1, 0, 0.1137255, 1,
2.120767, 1.023123, 0.7024034, 1, 0, 0.1098039, 1,
2.153512, 1.808466, -1.000806, 1, 0, 0.1019608, 1,
2.171365, 0.2094905, 0.782816, 1, 0, 0.09411765, 1,
2.179646, 0.6618527, 1.299856, 1, 0, 0.09019608, 1,
2.229074, 0.8630962, 1.145731, 1, 0, 0.08235294, 1,
2.232878, 2.145996, -1.658365, 1, 0, 0.07843138, 1,
2.280754, 0.7426242, 1.896121, 1, 0, 0.07058824, 1,
2.327672, -1.011474, 1.046726, 1, 0, 0.06666667, 1,
2.340253, 1.41864, 0.3930717, 1, 0, 0.05882353, 1,
2.399404, -0.2397141, 1.072417, 1, 0, 0.05490196, 1,
2.423783, -1.605597, 3.579156, 1, 0, 0.04705882, 1,
2.462816, 1.926485, 0.9644426, 1, 0, 0.04313726, 1,
2.571338, -0.2411037, -0.3531181, 1, 0, 0.03529412, 1,
2.582978, 0.3874019, -1.205029, 1, 0, 0.03137255, 1,
2.585935, 0.8742423, 3.783776, 1, 0, 0.02352941, 1,
2.700185, 0.6279969, 0.7429797, 1, 0, 0.01960784, 1,
3.07519, 1.236144, 1.113172, 1, 0, 0.01176471, 1,
3.168388, -0.8145249, 2.053653, 1, 0, 0.007843138, 1
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
0.0305419, -4.795055, -6.834137, 0, -0.5, 0.5, 0.5,
0.0305419, -4.795055, -6.834137, 1, -0.5, 0.5, 0.5,
0.0305419, -4.795055, -6.834137, 1, 1.5, 0.5, 0.5,
0.0305419, -4.795055, -6.834137, 0, 1.5, 0.5, 0.5
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
-4.171034, 0.3323883, -6.834137, 0, -0.5, 0.5, 0.5,
-4.171034, 0.3323883, -6.834137, 1, -0.5, 0.5, 0.5,
-4.171034, 0.3323883, -6.834137, 1, 1.5, 0.5, 0.5,
-4.171034, 0.3323883, -6.834137, 0, 1.5, 0.5, 0.5
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
-4.171034, -4.795055, 0.2221696, 0, -0.5, 0.5, 0.5,
-4.171034, -4.795055, 0.2221696, 1, -0.5, 0.5, 0.5,
-4.171034, -4.795055, 0.2221696, 1, 1.5, 0.5, 0.5,
-4.171034, -4.795055, 0.2221696, 0, 1.5, 0.5, 0.5
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
-3, -3.611799, -5.205759,
3, -3.611799, -5.205759,
-3, -3.611799, -5.205759,
-3, -3.809008, -5.477155,
-2, -3.611799, -5.205759,
-2, -3.809008, -5.477155,
-1, -3.611799, -5.205759,
-1, -3.809008, -5.477155,
0, -3.611799, -5.205759,
0, -3.809008, -5.477155,
1, -3.611799, -5.205759,
1, -3.809008, -5.477155,
2, -3.611799, -5.205759,
2, -3.809008, -5.477155,
3, -3.611799, -5.205759,
3, -3.809008, -5.477155
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
-3, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
-3, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
-3, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
-3, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
-2, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
-2, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
-2, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
-2, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
-1, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
-1, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
-1, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
-1, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
0, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
0, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
0, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
0, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
1, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
1, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
1, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
1, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
2, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
2, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
2, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
2, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5,
3, -4.203427, -6.019948, 0, -0.5, 0.5, 0.5,
3, -4.203427, -6.019948, 1, -0.5, 0.5, 0.5,
3, -4.203427, -6.019948, 1, 1.5, 0.5, 0.5,
3, -4.203427, -6.019948, 0, 1.5, 0.5, 0.5
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
-3.201439, -2, -5.205759,
-3.201439, 4, -5.205759,
-3.201439, -2, -5.205759,
-3.363039, -2, -5.477155,
-3.201439, 0, -5.205759,
-3.363039, 0, -5.477155,
-3.201439, 2, -5.205759,
-3.363039, 2, -5.477155,
-3.201439, 4, -5.205759,
-3.363039, 4, -5.477155
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
"2",
"4"
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
-3.686237, -2, -6.019948, 0, -0.5, 0.5, 0.5,
-3.686237, -2, -6.019948, 1, -0.5, 0.5, 0.5,
-3.686237, -2, -6.019948, 1, 1.5, 0.5, 0.5,
-3.686237, -2, -6.019948, 0, 1.5, 0.5, 0.5,
-3.686237, 0, -6.019948, 0, -0.5, 0.5, 0.5,
-3.686237, 0, -6.019948, 1, -0.5, 0.5, 0.5,
-3.686237, 0, -6.019948, 1, 1.5, 0.5, 0.5,
-3.686237, 0, -6.019948, 0, 1.5, 0.5, 0.5,
-3.686237, 2, -6.019948, 0, -0.5, 0.5, 0.5,
-3.686237, 2, -6.019948, 1, -0.5, 0.5, 0.5,
-3.686237, 2, -6.019948, 1, 1.5, 0.5, 0.5,
-3.686237, 2, -6.019948, 0, 1.5, 0.5, 0.5,
-3.686237, 4, -6.019948, 0, -0.5, 0.5, 0.5,
-3.686237, 4, -6.019948, 1, -0.5, 0.5, 0.5,
-3.686237, 4, -6.019948, 1, 1.5, 0.5, 0.5,
-3.686237, 4, -6.019948, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.201439, -3.611799, -4,
-3.201439, -3.611799, 4,
-3.201439, -3.611799, -4,
-3.363039, -3.809008, -4,
-3.201439, -3.611799, -2,
-3.363039, -3.809008, -2,
-3.201439, -3.611799, 0,
-3.363039, -3.809008, 0,
-3.201439, -3.611799, 2,
-3.363039, -3.809008, 2,
-3.201439, -3.611799, 4,
-3.363039, -3.809008, 4
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
-3.686237, -4.203427, -4, 0, -0.5, 0.5, 0.5,
-3.686237, -4.203427, -4, 1, -0.5, 0.5, 0.5,
-3.686237, -4.203427, -4, 1, 1.5, 0.5, 0.5,
-3.686237, -4.203427, -4, 0, 1.5, 0.5, 0.5,
-3.686237, -4.203427, -2, 0, -0.5, 0.5, 0.5,
-3.686237, -4.203427, -2, 1, -0.5, 0.5, 0.5,
-3.686237, -4.203427, -2, 1, 1.5, 0.5, 0.5,
-3.686237, -4.203427, -2, 0, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 0, 0, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 0, 1, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 0, 1, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 0, 0, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 2, 0, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 2, 1, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 2, 1, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 2, 0, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 4, 0, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 4, 1, -0.5, 0.5, 0.5,
-3.686237, -4.203427, 4, 1, 1.5, 0.5, 0.5,
-3.686237, -4.203427, 4, 0, 1.5, 0.5, 0.5
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
-3.201439, -3.611799, -5.205759,
-3.201439, 4.276575, -5.205759,
-3.201439, -3.611799, 5.650098,
-3.201439, 4.276575, 5.650098,
-3.201439, -3.611799, -5.205759,
-3.201439, -3.611799, 5.650098,
-3.201439, 4.276575, -5.205759,
-3.201439, 4.276575, 5.650098,
-3.201439, -3.611799, -5.205759,
3.262523, -3.611799, -5.205759,
-3.201439, -3.611799, 5.650098,
3.262523, -3.611799, 5.650098,
-3.201439, 4.276575, -5.205759,
3.262523, 4.276575, -5.205759,
-3.201439, 4.276575, 5.650098,
3.262523, 4.276575, 5.650098,
3.262523, -3.611799, -5.205759,
3.262523, 4.276575, -5.205759,
3.262523, -3.611799, 5.650098,
3.262523, 4.276575, 5.650098,
3.262523, -3.611799, -5.205759,
3.262523, -3.611799, 5.650098,
3.262523, 4.276575, -5.205759,
3.262523, 4.276575, 5.650098
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
var radius = 7.953602;
var distance = 35.38647;
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
mvMatrix.translate( -0.0305419, -0.3323883, -0.2221696 );
mvMatrix.scale( 1.33039, 1.09016, 0.7921614 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38647);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.107304, 0.5088482, -1.766384, 0, 0, 1, 1, 1,
-3.035448, 0.4257031, -0.2084628, 1, 0, 0, 1, 1,
-2.893899, 0.2260807, -2.005281, 1, 0, 0, 1, 1,
-2.855292, 0.3799137, -1.581707, 1, 0, 0, 1, 1,
-2.708349, -0.1418285, -0.3958426, 1, 0, 0, 1, 1,
-2.705783, -0.5874969, -1.406191, 1, 0, 0, 1, 1,
-2.663548, 1.176873, -1.088113, 0, 0, 0, 1, 1,
-2.624795, -0.3809517, 0.5808778, 0, 0, 0, 1, 1,
-2.59723, 1.289666, -0.2647693, 0, 0, 0, 1, 1,
-2.481974, 0.7926232, -4.322363, 0, 0, 0, 1, 1,
-2.481083, -1.043183, -1.86, 0, 0, 0, 1, 1,
-2.345703, -0.5769839, -1.321771, 0, 0, 0, 1, 1,
-2.306242, 2.379512, -0.175117, 0, 0, 0, 1, 1,
-2.245719, -1.785471, -0.5851385, 1, 1, 1, 1, 1,
-2.242085, -0.4088661, -2.222268, 1, 1, 1, 1, 1,
-2.225049, -0.5146057, -0.9831782, 1, 1, 1, 1, 1,
-2.156312, -0.3736903, -2.460911, 1, 1, 1, 1, 1,
-2.141564, 0.06554283, -0.4013225, 1, 1, 1, 1, 1,
-2.125944, 0.08561281, -2.360378, 1, 1, 1, 1, 1,
-2.117636, 0.2363039, -1.217527, 1, 1, 1, 1, 1,
-2.10466, 0.1165649, -3.863691, 1, 1, 1, 1, 1,
-2.086646, -0.7849941, -1.761073, 1, 1, 1, 1, 1,
-2.070245, -0.02151474, 0.09838313, 1, 1, 1, 1, 1,
-2.033108, 0.854564, 0.9216326, 1, 1, 1, 1, 1,
-2.022442, 0.3636216, -2.074288, 1, 1, 1, 1, 1,
-1.926698, -0.06760011, -0.8861507, 1, 1, 1, 1, 1,
-1.918463, 0.5531455, -2.402658, 1, 1, 1, 1, 1,
-1.917406, 1.060887, -1.935327, 1, 1, 1, 1, 1,
-1.913986, 1.329737, -0.2529126, 0, 0, 1, 1, 1,
-1.897724, -0.6348699, -3.627869, 1, 0, 0, 1, 1,
-1.883524, -1.071418, -2.253169, 1, 0, 0, 1, 1,
-1.850489, -0.5511006, -3.047147, 1, 0, 0, 1, 1,
-1.845568, 0.8737532, -1.371863, 1, 0, 0, 1, 1,
-1.844033, -0.0845402, -0.5434541, 1, 0, 0, 1, 1,
-1.841194, 0.3778019, 0.6298885, 0, 0, 0, 1, 1,
-1.769828, 1.01673, -2.398194, 0, 0, 0, 1, 1,
-1.768481, 0.1593085, -1.555403, 0, 0, 0, 1, 1,
-1.762188, 1.488053, -0.5924107, 0, 0, 0, 1, 1,
-1.755589, -1.134991, -1.995951, 0, 0, 0, 1, 1,
-1.749374, 0.4010377, -2.978636, 0, 0, 0, 1, 1,
-1.743159, -1.977629, -2.624515, 0, 0, 0, 1, 1,
-1.699316, 1.01766, 0.04615043, 1, 1, 1, 1, 1,
-1.684872, 0.7916899, -1.355417, 1, 1, 1, 1, 1,
-1.673055, -0.01896655, -1.694846, 1, 1, 1, 1, 1,
-1.672588, -0.8501357, -1.206112, 1, 1, 1, 1, 1,
-1.652158, 1.86717, -0.8291332, 1, 1, 1, 1, 1,
-1.635334, -3.496919, -2.078605, 1, 1, 1, 1, 1,
-1.634714, 0.4564871, 0.9256898, 1, 1, 1, 1, 1,
-1.632166, -0.07131094, -3.482589, 1, 1, 1, 1, 1,
-1.622683, 0.2652071, -3.776002, 1, 1, 1, 1, 1,
-1.621344, -0.9684466, -0.7282757, 1, 1, 1, 1, 1,
-1.617359, -1.841188, -1.753115, 1, 1, 1, 1, 1,
-1.602189, 1.167306, -1.106195, 1, 1, 1, 1, 1,
-1.59206, 0.3391351, -2.696224, 1, 1, 1, 1, 1,
-1.572668, -0.195324, -2.762382, 1, 1, 1, 1, 1,
-1.566005, 0.1427958, -3.183712, 1, 1, 1, 1, 1,
-1.55287, -1.700068, -2.622854, 0, 0, 1, 1, 1,
-1.550144, -0.9941199, -2.720353, 1, 0, 0, 1, 1,
-1.547631, -2.052321, -1.285598, 1, 0, 0, 1, 1,
-1.537927, 0.04160601, -1.061858, 1, 0, 0, 1, 1,
-1.533126, -0.3808419, -2.62133, 1, 0, 0, 1, 1,
-1.529321, -0.06883328, -1.98672, 1, 0, 0, 1, 1,
-1.522871, -0.6765896, -0.5459966, 0, 0, 0, 1, 1,
-1.517433, 1.200697, -0.09579471, 0, 0, 0, 1, 1,
-1.463359, -0.2113109, -1.706879, 0, 0, 0, 1, 1,
-1.456867, -0.3854599, -1.889931, 0, 0, 0, 1, 1,
-1.45229, -1.497666, -2.323328, 0, 0, 0, 1, 1,
-1.419033, -0.8738105, -3.516037, 0, 0, 0, 1, 1,
-1.412984, -1.852929, -1.368356, 0, 0, 0, 1, 1,
-1.412348, -0.2321685, -0.9672615, 1, 1, 1, 1, 1,
-1.411756, 0.3499865, -1.176559, 1, 1, 1, 1, 1,
-1.411619, 0.8954544, 0.0623765, 1, 1, 1, 1, 1,
-1.408306, -0.4884737, -2.241972, 1, 1, 1, 1, 1,
-1.389255, 0.6223581, -1.953099, 1, 1, 1, 1, 1,
-1.385963, -0.4715729, -0.8443872, 1, 1, 1, 1, 1,
-1.379367, -0.09905346, -1.062653, 1, 1, 1, 1, 1,
-1.36368, 0.2498016, 0.08038703, 1, 1, 1, 1, 1,
-1.361656, -0.7050475, -2.652588, 1, 1, 1, 1, 1,
-1.353242, -2.150005, -2.099397, 1, 1, 1, 1, 1,
-1.352941, -0.4221083, -2.170725, 1, 1, 1, 1, 1,
-1.351841, -1.16542, -3.101253, 1, 1, 1, 1, 1,
-1.351794, 0.752667, -0.7792589, 1, 1, 1, 1, 1,
-1.342423, -0.729002, -3.237618, 1, 1, 1, 1, 1,
-1.333668, -0.8340281, -2.536438, 1, 1, 1, 1, 1,
-1.332166, -0.7081441, -1.189283, 0, 0, 1, 1, 1,
-1.321384, 1.011418, 0.2095828, 1, 0, 0, 1, 1,
-1.308844, -0.3779762, -0.9763876, 1, 0, 0, 1, 1,
-1.305642, -1.488344, -2.606758, 1, 0, 0, 1, 1,
-1.305116, -0.09377757, -0.6439124, 1, 0, 0, 1, 1,
-1.290712, -1.954625, -3.827105, 1, 0, 0, 1, 1,
-1.283158, -0.02904849, -0.5444478, 0, 0, 0, 1, 1,
-1.281209, -1.961191, -0.9426027, 0, 0, 0, 1, 1,
-1.280381, -0.5321802, -2.459445, 0, 0, 0, 1, 1,
-1.280081, 1.652958, -1.480579, 0, 0, 0, 1, 1,
-1.279568, 1.254308, 0.7209356, 0, 0, 0, 1, 1,
-1.279253, 1.259537, -1.418814, 0, 0, 0, 1, 1,
-1.275086, 0.5179538, -1.007873, 0, 0, 0, 1, 1,
-1.265337, 0.7939219, -0.6953954, 1, 1, 1, 1, 1,
-1.265263, -1.148077, -2.584879, 1, 1, 1, 1, 1,
-1.255687, -0.7600054, -2.395773, 1, 1, 1, 1, 1,
-1.254712, -0.0693525, -1.676592, 1, 1, 1, 1, 1,
-1.242444, -0.4486615, -0.9769383, 1, 1, 1, 1, 1,
-1.238317, -1.089088, -3.983794, 1, 1, 1, 1, 1,
-1.236001, -1.15173, -3.385896, 1, 1, 1, 1, 1,
-1.23557, 1.106728, -0.06524914, 1, 1, 1, 1, 1,
-1.234328, -0.8714415, -3.155502, 1, 1, 1, 1, 1,
-1.227669, 0.2801504, -2.282592, 1, 1, 1, 1, 1,
-1.222286, -1.230411, -2.20365, 1, 1, 1, 1, 1,
-1.218396, -0.9462569, -2.358082, 1, 1, 1, 1, 1,
-1.217809, -1.741892, -3.142613, 1, 1, 1, 1, 1,
-1.217358, 0.9990125, -1.106455, 1, 1, 1, 1, 1,
-1.210265, 0.2409279, -2.292368, 1, 1, 1, 1, 1,
-1.207231, 1.082129, -2.388794, 0, 0, 1, 1, 1,
-1.206279, -0.6537793, -2.181577, 1, 0, 0, 1, 1,
-1.204367, 0.04125457, 0.5989649, 1, 0, 0, 1, 1,
-1.200551, -0.3876222, -1.603853, 1, 0, 0, 1, 1,
-1.199121, 0.6872646, 0.773038, 1, 0, 0, 1, 1,
-1.19803, 1.546044, -0.9368463, 1, 0, 0, 1, 1,
-1.195689, 0.5865355, -0.005851012, 0, 0, 0, 1, 1,
-1.194068, 0.2213506, 1.129092, 0, 0, 0, 1, 1,
-1.190781, 0.1854191, 0.1331172, 0, 0, 0, 1, 1,
-1.183045, 0.2354516, -1.244516, 0, 0, 0, 1, 1,
-1.175811, 0.7293355, -2.75162, 0, 0, 0, 1, 1,
-1.170097, 0.7342732, -2.308661, 0, 0, 0, 1, 1,
-1.161879, -1.682264, -1.298001, 0, 0, 0, 1, 1,
-1.160608, -2.179491, -1.763006, 1, 1, 1, 1, 1,
-1.155383, -0.05316141, -2.228762, 1, 1, 1, 1, 1,
-1.154381, 0.1027763, -0.1910825, 1, 1, 1, 1, 1,
-1.15263, 0.4836056, -1.499733, 1, 1, 1, 1, 1,
-1.151249, 1.236287, -1.383118, 1, 1, 1, 1, 1,
-1.149943, -2.717954, -1.769511, 1, 1, 1, 1, 1,
-1.147617, 0.811163, -1.502805, 1, 1, 1, 1, 1,
-1.143919, -0.741892, -2.188619, 1, 1, 1, 1, 1,
-1.142907, 0.5490131, -2.01201, 1, 1, 1, 1, 1,
-1.136262, 2.630589, -1.860656, 1, 1, 1, 1, 1,
-1.124925, -0.6150083, -2.03946, 1, 1, 1, 1, 1,
-1.116844, 1.430625, -0.4364074, 1, 1, 1, 1, 1,
-1.109906, -1.331815, -3.888034, 1, 1, 1, 1, 1,
-1.098511, -0.4020867, -1.330715, 1, 1, 1, 1, 1,
-1.09793, -0.8198143, 0.7557911, 1, 1, 1, 1, 1,
-1.075409, -0.02092313, -1.223966, 0, 0, 1, 1, 1,
-1.067376, -0.2084331, -0.5228097, 1, 0, 0, 1, 1,
-1.065837, 0.3684111, -1.841377, 1, 0, 0, 1, 1,
-1.060665, -1.415393, -3.655679, 1, 0, 0, 1, 1,
-1.05789, 0.01786709, -0.8708538, 1, 0, 0, 1, 1,
-1.056947, -0.8046524, -1.884057, 1, 0, 0, 1, 1,
-1.043899, 0.5916404, -0.5017525, 0, 0, 0, 1, 1,
-1.03236, -1.748964, -1.735103, 0, 0, 0, 1, 1,
-1.031667, 1.185363, -1.364017, 0, 0, 0, 1, 1,
-1.028783, 1.048091, -2.008074, 0, 0, 0, 1, 1,
-1.02714, -0.2432113, -0.07869841, 0, 0, 0, 1, 1,
-1.021932, -0.3197915, -2.742467, 0, 0, 0, 1, 1,
-1.009486, -0.3430307, -1.69642, 0, 0, 0, 1, 1,
-0.9978119, 0.3983802, -1.332909, 1, 1, 1, 1, 1,
-0.9879973, 0.01073357, -2.946184, 1, 1, 1, 1, 1,
-0.987645, 1.292346, -0.4078837, 1, 1, 1, 1, 1,
-0.9874225, 1.403148, 1.570893, 1, 1, 1, 1, 1,
-0.9873276, 0.3215845, -1.482173, 1, 1, 1, 1, 1,
-0.977893, -0.1997575, -1.406652, 1, 1, 1, 1, 1,
-0.9773649, -2.000316, -2.319667, 1, 1, 1, 1, 1,
-0.9770536, 1.419379, -1.744427, 1, 1, 1, 1, 1,
-0.9713005, -1.794637, -2.004361, 1, 1, 1, 1, 1,
-0.9671828, -0.7250256, -3.54161, 1, 1, 1, 1, 1,
-0.9642729, -0.2315723, -2.697404, 1, 1, 1, 1, 1,
-0.9619579, 0.2933406, -2.873615, 1, 1, 1, 1, 1,
-0.9595316, 0.5425503, 0.5387157, 1, 1, 1, 1, 1,
-0.9548979, -0.5466346, -1.139577, 1, 1, 1, 1, 1,
-0.9539582, 2.595711, 1.159524, 1, 1, 1, 1, 1,
-0.9518077, 0.9471755, 0.07253321, 0, 0, 1, 1, 1,
-0.951158, 1.211511, -1.085593, 1, 0, 0, 1, 1,
-0.9507329, 1.448003, -0.8065808, 1, 0, 0, 1, 1,
-0.9473853, 0.4131078, -1.500911, 1, 0, 0, 1, 1,
-0.9438544, 0.2753602, 0.5258588, 1, 0, 0, 1, 1,
-0.9435467, -0.6071045, -2.811553, 1, 0, 0, 1, 1,
-0.9405789, 0.387729, -2.647846, 0, 0, 0, 1, 1,
-0.9303942, 0.2034434, -2.304214, 0, 0, 0, 1, 1,
-0.93003, 0.899874, -1.088612, 0, 0, 0, 1, 1,
-0.9169983, 1.242725, -0.7184465, 0, 0, 0, 1, 1,
-0.9165913, -1.490857, -3.138114, 0, 0, 0, 1, 1,
-0.91606, 0.1894478, -0.1427165, 0, 0, 0, 1, 1,
-0.9092119, 1.399185, -1.604378, 0, 0, 0, 1, 1,
-0.9014596, 0.9446163, -1.613396, 1, 1, 1, 1, 1,
-0.8996533, -1.259317, 0.2501347, 1, 1, 1, 1, 1,
-0.8959258, 0.66269, -0.9900568, 1, 1, 1, 1, 1,
-0.8920643, -0.134986, -2.901271, 1, 1, 1, 1, 1,
-0.8908578, -0.4244193, -1.844677, 1, 1, 1, 1, 1,
-0.8772488, 0.8213667, -0.05489289, 1, 1, 1, 1, 1,
-0.8764943, -0.3675763, -1.796705, 1, 1, 1, 1, 1,
-0.8752749, -0.4406011, -1.819802, 1, 1, 1, 1, 1,
-0.8649241, 0.2227368, -1.306867, 1, 1, 1, 1, 1,
-0.8642973, -0.3133017, -1.807229, 1, 1, 1, 1, 1,
-0.8622738, -1.133913, -0.5689017, 1, 1, 1, 1, 1,
-0.8564119, -0.5517799, -2.061671, 1, 1, 1, 1, 1,
-0.856039, 1.100044, -1.926861, 1, 1, 1, 1, 1,
-0.8489633, 1.34094, -1.20948, 1, 1, 1, 1, 1,
-0.8449336, 0.7505355, 0.1536534, 1, 1, 1, 1, 1,
-0.8415058, 0.04661519, -2.327529, 0, 0, 1, 1, 1,
-0.8383379, 1.079784, -1.542657, 1, 0, 0, 1, 1,
-0.8359284, -0.2840234, -1.492565, 1, 0, 0, 1, 1,
-0.835018, -1.426042, -1.705534, 1, 0, 0, 1, 1,
-0.8348848, -1.034311, -2.828305, 1, 0, 0, 1, 1,
-0.8279371, -0.5215793, -1.747326, 1, 0, 0, 1, 1,
-0.8225542, 2.166715, 0.4531428, 0, 0, 0, 1, 1,
-0.8195571, 0.09507019, -1.12818, 0, 0, 0, 1, 1,
-0.8193775, 0.2441761, 0.6549115, 0, 0, 0, 1, 1,
-0.8168436, 0.7285771, -1.762321, 0, 0, 0, 1, 1,
-0.8158032, -1.516016, -2.540382, 0, 0, 0, 1, 1,
-0.8131645, 1.361386, -1.006206, 0, 0, 0, 1, 1,
-0.8101326, -0.2191103, -1.337607, 0, 0, 0, 1, 1,
-0.8100177, 0.6068618, -1.326079, 1, 1, 1, 1, 1,
-0.8039742, 0.2280593, -2.341337, 1, 1, 1, 1, 1,
-0.8018896, -0.2813688, -4.932912, 1, 1, 1, 1, 1,
-0.7989783, -0.4569198, -1.819252, 1, 1, 1, 1, 1,
-0.7936913, 1.322435, 0.3002642, 1, 1, 1, 1, 1,
-0.7904458, -0.1003301, -3.486625, 1, 1, 1, 1, 1,
-0.7896287, -1.243545, -3.695917, 1, 1, 1, 1, 1,
-0.7879143, 1.166615, -0.629227, 1, 1, 1, 1, 1,
-0.7877417, -0.730927, -3.484868, 1, 1, 1, 1, 1,
-0.7830694, -0.3956416, -1.427203, 1, 1, 1, 1, 1,
-0.7827881, -0.5490898, -2.682978, 1, 1, 1, 1, 1,
-0.7790666, 1.553033, -1.655314, 1, 1, 1, 1, 1,
-0.7766096, 0.3441631, -1.264147, 1, 1, 1, 1, 1,
-0.7755885, -1.206272, -1.919235, 1, 1, 1, 1, 1,
-0.7717826, 4.161696, 0.1387687, 1, 1, 1, 1, 1,
-0.7659179, 0.3750692, -2.749269, 0, 0, 1, 1, 1,
-0.7616384, 1.229638, 0.1208638, 1, 0, 0, 1, 1,
-0.7568334, -0.08063856, -3.841487, 1, 0, 0, 1, 1,
-0.7511435, 0.7538735, -1.296511, 1, 0, 0, 1, 1,
-0.7463844, -0.5327233, -2.34174, 1, 0, 0, 1, 1,
-0.7456864, -2.210827, -1.360388, 1, 0, 0, 1, 1,
-0.738047, -0.5981538, -2.026953, 0, 0, 0, 1, 1,
-0.737078, -0.8457916, 0.2899434, 0, 0, 0, 1, 1,
-0.7320494, -0.3014558, -3.427777, 0, 0, 0, 1, 1,
-0.7316442, -2.121094, -4.452332, 0, 0, 0, 1, 1,
-0.7307726, -1.104923, -2.440917, 0, 0, 0, 1, 1,
-0.7269028, -0.2587636, -0.4310575, 0, 0, 0, 1, 1,
-0.7210733, -0.907189, -3.322359, 0, 0, 0, 1, 1,
-0.7184255, 1.43395, -1.273817, 1, 1, 1, 1, 1,
-0.7171038, 1.716947, 0.7414464, 1, 1, 1, 1, 1,
-0.7115259, 0.5291378, -0.1963003, 1, 1, 1, 1, 1,
-0.7076078, 2.73865, -0.6352915, 1, 1, 1, 1, 1,
-0.7065175, 0.465327, -2.224773, 1, 1, 1, 1, 1,
-0.7028474, 0.06761691, -2.375412, 1, 1, 1, 1, 1,
-0.7027148, 0.1694696, -2.633842, 1, 1, 1, 1, 1,
-0.7017561, 0.8001046, -0.4330151, 1, 1, 1, 1, 1,
-0.6936775, 0.2143226, -0.7375877, 1, 1, 1, 1, 1,
-0.6925199, 1.330679, -1.724971, 1, 1, 1, 1, 1,
-0.6846626, 0.1785838, -1.438108, 1, 1, 1, 1, 1,
-0.679626, 0.1113414, -2.061111, 1, 1, 1, 1, 1,
-0.6752975, -0.4370314, -2.292434, 1, 1, 1, 1, 1,
-0.6702117, -0.4635785, -2.713936, 1, 1, 1, 1, 1,
-0.6687745, 1.135389, -1.668304, 1, 1, 1, 1, 1,
-0.6659114, -1.096937, -1.316627, 0, 0, 1, 1, 1,
-0.6636174, -0.6974041, -1.810367, 1, 0, 0, 1, 1,
-0.6629681, -0.3382688, -2.039451, 1, 0, 0, 1, 1,
-0.6527623, 0.4304186, -1.079884, 1, 0, 0, 1, 1,
-0.6467766, -2.558989, -3.337845, 1, 0, 0, 1, 1,
-0.6456846, 0.7444293, -0.6873954, 1, 0, 0, 1, 1,
-0.6405121, -0.5686144, -3.320804, 0, 0, 0, 1, 1,
-0.6388101, 0.5882021, -1.447568, 0, 0, 0, 1, 1,
-0.6358854, -1.457112, -1.063518, 0, 0, 0, 1, 1,
-0.6348226, -0.3240946, -1.088017, 0, 0, 0, 1, 1,
-0.6283938, 0.635064, 1.003286, 0, 0, 0, 1, 1,
-0.6279001, 0.192144, -0.3539617, 0, 0, 0, 1, 1,
-0.626484, 0.9644703, -1.041657, 0, 0, 0, 1, 1,
-0.6239591, 1.101206, 0.1277338, 1, 1, 1, 1, 1,
-0.6229218, 1.386206, -1.099188, 1, 1, 1, 1, 1,
-0.6205456, 1.898987, 0.1069286, 1, 1, 1, 1, 1,
-0.6200478, 0.1408332, -0.2975535, 1, 1, 1, 1, 1,
-0.6169683, -1.199337, -2.354879, 1, 1, 1, 1, 1,
-0.6169204, -0.3209953, -1.170618, 1, 1, 1, 1, 1,
-0.6096886, -0.5512651, -2.193453, 1, 1, 1, 1, 1,
-0.6081851, -1.924459, -1.562218, 1, 1, 1, 1, 1,
-0.6012195, 0.7388731, -2.338786, 1, 1, 1, 1, 1,
-0.5988067, -0.5530164, -1.203594, 1, 1, 1, 1, 1,
-0.5972415, -1.316943, -4.027334, 1, 1, 1, 1, 1,
-0.593972, -1.256215, -1.399367, 1, 1, 1, 1, 1,
-0.5866911, -0.8405256, 0.2178481, 1, 1, 1, 1, 1,
-0.5848046, -1.035973, -2.457994, 1, 1, 1, 1, 1,
-0.5841424, -0.2603521, -1.368555, 1, 1, 1, 1, 1,
-0.5838373, 0.027149, -0.3574364, 0, 0, 1, 1, 1,
-0.5827851, 0.07389227, -2.024839, 1, 0, 0, 1, 1,
-0.5807657, 0.5156938, -0.5418875, 1, 0, 0, 1, 1,
-0.580757, -0.7133147, -3.084213, 1, 0, 0, 1, 1,
-0.5794643, -0.2263482, -2.594383, 1, 0, 0, 1, 1,
-0.5738982, -0.2864325, -1.445059, 1, 0, 0, 1, 1,
-0.5624658, -0.2805155, -2.61314, 0, 0, 0, 1, 1,
-0.5588348, 0.817067, 1.42618, 0, 0, 0, 1, 1,
-0.5559979, 0.2398557, -0.4267973, 0, 0, 0, 1, 1,
-0.5530237, -1.001817, -4.05552, 0, 0, 0, 1, 1,
-0.552689, -0.06587751, -3.010903, 0, 0, 0, 1, 1,
-0.552343, -2.540964, -3.446065, 0, 0, 0, 1, 1,
-0.5502235, 1.378989, -0.4162448, 0, 0, 0, 1, 1,
-0.5499172, -0.09525961, -2.573992, 1, 1, 1, 1, 1,
-0.5479616, -1.589123, -2.861882, 1, 1, 1, 1, 1,
-0.5465395, 0.3144116, -0.9993293, 1, 1, 1, 1, 1,
-0.5431682, -0.08583913, -0.102957, 1, 1, 1, 1, 1,
-0.5399392, -0.6491696, -2.40013, 1, 1, 1, 1, 1,
-0.5364462, -0.3997538, -1.913983, 1, 1, 1, 1, 1,
-0.5261055, -1.549899, -2.671244, 1, 1, 1, 1, 1,
-0.5247642, -1.489605, -0.9932873, 1, 1, 1, 1, 1,
-0.5236124, -0.1621714, -2.160074, 1, 1, 1, 1, 1,
-0.5195943, 1.253126, 0.9690909, 1, 1, 1, 1, 1,
-0.5181717, -0.5605322, -3.187045, 1, 1, 1, 1, 1,
-0.5156056, 1.295397, 0.05278642, 1, 1, 1, 1, 1,
-0.511628, 1.068462, -1.047101, 1, 1, 1, 1, 1,
-0.5079954, -1.482783, -3.26505, 1, 1, 1, 1, 1,
-0.5059434, -0.5298468, -2.311016, 1, 1, 1, 1, 1,
-0.5057576, -0.7443277, -1.762624, 0, 0, 1, 1, 1,
-0.503879, -1.892043, -3.762307, 1, 0, 0, 1, 1,
-0.5036252, 0.9328104, -0.6807249, 1, 0, 0, 1, 1,
-0.4993426, 0.4039398, -0.1466059, 1, 0, 0, 1, 1,
-0.4978869, 0.561946, -1.446271, 1, 0, 0, 1, 1,
-0.4940402, -0.6131485, -3.72982, 1, 0, 0, 1, 1,
-0.4934074, 1.956368, 0.9113268, 0, 0, 0, 1, 1,
-0.4877433, 2.136701, -1.221941, 0, 0, 0, 1, 1,
-0.4830794, 1.808126, -0.137513, 0, 0, 0, 1, 1,
-0.4813808, 0.05181084, -1.168801, 0, 0, 0, 1, 1,
-0.4742518, 1.05897, 1.116688, 0, 0, 0, 1, 1,
-0.4718609, 0.2165931, -0.2896708, 0, 0, 0, 1, 1,
-0.4708861, -0.8780579, -3.545474, 0, 0, 0, 1, 1,
-0.470377, 1.787537, 0.3113225, 1, 1, 1, 1, 1,
-0.4675146, -0.9366152, -4.323622, 1, 1, 1, 1, 1,
-0.4672851, -1.432312, -2.288023, 1, 1, 1, 1, 1,
-0.4651261, -1.614076, -2.006726, 1, 1, 1, 1, 1,
-0.4649232, -0.2703052, -1.223038, 1, 1, 1, 1, 1,
-0.460407, 0.1930621, -2.258793, 1, 1, 1, 1, 1,
-0.4488894, -0.5389481, -1.657284, 1, 1, 1, 1, 1,
-0.4458856, 0.4754615, -1.771008, 1, 1, 1, 1, 1,
-0.4456812, 0.4336112, 0.2358082, 1, 1, 1, 1, 1,
-0.4430434, -1.952568, -2.764872, 1, 1, 1, 1, 1,
-0.441433, -2.163147, -1.71986, 1, 1, 1, 1, 1,
-0.44076, 1.11568, -0.3811941, 1, 1, 1, 1, 1,
-0.4391757, -0.06329509, -0.8985413, 1, 1, 1, 1, 1,
-0.4371716, 1.137533, -0.8777011, 1, 1, 1, 1, 1,
-0.4309622, -1.774206, -2.280564, 1, 1, 1, 1, 1,
-0.4308938, -0.1288972, -2.009268, 0, 0, 1, 1, 1,
-0.4308196, 0.9567471, -0.03740251, 1, 0, 0, 1, 1,
-0.4277981, -0.04790298, -0.9899632, 1, 0, 0, 1, 1,
-0.4206959, 0.4813198, 0.3514161, 1, 0, 0, 1, 1,
-0.4199221, -0.6090404, -2.374499, 1, 0, 0, 1, 1,
-0.4120825, 0.06307153, 0.4419751, 1, 0, 0, 1, 1,
-0.411627, 0.6836649, -2.177188, 0, 0, 0, 1, 1,
-0.404568, 0.3675709, 0.5430374, 0, 0, 0, 1, 1,
-0.4027894, -0.5128698, -3.021667, 0, 0, 0, 1, 1,
-0.3987386, 0.7513277, -1.132967, 0, 0, 0, 1, 1,
-0.398593, -1.806138, -2.281687, 0, 0, 0, 1, 1,
-0.3909402, -1.130281, -2.712189, 0, 0, 0, 1, 1,
-0.3906832, -1.392102, -2.990332, 0, 0, 0, 1, 1,
-0.3846208, -0.2211984, -2.320068, 1, 1, 1, 1, 1,
-0.383478, -1.200576, -2.789503, 1, 1, 1, 1, 1,
-0.3811815, 0.8105136, -3.195506, 1, 1, 1, 1, 1,
-0.3810431, 1.085437, -1.437443, 1, 1, 1, 1, 1,
-0.3808769, 1.05768, -1.6458, 1, 1, 1, 1, 1,
-0.380255, 0.1942115, -0.7869895, 1, 1, 1, 1, 1,
-0.3789931, 1.523337, 2.163451, 1, 1, 1, 1, 1,
-0.377259, 0.08139349, -2.046482, 1, 1, 1, 1, 1,
-0.3747591, 0.4329687, -1.855816, 1, 1, 1, 1, 1,
-0.3722408, -0.7029808, -3.816721, 1, 1, 1, 1, 1,
-0.371511, 0.2787244, -1.127026, 1, 1, 1, 1, 1,
-0.3688816, 0.1292796, -1.969849, 1, 1, 1, 1, 1,
-0.3666815, 0.9834093, 0.3775521, 1, 1, 1, 1, 1,
-0.3656786, 0.2305854, -2.40578, 1, 1, 1, 1, 1,
-0.3636676, 0.3898226, 0.2722296, 1, 1, 1, 1, 1,
-0.3632972, -1.058172, -3.799909, 0, 0, 1, 1, 1,
-0.3589083, 0.6253222, -0.4951183, 1, 0, 0, 1, 1,
-0.3561605, 0.1373774, -1.5275, 1, 0, 0, 1, 1,
-0.3443853, -1.196404, -0.8909339, 1, 0, 0, 1, 1,
-0.3377665, 0.03586868, -1.993167, 1, 0, 0, 1, 1,
-0.3362904, -1.490905, -1.086517, 1, 0, 0, 1, 1,
-0.3355148, 1.670366, -1.072223, 0, 0, 0, 1, 1,
-0.3339334, -1.406071, -1.110144, 0, 0, 0, 1, 1,
-0.3315029, 0.1467005, -1.63777, 0, 0, 0, 1, 1,
-0.3285353, 0.5818412, -1.073775, 0, 0, 0, 1, 1,
-0.3268775, 1.171928, -0.6049539, 0, 0, 0, 1, 1,
-0.3244896, 0.1856329, -0.2757008, 0, 0, 0, 1, 1,
-0.322337, 0.2475053, -0.7814512, 0, 0, 0, 1, 1,
-0.3213788, -0.293298, -2.697474, 1, 1, 1, 1, 1,
-0.3192535, -1.375349, -2.508911, 1, 1, 1, 1, 1,
-0.3172752, -0.6519935, -5.047664, 1, 1, 1, 1, 1,
-0.3156717, -0.3725377, -3.573854, 1, 1, 1, 1, 1,
-0.3125995, -0.7927371, -4.804629, 1, 1, 1, 1, 1,
-0.3071179, -1.036548, -2.597344, 1, 1, 1, 1, 1,
-0.3059701, -0.1845876, -2.244795, 1, 1, 1, 1, 1,
-0.305769, -0.3553447, -3.428252, 1, 1, 1, 1, 1,
-0.3051288, 0.1153362, -1.538513, 1, 1, 1, 1, 1,
-0.3028008, -0.5979745, -3.058973, 1, 1, 1, 1, 1,
-0.2949935, 1.71716, 0.6419106, 1, 1, 1, 1, 1,
-0.2829869, -0.2696033, -2.334125, 1, 1, 1, 1, 1,
-0.2768577, 1.854936, 0.1831205, 1, 1, 1, 1, 1,
-0.2702591, -1.04269, -2.908141, 1, 1, 1, 1, 1,
-0.2698287, -0.304726, -3.667645, 1, 1, 1, 1, 1,
-0.2673497, -0.7644296, -4.264966, 0, 0, 1, 1, 1,
-0.2666462, -0.002216978, -0.8114058, 1, 0, 0, 1, 1,
-0.266555, 1.828272, 0.2149589, 1, 0, 0, 1, 1,
-0.2637742, 0.1779113, -1.495609, 1, 0, 0, 1, 1,
-0.2626148, -0.4483068, -2.960583, 1, 0, 0, 1, 1,
-0.2620736, -0.6244903, -3.000244, 1, 0, 0, 1, 1,
-0.2596592, -0.7108377, -1.392894, 0, 0, 0, 1, 1,
-0.2564756, -0.7449847, -3.033864, 0, 0, 0, 1, 1,
-0.2526802, -0.2785967, -1.444371, 0, 0, 0, 1, 1,
-0.2508309, -0.5844977, -2.776515, 0, 0, 0, 1, 1,
-0.2486518, -0.07436074, -0.9851052, 0, 0, 0, 1, 1,
-0.2480921, -0.09145898, -2.47541, 0, 0, 0, 1, 1,
-0.2442386, 0.07870081, -0.758298, 0, 0, 0, 1, 1,
-0.2358168, -0.8141682, -0.3502033, 1, 1, 1, 1, 1,
-0.2323796, 0.5584569, -1.948794, 1, 1, 1, 1, 1,
-0.2315321, 0.6587303, 1.109635, 1, 1, 1, 1, 1,
-0.231072, 0.5957504, -2.572567, 1, 1, 1, 1, 1,
-0.2301725, 0.298314, -1.216304, 1, 1, 1, 1, 1,
-0.2289138, 1.381273, -0.7031901, 1, 1, 1, 1, 1,
-0.2254127, -0.1128718, -3.108778, 1, 1, 1, 1, 1,
-0.2248269, -1.238729, -2.975568, 1, 1, 1, 1, 1,
-0.2235786, -0.4068336, -3.81777, 1, 1, 1, 1, 1,
-0.2235221, 2.73344, -0.6460256, 1, 1, 1, 1, 1,
-0.220221, -1.534153, -3.880548, 1, 1, 1, 1, 1,
-0.2195166, 1.404976, 0.608859, 1, 1, 1, 1, 1,
-0.2181135, 0.3478842, -0.9986176, 1, 1, 1, 1, 1,
-0.2165474, -0.1358616, -3.177681, 1, 1, 1, 1, 1,
-0.2093567, -1.861504, -1.881435, 1, 1, 1, 1, 1,
-0.2080169, 0.3917235, 0.3428556, 0, 0, 1, 1, 1,
-0.2063611, -1.474069, -3.144557, 1, 0, 0, 1, 1,
-0.204634, 2.375509, 0.4053738, 1, 0, 0, 1, 1,
-0.2045609, -0.4666642, -2.955298, 1, 0, 0, 1, 1,
-0.2036165, 0.3295042, -0.3413979, 1, 0, 0, 1, 1,
-0.2023691, -0.8518988, 0.5427068, 1, 0, 0, 1, 1,
-0.2016302, -0.6727415, -2.755962, 0, 0, 0, 1, 1,
-0.1958156, 0.914014, -0.3346618, 0, 0, 0, 1, 1,
-0.1957289, -1.695423, -2.05241, 0, 0, 0, 1, 1,
-0.1955271, 1.657661, -1.246965, 0, 0, 0, 1, 1,
-0.1942106, 0.3187844, -0.1974481, 0, 0, 0, 1, 1,
-0.1916001, -0.7408711, -3.893287, 0, 0, 0, 1, 1,
-0.189553, 1.202071, -1.686671, 0, 0, 0, 1, 1,
-0.1833847, -0.8844201, -2.04335, 1, 1, 1, 1, 1,
-0.1779368, -0.08710457, -2.749487, 1, 1, 1, 1, 1,
-0.1775138, 1.389878, -1.321118, 1, 1, 1, 1, 1,
-0.1759482, -1.543198, -3.997396, 1, 1, 1, 1, 1,
-0.1752617, 0.3286593, -1.2151, 1, 1, 1, 1, 1,
-0.1725353, 1.079249, -0.8412386, 1, 1, 1, 1, 1,
-0.1610425, -2.040629, -1.184611, 1, 1, 1, 1, 1,
-0.1592898, -1.174216, -3.784786, 1, 1, 1, 1, 1,
-0.1582249, 0.1354158, -2.563758, 1, 1, 1, 1, 1,
-0.1581302, -0.04249931, -1.570666, 1, 1, 1, 1, 1,
-0.1577708, 1.47853, 1.566478, 1, 1, 1, 1, 1,
-0.1575256, 0.04923607, 0.09842072, 1, 1, 1, 1, 1,
-0.1562804, -2.033098, -0.5736106, 1, 1, 1, 1, 1,
-0.155743, -0.1584204, -0.3517684, 1, 1, 1, 1, 1,
-0.1538223, 0.7997553, 0.1351148, 1, 1, 1, 1, 1,
-0.152877, 0.4987564, 0.1645354, 0, 0, 1, 1, 1,
-0.1520207, 2.165076, -1.800957, 1, 0, 0, 1, 1,
-0.1518746, 1.288182, 0.5986231, 1, 0, 0, 1, 1,
-0.1502835, 1.267519, -0.7409142, 1, 0, 0, 1, 1,
-0.1383072, -0.6727629, -2.577134, 1, 0, 0, 1, 1,
-0.1374124, -1.237511, -2.621903, 1, 0, 0, 1, 1,
-0.1373288, -1.116374, -2.853078, 0, 0, 0, 1, 1,
-0.1371047, 0.5762165, 0.5394, 0, 0, 0, 1, 1,
-0.1369769, -0.4900844, -3.220401, 0, 0, 0, 1, 1,
-0.1333513, 0.5746164, -2.084478, 0, 0, 0, 1, 1,
-0.1315023, -0.5843346, -2.125564, 0, 0, 0, 1, 1,
-0.1302381, -0.3760359, -2.771228, 0, 0, 0, 1, 1,
-0.1300557, 1.41969, 0.2835164, 0, 0, 0, 1, 1,
-0.1293482, 0.5918964, -0.1046925, 1, 1, 1, 1, 1,
-0.12705, 0.6898916, -0.7526157, 1, 1, 1, 1, 1,
-0.1170557, 0.831532, -0.7561159, 1, 1, 1, 1, 1,
-0.1160964, -1.885538, -3.277161, 1, 1, 1, 1, 1,
-0.1145131, -0.6794791, -3.521513, 1, 1, 1, 1, 1,
-0.1061425, -0.3412974, -2.818776, 1, 1, 1, 1, 1,
-0.1052207, 0.6752806, 0.02755594, 1, 1, 1, 1, 1,
-0.1037591, 1.205741, 0.9275203, 1, 1, 1, 1, 1,
-0.09262647, 1.369607, -0.991587, 1, 1, 1, 1, 1,
-0.09042316, 0.1144138, -0.8210918, 1, 1, 1, 1, 1,
-0.08538363, -1.542669, -3.175445, 1, 1, 1, 1, 1,
-0.0816539, 0.06983966, 1.1604, 1, 1, 1, 1, 1,
-0.08060436, 0.9310223, -0.3341404, 1, 1, 1, 1, 1,
-0.08013079, 0.1675381, -1.055455, 1, 1, 1, 1, 1,
-0.07943941, 0.291622, -0.07907504, 1, 1, 1, 1, 1,
-0.07785634, -0.672371, -2.448673, 0, 0, 1, 1, 1,
-0.0744148, -0.9062032, -2.645085, 1, 0, 0, 1, 1,
-0.07287911, 0.07013412, -2.328938, 1, 0, 0, 1, 1,
-0.07183423, -0.2989538, -2.342135, 1, 0, 0, 1, 1,
-0.06282269, 0.1554054, -1.464166, 1, 0, 0, 1, 1,
-0.06262863, 0.9487091, -0.350207, 1, 0, 0, 1, 1,
-0.06003493, -1.063223, -3.117441, 0, 0, 0, 1, 1,
-0.05106791, -1.122083, -2.751085, 0, 0, 0, 1, 1,
-0.05014274, 2.013422, -1.519112, 0, 0, 0, 1, 1,
-0.05003982, -1.219511, -1.37288, 0, 0, 0, 1, 1,
-0.04188373, -1.305809, -2.557207, 0, 0, 0, 1, 1,
-0.03913097, 0.1509712, 0.1268478, 0, 0, 0, 1, 1,
-0.03847104, 1.055906, 0.8585293, 0, 0, 0, 1, 1,
-0.03553926, 0.03456989, 0.08626182, 1, 1, 1, 1, 1,
-0.0295813, -0.0912274, -2.770934, 1, 1, 1, 1, 1,
-0.02870061, -0.8815201, -2.411193, 1, 1, 1, 1, 1,
-0.0272081, -0.8282813, -1.986876, 1, 1, 1, 1, 1,
-0.02688561, -0.05535862, -3.05484, 1, 1, 1, 1, 1,
-0.02679585, -0.1480585, -1.548303, 1, 1, 1, 1, 1,
-0.02615842, -1.37107, -2.784822, 1, 1, 1, 1, 1,
-0.02518514, -1.730268, -2.836137, 1, 1, 1, 1, 1,
-0.02003648, 1.056796, 0.3521502, 1, 1, 1, 1, 1,
-0.0147911, 0.164551, -1.297922, 1, 1, 1, 1, 1,
-0.00648639, -0.5030013, -1.782977, 1, 1, 1, 1, 1,
0.001307291, -0.09637461, 1.717635, 1, 1, 1, 1, 1,
0.00131968, -0.1372245, 5.022261, 1, 1, 1, 1, 1,
0.002334161, -0.8627865, 2.514401, 1, 1, 1, 1, 1,
0.005796602, -1.039109, 2.068531, 1, 1, 1, 1, 1,
0.01353917, -1.287717, 3.384096, 0, 0, 1, 1, 1,
0.01402734, -1.160745, 2.462537, 1, 0, 0, 1, 1,
0.01526177, -0.4936683, 4.88251, 1, 0, 0, 1, 1,
0.01535752, 0.2118162, -1.749354, 1, 0, 0, 1, 1,
0.01790508, -0.6776667, 2.250052, 1, 0, 0, 1, 1,
0.02274913, 1.009166, -0.3182184, 1, 0, 0, 1, 1,
0.02405257, -0.7045728, 4.963654, 0, 0, 0, 1, 1,
0.02694961, 0.7145947, 0.2349007, 0, 0, 0, 1, 1,
0.02869094, -0.8922709, 4.061616, 0, 0, 0, 1, 1,
0.03234308, 0.3108627, 1.150225, 0, 0, 0, 1, 1,
0.03257163, 2.512882, 0.05303985, 0, 0, 0, 1, 1,
0.03411074, 2.293145, -1.226557, 0, 0, 0, 1, 1,
0.0367871, 0.8937768, 0.7258322, 0, 0, 0, 1, 1,
0.04068865, 0.6014453, -2.013082, 1, 1, 1, 1, 1,
0.04206688, -0.6836391, 2.460118, 1, 1, 1, 1, 1,
0.04450633, -0.832552, 3.435908, 1, 1, 1, 1, 1,
0.04891733, 1.919586, 1.515634, 1, 1, 1, 1, 1,
0.05038661, -1.837701, 2.335918, 1, 1, 1, 1, 1,
0.05077221, 1.020591, -1.212996, 1, 1, 1, 1, 1,
0.0548802, -1.931807, 2.113236, 1, 1, 1, 1, 1,
0.05505011, -0.8761714, 3.950584, 1, 1, 1, 1, 1,
0.05597191, 0.892607, 0.6377875, 1, 1, 1, 1, 1,
0.05804426, 1.066365, -0.4352885, 1, 1, 1, 1, 1,
0.0610521, 0.007306837, 0.6905617, 1, 1, 1, 1, 1,
0.06133153, 0.11873, 0.3852932, 1, 1, 1, 1, 1,
0.06147683, -0.9722747, 3.714021, 1, 1, 1, 1, 1,
0.0615512, -1.898367, 0.9215795, 1, 1, 1, 1, 1,
0.06171711, -0.3680816, 4.083737, 1, 1, 1, 1, 1,
0.06185905, 1.017674, -0.5500156, 0, 0, 1, 1, 1,
0.06322566, -0.1372182, 3.373749, 1, 0, 0, 1, 1,
0.06508101, 0.3177108, 2.718664, 1, 0, 0, 1, 1,
0.06529497, 1.557123, -0.3767484, 1, 0, 0, 1, 1,
0.06582804, 0.1262185, 0.9827639, 1, 0, 0, 1, 1,
0.06608109, 0.7514891, 0.4123154, 1, 0, 0, 1, 1,
0.07099058, 1.108677, 1.645962, 0, 0, 0, 1, 1,
0.07286959, 0.8033311, 1.728726, 0, 0, 0, 1, 1,
0.07430803, -0.8836088, 4.137395, 0, 0, 0, 1, 1,
0.07996997, -0.2749658, 2.824151, 0, 0, 0, 1, 1,
0.08096652, 1.22309, -0.7496631, 0, 0, 0, 1, 1,
0.0837917, -0.1947093, 4.166119, 0, 0, 0, 1, 1,
0.08485565, -0.7033317, 1.86405, 0, 0, 0, 1, 1,
0.08934933, -0.1686063, 2.205406, 1, 1, 1, 1, 1,
0.09069443, -1.584449, 3.243361, 1, 1, 1, 1, 1,
0.09077789, -0.715767, 2.786901, 1, 1, 1, 1, 1,
0.0917779, 0.146827, -0.476966, 1, 1, 1, 1, 1,
0.09321291, -1.467434, 3.423987, 1, 1, 1, 1, 1,
0.09510258, -0.6460751, 3.296504, 1, 1, 1, 1, 1,
0.09675357, 1.654635, -0.2012249, 1, 1, 1, 1, 1,
0.09686519, 0.5934436, 0.8318728, 1, 1, 1, 1, 1,
0.09856746, 0.3096693, 0.7492787, 1, 1, 1, 1, 1,
0.09943065, -1.068402, 3.539946, 1, 1, 1, 1, 1,
0.1002392, -0.3308625, 2.343827, 1, 1, 1, 1, 1,
0.1012922, 0.8420901, -1.201021, 1, 1, 1, 1, 1,
0.1019096, -0.582544, 4.077123, 1, 1, 1, 1, 1,
0.1029101, 1.035949, 0.7496521, 1, 1, 1, 1, 1,
0.1062412, -0.670684, 2.195753, 1, 1, 1, 1, 1,
0.1100376, 1.270266, -1.11826, 0, 0, 1, 1, 1,
0.110749, -0.282739, 3.513843, 1, 0, 0, 1, 1,
0.1110713, -0.5672167, 1.868647, 1, 0, 0, 1, 1,
0.1137398, 1.190596, -1.134002, 1, 0, 0, 1, 1,
0.1149218, -0.8216229, 2.321931, 1, 0, 0, 1, 1,
0.1157644, -0.3650194, 0.3604774, 1, 0, 0, 1, 1,
0.1166527, -2.110786, 4.065463, 0, 0, 0, 1, 1,
0.1190953, -0.1154524, 2.38538, 0, 0, 0, 1, 1,
0.1194775, 1.260097, 1.903423, 0, 0, 0, 1, 1,
0.123131, 0.7513879, 0.7094234, 0, 0, 0, 1, 1,
0.1248907, -0.5897959, 0.1286315, 0, 0, 0, 1, 1,
0.1266294, -0.04437496, 2.229615, 0, 0, 0, 1, 1,
0.1305173, -0.2008388, 3.729199, 0, 0, 0, 1, 1,
0.1340243, -1.066187, 2.832875, 1, 1, 1, 1, 1,
0.1353592, -1.026935, 2.944285, 1, 1, 1, 1, 1,
0.1488079, 0.6191806, 1.920752, 1, 1, 1, 1, 1,
0.1518982, -0.5903078, 4.152776, 1, 1, 1, 1, 1,
0.1565967, 1.157297, -1.433731, 1, 1, 1, 1, 1,
0.1581108, -3.042637, 1.82639, 1, 1, 1, 1, 1,
0.1689886, 0.1841898, 0.9406061, 1, 1, 1, 1, 1,
0.1698927, -0.2732145, 2.924276, 1, 1, 1, 1, 1,
0.1734496, -0.7479408, 2.389496, 1, 1, 1, 1, 1,
0.1756589, 0.3848198, -0.07360653, 1, 1, 1, 1, 1,
0.1767314, 0.5925339, 1.005169, 1, 1, 1, 1, 1,
0.1796462, 1.376454, 0.8551909, 1, 1, 1, 1, 1,
0.1804983, 0.8243528, 0.6274698, 1, 1, 1, 1, 1,
0.181958, 0.0008780026, 0.2569211, 1, 1, 1, 1, 1,
0.1893308, -0.04805892, 1.482603, 1, 1, 1, 1, 1,
0.1923481, 0.2252431, -0.3563821, 0, 0, 1, 1, 1,
0.1926445, 0.9482574, -0.5943049, 1, 0, 0, 1, 1,
0.1938941, 0.2372206, 0.04540654, 1, 0, 0, 1, 1,
0.1939995, 0.8982798, -0.008712406, 1, 0, 0, 1, 1,
0.1962207, 1.517518, -0.8461165, 1, 0, 0, 1, 1,
0.1964191, -0.3027622, 3.383016, 1, 0, 0, 1, 1,
0.1964998, -1.187033, 4.265392, 0, 0, 0, 1, 1,
0.1966896, 0.6048266, 1.129723, 0, 0, 0, 1, 1,
0.1984097, 0.9466543, -0.1919231, 0, 0, 0, 1, 1,
0.2012318, 0.7249787, 1.665762, 0, 0, 0, 1, 1,
0.2062304, -2.57221, 2.035285, 0, 0, 0, 1, 1,
0.2066517, 0.4876503, -0.3220433, 0, 0, 0, 1, 1,
0.2071304, -1.132339, 2.454343, 0, 0, 0, 1, 1,
0.2079537, 3.474148, 0.6881829, 1, 1, 1, 1, 1,
0.2086007, 0.5746577, 1.942458, 1, 1, 1, 1, 1,
0.2116804, 0.02777129, 1.558555, 1, 1, 1, 1, 1,
0.2168021, 0.8127292, 1.495939, 1, 1, 1, 1, 1,
0.2189399, -0.4250787, 2.168505, 1, 1, 1, 1, 1,
0.2205762, -0.172458, 0.8396707, 1, 1, 1, 1, 1,
0.2248078, -0.5427491, 2.085602, 1, 1, 1, 1, 1,
0.228733, -0.8104753, 3.756793, 1, 1, 1, 1, 1,
0.2289184, 0.6760763, -1.378121, 1, 1, 1, 1, 1,
0.2331298, 0.7360485, 2.194124, 1, 1, 1, 1, 1,
0.2403501, 0.07851073, 3.43515, 1, 1, 1, 1, 1,
0.2410029, 0.2137914, 1.143865, 1, 1, 1, 1, 1,
0.2496883, -1.408794, 2.054477, 1, 1, 1, 1, 1,
0.2498551, -1.709, 2.546449, 1, 1, 1, 1, 1,
0.2524724, -0.1433987, 2.049963, 1, 1, 1, 1, 1,
0.2654708, -0.1337818, 1.500684, 0, 0, 1, 1, 1,
0.2664172, 1.03658, 2.914116, 1, 0, 0, 1, 1,
0.2705612, -0.6893245, 1.264978, 1, 0, 0, 1, 1,
0.2771007, 0.7003598, 0.2461051, 1, 0, 0, 1, 1,
0.2781049, -0.2525459, 2.586919, 1, 0, 0, 1, 1,
0.2811544, -1.666331, 3.287431, 1, 0, 0, 1, 1,
0.2814698, -0.4694449, 3.903883, 0, 0, 0, 1, 1,
0.287727, -0.10378, 2.659208, 0, 0, 0, 1, 1,
0.2891781, 1.010936, 0.7050213, 0, 0, 0, 1, 1,
0.2906311, -0.1711581, 4.017147, 0, 0, 0, 1, 1,
0.2907802, 2.882668, -0.9183275, 0, 0, 0, 1, 1,
0.3019677, -0.3674252, 4.067451, 0, 0, 0, 1, 1,
0.306219, 0.7793601, 2.042396, 0, 0, 0, 1, 1,
0.3131196, 2.395024, -1.815019, 1, 1, 1, 1, 1,
0.3142955, -0.4114913, 3.01027, 1, 1, 1, 1, 1,
0.3151807, -1.927212, 3.807075, 1, 1, 1, 1, 1,
0.3153016, 1.219417, 1.40581, 1, 1, 1, 1, 1,
0.3158596, -0.7993901, 2.107625, 1, 1, 1, 1, 1,
0.3159913, -1.217004, 3.884494, 1, 1, 1, 1, 1,
0.3161235, -0.5128528, 1.805792, 1, 1, 1, 1, 1,
0.3164905, -1.974154, 3.242926, 1, 1, 1, 1, 1,
0.3168603, 1.165735, -1.08567, 1, 1, 1, 1, 1,
0.3170979, 1.266608, -0.4250291, 1, 1, 1, 1, 1,
0.3209569, 0.8634266, 0.1815421, 1, 1, 1, 1, 1,
0.3221469, 0.3059883, -0.7670689, 1, 1, 1, 1, 1,
0.3222396, 0.5084708, 2.320787, 1, 1, 1, 1, 1,
0.323272, -1.501633, 1.706849, 1, 1, 1, 1, 1,
0.3237613, 0.44924, -0.8596794, 1, 1, 1, 1, 1,
0.3239346, 0.8367306, -0.7060663, 0, 0, 1, 1, 1,
0.3246021, -0.1827707, 2.211713, 1, 0, 0, 1, 1,
0.3252131, -1.234514, 3.252406, 1, 0, 0, 1, 1,
0.3266911, -0.896026, 2.706532, 1, 0, 0, 1, 1,
0.3280986, 0.07955185, 2.900672, 1, 0, 0, 1, 1,
0.3317743, 0.4798615, 0.6926671, 1, 0, 0, 1, 1,
0.3346503, -0.9243437, 4.789944, 0, 0, 0, 1, 1,
0.3350538, 0.3348168, -0.2631304, 0, 0, 0, 1, 1,
0.3367672, 1.58272, 0.09310088, 0, 0, 0, 1, 1,
0.346025, -0.08844513, 3.528173, 0, 0, 0, 1, 1,
0.3498638, 0.8954362, 2.04055, 0, 0, 0, 1, 1,
0.3499142, 1.299911, 1.476462, 0, 0, 0, 1, 1,
0.3538169, 0.7210561, 0.1707321, 0, 0, 0, 1, 1,
0.3541247, -0.9659926, 4.154702, 1, 1, 1, 1, 1,
0.3592687, 1.070161, 0.9709329, 1, 1, 1, 1, 1,
0.3614323, -0.6542152, 1.208998, 1, 1, 1, 1, 1,
0.3635299, -0.5468465, 3.135603, 1, 1, 1, 1, 1,
0.3658423, -0.3057484, 2.380471, 1, 1, 1, 1, 1,
0.3800796, 0.1925768, 0.04755951, 1, 1, 1, 1, 1,
0.3863731, 1.94999, 1.108991, 1, 1, 1, 1, 1,
0.3878224, 0.8086443, 1.941629, 1, 1, 1, 1, 1,
0.3880481, -0.884482, 1.90769, 1, 1, 1, 1, 1,
0.3892564, 1.016303, 2.008896, 1, 1, 1, 1, 1,
0.3908013, 0.7683665, 0.7136505, 1, 1, 1, 1, 1,
0.3940885, -0.0347034, 2.913337, 1, 1, 1, 1, 1,
0.3966898, 1.169337, 1.267044, 1, 1, 1, 1, 1,
0.4021569, 0.2482719, 0.1271852, 1, 1, 1, 1, 1,
0.4036321, 1.439697, -1.54725, 1, 1, 1, 1, 1,
0.4064901, -0.4368568, 0.7808436, 0, 0, 1, 1, 1,
0.4078459, -0.9324052, 3.708377, 1, 0, 0, 1, 1,
0.4094258, -1.368535, 4.829707, 1, 0, 0, 1, 1,
0.4104439, -0.7205458, 3.087873, 1, 0, 0, 1, 1,
0.4135663, -1.654146, 2.807994, 1, 0, 0, 1, 1,
0.4220276, 0.7171338, 1.645053, 1, 0, 0, 1, 1,
0.426192, 0.6543455, -0.2387678, 0, 0, 0, 1, 1,
0.4279019, 1.267241, -0.1497529, 0, 0, 0, 1, 1,
0.4300863, 0.8177738, -0.5875648, 0, 0, 0, 1, 1,
0.4303571, -0.09711832, 2.398285, 0, 0, 0, 1, 1,
0.4371896, -1.463985, 2.692684, 0, 0, 0, 1, 1,
0.4394143, -0.9504924, 4.005903, 0, 0, 0, 1, 1,
0.4466618, -1.583811, 2.58532, 0, 0, 0, 1, 1,
0.4487124, -0.02267483, 2.77877, 1, 1, 1, 1, 1,
0.4497125, 1.822323, 0.2419553, 1, 1, 1, 1, 1,
0.4517018, 0.1142951, 1.073647, 1, 1, 1, 1, 1,
0.4522939, -1.465745, 3.319841, 1, 1, 1, 1, 1,
0.4574112, -2.064999, 2.987358, 1, 1, 1, 1, 1,
0.4627227, 0.5020316, -0.2482072, 1, 1, 1, 1, 1,
0.4634816, 0.602992, 1.118343, 1, 1, 1, 1, 1,
0.4661824, -1.066692, 2.718775, 1, 1, 1, 1, 1,
0.4726643, -0.8236031, 3.312506, 1, 1, 1, 1, 1,
0.479164, 2.026155, 1.725326, 1, 1, 1, 1, 1,
0.4833762, -0.9874915, 2.981389, 1, 1, 1, 1, 1,
0.4857121, 0.9804825, 0.2453471, 1, 1, 1, 1, 1,
0.4866476, 1.51887, -1.206858, 1, 1, 1, 1, 1,
0.4953994, -2.400616, 2.493906, 1, 1, 1, 1, 1,
0.5017081, 0.4607251, 1.479819, 1, 1, 1, 1, 1,
0.5110126, 0.3814051, 2.388873, 0, 0, 1, 1, 1,
0.512092, -1.135562, 2.864497, 1, 0, 0, 1, 1,
0.5128779, 0.2184609, -0.7354363, 1, 0, 0, 1, 1,
0.5167461, -0.5738714, 2.029421, 1, 0, 0, 1, 1,
0.516881, 2.149159, -0.8984879, 1, 0, 0, 1, 1,
0.5203909, -0.9602073, 2.654838, 1, 0, 0, 1, 1,
0.5235052, -0.07306721, 1.221207, 0, 0, 0, 1, 1,
0.5250327, -1.365993, 3.583298, 0, 0, 0, 1, 1,
0.5258884, -1.952071, 3.175481, 0, 0, 0, 1, 1,
0.530752, -0.2514482, 0.5717118, 0, 0, 0, 1, 1,
0.5334513, -0.7475293, 1.184849, 0, 0, 0, 1, 1,
0.5336323, 0.5881613, 1.541345, 0, 0, 0, 1, 1,
0.5490891, -0.9629687, 3.258909, 0, 0, 0, 1, 1,
0.5575994, 1.259586, 1.918512, 1, 1, 1, 1, 1,
0.5593555, -0.01594063, 1.5649, 1, 1, 1, 1, 1,
0.5602083, -1.699584, 3.52766, 1, 1, 1, 1, 1,
0.5611635, -1.508046, 3.417211, 1, 1, 1, 1, 1,
0.5624158, 0.07255319, 1.539268, 1, 1, 1, 1, 1,
0.5636888, 0.85038, 0.4591965, 1, 1, 1, 1, 1,
0.5720229, -0.3844283, 3.833641, 1, 1, 1, 1, 1,
0.5729746, -0.7311585, 2.650795, 1, 1, 1, 1, 1,
0.5734651, 1.171663, 0.7330958, 1, 1, 1, 1, 1,
0.5739363, 0.5191655, 1.841677, 1, 1, 1, 1, 1,
0.5754724, -0.8258731, 3.830936, 1, 1, 1, 1, 1,
0.5763602, -0.2908973, 0.6307689, 1, 1, 1, 1, 1,
0.5792909, -0.6258414, 2.345159, 1, 1, 1, 1, 1,
0.5825401, 0.9343066, -1.370437, 1, 1, 1, 1, 1,
0.5881938, -0.6528348, 1.988679, 1, 1, 1, 1, 1,
0.5899722, -2.180269, 2.011711, 0, 0, 1, 1, 1,
0.5951667, 1.275267, 0.4512663, 1, 0, 0, 1, 1,
0.6033677, -0.6582981, 2.312639, 1, 0, 0, 1, 1,
0.6056787, 1.988295, 2.227624, 1, 0, 0, 1, 1,
0.6062936, -0.1002697, 2.077657, 1, 0, 0, 1, 1,
0.6104437, -0.003222359, 1.285925, 1, 0, 0, 1, 1,
0.6114817, 0.6583325, 0.8870808, 0, 0, 0, 1, 1,
0.6133331, -0.3498884, 0.5345615, 0, 0, 0, 1, 1,
0.6150931, 0.5807319, 1.196456, 0, 0, 0, 1, 1,
0.6260909, -0.4802637, 1.454047, 0, 0, 0, 1, 1,
0.627471, -0.2220408, 2.986051, 0, 0, 0, 1, 1,
0.6276426, -1.128053, 1.755963, 0, 0, 0, 1, 1,
0.6298689, -0.8838825, 3.206171, 0, 0, 0, 1, 1,
0.6344012, -0.09814939, 2.220778, 1, 1, 1, 1, 1,
0.6349262, 0.3344266, 1.227727, 1, 1, 1, 1, 1,
0.6429439, -0.08493929, 1.73678, 1, 1, 1, 1, 1,
0.6479675, -1.168825, 3.98517, 1, 1, 1, 1, 1,
0.6500604, -0.3401629, 3.600085, 1, 1, 1, 1, 1,
0.6508107, -0.1388332, 1.275194, 1, 1, 1, 1, 1,
0.6527232, 2.25897, -1.434538, 1, 1, 1, 1, 1,
0.6570506, -0.7503524, 0.5145945, 1, 1, 1, 1, 1,
0.6571757, 0.6948327, 2.324412, 1, 1, 1, 1, 1,
0.6600854, -0.9292026, 1.300356, 1, 1, 1, 1, 1,
0.6610569, -0.8972605, 2.415608, 1, 1, 1, 1, 1,
0.6669168, -0.2732392, 0.8086283, 1, 1, 1, 1, 1,
0.6670839, 0.6126788, 1.399184, 1, 1, 1, 1, 1,
0.6721246, 0.7085777, 0.4719569, 1, 1, 1, 1, 1,
0.6731656, -1.738863, 3.813327, 1, 1, 1, 1, 1,
0.676144, -0.4669774, 3.211119, 0, 0, 1, 1, 1,
0.6796432, 0.09601073, 1.855314, 1, 0, 0, 1, 1,
0.6811171, -0.2573467, 1.183004, 1, 0, 0, 1, 1,
0.6816445, 1.67075, -0.5654977, 1, 0, 0, 1, 1,
0.6817306, 1.39131, 0.6913363, 1, 0, 0, 1, 1,
0.6833676, 1.679893, -0.7920714, 1, 0, 0, 1, 1,
0.6854733, 1.092733, 0.9352367, 0, 0, 0, 1, 1,
0.6874499, 0.8925332, -0.08937482, 0, 0, 0, 1, 1,
0.6905841, -0.5979348, 3.857181, 0, 0, 0, 1, 1,
0.6918329, -2.618339, 4.107097, 0, 0, 0, 1, 1,
0.6991016, 1.005831, 0.3860403, 0, 0, 0, 1, 1,
0.7036278, -1.29398, 2.942712, 0, 0, 0, 1, 1,
0.7043241, -0.8643808, 2.719486, 0, 0, 0, 1, 1,
0.7116737, 0.05362711, 2.365745, 1, 1, 1, 1, 1,
0.7147414, 1.643221, 1.162841, 1, 1, 1, 1, 1,
0.7278655, 0.7569978, 1.127103, 1, 1, 1, 1, 1,
0.7278679, -0.289142, 1.251996, 1, 1, 1, 1, 1,
0.7288338, -0.1301475, 1.746582, 1, 1, 1, 1, 1,
0.7332172, -0.085505, 2.121691, 1, 1, 1, 1, 1,
0.7407486, 0.9152076, 2.30718, 1, 1, 1, 1, 1,
0.747273, 0.08934639, 1.306707, 1, 1, 1, 1, 1,
0.7521055, -0.8484774, 3.341441, 1, 1, 1, 1, 1,
0.7525644, -2.079543, 1.783336, 1, 1, 1, 1, 1,
0.7537333, 0.4292462, 0.4792287, 1, 1, 1, 1, 1,
0.7595271, -0.5921082, 3.106823, 1, 1, 1, 1, 1,
0.7655197, -0.8342637, 1.675788, 1, 1, 1, 1, 1,
0.766184, -0.5394199, 0.5028624, 1, 1, 1, 1, 1,
0.7733159, 0.3792438, 2.061256, 1, 1, 1, 1, 1,
0.7759847, -2.361067, 0.7200489, 0, 0, 1, 1, 1,
0.7781582, 0.07348406, -0.01191432, 1, 0, 0, 1, 1,
0.7946289, 0.4519695, -0.2618544, 1, 0, 0, 1, 1,
0.7989051, -0.5737615, 3.118482, 1, 0, 0, 1, 1,
0.8005297, 1.154791, -0.1071146, 1, 0, 0, 1, 1,
0.8026539, -0.1855572, 4.600719, 1, 0, 0, 1, 1,
0.8043086, 1.27647, 1.647768, 0, 0, 0, 1, 1,
0.8044723, -0.2062523, 0.9935709, 0, 0, 0, 1, 1,
0.8072144, -1.597977, 3.590273, 0, 0, 0, 1, 1,
0.8141536, -0.8928481, 3.400213, 0, 0, 0, 1, 1,
0.8150361, 1.824858, 0.3067622, 0, 0, 0, 1, 1,
0.8159436, 0.6561622, 2.482384, 0, 0, 0, 1, 1,
0.8175946, -0.5575339, 2.180967, 0, 0, 0, 1, 1,
0.8209245, 0.6335241, 0.9310203, 1, 1, 1, 1, 1,
0.8295516, 0.8297254, -0.08403332, 1, 1, 1, 1, 1,
0.8332817, -0.7782592, 2.158177, 1, 1, 1, 1, 1,
0.8336931, -2.27002, 3.580183, 1, 1, 1, 1, 1,
0.8368571, -0.9795395, 2.805566, 1, 1, 1, 1, 1,
0.8394663, -0.8015807, 1.006832, 1, 1, 1, 1, 1,
0.8401632, 0.6217309, -0.7314916, 1, 1, 1, 1, 1,
0.8446498, -1.673524, 2.093292, 1, 1, 1, 1, 1,
0.8501254, 0.812866, 3.084631, 1, 1, 1, 1, 1,
0.8585576, 1.532523, -0.3086934, 1, 1, 1, 1, 1,
0.8671786, -1.033782, 3.705065, 1, 1, 1, 1, 1,
0.8687495, -1.19056, 3.258379, 1, 1, 1, 1, 1,
0.8687733, -0.5687929, 0.8599172, 1, 1, 1, 1, 1,
0.8694556, 0.6655413, 0.6962836, 1, 1, 1, 1, 1,
0.8711159, -1.337108, 3.484257, 1, 1, 1, 1, 1,
0.8721455, 1.198297, 2.77117, 0, 0, 1, 1, 1,
0.8721522, -1.304459, 2.186102, 1, 0, 0, 1, 1,
0.8739454, -0.5603046, 3.349056, 1, 0, 0, 1, 1,
0.8754478, 0.4691212, 1.187368, 1, 0, 0, 1, 1,
0.8793728, -0.312452, 1.809312, 1, 0, 0, 1, 1,
0.8843361, 0.2861579, 0.3099912, 1, 0, 0, 1, 1,
0.8909388, -0.4302765, -0.1183702, 0, 0, 0, 1, 1,
0.8957092, 0.2362335, 2.568154, 0, 0, 0, 1, 1,
0.8972574, -1.011567, 5.492003, 0, 0, 0, 1, 1,
0.8999366, 0.08852687, 1.239741, 0, 0, 0, 1, 1,
0.9050217, -0.7845511, 3.545558, 0, 0, 0, 1, 1,
0.906129, -0.3920124, 1.387152, 0, 0, 0, 1, 1,
0.906692, 1.126197, -0.05685781, 0, 0, 0, 1, 1,
0.9108086, -1.907053, 3.059182, 1, 1, 1, 1, 1,
0.9140425, 0.6321314, 2.840271, 1, 1, 1, 1, 1,
0.9179192, 0.7527677, 1.802402, 1, 1, 1, 1, 1,
0.928825, 0.2269693, 1.204224, 1, 1, 1, 1, 1,
0.9313799, -0.8287881, 2.213924, 1, 1, 1, 1, 1,
0.9349904, 0.3385081, 0.4897648, 1, 1, 1, 1, 1,
0.9353776, -0.4672073, 2.993626, 1, 1, 1, 1, 1,
0.9358449, -1.057014, 2.860075, 1, 1, 1, 1, 1,
0.9412816, 0.5720659, -0.4610508, 1, 1, 1, 1, 1,
0.9450787, 1.032292, 0.9200515, 1, 1, 1, 1, 1,
0.9554051, -0.6923406, 2.717142, 1, 1, 1, 1, 1,
0.9606131, -0.002097191, 3.608079, 1, 1, 1, 1, 1,
0.9657207, -1.159733, 2.794211, 1, 1, 1, 1, 1,
0.9665483, 0.5879526, 0.6741125, 1, 1, 1, 1, 1,
0.9754071, 0.5587646, -0.8549444, 1, 1, 1, 1, 1,
0.9756094, 0.3946523, 1.658643, 0, 0, 1, 1, 1,
0.9760018, 0.5962159, -0.1908934, 1, 0, 0, 1, 1,
0.9761696, 0.2786108, 1.647502, 1, 0, 0, 1, 1,
0.9775698, 1.249868, 1.798836, 1, 0, 0, 1, 1,
0.9788, 1.22102, 0.7040584, 1, 0, 0, 1, 1,
0.9839718, -1.159106, 2.284977, 1, 0, 0, 1, 1,
0.9886602, -2.573625, 1.561916, 0, 0, 0, 1, 1,
0.9976226, -0.7218117, 1.976034, 0, 0, 0, 1, 1,
1.003127, -0.04894141, 1.271831, 0, 0, 0, 1, 1,
1.006688, 0.1243506, 2.593565, 0, 0, 0, 1, 1,
1.007168, -3.217814, 3.934971, 0, 0, 0, 1, 1,
1.015414, 0.2340814, -0.6150748, 0, 0, 0, 1, 1,
1.018878, 0.5336831, 2.507777, 0, 0, 0, 1, 1,
1.020824, -0.6984281, 1.252903, 1, 1, 1, 1, 1,
1.031432, -0.7706133, 1.325817, 1, 1, 1, 1, 1,
1.038, 0.7697751, 0.4814745, 1, 1, 1, 1, 1,
1.044997, -0.3838473, 2.169679, 1, 1, 1, 1, 1,
1.058385, 0.5527604, 0.7681, 1, 1, 1, 1, 1,
1.060709, -1.599191, 1.413015, 1, 1, 1, 1, 1,
1.063855, -0.9412855, 1.314185, 1, 1, 1, 1, 1,
1.065244, 1.731518, 1.267333, 1, 1, 1, 1, 1,
1.071859, 1.069702, -0.1264193, 1, 1, 1, 1, 1,
1.0744, 1.675826, 1.12763, 1, 1, 1, 1, 1,
1.080308, -2.032351, 2.337723, 1, 1, 1, 1, 1,
1.09004, 0.5866818, 0.693423, 1, 1, 1, 1, 1,
1.092529, 0.700605, 0.3071918, 1, 1, 1, 1, 1,
1.095751, 0.01357256, 0.6991056, 1, 1, 1, 1, 1,
1.103213, -0.5259422, -0.8205733, 1, 1, 1, 1, 1,
1.105845, 0.4747239, 2.186235, 0, 0, 1, 1, 1,
1.108439, -0.226721, 2.992571, 1, 0, 0, 1, 1,
1.1092, -0.2005648, 2.647066, 1, 0, 0, 1, 1,
1.119808, 1.260351, 0.04459752, 1, 0, 0, 1, 1,
1.121332, -1.481448, 3.218971, 1, 0, 0, 1, 1,
1.124808, -0.9368818, 2.504711, 1, 0, 0, 1, 1,
1.125755, 0.6161055, 1.671713, 0, 0, 0, 1, 1,
1.12789, 0.3756122, 0.6494372, 0, 0, 0, 1, 1,
1.132482, -0.2637934, 1.396033, 0, 0, 0, 1, 1,
1.13697, 0.5440218, 1.913719, 0, 0, 0, 1, 1,
1.140962, -0.6362354, 3.919971, 0, 0, 0, 1, 1,
1.145124, 2.448114, 0.6182337, 0, 0, 0, 1, 1,
1.156983, 1.102793, 0.8699237, 0, 0, 0, 1, 1,
1.162363, 0.2369732, 3.671905, 1, 1, 1, 1, 1,
1.169196, -1.770125, 5.326714, 1, 1, 1, 1, 1,
1.178777, -0.7644466, 2.130063, 1, 1, 1, 1, 1,
1.182491, 0.9750847, 1.259624, 1, 1, 1, 1, 1,
1.195803, -1.80139, 1.790946, 1, 1, 1, 1, 1,
1.202419, 1.035843, 0.09569269, 1, 1, 1, 1, 1,
1.203392, -1.620557, 0.196441, 1, 1, 1, 1, 1,
1.207715, 0.770541, -1.629074, 1, 1, 1, 1, 1,
1.213444, -0.1080543, 1.017106, 1, 1, 1, 1, 1,
1.2236, -0.9390107, 0.7218292, 1, 1, 1, 1, 1,
1.223958, -0.4620038, 3.123587, 1, 1, 1, 1, 1,
1.231146, -0.8298233, 4.762422, 1, 1, 1, 1, 1,
1.23427, -0.5786131, 1.779309, 1, 1, 1, 1, 1,
1.251491, -0.2911187, 3.152438, 1, 1, 1, 1, 1,
1.257253, 0.2210919, 0.8280353, 1, 1, 1, 1, 1,
1.26287, -0.03640238, 1.301814, 0, 0, 1, 1, 1,
1.278746, 0.687595, 1.032744, 1, 0, 0, 1, 1,
1.280721, -1.347975, 2.256483, 1, 0, 0, 1, 1,
1.288263, 0.9357706, 0.6113148, 1, 0, 0, 1, 1,
1.296098, 1.098449, -1.081714, 1, 0, 0, 1, 1,
1.310403, -0.5187385, 1.914862, 1, 0, 0, 1, 1,
1.312944, -0.2901777, 3.162003, 0, 0, 0, 1, 1,
1.313042, -0.09831177, -0.435874, 0, 0, 0, 1, 1,
1.31742, -0.5666211, 3.315591, 0, 0, 0, 1, 1,
1.319687, 0.006759631, 1.317708, 0, 0, 0, 1, 1,
1.319785, 0.398182, -0.1793603, 0, 0, 0, 1, 1,
1.320949, 0.3687741, 1.481441, 0, 0, 0, 1, 1,
1.326263, 0.6999881, 2.505897, 0, 0, 0, 1, 1,
1.327008, 0.2568322, 2.096377, 1, 1, 1, 1, 1,
1.327616, -1.924689, 3.197769, 1, 1, 1, 1, 1,
1.334174, -0.9779719, 0.7095276, 1, 1, 1, 1, 1,
1.341445, 0.9471952, 2.879628, 1, 1, 1, 1, 1,
1.343555, -0.7283754, 2.950409, 1, 1, 1, 1, 1,
1.352969, 0.01693566, -0.3754074, 1, 1, 1, 1, 1,
1.360515, 0.3453416, 2.280509, 1, 1, 1, 1, 1,
1.360716, -0.04048847, 1.45526, 1, 1, 1, 1, 1,
1.368613, -0.7002871, 0.7560838, 1, 1, 1, 1, 1,
1.373415, 1.045943, 1.658061, 1, 1, 1, 1, 1,
1.377485, -1.656496, 3.586368, 1, 1, 1, 1, 1,
1.378929, -1.794135, 3.286099, 1, 1, 1, 1, 1,
1.382337, 0.2756234, 1.139602, 1, 1, 1, 1, 1,
1.385736, 2.222023, -0.8998401, 1, 1, 1, 1, 1,
1.38635, 0.08802731, 0.7195399, 1, 1, 1, 1, 1,
1.395251, 0.3706825, 0.02285957, 0, 0, 1, 1, 1,
1.401474, 0.2239725, 1.750889, 1, 0, 0, 1, 1,
1.410404, 0.605125, 0.3575751, 1, 0, 0, 1, 1,
1.41756, -0.1492339, 1.389351, 1, 0, 0, 1, 1,
1.421999, -0.6377955, 1.530716, 1, 0, 0, 1, 1,
1.427704, 0.4109328, 2.257115, 1, 0, 0, 1, 1,
1.435391, 0.9040955, 0.6804146, 0, 0, 0, 1, 1,
1.443335, 0.7324705, 3.571583, 0, 0, 0, 1, 1,
1.444445, 2.891392, 0.333847, 0, 0, 0, 1, 1,
1.474759, -0.7432142, 1.71775, 0, 0, 0, 1, 1,
1.482208, -0.5985862, 3.234926, 0, 0, 0, 1, 1,
1.490372, 0.4081969, 1.289575, 0, 0, 0, 1, 1,
1.493116, 0.3573154, 0.9792087, 0, 0, 0, 1, 1,
1.505741, 1.383455, 0.9649677, 1, 1, 1, 1, 1,
1.511035, 0.4815171, 1.480533, 1, 1, 1, 1, 1,
1.513764, 0.1428748, 2.066351, 1, 1, 1, 1, 1,
1.516826, -1.427379, 2.992118, 1, 1, 1, 1, 1,
1.519847, 0.1734787, 0.4974622, 1, 1, 1, 1, 1,
1.521762, 0.1391234, 1.151426, 1, 1, 1, 1, 1,
1.521915, 0.1860242, 1.650763, 1, 1, 1, 1, 1,
1.540567, 0.05363583, 1.529215, 1, 1, 1, 1, 1,
1.546448, -0.4816383, 2.656748, 1, 1, 1, 1, 1,
1.553213, -1.462882, 2.613269, 1, 1, 1, 1, 1,
1.553276, 0.5153536, 0.2096897, 1, 1, 1, 1, 1,
1.553853, -0.2420427, 1.601013, 1, 1, 1, 1, 1,
1.575739, 0.4016062, 1.831786, 1, 1, 1, 1, 1,
1.587476, -0.09937119, 2.302841, 1, 1, 1, 1, 1,
1.600077, -0.4163609, 1.331107, 1, 1, 1, 1, 1,
1.600808, 0.6502891, 2.04526, 0, 0, 1, 1, 1,
1.618624, -2.043231, 2.20552, 1, 0, 0, 1, 1,
1.621894, 0.7108168, 0.7939916, 1, 0, 0, 1, 1,
1.624779, -2.890663, 2.373699, 1, 0, 0, 1, 1,
1.628232, -1.718202, 2.486513, 1, 0, 0, 1, 1,
1.633218, -0.6599538, 1.572448, 1, 0, 0, 1, 1,
1.636168, 0.9582483, 0.3032224, 0, 0, 0, 1, 1,
1.639268, -0.640222, 0.6355423, 0, 0, 0, 1, 1,
1.659104, -0.9869456, 2.753246, 0, 0, 0, 1, 1,
1.665704, -0.3030725, 2.030845, 0, 0, 0, 1, 1,
1.679229, -0.5412268, 1.327605, 0, 0, 0, 1, 1,
1.717672, 0.5940182, 1.952566, 0, 0, 0, 1, 1,
1.723493, 0.2926667, 1.719532, 0, 0, 0, 1, 1,
1.733901, 0.6325788, 1.614599, 1, 1, 1, 1, 1,
1.738179, 0.1185442, 1.348748, 1, 1, 1, 1, 1,
1.745317, -2.210751, 4.118084, 1, 1, 1, 1, 1,
1.749797, -0.1034404, 1.64682, 1, 1, 1, 1, 1,
1.760356, -0.3930129, 2.251616, 1, 1, 1, 1, 1,
1.764192, -2.315783, 2.370379, 1, 1, 1, 1, 1,
1.764718, 1.893526, 0.9808586, 1, 1, 1, 1, 1,
1.779801, 1.562551, 1.774086, 1, 1, 1, 1, 1,
1.846295, 1.923603, -0.04099743, 1, 1, 1, 1, 1,
1.861663, 0.4087864, 2.09976, 1, 1, 1, 1, 1,
1.867907, -0.4461297, 1.635156, 1, 1, 1, 1, 1,
1.8909, 0.2911142, 2.799017, 1, 1, 1, 1, 1,
1.909298, -0.5670871, 0.8157418, 1, 1, 1, 1, 1,
1.91042, -1.191732, -0.1166594, 1, 1, 1, 1, 1,
1.960963, -0.4754066, 2.056035, 1, 1, 1, 1, 1,
1.968372, -0.9829728, 1.916455, 0, 0, 1, 1, 1,
2.012499, 0.2632151, 1.00317, 1, 0, 0, 1, 1,
2.120767, 1.023123, 0.7024034, 1, 0, 0, 1, 1,
2.153512, 1.808466, -1.000806, 1, 0, 0, 1, 1,
2.171365, 0.2094905, 0.782816, 1, 0, 0, 1, 1,
2.179646, 0.6618527, 1.299856, 1, 0, 0, 1, 1,
2.229074, 0.8630962, 1.145731, 0, 0, 0, 1, 1,
2.232878, 2.145996, -1.658365, 0, 0, 0, 1, 1,
2.280754, 0.7426242, 1.896121, 0, 0, 0, 1, 1,
2.327672, -1.011474, 1.046726, 0, 0, 0, 1, 1,
2.340253, 1.41864, 0.3930717, 0, 0, 0, 1, 1,
2.399404, -0.2397141, 1.072417, 0, 0, 0, 1, 1,
2.423783, -1.605597, 3.579156, 0, 0, 0, 1, 1,
2.462816, 1.926485, 0.9644426, 1, 1, 1, 1, 1,
2.571338, -0.2411037, -0.3531181, 1, 1, 1, 1, 1,
2.582978, 0.3874019, -1.205029, 1, 1, 1, 1, 1,
2.585935, 0.8742423, 3.783776, 1, 1, 1, 1, 1,
2.700185, 0.6279969, 0.7429797, 1, 1, 1, 1, 1,
3.07519, 1.236144, 1.113172, 1, 1, 1, 1, 1,
3.168388, -0.8145249, 2.053653, 1, 1, 1, 1, 1
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
var radius = 9.823609;
var distance = 34.50501;
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
mvMatrix.translate( -0.0305419, -0.3323882, -0.2221696 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50501);
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
