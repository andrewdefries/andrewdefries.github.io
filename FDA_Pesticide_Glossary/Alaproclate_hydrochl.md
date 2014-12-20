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
-3.865606, 0.2509476, -1.903897, 1, 0, 0, 1,
-2.84951, 0.1432396, -2.63694, 1, 0.007843138, 0, 1,
-2.815053, 0.2762132, -1.955957, 1, 0.01176471, 0, 1,
-2.773347, 0.467782, -1.372969, 1, 0.01960784, 0, 1,
-2.651818, -0.7278548, -2.293402, 1, 0.02352941, 0, 1,
-2.635877, 0.7917701, -1.879865, 1, 0.03137255, 0, 1,
-2.629102, -1.158841, -0.4080037, 1, 0.03529412, 0, 1,
-2.484431, 1.080227, 0.7886082, 1, 0.04313726, 0, 1,
-2.463599, -1.59436, 0.5294925, 1, 0.04705882, 0, 1,
-2.439919, 0.3262607, -0.3658336, 1, 0.05490196, 0, 1,
-2.438807, -0.8640139, -1.457523, 1, 0.05882353, 0, 1,
-2.381832, 0.1640542, -1.439112, 1, 0.06666667, 0, 1,
-2.360747, -0.2483154, -0.562211, 1, 0.07058824, 0, 1,
-2.311637, 0.4257628, -0.09636219, 1, 0.07843138, 0, 1,
-2.288952, 0.02948563, -2.340466, 1, 0.08235294, 0, 1,
-2.249347, 0.8994679, -0.8348283, 1, 0.09019608, 0, 1,
-2.232077, 1.670529, -1.672265, 1, 0.09411765, 0, 1,
-2.216101, 0.8720648, -1.550344, 1, 0.1019608, 0, 1,
-2.196886, 0.5114072, -1.272655, 1, 0.1098039, 0, 1,
-2.166584, 0.9593185, -0.8614922, 1, 0.1137255, 0, 1,
-2.16227, 0.2649002, -2.926999, 1, 0.1215686, 0, 1,
-2.156767, -2.24971, -3.509458, 1, 0.1254902, 0, 1,
-2.120112, 0.5213827, -2.066579, 1, 0.1333333, 0, 1,
-2.115422, 0.1416298, -2.195703, 1, 0.1372549, 0, 1,
-2.099778, 0.6364715, 0.01325604, 1, 0.145098, 0, 1,
-2.038883, -0.7773844, -1.79728, 1, 0.1490196, 0, 1,
-2.034744, 0.6453873, -2.477149, 1, 0.1568628, 0, 1,
-2.018063, 0.2060927, -0.4653555, 1, 0.1607843, 0, 1,
-2.008497, 1.358687, -1.668639, 1, 0.1686275, 0, 1,
-2.007984, -0.03931515, -0.8221759, 1, 0.172549, 0, 1,
-2.004897, -0.2387843, -1.291769, 1, 0.1803922, 0, 1,
-1.985627, 0.6701823, -1.466832, 1, 0.1843137, 0, 1,
-1.975669, 0.3568164, -2.785872, 1, 0.1921569, 0, 1,
-1.975022, 0.6950604, -2.446316, 1, 0.1960784, 0, 1,
-1.962774, 0.188513, -3.532737, 1, 0.2039216, 0, 1,
-1.948817, -0.7275107, -2.16973, 1, 0.2117647, 0, 1,
-1.946852, -1.88288, -2.215196, 1, 0.2156863, 0, 1,
-1.946137, -0.2062798, -0.8185071, 1, 0.2235294, 0, 1,
-1.839144, -0.0674125, 1.142402, 1, 0.227451, 0, 1,
-1.825162, 1.113777, -2.916058, 1, 0.2352941, 0, 1,
-1.770435, 0.9005228, -0.159402, 1, 0.2392157, 0, 1,
-1.766456, -1.415943, -2.725723, 1, 0.2470588, 0, 1,
-1.745741, -0.9127594, -0.2954111, 1, 0.2509804, 0, 1,
-1.744116, 0.3859108, -2.13969, 1, 0.2588235, 0, 1,
-1.742936, -0.157506, -1.601326, 1, 0.2627451, 0, 1,
-1.742323, 0.4405895, -0.4106846, 1, 0.2705882, 0, 1,
-1.737992, -0.6637468, -0.6576911, 1, 0.2745098, 0, 1,
-1.735421, -0.1811706, -1.686781, 1, 0.282353, 0, 1,
-1.734288, 0.7682711, -0.9575822, 1, 0.2862745, 0, 1,
-1.734029, 0.8141112, -1.662716, 1, 0.2941177, 0, 1,
-1.733967, 1.367781, -1.654948, 1, 0.3019608, 0, 1,
-1.720703, 0.7733085, -1.415479, 1, 0.3058824, 0, 1,
-1.719793, -1.716144, -1.068864, 1, 0.3137255, 0, 1,
-1.719295, -0.8580915, -0.7491505, 1, 0.3176471, 0, 1,
-1.704931, 0.1833983, -1.350821, 1, 0.3254902, 0, 1,
-1.696725, -0.5354074, -2.600016, 1, 0.3294118, 0, 1,
-1.666511, -1.170218, -1.714453, 1, 0.3372549, 0, 1,
-1.666486, 0.5811217, -1.597416, 1, 0.3411765, 0, 1,
-1.656092, -0.6196195, -1.607266, 1, 0.3490196, 0, 1,
-1.654648, -1.216692, -1.247361, 1, 0.3529412, 0, 1,
-1.651585, 1.096311, -0.0392102, 1, 0.3607843, 0, 1,
-1.639326, -0.5556148, -1.58479, 1, 0.3647059, 0, 1,
-1.636668, 0.2408993, -2.557004, 1, 0.372549, 0, 1,
-1.635701, -0.4363282, 0.2656122, 1, 0.3764706, 0, 1,
-1.634708, -0.2647308, -0.7021208, 1, 0.3843137, 0, 1,
-1.619132, 0.2635439, -1.201884, 1, 0.3882353, 0, 1,
-1.618014, 2.17366, -0.8601996, 1, 0.3960784, 0, 1,
-1.607802, 2.618802, -1.458312, 1, 0.4039216, 0, 1,
-1.595439, 0.795306, -1.592532, 1, 0.4078431, 0, 1,
-1.592085, -0.8386557, -4.063458, 1, 0.4156863, 0, 1,
-1.589053, 0.2736605, -1.869172, 1, 0.4196078, 0, 1,
-1.569024, -1.480408, -2.469465, 1, 0.427451, 0, 1,
-1.566536, -0.1361023, -2.271667, 1, 0.4313726, 0, 1,
-1.565087, 1.31524, -2.342496, 1, 0.4392157, 0, 1,
-1.554136, -0.3003388, -2.65262, 1, 0.4431373, 0, 1,
-1.543277, -1.00651, -1.449979, 1, 0.4509804, 0, 1,
-1.539902, -0.6649165, -0.1814289, 1, 0.454902, 0, 1,
-1.529381, 0.4516182, -2.753241, 1, 0.4627451, 0, 1,
-1.527147, 1.383408, -0.3511254, 1, 0.4666667, 0, 1,
-1.516896, -1.080428, -1.48609, 1, 0.4745098, 0, 1,
-1.500526, 0.4381559, -2.395608, 1, 0.4784314, 0, 1,
-1.487911, 0.4393673, -2.969074, 1, 0.4862745, 0, 1,
-1.485358, -2.261028, -1.708619, 1, 0.4901961, 0, 1,
-1.48216, -0.2738289, -3.758722, 1, 0.4980392, 0, 1,
-1.481835, 0.1619444, -2.424864, 1, 0.5058824, 0, 1,
-1.46667, -0.7070183, -3.264386, 1, 0.509804, 0, 1,
-1.462143, -1.8128, -2.369199, 1, 0.5176471, 0, 1,
-1.458401, 0.9106407, -1.611638, 1, 0.5215687, 0, 1,
-1.456828, 1.315363, 0.2228948, 1, 0.5294118, 0, 1,
-1.453766, 0.07599702, -1.901713, 1, 0.5333334, 0, 1,
-1.452871, 0.8902071, -0.2838456, 1, 0.5411765, 0, 1,
-1.436182, 0.3211114, -0.6006337, 1, 0.5450981, 0, 1,
-1.408594, -1.34961, -1.363822, 1, 0.5529412, 0, 1,
-1.408394, -0.2568316, -0.6481662, 1, 0.5568628, 0, 1,
-1.406418, -0.420058, -1.506235, 1, 0.5647059, 0, 1,
-1.405464, -1.845941, -3.38827, 1, 0.5686275, 0, 1,
-1.399866, -0.708241, 0.2036822, 1, 0.5764706, 0, 1,
-1.39052, -1.223364, -3.318801, 1, 0.5803922, 0, 1,
-1.380344, -0.2698944, -2.484665, 1, 0.5882353, 0, 1,
-1.367725, -0.4202349, -3.844862, 1, 0.5921569, 0, 1,
-1.357123, 0.9368342, -1.022923, 1, 0.6, 0, 1,
-1.349272, -0.7163941, -2.818598, 1, 0.6078432, 0, 1,
-1.347391, 0.02639055, -0.8933149, 1, 0.6117647, 0, 1,
-1.341812, 0.2737499, -2.56716, 1, 0.6196079, 0, 1,
-1.328452, 0.9102116, -1.505218, 1, 0.6235294, 0, 1,
-1.314491, -0.9669077, -1.975078, 1, 0.6313726, 0, 1,
-1.31298, -1.217219, -1.781662, 1, 0.6352941, 0, 1,
-1.311526, -2.246158, -1.515296, 1, 0.6431373, 0, 1,
-1.291356, -1.229978, -2.85991, 1, 0.6470588, 0, 1,
-1.290491, 0.3682669, -0.599205, 1, 0.654902, 0, 1,
-1.286555, 1.553333, -0.5223119, 1, 0.6588235, 0, 1,
-1.275449, -0.7497182, -1.610214, 1, 0.6666667, 0, 1,
-1.275002, 0.3137051, -0.758234, 1, 0.6705883, 0, 1,
-1.27423, -0.116535, -2.367159, 1, 0.6784314, 0, 1,
-1.271387, -0.03344581, -1.294047, 1, 0.682353, 0, 1,
-1.258639, 1.016021, -1.083278, 1, 0.6901961, 0, 1,
-1.258543, 0.1589907, -2.856904, 1, 0.6941177, 0, 1,
-1.256996, 1.061181, -0.9952195, 1, 0.7019608, 0, 1,
-1.254221, 0.6216505, -0.1706345, 1, 0.7098039, 0, 1,
-1.237935, 0.2272783, -0.7221755, 1, 0.7137255, 0, 1,
-1.235899, 0.470313, -0.2292818, 1, 0.7215686, 0, 1,
-1.228836, 0.3241695, -0.6262393, 1, 0.7254902, 0, 1,
-1.22594, -1.407711, -1.816116, 1, 0.7333333, 0, 1,
-1.224205, 0.5159817, -0.2187131, 1, 0.7372549, 0, 1,
-1.222106, 0.8644677, 1.80013, 1, 0.7450981, 0, 1,
-1.212326, 0.3457414, -1.074807, 1, 0.7490196, 0, 1,
-1.206544, 1.112048, -0.7458264, 1, 0.7568628, 0, 1,
-1.19363, 0.4932325, -0.1352926, 1, 0.7607843, 0, 1,
-1.179124, 0.5447321, -2.304904, 1, 0.7686275, 0, 1,
-1.175584, -0.7890579, -1.612058, 1, 0.772549, 0, 1,
-1.173515, -1.490907, -2.693804, 1, 0.7803922, 0, 1,
-1.164676, -1.64675, -1.3966, 1, 0.7843137, 0, 1,
-1.163342, -1.608652, -1.065747, 1, 0.7921569, 0, 1,
-1.155469, -1.093091, -1.072011, 1, 0.7960784, 0, 1,
-1.154107, -1.910899, -2.679342, 1, 0.8039216, 0, 1,
-1.14465, -0.341057, -1.826309, 1, 0.8117647, 0, 1,
-1.141733, 0.339231, -1.017588, 1, 0.8156863, 0, 1,
-1.133831, -0.7159458, -2.562486, 1, 0.8235294, 0, 1,
-1.132857, -0.8813727, -2.062769, 1, 0.827451, 0, 1,
-1.129987, 1.499635, 0.03115739, 1, 0.8352941, 0, 1,
-1.127975, -2.042136, -3.986603, 1, 0.8392157, 0, 1,
-1.121373, 0.0567309, -1.232299, 1, 0.8470588, 0, 1,
-1.119216, 1.531359, -0.3091224, 1, 0.8509804, 0, 1,
-1.110718, -0.5335548, -2.345351, 1, 0.8588235, 0, 1,
-1.10998, 0.5097049, 0.4981909, 1, 0.8627451, 0, 1,
-1.10959, -1.385503, -3.703194, 1, 0.8705882, 0, 1,
-1.100826, -0.1862879, -1.648402, 1, 0.8745098, 0, 1,
-1.100368, 0.5923362, 0.09413191, 1, 0.8823529, 0, 1,
-1.096491, 1.747469, 0.3442351, 1, 0.8862745, 0, 1,
-1.093398, 1.258824, 0.4648125, 1, 0.8941177, 0, 1,
-1.089429, 2.226636, -1.712425, 1, 0.8980392, 0, 1,
-1.088723, -1.288613, -2.487875, 1, 0.9058824, 0, 1,
-1.087643, 1.287251, -0.6659729, 1, 0.9137255, 0, 1,
-1.074996, -0.3852146, -1.077235, 1, 0.9176471, 0, 1,
-1.06901, 0.2377515, -2.072975, 1, 0.9254902, 0, 1,
-1.067565, 0.206637, -0.4145429, 1, 0.9294118, 0, 1,
-1.050727, 1.457518, 1.596301, 1, 0.9372549, 0, 1,
-1.050704, -0.2521542, -0.7779153, 1, 0.9411765, 0, 1,
-1.050681, -0.6731229, -3.422818, 1, 0.9490196, 0, 1,
-1.046304, 0.1275756, -0.8580183, 1, 0.9529412, 0, 1,
-1.04579, 0.450213, -1.522508, 1, 0.9607843, 0, 1,
-1.039612, 0.3125688, -2.019207, 1, 0.9647059, 0, 1,
-1.038961, -0.9685644, -2.816658, 1, 0.972549, 0, 1,
-1.038579, 1.465232, -0.3931427, 1, 0.9764706, 0, 1,
-1.03741, 0.7881738, 0.2739794, 1, 0.9843137, 0, 1,
-1.033548, 1.024409, -0.2925886, 1, 0.9882353, 0, 1,
-1.031336, -1.684414, -4.767489, 1, 0.9960784, 0, 1,
-1.027185, -1.088196, -1.831168, 0.9960784, 1, 0, 1,
-1.023771, 0.8333302, 0.6043319, 0.9921569, 1, 0, 1,
-1.005135, 0.5888609, -1.877332, 0.9843137, 1, 0, 1,
-1.003873, -0.5554295, -1.932063, 0.9803922, 1, 0, 1,
-1.003562, -0.8516772, -3.305634, 0.972549, 1, 0, 1,
-1.003244, 0.6675869, -1.598216, 0.9686275, 1, 0, 1,
-0.9997623, -0.940409, 0.002973028, 0.9607843, 1, 0, 1,
-0.9985375, -0.5843241, -1.986095, 0.9568627, 1, 0, 1,
-0.9963012, -0.2614101, -0.05900301, 0.9490196, 1, 0, 1,
-0.9955078, -0.4797555, -1.007036, 0.945098, 1, 0, 1,
-0.9947558, -2.436826, -0.7453494, 0.9372549, 1, 0, 1,
-0.9873113, -0.157653, -1.413273, 0.9333333, 1, 0, 1,
-0.9862486, -0.133495, -2.608017, 0.9254902, 1, 0, 1,
-0.9843816, 0.1327554, 0.6520711, 0.9215686, 1, 0, 1,
-0.9839485, -1.364659, -2.392636, 0.9137255, 1, 0, 1,
-0.9758335, -0.8841676, -1.165251, 0.9098039, 1, 0, 1,
-0.9752812, -0.2180253, -1.408496, 0.9019608, 1, 0, 1,
-0.9733659, -1.543779, -1.681853, 0.8941177, 1, 0, 1,
-0.960844, 0.3343543, -0.7243494, 0.8901961, 1, 0, 1,
-0.9603178, -0.8299004, -2.622317, 0.8823529, 1, 0, 1,
-0.9586071, 0.9443096, -1.690489, 0.8784314, 1, 0, 1,
-0.9410759, 1.808948, -1.271971, 0.8705882, 1, 0, 1,
-0.9392953, 0.5890234, -1.519112, 0.8666667, 1, 0, 1,
-0.9257466, -0.4122586, -1.63351, 0.8588235, 1, 0, 1,
-0.9188793, 1.288971, -0.08526494, 0.854902, 1, 0, 1,
-0.9111421, 0.2909136, -1.173755, 0.8470588, 1, 0, 1,
-0.9103293, -1.517639, -2.841259, 0.8431373, 1, 0, 1,
-0.9073272, -0.3151621, -3.250843, 0.8352941, 1, 0, 1,
-0.9037106, 1.182778, 0.08537313, 0.8313726, 1, 0, 1,
-0.9032258, -1.656214, -3.099476, 0.8235294, 1, 0, 1,
-0.9022929, -0.7109815, -1.65231, 0.8196079, 1, 0, 1,
-0.9020641, 0.05748023, -1.913683, 0.8117647, 1, 0, 1,
-0.8978298, -1.365057, -1.781183, 0.8078431, 1, 0, 1,
-0.8959503, -0.6101891, -1.458003, 0.8, 1, 0, 1,
-0.8795952, 1.07961, 0.4576987, 0.7921569, 1, 0, 1,
-0.8724242, 0.4731608, -0.5695072, 0.7882353, 1, 0, 1,
-0.8653011, -1.855816, -1.514993, 0.7803922, 1, 0, 1,
-0.8590403, -0.9449443, -2.379227, 0.7764706, 1, 0, 1,
-0.8566585, 0.4706723, -1.986775, 0.7686275, 1, 0, 1,
-0.8512262, -1.843194, -1.083961, 0.7647059, 1, 0, 1,
-0.8504895, -1.270923, -2.678763, 0.7568628, 1, 0, 1,
-0.8419635, 0.5776906, -1.216589, 0.7529412, 1, 0, 1,
-0.832377, 1.688262, 0.01287014, 0.7450981, 1, 0, 1,
-0.8246681, 0.188634, -2.225629, 0.7411765, 1, 0, 1,
-0.8196906, 0.8030073, -0.3101242, 0.7333333, 1, 0, 1,
-0.8181751, -1.041059, -2.489479, 0.7294118, 1, 0, 1,
-0.8147144, 1.097342, -1.732661, 0.7215686, 1, 0, 1,
-0.8082151, -0.43159, -3.721209, 0.7176471, 1, 0, 1,
-0.7996841, -1.242615, -0.8483629, 0.7098039, 1, 0, 1,
-0.7956092, 0.9502162, -0.5748718, 0.7058824, 1, 0, 1,
-0.790877, -0.2083715, -2.215152, 0.6980392, 1, 0, 1,
-0.7803855, 0.2684903, -0.7228653, 0.6901961, 1, 0, 1,
-0.7788228, 0.1132858, 0.9206983, 0.6862745, 1, 0, 1,
-0.7743864, -0.05331256, -1.648164, 0.6784314, 1, 0, 1,
-0.7672078, 1.788629, -0.8658575, 0.6745098, 1, 0, 1,
-0.7554943, -1.678375, -4.690088, 0.6666667, 1, 0, 1,
-0.7544556, -0.1113787, -1.902336, 0.6627451, 1, 0, 1,
-0.749423, -1.56094, -2.806531, 0.654902, 1, 0, 1,
-0.7471135, -0.7225697, -2.217707, 0.6509804, 1, 0, 1,
-0.7464173, 1.454044, 0.1022833, 0.6431373, 1, 0, 1,
-0.7458866, 0.1707902, -0.9117162, 0.6392157, 1, 0, 1,
-0.7397383, -0.6645438, -0.8746334, 0.6313726, 1, 0, 1,
-0.7345133, -1.691807, -3.362756, 0.627451, 1, 0, 1,
-0.7290392, -1.075086, -3.276419, 0.6196079, 1, 0, 1,
-0.7179421, -0.4876924, -1.815623, 0.6156863, 1, 0, 1,
-0.7125714, 0.7954564, -0.5798101, 0.6078432, 1, 0, 1,
-0.7094822, 0.6434675, -2.033213, 0.6039216, 1, 0, 1,
-0.7082728, -1.208312, -3.836287, 0.5960785, 1, 0, 1,
-0.7073144, -0.04415903, -3.930532, 0.5882353, 1, 0, 1,
-0.7052624, -0.1206598, -1.315596, 0.5843138, 1, 0, 1,
-0.7028049, 0.5197868, -1.814737, 0.5764706, 1, 0, 1,
-0.7024376, 0.1948489, -0.749538, 0.572549, 1, 0, 1,
-0.7024152, -0.3574115, -0.9325254, 0.5647059, 1, 0, 1,
-0.6894443, 0.02122913, -2.945847, 0.5607843, 1, 0, 1,
-0.6884851, -0.2104402, -1.771186, 0.5529412, 1, 0, 1,
-0.6823261, -1.323257, -2.040143, 0.5490196, 1, 0, 1,
-0.6819378, -1.054765, -2.587074, 0.5411765, 1, 0, 1,
-0.6759412, -0.9276724, -2.140314, 0.5372549, 1, 0, 1,
-0.6743249, 0.5216909, -3.237848, 0.5294118, 1, 0, 1,
-0.6737882, -0.8130332, -2.801247, 0.5254902, 1, 0, 1,
-0.6702839, 1.195314, -0.975904, 0.5176471, 1, 0, 1,
-0.6639045, -0.1531907, -2.275308, 0.5137255, 1, 0, 1,
-0.6622174, -1.092143, -3.518642, 0.5058824, 1, 0, 1,
-0.6605368, 0.707805, 0.3078436, 0.5019608, 1, 0, 1,
-0.6600413, -1.849283, -4.025702, 0.4941176, 1, 0, 1,
-0.6560833, 2.227416, 0.9324548, 0.4862745, 1, 0, 1,
-0.649515, -0.7188135, -2.625992, 0.4823529, 1, 0, 1,
-0.6489159, 1.923772, -0.1026373, 0.4745098, 1, 0, 1,
-0.6487417, 2.108342, -0.01099894, 0.4705882, 1, 0, 1,
-0.6452956, -0.1151913, -1.626262, 0.4627451, 1, 0, 1,
-0.6403589, -0.4221714, -2.217208, 0.4588235, 1, 0, 1,
-0.6336983, 1.607712, 2.208344, 0.4509804, 1, 0, 1,
-0.6263884, 1.875078, 0.638782, 0.4470588, 1, 0, 1,
-0.62568, 1.422211, 0.3098555, 0.4392157, 1, 0, 1,
-0.6256613, -0.3917912, -1.758492, 0.4352941, 1, 0, 1,
-0.6200933, -0.0464883, -1.604462, 0.427451, 1, 0, 1,
-0.6191258, 0.15025, -0.8227211, 0.4235294, 1, 0, 1,
-0.6182094, -0.3654366, -3.130688, 0.4156863, 1, 0, 1,
-0.6143727, -1.271375, -2.356322, 0.4117647, 1, 0, 1,
-0.61299, -0.5506598, -2.766242, 0.4039216, 1, 0, 1,
-0.6125212, -0.2983495, -1.586476, 0.3960784, 1, 0, 1,
-0.6028785, 0.01638634, -1.530715, 0.3921569, 1, 0, 1,
-0.5997764, -0.893853, -2.79455, 0.3843137, 1, 0, 1,
-0.5972103, -1.461706, -2.018017, 0.3803922, 1, 0, 1,
-0.592317, 0.1002408, -1.719937, 0.372549, 1, 0, 1,
-0.5904653, 1.083751, -0.4244179, 0.3686275, 1, 0, 1,
-0.5890718, 0.8582741, -0.4210004, 0.3607843, 1, 0, 1,
-0.588963, -0.2614484, -3.307716, 0.3568628, 1, 0, 1,
-0.5881635, 0.3840768, -0.1381925, 0.3490196, 1, 0, 1,
-0.5878975, 0.001786604, -1.839826, 0.345098, 1, 0, 1,
-0.5861379, -1.215936, -2.112314, 0.3372549, 1, 0, 1,
-0.5858661, 1.281435, -1.274953, 0.3333333, 1, 0, 1,
-0.5809952, -0.8905476, -1.677385, 0.3254902, 1, 0, 1,
-0.5765808, 0.6044239, -0.5484365, 0.3215686, 1, 0, 1,
-0.5727732, -0.499848, -2.859476, 0.3137255, 1, 0, 1,
-0.5648656, -1.20676, -1.482142, 0.3098039, 1, 0, 1,
-0.5618659, -1.068774, -2.560238, 0.3019608, 1, 0, 1,
-0.5595812, -0.930185, -2.230886, 0.2941177, 1, 0, 1,
-0.5593871, -0.170403, -0.7983167, 0.2901961, 1, 0, 1,
-0.558037, 1.344773, 1.299598, 0.282353, 1, 0, 1,
-0.5525313, 9.67919e-05, -1.299171, 0.2784314, 1, 0, 1,
-0.5513002, -0.8516501, -2.150445, 0.2705882, 1, 0, 1,
-0.5505957, -0.2425264, -0.4884135, 0.2666667, 1, 0, 1,
-0.5469986, -0.6590132, -3.229136, 0.2588235, 1, 0, 1,
-0.5469904, -0.7926974, -1.365987, 0.254902, 1, 0, 1,
-0.5467803, -0.8084049, -1.891483, 0.2470588, 1, 0, 1,
-0.5458229, -0.7074178, -3.639883, 0.2431373, 1, 0, 1,
-0.5442654, 1.600489, -1.112952, 0.2352941, 1, 0, 1,
-0.543625, 0.8499394, -2.34978, 0.2313726, 1, 0, 1,
-0.5258124, 2.030715, -1.725069, 0.2235294, 1, 0, 1,
-0.5236323, 1.316402, 0.8577269, 0.2196078, 1, 0, 1,
-0.5223751, -1.687564, -3.509526, 0.2117647, 1, 0, 1,
-0.5202551, -0.5004071, -2.281999, 0.2078431, 1, 0, 1,
-0.5142452, -0.542699, -2.399639, 0.2, 1, 0, 1,
-0.5138525, -1.235718, -2.226133, 0.1921569, 1, 0, 1,
-0.5126691, -0.1787601, -0.8565671, 0.1882353, 1, 0, 1,
-0.510914, -0.8613415, -1.5705, 0.1803922, 1, 0, 1,
-0.5040649, 0.45201, -0.9211413, 0.1764706, 1, 0, 1,
-0.495957, 0.98492, -1.031864, 0.1686275, 1, 0, 1,
-0.4911067, -1.769746, -4.167503, 0.1647059, 1, 0, 1,
-0.4907149, 0.07673343, -1.358672, 0.1568628, 1, 0, 1,
-0.4905817, -0.4282409, -2.109596, 0.1529412, 1, 0, 1,
-0.489339, 1.462629, -1.145032, 0.145098, 1, 0, 1,
-0.4890046, 0.6684648, -0.4372773, 0.1411765, 1, 0, 1,
-0.48716, -0.3643733, -2.601914, 0.1333333, 1, 0, 1,
-0.4799792, 1.041741, -0.9805558, 0.1294118, 1, 0, 1,
-0.479109, 1.7992, 2.355705, 0.1215686, 1, 0, 1,
-0.4778445, 0.6949595, -0.4509175, 0.1176471, 1, 0, 1,
-0.4777891, -0.2691815, -1.353243, 0.1098039, 1, 0, 1,
-0.4771761, -0.146137, -0.7927901, 0.1058824, 1, 0, 1,
-0.4763611, -0.09180064, -1.298597, 0.09803922, 1, 0, 1,
-0.4743739, -0.491264, -1.045448, 0.09019608, 1, 0, 1,
-0.4727215, 1.604937, -1.139474, 0.08627451, 1, 0, 1,
-0.4711235, 0.01083797, -0.4810635, 0.07843138, 1, 0, 1,
-0.4703132, -0.3837179, -4.377524, 0.07450981, 1, 0, 1,
-0.4696525, 0.2962957, -2.885643, 0.06666667, 1, 0, 1,
-0.4670939, 0.5963475, -0.09475339, 0.0627451, 1, 0, 1,
-0.464501, 1.136553, -0.2988773, 0.05490196, 1, 0, 1,
-0.4644788, 1.073405, -0.3934059, 0.05098039, 1, 0, 1,
-0.462711, 2.317447, -1.254604, 0.04313726, 1, 0, 1,
-0.4615011, -0.005410657, -1.285608, 0.03921569, 1, 0, 1,
-0.4607674, 1.434632, 0.09762438, 0.03137255, 1, 0, 1,
-0.4601412, 2.882061, -1.290602, 0.02745098, 1, 0, 1,
-0.4592419, 1.030049, 0.4110778, 0.01960784, 1, 0, 1,
-0.4575804, -0.1138978, -3.83219, 0.01568628, 1, 0, 1,
-0.4470355, -1.487081, -3.701315, 0.007843138, 1, 0, 1,
-0.4411507, 1.746673, -0.7655759, 0.003921569, 1, 0, 1,
-0.4386573, -1.785064, -3.834291, 0, 1, 0.003921569, 1,
-0.4368961, -0.7829716, -3.689434, 0, 1, 0.01176471, 1,
-0.436608, 0.9395381, 0.08137714, 0, 1, 0.01568628, 1,
-0.4362147, -0.4300587, -3.429211, 0, 1, 0.02352941, 1,
-0.4280522, 0.1399475, -2.048555, 0, 1, 0.02745098, 1,
-0.4270879, 1.323936, -1.492991, 0, 1, 0.03529412, 1,
-0.4255406, -1.137548, -4.085569, 0, 1, 0.03921569, 1,
-0.4236202, 1.11901, 1.101733, 0, 1, 0.04705882, 1,
-0.4232497, 0.7778814, -1.247359, 0, 1, 0.05098039, 1,
-0.4215432, 1.596837, -0.03204202, 0, 1, 0.05882353, 1,
-0.4202233, -1.050501, -4.818324, 0, 1, 0.0627451, 1,
-0.4188852, 0.003127107, -0.7592598, 0, 1, 0.07058824, 1,
-0.4136764, -0.8941841, -1.486409, 0, 1, 0.07450981, 1,
-0.410818, 1.02693, -1.99674, 0, 1, 0.08235294, 1,
-0.4084678, 0.1972448, -2.365664, 0, 1, 0.08627451, 1,
-0.404078, -0.8942475, -2.823918, 0, 1, 0.09411765, 1,
-0.3860599, -0.7636959, -2.907271, 0, 1, 0.1019608, 1,
-0.3846442, 0.04287421, -2.883717, 0, 1, 0.1058824, 1,
-0.3829463, -0.9751163, -1.752323, 0, 1, 0.1137255, 1,
-0.3828272, -1.101672, -2.41852, 0, 1, 0.1176471, 1,
-0.3818834, -0.3039218, -2.951162, 0, 1, 0.1254902, 1,
-0.380766, -1.141797, -5.006368, 0, 1, 0.1294118, 1,
-0.3778338, -0.1205118, -1.716199, 0, 1, 0.1372549, 1,
-0.3719997, -2.878645, -4.495842, 0, 1, 0.1411765, 1,
-0.3712154, -0.6240838, -2.728431, 0, 1, 0.1490196, 1,
-0.3672608, 0.3973825, 0.3828422, 0, 1, 0.1529412, 1,
-0.364415, -0.7836934, -2.267364, 0, 1, 0.1607843, 1,
-0.3639928, 0.3115918, -1.171197, 0, 1, 0.1647059, 1,
-0.3582083, 0.08789338, -1.940464, 0, 1, 0.172549, 1,
-0.3547672, 1.900289, -0.4083241, 0, 1, 0.1764706, 1,
-0.3526117, 1.02257, -1.093192, 0, 1, 0.1843137, 1,
-0.3498548, -1.472418, -1.444456, 0, 1, 0.1882353, 1,
-0.3496405, -0.2539812, -3.020543, 0, 1, 0.1960784, 1,
-0.3464162, 0.6389217, 0.3379044, 0, 1, 0.2039216, 1,
-0.3459122, 0.636649, -0.8374395, 0, 1, 0.2078431, 1,
-0.3455383, -0.2586119, -1.428582, 0, 1, 0.2156863, 1,
-0.3452647, -0.6963162, -3.156894, 0, 1, 0.2196078, 1,
-0.3410616, 0.5312259, -0.3623899, 0, 1, 0.227451, 1,
-0.3409865, 0.1605295, 1.200995, 0, 1, 0.2313726, 1,
-0.3401899, 1.310618, -0.6966809, 0, 1, 0.2392157, 1,
-0.3385421, 0.8897147, 0.5574905, 0, 1, 0.2431373, 1,
-0.3325462, -1.192912, -2.87299, 0, 1, 0.2509804, 1,
-0.3301248, 1.822078, 0.1013522, 0, 1, 0.254902, 1,
-0.3287374, 2.37995, -0.8429285, 0, 1, 0.2627451, 1,
-0.3275148, -0.04312286, -2.968289, 0, 1, 0.2666667, 1,
-0.3213434, 0.2094664, -1.704818, 0, 1, 0.2745098, 1,
-0.3206891, -0.5545248, -1.216965, 0, 1, 0.2784314, 1,
-0.3188968, 0.4349679, -0.4176121, 0, 1, 0.2862745, 1,
-0.317738, -0.2593728, -4.174576, 0, 1, 0.2901961, 1,
-0.3168413, -0.8987352, -3.203222, 0, 1, 0.2980392, 1,
-0.3166184, 0.05614858, -0.2785041, 0, 1, 0.3058824, 1,
-0.3161091, -1.808475, -3.682682, 0, 1, 0.3098039, 1,
-0.311418, 0.07856589, 0.4724312, 0, 1, 0.3176471, 1,
-0.3109708, 0.6713828, 0.2032347, 0, 1, 0.3215686, 1,
-0.310563, 1.067852, 0.9048301, 0, 1, 0.3294118, 1,
-0.3094112, 0.3138367, -0.383173, 0, 1, 0.3333333, 1,
-0.3027783, 1.164668, -0.5110514, 0, 1, 0.3411765, 1,
-0.3005596, -0.55026, -4.705797, 0, 1, 0.345098, 1,
-0.2974552, -0.6257381, -2.263084, 0, 1, 0.3529412, 1,
-0.2926062, 0.04458427, -2.363372, 0, 1, 0.3568628, 1,
-0.2862146, 1.085973, -0.3804085, 0, 1, 0.3647059, 1,
-0.2829137, -1.235943, -1.983622, 0, 1, 0.3686275, 1,
-0.2777064, 0.4985524, 1.062155, 0, 1, 0.3764706, 1,
-0.2762518, 0.5939541, -0.6318313, 0, 1, 0.3803922, 1,
-0.2740266, -0.5318168, -4.284977, 0, 1, 0.3882353, 1,
-0.2724275, -0.6105554, -2.94385, 0, 1, 0.3921569, 1,
-0.2692775, -0.427345, -2.166042, 0, 1, 0.4, 1,
-0.2691523, -1.479454, -1.628976, 0, 1, 0.4078431, 1,
-0.2688346, -0.2528657, -0.5150387, 0, 1, 0.4117647, 1,
-0.2582971, -0.3620268, -4.210044, 0, 1, 0.4196078, 1,
-0.2570492, 2.593742, 0.3724486, 0, 1, 0.4235294, 1,
-0.2560619, 0.7871733, -1.78246, 0, 1, 0.4313726, 1,
-0.255795, 2.181128, 1.565915, 0, 1, 0.4352941, 1,
-0.2524997, -0.3150029, -1.586967, 0, 1, 0.4431373, 1,
-0.2495533, 0.2123445, -0.702333, 0, 1, 0.4470588, 1,
-0.2470047, -0.3795999, -2.958694, 0, 1, 0.454902, 1,
-0.2397939, -1.448195, -2.362392, 0, 1, 0.4588235, 1,
-0.2374863, 0.8527176, -0.8098564, 0, 1, 0.4666667, 1,
-0.2332821, 1.301679, 0.8782467, 0, 1, 0.4705882, 1,
-0.2320781, 0.09292654, -2.093318, 0, 1, 0.4784314, 1,
-0.2307444, -0.7495847, -3.388584, 0, 1, 0.4823529, 1,
-0.2305519, 0.7184668, 2.272672, 0, 1, 0.4901961, 1,
-0.2276191, -1.555463, -6.174366, 0, 1, 0.4941176, 1,
-0.2266422, -0.2549142, -1.428728, 0, 1, 0.5019608, 1,
-0.2176632, 0.1036124, -1.660747, 0, 1, 0.509804, 1,
-0.2161927, 0.1538028, -1.887125, 0, 1, 0.5137255, 1,
-0.2140227, -1.412418, -2.965304, 0, 1, 0.5215687, 1,
-0.2112379, 0.3422725, -0.883823, 0, 1, 0.5254902, 1,
-0.2073826, 0.8547135, 1.981075, 0, 1, 0.5333334, 1,
-0.2023131, 0.6603249, -0.9692564, 0, 1, 0.5372549, 1,
-0.1979732, 1.234225, -1.743562, 0, 1, 0.5450981, 1,
-0.1964729, -0.5904089, -1.044605, 0, 1, 0.5490196, 1,
-0.1922936, -0.02017431, -3.568249, 0, 1, 0.5568628, 1,
-0.1887024, -1.620394, -3.964328, 0, 1, 0.5607843, 1,
-0.1881942, 1.040986, -0.9629267, 0, 1, 0.5686275, 1,
-0.1842193, 0.2945729, -1.518192, 0, 1, 0.572549, 1,
-0.1813686, 1.375632, 0.464646, 0, 1, 0.5803922, 1,
-0.1770274, -0.4174997, -4.393777, 0, 1, 0.5843138, 1,
-0.1769673, -1.846277, -3.999409, 0, 1, 0.5921569, 1,
-0.1768456, 0.7614354, -1.449238, 0, 1, 0.5960785, 1,
-0.1728695, 0.04913718, -2.364803, 0, 1, 0.6039216, 1,
-0.1705145, 2.217527, -1.673916, 0, 1, 0.6117647, 1,
-0.1638718, 0.05488165, -1.849185, 0, 1, 0.6156863, 1,
-0.1621932, -1.024498, -4.129748, 0, 1, 0.6235294, 1,
-0.1620057, -1.38438, -3.234356, 0, 1, 0.627451, 1,
-0.1572671, -0.3263165, -2.372041, 0, 1, 0.6352941, 1,
-0.1568297, 0.6867108, -0.439916, 0, 1, 0.6392157, 1,
-0.1541377, 0.4252442, -0.9571961, 0, 1, 0.6470588, 1,
-0.1494824, -1.775517, -3.267915, 0, 1, 0.6509804, 1,
-0.1459977, 0.1255855, -0.3018283, 0, 1, 0.6588235, 1,
-0.1454132, -0.3831247, -4.218241, 0, 1, 0.6627451, 1,
-0.1452737, 1.531896, 1.578896, 0, 1, 0.6705883, 1,
-0.1433196, 0.4979267, -1.661127, 0, 1, 0.6745098, 1,
-0.1400628, -0.5484354, -5.325221, 0, 1, 0.682353, 1,
-0.1360707, 0.6794571, -2.222001, 0, 1, 0.6862745, 1,
-0.1334899, 0.3855094, 0.1999778, 0, 1, 0.6941177, 1,
-0.130983, -0.8928022, -3.255262, 0, 1, 0.7019608, 1,
-0.1290392, -1.376853, -2.188402, 0, 1, 0.7058824, 1,
-0.1248512, -1.063803, -3.741433, 0, 1, 0.7137255, 1,
-0.1239102, 0.8655801, 1.328072, 0, 1, 0.7176471, 1,
-0.1212298, 0.6756608, 0.3267394, 0, 1, 0.7254902, 1,
-0.120641, -1.286132, -2.59647, 0, 1, 0.7294118, 1,
-0.1183026, 0.1136368, -0.6350734, 0, 1, 0.7372549, 1,
-0.1144266, -0.2905779, -4.133801, 0, 1, 0.7411765, 1,
-0.1132881, -1.376142, -3.430667, 0, 1, 0.7490196, 1,
-0.1119864, -0.07868897, -2.728784, 0, 1, 0.7529412, 1,
-0.1097412, -2.445529, -3.130129, 0, 1, 0.7607843, 1,
-0.1089071, -1.415586, -1.752377, 0, 1, 0.7647059, 1,
-0.1065148, 1.640539, 0.3035994, 0, 1, 0.772549, 1,
-0.1044091, 0.819196, 1.203083, 0, 1, 0.7764706, 1,
-0.09984888, 2.306958, 2.290857, 0, 1, 0.7843137, 1,
-0.09539339, 2.63235, -0.06270795, 0, 1, 0.7882353, 1,
-0.09290212, 1.11143, -1.094533, 0, 1, 0.7960784, 1,
-0.09212133, 1.255277, -1.066836, 0, 1, 0.8039216, 1,
-0.09075172, -1.18179, -2.378717, 0, 1, 0.8078431, 1,
-0.09063926, -0.3282878, -3.937208, 0, 1, 0.8156863, 1,
-0.0887226, 1.152376, 0.6486061, 0, 1, 0.8196079, 1,
-0.07399265, -0.6335135, -4.397325, 0, 1, 0.827451, 1,
-0.07377134, -0.5275639, -1.360896, 0, 1, 0.8313726, 1,
-0.07204736, 0.2149364, -2.711652, 0, 1, 0.8392157, 1,
-0.06924286, -0.4834055, -2.719936, 0, 1, 0.8431373, 1,
-0.06757299, 1.420403, -2.56529, 0, 1, 0.8509804, 1,
-0.06622245, -1.241152, -2.795177, 0, 1, 0.854902, 1,
-0.06450347, 0.6825398, 0.1313344, 0, 1, 0.8627451, 1,
-0.05413889, 0.5092043, 0.6464442, 0, 1, 0.8666667, 1,
-0.05121817, 0.3838883, 0.3895905, 0, 1, 0.8745098, 1,
-0.04289393, 0.03607048, -1.844665, 0, 1, 0.8784314, 1,
-0.04275857, 0.4978333, -1.37171, 0, 1, 0.8862745, 1,
-0.04058428, 0.6618162, -0.9669825, 0, 1, 0.8901961, 1,
-0.03670862, -2.218967, -3.720758, 0, 1, 0.8980392, 1,
-0.03607854, 0.1270118, 0.1688874, 0, 1, 0.9058824, 1,
-0.03439746, 0.1424046, -0.329912, 0, 1, 0.9098039, 1,
-0.03394833, -1.498034, -3.658098, 0, 1, 0.9176471, 1,
-0.02971253, 0.453231, 0.02347841, 0, 1, 0.9215686, 1,
-0.02876624, -0.2240202, -1.338645, 0, 1, 0.9294118, 1,
-0.02845983, -1.484545, -3.29296, 0, 1, 0.9333333, 1,
-0.01917852, 1.059107, 0.6981339, 0, 1, 0.9411765, 1,
-0.01508147, 0.0777829, -1.39096, 0, 1, 0.945098, 1,
-0.01131945, 0.7117195, 0.4104349, 0, 1, 0.9529412, 1,
-0.008939325, 1.152257, 0.7342823, 0, 1, 0.9568627, 1,
0.0008037752, 1.710487, 0.09724747, 0, 1, 0.9647059, 1,
0.005019919, 2.328981, 0.697576, 0, 1, 0.9686275, 1,
0.005043516, -0.1455922, 4.236103, 0, 1, 0.9764706, 1,
0.006437743, -1.134487, 4.779087, 0, 1, 0.9803922, 1,
0.00649997, -0.07387879, 3.052257, 0, 1, 0.9882353, 1,
0.007509473, 2.37496, 0.0271805, 0, 1, 0.9921569, 1,
0.01041754, -0.6333761, 2.53093, 0, 1, 1, 1,
0.01070128, -0.7900771, 3.39108, 0, 0.9921569, 1, 1,
0.01506915, -0.8104443, 3.025477, 0, 0.9882353, 1, 1,
0.02474353, 1.172174, -0.4896276, 0, 0.9803922, 1, 1,
0.02818329, 0.433713, 0.2726565, 0, 0.9764706, 1, 1,
0.02962135, -0.9850334, 3.585318, 0, 0.9686275, 1, 1,
0.03006405, 0.9179252, 0.8234011, 0, 0.9647059, 1, 1,
0.03499857, 1.293837, -0.1938059, 0, 0.9568627, 1, 1,
0.03538986, 0.4320993, 0.432426, 0, 0.9529412, 1, 1,
0.03702905, -2.543073, 4.582775, 0, 0.945098, 1, 1,
0.0376867, 1.464321, -0.7400641, 0, 0.9411765, 1, 1,
0.04457882, -0.8351116, 3.503495, 0, 0.9333333, 1, 1,
0.04736335, -0.9362183, 1.917155, 0, 0.9294118, 1, 1,
0.04808898, -1.232246, 2.33002, 0, 0.9215686, 1, 1,
0.0483738, 0.8712077, 0.1954369, 0, 0.9176471, 1, 1,
0.05188852, 0.544139, -1.334601, 0, 0.9098039, 1, 1,
0.05318657, 1.976609, 1.828009, 0, 0.9058824, 1, 1,
0.05417246, -0.1840309, 3.438843, 0, 0.8980392, 1, 1,
0.05549083, -1.5206, 2.841737, 0, 0.8901961, 1, 1,
0.06436609, 0.4127858, -0.4776433, 0, 0.8862745, 1, 1,
0.06491718, -0.1102951, 1.602754, 0, 0.8784314, 1, 1,
0.06553371, -0.268706, 1.773904, 0, 0.8745098, 1, 1,
0.0685371, -0.5351422, 3.264352, 0, 0.8666667, 1, 1,
0.07387276, 1.02952, 1.051079, 0, 0.8627451, 1, 1,
0.07413492, 2.24666, -2.165681, 0, 0.854902, 1, 1,
0.07710949, 0.7215124, -1.285391, 0, 0.8509804, 1, 1,
0.07723156, 0.3412505, 1.05862, 0, 0.8431373, 1, 1,
0.07835872, 2.221177, -0.4422383, 0, 0.8392157, 1, 1,
0.08879488, -0.3234417, 1.582906, 0, 0.8313726, 1, 1,
0.09011197, 0.2747186, 1.638923, 0, 0.827451, 1, 1,
0.0917161, 0.3899019, 0.1965765, 0, 0.8196079, 1, 1,
0.09711266, -0.2055444, 1.278211, 0, 0.8156863, 1, 1,
0.0974062, 0.1672479, 1.85464, 0, 0.8078431, 1, 1,
0.09862128, 0.8950808, -0.4939422, 0, 0.8039216, 1, 1,
0.1052418, 0.4338863, 0.3881471, 0, 0.7960784, 1, 1,
0.1058938, -1.066287, 3.171737, 0, 0.7882353, 1, 1,
0.1158973, 0.6685857, 0.5408544, 0, 0.7843137, 1, 1,
0.1185674, 0.33378, -1.27768, 0, 0.7764706, 1, 1,
0.119104, 0.4001249, -0.9730473, 0, 0.772549, 1, 1,
0.1222817, -0.9028696, 3.73078, 0, 0.7647059, 1, 1,
0.1228541, 1.936318, 0.6504878, 0, 0.7607843, 1, 1,
0.1242417, -0.6443802, 1.835613, 0, 0.7529412, 1, 1,
0.128409, -0.7159808, 3.608179, 0, 0.7490196, 1, 1,
0.1305553, -0.04043419, 1.271352, 0, 0.7411765, 1, 1,
0.1316563, 0.4801406, 1.291894, 0, 0.7372549, 1, 1,
0.1330942, 0.5788888, 0.9772906, 0, 0.7294118, 1, 1,
0.1358036, 1.328003, -0.311772, 0, 0.7254902, 1, 1,
0.1382429, 0.6590498, 1.435572, 0, 0.7176471, 1, 1,
0.1395265, 1.109458, 0.1267507, 0, 0.7137255, 1, 1,
0.1464882, 0.3771906, -1.183854, 0, 0.7058824, 1, 1,
0.1497078, -0.154689, 2.410755, 0, 0.6980392, 1, 1,
0.1563483, 0.07836797, 1.384065, 0, 0.6941177, 1, 1,
0.162072, 1.065227, 0.2597435, 0, 0.6862745, 1, 1,
0.1667478, 0.8504967, -0.247993, 0, 0.682353, 1, 1,
0.1709992, 0.1758542, 2.757561, 0, 0.6745098, 1, 1,
0.1765871, -0.02804977, 1.266604, 0, 0.6705883, 1, 1,
0.1800644, 0.209461, -0.1584686, 0, 0.6627451, 1, 1,
0.1846313, -1.919021, 2.899327, 0, 0.6588235, 1, 1,
0.1865349, 1.13286, -2.731402, 0, 0.6509804, 1, 1,
0.186894, -0.1384138, 1.195094, 0, 0.6470588, 1, 1,
0.1876195, 0.5817785, -0.5912029, 0, 0.6392157, 1, 1,
0.1876506, 1.660691, -0.5931876, 0, 0.6352941, 1, 1,
0.1884168, 0.4193069, -0.8213421, 0, 0.627451, 1, 1,
0.1891657, -0.05654213, 0.6569185, 0, 0.6235294, 1, 1,
0.1897219, 1.85515, 0.6565462, 0, 0.6156863, 1, 1,
0.1918521, 0.1012066, 2.063553, 0, 0.6117647, 1, 1,
0.1951653, 0.943683, 0.02433147, 0, 0.6039216, 1, 1,
0.1952788, 0.07647262, 2.056704, 0, 0.5960785, 1, 1,
0.1965703, -1.849945, 1.267296, 0, 0.5921569, 1, 1,
0.1969584, -0.4424505, 3.244105, 0, 0.5843138, 1, 1,
0.1971855, -0.3680219, 1.926436, 0, 0.5803922, 1, 1,
0.2012914, 0.5894786, 0.06810305, 0, 0.572549, 1, 1,
0.2031193, -0.6031443, 1.650065, 0, 0.5686275, 1, 1,
0.2094421, -1.502917, 3.516351, 0, 0.5607843, 1, 1,
0.2110296, -0.02862152, 0.8121287, 0, 0.5568628, 1, 1,
0.2123947, 1.403304, -0.2060969, 0, 0.5490196, 1, 1,
0.2136629, -0.3634171, 2.226372, 0, 0.5450981, 1, 1,
0.2155513, -1.604665, 3.0709, 0, 0.5372549, 1, 1,
0.2167136, 0.345648, 1.650199, 0, 0.5333334, 1, 1,
0.2180536, -1.441213, 5.394505, 0, 0.5254902, 1, 1,
0.2197803, 0.3247642, 0.1399179, 0, 0.5215687, 1, 1,
0.2198167, 0.446225, 0.5390369, 0, 0.5137255, 1, 1,
0.2208918, -0.8774475, 3.792963, 0, 0.509804, 1, 1,
0.2209271, 0.3138088, -0.6795957, 0, 0.5019608, 1, 1,
0.2239895, -0.1133062, 3.073537, 0, 0.4941176, 1, 1,
0.2335497, -0.8214059, 3.743321, 0, 0.4901961, 1, 1,
0.2364453, -0.78093, 3.46148, 0, 0.4823529, 1, 1,
0.237576, 0.3067589, -0.4634666, 0, 0.4784314, 1, 1,
0.2437337, -0.1098517, 0.6922962, 0, 0.4705882, 1, 1,
0.2476402, 1.234806, -0.1430807, 0, 0.4666667, 1, 1,
0.2490492, -0.3161321, 1.553869, 0, 0.4588235, 1, 1,
0.2503066, -1.248886, 2.695927, 0, 0.454902, 1, 1,
0.2507142, 0.2669105, 0.6849145, 0, 0.4470588, 1, 1,
0.2549535, -2.195927, 4.041141, 0, 0.4431373, 1, 1,
0.2561591, -1.546747, 3.746461, 0, 0.4352941, 1, 1,
0.2563547, -0.6354989, 2.866095, 0, 0.4313726, 1, 1,
0.2574775, -1.237993, 2.026749, 0, 0.4235294, 1, 1,
0.2575697, -1.494962, 1.603692, 0, 0.4196078, 1, 1,
0.2585107, 1.728379, 0.7389783, 0, 0.4117647, 1, 1,
0.2591356, -1.308815, 2.704484, 0, 0.4078431, 1, 1,
0.2641583, 0.4819589, 0.5792235, 0, 0.4, 1, 1,
0.2665862, 1.27489, -0.1983816, 0, 0.3921569, 1, 1,
0.2701149, 0.1106996, -1.306344, 0, 0.3882353, 1, 1,
0.2726368, -0.7333798, 3.503894, 0, 0.3803922, 1, 1,
0.2782063, -0.9903684, 1.9101, 0, 0.3764706, 1, 1,
0.2821479, -1.341337, 4.210476, 0, 0.3686275, 1, 1,
0.2858413, 0.4942944, 1.778004, 0, 0.3647059, 1, 1,
0.2858441, -0.2678533, 1.5623, 0, 0.3568628, 1, 1,
0.2862479, 0.3043312, 0.6823723, 0, 0.3529412, 1, 1,
0.2887083, 0.2959523, 0.3334603, 0, 0.345098, 1, 1,
0.2914708, -1.857288, 3.276095, 0, 0.3411765, 1, 1,
0.2975764, 1.105925, 1.792881, 0, 0.3333333, 1, 1,
0.2998129, 0.6028044, 0.8250495, 0, 0.3294118, 1, 1,
0.300352, 1.415863, 0.8881147, 0, 0.3215686, 1, 1,
0.3005751, -0.6428227, 3.62433, 0, 0.3176471, 1, 1,
0.3010124, -0.5976985, 2.998179, 0, 0.3098039, 1, 1,
0.3070822, -0.5546664, 3.857526, 0, 0.3058824, 1, 1,
0.3073447, -0.01314454, -0.33029, 0, 0.2980392, 1, 1,
0.3113313, 0.07792591, 1.089103, 0, 0.2901961, 1, 1,
0.3122008, 0.5572513, -1.206938, 0, 0.2862745, 1, 1,
0.3129027, -0.2890384, 4.181187, 0, 0.2784314, 1, 1,
0.3155248, -1.689763, 2.493529, 0, 0.2745098, 1, 1,
0.3162501, -0.4232269, 1.950216, 0, 0.2666667, 1, 1,
0.3184907, -0.222483, 2.994595, 0, 0.2627451, 1, 1,
0.3190221, -0.07703479, 3.783991, 0, 0.254902, 1, 1,
0.3266248, 0.3287355, 0.3495861, 0, 0.2509804, 1, 1,
0.3296491, 0.8695018, 1.27245, 0, 0.2431373, 1, 1,
0.3310389, 0.5220741, 0.1156863, 0, 0.2392157, 1, 1,
0.3365326, 2.117287, -0.1719691, 0, 0.2313726, 1, 1,
0.3368707, 0.1204387, 0.2788911, 0, 0.227451, 1, 1,
0.3369841, -0.4218645, 3.32113, 0, 0.2196078, 1, 1,
0.3372673, 0.4510832, 0.1616982, 0, 0.2156863, 1, 1,
0.3376849, 0.5766931, 0.0600101, 0, 0.2078431, 1, 1,
0.3441387, -0.5505246, 3.234567, 0, 0.2039216, 1, 1,
0.3443779, 1.507149, -0.08906458, 0, 0.1960784, 1, 1,
0.3536495, -0.7982152, 1.53608, 0, 0.1882353, 1, 1,
0.3539626, -0.5877426, 3.719067, 0, 0.1843137, 1, 1,
0.3582767, 0.06882796, 0.6584676, 0, 0.1764706, 1, 1,
0.3618666, -0.3251321, 2.240791, 0, 0.172549, 1, 1,
0.3678351, 1.351398, 1.030051, 0, 0.1647059, 1, 1,
0.3686217, -0.01523736, 0.6643204, 0, 0.1607843, 1, 1,
0.3716557, 0.3005126, 0.2611025, 0, 0.1529412, 1, 1,
0.3724702, -1.128453, 3.073445, 0, 0.1490196, 1, 1,
0.37271, -0.1100556, 1.699792, 0, 0.1411765, 1, 1,
0.3778194, -0.5318747, 4.469963, 0, 0.1372549, 1, 1,
0.3791573, 0.1758246, 1.442321, 0, 0.1294118, 1, 1,
0.3826918, -0.1856004, 1.640684, 0, 0.1254902, 1, 1,
0.383865, -0.9167762, 2.359004, 0, 0.1176471, 1, 1,
0.3864797, 2.534513, -0.9064069, 0, 0.1137255, 1, 1,
0.3888647, -2.086885, 3.338616, 0, 0.1058824, 1, 1,
0.389431, -1.838481, 5.522868, 0, 0.09803922, 1, 1,
0.3910446, -2.003302, 2.802516, 0, 0.09411765, 1, 1,
0.3949223, -0.415961, 2.264917, 0, 0.08627451, 1, 1,
0.3971369, -0.516105, 3.122147, 0, 0.08235294, 1, 1,
0.3987762, 0.8328766, -1.00034, 0, 0.07450981, 1, 1,
0.3991957, -1.527081, 2.154219, 0, 0.07058824, 1, 1,
0.4044351, -0.4175229, 2.653666, 0, 0.0627451, 1, 1,
0.4050983, 0.9873342, -0.6234015, 0, 0.05882353, 1, 1,
0.4112741, 0.193687, 3.274979, 0, 0.05098039, 1, 1,
0.4114095, 0.3572657, -0.3806263, 0, 0.04705882, 1, 1,
0.417018, -1.271202, 3.876305, 0, 0.03921569, 1, 1,
0.4177153, -0.5188186, 2.713571, 0, 0.03529412, 1, 1,
0.4190971, -0.5478411, 2.177994, 0, 0.02745098, 1, 1,
0.424164, -0.9140722, 5.050065, 0, 0.02352941, 1, 1,
0.4283298, -0.8971916, 0.9679159, 0, 0.01568628, 1, 1,
0.4367056, 0.4482914, 0.5721165, 0, 0.01176471, 1, 1,
0.4371994, 0.8718812, -0.1122021, 0, 0.003921569, 1, 1,
0.4375427, 0.2696123, 4.193082, 0.003921569, 0, 1, 1,
0.4421484, -1.417418, 2.55694, 0.007843138, 0, 1, 1,
0.4432141, -0.5633461, 1.440696, 0.01568628, 0, 1, 1,
0.4452833, 0.4393939, 2.059504, 0.01960784, 0, 1, 1,
0.4468122, 2.221209, -2.138198, 0.02745098, 0, 1, 1,
0.4485644, 0.1158393, 1.707606, 0.03137255, 0, 1, 1,
0.4501542, 0.3811403, 1.189344, 0.03921569, 0, 1, 1,
0.4612004, -1.485812, 3.19632, 0.04313726, 0, 1, 1,
0.4614297, -0.492002, 1.523533, 0.05098039, 0, 1, 1,
0.4645567, 1.317255, 0.3018805, 0.05490196, 0, 1, 1,
0.4665567, 0.2110159, 1.017283, 0.0627451, 0, 1, 1,
0.467711, -0.4601288, 2.534724, 0.06666667, 0, 1, 1,
0.4726991, -2.701275, 1.750143, 0.07450981, 0, 1, 1,
0.4738965, -1.664685, 3.820369, 0.07843138, 0, 1, 1,
0.4779887, 1.531397, -1.136574, 0.08627451, 0, 1, 1,
0.4818999, 0.582145, 1.358113, 0.09019608, 0, 1, 1,
0.4829499, -1.270034, 2.559124, 0.09803922, 0, 1, 1,
0.4851248, 0.300674, -0.7553312, 0.1058824, 0, 1, 1,
0.4852011, 2.919216, -0.6642157, 0.1098039, 0, 1, 1,
0.4879218, 0.7935315, 2.556036, 0.1176471, 0, 1, 1,
0.4896824, -0.8371683, 3.386185, 0.1215686, 0, 1, 1,
0.4990361, -0.1241496, 2.765531, 0.1294118, 0, 1, 1,
0.5002793, -2.230237, 3.607481, 0.1333333, 0, 1, 1,
0.5006872, 1.238482, -0.2415877, 0.1411765, 0, 1, 1,
0.5016105, -0.1691258, 0.6442977, 0.145098, 0, 1, 1,
0.5029295, -1.150131, 2.184665, 0.1529412, 0, 1, 1,
0.5037429, -1.052566, 1.219209, 0.1568628, 0, 1, 1,
0.5044062, 1.185785, -1.174392, 0.1647059, 0, 1, 1,
0.5109274, 0.9270238, -0.9311554, 0.1686275, 0, 1, 1,
0.5116318, 1.003011, -0.6656355, 0.1764706, 0, 1, 1,
0.5127636, 0.09884133, 0.8832051, 0.1803922, 0, 1, 1,
0.5133884, 1.035616, 1.21579, 0.1882353, 0, 1, 1,
0.5216945, 0.8822916, 0.2594746, 0.1921569, 0, 1, 1,
0.5228962, -1.090807, 2.41825, 0.2, 0, 1, 1,
0.5234886, -0.7215379, 2.90489, 0.2078431, 0, 1, 1,
0.5282917, -0.8646507, 2.405896, 0.2117647, 0, 1, 1,
0.5380964, 0.2155164, 0.9199848, 0.2196078, 0, 1, 1,
0.5406748, 0.09950125, 2.312706, 0.2235294, 0, 1, 1,
0.5456584, 0.6458361, 1.689836, 0.2313726, 0, 1, 1,
0.549053, -0.6720538, 2.251658, 0.2352941, 0, 1, 1,
0.5540851, -1.775778, 3.282219, 0.2431373, 0, 1, 1,
0.5558324, -0.03596813, 0.06610677, 0.2470588, 0, 1, 1,
0.5564452, 0.4818916, 1.639389, 0.254902, 0, 1, 1,
0.5627851, 0.1420136, 3.033059, 0.2588235, 0, 1, 1,
0.5637084, 1.201939, 0.7876849, 0.2666667, 0, 1, 1,
0.5676333, 1.340393, 0.5866526, 0.2705882, 0, 1, 1,
0.5732097, -0.8094696, 1.587672, 0.2784314, 0, 1, 1,
0.5749236, 0.2977749, 1.332353, 0.282353, 0, 1, 1,
0.5751494, -1.113627, 3.613012, 0.2901961, 0, 1, 1,
0.5816522, -1.307671, 2.402237, 0.2941177, 0, 1, 1,
0.5900223, 1.916499, -1.033326, 0.3019608, 0, 1, 1,
0.5926212, -0.8167502, 1.667283, 0.3098039, 0, 1, 1,
0.5937274, 1.313086, 1.403404, 0.3137255, 0, 1, 1,
0.5943741, 1.544269, 0.8566743, 0.3215686, 0, 1, 1,
0.5980643, -0.5719289, 2.453366, 0.3254902, 0, 1, 1,
0.6017783, -1.262902, 3.308501, 0.3333333, 0, 1, 1,
0.602065, -1.163351, 3.89572, 0.3372549, 0, 1, 1,
0.6021569, -0.9322668, 0.193651, 0.345098, 0, 1, 1,
0.6022123, 1.015226, 2.940101, 0.3490196, 0, 1, 1,
0.6068265, 0.05710774, 2.207749, 0.3568628, 0, 1, 1,
0.6101161, 0.8470917, -0.02628486, 0.3607843, 0, 1, 1,
0.6105562, -0.5579225, 1.885967, 0.3686275, 0, 1, 1,
0.6213278, -0.4079302, 4.556929, 0.372549, 0, 1, 1,
0.6246451, 0.5902789, 1.21159, 0.3803922, 0, 1, 1,
0.6259616, 0.8795274, -0.003430372, 0.3843137, 0, 1, 1,
0.6319627, -0.7040308, 3.307812, 0.3921569, 0, 1, 1,
0.6338034, -1.882173, 2.213148, 0.3960784, 0, 1, 1,
0.6342957, -0.7777127, 2.146965, 0.4039216, 0, 1, 1,
0.6380176, 1.15733, 1.636604, 0.4117647, 0, 1, 1,
0.6423141, 0.3351377, 1.104873, 0.4156863, 0, 1, 1,
0.6453212, -0.01758765, 0.4520212, 0.4235294, 0, 1, 1,
0.6539082, 0.03321724, 0.2009255, 0.427451, 0, 1, 1,
0.6581798, 1.133371, -0.7658865, 0.4352941, 0, 1, 1,
0.669349, -0.4416152, 0.3897977, 0.4392157, 0, 1, 1,
0.6725804, -0.8851284, 3.691673, 0.4470588, 0, 1, 1,
0.6788912, 0.184599, 1.090775, 0.4509804, 0, 1, 1,
0.6846552, 0.5731578, 0.7238892, 0.4588235, 0, 1, 1,
0.6856194, -1.10156, 2.25625, 0.4627451, 0, 1, 1,
0.6958076, -0.7026318, 2.044713, 0.4705882, 0, 1, 1,
0.6976784, 1.373721, -0.2720728, 0.4745098, 0, 1, 1,
0.6998122, 0.3973477, 1.461065, 0.4823529, 0, 1, 1,
0.7028944, -0.3387863, 2.502617, 0.4862745, 0, 1, 1,
0.7035832, -0.7946446, 2.347671, 0.4941176, 0, 1, 1,
0.7050084, 0.8249145, 1.252896, 0.5019608, 0, 1, 1,
0.7126397, -0.7836936, 4.461709, 0.5058824, 0, 1, 1,
0.7246413, 0.1794598, 1.255272, 0.5137255, 0, 1, 1,
0.7292441, -0.01591695, 1.898342, 0.5176471, 0, 1, 1,
0.7320947, -0.327524, 1.592922, 0.5254902, 0, 1, 1,
0.7346255, 0.5104405, 1.505149, 0.5294118, 0, 1, 1,
0.7348461, -1.086596, 2.814471, 0.5372549, 0, 1, 1,
0.7436218, 0.6233202, 0.5262954, 0.5411765, 0, 1, 1,
0.7461539, -0.9774601, 2.723657, 0.5490196, 0, 1, 1,
0.7475588, 0.1081846, 1.989762, 0.5529412, 0, 1, 1,
0.7487218, 0.144963, 1.311804, 0.5607843, 0, 1, 1,
0.7511712, -0.5640435, 2.390185, 0.5647059, 0, 1, 1,
0.7527544, 0.9221491, 2.937848, 0.572549, 0, 1, 1,
0.7548444, 0.2070661, 3.294767, 0.5764706, 0, 1, 1,
0.756101, -0.5588673, 3.611511, 0.5843138, 0, 1, 1,
0.7574427, 2.117982, -0.8909911, 0.5882353, 0, 1, 1,
0.7586383, 0.2917815, 1.376878, 0.5960785, 0, 1, 1,
0.7603339, -0.03885843, 3.231087, 0.6039216, 0, 1, 1,
0.7639983, 1.73276, -0.9905944, 0.6078432, 0, 1, 1,
0.7670081, -0.9604425, 3.244963, 0.6156863, 0, 1, 1,
0.7740368, -0.4079643, 2.761955, 0.6196079, 0, 1, 1,
0.7782977, 1.650423, 0.4036282, 0.627451, 0, 1, 1,
0.7817677, 0.1963042, 1.453356, 0.6313726, 0, 1, 1,
0.788418, 0.06008722, 1.61343, 0.6392157, 0, 1, 1,
0.794199, -1.396409, 2.554192, 0.6431373, 0, 1, 1,
0.7967484, -1.090628, 3.818394, 0.6509804, 0, 1, 1,
0.7971169, -0.3474539, 2.950292, 0.654902, 0, 1, 1,
0.7978, -0.8816029, 2.637937, 0.6627451, 0, 1, 1,
0.8001699, 0.3197705, -1.287351, 0.6666667, 0, 1, 1,
0.8039593, -0.569614, 4.274398, 0.6745098, 0, 1, 1,
0.805132, -0.1086804, 1.85543, 0.6784314, 0, 1, 1,
0.8069009, 1.1046, 0.494886, 0.6862745, 0, 1, 1,
0.8089694, -0.289371, 1.315114, 0.6901961, 0, 1, 1,
0.8123346, -0.01761625, 2.400606, 0.6980392, 0, 1, 1,
0.8151665, -1.560216, 2.96408, 0.7058824, 0, 1, 1,
0.8207082, 1.007911, 0.1547755, 0.7098039, 0, 1, 1,
0.8289276, 0.75318, 1.120956, 0.7176471, 0, 1, 1,
0.8326278, 0.3369312, 2.258747, 0.7215686, 0, 1, 1,
0.8342811, 0.5499846, -0.4016553, 0.7294118, 0, 1, 1,
0.8366761, -0.628807, 3.04162, 0.7333333, 0, 1, 1,
0.841588, -0.524488, 1.720536, 0.7411765, 0, 1, 1,
0.8424129, -1.352008, 1.82372, 0.7450981, 0, 1, 1,
0.8460122, 0.9580703, 0.4081643, 0.7529412, 0, 1, 1,
0.8491967, 0.3498694, 1.597417, 0.7568628, 0, 1, 1,
0.8494789, 1.144159, 0.02339021, 0.7647059, 0, 1, 1,
0.8535816, -0.7763385, 2.542794, 0.7686275, 0, 1, 1,
0.8540173, 0.5650083, -0.140935, 0.7764706, 0, 1, 1,
0.8557564, -0.204966, 2.819696, 0.7803922, 0, 1, 1,
0.8592522, -1.040776, 1.608401, 0.7882353, 0, 1, 1,
0.8598136, -0.5893198, 2.256692, 0.7921569, 0, 1, 1,
0.8606621, -0.7567878, 3.298719, 0.8, 0, 1, 1,
0.8607081, 0.1694492, 1.522367, 0.8078431, 0, 1, 1,
0.8609281, -0.2055944, 2.486966, 0.8117647, 0, 1, 1,
0.863961, 0.9165492, -0.2594756, 0.8196079, 0, 1, 1,
0.8671105, 1.336989, 1.334411, 0.8235294, 0, 1, 1,
0.8695714, 1.313226, -0.429045, 0.8313726, 0, 1, 1,
0.8835801, 1.5747, 0.544664, 0.8352941, 0, 1, 1,
0.888756, 0.475574, 1.149153, 0.8431373, 0, 1, 1,
0.8933939, 0.003579396, 0.38684, 0.8470588, 0, 1, 1,
0.8955092, 1.240229, -0.5360292, 0.854902, 0, 1, 1,
0.8960239, 1.395974, 0.2289025, 0.8588235, 0, 1, 1,
0.8972734, 0.576354, 0.8925341, 0.8666667, 0, 1, 1,
0.9070653, 0.1704335, -0.2322696, 0.8705882, 0, 1, 1,
0.9073695, -0.4176332, 0.9523869, 0.8784314, 0, 1, 1,
0.9114769, 0.8857282, 1.297406, 0.8823529, 0, 1, 1,
0.9289547, -0.2074683, 1.921266, 0.8901961, 0, 1, 1,
0.9376861, -0.4483911, 1.633529, 0.8941177, 0, 1, 1,
0.9389091, 0.2201984, 0.5703886, 0.9019608, 0, 1, 1,
0.940252, 1.327263, 0.2213821, 0.9098039, 0, 1, 1,
0.9461269, 1.032172, -0.3327999, 0.9137255, 0, 1, 1,
0.9562742, 1.643353, 1.439748, 0.9215686, 0, 1, 1,
0.9565744, -1.061569, 4.009748, 0.9254902, 0, 1, 1,
0.9580613, 0.8746601, 1.264434, 0.9333333, 0, 1, 1,
0.9588888, -0.3411556, 0.2793396, 0.9372549, 0, 1, 1,
0.9662004, 0.1529821, 1.341659, 0.945098, 0, 1, 1,
0.9665786, 0.267898, 0.959819, 0.9490196, 0, 1, 1,
0.9764772, -1.791193, 2.226631, 0.9568627, 0, 1, 1,
0.9788398, -0.4421828, 1.880715, 0.9607843, 0, 1, 1,
0.9841291, -0.4101192, 1.279052, 0.9686275, 0, 1, 1,
0.9871427, 0.6264806, 0.8750104, 0.972549, 0, 1, 1,
0.9911224, 1.321026, -0.7689307, 0.9803922, 0, 1, 1,
1.002969, 0.7079734, 0.758849, 0.9843137, 0, 1, 1,
1.003973, -0.9386203, 3.003127, 0.9921569, 0, 1, 1,
1.011856, 0.1932161, 1.262773, 0.9960784, 0, 1, 1,
1.018033, -0.4860785, 0.9842355, 1, 0, 0.9960784, 1,
1.019765, -0.2668151, 1.881469, 1, 0, 0.9882353, 1,
1.020129, 0.4914109, 0.524684, 1, 0, 0.9843137, 1,
1.025993, -0.01269467, 0.4205568, 1, 0, 0.9764706, 1,
1.028277, 0.9689242, 0.1927348, 1, 0, 0.972549, 1,
1.028462, 0.07212104, 1.008023, 1, 0, 0.9647059, 1,
1.030038, -0.9604149, 1.609984, 1, 0, 0.9607843, 1,
1.031622, -0.1867302, 2.402338, 1, 0, 0.9529412, 1,
1.034845, -0.7041497, 0.9046742, 1, 0, 0.9490196, 1,
1.040285, -0.7189555, 2.197785, 1, 0, 0.9411765, 1,
1.041629, -0.4168499, 1.858537, 1, 0, 0.9372549, 1,
1.042073, -0.003588406, 0.4975091, 1, 0, 0.9294118, 1,
1.042557, -1.146835, 1.66667, 1, 0, 0.9254902, 1,
1.044173, 1.022095, 0.9646274, 1, 0, 0.9176471, 1,
1.04506, -0.1173454, 1.868537, 1, 0, 0.9137255, 1,
1.047056, 0.2590799, 2.614691, 1, 0, 0.9058824, 1,
1.047168, -0.9098111, 1.874901, 1, 0, 0.9019608, 1,
1.047239, -0.9635761, 1.216299, 1, 0, 0.8941177, 1,
1.048676, 0.2653971, -0.3799753, 1, 0, 0.8862745, 1,
1.048839, 0.2134343, 1.398657, 1, 0, 0.8823529, 1,
1.059886, 0.6774163, 2.230019, 1, 0, 0.8745098, 1,
1.061586, 0.495801, 1.040723, 1, 0, 0.8705882, 1,
1.064838, -1.021317, 3.686755, 1, 0, 0.8627451, 1,
1.065316, 1.128328, 1.903366, 1, 0, 0.8588235, 1,
1.068105, -0.816164, 2.917024, 1, 0, 0.8509804, 1,
1.068529, -2.00872, 4.177474, 1, 0, 0.8470588, 1,
1.077929, 1.322372, 1.186798, 1, 0, 0.8392157, 1,
1.084903, -0.3504055, 1.955619, 1, 0, 0.8352941, 1,
1.084903, 1.113641, 1.014717, 1, 0, 0.827451, 1,
1.097739, 0.2275697, 2.737535, 1, 0, 0.8235294, 1,
1.099108, -0.1502521, 3.263939, 1, 0, 0.8156863, 1,
1.100348, 0.2148309, 0.9496717, 1, 0, 0.8117647, 1,
1.107167, 0.291603, 1.469045, 1, 0, 0.8039216, 1,
1.115165, 0.6474267, 2.458324, 1, 0, 0.7960784, 1,
1.120886, 1.098416, 1.802633, 1, 0, 0.7921569, 1,
1.122412, -0.4264796, 3.231974, 1, 0, 0.7843137, 1,
1.128083, -0.1778658, 3.339432, 1, 0, 0.7803922, 1,
1.130908, -0.1702068, 2.122816, 1, 0, 0.772549, 1,
1.135958, 0.08209303, 2.510972, 1, 0, 0.7686275, 1,
1.140514, 0.5077617, -0.01138686, 1, 0, 0.7607843, 1,
1.143986, -1.200408, 2.414459, 1, 0, 0.7568628, 1,
1.14645, 0.2322077, 2.0261, 1, 0, 0.7490196, 1,
1.161573, -1.678401, 2.126896, 1, 0, 0.7450981, 1,
1.173883, 0.9932948, -1.55817, 1, 0, 0.7372549, 1,
1.179481, 0.2133081, 3.271817, 1, 0, 0.7333333, 1,
1.180441, 1.088482, 0.9792979, 1, 0, 0.7254902, 1,
1.182201, 0.6235505, 0.6504878, 1, 0, 0.7215686, 1,
1.195603, 1.427037, -0.851607, 1, 0, 0.7137255, 1,
1.196325, 2.350816, 1.01423, 1, 0, 0.7098039, 1,
1.198246, 2.387505, 0.9054557, 1, 0, 0.7019608, 1,
1.205112, 0.3755601, 2.114586, 1, 0, 0.6941177, 1,
1.210864, 0.4054997, 0.7806745, 1, 0, 0.6901961, 1,
1.213166, 0.09860864, 2.526935, 1, 0, 0.682353, 1,
1.215036, -0.3382729, 0.7047184, 1, 0, 0.6784314, 1,
1.215145, -0.6926241, 3.088776, 1, 0, 0.6705883, 1,
1.215228, 0.4074256, 1.221369, 1, 0, 0.6666667, 1,
1.221497, -1.027836, 3.215683, 1, 0, 0.6588235, 1,
1.22368, -0.2152859, -0.9387282, 1, 0, 0.654902, 1,
1.230687, -0.6739051, 2.808314, 1, 0, 0.6470588, 1,
1.238868, -1.256604, 2.992474, 1, 0, 0.6431373, 1,
1.240755, -0.4918844, 0.5708505, 1, 0, 0.6352941, 1,
1.242875, -0.212233, 2.688937, 1, 0, 0.6313726, 1,
1.243011, 1.427626, -1.244413, 1, 0, 0.6235294, 1,
1.243846, -0.5011559, 4.246817, 1, 0, 0.6196079, 1,
1.246352, -0.2506667, 0.6737249, 1, 0, 0.6117647, 1,
1.248939, -0.7241244, 2.360037, 1, 0, 0.6078432, 1,
1.264175, -0.984292, 1.911064, 1, 0, 0.6, 1,
1.266823, 2.412835, 1.913828, 1, 0, 0.5921569, 1,
1.270597, -0.9737911, 0.537983, 1, 0, 0.5882353, 1,
1.27088, -0.5993285, 2.155858, 1, 0, 0.5803922, 1,
1.272837, 0.6422048, 1.448552, 1, 0, 0.5764706, 1,
1.274372, -1.87756, 2.937334, 1, 0, 0.5686275, 1,
1.276584, -1.863052, 3.220838, 1, 0, 0.5647059, 1,
1.277522, 0.6081346, -0.07792815, 1, 0, 0.5568628, 1,
1.296948, -2.370159, 2.491986, 1, 0, 0.5529412, 1,
1.298015, -1.028028, 0.4372673, 1, 0, 0.5450981, 1,
1.29993, 1.619791, 0.7480943, 1, 0, 0.5411765, 1,
1.304768, -0.4747187, 2.139751, 1, 0, 0.5333334, 1,
1.306181, 0.6097211, 3.213345, 1, 0, 0.5294118, 1,
1.30877, 0.9972886, 0.2207941, 1, 0, 0.5215687, 1,
1.340367, -0.06068802, 0.9403113, 1, 0, 0.5176471, 1,
1.345262, -0.04547443, 3.861775, 1, 0, 0.509804, 1,
1.347918, 0.7468218, 1.525057, 1, 0, 0.5058824, 1,
1.350565, 0.1955202, 0.2023933, 1, 0, 0.4980392, 1,
1.372561, -0.4388419, 0.8721922, 1, 0, 0.4901961, 1,
1.376081, -0.9735903, 3.302137, 1, 0, 0.4862745, 1,
1.376541, 2.229674, 1.506715, 1, 0, 0.4784314, 1,
1.378783, 1.007639, 0.5013983, 1, 0, 0.4745098, 1,
1.38074, 0.7400735, 0.6482021, 1, 0, 0.4666667, 1,
1.39746, -1.973802, 2.441015, 1, 0, 0.4627451, 1,
1.397932, 0.9281069, -0.51191, 1, 0, 0.454902, 1,
1.40272, 1.912956, 1.840274, 1, 0, 0.4509804, 1,
1.403982, 0.5847383, 1.352149, 1, 0, 0.4431373, 1,
1.407078, -1.359654, 3.033288, 1, 0, 0.4392157, 1,
1.408516, 1.229962, 0.3851903, 1, 0, 0.4313726, 1,
1.409667, 0.9598319, 1.685276, 1, 0, 0.427451, 1,
1.424793, -0.9367242, -0.2361159, 1, 0, 0.4196078, 1,
1.428357, -1.045831, 3.90809, 1, 0, 0.4156863, 1,
1.430128, -0.970318, 2.952292, 1, 0, 0.4078431, 1,
1.430734, -0.7856181, 0.8787816, 1, 0, 0.4039216, 1,
1.436313, 0.6092002, 2.135953, 1, 0, 0.3960784, 1,
1.440668, -1.28458, 2.003234, 1, 0, 0.3882353, 1,
1.443601, 1.211283, 0.9553126, 1, 0, 0.3843137, 1,
1.45457, 0.3903375, 1.928014, 1, 0, 0.3764706, 1,
1.472791, 0.8365582, 0.01504781, 1, 0, 0.372549, 1,
1.474403, -0.1803686, 1.540336, 1, 0, 0.3647059, 1,
1.475802, -0.1046238, 1.462317, 1, 0, 0.3607843, 1,
1.479926, 0.9020997, 0.8939928, 1, 0, 0.3529412, 1,
1.511634, 1.811532, 0.5065602, 1, 0, 0.3490196, 1,
1.517572, 0.8371755, 1.254504, 1, 0, 0.3411765, 1,
1.521973, 0.5659435, 1.135645, 1, 0, 0.3372549, 1,
1.529755, -0.9036525, 1.503116, 1, 0, 0.3294118, 1,
1.539532, -0.5137312, 1.713525, 1, 0, 0.3254902, 1,
1.540526, 0.2204757, 1.94966, 1, 0, 0.3176471, 1,
1.544835, 1.429819, 3.095248, 1, 0, 0.3137255, 1,
1.549878, -0.3177338, 0.06551982, 1, 0, 0.3058824, 1,
1.558339, 0.01534732, 0.8044294, 1, 0, 0.2980392, 1,
1.560702, -1.279823, 0.3892518, 1, 0, 0.2941177, 1,
1.56581, 1.303365, -0.5270246, 1, 0, 0.2862745, 1,
1.592409, -0.3832112, 0.5091073, 1, 0, 0.282353, 1,
1.605123, 0.1154044, 1.759287, 1, 0, 0.2745098, 1,
1.61675, -0.3841137, 2.148804, 1, 0, 0.2705882, 1,
1.618541, -1.473003, 1.933506, 1, 0, 0.2627451, 1,
1.629969, 0.291218, 2.025469, 1, 0, 0.2588235, 1,
1.630353, -0.3883792, 1.106579, 1, 0, 0.2509804, 1,
1.630626, 0.6600203, -1.505796, 1, 0, 0.2470588, 1,
1.643943, 0.634988, -0.8066785, 1, 0, 0.2392157, 1,
1.672297, -0.5724943, 1.051904, 1, 0, 0.2352941, 1,
1.674195, -0.9585221, 2.86635, 1, 0, 0.227451, 1,
1.678117, 1.04633, -0.8321562, 1, 0, 0.2235294, 1,
1.684984, -0.5085663, 0.3700253, 1, 0, 0.2156863, 1,
1.70852, -0.2876535, 1.198425, 1, 0, 0.2117647, 1,
1.711959, 0.6073417, 2.036504, 1, 0, 0.2039216, 1,
1.712186, 0.8337309, 1.903382, 1, 0, 0.1960784, 1,
1.726452, 0.1600858, 1.629436, 1, 0, 0.1921569, 1,
1.745024, -0.7997499, 2.034978, 1, 0, 0.1843137, 1,
1.747267, 0.2727672, 2.013216, 1, 0, 0.1803922, 1,
1.747318, -0.8283418, 0.6338096, 1, 0, 0.172549, 1,
1.759218, -0.1313627, 2.368947, 1, 0, 0.1686275, 1,
1.775918, 0.1598336, 1.617997, 1, 0, 0.1607843, 1,
1.791807, -2.861308, 2.525171, 1, 0, 0.1568628, 1,
1.816747, -0.3563211, 1.16271, 1, 0, 0.1490196, 1,
1.820309, -1.71517, 2.833782, 1, 0, 0.145098, 1,
1.843887, 0.2478863, 1.401067, 1, 0, 0.1372549, 1,
1.870814, 0.09807073, 2.013604, 1, 0, 0.1333333, 1,
1.887778, 0.3948115, 0.6948856, 1, 0, 0.1254902, 1,
1.902199, 0.5521827, 1.777271, 1, 0, 0.1215686, 1,
1.90695, -0.1343759, 2.349632, 1, 0, 0.1137255, 1,
1.915159, -0.9707233, 1.306525, 1, 0, 0.1098039, 1,
2.029055, 0.3882028, 0.7103171, 1, 0, 0.1019608, 1,
2.06328, 1.261695, 1.113695, 1, 0, 0.09411765, 1,
2.083081, -0.5136232, 2.741491, 1, 0, 0.09019608, 1,
2.137783, -0.4216376, 0.7351909, 1, 0, 0.08235294, 1,
2.215448, -0.882184, 1.37363, 1, 0, 0.07843138, 1,
2.217069, 0.05501714, 1.658349, 1, 0, 0.07058824, 1,
2.23114, 1.88392, 1.333505, 1, 0, 0.06666667, 1,
2.338699, 0.1772696, 1.29111, 1, 0, 0.05882353, 1,
2.384943, 0.2469868, 1.404845, 1, 0, 0.05490196, 1,
2.506176, -1.810879, 2.949523, 1, 0, 0.04705882, 1,
2.540767, -2.062473, 2.605665, 1, 0, 0.04313726, 1,
2.546834, -0.0125339, 2.4119, 1, 0, 0.03529412, 1,
2.640841, 1.213576, 3.074645, 1, 0, 0.03137255, 1,
2.662056, 0.3640029, 1.689724, 1, 0, 0.02352941, 1,
2.805974, -1.069039, 0.7689896, 1, 0, 0.01960784, 1,
3.077002, 1.185527, 1.135945, 1, 0, 0.01176471, 1,
3.122368, -0.9195775, 1.701748, 1, 0, 0.007843138, 1
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
-0.3716191, -3.861382, -8.157047, 0, -0.5, 0.5, 0.5,
-0.3716191, -3.861382, -8.157047, 1, -0.5, 0.5, 0.5,
-0.3716191, -3.861382, -8.157047, 1, 1.5, 0.5, 0.5,
-0.3716191, -3.861382, -8.157047, 0, 1.5, 0.5, 0.5
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
-5.050067, 0.02028549, -8.157047, 0, -0.5, 0.5, 0.5,
-5.050067, 0.02028549, -8.157047, 1, -0.5, 0.5, 0.5,
-5.050067, 0.02028549, -8.157047, 1, 1.5, 0.5, 0.5,
-5.050067, 0.02028549, -8.157047, 0, 1.5, 0.5, 0.5
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
-5.050067, -3.861382, -0.3257494, 0, -0.5, 0.5, 0.5,
-5.050067, -3.861382, -0.3257494, 1, -0.5, 0.5, 0.5,
-5.050067, -3.861382, -0.3257494, 1, 1.5, 0.5, 0.5,
-5.050067, -3.861382, -0.3257494, 0, 1.5, 0.5, 0.5
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
-3, -2.965613, -6.349825,
3, -2.965613, -6.349825,
-3, -2.965613, -6.349825,
-3, -3.114908, -6.651029,
-2, -2.965613, -6.349825,
-2, -3.114908, -6.651029,
-1, -2.965613, -6.349825,
-1, -3.114908, -6.651029,
0, -2.965613, -6.349825,
0, -3.114908, -6.651029,
1, -2.965613, -6.349825,
1, -3.114908, -6.651029,
2, -2.965613, -6.349825,
2, -3.114908, -6.651029,
3, -2.965613, -6.349825,
3, -3.114908, -6.651029
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
-3, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
-3, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
-3, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
-3, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
-2, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
-2, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
-2, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
-2, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
-1, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
-1, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
-1, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
-1, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
0, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
0, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
0, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
0, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
1, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
1, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
1, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
1, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
2, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
2, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
2, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
2, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5,
3, -3.413497, -7.253436, 0, -0.5, 0.5, 0.5,
3, -3.413497, -7.253436, 1, -0.5, 0.5, 0.5,
3, -3.413497, -7.253436, 1, 1.5, 0.5, 0.5,
3, -3.413497, -7.253436, 0, 1.5, 0.5, 0.5
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
-3.970425, -2, -6.349825,
-3.970425, 2, -6.349825,
-3.970425, -2, -6.349825,
-4.150366, -2, -6.651029,
-3.970425, -1, -6.349825,
-4.150366, -1, -6.651029,
-3.970425, 0, -6.349825,
-4.150366, 0, -6.651029,
-3.970425, 1, -6.349825,
-4.150366, 1, -6.651029,
-3.970425, 2, -6.349825,
-4.150366, 2, -6.651029
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
-4.510246, -2, -7.253436, 0, -0.5, 0.5, 0.5,
-4.510246, -2, -7.253436, 1, -0.5, 0.5, 0.5,
-4.510246, -2, -7.253436, 1, 1.5, 0.5, 0.5,
-4.510246, -2, -7.253436, 0, 1.5, 0.5, 0.5,
-4.510246, -1, -7.253436, 0, -0.5, 0.5, 0.5,
-4.510246, -1, -7.253436, 1, -0.5, 0.5, 0.5,
-4.510246, -1, -7.253436, 1, 1.5, 0.5, 0.5,
-4.510246, -1, -7.253436, 0, 1.5, 0.5, 0.5,
-4.510246, 0, -7.253436, 0, -0.5, 0.5, 0.5,
-4.510246, 0, -7.253436, 1, -0.5, 0.5, 0.5,
-4.510246, 0, -7.253436, 1, 1.5, 0.5, 0.5,
-4.510246, 0, -7.253436, 0, 1.5, 0.5, 0.5,
-4.510246, 1, -7.253436, 0, -0.5, 0.5, 0.5,
-4.510246, 1, -7.253436, 1, -0.5, 0.5, 0.5,
-4.510246, 1, -7.253436, 1, 1.5, 0.5, 0.5,
-4.510246, 1, -7.253436, 0, 1.5, 0.5, 0.5,
-4.510246, 2, -7.253436, 0, -0.5, 0.5, 0.5,
-4.510246, 2, -7.253436, 1, -0.5, 0.5, 0.5,
-4.510246, 2, -7.253436, 1, 1.5, 0.5, 0.5,
-4.510246, 2, -7.253436, 0, 1.5, 0.5, 0.5
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
-3.970425, -2.965613, -6,
-3.970425, -2.965613, 4,
-3.970425, -2.965613, -6,
-4.150366, -3.114908, -6,
-3.970425, -2.965613, -4,
-4.150366, -3.114908, -4,
-3.970425, -2.965613, -2,
-4.150366, -3.114908, -2,
-3.970425, -2.965613, 0,
-4.150366, -3.114908, 0,
-3.970425, -2.965613, 2,
-4.150366, -3.114908, 2,
-3.970425, -2.965613, 4,
-4.150366, -3.114908, 4
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
"-6",
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
-4.510246, -3.413497, -6, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -6, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -6, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, -6, 0, 1.5, 0.5, 0.5,
-4.510246, -3.413497, -4, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -4, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -4, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, -4, 0, 1.5, 0.5, 0.5,
-4.510246, -3.413497, -2, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -2, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, -2, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, -2, 0, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 0, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 0, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 0, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 0, 0, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 2, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 2, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 2, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 2, 0, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 4, 0, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 4, 1, -0.5, 0.5, 0.5,
-4.510246, -3.413497, 4, 1, 1.5, 0.5, 0.5,
-4.510246, -3.413497, 4, 0, 1.5, 0.5, 0.5
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
-3.970425, -2.965613, -6.349825,
-3.970425, 3.006184, -6.349825,
-3.970425, -2.965613, 5.698326,
-3.970425, 3.006184, 5.698326,
-3.970425, -2.965613, -6.349825,
-3.970425, -2.965613, 5.698326,
-3.970425, 3.006184, -6.349825,
-3.970425, 3.006184, 5.698326,
-3.970425, -2.965613, -6.349825,
3.227187, -2.965613, -6.349825,
-3.970425, -2.965613, 5.698326,
3.227187, -2.965613, 5.698326,
-3.970425, 3.006184, -6.349825,
3.227187, 3.006184, -6.349825,
-3.970425, 3.006184, 5.698326,
3.227187, 3.006184, 5.698326,
3.227187, -2.965613, -6.349825,
3.227187, 3.006184, -6.349825,
3.227187, -2.965613, 5.698326,
3.227187, 3.006184, 5.698326,
3.227187, -2.965613, -6.349825,
3.227187, -2.965613, 5.698326,
3.227187, 3.006184, -6.349825,
3.227187, 3.006184, 5.698326
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
var radius = 8.144314;
var distance = 36.23497;
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
mvMatrix.translate( 0.3716191, -0.02028549, 0.3257494 );
mvMatrix.scale( 1.223432, 1.474563, 0.7308832 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.23497);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Alaproclate_hydrochl<-read.table("Alaproclate_hydrochl.xyz", skip=1)
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
-3.865606, 0.2509476, -1.903897, 0, 0, 1, 1, 1,
-2.84951, 0.1432396, -2.63694, 1, 0, 0, 1, 1,
-2.815053, 0.2762132, -1.955957, 1, 0, 0, 1, 1,
-2.773347, 0.467782, -1.372969, 1, 0, 0, 1, 1,
-2.651818, -0.7278548, -2.293402, 1, 0, 0, 1, 1,
-2.635877, 0.7917701, -1.879865, 1, 0, 0, 1, 1,
-2.629102, -1.158841, -0.4080037, 0, 0, 0, 1, 1,
-2.484431, 1.080227, 0.7886082, 0, 0, 0, 1, 1,
-2.463599, -1.59436, 0.5294925, 0, 0, 0, 1, 1,
-2.439919, 0.3262607, -0.3658336, 0, 0, 0, 1, 1,
-2.438807, -0.8640139, -1.457523, 0, 0, 0, 1, 1,
-2.381832, 0.1640542, -1.439112, 0, 0, 0, 1, 1,
-2.360747, -0.2483154, -0.562211, 0, 0, 0, 1, 1,
-2.311637, 0.4257628, -0.09636219, 1, 1, 1, 1, 1,
-2.288952, 0.02948563, -2.340466, 1, 1, 1, 1, 1,
-2.249347, 0.8994679, -0.8348283, 1, 1, 1, 1, 1,
-2.232077, 1.670529, -1.672265, 1, 1, 1, 1, 1,
-2.216101, 0.8720648, -1.550344, 1, 1, 1, 1, 1,
-2.196886, 0.5114072, -1.272655, 1, 1, 1, 1, 1,
-2.166584, 0.9593185, -0.8614922, 1, 1, 1, 1, 1,
-2.16227, 0.2649002, -2.926999, 1, 1, 1, 1, 1,
-2.156767, -2.24971, -3.509458, 1, 1, 1, 1, 1,
-2.120112, 0.5213827, -2.066579, 1, 1, 1, 1, 1,
-2.115422, 0.1416298, -2.195703, 1, 1, 1, 1, 1,
-2.099778, 0.6364715, 0.01325604, 1, 1, 1, 1, 1,
-2.038883, -0.7773844, -1.79728, 1, 1, 1, 1, 1,
-2.034744, 0.6453873, -2.477149, 1, 1, 1, 1, 1,
-2.018063, 0.2060927, -0.4653555, 1, 1, 1, 1, 1,
-2.008497, 1.358687, -1.668639, 0, 0, 1, 1, 1,
-2.007984, -0.03931515, -0.8221759, 1, 0, 0, 1, 1,
-2.004897, -0.2387843, -1.291769, 1, 0, 0, 1, 1,
-1.985627, 0.6701823, -1.466832, 1, 0, 0, 1, 1,
-1.975669, 0.3568164, -2.785872, 1, 0, 0, 1, 1,
-1.975022, 0.6950604, -2.446316, 1, 0, 0, 1, 1,
-1.962774, 0.188513, -3.532737, 0, 0, 0, 1, 1,
-1.948817, -0.7275107, -2.16973, 0, 0, 0, 1, 1,
-1.946852, -1.88288, -2.215196, 0, 0, 0, 1, 1,
-1.946137, -0.2062798, -0.8185071, 0, 0, 0, 1, 1,
-1.839144, -0.0674125, 1.142402, 0, 0, 0, 1, 1,
-1.825162, 1.113777, -2.916058, 0, 0, 0, 1, 1,
-1.770435, 0.9005228, -0.159402, 0, 0, 0, 1, 1,
-1.766456, -1.415943, -2.725723, 1, 1, 1, 1, 1,
-1.745741, -0.9127594, -0.2954111, 1, 1, 1, 1, 1,
-1.744116, 0.3859108, -2.13969, 1, 1, 1, 1, 1,
-1.742936, -0.157506, -1.601326, 1, 1, 1, 1, 1,
-1.742323, 0.4405895, -0.4106846, 1, 1, 1, 1, 1,
-1.737992, -0.6637468, -0.6576911, 1, 1, 1, 1, 1,
-1.735421, -0.1811706, -1.686781, 1, 1, 1, 1, 1,
-1.734288, 0.7682711, -0.9575822, 1, 1, 1, 1, 1,
-1.734029, 0.8141112, -1.662716, 1, 1, 1, 1, 1,
-1.733967, 1.367781, -1.654948, 1, 1, 1, 1, 1,
-1.720703, 0.7733085, -1.415479, 1, 1, 1, 1, 1,
-1.719793, -1.716144, -1.068864, 1, 1, 1, 1, 1,
-1.719295, -0.8580915, -0.7491505, 1, 1, 1, 1, 1,
-1.704931, 0.1833983, -1.350821, 1, 1, 1, 1, 1,
-1.696725, -0.5354074, -2.600016, 1, 1, 1, 1, 1,
-1.666511, -1.170218, -1.714453, 0, 0, 1, 1, 1,
-1.666486, 0.5811217, -1.597416, 1, 0, 0, 1, 1,
-1.656092, -0.6196195, -1.607266, 1, 0, 0, 1, 1,
-1.654648, -1.216692, -1.247361, 1, 0, 0, 1, 1,
-1.651585, 1.096311, -0.0392102, 1, 0, 0, 1, 1,
-1.639326, -0.5556148, -1.58479, 1, 0, 0, 1, 1,
-1.636668, 0.2408993, -2.557004, 0, 0, 0, 1, 1,
-1.635701, -0.4363282, 0.2656122, 0, 0, 0, 1, 1,
-1.634708, -0.2647308, -0.7021208, 0, 0, 0, 1, 1,
-1.619132, 0.2635439, -1.201884, 0, 0, 0, 1, 1,
-1.618014, 2.17366, -0.8601996, 0, 0, 0, 1, 1,
-1.607802, 2.618802, -1.458312, 0, 0, 0, 1, 1,
-1.595439, 0.795306, -1.592532, 0, 0, 0, 1, 1,
-1.592085, -0.8386557, -4.063458, 1, 1, 1, 1, 1,
-1.589053, 0.2736605, -1.869172, 1, 1, 1, 1, 1,
-1.569024, -1.480408, -2.469465, 1, 1, 1, 1, 1,
-1.566536, -0.1361023, -2.271667, 1, 1, 1, 1, 1,
-1.565087, 1.31524, -2.342496, 1, 1, 1, 1, 1,
-1.554136, -0.3003388, -2.65262, 1, 1, 1, 1, 1,
-1.543277, -1.00651, -1.449979, 1, 1, 1, 1, 1,
-1.539902, -0.6649165, -0.1814289, 1, 1, 1, 1, 1,
-1.529381, 0.4516182, -2.753241, 1, 1, 1, 1, 1,
-1.527147, 1.383408, -0.3511254, 1, 1, 1, 1, 1,
-1.516896, -1.080428, -1.48609, 1, 1, 1, 1, 1,
-1.500526, 0.4381559, -2.395608, 1, 1, 1, 1, 1,
-1.487911, 0.4393673, -2.969074, 1, 1, 1, 1, 1,
-1.485358, -2.261028, -1.708619, 1, 1, 1, 1, 1,
-1.48216, -0.2738289, -3.758722, 1, 1, 1, 1, 1,
-1.481835, 0.1619444, -2.424864, 0, 0, 1, 1, 1,
-1.46667, -0.7070183, -3.264386, 1, 0, 0, 1, 1,
-1.462143, -1.8128, -2.369199, 1, 0, 0, 1, 1,
-1.458401, 0.9106407, -1.611638, 1, 0, 0, 1, 1,
-1.456828, 1.315363, 0.2228948, 1, 0, 0, 1, 1,
-1.453766, 0.07599702, -1.901713, 1, 0, 0, 1, 1,
-1.452871, 0.8902071, -0.2838456, 0, 0, 0, 1, 1,
-1.436182, 0.3211114, -0.6006337, 0, 0, 0, 1, 1,
-1.408594, -1.34961, -1.363822, 0, 0, 0, 1, 1,
-1.408394, -0.2568316, -0.6481662, 0, 0, 0, 1, 1,
-1.406418, -0.420058, -1.506235, 0, 0, 0, 1, 1,
-1.405464, -1.845941, -3.38827, 0, 0, 0, 1, 1,
-1.399866, -0.708241, 0.2036822, 0, 0, 0, 1, 1,
-1.39052, -1.223364, -3.318801, 1, 1, 1, 1, 1,
-1.380344, -0.2698944, -2.484665, 1, 1, 1, 1, 1,
-1.367725, -0.4202349, -3.844862, 1, 1, 1, 1, 1,
-1.357123, 0.9368342, -1.022923, 1, 1, 1, 1, 1,
-1.349272, -0.7163941, -2.818598, 1, 1, 1, 1, 1,
-1.347391, 0.02639055, -0.8933149, 1, 1, 1, 1, 1,
-1.341812, 0.2737499, -2.56716, 1, 1, 1, 1, 1,
-1.328452, 0.9102116, -1.505218, 1, 1, 1, 1, 1,
-1.314491, -0.9669077, -1.975078, 1, 1, 1, 1, 1,
-1.31298, -1.217219, -1.781662, 1, 1, 1, 1, 1,
-1.311526, -2.246158, -1.515296, 1, 1, 1, 1, 1,
-1.291356, -1.229978, -2.85991, 1, 1, 1, 1, 1,
-1.290491, 0.3682669, -0.599205, 1, 1, 1, 1, 1,
-1.286555, 1.553333, -0.5223119, 1, 1, 1, 1, 1,
-1.275449, -0.7497182, -1.610214, 1, 1, 1, 1, 1,
-1.275002, 0.3137051, -0.758234, 0, 0, 1, 1, 1,
-1.27423, -0.116535, -2.367159, 1, 0, 0, 1, 1,
-1.271387, -0.03344581, -1.294047, 1, 0, 0, 1, 1,
-1.258639, 1.016021, -1.083278, 1, 0, 0, 1, 1,
-1.258543, 0.1589907, -2.856904, 1, 0, 0, 1, 1,
-1.256996, 1.061181, -0.9952195, 1, 0, 0, 1, 1,
-1.254221, 0.6216505, -0.1706345, 0, 0, 0, 1, 1,
-1.237935, 0.2272783, -0.7221755, 0, 0, 0, 1, 1,
-1.235899, 0.470313, -0.2292818, 0, 0, 0, 1, 1,
-1.228836, 0.3241695, -0.6262393, 0, 0, 0, 1, 1,
-1.22594, -1.407711, -1.816116, 0, 0, 0, 1, 1,
-1.224205, 0.5159817, -0.2187131, 0, 0, 0, 1, 1,
-1.222106, 0.8644677, 1.80013, 0, 0, 0, 1, 1,
-1.212326, 0.3457414, -1.074807, 1, 1, 1, 1, 1,
-1.206544, 1.112048, -0.7458264, 1, 1, 1, 1, 1,
-1.19363, 0.4932325, -0.1352926, 1, 1, 1, 1, 1,
-1.179124, 0.5447321, -2.304904, 1, 1, 1, 1, 1,
-1.175584, -0.7890579, -1.612058, 1, 1, 1, 1, 1,
-1.173515, -1.490907, -2.693804, 1, 1, 1, 1, 1,
-1.164676, -1.64675, -1.3966, 1, 1, 1, 1, 1,
-1.163342, -1.608652, -1.065747, 1, 1, 1, 1, 1,
-1.155469, -1.093091, -1.072011, 1, 1, 1, 1, 1,
-1.154107, -1.910899, -2.679342, 1, 1, 1, 1, 1,
-1.14465, -0.341057, -1.826309, 1, 1, 1, 1, 1,
-1.141733, 0.339231, -1.017588, 1, 1, 1, 1, 1,
-1.133831, -0.7159458, -2.562486, 1, 1, 1, 1, 1,
-1.132857, -0.8813727, -2.062769, 1, 1, 1, 1, 1,
-1.129987, 1.499635, 0.03115739, 1, 1, 1, 1, 1,
-1.127975, -2.042136, -3.986603, 0, 0, 1, 1, 1,
-1.121373, 0.0567309, -1.232299, 1, 0, 0, 1, 1,
-1.119216, 1.531359, -0.3091224, 1, 0, 0, 1, 1,
-1.110718, -0.5335548, -2.345351, 1, 0, 0, 1, 1,
-1.10998, 0.5097049, 0.4981909, 1, 0, 0, 1, 1,
-1.10959, -1.385503, -3.703194, 1, 0, 0, 1, 1,
-1.100826, -0.1862879, -1.648402, 0, 0, 0, 1, 1,
-1.100368, 0.5923362, 0.09413191, 0, 0, 0, 1, 1,
-1.096491, 1.747469, 0.3442351, 0, 0, 0, 1, 1,
-1.093398, 1.258824, 0.4648125, 0, 0, 0, 1, 1,
-1.089429, 2.226636, -1.712425, 0, 0, 0, 1, 1,
-1.088723, -1.288613, -2.487875, 0, 0, 0, 1, 1,
-1.087643, 1.287251, -0.6659729, 0, 0, 0, 1, 1,
-1.074996, -0.3852146, -1.077235, 1, 1, 1, 1, 1,
-1.06901, 0.2377515, -2.072975, 1, 1, 1, 1, 1,
-1.067565, 0.206637, -0.4145429, 1, 1, 1, 1, 1,
-1.050727, 1.457518, 1.596301, 1, 1, 1, 1, 1,
-1.050704, -0.2521542, -0.7779153, 1, 1, 1, 1, 1,
-1.050681, -0.6731229, -3.422818, 1, 1, 1, 1, 1,
-1.046304, 0.1275756, -0.8580183, 1, 1, 1, 1, 1,
-1.04579, 0.450213, -1.522508, 1, 1, 1, 1, 1,
-1.039612, 0.3125688, -2.019207, 1, 1, 1, 1, 1,
-1.038961, -0.9685644, -2.816658, 1, 1, 1, 1, 1,
-1.038579, 1.465232, -0.3931427, 1, 1, 1, 1, 1,
-1.03741, 0.7881738, 0.2739794, 1, 1, 1, 1, 1,
-1.033548, 1.024409, -0.2925886, 1, 1, 1, 1, 1,
-1.031336, -1.684414, -4.767489, 1, 1, 1, 1, 1,
-1.027185, -1.088196, -1.831168, 1, 1, 1, 1, 1,
-1.023771, 0.8333302, 0.6043319, 0, 0, 1, 1, 1,
-1.005135, 0.5888609, -1.877332, 1, 0, 0, 1, 1,
-1.003873, -0.5554295, -1.932063, 1, 0, 0, 1, 1,
-1.003562, -0.8516772, -3.305634, 1, 0, 0, 1, 1,
-1.003244, 0.6675869, -1.598216, 1, 0, 0, 1, 1,
-0.9997623, -0.940409, 0.002973028, 1, 0, 0, 1, 1,
-0.9985375, -0.5843241, -1.986095, 0, 0, 0, 1, 1,
-0.9963012, -0.2614101, -0.05900301, 0, 0, 0, 1, 1,
-0.9955078, -0.4797555, -1.007036, 0, 0, 0, 1, 1,
-0.9947558, -2.436826, -0.7453494, 0, 0, 0, 1, 1,
-0.9873113, -0.157653, -1.413273, 0, 0, 0, 1, 1,
-0.9862486, -0.133495, -2.608017, 0, 0, 0, 1, 1,
-0.9843816, 0.1327554, 0.6520711, 0, 0, 0, 1, 1,
-0.9839485, -1.364659, -2.392636, 1, 1, 1, 1, 1,
-0.9758335, -0.8841676, -1.165251, 1, 1, 1, 1, 1,
-0.9752812, -0.2180253, -1.408496, 1, 1, 1, 1, 1,
-0.9733659, -1.543779, -1.681853, 1, 1, 1, 1, 1,
-0.960844, 0.3343543, -0.7243494, 1, 1, 1, 1, 1,
-0.9603178, -0.8299004, -2.622317, 1, 1, 1, 1, 1,
-0.9586071, 0.9443096, -1.690489, 1, 1, 1, 1, 1,
-0.9410759, 1.808948, -1.271971, 1, 1, 1, 1, 1,
-0.9392953, 0.5890234, -1.519112, 1, 1, 1, 1, 1,
-0.9257466, -0.4122586, -1.63351, 1, 1, 1, 1, 1,
-0.9188793, 1.288971, -0.08526494, 1, 1, 1, 1, 1,
-0.9111421, 0.2909136, -1.173755, 1, 1, 1, 1, 1,
-0.9103293, -1.517639, -2.841259, 1, 1, 1, 1, 1,
-0.9073272, -0.3151621, -3.250843, 1, 1, 1, 1, 1,
-0.9037106, 1.182778, 0.08537313, 1, 1, 1, 1, 1,
-0.9032258, -1.656214, -3.099476, 0, 0, 1, 1, 1,
-0.9022929, -0.7109815, -1.65231, 1, 0, 0, 1, 1,
-0.9020641, 0.05748023, -1.913683, 1, 0, 0, 1, 1,
-0.8978298, -1.365057, -1.781183, 1, 0, 0, 1, 1,
-0.8959503, -0.6101891, -1.458003, 1, 0, 0, 1, 1,
-0.8795952, 1.07961, 0.4576987, 1, 0, 0, 1, 1,
-0.8724242, 0.4731608, -0.5695072, 0, 0, 0, 1, 1,
-0.8653011, -1.855816, -1.514993, 0, 0, 0, 1, 1,
-0.8590403, -0.9449443, -2.379227, 0, 0, 0, 1, 1,
-0.8566585, 0.4706723, -1.986775, 0, 0, 0, 1, 1,
-0.8512262, -1.843194, -1.083961, 0, 0, 0, 1, 1,
-0.8504895, -1.270923, -2.678763, 0, 0, 0, 1, 1,
-0.8419635, 0.5776906, -1.216589, 0, 0, 0, 1, 1,
-0.832377, 1.688262, 0.01287014, 1, 1, 1, 1, 1,
-0.8246681, 0.188634, -2.225629, 1, 1, 1, 1, 1,
-0.8196906, 0.8030073, -0.3101242, 1, 1, 1, 1, 1,
-0.8181751, -1.041059, -2.489479, 1, 1, 1, 1, 1,
-0.8147144, 1.097342, -1.732661, 1, 1, 1, 1, 1,
-0.8082151, -0.43159, -3.721209, 1, 1, 1, 1, 1,
-0.7996841, -1.242615, -0.8483629, 1, 1, 1, 1, 1,
-0.7956092, 0.9502162, -0.5748718, 1, 1, 1, 1, 1,
-0.790877, -0.2083715, -2.215152, 1, 1, 1, 1, 1,
-0.7803855, 0.2684903, -0.7228653, 1, 1, 1, 1, 1,
-0.7788228, 0.1132858, 0.9206983, 1, 1, 1, 1, 1,
-0.7743864, -0.05331256, -1.648164, 1, 1, 1, 1, 1,
-0.7672078, 1.788629, -0.8658575, 1, 1, 1, 1, 1,
-0.7554943, -1.678375, -4.690088, 1, 1, 1, 1, 1,
-0.7544556, -0.1113787, -1.902336, 1, 1, 1, 1, 1,
-0.749423, -1.56094, -2.806531, 0, 0, 1, 1, 1,
-0.7471135, -0.7225697, -2.217707, 1, 0, 0, 1, 1,
-0.7464173, 1.454044, 0.1022833, 1, 0, 0, 1, 1,
-0.7458866, 0.1707902, -0.9117162, 1, 0, 0, 1, 1,
-0.7397383, -0.6645438, -0.8746334, 1, 0, 0, 1, 1,
-0.7345133, -1.691807, -3.362756, 1, 0, 0, 1, 1,
-0.7290392, -1.075086, -3.276419, 0, 0, 0, 1, 1,
-0.7179421, -0.4876924, -1.815623, 0, 0, 0, 1, 1,
-0.7125714, 0.7954564, -0.5798101, 0, 0, 0, 1, 1,
-0.7094822, 0.6434675, -2.033213, 0, 0, 0, 1, 1,
-0.7082728, -1.208312, -3.836287, 0, 0, 0, 1, 1,
-0.7073144, -0.04415903, -3.930532, 0, 0, 0, 1, 1,
-0.7052624, -0.1206598, -1.315596, 0, 0, 0, 1, 1,
-0.7028049, 0.5197868, -1.814737, 1, 1, 1, 1, 1,
-0.7024376, 0.1948489, -0.749538, 1, 1, 1, 1, 1,
-0.7024152, -0.3574115, -0.9325254, 1, 1, 1, 1, 1,
-0.6894443, 0.02122913, -2.945847, 1, 1, 1, 1, 1,
-0.6884851, -0.2104402, -1.771186, 1, 1, 1, 1, 1,
-0.6823261, -1.323257, -2.040143, 1, 1, 1, 1, 1,
-0.6819378, -1.054765, -2.587074, 1, 1, 1, 1, 1,
-0.6759412, -0.9276724, -2.140314, 1, 1, 1, 1, 1,
-0.6743249, 0.5216909, -3.237848, 1, 1, 1, 1, 1,
-0.6737882, -0.8130332, -2.801247, 1, 1, 1, 1, 1,
-0.6702839, 1.195314, -0.975904, 1, 1, 1, 1, 1,
-0.6639045, -0.1531907, -2.275308, 1, 1, 1, 1, 1,
-0.6622174, -1.092143, -3.518642, 1, 1, 1, 1, 1,
-0.6605368, 0.707805, 0.3078436, 1, 1, 1, 1, 1,
-0.6600413, -1.849283, -4.025702, 1, 1, 1, 1, 1,
-0.6560833, 2.227416, 0.9324548, 0, 0, 1, 1, 1,
-0.649515, -0.7188135, -2.625992, 1, 0, 0, 1, 1,
-0.6489159, 1.923772, -0.1026373, 1, 0, 0, 1, 1,
-0.6487417, 2.108342, -0.01099894, 1, 0, 0, 1, 1,
-0.6452956, -0.1151913, -1.626262, 1, 0, 0, 1, 1,
-0.6403589, -0.4221714, -2.217208, 1, 0, 0, 1, 1,
-0.6336983, 1.607712, 2.208344, 0, 0, 0, 1, 1,
-0.6263884, 1.875078, 0.638782, 0, 0, 0, 1, 1,
-0.62568, 1.422211, 0.3098555, 0, 0, 0, 1, 1,
-0.6256613, -0.3917912, -1.758492, 0, 0, 0, 1, 1,
-0.6200933, -0.0464883, -1.604462, 0, 0, 0, 1, 1,
-0.6191258, 0.15025, -0.8227211, 0, 0, 0, 1, 1,
-0.6182094, -0.3654366, -3.130688, 0, 0, 0, 1, 1,
-0.6143727, -1.271375, -2.356322, 1, 1, 1, 1, 1,
-0.61299, -0.5506598, -2.766242, 1, 1, 1, 1, 1,
-0.6125212, -0.2983495, -1.586476, 1, 1, 1, 1, 1,
-0.6028785, 0.01638634, -1.530715, 1, 1, 1, 1, 1,
-0.5997764, -0.893853, -2.79455, 1, 1, 1, 1, 1,
-0.5972103, -1.461706, -2.018017, 1, 1, 1, 1, 1,
-0.592317, 0.1002408, -1.719937, 1, 1, 1, 1, 1,
-0.5904653, 1.083751, -0.4244179, 1, 1, 1, 1, 1,
-0.5890718, 0.8582741, -0.4210004, 1, 1, 1, 1, 1,
-0.588963, -0.2614484, -3.307716, 1, 1, 1, 1, 1,
-0.5881635, 0.3840768, -0.1381925, 1, 1, 1, 1, 1,
-0.5878975, 0.001786604, -1.839826, 1, 1, 1, 1, 1,
-0.5861379, -1.215936, -2.112314, 1, 1, 1, 1, 1,
-0.5858661, 1.281435, -1.274953, 1, 1, 1, 1, 1,
-0.5809952, -0.8905476, -1.677385, 1, 1, 1, 1, 1,
-0.5765808, 0.6044239, -0.5484365, 0, 0, 1, 1, 1,
-0.5727732, -0.499848, -2.859476, 1, 0, 0, 1, 1,
-0.5648656, -1.20676, -1.482142, 1, 0, 0, 1, 1,
-0.5618659, -1.068774, -2.560238, 1, 0, 0, 1, 1,
-0.5595812, -0.930185, -2.230886, 1, 0, 0, 1, 1,
-0.5593871, -0.170403, -0.7983167, 1, 0, 0, 1, 1,
-0.558037, 1.344773, 1.299598, 0, 0, 0, 1, 1,
-0.5525313, 9.67919e-05, -1.299171, 0, 0, 0, 1, 1,
-0.5513002, -0.8516501, -2.150445, 0, 0, 0, 1, 1,
-0.5505957, -0.2425264, -0.4884135, 0, 0, 0, 1, 1,
-0.5469986, -0.6590132, -3.229136, 0, 0, 0, 1, 1,
-0.5469904, -0.7926974, -1.365987, 0, 0, 0, 1, 1,
-0.5467803, -0.8084049, -1.891483, 0, 0, 0, 1, 1,
-0.5458229, -0.7074178, -3.639883, 1, 1, 1, 1, 1,
-0.5442654, 1.600489, -1.112952, 1, 1, 1, 1, 1,
-0.543625, 0.8499394, -2.34978, 1, 1, 1, 1, 1,
-0.5258124, 2.030715, -1.725069, 1, 1, 1, 1, 1,
-0.5236323, 1.316402, 0.8577269, 1, 1, 1, 1, 1,
-0.5223751, -1.687564, -3.509526, 1, 1, 1, 1, 1,
-0.5202551, -0.5004071, -2.281999, 1, 1, 1, 1, 1,
-0.5142452, -0.542699, -2.399639, 1, 1, 1, 1, 1,
-0.5138525, -1.235718, -2.226133, 1, 1, 1, 1, 1,
-0.5126691, -0.1787601, -0.8565671, 1, 1, 1, 1, 1,
-0.510914, -0.8613415, -1.5705, 1, 1, 1, 1, 1,
-0.5040649, 0.45201, -0.9211413, 1, 1, 1, 1, 1,
-0.495957, 0.98492, -1.031864, 1, 1, 1, 1, 1,
-0.4911067, -1.769746, -4.167503, 1, 1, 1, 1, 1,
-0.4907149, 0.07673343, -1.358672, 1, 1, 1, 1, 1,
-0.4905817, -0.4282409, -2.109596, 0, 0, 1, 1, 1,
-0.489339, 1.462629, -1.145032, 1, 0, 0, 1, 1,
-0.4890046, 0.6684648, -0.4372773, 1, 0, 0, 1, 1,
-0.48716, -0.3643733, -2.601914, 1, 0, 0, 1, 1,
-0.4799792, 1.041741, -0.9805558, 1, 0, 0, 1, 1,
-0.479109, 1.7992, 2.355705, 1, 0, 0, 1, 1,
-0.4778445, 0.6949595, -0.4509175, 0, 0, 0, 1, 1,
-0.4777891, -0.2691815, -1.353243, 0, 0, 0, 1, 1,
-0.4771761, -0.146137, -0.7927901, 0, 0, 0, 1, 1,
-0.4763611, -0.09180064, -1.298597, 0, 0, 0, 1, 1,
-0.4743739, -0.491264, -1.045448, 0, 0, 0, 1, 1,
-0.4727215, 1.604937, -1.139474, 0, 0, 0, 1, 1,
-0.4711235, 0.01083797, -0.4810635, 0, 0, 0, 1, 1,
-0.4703132, -0.3837179, -4.377524, 1, 1, 1, 1, 1,
-0.4696525, 0.2962957, -2.885643, 1, 1, 1, 1, 1,
-0.4670939, 0.5963475, -0.09475339, 1, 1, 1, 1, 1,
-0.464501, 1.136553, -0.2988773, 1, 1, 1, 1, 1,
-0.4644788, 1.073405, -0.3934059, 1, 1, 1, 1, 1,
-0.462711, 2.317447, -1.254604, 1, 1, 1, 1, 1,
-0.4615011, -0.005410657, -1.285608, 1, 1, 1, 1, 1,
-0.4607674, 1.434632, 0.09762438, 1, 1, 1, 1, 1,
-0.4601412, 2.882061, -1.290602, 1, 1, 1, 1, 1,
-0.4592419, 1.030049, 0.4110778, 1, 1, 1, 1, 1,
-0.4575804, -0.1138978, -3.83219, 1, 1, 1, 1, 1,
-0.4470355, -1.487081, -3.701315, 1, 1, 1, 1, 1,
-0.4411507, 1.746673, -0.7655759, 1, 1, 1, 1, 1,
-0.4386573, -1.785064, -3.834291, 1, 1, 1, 1, 1,
-0.4368961, -0.7829716, -3.689434, 1, 1, 1, 1, 1,
-0.436608, 0.9395381, 0.08137714, 0, 0, 1, 1, 1,
-0.4362147, -0.4300587, -3.429211, 1, 0, 0, 1, 1,
-0.4280522, 0.1399475, -2.048555, 1, 0, 0, 1, 1,
-0.4270879, 1.323936, -1.492991, 1, 0, 0, 1, 1,
-0.4255406, -1.137548, -4.085569, 1, 0, 0, 1, 1,
-0.4236202, 1.11901, 1.101733, 1, 0, 0, 1, 1,
-0.4232497, 0.7778814, -1.247359, 0, 0, 0, 1, 1,
-0.4215432, 1.596837, -0.03204202, 0, 0, 0, 1, 1,
-0.4202233, -1.050501, -4.818324, 0, 0, 0, 1, 1,
-0.4188852, 0.003127107, -0.7592598, 0, 0, 0, 1, 1,
-0.4136764, -0.8941841, -1.486409, 0, 0, 0, 1, 1,
-0.410818, 1.02693, -1.99674, 0, 0, 0, 1, 1,
-0.4084678, 0.1972448, -2.365664, 0, 0, 0, 1, 1,
-0.404078, -0.8942475, -2.823918, 1, 1, 1, 1, 1,
-0.3860599, -0.7636959, -2.907271, 1, 1, 1, 1, 1,
-0.3846442, 0.04287421, -2.883717, 1, 1, 1, 1, 1,
-0.3829463, -0.9751163, -1.752323, 1, 1, 1, 1, 1,
-0.3828272, -1.101672, -2.41852, 1, 1, 1, 1, 1,
-0.3818834, -0.3039218, -2.951162, 1, 1, 1, 1, 1,
-0.380766, -1.141797, -5.006368, 1, 1, 1, 1, 1,
-0.3778338, -0.1205118, -1.716199, 1, 1, 1, 1, 1,
-0.3719997, -2.878645, -4.495842, 1, 1, 1, 1, 1,
-0.3712154, -0.6240838, -2.728431, 1, 1, 1, 1, 1,
-0.3672608, 0.3973825, 0.3828422, 1, 1, 1, 1, 1,
-0.364415, -0.7836934, -2.267364, 1, 1, 1, 1, 1,
-0.3639928, 0.3115918, -1.171197, 1, 1, 1, 1, 1,
-0.3582083, 0.08789338, -1.940464, 1, 1, 1, 1, 1,
-0.3547672, 1.900289, -0.4083241, 1, 1, 1, 1, 1,
-0.3526117, 1.02257, -1.093192, 0, 0, 1, 1, 1,
-0.3498548, -1.472418, -1.444456, 1, 0, 0, 1, 1,
-0.3496405, -0.2539812, -3.020543, 1, 0, 0, 1, 1,
-0.3464162, 0.6389217, 0.3379044, 1, 0, 0, 1, 1,
-0.3459122, 0.636649, -0.8374395, 1, 0, 0, 1, 1,
-0.3455383, -0.2586119, -1.428582, 1, 0, 0, 1, 1,
-0.3452647, -0.6963162, -3.156894, 0, 0, 0, 1, 1,
-0.3410616, 0.5312259, -0.3623899, 0, 0, 0, 1, 1,
-0.3409865, 0.1605295, 1.200995, 0, 0, 0, 1, 1,
-0.3401899, 1.310618, -0.6966809, 0, 0, 0, 1, 1,
-0.3385421, 0.8897147, 0.5574905, 0, 0, 0, 1, 1,
-0.3325462, -1.192912, -2.87299, 0, 0, 0, 1, 1,
-0.3301248, 1.822078, 0.1013522, 0, 0, 0, 1, 1,
-0.3287374, 2.37995, -0.8429285, 1, 1, 1, 1, 1,
-0.3275148, -0.04312286, -2.968289, 1, 1, 1, 1, 1,
-0.3213434, 0.2094664, -1.704818, 1, 1, 1, 1, 1,
-0.3206891, -0.5545248, -1.216965, 1, 1, 1, 1, 1,
-0.3188968, 0.4349679, -0.4176121, 1, 1, 1, 1, 1,
-0.317738, -0.2593728, -4.174576, 1, 1, 1, 1, 1,
-0.3168413, -0.8987352, -3.203222, 1, 1, 1, 1, 1,
-0.3166184, 0.05614858, -0.2785041, 1, 1, 1, 1, 1,
-0.3161091, -1.808475, -3.682682, 1, 1, 1, 1, 1,
-0.311418, 0.07856589, 0.4724312, 1, 1, 1, 1, 1,
-0.3109708, 0.6713828, 0.2032347, 1, 1, 1, 1, 1,
-0.310563, 1.067852, 0.9048301, 1, 1, 1, 1, 1,
-0.3094112, 0.3138367, -0.383173, 1, 1, 1, 1, 1,
-0.3027783, 1.164668, -0.5110514, 1, 1, 1, 1, 1,
-0.3005596, -0.55026, -4.705797, 1, 1, 1, 1, 1,
-0.2974552, -0.6257381, -2.263084, 0, 0, 1, 1, 1,
-0.2926062, 0.04458427, -2.363372, 1, 0, 0, 1, 1,
-0.2862146, 1.085973, -0.3804085, 1, 0, 0, 1, 1,
-0.2829137, -1.235943, -1.983622, 1, 0, 0, 1, 1,
-0.2777064, 0.4985524, 1.062155, 1, 0, 0, 1, 1,
-0.2762518, 0.5939541, -0.6318313, 1, 0, 0, 1, 1,
-0.2740266, -0.5318168, -4.284977, 0, 0, 0, 1, 1,
-0.2724275, -0.6105554, -2.94385, 0, 0, 0, 1, 1,
-0.2692775, -0.427345, -2.166042, 0, 0, 0, 1, 1,
-0.2691523, -1.479454, -1.628976, 0, 0, 0, 1, 1,
-0.2688346, -0.2528657, -0.5150387, 0, 0, 0, 1, 1,
-0.2582971, -0.3620268, -4.210044, 0, 0, 0, 1, 1,
-0.2570492, 2.593742, 0.3724486, 0, 0, 0, 1, 1,
-0.2560619, 0.7871733, -1.78246, 1, 1, 1, 1, 1,
-0.255795, 2.181128, 1.565915, 1, 1, 1, 1, 1,
-0.2524997, -0.3150029, -1.586967, 1, 1, 1, 1, 1,
-0.2495533, 0.2123445, -0.702333, 1, 1, 1, 1, 1,
-0.2470047, -0.3795999, -2.958694, 1, 1, 1, 1, 1,
-0.2397939, -1.448195, -2.362392, 1, 1, 1, 1, 1,
-0.2374863, 0.8527176, -0.8098564, 1, 1, 1, 1, 1,
-0.2332821, 1.301679, 0.8782467, 1, 1, 1, 1, 1,
-0.2320781, 0.09292654, -2.093318, 1, 1, 1, 1, 1,
-0.2307444, -0.7495847, -3.388584, 1, 1, 1, 1, 1,
-0.2305519, 0.7184668, 2.272672, 1, 1, 1, 1, 1,
-0.2276191, -1.555463, -6.174366, 1, 1, 1, 1, 1,
-0.2266422, -0.2549142, -1.428728, 1, 1, 1, 1, 1,
-0.2176632, 0.1036124, -1.660747, 1, 1, 1, 1, 1,
-0.2161927, 0.1538028, -1.887125, 1, 1, 1, 1, 1,
-0.2140227, -1.412418, -2.965304, 0, 0, 1, 1, 1,
-0.2112379, 0.3422725, -0.883823, 1, 0, 0, 1, 1,
-0.2073826, 0.8547135, 1.981075, 1, 0, 0, 1, 1,
-0.2023131, 0.6603249, -0.9692564, 1, 0, 0, 1, 1,
-0.1979732, 1.234225, -1.743562, 1, 0, 0, 1, 1,
-0.1964729, -0.5904089, -1.044605, 1, 0, 0, 1, 1,
-0.1922936, -0.02017431, -3.568249, 0, 0, 0, 1, 1,
-0.1887024, -1.620394, -3.964328, 0, 0, 0, 1, 1,
-0.1881942, 1.040986, -0.9629267, 0, 0, 0, 1, 1,
-0.1842193, 0.2945729, -1.518192, 0, 0, 0, 1, 1,
-0.1813686, 1.375632, 0.464646, 0, 0, 0, 1, 1,
-0.1770274, -0.4174997, -4.393777, 0, 0, 0, 1, 1,
-0.1769673, -1.846277, -3.999409, 0, 0, 0, 1, 1,
-0.1768456, 0.7614354, -1.449238, 1, 1, 1, 1, 1,
-0.1728695, 0.04913718, -2.364803, 1, 1, 1, 1, 1,
-0.1705145, 2.217527, -1.673916, 1, 1, 1, 1, 1,
-0.1638718, 0.05488165, -1.849185, 1, 1, 1, 1, 1,
-0.1621932, -1.024498, -4.129748, 1, 1, 1, 1, 1,
-0.1620057, -1.38438, -3.234356, 1, 1, 1, 1, 1,
-0.1572671, -0.3263165, -2.372041, 1, 1, 1, 1, 1,
-0.1568297, 0.6867108, -0.439916, 1, 1, 1, 1, 1,
-0.1541377, 0.4252442, -0.9571961, 1, 1, 1, 1, 1,
-0.1494824, -1.775517, -3.267915, 1, 1, 1, 1, 1,
-0.1459977, 0.1255855, -0.3018283, 1, 1, 1, 1, 1,
-0.1454132, -0.3831247, -4.218241, 1, 1, 1, 1, 1,
-0.1452737, 1.531896, 1.578896, 1, 1, 1, 1, 1,
-0.1433196, 0.4979267, -1.661127, 1, 1, 1, 1, 1,
-0.1400628, -0.5484354, -5.325221, 1, 1, 1, 1, 1,
-0.1360707, 0.6794571, -2.222001, 0, 0, 1, 1, 1,
-0.1334899, 0.3855094, 0.1999778, 1, 0, 0, 1, 1,
-0.130983, -0.8928022, -3.255262, 1, 0, 0, 1, 1,
-0.1290392, -1.376853, -2.188402, 1, 0, 0, 1, 1,
-0.1248512, -1.063803, -3.741433, 1, 0, 0, 1, 1,
-0.1239102, 0.8655801, 1.328072, 1, 0, 0, 1, 1,
-0.1212298, 0.6756608, 0.3267394, 0, 0, 0, 1, 1,
-0.120641, -1.286132, -2.59647, 0, 0, 0, 1, 1,
-0.1183026, 0.1136368, -0.6350734, 0, 0, 0, 1, 1,
-0.1144266, -0.2905779, -4.133801, 0, 0, 0, 1, 1,
-0.1132881, -1.376142, -3.430667, 0, 0, 0, 1, 1,
-0.1119864, -0.07868897, -2.728784, 0, 0, 0, 1, 1,
-0.1097412, -2.445529, -3.130129, 0, 0, 0, 1, 1,
-0.1089071, -1.415586, -1.752377, 1, 1, 1, 1, 1,
-0.1065148, 1.640539, 0.3035994, 1, 1, 1, 1, 1,
-0.1044091, 0.819196, 1.203083, 1, 1, 1, 1, 1,
-0.09984888, 2.306958, 2.290857, 1, 1, 1, 1, 1,
-0.09539339, 2.63235, -0.06270795, 1, 1, 1, 1, 1,
-0.09290212, 1.11143, -1.094533, 1, 1, 1, 1, 1,
-0.09212133, 1.255277, -1.066836, 1, 1, 1, 1, 1,
-0.09075172, -1.18179, -2.378717, 1, 1, 1, 1, 1,
-0.09063926, -0.3282878, -3.937208, 1, 1, 1, 1, 1,
-0.0887226, 1.152376, 0.6486061, 1, 1, 1, 1, 1,
-0.07399265, -0.6335135, -4.397325, 1, 1, 1, 1, 1,
-0.07377134, -0.5275639, -1.360896, 1, 1, 1, 1, 1,
-0.07204736, 0.2149364, -2.711652, 1, 1, 1, 1, 1,
-0.06924286, -0.4834055, -2.719936, 1, 1, 1, 1, 1,
-0.06757299, 1.420403, -2.56529, 1, 1, 1, 1, 1,
-0.06622245, -1.241152, -2.795177, 0, 0, 1, 1, 1,
-0.06450347, 0.6825398, 0.1313344, 1, 0, 0, 1, 1,
-0.05413889, 0.5092043, 0.6464442, 1, 0, 0, 1, 1,
-0.05121817, 0.3838883, 0.3895905, 1, 0, 0, 1, 1,
-0.04289393, 0.03607048, -1.844665, 1, 0, 0, 1, 1,
-0.04275857, 0.4978333, -1.37171, 1, 0, 0, 1, 1,
-0.04058428, 0.6618162, -0.9669825, 0, 0, 0, 1, 1,
-0.03670862, -2.218967, -3.720758, 0, 0, 0, 1, 1,
-0.03607854, 0.1270118, 0.1688874, 0, 0, 0, 1, 1,
-0.03439746, 0.1424046, -0.329912, 0, 0, 0, 1, 1,
-0.03394833, -1.498034, -3.658098, 0, 0, 0, 1, 1,
-0.02971253, 0.453231, 0.02347841, 0, 0, 0, 1, 1,
-0.02876624, -0.2240202, -1.338645, 0, 0, 0, 1, 1,
-0.02845983, -1.484545, -3.29296, 1, 1, 1, 1, 1,
-0.01917852, 1.059107, 0.6981339, 1, 1, 1, 1, 1,
-0.01508147, 0.0777829, -1.39096, 1, 1, 1, 1, 1,
-0.01131945, 0.7117195, 0.4104349, 1, 1, 1, 1, 1,
-0.008939325, 1.152257, 0.7342823, 1, 1, 1, 1, 1,
0.0008037752, 1.710487, 0.09724747, 1, 1, 1, 1, 1,
0.005019919, 2.328981, 0.697576, 1, 1, 1, 1, 1,
0.005043516, -0.1455922, 4.236103, 1, 1, 1, 1, 1,
0.006437743, -1.134487, 4.779087, 1, 1, 1, 1, 1,
0.00649997, -0.07387879, 3.052257, 1, 1, 1, 1, 1,
0.007509473, 2.37496, 0.0271805, 1, 1, 1, 1, 1,
0.01041754, -0.6333761, 2.53093, 1, 1, 1, 1, 1,
0.01070128, -0.7900771, 3.39108, 1, 1, 1, 1, 1,
0.01506915, -0.8104443, 3.025477, 1, 1, 1, 1, 1,
0.02474353, 1.172174, -0.4896276, 1, 1, 1, 1, 1,
0.02818329, 0.433713, 0.2726565, 0, 0, 1, 1, 1,
0.02962135, -0.9850334, 3.585318, 1, 0, 0, 1, 1,
0.03006405, 0.9179252, 0.8234011, 1, 0, 0, 1, 1,
0.03499857, 1.293837, -0.1938059, 1, 0, 0, 1, 1,
0.03538986, 0.4320993, 0.432426, 1, 0, 0, 1, 1,
0.03702905, -2.543073, 4.582775, 1, 0, 0, 1, 1,
0.0376867, 1.464321, -0.7400641, 0, 0, 0, 1, 1,
0.04457882, -0.8351116, 3.503495, 0, 0, 0, 1, 1,
0.04736335, -0.9362183, 1.917155, 0, 0, 0, 1, 1,
0.04808898, -1.232246, 2.33002, 0, 0, 0, 1, 1,
0.0483738, 0.8712077, 0.1954369, 0, 0, 0, 1, 1,
0.05188852, 0.544139, -1.334601, 0, 0, 0, 1, 1,
0.05318657, 1.976609, 1.828009, 0, 0, 0, 1, 1,
0.05417246, -0.1840309, 3.438843, 1, 1, 1, 1, 1,
0.05549083, -1.5206, 2.841737, 1, 1, 1, 1, 1,
0.06436609, 0.4127858, -0.4776433, 1, 1, 1, 1, 1,
0.06491718, -0.1102951, 1.602754, 1, 1, 1, 1, 1,
0.06553371, -0.268706, 1.773904, 1, 1, 1, 1, 1,
0.0685371, -0.5351422, 3.264352, 1, 1, 1, 1, 1,
0.07387276, 1.02952, 1.051079, 1, 1, 1, 1, 1,
0.07413492, 2.24666, -2.165681, 1, 1, 1, 1, 1,
0.07710949, 0.7215124, -1.285391, 1, 1, 1, 1, 1,
0.07723156, 0.3412505, 1.05862, 1, 1, 1, 1, 1,
0.07835872, 2.221177, -0.4422383, 1, 1, 1, 1, 1,
0.08879488, -0.3234417, 1.582906, 1, 1, 1, 1, 1,
0.09011197, 0.2747186, 1.638923, 1, 1, 1, 1, 1,
0.0917161, 0.3899019, 0.1965765, 1, 1, 1, 1, 1,
0.09711266, -0.2055444, 1.278211, 1, 1, 1, 1, 1,
0.0974062, 0.1672479, 1.85464, 0, 0, 1, 1, 1,
0.09862128, 0.8950808, -0.4939422, 1, 0, 0, 1, 1,
0.1052418, 0.4338863, 0.3881471, 1, 0, 0, 1, 1,
0.1058938, -1.066287, 3.171737, 1, 0, 0, 1, 1,
0.1158973, 0.6685857, 0.5408544, 1, 0, 0, 1, 1,
0.1185674, 0.33378, -1.27768, 1, 0, 0, 1, 1,
0.119104, 0.4001249, -0.9730473, 0, 0, 0, 1, 1,
0.1222817, -0.9028696, 3.73078, 0, 0, 0, 1, 1,
0.1228541, 1.936318, 0.6504878, 0, 0, 0, 1, 1,
0.1242417, -0.6443802, 1.835613, 0, 0, 0, 1, 1,
0.128409, -0.7159808, 3.608179, 0, 0, 0, 1, 1,
0.1305553, -0.04043419, 1.271352, 0, 0, 0, 1, 1,
0.1316563, 0.4801406, 1.291894, 0, 0, 0, 1, 1,
0.1330942, 0.5788888, 0.9772906, 1, 1, 1, 1, 1,
0.1358036, 1.328003, -0.311772, 1, 1, 1, 1, 1,
0.1382429, 0.6590498, 1.435572, 1, 1, 1, 1, 1,
0.1395265, 1.109458, 0.1267507, 1, 1, 1, 1, 1,
0.1464882, 0.3771906, -1.183854, 1, 1, 1, 1, 1,
0.1497078, -0.154689, 2.410755, 1, 1, 1, 1, 1,
0.1563483, 0.07836797, 1.384065, 1, 1, 1, 1, 1,
0.162072, 1.065227, 0.2597435, 1, 1, 1, 1, 1,
0.1667478, 0.8504967, -0.247993, 1, 1, 1, 1, 1,
0.1709992, 0.1758542, 2.757561, 1, 1, 1, 1, 1,
0.1765871, -0.02804977, 1.266604, 1, 1, 1, 1, 1,
0.1800644, 0.209461, -0.1584686, 1, 1, 1, 1, 1,
0.1846313, -1.919021, 2.899327, 1, 1, 1, 1, 1,
0.1865349, 1.13286, -2.731402, 1, 1, 1, 1, 1,
0.186894, -0.1384138, 1.195094, 1, 1, 1, 1, 1,
0.1876195, 0.5817785, -0.5912029, 0, 0, 1, 1, 1,
0.1876506, 1.660691, -0.5931876, 1, 0, 0, 1, 1,
0.1884168, 0.4193069, -0.8213421, 1, 0, 0, 1, 1,
0.1891657, -0.05654213, 0.6569185, 1, 0, 0, 1, 1,
0.1897219, 1.85515, 0.6565462, 1, 0, 0, 1, 1,
0.1918521, 0.1012066, 2.063553, 1, 0, 0, 1, 1,
0.1951653, 0.943683, 0.02433147, 0, 0, 0, 1, 1,
0.1952788, 0.07647262, 2.056704, 0, 0, 0, 1, 1,
0.1965703, -1.849945, 1.267296, 0, 0, 0, 1, 1,
0.1969584, -0.4424505, 3.244105, 0, 0, 0, 1, 1,
0.1971855, -0.3680219, 1.926436, 0, 0, 0, 1, 1,
0.2012914, 0.5894786, 0.06810305, 0, 0, 0, 1, 1,
0.2031193, -0.6031443, 1.650065, 0, 0, 0, 1, 1,
0.2094421, -1.502917, 3.516351, 1, 1, 1, 1, 1,
0.2110296, -0.02862152, 0.8121287, 1, 1, 1, 1, 1,
0.2123947, 1.403304, -0.2060969, 1, 1, 1, 1, 1,
0.2136629, -0.3634171, 2.226372, 1, 1, 1, 1, 1,
0.2155513, -1.604665, 3.0709, 1, 1, 1, 1, 1,
0.2167136, 0.345648, 1.650199, 1, 1, 1, 1, 1,
0.2180536, -1.441213, 5.394505, 1, 1, 1, 1, 1,
0.2197803, 0.3247642, 0.1399179, 1, 1, 1, 1, 1,
0.2198167, 0.446225, 0.5390369, 1, 1, 1, 1, 1,
0.2208918, -0.8774475, 3.792963, 1, 1, 1, 1, 1,
0.2209271, 0.3138088, -0.6795957, 1, 1, 1, 1, 1,
0.2239895, -0.1133062, 3.073537, 1, 1, 1, 1, 1,
0.2335497, -0.8214059, 3.743321, 1, 1, 1, 1, 1,
0.2364453, -0.78093, 3.46148, 1, 1, 1, 1, 1,
0.237576, 0.3067589, -0.4634666, 1, 1, 1, 1, 1,
0.2437337, -0.1098517, 0.6922962, 0, 0, 1, 1, 1,
0.2476402, 1.234806, -0.1430807, 1, 0, 0, 1, 1,
0.2490492, -0.3161321, 1.553869, 1, 0, 0, 1, 1,
0.2503066, -1.248886, 2.695927, 1, 0, 0, 1, 1,
0.2507142, 0.2669105, 0.6849145, 1, 0, 0, 1, 1,
0.2549535, -2.195927, 4.041141, 1, 0, 0, 1, 1,
0.2561591, -1.546747, 3.746461, 0, 0, 0, 1, 1,
0.2563547, -0.6354989, 2.866095, 0, 0, 0, 1, 1,
0.2574775, -1.237993, 2.026749, 0, 0, 0, 1, 1,
0.2575697, -1.494962, 1.603692, 0, 0, 0, 1, 1,
0.2585107, 1.728379, 0.7389783, 0, 0, 0, 1, 1,
0.2591356, -1.308815, 2.704484, 0, 0, 0, 1, 1,
0.2641583, 0.4819589, 0.5792235, 0, 0, 0, 1, 1,
0.2665862, 1.27489, -0.1983816, 1, 1, 1, 1, 1,
0.2701149, 0.1106996, -1.306344, 1, 1, 1, 1, 1,
0.2726368, -0.7333798, 3.503894, 1, 1, 1, 1, 1,
0.2782063, -0.9903684, 1.9101, 1, 1, 1, 1, 1,
0.2821479, -1.341337, 4.210476, 1, 1, 1, 1, 1,
0.2858413, 0.4942944, 1.778004, 1, 1, 1, 1, 1,
0.2858441, -0.2678533, 1.5623, 1, 1, 1, 1, 1,
0.2862479, 0.3043312, 0.6823723, 1, 1, 1, 1, 1,
0.2887083, 0.2959523, 0.3334603, 1, 1, 1, 1, 1,
0.2914708, -1.857288, 3.276095, 1, 1, 1, 1, 1,
0.2975764, 1.105925, 1.792881, 1, 1, 1, 1, 1,
0.2998129, 0.6028044, 0.8250495, 1, 1, 1, 1, 1,
0.300352, 1.415863, 0.8881147, 1, 1, 1, 1, 1,
0.3005751, -0.6428227, 3.62433, 1, 1, 1, 1, 1,
0.3010124, -0.5976985, 2.998179, 1, 1, 1, 1, 1,
0.3070822, -0.5546664, 3.857526, 0, 0, 1, 1, 1,
0.3073447, -0.01314454, -0.33029, 1, 0, 0, 1, 1,
0.3113313, 0.07792591, 1.089103, 1, 0, 0, 1, 1,
0.3122008, 0.5572513, -1.206938, 1, 0, 0, 1, 1,
0.3129027, -0.2890384, 4.181187, 1, 0, 0, 1, 1,
0.3155248, -1.689763, 2.493529, 1, 0, 0, 1, 1,
0.3162501, -0.4232269, 1.950216, 0, 0, 0, 1, 1,
0.3184907, -0.222483, 2.994595, 0, 0, 0, 1, 1,
0.3190221, -0.07703479, 3.783991, 0, 0, 0, 1, 1,
0.3266248, 0.3287355, 0.3495861, 0, 0, 0, 1, 1,
0.3296491, 0.8695018, 1.27245, 0, 0, 0, 1, 1,
0.3310389, 0.5220741, 0.1156863, 0, 0, 0, 1, 1,
0.3365326, 2.117287, -0.1719691, 0, 0, 0, 1, 1,
0.3368707, 0.1204387, 0.2788911, 1, 1, 1, 1, 1,
0.3369841, -0.4218645, 3.32113, 1, 1, 1, 1, 1,
0.3372673, 0.4510832, 0.1616982, 1, 1, 1, 1, 1,
0.3376849, 0.5766931, 0.0600101, 1, 1, 1, 1, 1,
0.3441387, -0.5505246, 3.234567, 1, 1, 1, 1, 1,
0.3443779, 1.507149, -0.08906458, 1, 1, 1, 1, 1,
0.3536495, -0.7982152, 1.53608, 1, 1, 1, 1, 1,
0.3539626, -0.5877426, 3.719067, 1, 1, 1, 1, 1,
0.3582767, 0.06882796, 0.6584676, 1, 1, 1, 1, 1,
0.3618666, -0.3251321, 2.240791, 1, 1, 1, 1, 1,
0.3678351, 1.351398, 1.030051, 1, 1, 1, 1, 1,
0.3686217, -0.01523736, 0.6643204, 1, 1, 1, 1, 1,
0.3716557, 0.3005126, 0.2611025, 1, 1, 1, 1, 1,
0.3724702, -1.128453, 3.073445, 1, 1, 1, 1, 1,
0.37271, -0.1100556, 1.699792, 1, 1, 1, 1, 1,
0.3778194, -0.5318747, 4.469963, 0, 0, 1, 1, 1,
0.3791573, 0.1758246, 1.442321, 1, 0, 0, 1, 1,
0.3826918, -0.1856004, 1.640684, 1, 0, 0, 1, 1,
0.383865, -0.9167762, 2.359004, 1, 0, 0, 1, 1,
0.3864797, 2.534513, -0.9064069, 1, 0, 0, 1, 1,
0.3888647, -2.086885, 3.338616, 1, 0, 0, 1, 1,
0.389431, -1.838481, 5.522868, 0, 0, 0, 1, 1,
0.3910446, -2.003302, 2.802516, 0, 0, 0, 1, 1,
0.3949223, -0.415961, 2.264917, 0, 0, 0, 1, 1,
0.3971369, -0.516105, 3.122147, 0, 0, 0, 1, 1,
0.3987762, 0.8328766, -1.00034, 0, 0, 0, 1, 1,
0.3991957, -1.527081, 2.154219, 0, 0, 0, 1, 1,
0.4044351, -0.4175229, 2.653666, 0, 0, 0, 1, 1,
0.4050983, 0.9873342, -0.6234015, 1, 1, 1, 1, 1,
0.4112741, 0.193687, 3.274979, 1, 1, 1, 1, 1,
0.4114095, 0.3572657, -0.3806263, 1, 1, 1, 1, 1,
0.417018, -1.271202, 3.876305, 1, 1, 1, 1, 1,
0.4177153, -0.5188186, 2.713571, 1, 1, 1, 1, 1,
0.4190971, -0.5478411, 2.177994, 1, 1, 1, 1, 1,
0.424164, -0.9140722, 5.050065, 1, 1, 1, 1, 1,
0.4283298, -0.8971916, 0.9679159, 1, 1, 1, 1, 1,
0.4367056, 0.4482914, 0.5721165, 1, 1, 1, 1, 1,
0.4371994, 0.8718812, -0.1122021, 1, 1, 1, 1, 1,
0.4375427, 0.2696123, 4.193082, 1, 1, 1, 1, 1,
0.4421484, -1.417418, 2.55694, 1, 1, 1, 1, 1,
0.4432141, -0.5633461, 1.440696, 1, 1, 1, 1, 1,
0.4452833, 0.4393939, 2.059504, 1, 1, 1, 1, 1,
0.4468122, 2.221209, -2.138198, 1, 1, 1, 1, 1,
0.4485644, 0.1158393, 1.707606, 0, 0, 1, 1, 1,
0.4501542, 0.3811403, 1.189344, 1, 0, 0, 1, 1,
0.4612004, -1.485812, 3.19632, 1, 0, 0, 1, 1,
0.4614297, -0.492002, 1.523533, 1, 0, 0, 1, 1,
0.4645567, 1.317255, 0.3018805, 1, 0, 0, 1, 1,
0.4665567, 0.2110159, 1.017283, 1, 0, 0, 1, 1,
0.467711, -0.4601288, 2.534724, 0, 0, 0, 1, 1,
0.4726991, -2.701275, 1.750143, 0, 0, 0, 1, 1,
0.4738965, -1.664685, 3.820369, 0, 0, 0, 1, 1,
0.4779887, 1.531397, -1.136574, 0, 0, 0, 1, 1,
0.4818999, 0.582145, 1.358113, 0, 0, 0, 1, 1,
0.4829499, -1.270034, 2.559124, 0, 0, 0, 1, 1,
0.4851248, 0.300674, -0.7553312, 0, 0, 0, 1, 1,
0.4852011, 2.919216, -0.6642157, 1, 1, 1, 1, 1,
0.4879218, 0.7935315, 2.556036, 1, 1, 1, 1, 1,
0.4896824, -0.8371683, 3.386185, 1, 1, 1, 1, 1,
0.4990361, -0.1241496, 2.765531, 1, 1, 1, 1, 1,
0.5002793, -2.230237, 3.607481, 1, 1, 1, 1, 1,
0.5006872, 1.238482, -0.2415877, 1, 1, 1, 1, 1,
0.5016105, -0.1691258, 0.6442977, 1, 1, 1, 1, 1,
0.5029295, -1.150131, 2.184665, 1, 1, 1, 1, 1,
0.5037429, -1.052566, 1.219209, 1, 1, 1, 1, 1,
0.5044062, 1.185785, -1.174392, 1, 1, 1, 1, 1,
0.5109274, 0.9270238, -0.9311554, 1, 1, 1, 1, 1,
0.5116318, 1.003011, -0.6656355, 1, 1, 1, 1, 1,
0.5127636, 0.09884133, 0.8832051, 1, 1, 1, 1, 1,
0.5133884, 1.035616, 1.21579, 1, 1, 1, 1, 1,
0.5216945, 0.8822916, 0.2594746, 1, 1, 1, 1, 1,
0.5228962, -1.090807, 2.41825, 0, 0, 1, 1, 1,
0.5234886, -0.7215379, 2.90489, 1, 0, 0, 1, 1,
0.5282917, -0.8646507, 2.405896, 1, 0, 0, 1, 1,
0.5380964, 0.2155164, 0.9199848, 1, 0, 0, 1, 1,
0.5406748, 0.09950125, 2.312706, 1, 0, 0, 1, 1,
0.5456584, 0.6458361, 1.689836, 1, 0, 0, 1, 1,
0.549053, -0.6720538, 2.251658, 0, 0, 0, 1, 1,
0.5540851, -1.775778, 3.282219, 0, 0, 0, 1, 1,
0.5558324, -0.03596813, 0.06610677, 0, 0, 0, 1, 1,
0.5564452, 0.4818916, 1.639389, 0, 0, 0, 1, 1,
0.5627851, 0.1420136, 3.033059, 0, 0, 0, 1, 1,
0.5637084, 1.201939, 0.7876849, 0, 0, 0, 1, 1,
0.5676333, 1.340393, 0.5866526, 0, 0, 0, 1, 1,
0.5732097, -0.8094696, 1.587672, 1, 1, 1, 1, 1,
0.5749236, 0.2977749, 1.332353, 1, 1, 1, 1, 1,
0.5751494, -1.113627, 3.613012, 1, 1, 1, 1, 1,
0.5816522, -1.307671, 2.402237, 1, 1, 1, 1, 1,
0.5900223, 1.916499, -1.033326, 1, 1, 1, 1, 1,
0.5926212, -0.8167502, 1.667283, 1, 1, 1, 1, 1,
0.5937274, 1.313086, 1.403404, 1, 1, 1, 1, 1,
0.5943741, 1.544269, 0.8566743, 1, 1, 1, 1, 1,
0.5980643, -0.5719289, 2.453366, 1, 1, 1, 1, 1,
0.6017783, -1.262902, 3.308501, 1, 1, 1, 1, 1,
0.602065, -1.163351, 3.89572, 1, 1, 1, 1, 1,
0.6021569, -0.9322668, 0.193651, 1, 1, 1, 1, 1,
0.6022123, 1.015226, 2.940101, 1, 1, 1, 1, 1,
0.6068265, 0.05710774, 2.207749, 1, 1, 1, 1, 1,
0.6101161, 0.8470917, -0.02628486, 1, 1, 1, 1, 1,
0.6105562, -0.5579225, 1.885967, 0, 0, 1, 1, 1,
0.6213278, -0.4079302, 4.556929, 1, 0, 0, 1, 1,
0.6246451, 0.5902789, 1.21159, 1, 0, 0, 1, 1,
0.6259616, 0.8795274, -0.003430372, 1, 0, 0, 1, 1,
0.6319627, -0.7040308, 3.307812, 1, 0, 0, 1, 1,
0.6338034, -1.882173, 2.213148, 1, 0, 0, 1, 1,
0.6342957, -0.7777127, 2.146965, 0, 0, 0, 1, 1,
0.6380176, 1.15733, 1.636604, 0, 0, 0, 1, 1,
0.6423141, 0.3351377, 1.104873, 0, 0, 0, 1, 1,
0.6453212, -0.01758765, 0.4520212, 0, 0, 0, 1, 1,
0.6539082, 0.03321724, 0.2009255, 0, 0, 0, 1, 1,
0.6581798, 1.133371, -0.7658865, 0, 0, 0, 1, 1,
0.669349, -0.4416152, 0.3897977, 0, 0, 0, 1, 1,
0.6725804, -0.8851284, 3.691673, 1, 1, 1, 1, 1,
0.6788912, 0.184599, 1.090775, 1, 1, 1, 1, 1,
0.6846552, 0.5731578, 0.7238892, 1, 1, 1, 1, 1,
0.6856194, -1.10156, 2.25625, 1, 1, 1, 1, 1,
0.6958076, -0.7026318, 2.044713, 1, 1, 1, 1, 1,
0.6976784, 1.373721, -0.2720728, 1, 1, 1, 1, 1,
0.6998122, 0.3973477, 1.461065, 1, 1, 1, 1, 1,
0.7028944, -0.3387863, 2.502617, 1, 1, 1, 1, 1,
0.7035832, -0.7946446, 2.347671, 1, 1, 1, 1, 1,
0.7050084, 0.8249145, 1.252896, 1, 1, 1, 1, 1,
0.7126397, -0.7836936, 4.461709, 1, 1, 1, 1, 1,
0.7246413, 0.1794598, 1.255272, 1, 1, 1, 1, 1,
0.7292441, -0.01591695, 1.898342, 1, 1, 1, 1, 1,
0.7320947, -0.327524, 1.592922, 1, 1, 1, 1, 1,
0.7346255, 0.5104405, 1.505149, 1, 1, 1, 1, 1,
0.7348461, -1.086596, 2.814471, 0, 0, 1, 1, 1,
0.7436218, 0.6233202, 0.5262954, 1, 0, 0, 1, 1,
0.7461539, -0.9774601, 2.723657, 1, 0, 0, 1, 1,
0.7475588, 0.1081846, 1.989762, 1, 0, 0, 1, 1,
0.7487218, 0.144963, 1.311804, 1, 0, 0, 1, 1,
0.7511712, -0.5640435, 2.390185, 1, 0, 0, 1, 1,
0.7527544, 0.9221491, 2.937848, 0, 0, 0, 1, 1,
0.7548444, 0.2070661, 3.294767, 0, 0, 0, 1, 1,
0.756101, -0.5588673, 3.611511, 0, 0, 0, 1, 1,
0.7574427, 2.117982, -0.8909911, 0, 0, 0, 1, 1,
0.7586383, 0.2917815, 1.376878, 0, 0, 0, 1, 1,
0.7603339, -0.03885843, 3.231087, 0, 0, 0, 1, 1,
0.7639983, 1.73276, -0.9905944, 0, 0, 0, 1, 1,
0.7670081, -0.9604425, 3.244963, 1, 1, 1, 1, 1,
0.7740368, -0.4079643, 2.761955, 1, 1, 1, 1, 1,
0.7782977, 1.650423, 0.4036282, 1, 1, 1, 1, 1,
0.7817677, 0.1963042, 1.453356, 1, 1, 1, 1, 1,
0.788418, 0.06008722, 1.61343, 1, 1, 1, 1, 1,
0.794199, -1.396409, 2.554192, 1, 1, 1, 1, 1,
0.7967484, -1.090628, 3.818394, 1, 1, 1, 1, 1,
0.7971169, -0.3474539, 2.950292, 1, 1, 1, 1, 1,
0.7978, -0.8816029, 2.637937, 1, 1, 1, 1, 1,
0.8001699, 0.3197705, -1.287351, 1, 1, 1, 1, 1,
0.8039593, -0.569614, 4.274398, 1, 1, 1, 1, 1,
0.805132, -0.1086804, 1.85543, 1, 1, 1, 1, 1,
0.8069009, 1.1046, 0.494886, 1, 1, 1, 1, 1,
0.8089694, -0.289371, 1.315114, 1, 1, 1, 1, 1,
0.8123346, -0.01761625, 2.400606, 1, 1, 1, 1, 1,
0.8151665, -1.560216, 2.96408, 0, 0, 1, 1, 1,
0.8207082, 1.007911, 0.1547755, 1, 0, 0, 1, 1,
0.8289276, 0.75318, 1.120956, 1, 0, 0, 1, 1,
0.8326278, 0.3369312, 2.258747, 1, 0, 0, 1, 1,
0.8342811, 0.5499846, -0.4016553, 1, 0, 0, 1, 1,
0.8366761, -0.628807, 3.04162, 1, 0, 0, 1, 1,
0.841588, -0.524488, 1.720536, 0, 0, 0, 1, 1,
0.8424129, -1.352008, 1.82372, 0, 0, 0, 1, 1,
0.8460122, 0.9580703, 0.4081643, 0, 0, 0, 1, 1,
0.8491967, 0.3498694, 1.597417, 0, 0, 0, 1, 1,
0.8494789, 1.144159, 0.02339021, 0, 0, 0, 1, 1,
0.8535816, -0.7763385, 2.542794, 0, 0, 0, 1, 1,
0.8540173, 0.5650083, -0.140935, 0, 0, 0, 1, 1,
0.8557564, -0.204966, 2.819696, 1, 1, 1, 1, 1,
0.8592522, -1.040776, 1.608401, 1, 1, 1, 1, 1,
0.8598136, -0.5893198, 2.256692, 1, 1, 1, 1, 1,
0.8606621, -0.7567878, 3.298719, 1, 1, 1, 1, 1,
0.8607081, 0.1694492, 1.522367, 1, 1, 1, 1, 1,
0.8609281, -0.2055944, 2.486966, 1, 1, 1, 1, 1,
0.863961, 0.9165492, -0.2594756, 1, 1, 1, 1, 1,
0.8671105, 1.336989, 1.334411, 1, 1, 1, 1, 1,
0.8695714, 1.313226, -0.429045, 1, 1, 1, 1, 1,
0.8835801, 1.5747, 0.544664, 1, 1, 1, 1, 1,
0.888756, 0.475574, 1.149153, 1, 1, 1, 1, 1,
0.8933939, 0.003579396, 0.38684, 1, 1, 1, 1, 1,
0.8955092, 1.240229, -0.5360292, 1, 1, 1, 1, 1,
0.8960239, 1.395974, 0.2289025, 1, 1, 1, 1, 1,
0.8972734, 0.576354, 0.8925341, 1, 1, 1, 1, 1,
0.9070653, 0.1704335, -0.2322696, 0, 0, 1, 1, 1,
0.9073695, -0.4176332, 0.9523869, 1, 0, 0, 1, 1,
0.9114769, 0.8857282, 1.297406, 1, 0, 0, 1, 1,
0.9289547, -0.2074683, 1.921266, 1, 0, 0, 1, 1,
0.9376861, -0.4483911, 1.633529, 1, 0, 0, 1, 1,
0.9389091, 0.2201984, 0.5703886, 1, 0, 0, 1, 1,
0.940252, 1.327263, 0.2213821, 0, 0, 0, 1, 1,
0.9461269, 1.032172, -0.3327999, 0, 0, 0, 1, 1,
0.9562742, 1.643353, 1.439748, 0, 0, 0, 1, 1,
0.9565744, -1.061569, 4.009748, 0, 0, 0, 1, 1,
0.9580613, 0.8746601, 1.264434, 0, 0, 0, 1, 1,
0.9588888, -0.3411556, 0.2793396, 0, 0, 0, 1, 1,
0.9662004, 0.1529821, 1.341659, 0, 0, 0, 1, 1,
0.9665786, 0.267898, 0.959819, 1, 1, 1, 1, 1,
0.9764772, -1.791193, 2.226631, 1, 1, 1, 1, 1,
0.9788398, -0.4421828, 1.880715, 1, 1, 1, 1, 1,
0.9841291, -0.4101192, 1.279052, 1, 1, 1, 1, 1,
0.9871427, 0.6264806, 0.8750104, 1, 1, 1, 1, 1,
0.9911224, 1.321026, -0.7689307, 1, 1, 1, 1, 1,
1.002969, 0.7079734, 0.758849, 1, 1, 1, 1, 1,
1.003973, -0.9386203, 3.003127, 1, 1, 1, 1, 1,
1.011856, 0.1932161, 1.262773, 1, 1, 1, 1, 1,
1.018033, -0.4860785, 0.9842355, 1, 1, 1, 1, 1,
1.019765, -0.2668151, 1.881469, 1, 1, 1, 1, 1,
1.020129, 0.4914109, 0.524684, 1, 1, 1, 1, 1,
1.025993, -0.01269467, 0.4205568, 1, 1, 1, 1, 1,
1.028277, 0.9689242, 0.1927348, 1, 1, 1, 1, 1,
1.028462, 0.07212104, 1.008023, 1, 1, 1, 1, 1,
1.030038, -0.9604149, 1.609984, 0, 0, 1, 1, 1,
1.031622, -0.1867302, 2.402338, 1, 0, 0, 1, 1,
1.034845, -0.7041497, 0.9046742, 1, 0, 0, 1, 1,
1.040285, -0.7189555, 2.197785, 1, 0, 0, 1, 1,
1.041629, -0.4168499, 1.858537, 1, 0, 0, 1, 1,
1.042073, -0.003588406, 0.4975091, 1, 0, 0, 1, 1,
1.042557, -1.146835, 1.66667, 0, 0, 0, 1, 1,
1.044173, 1.022095, 0.9646274, 0, 0, 0, 1, 1,
1.04506, -0.1173454, 1.868537, 0, 0, 0, 1, 1,
1.047056, 0.2590799, 2.614691, 0, 0, 0, 1, 1,
1.047168, -0.9098111, 1.874901, 0, 0, 0, 1, 1,
1.047239, -0.9635761, 1.216299, 0, 0, 0, 1, 1,
1.048676, 0.2653971, -0.3799753, 0, 0, 0, 1, 1,
1.048839, 0.2134343, 1.398657, 1, 1, 1, 1, 1,
1.059886, 0.6774163, 2.230019, 1, 1, 1, 1, 1,
1.061586, 0.495801, 1.040723, 1, 1, 1, 1, 1,
1.064838, -1.021317, 3.686755, 1, 1, 1, 1, 1,
1.065316, 1.128328, 1.903366, 1, 1, 1, 1, 1,
1.068105, -0.816164, 2.917024, 1, 1, 1, 1, 1,
1.068529, -2.00872, 4.177474, 1, 1, 1, 1, 1,
1.077929, 1.322372, 1.186798, 1, 1, 1, 1, 1,
1.084903, -0.3504055, 1.955619, 1, 1, 1, 1, 1,
1.084903, 1.113641, 1.014717, 1, 1, 1, 1, 1,
1.097739, 0.2275697, 2.737535, 1, 1, 1, 1, 1,
1.099108, -0.1502521, 3.263939, 1, 1, 1, 1, 1,
1.100348, 0.2148309, 0.9496717, 1, 1, 1, 1, 1,
1.107167, 0.291603, 1.469045, 1, 1, 1, 1, 1,
1.115165, 0.6474267, 2.458324, 1, 1, 1, 1, 1,
1.120886, 1.098416, 1.802633, 0, 0, 1, 1, 1,
1.122412, -0.4264796, 3.231974, 1, 0, 0, 1, 1,
1.128083, -0.1778658, 3.339432, 1, 0, 0, 1, 1,
1.130908, -0.1702068, 2.122816, 1, 0, 0, 1, 1,
1.135958, 0.08209303, 2.510972, 1, 0, 0, 1, 1,
1.140514, 0.5077617, -0.01138686, 1, 0, 0, 1, 1,
1.143986, -1.200408, 2.414459, 0, 0, 0, 1, 1,
1.14645, 0.2322077, 2.0261, 0, 0, 0, 1, 1,
1.161573, -1.678401, 2.126896, 0, 0, 0, 1, 1,
1.173883, 0.9932948, -1.55817, 0, 0, 0, 1, 1,
1.179481, 0.2133081, 3.271817, 0, 0, 0, 1, 1,
1.180441, 1.088482, 0.9792979, 0, 0, 0, 1, 1,
1.182201, 0.6235505, 0.6504878, 0, 0, 0, 1, 1,
1.195603, 1.427037, -0.851607, 1, 1, 1, 1, 1,
1.196325, 2.350816, 1.01423, 1, 1, 1, 1, 1,
1.198246, 2.387505, 0.9054557, 1, 1, 1, 1, 1,
1.205112, 0.3755601, 2.114586, 1, 1, 1, 1, 1,
1.210864, 0.4054997, 0.7806745, 1, 1, 1, 1, 1,
1.213166, 0.09860864, 2.526935, 1, 1, 1, 1, 1,
1.215036, -0.3382729, 0.7047184, 1, 1, 1, 1, 1,
1.215145, -0.6926241, 3.088776, 1, 1, 1, 1, 1,
1.215228, 0.4074256, 1.221369, 1, 1, 1, 1, 1,
1.221497, -1.027836, 3.215683, 1, 1, 1, 1, 1,
1.22368, -0.2152859, -0.9387282, 1, 1, 1, 1, 1,
1.230687, -0.6739051, 2.808314, 1, 1, 1, 1, 1,
1.238868, -1.256604, 2.992474, 1, 1, 1, 1, 1,
1.240755, -0.4918844, 0.5708505, 1, 1, 1, 1, 1,
1.242875, -0.212233, 2.688937, 1, 1, 1, 1, 1,
1.243011, 1.427626, -1.244413, 0, 0, 1, 1, 1,
1.243846, -0.5011559, 4.246817, 1, 0, 0, 1, 1,
1.246352, -0.2506667, 0.6737249, 1, 0, 0, 1, 1,
1.248939, -0.7241244, 2.360037, 1, 0, 0, 1, 1,
1.264175, -0.984292, 1.911064, 1, 0, 0, 1, 1,
1.266823, 2.412835, 1.913828, 1, 0, 0, 1, 1,
1.270597, -0.9737911, 0.537983, 0, 0, 0, 1, 1,
1.27088, -0.5993285, 2.155858, 0, 0, 0, 1, 1,
1.272837, 0.6422048, 1.448552, 0, 0, 0, 1, 1,
1.274372, -1.87756, 2.937334, 0, 0, 0, 1, 1,
1.276584, -1.863052, 3.220838, 0, 0, 0, 1, 1,
1.277522, 0.6081346, -0.07792815, 0, 0, 0, 1, 1,
1.296948, -2.370159, 2.491986, 0, 0, 0, 1, 1,
1.298015, -1.028028, 0.4372673, 1, 1, 1, 1, 1,
1.29993, 1.619791, 0.7480943, 1, 1, 1, 1, 1,
1.304768, -0.4747187, 2.139751, 1, 1, 1, 1, 1,
1.306181, 0.6097211, 3.213345, 1, 1, 1, 1, 1,
1.30877, 0.9972886, 0.2207941, 1, 1, 1, 1, 1,
1.340367, -0.06068802, 0.9403113, 1, 1, 1, 1, 1,
1.345262, -0.04547443, 3.861775, 1, 1, 1, 1, 1,
1.347918, 0.7468218, 1.525057, 1, 1, 1, 1, 1,
1.350565, 0.1955202, 0.2023933, 1, 1, 1, 1, 1,
1.372561, -0.4388419, 0.8721922, 1, 1, 1, 1, 1,
1.376081, -0.9735903, 3.302137, 1, 1, 1, 1, 1,
1.376541, 2.229674, 1.506715, 1, 1, 1, 1, 1,
1.378783, 1.007639, 0.5013983, 1, 1, 1, 1, 1,
1.38074, 0.7400735, 0.6482021, 1, 1, 1, 1, 1,
1.39746, -1.973802, 2.441015, 1, 1, 1, 1, 1,
1.397932, 0.9281069, -0.51191, 0, 0, 1, 1, 1,
1.40272, 1.912956, 1.840274, 1, 0, 0, 1, 1,
1.403982, 0.5847383, 1.352149, 1, 0, 0, 1, 1,
1.407078, -1.359654, 3.033288, 1, 0, 0, 1, 1,
1.408516, 1.229962, 0.3851903, 1, 0, 0, 1, 1,
1.409667, 0.9598319, 1.685276, 1, 0, 0, 1, 1,
1.424793, -0.9367242, -0.2361159, 0, 0, 0, 1, 1,
1.428357, -1.045831, 3.90809, 0, 0, 0, 1, 1,
1.430128, -0.970318, 2.952292, 0, 0, 0, 1, 1,
1.430734, -0.7856181, 0.8787816, 0, 0, 0, 1, 1,
1.436313, 0.6092002, 2.135953, 0, 0, 0, 1, 1,
1.440668, -1.28458, 2.003234, 0, 0, 0, 1, 1,
1.443601, 1.211283, 0.9553126, 0, 0, 0, 1, 1,
1.45457, 0.3903375, 1.928014, 1, 1, 1, 1, 1,
1.472791, 0.8365582, 0.01504781, 1, 1, 1, 1, 1,
1.474403, -0.1803686, 1.540336, 1, 1, 1, 1, 1,
1.475802, -0.1046238, 1.462317, 1, 1, 1, 1, 1,
1.479926, 0.9020997, 0.8939928, 1, 1, 1, 1, 1,
1.511634, 1.811532, 0.5065602, 1, 1, 1, 1, 1,
1.517572, 0.8371755, 1.254504, 1, 1, 1, 1, 1,
1.521973, 0.5659435, 1.135645, 1, 1, 1, 1, 1,
1.529755, -0.9036525, 1.503116, 1, 1, 1, 1, 1,
1.539532, -0.5137312, 1.713525, 1, 1, 1, 1, 1,
1.540526, 0.2204757, 1.94966, 1, 1, 1, 1, 1,
1.544835, 1.429819, 3.095248, 1, 1, 1, 1, 1,
1.549878, -0.3177338, 0.06551982, 1, 1, 1, 1, 1,
1.558339, 0.01534732, 0.8044294, 1, 1, 1, 1, 1,
1.560702, -1.279823, 0.3892518, 1, 1, 1, 1, 1,
1.56581, 1.303365, -0.5270246, 0, 0, 1, 1, 1,
1.592409, -0.3832112, 0.5091073, 1, 0, 0, 1, 1,
1.605123, 0.1154044, 1.759287, 1, 0, 0, 1, 1,
1.61675, -0.3841137, 2.148804, 1, 0, 0, 1, 1,
1.618541, -1.473003, 1.933506, 1, 0, 0, 1, 1,
1.629969, 0.291218, 2.025469, 1, 0, 0, 1, 1,
1.630353, -0.3883792, 1.106579, 0, 0, 0, 1, 1,
1.630626, 0.6600203, -1.505796, 0, 0, 0, 1, 1,
1.643943, 0.634988, -0.8066785, 0, 0, 0, 1, 1,
1.672297, -0.5724943, 1.051904, 0, 0, 0, 1, 1,
1.674195, -0.9585221, 2.86635, 0, 0, 0, 1, 1,
1.678117, 1.04633, -0.8321562, 0, 0, 0, 1, 1,
1.684984, -0.5085663, 0.3700253, 0, 0, 0, 1, 1,
1.70852, -0.2876535, 1.198425, 1, 1, 1, 1, 1,
1.711959, 0.6073417, 2.036504, 1, 1, 1, 1, 1,
1.712186, 0.8337309, 1.903382, 1, 1, 1, 1, 1,
1.726452, 0.1600858, 1.629436, 1, 1, 1, 1, 1,
1.745024, -0.7997499, 2.034978, 1, 1, 1, 1, 1,
1.747267, 0.2727672, 2.013216, 1, 1, 1, 1, 1,
1.747318, -0.8283418, 0.6338096, 1, 1, 1, 1, 1,
1.759218, -0.1313627, 2.368947, 1, 1, 1, 1, 1,
1.775918, 0.1598336, 1.617997, 1, 1, 1, 1, 1,
1.791807, -2.861308, 2.525171, 1, 1, 1, 1, 1,
1.816747, -0.3563211, 1.16271, 1, 1, 1, 1, 1,
1.820309, -1.71517, 2.833782, 1, 1, 1, 1, 1,
1.843887, 0.2478863, 1.401067, 1, 1, 1, 1, 1,
1.870814, 0.09807073, 2.013604, 1, 1, 1, 1, 1,
1.887778, 0.3948115, 0.6948856, 1, 1, 1, 1, 1,
1.902199, 0.5521827, 1.777271, 0, 0, 1, 1, 1,
1.90695, -0.1343759, 2.349632, 1, 0, 0, 1, 1,
1.915159, -0.9707233, 1.306525, 1, 0, 0, 1, 1,
2.029055, 0.3882028, 0.7103171, 1, 0, 0, 1, 1,
2.06328, 1.261695, 1.113695, 1, 0, 0, 1, 1,
2.083081, -0.5136232, 2.741491, 1, 0, 0, 1, 1,
2.137783, -0.4216376, 0.7351909, 0, 0, 0, 1, 1,
2.215448, -0.882184, 1.37363, 0, 0, 0, 1, 1,
2.217069, 0.05501714, 1.658349, 0, 0, 0, 1, 1,
2.23114, 1.88392, 1.333505, 0, 0, 0, 1, 1,
2.338699, 0.1772696, 1.29111, 0, 0, 0, 1, 1,
2.384943, 0.2469868, 1.404845, 0, 0, 0, 1, 1,
2.506176, -1.810879, 2.949523, 0, 0, 0, 1, 1,
2.540767, -2.062473, 2.605665, 1, 1, 1, 1, 1,
2.546834, -0.0125339, 2.4119, 1, 1, 1, 1, 1,
2.640841, 1.213576, 3.074645, 1, 1, 1, 1, 1,
2.662056, 0.3640029, 1.689724, 1, 1, 1, 1, 1,
2.805974, -1.069039, 0.7689896, 1, 1, 1, 1, 1,
3.077002, 1.185527, 1.135945, 1, 1, 1, 1, 1,
3.122368, -0.9195775, 1.701748, 1, 1, 1, 1, 1
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
var radius = 9.979197;
var distance = 35.0515;
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
mvMatrix.translate( 0.371619, -0.02028549, 0.3257494 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.0515);
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
