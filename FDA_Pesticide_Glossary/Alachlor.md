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
-2.991674, 0.4267762, -0.9503221, 1, 0, 0, 1,
-2.72399, 0.4046954, -1.15491, 1, 0.007843138, 0, 1,
-2.634216, 1.130002, -1.142103, 1, 0.01176471, 0, 1,
-2.617277, -0.07912523, -1.323123, 1, 0.01960784, 0, 1,
-2.578379, 2.42149, -0.2624748, 1, 0.02352941, 0, 1,
-2.354641, -0.3355775, -1.514698, 1, 0.03137255, 0, 1,
-2.299083, -0.001344287, -0.5557524, 1, 0.03529412, 0, 1,
-2.266971, -0.3713592, -0.1931117, 1, 0.04313726, 0, 1,
-2.237905, -0.893819, -1.536053, 1, 0.04705882, 0, 1,
-2.234482, 0.1590227, -3.039028, 1, 0.05490196, 0, 1,
-2.230258, 0.8056063, -1.152921, 1, 0.05882353, 0, 1,
-2.171378, -1.489484, -1.44298, 1, 0.06666667, 0, 1,
-2.152196, -1.943269, -1.476438, 1, 0.07058824, 0, 1,
-2.150233, -0.7738522, -1.47114, 1, 0.07843138, 0, 1,
-2.144469, 1.188804, -1.262666, 1, 0.08235294, 0, 1,
-2.109269, -0.6657916, -2.401048, 1, 0.09019608, 0, 1,
-2.098864, -1.099364, -1.572417, 1, 0.09411765, 0, 1,
-2.048688, -0.01974068, 0.0117793, 1, 0.1019608, 0, 1,
-2.044989, -0.06355826, -1.800668, 1, 0.1098039, 0, 1,
-2.034283, -0.7731889, -2.256134, 1, 0.1137255, 0, 1,
-2.024196, -1.717511, -2.5274, 1, 0.1215686, 0, 1,
-2.019863, 0.7975799, -0.3331688, 1, 0.1254902, 0, 1,
-2.016702, 0.4414595, -2.545771, 1, 0.1333333, 0, 1,
-2.013429, -0.5057843, -1.467548, 1, 0.1372549, 0, 1,
-1.991106, -0.4209928, -1.164954, 1, 0.145098, 0, 1,
-1.953942, 1.299935, -1.11466, 1, 0.1490196, 0, 1,
-1.944935, -0.8912332, -2.607381, 1, 0.1568628, 0, 1,
-1.92918, 0.5996771, -1.481633, 1, 0.1607843, 0, 1,
-1.914, -0.7484468, -0.431152, 1, 0.1686275, 0, 1,
-1.900393, 0.8477505, -1.358206, 1, 0.172549, 0, 1,
-1.884975, 0.184236, -2.347888, 1, 0.1803922, 0, 1,
-1.877399, -0.5612995, -3.548229, 1, 0.1843137, 0, 1,
-1.871167, 1.14439, -1.419545, 1, 0.1921569, 0, 1,
-1.867689, -1.54707, -2.258225, 1, 0.1960784, 0, 1,
-1.850235, 0.3121519, -0.7211295, 1, 0.2039216, 0, 1,
-1.844699, 0.7799883, -2.093636, 1, 0.2117647, 0, 1,
-1.840304, -0.2116165, -0.3605513, 1, 0.2156863, 0, 1,
-1.782816, 1.712105, -1.62989, 1, 0.2235294, 0, 1,
-1.763203, 0.5296282, -2.513564, 1, 0.227451, 0, 1,
-1.746598, 0.9916268, -0.291276, 1, 0.2352941, 0, 1,
-1.739839, 1.353358, 0.2287487, 1, 0.2392157, 0, 1,
-1.739183, -0.5850964, -2.020059, 1, 0.2470588, 0, 1,
-1.733528, -0.2379807, -1.784591, 1, 0.2509804, 0, 1,
-1.696012, 0.987406, -1.143283, 1, 0.2588235, 0, 1,
-1.686421, -0.8903352, -1.839129, 1, 0.2627451, 0, 1,
-1.677601, 1.778572, -0.5647884, 1, 0.2705882, 0, 1,
-1.673782, 1.88248, -2.191163, 1, 0.2745098, 0, 1,
-1.652209, 1.117619, -1.404024, 1, 0.282353, 0, 1,
-1.648872, -0.06985918, -4.290699, 1, 0.2862745, 0, 1,
-1.645639, -0.5200934, -3.424813, 1, 0.2941177, 0, 1,
-1.638892, -1.75134, -2.0543, 1, 0.3019608, 0, 1,
-1.631118, -0.4633787, -2.72469, 1, 0.3058824, 0, 1,
-1.628853, -0.145583, -2.344303, 1, 0.3137255, 0, 1,
-1.628007, 0.07759333, -0.5906267, 1, 0.3176471, 0, 1,
-1.626118, -0.2138664, -2.976402, 1, 0.3254902, 0, 1,
-1.625606, -1.137095, -0.5951837, 1, 0.3294118, 0, 1,
-1.623828, -1.364391, -1.8707, 1, 0.3372549, 0, 1,
-1.617972, 0.7205908, -1.974494, 1, 0.3411765, 0, 1,
-1.60842, -0.9445893, -4.063199, 1, 0.3490196, 0, 1,
-1.598045, -0.5275214, -0.7562376, 1, 0.3529412, 0, 1,
-1.59734, -0.4657276, -3.118867, 1, 0.3607843, 0, 1,
-1.581069, -0.4960427, -1.133903, 1, 0.3647059, 0, 1,
-1.575215, 0.3255738, -2.090843, 1, 0.372549, 0, 1,
-1.572134, -1.037911, -1.560117, 1, 0.3764706, 0, 1,
-1.569586, -0.2697954, -1.782463, 1, 0.3843137, 0, 1,
-1.561846, -0.597062, -1.285595, 1, 0.3882353, 0, 1,
-1.559253, 1.159162, 0.1982023, 1, 0.3960784, 0, 1,
-1.555428, 0.676461, -0.814303, 1, 0.4039216, 0, 1,
-1.545412, -0.759244, -2.505547, 1, 0.4078431, 0, 1,
-1.519774, 0.3261341, 0.2860606, 1, 0.4156863, 0, 1,
-1.518061, 0.1713452, -1.199192, 1, 0.4196078, 0, 1,
-1.515679, 0.8033055, -3.464144, 1, 0.427451, 0, 1,
-1.513453, 0.3621126, -1.13859, 1, 0.4313726, 0, 1,
-1.512237, 1.156876, -1.234647, 1, 0.4392157, 0, 1,
-1.504415, 0.2807639, -3.475646, 1, 0.4431373, 0, 1,
-1.499303, 0.3684936, -2.51261, 1, 0.4509804, 0, 1,
-1.492037, 0.1918602, -1.646738, 1, 0.454902, 0, 1,
-1.465619, 0.04666029, -2.501834, 1, 0.4627451, 0, 1,
-1.464136, -1.159465, -4.027228, 1, 0.4666667, 0, 1,
-1.451365, -0.3059825, -2.953593, 1, 0.4745098, 0, 1,
-1.44816, -1.705354, -0.7105212, 1, 0.4784314, 0, 1,
-1.445652, 0.3705812, -2.161088, 1, 0.4862745, 0, 1,
-1.445578, -1.358443, -2.109308, 1, 0.4901961, 0, 1,
-1.439648, -1.001921, -3.917688, 1, 0.4980392, 0, 1,
-1.435173, -0.3983388, -1.306712, 1, 0.5058824, 0, 1,
-1.424468, -0.4926479, -2.003099, 1, 0.509804, 0, 1,
-1.419005, 1.32451, -1.444395, 1, 0.5176471, 0, 1,
-1.41731, 1.112691, -1.643776, 1, 0.5215687, 0, 1,
-1.415117, 1.545, -0.5749651, 1, 0.5294118, 0, 1,
-1.40204, 1.143704, -0.6834318, 1, 0.5333334, 0, 1,
-1.386751, -0.2137389, -0.4678011, 1, 0.5411765, 0, 1,
-1.380186, 1.121607, -1.313354, 1, 0.5450981, 0, 1,
-1.374078, -0.591903, -2.101822, 1, 0.5529412, 0, 1,
-1.352141, -1.808284, -2.858716, 1, 0.5568628, 0, 1,
-1.346684, 0.7706608, -0.8336722, 1, 0.5647059, 0, 1,
-1.336249, 1.582859, -0.4900786, 1, 0.5686275, 0, 1,
-1.331498, -0.5542507, -2.650201, 1, 0.5764706, 0, 1,
-1.330547, 1.012867, -3.349701, 1, 0.5803922, 0, 1,
-1.323313, -0.2238629, -3.339463, 1, 0.5882353, 0, 1,
-1.320706, 1.024419, -1.043769, 1, 0.5921569, 0, 1,
-1.319685, -1.043672, -0.09698098, 1, 0.6, 0, 1,
-1.316773, -0.4157029, -3.183011, 1, 0.6078432, 0, 1,
-1.311988, -0.1615258, -1.41723, 1, 0.6117647, 0, 1,
-1.311554, -0.2120559, -0.7755768, 1, 0.6196079, 0, 1,
-1.306506, -0.1679712, -2.230731, 1, 0.6235294, 0, 1,
-1.305842, -0.4839286, -2.338731, 1, 0.6313726, 0, 1,
-1.296308, -0.4127309, -2.619687, 1, 0.6352941, 0, 1,
-1.29514, -0.2593851, -0.6506522, 1, 0.6431373, 0, 1,
-1.289755, 1.235531, 0.123256, 1, 0.6470588, 0, 1,
-1.287996, -0.3428581, -1.26416, 1, 0.654902, 0, 1,
-1.270367, -0.7505, -0.6942272, 1, 0.6588235, 0, 1,
-1.261065, 0.4536646, 0.2407288, 1, 0.6666667, 0, 1,
-1.260194, 0.5127923, -1.432884, 1, 0.6705883, 0, 1,
-1.257987, 0.2574209, -2.39159, 1, 0.6784314, 0, 1,
-1.256765, 1.039972, -1.312819, 1, 0.682353, 0, 1,
-1.256349, 0.4520045, -1.762766, 1, 0.6901961, 0, 1,
-1.237502, -0.7263701, -1.432, 1, 0.6941177, 0, 1,
-1.234187, -1.799693, -2.936759, 1, 0.7019608, 0, 1,
-1.209066, -1.483879, -1.339117, 1, 0.7098039, 0, 1,
-1.195572, 0.5156604, -1.440933, 1, 0.7137255, 0, 1,
-1.188625, -0.9854383, -2.060096, 1, 0.7215686, 0, 1,
-1.180532, -0.9933305, -1.054548, 1, 0.7254902, 0, 1,
-1.163665, -0.3088392, -2.346481, 1, 0.7333333, 0, 1,
-1.15063, -0.8941954, -4.200855, 1, 0.7372549, 0, 1,
-1.144349, 0.01533586, -1.800187, 1, 0.7450981, 0, 1,
-1.141851, 1.50278, 0.7572688, 1, 0.7490196, 0, 1,
-1.140696, -0.103884, 0.1189461, 1, 0.7568628, 0, 1,
-1.12085, -0.11588, -2.782868, 1, 0.7607843, 0, 1,
-1.118356, -0.2965026, -0.1928472, 1, 0.7686275, 0, 1,
-1.115554, 1.543895, -0.6624265, 1, 0.772549, 0, 1,
-1.113293, 0.6861694, -0.937033, 1, 0.7803922, 0, 1,
-1.108954, -0.6373404, -2.31915, 1, 0.7843137, 0, 1,
-1.108407, 0.824529, 0.1757673, 1, 0.7921569, 0, 1,
-1.104841, -1.212937, -1.457289, 1, 0.7960784, 0, 1,
-1.100819, -1.545577, -1.695913, 1, 0.8039216, 0, 1,
-1.097676, 0.2536904, -0.809998, 1, 0.8117647, 0, 1,
-1.096856, -1.622716, -3.471473, 1, 0.8156863, 0, 1,
-1.091746, 0.3570861, -2.787177, 1, 0.8235294, 0, 1,
-1.081043, 0.0141227, -2.700066, 1, 0.827451, 0, 1,
-1.075751, 0.1254552, -2.679733, 1, 0.8352941, 0, 1,
-1.073848, -0.273569, -2.320697, 1, 0.8392157, 0, 1,
-1.068056, -2.518929, -1.867189, 1, 0.8470588, 0, 1,
-1.064462, 2.144975, 0.2718701, 1, 0.8509804, 0, 1,
-1.059983, 0.2806044, 0.1733918, 1, 0.8588235, 0, 1,
-1.051221, 0.2582361, -2.472407, 1, 0.8627451, 0, 1,
-1.044129, -0.1213629, -1.454415, 1, 0.8705882, 0, 1,
-1.043165, 1.820087, -0.6114165, 1, 0.8745098, 0, 1,
-1.040275, 0.1607983, -1.436107, 1, 0.8823529, 0, 1,
-1.036917, 0.7978997, -0.6566116, 1, 0.8862745, 0, 1,
-1.036626, -0.1299992, -2.798841, 1, 0.8941177, 0, 1,
-1.036149, 0.8190591, -1.123592, 1, 0.8980392, 0, 1,
-1.022265, -1.646038, -2.153022, 1, 0.9058824, 0, 1,
-1.019307, 2.190295, 1.793672, 1, 0.9137255, 0, 1,
-1.012622, 1.430917, -0.749451, 1, 0.9176471, 0, 1,
-1.005678, -2.076009, -2.806153, 1, 0.9254902, 0, 1,
-1.001183, 1.460136, -0.2539596, 1, 0.9294118, 0, 1,
-0.9978576, 0.9610356, -1.171698, 1, 0.9372549, 0, 1,
-0.9956726, -0.6559848, -2.713011, 1, 0.9411765, 0, 1,
-0.9909757, -0.1073764, -2.994985, 1, 0.9490196, 0, 1,
-0.9838803, -0.6261845, -2.706927, 1, 0.9529412, 0, 1,
-0.9724595, -0.8275755, -2.503051, 1, 0.9607843, 0, 1,
-0.9705396, -0.2625596, -2.156021, 1, 0.9647059, 0, 1,
-0.9667024, -0.8591946, -1.258383, 1, 0.972549, 0, 1,
-0.9642224, 1.049941, -0.4671618, 1, 0.9764706, 0, 1,
-0.9617348, 0.7081022, -1.0998, 1, 0.9843137, 0, 1,
-0.9506852, -0.4154023, -1.619484, 1, 0.9882353, 0, 1,
-0.9500029, 0.1787525, -1.213618, 1, 0.9960784, 0, 1,
-0.9487001, -1.485077, -2.370316, 0.9960784, 1, 0, 1,
-0.9452472, 0.8967295, 0.01289547, 0.9921569, 1, 0, 1,
-0.9447621, -0.9636809, -2.734116, 0.9843137, 1, 0, 1,
-0.9441399, -1.395675, -3.490726, 0.9803922, 1, 0, 1,
-0.9437727, -1.272404, -3.057498, 0.972549, 1, 0, 1,
-0.9403546, -1.639767, -2.325775, 0.9686275, 1, 0, 1,
-0.9358615, 2.029558, 0.3356816, 0.9607843, 1, 0, 1,
-0.9341928, -1.064919, -4.55679, 0.9568627, 1, 0, 1,
-0.9278539, -0.5294042, -1.856438, 0.9490196, 1, 0, 1,
-0.9188905, -1.579617, -2.055436, 0.945098, 1, 0, 1,
-0.9145941, 2.346944, -1.515487, 0.9372549, 1, 0, 1,
-0.9020625, 0.9337412, -1.149158, 0.9333333, 1, 0, 1,
-0.8958242, -0.4684284, -1.844688, 0.9254902, 1, 0, 1,
-0.8888781, 0.3724858, -0.3262478, 0.9215686, 1, 0, 1,
-0.8829014, -1.923475, -3.015936, 0.9137255, 1, 0, 1,
-0.8797085, -1.047807, -1.976967, 0.9098039, 1, 0, 1,
-0.8772104, 0.7701665, -0.7502604, 0.9019608, 1, 0, 1,
-0.8764684, 1.774583, -0.6921954, 0.8941177, 1, 0, 1,
-0.8730283, 1.132681, -0.4267065, 0.8901961, 1, 0, 1,
-0.8727114, -0.7141753, -1.0916, 0.8823529, 1, 0, 1,
-0.8703303, 0.9193962, -1.515819, 0.8784314, 1, 0, 1,
-0.8678728, -0.911077, -2.829236, 0.8705882, 1, 0, 1,
-0.8672062, 0.3571507, -0.6938652, 0.8666667, 1, 0, 1,
-0.8670554, -0.09739082, -3.370793, 0.8588235, 1, 0, 1,
-0.8636951, 1.498534, 0.1539176, 0.854902, 1, 0, 1,
-0.8627374, -0.8735942, -2.302772, 0.8470588, 1, 0, 1,
-0.8615462, -2.303892, -1.511315, 0.8431373, 1, 0, 1,
-0.8590475, 0.1180917, -3.091841, 0.8352941, 1, 0, 1,
-0.8559639, -1.525833, -1.078963, 0.8313726, 1, 0, 1,
-0.8552347, -0.0831247, -3.136485, 0.8235294, 1, 0, 1,
-0.8536808, -0.3818627, 0.05801748, 0.8196079, 1, 0, 1,
-0.8463489, 0.3417709, -1.572269, 0.8117647, 1, 0, 1,
-0.8457351, -0.5765193, -3.134662, 0.8078431, 1, 0, 1,
-0.8422612, -0.7951998, -2.802884, 0.8, 1, 0, 1,
-0.8420672, 0.7129088, -0.5013204, 0.7921569, 1, 0, 1,
-0.8400667, -1.577717, -2.321915, 0.7882353, 1, 0, 1,
-0.8389937, 0.1906366, -1.148784, 0.7803922, 1, 0, 1,
-0.8376814, -1.140831, -2.490209, 0.7764706, 1, 0, 1,
-0.8376058, -0.8397627, -3.328641, 0.7686275, 1, 0, 1,
-0.8309536, 0.6044599, 0.5590087, 0.7647059, 1, 0, 1,
-0.8266993, -0.4112617, -2.323072, 0.7568628, 1, 0, 1,
-0.8216471, 0.2030308, -0.1162218, 0.7529412, 1, 0, 1,
-0.8140684, 0.687902, -4.025883, 0.7450981, 1, 0, 1,
-0.8056656, 0.2993194, -1.886853, 0.7411765, 1, 0, 1,
-0.7982896, 0.05146411, -1.680998, 0.7333333, 1, 0, 1,
-0.7936875, -0.08894176, -0.2168482, 0.7294118, 1, 0, 1,
-0.7885615, -1.58257, -3.002762, 0.7215686, 1, 0, 1,
-0.7872779, 2.365287, 0.4549288, 0.7176471, 1, 0, 1,
-0.7816848, 0.2523121, 0.4744501, 0.7098039, 1, 0, 1,
-0.7793627, 0.9445149, -1.242011, 0.7058824, 1, 0, 1,
-0.7772269, 1.377796, -1.794012, 0.6980392, 1, 0, 1,
-0.7754083, 1.777436, -1.267548, 0.6901961, 1, 0, 1,
-0.7724902, -1.058281, -3.165689, 0.6862745, 1, 0, 1,
-0.767343, 0.1139546, -1.731956, 0.6784314, 1, 0, 1,
-0.7656736, 0.1132552, -2.224045, 0.6745098, 1, 0, 1,
-0.7624177, 0.6821501, -1.761709, 0.6666667, 1, 0, 1,
-0.760763, -0.9378007, -2.939634, 0.6627451, 1, 0, 1,
-0.7583258, -0.09309838, -2.218109, 0.654902, 1, 0, 1,
-0.7569912, -1.510114, -2.008805, 0.6509804, 1, 0, 1,
-0.7520847, -1.02139, -1.868363, 0.6431373, 1, 0, 1,
-0.7463413, 0.226396, -2.139895, 0.6392157, 1, 0, 1,
-0.7447272, 0.6031976, 0.02655696, 0.6313726, 1, 0, 1,
-0.7446144, 2.017671, -0.3270957, 0.627451, 1, 0, 1,
-0.739378, 1.625088, -0.2700804, 0.6196079, 1, 0, 1,
-0.7388908, -0.6225105, -2.300549, 0.6156863, 1, 0, 1,
-0.7375225, -0.2883501, -2.868719, 0.6078432, 1, 0, 1,
-0.7326519, 1.021801, -1.539878, 0.6039216, 1, 0, 1,
-0.7264647, 1.431945, -0.5074249, 0.5960785, 1, 0, 1,
-0.7263011, 0.3997028, -1.420444, 0.5882353, 1, 0, 1,
-0.7244908, -0.6556733, -2.205168, 0.5843138, 1, 0, 1,
-0.7228726, -0.2608028, -2.968165, 0.5764706, 1, 0, 1,
-0.7171414, -0.9597824, -2.934701, 0.572549, 1, 0, 1,
-0.7149203, 0.4275658, -0.8715463, 0.5647059, 1, 0, 1,
-0.7022023, 0.7105723, 0.7825752, 0.5607843, 1, 0, 1,
-0.7016369, -0.03476205, -0.4339592, 0.5529412, 1, 0, 1,
-0.6942805, -1.371218, -2.805708, 0.5490196, 1, 0, 1,
-0.690434, -0.7226686, -1.326411, 0.5411765, 1, 0, 1,
-0.6889057, -0.5967975, -3.103833, 0.5372549, 1, 0, 1,
-0.6868273, -0.253061, -2.834055, 0.5294118, 1, 0, 1,
-0.6826168, 1.91256, -1.628159, 0.5254902, 1, 0, 1,
-0.6816467, -0.4068209, -2.309572, 0.5176471, 1, 0, 1,
-0.67557, 0.5066932, 1.746541, 0.5137255, 1, 0, 1,
-0.6748147, 0.6799491, -1.095099, 0.5058824, 1, 0, 1,
-0.6733745, 1.212115, -0.6265614, 0.5019608, 1, 0, 1,
-0.6686229, 0.7531984, 0.4716519, 0.4941176, 1, 0, 1,
-0.6652452, -1.075243, -1.150626, 0.4862745, 1, 0, 1,
-0.662214, 0.09815796, -0.7759373, 0.4823529, 1, 0, 1,
-0.6546938, -1.955757, -3.920306, 0.4745098, 1, 0, 1,
-0.6531348, -0.3494762, -1.29873, 0.4705882, 1, 0, 1,
-0.6529998, -1.319682, -3.505766, 0.4627451, 1, 0, 1,
-0.6510717, -0.1539801, -1.304555, 0.4588235, 1, 0, 1,
-0.6508607, 0.7187613, 0.3870955, 0.4509804, 1, 0, 1,
-0.6505337, 0.02600125, -0.4284938, 0.4470588, 1, 0, 1,
-0.650197, -0.4478724, -4.134234, 0.4392157, 1, 0, 1,
-0.644464, 0.121653, -1.507356, 0.4352941, 1, 0, 1,
-0.643521, -0.3024137, -1.412686, 0.427451, 1, 0, 1,
-0.6431409, -1.457056, -2.775884, 0.4235294, 1, 0, 1,
-0.6388117, -0.7548811, -1.916793, 0.4156863, 1, 0, 1,
-0.6292405, -0.3464464, -2.206547, 0.4117647, 1, 0, 1,
-0.6248236, 0.1224255, -2.586666, 0.4039216, 1, 0, 1,
-0.6218972, -1.011293, -3.088249, 0.3960784, 1, 0, 1,
-0.6216955, 1.23573, 0.9416993, 0.3921569, 1, 0, 1,
-0.6211559, 2.627177, -0.1904555, 0.3843137, 1, 0, 1,
-0.620822, 0.4678901, -1.569564, 0.3803922, 1, 0, 1,
-0.6206019, -0.4803486, -1.444701, 0.372549, 1, 0, 1,
-0.6182158, 2.271961, 1.007316, 0.3686275, 1, 0, 1,
-0.6167217, -0.4976596, -4.128551, 0.3607843, 1, 0, 1,
-0.6155766, -1.223094, -1.264771, 0.3568628, 1, 0, 1,
-0.6133557, 1.388333, -1.673856, 0.3490196, 1, 0, 1,
-0.6128685, 1.389791, 0.03576102, 0.345098, 1, 0, 1,
-0.6127399, -1.609327, -3.867998, 0.3372549, 1, 0, 1,
-0.608512, 0.1797649, -0.4040728, 0.3333333, 1, 0, 1,
-0.6062919, -2.07244, -2.085739, 0.3254902, 1, 0, 1,
-0.6059946, -0.5194731, -2.816166, 0.3215686, 1, 0, 1,
-0.6057228, 0.471224, -0.3124972, 0.3137255, 1, 0, 1,
-0.6045191, -0.5491898, -3.022231, 0.3098039, 1, 0, 1,
-0.6038262, 0.0592445, -1.653787, 0.3019608, 1, 0, 1,
-0.6017958, -1.160925, -2.564551, 0.2941177, 1, 0, 1,
-0.6006548, 0.1064984, -2.31028, 0.2901961, 1, 0, 1,
-0.5995079, -0.4000768, -2.162003, 0.282353, 1, 0, 1,
-0.5950258, -0.6428922, -1.931983, 0.2784314, 1, 0, 1,
-0.5916526, 1.094694, -0.635522, 0.2705882, 1, 0, 1,
-0.5916227, 1.278348, -1.233325, 0.2666667, 1, 0, 1,
-0.5915152, 1.000704, 0.3224497, 0.2588235, 1, 0, 1,
-0.5895272, 0.6619277, -1.315565, 0.254902, 1, 0, 1,
-0.5894674, 0.990567, -1.588183, 0.2470588, 1, 0, 1,
-0.5867701, -0.05307756, -3.387983, 0.2431373, 1, 0, 1,
-0.5865738, -1.102498, -2.924481, 0.2352941, 1, 0, 1,
-0.5772529, -0.4378633, -2.379335, 0.2313726, 1, 0, 1,
-0.5750787, -0.7904693, -3.091876, 0.2235294, 1, 0, 1,
-0.5729342, -0.5506791, -3.928555, 0.2196078, 1, 0, 1,
-0.5667146, 1.576041, 0.1341654, 0.2117647, 1, 0, 1,
-0.5574328, 0.9970809, -1.550876, 0.2078431, 1, 0, 1,
-0.553386, -0.7958328, -3.437384, 0.2, 1, 0, 1,
-0.5485684, -0.2413945, -2.842758, 0.1921569, 1, 0, 1,
-0.5476933, -1.201028, -2.59109, 0.1882353, 1, 0, 1,
-0.5468423, -0.810914, -2.735466, 0.1803922, 1, 0, 1,
-0.5451753, -1.167871, -3.751081, 0.1764706, 1, 0, 1,
-0.5438033, -0.05780892, -1.875042, 0.1686275, 1, 0, 1,
-0.5410765, 0.1891055, -0.6604222, 0.1647059, 1, 0, 1,
-0.540305, -0.4931807, -2.988012, 0.1568628, 1, 0, 1,
-0.5394121, -0.4283579, -1.951495, 0.1529412, 1, 0, 1,
-0.5336571, 0.08842028, 0.4875659, 0.145098, 1, 0, 1,
-0.5288744, 0.9474187, -3.046426, 0.1411765, 1, 0, 1,
-0.5265046, -1.239621, -2.456262, 0.1333333, 1, 0, 1,
-0.5261322, 0.3235787, -2.300889, 0.1294118, 1, 0, 1,
-0.5259255, 1.412995, 0.8293997, 0.1215686, 1, 0, 1,
-0.5254851, 0.6639472, -0.443466, 0.1176471, 1, 0, 1,
-0.5236068, -1.127517, -3.011507, 0.1098039, 1, 0, 1,
-0.5225776, -1.03541, -1.678607, 0.1058824, 1, 0, 1,
-0.5222439, -0.9376076, -2.997459, 0.09803922, 1, 0, 1,
-0.520954, -0.3812936, -2.244726, 0.09019608, 1, 0, 1,
-0.5159018, -1.088859, -4.35712, 0.08627451, 1, 0, 1,
-0.5123406, 0.3982383, -2.976215, 0.07843138, 1, 0, 1,
-0.5082477, -1.234581, -1.110651, 0.07450981, 1, 0, 1,
-0.503841, -0.3727699, -0.8639029, 0.06666667, 1, 0, 1,
-0.5035375, -0.7642271, -2.33134, 0.0627451, 1, 0, 1,
-0.5034242, 0.2489087, -1.94743, 0.05490196, 1, 0, 1,
-0.5033891, 1.520474, -0.5150887, 0.05098039, 1, 0, 1,
-0.5032031, -0.4935664, -2.112535, 0.04313726, 1, 0, 1,
-0.4985596, 0.6821494, -0.7692199, 0.03921569, 1, 0, 1,
-0.4924137, -0.5979273, -1.914489, 0.03137255, 1, 0, 1,
-0.4857667, 0.9885072, 0.4890886, 0.02745098, 1, 0, 1,
-0.4836192, -1.087228, -1.271445, 0.01960784, 1, 0, 1,
-0.4802709, 0.5002128, 0.8409458, 0.01568628, 1, 0, 1,
-0.4783704, 0.5497776, -1.625991, 0.007843138, 1, 0, 1,
-0.4736782, 0.2817935, -0.4753708, 0.003921569, 1, 0, 1,
-0.4698152, 0.1932966, -2.001744, 0, 1, 0.003921569, 1,
-0.4638357, 0.2796481, -0.9511421, 0, 1, 0.01176471, 1,
-0.4620458, -0.2934277, -3.248037, 0, 1, 0.01568628, 1,
-0.4604146, 1.478518, -1.264612, 0, 1, 0.02352941, 1,
-0.4591526, -0.583509, -1.63209, 0, 1, 0.02745098, 1,
-0.4549068, -0.4317997, -2.503064, 0, 1, 0.03529412, 1,
-0.4500665, -0.5419186, -1.635198, 0, 1, 0.03921569, 1,
-0.4489283, 0.9832581, -0.7125561, 0, 1, 0.04705882, 1,
-0.4479318, -1.085307, -4.087555, 0, 1, 0.05098039, 1,
-0.441804, 0.2109333, -1.630752, 0, 1, 0.05882353, 1,
-0.4410731, 0.08689601, -0.3565972, 0, 1, 0.0627451, 1,
-0.4353632, 1.240264, -2.111444, 0, 1, 0.07058824, 1,
-0.4349959, 0.04912462, -2.364458, 0, 1, 0.07450981, 1,
-0.4334191, -0.6799724, -1.901172, 0, 1, 0.08235294, 1,
-0.4318257, -0.4505731, -3.27908, 0, 1, 0.08627451, 1,
-0.4280914, 0.6289756, 0.08186784, 0, 1, 0.09411765, 1,
-0.4270281, 0.1036047, -0.7361549, 0, 1, 0.1019608, 1,
-0.4244377, -0.286617, -4.847011, 0, 1, 0.1058824, 1,
-0.4239406, 0.3513791, -2.298995, 0, 1, 0.1137255, 1,
-0.4231191, 2.121505, -1.078918, 0, 1, 0.1176471, 1,
-0.4219263, -1.849825, -4.154232, 0, 1, 0.1254902, 1,
-0.4203178, -1.313996, -4.31157, 0, 1, 0.1294118, 1,
-0.4194329, 0.02407756, -0.340093, 0, 1, 0.1372549, 1,
-0.4169815, 1.441887, -0.1664886, 0, 1, 0.1411765, 1,
-0.4168558, 2.5595, 0.1813247, 0, 1, 0.1490196, 1,
-0.4155602, 0.543101, -1.771259, 0, 1, 0.1529412, 1,
-0.4112085, -0.4506579, -1.27762, 0, 1, 0.1607843, 1,
-0.4098993, 0.239889, -2.814972, 0, 1, 0.1647059, 1,
-0.4097146, 1.050735, -1.313408, 0, 1, 0.172549, 1,
-0.4096209, 0.09312982, -2.926852, 0, 1, 0.1764706, 1,
-0.4065676, -0.02539209, -1.28846, 0, 1, 0.1843137, 1,
-0.4059174, -0.02704174, 0.5717532, 0, 1, 0.1882353, 1,
-0.4036793, -0.8346028, -2.553868, 0, 1, 0.1960784, 1,
-0.3932843, -0.7877259, -2.405658, 0, 1, 0.2039216, 1,
-0.3930177, 2.531706, 1.21046, 0, 1, 0.2078431, 1,
-0.3864245, 0.6644478, 0.1586611, 0, 1, 0.2156863, 1,
-0.3782081, 3.065926, 1.744399, 0, 1, 0.2196078, 1,
-0.3755201, -0.1872624, -3.836966, 0, 1, 0.227451, 1,
-0.375148, -0.2150304, -0.3599874, 0, 1, 0.2313726, 1,
-0.3738, -0.2152046, -0.8908578, 0, 1, 0.2392157, 1,
-0.3619044, 0.4215071, -0.1218494, 0, 1, 0.2431373, 1,
-0.3606666, 0.1304573, -2.046579, 0, 1, 0.2509804, 1,
-0.3603358, 1.758754, 1.098185, 0, 1, 0.254902, 1,
-0.3570715, 0.04764304, -1.192976, 0, 1, 0.2627451, 1,
-0.3554085, 1.527685, -0.3346719, 0, 1, 0.2666667, 1,
-0.3514914, -0.8961717, -3.152767, 0, 1, 0.2745098, 1,
-0.341134, 1.806308, -0.8548897, 0, 1, 0.2784314, 1,
-0.3386196, -1.040891, -4.066738, 0, 1, 0.2862745, 1,
-0.3366204, 1.196696, 2.157806, 0, 1, 0.2901961, 1,
-0.3355708, 0.1278013, -1.805702, 0, 1, 0.2980392, 1,
-0.3319246, 0.04017754, 0.9663201, 0, 1, 0.3058824, 1,
-0.3296914, -0.780022, -2.927451, 0, 1, 0.3098039, 1,
-0.3170429, -0.000893298, -1.618289, 0, 1, 0.3176471, 1,
-0.3160322, 1.158214, 0.5570631, 0, 1, 0.3215686, 1,
-0.3156792, -1.113447, -3.208915, 0, 1, 0.3294118, 1,
-0.3145679, -0.02540114, -0.9154873, 0, 1, 0.3333333, 1,
-0.3116914, -0.06548703, -2.039185, 0, 1, 0.3411765, 1,
-0.3105493, 1.262789, -0.9967156, 0, 1, 0.345098, 1,
-0.308006, 0.3141838, 0.06315584, 0, 1, 0.3529412, 1,
-0.3068053, -1.085918, -4.377324, 0, 1, 0.3568628, 1,
-0.3048054, 1.189607, 0.3654643, 0, 1, 0.3647059, 1,
-0.3001347, -0.5700487, -1.664631, 0, 1, 0.3686275, 1,
-0.2960272, -0.6258705, -4.477073, 0, 1, 0.3764706, 1,
-0.2953955, 0.5350487, -1.618341, 0, 1, 0.3803922, 1,
-0.2932986, -0.803348, -2.674587, 0, 1, 0.3882353, 1,
-0.292086, 2.41799, 1.921113, 0, 1, 0.3921569, 1,
-0.2866774, -0.6822682, -3.813941, 0, 1, 0.4, 1,
-0.2843949, 2.17526, 1.034413, 0, 1, 0.4078431, 1,
-0.2841806, -1.115439, 0.2281697, 0, 1, 0.4117647, 1,
-0.2828673, -0.1121782, -2.610668, 0, 1, 0.4196078, 1,
-0.2802577, 0.9783635, -0.4903482, 0, 1, 0.4235294, 1,
-0.2790286, 0.3764262, -0.9903321, 0, 1, 0.4313726, 1,
-0.2740912, 0.9733022, 0.32787, 0, 1, 0.4352941, 1,
-0.2714261, -0.1221867, -1.594744, 0, 1, 0.4431373, 1,
-0.2657289, -1.531595, -3.385832, 0, 1, 0.4470588, 1,
-0.2569666, 1.587798, -1.339134, 0, 1, 0.454902, 1,
-0.2560479, 1.456265, -0.1502884, 0, 1, 0.4588235, 1,
-0.2552617, 1.810839, -0.5207145, 0, 1, 0.4666667, 1,
-0.2528718, 1.842001, 0.9922619, 0, 1, 0.4705882, 1,
-0.2464745, 1.703714, -0.5827438, 0, 1, 0.4784314, 1,
-0.2464226, -0.4759311, -3.738633, 0, 1, 0.4823529, 1,
-0.2448993, -1.488383, -3.967727, 0, 1, 0.4901961, 1,
-0.2445229, -1.417645, -2.37779, 0, 1, 0.4941176, 1,
-0.242451, 1.08922, 0.4894761, 0, 1, 0.5019608, 1,
-0.2370078, -0.1634452, -1.518341, 0, 1, 0.509804, 1,
-0.2336561, -1.15939, -2.028549, 0, 1, 0.5137255, 1,
-0.2333621, -1.722457, -2.725804, 0, 1, 0.5215687, 1,
-0.2324826, 1.027035, -1.018734, 0, 1, 0.5254902, 1,
-0.2284042, 0.66952, 0.9311519, 0, 1, 0.5333334, 1,
-0.227886, -1.397695, -1.981939, 0, 1, 0.5372549, 1,
-0.2276363, -1.783336, -2.511716, 0, 1, 0.5450981, 1,
-0.2228337, 0.7120387, -0.9375681, 0, 1, 0.5490196, 1,
-0.221842, -0.7281708, -2.874669, 0, 1, 0.5568628, 1,
-0.2185844, -0.5627866, -4.361568, 0, 1, 0.5607843, 1,
-0.2169361, 0.6623995, 0.9581099, 0, 1, 0.5686275, 1,
-0.212877, 1.134967, -1.592186, 0, 1, 0.572549, 1,
-0.2105686, 0.300998, -2.340714, 0, 1, 0.5803922, 1,
-0.206477, 0.9088533, -0.9359061, 0, 1, 0.5843138, 1,
-0.2024011, -0.1564817, -1.148011, 0, 1, 0.5921569, 1,
-0.2011041, -0.5722901, -2.736788, 0, 1, 0.5960785, 1,
-0.1967086, 0.3854323, 0.1923986, 0, 1, 0.6039216, 1,
-0.1956292, 1.278407, 0.006842542, 0, 1, 0.6117647, 1,
-0.1953458, -0.5295383, -3.036889, 0, 1, 0.6156863, 1,
-0.1939495, 1.74013, 1.275703, 0, 1, 0.6235294, 1,
-0.1920031, 0.2341324, -0.7263794, 0, 1, 0.627451, 1,
-0.189814, 0.5379808, -0.1869062, 0, 1, 0.6352941, 1,
-0.1851175, -0.7839886, -2.982597, 0, 1, 0.6392157, 1,
-0.1668567, -0.4649224, -2.523303, 0, 1, 0.6470588, 1,
-0.1647935, 0.527405, 0.2790817, 0, 1, 0.6509804, 1,
-0.1632355, 0.8670899, -1.598127, 0, 1, 0.6588235, 1,
-0.1625698, 1.458088, -0.653813, 0, 1, 0.6627451, 1,
-0.1541623, -0.2178725, -2.830717, 0, 1, 0.6705883, 1,
-0.1535931, -0.7870054, -4.1615, 0, 1, 0.6745098, 1,
-0.1485242, -0.5648775, -3.897809, 0, 1, 0.682353, 1,
-0.1470534, -2.007666, -4.490969, 0, 1, 0.6862745, 1,
-0.1469259, -1.459804, -4.125263, 0, 1, 0.6941177, 1,
-0.1457531, 0.7470907, -0.9135984, 0, 1, 0.7019608, 1,
-0.1453926, -0.3975047, -2.414487, 0, 1, 0.7058824, 1,
-0.1408096, 0.2757694, -0.9491587, 0, 1, 0.7137255, 1,
-0.1401186, 0.569854, 0.4453488, 0, 1, 0.7176471, 1,
-0.1393735, 0.3600813, 1.615484, 0, 1, 0.7254902, 1,
-0.1353801, -2.393151, -1.998608, 0, 1, 0.7294118, 1,
-0.1321936, -1.180273, -2.737041, 0, 1, 0.7372549, 1,
-0.1251901, 1.040684, -0.5560375, 0, 1, 0.7411765, 1,
-0.1209111, -1.477366, -3.207842, 0, 1, 0.7490196, 1,
-0.1134419, -2.075089, -2.327267, 0, 1, 0.7529412, 1,
-0.1124848, 0.863323, -0.9467333, 0, 1, 0.7607843, 1,
-0.1111726, 0.7382234, 0.01309575, 0, 1, 0.7647059, 1,
-0.1094013, -0.2364069, -2.419668, 0, 1, 0.772549, 1,
-0.1083691, -1.289062, -4.035602, 0, 1, 0.7764706, 1,
-0.1079925, 1.655961, -0.4089079, 0, 1, 0.7843137, 1,
-0.1073636, -0.1311505, -1.277978, 0, 1, 0.7882353, 1,
-0.09963728, -0.2880509, -2.850738, 0, 1, 0.7960784, 1,
-0.09804505, 0.4447958, 0.6174223, 0, 1, 0.8039216, 1,
-0.09217212, 0.09831504, -0.5061404, 0, 1, 0.8078431, 1,
-0.09197374, -0.7483765, -4.171204, 0, 1, 0.8156863, 1,
-0.08887067, 1.352359, -0.8046883, 0, 1, 0.8196079, 1,
-0.08844747, -0.0945526, -2.408262, 0, 1, 0.827451, 1,
-0.08418465, 0.1936729, -0.3188385, 0, 1, 0.8313726, 1,
-0.08233689, 0.1130261, -0.7118672, 0, 1, 0.8392157, 1,
-0.08176884, -1.317732, -2.215247, 0, 1, 0.8431373, 1,
-0.08035495, 1.005324, -0.6296201, 0, 1, 0.8509804, 1,
-0.07983126, -1.015271, -1.283858, 0, 1, 0.854902, 1,
-0.07902879, 0.4557542, -0.9090062, 0, 1, 0.8627451, 1,
-0.07594198, 0.2615462, -0.7877215, 0, 1, 0.8666667, 1,
-0.07525086, 1.954419, -1.145234, 0, 1, 0.8745098, 1,
-0.07514349, -0.3374302, -2.387952, 0, 1, 0.8784314, 1,
-0.07453169, -0.6963617, -2.513879, 0, 1, 0.8862745, 1,
-0.07427866, 0.4724979, 0.214957, 0, 1, 0.8901961, 1,
-0.07051311, -0.6237285, -4.457276, 0, 1, 0.8980392, 1,
-0.07014914, -1.293122, -1.790039, 0, 1, 0.9058824, 1,
-0.06268491, -1.041471, -1.905483, 0, 1, 0.9098039, 1,
-0.06207779, -0.2908602, -3.316234, 0, 1, 0.9176471, 1,
-0.05810485, -0.2894765, -3.684665, 0, 1, 0.9215686, 1,
-0.0560184, -1.080243, -2.082825, 0, 1, 0.9294118, 1,
-0.05435064, 0.9528118, -0.02595112, 0, 1, 0.9333333, 1,
-0.05049065, -0.07367019, -2.314212, 0, 1, 0.9411765, 1,
-0.04341549, 0.6359388, -0.6532257, 0, 1, 0.945098, 1,
-0.04169668, 0.8119485, 1.78173, 0, 1, 0.9529412, 1,
-0.0409155, 0.2620099, -0.1719023, 0, 1, 0.9568627, 1,
-0.03773622, 0.2693026, 0.04249668, 0, 1, 0.9647059, 1,
-0.03643403, 0.1155141, -1.64581, 0, 1, 0.9686275, 1,
-0.0338906, 1.295177, 0.08370025, 0, 1, 0.9764706, 1,
-0.03253613, 0.0002376364, 0.5512862, 0, 1, 0.9803922, 1,
-0.03170618, 1.092376, -1.261771, 0, 1, 0.9882353, 1,
-0.02756377, 0.3489955, -0.9616935, 0, 1, 0.9921569, 1,
-0.02579462, 1.149351, 0.141505, 0, 1, 1, 1,
-0.02246687, -0.06776719, -2.950727, 0, 0.9921569, 1, 1,
-0.01468131, -0.4696799, -2.327684, 0, 0.9882353, 1, 1,
-0.01461517, -2.649438, -2.126436, 0, 0.9803922, 1, 1,
-0.01423079, -1.588634, -0.9396105, 0, 0.9764706, 1, 1,
-0.01275472, 1.152835, 2.134762, 0, 0.9686275, 1, 1,
-0.01101058, -0.1644251, -2.410715, 0, 0.9647059, 1, 1,
-0.01010466, 0.3052569, -1.270386, 0, 0.9568627, 1, 1,
-0.009143882, 2.622705, 0.6432222, 0, 0.9529412, 1, 1,
-0.006150647, -0.5034717, -4.221878, 0, 0.945098, 1, 1,
-0.004229804, 1.458303, -0.1662691, 0, 0.9411765, 1, 1,
-0.003647331, -0.2274061, -4.827596, 0, 0.9333333, 1, 1,
-0.001960278, -0.5952914, -2.735152, 0, 0.9294118, 1, 1,
-0.0002160666, 0.1146659, -0.8132015, 0, 0.9215686, 1, 1,
-0.0001464568, -1.175162, -3.036306, 0, 0.9176471, 1, 1,
0.001392301, -0.5794451, 3.368462, 0, 0.9098039, 1, 1,
0.004379093, -0.9451053, 3.121121, 0, 0.9058824, 1, 1,
0.00765107, 1.014288, 0.8081149, 0, 0.8980392, 1, 1,
0.00891908, -1.047862, 3.199891, 0, 0.8901961, 1, 1,
0.01337737, 0.3606113, 0.4656737, 0, 0.8862745, 1, 1,
0.01564566, -0.7142918, 3.453839, 0, 0.8784314, 1, 1,
0.01927043, -0.4139962, 3.089116, 0, 0.8745098, 1, 1,
0.02880206, -0.8352435, 2.718331, 0, 0.8666667, 1, 1,
0.02927496, -1.048408, 2.737134, 0, 0.8627451, 1, 1,
0.03084756, 0.3696198, 0.5026909, 0, 0.854902, 1, 1,
0.03150887, -0.8913805, 1.926465, 0, 0.8509804, 1, 1,
0.03218092, -1.467301, 4.238584, 0, 0.8431373, 1, 1,
0.03347636, 0.2697729, 1.232478, 0, 0.8392157, 1, 1,
0.04565053, -0.9787452, 3.505165, 0, 0.8313726, 1, 1,
0.04731783, -0.3469791, 1.952023, 0, 0.827451, 1, 1,
0.04738719, -1.100721, 2.752284, 0, 0.8196079, 1, 1,
0.04844694, 0.0009334128, 2.4089, 0, 0.8156863, 1, 1,
0.05058039, 0.6175025, -1.220872, 0, 0.8078431, 1, 1,
0.05358285, 1.797284, 1.687473, 0, 0.8039216, 1, 1,
0.06067474, 1.083302, 1.79938, 0, 0.7960784, 1, 1,
0.06265534, -1.137625, 2.659157, 0, 0.7882353, 1, 1,
0.06621117, -0.01411717, 2.600867, 0, 0.7843137, 1, 1,
0.07042413, -0.4718543, 2.022748, 0, 0.7764706, 1, 1,
0.07177128, -1.265468, 1.527244, 0, 0.772549, 1, 1,
0.0738085, -0.3672571, 2.441317, 0, 0.7647059, 1, 1,
0.07439481, -2.638192, 1.753094, 0, 0.7607843, 1, 1,
0.07495096, -1.886559, 2.256269, 0, 0.7529412, 1, 1,
0.07498093, -0.6366513, 2.327442, 0, 0.7490196, 1, 1,
0.07952344, -1.756597, 3.606458, 0, 0.7411765, 1, 1,
0.0811364, 0.7751899, 0.9732866, 0, 0.7372549, 1, 1,
0.0927212, -0.7271615, 3.387238, 0, 0.7294118, 1, 1,
0.09616403, -0.563474, 2.082335, 0, 0.7254902, 1, 1,
0.09923916, -0.823926, 2.207011, 0, 0.7176471, 1, 1,
0.1049151, 0.4272781, 0.5315415, 0, 0.7137255, 1, 1,
0.110209, -0.2232341, 2.600122, 0, 0.7058824, 1, 1,
0.1146211, -1.021737, 4.831364, 0, 0.6980392, 1, 1,
0.1155401, 0.3791137, 0.9140672, 0, 0.6941177, 1, 1,
0.1181307, 0.03211872, 1.386673, 0, 0.6862745, 1, 1,
0.120204, 1.719723, 2.097096, 0, 0.682353, 1, 1,
0.1228174, -1.336627, 1.774204, 0, 0.6745098, 1, 1,
0.1260547, -0.8920614, 3.301971, 0, 0.6705883, 1, 1,
0.1287555, -2.746944, 3.280111, 0, 0.6627451, 1, 1,
0.1403058, 1.052375, 1.127562, 0, 0.6588235, 1, 1,
0.1410787, 0.5658131, -0.5118705, 0, 0.6509804, 1, 1,
0.1419954, -0.1676886, 2.853734, 0, 0.6470588, 1, 1,
0.1427674, -0.2162312, 2.4839, 0, 0.6392157, 1, 1,
0.1445667, 2.595901, -0.9988275, 0, 0.6352941, 1, 1,
0.1475177, -1.104047, 1.975982, 0, 0.627451, 1, 1,
0.1495948, -0.8476998, 3.269514, 0, 0.6235294, 1, 1,
0.1501191, -1.620281, 2.508833, 0, 0.6156863, 1, 1,
0.1503078, 1.384648, 0.6707355, 0, 0.6117647, 1, 1,
0.1505147, -1.041478, 2.506273, 0, 0.6039216, 1, 1,
0.1570692, -0.8070093, 3.037679, 0, 0.5960785, 1, 1,
0.1615746, 1.115067, 0.7543926, 0, 0.5921569, 1, 1,
0.1631166, 1.98131, -0.6257811, 0, 0.5843138, 1, 1,
0.1684581, -1.055182, 3.262916, 0, 0.5803922, 1, 1,
0.1695868, -0.8190254, 2.998451, 0, 0.572549, 1, 1,
0.1726491, 0.6453482, -1.273489, 0, 0.5686275, 1, 1,
0.1727162, 0.03296492, 2.52376, 0, 0.5607843, 1, 1,
0.1763131, 0.07484427, 1.53927, 0, 0.5568628, 1, 1,
0.1812805, 0.03411866, 2.251899, 0, 0.5490196, 1, 1,
0.182944, 1.06292, 0.2753763, 0, 0.5450981, 1, 1,
0.1862509, -1.480474, 3.44702, 0, 0.5372549, 1, 1,
0.1903686, 0.09105141, 2.389004, 0, 0.5333334, 1, 1,
0.1923899, 0.9247479, 1.58633, 0, 0.5254902, 1, 1,
0.1955174, 0.1110271, 1.169588, 0, 0.5215687, 1, 1,
0.1974467, 0.6311869, -0.8405982, 0, 0.5137255, 1, 1,
0.2028216, 0.08267356, 1.582805, 0, 0.509804, 1, 1,
0.2050013, -1.863915, 1.57543, 0, 0.5019608, 1, 1,
0.2057042, -0.1912461, 1.663869, 0, 0.4941176, 1, 1,
0.2100995, -0.7858489, 3.379983, 0, 0.4901961, 1, 1,
0.2108211, -1.471117, 3.02672, 0, 0.4823529, 1, 1,
0.2112772, 1.110919, 2.020983, 0, 0.4784314, 1, 1,
0.2123728, 0.188229, -0.1380938, 0, 0.4705882, 1, 1,
0.2150607, 0.3662794, 1.883358, 0, 0.4666667, 1, 1,
0.21544, 1.120038, 1.39003, 0, 0.4588235, 1, 1,
0.2179419, -1.236757, 3.148092, 0, 0.454902, 1, 1,
0.2263426, -0.6032041, 1.826979, 0, 0.4470588, 1, 1,
0.2276199, 0.4452395, 0.982186, 0, 0.4431373, 1, 1,
0.2303343, 0.2814483, -0.3202597, 0, 0.4352941, 1, 1,
0.2342346, -0.1642356, 2.195509, 0, 0.4313726, 1, 1,
0.2345333, 0.008946992, 3.270721, 0, 0.4235294, 1, 1,
0.2349212, 0.2671027, 1.9184, 0, 0.4196078, 1, 1,
0.244635, 0.6482691, -0.007141142, 0, 0.4117647, 1, 1,
0.2457566, 0.454666, 0.2741631, 0, 0.4078431, 1, 1,
0.2481127, 0.2034148, 1.462094, 0, 0.4, 1, 1,
0.2482057, 0.3425715, 0.7230693, 0, 0.3921569, 1, 1,
0.2499733, 0.1155238, 2.025944, 0, 0.3882353, 1, 1,
0.2538154, 1.024196, 0.1709918, 0, 0.3803922, 1, 1,
0.2548664, -0.6251953, 1.049444, 0, 0.3764706, 1, 1,
0.255648, 0.741134, 0.4432243, 0, 0.3686275, 1, 1,
0.2580042, 2.346825, -0.1032667, 0, 0.3647059, 1, 1,
0.261015, 0.4204711, 0.7333055, 0, 0.3568628, 1, 1,
0.2658405, -0.8444653, 2.204059, 0, 0.3529412, 1, 1,
0.2706688, -0.2483647, 3.776293, 0, 0.345098, 1, 1,
0.2755196, -1.100784, 3.197023, 0, 0.3411765, 1, 1,
0.2756559, -0.004039434, 3.0501, 0, 0.3333333, 1, 1,
0.277129, -0.2015666, 2.416188, 0, 0.3294118, 1, 1,
0.2793151, -1.757944, 3.173801, 0, 0.3215686, 1, 1,
0.2808816, -1.649221, 2.509148, 0, 0.3176471, 1, 1,
0.2815817, -0.5853086, 2.711852, 0, 0.3098039, 1, 1,
0.2817148, -0.2370764, 2.971412, 0, 0.3058824, 1, 1,
0.2829609, -0.4628256, 3.439304, 0, 0.2980392, 1, 1,
0.2900952, -2.04999, 2.934028, 0, 0.2901961, 1, 1,
0.2928707, -0.6252897, 1.567143, 0, 0.2862745, 1, 1,
0.2938949, 0.9965203, 1.045245, 0, 0.2784314, 1, 1,
0.3014846, -1.44801, 4.71374, 0, 0.2745098, 1, 1,
0.3101745, 2.29201, -1.428368, 0, 0.2666667, 1, 1,
0.3106113, 0.1205636, 0.8715585, 0, 0.2627451, 1, 1,
0.3117507, 1.540745, 1.808415, 0, 0.254902, 1, 1,
0.3150368, -0.8959275, 1.80027, 0, 0.2509804, 1, 1,
0.3186499, 2.070745, -0.5123444, 0, 0.2431373, 1, 1,
0.3197159, 0.7723134, 0.202078, 0, 0.2392157, 1, 1,
0.3200969, -1.355696, 2.844998, 0, 0.2313726, 1, 1,
0.3214977, -1.446338, 2.753333, 0, 0.227451, 1, 1,
0.3256825, -1.540619, 4.496236, 0, 0.2196078, 1, 1,
0.3271218, -2.399572, 2.354288, 0, 0.2156863, 1, 1,
0.3275949, -0.217594, 2.886869, 0, 0.2078431, 1, 1,
0.3307646, 1.069355, 0.02521376, 0, 0.2039216, 1, 1,
0.3324403, -1.061708, 3.898758, 0, 0.1960784, 1, 1,
0.3384087, 2.183855, -0.4655764, 0, 0.1882353, 1, 1,
0.3390507, -0.637467, 2.937697, 0, 0.1843137, 1, 1,
0.3402894, 2.510248, 1.45915, 0, 0.1764706, 1, 1,
0.3426858, 0.4445744, -0.04875843, 0, 0.172549, 1, 1,
0.3447064, 0.2695013, 0.1769768, 0, 0.1647059, 1, 1,
0.3457594, 1.045488, 0.3618995, 0, 0.1607843, 1, 1,
0.347458, 1.915104, -1.646938, 0, 0.1529412, 1, 1,
0.3486176, 1.194158, 1.187078, 0, 0.1490196, 1, 1,
0.3523176, 1.369009, 2.337256, 0, 0.1411765, 1, 1,
0.3542758, 1.655051, 1.014367, 0, 0.1372549, 1, 1,
0.3569503, 0.2620212, 2.332788, 0, 0.1294118, 1, 1,
0.3592068, 0.08615943, 1.625436, 0, 0.1254902, 1, 1,
0.3632098, 1.005325, -1.368454, 0, 0.1176471, 1, 1,
0.3708252, -0.7457045, 1.845813, 0, 0.1137255, 1, 1,
0.3803109, 0.9085882, -0.4708928, 0, 0.1058824, 1, 1,
0.3815615, -1.367443, 4.933869, 0, 0.09803922, 1, 1,
0.381675, -0.7536722, 2.400117, 0, 0.09411765, 1, 1,
0.384045, -0.5449226, 2.622043, 0, 0.08627451, 1, 1,
0.3850126, 0.6298875, 1.518841, 0, 0.08235294, 1, 1,
0.3852946, -0.2439423, 3.079237, 0, 0.07450981, 1, 1,
0.3875106, 1.308428, 2.351958, 0, 0.07058824, 1, 1,
0.3915317, -0.6774718, 3.767709, 0, 0.0627451, 1, 1,
0.3918823, -0.1643743, 1.47914, 0, 0.05882353, 1, 1,
0.4006621, -1.639979, 3.18785, 0, 0.05098039, 1, 1,
0.4010167, 1.199474, -1.365891, 0, 0.04705882, 1, 1,
0.4031996, 1.561024, -0.1118074, 0, 0.03921569, 1, 1,
0.4081449, -0.841679, 2.377752, 0, 0.03529412, 1, 1,
0.4161007, -1.509046, 0.4432483, 0, 0.02745098, 1, 1,
0.4189027, -1.339242, 3.398785, 0, 0.02352941, 1, 1,
0.4189817, -0.454455, 3.066079, 0, 0.01568628, 1, 1,
0.4306197, 1.427392, 0.8571354, 0, 0.01176471, 1, 1,
0.4321441, -0.4355233, 2.233554, 0, 0.003921569, 1, 1,
0.4347433, 0.354721, 0.1178994, 0.003921569, 0, 1, 1,
0.4369023, -0.6337044, 1.615284, 0.007843138, 0, 1, 1,
0.4370984, 1.448322, 0.2219506, 0.01568628, 0, 1, 1,
0.4446706, -0.5580827, 2.982382, 0.01960784, 0, 1, 1,
0.4482571, 0.3246471, -0.6176872, 0.02745098, 0, 1, 1,
0.448463, 0.9995887, 0.4558378, 0.03137255, 0, 1, 1,
0.4520988, 1.14144, -0.7184394, 0.03921569, 0, 1, 1,
0.4530903, -1.289666, 3.09705, 0.04313726, 0, 1, 1,
0.457918, -2.546758, 1.595737, 0.05098039, 0, 1, 1,
0.4582208, 0.3953871, 2.240193, 0.05490196, 0, 1, 1,
0.4583753, 0.5414935, 1.952877, 0.0627451, 0, 1, 1,
0.4587123, -1.560545, 1.924726, 0.06666667, 0, 1, 1,
0.4626804, -1.706277, 0.7601706, 0.07450981, 0, 1, 1,
0.4629283, 1.050366, -1.863534, 0.07843138, 0, 1, 1,
0.4639904, -0.280062, 1.888781, 0.08627451, 0, 1, 1,
0.4671253, 1.335005, -0.1584965, 0.09019608, 0, 1, 1,
0.4676212, 1.165621, -0.3109629, 0.09803922, 0, 1, 1,
0.4744514, -0.6573031, 3.002754, 0.1058824, 0, 1, 1,
0.4770102, -0.3294761, 0.381365, 0.1098039, 0, 1, 1,
0.4773622, 0.3015728, 0.5157285, 0.1176471, 0, 1, 1,
0.4796469, -0.07325856, 3.0318, 0.1215686, 0, 1, 1,
0.4819225, 0.06067732, 0.2474319, 0.1294118, 0, 1, 1,
0.482949, -0.2500796, 2.376947, 0.1333333, 0, 1, 1,
0.48308, -1.051655, 1.948686, 0.1411765, 0, 1, 1,
0.4840341, 0.625475, -1.424062, 0.145098, 0, 1, 1,
0.492696, -0.01943118, 1.398322, 0.1529412, 0, 1, 1,
0.4932469, 0.2077969, 0.9483485, 0.1568628, 0, 1, 1,
0.4939533, -0.6766331, 2.24466, 0.1647059, 0, 1, 1,
0.5028303, -0.7896291, 2.844485, 0.1686275, 0, 1, 1,
0.5046581, -0.8880458, 2.942828, 0.1764706, 0, 1, 1,
0.5047912, 0.5167206, 3.09003, 0.1803922, 0, 1, 1,
0.5120701, 1.782183, 0.08370588, 0.1882353, 0, 1, 1,
0.5181117, -0.6603498, 1.678622, 0.1921569, 0, 1, 1,
0.5198157, -0.878156, 3.637228, 0.2, 0, 1, 1,
0.5218247, 0.406848, 0.3276681, 0.2078431, 0, 1, 1,
0.521967, -1.092835, 2.771827, 0.2117647, 0, 1, 1,
0.5220133, -1.030281, 3.828858, 0.2196078, 0, 1, 1,
0.5253711, 1.102133, 0.04681371, 0.2235294, 0, 1, 1,
0.5271434, -0.6862147, 2.348655, 0.2313726, 0, 1, 1,
0.5299748, -0.687606, 1.553797, 0.2352941, 0, 1, 1,
0.5318835, -0.7914539, 2.243295, 0.2431373, 0, 1, 1,
0.5328535, 0.937325, 0.7063209, 0.2470588, 0, 1, 1,
0.5355939, -0.7393221, 3.027141, 0.254902, 0, 1, 1,
0.5429888, -0.7133937, 2.108135, 0.2588235, 0, 1, 1,
0.5439239, 0.3585909, 3.700689, 0.2666667, 0, 1, 1,
0.5504591, 0.4134347, 1.358764, 0.2705882, 0, 1, 1,
0.5532547, 0.3827608, 1.364203, 0.2784314, 0, 1, 1,
0.5537062, -0.5313599, 1.696366, 0.282353, 0, 1, 1,
0.5608698, 0.3951845, 0.09382046, 0.2901961, 0, 1, 1,
0.5674524, 1.502507, 0.6915188, 0.2941177, 0, 1, 1,
0.5699416, 0.5665722, 1.763569, 0.3019608, 0, 1, 1,
0.5735263, -0.3965276, 2.882257, 0.3098039, 0, 1, 1,
0.5747911, 1.512382, 0.3832329, 0.3137255, 0, 1, 1,
0.5762941, -0.697793, 2.152966, 0.3215686, 0, 1, 1,
0.5788626, -0.6495228, 3.516087, 0.3254902, 0, 1, 1,
0.5791851, -0.7286245, 2.970677, 0.3333333, 0, 1, 1,
0.5827816, -1.367207, 2.178825, 0.3372549, 0, 1, 1,
0.5833573, 1.768055, -0.6776435, 0.345098, 0, 1, 1,
0.5891881, -1.549404, 2.773987, 0.3490196, 0, 1, 1,
0.5898784, 1.931171, 2.095067, 0.3568628, 0, 1, 1,
0.5902084, 0.5718286, -1.028896, 0.3607843, 0, 1, 1,
0.5921564, -0.1113349, 1.604278, 0.3686275, 0, 1, 1,
0.5945815, 1.084656, 1.599902, 0.372549, 0, 1, 1,
0.5985026, 0.39, 0.6201845, 0.3803922, 0, 1, 1,
0.6088326, -0.5615373, 1.500368, 0.3843137, 0, 1, 1,
0.6094227, -1.034191, 1.632219, 0.3921569, 0, 1, 1,
0.6111646, -2.001845, 2.052733, 0.3960784, 0, 1, 1,
0.6113469, 2.03374, -0.1674649, 0.4039216, 0, 1, 1,
0.618636, -0.5196499, 0.4408344, 0.4117647, 0, 1, 1,
0.6187886, -0.3757644, 1.081089, 0.4156863, 0, 1, 1,
0.6194762, -1.249522, 3.580974, 0.4235294, 0, 1, 1,
0.6209056, -1.549875, 1.826734, 0.427451, 0, 1, 1,
0.6220428, 0.7738506, 1.963641, 0.4352941, 0, 1, 1,
0.6292899, -0.6607677, 3.073776, 0.4392157, 0, 1, 1,
0.6296012, 0.1542839, 0.7476646, 0.4470588, 0, 1, 1,
0.6304469, 1.752335, 0.9698212, 0.4509804, 0, 1, 1,
0.634721, 0.2981818, 0.8423874, 0.4588235, 0, 1, 1,
0.6440434, -0.2225103, 0.4479302, 0.4627451, 0, 1, 1,
0.6456089, 0.03082332, 3.326159, 0.4705882, 0, 1, 1,
0.6518577, 0.8995883, -0.3588909, 0.4745098, 0, 1, 1,
0.6561322, -0.200681, -0.01977962, 0.4823529, 0, 1, 1,
0.6602525, 0.4551075, 2.855191, 0.4862745, 0, 1, 1,
0.6652846, 0.865864, -0.2527114, 0.4941176, 0, 1, 1,
0.6655825, 0.3356322, -0.2614829, 0.5019608, 0, 1, 1,
0.673117, 0.2968294, 2.244058, 0.5058824, 0, 1, 1,
0.6765486, 1.073548, 1.261173, 0.5137255, 0, 1, 1,
0.6835769, -0.9875438, 2.670686, 0.5176471, 0, 1, 1,
0.6879563, 0.7751559, 0.4920104, 0.5254902, 0, 1, 1,
0.688917, 0.2480876, 0.7382824, 0.5294118, 0, 1, 1,
0.7027691, -1.021248, 4.209633, 0.5372549, 0, 1, 1,
0.7058556, 0.2304516, -0.2782511, 0.5411765, 0, 1, 1,
0.7073479, 0.6820178, 0.01949597, 0.5490196, 0, 1, 1,
0.7080661, 0.3925754, -0.4680612, 0.5529412, 0, 1, 1,
0.718725, 0.6573092, 1.02629, 0.5607843, 0, 1, 1,
0.7189256, -1.663436, 4.268061, 0.5647059, 0, 1, 1,
0.7218194, 1.563534, 0.2514605, 0.572549, 0, 1, 1,
0.726257, 1.140485, -0.7260122, 0.5764706, 0, 1, 1,
0.7357491, -0.5060529, 1.049568, 0.5843138, 0, 1, 1,
0.7390662, -0.1597406, 2.525488, 0.5882353, 0, 1, 1,
0.7396053, -0.0187497, 0.7727906, 0.5960785, 0, 1, 1,
0.7419418, -2.235975, 3.452796, 0.6039216, 0, 1, 1,
0.7441078, -0.5267206, 3.204374, 0.6078432, 0, 1, 1,
0.7516306, 0.7942038, 0.5432739, 0.6156863, 0, 1, 1,
0.7527431, 0.3895955, 1.246146, 0.6196079, 0, 1, 1,
0.7564455, 0.8600405, 0.9098268, 0.627451, 0, 1, 1,
0.7649841, 0.2222918, 3.236252, 0.6313726, 0, 1, 1,
0.7658054, 1.800237, 1.691832, 0.6392157, 0, 1, 1,
0.766588, -0.09192849, 2.337922, 0.6431373, 0, 1, 1,
0.7726912, -1.940962, 2.942913, 0.6509804, 0, 1, 1,
0.774361, -0.3762893, 2.190277, 0.654902, 0, 1, 1,
0.7755089, -0.1556336, 1.499174, 0.6627451, 0, 1, 1,
0.781912, -1.348272, 4.044062, 0.6666667, 0, 1, 1,
0.7828926, 0.3018952, 1.230502, 0.6745098, 0, 1, 1,
0.7853079, -0.01027944, 1.574427, 0.6784314, 0, 1, 1,
0.78807, -0.7586265, 3.396996, 0.6862745, 0, 1, 1,
0.8018749, 1.383335, 0.8723494, 0.6901961, 0, 1, 1,
0.8022215, 1.733438, -0.1866377, 0.6980392, 0, 1, 1,
0.8054221, -0.2443861, 2.092134, 0.7058824, 0, 1, 1,
0.8085786, -1.740526, 1.87411, 0.7098039, 0, 1, 1,
0.8088471, 1.774634, 1.156761, 0.7176471, 0, 1, 1,
0.8097858, -0.3774857, 2.220516, 0.7215686, 0, 1, 1,
0.8115672, 1.998065, -0.7424164, 0.7294118, 0, 1, 1,
0.8117601, -1.434433, 3.223307, 0.7333333, 0, 1, 1,
0.8139729, 1.129155, 1.015294, 0.7411765, 0, 1, 1,
0.8146324, 0.4702819, 1.618729, 0.7450981, 0, 1, 1,
0.8150755, 0.6117895, 0.5438097, 0.7529412, 0, 1, 1,
0.8186488, 1.492795, 1.046056, 0.7568628, 0, 1, 1,
0.8190884, 0.5744033, 0.08608186, 0.7647059, 0, 1, 1,
0.8224165, -0.687114, 1.701036, 0.7686275, 0, 1, 1,
0.8230156, -1.82275, 5.163531, 0.7764706, 0, 1, 1,
0.8248277, -0.05462593, 1.592597, 0.7803922, 0, 1, 1,
0.8248335, 1.084766, 1.011114, 0.7882353, 0, 1, 1,
0.8261012, -0.4931343, 2.244203, 0.7921569, 0, 1, 1,
0.8442203, -1.238239, 4.030596, 0.8, 0, 1, 1,
0.8571214, -0.4463776, 3.46407, 0.8078431, 0, 1, 1,
0.8572337, 2.097088, 0.1928765, 0.8117647, 0, 1, 1,
0.8583591, 0.08279805, 0.8338758, 0.8196079, 0, 1, 1,
0.8589213, 0.1689517, 0.7698916, 0.8235294, 0, 1, 1,
0.8645203, 0.6272483, 2.693773, 0.8313726, 0, 1, 1,
0.8652804, 0.9861708, -1.036455, 0.8352941, 0, 1, 1,
0.8693199, 0.01658754, 3.329845, 0.8431373, 0, 1, 1,
0.8701639, 0.4347907, 1.975383, 0.8470588, 0, 1, 1,
0.8735361, 0.5196898, 1.434127, 0.854902, 0, 1, 1,
0.8750734, -1.159316, 1.524138, 0.8588235, 0, 1, 1,
0.8800815, 0.9797365, 1.833429, 0.8666667, 0, 1, 1,
0.8811893, -1.477449, 2.200712, 0.8705882, 0, 1, 1,
0.8862313, -1.151485, 1.34006, 0.8784314, 0, 1, 1,
0.9024158, 0.1552751, 0.4410205, 0.8823529, 0, 1, 1,
0.9031116, -0.2773573, 3.395087, 0.8901961, 0, 1, 1,
0.9036399, -0.6670495, 1.99854, 0.8941177, 0, 1, 1,
0.9078471, 0.6358973, 1.333464, 0.9019608, 0, 1, 1,
0.9092516, 1.492595, -0.5615823, 0.9098039, 0, 1, 1,
0.9141577, 1.296925, 0.3178565, 0.9137255, 0, 1, 1,
0.9142576, 0.433429, 0.4026973, 0.9215686, 0, 1, 1,
0.9214768, -0.366078, 2.773464, 0.9254902, 0, 1, 1,
0.9222268, 1.453466, -0.09310372, 0.9333333, 0, 1, 1,
0.9238492, 0.9540629, 0.7340553, 0.9372549, 0, 1, 1,
0.9239376, 1.24111, 0.8989974, 0.945098, 0, 1, 1,
0.9242043, 0.1713042, 1.797885, 0.9490196, 0, 1, 1,
0.9262052, -1.152081, 3.634631, 0.9568627, 0, 1, 1,
0.9393767, -0.3951391, 3.270545, 0.9607843, 0, 1, 1,
0.946813, 0.2796456, 0.3908506, 0.9686275, 0, 1, 1,
0.9492431, -0.2544529, 3.827929, 0.972549, 0, 1, 1,
0.9559389, 0.03553807, 0.009215415, 0.9803922, 0, 1, 1,
0.9565673, -0.4783536, 1.802082, 0.9843137, 0, 1, 1,
0.95728, -0.9008287, 3.927876, 0.9921569, 0, 1, 1,
0.9594836, 0.7617569, 1.053778, 0.9960784, 0, 1, 1,
0.9628636, -1.004485, 3.15326, 1, 0, 0.9960784, 1,
0.9640841, -0.04826237, 2.205329, 1, 0, 0.9882353, 1,
0.9643449, 0.06544691, 0.5928771, 1, 0, 0.9843137, 1,
0.9650403, -0.5413783, 2.049047, 1, 0, 0.9764706, 1,
0.9724551, -0.166506, 0.6982744, 1, 0, 0.972549, 1,
0.9764037, 0.4713742, 3.586928, 1, 0, 0.9647059, 1,
0.978099, 0.5956563, 2.759271, 1, 0, 0.9607843, 1,
0.9793319, -1.72896, 1.751182, 1, 0, 0.9529412, 1,
0.982746, 0.3408543, 1.15932, 1, 0, 0.9490196, 1,
0.9829732, 0.7884293, 3.235599, 1, 0, 0.9411765, 1,
0.9917241, -1.845782, 2.490897, 1, 0, 0.9372549, 1,
0.9929241, -0.1026307, 1.332736, 1, 0, 0.9294118, 1,
0.9950978, -1.329693, 1.724513, 1, 0, 0.9254902, 1,
0.9964044, 0.3953681, -0.1628367, 1, 0, 0.9176471, 1,
1.003091, 0.5765181, 1.135711, 1, 0, 0.9137255, 1,
1.008052, 0.8861642, -0.5725593, 1, 0, 0.9058824, 1,
1.017564, 0.148671, 1.078795, 1, 0, 0.9019608, 1,
1.019885, 1.118905, -0.1735248, 1, 0, 0.8941177, 1,
1.022797, 1.112332, 0.0005285422, 1, 0, 0.8862745, 1,
1.02379, 1.766579, -0.2153326, 1, 0, 0.8823529, 1,
1.027182, -0.923811, 3.835645, 1, 0, 0.8745098, 1,
1.027788, 1.58622, 1.166837, 1, 0, 0.8705882, 1,
1.034466, -0.1129266, 2.21634, 1, 0, 0.8627451, 1,
1.035009, 0.9022918, 1.324913, 1, 0, 0.8588235, 1,
1.041734, -0.6454382, 3.857043, 1, 0, 0.8509804, 1,
1.042668, 0.8790483, 1.723057, 1, 0, 0.8470588, 1,
1.046232, 0.2315092, 1.9002, 1, 0, 0.8392157, 1,
1.048263, 1.549745, 2.220889, 1, 0, 0.8352941, 1,
1.049963, -1.45548, 1.398575, 1, 0, 0.827451, 1,
1.054736, -0.6663013, 1.662839, 1, 0, 0.8235294, 1,
1.057539, 0.7100058, 1.653457, 1, 0, 0.8156863, 1,
1.063259, 0.3105531, -0.5827296, 1, 0, 0.8117647, 1,
1.074767, -0.4211848, 1.463246, 1, 0, 0.8039216, 1,
1.077893, -0.4850331, 1.376536, 1, 0, 0.7960784, 1,
1.078531, -0.8213773, 2.938618, 1, 0, 0.7921569, 1,
1.09657, -0.1454216, 3.029988, 1, 0, 0.7843137, 1,
1.098472, 1.185038, 1.134533, 1, 0, 0.7803922, 1,
1.099762, 0.09148052, 1.014152, 1, 0, 0.772549, 1,
1.102892, -1.233422, 6.796682, 1, 0, 0.7686275, 1,
1.10743, 0.9414302, 0.750915, 1, 0, 0.7607843, 1,
1.108796, -0.8992725, 2.374552, 1, 0, 0.7568628, 1,
1.109848, 1.871701, 1.76535, 1, 0, 0.7490196, 1,
1.113765, 1.095655, 0.9603018, 1, 0, 0.7450981, 1,
1.123046, -0.2883104, 3.269717, 1, 0, 0.7372549, 1,
1.124786, -0.07479289, 1.896263, 1, 0, 0.7333333, 1,
1.131703, 0.4695417, 1.552903, 1, 0, 0.7254902, 1,
1.137608, -0.6089864, 2.382986, 1, 0, 0.7215686, 1,
1.140426, 0.6002382, 0.7889912, 1, 0, 0.7137255, 1,
1.140643, 1.579109, 0.8893492, 1, 0, 0.7098039, 1,
1.142159, -3.108024, 0.6391327, 1, 0, 0.7019608, 1,
1.148315, 1.78878, 0.3487127, 1, 0, 0.6941177, 1,
1.158555, -0.3108827, 0.9608878, 1, 0, 0.6901961, 1,
1.162838, 0.2136799, -0.762093, 1, 0, 0.682353, 1,
1.165974, 1.078791, 0.8949196, 1, 0, 0.6784314, 1,
1.166038, -1.294899, 3.951549, 1, 0, 0.6705883, 1,
1.168548, -1.829168, 2.213676, 1, 0, 0.6666667, 1,
1.170521, -1.222259, 2.564516, 1, 0, 0.6588235, 1,
1.172761, -0.7852684, 2.286542, 1, 0, 0.654902, 1,
1.17687, 0.9477566, 0.3765159, 1, 0, 0.6470588, 1,
1.177821, 0.02777159, 1.746681, 1, 0, 0.6431373, 1,
1.178514, 0.6134193, 1.620114, 1, 0, 0.6352941, 1,
1.183715, 0.7444264, 1.514507, 1, 0, 0.6313726, 1,
1.196064, 0.2021753, -0.7129574, 1, 0, 0.6235294, 1,
1.198293, -0.2310732, 0.5936638, 1, 0, 0.6196079, 1,
1.208881, -1.186743, 2.393236, 1, 0, 0.6117647, 1,
1.209655, -1.505762, 2.306226, 1, 0, 0.6078432, 1,
1.224711, -0.3296503, 0.04202737, 1, 0, 0.6, 1,
1.226182, -0.04940017, 2.203718, 1, 0, 0.5921569, 1,
1.232337, -0.1939629, 3.181392, 1, 0, 0.5882353, 1,
1.238843, -0.1293347, 2.060318, 1, 0, 0.5803922, 1,
1.243833, -1.800089, 3.010022, 1, 0, 0.5764706, 1,
1.245827, -1.084141, 1.531706, 1, 0, 0.5686275, 1,
1.255118, 1.398963, 0.9507842, 1, 0, 0.5647059, 1,
1.27826, -0.5558748, 2.156298, 1, 0, 0.5568628, 1,
1.282271, -1.866373, 3.335005, 1, 0, 0.5529412, 1,
1.285592, 0.09763143, 1.234376, 1, 0, 0.5450981, 1,
1.291642, -0.1372069, 0.398163, 1, 0, 0.5411765, 1,
1.308962, 0.7655003, 1.989079, 1, 0, 0.5333334, 1,
1.317013, -0.8804806, 2.233494, 1, 0, 0.5294118, 1,
1.319572, -1.081798, 1.255571, 1, 0, 0.5215687, 1,
1.320169, -1.421116, 2.523845, 1, 0, 0.5176471, 1,
1.320325, -0.1130996, 1.841027, 1, 0, 0.509804, 1,
1.323212, -0.07380846, 0.723304, 1, 0, 0.5058824, 1,
1.324688, -0.4762009, 2.575685, 1, 0, 0.4980392, 1,
1.328231, -2.206129, 2.633864, 1, 0, 0.4901961, 1,
1.332862, -0.8079221, 0.9583173, 1, 0, 0.4862745, 1,
1.34408, -0.8417447, 3.309852, 1, 0, 0.4784314, 1,
1.365165, 0.1214779, 1.003513, 1, 0, 0.4745098, 1,
1.370358, 0.8685203, 0.8937651, 1, 0, 0.4666667, 1,
1.372513, -0.7414903, 1.611046, 1, 0, 0.4627451, 1,
1.374589, 3.014038, -0.8221807, 1, 0, 0.454902, 1,
1.377592, -0.5018373, 0.5698076, 1, 0, 0.4509804, 1,
1.383643, 0.8056315, 1.130915, 1, 0, 0.4431373, 1,
1.390922, -1.019161, 1.986092, 1, 0, 0.4392157, 1,
1.393849, 0.6465304, 0.1125256, 1, 0, 0.4313726, 1,
1.404683, 0.2409801, 2.488961, 1, 0, 0.427451, 1,
1.405696, -0.2890639, 3.205081, 1, 0, 0.4196078, 1,
1.407325, -0.1416268, 1.980017, 1, 0, 0.4156863, 1,
1.413879, 1.30837, 1.405819, 1, 0, 0.4078431, 1,
1.429405, -0.4719434, 2.395869, 1, 0, 0.4039216, 1,
1.445999, 1.641455, 2.792114, 1, 0, 0.3960784, 1,
1.447459, 1.255413, 1.159662, 1, 0, 0.3882353, 1,
1.464292, -0.03900851, 0.3421708, 1, 0, 0.3843137, 1,
1.464485, -1.163027, 4.358184, 1, 0, 0.3764706, 1,
1.471353, 2.151201, -0.08299094, 1, 0, 0.372549, 1,
1.504246, -1.959053, 3.724089, 1, 0, 0.3647059, 1,
1.518496, 0.356067, 1.846326, 1, 0, 0.3607843, 1,
1.522196, -0.8225446, -0.08960284, 1, 0, 0.3529412, 1,
1.534904, -0.5915098, 3.158592, 1, 0, 0.3490196, 1,
1.539675, -0.8256013, 0.5945989, 1, 0, 0.3411765, 1,
1.540042, 0.5083431, 0.4525786, 1, 0, 0.3372549, 1,
1.568853, -0.3863519, 2.739095, 1, 0, 0.3294118, 1,
1.583003, -0.1625004, 2.852448, 1, 0, 0.3254902, 1,
1.584731, -0.1098854, 2.207919, 1, 0, 0.3176471, 1,
1.589558, 0.3594802, 0.8311927, 1, 0, 0.3137255, 1,
1.606583, 0.7533052, 2.059337, 1, 0, 0.3058824, 1,
1.624514, 1.250078, 0.1804093, 1, 0, 0.2980392, 1,
1.625751, 1.094642, 2.056771, 1, 0, 0.2941177, 1,
1.62691, -0.9312937, 3.161582, 1, 0, 0.2862745, 1,
1.631394, -0.3345169, 1.511447, 1, 0, 0.282353, 1,
1.6344, 0.1859802, 0.8804082, 1, 0, 0.2745098, 1,
1.657504, -0.2387354, 0.1996545, 1, 0, 0.2705882, 1,
1.693324, -0.5361818, 1.114041, 1, 0, 0.2627451, 1,
1.701763, 1.637023, 0.641216, 1, 0, 0.2588235, 1,
1.731783, 1.14114, 1.002449, 1, 0, 0.2509804, 1,
1.735251, -0.06470864, 1.94722, 1, 0, 0.2470588, 1,
1.748907, -0.427664, 0.6325516, 1, 0, 0.2392157, 1,
1.764355, 0.8293208, 1.329033, 1, 0, 0.2352941, 1,
1.769439, 0.1689535, 4.211423, 1, 0, 0.227451, 1,
1.771786, 1.640154, -2.093729, 1, 0, 0.2235294, 1,
1.788222, -0.2361517, 2.554733, 1, 0, 0.2156863, 1,
1.799508, -0.2687134, 0.6284717, 1, 0, 0.2117647, 1,
1.804578, -0.4558381, 3.01121, 1, 0, 0.2039216, 1,
1.805897, 0.2488412, 2.377277, 1, 0, 0.1960784, 1,
1.840579, 0.7433515, 0.5296578, 1, 0, 0.1921569, 1,
1.849637, -0.420252, 1.799788, 1, 0, 0.1843137, 1,
1.856007, 0.7410707, 1.646253, 1, 0, 0.1803922, 1,
1.867605, -0.01965932, 1.204429, 1, 0, 0.172549, 1,
1.876432, -2.238279, 2.196167, 1, 0, 0.1686275, 1,
1.885166, -0.8570176, 2.55006, 1, 0, 0.1607843, 1,
1.952909, -2.219957, 3.872771, 1, 0, 0.1568628, 1,
1.964405, 0.4694751, 0.7623919, 1, 0, 0.1490196, 1,
1.970579, -0.006470776, 2.470164, 1, 0, 0.145098, 1,
1.98506, -0.4215853, 1.744421, 1, 0, 0.1372549, 1,
1.989048, 1.265886, 1.075982, 1, 0, 0.1333333, 1,
2.016908, -0.9618152, 1.899505, 1, 0, 0.1254902, 1,
2.040184, 0.9298626, 0.9204349, 1, 0, 0.1215686, 1,
2.074956, 0.7289329, 0.1979592, 1, 0, 0.1137255, 1,
2.075748, 0.06089036, 0.3706443, 1, 0, 0.1098039, 1,
2.075936, -1.907991, 4.372405, 1, 0, 0.1019608, 1,
2.08147, -1.48134, 1.987211, 1, 0, 0.09411765, 1,
2.10197, 0.09203129, 0.7026102, 1, 0, 0.09019608, 1,
2.167516, 0.338737, -0.9324642, 1, 0, 0.08235294, 1,
2.196745, 1.445588, 0.7460349, 1, 0, 0.07843138, 1,
2.202267, 0.2388348, 1.897672, 1, 0, 0.07058824, 1,
2.209757, -0.6340991, 1.154034, 1, 0, 0.06666667, 1,
2.328734, -0.635561, 2.394007, 1, 0, 0.05882353, 1,
2.428975, -0.6716094, 1.412602, 1, 0, 0.05490196, 1,
2.439651, 0.01896792, 1.100221, 1, 0, 0.04705882, 1,
2.445946, -0.4212672, 2.097449, 1, 0, 0.04313726, 1,
2.486011, 0.1395954, 1.819003, 1, 0, 0.03529412, 1,
2.532907, -0.3139598, 1.056981, 1, 0, 0.03137255, 1,
2.535342, -1.136812, 3.354602, 1, 0, 0.02352941, 1,
2.686549, -0.7831967, 3.541763, 1, 0, 0.01960784, 1,
3.113117, -0.5476543, 3.240822, 1, 0, 0.01176471, 1,
3.28076, 0.8682502, 1.392485, 1, 0, 0.007843138, 1
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
0.1445426, -4.154509, -6.820617, 0, -0.5, 0.5, 0.5,
0.1445426, -4.154509, -6.820617, 1, -0.5, 0.5, 0.5,
0.1445426, -4.154509, -6.820617, 1, 1.5, 0.5, 0.5,
0.1445426, -4.154509, -6.820617, 0, 1.5, 0.5, 0.5
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
-4.054852, -0.02104938, -6.820617, 0, -0.5, 0.5, 0.5,
-4.054852, -0.02104938, -6.820617, 1, -0.5, 0.5, 0.5,
-4.054852, -0.02104938, -6.820617, 1, 1.5, 0.5, 0.5,
-4.054852, -0.02104938, -6.820617, 0, 1.5, 0.5, 0.5
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
-4.054852, -4.154509, 0.9748359, 0, -0.5, 0.5, 0.5,
-4.054852, -4.154509, 0.9748359, 1, -0.5, 0.5, 0.5,
-4.054852, -4.154509, 0.9748359, 1, 1.5, 0.5, 0.5,
-4.054852, -4.154509, 0.9748359, 0, 1.5, 0.5, 0.5
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
-2, -3.200634, -5.021666,
3, -3.200634, -5.021666,
-2, -3.200634, -5.021666,
-2, -3.359613, -5.321491,
-1, -3.200634, -5.021666,
-1, -3.359613, -5.321491,
0, -3.200634, -5.021666,
0, -3.359613, -5.321491,
1, -3.200634, -5.021666,
1, -3.359613, -5.321491,
2, -3.200634, -5.021666,
2, -3.359613, -5.321491,
3, -3.200634, -5.021666,
3, -3.359613, -5.321491
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
-2, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
-2, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
-2, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
-2, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5,
-1, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
-1, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
-1, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
-1, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5,
0, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
0, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
0, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
0, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5,
1, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
1, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
1, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
1, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5,
2, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
2, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
2, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
2, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5,
3, -3.677571, -5.921141, 0, -0.5, 0.5, 0.5,
3, -3.677571, -5.921141, 1, -0.5, 0.5, 0.5,
3, -3.677571, -5.921141, 1, 1.5, 0.5, 0.5,
3, -3.677571, -5.921141, 0, 1.5, 0.5, 0.5
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
-3.085761, -3, -5.021666,
-3.085761, 3, -5.021666,
-3.085761, -3, -5.021666,
-3.247276, -3, -5.321491,
-3.085761, -2, -5.021666,
-3.247276, -2, -5.321491,
-3.085761, -1, -5.021666,
-3.247276, -1, -5.321491,
-3.085761, 0, -5.021666,
-3.247276, 0, -5.321491,
-3.085761, 1, -5.021666,
-3.247276, 1, -5.321491,
-3.085761, 2, -5.021666,
-3.247276, 2, -5.321491,
-3.085761, 3, -5.021666,
-3.247276, 3, -5.321491
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
-3.570307, -3, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, -3, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, -3, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, -3, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, -2, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, -2, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, -2, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, -2, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, -1, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, -1, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, -1, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, -1, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, 0, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, 0, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, 0, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, 0, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, 1, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, 1, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, 1, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, 1, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, 2, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, 2, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, 2, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, 2, -5.921141, 0, 1.5, 0.5, 0.5,
-3.570307, 3, -5.921141, 0, -0.5, 0.5, 0.5,
-3.570307, 3, -5.921141, 1, -0.5, 0.5, 0.5,
-3.570307, 3, -5.921141, 1, 1.5, 0.5, 0.5,
-3.570307, 3, -5.921141, 0, 1.5, 0.5, 0.5
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
-3.085761, -3.200634, -4,
-3.085761, -3.200634, 6,
-3.085761, -3.200634, -4,
-3.247276, -3.359613, -4,
-3.085761, -3.200634, -2,
-3.247276, -3.359613, -2,
-3.085761, -3.200634, 0,
-3.247276, -3.359613, 0,
-3.085761, -3.200634, 2,
-3.247276, -3.359613, 2,
-3.085761, -3.200634, 4,
-3.247276, -3.359613, 4,
-3.085761, -3.200634, 6,
-3.247276, -3.359613, 6
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
"4",
"6"
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
-3.570307, -3.677571, -4, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, -4, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, -4, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, -4, 0, 1.5, 0.5, 0.5,
-3.570307, -3.677571, -2, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, -2, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, -2, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, -2, 0, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 0, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 0, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 0, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 0, 0, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 2, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 2, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 2, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 2, 0, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 4, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 4, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 4, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 4, 0, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 6, 0, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 6, 1, -0.5, 0.5, 0.5,
-3.570307, -3.677571, 6, 1, 1.5, 0.5, 0.5,
-3.570307, -3.677571, 6, 0, 1.5, 0.5, 0.5
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
-3.085761, -3.200634, -5.021666,
-3.085761, 3.158535, -5.021666,
-3.085761, -3.200634, 6.971338,
-3.085761, 3.158535, 6.971338,
-3.085761, -3.200634, -5.021666,
-3.085761, -3.200634, 6.971338,
-3.085761, 3.158535, -5.021666,
-3.085761, 3.158535, 6.971338,
-3.085761, -3.200634, -5.021666,
3.374846, -3.200634, -5.021666,
-3.085761, -3.200634, 6.971338,
3.374846, -3.200634, 6.971338,
-3.085761, 3.158535, -5.021666,
3.374846, 3.158535, -5.021666,
-3.085761, 3.158535, 6.971338,
3.374846, 3.158535, 6.971338,
3.374846, -3.200634, -5.021666,
3.374846, 3.158535, -5.021666,
3.374846, -3.200634, 6.971338,
3.374846, 3.158535, 6.971338,
3.374846, -3.200634, -5.021666,
3.374846, -3.200634, 6.971338,
3.374846, 3.158535, -5.021666,
3.374846, 3.158535, 6.971338
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
var radius = 8.027677;
var distance = 35.71604;
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
mvMatrix.translate( -0.1445426, 0.02104938, -0.9748359 );
mvMatrix.scale( 1.343478, 1.364908, 0.7237287 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.71604);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Alachlor<-read.table("Alachlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.991674, 0.4267762, -0.9503221, 0, 0, 1, 1, 1,
-2.72399, 0.4046954, -1.15491, 1, 0, 0, 1, 1,
-2.634216, 1.130002, -1.142103, 1, 0, 0, 1, 1,
-2.617277, -0.07912523, -1.323123, 1, 0, 0, 1, 1,
-2.578379, 2.42149, -0.2624748, 1, 0, 0, 1, 1,
-2.354641, -0.3355775, -1.514698, 1, 0, 0, 1, 1,
-2.299083, -0.001344287, -0.5557524, 0, 0, 0, 1, 1,
-2.266971, -0.3713592, -0.1931117, 0, 0, 0, 1, 1,
-2.237905, -0.893819, -1.536053, 0, 0, 0, 1, 1,
-2.234482, 0.1590227, -3.039028, 0, 0, 0, 1, 1,
-2.230258, 0.8056063, -1.152921, 0, 0, 0, 1, 1,
-2.171378, -1.489484, -1.44298, 0, 0, 0, 1, 1,
-2.152196, -1.943269, -1.476438, 0, 0, 0, 1, 1,
-2.150233, -0.7738522, -1.47114, 1, 1, 1, 1, 1,
-2.144469, 1.188804, -1.262666, 1, 1, 1, 1, 1,
-2.109269, -0.6657916, -2.401048, 1, 1, 1, 1, 1,
-2.098864, -1.099364, -1.572417, 1, 1, 1, 1, 1,
-2.048688, -0.01974068, 0.0117793, 1, 1, 1, 1, 1,
-2.044989, -0.06355826, -1.800668, 1, 1, 1, 1, 1,
-2.034283, -0.7731889, -2.256134, 1, 1, 1, 1, 1,
-2.024196, -1.717511, -2.5274, 1, 1, 1, 1, 1,
-2.019863, 0.7975799, -0.3331688, 1, 1, 1, 1, 1,
-2.016702, 0.4414595, -2.545771, 1, 1, 1, 1, 1,
-2.013429, -0.5057843, -1.467548, 1, 1, 1, 1, 1,
-1.991106, -0.4209928, -1.164954, 1, 1, 1, 1, 1,
-1.953942, 1.299935, -1.11466, 1, 1, 1, 1, 1,
-1.944935, -0.8912332, -2.607381, 1, 1, 1, 1, 1,
-1.92918, 0.5996771, -1.481633, 1, 1, 1, 1, 1,
-1.914, -0.7484468, -0.431152, 0, 0, 1, 1, 1,
-1.900393, 0.8477505, -1.358206, 1, 0, 0, 1, 1,
-1.884975, 0.184236, -2.347888, 1, 0, 0, 1, 1,
-1.877399, -0.5612995, -3.548229, 1, 0, 0, 1, 1,
-1.871167, 1.14439, -1.419545, 1, 0, 0, 1, 1,
-1.867689, -1.54707, -2.258225, 1, 0, 0, 1, 1,
-1.850235, 0.3121519, -0.7211295, 0, 0, 0, 1, 1,
-1.844699, 0.7799883, -2.093636, 0, 0, 0, 1, 1,
-1.840304, -0.2116165, -0.3605513, 0, 0, 0, 1, 1,
-1.782816, 1.712105, -1.62989, 0, 0, 0, 1, 1,
-1.763203, 0.5296282, -2.513564, 0, 0, 0, 1, 1,
-1.746598, 0.9916268, -0.291276, 0, 0, 0, 1, 1,
-1.739839, 1.353358, 0.2287487, 0, 0, 0, 1, 1,
-1.739183, -0.5850964, -2.020059, 1, 1, 1, 1, 1,
-1.733528, -0.2379807, -1.784591, 1, 1, 1, 1, 1,
-1.696012, 0.987406, -1.143283, 1, 1, 1, 1, 1,
-1.686421, -0.8903352, -1.839129, 1, 1, 1, 1, 1,
-1.677601, 1.778572, -0.5647884, 1, 1, 1, 1, 1,
-1.673782, 1.88248, -2.191163, 1, 1, 1, 1, 1,
-1.652209, 1.117619, -1.404024, 1, 1, 1, 1, 1,
-1.648872, -0.06985918, -4.290699, 1, 1, 1, 1, 1,
-1.645639, -0.5200934, -3.424813, 1, 1, 1, 1, 1,
-1.638892, -1.75134, -2.0543, 1, 1, 1, 1, 1,
-1.631118, -0.4633787, -2.72469, 1, 1, 1, 1, 1,
-1.628853, -0.145583, -2.344303, 1, 1, 1, 1, 1,
-1.628007, 0.07759333, -0.5906267, 1, 1, 1, 1, 1,
-1.626118, -0.2138664, -2.976402, 1, 1, 1, 1, 1,
-1.625606, -1.137095, -0.5951837, 1, 1, 1, 1, 1,
-1.623828, -1.364391, -1.8707, 0, 0, 1, 1, 1,
-1.617972, 0.7205908, -1.974494, 1, 0, 0, 1, 1,
-1.60842, -0.9445893, -4.063199, 1, 0, 0, 1, 1,
-1.598045, -0.5275214, -0.7562376, 1, 0, 0, 1, 1,
-1.59734, -0.4657276, -3.118867, 1, 0, 0, 1, 1,
-1.581069, -0.4960427, -1.133903, 1, 0, 0, 1, 1,
-1.575215, 0.3255738, -2.090843, 0, 0, 0, 1, 1,
-1.572134, -1.037911, -1.560117, 0, 0, 0, 1, 1,
-1.569586, -0.2697954, -1.782463, 0, 0, 0, 1, 1,
-1.561846, -0.597062, -1.285595, 0, 0, 0, 1, 1,
-1.559253, 1.159162, 0.1982023, 0, 0, 0, 1, 1,
-1.555428, 0.676461, -0.814303, 0, 0, 0, 1, 1,
-1.545412, -0.759244, -2.505547, 0, 0, 0, 1, 1,
-1.519774, 0.3261341, 0.2860606, 1, 1, 1, 1, 1,
-1.518061, 0.1713452, -1.199192, 1, 1, 1, 1, 1,
-1.515679, 0.8033055, -3.464144, 1, 1, 1, 1, 1,
-1.513453, 0.3621126, -1.13859, 1, 1, 1, 1, 1,
-1.512237, 1.156876, -1.234647, 1, 1, 1, 1, 1,
-1.504415, 0.2807639, -3.475646, 1, 1, 1, 1, 1,
-1.499303, 0.3684936, -2.51261, 1, 1, 1, 1, 1,
-1.492037, 0.1918602, -1.646738, 1, 1, 1, 1, 1,
-1.465619, 0.04666029, -2.501834, 1, 1, 1, 1, 1,
-1.464136, -1.159465, -4.027228, 1, 1, 1, 1, 1,
-1.451365, -0.3059825, -2.953593, 1, 1, 1, 1, 1,
-1.44816, -1.705354, -0.7105212, 1, 1, 1, 1, 1,
-1.445652, 0.3705812, -2.161088, 1, 1, 1, 1, 1,
-1.445578, -1.358443, -2.109308, 1, 1, 1, 1, 1,
-1.439648, -1.001921, -3.917688, 1, 1, 1, 1, 1,
-1.435173, -0.3983388, -1.306712, 0, 0, 1, 1, 1,
-1.424468, -0.4926479, -2.003099, 1, 0, 0, 1, 1,
-1.419005, 1.32451, -1.444395, 1, 0, 0, 1, 1,
-1.41731, 1.112691, -1.643776, 1, 0, 0, 1, 1,
-1.415117, 1.545, -0.5749651, 1, 0, 0, 1, 1,
-1.40204, 1.143704, -0.6834318, 1, 0, 0, 1, 1,
-1.386751, -0.2137389, -0.4678011, 0, 0, 0, 1, 1,
-1.380186, 1.121607, -1.313354, 0, 0, 0, 1, 1,
-1.374078, -0.591903, -2.101822, 0, 0, 0, 1, 1,
-1.352141, -1.808284, -2.858716, 0, 0, 0, 1, 1,
-1.346684, 0.7706608, -0.8336722, 0, 0, 0, 1, 1,
-1.336249, 1.582859, -0.4900786, 0, 0, 0, 1, 1,
-1.331498, -0.5542507, -2.650201, 0, 0, 0, 1, 1,
-1.330547, 1.012867, -3.349701, 1, 1, 1, 1, 1,
-1.323313, -0.2238629, -3.339463, 1, 1, 1, 1, 1,
-1.320706, 1.024419, -1.043769, 1, 1, 1, 1, 1,
-1.319685, -1.043672, -0.09698098, 1, 1, 1, 1, 1,
-1.316773, -0.4157029, -3.183011, 1, 1, 1, 1, 1,
-1.311988, -0.1615258, -1.41723, 1, 1, 1, 1, 1,
-1.311554, -0.2120559, -0.7755768, 1, 1, 1, 1, 1,
-1.306506, -0.1679712, -2.230731, 1, 1, 1, 1, 1,
-1.305842, -0.4839286, -2.338731, 1, 1, 1, 1, 1,
-1.296308, -0.4127309, -2.619687, 1, 1, 1, 1, 1,
-1.29514, -0.2593851, -0.6506522, 1, 1, 1, 1, 1,
-1.289755, 1.235531, 0.123256, 1, 1, 1, 1, 1,
-1.287996, -0.3428581, -1.26416, 1, 1, 1, 1, 1,
-1.270367, -0.7505, -0.6942272, 1, 1, 1, 1, 1,
-1.261065, 0.4536646, 0.2407288, 1, 1, 1, 1, 1,
-1.260194, 0.5127923, -1.432884, 0, 0, 1, 1, 1,
-1.257987, 0.2574209, -2.39159, 1, 0, 0, 1, 1,
-1.256765, 1.039972, -1.312819, 1, 0, 0, 1, 1,
-1.256349, 0.4520045, -1.762766, 1, 0, 0, 1, 1,
-1.237502, -0.7263701, -1.432, 1, 0, 0, 1, 1,
-1.234187, -1.799693, -2.936759, 1, 0, 0, 1, 1,
-1.209066, -1.483879, -1.339117, 0, 0, 0, 1, 1,
-1.195572, 0.5156604, -1.440933, 0, 0, 0, 1, 1,
-1.188625, -0.9854383, -2.060096, 0, 0, 0, 1, 1,
-1.180532, -0.9933305, -1.054548, 0, 0, 0, 1, 1,
-1.163665, -0.3088392, -2.346481, 0, 0, 0, 1, 1,
-1.15063, -0.8941954, -4.200855, 0, 0, 0, 1, 1,
-1.144349, 0.01533586, -1.800187, 0, 0, 0, 1, 1,
-1.141851, 1.50278, 0.7572688, 1, 1, 1, 1, 1,
-1.140696, -0.103884, 0.1189461, 1, 1, 1, 1, 1,
-1.12085, -0.11588, -2.782868, 1, 1, 1, 1, 1,
-1.118356, -0.2965026, -0.1928472, 1, 1, 1, 1, 1,
-1.115554, 1.543895, -0.6624265, 1, 1, 1, 1, 1,
-1.113293, 0.6861694, -0.937033, 1, 1, 1, 1, 1,
-1.108954, -0.6373404, -2.31915, 1, 1, 1, 1, 1,
-1.108407, 0.824529, 0.1757673, 1, 1, 1, 1, 1,
-1.104841, -1.212937, -1.457289, 1, 1, 1, 1, 1,
-1.100819, -1.545577, -1.695913, 1, 1, 1, 1, 1,
-1.097676, 0.2536904, -0.809998, 1, 1, 1, 1, 1,
-1.096856, -1.622716, -3.471473, 1, 1, 1, 1, 1,
-1.091746, 0.3570861, -2.787177, 1, 1, 1, 1, 1,
-1.081043, 0.0141227, -2.700066, 1, 1, 1, 1, 1,
-1.075751, 0.1254552, -2.679733, 1, 1, 1, 1, 1,
-1.073848, -0.273569, -2.320697, 0, 0, 1, 1, 1,
-1.068056, -2.518929, -1.867189, 1, 0, 0, 1, 1,
-1.064462, 2.144975, 0.2718701, 1, 0, 0, 1, 1,
-1.059983, 0.2806044, 0.1733918, 1, 0, 0, 1, 1,
-1.051221, 0.2582361, -2.472407, 1, 0, 0, 1, 1,
-1.044129, -0.1213629, -1.454415, 1, 0, 0, 1, 1,
-1.043165, 1.820087, -0.6114165, 0, 0, 0, 1, 1,
-1.040275, 0.1607983, -1.436107, 0, 0, 0, 1, 1,
-1.036917, 0.7978997, -0.6566116, 0, 0, 0, 1, 1,
-1.036626, -0.1299992, -2.798841, 0, 0, 0, 1, 1,
-1.036149, 0.8190591, -1.123592, 0, 0, 0, 1, 1,
-1.022265, -1.646038, -2.153022, 0, 0, 0, 1, 1,
-1.019307, 2.190295, 1.793672, 0, 0, 0, 1, 1,
-1.012622, 1.430917, -0.749451, 1, 1, 1, 1, 1,
-1.005678, -2.076009, -2.806153, 1, 1, 1, 1, 1,
-1.001183, 1.460136, -0.2539596, 1, 1, 1, 1, 1,
-0.9978576, 0.9610356, -1.171698, 1, 1, 1, 1, 1,
-0.9956726, -0.6559848, -2.713011, 1, 1, 1, 1, 1,
-0.9909757, -0.1073764, -2.994985, 1, 1, 1, 1, 1,
-0.9838803, -0.6261845, -2.706927, 1, 1, 1, 1, 1,
-0.9724595, -0.8275755, -2.503051, 1, 1, 1, 1, 1,
-0.9705396, -0.2625596, -2.156021, 1, 1, 1, 1, 1,
-0.9667024, -0.8591946, -1.258383, 1, 1, 1, 1, 1,
-0.9642224, 1.049941, -0.4671618, 1, 1, 1, 1, 1,
-0.9617348, 0.7081022, -1.0998, 1, 1, 1, 1, 1,
-0.9506852, -0.4154023, -1.619484, 1, 1, 1, 1, 1,
-0.9500029, 0.1787525, -1.213618, 1, 1, 1, 1, 1,
-0.9487001, -1.485077, -2.370316, 1, 1, 1, 1, 1,
-0.9452472, 0.8967295, 0.01289547, 0, 0, 1, 1, 1,
-0.9447621, -0.9636809, -2.734116, 1, 0, 0, 1, 1,
-0.9441399, -1.395675, -3.490726, 1, 0, 0, 1, 1,
-0.9437727, -1.272404, -3.057498, 1, 0, 0, 1, 1,
-0.9403546, -1.639767, -2.325775, 1, 0, 0, 1, 1,
-0.9358615, 2.029558, 0.3356816, 1, 0, 0, 1, 1,
-0.9341928, -1.064919, -4.55679, 0, 0, 0, 1, 1,
-0.9278539, -0.5294042, -1.856438, 0, 0, 0, 1, 1,
-0.9188905, -1.579617, -2.055436, 0, 0, 0, 1, 1,
-0.9145941, 2.346944, -1.515487, 0, 0, 0, 1, 1,
-0.9020625, 0.9337412, -1.149158, 0, 0, 0, 1, 1,
-0.8958242, -0.4684284, -1.844688, 0, 0, 0, 1, 1,
-0.8888781, 0.3724858, -0.3262478, 0, 0, 0, 1, 1,
-0.8829014, -1.923475, -3.015936, 1, 1, 1, 1, 1,
-0.8797085, -1.047807, -1.976967, 1, 1, 1, 1, 1,
-0.8772104, 0.7701665, -0.7502604, 1, 1, 1, 1, 1,
-0.8764684, 1.774583, -0.6921954, 1, 1, 1, 1, 1,
-0.8730283, 1.132681, -0.4267065, 1, 1, 1, 1, 1,
-0.8727114, -0.7141753, -1.0916, 1, 1, 1, 1, 1,
-0.8703303, 0.9193962, -1.515819, 1, 1, 1, 1, 1,
-0.8678728, -0.911077, -2.829236, 1, 1, 1, 1, 1,
-0.8672062, 0.3571507, -0.6938652, 1, 1, 1, 1, 1,
-0.8670554, -0.09739082, -3.370793, 1, 1, 1, 1, 1,
-0.8636951, 1.498534, 0.1539176, 1, 1, 1, 1, 1,
-0.8627374, -0.8735942, -2.302772, 1, 1, 1, 1, 1,
-0.8615462, -2.303892, -1.511315, 1, 1, 1, 1, 1,
-0.8590475, 0.1180917, -3.091841, 1, 1, 1, 1, 1,
-0.8559639, -1.525833, -1.078963, 1, 1, 1, 1, 1,
-0.8552347, -0.0831247, -3.136485, 0, 0, 1, 1, 1,
-0.8536808, -0.3818627, 0.05801748, 1, 0, 0, 1, 1,
-0.8463489, 0.3417709, -1.572269, 1, 0, 0, 1, 1,
-0.8457351, -0.5765193, -3.134662, 1, 0, 0, 1, 1,
-0.8422612, -0.7951998, -2.802884, 1, 0, 0, 1, 1,
-0.8420672, 0.7129088, -0.5013204, 1, 0, 0, 1, 1,
-0.8400667, -1.577717, -2.321915, 0, 0, 0, 1, 1,
-0.8389937, 0.1906366, -1.148784, 0, 0, 0, 1, 1,
-0.8376814, -1.140831, -2.490209, 0, 0, 0, 1, 1,
-0.8376058, -0.8397627, -3.328641, 0, 0, 0, 1, 1,
-0.8309536, 0.6044599, 0.5590087, 0, 0, 0, 1, 1,
-0.8266993, -0.4112617, -2.323072, 0, 0, 0, 1, 1,
-0.8216471, 0.2030308, -0.1162218, 0, 0, 0, 1, 1,
-0.8140684, 0.687902, -4.025883, 1, 1, 1, 1, 1,
-0.8056656, 0.2993194, -1.886853, 1, 1, 1, 1, 1,
-0.7982896, 0.05146411, -1.680998, 1, 1, 1, 1, 1,
-0.7936875, -0.08894176, -0.2168482, 1, 1, 1, 1, 1,
-0.7885615, -1.58257, -3.002762, 1, 1, 1, 1, 1,
-0.7872779, 2.365287, 0.4549288, 1, 1, 1, 1, 1,
-0.7816848, 0.2523121, 0.4744501, 1, 1, 1, 1, 1,
-0.7793627, 0.9445149, -1.242011, 1, 1, 1, 1, 1,
-0.7772269, 1.377796, -1.794012, 1, 1, 1, 1, 1,
-0.7754083, 1.777436, -1.267548, 1, 1, 1, 1, 1,
-0.7724902, -1.058281, -3.165689, 1, 1, 1, 1, 1,
-0.767343, 0.1139546, -1.731956, 1, 1, 1, 1, 1,
-0.7656736, 0.1132552, -2.224045, 1, 1, 1, 1, 1,
-0.7624177, 0.6821501, -1.761709, 1, 1, 1, 1, 1,
-0.760763, -0.9378007, -2.939634, 1, 1, 1, 1, 1,
-0.7583258, -0.09309838, -2.218109, 0, 0, 1, 1, 1,
-0.7569912, -1.510114, -2.008805, 1, 0, 0, 1, 1,
-0.7520847, -1.02139, -1.868363, 1, 0, 0, 1, 1,
-0.7463413, 0.226396, -2.139895, 1, 0, 0, 1, 1,
-0.7447272, 0.6031976, 0.02655696, 1, 0, 0, 1, 1,
-0.7446144, 2.017671, -0.3270957, 1, 0, 0, 1, 1,
-0.739378, 1.625088, -0.2700804, 0, 0, 0, 1, 1,
-0.7388908, -0.6225105, -2.300549, 0, 0, 0, 1, 1,
-0.7375225, -0.2883501, -2.868719, 0, 0, 0, 1, 1,
-0.7326519, 1.021801, -1.539878, 0, 0, 0, 1, 1,
-0.7264647, 1.431945, -0.5074249, 0, 0, 0, 1, 1,
-0.7263011, 0.3997028, -1.420444, 0, 0, 0, 1, 1,
-0.7244908, -0.6556733, -2.205168, 0, 0, 0, 1, 1,
-0.7228726, -0.2608028, -2.968165, 1, 1, 1, 1, 1,
-0.7171414, -0.9597824, -2.934701, 1, 1, 1, 1, 1,
-0.7149203, 0.4275658, -0.8715463, 1, 1, 1, 1, 1,
-0.7022023, 0.7105723, 0.7825752, 1, 1, 1, 1, 1,
-0.7016369, -0.03476205, -0.4339592, 1, 1, 1, 1, 1,
-0.6942805, -1.371218, -2.805708, 1, 1, 1, 1, 1,
-0.690434, -0.7226686, -1.326411, 1, 1, 1, 1, 1,
-0.6889057, -0.5967975, -3.103833, 1, 1, 1, 1, 1,
-0.6868273, -0.253061, -2.834055, 1, 1, 1, 1, 1,
-0.6826168, 1.91256, -1.628159, 1, 1, 1, 1, 1,
-0.6816467, -0.4068209, -2.309572, 1, 1, 1, 1, 1,
-0.67557, 0.5066932, 1.746541, 1, 1, 1, 1, 1,
-0.6748147, 0.6799491, -1.095099, 1, 1, 1, 1, 1,
-0.6733745, 1.212115, -0.6265614, 1, 1, 1, 1, 1,
-0.6686229, 0.7531984, 0.4716519, 1, 1, 1, 1, 1,
-0.6652452, -1.075243, -1.150626, 0, 0, 1, 1, 1,
-0.662214, 0.09815796, -0.7759373, 1, 0, 0, 1, 1,
-0.6546938, -1.955757, -3.920306, 1, 0, 0, 1, 1,
-0.6531348, -0.3494762, -1.29873, 1, 0, 0, 1, 1,
-0.6529998, -1.319682, -3.505766, 1, 0, 0, 1, 1,
-0.6510717, -0.1539801, -1.304555, 1, 0, 0, 1, 1,
-0.6508607, 0.7187613, 0.3870955, 0, 0, 0, 1, 1,
-0.6505337, 0.02600125, -0.4284938, 0, 0, 0, 1, 1,
-0.650197, -0.4478724, -4.134234, 0, 0, 0, 1, 1,
-0.644464, 0.121653, -1.507356, 0, 0, 0, 1, 1,
-0.643521, -0.3024137, -1.412686, 0, 0, 0, 1, 1,
-0.6431409, -1.457056, -2.775884, 0, 0, 0, 1, 1,
-0.6388117, -0.7548811, -1.916793, 0, 0, 0, 1, 1,
-0.6292405, -0.3464464, -2.206547, 1, 1, 1, 1, 1,
-0.6248236, 0.1224255, -2.586666, 1, 1, 1, 1, 1,
-0.6218972, -1.011293, -3.088249, 1, 1, 1, 1, 1,
-0.6216955, 1.23573, 0.9416993, 1, 1, 1, 1, 1,
-0.6211559, 2.627177, -0.1904555, 1, 1, 1, 1, 1,
-0.620822, 0.4678901, -1.569564, 1, 1, 1, 1, 1,
-0.6206019, -0.4803486, -1.444701, 1, 1, 1, 1, 1,
-0.6182158, 2.271961, 1.007316, 1, 1, 1, 1, 1,
-0.6167217, -0.4976596, -4.128551, 1, 1, 1, 1, 1,
-0.6155766, -1.223094, -1.264771, 1, 1, 1, 1, 1,
-0.6133557, 1.388333, -1.673856, 1, 1, 1, 1, 1,
-0.6128685, 1.389791, 0.03576102, 1, 1, 1, 1, 1,
-0.6127399, -1.609327, -3.867998, 1, 1, 1, 1, 1,
-0.608512, 0.1797649, -0.4040728, 1, 1, 1, 1, 1,
-0.6062919, -2.07244, -2.085739, 1, 1, 1, 1, 1,
-0.6059946, -0.5194731, -2.816166, 0, 0, 1, 1, 1,
-0.6057228, 0.471224, -0.3124972, 1, 0, 0, 1, 1,
-0.6045191, -0.5491898, -3.022231, 1, 0, 0, 1, 1,
-0.6038262, 0.0592445, -1.653787, 1, 0, 0, 1, 1,
-0.6017958, -1.160925, -2.564551, 1, 0, 0, 1, 1,
-0.6006548, 0.1064984, -2.31028, 1, 0, 0, 1, 1,
-0.5995079, -0.4000768, -2.162003, 0, 0, 0, 1, 1,
-0.5950258, -0.6428922, -1.931983, 0, 0, 0, 1, 1,
-0.5916526, 1.094694, -0.635522, 0, 0, 0, 1, 1,
-0.5916227, 1.278348, -1.233325, 0, 0, 0, 1, 1,
-0.5915152, 1.000704, 0.3224497, 0, 0, 0, 1, 1,
-0.5895272, 0.6619277, -1.315565, 0, 0, 0, 1, 1,
-0.5894674, 0.990567, -1.588183, 0, 0, 0, 1, 1,
-0.5867701, -0.05307756, -3.387983, 1, 1, 1, 1, 1,
-0.5865738, -1.102498, -2.924481, 1, 1, 1, 1, 1,
-0.5772529, -0.4378633, -2.379335, 1, 1, 1, 1, 1,
-0.5750787, -0.7904693, -3.091876, 1, 1, 1, 1, 1,
-0.5729342, -0.5506791, -3.928555, 1, 1, 1, 1, 1,
-0.5667146, 1.576041, 0.1341654, 1, 1, 1, 1, 1,
-0.5574328, 0.9970809, -1.550876, 1, 1, 1, 1, 1,
-0.553386, -0.7958328, -3.437384, 1, 1, 1, 1, 1,
-0.5485684, -0.2413945, -2.842758, 1, 1, 1, 1, 1,
-0.5476933, -1.201028, -2.59109, 1, 1, 1, 1, 1,
-0.5468423, -0.810914, -2.735466, 1, 1, 1, 1, 1,
-0.5451753, -1.167871, -3.751081, 1, 1, 1, 1, 1,
-0.5438033, -0.05780892, -1.875042, 1, 1, 1, 1, 1,
-0.5410765, 0.1891055, -0.6604222, 1, 1, 1, 1, 1,
-0.540305, -0.4931807, -2.988012, 1, 1, 1, 1, 1,
-0.5394121, -0.4283579, -1.951495, 0, 0, 1, 1, 1,
-0.5336571, 0.08842028, 0.4875659, 1, 0, 0, 1, 1,
-0.5288744, 0.9474187, -3.046426, 1, 0, 0, 1, 1,
-0.5265046, -1.239621, -2.456262, 1, 0, 0, 1, 1,
-0.5261322, 0.3235787, -2.300889, 1, 0, 0, 1, 1,
-0.5259255, 1.412995, 0.8293997, 1, 0, 0, 1, 1,
-0.5254851, 0.6639472, -0.443466, 0, 0, 0, 1, 1,
-0.5236068, -1.127517, -3.011507, 0, 0, 0, 1, 1,
-0.5225776, -1.03541, -1.678607, 0, 0, 0, 1, 1,
-0.5222439, -0.9376076, -2.997459, 0, 0, 0, 1, 1,
-0.520954, -0.3812936, -2.244726, 0, 0, 0, 1, 1,
-0.5159018, -1.088859, -4.35712, 0, 0, 0, 1, 1,
-0.5123406, 0.3982383, -2.976215, 0, 0, 0, 1, 1,
-0.5082477, -1.234581, -1.110651, 1, 1, 1, 1, 1,
-0.503841, -0.3727699, -0.8639029, 1, 1, 1, 1, 1,
-0.5035375, -0.7642271, -2.33134, 1, 1, 1, 1, 1,
-0.5034242, 0.2489087, -1.94743, 1, 1, 1, 1, 1,
-0.5033891, 1.520474, -0.5150887, 1, 1, 1, 1, 1,
-0.5032031, -0.4935664, -2.112535, 1, 1, 1, 1, 1,
-0.4985596, 0.6821494, -0.7692199, 1, 1, 1, 1, 1,
-0.4924137, -0.5979273, -1.914489, 1, 1, 1, 1, 1,
-0.4857667, 0.9885072, 0.4890886, 1, 1, 1, 1, 1,
-0.4836192, -1.087228, -1.271445, 1, 1, 1, 1, 1,
-0.4802709, 0.5002128, 0.8409458, 1, 1, 1, 1, 1,
-0.4783704, 0.5497776, -1.625991, 1, 1, 1, 1, 1,
-0.4736782, 0.2817935, -0.4753708, 1, 1, 1, 1, 1,
-0.4698152, 0.1932966, -2.001744, 1, 1, 1, 1, 1,
-0.4638357, 0.2796481, -0.9511421, 1, 1, 1, 1, 1,
-0.4620458, -0.2934277, -3.248037, 0, 0, 1, 1, 1,
-0.4604146, 1.478518, -1.264612, 1, 0, 0, 1, 1,
-0.4591526, -0.583509, -1.63209, 1, 0, 0, 1, 1,
-0.4549068, -0.4317997, -2.503064, 1, 0, 0, 1, 1,
-0.4500665, -0.5419186, -1.635198, 1, 0, 0, 1, 1,
-0.4489283, 0.9832581, -0.7125561, 1, 0, 0, 1, 1,
-0.4479318, -1.085307, -4.087555, 0, 0, 0, 1, 1,
-0.441804, 0.2109333, -1.630752, 0, 0, 0, 1, 1,
-0.4410731, 0.08689601, -0.3565972, 0, 0, 0, 1, 1,
-0.4353632, 1.240264, -2.111444, 0, 0, 0, 1, 1,
-0.4349959, 0.04912462, -2.364458, 0, 0, 0, 1, 1,
-0.4334191, -0.6799724, -1.901172, 0, 0, 0, 1, 1,
-0.4318257, -0.4505731, -3.27908, 0, 0, 0, 1, 1,
-0.4280914, 0.6289756, 0.08186784, 1, 1, 1, 1, 1,
-0.4270281, 0.1036047, -0.7361549, 1, 1, 1, 1, 1,
-0.4244377, -0.286617, -4.847011, 1, 1, 1, 1, 1,
-0.4239406, 0.3513791, -2.298995, 1, 1, 1, 1, 1,
-0.4231191, 2.121505, -1.078918, 1, 1, 1, 1, 1,
-0.4219263, -1.849825, -4.154232, 1, 1, 1, 1, 1,
-0.4203178, -1.313996, -4.31157, 1, 1, 1, 1, 1,
-0.4194329, 0.02407756, -0.340093, 1, 1, 1, 1, 1,
-0.4169815, 1.441887, -0.1664886, 1, 1, 1, 1, 1,
-0.4168558, 2.5595, 0.1813247, 1, 1, 1, 1, 1,
-0.4155602, 0.543101, -1.771259, 1, 1, 1, 1, 1,
-0.4112085, -0.4506579, -1.27762, 1, 1, 1, 1, 1,
-0.4098993, 0.239889, -2.814972, 1, 1, 1, 1, 1,
-0.4097146, 1.050735, -1.313408, 1, 1, 1, 1, 1,
-0.4096209, 0.09312982, -2.926852, 1, 1, 1, 1, 1,
-0.4065676, -0.02539209, -1.28846, 0, 0, 1, 1, 1,
-0.4059174, -0.02704174, 0.5717532, 1, 0, 0, 1, 1,
-0.4036793, -0.8346028, -2.553868, 1, 0, 0, 1, 1,
-0.3932843, -0.7877259, -2.405658, 1, 0, 0, 1, 1,
-0.3930177, 2.531706, 1.21046, 1, 0, 0, 1, 1,
-0.3864245, 0.6644478, 0.1586611, 1, 0, 0, 1, 1,
-0.3782081, 3.065926, 1.744399, 0, 0, 0, 1, 1,
-0.3755201, -0.1872624, -3.836966, 0, 0, 0, 1, 1,
-0.375148, -0.2150304, -0.3599874, 0, 0, 0, 1, 1,
-0.3738, -0.2152046, -0.8908578, 0, 0, 0, 1, 1,
-0.3619044, 0.4215071, -0.1218494, 0, 0, 0, 1, 1,
-0.3606666, 0.1304573, -2.046579, 0, 0, 0, 1, 1,
-0.3603358, 1.758754, 1.098185, 0, 0, 0, 1, 1,
-0.3570715, 0.04764304, -1.192976, 1, 1, 1, 1, 1,
-0.3554085, 1.527685, -0.3346719, 1, 1, 1, 1, 1,
-0.3514914, -0.8961717, -3.152767, 1, 1, 1, 1, 1,
-0.341134, 1.806308, -0.8548897, 1, 1, 1, 1, 1,
-0.3386196, -1.040891, -4.066738, 1, 1, 1, 1, 1,
-0.3366204, 1.196696, 2.157806, 1, 1, 1, 1, 1,
-0.3355708, 0.1278013, -1.805702, 1, 1, 1, 1, 1,
-0.3319246, 0.04017754, 0.9663201, 1, 1, 1, 1, 1,
-0.3296914, -0.780022, -2.927451, 1, 1, 1, 1, 1,
-0.3170429, -0.000893298, -1.618289, 1, 1, 1, 1, 1,
-0.3160322, 1.158214, 0.5570631, 1, 1, 1, 1, 1,
-0.3156792, -1.113447, -3.208915, 1, 1, 1, 1, 1,
-0.3145679, -0.02540114, -0.9154873, 1, 1, 1, 1, 1,
-0.3116914, -0.06548703, -2.039185, 1, 1, 1, 1, 1,
-0.3105493, 1.262789, -0.9967156, 1, 1, 1, 1, 1,
-0.308006, 0.3141838, 0.06315584, 0, 0, 1, 1, 1,
-0.3068053, -1.085918, -4.377324, 1, 0, 0, 1, 1,
-0.3048054, 1.189607, 0.3654643, 1, 0, 0, 1, 1,
-0.3001347, -0.5700487, -1.664631, 1, 0, 0, 1, 1,
-0.2960272, -0.6258705, -4.477073, 1, 0, 0, 1, 1,
-0.2953955, 0.5350487, -1.618341, 1, 0, 0, 1, 1,
-0.2932986, -0.803348, -2.674587, 0, 0, 0, 1, 1,
-0.292086, 2.41799, 1.921113, 0, 0, 0, 1, 1,
-0.2866774, -0.6822682, -3.813941, 0, 0, 0, 1, 1,
-0.2843949, 2.17526, 1.034413, 0, 0, 0, 1, 1,
-0.2841806, -1.115439, 0.2281697, 0, 0, 0, 1, 1,
-0.2828673, -0.1121782, -2.610668, 0, 0, 0, 1, 1,
-0.2802577, 0.9783635, -0.4903482, 0, 0, 0, 1, 1,
-0.2790286, 0.3764262, -0.9903321, 1, 1, 1, 1, 1,
-0.2740912, 0.9733022, 0.32787, 1, 1, 1, 1, 1,
-0.2714261, -0.1221867, -1.594744, 1, 1, 1, 1, 1,
-0.2657289, -1.531595, -3.385832, 1, 1, 1, 1, 1,
-0.2569666, 1.587798, -1.339134, 1, 1, 1, 1, 1,
-0.2560479, 1.456265, -0.1502884, 1, 1, 1, 1, 1,
-0.2552617, 1.810839, -0.5207145, 1, 1, 1, 1, 1,
-0.2528718, 1.842001, 0.9922619, 1, 1, 1, 1, 1,
-0.2464745, 1.703714, -0.5827438, 1, 1, 1, 1, 1,
-0.2464226, -0.4759311, -3.738633, 1, 1, 1, 1, 1,
-0.2448993, -1.488383, -3.967727, 1, 1, 1, 1, 1,
-0.2445229, -1.417645, -2.37779, 1, 1, 1, 1, 1,
-0.242451, 1.08922, 0.4894761, 1, 1, 1, 1, 1,
-0.2370078, -0.1634452, -1.518341, 1, 1, 1, 1, 1,
-0.2336561, -1.15939, -2.028549, 1, 1, 1, 1, 1,
-0.2333621, -1.722457, -2.725804, 0, 0, 1, 1, 1,
-0.2324826, 1.027035, -1.018734, 1, 0, 0, 1, 1,
-0.2284042, 0.66952, 0.9311519, 1, 0, 0, 1, 1,
-0.227886, -1.397695, -1.981939, 1, 0, 0, 1, 1,
-0.2276363, -1.783336, -2.511716, 1, 0, 0, 1, 1,
-0.2228337, 0.7120387, -0.9375681, 1, 0, 0, 1, 1,
-0.221842, -0.7281708, -2.874669, 0, 0, 0, 1, 1,
-0.2185844, -0.5627866, -4.361568, 0, 0, 0, 1, 1,
-0.2169361, 0.6623995, 0.9581099, 0, 0, 0, 1, 1,
-0.212877, 1.134967, -1.592186, 0, 0, 0, 1, 1,
-0.2105686, 0.300998, -2.340714, 0, 0, 0, 1, 1,
-0.206477, 0.9088533, -0.9359061, 0, 0, 0, 1, 1,
-0.2024011, -0.1564817, -1.148011, 0, 0, 0, 1, 1,
-0.2011041, -0.5722901, -2.736788, 1, 1, 1, 1, 1,
-0.1967086, 0.3854323, 0.1923986, 1, 1, 1, 1, 1,
-0.1956292, 1.278407, 0.006842542, 1, 1, 1, 1, 1,
-0.1953458, -0.5295383, -3.036889, 1, 1, 1, 1, 1,
-0.1939495, 1.74013, 1.275703, 1, 1, 1, 1, 1,
-0.1920031, 0.2341324, -0.7263794, 1, 1, 1, 1, 1,
-0.189814, 0.5379808, -0.1869062, 1, 1, 1, 1, 1,
-0.1851175, -0.7839886, -2.982597, 1, 1, 1, 1, 1,
-0.1668567, -0.4649224, -2.523303, 1, 1, 1, 1, 1,
-0.1647935, 0.527405, 0.2790817, 1, 1, 1, 1, 1,
-0.1632355, 0.8670899, -1.598127, 1, 1, 1, 1, 1,
-0.1625698, 1.458088, -0.653813, 1, 1, 1, 1, 1,
-0.1541623, -0.2178725, -2.830717, 1, 1, 1, 1, 1,
-0.1535931, -0.7870054, -4.1615, 1, 1, 1, 1, 1,
-0.1485242, -0.5648775, -3.897809, 1, 1, 1, 1, 1,
-0.1470534, -2.007666, -4.490969, 0, 0, 1, 1, 1,
-0.1469259, -1.459804, -4.125263, 1, 0, 0, 1, 1,
-0.1457531, 0.7470907, -0.9135984, 1, 0, 0, 1, 1,
-0.1453926, -0.3975047, -2.414487, 1, 0, 0, 1, 1,
-0.1408096, 0.2757694, -0.9491587, 1, 0, 0, 1, 1,
-0.1401186, 0.569854, 0.4453488, 1, 0, 0, 1, 1,
-0.1393735, 0.3600813, 1.615484, 0, 0, 0, 1, 1,
-0.1353801, -2.393151, -1.998608, 0, 0, 0, 1, 1,
-0.1321936, -1.180273, -2.737041, 0, 0, 0, 1, 1,
-0.1251901, 1.040684, -0.5560375, 0, 0, 0, 1, 1,
-0.1209111, -1.477366, -3.207842, 0, 0, 0, 1, 1,
-0.1134419, -2.075089, -2.327267, 0, 0, 0, 1, 1,
-0.1124848, 0.863323, -0.9467333, 0, 0, 0, 1, 1,
-0.1111726, 0.7382234, 0.01309575, 1, 1, 1, 1, 1,
-0.1094013, -0.2364069, -2.419668, 1, 1, 1, 1, 1,
-0.1083691, -1.289062, -4.035602, 1, 1, 1, 1, 1,
-0.1079925, 1.655961, -0.4089079, 1, 1, 1, 1, 1,
-0.1073636, -0.1311505, -1.277978, 1, 1, 1, 1, 1,
-0.09963728, -0.2880509, -2.850738, 1, 1, 1, 1, 1,
-0.09804505, 0.4447958, 0.6174223, 1, 1, 1, 1, 1,
-0.09217212, 0.09831504, -0.5061404, 1, 1, 1, 1, 1,
-0.09197374, -0.7483765, -4.171204, 1, 1, 1, 1, 1,
-0.08887067, 1.352359, -0.8046883, 1, 1, 1, 1, 1,
-0.08844747, -0.0945526, -2.408262, 1, 1, 1, 1, 1,
-0.08418465, 0.1936729, -0.3188385, 1, 1, 1, 1, 1,
-0.08233689, 0.1130261, -0.7118672, 1, 1, 1, 1, 1,
-0.08176884, -1.317732, -2.215247, 1, 1, 1, 1, 1,
-0.08035495, 1.005324, -0.6296201, 1, 1, 1, 1, 1,
-0.07983126, -1.015271, -1.283858, 0, 0, 1, 1, 1,
-0.07902879, 0.4557542, -0.9090062, 1, 0, 0, 1, 1,
-0.07594198, 0.2615462, -0.7877215, 1, 0, 0, 1, 1,
-0.07525086, 1.954419, -1.145234, 1, 0, 0, 1, 1,
-0.07514349, -0.3374302, -2.387952, 1, 0, 0, 1, 1,
-0.07453169, -0.6963617, -2.513879, 1, 0, 0, 1, 1,
-0.07427866, 0.4724979, 0.214957, 0, 0, 0, 1, 1,
-0.07051311, -0.6237285, -4.457276, 0, 0, 0, 1, 1,
-0.07014914, -1.293122, -1.790039, 0, 0, 0, 1, 1,
-0.06268491, -1.041471, -1.905483, 0, 0, 0, 1, 1,
-0.06207779, -0.2908602, -3.316234, 0, 0, 0, 1, 1,
-0.05810485, -0.2894765, -3.684665, 0, 0, 0, 1, 1,
-0.0560184, -1.080243, -2.082825, 0, 0, 0, 1, 1,
-0.05435064, 0.9528118, -0.02595112, 1, 1, 1, 1, 1,
-0.05049065, -0.07367019, -2.314212, 1, 1, 1, 1, 1,
-0.04341549, 0.6359388, -0.6532257, 1, 1, 1, 1, 1,
-0.04169668, 0.8119485, 1.78173, 1, 1, 1, 1, 1,
-0.0409155, 0.2620099, -0.1719023, 1, 1, 1, 1, 1,
-0.03773622, 0.2693026, 0.04249668, 1, 1, 1, 1, 1,
-0.03643403, 0.1155141, -1.64581, 1, 1, 1, 1, 1,
-0.0338906, 1.295177, 0.08370025, 1, 1, 1, 1, 1,
-0.03253613, 0.0002376364, 0.5512862, 1, 1, 1, 1, 1,
-0.03170618, 1.092376, -1.261771, 1, 1, 1, 1, 1,
-0.02756377, 0.3489955, -0.9616935, 1, 1, 1, 1, 1,
-0.02579462, 1.149351, 0.141505, 1, 1, 1, 1, 1,
-0.02246687, -0.06776719, -2.950727, 1, 1, 1, 1, 1,
-0.01468131, -0.4696799, -2.327684, 1, 1, 1, 1, 1,
-0.01461517, -2.649438, -2.126436, 1, 1, 1, 1, 1,
-0.01423079, -1.588634, -0.9396105, 0, 0, 1, 1, 1,
-0.01275472, 1.152835, 2.134762, 1, 0, 0, 1, 1,
-0.01101058, -0.1644251, -2.410715, 1, 0, 0, 1, 1,
-0.01010466, 0.3052569, -1.270386, 1, 0, 0, 1, 1,
-0.009143882, 2.622705, 0.6432222, 1, 0, 0, 1, 1,
-0.006150647, -0.5034717, -4.221878, 1, 0, 0, 1, 1,
-0.004229804, 1.458303, -0.1662691, 0, 0, 0, 1, 1,
-0.003647331, -0.2274061, -4.827596, 0, 0, 0, 1, 1,
-0.001960278, -0.5952914, -2.735152, 0, 0, 0, 1, 1,
-0.0002160666, 0.1146659, -0.8132015, 0, 0, 0, 1, 1,
-0.0001464568, -1.175162, -3.036306, 0, 0, 0, 1, 1,
0.001392301, -0.5794451, 3.368462, 0, 0, 0, 1, 1,
0.004379093, -0.9451053, 3.121121, 0, 0, 0, 1, 1,
0.00765107, 1.014288, 0.8081149, 1, 1, 1, 1, 1,
0.00891908, -1.047862, 3.199891, 1, 1, 1, 1, 1,
0.01337737, 0.3606113, 0.4656737, 1, 1, 1, 1, 1,
0.01564566, -0.7142918, 3.453839, 1, 1, 1, 1, 1,
0.01927043, -0.4139962, 3.089116, 1, 1, 1, 1, 1,
0.02880206, -0.8352435, 2.718331, 1, 1, 1, 1, 1,
0.02927496, -1.048408, 2.737134, 1, 1, 1, 1, 1,
0.03084756, 0.3696198, 0.5026909, 1, 1, 1, 1, 1,
0.03150887, -0.8913805, 1.926465, 1, 1, 1, 1, 1,
0.03218092, -1.467301, 4.238584, 1, 1, 1, 1, 1,
0.03347636, 0.2697729, 1.232478, 1, 1, 1, 1, 1,
0.04565053, -0.9787452, 3.505165, 1, 1, 1, 1, 1,
0.04731783, -0.3469791, 1.952023, 1, 1, 1, 1, 1,
0.04738719, -1.100721, 2.752284, 1, 1, 1, 1, 1,
0.04844694, 0.0009334128, 2.4089, 1, 1, 1, 1, 1,
0.05058039, 0.6175025, -1.220872, 0, 0, 1, 1, 1,
0.05358285, 1.797284, 1.687473, 1, 0, 0, 1, 1,
0.06067474, 1.083302, 1.79938, 1, 0, 0, 1, 1,
0.06265534, -1.137625, 2.659157, 1, 0, 0, 1, 1,
0.06621117, -0.01411717, 2.600867, 1, 0, 0, 1, 1,
0.07042413, -0.4718543, 2.022748, 1, 0, 0, 1, 1,
0.07177128, -1.265468, 1.527244, 0, 0, 0, 1, 1,
0.0738085, -0.3672571, 2.441317, 0, 0, 0, 1, 1,
0.07439481, -2.638192, 1.753094, 0, 0, 0, 1, 1,
0.07495096, -1.886559, 2.256269, 0, 0, 0, 1, 1,
0.07498093, -0.6366513, 2.327442, 0, 0, 0, 1, 1,
0.07952344, -1.756597, 3.606458, 0, 0, 0, 1, 1,
0.0811364, 0.7751899, 0.9732866, 0, 0, 0, 1, 1,
0.0927212, -0.7271615, 3.387238, 1, 1, 1, 1, 1,
0.09616403, -0.563474, 2.082335, 1, 1, 1, 1, 1,
0.09923916, -0.823926, 2.207011, 1, 1, 1, 1, 1,
0.1049151, 0.4272781, 0.5315415, 1, 1, 1, 1, 1,
0.110209, -0.2232341, 2.600122, 1, 1, 1, 1, 1,
0.1146211, -1.021737, 4.831364, 1, 1, 1, 1, 1,
0.1155401, 0.3791137, 0.9140672, 1, 1, 1, 1, 1,
0.1181307, 0.03211872, 1.386673, 1, 1, 1, 1, 1,
0.120204, 1.719723, 2.097096, 1, 1, 1, 1, 1,
0.1228174, -1.336627, 1.774204, 1, 1, 1, 1, 1,
0.1260547, -0.8920614, 3.301971, 1, 1, 1, 1, 1,
0.1287555, -2.746944, 3.280111, 1, 1, 1, 1, 1,
0.1403058, 1.052375, 1.127562, 1, 1, 1, 1, 1,
0.1410787, 0.5658131, -0.5118705, 1, 1, 1, 1, 1,
0.1419954, -0.1676886, 2.853734, 1, 1, 1, 1, 1,
0.1427674, -0.2162312, 2.4839, 0, 0, 1, 1, 1,
0.1445667, 2.595901, -0.9988275, 1, 0, 0, 1, 1,
0.1475177, -1.104047, 1.975982, 1, 0, 0, 1, 1,
0.1495948, -0.8476998, 3.269514, 1, 0, 0, 1, 1,
0.1501191, -1.620281, 2.508833, 1, 0, 0, 1, 1,
0.1503078, 1.384648, 0.6707355, 1, 0, 0, 1, 1,
0.1505147, -1.041478, 2.506273, 0, 0, 0, 1, 1,
0.1570692, -0.8070093, 3.037679, 0, 0, 0, 1, 1,
0.1615746, 1.115067, 0.7543926, 0, 0, 0, 1, 1,
0.1631166, 1.98131, -0.6257811, 0, 0, 0, 1, 1,
0.1684581, -1.055182, 3.262916, 0, 0, 0, 1, 1,
0.1695868, -0.8190254, 2.998451, 0, 0, 0, 1, 1,
0.1726491, 0.6453482, -1.273489, 0, 0, 0, 1, 1,
0.1727162, 0.03296492, 2.52376, 1, 1, 1, 1, 1,
0.1763131, 0.07484427, 1.53927, 1, 1, 1, 1, 1,
0.1812805, 0.03411866, 2.251899, 1, 1, 1, 1, 1,
0.182944, 1.06292, 0.2753763, 1, 1, 1, 1, 1,
0.1862509, -1.480474, 3.44702, 1, 1, 1, 1, 1,
0.1903686, 0.09105141, 2.389004, 1, 1, 1, 1, 1,
0.1923899, 0.9247479, 1.58633, 1, 1, 1, 1, 1,
0.1955174, 0.1110271, 1.169588, 1, 1, 1, 1, 1,
0.1974467, 0.6311869, -0.8405982, 1, 1, 1, 1, 1,
0.2028216, 0.08267356, 1.582805, 1, 1, 1, 1, 1,
0.2050013, -1.863915, 1.57543, 1, 1, 1, 1, 1,
0.2057042, -0.1912461, 1.663869, 1, 1, 1, 1, 1,
0.2100995, -0.7858489, 3.379983, 1, 1, 1, 1, 1,
0.2108211, -1.471117, 3.02672, 1, 1, 1, 1, 1,
0.2112772, 1.110919, 2.020983, 1, 1, 1, 1, 1,
0.2123728, 0.188229, -0.1380938, 0, 0, 1, 1, 1,
0.2150607, 0.3662794, 1.883358, 1, 0, 0, 1, 1,
0.21544, 1.120038, 1.39003, 1, 0, 0, 1, 1,
0.2179419, -1.236757, 3.148092, 1, 0, 0, 1, 1,
0.2263426, -0.6032041, 1.826979, 1, 0, 0, 1, 1,
0.2276199, 0.4452395, 0.982186, 1, 0, 0, 1, 1,
0.2303343, 0.2814483, -0.3202597, 0, 0, 0, 1, 1,
0.2342346, -0.1642356, 2.195509, 0, 0, 0, 1, 1,
0.2345333, 0.008946992, 3.270721, 0, 0, 0, 1, 1,
0.2349212, 0.2671027, 1.9184, 0, 0, 0, 1, 1,
0.244635, 0.6482691, -0.007141142, 0, 0, 0, 1, 1,
0.2457566, 0.454666, 0.2741631, 0, 0, 0, 1, 1,
0.2481127, 0.2034148, 1.462094, 0, 0, 0, 1, 1,
0.2482057, 0.3425715, 0.7230693, 1, 1, 1, 1, 1,
0.2499733, 0.1155238, 2.025944, 1, 1, 1, 1, 1,
0.2538154, 1.024196, 0.1709918, 1, 1, 1, 1, 1,
0.2548664, -0.6251953, 1.049444, 1, 1, 1, 1, 1,
0.255648, 0.741134, 0.4432243, 1, 1, 1, 1, 1,
0.2580042, 2.346825, -0.1032667, 1, 1, 1, 1, 1,
0.261015, 0.4204711, 0.7333055, 1, 1, 1, 1, 1,
0.2658405, -0.8444653, 2.204059, 1, 1, 1, 1, 1,
0.2706688, -0.2483647, 3.776293, 1, 1, 1, 1, 1,
0.2755196, -1.100784, 3.197023, 1, 1, 1, 1, 1,
0.2756559, -0.004039434, 3.0501, 1, 1, 1, 1, 1,
0.277129, -0.2015666, 2.416188, 1, 1, 1, 1, 1,
0.2793151, -1.757944, 3.173801, 1, 1, 1, 1, 1,
0.2808816, -1.649221, 2.509148, 1, 1, 1, 1, 1,
0.2815817, -0.5853086, 2.711852, 1, 1, 1, 1, 1,
0.2817148, -0.2370764, 2.971412, 0, 0, 1, 1, 1,
0.2829609, -0.4628256, 3.439304, 1, 0, 0, 1, 1,
0.2900952, -2.04999, 2.934028, 1, 0, 0, 1, 1,
0.2928707, -0.6252897, 1.567143, 1, 0, 0, 1, 1,
0.2938949, 0.9965203, 1.045245, 1, 0, 0, 1, 1,
0.3014846, -1.44801, 4.71374, 1, 0, 0, 1, 1,
0.3101745, 2.29201, -1.428368, 0, 0, 0, 1, 1,
0.3106113, 0.1205636, 0.8715585, 0, 0, 0, 1, 1,
0.3117507, 1.540745, 1.808415, 0, 0, 0, 1, 1,
0.3150368, -0.8959275, 1.80027, 0, 0, 0, 1, 1,
0.3186499, 2.070745, -0.5123444, 0, 0, 0, 1, 1,
0.3197159, 0.7723134, 0.202078, 0, 0, 0, 1, 1,
0.3200969, -1.355696, 2.844998, 0, 0, 0, 1, 1,
0.3214977, -1.446338, 2.753333, 1, 1, 1, 1, 1,
0.3256825, -1.540619, 4.496236, 1, 1, 1, 1, 1,
0.3271218, -2.399572, 2.354288, 1, 1, 1, 1, 1,
0.3275949, -0.217594, 2.886869, 1, 1, 1, 1, 1,
0.3307646, 1.069355, 0.02521376, 1, 1, 1, 1, 1,
0.3324403, -1.061708, 3.898758, 1, 1, 1, 1, 1,
0.3384087, 2.183855, -0.4655764, 1, 1, 1, 1, 1,
0.3390507, -0.637467, 2.937697, 1, 1, 1, 1, 1,
0.3402894, 2.510248, 1.45915, 1, 1, 1, 1, 1,
0.3426858, 0.4445744, -0.04875843, 1, 1, 1, 1, 1,
0.3447064, 0.2695013, 0.1769768, 1, 1, 1, 1, 1,
0.3457594, 1.045488, 0.3618995, 1, 1, 1, 1, 1,
0.347458, 1.915104, -1.646938, 1, 1, 1, 1, 1,
0.3486176, 1.194158, 1.187078, 1, 1, 1, 1, 1,
0.3523176, 1.369009, 2.337256, 1, 1, 1, 1, 1,
0.3542758, 1.655051, 1.014367, 0, 0, 1, 1, 1,
0.3569503, 0.2620212, 2.332788, 1, 0, 0, 1, 1,
0.3592068, 0.08615943, 1.625436, 1, 0, 0, 1, 1,
0.3632098, 1.005325, -1.368454, 1, 0, 0, 1, 1,
0.3708252, -0.7457045, 1.845813, 1, 0, 0, 1, 1,
0.3803109, 0.9085882, -0.4708928, 1, 0, 0, 1, 1,
0.3815615, -1.367443, 4.933869, 0, 0, 0, 1, 1,
0.381675, -0.7536722, 2.400117, 0, 0, 0, 1, 1,
0.384045, -0.5449226, 2.622043, 0, 0, 0, 1, 1,
0.3850126, 0.6298875, 1.518841, 0, 0, 0, 1, 1,
0.3852946, -0.2439423, 3.079237, 0, 0, 0, 1, 1,
0.3875106, 1.308428, 2.351958, 0, 0, 0, 1, 1,
0.3915317, -0.6774718, 3.767709, 0, 0, 0, 1, 1,
0.3918823, -0.1643743, 1.47914, 1, 1, 1, 1, 1,
0.4006621, -1.639979, 3.18785, 1, 1, 1, 1, 1,
0.4010167, 1.199474, -1.365891, 1, 1, 1, 1, 1,
0.4031996, 1.561024, -0.1118074, 1, 1, 1, 1, 1,
0.4081449, -0.841679, 2.377752, 1, 1, 1, 1, 1,
0.4161007, -1.509046, 0.4432483, 1, 1, 1, 1, 1,
0.4189027, -1.339242, 3.398785, 1, 1, 1, 1, 1,
0.4189817, -0.454455, 3.066079, 1, 1, 1, 1, 1,
0.4306197, 1.427392, 0.8571354, 1, 1, 1, 1, 1,
0.4321441, -0.4355233, 2.233554, 1, 1, 1, 1, 1,
0.4347433, 0.354721, 0.1178994, 1, 1, 1, 1, 1,
0.4369023, -0.6337044, 1.615284, 1, 1, 1, 1, 1,
0.4370984, 1.448322, 0.2219506, 1, 1, 1, 1, 1,
0.4446706, -0.5580827, 2.982382, 1, 1, 1, 1, 1,
0.4482571, 0.3246471, -0.6176872, 1, 1, 1, 1, 1,
0.448463, 0.9995887, 0.4558378, 0, 0, 1, 1, 1,
0.4520988, 1.14144, -0.7184394, 1, 0, 0, 1, 1,
0.4530903, -1.289666, 3.09705, 1, 0, 0, 1, 1,
0.457918, -2.546758, 1.595737, 1, 0, 0, 1, 1,
0.4582208, 0.3953871, 2.240193, 1, 0, 0, 1, 1,
0.4583753, 0.5414935, 1.952877, 1, 0, 0, 1, 1,
0.4587123, -1.560545, 1.924726, 0, 0, 0, 1, 1,
0.4626804, -1.706277, 0.7601706, 0, 0, 0, 1, 1,
0.4629283, 1.050366, -1.863534, 0, 0, 0, 1, 1,
0.4639904, -0.280062, 1.888781, 0, 0, 0, 1, 1,
0.4671253, 1.335005, -0.1584965, 0, 0, 0, 1, 1,
0.4676212, 1.165621, -0.3109629, 0, 0, 0, 1, 1,
0.4744514, -0.6573031, 3.002754, 0, 0, 0, 1, 1,
0.4770102, -0.3294761, 0.381365, 1, 1, 1, 1, 1,
0.4773622, 0.3015728, 0.5157285, 1, 1, 1, 1, 1,
0.4796469, -0.07325856, 3.0318, 1, 1, 1, 1, 1,
0.4819225, 0.06067732, 0.2474319, 1, 1, 1, 1, 1,
0.482949, -0.2500796, 2.376947, 1, 1, 1, 1, 1,
0.48308, -1.051655, 1.948686, 1, 1, 1, 1, 1,
0.4840341, 0.625475, -1.424062, 1, 1, 1, 1, 1,
0.492696, -0.01943118, 1.398322, 1, 1, 1, 1, 1,
0.4932469, 0.2077969, 0.9483485, 1, 1, 1, 1, 1,
0.4939533, -0.6766331, 2.24466, 1, 1, 1, 1, 1,
0.5028303, -0.7896291, 2.844485, 1, 1, 1, 1, 1,
0.5046581, -0.8880458, 2.942828, 1, 1, 1, 1, 1,
0.5047912, 0.5167206, 3.09003, 1, 1, 1, 1, 1,
0.5120701, 1.782183, 0.08370588, 1, 1, 1, 1, 1,
0.5181117, -0.6603498, 1.678622, 1, 1, 1, 1, 1,
0.5198157, -0.878156, 3.637228, 0, 0, 1, 1, 1,
0.5218247, 0.406848, 0.3276681, 1, 0, 0, 1, 1,
0.521967, -1.092835, 2.771827, 1, 0, 0, 1, 1,
0.5220133, -1.030281, 3.828858, 1, 0, 0, 1, 1,
0.5253711, 1.102133, 0.04681371, 1, 0, 0, 1, 1,
0.5271434, -0.6862147, 2.348655, 1, 0, 0, 1, 1,
0.5299748, -0.687606, 1.553797, 0, 0, 0, 1, 1,
0.5318835, -0.7914539, 2.243295, 0, 0, 0, 1, 1,
0.5328535, 0.937325, 0.7063209, 0, 0, 0, 1, 1,
0.5355939, -0.7393221, 3.027141, 0, 0, 0, 1, 1,
0.5429888, -0.7133937, 2.108135, 0, 0, 0, 1, 1,
0.5439239, 0.3585909, 3.700689, 0, 0, 0, 1, 1,
0.5504591, 0.4134347, 1.358764, 0, 0, 0, 1, 1,
0.5532547, 0.3827608, 1.364203, 1, 1, 1, 1, 1,
0.5537062, -0.5313599, 1.696366, 1, 1, 1, 1, 1,
0.5608698, 0.3951845, 0.09382046, 1, 1, 1, 1, 1,
0.5674524, 1.502507, 0.6915188, 1, 1, 1, 1, 1,
0.5699416, 0.5665722, 1.763569, 1, 1, 1, 1, 1,
0.5735263, -0.3965276, 2.882257, 1, 1, 1, 1, 1,
0.5747911, 1.512382, 0.3832329, 1, 1, 1, 1, 1,
0.5762941, -0.697793, 2.152966, 1, 1, 1, 1, 1,
0.5788626, -0.6495228, 3.516087, 1, 1, 1, 1, 1,
0.5791851, -0.7286245, 2.970677, 1, 1, 1, 1, 1,
0.5827816, -1.367207, 2.178825, 1, 1, 1, 1, 1,
0.5833573, 1.768055, -0.6776435, 1, 1, 1, 1, 1,
0.5891881, -1.549404, 2.773987, 1, 1, 1, 1, 1,
0.5898784, 1.931171, 2.095067, 1, 1, 1, 1, 1,
0.5902084, 0.5718286, -1.028896, 1, 1, 1, 1, 1,
0.5921564, -0.1113349, 1.604278, 0, 0, 1, 1, 1,
0.5945815, 1.084656, 1.599902, 1, 0, 0, 1, 1,
0.5985026, 0.39, 0.6201845, 1, 0, 0, 1, 1,
0.6088326, -0.5615373, 1.500368, 1, 0, 0, 1, 1,
0.6094227, -1.034191, 1.632219, 1, 0, 0, 1, 1,
0.6111646, -2.001845, 2.052733, 1, 0, 0, 1, 1,
0.6113469, 2.03374, -0.1674649, 0, 0, 0, 1, 1,
0.618636, -0.5196499, 0.4408344, 0, 0, 0, 1, 1,
0.6187886, -0.3757644, 1.081089, 0, 0, 0, 1, 1,
0.6194762, -1.249522, 3.580974, 0, 0, 0, 1, 1,
0.6209056, -1.549875, 1.826734, 0, 0, 0, 1, 1,
0.6220428, 0.7738506, 1.963641, 0, 0, 0, 1, 1,
0.6292899, -0.6607677, 3.073776, 0, 0, 0, 1, 1,
0.6296012, 0.1542839, 0.7476646, 1, 1, 1, 1, 1,
0.6304469, 1.752335, 0.9698212, 1, 1, 1, 1, 1,
0.634721, 0.2981818, 0.8423874, 1, 1, 1, 1, 1,
0.6440434, -0.2225103, 0.4479302, 1, 1, 1, 1, 1,
0.6456089, 0.03082332, 3.326159, 1, 1, 1, 1, 1,
0.6518577, 0.8995883, -0.3588909, 1, 1, 1, 1, 1,
0.6561322, -0.200681, -0.01977962, 1, 1, 1, 1, 1,
0.6602525, 0.4551075, 2.855191, 1, 1, 1, 1, 1,
0.6652846, 0.865864, -0.2527114, 1, 1, 1, 1, 1,
0.6655825, 0.3356322, -0.2614829, 1, 1, 1, 1, 1,
0.673117, 0.2968294, 2.244058, 1, 1, 1, 1, 1,
0.6765486, 1.073548, 1.261173, 1, 1, 1, 1, 1,
0.6835769, -0.9875438, 2.670686, 1, 1, 1, 1, 1,
0.6879563, 0.7751559, 0.4920104, 1, 1, 1, 1, 1,
0.688917, 0.2480876, 0.7382824, 1, 1, 1, 1, 1,
0.7027691, -1.021248, 4.209633, 0, 0, 1, 1, 1,
0.7058556, 0.2304516, -0.2782511, 1, 0, 0, 1, 1,
0.7073479, 0.6820178, 0.01949597, 1, 0, 0, 1, 1,
0.7080661, 0.3925754, -0.4680612, 1, 0, 0, 1, 1,
0.718725, 0.6573092, 1.02629, 1, 0, 0, 1, 1,
0.7189256, -1.663436, 4.268061, 1, 0, 0, 1, 1,
0.7218194, 1.563534, 0.2514605, 0, 0, 0, 1, 1,
0.726257, 1.140485, -0.7260122, 0, 0, 0, 1, 1,
0.7357491, -0.5060529, 1.049568, 0, 0, 0, 1, 1,
0.7390662, -0.1597406, 2.525488, 0, 0, 0, 1, 1,
0.7396053, -0.0187497, 0.7727906, 0, 0, 0, 1, 1,
0.7419418, -2.235975, 3.452796, 0, 0, 0, 1, 1,
0.7441078, -0.5267206, 3.204374, 0, 0, 0, 1, 1,
0.7516306, 0.7942038, 0.5432739, 1, 1, 1, 1, 1,
0.7527431, 0.3895955, 1.246146, 1, 1, 1, 1, 1,
0.7564455, 0.8600405, 0.9098268, 1, 1, 1, 1, 1,
0.7649841, 0.2222918, 3.236252, 1, 1, 1, 1, 1,
0.7658054, 1.800237, 1.691832, 1, 1, 1, 1, 1,
0.766588, -0.09192849, 2.337922, 1, 1, 1, 1, 1,
0.7726912, -1.940962, 2.942913, 1, 1, 1, 1, 1,
0.774361, -0.3762893, 2.190277, 1, 1, 1, 1, 1,
0.7755089, -0.1556336, 1.499174, 1, 1, 1, 1, 1,
0.781912, -1.348272, 4.044062, 1, 1, 1, 1, 1,
0.7828926, 0.3018952, 1.230502, 1, 1, 1, 1, 1,
0.7853079, -0.01027944, 1.574427, 1, 1, 1, 1, 1,
0.78807, -0.7586265, 3.396996, 1, 1, 1, 1, 1,
0.8018749, 1.383335, 0.8723494, 1, 1, 1, 1, 1,
0.8022215, 1.733438, -0.1866377, 1, 1, 1, 1, 1,
0.8054221, -0.2443861, 2.092134, 0, 0, 1, 1, 1,
0.8085786, -1.740526, 1.87411, 1, 0, 0, 1, 1,
0.8088471, 1.774634, 1.156761, 1, 0, 0, 1, 1,
0.8097858, -0.3774857, 2.220516, 1, 0, 0, 1, 1,
0.8115672, 1.998065, -0.7424164, 1, 0, 0, 1, 1,
0.8117601, -1.434433, 3.223307, 1, 0, 0, 1, 1,
0.8139729, 1.129155, 1.015294, 0, 0, 0, 1, 1,
0.8146324, 0.4702819, 1.618729, 0, 0, 0, 1, 1,
0.8150755, 0.6117895, 0.5438097, 0, 0, 0, 1, 1,
0.8186488, 1.492795, 1.046056, 0, 0, 0, 1, 1,
0.8190884, 0.5744033, 0.08608186, 0, 0, 0, 1, 1,
0.8224165, -0.687114, 1.701036, 0, 0, 0, 1, 1,
0.8230156, -1.82275, 5.163531, 0, 0, 0, 1, 1,
0.8248277, -0.05462593, 1.592597, 1, 1, 1, 1, 1,
0.8248335, 1.084766, 1.011114, 1, 1, 1, 1, 1,
0.8261012, -0.4931343, 2.244203, 1, 1, 1, 1, 1,
0.8442203, -1.238239, 4.030596, 1, 1, 1, 1, 1,
0.8571214, -0.4463776, 3.46407, 1, 1, 1, 1, 1,
0.8572337, 2.097088, 0.1928765, 1, 1, 1, 1, 1,
0.8583591, 0.08279805, 0.8338758, 1, 1, 1, 1, 1,
0.8589213, 0.1689517, 0.7698916, 1, 1, 1, 1, 1,
0.8645203, 0.6272483, 2.693773, 1, 1, 1, 1, 1,
0.8652804, 0.9861708, -1.036455, 1, 1, 1, 1, 1,
0.8693199, 0.01658754, 3.329845, 1, 1, 1, 1, 1,
0.8701639, 0.4347907, 1.975383, 1, 1, 1, 1, 1,
0.8735361, 0.5196898, 1.434127, 1, 1, 1, 1, 1,
0.8750734, -1.159316, 1.524138, 1, 1, 1, 1, 1,
0.8800815, 0.9797365, 1.833429, 1, 1, 1, 1, 1,
0.8811893, -1.477449, 2.200712, 0, 0, 1, 1, 1,
0.8862313, -1.151485, 1.34006, 1, 0, 0, 1, 1,
0.9024158, 0.1552751, 0.4410205, 1, 0, 0, 1, 1,
0.9031116, -0.2773573, 3.395087, 1, 0, 0, 1, 1,
0.9036399, -0.6670495, 1.99854, 1, 0, 0, 1, 1,
0.9078471, 0.6358973, 1.333464, 1, 0, 0, 1, 1,
0.9092516, 1.492595, -0.5615823, 0, 0, 0, 1, 1,
0.9141577, 1.296925, 0.3178565, 0, 0, 0, 1, 1,
0.9142576, 0.433429, 0.4026973, 0, 0, 0, 1, 1,
0.9214768, -0.366078, 2.773464, 0, 0, 0, 1, 1,
0.9222268, 1.453466, -0.09310372, 0, 0, 0, 1, 1,
0.9238492, 0.9540629, 0.7340553, 0, 0, 0, 1, 1,
0.9239376, 1.24111, 0.8989974, 0, 0, 0, 1, 1,
0.9242043, 0.1713042, 1.797885, 1, 1, 1, 1, 1,
0.9262052, -1.152081, 3.634631, 1, 1, 1, 1, 1,
0.9393767, -0.3951391, 3.270545, 1, 1, 1, 1, 1,
0.946813, 0.2796456, 0.3908506, 1, 1, 1, 1, 1,
0.9492431, -0.2544529, 3.827929, 1, 1, 1, 1, 1,
0.9559389, 0.03553807, 0.009215415, 1, 1, 1, 1, 1,
0.9565673, -0.4783536, 1.802082, 1, 1, 1, 1, 1,
0.95728, -0.9008287, 3.927876, 1, 1, 1, 1, 1,
0.9594836, 0.7617569, 1.053778, 1, 1, 1, 1, 1,
0.9628636, -1.004485, 3.15326, 1, 1, 1, 1, 1,
0.9640841, -0.04826237, 2.205329, 1, 1, 1, 1, 1,
0.9643449, 0.06544691, 0.5928771, 1, 1, 1, 1, 1,
0.9650403, -0.5413783, 2.049047, 1, 1, 1, 1, 1,
0.9724551, -0.166506, 0.6982744, 1, 1, 1, 1, 1,
0.9764037, 0.4713742, 3.586928, 1, 1, 1, 1, 1,
0.978099, 0.5956563, 2.759271, 0, 0, 1, 1, 1,
0.9793319, -1.72896, 1.751182, 1, 0, 0, 1, 1,
0.982746, 0.3408543, 1.15932, 1, 0, 0, 1, 1,
0.9829732, 0.7884293, 3.235599, 1, 0, 0, 1, 1,
0.9917241, -1.845782, 2.490897, 1, 0, 0, 1, 1,
0.9929241, -0.1026307, 1.332736, 1, 0, 0, 1, 1,
0.9950978, -1.329693, 1.724513, 0, 0, 0, 1, 1,
0.9964044, 0.3953681, -0.1628367, 0, 0, 0, 1, 1,
1.003091, 0.5765181, 1.135711, 0, 0, 0, 1, 1,
1.008052, 0.8861642, -0.5725593, 0, 0, 0, 1, 1,
1.017564, 0.148671, 1.078795, 0, 0, 0, 1, 1,
1.019885, 1.118905, -0.1735248, 0, 0, 0, 1, 1,
1.022797, 1.112332, 0.0005285422, 0, 0, 0, 1, 1,
1.02379, 1.766579, -0.2153326, 1, 1, 1, 1, 1,
1.027182, -0.923811, 3.835645, 1, 1, 1, 1, 1,
1.027788, 1.58622, 1.166837, 1, 1, 1, 1, 1,
1.034466, -0.1129266, 2.21634, 1, 1, 1, 1, 1,
1.035009, 0.9022918, 1.324913, 1, 1, 1, 1, 1,
1.041734, -0.6454382, 3.857043, 1, 1, 1, 1, 1,
1.042668, 0.8790483, 1.723057, 1, 1, 1, 1, 1,
1.046232, 0.2315092, 1.9002, 1, 1, 1, 1, 1,
1.048263, 1.549745, 2.220889, 1, 1, 1, 1, 1,
1.049963, -1.45548, 1.398575, 1, 1, 1, 1, 1,
1.054736, -0.6663013, 1.662839, 1, 1, 1, 1, 1,
1.057539, 0.7100058, 1.653457, 1, 1, 1, 1, 1,
1.063259, 0.3105531, -0.5827296, 1, 1, 1, 1, 1,
1.074767, -0.4211848, 1.463246, 1, 1, 1, 1, 1,
1.077893, -0.4850331, 1.376536, 1, 1, 1, 1, 1,
1.078531, -0.8213773, 2.938618, 0, 0, 1, 1, 1,
1.09657, -0.1454216, 3.029988, 1, 0, 0, 1, 1,
1.098472, 1.185038, 1.134533, 1, 0, 0, 1, 1,
1.099762, 0.09148052, 1.014152, 1, 0, 0, 1, 1,
1.102892, -1.233422, 6.796682, 1, 0, 0, 1, 1,
1.10743, 0.9414302, 0.750915, 1, 0, 0, 1, 1,
1.108796, -0.8992725, 2.374552, 0, 0, 0, 1, 1,
1.109848, 1.871701, 1.76535, 0, 0, 0, 1, 1,
1.113765, 1.095655, 0.9603018, 0, 0, 0, 1, 1,
1.123046, -0.2883104, 3.269717, 0, 0, 0, 1, 1,
1.124786, -0.07479289, 1.896263, 0, 0, 0, 1, 1,
1.131703, 0.4695417, 1.552903, 0, 0, 0, 1, 1,
1.137608, -0.6089864, 2.382986, 0, 0, 0, 1, 1,
1.140426, 0.6002382, 0.7889912, 1, 1, 1, 1, 1,
1.140643, 1.579109, 0.8893492, 1, 1, 1, 1, 1,
1.142159, -3.108024, 0.6391327, 1, 1, 1, 1, 1,
1.148315, 1.78878, 0.3487127, 1, 1, 1, 1, 1,
1.158555, -0.3108827, 0.9608878, 1, 1, 1, 1, 1,
1.162838, 0.2136799, -0.762093, 1, 1, 1, 1, 1,
1.165974, 1.078791, 0.8949196, 1, 1, 1, 1, 1,
1.166038, -1.294899, 3.951549, 1, 1, 1, 1, 1,
1.168548, -1.829168, 2.213676, 1, 1, 1, 1, 1,
1.170521, -1.222259, 2.564516, 1, 1, 1, 1, 1,
1.172761, -0.7852684, 2.286542, 1, 1, 1, 1, 1,
1.17687, 0.9477566, 0.3765159, 1, 1, 1, 1, 1,
1.177821, 0.02777159, 1.746681, 1, 1, 1, 1, 1,
1.178514, 0.6134193, 1.620114, 1, 1, 1, 1, 1,
1.183715, 0.7444264, 1.514507, 1, 1, 1, 1, 1,
1.196064, 0.2021753, -0.7129574, 0, 0, 1, 1, 1,
1.198293, -0.2310732, 0.5936638, 1, 0, 0, 1, 1,
1.208881, -1.186743, 2.393236, 1, 0, 0, 1, 1,
1.209655, -1.505762, 2.306226, 1, 0, 0, 1, 1,
1.224711, -0.3296503, 0.04202737, 1, 0, 0, 1, 1,
1.226182, -0.04940017, 2.203718, 1, 0, 0, 1, 1,
1.232337, -0.1939629, 3.181392, 0, 0, 0, 1, 1,
1.238843, -0.1293347, 2.060318, 0, 0, 0, 1, 1,
1.243833, -1.800089, 3.010022, 0, 0, 0, 1, 1,
1.245827, -1.084141, 1.531706, 0, 0, 0, 1, 1,
1.255118, 1.398963, 0.9507842, 0, 0, 0, 1, 1,
1.27826, -0.5558748, 2.156298, 0, 0, 0, 1, 1,
1.282271, -1.866373, 3.335005, 0, 0, 0, 1, 1,
1.285592, 0.09763143, 1.234376, 1, 1, 1, 1, 1,
1.291642, -0.1372069, 0.398163, 1, 1, 1, 1, 1,
1.308962, 0.7655003, 1.989079, 1, 1, 1, 1, 1,
1.317013, -0.8804806, 2.233494, 1, 1, 1, 1, 1,
1.319572, -1.081798, 1.255571, 1, 1, 1, 1, 1,
1.320169, -1.421116, 2.523845, 1, 1, 1, 1, 1,
1.320325, -0.1130996, 1.841027, 1, 1, 1, 1, 1,
1.323212, -0.07380846, 0.723304, 1, 1, 1, 1, 1,
1.324688, -0.4762009, 2.575685, 1, 1, 1, 1, 1,
1.328231, -2.206129, 2.633864, 1, 1, 1, 1, 1,
1.332862, -0.8079221, 0.9583173, 1, 1, 1, 1, 1,
1.34408, -0.8417447, 3.309852, 1, 1, 1, 1, 1,
1.365165, 0.1214779, 1.003513, 1, 1, 1, 1, 1,
1.370358, 0.8685203, 0.8937651, 1, 1, 1, 1, 1,
1.372513, -0.7414903, 1.611046, 1, 1, 1, 1, 1,
1.374589, 3.014038, -0.8221807, 0, 0, 1, 1, 1,
1.377592, -0.5018373, 0.5698076, 1, 0, 0, 1, 1,
1.383643, 0.8056315, 1.130915, 1, 0, 0, 1, 1,
1.390922, -1.019161, 1.986092, 1, 0, 0, 1, 1,
1.393849, 0.6465304, 0.1125256, 1, 0, 0, 1, 1,
1.404683, 0.2409801, 2.488961, 1, 0, 0, 1, 1,
1.405696, -0.2890639, 3.205081, 0, 0, 0, 1, 1,
1.407325, -0.1416268, 1.980017, 0, 0, 0, 1, 1,
1.413879, 1.30837, 1.405819, 0, 0, 0, 1, 1,
1.429405, -0.4719434, 2.395869, 0, 0, 0, 1, 1,
1.445999, 1.641455, 2.792114, 0, 0, 0, 1, 1,
1.447459, 1.255413, 1.159662, 0, 0, 0, 1, 1,
1.464292, -0.03900851, 0.3421708, 0, 0, 0, 1, 1,
1.464485, -1.163027, 4.358184, 1, 1, 1, 1, 1,
1.471353, 2.151201, -0.08299094, 1, 1, 1, 1, 1,
1.504246, -1.959053, 3.724089, 1, 1, 1, 1, 1,
1.518496, 0.356067, 1.846326, 1, 1, 1, 1, 1,
1.522196, -0.8225446, -0.08960284, 1, 1, 1, 1, 1,
1.534904, -0.5915098, 3.158592, 1, 1, 1, 1, 1,
1.539675, -0.8256013, 0.5945989, 1, 1, 1, 1, 1,
1.540042, 0.5083431, 0.4525786, 1, 1, 1, 1, 1,
1.568853, -0.3863519, 2.739095, 1, 1, 1, 1, 1,
1.583003, -0.1625004, 2.852448, 1, 1, 1, 1, 1,
1.584731, -0.1098854, 2.207919, 1, 1, 1, 1, 1,
1.589558, 0.3594802, 0.8311927, 1, 1, 1, 1, 1,
1.606583, 0.7533052, 2.059337, 1, 1, 1, 1, 1,
1.624514, 1.250078, 0.1804093, 1, 1, 1, 1, 1,
1.625751, 1.094642, 2.056771, 1, 1, 1, 1, 1,
1.62691, -0.9312937, 3.161582, 0, 0, 1, 1, 1,
1.631394, -0.3345169, 1.511447, 1, 0, 0, 1, 1,
1.6344, 0.1859802, 0.8804082, 1, 0, 0, 1, 1,
1.657504, -0.2387354, 0.1996545, 1, 0, 0, 1, 1,
1.693324, -0.5361818, 1.114041, 1, 0, 0, 1, 1,
1.701763, 1.637023, 0.641216, 1, 0, 0, 1, 1,
1.731783, 1.14114, 1.002449, 0, 0, 0, 1, 1,
1.735251, -0.06470864, 1.94722, 0, 0, 0, 1, 1,
1.748907, -0.427664, 0.6325516, 0, 0, 0, 1, 1,
1.764355, 0.8293208, 1.329033, 0, 0, 0, 1, 1,
1.769439, 0.1689535, 4.211423, 0, 0, 0, 1, 1,
1.771786, 1.640154, -2.093729, 0, 0, 0, 1, 1,
1.788222, -0.2361517, 2.554733, 0, 0, 0, 1, 1,
1.799508, -0.2687134, 0.6284717, 1, 1, 1, 1, 1,
1.804578, -0.4558381, 3.01121, 1, 1, 1, 1, 1,
1.805897, 0.2488412, 2.377277, 1, 1, 1, 1, 1,
1.840579, 0.7433515, 0.5296578, 1, 1, 1, 1, 1,
1.849637, -0.420252, 1.799788, 1, 1, 1, 1, 1,
1.856007, 0.7410707, 1.646253, 1, 1, 1, 1, 1,
1.867605, -0.01965932, 1.204429, 1, 1, 1, 1, 1,
1.876432, -2.238279, 2.196167, 1, 1, 1, 1, 1,
1.885166, -0.8570176, 2.55006, 1, 1, 1, 1, 1,
1.952909, -2.219957, 3.872771, 1, 1, 1, 1, 1,
1.964405, 0.4694751, 0.7623919, 1, 1, 1, 1, 1,
1.970579, -0.006470776, 2.470164, 1, 1, 1, 1, 1,
1.98506, -0.4215853, 1.744421, 1, 1, 1, 1, 1,
1.989048, 1.265886, 1.075982, 1, 1, 1, 1, 1,
2.016908, -0.9618152, 1.899505, 1, 1, 1, 1, 1,
2.040184, 0.9298626, 0.9204349, 0, 0, 1, 1, 1,
2.074956, 0.7289329, 0.1979592, 1, 0, 0, 1, 1,
2.075748, 0.06089036, 0.3706443, 1, 0, 0, 1, 1,
2.075936, -1.907991, 4.372405, 1, 0, 0, 1, 1,
2.08147, -1.48134, 1.987211, 1, 0, 0, 1, 1,
2.10197, 0.09203129, 0.7026102, 1, 0, 0, 1, 1,
2.167516, 0.338737, -0.9324642, 0, 0, 0, 1, 1,
2.196745, 1.445588, 0.7460349, 0, 0, 0, 1, 1,
2.202267, 0.2388348, 1.897672, 0, 0, 0, 1, 1,
2.209757, -0.6340991, 1.154034, 0, 0, 0, 1, 1,
2.328734, -0.635561, 2.394007, 0, 0, 0, 1, 1,
2.428975, -0.6716094, 1.412602, 0, 0, 0, 1, 1,
2.439651, 0.01896792, 1.100221, 0, 0, 0, 1, 1,
2.445946, -0.4212672, 2.097449, 1, 1, 1, 1, 1,
2.486011, 0.1395954, 1.819003, 1, 1, 1, 1, 1,
2.532907, -0.3139598, 1.056981, 1, 1, 1, 1, 1,
2.535342, -1.136812, 3.354602, 1, 1, 1, 1, 1,
2.686549, -0.7831967, 3.541763, 1, 1, 1, 1, 1,
3.113117, -0.5476543, 3.240822, 1, 1, 1, 1, 1,
3.28076, 0.8682502, 1.392485, 1, 1, 1, 1, 1
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
var radius = 9.860152;
var distance = 34.63336;
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
mvMatrix.translate( -0.1445427, 0.0210495, -0.9748359 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63336);
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