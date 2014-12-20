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
-3.280326, -0.9392066, -0.3240918, 1, 0, 0, 1,
-2.918411, 0.1404563, 0.3077512, 1, 0.007843138, 0, 1,
-2.900516, 0.06961811, -2.075617, 1, 0.01176471, 0, 1,
-2.678581, -0.5250214, -1.270687, 1, 0.01960784, 0, 1,
-2.574194, 1.471661, -0.9317204, 1, 0.02352941, 0, 1,
-2.572691, -0.5316414, -1.90932, 1, 0.03137255, 0, 1,
-2.508445, -0.9888836, -1.416595, 1, 0.03529412, 0, 1,
-2.481439, 0.7113217, -0.7087532, 1, 0.04313726, 0, 1,
-2.457837, -0.986425, -2.203171, 1, 0.04705882, 0, 1,
-2.41236, 1.284773, -1.612186, 1, 0.05490196, 0, 1,
-2.399934, 0.8064581, -0.09211743, 1, 0.05882353, 0, 1,
-2.389678, 0.1448039, -0.8966225, 1, 0.06666667, 0, 1,
-2.235619, -0.1349647, -1.993708, 1, 0.07058824, 0, 1,
-2.227602, -0.0942166, -3.254505, 1, 0.07843138, 0, 1,
-2.152832, 1.029886, -0.2850507, 1, 0.08235294, 0, 1,
-2.14088, 0.6321349, -0.9489583, 1, 0.09019608, 0, 1,
-2.13519, 0.4093853, -1.271135, 1, 0.09411765, 0, 1,
-2.134812, 1.306837, 0.9249846, 1, 0.1019608, 0, 1,
-2.115897, 1.002726, -1.138107, 1, 0.1098039, 0, 1,
-2.101716, 0.4854499, -2.340994, 1, 0.1137255, 0, 1,
-2.079132, -0.1926723, -3.006892, 1, 0.1215686, 0, 1,
-2.047655, 1.093891, -1.562697, 1, 0.1254902, 0, 1,
-2.024615, -0.4254945, -2.17236, 1, 0.1333333, 0, 1,
-2.014421, -1.233088, -1.59961, 1, 0.1372549, 0, 1,
-1.996319, -1.596107, -3.058412, 1, 0.145098, 0, 1,
-1.988808, 0.2033509, -1.331642, 1, 0.1490196, 0, 1,
-1.970221, -0.4883121, 0.3579431, 1, 0.1568628, 0, 1,
-1.964441, 0.60068, -1.753284, 1, 0.1607843, 0, 1,
-1.940217, 1.597066, -0.8039801, 1, 0.1686275, 0, 1,
-1.914166, -0.6940818, -2.815606, 1, 0.172549, 0, 1,
-1.861714, 0.4121113, -2.248187, 1, 0.1803922, 0, 1,
-1.855317, -0.483309, -0.8487945, 1, 0.1843137, 0, 1,
-1.846801, 0.5039024, -0.5113598, 1, 0.1921569, 0, 1,
-1.840732, 1.88587, -1.420492, 1, 0.1960784, 0, 1,
-1.833135, -1.400776, -3.337085, 1, 0.2039216, 0, 1,
-1.830385, 0.2295139, -2.589662, 1, 0.2117647, 0, 1,
-1.813391, 1.195535, -1.952002, 1, 0.2156863, 0, 1,
-1.806556, -0.6080155, -1.286668, 1, 0.2235294, 0, 1,
-1.803106, -0.1518672, -2.007215, 1, 0.227451, 0, 1,
-1.791921, 0.05021127, -1.798306, 1, 0.2352941, 0, 1,
-1.771183, -1.179485, -2.491309, 1, 0.2392157, 0, 1,
-1.765059, -0.9193047, -2.069588, 1, 0.2470588, 0, 1,
-1.758142, 0.09274241, -0.3989264, 1, 0.2509804, 0, 1,
-1.728633, -0.6852152, 0.06892889, 1, 0.2588235, 0, 1,
-1.715309, -0.2108345, -1.589122, 1, 0.2627451, 0, 1,
-1.705214, -0.6956077, -2.936828, 1, 0.2705882, 0, 1,
-1.670504, -0.02456263, -1.057793, 1, 0.2745098, 0, 1,
-1.661781, 0.2253283, -2.675413, 1, 0.282353, 0, 1,
-1.661166, -1.265973, -1.381856, 1, 0.2862745, 0, 1,
-1.660288, 0.3933167, -1.370199, 1, 0.2941177, 0, 1,
-1.651178, -2.01811, -2.662297, 1, 0.3019608, 0, 1,
-1.646054, -0.5999054, -2.450646, 1, 0.3058824, 0, 1,
-1.617732, -0.8387485, -2.779007, 1, 0.3137255, 0, 1,
-1.590448, -0.8269012, -1.937582, 1, 0.3176471, 0, 1,
-1.583734, -0.975572, -0.8294785, 1, 0.3254902, 0, 1,
-1.580079, -1.025082, -1.152401, 1, 0.3294118, 0, 1,
-1.566309, -0.01879112, -2.349529, 1, 0.3372549, 0, 1,
-1.559114, -0.795949, -2.042999, 1, 0.3411765, 0, 1,
-1.552851, -0.564725, -1.907299, 1, 0.3490196, 0, 1,
-1.526046, 0.5791151, -1.173522, 1, 0.3529412, 0, 1,
-1.519771, -0.1763157, -1.369856, 1, 0.3607843, 0, 1,
-1.505543, -0.204425, -0.5074847, 1, 0.3647059, 0, 1,
-1.497479, 1.208277, -0.1769721, 1, 0.372549, 0, 1,
-1.491345, 0.5880008, -0.3611281, 1, 0.3764706, 0, 1,
-1.487892, -1.787076, -1.992745, 1, 0.3843137, 0, 1,
-1.487339, 1.005453, -0.3245257, 1, 0.3882353, 0, 1,
-1.47885, -0.6401097, -2.549154, 1, 0.3960784, 0, 1,
-1.476901, 0.2517726, -2.912615, 1, 0.4039216, 0, 1,
-1.463999, -0.2293091, -1.974016, 1, 0.4078431, 0, 1,
-1.451253, -1.084616, -2.828447, 1, 0.4156863, 0, 1,
-1.4479, -0.1295672, -1.487846, 1, 0.4196078, 0, 1,
-1.438318, 1.292295, -1.869095, 1, 0.427451, 0, 1,
-1.436879, 1.056795, -1.872018, 1, 0.4313726, 0, 1,
-1.432483, -2.18983, -1.222864, 1, 0.4392157, 0, 1,
-1.430798, 2.275901, 0.1379929, 1, 0.4431373, 0, 1,
-1.427302, -1.362953, -1.151144, 1, 0.4509804, 0, 1,
-1.41907, -0.3915706, -2.510293, 1, 0.454902, 0, 1,
-1.39833, 2.474554, -1.383466, 1, 0.4627451, 0, 1,
-1.39435, 0.6645631, -2.738148, 1, 0.4666667, 0, 1,
-1.390287, 0.02748138, -2.384135, 1, 0.4745098, 0, 1,
-1.384377, -0.06067642, -3.223207, 1, 0.4784314, 0, 1,
-1.381248, 0.6454555, -0.08015426, 1, 0.4862745, 0, 1,
-1.380487, 1.146308, -1.203568, 1, 0.4901961, 0, 1,
-1.376178, -0.4612302, -1.236284, 1, 0.4980392, 0, 1,
-1.359785, -0.9245138, -1.886214, 1, 0.5058824, 0, 1,
-1.354378, 0.1294347, -2.228045, 1, 0.509804, 0, 1,
-1.352676, 1.740501, -0.7993653, 1, 0.5176471, 0, 1,
-1.350827, 0.8498642, 0.2201083, 1, 0.5215687, 0, 1,
-1.347336, 0.254184, -2.779329, 1, 0.5294118, 0, 1,
-1.320108, 0.1942865, 0.4557058, 1, 0.5333334, 0, 1,
-1.316565, -0.9091815, -2.47367, 1, 0.5411765, 0, 1,
-1.315446, 0.1099389, -0.5188066, 1, 0.5450981, 0, 1,
-1.30892, 0.3851429, -3.098195, 1, 0.5529412, 0, 1,
-1.290046, -0.337171, -1.644367, 1, 0.5568628, 0, 1,
-1.288609, -1.508776, -2.994996, 1, 0.5647059, 0, 1,
-1.275308, 0.9286107, -1.437302, 1, 0.5686275, 0, 1,
-1.269967, 0.8986447, -3.098111, 1, 0.5764706, 0, 1,
-1.263602, 0.05481623, -2.264325, 1, 0.5803922, 0, 1,
-1.258032, 0.02166719, -1.271107, 1, 0.5882353, 0, 1,
-1.25325, 1.236686, 0.7984053, 1, 0.5921569, 0, 1,
-1.253089, 0.2895781, -1.987198, 1, 0.6, 0, 1,
-1.241112, 1.366581, -0.6417062, 1, 0.6078432, 0, 1,
-1.238378, -0.6199154, -2.883863, 1, 0.6117647, 0, 1,
-1.235394, 2.270175, 0.1751583, 1, 0.6196079, 0, 1,
-1.235212, -0.5976788, -2.058631, 1, 0.6235294, 0, 1,
-1.229327, -1.167675, -3.64368, 1, 0.6313726, 0, 1,
-1.216928, 0.1628476, -2.702993, 1, 0.6352941, 0, 1,
-1.21687, -1.476033, -0.5149206, 1, 0.6431373, 0, 1,
-1.215986, 0.7142988, -0.04391592, 1, 0.6470588, 0, 1,
-1.211694, -0.7453827, -2.210599, 1, 0.654902, 0, 1,
-1.204935, 0.0407405, -1.101331, 1, 0.6588235, 0, 1,
-1.202982, 1.543727, -1.57891, 1, 0.6666667, 0, 1,
-1.196345, 0.3489843, -0.5654142, 1, 0.6705883, 0, 1,
-1.193444, 2.1118, -0.4858114, 1, 0.6784314, 0, 1,
-1.192089, 0.7908952, -2.095562, 1, 0.682353, 0, 1,
-1.185343, -0.7680615, -1.853729, 1, 0.6901961, 0, 1,
-1.183392, -0.3409256, -2.653528, 1, 0.6941177, 0, 1,
-1.178623, -0.007025545, -2.595084, 1, 0.7019608, 0, 1,
-1.17834, 1.145286, -0.6568509, 1, 0.7098039, 0, 1,
-1.170396, -0.1963412, -1.791622, 1, 0.7137255, 0, 1,
-1.158253, 0.3511775, 0.04961015, 1, 0.7215686, 0, 1,
-1.152646, -0.2283807, -2.002349, 1, 0.7254902, 0, 1,
-1.143284, -1.178413, -1.910324, 1, 0.7333333, 0, 1,
-1.141157, -0.8632097, -0.5013102, 1, 0.7372549, 0, 1,
-1.139011, -0.7360072, -1.709126, 1, 0.7450981, 0, 1,
-1.136645, -0.8275276, -1.720104, 1, 0.7490196, 0, 1,
-1.135841, -1.826939, -2.824673, 1, 0.7568628, 0, 1,
-1.134117, 0.5065091, -2.044631, 1, 0.7607843, 0, 1,
-1.111438, 0.8871632, 0.8717862, 1, 0.7686275, 0, 1,
-1.108688, -0.2823657, -1.441082, 1, 0.772549, 0, 1,
-1.105958, 1.402542, -1.045081, 1, 0.7803922, 0, 1,
-1.096827, 0.4531596, 0.257023, 1, 0.7843137, 0, 1,
-1.096217, 0.9106857, -0.796649, 1, 0.7921569, 0, 1,
-1.086032, 1.15503, 0.2979976, 1, 0.7960784, 0, 1,
-1.079463, -0.08996001, -1.545017, 1, 0.8039216, 0, 1,
-1.068184, 0.02935087, -1.999163, 1, 0.8117647, 0, 1,
-1.067628, 2.270077, -1.621932, 1, 0.8156863, 0, 1,
-1.062243, 1.131167, -1.334727, 1, 0.8235294, 0, 1,
-1.060176, 0.738987, -1.707247, 1, 0.827451, 0, 1,
-1.047374, 1.127887, -2.083556, 1, 0.8352941, 0, 1,
-1.043966, 0.3860351, -1.691005, 1, 0.8392157, 0, 1,
-1.033893, 0.9583162, 0.8215487, 1, 0.8470588, 0, 1,
-1.033346, -1.161566, -2.726288, 1, 0.8509804, 0, 1,
-1.032813, 0.3985707, -2.797695, 1, 0.8588235, 0, 1,
-1.031695, 0.3794678, -2.151963, 1, 0.8627451, 0, 1,
-1.030652, 2.063736, -0.09649424, 1, 0.8705882, 0, 1,
-1.029529, 0.6789458, -3.288397, 1, 0.8745098, 0, 1,
-1.028702, -0.03937699, -0.03343486, 1, 0.8823529, 0, 1,
-1.021581, -1.488179, -2.644171, 1, 0.8862745, 0, 1,
-1.021132, 0.7506727, -0.5029442, 1, 0.8941177, 0, 1,
-1.016821, 0.7587657, -0.2449067, 1, 0.8980392, 0, 1,
-1.016321, -0.2906131, -2.472062, 1, 0.9058824, 0, 1,
-1.014464, 1.842048, 1.03465, 1, 0.9137255, 0, 1,
-1.012589, 0.1967511, -1.885511, 1, 0.9176471, 0, 1,
-1.011641, -0.4588115, -1.272863, 1, 0.9254902, 0, 1,
-1.010874, -2.372546, -2.713562, 1, 0.9294118, 0, 1,
-1.010613, 0.4210346, -1.417857, 1, 0.9372549, 0, 1,
-1.008024, -1.59195, -3.251181, 1, 0.9411765, 0, 1,
-0.9995579, 0.9799371, -1.961349, 1, 0.9490196, 0, 1,
-0.9974644, -1.634393, -1.995435, 1, 0.9529412, 0, 1,
-0.9963794, 0.134024, -2.248576, 1, 0.9607843, 0, 1,
-0.9953223, -0.2624237, -1.950894, 1, 0.9647059, 0, 1,
-0.9938449, -1.273935, -2.25795, 1, 0.972549, 0, 1,
-0.9901109, -0.640582, -2.727156, 1, 0.9764706, 0, 1,
-0.9816949, 1.473353, -0.3974624, 1, 0.9843137, 0, 1,
-0.9784309, -0.02388665, -2.317934, 1, 0.9882353, 0, 1,
-0.9759981, -0.1326686, -2.518495, 1, 0.9960784, 0, 1,
-0.9627897, 0.4661635, -2.104075, 0.9960784, 1, 0, 1,
-0.9597251, 2.831542, -1.325052, 0.9921569, 1, 0, 1,
-0.9578586, -0.3307353, -3.144739, 0.9843137, 1, 0, 1,
-0.9528427, -1.896608, -2.252534, 0.9803922, 1, 0, 1,
-0.9507889, 1.031438, -1.235051, 0.972549, 1, 0, 1,
-0.9490658, -0.5208175, -2.024549, 0.9686275, 1, 0, 1,
-0.9418926, 1.669729, -0.4239775, 0.9607843, 1, 0, 1,
-0.9345241, 0.9575166, -1.057386, 0.9568627, 1, 0, 1,
-0.9334453, 0.725367, -0.1292015, 0.9490196, 1, 0, 1,
-0.9287478, -1.043062, -2.630544, 0.945098, 1, 0, 1,
-0.9255965, -0.3439502, -2.831918, 0.9372549, 1, 0, 1,
-0.9246294, -0.7931179, -2.04698, 0.9333333, 1, 0, 1,
-0.9233731, -0.7387304, -3.481371, 0.9254902, 1, 0, 1,
-0.9173475, -0.08658198, -0.9176645, 0.9215686, 1, 0, 1,
-0.913646, 0.1598475, 0.1292645, 0.9137255, 1, 0, 1,
-0.9125335, -1.408125, -1.642991, 0.9098039, 1, 0, 1,
-0.912157, 0.2739498, -0.4313413, 0.9019608, 1, 0, 1,
-0.9106511, 1.601158, 0.9392112, 0.8941177, 1, 0, 1,
-0.9086527, 0.9792417, -1.778889, 0.8901961, 1, 0, 1,
-0.905602, 0.254604, -0.8381225, 0.8823529, 1, 0, 1,
-0.9046202, 0.1564821, -2.818865, 0.8784314, 1, 0, 1,
-0.9001263, 1.884307, -0.7435945, 0.8705882, 1, 0, 1,
-0.8994679, 1.110353, 1.467333, 0.8666667, 1, 0, 1,
-0.8923, -0.6487935, -1.850954, 0.8588235, 1, 0, 1,
-0.889213, 0.03732771, -1.773089, 0.854902, 1, 0, 1,
-0.8860903, 1.109607, -1.652132, 0.8470588, 1, 0, 1,
-0.8824379, 1.629702, 0.4290569, 0.8431373, 1, 0, 1,
-0.8823217, -1.067178, -2.162805, 0.8352941, 1, 0, 1,
-0.8821075, -0.8895241, -3.540864, 0.8313726, 1, 0, 1,
-0.8789413, -0.1805795, -2.166647, 0.8235294, 1, 0, 1,
-0.8787164, -0.5575851, -3.64447, 0.8196079, 1, 0, 1,
-0.8750324, 0.9741048, -1.273955, 0.8117647, 1, 0, 1,
-0.873993, -0.3744114, -1.924881, 0.8078431, 1, 0, 1,
-0.8691747, -1.353954, -2.824197, 0.8, 1, 0, 1,
-0.8653148, 0.009410382, -2.163112, 0.7921569, 1, 0, 1,
-0.8626709, -1.634167, -2.359241, 0.7882353, 1, 0, 1,
-0.8575963, 0.2737029, -0.7175118, 0.7803922, 1, 0, 1,
-0.8555767, 0.8726377, -0.2595663, 0.7764706, 1, 0, 1,
-0.8544925, -0.7573357, -3.508343, 0.7686275, 1, 0, 1,
-0.8490775, -0.3126089, -2.657301, 0.7647059, 1, 0, 1,
-0.845386, 0.09941777, -1.281777, 0.7568628, 1, 0, 1,
-0.8381516, -1.479659, -1.719481, 0.7529412, 1, 0, 1,
-0.8344856, 0.381255, -3.669502, 0.7450981, 1, 0, 1,
-0.8330424, 1.013768, -1.451691, 0.7411765, 1, 0, 1,
-0.8274574, -0.1057019, -2.657378, 0.7333333, 1, 0, 1,
-0.8274107, -0.6661149, -3.417656, 0.7294118, 1, 0, 1,
-0.8216856, 3.065121, -1.546501, 0.7215686, 1, 0, 1,
-0.8165303, 0.4125997, -0.8160989, 0.7176471, 1, 0, 1,
-0.8149636, -0.5037231, -3.201679, 0.7098039, 1, 0, 1,
-0.8127941, 1.72662, -1.573553, 0.7058824, 1, 0, 1,
-0.8067832, 0.2090643, -1.360161, 0.6980392, 1, 0, 1,
-0.804624, 0.6704518, -1.567488, 0.6901961, 1, 0, 1,
-0.7992396, -1.613807, -4.092978, 0.6862745, 1, 0, 1,
-0.7982021, -0.1797445, -1.180224, 0.6784314, 1, 0, 1,
-0.7967568, -0.1085364, -1.895455, 0.6745098, 1, 0, 1,
-0.7964352, -0.7355005, -2.021411, 0.6666667, 1, 0, 1,
-0.7932238, -0.1831383, -1.699166, 0.6627451, 1, 0, 1,
-0.7683103, 2.088931, 0.8664377, 0.654902, 1, 0, 1,
-0.7682154, 0.5109739, 1.307948, 0.6509804, 1, 0, 1,
-0.758174, -2.164883, -4.290691, 0.6431373, 1, 0, 1,
-0.7529167, 0.6374441, -0.2246783, 0.6392157, 1, 0, 1,
-0.7435914, 0.6687799, -2.433651, 0.6313726, 1, 0, 1,
-0.7421989, 0.2849578, -1.354381, 0.627451, 1, 0, 1,
-0.7398636, 0.1475229, -3.570923, 0.6196079, 1, 0, 1,
-0.7390568, 1.749621, -0.8691055, 0.6156863, 1, 0, 1,
-0.7261499, 0.6158211, -2.428486, 0.6078432, 1, 0, 1,
-0.7221269, -0.4806003, -0.813186, 0.6039216, 1, 0, 1,
-0.7170613, 0.4471881, 1.058031, 0.5960785, 1, 0, 1,
-0.7104205, 0.1679386, -2.481598, 0.5882353, 1, 0, 1,
-0.7087141, -0.07494441, -3.089253, 0.5843138, 1, 0, 1,
-0.706834, -0.3098983, -2.803205, 0.5764706, 1, 0, 1,
-0.7063543, -1.637737, -3.730585, 0.572549, 1, 0, 1,
-0.7056228, -0.7452791, -1.894776, 0.5647059, 1, 0, 1,
-0.7015073, -1.872485, -2.357071, 0.5607843, 1, 0, 1,
-0.690522, -0.7024812, -3.429027, 0.5529412, 1, 0, 1,
-0.6898479, -0.5818608, -1.274418, 0.5490196, 1, 0, 1,
-0.6872128, -0.1518392, -1.851405, 0.5411765, 1, 0, 1,
-0.6860342, 0.04749829, -0.9710381, 0.5372549, 1, 0, 1,
-0.6781, 1.344225, -0.4218709, 0.5294118, 1, 0, 1,
-0.6734148, 0.5152788, -1.881239, 0.5254902, 1, 0, 1,
-0.6694022, 0.07237267, -1.750051, 0.5176471, 1, 0, 1,
-0.666747, 0.709217, 0.3207864, 0.5137255, 1, 0, 1,
-0.6656598, -0.1510914, -3.228515, 0.5058824, 1, 0, 1,
-0.6637484, 0.8674181, -0.142582, 0.5019608, 1, 0, 1,
-0.6619887, -0.4059812, -0.5274915, 0.4941176, 1, 0, 1,
-0.6614049, 1.197905, -0.4040025, 0.4862745, 1, 0, 1,
-0.6595863, -0.3182778, -0.2761264, 0.4823529, 1, 0, 1,
-0.6571276, -0.1928922, -2.299842, 0.4745098, 1, 0, 1,
-0.6559537, -1.305695, -4.325742, 0.4705882, 1, 0, 1,
-0.6479892, -0.9029806, -1.415929, 0.4627451, 1, 0, 1,
-0.6477048, -1.29479, -3.522306, 0.4588235, 1, 0, 1,
-0.6451371, 1.359227, -0.4095278, 0.4509804, 1, 0, 1,
-0.6405521, 0.3337179, -1.835986, 0.4470588, 1, 0, 1,
-0.6317577, 1.000188, -0.8417451, 0.4392157, 1, 0, 1,
-0.6272939, 0.06616364, -2.597061, 0.4352941, 1, 0, 1,
-0.6233126, -0.8197662, -3.232019, 0.427451, 1, 0, 1,
-0.6208397, 1.55149, 0.5094804, 0.4235294, 1, 0, 1,
-0.6103816, 0.0918209, -3.020026, 0.4156863, 1, 0, 1,
-0.6001218, 0.02527143, -2.018967, 0.4117647, 1, 0, 1,
-0.5948452, 0.628718, -2.140536, 0.4039216, 1, 0, 1,
-0.5932277, 1.891679, 0.7709584, 0.3960784, 1, 0, 1,
-0.5877731, -0.9725478, -3.213235, 0.3921569, 1, 0, 1,
-0.5857548, 0.881814, 0.5376108, 0.3843137, 1, 0, 1,
-0.5854531, -1.092119, -2.621248, 0.3803922, 1, 0, 1,
-0.5816148, -0.3382947, -2.405292, 0.372549, 1, 0, 1,
-0.5787317, -1.014239, -2.659626, 0.3686275, 1, 0, 1,
-0.5768459, -1.465442, -2.380718, 0.3607843, 1, 0, 1,
-0.5751218, 0.0730288, -1.819426, 0.3568628, 1, 0, 1,
-0.5608474, -0.6295977, -1.439422, 0.3490196, 1, 0, 1,
-0.5585822, 0.3124132, -0.100968, 0.345098, 1, 0, 1,
-0.5585376, 0.0206201, -2.112509, 0.3372549, 1, 0, 1,
-0.5578467, -0.6775072, -0.939568, 0.3333333, 1, 0, 1,
-0.5531361, -0.974928, -2.772681, 0.3254902, 1, 0, 1,
-0.5525065, -0.009541675, -1.689511, 0.3215686, 1, 0, 1,
-0.5512417, -0.2765968, -1.577068, 0.3137255, 1, 0, 1,
-0.5464822, 0.2503628, -1.75493, 0.3098039, 1, 0, 1,
-0.5421168, 1.288774, -0.08696952, 0.3019608, 1, 0, 1,
-0.5408719, 1.242879, -1.621814, 0.2941177, 1, 0, 1,
-0.5294079, -0.7406828, -3.162828, 0.2901961, 1, 0, 1,
-0.5289215, 0.5545624, -0.07972592, 0.282353, 1, 0, 1,
-0.5277187, -0.5894419, -1.549438, 0.2784314, 1, 0, 1,
-0.5245633, 2.154466, -1.435613, 0.2705882, 1, 0, 1,
-0.5223503, -0.7722041, -3.154046, 0.2666667, 1, 0, 1,
-0.5173304, 0.2179615, -2.816885, 0.2588235, 1, 0, 1,
-0.5162259, -0.6466851, -3.956783, 0.254902, 1, 0, 1,
-0.5150893, -0.4765908, -2.638646, 0.2470588, 1, 0, 1,
-0.5111076, -1.74417, -3.319124, 0.2431373, 1, 0, 1,
-0.5073361, -0.7245873, -0.2284643, 0.2352941, 1, 0, 1,
-0.5070507, -0.2752184, -1.974487, 0.2313726, 1, 0, 1,
-0.5044384, 0.8314094, 0.3395946, 0.2235294, 1, 0, 1,
-0.497033, 0.7072471, -1.455501, 0.2196078, 1, 0, 1,
-0.4964632, 0.4563687, -1.58924, 0.2117647, 1, 0, 1,
-0.4949416, -1.784911, -1.977997, 0.2078431, 1, 0, 1,
-0.4890189, 1.584032, -1.386099, 0.2, 1, 0, 1,
-0.4883492, 0.5767101, -1.048689, 0.1921569, 1, 0, 1,
-0.4847578, -0.3485297, -3.462142, 0.1882353, 1, 0, 1,
-0.4844044, -2.060502, -3.089062, 0.1803922, 1, 0, 1,
-0.4823329, -0.4255441, -3.751292, 0.1764706, 1, 0, 1,
-0.4800266, -0.6962643, -2.966922, 0.1686275, 1, 0, 1,
-0.4773074, 0.3310099, -1.138079, 0.1647059, 1, 0, 1,
-0.4746179, 0.9721463, 0.2321022, 0.1568628, 1, 0, 1,
-0.471525, 0.4112652, -2.71592, 0.1529412, 1, 0, 1,
-0.4700025, -2.321051, -0.8857233, 0.145098, 1, 0, 1,
-0.4680144, -0.5396461, -2.248549, 0.1411765, 1, 0, 1,
-0.467263, 0.262392, -1.764213, 0.1333333, 1, 0, 1,
-0.466696, -0.6369378, -3.101274, 0.1294118, 1, 0, 1,
-0.4657069, -0.406149, -2.274218, 0.1215686, 1, 0, 1,
-0.4646794, 2.850152, 0.8800831, 0.1176471, 1, 0, 1,
-0.4614773, 1.616338, -2.991401, 0.1098039, 1, 0, 1,
-0.455924, 0.4063962, 0.07117292, 0.1058824, 1, 0, 1,
-0.4493099, 0.0763071, -0.22593, 0.09803922, 1, 0, 1,
-0.4489652, 0.9414368, -0.6016567, 0.09019608, 1, 0, 1,
-0.4476018, 1.053422, -1.219168, 0.08627451, 1, 0, 1,
-0.4462956, 1.825407, -0.4380286, 0.07843138, 1, 0, 1,
-0.4459971, 0.731301, -0.549957, 0.07450981, 1, 0, 1,
-0.4446889, -0.2798512, -2.575428, 0.06666667, 1, 0, 1,
-0.4336597, 1.760871, -0.8419206, 0.0627451, 1, 0, 1,
-0.4308899, -0.7023314, -3.29552, 0.05490196, 1, 0, 1,
-0.429751, -0.3486315, -2.215582, 0.05098039, 1, 0, 1,
-0.4271287, 0.2500915, 0.6007047, 0.04313726, 1, 0, 1,
-0.4260135, 0.5108919, -0.4079924, 0.03921569, 1, 0, 1,
-0.4241093, -0.3601487, -2.415463, 0.03137255, 1, 0, 1,
-0.4227844, -0.2860426, -1.106997, 0.02745098, 1, 0, 1,
-0.4216969, -0.6397188, -2.492633, 0.01960784, 1, 0, 1,
-0.4196199, -0.7562077, -2.87325, 0.01568628, 1, 0, 1,
-0.4195939, 1.398124, -1.376427, 0.007843138, 1, 0, 1,
-0.418346, 0.5949804, -0.9035677, 0.003921569, 1, 0, 1,
-0.4125792, 0.1278071, -0.09264321, 0, 1, 0.003921569, 1,
-0.4123537, -0.04354943, -1.150104, 0, 1, 0.01176471, 1,
-0.4079727, -1.150587, -3.598729, 0, 1, 0.01568628, 1,
-0.4046835, 1.118576, 1.351019, 0, 1, 0.02352941, 1,
-0.4005049, -2.140032, -1.647914, 0, 1, 0.02745098, 1,
-0.3997788, -0.6048843, -4.294807, 0, 1, 0.03529412, 1,
-0.3980518, -1.185239, -2.064475, 0, 1, 0.03921569, 1,
-0.3976557, 0.4775313, 0.5539702, 0, 1, 0.04705882, 1,
-0.3957618, -0.2110911, -0.6600338, 0, 1, 0.05098039, 1,
-0.3917646, 0.6216487, 0.9903508, 0, 1, 0.05882353, 1,
-0.3767369, 0.02029166, -1.568688, 0, 1, 0.0627451, 1,
-0.376552, -0.284205, -1.989516, 0, 1, 0.07058824, 1,
-0.3735433, 1.414125, -0.0003326014, 0, 1, 0.07450981, 1,
-0.3720631, 0.5316117, -0.4903074, 0, 1, 0.08235294, 1,
-0.3712435, 0.7802623, -0.3670766, 0, 1, 0.08627451, 1,
-0.3626013, -1.751152, -2.623262, 0, 1, 0.09411765, 1,
-0.3593023, 0.6430117, -1.197523, 0, 1, 0.1019608, 1,
-0.3561682, 0.4716849, 0.06237848, 0, 1, 0.1058824, 1,
-0.3540997, -0.643315, -3.111018, 0, 1, 0.1137255, 1,
-0.3485366, -0.6545345, -2.641286, 0, 1, 0.1176471, 1,
-0.3479079, 2.061942, 0.5640521, 0, 1, 0.1254902, 1,
-0.3461817, -1.924907, -2.106298, 0, 1, 0.1294118, 1,
-0.3460861, -0.378755, -1.107949, 0, 1, 0.1372549, 1,
-0.3442041, 1.974084, -2.996759, 0, 1, 0.1411765, 1,
-0.342886, -1.228122, -2.321831, 0, 1, 0.1490196, 1,
-0.3396799, -0.4711596, -2.706354, 0, 1, 0.1529412, 1,
-0.3381435, 0.4173459, -2.235319, 0, 1, 0.1607843, 1,
-0.335887, -0.01098789, -1.116045, 0, 1, 0.1647059, 1,
-0.333937, -0.270202, -2.792943, 0, 1, 0.172549, 1,
-0.3332627, -2.24598, -1.147919, 0, 1, 0.1764706, 1,
-0.3282462, -1.024343, 0.2517623, 0, 1, 0.1843137, 1,
-0.3239941, -0.1313521, -0.08276726, 0, 1, 0.1882353, 1,
-0.3205669, -2.020434, -2.069099, 0, 1, 0.1960784, 1,
-0.3144091, -0.05745787, -0.6746853, 0, 1, 0.2039216, 1,
-0.3126218, 0.7371596, 0.3468184, 0, 1, 0.2078431, 1,
-0.3089484, -0.2450671, -0.5975324, 0, 1, 0.2156863, 1,
-0.3072694, 1.457998, -1.953704, 0, 1, 0.2196078, 1,
-0.3070645, 1.637049, 1.037278, 0, 1, 0.227451, 1,
-0.3037033, 0.04697559, -1.681187, 0, 1, 0.2313726, 1,
-0.2954715, 0.3920567, -0.1785604, 0, 1, 0.2392157, 1,
-0.2914279, 0.02795751, -1.880096, 0, 1, 0.2431373, 1,
-0.2913595, -0.7877195, -1.980346, 0, 1, 0.2509804, 1,
-0.2867963, 0.3765526, 0.1457102, 0, 1, 0.254902, 1,
-0.2808683, 0.3472329, -1.811473, 0, 1, 0.2627451, 1,
-0.2805634, -0.4175143, -3.620026, 0, 1, 0.2666667, 1,
-0.28048, -0.5118342, -2.624773, 0, 1, 0.2745098, 1,
-0.2753144, -1.657787, -2.926259, 0, 1, 0.2784314, 1,
-0.2737152, 1.073692, 0.8389587, 0, 1, 0.2862745, 1,
-0.2734846, 0.207746, -2.002491, 0, 1, 0.2901961, 1,
-0.2711502, -0.3801804, -3.543034, 0, 1, 0.2980392, 1,
-0.2636831, -0.7440564, -2.218878, 0, 1, 0.3058824, 1,
-0.2577856, -1.159044, -2.570237, 0, 1, 0.3098039, 1,
-0.2554302, 0.008041898, -0.1234735, 0, 1, 0.3176471, 1,
-0.2544748, -1.362075, -2.539097, 0, 1, 0.3215686, 1,
-0.2530404, 2.45331, 0.2344071, 0, 1, 0.3294118, 1,
-0.2499457, 0.6126205, 1.344887, 0, 1, 0.3333333, 1,
-0.2498317, -2.352365, -3.545034, 0, 1, 0.3411765, 1,
-0.2489381, 1.177375, 0.7079985, 0, 1, 0.345098, 1,
-0.2485683, -0.442413, -3.094072, 0, 1, 0.3529412, 1,
-0.2440282, 1.90338, -0.7913693, 0, 1, 0.3568628, 1,
-0.2422835, -0.5086324, -2.084474, 0, 1, 0.3647059, 1,
-0.2375941, 1.548192, -0.213406, 0, 1, 0.3686275, 1,
-0.2339301, -1.295366, -3.247288, 0, 1, 0.3764706, 1,
-0.233519, 0.8019239, 2.145657, 0, 1, 0.3803922, 1,
-0.2330218, -1.43902, -4.056071, 0, 1, 0.3882353, 1,
-0.231543, -0.9227768, -4.774438, 0, 1, 0.3921569, 1,
-0.229803, -1.684251, -3.549098, 0, 1, 0.4, 1,
-0.2282173, 0.0824707, -2.270264, 0, 1, 0.4078431, 1,
-0.2275245, 1.572644, 2.245641, 0, 1, 0.4117647, 1,
-0.2264022, 0.405436, -0.6137576, 0, 1, 0.4196078, 1,
-0.2256011, 0.2995971, -1.672117, 0, 1, 0.4235294, 1,
-0.2226872, 1.313728, -1.160236, 0, 1, 0.4313726, 1,
-0.2212379, 1.722819, -0.7685992, 0, 1, 0.4352941, 1,
-0.2196746, 2.055556, 0.800865, 0, 1, 0.4431373, 1,
-0.2188384, -0.4320764, -3.502877, 0, 1, 0.4470588, 1,
-0.2188071, 0.3552146, -1.358596, 0, 1, 0.454902, 1,
-0.2176408, 0.3436564, -0.9556764, 0, 1, 0.4588235, 1,
-0.2156284, 0.2290167, -1.569271, 0, 1, 0.4666667, 1,
-0.2120802, -0.02427995, -1.877379, 0, 1, 0.4705882, 1,
-0.208647, 1.471677, -0.6242689, 0, 1, 0.4784314, 1,
-0.2084981, -0.8321428, -2.792731, 0, 1, 0.4823529, 1,
-0.2032815, -0.06993402, -2.585827, 0, 1, 0.4901961, 1,
-0.203167, -1.153147, -3.19096, 0, 1, 0.4941176, 1,
-0.2029787, 0.909095, -0.1049639, 0, 1, 0.5019608, 1,
-0.1948015, 0.9696504, -0.2902425, 0, 1, 0.509804, 1,
-0.1919681, 0.7368108, 0.1164004, 0, 1, 0.5137255, 1,
-0.1909844, -0.01169903, -1.153063, 0, 1, 0.5215687, 1,
-0.1896098, 1.038484, -0.6481156, 0, 1, 0.5254902, 1,
-0.1875147, -0.6259845, -0.8693359, 0, 1, 0.5333334, 1,
-0.186661, 0.4756624, -0.804754, 0, 1, 0.5372549, 1,
-0.1842321, -2.532557, -2.757438, 0, 1, 0.5450981, 1,
-0.176363, -0.06455955, -2.130196, 0, 1, 0.5490196, 1,
-0.1738777, -0.2327051, -2.949144, 0, 1, 0.5568628, 1,
-0.172828, -0.518956, -3.28197, 0, 1, 0.5607843, 1,
-0.1680524, -0.4765264, -3.970461, 0, 1, 0.5686275, 1,
-0.1604542, -1.208534, -3.720827, 0, 1, 0.572549, 1,
-0.152944, 0.05786339, -1.001163, 0, 1, 0.5803922, 1,
-0.1527496, -0.6763931, -4.067649, 0, 1, 0.5843138, 1,
-0.1507104, 0.1137656, 0.3314966, 0, 1, 0.5921569, 1,
-0.1431282, 1.186784, -0.9974089, 0, 1, 0.5960785, 1,
-0.1396009, 1.068465, -2.326314, 0, 1, 0.6039216, 1,
-0.1363295, -0.9310933, -3.966152, 0, 1, 0.6117647, 1,
-0.1229394, 0.165727, 0.708124, 0, 1, 0.6156863, 1,
-0.117931, -0.5489008, -3.060488, 0, 1, 0.6235294, 1,
-0.1156162, 0.8431605, -0.4600606, 0, 1, 0.627451, 1,
-0.1138599, 0.3629711, -1.51163, 0, 1, 0.6352941, 1,
-0.1126128, -0.1603911, -1.091725, 0, 1, 0.6392157, 1,
-0.1091885, -0.5333109, -4.100083, 0, 1, 0.6470588, 1,
-0.1061247, -0.921714, -2.248074, 0, 1, 0.6509804, 1,
-0.105583, -0.07103708, -2.230142, 0, 1, 0.6588235, 1,
-0.1041702, 0.9772699, -0.2250423, 0, 1, 0.6627451, 1,
-0.1026172, -0.7609997, -1.353174, 0, 1, 0.6705883, 1,
-0.09986085, -2.877684, -4.189342, 0, 1, 0.6745098, 1,
-0.09450512, 0.3918583, 0.5407649, 0, 1, 0.682353, 1,
-0.09372795, -0.9589189, -4.405748, 0, 1, 0.6862745, 1,
-0.09208245, 1.481991, 0.3894293, 0, 1, 0.6941177, 1,
-0.08779172, -1.030693, -1.543804, 0, 1, 0.7019608, 1,
-0.08301301, -0.4308853, -3.409858, 0, 1, 0.7058824, 1,
-0.08241688, 0.4068749, -1.023541, 0, 1, 0.7137255, 1,
-0.08186599, -0.4104644, -2.73999, 0, 1, 0.7176471, 1,
-0.07526608, 0.758321, -0.8416885, 0, 1, 0.7254902, 1,
-0.07190592, 0.03960324, -0.4806557, 0, 1, 0.7294118, 1,
-0.07040618, 0.2174856, -1.41159, 0, 1, 0.7372549, 1,
-0.0646971, -0.310129, -2.693084, 0, 1, 0.7411765, 1,
-0.06174622, 1.725314, 0.6941616, 0, 1, 0.7490196, 1,
-0.05807236, -0.7949154, -3.069176, 0, 1, 0.7529412, 1,
-0.05533027, -1.287593, -3.970071, 0, 1, 0.7607843, 1,
-0.04005333, -1.044744, -2.951787, 0, 1, 0.7647059, 1,
-0.03604523, -1.799497, -2.992205, 0, 1, 0.772549, 1,
-0.03426304, 0.6319776, -1.25683, 0, 1, 0.7764706, 1,
-0.03407973, -1.152241, -3.766222, 0, 1, 0.7843137, 1,
-0.03296072, -0.5826287, -3.694771, 0, 1, 0.7882353, 1,
-0.03294517, -1.110316, -4.036738, 0, 1, 0.7960784, 1,
-0.03279389, 0.95749, -0.7563956, 0, 1, 0.8039216, 1,
-0.03167412, -1.020933, -2.811985, 0, 1, 0.8078431, 1,
-0.03064728, 0.312861, -1.716055, 0, 1, 0.8156863, 1,
-0.02733754, -0.6301717, -4.817285, 0, 1, 0.8196079, 1,
-0.02692338, 0.05615935, -0.5676007, 0, 1, 0.827451, 1,
-0.02252675, -0.6802419, -1.820832, 0, 1, 0.8313726, 1,
-0.02220495, -0.2341092, -2.34078, 0, 1, 0.8392157, 1,
-0.02208876, 0.02707896, -0.3279201, 0, 1, 0.8431373, 1,
-0.0197405, 1.648252, 0.4260966, 0, 1, 0.8509804, 1,
-0.01951187, -0.1891903, -3.058226, 0, 1, 0.854902, 1,
-0.01941101, -0.2408511, -2.33946, 0, 1, 0.8627451, 1,
-0.01736899, 0.2029779, -0.4446206, 0, 1, 0.8666667, 1,
-0.01617356, -1.094378, -3.109553, 0, 1, 0.8745098, 1,
-0.01533731, 1.076881, 0.301108, 0, 1, 0.8784314, 1,
-0.008113069, -0.2238243, -3.541088, 0, 1, 0.8862745, 1,
-0.005155874, 0.8422158, -1.607433, 0, 1, 0.8901961, 1,
0.002706754, 2.139121, -0.3969315, 0, 1, 0.8980392, 1,
0.003121937, -1.20893, 3.679476, 0, 1, 0.9058824, 1,
0.004647788, -1.027357, 2.468697, 0, 1, 0.9098039, 1,
0.007958313, -1.690744, 2.936009, 0, 1, 0.9176471, 1,
0.009212429, -0.8734525, 2.164033, 0, 1, 0.9215686, 1,
0.01017187, -1.686511, 3.410656, 0, 1, 0.9294118, 1,
0.01088852, -0.9063061, 2.958519, 0, 1, 0.9333333, 1,
0.01267705, -2.270036, 2.772097, 0, 1, 0.9411765, 1,
0.01843392, 0.9842026, 1.070299, 0, 1, 0.945098, 1,
0.02118685, -0.5993997, 3.316741, 0, 1, 0.9529412, 1,
0.02521432, -0.8579079, 3.156043, 0, 1, 0.9568627, 1,
0.02590076, -0.9976667, 1.984164, 0, 1, 0.9647059, 1,
0.02877938, 0.1228938, 0.7391918, 0, 1, 0.9686275, 1,
0.03464573, 0.06317609, 1.397023, 0, 1, 0.9764706, 1,
0.03645351, 0.0694712, 0.858576, 0, 1, 0.9803922, 1,
0.03838359, 2.626754, -1.042481, 0, 1, 0.9882353, 1,
0.03843457, 1.570327, 0.0381793, 0, 1, 0.9921569, 1,
0.0384374, 1.66617, -0.7200513, 0, 1, 1, 1,
0.04094808, 0.371895, 0.7331426, 0, 0.9921569, 1, 1,
0.04162036, -0.1393891, 4.25244, 0, 0.9882353, 1, 1,
0.04296027, 0.2951086, 0.4414109, 0, 0.9803922, 1, 1,
0.04473675, 0.3497103, -0.8575469, 0, 0.9764706, 1, 1,
0.0454674, -1.001815, 1.867894, 0, 0.9686275, 1, 1,
0.04685615, -1.190171, 1.369282, 0, 0.9647059, 1, 1,
0.04837725, -0.8028554, 3.503903, 0, 0.9568627, 1, 1,
0.04878876, 0.1137953, 0.2320241, 0, 0.9529412, 1, 1,
0.04923918, 2.076086, 0.2156295, 0, 0.945098, 1, 1,
0.0514323, 0.7955124, -0.1877732, 0, 0.9411765, 1, 1,
0.05232573, 1.365013, 1.198083, 0, 0.9333333, 1, 1,
0.05238018, -1.744206, 0.7415577, 0, 0.9294118, 1, 1,
0.05278039, -0.6556326, 3.422736, 0, 0.9215686, 1, 1,
0.05298381, 0.2676381, -0.8028407, 0, 0.9176471, 1, 1,
0.05728459, 0.1609749, 0.1270705, 0, 0.9098039, 1, 1,
0.05970039, -0.8612022, 3.129883, 0, 0.9058824, 1, 1,
0.06039509, 0.2213442, 1.197511, 0, 0.8980392, 1, 1,
0.06132094, 1.349995, 1.998646, 0, 0.8901961, 1, 1,
0.06326897, -0.4135295, 3.421667, 0, 0.8862745, 1, 1,
0.06513152, -1.081537, 2.741214, 0, 0.8784314, 1, 1,
0.06908575, -1.077222, 4.670267, 0, 0.8745098, 1, 1,
0.07057483, -0.8537287, 3.014234, 0, 0.8666667, 1, 1,
0.07074729, 0.358281, -0.5490401, 0, 0.8627451, 1, 1,
0.07367267, 1.424132, 3.217409, 0, 0.854902, 1, 1,
0.07524341, 0.3699572, -0.863512, 0, 0.8509804, 1, 1,
0.07758176, -1.07518, 3.184925, 0, 0.8431373, 1, 1,
0.08399247, -1.443758, 4.583339, 0, 0.8392157, 1, 1,
0.08434128, 0.2978811, 0.470917, 0, 0.8313726, 1, 1,
0.08924317, -1.624449, 0.9831901, 0, 0.827451, 1, 1,
0.09001611, 0.1494449, -1.20038, 0, 0.8196079, 1, 1,
0.092443, -0.0432576, 1.10811, 0, 0.8156863, 1, 1,
0.09349664, 0.5809097, -0.05488717, 0, 0.8078431, 1, 1,
0.09475526, -0.9784856, 2.59682, 0, 0.8039216, 1, 1,
0.09491888, 0.1343636, 1.536536, 0, 0.7960784, 1, 1,
0.09545043, 1.679398, -0.3501778, 0, 0.7882353, 1, 1,
0.0999494, 0.03386506, 0.3038469, 0, 0.7843137, 1, 1,
0.1008435, 0.8192548, 0.3625364, 0, 0.7764706, 1, 1,
0.1032944, 0.6504979, -1.284229, 0, 0.772549, 1, 1,
0.1060673, -2.20246, 4.784281, 0, 0.7647059, 1, 1,
0.1216807, 0.6835679, -1.764282, 0, 0.7607843, 1, 1,
0.1278214, 0.1872214, -0.1945182, 0, 0.7529412, 1, 1,
0.1280393, 0.4938807, -0.3885581, 0, 0.7490196, 1, 1,
0.1287569, 0.2855491, 0.1424059, 0, 0.7411765, 1, 1,
0.1416831, 0.1848977, 0.2542987, 0, 0.7372549, 1, 1,
0.1430548, -0.7506334, 3.486869, 0, 0.7294118, 1, 1,
0.145851, 2.398471, 0.9952357, 0, 0.7254902, 1, 1,
0.1466808, -0.8626614, 2.177191, 0, 0.7176471, 1, 1,
0.1473499, -0.8636379, 1.574496, 0, 0.7137255, 1, 1,
0.151674, -0.2082327, 3.868925, 0, 0.7058824, 1, 1,
0.1527765, 0.9118215, 0.5098203, 0, 0.6980392, 1, 1,
0.1549977, -1.416885, 1.992656, 0, 0.6941177, 1, 1,
0.1570401, 0.6565991, -1.587915, 0, 0.6862745, 1, 1,
0.1613024, -1.821802, 1.4329, 0, 0.682353, 1, 1,
0.1630881, 1.155194, -0.3683788, 0, 0.6745098, 1, 1,
0.1631945, -0.1664208, 3.487293, 0, 0.6705883, 1, 1,
0.165108, -1.468006, 3.030536, 0, 0.6627451, 1, 1,
0.1656291, 0.791375, -0.2181129, 0, 0.6588235, 1, 1,
0.1670411, 1.027515, 1.090668, 0, 0.6509804, 1, 1,
0.1682867, 0.3438644, -0.03167073, 0, 0.6470588, 1, 1,
0.1693862, 0.4970493, 0.3916918, 0, 0.6392157, 1, 1,
0.1705256, 1.807214, -1.200678, 0, 0.6352941, 1, 1,
0.1734909, 1.008098, -0.7092665, 0, 0.627451, 1, 1,
0.1743506, 0.8776112, -0.4990372, 0, 0.6235294, 1, 1,
0.17448, -0.293998, 2.391437, 0, 0.6156863, 1, 1,
0.1756841, -0.1906095, 0.8346024, 0, 0.6117647, 1, 1,
0.1795148, 1.852322, 0.1371202, 0, 0.6039216, 1, 1,
0.1816974, 0.256725, 1.021013, 0, 0.5960785, 1, 1,
0.1837696, -1.893226, 2.580334, 0, 0.5921569, 1, 1,
0.1845648, 0.8028748, -1.623827, 0, 0.5843138, 1, 1,
0.1846665, 1.278594, 0.07169662, 0, 0.5803922, 1, 1,
0.1868594, -0.5530233, 3.733755, 0, 0.572549, 1, 1,
0.1901329, -0.5276237, 2.132481, 0, 0.5686275, 1, 1,
0.1923677, 1.742974, 1.016722, 0, 0.5607843, 1, 1,
0.1955609, 1.191641, -0.2159605, 0, 0.5568628, 1, 1,
0.1973069, -0.8177687, 2.310038, 0, 0.5490196, 1, 1,
0.2006995, -0.5440096, 2.013433, 0, 0.5450981, 1, 1,
0.201722, -0.2013622, 4.224847, 0, 0.5372549, 1, 1,
0.2053861, -0.4228503, 2.735101, 0, 0.5333334, 1, 1,
0.2107703, -0.7857326, 2.041325, 0, 0.5254902, 1, 1,
0.2126096, -0.4311426, 2.628107, 0, 0.5215687, 1, 1,
0.2150605, -0.4311344, 2.430423, 0, 0.5137255, 1, 1,
0.2214818, -0.6651862, 2.380217, 0, 0.509804, 1, 1,
0.2220492, -0.2941182, 3.092389, 0, 0.5019608, 1, 1,
0.2224592, -1.142388, 4.699801, 0, 0.4941176, 1, 1,
0.2252566, -1.528451, 1.31306, 0, 0.4901961, 1, 1,
0.2314997, -0.02236479, 1.947428, 0, 0.4823529, 1, 1,
0.2331682, -1.934824, 4.567353, 0, 0.4784314, 1, 1,
0.2343494, 1.736221, -1.184432, 0, 0.4705882, 1, 1,
0.2418035, 0.1583642, 1.483342, 0, 0.4666667, 1, 1,
0.2444804, -2.401812, 3.537714, 0, 0.4588235, 1, 1,
0.2456077, 0.8628998, -1.353471, 0, 0.454902, 1, 1,
0.2459806, -0.4187744, 4.361722, 0, 0.4470588, 1, 1,
0.2469234, 1.771204, -1.009675, 0, 0.4431373, 1, 1,
0.251819, -0.2512326, 3.593236, 0, 0.4352941, 1, 1,
0.251963, -1.211642, 3.45962, 0, 0.4313726, 1, 1,
0.2523459, -0.1637427, 3.396321, 0, 0.4235294, 1, 1,
0.2552552, 1.016356, 1.202626, 0, 0.4196078, 1, 1,
0.256938, 1.070133, 0.3016525, 0, 0.4117647, 1, 1,
0.2581958, 2.351628, 0.97136, 0, 0.4078431, 1, 1,
0.2635856, -0.7206411, 1.434876, 0, 0.4, 1, 1,
0.2639874, 0.4334212, 0.1735334, 0, 0.3921569, 1, 1,
0.2664147, -0.1436607, 1.088099, 0, 0.3882353, 1, 1,
0.2670221, 0.2738309, 0.7042747, 0, 0.3803922, 1, 1,
0.2683181, 0.7969837, 0.2076575, 0, 0.3764706, 1, 1,
0.2735809, 2.075287, 0.501101, 0, 0.3686275, 1, 1,
0.2744456, -1.621853, 2.688749, 0, 0.3647059, 1, 1,
0.275426, -0.5932466, 3.878409, 0, 0.3568628, 1, 1,
0.2865701, -0.3685823, 3.367552, 0, 0.3529412, 1, 1,
0.2869548, 1.862054, 0.05574463, 0, 0.345098, 1, 1,
0.292994, 1.450027, -0.4802443, 0, 0.3411765, 1, 1,
0.2970291, 0.2419498, 0.3576253, 0, 0.3333333, 1, 1,
0.2991814, 0.1080188, 0.02795895, 0, 0.3294118, 1, 1,
0.2999473, -0.3528114, 2.092577, 0, 0.3215686, 1, 1,
0.3025931, 0.05718284, 2.246262, 0, 0.3176471, 1, 1,
0.3026253, -0.3768024, 2.052703, 0, 0.3098039, 1, 1,
0.3061175, 1.816207, 0.5803681, 0, 0.3058824, 1, 1,
0.309106, -0.2011275, 3.552452, 0, 0.2980392, 1, 1,
0.3116001, 1.41037, -0.4249032, 0, 0.2901961, 1, 1,
0.3154487, 0.4668735, -0.5150169, 0, 0.2862745, 1, 1,
0.3199981, -0.03338709, 0.5100551, 0, 0.2784314, 1, 1,
0.3206116, 0.6034689, 1.495401, 0, 0.2745098, 1, 1,
0.3210491, 1.120905, 1.010712, 0, 0.2666667, 1, 1,
0.3222035, 0.8535509, 0.7813857, 0, 0.2627451, 1, 1,
0.3256267, 0.3246052, -1.263631, 0, 0.254902, 1, 1,
0.3280551, 1.173652, -0.7700239, 0, 0.2509804, 1, 1,
0.3280556, 0.9081998, -0.9347661, 0, 0.2431373, 1, 1,
0.3334933, 0.6809228, 1.631797, 0, 0.2392157, 1, 1,
0.3338666, 0.07461526, 2.872924, 0, 0.2313726, 1, 1,
0.3358634, 0.241595, 1.113112, 0, 0.227451, 1, 1,
0.338568, 0.2614228, 1.660677, 0, 0.2196078, 1, 1,
0.3395956, -0.1350364, 1.26177, 0, 0.2156863, 1, 1,
0.3403676, 0.03061192, 0.8778832, 0, 0.2078431, 1, 1,
0.3415841, 0.2927302, 0.2767636, 0, 0.2039216, 1, 1,
0.3466582, -0.8185363, 2.174837, 0, 0.1960784, 1, 1,
0.3468305, 0.07012025, 0.6239355, 0, 0.1882353, 1, 1,
0.3476414, -1.28543, 1.500138, 0, 0.1843137, 1, 1,
0.3479381, -0.01033571, 0.9316956, 0, 0.1764706, 1, 1,
0.3503291, 1.188578, 1.298077, 0, 0.172549, 1, 1,
0.3560441, -0.07941467, 0.7217508, 0, 0.1647059, 1, 1,
0.3628297, 0.1808259, 0.3675504, 0, 0.1607843, 1, 1,
0.3632662, 0.4776014, 0.4688641, 0, 0.1529412, 1, 1,
0.3633465, 1.003486, -0.1289346, 0, 0.1490196, 1, 1,
0.3667022, -0.9268681, 4.722524, 0, 0.1411765, 1, 1,
0.3669424, -0.3902888, 1.169274, 0, 0.1372549, 1, 1,
0.3693099, -1.732816, 1.305179, 0, 0.1294118, 1, 1,
0.3697449, 0.05330053, 2.645148, 0, 0.1254902, 1, 1,
0.3741916, -0.2792066, 2.23109, 0, 0.1176471, 1, 1,
0.3778526, -0.2674569, 3.533252, 0, 0.1137255, 1, 1,
0.3818654, 3.203239, 0.7075366, 0, 0.1058824, 1, 1,
0.3846566, 0.1674003, -0.2989258, 0, 0.09803922, 1, 1,
0.3864156, -0.9820789, 1.754127, 0, 0.09411765, 1, 1,
0.3899483, -0.6706674, 2.257833, 0, 0.08627451, 1, 1,
0.3908892, -0.07303876, 1.970249, 0, 0.08235294, 1, 1,
0.3949558, 0.5970079, -0.1144557, 0, 0.07450981, 1, 1,
0.3952355, 0.5152987, 0.2833315, 0, 0.07058824, 1, 1,
0.3985423, 0.2925225, 2.013065, 0, 0.0627451, 1, 1,
0.3996375, -1.207955, 3.328135, 0, 0.05882353, 1, 1,
0.3997377, -0.2760452, 0.4624001, 0, 0.05098039, 1, 1,
0.4008402, -1.208358, 1.195828, 0, 0.04705882, 1, 1,
0.40493, -0.9943939, 3.507673, 0, 0.03921569, 1, 1,
0.4059613, -0.03986812, 0.9715995, 0, 0.03529412, 1, 1,
0.4077791, 0.6028513, 0.4137017, 0, 0.02745098, 1, 1,
0.4079612, -0.7610598, 3.52142, 0, 0.02352941, 1, 1,
0.4120629, -0.2724336, -0.0475642, 0, 0.01568628, 1, 1,
0.4178269, 1.370766, 0.5980054, 0, 0.01176471, 1, 1,
0.4205377, -1.373393, 2.418998, 0, 0.003921569, 1, 1,
0.4285186, 0.1268471, 1.479092, 0.003921569, 0, 1, 1,
0.4368576, 1.755981, 2.1071, 0.007843138, 0, 1, 1,
0.4376666, 1.320487, 1.87121, 0.01568628, 0, 1, 1,
0.439635, 0.4968561, 0.7459527, 0.01960784, 0, 1, 1,
0.4481094, -0.1010782, 3.2026, 0.02745098, 0, 1, 1,
0.4502655, 0.7991493, 0.4300662, 0.03137255, 0, 1, 1,
0.4506815, -0.6855837, 1.357722, 0.03921569, 0, 1, 1,
0.4518424, -1.374645, 0.7837335, 0.04313726, 0, 1, 1,
0.4549063, -0.3634863, 0.4486753, 0.05098039, 0, 1, 1,
0.4549424, -0.4944793, 0.2323616, 0.05490196, 0, 1, 1,
0.45796, 0.828589, -0.4058239, 0.0627451, 0, 1, 1,
0.4597175, -1.099548, 1.594176, 0.06666667, 0, 1, 1,
0.4599293, 0.7340961, -0.9351047, 0.07450981, 0, 1, 1,
0.4611525, 0.9887812, -0.8686162, 0.07843138, 0, 1, 1,
0.4626387, 0.7766971, -0.8724383, 0.08627451, 0, 1, 1,
0.4651089, -1.378965, 5.173417, 0.09019608, 0, 1, 1,
0.4691504, -1.09311, 2.839585, 0.09803922, 0, 1, 1,
0.4701849, 0.2134066, 1.983358, 0.1058824, 0, 1, 1,
0.4737851, 0.493237, 2.499039, 0.1098039, 0, 1, 1,
0.476181, -2.438512, 2.231642, 0.1176471, 0, 1, 1,
0.4785944, -0.6782086, 2.543033, 0.1215686, 0, 1, 1,
0.4827853, 0.1972647, 0.8955768, 0.1294118, 0, 1, 1,
0.4837929, -0.649393, 1.158204, 0.1333333, 0, 1, 1,
0.487936, -0.338357, 3.165576, 0.1411765, 0, 1, 1,
0.4888018, 0.07135904, 2.61176, 0.145098, 0, 1, 1,
0.489722, 0.9763259, 0.8396537, 0.1529412, 0, 1, 1,
0.4915369, -0.9856082, 1.702981, 0.1568628, 0, 1, 1,
0.4942104, 1.109806, 1.34349, 0.1647059, 0, 1, 1,
0.4954927, 0.4994098, 1.914817, 0.1686275, 0, 1, 1,
0.4993259, -2.944022, 3.177031, 0.1764706, 0, 1, 1,
0.5032028, -1.460248, 3.073104, 0.1803922, 0, 1, 1,
0.5076694, -0.3889703, 2.104913, 0.1882353, 0, 1, 1,
0.510143, 0.3275181, 0.101786, 0.1921569, 0, 1, 1,
0.5115069, 0.4826637, 1.935108, 0.2, 0, 1, 1,
0.5117379, -0.2513923, 3.339943, 0.2078431, 0, 1, 1,
0.5157419, 1.135347, 1.269913, 0.2117647, 0, 1, 1,
0.5157849, -1.580833, 2.125786, 0.2196078, 0, 1, 1,
0.5199022, 0.6596515, 0.9535707, 0.2235294, 0, 1, 1,
0.5212479, 2.982097, -0.738399, 0.2313726, 0, 1, 1,
0.5217807, 0.360425, 0.2390111, 0.2352941, 0, 1, 1,
0.5253579, 0.5880901, 1.577189, 0.2431373, 0, 1, 1,
0.535306, 0.1188909, 0.4355479, 0.2470588, 0, 1, 1,
0.5355314, 2.007605, 1.436627, 0.254902, 0, 1, 1,
0.5413755, 0.349897, 2.062809, 0.2588235, 0, 1, 1,
0.5431829, -0.8695771, 4.514898, 0.2666667, 0, 1, 1,
0.5432418, 0.1654551, 1.327951, 0.2705882, 0, 1, 1,
0.5434863, -0.228931, 1.390134, 0.2784314, 0, 1, 1,
0.5499949, -1.023272, 2.736098, 0.282353, 0, 1, 1,
0.5535259, 1.990069, 1.190071, 0.2901961, 0, 1, 1,
0.5557509, 0.6485788, 1.921366, 0.2941177, 0, 1, 1,
0.5583144, 1.650551, 2.274231, 0.3019608, 0, 1, 1,
0.5587917, 0.8403584, -0.4943624, 0.3098039, 0, 1, 1,
0.5605441, 0.3527754, 2.391215, 0.3137255, 0, 1, 1,
0.5639679, 0.2658587, 1.518347, 0.3215686, 0, 1, 1,
0.5650128, 1.193759, 1.84215, 0.3254902, 0, 1, 1,
0.5679708, -0.5059046, 1.982655, 0.3333333, 0, 1, 1,
0.5691348, -0.5133867, 1.428273, 0.3372549, 0, 1, 1,
0.5767427, 1.927372, -0.04792573, 0.345098, 0, 1, 1,
0.5851266, 0.6158651, 0.5904458, 0.3490196, 0, 1, 1,
0.585613, 0.9240434, -0.159264, 0.3568628, 0, 1, 1,
0.5876403, 0.7604294, 0.9937286, 0.3607843, 0, 1, 1,
0.5902793, -0.4592614, 1.176095, 0.3686275, 0, 1, 1,
0.5907349, -0.8543671, 1.310851, 0.372549, 0, 1, 1,
0.593417, -0.8369458, 3.514842, 0.3803922, 0, 1, 1,
0.5962999, 1.287042, -0.1737302, 0.3843137, 0, 1, 1,
0.599544, -0.9709082, 2.701768, 0.3921569, 0, 1, 1,
0.6027939, -0.3837824, 1.598633, 0.3960784, 0, 1, 1,
0.6118991, 0.6327591, -0.5817267, 0.4039216, 0, 1, 1,
0.6120183, -1.336656, 3.873441, 0.4117647, 0, 1, 1,
0.6137511, -0.3229665, 0.9303797, 0.4156863, 0, 1, 1,
0.6147546, 1.175693, -3.061657, 0.4235294, 0, 1, 1,
0.6161649, -1.027243, 3.295897, 0.427451, 0, 1, 1,
0.6181236, -0.8414963, 3.992608, 0.4352941, 0, 1, 1,
0.6212879, -0.2577137, 1.880087, 0.4392157, 0, 1, 1,
0.6222324, 1.725746, -0.05994045, 0.4470588, 0, 1, 1,
0.6363541, 0.7956216, -0.07189138, 0.4509804, 0, 1, 1,
0.637238, 0.712882, 1.321059, 0.4588235, 0, 1, 1,
0.6431403, -1.376033, 2.892091, 0.4627451, 0, 1, 1,
0.6501777, 1.076846, 0.2419554, 0.4705882, 0, 1, 1,
0.6542166, -0.645479, 3.08882, 0.4745098, 0, 1, 1,
0.6561882, -0.03142646, 1.294676, 0.4823529, 0, 1, 1,
0.6602241, -0.4561943, 3.552047, 0.4862745, 0, 1, 1,
0.6667562, -0.6757946, 2.156822, 0.4941176, 0, 1, 1,
0.6687872, -1.498422, 4.395918, 0.5019608, 0, 1, 1,
0.6696283, -0.1616233, 3.943622, 0.5058824, 0, 1, 1,
0.6712536, 0.4999749, 1.049725, 0.5137255, 0, 1, 1,
0.6743878, -0.1656451, 1.51423, 0.5176471, 0, 1, 1,
0.6767018, 0.5585427, 0.0733306, 0.5254902, 0, 1, 1,
0.6814824, -0.3883066, 4.129041, 0.5294118, 0, 1, 1,
0.6818188, -1.485908, 3.362904, 0.5372549, 0, 1, 1,
0.6830953, -0.2068137, 0.5068393, 0.5411765, 0, 1, 1,
0.6861116, 0.07251785, 1.386045, 0.5490196, 0, 1, 1,
0.687133, 0.3355528, 1.202443, 0.5529412, 0, 1, 1,
0.6892407, -0.2442203, 3.00211, 0.5607843, 0, 1, 1,
0.6914305, 0.3547315, 0.7571718, 0.5647059, 0, 1, 1,
0.6914819, -0.8715052, 0.9682302, 0.572549, 0, 1, 1,
0.691963, 1.053096, -0.8786477, 0.5764706, 0, 1, 1,
0.6996742, 0.2461975, 2.543194, 0.5843138, 0, 1, 1,
0.7019206, -0.5049897, 4.114617, 0.5882353, 0, 1, 1,
0.7022322, -1.041204, 3.236031, 0.5960785, 0, 1, 1,
0.7047175, 0.08525898, 1.581186, 0.6039216, 0, 1, 1,
0.7058299, 0.1890733, 1.627322, 0.6078432, 0, 1, 1,
0.7069298, 0.8101492, 2.82205, 0.6156863, 0, 1, 1,
0.710393, -0.6868603, 2.553795, 0.6196079, 0, 1, 1,
0.7214383, -1.526227, 3.574037, 0.627451, 0, 1, 1,
0.7271398, 0.4552948, 1.093533, 0.6313726, 0, 1, 1,
0.7324533, 1.827293, -1.01512, 0.6392157, 0, 1, 1,
0.7331978, -0.6766787, 2.33943, 0.6431373, 0, 1, 1,
0.7498548, 0.8089935, 0.1172541, 0.6509804, 0, 1, 1,
0.7561066, -0.2580251, 3.776168, 0.654902, 0, 1, 1,
0.7577725, -1.352401, 1.435674, 0.6627451, 0, 1, 1,
0.7605346, 0.7827151, -0.34232, 0.6666667, 0, 1, 1,
0.7612026, -0.6135581, 3.367997, 0.6745098, 0, 1, 1,
0.7667058, 0.5504065, 2.329765, 0.6784314, 0, 1, 1,
0.7809885, 1.074648, -0.8626179, 0.6862745, 0, 1, 1,
0.78131, -1.143103, 2.772337, 0.6901961, 0, 1, 1,
0.7818183, 0.230478, 1.839073, 0.6980392, 0, 1, 1,
0.7871976, -1.453105, 0.8173751, 0.7058824, 0, 1, 1,
0.7887883, -1.130544, 3.026222, 0.7098039, 0, 1, 1,
0.7910389, 0.6592076, 0.6837596, 0.7176471, 0, 1, 1,
0.7917226, 0.5886069, 0.9217547, 0.7215686, 0, 1, 1,
0.7935311, -1.985617, 4.090147, 0.7294118, 0, 1, 1,
0.7950179, 1.940138, 1.583014, 0.7333333, 0, 1, 1,
0.7951396, 1.742257, 0.5025318, 0.7411765, 0, 1, 1,
0.7984054, 1.065212, -0.8996953, 0.7450981, 0, 1, 1,
0.8047771, -0.1437943, 2.872834, 0.7529412, 0, 1, 1,
0.8076044, -0.3668172, 2.086686, 0.7568628, 0, 1, 1,
0.8124753, -1.36655, 1.793395, 0.7647059, 0, 1, 1,
0.8130745, -0.2539583, 2.1213, 0.7686275, 0, 1, 1,
0.8146595, -0.2279147, 1.498598, 0.7764706, 0, 1, 1,
0.8186781, -0.2860025, 2.682155, 0.7803922, 0, 1, 1,
0.8240211, -0.9516718, 2.458055, 0.7882353, 0, 1, 1,
0.8274756, -0.9488513, 2.92684, 0.7921569, 0, 1, 1,
0.8286069, -1.102991, 3.479575, 0.8, 0, 1, 1,
0.8378432, 1.128293, 1.152992, 0.8078431, 0, 1, 1,
0.840372, -0.4896348, 2.322276, 0.8117647, 0, 1, 1,
0.8433547, -0.9326521, 2.97627, 0.8196079, 0, 1, 1,
0.8495225, -0.9412475, 1.755164, 0.8235294, 0, 1, 1,
0.8685362, 0.04851678, 1.931466, 0.8313726, 0, 1, 1,
0.8737605, -0.04835711, 1.158833, 0.8352941, 0, 1, 1,
0.8832468, 0.2770094, 4.19211, 0.8431373, 0, 1, 1,
0.8924478, -1.791839, 2.436767, 0.8470588, 0, 1, 1,
0.9032088, 1.167257, -1.456726, 0.854902, 0, 1, 1,
0.9044996, -0.1860502, 2.628128, 0.8588235, 0, 1, 1,
0.9150921, 0.1290996, 1.224867, 0.8666667, 0, 1, 1,
0.9194723, -0.5949543, 4.243667, 0.8705882, 0, 1, 1,
0.9249232, -0.09183868, -0.1472018, 0.8784314, 0, 1, 1,
0.9255356, -1.125901, 1.623438, 0.8823529, 0, 1, 1,
0.9263724, -1.254143, 2.37176, 0.8901961, 0, 1, 1,
0.9270445, 1.770367, 0.09245155, 0.8941177, 0, 1, 1,
0.9273523, 0.9304959, 1.007688, 0.9019608, 0, 1, 1,
0.9312212, 0.4245769, 1.328358, 0.9098039, 0, 1, 1,
0.933678, -0.01399182, 0.8287029, 0.9137255, 0, 1, 1,
0.9392686, -0.2588609, 3.393702, 0.9215686, 0, 1, 1,
0.9427295, 0.2960275, 1.804816, 0.9254902, 0, 1, 1,
0.9428395, -0.5034013, 1.371847, 0.9333333, 0, 1, 1,
0.9519063, 1.097086, -0.118776, 0.9372549, 0, 1, 1,
0.9548922, 0.7697966, 0.44366, 0.945098, 0, 1, 1,
0.9554396, 1.323009, -1.336759, 0.9490196, 0, 1, 1,
0.9600092, 0.8075894, 1.133023, 0.9568627, 0, 1, 1,
0.9637897, 0.6673173, 0.844873, 0.9607843, 0, 1, 1,
0.9647453, 0.4048287, 0.4992302, 0.9686275, 0, 1, 1,
0.9649451, -0.9045251, 3.050392, 0.972549, 0, 1, 1,
0.9674773, -0.2391842, 2.808425, 0.9803922, 0, 1, 1,
0.975899, -0.386371, 3.920874, 0.9843137, 0, 1, 1,
0.9759324, 1.008815, 1.541393, 0.9921569, 0, 1, 1,
0.9845201, 0.2460245, 2.168882, 0.9960784, 0, 1, 1,
0.9849504, 0.7370902, -0.6822451, 1, 0, 0.9960784, 1,
0.9908702, 0.2645653, 1.365262, 1, 0, 0.9882353, 1,
0.9931712, -0.2101218, 2.016721, 1, 0, 0.9843137, 1,
0.9962839, -0.6561494, 2.070244, 1, 0, 0.9764706, 1,
1.004477, 2.353485, 0.7997239, 1, 0, 0.972549, 1,
1.004928, 1.706926, 0.7234179, 1, 0, 0.9647059, 1,
1.007288, -0.4975005, 1.650702, 1, 0, 0.9607843, 1,
1.010856, 0.6697588, 0.5976915, 1, 0, 0.9529412, 1,
1.017891, -0.609967, 1.738207, 1, 0, 0.9490196, 1,
1.020404, -1.222847, -0.7390825, 1, 0, 0.9411765, 1,
1.029466, 0.5432116, 1.141831, 1, 0, 0.9372549, 1,
1.031646, 1.907241, 0.7925832, 1, 0, 0.9294118, 1,
1.035334, -1.309549, -0.8811098, 1, 0, 0.9254902, 1,
1.036977, -0.03767737, 3.078049, 1, 0, 0.9176471, 1,
1.037948, 1.203752, -1.117659, 1, 0, 0.9137255, 1,
1.042416, 1.005162, 3.4287, 1, 0, 0.9058824, 1,
1.04671, 1.199713, 0.1275819, 1, 0, 0.9019608, 1,
1.052209, 0.4790898, 0.6904431, 1, 0, 0.8941177, 1,
1.055683, 0.07868377, 0.8442767, 1, 0, 0.8862745, 1,
1.059412, -0.3039535, 2.549915, 1, 0, 0.8823529, 1,
1.061409, 1.594717, 2.073248, 1, 0, 0.8745098, 1,
1.061502, -0.441879, 2.727434, 1, 0, 0.8705882, 1,
1.062949, -0.5051686, 1.1773, 1, 0, 0.8627451, 1,
1.066884, 0.7230094, 1.067697, 1, 0, 0.8588235, 1,
1.068037, -0.7346507, 2.60143, 1, 0, 0.8509804, 1,
1.068257, 0.4880419, -0.1397146, 1, 0, 0.8470588, 1,
1.078454, 0.4133459, 3.140023, 1, 0, 0.8392157, 1,
1.080366, -1.841524, 3.189227, 1, 0, 0.8352941, 1,
1.084416, 2.05552, 0.004820859, 1, 0, 0.827451, 1,
1.09138, -1.198932, 1.79415, 1, 0, 0.8235294, 1,
1.096193, 0.7983376, -0.3288052, 1, 0, 0.8156863, 1,
1.098689, 0.09324083, 1.842853, 1, 0, 0.8117647, 1,
1.102907, -0.4630906, 3.046506, 1, 0, 0.8039216, 1,
1.11058, -1.449683, 2.819183, 1, 0, 0.7960784, 1,
1.111863, -1.987902, 3.243834, 1, 0, 0.7921569, 1,
1.118689, 0.4355582, 1.739765, 1, 0, 0.7843137, 1,
1.126343, -1.574202, 2.104656, 1, 0, 0.7803922, 1,
1.129892, -1.263201, 2.334136, 1, 0, 0.772549, 1,
1.130477, 1.843143, 0.8522509, 1, 0, 0.7686275, 1,
1.141241, 0.3688079, 1.108124, 1, 0, 0.7607843, 1,
1.141799, 0.5600327, 1.037347, 1, 0, 0.7568628, 1,
1.143797, 0.4523497, 0.8468307, 1, 0, 0.7490196, 1,
1.14416, -0.9912983, 1.374291, 1, 0, 0.7450981, 1,
1.161857, 1.007946, 1.335878, 1, 0, 0.7372549, 1,
1.164633, -0.3109196, 3.389296, 1, 0, 0.7333333, 1,
1.166175, -0.4657867, 1.932926, 1, 0, 0.7254902, 1,
1.168269, 0.08737797, 0.3125776, 1, 0, 0.7215686, 1,
1.17994, 1.934538, 0.57915, 1, 0, 0.7137255, 1,
1.181126, -1.28615, 2.940554, 1, 0, 0.7098039, 1,
1.181463, -0.06647756, 2.939608, 1, 0, 0.7019608, 1,
1.18821, 1.50591, 1.667567, 1, 0, 0.6941177, 1,
1.188699, 0.3037805, 0.5720453, 1, 0, 0.6901961, 1,
1.19922, -0.3002811, 0.7348623, 1, 0, 0.682353, 1,
1.206451, -0.6362135, 1.840525, 1, 0, 0.6784314, 1,
1.213616, 0.6803908, 2.332196, 1, 0, 0.6705883, 1,
1.215985, -0.0904857, 1.635204, 1, 0, 0.6666667, 1,
1.22021, 0.5264189, 1.206909, 1, 0, 0.6588235, 1,
1.238984, 0.2665777, 0.5628148, 1, 0, 0.654902, 1,
1.239523, 1.003307, -0.003223989, 1, 0, 0.6470588, 1,
1.246379, -1.686408, 1.325844, 1, 0, 0.6431373, 1,
1.261007, 0.9935057, 0.8287938, 1, 0, 0.6352941, 1,
1.264338, -0.6790037, 3.554354, 1, 0, 0.6313726, 1,
1.265043, 1.648873, -0.289583, 1, 0, 0.6235294, 1,
1.2731, 1.694559, 0.4045257, 1, 0, 0.6196079, 1,
1.275101, -0.8360724, 0.1742616, 1, 0, 0.6117647, 1,
1.276761, -0.5032114, 1.759923, 1, 0, 0.6078432, 1,
1.28618, -0.6694993, 0.7221013, 1, 0, 0.6, 1,
1.29002, 0.8609924, 1.406086, 1, 0, 0.5921569, 1,
1.290145, -0.4735507, 2.231925, 1, 0, 0.5882353, 1,
1.296413, 0.4452489, 1.986919, 1, 0, 0.5803922, 1,
1.306944, 0.8272518, 2.040242, 1, 0, 0.5764706, 1,
1.307138, 1.049312, 2.198066, 1, 0, 0.5686275, 1,
1.310697, 0.7881007, 2.197433, 1, 0, 0.5647059, 1,
1.314887, 0.6961251, 1.008278, 1, 0, 0.5568628, 1,
1.326145, -0.3537292, 0.919813, 1, 0, 0.5529412, 1,
1.327626, -0.213491, 1.283628, 1, 0, 0.5450981, 1,
1.337507, 2.088677, -0.2752723, 1, 0, 0.5411765, 1,
1.345438, -0.3806369, 1.421748, 1, 0, 0.5333334, 1,
1.348786, 0.5880696, -0.4030629, 1, 0, 0.5294118, 1,
1.352547, 0.9242557, 0.4149883, 1, 0, 0.5215687, 1,
1.358703, 2.136803, 2.057682, 1, 0, 0.5176471, 1,
1.361234, -0.3645843, 3.631378, 1, 0, 0.509804, 1,
1.365875, 1.387041, 1.146492, 1, 0, 0.5058824, 1,
1.376891, -0.1289894, 1.618927, 1, 0, 0.4980392, 1,
1.397825, 0.2935305, 2.261896, 1, 0, 0.4901961, 1,
1.399725, 1.235719, 2.096399, 1, 0, 0.4862745, 1,
1.404641, 1.899793, 1.917057, 1, 0, 0.4784314, 1,
1.405265, 0.211999, 1.122531, 1, 0, 0.4745098, 1,
1.405571, 1.231408, -0.5363985, 1, 0, 0.4666667, 1,
1.409203, -0.5698542, 3.114666, 1, 0, 0.4627451, 1,
1.413187, -1.126761, 0.3686632, 1, 0, 0.454902, 1,
1.426404, 1.088869, -0.6034993, 1, 0, 0.4509804, 1,
1.434328, 1.760681, 1.168577, 1, 0, 0.4431373, 1,
1.438304, 0.9411246, -0.0002778304, 1, 0, 0.4392157, 1,
1.448508, -0.02749063, 0.6853853, 1, 0, 0.4313726, 1,
1.469623, -1.183493, 1.805022, 1, 0, 0.427451, 1,
1.480409, 0.6166027, 1.325216, 1, 0, 0.4196078, 1,
1.481323, 0.3357923, 1.210515, 1, 0, 0.4156863, 1,
1.491742, -0.6026923, 5.287674, 1, 0, 0.4078431, 1,
1.515706, 0.3028964, 1.332438, 1, 0, 0.4039216, 1,
1.518761, -0.4697182, 3.057955, 1, 0, 0.3960784, 1,
1.531395, -0.7410429, -0.02888715, 1, 0, 0.3882353, 1,
1.533896, -1.001208, 0.8545972, 1, 0, 0.3843137, 1,
1.534077, 0.8257921, 0.8508206, 1, 0, 0.3764706, 1,
1.536011, -0.2259884, 2.659594, 1, 0, 0.372549, 1,
1.547005, -0.29259, -0.2911848, 1, 0, 0.3647059, 1,
1.554833, -0.6067454, 2.354126, 1, 0, 0.3607843, 1,
1.556602, -0.3149378, 0.9997336, 1, 0, 0.3529412, 1,
1.560769, 0.8272445, 0.924096, 1, 0, 0.3490196, 1,
1.572183, -0.1418143, 1.481368, 1, 0, 0.3411765, 1,
1.573664, 0.6861609, 0.9026008, 1, 0, 0.3372549, 1,
1.576386, 0.3417432, 1.182532, 1, 0, 0.3294118, 1,
1.588658, 0.8071212, 1.487782, 1, 0, 0.3254902, 1,
1.592511, 0.0008669015, 0.6631603, 1, 0, 0.3176471, 1,
1.61296, -0.2590174, 2.058022, 1, 0, 0.3137255, 1,
1.685685, -0.8030908, 3.292613, 1, 0, 0.3058824, 1,
1.69796, -0.6331524, 0.54799, 1, 0, 0.2980392, 1,
1.727221, -0.8080332, 2.873224, 1, 0, 0.2941177, 1,
1.730933, -0.6869702, 3.607541, 1, 0, 0.2862745, 1,
1.738448, -0.2352992, -0.7955188, 1, 0, 0.282353, 1,
1.748955, -0.2538017, 1.222591, 1, 0, 0.2745098, 1,
1.751091, 0.7359406, 1.225716, 1, 0, 0.2705882, 1,
1.761809, -0.4054984, 1.757143, 1, 0, 0.2627451, 1,
1.763524, 1.904805, 0.1540343, 1, 0, 0.2588235, 1,
1.786563, 0.8522349, 0.6790622, 1, 0, 0.2509804, 1,
1.78787, -0.6171182, 0.9388255, 1, 0, 0.2470588, 1,
1.797514, 0.7507998, -0.05725534, 1, 0, 0.2392157, 1,
1.81551, -0.7577672, 2.379631, 1, 0, 0.2352941, 1,
1.835002, -0.9156668, 1.697491, 1, 0, 0.227451, 1,
1.848977, -0.5083539, 2.973329, 1, 0, 0.2235294, 1,
1.881214, 0.6744486, 0.5989592, 1, 0, 0.2156863, 1,
1.896257, -2.022555, 3.145826, 1, 0, 0.2117647, 1,
1.949688, 0.2311724, 1.935597, 1, 0, 0.2039216, 1,
1.978955, 0.5260392, 2.024625, 1, 0, 0.1960784, 1,
1.982433, -0.2926608, 1.153442, 1, 0, 0.1921569, 1,
2.010617, 1.339501, -0.5615582, 1, 0, 0.1843137, 1,
2.017085, -0.1557365, 0.7399367, 1, 0, 0.1803922, 1,
2.047748, 0.05595443, 2.644338, 1, 0, 0.172549, 1,
2.056473, -0.5450707, 1.977678, 1, 0, 0.1686275, 1,
2.072242, -0.285853, 1.176468, 1, 0, 0.1607843, 1,
2.079364, -1.601685, 2.081417, 1, 0, 0.1568628, 1,
2.079827, -0.04153548, 0.4100969, 1, 0, 0.1490196, 1,
2.081001, 1.221099, 2.217919, 1, 0, 0.145098, 1,
2.095096, -0.7767369, 3.740821, 1, 0, 0.1372549, 1,
2.097454, -0.19114, 0.02390107, 1, 0, 0.1333333, 1,
2.114948, -0.6584571, 1.887867, 1, 0, 0.1254902, 1,
2.12965, -0.6019557, 2.156023, 1, 0, 0.1215686, 1,
2.133028, 0.5372502, 2.184687, 1, 0, 0.1137255, 1,
2.148778, 0.370784, 1.70236, 1, 0, 0.1098039, 1,
2.182963, 1.281472, 0.4722877, 1, 0, 0.1019608, 1,
2.254864, 0.3880934, 0.9608434, 1, 0, 0.09411765, 1,
2.276379, -0.07093089, 2.038467, 1, 0, 0.09019608, 1,
2.297796, -0.2100843, 0.7375722, 1, 0, 0.08235294, 1,
2.305247, -0.2513913, 2.917321, 1, 0, 0.07843138, 1,
2.305301, 0.3230139, 0.3540542, 1, 0, 0.07058824, 1,
2.31041, 0.5939398, 3.539566, 1, 0, 0.06666667, 1,
2.334268, 0.6847408, 2.022483, 1, 0, 0.05882353, 1,
2.349723, -0.9409542, 1.145189, 1, 0, 0.05490196, 1,
2.582561, -0.373833, 1.597644, 1, 0, 0.04705882, 1,
2.63509, 0.1650783, 1.301567, 1, 0, 0.04313726, 1,
2.636993, 1.016346, 1.215928, 1, 0, 0.03529412, 1,
2.721956, -0.2831885, 2.214501, 1, 0, 0.03137255, 1,
2.766555, 0.9133623, 0.7468745, 1, 0, 0.02352941, 1,
2.775747, -0.1838562, 2.882147, 1, 0, 0.01960784, 1,
2.894721, 1.244339, 1.979327, 1, 0, 0.01176471, 1,
3.267865, -1.324824, 1.473682, 1, 0, 0.007843138, 1
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
-0.006230593, -3.985983, -6.530075, 0, -0.5, 0.5, 0.5,
-0.006230593, -3.985983, -6.530075, 1, -0.5, 0.5, 0.5,
-0.006230593, -3.985983, -6.530075, 1, 1.5, 0.5, 0.5,
-0.006230593, -3.985983, -6.530075, 0, 1.5, 0.5, 0.5
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
-4.390244, 0.1296084, -6.530075, 0, -0.5, 0.5, 0.5,
-4.390244, 0.1296084, -6.530075, 1, -0.5, 0.5, 0.5,
-4.390244, 0.1296084, -6.530075, 1, 1.5, 0.5, 0.5,
-4.390244, 0.1296084, -6.530075, 0, 1.5, 0.5, 0.5
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
-4.390244, -3.985983, 0.2351947, 0, -0.5, 0.5, 0.5,
-4.390244, -3.985983, 0.2351947, 1, -0.5, 0.5, 0.5,
-4.390244, -3.985983, 0.2351947, 1, 1.5, 0.5, 0.5,
-4.390244, -3.985983, 0.2351947, 0, 1.5, 0.5, 0.5
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
-3, -3.036231, -4.968859,
3, -3.036231, -4.968859,
-3, -3.036231, -4.968859,
-3, -3.194523, -5.229062,
-2, -3.036231, -4.968859,
-2, -3.194523, -5.229062,
-1, -3.036231, -4.968859,
-1, -3.194523, -5.229062,
0, -3.036231, -4.968859,
0, -3.194523, -5.229062,
1, -3.036231, -4.968859,
1, -3.194523, -5.229062,
2, -3.036231, -4.968859,
2, -3.194523, -5.229062,
3, -3.036231, -4.968859,
3, -3.194523, -5.229062
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
-3, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
-3, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
-3, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
-3, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
-2, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
-2, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
-2, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
-2, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
-1, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
-1, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
-1, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
-1, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
0, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
0, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
0, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
0, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
1, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
1, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
1, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
1, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
2, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
2, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
2, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
2, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5,
3, -3.511107, -5.749467, 0, -0.5, 0.5, 0.5,
3, -3.511107, -5.749467, 1, -0.5, 0.5, 0.5,
3, -3.511107, -5.749467, 1, 1.5, 0.5, 0.5,
3, -3.511107, -5.749467, 0, 1.5, 0.5, 0.5
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
-3.378549, -2, -4.968859,
-3.378549, 3, -4.968859,
-3.378549, -2, -4.968859,
-3.547165, -2, -5.229062,
-3.378549, -1, -4.968859,
-3.547165, -1, -5.229062,
-3.378549, 0, -4.968859,
-3.547165, 0, -5.229062,
-3.378549, 1, -4.968859,
-3.547165, 1, -5.229062,
-3.378549, 2, -4.968859,
-3.547165, 2, -5.229062,
-3.378549, 3, -4.968859,
-3.547165, 3, -5.229062
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
-3.884397, -2, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, -2, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, -2, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, -2, -5.749467, 0, 1.5, 0.5, 0.5,
-3.884397, -1, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, -1, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, -1, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, -1, -5.749467, 0, 1.5, 0.5, 0.5,
-3.884397, 0, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, 0, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, 0, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, 0, -5.749467, 0, 1.5, 0.5, 0.5,
-3.884397, 1, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, 1, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, 1, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, 1, -5.749467, 0, 1.5, 0.5, 0.5,
-3.884397, 2, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, 2, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, 2, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, 2, -5.749467, 0, 1.5, 0.5, 0.5,
-3.884397, 3, -5.749467, 0, -0.5, 0.5, 0.5,
-3.884397, 3, -5.749467, 1, -0.5, 0.5, 0.5,
-3.884397, 3, -5.749467, 1, 1.5, 0.5, 0.5,
-3.884397, 3, -5.749467, 0, 1.5, 0.5, 0.5
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
-3.378549, -3.036231, -4,
-3.378549, -3.036231, 4,
-3.378549, -3.036231, -4,
-3.547165, -3.194523, -4,
-3.378549, -3.036231, -2,
-3.547165, -3.194523, -2,
-3.378549, -3.036231, 0,
-3.547165, -3.194523, 0,
-3.378549, -3.036231, 2,
-3.547165, -3.194523, 2,
-3.378549, -3.036231, 4,
-3.547165, -3.194523, 4
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
-3.884397, -3.511107, -4, 0, -0.5, 0.5, 0.5,
-3.884397, -3.511107, -4, 1, -0.5, 0.5, 0.5,
-3.884397, -3.511107, -4, 1, 1.5, 0.5, 0.5,
-3.884397, -3.511107, -4, 0, 1.5, 0.5, 0.5,
-3.884397, -3.511107, -2, 0, -0.5, 0.5, 0.5,
-3.884397, -3.511107, -2, 1, -0.5, 0.5, 0.5,
-3.884397, -3.511107, -2, 1, 1.5, 0.5, 0.5,
-3.884397, -3.511107, -2, 0, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 0, 0, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 0, 1, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 0, 1, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 0, 0, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 2, 0, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 2, 1, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 2, 1, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 2, 0, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 4, 0, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 4, 1, -0.5, 0.5, 0.5,
-3.884397, -3.511107, 4, 1, 1.5, 0.5, 0.5,
-3.884397, -3.511107, 4, 0, 1.5, 0.5, 0.5
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
-3.378549, -3.036231, -4.968859,
-3.378549, 3.295448, -4.968859,
-3.378549, -3.036231, 5.439249,
-3.378549, 3.295448, 5.439249,
-3.378549, -3.036231, -4.968859,
-3.378549, -3.036231, 5.439249,
-3.378549, 3.295448, -4.968859,
-3.378549, 3.295448, 5.439249,
-3.378549, -3.036231, -4.968859,
3.366088, -3.036231, -4.968859,
-3.378549, -3.036231, 5.439249,
3.366088, -3.036231, 5.439249,
-3.378549, 3.295448, -4.968859,
3.366088, 3.295448, -4.968859,
-3.378549, 3.295448, 5.439249,
3.366088, 3.295448, 5.439249,
3.366088, -3.036231, -4.968859,
3.366088, 3.295448, -4.968859,
3.366088, -3.036231, 5.439249,
3.366088, 3.295448, 5.439249,
3.366088, -3.036231, -4.968859,
3.366088, -3.036231, 5.439249,
3.366088, 3.295448, -4.968859,
3.366088, 3.295448, 5.439249
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
var radius = 7.435744;
var distance = 33.08247;
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
mvMatrix.translate( 0.006230593, -0.1296084, -0.2351947 );
mvMatrix.scale( 1.19201, 1.269754, 0.7724432 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.08247);
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
Acrylate<-read.table("Acrylate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.280326, -0.9392066, -0.3240918, 0, 0, 1, 1, 1,
-2.918411, 0.1404563, 0.3077512, 1, 0, 0, 1, 1,
-2.900516, 0.06961811, -2.075617, 1, 0, 0, 1, 1,
-2.678581, -0.5250214, -1.270687, 1, 0, 0, 1, 1,
-2.574194, 1.471661, -0.9317204, 1, 0, 0, 1, 1,
-2.572691, -0.5316414, -1.90932, 1, 0, 0, 1, 1,
-2.508445, -0.9888836, -1.416595, 0, 0, 0, 1, 1,
-2.481439, 0.7113217, -0.7087532, 0, 0, 0, 1, 1,
-2.457837, -0.986425, -2.203171, 0, 0, 0, 1, 1,
-2.41236, 1.284773, -1.612186, 0, 0, 0, 1, 1,
-2.399934, 0.8064581, -0.09211743, 0, 0, 0, 1, 1,
-2.389678, 0.1448039, -0.8966225, 0, 0, 0, 1, 1,
-2.235619, -0.1349647, -1.993708, 0, 0, 0, 1, 1,
-2.227602, -0.0942166, -3.254505, 1, 1, 1, 1, 1,
-2.152832, 1.029886, -0.2850507, 1, 1, 1, 1, 1,
-2.14088, 0.6321349, -0.9489583, 1, 1, 1, 1, 1,
-2.13519, 0.4093853, -1.271135, 1, 1, 1, 1, 1,
-2.134812, 1.306837, 0.9249846, 1, 1, 1, 1, 1,
-2.115897, 1.002726, -1.138107, 1, 1, 1, 1, 1,
-2.101716, 0.4854499, -2.340994, 1, 1, 1, 1, 1,
-2.079132, -0.1926723, -3.006892, 1, 1, 1, 1, 1,
-2.047655, 1.093891, -1.562697, 1, 1, 1, 1, 1,
-2.024615, -0.4254945, -2.17236, 1, 1, 1, 1, 1,
-2.014421, -1.233088, -1.59961, 1, 1, 1, 1, 1,
-1.996319, -1.596107, -3.058412, 1, 1, 1, 1, 1,
-1.988808, 0.2033509, -1.331642, 1, 1, 1, 1, 1,
-1.970221, -0.4883121, 0.3579431, 1, 1, 1, 1, 1,
-1.964441, 0.60068, -1.753284, 1, 1, 1, 1, 1,
-1.940217, 1.597066, -0.8039801, 0, 0, 1, 1, 1,
-1.914166, -0.6940818, -2.815606, 1, 0, 0, 1, 1,
-1.861714, 0.4121113, -2.248187, 1, 0, 0, 1, 1,
-1.855317, -0.483309, -0.8487945, 1, 0, 0, 1, 1,
-1.846801, 0.5039024, -0.5113598, 1, 0, 0, 1, 1,
-1.840732, 1.88587, -1.420492, 1, 0, 0, 1, 1,
-1.833135, -1.400776, -3.337085, 0, 0, 0, 1, 1,
-1.830385, 0.2295139, -2.589662, 0, 0, 0, 1, 1,
-1.813391, 1.195535, -1.952002, 0, 0, 0, 1, 1,
-1.806556, -0.6080155, -1.286668, 0, 0, 0, 1, 1,
-1.803106, -0.1518672, -2.007215, 0, 0, 0, 1, 1,
-1.791921, 0.05021127, -1.798306, 0, 0, 0, 1, 1,
-1.771183, -1.179485, -2.491309, 0, 0, 0, 1, 1,
-1.765059, -0.9193047, -2.069588, 1, 1, 1, 1, 1,
-1.758142, 0.09274241, -0.3989264, 1, 1, 1, 1, 1,
-1.728633, -0.6852152, 0.06892889, 1, 1, 1, 1, 1,
-1.715309, -0.2108345, -1.589122, 1, 1, 1, 1, 1,
-1.705214, -0.6956077, -2.936828, 1, 1, 1, 1, 1,
-1.670504, -0.02456263, -1.057793, 1, 1, 1, 1, 1,
-1.661781, 0.2253283, -2.675413, 1, 1, 1, 1, 1,
-1.661166, -1.265973, -1.381856, 1, 1, 1, 1, 1,
-1.660288, 0.3933167, -1.370199, 1, 1, 1, 1, 1,
-1.651178, -2.01811, -2.662297, 1, 1, 1, 1, 1,
-1.646054, -0.5999054, -2.450646, 1, 1, 1, 1, 1,
-1.617732, -0.8387485, -2.779007, 1, 1, 1, 1, 1,
-1.590448, -0.8269012, -1.937582, 1, 1, 1, 1, 1,
-1.583734, -0.975572, -0.8294785, 1, 1, 1, 1, 1,
-1.580079, -1.025082, -1.152401, 1, 1, 1, 1, 1,
-1.566309, -0.01879112, -2.349529, 0, 0, 1, 1, 1,
-1.559114, -0.795949, -2.042999, 1, 0, 0, 1, 1,
-1.552851, -0.564725, -1.907299, 1, 0, 0, 1, 1,
-1.526046, 0.5791151, -1.173522, 1, 0, 0, 1, 1,
-1.519771, -0.1763157, -1.369856, 1, 0, 0, 1, 1,
-1.505543, -0.204425, -0.5074847, 1, 0, 0, 1, 1,
-1.497479, 1.208277, -0.1769721, 0, 0, 0, 1, 1,
-1.491345, 0.5880008, -0.3611281, 0, 0, 0, 1, 1,
-1.487892, -1.787076, -1.992745, 0, 0, 0, 1, 1,
-1.487339, 1.005453, -0.3245257, 0, 0, 0, 1, 1,
-1.47885, -0.6401097, -2.549154, 0, 0, 0, 1, 1,
-1.476901, 0.2517726, -2.912615, 0, 0, 0, 1, 1,
-1.463999, -0.2293091, -1.974016, 0, 0, 0, 1, 1,
-1.451253, -1.084616, -2.828447, 1, 1, 1, 1, 1,
-1.4479, -0.1295672, -1.487846, 1, 1, 1, 1, 1,
-1.438318, 1.292295, -1.869095, 1, 1, 1, 1, 1,
-1.436879, 1.056795, -1.872018, 1, 1, 1, 1, 1,
-1.432483, -2.18983, -1.222864, 1, 1, 1, 1, 1,
-1.430798, 2.275901, 0.1379929, 1, 1, 1, 1, 1,
-1.427302, -1.362953, -1.151144, 1, 1, 1, 1, 1,
-1.41907, -0.3915706, -2.510293, 1, 1, 1, 1, 1,
-1.39833, 2.474554, -1.383466, 1, 1, 1, 1, 1,
-1.39435, 0.6645631, -2.738148, 1, 1, 1, 1, 1,
-1.390287, 0.02748138, -2.384135, 1, 1, 1, 1, 1,
-1.384377, -0.06067642, -3.223207, 1, 1, 1, 1, 1,
-1.381248, 0.6454555, -0.08015426, 1, 1, 1, 1, 1,
-1.380487, 1.146308, -1.203568, 1, 1, 1, 1, 1,
-1.376178, -0.4612302, -1.236284, 1, 1, 1, 1, 1,
-1.359785, -0.9245138, -1.886214, 0, 0, 1, 1, 1,
-1.354378, 0.1294347, -2.228045, 1, 0, 0, 1, 1,
-1.352676, 1.740501, -0.7993653, 1, 0, 0, 1, 1,
-1.350827, 0.8498642, 0.2201083, 1, 0, 0, 1, 1,
-1.347336, 0.254184, -2.779329, 1, 0, 0, 1, 1,
-1.320108, 0.1942865, 0.4557058, 1, 0, 0, 1, 1,
-1.316565, -0.9091815, -2.47367, 0, 0, 0, 1, 1,
-1.315446, 0.1099389, -0.5188066, 0, 0, 0, 1, 1,
-1.30892, 0.3851429, -3.098195, 0, 0, 0, 1, 1,
-1.290046, -0.337171, -1.644367, 0, 0, 0, 1, 1,
-1.288609, -1.508776, -2.994996, 0, 0, 0, 1, 1,
-1.275308, 0.9286107, -1.437302, 0, 0, 0, 1, 1,
-1.269967, 0.8986447, -3.098111, 0, 0, 0, 1, 1,
-1.263602, 0.05481623, -2.264325, 1, 1, 1, 1, 1,
-1.258032, 0.02166719, -1.271107, 1, 1, 1, 1, 1,
-1.25325, 1.236686, 0.7984053, 1, 1, 1, 1, 1,
-1.253089, 0.2895781, -1.987198, 1, 1, 1, 1, 1,
-1.241112, 1.366581, -0.6417062, 1, 1, 1, 1, 1,
-1.238378, -0.6199154, -2.883863, 1, 1, 1, 1, 1,
-1.235394, 2.270175, 0.1751583, 1, 1, 1, 1, 1,
-1.235212, -0.5976788, -2.058631, 1, 1, 1, 1, 1,
-1.229327, -1.167675, -3.64368, 1, 1, 1, 1, 1,
-1.216928, 0.1628476, -2.702993, 1, 1, 1, 1, 1,
-1.21687, -1.476033, -0.5149206, 1, 1, 1, 1, 1,
-1.215986, 0.7142988, -0.04391592, 1, 1, 1, 1, 1,
-1.211694, -0.7453827, -2.210599, 1, 1, 1, 1, 1,
-1.204935, 0.0407405, -1.101331, 1, 1, 1, 1, 1,
-1.202982, 1.543727, -1.57891, 1, 1, 1, 1, 1,
-1.196345, 0.3489843, -0.5654142, 0, 0, 1, 1, 1,
-1.193444, 2.1118, -0.4858114, 1, 0, 0, 1, 1,
-1.192089, 0.7908952, -2.095562, 1, 0, 0, 1, 1,
-1.185343, -0.7680615, -1.853729, 1, 0, 0, 1, 1,
-1.183392, -0.3409256, -2.653528, 1, 0, 0, 1, 1,
-1.178623, -0.007025545, -2.595084, 1, 0, 0, 1, 1,
-1.17834, 1.145286, -0.6568509, 0, 0, 0, 1, 1,
-1.170396, -0.1963412, -1.791622, 0, 0, 0, 1, 1,
-1.158253, 0.3511775, 0.04961015, 0, 0, 0, 1, 1,
-1.152646, -0.2283807, -2.002349, 0, 0, 0, 1, 1,
-1.143284, -1.178413, -1.910324, 0, 0, 0, 1, 1,
-1.141157, -0.8632097, -0.5013102, 0, 0, 0, 1, 1,
-1.139011, -0.7360072, -1.709126, 0, 0, 0, 1, 1,
-1.136645, -0.8275276, -1.720104, 1, 1, 1, 1, 1,
-1.135841, -1.826939, -2.824673, 1, 1, 1, 1, 1,
-1.134117, 0.5065091, -2.044631, 1, 1, 1, 1, 1,
-1.111438, 0.8871632, 0.8717862, 1, 1, 1, 1, 1,
-1.108688, -0.2823657, -1.441082, 1, 1, 1, 1, 1,
-1.105958, 1.402542, -1.045081, 1, 1, 1, 1, 1,
-1.096827, 0.4531596, 0.257023, 1, 1, 1, 1, 1,
-1.096217, 0.9106857, -0.796649, 1, 1, 1, 1, 1,
-1.086032, 1.15503, 0.2979976, 1, 1, 1, 1, 1,
-1.079463, -0.08996001, -1.545017, 1, 1, 1, 1, 1,
-1.068184, 0.02935087, -1.999163, 1, 1, 1, 1, 1,
-1.067628, 2.270077, -1.621932, 1, 1, 1, 1, 1,
-1.062243, 1.131167, -1.334727, 1, 1, 1, 1, 1,
-1.060176, 0.738987, -1.707247, 1, 1, 1, 1, 1,
-1.047374, 1.127887, -2.083556, 1, 1, 1, 1, 1,
-1.043966, 0.3860351, -1.691005, 0, 0, 1, 1, 1,
-1.033893, 0.9583162, 0.8215487, 1, 0, 0, 1, 1,
-1.033346, -1.161566, -2.726288, 1, 0, 0, 1, 1,
-1.032813, 0.3985707, -2.797695, 1, 0, 0, 1, 1,
-1.031695, 0.3794678, -2.151963, 1, 0, 0, 1, 1,
-1.030652, 2.063736, -0.09649424, 1, 0, 0, 1, 1,
-1.029529, 0.6789458, -3.288397, 0, 0, 0, 1, 1,
-1.028702, -0.03937699, -0.03343486, 0, 0, 0, 1, 1,
-1.021581, -1.488179, -2.644171, 0, 0, 0, 1, 1,
-1.021132, 0.7506727, -0.5029442, 0, 0, 0, 1, 1,
-1.016821, 0.7587657, -0.2449067, 0, 0, 0, 1, 1,
-1.016321, -0.2906131, -2.472062, 0, 0, 0, 1, 1,
-1.014464, 1.842048, 1.03465, 0, 0, 0, 1, 1,
-1.012589, 0.1967511, -1.885511, 1, 1, 1, 1, 1,
-1.011641, -0.4588115, -1.272863, 1, 1, 1, 1, 1,
-1.010874, -2.372546, -2.713562, 1, 1, 1, 1, 1,
-1.010613, 0.4210346, -1.417857, 1, 1, 1, 1, 1,
-1.008024, -1.59195, -3.251181, 1, 1, 1, 1, 1,
-0.9995579, 0.9799371, -1.961349, 1, 1, 1, 1, 1,
-0.9974644, -1.634393, -1.995435, 1, 1, 1, 1, 1,
-0.9963794, 0.134024, -2.248576, 1, 1, 1, 1, 1,
-0.9953223, -0.2624237, -1.950894, 1, 1, 1, 1, 1,
-0.9938449, -1.273935, -2.25795, 1, 1, 1, 1, 1,
-0.9901109, -0.640582, -2.727156, 1, 1, 1, 1, 1,
-0.9816949, 1.473353, -0.3974624, 1, 1, 1, 1, 1,
-0.9784309, -0.02388665, -2.317934, 1, 1, 1, 1, 1,
-0.9759981, -0.1326686, -2.518495, 1, 1, 1, 1, 1,
-0.9627897, 0.4661635, -2.104075, 1, 1, 1, 1, 1,
-0.9597251, 2.831542, -1.325052, 0, 0, 1, 1, 1,
-0.9578586, -0.3307353, -3.144739, 1, 0, 0, 1, 1,
-0.9528427, -1.896608, -2.252534, 1, 0, 0, 1, 1,
-0.9507889, 1.031438, -1.235051, 1, 0, 0, 1, 1,
-0.9490658, -0.5208175, -2.024549, 1, 0, 0, 1, 1,
-0.9418926, 1.669729, -0.4239775, 1, 0, 0, 1, 1,
-0.9345241, 0.9575166, -1.057386, 0, 0, 0, 1, 1,
-0.9334453, 0.725367, -0.1292015, 0, 0, 0, 1, 1,
-0.9287478, -1.043062, -2.630544, 0, 0, 0, 1, 1,
-0.9255965, -0.3439502, -2.831918, 0, 0, 0, 1, 1,
-0.9246294, -0.7931179, -2.04698, 0, 0, 0, 1, 1,
-0.9233731, -0.7387304, -3.481371, 0, 0, 0, 1, 1,
-0.9173475, -0.08658198, -0.9176645, 0, 0, 0, 1, 1,
-0.913646, 0.1598475, 0.1292645, 1, 1, 1, 1, 1,
-0.9125335, -1.408125, -1.642991, 1, 1, 1, 1, 1,
-0.912157, 0.2739498, -0.4313413, 1, 1, 1, 1, 1,
-0.9106511, 1.601158, 0.9392112, 1, 1, 1, 1, 1,
-0.9086527, 0.9792417, -1.778889, 1, 1, 1, 1, 1,
-0.905602, 0.254604, -0.8381225, 1, 1, 1, 1, 1,
-0.9046202, 0.1564821, -2.818865, 1, 1, 1, 1, 1,
-0.9001263, 1.884307, -0.7435945, 1, 1, 1, 1, 1,
-0.8994679, 1.110353, 1.467333, 1, 1, 1, 1, 1,
-0.8923, -0.6487935, -1.850954, 1, 1, 1, 1, 1,
-0.889213, 0.03732771, -1.773089, 1, 1, 1, 1, 1,
-0.8860903, 1.109607, -1.652132, 1, 1, 1, 1, 1,
-0.8824379, 1.629702, 0.4290569, 1, 1, 1, 1, 1,
-0.8823217, -1.067178, -2.162805, 1, 1, 1, 1, 1,
-0.8821075, -0.8895241, -3.540864, 1, 1, 1, 1, 1,
-0.8789413, -0.1805795, -2.166647, 0, 0, 1, 1, 1,
-0.8787164, -0.5575851, -3.64447, 1, 0, 0, 1, 1,
-0.8750324, 0.9741048, -1.273955, 1, 0, 0, 1, 1,
-0.873993, -0.3744114, -1.924881, 1, 0, 0, 1, 1,
-0.8691747, -1.353954, -2.824197, 1, 0, 0, 1, 1,
-0.8653148, 0.009410382, -2.163112, 1, 0, 0, 1, 1,
-0.8626709, -1.634167, -2.359241, 0, 0, 0, 1, 1,
-0.8575963, 0.2737029, -0.7175118, 0, 0, 0, 1, 1,
-0.8555767, 0.8726377, -0.2595663, 0, 0, 0, 1, 1,
-0.8544925, -0.7573357, -3.508343, 0, 0, 0, 1, 1,
-0.8490775, -0.3126089, -2.657301, 0, 0, 0, 1, 1,
-0.845386, 0.09941777, -1.281777, 0, 0, 0, 1, 1,
-0.8381516, -1.479659, -1.719481, 0, 0, 0, 1, 1,
-0.8344856, 0.381255, -3.669502, 1, 1, 1, 1, 1,
-0.8330424, 1.013768, -1.451691, 1, 1, 1, 1, 1,
-0.8274574, -0.1057019, -2.657378, 1, 1, 1, 1, 1,
-0.8274107, -0.6661149, -3.417656, 1, 1, 1, 1, 1,
-0.8216856, 3.065121, -1.546501, 1, 1, 1, 1, 1,
-0.8165303, 0.4125997, -0.8160989, 1, 1, 1, 1, 1,
-0.8149636, -0.5037231, -3.201679, 1, 1, 1, 1, 1,
-0.8127941, 1.72662, -1.573553, 1, 1, 1, 1, 1,
-0.8067832, 0.2090643, -1.360161, 1, 1, 1, 1, 1,
-0.804624, 0.6704518, -1.567488, 1, 1, 1, 1, 1,
-0.7992396, -1.613807, -4.092978, 1, 1, 1, 1, 1,
-0.7982021, -0.1797445, -1.180224, 1, 1, 1, 1, 1,
-0.7967568, -0.1085364, -1.895455, 1, 1, 1, 1, 1,
-0.7964352, -0.7355005, -2.021411, 1, 1, 1, 1, 1,
-0.7932238, -0.1831383, -1.699166, 1, 1, 1, 1, 1,
-0.7683103, 2.088931, 0.8664377, 0, 0, 1, 1, 1,
-0.7682154, 0.5109739, 1.307948, 1, 0, 0, 1, 1,
-0.758174, -2.164883, -4.290691, 1, 0, 0, 1, 1,
-0.7529167, 0.6374441, -0.2246783, 1, 0, 0, 1, 1,
-0.7435914, 0.6687799, -2.433651, 1, 0, 0, 1, 1,
-0.7421989, 0.2849578, -1.354381, 1, 0, 0, 1, 1,
-0.7398636, 0.1475229, -3.570923, 0, 0, 0, 1, 1,
-0.7390568, 1.749621, -0.8691055, 0, 0, 0, 1, 1,
-0.7261499, 0.6158211, -2.428486, 0, 0, 0, 1, 1,
-0.7221269, -0.4806003, -0.813186, 0, 0, 0, 1, 1,
-0.7170613, 0.4471881, 1.058031, 0, 0, 0, 1, 1,
-0.7104205, 0.1679386, -2.481598, 0, 0, 0, 1, 1,
-0.7087141, -0.07494441, -3.089253, 0, 0, 0, 1, 1,
-0.706834, -0.3098983, -2.803205, 1, 1, 1, 1, 1,
-0.7063543, -1.637737, -3.730585, 1, 1, 1, 1, 1,
-0.7056228, -0.7452791, -1.894776, 1, 1, 1, 1, 1,
-0.7015073, -1.872485, -2.357071, 1, 1, 1, 1, 1,
-0.690522, -0.7024812, -3.429027, 1, 1, 1, 1, 1,
-0.6898479, -0.5818608, -1.274418, 1, 1, 1, 1, 1,
-0.6872128, -0.1518392, -1.851405, 1, 1, 1, 1, 1,
-0.6860342, 0.04749829, -0.9710381, 1, 1, 1, 1, 1,
-0.6781, 1.344225, -0.4218709, 1, 1, 1, 1, 1,
-0.6734148, 0.5152788, -1.881239, 1, 1, 1, 1, 1,
-0.6694022, 0.07237267, -1.750051, 1, 1, 1, 1, 1,
-0.666747, 0.709217, 0.3207864, 1, 1, 1, 1, 1,
-0.6656598, -0.1510914, -3.228515, 1, 1, 1, 1, 1,
-0.6637484, 0.8674181, -0.142582, 1, 1, 1, 1, 1,
-0.6619887, -0.4059812, -0.5274915, 1, 1, 1, 1, 1,
-0.6614049, 1.197905, -0.4040025, 0, 0, 1, 1, 1,
-0.6595863, -0.3182778, -0.2761264, 1, 0, 0, 1, 1,
-0.6571276, -0.1928922, -2.299842, 1, 0, 0, 1, 1,
-0.6559537, -1.305695, -4.325742, 1, 0, 0, 1, 1,
-0.6479892, -0.9029806, -1.415929, 1, 0, 0, 1, 1,
-0.6477048, -1.29479, -3.522306, 1, 0, 0, 1, 1,
-0.6451371, 1.359227, -0.4095278, 0, 0, 0, 1, 1,
-0.6405521, 0.3337179, -1.835986, 0, 0, 0, 1, 1,
-0.6317577, 1.000188, -0.8417451, 0, 0, 0, 1, 1,
-0.6272939, 0.06616364, -2.597061, 0, 0, 0, 1, 1,
-0.6233126, -0.8197662, -3.232019, 0, 0, 0, 1, 1,
-0.6208397, 1.55149, 0.5094804, 0, 0, 0, 1, 1,
-0.6103816, 0.0918209, -3.020026, 0, 0, 0, 1, 1,
-0.6001218, 0.02527143, -2.018967, 1, 1, 1, 1, 1,
-0.5948452, 0.628718, -2.140536, 1, 1, 1, 1, 1,
-0.5932277, 1.891679, 0.7709584, 1, 1, 1, 1, 1,
-0.5877731, -0.9725478, -3.213235, 1, 1, 1, 1, 1,
-0.5857548, 0.881814, 0.5376108, 1, 1, 1, 1, 1,
-0.5854531, -1.092119, -2.621248, 1, 1, 1, 1, 1,
-0.5816148, -0.3382947, -2.405292, 1, 1, 1, 1, 1,
-0.5787317, -1.014239, -2.659626, 1, 1, 1, 1, 1,
-0.5768459, -1.465442, -2.380718, 1, 1, 1, 1, 1,
-0.5751218, 0.0730288, -1.819426, 1, 1, 1, 1, 1,
-0.5608474, -0.6295977, -1.439422, 1, 1, 1, 1, 1,
-0.5585822, 0.3124132, -0.100968, 1, 1, 1, 1, 1,
-0.5585376, 0.0206201, -2.112509, 1, 1, 1, 1, 1,
-0.5578467, -0.6775072, -0.939568, 1, 1, 1, 1, 1,
-0.5531361, -0.974928, -2.772681, 1, 1, 1, 1, 1,
-0.5525065, -0.009541675, -1.689511, 0, 0, 1, 1, 1,
-0.5512417, -0.2765968, -1.577068, 1, 0, 0, 1, 1,
-0.5464822, 0.2503628, -1.75493, 1, 0, 0, 1, 1,
-0.5421168, 1.288774, -0.08696952, 1, 0, 0, 1, 1,
-0.5408719, 1.242879, -1.621814, 1, 0, 0, 1, 1,
-0.5294079, -0.7406828, -3.162828, 1, 0, 0, 1, 1,
-0.5289215, 0.5545624, -0.07972592, 0, 0, 0, 1, 1,
-0.5277187, -0.5894419, -1.549438, 0, 0, 0, 1, 1,
-0.5245633, 2.154466, -1.435613, 0, 0, 0, 1, 1,
-0.5223503, -0.7722041, -3.154046, 0, 0, 0, 1, 1,
-0.5173304, 0.2179615, -2.816885, 0, 0, 0, 1, 1,
-0.5162259, -0.6466851, -3.956783, 0, 0, 0, 1, 1,
-0.5150893, -0.4765908, -2.638646, 0, 0, 0, 1, 1,
-0.5111076, -1.74417, -3.319124, 1, 1, 1, 1, 1,
-0.5073361, -0.7245873, -0.2284643, 1, 1, 1, 1, 1,
-0.5070507, -0.2752184, -1.974487, 1, 1, 1, 1, 1,
-0.5044384, 0.8314094, 0.3395946, 1, 1, 1, 1, 1,
-0.497033, 0.7072471, -1.455501, 1, 1, 1, 1, 1,
-0.4964632, 0.4563687, -1.58924, 1, 1, 1, 1, 1,
-0.4949416, -1.784911, -1.977997, 1, 1, 1, 1, 1,
-0.4890189, 1.584032, -1.386099, 1, 1, 1, 1, 1,
-0.4883492, 0.5767101, -1.048689, 1, 1, 1, 1, 1,
-0.4847578, -0.3485297, -3.462142, 1, 1, 1, 1, 1,
-0.4844044, -2.060502, -3.089062, 1, 1, 1, 1, 1,
-0.4823329, -0.4255441, -3.751292, 1, 1, 1, 1, 1,
-0.4800266, -0.6962643, -2.966922, 1, 1, 1, 1, 1,
-0.4773074, 0.3310099, -1.138079, 1, 1, 1, 1, 1,
-0.4746179, 0.9721463, 0.2321022, 1, 1, 1, 1, 1,
-0.471525, 0.4112652, -2.71592, 0, 0, 1, 1, 1,
-0.4700025, -2.321051, -0.8857233, 1, 0, 0, 1, 1,
-0.4680144, -0.5396461, -2.248549, 1, 0, 0, 1, 1,
-0.467263, 0.262392, -1.764213, 1, 0, 0, 1, 1,
-0.466696, -0.6369378, -3.101274, 1, 0, 0, 1, 1,
-0.4657069, -0.406149, -2.274218, 1, 0, 0, 1, 1,
-0.4646794, 2.850152, 0.8800831, 0, 0, 0, 1, 1,
-0.4614773, 1.616338, -2.991401, 0, 0, 0, 1, 1,
-0.455924, 0.4063962, 0.07117292, 0, 0, 0, 1, 1,
-0.4493099, 0.0763071, -0.22593, 0, 0, 0, 1, 1,
-0.4489652, 0.9414368, -0.6016567, 0, 0, 0, 1, 1,
-0.4476018, 1.053422, -1.219168, 0, 0, 0, 1, 1,
-0.4462956, 1.825407, -0.4380286, 0, 0, 0, 1, 1,
-0.4459971, 0.731301, -0.549957, 1, 1, 1, 1, 1,
-0.4446889, -0.2798512, -2.575428, 1, 1, 1, 1, 1,
-0.4336597, 1.760871, -0.8419206, 1, 1, 1, 1, 1,
-0.4308899, -0.7023314, -3.29552, 1, 1, 1, 1, 1,
-0.429751, -0.3486315, -2.215582, 1, 1, 1, 1, 1,
-0.4271287, 0.2500915, 0.6007047, 1, 1, 1, 1, 1,
-0.4260135, 0.5108919, -0.4079924, 1, 1, 1, 1, 1,
-0.4241093, -0.3601487, -2.415463, 1, 1, 1, 1, 1,
-0.4227844, -0.2860426, -1.106997, 1, 1, 1, 1, 1,
-0.4216969, -0.6397188, -2.492633, 1, 1, 1, 1, 1,
-0.4196199, -0.7562077, -2.87325, 1, 1, 1, 1, 1,
-0.4195939, 1.398124, -1.376427, 1, 1, 1, 1, 1,
-0.418346, 0.5949804, -0.9035677, 1, 1, 1, 1, 1,
-0.4125792, 0.1278071, -0.09264321, 1, 1, 1, 1, 1,
-0.4123537, -0.04354943, -1.150104, 1, 1, 1, 1, 1,
-0.4079727, -1.150587, -3.598729, 0, 0, 1, 1, 1,
-0.4046835, 1.118576, 1.351019, 1, 0, 0, 1, 1,
-0.4005049, -2.140032, -1.647914, 1, 0, 0, 1, 1,
-0.3997788, -0.6048843, -4.294807, 1, 0, 0, 1, 1,
-0.3980518, -1.185239, -2.064475, 1, 0, 0, 1, 1,
-0.3976557, 0.4775313, 0.5539702, 1, 0, 0, 1, 1,
-0.3957618, -0.2110911, -0.6600338, 0, 0, 0, 1, 1,
-0.3917646, 0.6216487, 0.9903508, 0, 0, 0, 1, 1,
-0.3767369, 0.02029166, -1.568688, 0, 0, 0, 1, 1,
-0.376552, -0.284205, -1.989516, 0, 0, 0, 1, 1,
-0.3735433, 1.414125, -0.0003326014, 0, 0, 0, 1, 1,
-0.3720631, 0.5316117, -0.4903074, 0, 0, 0, 1, 1,
-0.3712435, 0.7802623, -0.3670766, 0, 0, 0, 1, 1,
-0.3626013, -1.751152, -2.623262, 1, 1, 1, 1, 1,
-0.3593023, 0.6430117, -1.197523, 1, 1, 1, 1, 1,
-0.3561682, 0.4716849, 0.06237848, 1, 1, 1, 1, 1,
-0.3540997, -0.643315, -3.111018, 1, 1, 1, 1, 1,
-0.3485366, -0.6545345, -2.641286, 1, 1, 1, 1, 1,
-0.3479079, 2.061942, 0.5640521, 1, 1, 1, 1, 1,
-0.3461817, -1.924907, -2.106298, 1, 1, 1, 1, 1,
-0.3460861, -0.378755, -1.107949, 1, 1, 1, 1, 1,
-0.3442041, 1.974084, -2.996759, 1, 1, 1, 1, 1,
-0.342886, -1.228122, -2.321831, 1, 1, 1, 1, 1,
-0.3396799, -0.4711596, -2.706354, 1, 1, 1, 1, 1,
-0.3381435, 0.4173459, -2.235319, 1, 1, 1, 1, 1,
-0.335887, -0.01098789, -1.116045, 1, 1, 1, 1, 1,
-0.333937, -0.270202, -2.792943, 1, 1, 1, 1, 1,
-0.3332627, -2.24598, -1.147919, 1, 1, 1, 1, 1,
-0.3282462, -1.024343, 0.2517623, 0, 0, 1, 1, 1,
-0.3239941, -0.1313521, -0.08276726, 1, 0, 0, 1, 1,
-0.3205669, -2.020434, -2.069099, 1, 0, 0, 1, 1,
-0.3144091, -0.05745787, -0.6746853, 1, 0, 0, 1, 1,
-0.3126218, 0.7371596, 0.3468184, 1, 0, 0, 1, 1,
-0.3089484, -0.2450671, -0.5975324, 1, 0, 0, 1, 1,
-0.3072694, 1.457998, -1.953704, 0, 0, 0, 1, 1,
-0.3070645, 1.637049, 1.037278, 0, 0, 0, 1, 1,
-0.3037033, 0.04697559, -1.681187, 0, 0, 0, 1, 1,
-0.2954715, 0.3920567, -0.1785604, 0, 0, 0, 1, 1,
-0.2914279, 0.02795751, -1.880096, 0, 0, 0, 1, 1,
-0.2913595, -0.7877195, -1.980346, 0, 0, 0, 1, 1,
-0.2867963, 0.3765526, 0.1457102, 0, 0, 0, 1, 1,
-0.2808683, 0.3472329, -1.811473, 1, 1, 1, 1, 1,
-0.2805634, -0.4175143, -3.620026, 1, 1, 1, 1, 1,
-0.28048, -0.5118342, -2.624773, 1, 1, 1, 1, 1,
-0.2753144, -1.657787, -2.926259, 1, 1, 1, 1, 1,
-0.2737152, 1.073692, 0.8389587, 1, 1, 1, 1, 1,
-0.2734846, 0.207746, -2.002491, 1, 1, 1, 1, 1,
-0.2711502, -0.3801804, -3.543034, 1, 1, 1, 1, 1,
-0.2636831, -0.7440564, -2.218878, 1, 1, 1, 1, 1,
-0.2577856, -1.159044, -2.570237, 1, 1, 1, 1, 1,
-0.2554302, 0.008041898, -0.1234735, 1, 1, 1, 1, 1,
-0.2544748, -1.362075, -2.539097, 1, 1, 1, 1, 1,
-0.2530404, 2.45331, 0.2344071, 1, 1, 1, 1, 1,
-0.2499457, 0.6126205, 1.344887, 1, 1, 1, 1, 1,
-0.2498317, -2.352365, -3.545034, 1, 1, 1, 1, 1,
-0.2489381, 1.177375, 0.7079985, 1, 1, 1, 1, 1,
-0.2485683, -0.442413, -3.094072, 0, 0, 1, 1, 1,
-0.2440282, 1.90338, -0.7913693, 1, 0, 0, 1, 1,
-0.2422835, -0.5086324, -2.084474, 1, 0, 0, 1, 1,
-0.2375941, 1.548192, -0.213406, 1, 0, 0, 1, 1,
-0.2339301, -1.295366, -3.247288, 1, 0, 0, 1, 1,
-0.233519, 0.8019239, 2.145657, 1, 0, 0, 1, 1,
-0.2330218, -1.43902, -4.056071, 0, 0, 0, 1, 1,
-0.231543, -0.9227768, -4.774438, 0, 0, 0, 1, 1,
-0.229803, -1.684251, -3.549098, 0, 0, 0, 1, 1,
-0.2282173, 0.0824707, -2.270264, 0, 0, 0, 1, 1,
-0.2275245, 1.572644, 2.245641, 0, 0, 0, 1, 1,
-0.2264022, 0.405436, -0.6137576, 0, 0, 0, 1, 1,
-0.2256011, 0.2995971, -1.672117, 0, 0, 0, 1, 1,
-0.2226872, 1.313728, -1.160236, 1, 1, 1, 1, 1,
-0.2212379, 1.722819, -0.7685992, 1, 1, 1, 1, 1,
-0.2196746, 2.055556, 0.800865, 1, 1, 1, 1, 1,
-0.2188384, -0.4320764, -3.502877, 1, 1, 1, 1, 1,
-0.2188071, 0.3552146, -1.358596, 1, 1, 1, 1, 1,
-0.2176408, 0.3436564, -0.9556764, 1, 1, 1, 1, 1,
-0.2156284, 0.2290167, -1.569271, 1, 1, 1, 1, 1,
-0.2120802, -0.02427995, -1.877379, 1, 1, 1, 1, 1,
-0.208647, 1.471677, -0.6242689, 1, 1, 1, 1, 1,
-0.2084981, -0.8321428, -2.792731, 1, 1, 1, 1, 1,
-0.2032815, -0.06993402, -2.585827, 1, 1, 1, 1, 1,
-0.203167, -1.153147, -3.19096, 1, 1, 1, 1, 1,
-0.2029787, 0.909095, -0.1049639, 1, 1, 1, 1, 1,
-0.1948015, 0.9696504, -0.2902425, 1, 1, 1, 1, 1,
-0.1919681, 0.7368108, 0.1164004, 1, 1, 1, 1, 1,
-0.1909844, -0.01169903, -1.153063, 0, 0, 1, 1, 1,
-0.1896098, 1.038484, -0.6481156, 1, 0, 0, 1, 1,
-0.1875147, -0.6259845, -0.8693359, 1, 0, 0, 1, 1,
-0.186661, 0.4756624, -0.804754, 1, 0, 0, 1, 1,
-0.1842321, -2.532557, -2.757438, 1, 0, 0, 1, 1,
-0.176363, -0.06455955, -2.130196, 1, 0, 0, 1, 1,
-0.1738777, -0.2327051, -2.949144, 0, 0, 0, 1, 1,
-0.172828, -0.518956, -3.28197, 0, 0, 0, 1, 1,
-0.1680524, -0.4765264, -3.970461, 0, 0, 0, 1, 1,
-0.1604542, -1.208534, -3.720827, 0, 0, 0, 1, 1,
-0.152944, 0.05786339, -1.001163, 0, 0, 0, 1, 1,
-0.1527496, -0.6763931, -4.067649, 0, 0, 0, 1, 1,
-0.1507104, 0.1137656, 0.3314966, 0, 0, 0, 1, 1,
-0.1431282, 1.186784, -0.9974089, 1, 1, 1, 1, 1,
-0.1396009, 1.068465, -2.326314, 1, 1, 1, 1, 1,
-0.1363295, -0.9310933, -3.966152, 1, 1, 1, 1, 1,
-0.1229394, 0.165727, 0.708124, 1, 1, 1, 1, 1,
-0.117931, -0.5489008, -3.060488, 1, 1, 1, 1, 1,
-0.1156162, 0.8431605, -0.4600606, 1, 1, 1, 1, 1,
-0.1138599, 0.3629711, -1.51163, 1, 1, 1, 1, 1,
-0.1126128, -0.1603911, -1.091725, 1, 1, 1, 1, 1,
-0.1091885, -0.5333109, -4.100083, 1, 1, 1, 1, 1,
-0.1061247, -0.921714, -2.248074, 1, 1, 1, 1, 1,
-0.105583, -0.07103708, -2.230142, 1, 1, 1, 1, 1,
-0.1041702, 0.9772699, -0.2250423, 1, 1, 1, 1, 1,
-0.1026172, -0.7609997, -1.353174, 1, 1, 1, 1, 1,
-0.09986085, -2.877684, -4.189342, 1, 1, 1, 1, 1,
-0.09450512, 0.3918583, 0.5407649, 1, 1, 1, 1, 1,
-0.09372795, -0.9589189, -4.405748, 0, 0, 1, 1, 1,
-0.09208245, 1.481991, 0.3894293, 1, 0, 0, 1, 1,
-0.08779172, -1.030693, -1.543804, 1, 0, 0, 1, 1,
-0.08301301, -0.4308853, -3.409858, 1, 0, 0, 1, 1,
-0.08241688, 0.4068749, -1.023541, 1, 0, 0, 1, 1,
-0.08186599, -0.4104644, -2.73999, 1, 0, 0, 1, 1,
-0.07526608, 0.758321, -0.8416885, 0, 0, 0, 1, 1,
-0.07190592, 0.03960324, -0.4806557, 0, 0, 0, 1, 1,
-0.07040618, 0.2174856, -1.41159, 0, 0, 0, 1, 1,
-0.0646971, -0.310129, -2.693084, 0, 0, 0, 1, 1,
-0.06174622, 1.725314, 0.6941616, 0, 0, 0, 1, 1,
-0.05807236, -0.7949154, -3.069176, 0, 0, 0, 1, 1,
-0.05533027, -1.287593, -3.970071, 0, 0, 0, 1, 1,
-0.04005333, -1.044744, -2.951787, 1, 1, 1, 1, 1,
-0.03604523, -1.799497, -2.992205, 1, 1, 1, 1, 1,
-0.03426304, 0.6319776, -1.25683, 1, 1, 1, 1, 1,
-0.03407973, -1.152241, -3.766222, 1, 1, 1, 1, 1,
-0.03296072, -0.5826287, -3.694771, 1, 1, 1, 1, 1,
-0.03294517, -1.110316, -4.036738, 1, 1, 1, 1, 1,
-0.03279389, 0.95749, -0.7563956, 1, 1, 1, 1, 1,
-0.03167412, -1.020933, -2.811985, 1, 1, 1, 1, 1,
-0.03064728, 0.312861, -1.716055, 1, 1, 1, 1, 1,
-0.02733754, -0.6301717, -4.817285, 1, 1, 1, 1, 1,
-0.02692338, 0.05615935, -0.5676007, 1, 1, 1, 1, 1,
-0.02252675, -0.6802419, -1.820832, 1, 1, 1, 1, 1,
-0.02220495, -0.2341092, -2.34078, 1, 1, 1, 1, 1,
-0.02208876, 0.02707896, -0.3279201, 1, 1, 1, 1, 1,
-0.0197405, 1.648252, 0.4260966, 1, 1, 1, 1, 1,
-0.01951187, -0.1891903, -3.058226, 0, 0, 1, 1, 1,
-0.01941101, -0.2408511, -2.33946, 1, 0, 0, 1, 1,
-0.01736899, 0.2029779, -0.4446206, 1, 0, 0, 1, 1,
-0.01617356, -1.094378, -3.109553, 1, 0, 0, 1, 1,
-0.01533731, 1.076881, 0.301108, 1, 0, 0, 1, 1,
-0.008113069, -0.2238243, -3.541088, 1, 0, 0, 1, 1,
-0.005155874, 0.8422158, -1.607433, 0, 0, 0, 1, 1,
0.002706754, 2.139121, -0.3969315, 0, 0, 0, 1, 1,
0.003121937, -1.20893, 3.679476, 0, 0, 0, 1, 1,
0.004647788, -1.027357, 2.468697, 0, 0, 0, 1, 1,
0.007958313, -1.690744, 2.936009, 0, 0, 0, 1, 1,
0.009212429, -0.8734525, 2.164033, 0, 0, 0, 1, 1,
0.01017187, -1.686511, 3.410656, 0, 0, 0, 1, 1,
0.01088852, -0.9063061, 2.958519, 1, 1, 1, 1, 1,
0.01267705, -2.270036, 2.772097, 1, 1, 1, 1, 1,
0.01843392, 0.9842026, 1.070299, 1, 1, 1, 1, 1,
0.02118685, -0.5993997, 3.316741, 1, 1, 1, 1, 1,
0.02521432, -0.8579079, 3.156043, 1, 1, 1, 1, 1,
0.02590076, -0.9976667, 1.984164, 1, 1, 1, 1, 1,
0.02877938, 0.1228938, 0.7391918, 1, 1, 1, 1, 1,
0.03464573, 0.06317609, 1.397023, 1, 1, 1, 1, 1,
0.03645351, 0.0694712, 0.858576, 1, 1, 1, 1, 1,
0.03838359, 2.626754, -1.042481, 1, 1, 1, 1, 1,
0.03843457, 1.570327, 0.0381793, 1, 1, 1, 1, 1,
0.0384374, 1.66617, -0.7200513, 1, 1, 1, 1, 1,
0.04094808, 0.371895, 0.7331426, 1, 1, 1, 1, 1,
0.04162036, -0.1393891, 4.25244, 1, 1, 1, 1, 1,
0.04296027, 0.2951086, 0.4414109, 1, 1, 1, 1, 1,
0.04473675, 0.3497103, -0.8575469, 0, 0, 1, 1, 1,
0.0454674, -1.001815, 1.867894, 1, 0, 0, 1, 1,
0.04685615, -1.190171, 1.369282, 1, 0, 0, 1, 1,
0.04837725, -0.8028554, 3.503903, 1, 0, 0, 1, 1,
0.04878876, 0.1137953, 0.2320241, 1, 0, 0, 1, 1,
0.04923918, 2.076086, 0.2156295, 1, 0, 0, 1, 1,
0.0514323, 0.7955124, -0.1877732, 0, 0, 0, 1, 1,
0.05232573, 1.365013, 1.198083, 0, 0, 0, 1, 1,
0.05238018, -1.744206, 0.7415577, 0, 0, 0, 1, 1,
0.05278039, -0.6556326, 3.422736, 0, 0, 0, 1, 1,
0.05298381, 0.2676381, -0.8028407, 0, 0, 0, 1, 1,
0.05728459, 0.1609749, 0.1270705, 0, 0, 0, 1, 1,
0.05970039, -0.8612022, 3.129883, 0, 0, 0, 1, 1,
0.06039509, 0.2213442, 1.197511, 1, 1, 1, 1, 1,
0.06132094, 1.349995, 1.998646, 1, 1, 1, 1, 1,
0.06326897, -0.4135295, 3.421667, 1, 1, 1, 1, 1,
0.06513152, -1.081537, 2.741214, 1, 1, 1, 1, 1,
0.06908575, -1.077222, 4.670267, 1, 1, 1, 1, 1,
0.07057483, -0.8537287, 3.014234, 1, 1, 1, 1, 1,
0.07074729, 0.358281, -0.5490401, 1, 1, 1, 1, 1,
0.07367267, 1.424132, 3.217409, 1, 1, 1, 1, 1,
0.07524341, 0.3699572, -0.863512, 1, 1, 1, 1, 1,
0.07758176, -1.07518, 3.184925, 1, 1, 1, 1, 1,
0.08399247, -1.443758, 4.583339, 1, 1, 1, 1, 1,
0.08434128, 0.2978811, 0.470917, 1, 1, 1, 1, 1,
0.08924317, -1.624449, 0.9831901, 1, 1, 1, 1, 1,
0.09001611, 0.1494449, -1.20038, 1, 1, 1, 1, 1,
0.092443, -0.0432576, 1.10811, 1, 1, 1, 1, 1,
0.09349664, 0.5809097, -0.05488717, 0, 0, 1, 1, 1,
0.09475526, -0.9784856, 2.59682, 1, 0, 0, 1, 1,
0.09491888, 0.1343636, 1.536536, 1, 0, 0, 1, 1,
0.09545043, 1.679398, -0.3501778, 1, 0, 0, 1, 1,
0.0999494, 0.03386506, 0.3038469, 1, 0, 0, 1, 1,
0.1008435, 0.8192548, 0.3625364, 1, 0, 0, 1, 1,
0.1032944, 0.6504979, -1.284229, 0, 0, 0, 1, 1,
0.1060673, -2.20246, 4.784281, 0, 0, 0, 1, 1,
0.1216807, 0.6835679, -1.764282, 0, 0, 0, 1, 1,
0.1278214, 0.1872214, -0.1945182, 0, 0, 0, 1, 1,
0.1280393, 0.4938807, -0.3885581, 0, 0, 0, 1, 1,
0.1287569, 0.2855491, 0.1424059, 0, 0, 0, 1, 1,
0.1416831, 0.1848977, 0.2542987, 0, 0, 0, 1, 1,
0.1430548, -0.7506334, 3.486869, 1, 1, 1, 1, 1,
0.145851, 2.398471, 0.9952357, 1, 1, 1, 1, 1,
0.1466808, -0.8626614, 2.177191, 1, 1, 1, 1, 1,
0.1473499, -0.8636379, 1.574496, 1, 1, 1, 1, 1,
0.151674, -0.2082327, 3.868925, 1, 1, 1, 1, 1,
0.1527765, 0.9118215, 0.5098203, 1, 1, 1, 1, 1,
0.1549977, -1.416885, 1.992656, 1, 1, 1, 1, 1,
0.1570401, 0.6565991, -1.587915, 1, 1, 1, 1, 1,
0.1613024, -1.821802, 1.4329, 1, 1, 1, 1, 1,
0.1630881, 1.155194, -0.3683788, 1, 1, 1, 1, 1,
0.1631945, -0.1664208, 3.487293, 1, 1, 1, 1, 1,
0.165108, -1.468006, 3.030536, 1, 1, 1, 1, 1,
0.1656291, 0.791375, -0.2181129, 1, 1, 1, 1, 1,
0.1670411, 1.027515, 1.090668, 1, 1, 1, 1, 1,
0.1682867, 0.3438644, -0.03167073, 1, 1, 1, 1, 1,
0.1693862, 0.4970493, 0.3916918, 0, 0, 1, 1, 1,
0.1705256, 1.807214, -1.200678, 1, 0, 0, 1, 1,
0.1734909, 1.008098, -0.7092665, 1, 0, 0, 1, 1,
0.1743506, 0.8776112, -0.4990372, 1, 0, 0, 1, 1,
0.17448, -0.293998, 2.391437, 1, 0, 0, 1, 1,
0.1756841, -0.1906095, 0.8346024, 1, 0, 0, 1, 1,
0.1795148, 1.852322, 0.1371202, 0, 0, 0, 1, 1,
0.1816974, 0.256725, 1.021013, 0, 0, 0, 1, 1,
0.1837696, -1.893226, 2.580334, 0, 0, 0, 1, 1,
0.1845648, 0.8028748, -1.623827, 0, 0, 0, 1, 1,
0.1846665, 1.278594, 0.07169662, 0, 0, 0, 1, 1,
0.1868594, -0.5530233, 3.733755, 0, 0, 0, 1, 1,
0.1901329, -0.5276237, 2.132481, 0, 0, 0, 1, 1,
0.1923677, 1.742974, 1.016722, 1, 1, 1, 1, 1,
0.1955609, 1.191641, -0.2159605, 1, 1, 1, 1, 1,
0.1973069, -0.8177687, 2.310038, 1, 1, 1, 1, 1,
0.2006995, -0.5440096, 2.013433, 1, 1, 1, 1, 1,
0.201722, -0.2013622, 4.224847, 1, 1, 1, 1, 1,
0.2053861, -0.4228503, 2.735101, 1, 1, 1, 1, 1,
0.2107703, -0.7857326, 2.041325, 1, 1, 1, 1, 1,
0.2126096, -0.4311426, 2.628107, 1, 1, 1, 1, 1,
0.2150605, -0.4311344, 2.430423, 1, 1, 1, 1, 1,
0.2214818, -0.6651862, 2.380217, 1, 1, 1, 1, 1,
0.2220492, -0.2941182, 3.092389, 1, 1, 1, 1, 1,
0.2224592, -1.142388, 4.699801, 1, 1, 1, 1, 1,
0.2252566, -1.528451, 1.31306, 1, 1, 1, 1, 1,
0.2314997, -0.02236479, 1.947428, 1, 1, 1, 1, 1,
0.2331682, -1.934824, 4.567353, 1, 1, 1, 1, 1,
0.2343494, 1.736221, -1.184432, 0, 0, 1, 1, 1,
0.2418035, 0.1583642, 1.483342, 1, 0, 0, 1, 1,
0.2444804, -2.401812, 3.537714, 1, 0, 0, 1, 1,
0.2456077, 0.8628998, -1.353471, 1, 0, 0, 1, 1,
0.2459806, -0.4187744, 4.361722, 1, 0, 0, 1, 1,
0.2469234, 1.771204, -1.009675, 1, 0, 0, 1, 1,
0.251819, -0.2512326, 3.593236, 0, 0, 0, 1, 1,
0.251963, -1.211642, 3.45962, 0, 0, 0, 1, 1,
0.2523459, -0.1637427, 3.396321, 0, 0, 0, 1, 1,
0.2552552, 1.016356, 1.202626, 0, 0, 0, 1, 1,
0.256938, 1.070133, 0.3016525, 0, 0, 0, 1, 1,
0.2581958, 2.351628, 0.97136, 0, 0, 0, 1, 1,
0.2635856, -0.7206411, 1.434876, 0, 0, 0, 1, 1,
0.2639874, 0.4334212, 0.1735334, 1, 1, 1, 1, 1,
0.2664147, -0.1436607, 1.088099, 1, 1, 1, 1, 1,
0.2670221, 0.2738309, 0.7042747, 1, 1, 1, 1, 1,
0.2683181, 0.7969837, 0.2076575, 1, 1, 1, 1, 1,
0.2735809, 2.075287, 0.501101, 1, 1, 1, 1, 1,
0.2744456, -1.621853, 2.688749, 1, 1, 1, 1, 1,
0.275426, -0.5932466, 3.878409, 1, 1, 1, 1, 1,
0.2865701, -0.3685823, 3.367552, 1, 1, 1, 1, 1,
0.2869548, 1.862054, 0.05574463, 1, 1, 1, 1, 1,
0.292994, 1.450027, -0.4802443, 1, 1, 1, 1, 1,
0.2970291, 0.2419498, 0.3576253, 1, 1, 1, 1, 1,
0.2991814, 0.1080188, 0.02795895, 1, 1, 1, 1, 1,
0.2999473, -0.3528114, 2.092577, 1, 1, 1, 1, 1,
0.3025931, 0.05718284, 2.246262, 1, 1, 1, 1, 1,
0.3026253, -0.3768024, 2.052703, 1, 1, 1, 1, 1,
0.3061175, 1.816207, 0.5803681, 0, 0, 1, 1, 1,
0.309106, -0.2011275, 3.552452, 1, 0, 0, 1, 1,
0.3116001, 1.41037, -0.4249032, 1, 0, 0, 1, 1,
0.3154487, 0.4668735, -0.5150169, 1, 0, 0, 1, 1,
0.3199981, -0.03338709, 0.5100551, 1, 0, 0, 1, 1,
0.3206116, 0.6034689, 1.495401, 1, 0, 0, 1, 1,
0.3210491, 1.120905, 1.010712, 0, 0, 0, 1, 1,
0.3222035, 0.8535509, 0.7813857, 0, 0, 0, 1, 1,
0.3256267, 0.3246052, -1.263631, 0, 0, 0, 1, 1,
0.3280551, 1.173652, -0.7700239, 0, 0, 0, 1, 1,
0.3280556, 0.9081998, -0.9347661, 0, 0, 0, 1, 1,
0.3334933, 0.6809228, 1.631797, 0, 0, 0, 1, 1,
0.3338666, 0.07461526, 2.872924, 0, 0, 0, 1, 1,
0.3358634, 0.241595, 1.113112, 1, 1, 1, 1, 1,
0.338568, 0.2614228, 1.660677, 1, 1, 1, 1, 1,
0.3395956, -0.1350364, 1.26177, 1, 1, 1, 1, 1,
0.3403676, 0.03061192, 0.8778832, 1, 1, 1, 1, 1,
0.3415841, 0.2927302, 0.2767636, 1, 1, 1, 1, 1,
0.3466582, -0.8185363, 2.174837, 1, 1, 1, 1, 1,
0.3468305, 0.07012025, 0.6239355, 1, 1, 1, 1, 1,
0.3476414, -1.28543, 1.500138, 1, 1, 1, 1, 1,
0.3479381, -0.01033571, 0.9316956, 1, 1, 1, 1, 1,
0.3503291, 1.188578, 1.298077, 1, 1, 1, 1, 1,
0.3560441, -0.07941467, 0.7217508, 1, 1, 1, 1, 1,
0.3628297, 0.1808259, 0.3675504, 1, 1, 1, 1, 1,
0.3632662, 0.4776014, 0.4688641, 1, 1, 1, 1, 1,
0.3633465, 1.003486, -0.1289346, 1, 1, 1, 1, 1,
0.3667022, -0.9268681, 4.722524, 1, 1, 1, 1, 1,
0.3669424, -0.3902888, 1.169274, 0, 0, 1, 1, 1,
0.3693099, -1.732816, 1.305179, 1, 0, 0, 1, 1,
0.3697449, 0.05330053, 2.645148, 1, 0, 0, 1, 1,
0.3741916, -0.2792066, 2.23109, 1, 0, 0, 1, 1,
0.3778526, -0.2674569, 3.533252, 1, 0, 0, 1, 1,
0.3818654, 3.203239, 0.7075366, 1, 0, 0, 1, 1,
0.3846566, 0.1674003, -0.2989258, 0, 0, 0, 1, 1,
0.3864156, -0.9820789, 1.754127, 0, 0, 0, 1, 1,
0.3899483, -0.6706674, 2.257833, 0, 0, 0, 1, 1,
0.3908892, -0.07303876, 1.970249, 0, 0, 0, 1, 1,
0.3949558, 0.5970079, -0.1144557, 0, 0, 0, 1, 1,
0.3952355, 0.5152987, 0.2833315, 0, 0, 0, 1, 1,
0.3985423, 0.2925225, 2.013065, 0, 0, 0, 1, 1,
0.3996375, -1.207955, 3.328135, 1, 1, 1, 1, 1,
0.3997377, -0.2760452, 0.4624001, 1, 1, 1, 1, 1,
0.4008402, -1.208358, 1.195828, 1, 1, 1, 1, 1,
0.40493, -0.9943939, 3.507673, 1, 1, 1, 1, 1,
0.4059613, -0.03986812, 0.9715995, 1, 1, 1, 1, 1,
0.4077791, 0.6028513, 0.4137017, 1, 1, 1, 1, 1,
0.4079612, -0.7610598, 3.52142, 1, 1, 1, 1, 1,
0.4120629, -0.2724336, -0.0475642, 1, 1, 1, 1, 1,
0.4178269, 1.370766, 0.5980054, 1, 1, 1, 1, 1,
0.4205377, -1.373393, 2.418998, 1, 1, 1, 1, 1,
0.4285186, 0.1268471, 1.479092, 1, 1, 1, 1, 1,
0.4368576, 1.755981, 2.1071, 1, 1, 1, 1, 1,
0.4376666, 1.320487, 1.87121, 1, 1, 1, 1, 1,
0.439635, 0.4968561, 0.7459527, 1, 1, 1, 1, 1,
0.4481094, -0.1010782, 3.2026, 1, 1, 1, 1, 1,
0.4502655, 0.7991493, 0.4300662, 0, 0, 1, 1, 1,
0.4506815, -0.6855837, 1.357722, 1, 0, 0, 1, 1,
0.4518424, -1.374645, 0.7837335, 1, 0, 0, 1, 1,
0.4549063, -0.3634863, 0.4486753, 1, 0, 0, 1, 1,
0.4549424, -0.4944793, 0.2323616, 1, 0, 0, 1, 1,
0.45796, 0.828589, -0.4058239, 1, 0, 0, 1, 1,
0.4597175, -1.099548, 1.594176, 0, 0, 0, 1, 1,
0.4599293, 0.7340961, -0.9351047, 0, 0, 0, 1, 1,
0.4611525, 0.9887812, -0.8686162, 0, 0, 0, 1, 1,
0.4626387, 0.7766971, -0.8724383, 0, 0, 0, 1, 1,
0.4651089, -1.378965, 5.173417, 0, 0, 0, 1, 1,
0.4691504, -1.09311, 2.839585, 0, 0, 0, 1, 1,
0.4701849, 0.2134066, 1.983358, 0, 0, 0, 1, 1,
0.4737851, 0.493237, 2.499039, 1, 1, 1, 1, 1,
0.476181, -2.438512, 2.231642, 1, 1, 1, 1, 1,
0.4785944, -0.6782086, 2.543033, 1, 1, 1, 1, 1,
0.4827853, 0.1972647, 0.8955768, 1, 1, 1, 1, 1,
0.4837929, -0.649393, 1.158204, 1, 1, 1, 1, 1,
0.487936, -0.338357, 3.165576, 1, 1, 1, 1, 1,
0.4888018, 0.07135904, 2.61176, 1, 1, 1, 1, 1,
0.489722, 0.9763259, 0.8396537, 1, 1, 1, 1, 1,
0.4915369, -0.9856082, 1.702981, 1, 1, 1, 1, 1,
0.4942104, 1.109806, 1.34349, 1, 1, 1, 1, 1,
0.4954927, 0.4994098, 1.914817, 1, 1, 1, 1, 1,
0.4993259, -2.944022, 3.177031, 1, 1, 1, 1, 1,
0.5032028, -1.460248, 3.073104, 1, 1, 1, 1, 1,
0.5076694, -0.3889703, 2.104913, 1, 1, 1, 1, 1,
0.510143, 0.3275181, 0.101786, 1, 1, 1, 1, 1,
0.5115069, 0.4826637, 1.935108, 0, 0, 1, 1, 1,
0.5117379, -0.2513923, 3.339943, 1, 0, 0, 1, 1,
0.5157419, 1.135347, 1.269913, 1, 0, 0, 1, 1,
0.5157849, -1.580833, 2.125786, 1, 0, 0, 1, 1,
0.5199022, 0.6596515, 0.9535707, 1, 0, 0, 1, 1,
0.5212479, 2.982097, -0.738399, 1, 0, 0, 1, 1,
0.5217807, 0.360425, 0.2390111, 0, 0, 0, 1, 1,
0.5253579, 0.5880901, 1.577189, 0, 0, 0, 1, 1,
0.535306, 0.1188909, 0.4355479, 0, 0, 0, 1, 1,
0.5355314, 2.007605, 1.436627, 0, 0, 0, 1, 1,
0.5413755, 0.349897, 2.062809, 0, 0, 0, 1, 1,
0.5431829, -0.8695771, 4.514898, 0, 0, 0, 1, 1,
0.5432418, 0.1654551, 1.327951, 0, 0, 0, 1, 1,
0.5434863, -0.228931, 1.390134, 1, 1, 1, 1, 1,
0.5499949, -1.023272, 2.736098, 1, 1, 1, 1, 1,
0.5535259, 1.990069, 1.190071, 1, 1, 1, 1, 1,
0.5557509, 0.6485788, 1.921366, 1, 1, 1, 1, 1,
0.5583144, 1.650551, 2.274231, 1, 1, 1, 1, 1,
0.5587917, 0.8403584, -0.4943624, 1, 1, 1, 1, 1,
0.5605441, 0.3527754, 2.391215, 1, 1, 1, 1, 1,
0.5639679, 0.2658587, 1.518347, 1, 1, 1, 1, 1,
0.5650128, 1.193759, 1.84215, 1, 1, 1, 1, 1,
0.5679708, -0.5059046, 1.982655, 1, 1, 1, 1, 1,
0.5691348, -0.5133867, 1.428273, 1, 1, 1, 1, 1,
0.5767427, 1.927372, -0.04792573, 1, 1, 1, 1, 1,
0.5851266, 0.6158651, 0.5904458, 1, 1, 1, 1, 1,
0.585613, 0.9240434, -0.159264, 1, 1, 1, 1, 1,
0.5876403, 0.7604294, 0.9937286, 1, 1, 1, 1, 1,
0.5902793, -0.4592614, 1.176095, 0, 0, 1, 1, 1,
0.5907349, -0.8543671, 1.310851, 1, 0, 0, 1, 1,
0.593417, -0.8369458, 3.514842, 1, 0, 0, 1, 1,
0.5962999, 1.287042, -0.1737302, 1, 0, 0, 1, 1,
0.599544, -0.9709082, 2.701768, 1, 0, 0, 1, 1,
0.6027939, -0.3837824, 1.598633, 1, 0, 0, 1, 1,
0.6118991, 0.6327591, -0.5817267, 0, 0, 0, 1, 1,
0.6120183, -1.336656, 3.873441, 0, 0, 0, 1, 1,
0.6137511, -0.3229665, 0.9303797, 0, 0, 0, 1, 1,
0.6147546, 1.175693, -3.061657, 0, 0, 0, 1, 1,
0.6161649, -1.027243, 3.295897, 0, 0, 0, 1, 1,
0.6181236, -0.8414963, 3.992608, 0, 0, 0, 1, 1,
0.6212879, -0.2577137, 1.880087, 0, 0, 0, 1, 1,
0.6222324, 1.725746, -0.05994045, 1, 1, 1, 1, 1,
0.6363541, 0.7956216, -0.07189138, 1, 1, 1, 1, 1,
0.637238, 0.712882, 1.321059, 1, 1, 1, 1, 1,
0.6431403, -1.376033, 2.892091, 1, 1, 1, 1, 1,
0.6501777, 1.076846, 0.2419554, 1, 1, 1, 1, 1,
0.6542166, -0.645479, 3.08882, 1, 1, 1, 1, 1,
0.6561882, -0.03142646, 1.294676, 1, 1, 1, 1, 1,
0.6602241, -0.4561943, 3.552047, 1, 1, 1, 1, 1,
0.6667562, -0.6757946, 2.156822, 1, 1, 1, 1, 1,
0.6687872, -1.498422, 4.395918, 1, 1, 1, 1, 1,
0.6696283, -0.1616233, 3.943622, 1, 1, 1, 1, 1,
0.6712536, 0.4999749, 1.049725, 1, 1, 1, 1, 1,
0.6743878, -0.1656451, 1.51423, 1, 1, 1, 1, 1,
0.6767018, 0.5585427, 0.0733306, 1, 1, 1, 1, 1,
0.6814824, -0.3883066, 4.129041, 1, 1, 1, 1, 1,
0.6818188, -1.485908, 3.362904, 0, 0, 1, 1, 1,
0.6830953, -0.2068137, 0.5068393, 1, 0, 0, 1, 1,
0.6861116, 0.07251785, 1.386045, 1, 0, 0, 1, 1,
0.687133, 0.3355528, 1.202443, 1, 0, 0, 1, 1,
0.6892407, -0.2442203, 3.00211, 1, 0, 0, 1, 1,
0.6914305, 0.3547315, 0.7571718, 1, 0, 0, 1, 1,
0.6914819, -0.8715052, 0.9682302, 0, 0, 0, 1, 1,
0.691963, 1.053096, -0.8786477, 0, 0, 0, 1, 1,
0.6996742, 0.2461975, 2.543194, 0, 0, 0, 1, 1,
0.7019206, -0.5049897, 4.114617, 0, 0, 0, 1, 1,
0.7022322, -1.041204, 3.236031, 0, 0, 0, 1, 1,
0.7047175, 0.08525898, 1.581186, 0, 0, 0, 1, 1,
0.7058299, 0.1890733, 1.627322, 0, 0, 0, 1, 1,
0.7069298, 0.8101492, 2.82205, 1, 1, 1, 1, 1,
0.710393, -0.6868603, 2.553795, 1, 1, 1, 1, 1,
0.7214383, -1.526227, 3.574037, 1, 1, 1, 1, 1,
0.7271398, 0.4552948, 1.093533, 1, 1, 1, 1, 1,
0.7324533, 1.827293, -1.01512, 1, 1, 1, 1, 1,
0.7331978, -0.6766787, 2.33943, 1, 1, 1, 1, 1,
0.7498548, 0.8089935, 0.1172541, 1, 1, 1, 1, 1,
0.7561066, -0.2580251, 3.776168, 1, 1, 1, 1, 1,
0.7577725, -1.352401, 1.435674, 1, 1, 1, 1, 1,
0.7605346, 0.7827151, -0.34232, 1, 1, 1, 1, 1,
0.7612026, -0.6135581, 3.367997, 1, 1, 1, 1, 1,
0.7667058, 0.5504065, 2.329765, 1, 1, 1, 1, 1,
0.7809885, 1.074648, -0.8626179, 1, 1, 1, 1, 1,
0.78131, -1.143103, 2.772337, 1, 1, 1, 1, 1,
0.7818183, 0.230478, 1.839073, 1, 1, 1, 1, 1,
0.7871976, -1.453105, 0.8173751, 0, 0, 1, 1, 1,
0.7887883, -1.130544, 3.026222, 1, 0, 0, 1, 1,
0.7910389, 0.6592076, 0.6837596, 1, 0, 0, 1, 1,
0.7917226, 0.5886069, 0.9217547, 1, 0, 0, 1, 1,
0.7935311, -1.985617, 4.090147, 1, 0, 0, 1, 1,
0.7950179, 1.940138, 1.583014, 1, 0, 0, 1, 1,
0.7951396, 1.742257, 0.5025318, 0, 0, 0, 1, 1,
0.7984054, 1.065212, -0.8996953, 0, 0, 0, 1, 1,
0.8047771, -0.1437943, 2.872834, 0, 0, 0, 1, 1,
0.8076044, -0.3668172, 2.086686, 0, 0, 0, 1, 1,
0.8124753, -1.36655, 1.793395, 0, 0, 0, 1, 1,
0.8130745, -0.2539583, 2.1213, 0, 0, 0, 1, 1,
0.8146595, -0.2279147, 1.498598, 0, 0, 0, 1, 1,
0.8186781, -0.2860025, 2.682155, 1, 1, 1, 1, 1,
0.8240211, -0.9516718, 2.458055, 1, 1, 1, 1, 1,
0.8274756, -0.9488513, 2.92684, 1, 1, 1, 1, 1,
0.8286069, -1.102991, 3.479575, 1, 1, 1, 1, 1,
0.8378432, 1.128293, 1.152992, 1, 1, 1, 1, 1,
0.840372, -0.4896348, 2.322276, 1, 1, 1, 1, 1,
0.8433547, -0.9326521, 2.97627, 1, 1, 1, 1, 1,
0.8495225, -0.9412475, 1.755164, 1, 1, 1, 1, 1,
0.8685362, 0.04851678, 1.931466, 1, 1, 1, 1, 1,
0.8737605, -0.04835711, 1.158833, 1, 1, 1, 1, 1,
0.8832468, 0.2770094, 4.19211, 1, 1, 1, 1, 1,
0.8924478, -1.791839, 2.436767, 1, 1, 1, 1, 1,
0.9032088, 1.167257, -1.456726, 1, 1, 1, 1, 1,
0.9044996, -0.1860502, 2.628128, 1, 1, 1, 1, 1,
0.9150921, 0.1290996, 1.224867, 1, 1, 1, 1, 1,
0.9194723, -0.5949543, 4.243667, 0, 0, 1, 1, 1,
0.9249232, -0.09183868, -0.1472018, 1, 0, 0, 1, 1,
0.9255356, -1.125901, 1.623438, 1, 0, 0, 1, 1,
0.9263724, -1.254143, 2.37176, 1, 0, 0, 1, 1,
0.9270445, 1.770367, 0.09245155, 1, 0, 0, 1, 1,
0.9273523, 0.9304959, 1.007688, 1, 0, 0, 1, 1,
0.9312212, 0.4245769, 1.328358, 0, 0, 0, 1, 1,
0.933678, -0.01399182, 0.8287029, 0, 0, 0, 1, 1,
0.9392686, -0.2588609, 3.393702, 0, 0, 0, 1, 1,
0.9427295, 0.2960275, 1.804816, 0, 0, 0, 1, 1,
0.9428395, -0.5034013, 1.371847, 0, 0, 0, 1, 1,
0.9519063, 1.097086, -0.118776, 0, 0, 0, 1, 1,
0.9548922, 0.7697966, 0.44366, 0, 0, 0, 1, 1,
0.9554396, 1.323009, -1.336759, 1, 1, 1, 1, 1,
0.9600092, 0.8075894, 1.133023, 1, 1, 1, 1, 1,
0.9637897, 0.6673173, 0.844873, 1, 1, 1, 1, 1,
0.9647453, 0.4048287, 0.4992302, 1, 1, 1, 1, 1,
0.9649451, -0.9045251, 3.050392, 1, 1, 1, 1, 1,
0.9674773, -0.2391842, 2.808425, 1, 1, 1, 1, 1,
0.975899, -0.386371, 3.920874, 1, 1, 1, 1, 1,
0.9759324, 1.008815, 1.541393, 1, 1, 1, 1, 1,
0.9845201, 0.2460245, 2.168882, 1, 1, 1, 1, 1,
0.9849504, 0.7370902, -0.6822451, 1, 1, 1, 1, 1,
0.9908702, 0.2645653, 1.365262, 1, 1, 1, 1, 1,
0.9931712, -0.2101218, 2.016721, 1, 1, 1, 1, 1,
0.9962839, -0.6561494, 2.070244, 1, 1, 1, 1, 1,
1.004477, 2.353485, 0.7997239, 1, 1, 1, 1, 1,
1.004928, 1.706926, 0.7234179, 1, 1, 1, 1, 1,
1.007288, -0.4975005, 1.650702, 0, 0, 1, 1, 1,
1.010856, 0.6697588, 0.5976915, 1, 0, 0, 1, 1,
1.017891, -0.609967, 1.738207, 1, 0, 0, 1, 1,
1.020404, -1.222847, -0.7390825, 1, 0, 0, 1, 1,
1.029466, 0.5432116, 1.141831, 1, 0, 0, 1, 1,
1.031646, 1.907241, 0.7925832, 1, 0, 0, 1, 1,
1.035334, -1.309549, -0.8811098, 0, 0, 0, 1, 1,
1.036977, -0.03767737, 3.078049, 0, 0, 0, 1, 1,
1.037948, 1.203752, -1.117659, 0, 0, 0, 1, 1,
1.042416, 1.005162, 3.4287, 0, 0, 0, 1, 1,
1.04671, 1.199713, 0.1275819, 0, 0, 0, 1, 1,
1.052209, 0.4790898, 0.6904431, 0, 0, 0, 1, 1,
1.055683, 0.07868377, 0.8442767, 0, 0, 0, 1, 1,
1.059412, -0.3039535, 2.549915, 1, 1, 1, 1, 1,
1.061409, 1.594717, 2.073248, 1, 1, 1, 1, 1,
1.061502, -0.441879, 2.727434, 1, 1, 1, 1, 1,
1.062949, -0.5051686, 1.1773, 1, 1, 1, 1, 1,
1.066884, 0.7230094, 1.067697, 1, 1, 1, 1, 1,
1.068037, -0.7346507, 2.60143, 1, 1, 1, 1, 1,
1.068257, 0.4880419, -0.1397146, 1, 1, 1, 1, 1,
1.078454, 0.4133459, 3.140023, 1, 1, 1, 1, 1,
1.080366, -1.841524, 3.189227, 1, 1, 1, 1, 1,
1.084416, 2.05552, 0.004820859, 1, 1, 1, 1, 1,
1.09138, -1.198932, 1.79415, 1, 1, 1, 1, 1,
1.096193, 0.7983376, -0.3288052, 1, 1, 1, 1, 1,
1.098689, 0.09324083, 1.842853, 1, 1, 1, 1, 1,
1.102907, -0.4630906, 3.046506, 1, 1, 1, 1, 1,
1.11058, -1.449683, 2.819183, 1, 1, 1, 1, 1,
1.111863, -1.987902, 3.243834, 0, 0, 1, 1, 1,
1.118689, 0.4355582, 1.739765, 1, 0, 0, 1, 1,
1.126343, -1.574202, 2.104656, 1, 0, 0, 1, 1,
1.129892, -1.263201, 2.334136, 1, 0, 0, 1, 1,
1.130477, 1.843143, 0.8522509, 1, 0, 0, 1, 1,
1.141241, 0.3688079, 1.108124, 1, 0, 0, 1, 1,
1.141799, 0.5600327, 1.037347, 0, 0, 0, 1, 1,
1.143797, 0.4523497, 0.8468307, 0, 0, 0, 1, 1,
1.14416, -0.9912983, 1.374291, 0, 0, 0, 1, 1,
1.161857, 1.007946, 1.335878, 0, 0, 0, 1, 1,
1.164633, -0.3109196, 3.389296, 0, 0, 0, 1, 1,
1.166175, -0.4657867, 1.932926, 0, 0, 0, 1, 1,
1.168269, 0.08737797, 0.3125776, 0, 0, 0, 1, 1,
1.17994, 1.934538, 0.57915, 1, 1, 1, 1, 1,
1.181126, -1.28615, 2.940554, 1, 1, 1, 1, 1,
1.181463, -0.06647756, 2.939608, 1, 1, 1, 1, 1,
1.18821, 1.50591, 1.667567, 1, 1, 1, 1, 1,
1.188699, 0.3037805, 0.5720453, 1, 1, 1, 1, 1,
1.19922, -0.3002811, 0.7348623, 1, 1, 1, 1, 1,
1.206451, -0.6362135, 1.840525, 1, 1, 1, 1, 1,
1.213616, 0.6803908, 2.332196, 1, 1, 1, 1, 1,
1.215985, -0.0904857, 1.635204, 1, 1, 1, 1, 1,
1.22021, 0.5264189, 1.206909, 1, 1, 1, 1, 1,
1.238984, 0.2665777, 0.5628148, 1, 1, 1, 1, 1,
1.239523, 1.003307, -0.003223989, 1, 1, 1, 1, 1,
1.246379, -1.686408, 1.325844, 1, 1, 1, 1, 1,
1.261007, 0.9935057, 0.8287938, 1, 1, 1, 1, 1,
1.264338, -0.6790037, 3.554354, 1, 1, 1, 1, 1,
1.265043, 1.648873, -0.289583, 0, 0, 1, 1, 1,
1.2731, 1.694559, 0.4045257, 1, 0, 0, 1, 1,
1.275101, -0.8360724, 0.1742616, 1, 0, 0, 1, 1,
1.276761, -0.5032114, 1.759923, 1, 0, 0, 1, 1,
1.28618, -0.6694993, 0.7221013, 1, 0, 0, 1, 1,
1.29002, 0.8609924, 1.406086, 1, 0, 0, 1, 1,
1.290145, -0.4735507, 2.231925, 0, 0, 0, 1, 1,
1.296413, 0.4452489, 1.986919, 0, 0, 0, 1, 1,
1.306944, 0.8272518, 2.040242, 0, 0, 0, 1, 1,
1.307138, 1.049312, 2.198066, 0, 0, 0, 1, 1,
1.310697, 0.7881007, 2.197433, 0, 0, 0, 1, 1,
1.314887, 0.6961251, 1.008278, 0, 0, 0, 1, 1,
1.326145, -0.3537292, 0.919813, 0, 0, 0, 1, 1,
1.327626, -0.213491, 1.283628, 1, 1, 1, 1, 1,
1.337507, 2.088677, -0.2752723, 1, 1, 1, 1, 1,
1.345438, -0.3806369, 1.421748, 1, 1, 1, 1, 1,
1.348786, 0.5880696, -0.4030629, 1, 1, 1, 1, 1,
1.352547, 0.9242557, 0.4149883, 1, 1, 1, 1, 1,
1.358703, 2.136803, 2.057682, 1, 1, 1, 1, 1,
1.361234, -0.3645843, 3.631378, 1, 1, 1, 1, 1,
1.365875, 1.387041, 1.146492, 1, 1, 1, 1, 1,
1.376891, -0.1289894, 1.618927, 1, 1, 1, 1, 1,
1.397825, 0.2935305, 2.261896, 1, 1, 1, 1, 1,
1.399725, 1.235719, 2.096399, 1, 1, 1, 1, 1,
1.404641, 1.899793, 1.917057, 1, 1, 1, 1, 1,
1.405265, 0.211999, 1.122531, 1, 1, 1, 1, 1,
1.405571, 1.231408, -0.5363985, 1, 1, 1, 1, 1,
1.409203, -0.5698542, 3.114666, 1, 1, 1, 1, 1,
1.413187, -1.126761, 0.3686632, 0, 0, 1, 1, 1,
1.426404, 1.088869, -0.6034993, 1, 0, 0, 1, 1,
1.434328, 1.760681, 1.168577, 1, 0, 0, 1, 1,
1.438304, 0.9411246, -0.0002778304, 1, 0, 0, 1, 1,
1.448508, -0.02749063, 0.6853853, 1, 0, 0, 1, 1,
1.469623, -1.183493, 1.805022, 1, 0, 0, 1, 1,
1.480409, 0.6166027, 1.325216, 0, 0, 0, 1, 1,
1.481323, 0.3357923, 1.210515, 0, 0, 0, 1, 1,
1.491742, -0.6026923, 5.287674, 0, 0, 0, 1, 1,
1.515706, 0.3028964, 1.332438, 0, 0, 0, 1, 1,
1.518761, -0.4697182, 3.057955, 0, 0, 0, 1, 1,
1.531395, -0.7410429, -0.02888715, 0, 0, 0, 1, 1,
1.533896, -1.001208, 0.8545972, 0, 0, 0, 1, 1,
1.534077, 0.8257921, 0.8508206, 1, 1, 1, 1, 1,
1.536011, -0.2259884, 2.659594, 1, 1, 1, 1, 1,
1.547005, -0.29259, -0.2911848, 1, 1, 1, 1, 1,
1.554833, -0.6067454, 2.354126, 1, 1, 1, 1, 1,
1.556602, -0.3149378, 0.9997336, 1, 1, 1, 1, 1,
1.560769, 0.8272445, 0.924096, 1, 1, 1, 1, 1,
1.572183, -0.1418143, 1.481368, 1, 1, 1, 1, 1,
1.573664, 0.6861609, 0.9026008, 1, 1, 1, 1, 1,
1.576386, 0.3417432, 1.182532, 1, 1, 1, 1, 1,
1.588658, 0.8071212, 1.487782, 1, 1, 1, 1, 1,
1.592511, 0.0008669015, 0.6631603, 1, 1, 1, 1, 1,
1.61296, -0.2590174, 2.058022, 1, 1, 1, 1, 1,
1.685685, -0.8030908, 3.292613, 1, 1, 1, 1, 1,
1.69796, -0.6331524, 0.54799, 1, 1, 1, 1, 1,
1.727221, -0.8080332, 2.873224, 1, 1, 1, 1, 1,
1.730933, -0.6869702, 3.607541, 0, 0, 1, 1, 1,
1.738448, -0.2352992, -0.7955188, 1, 0, 0, 1, 1,
1.748955, -0.2538017, 1.222591, 1, 0, 0, 1, 1,
1.751091, 0.7359406, 1.225716, 1, 0, 0, 1, 1,
1.761809, -0.4054984, 1.757143, 1, 0, 0, 1, 1,
1.763524, 1.904805, 0.1540343, 1, 0, 0, 1, 1,
1.786563, 0.8522349, 0.6790622, 0, 0, 0, 1, 1,
1.78787, -0.6171182, 0.9388255, 0, 0, 0, 1, 1,
1.797514, 0.7507998, -0.05725534, 0, 0, 0, 1, 1,
1.81551, -0.7577672, 2.379631, 0, 0, 0, 1, 1,
1.835002, -0.9156668, 1.697491, 0, 0, 0, 1, 1,
1.848977, -0.5083539, 2.973329, 0, 0, 0, 1, 1,
1.881214, 0.6744486, 0.5989592, 0, 0, 0, 1, 1,
1.896257, -2.022555, 3.145826, 1, 1, 1, 1, 1,
1.949688, 0.2311724, 1.935597, 1, 1, 1, 1, 1,
1.978955, 0.5260392, 2.024625, 1, 1, 1, 1, 1,
1.982433, -0.2926608, 1.153442, 1, 1, 1, 1, 1,
2.010617, 1.339501, -0.5615582, 1, 1, 1, 1, 1,
2.017085, -0.1557365, 0.7399367, 1, 1, 1, 1, 1,
2.047748, 0.05595443, 2.644338, 1, 1, 1, 1, 1,
2.056473, -0.5450707, 1.977678, 1, 1, 1, 1, 1,
2.072242, -0.285853, 1.176468, 1, 1, 1, 1, 1,
2.079364, -1.601685, 2.081417, 1, 1, 1, 1, 1,
2.079827, -0.04153548, 0.4100969, 1, 1, 1, 1, 1,
2.081001, 1.221099, 2.217919, 1, 1, 1, 1, 1,
2.095096, -0.7767369, 3.740821, 1, 1, 1, 1, 1,
2.097454, -0.19114, 0.02390107, 1, 1, 1, 1, 1,
2.114948, -0.6584571, 1.887867, 1, 1, 1, 1, 1,
2.12965, -0.6019557, 2.156023, 0, 0, 1, 1, 1,
2.133028, 0.5372502, 2.184687, 1, 0, 0, 1, 1,
2.148778, 0.370784, 1.70236, 1, 0, 0, 1, 1,
2.182963, 1.281472, 0.4722877, 1, 0, 0, 1, 1,
2.254864, 0.3880934, 0.9608434, 1, 0, 0, 1, 1,
2.276379, -0.07093089, 2.038467, 1, 0, 0, 1, 1,
2.297796, -0.2100843, 0.7375722, 0, 0, 0, 1, 1,
2.305247, -0.2513913, 2.917321, 0, 0, 0, 1, 1,
2.305301, 0.3230139, 0.3540542, 0, 0, 0, 1, 1,
2.31041, 0.5939398, 3.539566, 0, 0, 0, 1, 1,
2.334268, 0.6847408, 2.022483, 0, 0, 0, 1, 1,
2.349723, -0.9409542, 1.145189, 0, 0, 0, 1, 1,
2.582561, -0.373833, 1.597644, 0, 0, 0, 1, 1,
2.63509, 0.1650783, 1.301567, 1, 1, 1, 1, 1,
2.636993, 1.016346, 1.215928, 1, 1, 1, 1, 1,
2.721956, -0.2831885, 2.214501, 1, 1, 1, 1, 1,
2.766555, 0.9133623, 0.7468745, 1, 1, 1, 1, 1,
2.775747, -0.1838562, 2.882147, 1, 1, 1, 1, 1,
2.894721, 1.244339, 1.979327, 1, 1, 1, 1, 1,
3.267865, -1.324824, 1.473682, 1, 1, 1, 1, 1
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
var radius = 9.30101;
var distance = 32.6694;
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
mvMatrix.translate( 0.006230354, -0.1296084, -0.2351947 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6694);
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
