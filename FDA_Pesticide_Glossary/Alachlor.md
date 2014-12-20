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
-3.185171, 0.8847373, -2.78037, 1, 0, 0, 1,
-3.171866, 0.4496666, 0.1241492, 1, 0.007843138, 0, 1,
-2.991395, -0.4019067, -2.639545, 1, 0.01176471, 0, 1,
-2.886568, -0.06634363, -1.528396, 1, 0.01960784, 0, 1,
-2.824169, 0.4859022, -0.711848, 1, 0.02352941, 0, 1,
-2.815807, -0.7847327, -2.263651, 1, 0.03137255, 0, 1,
-2.769346, -0.5625877, -0.5813003, 1, 0.03529412, 0, 1,
-2.629781, 0.04913238, -2.427223, 1, 0.04313726, 0, 1,
-2.52104, -0.92081, -2.116351, 1, 0.04705882, 0, 1,
-2.518786, 1.101893, -0.3460591, 1, 0.05490196, 0, 1,
-2.459951, -0.02120072, -0.494714, 1, 0.05882353, 0, 1,
-2.205957, 0.1609714, -0.8312863, 1, 0.06666667, 0, 1,
-2.197762, -0.7393622, -2.291142, 1, 0.07058824, 0, 1,
-2.130318, 0.5545982, -1.448278, 1, 0.07843138, 0, 1,
-2.12381, -1.316556, -2.123556, 1, 0.08235294, 0, 1,
-2.089058, -1.324273, -2.281024, 1, 0.09019608, 0, 1,
-2.040268, 0.4763644, -0.5189258, 1, 0.09411765, 0, 1,
-2.022024, -0.02355669, -2.342235, 1, 0.1019608, 0, 1,
-2.018285, 2.499598, 0.5117412, 1, 0.1098039, 0, 1,
-2.018205, -0.5467211, -0.471958, 1, 0.1137255, 0, 1,
-2.012254, -0.9133759, -1.548661, 1, 0.1215686, 0, 1,
-1.995739, 0.813104, 0.06874573, 1, 0.1254902, 0, 1,
-1.971915, -1.174089, -3.932656, 1, 0.1333333, 0, 1,
-1.971062, -0.42656, -0.2165523, 1, 0.1372549, 0, 1,
-1.957577, -0.1936833, -1.863019, 1, 0.145098, 0, 1,
-1.942728, 1.705544, 0.3351746, 1, 0.1490196, 0, 1,
-1.933453, -0.5547113, -2.767362, 1, 0.1568628, 0, 1,
-1.920606, -0.3736621, -2.304108, 1, 0.1607843, 0, 1,
-1.911974, 0.1904437, -0.1126626, 1, 0.1686275, 0, 1,
-1.884828, 0.4873482, -1.69165, 1, 0.172549, 0, 1,
-1.836054, 0.2263345, -1.968405, 1, 0.1803922, 0, 1,
-1.821634, 1.006453, -2.212949, 1, 0.1843137, 0, 1,
-1.805134, 1.207947, -2.796065, 1, 0.1921569, 0, 1,
-1.788993, 0.4508975, -0.1441104, 1, 0.1960784, 0, 1,
-1.77857, 0.7602147, -1.40398, 1, 0.2039216, 0, 1,
-1.769082, 0.3446564, -1.156242, 1, 0.2117647, 0, 1,
-1.768212, 2.096794, -0.8315873, 1, 0.2156863, 0, 1,
-1.742196, -1.652044, -2.955686, 1, 0.2235294, 0, 1,
-1.721073, 0.09929337, -2.151941, 1, 0.227451, 0, 1,
-1.718934, 1.66617, 0.764618, 1, 0.2352941, 0, 1,
-1.698935, -0.9287277, -1.670622, 1, 0.2392157, 0, 1,
-1.687324, 0.01920145, -0.4300574, 1, 0.2470588, 0, 1,
-1.667939, -0.1591254, -4.011192, 1, 0.2509804, 0, 1,
-1.629671, 0.02060384, -2.6196, 1, 0.2588235, 0, 1,
-1.627612, 0.1174123, -1.681197, 1, 0.2627451, 0, 1,
-1.625469, 0.01514388, -0.6106522, 1, 0.2705882, 0, 1,
-1.619323, -1.367223, -3.628792, 1, 0.2745098, 0, 1,
-1.618191, 1.153908, 0.8107922, 1, 0.282353, 0, 1,
-1.614654, 0.08539212, -0.9334661, 1, 0.2862745, 0, 1,
-1.613984, 1.44743, -2.74878, 1, 0.2941177, 0, 1,
-1.612963, 0.2011811, -1.383441, 1, 0.3019608, 0, 1,
-1.569558, -0.1296352, -1.817139, 1, 0.3058824, 0, 1,
-1.558038, -1.826377, -2.259405, 1, 0.3137255, 0, 1,
-1.538647, -0.5713451, -0.4650565, 1, 0.3176471, 0, 1,
-1.538199, 0.7663944, -1.172954, 1, 0.3254902, 0, 1,
-1.531055, -1.511499, -1.559404, 1, 0.3294118, 0, 1,
-1.52997, 0.3723175, -2.337052, 1, 0.3372549, 0, 1,
-1.528548, 0.5654965, -1.474589, 1, 0.3411765, 0, 1,
-1.511208, 1.287372, -1.318912, 1, 0.3490196, 0, 1,
-1.49461, -0.1512966, -0.9251948, 1, 0.3529412, 0, 1,
-1.489472, 2.898073, -0.8062676, 1, 0.3607843, 0, 1,
-1.469659, -1.634552, -3.372864, 1, 0.3647059, 0, 1,
-1.45988, -1.089259, -2.298504, 1, 0.372549, 0, 1,
-1.455938, -0.7149936, -3.063695, 1, 0.3764706, 0, 1,
-1.455649, 0.7915872, -0.5027176, 1, 0.3843137, 0, 1,
-1.449186, -0.6560681, -2.509722, 1, 0.3882353, 0, 1,
-1.443979, -0.8313312, -4.931725, 1, 0.3960784, 0, 1,
-1.432089, 1.417424, 0.1791615, 1, 0.4039216, 0, 1,
-1.428356, 0.3518887, -2.158012, 1, 0.4078431, 0, 1,
-1.425413, -0.1396206, -3.093323, 1, 0.4156863, 0, 1,
-1.40538, -0.02054388, -0.893739, 1, 0.4196078, 0, 1,
-1.403115, 0.749069, -1.171318, 1, 0.427451, 0, 1,
-1.402861, -0.2003524, -1.584793, 1, 0.4313726, 0, 1,
-1.395531, 0.749338, -0.5027829, 1, 0.4392157, 0, 1,
-1.393022, 0.8334005, -2.651228, 1, 0.4431373, 0, 1,
-1.39177, -1.037197, -2.88034, 1, 0.4509804, 0, 1,
-1.38746, 0.9616534, -0.6519977, 1, 0.454902, 0, 1,
-1.385536, -1.533394, -2.997325, 1, 0.4627451, 0, 1,
-1.379081, -0.374625, -0.9866234, 1, 0.4666667, 0, 1,
-1.377638, -0.06841456, -1.514181, 1, 0.4745098, 0, 1,
-1.375975, -0.6712039, -3.167041, 1, 0.4784314, 0, 1,
-1.370179, -0.3769956, -1.767459, 1, 0.4862745, 0, 1,
-1.365669, 0.3477369, -3.221457, 1, 0.4901961, 0, 1,
-1.359745, -1.589377, -2.947293, 1, 0.4980392, 0, 1,
-1.356327, -1.204491, -2.014116, 1, 0.5058824, 0, 1,
-1.353694, -2.527223, -3.13029, 1, 0.509804, 0, 1,
-1.353308, 0.01944102, -1.408747, 1, 0.5176471, 0, 1,
-1.350635, 0.7634118, -0.2976502, 1, 0.5215687, 0, 1,
-1.345398, 0.9644441, -1.067052, 1, 0.5294118, 0, 1,
-1.344636, -2.151963, -1.270548, 1, 0.5333334, 0, 1,
-1.33368, -0.5751668, -0.3836879, 1, 0.5411765, 0, 1,
-1.332487, -0.8325191, -2.586624, 1, 0.5450981, 0, 1,
-1.328196, 0.5177643, -2.667796, 1, 0.5529412, 0, 1,
-1.327587, -1.808323, -3.277859, 1, 0.5568628, 0, 1,
-1.323806, 2.011373, 0.2106686, 1, 0.5647059, 0, 1,
-1.323019, 0.3756158, -1.194332, 1, 0.5686275, 0, 1,
-1.306225, 0.4807482, -0.5914362, 1, 0.5764706, 0, 1,
-1.302854, -0.1878786, -3.568019, 1, 0.5803922, 0, 1,
-1.29489, -0.771486, -3.296544, 1, 0.5882353, 0, 1,
-1.289525, 0.3291629, -1.021758, 1, 0.5921569, 0, 1,
-1.287266, -0.1380529, -2.357282, 1, 0.6, 0, 1,
-1.286145, 0.1789275, 0.4905405, 1, 0.6078432, 0, 1,
-1.285785, -2.618098, -2.012922, 1, 0.6117647, 0, 1,
-1.2802, 0.6557234, -0.6301798, 1, 0.6196079, 0, 1,
-1.270694, 0.01486497, -1.810541, 1, 0.6235294, 0, 1,
-1.264229, -0.0255507, -0.8813843, 1, 0.6313726, 0, 1,
-1.24514, -0.365798, -1.76276, 1, 0.6352941, 0, 1,
-1.230339, -2.191795, -1.374718, 1, 0.6431373, 0, 1,
-1.226297, -0.5715384, -3.810706, 1, 0.6470588, 0, 1,
-1.211742, 1.192212, -2.819247, 1, 0.654902, 0, 1,
-1.205871, -0.7175243, -1.842549, 1, 0.6588235, 0, 1,
-1.205847, 2.808924, 0.1567721, 1, 0.6666667, 0, 1,
-1.203715, -0.2521164, -2.238926, 1, 0.6705883, 0, 1,
-1.199699, -1.649923, -1.584425, 1, 0.6784314, 0, 1,
-1.193627, -0.6726143, -4.840615, 1, 0.682353, 0, 1,
-1.183688, 0.1340006, -1.673023, 1, 0.6901961, 0, 1,
-1.183647, -1.793258, -2.866522, 1, 0.6941177, 0, 1,
-1.176031, -2.322665, -3.449821, 1, 0.7019608, 0, 1,
-1.175335, 0.5042568, -0.6031396, 1, 0.7098039, 0, 1,
-1.174385, 0.7026502, -1.261775, 1, 0.7137255, 0, 1,
-1.171333, 0.1629263, -1.205014, 1, 0.7215686, 0, 1,
-1.170263, 0.02042468, -2.205153, 1, 0.7254902, 0, 1,
-1.160292, -1.331874, -0.6329263, 1, 0.7333333, 0, 1,
-1.157544, -0.2147391, -3.248879, 1, 0.7372549, 0, 1,
-1.157416, -0.2435688, -3.222722, 1, 0.7450981, 0, 1,
-1.156193, 1.196577, 0.01689417, 1, 0.7490196, 0, 1,
-1.152725, -0.06227214, -1.723669, 1, 0.7568628, 0, 1,
-1.150141, -0.3986055, -1.700053, 1, 0.7607843, 0, 1,
-1.145009, 1.358392, -0.6877022, 1, 0.7686275, 0, 1,
-1.144803, 0.8774406, -3.124402, 1, 0.772549, 0, 1,
-1.131512, -0.5025755, -1.811797, 1, 0.7803922, 0, 1,
-1.130937, -0.398793, -0.9831027, 1, 0.7843137, 0, 1,
-1.129103, 0.3173853, -2.171677, 1, 0.7921569, 0, 1,
-1.127062, -1.10383, -0.6730946, 1, 0.7960784, 0, 1,
-1.124732, -0.01323667, 0.5481658, 1, 0.8039216, 0, 1,
-1.122169, 0.2122606, -3.371629, 1, 0.8117647, 0, 1,
-1.119343, -1.533381, -3.118283, 1, 0.8156863, 0, 1,
-1.117537, -1.421909, -2.622004, 1, 0.8235294, 0, 1,
-1.112481, -1.096945, -4.217408, 1, 0.827451, 0, 1,
-1.104268, 1.570869, -1.558438, 1, 0.8352941, 0, 1,
-1.102229, -0.6938835, -1.965934, 1, 0.8392157, 0, 1,
-1.101975, -1.317984, -1.696513, 1, 0.8470588, 0, 1,
-1.097828, -0.211637, -0.8631383, 1, 0.8509804, 0, 1,
-1.094688, 1.928523, -1.1651, 1, 0.8588235, 0, 1,
-1.076946, -1.177019, -3.363375, 1, 0.8627451, 0, 1,
-1.070358, 0.3348449, -1.463647, 1, 0.8705882, 0, 1,
-1.057695, -1.096645, -0.1303394, 1, 0.8745098, 0, 1,
-1.057667, 0.7395027, -2.147746, 1, 0.8823529, 0, 1,
-1.055784, -0.9228475, -2.262689, 1, 0.8862745, 0, 1,
-1.048175, -0.3033511, -1.249555, 1, 0.8941177, 0, 1,
-1.045993, 0.002172412, 0.7550626, 1, 0.8980392, 0, 1,
-1.03569, -0.07083204, -0.688939, 1, 0.9058824, 0, 1,
-1.031605, -0.818732, -3.67642, 1, 0.9137255, 0, 1,
-1.029265, -0.6472789, -0.7641785, 1, 0.9176471, 0, 1,
-1.018687, -0.7974896, -2.310951, 1, 0.9254902, 0, 1,
-1.014997, -0.8155726, -1.643748, 1, 0.9294118, 0, 1,
-1.002256, -0.5538078, -3.257162, 1, 0.9372549, 0, 1,
-0.9964053, -1.06152, -3.746631, 1, 0.9411765, 0, 1,
-0.9962709, 0.4447829, -0.6596968, 1, 0.9490196, 0, 1,
-0.992047, 1.135201, -2.271136, 1, 0.9529412, 0, 1,
-0.9877703, 0.01248422, -0.6695542, 1, 0.9607843, 0, 1,
-0.9860401, -0.5758731, -1.644879, 1, 0.9647059, 0, 1,
-0.9856659, 1.977654, -1.096356, 1, 0.972549, 0, 1,
-0.9851475, -0.563393, -0.9459633, 1, 0.9764706, 0, 1,
-0.9779882, 0.1017413, -0.1010724, 1, 0.9843137, 0, 1,
-0.9768591, 1.162441, -0.5051345, 1, 0.9882353, 0, 1,
-0.9741032, 0.5096338, -1.708179, 1, 0.9960784, 0, 1,
-0.9740094, -0.01822351, -3.11918, 0.9960784, 1, 0, 1,
-0.9670166, 1.230535, -0.5022245, 0.9921569, 1, 0, 1,
-0.9612839, 2.85139, 0.4893644, 0.9843137, 1, 0, 1,
-0.9584819, -0.5566934, -2.36568, 0.9803922, 1, 0, 1,
-0.9568428, 1.552764, -0.8501326, 0.972549, 1, 0, 1,
-0.9553338, 1.496725, 0.8783557, 0.9686275, 1, 0, 1,
-0.9478019, -2.279043, -1.01834, 0.9607843, 1, 0, 1,
-0.9469295, -1.329407, -2.435451, 0.9568627, 1, 0, 1,
-0.9454111, -0.05924118, -1.638245, 0.9490196, 1, 0, 1,
-0.9428077, 1.502228, -0.5000001, 0.945098, 1, 0, 1,
-0.9389759, -0.306693, -1.661384, 0.9372549, 1, 0, 1,
-0.9385484, 0.9372422, -0.4575063, 0.9333333, 1, 0, 1,
-0.9370817, -0.987471, -3.920506, 0.9254902, 1, 0, 1,
-0.9351643, 0.8046679, -2.278237, 0.9215686, 1, 0, 1,
-0.9339256, 1.288651, 0.1247071, 0.9137255, 1, 0, 1,
-0.9329543, -0.1460794, -2.123682, 0.9098039, 1, 0, 1,
-0.9323176, 0.8493052, -0.7910118, 0.9019608, 1, 0, 1,
-0.931603, -0.9390529, -3.448296, 0.8941177, 1, 0, 1,
-0.9278018, -0.4482593, -1.374959, 0.8901961, 1, 0, 1,
-0.9240876, 0.4687217, -1.108716, 0.8823529, 1, 0, 1,
-0.9180377, -1.077895, -1.633751, 0.8784314, 1, 0, 1,
-0.9170184, -1.523555, -3.744337, 0.8705882, 1, 0, 1,
-0.9147256, -0.6632606, -2.920708, 0.8666667, 1, 0, 1,
-0.9133397, -0.3328788, -2.04947, 0.8588235, 1, 0, 1,
-0.9125763, 0.8891018, -0.3802977, 0.854902, 1, 0, 1,
-0.9121811, 0.5499695, -0.793111, 0.8470588, 1, 0, 1,
-0.9037579, -0.1937478, -2.879817, 0.8431373, 1, 0, 1,
-0.8957884, 1.089482, 0.229784, 0.8352941, 1, 0, 1,
-0.8848427, -0.7025558, -1.083139, 0.8313726, 1, 0, 1,
-0.8799399, 0.6826131, -2.324996, 0.8235294, 1, 0, 1,
-0.8762944, -0.9229112, -1.672256, 0.8196079, 1, 0, 1,
-0.8717205, -1.994112, -1.512797, 0.8117647, 1, 0, 1,
-0.8644823, -1.867029, -4.855746, 0.8078431, 1, 0, 1,
-0.8597628, -0.3224441, -3.504068, 0.8, 1, 0, 1,
-0.8591995, 0.01078832, -1.475252, 0.7921569, 1, 0, 1,
-0.8552746, -1.145218, -3.665382, 0.7882353, 1, 0, 1,
-0.8490825, 0.7026482, -1.964471, 0.7803922, 1, 0, 1,
-0.8368867, 0.4061539, -1.185343, 0.7764706, 1, 0, 1,
-0.8318596, 1.82108, -0.1785835, 0.7686275, 1, 0, 1,
-0.8316539, 1.501945, -1.232402, 0.7647059, 1, 0, 1,
-0.8237361, 1.509364, -2.013785, 0.7568628, 1, 0, 1,
-0.8236563, -0.9420348, -3.288642, 0.7529412, 1, 0, 1,
-0.8202113, -1.875359, -2.222179, 0.7450981, 1, 0, 1,
-0.8200917, -1.366106, -1.831951, 0.7411765, 1, 0, 1,
-0.8142737, -0.4350148, -1.818563, 0.7333333, 1, 0, 1,
-0.8039787, 0.07100782, -3.074072, 0.7294118, 1, 0, 1,
-0.7955611, 1.645297, -0.8869999, 0.7215686, 1, 0, 1,
-0.7936904, 1.371275, -1.71607, 0.7176471, 1, 0, 1,
-0.7930579, 0.6130664, -0.4654223, 0.7098039, 1, 0, 1,
-0.7923375, 0.8245747, -0.8496888, 0.7058824, 1, 0, 1,
-0.7921808, -1.243214, -4.739929, 0.6980392, 1, 0, 1,
-0.7919087, -0.05705819, -2.226486, 0.6901961, 1, 0, 1,
-0.7912936, 0.3534125, -1.112051, 0.6862745, 1, 0, 1,
-0.7889016, -0.003828893, -2.035099, 0.6784314, 1, 0, 1,
-0.7844258, -1.371237, -3.787223, 0.6745098, 1, 0, 1,
-0.7831754, 1.368608, -2.245955, 0.6666667, 1, 0, 1,
-0.7805179, 0.8348433, 0.08681706, 0.6627451, 1, 0, 1,
-0.7733559, 0.705485, -0.7360055, 0.654902, 1, 0, 1,
-0.7692995, 1.761433, 0.7795315, 0.6509804, 1, 0, 1,
-0.7632736, -1.563935, -5.176201, 0.6431373, 1, 0, 1,
-0.7615407, 1.810411, 0.06414889, 0.6392157, 1, 0, 1,
-0.7571124, 1.229528, 0.8850752, 0.6313726, 1, 0, 1,
-0.7494305, 1.116084, 0.515451, 0.627451, 1, 0, 1,
-0.7486967, -1.115181, -1.983023, 0.6196079, 1, 0, 1,
-0.7485373, 0.9206861, -1.953537, 0.6156863, 1, 0, 1,
-0.7470502, -0.01086161, -2.79741, 0.6078432, 1, 0, 1,
-0.7467614, -0.08206042, -2.177604, 0.6039216, 1, 0, 1,
-0.7433167, -0.7466383, -1.868805, 0.5960785, 1, 0, 1,
-0.7372673, 0.6057968, -0.2557743, 0.5882353, 1, 0, 1,
-0.71825, 0.3208816, -1.115423, 0.5843138, 1, 0, 1,
-0.7155385, -1.254959, -3.349684, 0.5764706, 1, 0, 1,
-0.7117689, -0.4376273, -3.607597, 0.572549, 1, 0, 1,
-0.6995417, -0.6087888, -2.509167, 0.5647059, 1, 0, 1,
-0.6991807, 0.9275945, -2.359435, 0.5607843, 1, 0, 1,
-0.6968251, 1.016247, 0.9327438, 0.5529412, 1, 0, 1,
-0.6958805, -1.542622, -1.753309, 0.5490196, 1, 0, 1,
-0.6946048, 0.3745488, -2.009655, 0.5411765, 1, 0, 1,
-0.6833407, 0.01572301, -3.048969, 0.5372549, 1, 0, 1,
-0.6802474, -1.25743, -3.217589, 0.5294118, 1, 0, 1,
-0.679094, 0.7898842, -2.665113, 0.5254902, 1, 0, 1,
-0.6780329, -0.9111085, -2.268149, 0.5176471, 1, 0, 1,
-0.6780028, -1.444265, -1.858797, 0.5137255, 1, 0, 1,
-0.6753398, -0.5433082, -3.243604, 0.5058824, 1, 0, 1,
-0.6751329, -1.059906, -2.614611, 0.5019608, 1, 0, 1,
-0.6720644, -0.0513782, -0.0493251, 0.4941176, 1, 0, 1,
-0.6714369, -1.209459, -2.310369, 0.4862745, 1, 0, 1,
-0.669726, 0.05814886, -1.570379, 0.4823529, 1, 0, 1,
-0.6608913, -0.2233415, -3.996496, 0.4745098, 1, 0, 1,
-0.6572384, 0.6671874, -0.01870005, 0.4705882, 1, 0, 1,
-0.6510118, -0.9807541, -3.686477, 0.4627451, 1, 0, 1,
-0.6470979, 0.3359139, -2.11041, 0.4588235, 1, 0, 1,
-0.6402329, 0.5147677, -0.1778627, 0.4509804, 1, 0, 1,
-0.6329649, -0.4125808, -3.12835, 0.4470588, 1, 0, 1,
-0.6327521, 0.8493862, -1.019914, 0.4392157, 1, 0, 1,
-0.6323175, 0.3105204, -0.2178138, 0.4352941, 1, 0, 1,
-0.6320671, 1.517959, -1.622267, 0.427451, 1, 0, 1,
-0.6319511, -0.7787083, -0.3553301, 0.4235294, 1, 0, 1,
-0.6317313, 0.8927619, -1.356367, 0.4156863, 1, 0, 1,
-0.6287075, -1.904342, -4.306699, 0.4117647, 1, 0, 1,
-0.6266738, 0.1766821, 0.401357, 0.4039216, 1, 0, 1,
-0.6249524, -0.4067443, -3.39908, 0.3960784, 1, 0, 1,
-0.6195647, -0.1680097, -2.776202, 0.3921569, 1, 0, 1,
-0.6186991, 0.565699, -3.451574, 0.3843137, 1, 0, 1,
-0.6177196, 0.2807481, -1.180696, 0.3803922, 1, 0, 1,
-0.6173208, 0.2191279, -0.8895276, 0.372549, 1, 0, 1,
-0.6148204, 1.266829, -0.6198807, 0.3686275, 1, 0, 1,
-0.6124512, -1.08263, -4.073797, 0.3607843, 1, 0, 1,
-0.6115387, 1.91675, 1.14975, 0.3568628, 1, 0, 1,
-0.6085232, -1.209959, -1.864133, 0.3490196, 1, 0, 1,
-0.6063751, 0.6709099, 0.2121205, 0.345098, 1, 0, 1,
-0.6061703, -0.4332934, -2.54581, 0.3372549, 1, 0, 1,
-0.6016831, -0.9920875, -1.756574, 0.3333333, 1, 0, 1,
-0.5999904, -0.9231874, -2.012906, 0.3254902, 1, 0, 1,
-0.5921298, 1.159203, -1.286219, 0.3215686, 1, 0, 1,
-0.5914306, 1.118278, -0.4446031, 0.3137255, 1, 0, 1,
-0.5910127, 0.696646, -0.5605529, 0.3098039, 1, 0, 1,
-0.5898394, -2.060037, -3.977103, 0.3019608, 1, 0, 1,
-0.5882856, -1.733955, -4.458387, 0.2941177, 1, 0, 1,
-0.5878502, 2.665554, -1.39536, 0.2901961, 1, 0, 1,
-0.5786425, 0.1984372, -1.599794, 0.282353, 1, 0, 1,
-0.5684789, -0.7796761, -2.667177, 0.2784314, 1, 0, 1,
-0.5644397, 0.2114323, -2.966816, 0.2705882, 1, 0, 1,
-0.5625788, -0.08380631, -2.439442, 0.2666667, 1, 0, 1,
-0.5607911, -1.135613, -2.344169, 0.2588235, 1, 0, 1,
-0.55432, -0.03236632, -1.111334, 0.254902, 1, 0, 1,
-0.5516098, -0.674194, -3.477165, 0.2470588, 1, 0, 1,
-0.5485234, -0.6150089, -4.235245, 0.2431373, 1, 0, 1,
-0.5402962, -0.929233, -1.648819, 0.2352941, 1, 0, 1,
-0.5379294, -0.9188738, -3.786625, 0.2313726, 1, 0, 1,
-0.5364501, 0.3793822, -1.479799, 0.2235294, 1, 0, 1,
-0.5348707, -1.741262, -2.264055, 0.2196078, 1, 0, 1,
-0.527637, -0.580368, -0.6859639, 0.2117647, 1, 0, 1,
-0.5244938, -1.180234, -3.435904, 0.2078431, 1, 0, 1,
-0.5242846, 0.3433627, -0.9706959, 0.2, 1, 0, 1,
-0.5242005, -1.452098, -2.945045, 0.1921569, 1, 0, 1,
-0.5233949, 3.610307, 0.5166901, 0.1882353, 1, 0, 1,
-0.5203133, 1.401164, 0.8344777, 0.1803922, 1, 0, 1,
-0.5189159, 0.8198532, -0.5842704, 0.1764706, 1, 0, 1,
-0.5182354, -0.02626057, -0.380946, 0.1686275, 1, 0, 1,
-0.5153587, -0.2448787, -2.354667, 0.1647059, 1, 0, 1,
-0.5144498, -0.2329124, -1.441736, 0.1568628, 1, 0, 1,
-0.5101927, 0.06776056, -2.266632, 0.1529412, 1, 0, 1,
-0.5100021, 0.4691974, -1.612156, 0.145098, 1, 0, 1,
-0.50984, -1.474697, -3.721853, 0.1411765, 1, 0, 1,
-0.5093168, 0.1494646, -1.093998, 0.1333333, 1, 0, 1,
-0.508286, 0.1602811, -1.197046, 0.1294118, 1, 0, 1,
-0.5067345, 1.331972, -1.321207, 0.1215686, 1, 0, 1,
-0.5061916, 0.6822727, -0.6068913, 0.1176471, 1, 0, 1,
-0.4994031, -0.9765676, -2.505671, 0.1098039, 1, 0, 1,
-0.4989044, 1.051146, -1.298331, 0.1058824, 1, 0, 1,
-0.4968405, 0.9337605, -0.7688279, 0.09803922, 1, 0, 1,
-0.4967175, 0.04732428, 0.1491493, 0.09019608, 1, 0, 1,
-0.4958149, 0.1133519, -3.219858, 0.08627451, 1, 0, 1,
-0.4946006, -0.8051853, -2.796974, 0.07843138, 1, 0, 1,
-0.4912255, -0.9513399, -3.600534, 0.07450981, 1, 0, 1,
-0.4891311, 1.007277, 0.439758, 0.06666667, 1, 0, 1,
-0.4864911, -0.006863248, -1.039906, 0.0627451, 1, 0, 1,
-0.4807967, 0.4893846, -1.454365, 0.05490196, 1, 0, 1,
-0.4766109, 0.7717965, -1.428112, 0.05098039, 1, 0, 1,
-0.4706145, -0.4364577, -3.12185, 0.04313726, 1, 0, 1,
-0.4698173, -0.7147393, -1.790475, 0.03921569, 1, 0, 1,
-0.4662504, 1.161307, -1.096795, 0.03137255, 1, 0, 1,
-0.465741, -0.1882689, -1.656348, 0.02745098, 1, 0, 1,
-0.4656887, 1.528799, -1.955425, 0.01960784, 1, 0, 1,
-0.4604652, 0.9922274, -0.3788512, 0.01568628, 1, 0, 1,
-0.4579854, -0.09194279, -1.963394, 0.007843138, 1, 0, 1,
-0.4573404, 0.2304571, -1.30597, 0.003921569, 1, 0, 1,
-0.4544994, -0.7219906, -1.966271, 0, 1, 0.003921569, 1,
-0.4543747, -0.9147022, -3.798714, 0, 1, 0.01176471, 1,
-0.4499991, -1.437638, -2.954332, 0, 1, 0.01568628, 1,
-0.4495828, 0.3719085, -0.6956453, 0, 1, 0.02352941, 1,
-0.4477699, -1.026295, -2.883886, 0, 1, 0.02745098, 1,
-0.4448198, 0.5326287, 0.3663908, 0, 1, 0.03529412, 1,
-0.4303387, -0.5422418, -2.158402, 0, 1, 0.03921569, 1,
-0.4264291, -0.9812314, -4.503638, 0, 1, 0.04705882, 1,
-0.4238687, -0.9506159, -2.31738, 0, 1, 0.05098039, 1,
-0.4175425, -2.696562, -3.069619, 0, 1, 0.05882353, 1,
-0.4124661, 0.8605793, 0.7573774, 0, 1, 0.0627451, 1,
-0.4097266, -0.2761985, -2.952367, 0, 1, 0.07058824, 1,
-0.4080041, 0.1983295, -2.391951, 0, 1, 0.07450981, 1,
-0.4052511, -2.032466, -2.065356, 0, 1, 0.08235294, 1,
-0.4018516, 0.5684159, 0.7685159, 0, 1, 0.08627451, 1,
-0.4018026, -0.8871446, -3.406887, 0, 1, 0.09411765, 1,
-0.4013168, 0.4234501, -1.473982, 0, 1, 0.1019608, 1,
-0.3997366, 0.5580406, -2.400623, 0, 1, 0.1058824, 1,
-0.396217, -0.4717467, -3.885223, 0, 1, 0.1137255, 1,
-0.3933581, 0.2726551, -0.2807904, 0, 1, 0.1176471, 1,
-0.3881113, 0.4202888, -2.059712, 0, 1, 0.1254902, 1,
-0.3823627, 0.8112459, -2.577622, 0, 1, 0.1294118, 1,
-0.3778509, 0.5515241, 0.3485667, 0, 1, 0.1372549, 1,
-0.3775916, -0.4776786, -1.372606, 0, 1, 0.1411765, 1,
-0.3737819, -0.7808335, -5.937973, 0, 1, 0.1490196, 1,
-0.3731497, -0.6394367, -4.310348, 0, 1, 0.1529412, 1,
-0.3659077, -0.00438162, -2.609602, 0, 1, 0.1607843, 1,
-0.3622669, 0.1808244, 0.01960741, 0, 1, 0.1647059, 1,
-0.3602046, -0.07649124, -1.617845, 0, 1, 0.172549, 1,
-0.360153, 0.1692957, -0.5101243, 0, 1, 0.1764706, 1,
-0.359505, 1.670125, -1.089095, 0, 1, 0.1843137, 1,
-0.3593002, 0.2094128, -1.45036, 0, 1, 0.1882353, 1,
-0.3567019, 0.1409883, -0.2383595, 0, 1, 0.1960784, 1,
-0.355588, -0.02452236, -2.201226, 0, 1, 0.2039216, 1,
-0.3527763, 0.3783391, -1.188914, 0, 1, 0.2078431, 1,
-0.3452503, -0.8530456, -3.081672, 0, 1, 0.2156863, 1,
-0.3437957, 0.1235861, -0.7524714, 0, 1, 0.2196078, 1,
-0.3428628, -1.099092, -0.8109156, 0, 1, 0.227451, 1,
-0.3425285, -0.1453456, -2.986806, 0, 1, 0.2313726, 1,
-0.3416384, -0.4508221, -0.6874678, 0, 1, 0.2392157, 1,
-0.3398842, -0.4018307, -2.776805, 0, 1, 0.2431373, 1,
-0.3390822, -0.2974398, -1.946265, 0, 1, 0.2509804, 1,
-0.3390547, -0.5965173, 0.1946173, 0, 1, 0.254902, 1,
-0.3389208, -1.876771, -2.313512, 0, 1, 0.2627451, 1,
-0.3332886, 0.7425273, -0.778377, 0, 1, 0.2666667, 1,
-0.332204, 1.042584, -0.6630489, 0, 1, 0.2745098, 1,
-0.3321819, -0.07447314, -0.9558216, 0, 1, 0.2784314, 1,
-0.3304266, 0.6615224, -0.5567786, 0, 1, 0.2862745, 1,
-0.3280642, -0.06042526, -2.406088, 0, 1, 0.2901961, 1,
-0.3276617, 1.709531, 0.2355008, 0, 1, 0.2980392, 1,
-0.3256655, 0.8839809, -1.390228, 0, 1, 0.3058824, 1,
-0.3246572, 0.6786775, -2.083764, 0, 1, 0.3098039, 1,
-0.3213233, -0.9314023, -2.863289, 0, 1, 0.3176471, 1,
-0.321229, 0.08760865, -1.380209, 0, 1, 0.3215686, 1,
-0.3195376, 0.3690917, 0.7924126, 0, 1, 0.3294118, 1,
-0.3175128, -1.307216, -2.991388, 0, 1, 0.3333333, 1,
-0.3162453, -1.227392, -3.482014, 0, 1, 0.3411765, 1,
-0.3117153, 0.6769152, -0.6914822, 0, 1, 0.345098, 1,
-0.3102472, -0.9184331, -2.854913, 0, 1, 0.3529412, 1,
-0.3098522, 1.795355, -0.6124044, 0, 1, 0.3568628, 1,
-0.307828, 1.719097, 0.1342794, 0, 1, 0.3647059, 1,
-0.3032785, 0.1961095, -0.634468, 0, 1, 0.3686275, 1,
-0.3015098, -1.861398, -3.566251, 0, 1, 0.3764706, 1,
-0.2960248, 1.664765, 0.3575918, 0, 1, 0.3803922, 1,
-0.2906982, -0.7225925, -2.588315, 0, 1, 0.3882353, 1,
-0.2896299, 1.507973, -0.6670726, 0, 1, 0.3921569, 1,
-0.289551, -0.2870989, -2.237988, 0, 1, 0.4, 1,
-0.2886544, 1.749596, -0.5631365, 0, 1, 0.4078431, 1,
-0.2873334, 0.6221728, -0.2908674, 0, 1, 0.4117647, 1,
-0.2833942, 0.5868847, -0.07350842, 0, 1, 0.4196078, 1,
-0.2816283, -0.9974675, -4.077878, 0, 1, 0.4235294, 1,
-0.2809125, -1.052005, -1.907631, 0, 1, 0.4313726, 1,
-0.27824, -0.2910293, 0.4183798, 0, 1, 0.4352941, 1,
-0.2721615, 0.5560942, -0.09962198, 0, 1, 0.4431373, 1,
-0.271222, 0.3436123, -0.3647174, 0, 1, 0.4470588, 1,
-0.2709878, -0.9879038, -3.145319, 0, 1, 0.454902, 1,
-0.2704808, 0.6637175, -0.3956438, 0, 1, 0.4588235, 1,
-0.2696174, 0.5098306, -0.5977011, 0, 1, 0.4666667, 1,
-0.2688438, -0.5447904, -3.070405, 0, 1, 0.4705882, 1,
-0.2644176, -1.388386, -2.698775, 0, 1, 0.4784314, 1,
-0.2630434, -0.6322482, -2.442873, 0, 1, 0.4823529, 1,
-0.262892, -0.9725207, -1.694551, 0, 1, 0.4901961, 1,
-0.2610494, 1.710031, -1.515438, 0, 1, 0.4941176, 1,
-0.2610244, -0.1729945, -1.616585, 0, 1, 0.5019608, 1,
-0.2604431, -0.1988893, -1.070014, 0, 1, 0.509804, 1,
-0.2582899, -0.3783188, -0.861016, 0, 1, 0.5137255, 1,
-0.2502051, 0.2421581, -1.667196, 0, 1, 0.5215687, 1,
-0.2454042, 1.038544, -0.6528375, 0, 1, 0.5254902, 1,
-0.2451352, 0.05253237, -1.057145, 0, 1, 0.5333334, 1,
-0.2403199, -0.6992559, -3.851626, 0, 1, 0.5372549, 1,
-0.2321865, -1.502542, -2.534414, 0, 1, 0.5450981, 1,
-0.2303529, -0.988869, -3.522011, 0, 1, 0.5490196, 1,
-0.2250687, 0.9354745, 1.328823, 0, 1, 0.5568628, 1,
-0.223844, 1.583431, -0.256133, 0, 1, 0.5607843, 1,
-0.2227893, -0.7903668, -4.290332, 0, 1, 0.5686275, 1,
-0.2210876, -0.4986332, -3.856263, 0, 1, 0.572549, 1,
-0.2189732, -0.04417643, -4.420703, 0, 1, 0.5803922, 1,
-0.2189341, -2.721734, -2.763124, 0, 1, 0.5843138, 1,
-0.2166484, -0.4624602, -1.823782, 0, 1, 0.5921569, 1,
-0.2165934, 0.772786, -0.09086576, 0, 1, 0.5960785, 1,
-0.2126325, -0.08742384, -2.841489, 0, 1, 0.6039216, 1,
-0.2121115, -0.03148167, -0.6479962, 0, 1, 0.6117647, 1,
-0.2108276, 1.202632, -0.2399042, 0, 1, 0.6156863, 1,
-0.2100251, -0.5476984, -3.189641, 0, 1, 0.6235294, 1,
-0.2062032, 1.672037, -0.4445982, 0, 1, 0.627451, 1,
-0.1916898, -0.4610619, -2.811286, 0, 1, 0.6352941, 1,
-0.1911253, -0.4099424, -5.091786, 0, 1, 0.6392157, 1,
-0.1901518, -0.659793, -2.101844, 0, 1, 0.6470588, 1,
-0.1876192, 0.482351, 0.8914499, 0, 1, 0.6509804, 1,
-0.1863757, 1.030746, -0.7975949, 0, 1, 0.6588235, 1,
-0.1800392, 0.04799137, 0.3627927, 0, 1, 0.6627451, 1,
-0.1722429, 0.1863167, -0.6155891, 0, 1, 0.6705883, 1,
-0.1719369, 0.113039, -1.107304, 0, 1, 0.6745098, 1,
-0.1716548, 0.6644511, -0.4836908, 0, 1, 0.682353, 1,
-0.1678321, -0.6848449, -4.698146, 0, 1, 0.6862745, 1,
-0.1617743, 0.7867749, -0.9964516, 0, 1, 0.6941177, 1,
-0.1550103, 2.023767, -0.6231533, 0, 1, 0.7019608, 1,
-0.1512537, 0.9533373, 0.5751991, 0, 1, 0.7058824, 1,
-0.1512121, 0.1699503, -1.232949, 0, 1, 0.7137255, 1,
-0.1444044, 0.06328037, -1.750499, 0, 1, 0.7176471, 1,
-0.143842, -2.609592, -2.391998, 0, 1, 0.7254902, 1,
-0.1418723, 0.4805614, -0.3031397, 0, 1, 0.7294118, 1,
-0.1396596, 0.6240425, -1.08431, 0, 1, 0.7372549, 1,
-0.1371288, 1.219455, 0.3840925, 0, 1, 0.7411765, 1,
-0.1297811, 1.368493, 0.3519743, 0, 1, 0.7490196, 1,
-0.1253113, 0.7580182, 0.2573197, 0, 1, 0.7529412, 1,
-0.1240875, 0.5513571, -0.2283616, 0, 1, 0.7607843, 1,
-0.1231498, 0.3479892, -0.7586859, 0, 1, 0.7647059, 1,
-0.1217282, -0.7885312, -2.310595, 0, 1, 0.772549, 1,
-0.1215151, -0.1172837, -0.3718032, 0, 1, 0.7764706, 1,
-0.118993, 0.8167379, 0.8163046, 0, 1, 0.7843137, 1,
-0.117803, -0.3259686, -2.488265, 0, 1, 0.7882353, 1,
-0.1153145, 1.730064, 1.094494, 0, 1, 0.7960784, 1,
-0.1102231, -0.973672, -2.852974, 0, 1, 0.8039216, 1,
-0.1101799, -0.06775898, -3.798536, 0, 1, 0.8078431, 1,
-0.109001, -0.6546695, -2.936833, 0, 1, 0.8156863, 1,
-0.1062571, -0.310843, -2.089092, 0, 1, 0.8196079, 1,
-0.1032859, 0.04968558, -2.270094, 0, 1, 0.827451, 1,
-0.09745199, -0.2769656, -2.15062, 0, 1, 0.8313726, 1,
-0.09701937, 0.6634663, -1.301245, 0, 1, 0.8392157, 1,
-0.09341314, -0.4188474, -2.088502, 0, 1, 0.8431373, 1,
-0.08886053, -1.218092, -3.136337, 0, 1, 0.8509804, 1,
-0.08826753, 0.7360404, -1.686718, 0, 1, 0.854902, 1,
-0.08721726, 1.024258, -1.154415, 0, 1, 0.8627451, 1,
-0.08705906, -0.2131243, -1.998765, 0, 1, 0.8666667, 1,
-0.08492058, -0.3565334, -2.747616, 0, 1, 0.8745098, 1,
-0.08160619, 0.8523017, 0.5469347, 0, 1, 0.8784314, 1,
-0.08091525, -0.1854414, -3.564671, 0, 1, 0.8862745, 1,
-0.08065274, 0.975114, -0.3834656, 0, 1, 0.8901961, 1,
-0.07367605, -0.8040391, -3.087392, 0, 1, 0.8980392, 1,
-0.06931088, -0.6704404, -3.13317, 0, 1, 0.9058824, 1,
-0.06784186, 0.2383257, -0.08710871, 0, 1, 0.9098039, 1,
-0.0611579, 1.422132, 0.05362321, 0, 1, 0.9176471, 1,
-0.05784075, 0.9221966, 0.4679263, 0, 1, 0.9215686, 1,
-0.05738509, -2.03735, -3.676275, 0, 1, 0.9294118, 1,
-0.05422602, -0.431347, -2.204415, 0, 1, 0.9333333, 1,
-0.05112743, 0.9765031, -0.7436068, 0, 1, 0.9411765, 1,
-0.04975897, 1.14852, -0.07814919, 0, 1, 0.945098, 1,
-0.0472633, -0.1340279, -3.769485, 0, 1, 0.9529412, 1,
-0.04325727, -0.4663, -3.467237, 0, 1, 0.9568627, 1,
-0.03814266, -0.5453459, -3.108537, 0, 1, 0.9647059, 1,
-0.03641613, 0.4087167, 1.611499, 0, 1, 0.9686275, 1,
-0.03576934, -0.6600665, -2.230972, 0, 1, 0.9764706, 1,
-0.03559158, 0.1264142, -0.9712707, 0, 1, 0.9803922, 1,
-0.03360958, 0.51593, -1.723486, 0, 1, 0.9882353, 1,
-0.0201381, 0.06531008, -0.1217525, 0, 1, 0.9921569, 1,
-0.01857474, 0.1933863, 1.681833, 0, 1, 1, 1,
-0.01846798, -1.088184, -3.214059, 0, 0.9921569, 1, 1,
-0.01430238, 1.27932, -0.9564809, 0, 0.9882353, 1, 1,
-0.01252487, -1.162986, -3.914217, 0, 0.9803922, 1, 1,
-0.003753519, 0.09169932, -1.027145, 0, 0.9764706, 1, 1,
-0.00242325, 1.413987, 0.413018, 0, 0.9686275, 1, 1,
0.00447024, -1.126345, 4.539994, 0, 0.9647059, 1, 1,
0.005082923, 0.4110948, -0.472522, 0, 0.9568627, 1, 1,
0.006993342, -0.4137225, 4.571345, 0, 0.9529412, 1, 1,
0.01095107, -0.7334784, 2.279901, 0, 0.945098, 1, 1,
0.01168771, 0.4121153, -0.909949, 0, 0.9411765, 1, 1,
0.0129575, 1.683638, -1.71279, 0, 0.9333333, 1, 1,
0.01595227, 0.3268419, 0.4677427, 0, 0.9294118, 1, 1,
0.02011017, -0.7985891, 2.581492, 0, 0.9215686, 1, 1,
0.02294884, -0.05919549, 1.42289, 0, 0.9176471, 1, 1,
0.02351072, 0.6321842, 0.5113448, 0, 0.9098039, 1, 1,
0.02420193, -0.4016191, 3.224207, 0, 0.9058824, 1, 1,
0.02466579, 0.3091274, -0.04878832, 0, 0.8980392, 1, 1,
0.02597558, 0.07989726, -1.076427, 0, 0.8901961, 1, 1,
0.02842517, 0.6058681, 0.2972685, 0, 0.8862745, 1, 1,
0.03209716, 2.858513, -0.03150935, 0, 0.8784314, 1, 1,
0.03417968, -1.765921, 4.033615, 0, 0.8745098, 1, 1,
0.03499589, 0.2846562, -1.523336, 0, 0.8666667, 1, 1,
0.03748102, 1.32857, -0.3407214, 0, 0.8627451, 1, 1,
0.04083091, -1.029356, 3.120124, 0, 0.854902, 1, 1,
0.04483825, 1.048328, 0.1073222, 0, 0.8509804, 1, 1,
0.05133196, -1.918413, 4.408239, 0, 0.8431373, 1, 1,
0.0531729, 0.5553356, 0.6181526, 0, 0.8392157, 1, 1,
0.05481648, 0.6505183, -1.216828, 0, 0.8313726, 1, 1,
0.05603004, 0.06592205, 1.539657, 0, 0.827451, 1, 1,
0.06186113, 0.03579009, 1.802496, 0, 0.8196079, 1, 1,
0.06272434, 0.5833141, 1.239299, 0, 0.8156863, 1, 1,
0.06441857, 1.437244, -0.1087216, 0, 0.8078431, 1, 1,
0.0689931, 1.225019, -1.050531, 0, 0.8039216, 1, 1,
0.07857897, 1.741385, 0.08058213, 0, 0.7960784, 1, 1,
0.07904206, 0.5528976, -0.777807, 0, 0.7882353, 1, 1,
0.08093812, 0.7955913, -2.9058, 0, 0.7843137, 1, 1,
0.08701405, -0.1043926, 3.618474, 0, 0.7764706, 1, 1,
0.08978957, -0.2216002, 2.549733, 0, 0.772549, 1, 1,
0.09005039, 0.04348672, 0.1009341, 0, 0.7647059, 1, 1,
0.09763103, -0.9862577, 2.69551, 0, 0.7607843, 1, 1,
0.09776767, 0.1232857, 0.3233784, 0, 0.7529412, 1, 1,
0.1006855, 0.6912683, 1.041414, 0, 0.7490196, 1, 1,
0.1010697, -0.2743522, 3.01217, 0, 0.7411765, 1, 1,
0.1077432, -0.1098398, 1.694927, 0, 0.7372549, 1, 1,
0.1099877, -0.902434, 2.054169, 0, 0.7294118, 1, 1,
0.1102628, -0.566265, 2.205835, 0, 0.7254902, 1, 1,
0.1120551, 2.192576, 0.5416327, 0, 0.7176471, 1, 1,
0.1128779, -1.262613, 2.888258, 0, 0.7137255, 1, 1,
0.1164681, -0.1501684, 0.3160397, 0, 0.7058824, 1, 1,
0.1207171, -0.8199022, 2.042221, 0, 0.6980392, 1, 1,
0.124258, -0.7226579, 3.862118, 0, 0.6941177, 1, 1,
0.1397518, -0.3313478, 3.707968, 0, 0.6862745, 1, 1,
0.1399958, -0.1039768, 1.348381, 0, 0.682353, 1, 1,
0.1406951, -0.5979803, 3.61322, 0, 0.6745098, 1, 1,
0.1469002, 1.285, -1.909366, 0, 0.6705883, 1, 1,
0.147738, 1.02911, 1.255789, 0, 0.6627451, 1, 1,
0.1484579, -0.7609205, 2.336592, 0, 0.6588235, 1, 1,
0.150999, -0.5883179, 3.805504, 0, 0.6509804, 1, 1,
0.156058, 0.1653333, 1.29492, 0, 0.6470588, 1, 1,
0.165508, -0.3664609, 4.72058, 0, 0.6392157, 1, 1,
0.1656462, -0.2564104, 1.464483, 0, 0.6352941, 1, 1,
0.1658141, 0.2129194, 1.483208, 0, 0.627451, 1, 1,
0.1687892, -1.664538, 2.534107, 0, 0.6235294, 1, 1,
0.1696713, -0.3789602, 2.90192, 0, 0.6156863, 1, 1,
0.1699795, 0.6966478, -0.4589126, 0, 0.6117647, 1, 1,
0.1701911, 1.204293, 1.192802, 0, 0.6039216, 1, 1,
0.1712918, -0.3403202, 1.976545, 0, 0.5960785, 1, 1,
0.171315, 0.1360254, 0.8548512, 0, 0.5921569, 1, 1,
0.171938, 0.312306, 0.8072059, 0, 0.5843138, 1, 1,
0.175487, 1.188577, -0.4837298, 0, 0.5803922, 1, 1,
0.17772, 0.2895139, 0.6841968, 0, 0.572549, 1, 1,
0.1779888, -0.2596968, 1.108124, 0, 0.5686275, 1, 1,
0.1780661, 0.4599029, 0.5860819, 0, 0.5607843, 1, 1,
0.1790104, 0.175839, 0.9238262, 0, 0.5568628, 1, 1,
0.17943, 0.09039871, 1.602307, 0, 0.5490196, 1, 1,
0.1844385, -0.608312, 2.13913, 0, 0.5450981, 1, 1,
0.1898394, 1.011564, 1.737216, 0, 0.5372549, 1, 1,
0.1995657, -0.6056393, 4.93562, 0, 0.5333334, 1, 1,
0.2102091, 0.1683586, 1.80992, 0, 0.5254902, 1, 1,
0.2181281, 1.200879, 1.250525, 0, 0.5215687, 1, 1,
0.225625, -0.2433302, 2.376712, 0, 0.5137255, 1, 1,
0.2280157, -0.7270115, 3.975507, 0, 0.509804, 1, 1,
0.236959, -2.209029, 3.848462, 0, 0.5019608, 1, 1,
0.2371264, -1.396813, 5.631475, 0, 0.4941176, 1, 1,
0.2379415, 0.4703655, 0.7004027, 0, 0.4901961, 1, 1,
0.2391056, -0.7779417, 3.105724, 0, 0.4823529, 1, 1,
0.2391266, -0.9450004, 3.262239, 0, 0.4784314, 1, 1,
0.2406617, 0.3677296, 1.108552, 0, 0.4705882, 1, 1,
0.2448589, 0.9577861, 0.1912871, 0, 0.4666667, 1, 1,
0.2462918, -0.3734646, 1.490757, 0, 0.4588235, 1, 1,
0.246342, -1.39952, 2.218934, 0, 0.454902, 1, 1,
0.247587, 1.754016, -1.310039, 0, 0.4470588, 1, 1,
0.2487229, 1.146595, -0.2562495, 0, 0.4431373, 1, 1,
0.2496566, -0.1583517, 2.7095, 0, 0.4352941, 1, 1,
0.2528737, -0.288125, 1.539259, 0, 0.4313726, 1, 1,
0.2572651, 0.7278813, 1.136359, 0, 0.4235294, 1, 1,
0.2583189, -1.5454, 3.410594, 0, 0.4196078, 1, 1,
0.2599064, -0.9548442, 0.4556473, 0, 0.4117647, 1, 1,
0.2622761, -0.6010522, 1.548523, 0, 0.4078431, 1, 1,
0.2654233, 0.6951452, 0.7358673, 0, 0.4, 1, 1,
0.2682003, -0.1703157, 1.260544, 0, 0.3921569, 1, 1,
0.2701481, -0.01615309, 0.598572, 0, 0.3882353, 1, 1,
0.2721977, -1.09661, 1.287808, 0, 0.3803922, 1, 1,
0.2746706, -0.3573983, 0.6976315, 0, 0.3764706, 1, 1,
0.2775603, -0.003894933, -0.4922322, 0, 0.3686275, 1, 1,
0.278271, 0.932773, 0.8195322, 0, 0.3647059, 1, 1,
0.2799278, -0.2099698, 2.674733, 0, 0.3568628, 1, 1,
0.2826305, 0.2161814, 2.587691, 0, 0.3529412, 1, 1,
0.2858656, -0.8254068, 2.815026, 0, 0.345098, 1, 1,
0.2894858, -0.533924, 2.625933, 0, 0.3411765, 1, 1,
0.2924388, -0.5059946, 1.908888, 0, 0.3333333, 1, 1,
0.2947457, -0.08233852, 5.089348, 0, 0.3294118, 1, 1,
0.2948178, 0.9182017, -0.2527389, 0, 0.3215686, 1, 1,
0.3000873, 0.6177443, 0.2982293, 0, 0.3176471, 1, 1,
0.3028096, -0.2419984, 2.721909, 0, 0.3098039, 1, 1,
0.3084663, -0.4904653, 3.908514, 0, 0.3058824, 1, 1,
0.3086887, 1.140238, 0.2745875, 0, 0.2980392, 1, 1,
0.3108103, 1.512817, -0.507979, 0, 0.2901961, 1, 1,
0.3158238, 0.5261074, 1.693625, 0, 0.2862745, 1, 1,
0.3163762, -1.287379, 2.391045, 0, 0.2784314, 1, 1,
0.3168031, -0.4813333, 2.438725, 0, 0.2745098, 1, 1,
0.317477, -1.385932, 3.111029, 0, 0.2666667, 1, 1,
0.3175119, 0.9520839, 0.8351786, 0, 0.2627451, 1, 1,
0.3238165, 1.378318, 0.1026689, 0, 0.254902, 1, 1,
0.3239429, -0.08102375, 0.9470933, 0, 0.2509804, 1, 1,
0.3248086, -1.04096, 3.343338, 0, 0.2431373, 1, 1,
0.3276216, -0.1406161, 1.135551, 0, 0.2392157, 1, 1,
0.3281894, -1.235424, 3.023962, 0, 0.2313726, 1, 1,
0.328238, -0.2369246, 0.9171916, 0, 0.227451, 1, 1,
0.3284423, 0.4820142, 0.5814852, 0, 0.2196078, 1, 1,
0.3353912, -1.130794, 1.835398, 0, 0.2156863, 1, 1,
0.3381972, -0.7435549, 2.941631, 0, 0.2078431, 1, 1,
0.3392006, -1.431196, 3.059919, 0, 0.2039216, 1, 1,
0.3401607, 1.143898, -1.896415, 0, 0.1960784, 1, 1,
0.3491506, 0.1780839, 0.6390174, 0, 0.1882353, 1, 1,
0.3493768, 1.906487, 0.8389258, 0, 0.1843137, 1, 1,
0.3502769, -0.1271592, 0.1387102, 0, 0.1764706, 1, 1,
0.3561595, 2.610932, 1.141406, 0, 0.172549, 1, 1,
0.3581177, 0.7641271, 0.6313235, 0, 0.1647059, 1, 1,
0.3585147, 0.9882022, 0.1031585, 0, 0.1607843, 1, 1,
0.3589052, 0.113817, 2.153846, 0, 0.1529412, 1, 1,
0.3606697, -0.8490304, 3.43159, 0, 0.1490196, 1, 1,
0.3617482, -0.9921758, 3.53448, 0, 0.1411765, 1, 1,
0.3631148, 1.179175, 0.2313895, 0, 0.1372549, 1, 1,
0.3631825, -1.309842, 1.616282, 0, 0.1294118, 1, 1,
0.3638104, -0.9368886, 1.86028, 0, 0.1254902, 1, 1,
0.3650566, -0.07981499, 5.19164, 0, 0.1176471, 1, 1,
0.370692, 2.376819, -1.20668, 0, 0.1137255, 1, 1,
0.3723634, 1.154689, -0.1737075, 0, 0.1058824, 1, 1,
0.3737888, 0.07081475, 1.13469, 0, 0.09803922, 1, 1,
0.374624, 0.2479775, -0.06909753, 0, 0.09411765, 1, 1,
0.3753276, 0.2334624, 2.312573, 0, 0.08627451, 1, 1,
0.3763442, 1.316407, 0.657856, 0, 0.08235294, 1, 1,
0.3783164, 0.127655, -1.125442, 0, 0.07450981, 1, 1,
0.380572, 0.6667232, -0.002708904, 0, 0.07058824, 1, 1,
0.3812475, -0.1770433, 2.720809, 0, 0.0627451, 1, 1,
0.3887838, -0.9228576, 3.223993, 0, 0.05882353, 1, 1,
0.3932762, 1.403124, 0.6709207, 0, 0.05098039, 1, 1,
0.3976216, -0.468809, 2.980862, 0, 0.04705882, 1, 1,
0.3997717, -1.017044, 1.316372, 0, 0.03921569, 1, 1,
0.4036803, 0.8169512, 0.3112723, 0, 0.03529412, 1, 1,
0.405108, -1.30471, 3.156875, 0, 0.02745098, 1, 1,
0.4061733, 0.32094, 2.009069, 0, 0.02352941, 1, 1,
0.4062257, -0.6764314, 2.00607, 0, 0.01568628, 1, 1,
0.4064697, -3.464772, 4.075169, 0, 0.01176471, 1, 1,
0.4089853, 0.6584826, 2.856922, 0, 0.003921569, 1, 1,
0.4225918, -0.7618001, 2.324103, 0.003921569, 0, 1, 1,
0.4269133, 0.0008434907, 1.255455, 0.007843138, 0, 1, 1,
0.4290209, 0.8921071, -1.796933, 0.01568628, 0, 1, 1,
0.4328626, 0.7829674, 1.08142, 0.01960784, 0, 1, 1,
0.4349089, 0.7673526, 0.9648309, 0.02745098, 0, 1, 1,
0.4393919, 0.03528214, 3.544829, 0.03137255, 0, 1, 1,
0.4404012, 0.1720461, 1.394163, 0.03921569, 0, 1, 1,
0.4424501, 1.293509, 1.330257, 0.04313726, 0, 1, 1,
0.4429043, -0.02398065, 1.187467, 0.05098039, 0, 1, 1,
0.4444125, -0.2764807, 1.788799, 0.05490196, 0, 1, 1,
0.449164, 0.4195371, 1.465107, 0.0627451, 0, 1, 1,
0.453451, 1.155966, 1.596936, 0.06666667, 0, 1, 1,
0.45533, -0.008164749, 0.730081, 0.07450981, 0, 1, 1,
0.4557716, 1.387478, 0.6922284, 0.07843138, 0, 1, 1,
0.4603703, 0.9853986, 0.4844346, 0.08627451, 0, 1, 1,
0.4616123, -3.543218, 3.085712, 0.09019608, 0, 1, 1,
0.4645911, 2.775994, -0.1863387, 0.09803922, 0, 1, 1,
0.4700902, 0.4441133, 0.4032801, 0.1058824, 0, 1, 1,
0.4719852, -0.3287686, 2.512396, 0.1098039, 0, 1, 1,
0.4783381, 0.742339, 2.22894, 0.1176471, 0, 1, 1,
0.4790742, -0.6789247, 2.51692, 0.1215686, 0, 1, 1,
0.4794047, -1.010151, 2.784582, 0.1294118, 0, 1, 1,
0.487578, 0.6465746, 1.037017, 0.1333333, 0, 1, 1,
0.492979, -0.5061746, 2.05118, 0.1411765, 0, 1, 1,
0.4953958, 1.908619, 0.655845, 0.145098, 0, 1, 1,
0.4963645, 0.9081029, 1.052514, 0.1529412, 0, 1, 1,
0.4989201, -1.139637, 2.494084, 0.1568628, 0, 1, 1,
0.5005596, 0.2651523, 0.06823622, 0.1647059, 0, 1, 1,
0.5031246, -0.276499, 1.927294, 0.1686275, 0, 1, 1,
0.5039746, -1.35785, 1.270837, 0.1764706, 0, 1, 1,
0.5055339, 0.5490676, -0.9916157, 0.1803922, 0, 1, 1,
0.5082707, 0.8813991, 0.5358983, 0.1882353, 0, 1, 1,
0.5133103, 0.06348516, 2.950021, 0.1921569, 0, 1, 1,
0.5232469, 0.3252528, 1.257675, 0.2, 0, 1, 1,
0.5239429, -0.1343819, 2.76342, 0.2078431, 0, 1, 1,
0.5241516, 0.0439499, -0.04848684, 0.2117647, 0, 1, 1,
0.5255693, 0.4392923, 0.7476577, 0.2196078, 0, 1, 1,
0.5261367, 0.6631837, 0.4575821, 0.2235294, 0, 1, 1,
0.5267808, -0.05884815, 2.626596, 0.2313726, 0, 1, 1,
0.526957, 0.2912436, 3.106199, 0.2352941, 0, 1, 1,
0.528149, -2.058056, 3.350015, 0.2431373, 0, 1, 1,
0.5350839, -0.6815061, 0.4931537, 0.2470588, 0, 1, 1,
0.543224, 0.3098993, -0.2906621, 0.254902, 0, 1, 1,
0.544517, -0.06984612, 0.7224454, 0.2588235, 0, 1, 1,
0.5446168, 0.2042082, 1.355335, 0.2666667, 0, 1, 1,
0.5490918, 0.3865075, 2.864263, 0.2705882, 0, 1, 1,
0.5546287, 1.577308, 1.38581, 0.2784314, 0, 1, 1,
0.5564418, -0.5331933, 4.740226, 0.282353, 0, 1, 1,
0.5592946, -0.8460805, 3.73349, 0.2901961, 0, 1, 1,
0.5617431, 0.4472248, 0.923397, 0.2941177, 0, 1, 1,
0.5628252, 0.5218289, 1.095877, 0.3019608, 0, 1, 1,
0.5664436, 1.108541, 0.9132063, 0.3098039, 0, 1, 1,
0.5673193, -2.000895, 2.16803, 0.3137255, 0, 1, 1,
0.5730057, 1.064775, 1.037519, 0.3215686, 0, 1, 1,
0.5778219, 1.385741, -0.1761252, 0.3254902, 0, 1, 1,
0.5942471, -0.06589124, 0.9993708, 0.3333333, 0, 1, 1,
0.5967721, 0.1020982, 2.824041, 0.3372549, 0, 1, 1,
0.5976943, 0.8185995, 0.8213655, 0.345098, 0, 1, 1,
0.6015562, -0.2254831, 1.087685, 0.3490196, 0, 1, 1,
0.6118572, 0.0363217, 1.783133, 0.3568628, 0, 1, 1,
0.6176527, 0.9023715, 0.843113, 0.3607843, 0, 1, 1,
0.6188014, -0.3177701, 2.227918, 0.3686275, 0, 1, 1,
0.6199781, -0.3999276, 1.430222, 0.372549, 0, 1, 1,
0.6204211, 0.9493294, 1.290818, 0.3803922, 0, 1, 1,
0.6228043, 0.3044943, 1.379301, 0.3843137, 0, 1, 1,
0.6354346, -0.4457674, 3.38896, 0.3921569, 0, 1, 1,
0.6373456, -0.04236707, 1.032978, 0.3960784, 0, 1, 1,
0.6394341, -1.154616, 1.539381, 0.4039216, 0, 1, 1,
0.6421395, -1.232212, 2.597938, 0.4117647, 0, 1, 1,
0.6488334, -0.1293711, 1.286763, 0.4156863, 0, 1, 1,
0.6496813, -0.2321378, 1.964089, 0.4235294, 0, 1, 1,
0.6498126, -0.3348837, 2.269369, 0.427451, 0, 1, 1,
0.6509002, -1.79752, 2.837862, 0.4352941, 0, 1, 1,
0.6561044, 0.6473603, 1.04335, 0.4392157, 0, 1, 1,
0.6563767, -1.522377, 1.999927, 0.4470588, 0, 1, 1,
0.6565058, -1.382323, 2.134686, 0.4509804, 0, 1, 1,
0.659899, 1.398386, -0.6366882, 0.4588235, 0, 1, 1,
0.6601588, 0.05938273, 0.1764049, 0.4627451, 0, 1, 1,
0.6612082, -0.6880804, 2.42627, 0.4705882, 0, 1, 1,
0.6640847, -0.05541027, 1.554435, 0.4745098, 0, 1, 1,
0.6681538, 0.3556065, 0.6605712, 0.4823529, 0, 1, 1,
0.6682773, 0.6183301, 2.334885, 0.4862745, 0, 1, 1,
0.6722326, -0.9925575, 5.243614, 0.4941176, 0, 1, 1,
0.6764911, 0.3181434, 0.6967273, 0.5019608, 0, 1, 1,
0.677447, 0.06389224, 2.613533, 0.5058824, 0, 1, 1,
0.6919303, 0.3413874, 1.300683, 0.5137255, 0, 1, 1,
0.6945693, 1.117232, 2.238224, 0.5176471, 0, 1, 1,
0.6962448, -0.7604567, -0.3037494, 0.5254902, 0, 1, 1,
0.6971437, 0.4146041, 2.462877, 0.5294118, 0, 1, 1,
0.701027, -1.237785, 2.412058, 0.5372549, 0, 1, 1,
0.7069241, -1.963056, 2.683199, 0.5411765, 0, 1, 1,
0.7096894, -1.167951, 2.148868, 0.5490196, 0, 1, 1,
0.7103058, 0.259341, 1.564074, 0.5529412, 0, 1, 1,
0.7146856, 0.3960476, 1.013206, 0.5607843, 0, 1, 1,
0.7158812, -0.995566, 3.376999, 0.5647059, 0, 1, 1,
0.7182075, 0.3575513, 1.446005, 0.572549, 0, 1, 1,
0.720593, -1.050703, 1.138564, 0.5764706, 0, 1, 1,
0.7209054, 0.1794301, 0.9002777, 0.5843138, 0, 1, 1,
0.7421241, -1.506493, 1.790264, 0.5882353, 0, 1, 1,
0.7475279, 0.6616686, 1.339308, 0.5960785, 0, 1, 1,
0.7520834, 0.1387243, 0.7689807, 0.6039216, 0, 1, 1,
0.7595049, 0.4195339, 1.836065, 0.6078432, 0, 1, 1,
0.7616902, -0.7380246, 3.996659, 0.6156863, 0, 1, 1,
0.7629393, -2.360384, 3.636676, 0.6196079, 0, 1, 1,
0.7630112, 1.260846, -0.1069323, 0.627451, 0, 1, 1,
0.7668477, -0.7730337, 3.478503, 0.6313726, 0, 1, 1,
0.7722093, -1.070373, 4.279119, 0.6392157, 0, 1, 1,
0.773748, -1.264214, 2.812467, 0.6431373, 0, 1, 1,
0.7749812, 0.6387923, 1.157889, 0.6509804, 0, 1, 1,
0.7797464, -0.1462751, 3.721731, 0.654902, 0, 1, 1,
0.7830297, 0.9106708, 0.2715768, 0.6627451, 0, 1, 1,
0.7841303, -0.02606752, 0.4226827, 0.6666667, 0, 1, 1,
0.7854282, -2.238032, 3.518818, 0.6745098, 0, 1, 1,
0.7868448, -1.401996, 2.600341, 0.6784314, 0, 1, 1,
0.789516, 0.6578023, -0.6547502, 0.6862745, 0, 1, 1,
0.7903637, 1.064372, 0.6950681, 0.6901961, 0, 1, 1,
0.7953287, 0.8608099, -0.233753, 0.6980392, 0, 1, 1,
0.809481, -0.8257241, 2.397911, 0.7058824, 0, 1, 1,
0.8097145, 0.4311439, -0.06836171, 0.7098039, 0, 1, 1,
0.8097486, 0.3243335, 0.9497648, 0.7176471, 0, 1, 1,
0.8121291, 1.05818, 2.240545, 0.7215686, 0, 1, 1,
0.812179, -1.483606, 3.000915, 0.7294118, 0, 1, 1,
0.8146237, -0.4261195, 1.207047, 0.7333333, 0, 1, 1,
0.8146527, -0.3014394, 3.175845, 0.7411765, 0, 1, 1,
0.8236959, 0.9370413, 0.6570404, 0.7450981, 0, 1, 1,
0.8251318, -0.1452479, 0.08748197, 0.7529412, 0, 1, 1,
0.8304391, 1.095067, 0.5264266, 0.7568628, 0, 1, 1,
0.8328872, 0.3293695, 2.75312, 0.7647059, 0, 1, 1,
0.8378957, 0.1487123, 1.833001, 0.7686275, 0, 1, 1,
0.8383858, 0.8900622, 2.243853, 0.7764706, 0, 1, 1,
0.8431507, -1.041055, 2.252456, 0.7803922, 0, 1, 1,
0.8468596, 2.316884, -0.147626, 0.7882353, 0, 1, 1,
0.8468896, 1.114034, 0.698485, 0.7921569, 0, 1, 1,
0.8469582, -0.1708868, -0.121488, 0.8, 0, 1, 1,
0.8536647, -0.4143313, 1.023305, 0.8078431, 0, 1, 1,
0.8582148, -0.9294838, 1.400335, 0.8117647, 0, 1, 1,
0.8620234, -0.1725685, 1.92009, 0.8196079, 0, 1, 1,
0.8629484, 0.7760621, 0.5724027, 0.8235294, 0, 1, 1,
0.8709257, -0.6195362, 1.814251, 0.8313726, 0, 1, 1,
0.8720978, -0.7905271, 4.53504, 0.8352941, 0, 1, 1,
0.8742909, -0.1588708, 2.186233, 0.8431373, 0, 1, 1,
0.8760152, -0.008890031, 0.8567312, 0.8470588, 0, 1, 1,
0.8765228, 0.6633756, 0.855643, 0.854902, 0, 1, 1,
0.8854056, 1.028138, 1.025783, 0.8588235, 0, 1, 1,
0.8863534, 1.959501, 2.332689, 0.8666667, 0, 1, 1,
0.8952821, -0.6741092, 1.180137, 0.8705882, 0, 1, 1,
0.9077252, 0.1685317, 1.176607, 0.8784314, 0, 1, 1,
0.9085644, -0.322907, 2.433745, 0.8823529, 0, 1, 1,
0.9088318, 0.6112013, -0.6122081, 0.8901961, 0, 1, 1,
0.9143782, -0.3172906, 2.529747, 0.8941177, 0, 1, 1,
0.9196258, 0.122115, 3.157714, 0.9019608, 0, 1, 1,
0.9206157, 1.457831, 1.091335, 0.9098039, 0, 1, 1,
0.9247246, 0.05138794, 1.060483, 0.9137255, 0, 1, 1,
0.9271916, 1.172017, 0.07220712, 0.9215686, 0, 1, 1,
0.928616, -0.6142595, 2.865064, 0.9254902, 0, 1, 1,
0.9286903, 0.9517524, 1.26742, 0.9333333, 0, 1, 1,
0.933128, -0.5665897, 2.964567, 0.9372549, 0, 1, 1,
0.9380113, -0.8393267, 0.3198768, 0.945098, 0, 1, 1,
0.9394984, 3.013722, -0.4543512, 0.9490196, 0, 1, 1,
0.9408787, 0.6830106, 1.693217, 0.9568627, 0, 1, 1,
0.9443277, 0.1414993, 0.7247272, 0.9607843, 0, 1, 1,
0.9493647, 0.08113233, 2.841291, 0.9686275, 0, 1, 1,
0.9556023, 0.3534763, 0.9081097, 0.972549, 0, 1, 1,
0.9759107, 0.6293334, -0.6368474, 0.9803922, 0, 1, 1,
0.9778205, -0.2837779, 2.563764, 0.9843137, 0, 1, 1,
0.9792501, 1.075083, 0.9873058, 0.9921569, 0, 1, 1,
0.9883297, 0.1414509, -0.168244, 0.9960784, 0, 1, 1,
0.9888374, -0.07486484, 2.812689, 1, 0, 0.9960784, 1,
0.9974039, -1.059404, -0.9164064, 1, 0, 0.9882353, 1,
0.9983539, 2.091094, 1.188721, 1, 0, 0.9843137, 1,
1.001653, 1.166265, 0.568634, 1, 0, 0.9764706, 1,
1.006215, 1.012152, -0.3371384, 1, 0, 0.972549, 1,
1.007038, -1.528097, 2.985245, 1, 0, 0.9647059, 1,
1.011745, 0.3363321, 1.646811, 1, 0, 0.9607843, 1,
1.012758, 0.005332419, 1.680936, 1, 0, 0.9529412, 1,
1.015499, -0.8730513, 3.040213, 1, 0, 0.9490196, 1,
1.023072, 0.06219332, 0.5201108, 1, 0, 0.9411765, 1,
1.031192, -0.2561037, 2.294223, 1, 0, 0.9372549, 1,
1.034302, 0.7212239, 0.2013706, 1, 0, 0.9294118, 1,
1.034917, 1.073244, 1.708918, 1, 0, 0.9254902, 1,
1.039068, -0.7960514, 0.9789983, 1, 0, 0.9176471, 1,
1.058733, -1.024882, 2.764229, 1, 0, 0.9137255, 1,
1.062474, -0.1043848, 2.495259, 1, 0, 0.9058824, 1,
1.066244, -0.1100858, 1.652517, 1, 0, 0.9019608, 1,
1.067716, -1.228892, 1.677562, 1, 0, 0.8941177, 1,
1.072087, 1.0312, 1.175617, 1, 0, 0.8862745, 1,
1.074135, -0.9101063, 3.672348, 1, 0, 0.8823529, 1,
1.074212, 0.7057674, -0.0960824, 1, 0, 0.8745098, 1,
1.077899, -0.09844085, 2.298147, 1, 0, 0.8705882, 1,
1.08054, 0.1051121, 0.1080436, 1, 0, 0.8627451, 1,
1.081394, -0.2286442, 1.448487, 1, 0, 0.8588235, 1,
1.082487, 0.1769664, 0.9523511, 1, 0, 0.8509804, 1,
1.084167, 0.9154528, 2.823534, 1, 0, 0.8470588, 1,
1.088971, 0.7506534, 0.9566884, 1, 0, 0.8392157, 1,
1.089661, -0.338983, 2.154099, 1, 0, 0.8352941, 1,
1.096575, 0.1179344, 1.056669, 1, 0, 0.827451, 1,
1.097139, -0.3653153, 0.9715127, 1, 0, 0.8235294, 1,
1.108463, -2.856871, 3.08654, 1, 0, 0.8156863, 1,
1.115545, 1.601201, 0.4040872, 1, 0, 0.8117647, 1,
1.115805, -0.7459576, 3.14827, 1, 0, 0.8039216, 1,
1.130443, -0.7670578, 2.890896, 1, 0, 0.7960784, 1,
1.13835, 1.072748, -0.6420885, 1, 0, 0.7921569, 1,
1.138613, 0.6899779, 0.4137154, 1, 0, 0.7843137, 1,
1.144669, -2.078367, 4.090078, 1, 0, 0.7803922, 1,
1.146174, 0.8959379, -0.2493999, 1, 0, 0.772549, 1,
1.151489, 1.074509, -0.7452824, 1, 0, 0.7686275, 1,
1.167273, -0.7772924, 1.913515, 1, 0, 0.7607843, 1,
1.178961, -0.6871908, 1.66827, 1, 0, 0.7568628, 1,
1.178984, 2.678823, 1.087235, 1, 0, 0.7490196, 1,
1.186438, -0.07583026, 0.5232391, 1, 0, 0.7450981, 1,
1.186734, -0.9546888, 1.639495, 1, 0, 0.7372549, 1,
1.186798, 0.933288, 2.479534, 1, 0, 0.7333333, 1,
1.188177, 0.957965, 1.204835, 1, 0, 0.7254902, 1,
1.196894, 0.3622406, 0.3620576, 1, 0, 0.7215686, 1,
1.202177, -0.1383279, 1.971639, 1, 0, 0.7137255, 1,
1.203481, 0.9847089, 1.400939, 1, 0, 0.7098039, 1,
1.211991, 2.284604, 0.05125607, 1, 0, 0.7019608, 1,
1.212498, 0.008915473, 3.429415, 1, 0, 0.6941177, 1,
1.218577, -0.7498996, 2.648565, 1, 0, 0.6901961, 1,
1.222812, -0.4858055, 0.8869215, 1, 0, 0.682353, 1,
1.223735, 1.497023, -0.8755976, 1, 0, 0.6784314, 1,
1.225731, -0.284679, 1.713062, 1, 0, 0.6705883, 1,
1.22708, 1.986825, 0.2344562, 1, 0, 0.6666667, 1,
1.2321, 0.03895067, 0.2304919, 1, 0, 0.6588235, 1,
1.24807, 2.47245, 1.509222, 1, 0, 0.654902, 1,
1.251826, 0.1370562, 0.1036254, 1, 0, 0.6470588, 1,
1.25801, 0.01112678, 2.35944, 1, 0, 0.6431373, 1,
1.26152, 0.4193011, 2.307377, 1, 0, 0.6352941, 1,
1.26571, 0.4676609, 0.7036868, 1, 0, 0.6313726, 1,
1.273025, -0.1697387, 1.893466, 1, 0, 0.6235294, 1,
1.282453, 0.7292911, 2.063652, 1, 0, 0.6196079, 1,
1.290989, 0.5576977, 0.868342, 1, 0, 0.6117647, 1,
1.297175, -0.8405322, 0.9318013, 1, 0, 0.6078432, 1,
1.299381, -0.4614705, 2.186503, 1, 0, 0.6, 1,
1.302348, 0.06729154, 1.551216, 1, 0, 0.5921569, 1,
1.302862, 0.4367919, 1.663762, 1, 0, 0.5882353, 1,
1.317508, 0.06890856, 2.340795, 1, 0, 0.5803922, 1,
1.319898, -0.3095934, 2.552216, 1, 0, 0.5764706, 1,
1.323708, 2.039194, 0.04371605, 1, 0, 0.5686275, 1,
1.33696, 0.7099476, 1.062546, 1, 0, 0.5647059, 1,
1.33779, -0.8583622, 2.34616, 1, 0, 0.5568628, 1,
1.343125, 1.454557, 1.131471, 1, 0, 0.5529412, 1,
1.343688, 1.090515, -0.8292084, 1, 0, 0.5450981, 1,
1.347474, 0.04306797, 3.197532, 1, 0, 0.5411765, 1,
1.356079, 1.075561, 0.9785873, 1, 0, 0.5333334, 1,
1.35751, -2.365249, 4.551398, 1, 0, 0.5294118, 1,
1.389042, -0.427862, 0.4129353, 1, 0, 0.5215687, 1,
1.4069, 1.868459, 0.6368349, 1, 0, 0.5176471, 1,
1.420069, -1.056288, 0.9366662, 1, 0, 0.509804, 1,
1.428101, -0.8632852, 1.210293, 1, 0, 0.5058824, 1,
1.428598, 1.377607, 0.220534, 1, 0, 0.4980392, 1,
1.439613, 0.8336217, 1.211544, 1, 0, 0.4901961, 1,
1.449283, -0.9256691, 2.364117, 1, 0, 0.4862745, 1,
1.463524, 0.3635131, 1.906172, 1, 0, 0.4784314, 1,
1.473792, -0.5923997, 0.6229096, 1, 0, 0.4745098, 1,
1.482302, 0.717652, 1.238918, 1, 0, 0.4666667, 1,
1.487992, -0.9039377, 3.644349, 1, 0, 0.4627451, 1,
1.490469, -0.4162641, 0.319136, 1, 0, 0.454902, 1,
1.490801, -0.2512862, 2.373376, 1, 0, 0.4509804, 1,
1.493005, 0.427065, -0.367053, 1, 0, 0.4431373, 1,
1.493305, 0.04832629, 2.077384, 1, 0, 0.4392157, 1,
1.49773, -1.785811, 2.853163, 1, 0, 0.4313726, 1,
1.504595, 0.9611116, 1.070313, 1, 0, 0.427451, 1,
1.518263, -0.08837222, 1.068512, 1, 0, 0.4196078, 1,
1.535888, 0.3790468, 0.8107836, 1, 0, 0.4156863, 1,
1.538205, 0.8257332, 0.8260487, 1, 0, 0.4078431, 1,
1.538695, 0.1386437, 3.017232, 1, 0, 0.4039216, 1,
1.542137, -1.003178, 4.015013, 1, 0, 0.3960784, 1,
1.54382, 0.775602, 0.7258752, 1, 0, 0.3882353, 1,
1.54549, -0.4139714, 1.756365, 1, 0, 0.3843137, 1,
1.551446, 0.3342434, 1.14008, 1, 0, 0.3764706, 1,
1.555709, -0.001323979, 1.521157, 1, 0, 0.372549, 1,
1.558439, 1.917985, 2.062878, 1, 0, 0.3647059, 1,
1.559773, 2.226959, 1.936774, 1, 0, 0.3607843, 1,
1.562493, -0.1499552, 1.006182, 1, 0, 0.3529412, 1,
1.565845, -0.306559, 1.319902, 1, 0, 0.3490196, 1,
1.571204, -0.6773128, 0.368847, 1, 0, 0.3411765, 1,
1.586861, -0.3657177, 1.430387, 1, 0, 0.3372549, 1,
1.604032, 0.189784, 3.282841, 1, 0, 0.3294118, 1,
1.610687, 0.7053661, 1.546001, 1, 0, 0.3254902, 1,
1.613511, -0.5083644, 1.236141, 1, 0, 0.3176471, 1,
1.625508, 0.1158015, 0.8008922, 1, 0, 0.3137255, 1,
1.633232, 0.2068912, 2.517904, 1, 0, 0.3058824, 1,
1.64054, -1.119678, 2.097668, 1, 0, 0.2980392, 1,
1.64844, 0.7077414, 1.010517, 1, 0, 0.2941177, 1,
1.673345, -0.1624656, 1.691585, 1, 0, 0.2862745, 1,
1.683399, 1.202259, 1.966815, 1, 0, 0.282353, 1,
1.708155, -1.410476, 2.721016, 1, 0, 0.2745098, 1,
1.715262, 0.6170316, 0.5299358, 1, 0, 0.2705882, 1,
1.729226, 0.1446496, 0.908178, 1, 0, 0.2627451, 1,
1.736757, -0.3400427, 1.994627, 1, 0, 0.2588235, 1,
1.755842, -1.129877, 3.460529, 1, 0, 0.2509804, 1,
1.75594, -1.783819, 1.943348, 1, 0, 0.2470588, 1,
1.765015, -0.7858618, 1.548367, 1, 0, 0.2392157, 1,
1.766458, -0.04456958, 2.58949, 1, 0, 0.2352941, 1,
1.77742, -0.1111521, 1.586074, 1, 0, 0.227451, 1,
1.794979, -0.4564232, 1.64513, 1, 0, 0.2235294, 1,
1.802136, 1.480465, 1.594507, 1, 0, 0.2156863, 1,
1.803487, -1.529787, 3.231805, 1, 0, 0.2117647, 1,
1.814685, 0.3645556, 1.286837, 1, 0, 0.2039216, 1,
1.814911, -1.741814, 1.493155, 1, 0, 0.1960784, 1,
1.814957, 0.09636229, 0.4378917, 1, 0, 0.1921569, 1,
1.831366, -0.2328503, 1.829313, 1, 0, 0.1843137, 1,
1.839378, -0.4469779, 1.622187, 1, 0, 0.1803922, 1,
1.859654, 1.198697, 1.925797, 1, 0, 0.172549, 1,
1.862362, 1.053022, 1.014196, 1, 0, 0.1686275, 1,
1.889614, -1.765935, 4.127671, 1, 0, 0.1607843, 1,
1.905899, -0.134508, 1.414618, 1, 0, 0.1568628, 1,
1.949343, -0.4846042, 1.710829, 1, 0, 0.1490196, 1,
1.957958, -1.393375, 2.395177, 1, 0, 0.145098, 1,
1.964746, 0.6848953, 0.09880014, 1, 0, 0.1372549, 1,
1.976562, 0.8373951, -0.3422917, 1, 0, 0.1333333, 1,
1.993095, 0.8130343, 0.8299314, 1, 0, 0.1254902, 1,
2.020621, 0.5320268, 0.8616868, 1, 0, 0.1215686, 1,
2.027684, -0.2402867, 4.571933, 1, 0, 0.1137255, 1,
2.027957, 1.234871, 2.432033, 1, 0, 0.1098039, 1,
2.092086, 0.3584498, 2.585779, 1, 0, 0.1019608, 1,
2.094861, 0.3521702, 2.406296, 1, 0, 0.09411765, 1,
2.1022, -2.320883, 3.175288, 1, 0, 0.09019608, 1,
2.103691, -0.3989327, 2.074887, 1, 0, 0.08235294, 1,
2.120736, -2.625551, 1.781717, 1, 0, 0.07843138, 1,
2.15681, -0.594351, 2.617826, 1, 0, 0.07058824, 1,
2.21201, -1.186896, 3.159718, 1, 0, 0.06666667, 1,
2.402945, -0.3431186, 1.980464, 1, 0, 0.05882353, 1,
2.406222, -2.550812, 3.79457, 1, 0, 0.05490196, 1,
2.43883, 0.3911878, 1.594614, 1, 0, 0.04705882, 1,
2.440563, -1.290293, 1.748737, 1, 0, 0.04313726, 1,
2.503595, -0.2193754, 2.124785, 1, 0, 0.03529412, 1,
2.522701, -0.9694356, 1.980003, 1, 0, 0.03137255, 1,
2.562302, -0.7720796, 1.645061, 1, 0, 0.02352941, 1,
2.659027, 1.073597, 1.470778, 1, 0, 0.01960784, 1,
3.059742, 1.094949, 2.121296, 1, 0, 0.01176471, 1,
3.352354, 1.716485, 0.6584106, 1, 0, 0.007843138, 1
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
0.0835917, -4.755741, -7.898994, 0, -0.5, 0.5, 0.5,
0.0835917, -4.755741, -7.898994, 1, -0.5, 0.5, 0.5,
0.0835917, -4.755741, -7.898994, 1, 1.5, 0.5, 0.5,
0.0835917, -4.755741, -7.898994, 0, 1.5, 0.5, 0.5
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
-4.293282, 0.03354466, -7.898994, 0, -0.5, 0.5, 0.5,
-4.293282, 0.03354466, -7.898994, 1, -0.5, 0.5, 0.5,
-4.293282, 0.03354466, -7.898994, 1, 1.5, 0.5, 0.5,
-4.293282, 0.03354466, -7.898994, 0, 1.5, 0.5, 0.5
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
-4.293282, -4.755741, -0.1532485, 0, -0.5, 0.5, 0.5,
-4.293282, -4.755741, -0.1532485, 1, -0.5, 0.5, 0.5,
-4.293282, -4.755741, -0.1532485, 1, 1.5, 0.5, 0.5,
-4.293282, -4.755741, -0.1532485, 0, 1.5, 0.5, 0.5
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
-3, -3.650521, -6.111514,
3, -3.650521, -6.111514,
-3, -3.650521, -6.111514,
-3, -3.834724, -6.409428,
-2, -3.650521, -6.111514,
-2, -3.834724, -6.409428,
-1, -3.650521, -6.111514,
-1, -3.834724, -6.409428,
0, -3.650521, -6.111514,
0, -3.834724, -6.409428,
1, -3.650521, -6.111514,
1, -3.834724, -6.409428,
2, -3.650521, -6.111514,
2, -3.834724, -6.409428,
3, -3.650521, -6.111514,
3, -3.834724, -6.409428
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
-3, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
-3, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
-3, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
-3, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
-2, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
-2, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
-2, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
-2, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
-1, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
-1, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
-1, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
-1, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
0, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
0, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
0, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
0, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
1, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
1, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
1, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
1, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
2, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
2, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
2, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
2, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5,
3, -4.203131, -7.005254, 0, -0.5, 0.5, 0.5,
3, -4.203131, -7.005254, 1, -0.5, 0.5, 0.5,
3, -4.203131, -7.005254, 1, 1.5, 0.5, 0.5,
3, -4.203131, -7.005254, 0, 1.5, 0.5, 0.5
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
-3.283234, -2, -6.111514,
-3.283234, 2, -6.111514,
-3.283234, -2, -6.111514,
-3.451575, -2, -6.409428,
-3.283234, 0, -6.111514,
-3.451575, 0, -6.409428,
-3.283234, 2, -6.111514,
-3.451575, 2, -6.409428
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
-3.788258, -2, -7.005254, 0, -0.5, 0.5, 0.5,
-3.788258, -2, -7.005254, 1, -0.5, 0.5, 0.5,
-3.788258, -2, -7.005254, 1, 1.5, 0.5, 0.5,
-3.788258, -2, -7.005254, 0, 1.5, 0.5, 0.5,
-3.788258, 0, -7.005254, 0, -0.5, 0.5, 0.5,
-3.788258, 0, -7.005254, 1, -0.5, 0.5, 0.5,
-3.788258, 0, -7.005254, 1, 1.5, 0.5, 0.5,
-3.788258, 0, -7.005254, 0, 1.5, 0.5, 0.5,
-3.788258, 2, -7.005254, 0, -0.5, 0.5, 0.5,
-3.788258, 2, -7.005254, 1, -0.5, 0.5, 0.5,
-3.788258, 2, -7.005254, 1, 1.5, 0.5, 0.5,
-3.788258, 2, -7.005254, 0, 1.5, 0.5, 0.5
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
-3.283234, -3.650521, -4,
-3.283234, -3.650521, 4,
-3.283234, -3.650521, -4,
-3.451575, -3.834724, -4,
-3.283234, -3.650521, -2,
-3.451575, -3.834724, -2,
-3.283234, -3.650521, 0,
-3.451575, -3.834724, 0,
-3.283234, -3.650521, 2,
-3.451575, -3.834724, 2,
-3.283234, -3.650521, 4,
-3.451575, -3.834724, 4
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
-3.788258, -4.203131, -4, 0, -0.5, 0.5, 0.5,
-3.788258, -4.203131, -4, 1, -0.5, 0.5, 0.5,
-3.788258, -4.203131, -4, 1, 1.5, 0.5, 0.5,
-3.788258, -4.203131, -4, 0, 1.5, 0.5, 0.5,
-3.788258, -4.203131, -2, 0, -0.5, 0.5, 0.5,
-3.788258, -4.203131, -2, 1, -0.5, 0.5, 0.5,
-3.788258, -4.203131, -2, 1, 1.5, 0.5, 0.5,
-3.788258, -4.203131, -2, 0, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 0, 0, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 0, 1, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 0, 1, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 0, 0, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 2, 0, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 2, 1, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 2, 1, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 2, 0, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 4, 0, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 4, 1, -0.5, 0.5, 0.5,
-3.788258, -4.203131, 4, 1, 1.5, 0.5, 0.5,
-3.788258, -4.203131, 4, 0, 1.5, 0.5, 0.5
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
-3.283234, -3.650521, -6.111514,
-3.283234, 3.71761, -6.111514,
-3.283234, -3.650521, 5.805017,
-3.283234, 3.71761, 5.805017,
-3.283234, -3.650521, -6.111514,
-3.283234, -3.650521, 5.805017,
-3.283234, 3.71761, -6.111514,
-3.283234, 3.71761, 5.805017,
-3.283234, -3.650521, -6.111514,
3.450417, -3.650521, -6.111514,
-3.283234, -3.650521, 5.805017,
3.450417, -3.650521, 5.805017,
-3.283234, 3.71761, -6.111514,
3.450417, 3.71761, -6.111514,
-3.283234, 3.71761, 5.805017,
3.450417, 3.71761, 5.805017,
3.450417, -3.650521, -6.111514,
3.450417, 3.71761, -6.111514,
3.450417, -3.650521, 5.805017,
3.450417, 3.71761, 5.805017,
3.450417, -3.650521, -6.111514,
3.450417, -3.650521, 5.805017,
3.450417, 3.71761, -6.111514,
3.450417, 3.71761, 5.805017
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
var radius = 8.300524;
var distance = 36.92997;
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
mvMatrix.translate( -0.0835917, -0.03354466, 0.1532485 );
mvMatrix.scale( 1.332812, 1.218041, 0.7531293 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.92997);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Alachlor<-read.table("Alachlor.xyz")
```

```
## Error in read.table("Alachlor.xyz"): no lines available in input
```

```r
x<-Alachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'Alachlor' not found
```

```r
y<-Alachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'Alachlor' not found
```

```r
z<-Alachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'Alachlor' not found
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
-3.185171, 0.8847373, -2.78037, 0, 0, 1, 1, 1,
-3.171866, 0.4496666, 0.1241492, 1, 0, 0, 1, 1,
-2.991395, -0.4019067, -2.639545, 1, 0, 0, 1, 1,
-2.886568, -0.06634363, -1.528396, 1, 0, 0, 1, 1,
-2.824169, 0.4859022, -0.711848, 1, 0, 0, 1, 1,
-2.815807, -0.7847327, -2.263651, 1, 0, 0, 1, 1,
-2.769346, -0.5625877, -0.5813003, 0, 0, 0, 1, 1,
-2.629781, 0.04913238, -2.427223, 0, 0, 0, 1, 1,
-2.52104, -0.92081, -2.116351, 0, 0, 0, 1, 1,
-2.518786, 1.101893, -0.3460591, 0, 0, 0, 1, 1,
-2.459951, -0.02120072, -0.494714, 0, 0, 0, 1, 1,
-2.205957, 0.1609714, -0.8312863, 0, 0, 0, 1, 1,
-2.197762, -0.7393622, -2.291142, 0, 0, 0, 1, 1,
-2.130318, 0.5545982, -1.448278, 1, 1, 1, 1, 1,
-2.12381, -1.316556, -2.123556, 1, 1, 1, 1, 1,
-2.089058, -1.324273, -2.281024, 1, 1, 1, 1, 1,
-2.040268, 0.4763644, -0.5189258, 1, 1, 1, 1, 1,
-2.022024, -0.02355669, -2.342235, 1, 1, 1, 1, 1,
-2.018285, 2.499598, 0.5117412, 1, 1, 1, 1, 1,
-2.018205, -0.5467211, -0.471958, 1, 1, 1, 1, 1,
-2.012254, -0.9133759, -1.548661, 1, 1, 1, 1, 1,
-1.995739, 0.813104, 0.06874573, 1, 1, 1, 1, 1,
-1.971915, -1.174089, -3.932656, 1, 1, 1, 1, 1,
-1.971062, -0.42656, -0.2165523, 1, 1, 1, 1, 1,
-1.957577, -0.1936833, -1.863019, 1, 1, 1, 1, 1,
-1.942728, 1.705544, 0.3351746, 1, 1, 1, 1, 1,
-1.933453, -0.5547113, -2.767362, 1, 1, 1, 1, 1,
-1.920606, -0.3736621, -2.304108, 1, 1, 1, 1, 1,
-1.911974, 0.1904437, -0.1126626, 0, 0, 1, 1, 1,
-1.884828, 0.4873482, -1.69165, 1, 0, 0, 1, 1,
-1.836054, 0.2263345, -1.968405, 1, 0, 0, 1, 1,
-1.821634, 1.006453, -2.212949, 1, 0, 0, 1, 1,
-1.805134, 1.207947, -2.796065, 1, 0, 0, 1, 1,
-1.788993, 0.4508975, -0.1441104, 1, 0, 0, 1, 1,
-1.77857, 0.7602147, -1.40398, 0, 0, 0, 1, 1,
-1.769082, 0.3446564, -1.156242, 0, 0, 0, 1, 1,
-1.768212, 2.096794, -0.8315873, 0, 0, 0, 1, 1,
-1.742196, -1.652044, -2.955686, 0, 0, 0, 1, 1,
-1.721073, 0.09929337, -2.151941, 0, 0, 0, 1, 1,
-1.718934, 1.66617, 0.764618, 0, 0, 0, 1, 1,
-1.698935, -0.9287277, -1.670622, 0, 0, 0, 1, 1,
-1.687324, 0.01920145, -0.4300574, 1, 1, 1, 1, 1,
-1.667939, -0.1591254, -4.011192, 1, 1, 1, 1, 1,
-1.629671, 0.02060384, -2.6196, 1, 1, 1, 1, 1,
-1.627612, 0.1174123, -1.681197, 1, 1, 1, 1, 1,
-1.625469, 0.01514388, -0.6106522, 1, 1, 1, 1, 1,
-1.619323, -1.367223, -3.628792, 1, 1, 1, 1, 1,
-1.618191, 1.153908, 0.8107922, 1, 1, 1, 1, 1,
-1.614654, 0.08539212, -0.9334661, 1, 1, 1, 1, 1,
-1.613984, 1.44743, -2.74878, 1, 1, 1, 1, 1,
-1.612963, 0.2011811, -1.383441, 1, 1, 1, 1, 1,
-1.569558, -0.1296352, -1.817139, 1, 1, 1, 1, 1,
-1.558038, -1.826377, -2.259405, 1, 1, 1, 1, 1,
-1.538647, -0.5713451, -0.4650565, 1, 1, 1, 1, 1,
-1.538199, 0.7663944, -1.172954, 1, 1, 1, 1, 1,
-1.531055, -1.511499, -1.559404, 1, 1, 1, 1, 1,
-1.52997, 0.3723175, -2.337052, 0, 0, 1, 1, 1,
-1.528548, 0.5654965, -1.474589, 1, 0, 0, 1, 1,
-1.511208, 1.287372, -1.318912, 1, 0, 0, 1, 1,
-1.49461, -0.1512966, -0.9251948, 1, 0, 0, 1, 1,
-1.489472, 2.898073, -0.8062676, 1, 0, 0, 1, 1,
-1.469659, -1.634552, -3.372864, 1, 0, 0, 1, 1,
-1.45988, -1.089259, -2.298504, 0, 0, 0, 1, 1,
-1.455938, -0.7149936, -3.063695, 0, 0, 0, 1, 1,
-1.455649, 0.7915872, -0.5027176, 0, 0, 0, 1, 1,
-1.449186, -0.6560681, -2.509722, 0, 0, 0, 1, 1,
-1.443979, -0.8313312, -4.931725, 0, 0, 0, 1, 1,
-1.432089, 1.417424, 0.1791615, 0, 0, 0, 1, 1,
-1.428356, 0.3518887, -2.158012, 0, 0, 0, 1, 1,
-1.425413, -0.1396206, -3.093323, 1, 1, 1, 1, 1,
-1.40538, -0.02054388, -0.893739, 1, 1, 1, 1, 1,
-1.403115, 0.749069, -1.171318, 1, 1, 1, 1, 1,
-1.402861, -0.2003524, -1.584793, 1, 1, 1, 1, 1,
-1.395531, 0.749338, -0.5027829, 1, 1, 1, 1, 1,
-1.393022, 0.8334005, -2.651228, 1, 1, 1, 1, 1,
-1.39177, -1.037197, -2.88034, 1, 1, 1, 1, 1,
-1.38746, 0.9616534, -0.6519977, 1, 1, 1, 1, 1,
-1.385536, -1.533394, -2.997325, 1, 1, 1, 1, 1,
-1.379081, -0.374625, -0.9866234, 1, 1, 1, 1, 1,
-1.377638, -0.06841456, -1.514181, 1, 1, 1, 1, 1,
-1.375975, -0.6712039, -3.167041, 1, 1, 1, 1, 1,
-1.370179, -0.3769956, -1.767459, 1, 1, 1, 1, 1,
-1.365669, 0.3477369, -3.221457, 1, 1, 1, 1, 1,
-1.359745, -1.589377, -2.947293, 1, 1, 1, 1, 1,
-1.356327, -1.204491, -2.014116, 0, 0, 1, 1, 1,
-1.353694, -2.527223, -3.13029, 1, 0, 0, 1, 1,
-1.353308, 0.01944102, -1.408747, 1, 0, 0, 1, 1,
-1.350635, 0.7634118, -0.2976502, 1, 0, 0, 1, 1,
-1.345398, 0.9644441, -1.067052, 1, 0, 0, 1, 1,
-1.344636, -2.151963, -1.270548, 1, 0, 0, 1, 1,
-1.33368, -0.5751668, -0.3836879, 0, 0, 0, 1, 1,
-1.332487, -0.8325191, -2.586624, 0, 0, 0, 1, 1,
-1.328196, 0.5177643, -2.667796, 0, 0, 0, 1, 1,
-1.327587, -1.808323, -3.277859, 0, 0, 0, 1, 1,
-1.323806, 2.011373, 0.2106686, 0, 0, 0, 1, 1,
-1.323019, 0.3756158, -1.194332, 0, 0, 0, 1, 1,
-1.306225, 0.4807482, -0.5914362, 0, 0, 0, 1, 1,
-1.302854, -0.1878786, -3.568019, 1, 1, 1, 1, 1,
-1.29489, -0.771486, -3.296544, 1, 1, 1, 1, 1,
-1.289525, 0.3291629, -1.021758, 1, 1, 1, 1, 1,
-1.287266, -0.1380529, -2.357282, 1, 1, 1, 1, 1,
-1.286145, 0.1789275, 0.4905405, 1, 1, 1, 1, 1,
-1.285785, -2.618098, -2.012922, 1, 1, 1, 1, 1,
-1.2802, 0.6557234, -0.6301798, 1, 1, 1, 1, 1,
-1.270694, 0.01486497, -1.810541, 1, 1, 1, 1, 1,
-1.264229, -0.0255507, -0.8813843, 1, 1, 1, 1, 1,
-1.24514, -0.365798, -1.76276, 1, 1, 1, 1, 1,
-1.230339, -2.191795, -1.374718, 1, 1, 1, 1, 1,
-1.226297, -0.5715384, -3.810706, 1, 1, 1, 1, 1,
-1.211742, 1.192212, -2.819247, 1, 1, 1, 1, 1,
-1.205871, -0.7175243, -1.842549, 1, 1, 1, 1, 1,
-1.205847, 2.808924, 0.1567721, 1, 1, 1, 1, 1,
-1.203715, -0.2521164, -2.238926, 0, 0, 1, 1, 1,
-1.199699, -1.649923, -1.584425, 1, 0, 0, 1, 1,
-1.193627, -0.6726143, -4.840615, 1, 0, 0, 1, 1,
-1.183688, 0.1340006, -1.673023, 1, 0, 0, 1, 1,
-1.183647, -1.793258, -2.866522, 1, 0, 0, 1, 1,
-1.176031, -2.322665, -3.449821, 1, 0, 0, 1, 1,
-1.175335, 0.5042568, -0.6031396, 0, 0, 0, 1, 1,
-1.174385, 0.7026502, -1.261775, 0, 0, 0, 1, 1,
-1.171333, 0.1629263, -1.205014, 0, 0, 0, 1, 1,
-1.170263, 0.02042468, -2.205153, 0, 0, 0, 1, 1,
-1.160292, -1.331874, -0.6329263, 0, 0, 0, 1, 1,
-1.157544, -0.2147391, -3.248879, 0, 0, 0, 1, 1,
-1.157416, -0.2435688, -3.222722, 0, 0, 0, 1, 1,
-1.156193, 1.196577, 0.01689417, 1, 1, 1, 1, 1,
-1.152725, -0.06227214, -1.723669, 1, 1, 1, 1, 1,
-1.150141, -0.3986055, -1.700053, 1, 1, 1, 1, 1,
-1.145009, 1.358392, -0.6877022, 1, 1, 1, 1, 1,
-1.144803, 0.8774406, -3.124402, 1, 1, 1, 1, 1,
-1.131512, -0.5025755, -1.811797, 1, 1, 1, 1, 1,
-1.130937, -0.398793, -0.9831027, 1, 1, 1, 1, 1,
-1.129103, 0.3173853, -2.171677, 1, 1, 1, 1, 1,
-1.127062, -1.10383, -0.6730946, 1, 1, 1, 1, 1,
-1.124732, -0.01323667, 0.5481658, 1, 1, 1, 1, 1,
-1.122169, 0.2122606, -3.371629, 1, 1, 1, 1, 1,
-1.119343, -1.533381, -3.118283, 1, 1, 1, 1, 1,
-1.117537, -1.421909, -2.622004, 1, 1, 1, 1, 1,
-1.112481, -1.096945, -4.217408, 1, 1, 1, 1, 1,
-1.104268, 1.570869, -1.558438, 1, 1, 1, 1, 1,
-1.102229, -0.6938835, -1.965934, 0, 0, 1, 1, 1,
-1.101975, -1.317984, -1.696513, 1, 0, 0, 1, 1,
-1.097828, -0.211637, -0.8631383, 1, 0, 0, 1, 1,
-1.094688, 1.928523, -1.1651, 1, 0, 0, 1, 1,
-1.076946, -1.177019, -3.363375, 1, 0, 0, 1, 1,
-1.070358, 0.3348449, -1.463647, 1, 0, 0, 1, 1,
-1.057695, -1.096645, -0.1303394, 0, 0, 0, 1, 1,
-1.057667, 0.7395027, -2.147746, 0, 0, 0, 1, 1,
-1.055784, -0.9228475, -2.262689, 0, 0, 0, 1, 1,
-1.048175, -0.3033511, -1.249555, 0, 0, 0, 1, 1,
-1.045993, 0.002172412, 0.7550626, 0, 0, 0, 1, 1,
-1.03569, -0.07083204, -0.688939, 0, 0, 0, 1, 1,
-1.031605, -0.818732, -3.67642, 0, 0, 0, 1, 1,
-1.029265, -0.6472789, -0.7641785, 1, 1, 1, 1, 1,
-1.018687, -0.7974896, -2.310951, 1, 1, 1, 1, 1,
-1.014997, -0.8155726, -1.643748, 1, 1, 1, 1, 1,
-1.002256, -0.5538078, -3.257162, 1, 1, 1, 1, 1,
-0.9964053, -1.06152, -3.746631, 1, 1, 1, 1, 1,
-0.9962709, 0.4447829, -0.6596968, 1, 1, 1, 1, 1,
-0.992047, 1.135201, -2.271136, 1, 1, 1, 1, 1,
-0.9877703, 0.01248422, -0.6695542, 1, 1, 1, 1, 1,
-0.9860401, -0.5758731, -1.644879, 1, 1, 1, 1, 1,
-0.9856659, 1.977654, -1.096356, 1, 1, 1, 1, 1,
-0.9851475, -0.563393, -0.9459633, 1, 1, 1, 1, 1,
-0.9779882, 0.1017413, -0.1010724, 1, 1, 1, 1, 1,
-0.9768591, 1.162441, -0.5051345, 1, 1, 1, 1, 1,
-0.9741032, 0.5096338, -1.708179, 1, 1, 1, 1, 1,
-0.9740094, -0.01822351, -3.11918, 1, 1, 1, 1, 1,
-0.9670166, 1.230535, -0.5022245, 0, 0, 1, 1, 1,
-0.9612839, 2.85139, 0.4893644, 1, 0, 0, 1, 1,
-0.9584819, -0.5566934, -2.36568, 1, 0, 0, 1, 1,
-0.9568428, 1.552764, -0.8501326, 1, 0, 0, 1, 1,
-0.9553338, 1.496725, 0.8783557, 1, 0, 0, 1, 1,
-0.9478019, -2.279043, -1.01834, 1, 0, 0, 1, 1,
-0.9469295, -1.329407, -2.435451, 0, 0, 0, 1, 1,
-0.9454111, -0.05924118, -1.638245, 0, 0, 0, 1, 1,
-0.9428077, 1.502228, -0.5000001, 0, 0, 0, 1, 1,
-0.9389759, -0.306693, -1.661384, 0, 0, 0, 1, 1,
-0.9385484, 0.9372422, -0.4575063, 0, 0, 0, 1, 1,
-0.9370817, -0.987471, -3.920506, 0, 0, 0, 1, 1,
-0.9351643, 0.8046679, -2.278237, 0, 0, 0, 1, 1,
-0.9339256, 1.288651, 0.1247071, 1, 1, 1, 1, 1,
-0.9329543, -0.1460794, -2.123682, 1, 1, 1, 1, 1,
-0.9323176, 0.8493052, -0.7910118, 1, 1, 1, 1, 1,
-0.931603, -0.9390529, -3.448296, 1, 1, 1, 1, 1,
-0.9278018, -0.4482593, -1.374959, 1, 1, 1, 1, 1,
-0.9240876, 0.4687217, -1.108716, 1, 1, 1, 1, 1,
-0.9180377, -1.077895, -1.633751, 1, 1, 1, 1, 1,
-0.9170184, -1.523555, -3.744337, 1, 1, 1, 1, 1,
-0.9147256, -0.6632606, -2.920708, 1, 1, 1, 1, 1,
-0.9133397, -0.3328788, -2.04947, 1, 1, 1, 1, 1,
-0.9125763, 0.8891018, -0.3802977, 1, 1, 1, 1, 1,
-0.9121811, 0.5499695, -0.793111, 1, 1, 1, 1, 1,
-0.9037579, -0.1937478, -2.879817, 1, 1, 1, 1, 1,
-0.8957884, 1.089482, 0.229784, 1, 1, 1, 1, 1,
-0.8848427, -0.7025558, -1.083139, 1, 1, 1, 1, 1,
-0.8799399, 0.6826131, -2.324996, 0, 0, 1, 1, 1,
-0.8762944, -0.9229112, -1.672256, 1, 0, 0, 1, 1,
-0.8717205, -1.994112, -1.512797, 1, 0, 0, 1, 1,
-0.8644823, -1.867029, -4.855746, 1, 0, 0, 1, 1,
-0.8597628, -0.3224441, -3.504068, 1, 0, 0, 1, 1,
-0.8591995, 0.01078832, -1.475252, 1, 0, 0, 1, 1,
-0.8552746, -1.145218, -3.665382, 0, 0, 0, 1, 1,
-0.8490825, 0.7026482, -1.964471, 0, 0, 0, 1, 1,
-0.8368867, 0.4061539, -1.185343, 0, 0, 0, 1, 1,
-0.8318596, 1.82108, -0.1785835, 0, 0, 0, 1, 1,
-0.8316539, 1.501945, -1.232402, 0, 0, 0, 1, 1,
-0.8237361, 1.509364, -2.013785, 0, 0, 0, 1, 1,
-0.8236563, -0.9420348, -3.288642, 0, 0, 0, 1, 1,
-0.8202113, -1.875359, -2.222179, 1, 1, 1, 1, 1,
-0.8200917, -1.366106, -1.831951, 1, 1, 1, 1, 1,
-0.8142737, -0.4350148, -1.818563, 1, 1, 1, 1, 1,
-0.8039787, 0.07100782, -3.074072, 1, 1, 1, 1, 1,
-0.7955611, 1.645297, -0.8869999, 1, 1, 1, 1, 1,
-0.7936904, 1.371275, -1.71607, 1, 1, 1, 1, 1,
-0.7930579, 0.6130664, -0.4654223, 1, 1, 1, 1, 1,
-0.7923375, 0.8245747, -0.8496888, 1, 1, 1, 1, 1,
-0.7921808, -1.243214, -4.739929, 1, 1, 1, 1, 1,
-0.7919087, -0.05705819, -2.226486, 1, 1, 1, 1, 1,
-0.7912936, 0.3534125, -1.112051, 1, 1, 1, 1, 1,
-0.7889016, -0.003828893, -2.035099, 1, 1, 1, 1, 1,
-0.7844258, -1.371237, -3.787223, 1, 1, 1, 1, 1,
-0.7831754, 1.368608, -2.245955, 1, 1, 1, 1, 1,
-0.7805179, 0.8348433, 0.08681706, 1, 1, 1, 1, 1,
-0.7733559, 0.705485, -0.7360055, 0, 0, 1, 1, 1,
-0.7692995, 1.761433, 0.7795315, 1, 0, 0, 1, 1,
-0.7632736, -1.563935, -5.176201, 1, 0, 0, 1, 1,
-0.7615407, 1.810411, 0.06414889, 1, 0, 0, 1, 1,
-0.7571124, 1.229528, 0.8850752, 1, 0, 0, 1, 1,
-0.7494305, 1.116084, 0.515451, 1, 0, 0, 1, 1,
-0.7486967, -1.115181, -1.983023, 0, 0, 0, 1, 1,
-0.7485373, 0.9206861, -1.953537, 0, 0, 0, 1, 1,
-0.7470502, -0.01086161, -2.79741, 0, 0, 0, 1, 1,
-0.7467614, -0.08206042, -2.177604, 0, 0, 0, 1, 1,
-0.7433167, -0.7466383, -1.868805, 0, 0, 0, 1, 1,
-0.7372673, 0.6057968, -0.2557743, 0, 0, 0, 1, 1,
-0.71825, 0.3208816, -1.115423, 0, 0, 0, 1, 1,
-0.7155385, -1.254959, -3.349684, 1, 1, 1, 1, 1,
-0.7117689, -0.4376273, -3.607597, 1, 1, 1, 1, 1,
-0.6995417, -0.6087888, -2.509167, 1, 1, 1, 1, 1,
-0.6991807, 0.9275945, -2.359435, 1, 1, 1, 1, 1,
-0.6968251, 1.016247, 0.9327438, 1, 1, 1, 1, 1,
-0.6958805, -1.542622, -1.753309, 1, 1, 1, 1, 1,
-0.6946048, 0.3745488, -2.009655, 1, 1, 1, 1, 1,
-0.6833407, 0.01572301, -3.048969, 1, 1, 1, 1, 1,
-0.6802474, -1.25743, -3.217589, 1, 1, 1, 1, 1,
-0.679094, 0.7898842, -2.665113, 1, 1, 1, 1, 1,
-0.6780329, -0.9111085, -2.268149, 1, 1, 1, 1, 1,
-0.6780028, -1.444265, -1.858797, 1, 1, 1, 1, 1,
-0.6753398, -0.5433082, -3.243604, 1, 1, 1, 1, 1,
-0.6751329, -1.059906, -2.614611, 1, 1, 1, 1, 1,
-0.6720644, -0.0513782, -0.0493251, 1, 1, 1, 1, 1,
-0.6714369, -1.209459, -2.310369, 0, 0, 1, 1, 1,
-0.669726, 0.05814886, -1.570379, 1, 0, 0, 1, 1,
-0.6608913, -0.2233415, -3.996496, 1, 0, 0, 1, 1,
-0.6572384, 0.6671874, -0.01870005, 1, 0, 0, 1, 1,
-0.6510118, -0.9807541, -3.686477, 1, 0, 0, 1, 1,
-0.6470979, 0.3359139, -2.11041, 1, 0, 0, 1, 1,
-0.6402329, 0.5147677, -0.1778627, 0, 0, 0, 1, 1,
-0.6329649, -0.4125808, -3.12835, 0, 0, 0, 1, 1,
-0.6327521, 0.8493862, -1.019914, 0, 0, 0, 1, 1,
-0.6323175, 0.3105204, -0.2178138, 0, 0, 0, 1, 1,
-0.6320671, 1.517959, -1.622267, 0, 0, 0, 1, 1,
-0.6319511, -0.7787083, -0.3553301, 0, 0, 0, 1, 1,
-0.6317313, 0.8927619, -1.356367, 0, 0, 0, 1, 1,
-0.6287075, -1.904342, -4.306699, 1, 1, 1, 1, 1,
-0.6266738, 0.1766821, 0.401357, 1, 1, 1, 1, 1,
-0.6249524, -0.4067443, -3.39908, 1, 1, 1, 1, 1,
-0.6195647, -0.1680097, -2.776202, 1, 1, 1, 1, 1,
-0.6186991, 0.565699, -3.451574, 1, 1, 1, 1, 1,
-0.6177196, 0.2807481, -1.180696, 1, 1, 1, 1, 1,
-0.6173208, 0.2191279, -0.8895276, 1, 1, 1, 1, 1,
-0.6148204, 1.266829, -0.6198807, 1, 1, 1, 1, 1,
-0.6124512, -1.08263, -4.073797, 1, 1, 1, 1, 1,
-0.6115387, 1.91675, 1.14975, 1, 1, 1, 1, 1,
-0.6085232, -1.209959, -1.864133, 1, 1, 1, 1, 1,
-0.6063751, 0.6709099, 0.2121205, 1, 1, 1, 1, 1,
-0.6061703, -0.4332934, -2.54581, 1, 1, 1, 1, 1,
-0.6016831, -0.9920875, -1.756574, 1, 1, 1, 1, 1,
-0.5999904, -0.9231874, -2.012906, 1, 1, 1, 1, 1,
-0.5921298, 1.159203, -1.286219, 0, 0, 1, 1, 1,
-0.5914306, 1.118278, -0.4446031, 1, 0, 0, 1, 1,
-0.5910127, 0.696646, -0.5605529, 1, 0, 0, 1, 1,
-0.5898394, -2.060037, -3.977103, 1, 0, 0, 1, 1,
-0.5882856, -1.733955, -4.458387, 1, 0, 0, 1, 1,
-0.5878502, 2.665554, -1.39536, 1, 0, 0, 1, 1,
-0.5786425, 0.1984372, -1.599794, 0, 0, 0, 1, 1,
-0.5684789, -0.7796761, -2.667177, 0, 0, 0, 1, 1,
-0.5644397, 0.2114323, -2.966816, 0, 0, 0, 1, 1,
-0.5625788, -0.08380631, -2.439442, 0, 0, 0, 1, 1,
-0.5607911, -1.135613, -2.344169, 0, 0, 0, 1, 1,
-0.55432, -0.03236632, -1.111334, 0, 0, 0, 1, 1,
-0.5516098, -0.674194, -3.477165, 0, 0, 0, 1, 1,
-0.5485234, -0.6150089, -4.235245, 1, 1, 1, 1, 1,
-0.5402962, -0.929233, -1.648819, 1, 1, 1, 1, 1,
-0.5379294, -0.9188738, -3.786625, 1, 1, 1, 1, 1,
-0.5364501, 0.3793822, -1.479799, 1, 1, 1, 1, 1,
-0.5348707, -1.741262, -2.264055, 1, 1, 1, 1, 1,
-0.527637, -0.580368, -0.6859639, 1, 1, 1, 1, 1,
-0.5244938, -1.180234, -3.435904, 1, 1, 1, 1, 1,
-0.5242846, 0.3433627, -0.9706959, 1, 1, 1, 1, 1,
-0.5242005, -1.452098, -2.945045, 1, 1, 1, 1, 1,
-0.5233949, 3.610307, 0.5166901, 1, 1, 1, 1, 1,
-0.5203133, 1.401164, 0.8344777, 1, 1, 1, 1, 1,
-0.5189159, 0.8198532, -0.5842704, 1, 1, 1, 1, 1,
-0.5182354, -0.02626057, -0.380946, 1, 1, 1, 1, 1,
-0.5153587, -0.2448787, -2.354667, 1, 1, 1, 1, 1,
-0.5144498, -0.2329124, -1.441736, 1, 1, 1, 1, 1,
-0.5101927, 0.06776056, -2.266632, 0, 0, 1, 1, 1,
-0.5100021, 0.4691974, -1.612156, 1, 0, 0, 1, 1,
-0.50984, -1.474697, -3.721853, 1, 0, 0, 1, 1,
-0.5093168, 0.1494646, -1.093998, 1, 0, 0, 1, 1,
-0.508286, 0.1602811, -1.197046, 1, 0, 0, 1, 1,
-0.5067345, 1.331972, -1.321207, 1, 0, 0, 1, 1,
-0.5061916, 0.6822727, -0.6068913, 0, 0, 0, 1, 1,
-0.4994031, -0.9765676, -2.505671, 0, 0, 0, 1, 1,
-0.4989044, 1.051146, -1.298331, 0, 0, 0, 1, 1,
-0.4968405, 0.9337605, -0.7688279, 0, 0, 0, 1, 1,
-0.4967175, 0.04732428, 0.1491493, 0, 0, 0, 1, 1,
-0.4958149, 0.1133519, -3.219858, 0, 0, 0, 1, 1,
-0.4946006, -0.8051853, -2.796974, 0, 0, 0, 1, 1,
-0.4912255, -0.9513399, -3.600534, 1, 1, 1, 1, 1,
-0.4891311, 1.007277, 0.439758, 1, 1, 1, 1, 1,
-0.4864911, -0.006863248, -1.039906, 1, 1, 1, 1, 1,
-0.4807967, 0.4893846, -1.454365, 1, 1, 1, 1, 1,
-0.4766109, 0.7717965, -1.428112, 1, 1, 1, 1, 1,
-0.4706145, -0.4364577, -3.12185, 1, 1, 1, 1, 1,
-0.4698173, -0.7147393, -1.790475, 1, 1, 1, 1, 1,
-0.4662504, 1.161307, -1.096795, 1, 1, 1, 1, 1,
-0.465741, -0.1882689, -1.656348, 1, 1, 1, 1, 1,
-0.4656887, 1.528799, -1.955425, 1, 1, 1, 1, 1,
-0.4604652, 0.9922274, -0.3788512, 1, 1, 1, 1, 1,
-0.4579854, -0.09194279, -1.963394, 1, 1, 1, 1, 1,
-0.4573404, 0.2304571, -1.30597, 1, 1, 1, 1, 1,
-0.4544994, -0.7219906, -1.966271, 1, 1, 1, 1, 1,
-0.4543747, -0.9147022, -3.798714, 1, 1, 1, 1, 1,
-0.4499991, -1.437638, -2.954332, 0, 0, 1, 1, 1,
-0.4495828, 0.3719085, -0.6956453, 1, 0, 0, 1, 1,
-0.4477699, -1.026295, -2.883886, 1, 0, 0, 1, 1,
-0.4448198, 0.5326287, 0.3663908, 1, 0, 0, 1, 1,
-0.4303387, -0.5422418, -2.158402, 1, 0, 0, 1, 1,
-0.4264291, -0.9812314, -4.503638, 1, 0, 0, 1, 1,
-0.4238687, -0.9506159, -2.31738, 0, 0, 0, 1, 1,
-0.4175425, -2.696562, -3.069619, 0, 0, 0, 1, 1,
-0.4124661, 0.8605793, 0.7573774, 0, 0, 0, 1, 1,
-0.4097266, -0.2761985, -2.952367, 0, 0, 0, 1, 1,
-0.4080041, 0.1983295, -2.391951, 0, 0, 0, 1, 1,
-0.4052511, -2.032466, -2.065356, 0, 0, 0, 1, 1,
-0.4018516, 0.5684159, 0.7685159, 0, 0, 0, 1, 1,
-0.4018026, -0.8871446, -3.406887, 1, 1, 1, 1, 1,
-0.4013168, 0.4234501, -1.473982, 1, 1, 1, 1, 1,
-0.3997366, 0.5580406, -2.400623, 1, 1, 1, 1, 1,
-0.396217, -0.4717467, -3.885223, 1, 1, 1, 1, 1,
-0.3933581, 0.2726551, -0.2807904, 1, 1, 1, 1, 1,
-0.3881113, 0.4202888, -2.059712, 1, 1, 1, 1, 1,
-0.3823627, 0.8112459, -2.577622, 1, 1, 1, 1, 1,
-0.3778509, 0.5515241, 0.3485667, 1, 1, 1, 1, 1,
-0.3775916, -0.4776786, -1.372606, 1, 1, 1, 1, 1,
-0.3737819, -0.7808335, -5.937973, 1, 1, 1, 1, 1,
-0.3731497, -0.6394367, -4.310348, 1, 1, 1, 1, 1,
-0.3659077, -0.00438162, -2.609602, 1, 1, 1, 1, 1,
-0.3622669, 0.1808244, 0.01960741, 1, 1, 1, 1, 1,
-0.3602046, -0.07649124, -1.617845, 1, 1, 1, 1, 1,
-0.360153, 0.1692957, -0.5101243, 1, 1, 1, 1, 1,
-0.359505, 1.670125, -1.089095, 0, 0, 1, 1, 1,
-0.3593002, 0.2094128, -1.45036, 1, 0, 0, 1, 1,
-0.3567019, 0.1409883, -0.2383595, 1, 0, 0, 1, 1,
-0.355588, -0.02452236, -2.201226, 1, 0, 0, 1, 1,
-0.3527763, 0.3783391, -1.188914, 1, 0, 0, 1, 1,
-0.3452503, -0.8530456, -3.081672, 1, 0, 0, 1, 1,
-0.3437957, 0.1235861, -0.7524714, 0, 0, 0, 1, 1,
-0.3428628, -1.099092, -0.8109156, 0, 0, 0, 1, 1,
-0.3425285, -0.1453456, -2.986806, 0, 0, 0, 1, 1,
-0.3416384, -0.4508221, -0.6874678, 0, 0, 0, 1, 1,
-0.3398842, -0.4018307, -2.776805, 0, 0, 0, 1, 1,
-0.3390822, -0.2974398, -1.946265, 0, 0, 0, 1, 1,
-0.3390547, -0.5965173, 0.1946173, 0, 0, 0, 1, 1,
-0.3389208, -1.876771, -2.313512, 1, 1, 1, 1, 1,
-0.3332886, 0.7425273, -0.778377, 1, 1, 1, 1, 1,
-0.332204, 1.042584, -0.6630489, 1, 1, 1, 1, 1,
-0.3321819, -0.07447314, -0.9558216, 1, 1, 1, 1, 1,
-0.3304266, 0.6615224, -0.5567786, 1, 1, 1, 1, 1,
-0.3280642, -0.06042526, -2.406088, 1, 1, 1, 1, 1,
-0.3276617, 1.709531, 0.2355008, 1, 1, 1, 1, 1,
-0.3256655, 0.8839809, -1.390228, 1, 1, 1, 1, 1,
-0.3246572, 0.6786775, -2.083764, 1, 1, 1, 1, 1,
-0.3213233, -0.9314023, -2.863289, 1, 1, 1, 1, 1,
-0.321229, 0.08760865, -1.380209, 1, 1, 1, 1, 1,
-0.3195376, 0.3690917, 0.7924126, 1, 1, 1, 1, 1,
-0.3175128, -1.307216, -2.991388, 1, 1, 1, 1, 1,
-0.3162453, -1.227392, -3.482014, 1, 1, 1, 1, 1,
-0.3117153, 0.6769152, -0.6914822, 1, 1, 1, 1, 1,
-0.3102472, -0.9184331, -2.854913, 0, 0, 1, 1, 1,
-0.3098522, 1.795355, -0.6124044, 1, 0, 0, 1, 1,
-0.307828, 1.719097, 0.1342794, 1, 0, 0, 1, 1,
-0.3032785, 0.1961095, -0.634468, 1, 0, 0, 1, 1,
-0.3015098, -1.861398, -3.566251, 1, 0, 0, 1, 1,
-0.2960248, 1.664765, 0.3575918, 1, 0, 0, 1, 1,
-0.2906982, -0.7225925, -2.588315, 0, 0, 0, 1, 1,
-0.2896299, 1.507973, -0.6670726, 0, 0, 0, 1, 1,
-0.289551, -0.2870989, -2.237988, 0, 0, 0, 1, 1,
-0.2886544, 1.749596, -0.5631365, 0, 0, 0, 1, 1,
-0.2873334, 0.6221728, -0.2908674, 0, 0, 0, 1, 1,
-0.2833942, 0.5868847, -0.07350842, 0, 0, 0, 1, 1,
-0.2816283, -0.9974675, -4.077878, 0, 0, 0, 1, 1,
-0.2809125, -1.052005, -1.907631, 1, 1, 1, 1, 1,
-0.27824, -0.2910293, 0.4183798, 1, 1, 1, 1, 1,
-0.2721615, 0.5560942, -0.09962198, 1, 1, 1, 1, 1,
-0.271222, 0.3436123, -0.3647174, 1, 1, 1, 1, 1,
-0.2709878, -0.9879038, -3.145319, 1, 1, 1, 1, 1,
-0.2704808, 0.6637175, -0.3956438, 1, 1, 1, 1, 1,
-0.2696174, 0.5098306, -0.5977011, 1, 1, 1, 1, 1,
-0.2688438, -0.5447904, -3.070405, 1, 1, 1, 1, 1,
-0.2644176, -1.388386, -2.698775, 1, 1, 1, 1, 1,
-0.2630434, -0.6322482, -2.442873, 1, 1, 1, 1, 1,
-0.262892, -0.9725207, -1.694551, 1, 1, 1, 1, 1,
-0.2610494, 1.710031, -1.515438, 1, 1, 1, 1, 1,
-0.2610244, -0.1729945, -1.616585, 1, 1, 1, 1, 1,
-0.2604431, -0.1988893, -1.070014, 1, 1, 1, 1, 1,
-0.2582899, -0.3783188, -0.861016, 1, 1, 1, 1, 1,
-0.2502051, 0.2421581, -1.667196, 0, 0, 1, 1, 1,
-0.2454042, 1.038544, -0.6528375, 1, 0, 0, 1, 1,
-0.2451352, 0.05253237, -1.057145, 1, 0, 0, 1, 1,
-0.2403199, -0.6992559, -3.851626, 1, 0, 0, 1, 1,
-0.2321865, -1.502542, -2.534414, 1, 0, 0, 1, 1,
-0.2303529, -0.988869, -3.522011, 1, 0, 0, 1, 1,
-0.2250687, 0.9354745, 1.328823, 0, 0, 0, 1, 1,
-0.223844, 1.583431, -0.256133, 0, 0, 0, 1, 1,
-0.2227893, -0.7903668, -4.290332, 0, 0, 0, 1, 1,
-0.2210876, -0.4986332, -3.856263, 0, 0, 0, 1, 1,
-0.2189732, -0.04417643, -4.420703, 0, 0, 0, 1, 1,
-0.2189341, -2.721734, -2.763124, 0, 0, 0, 1, 1,
-0.2166484, -0.4624602, -1.823782, 0, 0, 0, 1, 1,
-0.2165934, 0.772786, -0.09086576, 1, 1, 1, 1, 1,
-0.2126325, -0.08742384, -2.841489, 1, 1, 1, 1, 1,
-0.2121115, -0.03148167, -0.6479962, 1, 1, 1, 1, 1,
-0.2108276, 1.202632, -0.2399042, 1, 1, 1, 1, 1,
-0.2100251, -0.5476984, -3.189641, 1, 1, 1, 1, 1,
-0.2062032, 1.672037, -0.4445982, 1, 1, 1, 1, 1,
-0.1916898, -0.4610619, -2.811286, 1, 1, 1, 1, 1,
-0.1911253, -0.4099424, -5.091786, 1, 1, 1, 1, 1,
-0.1901518, -0.659793, -2.101844, 1, 1, 1, 1, 1,
-0.1876192, 0.482351, 0.8914499, 1, 1, 1, 1, 1,
-0.1863757, 1.030746, -0.7975949, 1, 1, 1, 1, 1,
-0.1800392, 0.04799137, 0.3627927, 1, 1, 1, 1, 1,
-0.1722429, 0.1863167, -0.6155891, 1, 1, 1, 1, 1,
-0.1719369, 0.113039, -1.107304, 1, 1, 1, 1, 1,
-0.1716548, 0.6644511, -0.4836908, 1, 1, 1, 1, 1,
-0.1678321, -0.6848449, -4.698146, 0, 0, 1, 1, 1,
-0.1617743, 0.7867749, -0.9964516, 1, 0, 0, 1, 1,
-0.1550103, 2.023767, -0.6231533, 1, 0, 0, 1, 1,
-0.1512537, 0.9533373, 0.5751991, 1, 0, 0, 1, 1,
-0.1512121, 0.1699503, -1.232949, 1, 0, 0, 1, 1,
-0.1444044, 0.06328037, -1.750499, 1, 0, 0, 1, 1,
-0.143842, -2.609592, -2.391998, 0, 0, 0, 1, 1,
-0.1418723, 0.4805614, -0.3031397, 0, 0, 0, 1, 1,
-0.1396596, 0.6240425, -1.08431, 0, 0, 0, 1, 1,
-0.1371288, 1.219455, 0.3840925, 0, 0, 0, 1, 1,
-0.1297811, 1.368493, 0.3519743, 0, 0, 0, 1, 1,
-0.1253113, 0.7580182, 0.2573197, 0, 0, 0, 1, 1,
-0.1240875, 0.5513571, -0.2283616, 0, 0, 0, 1, 1,
-0.1231498, 0.3479892, -0.7586859, 1, 1, 1, 1, 1,
-0.1217282, -0.7885312, -2.310595, 1, 1, 1, 1, 1,
-0.1215151, -0.1172837, -0.3718032, 1, 1, 1, 1, 1,
-0.118993, 0.8167379, 0.8163046, 1, 1, 1, 1, 1,
-0.117803, -0.3259686, -2.488265, 1, 1, 1, 1, 1,
-0.1153145, 1.730064, 1.094494, 1, 1, 1, 1, 1,
-0.1102231, -0.973672, -2.852974, 1, 1, 1, 1, 1,
-0.1101799, -0.06775898, -3.798536, 1, 1, 1, 1, 1,
-0.109001, -0.6546695, -2.936833, 1, 1, 1, 1, 1,
-0.1062571, -0.310843, -2.089092, 1, 1, 1, 1, 1,
-0.1032859, 0.04968558, -2.270094, 1, 1, 1, 1, 1,
-0.09745199, -0.2769656, -2.15062, 1, 1, 1, 1, 1,
-0.09701937, 0.6634663, -1.301245, 1, 1, 1, 1, 1,
-0.09341314, -0.4188474, -2.088502, 1, 1, 1, 1, 1,
-0.08886053, -1.218092, -3.136337, 1, 1, 1, 1, 1,
-0.08826753, 0.7360404, -1.686718, 0, 0, 1, 1, 1,
-0.08721726, 1.024258, -1.154415, 1, 0, 0, 1, 1,
-0.08705906, -0.2131243, -1.998765, 1, 0, 0, 1, 1,
-0.08492058, -0.3565334, -2.747616, 1, 0, 0, 1, 1,
-0.08160619, 0.8523017, 0.5469347, 1, 0, 0, 1, 1,
-0.08091525, -0.1854414, -3.564671, 1, 0, 0, 1, 1,
-0.08065274, 0.975114, -0.3834656, 0, 0, 0, 1, 1,
-0.07367605, -0.8040391, -3.087392, 0, 0, 0, 1, 1,
-0.06931088, -0.6704404, -3.13317, 0, 0, 0, 1, 1,
-0.06784186, 0.2383257, -0.08710871, 0, 0, 0, 1, 1,
-0.0611579, 1.422132, 0.05362321, 0, 0, 0, 1, 1,
-0.05784075, 0.9221966, 0.4679263, 0, 0, 0, 1, 1,
-0.05738509, -2.03735, -3.676275, 0, 0, 0, 1, 1,
-0.05422602, -0.431347, -2.204415, 1, 1, 1, 1, 1,
-0.05112743, 0.9765031, -0.7436068, 1, 1, 1, 1, 1,
-0.04975897, 1.14852, -0.07814919, 1, 1, 1, 1, 1,
-0.0472633, -0.1340279, -3.769485, 1, 1, 1, 1, 1,
-0.04325727, -0.4663, -3.467237, 1, 1, 1, 1, 1,
-0.03814266, -0.5453459, -3.108537, 1, 1, 1, 1, 1,
-0.03641613, 0.4087167, 1.611499, 1, 1, 1, 1, 1,
-0.03576934, -0.6600665, -2.230972, 1, 1, 1, 1, 1,
-0.03559158, 0.1264142, -0.9712707, 1, 1, 1, 1, 1,
-0.03360958, 0.51593, -1.723486, 1, 1, 1, 1, 1,
-0.0201381, 0.06531008, -0.1217525, 1, 1, 1, 1, 1,
-0.01857474, 0.1933863, 1.681833, 1, 1, 1, 1, 1,
-0.01846798, -1.088184, -3.214059, 1, 1, 1, 1, 1,
-0.01430238, 1.27932, -0.9564809, 1, 1, 1, 1, 1,
-0.01252487, -1.162986, -3.914217, 1, 1, 1, 1, 1,
-0.003753519, 0.09169932, -1.027145, 0, 0, 1, 1, 1,
-0.00242325, 1.413987, 0.413018, 1, 0, 0, 1, 1,
0.00447024, -1.126345, 4.539994, 1, 0, 0, 1, 1,
0.005082923, 0.4110948, -0.472522, 1, 0, 0, 1, 1,
0.006993342, -0.4137225, 4.571345, 1, 0, 0, 1, 1,
0.01095107, -0.7334784, 2.279901, 1, 0, 0, 1, 1,
0.01168771, 0.4121153, -0.909949, 0, 0, 0, 1, 1,
0.0129575, 1.683638, -1.71279, 0, 0, 0, 1, 1,
0.01595227, 0.3268419, 0.4677427, 0, 0, 0, 1, 1,
0.02011017, -0.7985891, 2.581492, 0, 0, 0, 1, 1,
0.02294884, -0.05919549, 1.42289, 0, 0, 0, 1, 1,
0.02351072, 0.6321842, 0.5113448, 0, 0, 0, 1, 1,
0.02420193, -0.4016191, 3.224207, 0, 0, 0, 1, 1,
0.02466579, 0.3091274, -0.04878832, 1, 1, 1, 1, 1,
0.02597558, 0.07989726, -1.076427, 1, 1, 1, 1, 1,
0.02842517, 0.6058681, 0.2972685, 1, 1, 1, 1, 1,
0.03209716, 2.858513, -0.03150935, 1, 1, 1, 1, 1,
0.03417968, -1.765921, 4.033615, 1, 1, 1, 1, 1,
0.03499589, 0.2846562, -1.523336, 1, 1, 1, 1, 1,
0.03748102, 1.32857, -0.3407214, 1, 1, 1, 1, 1,
0.04083091, -1.029356, 3.120124, 1, 1, 1, 1, 1,
0.04483825, 1.048328, 0.1073222, 1, 1, 1, 1, 1,
0.05133196, -1.918413, 4.408239, 1, 1, 1, 1, 1,
0.0531729, 0.5553356, 0.6181526, 1, 1, 1, 1, 1,
0.05481648, 0.6505183, -1.216828, 1, 1, 1, 1, 1,
0.05603004, 0.06592205, 1.539657, 1, 1, 1, 1, 1,
0.06186113, 0.03579009, 1.802496, 1, 1, 1, 1, 1,
0.06272434, 0.5833141, 1.239299, 1, 1, 1, 1, 1,
0.06441857, 1.437244, -0.1087216, 0, 0, 1, 1, 1,
0.0689931, 1.225019, -1.050531, 1, 0, 0, 1, 1,
0.07857897, 1.741385, 0.08058213, 1, 0, 0, 1, 1,
0.07904206, 0.5528976, -0.777807, 1, 0, 0, 1, 1,
0.08093812, 0.7955913, -2.9058, 1, 0, 0, 1, 1,
0.08701405, -0.1043926, 3.618474, 1, 0, 0, 1, 1,
0.08978957, -0.2216002, 2.549733, 0, 0, 0, 1, 1,
0.09005039, 0.04348672, 0.1009341, 0, 0, 0, 1, 1,
0.09763103, -0.9862577, 2.69551, 0, 0, 0, 1, 1,
0.09776767, 0.1232857, 0.3233784, 0, 0, 0, 1, 1,
0.1006855, 0.6912683, 1.041414, 0, 0, 0, 1, 1,
0.1010697, -0.2743522, 3.01217, 0, 0, 0, 1, 1,
0.1077432, -0.1098398, 1.694927, 0, 0, 0, 1, 1,
0.1099877, -0.902434, 2.054169, 1, 1, 1, 1, 1,
0.1102628, -0.566265, 2.205835, 1, 1, 1, 1, 1,
0.1120551, 2.192576, 0.5416327, 1, 1, 1, 1, 1,
0.1128779, -1.262613, 2.888258, 1, 1, 1, 1, 1,
0.1164681, -0.1501684, 0.3160397, 1, 1, 1, 1, 1,
0.1207171, -0.8199022, 2.042221, 1, 1, 1, 1, 1,
0.124258, -0.7226579, 3.862118, 1, 1, 1, 1, 1,
0.1397518, -0.3313478, 3.707968, 1, 1, 1, 1, 1,
0.1399958, -0.1039768, 1.348381, 1, 1, 1, 1, 1,
0.1406951, -0.5979803, 3.61322, 1, 1, 1, 1, 1,
0.1469002, 1.285, -1.909366, 1, 1, 1, 1, 1,
0.147738, 1.02911, 1.255789, 1, 1, 1, 1, 1,
0.1484579, -0.7609205, 2.336592, 1, 1, 1, 1, 1,
0.150999, -0.5883179, 3.805504, 1, 1, 1, 1, 1,
0.156058, 0.1653333, 1.29492, 1, 1, 1, 1, 1,
0.165508, -0.3664609, 4.72058, 0, 0, 1, 1, 1,
0.1656462, -0.2564104, 1.464483, 1, 0, 0, 1, 1,
0.1658141, 0.2129194, 1.483208, 1, 0, 0, 1, 1,
0.1687892, -1.664538, 2.534107, 1, 0, 0, 1, 1,
0.1696713, -0.3789602, 2.90192, 1, 0, 0, 1, 1,
0.1699795, 0.6966478, -0.4589126, 1, 0, 0, 1, 1,
0.1701911, 1.204293, 1.192802, 0, 0, 0, 1, 1,
0.1712918, -0.3403202, 1.976545, 0, 0, 0, 1, 1,
0.171315, 0.1360254, 0.8548512, 0, 0, 0, 1, 1,
0.171938, 0.312306, 0.8072059, 0, 0, 0, 1, 1,
0.175487, 1.188577, -0.4837298, 0, 0, 0, 1, 1,
0.17772, 0.2895139, 0.6841968, 0, 0, 0, 1, 1,
0.1779888, -0.2596968, 1.108124, 0, 0, 0, 1, 1,
0.1780661, 0.4599029, 0.5860819, 1, 1, 1, 1, 1,
0.1790104, 0.175839, 0.9238262, 1, 1, 1, 1, 1,
0.17943, 0.09039871, 1.602307, 1, 1, 1, 1, 1,
0.1844385, -0.608312, 2.13913, 1, 1, 1, 1, 1,
0.1898394, 1.011564, 1.737216, 1, 1, 1, 1, 1,
0.1995657, -0.6056393, 4.93562, 1, 1, 1, 1, 1,
0.2102091, 0.1683586, 1.80992, 1, 1, 1, 1, 1,
0.2181281, 1.200879, 1.250525, 1, 1, 1, 1, 1,
0.225625, -0.2433302, 2.376712, 1, 1, 1, 1, 1,
0.2280157, -0.7270115, 3.975507, 1, 1, 1, 1, 1,
0.236959, -2.209029, 3.848462, 1, 1, 1, 1, 1,
0.2371264, -1.396813, 5.631475, 1, 1, 1, 1, 1,
0.2379415, 0.4703655, 0.7004027, 1, 1, 1, 1, 1,
0.2391056, -0.7779417, 3.105724, 1, 1, 1, 1, 1,
0.2391266, -0.9450004, 3.262239, 1, 1, 1, 1, 1,
0.2406617, 0.3677296, 1.108552, 0, 0, 1, 1, 1,
0.2448589, 0.9577861, 0.1912871, 1, 0, 0, 1, 1,
0.2462918, -0.3734646, 1.490757, 1, 0, 0, 1, 1,
0.246342, -1.39952, 2.218934, 1, 0, 0, 1, 1,
0.247587, 1.754016, -1.310039, 1, 0, 0, 1, 1,
0.2487229, 1.146595, -0.2562495, 1, 0, 0, 1, 1,
0.2496566, -0.1583517, 2.7095, 0, 0, 0, 1, 1,
0.2528737, -0.288125, 1.539259, 0, 0, 0, 1, 1,
0.2572651, 0.7278813, 1.136359, 0, 0, 0, 1, 1,
0.2583189, -1.5454, 3.410594, 0, 0, 0, 1, 1,
0.2599064, -0.9548442, 0.4556473, 0, 0, 0, 1, 1,
0.2622761, -0.6010522, 1.548523, 0, 0, 0, 1, 1,
0.2654233, 0.6951452, 0.7358673, 0, 0, 0, 1, 1,
0.2682003, -0.1703157, 1.260544, 1, 1, 1, 1, 1,
0.2701481, -0.01615309, 0.598572, 1, 1, 1, 1, 1,
0.2721977, -1.09661, 1.287808, 1, 1, 1, 1, 1,
0.2746706, -0.3573983, 0.6976315, 1, 1, 1, 1, 1,
0.2775603, -0.003894933, -0.4922322, 1, 1, 1, 1, 1,
0.278271, 0.932773, 0.8195322, 1, 1, 1, 1, 1,
0.2799278, -0.2099698, 2.674733, 1, 1, 1, 1, 1,
0.2826305, 0.2161814, 2.587691, 1, 1, 1, 1, 1,
0.2858656, -0.8254068, 2.815026, 1, 1, 1, 1, 1,
0.2894858, -0.533924, 2.625933, 1, 1, 1, 1, 1,
0.2924388, -0.5059946, 1.908888, 1, 1, 1, 1, 1,
0.2947457, -0.08233852, 5.089348, 1, 1, 1, 1, 1,
0.2948178, 0.9182017, -0.2527389, 1, 1, 1, 1, 1,
0.3000873, 0.6177443, 0.2982293, 1, 1, 1, 1, 1,
0.3028096, -0.2419984, 2.721909, 1, 1, 1, 1, 1,
0.3084663, -0.4904653, 3.908514, 0, 0, 1, 1, 1,
0.3086887, 1.140238, 0.2745875, 1, 0, 0, 1, 1,
0.3108103, 1.512817, -0.507979, 1, 0, 0, 1, 1,
0.3158238, 0.5261074, 1.693625, 1, 0, 0, 1, 1,
0.3163762, -1.287379, 2.391045, 1, 0, 0, 1, 1,
0.3168031, -0.4813333, 2.438725, 1, 0, 0, 1, 1,
0.317477, -1.385932, 3.111029, 0, 0, 0, 1, 1,
0.3175119, 0.9520839, 0.8351786, 0, 0, 0, 1, 1,
0.3238165, 1.378318, 0.1026689, 0, 0, 0, 1, 1,
0.3239429, -0.08102375, 0.9470933, 0, 0, 0, 1, 1,
0.3248086, -1.04096, 3.343338, 0, 0, 0, 1, 1,
0.3276216, -0.1406161, 1.135551, 0, 0, 0, 1, 1,
0.3281894, -1.235424, 3.023962, 0, 0, 0, 1, 1,
0.328238, -0.2369246, 0.9171916, 1, 1, 1, 1, 1,
0.3284423, 0.4820142, 0.5814852, 1, 1, 1, 1, 1,
0.3353912, -1.130794, 1.835398, 1, 1, 1, 1, 1,
0.3381972, -0.7435549, 2.941631, 1, 1, 1, 1, 1,
0.3392006, -1.431196, 3.059919, 1, 1, 1, 1, 1,
0.3401607, 1.143898, -1.896415, 1, 1, 1, 1, 1,
0.3491506, 0.1780839, 0.6390174, 1, 1, 1, 1, 1,
0.3493768, 1.906487, 0.8389258, 1, 1, 1, 1, 1,
0.3502769, -0.1271592, 0.1387102, 1, 1, 1, 1, 1,
0.3561595, 2.610932, 1.141406, 1, 1, 1, 1, 1,
0.3581177, 0.7641271, 0.6313235, 1, 1, 1, 1, 1,
0.3585147, 0.9882022, 0.1031585, 1, 1, 1, 1, 1,
0.3589052, 0.113817, 2.153846, 1, 1, 1, 1, 1,
0.3606697, -0.8490304, 3.43159, 1, 1, 1, 1, 1,
0.3617482, -0.9921758, 3.53448, 1, 1, 1, 1, 1,
0.3631148, 1.179175, 0.2313895, 0, 0, 1, 1, 1,
0.3631825, -1.309842, 1.616282, 1, 0, 0, 1, 1,
0.3638104, -0.9368886, 1.86028, 1, 0, 0, 1, 1,
0.3650566, -0.07981499, 5.19164, 1, 0, 0, 1, 1,
0.370692, 2.376819, -1.20668, 1, 0, 0, 1, 1,
0.3723634, 1.154689, -0.1737075, 1, 0, 0, 1, 1,
0.3737888, 0.07081475, 1.13469, 0, 0, 0, 1, 1,
0.374624, 0.2479775, -0.06909753, 0, 0, 0, 1, 1,
0.3753276, 0.2334624, 2.312573, 0, 0, 0, 1, 1,
0.3763442, 1.316407, 0.657856, 0, 0, 0, 1, 1,
0.3783164, 0.127655, -1.125442, 0, 0, 0, 1, 1,
0.380572, 0.6667232, -0.002708904, 0, 0, 0, 1, 1,
0.3812475, -0.1770433, 2.720809, 0, 0, 0, 1, 1,
0.3887838, -0.9228576, 3.223993, 1, 1, 1, 1, 1,
0.3932762, 1.403124, 0.6709207, 1, 1, 1, 1, 1,
0.3976216, -0.468809, 2.980862, 1, 1, 1, 1, 1,
0.3997717, -1.017044, 1.316372, 1, 1, 1, 1, 1,
0.4036803, 0.8169512, 0.3112723, 1, 1, 1, 1, 1,
0.405108, -1.30471, 3.156875, 1, 1, 1, 1, 1,
0.4061733, 0.32094, 2.009069, 1, 1, 1, 1, 1,
0.4062257, -0.6764314, 2.00607, 1, 1, 1, 1, 1,
0.4064697, -3.464772, 4.075169, 1, 1, 1, 1, 1,
0.4089853, 0.6584826, 2.856922, 1, 1, 1, 1, 1,
0.4225918, -0.7618001, 2.324103, 1, 1, 1, 1, 1,
0.4269133, 0.0008434907, 1.255455, 1, 1, 1, 1, 1,
0.4290209, 0.8921071, -1.796933, 1, 1, 1, 1, 1,
0.4328626, 0.7829674, 1.08142, 1, 1, 1, 1, 1,
0.4349089, 0.7673526, 0.9648309, 1, 1, 1, 1, 1,
0.4393919, 0.03528214, 3.544829, 0, 0, 1, 1, 1,
0.4404012, 0.1720461, 1.394163, 1, 0, 0, 1, 1,
0.4424501, 1.293509, 1.330257, 1, 0, 0, 1, 1,
0.4429043, -0.02398065, 1.187467, 1, 0, 0, 1, 1,
0.4444125, -0.2764807, 1.788799, 1, 0, 0, 1, 1,
0.449164, 0.4195371, 1.465107, 1, 0, 0, 1, 1,
0.453451, 1.155966, 1.596936, 0, 0, 0, 1, 1,
0.45533, -0.008164749, 0.730081, 0, 0, 0, 1, 1,
0.4557716, 1.387478, 0.6922284, 0, 0, 0, 1, 1,
0.4603703, 0.9853986, 0.4844346, 0, 0, 0, 1, 1,
0.4616123, -3.543218, 3.085712, 0, 0, 0, 1, 1,
0.4645911, 2.775994, -0.1863387, 0, 0, 0, 1, 1,
0.4700902, 0.4441133, 0.4032801, 0, 0, 0, 1, 1,
0.4719852, -0.3287686, 2.512396, 1, 1, 1, 1, 1,
0.4783381, 0.742339, 2.22894, 1, 1, 1, 1, 1,
0.4790742, -0.6789247, 2.51692, 1, 1, 1, 1, 1,
0.4794047, -1.010151, 2.784582, 1, 1, 1, 1, 1,
0.487578, 0.6465746, 1.037017, 1, 1, 1, 1, 1,
0.492979, -0.5061746, 2.05118, 1, 1, 1, 1, 1,
0.4953958, 1.908619, 0.655845, 1, 1, 1, 1, 1,
0.4963645, 0.9081029, 1.052514, 1, 1, 1, 1, 1,
0.4989201, -1.139637, 2.494084, 1, 1, 1, 1, 1,
0.5005596, 0.2651523, 0.06823622, 1, 1, 1, 1, 1,
0.5031246, -0.276499, 1.927294, 1, 1, 1, 1, 1,
0.5039746, -1.35785, 1.270837, 1, 1, 1, 1, 1,
0.5055339, 0.5490676, -0.9916157, 1, 1, 1, 1, 1,
0.5082707, 0.8813991, 0.5358983, 1, 1, 1, 1, 1,
0.5133103, 0.06348516, 2.950021, 1, 1, 1, 1, 1,
0.5232469, 0.3252528, 1.257675, 0, 0, 1, 1, 1,
0.5239429, -0.1343819, 2.76342, 1, 0, 0, 1, 1,
0.5241516, 0.0439499, -0.04848684, 1, 0, 0, 1, 1,
0.5255693, 0.4392923, 0.7476577, 1, 0, 0, 1, 1,
0.5261367, 0.6631837, 0.4575821, 1, 0, 0, 1, 1,
0.5267808, -0.05884815, 2.626596, 1, 0, 0, 1, 1,
0.526957, 0.2912436, 3.106199, 0, 0, 0, 1, 1,
0.528149, -2.058056, 3.350015, 0, 0, 0, 1, 1,
0.5350839, -0.6815061, 0.4931537, 0, 0, 0, 1, 1,
0.543224, 0.3098993, -0.2906621, 0, 0, 0, 1, 1,
0.544517, -0.06984612, 0.7224454, 0, 0, 0, 1, 1,
0.5446168, 0.2042082, 1.355335, 0, 0, 0, 1, 1,
0.5490918, 0.3865075, 2.864263, 0, 0, 0, 1, 1,
0.5546287, 1.577308, 1.38581, 1, 1, 1, 1, 1,
0.5564418, -0.5331933, 4.740226, 1, 1, 1, 1, 1,
0.5592946, -0.8460805, 3.73349, 1, 1, 1, 1, 1,
0.5617431, 0.4472248, 0.923397, 1, 1, 1, 1, 1,
0.5628252, 0.5218289, 1.095877, 1, 1, 1, 1, 1,
0.5664436, 1.108541, 0.9132063, 1, 1, 1, 1, 1,
0.5673193, -2.000895, 2.16803, 1, 1, 1, 1, 1,
0.5730057, 1.064775, 1.037519, 1, 1, 1, 1, 1,
0.5778219, 1.385741, -0.1761252, 1, 1, 1, 1, 1,
0.5942471, -0.06589124, 0.9993708, 1, 1, 1, 1, 1,
0.5967721, 0.1020982, 2.824041, 1, 1, 1, 1, 1,
0.5976943, 0.8185995, 0.8213655, 1, 1, 1, 1, 1,
0.6015562, -0.2254831, 1.087685, 1, 1, 1, 1, 1,
0.6118572, 0.0363217, 1.783133, 1, 1, 1, 1, 1,
0.6176527, 0.9023715, 0.843113, 1, 1, 1, 1, 1,
0.6188014, -0.3177701, 2.227918, 0, 0, 1, 1, 1,
0.6199781, -0.3999276, 1.430222, 1, 0, 0, 1, 1,
0.6204211, 0.9493294, 1.290818, 1, 0, 0, 1, 1,
0.6228043, 0.3044943, 1.379301, 1, 0, 0, 1, 1,
0.6354346, -0.4457674, 3.38896, 1, 0, 0, 1, 1,
0.6373456, -0.04236707, 1.032978, 1, 0, 0, 1, 1,
0.6394341, -1.154616, 1.539381, 0, 0, 0, 1, 1,
0.6421395, -1.232212, 2.597938, 0, 0, 0, 1, 1,
0.6488334, -0.1293711, 1.286763, 0, 0, 0, 1, 1,
0.6496813, -0.2321378, 1.964089, 0, 0, 0, 1, 1,
0.6498126, -0.3348837, 2.269369, 0, 0, 0, 1, 1,
0.6509002, -1.79752, 2.837862, 0, 0, 0, 1, 1,
0.6561044, 0.6473603, 1.04335, 0, 0, 0, 1, 1,
0.6563767, -1.522377, 1.999927, 1, 1, 1, 1, 1,
0.6565058, -1.382323, 2.134686, 1, 1, 1, 1, 1,
0.659899, 1.398386, -0.6366882, 1, 1, 1, 1, 1,
0.6601588, 0.05938273, 0.1764049, 1, 1, 1, 1, 1,
0.6612082, -0.6880804, 2.42627, 1, 1, 1, 1, 1,
0.6640847, -0.05541027, 1.554435, 1, 1, 1, 1, 1,
0.6681538, 0.3556065, 0.6605712, 1, 1, 1, 1, 1,
0.6682773, 0.6183301, 2.334885, 1, 1, 1, 1, 1,
0.6722326, -0.9925575, 5.243614, 1, 1, 1, 1, 1,
0.6764911, 0.3181434, 0.6967273, 1, 1, 1, 1, 1,
0.677447, 0.06389224, 2.613533, 1, 1, 1, 1, 1,
0.6919303, 0.3413874, 1.300683, 1, 1, 1, 1, 1,
0.6945693, 1.117232, 2.238224, 1, 1, 1, 1, 1,
0.6962448, -0.7604567, -0.3037494, 1, 1, 1, 1, 1,
0.6971437, 0.4146041, 2.462877, 1, 1, 1, 1, 1,
0.701027, -1.237785, 2.412058, 0, 0, 1, 1, 1,
0.7069241, -1.963056, 2.683199, 1, 0, 0, 1, 1,
0.7096894, -1.167951, 2.148868, 1, 0, 0, 1, 1,
0.7103058, 0.259341, 1.564074, 1, 0, 0, 1, 1,
0.7146856, 0.3960476, 1.013206, 1, 0, 0, 1, 1,
0.7158812, -0.995566, 3.376999, 1, 0, 0, 1, 1,
0.7182075, 0.3575513, 1.446005, 0, 0, 0, 1, 1,
0.720593, -1.050703, 1.138564, 0, 0, 0, 1, 1,
0.7209054, 0.1794301, 0.9002777, 0, 0, 0, 1, 1,
0.7421241, -1.506493, 1.790264, 0, 0, 0, 1, 1,
0.7475279, 0.6616686, 1.339308, 0, 0, 0, 1, 1,
0.7520834, 0.1387243, 0.7689807, 0, 0, 0, 1, 1,
0.7595049, 0.4195339, 1.836065, 0, 0, 0, 1, 1,
0.7616902, -0.7380246, 3.996659, 1, 1, 1, 1, 1,
0.7629393, -2.360384, 3.636676, 1, 1, 1, 1, 1,
0.7630112, 1.260846, -0.1069323, 1, 1, 1, 1, 1,
0.7668477, -0.7730337, 3.478503, 1, 1, 1, 1, 1,
0.7722093, -1.070373, 4.279119, 1, 1, 1, 1, 1,
0.773748, -1.264214, 2.812467, 1, 1, 1, 1, 1,
0.7749812, 0.6387923, 1.157889, 1, 1, 1, 1, 1,
0.7797464, -0.1462751, 3.721731, 1, 1, 1, 1, 1,
0.7830297, 0.9106708, 0.2715768, 1, 1, 1, 1, 1,
0.7841303, -0.02606752, 0.4226827, 1, 1, 1, 1, 1,
0.7854282, -2.238032, 3.518818, 1, 1, 1, 1, 1,
0.7868448, -1.401996, 2.600341, 1, 1, 1, 1, 1,
0.789516, 0.6578023, -0.6547502, 1, 1, 1, 1, 1,
0.7903637, 1.064372, 0.6950681, 1, 1, 1, 1, 1,
0.7953287, 0.8608099, -0.233753, 1, 1, 1, 1, 1,
0.809481, -0.8257241, 2.397911, 0, 0, 1, 1, 1,
0.8097145, 0.4311439, -0.06836171, 1, 0, 0, 1, 1,
0.8097486, 0.3243335, 0.9497648, 1, 0, 0, 1, 1,
0.8121291, 1.05818, 2.240545, 1, 0, 0, 1, 1,
0.812179, -1.483606, 3.000915, 1, 0, 0, 1, 1,
0.8146237, -0.4261195, 1.207047, 1, 0, 0, 1, 1,
0.8146527, -0.3014394, 3.175845, 0, 0, 0, 1, 1,
0.8236959, 0.9370413, 0.6570404, 0, 0, 0, 1, 1,
0.8251318, -0.1452479, 0.08748197, 0, 0, 0, 1, 1,
0.8304391, 1.095067, 0.5264266, 0, 0, 0, 1, 1,
0.8328872, 0.3293695, 2.75312, 0, 0, 0, 1, 1,
0.8378957, 0.1487123, 1.833001, 0, 0, 0, 1, 1,
0.8383858, 0.8900622, 2.243853, 0, 0, 0, 1, 1,
0.8431507, -1.041055, 2.252456, 1, 1, 1, 1, 1,
0.8468596, 2.316884, -0.147626, 1, 1, 1, 1, 1,
0.8468896, 1.114034, 0.698485, 1, 1, 1, 1, 1,
0.8469582, -0.1708868, -0.121488, 1, 1, 1, 1, 1,
0.8536647, -0.4143313, 1.023305, 1, 1, 1, 1, 1,
0.8582148, -0.9294838, 1.400335, 1, 1, 1, 1, 1,
0.8620234, -0.1725685, 1.92009, 1, 1, 1, 1, 1,
0.8629484, 0.7760621, 0.5724027, 1, 1, 1, 1, 1,
0.8709257, -0.6195362, 1.814251, 1, 1, 1, 1, 1,
0.8720978, -0.7905271, 4.53504, 1, 1, 1, 1, 1,
0.8742909, -0.1588708, 2.186233, 1, 1, 1, 1, 1,
0.8760152, -0.008890031, 0.8567312, 1, 1, 1, 1, 1,
0.8765228, 0.6633756, 0.855643, 1, 1, 1, 1, 1,
0.8854056, 1.028138, 1.025783, 1, 1, 1, 1, 1,
0.8863534, 1.959501, 2.332689, 1, 1, 1, 1, 1,
0.8952821, -0.6741092, 1.180137, 0, 0, 1, 1, 1,
0.9077252, 0.1685317, 1.176607, 1, 0, 0, 1, 1,
0.9085644, -0.322907, 2.433745, 1, 0, 0, 1, 1,
0.9088318, 0.6112013, -0.6122081, 1, 0, 0, 1, 1,
0.9143782, -0.3172906, 2.529747, 1, 0, 0, 1, 1,
0.9196258, 0.122115, 3.157714, 1, 0, 0, 1, 1,
0.9206157, 1.457831, 1.091335, 0, 0, 0, 1, 1,
0.9247246, 0.05138794, 1.060483, 0, 0, 0, 1, 1,
0.9271916, 1.172017, 0.07220712, 0, 0, 0, 1, 1,
0.928616, -0.6142595, 2.865064, 0, 0, 0, 1, 1,
0.9286903, 0.9517524, 1.26742, 0, 0, 0, 1, 1,
0.933128, -0.5665897, 2.964567, 0, 0, 0, 1, 1,
0.9380113, -0.8393267, 0.3198768, 0, 0, 0, 1, 1,
0.9394984, 3.013722, -0.4543512, 1, 1, 1, 1, 1,
0.9408787, 0.6830106, 1.693217, 1, 1, 1, 1, 1,
0.9443277, 0.1414993, 0.7247272, 1, 1, 1, 1, 1,
0.9493647, 0.08113233, 2.841291, 1, 1, 1, 1, 1,
0.9556023, 0.3534763, 0.9081097, 1, 1, 1, 1, 1,
0.9759107, 0.6293334, -0.6368474, 1, 1, 1, 1, 1,
0.9778205, -0.2837779, 2.563764, 1, 1, 1, 1, 1,
0.9792501, 1.075083, 0.9873058, 1, 1, 1, 1, 1,
0.9883297, 0.1414509, -0.168244, 1, 1, 1, 1, 1,
0.9888374, -0.07486484, 2.812689, 1, 1, 1, 1, 1,
0.9974039, -1.059404, -0.9164064, 1, 1, 1, 1, 1,
0.9983539, 2.091094, 1.188721, 1, 1, 1, 1, 1,
1.001653, 1.166265, 0.568634, 1, 1, 1, 1, 1,
1.006215, 1.012152, -0.3371384, 1, 1, 1, 1, 1,
1.007038, -1.528097, 2.985245, 1, 1, 1, 1, 1,
1.011745, 0.3363321, 1.646811, 0, 0, 1, 1, 1,
1.012758, 0.005332419, 1.680936, 1, 0, 0, 1, 1,
1.015499, -0.8730513, 3.040213, 1, 0, 0, 1, 1,
1.023072, 0.06219332, 0.5201108, 1, 0, 0, 1, 1,
1.031192, -0.2561037, 2.294223, 1, 0, 0, 1, 1,
1.034302, 0.7212239, 0.2013706, 1, 0, 0, 1, 1,
1.034917, 1.073244, 1.708918, 0, 0, 0, 1, 1,
1.039068, -0.7960514, 0.9789983, 0, 0, 0, 1, 1,
1.058733, -1.024882, 2.764229, 0, 0, 0, 1, 1,
1.062474, -0.1043848, 2.495259, 0, 0, 0, 1, 1,
1.066244, -0.1100858, 1.652517, 0, 0, 0, 1, 1,
1.067716, -1.228892, 1.677562, 0, 0, 0, 1, 1,
1.072087, 1.0312, 1.175617, 0, 0, 0, 1, 1,
1.074135, -0.9101063, 3.672348, 1, 1, 1, 1, 1,
1.074212, 0.7057674, -0.0960824, 1, 1, 1, 1, 1,
1.077899, -0.09844085, 2.298147, 1, 1, 1, 1, 1,
1.08054, 0.1051121, 0.1080436, 1, 1, 1, 1, 1,
1.081394, -0.2286442, 1.448487, 1, 1, 1, 1, 1,
1.082487, 0.1769664, 0.9523511, 1, 1, 1, 1, 1,
1.084167, 0.9154528, 2.823534, 1, 1, 1, 1, 1,
1.088971, 0.7506534, 0.9566884, 1, 1, 1, 1, 1,
1.089661, -0.338983, 2.154099, 1, 1, 1, 1, 1,
1.096575, 0.1179344, 1.056669, 1, 1, 1, 1, 1,
1.097139, -0.3653153, 0.9715127, 1, 1, 1, 1, 1,
1.108463, -2.856871, 3.08654, 1, 1, 1, 1, 1,
1.115545, 1.601201, 0.4040872, 1, 1, 1, 1, 1,
1.115805, -0.7459576, 3.14827, 1, 1, 1, 1, 1,
1.130443, -0.7670578, 2.890896, 1, 1, 1, 1, 1,
1.13835, 1.072748, -0.6420885, 0, 0, 1, 1, 1,
1.138613, 0.6899779, 0.4137154, 1, 0, 0, 1, 1,
1.144669, -2.078367, 4.090078, 1, 0, 0, 1, 1,
1.146174, 0.8959379, -0.2493999, 1, 0, 0, 1, 1,
1.151489, 1.074509, -0.7452824, 1, 0, 0, 1, 1,
1.167273, -0.7772924, 1.913515, 1, 0, 0, 1, 1,
1.178961, -0.6871908, 1.66827, 0, 0, 0, 1, 1,
1.178984, 2.678823, 1.087235, 0, 0, 0, 1, 1,
1.186438, -0.07583026, 0.5232391, 0, 0, 0, 1, 1,
1.186734, -0.9546888, 1.639495, 0, 0, 0, 1, 1,
1.186798, 0.933288, 2.479534, 0, 0, 0, 1, 1,
1.188177, 0.957965, 1.204835, 0, 0, 0, 1, 1,
1.196894, 0.3622406, 0.3620576, 0, 0, 0, 1, 1,
1.202177, -0.1383279, 1.971639, 1, 1, 1, 1, 1,
1.203481, 0.9847089, 1.400939, 1, 1, 1, 1, 1,
1.211991, 2.284604, 0.05125607, 1, 1, 1, 1, 1,
1.212498, 0.008915473, 3.429415, 1, 1, 1, 1, 1,
1.218577, -0.7498996, 2.648565, 1, 1, 1, 1, 1,
1.222812, -0.4858055, 0.8869215, 1, 1, 1, 1, 1,
1.223735, 1.497023, -0.8755976, 1, 1, 1, 1, 1,
1.225731, -0.284679, 1.713062, 1, 1, 1, 1, 1,
1.22708, 1.986825, 0.2344562, 1, 1, 1, 1, 1,
1.2321, 0.03895067, 0.2304919, 1, 1, 1, 1, 1,
1.24807, 2.47245, 1.509222, 1, 1, 1, 1, 1,
1.251826, 0.1370562, 0.1036254, 1, 1, 1, 1, 1,
1.25801, 0.01112678, 2.35944, 1, 1, 1, 1, 1,
1.26152, 0.4193011, 2.307377, 1, 1, 1, 1, 1,
1.26571, 0.4676609, 0.7036868, 1, 1, 1, 1, 1,
1.273025, -0.1697387, 1.893466, 0, 0, 1, 1, 1,
1.282453, 0.7292911, 2.063652, 1, 0, 0, 1, 1,
1.290989, 0.5576977, 0.868342, 1, 0, 0, 1, 1,
1.297175, -0.8405322, 0.9318013, 1, 0, 0, 1, 1,
1.299381, -0.4614705, 2.186503, 1, 0, 0, 1, 1,
1.302348, 0.06729154, 1.551216, 1, 0, 0, 1, 1,
1.302862, 0.4367919, 1.663762, 0, 0, 0, 1, 1,
1.317508, 0.06890856, 2.340795, 0, 0, 0, 1, 1,
1.319898, -0.3095934, 2.552216, 0, 0, 0, 1, 1,
1.323708, 2.039194, 0.04371605, 0, 0, 0, 1, 1,
1.33696, 0.7099476, 1.062546, 0, 0, 0, 1, 1,
1.33779, -0.8583622, 2.34616, 0, 0, 0, 1, 1,
1.343125, 1.454557, 1.131471, 0, 0, 0, 1, 1,
1.343688, 1.090515, -0.8292084, 1, 1, 1, 1, 1,
1.347474, 0.04306797, 3.197532, 1, 1, 1, 1, 1,
1.356079, 1.075561, 0.9785873, 1, 1, 1, 1, 1,
1.35751, -2.365249, 4.551398, 1, 1, 1, 1, 1,
1.389042, -0.427862, 0.4129353, 1, 1, 1, 1, 1,
1.4069, 1.868459, 0.6368349, 1, 1, 1, 1, 1,
1.420069, -1.056288, 0.9366662, 1, 1, 1, 1, 1,
1.428101, -0.8632852, 1.210293, 1, 1, 1, 1, 1,
1.428598, 1.377607, 0.220534, 1, 1, 1, 1, 1,
1.439613, 0.8336217, 1.211544, 1, 1, 1, 1, 1,
1.449283, -0.9256691, 2.364117, 1, 1, 1, 1, 1,
1.463524, 0.3635131, 1.906172, 1, 1, 1, 1, 1,
1.473792, -0.5923997, 0.6229096, 1, 1, 1, 1, 1,
1.482302, 0.717652, 1.238918, 1, 1, 1, 1, 1,
1.487992, -0.9039377, 3.644349, 1, 1, 1, 1, 1,
1.490469, -0.4162641, 0.319136, 0, 0, 1, 1, 1,
1.490801, -0.2512862, 2.373376, 1, 0, 0, 1, 1,
1.493005, 0.427065, -0.367053, 1, 0, 0, 1, 1,
1.493305, 0.04832629, 2.077384, 1, 0, 0, 1, 1,
1.49773, -1.785811, 2.853163, 1, 0, 0, 1, 1,
1.504595, 0.9611116, 1.070313, 1, 0, 0, 1, 1,
1.518263, -0.08837222, 1.068512, 0, 0, 0, 1, 1,
1.535888, 0.3790468, 0.8107836, 0, 0, 0, 1, 1,
1.538205, 0.8257332, 0.8260487, 0, 0, 0, 1, 1,
1.538695, 0.1386437, 3.017232, 0, 0, 0, 1, 1,
1.542137, -1.003178, 4.015013, 0, 0, 0, 1, 1,
1.54382, 0.775602, 0.7258752, 0, 0, 0, 1, 1,
1.54549, -0.4139714, 1.756365, 0, 0, 0, 1, 1,
1.551446, 0.3342434, 1.14008, 1, 1, 1, 1, 1,
1.555709, -0.001323979, 1.521157, 1, 1, 1, 1, 1,
1.558439, 1.917985, 2.062878, 1, 1, 1, 1, 1,
1.559773, 2.226959, 1.936774, 1, 1, 1, 1, 1,
1.562493, -0.1499552, 1.006182, 1, 1, 1, 1, 1,
1.565845, -0.306559, 1.319902, 1, 1, 1, 1, 1,
1.571204, -0.6773128, 0.368847, 1, 1, 1, 1, 1,
1.586861, -0.3657177, 1.430387, 1, 1, 1, 1, 1,
1.604032, 0.189784, 3.282841, 1, 1, 1, 1, 1,
1.610687, 0.7053661, 1.546001, 1, 1, 1, 1, 1,
1.613511, -0.5083644, 1.236141, 1, 1, 1, 1, 1,
1.625508, 0.1158015, 0.8008922, 1, 1, 1, 1, 1,
1.633232, 0.2068912, 2.517904, 1, 1, 1, 1, 1,
1.64054, -1.119678, 2.097668, 1, 1, 1, 1, 1,
1.64844, 0.7077414, 1.010517, 1, 1, 1, 1, 1,
1.673345, -0.1624656, 1.691585, 0, 0, 1, 1, 1,
1.683399, 1.202259, 1.966815, 1, 0, 0, 1, 1,
1.708155, -1.410476, 2.721016, 1, 0, 0, 1, 1,
1.715262, 0.6170316, 0.5299358, 1, 0, 0, 1, 1,
1.729226, 0.1446496, 0.908178, 1, 0, 0, 1, 1,
1.736757, -0.3400427, 1.994627, 1, 0, 0, 1, 1,
1.755842, -1.129877, 3.460529, 0, 0, 0, 1, 1,
1.75594, -1.783819, 1.943348, 0, 0, 0, 1, 1,
1.765015, -0.7858618, 1.548367, 0, 0, 0, 1, 1,
1.766458, -0.04456958, 2.58949, 0, 0, 0, 1, 1,
1.77742, -0.1111521, 1.586074, 0, 0, 0, 1, 1,
1.794979, -0.4564232, 1.64513, 0, 0, 0, 1, 1,
1.802136, 1.480465, 1.594507, 0, 0, 0, 1, 1,
1.803487, -1.529787, 3.231805, 1, 1, 1, 1, 1,
1.814685, 0.3645556, 1.286837, 1, 1, 1, 1, 1,
1.814911, -1.741814, 1.493155, 1, 1, 1, 1, 1,
1.814957, 0.09636229, 0.4378917, 1, 1, 1, 1, 1,
1.831366, -0.2328503, 1.829313, 1, 1, 1, 1, 1,
1.839378, -0.4469779, 1.622187, 1, 1, 1, 1, 1,
1.859654, 1.198697, 1.925797, 1, 1, 1, 1, 1,
1.862362, 1.053022, 1.014196, 1, 1, 1, 1, 1,
1.889614, -1.765935, 4.127671, 1, 1, 1, 1, 1,
1.905899, -0.134508, 1.414618, 1, 1, 1, 1, 1,
1.949343, -0.4846042, 1.710829, 1, 1, 1, 1, 1,
1.957958, -1.393375, 2.395177, 1, 1, 1, 1, 1,
1.964746, 0.6848953, 0.09880014, 1, 1, 1, 1, 1,
1.976562, 0.8373951, -0.3422917, 1, 1, 1, 1, 1,
1.993095, 0.8130343, 0.8299314, 1, 1, 1, 1, 1,
2.020621, 0.5320268, 0.8616868, 0, 0, 1, 1, 1,
2.027684, -0.2402867, 4.571933, 1, 0, 0, 1, 1,
2.027957, 1.234871, 2.432033, 1, 0, 0, 1, 1,
2.092086, 0.3584498, 2.585779, 1, 0, 0, 1, 1,
2.094861, 0.3521702, 2.406296, 1, 0, 0, 1, 1,
2.1022, -2.320883, 3.175288, 1, 0, 0, 1, 1,
2.103691, -0.3989327, 2.074887, 0, 0, 0, 1, 1,
2.120736, -2.625551, 1.781717, 0, 0, 0, 1, 1,
2.15681, -0.594351, 2.617826, 0, 0, 0, 1, 1,
2.21201, -1.186896, 3.159718, 0, 0, 0, 1, 1,
2.402945, -0.3431186, 1.980464, 0, 0, 0, 1, 1,
2.406222, -2.550812, 3.79457, 0, 0, 0, 1, 1,
2.43883, 0.3911878, 1.594614, 0, 0, 0, 1, 1,
2.440563, -1.290293, 1.748737, 1, 1, 1, 1, 1,
2.503595, -0.2193754, 2.124785, 1, 1, 1, 1, 1,
2.522701, -0.9694356, 1.980003, 1, 1, 1, 1, 1,
2.562302, -0.7720796, 1.645061, 1, 1, 1, 1, 1,
2.659027, 1.073597, 1.470778, 1, 1, 1, 1, 1,
3.059742, 1.094949, 2.121296, 1, 1, 1, 1, 1,
3.352354, 1.716485, 0.6584106, 1, 1, 1, 1, 1
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
var radius = 10.15352;
var distance = 35.6638;
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
mvMatrix.translate( -0.08359146, -0.03354478, 0.1532485 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.6638);
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
