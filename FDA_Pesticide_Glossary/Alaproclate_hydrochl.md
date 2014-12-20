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
-2.867123, -1.042196, -1.564371, 1, 0, 0, 1,
-2.859568, 1.724142, -1.868842, 1, 0.007843138, 0, 1,
-2.795152, 0.1310856, -0.869135, 1, 0.01176471, 0, 1,
-2.543122, 0.46861, -2.55656, 1, 0.01960784, 0, 1,
-2.518844, -0.7784011, -1.701031, 1, 0.02352941, 0, 1,
-2.440105, 1.800445, -1.240532, 1, 0.03137255, 0, 1,
-2.37522, -1.132865, -4.022823, 1, 0.03529412, 0, 1,
-2.326416, 1.252202, -0.5159085, 1, 0.04313726, 0, 1,
-2.319325, -1.698141, -2.938089, 1, 0.04705882, 0, 1,
-2.316365, -0.4233772, -2.915475, 1, 0.05490196, 0, 1,
-2.294365, 0.5111273, -0.8322678, 1, 0.05882353, 0, 1,
-2.250772, 0.170358, -0.5756392, 1, 0.06666667, 0, 1,
-2.24022, 0.02106795, -1.572471, 1, 0.07058824, 0, 1,
-2.108505, 0.04928406, -1.9259, 1, 0.07843138, 0, 1,
-2.100857, -0.7698438, -0.455765, 1, 0.08235294, 0, 1,
-2.099704, 1.133854, -1.439628, 1, 0.09019608, 0, 1,
-2.066071, 0.2819958, 0.2159868, 1, 0.09411765, 0, 1,
-2.059432, 0.0826631, -1.046948, 1, 0.1019608, 0, 1,
-2.041077, 0.1346706, -2.812258, 1, 0.1098039, 0, 1,
-2.023199, 1.200039, -0.2130917, 1, 0.1137255, 0, 1,
-1.99642, 2.467819, 1.149145, 1, 0.1215686, 0, 1,
-1.923064, 1.006589, -0.2326893, 1, 0.1254902, 0, 1,
-1.902255, -2.974679, -3.9382, 1, 0.1333333, 0, 1,
-1.894062, 0.956466, -0.7663396, 1, 0.1372549, 0, 1,
-1.884013, -0.4326171, -2.318432, 1, 0.145098, 0, 1,
-1.87707, -1.432859, -0.9256176, 1, 0.1490196, 0, 1,
-1.862859, 0.09072291, -1.116441, 1, 0.1568628, 0, 1,
-1.86199, 0.6537972, -0.9700593, 1, 0.1607843, 0, 1,
-1.856669, -0.02801552, -2.088916, 1, 0.1686275, 0, 1,
-1.850772, -1.633519, -2.738175, 1, 0.172549, 0, 1,
-1.838723, 0.8607134, -0.4775226, 1, 0.1803922, 0, 1,
-1.826986, 0.7778212, -0.9756281, 1, 0.1843137, 0, 1,
-1.789648, -1.145694, -1.002463, 1, 0.1921569, 0, 1,
-1.782986, 0.8363575, -1.651526, 1, 0.1960784, 0, 1,
-1.779986, -0.02309838, -2.86773, 1, 0.2039216, 0, 1,
-1.773612, -1.944414, -2.702036, 1, 0.2117647, 0, 1,
-1.77356, 0.827212, -1.688675, 1, 0.2156863, 0, 1,
-1.772643, -0.6190541, -2.426054, 1, 0.2235294, 0, 1,
-1.769779, 0.6949298, -1.766429, 1, 0.227451, 0, 1,
-1.767748, -0.5454959, -0.3857432, 1, 0.2352941, 0, 1,
-1.756912, -1.523213, -2.270499, 1, 0.2392157, 0, 1,
-1.749705, 0.9476303, -1.531769, 1, 0.2470588, 0, 1,
-1.748889, 0.8222741, -1.184894, 1, 0.2509804, 0, 1,
-1.737126, -0.1986412, -1.092474, 1, 0.2588235, 0, 1,
-1.733974, 1.715713, -0.2870968, 1, 0.2627451, 0, 1,
-1.704428, 0.008271508, -0.8932905, 1, 0.2705882, 0, 1,
-1.685605, -0.5501615, -1.557765, 1, 0.2745098, 0, 1,
-1.659063, 1.340942, -0.7964282, 1, 0.282353, 0, 1,
-1.657288, -0.2574958, -1.228343, 1, 0.2862745, 0, 1,
-1.656464, -0.3580609, -1.80025, 1, 0.2941177, 0, 1,
-1.642592, 0.2102149, -0.9461417, 1, 0.3019608, 0, 1,
-1.632138, -0.0605911, -2.51641, 1, 0.3058824, 0, 1,
-1.631079, 0.8378671, 0.5770663, 1, 0.3137255, 0, 1,
-1.614721, 1.810812, -1.472802, 1, 0.3176471, 0, 1,
-1.606559, 0.7720979, -1.401035, 1, 0.3254902, 0, 1,
-1.602645, 0.5970958, 0.3337669, 1, 0.3294118, 0, 1,
-1.597912, 0.586631, -0.8573705, 1, 0.3372549, 0, 1,
-1.596347, 1.355644, -2.694804, 1, 0.3411765, 0, 1,
-1.591438, 0.6322979, 0.1566256, 1, 0.3490196, 0, 1,
-1.586595, -0.1086827, -2.779468, 1, 0.3529412, 0, 1,
-1.577992, 0.5257471, -0.683955, 1, 0.3607843, 0, 1,
-1.554043, 2.531245, -0.2769773, 1, 0.3647059, 0, 1,
-1.535504, 1.756678, -0.1641773, 1, 0.372549, 0, 1,
-1.534788, -0.2141985, -1.303723, 1, 0.3764706, 0, 1,
-1.530815, -1.274805, -4.16977, 1, 0.3843137, 0, 1,
-1.509482, 0.04520115, -0.3045161, 1, 0.3882353, 0, 1,
-1.491103, 0.546927, -2.957366, 1, 0.3960784, 0, 1,
-1.490652, -1.074418, -0.7814061, 1, 0.4039216, 0, 1,
-1.490072, 0.1602404, -0.8779192, 1, 0.4078431, 0, 1,
-1.472563, -0.05268067, -0.3676825, 1, 0.4156863, 0, 1,
-1.455959, 0.8609334, -0.7286108, 1, 0.4196078, 0, 1,
-1.452358, -1.085118, -2.559448, 1, 0.427451, 0, 1,
-1.450459, 0.388788, -1.721651, 1, 0.4313726, 0, 1,
-1.44843, 0.5280515, 1.208465, 1, 0.4392157, 0, 1,
-1.444708, -0.1091086, -1.317094, 1, 0.4431373, 0, 1,
-1.424303, -1.714725, -2.897779, 1, 0.4509804, 0, 1,
-1.414363, -0.0396287, -1.991066, 1, 0.454902, 0, 1,
-1.407696, -1.175156, -1.463191, 1, 0.4627451, 0, 1,
-1.403546, -0.003463502, 1.180555, 1, 0.4666667, 0, 1,
-1.390961, -1.379761, -1.405719, 1, 0.4745098, 0, 1,
-1.389165, 0.7194198, -0.578685, 1, 0.4784314, 0, 1,
-1.384541, -1.448224, -2.067832, 1, 0.4862745, 0, 1,
-1.383594, -1.895491, -2.097008, 1, 0.4901961, 0, 1,
-1.380684, 0.701139, -1.424049, 1, 0.4980392, 0, 1,
-1.365658, -0.1670135, -2.003265, 1, 0.5058824, 0, 1,
-1.357718, -0.8912874, -2.168815, 1, 0.509804, 0, 1,
-1.354144, -0.2013651, -0.9819023, 1, 0.5176471, 0, 1,
-1.350134, -0.3989564, -1.377283, 1, 0.5215687, 0, 1,
-1.346603, -2.1057, -1.374205, 1, 0.5294118, 0, 1,
-1.344612, -0.7177491, -2.794054, 1, 0.5333334, 0, 1,
-1.339607, 0.2167542, -3.224017, 1, 0.5411765, 0, 1,
-1.334241, -1.683116, -2.263667, 1, 0.5450981, 0, 1,
-1.331307, -1.15536, -3.279566, 1, 0.5529412, 0, 1,
-1.327793, -2.305772, -3.350313, 1, 0.5568628, 0, 1,
-1.326105, -0.5784956, -2.733106, 1, 0.5647059, 0, 1,
-1.318404, -0.9506804, -2.664597, 1, 0.5686275, 0, 1,
-1.303856, -0.4408799, -1.032317, 1, 0.5764706, 0, 1,
-1.300902, 0.1959074, -1.433936, 1, 0.5803922, 0, 1,
-1.268898, 1.248622, -1.327694, 1, 0.5882353, 0, 1,
-1.259551, 1.124291, -2.067738, 1, 0.5921569, 0, 1,
-1.252932, 1.365145, 0.7241452, 1, 0.6, 0, 1,
-1.247937, 1.598601, -0.9587665, 1, 0.6078432, 0, 1,
-1.242689, 0.1212126, -0.5287293, 1, 0.6117647, 0, 1,
-1.241296, -0.6839517, -1.579747, 1, 0.6196079, 0, 1,
-1.233394, 0.0282971, -1.771443, 1, 0.6235294, 0, 1,
-1.228964, 0.01800041, -2.227566, 1, 0.6313726, 0, 1,
-1.223659, -0.6969123, -0.6063814, 1, 0.6352941, 0, 1,
-1.222036, -0.2102422, -1.87991, 1, 0.6431373, 0, 1,
-1.22149, -0.644405, -2.551507, 1, 0.6470588, 0, 1,
-1.220025, 0.6491154, -2.177643, 1, 0.654902, 0, 1,
-1.217324, -0.4989619, -1.390445, 1, 0.6588235, 0, 1,
-1.214455, 2.370184, -0.07833049, 1, 0.6666667, 0, 1,
-1.197177, -0.7550705, -2.787998, 1, 0.6705883, 0, 1,
-1.192327, -0.3962742, -2.570205, 1, 0.6784314, 0, 1,
-1.186047, -0.1797894, -3.888059, 1, 0.682353, 0, 1,
-1.181661, -0.8431237, -2.703364, 1, 0.6901961, 0, 1,
-1.180846, 0.5837808, -1.819739, 1, 0.6941177, 0, 1,
-1.170439, 1.766277, -1.51509, 1, 0.7019608, 0, 1,
-1.169127, -0.1399489, -1.379666, 1, 0.7098039, 0, 1,
-1.168901, 0.05257814, -2.525736, 1, 0.7137255, 0, 1,
-1.165058, 0.3163812, -1.03651, 1, 0.7215686, 0, 1,
-1.155363, 0.1222758, -1.573069, 1, 0.7254902, 0, 1,
-1.154521, -0.3736303, -3.677099, 1, 0.7333333, 0, 1,
-1.149127, 0.976954, -0.1741349, 1, 0.7372549, 0, 1,
-1.131745, -2.075763, -0.8377644, 1, 0.7450981, 0, 1,
-1.123889, 0.4564801, -2.250447, 1, 0.7490196, 0, 1,
-1.112482, 1.768569, -0.2358472, 1, 0.7568628, 0, 1,
-1.111919, 0.8999115, -2.071972, 1, 0.7607843, 0, 1,
-1.101603, 0.2114305, -1.246952, 1, 0.7686275, 0, 1,
-1.097105, 0.5751714, -1.255103, 1, 0.772549, 0, 1,
-1.096872, 0.4875028, -0.7000666, 1, 0.7803922, 0, 1,
-1.095338, -2.265713, -1.723239, 1, 0.7843137, 0, 1,
-1.078957, 0.9598271, -1.679269, 1, 0.7921569, 0, 1,
-1.076481, 0.3930792, -1.027496, 1, 0.7960784, 0, 1,
-1.076062, -0.4194834, -1.707265, 1, 0.8039216, 0, 1,
-1.073803, -0.4147809, -2.382493, 1, 0.8117647, 0, 1,
-1.067793, -0.7712149, -0.65753, 1, 0.8156863, 0, 1,
-1.063265, 2.425097, 0.03770142, 1, 0.8235294, 0, 1,
-1.061129, -0.2659498, -3.728782, 1, 0.827451, 0, 1,
-1.051636, -0.549304, -3.604666, 1, 0.8352941, 0, 1,
-1.050882, 0.01244441, -3.834506, 1, 0.8392157, 0, 1,
-1.044731, 0.9777555, 0.116518, 1, 0.8470588, 0, 1,
-1.043146, -0.9711055, -3.303145, 1, 0.8509804, 0, 1,
-1.035486, -1.01438, -2.635873, 1, 0.8588235, 0, 1,
-1.031646, 0.2337035, 0.04430154, 1, 0.8627451, 0, 1,
-1.028711, 0.13124, -0.8417218, 1, 0.8705882, 0, 1,
-1.021909, 0.4668024, 1.010432, 1, 0.8745098, 0, 1,
-1.010685, 0.7168525, -1.741528, 1, 0.8823529, 0, 1,
-1.007845, 0.8303127, -0.3234575, 1, 0.8862745, 0, 1,
-1.007733, -0.8910161, -2.114877, 1, 0.8941177, 0, 1,
-1.003045, 0.9488403, -1.063076, 1, 0.8980392, 0, 1,
-1.00225, 1.391907, -0.753537, 1, 0.9058824, 0, 1,
-1.001094, -0.9788618, -2.35711, 1, 0.9137255, 0, 1,
-0.9973543, 0.667643, -1.153942, 1, 0.9176471, 0, 1,
-0.9943345, -1.020924, -3.424016, 1, 0.9254902, 0, 1,
-0.9928614, -1.072156, -2.463389, 1, 0.9294118, 0, 1,
-0.99068, 0.8600435, 0.7990591, 1, 0.9372549, 0, 1,
-0.9858327, 1.786216, 1.098493, 1, 0.9411765, 0, 1,
-0.9828469, 1.095747, -0.1363166, 1, 0.9490196, 0, 1,
-0.981496, -0.4830061, -2.340402, 1, 0.9529412, 0, 1,
-0.9809266, 0.01465053, -1.341342, 1, 0.9607843, 0, 1,
-0.9801769, 0.01696531, -0.5921117, 1, 0.9647059, 0, 1,
-0.9789585, -0.2788515, -2.201944, 1, 0.972549, 0, 1,
-0.9677514, -0.6025677, -1.401651, 1, 0.9764706, 0, 1,
-0.9668089, -0.4107483, -1.033335, 1, 0.9843137, 0, 1,
-0.9577532, -0.3573703, -2.424189, 1, 0.9882353, 0, 1,
-0.9540194, 0.5830355, 0.05438311, 1, 0.9960784, 0, 1,
-0.953573, -0.3761245, -0.8567688, 0.9960784, 1, 0, 1,
-0.9486049, -0.5260048, -2.352202, 0.9921569, 1, 0, 1,
-0.9484383, 1.077664, -0.1243726, 0.9843137, 1, 0, 1,
-0.9393991, 1.526596, -1.829912, 0.9803922, 1, 0, 1,
-0.9374124, 1.110064, -0.8020015, 0.972549, 1, 0, 1,
-0.9362175, 1.240926, -1.033008, 0.9686275, 1, 0, 1,
-0.9217779, 1.249632, -1.459935, 0.9607843, 1, 0, 1,
-0.9116938, -0.2491329, -1.233327, 0.9568627, 1, 0, 1,
-0.9105299, -1.037142, -3.326026, 0.9490196, 1, 0, 1,
-0.9101719, 0.05487997, -0.6226916, 0.945098, 1, 0, 1,
-0.906424, -1.550489, -3.876962, 0.9372549, 1, 0, 1,
-0.9062794, 1.211039, -1.627409, 0.9333333, 1, 0, 1,
-0.9054602, 1.26368, 0.0412345, 0.9254902, 1, 0, 1,
-0.9047743, 0.1176749, 0.2193927, 0.9215686, 1, 0, 1,
-0.9023082, -1.032996, -3.85205, 0.9137255, 1, 0, 1,
-0.9021312, -0.6608171, -2.350332, 0.9098039, 1, 0, 1,
-0.9013057, -1.309452, -3.870663, 0.9019608, 1, 0, 1,
-0.8942407, 0.2660592, -1.910397, 0.8941177, 1, 0, 1,
-0.8941002, -1.640166, -4.149612, 0.8901961, 1, 0, 1,
-0.8929569, 0.7136549, 0.139374, 0.8823529, 1, 0, 1,
-0.8914993, 1.918419, 0.04134674, 0.8784314, 1, 0, 1,
-0.8899933, -1.001809, -2.78184, 0.8705882, 1, 0, 1,
-0.8844182, -1.864551, -2.719447, 0.8666667, 1, 0, 1,
-0.8812539, 1.278099, -0.6491264, 0.8588235, 1, 0, 1,
-0.8785567, -0.8044166, -2.480639, 0.854902, 1, 0, 1,
-0.861547, 0.4262043, -1.5944, 0.8470588, 1, 0, 1,
-0.8579125, 0.9420273, -0.5701585, 0.8431373, 1, 0, 1,
-0.8557426, -0.5321285, -1.166614, 0.8352941, 1, 0, 1,
-0.8533638, -0.5096297, -0.8140773, 0.8313726, 1, 0, 1,
-0.8513977, -0.2863361, -1.582512, 0.8235294, 1, 0, 1,
-0.8470418, 2.556325, 0.6911695, 0.8196079, 1, 0, 1,
-0.8434653, -0.06294799, -0.1802421, 0.8117647, 1, 0, 1,
-0.8298302, 1.06819, -0.6447586, 0.8078431, 1, 0, 1,
-0.8228638, 0.8387129, 0.9545322, 0.8, 1, 0, 1,
-0.8112634, -1.079694, -1.411118, 0.7921569, 1, 0, 1,
-0.8034805, 1.730862, -2.467027, 0.7882353, 1, 0, 1,
-0.8019536, 0.9524845, -1.481825, 0.7803922, 1, 0, 1,
-0.7974866, -1.000025, -3.545196, 0.7764706, 1, 0, 1,
-0.7950938, -0.3095158, -0.9756796, 0.7686275, 1, 0, 1,
-0.793429, -1.776551, -3.988461, 0.7647059, 1, 0, 1,
-0.7907977, -1.36592, -1.877422, 0.7568628, 1, 0, 1,
-0.7896916, -2.003565, -3.095369, 0.7529412, 1, 0, 1,
-0.7855927, -0.2605373, -1.604995, 0.7450981, 1, 0, 1,
-0.7841709, 1.191479, 0.1213483, 0.7411765, 1, 0, 1,
-0.7828674, 2.066422, -1.586155, 0.7333333, 1, 0, 1,
-0.7816011, -0.05386816, -1.474236, 0.7294118, 1, 0, 1,
-0.7798674, -0.9143082, -0.9083431, 0.7215686, 1, 0, 1,
-0.7786528, -1.232652, -2.36632, 0.7176471, 1, 0, 1,
-0.7733954, 0.9885904, -0.2324135, 0.7098039, 1, 0, 1,
-0.7731944, 0.5430791, -0.7359391, 0.7058824, 1, 0, 1,
-0.7716178, 0.2874061, -1.370577, 0.6980392, 1, 0, 1,
-0.7704048, -1.016713, -1.416007, 0.6901961, 1, 0, 1,
-0.7680761, -0.9402705, -1.85811, 0.6862745, 1, 0, 1,
-0.7649187, -0.4510907, -2.644872, 0.6784314, 1, 0, 1,
-0.7627765, 0.5896583, -2.519572, 0.6745098, 1, 0, 1,
-0.7566453, -0.436279, -1.880703, 0.6666667, 1, 0, 1,
-0.7539307, 0.178059, -0.01511026, 0.6627451, 1, 0, 1,
-0.7490385, 1.013319, -0.3340393, 0.654902, 1, 0, 1,
-0.7483634, 1.07463, 0.3553522, 0.6509804, 1, 0, 1,
-0.7435085, -0.06529287, -2.31658, 0.6431373, 1, 0, 1,
-0.7428272, -0.7958739, -0.9363158, 0.6392157, 1, 0, 1,
-0.7399646, -0.1922201, -1.809178, 0.6313726, 1, 0, 1,
-0.733266, -0.7613819, -3.295432, 0.627451, 1, 0, 1,
-0.7279041, -0.8523501, -2.625749, 0.6196079, 1, 0, 1,
-0.7267567, -0.004511111, -2.191279, 0.6156863, 1, 0, 1,
-0.7265235, 1.083539, -1.009705, 0.6078432, 1, 0, 1,
-0.7261502, 0.2490835, -0.6986619, 0.6039216, 1, 0, 1,
-0.723184, -0.9293374, -1.092783, 0.5960785, 1, 0, 1,
-0.7212335, -0.3821307, -0.6785968, 0.5882353, 1, 0, 1,
-0.7173722, -0.3419596, -4.407546, 0.5843138, 1, 0, 1,
-0.7165148, -1.574183, -2.482335, 0.5764706, 1, 0, 1,
-0.7156376, -1.304337, -2.68736, 0.572549, 1, 0, 1,
-0.7127053, 0.8985202, 0.755408, 0.5647059, 1, 0, 1,
-0.7109139, -1.819084, -3.161644, 0.5607843, 1, 0, 1,
-0.7057515, 0.8298967, -1.008202, 0.5529412, 1, 0, 1,
-0.6996829, 2.196065, 0.161067, 0.5490196, 1, 0, 1,
-0.6929627, 1.548815, -0.5574987, 0.5411765, 1, 0, 1,
-0.6907631, -0.5348172, -0.453382, 0.5372549, 1, 0, 1,
-0.6864417, 0.1964231, 0.3187531, 0.5294118, 1, 0, 1,
-0.6848179, -0.3521783, -1.096375, 0.5254902, 1, 0, 1,
-0.6844834, 0.8355729, -2.375855, 0.5176471, 1, 0, 1,
-0.6802557, 0.6840569, -1.05897, 0.5137255, 1, 0, 1,
-0.6790386, 0.4502273, -1.363799, 0.5058824, 1, 0, 1,
-0.6789811, 1.84129, -1.026231, 0.5019608, 1, 0, 1,
-0.676133, -0.08644971, -3.46206, 0.4941176, 1, 0, 1,
-0.6722985, -2.220001, -3.28616, 0.4862745, 1, 0, 1,
-0.6722584, -1.710856, -2.852221, 0.4823529, 1, 0, 1,
-0.6707247, 0.2928039, -1.030902, 0.4745098, 1, 0, 1,
-0.6609191, 0.6410119, -1.102099, 0.4705882, 1, 0, 1,
-0.6576383, -2.626973, -3.163733, 0.4627451, 1, 0, 1,
-0.6523913, 0.04964159, -0.2400346, 0.4588235, 1, 0, 1,
-0.6447077, 0.6908521, -1.017055, 0.4509804, 1, 0, 1,
-0.6343358, 1.13544, -1.615141, 0.4470588, 1, 0, 1,
-0.6339648, -1.860904, -2.420017, 0.4392157, 1, 0, 1,
-0.6324699, -0.1910618, -3.611252, 0.4352941, 1, 0, 1,
-0.6298783, -0.3992894, -0.9692943, 0.427451, 1, 0, 1,
-0.62778, 1.074272, 0.7467107, 0.4235294, 1, 0, 1,
-0.6192297, 0.6799163, 0.5332632, 0.4156863, 1, 0, 1,
-0.6183392, 0.4022267, -0.6812363, 0.4117647, 1, 0, 1,
-0.6177176, 1.109026, -1.159374, 0.4039216, 1, 0, 1,
-0.6163023, 0.5664568, -0.04427601, 0.3960784, 1, 0, 1,
-0.6133321, 1.379322, 0.1256045, 0.3921569, 1, 0, 1,
-0.612489, 0.7485152, 1.934774, 0.3843137, 1, 0, 1,
-0.6083404, 0.7649991, 0.2700517, 0.3803922, 1, 0, 1,
-0.6078185, -1.231729, -3.889478, 0.372549, 1, 0, 1,
-0.6034818, 1.542783, 0.3730235, 0.3686275, 1, 0, 1,
-0.6030069, 0.9633564, -0.8061337, 0.3607843, 1, 0, 1,
-0.6021553, 0.9053745, -0.4760171, 0.3568628, 1, 0, 1,
-0.5970345, -0.7420137, -3.267254, 0.3490196, 1, 0, 1,
-0.5924644, -0.9428725, -4.434864, 0.345098, 1, 0, 1,
-0.5835158, -1.195911, -3.045574, 0.3372549, 1, 0, 1,
-0.5827018, -0.3424056, -2.860569, 0.3333333, 1, 0, 1,
-0.5804808, -1.488784, -1.96486, 0.3254902, 1, 0, 1,
-0.5800776, -0.0702766, -0.8741024, 0.3215686, 1, 0, 1,
-0.5739971, -1.975857, -2.1163, 0.3137255, 1, 0, 1,
-0.5726494, -0.2533162, -1.37854, 0.3098039, 1, 0, 1,
-0.5725359, 0.4422164, -1.611534, 0.3019608, 1, 0, 1,
-0.5686115, 1.140699, -1.661147, 0.2941177, 1, 0, 1,
-0.5660292, -1.66706, -2.707562, 0.2901961, 1, 0, 1,
-0.565331, -1.730894, -2.932604, 0.282353, 1, 0, 1,
-0.5651506, -0.378204, -2.33181, 0.2784314, 1, 0, 1,
-0.5636407, -0.06042844, -0.8279905, 0.2705882, 1, 0, 1,
-0.5627359, 2.721951, -0.7529088, 0.2666667, 1, 0, 1,
-0.562703, 0.1919427, -2.544926, 0.2588235, 1, 0, 1,
-0.5616438, 0.00262852, -1.966237, 0.254902, 1, 0, 1,
-0.5614405, 1.274737, -1.368242, 0.2470588, 1, 0, 1,
-0.5496064, -1.165513, -3.433977, 0.2431373, 1, 0, 1,
-0.5488951, 0.6365398, -0.7335614, 0.2352941, 1, 0, 1,
-0.5474302, 0.4052774, -2.851377, 0.2313726, 1, 0, 1,
-0.543492, -0.5659797, -3.345288, 0.2235294, 1, 0, 1,
-0.5421734, -0.7749575, -1.621244, 0.2196078, 1, 0, 1,
-0.5397643, -0.5183496, -2.88185, 0.2117647, 1, 0, 1,
-0.5397041, -0.8666424, -2.743035, 0.2078431, 1, 0, 1,
-0.5391189, -0.5117328, -4.314179, 0.2, 1, 0, 1,
-0.5365361, 0.8854684, -0.09550487, 0.1921569, 1, 0, 1,
-0.5364681, -1.669833, -4.468627, 0.1882353, 1, 0, 1,
-0.5357471, -0.05478283, -1.836285, 0.1803922, 1, 0, 1,
-0.5343913, -0.7691255, -2.213566, 0.1764706, 1, 0, 1,
-0.5342863, -0.3459606, -1.079892, 0.1686275, 1, 0, 1,
-0.529302, 0.5584651, -0.9079278, 0.1647059, 1, 0, 1,
-0.5273594, -1.425342, -3.358617, 0.1568628, 1, 0, 1,
-0.5265387, 0.2325359, -1.888526, 0.1529412, 1, 0, 1,
-0.5252939, -0.5551755, -3.69935, 0.145098, 1, 0, 1,
-0.5037696, 1.358805, -0.1705013, 0.1411765, 1, 0, 1,
-0.4980512, -2.063677, -2.752622, 0.1333333, 1, 0, 1,
-0.497571, -0.2381074, -0.2610025, 0.1294118, 1, 0, 1,
-0.4968396, 0.3545451, -0.2239508, 0.1215686, 1, 0, 1,
-0.4937951, -0.1688631, -3.383202, 0.1176471, 1, 0, 1,
-0.4896497, 0.2045412, -0.3334606, 0.1098039, 1, 0, 1,
-0.4885556, -1.12838, -1.576145, 0.1058824, 1, 0, 1,
-0.4854746, -0.2539629, -1.449591, 0.09803922, 1, 0, 1,
-0.4852954, 0.9233445, 0.7182689, 0.09019608, 1, 0, 1,
-0.482805, 1.493894, -0.1590136, 0.08627451, 1, 0, 1,
-0.4823081, 1.552683, 0.3725235, 0.07843138, 1, 0, 1,
-0.4777835, -0.1044693, -3.42813, 0.07450981, 1, 0, 1,
-0.4746847, 1.011422, -0.4053026, 0.06666667, 1, 0, 1,
-0.4721079, -1.209703, -2.51447, 0.0627451, 1, 0, 1,
-0.4708797, -0.3129812, -1.460057, 0.05490196, 1, 0, 1,
-0.467342, -1.200236, -2.796157, 0.05098039, 1, 0, 1,
-0.4621928, -0.6328025, -3.512921, 0.04313726, 1, 0, 1,
-0.4616472, 0.04162682, -1.587003, 0.03921569, 1, 0, 1,
-0.4601353, -1.335822, -4.323042, 0.03137255, 1, 0, 1,
-0.4593537, 0.8910748, 1.592299, 0.02745098, 1, 0, 1,
-0.4571145, -0.4972388, -2.759707, 0.01960784, 1, 0, 1,
-0.4547453, -2.753443, -2.899455, 0.01568628, 1, 0, 1,
-0.4531035, -1.027235, -2.139168, 0.007843138, 1, 0, 1,
-0.4511311, 0.4377818, -1.61289, 0.003921569, 1, 0, 1,
-0.4446003, 1.059762, -0.5134193, 0, 1, 0.003921569, 1,
-0.4413707, 0.6300365, -1.102388, 0, 1, 0.01176471, 1,
-0.4390353, -0.6926543, -2.73943, 0, 1, 0.01568628, 1,
-0.431173, 0.6219763, -0.5339251, 0, 1, 0.02352941, 1,
-0.4264775, 1.749603, -1.011427, 0, 1, 0.02745098, 1,
-0.4203599, 0.554512, -0.4184716, 0, 1, 0.03529412, 1,
-0.419889, 3.06774, -0.1774564, 0, 1, 0.03921569, 1,
-0.4190688, 0.4250684, -0.7823253, 0, 1, 0.04705882, 1,
-0.4187785, 0.5140665, -2.077942, 0, 1, 0.05098039, 1,
-0.4164011, -0.2990358, -1.529026, 0, 1, 0.05882353, 1,
-0.412187, 0.4009152, -1.460515, 0, 1, 0.0627451, 1,
-0.408559, 1.652674, -1.645588, 0, 1, 0.07058824, 1,
-0.408164, 0.831216, 2.096485, 0, 1, 0.07450981, 1,
-0.4079222, 1.092423, 0.06045198, 0, 1, 0.08235294, 1,
-0.4051411, -0.6557633, -2.710565, 0, 1, 0.08627451, 1,
-0.4015833, 0.5386722, -0.5796138, 0, 1, 0.09411765, 1,
-0.4012354, -1.47539, -1.196743, 0, 1, 0.1019608, 1,
-0.4006623, -1.063502, -0.4691701, 0, 1, 0.1058824, 1,
-0.3964911, -0.0340745, -0.1876525, 0, 1, 0.1137255, 1,
-0.3914817, 0.8107356, -0.5276576, 0, 1, 0.1176471, 1,
-0.3896609, 0.6567222, -0.6336435, 0, 1, 0.1254902, 1,
-0.3853331, -1.476125, -3.835563, 0, 1, 0.1294118, 1,
-0.3796962, 0.8987037, -0.5371022, 0, 1, 0.1372549, 1,
-0.3743077, -0.1221015, -1.906868, 0, 1, 0.1411765, 1,
-0.3739614, 0.1484133, 0.01004352, 0, 1, 0.1490196, 1,
-0.3710915, 0.7401811, 0.4736088, 0, 1, 0.1529412, 1,
-0.3643494, 0.7332911, 0.1753245, 0, 1, 0.1607843, 1,
-0.360981, -0.7990803, -3.82122, 0, 1, 0.1647059, 1,
-0.3600735, 1.36094, -0.8156264, 0, 1, 0.172549, 1,
-0.3575478, 0.3610574, 0.3635962, 0, 1, 0.1764706, 1,
-0.3573381, -0.3624694, -3.746623, 0, 1, 0.1843137, 1,
-0.3531839, -0.1127299, -1.368277, 0, 1, 0.1882353, 1,
-0.3531649, 1.373965, -0.1540892, 0, 1, 0.1960784, 1,
-0.3407616, 0.4470235, -0.8222368, 0, 1, 0.2039216, 1,
-0.3392885, 0.08631063, -0.9347259, 0, 1, 0.2078431, 1,
-0.3379593, -0.5432492, -1.224299, 0, 1, 0.2156863, 1,
-0.3358209, 0.2584117, -0.4355849, 0, 1, 0.2196078, 1,
-0.3342579, -0.6428201, -1.608566, 0, 1, 0.227451, 1,
-0.3312283, -0.4399049, -2.49772, 0, 1, 0.2313726, 1,
-0.3285513, -0.3860422, -2.58712, 0, 1, 0.2392157, 1,
-0.327303, -1.154747, -2.840273, 0, 1, 0.2431373, 1,
-0.3262335, -0.1063735, -2.1537, 0, 1, 0.2509804, 1,
-0.3230349, -0.3337133, -1.300241, 0, 1, 0.254902, 1,
-0.3114767, -0.2422218, -3.032087, 0, 1, 0.2627451, 1,
-0.3059619, -2.05921, -5.462115, 0, 1, 0.2666667, 1,
-0.3043225, -0.07869624, -2.974922, 0, 1, 0.2745098, 1,
-0.3033003, 0.9242063, 0.0567463, 0, 1, 0.2784314, 1,
-0.3030528, 0.2122611, -1.446701, 0, 1, 0.2862745, 1,
-0.3026547, -0.6867598, -1.615759, 0, 1, 0.2901961, 1,
-0.301475, -1.336064, -2.378457, 0, 1, 0.2980392, 1,
-0.3012647, -0.3503661, -1.552744, 0, 1, 0.3058824, 1,
-0.2986748, -0.01307657, -2.087046, 0, 1, 0.3098039, 1,
-0.2979115, 1.27729, 1.152904, 0, 1, 0.3176471, 1,
-0.295762, 1.621276, -0.01051181, 0, 1, 0.3215686, 1,
-0.2945427, -0.05087433, -2.311075, 0, 1, 0.3294118, 1,
-0.2896012, -0.5319433, -2.060266, 0, 1, 0.3333333, 1,
-0.2816026, 0.0278898, -2.727713, 0, 1, 0.3411765, 1,
-0.2792405, 0.8939309, 0.4855769, 0, 1, 0.345098, 1,
-0.2775387, -0.003293264, -1.217561, 0, 1, 0.3529412, 1,
-0.2760116, 0.8028219, -1.371467, 0, 1, 0.3568628, 1,
-0.2737195, -1.011426, -1.220888, 0, 1, 0.3647059, 1,
-0.2733456, 0.4547546, -0.2418452, 0, 1, 0.3686275, 1,
-0.2713045, -0.1685195, -0.3019488, 0, 1, 0.3764706, 1,
-0.2711385, 0.69098, 0.0484918, 0, 1, 0.3803922, 1,
-0.2699409, 0.8915843, -0.687706, 0, 1, 0.3882353, 1,
-0.2690335, -0.5780057, -2.689001, 0, 1, 0.3921569, 1,
-0.268555, 0.4891919, -0.537851, 0, 1, 0.4, 1,
-0.2670488, -0.8142805, -2.568208, 0, 1, 0.4078431, 1,
-0.2602791, 1.875968, -1.899049, 0, 1, 0.4117647, 1,
-0.257313, -0.2610591, -4.281596, 0, 1, 0.4196078, 1,
-0.2557067, 1.513707, 0.7979841, 0, 1, 0.4235294, 1,
-0.2556739, -0.3851289, -4.604408, 0, 1, 0.4313726, 1,
-0.2538093, 0.4940318, 0.4779041, 0, 1, 0.4352941, 1,
-0.2496363, 0.5837035, -0.01028575, 0, 1, 0.4431373, 1,
-0.2445298, 0.8138685, -0.03720315, 0, 1, 0.4470588, 1,
-0.2433548, 0.1289215, -1.107141, 0, 1, 0.454902, 1,
-0.2359168, 1.966816, 0.9085006, 0, 1, 0.4588235, 1,
-0.2354713, 0.02289982, -1.47906, 0, 1, 0.4666667, 1,
-0.2306326, 1.76433, 0.2023032, 0, 1, 0.4705882, 1,
-0.2291664, -0.9510841, -2.570889, 0, 1, 0.4784314, 1,
-0.2233644, -0.2082685, -0.4427335, 0, 1, 0.4823529, 1,
-0.2181893, 2.277186, 2.031488, 0, 1, 0.4901961, 1,
-0.2175199, 0.2715454, 0.2894116, 0, 1, 0.4941176, 1,
-0.2123718, -0.3809732, -3.536042, 0, 1, 0.5019608, 1,
-0.2082838, 2.561472, 0.6310323, 0, 1, 0.509804, 1,
-0.207486, 0.03323003, -1.929361, 0, 1, 0.5137255, 1,
-0.2072689, 0.4932095, 2.301915, 0, 1, 0.5215687, 1,
-0.2057156, -0.6802321, -3.918405, 0, 1, 0.5254902, 1,
-0.205605, -0.4468646, -2.292506, 0, 1, 0.5333334, 1,
-0.2045206, 1.316417, -0.2400954, 0, 1, 0.5372549, 1,
-0.2027815, 0.3191543, -0.3756524, 0, 1, 0.5450981, 1,
-0.2006309, 0.4165454, 0.3362812, 0, 1, 0.5490196, 1,
-0.199692, 0.5671236, -1.498344, 0, 1, 0.5568628, 1,
-0.199535, -0.8340977, -2.445088, 0, 1, 0.5607843, 1,
-0.1959367, -0.5187158, -2.58922, 0, 1, 0.5686275, 1,
-0.1957685, 0.9510693, -2.878409, 0, 1, 0.572549, 1,
-0.1890775, -1.615207, -1.879098, 0, 1, 0.5803922, 1,
-0.1884207, -1.109396, -3.730164, 0, 1, 0.5843138, 1,
-0.1883174, -0.1726042, -1.088097, 0, 1, 0.5921569, 1,
-0.1840209, 1.336998, -1.690684, 0, 1, 0.5960785, 1,
-0.1839369, 0.6826155, -1.034942, 0, 1, 0.6039216, 1,
-0.1828204, 0.0004730307, -0.5165803, 0, 1, 0.6117647, 1,
-0.1799671, 1.196089, 1.162057, 0, 1, 0.6156863, 1,
-0.1784862, 0.4783873, -0.419621, 0, 1, 0.6235294, 1,
-0.1774998, -2.10306, -2.499724, 0, 1, 0.627451, 1,
-0.1767148, -0.4303757, -3.201446, 0, 1, 0.6352941, 1,
-0.175397, 0.2710463, -1.220097, 0, 1, 0.6392157, 1,
-0.1738609, 0.9462975, 0.9379859, 0, 1, 0.6470588, 1,
-0.1728612, 0.08190891, -1.31897, 0, 1, 0.6509804, 1,
-0.16373, 1.084529, 0.3175288, 0, 1, 0.6588235, 1,
-0.163517, 0.457918, 0.6045002, 0, 1, 0.6627451, 1,
-0.1630432, -0.4047171, -0.4580109, 0, 1, 0.6705883, 1,
-0.1622566, 1.222114, -0.7370154, 0, 1, 0.6745098, 1,
-0.1568332, 1.477988, -0.4273873, 0, 1, 0.682353, 1,
-0.1544184, -1.422512, -4.525074, 0, 1, 0.6862745, 1,
-0.1542563, -2.254972, -1.793871, 0, 1, 0.6941177, 1,
-0.1515768, 1.265651, -0.5612463, 0, 1, 0.7019608, 1,
-0.1458699, -0.4992839, -3.47888, 0, 1, 0.7058824, 1,
-0.1424341, 0.3493143, 0.8650199, 0, 1, 0.7137255, 1,
-0.1411469, -0.09331541, -1.365245, 0, 1, 0.7176471, 1,
-0.139842, -0.02999943, 0.2204803, 0, 1, 0.7254902, 1,
-0.1395156, -0.02724572, -2.096195, 0, 1, 0.7294118, 1,
-0.1392267, 1.097595, 0.4335373, 0, 1, 0.7372549, 1,
-0.1323462, 1.042998, -1.609924, 0, 1, 0.7411765, 1,
-0.131657, 0.2326691, 0.4536616, 0, 1, 0.7490196, 1,
-0.1184525, 1.610825, -0.1366217, 0, 1, 0.7529412, 1,
-0.1173384, -0.1579219, -3.923203, 0, 1, 0.7607843, 1,
-0.1166292, -1.887898, -2.696462, 0, 1, 0.7647059, 1,
-0.1137318, -0.3018615, -2.981176, 0, 1, 0.772549, 1,
-0.1120121, -1.046015, -1.340291, 0, 1, 0.7764706, 1,
-0.1104096, -0.6798656, -0.8953975, 0, 1, 0.7843137, 1,
-0.1072907, 0.2612106, -0.4559335, 0, 1, 0.7882353, 1,
-0.1066505, 0.5677432, -0.9777958, 0, 1, 0.7960784, 1,
-0.1045694, 1.062684, -1.298301, 0, 1, 0.8039216, 1,
-0.09875008, 1.837593, -0.5174846, 0, 1, 0.8078431, 1,
-0.09694935, 0.737471, 1.361418, 0, 1, 0.8156863, 1,
-0.09501762, 0.5932408, -0.5107541, 0, 1, 0.8196079, 1,
-0.09392951, -2.921918, -1.5048, 0, 1, 0.827451, 1,
-0.08738337, 0.5869917, -1.928239, 0, 1, 0.8313726, 1,
-0.08583234, 0.2477795, 0.1130274, 0, 1, 0.8392157, 1,
-0.08201203, 0.09687586, 0.4794011, 0, 1, 0.8431373, 1,
-0.07775228, 0.8536407, -0.2792386, 0, 1, 0.8509804, 1,
-0.07447384, 0.2896254, 0.3392855, 0, 1, 0.854902, 1,
-0.07398351, 0.2646078, -0.9859512, 0, 1, 0.8627451, 1,
-0.07345463, -1.980086, -3.042115, 0, 1, 0.8666667, 1,
-0.0733647, 1.043572, 0.175779, 0, 1, 0.8745098, 1,
-0.07273836, 0.5639899, -0.9808624, 0, 1, 0.8784314, 1,
-0.0703958, -0.144123, -2.541884, 0, 1, 0.8862745, 1,
-0.07000973, -1.869581, -3.321846, 0, 1, 0.8901961, 1,
-0.0684121, 1.732295, -0.8317065, 0, 1, 0.8980392, 1,
-0.0679766, -0.2197773, -0.012706, 0, 1, 0.9058824, 1,
-0.06760705, 0.8974739, 0.02302181, 0, 1, 0.9098039, 1,
-0.06595162, 1.243379, 0.1331203, 0, 1, 0.9176471, 1,
-0.06106943, -2.850947, -2.138689, 0, 1, 0.9215686, 1,
-0.05740977, -0.7140357, -4.93835, 0, 1, 0.9294118, 1,
-0.05519301, -0.93351, -1.785872, 0, 1, 0.9333333, 1,
-0.05292428, 1.910505, -0.3149096, 0, 1, 0.9411765, 1,
-0.05253923, -0.6421414, -1.383638, 0, 1, 0.945098, 1,
-0.05253356, 1.453996, 0.02251588, 0, 1, 0.9529412, 1,
-0.0522185, -1.101696, -4.197941, 0, 1, 0.9568627, 1,
-0.04935066, 1.077911, -0.6638103, 0, 1, 0.9647059, 1,
-0.04907687, 0.6347047, -0.08260643, 0, 1, 0.9686275, 1,
-0.04794047, 0.05154133, -0.4195416, 0, 1, 0.9764706, 1,
-0.04690849, -0.005291171, -3.001388, 0, 1, 0.9803922, 1,
-0.04337527, -0.1030483, -4.4452, 0, 1, 0.9882353, 1,
-0.04135698, 0.03133422, -1.017194, 0, 1, 0.9921569, 1,
-0.03365719, -0.4688319, -3.507819, 0, 1, 1, 1,
-0.03223076, 0.180425, -0.1218262, 0, 0.9921569, 1, 1,
-0.02985312, 0.9307594, -0.5304242, 0, 0.9882353, 1, 1,
-0.02665364, -0.8168363, -1.325609, 0, 0.9803922, 1, 1,
-0.02328739, -0.1277914, -2.680664, 0, 0.9764706, 1, 1,
-0.0219938, 0.4882428, 0.1957819, 0, 0.9686275, 1, 1,
-0.02127266, 1.048469, 0.8266875, 0, 0.9647059, 1, 1,
-0.01981979, 0.2272761, 0.52895, 0, 0.9568627, 1, 1,
-0.0163402, 0.6134209, 1.892555, 0, 0.9529412, 1, 1,
-0.01616588, -1.097357, -3.967438, 0, 0.945098, 1, 1,
-0.01512545, -1.369709, -5.828651, 0, 0.9411765, 1, 1,
-0.01375753, 1.034221, -1.120714, 0, 0.9333333, 1, 1,
-0.01371702, 0.1076699, -0.1294618, 0, 0.9294118, 1, 1,
-0.009270517, -0.7913279, -3.810357, 0, 0.9215686, 1, 1,
-0.001268555, 0.5581087, 1.563091, 0, 0.9176471, 1, 1,
0.002649717, -1.199627, 2.606901, 0, 0.9098039, 1, 1,
0.006771639, 0.5775113, -0.2434917, 0, 0.9058824, 1, 1,
0.01136512, -0.2192868, -0.01359227, 0, 0.8980392, 1, 1,
0.01237107, 0.3502244, 0.3881303, 0, 0.8901961, 1, 1,
0.01315803, -1.089014, 4.126861, 0, 0.8862745, 1, 1,
0.01580612, 0.4186165, -0.4526107, 0, 0.8784314, 1, 1,
0.01590563, 0.2158361, 0.4680597, 0, 0.8745098, 1, 1,
0.01642674, -0.9474066, 1.784331, 0, 0.8666667, 1, 1,
0.01709925, 0.3176011, -0.5195011, 0, 0.8627451, 1, 1,
0.01772589, -0.2497803, 3.091938, 0, 0.854902, 1, 1,
0.02045843, 0.1170042, 0.1606071, 0, 0.8509804, 1, 1,
0.02312548, -0.573593, 3.62838, 0, 0.8431373, 1, 1,
0.02491962, 1.108837, 0.8843884, 0, 0.8392157, 1, 1,
0.02774205, 0.1807993, 2.114259, 0, 0.8313726, 1, 1,
0.03216807, 0.6807901, 0.7808689, 0, 0.827451, 1, 1,
0.03227783, -1.987806, 4.76609, 0, 0.8196079, 1, 1,
0.03244236, 2.246997, -0.9285148, 0, 0.8156863, 1, 1,
0.03881149, -0.3650485, 3.173674, 0, 0.8078431, 1, 1,
0.0391668, 0.4948154, 2.052497, 0, 0.8039216, 1, 1,
0.03988614, -0.6968623, 4.185277, 0, 0.7960784, 1, 1,
0.04145886, -0.4902077, 3.180668, 0, 0.7882353, 1, 1,
0.04421804, 0.02459416, 0.8404241, 0, 0.7843137, 1, 1,
0.04602311, 0.569654, -0.7520294, 0, 0.7764706, 1, 1,
0.04673799, -0.5163152, 4.092131, 0, 0.772549, 1, 1,
0.0480295, 0.3260362, -0.09085012, 0, 0.7647059, 1, 1,
0.06040407, 2.334049, 0.8351519, 0, 0.7607843, 1, 1,
0.06130564, -2.292837, 3.482929, 0, 0.7529412, 1, 1,
0.06654792, 0.7035988, 0.07529644, 0, 0.7490196, 1, 1,
0.06791776, -0.04834727, 1.671143, 0, 0.7411765, 1, 1,
0.06848048, 1.80932, -0.5704311, 0, 0.7372549, 1, 1,
0.07026608, -0.39269, 4.027198, 0, 0.7294118, 1, 1,
0.07048178, -0.8835703, 2.142938, 0, 0.7254902, 1, 1,
0.07236265, -0.1158264, 1.951013, 0, 0.7176471, 1, 1,
0.0749669, -0.5206792, 3.891661, 0, 0.7137255, 1, 1,
0.0771631, -0.01579321, 2.829799, 0, 0.7058824, 1, 1,
0.07765761, 2.259533, 1.442767, 0, 0.6980392, 1, 1,
0.08005758, -0.3396293, 2.235828, 0, 0.6941177, 1, 1,
0.08317488, 1.835267, -0.5530919, 0, 0.6862745, 1, 1,
0.08528053, -1.660084, 3.53971, 0, 0.682353, 1, 1,
0.0857182, -1.681578, 2.174908, 0, 0.6745098, 1, 1,
0.08827228, 0.8847892, -0.1009989, 0, 0.6705883, 1, 1,
0.09039179, 0.2887085, 0.09083169, 0, 0.6627451, 1, 1,
0.09526423, -0.301414, 0.6428161, 0, 0.6588235, 1, 1,
0.09531911, 0.8140596, -0.9574605, 0, 0.6509804, 1, 1,
0.09557045, 0.9047281, 0.3977002, 0, 0.6470588, 1, 1,
0.09716927, 1.519881, -0.08944318, 0, 0.6392157, 1, 1,
0.09869304, -1.368398, 3.377447, 0, 0.6352941, 1, 1,
0.1014552, -0.9861954, 4.920956, 0, 0.627451, 1, 1,
0.1024651, -1.206982, 3.759062, 0, 0.6235294, 1, 1,
0.1032937, 1.499848, 1.466706, 0, 0.6156863, 1, 1,
0.1103013, -0.8213234, 1.648049, 0, 0.6117647, 1, 1,
0.1109793, -1.176568, 3.202819, 0, 0.6039216, 1, 1,
0.1125956, -0.8866307, 1.587485, 0, 0.5960785, 1, 1,
0.1180642, 0.3012768, -1.229234, 0, 0.5921569, 1, 1,
0.1187561, -1.219822, 4.041543, 0, 0.5843138, 1, 1,
0.1202357, 0.798708, 2.032864, 0, 0.5803922, 1, 1,
0.1230631, 1.05603, -1.173932, 0, 0.572549, 1, 1,
0.1267896, -0.601162, 3.427813, 0, 0.5686275, 1, 1,
0.1270976, -0.7657068, 3.687327, 0, 0.5607843, 1, 1,
0.1316416, 1.886863, 0.2693587, 0, 0.5568628, 1, 1,
0.1326859, -0.02632624, 1.698547, 0, 0.5490196, 1, 1,
0.1392798, 0.7414169, 0.7791417, 0, 0.5450981, 1, 1,
0.140684, 1.218981, -1.419153, 0, 0.5372549, 1, 1,
0.1443114, -0.5905243, 1.69869, 0, 0.5333334, 1, 1,
0.1471054, 0.3331854, 0.5014989, 0, 0.5254902, 1, 1,
0.1471775, 0.6967999, -0.9880052, 0, 0.5215687, 1, 1,
0.1479848, 0.7671629, -0.7748425, 0, 0.5137255, 1, 1,
0.148972, 0.9357911, 0.194331, 0, 0.509804, 1, 1,
0.1496695, 1.462866, 1.353876, 0, 0.5019608, 1, 1,
0.1514142, 0.02811812, 1.557204, 0, 0.4941176, 1, 1,
0.1517727, -0.2492393, 3.567301, 0, 0.4901961, 1, 1,
0.1518578, 0.5071384, 0.1671359, 0, 0.4823529, 1, 1,
0.1536517, 0.2579592, -0.8583789, 0, 0.4784314, 1, 1,
0.1552703, -0.9806454, 2.945489, 0, 0.4705882, 1, 1,
0.1572714, -0.4026124, 2.803808, 0, 0.4666667, 1, 1,
0.1582445, -0.3812467, 2.249307, 0, 0.4588235, 1, 1,
0.1588074, 0.193449, 2.291532, 0, 0.454902, 1, 1,
0.1596399, 0.06438711, -0.8983711, 0, 0.4470588, 1, 1,
0.1602647, -0.9085953, 2.649127, 0, 0.4431373, 1, 1,
0.1706379, 1.137144, -0.9325065, 0, 0.4352941, 1, 1,
0.1710441, 0.7505314, -0.6492102, 0, 0.4313726, 1, 1,
0.1763338, -0.8587769, 4.045578, 0, 0.4235294, 1, 1,
0.179128, 1.683396, -0.9483142, 0, 0.4196078, 1, 1,
0.1803876, 0.0559237, 1.099796, 0, 0.4117647, 1, 1,
0.1818966, 0.3784381, 0.3488991, 0, 0.4078431, 1, 1,
0.1828409, -1.375837, 4.184826, 0, 0.4, 1, 1,
0.1850953, -0.9745713, 4.475632, 0, 0.3921569, 1, 1,
0.1939394, -0.03159718, 2.176621, 0, 0.3882353, 1, 1,
0.1953901, -0.156517, 4.716216, 0, 0.3803922, 1, 1,
0.2033688, -0.3756918, 2.592853, 0, 0.3764706, 1, 1,
0.204085, -0.8617705, 4.553119, 0, 0.3686275, 1, 1,
0.2045233, -0.02121081, 1.26697, 0, 0.3647059, 1, 1,
0.2141222, -0.6430348, 3.313981, 0, 0.3568628, 1, 1,
0.2163263, -0.5833412, 1.694762, 0, 0.3529412, 1, 1,
0.218026, -0.6188272, 2.188454, 0, 0.345098, 1, 1,
0.2216808, 0.2249375, 1.749414, 0, 0.3411765, 1, 1,
0.2277993, -1.215332, 3.341133, 0, 0.3333333, 1, 1,
0.2278794, 0.1587788, 0.06035101, 0, 0.3294118, 1, 1,
0.2295968, 0.662783, 0.7273607, 0, 0.3215686, 1, 1,
0.2302039, 1.117869, 1.522282, 0, 0.3176471, 1, 1,
0.230917, 0.7538137, 0.2918175, 0, 0.3098039, 1, 1,
0.2337647, 0.527132, 0.1657023, 0, 0.3058824, 1, 1,
0.2435271, -0.3958828, 3.272052, 0, 0.2980392, 1, 1,
0.2461457, 0.2324472, 0.1468157, 0, 0.2901961, 1, 1,
0.2479077, 1.445616, 0.08924352, 0, 0.2862745, 1, 1,
0.2504907, -1.315189, 1.765496, 0, 0.2784314, 1, 1,
0.2555078, -0.7872967, 2.236359, 0, 0.2745098, 1, 1,
0.2570999, -0.4893151, 3.765968, 0, 0.2666667, 1, 1,
0.26368, -0.0104531, 1.531658, 0, 0.2627451, 1, 1,
0.2666092, -0.2760625, 3.166425, 0, 0.254902, 1, 1,
0.2693467, -0.4353375, 2.7537, 0, 0.2509804, 1, 1,
0.2780074, -1.485687, 3.621107, 0, 0.2431373, 1, 1,
0.2824763, -2.05438, 2.321131, 0, 0.2392157, 1, 1,
0.2903052, 2.109379, -0.7914019, 0, 0.2313726, 1, 1,
0.2964456, -0.4356697, 2.410175, 0, 0.227451, 1, 1,
0.3015015, 0.3889787, 1.970882, 0, 0.2196078, 1, 1,
0.3111196, -0.09289066, 2.697676, 0, 0.2156863, 1, 1,
0.3188884, 1.004053, -1.090209, 0, 0.2078431, 1, 1,
0.3224355, 1.65324, 0.1920415, 0, 0.2039216, 1, 1,
0.3236072, 0.1597263, 1.532491, 0, 0.1960784, 1, 1,
0.3258771, 0.1342913, 0.9578416, 0, 0.1882353, 1, 1,
0.328247, 0.05489584, 1.940394, 0, 0.1843137, 1, 1,
0.3377531, 1.219322, -0.2236039, 0, 0.1764706, 1, 1,
0.3377832, 0.8609182, -0.8457206, 0, 0.172549, 1, 1,
0.339576, 0.1913588, 0.9003426, 0, 0.1647059, 1, 1,
0.3452581, 0.5450121, 0.4591962, 0, 0.1607843, 1, 1,
0.3458368, -0.5221365, 3.226597, 0, 0.1529412, 1, 1,
0.3523576, -0.5010739, 1.532886, 0, 0.1490196, 1, 1,
0.3546291, 0.68717, 0.9135916, 0, 0.1411765, 1, 1,
0.3554016, 0.0204628, 0.7344778, 0, 0.1372549, 1, 1,
0.3573808, -0.2881384, 1.349222, 0, 0.1294118, 1, 1,
0.3591984, -1.873976, 5.359826, 0, 0.1254902, 1, 1,
0.3595192, -1.509882, 4.903745, 0, 0.1176471, 1, 1,
0.3611054, -1.552953, 3.369508, 0, 0.1137255, 1, 1,
0.3660484, -1.286089, 3.363594, 0, 0.1058824, 1, 1,
0.367306, 0.583593, -1.384181, 0, 0.09803922, 1, 1,
0.3688249, -1.632122, 1.976682, 0, 0.09411765, 1, 1,
0.3699987, -1.421059, 3.705998, 0, 0.08627451, 1, 1,
0.3703819, -2.271163, 3.368226, 0, 0.08235294, 1, 1,
0.3818431, -0.4038936, 2.569949, 0, 0.07450981, 1, 1,
0.3827097, 0.5596012, -0.1282149, 0, 0.07058824, 1, 1,
0.3854533, -0.09308495, 0.2837126, 0, 0.0627451, 1, 1,
0.3914354, 0.7055185, 1.99576, 0, 0.05882353, 1, 1,
0.3918653, 2.064366, 0.8063529, 0, 0.05098039, 1, 1,
0.3981234, -0.9804003, 2.829095, 0, 0.04705882, 1, 1,
0.4024801, -2.009418, 3.45346, 0, 0.03921569, 1, 1,
0.4042235, 0.03591308, -0.05632731, 0, 0.03529412, 1, 1,
0.4054594, 0.1590004, 0.1278664, 0, 0.02745098, 1, 1,
0.410071, -1.082587, 3.003678, 0, 0.02352941, 1, 1,
0.4145871, -0.3980042, 1.407965, 0, 0.01568628, 1, 1,
0.4202283, 0.988019, 0.6547886, 0, 0.01176471, 1, 1,
0.421452, 0.4678966, -1.042975, 0, 0.003921569, 1, 1,
0.4309968, 0.5245066, 0.2973964, 0.003921569, 0, 1, 1,
0.4345432, 0.1490657, 1.052403, 0.007843138, 0, 1, 1,
0.434619, -1.52589, 3.783402, 0.01568628, 0, 1, 1,
0.4357716, -0.7525422, 1.734347, 0.01960784, 0, 1, 1,
0.4363793, -1.057648, 4.136428, 0.02745098, 0, 1, 1,
0.436664, -0.4489652, 2.074664, 0.03137255, 0, 1, 1,
0.4372365, 0.8029869, 0.8097919, 0.03921569, 0, 1, 1,
0.4417808, -0.4381485, 1.925471, 0.04313726, 0, 1, 1,
0.4422913, -1.665402, 2.251084, 0.05098039, 0, 1, 1,
0.4467496, 1.286674, 0.490381, 0.05490196, 0, 1, 1,
0.4492492, -1.761933, 2.482916, 0.0627451, 0, 1, 1,
0.4526705, 1.384397, 0.4318198, 0.06666667, 0, 1, 1,
0.4613779, 1.362273, 0.6183789, 0.07450981, 0, 1, 1,
0.462122, 0.06656597, 4.213026, 0.07843138, 0, 1, 1,
0.4672296, -0.4060939, 1.734889, 0.08627451, 0, 1, 1,
0.4699979, -0.07301406, 1.394652, 0.09019608, 0, 1, 1,
0.4705315, 1.849656, -0.7139469, 0.09803922, 0, 1, 1,
0.4710299, -0.3153413, 2.76255, 0.1058824, 0, 1, 1,
0.4751508, -0.2920584, 2.541844, 0.1098039, 0, 1, 1,
0.4754266, 0.296053, 1.089921, 0.1176471, 0, 1, 1,
0.47589, 1.484213, 0.0568817, 0.1215686, 0, 1, 1,
0.4872711, 1.0063, 0.03420727, 0.1294118, 0, 1, 1,
0.4939126, -0.06678015, 1.142969, 0.1333333, 0, 1, 1,
0.4943616, -1.974997, 2.470511, 0.1411765, 0, 1, 1,
0.5024279, 0.4100156, 1.983163, 0.145098, 0, 1, 1,
0.503998, 1.023696, 1.599549, 0.1529412, 0, 1, 1,
0.5049593, 1.410689, 0.08740716, 0.1568628, 0, 1, 1,
0.5074256, -0.4543008, 3.078348, 0.1647059, 0, 1, 1,
0.5105023, 1.028796, 0.2084015, 0.1686275, 0, 1, 1,
0.5108164, 0.8237938, -1.342143, 0.1764706, 0, 1, 1,
0.5142849, 1.595703, 0.320759, 0.1803922, 0, 1, 1,
0.5191848, 0.02034449, 0.7534368, 0.1882353, 0, 1, 1,
0.5228438, -0.3841631, 2.469228, 0.1921569, 0, 1, 1,
0.5256195, 0.2182526, 1.398053, 0.2, 0, 1, 1,
0.525796, 1.184487, -0.6317875, 0.2078431, 0, 1, 1,
0.5305556, 0.4509749, -0.06205104, 0.2117647, 0, 1, 1,
0.533114, -1.328258, 3.289593, 0.2196078, 0, 1, 1,
0.5350831, 0.5321147, 1.157007, 0.2235294, 0, 1, 1,
0.5361975, -1.022796, 3.674164, 0.2313726, 0, 1, 1,
0.5368095, 0.8502833, -0.2249069, 0.2352941, 0, 1, 1,
0.5388712, 0.7287939, 1.691193, 0.2431373, 0, 1, 1,
0.5395287, -0.01492957, -0.2378745, 0.2470588, 0, 1, 1,
0.5452772, 0.4147266, 1.060339, 0.254902, 0, 1, 1,
0.5473492, -0.3404197, 2.516228, 0.2588235, 0, 1, 1,
0.5485373, -1.832268, 3.704785, 0.2666667, 0, 1, 1,
0.5528672, 0.2421351, 2.623558, 0.2705882, 0, 1, 1,
0.5558181, -1.10103, 2.185022, 0.2784314, 0, 1, 1,
0.5579861, -0.2175928, 1.918648, 0.282353, 0, 1, 1,
0.5667945, 0.9451563, 0.2563948, 0.2901961, 0, 1, 1,
0.5686435, 0.8265693, 0.2460278, 0.2941177, 0, 1, 1,
0.5705651, 0.8333545, 0.5582042, 0.3019608, 0, 1, 1,
0.5738416, 1.673741, 0.6218531, 0.3098039, 0, 1, 1,
0.5846269, -0.4000497, 4.071607, 0.3137255, 0, 1, 1,
0.5886908, 1.44692, 1.550711, 0.3215686, 0, 1, 1,
0.5925981, 1.205273, 0.2754945, 0.3254902, 0, 1, 1,
0.5930007, -0.7793067, 3.680633, 0.3333333, 0, 1, 1,
0.5943705, 0.5789959, -0.3624622, 0.3372549, 0, 1, 1,
0.5958734, 0.5331925, 0.228287, 0.345098, 0, 1, 1,
0.5990289, 1.058181, 0.857438, 0.3490196, 0, 1, 1,
0.608116, 0.3855287, 0.8172907, 0.3568628, 0, 1, 1,
0.6129938, 0.3211101, -0.09516783, 0.3607843, 0, 1, 1,
0.6141641, -1.749918, 2.261159, 0.3686275, 0, 1, 1,
0.6194476, 0.4976995, 2.052466, 0.372549, 0, 1, 1,
0.6286172, 0.4747007, 0.2256397, 0.3803922, 0, 1, 1,
0.6297125, 0.9294678, -1.571218, 0.3843137, 0, 1, 1,
0.6328204, -0.955566, 3.251087, 0.3921569, 0, 1, 1,
0.6360632, 0.446062, 2.171083, 0.3960784, 0, 1, 1,
0.6404582, 0.2511375, 2.034487, 0.4039216, 0, 1, 1,
0.6413196, -0.5479937, 1.756973, 0.4117647, 0, 1, 1,
0.654524, 1.388189, -1.439369, 0.4156863, 0, 1, 1,
0.6568565, 0.3771613, 1.688948, 0.4235294, 0, 1, 1,
0.6580707, -1.277048, 2.010383, 0.427451, 0, 1, 1,
0.6616012, 1.475132, 0.9250493, 0.4352941, 0, 1, 1,
0.6620937, -0.9893728, 2.384559, 0.4392157, 0, 1, 1,
0.6640813, -1.755443, 3.626286, 0.4470588, 0, 1, 1,
0.6668184, 0.9630803, 0.3902827, 0.4509804, 0, 1, 1,
0.6796736, 1.853921, 0.2605886, 0.4588235, 0, 1, 1,
0.6800562, 0.3194755, -0.7267439, 0.4627451, 0, 1, 1,
0.6837907, 1.625396, 2.028296, 0.4705882, 0, 1, 1,
0.6849526, 0.3928129, -0.06403503, 0.4745098, 0, 1, 1,
0.698557, 0.3661971, 0.5437894, 0.4823529, 0, 1, 1,
0.6997175, 2.093788, 0.304448, 0.4862745, 0, 1, 1,
0.7040841, 1.016641, 0.7024832, 0.4941176, 0, 1, 1,
0.7051346, 0.3137854, -1.570101, 0.5019608, 0, 1, 1,
0.706374, -0.7389554, 2.299384, 0.5058824, 0, 1, 1,
0.7077286, 0.3946956, 0.9338816, 0.5137255, 0, 1, 1,
0.707864, 0.8841473, 1.234405, 0.5176471, 0, 1, 1,
0.7085586, -1.443074, 1.623184, 0.5254902, 0, 1, 1,
0.7122561, 0.01342847, 2.465427, 0.5294118, 0, 1, 1,
0.7127333, 0.6292657, 1.112824, 0.5372549, 0, 1, 1,
0.7143034, -0.1476073, 1.870284, 0.5411765, 0, 1, 1,
0.7191911, -0.7472098, 1.995568, 0.5490196, 0, 1, 1,
0.7199336, 0.06408381, 3.032658, 0.5529412, 0, 1, 1,
0.723671, 0.066795, 1.778022, 0.5607843, 0, 1, 1,
0.7260392, 0.4825703, 2.36482, 0.5647059, 0, 1, 1,
0.7304642, -0.7219875, 3.767014, 0.572549, 0, 1, 1,
0.7347258, 0.1040873, 2.173019, 0.5764706, 0, 1, 1,
0.7349583, 1.410685, 1.634886, 0.5843138, 0, 1, 1,
0.7383505, 0.3279132, 1.646659, 0.5882353, 0, 1, 1,
0.7383828, 0.8159425, 1.830555, 0.5960785, 0, 1, 1,
0.7448973, -0.4570987, 2.352065, 0.6039216, 0, 1, 1,
0.7493198, 1.434265, -0.2064557, 0.6078432, 0, 1, 1,
0.7559167, -1.060129, 2.76263, 0.6156863, 0, 1, 1,
0.7561515, 0.02117613, 2.343256, 0.6196079, 0, 1, 1,
0.7638894, 0.8413233, 1.891867, 0.627451, 0, 1, 1,
0.7688501, -1.672433, 3.303064, 0.6313726, 0, 1, 1,
0.7698613, 0.913856, 1.417658, 0.6392157, 0, 1, 1,
0.7738563, 1.620703, 0.2794439, 0.6431373, 0, 1, 1,
0.776176, 0.9568469, 0.6376576, 0.6509804, 0, 1, 1,
0.7777286, 0.4088514, 0.7594739, 0.654902, 0, 1, 1,
0.7782944, 0.6371269, 0.2988787, 0.6627451, 0, 1, 1,
0.7788137, -1.776562, 2.740145, 0.6666667, 0, 1, 1,
0.7864237, -0.6372132, 3.768569, 0.6745098, 0, 1, 1,
0.7915432, 1.048682, 0.4009311, 0.6784314, 0, 1, 1,
0.79237, 0.06024143, 2.165674, 0.6862745, 0, 1, 1,
0.8009824, 2.103153, 0.4107958, 0.6901961, 0, 1, 1,
0.8021382, -0.6152436, 2.861304, 0.6980392, 0, 1, 1,
0.8022581, -1.156256, 3.788795, 0.7058824, 0, 1, 1,
0.8030285, 1.585049, -0.2425493, 0.7098039, 0, 1, 1,
0.8119801, 0.0925171, 1.030374, 0.7176471, 0, 1, 1,
0.8125843, 0.9857101, -0.374641, 0.7215686, 0, 1, 1,
0.8179367, -2.606059, 3.888537, 0.7294118, 0, 1, 1,
0.8193586, -1.29212, 3.380857, 0.7333333, 0, 1, 1,
0.8246505, -0.4503741, 1.990773, 0.7411765, 0, 1, 1,
0.8410019, 1.930576, 0.5741, 0.7450981, 0, 1, 1,
0.8487808, -0.09788489, 2.865108, 0.7529412, 0, 1, 1,
0.8561271, -0.2250893, 2.277177, 0.7568628, 0, 1, 1,
0.8661611, -0.8852246, 2.422894, 0.7647059, 0, 1, 1,
0.8687853, 0.4258314, -0.804478, 0.7686275, 0, 1, 1,
0.871957, 1.339621, 0.7216807, 0.7764706, 0, 1, 1,
0.877016, -1.62472, 3.318463, 0.7803922, 0, 1, 1,
0.8827923, -0.6590555, 2.223803, 0.7882353, 0, 1, 1,
0.884971, 0.2053913, 2.620261, 0.7921569, 0, 1, 1,
0.8892943, -1.416728, 2.999381, 0.8, 0, 1, 1,
0.8900178, 0.4350893, 0.8521757, 0.8078431, 0, 1, 1,
0.891475, -0.884653, 3.702171, 0.8117647, 0, 1, 1,
0.8922744, -0.5192597, 1.515796, 0.8196079, 0, 1, 1,
0.8929399, -0.1611474, 0.3808051, 0.8235294, 0, 1, 1,
0.893376, 0.03814297, 0.85346, 0.8313726, 0, 1, 1,
0.8952278, 0.6573952, 2.895425, 0.8352941, 0, 1, 1,
0.897024, -1.598493, 4.045043, 0.8431373, 0, 1, 1,
0.8970962, -1.593324, 3.889545, 0.8470588, 0, 1, 1,
0.9002385, -0.1660893, 1.017835, 0.854902, 0, 1, 1,
0.907217, 0.09908219, 1.287694, 0.8588235, 0, 1, 1,
0.9075363, -1.222148, 1.940505, 0.8666667, 0, 1, 1,
0.9130206, 0.05283335, 2.579648, 0.8705882, 0, 1, 1,
0.9150386, -0.1695388, 1.196635, 0.8784314, 0, 1, 1,
0.9224451, -1.040395, 1.034621, 0.8823529, 0, 1, 1,
0.9244292, 0.4241847, 1.461635, 0.8901961, 0, 1, 1,
0.9286414, 0.08251372, 1.765791, 0.8941177, 0, 1, 1,
0.9295609, 0.8212711, 1.962352, 0.9019608, 0, 1, 1,
0.9342603, 0.3594629, 0.3333916, 0.9098039, 0, 1, 1,
0.9345602, 0.4140583, 0.2412732, 0.9137255, 0, 1, 1,
0.9362529, -0.0001143786, -0.1897177, 0.9215686, 0, 1, 1,
0.9363763, -0.1773627, 0.7564567, 0.9254902, 0, 1, 1,
0.942685, 1.440147, 0.1869894, 0.9333333, 0, 1, 1,
0.9453321, 0.345751, 1.325438, 0.9372549, 0, 1, 1,
0.9502881, -0.7744371, 3.420985, 0.945098, 0, 1, 1,
0.952426, 0.2786127, -0.7823718, 0.9490196, 0, 1, 1,
0.9533738, 1.27411, 0.1189614, 0.9568627, 0, 1, 1,
0.9574134, 0.7589717, 0.2814118, 0.9607843, 0, 1, 1,
0.9639072, 1.613387, 0.466166, 0.9686275, 0, 1, 1,
0.966081, 0.5880794, 1.258574, 0.972549, 0, 1, 1,
0.9683647, 1.191237, 1.911162, 0.9803922, 0, 1, 1,
0.9733871, -1.842049, 1.748394, 0.9843137, 0, 1, 1,
0.9739996, -2.319406, 3.313124, 0.9921569, 0, 1, 1,
0.9783025, -0.03893426, 1.533146, 0.9960784, 0, 1, 1,
0.9790239, 0.8636469, 1.005991, 1, 0, 0.9960784, 1,
0.9791319, 1.383018, 0.4081778, 1, 0, 0.9882353, 1,
0.982179, -0.2979585, 2.180937, 1, 0, 0.9843137, 1,
0.9828391, -0.7362094, 3.029533, 1, 0, 0.9764706, 1,
0.9830217, -0.2569789, 2.570756, 1, 0, 0.972549, 1,
0.9864022, 0.534569, 0.9332424, 1, 0, 0.9647059, 1,
0.9889308, -0.8995687, 2.228446, 1, 0, 0.9607843, 1,
0.9894937, -0.60207, 1.114399, 1, 0, 0.9529412, 1,
0.9916725, -0.9634798, 1.077796, 1, 0, 0.9490196, 1,
0.9995791, 0.7501103, 1.644868, 1, 0, 0.9411765, 1,
1.00044, -0.7449833, 2.861007, 1, 0, 0.9372549, 1,
1.000466, -0.156841, 1.69857, 1, 0, 0.9294118, 1,
1.013954, -0.9812297, 3.221946, 1, 0, 0.9254902, 1,
1.016807, 0.2123409, 1.331382, 1, 0, 0.9176471, 1,
1.019516, 0.5578381, 2.950463, 1, 0, 0.9137255, 1,
1.021272, 0.2880061, 0.8132007, 1, 0, 0.9058824, 1,
1.030475, -0.1602803, 2.922543, 1, 0, 0.9019608, 1,
1.030854, 0.4051163, -0.2207337, 1, 0, 0.8941177, 1,
1.037182, -0.4041088, 1.75044, 1, 0, 0.8862745, 1,
1.039829, 1.251004, 0.8320072, 1, 0, 0.8823529, 1,
1.040698, -0.04176116, 2.161564, 1, 0, 0.8745098, 1,
1.045149, 0.4428456, 2.267053, 1, 0, 0.8705882, 1,
1.048595, 0.4184843, 2.63109, 1, 0, 0.8627451, 1,
1.057007, -0.07262112, 0.6924261, 1, 0, 0.8588235, 1,
1.057562, -0.7668887, 1.391576, 1, 0, 0.8509804, 1,
1.0605, -0.5366614, 2.114479, 1, 0, 0.8470588, 1,
1.075383, 0.6082613, 2.357664, 1, 0, 0.8392157, 1,
1.078396, 1.761226, 1.134063, 1, 0, 0.8352941, 1,
1.081909, -0.2676069, 2.189243, 1, 0, 0.827451, 1,
1.085015, -0.6702669, 3.273776, 1, 0, 0.8235294, 1,
1.0857, 0.4348461, 2.791397, 1, 0, 0.8156863, 1,
1.08702, -0.1147117, 1.757014, 1, 0, 0.8117647, 1,
1.092498, -0.3648437, 1.659865, 1, 0, 0.8039216, 1,
1.094448, -0.106639, 1.567418, 1, 0, 0.7960784, 1,
1.096514, -0.9255988, 2.922909, 1, 0, 0.7921569, 1,
1.101266, 0.2118587, 0.1204663, 1, 0, 0.7843137, 1,
1.108458, 1.114908, 1.299895, 1, 0, 0.7803922, 1,
1.111629, 1.27963, 2.560582, 1, 0, 0.772549, 1,
1.114201, 0.01240793, 2.438858, 1, 0, 0.7686275, 1,
1.123956, -3.022511, 2.207501, 1, 0, 0.7607843, 1,
1.127327, 0.6384798, 3.631371, 1, 0, 0.7568628, 1,
1.128076, -0.7070048, 2.464514, 1, 0, 0.7490196, 1,
1.139619, 0.3309163, 1.923064, 1, 0, 0.7450981, 1,
1.142182, 0.08585672, 1.592858, 1, 0, 0.7372549, 1,
1.166666, 0.8263905, 1.601479, 1, 0, 0.7333333, 1,
1.16833, -0.5519077, 3.332319, 1, 0, 0.7254902, 1,
1.170026, 0.1227529, 2.343252, 1, 0, 0.7215686, 1,
1.171304, -0.2168522, 1.547874, 1, 0, 0.7137255, 1,
1.18315, -0.5562732, 2.924728, 1, 0, 0.7098039, 1,
1.19945, -0.6301367, 2.404311, 1, 0, 0.7019608, 1,
1.20257, 1.038494, -0.3031867, 1, 0, 0.6941177, 1,
1.206412, -1.674557, 4.231155, 1, 0, 0.6901961, 1,
1.207488, -0.3182614, 1.444618, 1, 0, 0.682353, 1,
1.208308, 0.9949433, -0.2711859, 1, 0, 0.6784314, 1,
1.209826, 0.195753, 1.73059, 1, 0, 0.6705883, 1,
1.221908, -0.0914215, 2.981821, 1, 0, 0.6666667, 1,
1.225503, -2.023017, 3.973763, 1, 0, 0.6588235, 1,
1.228711, -0.06512217, -0.6140823, 1, 0, 0.654902, 1,
1.230451, -1.465968, 3.181037, 1, 0, 0.6470588, 1,
1.239697, 2.068945, 1.749367, 1, 0, 0.6431373, 1,
1.24225, -0.6506878, 2.034703, 1, 0, 0.6352941, 1,
1.243932, 1.038436, 0.4149226, 1, 0, 0.6313726, 1,
1.25195, -0.1321875, 2.806378, 1, 0, 0.6235294, 1,
1.254961, -2.742072, 3.779053, 1, 0, 0.6196079, 1,
1.273647, -0.719164, 0.68721, 1, 0, 0.6117647, 1,
1.27493, 0.4657428, 1.356497, 1, 0, 0.6078432, 1,
1.28039, 0.603753, 2.090212, 1, 0, 0.6, 1,
1.288429, -1.580452, 2.363645, 1, 0, 0.5921569, 1,
1.290113, 1.412238, -0.2141308, 1, 0, 0.5882353, 1,
1.295139, 0.6896328, 4.541765, 1, 0, 0.5803922, 1,
1.297452, -0.3316405, 2.714726, 1, 0, 0.5764706, 1,
1.299647, 0.8278347, 0.8580222, 1, 0, 0.5686275, 1,
1.317417, -0.1490389, -0.05252712, 1, 0, 0.5647059, 1,
1.317737, -0.1369546, 0.2234556, 1, 0, 0.5568628, 1,
1.318497, -0.4141862, 2.229445, 1, 0, 0.5529412, 1,
1.324659, -2.377641, 1.892964, 1, 0, 0.5450981, 1,
1.330877, 0.3356687, 2.114099, 1, 0, 0.5411765, 1,
1.343359, 0.6494871, 1.054057, 1, 0, 0.5333334, 1,
1.346535, -0.7077034, 1.261194, 1, 0, 0.5294118, 1,
1.354251, 0.4400153, 0.6649253, 1, 0, 0.5215687, 1,
1.359193, 0.7557024, -0.1565354, 1, 0, 0.5176471, 1,
1.366387, -1.548463, 1.645676, 1, 0, 0.509804, 1,
1.370982, 1.324524, 1.212873, 1, 0, 0.5058824, 1,
1.371209, -1.099895, 1.877957, 1, 0, 0.4980392, 1,
1.398274, 0.3021159, 1.219362, 1, 0, 0.4901961, 1,
1.39913, 0.6779917, 0.1231594, 1, 0, 0.4862745, 1,
1.416086, -1.082482, 4.137671, 1, 0, 0.4784314, 1,
1.419158, -0.1922033, 1.622649, 1, 0, 0.4745098, 1,
1.42676, -0.7992761, 2.543218, 1, 0, 0.4666667, 1,
1.427153, -0.5245934, 1.3221, 1, 0, 0.4627451, 1,
1.444336, 0.2830425, 0.3291469, 1, 0, 0.454902, 1,
1.445675, 0.1604095, -0.1718379, 1, 0, 0.4509804, 1,
1.446952, 0.02916285, -0.3804078, 1, 0, 0.4431373, 1,
1.458646, -0.4287563, 1.565595, 1, 0, 0.4392157, 1,
1.462051, 0.668047, 0.658838, 1, 0, 0.4313726, 1,
1.464455, -0.01034021, 2.969842, 1, 0, 0.427451, 1,
1.466859, -0.8497214, 3.287548, 1, 0, 0.4196078, 1,
1.470433, 1.194168, 0.4197432, 1, 0, 0.4156863, 1,
1.473662, 1.527331, 2.969453, 1, 0, 0.4078431, 1,
1.491848, 0.3264786, 1.272401, 1, 0, 0.4039216, 1,
1.506829, -1.700162, 2.214859, 1, 0, 0.3960784, 1,
1.532076, -1.565575, 3.920388, 1, 0, 0.3882353, 1,
1.54753, -0.1973933, 1.650734, 1, 0, 0.3843137, 1,
1.55429, 1.741012, 0.2816533, 1, 0, 0.3764706, 1,
1.554495, 0.8576882, 1.331499, 1, 0, 0.372549, 1,
1.569952, 1.200923, 2.454572, 1, 0, 0.3647059, 1,
1.583095, -0.2190289, 1.026701, 1, 0, 0.3607843, 1,
1.586439, 1.347165, 2.083886, 1, 0, 0.3529412, 1,
1.590889, -1.923347, 2.242109, 1, 0, 0.3490196, 1,
1.599009, 1.743022, 0.006891758, 1, 0, 0.3411765, 1,
1.601101, -0.2756033, 1.312931, 1, 0, 0.3372549, 1,
1.605886, -1.767072, 1.857752, 1, 0, 0.3294118, 1,
1.624178, -0.8613328, 1.868144, 1, 0, 0.3254902, 1,
1.627769, 1.109526, 2.454293, 1, 0, 0.3176471, 1,
1.638607, -0.1519954, 1.244852, 1, 0, 0.3137255, 1,
1.661869, 2.09318, 0.9386896, 1, 0, 0.3058824, 1,
1.666123, 1.007237, 2.549711, 1, 0, 0.2980392, 1,
1.686829, 0.2643073, 1.948941, 1, 0, 0.2941177, 1,
1.70488, 0.3220908, 1.115064, 1, 0, 0.2862745, 1,
1.708149, 0.5576978, 0.8762811, 1, 0, 0.282353, 1,
1.720976, -0.07882179, 1.041927, 1, 0, 0.2745098, 1,
1.745061, -1.09915, 0.4022826, 1, 0, 0.2705882, 1,
1.773827, 0.09693552, 2.955721, 1, 0, 0.2627451, 1,
1.800497, -0.4708483, 1.763251, 1, 0, 0.2588235, 1,
1.808467, 1.114727, 2.014065, 1, 0, 0.2509804, 1,
1.812784, 1.387847, 2.094576, 1, 0, 0.2470588, 1,
1.835558, 0.7336864, -0.07975854, 1, 0, 0.2392157, 1,
1.89667, 1.20188, 0.5252744, 1, 0, 0.2352941, 1,
1.904501, -1.060455, 1.494473, 1, 0, 0.227451, 1,
1.932854, -0.1464376, 1.804325, 1, 0, 0.2235294, 1,
1.938014, 1.236435, 0.07891472, 1, 0, 0.2156863, 1,
1.94058, 3.872281, 0.8410755, 1, 0, 0.2117647, 1,
1.956716, -0.8252183, 1.635256, 1, 0, 0.2039216, 1,
1.982314, 0.5901296, 1.391731, 1, 0, 0.1960784, 1,
2.009691, 0.821191, 0.4914401, 1, 0, 0.1921569, 1,
2.017341, 0.4342179, 1.596966, 1, 0, 0.1843137, 1,
2.023305, 1.806777, 0.4277781, 1, 0, 0.1803922, 1,
2.030377, 1.742681, 2.957561, 1, 0, 0.172549, 1,
2.030753, -0.1806398, 1.514866, 1, 0, 0.1686275, 1,
2.031648, -2.009576, 2.179407, 1, 0, 0.1607843, 1,
2.040488, 0.9825945, -0.3291679, 1, 0, 0.1568628, 1,
2.050739, -0.1352614, 2.190161, 1, 0, 0.1490196, 1,
2.051049, 0.2331385, 1.82259, 1, 0, 0.145098, 1,
2.065976, -0.6319808, 1.403983, 1, 0, 0.1372549, 1,
2.079076, 1.315789, 1.644804, 1, 0, 0.1333333, 1,
2.087344, -1.571042, 2.563577, 1, 0, 0.1254902, 1,
2.095476, -0.147221, 2.514305, 1, 0, 0.1215686, 1,
2.100001, -0.3993488, 0.8145216, 1, 0, 0.1137255, 1,
2.112611, 0.5996127, 2.126417, 1, 0, 0.1098039, 1,
2.13979, 0.05850943, 1.767134, 1, 0, 0.1019608, 1,
2.153354, 1.162318, 1.286956, 1, 0, 0.09411765, 1,
2.182621, 2.07561, 1.720676, 1, 0, 0.09019608, 1,
2.202158, 2.384724, -0.06016154, 1, 0, 0.08235294, 1,
2.203441, -0.3521489, 2.410444, 1, 0, 0.07843138, 1,
2.224339, 0.6903474, 2.261244, 1, 0, 0.07058824, 1,
2.251094, 0.5035598, 2.732467, 1, 0, 0.06666667, 1,
2.264866, -1.310875, 2.80273, 1, 0, 0.05882353, 1,
2.325416, -0.7862388, 1.748247, 1, 0, 0.05490196, 1,
2.329083, 0.6748999, 2.965485, 1, 0, 0.04705882, 1,
2.437815, -0.09645415, -0.09052002, 1, 0, 0.04313726, 1,
2.47226, -1.52961, 1.114552, 1, 0, 0.03529412, 1,
2.47387, 0.1235139, 2.972724, 1, 0, 0.03137255, 1,
2.485181, -0.853031, 3.803605, 1, 0, 0.02352941, 1,
2.508141, 0.6793903, 1.52048, 1, 0, 0.01960784, 1,
3.083796, 0.4933318, 0.6778353, 1, 0, 0.01176471, 1,
3.102039, -0.5338914, 3.080411, 1, 0, 0.007843138, 1
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
0.1174579, -4.191178, -7.725098, 0, -0.5, 0.5, 0.5,
0.1174579, -4.191178, -7.725098, 1, -0.5, 0.5, 0.5,
0.1174579, -4.191178, -7.725098, 1, 1.5, 0.5, 0.5,
0.1174579, -4.191178, -7.725098, 0, 1.5, 0.5, 0.5
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
-3.878896, 0.424885, -7.725098, 0, -0.5, 0.5, 0.5,
-3.878896, 0.424885, -7.725098, 1, -0.5, 0.5, 0.5,
-3.878896, 0.424885, -7.725098, 1, 1.5, 0.5, 0.5,
-3.878896, 0.424885, -7.725098, 0, 1.5, 0.5, 0.5
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
-3.878896, -4.191178, -0.2344129, 0, -0.5, 0.5, 0.5,
-3.878896, -4.191178, -0.2344129, 1, -0.5, 0.5, 0.5,
-3.878896, -4.191178, -0.2344129, 1, 1.5, 0.5, 0.5,
-3.878896, -4.191178, -0.2344129, 0, 1.5, 0.5, 0.5
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
-2, -3.125933, -5.996479,
3, -3.125933, -5.996479,
-2, -3.125933, -5.996479,
-2, -3.303473, -6.284582,
-1, -3.125933, -5.996479,
-1, -3.303473, -6.284582,
0, -3.125933, -5.996479,
0, -3.303473, -6.284582,
1, -3.125933, -5.996479,
1, -3.303473, -6.284582,
2, -3.125933, -5.996479,
2, -3.303473, -6.284582,
3, -3.125933, -5.996479,
3, -3.303473, -6.284582
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
-2, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
-2, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
-2, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
-2, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5,
-1, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
-1, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
-1, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
-1, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5,
0, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
0, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
0, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
0, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5,
1, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
1, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
1, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
1, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5,
2, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
2, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
2, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
2, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5,
3, -3.658555, -6.860788, 0, -0.5, 0.5, 0.5,
3, -3.658555, -6.860788, 1, -0.5, 0.5, 0.5,
3, -3.658555, -6.860788, 1, 1.5, 0.5, 0.5,
3, -3.658555, -6.860788, 0, 1.5, 0.5, 0.5
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
-2.95666, -3, -5.996479,
-2.95666, 3, -5.996479,
-2.95666, -3, -5.996479,
-3.110366, -3, -6.284582,
-2.95666, -2, -5.996479,
-3.110366, -2, -6.284582,
-2.95666, -1, -5.996479,
-3.110366, -1, -6.284582,
-2.95666, 0, -5.996479,
-3.110366, 0, -6.284582,
-2.95666, 1, -5.996479,
-3.110366, 1, -6.284582,
-2.95666, 2, -5.996479,
-3.110366, 2, -6.284582,
-2.95666, 3, -5.996479,
-3.110366, 3, -6.284582
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
-3.417778, -3, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, -3, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, -3, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, -3, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, -2, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, -2, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, -2, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, -2, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, -1, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, -1, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, -1, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, -1, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, 0, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, 0, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, 0, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, 0, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, 1, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, 1, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, 1, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, 1, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, 2, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, 2, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, 2, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, 2, -6.860788, 0, 1.5, 0.5, 0.5,
-3.417778, 3, -6.860788, 0, -0.5, 0.5, 0.5,
-3.417778, 3, -6.860788, 1, -0.5, 0.5, 0.5,
-3.417778, 3, -6.860788, 1, 1.5, 0.5, 0.5,
-3.417778, 3, -6.860788, 0, 1.5, 0.5, 0.5
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
-2.95666, -3.125933, -4,
-2.95666, -3.125933, 4,
-2.95666, -3.125933, -4,
-3.110366, -3.303473, -4,
-2.95666, -3.125933, -2,
-3.110366, -3.303473, -2,
-2.95666, -3.125933, 0,
-3.110366, -3.303473, 0,
-2.95666, -3.125933, 2,
-3.110366, -3.303473, 2,
-2.95666, -3.125933, 4,
-3.110366, -3.303473, 4
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
-3.417778, -3.658555, -4, 0, -0.5, 0.5, 0.5,
-3.417778, -3.658555, -4, 1, -0.5, 0.5, 0.5,
-3.417778, -3.658555, -4, 1, 1.5, 0.5, 0.5,
-3.417778, -3.658555, -4, 0, 1.5, 0.5, 0.5,
-3.417778, -3.658555, -2, 0, -0.5, 0.5, 0.5,
-3.417778, -3.658555, -2, 1, -0.5, 0.5, 0.5,
-3.417778, -3.658555, -2, 1, 1.5, 0.5, 0.5,
-3.417778, -3.658555, -2, 0, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 0, 0, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 0, 1, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 0, 1, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 0, 0, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 2, 0, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 2, 1, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 2, 1, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 2, 0, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 4, 0, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 4, 1, -0.5, 0.5, 0.5,
-3.417778, -3.658555, 4, 1, 1.5, 0.5, 0.5,
-3.417778, -3.658555, 4, 0, 1.5, 0.5, 0.5
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
-2.95666, -3.125933, -5.996479,
-2.95666, 3.975703, -5.996479,
-2.95666, -3.125933, 5.527653,
-2.95666, 3.975703, 5.527653,
-2.95666, -3.125933, -5.996479,
-2.95666, -3.125933, 5.527653,
-2.95666, 3.975703, -5.996479,
-2.95666, 3.975703, 5.527653,
-2.95666, -3.125933, -5.996479,
3.191576, -3.125933, -5.996479,
-2.95666, -3.125933, 5.527653,
3.191576, -3.125933, 5.527653,
-2.95666, 3.975703, -5.996479,
3.191576, 3.975703, -5.996479,
-2.95666, 3.975703, 5.527653,
3.191576, 3.975703, 5.527653,
3.191576, -3.125933, -5.996479,
3.191576, 3.975703, -5.996479,
3.191576, -3.125933, 5.527653,
3.191576, 3.975703, 5.527653,
3.191576, -3.125933, -5.996479,
3.191576, -3.125933, 5.527653,
3.191576, 3.975703, -5.996479,
3.191576, 3.975703, 5.527653
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
var radius = 7.938904;
var distance = 35.32108;
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
mvMatrix.translate( -0.1174579, -0.424885, 0.2344129 );
mvMatrix.scale( 1.396124, 1.208693, 0.7448456 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32108);
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
Alaproclate_hydrochl<-read.table("Alaproclate_hydrochl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Alaproclate_hydrochl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Alaproclate_hydrochl' not found
```

```r
y<-Alaproclate_hydrochl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Alaproclate_hydrochl' not found
```

```r
z<-Alaproclate_hydrochl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Alaproclate_hydrochl' not found
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
-2.867123, -1.042196, -1.564371, 0, 0, 1, 1, 1,
-2.859568, 1.724142, -1.868842, 1, 0, 0, 1, 1,
-2.795152, 0.1310856, -0.869135, 1, 0, 0, 1, 1,
-2.543122, 0.46861, -2.55656, 1, 0, 0, 1, 1,
-2.518844, -0.7784011, -1.701031, 1, 0, 0, 1, 1,
-2.440105, 1.800445, -1.240532, 1, 0, 0, 1, 1,
-2.37522, -1.132865, -4.022823, 0, 0, 0, 1, 1,
-2.326416, 1.252202, -0.5159085, 0, 0, 0, 1, 1,
-2.319325, -1.698141, -2.938089, 0, 0, 0, 1, 1,
-2.316365, -0.4233772, -2.915475, 0, 0, 0, 1, 1,
-2.294365, 0.5111273, -0.8322678, 0, 0, 0, 1, 1,
-2.250772, 0.170358, -0.5756392, 0, 0, 0, 1, 1,
-2.24022, 0.02106795, -1.572471, 0, 0, 0, 1, 1,
-2.108505, 0.04928406, -1.9259, 1, 1, 1, 1, 1,
-2.100857, -0.7698438, -0.455765, 1, 1, 1, 1, 1,
-2.099704, 1.133854, -1.439628, 1, 1, 1, 1, 1,
-2.066071, 0.2819958, 0.2159868, 1, 1, 1, 1, 1,
-2.059432, 0.0826631, -1.046948, 1, 1, 1, 1, 1,
-2.041077, 0.1346706, -2.812258, 1, 1, 1, 1, 1,
-2.023199, 1.200039, -0.2130917, 1, 1, 1, 1, 1,
-1.99642, 2.467819, 1.149145, 1, 1, 1, 1, 1,
-1.923064, 1.006589, -0.2326893, 1, 1, 1, 1, 1,
-1.902255, -2.974679, -3.9382, 1, 1, 1, 1, 1,
-1.894062, 0.956466, -0.7663396, 1, 1, 1, 1, 1,
-1.884013, -0.4326171, -2.318432, 1, 1, 1, 1, 1,
-1.87707, -1.432859, -0.9256176, 1, 1, 1, 1, 1,
-1.862859, 0.09072291, -1.116441, 1, 1, 1, 1, 1,
-1.86199, 0.6537972, -0.9700593, 1, 1, 1, 1, 1,
-1.856669, -0.02801552, -2.088916, 0, 0, 1, 1, 1,
-1.850772, -1.633519, -2.738175, 1, 0, 0, 1, 1,
-1.838723, 0.8607134, -0.4775226, 1, 0, 0, 1, 1,
-1.826986, 0.7778212, -0.9756281, 1, 0, 0, 1, 1,
-1.789648, -1.145694, -1.002463, 1, 0, 0, 1, 1,
-1.782986, 0.8363575, -1.651526, 1, 0, 0, 1, 1,
-1.779986, -0.02309838, -2.86773, 0, 0, 0, 1, 1,
-1.773612, -1.944414, -2.702036, 0, 0, 0, 1, 1,
-1.77356, 0.827212, -1.688675, 0, 0, 0, 1, 1,
-1.772643, -0.6190541, -2.426054, 0, 0, 0, 1, 1,
-1.769779, 0.6949298, -1.766429, 0, 0, 0, 1, 1,
-1.767748, -0.5454959, -0.3857432, 0, 0, 0, 1, 1,
-1.756912, -1.523213, -2.270499, 0, 0, 0, 1, 1,
-1.749705, 0.9476303, -1.531769, 1, 1, 1, 1, 1,
-1.748889, 0.8222741, -1.184894, 1, 1, 1, 1, 1,
-1.737126, -0.1986412, -1.092474, 1, 1, 1, 1, 1,
-1.733974, 1.715713, -0.2870968, 1, 1, 1, 1, 1,
-1.704428, 0.008271508, -0.8932905, 1, 1, 1, 1, 1,
-1.685605, -0.5501615, -1.557765, 1, 1, 1, 1, 1,
-1.659063, 1.340942, -0.7964282, 1, 1, 1, 1, 1,
-1.657288, -0.2574958, -1.228343, 1, 1, 1, 1, 1,
-1.656464, -0.3580609, -1.80025, 1, 1, 1, 1, 1,
-1.642592, 0.2102149, -0.9461417, 1, 1, 1, 1, 1,
-1.632138, -0.0605911, -2.51641, 1, 1, 1, 1, 1,
-1.631079, 0.8378671, 0.5770663, 1, 1, 1, 1, 1,
-1.614721, 1.810812, -1.472802, 1, 1, 1, 1, 1,
-1.606559, 0.7720979, -1.401035, 1, 1, 1, 1, 1,
-1.602645, 0.5970958, 0.3337669, 1, 1, 1, 1, 1,
-1.597912, 0.586631, -0.8573705, 0, 0, 1, 1, 1,
-1.596347, 1.355644, -2.694804, 1, 0, 0, 1, 1,
-1.591438, 0.6322979, 0.1566256, 1, 0, 0, 1, 1,
-1.586595, -0.1086827, -2.779468, 1, 0, 0, 1, 1,
-1.577992, 0.5257471, -0.683955, 1, 0, 0, 1, 1,
-1.554043, 2.531245, -0.2769773, 1, 0, 0, 1, 1,
-1.535504, 1.756678, -0.1641773, 0, 0, 0, 1, 1,
-1.534788, -0.2141985, -1.303723, 0, 0, 0, 1, 1,
-1.530815, -1.274805, -4.16977, 0, 0, 0, 1, 1,
-1.509482, 0.04520115, -0.3045161, 0, 0, 0, 1, 1,
-1.491103, 0.546927, -2.957366, 0, 0, 0, 1, 1,
-1.490652, -1.074418, -0.7814061, 0, 0, 0, 1, 1,
-1.490072, 0.1602404, -0.8779192, 0, 0, 0, 1, 1,
-1.472563, -0.05268067, -0.3676825, 1, 1, 1, 1, 1,
-1.455959, 0.8609334, -0.7286108, 1, 1, 1, 1, 1,
-1.452358, -1.085118, -2.559448, 1, 1, 1, 1, 1,
-1.450459, 0.388788, -1.721651, 1, 1, 1, 1, 1,
-1.44843, 0.5280515, 1.208465, 1, 1, 1, 1, 1,
-1.444708, -0.1091086, -1.317094, 1, 1, 1, 1, 1,
-1.424303, -1.714725, -2.897779, 1, 1, 1, 1, 1,
-1.414363, -0.0396287, -1.991066, 1, 1, 1, 1, 1,
-1.407696, -1.175156, -1.463191, 1, 1, 1, 1, 1,
-1.403546, -0.003463502, 1.180555, 1, 1, 1, 1, 1,
-1.390961, -1.379761, -1.405719, 1, 1, 1, 1, 1,
-1.389165, 0.7194198, -0.578685, 1, 1, 1, 1, 1,
-1.384541, -1.448224, -2.067832, 1, 1, 1, 1, 1,
-1.383594, -1.895491, -2.097008, 1, 1, 1, 1, 1,
-1.380684, 0.701139, -1.424049, 1, 1, 1, 1, 1,
-1.365658, -0.1670135, -2.003265, 0, 0, 1, 1, 1,
-1.357718, -0.8912874, -2.168815, 1, 0, 0, 1, 1,
-1.354144, -0.2013651, -0.9819023, 1, 0, 0, 1, 1,
-1.350134, -0.3989564, -1.377283, 1, 0, 0, 1, 1,
-1.346603, -2.1057, -1.374205, 1, 0, 0, 1, 1,
-1.344612, -0.7177491, -2.794054, 1, 0, 0, 1, 1,
-1.339607, 0.2167542, -3.224017, 0, 0, 0, 1, 1,
-1.334241, -1.683116, -2.263667, 0, 0, 0, 1, 1,
-1.331307, -1.15536, -3.279566, 0, 0, 0, 1, 1,
-1.327793, -2.305772, -3.350313, 0, 0, 0, 1, 1,
-1.326105, -0.5784956, -2.733106, 0, 0, 0, 1, 1,
-1.318404, -0.9506804, -2.664597, 0, 0, 0, 1, 1,
-1.303856, -0.4408799, -1.032317, 0, 0, 0, 1, 1,
-1.300902, 0.1959074, -1.433936, 1, 1, 1, 1, 1,
-1.268898, 1.248622, -1.327694, 1, 1, 1, 1, 1,
-1.259551, 1.124291, -2.067738, 1, 1, 1, 1, 1,
-1.252932, 1.365145, 0.7241452, 1, 1, 1, 1, 1,
-1.247937, 1.598601, -0.9587665, 1, 1, 1, 1, 1,
-1.242689, 0.1212126, -0.5287293, 1, 1, 1, 1, 1,
-1.241296, -0.6839517, -1.579747, 1, 1, 1, 1, 1,
-1.233394, 0.0282971, -1.771443, 1, 1, 1, 1, 1,
-1.228964, 0.01800041, -2.227566, 1, 1, 1, 1, 1,
-1.223659, -0.6969123, -0.6063814, 1, 1, 1, 1, 1,
-1.222036, -0.2102422, -1.87991, 1, 1, 1, 1, 1,
-1.22149, -0.644405, -2.551507, 1, 1, 1, 1, 1,
-1.220025, 0.6491154, -2.177643, 1, 1, 1, 1, 1,
-1.217324, -0.4989619, -1.390445, 1, 1, 1, 1, 1,
-1.214455, 2.370184, -0.07833049, 1, 1, 1, 1, 1,
-1.197177, -0.7550705, -2.787998, 0, 0, 1, 1, 1,
-1.192327, -0.3962742, -2.570205, 1, 0, 0, 1, 1,
-1.186047, -0.1797894, -3.888059, 1, 0, 0, 1, 1,
-1.181661, -0.8431237, -2.703364, 1, 0, 0, 1, 1,
-1.180846, 0.5837808, -1.819739, 1, 0, 0, 1, 1,
-1.170439, 1.766277, -1.51509, 1, 0, 0, 1, 1,
-1.169127, -0.1399489, -1.379666, 0, 0, 0, 1, 1,
-1.168901, 0.05257814, -2.525736, 0, 0, 0, 1, 1,
-1.165058, 0.3163812, -1.03651, 0, 0, 0, 1, 1,
-1.155363, 0.1222758, -1.573069, 0, 0, 0, 1, 1,
-1.154521, -0.3736303, -3.677099, 0, 0, 0, 1, 1,
-1.149127, 0.976954, -0.1741349, 0, 0, 0, 1, 1,
-1.131745, -2.075763, -0.8377644, 0, 0, 0, 1, 1,
-1.123889, 0.4564801, -2.250447, 1, 1, 1, 1, 1,
-1.112482, 1.768569, -0.2358472, 1, 1, 1, 1, 1,
-1.111919, 0.8999115, -2.071972, 1, 1, 1, 1, 1,
-1.101603, 0.2114305, -1.246952, 1, 1, 1, 1, 1,
-1.097105, 0.5751714, -1.255103, 1, 1, 1, 1, 1,
-1.096872, 0.4875028, -0.7000666, 1, 1, 1, 1, 1,
-1.095338, -2.265713, -1.723239, 1, 1, 1, 1, 1,
-1.078957, 0.9598271, -1.679269, 1, 1, 1, 1, 1,
-1.076481, 0.3930792, -1.027496, 1, 1, 1, 1, 1,
-1.076062, -0.4194834, -1.707265, 1, 1, 1, 1, 1,
-1.073803, -0.4147809, -2.382493, 1, 1, 1, 1, 1,
-1.067793, -0.7712149, -0.65753, 1, 1, 1, 1, 1,
-1.063265, 2.425097, 0.03770142, 1, 1, 1, 1, 1,
-1.061129, -0.2659498, -3.728782, 1, 1, 1, 1, 1,
-1.051636, -0.549304, -3.604666, 1, 1, 1, 1, 1,
-1.050882, 0.01244441, -3.834506, 0, 0, 1, 1, 1,
-1.044731, 0.9777555, 0.116518, 1, 0, 0, 1, 1,
-1.043146, -0.9711055, -3.303145, 1, 0, 0, 1, 1,
-1.035486, -1.01438, -2.635873, 1, 0, 0, 1, 1,
-1.031646, 0.2337035, 0.04430154, 1, 0, 0, 1, 1,
-1.028711, 0.13124, -0.8417218, 1, 0, 0, 1, 1,
-1.021909, 0.4668024, 1.010432, 0, 0, 0, 1, 1,
-1.010685, 0.7168525, -1.741528, 0, 0, 0, 1, 1,
-1.007845, 0.8303127, -0.3234575, 0, 0, 0, 1, 1,
-1.007733, -0.8910161, -2.114877, 0, 0, 0, 1, 1,
-1.003045, 0.9488403, -1.063076, 0, 0, 0, 1, 1,
-1.00225, 1.391907, -0.753537, 0, 0, 0, 1, 1,
-1.001094, -0.9788618, -2.35711, 0, 0, 0, 1, 1,
-0.9973543, 0.667643, -1.153942, 1, 1, 1, 1, 1,
-0.9943345, -1.020924, -3.424016, 1, 1, 1, 1, 1,
-0.9928614, -1.072156, -2.463389, 1, 1, 1, 1, 1,
-0.99068, 0.8600435, 0.7990591, 1, 1, 1, 1, 1,
-0.9858327, 1.786216, 1.098493, 1, 1, 1, 1, 1,
-0.9828469, 1.095747, -0.1363166, 1, 1, 1, 1, 1,
-0.981496, -0.4830061, -2.340402, 1, 1, 1, 1, 1,
-0.9809266, 0.01465053, -1.341342, 1, 1, 1, 1, 1,
-0.9801769, 0.01696531, -0.5921117, 1, 1, 1, 1, 1,
-0.9789585, -0.2788515, -2.201944, 1, 1, 1, 1, 1,
-0.9677514, -0.6025677, -1.401651, 1, 1, 1, 1, 1,
-0.9668089, -0.4107483, -1.033335, 1, 1, 1, 1, 1,
-0.9577532, -0.3573703, -2.424189, 1, 1, 1, 1, 1,
-0.9540194, 0.5830355, 0.05438311, 1, 1, 1, 1, 1,
-0.953573, -0.3761245, -0.8567688, 1, 1, 1, 1, 1,
-0.9486049, -0.5260048, -2.352202, 0, 0, 1, 1, 1,
-0.9484383, 1.077664, -0.1243726, 1, 0, 0, 1, 1,
-0.9393991, 1.526596, -1.829912, 1, 0, 0, 1, 1,
-0.9374124, 1.110064, -0.8020015, 1, 0, 0, 1, 1,
-0.9362175, 1.240926, -1.033008, 1, 0, 0, 1, 1,
-0.9217779, 1.249632, -1.459935, 1, 0, 0, 1, 1,
-0.9116938, -0.2491329, -1.233327, 0, 0, 0, 1, 1,
-0.9105299, -1.037142, -3.326026, 0, 0, 0, 1, 1,
-0.9101719, 0.05487997, -0.6226916, 0, 0, 0, 1, 1,
-0.906424, -1.550489, -3.876962, 0, 0, 0, 1, 1,
-0.9062794, 1.211039, -1.627409, 0, 0, 0, 1, 1,
-0.9054602, 1.26368, 0.0412345, 0, 0, 0, 1, 1,
-0.9047743, 0.1176749, 0.2193927, 0, 0, 0, 1, 1,
-0.9023082, -1.032996, -3.85205, 1, 1, 1, 1, 1,
-0.9021312, -0.6608171, -2.350332, 1, 1, 1, 1, 1,
-0.9013057, -1.309452, -3.870663, 1, 1, 1, 1, 1,
-0.8942407, 0.2660592, -1.910397, 1, 1, 1, 1, 1,
-0.8941002, -1.640166, -4.149612, 1, 1, 1, 1, 1,
-0.8929569, 0.7136549, 0.139374, 1, 1, 1, 1, 1,
-0.8914993, 1.918419, 0.04134674, 1, 1, 1, 1, 1,
-0.8899933, -1.001809, -2.78184, 1, 1, 1, 1, 1,
-0.8844182, -1.864551, -2.719447, 1, 1, 1, 1, 1,
-0.8812539, 1.278099, -0.6491264, 1, 1, 1, 1, 1,
-0.8785567, -0.8044166, -2.480639, 1, 1, 1, 1, 1,
-0.861547, 0.4262043, -1.5944, 1, 1, 1, 1, 1,
-0.8579125, 0.9420273, -0.5701585, 1, 1, 1, 1, 1,
-0.8557426, -0.5321285, -1.166614, 1, 1, 1, 1, 1,
-0.8533638, -0.5096297, -0.8140773, 1, 1, 1, 1, 1,
-0.8513977, -0.2863361, -1.582512, 0, 0, 1, 1, 1,
-0.8470418, 2.556325, 0.6911695, 1, 0, 0, 1, 1,
-0.8434653, -0.06294799, -0.1802421, 1, 0, 0, 1, 1,
-0.8298302, 1.06819, -0.6447586, 1, 0, 0, 1, 1,
-0.8228638, 0.8387129, 0.9545322, 1, 0, 0, 1, 1,
-0.8112634, -1.079694, -1.411118, 1, 0, 0, 1, 1,
-0.8034805, 1.730862, -2.467027, 0, 0, 0, 1, 1,
-0.8019536, 0.9524845, -1.481825, 0, 0, 0, 1, 1,
-0.7974866, -1.000025, -3.545196, 0, 0, 0, 1, 1,
-0.7950938, -0.3095158, -0.9756796, 0, 0, 0, 1, 1,
-0.793429, -1.776551, -3.988461, 0, 0, 0, 1, 1,
-0.7907977, -1.36592, -1.877422, 0, 0, 0, 1, 1,
-0.7896916, -2.003565, -3.095369, 0, 0, 0, 1, 1,
-0.7855927, -0.2605373, -1.604995, 1, 1, 1, 1, 1,
-0.7841709, 1.191479, 0.1213483, 1, 1, 1, 1, 1,
-0.7828674, 2.066422, -1.586155, 1, 1, 1, 1, 1,
-0.7816011, -0.05386816, -1.474236, 1, 1, 1, 1, 1,
-0.7798674, -0.9143082, -0.9083431, 1, 1, 1, 1, 1,
-0.7786528, -1.232652, -2.36632, 1, 1, 1, 1, 1,
-0.7733954, 0.9885904, -0.2324135, 1, 1, 1, 1, 1,
-0.7731944, 0.5430791, -0.7359391, 1, 1, 1, 1, 1,
-0.7716178, 0.2874061, -1.370577, 1, 1, 1, 1, 1,
-0.7704048, -1.016713, -1.416007, 1, 1, 1, 1, 1,
-0.7680761, -0.9402705, -1.85811, 1, 1, 1, 1, 1,
-0.7649187, -0.4510907, -2.644872, 1, 1, 1, 1, 1,
-0.7627765, 0.5896583, -2.519572, 1, 1, 1, 1, 1,
-0.7566453, -0.436279, -1.880703, 1, 1, 1, 1, 1,
-0.7539307, 0.178059, -0.01511026, 1, 1, 1, 1, 1,
-0.7490385, 1.013319, -0.3340393, 0, 0, 1, 1, 1,
-0.7483634, 1.07463, 0.3553522, 1, 0, 0, 1, 1,
-0.7435085, -0.06529287, -2.31658, 1, 0, 0, 1, 1,
-0.7428272, -0.7958739, -0.9363158, 1, 0, 0, 1, 1,
-0.7399646, -0.1922201, -1.809178, 1, 0, 0, 1, 1,
-0.733266, -0.7613819, -3.295432, 1, 0, 0, 1, 1,
-0.7279041, -0.8523501, -2.625749, 0, 0, 0, 1, 1,
-0.7267567, -0.004511111, -2.191279, 0, 0, 0, 1, 1,
-0.7265235, 1.083539, -1.009705, 0, 0, 0, 1, 1,
-0.7261502, 0.2490835, -0.6986619, 0, 0, 0, 1, 1,
-0.723184, -0.9293374, -1.092783, 0, 0, 0, 1, 1,
-0.7212335, -0.3821307, -0.6785968, 0, 0, 0, 1, 1,
-0.7173722, -0.3419596, -4.407546, 0, 0, 0, 1, 1,
-0.7165148, -1.574183, -2.482335, 1, 1, 1, 1, 1,
-0.7156376, -1.304337, -2.68736, 1, 1, 1, 1, 1,
-0.7127053, 0.8985202, 0.755408, 1, 1, 1, 1, 1,
-0.7109139, -1.819084, -3.161644, 1, 1, 1, 1, 1,
-0.7057515, 0.8298967, -1.008202, 1, 1, 1, 1, 1,
-0.6996829, 2.196065, 0.161067, 1, 1, 1, 1, 1,
-0.6929627, 1.548815, -0.5574987, 1, 1, 1, 1, 1,
-0.6907631, -0.5348172, -0.453382, 1, 1, 1, 1, 1,
-0.6864417, 0.1964231, 0.3187531, 1, 1, 1, 1, 1,
-0.6848179, -0.3521783, -1.096375, 1, 1, 1, 1, 1,
-0.6844834, 0.8355729, -2.375855, 1, 1, 1, 1, 1,
-0.6802557, 0.6840569, -1.05897, 1, 1, 1, 1, 1,
-0.6790386, 0.4502273, -1.363799, 1, 1, 1, 1, 1,
-0.6789811, 1.84129, -1.026231, 1, 1, 1, 1, 1,
-0.676133, -0.08644971, -3.46206, 1, 1, 1, 1, 1,
-0.6722985, -2.220001, -3.28616, 0, 0, 1, 1, 1,
-0.6722584, -1.710856, -2.852221, 1, 0, 0, 1, 1,
-0.6707247, 0.2928039, -1.030902, 1, 0, 0, 1, 1,
-0.6609191, 0.6410119, -1.102099, 1, 0, 0, 1, 1,
-0.6576383, -2.626973, -3.163733, 1, 0, 0, 1, 1,
-0.6523913, 0.04964159, -0.2400346, 1, 0, 0, 1, 1,
-0.6447077, 0.6908521, -1.017055, 0, 0, 0, 1, 1,
-0.6343358, 1.13544, -1.615141, 0, 0, 0, 1, 1,
-0.6339648, -1.860904, -2.420017, 0, 0, 0, 1, 1,
-0.6324699, -0.1910618, -3.611252, 0, 0, 0, 1, 1,
-0.6298783, -0.3992894, -0.9692943, 0, 0, 0, 1, 1,
-0.62778, 1.074272, 0.7467107, 0, 0, 0, 1, 1,
-0.6192297, 0.6799163, 0.5332632, 0, 0, 0, 1, 1,
-0.6183392, 0.4022267, -0.6812363, 1, 1, 1, 1, 1,
-0.6177176, 1.109026, -1.159374, 1, 1, 1, 1, 1,
-0.6163023, 0.5664568, -0.04427601, 1, 1, 1, 1, 1,
-0.6133321, 1.379322, 0.1256045, 1, 1, 1, 1, 1,
-0.612489, 0.7485152, 1.934774, 1, 1, 1, 1, 1,
-0.6083404, 0.7649991, 0.2700517, 1, 1, 1, 1, 1,
-0.6078185, -1.231729, -3.889478, 1, 1, 1, 1, 1,
-0.6034818, 1.542783, 0.3730235, 1, 1, 1, 1, 1,
-0.6030069, 0.9633564, -0.8061337, 1, 1, 1, 1, 1,
-0.6021553, 0.9053745, -0.4760171, 1, 1, 1, 1, 1,
-0.5970345, -0.7420137, -3.267254, 1, 1, 1, 1, 1,
-0.5924644, -0.9428725, -4.434864, 1, 1, 1, 1, 1,
-0.5835158, -1.195911, -3.045574, 1, 1, 1, 1, 1,
-0.5827018, -0.3424056, -2.860569, 1, 1, 1, 1, 1,
-0.5804808, -1.488784, -1.96486, 1, 1, 1, 1, 1,
-0.5800776, -0.0702766, -0.8741024, 0, 0, 1, 1, 1,
-0.5739971, -1.975857, -2.1163, 1, 0, 0, 1, 1,
-0.5726494, -0.2533162, -1.37854, 1, 0, 0, 1, 1,
-0.5725359, 0.4422164, -1.611534, 1, 0, 0, 1, 1,
-0.5686115, 1.140699, -1.661147, 1, 0, 0, 1, 1,
-0.5660292, -1.66706, -2.707562, 1, 0, 0, 1, 1,
-0.565331, -1.730894, -2.932604, 0, 0, 0, 1, 1,
-0.5651506, -0.378204, -2.33181, 0, 0, 0, 1, 1,
-0.5636407, -0.06042844, -0.8279905, 0, 0, 0, 1, 1,
-0.5627359, 2.721951, -0.7529088, 0, 0, 0, 1, 1,
-0.562703, 0.1919427, -2.544926, 0, 0, 0, 1, 1,
-0.5616438, 0.00262852, -1.966237, 0, 0, 0, 1, 1,
-0.5614405, 1.274737, -1.368242, 0, 0, 0, 1, 1,
-0.5496064, -1.165513, -3.433977, 1, 1, 1, 1, 1,
-0.5488951, 0.6365398, -0.7335614, 1, 1, 1, 1, 1,
-0.5474302, 0.4052774, -2.851377, 1, 1, 1, 1, 1,
-0.543492, -0.5659797, -3.345288, 1, 1, 1, 1, 1,
-0.5421734, -0.7749575, -1.621244, 1, 1, 1, 1, 1,
-0.5397643, -0.5183496, -2.88185, 1, 1, 1, 1, 1,
-0.5397041, -0.8666424, -2.743035, 1, 1, 1, 1, 1,
-0.5391189, -0.5117328, -4.314179, 1, 1, 1, 1, 1,
-0.5365361, 0.8854684, -0.09550487, 1, 1, 1, 1, 1,
-0.5364681, -1.669833, -4.468627, 1, 1, 1, 1, 1,
-0.5357471, -0.05478283, -1.836285, 1, 1, 1, 1, 1,
-0.5343913, -0.7691255, -2.213566, 1, 1, 1, 1, 1,
-0.5342863, -0.3459606, -1.079892, 1, 1, 1, 1, 1,
-0.529302, 0.5584651, -0.9079278, 1, 1, 1, 1, 1,
-0.5273594, -1.425342, -3.358617, 1, 1, 1, 1, 1,
-0.5265387, 0.2325359, -1.888526, 0, 0, 1, 1, 1,
-0.5252939, -0.5551755, -3.69935, 1, 0, 0, 1, 1,
-0.5037696, 1.358805, -0.1705013, 1, 0, 0, 1, 1,
-0.4980512, -2.063677, -2.752622, 1, 0, 0, 1, 1,
-0.497571, -0.2381074, -0.2610025, 1, 0, 0, 1, 1,
-0.4968396, 0.3545451, -0.2239508, 1, 0, 0, 1, 1,
-0.4937951, -0.1688631, -3.383202, 0, 0, 0, 1, 1,
-0.4896497, 0.2045412, -0.3334606, 0, 0, 0, 1, 1,
-0.4885556, -1.12838, -1.576145, 0, 0, 0, 1, 1,
-0.4854746, -0.2539629, -1.449591, 0, 0, 0, 1, 1,
-0.4852954, 0.9233445, 0.7182689, 0, 0, 0, 1, 1,
-0.482805, 1.493894, -0.1590136, 0, 0, 0, 1, 1,
-0.4823081, 1.552683, 0.3725235, 0, 0, 0, 1, 1,
-0.4777835, -0.1044693, -3.42813, 1, 1, 1, 1, 1,
-0.4746847, 1.011422, -0.4053026, 1, 1, 1, 1, 1,
-0.4721079, -1.209703, -2.51447, 1, 1, 1, 1, 1,
-0.4708797, -0.3129812, -1.460057, 1, 1, 1, 1, 1,
-0.467342, -1.200236, -2.796157, 1, 1, 1, 1, 1,
-0.4621928, -0.6328025, -3.512921, 1, 1, 1, 1, 1,
-0.4616472, 0.04162682, -1.587003, 1, 1, 1, 1, 1,
-0.4601353, -1.335822, -4.323042, 1, 1, 1, 1, 1,
-0.4593537, 0.8910748, 1.592299, 1, 1, 1, 1, 1,
-0.4571145, -0.4972388, -2.759707, 1, 1, 1, 1, 1,
-0.4547453, -2.753443, -2.899455, 1, 1, 1, 1, 1,
-0.4531035, -1.027235, -2.139168, 1, 1, 1, 1, 1,
-0.4511311, 0.4377818, -1.61289, 1, 1, 1, 1, 1,
-0.4446003, 1.059762, -0.5134193, 1, 1, 1, 1, 1,
-0.4413707, 0.6300365, -1.102388, 1, 1, 1, 1, 1,
-0.4390353, -0.6926543, -2.73943, 0, 0, 1, 1, 1,
-0.431173, 0.6219763, -0.5339251, 1, 0, 0, 1, 1,
-0.4264775, 1.749603, -1.011427, 1, 0, 0, 1, 1,
-0.4203599, 0.554512, -0.4184716, 1, 0, 0, 1, 1,
-0.419889, 3.06774, -0.1774564, 1, 0, 0, 1, 1,
-0.4190688, 0.4250684, -0.7823253, 1, 0, 0, 1, 1,
-0.4187785, 0.5140665, -2.077942, 0, 0, 0, 1, 1,
-0.4164011, -0.2990358, -1.529026, 0, 0, 0, 1, 1,
-0.412187, 0.4009152, -1.460515, 0, 0, 0, 1, 1,
-0.408559, 1.652674, -1.645588, 0, 0, 0, 1, 1,
-0.408164, 0.831216, 2.096485, 0, 0, 0, 1, 1,
-0.4079222, 1.092423, 0.06045198, 0, 0, 0, 1, 1,
-0.4051411, -0.6557633, -2.710565, 0, 0, 0, 1, 1,
-0.4015833, 0.5386722, -0.5796138, 1, 1, 1, 1, 1,
-0.4012354, -1.47539, -1.196743, 1, 1, 1, 1, 1,
-0.4006623, -1.063502, -0.4691701, 1, 1, 1, 1, 1,
-0.3964911, -0.0340745, -0.1876525, 1, 1, 1, 1, 1,
-0.3914817, 0.8107356, -0.5276576, 1, 1, 1, 1, 1,
-0.3896609, 0.6567222, -0.6336435, 1, 1, 1, 1, 1,
-0.3853331, -1.476125, -3.835563, 1, 1, 1, 1, 1,
-0.3796962, 0.8987037, -0.5371022, 1, 1, 1, 1, 1,
-0.3743077, -0.1221015, -1.906868, 1, 1, 1, 1, 1,
-0.3739614, 0.1484133, 0.01004352, 1, 1, 1, 1, 1,
-0.3710915, 0.7401811, 0.4736088, 1, 1, 1, 1, 1,
-0.3643494, 0.7332911, 0.1753245, 1, 1, 1, 1, 1,
-0.360981, -0.7990803, -3.82122, 1, 1, 1, 1, 1,
-0.3600735, 1.36094, -0.8156264, 1, 1, 1, 1, 1,
-0.3575478, 0.3610574, 0.3635962, 1, 1, 1, 1, 1,
-0.3573381, -0.3624694, -3.746623, 0, 0, 1, 1, 1,
-0.3531839, -0.1127299, -1.368277, 1, 0, 0, 1, 1,
-0.3531649, 1.373965, -0.1540892, 1, 0, 0, 1, 1,
-0.3407616, 0.4470235, -0.8222368, 1, 0, 0, 1, 1,
-0.3392885, 0.08631063, -0.9347259, 1, 0, 0, 1, 1,
-0.3379593, -0.5432492, -1.224299, 1, 0, 0, 1, 1,
-0.3358209, 0.2584117, -0.4355849, 0, 0, 0, 1, 1,
-0.3342579, -0.6428201, -1.608566, 0, 0, 0, 1, 1,
-0.3312283, -0.4399049, -2.49772, 0, 0, 0, 1, 1,
-0.3285513, -0.3860422, -2.58712, 0, 0, 0, 1, 1,
-0.327303, -1.154747, -2.840273, 0, 0, 0, 1, 1,
-0.3262335, -0.1063735, -2.1537, 0, 0, 0, 1, 1,
-0.3230349, -0.3337133, -1.300241, 0, 0, 0, 1, 1,
-0.3114767, -0.2422218, -3.032087, 1, 1, 1, 1, 1,
-0.3059619, -2.05921, -5.462115, 1, 1, 1, 1, 1,
-0.3043225, -0.07869624, -2.974922, 1, 1, 1, 1, 1,
-0.3033003, 0.9242063, 0.0567463, 1, 1, 1, 1, 1,
-0.3030528, 0.2122611, -1.446701, 1, 1, 1, 1, 1,
-0.3026547, -0.6867598, -1.615759, 1, 1, 1, 1, 1,
-0.301475, -1.336064, -2.378457, 1, 1, 1, 1, 1,
-0.3012647, -0.3503661, -1.552744, 1, 1, 1, 1, 1,
-0.2986748, -0.01307657, -2.087046, 1, 1, 1, 1, 1,
-0.2979115, 1.27729, 1.152904, 1, 1, 1, 1, 1,
-0.295762, 1.621276, -0.01051181, 1, 1, 1, 1, 1,
-0.2945427, -0.05087433, -2.311075, 1, 1, 1, 1, 1,
-0.2896012, -0.5319433, -2.060266, 1, 1, 1, 1, 1,
-0.2816026, 0.0278898, -2.727713, 1, 1, 1, 1, 1,
-0.2792405, 0.8939309, 0.4855769, 1, 1, 1, 1, 1,
-0.2775387, -0.003293264, -1.217561, 0, 0, 1, 1, 1,
-0.2760116, 0.8028219, -1.371467, 1, 0, 0, 1, 1,
-0.2737195, -1.011426, -1.220888, 1, 0, 0, 1, 1,
-0.2733456, 0.4547546, -0.2418452, 1, 0, 0, 1, 1,
-0.2713045, -0.1685195, -0.3019488, 1, 0, 0, 1, 1,
-0.2711385, 0.69098, 0.0484918, 1, 0, 0, 1, 1,
-0.2699409, 0.8915843, -0.687706, 0, 0, 0, 1, 1,
-0.2690335, -0.5780057, -2.689001, 0, 0, 0, 1, 1,
-0.268555, 0.4891919, -0.537851, 0, 0, 0, 1, 1,
-0.2670488, -0.8142805, -2.568208, 0, 0, 0, 1, 1,
-0.2602791, 1.875968, -1.899049, 0, 0, 0, 1, 1,
-0.257313, -0.2610591, -4.281596, 0, 0, 0, 1, 1,
-0.2557067, 1.513707, 0.7979841, 0, 0, 0, 1, 1,
-0.2556739, -0.3851289, -4.604408, 1, 1, 1, 1, 1,
-0.2538093, 0.4940318, 0.4779041, 1, 1, 1, 1, 1,
-0.2496363, 0.5837035, -0.01028575, 1, 1, 1, 1, 1,
-0.2445298, 0.8138685, -0.03720315, 1, 1, 1, 1, 1,
-0.2433548, 0.1289215, -1.107141, 1, 1, 1, 1, 1,
-0.2359168, 1.966816, 0.9085006, 1, 1, 1, 1, 1,
-0.2354713, 0.02289982, -1.47906, 1, 1, 1, 1, 1,
-0.2306326, 1.76433, 0.2023032, 1, 1, 1, 1, 1,
-0.2291664, -0.9510841, -2.570889, 1, 1, 1, 1, 1,
-0.2233644, -0.2082685, -0.4427335, 1, 1, 1, 1, 1,
-0.2181893, 2.277186, 2.031488, 1, 1, 1, 1, 1,
-0.2175199, 0.2715454, 0.2894116, 1, 1, 1, 1, 1,
-0.2123718, -0.3809732, -3.536042, 1, 1, 1, 1, 1,
-0.2082838, 2.561472, 0.6310323, 1, 1, 1, 1, 1,
-0.207486, 0.03323003, -1.929361, 1, 1, 1, 1, 1,
-0.2072689, 0.4932095, 2.301915, 0, 0, 1, 1, 1,
-0.2057156, -0.6802321, -3.918405, 1, 0, 0, 1, 1,
-0.205605, -0.4468646, -2.292506, 1, 0, 0, 1, 1,
-0.2045206, 1.316417, -0.2400954, 1, 0, 0, 1, 1,
-0.2027815, 0.3191543, -0.3756524, 1, 0, 0, 1, 1,
-0.2006309, 0.4165454, 0.3362812, 1, 0, 0, 1, 1,
-0.199692, 0.5671236, -1.498344, 0, 0, 0, 1, 1,
-0.199535, -0.8340977, -2.445088, 0, 0, 0, 1, 1,
-0.1959367, -0.5187158, -2.58922, 0, 0, 0, 1, 1,
-0.1957685, 0.9510693, -2.878409, 0, 0, 0, 1, 1,
-0.1890775, -1.615207, -1.879098, 0, 0, 0, 1, 1,
-0.1884207, -1.109396, -3.730164, 0, 0, 0, 1, 1,
-0.1883174, -0.1726042, -1.088097, 0, 0, 0, 1, 1,
-0.1840209, 1.336998, -1.690684, 1, 1, 1, 1, 1,
-0.1839369, 0.6826155, -1.034942, 1, 1, 1, 1, 1,
-0.1828204, 0.0004730307, -0.5165803, 1, 1, 1, 1, 1,
-0.1799671, 1.196089, 1.162057, 1, 1, 1, 1, 1,
-0.1784862, 0.4783873, -0.419621, 1, 1, 1, 1, 1,
-0.1774998, -2.10306, -2.499724, 1, 1, 1, 1, 1,
-0.1767148, -0.4303757, -3.201446, 1, 1, 1, 1, 1,
-0.175397, 0.2710463, -1.220097, 1, 1, 1, 1, 1,
-0.1738609, 0.9462975, 0.9379859, 1, 1, 1, 1, 1,
-0.1728612, 0.08190891, -1.31897, 1, 1, 1, 1, 1,
-0.16373, 1.084529, 0.3175288, 1, 1, 1, 1, 1,
-0.163517, 0.457918, 0.6045002, 1, 1, 1, 1, 1,
-0.1630432, -0.4047171, -0.4580109, 1, 1, 1, 1, 1,
-0.1622566, 1.222114, -0.7370154, 1, 1, 1, 1, 1,
-0.1568332, 1.477988, -0.4273873, 1, 1, 1, 1, 1,
-0.1544184, -1.422512, -4.525074, 0, 0, 1, 1, 1,
-0.1542563, -2.254972, -1.793871, 1, 0, 0, 1, 1,
-0.1515768, 1.265651, -0.5612463, 1, 0, 0, 1, 1,
-0.1458699, -0.4992839, -3.47888, 1, 0, 0, 1, 1,
-0.1424341, 0.3493143, 0.8650199, 1, 0, 0, 1, 1,
-0.1411469, -0.09331541, -1.365245, 1, 0, 0, 1, 1,
-0.139842, -0.02999943, 0.2204803, 0, 0, 0, 1, 1,
-0.1395156, -0.02724572, -2.096195, 0, 0, 0, 1, 1,
-0.1392267, 1.097595, 0.4335373, 0, 0, 0, 1, 1,
-0.1323462, 1.042998, -1.609924, 0, 0, 0, 1, 1,
-0.131657, 0.2326691, 0.4536616, 0, 0, 0, 1, 1,
-0.1184525, 1.610825, -0.1366217, 0, 0, 0, 1, 1,
-0.1173384, -0.1579219, -3.923203, 0, 0, 0, 1, 1,
-0.1166292, -1.887898, -2.696462, 1, 1, 1, 1, 1,
-0.1137318, -0.3018615, -2.981176, 1, 1, 1, 1, 1,
-0.1120121, -1.046015, -1.340291, 1, 1, 1, 1, 1,
-0.1104096, -0.6798656, -0.8953975, 1, 1, 1, 1, 1,
-0.1072907, 0.2612106, -0.4559335, 1, 1, 1, 1, 1,
-0.1066505, 0.5677432, -0.9777958, 1, 1, 1, 1, 1,
-0.1045694, 1.062684, -1.298301, 1, 1, 1, 1, 1,
-0.09875008, 1.837593, -0.5174846, 1, 1, 1, 1, 1,
-0.09694935, 0.737471, 1.361418, 1, 1, 1, 1, 1,
-0.09501762, 0.5932408, -0.5107541, 1, 1, 1, 1, 1,
-0.09392951, -2.921918, -1.5048, 1, 1, 1, 1, 1,
-0.08738337, 0.5869917, -1.928239, 1, 1, 1, 1, 1,
-0.08583234, 0.2477795, 0.1130274, 1, 1, 1, 1, 1,
-0.08201203, 0.09687586, 0.4794011, 1, 1, 1, 1, 1,
-0.07775228, 0.8536407, -0.2792386, 1, 1, 1, 1, 1,
-0.07447384, 0.2896254, 0.3392855, 0, 0, 1, 1, 1,
-0.07398351, 0.2646078, -0.9859512, 1, 0, 0, 1, 1,
-0.07345463, -1.980086, -3.042115, 1, 0, 0, 1, 1,
-0.0733647, 1.043572, 0.175779, 1, 0, 0, 1, 1,
-0.07273836, 0.5639899, -0.9808624, 1, 0, 0, 1, 1,
-0.0703958, -0.144123, -2.541884, 1, 0, 0, 1, 1,
-0.07000973, -1.869581, -3.321846, 0, 0, 0, 1, 1,
-0.0684121, 1.732295, -0.8317065, 0, 0, 0, 1, 1,
-0.0679766, -0.2197773, -0.012706, 0, 0, 0, 1, 1,
-0.06760705, 0.8974739, 0.02302181, 0, 0, 0, 1, 1,
-0.06595162, 1.243379, 0.1331203, 0, 0, 0, 1, 1,
-0.06106943, -2.850947, -2.138689, 0, 0, 0, 1, 1,
-0.05740977, -0.7140357, -4.93835, 0, 0, 0, 1, 1,
-0.05519301, -0.93351, -1.785872, 1, 1, 1, 1, 1,
-0.05292428, 1.910505, -0.3149096, 1, 1, 1, 1, 1,
-0.05253923, -0.6421414, -1.383638, 1, 1, 1, 1, 1,
-0.05253356, 1.453996, 0.02251588, 1, 1, 1, 1, 1,
-0.0522185, -1.101696, -4.197941, 1, 1, 1, 1, 1,
-0.04935066, 1.077911, -0.6638103, 1, 1, 1, 1, 1,
-0.04907687, 0.6347047, -0.08260643, 1, 1, 1, 1, 1,
-0.04794047, 0.05154133, -0.4195416, 1, 1, 1, 1, 1,
-0.04690849, -0.005291171, -3.001388, 1, 1, 1, 1, 1,
-0.04337527, -0.1030483, -4.4452, 1, 1, 1, 1, 1,
-0.04135698, 0.03133422, -1.017194, 1, 1, 1, 1, 1,
-0.03365719, -0.4688319, -3.507819, 1, 1, 1, 1, 1,
-0.03223076, 0.180425, -0.1218262, 1, 1, 1, 1, 1,
-0.02985312, 0.9307594, -0.5304242, 1, 1, 1, 1, 1,
-0.02665364, -0.8168363, -1.325609, 1, 1, 1, 1, 1,
-0.02328739, -0.1277914, -2.680664, 0, 0, 1, 1, 1,
-0.0219938, 0.4882428, 0.1957819, 1, 0, 0, 1, 1,
-0.02127266, 1.048469, 0.8266875, 1, 0, 0, 1, 1,
-0.01981979, 0.2272761, 0.52895, 1, 0, 0, 1, 1,
-0.0163402, 0.6134209, 1.892555, 1, 0, 0, 1, 1,
-0.01616588, -1.097357, -3.967438, 1, 0, 0, 1, 1,
-0.01512545, -1.369709, -5.828651, 0, 0, 0, 1, 1,
-0.01375753, 1.034221, -1.120714, 0, 0, 0, 1, 1,
-0.01371702, 0.1076699, -0.1294618, 0, 0, 0, 1, 1,
-0.009270517, -0.7913279, -3.810357, 0, 0, 0, 1, 1,
-0.001268555, 0.5581087, 1.563091, 0, 0, 0, 1, 1,
0.002649717, -1.199627, 2.606901, 0, 0, 0, 1, 1,
0.006771639, 0.5775113, -0.2434917, 0, 0, 0, 1, 1,
0.01136512, -0.2192868, -0.01359227, 1, 1, 1, 1, 1,
0.01237107, 0.3502244, 0.3881303, 1, 1, 1, 1, 1,
0.01315803, -1.089014, 4.126861, 1, 1, 1, 1, 1,
0.01580612, 0.4186165, -0.4526107, 1, 1, 1, 1, 1,
0.01590563, 0.2158361, 0.4680597, 1, 1, 1, 1, 1,
0.01642674, -0.9474066, 1.784331, 1, 1, 1, 1, 1,
0.01709925, 0.3176011, -0.5195011, 1, 1, 1, 1, 1,
0.01772589, -0.2497803, 3.091938, 1, 1, 1, 1, 1,
0.02045843, 0.1170042, 0.1606071, 1, 1, 1, 1, 1,
0.02312548, -0.573593, 3.62838, 1, 1, 1, 1, 1,
0.02491962, 1.108837, 0.8843884, 1, 1, 1, 1, 1,
0.02774205, 0.1807993, 2.114259, 1, 1, 1, 1, 1,
0.03216807, 0.6807901, 0.7808689, 1, 1, 1, 1, 1,
0.03227783, -1.987806, 4.76609, 1, 1, 1, 1, 1,
0.03244236, 2.246997, -0.9285148, 1, 1, 1, 1, 1,
0.03881149, -0.3650485, 3.173674, 0, 0, 1, 1, 1,
0.0391668, 0.4948154, 2.052497, 1, 0, 0, 1, 1,
0.03988614, -0.6968623, 4.185277, 1, 0, 0, 1, 1,
0.04145886, -0.4902077, 3.180668, 1, 0, 0, 1, 1,
0.04421804, 0.02459416, 0.8404241, 1, 0, 0, 1, 1,
0.04602311, 0.569654, -0.7520294, 1, 0, 0, 1, 1,
0.04673799, -0.5163152, 4.092131, 0, 0, 0, 1, 1,
0.0480295, 0.3260362, -0.09085012, 0, 0, 0, 1, 1,
0.06040407, 2.334049, 0.8351519, 0, 0, 0, 1, 1,
0.06130564, -2.292837, 3.482929, 0, 0, 0, 1, 1,
0.06654792, 0.7035988, 0.07529644, 0, 0, 0, 1, 1,
0.06791776, -0.04834727, 1.671143, 0, 0, 0, 1, 1,
0.06848048, 1.80932, -0.5704311, 0, 0, 0, 1, 1,
0.07026608, -0.39269, 4.027198, 1, 1, 1, 1, 1,
0.07048178, -0.8835703, 2.142938, 1, 1, 1, 1, 1,
0.07236265, -0.1158264, 1.951013, 1, 1, 1, 1, 1,
0.0749669, -0.5206792, 3.891661, 1, 1, 1, 1, 1,
0.0771631, -0.01579321, 2.829799, 1, 1, 1, 1, 1,
0.07765761, 2.259533, 1.442767, 1, 1, 1, 1, 1,
0.08005758, -0.3396293, 2.235828, 1, 1, 1, 1, 1,
0.08317488, 1.835267, -0.5530919, 1, 1, 1, 1, 1,
0.08528053, -1.660084, 3.53971, 1, 1, 1, 1, 1,
0.0857182, -1.681578, 2.174908, 1, 1, 1, 1, 1,
0.08827228, 0.8847892, -0.1009989, 1, 1, 1, 1, 1,
0.09039179, 0.2887085, 0.09083169, 1, 1, 1, 1, 1,
0.09526423, -0.301414, 0.6428161, 1, 1, 1, 1, 1,
0.09531911, 0.8140596, -0.9574605, 1, 1, 1, 1, 1,
0.09557045, 0.9047281, 0.3977002, 1, 1, 1, 1, 1,
0.09716927, 1.519881, -0.08944318, 0, 0, 1, 1, 1,
0.09869304, -1.368398, 3.377447, 1, 0, 0, 1, 1,
0.1014552, -0.9861954, 4.920956, 1, 0, 0, 1, 1,
0.1024651, -1.206982, 3.759062, 1, 0, 0, 1, 1,
0.1032937, 1.499848, 1.466706, 1, 0, 0, 1, 1,
0.1103013, -0.8213234, 1.648049, 1, 0, 0, 1, 1,
0.1109793, -1.176568, 3.202819, 0, 0, 0, 1, 1,
0.1125956, -0.8866307, 1.587485, 0, 0, 0, 1, 1,
0.1180642, 0.3012768, -1.229234, 0, 0, 0, 1, 1,
0.1187561, -1.219822, 4.041543, 0, 0, 0, 1, 1,
0.1202357, 0.798708, 2.032864, 0, 0, 0, 1, 1,
0.1230631, 1.05603, -1.173932, 0, 0, 0, 1, 1,
0.1267896, -0.601162, 3.427813, 0, 0, 0, 1, 1,
0.1270976, -0.7657068, 3.687327, 1, 1, 1, 1, 1,
0.1316416, 1.886863, 0.2693587, 1, 1, 1, 1, 1,
0.1326859, -0.02632624, 1.698547, 1, 1, 1, 1, 1,
0.1392798, 0.7414169, 0.7791417, 1, 1, 1, 1, 1,
0.140684, 1.218981, -1.419153, 1, 1, 1, 1, 1,
0.1443114, -0.5905243, 1.69869, 1, 1, 1, 1, 1,
0.1471054, 0.3331854, 0.5014989, 1, 1, 1, 1, 1,
0.1471775, 0.6967999, -0.9880052, 1, 1, 1, 1, 1,
0.1479848, 0.7671629, -0.7748425, 1, 1, 1, 1, 1,
0.148972, 0.9357911, 0.194331, 1, 1, 1, 1, 1,
0.1496695, 1.462866, 1.353876, 1, 1, 1, 1, 1,
0.1514142, 0.02811812, 1.557204, 1, 1, 1, 1, 1,
0.1517727, -0.2492393, 3.567301, 1, 1, 1, 1, 1,
0.1518578, 0.5071384, 0.1671359, 1, 1, 1, 1, 1,
0.1536517, 0.2579592, -0.8583789, 1, 1, 1, 1, 1,
0.1552703, -0.9806454, 2.945489, 0, 0, 1, 1, 1,
0.1572714, -0.4026124, 2.803808, 1, 0, 0, 1, 1,
0.1582445, -0.3812467, 2.249307, 1, 0, 0, 1, 1,
0.1588074, 0.193449, 2.291532, 1, 0, 0, 1, 1,
0.1596399, 0.06438711, -0.8983711, 1, 0, 0, 1, 1,
0.1602647, -0.9085953, 2.649127, 1, 0, 0, 1, 1,
0.1706379, 1.137144, -0.9325065, 0, 0, 0, 1, 1,
0.1710441, 0.7505314, -0.6492102, 0, 0, 0, 1, 1,
0.1763338, -0.8587769, 4.045578, 0, 0, 0, 1, 1,
0.179128, 1.683396, -0.9483142, 0, 0, 0, 1, 1,
0.1803876, 0.0559237, 1.099796, 0, 0, 0, 1, 1,
0.1818966, 0.3784381, 0.3488991, 0, 0, 0, 1, 1,
0.1828409, -1.375837, 4.184826, 0, 0, 0, 1, 1,
0.1850953, -0.9745713, 4.475632, 1, 1, 1, 1, 1,
0.1939394, -0.03159718, 2.176621, 1, 1, 1, 1, 1,
0.1953901, -0.156517, 4.716216, 1, 1, 1, 1, 1,
0.2033688, -0.3756918, 2.592853, 1, 1, 1, 1, 1,
0.204085, -0.8617705, 4.553119, 1, 1, 1, 1, 1,
0.2045233, -0.02121081, 1.26697, 1, 1, 1, 1, 1,
0.2141222, -0.6430348, 3.313981, 1, 1, 1, 1, 1,
0.2163263, -0.5833412, 1.694762, 1, 1, 1, 1, 1,
0.218026, -0.6188272, 2.188454, 1, 1, 1, 1, 1,
0.2216808, 0.2249375, 1.749414, 1, 1, 1, 1, 1,
0.2277993, -1.215332, 3.341133, 1, 1, 1, 1, 1,
0.2278794, 0.1587788, 0.06035101, 1, 1, 1, 1, 1,
0.2295968, 0.662783, 0.7273607, 1, 1, 1, 1, 1,
0.2302039, 1.117869, 1.522282, 1, 1, 1, 1, 1,
0.230917, 0.7538137, 0.2918175, 1, 1, 1, 1, 1,
0.2337647, 0.527132, 0.1657023, 0, 0, 1, 1, 1,
0.2435271, -0.3958828, 3.272052, 1, 0, 0, 1, 1,
0.2461457, 0.2324472, 0.1468157, 1, 0, 0, 1, 1,
0.2479077, 1.445616, 0.08924352, 1, 0, 0, 1, 1,
0.2504907, -1.315189, 1.765496, 1, 0, 0, 1, 1,
0.2555078, -0.7872967, 2.236359, 1, 0, 0, 1, 1,
0.2570999, -0.4893151, 3.765968, 0, 0, 0, 1, 1,
0.26368, -0.0104531, 1.531658, 0, 0, 0, 1, 1,
0.2666092, -0.2760625, 3.166425, 0, 0, 0, 1, 1,
0.2693467, -0.4353375, 2.7537, 0, 0, 0, 1, 1,
0.2780074, -1.485687, 3.621107, 0, 0, 0, 1, 1,
0.2824763, -2.05438, 2.321131, 0, 0, 0, 1, 1,
0.2903052, 2.109379, -0.7914019, 0, 0, 0, 1, 1,
0.2964456, -0.4356697, 2.410175, 1, 1, 1, 1, 1,
0.3015015, 0.3889787, 1.970882, 1, 1, 1, 1, 1,
0.3111196, -0.09289066, 2.697676, 1, 1, 1, 1, 1,
0.3188884, 1.004053, -1.090209, 1, 1, 1, 1, 1,
0.3224355, 1.65324, 0.1920415, 1, 1, 1, 1, 1,
0.3236072, 0.1597263, 1.532491, 1, 1, 1, 1, 1,
0.3258771, 0.1342913, 0.9578416, 1, 1, 1, 1, 1,
0.328247, 0.05489584, 1.940394, 1, 1, 1, 1, 1,
0.3377531, 1.219322, -0.2236039, 1, 1, 1, 1, 1,
0.3377832, 0.8609182, -0.8457206, 1, 1, 1, 1, 1,
0.339576, 0.1913588, 0.9003426, 1, 1, 1, 1, 1,
0.3452581, 0.5450121, 0.4591962, 1, 1, 1, 1, 1,
0.3458368, -0.5221365, 3.226597, 1, 1, 1, 1, 1,
0.3523576, -0.5010739, 1.532886, 1, 1, 1, 1, 1,
0.3546291, 0.68717, 0.9135916, 1, 1, 1, 1, 1,
0.3554016, 0.0204628, 0.7344778, 0, 0, 1, 1, 1,
0.3573808, -0.2881384, 1.349222, 1, 0, 0, 1, 1,
0.3591984, -1.873976, 5.359826, 1, 0, 0, 1, 1,
0.3595192, -1.509882, 4.903745, 1, 0, 0, 1, 1,
0.3611054, -1.552953, 3.369508, 1, 0, 0, 1, 1,
0.3660484, -1.286089, 3.363594, 1, 0, 0, 1, 1,
0.367306, 0.583593, -1.384181, 0, 0, 0, 1, 1,
0.3688249, -1.632122, 1.976682, 0, 0, 0, 1, 1,
0.3699987, -1.421059, 3.705998, 0, 0, 0, 1, 1,
0.3703819, -2.271163, 3.368226, 0, 0, 0, 1, 1,
0.3818431, -0.4038936, 2.569949, 0, 0, 0, 1, 1,
0.3827097, 0.5596012, -0.1282149, 0, 0, 0, 1, 1,
0.3854533, -0.09308495, 0.2837126, 0, 0, 0, 1, 1,
0.3914354, 0.7055185, 1.99576, 1, 1, 1, 1, 1,
0.3918653, 2.064366, 0.8063529, 1, 1, 1, 1, 1,
0.3981234, -0.9804003, 2.829095, 1, 1, 1, 1, 1,
0.4024801, -2.009418, 3.45346, 1, 1, 1, 1, 1,
0.4042235, 0.03591308, -0.05632731, 1, 1, 1, 1, 1,
0.4054594, 0.1590004, 0.1278664, 1, 1, 1, 1, 1,
0.410071, -1.082587, 3.003678, 1, 1, 1, 1, 1,
0.4145871, -0.3980042, 1.407965, 1, 1, 1, 1, 1,
0.4202283, 0.988019, 0.6547886, 1, 1, 1, 1, 1,
0.421452, 0.4678966, -1.042975, 1, 1, 1, 1, 1,
0.4309968, 0.5245066, 0.2973964, 1, 1, 1, 1, 1,
0.4345432, 0.1490657, 1.052403, 1, 1, 1, 1, 1,
0.434619, -1.52589, 3.783402, 1, 1, 1, 1, 1,
0.4357716, -0.7525422, 1.734347, 1, 1, 1, 1, 1,
0.4363793, -1.057648, 4.136428, 1, 1, 1, 1, 1,
0.436664, -0.4489652, 2.074664, 0, 0, 1, 1, 1,
0.4372365, 0.8029869, 0.8097919, 1, 0, 0, 1, 1,
0.4417808, -0.4381485, 1.925471, 1, 0, 0, 1, 1,
0.4422913, -1.665402, 2.251084, 1, 0, 0, 1, 1,
0.4467496, 1.286674, 0.490381, 1, 0, 0, 1, 1,
0.4492492, -1.761933, 2.482916, 1, 0, 0, 1, 1,
0.4526705, 1.384397, 0.4318198, 0, 0, 0, 1, 1,
0.4613779, 1.362273, 0.6183789, 0, 0, 0, 1, 1,
0.462122, 0.06656597, 4.213026, 0, 0, 0, 1, 1,
0.4672296, -0.4060939, 1.734889, 0, 0, 0, 1, 1,
0.4699979, -0.07301406, 1.394652, 0, 0, 0, 1, 1,
0.4705315, 1.849656, -0.7139469, 0, 0, 0, 1, 1,
0.4710299, -0.3153413, 2.76255, 0, 0, 0, 1, 1,
0.4751508, -0.2920584, 2.541844, 1, 1, 1, 1, 1,
0.4754266, 0.296053, 1.089921, 1, 1, 1, 1, 1,
0.47589, 1.484213, 0.0568817, 1, 1, 1, 1, 1,
0.4872711, 1.0063, 0.03420727, 1, 1, 1, 1, 1,
0.4939126, -0.06678015, 1.142969, 1, 1, 1, 1, 1,
0.4943616, -1.974997, 2.470511, 1, 1, 1, 1, 1,
0.5024279, 0.4100156, 1.983163, 1, 1, 1, 1, 1,
0.503998, 1.023696, 1.599549, 1, 1, 1, 1, 1,
0.5049593, 1.410689, 0.08740716, 1, 1, 1, 1, 1,
0.5074256, -0.4543008, 3.078348, 1, 1, 1, 1, 1,
0.5105023, 1.028796, 0.2084015, 1, 1, 1, 1, 1,
0.5108164, 0.8237938, -1.342143, 1, 1, 1, 1, 1,
0.5142849, 1.595703, 0.320759, 1, 1, 1, 1, 1,
0.5191848, 0.02034449, 0.7534368, 1, 1, 1, 1, 1,
0.5228438, -0.3841631, 2.469228, 1, 1, 1, 1, 1,
0.5256195, 0.2182526, 1.398053, 0, 0, 1, 1, 1,
0.525796, 1.184487, -0.6317875, 1, 0, 0, 1, 1,
0.5305556, 0.4509749, -0.06205104, 1, 0, 0, 1, 1,
0.533114, -1.328258, 3.289593, 1, 0, 0, 1, 1,
0.5350831, 0.5321147, 1.157007, 1, 0, 0, 1, 1,
0.5361975, -1.022796, 3.674164, 1, 0, 0, 1, 1,
0.5368095, 0.8502833, -0.2249069, 0, 0, 0, 1, 1,
0.5388712, 0.7287939, 1.691193, 0, 0, 0, 1, 1,
0.5395287, -0.01492957, -0.2378745, 0, 0, 0, 1, 1,
0.5452772, 0.4147266, 1.060339, 0, 0, 0, 1, 1,
0.5473492, -0.3404197, 2.516228, 0, 0, 0, 1, 1,
0.5485373, -1.832268, 3.704785, 0, 0, 0, 1, 1,
0.5528672, 0.2421351, 2.623558, 0, 0, 0, 1, 1,
0.5558181, -1.10103, 2.185022, 1, 1, 1, 1, 1,
0.5579861, -0.2175928, 1.918648, 1, 1, 1, 1, 1,
0.5667945, 0.9451563, 0.2563948, 1, 1, 1, 1, 1,
0.5686435, 0.8265693, 0.2460278, 1, 1, 1, 1, 1,
0.5705651, 0.8333545, 0.5582042, 1, 1, 1, 1, 1,
0.5738416, 1.673741, 0.6218531, 1, 1, 1, 1, 1,
0.5846269, -0.4000497, 4.071607, 1, 1, 1, 1, 1,
0.5886908, 1.44692, 1.550711, 1, 1, 1, 1, 1,
0.5925981, 1.205273, 0.2754945, 1, 1, 1, 1, 1,
0.5930007, -0.7793067, 3.680633, 1, 1, 1, 1, 1,
0.5943705, 0.5789959, -0.3624622, 1, 1, 1, 1, 1,
0.5958734, 0.5331925, 0.228287, 1, 1, 1, 1, 1,
0.5990289, 1.058181, 0.857438, 1, 1, 1, 1, 1,
0.608116, 0.3855287, 0.8172907, 1, 1, 1, 1, 1,
0.6129938, 0.3211101, -0.09516783, 1, 1, 1, 1, 1,
0.6141641, -1.749918, 2.261159, 0, 0, 1, 1, 1,
0.6194476, 0.4976995, 2.052466, 1, 0, 0, 1, 1,
0.6286172, 0.4747007, 0.2256397, 1, 0, 0, 1, 1,
0.6297125, 0.9294678, -1.571218, 1, 0, 0, 1, 1,
0.6328204, -0.955566, 3.251087, 1, 0, 0, 1, 1,
0.6360632, 0.446062, 2.171083, 1, 0, 0, 1, 1,
0.6404582, 0.2511375, 2.034487, 0, 0, 0, 1, 1,
0.6413196, -0.5479937, 1.756973, 0, 0, 0, 1, 1,
0.654524, 1.388189, -1.439369, 0, 0, 0, 1, 1,
0.6568565, 0.3771613, 1.688948, 0, 0, 0, 1, 1,
0.6580707, -1.277048, 2.010383, 0, 0, 0, 1, 1,
0.6616012, 1.475132, 0.9250493, 0, 0, 0, 1, 1,
0.6620937, -0.9893728, 2.384559, 0, 0, 0, 1, 1,
0.6640813, -1.755443, 3.626286, 1, 1, 1, 1, 1,
0.6668184, 0.9630803, 0.3902827, 1, 1, 1, 1, 1,
0.6796736, 1.853921, 0.2605886, 1, 1, 1, 1, 1,
0.6800562, 0.3194755, -0.7267439, 1, 1, 1, 1, 1,
0.6837907, 1.625396, 2.028296, 1, 1, 1, 1, 1,
0.6849526, 0.3928129, -0.06403503, 1, 1, 1, 1, 1,
0.698557, 0.3661971, 0.5437894, 1, 1, 1, 1, 1,
0.6997175, 2.093788, 0.304448, 1, 1, 1, 1, 1,
0.7040841, 1.016641, 0.7024832, 1, 1, 1, 1, 1,
0.7051346, 0.3137854, -1.570101, 1, 1, 1, 1, 1,
0.706374, -0.7389554, 2.299384, 1, 1, 1, 1, 1,
0.7077286, 0.3946956, 0.9338816, 1, 1, 1, 1, 1,
0.707864, 0.8841473, 1.234405, 1, 1, 1, 1, 1,
0.7085586, -1.443074, 1.623184, 1, 1, 1, 1, 1,
0.7122561, 0.01342847, 2.465427, 1, 1, 1, 1, 1,
0.7127333, 0.6292657, 1.112824, 0, 0, 1, 1, 1,
0.7143034, -0.1476073, 1.870284, 1, 0, 0, 1, 1,
0.7191911, -0.7472098, 1.995568, 1, 0, 0, 1, 1,
0.7199336, 0.06408381, 3.032658, 1, 0, 0, 1, 1,
0.723671, 0.066795, 1.778022, 1, 0, 0, 1, 1,
0.7260392, 0.4825703, 2.36482, 1, 0, 0, 1, 1,
0.7304642, -0.7219875, 3.767014, 0, 0, 0, 1, 1,
0.7347258, 0.1040873, 2.173019, 0, 0, 0, 1, 1,
0.7349583, 1.410685, 1.634886, 0, 0, 0, 1, 1,
0.7383505, 0.3279132, 1.646659, 0, 0, 0, 1, 1,
0.7383828, 0.8159425, 1.830555, 0, 0, 0, 1, 1,
0.7448973, -0.4570987, 2.352065, 0, 0, 0, 1, 1,
0.7493198, 1.434265, -0.2064557, 0, 0, 0, 1, 1,
0.7559167, -1.060129, 2.76263, 1, 1, 1, 1, 1,
0.7561515, 0.02117613, 2.343256, 1, 1, 1, 1, 1,
0.7638894, 0.8413233, 1.891867, 1, 1, 1, 1, 1,
0.7688501, -1.672433, 3.303064, 1, 1, 1, 1, 1,
0.7698613, 0.913856, 1.417658, 1, 1, 1, 1, 1,
0.7738563, 1.620703, 0.2794439, 1, 1, 1, 1, 1,
0.776176, 0.9568469, 0.6376576, 1, 1, 1, 1, 1,
0.7777286, 0.4088514, 0.7594739, 1, 1, 1, 1, 1,
0.7782944, 0.6371269, 0.2988787, 1, 1, 1, 1, 1,
0.7788137, -1.776562, 2.740145, 1, 1, 1, 1, 1,
0.7864237, -0.6372132, 3.768569, 1, 1, 1, 1, 1,
0.7915432, 1.048682, 0.4009311, 1, 1, 1, 1, 1,
0.79237, 0.06024143, 2.165674, 1, 1, 1, 1, 1,
0.8009824, 2.103153, 0.4107958, 1, 1, 1, 1, 1,
0.8021382, -0.6152436, 2.861304, 1, 1, 1, 1, 1,
0.8022581, -1.156256, 3.788795, 0, 0, 1, 1, 1,
0.8030285, 1.585049, -0.2425493, 1, 0, 0, 1, 1,
0.8119801, 0.0925171, 1.030374, 1, 0, 0, 1, 1,
0.8125843, 0.9857101, -0.374641, 1, 0, 0, 1, 1,
0.8179367, -2.606059, 3.888537, 1, 0, 0, 1, 1,
0.8193586, -1.29212, 3.380857, 1, 0, 0, 1, 1,
0.8246505, -0.4503741, 1.990773, 0, 0, 0, 1, 1,
0.8410019, 1.930576, 0.5741, 0, 0, 0, 1, 1,
0.8487808, -0.09788489, 2.865108, 0, 0, 0, 1, 1,
0.8561271, -0.2250893, 2.277177, 0, 0, 0, 1, 1,
0.8661611, -0.8852246, 2.422894, 0, 0, 0, 1, 1,
0.8687853, 0.4258314, -0.804478, 0, 0, 0, 1, 1,
0.871957, 1.339621, 0.7216807, 0, 0, 0, 1, 1,
0.877016, -1.62472, 3.318463, 1, 1, 1, 1, 1,
0.8827923, -0.6590555, 2.223803, 1, 1, 1, 1, 1,
0.884971, 0.2053913, 2.620261, 1, 1, 1, 1, 1,
0.8892943, -1.416728, 2.999381, 1, 1, 1, 1, 1,
0.8900178, 0.4350893, 0.8521757, 1, 1, 1, 1, 1,
0.891475, -0.884653, 3.702171, 1, 1, 1, 1, 1,
0.8922744, -0.5192597, 1.515796, 1, 1, 1, 1, 1,
0.8929399, -0.1611474, 0.3808051, 1, 1, 1, 1, 1,
0.893376, 0.03814297, 0.85346, 1, 1, 1, 1, 1,
0.8952278, 0.6573952, 2.895425, 1, 1, 1, 1, 1,
0.897024, -1.598493, 4.045043, 1, 1, 1, 1, 1,
0.8970962, -1.593324, 3.889545, 1, 1, 1, 1, 1,
0.9002385, -0.1660893, 1.017835, 1, 1, 1, 1, 1,
0.907217, 0.09908219, 1.287694, 1, 1, 1, 1, 1,
0.9075363, -1.222148, 1.940505, 1, 1, 1, 1, 1,
0.9130206, 0.05283335, 2.579648, 0, 0, 1, 1, 1,
0.9150386, -0.1695388, 1.196635, 1, 0, 0, 1, 1,
0.9224451, -1.040395, 1.034621, 1, 0, 0, 1, 1,
0.9244292, 0.4241847, 1.461635, 1, 0, 0, 1, 1,
0.9286414, 0.08251372, 1.765791, 1, 0, 0, 1, 1,
0.9295609, 0.8212711, 1.962352, 1, 0, 0, 1, 1,
0.9342603, 0.3594629, 0.3333916, 0, 0, 0, 1, 1,
0.9345602, 0.4140583, 0.2412732, 0, 0, 0, 1, 1,
0.9362529, -0.0001143786, -0.1897177, 0, 0, 0, 1, 1,
0.9363763, -0.1773627, 0.7564567, 0, 0, 0, 1, 1,
0.942685, 1.440147, 0.1869894, 0, 0, 0, 1, 1,
0.9453321, 0.345751, 1.325438, 0, 0, 0, 1, 1,
0.9502881, -0.7744371, 3.420985, 0, 0, 0, 1, 1,
0.952426, 0.2786127, -0.7823718, 1, 1, 1, 1, 1,
0.9533738, 1.27411, 0.1189614, 1, 1, 1, 1, 1,
0.9574134, 0.7589717, 0.2814118, 1, 1, 1, 1, 1,
0.9639072, 1.613387, 0.466166, 1, 1, 1, 1, 1,
0.966081, 0.5880794, 1.258574, 1, 1, 1, 1, 1,
0.9683647, 1.191237, 1.911162, 1, 1, 1, 1, 1,
0.9733871, -1.842049, 1.748394, 1, 1, 1, 1, 1,
0.9739996, -2.319406, 3.313124, 1, 1, 1, 1, 1,
0.9783025, -0.03893426, 1.533146, 1, 1, 1, 1, 1,
0.9790239, 0.8636469, 1.005991, 1, 1, 1, 1, 1,
0.9791319, 1.383018, 0.4081778, 1, 1, 1, 1, 1,
0.982179, -0.2979585, 2.180937, 1, 1, 1, 1, 1,
0.9828391, -0.7362094, 3.029533, 1, 1, 1, 1, 1,
0.9830217, -0.2569789, 2.570756, 1, 1, 1, 1, 1,
0.9864022, 0.534569, 0.9332424, 1, 1, 1, 1, 1,
0.9889308, -0.8995687, 2.228446, 0, 0, 1, 1, 1,
0.9894937, -0.60207, 1.114399, 1, 0, 0, 1, 1,
0.9916725, -0.9634798, 1.077796, 1, 0, 0, 1, 1,
0.9995791, 0.7501103, 1.644868, 1, 0, 0, 1, 1,
1.00044, -0.7449833, 2.861007, 1, 0, 0, 1, 1,
1.000466, -0.156841, 1.69857, 1, 0, 0, 1, 1,
1.013954, -0.9812297, 3.221946, 0, 0, 0, 1, 1,
1.016807, 0.2123409, 1.331382, 0, 0, 0, 1, 1,
1.019516, 0.5578381, 2.950463, 0, 0, 0, 1, 1,
1.021272, 0.2880061, 0.8132007, 0, 0, 0, 1, 1,
1.030475, -0.1602803, 2.922543, 0, 0, 0, 1, 1,
1.030854, 0.4051163, -0.2207337, 0, 0, 0, 1, 1,
1.037182, -0.4041088, 1.75044, 0, 0, 0, 1, 1,
1.039829, 1.251004, 0.8320072, 1, 1, 1, 1, 1,
1.040698, -0.04176116, 2.161564, 1, 1, 1, 1, 1,
1.045149, 0.4428456, 2.267053, 1, 1, 1, 1, 1,
1.048595, 0.4184843, 2.63109, 1, 1, 1, 1, 1,
1.057007, -0.07262112, 0.6924261, 1, 1, 1, 1, 1,
1.057562, -0.7668887, 1.391576, 1, 1, 1, 1, 1,
1.0605, -0.5366614, 2.114479, 1, 1, 1, 1, 1,
1.075383, 0.6082613, 2.357664, 1, 1, 1, 1, 1,
1.078396, 1.761226, 1.134063, 1, 1, 1, 1, 1,
1.081909, -0.2676069, 2.189243, 1, 1, 1, 1, 1,
1.085015, -0.6702669, 3.273776, 1, 1, 1, 1, 1,
1.0857, 0.4348461, 2.791397, 1, 1, 1, 1, 1,
1.08702, -0.1147117, 1.757014, 1, 1, 1, 1, 1,
1.092498, -0.3648437, 1.659865, 1, 1, 1, 1, 1,
1.094448, -0.106639, 1.567418, 1, 1, 1, 1, 1,
1.096514, -0.9255988, 2.922909, 0, 0, 1, 1, 1,
1.101266, 0.2118587, 0.1204663, 1, 0, 0, 1, 1,
1.108458, 1.114908, 1.299895, 1, 0, 0, 1, 1,
1.111629, 1.27963, 2.560582, 1, 0, 0, 1, 1,
1.114201, 0.01240793, 2.438858, 1, 0, 0, 1, 1,
1.123956, -3.022511, 2.207501, 1, 0, 0, 1, 1,
1.127327, 0.6384798, 3.631371, 0, 0, 0, 1, 1,
1.128076, -0.7070048, 2.464514, 0, 0, 0, 1, 1,
1.139619, 0.3309163, 1.923064, 0, 0, 0, 1, 1,
1.142182, 0.08585672, 1.592858, 0, 0, 0, 1, 1,
1.166666, 0.8263905, 1.601479, 0, 0, 0, 1, 1,
1.16833, -0.5519077, 3.332319, 0, 0, 0, 1, 1,
1.170026, 0.1227529, 2.343252, 0, 0, 0, 1, 1,
1.171304, -0.2168522, 1.547874, 1, 1, 1, 1, 1,
1.18315, -0.5562732, 2.924728, 1, 1, 1, 1, 1,
1.19945, -0.6301367, 2.404311, 1, 1, 1, 1, 1,
1.20257, 1.038494, -0.3031867, 1, 1, 1, 1, 1,
1.206412, -1.674557, 4.231155, 1, 1, 1, 1, 1,
1.207488, -0.3182614, 1.444618, 1, 1, 1, 1, 1,
1.208308, 0.9949433, -0.2711859, 1, 1, 1, 1, 1,
1.209826, 0.195753, 1.73059, 1, 1, 1, 1, 1,
1.221908, -0.0914215, 2.981821, 1, 1, 1, 1, 1,
1.225503, -2.023017, 3.973763, 1, 1, 1, 1, 1,
1.228711, -0.06512217, -0.6140823, 1, 1, 1, 1, 1,
1.230451, -1.465968, 3.181037, 1, 1, 1, 1, 1,
1.239697, 2.068945, 1.749367, 1, 1, 1, 1, 1,
1.24225, -0.6506878, 2.034703, 1, 1, 1, 1, 1,
1.243932, 1.038436, 0.4149226, 1, 1, 1, 1, 1,
1.25195, -0.1321875, 2.806378, 0, 0, 1, 1, 1,
1.254961, -2.742072, 3.779053, 1, 0, 0, 1, 1,
1.273647, -0.719164, 0.68721, 1, 0, 0, 1, 1,
1.27493, 0.4657428, 1.356497, 1, 0, 0, 1, 1,
1.28039, 0.603753, 2.090212, 1, 0, 0, 1, 1,
1.288429, -1.580452, 2.363645, 1, 0, 0, 1, 1,
1.290113, 1.412238, -0.2141308, 0, 0, 0, 1, 1,
1.295139, 0.6896328, 4.541765, 0, 0, 0, 1, 1,
1.297452, -0.3316405, 2.714726, 0, 0, 0, 1, 1,
1.299647, 0.8278347, 0.8580222, 0, 0, 0, 1, 1,
1.317417, -0.1490389, -0.05252712, 0, 0, 0, 1, 1,
1.317737, -0.1369546, 0.2234556, 0, 0, 0, 1, 1,
1.318497, -0.4141862, 2.229445, 0, 0, 0, 1, 1,
1.324659, -2.377641, 1.892964, 1, 1, 1, 1, 1,
1.330877, 0.3356687, 2.114099, 1, 1, 1, 1, 1,
1.343359, 0.6494871, 1.054057, 1, 1, 1, 1, 1,
1.346535, -0.7077034, 1.261194, 1, 1, 1, 1, 1,
1.354251, 0.4400153, 0.6649253, 1, 1, 1, 1, 1,
1.359193, 0.7557024, -0.1565354, 1, 1, 1, 1, 1,
1.366387, -1.548463, 1.645676, 1, 1, 1, 1, 1,
1.370982, 1.324524, 1.212873, 1, 1, 1, 1, 1,
1.371209, -1.099895, 1.877957, 1, 1, 1, 1, 1,
1.398274, 0.3021159, 1.219362, 1, 1, 1, 1, 1,
1.39913, 0.6779917, 0.1231594, 1, 1, 1, 1, 1,
1.416086, -1.082482, 4.137671, 1, 1, 1, 1, 1,
1.419158, -0.1922033, 1.622649, 1, 1, 1, 1, 1,
1.42676, -0.7992761, 2.543218, 1, 1, 1, 1, 1,
1.427153, -0.5245934, 1.3221, 1, 1, 1, 1, 1,
1.444336, 0.2830425, 0.3291469, 0, 0, 1, 1, 1,
1.445675, 0.1604095, -0.1718379, 1, 0, 0, 1, 1,
1.446952, 0.02916285, -0.3804078, 1, 0, 0, 1, 1,
1.458646, -0.4287563, 1.565595, 1, 0, 0, 1, 1,
1.462051, 0.668047, 0.658838, 1, 0, 0, 1, 1,
1.464455, -0.01034021, 2.969842, 1, 0, 0, 1, 1,
1.466859, -0.8497214, 3.287548, 0, 0, 0, 1, 1,
1.470433, 1.194168, 0.4197432, 0, 0, 0, 1, 1,
1.473662, 1.527331, 2.969453, 0, 0, 0, 1, 1,
1.491848, 0.3264786, 1.272401, 0, 0, 0, 1, 1,
1.506829, -1.700162, 2.214859, 0, 0, 0, 1, 1,
1.532076, -1.565575, 3.920388, 0, 0, 0, 1, 1,
1.54753, -0.1973933, 1.650734, 0, 0, 0, 1, 1,
1.55429, 1.741012, 0.2816533, 1, 1, 1, 1, 1,
1.554495, 0.8576882, 1.331499, 1, 1, 1, 1, 1,
1.569952, 1.200923, 2.454572, 1, 1, 1, 1, 1,
1.583095, -0.2190289, 1.026701, 1, 1, 1, 1, 1,
1.586439, 1.347165, 2.083886, 1, 1, 1, 1, 1,
1.590889, -1.923347, 2.242109, 1, 1, 1, 1, 1,
1.599009, 1.743022, 0.006891758, 1, 1, 1, 1, 1,
1.601101, -0.2756033, 1.312931, 1, 1, 1, 1, 1,
1.605886, -1.767072, 1.857752, 1, 1, 1, 1, 1,
1.624178, -0.8613328, 1.868144, 1, 1, 1, 1, 1,
1.627769, 1.109526, 2.454293, 1, 1, 1, 1, 1,
1.638607, -0.1519954, 1.244852, 1, 1, 1, 1, 1,
1.661869, 2.09318, 0.9386896, 1, 1, 1, 1, 1,
1.666123, 1.007237, 2.549711, 1, 1, 1, 1, 1,
1.686829, 0.2643073, 1.948941, 1, 1, 1, 1, 1,
1.70488, 0.3220908, 1.115064, 0, 0, 1, 1, 1,
1.708149, 0.5576978, 0.8762811, 1, 0, 0, 1, 1,
1.720976, -0.07882179, 1.041927, 1, 0, 0, 1, 1,
1.745061, -1.09915, 0.4022826, 1, 0, 0, 1, 1,
1.773827, 0.09693552, 2.955721, 1, 0, 0, 1, 1,
1.800497, -0.4708483, 1.763251, 1, 0, 0, 1, 1,
1.808467, 1.114727, 2.014065, 0, 0, 0, 1, 1,
1.812784, 1.387847, 2.094576, 0, 0, 0, 1, 1,
1.835558, 0.7336864, -0.07975854, 0, 0, 0, 1, 1,
1.89667, 1.20188, 0.5252744, 0, 0, 0, 1, 1,
1.904501, -1.060455, 1.494473, 0, 0, 0, 1, 1,
1.932854, -0.1464376, 1.804325, 0, 0, 0, 1, 1,
1.938014, 1.236435, 0.07891472, 0, 0, 0, 1, 1,
1.94058, 3.872281, 0.8410755, 1, 1, 1, 1, 1,
1.956716, -0.8252183, 1.635256, 1, 1, 1, 1, 1,
1.982314, 0.5901296, 1.391731, 1, 1, 1, 1, 1,
2.009691, 0.821191, 0.4914401, 1, 1, 1, 1, 1,
2.017341, 0.4342179, 1.596966, 1, 1, 1, 1, 1,
2.023305, 1.806777, 0.4277781, 1, 1, 1, 1, 1,
2.030377, 1.742681, 2.957561, 1, 1, 1, 1, 1,
2.030753, -0.1806398, 1.514866, 1, 1, 1, 1, 1,
2.031648, -2.009576, 2.179407, 1, 1, 1, 1, 1,
2.040488, 0.9825945, -0.3291679, 1, 1, 1, 1, 1,
2.050739, -0.1352614, 2.190161, 1, 1, 1, 1, 1,
2.051049, 0.2331385, 1.82259, 1, 1, 1, 1, 1,
2.065976, -0.6319808, 1.403983, 1, 1, 1, 1, 1,
2.079076, 1.315789, 1.644804, 1, 1, 1, 1, 1,
2.087344, -1.571042, 2.563577, 1, 1, 1, 1, 1,
2.095476, -0.147221, 2.514305, 0, 0, 1, 1, 1,
2.100001, -0.3993488, 0.8145216, 1, 0, 0, 1, 1,
2.112611, 0.5996127, 2.126417, 1, 0, 0, 1, 1,
2.13979, 0.05850943, 1.767134, 1, 0, 0, 1, 1,
2.153354, 1.162318, 1.286956, 1, 0, 0, 1, 1,
2.182621, 2.07561, 1.720676, 1, 0, 0, 1, 1,
2.202158, 2.384724, -0.06016154, 0, 0, 0, 1, 1,
2.203441, -0.3521489, 2.410444, 0, 0, 0, 1, 1,
2.224339, 0.6903474, 2.261244, 0, 0, 0, 1, 1,
2.251094, 0.5035598, 2.732467, 0, 0, 0, 1, 1,
2.264866, -1.310875, 2.80273, 0, 0, 0, 1, 1,
2.325416, -0.7862388, 1.748247, 0, 0, 0, 1, 1,
2.329083, 0.6748999, 2.965485, 0, 0, 0, 1, 1,
2.437815, -0.09645415, -0.09052002, 1, 1, 1, 1, 1,
2.47226, -1.52961, 1.114552, 1, 1, 1, 1, 1,
2.47387, 0.1235139, 2.972724, 1, 1, 1, 1, 1,
2.485181, -0.853031, 3.803605, 1, 1, 1, 1, 1,
2.508141, 0.6793903, 1.52048, 1, 1, 1, 1, 1,
3.083796, 0.4933318, 0.6778353, 1, 1, 1, 1, 1,
3.102039, -0.5338914, 3.080411, 1, 1, 1, 1, 1
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
var radius = 9.785685;
var distance = 34.3718;
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
mvMatrix.translate( -0.1174577, -0.4248853, 0.2344129 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3718);
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
