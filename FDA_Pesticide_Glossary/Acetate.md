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
-2.960014, 0.1654637, 0.1030916, 1, 0, 0, 1,
-2.666003, 0.2081595, 0.6154318, 1, 0.007843138, 0, 1,
-2.636263, -1.805488, -2.061126, 1, 0.01176471, 0, 1,
-2.41544, -2.301242, -3.077392, 1, 0.01960784, 0, 1,
-2.374272, -0.3738188, -3.39811, 1, 0.02352941, 0, 1,
-2.349263, -0.4137502, -2.51296, 1, 0.03137255, 0, 1,
-2.330528, 0.03572154, -1.88038, 1, 0.03529412, 0, 1,
-2.221691, -0.1387739, -2.054307, 1, 0.04313726, 0, 1,
-2.181732, 0.1349175, -1.428714, 1, 0.04705882, 0, 1,
-2.144494, 0.7707361, -0.6797765, 1, 0.05490196, 0, 1,
-2.117364, 0.6522665, -0.7175826, 1, 0.05882353, 0, 1,
-2.109684, 0.2065704, -1.380957, 1, 0.06666667, 0, 1,
-2.087945, 1.959808, -1.534388, 1, 0.07058824, 0, 1,
-2.087029, -0.6865504, -0.3563183, 1, 0.07843138, 0, 1,
-2.083514, 0.8352594, -0.5400268, 1, 0.08235294, 0, 1,
-2.080092, 0.7216888, -0.5657363, 1, 0.09019608, 0, 1,
-2.072647, 1.02052, -1.452051, 1, 0.09411765, 0, 1,
-2.001795, 0.4322825, -2.132215, 1, 0.1019608, 0, 1,
-1.999448, -1.067825, -2.0743, 1, 0.1098039, 0, 1,
-1.995706, 0.7704859, 0.9875904, 1, 0.1137255, 0, 1,
-1.985383, -0.1085824, -0.4049524, 1, 0.1215686, 0, 1,
-1.982345, 1.706843, -0.9440917, 1, 0.1254902, 0, 1,
-1.944138, 0.7681521, -0.5618201, 1, 0.1333333, 0, 1,
-1.938381, -1.312631, -3.094655, 1, 0.1372549, 0, 1,
-1.876766, 0.6073615, -2.301741, 1, 0.145098, 0, 1,
-1.865638, 1.441784, -0.06941409, 1, 0.1490196, 0, 1,
-1.86443, -0.4929295, -3.776968, 1, 0.1568628, 0, 1,
-1.855111, -0.1924736, -2.658846, 1, 0.1607843, 0, 1,
-1.825795, 0.8650049, -1.538158, 1, 0.1686275, 0, 1,
-1.825262, 1.358735, -1.967682, 1, 0.172549, 0, 1,
-1.81441, 0.8673269, -1.299881, 1, 0.1803922, 0, 1,
-1.808849, 0.3957195, -2.160763, 1, 0.1843137, 0, 1,
-1.797266, -1.018113, -1.095841, 1, 0.1921569, 0, 1,
-1.791391, -0.6044405, -3.882186, 1, 0.1960784, 0, 1,
-1.772228, -1.120792, -1.925955, 1, 0.2039216, 0, 1,
-1.769296, 0.1776873, -1.824237, 1, 0.2117647, 0, 1,
-1.764171, 1.562584, -1.121512, 1, 0.2156863, 0, 1,
-1.761566, -0.09778023, -1.438812, 1, 0.2235294, 0, 1,
-1.749436, 0.310793, -0.8087216, 1, 0.227451, 0, 1,
-1.74138, -0.5564685, -1.956903, 1, 0.2352941, 0, 1,
-1.733297, -0.4455921, -1.172683, 1, 0.2392157, 0, 1,
-1.729762, -0.5813124, -2.297532, 1, 0.2470588, 0, 1,
-1.72078, 0.3006526, 0.2578289, 1, 0.2509804, 0, 1,
-1.69551, 0.9465805, -0.700438, 1, 0.2588235, 0, 1,
-1.688719, 0.4809405, 0.2459944, 1, 0.2627451, 0, 1,
-1.68784, -0.3631786, -1.016433, 1, 0.2705882, 0, 1,
-1.685273, -0.922282, -2.744415, 1, 0.2745098, 0, 1,
-1.683184, 0.5529411, -0.8405663, 1, 0.282353, 0, 1,
-1.638296, -0.7490052, -0.9167956, 1, 0.2862745, 0, 1,
-1.636277, -1.006529, -1.356727, 1, 0.2941177, 0, 1,
-1.626586, -0.1250931, -2.318531, 1, 0.3019608, 0, 1,
-1.606178, -0.7476296, -1.140515, 1, 0.3058824, 0, 1,
-1.602371, 1.131558, -2.138456, 1, 0.3137255, 0, 1,
-1.583222, -0.01392199, -2.445092, 1, 0.3176471, 0, 1,
-1.567564, -1.390598, -1.27366, 1, 0.3254902, 0, 1,
-1.559923, -0.2184892, 0.1303824, 1, 0.3294118, 0, 1,
-1.558596, -1.685307, -1.213442, 1, 0.3372549, 0, 1,
-1.546303, -0.003321012, -2.127962, 1, 0.3411765, 0, 1,
-1.546016, 1.116244, -0.2546257, 1, 0.3490196, 0, 1,
-1.543445, 0.181222, -2.489479, 1, 0.3529412, 0, 1,
-1.54161, -0.06624397, -2.415137, 1, 0.3607843, 0, 1,
-1.531846, -0.4637006, -0.4901488, 1, 0.3647059, 0, 1,
-1.520091, 0.6873308, -0.1570975, 1, 0.372549, 0, 1,
-1.505261, 1.180458, -0.7731021, 1, 0.3764706, 0, 1,
-1.503283, -0.4506315, 0.125138, 1, 0.3843137, 0, 1,
-1.49757, 0.1373331, -2.08733, 1, 0.3882353, 0, 1,
-1.481204, -0.4961782, -2.366266, 1, 0.3960784, 0, 1,
-1.465785, 0.9402266, 0.5570119, 1, 0.4039216, 0, 1,
-1.449847, -0.6572995, -0.4438033, 1, 0.4078431, 0, 1,
-1.448996, 0.0570831, -1.831328, 1, 0.4156863, 0, 1,
-1.444051, -0.8442875, -1.562723, 1, 0.4196078, 0, 1,
-1.442715, -1.470509, -1.649796, 1, 0.427451, 0, 1,
-1.441435, 0.9648743, -1.544374, 1, 0.4313726, 0, 1,
-1.439322, 0.18917, -1.843507, 1, 0.4392157, 0, 1,
-1.435816, 0.8254296, 0.07395732, 1, 0.4431373, 0, 1,
-1.425289, 0.8413012, -1.191598, 1, 0.4509804, 0, 1,
-1.419863, -0.4811147, -3.288518, 1, 0.454902, 0, 1,
-1.40576, -0.152277, -2.95705, 1, 0.4627451, 0, 1,
-1.39886, -0.3455934, -2.10618, 1, 0.4666667, 0, 1,
-1.398684, 1.643028, -0.635958, 1, 0.4745098, 0, 1,
-1.388755, -0.6524293, -2.247404, 1, 0.4784314, 0, 1,
-1.378314, -0.7764323, -3.750132, 1, 0.4862745, 0, 1,
-1.366841, 0.6463176, -1.772366, 1, 0.4901961, 0, 1,
-1.365615, -1.595954, -3.163618, 1, 0.4980392, 0, 1,
-1.364868, 0.6423778, -2.235986, 1, 0.5058824, 0, 1,
-1.354018, -1.243111, -3.189474, 1, 0.509804, 0, 1,
-1.352611, -0.4458089, -2.546245, 1, 0.5176471, 0, 1,
-1.338689, 0.5532725, 0.9302332, 1, 0.5215687, 0, 1,
-1.335449, -0.3382942, -1.52212, 1, 0.5294118, 0, 1,
-1.335347, -0.1642596, -1.576056, 1, 0.5333334, 0, 1,
-1.33065, -0.94998, -1.724134, 1, 0.5411765, 0, 1,
-1.328155, 0.6625993, 0.2908982, 1, 0.5450981, 0, 1,
-1.327269, 0.7439616, -1.283143, 1, 0.5529412, 0, 1,
-1.326936, -0.4670119, -2.09372, 1, 0.5568628, 0, 1,
-1.322457, -0.3132654, -2.224484, 1, 0.5647059, 0, 1,
-1.298233, -0.176262, -2.491299, 1, 0.5686275, 0, 1,
-1.298121, -0.7120431, -2.690217, 1, 0.5764706, 0, 1,
-1.292541, -0.09102669, -0.1274494, 1, 0.5803922, 0, 1,
-1.289369, -1.566074, -2.948796, 1, 0.5882353, 0, 1,
-1.286366, -1.512926, -1.465647, 1, 0.5921569, 0, 1,
-1.281242, 0.1655164, -1.901326, 1, 0.6, 0, 1,
-1.259789, -0.4105043, -0.8306232, 1, 0.6078432, 0, 1,
-1.252463, -2.358022, -4.064351, 1, 0.6117647, 0, 1,
-1.247596, 1.158648, -0.8864096, 1, 0.6196079, 0, 1,
-1.246685, -0.05112267, -1.197153, 1, 0.6235294, 0, 1,
-1.224304, 1.036627, -0.8547735, 1, 0.6313726, 0, 1,
-1.220909, -1.809363, -1.718876, 1, 0.6352941, 0, 1,
-1.21691, -0.8604592, -2.245993, 1, 0.6431373, 0, 1,
-1.216891, -0.3384924, -2.330923, 1, 0.6470588, 0, 1,
-1.211339, -0.9542609, -0.3266878, 1, 0.654902, 0, 1,
-1.204798, -0.1689827, -1.193583, 1, 0.6588235, 0, 1,
-1.20132, 0.5903841, -2.25338, 1, 0.6666667, 0, 1,
-1.197803, 0.8558449, -1.637761, 1, 0.6705883, 0, 1,
-1.186679, -2.571688, -3.606154, 1, 0.6784314, 0, 1,
-1.183091, 0.2469153, -1.458445, 1, 0.682353, 0, 1,
-1.177482, -0.5223763, -3.47889, 1, 0.6901961, 0, 1,
-1.175241, -0.9402429, -2.263537, 1, 0.6941177, 0, 1,
-1.168282, 1.613927, 0.9888803, 1, 0.7019608, 0, 1,
-1.167605, -1.145599, -3.062007, 1, 0.7098039, 0, 1,
-1.166152, 0.3837363, -2.668498, 1, 0.7137255, 0, 1,
-1.165696, 0.5929138, -1.522036, 1, 0.7215686, 0, 1,
-1.162375, 0.09895375, -0.7776718, 1, 0.7254902, 0, 1,
-1.161639, 1.266301, -0.6021362, 1, 0.7333333, 0, 1,
-1.158696, -0.1199326, -0.05324884, 1, 0.7372549, 0, 1,
-1.157068, 0.5992898, -0.8796861, 1, 0.7450981, 0, 1,
-1.151552, -1.321668, -4.19981, 1, 0.7490196, 0, 1,
-1.148573, -2.166087, -3.042713, 1, 0.7568628, 0, 1,
-1.14674, -0.7157314, -1.332204, 1, 0.7607843, 0, 1,
-1.131476, 2.159555, -0.3616672, 1, 0.7686275, 0, 1,
-1.130056, -0.439614, -0.9764658, 1, 0.772549, 0, 1,
-1.129147, 0.8223633, -1.483894, 1, 0.7803922, 0, 1,
-1.127135, -0.9336968, -1.449318, 1, 0.7843137, 0, 1,
-1.12698, -2.332565, -2.509632, 1, 0.7921569, 0, 1,
-1.125662, 0.1317069, -0.673277, 1, 0.7960784, 0, 1,
-1.121557, 0.5470172, -2.972204, 1, 0.8039216, 0, 1,
-1.120939, -1.154991, -3.117754, 1, 0.8117647, 0, 1,
-1.117911, 1.176926, -1.50049, 1, 0.8156863, 0, 1,
-1.107263, -0.9019131, -1.183022, 1, 0.8235294, 0, 1,
-1.103841, 1.384065, 0.1297221, 1, 0.827451, 0, 1,
-1.100111, 1.459508, -1.157498, 1, 0.8352941, 0, 1,
-1.098209, 3.528071, 0.7191589, 1, 0.8392157, 0, 1,
-1.097771, 1.035078, -0.9476056, 1, 0.8470588, 0, 1,
-1.083757, -0.6343775, -1.436843, 1, 0.8509804, 0, 1,
-1.082424, 0.248029, -0.1035113, 1, 0.8588235, 0, 1,
-1.077865, -0.4044813, 0.9915484, 1, 0.8627451, 0, 1,
-1.072735, 1.528184, -0.4261754, 1, 0.8705882, 0, 1,
-1.070766, 1.245159, -1.057607, 1, 0.8745098, 0, 1,
-1.069126, 1.737614, -1.420395, 1, 0.8823529, 0, 1,
-1.060527, 1.710444, 0.7751538, 1, 0.8862745, 0, 1,
-1.056682, -1.127364, -3.007652, 1, 0.8941177, 0, 1,
-1.052656, 0.541376, -1.437141, 1, 0.8980392, 0, 1,
-1.050411, 0.8145876, -0.6750989, 1, 0.9058824, 0, 1,
-1.047932, 0.09052785, -0.8464806, 1, 0.9137255, 0, 1,
-1.04768, 0.05332467, -1.682726, 1, 0.9176471, 0, 1,
-1.044499, 0.174951, 1.242095, 1, 0.9254902, 0, 1,
-1.043459, 0.2162109, -1.22737, 1, 0.9294118, 0, 1,
-1.039393, -2.082024, -1.749248, 1, 0.9372549, 0, 1,
-1.036823, 2.287321, -0.02010312, 1, 0.9411765, 0, 1,
-1.027342, 1.977259, 0.5351841, 1, 0.9490196, 0, 1,
-1.02416, 0.8288568, -0.009783676, 1, 0.9529412, 0, 1,
-1.019195, 0.8820662, -1.763478, 1, 0.9607843, 0, 1,
-1.014846, 2.066717, -0.1361196, 1, 0.9647059, 0, 1,
-1.00751, -1.625586, -2.410753, 1, 0.972549, 0, 1,
-1.002318, -0.3465681, -2.578736, 1, 0.9764706, 0, 1,
-0.9949839, 1.038713, -0.3743652, 1, 0.9843137, 0, 1,
-0.9820353, 0.5547159, -0.5158455, 1, 0.9882353, 0, 1,
-0.975875, 0.3518043, -1.726971, 1, 0.9960784, 0, 1,
-0.9751773, 1.411236, 0.1506019, 0.9960784, 1, 0, 1,
-0.9750564, 1.51821, -1.257392, 0.9921569, 1, 0, 1,
-0.973583, -0.01409213, -3.171146, 0.9843137, 1, 0, 1,
-0.9731565, -0.1614281, -2.473345, 0.9803922, 1, 0, 1,
-0.9698388, -0.5153325, -0.8835836, 0.972549, 1, 0, 1,
-0.966256, 0.7050793, 0.4774756, 0.9686275, 1, 0, 1,
-0.9638395, -1.980084, -2.697847, 0.9607843, 1, 0, 1,
-0.9600454, 0.2287639, -2.433783, 0.9568627, 1, 0, 1,
-0.9564357, -0.4529026, -1.873027, 0.9490196, 1, 0, 1,
-0.9532073, 0.9504499, -1.399744, 0.945098, 1, 0, 1,
-0.9493387, 0.918376, -0.2225331, 0.9372549, 1, 0, 1,
-0.9474726, -0.4902686, -3.397395, 0.9333333, 1, 0, 1,
-0.9416088, 0.3399984, -1.515977, 0.9254902, 1, 0, 1,
-0.9416066, 0.8392013, -0.2120246, 0.9215686, 1, 0, 1,
-0.9393443, -0.3679138, -2.114702, 0.9137255, 1, 0, 1,
-0.937088, 0.6304415, -0.9523697, 0.9098039, 1, 0, 1,
-0.9368378, 0.4558725, -2.004892, 0.9019608, 1, 0, 1,
-0.9323347, 1.532032, -1.793797, 0.8941177, 1, 0, 1,
-0.9269176, 0.5276671, -1.102796, 0.8901961, 1, 0, 1,
-0.9257075, -0.6436913, -2.492797, 0.8823529, 1, 0, 1,
-0.9228176, 0.452367, 0.2127286, 0.8784314, 1, 0, 1,
-0.917395, 0.4982657, -0.7599088, 0.8705882, 1, 0, 1,
-0.9156905, 0.5935824, -2.427715, 0.8666667, 1, 0, 1,
-0.9155806, 0.7134249, -0.4407445, 0.8588235, 1, 0, 1,
-0.9103825, 0.1311835, -2.853414, 0.854902, 1, 0, 1,
-0.910013, 0.8207464, 0.1285276, 0.8470588, 1, 0, 1,
-0.9038332, 0.3289843, -1.474646, 0.8431373, 1, 0, 1,
-0.899598, 0.7723237, -1.669217, 0.8352941, 1, 0, 1,
-0.8994436, 1.435959, -0.2574079, 0.8313726, 1, 0, 1,
-0.8961008, 0.02497105, -1.80661, 0.8235294, 1, 0, 1,
-0.8957224, 0.7757939, -1.198419, 0.8196079, 1, 0, 1,
-0.8909007, 0.6313682, -1.631713, 0.8117647, 1, 0, 1,
-0.8752478, 0.8422304, 0.4193376, 0.8078431, 1, 0, 1,
-0.8733634, -0.8051916, -2.750371, 0.8, 1, 0, 1,
-0.8719112, -0.2671881, -2.854922, 0.7921569, 1, 0, 1,
-0.864531, -0.2454065, -5.081465, 0.7882353, 1, 0, 1,
-0.8636556, -1.100944, -1.903011, 0.7803922, 1, 0, 1,
-0.8632396, 0.1679535, -1.314889, 0.7764706, 1, 0, 1,
-0.8600532, 1.692027, -0.2939685, 0.7686275, 1, 0, 1,
-0.8529158, 1.776732, -1.848886, 0.7647059, 1, 0, 1,
-0.8437249, -0.5367522, -0.6693978, 0.7568628, 1, 0, 1,
-0.8410325, 1.723797, -1.20425, 0.7529412, 1, 0, 1,
-0.8354162, -0.3549114, -0.7969239, 0.7450981, 1, 0, 1,
-0.8336259, -0.3180738, -3.373906, 0.7411765, 1, 0, 1,
-0.8274552, 0.2031871, -0.6202785, 0.7333333, 1, 0, 1,
-0.8259226, -0.4645168, -2.575963, 0.7294118, 1, 0, 1,
-0.8259052, -1.349991, -1.587739, 0.7215686, 1, 0, 1,
-0.8210537, 0.355287, -0.5321583, 0.7176471, 1, 0, 1,
-0.8202389, 0.772083, -0.7707687, 0.7098039, 1, 0, 1,
-0.8202354, -2.315284, -2.343435, 0.7058824, 1, 0, 1,
-0.8155836, -0.05911595, -0.9570651, 0.6980392, 1, 0, 1,
-0.8126343, 0.07259917, -1.982394, 0.6901961, 1, 0, 1,
-0.8114685, 2.388505, -0.5010353, 0.6862745, 1, 0, 1,
-0.8100954, -1.067735, -0.4006322, 0.6784314, 1, 0, 1,
-0.8080391, 0.5310214, -0.429447, 0.6745098, 1, 0, 1,
-0.805115, -0.05478441, -1.813917, 0.6666667, 1, 0, 1,
-0.8019111, -0.09040382, -1.346637, 0.6627451, 1, 0, 1,
-0.7978482, 1.299503, -0.6175941, 0.654902, 1, 0, 1,
-0.7900659, 0.5441446, -0.3373649, 0.6509804, 1, 0, 1,
-0.7886204, 0.2770348, -0.7988212, 0.6431373, 1, 0, 1,
-0.7834752, -0.2443882, -3.129559, 0.6392157, 1, 0, 1,
-0.7805204, 1.695092, -1.922267, 0.6313726, 1, 0, 1,
-0.7749835, 0.6331051, -0.1556552, 0.627451, 1, 0, 1,
-0.7729115, -0.5069775, -3.34358, 0.6196079, 1, 0, 1,
-0.7693797, -0.6338661, -2.813491, 0.6156863, 1, 0, 1,
-0.7642323, 0.6515507, -1.331266, 0.6078432, 1, 0, 1,
-0.7520021, -0.01138665, -0.5596281, 0.6039216, 1, 0, 1,
-0.7494748, -0.4046705, -1.857598, 0.5960785, 1, 0, 1,
-0.7482241, -0.8325099, -3.270212, 0.5882353, 1, 0, 1,
-0.746742, -0.3887264, -1.998128, 0.5843138, 1, 0, 1,
-0.7383875, 0.7677889, -2.340583, 0.5764706, 1, 0, 1,
-0.7381532, -0.1513794, -4.053738, 0.572549, 1, 0, 1,
-0.7363405, 1.766657, -0.1623218, 0.5647059, 1, 0, 1,
-0.735681, 1.484025, -1.44505, 0.5607843, 1, 0, 1,
-0.7319998, -0.009260598, -2.220429, 0.5529412, 1, 0, 1,
-0.7251778, 1.425192, -1.237092, 0.5490196, 1, 0, 1,
-0.7222928, -1.834956, -3.743808, 0.5411765, 1, 0, 1,
-0.7203124, 1.875134, -0.5983658, 0.5372549, 1, 0, 1,
-0.7177071, 0.529497, -1.149028, 0.5294118, 1, 0, 1,
-0.7120761, -0.5469496, -2.965645, 0.5254902, 1, 0, 1,
-0.7100186, 0.8392912, -0.844269, 0.5176471, 1, 0, 1,
-0.7047876, -0.05000282, -1.823976, 0.5137255, 1, 0, 1,
-0.6916595, 0.9212379, 0.1239416, 0.5058824, 1, 0, 1,
-0.6875564, 1.997313, -0.5677986, 0.5019608, 1, 0, 1,
-0.6873835, -1.666127, -3.19707, 0.4941176, 1, 0, 1,
-0.6739634, 0.1184432, -0.3689885, 0.4862745, 1, 0, 1,
-0.667255, -0.8219681, -2.142416, 0.4823529, 1, 0, 1,
-0.6629694, 0.5514106, -1.064328, 0.4745098, 1, 0, 1,
-0.6571119, 1.283541, -0.2894642, 0.4705882, 1, 0, 1,
-0.6564212, 1.189868, 1.474016, 0.4627451, 1, 0, 1,
-0.6542068, 0.1945313, 1.528344, 0.4588235, 1, 0, 1,
-0.6540781, -0.04452688, 0.2238112, 0.4509804, 1, 0, 1,
-0.6519629, 0.8795894, 1.89316, 0.4470588, 1, 0, 1,
-0.6429931, 0.2848772, -2.044607, 0.4392157, 1, 0, 1,
-0.6424507, 2.448835, 0.149754, 0.4352941, 1, 0, 1,
-0.6418673, 0.5844267, 0.3596004, 0.427451, 1, 0, 1,
-0.6330075, -2.178432, -2.854483, 0.4235294, 1, 0, 1,
-0.6300055, -0.1840964, -2.528515, 0.4156863, 1, 0, 1,
-0.6298344, -0.3546549, -2.517921, 0.4117647, 1, 0, 1,
-0.6295155, 0.9324611, -0.4251466, 0.4039216, 1, 0, 1,
-0.6256702, 1.291733, -1.278827, 0.3960784, 1, 0, 1,
-0.6198834, 0.6646978, -1.273914, 0.3921569, 1, 0, 1,
-0.6195469, 1.056745, -0.600729, 0.3843137, 1, 0, 1,
-0.6130614, -1.720534, -2.35761, 0.3803922, 1, 0, 1,
-0.6088937, 0.8668069, 2.104151, 0.372549, 1, 0, 1,
-0.6049992, 0.06382842, -2.639895, 0.3686275, 1, 0, 1,
-0.6035864, 0.1476108, -2.337672, 0.3607843, 1, 0, 1,
-0.6004419, 0.5641603, 0.7246774, 0.3568628, 1, 0, 1,
-0.596112, -0.9425999, -2.244025, 0.3490196, 1, 0, 1,
-0.5955549, 0.3078601, -0.2626503, 0.345098, 1, 0, 1,
-0.594419, 1.1043, -2.326627, 0.3372549, 1, 0, 1,
-0.5929485, -0.9088418, -1.776344, 0.3333333, 1, 0, 1,
-0.5928064, 1.461401, -0.5447688, 0.3254902, 1, 0, 1,
-0.5921087, -0.318921, -2.481684, 0.3215686, 1, 0, 1,
-0.5870131, 0.5374348, -1.076473, 0.3137255, 1, 0, 1,
-0.5847932, 1.032496, 0.6326621, 0.3098039, 1, 0, 1,
-0.5838271, 0.6556887, 0.8028736, 0.3019608, 1, 0, 1,
-0.5831767, -1.106447, -4.002495, 0.2941177, 1, 0, 1,
-0.5793237, -0.535752, -2.816222, 0.2901961, 1, 0, 1,
-0.5788102, -1.199003, -2.601047, 0.282353, 1, 0, 1,
-0.5703795, -1.499066, -3.065243, 0.2784314, 1, 0, 1,
-0.5674357, -2.98375, -4.318099, 0.2705882, 1, 0, 1,
-0.5610716, 2.211971, -1.004927, 0.2666667, 1, 0, 1,
-0.5593041, 1.008899, -0.7931284, 0.2588235, 1, 0, 1,
-0.5575705, -1.639119, -3.301322, 0.254902, 1, 0, 1,
-0.5543162, 0.8524693, -0.329944, 0.2470588, 1, 0, 1,
-0.5483522, -1.850801, -2.719553, 0.2431373, 1, 0, 1,
-0.5374539, -0.1047899, -3.332857, 0.2352941, 1, 0, 1,
-0.5361081, -0.7451692, -0.9500317, 0.2313726, 1, 0, 1,
-0.5329919, -0.08127708, -0.8451855, 0.2235294, 1, 0, 1,
-0.5260319, -0.4362117, -2.278339, 0.2196078, 1, 0, 1,
-0.5258464, 0.6089505, 0.5503341, 0.2117647, 1, 0, 1,
-0.5196971, 0.1848481, -0.5743833, 0.2078431, 1, 0, 1,
-0.5165648, 0.3322867, -1.558995, 0.2, 1, 0, 1,
-0.5138142, 0.7710379, -0.8711143, 0.1921569, 1, 0, 1,
-0.5092658, 1.900557, 1.181946, 0.1882353, 1, 0, 1,
-0.5057897, 0.5673772, 0.4102555, 0.1803922, 1, 0, 1,
-0.5040597, 0.1657392, -0.6336325, 0.1764706, 1, 0, 1,
-0.4927956, -0.9994922, -2.731143, 0.1686275, 1, 0, 1,
-0.4901452, -0.3196171, -2.92752, 0.1647059, 1, 0, 1,
-0.4876406, 0.68689, 0.9880655, 0.1568628, 1, 0, 1,
-0.4875794, -0.6433784, -0.5509608, 0.1529412, 1, 0, 1,
-0.4857917, 0.3186236, -0.4805969, 0.145098, 1, 0, 1,
-0.4855923, 0.3466255, -0.5699473, 0.1411765, 1, 0, 1,
-0.4832589, 0.5064627, -1.474666, 0.1333333, 1, 0, 1,
-0.478779, -1.021694, -0.3806252, 0.1294118, 1, 0, 1,
-0.4744077, 0.2035308, -1.976635, 0.1215686, 1, 0, 1,
-0.4723878, 0.5658061, 0.04176019, 0.1176471, 1, 0, 1,
-0.469843, -0.935196, -1.490501, 0.1098039, 1, 0, 1,
-0.4697533, 0.8834383, -1.190884, 0.1058824, 1, 0, 1,
-0.4653559, -0.5189539, -1.984755, 0.09803922, 1, 0, 1,
-0.461547, -0.3777576, -2.086272, 0.09019608, 1, 0, 1,
-0.4574241, 0.7992561, -0.176944, 0.08627451, 1, 0, 1,
-0.456251, -0.7372236, -2.473326, 0.07843138, 1, 0, 1,
-0.4554196, -1.799662, -3.325989, 0.07450981, 1, 0, 1,
-0.4528063, -0.9729092, -3.095432, 0.06666667, 1, 0, 1,
-0.450901, 1.109476, -0.7078381, 0.0627451, 1, 0, 1,
-0.4478508, 0.6464454, -0.7434202, 0.05490196, 1, 0, 1,
-0.4436644, -0.0257266, -2.525671, 0.05098039, 1, 0, 1,
-0.4426229, 0.7767174, -3.643918, 0.04313726, 1, 0, 1,
-0.4410437, 1.564885, 0.005929154, 0.03921569, 1, 0, 1,
-0.4408021, 0.4311614, -3.147081, 0.03137255, 1, 0, 1,
-0.4397758, 0.284058, -1.704157, 0.02745098, 1, 0, 1,
-0.4352282, -0.2813796, -3.18317, 0.01960784, 1, 0, 1,
-0.4352059, 0.0180995, -2.242766, 0.01568628, 1, 0, 1,
-0.4345998, -0.958778, -2.303092, 0.007843138, 1, 0, 1,
-0.4291925, 2.153937, -0.5648566, 0.003921569, 1, 0, 1,
-0.4193452, 0.6472489, 1.039372, 0, 1, 0.003921569, 1,
-0.4191975, -0.7064078, -3.671366, 0, 1, 0.01176471, 1,
-0.4181533, 0.4115599, 0.15301, 0, 1, 0.01568628, 1,
-0.4169524, -1.213149, -3.164601, 0, 1, 0.02352941, 1,
-0.4111924, 0.4294512, -0.6192833, 0, 1, 0.02745098, 1,
-0.4058284, -0.02047472, -0.3134033, 0, 1, 0.03529412, 1,
-0.4030391, 0.9307781, 0.2961536, 0, 1, 0.03921569, 1,
-0.3982775, -0.602963, -3.026389, 0, 1, 0.04705882, 1,
-0.3956092, -0.7335786, -1.667232, 0, 1, 0.05098039, 1,
-0.3947639, 2.897253, -0.01652216, 0, 1, 0.05882353, 1,
-0.3920132, -1.408711, -2.000763, 0, 1, 0.0627451, 1,
-0.3916849, -1.040094, -3.101325, 0, 1, 0.07058824, 1,
-0.3870249, 1.035672, 0.6438279, 0, 1, 0.07450981, 1,
-0.3781027, -0.3171384, -3.126091, 0, 1, 0.08235294, 1,
-0.3767034, 0.3137228, -1.956141, 0, 1, 0.08627451, 1,
-0.3748086, -1.333823, -4.26811, 0, 1, 0.09411765, 1,
-0.371494, -1.389398, -2.18491, 0, 1, 0.1019608, 1,
-0.3669064, -0.7870515, -4.053284, 0, 1, 0.1058824, 1,
-0.3662778, 0.4735881, -0.1993678, 0, 1, 0.1137255, 1,
-0.3630496, 1.719178, 0.02392752, 0, 1, 0.1176471, 1,
-0.362685, 0.9099932, -0.7438453, 0, 1, 0.1254902, 1,
-0.3592541, -1.222241, -3.097373, 0, 1, 0.1294118, 1,
-0.3584441, -0.9502144, -3.704768, 0, 1, 0.1372549, 1,
-0.3534761, -0.7029401, -2.098851, 0, 1, 0.1411765, 1,
-0.350947, -0.1180648, -2.342246, 0, 1, 0.1490196, 1,
-0.3508783, 0.1179112, -0.2172276, 0, 1, 0.1529412, 1,
-0.3473807, 0.4035943, -2.052732, 0, 1, 0.1607843, 1,
-0.3464423, -0.414592, -2.547179, 0, 1, 0.1647059, 1,
-0.3427395, -1.082353, -0.8371047, 0, 1, 0.172549, 1,
-0.3340255, 1.351822, 0.5701866, 0, 1, 0.1764706, 1,
-0.3254432, 2.205072, -0.7278344, 0, 1, 0.1843137, 1,
-0.3242896, -1.850644, -3.836365, 0, 1, 0.1882353, 1,
-0.3235627, 1.280096, 0.6808396, 0, 1, 0.1960784, 1,
-0.3200583, 0.7888241, -1.797223, 0, 1, 0.2039216, 1,
-0.3135253, -0.3806245, -3.214, 0, 1, 0.2078431, 1,
-0.3115639, 0.05539053, -2.29364, 0, 1, 0.2156863, 1,
-0.3097229, 1.224262, -0.2888862, 0, 1, 0.2196078, 1,
-0.3081918, 0.4218833, 0.255181, 0, 1, 0.227451, 1,
-0.3080167, 0.1858123, -1.507795, 0, 1, 0.2313726, 1,
-0.3079825, 1.531277, -1.219167, 0, 1, 0.2392157, 1,
-0.3058075, -1.180132, -2.652935, 0, 1, 0.2431373, 1,
-0.3038854, 0.6327506, 0.5081429, 0, 1, 0.2509804, 1,
-0.3009997, -2.236856, -3.930617, 0, 1, 0.254902, 1,
-0.3004012, 1.032479, 1.412861, 0, 1, 0.2627451, 1,
-0.2986363, -0.09138359, -0.8010876, 0, 1, 0.2666667, 1,
-0.2975287, 0.7628636, -0.718639, 0, 1, 0.2745098, 1,
-0.2955282, -1.794487, -3.331979, 0, 1, 0.2784314, 1,
-0.2934727, 0.5629765, -1.864525, 0, 1, 0.2862745, 1,
-0.2931469, 0.4601139, 2.134463, 0, 1, 0.2901961, 1,
-0.2902354, -1.639344, -2.967038, 0, 1, 0.2980392, 1,
-0.2878004, -0.6300327, -3.58743, 0, 1, 0.3058824, 1,
-0.2872688, 0.8016303, -0.494422, 0, 1, 0.3098039, 1,
-0.2847993, -1.469444, -2.775376, 0, 1, 0.3176471, 1,
-0.2819181, -0.9085967, -2.207992, 0, 1, 0.3215686, 1,
-0.2816729, -0.4056487, -3.31614, 0, 1, 0.3294118, 1,
-0.2791846, -1.134062, -1.963855, 0, 1, 0.3333333, 1,
-0.2791046, 1.249478, -1.073389, 0, 1, 0.3411765, 1,
-0.2728555, 0.03212704, 0.5016356, 0, 1, 0.345098, 1,
-0.2716227, -0.963149, -2.161789, 0, 1, 0.3529412, 1,
-0.2702229, 0.3431219, -0.1837325, 0, 1, 0.3568628, 1,
-0.2640481, -0.2290291, -3.458372, 0, 1, 0.3647059, 1,
-0.2617194, -0.3371494, -3.572212, 0, 1, 0.3686275, 1,
-0.2615957, 0.8797813, -1.057616, 0, 1, 0.3764706, 1,
-0.2606685, 0.5299673, 0.6598494, 0, 1, 0.3803922, 1,
-0.2570223, 0.2034799, 0.1517487, 0, 1, 0.3882353, 1,
-0.2538435, 1.516802, 0.7684678, 0, 1, 0.3921569, 1,
-0.2517671, 0.493604, 1.433387, 0, 1, 0.4, 1,
-0.2494689, 1.396629, -0.4148133, 0, 1, 0.4078431, 1,
-0.239554, 2.149854, 0.3248341, 0, 1, 0.4117647, 1,
-0.2373778, 0.03236045, -1.783489, 0, 1, 0.4196078, 1,
-0.2366511, 0.349258, -0.02856762, 0, 1, 0.4235294, 1,
-0.232315, 1.455658, -1.498653, 0, 1, 0.4313726, 1,
-0.2296717, -0.1302541, -2.192047, 0, 1, 0.4352941, 1,
-0.2294059, -1.409411, -3.82275, 0, 1, 0.4431373, 1,
-0.2275347, -0.854342, -3.726277, 0, 1, 0.4470588, 1,
-0.2268279, -0.9594132, -3.71097, 0, 1, 0.454902, 1,
-0.2228622, 1.118138, -1.165688, 0, 1, 0.4588235, 1,
-0.2215963, 1.389362, 0.2861332, 0, 1, 0.4666667, 1,
-0.2184671, -0.7201229, -4.281024, 0, 1, 0.4705882, 1,
-0.2169571, 0.7568697, -0.5684664, 0, 1, 0.4784314, 1,
-0.216509, -0.9189767, -3.423309, 0, 1, 0.4823529, 1,
-0.214084, 0.3088919, 0.9367008, 0, 1, 0.4901961, 1,
-0.2139422, -1.238369, -1.94617, 0, 1, 0.4941176, 1,
-0.2139389, -0.05085821, -2.159103, 0, 1, 0.5019608, 1,
-0.2134712, 0.470963, -1.664275, 0, 1, 0.509804, 1,
-0.2111335, 1.03288, 2.423457, 0, 1, 0.5137255, 1,
-0.2103777, -1.13783, -1.807674, 0, 1, 0.5215687, 1,
-0.2102769, 0.8789729, 0.08083224, 0, 1, 0.5254902, 1,
-0.2053862, -1.489253, -4.173255, 0, 1, 0.5333334, 1,
-0.2017655, 0.678485, -0.7108876, 0, 1, 0.5372549, 1,
-0.1997375, 0.1081702, -2.050716, 0, 1, 0.5450981, 1,
-0.199207, 0.4222857, -0.7964056, 0, 1, 0.5490196, 1,
-0.1963202, -0.09538739, -3.09946, 0, 1, 0.5568628, 1,
-0.1938121, -0.2573657, -3.180431, 0, 1, 0.5607843, 1,
-0.1923745, -0.4877938, -1.161886, 0, 1, 0.5686275, 1,
-0.1882478, 0.06682003, -2.167693, 0, 1, 0.572549, 1,
-0.18483, -0.8571475, -4.119664, 0, 1, 0.5803922, 1,
-0.1821065, -0.7551295, -4.207448, 0, 1, 0.5843138, 1,
-0.1811042, 0.09670788, -0.5502355, 0, 1, 0.5921569, 1,
-0.1806915, -0.9888135, -3.765218, 0, 1, 0.5960785, 1,
-0.1790467, 0.690587, -0.4023478, 0, 1, 0.6039216, 1,
-0.1777286, 0.6826194, -0.09129162, 0, 1, 0.6117647, 1,
-0.1773504, -0.1033945, -1.234456, 0, 1, 0.6156863, 1,
-0.174123, -0.1314178, -2.30311, 0, 1, 0.6235294, 1,
-0.1705342, -1.625518, -2.838139, 0, 1, 0.627451, 1,
-0.1679263, -0.8668225, -2.903158, 0, 1, 0.6352941, 1,
-0.1678346, 0.3748431, 0.8077158, 0, 1, 0.6392157, 1,
-0.1671454, -0.6937412, -4.557981, 0, 1, 0.6470588, 1,
-0.1666025, -0.05164809, -3.576506, 0, 1, 0.6509804, 1,
-0.1646811, 1.340481, -0.8443172, 0, 1, 0.6588235, 1,
-0.1596228, -0.850208, -2.14595, 0, 1, 0.6627451, 1,
-0.153508, 0.3346633, 0.2592909, 0, 1, 0.6705883, 1,
-0.1530745, 0.2557803, 0.3967745, 0, 1, 0.6745098, 1,
-0.1504509, 0.1722027, -0.289095, 0, 1, 0.682353, 1,
-0.1504003, 0.156359, 0.1083137, 0, 1, 0.6862745, 1,
-0.1479009, 0.6891607, -0.06627765, 0, 1, 0.6941177, 1,
-0.1456155, 0.4405158, -0.1095263, 0, 1, 0.7019608, 1,
-0.1429056, -1.291684, -3.50408, 0, 1, 0.7058824, 1,
-0.1381911, 0.9238061, 0.4803416, 0, 1, 0.7137255, 1,
-0.1346351, -1.502847, -1.92262, 0, 1, 0.7176471, 1,
-0.133045, 0.408226, -0.6837999, 0, 1, 0.7254902, 1,
-0.1325137, 0.3502938, 1.69545, 0, 1, 0.7294118, 1,
-0.1321092, 0.7678121, -0.8905541, 0, 1, 0.7372549, 1,
-0.1319199, -1.046681, -3.399194, 0, 1, 0.7411765, 1,
-0.1277049, -2.054228, -2.142422, 0, 1, 0.7490196, 1,
-0.1267572, 0.7696365, 0.5197429, 0, 1, 0.7529412, 1,
-0.1242581, 1.341741, 0.4306774, 0, 1, 0.7607843, 1,
-0.1222811, 1.024927, -0.9357032, 0, 1, 0.7647059, 1,
-0.1211745, -1.17036, -2.738389, 0, 1, 0.772549, 1,
-0.1185434, 0.4313661, 0.2952179, 0, 1, 0.7764706, 1,
-0.117312, 1.251076, -0.2514741, 0, 1, 0.7843137, 1,
-0.1141601, 0.9444838, 1.381686, 0, 1, 0.7882353, 1,
-0.1137113, -0.2929595, -3.94351, 0, 1, 0.7960784, 1,
-0.112573, -0.3106704, -3.640712, 0, 1, 0.8039216, 1,
-0.1103207, 2.569371, -0.1556651, 0, 1, 0.8078431, 1,
-0.1079585, 0.5423949, 0.5165244, 0, 1, 0.8156863, 1,
-0.1062462, -0.9837843, -2.624495, 0, 1, 0.8196079, 1,
-0.1054478, 0.5209002, 1.559569, 0, 1, 0.827451, 1,
-0.1022437, -1.308982, -3.016186, 0, 1, 0.8313726, 1,
-0.09795193, -0.6325231, -2.746133, 0, 1, 0.8392157, 1,
-0.09383434, 0.6617618, 0.5150571, 0, 1, 0.8431373, 1,
-0.08804769, -0.9907929, -3.411798, 0, 1, 0.8509804, 1,
-0.087903, 0.7721484, -0.8995176, 0, 1, 0.854902, 1,
-0.08729611, 2.096229, 0.234403, 0, 1, 0.8627451, 1,
-0.08681545, -0.7394397, -2.507865, 0, 1, 0.8666667, 1,
-0.08609919, 1.02869, 0.1488062, 0, 1, 0.8745098, 1,
-0.08320742, -0.4672373, -2.91485, 0, 1, 0.8784314, 1,
-0.08127075, 0.9751288, -0.01551721, 0, 1, 0.8862745, 1,
-0.0767776, -0.7303199, -1.491253, 0, 1, 0.8901961, 1,
-0.06961676, -1.198362, -3.358421, 0, 1, 0.8980392, 1,
-0.06586488, -0.2221146, -1.371015, 0, 1, 0.9058824, 1,
-0.06580044, 0.1127379, -0.7019809, 0, 1, 0.9098039, 1,
-0.0618011, -0.5721053, -2.338757, 0, 1, 0.9176471, 1,
-0.05814512, 0.470383, -1.494256, 0, 1, 0.9215686, 1,
-0.05585426, 0.2783913, -0.8927612, 0, 1, 0.9294118, 1,
-0.05066136, 1.325373, 0.9432123, 0, 1, 0.9333333, 1,
-0.05048247, 2.128264, 0.7003837, 0, 1, 0.9411765, 1,
-0.04958536, -0.7543623, -1.93818, 0, 1, 0.945098, 1,
-0.04833828, -3.084158, -3.944583, 0, 1, 0.9529412, 1,
-0.04830257, 1.331342, -0.5201185, 0, 1, 0.9568627, 1,
-0.04654297, 0.07316664, -1.093833, 0, 1, 0.9647059, 1,
-0.04553885, 0.05356224, 0.04081379, 0, 1, 0.9686275, 1,
-0.04415013, 0.3848279, -0.4572949, 0, 1, 0.9764706, 1,
-0.0429336, 0.9280122, 1.186757, 0, 1, 0.9803922, 1,
-0.04009932, 0.01218822, -1.575733, 0, 1, 0.9882353, 1,
-0.03941307, -0.7490034, -0.7958974, 0, 1, 0.9921569, 1,
-0.03828213, 1.464256, 0.2285372, 0, 1, 1, 1,
-0.0381341, -0.8057041, -2.845093, 0, 0.9921569, 1, 1,
-0.03770199, -0.3020018, -3.451889, 0, 0.9882353, 1, 1,
-0.03756567, -0.5998713, -3.392879, 0, 0.9803922, 1, 1,
-0.03313899, -1.364401, -1.126717, 0, 0.9764706, 1, 1,
-0.03307479, -0.6160083, -3.56844, 0, 0.9686275, 1, 1,
-0.03139055, 0.5763421, 1.03666, 0, 0.9647059, 1, 1,
-0.01901443, 1.078264, 0.8087458, 0, 0.9568627, 1, 1,
-0.01822193, 1.435335, 1.063489, 0, 0.9529412, 1, 1,
-0.01577116, 1.179832, -0.785315, 0, 0.945098, 1, 1,
-0.01441231, 0.04162411, -0.116574, 0, 0.9411765, 1, 1,
-0.009234248, 1.250976, -0.3655597, 0, 0.9333333, 1, 1,
-0.008280978, -2.211178, -4.517942, 0, 0.9294118, 1, 1,
-0.00610585, 0.1032859, -0.4554774, 0, 0.9215686, 1, 1,
-0.005024744, 1.476057, -0.01169565, 0, 0.9176471, 1, 1,
-0.004430338, -1.308161, -3.318866, 0, 0.9098039, 1, 1,
-0.002681912, 0.02608708, -2.234368, 0, 0.9058824, 1, 1,
-0.001098973, 0.6595475, 0.6143895, 0, 0.8980392, 1, 1,
0.005331332, -1.615305, 3.165453, 0, 0.8901961, 1, 1,
0.009460093, 1.171723, 0.4273019, 0, 0.8862745, 1, 1,
0.01100654, 0.5278235, 1.211522, 0, 0.8784314, 1, 1,
0.01712357, 0.03901383, -0.2530505, 0, 0.8745098, 1, 1,
0.01858086, -2.066629, 4.161181, 0, 0.8666667, 1, 1,
0.02007442, -0.3571292, 1.802402, 0, 0.8627451, 1, 1,
0.02294392, 2.005996, -1.827949, 0, 0.854902, 1, 1,
0.02296038, -2.230792, 4.29107, 0, 0.8509804, 1, 1,
0.02361031, 1.242337, 0.8258982, 0, 0.8431373, 1, 1,
0.03050257, 0.2103218, -0.8230126, 0, 0.8392157, 1, 1,
0.03895024, 0.3577256, 1.284214, 0, 0.8313726, 1, 1,
0.04003268, 0.8281344, -0.3593183, 0, 0.827451, 1, 1,
0.04075504, 0.2642889, 3.157152, 0, 0.8196079, 1, 1,
0.04368507, 0.09441237, 1.766698, 0, 0.8156863, 1, 1,
0.04666736, 0.2506971, 2.966792, 0, 0.8078431, 1, 1,
0.04919547, 0.2292703, -2.547593, 0, 0.8039216, 1, 1,
0.05896013, -0.7404304, 3.113273, 0, 0.7960784, 1, 1,
0.05973577, -0.7688658, 3.731615, 0, 0.7882353, 1, 1,
0.06221061, -1.375358, 2.926535, 0, 0.7843137, 1, 1,
0.06411593, 1.099445, 0.2494847, 0, 0.7764706, 1, 1,
0.06660391, 0.5166204, 0.5490891, 0, 0.772549, 1, 1,
0.06741546, 0.02953582, -0.6807687, 0, 0.7647059, 1, 1,
0.07701945, 1.583762, 0.4618967, 0, 0.7607843, 1, 1,
0.08147558, -0.09609173, 2.96286, 0, 0.7529412, 1, 1,
0.08165471, -0.5589508, 2.031245, 0, 0.7490196, 1, 1,
0.08882856, -0.5700324, 2.901185, 0, 0.7411765, 1, 1,
0.09053287, 0.6250207, 0.08749669, 0, 0.7372549, 1, 1,
0.09242007, 0.8622431, -0.5068536, 0, 0.7294118, 1, 1,
0.09297206, -0.7572724, 3.838959, 0, 0.7254902, 1, 1,
0.09589243, 0.8988078, 1.24449, 0, 0.7176471, 1, 1,
0.09935053, 1.13853, -0.03850734, 0, 0.7137255, 1, 1,
0.100981, -0.5424854, 3.866177, 0, 0.7058824, 1, 1,
0.1022347, 0.1141248, 1.468098, 0, 0.6980392, 1, 1,
0.1036762, 0.7945305, -0.0003493917, 0, 0.6941177, 1, 1,
0.1112333, 1.979936, -0.5809317, 0, 0.6862745, 1, 1,
0.1128173, 0.1468945, 1.526967, 0, 0.682353, 1, 1,
0.1129427, -0.275409, 4.227881, 0, 0.6745098, 1, 1,
0.1146221, -0.5675265, 2.668058, 0, 0.6705883, 1, 1,
0.1199708, 2.217584, -0.3301163, 0, 0.6627451, 1, 1,
0.1203493, 1.443872, -0.1432219, 0, 0.6588235, 1, 1,
0.1224234, -0.8643213, 1.354387, 0, 0.6509804, 1, 1,
0.1252179, 0.1478914, 0.5955686, 0, 0.6470588, 1, 1,
0.1338397, 0.2211752, 0.2932579, 0, 0.6392157, 1, 1,
0.1376022, 1.070694, -0.01561926, 0, 0.6352941, 1, 1,
0.1379529, -1.847849, 3.413455, 0, 0.627451, 1, 1,
0.1380385, -0.8359811, 4.580257, 0, 0.6235294, 1, 1,
0.1430724, -1.404169, 3.580598, 0, 0.6156863, 1, 1,
0.1437599, -0.7797865, 0.8660905, 0, 0.6117647, 1, 1,
0.1455127, 0.4830611, 0.9782301, 0, 0.6039216, 1, 1,
0.1457244, -1.33764, 1.528047, 0, 0.5960785, 1, 1,
0.148704, 0.2137945, 0.1039322, 0, 0.5921569, 1, 1,
0.1539043, 2.075399, 0.4455484, 0, 0.5843138, 1, 1,
0.1558293, 0.207444, -0.5592192, 0, 0.5803922, 1, 1,
0.1652258, 0.7977908, -0.1400966, 0, 0.572549, 1, 1,
0.1668669, -0.2921273, 2.64649, 0, 0.5686275, 1, 1,
0.1701316, -1.999006, 2.967538, 0, 0.5607843, 1, 1,
0.1706879, -0.8342191, 3.049303, 0, 0.5568628, 1, 1,
0.1738139, 0.2455922, 3.188029, 0, 0.5490196, 1, 1,
0.1746154, -1.433323, 2.598535, 0, 0.5450981, 1, 1,
0.1746308, -0.8617038, 2.717534, 0, 0.5372549, 1, 1,
0.1751672, -1.521445, 3.468875, 0, 0.5333334, 1, 1,
0.1771201, -0.4102366, 2.212661, 0, 0.5254902, 1, 1,
0.1836565, -2.022461, 4.845443, 0, 0.5215687, 1, 1,
0.1884365, -1.360542, 2.72365, 0, 0.5137255, 1, 1,
0.1902224, 1.141813, 0.1783047, 0, 0.509804, 1, 1,
0.1958593, 0.9379165, 0.2980751, 0, 0.5019608, 1, 1,
0.196913, -0.08974575, 0.8164442, 0, 0.4941176, 1, 1,
0.2012655, -0.318414, 1.573514, 0, 0.4901961, 1, 1,
0.2052542, 0.9232676, -0.871055, 0, 0.4823529, 1, 1,
0.2078912, 0.103836, 1.618012, 0, 0.4784314, 1, 1,
0.2090874, -1.022914, 1.728103, 0, 0.4705882, 1, 1,
0.2107394, 1.325058, 1.23867, 0, 0.4666667, 1, 1,
0.2113685, -1.520806, 2.406086, 0, 0.4588235, 1, 1,
0.2133387, 0.3463459, 0.1684444, 0, 0.454902, 1, 1,
0.2165032, -1.144833, 2.57962, 0, 0.4470588, 1, 1,
0.2219334, -0.03076107, 2.951438, 0, 0.4431373, 1, 1,
0.2273093, 0.8446657, 0.7377487, 0, 0.4352941, 1, 1,
0.2273771, -0.9460411, 2.729624, 0, 0.4313726, 1, 1,
0.2276171, 0.2724378, -0.9141648, 0, 0.4235294, 1, 1,
0.2304089, -0.2993405, 1.074795, 0, 0.4196078, 1, 1,
0.23294, -2.123544, 2.938596, 0, 0.4117647, 1, 1,
0.2341181, -0.397607, 3.08668, 0, 0.4078431, 1, 1,
0.2355776, 0.9546337, -0.8999962, 0, 0.4, 1, 1,
0.2402314, -1.069958, 2.614223, 0, 0.3921569, 1, 1,
0.2420438, -0.1951205, 2.17909, 0, 0.3882353, 1, 1,
0.2463555, -1.388116, 4.420109, 0, 0.3803922, 1, 1,
0.248895, -0.8701381, 1.864064, 0, 0.3764706, 1, 1,
0.252909, 0.3803356, 1.10776, 0, 0.3686275, 1, 1,
0.2571337, -0.2583774, 1.291671, 0, 0.3647059, 1, 1,
0.2577568, 0.2323694, 2.055777, 0, 0.3568628, 1, 1,
0.2607038, 0.2835405, 1.122654, 0, 0.3529412, 1, 1,
0.2622155, -0.1812854, 1.444624, 0, 0.345098, 1, 1,
0.2638818, -0.1821512, 2.616603, 0, 0.3411765, 1, 1,
0.2650138, 0.3163199, 1.674636, 0, 0.3333333, 1, 1,
0.2663414, 0.3936687, -0.004457224, 0, 0.3294118, 1, 1,
0.270851, -0.6220019, 4.517528, 0, 0.3215686, 1, 1,
0.2710676, 0.7201244, 3.799748, 0, 0.3176471, 1, 1,
0.2720487, -0.2337605, 3.404013, 0, 0.3098039, 1, 1,
0.2744089, -0.529871, 2.178174, 0, 0.3058824, 1, 1,
0.2780744, -1.169798, 3.978044, 0, 0.2980392, 1, 1,
0.2811484, -0.7659918, 2.476587, 0, 0.2901961, 1, 1,
0.2812724, 1.335157, 1.433935, 0, 0.2862745, 1, 1,
0.2815974, -0.6209716, 2.628126, 0, 0.2784314, 1, 1,
0.2833503, 0.7406207, 2.489714, 0, 0.2745098, 1, 1,
0.286604, -0.3182848, 2.181205, 0, 0.2666667, 1, 1,
0.2916384, 2.147859, -0.813365, 0, 0.2627451, 1, 1,
0.2931919, 0.05139107, 2.696608, 0, 0.254902, 1, 1,
0.2938754, 1.013456, 0.7626507, 0, 0.2509804, 1, 1,
0.2988804, -0.4777567, 2.383115, 0, 0.2431373, 1, 1,
0.3018177, -1.682144, 2.475841, 0, 0.2392157, 1, 1,
0.3032824, 0.1558608, 1.281438, 0, 0.2313726, 1, 1,
0.3054098, -0.9964036, 2.444728, 0, 0.227451, 1, 1,
0.3075332, -0.8806837, 4.053483, 0, 0.2196078, 1, 1,
0.3087115, -0.4362339, 2.792377, 0, 0.2156863, 1, 1,
0.3101609, -0.3846781, 1.264096, 0, 0.2078431, 1, 1,
0.3117346, 0.2061073, -0.387206, 0, 0.2039216, 1, 1,
0.3211966, -1.411676, 4.685505, 0, 0.1960784, 1, 1,
0.3222764, -1.621422, 2.004168, 0, 0.1882353, 1, 1,
0.3241333, -0.9316083, 2.762485, 0, 0.1843137, 1, 1,
0.3254361, -0.4102874, 3.119721, 0, 0.1764706, 1, 1,
0.325898, -0.2410027, 2.126715, 0, 0.172549, 1, 1,
0.3294916, 2.802922, 0.5079327, 0, 0.1647059, 1, 1,
0.3341353, -2.111342, 2.70872, 0, 0.1607843, 1, 1,
0.3351753, 0.3792302, 0.5227532, 0, 0.1529412, 1, 1,
0.3387784, -1.302722, 2.793928, 0, 0.1490196, 1, 1,
0.3556105, 1.234334, 0.1807205, 0, 0.1411765, 1, 1,
0.3564318, -1.103127, 4.035062, 0, 0.1372549, 1, 1,
0.3595265, -2.194457, 3.646401, 0, 0.1294118, 1, 1,
0.3625929, -1.279643, 2.484299, 0, 0.1254902, 1, 1,
0.3655235, 0.2718033, -1.254568, 0, 0.1176471, 1, 1,
0.3691024, -0.2430449, 1.182758, 0, 0.1137255, 1, 1,
0.3721471, 1.148901, 2.596231, 0, 0.1058824, 1, 1,
0.37541, 0.747645, 0.3113795, 0, 0.09803922, 1, 1,
0.3756568, 0.3834812, -0.05164492, 0, 0.09411765, 1, 1,
0.3757658, 0.2788464, 3.738465, 0, 0.08627451, 1, 1,
0.3797991, -0.8440145, 2.557682, 0, 0.08235294, 1, 1,
0.3805635, -0.2614321, 2.924156, 0, 0.07450981, 1, 1,
0.3825944, 0.7825866, 0.137077, 0, 0.07058824, 1, 1,
0.3883782, -0.2156886, 0.9716129, 0, 0.0627451, 1, 1,
0.3900049, 0.6811655, 0.7016538, 0, 0.05882353, 1, 1,
0.3929664, -0.129817, 1.130114, 0, 0.05098039, 1, 1,
0.3967882, 0.8752024, 0.5614285, 0, 0.04705882, 1, 1,
0.397562, 0.4344824, 0.6448188, 0, 0.03921569, 1, 1,
0.4018672, 2.116709, -0.880309, 0, 0.03529412, 1, 1,
0.4045991, 1.629503, 1.225626, 0, 0.02745098, 1, 1,
0.4071328, -1.508504, 2.76031, 0, 0.02352941, 1, 1,
0.4210049, -0.2346717, 2.912254, 0, 0.01568628, 1, 1,
0.4226349, 0.4488909, 2.247862, 0, 0.01176471, 1, 1,
0.4231325, 0.1236443, -0.2969979, 0, 0.003921569, 1, 1,
0.4262804, 0.7820641, 1.101414, 0.003921569, 0, 1, 1,
0.4300435, 0.3201315, 1.133492, 0.007843138, 0, 1, 1,
0.4318147, 1.366264, 0.1278888, 0.01568628, 0, 1, 1,
0.4342791, -0.8593249, 1.564003, 0.01960784, 0, 1, 1,
0.4441862, 0.05166657, 1.356657, 0.02745098, 0, 1, 1,
0.4464347, 0.5469161, 0.9000018, 0.03137255, 0, 1, 1,
0.4483643, 0.1728615, 2.136367, 0.03921569, 0, 1, 1,
0.4504119, -0.7534285, 3.518799, 0.04313726, 0, 1, 1,
0.4524647, 1.272399, 0.5972658, 0.05098039, 0, 1, 1,
0.4540846, 2.460809, 0.5949611, 0.05490196, 0, 1, 1,
0.4577207, -0.9743961, 0.2915918, 0.0627451, 0, 1, 1,
0.4594949, -1.315723, 3.685323, 0.06666667, 0, 1, 1,
0.460042, 0.6381629, 0.6697639, 0.07450981, 0, 1, 1,
0.4604484, 1.085186, 1.991835, 0.07843138, 0, 1, 1,
0.4654589, -0.6012608, 0.917098, 0.08627451, 0, 1, 1,
0.4694354, 1.067812, 0.9064092, 0.09019608, 0, 1, 1,
0.4696041, 1.094134, 1.49264, 0.09803922, 0, 1, 1,
0.4705232, -0.5661807, 2.178027, 0.1058824, 0, 1, 1,
0.4797128, 0.8340409, -0.02693238, 0.1098039, 0, 1, 1,
0.4882113, -0.844138, 3.492517, 0.1176471, 0, 1, 1,
0.4899335, 0.5147746, 1.737364, 0.1215686, 0, 1, 1,
0.4908203, 0.07691213, 1.676886, 0.1294118, 0, 1, 1,
0.4928404, -0.2547614, 1.581192, 0.1333333, 0, 1, 1,
0.4952239, -0.4474182, 3.273244, 0.1411765, 0, 1, 1,
0.4986346, 0.573548, 0.8269972, 0.145098, 0, 1, 1,
0.4994662, 0.5512074, -0.3590442, 0.1529412, 0, 1, 1,
0.5038903, -0.3915847, 2.280263, 0.1568628, 0, 1, 1,
0.5061926, 0.8400655, 0.01904912, 0.1647059, 0, 1, 1,
0.5107162, -0.3412198, 2.139723, 0.1686275, 0, 1, 1,
0.5132179, -1.676625, 2.218231, 0.1764706, 0, 1, 1,
0.5134242, 0.9778397, 0.7221709, 0.1803922, 0, 1, 1,
0.5155838, 0.2334735, 1.625741, 0.1882353, 0, 1, 1,
0.5158952, 0.2906357, 1.734759, 0.1921569, 0, 1, 1,
0.5170044, 1.713823, -1.314583, 0.2, 0, 1, 1,
0.5179033, 2.698917, -0.7250746, 0.2078431, 0, 1, 1,
0.5191863, -0.3859361, 2.64252, 0.2117647, 0, 1, 1,
0.5200766, 0.8507438, -0.7376143, 0.2196078, 0, 1, 1,
0.524308, -0.5833955, 2.789554, 0.2235294, 0, 1, 1,
0.528228, -1.732504, 4.42143, 0.2313726, 0, 1, 1,
0.5297738, -0.7598387, 2.510935, 0.2352941, 0, 1, 1,
0.5338914, -0.6226658, 2.871167, 0.2431373, 0, 1, 1,
0.5373737, -0.9428505, 3.528937, 0.2470588, 0, 1, 1,
0.540279, 1.14658, 0.9358082, 0.254902, 0, 1, 1,
0.5407901, 1.509425, 2.132916, 0.2588235, 0, 1, 1,
0.5529383, -1.181048, 3.365079, 0.2666667, 0, 1, 1,
0.5545999, 0.3234184, 0.7578121, 0.2705882, 0, 1, 1,
0.5554749, 1.659375, 1.681012, 0.2784314, 0, 1, 1,
0.5589839, -1.181582, 2.036859, 0.282353, 0, 1, 1,
0.560181, 1.220193, 0.8329089, 0.2901961, 0, 1, 1,
0.561103, 1.096696, 0.7732471, 0.2941177, 0, 1, 1,
0.5611801, -0.8416685, 1.64647, 0.3019608, 0, 1, 1,
0.563167, 0.7453828, 0.5595465, 0.3098039, 0, 1, 1,
0.5664287, 1.516066, -0.161787, 0.3137255, 0, 1, 1,
0.5669536, -0.7648103, 2.717468, 0.3215686, 0, 1, 1,
0.5678911, 0.596774, -0.5304766, 0.3254902, 0, 1, 1,
0.5742153, 2.196159, 0.2248596, 0.3333333, 0, 1, 1,
0.5748036, -2.035373, 4.872198, 0.3372549, 0, 1, 1,
0.5849728, 0.3240334, 1.591577, 0.345098, 0, 1, 1,
0.5945832, 0.8588535, -1.502287, 0.3490196, 0, 1, 1,
0.5976696, 1.20871, 0.1635268, 0.3568628, 0, 1, 1,
0.6042342, -0.8632009, 1.541916, 0.3607843, 0, 1, 1,
0.6094275, 0.05587582, 1.993166, 0.3686275, 0, 1, 1,
0.6143708, -0.2859129, -0.4119963, 0.372549, 0, 1, 1,
0.6145095, 0.02468941, 0.6059988, 0.3803922, 0, 1, 1,
0.6161889, 1.426176, 0.6973894, 0.3843137, 0, 1, 1,
0.6192775, 0.1626588, -0.09452765, 0.3921569, 0, 1, 1,
0.6220398, -1.689192, 3.751839, 0.3960784, 0, 1, 1,
0.6221365, -1.329262, 2.860511, 0.4039216, 0, 1, 1,
0.622797, -0.8208812, 1.97985, 0.4117647, 0, 1, 1,
0.6234256, 0.7557482, 0.5812647, 0.4156863, 0, 1, 1,
0.6263899, 0.6582583, 1.907706, 0.4235294, 0, 1, 1,
0.6278668, 0.5924889, 0.6802671, 0.427451, 0, 1, 1,
0.6297826, -0.5649785, 0.9277672, 0.4352941, 0, 1, 1,
0.6312217, -1.085683, 2.505051, 0.4392157, 0, 1, 1,
0.6319603, 1.014193, 1.734856, 0.4470588, 0, 1, 1,
0.6336138, -0.8666842, 2.309523, 0.4509804, 0, 1, 1,
0.6357586, 0.2268349, 2.683907, 0.4588235, 0, 1, 1,
0.6370669, 1.041307, 0.0925364, 0.4627451, 0, 1, 1,
0.6380817, -0.3743011, 3.455082, 0.4705882, 0, 1, 1,
0.6401361, -0.6421033, 1.58991, 0.4745098, 0, 1, 1,
0.6424828, 0.7290459, 0.1206734, 0.4823529, 0, 1, 1,
0.6532798, 0.08999451, 1.548729, 0.4862745, 0, 1, 1,
0.6575433, -2.282774, 3.372957, 0.4941176, 0, 1, 1,
0.657861, -0.06260394, 0.5425015, 0.5019608, 0, 1, 1,
0.6628979, 0.8594989, 0.6474144, 0.5058824, 0, 1, 1,
0.6669005, -0.4207814, 2.163965, 0.5137255, 0, 1, 1,
0.6673985, 0.448321, 0.4984249, 0.5176471, 0, 1, 1,
0.6699458, 0.2725048, 2.578002, 0.5254902, 0, 1, 1,
0.6741692, -0.2099908, 2.96853, 0.5294118, 0, 1, 1,
0.6745617, 0.9799402, -0.9551484, 0.5372549, 0, 1, 1,
0.6758186, -1.730155, 0.8058824, 0.5411765, 0, 1, 1,
0.6784136, 0.7403064, 0.3228589, 0.5490196, 0, 1, 1,
0.6787919, -0.0782956, 1.85689, 0.5529412, 0, 1, 1,
0.6793953, -1.535669, 4.312649, 0.5607843, 0, 1, 1,
0.6806312, -0.04805588, 0.9965746, 0.5647059, 0, 1, 1,
0.6917058, -1.507346, 4.779871, 0.572549, 0, 1, 1,
0.6956914, 0.3208342, 0.1852942, 0.5764706, 0, 1, 1,
0.6989353, 1.279012, 1.110008, 0.5843138, 0, 1, 1,
0.701512, 1.301945, -0.499303, 0.5882353, 0, 1, 1,
0.7031393, -0.8758211, 4.436848, 0.5960785, 0, 1, 1,
0.7037825, 0.5707655, -0.4766816, 0.6039216, 0, 1, 1,
0.7038782, 1.858045, 0.9308767, 0.6078432, 0, 1, 1,
0.7053193, -0.9000158, 2.444117, 0.6156863, 0, 1, 1,
0.7157419, 0.2298212, 1.921706, 0.6196079, 0, 1, 1,
0.721566, 0.2968041, 0.02801268, 0.627451, 0, 1, 1,
0.7243035, -0.9227646, 1.85178, 0.6313726, 0, 1, 1,
0.7259188, 0.4456529, 0.99685, 0.6392157, 0, 1, 1,
0.7305428, 1.224761, -0.9380708, 0.6431373, 0, 1, 1,
0.7309642, -1.150201, 3.524803, 0.6509804, 0, 1, 1,
0.7333381, 0.6125448, -0.6552375, 0.654902, 0, 1, 1,
0.7342993, 0.6089139, 1.428545, 0.6627451, 0, 1, 1,
0.7458381, 0.2609759, 1.73442, 0.6666667, 0, 1, 1,
0.75104, 0.1207994, 2.226763, 0.6745098, 0, 1, 1,
0.7514589, -1.508306, 2.600787, 0.6784314, 0, 1, 1,
0.7549352, 0.6783107, 1.118831, 0.6862745, 0, 1, 1,
0.7566563, -1.078599, 1.50509, 0.6901961, 0, 1, 1,
0.7579426, 0.1759745, 1.736901, 0.6980392, 0, 1, 1,
0.7593601, 0.5841998, -0.2413577, 0.7058824, 0, 1, 1,
0.7606565, -1.489396, 3.362234, 0.7098039, 0, 1, 1,
0.7728962, -0.9717209, 4.098185, 0.7176471, 0, 1, 1,
0.7792519, 0.2014235, 1.28747, 0.7215686, 0, 1, 1,
0.7818054, 0.20939, -0.1479317, 0.7294118, 0, 1, 1,
0.7821966, -0.530701, 3.203196, 0.7333333, 0, 1, 1,
0.7861618, -0.02135189, 1.124295, 0.7411765, 0, 1, 1,
0.7864251, 1.095809, -0.5969391, 0.7450981, 0, 1, 1,
0.7864478, 0.8743947, 0.7235649, 0.7529412, 0, 1, 1,
0.7908187, 1.327007, 0.3205944, 0.7568628, 0, 1, 1,
0.7962091, -0.3254734, 1.16674, 0.7647059, 0, 1, 1,
0.7988942, -0.2362635, 3.018419, 0.7686275, 0, 1, 1,
0.7990087, 0.2757068, 1.453533, 0.7764706, 0, 1, 1,
0.8048844, 1.341307, -0.4483244, 0.7803922, 0, 1, 1,
0.8076383, -1.874963, 3.691096, 0.7882353, 0, 1, 1,
0.811505, 0.2819626, 1.225684, 0.7921569, 0, 1, 1,
0.819164, -2.36271, 2.31781, 0.8, 0, 1, 1,
0.8277761, 0.5987446, -0.4579666, 0.8078431, 0, 1, 1,
0.834268, 1.010659, 0.9936157, 0.8117647, 0, 1, 1,
0.8361323, -0.569149, 0.1856841, 0.8196079, 0, 1, 1,
0.8369773, -0.07640302, 0.9045767, 0.8235294, 0, 1, 1,
0.8375212, 0.4901353, -0.3829058, 0.8313726, 0, 1, 1,
0.8391088, 0.9242507, -0.03400841, 0.8352941, 0, 1, 1,
0.8433194, 0.4291397, 2.288784, 0.8431373, 0, 1, 1,
0.8453079, -0.9515811, 4.171842, 0.8470588, 0, 1, 1,
0.8465971, 1.324628, -1.868651, 0.854902, 0, 1, 1,
0.8475229, -0.8186218, 3.742104, 0.8588235, 0, 1, 1,
0.8475422, 0.2047447, 2.178155, 0.8666667, 0, 1, 1,
0.8477307, 0.6327298, 2.004165, 0.8705882, 0, 1, 1,
0.8488917, 1.252686, -0.7583707, 0.8784314, 0, 1, 1,
0.8498178, 0.2847962, -0.8420293, 0.8823529, 0, 1, 1,
0.8523916, -0.2498703, 1.956064, 0.8901961, 0, 1, 1,
0.8573681, 1.18241, 1.430975, 0.8941177, 0, 1, 1,
0.860594, 0.532425, 2.153628, 0.9019608, 0, 1, 1,
0.8609336, -1.970158, 1.582937, 0.9098039, 0, 1, 1,
0.8646866, -0.3882921, 2.329123, 0.9137255, 0, 1, 1,
0.8656813, 0.366728, 3.257952, 0.9215686, 0, 1, 1,
0.8703145, -0.4735582, 1.314155, 0.9254902, 0, 1, 1,
0.8738786, -0.3519004, -0.03387333, 0.9333333, 0, 1, 1,
0.8797559, -0.4397385, 2.561345, 0.9372549, 0, 1, 1,
0.8816238, -0.9016436, 2.991198, 0.945098, 0, 1, 1,
0.8820496, 0.4001305, 1.007001, 0.9490196, 0, 1, 1,
0.8851098, -0.09079313, 2.122198, 0.9568627, 0, 1, 1,
0.8876325, -0.6981893, 2.474362, 0.9607843, 0, 1, 1,
0.890673, 0.08236498, 0.7086233, 0.9686275, 0, 1, 1,
0.8931903, 0.2691477, 1.773003, 0.972549, 0, 1, 1,
0.8942276, -0.2898923, 1.813441, 0.9803922, 0, 1, 1,
0.894679, 0.6119215, 2.143054, 0.9843137, 0, 1, 1,
0.9028786, 0.6031919, 0.7367482, 0.9921569, 0, 1, 1,
0.9032936, 0.5827301, -0.3914117, 0.9960784, 0, 1, 1,
0.9078489, 0.13467, 1.63777, 1, 0, 0.9960784, 1,
0.9102994, 0.6388457, 0.5979459, 1, 0, 0.9882353, 1,
0.9124559, -0.7715749, 3.219686, 1, 0, 0.9843137, 1,
0.9185233, 0.3418336, 2.171887, 1, 0, 0.9764706, 1,
0.9224465, -0.4017311, 2.697555, 1, 0, 0.972549, 1,
0.9255283, -0.3050274, 2.698117, 1, 0, 0.9647059, 1,
0.9272735, 0.5734801, 1.020914, 1, 0, 0.9607843, 1,
0.9289775, -0.546464, 2.010238, 1, 0, 0.9529412, 1,
0.9314198, -0.399248, 1.712439, 1, 0, 0.9490196, 1,
0.9337469, -0.5075843, 1.845369, 1, 0, 0.9411765, 1,
0.939994, -0.7051972, 2.426821, 1, 0, 0.9372549, 1,
0.9457796, 0.6554395, -0.3156016, 1, 0, 0.9294118, 1,
0.9562504, 0.7179059, -0.1650557, 1, 0, 0.9254902, 1,
0.9604897, 0.908388, -0.1539349, 1, 0, 0.9176471, 1,
0.9648069, -2.499975, 2.291307, 1, 0, 0.9137255, 1,
0.9667019, 0.4140084, -0.1679513, 1, 0, 0.9058824, 1,
0.9736605, 1.234508, 1.03284, 1, 0, 0.9019608, 1,
0.982306, 0.2644434, -0.8744365, 1, 0, 0.8941177, 1,
0.9858627, -0.5332587, 1.921788, 1, 0, 0.8862745, 1,
0.9886294, -0.867218, 2.441028, 1, 0, 0.8823529, 1,
0.9924524, -0.5377845, 2.551475, 1, 0, 0.8745098, 1,
0.9988006, 1.747569, 1.538174, 1, 0, 0.8705882, 1,
0.9988621, -0.6178352, 3.241122, 1, 0, 0.8627451, 1,
1.000505, 0.915908, -0.1184307, 1, 0, 0.8588235, 1,
1.001389, -2.17667, 2.546416, 1, 0, 0.8509804, 1,
1.003261, 0.5770147, 3.262461, 1, 0, 0.8470588, 1,
1.013216, 0.844336, -0.2174847, 1, 0, 0.8392157, 1,
1.020379, -0.216382, 2.530773, 1, 0, 0.8352941, 1,
1.021552, -0.8197747, 3.94361, 1, 0, 0.827451, 1,
1.025596, -0.7285289, 1.677857, 1, 0, 0.8235294, 1,
1.030256, 0.7345212, 2.217702, 1, 0, 0.8156863, 1,
1.031307, 0.3685423, 0.6661493, 1, 0, 0.8117647, 1,
1.031574, -1.101442, 1.931336, 1, 0, 0.8039216, 1,
1.033498, 0.1152747, 1.116566, 1, 0, 0.7960784, 1,
1.054581, 0.3896107, 1.048677, 1, 0, 0.7921569, 1,
1.057069, -0.7433328, 1.266226, 1, 0, 0.7843137, 1,
1.064653, 0.4936338, 0.1579195, 1, 0, 0.7803922, 1,
1.068799, 0.02190948, 1.341383, 1, 0, 0.772549, 1,
1.077328, -0.7803057, 0.1991586, 1, 0, 0.7686275, 1,
1.078413, -0.6275223, 2.471841, 1, 0, 0.7607843, 1,
1.082267, -1.107206, 0.9817215, 1, 0, 0.7568628, 1,
1.083281, -1.2731, 1.416562, 1, 0, 0.7490196, 1,
1.083491, -0.09159851, 2.534041, 1, 0, 0.7450981, 1,
1.094669, -0.447966, -0.6244457, 1, 0, 0.7372549, 1,
1.096602, 0.5425662, 0.4257889, 1, 0, 0.7333333, 1,
1.10451, 0.3074743, -0.2697494, 1, 0, 0.7254902, 1,
1.110567, -0.4272259, 2.450084, 1, 0, 0.7215686, 1,
1.11377, 0.03925469, 2.48814, 1, 0, 0.7137255, 1,
1.127567, -0.0263169, 1.6177, 1, 0, 0.7098039, 1,
1.12844, 0.009236256, 2.884499, 1, 0, 0.7019608, 1,
1.133354, 0.2195601, 0.9858889, 1, 0, 0.6941177, 1,
1.133468, -0.2524051, 0.6223339, 1, 0, 0.6901961, 1,
1.139763, -0.2267031, 2.596956, 1, 0, 0.682353, 1,
1.150179, -1.187595, 2.126345, 1, 0, 0.6784314, 1,
1.155219, 0.9550069, 1.482152, 1, 0, 0.6705883, 1,
1.171544, 1.400431, -0.43178, 1, 0, 0.6666667, 1,
1.195948, 0.01255998, 2.683694, 1, 0, 0.6588235, 1,
1.199316, 0.2197003, 2.11725, 1, 0, 0.654902, 1,
1.200057, 0.7201648, 0.8830203, 1, 0, 0.6470588, 1,
1.200959, -0.5126079, 2.571735, 1, 0, 0.6431373, 1,
1.204602, -0.6641078, 1.802902, 1, 0, 0.6352941, 1,
1.206515, 0.501452, 1.906497, 1, 0, 0.6313726, 1,
1.213409, 0.4120491, 2.12787, 1, 0, 0.6235294, 1,
1.215984, 0.7923303, 0.9575037, 1, 0, 0.6196079, 1,
1.22076, -0.9138842, 1.475532, 1, 0, 0.6117647, 1,
1.225178, 0.4878291, 2.913919, 1, 0, 0.6078432, 1,
1.226018, 0.6786994, 0.4109323, 1, 0, 0.6, 1,
1.226178, 1.576083, -0.5913461, 1, 0, 0.5921569, 1,
1.231468, -0.04323346, 2.784613, 1, 0, 0.5882353, 1,
1.27111, 0.07641187, 0.2513589, 1, 0, 0.5803922, 1,
1.271587, -0.948007, 2.057661, 1, 0, 0.5764706, 1,
1.275105, -0.5184242, 3.008044, 1, 0, 0.5686275, 1,
1.281232, -0.08643933, 2.660033, 1, 0, 0.5647059, 1,
1.28561, -0.04823148, 2.148324, 1, 0, 0.5568628, 1,
1.290756, -0.9698609, 2.131752, 1, 0, 0.5529412, 1,
1.291027, 0.9416447, 1.998419, 1, 0, 0.5450981, 1,
1.291896, 0.1469015, -0.05670954, 1, 0, 0.5411765, 1,
1.318247, 0.6886547, -0.1505433, 1, 0, 0.5333334, 1,
1.331221, -0.2264995, 2.723904, 1, 0, 0.5294118, 1,
1.334102, 1.038115, 0.1811733, 1, 0, 0.5215687, 1,
1.33416, 0.3571786, 2.633032, 1, 0, 0.5176471, 1,
1.338107, 0.4983584, 2.004306, 1, 0, 0.509804, 1,
1.339507, -0.2458887, 1.426822, 1, 0, 0.5058824, 1,
1.340123, 0.5503298, -0.4653493, 1, 0, 0.4980392, 1,
1.347059, -0.1907708, 1.065613, 1, 0, 0.4901961, 1,
1.348798, 0.1287786, 1.418539, 1, 0, 0.4862745, 1,
1.349319, 1.06544, 0.7887828, 1, 0, 0.4784314, 1,
1.366694, 0.07467115, 2.757033, 1, 0, 0.4745098, 1,
1.371547, 0.455673, 1.474417, 1, 0, 0.4666667, 1,
1.375248, -0.2498845, 0.9041709, 1, 0, 0.4627451, 1,
1.379484, -0.918007, 0.8565674, 1, 0, 0.454902, 1,
1.393596, -1.345199, 0.9928164, 1, 0, 0.4509804, 1,
1.394959, 0.4690813, 1.234773, 1, 0, 0.4431373, 1,
1.40071, -0.621441, 2.470676, 1, 0, 0.4392157, 1,
1.42369, 0.4523063, 2.287005, 1, 0, 0.4313726, 1,
1.424207, 0.4812045, 0.2932042, 1, 0, 0.427451, 1,
1.431252, 0.523559, 0.9973665, 1, 0, 0.4196078, 1,
1.448331, 0.4232732, 3.187591, 1, 0, 0.4156863, 1,
1.453749, -1.025043, 1.933303, 1, 0, 0.4078431, 1,
1.483343, 0.5863721, 1.414464, 1, 0, 0.4039216, 1,
1.491146, 0.09822097, 0.5976356, 1, 0, 0.3960784, 1,
1.50227, -0.21502, 2.478634, 1, 0, 0.3882353, 1,
1.502613, -0.3249602, 0.2196563, 1, 0, 0.3843137, 1,
1.536597, 1.018651, 1.466516, 1, 0, 0.3764706, 1,
1.538465, 1.375001, 1.542723, 1, 0, 0.372549, 1,
1.543202, 1.684718, -0.8708062, 1, 0, 0.3647059, 1,
1.551398, -0.2829506, 3.257961, 1, 0, 0.3607843, 1,
1.56847, 0.6784241, 0.9223755, 1, 0, 0.3529412, 1,
1.571709, 1.017669, 0.9965071, 1, 0, 0.3490196, 1,
1.582928, 0.1515355, 1.929874, 1, 0, 0.3411765, 1,
1.584827, -0.1294477, -0.1429219, 1, 0, 0.3372549, 1,
1.589418, 1.064917, 1.412211, 1, 0, 0.3294118, 1,
1.607197, 0.2316214, 0.878702, 1, 0, 0.3254902, 1,
1.614335, 0.3581682, -0.1667162, 1, 0, 0.3176471, 1,
1.632077, -1.844527, 0.7398899, 1, 0, 0.3137255, 1,
1.638981, -0.5984736, 3.422933, 1, 0, 0.3058824, 1,
1.661122, -0.03584745, 1.482803, 1, 0, 0.2980392, 1,
1.670529, 0.2895537, 1.880992, 1, 0, 0.2941177, 1,
1.682813, 0.5122489, 3.824398, 1, 0, 0.2862745, 1,
1.683514, -0.348405, 2.002213, 1, 0, 0.282353, 1,
1.693631, -1.353373, 1.520042, 1, 0, 0.2745098, 1,
1.721702, -0.111001, 3.363124, 1, 0, 0.2705882, 1,
1.741217, 0.603356, 1.285941, 1, 0, 0.2627451, 1,
1.741317, -0.5601955, 1.265698, 1, 0, 0.2588235, 1,
1.748904, -1.00668, 0.6316204, 1, 0, 0.2509804, 1,
1.753278, -0.0839045, 1.852697, 1, 0, 0.2470588, 1,
1.763297, -0.5475382, 1.461996, 1, 0, 0.2392157, 1,
1.765918, 0.6907874, 0.5142021, 1, 0, 0.2352941, 1,
1.76879, 1.276387, 1.074735, 1, 0, 0.227451, 1,
1.781261, 2.062896, 1.557503, 1, 0, 0.2235294, 1,
1.791185, -0.5218992, 2.513073, 1, 0, 0.2156863, 1,
1.799776, 1.075003, 0.07486381, 1, 0, 0.2117647, 1,
1.801039, -0.05377959, 2.030474, 1, 0, 0.2039216, 1,
1.8275, -0.715376, 1.474559, 1, 0, 0.1960784, 1,
1.832468, -1.355749, 1.25697, 1, 0, 0.1921569, 1,
1.844414, -0.08517285, 3.738616, 1, 0, 0.1843137, 1,
1.865816, -0.2772035, 2.091585, 1, 0, 0.1803922, 1,
1.868765, -1.118743, 2.046366, 1, 0, 0.172549, 1,
1.877697, 0.4227743, -0.3636822, 1, 0, 0.1686275, 1,
1.91948, 0.2954696, 1.626355, 1, 0, 0.1607843, 1,
1.948891, -0.9706388, 1.03922, 1, 0, 0.1568628, 1,
1.952625, -1.329489, 3.625433, 1, 0, 0.1490196, 1,
1.959092, 1.64223, 1.420207, 1, 0, 0.145098, 1,
1.967805, 0.7842414, 2.233114, 1, 0, 0.1372549, 1,
1.993459, -0.5580351, 1.476669, 1, 0, 0.1333333, 1,
2.030722, 1.255338, 0.9680112, 1, 0, 0.1254902, 1,
2.031511, 0.07027276, 1.835346, 1, 0, 0.1215686, 1,
2.034434, 0.9933233, 0.7349448, 1, 0, 0.1137255, 1,
2.04881, -0.9701743, 0.8218131, 1, 0, 0.1098039, 1,
2.062315, -2.63932, 1.673279, 1, 0, 0.1019608, 1,
2.07005, -1.0855, 4.074047, 1, 0, 0.09411765, 1,
2.074282, 0.4555698, 3.608932, 1, 0, 0.09019608, 1,
2.132206, -0.6194841, 0.6410368, 1, 0, 0.08235294, 1,
2.148875, -1.660651, 2.029617, 1, 0, 0.07843138, 1,
2.172454, 1.648379, 0.3211631, 1, 0, 0.07058824, 1,
2.209553, -0.9787635, 2.526154, 1, 0, 0.06666667, 1,
2.304432, 0.8540252, 1.063643, 1, 0, 0.05882353, 1,
2.305115, -0.5124703, 2.242327, 1, 0, 0.05490196, 1,
2.316585, 0.1840107, 1.843182, 1, 0, 0.04705882, 1,
2.364622, 1.499383, 1.659949, 1, 0, 0.04313726, 1,
2.432771, -1.852824, 2.256471, 1, 0, 0.03529412, 1,
2.543252, 1.620893, 0.4405546, 1, 0, 0.03137255, 1,
2.588612, 0.9677756, 0.7046559, 1, 0, 0.02352941, 1,
2.837776, 0.5197623, 1.830143, 1, 0, 0.01960784, 1,
3.150079, -0.5615975, 1.934174, 1, 0, 0.01176471, 1,
3.31826, -0.4193611, 0.7826316, 1, 0, 0.007843138, 1
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
0.1791229, -4.20493, -6.768611, 0, -0.5, 0.5, 0.5,
0.1791229, -4.20493, -6.768611, 1, -0.5, 0.5, 0.5,
0.1791229, -4.20493, -6.768611, 1, 1.5, 0.5, 0.5,
0.1791229, -4.20493, -6.768611, 0, 1.5, 0.5, 0.5
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
-4.024181, 0.2219566, -6.768611, 0, -0.5, 0.5, 0.5,
-4.024181, 0.2219566, -6.768611, 1, -0.5, 0.5, 0.5,
-4.024181, 0.2219566, -6.768611, 1, 1.5, 0.5, 0.5,
-4.024181, 0.2219566, -6.768611, 0, 1.5, 0.5, 0.5
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
-4.024181, -4.20493, -0.1046338, 0, -0.5, 0.5, 0.5,
-4.024181, -4.20493, -0.1046338, 1, -0.5, 0.5, 0.5,
-4.024181, -4.20493, -0.1046338, 1, 1.5, 0.5, 0.5,
-4.024181, -4.20493, -0.1046338, 0, 1.5, 0.5, 0.5
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
-2, -3.183341, -5.23077,
3, -3.183341, -5.23077,
-2, -3.183341, -5.23077,
-2, -3.353606, -5.487077,
-1, -3.183341, -5.23077,
-1, -3.353606, -5.487077,
0, -3.183341, -5.23077,
0, -3.353606, -5.487077,
1, -3.183341, -5.23077,
1, -3.353606, -5.487077,
2, -3.183341, -5.23077,
2, -3.353606, -5.487077,
3, -3.183341, -5.23077,
3, -3.353606, -5.487077
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
-2, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
-2, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
-2, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
-2, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5,
-1, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
-1, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
-1, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
-1, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5,
0, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
0, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
0, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
0, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5,
1, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
1, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
1, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
1, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5,
2, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
2, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
2, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
2, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5,
3, -3.694136, -5.999691, 0, -0.5, 0.5, 0.5,
3, -3.694136, -5.999691, 1, -0.5, 0.5, 0.5,
3, -3.694136, -5.999691, 1, 1.5, 0.5, 0.5,
3, -3.694136, -5.999691, 0, 1.5, 0.5, 0.5
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
-3.054188, -3, -5.23077,
-3.054188, 3, -5.23077,
-3.054188, -3, -5.23077,
-3.215854, -3, -5.487077,
-3.054188, -2, -5.23077,
-3.215854, -2, -5.487077,
-3.054188, -1, -5.23077,
-3.215854, -1, -5.487077,
-3.054188, 0, -5.23077,
-3.215854, 0, -5.487077,
-3.054188, 1, -5.23077,
-3.215854, 1, -5.487077,
-3.054188, 2, -5.23077,
-3.215854, 2, -5.487077,
-3.054188, 3, -5.23077,
-3.215854, 3, -5.487077
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
-3.539185, -3, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, -3, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, -3, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, -3, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, -2, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, -2, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, -2, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, -2, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, -1, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, -1, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, -1, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, -1, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, 0, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, 0, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, 0, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, 0, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, 1, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, 1, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, 1, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, 1, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, 2, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, 2, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, 2, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, 2, -5.999691, 0, 1.5, 0.5, 0.5,
-3.539185, 3, -5.999691, 0, -0.5, 0.5, 0.5,
-3.539185, 3, -5.999691, 1, -0.5, 0.5, 0.5,
-3.539185, 3, -5.999691, 1, 1.5, 0.5, 0.5,
-3.539185, 3, -5.999691, 0, 1.5, 0.5, 0.5
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
-3.054188, -3.183341, -4,
-3.054188, -3.183341, 4,
-3.054188, -3.183341, -4,
-3.215854, -3.353606, -4,
-3.054188, -3.183341, -2,
-3.215854, -3.353606, -2,
-3.054188, -3.183341, 0,
-3.215854, -3.353606, 0,
-3.054188, -3.183341, 2,
-3.215854, -3.353606, 2,
-3.054188, -3.183341, 4,
-3.215854, -3.353606, 4
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
-3.539185, -3.694136, -4, 0, -0.5, 0.5, 0.5,
-3.539185, -3.694136, -4, 1, -0.5, 0.5, 0.5,
-3.539185, -3.694136, -4, 1, 1.5, 0.5, 0.5,
-3.539185, -3.694136, -4, 0, 1.5, 0.5, 0.5,
-3.539185, -3.694136, -2, 0, -0.5, 0.5, 0.5,
-3.539185, -3.694136, -2, 1, -0.5, 0.5, 0.5,
-3.539185, -3.694136, -2, 1, 1.5, 0.5, 0.5,
-3.539185, -3.694136, -2, 0, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 0, 0, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 0, 1, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 0, 1, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 0, 0, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 2, 0, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 2, 1, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 2, 1, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 2, 0, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 4, 0, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 4, 1, -0.5, 0.5, 0.5,
-3.539185, -3.694136, 4, 1, 1.5, 0.5, 0.5,
-3.539185, -3.694136, 4, 0, 1.5, 0.5, 0.5
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
-3.054188, -3.183341, -5.23077,
-3.054188, 3.627254, -5.23077,
-3.054188, -3.183341, 5.021502,
-3.054188, 3.627254, 5.021502,
-3.054188, -3.183341, -5.23077,
-3.054188, -3.183341, 5.021502,
-3.054188, 3.627254, -5.23077,
-3.054188, 3.627254, 5.021502,
-3.054188, -3.183341, -5.23077,
3.412434, -3.183341, -5.23077,
-3.054188, -3.183341, 5.021502,
3.412434, -3.183341, 5.021502,
-3.054188, 3.627254, -5.23077,
3.412434, 3.627254, -5.23077,
-3.054188, 3.627254, 5.021502,
3.412434, 3.627254, 5.021502,
3.412434, -3.183341, -5.23077,
3.412434, 3.627254, -5.23077,
3.412434, -3.183341, 5.021502,
3.412434, 3.627254, 5.021502,
3.412434, -3.183341, -5.23077,
3.412434, -3.183341, 5.021502,
3.412434, 3.627254, -5.23077,
3.412434, 3.627254, 5.021502
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
var radius = 7.42426;
var distance = 33.03137;
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
mvMatrix.translate( -0.1791229, -0.2219566, 0.1046338 );
mvMatrix.scale( 1.241337, 1.178642, 0.7829733 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03137);
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
Acetate<-read.table("Acetate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Acetate' not found
```

```r
y<-Acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Acetate' not found
```

```r
z<-Acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Acetate' not found
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
-2.960014, 0.1654637, 0.1030916, 0, 0, 1, 1, 1,
-2.666003, 0.2081595, 0.6154318, 1, 0, 0, 1, 1,
-2.636263, -1.805488, -2.061126, 1, 0, 0, 1, 1,
-2.41544, -2.301242, -3.077392, 1, 0, 0, 1, 1,
-2.374272, -0.3738188, -3.39811, 1, 0, 0, 1, 1,
-2.349263, -0.4137502, -2.51296, 1, 0, 0, 1, 1,
-2.330528, 0.03572154, -1.88038, 0, 0, 0, 1, 1,
-2.221691, -0.1387739, -2.054307, 0, 0, 0, 1, 1,
-2.181732, 0.1349175, -1.428714, 0, 0, 0, 1, 1,
-2.144494, 0.7707361, -0.6797765, 0, 0, 0, 1, 1,
-2.117364, 0.6522665, -0.7175826, 0, 0, 0, 1, 1,
-2.109684, 0.2065704, -1.380957, 0, 0, 0, 1, 1,
-2.087945, 1.959808, -1.534388, 0, 0, 0, 1, 1,
-2.087029, -0.6865504, -0.3563183, 1, 1, 1, 1, 1,
-2.083514, 0.8352594, -0.5400268, 1, 1, 1, 1, 1,
-2.080092, 0.7216888, -0.5657363, 1, 1, 1, 1, 1,
-2.072647, 1.02052, -1.452051, 1, 1, 1, 1, 1,
-2.001795, 0.4322825, -2.132215, 1, 1, 1, 1, 1,
-1.999448, -1.067825, -2.0743, 1, 1, 1, 1, 1,
-1.995706, 0.7704859, 0.9875904, 1, 1, 1, 1, 1,
-1.985383, -0.1085824, -0.4049524, 1, 1, 1, 1, 1,
-1.982345, 1.706843, -0.9440917, 1, 1, 1, 1, 1,
-1.944138, 0.7681521, -0.5618201, 1, 1, 1, 1, 1,
-1.938381, -1.312631, -3.094655, 1, 1, 1, 1, 1,
-1.876766, 0.6073615, -2.301741, 1, 1, 1, 1, 1,
-1.865638, 1.441784, -0.06941409, 1, 1, 1, 1, 1,
-1.86443, -0.4929295, -3.776968, 1, 1, 1, 1, 1,
-1.855111, -0.1924736, -2.658846, 1, 1, 1, 1, 1,
-1.825795, 0.8650049, -1.538158, 0, 0, 1, 1, 1,
-1.825262, 1.358735, -1.967682, 1, 0, 0, 1, 1,
-1.81441, 0.8673269, -1.299881, 1, 0, 0, 1, 1,
-1.808849, 0.3957195, -2.160763, 1, 0, 0, 1, 1,
-1.797266, -1.018113, -1.095841, 1, 0, 0, 1, 1,
-1.791391, -0.6044405, -3.882186, 1, 0, 0, 1, 1,
-1.772228, -1.120792, -1.925955, 0, 0, 0, 1, 1,
-1.769296, 0.1776873, -1.824237, 0, 0, 0, 1, 1,
-1.764171, 1.562584, -1.121512, 0, 0, 0, 1, 1,
-1.761566, -0.09778023, -1.438812, 0, 0, 0, 1, 1,
-1.749436, 0.310793, -0.8087216, 0, 0, 0, 1, 1,
-1.74138, -0.5564685, -1.956903, 0, 0, 0, 1, 1,
-1.733297, -0.4455921, -1.172683, 0, 0, 0, 1, 1,
-1.729762, -0.5813124, -2.297532, 1, 1, 1, 1, 1,
-1.72078, 0.3006526, 0.2578289, 1, 1, 1, 1, 1,
-1.69551, 0.9465805, -0.700438, 1, 1, 1, 1, 1,
-1.688719, 0.4809405, 0.2459944, 1, 1, 1, 1, 1,
-1.68784, -0.3631786, -1.016433, 1, 1, 1, 1, 1,
-1.685273, -0.922282, -2.744415, 1, 1, 1, 1, 1,
-1.683184, 0.5529411, -0.8405663, 1, 1, 1, 1, 1,
-1.638296, -0.7490052, -0.9167956, 1, 1, 1, 1, 1,
-1.636277, -1.006529, -1.356727, 1, 1, 1, 1, 1,
-1.626586, -0.1250931, -2.318531, 1, 1, 1, 1, 1,
-1.606178, -0.7476296, -1.140515, 1, 1, 1, 1, 1,
-1.602371, 1.131558, -2.138456, 1, 1, 1, 1, 1,
-1.583222, -0.01392199, -2.445092, 1, 1, 1, 1, 1,
-1.567564, -1.390598, -1.27366, 1, 1, 1, 1, 1,
-1.559923, -0.2184892, 0.1303824, 1, 1, 1, 1, 1,
-1.558596, -1.685307, -1.213442, 0, 0, 1, 1, 1,
-1.546303, -0.003321012, -2.127962, 1, 0, 0, 1, 1,
-1.546016, 1.116244, -0.2546257, 1, 0, 0, 1, 1,
-1.543445, 0.181222, -2.489479, 1, 0, 0, 1, 1,
-1.54161, -0.06624397, -2.415137, 1, 0, 0, 1, 1,
-1.531846, -0.4637006, -0.4901488, 1, 0, 0, 1, 1,
-1.520091, 0.6873308, -0.1570975, 0, 0, 0, 1, 1,
-1.505261, 1.180458, -0.7731021, 0, 0, 0, 1, 1,
-1.503283, -0.4506315, 0.125138, 0, 0, 0, 1, 1,
-1.49757, 0.1373331, -2.08733, 0, 0, 0, 1, 1,
-1.481204, -0.4961782, -2.366266, 0, 0, 0, 1, 1,
-1.465785, 0.9402266, 0.5570119, 0, 0, 0, 1, 1,
-1.449847, -0.6572995, -0.4438033, 0, 0, 0, 1, 1,
-1.448996, 0.0570831, -1.831328, 1, 1, 1, 1, 1,
-1.444051, -0.8442875, -1.562723, 1, 1, 1, 1, 1,
-1.442715, -1.470509, -1.649796, 1, 1, 1, 1, 1,
-1.441435, 0.9648743, -1.544374, 1, 1, 1, 1, 1,
-1.439322, 0.18917, -1.843507, 1, 1, 1, 1, 1,
-1.435816, 0.8254296, 0.07395732, 1, 1, 1, 1, 1,
-1.425289, 0.8413012, -1.191598, 1, 1, 1, 1, 1,
-1.419863, -0.4811147, -3.288518, 1, 1, 1, 1, 1,
-1.40576, -0.152277, -2.95705, 1, 1, 1, 1, 1,
-1.39886, -0.3455934, -2.10618, 1, 1, 1, 1, 1,
-1.398684, 1.643028, -0.635958, 1, 1, 1, 1, 1,
-1.388755, -0.6524293, -2.247404, 1, 1, 1, 1, 1,
-1.378314, -0.7764323, -3.750132, 1, 1, 1, 1, 1,
-1.366841, 0.6463176, -1.772366, 1, 1, 1, 1, 1,
-1.365615, -1.595954, -3.163618, 1, 1, 1, 1, 1,
-1.364868, 0.6423778, -2.235986, 0, 0, 1, 1, 1,
-1.354018, -1.243111, -3.189474, 1, 0, 0, 1, 1,
-1.352611, -0.4458089, -2.546245, 1, 0, 0, 1, 1,
-1.338689, 0.5532725, 0.9302332, 1, 0, 0, 1, 1,
-1.335449, -0.3382942, -1.52212, 1, 0, 0, 1, 1,
-1.335347, -0.1642596, -1.576056, 1, 0, 0, 1, 1,
-1.33065, -0.94998, -1.724134, 0, 0, 0, 1, 1,
-1.328155, 0.6625993, 0.2908982, 0, 0, 0, 1, 1,
-1.327269, 0.7439616, -1.283143, 0, 0, 0, 1, 1,
-1.326936, -0.4670119, -2.09372, 0, 0, 0, 1, 1,
-1.322457, -0.3132654, -2.224484, 0, 0, 0, 1, 1,
-1.298233, -0.176262, -2.491299, 0, 0, 0, 1, 1,
-1.298121, -0.7120431, -2.690217, 0, 0, 0, 1, 1,
-1.292541, -0.09102669, -0.1274494, 1, 1, 1, 1, 1,
-1.289369, -1.566074, -2.948796, 1, 1, 1, 1, 1,
-1.286366, -1.512926, -1.465647, 1, 1, 1, 1, 1,
-1.281242, 0.1655164, -1.901326, 1, 1, 1, 1, 1,
-1.259789, -0.4105043, -0.8306232, 1, 1, 1, 1, 1,
-1.252463, -2.358022, -4.064351, 1, 1, 1, 1, 1,
-1.247596, 1.158648, -0.8864096, 1, 1, 1, 1, 1,
-1.246685, -0.05112267, -1.197153, 1, 1, 1, 1, 1,
-1.224304, 1.036627, -0.8547735, 1, 1, 1, 1, 1,
-1.220909, -1.809363, -1.718876, 1, 1, 1, 1, 1,
-1.21691, -0.8604592, -2.245993, 1, 1, 1, 1, 1,
-1.216891, -0.3384924, -2.330923, 1, 1, 1, 1, 1,
-1.211339, -0.9542609, -0.3266878, 1, 1, 1, 1, 1,
-1.204798, -0.1689827, -1.193583, 1, 1, 1, 1, 1,
-1.20132, 0.5903841, -2.25338, 1, 1, 1, 1, 1,
-1.197803, 0.8558449, -1.637761, 0, 0, 1, 1, 1,
-1.186679, -2.571688, -3.606154, 1, 0, 0, 1, 1,
-1.183091, 0.2469153, -1.458445, 1, 0, 0, 1, 1,
-1.177482, -0.5223763, -3.47889, 1, 0, 0, 1, 1,
-1.175241, -0.9402429, -2.263537, 1, 0, 0, 1, 1,
-1.168282, 1.613927, 0.9888803, 1, 0, 0, 1, 1,
-1.167605, -1.145599, -3.062007, 0, 0, 0, 1, 1,
-1.166152, 0.3837363, -2.668498, 0, 0, 0, 1, 1,
-1.165696, 0.5929138, -1.522036, 0, 0, 0, 1, 1,
-1.162375, 0.09895375, -0.7776718, 0, 0, 0, 1, 1,
-1.161639, 1.266301, -0.6021362, 0, 0, 0, 1, 1,
-1.158696, -0.1199326, -0.05324884, 0, 0, 0, 1, 1,
-1.157068, 0.5992898, -0.8796861, 0, 0, 0, 1, 1,
-1.151552, -1.321668, -4.19981, 1, 1, 1, 1, 1,
-1.148573, -2.166087, -3.042713, 1, 1, 1, 1, 1,
-1.14674, -0.7157314, -1.332204, 1, 1, 1, 1, 1,
-1.131476, 2.159555, -0.3616672, 1, 1, 1, 1, 1,
-1.130056, -0.439614, -0.9764658, 1, 1, 1, 1, 1,
-1.129147, 0.8223633, -1.483894, 1, 1, 1, 1, 1,
-1.127135, -0.9336968, -1.449318, 1, 1, 1, 1, 1,
-1.12698, -2.332565, -2.509632, 1, 1, 1, 1, 1,
-1.125662, 0.1317069, -0.673277, 1, 1, 1, 1, 1,
-1.121557, 0.5470172, -2.972204, 1, 1, 1, 1, 1,
-1.120939, -1.154991, -3.117754, 1, 1, 1, 1, 1,
-1.117911, 1.176926, -1.50049, 1, 1, 1, 1, 1,
-1.107263, -0.9019131, -1.183022, 1, 1, 1, 1, 1,
-1.103841, 1.384065, 0.1297221, 1, 1, 1, 1, 1,
-1.100111, 1.459508, -1.157498, 1, 1, 1, 1, 1,
-1.098209, 3.528071, 0.7191589, 0, 0, 1, 1, 1,
-1.097771, 1.035078, -0.9476056, 1, 0, 0, 1, 1,
-1.083757, -0.6343775, -1.436843, 1, 0, 0, 1, 1,
-1.082424, 0.248029, -0.1035113, 1, 0, 0, 1, 1,
-1.077865, -0.4044813, 0.9915484, 1, 0, 0, 1, 1,
-1.072735, 1.528184, -0.4261754, 1, 0, 0, 1, 1,
-1.070766, 1.245159, -1.057607, 0, 0, 0, 1, 1,
-1.069126, 1.737614, -1.420395, 0, 0, 0, 1, 1,
-1.060527, 1.710444, 0.7751538, 0, 0, 0, 1, 1,
-1.056682, -1.127364, -3.007652, 0, 0, 0, 1, 1,
-1.052656, 0.541376, -1.437141, 0, 0, 0, 1, 1,
-1.050411, 0.8145876, -0.6750989, 0, 0, 0, 1, 1,
-1.047932, 0.09052785, -0.8464806, 0, 0, 0, 1, 1,
-1.04768, 0.05332467, -1.682726, 1, 1, 1, 1, 1,
-1.044499, 0.174951, 1.242095, 1, 1, 1, 1, 1,
-1.043459, 0.2162109, -1.22737, 1, 1, 1, 1, 1,
-1.039393, -2.082024, -1.749248, 1, 1, 1, 1, 1,
-1.036823, 2.287321, -0.02010312, 1, 1, 1, 1, 1,
-1.027342, 1.977259, 0.5351841, 1, 1, 1, 1, 1,
-1.02416, 0.8288568, -0.009783676, 1, 1, 1, 1, 1,
-1.019195, 0.8820662, -1.763478, 1, 1, 1, 1, 1,
-1.014846, 2.066717, -0.1361196, 1, 1, 1, 1, 1,
-1.00751, -1.625586, -2.410753, 1, 1, 1, 1, 1,
-1.002318, -0.3465681, -2.578736, 1, 1, 1, 1, 1,
-0.9949839, 1.038713, -0.3743652, 1, 1, 1, 1, 1,
-0.9820353, 0.5547159, -0.5158455, 1, 1, 1, 1, 1,
-0.975875, 0.3518043, -1.726971, 1, 1, 1, 1, 1,
-0.9751773, 1.411236, 0.1506019, 1, 1, 1, 1, 1,
-0.9750564, 1.51821, -1.257392, 0, 0, 1, 1, 1,
-0.973583, -0.01409213, -3.171146, 1, 0, 0, 1, 1,
-0.9731565, -0.1614281, -2.473345, 1, 0, 0, 1, 1,
-0.9698388, -0.5153325, -0.8835836, 1, 0, 0, 1, 1,
-0.966256, 0.7050793, 0.4774756, 1, 0, 0, 1, 1,
-0.9638395, -1.980084, -2.697847, 1, 0, 0, 1, 1,
-0.9600454, 0.2287639, -2.433783, 0, 0, 0, 1, 1,
-0.9564357, -0.4529026, -1.873027, 0, 0, 0, 1, 1,
-0.9532073, 0.9504499, -1.399744, 0, 0, 0, 1, 1,
-0.9493387, 0.918376, -0.2225331, 0, 0, 0, 1, 1,
-0.9474726, -0.4902686, -3.397395, 0, 0, 0, 1, 1,
-0.9416088, 0.3399984, -1.515977, 0, 0, 0, 1, 1,
-0.9416066, 0.8392013, -0.2120246, 0, 0, 0, 1, 1,
-0.9393443, -0.3679138, -2.114702, 1, 1, 1, 1, 1,
-0.937088, 0.6304415, -0.9523697, 1, 1, 1, 1, 1,
-0.9368378, 0.4558725, -2.004892, 1, 1, 1, 1, 1,
-0.9323347, 1.532032, -1.793797, 1, 1, 1, 1, 1,
-0.9269176, 0.5276671, -1.102796, 1, 1, 1, 1, 1,
-0.9257075, -0.6436913, -2.492797, 1, 1, 1, 1, 1,
-0.9228176, 0.452367, 0.2127286, 1, 1, 1, 1, 1,
-0.917395, 0.4982657, -0.7599088, 1, 1, 1, 1, 1,
-0.9156905, 0.5935824, -2.427715, 1, 1, 1, 1, 1,
-0.9155806, 0.7134249, -0.4407445, 1, 1, 1, 1, 1,
-0.9103825, 0.1311835, -2.853414, 1, 1, 1, 1, 1,
-0.910013, 0.8207464, 0.1285276, 1, 1, 1, 1, 1,
-0.9038332, 0.3289843, -1.474646, 1, 1, 1, 1, 1,
-0.899598, 0.7723237, -1.669217, 1, 1, 1, 1, 1,
-0.8994436, 1.435959, -0.2574079, 1, 1, 1, 1, 1,
-0.8961008, 0.02497105, -1.80661, 0, 0, 1, 1, 1,
-0.8957224, 0.7757939, -1.198419, 1, 0, 0, 1, 1,
-0.8909007, 0.6313682, -1.631713, 1, 0, 0, 1, 1,
-0.8752478, 0.8422304, 0.4193376, 1, 0, 0, 1, 1,
-0.8733634, -0.8051916, -2.750371, 1, 0, 0, 1, 1,
-0.8719112, -0.2671881, -2.854922, 1, 0, 0, 1, 1,
-0.864531, -0.2454065, -5.081465, 0, 0, 0, 1, 1,
-0.8636556, -1.100944, -1.903011, 0, 0, 0, 1, 1,
-0.8632396, 0.1679535, -1.314889, 0, 0, 0, 1, 1,
-0.8600532, 1.692027, -0.2939685, 0, 0, 0, 1, 1,
-0.8529158, 1.776732, -1.848886, 0, 0, 0, 1, 1,
-0.8437249, -0.5367522, -0.6693978, 0, 0, 0, 1, 1,
-0.8410325, 1.723797, -1.20425, 0, 0, 0, 1, 1,
-0.8354162, -0.3549114, -0.7969239, 1, 1, 1, 1, 1,
-0.8336259, -0.3180738, -3.373906, 1, 1, 1, 1, 1,
-0.8274552, 0.2031871, -0.6202785, 1, 1, 1, 1, 1,
-0.8259226, -0.4645168, -2.575963, 1, 1, 1, 1, 1,
-0.8259052, -1.349991, -1.587739, 1, 1, 1, 1, 1,
-0.8210537, 0.355287, -0.5321583, 1, 1, 1, 1, 1,
-0.8202389, 0.772083, -0.7707687, 1, 1, 1, 1, 1,
-0.8202354, -2.315284, -2.343435, 1, 1, 1, 1, 1,
-0.8155836, -0.05911595, -0.9570651, 1, 1, 1, 1, 1,
-0.8126343, 0.07259917, -1.982394, 1, 1, 1, 1, 1,
-0.8114685, 2.388505, -0.5010353, 1, 1, 1, 1, 1,
-0.8100954, -1.067735, -0.4006322, 1, 1, 1, 1, 1,
-0.8080391, 0.5310214, -0.429447, 1, 1, 1, 1, 1,
-0.805115, -0.05478441, -1.813917, 1, 1, 1, 1, 1,
-0.8019111, -0.09040382, -1.346637, 1, 1, 1, 1, 1,
-0.7978482, 1.299503, -0.6175941, 0, 0, 1, 1, 1,
-0.7900659, 0.5441446, -0.3373649, 1, 0, 0, 1, 1,
-0.7886204, 0.2770348, -0.7988212, 1, 0, 0, 1, 1,
-0.7834752, -0.2443882, -3.129559, 1, 0, 0, 1, 1,
-0.7805204, 1.695092, -1.922267, 1, 0, 0, 1, 1,
-0.7749835, 0.6331051, -0.1556552, 1, 0, 0, 1, 1,
-0.7729115, -0.5069775, -3.34358, 0, 0, 0, 1, 1,
-0.7693797, -0.6338661, -2.813491, 0, 0, 0, 1, 1,
-0.7642323, 0.6515507, -1.331266, 0, 0, 0, 1, 1,
-0.7520021, -0.01138665, -0.5596281, 0, 0, 0, 1, 1,
-0.7494748, -0.4046705, -1.857598, 0, 0, 0, 1, 1,
-0.7482241, -0.8325099, -3.270212, 0, 0, 0, 1, 1,
-0.746742, -0.3887264, -1.998128, 0, 0, 0, 1, 1,
-0.7383875, 0.7677889, -2.340583, 1, 1, 1, 1, 1,
-0.7381532, -0.1513794, -4.053738, 1, 1, 1, 1, 1,
-0.7363405, 1.766657, -0.1623218, 1, 1, 1, 1, 1,
-0.735681, 1.484025, -1.44505, 1, 1, 1, 1, 1,
-0.7319998, -0.009260598, -2.220429, 1, 1, 1, 1, 1,
-0.7251778, 1.425192, -1.237092, 1, 1, 1, 1, 1,
-0.7222928, -1.834956, -3.743808, 1, 1, 1, 1, 1,
-0.7203124, 1.875134, -0.5983658, 1, 1, 1, 1, 1,
-0.7177071, 0.529497, -1.149028, 1, 1, 1, 1, 1,
-0.7120761, -0.5469496, -2.965645, 1, 1, 1, 1, 1,
-0.7100186, 0.8392912, -0.844269, 1, 1, 1, 1, 1,
-0.7047876, -0.05000282, -1.823976, 1, 1, 1, 1, 1,
-0.6916595, 0.9212379, 0.1239416, 1, 1, 1, 1, 1,
-0.6875564, 1.997313, -0.5677986, 1, 1, 1, 1, 1,
-0.6873835, -1.666127, -3.19707, 1, 1, 1, 1, 1,
-0.6739634, 0.1184432, -0.3689885, 0, 0, 1, 1, 1,
-0.667255, -0.8219681, -2.142416, 1, 0, 0, 1, 1,
-0.6629694, 0.5514106, -1.064328, 1, 0, 0, 1, 1,
-0.6571119, 1.283541, -0.2894642, 1, 0, 0, 1, 1,
-0.6564212, 1.189868, 1.474016, 1, 0, 0, 1, 1,
-0.6542068, 0.1945313, 1.528344, 1, 0, 0, 1, 1,
-0.6540781, -0.04452688, 0.2238112, 0, 0, 0, 1, 1,
-0.6519629, 0.8795894, 1.89316, 0, 0, 0, 1, 1,
-0.6429931, 0.2848772, -2.044607, 0, 0, 0, 1, 1,
-0.6424507, 2.448835, 0.149754, 0, 0, 0, 1, 1,
-0.6418673, 0.5844267, 0.3596004, 0, 0, 0, 1, 1,
-0.6330075, -2.178432, -2.854483, 0, 0, 0, 1, 1,
-0.6300055, -0.1840964, -2.528515, 0, 0, 0, 1, 1,
-0.6298344, -0.3546549, -2.517921, 1, 1, 1, 1, 1,
-0.6295155, 0.9324611, -0.4251466, 1, 1, 1, 1, 1,
-0.6256702, 1.291733, -1.278827, 1, 1, 1, 1, 1,
-0.6198834, 0.6646978, -1.273914, 1, 1, 1, 1, 1,
-0.6195469, 1.056745, -0.600729, 1, 1, 1, 1, 1,
-0.6130614, -1.720534, -2.35761, 1, 1, 1, 1, 1,
-0.6088937, 0.8668069, 2.104151, 1, 1, 1, 1, 1,
-0.6049992, 0.06382842, -2.639895, 1, 1, 1, 1, 1,
-0.6035864, 0.1476108, -2.337672, 1, 1, 1, 1, 1,
-0.6004419, 0.5641603, 0.7246774, 1, 1, 1, 1, 1,
-0.596112, -0.9425999, -2.244025, 1, 1, 1, 1, 1,
-0.5955549, 0.3078601, -0.2626503, 1, 1, 1, 1, 1,
-0.594419, 1.1043, -2.326627, 1, 1, 1, 1, 1,
-0.5929485, -0.9088418, -1.776344, 1, 1, 1, 1, 1,
-0.5928064, 1.461401, -0.5447688, 1, 1, 1, 1, 1,
-0.5921087, -0.318921, -2.481684, 0, 0, 1, 1, 1,
-0.5870131, 0.5374348, -1.076473, 1, 0, 0, 1, 1,
-0.5847932, 1.032496, 0.6326621, 1, 0, 0, 1, 1,
-0.5838271, 0.6556887, 0.8028736, 1, 0, 0, 1, 1,
-0.5831767, -1.106447, -4.002495, 1, 0, 0, 1, 1,
-0.5793237, -0.535752, -2.816222, 1, 0, 0, 1, 1,
-0.5788102, -1.199003, -2.601047, 0, 0, 0, 1, 1,
-0.5703795, -1.499066, -3.065243, 0, 0, 0, 1, 1,
-0.5674357, -2.98375, -4.318099, 0, 0, 0, 1, 1,
-0.5610716, 2.211971, -1.004927, 0, 0, 0, 1, 1,
-0.5593041, 1.008899, -0.7931284, 0, 0, 0, 1, 1,
-0.5575705, -1.639119, -3.301322, 0, 0, 0, 1, 1,
-0.5543162, 0.8524693, -0.329944, 0, 0, 0, 1, 1,
-0.5483522, -1.850801, -2.719553, 1, 1, 1, 1, 1,
-0.5374539, -0.1047899, -3.332857, 1, 1, 1, 1, 1,
-0.5361081, -0.7451692, -0.9500317, 1, 1, 1, 1, 1,
-0.5329919, -0.08127708, -0.8451855, 1, 1, 1, 1, 1,
-0.5260319, -0.4362117, -2.278339, 1, 1, 1, 1, 1,
-0.5258464, 0.6089505, 0.5503341, 1, 1, 1, 1, 1,
-0.5196971, 0.1848481, -0.5743833, 1, 1, 1, 1, 1,
-0.5165648, 0.3322867, -1.558995, 1, 1, 1, 1, 1,
-0.5138142, 0.7710379, -0.8711143, 1, 1, 1, 1, 1,
-0.5092658, 1.900557, 1.181946, 1, 1, 1, 1, 1,
-0.5057897, 0.5673772, 0.4102555, 1, 1, 1, 1, 1,
-0.5040597, 0.1657392, -0.6336325, 1, 1, 1, 1, 1,
-0.4927956, -0.9994922, -2.731143, 1, 1, 1, 1, 1,
-0.4901452, -0.3196171, -2.92752, 1, 1, 1, 1, 1,
-0.4876406, 0.68689, 0.9880655, 1, 1, 1, 1, 1,
-0.4875794, -0.6433784, -0.5509608, 0, 0, 1, 1, 1,
-0.4857917, 0.3186236, -0.4805969, 1, 0, 0, 1, 1,
-0.4855923, 0.3466255, -0.5699473, 1, 0, 0, 1, 1,
-0.4832589, 0.5064627, -1.474666, 1, 0, 0, 1, 1,
-0.478779, -1.021694, -0.3806252, 1, 0, 0, 1, 1,
-0.4744077, 0.2035308, -1.976635, 1, 0, 0, 1, 1,
-0.4723878, 0.5658061, 0.04176019, 0, 0, 0, 1, 1,
-0.469843, -0.935196, -1.490501, 0, 0, 0, 1, 1,
-0.4697533, 0.8834383, -1.190884, 0, 0, 0, 1, 1,
-0.4653559, -0.5189539, -1.984755, 0, 0, 0, 1, 1,
-0.461547, -0.3777576, -2.086272, 0, 0, 0, 1, 1,
-0.4574241, 0.7992561, -0.176944, 0, 0, 0, 1, 1,
-0.456251, -0.7372236, -2.473326, 0, 0, 0, 1, 1,
-0.4554196, -1.799662, -3.325989, 1, 1, 1, 1, 1,
-0.4528063, -0.9729092, -3.095432, 1, 1, 1, 1, 1,
-0.450901, 1.109476, -0.7078381, 1, 1, 1, 1, 1,
-0.4478508, 0.6464454, -0.7434202, 1, 1, 1, 1, 1,
-0.4436644, -0.0257266, -2.525671, 1, 1, 1, 1, 1,
-0.4426229, 0.7767174, -3.643918, 1, 1, 1, 1, 1,
-0.4410437, 1.564885, 0.005929154, 1, 1, 1, 1, 1,
-0.4408021, 0.4311614, -3.147081, 1, 1, 1, 1, 1,
-0.4397758, 0.284058, -1.704157, 1, 1, 1, 1, 1,
-0.4352282, -0.2813796, -3.18317, 1, 1, 1, 1, 1,
-0.4352059, 0.0180995, -2.242766, 1, 1, 1, 1, 1,
-0.4345998, -0.958778, -2.303092, 1, 1, 1, 1, 1,
-0.4291925, 2.153937, -0.5648566, 1, 1, 1, 1, 1,
-0.4193452, 0.6472489, 1.039372, 1, 1, 1, 1, 1,
-0.4191975, -0.7064078, -3.671366, 1, 1, 1, 1, 1,
-0.4181533, 0.4115599, 0.15301, 0, 0, 1, 1, 1,
-0.4169524, -1.213149, -3.164601, 1, 0, 0, 1, 1,
-0.4111924, 0.4294512, -0.6192833, 1, 0, 0, 1, 1,
-0.4058284, -0.02047472, -0.3134033, 1, 0, 0, 1, 1,
-0.4030391, 0.9307781, 0.2961536, 1, 0, 0, 1, 1,
-0.3982775, -0.602963, -3.026389, 1, 0, 0, 1, 1,
-0.3956092, -0.7335786, -1.667232, 0, 0, 0, 1, 1,
-0.3947639, 2.897253, -0.01652216, 0, 0, 0, 1, 1,
-0.3920132, -1.408711, -2.000763, 0, 0, 0, 1, 1,
-0.3916849, -1.040094, -3.101325, 0, 0, 0, 1, 1,
-0.3870249, 1.035672, 0.6438279, 0, 0, 0, 1, 1,
-0.3781027, -0.3171384, -3.126091, 0, 0, 0, 1, 1,
-0.3767034, 0.3137228, -1.956141, 0, 0, 0, 1, 1,
-0.3748086, -1.333823, -4.26811, 1, 1, 1, 1, 1,
-0.371494, -1.389398, -2.18491, 1, 1, 1, 1, 1,
-0.3669064, -0.7870515, -4.053284, 1, 1, 1, 1, 1,
-0.3662778, 0.4735881, -0.1993678, 1, 1, 1, 1, 1,
-0.3630496, 1.719178, 0.02392752, 1, 1, 1, 1, 1,
-0.362685, 0.9099932, -0.7438453, 1, 1, 1, 1, 1,
-0.3592541, -1.222241, -3.097373, 1, 1, 1, 1, 1,
-0.3584441, -0.9502144, -3.704768, 1, 1, 1, 1, 1,
-0.3534761, -0.7029401, -2.098851, 1, 1, 1, 1, 1,
-0.350947, -0.1180648, -2.342246, 1, 1, 1, 1, 1,
-0.3508783, 0.1179112, -0.2172276, 1, 1, 1, 1, 1,
-0.3473807, 0.4035943, -2.052732, 1, 1, 1, 1, 1,
-0.3464423, -0.414592, -2.547179, 1, 1, 1, 1, 1,
-0.3427395, -1.082353, -0.8371047, 1, 1, 1, 1, 1,
-0.3340255, 1.351822, 0.5701866, 1, 1, 1, 1, 1,
-0.3254432, 2.205072, -0.7278344, 0, 0, 1, 1, 1,
-0.3242896, -1.850644, -3.836365, 1, 0, 0, 1, 1,
-0.3235627, 1.280096, 0.6808396, 1, 0, 0, 1, 1,
-0.3200583, 0.7888241, -1.797223, 1, 0, 0, 1, 1,
-0.3135253, -0.3806245, -3.214, 1, 0, 0, 1, 1,
-0.3115639, 0.05539053, -2.29364, 1, 0, 0, 1, 1,
-0.3097229, 1.224262, -0.2888862, 0, 0, 0, 1, 1,
-0.3081918, 0.4218833, 0.255181, 0, 0, 0, 1, 1,
-0.3080167, 0.1858123, -1.507795, 0, 0, 0, 1, 1,
-0.3079825, 1.531277, -1.219167, 0, 0, 0, 1, 1,
-0.3058075, -1.180132, -2.652935, 0, 0, 0, 1, 1,
-0.3038854, 0.6327506, 0.5081429, 0, 0, 0, 1, 1,
-0.3009997, -2.236856, -3.930617, 0, 0, 0, 1, 1,
-0.3004012, 1.032479, 1.412861, 1, 1, 1, 1, 1,
-0.2986363, -0.09138359, -0.8010876, 1, 1, 1, 1, 1,
-0.2975287, 0.7628636, -0.718639, 1, 1, 1, 1, 1,
-0.2955282, -1.794487, -3.331979, 1, 1, 1, 1, 1,
-0.2934727, 0.5629765, -1.864525, 1, 1, 1, 1, 1,
-0.2931469, 0.4601139, 2.134463, 1, 1, 1, 1, 1,
-0.2902354, -1.639344, -2.967038, 1, 1, 1, 1, 1,
-0.2878004, -0.6300327, -3.58743, 1, 1, 1, 1, 1,
-0.2872688, 0.8016303, -0.494422, 1, 1, 1, 1, 1,
-0.2847993, -1.469444, -2.775376, 1, 1, 1, 1, 1,
-0.2819181, -0.9085967, -2.207992, 1, 1, 1, 1, 1,
-0.2816729, -0.4056487, -3.31614, 1, 1, 1, 1, 1,
-0.2791846, -1.134062, -1.963855, 1, 1, 1, 1, 1,
-0.2791046, 1.249478, -1.073389, 1, 1, 1, 1, 1,
-0.2728555, 0.03212704, 0.5016356, 1, 1, 1, 1, 1,
-0.2716227, -0.963149, -2.161789, 0, 0, 1, 1, 1,
-0.2702229, 0.3431219, -0.1837325, 1, 0, 0, 1, 1,
-0.2640481, -0.2290291, -3.458372, 1, 0, 0, 1, 1,
-0.2617194, -0.3371494, -3.572212, 1, 0, 0, 1, 1,
-0.2615957, 0.8797813, -1.057616, 1, 0, 0, 1, 1,
-0.2606685, 0.5299673, 0.6598494, 1, 0, 0, 1, 1,
-0.2570223, 0.2034799, 0.1517487, 0, 0, 0, 1, 1,
-0.2538435, 1.516802, 0.7684678, 0, 0, 0, 1, 1,
-0.2517671, 0.493604, 1.433387, 0, 0, 0, 1, 1,
-0.2494689, 1.396629, -0.4148133, 0, 0, 0, 1, 1,
-0.239554, 2.149854, 0.3248341, 0, 0, 0, 1, 1,
-0.2373778, 0.03236045, -1.783489, 0, 0, 0, 1, 1,
-0.2366511, 0.349258, -0.02856762, 0, 0, 0, 1, 1,
-0.232315, 1.455658, -1.498653, 1, 1, 1, 1, 1,
-0.2296717, -0.1302541, -2.192047, 1, 1, 1, 1, 1,
-0.2294059, -1.409411, -3.82275, 1, 1, 1, 1, 1,
-0.2275347, -0.854342, -3.726277, 1, 1, 1, 1, 1,
-0.2268279, -0.9594132, -3.71097, 1, 1, 1, 1, 1,
-0.2228622, 1.118138, -1.165688, 1, 1, 1, 1, 1,
-0.2215963, 1.389362, 0.2861332, 1, 1, 1, 1, 1,
-0.2184671, -0.7201229, -4.281024, 1, 1, 1, 1, 1,
-0.2169571, 0.7568697, -0.5684664, 1, 1, 1, 1, 1,
-0.216509, -0.9189767, -3.423309, 1, 1, 1, 1, 1,
-0.214084, 0.3088919, 0.9367008, 1, 1, 1, 1, 1,
-0.2139422, -1.238369, -1.94617, 1, 1, 1, 1, 1,
-0.2139389, -0.05085821, -2.159103, 1, 1, 1, 1, 1,
-0.2134712, 0.470963, -1.664275, 1, 1, 1, 1, 1,
-0.2111335, 1.03288, 2.423457, 1, 1, 1, 1, 1,
-0.2103777, -1.13783, -1.807674, 0, 0, 1, 1, 1,
-0.2102769, 0.8789729, 0.08083224, 1, 0, 0, 1, 1,
-0.2053862, -1.489253, -4.173255, 1, 0, 0, 1, 1,
-0.2017655, 0.678485, -0.7108876, 1, 0, 0, 1, 1,
-0.1997375, 0.1081702, -2.050716, 1, 0, 0, 1, 1,
-0.199207, 0.4222857, -0.7964056, 1, 0, 0, 1, 1,
-0.1963202, -0.09538739, -3.09946, 0, 0, 0, 1, 1,
-0.1938121, -0.2573657, -3.180431, 0, 0, 0, 1, 1,
-0.1923745, -0.4877938, -1.161886, 0, 0, 0, 1, 1,
-0.1882478, 0.06682003, -2.167693, 0, 0, 0, 1, 1,
-0.18483, -0.8571475, -4.119664, 0, 0, 0, 1, 1,
-0.1821065, -0.7551295, -4.207448, 0, 0, 0, 1, 1,
-0.1811042, 0.09670788, -0.5502355, 0, 0, 0, 1, 1,
-0.1806915, -0.9888135, -3.765218, 1, 1, 1, 1, 1,
-0.1790467, 0.690587, -0.4023478, 1, 1, 1, 1, 1,
-0.1777286, 0.6826194, -0.09129162, 1, 1, 1, 1, 1,
-0.1773504, -0.1033945, -1.234456, 1, 1, 1, 1, 1,
-0.174123, -0.1314178, -2.30311, 1, 1, 1, 1, 1,
-0.1705342, -1.625518, -2.838139, 1, 1, 1, 1, 1,
-0.1679263, -0.8668225, -2.903158, 1, 1, 1, 1, 1,
-0.1678346, 0.3748431, 0.8077158, 1, 1, 1, 1, 1,
-0.1671454, -0.6937412, -4.557981, 1, 1, 1, 1, 1,
-0.1666025, -0.05164809, -3.576506, 1, 1, 1, 1, 1,
-0.1646811, 1.340481, -0.8443172, 1, 1, 1, 1, 1,
-0.1596228, -0.850208, -2.14595, 1, 1, 1, 1, 1,
-0.153508, 0.3346633, 0.2592909, 1, 1, 1, 1, 1,
-0.1530745, 0.2557803, 0.3967745, 1, 1, 1, 1, 1,
-0.1504509, 0.1722027, -0.289095, 1, 1, 1, 1, 1,
-0.1504003, 0.156359, 0.1083137, 0, 0, 1, 1, 1,
-0.1479009, 0.6891607, -0.06627765, 1, 0, 0, 1, 1,
-0.1456155, 0.4405158, -0.1095263, 1, 0, 0, 1, 1,
-0.1429056, -1.291684, -3.50408, 1, 0, 0, 1, 1,
-0.1381911, 0.9238061, 0.4803416, 1, 0, 0, 1, 1,
-0.1346351, -1.502847, -1.92262, 1, 0, 0, 1, 1,
-0.133045, 0.408226, -0.6837999, 0, 0, 0, 1, 1,
-0.1325137, 0.3502938, 1.69545, 0, 0, 0, 1, 1,
-0.1321092, 0.7678121, -0.8905541, 0, 0, 0, 1, 1,
-0.1319199, -1.046681, -3.399194, 0, 0, 0, 1, 1,
-0.1277049, -2.054228, -2.142422, 0, 0, 0, 1, 1,
-0.1267572, 0.7696365, 0.5197429, 0, 0, 0, 1, 1,
-0.1242581, 1.341741, 0.4306774, 0, 0, 0, 1, 1,
-0.1222811, 1.024927, -0.9357032, 1, 1, 1, 1, 1,
-0.1211745, -1.17036, -2.738389, 1, 1, 1, 1, 1,
-0.1185434, 0.4313661, 0.2952179, 1, 1, 1, 1, 1,
-0.117312, 1.251076, -0.2514741, 1, 1, 1, 1, 1,
-0.1141601, 0.9444838, 1.381686, 1, 1, 1, 1, 1,
-0.1137113, -0.2929595, -3.94351, 1, 1, 1, 1, 1,
-0.112573, -0.3106704, -3.640712, 1, 1, 1, 1, 1,
-0.1103207, 2.569371, -0.1556651, 1, 1, 1, 1, 1,
-0.1079585, 0.5423949, 0.5165244, 1, 1, 1, 1, 1,
-0.1062462, -0.9837843, -2.624495, 1, 1, 1, 1, 1,
-0.1054478, 0.5209002, 1.559569, 1, 1, 1, 1, 1,
-0.1022437, -1.308982, -3.016186, 1, 1, 1, 1, 1,
-0.09795193, -0.6325231, -2.746133, 1, 1, 1, 1, 1,
-0.09383434, 0.6617618, 0.5150571, 1, 1, 1, 1, 1,
-0.08804769, -0.9907929, -3.411798, 1, 1, 1, 1, 1,
-0.087903, 0.7721484, -0.8995176, 0, 0, 1, 1, 1,
-0.08729611, 2.096229, 0.234403, 1, 0, 0, 1, 1,
-0.08681545, -0.7394397, -2.507865, 1, 0, 0, 1, 1,
-0.08609919, 1.02869, 0.1488062, 1, 0, 0, 1, 1,
-0.08320742, -0.4672373, -2.91485, 1, 0, 0, 1, 1,
-0.08127075, 0.9751288, -0.01551721, 1, 0, 0, 1, 1,
-0.0767776, -0.7303199, -1.491253, 0, 0, 0, 1, 1,
-0.06961676, -1.198362, -3.358421, 0, 0, 0, 1, 1,
-0.06586488, -0.2221146, -1.371015, 0, 0, 0, 1, 1,
-0.06580044, 0.1127379, -0.7019809, 0, 0, 0, 1, 1,
-0.0618011, -0.5721053, -2.338757, 0, 0, 0, 1, 1,
-0.05814512, 0.470383, -1.494256, 0, 0, 0, 1, 1,
-0.05585426, 0.2783913, -0.8927612, 0, 0, 0, 1, 1,
-0.05066136, 1.325373, 0.9432123, 1, 1, 1, 1, 1,
-0.05048247, 2.128264, 0.7003837, 1, 1, 1, 1, 1,
-0.04958536, -0.7543623, -1.93818, 1, 1, 1, 1, 1,
-0.04833828, -3.084158, -3.944583, 1, 1, 1, 1, 1,
-0.04830257, 1.331342, -0.5201185, 1, 1, 1, 1, 1,
-0.04654297, 0.07316664, -1.093833, 1, 1, 1, 1, 1,
-0.04553885, 0.05356224, 0.04081379, 1, 1, 1, 1, 1,
-0.04415013, 0.3848279, -0.4572949, 1, 1, 1, 1, 1,
-0.0429336, 0.9280122, 1.186757, 1, 1, 1, 1, 1,
-0.04009932, 0.01218822, -1.575733, 1, 1, 1, 1, 1,
-0.03941307, -0.7490034, -0.7958974, 1, 1, 1, 1, 1,
-0.03828213, 1.464256, 0.2285372, 1, 1, 1, 1, 1,
-0.0381341, -0.8057041, -2.845093, 1, 1, 1, 1, 1,
-0.03770199, -0.3020018, -3.451889, 1, 1, 1, 1, 1,
-0.03756567, -0.5998713, -3.392879, 1, 1, 1, 1, 1,
-0.03313899, -1.364401, -1.126717, 0, 0, 1, 1, 1,
-0.03307479, -0.6160083, -3.56844, 1, 0, 0, 1, 1,
-0.03139055, 0.5763421, 1.03666, 1, 0, 0, 1, 1,
-0.01901443, 1.078264, 0.8087458, 1, 0, 0, 1, 1,
-0.01822193, 1.435335, 1.063489, 1, 0, 0, 1, 1,
-0.01577116, 1.179832, -0.785315, 1, 0, 0, 1, 1,
-0.01441231, 0.04162411, -0.116574, 0, 0, 0, 1, 1,
-0.009234248, 1.250976, -0.3655597, 0, 0, 0, 1, 1,
-0.008280978, -2.211178, -4.517942, 0, 0, 0, 1, 1,
-0.00610585, 0.1032859, -0.4554774, 0, 0, 0, 1, 1,
-0.005024744, 1.476057, -0.01169565, 0, 0, 0, 1, 1,
-0.004430338, -1.308161, -3.318866, 0, 0, 0, 1, 1,
-0.002681912, 0.02608708, -2.234368, 0, 0, 0, 1, 1,
-0.001098973, 0.6595475, 0.6143895, 1, 1, 1, 1, 1,
0.005331332, -1.615305, 3.165453, 1, 1, 1, 1, 1,
0.009460093, 1.171723, 0.4273019, 1, 1, 1, 1, 1,
0.01100654, 0.5278235, 1.211522, 1, 1, 1, 1, 1,
0.01712357, 0.03901383, -0.2530505, 1, 1, 1, 1, 1,
0.01858086, -2.066629, 4.161181, 1, 1, 1, 1, 1,
0.02007442, -0.3571292, 1.802402, 1, 1, 1, 1, 1,
0.02294392, 2.005996, -1.827949, 1, 1, 1, 1, 1,
0.02296038, -2.230792, 4.29107, 1, 1, 1, 1, 1,
0.02361031, 1.242337, 0.8258982, 1, 1, 1, 1, 1,
0.03050257, 0.2103218, -0.8230126, 1, 1, 1, 1, 1,
0.03895024, 0.3577256, 1.284214, 1, 1, 1, 1, 1,
0.04003268, 0.8281344, -0.3593183, 1, 1, 1, 1, 1,
0.04075504, 0.2642889, 3.157152, 1, 1, 1, 1, 1,
0.04368507, 0.09441237, 1.766698, 1, 1, 1, 1, 1,
0.04666736, 0.2506971, 2.966792, 0, 0, 1, 1, 1,
0.04919547, 0.2292703, -2.547593, 1, 0, 0, 1, 1,
0.05896013, -0.7404304, 3.113273, 1, 0, 0, 1, 1,
0.05973577, -0.7688658, 3.731615, 1, 0, 0, 1, 1,
0.06221061, -1.375358, 2.926535, 1, 0, 0, 1, 1,
0.06411593, 1.099445, 0.2494847, 1, 0, 0, 1, 1,
0.06660391, 0.5166204, 0.5490891, 0, 0, 0, 1, 1,
0.06741546, 0.02953582, -0.6807687, 0, 0, 0, 1, 1,
0.07701945, 1.583762, 0.4618967, 0, 0, 0, 1, 1,
0.08147558, -0.09609173, 2.96286, 0, 0, 0, 1, 1,
0.08165471, -0.5589508, 2.031245, 0, 0, 0, 1, 1,
0.08882856, -0.5700324, 2.901185, 0, 0, 0, 1, 1,
0.09053287, 0.6250207, 0.08749669, 0, 0, 0, 1, 1,
0.09242007, 0.8622431, -0.5068536, 1, 1, 1, 1, 1,
0.09297206, -0.7572724, 3.838959, 1, 1, 1, 1, 1,
0.09589243, 0.8988078, 1.24449, 1, 1, 1, 1, 1,
0.09935053, 1.13853, -0.03850734, 1, 1, 1, 1, 1,
0.100981, -0.5424854, 3.866177, 1, 1, 1, 1, 1,
0.1022347, 0.1141248, 1.468098, 1, 1, 1, 1, 1,
0.1036762, 0.7945305, -0.0003493917, 1, 1, 1, 1, 1,
0.1112333, 1.979936, -0.5809317, 1, 1, 1, 1, 1,
0.1128173, 0.1468945, 1.526967, 1, 1, 1, 1, 1,
0.1129427, -0.275409, 4.227881, 1, 1, 1, 1, 1,
0.1146221, -0.5675265, 2.668058, 1, 1, 1, 1, 1,
0.1199708, 2.217584, -0.3301163, 1, 1, 1, 1, 1,
0.1203493, 1.443872, -0.1432219, 1, 1, 1, 1, 1,
0.1224234, -0.8643213, 1.354387, 1, 1, 1, 1, 1,
0.1252179, 0.1478914, 0.5955686, 1, 1, 1, 1, 1,
0.1338397, 0.2211752, 0.2932579, 0, 0, 1, 1, 1,
0.1376022, 1.070694, -0.01561926, 1, 0, 0, 1, 1,
0.1379529, -1.847849, 3.413455, 1, 0, 0, 1, 1,
0.1380385, -0.8359811, 4.580257, 1, 0, 0, 1, 1,
0.1430724, -1.404169, 3.580598, 1, 0, 0, 1, 1,
0.1437599, -0.7797865, 0.8660905, 1, 0, 0, 1, 1,
0.1455127, 0.4830611, 0.9782301, 0, 0, 0, 1, 1,
0.1457244, -1.33764, 1.528047, 0, 0, 0, 1, 1,
0.148704, 0.2137945, 0.1039322, 0, 0, 0, 1, 1,
0.1539043, 2.075399, 0.4455484, 0, 0, 0, 1, 1,
0.1558293, 0.207444, -0.5592192, 0, 0, 0, 1, 1,
0.1652258, 0.7977908, -0.1400966, 0, 0, 0, 1, 1,
0.1668669, -0.2921273, 2.64649, 0, 0, 0, 1, 1,
0.1701316, -1.999006, 2.967538, 1, 1, 1, 1, 1,
0.1706879, -0.8342191, 3.049303, 1, 1, 1, 1, 1,
0.1738139, 0.2455922, 3.188029, 1, 1, 1, 1, 1,
0.1746154, -1.433323, 2.598535, 1, 1, 1, 1, 1,
0.1746308, -0.8617038, 2.717534, 1, 1, 1, 1, 1,
0.1751672, -1.521445, 3.468875, 1, 1, 1, 1, 1,
0.1771201, -0.4102366, 2.212661, 1, 1, 1, 1, 1,
0.1836565, -2.022461, 4.845443, 1, 1, 1, 1, 1,
0.1884365, -1.360542, 2.72365, 1, 1, 1, 1, 1,
0.1902224, 1.141813, 0.1783047, 1, 1, 1, 1, 1,
0.1958593, 0.9379165, 0.2980751, 1, 1, 1, 1, 1,
0.196913, -0.08974575, 0.8164442, 1, 1, 1, 1, 1,
0.2012655, -0.318414, 1.573514, 1, 1, 1, 1, 1,
0.2052542, 0.9232676, -0.871055, 1, 1, 1, 1, 1,
0.2078912, 0.103836, 1.618012, 1, 1, 1, 1, 1,
0.2090874, -1.022914, 1.728103, 0, 0, 1, 1, 1,
0.2107394, 1.325058, 1.23867, 1, 0, 0, 1, 1,
0.2113685, -1.520806, 2.406086, 1, 0, 0, 1, 1,
0.2133387, 0.3463459, 0.1684444, 1, 0, 0, 1, 1,
0.2165032, -1.144833, 2.57962, 1, 0, 0, 1, 1,
0.2219334, -0.03076107, 2.951438, 1, 0, 0, 1, 1,
0.2273093, 0.8446657, 0.7377487, 0, 0, 0, 1, 1,
0.2273771, -0.9460411, 2.729624, 0, 0, 0, 1, 1,
0.2276171, 0.2724378, -0.9141648, 0, 0, 0, 1, 1,
0.2304089, -0.2993405, 1.074795, 0, 0, 0, 1, 1,
0.23294, -2.123544, 2.938596, 0, 0, 0, 1, 1,
0.2341181, -0.397607, 3.08668, 0, 0, 0, 1, 1,
0.2355776, 0.9546337, -0.8999962, 0, 0, 0, 1, 1,
0.2402314, -1.069958, 2.614223, 1, 1, 1, 1, 1,
0.2420438, -0.1951205, 2.17909, 1, 1, 1, 1, 1,
0.2463555, -1.388116, 4.420109, 1, 1, 1, 1, 1,
0.248895, -0.8701381, 1.864064, 1, 1, 1, 1, 1,
0.252909, 0.3803356, 1.10776, 1, 1, 1, 1, 1,
0.2571337, -0.2583774, 1.291671, 1, 1, 1, 1, 1,
0.2577568, 0.2323694, 2.055777, 1, 1, 1, 1, 1,
0.2607038, 0.2835405, 1.122654, 1, 1, 1, 1, 1,
0.2622155, -0.1812854, 1.444624, 1, 1, 1, 1, 1,
0.2638818, -0.1821512, 2.616603, 1, 1, 1, 1, 1,
0.2650138, 0.3163199, 1.674636, 1, 1, 1, 1, 1,
0.2663414, 0.3936687, -0.004457224, 1, 1, 1, 1, 1,
0.270851, -0.6220019, 4.517528, 1, 1, 1, 1, 1,
0.2710676, 0.7201244, 3.799748, 1, 1, 1, 1, 1,
0.2720487, -0.2337605, 3.404013, 1, 1, 1, 1, 1,
0.2744089, -0.529871, 2.178174, 0, 0, 1, 1, 1,
0.2780744, -1.169798, 3.978044, 1, 0, 0, 1, 1,
0.2811484, -0.7659918, 2.476587, 1, 0, 0, 1, 1,
0.2812724, 1.335157, 1.433935, 1, 0, 0, 1, 1,
0.2815974, -0.6209716, 2.628126, 1, 0, 0, 1, 1,
0.2833503, 0.7406207, 2.489714, 1, 0, 0, 1, 1,
0.286604, -0.3182848, 2.181205, 0, 0, 0, 1, 1,
0.2916384, 2.147859, -0.813365, 0, 0, 0, 1, 1,
0.2931919, 0.05139107, 2.696608, 0, 0, 0, 1, 1,
0.2938754, 1.013456, 0.7626507, 0, 0, 0, 1, 1,
0.2988804, -0.4777567, 2.383115, 0, 0, 0, 1, 1,
0.3018177, -1.682144, 2.475841, 0, 0, 0, 1, 1,
0.3032824, 0.1558608, 1.281438, 0, 0, 0, 1, 1,
0.3054098, -0.9964036, 2.444728, 1, 1, 1, 1, 1,
0.3075332, -0.8806837, 4.053483, 1, 1, 1, 1, 1,
0.3087115, -0.4362339, 2.792377, 1, 1, 1, 1, 1,
0.3101609, -0.3846781, 1.264096, 1, 1, 1, 1, 1,
0.3117346, 0.2061073, -0.387206, 1, 1, 1, 1, 1,
0.3211966, -1.411676, 4.685505, 1, 1, 1, 1, 1,
0.3222764, -1.621422, 2.004168, 1, 1, 1, 1, 1,
0.3241333, -0.9316083, 2.762485, 1, 1, 1, 1, 1,
0.3254361, -0.4102874, 3.119721, 1, 1, 1, 1, 1,
0.325898, -0.2410027, 2.126715, 1, 1, 1, 1, 1,
0.3294916, 2.802922, 0.5079327, 1, 1, 1, 1, 1,
0.3341353, -2.111342, 2.70872, 1, 1, 1, 1, 1,
0.3351753, 0.3792302, 0.5227532, 1, 1, 1, 1, 1,
0.3387784, -1.302722, 2.793928, 1, 1, 1, 1, 1,
0.3556105, 1.234334, 0.1807205, 1, 1, 1, 1, 1,
0.3564318, -1.103127, 4.035062, 0, 0, 1, 1, 1,
0.3595265, -2.194457, 3.646401, 1, 0, 0, 1, 1,
0.3625929, -1.279643, 2.484299, 1, 0, 0, 1, 1,
0.3655235, 0.2718033, -1.254568, 1, 0, 0, 1, 1,
0.3691024, -0.2430449, 1.182758, 1, 0, 0, 1, 1,
0.3721471, 1.148901, 2.596231, 1, 0, 0, 1, 1,
0.37541, 0.747645, 0.3113795, 0, 0, 0, 1, 1,
0.3756568, 0.3834812, -0.05164492, 0, 0, 0, 1, 1,
0.3757658, 0.2788464, 3.738465, 0, 0, 0, 1, 1,
0.3797991, -0.8440145, 2.557682, 0, 0, 0, 1, 1,
0.3805635, -0.2614321, 2.924156, 0, 0, 0, 1, 1,
0.3825944, 0.7825866, 0.137077, 0, 0, 0, 1, 1,
0.3883782, -0.2156886, 0.9716129, 0, 0, 0, 1, 1,
0.3900049, 0.6811655, 0.7016538, 1, 1, 1, 1, 1,
0.3929664, -0.129817, 1.130114, 1, 1, 1, 1, 1,
0.3967882, 0.8752024, 0.5614285, 1, 1, 1, 1, 1,
0.397562, 0.4344824, 0.6448188, 1, 1, 1, 1, 1,
0.4018672, 2.116709, -0.880309, 1, 1, 1, 1, 1,
0.4045991, 1.629503, 1.225626, 1, 1, 1, 1, 1,
0.4071328, -1.508504, 2.76031, 1, 1, 1, 1, 1,
0.4210049, -0.2346717, 2.912254, 1, 1, 1, 1, 1,
0.4226349, 0.4488909, 2.247862, 1, 1, 1, 1, 1,
0.4231325, 0.1236443, -0.2969979, 1, 1, 1, 1, 1,
0.4262804, 0.7820641, 1.101414, 1, 1, 1, 1, 1,
0.4300435, 0.3201315, 1.133492, 1, 1, 1, 1, 1,
0.4318147, 1.366264, 0.1278888, 1, 1, 1, 1, 1,
0.4342791, -0.8593249, 1.564003, 1, 1, 1, 1, 1,
0.4441862, 0.05166657, 1.356657, 1, 1, 1, 1, 1,
0.4464347, 0.5469161, 0.9000018, 0, 0, 1, 1, 1,
0.4483643, 0.1728615, 2.136367, 1, 0, 0, 1, 1,
0.4504119, -0.7534285, 3.518799, 1, 0, 0, 1, 1,
0.4524647, 1.272399, 0.5972658, 1, 0, 0, 1, 1,
0.4540846, 2.460809, 0.5949611, 1, 0, 0, 1, 1,
0.4577207, -0.9743961, 0.2915918, 1, 0, 0, 1, 1,
0.4594949, -1.315723, 3.685323, 0, 0, 0, 1, 1,
0.460042, 0.6381629, 0.6697639, 0, 0, 0, 1, 1,
0.4604484, 1.085186, 1.991835, 0, 0, 0, 1, 1,
0.4654589, -0.6012608, 0.917098, 0, 0, 0, 1, 1,
0.4694354, 1.067812, 0.9064092, 0, 0, 0, 1, 1,
0.4696041, 1.094134, 1.49264, 0, 0, 0, 1, 1,
0.4705232, -0.5661807, 2.178027, 0, 0, 0, 1, 1,
0.4797128, 0.8340409, -0.02693238, 1, 1, 1, 1, 1,
0.4882113, -0.844138, 3.492517, 1, 1, 1, 1, 1,
0.4899335, 0.5147746, 1.737364, 1, 1, 1, 1, 1,
0.4908203, 0.07691213, 1.676886, 1, 1, 1, 1, 1,
0.4928404, -0.2547614, 1.581192, 1, 1, 1, 1, 1,
0.4952239, -0.4474182, 3.273244, 1, 1, 1, 1, 1,
0.4986346, 0.573548, 0.8269972, 1, 1, 1, 1, 1,
0.4994662, 0.5512074, -0.3590442, 1, 1, 1, 1, 1,
0.5038903, -0.3915847, 2.280263, 1, 1, 1, 1, 1,
0.5061926, 0.8400655, 0.01904912, 1, 1, 1, 1, 1,
0.5107162, -0.3412198, 2.139723, 1, 1, 1, 1, 1,
0.5132179, -1.676625, 2.218231, 1, 1, 1, 1, 1,
0.5134242, 0.9778397, 0.7221709, 1, 1, 1, 1, 1,
0.5155838, 0.2334735, 1.625741, 1, 1, 1, 1, 1,
0.5158952, 0.2906357, 1.734759, 1, 1, 1, 1, 1,
0.5170044, 1.713823, -1.314583, 0, 0, 1, 1, 1,
0.5179033, 2.698917, -0.7250746, 1, 0, 0, 1, 1,
0.5191863, -0.3859361, 2.64252, 1, 0, 0, 1, 1,
0.5200766, 0.8507438, -0.7376143, 1, 0, 0, 1, 1,
0.524308, -0.5833955, 2.789554, 1, 0, 0, 1, 1,
0.528228, -1.732504, 4.42143, 1, 0, 0, 1, 1,
0.5297738, -0.7598387, 2.510935, 0, 0, 0, 1, 1,
0.5338914, -0.6226658, 2.871167, 0, 0, 0, 1, 1,
0.5373737, -0.9428505, 3.528937, 0, 0, 0, 1, 1,
0.540279, 1.14658, 0.9358082, 0, 0, 0, 1, 1,
0.5407901, 1.509425, 2.132916, 0, 0, 0, 1, 1,
0.5529383, -1.181048, 3.365079, 0, 0, 0, 1, 1,
0.5545999, 0.3234184, 0.7578121, 0, 0, 0, 1, 1,
0.5554749, 1.659375, 1.681012, 1, 1, 1, 1, 1,
0.5589839, -1.181582, 2.036859, 1, 1, 1, 1, 1,
0.560181, 1.220193, 0.8329089, 1, 1, 1, 1, 1,
0.561103, 1.096696, 0.7732471, 1, 1, 1, 1, 1,
0.5611801, -0.8416685, 1.64647, 1, 1, 1, 1, 1,
0.563167, 0.7453828, 0.5595465, 1, 1, 1, 1, 1,
0.5664287, 1.516066, -0.161787, 1, 1, 1, 1, 1,
0.5669536, -0.7648103, 2.717468, 1, 1, 1, 1, 1,
0.5678911, 0.596774, -0.5304766, 1, 1, 1, 1, 1,
0.5742153, 2.196159, 0.2248596, 1, 1, 1, 1, 1,
0.5748036, -2.035373, 4.872198, 1, 1, 1, 1, 1,
0.5849728, 0.3240334, 1.591577, 1, 1, 1, 1, 1,
0.5945832, 0.8588535, -1.502287, 1, 1, 1, 1, 1,
0.5976696, 1.20871, 0.1635268, 1, 1, 1, 1, 1,
0.6042342, -0.8632009, 1.541916, 1, 1, 1, 1, 1,
0.6094275, 0.05587582, 1.993166, 0, 0, 1, 1, 1,
0.6143708, -0.2859129, -0.4119963, 1, 0, 0, 1, 1,
0.6145095, 0.02468941, 0.6059988, 1, 0, 0, 1, 1,
0.6161889, 1.426176, 0.6973894, 1, 0, 0, 1, 1,
0.6192775, 0.1626588, -0.09452765, 1, 0, 0, 1, 1,
0.6220398, -1.689192, 3.751839, 1, 0, 0, 1, 1,
0.6221365, -1.329262, 2.860511, 0, 0, 0, 1, 1,
0.622797, -0.8208812, 1.97985, 0, 0, 0, 1, 1,
0.6234256, 0.7557482, 0.5812647, 0, 0, 0, 1, 1,
0.6263899, 0.6582583, 1.907706, 0, 0, 0, 1, 1,
0.6278668, 0.5924889, 0.6802671, 0, 0, 0, 1, 1,
0.6297826, -0.5649785, 0.9277672, 0, 0, 0, 1, 1,
0.6312217, -1.085683, 2.505051, 0, 0, 0, 1, 1,
0.6319603, 1.014193, 1.734856, 1, 1, 1, 1, 1,
0.6336138, -0.8666842, 2.309523, 1, 1, 1, 1, 1,
0.6357586, 0.2268349, 2.683907, 1, 1, 1, 1, 1,
0.6370669, 1.041307, 0.0925364, 1, 1, 1, 1, 1,
0.6380817, -0.3743011, 3.455082, 1, 1, 1, 1, 1,
0.6401361, -0.6421033, 1.58991, 1, 1, 1, 1, 1,
0.6424828, 0.7290459, 0.1206734, 1, 1, 1, 1, 1,
0.6532798, 0.08999451, 1.548729, 1, 1, 1, 1, 1,
0.6575433, -2.282774, 3.372957, 1, 1, 1, 1, 1,
0.657861, -0.06260394, 0.5425015, 1, 1, 1, 1, 1,
0.6628979, 0.8594989, 0.6474144, 1, 1, 1, 1, 1,
0.6669005, -0.4207814, 2.163965, 1, 1, 1, 1, 1,
0.6673985, 0.448321, 0.4984249, 1, 1, 1, 1, 1,
0.6699458, 0.2725048, 2.578002, 1, 1, 1, 1, 1,
0.6741692, -0.2099908, 2.96853, 1, 1, 1, 1, 1,
0.6745617, 0.9799402, -0.9551484, 0, 0, 1, 1, 1,
0.6758186, -1.730155, 0.8058824, 1, 0, 0, 1, 1,
0.6784136, 0.7403064, 0.3228589, 1, 0, 0, 1, 1,
0.6787919, -0.0782956, 1.85689, 1, 0, 0, 1, 1,
0.6793953, -1.535669, 4.312649, 1, 0, 0, 1, 1,
0.6806312, -0.04805588, 0.9965746, 1, 0, 0, 1, 1,
0.6917058, -1.507346, 4.779871, 0, 0, 0, 1, 1,
0.6956914, 0.3208342, 0.1852942, 0, 0, 0, 1, 1,
0.6989353, 1.279012, 1.110008, 0, 0, 0, 1, 1,
0.701512, 1.301945, -0.499303, 0, 0, 0, 1, 1,
0.7031393, -0.8758211, 4.436848, 0, 0, 0, 1, 1,
0.7037825, 0.5707655, -0.4766816, 0, 0, 0, 1, 1,
0.7038782, 1.858045, 0.9308767, 0, 0, 0, 1, 1,
0.7053193, -0.9000158, 2.444117, 1, 1, 1, 1, 1,
0.7157419, 0.2298212, 1.921706, 1, 1, 1, 1, 1,
0.721566, 0.2968041, 0.02801268, 1, 1, 1, 1, 1,
0.7243035, -0.9227646, 1.85178, 1, 1, 1, 1, 1,
0.7259188, 0.4456529, 0.99685, 1, 1, 1, 1, 1,
0.7305428, 1.224761, -0.9380708, 1, 1, 1, 1, 1,
0.7309642, -1.150201, 3.524803, 1, 1, 1, 1, 1,
0.7333381, 0.6125448, -0.6552375, 1, 1, 1, 1, 1,
0.7342993, 0.6089139, 1.428545, 1, 1, 1, 1, 1,
0.7458381, 0.2609759, 1.73442, 1, 1, 1, 1, 1,
0.75104, 0.1207994, 2.226763, 1, 1, 1, 1, 1,
0.7514589, -1.508306, 2.600787, 1, 1, 1, 1, 1,
0.7549352, 0.6783107, 1.118831, 1, 1, 1, 1, 1,
0.7566563, -1.078599, 1.50509, 1, 1, 1, 1, 1,
0.7579426, 0.1759745, 1.736901, 1, 1, 1, 1, 1,
0.7593601, 0.5841998, -0.2413577, 0, 0, 1, 1, 1,
0.7606565, -1.489396, 3.362234, 1, 0, 0, 1, 1,
0.7728962, -0.9717209, 4.098185, 1, 0, 0, 1, 1,
0.7792519, 0.2014235, 1.28747, 1, 0, 0, 1, 1,
0.7818054, 0.20939, -0.1479317, 1, 0, 0, 1, 1,
0.7821966, -0.530701, 3.203196, 1, 0, 0, 1, 1,
0.7861618, -0.02135189, 1.124295, 0, 0, 0, 1, 1,
0.7864251, 1.095809, -0.5969391, 0, 0, 0, 1, 1,
0.7864478, 0.8743947, 0.7235649, 0, 0, 0, 1, 1,
0.7908187, 1.327007, 0.3205944, 0, 0, 0, 1, 1,
0.7962091, -0.3254734, 1.16674, 0, 0, 0, 1, 1,
0.7988942, -0.2362635, 3.018419, 0, 0, 0, 1, 1,
0.7990087, 0.2757068, 1.453533, 0, 0, 0, 1, 1,
0.8048844, 1.341307, -0.4483244, 1, 1, 1, 1, 1,
0.8076383, -1.874963, 3.691096, 1, 1, 1, 1, 1,
0.811505, 0.2819626, 1.225684, 1, 1, 1, 1, 1,
0.819164, -2.36271, 2.31781, 1, 1, 1, 1, 1,
0.8277761, 0.5987446, -0.4579666, 1, 1, 1, 1, 1,
0.834268, 1.010659, 0.9936157, 1, 1, 1, 1, 1,
0.8361323, -0.569149, 0.1856841, 1, 1, 1, 1, 1,
0.8369773, -0.07640302, 0.9045767, 1, 1, 1, 1, 1,
0.8375212, 0.4901353, -0.3829058, 1, 1, 1, 1, 1,
0.8391088, 0.9242507, -0.03400841, 1, 1, 1, 1, 1,
0.8433194, 0.4291397, 2.288784, 1, 1, 1, 1, 1,
0.8453079, -0.9515811, 4.171842, 1, 1, 1, 1, 1,
0.8465971, 1.324628, -1.868651, 1, 1, 1, 1, 1,
0.8475229, -0.8186218, 3.742104, 1, 1, 1, 1, 1,
0.8475422, 0.2047447, 2.178155, 1, 1, 1, 1, 1,
0.8477307, 0.6327298, 2.004165, 0, 0, 1, 1, 1,
0.8488917, 1.252686, -0.7583707, 1, 0, 0, 1, 1,
0.8498178, 0.2847962, -0.8420293, 1, 0, 0, 1, 1,
0.8523916, -0.2498703, 1.956064, 1, 0, 0, 1, 1,
0.8573681, 1.18241, 1.430975, 1, 0, 0, 1, 1,
0.860594, 0.532425, 2.153628, 1, 0, 0, 1, 1,
0.8609336, -1.970158, 1.582937, 0, 0, 0, 1, 1,
0.8646866, -0.3882921, 2.329123, 0, 0, 0, 1, 1,
0.8656813, 0.366728, 3.257952, 0, 0, 0, 1, 1,
0.8703145, -0.4735582, 1.314155, 0, 0, 0, 1, 1,
0.8738786, -0.3519004, -0.03387333, 0, 0, 0, 1, 1,
0.8797559, -0.4397385, 2.561345, 0, 0, 0, 1, 1,
0.8816238, -0.9016436, 2.991198, 0, 0, 0, 1, 1,
0.8820496, 0.4001305, 1.007001, 1, 1, 1, 1, 1,
0.8851098, -0.09079313, 2.122198, 1, 1, 1, 1, 1,
0.8876325, -0.6981893, 2.474362, 1, 1, 1, 1, 1,
0.890673, 0.08236498, 0.7086233, 1, 1, 1, 1, 1,
0.8931903, 0.2691477, 1.773003, 1, 1, 1, 1, 1,
0.8942276, -0.2898923, 1.813441, 1, 1, 1, 1, 1,
0.894679, 0.6119215, 2.143054, 1, 1, 1, 1, 1,
0.9028786, 0.6031919, 0.7367482, 1, 1, 1, 1, 1,
0.9032936, 0.5827301, -0.3914117, 1, 1, 1, 1, 1,
0.9078489, 0.13467, 1.63777, 1, 1, 1, 1, 1,
0.9102994, 0.6388457, 0.5979459, 1, 1, 1, 1, 1,
0.9124559, -0.7715749, 3.219686, 1, 1, 1, 1, 1,
0.9185233, 0.3418336, 2.171887, 1, 1, 1, 1, 1,
0.9224465, -0.4017311, 2.697555, 1, 1, 1, 1, 1,
0.9255283, -0.3050274, 2.698117, 1, 1, 1, 1, 1,
0.9272735, 0.5734801, 1.020914, 0, 0, 1, 1, 1,
0.9289775, -0.546464, 2.010238, 1, 0, 0, 1, 1,
0.9314198, -0.399248, 1.712439, 1, 0, 0, 1, 1,
0.9337469, -0.5075843, 1.845369, 1, 0, 0, 1, 1,
0.939994, -0.7051972, 2.426821, 1, 0, 0, 1, 1,
0.9457796, 0.6554395, -0.3156016, 1, 0, 0, 1, 1,
0.9562504, 0.7179059, -0.1650557, 0, 0, 0, 1, 1,
0.9604897, 0.908388, -0.1539349, 0, 0, 0, 1, 1,
0.9648069, -2.499975, 2.291307, 0, 0, 0, 1, 1,
0.9667019, 0.4140084, -0.1679513, 0, 0, 0, 1, 1,
0.9736605, 1.234508, 1.03284, 0, 0, 0, 1, 1,
0.982306, 0.2644434, -0.8744365, 0, 0, 0, 1, 1,
0.9858627, -0.5332587, 1.921788, 0, 0, 0, 1, 1,
0.9886294, -0.867218, 2.441028, 1, 1, 1, 1, 1,
0.9924524, -0.5377845, 2.551475, 1, 1, 1, 1, 1,
0.9988006, 1.747569, 1.538174, 1, 1, 1, 1, 1,
0.9988621, -0.6178352, 3.241122, 1, 1, 1, 1, 1,
1.000505, 0.915908, -0.1184307, 1, 1, 1, 1, 1,
1.001389, -2.17667, 2.546416, 1, 1, 1, 1, 1,
1.003261, 0.5770147, 3.262461, 1, 1, 1, 1, 1,
1.013216, 0.844336, -0.2174847, 1, 1, 1, 1, 1,
1.020379, -0.216382, 2.530773, 1, 1, 1, 1, 1,
1.021552, -0.8197747, 3.94361, 1, 1, 1, 1, 1,
1.025596, -0.7285289, 1.677857, 1, 1, 1, 1, 1,
1.030256, 0.7345212, 2.217702, 1, 1, 1, 1, 1,
1.031307, 0.3685423, 0.6661493, 1, 1, 1, 1, 1,
1.031574, -1.101442, 1.931336, 1, 1, 1, 1, 1,
1.033498, 0.1152747, 1.116566, 1, 1, 1, 1, 1,
1.054581, 0.3896107, 1.048677, 0, 0, 1, 1, 1,
1.057069, -0.7433328, 1.266226, 1, 0, 0, 1, 1,
1.064653, 0.4936338, 0.1579195, 1, 0, 0, 1, 1,
1.068799, 0.02190948, 1.341383, 1, 0, 0, 1, 1,
1.077328, -0.7803057, 0.1991586, 1, 0, 0, 1, 1,
1.078413, -0.6275223, 2.471841, 1, 0, 0, 1, 1,
1.082267, -1.107206, 0.9817215, 0, 0, 0, 1, 1,
1.083281, -1.2731, 1.416562, 0, 0, 0, 1, 1,
1.083491, -0.09159851, 2.534041, 0, 0, 0, 1, 1,
1.094669, -0.447966, -0.6244457, 0, 0, 0, 1, 1,
1.096602, 0.5425662, 0.4257889, 0, 0, 0, 1, 1,
1.10451, 0.3074743, -0.2697494, 0, 0, 0, 1, 1,
1.110567, -0.4272259, 2.450084, 0, 0, 0, 1, 1,
1.11377, 0.03925469, 2.48814, 1, 1, 1, 1, 1,
1.127567, -0.0263169, 1.6177, 1, 1, 1, 1, 1,
1.12844, 0.009236256, 2.884499, 1, 1, 1, 1, 1,
1.133354, 0.2195601, 0.9858889, 1, 1, 1, 1, 1,
1.133468, -0.2524051, 0.6223339, 1, 1, 1, 1, 1,
1.139763, -0.2267031, 2.596956, 1, 1, 1, 1, 1,
1.150179, -1.187595, 2.126345, 1, 1, 1, 1, 1,
1.155219, 0.9550069, 1.482152, 1, 1, 1, 1, 1,
1.171544, 1.400431, -0.43178, 1, 1, 1, 1, 1,
1.195948, 0.01255998, 2.683694, 1, 1, 1, 1, 1,
1.199316, 0.2197003, 2.11725, 1, 1, 1, 1, 1,
1.200057, 0.7201648, 0.8830203, 1, 1, 1, 1, 1,
1.200959, -0.5126079, 2.571735, 1, 1, 1, 1, 1,
1.204602, -0.6641078, 1.802902, 1, 1, 1, 1, 1,
1.206515, 0.501452, 1.906497, 1, 1, 1, 1, 1,
1.213409, 0.4120491, 2.12787, 0, 0, 1, 1, 1,
1.215984, 0.7923303, 0.9575037, 1, 0, 0, 1, 1,
1.22076, -0.9138842, 1.475532, 1, 0, 0, 1, 1,
1.225178, 0.4878291, 2.913919, 1, 0, 0, 1, 1,
1.226018, 0.6786994, 0.4109323, 1, 0, 0, 1, 1,
1.226178, 1.576083, -0.5913461, 1, 0, 0, 1, 1,
1.231468, -0.04323346, 2.784613, 0, 0, 0, 1, 1,
1.27111, 0.07641187, 0.2513589, 0, 0, 0, 1, 1,
1.271587, -0.948007, 2.057661, 0, 0, 0, 1, 1,
1.275105, -0.5184242, 3.008044, 0, 0, 0, 1, 1,
1.281232, -0.08643933, 2.660033, 0, 0, 0, 1, 1,
1.28561, -0.04823148, 2.148324, 0, 0, 0, 1, 1,
1.290756, -0.9698609, 2.131752, 0, 0, 0, 1, 1,
1.291027, 0.9416447, 1.998419, 1, 1, 1, 1, 1,
1.291896, 0.1469015, -0.05670954, 1, 1, 1, 1, 1,
1.318247, 0.6886547, -0.1505433, 1, 1, 1, 1, 1,
1.331221, -0.2264995, 2.723904, 1, 1, 1, 1, 1,
1.334102, 1.038115, 0.1811733, 1, 1, 1, 1, 1,
1.33416, 0.3571786, 2.633032, 1, 1, 1, 1, 1,
1.338107, 0.4983584, 2.004306, 1, 1, 1, 1, 1,
1.339507, -0.2458887, 1.426822, 1, 1, 1, 1, 1,
1.340123, 0.5503298, -0.4653493, 1, 1, 1, 1, 1,
1.347059, -0.1907708, 1.065613, 1, 1, 1, 1, 1,
1.348798, 0.1287786, 1.418539, 1, 1, 1, 1, 1,
1.349319, 1.06544, 0.7887828, 1, 1, 1, 1, 1,
1.366694, 0.07467115, 2.757033, 1, 1, 1, 1, 1,
1.371547, 0.455673, 1.474417, 1, 1, 1, 1, 1,
1.375248, -0.2498845, 0.9041709, 1, 1, 1, 1, 1,
1.379484, -0.918007, 0.8565674, 0, 0, 1, 1, 1,
1.393596, -1.345199, 0.9928164, 1, 0, 0, 1, 1,
1.394959, 0.4690813, 1.234773, 1, 0, 0, 1, 1,
1.40071, -0.621441, 2.470676, 1, 0, 0, 1, 1,
1.42369, 0.4523063, 2.287005, 1, 0, 0, 1, 1,
1.424207, 0.4812045, 0.2932042, 1, 0, 0, 1, 1,
1.431252, 0.523559, 0.9973665, 0, 0, 0, 1, 1,
1.448331, 0.4232732, 3.187591, 0, 0, 0, 1, 1,
1.453749, -1.025043, 1.933303, 0, 0, 0, 1, 1,
1.483343, 0.5863721, 1.414464, 0, 0, 0, 1, 1,
1.491146, 0.09822097, 0.5976356, 0, 0, 0, 1, 1,
1.50227, -0.21502, 2.478634, 0, 0, 0, 1, 1,
1.502613, -0.3249602, 0.2196563, 0, 0, 0, 1, 1,
1.536597, 1.018651, 1.466516, 1, 1, 1, 1, 1,
1.538465, 1.375001, 1.542723, 1, 1, 1, 1, 1,
1.543202, 1.684718, -0.8708062, 1, 1, 1, 1, 1,
1.551398, -0.2829506, 3.257961, 1, 1, 1, 1, 1,
1.56847, 0.6784241, 0.9223755, 1, 1, 1, 1, 1,
1.571709, 1.017669, 0.9965071, 1, 1, 1, 1, 1,
1.582928, 0.1515355, 1.929874, 1, 1, 1, 1, 1,
1.584827, -0.1294477, -0.1429219, 1, 1, 1, 1, 1,
1.589418, 1.064917, 1.412211, 1, 1, 1, 1, 1,
1.607197, 0.2316214, 0.878702, 1, 1, 1, 1, 1,
1.614335, 0.3581682, -0.1667162, 1, 1, 1, 1, 1,
1.632077, -1.844527, 0.7398899, 1, 1, 1, 1, 1,
1.638981, -0.5984736, 3.422933, 1, 1, 1, 1, 1,
1.661122, -0.03584745, 1.482803, 1, 1, 1, 1, 1,
1.670529, 0.2895537, 1.880992, 1, 1, 1, 1, 1,
1.682813, 0.5122489, 3.824398, 0, 0, 1, 1, 1,
1.683514, -0.348405, 2.002213, 1, 0, 0, 1, 1,
1.693631, -1.353373, 1.520042, 1, 0, 0, 1, 1,
1.721702, -0.111001, 3.363124, 1, 0, 0, 1, 1,
1.741217, 0.603356, 1.285941, 1, 0, 0, 1, 1,
1.741317, -0.5601955, 1.265698, 1, 0, 0, 1, 1,
1.748904, -1.00668, 0.6316204, 0, 0, 0, 1, 1,
1.753278, -0.0839045, 1.852697, 0, 0, 0, 1, 1,
1.763297, -0.5475382, 1.461996, 0, 0, 0, 1, 1,
1.765918, 0.6907874, 0.5142021, 0, 0, 0, 1, 1,
1.76879, 1.276387, 1.074735, 0, 0, 0, 1, 1,
1.781261, 2.062896, 1.557503, 0, 0, 0, 1, 1,
1.791185, -0.5218992, 2.513073, 0, 0, 0, 1, 1,
1.799776, 1.075003, 0.07486381, 1, 1, 1, 1, 1,
1.801039, -0.05377959, 2.030474, 1, 1, 1, 1, 1,
1.8275, -0.715376, 1.474559, 1, 1, 1, 1, 1,
1.832468, -1.355749, 1.25697, 1, 1, 1, 1, 1,
1.844414, -0.08517285, 3.738616, 1, 1, 1, 1, 1,
1.865816, -0.2772035, 2.091585, 1, 1, 1, 1, 1,
1.868765, -1.118743, 2.046366, 1, 1, 1, 1, 1,
1.877697, 0.4227743, -0.3636822, 1, 1, 1, 1, 1,
1.91948, 0.2954696, 1.626355, 1, 1, 1, 1, 1,
1.948891, -0.9706388, 1.03922, 1, 1, 1, 1, 1,
1.952625, -1.329489, 3.625433, 1, 1, 1, 1, 1,
1.959092, 1.64223, 1.420207, 1, 1, 1, 1, 1,
1.967805, 0.7842414, 2.233114, 1, 1, 1, 1, 1,
1.993459, -0.5580351, 1.476669, 1, 1, 1, 1, 1,
2.030722, 1.255338, 0.9680112, 1, 1, 1, 1, 1,
2.031511, 0.07027276, 1.835346, 0, 0, 1, 1, 1,
2.034434, 0.9933233, 0.7349448, 1, 0, 0, 1, 1,
2.04881, -0.9701743, 0.8218131, 1, 0, 0, 1, 1,
2.062315, -2.63932, 1.673279, 1, 0, 0, 1, 1,
2.07005, -1.0855, 4.074047, 1, 0, 0, 1, 1,
2.074282, 0.4555698, 3.608932, 1, 0, 0, 1, 1,
2.132206, -0.6194841, 0.6410368, 0, 0, 0, 1, 1,
2.148875, -1.660651, 2.029617, 0, 0, 0, 1, 1,
2.172454, 1.648379, 0.3211631, 0, 0, 0, 1, 1,
2.209553, -0.9787635, 2.526154, 0, 0, 0, 1, 1,
2.304432, 0.8540252, 1.063643, 0, 0, 0, 1, 1,
2.305115, -0.5124703, 2.242327, 0, 0, 0, 1, 1,
2.316585, 0.1840107, 1.843182, 0, 0, 0, 1, 1,
2.364622, 1.499383, 1.659949, 1, 1, 1, 1, 1,
2.432771, -1.852824, 2.256471, 1, 1, 1, 1, 1,
2.543252, 1.620893, 0.4405546, 1, 1, 1, 1, 1,
2.588612, 0.9677756, 0.7046559, 1, 1, 1, 1, 1,
2.837776, 0.5197623, 1.830143, 1, 1, 1, 1, 1,
3.150079, -0.5615975, 1.934174, 1, 1, 1, 1, 1,
3.31826, -0.4193611, 0.7826316, 1, 1, 1, 1, 1
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
var radius = 9.294681;
var distance = 32.64717;
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
mvMatrix.translate( -0.179123, -0.2219565, 0.1046338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.64717);
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