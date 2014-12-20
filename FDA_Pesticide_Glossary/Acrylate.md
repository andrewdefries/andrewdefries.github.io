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
-3.797643, 0.6380526, 0.2645535, 1, 0, 0, 1,
-3.032205, 1.043592, -2.900676, 1, 0.007843138, 0, 1,
-2.991422, 0.19302, -0.643791, 1, 0.01176471, 0, 1,
-2.837499, -0.2171043, -1.350928, 1, 0.01960784, 0, 1,
-2.780606, 1.105236, -1.540081, 1, 0.02352941, 0, 1,
-2.749335, 0.3884506, -2.96672, 1, 0.03137255, 0, 1,
-2.745338, 0.7161603, -1.3016, 1, 0.03529412, 0, 1,
-2.619029, -0.4857506, -2.994822, 1, 0.04313726, 0, 1,
-2.597125, -1.927628, -1.385642, 1, 0.04705882, 0, 1,
-2.577456, 0.04781255, -2.824198, 1, 0.05490196, 0, 1,
-2.515135, -0.5416555, -2.705144, 1, 0.05882353, 0, 1,
-2.499769, 0.8713799, -1.503129, 1, 0.06666667, 0, 1,
-2.433319, 1.145626, -0.9247045, 1, 0.07058824, 0, 1,
-2.424348, -0.2041608, -2.244821, 1, 0.07843138, 0, 1,
-2.319953, -0.9947032, -1.929596, 1, 0.08235294, 0, 1,
-2.293437, 0.2746266, -1.962933, 1, 0.09019608, 0, 1,
-2.232883, 0.4404382, 0.7602087, 1, 0.09411765, 0, 1,
-2.230589, 0.7713183, -1.418256, 1, 0.1019608, 0, 1,
-2.229245, 1.025342, -1.543183, 1, 0.1098039, 0, 1,
-2.179865, -1.196262, -1.242557, 1, 0.1137255, 0, 1,
-2.165808, -0.09854174, -0.3713045, 1, 0.1215686, 0, 1,
-2.16253, 0.6911191, -1.734827, 1, 0.1254902, 0, 1,
-2.132737, -1.063537, -1.581618, 1, 0.1333333, 0, 1,
-2.116619, -0.3060752, -0.787024, 1, 0.1372549, 0, 1,
-2.112685, 0.2603587, -0.7860458, 1, 0.145098, 0, 1,
-2.048123, -0.06757534, -3.01239, 1, 0.1490196, 0, 1,
-1.999337, -0.1400235, 0.3010534, 1, 0.1568628, 0, 1,
-1.992342, 0.6326538, -1.402884, 1, 0.1607843, 0, 1,
-1.986202, 0.8720235, -0.7497133, 1, 0.1686275, 0, 1,
-1.97881, 0.5763302, -1.934557, 1, 0.172549, 0, 1,
-1.971708, 0.6299388, -0.5995811, 1, 0.1803922, 0, 1,
-1.953972, 1.053817, -1.91185, 1, 0.1843137, 0, 1,
-1.885913, 0.7279783, -2.192911, 1, 0.1921569, 0, 1,
-1.884, 0.7167951, -1.133793, 1, 0.1960784, 0, 1,
-1.839204, 0.9794536, 0.129771, 1, 0.2039216, 0, 1,
-1.804721, -1.070401, -1.191294, 1, 0.2117647, 0, 1,
-1.799785, -0.4785899, -2.676663, 1, 0.2156863, 0, 1,
-1.788199, -0.422873, -2.618507, 1, 0.2235294, 0, 1,
-1.764704, 0.8654602, -0.7290736, 1, 0.227451, 0, 1,
-1.741938, 2.331926, -0.9161457, 1, 0.2352941, 0, 1,
-1.732942, 3.684999, -0.757982, 1, 0.2392157, 0, 1,
-1.731565, 0.6223849, -0.5531475, 1, 0.2470588, 0, 1,
-1.71503, -1.210541, -1.437639, 1, 0.2509804, 0, 1,
-1.696367, -0.2196448, -1.946098, 1, 0.2588235, 0, 1,
-1.69635, 0.7094247, -2.452913, 1, 0.2627451, 0, 1,
-1.684371, 1.836625, 0.07678479, 1, 0.2705882, 0, 1,
-1.670664, -0.9248267, -1.22094, 1, 0.2745098, 0, 1,
-1.669919, 0.1021942, -2.07753, 1, 0.282353, 0, 1,
-1.65941, 1.404419, -0.6817097, 1, 0.2862745, 0, 1,
-1.645773, 0.146639, -1.199217, 1, 0.2941177, 0, 1,
-1.64459, -1.533387, -1.591917, 1, 0.3019608, 0, 1,
-1.610664, -0.6948439, -2.133898, 1, 0.3058824, 0, 1,
-1.597919, 0.4035352, -0.1972564, 1, 0.3137255, 0, 1,
-1.578187, -1.25589, 0.2418786, 1, 0.3176471, 0, 1,
-1.5669, -0.9949734, -3.061682, 1, 0.3254902, 0, 1,
-1.527545, -0.993868, -0.7392415, 1, 0.3294118, 0, 1,
-1.513916, -1.449071, -1.248025, 1, 0.3372549, 0, 1,
-1.493708, 0.2561961, -1.225993, 1, 0.3411765, 0, 1,
-1.490334, 0.4770244, -2.321784, 1, 0.3490196, 0, 1,
-1.483293, -0.5524133, -1.339363, 1, 0.3529412, 0, 1,
-1.477876, 0.9043124, 0.4464608, 1, 0.3607843, 0, 1,
-1.469254, 0.5602779, 0.3032558, 1, 0.3647059, 0, 1,
-1.465358, -1.944817, -3.052693, 1, 0.372549, 0, 1,
-1.456806, 0.7059525, -0.9911923, 1, 0.3764706, 0, 1,
-1.455785, -0.1215611, -1.827076, 1, 0.3843137, 0, 1,
-1.455337, 2.112875, -0.05532957, 1, 0.3882353, 0, 1,
-1.44978, 0.5846136, -1.472581, 1, 0.3960784, 0, 1,
-1.444842, -0.7547815, -2.068756, 1, 0.4039216, 0, 1,
-1.44345, -0.108613, -3.530769, 1, 0.4078431, 0, 1,
-1.441774, -0.007001742, -0.1610975, 1, 0.4156863, 0, 1,
-1.438767, -1.48628, -0.7400716, 1, 0.4196078, 0, 1,
-1.434457, -0.120191, -1.275775, 1, 0.427451, 0, 1,
-1.434107, 1.083933, -1.927649, 1, 0.4313726, 0, 1,
-1.43195, -1.149544, -2.114072, 1, 0.4392157, 0, 1,
-1.422123, 0.4850897, -0.7887847, 1, 0.4431373, 0, 1,
-1.420621, 0.1556463, -1.745435, 1, 0.4509804, 0, 1,
-1.408255, 0.7215059, -2.5483, 1, 0.454902, 0, 1,
-1.403492, 2.165801, -0.7910684, 1, 0.4627451, 0, 1,
-1.400983, 0.1121336, -1.628747, 1, 0.4666667, 0, 1,
-1.399789, 0.009851366, -1.208431, 1, 0.4745098, 0, 1,
-1.388178, -1.089248, -1.89445, 1, 0.4784314, 0, 1,
-1.385329, 0.7698433, -2.881466, 1, 0.4862745, 0, 1,
-1.383944, 1.207665, -0.3978835, 1, 0.4901961, 0, 1,
-1.37819, -0.7322884, -1.636074, 1, 0.4980392, 0, 1,
-1.369102, 0.3757732, -2.25577, 1, 0.5058824, 0, 1,
-1.359626, -0.9990761, -3.102731, 1, 0.509804, 0, 1,
-1.352811, -0.1565153, -0.282286, 1, 0.5176471, 0, 1,
-1.350466, -1.7809, -3.510992, 1, 0.5215687, 0, 1,
-1.340559, 1.216086, -0.07953916, 1, 0.5294118, 0, 1,
-1.335771, 1.448365, -0.6167055, 1, 0.5333334, 0, 1,
-1.332907, 0.2744811, -2.41528, 1, 0.5411765, 0, 1,
-1.329319, -0.4862376, -1.766894, 1, 0.5450981, 0, 1,
-1.328001, -2.842625, -2.850406, 1, 0.5529412, 0, 1,
-1.32538, -0.2792788, -0.4939103, 1, 0.5568628, 0, 1,
-1.316407, 0.8914415, -1.877507, 1, 0.5647059, 0, 1,
-1.315912, 0.6289003, 0.227791, 1, 0.5686275, 0, 1,
-1.315285, -0.5219292, -3.105733, 1, 0.5764706, 0, 1,
-1.307945, 0.2369858, -1.757645, 1, 0.5803922, 0, 1,
-1.28854, 0.469962, -1.517183, 1, 0.5882353, 0, 1,
-1.287856, 0.006785985, -2.726292, 1, 0.5921569, 0, 1,
-1.286562, 0.4705952, -1.166101, 1, 0.6, 0, 1,
-1.28566, -0.1265033, -1.081436, 1, 0.6078432, 0, 1,
-1.278091, -0.4701713, -1.594441, 1, 0.6117647, 0, 1,
-1.26459, 0.3529633, -0.1449347, 1, 0.6196079, 0, 1,
-1.259, -0.599005, -2.081223, 1, 0.6235294, 0, 1,
-1.257831, 0.4024212, -0.06144188, 1, 0.6313726, 0, 1,
-1.25604, -0.6629483, -1.817287, 1, 0.6352941, 0, 1,
-1.255878, -0.2051755, -3.896772, 1, 0.6431373, 0, 1,
-1.255156, 0.2523128, -3.083931, 1, 0.6470588, 0, 1,
-1.248326, 0.2950287, 0.2188339, 1, 0.654902, 0, 1,
-1.240655, -0.09636472, -2.704042, 1, 0.6588235, 0, 1,
-1.238003, 1.259972, -0.380375, 1, 0.6666667, 0, 1,
-1.235821, -0.6121911, -1.495349, 1, 0.6705883, 0, 1,
-1.234547, -0.9344934, -1.708943, 1, 0.6784314, 0, 1,
-1.225723, 0.5498269, -1.885264, 1, 0.682353, 0, 1,
-1.224058, 1.366533, -1.065197, 1, 0.6901961, 0, 1,
-1.215952, -1.052526, -2.844404, 1, 0.6941177, 0, 1,
-1.215471, 0.7195379, -0.3555886, 1, 0.7019608, 0, 1,
-1.215409, 0.03079721, 0.6103706, 1, 0.7098039, 0, 1,
-1.210284, 0.3396942, -0.3985022, 1, 0.7137255, 0, 1,
-1.210214, 0.4683628, -2.530024, 1, 0.7215686, 0, 1,
-1.20341, 0.06816056, -1.052147, 1, 0.7254902, 0, 1,
-1.199391, -0.3633586, -1.583229, 1, 0.7333333, 0, 1,
-1.198468, -0.5621378, -3.939539, 1, 0.7372549, 0, 1,
-1.184671, 0.5457593, -1.668243, 1, 0.7450981, 0, 1,
-1.182989, -0.175733, -1.172809, 1, 0.7490196, 0, 1,
-1.178885, 1.268299, -0.8784129, 1, 0.7568628, 0, 1,
-1.176653, 0.869368, -2.49489, 1, 0.7607843, 0, 1,
-1.170784, 0.4140898, -0.8418909, 1, 0.7686275, 0, 1,
-1.163304, 0.5721725, -3.176587, 1, 0.772549, 0, 1,
-1.162013, -0.06004427, -2.109025, 1, 0.7803922, 0, 1,
-1.155821, 0.09000941, -0.3620915, 1, 0.7843137, 0, 1,
-1.149632, 0.5477172, -2.382883, 1, 0.7921569, 0, 1,
-1.146807, -0.2624511, -1.389676, 1, 0.7960784, 0, 1,
-1.145956, 1.984756, -0.4909365, 1, 0.8039216, 0, 1,
-1.144638, 0.9117663, -0.4701828, 1, 0.8117647, 0, 1,
-1.14136, 0.274366, -1.868277, 1, 0.8156863, 0, 1,
-1.138627, 0.1422222, -1.823071, 1, 0.8235294, 0, 1,
-1.136539, -2.744468, -3.944265, 1, 0.827451, 0, 1,
-1.131362, -0.4201849, -2.960578, 1, 0.8352941, 0, 1,
-1.130469, -0.5161678, -3.310369, 1, 0.8392157, 0, 1,
-1.12859, 0.6332777, -0.5322757, 1, 0.8470588, 0, 1,
-1.126896, -0.7579636, -1.159888, 1, 0.8509804, 0, 1,
-1.118765, -0.3244974, -0.846474, 1, 0.8588235, 0, 1,
-1.114216, -1.769734, -2.299951, 1, 0.8627451, 0, 1,
-1.112337, 0.2256505, -1.381477, 1, 0.8705882, 0, 1,
-1.112229, 0.5577951, -0.4585012, 1, 0.8745098, 0, 1,
-1.111868, 0.1473613, -1.674221, 1, 0.8823529, 0, 1,
-1.102583, 0.9415634, 1.446792, 1, 0.8862745, 0, 1,
-1.101752, -0.8108275, -3.51971, 1, 0.8941177, 0, 1,
-1.101354, -0.1880716, -1.175565, 1, 0.8980392, 0, 1,
-1.096003, -0.6824859, -3.398387, 1, 0.9058824, 0, 1,
-1.095438, -1.762433, -1.943703, 1, 0.9137255, 0, 1,
-1.092806, -0.4916771, -1.796987, 1, 0.9176471, 0, 1,
-1.092245, 0.6916804, 0.1020187, 1, 0.9254902, 0, 1,
-1.087996, -0.3648168, -3.365569, 1, 0.9294118, 0, 1,
-1.086122, 0.1551214, -1.84026, 1, 0.9372549, 0, 1,
-1.084442, -0.6961846, -2.187753, 1, 0.9411765, 0, 1,
-1.081679, 0.8877296, -0.9651077, 1, 0.9490196, 0, 1,
-1.078916, 0.4315049, 0.631891, 1, 0.9529412, 0, 1,
-1.070699, -0.425759, 0.08947747, 1, 0.9607843, 0, 1,
-1.070046, -0.3516257, -1.096398, 1, 0.9647059, 0, 1,
-1.066494, -1.57408, -1.835776, 1, 0.972549, 0, 1,
-1.066426, -2.261325, -2.304761, 1, 0.9764706, 0, 1,
-1.057251, 1.734569, -1.40553, 1, 0.9843137, 0, 1,
-1.054614, 1.435064, -0.07796805, 1, 0.9882353, 0, 1,
-1.045151, 0.7964224, -0.5963053, 1, 0.9960784, 0, 1,
-1.04413, -2.242506, -1.517132, 0.9960784, 1, 0, 1,
-1.039241, -0.9741321, -2.098921, 0.9921569, 1, 0, 1,
-1.038545, 0.4791379, -2.13263, 0.9843137, 1, 0, 1,
-1.029886, 0.8352144, -1.29166, 0.9803922, 1, 0, 1,
-1.021886, 0.6526639, -0.5001807, 0.972549, 1, 0, 1,
-1.016609, 0.7971308, -1.603974, 0.9686275, 1, 0, 1,
-1.010341, 0.06439106, -0.9354936, 0.9607843, 1, 0, 1,
-1.001559, 0.7618427, 0.4943307, 0.9568627, 1, 0, 1,
-0.9998066, -1.290379, -1.884855, 0.9490196, 1, 0, 1,
-0.9942836, -0.5044262, -2.879009, 0.945098, 1, 0, 1,
-0.9905185, -1.153575, -1.78555, 0.9372549, 1, 0, 1,
-0.9903743, 0.6816956, -2.277867, 0.9333333, 1, 0, 1,
-0.9884998, -0.8574431, -2.960016, 0.9254902, 1, 0, 1,
-0.9848371, -1.65263, -3.321038, 0.9215686, 1, 0, 1,
-0.9770935, -0.742627, -1.828918, 0.9137255, 1, 0, 1,
-0.9732192, 0.2579294, -0.9713565, 0.9098039, 1, 0, 1,
-0.9704864, 1.856039, -1.526675, 0.9019608, 1, 0, 1,
-0.9660714, -0.2836692, -0.1984554, 0.8941177, 1, 0, 1,
-0.9641935, -0.8512025, 0.003598532, 0.8901961, 1, 0, 1,
-0.9615244, 0.8279386, -2.900413, 0.8823529, 1, 0, 1,
-0.9521179, 0.02845119, -2.126677, 0.8784314, 1, 0, 1,
-0.945969, -1.157307, -2.358222, 0.8705882, 1, 0, 1,
-0.936518, 0.6943538, -0.2767315, 0.8666667, 1, 0, 1,
-0.9304559, 0.4381196, -1.485402, 0.8588235, 1, 0, 1,
-0.9261362, 1.971128, 0.644104, 0.854902, 1, 0, 1,
-0.9252185, -0.674355, -1.147565, 0.8470588, 1, 0, 1,
-0.924919, 0.2163758, -2.563881, 0.8431373, 1, 0, 1,
-0.9243632, -0.14908, -1.746215, 0.8352941, 1, 0, 1,
-0.9226835, -1.319561, -2.090176, 0.8313726, 1, 0, 1,
-0.9216573, 0.6482822, 0.3929063, 0.8235294, 1, 0, 1,
-0.9205614, -0.9564346, -2.961441, 0.8196079, 1, 0, 1,
-0.9139532, 0.582342, -0.3416683, 0.8117647, 1, 0, 1,
-0.9134017, -1.290177, -2.993892, 0.8078431, 1, 0, 1,
-0.910672, 0.8230091, -1.273558, 0.8, 1, 0, 1,
-0.9091526, -0.7575014, -3.557291, 0.7921569, 1, 0, 1,
-0.9048212, 0.01274473, -2.074615, 0.7882353, 1, 0, 1,
-0.9026145, 1.137735, -1.083809, 0.7803922, 1, 0, 1,
-0.8993479, 0.1584011, -2.113597, 0.7764706, 1, 0, 1,
-0.8986962, -0.827672, -3.409749, 0.7686275, 1, 0, 1,
-0.8945526, -1.098926, -1.337755, 0.7647059, 1, 0, 1,
-0.8899571, 0.8970771, -1.393242, 0.7568628, 1, 0, 1,
-0.8866688, -1.127412, -1.129565, 0.7529412, 1, 0, 1,
-0.8834368, 0.6777968, -1.100708, 0.7450981, 1, 0, 1,
-0.8803329, -0.8191237, -2.984446, 0.7411765, 1, 0, 1,
-0.8799965, 1.412179, -0.6398526, 0.7333333, 1, 0, 1,
-0.8731242, 0.5543858, -0.2635058, 0.7294118, 1, 0, 1,
-0.8652764, 1.006093, -2.790118, 0.7215686, 1, 0, 1,
-0.8624254, 1.029779, -3.196751, 0.7176471, 1, 0, 1,
-0.8583705, -0.9564977, -1.449373, 0.7098039, 1, 0, 1,
-0.8570402, -0.3154204, -1.56872, 0.7058824, 1, 0, 1,
-0.8547746, 0.4707036, 0.1775964, 0.6980392, 1, 0, 1,
-0.853314, 0.6868681, 0.2241573, 0.6901961, 1, 0, 1,
-0.8466176, -1.805881, -1.2279, 0.6862745, 1, 0, 1,
-0.8464498, 0.3933505, -1.586381, 0.6784314, 1, 0, 1,
-0.8414484, -0.5345544, -2.594812, 0.6745098, 1, 0, 1,
-0.8402098, -0.8481483, -2.351156, 0.6666667, 1, 0, 1,
-0.8342066, 0.1633547, -1.458351, 0.6627451, 1, 0, 1,
-0.831523, -0.9935987, -2.193523, 0.654902, 1, 0, 1,
-0.8287359, -0.5345105, -1.992991, 0.6509804, 1, 0, 1,
-0.8234576, 1.481338, -0.0948488, 0.6431373, 1, 0, 1,
-0.823446, 0.07207012, -2.71227, 0.6392157, 1, 0, 1,
-0.8229764, -1.160241, 0.1474501, 0.6313726, 1, 0, 1,
-0.8105841, 0.7146933, -1.899852, 0.627451, 1, 0, 1,
-0.8103789, 1.63756, 0.2931079, 0.6196079, 1, 0, 1,
-0.8062136, 0.8861016, -1.674862, 0.6156863, 1, 0, 1,
-0.8056759, 1.629534, -1.883682, 0.6078432, 1, 0, 1,
-0.8039014, -1.148283, -2.439896, 0.6039216, 1, 0, 1,
-0.7998595, 0.602092, -1.417737, 0.5960785, 1, 0, 1,
-0.7981563, 1.624009, -0.4277379, 0.5882353, 1, 0, 1,
-0.7970655, 0.3966525, -0.2283268, 0.5843138, 1, 0, 1,
-0.7964938, 1.237241, -0.8219188, 0.5764706, 1, 0, 1,
-0.7921321, 0.5321115, -1.703457, 0.572549, 1, 0, 1,
-0.7856972, 0.7203709, -0.1587624, 0.5647059, 1, 0, 1,
-0.7826375, 0.9930694, -1.337725, 0.5607843, 1, 0, 1,
-0.7766959, -0.8572062, -1.684014, 0.5529412, 1, 0, 1,
-0.7743663, 0.5480055, -1.658529, 0.5490196, 1, 0, 1,
-0.7739826, -1.009494, -2.350522, 0.5411765, 1, 0, 1,
-0.7590476, 2.476604, -1.49186, 0.5372549, 1, 0, 1,
-0.7577512, 1.179316, -1.35349, 0.5294118, 1, 0, 1,
-0.7548336, 0.1596136, -1.49558, 0.5254902, 1, 0, 1,
-0.752513, 1.966887, -0.07708237, 0.5176471, 1, 0, 1,
-0.7434363, 0.9298528, 0.08339448, 0.5137255, 1, 0, 1,
-0.7402038, 0.6287026, -0.4172967, 0.5058824, 1, 0, 1,
-0.7355106, 0.6114029, -0.4611095, 0.5019608, 1, 0, 1,
-0.7352195, 0.51258, -2.639066, 0.4941176, 1, 0, 1,
-0.7331361, -0.2342398, -2.717173, 0.4862745, 1, 0, 1,
-0.7303604, -0.3892999, -2.094091, 0.4823529, 1, 0, 1,
-0.7302279, -0.3890505, -1.343409, 0.4745098, 1, 0, 1,
-0.7287399, -0.5260729, -2.959695, 0.4705882, 1, 0, 1,
-0.7261012, 0.7672915, 0.5999015, 0.4627451, 1, 0, 1,
-0.7200179, -2.05189, -3.819279, 0.4588235, 1, 0, 1,
-0.7186098, -0.2575515, -3.622159, 0.4509804, 1, 0, 1,
-0.7098806, -2.407712, -2.310067, 0.4470588, 1, 0, 1,
-0.6983256, -1.941795, -2.353124, 0.4392157, 1, 0, 1,
-0.6921913, 1.09154, -0.2693841, 0.4352941, 1, 0, 1,
-0.6918427, 2.252474, -1.021691, 0.427451, 1, 0, 1,
-0.6907005, 1.674018, -1.945425, 0.4235294, 1, 0, 1,
-0.68515, -1.4975, -4.162668, 0.4156863, 1, 0, 1,
-0.6830628, -0.3714471, -1.335463, 0.4117647, 1, 0, 1,
-0.6789511, 0.4049003, -1.073256, 0.4039216, 1, 0, 1,
-0.6774737, -0.3059029, -1.790316, 0.3960784, 1, 0, 1,
-0.6752207, -0.7371214, -2.240032, 0.3921569, 1, 0, 1,
-0.6736162, 0.4482572, -0.9741384, 0.3843137, 1, 0, 1,
-0.6719135, 0.05770151, -2.164317, 0.3803922, 1, 0, 1,
-0.6703379, 1.259229, 0.5037383, 0.372549, 1, 0, 1,
-0.6703277, 0.8058581, -0.6552902, 0.3686275, 1, 0, 1,
-0.6675146, 0.6304604, -0.69041, 0.3607843, 1, 0, 1,
-0.6672066, 0.04744305, -1.848944, 0.3568628, 1, 0, 1,
-0.665925, -0.7900807, -1.784228, 0.3490196, 1, 0, 1,
-0.66518, -1.040242, -2.996693, 0.345098, 1, 0, 1,
-0.65977, -0.3312187, -3.527927, 0.3372549, 1, 0, 1,
-0.6573316, 0.7486337, -1.881201, 0.3333333, 1, 0, 1,
-0.6565272, -0.1510435, -3.810207, 0.3254902, 1, 0, 1,
-0.6538799, 0.6984159, -0.7636234, 0.3215686, 1, 0, 1,
-0.6494491, -1.663407, -3.117143, 0.3137255, 1, 0, 1,
-0.6485361, -1.250145, -2.895786, 0.3098039, 1, 0, 1,
-0.6449428, -0.1109772, -2.509808, 0.3019608, 1, 0, 1,
-0.6447051, 0.502114, -1.212695, 0.2941177, 1, 0, 1,
-0.6318141, -1.146821, -3.634144, 0.2901961, 1, 0, 1,
-0.6299608, -0.2125866, -2.418913, 0.282353, 1, 0, 1,
-0.6242844, 0.3720142, 0.6792532, 0.2784314, 1, 0, 1,
-0.6126123, -0.3081715, -1.407369, 0.2705882, 1, 0, 1,
-0.6120633, -0.5461188, -2.522299, 0.2666667, 1, 0, 1,
-0.6057121, -1.139153, -1.277085, 0.2588235, 1, 0, 1,
-0.6047754, -1.758387, -4.405725, 0.254902, 1, 0, 1,
-0.602423, 0.5254162, -1.018858, 0.2470588, 1, 0, 1,
-0.6015707, 0.8039017, -0.9349757, 0.2431373, 1, 0, 1,
-0.5946137, -0.4138751, -1.843061, 0.2352941, 1, 0, 1,
-0.5886194, 0.08001991, -1.366678, 0.2313726, 1, 0, 1,
-0.5832625, -0.4206731, -2.789764, 0.2235294, 1, 0, 1,
-0.5822832, -0.226435, -1.457034, 0.2196078, 1, 0, 1,
-0.582275, -3.229793, -3.03884, 0.2117647, 1, 0, 1,
-0.5815168, -0.675798, -1.384009, 0.2078431, 1, 0, 1,
-0.5810478, -0.7710134, -1.678195, 0.2, 1, 0, 1,
-0.5802988, -0.7223619, -2.033815, 0.1921569, 1, 0, 1,
-0.5778236, 0.4894331, -1.281109, 0.1882353, 1, 0, 1,
-0.5769443, -0.2655945, -1.303355, 0.1803922, 1, 0, 1,
-0.5734884, -0.9946135, -2.220151, 0.1764706, 1, 0, 1,
-0.571471, -0.9607518, -3.006914, 0.1686275, 1, 0, 1,
-0.5688892, -0.2976829, -1.343231, 0.1647059, 1, 0, 1,
-0.567213, -1.947768, -3.62133, 0.1568628, 1, 0, 1,
-0.564974, 0.1614269, 0.2438945, 0.1529412, 1, 0, 1,
-0.5648851, 0.67537, 0.2187098, 0.145098, 1, 0, 1,
-0.5647995, 0.1324479, -1.672499, 0.1411765, 1, 0, 1,
-0.5531948, -0.7711371, -1.494326, 0.1333333, 1, 0, 1,
-0.5480295, -0.05067448, -1.018327, 0.1294118, 1, 0, 1,
-0.5378242, -0.1187104, -3.136971, 0.1215686, 1, 0, 1,
-0.5367442, 0.1805874, -3.124993, 0.1176471, 1, 0, 1,
-0.5360377, 0.7137383, -1.832236, 0.1098039, 1, 0, 1,
-0.5307037, -1.76735, -1.967164, 0.1058824, 1, 0, 1,
-0.5221896, -0.03519977, -1.505681, 0.09803922, 1, 0, 1,
-0.5089127, -0.8896235, -2.649905, 0.09019608, 1, 0, 1,
-0.5039088, 0.7459787, -1.067118, 0.08627451, 1, 0, 1,
-0.5016846, -0.5163327, -4.595769, 0.07843138, 1, 0, 1,
-0.4996342, 0.472522, -1.697278, 0.07450981, 1, 0, 1,
-0.4966716, 0.3406036, -1.847614, 0.06666667, 1, 0, 1,
-0.4956295, 0.1837337, -0.1197923, 0.0627451, 1, 0, 1,
-0.4946321, -0.1470607, -1.947943, 0.05490196, 1, 0, 1,
-0.4925279, -0.2859611, -1.21994, 0.05098039, 1, 0, 1,
-0.4887086, 1.479028, 1.016971, 0.04313726, 1, 0, 1,
-0.4852198, -0.07220332, -2.366306, 0.03921569, 1, 0, 1,
-0.48232, -0.1718596, -2.022314, 0.03137255, 1, 0, 1,
-0.4757835, -0.7464278, -3.002223, 0.02745098, 1, 0, 1,
-0.4742877, 0.5455818, -0.3887348, 0.01960784, 1, 0, 1,
-0.4741202, 0.003903921, -2.099764, 0.01568628, 1, 0, 1,
-0.4729105, -0.4744721, -2.505591, 0.007843138, 1, 0, 1,
-0.4713533, -0.04811964, -1.51883, 0.003921569, 1, 0, 1,
-0.4654742, 1.416229, 0.2618857, 0, 1, 0.003921569, 1,
-0.4608226, 0.7593052, 0.721865, 0, 1, 0.01176471, 1,
-0.4600012, -0.6546493, -2.557658, 0, 1, 0.01568628, 1,
-0.4584289, 0.4918439, -0.5468705, 0, 1, 0.02352941, 1,
-0.4516206, 1.028921, 1.613938, 0, 1, 0.02745098, 1,
-0.4423274, -1.051858, -1.304848, 0, 1, 0.03529412, 1,
-0.4417492, -1.263845, -3.272969, 0, 1, 0.03921569, 1,
-0.4357045, 0.1232973, -1.974084, 0, 1, 0.04705882, 1,
-0.4348488, -0.416141, -3.574339, 0, 1, 0.05098039, 1,
-0.4311576, 2.390543, 1.324792, 0, 1, 0.05882353, 1,
-0.4310018, 0.3882259, -2.829154, 0, 1, 0.0627451, 1,
-0.4275365, -1.512299, -2.315574, 0, 1, 0.07058824, 1,
-0.4254157, -0.9187328, -3.320754, 0, 1, 0.07450981, 1,
-0.422173, 0.3496329, 0.9358796, 0, 1, 0.08235294, 1,
-0.4210544, 2.272562, -1.522098, 0, 1, 0.08627451, 1,
-0.4193259, 0.2975355, 0.01858968, 0, 1, 0.09411765, 1,
-0.419197, -0.2966707, -3.234656, 0, 1, 0.1019608, 1,
-0.4180538, 0.7716821, -0.9268535, 0, 1, 0.1058824, 1,
-0.417541, 2.606044, 0.04991201, 0, 1, 0.1137255, 1,
-0.4125393, 0.9190876, 0.08072225, 0, 1, 0.1176471, 1,
-0.4102008, -0.7158071, -0.7300496, 0, 1, 0.1254902, 1,
-0.4086151, 0.4925922, -1.426676, 0, 1, 0.1294118, 1,
-0.4080665, -0.9483422, -1.31996, 0, 1, 0.1372549, 1,
-0.3994152, -1.123227, -4.913838, 0, 1, 0.1411765, 1,
-0.3949732, -0.8004521, 0.860047, 0, 1, 0.1490196, 1,
-0.3945048, 1.471561, 0.92775, 0, 1, 0.1529412, 1,
-0.3924809, 0.1706959, -2.256691, 0, 1, 0.1607843, 1,
-0.3913163, 0.9267423, 1.093656, 0, 1, 0.1647059, 1,
-0.3859946, 0.899334, -0.3811089, 0, 1, 0.172549, 1,
-0.3844731, 0.4540734, -1.406809, 0, 1, 0.1764706, 1,
-0.3807167, 0.02209757, -1.613308, 0, 1, 0.1843137, 1,
-0.3804306, -0.5167506, -2.429549, 0, 1, 0.1882353, 1,
-0.3791493, -0.4091512, -3.871741, 0, 1, 0.1960784, 1,
-0.3765822, -0.8083763, -2.551322, 0, 1, 0.2039216, 1,
-0.3733575, 0.002992497, 0.3109493, 0, 1, 0.2078431, 1,
-0.3714305, 1.062755, -0.9266202, 0, 1, 0.2156863, 1,
-0.3687715, 0.803033, -1.322894, 0, 1, 0.2196078, 1,
-0.365416, -0.7417294, -3.455987, 0, 1, 0.227451, 1,
-0.3652865, -0.7464265, -4.849444, 0, 1, 0.2313726, 1,
-0.3611419, -0.9475582, -1.855386, 0, 1, 0.2392157, 1,
-0.3602222, 0.9257342, -0.4838984, 0, 1, 0.2431373, 1,
-0.3599763, 0.5848746, -0.3910811, 0, 1, 0.2509804, 1,
-0.3478412, 0.9715936, -0.02398782, 0, 1, 0.254902, 1,
-0.3471287, -0.6024007, -3.084331, 0, 1, 0.2627451, 1,
-0.3455278, -0.140862, -0.4955389, 0, 1, 0.2666667, 1,
-0.3370968, -0.6150867, -4.043683, 0, 1, 0.2745098, 1,
-0.3296035, -0.3510284, -1.947452, 0, 1, 0.2784314, 1,
-0.3272162, -0.9121055, -2.128525, 0, 1, 0.2862745, 1,
-0.3267763, 0.06877456, -1.280683, 0, 1, 0.2901961, 1,
-0.3212473, -0.9375406, -2.421547, 0, 1, 0.2980392, 1,
-0.316194, -0.7015795, -2.246606, 0, 1, 0.3058824, 1,
-0.3076544, 1.285436, 1.61086, 0, 1, 0.3098039, 1,
-0.3070799, 0.4245326, -2.247252, 0, 1, 0.3176471, 1,
-0.3064647, -0.5671843, -3.58262, 0, 1, 0.3215686, 1,
-0.3049273, -0.08463706, -1.926419, 0, 1, 0.3294118, 1,
-0.3042598, -1.25665, -1.198939, 0, 1, 0.3333333, 1,
-0.2981199, -1.44806, -2.771454, 0, 1, 0.3411765, 1,
-0.2972073, 0.4687853, -0.4389456, 0, 1, 0.345098, 1,
-0.296105, 0.02922948, -1.434106, 0, 1, 0.3529412, 1,
-0.2852283, 0.9471208, 0.6458904, 0, 1, 0.3568628, 1,
-0.2835059, -0.05795774, -2.564814, 0, 1, 0.3647059, 1,
-0.2834049, 1.012157, -1.928721, 0, 1, 0.3686275, 1,
-0.281684, -0.7046229, -4.254487, 0, 1, 0.3764706, 1,
-0.2807633, -0.6496324, -3.738203, 0, 1, 0.3803922, 1,
-0.2774093, -1.306183, -2.575854, 0, 1, 0.3882353, 1,
-0.2769876, -0.7359631, -2.862082, 0, 1, 0.3921569, 1,
-0.2757347, 0.8534434, 0.07853684, 0, 1, 0.4, 1,
-0.2743036, 2.227853, -0.2235268, 0, 1, 0.4078431, 1,
-0.2670952, 1.091856, 0.4649198, 0, 1, 0.4117647, 1,
-0.2660927, -1.477651, -2.876272, 0, 1, 0.4196078, 1,
-0.261129, 1.874274, 1.15177, 0, 1, 0.4235294, 1,
-0.2590442, -0.8974487, -3.334708, 0, 1, 0.4313726, 1,
-0.2540892, 1.172473, 0.5329294, 0, 1, 0.4352941, 1,
-0.2462837, 1.844551, 0.8365182, 0, 1, 0.4431373, 1,
-0.2458752, 0.8639275, -0.8620309, 0, 1, 0.4470588, 1,
-0.2399765, -0.8250134, -3.748727, 0, 1, 0.454902, 1,
-0.2394505, -1.111539, -3.084607, 0, 1, 0.4588235, 1,
-0.2368934, 0.9731778, -0.1692091, 0, 1, 0.4666667, 1,
-0.2359876, -0.2862921, -2.759957, 0, 1, 0.4705882, 1,
-0.2347649, -0.2543207, -0.9918594, 0, 1, 0.4784314, 1,
-0.2214989, 2.172407, 0.5444899, 0, 1, 0.4823529, 1,
-0.2191823, -0.6082684, -2.302046, 0, 1, 0.4901961, 1,
-0.2189654, -0.7429616, -3.303071, 0, 1, 0.4941176, 1,
-0.2133971, -0.4886694, -1.210889, 0, 1, 0.5019608, 1,
-0.2055332, -0.6598314, -3.438988, 0, 1, 0.509804, 1,
-0.2048795, 0.297307, -2.483327, 0, 1, 0.5137255, 1,
-0.2041256, 0.3855456, -0.3832195, 0, 1, 0.5215687, 1,
-0.2030563, -2.452433, -2.644162, 0, 1, 0.5254902, 1,
-0.2025902, 0.9811009, 0.3260212, 0, 1, 0.5333334, 1,
-0.1984275, -1.518782, -4.270368, 0, 1, 0.5372549, 1,
-0.1967766, -0.3928705, -1.050834, 0, 1, 0.5450981, 1,
-0.193385, 1.120293, -1.416956, 0, 1, 0.5490196, 1,
-0.1929066, -0.73422, -3.053192, 0, 1, 0.5568628, 1,
-0.1925711, 0.03282372, -0.03340351, 0, 1, 0.5607843, 1,
-0.191411, -1.287678, -3.938162, 0, 1, 0.5686275, 1,
-0.1869646, -0.2253833, -1.051497, 0, 1, 0.572549, 1,
-0.1850616, 0.07779263, -1.336397, 0, 1, 0.5803922, 1,
-0.184538, -0.9491842, -3.584821, 0, 1, 0.5843138, 1,
-0.1825663, -0.1664082, -2.20278, 0, 1, 0.5921569, 1,
-0.175408, 1.232171, -1.509583, 0, 1, 0.5960785, 1,
-0.174019, 0.4705814, 0.1823004, 0, 1, 0.6039216, 1,
-0.1655742, 2.24044, -1.905238, 0, 1, 0.6117647, 1,
-0.1634795, 0.07714259, -0.6244588, 0, 1, 0.6156863, 1,
-0.1600458, 0.07177179, -0.2898773, 0, 1, 0.6235294, 1,
-0.1558638, -0.4764064, -2.467855, 0, 1, 0.627451, 1,
-0.1555406, -2.374714, -1.675281, 0, 1, 0.6352941, 1,
-0.151384, -0.8285448, -4.663379, 0, 1, 0.6392157, 1,
-0.1505856, -0.4967714, -2.628871, 0, 1, 0.6470588, 1,
-0.1461599, 1.580999, -0.7215309, 0, 1, 0.6509804, 1,
-0.1374637, -0.2100099, -2.257915, 0, 1, 0.6588235, 1,
-0.1300879, 0.2633662, -0.5338128, 0, 1, 0.6627451, 1,
-0.1291186, 0.259158, -0.2666036, 0, 1, 0.6705883, 1,
-0.1290285, -0.3876022, -3.033438, 0, 1, 0.6745098, 1,
-0.1284868, -0.4339719, -2.891285, 0, 1, 0.682353, 1,
-0.1277012, 0.74503, 0.2175516, 0, 1, 0.6862745, 1,
-0.1222179, 0.1113804, -1.149194, 0, 1, 0.6941177, 1,
-0.1196577, -0.1742375, -3.987266, 0, 1, 0.7019608, 1,
-0.1155276, 1.02668, 0.407922, 0, 1, 0.7058824, 1,
-0.1150101, -0.4507951, -3.243402, 0, 1, 0.7137255, 1,
-0.1136447, 0.4088599, 1.608955, 0, 1, 0.7176471, 1,
-0.1134348, -1.1496, -2.230167, 0, 1, 0.7254902, 1,
-0.1060309, -0.2621803, -2.458518, 0, 1, 0.7294118, 1,
-0.1017686, -0.2886534, -2.202273, 0, 1, 0.7372549, 1,
-0.09895302, 0.5691128, 0.7830085, 0, 1, 0.7411765, 1,
-0.09799054, -0.7496208, -3.474841, 0, 1, 0.7490196, 1,
-0.09579322, 0.4190483, -1.125085, 0, 1, 0.7529412, 1,
-0.09260327, 0.3960926, 0.5220112, 0, 1, 0.7607843, 1,
-0.09193634, 0.1760028, -1.066393, 0, 1, 0.7647059, 1,
-0.08971211, -0.1116977, -2.305463, 0, 1, 0.772549, 1,
-0.08874477, -0.3743541, -3.467774, 0, 1, 0.7764706, 1,
-0.08854835, -0.656075, -3.906166, 0, 1, 0.7843137, 1,
-0.0855194, -0.3375013, -2.529278, 0, 1, 0.7882353, 1,
-0.07448998, 0.5637973, -0.2712353, 0, 1, 0.7960784, 1,
-0.07028589, 0.8671972, -2.194017, 0, 1, 0.8039216, 1,
-0.06723684, 0.4508944, 0.9262768, 0, 1, 0.8078431, 1,
-0.06250254, 0.1577709, 0.3706224, 0, 1, 0.8156863, 1,
-0.05896087, 0.8296298, 0.5443728, 0, 1, 0.8196079, 1,
-0.05759478, -0.2909068, -3.501594, 0, 1, 0.827451, 1,
-0.05370905, 0.289357, -0.1370934, 0, 1, 0.8313726, 1,
-0.04933376, -0.03203363, -2.477794, 0, 1, 0.8392157, 1,
-0.04740201, 0.0006173705, -2.841756, 0, 1, 0.8431373, 1,
-0.04623506, -0.8576892, -4.2744, 0, 1, 0.8509804, 1,
-0.04474331, 0.4175926, -0.2332374, 0, 1, 0.854902, 1,
-0.04406361, 0.36292, 0.6920435, 0, 1, 0.8627451, 1,
-0.04276738, -0.1898315, -1.592792, 0, 1, 0.8666667, 1,
-0.04073735, -1.837978, -3.860182, 0, 1, 0.8745098, 1,
-0.03930967, 1.148006, -0.425326, 0, 1, 0.8784314, 1,
-0.03434793, -2.28247, -2.10761, 0, 1, 0.8862745, 1,
-0.03387426, -0.001048434, -2.21221, 0, 1, 0.8901961, 1,
-0.0319668, 0.1230354, -0.5049483, 0, 1, 0.8980392, 1,
-0.03169758, -0.0546381, -3.600182, 0, 1, 0.9058824, 1,
-0.02904628, 0.4821739, 1.486691, 0, 1, 0.9098039, 1,
-0.02565701, 1.521392, 2.098497, 0, 1, 0.9176471, 1,
-0.02367698, 1.491042, 0.2365638, 0, 1, 0.9215686, 1,
-0.02337725, -1.353264, -2.454547, 0, 1, 0.9294118, 1,
-0.02307677, -0.4762825, -0.6324344, 0, 1, 0.9333333, 1,
-0.02244766, 1.604558, -1.649507, 0, 1, 0.9411765, 1,
-0.01813146, 0.4609336, -0.4004708, 0, 1, 0.945098, 1,
-0.01366315, 0.8428878, -0.1857202, 0, 1, 0.9529412, 1,
-0.007755501, 0.1252794, 0.06620789, 0, 1, 0.9568627, 1,
-0.004803367, -0.06224867, -2.064863, 0, 1, 0.9647059, 1,
0.002111161, 0.9569418, 0.293663, 0, 1, 0.9686275, 1,
0.004534217, -1.298511, 3.399741, 0, 1, 0.9764706, 1,
0.009283264, -0.4489009, 2.836193, 0, 1, 0.9803922, 1,
0.009976621, 0.5237168, 0.05657211, 0, 1, 0.9882353, 1,
0.009984592, -0.2384682, 3.307598, 0, 1, 0.9921569, 1,
0.01534453, -0.6995754, 1.53614, 0, 1, 1, 1,
0.02740464, -1.021426, 2.50723, 0, 0.9921569, 1, 1,
0.03063553, -0.2071046, 2.78818, 0, 0.9882353, 1, 1,
0.0312512, -0.663331, 3.838829, 0, 0.9803922, 1, 1,
0.03574893, 0.3931037, -0.07987514, 0, 0.9764706, 1, 1,
0.04023719, 0.2379311, -0.6228954, 0, 0.9686275, 1, 1,
0.04032579, 0.5278875, 0.7453641, 0, 0.9647059, 1, 1,
0.0403281, -0.8592689, 3.462751, 0, 0.9568627, 1, 1,
0.04369554, 0.9299473, 0.5007042, 0, 0.9529412, 1, 1,
0.04466393, 0.999507, 1.983193, 0, 0.945098, 1, 1,
0.04706629, -0.3400279, 3.489938, 0, 0.9411765, 1, 1,
0.04745531, 0.264526, -1.002161, 0, 0.9333333, 1, 1,
0.04840489, 1.28586, -0.4924581, 0, 0.9294118, 1, 1,
0.05293307, -1.2312, 2.550857, 0, 0.9215686, 1, 1,
0.05362283, -0.424255, 3.234162, 0, 0.9176471, 1, 1,
0.05417045, 0.1985273, -0.6744328, 0, 0.9098039, 1, 1,
0.05521359, -0.721158, 3.422867, 0, 0.9058824, 1, 1,
0.06578542, 0.8062961, -0.3542084, 0, 0.8980392, 1, 1,
0.06709411, 0.8618727, -0.2198535, 0, 0.8901961, 1, 1,
0.0694532, -0.8469571, 2.88621, 0, 0.8862745, 1, 1,
0.07081063, -0.6711107, 3.598178, 0, 0.8784314, 1, 1,
0.07506807, 0.2657643, -0.08741869, 0, 0.8745098, 1, 1,
0.07700676, -1.423688, 3.579782, 0, 0.8666667, 1, 1,
0.0775991, 2.163207, -1.467785, 0, 0.8627451, 1, 1,
0.07835797, 0.5055535, -0.6674308, 0, 0.854902, 1, 1,
0.07867077, -0.7077694, 2.17504, 0, 0.8509804, 1, 1,
0.07891291, 1.365368, 0.716838, 0, 0.8431373, 1, 1,
0.0804985, -0.1342743, 2.923832, 0, 0.8392157, 1, 1,
0.08570926, 2.190098, -1.007126, 0, 0.8313726, 1, 1,
0.08620738, -0.9163752, 2.484107, 0, 0.827451, 1, 1,
0.09101398, -0.7414545, 2.90955, 0, 0.8196079, 1, 1,
0.09423123, -1.876864, 4.220532, 0, 0.8156863, 1, 1,
0.1017921, -0.8374271, 3.441797, 0, 0.8078431, 1, 1,
0.1060786, -1.086558, 3.478005, 0, 0.8039216, 1, 1,
0.1062347, -1.654618, 2.803219, 0, 0.7960784, 1, 1,
0.1123774, 1.050302, 1.699091, 0, 0.7882353, 1, 1,
0.1142571, -2.593269, 3.413385, 0, 0.7843137, 1, 1,
0.1184513, 1.627844, -0.08275409, 0, 0.7764706, 1, 1,
0.118626, 0.006886182, 1.241203, 0, 0.772549, 1, 1,
0.1186351, 0.1535819, -0.1188463, 0, 0.7647059, 1, 1,
0.1190006, 0.6215445, 0.8642933, 0, 0.7607843, 1, 1,
0.1216546, -0.9198741, 3.43019, 0, 0.7529412, 1, 1,
0.1271146, -0.1326974, 1.7481, 0, 0.7490196, 1, 1,
0.1271445, -0.721746, 2.895463, 0, 0.7411765, 1, 1,
0.1379652, 0.8561786, -0.6505898, 0, 0.7372549, 1, 1,
0.1407266, -0.70456, 1.018684, 0, 0.7294118, 1, 1,
0.1437482, -0.6544266, 2.956449, 0, 0.7254902, 1, 1,
0.145687, -0.4406263, 3.783312, 0, 0.7176471, 1, 1,
0.1471096, 1.627021, -0.2515088, 0, 0.7137255, 1, 1,
0.1478452, 0.9205292, -1.209906, 0, 0.7058824, 1, 1,
0.1479322, -0.4645825, 2.048109, 0, 0.6980392, 1, 1,
0.1560701, 1.527501, -2.005176, 0, 0.6941177, 1, 1,
0.1564744, 0.4241414, -0.2631888, 0, 0.6862745, 1, 1,
0.1594551, -0.2285571, 1.498983, 0, 0.682353, 1, 1,
0.161936, -0.5295125, 3.0555, 0, 0.6745098, 1, 1,
0.1638824, 0.7983485, 3.730779, 0, 0.6705883, 1, 1,
0.1645885, -0.2338349, 1.167874, 0, 0.6627451, 1, 1,
0.1693553, 1.300837, 1.12772, 0, 0.6588235, 1, 1,
0.1742983, 0.9372913, 0.1956159, 0, 0.6509804, 1, 1,
0.1750918, -1.674793, 3.354904, 0, 0.6470588, 1, 1,
0.1779951, -0.135235, 1.197492, 0, 0.6392157, 1, 1,
0.1782359, 0.9231391, 1.427104, 0, 0.6352941, 1, 1,
0.183127, -1.593925, 2.889099, 0, 0.627451, 1, 1,
0.184698, -1.150705, 3.985715, 0, 0.6235294, 1, 1,
0.1848063, 0.2465937, -0.191046, 0, 0.6156863, 1, 1,
0.1855602, -1.002275, 2.282674, 0, 0.6117647, 1, 1,
0.1898094, -0.6788454, 2.338956, 0, 0.6039216, 1, 1,
0.1915777, -0.04126283, 1.034807, 0, 0.5960785, 1, 1,
0.1918456, -1.709307, 2.191726, 0, 0.5921569, 1, 1,
0.192205, 2.49497, 0.2757096, 0, 0.5843138, 1, 1,
0.1931034, -0.6923363, 3.506902, 0, 0.5803922, 1, 1,
0.1937746, 0.5668918, 2.423019, 0, 0.572549, 1, 1,
0.2050215, -1.135096, 3.259573, 0, 0.5686275, 1, 1,
0.2126959, -0.3415647, 2.782686, 0, 0.5607843, 1, 1,
0.213233, 0.4186834, 2.380473, 0, 0.5568628, 1, 1,
0.2219565, 2.835181, 0.01405133, 0, 0.5490196, 1, 1,
0.2229604, -1.129711, 2.451603, 0, 0.5450981, 1, 1,
0.2231105, -0.2704812, 1.937649, 0, 0.5372549, 1, 1,
0.2296009, -0.6371734, 3.983742, 0, 0.5333334, 1, 1,
0.2324203, 0.6149408, 0.4210246, 0, 0.5254902, 1, 1,
0.2334088, 0.05787673, -0.2654469, 0, 0.5215687, 1, 1,
0.2396153, -0.7169997, 2.718572, 0, 0.5137255, 1, 1,
0.2408357, -0.6290893, 2.446079, 0, 0.509804, 1, 1,
0.2435529, -0.187329, 1.903532, 0, 0.5019608, 1, 1,
0.2461317, 1.317798, -0.2562987, 0, 0.4941176, 1, 1,
0.2485005, -0.2387417, 2.858533, 0, 0.4901961, 1, 1,
0.2490236, 1.183634, -0.0214456, 0, 0.4823529, 1, 1,
0.2506903, 2.302054, 0.7698788, 0, 0.4784314, 1, 1,
0.2549655, -0.07556656, 1.264319, 0, 0.4705882, 1, 1,
0.2551697, -0.4434592, 2.657914, 0, 0.4666667, 1, 1,
0.2566079, 0.4920926, 2.06035, 0, 0.4588235, 1, 1,
0.2580247, -0.3862137, 3.456759, 0, 0.454902, 1, 1,
0.2594172, -0.09804748, 1.183228, 0, 0.4470588, 1, 1,
0.2679518, 0.07187402, 1.200628, 0, 0.4431373, 1, 1,
0.2683496, 0.4798421, 0.4891017, 0, 0.4352941, 1, 1,
0.2700069, 0.2664902, -1.287275, 0, 0.4313726, 1, 1,
0.2723171, 0.1567853, 1.847681, 0, 0.4235294, 1, 1,
0.2723281, -0.2401592, 3.85206, 0, 0.4196078, 1, 1,
0.2738629, 0.3690302, 1.612402, 0, 0.4117647, 1, 1,
0.2760512, -0.8727048, 2.819196, 0, 0.4078431, 1, 1,
0.2781946, -2.164511, 3.556045, 0, 0.4, 1, 1,
0.2783163, -0.8823819, 1.940097, 0, 0.3921569, 1, 1,
0.2795332, -0.08799421, 1.095709, 0, 0.3882353, 1, 1,
0.2798328, 0.3846531, -0.3072307, 0, 0.3803922, 1, 1,
0.2813693, 0.03299358, 0.7772859, 0, 0.3764706, 1, 1,
0.2857354, -0.1778643, 1.999279, 0, 0.3686275, 1, 1,
0.2987152, 0.05719274, 2.301022, 0, 0.3647059, 1, 1,
0.2994135, -0.6688552, 0.9972377, 0, 0.3568628, 1, 1,
0.3013135, 0.3797162, 1.415087, 0, 0.3529412, 1, 1,
0.3018179, 1.864722, 0.02941034, 0, 0.345098, 1, 1,
0.3020048, 2.317559, -0.0905484, 0, 0.3411765, 1, 1,
0.308958, -1.605468, 3.426826, 0, 0.3333333, 1, 1,
0.3097671, -1.774501, 2.891548, 0, 0.3294118, 1, 1,
0.3177272, 0.8559231, 1.490211, 0, 0.3215686, 1, 1,
0.3177753, -0.2329586, -1.139929, 0, 0.3176471, 1, 1,
0.3184599, -2.725264, 2.11296, 0, 0.3098039, 1, 1,
0.3204373, -1.044916, 3.532963, 0, 0.3058824, 1, 1,
0.3253154, 0.9959778, 1.956072, 0, 0.2980392, 1, 1,
0.3316634, 1.519672, 0.0940186, 0, 0.2901961, 1, 1,
0.3345473, 1.206993, 0.2402125, 0, 0.2862745, 1, 1,
0.3358718, -0.3191886, 1.513677, 0, 0.2784314, 1, 1,
0.3395894, -0.2672777, 4.280749, 0, 0.2745098, 1, 1,
0.3441253, 0.1362691, -0.4376099, 0, 0.2666667, 1, 1,
0.3555608, -0.2343271, 1.432142, 0, 0.2627451, 1, 1,
0.3569842, -2.014366, 3.057652, 0, 0.254902, 1, 1,
0.3595019, 1.570741, 0.3796689, 0, 0.2509804, 1, 1,
0.3614047, 1.939672, 0.6870736, 0, 0.2431373, 1, 1,
0.3649786, 0.2033255, 2.699471, 0, 0.2392157, 1, 1,
0.3681728, 1.05309, -0.235122, 0, 0.2313726, 1, 1,
0.3717878, 0.6484615, 0.01014748, 0, 0.227451, 1, 1,
0.3728828, 0.03180047, 1.807583, 0, 0.2196078, 1, 1,
0.3768144, 0.3129181, -0.3816386, 0, 0.2156863, 1, 1,
0.3769805, 0.1277634, -0.267646, 0, 0.2078431, 1, 1,
0.380654, -1.377499, 1.377836, 0, 0.2039216, 1, 1,
0.3817765, -0.5945621, 3.190296, 0, 0.1960784, 1, 1,
0.3892758, 0.7870127, 0.2137357, 0, 0.1882353, 1, 1,
0.3905266, 0.7418918, -0.9505676, 0, 0.1843137, 1, 1,
0.3933771, 1.668021, -0.1402954, 0, 0.1764706, 1, 1,
0.39476, 0.2067082, 1.073835, 0, 0.172549, 1, 1,
0.3954326, 0.2795952, 1.408665, 0, 0.1647059, 1, 1,
0.3959916, -0.2000886, 1.998443, 0, 0.1607843, 1, 1,
0.4109008, 0.7080476, 1.206288, 0, 0.1529412, 1, 1,
0.414986, -1.306639, 2.792743, 0, 0.1490196, 1, 1,
0.4178049, -1.038017, 4.895339, 0, 0.1411765, 1, 1,
0.4210319, 0.1433399, -0.2129703, 0, 0.1372549, 1, 1,
0.4210462, -1.763463, 2.719351, 0, 0.1294118, 1, 1,
0.4220336, 0.7601344, 0.5675423, 0, 0.1254902, 1, 1,
0.4241975, 0.4858044, 0.03580449, 0, 0.1176471, 1, 1,
0.4244339, -0.6229371, 1.707475, 0, 0.1137255, 1, 1,
0.425774, 0.5861267, 1.669817, 0, 0.1058824, 1, 1,
0.4293429, -0.05648509, 0.8333256, 0, 0.09803922, 1, 1,
0.4308867, 2.144315, 1.895709, 0, 0.09411765, 1, 1,
0.4318316, 0.3202492, 2.184766, 0, 0.08627451, 1, 1,
0.4376021, 0.3928007, -0.927265, 0, 0.08235294, 1, 1,
0.4378188, -0.215254, 1.071954, 0, 0.07450981, 1, 1,
0.4421095, 0.01035173, 0.3070111, 0, 0.07058824, 1, 1,
0.4433364, -2.444086, 2.76475, 0, 0.0627451, 1, 1,
0.4433525, 0.824632, 1.096478, 0, 0.05882353, 1, 1,
0.4452083, -1.511207, 3.17175, 0, 0.05098039, 1, 1,
0.4461947, 0.580303, 0.06237854, 0, 0.04705882, 1, 1,
0.4513147, 0.9180978, 0.4328255, 0, 0.03921569, 1, 1,
0.4557433, -1.032206, 3.187611, 0, 0.03529412, 1, 1,
0.4593199, -0.7361878, 4.756477, 0, 0.02745098, 1, 1,
0.4621527, -0.2645169, 2.674816, 0, 0.02352941, 1, 1,
0.4633768, 0.1122274, 0.6442955, 0, 0.01568628, 1, 1,
0.4647667, 1.694227, 0.8713902, 0, 0.01176471, 1, 1,
0.467067, -0.1984949, -0.2784348, 0, 0.003921569, 1, 1,
0.4723198, -0.2442745, 2.967202, 0.003921569, 0, 1, 1,
0.4737086, 1.015133, 1.186926, 0.007843138, 0, 1, 1,
0.4785059, 0.6788656, 1.333644, 0.01568628, 0, 1, 1,
0.4785744, -1.525141, 1.30766, 0.01960784, 0, 1, 1,
0.4822992, -0.1010749, 1.361911, 0.02745098, 0, 1, 1,
0.4832742, -0.9270735, 3.864293, 0.03137255, 0, 1, 1,
0.4900973, -0.6187751, 0.6519455, 0.03921569, 0, 1, 1,
0.4923041, -0.7452066, 1.130663, 0.04313726, 0, 1, 1,
0.4926807, 0.442252, -0.03523582, 0.05098039, 0, 1, 1,
0.4994566, -1.281793, 4.89537, 0.05490196, 0, 1, 1,
0.5000365, 0.3159619, 0.724261, 0.0627451, 0, 1, 1,
0.5001486, -1.08333, 1.624554, 0.06666667, 0, 1, 1,
0.5025405, 0.646272, -0.6544591, 0.07450981, 0, 1, 1,
0.5087661, -1.070367, 2.381658, 0.07843138, 0, 1, 1,
0.508828, -1.54929, 3.398346, 0.08627451, 0, 1, 1,
0.5109755, 0.2456266, 2.987352, 0.09019608, 0, 1, 1,
0.512194, 0.5382569, 1.141517, 0.09803922, 0, 1, 1,
0.5127802, 0.2524799, 1.360658, 0.1058824, 0, 1, 1,
0.513351, 1.349244, -1.085036, 0.1098039, 0, 1, 1,
0.5160586, -1.160876, 2.888111, 0.1176471, 0, 1, 1,
0.5164229, -1.456929, 2.92319, 0.1215686, 0, 1, 1,
0.5205032, -0.2985646, 2.479403, 0.1294118, 0, 1, 1,
0.5255064, 0.6244085, 0.954461, 0.1333333, 0, 1, 1,
0.5316463, 0.3724301, 0.2105901, 0.1411765, 0, 1, 1,
0.5321963, -0.4496126, 1.364177, 0.145098, 0, 1, 1,
0.5324758, 0.08776392, 1.550325, 0.1529412, 0, 1, 1,
0.5400132, -0.4732877, 2.217052, 0.1568628, 0, 1, 1,
0.5495538, 0.5630234, -0.06626099, 0.1647059, 0, 1, 1,
0.5522854, 1.272089, -1.136501, 0.1686275, 0, 1, 1,
0.5542501, 0.2969167, 1.8047, 0.1764706, 0, 1, 1,
0.5565351, -0.7373121, 3.285576, 0.1803922, 0, 1, 1,
0.5586723, -0.3012838, 2.233105, 0.1882353, 0, 1, 1,
0.5627776, -1.34219, 2.804192, 0.1921569, 0, 1, 1,
0.5732687, 0.8470363, -0.8487286, 0.2, 0, 1, 1,
0.5758251, 0.5131363, -0.5749774, 0.2078431, 0, 1, 1,
0.5771116, 0.6843484, 0.5673371, 0.2117647, 0, 1, 1,
0.5780045, -0.7645845, 2.467012, 0.2196078, 0, 1, 1,
0.5782831, -1.015169, 3.339246, 0.2235294, 0, 1, 1,
0.5809512, -0.2981596, 3.305133, 0.2313726, 0, 1, 1,
0.5818932, -0.3809091, 0.7551981, 0.2352941, 0, 1, 1,
0.5828854, 1.057703, 0.209655, 0.2431373, 0, 1, 1,
0.5835118, -0.7324664, 2.859249, 0.2470588, 0, 1, 1,
0.5887129, -0.1763646, 0.8399618, 0.254902, 0, 1, 1,
0.5902864, -0.07569814, 0.7710925, 0.2588235, 0, 1, 1,
0.5960913, 0.436946, 1.002475, 0.2666667, 0, 1, 1,
0.6009634, 0.3878816, 1.480587, 0.2705882, 0, 1, 1,
0.6025303, -0.2421877, 1.864445, 0.2784314, 0, 1, 1,
0.6037318, 0.3172459, 0.9640958, 0.282353, 0, 1, 1,
0.6044479, -0.9861499, 1.042814, 0.2901961, 0, 1, 1,
0.6064765, 0.423801, 1.485177, 0.2941177, 0, 1, 1,
0.6088751, -2.267603, 4.630342, 0.3019608, 0, 1, 1,
0.6095886, -0.03520471, 2.315622, 0.3098039, 0, 1, 1,
0.6100149, -0.1728733, 0.2691865, 0.3137255, 0, 1, 1,
0.610275, 0.03995502, 0.9260799, 0.3215686, 0, 1, 1,
0.6106838, -0.7651728, 2.009965, 0.3254902, 0, 1, 1,
0.6115983, 1.668357, -0.1421446, 0.3333333, 0, 1, 1,
0.6140999, -0.9178988, 1.003564, 0.3372549, 0, 1, 1,
0.617727, -0.00580732, 0.194881, 0.345098, 0, 1, 1,
0.6181588, -0.8636366, 2.694047, 0.3490196, 0, 1, 1,
0.6207686, 0.6171511, -0.4349654, 0.3568628, 0, 1, 1,
0.6208389, 0.6935661, -0.6048021, 0.3607843, 0, 1, 1,
0.6337519, -1.802915, 1.879061, 0.3686275, 0, 1, 1,
0.6389974, -0.8777652, 4.931028, 0.372549, 0, 1, 1,
0.6426954, 0.1489028, 1.14703, 0.3803922, 0, 1, 1,
0.6437195, 1.037904, 0.9361394, 0.3843137, 0, 1, 1,
0.6468336, -1.099622, 2.499798, 0.3921569, 0, 1, 1,
0.6506721, -0.8411461, 2.886674, 0.3960784, 0, 1, 1,
0.6533754, 1.958186, -0.5390689, 0.4039216, 0, 1, 1,
0.653376, -0.6066057, 3.135278, 0.4117647, 0, 1, 1,
0.6628275, -0.3266221, 2.070581, 0.4156863, 0, 1, 1,
0.6631119, 0.5390965, 2.787012, 0.4235294, 0, 1, 1,
0.6633028, -2.182518, 2.791151, 0.427451, 0, 1, 1,
0.6639262, 1.072857, 0.3959812, 0.4352941, 0, 1, 1,
0.6644343, 1.669372, -0.09742303, 0.4392157, 0, 1, 1,
0.6684456, 1.346498, 2.652261, 0.4470588, 0, 1, 1,
0.6791592, -0.5772791, 2.333579, 0.4509804, 0, 1, 1,
0.6806645, 1.735127, -0.06986921, 0.4588235, 0, 1, 1,
0.6807085, 1.430758, 0.2263188, 0.4627451, 0, 1, 1,
0.6836484, 1.780642, 1.559331, 0.4705882, 0, 1, 1,
0.6973082, 1.617919, -3.203625, 0.4745098, 0, 1, 1,
0.7004133, 1.402585, -1.137221, 0.4823529, 0, 1, 1,
0.7031006, -0.417247, 1.908948, 0.4862745, 0, 1, 1,
0.7091768, -0.2460236, -0.01063336, 0.4941176, 0, 1, 1,
0.7119395, -2.51642, 2.773598, 0.5019608, 0, 1, 1,
0.7128931, -2.109406, 3.727996, 0.5058824, 0, 1, 1,
0.7167037, 0.4848286, 1.850507, 0.5137255, 0, 1, 1,
0.7235641, -0.3221075, 1.207311, 0.5176471, 0, 1, 1,
0.7299428, -1.17826, 1.906618, 0.5254902, 0, 1, 1,
0.7320263, 0.8498424, -0.8708146, 0.5294118, 0, 1, 1,
0.7337984, 0.4936047, 1.869215, 0.5372549, 0, 1, 1,
0.734849, 0.2900375, 2.566977, 0.5411765, 0, 1, 1,
0.735527, -0.1539309, 0.334904, 0.5490196, 0, 1, 1,
0.7408182, -0.6557574, 2.489753, 0.5529412, 0, 1, 1,
0.7421367, -1.115493, 2.624711, 0.5607843, 0, 1, 1,
0.7423518, 0.1868627, 1.411769, 0.5647059, 0, 1, 1,
0.7454494, -0.1939968, 0.1035087, 0.572549, 0, 1, 1,
0.7502083, -0.03541651, 3.569779, 0.5764706, 0, 1, 1,
0.7536376, 1.196758, 0.5758111, 0.5843138, 0, 1, 1,
0.7541829, 0.2350461, 0.1221198, 0.5882353, 0, 1, 1,
0.764579, 1.532637, -0.4382431, 0.5960785, 0, 1, 1,
0.7675959, 0.3406221, 3.896643, 0.6039216, 0, 1, 1,
0.7690593, 0.7987455, 2.166355, 0.6078432, 0, 1, 1,
0.7694954, 0.5576996, 2.227807, 0.6156863, 0, 1, 1,
0.7750828, 0.1097777, 0.9896554, 0.6196079, 0, 1, 1,
0.7779159, -0.2163038, 2.464593, 0.627451, 0, 1, 1,
0.7822384, 0.5077253, 1.823018, 0.6313726, 0, 1, 1,
0.7909234, -1.072005, 2.007832, 0.6392157, 0, 1, 1,
0.794203, -0.2091428, 1.378236, 0.6431373, 0, 1, 1,
0.8012399, -0.8191053, 0.3645562, 0.6509804, 0, 1, 1,
0.8030555, 0.06793812, 1.496353, 0.654902, 0, 1, 1,
0.8036869, 0.9294725, 0.7454391, 0.6627451, 0, 1, 1,
0.8038597, -0.4184285, 1.916333, 0.6666667, 0, 1, 1,
0.807328, 2.025365, -0.3295086, 0.6745098, 0, 1, 1,
0.8164729, 2.108284, 1.751377, 0.6784314, 0, 1, 1,
0.8177114, 0.7750028, -0.4104715, 0.6862745, 0, 1, 1,
0.8222169, -0.05815005, 1.488466, 0.6901961, 0, 1, 1,
0.8236376, 0.5490072, 0.9883046, 0.6980392, 0, 1, 1,
0.8255261, -0.2874154, 2.436716, 0.7058824, 0, 1, 1,
0.8283572, -0.3554909, 2.584629, 0.7098039, 0, 1, 1,
0.8298376, -0.4358598, 2.864324, 0.7176471, 0, 1, 1,
0.8308176, 1.303574, 1.444805, 0.7215686, 0, 1, 1,
0.8324238, -0.1028662, 1.334205, 0.7294118, 0, 1, 1,
0.8484321, 0.7923766, 0.8898075, 0.7333333, 0, 1, 1,
0.8487872, -1.596773, 2.225611, 0.7411765, 0, 1, 1,
0.8558788, -0.1395498, 2.288522, 0.7450981, 0, 1, 1,
0.8597351, 0.7086093, 0.5132016, 0.7529412, 0, 1, 1,
0.8602868, -0.107944, 2.305825, 0.7568628, 0, 1, 1,
0.873558, 0.8892465, 2.072608, 0.7647059, 0, 1, 1,
0.8774254, 0.0780401, 3.867085, 0.7686275, 0, 1, 1,
0.8809795, -0.7001467, 2.915761, 0.7764706, 0, 1, 1,
0.8814505, -0.4249238, 1.606981, 0.7803922, 0, 1, 1,
0.8937075, 1.148999, 0.8838513, 0.7882353, 0, 1, 1,
0.8945284, 0.3666832, 0.7265518, 0.7921569, 0, 1, 1,
0.8968406, -0.2155966, 2.128014, 0.8, 0, 1, 1,
0.9052837, 1.311282, -0.09479234, 0.8078431, 0, 1, 1,
0.9077358, 0.1578145, -0.9769708, 0.8117647, 0, 1, 1,
0.9176657, 0.3364256, 1.604482, 0.8196079, 0, 1, 1,
0.9246315, 2.010819, 1.188803, 0.8235294, 0, 1, 1,
0.9272308, -0.3248545, 1.42475, 0.8313726, 0, 1, 1,
0.9318435, -0.8724874, 1.514067, 0.8352941, 0, 1, 1,
0.9325331, 1.158893, 1.455778, 0.8431373, 0, 1, 1,
0.9345118, -0.1721499, 2.462883, 0.8470588, 0, 1, 1,
0.9372499, 0.6278629, 0.4813157, 0.854902, 0, 1, 1,
0.9386544, 0.570785, 0.7097538, 0.8588235, 0, 1, 1,
0.9390807, 0.6281295, 2.536333, 0.8666667, 0, 1, 1,
0.94433, -0.8428088, 4.492608, 0.8705882, 0, 1, 1,
0.9473457, -0.9450689, 3.766036, 0.8784314, 0, 1, 1,
0.9482264, -1.215623, 3.129425, 0.8823529, 0, 1, 1,
0.9486201, -0.2845429, 0.9900295, 0.8901961, 0, 1, 1,
0.9532157, -0.01161564, 1.544508, 0.8941177, 0, 1, 1,
0.953654, -0.6428375, 2.769416, 0.9019608, 0, 1, 1,
0.9599491, 2.078153, -0.2442652, 0.9098039, 0, 1, 1,
0.9677438, -1.054533, 1.892607, 0.9137255, 0, 1, 1,
0.9703674, -0.9449837, 4.03383, 0.9215686, 0, 1, 1,
0.9733031, -0.2945733, 1.145529, 0.9254902, 0, 1, 1,
0.9773459, -0.04973049, 1.965005, 0.9333333, 0, 1, 1,
0.9790344, 1.875401, 3.084861, 0.9372549, 0, 1, 1,
0.9815339, 0.9476063, 1.980519, 0.945098, 0, 1, 1,
0.9896578, -0.8822048, 2.280419, 0.9490196, 0, 1, 1,
0.9913157, 0.9039771, 1.629424, 0.9568627, 0, 1, 1,
0.9924508, -0.6748678, 2.552629, 0.9607843, 0, 1, 1,
0.9950582, 1.856992, -0.1059715, 0.9686275, 0, 1, 1,
1.004674, 0.8731309, 2.326008, 0.972549, 0, 1, 1,
1.005334, -0.3025738, 1.109342, 0.9803922, 0, 1, 1,
1.013904, 2.014427, -0.1854801, 0.9843137, 0, 1, 1,
1.014452, 0.3956121, 2.162863, 0.9921569, 0, 1, 1,
1.020355, -0.2914446, 3.789228, 0.9960784, 0, 1, 1,
1.024924, 0.7329151, -0.6918234, 1, 0, 0.9960784, 1,
1.027941, 0.9240998, 2.773915, 1, 0, 0.9882353, 1,
1.031593, 0.8900326, -0.1314537, 1, 0, 0.9843137, 1,
1.033887, -0.4329923, 1.270664, 1, 0, 0.9764706, 1,
1.034795, 0.480903, 1.241614, 1, 0, 0.972549, 1,
1.036126, 0.09971631, 2.071814, 1, 0, 0.9647059, 1,
1.040367, -0.5956496, 1.30499, 1, 0, 0.9607843, 1,
1.042043, -0.9011202, 3.631644, 1, 0, 0.9529412, 1,
1.047613, 1.318009, 0.1986089, 1, 0, 0.9490196, 1,
1.050534, 0.5173338, 2.821908, 1, 0, 0.9411765, 1,
1.058989, 0.5524218, 0.5935303, 1, 0, 0.9372549, 1,
1.060523, 0.9511976, 2.882837, 1, 0, 0.9294118, 1,
1.071172, 1.06879, 2.511068, 1, 0, 0.9254902, 1,
1.073381, 0.2757521, 1.401725, 1, 0, 0.9176471, 1,
1.076064, 1.85808, -0.7735017, 1, 0, 0.9137255, 1,
1.077106, 0.444373, 1.431587, 1, 0, 0.9058824, 1,
1.078508, 0.8105497, 2.556295, 1, 0, 0.9019608, 1,
1.08361, -0.1925953, 1.326475, 1, 0, 0.8941177, 1,
1.094202, 0.9120129, 1.787929, 1, 0, 0.8862745, 1,
1.098415, 0.1604084, 2.135035, 1, 0, 0.8823529, 1,
1.100706, 0.6175464, 1.384637, 1, 0, 0.8745098, 1,
1.103646, 0.4228542, 0.4936873, 1, 0, 0.8705882, 1,
1.10551, -0.3966381, 2.506567, 1, 0, 0.8627451, 1,
1.109564, 1.667444, 0.6321856, 1, 0, 0.8588235, 1,
1.113204, -0.06722698, 1.429895, 1, 0, 0.8509804, 1,
1.113449, -0.7246461, 2.897907, 1, 0, 0.8470588, 1,
1.129742, -0.7243964, 1.970235, 1, 0, 0.8392157, 1,
1.13524, -0.487823, 2.163611, 1, 0, 0.8352941, 1,
1.13775, 1.058344, -0.2679184, 1, 0, 0.827451, 1,
1.144196, -0.5026026, 1.688636, 1, 0, 0.8235294, 1,
1.14683, -0.227864, 1.617833, 1, 0, 0.8156863, 1,
1.148625, 2.682433, 1.666361, 1, 0, 0.8117647, 1,
1.158026, -1.42376, 1.049542, 1, 0, 0.8039216, 1,
1.158685, -0.6599609, -0.8205334, 1, 0, 0.7960784, 1,
1.159728, -1.889791, 3.163314, 1, 0, 0.7921569, 1,
1.163433, -0.6466136, 1.932187, 1, 0, 0.7843137, 1,
1.16594, 0.7159226, 0.7349595, 1, 0, 0.7803922, 1,
1.168353, 1.335636, -1.489405, 1, 0, 0.772549, 1,
1.175504, -1.645083, 4.911273, 1, 0, 0.7686275, 1,
1.175749, -0.4574539, 1.798507, 1, 0, 0.7607843, 1,
1.192699, 0.1993013, 2.154699, 1, 0, 0.7568628, 1,
1.196123, -1.474993, 1.849429, 1, 0, 0.7490196, 1,
1.199662, 1.307695, -0.3169911, 1, 0, 0.7450981, 1,
1.200183, -0.07163474, 2.825556, 1, 0, 0.7372549, 1,
1.206268, 0.2983839, 0.5603357, 1, 0, 0.7333333, 1,
1.206964, 1.31056, 0.5309817, 1, 0, 0.7254902, 1,
1.20786, 0.4521949, 0.8379051, 1, 0, 0.7215686, 1,
1.208402, -1.781408, 3.817658, 1, 0, 0.7137255, 1,
1.209425, 0.3841769, -0.2038211, 1, 0, 0.7098039, 1,
1.213504, -0.9027841, 0.9279072, 1, 0, 0.7019608, 1,
1.213786, -0.5901564, 0.7202504, 1, 0, 0.6941177, 1,
1.216089, 0.04451418, 1.762818, 1, 0, 0.6901961, 1,
1.216326, 1.770967, 0.2884512, 1, 0, 0.682353, 1,
1.231268, -1.721021, 2.496243, 1, 0, 0.6784314, 1,
1.2354, -0.8492929, 3.467096, 1, 0, 0.6705883, 1,
1.258894, -0.2368184, 2.172232, 1, 0, 0.6666667, 1,
1.26139, 0.7695636, 1.164434, 1, 0, 0.6588235, 1,
1.286117, 1.81398, 0.7601802, 1, 0, 0.654902, 1,
1.286641, 0.7896425, 0.7658886, 1, 0, 0.6470588, 1,
1.29715, 0.4598071, 0.3858967, 1, 0, 0.6431373, 1,
1.306386, -0.05980794, 0.8498341, 1, 0, 0.6352941, 1,
1.30899, -1.074767, 3.7271, 1, 0, 0.6313726, 1,
1.316302, 0.08433226, 2.010127, 1, 0, 0.6235294, 1,
1.317966, -0.7880436, 0.004962473, 1, 0, 0.6196079, 1,
1.320884, 0.4152683, 2.135737, 1, 0, 0.6117647, 1,
1.329853, -0.4638558, 0.3445228, 1, 0, 0.6078432, 1,
1.340479, 0.2665934, 2.066818, 1, 0, 0.6, 1,
1.351508, -0.5432475, 0.9527799, 1, 0, 0.5921569, 1,
1.35372, -0.8692017, 0.7128372, 1, 0, 0.5882353, 1,
1.357275, -2.349949, 2.235459, 1, 0, 0.5803922, 1,
1.358595, -0.4096514, 2.526118, 1, 0, 0.5764706, 1,
1.358724, 0.519464, 2.22735, 1, 0, 0.5686275, 1,
1.362713, 1.160364, 1.243592, 1, 0, 0.5647059, 1,
1.363933, -0.6753448, 2.319656, 1, 0, 0.5568628, 1,
1.36843, -1.960377, 3.35888, 1, 0, 0.5529412, 1,
1.37608, 0.9638897, 1.403885, 1, 0, 0.5450981, 1,
1.389776, 0.659282, 1.369681, 1, 0, 0.5411765, 1,
1.397828, -0.6165457, 3.136718, 1, 0, 0.5333334, 1,
1.398085, 0.3968196, 1.509432, 1, 0, 0.5294118, 1,
1.404498, -0.534553, 1.860211, 1, 0, 0.5215687, 1,
1.410586, -0.151608, 2.959072, 1, 0, 0.5176471, 1,
1.426738, 0.09160971, 1.058778, 1, 0, 0.509804, 1,
1.431885, 0.9455885, 1.738961, 1, 0, 0.5058824, 1,
1.441623, 1.423846, 0.1125274, 1, 0, 0.4980392, 1,
1.455238, 0.8771093, -0.2157082, 1, 0, 0.4901961, 1,
1.46687, 0.1015773, 0.6655659, 1, 0, 0.4862745, 1,
1.46927, -1.132071, 0.7249329, 1, 0, 0.4784314, 1,
1.472402, -1.058305, 2.818043, 1, 0, 0.4745098, 1,
1.484605, 2.61433, -0.8883523, 1, 0, 0.4666667, 1,
1.490976, 1.027875, 0.2886772, 1, 0, 0.4627451, 1,
1.491133, 2.097891, 1.880369, 1, 0, 0.454902, 1,
1.491477, -0.4327905, 2.857656, 1, 0, 0.4509804, 1,
1.50261, -2.690092, 2.26616, 1, 0, 0.4431373, 1,
1.503844, -0.5325782, 2.142894, 1, 0, 0.4392157, 1,
1.509819, -0.2992558, 3.51993, 1, 0, 0.4313726, 1,
1.511602, -0.9651843, 2.585488, 1, 0, 0.427451, 1,
1.514004, 0.2055457, 2.899119, 1, 0, 0.4196078, 1,
1.527394, -1.723886, 1.802292, 1, 0, 0.4156863, 1,
1.536216, -0.09974957, 2.5319, 1, 0, 0.4078431, 1,
1.543966, -0.5020531, 1.509772, 1, 0, 0.4039216, 1,
1.564006, -1.865634, 0.7920322, 1, 0, 0.3960784, 1,
1.565902, 1.1476, 0.1582996, 1, 0, 0.3882353, 1,
1.566846, -1.923656, 4.092152, 1, 0, 0.3843137, 1,
1.574224, -0.6042657, 3.8858, 1, 0, 0.3764706, 1,
1.582881, 1.406745, 1.07931, 1, 0, 0.372549, 1,
1.612511, -0.1776046, 0.9962549, 1, 0, 0.3647059, 1,
1.626318, -0.9833741, 1.643713, 1, 0, 0.3607843, 1,
1.629941, 2.376392, -0.3970702, 1, 0, 0.3529412, 1,
1.635628, -1.546607, 1.92432, 1, 0, 0.3490196, 1,
1.641011, -0.3900519, 2.801651, 1, 0, 0.3411765, 1,
1.649234, 0.607757, 0.9246107, 1, 0, 0.3372549, 1,
1.658053, 0.8564584, 1.539268, 1, 0, 0.3294118, 1,
1.670271, 1.269305, -0.8822244, 1, 0, 0.3254902, 1,
1.673277, -1.005948, 3.462728, 1, 0, 0.3176471, 1,
1.67577, 0.3482052, 1.688785, 1, 0, 0.3137255, 1,
1.679388, 0.7158958, 1.870139, 1, 0, 0.3058824, 1,
1.762431, 0.0519806, 0.9381614, 1, 0, 0.2980392, 1,
1.768209, -0.451619, 2.508351, 1, 0, 0.2941177, 1,
1.797723, 1.333465, -0.337539, 1, 0, 0.2862745, 1,
1.819166, -0.2451532, 0.200343, 1, 0, 0.282353, 1,
1.820743, -0.06870598, 2.066515, 1, 0, 0.2745098, 1,
1.84242, -0.5698448, 1.386004, 1, 0, 0.2705882, 1,
1.85484, 1.782412, 0.7182063, 1, 0, 0.2627451, 1,
1.875737, -1.179758, 2.053442, 1, 0, 0.2588235, 1,
1.888519, -0.4818701, 3.747451, 1, 0, 0.2509804, 1,
1.926914, 0.5137667, 1.813854, 1, 0, 0.2470588, 1,
1.930083, 0.4409448, 1.390573, 1, 0, 0.2392157, 1,
1.932932, -0.5754499, 1.358622, 1, 0, 0.2352941, 1,
1.975106, 0.7744195, 0.331168, 1, 0, 0.227451, 1,
1.989221, -0.4152725, 1.743369, 1, 0, 0.2235294, 1,
1.99123, 0.08779818, 2.350326, 1, 0, 0.2156863, 1,
1.9999, -0.7191948, 1.26931, 1, 0, 0.2117647, 1,
2.004955, -0.08825221, 0.843083, 1, 0, 0.2039216, 1,
2.005643, 0.2261598, 2.242867, 1, 0, 0.1960784, 1,
2.010326, -0.3541201, 0.6911376, 1, 0, 0.1921569, 1,
2.020969, -0.6744255, 3.318994, 1, 0, 0.1843137, 1,
2.055289, 0.9732271, 0.7884321, 1, 0, 0.1803922, 1,
2.104557, -0.6073888, 2.43139, 1, 0, 0.172549, 1,
2.127636, -1.513532, 2.106245, 1, 0, 0.1686275, 1,
2.173498, 0.1641072, 1.149656, 1, 0, 0.1607843, 1,
2.177519, 0.3224045, 0.2569751, 1, 0, 0.1568628, 1,
2.181712, -1.429781, 2.319754, 1, 0, 0.1490196, 1,
2.195879, -1.7883, 3.525151, 1, 0, 0.145098, 1,
2.213124, -0.9673393, 3.1112, 1, 0, 0.1372549, 1,
2.224105, 0.4167351, 2.432736, 1, 0, 0.1333333, 1,
2.23446, 0.8127795, 0.6844774, 1, 0, 0.1254902, 1,
2.259167, -0.8096728, 0.03255627, 1, 0, 0.1215686, 1,
2.272731, 1.546992, 0.433691, 1, 0, 0.1137255, 1,
2.301151, -0.4916888, 2.069075, 1, 0, 0.1098039, 1,
2.345332, -0.7011117, 1.798659, 1, 0, 0.1019608, 1,
2.419337, -0.9668693, 0.9875631, 1, 0, 0.09411765, 1,
2.427172, 0.6157455, 2.396493, 1, 0, 0.09019608, 1,
2.460788, -0.7595174, 2.157664, 1, 0, 0.08235294, 1,
2.477804, 0.4927418, -0.541185, 1, 0, 0.07843138, 1,
2.483536, -0.3752226, -0.4499559, 1, 0, 0.07058824, 1,
2.546607, 1.754813, 1.313234, 1, 0, 0.06666667, 1,
2.582615, -0.2720959, 2.515886, 1, 0, 0.05882353, 1,
2.613428, -0.3330444, 1.239814, 1, 0, 0.05490196, 1,
2.780226, -0.5799878, 1.789554, 1, 0, 0.04705882, 1,
2.791634, 0.5736359, 1.445852, 1, 0, 0.04313726, 1,
2.829006, -0.3677267, 1.882143, 1, 0, 0.03529412, 1,
2.83171, 0.8454525, 1.881151, 1, 0, 0.03137255, 1,
2.879599, -0.2756231, 0.8394637, 1, 0, 0.02352941, 1,
2.932911, -0.6317536, 2.022838, 1, 0, 0.01960784, 1,
3.082952, -1.443122, 2.888453, 1, 0, 0.01176471, 1,
3.427028, 0.682081, 1.7782, 1, 0, 0.007843138, 1
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
-0.1853073, -4.40185, -6.582543, 0, -0.5, 0.5, 0.5,
-0.1853073, -4.40185, -6.582543, 1, -0.5, 0.5, 0.5,
-0.1853073, -4.40185, -6.582543, 1, 1.5, 0.5, 0.5,
-0.1853073, -4.40185, -6.582543, 0, 1.5, 0.5, 0.5
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
-5.022224, 0.227603, -6.582543, 0, -0.5, 0.5, 0.5,
-5.022224, 0.227603, -6.582543, 1, -0.5, 0.5, 0.5,
-5.022224, 0.227603, -6.582543, 1, 1.5, 0.5, 0.5,
-5.022224, 0.227603, -6.582543, 0, 1.5, 0.5, 0.5
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
-5.022224, -4.40185, 0.00859499, 0, -0.5, 0.5, 0.5,
-5.022224, -4.40185, 0.00859499, 1, -0.5, 0.5, 0.5,
-5.022224, -4.40185, 0.00859499, 1, 1.5, 0.5, 0.5,
-5.022224, -4.40185, 0.00859499, 0, 1.5, 0.5, 0.5
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
-2, -3.333515, -5.061512,
2, -3.333515, -5.061512,
-2, -3.333515, -5.061512,
-2, -3.511571, -5.315017,
0, -3.333515, -5.061512,
0, -3.511571, -5.315017,
2, -3.333515, -5.061512,
2, -3.511571, -5.315017
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
-2, -3.867683, -5.822027, 0, -0.5, 0.5, 0.5,
-2, -3.867683, -5.822027, 1, -0.5, 0.5, 0.5,
-2, -3.867683, -5.822027, 1, 1.5, 0.5, 0.5,
-2, -3.867683, -5.822027, 0, 1.5, 0.5, 0.5,
0, -3.867683, -5.822027, 0, -0.5, 0.5, 0.5,
0, -3.867683, -5.822027, 1, -0.5, 0.5, 0.5,
0, -3.867683, -5.822027, 1, 1.5, 0.5, 0.5,
0, -3.867683, -5.822027, 0, 1.5, 0.5, 0.5,
2, -3.867683, -5.822027, 0, -0.5, 0.5, 0.5,
2, -3.867683, -5.822027, 1, -0.5, 0.5, 0.5,
2, -3.867683, -5.822027, 1, 1.5, 0.5, 0.5,
2, -3.867683, -5.822027, 0, 1.5, 0.5, 0.5
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
-3.906013, -3, -5.061512,
-3.906013, 3, -5.061512,
-3.906013, -3, -5.061512,
-4.092048, -3, -5.315017,
-3.906013, -2, -5.061512,
-4.092048, -2, -5.315017,
-3.906013, -1, -5.061512,
-4.092048, -1, -5.315017,
-3.906013, 0, -5.061512,
-4.092048, 0, -5.315017,
-3.906013, 1, -5.061512,
-4.092048, 1, -5.315017,
-3.906013, 2, -5.061512,
-4.092048, 2, -5.315017,
-3.906013, 3, -5.061512,
-4.092048, 3, -5.315017
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
-4.464118, -3, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, -3, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, -3, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, -3, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, -2, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, -2, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, -2, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, -2, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, -1, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, -1, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, -1, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, -1, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, 0, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, 0, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, 0, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, 0, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, 1, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, 1, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, 1, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, 1, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, 2, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, 2, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, 2, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, 2, -5.822027, 0, 1.5, 0.5, 0.5,
-4.464118, 3, -5.822027, 0, -0.5, 0.5, 0.5,
-4.464118, 3, -5.822027, 1, -0.5, 0.5, 0.5,
-4.464118, 3, -5.822027, 1, 1.5, 0.5, 0.5,
-4.464118, 3, -5.822027, 0, 1.5, 0.5, 0.5
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
-3.906013, -3.333515, -4,
-3.906013, -3.333515, 4,
-3.906013, -3.333515, -4,
-4.092048, -3.511571, -4,
-3.906013, -3.333515, -2,
-4.092048, -3.511571, -2,
-3.906013, -3.333515, 0,
-4.092048, -3.511571, 0,
-3.906013, -3.333515, 2,
-4.092048, -3.511571, 2,
-3.906013, -3.333515, 4,
-4.092048, -3.511571, 4
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
-4.464118, -3.867683, -4, 0, -0.5, 0.5, 0.5,
-4.464118, -3.867683, -4, 1, -0.5, 0.5, 0.5,
-4.464118, -3.867683, -4, 1, 1.5, 0.5, 0.5,
-4.464118, -3.867683, -4, 0, 1.5, 0.5, 0.5,
-4.464118, -3.867683, -2, 0, -0.5, 0.5, 0.5,
-4.464118, -3.867683, -2, 1, -0.5, 0.5, 0.5,
-4.464118, -3.867683, -2, 1, 1.5, 0.5, 0.5,
-4.464118, -3.867683, -2, 0, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 0, 0, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 0, 1, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 0, 1, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 0, 0, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 2, 0, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 2, 1, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 2, 1, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 2, 0, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 4, 0, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 4, 1, -0.5, 0.5, 0.5,
-4.464118, -3.867683, 4, 1, 1.5, 0.5, 0.5,
-4.464118, -3.867683, 4, 0, 1.5, 0.5, 0.5
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
-3.906013, -3.333515, -5.061512,
-3.906013, 3.788721, -5.061512,
-3.906013, -3.333515, 5.078701,
-3.906013, 3.788721, 5.078701,
-3.906013, -3.333515, -5.061512,
-3.906013, -3.333515, 5.078701,
-3.906013, 3.788721, -5.061512,
-3.906013, 3.788721, 5.078701,
-3.906013, -3.333515, -5.061512,
3.535398, -3.333515, -5.061512,
-3.906013, -3.333515, 5.078701,
3.535398, -3.333515, 5.078701,
-3.906013, 3.788721, -5.061512,
3.535398, 3.788721, -5.061512,
-3.906013, 3.788721, 5.078701,
3.535398, 3.788721, 5.078701,
3.535398, -3.333515, -5.061512,
3.535398, 3.788721, -5.061512,
3.535398, -3.333515, 5.078701,
3.535398, 3.788721, 5.078701,
3.535398, -3.333515, -5.061512,
3.535398, -3.333515, 5.078701,
3.535398, 3.788721, -5.061512,
3.535398, 3.788721, 5.078701
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
var radius = 7.718278;
var distance = 34.33949;
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
mvMatrix.translate( 0.1853073, -0.227603, -0.00859499 );
mvMatrix.scale( 1.121448, 1.171704, 0.8229762 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33949);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Acrylate<-read.table("Acrylate.xyz")
```

```
## Error in read.table("Acrylate.xyz"): no lines available in input
```

```r
x<-Acrylate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Acrylate' not found
```

```r
y<-Acrylate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Acrylate' not found
```

```r
z<-Acrylate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Acrylate' not found
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
-3.797643, 0.6380526, 0.2645535, 0, 0, 1, 1, 1,
-3.032205, 1.043592, -2.900676, 1, 0, 0, 1, 1,
-2.991422, 0.19302, -0.643791, 1, 0, 0, 1, 1,
-2.837499, -0.2171043, -1.350928, 1, 0, 0, 1, 1,
-2.780606, 1.105236, -1.540081, 1, 0, 0, 1, 1,
-2.749335, 0.3884506, -2.96672, 1, 0, 0, 1, 1,
-2.745338, 0.7161603, -1.3016, 0, 0, 0, 1, 1,
-2.619029, -0.4857506, -2.994822, 0, 0, 0, 1, 1,
-2.597125, -1.927628, -1.385642, 0, 0, 0, 1, 1,
-2.577456, 0.04781255, -2.824198, 0, 0, 0, 1, 1,
-2.515135, -0.5416555, -2.705144, 0, 0, 0, 1, 1,
-2.499769, 0.8713799, -1.503129, 0, 0, 0, 1, 1,
-2.433319, 1.145626, -0.9247045, 0, 0, 0, 1, 1,
-2.424348, -0.2041608, -2.244821, 1, 1, 1, 1, 1,
-2.319953, -0.9947032, -1.929596, 1, 1, 1, 1, 1,
-2.293437, 0.2746266, -1.962933, 1, 1, 1, 1, 1,
-2.232883, 0.4404382, 0.7602087, 1, 1, 1, 1, 1,
-2.230589, 0.7713183, -1.418256, 1, 1, 1, 1, 1,
-2.229245, 1.025342, -1.543183, 1, 1, 1, 1, 1,
-2.179865, -1.196262, -1.242557, 1, 1, 1, 1, 1,
-2.165808, -0.09854174, -0.3713045, 1, 1, 1, 1, 1,
-2.16253, 0.6911191, -1.734827, 1, 1, 1, 1, 1,
-2.132737, -1.063537, -1.581618, 1, 1, 1, 1, 1,
-2.116619, -0.3060752, -0.787024, 1, 1, 1, 1, 1,
-2.112685, 0.2603587, -0.7860458, 1, 1, 1, 1, 1,
-2.048123, -0.06757534, -3.01239, 1, 1, 1, 1, 1,
-1.999337, -0.1400235, 0.3010534, 1, 1, 1, 1, 1,
-1.992342, 0.6326538, -1.402884, 1, 1, 1, 1, 1,
-1.986202, 0.8720235, -0.7497133, 0, 0, 1, 1, 1,
-1.97881, 0.5763302, -1.934557, 1, 0, 0, 1, 1,
-1.971708, 0.6299388, -0.5995811, 1, 0, 0, 1, 1,
-1.953972, 1.053817, -1.91185, 1, 0, 0, 1, 1,
-1.885913, 0.7279783, -2.192911, 1, 0, 0, 1, 1,
-1.884, 0.7167951, -1.133793, 1, 0, 0, 1, 1,
-1.839204, 0.9794536, 0.129771, 0, 0, 0, 1, 1,
-1.804721, -1.070401, -1.191294, 0, 0, 0, 1, 1,
-1.799785, -0.4785899, -2.676663, 0, 0, 0, 1, 1,
-1.788199, -0.422873, -2.618507, 0, 0, 0, 1, 1,
-1.764704, 0.8654602, -0.7290736, 0, 0, 0, 1, 1,
-1.741938, 2.331926, -0.9161457, 0, 0, 0, 1, 1,
-1.732942, 3.684999, -0.757982, 0, 0, 0, 1, 1,
-1.731565, 0.6223849, -0.5531475, 1, 1, 1, 1, 1,
-1.71503, -1.210541, -1.437639, 1, 1, 1, 1, 1,
-1.696367, -0.2196448, -1.946098, 1, 1, 1, 1, 1,
-1.69635, 0.7094247, -2.452913, 1, 1, 1, 1, 1,
-1.684371, 1.836625, 0.07678479, 1, 1, 1, 1, 1,
-1.670664, -0.9248267, -1.22094, 1, 1, 1, 1, 1,
-1.669919, 0.1021942, -2.07753, 1, 1, 1, 1, 1,
-1.65941, 1.404419, -0.6817097, 1, 1, 1, 1, 1,
-1.645773, 0.146639, -1.199217, 1, 1, 1, 1, 1,
-1.64459, -1.533387, -1.591917, 1, 1, 1, 1, 1,
-1.610664, -0.6948439, -2.133898, 1, 1, 1, 1, 1,
-1.597919, 0.4035352, -0.1972564, 1, 1, 1, 1, 1,
-1.578187, -1.25589, 0.2418786, 1, 1, 1, 1, 1,
-1.5669, -0.9949734, -3.061682, 1, 1, 1, 1, 1,
-1.527545, -0.993868, -0.7392415, 1, 1, 1, 1, 1,
-1.513916, -1.449071, -1.248025, 0, 0, 1, 1, 1,
-1.493708, 0.2561961, -1.225993, 1, 0, 0, 1, 1,
-1.490334, 0.4770244, -2.321784, 1, 0, 0, 1, 1,
-1.483293, -0.5524133, -1.339363, 1, 0, 0, 1, 1,
-1.477876, 0.9043124, 0.4464608, 1, 0, 0, 1, 1,
-1.469254, 0.5602779, 0.3032558, 1, 0, 0, 1, 1,
-1.465358, -1.944817, -3.052693, 0, 0, 0, 1, 1,
-1.456806, 0.7059525, -0.9911923, 0, 0, 0, 1, 1,
-1.455785, -0.1215611, -1.827076, 0, 0, 0, 1, 1,
-1.455337, 2.112875, -0.05532957, 0, 0, 0, 1, 1,
-1.44978, 0.5846136, -1.472581, 0, 0, 0, 1, 1,
-1.444842, -0.7547815, -2.068756, 0, 0, 0, 1, 1,
-1.44345, -0.108613, -3.530769, 0, 0, 0, 1, 1,
-1.441774, -0.007001742, -0.1610975, 1, 1, 1, 1, 1,
-1.438767, -1.48628, -0.7400716, 1, 1, 1, 1, 1,
-1.434457, -0.120191, -1.275775, 1, 1, 1, 1, 1,
-1.434107, 1.083933, -1.927649, 1, 1, 1, 1, 1,
-1.43195, -1.149544, -2.114072, 1, 1, 1, 1, 1,
-1.422123, 0.4850897, -0.7887847, 1, 1, 1, 1, 1,
-1.420621, 0.1556463, -1.745435, 1, 1, 1, 1, 1,
-1.408255, 0.7215059, -2.5483, 1, 1, 1, 1, 1,
-1.403492, 2.165801, -0.7910684, 1, 1, 1, 1, 1,
-1.400983, 0.1121336, -1.628747, 1, 1, 1, 1, 1,
-1.399789, 0.009851366, -1.208431, 1, 1, 1, 1, 1,
-1.388178, -1.089248, -1.89445, 1, 1, 1, 1, 1,
-1.385329, 0.7698433, -2.881466, 1, 1, 1, 1, 1,
-1.383944, 1.207665, -0.3978835, 1, 1, 1, 1, 1,
-1.37819, -0.7322884, -1.636074, 1, 1, 1, 1, 1,
-1.369102, 0.3757732, -2.25577, 0, 0, 1, 1, 1,
-1.359626, -0.9990761, -3.102731, 1, 0, 0, 1, 1,
-1.352811, -0.1565153, -0.282286, 1, 0, 0, 1, 1,
-1.350466, -1.7809, -3.510992, 1, 0, 0, 1, 1,
-1.340559, 1.216086, -0.07953916, 1, 0, 0, 1, 1,
-1.335771, 1.448365, -0.6167055, 1, 0, 0, 1, 1,
-1.332907, 0.2744811, -2.41528, 0, 0, 0, 1, 1,
-1.329319, -0.4862376, -1.766894, 0, 0, 0, 1, 1,
-1.328001, -2.842625, -2.850406, 0, 0, 0, 1, 1,
-1.32538, -0.2792788, -0.4939103, 0, 0, 0, 1, 1,
-1.316407, 0.8914415, -1.877507, 0, 0, 0, 1, 1,
-1.315912, 0.6289003, 0.227791, 0, 0, 0, 1, 1,
-1.315285, -0.5219292, -3.105733, 0, 0, 0, 1, 1,
-1.307945, 0.2369858, -1.757645, 1, 1, 1, 1, 1,
-1.28854, 0.469962, -1.517183, 1, 1, 1, 1, 1,
-1.287856, 0.006785985, -2.726292, 1, 1, 1, 1, 1,
-1.286562, 0.4705952, -1.166101, 1, 1, 1, 1, 1,
-1.28566, -0.1265033, -1.081436, 1, 1, 1, 1, 1,
-1.278091, -0.4701713, -1.594441, 1, 1, 1, 1, 1,
-1.26459, 0.3529633, -0.1449347, 1, 1, 1, 1, 1,
-1.259, -0.599005, -2.081223, 1, 1, 1, 1, 1,
-1.257831, 0.4024212, -0.06144188, 1, 1, 1, 1, 1,
-1.25604, -0.6629483, -1.817287, 1, 1, 1, 1, 1,
-1.255878, -0.2051755, -3.896772, 1, 1, 1, 1, 1,
-1.255156, 0.2523128, -3.083931, 1, 1, 1, 1, 1,
-1.248326, 0.2950287, 0.2188339, 1, 1, 1, 1, 1,
-1.240655, -0.09636472, -2.704042, 1, 1, 1, 1, 1,
-1.238003, 1.259972, -0.380375, 1, 1, 1, 1, 1,
-1.235821, -0.6121911, -1.495349, 0, 0, 1, 1, 1,
-1.234547, -0.9344934, -1.708943, 1, 0, 0, 1, 1,
-1.225723, 0.5498269, -1.885264, 1, 0, 0, 1, 1,
-1.224058, 1.366533, -1.065197, 1, 0, 0, 1, 1,
-1.215952, -1.052526, -2.844404, 1, 0, 0, 1, 1,
-1.215471, 0.7195379, -0.3555886, 1, 0, 0, 1, 1,
-1.215409, 0.03079721, 0.6103706, 0, 0, 0, 1, 1,
-1.210284, 0.3396942, -0.3985022, 0, 0, 0, 1, 1,
-1.210214, 0.4683628, -2.530024, 0, 0, 0, 1, 1,
-1.20341, 0.06816056, -1.052147, 0, 0, 0, 1, 1,
-1.199391, -0.3633586, -1.583229, 0, 0, 0, 1, 1,
-1.198468, -0.5621378, -3.939539, 0, 0, 0, 1, 1,
-1.184671, 0.5457593, -1.668243, 0, 0, 0, 1, 1,
-1.182989, -0.175733, -1.172809, 1, 1, 1, 1, 1,
-1.178885, 1.268299, -0.8784129, 1, 1, 1, 1, 1,
-1.176653, 0.869368, -2.49489, 1, 1, 1, 1, 1,
-1.170784, 0.4140898, -0.8418909, 1, 1, 1, 1, 1,
-1.163304, 0.5721725, -3.176587, 1, 1, 1, 1, 1,
-1.162013, -0.06004427, -2.109025, 1, 1, 1, 1, 1,
-1.155821, 0.09000941, -0.3620915, 1, 1, 1, 1, 1,
-1.149632, 0.5477172, -2.382883, 1, 1, 1, 1, 1,
-1.146807, -0.2624511, -1.389676, 1, 1, 1, 1, 1,
-1.145956, 1.984756, -0.4909365, 1, 1, 1, 1, 1,
-1.144638, 0.9117663, -0.4701828, 1, 1, 1, 1, 1,
-1.14136, 0.274366, -1.868277, 1, 1, 1, 1, 1,
-1.138627, 0.1422222, -1.823071, 1, 1, 1, 1, 1,
-1.136539, -2.744468, -3.944265, 1, 1, 1, 1, 1,
-1.131362, -0.4201849, -2.960578, 1, 1, 1, 1, 1,
-1.130469, -0.5161678, -3.310369, 0, 0, 1, 1, 1,
-1.12859, 0.6332777, -0.5322757, 1, 0, 0, 1, 1,
-1.126896, -0.7579636, -1.159888, 1, 0, 0, 1, 1,
-1.118765, -0.3244974, -0.846474, 1, 0, 0, 1, 1,
-1.114216, -1.769734, -2.299951, 1, 0, 0, 1, 1,
-1.112337, 0.2256505, -1.381477, 1, 0, 0, 1, 1,
-1.112229, 0.5577951, -0.4585012, 0, 0, 0, 1, 1,
-1.111868, 0.1473613, -1.674221, 0, 0, 0, 1, 1,
-1.102583, 0.9415634, 1.446792, 0, 0, 0, 1, 1,
-1.101752, -0.8108275, -3.51971, 0, 0, 0, 1, 1,
-1.101354, -0.1880716, -1.175565, 0, 0, 0, 1, 1,
-1.096003, -0.6824859, -3.398387, 0, 0, 0, 1, 1,
-1.095438, -1.762433, -1.943703, 0, 0, 0, 1, 1,
-1.092806, -0.4916771, -1.796987, 1, 1, 1, 1, 1,
-1.092245, 0.6916804, 0.1020187, 1, 1, 1, 1, 1,
-1.087996, -0.3648168, -3.365569, 1, 1, 1, 1, 1,
-1.086122, 0.1551214, -1.84026, 1, 1, 1, 1, 1,
-1.084442, -0.6961846, -2.187753, 1, 1, 1, 1, 1,
-1.081679, 0.8877296, -0.9651077, 1, 1, 1, 1, 1,
-1.078916, 0.4315049, 0.631891, 1, 1, 1, 1, 1,
-1.070699, -0.425759, 0.08947747, 1, 1, 1, 1, 1,
-1.070046, -0.3516257, -1.096398, 1, 1, 1, 1, 1,
-1.066494, -1.57408, -1.835776, 1, 1, 1, 1, 1,
-1.066426, -2.261325, -2.304761, 1, 1, 1, 1, 1,
-1.057251, 1.734569, -1.40553, 1, 1, 1, 1, 1,
-1.054614, 1.435064, -0.07796805, 1, 1, 1, 1, 1,
-1.045151, 0.7964224, -0.5963053, 1, 1, 1, 1, 1,
-1.04413, -2.242506, -1.517132, 1, 1, 1, 1, 1,
-1.039241, -0.9741321, -2.098921, 0, 0, 1, 1, 1,
-1.038545, 0.4791379, -2.13263, 1, 0, 0, 1, 1,
-1.029886, 0.8352144, -1.29166, 1, 0, 0, 1, 1,
-1.021886, 0.6526639, -0.5001807, 1, 0, 0, 1, 1,
-1.016609, 0.7971308, -1.603974, 1, 0, 0, 1, 1,
-1.010341, 0.06439106, -0.9354936, 1, 0, 0, 1, 1,
-1.001559, 0.7618427, 0.4943307, 0, 0, 0, 1, 1,
-0.9998066, -1.290379, -1.884855, 0, 0, 0, 1, 1,
-0.9942836, -0.5044262, -2.879009, 0, 0, 0, 1, 1,
-0.9905185, -1.153575, -1.78555, 0, 0, 0, 1, 1,
-0.9903743, 0.6816956, -2.277867, 0, 0, 0, 1, 1,
-0.9884998, -0.8574431, -2.960016, 0, 0, 0, 1, 1,
-0.9848371, -1.65263, -3.321038, 0, 0, 0, 1, 1,
-0.9770935, -0.742627, -1.828918, 1, 1, 1, 1, 1,
-0.9732192, 0.2579294, -0.9713565, 1, 1, 1, 1, 1,
-0.9704864, 1.856039, -1.526675, 1, 1, 1, 1, 1,
-0.9660714, -0.2836692, -0.1984554, 1, 1, 1, 1, 1,
-0.9641935, -0.8512025, 0.003598532, 1, 1, 1, 1, 1,
-0.9615244, 0.8279386, -2.900413, 1, 1, 1, 1, 1,
-0.9521179, 0.02845119, -2.126677, 1, 1, 1, 1, 1,
-0.945969, -1.157307, -2.358222, 1, 1, 1, 1, 1,
-0.936518, 0.6943538, -0.2767315, 1, 1, 1, 1, 1,
-0.9304559, 0.4381196, -1.485402, 1, 1, 1, 1, 1,
-0.9261362, 1.971128, 0.644104, 1, 1, 1, 1, 1,
-0.9252185, -0.674355, -1.147565, 1, 1, 1, 1, 1,
-0.924919, 0.2163758, -2.563881, 1, 1, 1, 1, 1,
-0.9243632, -0.14908, -1.746215, 1, 1, 1, 1, 1,
-0.9226835, -1.319561, -2.090176, 1, 1, 1, 1, 1,
-0.9216573, 0.6482822, 0.3929063, 0, 0, 1, 1, 1,
-0.9205614, -0.9564346, -2.961441, 1, 0, 0, 1, 1,
-0.9139532, 0.582342, -0.3416683, 1, 0, 0, 1, 1,
-0.9134017, -1.290177, -2.993892, 1, 0, 0, 1, 1,
-0.910672, 0.8230091, -1.273558, 1, 0, 0, 1, 1,
-0.9091526, -0.7575014, -3.557291, 1, 0, 0, 1, 1,
-0.9048212, 0.01274473, -2.074615, 0, 0, 0, 1, 1,
-0.9026145, 1.137735, -1.083809, 0, 0, 0, 1, 1,
-0.8993479, 0.1584011, -2.113597, 0, 0, 0, 1, 1,
-0.8986962, -0.827672, -3.409749, 0, 0, 0, 1, 1,
-0.8945526, -1.098926, -1.337755, 0, 0, 0, 1, 1,
-0.8899571, 0.8970771, -1.393242, 0, 0, 0, 1, 1,
-0.8866688, -1.127412, -1.129565, 0, 0, 0, 1, 1,
-0.8834368, 0.6777968, -1.100708, 1, 1, 1, 1, 1,
-0.8803329, -0.8191237, -2.984446, 1, 1, 1, 1, 1,
-0.8799965, 1.412179, -0.6398526, 1, 1, 1, 1, 1,
-0.8731242, 0.5543858, -0.2635058, 1, 1, 1, 1, 1,
-0.8652764, 1.006093, -2.790118, 1, 1, 1, 1, 1,
-0.8624254, 1.029779, -3.196751, 1, 1, 1, 1, 1,
-0.8583705, -0.9564977, -1.449373, 1, 1, 1, 1, 1,
-0.8570402, -0.3154204, -1.56872, 1, 1, 1, 1, 1,
-0.8547746, 0.4707036, 0.1775964, 1, 1, 1, 1, 1,
-0.853314, 0.6868681, 0.2241573, 1, 1, 1, 1, 1,
-0.8466176, -1.805881, -1.2279, 1, 1, 1, 1, 1,
-0.8464498, 0.3933505, -1.586381, 1, 1, 1, 1, 1,
-0.8414484, -0.5345544, -2.594812, 1, 1, 1, 1, 1,
-0.8402098, -0.8481483, -2.351156, 1, 1, 1, 1, 1,
-0.8342066, 0.1633547, -1.458351, 1, 1, 1, 1, 1,
-0.831523, -0.9935987, -2.193523, 0, 0, 1, 1, 1,
-0.8287359, -0.5345105, -1.992991, 1, 0, 0, 1, 1,
-0.8234576, 1.481338, -0.0948488, 1, 0, 0, 1, 1,
-0.823446, 0.07207012, -2.71227, 1, 0, 0, 1, 1,
-0.8229764, -1.160241, 0.1474501, 1, 0, 0, 1, 1,
-0.8105841, 0.7146933, -1.899852, 1, 0, 0, 1, 1,
-0.8103789, 1.63756, 0.2931079, 0, 0, 0, 1, 1,
-0.8062136, 0.8861016, -1.674862, 0, 0, 0, 1, 1,
-0.8056759, 1.629534, -1.883682, 0, 0, 0, 1, 1,
-0.8039014, -1.148283, -2.439896, 0, 0, 0, 1, 1,
-0.7998595, 0.602092, -1.417737, 0, 0, 0, 1, 1,
-0.7981563, 1.624009, -0.4277379, 0, 0, 0, 1, 1,
-0.7970655, 0.3966525, -0.2283268, 0, 0, 0, 1, 1,
-0.7964938, 1.237241, -0.8219188, 1, 1, 1, 1, 1,
-0.7921321, 0.5321115, -1.703457, 1, 1, 1, 1, 1,
-0.7856972, 0.7203709, -0.1587624, 1, 1, 1, 1, 1,
-0.7826375, 0.9930694, -1.337725, 1, 1, 1, 1, 1,
-0.7766959, -0.8572062, -1.684014, 1, 1, 1, 1, 1,
-0.7743663, 0.5480055, -1.658529, 1, 1, 1, 1, 1,
-0.7739826, -1.009494, -2.350522, 1, 1, 1, 1, 1,
-0.7590476, 2.476604, -1.49186, 1, 1, 1, 1, 1,
-0.7577512, 1.179316, -1.35349, 1, 1, 1, 1, 1,
-0.7548336, 0.1596136, -1.49558, 1, 1, 1, 1, 1,
-0.752513, 1.966887, -0.07708237, 1, 1, 1, 1, 1,
-0.7434363, 0.9298528, 0.08339448, 1, 1, 1, 1, 1,
-0.7402038, 0.6287026, -0.4172967, 1, 1, 1, 1, 1,
-0.7355106, 0.6114029, -0.4611095, 1, 1, 1, 1, 1,
-0.7352195, 0.51258, -2.639066, 1, 1, 1, 1, 1,
-0.7331361, -0.2342398, -2.717173, 0, 0, 1, 1, 1,
-0.7303604, -0.3892999, -2.094091, 1, 0, 0, 1, 1,
-0.7302279, -0.3890505, -1.343409, 1, 0, 0, 1, 1,
-0.7287399, -0.5260729, -2.959695, 1, 0, 0, 1, 1,
-0.7261012, 0.7672915, 0.5999015, 1, 0, 0, 1, 1,
-0.7200179, -2.05189, -3.819279, 1, 0, 0, 1, 1,
-0.7186098, -0.2575515, -3.622159, 0, 0, 0, 1, 1,
-0.7098806, -2.407712, -2.310067, 0, 0, 0, 1, 1,
-0.6983256, -1.941795, -2.353124, 0, 0, 0, 1, 1,
-0.6921913, 1.09154, -0.2693841, 0, 0, 0, 1, 1,
-0.6918427, 2.252474, -1.021691, 0, 0, 0, 1, 1,
-0.6907005, 1.674018, -1.945425, 0, 0, 0, 1, 1,
-0.68515, -1.4975, -4.162668, 0, 0, 0, 1, 1,
-0.6830628, -0.3714471, -1.335463, 1, 1, 1, 1, 1,
-0.6789511, 0.4049003, -1.073256, 1, 1, 1, 1, 1,
-0.6774737, -0.3059029, -1.790316, 1, 1, 1, 1, 1,
-0.6752207, -0.7371214, -2.240032, 1, 1, 1, 1, 1,
-0.6736162, 0.4482572, -0.9741384, 1, 1, 1, 1, 1,
-0.6719135, 0.05770151, -2.164317, 1, 1, 1, 1, 1,
-0.6703379, 1.259229, 0.5037383, 1, 1, 1, 1, 1,
-0.6703277, 0.8058581, -0.6552902, 1, 1, 1, 1, 1,
-0.6675146, 0.6304604, -0.69041, 1, 1, 1, 1, 1,
-0.6672066, 0.04744305, -1.848944, 1, 1, 1, 1, 1,
-0.665925, -0.7900807, -1.784228, 1, 1, 1, 1, 1,
-0.66518, -1.040242, -2.996693, 1, 1, 1, 1, 1,
-0.65977, -0.3312187, -3.527927, 1, 1, 1, 1, 1,
-0.6573316, 0.7486337, -1.881201, 1, 1, 1, 1, 1,
-0.6565272, -0.1510435, -3.810207, 1, 1, 1, 1, 1,
-0.6538799, 0.6984159, -0.7636234, 0, 0, 1, 1, 1,
-0.6494491, -1.663407, -3.117143, 1, 0, 0, 1, 1,
-0.6485361, -1.250145, -2.895786, 1, 0, 0, 1, 1,
-0.6449428, -0.1109772, -2.509808, 1, 0, 0, 1, 1,
-0.6447051, 0.502114, -1.212695, 1, 0, 0, 1, 1,
-0.6318141, -1.146821, -3.634144, 1, 0, 0, 1, 1,
-0.6299608, -0.2125866, -2.418913, 0, 0, 0, 1, 1,
-0.6242844, 0.3720142, 0.6792532, 0, 0, 0, 1, 1,
-0.6126123, -0.3081715, -1.407369, 0, 0, 0, 1, 1,
-0.6120633, -0.5461188, -2.522299, 0, 0, 0, 1, 1,
-0.6057121, -1.139153, -1.277085, 0, 0, 0, 1, 1,
-0.6047754, -1.758387, -4.405725, 0, 0, 0, 1, 1,
-0.602423, 0.5254162, -1.018858, 0, 0, 0, 1, 1,
-0.6015707, 0.8039017, -0.9349757, 1, 1, 1, 1, 1,
-0.5946137, -0.4138751, -1.843061, 1, 1, 1, 1, 1,
-0.5886194, 0.08001991, -1.366678, 1, 1, 1, 1, 1,
-0.5832625, -0.4206731, -2.789764, 1, 1, 1, 1, 1,
-0.5822832, -0.226435, -1.457034, 1, 1, 1, 1, 1,
-0.582275, -3.229793, -3.03884, 1, 1, 1, 1, 1,
-0.5815168, -0.675798, -1.384009, 1, 1, 1, 1, 1,
-0.5810478, -0.7710134, -1.678195, 1, 1, 1, 1, 1,
-0.5802988, -0.7223619, -2.033815, 1, 1, 1, 1, 1,
-0.5778236, 0.4894331, -1.281109, 1, 1, 1, 1, 1,
-0.5769443, -0.2655945, -1.303355, 1, 1, 1, 1, 1,
-0.5734884, -0.9946135, -2.220151, 1, 1, 1, 1, 1,
-0.571471, -0.9607518, -3.006914, 1, 1, 1, 1, 1,
-0.5688892, -0.2976829, -1.343231, 1, 1, 1, 1, 1,
-0.567213, -1.947768, -3.62133, 1, 1, 1, 1, 1,
-0.564974, 0.1614269, 0.2438945, 0, 0, 1, 1, 1,
-0.5648851, 0.67537, 0.2187098, 1, 0, 0, 1, 1,
-0.5647995, 0.1324479, -1.672499, 1, 0, 0, 1, 1,
-0.5531948, -0.7711371, -1.494326, 1, 0, 0, 1, 1,
-0.5480295, -0.05067448, -1.018327, 1, 0, 0, 1, 1,
-0.5378242, -0.1187104, -3.136971, 1, 0, 0, 1, 1,
-0.5367442, 0.1805874, -3.124993, 0, 0, 0, 1, 1,
-0.5360377, 0.7137383, -1.832236, 0, 0, 0, 1, 1,
-0.5307037, -1.76735, -1.967164, 0, 0, 0, 1, 1,
-0.5221896, -0.03519977, -1.505681, 0, 0, 0, 1, 1,
-0.5089127, -0.8896235, -2.649905, 0, 0, 0, 1, 1,
-0.5039088, 0.7459787, -1.067118, 0, 0, 0, 1, 1,
-0.5016846, -0.5163327, -4.595769, 0, 0, 0, 1, 1,
-0.4996342, 0.472522, -1.697278, 1, 1, 1, 1, 1,
-0.4966716, 0.3406036, -1.847614, 1, 1, 1, 1, 1,
-0.4956295, 0.1837337, -0.1197923, 1, 1, 1, 1, 1,
-0.4946321, -0.1470607, -1.947943, 1, 1, 1, 1, 1,
-0.4925279, -0.2859611, -1.21994, 1, 1, 1, 1, 1,
-0.4887086, 1.479028, 1.016971, 1, 1, 1, 1, 1,
-0.4852198, -0.07220332, -2.366306, 1, 1, 1, 1, 1,
-0.48232, -0.1718596, -2.022314, 1, 1, 1, 1, 1,
-0.4757835, -0.7464278, -3.002223, 1, 1, 1, 1, 1,
-0.4742877, 0.5455818, -0.3887348, 1, 1, 1, 1, 1,
-0.4741202, 0.003903921, -2.099764, 1, 1, 1, 1, 1,
-0.4729105, -0.4744721, -2.505591, 1, 1, 1, 1, 1,
-0.4713533, -0.04811964, -1.51883, 1, 1, 1, 1, 1,
-0.4654742, 1.416229, 0.2618857, 1, 1, 1, 1, 1,
-0.4608226, 0.7593052, 0.721865, 1, 1, 1, 1, 1,
-0.4600012, -0.6546493, -2.557658, 0, 0, 1, 1, 1,
-0.4584289, 0.4918439, -0.5468705, 1, 0, 0, 1, 1,
-0.4516206, 1.028921, 1.613938, 1, 0, 0, 1, 1,
-0.4423274, -1.051858, -1.304848, 1, 0, 0, 1, 1,
-0.4417492, -1.263845, -3.272969, 1, 0, 0, 1, 1,
-0.4357045, 0.1232973, -1.974084, 1, 0, 0, 1, 1,
-0.4348488, -0.416141, -3.574339, 0, 0, 0, 1, 1,
-0.4311576, 2.390543, 1.324792, 0, 0, 0, 1, 1,
-0.4310018, 0.3882259, -2.829154, 0, 0, 0, 1, 1,
-0.4275365, -1.512299, -2.315574, 0, 0, 0, 1, 1,
-0.4254157, -0.9187328, -3.320754, 0, 0, 0, 1, 1,
-0.422173, 0.3496329, 0.9358796, 0, 0, 0, 1, 1,
-0.4210544, 2.272562, -1.522098, 0, 0, 0, 1, 1,
-0.4193259, 0.2975355, 0.01858968, 1, 1, 1, 1, 1,
-0.419197, -0.2966707, -3.234656, 1, 1, 1, 1, 1,
-0.4180538, 0.7716821, -0.9268535, 1, 1, 1, 1, 1,
-0.417541, 2.606044, 0.04991201, 1, 1, 1, 1, 1,
-0.4125393, 0.9190876, 0.08072225, 1, 1, 1, 1, 1,
-0.4102008, -0.7158071, -0.7300496, 1, 1, 1, 1, 1,
-0.4086151, 0.4925922, -1.426676, 1, 1, 1, 1, 1,
-0.4080665, -0.9483422, -1.31996, 1, 1, 1, 1, 1,
-0.3994152, -1.123227, -4.913838, 1, 1, 1, 1, 1,
-0.3949732, -0.8004521, 0.860047, 1, 1, 1, 1, 1,
-0.3945048, 1.471561, 0.92775, 1, 1, 1, 1, 1,
-0.3924809, 0.1706959, -2.256691, 1, 1, 1, 1, 1,
-0.3913163, 0.9267423, 1.093656, 1, 1, 1, 1, 1,
-0.3859946, 0.899334, -0.3811089, 1, 1, 1, 1, 1,
-0.3844731, 0.4540734, -1.406809, 1, 1, 1, 1, 1,
-0.3807167, 0.02209757, -1.613308, 0, 0, 1, 1, 1,
-0.3804306, -0.5167506, -2.429549, 1, 0, 0, 1, 1,
-0.3791493, -0.4091512, -3.871741, 1, 0, 0, 1, 1,
-0.3765822, -0.8083763, -2.551322, 1, 0, 0, 1, 1,
-0.3733575, 0.002992497, 0.3109493, 1, 0, 0, 1, 1,
-0.3714305, 1.062755, -0.9266202, 1, 0, 0, 1, 1,
-0.3687715, 0.803033, -1.322894, 0, 0, 0, 1, 1,
-0.365416, -0.7417294, -3.455987, 0, 0, 0, 1, 1,
-0.3652865, -0.7464265, -4.849444, 0, 0, 0, 1, 1,
-0.3611419, -0.9475582, -1.855386, 0, 0, 0, 1, 1,
-0.3602222, 0.9257342, -0.4838984, 0, 0, 0, 1, 1,
-0.3599763, 0.5848746, -0.3910811, 0, 0, 0, 1, 1,
-0.3478412, 0.9715936, -0.02398782, 0, 0, 0, 1, 1,
-0.3471287, -0.6024007, -3.084331, 1, 1, 1, 1, 1,
-0.3455278, -0.140862, -0.4955389, 1, 1, 1, 1, 1,
-0.3370968, -0.6150867, -4.043683, 1, 1, 1, 1, 1,
-0.3296035, -0.3510284, -1.947452, 1, 1, 1, 1, 1,
-0.3272162, -0.9121055, -2.128525, 1, 1, 1, 1, 1,
-0.3267763, 0.06877456, -1.280683, 1, 1, 1, 1, 1,
-0.3212473, -0.9375406, -2.421547, 1, 1, 1, 1, 1,
-0.316194, -0.7015795, -2.246606, 1, 1, 1, 1, 1,
-0.3076544, 1.285436, 1.61086, 1, 1, 1, 1, 1,
-0.3070799, 0.4245326, -2.247252, 1, 1, 1, 1, 1,
-0.3064647, -0.5671843, -3.58262, 1, 1, 1, 1, 1,
-0.3049273, -0.08463706, -1.926419, 1, 1, 1, 1, 1,
-0.3042598, -1.25665, -1.198939, 1, 1, 1, 1, 1,
-0.2981199, -1.44806, -2.771454, 1, 1, 1, 1, 1,
-0.2972073, 0.4687853, -0.4389456, 1, 1, 1, 1, 1,
-0.296105, 0.02922948, -1.434106, 0, 0, 1, 1, 1,
-0.2852283, 0.9471208, 0.6458904, 1, 0, 0, 1, 1,
-0.2835059, -0.05795774, -2.564814, 1, 0, 0, 1, 1,
-0.2834049, 1.012157, -1.928721, 1, 0, 0, 1, 1,
-0.281684, -0.7046229, -4.254487, 1, 0, 0, 1, 1,
-0.2807633, -0.6496324, -3.738203, 1, 0, 0, 1, 1,
-0.2774093, -1.306183, -2.575854, 0, 0, 0, 1, 1,
-0.2769876, -0.7359631, -2.862082, 0, 0, 0, 1, 1,
-0.2757347, 0.8534434, 0.07853684, 0, 0, 0, 1, 1,
-0.2743036, 2.227853, -0.2235268, 0, 0, 0, 1, 1,
-0.2670952, 1.091856, 0.4649198, 0, 0, 0, 1, 1,
-0.2660927, -1.477651, -2.876272, 0, 0, 0, 1, 1,
-0.261129, 1.874274, 1.15177, 0, 0, 0, 1, 1,
-0.2590442, -0.8974487, -3.334708, 1, 1, 1, 1, 1,
-0.2540892, 1.172473, 0.5329294, 1, 1, 1, 1, 1,
-0.2462837, 1.844551, 0.8365182, 1, 1, 1, 1, 1,
-0.2458752, 0.8639275, -0.8620309, 1, 1, 1, 1, 1,
-0.2399765, -0.8250134, -3.748727, 1, 1, 1, 1, 1,
-0.2394505, -1.111539, -3.084607, 1, 1, 1, 1, 1,
-0.2368934, 0.9731778, -0.1692091, 1, 1, 1, 1, 1,
-0.2359876, -0.2862921, -2.759957, 1, 1, 1, 1, 1,
-0.2347649, -0.2543207, -0.9918594, 1, 1, 1, 1, 1,
-0.2214989, 2.172407, 0.5444899, 1, 1, 1, 1, 1,
-0.2191823, -0.6082684, -2.302046, 1, 1, 1, 1, 1,
-0.2189654, -0.7429616, -3.303071, 1, 1, 1, 1, 1,
-0.2133971, -0.4886694, -1.210889, 1, 1, 1, 1, 1,
-0.2055332, -0.6598314, -3.438988, 1, 1, 1, 1, 1,
-0.2048795, 0.297307, -2.483327, 1, 1, 1, 1, 1,
-0.2041256, 0.3855456, -0.3832195, 0, 0, 1, 1, 1,
-0.2030563, -2.452433, -2.644162, 1, 0, 0, 1, 1,
-0.2025902, 0.9811009, 0.3260212, 1, 0, 0, 1, 1,
-0.1984275, -1.518782, -4.270368, 1, 0, 0, 1, 1,
-0.1967766, -0.3928705, -1.050834, 1, 0, 0, 1, 1,
-0.193385, 1.120293, -1.416956, 1, 0, 0, 1, 1,
-0.1929066, -0.73422, -3.053192, 0, 0, 0, 1, 1,
-0.1925711, 0.03282372, -0.03340351, 0, 0, 0, 1, 1,
-0.191411, -1.287678, -3.938162, 0, 0, 0, 1, 1,
-0.1869646, -0.2253833, -1.051497, 0, 0, 0, 1, 1,
-0.1850616, 0.07779263, -1.336397, 0, 0, 0, 1, 1,
-0.184538, -0.9491842, -3.584821, 0, 0, 0, 1, 1,
-0.1825663, -0.1664082, -2.20278, 0, 0, 0, 1, 1,
-0.175408, 1.232171, -1.509583, 1, 1, 1, 1, 1,
-0.174019, 0.4705814, 0.1823004, 1, 1, 1, 1, 1,
-0.1655742, 2.24044, -1.905238, 1, 1, 1, 1, 1,
-0.1634795, 0.07714259, -0.6244588, 1, 1, 1, 1, 1,
-0.1600458, 0.07177179, -0.2898773, 1, 1, 1, 1, 1,
-0.1558638, -0.4764064, -2.467855, 1, 1, 1, 1, 1,
-0.1555406, -2.374714, -1.675281, 1, 1, 1, 1, 1,
-0.151384, -0.8285448, -4.663379, 1, 1, 1, 1, 1,
-0.1505856, -0.4967714, -2.628871, 1, 1, 1, 1, 1,
-0.1461599, 1.580999, -0.7215309, 1, 1, 1, 1, 1,
-0.1374637, -0.2100099, -2.257915, 1, 1, 1, 1, 1,
-0.1300879, 0.2633662, -0.5338128, 1, 1, 1, 1, 1,
-0.1291186, 0.259158, -0.2666036, 1, 1, 1, 1, 1,
-0.1290285, -0.3876022, -3.033438, 1, 1, 1, 1, 1,
-0.1284868, -0.4339719, -2.891285, 1, 1, 1, 1, 1,
-0.1277012, 0.74503, 0.2175516, 0, 0, 1, 1, 1,
-0.1222179, 0.1113804, -1.149194, 1, 0, 0, 1, 1,
-0.1196577, -0.1742375, -3.987266, 1, 0, 0, 1, 1,
-0.1155276, 1.02668, 0.407922, 1, 0, 0, 1, 1,
-0.1150101, -0.4507951, -3.243402, 1, 0, 0, 1, 1,
-0.1136447, 0.4088599, 1.608955, 1, 0, 0, 1, 1,
-0.1134348, -1.1496, -2.230167, 0, 0, 0, 1, 1,
-0.1060309, -0.2621803, -2.458518, 0, 0, 0, 1, 1,
-0.1017686, -0.2886534, -2.202273, 0, 0, 0, 1, 1,
-0.09895302, 0.5691128, 0.7830085, 0, 0, 0, 1, 1,
-0.09799054, -0.7496208, -3.474841, 0, 0, 0, 1, 1,
-0.09579322, 0.4190483, -1.125085, 0, 0, 0, 1, 1,
-0.09260327, 0.3960926, 0.5220112, 0, 0, 0, 1, 1,
-0.09193634, 0.1760028, -1.066393, 1, 1, 1, 1, 1,
-0.08971211, -0.1116977, -2.305463, 1, 1, 1, 1, 1,
-0.08874477, -0.3743541, -3.467774, 1, 1, 1, 1, 1,
-0.08854835, -0.656075, -3.906166, 1, 1, 1, 1, 1,
-0.0855194, -0.3375013, -2.529278, 1, 1, 1, 1, 1,
-0.07448998, 0.5637973, -0.2712353, 1, 1, 1, 1, 1,
-0.07028589, 0.8671972, -2.194017, 1, 1, 1, 1, 1,
-0.06723684, 0.4508944, 0.9262768, 1, 1, 1, 1, 1,
-0.06250254, 0.1577709, 0.3706224, 1, 1, 1, 1, 1,
-0.05896087, 0.8296298, 0.5443728, 1, 1, 1, 1, 1,
-0.05759478, -0.2909068, -3.501594, 1, 1, 1, 1, 1,
-0.05370905, 0.289357, -0.1370934, 1, 1, 1, 1, 1,
-0.04933376, -0.03203363, -2.477794, 1, 1, 1, 1, 1,
-0.04740201, 0.0006173705, -2.841756, 1, 1, 1, 1, 1,
-0.04623506, -0.8576892, -4.2744, 1, 1, 1, 1, 1,
-0.04474331, 0.4175926, -0.2332374, 0, 0, 1, 1, 1,
-0.04406361, 0.36292, 0.6920435, 1, 0, 0, 1, 1,
-0.04276738, -0.1898315, -1.592792, 1, 0, 0, 1, 1,
-0.04073735, -1.837978, -3.860182, 1, 0, 0, 1, 1,
-0.03930967, 1.148006, -0.425326, 1, 0, 0, 1, 1,
-0.03434793, -2.28247, -2.10761, 1, 0, 0, 1, 1,
-0.03387426, -0.001048434, -2.21221, 0, 0, 0, 1, 1,
-0.0319668, 0.1230354, -0.5049483, 0, 0, 0, 1, 1,
-0.03169758, -0.0546381, -3.600182, 0, 0, 0, 1, 1,
-0.02904628, 0.4821739, 1.486691, 0, 0, 0, 1, 1,
-0.02565701, 1.521392, 2.098497, 0, 0, 0, 1, 1,
-0.02367698, 1.491042, 0.2365638, 0, 0, 0, 1, 1,
-0.02337725, -1.353264, -2.454547, 0, 0, 0, 1, 1,
-0.02307677, -0.4762825, -0.6324344, 1, 1, 1, 1, 1,
-0.02244766, 1.604558, -1.649507, 1, 1, 1, 1, 1,
-0.01813146, 0.4609336, -0.4004708, 1, 1, 1, 1, 1,
-0.01366315, 0.8428878, -0.1857202, 1, 1, 1, 1, 1,
-0.007755501, 0.1252794, 0.06620789, 1, 1, 1, 1, 1,
-0.004803367, -0.06224867, -2.064863, 1, 1, 1, 1, 1,
0.002111161, 0.9569418, 0.293663, 1, 1, 1, 1, 1,
0.004534217, -1.298511, 3.399741, 1, 1, 1, 1, 1,
0.009283264, -0.4489009, 2.836193, 1, 1, 1, 1, 1,
0.009976621, 0.5237168, 0.05657211, 1, 1, 1, 1, 1,
0.009984592, -0.2384682, 3.307598, 1, 1, 1, 1, 1,
0.01534453, -0.6995754, 1.53614, 1, 1, 1, 1, 1,
0.02740464, -1.021426, 2.50723, 1, 1, 1, 1, 1,
0.03063553, -0.2071046, 2.78818, 1, 1, 1, 1, 1,
0.0312512, -0.663331, 3.838829, 1, 1, 1, 1, 1,
0.03574893, 0.3931037, -0.07987514, 0, 0, 1, 1, 1,
0.04023719, 0.2379311, -0.6228954, 1, 0, 0, 1, 1,
0.04032579, 0.5278875, 0.7453641, 1, 0, 0, 1, 1,
0.0403281, -0.8592689, 3.462751, 1, 0, 0, 1, 1,
0.04369554, 0.9299473, 0.5007042, 1, 0, 0, 1, 1,
0.04466393, 0.999507, 1.983193, 1, 0, 0, 1, 1,
0.04706629, -0.3400279, 3.489938, 0, 0, 0, 1, 1,
0.04745531, 0.264526, -1.002161, 0, 0, 0, 1, 1,
0.04840489, 1.28586, -0.4924581, 0, 0, 0, 1, 1,
0.05293307, -1.2312, 2.550857, 0, 0, 0, 1, 1,
0.05362283, -0.424255, 3.234162, 0, 0, 0, 1, 1,
0.05417045, 0.1985273, -0.6744328, 0, 0, 0, 1, 1,
0.05521359, -0.721158, 3.422867, 0, 0, 0, 1, 1,
0.06578542, 0.8062961, -0.3542084, 1, 1, 1, 1, 1,
0.06709411, 0.8618727, -0.2198535, 1, 1, 1, 1, 1,
0.0694532, -0.8469571, 2.88621, 1, 1, 1, 1, 1,
0.07081063, -0.6711107, 3.598178, 1, 1, 1, 1, 1,
0.07506807, 0.2657643, -0.08741869, 1, 1, 1, 1, 1,
0.07700676, -1.423688, 3.579782, 1, 1, 1, 1, 1,
0.0775991, 2.163207, -1.467785, 1, 1, 1, 1, 1,
0.07835797, 0.5055535, -0.6674308, 1, 1, 1, 1, 1,
0.07867077, -0.7077694, 2.17504, 1, 1, 1, 1, 1,
0.07891291, 1.365368, 0.716838, 1, 1, 1, 1, 1,
0.0804985, -0.1342743, 2.923832, 1, 1, 1, 1, 1,
0.08570926, 2.190098, -1.007126, 1, 1, 1, 1, 1,
0.08620738, -0.9163752, 2.484107, 1, 1, 1, 1, 1,
0.09101398, -0.7414545, 2.90955, 1, 1, 1, 1, 1,
0.09423123, -1.876864, 4.220532, 1, 1, 1, 1, 1,
0.1017921, -0.8374271, 3.441797, 0, 0, 1, 1, 1,
0.1060786, -1.086558, 3.478005, 1, 0, 0, 1, 1,
0.1062347, -1.654618, 2.803219, 1, 0, 0, 1, 1,
0.1123774, 1.050302, 1.699091, 1, 0, 0, 1, 1,
0.1142571, -2.593269, 3.413385, 1, 0, 0, 1, 1,
0.1184513, 1.627844, -0.08275409, 1, 0, 0, 1, 1,
0.118626, 0.006886182, 1.241203, 0, 0, 0, 1, 1,
0.1186351, 0.1535819, -0.1188463, 0, 0, 0, 1, 1,
0.1190006, 0.6215445, 0.8642933, 0, 0, 0, 1, 1,
0.1216546, -0.9198741, 3.43019, 0, 0, 0, 1, 1,
0.1271146, -0.1326974, 1.7481, 0, 0, 0, 1, 1,
0.1271445, -0.721746, 2.895463, 0, 0, 0, 1, 1,
0.1379652, 0.8561786, -0.6505898, 0, 0, 0, 1, 1,
0.1407266, -0.70456, 1.018684, 1, 1, 1, 1, 1,
0.1437482, -0.6544266, 2.956449, 1, 1, 1, 1, 1,
0.145687, -0.4406263, 3.783312, 1, 1, 1, 1, 1,
0.1471096, 1.627021, -0.2515088, 1, 1, 1, 1, 1,
0.1478452, 0.9205292, -1.209906, 1, 1, 1, 1, 1,
0.1479322, -0.4645825, 2.048109, 1, 1, 1, 1, 1,
0.1560701, 1.527501, -2.005176, 1, 1, 1, 1, 1,
0.1564744, 0.4241414, -0.2631888, 1, 1, 1, 1, 1,
0.1594551, -0.2285571, 1.498983, 1, 1, 1, 1, 1,
0.161936, -0.5295125, 3.0555, 1, 1, 1, 1, 1,
0.1638824, 0.7983485, 3.730779, 1, 1, 1, 1, 1,
0.1645885, -0.2338349, 1.167874, 1, 1, 1, 1, 1,
0.1693553, 1.300837, 1.12772, 1, 1, 1, 1, 1,
0.1742983, 0.9372913, 0.1956159, 1, 1, 1, 1, 1,
0.1750918, -1.674793, 3.354904, 1, 1, 1, 1, 1,
0.1779951, -0.135235, 1.197492, 0, 0, 1, 1, 1,
0.1782359, 0.9231391, 1.427104, 1, 0, 0, 1, 1,
0.183127, -1.593925, 2.889099, 1, 0, 0, 1, 1,
0.184698, -1.150705, 3.985715, 1, 0, 0, 1, 1,
0.1848063, 0.2465937, -0.191046, 1, 0, 0, 1, 1,
0.1855602, -1.002275, 2.282674, 1, 0, 0, 1, 1,
0.1898094, -0.6788454, 2.338956, 0, 0, 0, 1, 1,
0.1915777, -0.04126283, 1.034807, 0, 0, 0, 1, 1,
0.1918456, -1.709307, 2.191726, 0, 0, 0, 1, 1,
0.192205, 2.49497, 0.2757096, 0, 0, 0, 1, 1,
0.1931034, -0.6923363, 3.506902, 0, 0, 0, 1, 1,
0.1937746, 0.5668918, 2.423019, 0, 0, 0, 1, 1,
0.2050215, -1.135096, 3.259573, 0, 0, 0, 1, 1,
0.2126959, -0.3415647, 2.782686, 1, 1, 1, 1, 1,
0.213233, 0.4186834, 2.380473, 1, 1, 1, 1, 1,
0.2219565, 2.835181, 0.01405133, 1, 1, 1, 1, 1,
0.2229604, -1.129711, 2.451603, 1, 1, 1, 1, 1,
0.2231105, -0.2704812, 1.937649, 1, 1, 1, 1, 1,
0.2296009, -0.6371734, 3.983742, 1, 1, 1, 1, 1,
0.2324203, 0.6149408, 0.4210246, 1, 1, 1, 1, 1,
0.2334088, 0.05787673, -0.2654469, 1, 1, 1, 1, 1,
0.2396153, -0.7169997, 2.718572, 1, 1, 1, 1, 1,
0.2408357, -0.6290893, 2.446079, 1, 1, 1, 1, 1,
0.2435529, -0.187329, 1.903532, 1, 1, 1, 1, 1,
0.2461317, 1.317798, -0.2562987, 1, 1, 1, 1, 1,
0.2485005, -0.2387417, 2.858533, 1, 1, 1, 1, 1,
0.2490236, 1.183634, -0.0214456, 1, 1, 1, 1, 1,
0.2506903, 2.302054, 0.7698788, 1, 1, 1, 1, 1,
0.2549655, -0.07556656, 1.264319, 0, 0, 1, 1, 1,
0.2551697, -0.4434592, 2.657914, 1, 0, 0, 1, 1,
0.2566079, 0.4920926, 2.06035, 1, 0, 0, 1, 1,
0.2580247, -0.3862137, 3.456759, 1, 0, 0, 1, 1,
0.2594172, -0.09804748, 1.183228, 1, 0, 0, 1, 1,
0.2679518, 0.07187402, 1.200628, 1, 0, 0, 1, 1,
0.2683496, 0.4798421, 0.4891017, 0, 0, 0, 1, 1,
0.2700069, 0.2664902, -1.287275, 0, 0, 0, 1, 1,
0.2723171, 0.1567853, 1.847681, 0, 0, 0, 1, 1,
0.2723281, -0.2401592, 3.85206, 0, 0, 0, 1, 1,
0.2738629, 0.3690302, 1.612402, 0, 0, 0, 1, 1,
0.2760512, -0.8727048, 2.819196, 0, 0, 0, 1, 1,
0.2781946, -2.164511, 3.556045, 0, 0, 0, 1, 1,
0.2783163, -0.8823819, 1.940097, 1, 1, 1, 1, 1,
0.2795332, -0.08799421, 1.095709, 1, 1, 1, 1, 1,
0.2798328, 0.3846531, -0.3072307, 1, 1, 1, 1, 1,
0.2813693, 0.03299358, 0.7772859, 1, 1, 1, 1, 1,
0.2857354, -0.1778643, 1.999279, 1, 1, 1, 1, 1,
0.2987152, 0.05719274, 2.301022, 1, 1, 1, 1, 1,
0.2994135, -0.6688552, 0.9972377, 1, 1, 1, 1, 1,
0.3013135, 0.3797162, 1.415087, 1, 1, 1, 1, 1,
0.3018179, 1.864722, 0.02941034, 1, 1, 1, 1, 1,
0.3020048, 2.317559, -0.0905484, 1, 1, 1, 1, 1,
0.308958, -1.605468, 3.426826, 1, 1, 1, 1, 1,
0.3097671, -1.774501, 2.891548, 1, 1, 1, 1, 1,
0.3177272, 0.8559231, 1.490211, 1, 1, 1, 1, 1,
0.3177753, -0.2329586, -1.139929, 1, 1, 1, 1, 1,
0.3184599, -2.725264, 2.11296, 1, 1, 1, 1, 1,
0.3204373, -1.044916, 3.532963, 0, 0, 1, 1, 1,
0.3253154, 0.9959778, 1.956072, 1, 0, 0, 1, 1,
0.3316634, 1.519672, 0.0940186, 1, 0, 0, 1, 1,
0.3345473, 1.206993, 0.2402125, 1, 0, 0, 1, 1,
0.3358718, -0.3191886, 1.513677, 1, 0, 0, 1, 1,
0.3395894, -0.2672777, 4.280749, 1, 0, 0, 1, 1,
0.3441253, 0.1362691, -0.4376099, 0, 0, 0, 1, 1,
0.3555608, -0.2343271, 1.432142, 0, 0, 0, 1, 1,
0.3569842, -2.014366, 3.057652, 0, 0, 0, 1, 1,
0.3595019, 1.570741, 0.3796689, 0, 0, 0, 1, 1,
0.3614047, 1.939672, 0.6870736, 0, 0, 0, 1, 1,
0.3649786, 0.2033255, 2.699471, 0, 0, 0, 1, 1,
0.3681728, 1.05309, -0.235122, 0, 0, 0, 1, 1,
0.3717878, 0.6484615, 0.01014748, 1, 1, 1, 1, 1,
0.3728828, 0.03180047, 1.807583, 1, 1, 1, 1, 1,
0.3768144, 0.3129181, -0.3816386, 1, 1, 1, 1, 1,
0.3769805, 0.1277634, -0.267646, 1, 1, 1, 1, 1,
0.380654, -1.377499, 1.377836, 1, 1, 1, 1, 1,
0.3817765, -0.5945621, 3.190296, 1, 1, 1, 1, 1,
0.3892758, 0.7870127, 0.2137357, 1, 1, 1, 1, 1,
0.3905266, 0.7418918, -0.9505676, 1, 1, 1, 1, 1,
0.3933771, 1.668021, -0.1402954, 1, 1, 1, 1, 1,
0.39476, 0.2067082, 1.073835, 1, 1, 1, 1, 1,
0.3954326, 0.2795952, 1.408665, 1, 1, 1, 1, 1,
0.3959916, -0.2000886, 1.998443, 1, 1, 1, 1, 1,
0.4109008, 0.7080476, 1.206288, 1, 1, 1, 1, 1,
0.414986, -1.306639, 2.792743, 1, 1, 1, 1, 1,
0.4178049, -1.038017, 4.895339, 1, 1, 1, 1, 1,
0.4210319, 0.1433399, -0.2129703, 0, 0, 1, 1, 1,
0.4210462, -1.763463, 2.719351, 1, 0, 0, 1, 1,
0.4220336, 0.7601344, 0.5675423, 1, 0, 0, 1, 1,
0.4241975, 0.4858044, 0.03580449, 1, 0, 0, 1, 1,
0.4244339, -0.6229371, 1.707475, 1, 0, 0, 1, 1,
0.425774, 0.5861267, 1.669817, 1, 0, 0, 1, 1,
0.4293429, -0.05648509, 0.8333256, 0, 0, 0, 1, 1,
0.4308867, 2.144315, 1.895709, 0, 0, 0, 1, 1,
0.4318316, 0.3202492, 2.184766, 0, 0, 0, 1, 1,
0.4376021, 0.3928007, -0.927265, 0, 0, 0, 1, 1,
0.4378188, -0.215254, 1.071954, 0, 0, 0, 1, 1,
0.4421095, 0.01035173, 0.3070111, 0, 0, 0, 1, 1,
0.4433364, -2.444086, 2.76475, 0, 0, 0, 1, 1,
0.4433525, 0.824632, 1.096478, 1, 1, 1, 1, 1,
0.4452083, -1.511207, 3.17175, 1, 1, 1, 1, 1,
0.4461947, 0.580303, 0.06237854, 1, 1, 1, 1, 1,
0.4513147, 0.9180978, 0.4328255, 1, 1, 1, 1, 1,
0.4557433, -1.032206, 3.187611, 1, 1, 1, 1, 1,
0.4593199, -0.7361878, 4.756477, 1, 1, 1, 1, 1,
0.4621527, -0.2645169, 2.674816, 1, 1, 1, 1, 1,
0.4633768, 0.1122274, 0.6442955, 1, 1, 1, 1, 1,
0.4647667, 1.694227, 0.8713902, 1, 1, 1, 1, 1,
0.467067, -0.1984949, -0.2784348, 1, 1, 1, 1, 1,
0.4723198, -0.2442745, 2.967202, 1, 1, 1, 1, 1,
0.4737086, 1.015133, 1.186926, 1, 1, 1, 1, 1,
0.4785059, 0.6788656, 1.333644, 1, 1, 1, 1, 1,
0.4785744, -1.525141, 1.30766, 1, 1, 1, 1, 1,
0.4822992, -0.1010749, 1.361911, 1, 1, 1, 1, 1,
0.4832742, -0.9270735, 3.864293, 0, 0, 1, 1, 1,
0.4900973, -0.6187751, 0.6519455, 1, 0, 0, 1, 1,
0.4923041, -0.7452066, 1.130663, 1, 0, 0, 1, 1,
0.4926807, 0.442252, -0.03523582, 1, 0, 0, 1, 1,
0.4994566, -1.281793, 4.89537, 1, 0, 0, 1, 1,
0.5000365, 0.3159619, 0.724261, 1, 0, 0, 1, 1,
0.5001486, -1.08333, 1.624554, 0, 0, 0, 1, 1,
0.5025405, 0.646272, -0.6544591, 0, 0, 0, 1, 1,
0.5087661, -1.070367, 2.381658, 0, 0, 0, 1, 1,
0.508828, -1.54929, 3.398346, 0, 0, 0, 1, 1,
0.5109755, 0.2456266, 2.987352, 0, 0, 0, 1, 1,
0.512194, 0.5382569, 1.141517, 0, 0, 0, 1, 1,
0.5127802, 0.2524799, 1.360658, 0, 0, 0, 1, 1,
0.513351, 1.349244, -1.085036, 1, 1, 1, 1, 1,
0.5160586, -1.160876, 2.888111, 1, 1, 1, 1, 1,
0.5164229, -1.456929, 2.92319, 1, 1, 1, 1, 1,
0.5205032, -0.2985646, 2.479403, 1, 1, 1, 1, 1,
0.5255064, 0.6244085, 0.954461, 1, 1, 1, 1, 1,
0.5316463, 0.3724301, 0.2105901, 1, 1, 1, 1, 1,
0.5321963, -0.4496126, 1.364177, 1, 1, 1, 1, 1,
0.5324758, 0.08776392, 1.550325, 1, 1, 1, 1, 1,
0.5400132, -0.4732877, 2.217052, 1, 1, 1, 1, 1,
0.5495538, 0.5630234, -0.06626099, 1, 1, 1, 1, 1,
0.5522854, 1.272089, -1.136501, 1, 1, 1, 1, 1,
0.5542501, 0.2969167, 1.8047, 1, 1, 1, 1, 1,
0.5565351, -0.7373121, 3.285576, 1, 1, 1, 1, 1,
0.5586723, -0.3012838, 2.233105, 1, 1, 1, 1, 1,
0.5627776, -1.34219, 2.804192, 1, 1, 1, 1, 1,
0.5732687, 0.8470363, -0.8487286, 0, 0, 1, 1, 1,
0.5758251, 0.5131363, -0.5749774, 1, 0, 0, 1, 1,
0.5771116, 0.6843484, 0.5673371, 1, 0, 0, 1, 1,
0.5780045, -0.7645845, 2.467012, 1, 0, 0, 1, 1,
0.5782831, -1.015169, 3.339246, 1, 0, 0, 1, 1,
0.5809512, -0.2981596, 3.305133, 1, 0, 0, 1, 1,
0.5818932, -0.3809091, 0.7551981, 0, 0, 0, 1, 1,
0.5828854, 1.057703, 0.209655, 0, 0, 0, 1, 1,
0.5835118, -0.7324664, 2.859249, 0, 0, 0, 1, 1,
0.5887129, -0.1763646, 0.8399618, 0, 0, 0, 1, 1,
0.5902864, -0.07569814, 0.7710925, 0, 0, 0, 1, 1,
0.5960913, 0.436946, 1.002475, 0, 0, 0, 1, 1,
0.6009634, 0.3878816, 1.480587, 0, 0, 0, 1, 1,
0.6025303, -0.2421877, 1.864445, 1, 1, 1, 1, 1,
0.6037318, 0.3172459, 0.9640958, 1, 1, 1, 1, 1,
0.6044479, -0.9861499, 1.042814, 1, 1, 1, 1, 1,
0.6064765, 0.423801, 1.485177, 1, 1, 1, 1, 1,
0.6088751, -2.267603, 4.630342, 1, 1, 1, 1, 1,
0.6095886, -0.03520471, 2.315622, 1, 1, 1, 1, 1,
0.6100149, -0.1728733, 0.2691865, 1, 1, 1, 1, 1,
0.610275, 0.03995502, 0.9260799, 1, 1, 1, 1, 1,
0.6106838, -0.7651728, 2.009965, 1, 1, 1, 1, 1,
0.6115983, 1.668357, -0.1421446, 1, 1, 1, 1, 1,
0.6140999, -0.9178988, 1.003564, 1, 1, 1, 1, 1,
0.617727, -0.00580732, 0.194881, 1, 1, 1, 1, 1,
0.6181588, -0.8636366, 2.694047, 1, 1, 1, 1, 1,
0.6207686, 0.6171511, -0.4349654, 1, 1, 1, 1, 1,
0.6208389, 0.6935661, -0.6048021, 1, 1, 1, 1, 1,
0.6337519, -1.802915, 1.879061, 0, 0, 1, 1, 1,
0.6389974, -0.8777652, 4.931028, 1, 0, 0, 1, 1,
0.6426954, 0.1489028, 1.14703, 1, 0, 0, 1, 1,
0.6437195, 1.037904, 0.9361394, 1, 0, 0, 1, 1,
0.6468336, -1.099622, 2.499798, 1, 0, 0, 1, 1,
0.6506721, -0.8411461, 2.886674, 1, 0, 0, 1, 1,
0.6533754, 1.958186, -0.5390689, 0, 0, 0, 1, 1,
0.653376, -0.6066057, 3.135278, 0, 0, 0, 1, 1,
0.6628275, -0.3266221, 2.070581, 0, 0, 0, 1, 1,
0.6631119, 0.5390965, 2.787012, 0, 0, 0, 1, 1,
0.6633028, -2.182518, 2.791151, 0, 0, 0, 1, 1,
0.6639262, 1.072857, 0.3959812, 0, 0, 0, 1, 1,
0.6644343, 1.669372, -0.09742303, 0, 0, 0, 1, 1,
0.6684456, 1.346498, 2.652261, 1, 1, 1, 1, 1,
0.6791592, -0.5772791, 2.333579, 1, 1, 1, 1, 1,
0.6806645, 1.735127, -0.06986921, 1, 1, 1, 1, 1,
0.6807085, 1.430758, 0.2263188, 1, 1, 1, 1, 1,
0.6836484, 1.780642, 1.559331, 1, 1, 1, 1, 1,
0.6973082, 1.617919, -3.203625, 1, 1, 1, 1, 1,
0.7004133, 1.402585, -1.137221, 1, 1, 1, 1, 1,
0.7031006, -0.417247, 1.908948, 1, 1, 1, 1, 1,
0.7091768, -0.2460236, -0.01063336, 1, 1, 1, 1, 1,
0.7119395, -2.51642, 2.773598, 1, 1, 1, 1, 1,
0.7128931, -2.109406, 3.727996, 1, 1, 1, 1, 1,
0.7167037, 0.4848286, 1.850507, 1, 1, 1, 1, 1,
0.7235641, -0.3221075, 1.207311, 1, 1, 1, 1, 1,
0.7299428, -1.17826, 1.906618, 1, 1, 1, 1, 1,
0.7320263, 0.8498424, -0.8708146, 1, 1, 1, 1, 1,
0.7337984, 0.4936047, 1.869215, 0, 0, 1, 1, 1,
0.734849, 0.2900375, 2.566977, 1, 0, 0, 1, 1,
0.735527, -0.1539309, 0.334904, 1, 0, 0, 1, 1,
0.7408182, -0.6557574, 2.489753, 1, 0, 0, 1, 1,
0.7421367, -1.115493, 2.624711, 1, 0, 0, 1, 1,
0.7423518, 0.1868627, 1.411769, 1, 0, 0, 1, 1,
0.7454494, -0.1939968, 0.1035087, 0, 0, 0, 1, 1,
0.7502083, -0.03541651, 3.569779, 0, 0, 0, 1, 1,
0.7536376, 1.196758, 0.5758111, 0, 0, 0, 1, 1,
0.7541829, 0.2350461, 0.1221198, 0, 0, 0, 1, 1,
0.764579, 1.532637, -0.4382431, 0, 0, 0, 1, 1,
0.7675959, 0.3406221, 3.896643, 0, 0, 0, 1, 1,
0.7690593, 0.7987455, 2.166355, 0, 0, 0, 1, 1,
0.7694954, 0.5576996, 2.227807, 1, 1, 1, 1, 1,
0.7750828, 0.1097777, 0.9896554, 1, 1, 1, 1, 1,
0.7779159, -0.2163038, 2.464593, 1, 1, 1, 1, 1,
0.7822384, 0.5077253, 1.823018, 1, 1, 1, 1, 1,
0.7909234, -1.072005, 2.007832, 1, 1, 1, 1, 1,
0.794203, -0.2091428, 1.378236, 1, 1, 1, 1, 1,
0.8012399, -0.8191053, 0.3645562, 1, 1, 1, 1, 1,
0.8030555, 0.06793812, 1.496353, 1, 1, 1, 1, 1,
0.8036869, 0.9294725, 0.7454391, 1, 1, 1, 1, 1,
0.8038597, -0.4184285, 1.916333, 1, 1, 1, 1, 1,
0.807328, 2.025365, -0.3295086, 1, 1, 1, 1, 1,
0.8164729, 2.108284, 1.751377, 1, 1, 1, 1, 1,
0.8177114, 0.7750028, -0.4104715, 1, 1, 1, 1, 1,
0.8222169, -0.05815005, 1.488466, 1, 1, 1, 1, 1,
0.8236376, 0.5490072, 0.9883046, 1, 1, 1, 1, 1,
0.8255261, -0.2874154, 2.436716, 0, 0, 1, 1, 1,
0.8283572, -0.3554909, 2.584629, 1, 0, 0, 1, 1,
0.8298376, -0.4358598, 2.864324, 1, 0, 0, 1, 1,
0.8308176, 1.303574, 1.444805, 1, 0, 0, 1, 1,
0.8324238, -0.1028662, 1.334205, 1, 0, 0, 1, 1,
0.8484321, 0.7923766, 0.8898075, 1, 0, 0, 1, 1,
0.8487872, -1.596773, 2.225611, 0, 0, 0, 1, 1,
0.8558788, -0.1395498, 2.288522, 0, 0, 0, 1, 1,
0.8597351, 0.7086093, 0.5132016, 0, 0, 0, 1, 1,
0.8602868, -0.107944, 2.305825, 0, 0, 0, 1, 1,
0.873558, 0.8892465, 2.072608, 0, 0, 0, 1, 1,
0.8774254, 0.0780401, 3.867085, 0, 0, 0, 1, 1,
0.8809795, -0.7001467, 2.915761, 0, 0, 0, 1, 1,
0.8814505, -0.4249238, 1.606981, 1, 1, 1, 1, 1,
0.8937075, 1.148999, 0.8838513, 1, 1, 1, 1, 1,
0.8945284, 0.3666832, 0.7265518, 1, 1, 1, 1, 1,
0.8968406, -0.2155966, 2.128014, 1, 1, 1, 1, 1,
0.9052837, 1.311282, -0.09479234, 1, 1, 1, 1, 1,
0.9077358, 0.1578145, -0.9769708, 1, 1, 1, 1, 1,
0.9176657, 0.3364256, 1.604482, 1, 1, 1, 1, 1,
0.9246315, 2.010819, 1.188803, 1, 1, 1, 1, 1,
0.9272308, -0.3248545, 1.42475, 1, 1, 1, 1, 1,
0.9318435, -0.8724874, 1.514067, 1, 1, 1, 1, 1,
0.9325331, 1.158893, 1.455778, 1, 1, 1, 1, 1,
0.9345118, -0.1721499, 2.462883, 1, 1, 1, 1, 1,
0.9372499, 0.6278629, 0.4813157, 1, 1, 1, 1, 1,
0.9386544, 0.570785, 0.7097538, 1, 1, 1, 1, 1,
0.9390807, 0.6281295, 2.536333, 1, 1, 1, 1, 1,
0.94433, -0.8428088, 4.492608, 0, 0, 1, 1, 1,
0.9473457, -0.9450689, 3.766036, 1, 0, 0, 1, 1,
0.9482264, -1.215623, 3.129425, 1, 0, 0, 1, 1,
0.9486201, -0.2845429, 0.9900295, 1, 0, 0, 1, 1,
0.9532157, -0.01161564, 1.544508, 1, 0, 0, 1, 1,
0.953654, -0.6428375, 2.769416, 1, 0, 0, 1, 1,
0.9599491, 2.078153, -0.2442652, 0, 0, 0, 1, 1,
0.9677438, -1.054533, 1.892607, 0, 0, 0, 1, 1,
0.9703674, -0.9449837, 4.03383, 0, 0, 0, 1, 1,
0.9733031, -0.2945733, 1.145529, 0, 0, 0, 1, 1,
0.9773459, -0.04973049, 1.965005, 0, 0, 0, 1, 1,
0.9790344, 1.875401, 3.084861, 0, 0, 0, 1, 1,
0.9815339, 0.9476063, 1.980519, 0, 0, 0, 1, 1,
0.9896578, -0.8822048, 2.280419, 1, 1, 1, 1, 1,
0.9913157, 0.9039771, 1.629424, 1, 1, 1, 1, 1,
0.9924508, -0.6748678, 2.552629, 1, 1, 1, 1, 1,
0.9950582, 1.856992, -0.1059715, 1, 1, 1, 1, 1,
1.004674, 0.8731309, 2.326008, 1, 1, 1, 1, 1,
1.005334, -0.3025738, 1.109342, 1, 1, 1, 1, 1,
1.013904, 2.014427, -0.1854801, 1, 1, 1, 1, 1,
1.014452, 0.3956121, 2.162863, 1, 1, 1, 1, 1,
1.020355, -0.2914446, 3.789228, 1, 1, 1, 1, 1,
1.024924, 0.7329151, -0.6918234, 1, 1, 1, 1, 1,
1.027941, 0.9240998, 2.773915, 1, 1, 1, 1, 1,
1.031593, 0.8900326, -0.1314537, 1, 1, 1, 1, 1,
1.033887, -0.4329923, 1.270664, 1, 1, 1, 1, 1,
1.034795, 0.480903, 1.241614, 1, 1, 1, 1, 1,
1.036126, 0.09971631, 2.071814, 1, 1, 1, 1, 1,
1.040367, -0.5956496, 1.30499, 0, 0, 1, 1, 1,
1.042043, -0.9011202, 3.631644, 1, 0, 0, 1, 1,
1.047613, 1.318009, 0.1986089, 1, 0, 0, 1, 1,
1.050534, 0.5173338, 2.821908, 1, 0, 0, 1, 1,
1.058989, 0.5524218, 0.5935303, 1, 0, 0, 1, 1,
1.060523, 0.9511976, 2.882837, 1, 0, 0, 1, 1,
1.071172, 1.06879, 2.511068, 0, 0, 0, 1, 1,
1.073381, 0.2757521, 1.401725, 0, 0, 0, 1, 1,
1.076064, 1.85808, -0.7735017, 0, 0, 0, 1, 1,
1.077106, 0.444373, 1.431587, 0, 0, 0, 1, 1,
1.078508, 0.8105497, 2.556295, 0, 0, 0, 1, 1,
1.08361, -0.1925953, 1.326475, 0, 0, 0, 1, 1,
1.094202, 0.9120129, 1.787929, 0, 0, 0, 1, 1,
1.098415, 0.1604084, 2.135035, 1, 1, 1, 1, 1,
1.100706, 0.6175464, 1.384637, 1, 1, 1, 1, 1,
1.103646, 0.4228542, 0.4936873, 1, 1, 1, 1, 1,
1.10551, -0.3966381, 2.506567, 1, 1, 1, 1, 1,
1.109564, 1.667444, 0.6321856, 1, 1, 1, 1, 1,
1.113204, -0.06722698, 1.429895, 1, 1, 1, 1, 1,
1.113449, -0.7246461, 2.897907, 1, 1, 1, 1, 1,
1.129742, -0.7243964, 1.970235, 1, 1, 1, 1, 1,
1.13524, -0.487823, 2.163611, 1, 1, 1, 1, 1,
1.13775, 1.058344, -0.2679184, 1, 1, 1, 1, 1,
1.144196, -0.5026026, 1.688636, 1, 1, 1, 1, 1,
1.14683, -0.227864, 1.617833, 1, 1, 1, 1, 1,
1.148625, 2.682433, 1.666361, 1, 1, 1, 1, 1,
1.158026, -1.42376, 1.049542, 1, 1, 1, 1, 1,
1.158685, -0.6599609, -0.8205334, 1, 1, 1, 1, 1,
1.159728, -1.889791, 3.163314, 0, 0, 1, 1, 1,
1.163433, -0.6466136, 1.932187, 1, 0, 0, 1, 1,
1.16594, 0.7159226, 0.7349595, 1, 0, 0, 1, 1,
1.168353, 1.335636, -1.489405, 1, 0, 0, 1, 1,
1.175504, -1.645083, 4.911273, 1, 0, 0, 1, 1,
1.175749, -0.4574539, 1.798507, 1, 0, 0, 1, 1,
1.192699, 0.1993013, 2.154699, 0, 0, 0, 1, 1,
1.196123, -1.474993, 1.849429, 0, 0, 0, 1, 1,
1.199662, 1.307695, -0.3169911, 0, 0, 0, 1, 1,
1.200183, -0.07163474, 2.825556, 0, 0, 0, 1, 1,
1.206268, 0.2983839, 0.5603357, 0, 0, 0, 1, 1,
1.206964, 1.31056, 0.5309817, 0, 0, 0, 1, 1,
1.20786, 0.4521949, 0.8379051, 0, 0, 0, 1, 1,
1.208402, -1.781408, 3.817658, 1, 1, 1, 1, 1,
1.209425, 0.3841769, -0.2038211, 1, 1, 1, 1, 1,
1.213504, -0.9027841, 0.9279072, 1, 1, 1, 1, 1,
1.213786, -0.5901564, 0.7202504, 1, 1, 1, 1, 1,
1.216089, 0.04451418, 1.762818, 1, 1, 1, 1, 1,
1.216326, 1.770967, 0.2884512, 1, 1, 1, 1, 1,
1.231268, -1.721021, 2.496243, 1, 1, 1, 1, 1,
1.2354, -0.8492929, 3.467096, 1, 1, 1, 1, 1,
1.258894, -0.2368184, 2.172232, 1, 1, 1, 1, 1,
1.26139, 0.7695636, 1.164434, 1, 1, 1, 1, 1,
1.286117, 1.81398, 0.7601802, 1, 1, 1, 1, 1,
1.286641, 0.7896425, 0.7658886, 1, 1, 1, 1, 1,
1.29715, 0.4598071, 0.3858967, 1, 1, 1, 1, 1,
1.306386, -0.05980794, 0.8498341, 1, 1, 1, 1, 1,
1.30899, -1.074767, 3.7271, 1, 1, 1, 1, 1,
1.316302, 0.08433226, 2.010127, 0, 0, 1, 1, 1,
1.317966, -0.7880436, 0.004962473, 1, 0, 0, 1, 1,
1.320884, 0.4152683, 2.135737, 1, 0, 0, 1, 1,
1.329853, -0.4638558, 0.3445228, 1, 0, 0, 1, 1,
1.340479, 0.2665934, 2.066818, 1, 0, 0, 1, 1,
1.351508, -0.5432475, 0.9527799, 1, 0, 0, 1, 1,
1.35372, -0.8692017, 0.7128372, 0, 0, 0, 1, 1,
1.357275, -2.349949, 2.235459, 0, 0, 0, 1, 1,
1.358595, -0.4096514, 2.526118, 0, 0, 0, 1, 1,
1.358724, 0.519464, 2.22735, 0, 0, 0, 1, 1,
1.362713, 1.160364, 1.243592, 0, 0, 0, 1, 1,
1.363933, -0.6753448, 2.319656, 0, 0, 0, 1, 1,
1.36843, -1.960377, 3.35888, 0, 0, 0, 1, 1,
1.37608, 0.9638897, 1.403885, 1, 1, 1, 1, 1,
1.389776, 0.659282, 1.369681, 1, 1, 1, 1, 1,
1.397828, -0.6165457, 3.136718, 1, 1, 1, 1, 1,
1.398085, 0.3968196, 1.509432, 1, 1, 1, 1, 1,
1.404498, -0.534553, 1.860211, 1, 1, 1, 1, 1,
1.410586, -0.151608, 2.959072, 1, 1, 1, 1, 1,
1.426738, 0.09160971, 1.058778, 1, 1, 1, 1, 1,
1.431885, 0.9455885, 1.738961, 1, 1, 1, 1, 1,
1.441623, 1.423846, 0.1125274, 1, 1, 1, 1, 1,
1.455238, 0.8771093, -0.2157082, 1, 1, 1, 1, 1,
1.46687, 0.1015773, 0.6655659, 1, 1, 1, 1, 1,
1.46927, -1.132071, 0.7249329, 1, 1, 1, 1, 1,
1.472402, -1.058305, 2.818043, 1, 1, 1, 1, 1,
1.484605, 2.61433, -0.8883523, 1, 1, 1, 1, 1,
1.490976, 1.027875, 0.2886772, 1, 1, 1, 1, 1,
1.491133, 2.097891, 1.880369, 0, 0, 1, 1, 1,
1.491477, -0.4327905, 2.857656, 1, 0, 0, 1, 1,
1.50261, -2.690092, 2.26616, 1, 0, 0, 1, 1,
1.503844, -0.5325782, 2.142894, 1, 0, 0, 1, 1,
1.509819, -0.2992558, 3.51993, 1, 0, 0, 1, 1,
1.511602, -0.9651843, 2.585488, 1, 0, 0, 1, 1,
1.514004, 0.2055457, 2.899119, 0, 0, 0, 1, 1,
1.527394, -1.723886, 1.802292, 0, 0, 0, 1, 1,
1.536216, -0.09974957, 2.5319, 0, 0, 0, 1, 1,
1.543966, -0.5020531, 1.509772, 0, 0, 0, 1, 1,
1.564006, -1.865634, 0.7920322, 0, 0, 0, 1, 1,
1.565902, 1.1476, 0.1582996, 0, 0, 0, 1, 1,
1.566846, -1.923656, 4.092152, 0, 0, 0, 1, 1,
1.574224, -0.6042657, 3.8858, 1, 1, 1, 1, 1,
1.582881, 1.406745, 1.07931, 1, 1, 1, 1, 1,
1.612511, -0.1776046, 0.9962549, 1, 1, 1, 1, 1,
1.626318, -0.9833741, 1.643713, 1, 1, 1, 1, 1,
1.629941, 2.376392, -0.3970702, 1, 1, 1, 1, 1,
1.635628, -1.546607, 1.92432, 1, 1, 1, 1, 1,
1.641011, -0.3900519, 2.801651, 1, 1, 1, 1, 1,
1.649234, 0.607757, 0.9246107, 1, 1, 1, 1, 1,
1.658053, 0.8564584, 1.539268, 1, 1, 1, 1, 1,
1.670271, 1.269305, -0.8822244, 1, 1, 1, 1, 1,
1.673277, -1.005948, 3.462728, 1, 1, 1, 1, 1,
1.67577, 0.3482052, 1.688785, 1, 1, 1, 1, 1,
1.679388, 0.7158958, 1.870139, 1, 1, 1, 1, 1,
1.762431, 0.0519806, 0.9381614, 1, 1, 1, 1, 1,
1.768209, -0.451619, 2.508351, 1, 1, 1, 1, 1,
1.797723, 1.333465, -0.337539, 0, 0, 1, 1, 1,
1.819166, -0.2451532, 0.200343, 1, 0, 0, 1, 1,
1.820743, -0.06870598, 2.066515, 1, 0, 0, 1, 1,
1.84242, -0.5698448, 1.386004, 1, 0, 0, 1, 1,
1.85484, 1.782412, 0.7182063, 1, 0, 0, 1, 1,
1.875737, -1.179758, 2.053442, 1, 0, 0, 1, 1,
1.888519, -0.4818701, 3.747451, 0, 0, 0, 1, 1,
1.926914, 0.5137667, 1.813854, 0, 0, 0, 1, 1,
1.930083, 0.4409448, 1.390573, 0, 0, 0, 1, 1,
1.932932, -0.5754499, 1.358622, 0, 0, 0, 1, 1,
1.975106, 0.7744195, 0.331168, 0, 0, 0, 1, 1,
1.989221, -0.4152725, 1.743369, 0, 0, 0, 1, 1,
1.99123, 0.08779818, 2.350326, 0, 0, 0, 1, 1,
1.9999, -0.7191948, 1.26931, 1, 1, 1, 1, 1,
2.004955, -0.08825221, 0.843083, 1, 1, 1, 1, 1,
2.005643, 0.2261598, 2.242867, 1, 1, 1, 1, 1,
2.010326, -0.3541201, 0.6911376, 1, 1, 1, 1, 1,
2.020969, -0.6744255, 3.318994, 1, 1, 1, 1, 1,
2.055289, 0.9732271, 0.7884321, 1, 1, 1, 1, 1,
2.104557, -0.6073888, 2.43139, 1, 1, 1, 1, 1,
2.127636, -1.513532, 2.106245, 1, 1, 1, 1, 1,
2.173498, 0.1641072, 1.149656, 1, 1, 1, 1, 1,
2.177519, 0.3224045, 0.2569751, 1, 1, 1, 1, 1,
2.181712, -1.429781, 2.319754, 1, 1, 1, 1, 1,
2.195879, -1.7883, 3.525151, 1, 1, 1, 1, 1,
2.213124, -0.9673393, 3.1112, 1, 1, 1, 1, 1,
2.224105, 0.4167351, 2.432736, 1, 1, 1, 1, 1,
2.23446, 0.8127795, 0.6844774, 1, 1, 1, 1, 1,
2.259167, -0.8096728, 0.03255627, 0, 0, 1, 1, 1,
2.272731, 1.546992, 0.433691, 1, 0, 0, 1, 1,
2.301151, -0.4916888, 2.069075, 1, 0, 0, 1, 1,
2.345332, -0.7011117, 1.798659, 1, 0, 0, 1, 1,
2.419337, -0.9668693, 0.9875631, 1, 0, 0, 1, 1,
2.427172, 0.6157455, 2.396493, 1, 0, 0, 1, 1,
2.460788, -0.7595174, 2.157664, 0, 0, 0, 1, 1,
2.477804, 0.4927418, -0.541185, 0, 0, 0, 1, 1,
2.483536, -0.3752226, -0.4499559, 0, 0, 0, 1, 1,
2.546607, 1.754813, 1.313234, 0, 0, 0, 1, 1,
2.582615, -0.2720959, 2.515886, 0, 0, 0, 1, 1,
2.613428, -0.3330444, 1.239814, 0, 0, 0, 1, 1,
2.780226, -0.5799878, 1.789554, 0, 0, 0, 1, 1,
2.791634, 0.5736359, 1.445852, 1, 1, 1, 1, 1,
2.829006, -0.3677267, 1.882143, 1, 1, 1, 1, 1,
2.83171, 0.8454525, 1.881151, 1, 1, 1, 1, 1,
2.879599, -0.2756231, 0.8394637, 1, 1, 1, 1, 1,
2.932911, -0.6317536, 2.022838, 1, 1, 1, 1, 1,
3.082952, -1.443122, 2.888453, 1, 1, 1, 1, 1,
3.427028, 0.682081, 1.7782, 1, 1, 1, 1, 1
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
var radius = 9.603273;
var distance = 33.73109;
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
mvMatrix.translate( 0.1853073, -0.227603, -0.00859499 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.73109);
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
