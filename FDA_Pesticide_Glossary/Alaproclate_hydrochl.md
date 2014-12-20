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
-3.284934, 0.6261933, -1.074063, 1, 0, 0, 1,
-2.888263, -0.5083642, -2.666541, 1, 0.007843138, 0, 1,
-2.799474, -0.1565609, -2.206603, 1, 0.01176471, 0, 1,
-2.770606, -0.9882879, -1.093813, 1, 0.01960784, 0, 1,
-2.607463, 0.2469399, -0.2762377, 1, 0.02352941, 0, 1,
-2.525291, 0.8856196, -1.368133, 1, 0.03137255, 0, 1,
-2.471184, 1.212738, -1.514608, 1, 0.03529412, 0, 1,
-2.398029, -0.5453568, -2.848788, 1, 0.04313726, 0, 1,
-2.381747, -0.480886, -1.560552, 1, 0.04705882, 0, 1,
-2.340513, -0.6359286, -2.31327, 1, 0.05490196, 0, 1,
-2.295949, -1.991487, -3.867642, 1, 0.05882353, 0, 1,
-2.281378, 1.467034, -1.460714, 1, 0.06666667, 0, 1,
-2.246228, 1.372362, -1.728873, 1, 0.07058824, 0, 1,
-2.166103, -0.4731944, -3.346512, 1, 0.07843138, 0, 1,
-2.101164, -1.01809, -2.853275, 1, 0.08235294, 0, 1,
-2.085778, -1.266391, -4.415961, 1, 0.09019608, 0, 1,
-2.071048, -0.4461091, -1.556075, 1, 0.09411765, 0, 1,
-2.063463, -0.7466221, -1.799606, 1, 0.1019608, 0, 1,
-2.053061, -0.752198, -2.03177, 1, 0.1098039, 0, 1,
-2.015273, 0.4816979, -0.8262902, 1, 0.1137255, 0, 1,
-2.014994, 0.2798706, 1.002775, 1, 0.1215686, 0, 1,
-2.002873, 3.061594, -0.3164427, 1, 0.1254902, 0, 1,
-1.943071, -0.3051549, -2.229945, 1, 0.1333333, 0, 1,
-1.940181, -0.5262524, -0.2680828, 1, 0.1372549, 0, 1,
-1.929696, 0.6911845, -0.7631668, 1, 0.145098, 0, 1,
-1.909925, -3.329572, -2.347628, 1, 0.1490196, 0, 1,
-1.894795, 0.4471027, -0.3186278, 1, 0.1568628, 0, 1,
-1.893137, 1.884373, 0.4295279, 1, 0.1607843, 0, 1,
-1.862522, -0.371668, -2.255183, 1, 0.1686275, 0, 1,
-1.859737, 0.2160026, -1.782421, 1, 0.172549, 0, 1,
-1.832763, -1.260861, -2.766962, 1, 0.1803922, 0, 1,
-1.821164, 0.8663175, -1.000121, 1, 0.1843137, 0, 1,
-1.784604, 0.1148777, 0.5107648, 1, 0.1921569, 0, 1,
-1.768561, 0.2519158, -1.875389, 1, 0.1960784, 0, 1,
-1.759614, 1.299411, 0.6560401, 1, 0.2039216, 0, 1,
-1.75509, 0.457882, -1.742506, 1, 0.2117647, 0, 1,
-1.751064, 0.3766198, -1.68766, 1, 0.2156863, 0, 1,
-1.724563, 1.392074, -0.9826666, 1, 0.2235294, 0, 1,
-1.722232, 0.533322, -1.631145, 1, 0.227451, 0, 1,
-1.718333, -0.7198163, -3.092532, 1, 0.2352941, 0, 1,
-1.703606, -0.7927255, -1.374699, 1, 0.2392157, 0, 1,
-1.694797, -0.117576, -1.590019, 1, 0.2470588, 0, 1,
-1.659147, 0.5087987, -3.575993, 1, 0.2509804, 0, 1,
-1.649638, 0.5213352, -1.613094, 1, 0.2588235, 0, 1,
-1.633097, 0.2152889, -0.1210792, 1, 0.2627451, 0, 1,
-1.631571, 0.5934705, -0.8174767, 1, 0.2705882, 0, 1,
-1.628775, -0.2117593, -0.07139445, 1, 0.2745098, 0, 1,
-1.624976, -0.5217459, -1.092875, 1, 0.282353, 0, 1,
-1.621333, 0.2518649, -2.288531, 1, 0.2862745, 0, 1,
-1.604213, 0.02111365, -1.342625, 1, 0.2941177, 0, 1,
-1.595076, -3.208485, -1.738821, 1, 0.3019608, 0, 1,
-1.5928, 0.670298, -1.176449, 1, 0.3058824, 0, 1,
-1.576818, 0.4164311, -1.975328, 1, 0.3137255, 0, 1,
-1.573276, -0.7062247, -2.715029, 1, 0.3176471, 0, 1,
-1.572936, 0.06403317, -1.985774, 1, 0.3254902, 0, 1,
-1.571837, 0.845951, 0.5230688, 1, 0.3294118, 0, 1,
-1.565601, -0.0166634, -0.8498807, 1, 0.3372549, 0, 1,
-1.561689, -0.4658692, -2.398018, 1, 0.3411765, 0, 1,
-1.55961, -1.189649, -2.185285, 1, 0.3490196, 0, 1,
-1.557972, -0.5604159, -1.73471, 1, 0.3529412, 0, 1,
-1.553514, -0.4851652, -3.639624, 1, 0.3607843, 0, 1,
-1.55094, 0.3159246, -0.4484278, 1, 0.3647059, 0, 1,
-1.54858, 0.4797805, -2.27117, 1, 0.372549, 0, 1,
-1.537199, 0.9329568, -0.2982658, 1, 0.3764706, 0, 1,
-1.535383, 0.7987928, -0.8188762, 1, 0.3843137, 0, 1,
-1.527381, 1.277682, -1.54019, 1, 0.3882353, 0, 1,
-1.526406, -0.005546859, -1.895835, 1, 0.3960784, 0, 1,
-1.526217, 0.2590902, -1.565087, 1, 0.4039216, 0, 1,
-1.524235, -1.80945, -3.617549, 1, 0.4078431, 0, 1,
-1.516701, 1.827871, -1.122698, 1, 0.4156863, 0, 1,
-1.499133, -0.9885449, -1.920271, 1, 0.4196078, 0, 1,
-1.492458, -0.8060121, -1.595946, 1, 0.427451, 0, 1,
-1.489853, -0.8556738, -1.65203, 1, 0.4313726, 0, 1,
-1.488061, -1.875906, -2.661011, 1, 0.4392157, 0, 1,
-1.487975, 1.728045, 0.4043473, 1, 0.4431373, 0, 1,
-1.479817, -0.7260421, -2.608403, 1, 0.4509804, 0, 1,
-1.479208, 0.5516164, -0.1272141, 1, 0.454902, 0, 1,
-1.479171, 0.2607749, -2.176603, 1, 0.4627451, 0, 1,
-1.4706, 2.124793, -1.916197, 1, 0.4666667, 0, 1,
-1.462848, 0.4542, -2.330355, 1, 0.4745098, 0, 1,
-1.461536, -1.617214, -2.009309, 1, 0.4784314, 0, 1,
-1.461279, 0.7631739, 0.1278855, 1, 0.4862745, 0, 1,
-1.445285, 0.9015091, -0.7180796, 1, 0.4901961, 0, 1,
-1.431392, -0.1476998, -2.058449, 1, 0.4980392, 0, 1,
-1.411167, -0.5336688, -3.090447, 1, 0.5058824, 0, 1,
-1.410472, 1.817755, -0.5585518, 1, 0.509804, 0, 1,
-1.394471, 0.1055685, -1.593295, 1, 0.5176471, 0, 1,
-1.392558, -1.813452, -4.544661, 1, 0.5215687, 0, 1,
-1.39112, 0.6826648, -1.352125, 1, 0.5294118, 0, 1,
-1.389133, 0.6937717, -0.8844884, 1, 0.5333334, 0, 1,
-1.385971, 0.6313648, -1.533816, 1, 0.5411765, 0, 1,
-1.382368, -0.5500954, -1.360324, 1, 0.5450981, 0, 1,
-1.374305, -2.197586, -1.673685, 1, 0.5529412, 0, 1,
-1.364099, 0.8589152, -4.078199, 1, 0.5568628, 0, 1,
-1.358252, -1.863473, -1.911938, 1, 0.5647059, 0, 1,
-1.353603, -0.09790581, -1.217029, 1, 0.5686275, 0, 1,
-1.351656, 0.868712, -0.542533, 1, 0.5764706, 0, 1,
-1.349696, -0.1493176, -1.186455, 1, 0.5803922, 0, 1,
-1.331375, -2.702685, -3.021403, 1, 0.5882353, 0, 1,
-1.301326, 0.6314195, -2.505459, 1, 0.5921569, 0, 1,
-1.295939, -0.6453786, -1.841374, 1, 0.6, 0, 1,
-1.278446, -1.092082, -2.626866, 1, 0.6078432, 0, 1,
-1.273988, 0.05982884, -0.8358002, 1, 0.6117647, 0, 1,
-1.259274, 0.3255314, -1.733714, 1, 0.6196079, 0, 1,
-1.255393, -1.85614, -2.78209, 1, 0.6235294, 0, 1,
-1.245902, 1.870683, 0.3891468, 1, 0.6313726, 0, 1,
-1.244151, -2.504786, -2.949822, 1, 0.6352941, 0, 1,
-1.2403, -1.762628, -2.851326, 1, 0.6431373, 0, 1,
-1.237093, -0.003284925, -1.428428, 1, 0.6470588, 0, 1,
-1.235753, 0.8765993, -2.77596, 1, 0.654902, 0, 1,
-1.228343, 0.9623972, 0.9037257, 1, 0.6588235, 0, 1,
-1.222104, 0.0239082, -3.291255, 1, 0.6666667, 0, 1,
-1.217031, -0.1210354, -3.054194, 1, 0.6705883, 0, 1,
-1.211126, 0.7959003, -0.2380038, 1, 0.6784314, 0, 1,
-1.209302, 1.601114, 0.04154687, 1, 0.682353, 0, 1,
-1.204829, -0.7428423, -3.514824, 1, 0.6901961, 0, 1,
-1.202377, 0.3138181, -0.2092394, 1, 0.6941177, 0, 1,
-1.194131, -0.1871888, -0.603657, 1, 0.7019608, 0, 1,
-1.19377, 0.6950945, -1.164235, 1, 0.7098039, 0, 1,
-1.193421, 0.4322277, -0.44419, 1, 0.7137255, 0, 1,
-1.18813, 0.02891484, -2.055614, 1, 0.7215686, 0, 1,
-1.184992, 1.57135, 0.518043, 1, 0.7254902, 0, 1,
-1.184716, -0.2593499, -1.470717, 1, 0.7333333, 0, 1,
-1.183906, -1.199001, -2.258243, 1, 0.7372549, 0, 1,
-1.17901, 0.06736793, -0.0485781, 1, 0.7450981, 0, 1,
-1.17748, -0.5543669, -1.307793, 1, 0.7490196, 0, 1,
-1.172202, 1.274667, -2.010968, 1, 0.7568628, 0, 1,
-1.171635, -0.6521523, -3.043799, 1, 0.7607843, 0, 1,
-1.171619, 0.007417385, -0.5373155, 1, 0.7686275, 0, 1,
-1.171416, -0.6089767, -1.809029, 1, 0.772549, 0, 1,
-1.161684, -1.555243, -1.837355, 1, 0.7803922, 0, 1,
-1.158778, -0.003899594, -1.251772, 1, 0.7843137, 0, 1,
-1.154756, 0.3387249, 0.3513038, 1, 0.7921569, 0, 1,
-1.146731, -1.636702, -3.069964, 1, 0.7960784, 0, 1,
-1.141061, 0.2706252, -0.9989085, 1, 0.8039216, 0, 1,
-1.135575, -1.20814, -3.314211, 1, 0.8117647, 0, 1,
-1.132602, 1.405719, -0.3179096, 1, 0.8156863, 0, 1,
-1.132234, 0.2508183, -1.420244, 1, 0.8235294, 0, 1,
-1.130816, -0.5084546, -3.043327, 1, 0.827451, 0, 1,
-1.127416, 1.329106, -1.33922, 1, 0.8352941, 0, 1,
-1.122424, -1.290432, -2.011181, 1, 0.8392157, 0, 1,
-1.122095, -1.560093, -2.971646, 1, 0.8470588, 0, 1,
-1.108907, -0.3548805, -0.4066667, 1, 0.8509804, 0, 1,
-1.098907, 1.616814, -1.09037, 1, 0.8588235, 0, 1,
-1.097013, 1.095227, -2.230497, 1, 0.8627451, 0, 1,
-1.092919, -1.173748, -1.035703, 1, 0.8705882, 0, 1,
-1.092611, -0.5036631, -1.4953, 1, 0.8745098, 0, 1,
-1.09004, 0.3665862, -2.580938, 1, 0.8823529, 0, 1,
-1.086473, 0.3298362, -1.588398, 1, 0.8862745, 0, 1,
-1.08534, -0.3398868, -2.273745, 1, 0.8941177, 0, 1,
-1.084118, 0.200552, -0.96478, 1, 0.8980392, 0, 1,
-1.077071, -0.4934147, -2.788783, 1, 0.9058824, 0, 1,
-1.075048, 0.4220831, -2.41029, 1, 0.9137255, 0, 1,
-1.073133, 0.7659445, -0.6866975, 1, 0.9176471, 0, 1,
-1.072169, 1.649458, 0.5062475, 1, 0.9254902, 0, 1,
-1.057905, 0.3233012, -0.7395107, 1, 0.9294118, 0, 1,
-1.048671, 1.681032, -0.4776968, 1, 0.9372549, 0, 1,
-1.032472, 0.8629506, -0.3004881, 1, 0.9411765, 0, 1,
-1.023468, -0.4354987, -3.069481, 1, 0.9490196, 0, 1,
-1.013736, 2.061299, -0.2923902, 1, 0.9529412, 0, 1,
-1.012279, -1.873498, -2.262179, 1, 0.9607843, 0, 1,
-1.000162, -1.296331, -1.266706, 1, 0.9647059, 0, 1,
-0.9923115, -0.9537449, -4.031581, 1, 0.972549, 0, 1,
-0.9897508, 0.911429, -0.9692744, 1, 0.9764706, 0, 1,
-0.9895985, 0.07802638, -0.9891121, 1, 0.9843137, 0, 1,
-0.9890209, 0.4605916, -1.523587, 1, 0.9882353, 0, 1,
-0.9881435, 0.4085589, -0.6050215, 1, 0.9960784, 0, 1,
-0.9851797, 0.3308379, -0.7526796, 0.9960784, 1, 0, 1,
-0.9801648, -0.3778049, -1.868235, 0.9921569, 1, 0, 1,
-0.9792043, 1.689818, -0.3657784, 0.9843137, 1, 0, 1,
-0.9778486, -1.495005, -2.739798, 0.9803922, 1, 0, 1,
-0.9723629, -0.4794703, -2.476224, 0.972549, 1, 0, 1,
-0.9707674, 2.136871, -0.92628, 0.9686275, 1, 0, 1,
-0.9687415, -0.8597991, -2.226588, 0.9607843, 1, 0, 1,
-0.9665729, 0.4707613, 0.9268908, 0.9568627, 1, 0, 1,
-0.9658442, 1.088363, -0.5185965, 0.9490196, 1, 0, 1,
-0.9655348, -0.3920962, -1.90192, 0.945098, 1, 0, 1,
-0.9573966, -0.5166372, -1.519945, 0.9372549, 1, 0, 1,
-0.9457771, -1.026186, -2.234235, 0.9333333, 1, 0, 1,
-0.9451029, 0.147579, -0.02752433, 0.9254902, 1, 0, 1,
-0.9397584, -0.7551695, -2.928865, 0.9215686, 1, 0, 1,
-0.9397344, -0.08701324, -1.601557, 0.9137255, 1, 0, 1,
-0.9377783, -1.339913, -3.508781, 0.9098039, 1, 0, 1,
-0.9375224, 1.77124, -0.9032551, 0.9019608, 1, 0, 1,
-0.9287135, -0.7425204, -1.693853, 0.8941177, 1, 0, 1,
-0.9206048, -1.183362, -3.152293, 0.8901961, 1, 0, 1,
-0.9183829, -2.074829, -3.266844, 0.8823529, 1, 0, 1,
-0.9178553, -1.137985, -2.119147, 0.8784314, 1, 0, 1,
-0.9172149, -0.3688323, -1.858539, 0.8705882, 1, 0, 1,
-0.915139, -0.6342583, -3.65134, 0.8666667, 1, 0, 1,
-0.9138133, -1.133477, -2.336015, 0.8588235, 1, 0, 1,
-0.9065227, 1.063318, -1.58045, 0.854902, 1, 0, 1,
-0.9044261, -1.466114, -1.549811, 0.8470588, 1, 0, 1,
-0.8970909, 2.197602, -0.6502313, 0.8431373, 1, 0, 1,
-0.8897161, -1.408872, -2.2707, 0.8352941, 1, 0, 1,
-0.8769435, 1.948475, 0.5935553, 0.8313726, 1, 0, 1,
-0.8758425, -0.4741434, -4.364293, 0.8235294, 1, 0, 1,
-0.8754495, 2.383129, -0.7685933, 0.8196079, 1, 0, 1,
-0.872538, 1.900494, -1.066492, 0.8117647, 1, 0, 1,
-0.8708868, -1.111666, -2.240582, 0.8078431, 1, 0, 1,
-0.8639926, -0.226831, -1.283671, 0.8, 1, 0, 1,
-0.8630409, 0.5349477, -0.3682101, 0.7921569, 1, 0, 1,
-0.8565027, -0.833804, -1.274464, 0.7882353, 1, 0, 1,
-0.8433945, -1.031643, -2.158443, 0.7803922, 1, 0, 1,
-0.8388885, -0.86144, -0.7749295, 0.7764706, 1, 0, 1,
-0.8374988, 1.175803, -0.1728643, 0.7686275, 1, 0, 1,
-0.8358669, 1.384573, -0.5418749, 0.7647059, 1, 0, 1,
-0.8302213, -1.390781, -2.576408, 0.7568628, 1, 0, 1,
-0.8296014, 0.4011176, 1.080894, 0.7529412, 1, 0, 1,
-0.8281834, 0.3253461, -2.092029, 0.7450981, 1, 0, 1,
-0.8276703, -0.1740699, -1.947489, 0.7411765, 1, 0, 1,
-0.827211, 0.8551347, -0.718253, 0.7333333, 1, 0, 1,
-0.8263187, 1.835131, -1.006154, 0.7294118, 1, 0, 1,
-0.8063629, -1.217229, -1.419819, 0.7215686, 1, 0, 1,
-0.8052564, 0.5091338, -0.5332637, 0.7176471, 1, 0, 1,
-0.8002154, 0.05259739, -1.894281, 0.7098039, 1, 0, 1,
-0.7978997, 0.6629397, -0.9041971, 0.7058824, 1, 0, 1,
-0.7882817, -1.559509, -3.167006, 0.6980392, 1, 0, 1,
-0.7877107, -0.2506311, -1.592069, 0.6901961, 1, 0, 1,
-0.7874719, -1.252964, -1.522191, 0.6862745, 1, 0, 1,
-0.7863169, 0.5625237, -1.270465, 0.6784314, 1, 0, 1,
-0.7822511, 0.3228477, -0.3646541, 0.6745098, 1, 0, 1,
-0.7805415, -0.2110302, -0.2423442, 0.6666667, 1, 0, 1,
-0.7794415, 0.7208886, -1.044326, 0.6627451, 1, 0, 1,
-0.7784107, 0.7204979, -0.5351608, 0.654902, 1, 0, 1,
-0.7751155, -0.1569225, -1.212327, 0.6509804, 1, 0, 1,
-0.7692972, -0.6871513, -2.369542, 0.6431373, 1, 0, 1,
-0.76161, -0.7817044, -1.849218, 0.6392157, 1, 0, 1,
-0.7549173, -0.5276753, -2.405604, 0.6313726, 1, 0, 1,
-0.7498883, 1.13859, -0.2316705, 0.627451, 1, 0, 1,
-0.7485294, -0.2894185, -0.4784174, 0.6196079, 1, 0, 1,
-0.7484053, 0.6217519, -1.368891, 0.6156863, 1, 0, 1,
-0.7434098, 1.541707, -1.181843, 0.6078432, 1, 0, 1,
-0.7432778, -0.7406168, -2.497833, 0.6039216, 1, 0, 1,
-0.7409007, 0.4519996, 0.1270848, 0.5960785, 1, 0, 1,
-0.7401897, -0.380283, -1.266143, 0.5882353, 1, 0, 1,
-0.7372794, -1.099612, -3.234009, 0.5843138, 1, 0, 1,
-0.7371823, 0.7698411, -1.223616, 0.5764706, 1, 0, 1,
-0.7322868, -1.408578, -3.673565, 0.572549, 1, 0, 1,
-0.7316073, 0.5973468, -2.097662, 0.5647059, 1, 0, 1,
-0.7246645, 0.7517608, -0.8247702, 0.5607843, 1, 0, 1,
-0.7232323, 0.1602749, -3.533758, 0.5529412, 1, 0, 1,
-0.7171125, 0.9699455, -1.945819, 0.5490196, 1, 0, 1,
-0.713649, -1.530785, -1.80657, 0.5411765, 1, 0, 1,
-0.7090937, -1.293536, -2.876311, 0.5372549, 1, 0, 1,
-0.7053109, 0.74088, -0.5207309, 0.5294118, 1, 0, 1,
-0.7036617, 1.284401, -0.300069, 0.5254902, 1, 0, 1,
-0.7023751, -1.57408, -2.965545, 0.5176471, 1, 0, 1,
-0.6989244, 1.16759, 0.3166771, 0.5137255, 1, 0, 1,
-0.6989015, -1.468609, -2.580493, 0.5058824, 1, 0, 1,
-0.6979572, 0.9964414, -1.115821, 0.5019608, 1, 0, 1,
-0.6906141, 0.6340583, -1.342951, 0.4941176, 1, 0, 1,
-0.6856079, -0.713277, -2.40903, 0.4862745, 1, 0, 1,
-0.6855848, -0.7248197, -4.406409, 0.4823529, 1, 0, 1,
-0.6676012, 0.9771142, -1.792244, 0.4745098, 1, 0, 1,
-0.6664054, -0.04020524, 0.02145041, 0.4705882, 1, 0, 1,
-0.6644313, 0.4414692, -2.365992, 0.4627451, 1, 0, 1,
-0.6607712, -0.3015183, -3.397776, 0.4588235, 1, 0, 1,
-0.6574255, -0.03839249, -1.816462, 0.4509804, 1, 0, 1,
-0.6549245, 0.8830651, -1.275962, 0.4470588, 1, 0, 1,
-0.6547852, 0.9675661, -0.255277, 0.4392157, 1, 0, 1,
-0.6531684, -1.808625, -3.535254, 0.4352941, 1, 0, 1,
-0.6531369, 0.4475594, 0.1571519, 0.427451, 1, 0, 1,
-0.6507086, 0.1553569, -2.357942, 0.4235294, 1, 0, 1,
-0.6491535, -0.09704392, -2.123476, 0.4156863, 1, 0, 1,
-0.6462995, -1.547234, -4.230406, 0.4117647, 1, 0, 1,
-0.6442389, 0.4692643, -0.901914, 0.4039216, 1, 0, 1,
-0.6438512, -0.4662599, -2.119172, 0.3960784, 1, 0, 1,
-0.6418213, -1.930475, -2.752842, 0.3921569, 1, 0, 1,
-0.6398332, 0.6149115, -2.128592, 0.3843137, 1, 0, 1,
-0.6340925, 0.4269055, 0.7747065, 0.3803922, 1, 0, 1,
-0.6293095, 0.2269503, -0.7989214, 0.372549, 1, 0, 1,
-0.629296, -0.1869928, -1.244435, 0.3686275, 1, 0, 1,
-0.6287432, 0.4662312, -1.434225, 0.3607843, 1, 0, 1,
-0.6250522, 1.19235, -0.5995781, 0.3568628, 1, 0, 1,
-0.6246168, -0.9889576, -3.099194, 0.3490196, 1, 0, 1,
-0.6195143, 0.1932456, -2.876497, 0.345098, 1, 0, 1,
-0.6188267, -0.972961, -3.379175, 0.3372549, 1, 0, 1,
-0.610899, 0.8254501, 0.002884044, 0.3333333, 1, 0, 1,
-0.6022572, -0.9571478, -2.892705, 0.3254902, 1, 0, 1,
-0.597006, -0.9721588, -1.978559, 0.3215686, 1, 0, 1,
-0.5956489, -0.008229693, -2.246408, 0.3137255, 1, 0, 1,
-0.5930091, 0.9876204, -0.6609643, 0.3098039, 1, 0, 1,
-0.5879363, 0.851265, 0.1809051, 0.3019608, 1, 0, 1,
-0.5845674, 0.3997472, -1.617316, 0.2941177, 1, 0, 1,
-0.5821519, -1.082365, -2.953518, 0.2901961, 1, 0, 1,
-0.5817079, 1.679397, -0.3354393, 0.282353, 1, 0, 1,
-0.57317, -0.3347598, -0.4929186, 0.2784314, 1, 0, 1,
-0.5711319, -0.9603743, -2.166089, 0.2705882, 1, 0, 1,
-0.5705093, 0.494383, -2.359071, 0.2666667, 1, 0, 1,
-0.5694606, 1.238208, 0.3172226, 0.2588235, 1, 0, 1,
-0.5673484, 0.0706518, -1.378286, 0.254902, 1, 0, 1,
-0.5655028, 0.30114, -0.7283195, 0.2470588, 1, 0, 1,
-0.5636469, -0.2506629, -2.296851, 0.2431373, 1, 0, 1,
-0.5627379, 0.7588212, -1.134072, 0.2352941, 1, 0, 1,
-0.561822, -1.149387, -1.884629, 0.2313726, 1, 0, 1,
-0.5613844, -0.4546776, -3.088317, 0.2235294, 1, 0, 1,
-0.558004, 0.9973919, -1.954732, 0.2196078, 1, 0, 1,
-0.5573934, -1.973834, -0.7556431, 0.2117647, 1, 0, 1,
-0.5559123, 0.8175581, -2.046917, 0.2078431, 1, 0, 1,
-0.5463797, 0.9274883, -2.821321, 0.2, 1, 0, 1,
-0.5387704, -1.533932, -2.427811, 0.1921569, 1, 0, 1,
-0.5314215, 0.05403646, -1.151603, 0.1882353, 1, 0, 1,
-0.5313602, 0.333447, -1.719188, 0.1803922, 1, 0, 1,
-0.5188106, -0.670688, -2.895812, 0.1764706, 1, 0, 1,
-0.5187748, -2.140006, -2.250506, 0.1686275, 1, 0, 1,
-0.5171427, -0.4449568, -1.905482, 0.1647059, 1, 0, 1,
-0.5150448, 0.1263876, -2.04371, 0.1568628, 1, 0, 1,
-0.5087104, -0.6331462, -4.271023, 0.1529412, 1, 0, 1,
-0.5073737, -1.994815, -1.637339, 0.145098, 1, 0, 1,
-0.5071256, 1.170308, -2.675093, 0.1411765, 1, 0, 1,
-0.5047342, -0.886584, -2.287555, 0.1333333, 1, 0, 1,
-0.5042992, 0.578993, -1.461958, 0.1294118, 1, 0, 1,
-0.496745, 0.38777, -0.6121966, 0.1215686, 1, 0, 1,
-0.4948724, 0.3302115, -0.1994801, 0.1176471, 1, 0, 1,
-0.4925315, -0.3448834, -2.877194, 0.1098039, 1, 0, 1,
-0.4921034, -1.089786, -4.76432, 0.1058824, 1, 0, 1,
-0.4910333, -0.1779954, -2.848768, 0.09803922, 1, 0, 1,
-0.4879193, 0.9912398, -0.3929887, 0.09019608, 1, 0, 1,
-0.4835569, 0.1502255, -1.580827, 0.08627451, 1, 0, 1,
-0.4795172, 0.01686336, -2.768537, 0.07843138, 1, 0, 1,
-0.4789587, 0.3325149, -2.207204, 0.07450981, 1, 0, 1,
-0.4699159, -1.501929, -2.0601, 0.06666667, 1, 0, 1,
-0.4684261, -0.7857657, -3.206886, 0.0627451, 1, 0, 1,
-0.467373, -0.6192243, -1.717579, 0.05490196, 1, 0, 1,
-0.4538755, -0.1181003, -3.482785, 0.05098039, 1, 0, 1,
-0.4531437, -0.4379367, -2.304067, 0.04313726, 1, 0, 1,
-0.4495367, -0.09358311, -2.620191, 0.03921569, 1, 0, 1,
-0.4483851, 0.008140822, -2.56173, 0.03137255, 1, 0, 1,
-0.4476609, 1.894698, 0.308945, 0.02745098, 1, 0, 1,
-0.4476585, -1.855232, -4.211807, 0.01960784, 1, 0, 1,
-0.4464145, -0.5200927, -3.314871, 0.01568628, 1, 0, 1,
-0.4451474, -1.685616, -2.538041, 0.007843138, 1, 0, 1,
-0.4435075, -0.1501951, -2.243026, 0.003921569, 1, 0, 1,
-0.4406742, 0.8822545, -1.848089, 0, 1, 0.003921569, 1,
-0.4387102, -0.7232389, -1.479908, 0, 1, 0.01176471, 1,
-0.4323937, -0.3805591, -4.531829, 0, 1, 0.01568628, 1,
-0.430905, -0.7199128, -4.37588, 0, 1, 0.02352941, 1,
-0.4245762, 2.157697, -0.6850829, 0, 1, 0.02745098, 1,
-0.4230453, -0.9688197, -2.846913, 0, 1, 0.03529412, 1,
-0.414451, -1.002715, -1.87566, 0, 1, 0.03921569, 1,
-0.4120755, -1.615817, -4.256937, 0, 1, 0.04705882, 1,
-0.4116616, 0.5117623, -2.920691, 0, 1, 0.05098039, 1,
-0.403377, -1.622916, -4.737186, 0, 1, 0.05882353, 1,
-0.3960997, -1.516953, -1.869796, 0, 1, 0.0627451, 1,
-0.3927142, -0.8735889, -2.340187, 0, 1, 0.07058824, 1,
-0.3894881, -0.4022043, -1.481164, 0, 1, 0.07450981, 1,
-0.388679, -1.645361, -2.80266, 0, 1, 0.08235294, 1,
-0.3867081, -0.288791, -2.49849, 0, 1, 0.08627451, 1,
-0.3857371, -0.7733747, -2.787708, 0, 1, 0.09411765, 1,
-0.3857193, -0.4448828, -1.633218, 0, 1, 0.1019608, 1,
-0.3834381, -0.02000302, -2.914533, 0, 1, 0.1058824, 1,
-0.3795269, -1.255561, -3.33006, 0, 1, 0.1137255, 1,
-0.3782812, 1.29187, -0.07500783, 0, 1, 0.1176471, 1,
-0.3743939, 1.866256, -1.769795, 0, 1, 0.1254902, 1,
-0.37423, 0.2568414, -0.7884464, 0, 1, 0.1294118, 1,
-0.3704585, 1.061442, -1.292421, 0, 1, 0.1372549, 1,
-0.3669766, -0.780269, -1.649936, 0, 1, 0.1411765, 1,
-0.3601977, -1.299359, -3.930305, 0, 1, 0.1490196, 1,
-0.3596199, -1.149873, -3.91384, 0, 1, 0.1529412, 1,
-0.355335, -0.1780687, -1.971006, 0, 1, 0.1607843, 1,
-0.3503005, 0.2026591, -0.9741808, 0, 1, 0.1647059, 1,
-0.3469033, 1.095522, -0.5545487, 0, 1, 0.172549, 1,
-0.3440392, -0.2742593, -1.300727, 0, 1, 0.1764706, 1,
-0.3432958, 0.3862345, -1.508428, 0, 1, 0.1843137, 1,
-0.3387158, 0.09909919, -1.191635, 0, 1, 0.1882353, 1,
-0.3353127, 1.033676, -0.569551, 0, 1, 0.1960784, 1,
-0.3342782, -0.1961198, -1.957442, 0, 1, 0.2039216, 1,
-0.3302239, 0.5357847, -0.7671998, 0, 1, 0.2078431, 1,
-0.3259439, -1.264554, -2.359787, 0, 1, 0.2156863, 1,
-0.3222251, 1.38941, -0.8457511, 0, 1, 0.2196078, 1,
-0.3173848, -0.1941346, -3.887104, 0, 1, 0.227451, 1,
-0.3135594, 0.2914462, -1.780237, 0, 1, 0.2313726, 1,
-0.3113991, 1.675869, 1.536386, 0, 1, 0.2392157, 1,
-0.310894, 0.5910065, -2.164528, 0, 1, 0.2431373, 1,
-0.3097178, -1.83995, -3.030628, 0, 1, 0.2509804, 1,
-0.3082974, 0.003248904, -1.298058, 0, 1, 0.254902, 1,
-0.3053675, -0.625698, -2.752791, 0, 1, 0.2627451, 1,
-0.3010618, 2.289309, 0.3261049, 0, 1, 0.2666667, 1,
-0.3002599, 0.860351, 1.463855, 0, 1, 0.2745098, 1,
-0.2963036, -0.8746342, -3.343002, 0, 1, 0.2784314, 1,
-0.2953335, 0.3147549, 0.03493847, 0, 1, 0.2862745, 1,
-0.2950187, -1.145927, -1.577026, 0, 1, 0.2901961, 1,
-0.2867446, -1.054645, -4.328542, 0, 1, 0.2980392, 1,
-0.2858594, 1.405932, -1.072842, 0, 1, 0.3058824, 1,
-0.2854114, -0.8640529, -3.153333, 0, 1, 0.3098039, 1,
-0.2842523, -0.04682824, -2.841681, 0, 1, 0.3176471, 1,
-0.2832381, 0.6744705, 1.9035, 0, 1, 0.3215686, 1,
-0.2830751, 1.223895, 0.3289383, 0, 1, 0.3294118, 1,
-0.2801312, -1.065506, -1.70982, 0, 1, 0.3333333, 1,
-0.2791554, 1.048885, -0.01782375, 0, 1, 0.3411765, 1,
-0.2785767, -1.185438, -3.275722, 0, 1, 0.345098, 1,
-0.2762893, 0.5425872, 0.05618302, 0, 1, 0.3529412, 1,
-0.2743479, 0.0757016, -0.1784994, 0, 1, 0.3568628, 1,
-0.2699822, 1.535741, 0.5518138, 0, 1, 0.3647059, 1,
-0.2686619, -1.115404, -3.588191, 0, 1, 0.3686275, 1,
-0.2676614, -0.9422525, -2.097302, 0, 1, 0.3764706, 1,
-0.261661, 1.010651, 1.121741, 0, 1, 0.3803922, 1,
-0.2613504, -0.1356372, -3.645557, 0, 1, 0.3882353, 1,
-0.2596084, -1.302698, -2.149947, 0, 1, 0.3921569, 1,
-0.2586567, 0.07693012, -1.825846, 0, 1, 0.4, 1,
-0.2573231, -0.3837247, -2.844925, 0, 1, 0.4078431, 1,
-0.2565163, -1.163576, -3.273013, 0, 1, 0.4117647, 1,
-0.2519686, 1.085385, 0.4363832, 0, 1, 0.4196078, 1,
-0.2485915, 0.04835575, -0.2821495, 0, 1, 0.4235294, 1,
-0.2479285, 0.4236704, 0.6252794, 0, 1, 0.4313726, 1,
-0.2475667, 1.132196, 0.1840054, 0, 1, 0.4352941, 1,
-0.2474845, 0.536235, -0.7202531, 0, 1, 0.4431373, 1,
-0.2449906, 0.3209587, -0.7011624, 0, 1, 0.4470588, 1,
-0.2441479, 0.09795719, -2.69512, 0, 1, 0.454902, 1,
-0.2439495, 1.534258, 0.759846, 0, 1, 0.4588235, 1,
-0.2428842, -1.231866, -2.837362, 0, 1, 0.4666667, 1,
-0.235922, 0.8067402, -0.1600805, 0, 1, 0.4705882, 1,
-0.2354044, -0.4616952, -1.268855, 0, 1, 0.4784314, 1,
-0.2348841, 0.4052488, -1.68828, 0, 1, 0.4823529, 1,
-0.2330521, 0.2551278, -1.181597, 0, 1, 0.4901961, 1,
-0.2307693, -1.482382, -3.631308, 0, 1, 0.4941176, 1,
-0.2297166, 0.6113935, 0.6458589, 0, 1, 0.5019608, 1,
-0.2272733, -1.045338, -3.05552, 0, 1, 0.509804, 1,
-0.2237103, 2.431305, 1.460947, 0, 1, 0.5137255, 1,
-0.213214, 0.1177517, -2.485211, 0, 1, 0.5215687, 1,
-0.2128107, 1.002348, 0.7453278, 0, 1, 0.5254902, 1,
-0.2100879, -0.8476236, -2.368061, 0, 1, 0.5333334, 1,
-0.2055905, -0.5404038, -2.292546, 0, 1, 0.5372549, 1,
-0.204254, 1.45733, -0.1941941, 0, 1, 0.5450981, 1,
-0.203096, 1.780058, -0.1645247, 0, 1, 0.5490196, 1,
-0.2024609, 0.5109484, 0.9897, 0, 1, 0.5568628, 1,
-0.2015656, -0.05383079, -1.30631, 0, 1, 0.5607843, 1,
-0.199311, 0.5733631, -0.9211825, 0, 1, 0.5686275, 1,
-0.1969944, -0.238412, -1.443453, 0, 1, 0.572549, 1,
-0.1951603, -0.07236215, -1.896781, 0, 1, 0.5803922, 1,
-0.193725, -0.001665825, -2.863181, 0, 1, 0.5843138, 1,
-0.1897079, -0.2822824, -2.589017, 0, 1, 0.5921569, 1,
-0.1895493, 0.1963954, 0.7642539, 0, 1, 0.5960785, 1,
-0.1841283, -1.262238, -3.89491, 0, 1, 0.6039216, 1,
-0.1825578, -0.1036545, -2.984983, 0, 1, 0.6117647, 1,
-0.1821527, 0.9875401, 0.4029442, 0, 1, 0.6156863, 1,
-0.1815034, 0.4656488, 0.1520262, 0, 1, 0.6235294, 1,
-0.17699, 0.266295, -0.1585232, 0, 1, 0.627451, 1,
-0.1742458, -0.03350581, -2.638994, 0, 1, 0.6352941, 1,
-0.1700129, 0.1363649, 1.144637, 0, 1, 0.6392157, 1,
-0.1691481, -2.572054, -4.269689, 0, 1, 0.6470588, 1,
-0.1616421, 0.9674314, 0.5563336, 0, 1, 0.6509804, 1,
-0.1534952, 0.4893878, -0.6754625, 0, 1, 0.6588235, 1,
-0.1494597, -0.5958311, -3.905492, 0, 1, 0.6627451, 1,
-0.1438841, -1.160523, -3.422917, 0, 1, 0.6705883, 1,
-0.1429126, 1.616283, 0.8411338, 0, 1, 0.6745098, 1,
-0.1428947, 0.3323718, 0.03348481, 0, 1, 0.682353, 1,
-0.1413969, -1.386783, -3.198498, 0, 1, 0.6862745, 1,
-0.1401393, -0.7258553, -2.71996, 0, 1, 0.6941177, 1,
-0.1390966, -0.8066107, -1.531288, 0, 1, 0.7019608, 1,
-0.1382677, -1.207647, -3.822163, 0, 1, 0.7058824, 1,
-0.1338473, -1.369565, -2.253862, 0, 1, 0.7137255, 1,
-0.1312886, 0.7365374, -0.3585102, 0, 1, 0.7176471, 1,
-0.1307378, -0.5940344, -1.479854, 0, 1, 0.7254902, 1,
-0.1291628, -2.680327, -4.469202, 0, 1, 0.7294118, 1,
-0.1279804, -0.914278, -2.451137, 0, 1, 0.7372549, 1,
-0.115443, 0.6012079, 0.001683056, 0, 1, 0.7411765, 1,
-0.1152118, -0.429829, -4.500176, 0, 1, 0.7490196, 1,
-0.1130677, 0.896022, 0.2511454, 0, 1, 0.7529412, 1,
-0.1121994, -1.794309, -2.683743, 0, 1, 0.7607843, 1,
-0.1115578, 0.6494583, -0.2539143, 0, 1, 0.7647059, 1,
-0.1112562, -0.4427722, -4.300598, 0, 1, 0.772549, 1,
-0.1094109, 0.9219324, -1.311838, 0, 1, 0.7764706, 1,
-0.1077735, -0.378536, -4.46061, 0, 1, 0.7843137, 1,
-0.1059965, 0.6900184, -0.6475926, 0, 1, 0.7882353, 1,
-0.1022007, -0.6049716, -2.900255, 0, 1, 0.7960784, 1,
-0.1003049, 0.02363001, -0.89508, 0, 1, 0.8039216, 1,
-0.09934013, 1.216938, 0.07953311, 0, 1, 0.8078431, 1,
-0.09838497, 0.1273149, -0.9793614, 0, 1, 0.8156863, 1,
-0.0982433, -0.1636344, -3.182724, 0, 1, 0.8196079, 1,
-0.09507978, -0.04292271, -2.169219, 0, 1, 0.827451, 1,
-0.09488239, -0.3858303, -1.230554, 0, 1, 0.8313726, 1,
-0.0942523, -0.02811521, -1.431898, 0, 1, 0.8392157, 1,
-0.09096967, -0.8901542, -3.412851, 0, 1, 0.8431373, 1,
-0.08906794, -2.018175, -2.606938, 0, 1, 0.8509804, 1,
-0.08094342, 0.3589217, -1.522726, 0, 1, 0.854902, 1,
-0.07695772, 0.3127877, -1.226239, 0, 1, 0.8627451, 1,
-0.07628287, -0.5975319, -2.852134, 0, 1, 0.8666667, 1,
-0.07203025, -2.274799, -2.891612, 0, 1, 0.8745098, 1,
-0.05683224, -1.111725, -3.204649, 0, 1, 0.8784314, 1,
-0.04340212, -0.5272676, -1.33561, 0, 1, 0.8862745, 1,
-0.04156021, 0.7739287, 1.284838, 0, 1, 0.8901961, 1,
-0.03986509, -1.577523, -2.218989, 0, 1, 0.8980392, 1,
-0.0357486, 0.1616433, -0.9853102, 0, 1, 0.9058824, 1,
-0.03495534, -0.1058695, -3.426951, 0, 1, 0.9098039, 1,
-0.0292835, -0.05756333, -2.268534, 0, 1, 0.9176471, 1,
-0.02905065, 0.2514667, 0.3594955, 0, 1, 0.9215686, 1,
-0.02875518, 0.4305744, -0.9505292, 0, 1, 0.9294118, 1,
-0.02561126, -1.20118, -2.264789, 0, 1, 0.9333333, 1,
-0.02496918, 0.09623279, -0.09908105, 0, 1, 0.9411765, 1,
-0.02266839, 0.05661381, -0.5647935, 0, 1, 0.945098, 1,
-0.0215496, 0.4510777, 0.9613808, 0, 1, 0.9529412, 1,
-0.01611693, 0.0747647, -0.7022101, 0, 1, 0.9568627, 1,
-0.0150132, -0.09442838, -3.794486, 0, 1, 0.9647059, 1,
-0.01461187, -1.003504, -5.576065, 0, 1, 0.9686275, 1,
-0.003693165, -0.1173782, -5.91207, 0, 1, 0.9764706, 1,
-0.002458916, 2.411592, 1.235118, 0, 1, 0.9803922, 1,
-0.001693062, -1.752397, -2.516336, 0, 1, 0.9882353, 1,
0.003203557, -0.4200548, 0.4873548, 0, 1, 0.9921569, 1,
0.005179413, 0.1324781, -1.459431, 0, 1, 1, 1,
0.01045771, 1.949028, -1.670142, 0, 0.9921569, 1, 1,
0.01681161, 0.1822424, 0.8468616, 0, 0.9882353, 1, 1,
0.01824045, -0.4654743, 3.21288, 0, 0.9803922, 1, 1,
0.01879774, -0.205598, 4.290195, 0, 0.9764706, 1, 1,
0.01922052, 2.003378, 0.6444631, 0, 0.9686275, 1, 1,
0.02144484, 1.245055, 0.09935066, 0, 0.9647059, 1, 1,
0.02262879, 0.0843061, -1.03549, 0, 0.9568627, 1, 1,
0.02491432, 1.535797, -1.02574, 0, 0.9529412, 1, 1,
0.02520573, 0.6443288, -1.35522, 0, 0.945098, 1, 1,
0.02851249, 0.1173931, -0.3411612, 0, 0.9411765, 1, 1,
0.02854129, -1.004506, 5.448965, 0, 0.9333333, 1, 1,
0.02894601, 2.076973, -2.062236, 0, 0.9294118, 1, 1,
0.02911288, 0.1317173, 0.6055567, 0, 0.9215686, 1, 1,
0.03311168, -0.3026615, 2.7541, 0, 0.9176471, 1, 1,
0.04352467, -1.102546, 1.722495, 0, 0.9098039, 1, 1,
0.04527253, 1.642037, -1.083781, 0, 0.9058824, 1, 1,
0.04679204, 0.49518, -1.135427, 0, 0.8980392, 1, 1,
0.04883095, 1.574556, -0.9613882, 0, 0.8901961, 1, 1,
0.05191778, 0.09910674, 1.23947, 0, 0.8862745, 1, 1,
0.05380685, 2.345582, -1.05654, 0, 0.8784314, 1, 1,
0.05815867, 0.5887056, -0.04492549, 0, 0.8745098, 1, 1,
0.06016956, 1.796365, -0.09047624, 0, 0.8666667, 1, 1,
0.06186403, -0.08983537, 4.325512, 0, 0.8627451, 1, 1,
0.06439713, 0.4158905, 0.7386495, 0, 0.854902, 1, 1,
0.06582452, -1.466226, 2.76637, 0, 0.8509804, 1, 1,
0.06649798, -0.4435158, 2.540713, 0, 0.8431373, 1, 1,
0.07060743, -1.903485, 3.03283, 0, 0.8392157, 1, 1,
0.07343137, 0.2558128, -0.6973866, 0, 0.8313726, 1, 1,
0.07350823, -2.358083, 4.622281, 0, 0.827451, 1, 1,
0.07461429, 1.007904, 0.9488293, 0, 0.8196079, 1, 1,
0.07463288, 0.04979433, -0.2558208, 0, 0.8156863, 1, 1,
0.07652457, -0.2093308, 2.831468, 0, 0.8078431, 1, 1,
0.07873707, 0.4438774, -1.425321, 0, 0.8039216, 1, 1,
0.07906315, -0.003410812, -0.3901533, 0, 0.7960784, 1, 1,
0.08499029, -0.2175449, 2.816768, 0, 0.7882353, 1, 1,
0.08540294, 1.174484, 1.373359, 0, 0.7843137, 1, 1,
0.08678102, -1.194324, 3.178461, 0, 0.7764706, 1, 1,
0.08920951, 0.6817656, 0.8875642, 0, 0.772549, 1, 1,
0.09061463, 0.7424348, -1.038337, 0, 0.7647059, 1, 1,
0.09695644, -0.3690468, 3.48443, 0, 0.7607843, 1, 1,
0.09710448, -0.5011518, 3.75746, 0, 0.7529412, 1, 1,
0.09766538, -0.9681461, 2.886062, 0, 0.7490196, 1, 1,
0.09857931, 1.04377, 0.01082342, 0, 0.7411765, 1, 1,
0.1013354, 0.3400194, -0.256961, 0, 0.7372549, 1, 1,
0.1051789, 0.1225732, 0.9684663, 0, 0.7294118, 1, 1,
0.1079507, -0.3756524, 4.264245, 0, 0.7254902, 1, 1,
0.1086314, 0.5960375, 0.02395382, 0, 0.7176471, 1, 1,
0.1101497, -0.3166175, 4.033064, 0, 0.7137255, 1, 1,
0.1138271, -0.7643479, 1.949065, 0, 0.7058824, 1, 1,
0.1160148, -1.234928, 5.118921, 0, 0.6980392, 1, 1,
0.1164222, 0.06032044, 1.847849, 0, 0.6941177, 1, 1,
0.1166552, 0.1173865, 1.780439, 0, 0.6862745, 1, 1,
0.1181769, 0.3347399, -0.7937506, 0, 0.682353, 1, 1,
0.1231874, 0.8684989, 1.685132, 0, 0.6745098, 1, 1,
0.1240542, 1.381198, 0.01251357, 0, 0.6705883, 1, 1,
0.1270874, -0.4829658, 3.784858, 0, 0.6627451, 1, 1,
0.1310385, 0.1777536, 0.9103099, 0, 0.6588235, 1, 1,
0.1313512, -1.227003, 3.619554, 0, 0.6509804, 1, 1,
0.1329809, 2.056715, -0.06783804, 0, 0.6470588, 1, 1,
0.1338463, -0.7853516, 3.020286, 0, 0.6392157, 1, 1,
0.1344131, 0.7677308, 0.02752948, 0, 0.6352941, 1, 1,
0.1392024, -4.444457, 2.662162, 0, 0.627451, 1, 1,
0.1442152, 0.8345865, 0.7997056, 0, 0.6235294, 1, 1,
0.144312, -1.641946, 1.80249, 0, 0.6156863, 1, 1,
0.1455308, -0.3681307, 3.310128, 0, 0.6117647, 1, 1,
0.1472407, 2.0048, 0.7359514, 0, 0.6039216, 1, 1,
0.1473626, 0.8200111, -0.2655369, 0, 0.5960785, 1, 1,
0.1481979, -0.7278511, 2.382372, 0, 0.5921569, 1, 1,
0.1530127, 0.3862949, -0.8573186, 0, 0.5843138, 1, 1,
0.1581887, 0.1609431, -0.3376426, 0, 0.5803922, 1, 1,
0.1587902, -0.03536952, 2.182319, 0, 0.572549, 1, 1,
0.1609994, -0.3351255, 3.337635, 0, 0.5686275, 1, 1,
0.1638805, 0.1722265, 0.1035699, 0, 0.5607843, 1, 1,
0.1647849, 0.7904297, 0.1209578, 0, 0.5568628, 1, 1,
0.1656563, 0.6684046, 0.06326763, 0, 0.5490196, 1, 1,
0.1692299, -0.255835, 2.265447, 0, 0.5450981, 1, 1,
0.1705623, -0.328392, 3.58288, 0, 0.5372549, 1, 1,
0.1714666, 0.7479954, 0.1983785, 0, 0.5333334, 1, 1,
0.1732554, 1.023713, -0.8139367, 0, 0.5254902, 1, 1,
0.1864058, 0.3523062, -0.5848125, 0, 0.5215687, 1, 1,
0.1875051, -0.9214478, 3.226528, 0, 0.5137255, 1, 1,
0.1959946, -0.2884611, 1.368185, 0, 0.509804, 1, 1,
0.1985399, -0.4470252, 2.181285, 0, 0.5019608, 1, 1,
0.2018466, 0.5055318, -0.8697567, 0, 0.4941176, 1, 1,
0.2023358, -0.1426103, 1.984428, 0, 0.4901961, 1, 1,
0.2048437, -0.862966, 3.867479, 0, 0.4823529, 1, 1,
0.2113496, 0.4804345, 0.2234096, 0, 0.4784314, 1, 1,
0.214109, 2.202923, -1.756317, 0, 0.4705882, 1, 1,
0.2160676, -0.9489791, 2.89642, 0, 0.4666667, 1, 1,
0.2170458, -1.367732, 2.833639, 0, 0.4588235, 1, 1,
0.2190598, 1.419906, 0.4678572, 0, 0.454902, 1, 1,
0.22031, -0.2100732, 2.626668, 0, 0.4470588, 1, 1,
0.2249802, -1.626156, 4.393613, 0, 0.4431373, 1, 1,
0.227353, 1.26526, 3.295545, 0, 0.4352941, 1, 1,
0.2315186, -1.950555, 4.910978, 0, 0.4313726, 1, 1,
0.2332678, -0.4787688, 1.898436, 0, 0.4235294, 1, 1,
0.2342744, -0.007823915, 1.330277, 0, 0.4196078, 1, 1,
0.2349318, 0.1536959, 0.2036249, 0, 0.4117647, 1, 1,
0.2392761, -1.143558, 3.613753, 0, 0.4078431, 1, 1,
0.239951, -0.7555631, 4.238266, 0, 0.4, 1, 1,
0.2425101, -0.1659342, 0.5947855, 0, 0.3921569, 1, 1,
0.248813, 1.028935, 0.2019584, 0, 0.3882353, 1, 1,
0.249215, -0.1513122, 2.51803, 0, 0.3803922, 1, 1,
0.2501318, -0.9998757, 3.121214, 0, 0.3764706, 1, 1,
0.2547468, -0.1828778, 1.620074, 0, 0.3686275, 1, 1,
0.2631994, -0.8554175, 5.629982, 0, 0.3647059, 1, 1,
0.2639478, 0.6955608, 0.4623537, 0, 0.3568628, 1, 1,
0.2713966, -0.7922418, 2.91834, 0, 0.3529412, 1, 1,
0.2742264, -0.3597304, 1.862689, 0, 0.345098, 1, 1,
0.2795546, 0.1316425, 0.03362688, 0, 0.3411765, 1, 1,
0.2811732, 0.4980535, 0.5366467, 0, 0.3333333, 1, 1,
0.2877514, -0.03852801, 0.5706473, 0, 0.3294118, 1, 1,
0.2901999, -0.2417453, 3.495695, 0, 0.3215686, 1, 1,
0.2926463, 1.240846, -0.7148046, 0, 0.3176471, 1, 1,
0.2938864, -0.7098352, 4.753765, 0, 0.3098039, 1, 1,
0.2969548, 0.2890165, -0.469307, 0, 0.3058824, 1, 1,
0.3011408, -0.9358474, 2.195046, 0, 0.2980392, 1, 1,
0.3018448, -1.240034, 2.523584, 0, 0.2901961, 1, 1,
0.3046328, 0.0009988775, 0.7392056, 0, 0.2862745, 1, 1,
0.3086911, 0.6168514, 1.459646, 0, 0.2784314, 1, 1,
0.310156, 1.449789, 0.0512895, 0, 0.2745098, 1, 1,
0.3147731, 1.244098, 1.713022, 0, 0.2666667, 1, 1,
0.3154548, -1.212816, 1.793116, 0, 0.2627451, 1, 1,
0.3162228, -0.0229742, -0.2266335, 0, 0.254902, 1, 1,
0.3184698, -0.2988586, 1.816494, 0, 0.2509804, 1, 1,
0.3204413, -0.3419714, 1.48222, 0, 0.2431373, 1, 1,
0.3237903, -0.2731249, 2.302214, 0, 0.2392157, 1, 1,
0.3258477, -0.9598992, 3.236687, 0, 0.2313726, 1, 1,
0.3259727, 0.405899, 1.20607, 0, 0.227451, 1, 1,
0.3262231, 1.793183, 0.968855, 0, 0.2196078, 1, 1,
0.3282985, -0.5565206, 1.353783, 0, 0.2156863, 1, 1,
0.3374255, 0.4025846, 1.042936, 0, 0.2078431, 1, 1,
0.3420212, 0.6522096, -0.5730473, 0, 0.2039216, 1, 1,
0.3432559, 0.5952722, 0.007849824, 0, 0.1960784, 1, 1,
0.3445297, -0.2493871, 1.801942, 0, 0.1882353, 1, 1,
0.3448683, 0.630243, 2.129642, 0, 0.1843137, 1, 1,
0.348234, 0.2216752, 1.472871, 0, 0.1764706, 1, 1,
0.3483015, 0.1060653, 0.8996134, 0, 0.172549, 1, 1,
0.3545477, 0.01591052, 0.7455177, 0, 0.1647059, 1, 1,
0.3555027, -0.9667743, 3.174782, 0, 0.1607843, 1, 1,
0.3564484, -0.7974805, 3.658434, 0, 0.1529412, 1, 1,
0.3584735, -0.9336258, 5.429544, 0, 0.1490196, 1, 1,
0.3597846, -0.1666415, 2.552603, 0, 0.1411765, 1, 1,
0.3640476, 1.724822, 2.929618, 0, 0.1372549, 1, 1,
0.367209, 2.60472, 0.7003258, 0, 0.1294118, 1, 1,
0.3677571, 1.81676, -1.287774, 0, 0.1254902, 1, 1,
0.3749378, 0.4608715, 0.4580887, 0, 0.1176471, 1, 1,
0.3769221, -0.01846328, 1.016483, 0, 0.1137255, 1, 1,
0.3801816, 0.9773089, 0.4095784, 0, 0.1058824, 1, 1,
0.387251, 0.9565988, -0.6383575, 0, 0.09803922, 1, 1,
0.3877092, 0.2319588, -0.6328137, 0, 0.09411765, 1, 1,
0.3916623, 0.08938289, 1.683945, 0, 0.08627451, 1, 1,
0.3938386, 0.5938602, 0.3027058, 0, 0.08235294, 1, 1,
0.3943883, 0.01796365, 1.238996, 0, 0.07450981, 1, 1,
0.394437, -0.8440897, 3.247041, 0, 0.07058824, 1, 1,
0.3952012, 0.1558353, -0.108134, 0, 0.0627451, 1, 1,
0.3953888, -0.1606644, 1.971462, 0, 0.05882353, 1, 1,
0.3970801, -0.5095062, 2.355918, 0, 0.05098039, 1, 1,
0.4064468, 0.3376855, 1.502889, 0, 0.04705882, 1, 1,
0.4068036, 1.627536, 0.1558697, 0, 0.03921569, 1, 1,
0.4072631, -1.497275, 2.552959, 0, 0.03529412, 1, 1,
0.4101641, 0.04148677, 1.278989, 0, 0.02745098, 1, 1,
0.4105873, 1.739623, 0.1526445, 0, 0.02352941, 1, 1,
0.4119652, -0.1221105, 3.22451, 0, 0.01568628, 1, 1,
0.4242566, -0.4208037, 0.4606226, 0, 0.01176471, 1, 1,
0.4252322, 0.7164509, -0.4951263, 0, 0.003921569, 1, 1,
0.4268748, -1.252451, 2.946108, 0.003921569, 0, 1, 1,
0.4329749, 0.1803208, 1.595087, 0.007843138, 0, 1, 1,
0.4343092, -1.625215, 2.148085, 0.01568628, 0, 1, 1,
0.4347664, 0.6572075, -1.042241, 0.01960784, 0, 1, 1,
0.4381476, 0.2879997, 1.521948, 0.02745098, 0, 1, 1,
0.439023, -0.6455413, 1.806368, 0.03137255, 0, 1, 1,
0.4418822, -1.4646, 3.181096, 0.03921569, 0, 1, 1,
0.4424284, 0.986071, -0.5096259, 0.04313726, 0, 1, 1,
0.44341, 0.1931239, 1.593563, 0.05098039, 0, 1, 1,
0.4438587, 0.7957051, 0.9050451, 0.05490196, 0, 1, 1,
0.4467878, 1.195457, 0.4730366, 0.0627451, 0, 1, 1,
0.4506862, -0.53768, 4.252753, 0.06666667, 0, 1, 1,
0.456417, 1.355956, 1.034868, 0.07450981, 0, 1, 1,
0.4566227, 1.527171, -0.08520658, 0.07843138, 0, 1, 1,
0.4599335, 0.512109, -0.9742771, 0.08627451, 0, 1, 1,
0.464462, 0.3019784, 1.107597, 0.09019608, 0, 1, 1,
0.4658755, -1.957396, 1.509712, 0.09803922, 0, 1, 1,
0.4670574, 0.2907244, 0.7878324, 0.1058824, 0, 1, 1,
0.4688791, 0.1429475, 1.80091, 0.1098039, 0, 1, 1,
0.4710546, 1.196475, -0.8212007, 0.1176471, 0, 1, 1,
0.4729704, 0.3398804, 1.213126, 0.1215686, 0, 1, 1,
0.4771631, 0.4211811, 1.903677, 0.1294118, 0, 1, 1,
0.4772545, 0.9603278, 1.456127, 0.1333333, 0, 1, 1,
0.4788858, 1.931537, 0.2592581, 0.1411765, 0, 1, 1,
0.481073, 1.355403, 0.4066423, 0.145098, 0, 1, 1,
0.4839073, 0.1267428, 2.00074, 0.1529412, 0, 1, 1,
0.4874427, -0.4068242, 2.137835, 0.1568628, 0, 1, 1,
0.4888246, 0.6880611, 1.084371, 0.1647059, 0, 1, 1,
0.488908, -0.7435703, 2.679821, 0.1686275, 0, 1, 1,
0.4911147, -0.5321324, 1.291315, 0.1764706, 0, 1, 1,
0.4929477, 0.293397, 1.442746, 0.1803922, 0, 1, 1,
0.499666, 1.314541, -0.7755851, 0.1882353, 0, 1, 1,
0.5079726, 1.634582, 0.4891497, 0.1921569, 0, 1, 1,
0.5081052, 1.31805, -0.9780669, 0.2, 0, 1, 1,
0.5097287, 0.7075304, 1.638495, 0.2078431, 0, 1, 1,
0.5129467, -0.2686644, 2.472152, 0.2117647, 0, 1, 1,
0.5138358, 0.08795251, 0.9246261, 0.2196078, 0, 1, 1,
0.5160903, -1.34211, 3.494853, 0.2235294, 0, 1, 1,
0.5165368, -2.069575, 2.953781, 0.2313726, 0, 1, 1,
0.5183326, 1.678915, 0.539182, 0.2352941, 0, 1, 1,
0.5308573, 1.286058, 2.563272, 0.2431373, 0, 1, 1,
0.5313579, -0.7753754, 3.226848, 0.2470588, 0, 1, 1,
0.5321089, 2.083498, -0.6494706, 0.254902, 0, 1, 1,
0.5329478, -0.4066379, 2.233333, 0.2588235, 0, 1, 1,
0.5333968, -2.393029, 3.243892, 0.2666667, 0, 1, 1,
0.5421373, -0.6221814, 2.571131, 0.2705882, 0, 1, 1,
0.5425239, 0.7054181, 1.102501, 0.2784314, 0, 1, 1,
0.5514959, -0.5788227, 1.5819, 0.282353, 0, 1, 1,
0.5520678, -0.391591, 3.001815, 0.2901961, 0, 1, 1,
0.5521204, -0.7261019, 1.384939, 0.2941177, 0, 1, 1,
0.5643806, 0.4881215, 1.716421, 0.3019608, 0, 1, 1,
0.5649859, 0.06438373, 0.9441382, 0.3098039, 0, 1, 1,
0.5664394, 1.012809, -1.110048, 0.3137255, 0, 1, 1,
0.56718, -1.100516, 2.249482, 0.3215686, 0, 1, 1,
0.5674937, -1.382926, 2.495775, 0.3254902, 0, 1, 1,
0.5682664, 1.230658, -0.3881466, 0.3333333, 0, 1, 1,
0.5765234, -0.4552664, 2.024259, 0.3372549, 0, 1, 1,
0.5791802, 0.8748645, -0.01574844, 0.345098, 0, 1, 1,
0.5804945, 1.371401, 1.240801, 0.3490196, 0, 1, 1,
0.5836515, 0.1325664, 1.459056, 0.3568628, 0, 1, 1,
0.5863213, -0.08310264, 3.168658, 0.3607843, 0, 1, 1,
0.587186, 1.257334, -1.597096, 0.3686275, 0, 1, 1,
0.5875719, -1.053489, 2.706623, 0.372549, 0, 1, 1,
0.5904607, 0.05944254, 1.380476, 0.3803922, 0, 1, 1,
0.591446, -1.261956, 2.599868, 0.3843137, 0, 1, 1,
0.5938361, -2.274747, 2.447015, 0.3921569, 0, 1, 1,
0.5965999, 1.294245, 0.4172412, 0.3960784, 0, 1, 1,
0.5975906, -0.4207678, 2.765133, 0.4039216, 0, 1, 1,
0.6007853, 0.6429623, 0.3098052, 0.4117647, 0, 1, 1,
0.602633, -0.4438567, 1.822611, 0.4156863, 0, 1, 1,
0.6063935, -0.679943, 3.238832, 0.4235294, 0, 1, 1,
0.6067688, -1.489264, 2.974309, 0.427451, 0, 1, 1,
0.6172783, -2.239449, 3.830334, 0.4352941, 0, 1, 1,
0.6184189, 0.04789045, 2.292575, 0.4392157, 0, 1, 1,
0.6238402, -0.1226606, 0.6327482, 0.4470588, 0, 1, 1,
0.6245247, 0.7046436, 0.6266224, 0.4509804, 0, 1, 1,
0.6245648, 1.535296, 1.700757, 0.4588235, 0, 1, 1,
0.6272081, 0.7182349, 0.8733006, 0.4627451, 0, 1, 1,
0.6279242, 1.350214, 0.4996041, 0.4705882, 0, 1, 1,
0.6320532, 1.897693, 0.4803583, 0.4745098, 0, 1, 1,
0.6337097, 0.6449225, 2.560929, 0.4823529, 0, 1, 1,
0.6353803, -0.728351, 2.653277, 0.4862745, 0, 1, 1,
0.6409977, 1.691384, -0.3053308, 0.4941176, 0, 1, 1,
0.6431633, -0.1683954, 2.363919, 0.5019608, 0, 1, 1,
0.6441555, 1.51646, 0.01181958, 0.5058824, 0, 1, 1,
0.6508444, -1.672142, 3.060241, 0.5137255, 0, 1, 1,
0.6551156, 0.3852019, 0.3791123, 0.5176471, 0, 1, 1,
0.665641, -0.4385252, 2.350859, 0.5254902, 0, 1, 1,
0.6670852, -0.04364272, 1.058422, 0.5294118, 0, 1, 1,
0.6699884, -0.3137242, 1.892174, 0.5372549, 0, 1, 1,
0.6707019, -0.05092553, 0.238991, 0.5411765, 0, 1, 1,
0.6728879, 0.2503428, 0.6771743, 0.5490196, 0, 1, 1,
0.6780117, -0.07266997, 1.975091, 0.5529412, 0, 1, 1,
0.6845742, 0.7095137, 0.7994871, 0.5607843, 0, 1, 1,
0.6847758, -0.0685387, 2.605529, 0.5647059, 0, 1, 1,
0.6869092, 0.2615174, 2.876346, 0.572549, 0, 1, 1,
0.687998, 1.375512, 0.3725593, 0.5764706, 0, 1, 1,
0.6910647, 0.3961402, 2.21487, 0.5843138, 0, 1, 1,
0.6925277, 0.003492879, 1.659144, 0.5882353, 0, 1, 1,
0.692809, 0.6322193, -0.874388, 0.5960785, 0, 1, 1,
0.6950188, -0.585003, 3.539521, 0.6039216, 0, 1, 1,
0.6979142, -0.9126602, 3.445551, 0.6078432, 0, 1, 1,
0.6993096, -1.157928, 3.727433, 0.6156863, 0, 1, 1,
0.6995927, -0.2121193, 3.680202, 0.6196079, 0, 1, 1,
0.7025675, -1.934932, 2.421721, 0.627451, 0, 1, 1,
0.7071503, -0.2509755, 1.863617, 0.6313726, 0, 1, 1,
0.7107553, 0.8189632, -0.183552, 0.6392157, 0, 1, 1,
0.7132289, -1.637877, 3.554463, 0.6431373, 0, 1, 1,
0.7212805, 1.454414, 1.774766, 0.6509804, 0, 1, 1,
0.7213755, 0.4683101, 1.677751, 0.654902, 0, 1, 1,
0.7219449, 0.5334335, -0.2123975, 0.6627451, 0, 1, 1,
0.7225601, 1.618805, 0.6308176, 0.6666667, 0, 1, 1,
0.725146, -0.4346254, 3.846561, 0.6745098, 0, 1, 1,
0.7276905, -0.3680367, 1.071561, 0.6784314, 0, 1, 1,
0.7283112, 0.4380848, 0.3720066, 0.6862745, 0, 1, 1,
0.7288113, 0.6644645, 0.5698262, 0.6901961, 0, 1, 1,
0.7288855, -1.29299, 3.527929, 0.6980392, 0, 1, 1,
0.7300138, -0.4109131, 1.31114, 0.7058824, 0, 1, 1,
0.7309235, 0.1875391, 1.637835, 0.7098039, 0, 1, 1,
0.7366225, 1.386054, 1.066158, 0.7176471, 0, 1, 1,
0.7373583, 1.26121, -1.014571, 0.7215686, 0, 1, 1,
0.7419898, -0.5622277, 1.492718, 0.7294118, 0, 1, 1,
0.7428594, -2.035496, 3.580645, 0.7333333, 0, 1, 1,
0.7433535, -1.89081, 3.185258, 0.7411765, 0, 1, 1,
0.744243, -1.87885, 4.254458, 0.7450981, 0, 1, 1,
0.7446021, 0.9752828, -0.3761805, 0.7529412, 0, 1, 1,
0.7459645, 1.070099, 1.075302, 0.7568628, 0, 1, 1,
0.7472652, 0.5029818, 0.8223855, 0.7647059, 0, 1, 1,
0.7488549, 0.5229468, 1.149304, 0.7686275, 0, 1, 1,
0.7531432, -0.6667451, 2.070945, 0.7764706, 0, 1, 1,
0.7531955, -0.4904521, 2.185733, 0.7803922, 0, 1, 1,
0.7548581, -0.08468571, 2.587703, 0.7882353, 0, 1, 1,
0.7602522, -1.171726, 2.83297, 0.7921569, 0, 1, 1,
0.7647858, -0.6425244, 3.688018, 0.8, 0, 1, 1,
0.7763015, 0.4013611, 2.977939, 0.8078431, 0, 1, 1,
0.7773554, -0.01195064, 2.949327, 0.8117647, 0, 1, 1,
0.7800964, 0.5473227, 0.5279045, 0.8196079, 0, 1, 1,
0.7823244, 0.08762704, 2.906388, 0.8235294, 0, 1, 1,
0.7826902, 0.03531729, 2.427249, 0.8313726, 0, 1, 1,
0.7878523, -0.308817, 1.630529, 0.8352941, 0, 1, 1,
0.7940214, 0.6730056, 1.835819, 0.8431373, 0, 1, 1,
0.795988, -0.1020051, 3.69609, 0.8470588, 0, 1, 1,
0.8000054, 0.6492691, 1.660219, 0.854902, 0, 1, 1,
0.8011242, 1.83158, 0.8741801, 0.8588235, 0, 1, 1,
0.8012186, -1.934831, 2.734107, 0.8666667, 0, 1, 1,
0.8048278, 1.17133, -0.1490469, 0.8705882, 0, 1, 1,
0.8078147, -1.694303, 3.114655, 0.8784314, 0, 1, 1,
0.814348, -0.1836874, 1.976897, 0.8823529, 0, 1, 1,
0.8148757, -0.09300405, -0.1638331, 0.8901961, 0, 1, 1,
0.8163176, 0.5715907, 1.152677, 0.8941177, 0, 1, 1,
0.8245431, 0.512034, 1.541531, 0.9019608, 0, 1, 1,
0.8248531, 0.7478189, 0.504146, 0.9098039, 0, 1, 1,
0.8254584, 0.6838761, 1.627946, 0.9137255, 0, 1, 1,
0.8281038, 0.02013203, 0.2095634, 0.9215686, 0, 1, 1,
0.8348393, -0.09315639, 0.7123346, 0.9254902, 0, 1, 1,
0.8358964, -0.7534017, 1.880484, 0.9333333, 0, 1, 1,
0.8398974, -0.3989466, 2.829084, 0.9372549, 0, 1, 1,
0.8449585, 0.384877, 0.3404773, 0.945098, 0, 1, 1,
0.8545964, 0.6284692, 2.072426, 0.9490196, 0, 1, 1,
0.8586404, -0.04312725, 1.118821, 0.9568627, 0, 1, 1,
0.8599607, -0.8621345, 4.20414, 0.9607843, 0, 1, 1,
0.8646958, 0.2224765, 0.389555, 0.9686275, 0, 1, 1,
0.8669776, -0.3160624, 1.807428, 0.972549, 0, 1, 1,
0.8709407, 0.3149281, 0.6618984, 0.9803922, 0, 1, 1,
0.8725239, 1.443096, 0.5579516, 0.9843137, 0, 1, 1,
0.8753564, 0.4566484, 2.078009, 0.9921569, 0, 1, 1,
0.893408, -3.847276, 4.768196, 0.9960784, 0, 1, 1,
0.898367, -1.916022, 1.848141, 1, 0, 0.9960784, 1,
0.8996069, 0.5910047, 1.169045, 1, 0, 0.9882353, 1,
0.9056994, -0.06474802, 2.085617, 1, 0, 0.9843137, 1,
0.9100955, -0.9267535, 0.4085933, 1, 0, 0.9764706, 1,
0.9178765, -0.8995214, 2.75908, 1, 0, 0.972549, 1,
0.918632, 1.622347, -0.05945722, 1, 0, 0.9647059, 1,
0.9235247, -1.194256, 1.498963, 1, 0, 0.9607843, 1,
0.9245423, -0.7510734, 3.318378, 1, 0, 0.9529412, 1,
0.9257021, 0.4579477, 1.187837, 1, 0, 0.9490196, 1,
0.9292396, -1.086856, 3.340549, 1, 0, 0.9411765, 1,
0.9387256, 0.4865598, -0.4004834, 1, 0, 0.9372549, 1,
0.9430757, 0.9645402, 0.1545538, 1, 0, 0.9294118, 1,
0.946441, 0.3980503, 1.311618, 1, 0, 0.9254902, 1,
0.9468889, -2.02957, 3.391488, 1, 0, 0.9176471, 1,
0.9632149, 0.5391971, 1.211443, 1, 0, 0.9137255, 1,
0.9660438, 1.088736, 1.180659, 1, 0, 0.9058824, 1,
0.9721702, 0.7159728, 1.112235, 1, 0, 0.9019608, 1,
0.9732, -0.5502204, 2.169694, 1, 0, 0.8941177, 1,
0.9767894, 0.7738206, 0.4091458, 1, 0, 0.8862745, 1,
0.9784867, -0.1264244, 2.106268, 1, 0, 0.8823529, 1,
0.9800082, 1.045176, 1.125751, 1, 0, 0.8745098, 1,
0.9818752, 0.334628, 1.818845, 1, 0, 0.8705882, 1,
0.9823574, -0.8903674, 1.345179, 1, 0, 0.8627451, 1,
0.983746, -0.01422196, 1.793635, 1, 0, 0.8588235, 1,
0.9875616, 1.099439, 1.666233, 1, 0, 0.8509804, 1,
0.9904957, -0.3425407, 1.64695, 1, 0, 0.8470588, 1,
0.9968954, -0.3086696, 2.354838, 1, 0, 0.8392157, 1,
0.998376, -1.42495, 3.075076, 1, 0, 0.8352941, 1,
1.004975, 0.3262998, 1.188361, 1, 0, 0.827451, 1,
1.030447, 1.787226, 0.8344272, 1, 0, 0.8235294, 1,
1.032364, 0.08976324, 0.5611591, 1, 0, 0.8156863, 1,
1.034174, 0.1035697, -0.6751218, 1, 0, 0.8117647, 1,
1.038046, 0.07182748, 2.440169, 1, 0, 0.8039216, 1,
1.049259, 0.7108237, 1.577849, 1, 0, 0.7960784, 1,
1.051766, 0.2522342, 0.9677511, 1, 0, 0.7921569, 1,
1.053234, 0.01826324, 2.002106, 1, 0, 0.7843137, 1,
1.06268, -1.076422, 1.505845, 1, 0, 0.7803922, 1,
1.063835, -1.974157, 2.97848, 1, 0, 0.772549, 1,
1.065348, 1.542286, -0.2874562, 1, 0, 0.7686275, 1,
1.073916, 0.775312, 2.612607, 1, 0, 0.7607843, 1,
1.076647, 0.2793339, 2.256918, 1, 0, 0.7568628, 1,
1.080999, -0.593956, 5.075042, 1, 0, 0.7490196, 1,
1.081603, 1.083333, 0.5257393, 1, 0, 0.7450981, 1,
1.082322, 0.07026736, 2.691577, 1, 0, 0.7372549, 1,
1.082953, -1.347045, 1.826575, 1, 0, 0.7333333, 1,
1.083772, 1.376449, -0.5775165, 1, 0, 0.7254902, 1,
1.086548, -1.967333, 2.41371, 1, 0, 0.7215686, 1,
1.093244, 0.3762736, 0.5884664, 1, 0, 0.7137255, 1,
1.096442, -0.2903596, 2.260681, 1, 0, 0.7098039, 1,
1.099306, 0.05285556, 2.817808, 1, 0, 0.7019608, 1,
1.100726, 0.3364271, 0.2005838, 1, 0, 0.6941177, 1,
1.122238, -0.06778568, 3.024811, 1, 0, 0.6901961, 1,
1.126409, -1.668615, 1.714126, 1, 0, 0.682353, 1,
1.133754, 0.8234618, 1.263083, 1, 0, 0.6784314, 1,
1.149882, 0.2190688, 2.776414, 1, 0, 0.6705883, 1,
1.157336, -0.1838995, -0.4497544, 1, 0, 0.6666667, 1,
1.162681, -0.2976677, 0.671782, 1, 0, 0.6588235, 1,
1.170384, -1.661642, 1.814487, 1, 0, 0.654902, 1,
1.179732, -1.578853, 3.734326, 1, 0, 0.6470588, 1,
1.18027, 0.360576, 1.280842, 1, 0, 0.6431373, 1,
1.18048, -0.5081735, 1.285467, 1, 0, 0.6352941, 1,
1.184964, 1.101252, 0.6742904, 1, 0, 0.6313726, 1,
1.187163, 0.4546316, 1.563288, 1, 0, 0.6235294, 1,
1.193393, -0.1095052, 1.304138, 1, 0, 0.6196079, 1,
1.194117, 0.8637261, 0.4643733, 1, 0, 0.6117647, 1,
1.195599, 0.8934186, 1.507016, 1, 0, 0.6078432, 1,
1.198361, -1.859582, 3.0681, 1, 0, 0.6, 1,
1.210831, 1.167771, 0.9355525, 1, 0, 0.5921569, 1,
1.214731, 0.425623, 2.485931, 1, 0, 0.5882353, 1,
1.222576, -1.466593, 2.00363, 1, 0, 0.5803922, 1,
1.239594, 0.907523, 0.7285032, 1, 0, 0.5764706, 1,
1.244088, -0.145851, 1.542934, 1, 0, 0.5686275, 1,
1.24722, 0.7185934, 1.637855, 1, 0, 0.5647059, 1,
1.250056, 1.323785, -0.08943625, 1, 0, 0.5568628, 1,
1.257305, -1.319784, 3.439614, 1, 0, 0.5529412, 1,
1.258401, -0.4872228, 2.400205, 1, 0, 0.5450981, 1,
1.26923, -1.261622, 2.39018, 1, 0, 0.5411765, 1,
1.279027, -0.5906276, 0.9718366, 1, 0, 0.5333334, 1,
1.287715, -0.1124771, 2.654897, 1, 0, 0.5294118, 1,
1.288931, -0.2610905, 4.148484, 1, 0, 0.5215687, 1,
1.291121, 2.413667, 1.219891, 1, 0, 0.5176471, 1,
1.292084, 0.6312729, 0.3267615, 1, 0, 0.509804, 1,
1.30433, -0.8555047, 0.858401, 1, 0, 0.5058824, 1,
1.339065, -1.54038, 0.5898012, 1, 0, 0.4980392, 1,
1.340908, 1.401892, 1.9417, 1, 0, 0.4901961, 1,
1.351596, 0.2425328, 1.441163, 1, 0, 0.4862745, 1,
1.365037, 0.697551, 0.6533433, 1, 0, 0.4784314, 1,
1.378481, 0.6925219, -0.06078145, 1, 0, 0.4745098, 1,
1.390863, -0.2616054, 2.70982, 1, 0, 0.4666667, 1,
1.404684, 0.1586846, 1.856196, 1, 0, 0.4627451, 1,
1.414594, 0.5428075, 1.656559, 1, 0, 0.454902, 1,
1.417204, -0.6803728, 0.669881, 1, 0, 0.4509804, 1,
1.423192, -0.798767, 1.637282, 1, 0, 0.4431373, 1,
1.430594, 1.204107, 1.554271, 1, 0, 0.4392157, 1,
1.449874, 1.295667, 1.547698, 1, 0, 0.4313726, 1,
1.455547, 0.2063268, 4.669832, 1, 0, 0.427451, 1,
1.458524, -0.05676741, 1.693883, 1, 0, 0.4196078, 1,
1.468989, -0.2448537, 3.095525, 1, 0, 0.4156863, 1,
1.475338, -1.316436, 2.724541, 1, 0, 0.4078431, 1,
1.482404, 0.1436303, 2.873347, 1, 0, 0.4039216, 1,
1.482884, -0.4229445, 1.115795, 1, 0, 0.3960784, 1,
1.487872, 1.19588, 1.343176, 1, 0, 0.3882353, 1,
1.511679, -0.2829382, 3.167204, 1, 0, 0.3843137, 1,
1.526232, 0.1151949, 1.456692, 1, 0, 0.3764706, 1,
1.530111, 0.2147687, 0.9234567, 1, 0, 0.372549, 1,
1.547049, 0.143215, 0.1983015, 1, 0, 0.3647059, 1,
1.557547, 0.4786585, 3.265282, 1, 0, 0.3607843, 1,
1.586384, 0.7788072, 1.192495, 1, 0, 0.3529412, 1,
1.601151, 0.1514971, 2.571031, 1, 0, 0.3490196, 1,
1.602974, 0.7767324, 0.9987352, 1, 0, 0.3411765, 1,
1.614223, -1.996757, 2.024137, 1, 0, 0.3372549, 1,
1.620209, -0.9424207, 2.338653, 1, 0, 0.3294118, 1,
1.632486, -0.252014, 1.404714, 1, 0, 0.3254902, 1,
1.652065, -0.2465269, 1.79973, 1, 0, 0.3176471, 1,
1.657147, 0.03201511, -0.06711784, 1, 0, 0.3137255, 1,
1.693521, 0.8114992, 1.151749, 1, 0, 0.3058824, 1,
1.698177, 0.194192, 0.875925, 1, 0, 0.2980392, 1,
1.705225, -1.704475, 1.615655, 1, 0, 0.2941177, 1,
1.716642, 0.2982883, 0.4178795, 1, 0, 0.2862745, 1,
1.729694, 0.5778971, 2.714012, 1, 0, 0.282353, 1,
1.730364, -1.740177, 2.042287, 1, 0, 0.2745098, 1,
1.753258, 0.4856576, 1.540038, 1, 0, 0.2705882, 1,
1.768222, 0.2397943, 1.64436, 1, 0, 0.2627451, 1,
1.770216, -0.7466356, 1.159771, 1, 0, 0.2588235, 1,
1.785317, 2.184883, 1.516222, 1, 0, 0.2509804, 1,
1.790022, -0.4324813, 1.224828, 1, 0, 0.2470588, 1,
1.793085, 0.2037738, 2.206321, 1, 0, 0.2392157, 1,
1.80207, -0.2858466, 2.296471, 1, 0, 0.2352941, 1,
1.812307, -0.695285, 1.040617, 1, 0, 0.227451, 1,
1.81507, -0.2383363, 2.689809, 1, 0, 0.2235294, 1,
1.817353, -1.127406, 1.515849, 1, 0, 0.2156863, 1,
1.844924, 0.9510188, 1.346318, 1, 0, 0.2117647, 1,
1.849156, -1.113736, 1.689048, 1, 0, 0.2039216, 1,
1.866081, 0.06776527, 1.080313, 1, 0, 0.1960784, 1,
1.871911, 1.080752, 1.886037, 1, 0, 0.1921569, 1,
1.876666, 0.4745855, -0.5392971, 1, 0, 0.1843137, 1,
1.884732, 0.4515978, 0.6710969, 1, 0, 0.1803922, 1,
1.89363, 0.8083976, -0.6165329, 1, 0, 0.172549, 1,
1.899056, -0.8676581, 1.066132, 1, 0, 0.1686275, 1,
1.931357, -0.09676953, 2.288945, 1, 0, 0.1607843, 1,
1.948127, 0.1991548, 1.312527, 1, 0, 0.1568628, 1,
1.951604, -0.09930127, 2.032751, 1, 0, 0.1490196, 1,
1.952171, -0.545945, 1.913083, 1, 0, 0.145098, 1,
1.989857, -0.902025, 1.588448, 1, 0, 0.1372549, 1,
1.990226, 0.6716791, 1.939159, 1, 0, 0.1333333, 1,
2.002234, -1.347399, 0.2221891, 1, 0, 0.1254902, 1,
2.014367, -0.6042368, 2.889788, 1, 0, 0.1215686, 1,
2.021149, -1.208142, 2.416806, 1, 0, 0.1137255, 1,
2.02535, 1.718509, 1.501251, 1, 0, 0.1098039, 1,
2.047523, 1.14751, 0.3732813, 1, 0, 0.1019608, 1,
2.093861, -0.07300294, 2.968558, 1, 0, 0.09411765, 1,
2.094201, -0.4415184, 2.539269, 1, 0, 0.09019608, 1,
2.103176, 0.1954624, 0.4955505, 1, 0, 0.08235294, 1,
2.116405, -0.1411752, 1.426684, 1, 0, 0.07843138, 1,
2.235883, 1.777297, 1.433379, 1, 0, 0.07058824, 1,
2.241188, 0.1490881, 0.2177078, 1, 0, 0.06666667, 1,
2.259088, -0.4465992, 2.129813, 1, 0, 0.05882353, 1,
2.337313, 0.2868881, 2.63851, 1, 0, 0.05490196, 1,
2.404646, 0.9856303, 1.41659, 1, 0, 0.04705882, 1,
2.490784, 0.06739626, 1.346005, 1, 0, 0.04313726, 1,
2.492375, 1.101566, -0.09801497, 1, 0, 0.03529412, 1,
2.597417, 0.2549903, 1.299677, 1, 0, 0.03137255, 1,
2.613744, -1.071583, 1.345118, 1, 0, 0.02352941, 1,
2.626631, 1.007772, 2.686244, 1, 0, 0.01960784, 1,
2.747395, -1.368675, 1.698241, 1, 0, 0.01176471, 1,
2.814285, -1.322649, 1.238091, 1, 0, 0.007843138, 1
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
-0.2353245, -5.716733, -7.868448, 0, -0.5, 0.5, 0.5,
-0.2353245, -5.716733, -7.868448, 1, -0.5, 0.5, 0.5,
-0.2353245, -5.716733, -7.868448, 1, 1.5, 0.5, 0.5,
-0.2353245, -5.716733, -7.868448, 0, 1.5, 0.5, 0.5
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
-4.318751, -0.6914315, -7.868448, 0, -0.5, 0.5, 0.5,
-4.318751, -0.6914315, -7.868448, 1, -0.5, 0.5, 0.5,
-4.318751, -0.6914315, -7.868448, 1, 1.5, 0.5, 0.5,
-4.318751, -0.6914315, -7.868448, 0, 1.5, 0.5, 0.5
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
-4.318751, -5.716733, -0.1410441, 0, -0.5, 0.5, 0.5,
-4.318751, -5.716733, -0.1410441, 1, -0.5, 0.5, 0.5,
-4.318751, -5.716733, -0.1410441, 1, 1.5, 0.5, 0.5,
-4.318751, -5.716733, -0.1410441, 0, 1.5, 0.5, 0.5
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
-3, -4.557048, -6.085201,
2, -4.557048, -6.085201,
-3, -4.557048, -6.085201,
-3, -4.750329, -6.382409,
-2, -4.557048, -6.085201,
-2, -4.750329, -6.382409,
-1, -4.557048, -6.085201,
-1, -4.750329, -6.382409,
0, -4.557048, -6.085201,
0, -4.750329, -6.382409,
1, -4.557048, -6.085201,
1, -4.750329, -6.382409,
2, -4.557048, -6.085201,
2, -4.750329, -6.382409
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
-3, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
-3, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
-3, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
-3, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5,
-2, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
-2, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
-2, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
-2, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5,
-1, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
-1, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
-1, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
-1, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5,
0, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
0, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
0, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
0, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5,
1, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
1, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
1, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
1, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5,
2, -5.13689, -6.976825, 0, -0.5, 0.5, 0.5,
2, -5.13689, -6.976825, 1, -0.5, 0.5, 0.5,
2, -5.13689, -6.976825, 1, 1.5, 0.5, 0.5,
2, -5.13689, -6.976825, 0, 1.5, 0.5, 0.5
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
-3.376422, -4, -6.085201,
-3.376422, 2, -6.085201,
-3.376422, -4, -6.085201,
-3.533477, -4, -6.382409,
-3.376422, -2, -6.085201,
-3.533477, -2, -6.382409,
-3.376422, 0, -6.085201,
-3.533477, 0, -6.382409,
-3.376422, 2, -6.085201,
-3.533477, 2, -6.382409
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
"-4",
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
-3.847587, -4, -6.976825, 0, -0.5, 0.5, 0.5,
-3.847587, -4, -6.976825, 1, -0.5, 0.5, 0.5,
-3.847587, -4, -6.976825, 1, 1.5, 0.5, 0.5,
-3.847587, -4, -6.976825, 0, 1.5, 0.5, 0.5,
-3.847587, -2, -6.976825, 0, -0.5, 0.5, 0.5,
-3.847587, -2, -6.976825, 1, -0.5, 0.5, 0.5,
-3.847587, -2, -6.976825, 1, 1.5, 0.5, 0.5,
-3.847587, -2, -6.976825, 0, 1.5, 0.5, 0.5,
-3.847587, 0, -6.976825, 0, -0.5, 0.5, 0.5,
-3.847587, 0, -6.976825, 1, -0.5, 0.5, 0.5,
-3.847587, 0, -6.976825, 1, 1.5, 0.5, 0.5,
-3.847587, 0, -6.976825, 0, 1.5, 0.5, 0.5,
-3.847587, 2, -6.976825, 0, -0.5, 0.5, 0.5,
-3.847587, 2, -6.976825, 1, -0.5, 0.5, 0.5,
-3.847587, 2, -6.976825, 1, 1.5, 0.5, 0.5,
-3.847587, 2, -6.976825, 0, 1.5, 0.5, 0.5
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
-3.376422, -4.557048, -4,
-3.376422, -4.557048, 4,
-3.376422, -4.557048, -4,
-3.533477, -4.750329, -4,
-3.376422, -4.557048, -2,
-3.533477, -4.750329, -2,
-3.376422, -4.557048, 0,
-3.533477, -4.750329, 0,
-3.376422, -4.557048, 2,
-3.533477, -4.750329, 2,
-3.376422, -4.557048, 4,
-3.533477, -4.750329, 4
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
-3.847587, -5.13689, -4, 0, -0.5, 0.5, 0.5,
-3.847587, -5.13689, -4, 1, -0.5, 0.5, 0.5,
-3.847587, -5.13689, -4, 1, 1.5, 0.5, 0.5,
-3.847587, -5.13689, -4, 0, 1.5, 0.5, 0.5,
-3.847587, -5.13689, -2, 0, -0.5, 0.5, 0.5,
-3.847587, -5.13689, -2, 1, -0.5, 0.5, 0.5,
-3.847587, -5.13689, -2, 1, 1.5, 0.5, 0.5,
-3.847587, -5.13689, -2, 0, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 0, 0, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 0, 1, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 0, 1, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 0, 0, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 2, 0, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 2, 1, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 2, 1, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 2, 0, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 4, 0, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 4, 1, -0.5, 0.5, 0.5,
-3.847587, -5.13689, 4, 1, 1.5, 0.5, 0.5,
-3.847587, -5.13689, 4, 0, 1.5, 0.5, 0.5
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
-3.376422, -4.557048, -6.085201,
-3.376422, 3.174185, -6.085201,
-3.376422, -4.557048, 5.803113,
-3.376422, 3.174185, 5.803113,
-3.376422, -4.557048, -6.085201,
-3.376422, -4.557048, 5.803113,
-3.376422, 3.174185, -6.085201,
-3.376422, 3.174185, 5.803113,
-3.376422, -4.557048, -6.085201,
2.905773, -4.557048, -6.085201,
-3.376422, -4.557048, 5.803113,
2.905773, -4.557048, 5.803113,
-3.376422, 3.174185, -6.085201,
2.905773, 3.174185, -6.085201,
-3.376422, 3.174185, 5.803113,
2.905773, 3.174185, 5.803113,
2.905773, -4.557048, -6.085201,
2.905773, 3.174185, -6.085201,
2.905773, -4.557048, 5.803113,
2.905773, 3.174185, 5.803113,
2.905773, -4.557048, -6.085201,
2.905773, -4.557048, 5.803113,
2.905773, 3.174185, -6.085201,
2.905773, 3.174185, 5.803113
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
var radius = 8.282208;
var distance = 36.84848;
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
mvMatrix.translate( 0.2353245, 0.6914315, 0.1410441 );
mvMatrix.scale( 1.425439, 1.158274, 0.7532511 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.84848);
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
Alaproclate_hydrochl<-read.table("Alaproclate_hydrochl.xyz")
```

```
## Error in read.table("Alaproclate_hydrochl.xyz"): no lines available in input
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
-3.284934, 0.6261933, -1.074063, 0, 0, 1, 1, 1,
-2.888263, -0.5083642, -2.666541, 1, 0, 0, 1, 1,
-2.799474, -0.1565609, -2.206603, 1, 0, 0, 1, 1,
-2.770606, -0.9882879, -1.093813, 1, 0, 0, 1, 1,
-2.607463, 0.2469399, -0.2762377, 1, 0, 0, 1, 1,
-2.525291, 0.8856196, -1.368133, 1, 0, 0, 1, 1,
-2.471184, 1.212738, -1.514608, 0, 0, 0, 1, 1,
-2.398029, -0.5453568, -2.848788, 0, 0, 0, 1, 1,
-2.381747, -0.480886, -1.560552, 0, 0, 0, 1, 1,
-2.340513, -0.6359286, -2.31327, 0, 0, 0, 1, 1,
-2.295949, -1.991487, -3.867642, 0, 0, 0, 1, 1,
-2.281378, 1.467034, -1.460714, 0, 0, 0, 1, 1,
-2.246228, 1.372362, -1.728873, 0, 0, 0, 1, 1,
-2.166103, -0.4731944, -3.346512, 1, 1, 1, 1, 1,
-2.101164, -1.01809, -2.853275, 1, 1, 1, 1, 1,
-2.085778, -1.266391, -4.415961, 1, 1, 1, 1, 1,
-2.071048, -0.4461091, -1.556075, 1, 1, 1, 1, 1,
-2.063463, -0.7466221, -1.799606, 1, 1, 1, 1, 1,
-2.053061, -0.752198, -2.03177, 1, 1, 1, 1, 1,
-2.015273, 0.4816979, -0.8262902, 1, 1, 1, 1, 1,
-2.014994, 0.2798706, 1.002775, 1, 1, 1, 1, 1,
-2.002873, 3.061594, -0.3164427, 1, 1, 1, 1, 1,
-1.943071, -0.3051549, -2.229945, 1, 1, 1, 1, 1,
-1.940181, -0.5262524, -0.2680828, 1, 1, 1, 1, 1,
-1.929696, 0.6911845, -0.7631668, 1, 1, 1, 1, 1,
-1.909925, -3.329572, -2.347628, 1, 1, 1, 1, 1,
-1.894795, 0.4471027, -0.3186278, 1, 1, 1, 1, 1,
-1.893137, 1.884373, 0.4295279, 1, 1, 1, 1, 1,
-1.862522, -0.371668, -2.255183, 0, 0, 1, 1, 1,
-1.859737, 0.2160026, -1.782421, 1, 0, 0, 1, 1,
-1.832763, -1.260861, -2.766962, 1, 0, 0, 1, 1,
-1.821164, 0.8663175, -1.000121, 1, 0, 0, 1, 1,
-1.784604, 0.1148777, 0.5107648, 1, 0, 0, 1, 1,
-1.768561, 0.2519158, -1.875389, 1, 0, 0, 1, 1,
-1.759614, 1.299411, 0.6560401, 0, 0, 0, 1, 1,
-1.75509, 0.457882, -1.742506, 0, 0, 0, 1, 1,
-1.751064, 0.3766198, -1.68766, 0, 0, 0, 1, 1,
-1.724563, 1.392074, -0.9826666, 0, 0, 0, 1, 1,
-1.722232, 0.533322, -1.631145, 0, 0, 0, 1, 1,
-1.718333, -0.7198163, -3.092532, 0, 0, 0, 1, 1,
-1.703606, -0.7927255, -1.374699, 0, 0, 0, 1, 1,
-1.694797, -0.117576, -1.590019, 1, 1, 1, 1, 1,
-1.659147, 0.5087987, -3.575993, 1, 1, 1, 1, 1,
-1.649638, 0.5213352, -1.613094, 1, 1, 1, 1, 1,
-1.633097, 0.2152889, -0.1210792, 1, 1, 1, 1, 1,
-1.631571, 0.5934705, -0.8174767, 1, 1, 1, 1, 1,
-1.628775, -0.2117593, -0.07139445, 1, 1, 1, 1, 1,
-1.624976, -0.5217459, -1.092875, 1, 1, 1, 1, 1,
-1.621333, 0.2518649, -2.288531, 1, 1, 1, 1, 1,
-1.604213, 0.02111365, -1.342625, 1, 1, 1, 1, 1,
-1.595076, -3.208485, -1.738821, 1, 1, 1, 1, 1,
-1.5928, 0.670298, -1.176449, 1, 1, 1, 1, 1,
-1.576818, 0.4164311, -1.975328, 1, 1, 1, 1, 1,
-1.573276, -0.7062247, -2.715029, 1, 1, 1, 1, 1,
-1.572936, 0.06403317, -1.985774, 1, 1, 1, 1, 1,
-1.571837, 0.845951, 0.5230688, 1, 1, 1, 1, 1,
-1.565601, -0.0166634, -0.8498807, 0, 0, 1, 1, 1,
-1.561689, -0.4658692, -2.398018, 1, 0, 0, 1, 1,
-1.55961, -1.189649, -2.185285, 1, 0, 0, 1, 1,
-1.557972, -0.5604159, -1.73471, 1, 0, 0, 1, 1,
-1.553514, -0.4851652, -3.639624, 1, 0, 0, 1, 1,
-1.55094, 0.3159246, -0.4484278, 1, 0, 0, 1, 1,
-1.54858, 0.4797805, -2.27117, 0, 0, 0, 1, 1,
-1.537199, 0.9329568, -0.2982658, 0, 0, 0, 1, 1,
-1.535383, 0.7987928, -0.8188762, 0, 0, 0, 1, 1,
-1.527381, 1.277682, -1.54019, 0, 0, 0, 1, 1,
-1.526406, -0.005546859, -1.895835, 0, 0, 0, 1, 1,
-1.526217, 0.2590902, -1.565087, 0, 0, 0, 1, 1,
-1.524235, -1.80945, -3.617549, 0, 0, 0, 1, 1,
-1.516701, 1.827871, -1.122698, 1, 1, 1, 1, 1,
-1.499133, -0.9885449, -1.920271, 1, 1, 1, 1, 1,
-1.492458, -0.8060121, -1.595946, 1, 1, 1, 1, 1,
-1.489853, -0.8556738, -1.65203, 1, 1, 1, 1, 1,
-1.488061, -1.875906, -2.661011, 1, 1, 1, 1, 1,
-1.487975, 1.728045, 0.4043473, 1, 1, 1, 1, 1,
-1.479817, -0.7260421, -2.608403, 1, 1, 1, 1, 1,
-1.479208, 0.5516164, -0.1272141, 1, 1, 1, 1, 1,
-1.479171, 0.2607749, -2.176603, 1, 1, 1, 1, 1,
-1.4706, 2.124793, -1.916197, 1, 1, 1, 1, 1,
-1.462848, 0.4542, -2.330355, 1, 1, 1, 1, 1,
-1.461536, -1.617214, -2.009309, 1, 1, 1, 1, 1,
-1.461279, 0.7631739, 0.1278855, 1, 1, 1, 1, 1,
-1.445285, 0.9015091, -0.7180796, 1, 1, 1, 1, 1,
-1.431392, -0.1476998, -2.058449, 1, 1, 1, 1, 1,
-1.411167, -0.5336688, -3.090447, 0, 0, 1, 1, 1,
-1.410472, 1.817755, -0.5585518, 1, 0, 0, 1, 1,
-1.394471, 0.1055685, -1.593295, 1, 0, 0, 1, 1,
-1.392558, -1.813452, -4.544661, 1, 0, 0, 1, 1,
-1.39112, 0.6826648, -1.352125, 1, 0, 0, 1, 1,
-1.389133, 0.6937717, -0.8844884, 1, 0, 0, 1, 1,
-1.385971, 0.6313648, -1.533816, 0, 0, 0, 1, 1,
-1.382368, -0.5500954, -1.360324, 0, 0, 0, 1, 1,
-1.374305, -2.197586, -1.673685, 0, 0, 0, 1, 1,
-1.364099, 0.8589152, -4.078199, 0, 0, 0, 1, 1,
-1.358252, -1.863473, -1.911938, 0, 0, 0, 1, 1,
-1.353603, -0.09790581, -1.217029, 0, 0, 0, 1, 1,
-1.351656, 0.868712, -0.542533, 0, 0, 0, 1, 1,
-1.349696, -0.1493176, -1.186455, 1, 1, 1, 1, 1,
-1.331375, -2.702685, -3.021403, 1, 1, 1, 1, 1,
-1.301326, 0.6314195, -2.505459, 1, 1, 1, 1, 1,
-1.295939, -0.6453786, -1.841374, 1, 1, 1, 1, 1,
-1.278446, -1.092082, -2.626866, 1, 1, 1, 1, 1,
-1.273988, 0.05982884, -0.8358002, 1, 1, 1, 1, 1,
-1.259274, 0.3255314, -1.733714, 1, 1, 1, 1, 1,
-1.255393, -1.85614, -2.78209, 1, 1, 1, 1, 1,
-1.245902, 1.870683, 0.3891468, 1, 1, 1, 1, 1,
-1.244151, -2.504786, -2.949822, 1, 1, 1, 1, 1,
-1.2403, -1.762628, -2.851326, 1, 1, 1, 1, 1,
-1.237093, -0.003284925, -1.428428, 1, 1, 1, 1, 1,
-1.235753, 0.8765993, -2.77596, 1, 1, 1, 1, 1,
-1.228343, 0.9623972, 0.9037257, 1, 1, 1, 1, 1,
-1.222104, 0.0239082, -3.291255, 1, 1, 1, 1, 1,
-1.217031, -0.1210354, -3.054194, 0, 0, 1, 1, 1,
-1.211126, 0.7959003, -0.2380038, 1, 0, 0, 1, 1,
-1.209302, 1.601114, 0.04154687, 1, 0, 0, 1, 1,
-1.204829, -0.7428423, -3.514824, 1, 0, 0, 1, 1,
-1.202377, 0.3138181, -0.2092394, 1, 0, 0, 1, 1,
-1.194131, -0.1871888, -0.603657, 1, 0, 0, 1, 1,
-1.19377, 0.6950945, -1.164235, 0, 0, 0, 1, 1,
-1.193421, 0.4322277, -0.44419, 0, 0, 0, 1, 1,
-1.18813, 0.02891484, -2.055614, 0, 0, 0, 1, 1,
-1.184992, 1.57135, 0.518043, 0, 0, 0, 1, 1,
-1.184716, -0.2593499, -1.470717, 0, 0, 0, 1, 1,
-1.183906, -1.199001, -2.258243, 0, 0, 0, 1, 1,
-1.17901, 0.06736793, -0.0485781, 0, 0, 0, 1, 1,
-1.17748, -0.5543669, -1.307793, 1, 1, 1, 1, 1,
-1.172202, 1.274667, -2.010968, 1, 1, 1, 1, 1,
-1.171635, -0.6521523, -3.043799, 1, 1, 1, 1, 1,
-1.171619, 0.007417385, -0.5373155, 1, 1, 1, 1, 1,
-1.171416, -0.6089767, -1.809029, 1, 1, 1, 1, 1,
-1.161684, -1.555243, -1.837355, 1, 1, 1, 1, 1,
-1.158778, -0.003899594, -1.251772, 1, 1, 1, 1, 1,
-1.154756, 0.3387249, 0.3513038, 1, 1, 1, 1, 1,
-1.146731, -1.636702, -3.069964, 1, 1, 1, 1, 1,
-1.141061, 0.2706252, -0.9989085, 1, 1, 1, 1, 1,
-1.135575, -1.20814, -3.314211, 1, 1, 1, 1, 1,
-1.132602, 1.405719, -0.3179096, 1, 1, 1, 1, 1,
-1.132234, 0.2508183, -1.420244, 1, 1, 1, 1, 1,
-1.130816, -0.5084546, -3.043327, 1, 1, 1, 1, 1,
-1.127416, 1.329106, -1.33922, 1, 1, 1, 1, 1,
-1.122424, -1.290432, -2.011181, 0, 0, 1, 1, 1,
-1.122095, -1.560093, -2.971646, 1, 0, 0, 1, 1,
-1.108907, -0.3548805, -0.4066667, 1, 0, 0, 1, 1,
-1.098907, 1.616814, -1.09037, 1, 0, 0, 1, 1,
-1.097013, 1.095227, -2.230497, 1, 0, 0, 1, 1,
-1.092919, -1.173748, -1.035703, 1, 0, 0, 1, 1,
-1.092611, -0.5036631, -1.4953, 0, 0, 0, 1, 1,
-1.09004, 0.3665862, -2.580938, 0, 0, 0, 1, 1,
-1.086473, 0.3298362, -1.588398, 0, 0, 0, 1, 1,
-1.08534, -0.3398868, -2.273745, 0, 0, 0, 1, 1,
-1.084118, 0.200552, -0.96478, 0, 0, 0, 1, 1,
-1.077071, -0.4934147, -2.788783, 0, 0, 0, 1, 1,
-1.075048, 0.4220831, -2.41029, 0, 0, 0, 1, 1,
-1.073133, 0.7659445, -0.6866975, 1, 1, 1, 1, 1,
-1.072169, 1.649458, 0.5062475, 1, 1, 1, 1, 1,
-1.057905, 0.3233012, -0.7395107, 1, 1, 1, 1, 1,
-1.048671, 1.681032, -0.4776968, 1, 1, 1, 1, 1,
-1.032472, 0.8629506, -0.3004881, 1, 1, 1, 1, 1,
-1.023468, -0.4354987, -3.069481, 1, 1, 1, 1, 1,
-1.013736, 2.061299, -0.2923902, 1, 1, 1, 1, 1,
-1.012279, -1.873498, -2.262179, 1, 1, 1, 1, 1,
-1.000162, -1.296331, -1.266706, 1, 1, 1, 1, 1,
-0.9923115, -0.9537449, -4.031581, 1, 1, 1, 1, 1,
-0.9897508, 0.911429, -0.9692744, 1, 1, 1, 1, 1,
-0.9895985, 0.07802638, -0.9891121, 1, 1, 1, 1, 1,
-0.9890209, 0.4605916, -1.523587, 1, 1, 1, 1, 1,
-0.9881435, 0.4085589, -0.6050215, 1, 1, 1, 1, 1,
-0.9851797, 0.3308379, -0.7526796, 1, 1, 1, 1, 1,
-0.9801648, -0.3778049, -1.868235, 0, 0, 1, 1, 1,
-0.9792043, 1.689818, -0.3657784, 1, 0, 0, 1, 1,
-0.9778486, -1.495005, -2.739798, 1, 0, 0, 1, 1,
-0.9723629, -0.4794703, -2.476224, 1, 0, 0, 1, 1,
-0.9707674, 2.136871, -0.92628, 1, 0, 0, 1, 1,
-0.9687415, -0.8597991, -2.226588, 1, 0, 0, 1, 1,
-0.9665729, 0.4707613, 0.9268908, 0, 0, 0, 1, 1,
-0.9658442, 1.088363, -0.5185965, 0, 0, 0, 1, 1,
-0.9655348, -0.3920962, -1.90192, 0, 0, 0, 1, 1,
-0.9573966, -0.5166372, -1.519945, 0, 0, 0, 1, 1,
-0.9457771, -1.026186, -2.234235, 0, 0, 0, 1, 1,
-0.9451029, 0.147579, -0.02752433, 0, 0, 0, 1, 1,
-0.9397584, -0.7551695, -2.928865, 0, 0, 0, 1, 1,
-0.9397344, -0.08701324, -1.601557, 1, 1, 1, 1, 1,
-0.9377783, -1.339913, -3.508781, 1, 1, 1, 1, 1,
-0.9375224, 1.77124, -0.9032551, 1, 1, 1, 1, 1,
-0.9287135, -0.7425204, -1.693853, 1, 1, 1, 1, 1,
-0.9206048, -1.183362, -3.152293, 1, 1, 1, 1, 1,
-0.9183829, -2.074829, -3.266844, 1, 1, 1, 1, 1,
-0.9178553, -1.137985, -2.119147, 1, 1, 1, 1, 1,
-0.9172149, -0.3688323, -1.858539, 1, 1, 1, 1, 1,
-0.915139, -0.6342583, -3.65134, 1, 1, 1, 1, 1,
-0.9138133, -1.133477, -2.336015, 1, 1, 1, 1, 1,
-0.9065227, 1.063318, -1.58045, 1, 1, 1, 1, 1,
-0.9044261, -1.466114, -1.549811, 1, 1, 1, 1, 1,
-0.8970909, 2.197602, -0.6502313, 1, 1, 1, 1, 1,
-0.8897161, -1.408872, -2.2707, 1, 1, 1, 1, 1,
-0.8769435, 1.948475, 0.5935553, 1, 1, 1, 1, 1,
-0.8758425, -0.4741434, -4.364293, 0, 0, 1, 1, 1,
-0.8754495, 2.383129, -0.7685933, 1, 0, 0, 1, 1,
-0.872538, 1.900494, -1.066492, 1, 0, 0, 1, 1,
-0.8708868, -1.111666, -2.240582, 1, 0, 0, 1, 1,
-0.8639926, -0.226831, -1.283671, 1, 0, 0, 1, 1,
-0.8630409, 0.5349477, -0.3682101, 1, 0, 0, 1, 1,
-0.8565027, -0.833804, -1.274464, 0, 0, 0, 1, 1,
-0.8433945, -1.031643, -2.158443, 0, 0, 0, 1, 1,
-0.8388885, -0.86144, -0.7749295, 0, 0, 0, 1, 1,
-0.8374988, 1.175803, -0.1728643, 0, 0, 0, 1, 1,
-0.8358669, 1.384573, -0.5418749, 0, 0, 0, 1, 1,
-0.8302213, -1.390781, -2.576408, 0, 0, 0, 1, 1,
-0.8296014, 0.4011176, 1.080894, 0, 0, 0, 1, 1,
-0.8281834, 0.3253461, -2.092029, 1, 1, 1, 1, 1,
-0.8276703, -0.1740699, -1.947489, 1, 1, 1, 1, 1,
-0.827211, 0.8551347, -0.718253, 1, 1, 1, 1, 1,
-0.8263187, 1.835131, -1.006154, 1, 1, 1, 1, 1,
-0.8063629, -1.217229, -1.419819, 1, 1, 1, 1, 1,
-0.8052564, 0.5091338, -0.5332637, 1, 1, 1, 1, 1,
-0.8002154, 0.05259739, -1.894281, 1, 1, 1, 1, 1,
-0.7978997, 0.6629397, -0.9041971, 1, 1, 1, 1, 1,
-0.7882817, -1.559509, -3.167006, 1, 1, 1, 1, 1,
-0.7877107, -0.2506311, -1.592069, 1, 1, 1, 1, 1,
-0.7874719, -1.252964, -1.522191, 1, 1, 1, 1, 1,
-0.7863169, 0.5625237, -1.270465, 1, 1, 1, 1, 1,
-0.7822511, 0.3228477, -0.3646541, 1, 1, 1, 1, 1,
-0.7805415, -0.2110302, -0.2423442, 1, 1, 1, 1, 1,
-0.7794415, 0.7208886, -1.044326, 1, 1, 1, 1, 1,
-0.7784107, 0.7204979, -0.5351608, 0, 0, 1, 1, 1,
-0.7751155, -0.1569225, -1.212327, 1, 0, 0, 1, 1,
-0.7692972, -0.6871513, -2.369542, 1, 0, 0, 1, 1,
-0.76161, -0.7817044, -1.849218, 1, 0, 0, 1, 1,
-0.7549173, -0.5276753, -2.405604, 1, 0, 0, 1, 1,
-0.7498883, 1.13859, -0.2316705, 1, 0, 0, 1, 1,
-0.7485294, -0.2894185, -0.4784174, 0, 0, 0, 1, 1,
-0.7484053, 0.6217519, -1.368891, 0, 0, 0, 1, 1,
-0.7434098, 1.541707, -1.181843, 0, 0, 0, 1, 1,
-0.7432778, -0.7406168, -2.497833, 0, 0, 0, 1, 1,
-0.7409007, 0.4519996, 0.1270848, 0, 0, 0, 1, 1,
-0.7401897, -0.380283, -1.266143, 0, 0, 0, 1, 1,
-0.7372794, -1.099612, -3.234009, 0, 0, 0, 1, 1,
-0.7371823, 0.7698411, -1.223616, 1, 1, 1, 1, 1,
-0.7322868, -1.408578, -3.673565, 1, 1, 1, 1, 1,
-0.7316073, 0.5973468, -2.097662, 1, 1, 1, 1, 1,
-0.7246645, 0.7517608, -0.8247702, 1, 1, 1, 1, 1,
-0.7232323, 0.1602749, -3.533758, 1, 1, 1, 1, 1,
-0.7171125, 0.9699455, -1.945819, 1, 1, 1, 1, 1,
-0.713649, -1.530785, -1.80657, 1, 1, 1, 1, 1,
-0.7090937, -1.293536, -2.876311, 1, 1, 1, 1, 1,
-0.7053109, 0.74088, -0.5207309, 1, 1, 1, 1, 1,
-0.7036617, 1.284401, -0.300069, 1, 1, 1, 1, 1,
-0.7023751, -1.57408, -2.965545, 1, 1, 1, 1, 1,
-0.6989244, 1.16759, 0.3166771, 1, 1, 1, 1, 1,
-0.6989015, -1.468609, -2.580493, 1, 1, 1, 1, 1,
-0.6979572, 0.9964414, -1.115821, 1, 1, 1, 1, 1,
-0.6906141, 0.6340583, -1.342951, 1, 1, 1, 1, 1,
-0.6856079, -0.713277, -2.40903, 0, 0, 1, 1, 1,
-0.6855848, -0.7248197, -4.406409, 1, 0, 0, 1, 1,
-0.6676012, 0.9771142, -1.792244, 1, 0, 0, 1, 1,
-0.6664054, -0.04020524, 0.02145041, 1, 0, 0, 1, 1,
-0.6644313, 0.4414692, -2.365992, 1, 0, 0, 1, 1,
-0.6607712, -0.3015183, -3.397776, 1, 0, 0, 1, 1,
-0.6574255, -0.03839249, -1.816462, 0, 0, 0, 1, 1,
-0.6549245, 0.8830651, -1.275962, 0, 0, 0, 1, 1,
-0.6547852, 0.9675661, -0.255277, 0, 0, 0, 1, 1,
-0.6531684, -1.808625, -3.535254, 0, 0, 0, 1, 1,
-0.6531369, 0.4475594, 0.1571519, 0, 0, 0, 1, 1,
-0.6507086, 0.1553569, -2.357942, 0, 0, 0, 1, 1,
-0.6491535, -0.09704392, -2.123476, 0, 0, 0, 1, 1,
-0.6462995, -1.547234, -4.230406, 1, 1, 1, 1, 1,
-0.6442389, 0.4692643, -0.901914, 1, 1, 1, 1, 1,
-0.6438512, -0.4662599, -2.119172, 1, 1, 1, 1, 1,
-0.6418213, -1.930475, -2.752842, 1, 1, 1, 1, 1,
-0.6398332, 0.6149115, -2.128592, 1, 1, 1, 1, 1,
-0.6340925, 0.4269055, 0.7747065, 1, 1, 1, 1, 1,
-0.6293095, 0.2269503, -0.7989214, 1, 1, 1, 1, 1,
-0.629296, -0.1869928, -1.244435, 1, 1, 1, 1, 1,
-0.6287432, 0.4662312, -1.434225, 1, 1, 1, 1, 1,
-0.6250522, 1.19235, -0.5995781, 1, 1, 1, 1, 1,
-0.6246168, -0.9889576, -3.099194, 1, 1, 1, 1, 1,
-0.6195143, 0.1932456, -2.876497, 1, 1, 1, 1, 1,
-0.6188267, -0.972961, -3.379175, 1, 1, 1, 1, 1,
-0.610899, 0.8254501, 0.002884044, 1, 1, 1, 1, 1,
-0.6022572, -0.9571478, -2.892705, 1, 1, 1, 1, 1,
-0.597006, -0.9721588, -1.978559, 0, 0, 1, 1, 1,
-0.5956489, -0.008229693, -2.246408, 1, 0, 0, 1, 1,
-0.5930091, 0.9876204, -0.6609643, 1, 0, 0, 1, 1,
-0.5879363, 0.851265, 0.1809051, 1, 0, 0, 1, 1,
-0.5845674, 0.3997472, -1.617316, 1, 0, 0, 1, 1,
-0.5821519, -1.082365, -2.953518, 1, 0, 0, 1, 1,
-0.5817079, 1.679397, -0.3354393, 0, 0, 0, 1, 1,
-0.57317, -0.3347598, -0.4929186, 0, 0, 0, 1, 1,
-0.5711319, -0.9603743, -2.166089, 0, 0, 0, 1, 1,
-0.5705093, 0.494383, -2.359071, 0, 0, 0, 1, 1,
-0.5694606, 1.238208, 0.3172226, 0, 0, 0, 1, 1,
-0.5673484, 0.0706518, -1.378286, 0, 0, 0, 1, 1,
-0.5655028, 0.30114, -0.7283195, 0, 0, 0, 1, 1,
-0.5636469, -0.2506629, -2.296851, 1, 1, 1, 1, 1,
-0.5627379, 0.7588212, -1.134072, 1, 1, 1, 1, 1,
-0.561822, -1.149387, -1.884629, 1, 1, 1, 1, 1,
-0.5613844, -0.4546776, -3.088317, 1, 1, 1, 1, 1,
-0.558004, 0.9973919, -1.954732, 1, 1, 1, 1, 1,
-0.5573934, -1.973834, -0.7556431, 1, 1, 1, 1, 1,
-0.5559123, 0.8175581, -2.046917, 1, 1, 1, 1, 1,
-0.5463797, 0.9274883, -2.821321, 1, 1, 1, 1, 1,
-0.5387704, -1.533932, -2.427811, 1, 1, 1, 1, 1,
-0.5314215, 0.05403646, -1.151603, 1, 1, 1, 1, 1,
-0.5313602, 0.333447, -1.719188, 1, 1, 1, 1, 1,
-0.5188106, -0.670688, -2.895812, 1, 1, 1, 1, 1,
-0.5187748, -2.140006, -2.250506, 1, 1, 1, 1, 1,
-0.5171427, -0.4449568, -1.905482, 1, 1, 1, 1, 1,
-0.5150448, 0.1263876, -2.04371, 1, 1, 1, 1, 1,
-0.5087104, -0.6331462, -4.271023, 0, 0, 1, 1, 1,
-0.5073737, -1.994815, -1.637339, 1, 0, 0, 1, 1,
-0.5071256, 1.170308, -2.675093, 1, 0, 0, 1, 1,
-0.5047342, -0.886584, -2.287555, 1, 0, 0, 1, 1,
-0.5042992, 0.578993, -1.461958, 1, 0, 0, 1, 1,
-0.496745, 0.38777, -0.6121966, 1, 0, 0, 1, 1,
-0.4948724, 0.3302115, -0.1994801, 0, 0, 0, 1, 1,
-0.4925315, -0.3448834, -2.877194, 0, 0, 0, 1, 1,
-0.4921034, -1.089786, -4.76432, 0, 0, 0, 1, 1,
-0.4910333, -0.1779954, -2.848768, 0, 0, 0, 1, 1,
-0.4879193, 0.9912398, -0.3929887, 0, 0, 0, 1, 1,
-0.4835569, 0.1502255, -1.580827, 0, 0, 0, 1, 1,
-0.4795172, 0.01686336, -2.768537, 0, 0, 0, 1, 1,
-0.4789587, 0.3325149, -2.207204, 1, 1, 1, 1, 1,
-0.4699159, -1.501929, -2.0601, 1, 1, 1, 1, 1,
-0.4684261, -0.7857657, -3.206886, 1, 1, 1, 1, 1,
-0.467373, -0.6192243, -1.717579, 1, 1, 1, 1, 1,
-0.4538755, -0.1181003, -3.482785, 1, 1, 1, 1, 1,
-0.4531437, -0.4379367, -2.304067, 1, 1, 1, 1, 1,
-0.4495367, -0.09358311, -2.620191, 1, 1, 1, 1, 1,
-0.4483851, 0.008140822, -2.56173, 1, 1, 1, 1, 1,
-0.4476609, 1.894698, 0.308945, 1, 1, 1, 1, 1,
-0.4476585, -1.855232, -4.211807, 1, 1, 1, 1, 1,
-0.4464145, -0.5200927, -3.314871, 1, 1, 1, 1, 1,
-0.4451474, -1.685616, -2.538041, 1, 1, 1, 1, 1,
-0.4435075, -0.1501951, -2.243026, 1, 1, 1, 1, 1,
-0.4406742, 0.8822545, -1.848089, 1, 1, 1, 1, 1,
-0.4387102, -0.7232389, -1.479908, 1, 1, 1, 1, 1,
-0.4323937, -0.3805591, -4.531829, 0, 0, 1, 1, 1,
-0.430905, -0.7199128, -4.37588, 1, 0, 0, 1, 1,
-0.4245762, 2.157697, -0.6850829, 1, 0, 0, 1, 1,
-0.4230453, -0.9688197, -2.846913, 1, 0, 0, 1, 1,
-0.414451, -1.002715, -1.87566, 1, 0, 0, 1, 1,
-0.4120755, -1.615817, -4.256937, 1, 0, 0, 1, 1,
-0.4116616, 0.5117623, -2.920691, 0, 0, 0, 1, 1,
-0.403377, -1.622916, -4.737186, 0, 0, 0, 1, 1,
-0.3960997, -1.516953, -1.869796, 0, 0, 0, 1, 1,
-0.3927142, -0.8735889, -2.340187, 0, 0, 0, 1, 1,
-0.3894881, -0.4022043, -1.481164, 0, 0, 0, 1, 1,
-0.388679, -1.645361, -2.80266, 0, 0, 0, 1, 1,
-0.3867081, -0.288791, -2.49849, 0, 0, 0, 1, 1,
-0.3857371, -0.7733747, -2.787708, 1, 1, 1, 1, 1,
-0.3857193, -0.4448828, -1.633218, 1, 1, 1, 1, 1,
-0.3834381, -0.02000302, -2.914533, 1, 1, 1, 1, 1,
-0.3795269, -1.255561, -3.33006, 1, 1, 1, 1, 1,
-0.3782812, 1.29187, -0.07500783, 1, 1, 1, 1, 1,
-0.3743939, 1.866256, -1.769795, 1, 1, 1, 1, 1,
-0.37423, 0.2568414, -0.7884464, 1, 1, 1, 1, 1,
-0.3704585, 1.061442, -1.292421, 1, 1, 1, 1, 1,
-0.3669766, -0.780269, -1.649936, 1, 1, 1, 1, 1,
-0.3601977, -1.299359, -3.930305, 1, 1, 1, 1, 1,
-0.3596199, -1.149873, -3.91384, 1, 1, 1, 1, 1,
-0.355335, -0.1780687, -1.971006, 1, 1, 1, 1, 1,
-0.3503005, 0.2026591, -0.9741808, 1, 1, 1, 1, 1,
-0.3469033, 1.095522, -0.5545487, 1, 1, 1, 1, 1,
-0.3440392, -0.2742593, -1.300727, 1, 1, 1, 1, 1,
-0.3432958, 0.3862345, -1.508428, 0, 0, 1, 1, 1,
-0.3387158, 0.09909919, -1.191635, 1, 0, 0, 1, 1,
-0.3353127, 1.033676, -0.569551, 1, 0, 0, 1, 1,
-0.3342782, -0.1961198, -1.957442, 1, 0, 0, 1, 1,
-0.3302239, 0.5357847, -0.7671998, 1, 0, 0, 1, 1,
-0.3259439, -1.264554, -2.359787, 1, 0, 0, 1, 1,
-0.3222251, 1.38941, -0.8457511, 0, 0, 0, 1, 1,
-0.3173848, -0.1941346, -3.887104, 0, 0, 0, 1, 1,
-0.3135594, 0.2914462, -1.780237, 0, 0, 0, 1, 1,
-0.3113991, 1.675869, 1.536386, 0, 0, 0, 1, 1,
-0.310894, 0.5910065, -2.164528, 0, 0, 0, 1, 1,
-0.3097178, -1.83995, -3.030628, 0, 0, 0, 1, 1,
-0.3082974, 0.003248904, -1.298058, 0, 0, 0, 1, 1,
-0.3053675, -0.625698, -2.752791, 1, 1, 1, 1, 1,
-0.3010618, 2.289309, 0.3261049, 1, 1, 1, 1, 1,
-0.3002599, 0.860351, 1.463855, 1, 1, 1, 1, 1,
-0.2963036, -0.8746342, -3.343002, 1, 1, 1, 1, 1,
-0.2953335, 0.3147549, 0.03493847, 1, 1, 1, 1, 1,
-0.2950187, -1.145927, -1.577026, 1, 1, 1, 1, 1,
-0.2867446, -1.054645, -4.328542, 1, 1, 1, 1, 1,
-0.2858594, 1.405932, -1.072842, 1, 1, 1, 1, 1,
-0.2854114, -0.8640529, -3.153333, 1, 1, 1, 1, 1,
-0.2842523, -0.04682824, -2.841681, 1, 1, 1, 1, 1,
-0.2832381, 0.6744705, 1.9035, 1, 1, 1, 1, 1,
-0.2830751, 1.223895, 0.3289383, 1, 1, 1, 1, 1,
-0.2801312, -1.065506, -1.70982, 1, 1, 1, 1, 1,
-0.2791554, 1.048885, -0.01782375, 1, 1, 1, 1, 1,
-0.2785767, -1.185438, -3.275722, 1, 1, 1, 1, 1,
-0.2762893, 0.5425872, 0.05618302, 0, 0, 1, 1, 1,
-0.2743479, 0.0757016, -0.1784994, 1, 0, 0, 1, 1,
-0.2699822, 1.535741, 0.5518138, 1, 0, 0, 1, 1,
-0.2686619, -1.115404, -3.588191, 1, 0, 0, 1, 1,
-0.2676614, -0.9422525, -2.097302, 1, 0, 0, 1, 1,
-0.261661, 1.010651, 1.121741, 1, 0, 0, 1, 1,
-0.2613504, -0.1356372, -3.645557, 0, 0, 0, 1, 1,
-0.2596084, -1.302698, -2.149947, 0, 0, 0, 1, 1,
-0.2586567, 0.07693012, -1.825846, 0, 0, 0, 1, 1,
-0.2573231, -0.3837247, -2.844925, 0, 0, 0, 1, 1,
-0.2565163, -1.163576, -3.273013, 0, 0, 0, 1, 1,
-0.2519686, 1.085385, 0.4363832, 0, 0, 0, 1, 1,
-0.2485915, 0.04835575, -0.2821495, 0, 0, 0, 1, 1,
-0.2479285, 0.4236704, 0.6252794, 1, 1, 1, 1, 1,
-0.2475667, 1.132196, 0.1840054, 1, 1, 1, 1, 1,
-0.2474845, 0.536235, -0.7202531, 1, 1, 1, 1, 1,
-0.2449906, 0.3209587, -0.7011624, 1, 1, 1, 1, 1,
-0.2441479, 0.09795719, -2.69512, 1, 1, 1, 1, 1,
-0.2439495, 1.534258, 0.759846, 1, 1, 1, 1, 1,
-0.2428842, -1.231866, -2.837362, 1, 1, 1, 1, 1,
-0.235922, 0.8067402, -0.1600805, 1, 1, 1, 1, 1,
-0.2354044, -0.4616952, -1.268855, 1, 1, 1, 1, 1,
-0.2348841, 0.4052488, -1.68828, 1, 1, 1, 1, 1,
-0.2330521, 0.2551278, -1.181597, 1, 1, 1, 1, 1,
-0.2307693, -1.482382, -3.631308, 1, 1, 1, 1, 1,
-0.2297166, 0.6113935, 0.6458589, 1, 1, 1, 1, 1,
-0.2272733, -1.045338, -3.05552, 1, 1, 1, 1, 1,
-0.2237103, 2.431305, 1.460947, 1, 1, 1, 1, 1,
-0.213214, 0.1177517, -2.485211, 0, 0, 1, 1, 1,
-0.2128107, 1.002348, 0.7453278, 1, 0, 0, 1, 1,
-0.2100879, -0.8476236, -2.368061, 1, 0, 0, 1, 1,
-0.2055905, -0.5404038, -2.292546, 1, 0, 0, 1, 1,
-0.204254, 1.45733, -0.1941941, 1, 0, 0, 1, 1,
-0.203096, 1.780058, -0.1645247, 1, 0, 0, 1, 1,
-0.2024609, 0.5109484, 0.9897, 0, 0, 0, 1, 1,
-0.2015656, -0.05383079, -1.30631, 0, 0, 0, 1, 1,
-0.199311, 0.5733631, -0.9211825, 0, 0, 0, 1, 1,
-0.1969944, -0.238412, -1.443453, 0, 0, 0, 1, 1,
-0.1951603, -0.07236215, -1.896781, 0, 0, 0, 1, 1,
-0.193725, -0.001665825, -2.863181, 0, 0, 0, 1, 1,
-0.1897079, -0.2822824, -2.589017, 0, 0, 0, 1, 1,
-0.1895493, 0.1963954, 0.7642539, 1, 1, 1, 1, 1,
-0.1841283, -1.262238, -3.89491, 1, 1, 1, 1, 1,
-0.1825578, -0.1036545, -2.984983, 1, 1, 1, 1, 1,
-0.1821527, 0.9875401, 0.4029442, 1, 1, 1, 1, 1,
-0.1815034, 0.4656488, 0.1520262, 1, 1, 1, 1, 1,
-0.17699, 0.266295, -0.1585232, 1, 1, 1, 1, 1,
-0.1742458, -0.03350581, -2.638994, 1, 1, 1, 1, 1,
-0.1700129, 0.1363649, 1.144637, 1, 1, 1, 1, 1,
-0.1691481, -2.572054, -4.269689, 1, 1, 1, 1, 1,
-0.1616421, 0.9674314, 0.5563336, 1, 1, 1, 1, 1,
-0.1534952, 0.4893878, -0.6754625, 1, 1, 1, 1, 1,
-0.1494597, -0.5958311, -3.905492, 1, 1, 1, 1, 1,
-0.1438841, -1.160523, -3.422917, 1, 1, 1, 1, 1,
-0.1429126, 1.616283, 0.8411338, 1, 1, 1, 1, 1,
-0.1428947, 0.3323718, 0.03348481, 1, 1, 1, 1, 1,
-0.1413969, -1.386783, -3.198498, 0, 0, 1, 1, 1,
-0.1401393, -0.7258553, -2.71996, 1, 0, 0, 1, 1,
-0.1390966, -0.8066107, -1.531288, 1, 0, 0, 1, 1,
-0.1382677, -1.207647, -3.822163, 1, 0, 0, 1, 1,
-0.1338473, -1.369565, -2.253862, 1, 0, 0, 1, 1,
-0.1312886, 0.7365374, -0.3585102, 1, 0, 0, 1, 1,
-0.1307378, -0.5940344, -1.479854, 0, 0, 0, 1, 1,
-0.1291628, -2.680327, -4.469202, 0, 0, 0, 1, 1,
-0.1279804, -0.914278, -2.451137, 0, 0, 0, 1, 1,
-0.115443, 0.6012079, 0.001683056, 0, 0, 0, 1, 1,
-0.1152118, -0.429829, -4.500176, 0, 0, 0, 1, 1,
-0.1130677, 0.896022, 0.2511454, 0, 0, 0, 1, 1,
-0.1121994, -1.794309, -2.683743, 0, 0, 0, 1, 1,
-0.1115578, 0.6494583, -0.2539143, 1, 1, 1, 1, 1,
-0.1112562, -0.4427722, -4.300598, 1, 1, 1, 1, 1,
-0.1094109, 0.9219324, -1.311838, 1, 1, 1, 1, 1,
-0.1077735, -0.378536, -4.46061, 1, 1, 1, 1, 1,
-0.1059965, 0.6900184, -0.6475926, 1, 1, 1, 1, 1,
-0.1022007, -0.6049716, -2.900255, 1, 1, 1, 1, 1,
-0.1003049, 0.02363001, -0.89508, 1, 1, 1, 1, 1,
-0.09934013, 1.216938, 0.07953311, 1, 1, 1, 1, 1,
-0.09838497, 0.1273149, -0.9793614, 1, 1, 1, 1, 1,
-0.0982433, -0.1636344, -3.182724, 1, 1, 1, 1, 1,
-0.09507978, -0.04292271, -2.169219, 1, 1, 1, 1, 1,
-0.09488239, -0.3858303, -1.230554, 1, 1, 1, 1, 1,
-0.0942523, -0.02811521, -1.431898, 1, 1, 1, 1, 1,
-0.09096967, -0.8901542, -3.412851, 1, 1, 1, 1, 1,
-0.08906794, -2.018175, -2.606938, 1, 1, 1, 1, 1,
-0.08094342, 0.3589217, -1.522726, 0, 0, 1, 1, 1,
-0.07695772, 0.3127877, -1.226239, 1, 0, 0, 1, 1,
-0.07628287, -0.5975319, -2.852134, 1, 0, 0, 1, 1,
-0.07203025, -2.274799, -2.891612, 1, 0, 0, 1, 1,
-0.05683224, -1.111725, -3.204649, 1, 0, 0, 1, 1,
-0.04340212, -0.5272676, -1.33561, 1, 0, 0, 1, 1,
-0.04156021, 0.7739287, 1.284838, 0, 0, 0, 1, 1,
-0.03986509, -1.577523, -2.218989, 0, 0, 0, 1, 1,
-0.0357486, 0.1616433, -0.9853102, 0, 0, 0, 1, 1,
-0.03495534, -0.1058695, -3.426951, 0, 0, 0, 1, 1,
-0.0292835, -0.05756333, -2.268534, 0, 0, 0, 1, 1,
-0.02905065, 0.2514667, 0.3594955, 0, 0, 0, 1, 1,
-0.02875518, 0.4305744, -0.9505292, 0, 0, 0, 1, 1,
-0.02561126, -1.20118, -2.264789, 1, 1, 1, 1, 1,
-0.02496918, 0.09623279, -0.09908105, 1, 1, 1, 1, 1,
-0.02266839, 0.05661381, -0.5647935, 1, 1, 1, 1, 1,
-0.0215496, 0.4510777, 0.9613808, 1, 1, 1, 1, 1,
-0.01611693, 0.0747647, -0.7022101, 1, 1, 1, 1, 1,
-0.0150132, -0.09442838, -3.794486, 1, 1, 1, 1, 1,
-0.01461187, -1.003504, -5.576065, 1, 1, 1, 1, 1,
-0.003693165, -0.1173782, -5.91207, 1, 1, 1, 1, 1,
-0.002458916, 2.411592, 1.235118, 1, 1, 1, 1, 1,
-0.001693062, -1.752397, -2.516336, 1, 1, 1, 1, 1,
0.003203557, -0.4200548, 0.4873548, 1, 1, 1, 1, 1,
0.005179413, 0.1324781, -1.459431, 1, 1, 1, 1, 1,
0.01045771, 1.949028, -1.670142, 1, 1, 1, 1, 1,
0.01681161, 0.1822424, 0.8468616, 1, 1, 1, 1, 1,
0.01824045, -0.4654743, 3.21288, 1, 1, 1, 1, 1,
0.01879774, -0.205598, 4.290195, 0, 0, 1, 1, 1,
0.01922052, 2.003378, 0.6444631, 1, 0, 0, 1, 1,
0.02144484, 1.245055, 0.09935066, 1, 0, 0, 1, 1,
0.02262879, 0.0843061, -1.03549, 1, 0, 0, 1, 1,
0.02491432, 1.535797, -1.02574, 1, 0, 0, 1, 1,
0.02520573, 0.6443288, -1.35522, 1, 0, 0, 1, 1,
0.02851249, 0.1173931, -0.3411612, 0, 0, 0, 1, 1,
0.02854129, -1.004506, 5.448965, 0, 0, 0, 1, 1,
0.02894601, 2.076973, -2.062236, 0, 0, 0, 1, 1,
0.02911288, 0.1317173, 0.6055567, 0, 0, 0, 1, 1,
0.03311168, -0.3026615, 2.7541, 0, 0, 0, 1, 1,
0.04352467, -1.102546, 1.722495, 0, 0, 0, 1, 1,
0.04527253, 1.642037, -1.083781, 0, 0, 0, 1, 1,
0.04679204, 0.49518, -1.135427, 1, 1, 1, 1, 1,
0.04883095, 1.574556, -0.9613882, 1, 1, 1, 1, 1,
0.05191778, 0.09910674, 1.23947, 1, 1, 1, 1, 1,
0.05380685, 2.345582, -1.05654, 1, 1, 1, 1, 1,
0.05815867, 0.5887056, -0.04492549, 1, 1, 1, 1, 1,
0.06016956, 1.796365, -0.09047624, 1, 1, 1, 1, 1,
0.06186403, -0.08983537, 4.325512, 1, 1, 1, 1, 1,
0.06439713, 0.4158905, 0.7386495, 1, 1, 1, 1, 1,
0.06582452, -1.466226, 2.76637, 1, 1, 1, 1, 1,
0.06649798, -0.4435158, 2.540713, 1, 1, 1, 1, 1,
0.07060743, -1.903485, 3.03283, 1, 1, 1, 1, 1,
0.07343137, 0.2558128, -0.6973866, 1, 1, 1, 1, 1,
0.07350823, -2.358083, 4.622281, 1, 1, 1, 1, 1,
0.07461429, 1.007904, 0.9488293, 1, 1, 1, 1, 1,
0.07463288, 0.04979433, -0.2558208, 1, 1, 1, 1, 1,
0.07652457, -0.2093308, 2.831468, 0, 0, 1, 1, 1,
0.07873707, 0.4438774, -1.425321, 1, 0, 0, 1, 1,
0.07906315, -0.003410812, -0.3901533, 1, 0, 0, 1, 1,
0.08499029, -0.2175449, 2.816768, 1, 0, 0, 1, 1,
0.08540294, 1.174484, 1.373359, 1, 0, 0, 1, 1,
0.08678102, -1.194324, 3.178461, 1, 0, 0, 1, 1,
0.08920951, 0.6817656, 0.8875642, 0, 0, 0, 1, 1,
0.09061463, 0.7424348, -1.038337, 0, 0, 0, 1, 1,
0.09695644, -0.3690468, 3.48443, 0, 0, 0, 1, 1,
0.09710448, -0.5011518, 3.75746, 0, 0, 0, 1, 1,
0.09766538, -0.9681461, 2.886062, 0, 0, 0, 1, 1,
0.09857931, 1.04377, 0.01082342, 0, 0, 0, 1, 1,
0.1013354, 0.3400194, -0.256961, 0, 0, 0, 1, 1,
0.1051789, 0.1225732, 0.9684663, 1, 1, 1, 1, 1,
0.1079507, -0.3756524, 4.264245, 1, 1, 1, 1, 1,
0.1086314, 0.5960375, 0.02395382, 1, 1, 1, 1, 1,
0.1101497, -0.3166175, 4.033064, 1, 1, 1, 1, 1,
0.1138271, -0.7643479, 1.949065, 1, 1, 1, 1, 1,
0.1160148, -1.234928, 5.118921, 1, 1, 1, 1, 1,
0.1164222, 0.06032044, 1.847849, 1, 1, 1, 1, 1,
0.1166552, 0.1173865, 1.780439, 1, 1, 1, 1, 1,
0.1181769, 0.3347399, -0.7937506, 1, 1, 1, 1, 1,
0.1231874, 0.8684989, 1.685132, 1, 1, 1, 1, 1,
0.1240542, 1.381198, 0.01251357, 1, 1, 1, 1, 1,
0.1270874, -0.4829658, 3.784858, 1, 1, 1, 1, 1,
0.1310385, 0.1777536, 0.9103099, 1, 1, 1, 1, 1,
0.1313512, -1.227003, 3.619554, 1, 1, 1, 1, 1,
0.1329809, 2.056715, -0.06783804, 1, 1, 1, 1, 1,
0.1338463, -0.7853516, 3.020286, 0, 0, 1, 1, 1,
0.1344131, 0.7677308, 0.02752948, 1, 0, 0, 1, 1,
0.1392024, -4.444457, 2.662162, 1, 0, 0, 1, 1,
0.1442152, 0.8345865, 0.7997056, 1, 0, 0, 1, 1,
0.144312, -1.641946, 1.80249, 1, 0, 0, 1, 1,
0.1455308, -0.3681307, 3.310128, 1, 0, 0, 1, 1,
0.1472407, 2.0048, 0.7359514, 0, 0, 0, 1, 1,
0.1473626, 0.8200111, -0.2655369, 0, 0, 0, 1, 1,
0.1481979, -0.7278511, 2.382372, 0, 0, 0, 1, 1,
0.1530127, 0.3862949, -0.8573186, 0, 0, 0, 1, 1,
0.1581887, 0.1609431, -0.3376426, 0, 0, 0, 1, 1,
0.1587902, -0.03536952, 2.182319, 0, 0, 0, 1, 1,
0.1609994, -0.3351255, 3.337635, 0, 0, 0, 1, 1,
0.1638805, 0.1722265, 0.1035699, 1, 1, 1, 1, 1,
0.1647849, 0.7904297, 0.1209578, 1, 1, 1, 1, 1,
0.1656563, 0.6684046, 0.06326763, 1, 1, 1, 1, 1,
0.1692299, -0.255835, 2.265447, 1, 1, 1, 1, 1,
0.1705623, -0.328392, 3.58288, 1, 1, 1, 1, 1,
0.1714666, 0.7479954, 0.1983785, 1, 1, 1, 1, 1,
0.1732554, 1.023713, -0.8139367, 1, 1, 1, 1, 1,
0.1864058, 0.3523062, -0.5848125, 1, 1, 1, 1, 1,
0.1875051, -0.9214478, 3.226528, 1, 1, 1, 1, 1,
0.1959946, -0.2884611, 1.368185, 1, 1, 1, 1, 1,
0.1985399, -0.4470252, 2.181285, 1, 1, 1, 1, 1,
0.2018466, 0.5055318, -0.8697567, 1, 1, 1, 1, 1,
0.2023358, -0.1426103, 1.984428, 1, 1, 1, 1, 1,
0.2048437, -0.862966, 3.867479, 1, 1, 1, 1, 1,
0.2113496, 0.4804345, 0.2234096, 1, 1, 1, 1, 1,
0.214109, 2.202923, -1.756317, 0, 0, 1, 1, 1,
0.2160676, -0.9489791, 2.89642, 1, 0, 0, 1, 1,
0.2170458, -1.367732, 2.833639, 1, 0, 0, 1, 1,
0.2190598, 1.419906, 0.4678572, 1, 0, 0, 1, 1,
0.22031, -0.2100732, 2.626668, 1, 0, 0, 1, 1,
0.2249802, -1.626156, 4.393613, 1, 0, 0, 1, 1,
0.227353, 1.26526, 3.295545, 0, 0, 0, 1, 1,
0.2315186, -1.950555, 4.910978, 0, 0, 0, 1, 1,
0.2332678, -0.4787688, 1.898436, 0, 0, 0, 1, 1,
0.2342744, -0.007823915, 1.330277, 0, 0, 0, 1, 1,
0.2349318, 0.1536959, 0.2036249, 0, 0, 0, 1, 1,
0.2392761, -1.143558, 3.613753, 0, 0, 0, 1, 1,
0.239951, -0.7555631, 4.238266, 0, 0, 0, 1, 1,
0.2425101, -0.1659342, 0.5947855, 1, 1, 1, 1, 1,
0.248813, 1.028935, 0.2019584, 1, 1, 1, 1, 1,
0.249215, -0.1513122, 2.51803, 1, 1, 1, 1, 1,
0.2501318, -0.9998757, 3.121214, 1, 1, 1, 1, 1,
0.2547468, -0.1828778, 1.620074, 1, 1, 1, 1, 1,
0.2631994, -0.8554175, 5.629982, 1, 1, 1, 1, 1,
0.2639478, 0.6955608, 0.4623537, 1, 1, 1, 1, 1,
0.2713966, -0.7922418, 2.91834, 1, 1, 1, 1, 1,
0.2742264, -0.3597304, 1.862689, 1, 1, 1, 1, 1,
0.2795546, 0.1316425, 0.03362688, 1, 1, 1, 1, 1,
0.2811732, 0.4980535, 0.5366467, 1, 1, 1, 1, 1,
0.2877514, -0.03852801, 0.5706473, 1, 1, 1, 1, 1,
0.2901999, -0.2417453, 3.495695, 1, 1, 1, 1, 1,
0.2926463, 1.240846, -0.7148046, 1, 1, 1, 1, 1,
0.2938864, -0.7098352, 4.753765, 1, 1, 1, 1, 1,
0.2969548, 0.2890165, -0.469307, 0, 0, 1, 1, 1,
0.3011408, -0.9358474, 2.195046, 1, 0, 0, 1, 1,
0.3018448, -1.240034, 2.523584, 1, 0, 0, 1, 1,
0.3046328, 0.0009988775, 0.7392056, 1, 0, 0, 1, 1,
0.3086911, 0.6168514, 1.459646, 1, 0, 0, 1, 1,
0.310156, 1.449789, 0.0512895, 1, 0, 0, 1, 1,
0.3147731, 1.244098, 1.713022, 0, 0, 0, 1, 1,
0.3154548, -1.212816, 1.793116, 0, 0, 0, 1, 1,
0.3162228, -0.0229742, -0.2266335, 0, 0, 0, 1, 1,
0.3184698, -0.2988586, 1.816494, 0, 0, 0, 1, 1,
0.3204413, -0.3419714, 1.48222, 0, 0, 0, 1, 1,
0.3237903, -0.2731249, 2.302214, 0, 0, 0, 1, 1,
0.3258477, -0.9598992, 3.236687, 0, 0, 0, 1, 1,
0.3259727, 0.405899, 1.20607, 1, 1, 1, 1, 1,
0.3262231, 1.793183, 0.968855, 1, 1, 1, 1, 1,
0.3282985, -0.5565206, 1.353783, 1, 1, 1, 1, 1,
0.3374255, 0.4025846, 1.042936, 1, 1, 1, 1, 1,
0.3420212, 0.6522096, -0.5730473, 1, 1, 1, 1, 1,
0.3432559, 0.5952722, 0.007849824, 1, 1, 1, 1, 1,
0.3445297, -0.2493871, 1.801942, 1, 1, 1, 1, 1,
0.3448683, 0.630243, 2.129642, 1, 1, 1, 1, 1,
0.348234, 0.2216752, 1.472871, 1, 1, 1, 1, 1,
0.3483015, 0.1060653, 0.8996134, 1, 1, 1, 1, 1,
0.3545477, 0.01591052, 0.7455177, 1, 1, 1, 1, 1,
0.3555027, -0.9667743, 3.174782, 1, 1, 1, 1, 1,
0.3564484, -0.7974805, 3.658434, 1, 1, 1, 1, 1,
0.3584735, -0.9336258, 5.429544, 1, 1, 1, 1, 1,
0.3597846, -0.1666415, 2.552603, 1, 1, 1, 1, 1,
0.3640476, 1.724822, 2.929618, 0, 0, 1, 1, 1,
0.367209, 2.60472, 0.7003258, 1, 0, 0, 1, 1,
0.3677571, 1.81676, -1.287774, 1, 0, 0, 1, 1,
0.3749378, 0.4608715, 0.4580887, 1, 0, 0, 1, 1,
0.3769221, -0.01846328, 1.016483, 1, 0, 0, 1, 1,
0.3801816, 0.9773089, 0.4095784, 1, 0, 0, 1, 1,
0.387251, 0.9565988, -0.6383575, 0, 0, 0, 1, 1,
0.3877092, 0.2319588, -0.6328137, 0, 0, 0, 1, 1,
0.3916623, 0.08938289, 1.683945, 0, 0, 0, 1, 1,
0.3938386, 0.5938602, 0.3027058, 0, 0, 0, 1, 1,
0.3943883, 0.01796365, 1.238996, 0, 0, 0, 1, 1,
0.394437, -0.8440897, 3.247041, 0, 0, 0, 1, 1,
0.3952012, 0.1558353, -0.108134, 0, 0, 0, 1, 1,
0.3953888, -0.1606644, 1.971462, 1, 1, 1, 1, 1,
0.3970801, -0.5095062, 2.355918, 1, 1, 1, 1, 1,
0.4064468, 0.3376855, 1.502889, 1, 1, 1, 1, 1,
0.4068036, 1.627536, 0.1558697, 1, 1, 1, 1, 1,
0.4072631, -1.497275, 2.552959, 1, 1, 1, 1, 1,
0.4101641, 0.04148677, 1.278989, 1, 1, 1, 1, 1,
0.4105873, 1.739623, 0.1526445, 1, 1, 1, 1, 1,
0.4119652, -0.1221105, 3.22451, 1, 1, 1, 1, 1,
0.4242566, -0.4208037, 0.4606226, 1, 1, 1, 1, 1,
0.4252322, 0.7164509, -0.4951263, 1, 1, 1, 1, 1,
0.4268748, -1.252451, 2.946108, 1, 1, 1, 1, 1,
0.4329749, 0.1803208, 1.595087, 1, 1, 1, 1, 1,
0.4343092, -1.625215, 2.148085, 1, 1, 1, 1, 1,
0.4347664, 0.6572075, -1.042241, 1, 1, 1, 1, 1,
0.4381476, 0.2879997, 1.521948, 1, 1, 1, 1, 1,
0.439023, -0.6455413, 1.806368, 0, 0, 1, 1, 1,
0.4418822, -1.4646, 3.181096, 1, 0, 0, 1, 1,
0.4424284, 0.986071, -0.5096259, 1, 0, 0, 1, 1,
0.44341, 0.1931239, 1.593563, 1, 0, 0, 1, 1,
0.4438587, 0.7957051, 0.9050451, 1, 0, 0, 1, 1,
0.4467878, 1.195457, 0.4730366, 1, 0, 0, 1, 1,
0.4506862, -0.53768, 4.252753, 0, 0, 0, 1, 1,
0.456417, 1.355956, 1.034868, 0, 0, 0, 1, 1,
0.4566227, 1.527171, -0.08520658, 0, 0, 0, 1, 1,
0.4599335, 0.512109, -0.9742771, 0, 0, 0, 1, 1,
0.464462, 0.3019784, 1.107597, 0, 0, 0, 1, 1,
0.4658755, -1.957396, 1.509712, 0, 0, 0, 1, 1,
0.4670574, 0.2907244, 0.7878324, 0, 0, 0, 1, 1,
0.4688791, 0.1429475, 1.80091, 1, 1, 1, 1, 1,
0.4710546, 1.196475, -0.8212007, 1, 1, 1, 1, 1,
0.4729704, 0.3398804, 1.213126, 1, 1, 1, 1, 1,
0.4771631, 0.4211811, 1.903677, 1, 1, 1, 1, 1,
0.4772545, 0.9603278, 1.456127, 1, 1, 1, 1, 1,
0.4788858, 1.931537, 0.2592581, 1, 1, 1, 1, 1,
0.481073, 1.355403, 0.4066423, 1, 1, 1, 1, 1,
0.4839073, 0.1267428, 2.00074, 1, 1, 1, 1, 1,
0.4874427, -0.4068242, 2.137835, 1, 1, 1, 1, 1,
0.4888246, 0.6880611, 1.084371, 1, 1, 1, 1, 1,
0.488908, -0.7435703, 2.679821, 1, 1, 1, 1, 1,
0.4911147, -0.5321324, 1.291315, 1, 1, 1, 1, 1,
0.4929477, 0.293397, 1.442746, 1, 1, 1, 1, 1,
0.499666, 1.314541, -0.7755851, 1, 1, 1, 1, 1,
0.5079726, 1.634582, 0.4891497, 1, 1, 1, 1, 1,
0.5081052, 1.31805, -0.9780669, 0, 0, 1, 1, 1,
0.5097287, 0.7075304, 1.638495, 1, 0, 0, 1, 1,
0.5129467, -0.2686644, 2.472152, 1, 0, 0, 1, 1,
0.5138358, 0.08795251, 0.9246261, 1, 0, 0, 1, 1,
0.5160903, -1.34211, 3.494853, 1, 0, 0, 1, 1,
0.5165368, -2.069575, 2.953781, 1, 0, 0, 1, 1,
0.5183326, 1.678915, 0.539182, 0, 0, 0, 1, 1,
0.5308573, 1.286058, 2.563272, 0, 0, 0, 1, 1,
0.5313579, -0.7753754, 3.226848, 0, 0, 0, 1, 1,
0.5321089, 2.083498, -0.6494706, 0, 0, 0, 1, 1,
0.5329478, -0.4066379, 2.233333, 0, 0, 0, 1, 1,
0.5333968, -2.393029, 3.243892, 0, 0, 0, 1, 1,
0.5421373, -0.6221814, 2.571131, 0, 0, 0, 1, 1,
0.5425239, 0.7054181, 1.102501, 1, 1, 1, 1, 1,
0.5514959, -0.5788227, 1.5819, 1, 1, 1, 1, 1,
0.5520678, -0.391591, 3.001815, 1, 1, 1, 1, 1,
0.5521204, -0.7261019, 1.384939, 1, 1, 1, 1, 1,
0.5643806, 0.4881215, 1.716421, 1, 1, 1, 1, 1,
0.5649859, 0.06438373, 0.9441382, 1, 1, 1, 1, 1,
0.5664394, 1.012809, -1.110048, 1, 1, 1, 1, 1,
0.56718, -1.100516, 2.249482, 1, 1, 1, 1, 1,
0.5674937, -1.382926, 2.495775, 1, 1, 1, 1, 1,
0.5682664, 1.230658, -0.3881466, 1, 1, 1, 1, 1,
0.5765234, -0.4552664, 2.024259, 1, 1, 1, 1, 1,
0.5791802, 0.8748645, -0.01574844, 1, 1, 1, 1, 1,
0.5804945, 1.371401, 1.240801, 1, 1, 1, 1, 1,
0.5836515, 0.1325664, 1.459056, 1, 1, 1, 1, 1,
0.5863213, -0.08310264, 3.168658, 1, 1, 1, 1, 1,
0.587186, 1.257334, -1.597096, 0, 0, 1, 1, 1,
0.5875719, -1.053489, 2.706623, 1, 0, 0, 1, 1,
0.5904607, 0.05944254, 1.380476, 1, 0, 0, 1, 1,
0.591446, -1.261956, 2.599868, 1, 0, 0, 1, 1,
0.5938361, -2.274747, 2.447015, 1, 0, 0, 1, 1,
0.5965999, 1.294245, 0.4172412, 1, 0, 0, 1, 1,
0.5975906, -0.4207678, 2.765133, 0, 0, 0, 1, 1,
0.6007853, 0.6429623, 0.3098052, 0, 0, 0, 1, 1,
0.602633, -0.4438567, 1.822611, 0, 0, 0, 1, 1,
0.6063935, -0.679943, 3.238832, 0, 0, 0, 1, 1,
0.6067688, -1.489264, 2.974309, 0, 0, 0, 1, 1,
0.6172783, -2.239449, 3.830334, 0, 0, 0, 1, 1,
0.6184189, 0.04789045, 2.292575, 0, 0, 0, 1, 1,
0.6238402, -0.1226606, 0.6327482, 1, 1, 1, 1, 1,
0.6245247, 0.7046436, 0.6266224, 1, 1, 1, 1, 1,
0.6245648, 1.535296, 1.700757, 1, 1, 1, 1, 1,
0.6272081, 0.7182349, 0.8733006, 1, 1, 1, 1, 1,
0.6279242, 1.350214, 0.4996041, 1, 1, 1, 1, 1,
0.6320532, 1.897693, 0.4803583, 1, 1, 1, 1, 1,
0.6337097, 0.6449225, 2.560929, 1, 1, 1, 1, 1,
0.6353803, -0.728351, 2.653277, 1, 1, 1, 1, 1,
0.6409977, 1.691384, -0.3053308, 1, 1, 1, 1, 1,
0.6431633, -0.1683954, 2.363919, 1, 1, 1, 1, 1,
0.6441555, 1.51646, 0.01181958, 1, 1, 1, 1, 1,
0.6508444, -1.672142, 3.060241, 1, 1, 1, 1, 1,
0.6551156, 0.3852019, 0.3791123, 1, 1, 1, 1, 1,
0.665641, -0.4385252, 2.350859, 1, 1, 1, 1, 1,
0.6670852, -0.04364272, 1.058422, 1, 1, 1, 1, 1,
0.6699884, -0.3137242, 1.892174, 0, 0, 1, 1, 1,
0.6707019, -0.05092553, 0.238991, 1, 0, 0, 1, 1,
0.6728879, 0.2503428, 0.6771743, 1, 0, 0, 1, 1,
0.6780117, -0.07266997, 1.975091, 1, 0, 0, 1, 1,
0.6845742, 0.7095137, 0.7994871, 1, 0, 0, 1, 1,
0.6847758, -0.0685387, 2.605529, 1, 0, 0, 1, 1,
0.6869092, 0.2615174, 2.876346, 0, 0, 0, 1, 1,
0.687998, 1.375512, 0.3725593, 0, 0, 0, 1, 1,
0.6910647, 0.3961402, 2.21487, 0, 0, 0, 1, 1,
0.6925277, 0.003492879, 1.659144, 0, 0, 0, 1, 1,
0.692809, 0.6322193, -0.874388, 0, 0, 0, 1, 1,
0.6950188, -0.585003, 3.539521, 0, 0, 0, 1, 1,
0.6979142, -0.9126602, 3.445551, 0, 0, 0, 1, 1,
0.6993096, -1.157928, 3.727433, 1, 1, 1, 1, 1,
0.6995927, -0.2121193, 3.680202, 1, 1, 1, 1, 1,
0.7025675, -1.934932, 2.421721, 1, 1, 1, 1, 1,
0.7071503, -0.2509755, 1.863617, 1, 1, 1, 1, 1,
0.7107553, 0.8189632, -0.183552, 1, 1, 1, 1, 1,
0.7132289, -1.637877, 3.554463, 1, 1, 1, 1, 1,
0.7212805, 1.454414, 1.774766, 1, 1, 1, 1, 1,
0.7213755, 0.4683101, 1.677751, 1, 1, 1, 1, 1,
0.7219449, 0.5334335, -0.2123975, 1, 1, 1, 1, 1,
0.7225601, 1.618805, 0.6308176, 1, 1, 1, 1, 1,
0.725146, -0.4346254, 3.846561, 1, 1, 1, 1, 1,
0.7276905, -0.3680367, 1.071561, 1, 1, 1, 1, 1,
0.7283112, 0.4380848, 0.3720066, 1, 1, 1, 1, 1,
0.7288113, 0.6644645, 0.5698262, 1, 1, 1, 1, 1,
0.7288855, -1.29299, 3.527929, 1, 1, 1, 1, 1,
0.7300138, -0.4109131, 1.31114, 0, 0, 1, 1, 1,
0.7309235, 0.1875391, 1.637835, 1, 0, 0, 1, 1,
0.7366225, 1.386054, 1.066158, 1, 0, 0, 1, 1,
0.7373583, 1.26121, -1.014571, 1, 0, 0, 1, 1,
0.7419898, -0.5622277, 1.492718, 1, 0, 0, 1, 1,
0.7428594, -2.035496, 3.580645, 1, 0, 0, 1, 1,
0.7433535, -1.89081, 3.185258, 0, 0, 0, 1, 1,
0.744243, -1.87885, 4.254458, 0, 0, 0, 1, 1,
0.7446021, 0.9752828, -0.3761805, 0, 0, 0, 1, 1,
0.7459645, 1.070099, 1.075302, 0, 0, 0, 1, 1,
0.7472652, 0.5029818, 0.8223855, 0, 0, 0, 1, 1,
0.7488549, 0.5229468, 1.149304, 0, 0, 0, 1, 1,
0.7531432, -0.6667451, 2.070945, 0, 0, 0, 1, 1,
0.7531955, -0.4904521, 2.185733, 1, 1, 1, 1, 1,
0.7548581, -0.08468571, 2.587703, 1, 1, 1, 1, 1,
0.7602522, -1.171726, 2.83297, 1, 1, 1, 1, 1,
0.7647858, -0.6425244, 3.688018, 1, 1, 1, 1, 1,
0.7763015, 0.4013611, 2.977939, 1, 1, 1, 1, 1,
0.7773554, -0.01195064, 2.949327, 1, 1, 1, 1, 1,
0.7800964, 0.5473227, 0.5279045, 1, 1, 1, 1, 1,
0.7823244, 0.08762704, 2.906388, 1, 1, 1, 1, 1,
0.7826902, 0.03531729, 2.427249, 1, 1, 1, 1, 1,
0.7878523, -0.308817, 1.630529, 1, 1, 1, 1, 1,
0.7940214, 0.6730056, 1.835819, 1, 1, 1, 1, 1,
0.795988, -0.1020051, 3.69609, 1, 1, 1, 1, 1,
0.8000054, 0.6492691, 1.660219, 1, 1, 1, 1, 1,
0.8011242, 1.83158, 0.8741801, 1, 1, 1, 1, 1,
0.8012186, -1.934831, 2.734107, 1, 1, 1, 1, 1,
0.8048278, 1.17133, -0.1490469, 0, 0, 1, 1, 1,
0.8078147, -1.694303, 3.114655, 1, 0, 0, 1, 1,
0.814348, -0.1836874, 1.976897, 1, 0, 0, 1, 1,
0.8148757, -0.09300405, -0.1638331, 1, 0, 0, 1, 1,
0.8163176, 0.5715907, 1.152677, 1, 0, 0, 1, 1,
0.8245431, 0.512034, 1.541531, 1, 0, 0, 1, 1,
0.8248531, 0.7478189, 0.504146, 0, 0, 0, 1, 1,
0.8254584, 0.6838761, 1.627946, 0, 0, 0, 1, 1,
0.8281038, 0.02013203, 0.2095634, 0, 0, 0, 1, 1,
0.8348393, -0.09315639, 0.7123346, 0, 0, 0, 1, 1,
0.8358964, -0.7534017, 1.880484, 0, 0, 0, 1, 1,
0.8398974, -0.3989466, 2.829084, 0, 0, 0, 1, 1,
0.8449585, 0.384877, 0.3404773, 0, 0, 0, 1, 1,
0.8545964, 0.6284692, 2.072426, 1, 1, 1, 1, 1,
0.8586404, -0.04312725, 1.118821, 1, 1, 1, 1, 1,
0.8599607, -0.8621345, 4.20414, 1, 1, 1, 1, 1,
0.8646958, 0.2224765, 0.389555, 1, 1, 1, 1, 1,
0.8669776, -0.3160624, 1.807428, 1, 1, 1, 1, 1,
0.8709407, 0.3149281, 0.6618984, 1, 1, 1, 1, 1,
0.8725239, 1.443096, 0.5579516, 1, 1, 1, 1, 1,
0.8753564, 0.4566484, 2.078009, 1, 1, 1, 1, 1,
0.893408, -3.847276, 4.768196, 1, 1, 1, 1, 1,
0.898367, -1.916022, 1.848141, 1, 1, 1, 1, 1,
0.8996069, 0.5910047, 1.169045, 1, 1, 1, 1, 1,
0.9056994, -0.06474802, 2.085617, 1, 1, 1, 1, 1,
0.9100955, -0.9267535, 0.4085933, 1, 1, 1, 1, 1,
0.9178765, -0.8995214, 2.75908, 1, 1, 1, 1, 1,
0.918632, 1.622347, -0.05945722, 1, 1, 1, 1, 1,
0.9235247, -1.194256, 1.498963, 0, 0, 1, 1, 1,
0.9245423, -0.7510734, 3.318378, 1, 0, 0, 1, 1,
0.9257021, 0.4579477, 1.187837, 1, 0, 0, 1, 1,
0.9292396, -1.086856, 3.340549, 1, 0, 0, 1, 1,
0.9387256, 0.4865598, -0.4004834, 1, 0, 0, 1, 1,
0.9430757, 0.9645402, 0.1545538, 1, 0, 0, 1, 1,
0.946441, 0.3980503, 1.311618, 0, 0, 0, 1, 1,
0.9468889, -2.02957, 3.391488, 0, 0, 0, 1, 1,
0.9632149, 0.5391971, 1.211443, 0, 0, 0, 1, 1,
0.9660438, 1.088736, 1.180659, 0, 0, 0, 1, 1,
0.9721702, 0.7159728, 1.112235, 0, 0, 0, 1, 1,
0.9732, -0.5502204, 2.169694, 0, 0, 0, 1, 1,
0.9767894, 0.7738206, 0.4091458, 0, 0, 0, 1, 1,
0.9784867, -0.1264244, 2.106268, 1, 1, 1, 1, 1,
0.9800082, 1.045176, 1.125751, 1, 1, 1, 1, 1,
0.9818752, 0.334628, 1.818845, 1, 1, 1, 1, 1,
0.9823574, -0.8903674, 1.345179, 1, 1, 1, 1, 1,
0.983746, -0.01422196, 1.793635, 1, 1, 1, 1, 1,
0.9875616, 1.099439, 1.666233, 1, 1, 1, 1, 1,
0.9904957, -0.3425407, 1.64695, 1, 1, 1, 1, 1,
0.9968954, -0.3086696, 2.354838, 1, 1, 1, 1, 1,
0.998376, -1.42495, 3.075076, 1, 1, 1, 1, 1,
1.004975, 0.3262998, 1.188361, 1, 1, 1, 1, 1,
1.030447, 1.787226, 0.8344272, 1, 1, 1, 1, 1,
1.032364, 0.08976324, 0.5611591, 1, 1, 1, 1, 1,
1.034174, 0.1035697, -0.6751218, 1, 1, 1, 1, 1,
1.038046, 0.07182748, 2.440169, 1, 1, 1, 1, 1,
1.049259, 0.7108237, 1.577849, 1, 1, 1, 1, 1,
1.051766, 0.2522342, 0.9677511, 0, 0, 1, 1, 1,
1.053234, 0.01826324, 2.002106, 1, 0, 0, 1, 1,
1.06268, -1.076422, 1.505845, 1, 0, 0, 1, 1,
1.063835, -1.974157, 2.97848, 1, 0, 0, 1, 1,
1.065348, 1.542286, -0.2874562, 1, 0, 0, 1, 1,
1.073916, 0.775312, 2.612607, 1, 0, 0, 1, 1,
1.076647, 0.2793339, 2.256918, 0, 0, 0, 1, 1,
1.080999, -0.593956, 5.075042, 0, 0, 0, 1, 1,
1.081603, 1.083333, 0.5257393, 0, 0, 0, 1, 1,
1.082322, 0.07026736, 2.691577, 0, 0, 0, 1, 1,
1.082953, -1.347045, 1.826575, 0, 0, 0, 1, 1,
1.083772, 1.376449, -0.5775165, 0, 0, 0, 1, 1,
1.086548, -1.967333, 2.41371, 0, 0, 0, 1, 1,
1.093244, 0.3762736, 0.5884664, 1, 1, 1, 1, 1,
1.096442, -0.2903596, 2.260681, 1, 1, 1, 1, 1,
1.099306, 0.05285556, 2.817808, 1, 1, 1, 1, 1,
1.100726, 0.3364271, 0.2005838, 1, 1, 1, 1, 1,
1.122238, -0.06778568, 3.024811, 1, 1, 1, 1, 1,
1.126409, -1.668615, 1.714126, 1, 1, 1, 1, 1,
1.133754, 0.8234618, 1.263083, 1, 1, 1, 1, 1,
1.149882, 0.2190688, 2.776414, 1, 1, 1, 1, 1,
1.157336, -0.1838995, -0.4497544, 1, 1, 1, 1, 1,
1.162681, -0.2976677, 0.671782, 1, 1, 1, 1, 1,
1.170384, -1.661642, 1.814487, 1, 1, 1, 1, 1,
1.179732, -1.578853, 3.734326, 1, 1, 1, 1, 1,
1.18027, 0.360576, 1.280842, 1, 1, 1, 1, 1,
1.18048, -0.5081735, 1.285467, 1, 1, 1, 1, 1,
1.184964, 1.101252, 0.6742904, 1, 1, 1, 1, 1,
1.187163, 0.4546316, 1.563288, 0, 0, 1, 1, 1,
1.193393, -0.1095052, 1.304138, 1, 0, 0, 1, 1,
1.194117, 0.8637261, 0.4643733, 1, 0, 0, 1, 1,
1.195599, 0.8934186, 1.507016, 1, 0, 0, 1, 1,
1.198361, -1.859582, 3.0681, 1, 0, 0, 1, 1,
1.210831, 1.167771, 0.9355525, 1, 0, 0, 1, 1,
1.214731, 0.425623, 2.485931, 0, 0, 0, 1, 1,
1.222576, -1.466593, 2.00363, 0, 0, 0, 1, 1,
1.239594, 0.907523, 0.7285032, 0, 0, 0, 1, 1,
1.244088, -0.145851, 1.542934, 0, 0, 0, 1, 1,
1.24722, 0.7185934, 1.637855, 0, 0, 0, 1, 1,
1.250056, 1.323785, -0.08943625, 0, 0, 0, 1, 1,
1.257305, -1.319784, 3.439614, 0, 0, 0, 1, 1,
1.258401, -0.4872228, 2.400205, 1, 1, 1, 1, 1,
1.26923, -1.261622, 2.39018, 1, 1, 1, 1, 1,
1.279027, -0.5906276, 0.9718366, 1, 1, 1, 1, 1,
1.287715, -0.1124771, 2.654897, 1, 1, 1, 1, 1,
1.288931, -0.2610905, 4.148484, 1, 1, 1, 1, 1,
1.291121, 2.413667, 1.219891, 1, 1, 1, 1, 1,
1.292084, 0.6312729, 0.3267615, 1, 1, 1, 1, 1,
1.30433, -0.8555047, 0.858401, 1, 1, 1, 1, 1,
1.339065, -1.54038, 0.5898012, 1, 1, 1, 1, 1,
1.340908, 1.401892, 1.9417, 1, 1, 1, 1, 1,
1.351596, 0.2425328, 1.441163, 1, 1, 1, 1, 1,
1.365037, 0.697551, 0.6533433, 1, 1, 1, 1, 1,
1.378481, 0.6925219, -0.06078145, 1, 1, 1, 1, 1,
1.390863, -0.2616054, 2.70982, 1, 1, 1, 1, 1,
1.404684, 0.1586846, 1.856196, 1, 1, 1, 1, 1,
1.414594, 0.5428075, 1.656559, 0, 0, 1, 1, 1,
1.417204, -0.6803728, 0.669881, 1, 0, 0, 1, 1,
1.423192, -0.798767, 1.637282, 1, 0, 0, 1, 1,
1.430594, 1.204107, 1.554271, 1, 0, 0, 1, 1,
1.449874, 1.295667, 1.547698, 1, 0, 0, 1, 1,
1.455547, 0.2063268, 4.669832, 1, 0, 0, 1, 1,
1.458524, -0.05676741, 1.693883, 0, 0, 0, 1, 1,
1.468989, -0.2448537, 3.095525, 0, 0, 0, 1, 1,
1.475338, -1.316436, 2.724541, 0, 0, 0, 1, 1,
1.482404, 0.1436303, 2.873347, 0, 0, 0, 1, 1,
1.482884, -0.4229445, 1.115795, 0, 0, 0, 1, 1,
1.487872, 1.19588, 1.343176, 0, 0, 0, 1, 1,
1.511679, -0.2829382, 3.167204, 0, 0, 0, 1, 1,
1.526232, 0.1151949, 1.456692, 1, 1, 1, 1, 1,
1.530111, 0.2147687, 0.9234567, 1, 1, 1, 1, 1,
1.547049, 0.143215, 0.1983015, 1, 1, 1, 1, 1,
1.557547, 0.4786585, 3.265282, 1, 1, 1, 1, 1,
1.586384, 0.7788072, 1.192495, 1, 1, 1, 1, 1,
1.601151, 0.1514971, 2.571031, 1, 1, 1, 1, 1,
1.602974, 0.7767324, 0.9987352, 1, 1, 1, 1, 1,
1.614223, -1.996757, 2.024137, 1, 1, 1, 1, 1,
1.620209, -0.9424207, 2.338653, 1, 1, 1, 1, 1,
1.632486, -0.252014, 1.404714, 1, 1, 1, 1, 1,
1.652065, -0.2465269, 1.79973, 1, 1, 1, 1, 1,
1.657147, 0.03201511, -0.06711784, 1, 1, 1, 1, 1,
1.693521, 0.8114992, 1.151749, 1, 1, 1, 1, 1,
1.698177, 0.194192, 0.875925, 1, 1, 1, 1, 1,
1.705225, -1.704475, 1.615655, 1, 1, 1, 1, 1,
1.716642, 0.2982883, 0.4178795, 0, 0, 1, 1, 1,
1.729694, 0.5778971, 2.714012, 1, 0, 0, 1, 1,
1.730364, -1.740177, 2.042287, 1, 0, 0, 1, 1,
1.753258, 0.4856576, 1.540038, 1, 0, 0, 1, 1,
1.768222, 0.2397943, 1.64436, 1, 0, 0, 1, 1,
1.770216, -0.7466356, 1.159771, 1, 0, 0, 1, 1,
1.785317, 2.184883, 1.516222, 0, 0, 0, 1, 1,
1.790022, -0.4324813, 1.224828, 0, 0, 0, 1, 1,
1.793085, 0.2037738, 2.206321, 0, 0, 0, 1, 1,
1.80207, -0.2858466, 2.296471, 0, 0, 0, 1, 1,
1.812307, -0.695285, 1.040617, 0, 0, 0, 1, 1,
1.81507, -0.2383363, 2.689809, 0, 0, 0, 1, 1,
1.817353, -1.127406, 1.515849, 0, 0, 0, 1, 1,
1.844924, 0.9510188, 1.346318, 1, 1, 1, 1, 1,
1.849156, -1.113736, 1.689048, 1, 1, 1, 1, 1,
1.866081, 0.06776527, 1.080313, 1, 1, 1, 1, 1,
1.871911, 1.080752, 1.886037, 1, 1, 1, 1, 1,
1.876666, 0.4745855, -0.5392971, 1, 1, 1, 1, 1,
1.884732, 0.4515978, 0.6710969, 1, 1, 1, 1, 1,
1.89363, 0.8083976, -0.6165329, 1, 1, 1, 1, 1,
1.899056, -0.8676581, 1.066132, 1, 1, 1, 1, 1,
1.931357, -0.09676953, 2.288945, 1, 1, 1, 1, 1,
1.948127, 0.1991548, 1.312527, 1, 1, 1, 1, 1,
1.951604, -0.09930127, 2.032751, 1, 1, 1, 1, 1,
1.952171, -0.545945, 1.913083, 1, 1, 1, 1, 1,
1.989857, -0.902025, 1.588448, 1, 1, 1, 1, 1,
1.990226, 0.6716791, 1.939159, 1, 1, 1, 1, 1,
2.002234, -1.347399, 0.2221891, 1, 1, 1, 1, 1,
2.014367, -0.6042368, 2.889788, 0, 0, 1, 1, 1,
2.021149, -1.208142, 2.416806, 1, 0, 0, 1, 1,
2.02535, 1.718509, 1.501251, 1, 0, 0, 1, 1,
2.047523, 1.14751, 0.3732813, 1, 0, 0, 1, 1,
2.093861, -0.07300294, 2.968558, 1, 0, 0, 1, 1,
2.094201, -0.4415184, 2.539269, 1, 0, 0, 1, 1,
2.103176, 0.1954624, 0.4955505, 0, 0, 0, 1, 1,
2.116405, -0.1411752, 1.426684, 0, 0, 0, 1, 1,
2.235883, 1.777297, 1.433379, 0, 0, 0, 1, 1,
2.241188, 0.1490881, 0.2177078, 0, 0, 0, 1, 1,
2.259088, -0.4465992, 2.129813, 0, 0, 0, 1, 1,
2.337313, 0.2868881, 2.63851, 0, 0, 0, 1, 1,
2.404646, 0.9856303, 1.41659, 0, 0, 0, 1, 1,
2.490784, 0.06739626, 1.346005, 1, 1, 1, 1, 1,
2.492375, 1.101566, -0.09801497, 1, 1, 1, 1, 1,
2.597417, 0.2549903, 1.299677, 1, 1, 1, 1, 1,
2.613744, -1.071583, 1.345118, 1, 1, 1, 1, 1,
2.626631, 1.007772, 2.686244, 1, 1, 1, 1, 1,
2.747395, -1.368675, 1.698241, 1, 1, 1, 1, 1,
2.814285, -1.322649, 1.238091, 1, 1, 1, 1, 1
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
var radius = 10.13179;
var distance = 35.58749;
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
mvMatrix.translate( 0.2353246, 0.6914315, 0.1410441 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.58749);
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
