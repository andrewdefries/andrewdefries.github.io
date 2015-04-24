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
-2.889116, -0.0069079, -0.8745287, 1, 0, 0, 1,
-2.824354, 1.49221, 1.506547, 1, 0.007843138, 0, 1,
-2.718971, -0.1455675, -4.475401, 1, 0.01176471, 0, 1,
-2.605384, 0.5903746, -1.43314, 1, 0.01960784, 0, 1,
-2.550441, 1.116519, -0.5144308, 1, 0.02352941, 0, 1,
-2.527705, -2.797205, -1.730948, 1, 0.03137255, 0, 1,
-2.485979, 0.6188446, -0.1131956, 1, 0.03529412, 0, 1,
-2.432359, -1.332674, -2.061682, 1, 0.04313726, 0, 1,
-2.420699, 0.4078296, -2.059814, 1, 0.04705882, 0, 1,
-2.381798, -0.6420881, -1.804593, 1, 0.05490196, 0, 1,
-2.330891, 1.070504, -0.8596007, 1, 0.05882353, 0, 1,
-2.325268, -1.365912, -1.656669, 1, 0.06666667, 0, 1,
-2.276231, 0.2284687, -2.451872, 1, 0.07058824, 0, 1,
-2.213236, 0.6506368, -0.757063, 1, 0.07843138, 0, 1,
-2.170298, 0.8028578, -0.7243541, 1, 0.08235294, 0, 1,
-2.156635, -0.9729069, -0.2114657, 1, 0.09019608, 0, 1,
-2.145194, -1.0471, -1.385415, 1, 0.09411765, 0, 1,
-2.120398, 0.5287974, -0.679503, 1, 0.1019608, 0, 1,
-2.117878, 1.085885, -2.88342, 1, 0.1098039, 0, 1,
-2.112993, -0.5372608, -2.030631, 1, 0.1137255, 0, 1,
-2.092629, -0.6595433, -2.367581, 1, 0.1215686, 0, 1,
-2.060817, 1.088075, -2.146104, 1, 0.1254902, 0, 1,
-2.033438, 0.6913732, 0.0007406993, 1, 0.1333333, 0, 1,
-2.005144, -0.1094994, -0.3717301, 1, 0.1372549, 0, 1,
-2.000704, -0.2329278, -2.132855, 1, 0.145098, 0, 1,
-1.986862, -0.03898417, -0.9079175, 1, 0.1490196, 0, 1,
-1.966578, 0.4153298, -0.8699892, 1, 0.1568628, 0, 1,
-1.961956, 0.3707455, -0.3861011, 1, 0.1607843, 0, 1,
-1.955757, 0.6529594, -3.392179, 1, 0.1686275, 0, 1,
-1.95346, 0.02955982, -0.559107, 1, 0.172549, 0, 1,
-1.942661, -0.867031, -2.826176, 1, 0.1803922, 0, 1,
-1.935354, -0.146608, -1.221809, 1, 0.1843137, 0, 1,
-1.925876, -0.660925, -2.929983, 1, 0.1921569, 0, 1,
-1.919239, 0.818745, -2.422068, 1, 0.1960784, 0, 1,
-1.918979, -1.475847, -1.739537, 1, 0.2039216, 0, 1,
-1.917071, -0.8085211, -3.16172, 1, 0.2117647, 0, 1,
-1.903809, -0.3051485, -2.861821, 1, 0.2156863, 0, 1,
-1.865906, -1.116374, -3.742251, 1, 0.2235294, 0, 1,
-1.862291, 1.201969, -2.23308, 1, 0.227451, 0, 1,
-1.85935, 0.5100427, -1.537042, 1, 0.2352941, 0, 1,
-1.859004, -0.6039857, -1.017236, 1, 0.2392157, 0, 1,
-1.845832, -1.284997, -2.816416, 1, 0.2470588, 0, 1,
-1.845561, 0.1868364, -0.8144764, 1, 0.2509804, 0, 1,
-1.844138, -0.4768067, -1.834482, 1, 0.2588235, 0, 1,
-1.842121, -0.7291957, -2.863322, 1, 0.2627451, 0, 1,
-1.829406, -0.04593744, -0.5350939, 1, 0.2705882, 0, 1,
-1.820628, 0.1676975, -0.3613928, 1, 0.2745098, 0, 1,
-1.817566, -0.5403135, -1.445346, 1, 0.282353, 0, 1,
-1.787348, 0.5646793, -3.655409, 1, 0.2862745, 0, 1,
-1.786897, 2.026328, -0.02673163, 1, 0.2941177, 0, 1,
-1.782415, 0.9512329, -0.6602798, 1, 0.3019608, 0, 1,
-1.763304, -0.5708292, -2.033543, 1, 0.3058824, 0, 1,
-1.735547, -0.8095576, -2.474574, 1, 0.3137255, 0, 1,
-1.716932, 0.3076874, -0.9837654, 1, 0.3176471, 0, 1,
-1.714972, -0.6358011, -2.261534, 1, 0.3254902, 0, 1,
-1.714699, 1.418408, -1.36299, 1, 0.3294118, 0, 1,
-1.691193, 0.2333663, -0.384248, 1, 0.3372549, 0, 1,
-1.679453, 0.5982494, -2.078346, 1, 0.3411765, 0, 1,
-1.674936, -0.9543467, -1.827165, 1, 0.3490196, 0, 1,
-1.671242, -0.9006952, -2.471364, 1, 0.3529412, 0, 1,
-1.663113, 0.3570172, -0.305475, 1, 0.3607843, 0, 1,
-1.659738, -0.7245837, -1.296844, 1, 0.3647059, 0, 1,
-1.655566, -1.330197, -1.706657, 1, 0.372549, 0, 1,
-1.6488, -1.099705, -2.089042, 1, 0.3764706, 0, 1,
-1.642693, -1.093079, -0.7481125, 1, 0.3843137, 0, 1,
-1.639788, 1.270696, -0.2606869, 1, 0.3882353, 0, 1,
-1.623376, -0.567898, -2.027987, 1, 0.3960784, 0, 1,
-1.621538, -0.1979321, -1.241666, 1, 0.4039216, 0, 1,
-1.605909, -1.293467, -3.643669, 1, 0.4078431, 0, 1,
-1.59866, 0.7652957, 0.7748779, 1, 0.4156863, 0, 1,
-1.569692, -0.8114989, -1.751152, 1, 0.4196078, 0, 1,
-1.518909, 1.854843, 1.180721, 1, 0.427451, 0, 1,
-1.508384, 0.4323874, -1.13594, 1, 0.4313726, 0, 1,
-1.503936, 2.229523, -1.567049, 1, 0.4392157, 0, 1,
-1.503843, 1.546249, -0.2526072, 1, 0.4431373, 0, 1,
-1.503052, -0.4696735, -1.666844, 1, 0.4509804, 0, 1,
-1.496176, 0.2987456, -2.786412, 1, 0.454902, 0, 1,
-1.494136, -1.685334, -3.520984, 1, 0.4627451, 0, 1,
-1.477712, 1.44103, 0.07213648, 1, 0.4666667, 0, 1,
-1.447815, 0.8222108, -0.1494163, 1, 0.4745098, 0, 1,
-1.447769, 0.02805969, -1.400644, 1, 0.4784314, 0, 1,
-1.443253, 1.345896, -1.278841, 1, 0.4862745, 0, 1,
-1.438413, -0.4209343, -0.8674194, 1, 0.4901961, 0, 1,
-1.436672, 0.6894701, -1.719739, 1, 0.4980392, 0, 1,
-1.432351, -1.257221, -3.578493, 1, 0.5058824, 0, 1,
-1.431339, -1.767226, -1.181337, 1, 0.509804, 0, 1,
-1.429793, 0.001237054, -2.099514, 1, 0.5176471, 0, 1,
-1.421742, 1.41433, 1.31135, 1, 0.5215687, 0, 1,
-1.409524, 0.02404021, 0.2281417, 1, 0.5294118, 0, 1,
-1.405313, 1.717986, -1.056604, 1, 0.5333334, 0, 1,
-1.39535, -0.8855075, -2.398552, 1, 0.5411765, 0, 1,
-1.391653, -0.196897, -2.286681, 1, 0.5450981, 0, 1,
-1.378149, -0.6667669, -1.902486, 1, 0.5529412, 0, 1,
-1.375964, 0.401695, -0.3125, 1, 0.5568628, 0, 1,
-1.3461, -1.190012, -3.329334, 1, 0.5647059, 0, 1,
-1.333629, -1.390875, -2.432154, 1, 0.5686275, 0, 1,
-1.326948, 0.04150946, -1.065562, 1, 0.5764706, 0, 1,
-1.323981, 1.129062, -0.8950798, 1, 0.5803922, 0, 1,
-1.308617, 0.2235982, -1.466268, 1, 0.5882353, 0, 1,
-1.306078, 0.1794734, -1.420367, 1, 0.5921569, 0, 1,
-1.303361, 1.425254, -0.6862314, 1, 0.6, 0, 1,
-1.302659, -0.6225713, -1.092518, 1, 0.6078432, 0, 1,
-1.298781, -0.8599075, -2.191336, 1, 0.6117647, 0, 1,
-1.291769, 1.172772, -1.071882, 1, 0.6196079, 0, 1,
-1.286552, -1.106562, -0.2351863, 1, 0.6235294, 0, 1,
-1.275551, 0.04363855, -0.5598747, 1, 0.6313726, 0, 1,
-1.274799, 1.87321, -2.073076, 1, 0.6352941, 0, 1,
-1.273413, 0.8749582, -0.8000807, 1, 0.6431373, 0, 1,
-1.259181, -0.1847448, -2.964611, 1, 0.6470588, 0, 1,
-1.257686, -1.006391, -2.046483, 1, 0.654902, 0, 1,
-1.257056, 0.6304036, -0.8826841, 1, 0.6588235, 0, 1,
-1.257017, -0.546269, -0.1431013, 1, 0.6666667, 0, 1,
-1.238195, 0.5932066, -1.857445, 1, 0.6705883, 0, 1,
-1.238092, -0.4585054, -2.450691, 1, 0.6784314, 0, 1,
-1.232087, 0.8550291, -1.217885, 1, 0.682353, 0, 1,
-1.231571, -0.01687418, -1.770799, 1, 0.6901961, 0, 1,
-1.230465, -0.7183386, -1.574948, 1, 0.6941177, 0, 1,
-1.223489, -1.371975, -2.78432, 1, 0.7019608, 0, 1,
-1.217445, 0.9527313, -1.510294, 1, 0.7098039, 0, 1,
-1.203023, 0.2703723, -1.190978, 1, 0.7137255, 0, 1,
-1.185098, -0.6517414, -2.984062, 1, 0.7215686, 0, 1,
-1.183313, 0.570642, -1.448507, 1, 0.7254902, 0, 1,
-1.177885, 0.5854899, -2.164448, 1, 0.7333333, 0, 1,
-1.175409, -1.298407, -3.12243, 1, 0.7372549, 0, 1,
-1.175282, 0.1016643, -2.884459, 1, 0.7450981, 0, 1,
-1.175036, 1.661967, -0.9557571, 1, 0.7490196, 0, 1,
-1.165989, -2.18472, -2.788731, 1, 0.7568628, 0, 1,
-1.161575, 0.3683884, -1.216728, 1, 0.7607843, 0, 1,
-1.161054, -0.6372706, -3.276128, 1, 0.7686275, 0, 1,
-1.157497, -0.1590203, -1.789745, 1, 0.772549, 0, 1,
-1.151598, -1.256914, -2.577987, 1, 0.7803922, 0, 1,
-1.151202, -0.9999581, -3.282388, 1, 0.7843137, 0, 1,
-1.151079, -0.3667114, -1.139145, 1, 0.7921569, 0, 1,
-1.143959, -0.5640597, -2.800197, 1, 0.7960784, 0, 1,
-1.135192, -1.018359, -3.703394, 1, 0.8039216, 0, 1,
-1.133979, 0.02349146, -1.599155, 1, 0.8117647, 0, 1,
-1.129672, 1.379049, 0.7299603, 1, 0.8156863, 0, 1,
-1.124908, -0.1509299, -1.915759, 1, 0.8235294, 0, 1,
-1.114948, 1.220135, 0.09148015, 1, 0.827451, 0, 1,
-1.112374, -0.4377821, -0.9525011, 1, 0.8352941, 0, 1,
-1.110269, 0.01280119, -2.403572, 1, 0.8392157, 0, 1,
-1.10722, -0.2389606, -2.122376, 1, 0.8470588, 0, 1,
-1.099404, 1.760107, -2.411108, 1, 0.8509804, 0, 1,
-1.097057, 0.4500338, -2.370914, 1, 0.8588235, 0, 1,
-1.096623, -0.9344726, -4.698048, 1, 0.8627451, 0, 1,
-1.095621, 0.2883532, -2.077718, 1, 0.8705882, 0, 1,
-1.092837, -0.5016312, -1.562245, 1, 0.8745098, 0, 1,
-1.089545, -0.6874627, -1.412905, 1, 0.8823529, 0, 1,
-1.087037, 1.543641, -0.8127889, 1, 0.8862745, 0, 1,
-1.085802, -1.504144, -3.152129, 1, 0.8941177, 0, 1,
-1.084774, -2.927322, -2.075964, 1, 0.8980392, 0, 1,
-1.084715, 0.4522541, -0.5411963, 1, 0.9058824, 0, 1,
-1.080488, -0.9099272, -1.937161, 1, 0.9137255, 0, 1,
-1.07757, -0.4035824, -1.979807, 1, 0.9176471, 0, 1,
-1.076749, -0.5008878, -4.435585, 1, 0.9254902, 0, 1,
-1.076321, 0.4227069, -0.1441059, 1, 0.9294118, 0, 1,
-1.07631, 0.03829439, -0.4037138, 1, 0.9372549, 0, 1,
-1.072301, 0.5574105, -2.84579, 1, 0.9411765, 0, 1,
-1.070855, 0.2291491, -0.2284907, 1, 0.9490196, 0, 1,
-1.064289, 0.4428405, 1.048111, 1, 0.9529412, 0, 1,
-1.063765, -0.2871553, -0.8124945, 1, 0.9607843, 0, 1,
-1.062215, 1.240694, -0.9256848, 1, 0.9647059, 0, 1,
-1.054651, 0.721164, -0.6122286, 1, 0.972549, 0, 1,
-1.047884, 0.2161624, -1.491478, 1, 0.9764706, 0, 1,
-1.046615, -0.3416989, -2.499103, 1, 0.9843137, 0, 1,
-1.044774, -0.07561545, -2.921751, 1, 0.9882353, 0, 1,
-1.032613, 1.14714, -0.5359243, 1, 0.9960784, 0, 1,
-1.032478, -1.026889, -0.8215777, 0.9960784, 1, 0, 1,
-1.018138, -0.9907945, -3.223167, 0.9921569, 1, 0, 1,
-1.015656, 0.1083815, -1.215333, 0.9843137, 1, 0, 1,
-1.014241, -0.4094131, -1.335908, 0.9803922, 1, 0, 1,
-1.011618, -1.19127, -2.897795, 0.972549, 1, 0, 1,
-1.010997, -0.2889232, -0.3314617, 0.9686275, 1, 0, 1,
-1.009888, -0.3754139, -1.768655, 0.9607843, 1, 0, 1,
-1.001907, 0.5488982, -1.506536, 0.9568627, 1, 0, 1,
-0.9991712, 1.258216, -1.718373, 0.9490196, 1, 0, 1,
-0.9903522, 0.8281313, -0.4249341, 0.945098, 1, 0, 1,
-0.9890809, -1.984087, -2.111022, 0.9372549, 1, 0, 1,
-0.9866299, 1.361382, -1.190388, 0.9333333, 1, 0, 1,
-0.981545, 0.0648915, -2.657462, 0.9254902, 1, 0, 1,
-0.9747661, -0.4826852, -2.631952, 0.9215686, 1, 0, 1,
-0.9712991, -2.135457, -0.8060797, 0.9137255, 1, 0, 1,
-0.9647909, -0.2414757, -2.563376, 0.9098039, 1, 0, 1,
-0.9536356, -0.08662674, -1.821529, 0.9019608, 1, 0, 1,
-0.946866, -0.9448349, -3.007453, 0.8941177, 1, 0, 1,
-0.9350949, -0.4202501, -2.646842, 0.8901961, 1, 0, 1,
-0.9326236, -1.631094, -3.480363, 0.8823529, 1, 0, 1,
-0.9294482, -0.6839278, -0.5994294, 0.8784314, 1, 0, 1,
-0.9244674, 0.3664094, -0.4567761, 0.8705882, 1, 0, 1,
-0.9241304, -1.291766, -4.573112, 0.8666667, 1, 0, 1,
-0.9176645, 0.5565594, -1.74973, 0.8588235, 1, 0, 1,
-0.9100357, 1.618269, -1.550445, 0.854902, 1, 0, 1,
-0.909446, 0.9416984, -1.36058, 0.8470588, 1, 0, 1,
-0.9088967, -0.9201944, -2.017426, 0.8431373, 1, 0, 1,
-0.9054211, -1.005051, -1.153793, 0.8352941, 1, 0, 1,
-0.9005939, 0.03955686, -0.8711649, 0.8313726, 1, 0, 1,
-0.8953399, -0.4678021, -2.825855, 0.8235294, 1, 0, 1,
-0.8935881, 2.751183, -1.104973, 0.8196079, 1, 0, 1,
-0.8924317, -0.01103558, -2.501479, 0.8117647, 1, 0, 1,
-0.886182, -0.2120187, -2.897322, 0.8078431, 1, 0, 1,
-0.8821661, -0.8312835, -3.900617, 0.8, 1, 0, 1,
-0.8759843, -0.03661605, -1.530126, 0.7921569, 1, 0, 1,
-0.8736377, -0.06492317, -4.035222, 0.7882353, 1, 0, 1,
-0.8695152, 0.9874197, -2.266234, 0.7803922, 1, 0, 1,
-0.8687284, -0.7151842, -1.887998, 0.7764706, 1, 0, 1,
-0.8562714, 1.655923, -1.755462, 0.7686275, 1, 0, 1,
-0.8550112, -0.5230965, -3.146624, 0.7647059, 1, 0, 1,
-0.8539997, -0.6242672, -2.966366, 0.7568628, 1, 0, 1,
-0.8537493, 0.5754763, -2.3209, 0.7529412, 1, 0, 1,
-0.8459567, 0.1060232, -1.111043, 0.7450981, 1, 0, 1,
-0.8456056, -2.09376, -3.007925, 0.7411765, 1, 0, 1,
-0.8432155, 0.1144703, -2.157562, 0.7333333, 1, 0, 1,
-0.8409117, -0.1114187, -2.066363, 0.7294118, 1, 0, 1,
-0.8390254, -1.821449, -2.140522, 0.7215686, 1, 0, 1,
-0.8334868, -2.960819, -1.947405, 0.7176471, 1, 0, 1,
-0.830042, -0.5803759, -1.605794, 0.7098039, 1, 0, 1,
-0.8299192, -1.106235, -2.382598, 0.7058824, 1, 0, 1,
-0.8273345, 0.863911, -2.009531, 0.6980392, 1, 0, 1,
-0.8261046, -0.8859452, -3.553821, 0.6901961, 1, 0, 1,
-0.823785, 0.175945, -2.421213, 0.6862745, 1, 0, 1,
-0.820632, -0.5031375, -1.544184, 0.6784314, 1, 0, 1,
-0.8125614, 1.081955, -0.7542148, 0.6745098, 1, 0, 1,
-0.8090966, 0.1582148, 1.121295, 0.6666667, 1, 0, 1,
-0.7886716, -0.1013337, -2.975456, 0.6627451, 1, 0, 1,
-0.7818233, 0.175051, -3.060071, 0.654902, 1, 0, 1,
-0.7774273, 0.238407, -1.636036, 0.6509804, 1, 0, 1,
-0.7713411, 0.3001518, -1.074803, 0.6431373, 1, 0, 1,
-0.770004, -0.6193582, -1.262125, 0.6392157, 1, 0, 1,
-0.7695298, 0.5225849, -1.595196, 0.6313726, 1, 0, 1,
-0.768755, 1.92217, -0.8490115, 0.627451, 1, 0, 1,
-0.7677498, -0.8323324, -1.831995, 0.6196079, 1, 0, 1,
-0.7632775, -0.2314359, -2.460899, 0.6156863, 1, 0, 1,
-0.7615891, 1.271055, -2.257335, 0.6078432, 1, 0, 1,
-0.7591317, 0.08039684, -2.708925, 0.6039216, 1, 0, 1,
-0.7586223, -0.5000654, -2.412289, 0.5960785, 1, 0, 1,
-0.7541319, -0.3020099, -3.440902, 0.5882353, 1, 0, 1,
-0.7512376, 0.4643871, -0.4726452, 0.5843138, 1, 0, 1,
-0.7505774, -1.819529, -1.578642, 0.5764706, 1, 0, 1,
-0.7449962, -1.320951, -3.15632, 0.572549, 1, 0, 1,
-0.7433257, 1.249, 0.8084742, 0.5647059, 1, 0, 1,
-0.743049, 2.345291, -1.162477, 0.5607843, 1, 0, 1,
-0.7403592, 1.097714, -1.840391, 0.5529412, 1, 0, 1,
-0.733346, -0.05436812, -2.098855, 0.5490196, 1, 0, 1,
-0.7309424, -1.369313, -1.734028, 0.5411765, 1, 0, 1,
-0.7171339, 1.53387, -0.1214727, 0.5372549, 1, 0, 1,
-0.715399, 0.7423202, -3.122532, 0.5294118, 1, 0, 1,
-0.7135154, -1.854231, -2.451567, 0.5254902, 1, 0, 1,
-0.7121857, -0.1029094, 0.1939795, 0.5176471, 1, 0, 1,
-0.7117682, -0.2428186, -1.728947, 0.5137255, 1, 0, 1,
-0.7076182, 0.03927898, 0.3987949, 0.5058824, 1, 0, 1,
-0.7071204, -0.6105518, -3.005157, 0.5019608, 1, 0, 1,
-0.7055552, -0.7885255, -2.294331, 0.4941176, 1, 0, 1,
-0.7012547, -1.383559, -2.225141, 0.4862745, 1, 0, 1,
-0.7010375, -1.078051, -3.695762, 0.4823529, 1, 0, 1,
-0.695024, -0.6881216, -1.826834, 0.4745098, 1, 0, 1,
-0.6916465, -0.9557355, -3.303533, 0.4705882, 1, 0, 1,
-0.6900464, 0.7850295, -1.934277, 0.4627451, 1, 0, 1,
-0.6864344, -0.5416247, -3.021698, 0.4588235, 1, 0, 1,
-0.6833115, 2.491512, 0.2625878, 0.4509804, 1, 0, 1,
-0.6823373, -0.3774671, -2.12383, 0.4470588, 1, 0, 1,
-0.682038, 1.045871, -1.329779, 0.4392157, 1, 0, 1,
-0.6776429, 1.216555, -1.795493, 0.4352941, 1, 0, 1,
-0.6765034, -1.175725, -2.600579, 0.427451, 1, 0, 1,
-0.673878, -2.707597, -3.464937, 0.4235294, 1, 0, 1,
-0.6707836, -0.5167798, 0.4189653, 0.4156863, 1, 0, 1,
-0.6662742, 0.3971419, -0.3986835, 0.4117647, 1, 0, 1,
-0.6649118, -1.181705, -2.728471, 0.4039216, 1, 0, 1,
-0.6624195, -1.006057, -2.104986, 0.3960784, 1, 0, 1,
-0.6551353, 1.26265, 1.601284, 0.3921569, 1, 0, 1,
-0.643784, 2.261839, -1.822718, 0.3843137, 1, 0, 1,
-0.6392676, -0.1788939, -2.613292, 0.3803922, 1, 0, 1,
-0.6336094, -1.357721, -4.623215, 0.372549, 1, 0, 1,
-0.6329141, -1.020958, -3.342747, 0.3686275, 1, 0, 1,
-0.6328921, -0.9606277, -2.663778, 0.3607843, 1, 0, 1,
-0.6222277, 1.325273, -1.363434, 0.3568628, 1, 0, 1,
-0.6146504, -0.04589995, -3.076988, 0.3490196, 1, 0, 1,
-0.6119216, 0.3052328, 0.3681979, 0.345098, 1, 0, 1,
-0.6038936, 0.1587024, -2.086366, 0.3372549, 1, 0, 1,
-0.5934948, 0.1146529, -1.707555, 0.3333333, 1, 0, 1,
-0.5875489, 1.123265, 0.5420617, 0.3254902, 1, 0, 1,
-0.5836076, 1.610015, -0.1912419, 0.3215686, 1, 0, 1,
-0.5794795, -0.5435149, -3.125144, 0.3137255, 1, 0, 1,
-0.5773363, 1.185976, -0.2284608, 0.3098039, 1, 0, 1,
-0.5765265, 1.511202, 0.004152325, 0.3019608, 1, 0, 1,
-0.574246, 0.3701782, -1.699282, 0.2941177, 1, 0, 1,
-0.5730859, 0.9812737, 0.6778896, 0.2901961, 1, 0, 1,
-0.5730023, 0.3270664, -2.613793, 0.282353, 1, 0, 1,
-0.5704476, -0.1181157, -2.136573, 0.2784314, 1, 0, 1,
-0.569689, 0.6818852, 1.042805, 0.2705882, 1, 0, 1,
-0.5646679, -0.9832383, -0.7434254, 0.2666667, 1, 0, 1,
-0.5634285, -0.488747, -2.263341, 0.2588235, 1, 0, 1,
-0.5633538, -0.1711041, -2.675317, 0.254902, 1, 0, 1,
-0.5630345, -0.5107558, -2.112093, 0.2470588, 1, 0, 1,
-0.5582026, -0.057308, -1.431971, 0.2431373, 1, 0, 1,
-0.5563304, -1.172144, -2.239724, 0.2352941, 1, 0, 1,
-0.5549524, -1.016661, -3.409874, 0.2313726, 1, 0, 1,
-0.5537699, 0.9136418, -1.049353, 0.2235294, 1, 0, 1,
-0.5495436, 0.6352993, 0.9879254, 0.2196078, 1, 0, 1,
-0.5410898, 0.204317, -1.225776, 0.2117647, 1, 0, 1,
-0.5328923, 0.9336706, 0.2288265, 0.2078431, 1, 0, 1,
-0.5318715, 0.07059862, -1.258482, 0.2, 1, 0, 1,
-0.5277165, 0.8476218, 0.2767221, 0.1921569, 1, 0, 1,
-0.527067, 1.270903, -0.1409123, 0.1882353, 1, 0, 1,
-0.5268968, 0.1208423, -1.454476, 0.1803922, 1, 0, 1,
-0.5235377, 1.694554, -0.4610891, 0.1764706, 1, 0, 1,
-0.5192607, -1.085772, -1.914038, 0.1686275, 1, 0, 1,
-0.5185601, -1.625435, -2.649609, 0.1647059, 1, 0, 1,
-0.5146815, -0.9873485, -3.335098, 0.1568628, 1, 0, 1,
-0.5106407, -2.665153, -2.777604, 0.1529412, 1, 0, 1,
-0.5099866, -0.8084947, -2.367028, 0.145098, 1, 0, 1,
-0.507313, 1.935107, 0.3493567, 0.1411765, 1, 0, 1,
-0.5064063, -1.361242, -4.398811, 0.1333333, 1, 0, 1,
-0.5003942, 0.6766099, -0.2017261, 0.1294118, 1, 0, 1,
-0.488847, 0.8793861, -0.4298185, 0.1215686, 1, 0, 1,
-0.4886541, -0.8092652, -3.518587, 0.1176471, 1, 0, 1,
-0.4788554, -0.4992326, -1.685879, 0.1098039, 1, 0, 1,
-0.476775, 0.141367, -0.09425374, 0.1058824, 1, 0, 1,
-0.4722616, 0.5592914, -0.7047513, 0.09803922, 1, 0, 1,
-0.4718976, -0.002738928, -0.7504843, 0.09019608, 1, 0, 1,
-0.468056, -0.1026629, -1.512005, 0.08627451, 1, 0, 1,
-0.4519954, -0.6589959, -0.9107187, 0.07843138, 1, 0, 1,
-0.4498819, 0.1813912, -1.617725, 0.07450981, 1, 0, 1,
-0.4484021, 0.8248119, 0.2800642, 0.06666667, 1, 0, 1,
-0.4479686, -0.9434189, -3.62212, 0.0627451, 1, 0, 1,
-0.4453955, -0.2340569, -0.7840112, 0.05490196, 1, 0, 1,
-0.4450993, -1.175378, -1.520153, 0.05098039, 1, 0, 1,
-0.439381, -1.147257, -1.32059, 0.04313726, 1, 0, 1,
-0.4371749, 0.8720523, -0.3841543, 0.03921569, 1, 0, 1,
-0.431685, 0.4105296, -2.655355, 0.03137255, 1, 0, 1,
-0.428124, 0.3282198, -0.7339396, 0.02745098, 1, 0, 1,
-0.4267142, -0.1771185, -1.428731, 0.01960784, 1, 0, 1,
-0.4264243, -0.7125294, -3.289011, 0.01568628, 1, 0, 1,
-0.4252572, 1.744967, 0.09364498, 0.007843138, 1, 0, 1,
-0.4244941, 0.1666766, -1.753384, 0.003921569, 1, 0, 1,
-0.4240478, 0.3681059, -0.2106508, 0, 1, 0.003921569, 1,
-0.422995, -0.5896543, -0.3998139, 0, 1, 0.01176471, 1,
-0.4224964, 0.2031421, -2.378994, 0, 1, 0.01568628, 1,
-0.4205205, 1.856949, -0.3457741, 0, 1, 0.02352941, 1,
-0.417998, -0.7500677, -0.3577905, 0, 1, 0.02745098, 1,
-0.4113351, -1.448284, -2.490806, 0, 1, 0.03529412, 1,
-0.4070616, 0.03035369, -1.483364, 0, 1, 0.03921569, 1,
-0.4060872, -1.499612, -3.381946, 0, 1, 0.04705882, 1,
-0.4060287, 0.09965602, -2.760571, 0, 1, 0.05098039, 1,
-0.4016715, -1.180844, -2.783795, 0, 1, 0.05882353, 1,
-0.4016249, -0.3231567, -0.07524963, 0, 1, 0.0627451, 1,
-0.3955215, 0.9078465, -0.8715383, 0, 1, 0.07058824, 1,
-0.3925766, -0.63069, -2.659655, 0, 1, 0.07450981, 1,
-0.3841068, 0.61019, -1.103639, 0, 1, 0.08235294, 1,
-0.3811256, 0.8204501, -0.5648987, 0, 1, 0.08627451, 1,
-0.381003, 0.586939, -0.5494668, 0, 1, 0.09411765, 1,
-0.3772734, -0.5511225, -4.082494, 0, 1, 0.1019608, 1,
-0.3752157, 2.00309, 0.05771286, 0, 1, 0.1058824, 1,
-0.3694418, 0.796443, -0.399604, 0, 1, 0.1137255, 1,
-0.3665608, 0.9794731, -1.365231, 0, 1, 0.1176471, 1,
-0.3655517, 1.923749, 0.7133666, 0, 1, 0.1254902, 1,
-0.3627041, 0.3200761, -2.860709, 0, 1, 0.1294118, 1,
-0.3610696, -0.6108225, -2.309905, 0, 1, 0.1372549, 1,
-0.3586061, -0.2583334, -2.59448, 0, 1, 0.1411765, 1,
-0.3542708, -0.4485062, -3.542386, 0, 1, 0.1490196, 1,
-0.3529688, -0.07097105, -1.309678, 0, 1, 0.1529412, 1,
-0.3502153, -0.2996093, -3.843714, 0, 1, 0.1607843, 1,
-0.3416753, 1.227178, 0.492896, 0, 1, 0.1647059, 1,
-0.3367481, -0.2130006, -2.089135, 0, 1, 0.172549, 1,
-0.3311435, 2.270669, -1.19301, 0, 1, 0.1764706, 1,
-0.326499, 0.4555756, -1.270169, 0, 1, 0.1843137, 1,
-0.3226952, -0.1769041, -2.650296, 0, 1, 0.1882353, 1,
-0.3195198, 0.9946935, -0.9102617, 0, 1, 0.1960784, 1,
-0.3187625, -1.321254, -3.973253, 0, 1, 0.2039216, 1,
-0.3142126, -0.9493755, -3.857926, 0, 1, 0.2078431, 1,
-0.3134824, 1.731682, -0.458233, 0, 1, 0.2156863, 1,
-0.3092869, 0.9972411, -0.76112, 0, 1, 0.2196078, 1,
-0.3066363, 1.943733, -0.9313338, 0, 1, 0.227451, 1,
-0.3063554, -0.2419043, -1.696918, 0, 1, 0.2313726, 1,
-0.2989518, -0.4796254, -2.276947, 0, 1, 0.2392157, 1,
-0.2955729, -1.176314, -2.577459, 0, 1, 0.2431373, 1,
-0.2949552, -0.805401, -2.374494, 0, 1, 0.2509804, 1,
-0.289687, 0.06011527, -1.330884, 0, 1, 0.254902, 1,
-0.2854919, -1.186871, -2.907553, 0, 1, 0.2627451, 1,
-0.284659, -1.16944, -1.733004, 0, 1, 0.2666667, 1,
-0.2833731, -0.7612963, -1.953831, 0, 1, 0.2745098, 1,
-0.2791043, 0.8092132, -0.02975788, 0, 1, 0.2784314, 1,
-0.2779462, 0.4924617, -0.01108612, 0, 1, 0.2862745, 1,
-0.2752872, -0.8495098, -3.191213, 0, 1, 0.2901961, 1,
-0.2709285, 0.6785678, 0.4050152, 0, 1, 0.2980392, 1,
-0.2658335, -0.423108, -2.340253, 0, 1, 0.3058824, 1,
-0.2654448, 0.1871994, -2.262164, 0, 1, 0.3098039, 1,
-0.262447, 0.9184383, -0.03127162, 0, 1, 0.3176471, 1,
-0.2609141, -0.8896595, -4.200812, 0, 1, 0.3215686, 1,
-0.260763, 0.9430611, -0.6329216, 0, 1, 0.3294118, 1,
-0.2601231, -0.466945, -4.951627, 0, 1, 0.3333333, 1,
-0.2569683, -0.8139513, -2.282604, 0, 1, 0.3411765, 1,
-0.2461491, 0.8384576, 0.187212, 0, 1, 0.345098, 1,
-0.2444504, 0.01399159, -1.202495, 0, 1, 0.3529412, 1,
-0.2417455, -0.9875517, -4.683064, 0, 1, 0.3568628, 1,
-0.2295709, -0.5864261, -2.126888, 0, 1, 0.3647059, 1,
-0.2286373, -1.299855, -1.052851, 0, 1, 0.3686275, 1,
-0.2228372, 1.054792, 0.7647274, 0, 1, 0.3764706, 1,
-0.2195213, -0.6401841, -3.235092, 0, 1, 0.3803922, 1,
-0.2151276, 0.02152575, -1.347666, 0, 1, 0.3882353, 1,
-0.2133287, -0.4046101, -1.458553, 0, 1, 0.3921569, 1,
-0.2112424, -0.1084682, -1.205022, 0, 1, 0.4, 1,
-0.2098925, -0.4596869, -2.117779, 0, 1, 0.4078431, 1,
-0.2098145, 0.01781503, -3.332713, 0, 1, 0.4117647, 1,
-0.2092845, 0.3556191, -0.1557266, 0, 1, 0.4196078, 1,
-0.2079741, -0.636335, -2.308062, 0, 1, 0.4235294, 1,
-0.2064439, -1.033522, -2.555588, 0, 1, 0.4313726, 1,
-0.2057071, -0.1234599, -3.426047, 0, 1, 0.4352941, 1,
-0.2039875, 0.7449771, -2.394018, 0, 1, 0.4431373, 1,
-0.2034964, -0.5587841, -4.071925, 0, 1, 0.4470588, 1,
-0.2033444, -1.051408, -2.430412, 0, 1, 0.454902, 1,
-0.1986429, -0.5816982, -2.248257, 0, 1, 0.4588235, 1,
-0.1979339, 0.5933006, -1.04826, 0, 1, 0.4666667, 1,
-0.1970269, -1.138949, -3.99839, 0, 1, 0.4705882, 1,
-0.1967674, 1.733662, -0.9399216, 0, 1, 0.4784314, 1,
-0.1948184, -0.2874976, -3.254994, 0, 1, 0.4823529, 1,
-0.1931178, -2.636054, -1.657156, 0, 1, 0.4901961, 1,
-0.1908664, -0.4066175, -2.351633, 0, 1, 0.4941176, 1,
-0.1867469, 0.5244933, 0.1088545, 0, 1, 0.5019608, 1,
-0.1866456, 0.46038, 0.09384234, 0, 1, 0.509804, 1,
-0.1836992, 1.486091, -1.016461, 0, 1, 0.5137255, 1,
-0.1813576, -1.569561, -4.41065, 0, 1, 0.5215687, 1,
-0.1806083, -3.424402, -3.556858, 0, 1, 0.5254902, 1,
-0.178017, -2.162769, -2.430732, 0, 1, 0.5333334, 1,
-0.1772783, -0.6036999, -1.892664, 0, 1, 0.5372549, 1,
-0.1754166, -0.5828748, -4.043751, 0, 1, 0.5450981, 1,
-0.1745919, 1.256582, -1.319623, 0, 1, 0.5490196, 1,
-0.1732013, 0.09241516, -1.68088, 0, 1, 0.5568628, 1,
-0.1715232, 1.205275, -0.31683, 0, 1, 0.5607843, 1,
-0.1690297, 0.3783498, -1.383033, 0, 1, 0.5686275, 1,
-0.1662052, -1.181142, -3.187567, 0, 1, 0.572549, 1,
-0.1646126, -0.7746612, -2.622194, 0, 1, 0.5803922, 1,
-0.1637052, -0.2883999, -3.619588, 0, 1, 0.5843138, 1,
-0.1607523, -0.773249, -2.666995, 0, 1, 0.5921569, 1,
-0.1604525, -0.8660811, -4.162562, 0, 1, 0.5960785, 1,
-0.1599518, 0.3375675, 0.4732396, 0, 1, 0.6039216, 1,
-0.1592516, 0.6320638, -0.976087, 0, 1, 0.6117647, 1,
-0.1546322, -1.23316, -2.143295, 0, 1, 0.6156863, 1,
-0.1519686, -1.151952, -3.851404, 0, 1, 0.6235294, 1,
-0.1485524, 2.12527, 1.00682, 0, 1, 0.627451, 1,
-0.1483399, 1.165401, 0.2976882, 0, 1, 0.6352941, 1,
-0.1454795, -0.1060902, -4.15398, 0, 1, 0.6392157, 1,
-0.1406197, 1.626633, 0.0414922, 0, 1, 0.6470588, 1,
-0.1375193, 0.6161371, -1.726218, 0, 1, 0.6509804, 1,
-0.1343666, 0.2346502, -0.1262208, 0, 1, 0.6588235, 1,
-0.1335496, -0.1989, -2.491703, 0, 1, 0.6627451, 1,
-0.1318558, 1.551863, 1.66862, 0, 1, 0.6705883, 1,
-0.1265274, 1.257698, 0.743986, 0, 1, 0.6745098, 1,
-0.1223889, -2.142446, -4.202075, 0, 1, 0.682353, 1,
-0.1191128, -1.468826, -2.474724, 0, 1, 0.6862745, 1,
-0.1135678, 0.1918125, 0.5794906, 0, 1, 0.6941177, 1,
-0.109341, -0.7327264, -1.848462, 0, 1, 0.7019608, 1,
-0.1068854, -1.434124, -2.59669, 0, 1, 0.7058824, 1,
-0.1012008, 0.528587, -2.731511, 0, 1, 0.7137255, 1,
-0.09995378, -0.3932863, -1.936608, 0, 1, 0.7176471, 1,
-0.09810871, -0.780888, -1.347434, 0, 1, 0.7254902, 1,
-0.09667783, 0.6352234, 1.44175, 0, 1, 0.7294118, 1,
-0.0958033, -0.4740073, -2.864345, 0, 1, 0.7372549, 1,
-0.09371959, 0.9281486, 0.623063, 0, 1, 0.7411765, 1,
-0.09369375, 0.1228403, -1.072789, 0, 1, 0.7490196, 1,
-0.08080159, -0.2365825, -2.782143, 0, 1, 0.7529412, 1,
-0.07677563, -1.311262, -2.415756, 0, 1, 0.7607843, 1,
-0.07443692, 0.5059049, 0.1137815, 0, 1, 0.7647059, 1,
-0.07357024, 0.2690088, -0.03615841, 0, 1, 0.772549, 1,
-0.07024688, -0.3589402, -2.55032, 0, 1, 0.7764706, 1,
-0.06936971, 0.4088727, 1.613243, 0, 1, 0.7843137, 1,
-0.06804748, 1.20908, -1.700134, 0, 1, 0.7882353, 1,
-0.05770901, 0.7722141, 1.395658, 0, 1, 0.7960784, 1,
-0.05675582, 0.6819346, -0.002598743, 0, 1, 0.8039216, 1,
-0.05385982, -0.649522, -4.610656, 0, 1, 0.8078431, 1,
-0.05380898, 0.07446627, -0.5379758, 0, 1, 0.8156863, 1,
-0.05017843, 0.05052916, -0.5672551, 0, 1, 0.8196079, 1,
-0.04766102, 0.707805, -0.7083809, 0, 1, 0.827451, 1,
-0.04670216, 0.5426909, 1.405429, 0, 1, 0.8313726, 1,
-0.04509058, 0.7626352, -0.3280238, 0, 1, 0.8392157, 1,
-0.04460483, -0.08193522, -4.171769, 0, 1, 0.8431373, 1,
-0.04232796, 0.5641567, -0.784667, 0, 1, 0.8509804, 1,
-0.03827599, 2.166351, 0.4221266, 0, 1, 0.854902, 1,
-0.0358629, -0.2584256, -2.923836, 0, 1, 0.8627451, 1,
-0.03088195, -1.118196, -1.961482, 0, 1, 0.8666667, 1,
-0.02984735, -0.6049927, -3.955677, 0, 1, 0.8745098, 1,
-0.02920865, 1.001452, -1.605159, 0, 1, 0.8784314, 1,
-0.02814372, -0.06472411, -1.076434, 0, 1, 0.8862745, 1,
-0.02611463, -1.269758, -4.34953, 0, 1, 0.8901961, 1,
-0.02600935, -1.689879, -2.403677, 0, 1, 0.8980392, 1,
-0.02413345, 1.129216, -0.3573062, 0, 1, 0.9058824, 1,
-0.01986771, 2.076978, -1.592158, 0, 1, 0.9098039, 1,
-0.01944272, 0.09143548, 0.07923515, 0, 1, 0.9176471, 1,
-0.01742919, 0.3036022, 0.6622331, 0, 1, 0.9215686, 1,
-0.01672266, 0.8887318, -0.6685719, 0, 1, 0.9294118, 1,
-0.01616204, -0.2216914, -3.093335, 0, 1, 0.9333333, 1,
-0.01448606, 0.552654, 1.528447, 0, 1, 0.9411765, 1,
-0.006253627, -0.8919805, -3.123781, 0, 1, 0.945098, 1,
-0.004351045, 1.316167, 1.731901, 0, 1, 0.9529412, 1,
-0.003738882, -2.640208, -3.167642, 0, 1, 0.9568627, 1,
-0.001953772, 2.665029, 1.249967, 0, 1, 0.9647059, 1,
0.0007835728, -1.631641, 3.275456, 0, 1, 0.9686275, 1,
0.001587714, -0.8528353, 0.5899603, 0, 1, 0.9764706, 1,
0.002605401, 0.8035105, 2.260242, 0, 1, 0.9803922, 1,
0.004168309, -0.6298191, 1.44341, 0, 1, 0.9882353, 1,
0.01100799, -0.2020793, 3.622431, 0, 1, 0.9921569, 1,
0.01302567, -0.007663144, 3.073902, 0, 1, 1, 1,
0.01647101, -1.873951, 2.874192, 0, 0.9921569, 1, 1,
0.01806098, 1.485802, -0.7970074, 0, 0.9882353, 1, 1,
0.02326175, -0.3020406, 2.733856, 0, 0.9803922, 1, 1,
0.02343178, -0.565344, 2.698798, 0, 0.9764706, 1, 1,
0.02606543, 0.1784115, -0.1118808, 0, 0.9686275, 1, 1,
0.02722209, 0.03104338, 2.330199, 0, 0.9647059, 1, 1,
0.02757592, -0.2899665, 3.988324, 0, 0.9568627, 1, 1,
0.03087424, -0.5811637, 2.235474, 0, 0.9529412, 1, 1,
0.03120852, 1.934144, 0.2674314, 0, 0.945098, 1, 1,
0.03140652, -0.1735135, 4.081041, 0, 0.9411765, 1, 1,
0.03370846, 0.5079398, 0.1196451, 0, 0.9333333, 1, 1,
0.03629689, -0.313457, 0.8906934, 0, 0.9294118, 1, 1,
0.03806934, 1.640359, 0.1383865, 0, 0.9215686, 1, 1,
0.0386388, 0.7412922, -0.7740176, 0, 0.9176471, 1, 1,
0.04387777, 1.34212, 0.04085937, 0, 0.9098039, 1, 1,
0.04852317, 0.3936855, 1.130067, 0, 0.9058824, 1, 1,
0.0508532, 0.2762561, 1.662425, 0, 0.8980392, 1, 1,
0.05744606, -0.4607805, 2.807718, 0, 0.8901961, 1, 1,
0.05792921, -1.2433, 5.084526, 0, 0.8862745, 1, 1,
0.06015839, -0.51323, 3.876685, 0, 0.8784314, 1, 1,
0.06483527, -0.4314349, 2.972563, 0, 0.8745098, 1, 1,
0.06744282, -1.597691, 3.083843, 0, 0.8666667, 1, 1,
0.07742298, -1.338813, 2.517546, 0, 0.8627451, 1, 1,
0.07800789, -1.119744, 3.827019, 0, 0.854902, 1, 1,
0.08044726, 0.4013028, -0.4378347, 0, 0.8509804, 1, 1,
0.08288702, -0.5333738, 5.565363, 0, 0.8431373, 1, 1,
0.0830787, -2.44892, 4.938738, 0, 0.8392157, 1, 1,
0.08359284, -0.1974816, 1.77499, 0, 0.8313726, 1, 1,
0.09132026, -1.83561, 2.056062, 0, 0.827451, 1, 1,
0.0952525, 1.48148, -0.582183, 0, 0.8196079, 1, 1,
0.09794007, 1.060158, -1.545817, 0, 0.8156863, 1, 1,
0.0992519, -0.01628206, 0.5079616, 0, 0.8078431, 1, 1,
0.100145, -0.9624752, 5.787299, 0, 0.8039216, 1, 1,
0.1034024, 0.1409086, 1.67486, 0, 0.7960784, 1, 1,
0.1036883, 1.248559, 0.5163687, 0, 0.7882353, 1, 1,
0.10454, 0.3526279, 0.5256953, 0, 0.7843137, 1, 1,
0.105783, -0.7682921, 4.397161, 0, 0.7764706, 1, 1,
0.1095293, -0.8655547, 3.004798, 0, 0.772549, 1, 1,
0.1141199, -0.5945546, 2.759857, 0, 0.7647059, 1, 1,
0.1145377, 0.2754251, 1.293777, 0, 0.7607843, 1, 1,
0.1171108, -0.9934401, 3.329088, 0, 0.7529412, 1, 1,
0.1208035, -0.352277, 2.084137, 0, 0.7490196, 1, 1,
0.1219451, -1.05177, 3.355037, 0, 0.7411765, 1, 1,
0.1241951, -0.01103859, 3.142133, 0, 0.7372549, 1, 1,
0.1245808, -1.832114, 3.673618, 0, 0.7294118, 1, 1,
0.1315041, 0.5703273, 0.4058837, 0, 0.7254902, 1, 1,
0.1418925, -1.412868, 2.628443, 0, 0.7176471, 1, 1,
0.1426928, -0.4244536, 2.278645, 0, 0.7137255, 1, 1,
0.1495437, 0.4177031, -0.6730402, 0, 0.7058824, 1, 1,
0.1499513, -0.4701369, 5.16286, 0, 0.6980392, 1, 1,
0.1499716, -1.137198, 4.608032, 0, 0.6941177, 1, 1,
0.1567583, -0.2689187, 2.064997, 0, 0.6862745, 1, 1,
0.156858, 0.6547871, -0.4170243, 0, 0.682353, 1, 1,
0.1571842, -1.118904, 1.205811, 0, 0.6745098, 1, 1,
0.1572171, -0.9596378, 0.6589109, 0, 0.6705883, 1, 1,
0.1589209, -1.664905, 2.436852, 0, 0.6627451, 1, 1,
0.1600637, -0.5378333, 3.288245, 0, 0.6588235, 1, 1,
0.1656905, -1.102064, 1.676349, 0, 0.6509804, 1, 1,
0.1674147, 2.098445, 0.7364848, 0, 0.6470588, 1, 1,
0.1692984, 0.2084361, -0.1590104, 0, 0.6392157, 1, 1,
0.1740293, 0.503141, -0.3453064, 0, 0.6352941, 1, 1,
0.1764897, 0.069406, 1.245189, 0, 0.627451, 1, 1,
0.1772613, 1.118209, -0.785984, 0, 0.6235294, 1, 1,
0.1776289, -0.4303399, 2.230615, 0, 0.6156863, 1, 1,
0.1779869, -1.644444, 1.281822, 0, 0.6117647, 1, 1,
0.1797422, -1.442177, 0.9632579, 0, 0.6039216, 1, 1,
0.1812969, -0.7273452, 2.862146, 0, 0.5960785, 1, 1,
0.1862766, 0.02072181, 1.303019, 0, 0.5921569, 1, 1,
0.1903961, 1.958291, 1.107158, 0, 0.5843138, 1, 1,
0.191982, -0.2019595, 4.573766, 0, 0.5803922, 1, 1,
0.1920521, -0.2832509, 1.598565, 0, 0.572549, 1, 1,
0.1932893, 1.000193, 0.2895703, 0, 0.5686275, 1, 1,
0.1946607, 1.362782, -0.7182688, 0, 0.5607843, 1, 1,
0.1985639, -0.6522031, 4.377688, 0, 0.5568628, 1, 1,
0.2005698, 0.8467758, 0.6244392, 0, 0.5490196, 1, 1,
0.2023908, 1.666383, 1.655362, 0, 0.5450981, 1, 1,
0.2079236, -0.2520702, 2.948704, 0, 0.5372549, 1, 1,
0.2099924, -1.050351, 2.707171, 0, 0.5333334, 1, 1,
0.2126992, -0.2206591, 1.761553, 0, 0.5254902, 1, 1,
0.2145771, -0.8110043, 1.555474, 0, 0.5215687, 1, 1,
0.2175043, 0.2279379, -0.3148477, 0, 0.5137255, 1, 1,
0.2181318, -1.128177, 1.608989, 0, 0.509804, 1, 1,
0.2236709, 0.1995145, 0.724438, 0, 0.5019608, 1, 1,
0.2243661, -1.088755, 1.829892, 0, 0.4941176, 1, 1,
0.226389, 1.849194, 1.490741, 0, 0.4901961, 1, 1,
0.2295819, -1.481494, 4.098517, 0, 0.4823529, 1, 1,
0.2299614, -1.149794, 1.751468, 0, 0.4784314, 1, 1,
0.2330348, 1.700153, -0.8521412, 0, 0.4705882, 1, 1,
0.2337156, -1.153908, 3.429307, 0, 0.4666667, 1, 1,
0.2342175, -0.4494319, 2.847343, 0, 0.4588235, 1, 1,
0.2407462, 0.5499722, 0.8389052, 0, 0.454902, 1, 1,
0.241304, -0.5621873, 2.882606, 0, 0.4470588, 1, 1,
0.2428206, 0.4446053, 0.9588295, 0, 0.4431373, 1, 1,
0.2473003, 0.8095864, 0.5926003, 0, 0.4352941, 1, 1,
0.2484476, 0.09664691, 2.11622, 0, 0.4313726, 1, 1,
0.2487138, 1.62074, -1.512269, 0, 0.4235294, 1, 1,
0.2495991, 1.320537, -0.1706899, 0, 0.4196078, 1, 1,
0.2498627, -1.14735, 2.574217, 0, 0.4117647, 1, 1,
0.2547829, 2.199314, -1.096027, 0, 0.4078431, 1, 1,
0.2571307, -1.329158, 2.298417, 0, 0.4, 1, 1,
0.2579748, -0.7870966, 2.647129, 0, 0.3921569, 1, 1,
0.2588778, 0.7727556, -0.8184952, 0, 0.3882353, 1, 1,
0.2689491, 0.9469052, 0.1698318, 0, 0.3803922, 1, 1,
0.2726036, 0.5643938, -1.442775, 0, 0.3764706, 1, 1,
0.2779546, -0.8205642, 2.513923, 0, 0.3686275, 1, 1,
0.2841304, 0.6164451, 1.167438, 0, 0.3647059, 1, 1,
0.2846676, -0.2615789, 2.321711, 0, 0.3568628, 1, 1,
0.2910616, 2.104759, 0.2101907, 0, 0.3529412, 1, 1,
0.2911953, -1.101996, 2.947878, 0, 0.345098, 1, 1,
0.2951224, 2.718274, -0.1141787, 0, 0.3411765, 1, 1,
0.2954404, 0.3358257, 0.9472185, 0, 0.3333333, 1, 1,
0.2990594, 0.6542225, 1.331086, 0, 0.3294118, 1, 1,
0.3019564, 1.506376, 1.532248, 0, 0.3215686, 1, 1,
0.312695, 0.02637735, 0.9197838, 0, 0.3176471, 1, 1,
0.3133924, -0.945788, 3.014776, 0, 0.3098039, 1, 1,
0.3163563, -1.170184, 2.569348, 0, 0.3058824, 1, 1,
0.3193752, 2.10331, 1.523115, 0, 0.2980392, 1, 1,
0.3195351, 0.4734937, -0.5273936, 0, 0.2901961, 1, 1,
0.3227014, -1.08505, 2.899652, 0, 0.2862745, 1, 1,
0.3293239, -0.5586518, 3.228909, 0, 0.2784314, 1, 1,
0.3298437, 0.2597115, 0.6775754, 0, 0.2745098, 1, 1,
0.3299918, -1.042037, 3.326506, 0, 0.2666667, 1, 1,
0.3341625, -0.7616909, 4.059699, 0, 0.2627451, 1, 1,
0.3355408, 0.8075666, -1.108763, 0, 0.254902, 1, 1,
0.3417813, 0.8144072, 0.2249229, 0, 0.2509804, 1, 1,
0.3471888, 0.4182298, 0.5048363, 0, 0.2431373, 1, 1,
0.3487315, 1.41258, 0.405249, 0, 0.2392157, 1, 1,
0.3503601, -0.371006, 3.877392, 0, 0.2313726, 1, 1,
0.3504597, 0.1196744, 0.8371542, 0, 0.227451, 1, 1,
0.3531764, 1.330353, -1.024733, 0, 0.2196078, 1, 1,
0.3536336, -0.1879374, 2.641415, 0, 0.2156863, 1, 1,
0.3550366, -1.266576, 1.845276, 0, 0.2078431, 1, 1,
0.3598965, -0.9059947, 2.461043, 0, 0.2039216, 1, 1,
0.3619539, -0.3951657, 1.000664, 0, 0.1960784, 1, 1,
0.3668812, -0.1731265, 1.792192, 0, 0.1882353, 1, 1,
0.36908, -1.545506, 2.895592, 0, 0.1843137, 1, 1,
0.3742844, 0.7774413, -1.012312, 0, 0.1764706, 1, 1,
0.3745602, -1.40852, 2.171924, 0, 0.172549, 1, 1,
0.3811818, -1.352751, 4.440689, 0, 0.1647059, 1, 1,
0.3826119, -0.3273609, 3.676696, 0, 0.1607843, 1, 1,
0.3850101, 2.093527, 0.7171937, 0, 0.1529412, 1, 1,
0.3856002, -1.38875, 2.366485, 0, 0.1490196, 1, 1,
0.3863101, -0.725498, 4.815021, 0, 0.1411765, 1, 1,
0.3872858, 0.6204895, 0.07799528, 0, 0.1372549, 1, 1,
0.4023234, -2.474468, 2.260789, 0, 0.1294118, 1, 1,
0.4023583, -0.2942279, 2.719657, 0, 0.1254902, 1, 1,
0.4052466, 0.7345982, 0.7927971, 0, 0.1176471, 1, 1,
0.4074044, 0.09146751, 2.356366, 0, 0.1137255, 1, 1,
0.4076992, -0.6659691, 2.450926, 0, 0.1058824, 1, 1,
0.4097189, -0.2255796, 0.6845827, 0, 0.09803922, 1, 1,
0.412625, 0.3235323, 0.6121866, 0, 0.09411765, 1, 1,
0.4152017, 0.5112885, -0.243074, 0, 0.08627451, 1, 1,
0.4159365, -0.2620277, 2.969921, 0, 0.08235294, 1, 1,
0.4165995, 1.839453, 1.049769, 0, 0.07450981, 1, 1,
0.4172196, -0.1616803, 1.268479, 0, 0.07058824, 1, 1,
0.4230427, -0.2781009, 0.8383831, 0, 0.0627451, 1, 1,
0.42767, 0.3845164, 0.7015808, 0, 0.05882353, 1, 1,
0.4288307, -1.387134, 3.613909, 0, 0.05098039, 1, 1,
0.4295477, 0.2005473, 0.928519, 0, 0.04705882, 1, 1,
0.4319772, -0.625968, 1.660535, 0, 0.03921569, 1, 1,
0.4321416, 0.4882602, -0.130771, 0, 0.03529412, 1, 1,
0.4346158, 1.101896, 0.8502887, 0, 0.02745098, 1, 1,
0.4350398, 0.9150653, 2.034118, 0, 0.02352941, 1, 1,
0.4393292, -1.061037, 2.556932, 0, 0.01568628, 1, 1,
0.439357, -0.1004593, 0.8298142, 0, 0.01176471, 1, 1,
0.4424113, 0.5182244, -0.1699969, 0, 0.003921569, 1, 1,
0.4436105, 0.5245904, 0.404873, 0.003921569, 0, 1, 1,
0.4444621, 0.1263701, 1.386979, 0.007843138, 0, 1, 1,
0.447348, -2.086224, 4.00746, 0.01568628, 0, 1, 1,
0.4560603, -0.4532906, 1.637416, 0.01960784, 0, 1, 1,
0.4581264, -1.908488, 4.492604, 0.02745098, 0, 1, 1,
0.4617981, -1.421379, 2.480996, 0.03137255, 0, 1, 1,
0.4630371, -0.779247, 2.402131, 0.03921569, 0, 1, 1,
0.4648632, -1.080603, 1.800156, 0.04313726, 0, 1, 1,
0.4657678, -2.354755, 5.037684, 0.05098039, 0, 1, 1,
0.4658893, 1.063071, 0.4219137, 0.05490196, 0, 1, 1,
0.4663447, 0.8146537, 0.919571, 0.0627451, 0, 1, 1,
0.466843, -0.2982241, 1.321439, 0.06666667, 0, 1, 1,
0.4674993, -0.1618709, 1.832815, 0.07450981, 0, 1, 1,
0.471853, 1.249985, 1.915403, 0.07843138, 0, 1, 1,
0.472816, -0.2614252, 2.596403, 0.08627451, 0, 1, 1,
0.4736882, -0.139931, 2.576588, 0.09019608, 0, 1, 1,
0.4749365, -0.481577, 1.459616, 0.09803922, 0, 1, 1,
0.4849559, -0.4373879, 2.697728, 0.1058824, 0, 1, 1,
0.4890749, 0.8395412, 1.425707, 0.1098039, 0, 1, 1,
0.4912711, 1.164773, -0.5922565, 0.1176471, 0, 1, 1,
0.4930059, -0.1567774, 1.202511, 0.1215686, 0, 1, 1,
0.4952559, 2.591927, 1.433533, 0.1294118, 0, 1, 1,
0.4984885, -2.708925, 4.051515, 0.1333333, 0, 1, 1,
0.4989713, -2.240166, 3.798374, 0.1411765, 0, 1, 1,
0.4995525, 0.07621045, 2.530095, 0.145098, 0, 1, 1,
0.5033497, 1.49666, 0.7644631, 0.1529412, 0, 1, 1,
0.5052289, 0.6293371, 2.294142, 0.1568628, 0, 1, 1,
0.5071682, 1.941895, -0.07728358, 0.1647059, 0, 1, 1,
0.5086313, -0.2854892, 0.5313971, 0.1686275, 0, 1, 1,
0.5151836, -1.464941, 1.795817, 0.1764706, 0, 1, 1,
0.5168223, 0.8842998, -0.3445266, 0.1803922, 0, 1, 1,
0.5194272, -0.5226477, 2.320119, 0.1882353, 0, 1, 1,
0.5204638, 1.908587, 2.149693, 0.1921569, 0, 1, 1,
0.5205096, -0.5023311, 1.725751, 0.2, 0, 1, 1,
0.5218602, 0.620872, 0.3907253, 0.2078431, 0, 1, 1,
0.5227386, 1.249912, 0.1280026, 0.2117647, 0, 1, 1,
0.528012, -1.350528, 2.764078, 0.2196078, 0, 1, 1,
0.5389423, -0.06846366, 1.532933, 0.2235294, 0, 1, 1,
0.5410188, -1.8332, 2.907896, 0.2313726, 0, 1, 1,
0.5521391, 1.910237, 1.145168, 0.2352941, 0, 1, 1,
0.5529749, 0.8940761, -0.7169997, 0.2431373, 0, 1, 1,
0.5537165, 0.2116573, 2.812476, 0.2470588, 0, 1, 1,
0.5596518, -0.2921487, 2.779813, 0.254902, 0, 1, 1,
0.560166, -0.4030845, 0.7642307, 0.2588235, 0, 1, 1,
0.562132, 0.7913934, -0.5442723, 0.2666667, 0, 1, 1,
0.5664378, 0.3078016, -0.2460456, 0.2705882, 0, 1, 1,
0.5666901, -0.2437239, 2.897002, 0.2784314, 0, 1, 1,
0.5677128, 0.7639641, 1.81031, 0.282353, 0, 1, 1,
0.568585, 0.2131424, 1.825665, 0.2901961, 0, 1, 1,
0.5687923, 0.06999046, -0.09158978, 0.2941177, 0, 1, 1,
0.5704018, -1.113547, 2.076987, 0.3019608, 0, 1, 1,
0.572099, -0.6026787, 4.140861, 0.3098039, 0, 1, 1,
0.5736634, 0.1797836, 1.790147, 0.3137255, 0, 1, 1,
0.5739201, 0.5181156, 2.068037, 0.3215686, 0, 1, 1,
0.5746597, 0.1619523, 1.335396, 0.3254902, 0, 1, 1,
0.576035, 1.663826, -0.810857, 0.3333333, 0, 1, 1,
0.5762208, -0.6219506, 3.075038, 0.3372549, 0, 1, 1,
0.5779708, 0.130494, 2.018965, 0.345098, 0, 1, 1,
0.5837109, 1.316201, 2.628673, 0.3490196, 0, 1, 1,
0.5839169, -1.697643, 2.912651, 0.3568628, 0, 1, 1,
0.5935881, -2.222173, 1.678355, 0.3607843, 0, 1, 1,
0.5964459, 0.195035, 2.141815, 0.3686275, 0, 1, 1,
0.5992337, -0.2361613, 1.516556, 0.372549, 0, 1, 1,
0.6021001, 1.481078, 1.038615, 0.3803922, 0, 1, 1,
0.6066668, -0.1044812, 1.232599, 0.3843137, 0, 1, 1,
0.607617, 0.5238039, 2.029206, 0.3921569, 0, 1, 1,
0.608394, 0.5839124, 1.478368, 0.3960784, 0, 1, 1,
0.6108057, -1.233294, 2.712257, 0.4039216, 0, 1, 1,
0.6113296, 1.281592, 0.3304781, 0.4117647, 0, 1, 1,
0.6133372, 1.588484, -1.546642, 0.4156863, 0, 1, 1,
0.6213921, 0.3028753, 2.12556, 0.4235294, 0, 1, 1,
0.6301616, -0.481547, 1.639958, 0.427451, 0, 1, 1,
0.6326255, -1.599609, 3.14734, 0.4352941, 0, 1, 1,
0.6416457, -0.2512144, 1.925589, 0.4392157, 0, 1, 1,
0.6420234, -0.6902187, 2.533961, 0.4470588, 0, 1, 1,
0.6482583, -0.6366243, 3.538057, 0.4509804, 0, 1, 1,
0.6512077, 0.3915315, 2.823405, 0.4588235, 0, 1, 1,
0.6536239, 0.1452126, -0.2722805, 0.4627451, 0, 1, 1,
0.6541665, 1.26053, 0.5746708, 0.4705882, 0, 1, 1,
0.654211, -1.638517, 4.317598, 0.4745098, 0, 1, 1,
0.656584, 0.5836228, 2.063048, 0.4823529, 0, 1, 1,
0.6566709, -0.1770922, 1.611772, 0.4862745, 0, 1, 1,
0.65993, 0.4542063, 1.032244, 0.4941176, 0, 1, 1,
0.6616756, -2.308059, 2.894382, 0.5019608, 0, 1, 1,
0.6750752, -0.3709248, 2.27624, 0.5058824, 0, 1, 1,
0.6770691, 0.7787942, 0.06142985, 0.5137255, 0, 1, 1,
0.6861103, 1.124944, 0.05477393, 0.5176471, 0, 1, 1,
0.6929892, -1.124241, 3.858044, 0.5254902, 0, 1, 1,
0.69345, 0.8651879, 1.195383, 0.5294118, 0, 1, 1,
0.6952631, 0.4712258, 1.070783, 0.5372549, 0, 1, 1,
0.6977738, -0.9858928, 1.238038, 0.5411765, 0, 1, 1,
0.699634, -1.486988, 3.505656, 0.5490196, 0, 1, 1,
0.7025173, -1.058577, 3.265933, 0.5529412, 0, 1, 1,
0.7045093, 1.507777, 0.7615575, 0.5607843, 0, 1, 1,
0.7079891, -0.09808364, -0.1774726, 0.5647059, 0, 1, 1,
0.7129039, -0.006676876, 1.592262, 0.572549, 0, 1, 1,
0.7171978, 0.3394669, 0.2844874, 0.5764706, 0, 1, 1,
0.718798, 0.2132137, 1.183975, 0.5843138, 0, 1, 1,
0.7303615, 0.796796, 1.018813, 0.5882353, 0, 1, 1,
0.7344614, -1.373688, 3.333609, 0.5960785, 0, 1, 1,
0.7382585, -1.944384, 3.549454, 0.6039216, 0, 1, 1,
0.7391697, -0.6924558, 0.8210912, 0.6078432, 0, 1, 1,
0.7404577, -0.6820316, 1.384711, 0.6156863, 0, 1, 1,
0.742981, 1.486395, 0.3834411, 0.6196079, 0, 1, 1,
0.7455977, 0.3110432, 2.063853, 0.627451, 0, 1, 1,
0.7540285, -1.170248, 3.967762, 0.6313726, 0, 1, 1,
0.7557451, -1.087003, 1.747459, 0.6392157, 0, 1, 1,
0.758136, -0.8153467, 2.182839, 0.6431373, 0, 1, 1,
0.7583748, 0.5021793, 2.170727, 0.6509804, 0, 1, 1,
0.7612652, 1.004675, -0.7989882, 0.654902, 0, 1, 1,
0.7640411, 0.4320739, 3.630489, 0.6627451, 0, 1, 1,
0.7668412, -0.2734289, -0.2913182, 0.6666667, 0, 1, 1,
0.7829641, 1.401575, 0.8784013, 0.6745098, 0, 1, 1,
0.7969432, -0.08662845, 2.072027, 0.6784314, 0, 1, 1,
0.8003582, 1.199237, -0.7422297, 0.6862745, 0, 1, 1,
0.8040564, -0.4680759, 2.81527, 0.6901961, 0, 1, 1,
0.8107437, -1.708691, 3.602359, 0.6980392, 0, 1, 1,
0.8206466, -0.7611921, 2.521236, 0.7058824, 0, 1, 1,
0.833793, -0.1605266, 1.539487, 0.7098039, 0, 1, 1,
0.835358, -0.1018977, 1.317053, 0.7176471, 0, 1, 1,
0.8399596, -0.009969714, 1.386026, 0.7215686, 0, 1, 1,
0.847838, -0.7177166, 0.9501876, 0.7294118, 0, 1, 1,
0.8497874, -0.9690566, 2.737154, 0.7333333, 0, 1, 1,
0.8538815, -1.735027, 3.467959, 0.7411765, 0, 1, 1,
0.8557172, 0.7522654, 0.1330995, 0.7450981, 0, 1, 1,
0.8705711, -1.553383, 3.071671, 0.7529412, 0, 1, 1,
0.874624, 0.1319429, 0.695976, 0.7568628, 0, 1, 1,
0.8802961, -1.293671, 3.038315, 0.7647059, 0, 1, 1,
0.8815878, -0.4287606, 2.639732, 0.7686275, 0, 1, 1,
0.8864438, 2.217853, 2.044893, 0.7764706, 0, 1, 1,
0.8885846, -0.4681864, 1.589356, 0.7803922, 0, 1, 1,
0.8937874, -0.5547175, 3.53887, 0.7882353, 0, 1, 1,
0.896302, -0.6698778, 0.4612045, 0.7921569, 0, 1, 1,
0.8969203, 0.3619356, 2.071604, 0.8, 0, 1, 1,
0.9050787, -1.601029, 5.354864, 0.8078431, 0, 1, 1,
0.9081442, 0.2369142, -0.4037118, 0.8117647, 0, 1, 1,
0.9098182, 0.1483161, 2.182931, 0.8196079, 0, 1, 1,
0.9132514, -0.443202, -0.4687445, 0.8235294, 0, 1, 1,
0.9162729, -0.08411836, 1.303221, 0.8313726, 0, 1, 1,
0.9210112, 0.4153383, 0.795803, 0.8352941, 0, 1, 1,
0.9290119, 0.1678694, 1.604993, 0.8431373, 0, 1, 1,
0.9333712, 1.649412, -0.192465, 0.8470588, 0, 1, 1,
0.9376748, -1.273191, 2.989154, 0.854902, 0, 1, 1,
0.9390842, -0.6683031, 1.568313, 0.8588235, 0, 1, 1,
0.9416847, -3.030936, 2.992259, 0.8666667, 0, 1, 1,
0.9495499, -2.799227, 2.705764, 0.8705882, 0, 1, 1,
0.9498713, 0.2185963, 2.730865, 0.8784314, 0, 1, 1,
0.958093, 0.8088177, 0.05454962, 0.8823529, 0, 1, 1,
0.9583834, -0.5160367, 2.425036, 0.8901961, 0, 1, 1,
0.9617107, -0.09866028, 0.9901496, 0.8941177, 0, 1, 1,
0.9638981, 1.066201, 1.302213, 0.9019608, 0, 1, 1,
0.9653407, 1.088793, 0.6697617, 0.9098039, 0, 1, 1,
0.9661307, -1.538577, 1.452309, 0.9137255, 0, 1, 1,
0.9710983, -0.4895222, 1.99338, 0.9215686, 0, 1, 1,
0.9737722, 0.6716177, 1.506567, 0.9254902, 0, 1, 1,
0.9946725, -0.05835882, 2.003219, 0.9333333, 0, 1, 1,
0.9956323, -0.2554292, 3.538835, 0.9372549, 0, 1, 1,
0.9972811, 1.136543, -1.039704, 0.945098, 0, 1, 1,
0.9986896, 0.1400755, 0.0173333, 0.9490196, 0, 1, 1,
0.9989821, -1.338908, 2.957937, 0.9568627, 0, 1, 1,
0.999123, -0.2244156, 1.634894, 0.9607843, 0, 1, 1,
1.008365, -0.2021817, 3.252448, 0.9686275, 0, 1, 1,
1.021666, 0.09471131, 0.6651201, 0.972549, 0, 1, 1,
1.030732, -0.9057453, 2.648572, 0.9803922, 0, 1, 1,
1.033411, -0.7471686, 2.172548, 0.9843137, 0, 1, 1,
1.037973, -0.5824, 2.002628, 0.9921569, 0, 1, 1,
1.038834, 0.8514339, -0.5606074, 0.9960784, 0, 1, 1,
1.042338, 0.5910827, 1.198816, 1, 0, 0.9960784, 1,
1.045953, 0.7464453, -1.101695, 1, 0, 0.9882353, 1,
1.049872, 1.94897, -0.2391309, 1, 0, 0.9843137, 1,
1.050123, 1.938302, -0.321752, 1, 0, 0.9764706, 1,
1.050826, -0.1000813, 1.299859, 1, 0, 0.972549, 1,
1.052729, -0.4282074, 0.08802865, 1, 0, 0.9647059, 1,
1.053575, -1.709043, 3.116086, 1, 0, 0.9607843, 1,
1.055217, 0.4946392, -0.5960484, 1, 0, 0.9529412, 1,
1.058797, 0.3005794, 1.652016, 1, 0, 0.9490196, 1,
1.060485, -0.5921471, 2.70237, 1, 0, 0.9411765, 1,
1.070865, 1.633873, 0.4196302, 1, 0, 0.9372549, 1,
1.073476, -0.7454889, 2.949271, 1, 0, 0.9294118, 1,
1.076459, -0.3799954, 1.723974, 1, 0, 0.9254902, 1,
1.092702, 1.0956, 1.338001, 1, 0, 0.9176471, 1,
1.098246, -1.138327, 3.119672, 1, 0, 0.9137255, 1,
1.101696, 1.460306, 0.4041487, 1, 0, 0.9058824, 1,
1.102214, 1.160951, 1.238069, 1, 0, 0.9019608, 1,
1.102991, -0.08468637, 2.60844, 1, 0, 0.8941177, 1,
1.108318, 0.01099837, 4.501082, 1, 0, 0.8862745, 1,
1.111651, 1.081579, -1.415617, 1, 0, 0.8823529, 1,
1.113117, 0.6650175, 2.017625, 1, 0, 0.8745098, 1,
1.118149, -0.2044093, 0.9343304, 1, 0, 0.8705882, 1,
1.12407, -1.194501, 2.089959, 1, 0, 0.8627451, 1,
1.127186, -0.4197711, 1.351129, 1, 0, 0.8588235, 1,
1.134825, -1.303923, 2.139668, 1, 0, 0.8509804, 1,
1.144289, 0.526648, 3.434375, 1, 0, 0.8470588, 1,
1.150357, -1.487309, 2.435435, 1, 0, 0.8392157, 1,
1.152291, 1.053795, 0.2489778, 1, 0, 0.8352941, 1,
1.16053, 0.2622252, 1.661798, 1, 0, 0.827451, 1,
1.161257, -0.9760736, 1.739758, 1, 0, 0.8235294, 1,
1.165683, -0.2073357, 2.081008, 1, 0, 0.8156863, 1,
1.166343, 0.970147, -0.1577996, 1, 0, 0.8117647, 1,
1.174431, 1.101272, -0.9729526, 1, 0, 0.8039216, 1,
1.182494, 0.3385142, 1.404142, 1, 0, 0.7960784, 1,
1.190395, -1.068627, 2.121271, 1, 0, 0.7921569, 1,
1.190771, 1.06332, -0.7065704, 1, 0, 0.7843137, 1,
1.192501, -1.10341, 2.618323, 1, 0, 0.7803922, 1,
1.197468, -0.9880453, 1.685654, 1, 0, 0.772549, 1,
1.218622, -0.008384783, 1.288703, 1, 0, 0.7686275, 1,
1.218816, -0.7250085, 3.043493, 1, 0, 0.7607843, 1,
1.224068, -0.6502762, 1.767613, 1, 0, 0.7568628, 1,
1.233399, 0.0903274, 2.209475, 1, 0, 0.7490196, 1,
1.241265, -0.1040155, 1.439732, 1, 0, 0.7450981, 1,
1.242345, -0.543511, 3.015509, 1, 0, 0.7372549, 1,
1.243836, -0.3330238, 2.971736, 1, 0, 0.7333333, 1,
1.258209, 1.913383, 0.2115412, 1, 0, 0.7254902, 1,
1.259146, 0.8577933, 1.087129, 1, 0, 0.7215686, 1,
1.273944, -0.009954721, 1.773158, 1, 0, 0.7137255, 1,
1.276855, 1.495682, -0.3681791, 1, 0, 0.7098039, 1,
1.28604, 0.01580785, 0.641651, 1, 0, 0.7019608, 1,
1.295044, 1.347669, 1.703544, 1, 0, 0.6941177, 1,
1.307151, 0.8267788, 2.159638, 1, 0, 0.6901961, 1,
1.310563, 0.2739951, 1.83462, 1, 0, 0.682353, 1,
1.3144, -0.1886558, 3.009747, 1, 0, 0.6784314, 1,
1.317292, 0.4668417, 1.002927, 1, 0, 0.6705883, 1,
1.322906, -0.1979083, 0.1282674, 1, 0, 0.6666667, 1,
1.326785, -1.082656, 2.599923, 1, 0, 0.6588235, 1,
1.34112, 1.447723, -0.6662728, 1, 0, 0.654902, 1,
1.342139, -2.037881, 1.998946, 1, 0, 0.6470588, 1,
1.348317, 0.1692612, 0.4261011, 1, 0, 0.6431373, 1,
1.362713, 0.5923412, 0.2431796, 1, 0, 0.6352941, 1,
1.366054, 1.051767, -0.3873638, 1, 0, 0.6313726, 1,
1.38043, -0.5264629, 1.605321, 1, 0, 0.6235294, 1,
1.381542, 0.2378373, 0.4917895, 1, 0, 0.6196079, 1,
1.384084, 0.4918998, 0.9891641, 1, 0, 0.6117647, 1,
1.385286, -0.3582619, 0.3622133, 1, 0, 0.6078432, 1,
1.386672, 0.9903208, 0.9257073, 1, 0, 0.6, 1,
1.387435, 0.2935375, 0.9293129, 1, 0, 0.5921569, 1,
1.390194, 0.4910839, 0.839476, 1, 0, 0.5882353, 1,
1.397656, -1.994627, 3.715786, 1, 0, 0.5803922, 1,
1.398912, -0.2335713, 2.612612, 1, 0, 0.5764706, 1,
1.413659, 0.7811847, -0.927903, 1, 0, 0.5686275, 1,
1.413768, -1.902664, 2.265871, 1, 0, 0.5647059, 1,
1.42715, -0.3419179, 2.979855, 1, 0, 0.5568628, 1,
1.430049, -1.399347, 2.909011, 1, 0, 0.5529412, 1,
1.443031, 1.375907, 0.9992148, 1, 0, 0.5450981, 1,
1.452854, 0.5052164, 0.5042418, 1, 0, 0.5411765, 1,
1.463726, 2.098551, 1.638193, 1, 0, 0.5333334, 1,
1.464572, 1.420696, 1.693141, 1, 0, 0.5294118, 1,
1.469813, -0.3772243, -0.6548342, 1, 0, 0.5215687, 1,
1.470646, -1.190633, 0.7734112, 1, 0, 0.5176471, 1,
1.47371, -1.285498, 0.886578, 1, 0, 0.509804, 1,
1.478962, -0.7172153, 2.939256, 1, 0, 0.5058824, 1,
1.496234, 0.4811634, 0.9585427, 1, 0, 0.4980392, 1,
1.502731, -1.622022, 2.021292, 1, 0, 0.4901961, 1,
1.523699, 0.6974855, 1.646538, 1, 0, 0.4862745, 1,
1.536805, 0.002907585, 2.158137, 1, 0, 0.4784314, 1,
1.53692, 0.6182594, 2.049872, 1, 0, 0.4745098, 1,
1.537511, -1.523425, 2.540302, 1, 0, 0.4666667, 1,
1.545617, -0.8319954, 1.290537, 1, 0, 0.4627451, 1,
1.548377, 1.239349, 0.9892573, 1, 0, 0.454902, 1,
1.556677, -0.9390386, 2.043046, 1, 0, 0.4509804, 1,
1.566927, -0.1316684, 0.093982, 1, 0, 0.4431373, 1,
1.568424, 0.3512371, 0.7106637, 1, 0, 0.4392157, 1,
1.594994, 0.04666267, 1.317931, 1, 0, 0.4313726, 1,
1.604501, 2.624989, -0.1017052, 1, 0, 0.427451, 1,
1.63133, 1.188286, -0.4167183, 1, 0, 0.4196078, 1,
1.642105, 0.5298869, 0.1761328, 1, 0, 0.4156863, 1,
1.653338, 0.3971505, 0.5141041, 1, 0, 0.4078431, 1,
1.655863, -0.8539296, 2.847349, 1, 0, 0.4039216, 1,
1.657425, 1.208137, -0.2507319, 1, 0, 0.3960784, 1,
1.671372, -0.9158179, 2.968008, 1, 0, 0.3882353, 1,
1.680297, -1.314718, 1.849523, 1, 0, 0.3843137, 1,
1.711048, -0.9679033, 1.687338, 1, 0, 0.3764706, 1,
1.727421, -0.5518504, 1.950946, 1, 0, 0.372549, 1,
1.744903, -0.1100922, 3.210472, 1, 0, 0.3647059, 1,
1.754704, 0.3095118, 1.677417, 1, 0, 0.3607843, 1,
1.755588, 0.5474837, 0.09419571, 1, 0, 0.3529412, 1,
1.770344, -2.165197, 3.555497, 1, 0, 0.3490196, 1,
1.798655, 0.238084, 2.612985, 1, 0, 0.3411765, 1,
1.80372, -0.5189359, 1.13627, 1, 0, 0.3372549, 1,
1.810037, -0.9834028, 1.529065, 1, 0, 0.3294118, 1,
1.836503, 1.193738, -0.7285854, 1, 0, 0.3254902, 1,
1.842476, 1.118446, 0.9553701, 1, 0, 0.3176471, 1,
1.849177, -1.972033, 2.788749, 1, 0, 0.3137255, 1,
1.855135, 0.1431963, 0.9851615, 1, 0, 0.3058824, 1,
1.859418, -0.528897, 0.6847233, 1, 0, 0.2980392, 1,
1.863968, 0.7014261, 0.4275414, 1, 0, 0.2941177, 1,
1.874178, -1.186561, 2.139564, 1, 0, 0.2862745, 1,
1.886317, 0.9349476, 3.162212, 1, 0, 0.282353, 1,
1.891888, 0.8684355, 2.791657, 1, 0, 0.2745098, 1,
1.913461, 0.3687555, 1.392314, 1, 0, 0.2705882, 1,
1.933565, -0.04431279, 2.544995, 1, 0, 0.2627451, 1,
1.934821, -1.717912, 1.267836, 1, 0, 0.2588235, 1,
1.94022, -0.1488987, 1.763132, 1, 0, 0.2509804, 1,
1.943082, 0.1273719, 1.211684, 1, 0, 0.2470588, 1,
1.945218, -0.8477674, 2.288108, 1, 0, 0.2392157, 1,
1.970365, -0.1352834, 2.620161, 1, 0, 0.2352941, 1,
1.980017, 0.4867484, -0.9154552, 1, 0, 0.227451, 1,
1.98282, 0.01160727, 2.322569, 1, 0, 0.2235294, 1,
1.98827, 0.6378527, 1.034376, 1, 0, 0.2156863, 1,
2.000766, -0.8811499, 1.234665, 1, 0, 0.2117647, 1,
2.00863, -0.7144173, 0.3930894, 1, 0, 0.2039216, 1,
2.025231, 0.4546786, 1.787054, 1, 0, 0.1960784, 1,
2.028409, -0.9763221, 1.790049, 1, 0, 0.1921569, 1,
2.045384, -0.1646982, 2.919024, 1, 0, 0.1843137, 1,
2.065812, -0.05269858, 2.320865, 1, 0, 0.1803922, 1,
2.073786, 1.269001, 1.698932, 1, 0, 0.172549, 1,
2.083529, -0.9828212, 2.957558, 1, 0, 0.1686275, 1,
2.0873, -0.5069582, 2.245768, 1, 0, 0.1607843, 1,
2.100918, 0.8983741, 1.168753, 1, 0, 0.1568628, 1,
2.107316, -0.5389352, 1.164074, 1, 0, 0.1490196, 1,
2.141814, -0.04548803, 0.5024573, 1, 0, 0.145098, 1,
2.148902, 1.14098, 1.698261, 1, 0, 0.1372549, 1,
2.151862, -0.9774826, 3.134532, 1, 0, 0.1333333, 1,
2.161143, -1.241751, 3.344384, 1, 0, 0.1254902, 1,
2.177494, -0.6710597, 1.415146, 1, 0, 0.1215686, 1,
2.233421, -1.261957, 1.084587, 1, 0, 0.1137255, 1,
2.240133, 1.97248, 0.4379832, 1, 0, 0.1098039, 1,
2.265046, -0.04711118, 2.93169, 1, 0, 0.1019608, 1,
2.284576, 1.200551, 0.09664816, 1, 0, 0.09411765, 1,
2.290493, -0.6719391, 2.575394, 1, 0, 0.09019608, 1,
2.345551, -0.1448798, 1.948167, 1, 0, 0.08235294, 1,
2.365362, -0.0578507, 2.489377, 1, 0, 0.07843138, 1,
2.36789, -0.8755273, 2.633571, 1, 0, 0.07058824, 1,
2.396787, 1.406341, 1.428596, 1, 0, 0.06666667, 1,
2.450889, 0.2684684, -0.1435778, 1, 0, 0.05882353, 1,
2.454694, -1.702819, 4.089453, 1, 0, 0.05490196, 1,
2.492412, -0.6920119, 0.9337865, 1, 0, 0.04705882, 1,
2.718478, -0.7437039, 1.126011, 1, 0, 0.04313726, 1,
2.744262, 1.181202, 1.610283, 1, 0, 0.03529412, 1,
2.759269, 0.2497321, 2.932995, 1, 0, 0.03137255, 1,
2.877117, -1.080191, 2.359916, 1, 0, 0.02352941, 1,
2.927568, 0.7189162, 1.632117, 1, 0, 0.01960784, 1,
2.934133, 0.6554603, -0.01770315, 1, 0, 0.01176471, 1,
4.06652, 0.5028005, 0.7381017, 1, 0, 0.007843138, 1
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
0.5887017, -4.471164, -6.771874, 0, -0.5, 0.5, 0.5,
0.5887017, -4.471164, -6.771874, 1, -0.5, 0.5, 0.5,
0.5887017, -4.471164, -6.771874, 1, 1.5, 0.5, 0.5,
0.5887017, -4.471164, -6.771874, 0, 1.5, 0.5, 0.5
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
-4.068097, -0.3366095, -6.771874, 0, -0.5, 0.5, 0.5,
-4.068097, -0.3366095, -6.771874, 1, -0.5, 0.5, 0.5,
-4.068097, -0.3366095, -6.771874, 1, 1.5, 0.5, 0.5,
-4.068097, -0.3366095, -6.771874, 0, 1.5, 0.5, 0.5
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
-4.068097, -4.471164, 0.417836, 0, -0.5, 0.5, 0.5,
-4.068097, -4.471164, 0.417836, 1, -0.5, 0.5, 0.5,
-4.068097, -4.471164, 0.417836, 1, 1.5, 0.5, 0.5,
-4.068097, -4.471164, 0.417836, 0, 1.5, 0.5, 0.5
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
-2, -3.517036, -5.11271,
4, -3.517036, -5.11271,
-2, -3.517036, -5.11271,
-2, -3.676057, -5.389238,
-1, -3.517036, -5.11271,
-1, -3.676057, -5.389238,
0, -3.517036, -5.11271,
0, -3.676057, -5.389238,
1, -3.517036, -5.11271,
1, -3.676057, -5.389238,
2, -3.517036, -5.11271,
2, -3.676057, -5.389238,
3, -3.517036, -5.11271,
3, -3.676057, -5.389238,
4, -3.517036, -5.11271,
4, -3.676057, -5.389238
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
"3",
"4"
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
-2, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
-2, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
-2, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
-2, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
-1, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
-1, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
-1, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
-1, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
0, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
0, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
0, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
0, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
1, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
1, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
1, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
1, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
2, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
2, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
2, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
2, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
3, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
3, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
3, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
3, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5,
4, -3.9941, -5.942293, 0, -0.5, 0.5, 0.5,
4, -3.9941, -5.942293, 1, -0.5, 0.5, 0.5,
4, -3.9941, -5.942293, 1, 1.5, 0.5, 0.5,
4, -3.9941, -5.942293, 0, 1.5, 0.5, 0.5
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
-2.993451, -3, -5.11271,
-2.993451, 2, -5.11271,
-2.993451, -3, -5.11271,
-3.172559, -3, -5.389238,
-2.993451, -2, -5.11271,
-3.172559, -2, -5.389238,
-2.993451, -1, -5.11271,
-3.172559, -1, -5.389238,
-2.993451, 0, -5.11271,
-3.172559, 0, -5.389238,
-2.993451, 1, -5.11271,
-3.172559, 1, -5.389238,
-2.993451, 2, -5.11271,
-3.172559, 2, -5.389238
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
-3.530774, -3, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, -3, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, -3, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, -3, -5.942293, 0, 1.5, 0.5, 0.5,
-3.530774, -2, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, -2, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, -2, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, -2, -5.942293, 0, 1.5, 0.5, 0.5,
-3.530774, -1, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, -1, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, -1, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, -1, -5.942293, 0, 1.5, 0.5, 0.5,
-3.530774, 0, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, 0, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, 0, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, 0, -5.942293, 0, 1.5, 0.5, 0.5,
-3.530774, 1, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, 1, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, 1, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, 1, -5.942293, 0, 1.5, 0.5, 0.5,
-3.530774, 2, -5.942293, 0, -0.5, 0.5, 0.5,
-3.530774, 2, -5.942293, 1, -0.5, 0.5, 0.5,
-3.530774, 2, -5.942293, 1, 1.5, 0.5, 0.5,
-3.530774, 2, -5.942293, 0, 1.5, 0.5, 0.5
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
-2.993451, -3.517036, -4,
-2.993451, -3.517036, 4,
-2.993451, -3.517036, -4,
-3.172559, -3.676057, -4,
-2.993451, -3.517036, -2,
-3.172559, -3.676057, -2,
-2.993451, -3.517036, 0,
-3.172559, -3.676057, 0,
-2.993451, -3.517036, 2,
-3.172559, -3.676057, 2,
-2.993451, -3.517036, 4,
-3.172559, -3.676057, 4
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
-3.530774, -3.9941, -4, 0, -0.5, 0.5, 0.5,
-3.530774, -3.9941, -4, 1, -0.5, 0.5, 0.5,
-3.530774, -3.9941, -4, 1, 1.5, 0.5, 0.5,
-3.530774, -3.9941, -4, 0, 1.5, 0.5, 0.5,
-3.530774, -3.9941, -2, 0, -0.5, 0.5, 0.5,
-3.530774, -3.9941, -2, 1, -0.5, 0.5, 0.5,
-3.530774, -3.9941, -2, 1, 1.5, 0.5, 0.5,
-3.530774, -3.9941, -2, 0, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 0, 0, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 0, 1, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 0, 1, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 0, 0, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 2, 0, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 2, 1, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 2, 1, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 2, 0, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 4, 0, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 4, 1, -0.5, 0.5, 0.5,
-3.530774, -3.9941, 4, 1, 1.5, 0.5, 0.5,
-3.530774, -3.9941, 4, 0, 1.5, 0.5, 0.5
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
-2.993451, -3.517036, -5.11271,
-2.993451, 2.843817, -5.11271,
-2.993451, -3.517036, 5.948382,
-2.993451, 2.843817, 5.948382,
-2.993451, -3.517036, -5.11271,
-2.993451, -3.517036, 5.948382,
-2.993451, 2.843817, -5.11271,
-2.993451, 2.843817, 5.948382,
-2.993451, -3.517036, -5.11271,
4.170854, -3.517036, -5.11271,
-2.993451, -3.517036, 5.948382,
4.170854, -3.517036, 5.948382,
-2.993451, 2.843817, -5.11271,
4.170854, 2.843817, -5.11271,
-2.993451, 2.843817, 5.948382,
4.170854, 2.843817, 5.948382,
4.170854, -3.517036, -5.11271,
4.170854, 2.843817, -5.11271,
4.170854, -3.517036, 5.948382,
4.170854, 2.843817, 5.948382,
4.170854, -3.517036, -5.11271,
4.170854, -3.517036, 5.948382,
4.170854, 2.843817, -5.11271,
4.170854, 2.843817, 5.948382
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
var radius = 7.813935;
var distance = 34.76508;
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
mvMatrix.translate( -0.5887017, 0.3366095, -0.417836 );
mvMatrix.scale( 1.17926, 1.328215, 0.7638106 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76508);
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
Acetamiprid<-read.table("Acetamiprid.xyz", skip=1)
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
-2.889116, -0.0069079, -0.8745287, 0, 0, 1, 1, 1,
-2.824354, 1.49221, 1.506547, 1, 0, 0, 1, 1,
-2.718971, -0.1455675, -4.475401, 1, 0, 0, 1, 1,
-2.605384, 0.5903746, -1.43314, 1, 0, 0, 1, 1,
-2.550441, 1.116519, -0.5144308, 1, 0, 0, 1, 1,
-2.527705, -2.797205, -1.730948, 1, 0, 0, 1, 1,
-2.485979, 0.6188446, -0.1131956, 0, 0, 0, 1, 1,
-2.432359, -1.332674, -2.061682, 0, 0, 0, 1, 1,
-2.420699, 0.4078296, -2.059814, 0, 0, 0, 1, 1,
-2.381798, -0.6420881, -1.804593, 0, 0, 0, 1, 1,
-2.330891, 1.070504, -0.8596007, 0, 0, 0, 1, 1,
-2.325268, -1.365912, -1.656669, 0, 0, 0, 1, 1,
-2.276231, 0.2284687, -2.451872, 0, 0, 0, 1, 1,
-2.213236, 0.6506368, -0.757063, 1, 1, 1, 1, 1,
-2.170298, 0.8028578, -0.7243541, 1, 1, 1, 1, 1,
-2.156635, -0.9729069, -0.2114657, 1, 1, 1, 1, 1,
-2.145194, -1.0471, -1.385415, 1, 1, 1, 1, 1,
-2.120398, 0.5287974, -0.679503, 1, 1, 1, 1, 1,
-2.117878, 1.085885, -2.88342, 1, 1, 1, 1, 1,
-2.112993, -0.5372608, -2.030631, 1, 1, 1, 1, 1,
-2.092629, -0.6595433, -2.367581, 1, 1, 1, 1, 1,
-2.060817, 1.088075, -2.146104, 1, 1, 1, 1, 1,
-2.033438, 0.6913732, 0.0007406993, 1, 1, 1, 1, 1,
-2.005144, -0.1094994, -0.3717301, 1, 1, 1, 1, 1,
-2.000704, -0.2329278, -2.132855, 1, 1, 1, 1, 1,
-1.986862, -0.03898417, -0.9079175, 1, 1, 1, 1, 1,
-1.966578, 0.4153298, -0.8699892, 1, 1, 1, 1, 1,
-1.961956, 0.3707455, -0.3861011, 1, 1, 1, 1, 1,
-1.955757, 0.6529594, -3.392179, 0, 0, 1, 1, 1,
-1.95346, 0.02955982, -0.559107, 1, 0, 0, 1, 1,
-1.942661, -0.867031, -2.826176, 1, 0, 0, 1, 1,
-1.935354, -0.146608, -1.221809, 1, 0, 0, 1, 1,
-1.925876, -0.660925, -2.929983, 1, 0, 0, 1, 1,
-1.919239, 0.818745, -2.422068, 1, 0, 0, 1, 1,
-1.918979, -1.475847, -1.739537, 0, 0, 0, 1, 1,
-1.917071, -0.8085211, -3.16172, 0, 0, 0, 1, 1,
-1.903809, -0.3051485, -2.861821, 0, 0, 0, 1, 1,
-1.865906, -1.116374, -3.742251, 0, 0, 0, 1, 1,
-1.862291, 1.201969, -2.23308, 0, 0, 0, 1, 1,
-1.85935, 0.5100427, -1.537042, 0, 0, 0, 1, 1,
-1.859004, -0.6039857, -1.017236, 0, 0, 0, 1, 1,
-1.845832, -1.284997, -2.816416, 1, 1, 1, 1, 1,
-1.845561, 0.1868364, -0.8144764, 1, 1, 1, 1, 1,
-1.844138, -0.4768067, -1.834482, 1, 1, 1, 1, 1,
-1.842121, -0.7291957, -2.863322, 1, 1, 1, 1, 1,
-1.829406, -0.04593744, -0.5350939, 1, 1, 1, 1, 1,
-1.820628, 0.1676975, -0.3613928, 1, 1, 1, 1, 1,
-1.817566, -0.5403135, -1.445346, 1, 1, 1, 1, 1,
-1.787348, 0.5646793, -3.655409, 1, 1, 1, 1, 1,
-1.786897, 2.026328, -0.02673163, 1, 1, 1, 1, 1,
-1.782415, 0.9512329, -0.6602798, 1, 1, 1, 1, 1,
-1.763304, -0.5708292, -2.033543, 1, 1, 1, 1, 1,
-1.735547, -0.8095576, -2.474574, 1, 1, 1, 1, 1,
-1.716932, 0.3076874, -0.9837654, 1, 1, 1, 1, 1,
-1.714972, -0.6358011, -2.261534, 1, 1, 1, 1, 1,
-1.714699, 1.418408, -1.36299, 1, 1, 1, 1, 1,
-1.691193, 0.2333663, -0.384248, 0, 0, 1, 1, 1,
-1.679453, 0.5982494, -2.078346, 1, 0, 0, 1, 1,
-1.674936, -0.9543467, -1.827165, 1, 0, 0, 1, 1,
-1.671242, -0.9006952, -2.471364, 1, 0, 0, 1, 1,
-1.663113, 0.3570172, -0.305475, 1, 0, 0, 1, 1,
-1.659738, -0.7245837, -1.296844, 1, 0, 0, 1, 1,
-1.655566, -1.330197, -1.706657, 0, 0, 0, 1, 1,
-1.6488, -1.099705, -2.089042, 0, 0, 0, 1, 1,
-1.642693, -1.093079, -0.7481125, 0, 0, 0, 1, 1,
-1.639788, 1.270696, -0.2606869, 0, 0, 0, 1, 1,
-1.623376, -0.567898, -2.027987, 0, 0, 0, 1, 1,
-1.621538, -0.1979321, -1.241666, 0, 0, 0, 1, 1,
-1.605909, -1.293467, -3.643669, 0, 0, 0, 1, 1,
-1.59866, 0.7652957, 0.7748779, 1, 1, 1, 1, 1,
-1.569692, -0.8114989, -1.751152, 1, 1, 1, 1, 1,
-1.518909, 1.854843, 1.180721, 1, 1, 1, 1, 1,
-1.508384, 0.4323874, -1.13594, 1, 1, 1, 1, 1,
-1.503936, 2.229523, -1.567049, 1, 1, 1, 1, 1,
-1.503843, 1.546249, -0.2526072, 1, 1, 1, 1, 1,
-1.503052, -0.4696735, -1.666844, 1, 1, 1, 1, 1,
-1.496176, 0.2987456, -2.786412, 1, 1, 1, 1, 1,
-1.494136, -1.685334, -3.520984, 1, 1, 1, 1, 1,
-1.477712, 1.44103, 0.07213648, 1, 1, 1, 1, 1,
-1.447815, 0.8222108, -0.1494163, 1, 1, 1, 1, 1,
-1.447769, 0.02805969, -1.400644, 1, 1, 1, 1, 1,
-1.443253, 1.345896, -1.278841, 1, 1, 1, 1, 1,
-1.438413, -0.4209343, -0.8674194, 1, 1, 1, 1, 1,
-1.436672, 0.6894701, -1.719739, 1, 1, 1, 1, 1,
-1.432351, -1.257221, -3.578493, 0, 0, 1, 1, 1,
-1.431339, -1.767226, -1.181337, 1, 0, 0, 1, 1,
-1.429793, 0.001237054, -2.099514, 1, 0, 0, 1, 1,
-1.421742, 1.41433, 1.31135, 1, 0, 0, 1, 1,
-1.409524, 0.02404021, 0.2281417, 1, 0, 0, 1, 1,
-1.405313, 1.717986, -1.056604, 1, 0, 0, 1, 1,
-1.39535, -0.8855075, -2.398552, 0, 0, 0, 1, 1,
-1.391653, -0.196897, -2.286681, 0, 0, 0, 1, 1,
-1.378149, -0.6667669, -1.902486, 0, 0, 0, 1, 1,
-1.375964, 0.401695, -0.3125, 0, 0, 0, 1, 1,
-1.3461, -1.190012, -3.329334, 0, 0, 0, 1, 1,
-1.333629, -1.390875, -2.432154, 0, 0, 0, 1, 1,
-1.326948, 0.04150946, -1.065562, 0, 0, 0, 1, 1,
-1.323981, 1.129062, -0.8950798, 1, 1, 1, 1, 1,
-1.308617, 0.2235982, -1.466268, 1, 1, 1, 1, 1,
-1.306078, 0.1794734, -1.420367, 1, 1, 1, 1, 1,
-1.303361, 1.425254, -0.6862314, 1, 1, 1, 1, 1,
-1.302659, -0.6225713, -1.092518, 1, 1, 1, 1, 1,
-1.298781, -0.8599075, -2.191336, 1, 1, 1, 1, 1,
-1.291769, 1.172772, -1.071882, 1, 1, 1, 1, 1,
-1.286552, -1.106562, -0.2351863, 1, 1, 1, 1, 1,
-1.275551, 0.04363855, -0.5598747, 1, 1, 1, 1, 1,
-1.274799, 1.87321, -2.073076, 1, 1, 1, 1, 1,
-1.273413, 0.8749582, -0.8000807, 1, 1, 1, 1, 1,
-1.259181, -0.1847448, -2.964611, 1, 1, 1, 1, 1,
-1.257686, -1.006391, -2.046483, 1, 1, 1, 1, 1,
-1.257056, 0.6304036, -0.8826841, 1, 1, 1, 1, 1,
-1.257017, -0.546269, -0.1431013, 1, 1, 1, 1, 1,
-1.238195, 0.5932066, -1.857445, 0, 0, 1, 1, 1,
-1.238092, -0.4585054, -2.450691, 1, 0, 0, 1, 1,
-1.232087, 0.8550291, -1.217885, 1, 0, 0, 1, 1,
-1.231571, -0.01687418, -1.770799, 1, 0, 0, 1, 1,
-1.230465, -0.7183386, -1.574948, 1, 0, 0, 1, 1,
-1.223489, -1.371975, -2.78432, 1, 0, 0, 1, 1,
-1.217445, 0.9527313, -1.510294, 0, 0, 0, 1, 1,
-1.203023, 0.2703723, -1.190978, 0, 0, 0, 1, 1,
-1.185098, -0.6517414, -2.984062, 0, 0, 0, 1, 1,
-1.183313, 0.570642, -1.448507, 0, 0, 0, 1, 1,
-1.177885, 0.5854899, -2.164448, 0, 0, 0, 1, 1,
-1.175409, -1.298407, -3.12243, 0, 0, 0, 1, 1,
-1.175282, 0.1016643, -2.884459, 0, 0, 0, 1, 1,
-1.175036, 1.661967, -0.9557571, 1, 1, 1, 1, 1,
-1.165989, -2.18472, -2.788731, 1, 1, 1, 1, 1,
-1.161575, 0.3683884, -1.216728, 1, 1, 1, 1, 1,
-1.161054, -0.6372706, -3.276128, 1, 1, 1, 1, 1,
-1.157497, -0.1590203, -1.789745, 1, 1, 1, 1, 1,
-1.151598, -1.256914, -2.577987, 1, 1, 1, 1, 1,
-1.151202, -0.9999581, -3.282388, 1, 1, 1, 1, 1,
-1.151079, -0.3667114, -1.139145, 1, 1, 1, 1, 1,
-1.143959, -0.5640597, -2.800197, 1, 1, 1, 1, 1,
-1.135192, -1.018359, -3.703394, 1, 1, 1, 1, 1,
-1.133979, 0.02349146, -1.599155, 1, 1, 1, 1, 1,
-1.129672, 1.379049, 0.7299603, 1, 1, 1, 1, 1,
-1.124908, -0.1509299, -1.915759, 1, 1, 1, 1, 1,
-1.114948, 1.220135, 0.09148015, 1, 1, 1, 1, 1,
-1.112374, -0.4377821, -0.9525011, 1, 1, 1, 1, 1,
-1.110269, 0.01280119, -2.403572, 0, 0, 1, 1, 1,
-1.10722, -0.2389606, -2.122376, 1, 0, 0, 1, 1,
-1.099404, 1.760107, -2.411108, 1, 0, 0, 1, 1,
-1.097057, 0.4500338, -2.370914, 1, 0, 0, 1, 1,
-1.096623, -0.9344726, -4.698048, 1, 0, 0, 1, 1,
-1.095621, 0.2883532, -2.077718, 1, 0, 0, 1, 1,
-1.092837, -0.5016312, -1.562245, 0, 0, 0, 1, 1,
-1.089545, -0.6874627, -1.412905, 0, 0, 0, 1, 1,
-1.087037, 1.543641, -0.8127889, 0, 0, 0, 1, 1,
-1.085802, -1.504144, -3.152129, 0, 0, 0, 1, 1,
-1.084774, -2.927322, -2.075964, 0, 0, 0, 1, 1,
-1.084715, 0.4522541, -0.5411963, 0, 0, 0, 1, 1,
-1.080488, -0.9099272, -1.937161, 0, 0, 0, 1, 1,
-1.07757, -0.4035824, -1.979807, 1, 1, 1, 1, 1,
-1.076749, -0.5008878, -4.435585, 1, 1, 1, 1, 1,
-1.076321, 0.4227069, -0.1441059, 1, 1, 1, 1, 1,
-1.07631, 0.03829439, -0.4037138, 1, 1, 1, 1, 1,
-1.072301, 0.5574105, -2.84579, 1, 1, 1, 1, 1,
-1.070855, 0.2291491, -0.2284907, 1, 1, 1, 1, 1,
-1.064289, 0.4428405, 1.048111, 1, 1, 1, 1, 1,
-1.063765, -0.2871553, -0.8124945, 1, 1, 1, 1, 1,
-1.062215, 1.240694, -0.9256848, 1, 1, 1, 1, 1,
-1.054651, 0.721164, -0.6122286, 1, 1, 1, 1, 1,
-1.047884, 0.2161624, -1.491478, 1, 1, 1, 1, 1,
-1.046615, -0.3416989, -2.499103, 1, 1, 1, 1, 1,
-1.044774, -0.07561545, -2.921751, 1, 1, 1, 1, 1,
-1.032613, 1.14714, -0.5359243, 1, 1, 1, 1, 1,
-1.032478, -1.026889, -0.8215777, 1, 1, 1, 1, 1,
-1.018138, -0.9907945, -3.223167, 0, 0, 1, 1, 1,
-1.015656, 0.1083815, -1.215333, 1, 0, 0, 1, 1,
-1.014241, -0.4094131, -1.335908, 1, 0, 0, 1, 1,
-1.011618, -1.19127, -2.897795, 1, 0, 0, 1, 1,
-1.010997, -0.2889232, -0.3314617, 1, 0, 0, 1, 1,
-1.009888, -0.3754139, -1.768655, 1, 0, 0, 1, 1,
-1.001907, 0.5488982, -1.506536, 0, 0, 0, 1, 1,
-0.9991712, 1.258216, -1.718373, 0, 0, 0, 1, 1,
-0.9903522, 0.8281313, -0.4249341, 0, 0, 0, 1, 1,
-0.9890809, -1.984087, -2.111022, 0, 0, 0, 1, 1,
-0.9866299, 1.361382, -1.190388, 0, 0, 0, 1, 1,
-0.981545, 0.0648915, -2.657462, 0, 0, 0, 1, 1,
-0.9747661, -0.4826852, -2.631952, 0, 0, 0, 1, 1,
-0.9712991, -2.135457, -0.8060797, 1, 1, 1, 1, 1,
-0.9647909, -0.2414757, -2.563376, 1, 1, 1, 1, 1,
-0.9536356, -0.08662674, -1.821529, 1, 1, 1, 1, 1,
-0.946866, -0.9448349, -3.007453, 1, 1, 1, 1, 1,
-0.9350949, -0.4202501, -2.646842, 1, 1, 1, 1, 1,
-0.9326236, -1.631094, -3.480363, 1, 1, 1, 1, 1,
-0.9294482, -0.6839278, -0.5994294, 1, 1, 1, 1, 1,
-0.9244674, 0.3664094, -0.4567761, 1, 1, 1, 1, 1,
-0.9241304, -1.291766, -4.573112, 1, 1, 1, 1, 1,
-0.9176645, 0.5565594, -1.74973, 1, 1, 1, 1, 1,
-0.9100357, 1.618269, -1.550445, 1, 1, 1, 1, 1,
-0.909446, 0.9416984, -1.36058, 1, 1, 1, 1, 1,
-0.9088967, -0.9201944, -2.017426, 1, 1, 1, 1, 1,
-0.9054211, -1.005051, -1.153793, 1, 1, 1, 1, 1,
-0.9005939, 0.03955686, -0.8711649, 1, 1, 1, 1, 1,
-0.8953399, -0.4678021, -2.825855, 0, 0, 1, 1, 1,
-0.8935881, 2.751183, -1.104973, 1, 0, 0, 1, 1,
-0.8924317, -0.01103558, -2.501479, 1, 0, 0, 1, 1,
-0.886182, -0.2120187, -2.897322, 1, 0, 0, 1, 1,
-0.8821661, -0.8312835, -3.900617, 1, 0, 0, 1, 1,
-0.8759843, -0.03661605, -1.530126, 1, 0, 0, 1, 1,
-0.8736377, -0.06492317, -4.035222, 0, 0, 0, 1, 1,
-0.8695152, 0.9874197, -2.266234, 0, 0, 0, 1, 1,
-0.8687284, -0.7151842, -1.887998, 0, 0, 0, 1, 1,
-0.8562714, 1.655923, -1.755462, 0, 0, 0, 1, 1,
-0.8550112, -0.5230965, -3.146624, 0, 0, 0, 1, 1,
-0.8539997, -0.6242672, -2.966366, 0, 0, 0, 1, 1,
-0.8537493, 0.5754763, -2.3209, 0, 0, 0, 1, 1,
-0.8459567, 0.1060232, -1.111043, 1, 1, 1, 1, 1,
-0.8456056, -2.09376, -3.007925, 1, 1, 1, 1, 1,
-0.8432155, 0.1144703, -2.157562, 1, 1, 1, 1, 1,
-0.8409117, -0.1114187, -2.066363, 1, 1, 1, 1, 1,
-0.8390254, -1.821449, -2.140522, 1, 1, 1, 1, 1,
-0.8334868, -2.960819, -1.947405, 1, 1, 1, 1, 1,
-0.830042, -0.5803759, -1.605794, 1, 1, 1, 1, 1,
-0.8299192, -1.106235, -2.382598, 1, 1, 1, 1, 1,
-0.8273345, 0.863911, -2.009531, 1, 1, 1, 1, 1,
-0.8261046, -0.8859452, -3.553821, 1, 1, 1, 1, 1,
-0.823785, 0.175945, -2.421213, 1, 1, 1, 1, 1,
-0.820632, -0.5031375, -1.544184, 1, 1, 1, 1, 1,
-0.8125614, 1.081955, -0.7542148, 1, 1, 1, 1, 1,
-0.8090966, 0.1582148, 1.121295, 1, 1, 1, 1, 1,
-0.7886716, -0.1013337, -2.975456, 1, 1, 1, 1, 1,
-0.7818233, 0.175051, -3.060071, 0, 0, 1, 1, 1,
-0.7774273, 0.238407, -1.636036, 1, 0, 0, 1, 1,
-0.7713411, 0.3001518, -1.074803, 1, 0, 0, 1, 1,
-0.770004, -0.6193582, -1.262125, 1, 0, 0, 1, 1,
-0.7695298, 0.5225849, -1.595196, 1, 0, 0, 1, 1,
-0.768755, 1.92217, -0.8490115, 1, 0, 0, 1, 1,
-0.7677498, -0.8323324, -1.831995, 0, 0, 0, 1, 1,
-0.7632775, -0.2314359, -2.460899, 0, 0, 0, 1, 1,
-0.7615891, 1.271055, -2.257335, 0, 0, 0, 1, 1,
-0.7591317, 0.08039684, -2.708925, 0, 0, 0, 1, 1,
-0.7586223, -0.5000654, -2.412289, 0, 0, 0, 1, 1,
-0.7541319, -0.3020099, -3.440902, 0, 0, 0, 1, 1,
-0.7512376, 0.4643871, -0.4726452, 0, 0, 0, 1, 1,
-0.7505774, -1.819529, -1.578642, 1, 1, 1, 1, 1,
-0.7449962, -1.320951, -3.15632, 1, 1, 1, 1, 1,
-0.7433257, 1.249, 0.8084742, 1, 1, 1, 1, 1,
-0.743049, 2.345291, -1.162477, 1, 1, 1, 1, 1,
-0.7403592, 1.097714, -1.840391, 1, 1, 1, 1, 1,
-0.733346, -0.05436812, -2.098855, 1, 1, 1, 1, 1,
-0.7309424, -1.369313, -1.734028, 1, 1, 1, 1, 1,
-0.7171339, 1.53387, -0.1214727, 1, 1, 1, 1, 1,
-0.715399, 0.7423202, -3.122532, 1, 1, 1, 1, 1,
-0.7135154, -1.854231, -2.451567, 1, 1, 1, 1, 1,
-0.7121857, -0.1029094, 0.1939795, 1, 1, 1, 1, 1,
-0.7117682, -0.2428186, -1.728947, 1, 1, 1, 1, 1,
-0.7076182, 0.03927898, 0.3987949, 1, 1, 1, 1, 1,
-0.7071204, -0.6105518, -3.005157, 1, 1, 1, 1, 1,
-0.7055552, -0.7885255, -2.294331, 1, 1, 1, 1, 1,
-0.7012547, -1.383559, -2.225141, 0, 0, 1, 1, 1,
-0.7010375, -1.078051, -3.695762, 1, 0, 0, 1, 1,
-0.695024, -0.6881216, -1.826834, 1, 0, 0, 1, 1,
-0.6916465, -0.9557355, -3.303533, 1, 0, 0, 1, 1,
-0.6900464, 0.7850295, -1.934277, 1, 0, 0, 1, 1,
-0.6864344, -0.5416247, -3.021698, 1, 0, 0, 1, 1,
-0.6833115, 2.491512, 0.2625878, 0, 0, 0, 1, 1,
-0.6823373, -0.3774671, -2.12383, 0, 0, 0, 1, 1,
-0.682038, 1.045871, -1.329779, 0, 0, 0, 1, 1,
-0.6776429, 1.216555, -1.795493, 0, 0, 0, 1, 1,
-0.6765034, -1.175725, -2.600579, 0, 0, 0, 1, 1,
-0.673878, -2.707597, -3.464937, 0, 0, 0, 1, 1,
-0.6707836, -0.5167798, 0.4189653, 0, 0, 0, 1, 1,
-0.6662742, 0.3971419, -0.3986835, 1, 1, 1, 1, 1,
-0.6649118, -1.181705, -2.728471, 1, 1, 1, 1, 1,
-0.6624195, -1.006057, -2.104986, 1, 1, 1, 1, 1,
-0.6551353, 1.26265, 1.601284, 1, 1, 1, 1, 1,
-0.643784, 2.261839, -1.822718, 1, 1, 1, 1, 1,
-0.6392676, -0.1788939, -2.613292, 1, 1, 1, 1, 1,
-0.6336094, -1.357721, -4.623215, 1, 1, 1, 1, 1,
-0.6329141, -1.020958, -3.342747, 1, 1, 1, 1, 1,
-0.6328921, -0.9606277, -2.663778, 1, 1, 1, 1, 1,
-0.6222277, 1.325273, -1.363434, 1, 1, 1, 1, 1,
-0.6146504, -0.04589995, -3.076988, 1, 1, 1, 1, 1,
-0.6119216, 0.3052328, 0.3681979, 1, 1, 1, 1, 1,
-0.6038936, 0.1587024, -2.086366, 1, 1, 1, 1, 1,
-0.5934948, 0.1146529, -1.707555, 1, 1, 1, 1, 1,
-0.5875489, 1.123265, 0.5420617, 1, 1, 1, 1, 1,
-0.5836076, 1.610015, -0.1912419, 0, 0, 1, 1, 1,
-0.5794795, -0.5435149, -3.125144, 1, 0, 0, 1, 1,
-0.5773363, 1.185976, -0.2284608, 1, 0, 0, 1, 1,
-0.5765265, 1.511202, 0.004152325, 1, 0, 0, 1, 1,
-0.574246, 0.3701782, -1.699282, 1, 0, 0, 1, 1,
-0.5730859, 0.9812737, 0.6778896, 1, 0, 0, 1, 1,
-0.5730023, 0.3270664, -2.613793, 0, 0, 0, 1, 1,
-0.5704476, -0.1181157, -2.136573, 0, 0, 0, 1, 1,
-0.569689, 0.6818852, 1.042805, 0, 0, 0, 1, 1,
-0.5646679, -0.9832383, -0.7434254, 0, 0, 0, 1, 1,
-0.5634285, -0.488747, -2.263341, 0, 0, 0, 1, 1,
-0.5633538, -0.1711041, -2.675317, 0, 0, 0, 1, 1,
-0.5630345, -0.5107558, -2.112093, 0, 0, 0, 1, 1,
-0.5582026, -0.057308, -1.431971, 1, 1, 1, 1, 1,
-0.5563304, -1.172144, -2.239724, 1, 1, 1, 1, 1,
-0.5549524, -1.016661, -3.409874, 1, 1, 1, 1, 1,
-0.5537699, 0.9136418, -1.049353, 1, 1, 1, 1, 1,
-0.5495436, 0.6352993, 0.9879254, 1, 1, 1, 1, 1,
-0.5410898, 0.204317, -1.225776, 1, 1, 1, 1, 1,
-0.5328923, 0.9336706, 0.2288265, 1, 1, 1, 1, 1,
-0.5318715, 0.07059862, -1.258482, 1, 1, 1, 1, 1,
-0.5277165, 0.8476218, 0.2767221, 1, 1, 1, 1, 1,
-0.527067, 1.270903, -0.1409123, 1, 1, 1, 1, 1,
-0.5268968, 0.1208423, -1.454476, 1, 1, 1, 1, 1,
-0.5235377, 1.694554, -0.4610891, 1, 1, 1, 1, 1,
-0.5192607, -1.085772, -1.914038, 1, 1, 1, 1, 1,
-0.5185601, -1.625435, -2.649609, 1, 1, 1, 1, 1,
-0.5146815, -0.9873485, -3.335098, 1, 1, 1, 1, 1,
-0.5106407, -2.665153, -2.777604, 0, 0, 1, 1, 1,
-0.5099866, -0.8084947, -2.367028, 1, 0, 0, 1, 1,
-0.507313, 1.935107, 0.3493567, 1, 0, 0, 1, 1,
-0.5064063, -1.361242, -4.398811, 1, 0, 0, 1, 1,
-0.5003942, 0.6766099, -0.2017261, 1, 0, 0, 1, 1,
-0.488847, 0.8793861, -0.4298185, 1, 0, 0, 1, 1,
-0.4886541, -0.8092652, -3.518587, 0, 0, 0, 1, 1,
-0.4788554, -0.4992326, -1.685879, 0, 0, 0, 1, 1,
-0.476775, 0.141367, -0.09425374, 0, 0, 0, 1, 1,
-0.4722616, 0.5592914, -0.7047513, 0, 0, 0, 1, 1,
-0.4718976, -0.002738928, -0.7504843, 0, 0, 0, 1, 1,
-0.468056, -0.1026629, -1.512005, 0, 0, 0, 1, 1,
-0.4519954, -0.6589959, -0.9107187, 0, 0, 0, 1, 1,
-0.4498819, 0.1813912, -1.617725, 1, 1, 1, 1, 1,
-0.4484021, 0.8248119, 0.2800642, 1, 1, 1, 1, 1,
-0.4479686, -0.9434189, -3.62212, 1, 1, 1, 1, 1,
-0.4453955, -0.2340569, -0.7840112, 1, 1, 1, 1, 1,
-0.4450993, -1.175378, -1.520153, 1, 1, 1, 1, 1,
-0.439381, -1.147257, -1.32059, 1, 1, 1, 1, 1,
-0.4371749, 0.8720523, -0.3841543, 1, 1, 1, 1, 1,
-0.431685, 0.4105296, -2.655355, 1, 1, 1, 1, 1,
-0.428124, 0.3282198, -0.7339396, 1, 1, 1, 1, 1,
-0.4267142, -0.1771185, -1.428731, 1, 1, 1, 1, 1,
-0.4264243, -0.7125294, -3.289011, 1, 1, 1, 1, 1,
-0.4252572, 1.744967, 0.09364498, 1, 1, 1, 1, 1,
-0.4244941, 0.1666766, -1.753384, 1, 1, 1, 1, 1,
-0.4240478, 0.3681059, -0.2106508, 1, 1, 1, 1, 1,
-0.422995, -0.5896543, -0.3998139, 1, 1, 1, 1, 1,
-0.4224964, 0.2031421, -2.378994, 0, 0, 1, 1, 1,
-0.4205205, 1.856949, -0.3457741, 1, 0, 0, 1, 1,
-0.417998, -0.7500677, -0.3577905, 1, 0, 0, 1, 1,
-0.4113351, -1.448284, -2.490806, 1, 0, 0, 1, 1,
-0.4070616, 0.03035369, -1.483364, 1, 0, 0, 1, 1,
-0.4060872, -1.499612, -3.381946, 1, 0, 0, 1, 1,
-0.4060287, 0.09965602, -2.760571, 0, 0, 0, 1, 1,
-0.4016715, -1.180844, -2.783795, 0, 0, 0, 1, 1,
-0.4016249, -0.3231567, -0.07524963, 0, 0, 0, 1, 1,
-0.3955215, 0.9078465, -0.8715383, 0, 0, 0, 1, 1,
-0.3925766, -0.63069, -2.659655, 0, 0, 0, 1, 1,
-0.3841068, 0.61019, -1.103639, 0, 0, 0, 1, 1,
-0.3811256, 0.8204501, -0.5648987, 0, 0, 0, 1, 1,
-0.381003, 0.586939, -0.5494668, 1, 1, 1, 1, 1,
-0.3772734, -0.5511225, -4.082494, 1, 1, 1, 1, 1,
-0.3752157, 2.00309, 0.05771286, 1, 1, 1, 1, 1,
-0.3694418, 0.796443, -0.399604, 1, 1, 1, 1, 1,
-0.3665608, 0.9794731, -1.365231, 1, 1, 1, 1, 1,
-0.3655517, 1.923749, 0.7133666, 1, 1, 1, 1, 1,
-0.3627041, 0.3200761, -2.860709, 1, 1, 1, 1, 1,
-0.3610696, -0.6108225, -2.309905, 1, 1, 1, 1, 1,
-0.3586061, -0.2583334, -2.59448, 1, 1, 1, 1, 1,
-0.3542708, -0.4485062, -3.542386, 1, 1, 1, 1, 1,
-0.3529688, -0.07097105, -1.309678, 1, 1, 1, 1, 1,
-0.3502153, -0.2996093, -3.843714, 1, 1, 1, 1, 1,
-0.3416753, 1.227178, 0.492896, 1, 1, 1, 1, 1,
-0.3367481, -0.2130006, -2.089135, 1, 1, 1, 1, 1,
-0.3311435, 2.270669, -1.19301, 1, 1, 1, 1, 1,
-0.326499, 0.4555756, -1.270169, 0, 0, 1, 1, 1,
-0.3226952, -0.1769041, -2.650296, 1, 0, 0, 1, 1,
-0.3195198, 0.9946935, -0.9102617, 1, 0, 0, 1, 1,
-0.3187625, -1.321254, -3.973253, 1, 0, 0, 1, 1,
-0.3142126, -0.9493755, -3.857926, 1, 0, 0, 1, 1,
-0.3134824, 1.731682, -0.458233, 1, 0, 0, 1, 1,
-0.3092869, 0.9972411, -0.76112, 0, 0, 0, 1, 1,
-0.3066363, 1.943733, -0.9313338, 0, 0, 0, 1, 1,
-0.3063554, -0.2419043, -1.696918, 0, 0, 0, 1, 1,
-0.2989518, -0.4796254, -2.276947, 0, 0, 0, 1, 1,
-0.2955729, -1.176314, -2.577459, 0, 0, 0, 1, 1,
-0.2949552, -0.805401, -2.374494, 0, 0, 0, 1, 1,
-0.289687, 0.06011527, -1.330884, 0, 0, 0, 1, 1,
-0.2854919, -1.186871, -2.907553, 1, 1, 1, 1, 1,
-0.284659, -1.16944, -1.733004, 1, 1, 1, 1, 1,
-0.2833731, -0.7612963, -1.953831, 1, 1, 1, 1, 1,
-0.2791043, 0.8092132, -0.02975788, 1, 1, 1, 1, 1,
-0.2779462, 0.4924617, -0.01108612, 1, 1, 1, 1, 1,
-0.2752872, -0.8495098, -3.191213, 1, 1, 1, 1, 1,
-0.2709285, 0.6785678, 0.4050152, 1, 1, 1, 1, 1,
-0.2658335, -0.423108, -2.340253, 1, 1, 1, 1, 1,
-0.2654448, 0.1871994, -2.262164, 1, 1, 1, 1, 1,
-0.262447, 0.9184383, -0.03127162, 1, 1, 1, 1, 1,
-0.2609141, -0.8896595, -4.200812, 1, 1, 1, 1, 1,
-0.260763, 0.9430611, -0.6329216, 1, 1, 1, 1, 1,
-0.2601231, -0.466945, -4.951627, 1, 1, 1, 1, 1,
-0.2569683, -0.8139513, -2.282604, 1, 1, 1, 1, 1,
-0.2461491, 0.8384576, 0.187212, 1, 1, 1, 1, 1,
-0.2444504, 0.01399159, -1.202495, 0, 0, 1, 1, 1,
-0.2417455, -0.9875517, -4.683064, 1, 0, 0, 1, 1,
-0.2295709, -0.5864261, -2.126888, 1, 0, 0, 1, 1,
-0.2286373, -1.299855, -1.052851, 1, 0, 0, 1, 1,
-0.2228372, 1.054792, 0.7647274, 1, 0, 0, 1, 1,
-0.2195213, -0.6401841, -3.235092, 1, 0, 0, 1, 1,
-0.2151276, 0.02152575, -1.347666, 0, 0, 0, 1, 1,
-0.2133287, -0.4046101, -1.458553, 0, 0, 0, 1, 1,
-0.2112424, -0.1084682, -1.205022, 0, 0, 0, 1, 1,
-0.2098925, -0.4596869, -2.117779, 0, 0, 0, 1, 1,
-0.2098145, 0.01781503, -3.332713, 0, 0, 0, 1, 1,
-0.2092845, 0.3556191, -0.1557266, 0, 0, 0, 1, 1,
-0.2079741, -0.636335, -2.308062, 0, 0, 0, 1, 1,
-0.2064439, -1.033522, -2.555588, 1, 1, 1, 1, 1,
-0.2057071, -0.1234599, -3.426047, 1, 1, 1, 1, 1,
-0.2039875, 0.7449771, -2.394018, 1, 1, 1, 1, 1,
-0.2034964, -0.5587841, -4.071925, 1, 1, 1, 1, 1,
-0.2033444, -1.051408, -2.430412, 1, 1, 1, 1, 1,
-0.1986429, -0.5816982, -2.248257, 1, 1, 1, 1, 1,
-0.1979339, 0.5933006, -1.04826, 1, 1, 1, 1, 1,
-0.1970269, -1.138949, -3.99839, 1, 1, 1, 1, 1,
-0.1967674, 1.733662, -0.9399216, 1, 1, 1, 1, 1,
-0.1948184, -0.2874976, -3.254994, 1, 1, 1, 1, 1,
-0.1931178, -2.636054, -1.657156, 1, 1, 1, 1, 1,
-0.1908664, -0.4066175, -2.351633, 1, 1, 1, 1, 1,
-0.1867469, 0.5244933, 0.1088545, 1, 1, 1, 1, 1,
-0.1866456, 0.46038, 0.09384234, 1, 1, 1, 1, 1,
-0.1836992, 1.486091, -1.016461, 1, 1, 1, 1, 1,
-0.1813576, -1.569561, -4.41065, 0, 0, 1, 1, 1,
-0.1806083, -3.424402, -3.556858, 1, 0, 0, 1, 1,
-0.178017, -2.162769, -2.430732, 1, 0, 0, 1, 1,
-0.1772783, -0.6036999, -1.892664, 1, 0, 0, 1, 1,
-0.1754166, -0.5828748, -4.043751, 1, 0, 0, 1, 1,
-0.1745919, 1.256582, -1.319623, 1, 0, 0, 1, 1,
-0.1732013, 0.09241516, -1.68088, 0, 0, 0, 1, 1,
-0.1715232, 1.205275, -0.31683, 0, 0, 0, 1, 1,
-0.1690297, 0.3783498, -1.383033, 0, 0, 0, 1, 1,
-0.1662052, -1.181142, -3.187567, 0, 0, 0, 1, 1,
-0.1646126, -0.7746612, -2.622194, 0, 0, 0, 1, 1,
-0.1637052, -0.2883999, -3.619588, 0, 0, 0, 1, 1,
-0.1607523, -0.773249, -2.666995, 0, 0, 0, 1, 1,
-0.1604525, -0.8660811, -4.162562, 1, 1, 1, 1, 1,
-0.1599518, 0.3375675, 0.4732396, 1, 1, 1, 1, 1,
-0.1592516, 0.6320638, -0.976087, 1, 1, 1, 1, 1,
-0.1546322, -1.23316, -2.143295, 1, 1, 1, 1, 1,
-0.1519686, -1.151952, -3.851404, 1, 1, 1, 1, 1,
-0.1485524, 2.12527, 1.00682, 1, 1, 1, 1, 1,
-0.1483399, 1.165401, 0.2976882, 1, 1, 1, 1, 1,
-0.1454795, -0.1060902, -4.15398, 1, 1, 1, 1, 1,
-0.1406197, 1.626633, 0.0414922, 1, 1, 1, 1, 1,
-0.1375193, 0.6161371, -1.726218, 1, 1, 1, 1, 1,
-0.1343666, 0.2346502, -0.1262208, 1, 1, 1, 1, 1,
-0.1335496, -0.1989, -2.491703, 1, 1, 1, 1, 1,
-0.1318558, 1.551863, 1.66862, 1, 1, 1, 1, 1,
-0.1265274, 1.257698, 0.743986, 1, 1, 1, 1, 1,
-0.1223889, -2.142446, -4.202075, 1, 1, 1, 1, 1,
-0.1191128, -1.468826, -2.474724, 0, 0, 1, 1, 1,
-0.1135678, 0.1918125, 0.5794906, 1, 0, 0, 1, 1,
-0.109341, -0.7327264, -1.848462, 1, 0, 0, 1, 1,
-0.1068854, -1.434124, -2.59669, 1, 0, 0, 1, 1,
-0.1012008, 0.528587, -2.731511, 1, 0, 0, 1, 1,
-0.09995378, -0.3932863, -1.936608, 1, 0, 0, 1, 1,
-0.09810871, -0.780888, -1.347434, 0, 0, 0, 1, 1,
-0.09667783, 0.6352234, 1.44175, 0, 0, 0, 1, 1,
-0.0958033, -0.4740073, -2.864345, 0, 0, 0, 1, 1,
-0.09371959, 0.9281486, 0.623063, 0, 0, 0, 1, 1,
-0.09369375, 0.1228403, -1.072789, 0, 0, 0, 1, 1,
-0.08080159, -0.2365825, -2.782143, 0, 0, 0, 1, 1,
-0.07677563, -1.311262, -2.415756, 0, 0, 0, 1, 1,
-0.07443692, 0.5059049, 0.1137815, 1, 1, 1, 1, 1,
-0.07357024, 0.2690088, -0.03615841, 1, 1, 1, 1, 1,
-0.07024688, -0.3589402, -2.55032, 1, 1, 1, 1, 1,
-0.06936971, 0.4088727, 1.613243, 1, 1, 1, 1, 1,
-0.06804748, 1.20908, -1.700134, 1, 1, 1, 1, 1,
-0.05770901, 0.7722141, 1.395658, 1, 1, 1, 1, 1,
-0.05675582, 0.6819346, -0.002598743, 1, 1, 1, 1, 1,
-0.05385982, -0.649522, -4.610656, 1, 1, 1, 1, 1,
-0.05380898, 0.07446627, -0.5379758, 1, 1, 1, 1, 1,
-0.05017843, 0.05052916, -0.5672551, 1, 1, 1, 1, 1,
-0.04766102, 0.707805, -0.7083809, 1, 1, 1, 1, 1,
-0.04670216, 0.5426909, 1.405429, 1, 1, 1, 1, 1,
-0.04509058, 0.7626352, -0.3280238, 1, 1, 1, 1, 1,
-0.04460483, -0.08193522, -4.171769, 1, 1, 1, 1, 1,
-0.04232796, 0.5641567, -0.784667, 1, 1, 1, 1, 1,
-0.03827599, 2.166351, 0.4221266, 0, 0, 1, 1, 1,
-0.0358629, -0.2584256, -2.923836, 1, 0, 0, 1, 1,
-0.03088195, -1.118196, -1.961482, 1, 0, 0, 1, 1,
-0.02984735, -0.6049927, -3.955677, 1, 0, 0, 1, 1,
-0.02920865, 1.001452, -1.605159, 1, 0, 0, 1, 1,
-0.02814372, -0.06472411, -1.076434, 1, 0, 0, 1, 1,
-0.02611463, -1.269758, -4.34953, 0, 0, 0, 1, 1,
-0.02600935, -1.689879, -2.403677, 0, 0, 0, 1, 1,
-0.02413345, 1.129216, -0.3573062, 0, 0, 0, 1, 1,
-0.01986771, 2.076978, -1.592158, 0, 0, 0, 1, 1,
-0.01944272, 0.09143548, 0.07923515, 0, 0, 0, 1, 1,
-0.01742919, 0.3036022, 0.6622331, 0, 0, 0, 1, 1,
-0.01672266, 0.8887318, -0.6685719, 0, 0, 0, 1, 1,
-0.01616204, -0.2216914, -3.093335, 1, 1, 1, 1, 1,
-0.01448606, 0.552654, 1.528447, 1, 1, 1, 1, 1,
-0.006253627, -0.8919805, -3.123781, 1, 1, 1, 1, 1,
-0.004351045, 1.316167, 1.731901, 1, 1, 1, 1, 1,
-0.003738882, -2.640208, -3.167642, 1, 1, 1, 1, 1,
-0.001953772, 2.665029, 1.249967, 1, 1, 1, 1, 1,
0.0007835728, -1.631641, 3.275456, 1, 1, 1, 1, 1,
0.001587714, -0.8528353, 0.5899603, 1, 1, 1, 1, 1,
0.002605401, 0.8035105, 2.260242, 1, 1, 1, 1, 1,
0.004168309, -0.6298191, 1.44341, 1, 1, 1, 1, 1,
0.01100799, -0.2020793, 3.622431, 1, 1, 1, 1, 1,
0.01302567, -0.007663144, 3.073902, 1, 1, 1, 1, 1,
0.01647101, -1.873951, 2.874192, 1, 1, 1, 1, 1,
0.01806098, 1.485802, -0.7970074, 1, 1, 1, 1, 1,
0.02326175, -0.3020406, 2.733856, 1, 1, 1, 1, 1,
0.02343178, -0.565344, 2.698798, 0, 0, 1, 1, 1,
0.02606543, 0.1784115, -0.1118808, 1, 0, 0, 1, 1,
0.02722209, 0.03104338, 2.330199, 1, 0, 0, 1, 1,
0.02757592, -0.2899665, 3.988324, 1, 0, 0, 1, 1,
0.03087424, -0.5811637, 2.235474, 1, 0, 0, 1, 1,
0.03120852, 1.934144, 0.2674314, 1, 0, 0, 1, 1,
0.03140652, -0.1735135, 4.081041, 0, 0, 0, 1, 1,
0.03370846, 0.5079398, 0.1196451, 0, 0, 0, 1, 1,
0.03629689, -0.313457, 0.8906934, 0, 0, 0, 1, 1,
0.03806934, 1.640359, 0.1383865, 0, 0, 0, 1, 1,
0.0386388, 0.7412922, -0.7740176, 0, 0, 0, 1, 1,
0.04387777, 1.34212, 0.04085937, 0, 0, 0, 1, 1,
0.04852317, 0.3936855, 1.130067, 0, 0, 0, 1, 1,
0.0508532, 0.2762561, 1.662425, 1, 1, 1, 1, 1,
0.05744606, -0.4607805, 2.807718, 1, 1, 1, 1, 1,
0.05792921, -1.2433, 5.084526, 1, 1, 1, 1, 1,
0.06015839, -0.51323, 3.876685, 1, 1, 1, 1, 1,
0.06483527, -0.4314349, 2.972563, 1, 1, 1, 1, 1,
0.06744282, -1.597691, 3.083843, 1, 1, 1, 1, 1,
0.07742298, -1.338813, 2.517546, 1, 1, 1, 1, 1,
0.07800789, -1.119744, 3.827019, 1, 1, 1, 1, 1,
0.08044726, 0.4013028, -0.4378347, 1, 1, 1, 1, 1,
0.08288702, -0.5333738, 5.565363, 1, 1, 1, 1, 1,
0.0830787, -2.44892, 4.938738, 1, 1, 1, 1, 1,
0.08359284, -0.1974816, 1.77499, 1, 1, 1, 1, 1,
0.09132026, -1.83561, 2.056062, 1, 1, 1, 1, 1,
0.0952525, 1.48148, -0.582183, 1, 1, 1, 1, 1,
0.09794007, 1.060158, -1.545817, 1, 1, 1, 1, 1,
0.0992519, -0.01628206, 0.5079616, 0, 0, 1, 1, 1,
0.100145, -0.9624752, 5.787299, 1, 0, 0, 1, 1,
0.1034024, 0.1409086, 1.67486, 1, 0, 0, 1, 1,
0.1036883, 1.248559, 0.5163687, 1, 0, 0, 1, 1,
0.10454, 0.3526279, 0.5256953, 1, 0, 0, 1, 1,
0.105783, -0.7682921, 4.397161, 1, 0, 0, 1, 1,
0.1095293, -0.8655547, 3.004798, 0, 0, 0, 1, 1,
0.1141199, -0.5945546, 2.759857, 0, 0, 0, 1, 1,
0.1145377, 0.2754251, 1.293777, 0, 0, 0, 1, 1,
0.1171108, -0.9934401, 3.329088, 0, 0, 0, 1, 1,
0.1208035, -0.352277, 2.084137, 0, 0, 0, 1, 1,
0.1219451, -1.05177, 3.355037, 0, 0, 0, 1, 1,
0.1241951, -0.01103859, 3.142133, 0, 0, 0, 1, 1,
0.1245808, -1.832114, 3.673618, 1, 1, 1, 1, 1,
0.1315041, 0.5703273, 0.4058837, 1, 1, 1, 1, 1,
0.1418925, -1.412868, 2.628443, 1, 1, 1, 1, 1,
0.1426928, -0.4244536, 2.278645, 1, 1, 1, 1, 1,
0.1495437, 0.4177031, -0.6730402, 1, 1, 1, 1, 1,
0.1499513, -0.4701369, 5.16286, 1, 1, 1, 1, 1,
0.1499716, -1.137198, 4.608032, 1, 1, 1, 1, 1,
0.1567583, -0.2689187, 2.064997, 1, 1, 1, 1, 1,
0.156858, 0.6547871, -0.4170243, 1, 1, 1, 1, 1,
0.1571842, -1.118904, 1.205811, 1, 1, 1, 1, 1,
0.1572171, -0.9596378, 0.6589109, 1, 1, 1, 1, 1,
0.1589209, -1.664905, 2.436852, 1, 1, 1, 1, 1,
0.1600637, -0.5378333, 3.288245, 1, 1, 1, 1, 1,
0.1656905, -1.102064, 1.676349, 1, 1, 1, 1, 1,
0.1674147, 2.098445, 0.7364848, 1, 1, 1, 1, 1,
0.1692984, 0.2084361, -0.1590104, 0, 0, 1, 1, 1,
0.1740293, 0.503141, -0.3453064, 1, 0, 0, 1, 1,
0.1764897, 0.069406, 1.245189, 1, 0, 0, 1, 1,
0.1772613, 1.118209, -0.785984, 1, 0, 0, 1, 1,
0.1776289, -0.4303399, 2.230615, 1, 0, 0, 1, 1,
0.1779869, -1.644444, 1.281822, 1, 0, 0, 1, 1,
0.1797422, -1.442177, 0.9632579, 0, 0, 0, 1, 1,
0.1812969, -0.7273452, 2.862146, 0, 0, 0, 1, 1,
0.1862766, 0.02072181, 1.303019, 0, 0, 0, 1, 1,
0.1903961, 1.958291, 1.107158, 0, 0, 0, 1, 1,
0.191982, -0.2019595, 4.573766, 0, 0, 0, 1, 1,
0.1920521, -0.2832509, 1.598565, 0, 0, 0, 1, 1,
0.1932893, 1.000193, 0.2895703, 0, 0, 0, 1, 1,
0.1946607, 1.362782, -0.7182688, 1, 1, 1, 1, 1,
0.1985639, -0.6522031, 4.377688, 1, 1, 1, 1, 1,
0.2005698, 0.8467758, 0.6244392, 1, 1, 1, 1, 1,
0.2023908, 1.666383, 1.655362, 1, 1, 1, 1, 1,
0.2079236, -0.2520702, 2.948704, 1, 1, 1, 1, 1,
0.2099924, -1.050351, 2.707171, 1, 1, 1, 1, 1,
0.2126992, -0.2206591, 1.761553, 1, 1, 1, 1, 1,
0.2145771, -0.8110043, 1.555474, 1, 1, 1, 1, 1,
0.2175043, 0.2279379, -0.3148477, 1, 1, 1, 1, 1,
0.2181318, -1.128177, 1.608989, 1, 1, 1, 1, 1,
0.2236709, 0.1995145, 0.724438, 1, 1, 1, 1, 1,
0.2243661, -1.088755, 1.829892, 1, 1, 1, 1, 1,
0.226389, 1.849194, 1.490741, 1, 1, 1, 1, 1,
0.2295819, -1.481494, 4.098517, 1, 1, 1, 1, 1,
0.2299614, -1.149794, 1.751468, 1, 1, 1, 1, 1,
0.2330348, 1.700153, -0.8521412, 0, 0, 1, 1, 1,
0.2337156, -1.153908, 3.429307, 1, 0, 0, 1, 1,
0.2342175, -0.4494319, 2.847343, 1, 0, 0, 1, 1,
0.2407462, 0.5499722, 0.8389052, 1, 0, 0, 1, 1,
0.241304, -0.5621873, 2.882606, 1, 0, 0, 1, 1,
0.2428206, 0.4446053, 0.9588295, 1, 0, 0, 1, 1,
0.2473003, 0.8095864, 0.5926003, 0, 0, 0, 1, 1,
0.2484476, 0.09664691, 2.11622, 0, 0, 0, 1, 1,
0.2487138, 1.62074, -1.512269, 0, 0, 0, 1, 1,
0.2495991, 1.320537, -0.1706899, 0, 0, 0, 1, 1,
0.2498627, -1.14735, 2.574217, 0, 0, 0, 1, 1,
0.2547829, 2.199314, -1.096027, 0, 0, 0, 1, 1,
0.2571307, -1.329158, 2.298417, 0, 0, 0, 1, 1,
0.2579748, -0.7870966, 2.647129, 1, 1, 1, 1, 1,
0.2588778, 0.7727556, -0.8184952, 1, 1, 1, 1, 1,
0.2689491, 0.9469052, 0.1698318, 1, 1, 1, 1, 1,
0.2726036, 0.5643938, -1.442775, 1, 1, 1, 1, 1,
0.2779546, -0.8205642, 2.513923, 1, 1, 1, 1, 1,
0.2841304, 0.6164451, 1.167438, 1, 1, 1, 1, 1,
0.2846676, -0.2615789, 2.321711, 1, 1, 1, 1, 1,
0.2910616, 2.104759, 0.2101907, 1, 1, 1, 1, 1,
0.2911953, -1.101996, 2.947878, 1, 1, 1, 1, 1,
0.2951224, 2.718274, -0.1141787, 1, 1, 1, 1, 1,
0.2954404, 0.3358257, 0.9472185, 1, 1, 1, 1, 1,
0.2990594, 0.6542225, 1.331086, 1, 1, 1, 1, 1,
0.3019564, 1.506376, 1.532248, 1, 1, 1, 1, 1,
0.312695, 0.02637735, 0.9197838, 1, 1, 1, 1, 1,
0.3133924, -0.945788, 3.014776, 1, 1, 1, 1, 1,
0.3163563, -1.170184, 2.569348, 0, 0, 1, 1, 1,
0.3193752, 2.10331, 1.523115, 1, 0, 0, 1, 1,
0.3195351, 0.4734937, -0.5273936, 1, 0, 0, 1, 1,
0.3227014, -1.08505, 2.899652, 1, 0, 0, 1, 1,
0.3293239, -0.5586518, 3.228909, 1, 0, 0, 1, 1,
0.3298437, 0.2597115, 0.6775754, 1, 0, 0, 1, 1,
0.3299918, -1.042037, 3.326506, 0, 0, 0, 1, 1,
0.3341625, -0.7616909, 4.059699, 0, 0, 0, 1, 1,
0.3355408, 0.8075666, -1.108763, 0, 0, 0, 1, 1,
0.3417813, 0.8144072, 0.2249229, 0, 0, 0, 1, 1,
0.3471888, 0.4182298, 0.5048363, 0, 0, 0, 1, 1,
0.3487315, 1.41258, 0.405249, 0, 0, 0, 1, 1,
0.3503601, -0.371006, 3.877392, 0, 0, 0, 1, 1,
0.3504597, 0.1196744, 0.8371542, 1, 1, 1, 1, 1,
0.3531764, 1.330353, -1.024733, 1, 1, 1, 1, 1,
0.3536336, -0.1879374, 2.641415, 1, 1, 1, 1, 1,
0.3550366, -1.266576, 1.845276, 1, 1, 1, 1, 1,
0.3598965, -0.9059947, 2.461043, 1, 1, 1, 1, 1,
0.3619539, -0.3951657, 1.000664, 1, 1, 1, 1, 1,
0.3668812, -0.1731265, 1.792192, 1, 1, 1, 1, 1,
0.36908, -1.545506, 2.895592, 1, 1, 1, 1, 1,
0.3742844, 0.7774413, -1.012312, 1, 1, 1, 1, 1,
0.3745602, -1.40852, 2.171924, 1, 1, 1, 1, 1,
0.3811818, -1.352751, 4.440689, 1, 1, 1, 1, 1,
0.3826119, -0.3273609, 3.676696, 1, 1, 1, 1, 1,
0.3850101, 2.093527, 0.7171937, 1, 1, 1, 1, 1,
0.3856002, -1.38875, 2.366485, 1, 1, 1, 1, 1,
0.3863101, -0.725498, 4.815021, 1, 1, 1, 1, 1,
0.3872858, 0.6204895, 0.07799528, 0, 0, 1, 1, 1,
0.4023234, -2.474468, 2.260789, 1, 0, 0, 1, 1,
0.4023583, -0.2942279, 2.719657, 1, 0, 0, 1, 1,
0.4052466, 0.7345982, 0.7927971, 1, 0, 0, 1, 1,
0.4074044, 0.09146751, 2.356366, 1, 0, 0, 1, 1,
0.4076992, -0.6659691, 2.450926, 1, 0, 0, 1, 1,
0.4097189, -0.2255796, 0.6845827, 0, 0, 0, 1, 1,
0.412625, 0.3235323, 0.6121866, 0, 0, 0, 1, 1,
0.4152017, 0.5112885, -0.243074, 0, 0, 0, 1, 1,
0.4159365, -0.2620277, 2.969921, 0, 0, 0, 1, 1,
0.4165995, 1.839453, 1.049769, 0, 0, 0, 1, 1,
0.4172196, -0.1616803, 1.268479, 0, 0, 0, 1, 1,
0.4230427, -0.2781009, 0.8383831, 0, 0, 0, 1, 1,
0.42767, 0.3845164, 0.7015808, 1, 1, 1, 1, 1,
0.4288307, -1.387134, 3.613909, 1, 1, 1, 1, 1,
0.4295477, 0.2005473, 0.928519, 1, 1, 1, 1, 1,
0.4319772, -0.625968, 1.660535, 1, 1, 1, 1, 1,
0.4321416, 0.4882602, -0.130771, 1, 1, 1, 1, 1,
0.4346158, 1.101896, 0.8502887, 1, 1, 1, 1, 1,
0.4350398, 0.9150653, 2.034118, 1, 1, 1, 1, 1,
0.4393292, -1.061037, 2.556932, 1, 1, 1, 1, 1,
0.439357, -0.1004593, 0.8298142, 1, 1, 1, 1, 1,
0.4424113, 0.5182244, -0.1699969, 1, 1, 1, 1, 1,
0.4436105, 0.5245904, 0.404873, 1, 1, 1, 1, 1,
0.4444621, 0.1263701, 1.386979, 1, 1, 1, 1, 1,
0.447348, -2.086224, 4.00746, 1, 1, 1, 1, 1,
0.4560603, -0.4532906, 1.637416, 1, 1, 1, 1, 1,
0.4581264, -1.908488, 4.492604, 1, 1, 1, 1, 1,
0.4617981, -1.421379, 2.480996, 0, 0, 1, 1, 1,
0.4630371, -0.779247, 2.402131, 1, 0, 0, 1, 1,
0.4648632, -1.080603, 1.800156, 1, 0, 0, 1, 1,
0.4657678, -2.354755, 5.037684, 1, 0, 0, 1, 1,
0.4658893, 1.063071, 0.4219137, 1, 0, 0, 1, 1,
0.4663447, 0.8146537, 0.919571, 1, 0, 0, 1, 1,
0.466843, -0.2982241, 1.321439, 0, 0, 0, 1, 1,
0.4674993, -0.1618709, 1.832815, 0, 0, 0, 1, 1,
0.471853, 1.249985, 1.915403, 0, 0, 0, 1, 1,
0.472816, -0.2614252, 2.596403, 0, 0, 0, 1, 1,
0.4736882, -0.139931, 2.576588, 0, 0, 0, 1, 1,
0.4749365, -0.481577, 1.459616, 0, 0, 0, 1, 1,
0.4849559, -0.4373879, 2.697728, 0, 0, 0, 1, 1,
0.4890749, 0.8395412, 1.425707, 1, 1, 1, 1, 1,
0.4912711, 1.164773, -0.5922565, 1, 1, 1, 1, 1,
0.4930059, -0.1567774, 1.202511, 1, 1, 1, 1, 1,
0.4952559, 2.591927, 1.433533, 1, 1, 1, 1, 1,
0.4984885, -2.708925, 4.051515, 1, 1, 1, 1, 1,
0.4989713, -2.240166, 3.798374, 1, 1, 1, 1, 1,
0.4995525, 0.07621045, 2.530095, 1, 1, 1, 1, 1,
0.5033497, 1.49666, 0.7644631, 1, 1, 1, 1, 1,
0.5052289, 0.6293371, 2.294142, 1, 1, 1, 1, 1,
0.5071682, 1.941895, -0.07728358, 1, 1, 1, 1, 1,
0.5086313, -0.2854892, 0.5313971, 1, 1, 1, 1, 1,
0.5151836, -1.464941, 1.795817, 1, 1, 1, 1, 1,
0.5168223, 0.8842998, -0.3445266, 1, 1, 1, 1, 1,
0.5194272, -0.5226477, 2.320119, 1, 1, 1, 1, 1,
0.5204638, 1.908587, 2.149693, 1, 1, 1, 1, 1,
0.5205096, -0.5023311, 1.725751, 0, 0, 1, 1, 1,
0.5218602, 0.620872, 0.3907253, 1, 0, 0, 1, 1,
0.5227386, 1.249912, 0.1280026, 1, 0, 0, 1, 1,
0.528012, -1.350528, 2.764078, 1, 0, 0, 1, 1,
0.5389423, -0.06846366, 1.532933, 1, 0, 0, 1, 1,
0.5410188, -1.8332, 2.907896, 1, 0, 0, 1, 1,
0.5521391, 1.910237, 1.145168, 0, 0, 0, 1, 1,
0.5529749, 0.8940761, -0.7169997, 0, 0, 0, 1, 1,
0.5537165, 0.2116573, 2.812476, 0, 0, 0, 1, 1,
0.5596518, -0.2921487, 2.779813, 0, 0, 0, 1, 1,
0.560166, -0.4030845, 0.7642307, 0, 0, 0, 1, 1,
0.562132, 0.7913934, -0.5442723, 0, 0, 0, 1, 1,
0.5664378, 0.3078016, -0.2460456, 0, 0, 0, 1, 1,
0.5666901, -0.2437239, 2.897002, 1, 1, 1, 1, 1,
0.5677128, 0.7639641, 1.81031, 1, 1, 1, 1, 1,
0.568585, 0.2131424, 1.825665, 1, 1, 1, 1, 1,
0.5687923, 0.06999046, -0.09158978, 1, 1, 1, 1, 1,
0.5704018, -1.113547, 2.076987, 1, 1, 1, 1, 1,
0.572099, -0.6026787, 4.140861, 1, 1, 1, 1, 1,
0.5736634, 0.1797836, 1.790147, 1, 1, 1, 1, 1,
0.5739201, 0.5181156, 2.068037, 1, 1, 1, 1, 1,
0.5746597, 0.1619523, 1.335396, 1, 1, 1, 1, 1,
0.576035, 1.663826, -0.810857, 1, 1, 1, 1, 1,
0.5762208, -0.6219506, 3.075038, 1, 1, 1, 1, 1,
0.5779708, 0.130494, 2.018965, 1, 1, 1, 1, 1,
0.5837109, 1.316201, 2.628673, 1, 1, 1, 1, 1,
0.5839169, -1.697643, 2.912651, 1, 1, 1, 1, 1,
0.5935881, -2.222173, 1.678355, 1, 1, 1, 1, 1,
0.5964459, 0.195035, 2.141815, 0, 0, 1, 1, 1,
0.5992337, -0.2361613, 1.516556, 1, 0, 0, 1, 1,
0.6021001, 1.481078, 1.038615, 1, 0, 0, 1, 1,
0.6066668, -0.1044812, 1.232599, 1, 0, 0, 1, 1,
0.607617, 0.5238039, 2.029206, 1, 0, 0, 1, 1,
0.608394, 0.5839124, 1.478368, 1, 0, 0, 1, 1,
0.6108057, -1.233294, 2.712257, 0, 0, 0, 1, 1,
0.6113296, 1.281592, 0.3304781, 0, 0, 0, 1, 1,
0.6133372, 1.588484, -1.546642, 0, 0, 0, 1, 1,
0.6213921, 0.3028753, 2.12556, 0, 0, 0, 1, 1,
0.6301616, -0.481547, 1.639958, 0, 0, 0, 1, 1,
0.6326255, -1.599609, 3.14734, 0, 0, 0, 1, 1,
0.6416457, -0.2512144, 1.925589, 0, 0, 0, 1, 1,
0.6420234, -0.6902187, 2.533961, 1, 1, 1, 1, 1,
0.6482583, -0.6366243, 3.538057, 1, 1, 1, 1, 1,
0.6512077, 0.3915315, 2.823405, 1, 1, 1, 1, 1,
0.6536239, 0.1452126, -0.2722805, 1, 1, 1, 1, 1,
0.6541665, 1.26053, 0.5746708, 1, 1, 1, 1, 1,
0.654211, -1.638517, 4.317598, 1, 1, 1, 1, 1,
0.656584, 0.5836228, 2.063048, 1, 1, 1, 1, 1,
0.6566709, -0.1770922, 1.611772, 1, 1, 1, 1, 1,
0.65993, 0.4542063, 1.032244, 1, 1, 1, 1, 1,
0.6616756, -2.308059, 2.894382, 1, 1, 1, 1, 1,
0.6750752, -0.3709248, 2.27624, 1, 1, 1, 1, 1,
0.6770691, 0.7787942, 0.06142985, 1, 1, 1, 1, 1,
0.6861103, 1.124944, 0.05477393, 1, 1, 1, 1, 1,
0.6929892, -1.124241, 3.858044, 1, 1, 1, 1, 1,
0.69345, 0.8651879, 1.195383, 1, 1, 1, 1, 1,
0.6952631, 0.4712258, 1.070783, 0, 0, 1, 1, 1,
0.6977738, -0.9858928, 1.238038, 1, 0, 0, 1, 1,
0.699634, -1.486988, 3.505656, 1, 0, 0, 1, 1,
0.7025173, -1.058577, 3.265933, 1, 0, 0, 1, 1,
0.7045093, 1.507777, 0.7615575, 1, 0, 0, 1, 1,
0.7079891, -0.09808364, -0.1774726, 1, 0, 0, 1, 1,
0.7129039, -0.006676876, 1.592262, 0, 0, 0, 1, 1,
0.7171978, 0.3394669, 0.2844874, 0, 0, 0, 1, 1,
0.718798, 0.2132137, 1.183975, 0, 0, 0, 1, 1,
0.7303615, 0.796796, 1.018813, 0, 0, 0, 1, 1,
0.7344614, -1.373688, 3.333609, 0, 0, 0, 1, 1,
0.7382585, -1.944384, 3.549454, 0, 0, 0, 1, 1,
0.7391697, -0.6924558, 0.8210912, 0, 0, 0, 1, 1,
0.7404577, -0.6820316, 1.384711, 1, 1, 1, 1, 1,
0.742981, 1.486395, 0.3834411, 1, 1, 1, 1, 1,
0.7455977, 0.3110432, 2.063853, 1, 1, 1, 1, 1,
0.7540285, -1.170248, 3.967762, 1, 1, 1, 1, 1,
0.7557451, -1.087003, 1.747459, 1, 1, 1, 1, 1,
0.758136, -0.8153467, 2.182839, 1, 1, 1, 1, 1,
0.7583748, 0.5021793, 2.170727, 1, 1, 1, 1, 1,
0.7612652, 1.004675, -0.7989882, 1, 1, 1, 1, 1,
0.7640411, 0.4320739, 3.630489, 1, 1, 1, 1, 1,
0.7668412, -0.2734289, -0.2913182, 1, 1, 1, 1, 1,
0.7829641, 1.401575, 0.8784013, 1, 1, 1, 1, 1,
0.7969432, -0.08662845, 2.072027, 1, 1, 1, 1, 1,
0.8003582, 1.199237, -0.7422297, 1, 1, 1, 1, 1,
0.8040564, -0.4680759, 2.81527, 1, 1, 1, 1, 1,
0.8107437, -1.708691, 3.602359, 1, 1, 1, 1, 1,
0.8206466, -0.7611921, 2.521236, 0, 0, 1, 1, 1,
0.833793, -0.1605266, 1.539487, 1, 0, 0, 1, 1,
0.835358, -0.1018977, 1.317053, 1, 0, 0, 1, 1,
0.8399596, -0.009969714, 1.386026, 1, 0, 0, 1, 1,
0.847838, -0.7177166, 0.9501876, 1, 0, 0, 1, 1,
0.8497874, -0.9690566, 2.737154, 1, 0, 0, 1, 1,
0.8538815, -1.735027, 3.467959, 0, 0, 0, 1, 1,
0.8557172, 0.7522654, 0.1330995, 0, 0, 0, 1, 1,
0.8705711, -1.553383, 3.071671, 0, 0, 0, 1, 1,
0.874624, 0.1319429, 0.695976, 0, 0, 0, 1, 1,
0.8802961, -1.293671, 3.038315, 0, 0, 0, 1, 1,
0.8815878, -0.4287606, 2.639732, 0, 0, 0, 1, 1,
0.8864438, 2.217853, 2.044893, 0, 0, 0, 1, 1,
0.8885846, -0.4681864, 1.589356, 1, 1, 1, 1, 1,
0.8937874, -0.5547175, 3.53887, 1, 1, 1, 1, 1,
0.896302, -0.6698778, 0.4612045, 1, 1, 1, 1, 1,
0.8969203, 0.3619356, 2.071604, 1, 1, 1, 1, 1,
0.9050787, -1.601029, 5.354864, 1, 1, 1, 1, 1,
0.9081442, 0.2369142, -0.4037118, 1, 1, 1, 1, 1,
0.9098182, 0.1483161, 2.182931, 1, 1, 1, 1, 1,
0.9132514, -0.443202, -0.4687445, 1, 1, 1, 1, 1,
0.9162729, -0.08411836, 1.303221, 1, 1, 1, 1, 1,
0.9210112, 0.4153383, 0.795803, 1, 1, 1, 1, 1,
0.9290119, 0.1678694, 1.604993, 1, 1, 1, 1, 1,
0.9333712, 1.649412, -0.192465, 1, 1, 1, 1, 1,
0.9376748, -1.273191, 2.989154, 1, 1, 1, 1, 1,
0.9390842, -0.6683031, 1.568313, 1, 1, 1, 1, 1,
0.9416847, -3.030936, 2.992259, 1, 1, 1, 1, 1,
0.9495499, -2.799227, 2.705764, 0, 0, 1, 1, 1,
0.9498713, 0.2185963, 2.730865, 1, 0, 0, 1, 1,
0.958093, 0.8088177, 0.05454962, 1, 0, 0, 1, 1,
0.9583834, -0.5160367, 2.425036, 1, 0, 0, 1, 1,
0.9617107, -0.09866028, 0.9901496, 1, 0, 0, 1, 1,
0.9638981, 1.066201, 1.302213, 1, 0, 0, 1, 1,
0.9653407, 1.088793, 0.6697617, 0, 0, 0, 1, 1,
0.9661307, -1.538577, 1.452309, 0, 0, 0, 1, 1,
0.9710983, -0.4895222, 1.99338, 0, 0, 0, 1, 1,
0.9737722, 0.6716177, 1.506567, 0, 0, 0, 1, 1,
0.9946725, -0.05835882, 2.003219, 0, 0, 0, 1, 1,
0.9956323, -0.2554292, 3.538835, 0, 0, 0, 1, 1,
0.9972811, 1.136543, -1.039704, 0, 0, 0, 1, 1,
0.9986896, 0.1400755, 0.0173333, 1, 1, 1, 1, 1,
0.9989821, -1.338908, 2.957937, 1, 1, 1, 1, 1,
0.999123, -0.2244156, 1.634894, 1, 1, 1, 1, 1,
1.008365, -0.2021817, 3.252448, 1, 1, 1, 1, 1,
1.021666, 0.09471131, 0.6651201, 1, 1, 1, 1, 1,
1.030732, -0.9057453, 2.648572, 1, 1, 1, 1, 1,
1.033411, -0.7471686, 2.172548, 1, 1, 1, 1, 1,
1.037973, -0.5824, 2.002628, 1, 1, 1, 1, 1,
1.038834, 0.8514339, -0.5606074, 1, 1, 1, 1, 1,
1.042338, 0.5910827, 1.198816, 1, 1, 1, 1, 1,
1.045953, 0.7464453, -1.101695, 1, 1, 1, 1, 1,
1.049872, 1.94897, -0.2391309, 1, 1, 1, 1, 1,
1.050123, 1.938302, -0.321752, 1, 1, 1, 1, 1,
1.050826, -0.1000813, 1.299859, 1, 1, 1, 1, 1,
1.052729, -0.4282074, 0.08802865, 1, 1, 1, 1, 1,
1.053575, -1.709043, 3.116086, 0, 0, 1, 1, 1,
1.055217, 0.4946392, -0.5960484, 1, 0, 0, 1, 1,
1.058797, 0.3005794, 1.652016, 1, 0, 0, 1, 1,
1.060485, -0.5921471, 2.70237, 1, 0, 0, 1, 1,
1.070865, 1.633873, 0.4196302, 1, 0, 0, 1, 1,
1.073476, -0.7454889, 2.949271, 1, 0, 0, 1, 1,
1.076459, -0.3799954, 1.723974, 0, 0, 0, 1, 1,
1.092702, 1.0956, 1.338001, 0, 0, 0, 1, 1,
1.098246, -1.138327, 3.119672, 0, 0, 0, 1, 1,
1.101696, 1.460306, 0.4041487, 0, 0, 0, 1, 1,
1.102214, 1.160951, 1.238069, 0, 0, 0, 1, 1,
1.102991, -0.08468637, 2.60844, 0, 0, 0, 1, 1,
1.108318, 0.01099837, 4.501082, 0, 0, 0, 1, 1,
1.111651, 1.081579, -1.415617, 1, 1, 1, 1, 1,
1.113117, 0.6650175, 2.017625, 1, 1, 1, 1, 1,
1.118149, -0.2044093, 0.9343304, 1, 1, 1, 1, 1,
1.12407, -1.194501, 2.089959, 1, 1, 1, 1, 1,
1.127186, -0.4197711, 1.351129, 1, 1, 1, 1, 1,
1.134825, -1.303923, 2.139668, 1, 1, 1, 1, 1,
1.144289, 0.526648, 3.434375, 1, 1, 1, 1, 1,
1.150357, -1.487309, 2.435435, 1, 1, 1, 1, 1,
1.152291, 1.053795, 0.2489778, 1, 1, 1, 1, 1,
1.16053, 0.2622252, 1.661798, 1, 1, 1, 1, 1,
1.161257, -0.9760736, 1.739758, 1, 1, 1, 1, 1,
1.165683, -0.2073357, 2.081008, 1, 1, 1, 1, 1,
1.166343, 0.970147, -0.1577996, 1, 1, 1, 1, 1,
1.174431, 1.101272, -0.9729526, 1, 1, 1, 1, 1,
1.182494, 0.3385142, 1.404142, 1, 1, 1, 1, 1,
1.190395, -1.068627, 2.121271, 0, 0, 1, 1, 1,
1.190771, 1.06332, -0.7065704, 1, 0, 0, 1, 1,
1.192501, -1.10341, 2.618323, 1, 0, 0, 1, 1,
1.197468, -0.9880453, 1.685654, 1, 0, 0, 1, 1,
1.218622, -0.008384783, 1.288703, 1, 0, 0, 1, 1,
1.218816, -0.7250085, 3.043493, 1, 0, 0, 1, 1,
1.224068, -0.6502762, 1.767613, 0, 0, 0, 1, 1,
1.233399, 0.0903274, 2.209475, 0, 0, 0, 1, 1,
1.241265, -0.1040155, 1.439732, 0, 0, 0, 1, 1,
1.242345, -0.543511, 3.015509, 0, 0, 0, 1, 1,
1.243836, -0.3330238, 2.971736, 0, 0, 0, 1, 1,
1.258209, 1.913383, 0.2115412, 0, 0, 0, 1, 1,
1.259146, 0.8577933, 1.087129, 0, 0, 0, 1, 1,
1.273944, -0.009954721, 1.773158, 1, 1, 1, 1, 1,
1.276855, 1.495682, -0.3681791, 1, 1, 1, 1, 1,
1.28604, 0.01580785, 0.641651, 1, 1, 1, 1, 1,
1.295044, 1.347669, 1.703544, 1, 1, 1, 1, 1,
1.307151, 0.8267788, 2.159638, 1, 1, 1, 1, 1,
1.310563, 0.2739951, 1.83462, 1, 1, 1, 1, 1,
1.3144, -0.1886558, 3.009747, 1, 1, 1, 1, 1,
1.317292, 0.4668417, 1.002927, 1, 1, 1, 1, 1,
1.322906, -0.1979083, 0.1282674, 1, 1, 1, 1, 1,
1.326785, -1.082656, 2.599923, 1, 1, 1, 1, 1,
1.34112, 1.447723, -0.6662728, 1, 1, 1, 1, 1,
1.342139, -2.037881, 1.998946, 1, 1, 1, 1, 1,
1.348317, 0.1692612, 0.4261011, 1, 1, 1, 1, 1,
1.362713, 0.5923412, 0.2431796, 1, 1, 1, 1, 1,
1.366054, 1.051767, -0.3873638, 1, 1, 1, 1, 1,
1.38043, -0.5264629, 1.605321, 0, 0, 1, 1, 1,
1.381542, 0.2378373, 0.4917895, 1, 0, 0, 1, 1,
1.384084, 0.4918998, 0.9891641, 1, 0, 0, 1, 1,
1.385286, -0.3582619, 0.3622133, 1, 0, 0, 1, 1,
1.386672, 0.9903208, 0.9257073, 1, 0, 0, 1, 1,
1.387435, 0.2935375, 0.9293129, 1, 0, 0, 1, 1,
1.390194, 0.4910839, 0.839476, 0, 0, 0, 1, 1,
1.397656, -1.994627, 3.715786, 0, 0, 0, 1, 1,
1.398912, -0.2335713, 2.612612, 0, 0, 0, 1, 1,
1.413659, 0.7811847, -0.927903, 0, 0, 0, 1, 1,
1.413768, -1.902664, 2.265871, 0, 0, 0, 1, 1,
1.42715, -0.3419179, 2.979855, 0, 0, 0, 1, 1,
1.430049, -1.399347, 2.909011, 0, 0, 0, 1, 1,
1.443031, 1.375907, 0.9992148, 1, 1, 1, 1, 1,
1.452854, 0.5052164, 0.5042418, 1, 1, 1, 1, 1,
1.463726, 2.098551, 1.638193, 1, 1, 1, 1, 1,
1.464572, 1.420696, 1.693141, 1, 1, 1, 1, 1,
1.469813, -0.3772243, -0.6548342, 1, 1, 1, 1, 1,
1.470646, -1.190633, 0.7734112, 1, 1, 1, 1, 1,
1.47371, -1.285498, 0.886578, 1, 1, 1, 1, 1,
1.478962, -0.7172153, 2.939256, 1, 1, 1, 1, 1,
1.496234, 0.4811634, 0.9585427, 1, 1, 1, 1, 1,
1.502731, -1.622022, 2.021292, 1, 1, 1, 1, 1,
1.523699, 0.6974855, 1.646538, 1, 1, 1, 1, 1,
1.536805, 0.002907585, 2.158137, 1, 1, 1, 1, 1,
1.53692, 0.6182594, 2.049872, 1, 1, 1, 1, 1,
1.537511, -1.523425, 2.540302, 1, 1, 1, 1, 1,
1.545617, -0.8319954, 1.290537, 1, 1, 1, 1, 1,
1.548377, 1.239349, 0.9892573, 0, 0, 1, 1, 1,
1.556677, -0.9390386, 2.043046, 1, 0, 0, 1, 1,
1.566927, -0.1316684, 0.093982, 1, 0, 0, 1, 1,
1.568424, 0.3512371, 0.7106637, 1, 0, 0, 1, 1,
1.594994, 0.04666267, 1.317931, 1, 0, 0, 1, 1,
1.604501, 2.624989, -0.1017052, 1, 0, 0, 1, 1,
1.63133, 1.188286, -0.4167183, 0, 0, 0, 1, 1,
1.642105, 0.5298869, 0.1761328, 0, 0, 0, 1, 1,
1.653338, 0.3971505, 0.5141041, 0, 0, 0, 1, 1,
1.655863, -0.8539296, 2.847349, 0, 0, 0, 1, 1,
1.657425, 1.208137, -0.2507319, 0, 0, 0, 1, 1,
1.671372, -0.9158179, 2.968008, 0, 0, 0, 1, 1,
1.680297, -1.314718, 1.849523, 0, 0, 0, 1, 1,
1.711048, -0.9679033, 1.687338, 1, 1, 1, 1, 1,
1.727421, -0.5518504, 1.950946, 1, 1, 1, 1, 1,
1.744903, -0.1100922, 3.210472, 1, 1, 1, 1, 1,
1.754704, 0.3095118, 1.677417, 1, 1, 1, 1, 1,
1.755588, 0.5474837, 0.09419571, 1, 1, 1, 1, 1,
1.770344, -2.165197, 3.555497, 1, 1, 1, 1, 1,
1.798655, 0.238084, 2.612985, 1, 1, 1, 1, 1,
1.80372, -0.5189359, 1.13627, 1, 1, 1, 1, 1,
1.810037, -0.9834028, 1.529065, 1, 1, 1, 1, 1,
1.836503, 1.193738, -0.7285854, 1, 1, 1, 1, 1,
1.842476, 1.118446, 0.9553701, 1, 1, 1, 1, 1,
1.849177, -1.972033, 2.788749, 1, 1, 1, 1, 1,
1.855135, 0.1431963, 0.9851615, 1, 1, 1, 1, 1,
1.859418, -0.528897, 0.6847233, 1, 1, 1, 1, 1,
1.863968, 0.7014261, 0.4275414, 1, 1, 1, 1, 1,
1.874178, -1.186561, 2.139564, 0, 0, 1, 1, 1,
1.886317, 0.9349476, 3.162212, 1, 0, 0, 1, 1,
1.891888, 0.8684355, 2.791657, 1, 0, 0, 1, 1,
1.913461, 0.3687555, 1.392314, 1, 0, 0, 1, 1,
1.933565, -0.04431279, 2.544995, 1, 0, 0, 1, 1,
1.934821, -1.717912, 1.267836, 1, 0, 0, 1, 1,
1.94022, -0.1488987, 1.763132, 0, 0, 0, 1, 1,
1.943082, 0.1273719, 1.211684, 0, 0, 0, 1, 1,
1.945218, -0.8477674, 2.288108, 0, 0, 0, 1, 1,
1.970365, -0.1352834, 2.620161, 0, 0, 0, 1, 1,
1.980017, 0.4867484, -0.9154552, 0, 0, 0, 1, 1,
1.98282, 0.01160727, 2.322569, 0, 0, 0, 1, 1,
1.98827, 0.6378527, 1.034376, 0, 0, 0, 1, 1,
2.000766, -0.8811499, 1.234665, 1, 1, 1, 1, 1,
2.00863, -0.7144173, 0.3930894, 1, 1, 1, 1, 1,
2.025231, 0.4546786, 1.787054, 1, 1, 1, 1, 1,
2.028409, -0.9763221, 1.790049, 1, 1, 1, 1, 1,
2.045384, -0.1646982, 2.919024, 1, 1, 1, 1, 1,
2.065812, -0.05269858, 2.320865, 1, 1, 1, 1, 1,
2.073786, 1.269001, 1.698932, 1, 1, 1, 1, 1,
2.083529, -0.9828212, 2.957558, 1, 1, 1, 1, 1,
2.0873, -0.5069582, 2.245768, 1, 1, 1, 1, 1,
2.100918, 0.8983741, 1.168753, 1, 1, 1, 1, 1,
2.107316, -0.5389352, 1.164074, 1, 1, 1, 1, 1,
2.141814, -0.04548803, 0.5024573, 1, 1, 1, 1, 1,
2.148902, 1.14098, 1.698261, 1, 1, 1, 1, 1,
2.151862, -0.9774826, 3.134532, 1, 1, 1, 1, 1,
2.161143, -1.241751, 3.344384, 1, 1, 1, 1, 1,
2.177494, -0.6710597, 1.415146, 0, 0, 1, 1, 1,
2.233421, -1.261957, 1.084587, 1, 0, 0, 1, 1,
2.240133, 1.97248, 0.4379832, 1, 0, 0, 1, 1,
2.265046, -0.04711118, 2.93169, 1, 0, 0, 1, 1,
2.284576, 1.200551, 0.09664816, 1, 0, 0, 1, 1,
2.290493, -0.6719391, 2.575394, 1, 0, 0, 1, 1,
2.345551, -0.1448798, 1.948167, 0, 0, 0, 1, 1,
2.365362, -0.0578507, 2.489377, 0, 0, 0, 1, 1,
2.36789, -0.8755273, 2.633571, 0, 0, 0, 1, 1,
2.396787, 1.406341, 1.428596, 0, 0, 0, 1, 1,
2.450889, 0.2684684, -0.1435778, 0, 0, 0, 1, 1,
2.454694, -1.702819, 4.089453, 0, 0, 0, 1, 1,
2.492412, -0.6920119, 0.9337865, 0, 0, 0, 1, 1,
2.718478, -0.7437039, 1.126011, 1, 1, 1, 1, 1,
2.744262, 1.181202, 1.610283, 1, 1, 1, 1, 1,
2.759269, 0.2497321, 2.932995, 1, 1, 1, 1, 1,
2.877117, -1.080191, 2.359916, 1, 1, 1, 1, 1,
2.927568, 0.7189162, 1.632117, 1, 1, 1, 1, 1,
2.934133, 0.6554603, -0.01770315, 1, 1, 1, 1, 1,
4.06652, 0.5028005, 0.7381017, 1, 1, 1, 1, 1
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
var radius = 9.673183;
var distance = 33.97664;
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
mvMatrix.translate( -0.5887017, 0.3366095, -0.417836 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97664);
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