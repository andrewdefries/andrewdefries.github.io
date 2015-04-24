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
-2.747168, -0.2144072, -0.6489664, 1, 0, 0, 1,
-2.744833, 0.889578, -3.023469, 1, 0.007843138, 0, 1,
-2.669319, -0.01160515, -1.808109, 1, 0.01176471, 0, 1,
-2.462776, -1.257695, -1.705969, 1, 0.01960784, 0, 1,
-2.441175, -0.9836099, -1.097305, 1, 0.02352941, 0, 1,
-2.430707, 0.9474411, -1.139679, 1, 0.03137255, 0, 1,
-2.389842, -0.3186904, -0.06581517, 1, 0.03529412, 0, 1,
-2.38635, 0.6554472, -1.506309, 1, 0.04313726, 0, 1,
-2.34086, -1.879368, -1.373296, 1, 0.04705882, 0, 1,
-2.296575, -0.9166836, -3.555119, 1, 0.05490196, 0, 1,
-2.276496, -1.243434, -0.4189999, 1, 0.05882353, 0, 1,
-2.266929, 0.5811819, -2.674083, 1, 0.06666667, 0, 1,
-2.223649, 0.1241229, -0.6461385, 1, 0.07058824, 0, 1,
-2.202584, -0.8578367, -1.974401, 1, 0.07843138, 0, 1,
-2.191142, -1.556405, -2.29359, 1, 0.08235294, 0, 1,
-2.148288, 1.22734, 0.5948895, 1, 0.09019608, 0, 1,
-2.053921, 0.9095073, -1.697237, 1, 0.09411765, 0, 1,
-2.051108, -1.116436, -2.148167, 1, 0.1019608, 0, 1,
-2.049925, 1.54261, 0.1905656, 1, 0.1098039, 0, 1,
-2.037575, -0.4302838, -1.007306, 1, 0.1137255, 0, 1,
-2.033291, 0.1586061, -1.924029, 1, 0.1215686, 0, 1,
-2.027373, 0.2050942, -1.059186, 1, 0.1254902, 0, 1,
-1.995948, -1.096479, 0.4740669, 1, 0.1333333, 0, 1,
-1.971743, 1.19697, -2.317268, 1, 0.1372549, 0, 1,
-1.939927, 0.561807, -0.1251522, 1, 0.145098, 0, 1,
-1.932965, 0.6013699, -1.824453, 1, 0.1490196, 0, 1,
-1.90942, -0.3554224, -1.190682, 1, 0.1568628, 0, 1,
-1.840209, -0.2674095, -3.081741, 1, 0.1607843, 0, 1,
-1.816064, 0.9045473, -1.763633, 1, 0.1686275, 0, 1,
-1.811021, 0.4722703, -0.08284571, 1, 0.172549, 0, 1,
-1.786685, 0.5760311, 0.2048886, 1, 0.1803922, 0, 1,
-1.77905, -0.508835, -3.339944, 1, 0.1843137, 0, 1,
-1.762192, 0.7309952, -2.191879, 1, 0.1921569, 0, 1,
-1.762114, -0.6608994, -0.7027756, 1, 0.1960784, 0, 1,
-1.75229, -0.8053378, -2.240439, 1, 0.2039216, 0, 1,
-1.722417, -1.971639, -1.621669, 1, 0.2117647, 0, 1,
-1.719851, 2.101484, -1.641574, 1, 0.2156863, 0, 1,
-1.718969, 0.3532382, -1.970821, 1, 0.2235294, 0, 1,
-1.718131, 1.096538, -1.11823, 1, 0.227451, 0, 1,
-1.685355, -1.544546, -1.026947, 1, 0.2352941, 0, 1,
-1.681864, 0.4834503, -1.001141, 1, 0.2392157, 0, 1,
-1.676998, 0.128384, -0.5253915, 1, 0.2470588, 0, 1,
-1.673434, 2.539373, 1.186597, 1, 0.2509804, 0, 1,
-1.655421, 2.014931, 0.5855613, 1, 0.2588235, 0, 1,
-1.652977, 0.2859184, -1.183443, 1, 0.2627451, 0, 1,
-1.651017, 1.398517, -0.1766413, 1, 0.2705882, 0, 1,
-1.650089, 0.1402539, -0.8823751, 1, 0.2745098, 0, 1,
-1.619235, 0.5257504, -0.6353186, 1, 0.282353, 0, 1,
-1.605935, 1.382923, 0.02696538, 1, 0.2862745, 0, 1,
-1.597668, -0.4146363, -2.017704, 1, 0.2941177, 0, 1,
-1.597268, 1.442964, -1.607221, 1, 0.3019608, 0, 1,
-1.593358, 0.2813845, -2.284468, 1, 0.3058824, 0, 1,
-1.579392, -2.685784, -0.6033557, 1, 0.3137255, 0, 1,
-1.56949, 0.08259087, -0.2564322, 1, 0.3176471, 0, 1,
-1.569363, -0.6646442, -2.530745, 1, 0.3254902, 0, 1,
-1.561984, 0.808024, -1.722794, 1, 0.3294118, 0, 1,
-1.542787, -2.137092, -1.604604, 1, 0.3372549, 0, 1,
-1.534011, 0.0305929, -1.921903, 1, 0.3411765, 0, 1,
-1.522339, -0.3003031, -1.071127, 1, 0.3490196, 0, 1,
-1.516343, -0.7172794, -0.716152, 1, 0.3529412, 0, 1,
-1.512997, -1.017565, -1.597259, 1, 0.3607843, 0, 1,
-1.507813, 1.334113, -0.6648527, 1, 0.3647059, 0, 1,
-1.500079, 2.283974, -1.597263, 1, 0.372549, 0, 1,
-1.479901, -0.9575257, -1.052619, 1, 0.3764706, 0, 1,
-1.478657, -0.4106553, -1.830732, 1, 0.3843137, 0, 1,
-1.472876, -0.618602, -1.479051, 1, 0.3882353, 0, 1,
-1.462363, -0.1747672, -3.541637, 1, 0.3960784, 0, 1,
-1.442284, 0.6277422, -2.028286, 1, 0.4039216, 0, 1,
-1.437066, -1.562525, -1.864717, 1, 0.4078431, 0, 1,
-1.427215, 0.2185558, -1.690078, 1, 0.4156863, 0, 1,
-1.42404, 0.1381325, 0.055651, 1, 0.4196078, 0, 1,
-1.423656, 0.7032899, -0.8597073, 1, 0.427451, 0, 1,
-1.419469, -0.3281609, -1.498713, 1, 0.4313726, 0, 1,
-1.408064, -0.02583571, -2.173368, 1, 0.4392157, 0, 1,
-1.407695, -0.09716919, -0.7223532, 1, 0.4431373, 0, 1,
-1.399885, 0.1147161, -0.9847353, 1, 0.4509804, 0, 1,
-1.396884, 1.058299, -1.312999, 1, 0.454902, 0, 1,
-1.39518, 1.603416, 0.01047877, 1, 0.4627451, 0, 1,
-1.394388, -1.306154, -2.737208, 1, 0.4666667, 0, 1,
-1.392902, -0.1349854, -1.482142, 1, 0.4745098, 0, 1,
-1.38604, 0.5849091, -2.035611, 1, 0.4784314, 0, 1,
-1.372856, 1.797132, -0.5884362, 1, 0.4862745, 0, 1,
-1.367674, 1.165274, -0.1487222, 1, 0.4901961, 0, 1,
-1.364718, 1.145861, 0.01025499, 1, 0.4980392, 0, 1,
-1.359947, 3.450709, 1.217176, 1, 0.5058824, 0, 1,
-1.351966, 2.201239, -1.133973, 1, 0.509804, 0, 1,
-1.349602, 0.9873345, -1.202079, 1, 0.5176471, 0, 1,
-1.342591, -1.751794, -3.570394, 1, 0.5215687, 0, 1,
-1.34155, -0.6324136, -2.23022, 1, 0.5294118, 0, 1,
-1.330176, -0.9433569, 0.08748151, 1, 0.5333334, 0, 1,
-1.317801, 1.676176, -0.9108937, 1, 0.5411765, 0, 1,
-1.31693, 0.6204724, -2.904684, 1, 0.5450981, 0, 1,
-1.312047, -0.6869404, -1.742671, 1, 0.5529412, 0, 1,
-1.310059, 1.396459, -0.416684, 1, 0.5568628, 0, 1,
-1.308755, 1.778189, -1.174163, 1, 0.5647059, 0, 1,
-1.30009, 0.03718126, -2.746781, 1, 0.5686275, 0, 1,
-1.286821, 2.162948, -0.6988549, 1, 0.5764706, 0, 1,
-1.281475, -0.2143678, -2.367573, 1, 0.5803922, 0, 1,
-1.281008, -1.715798, -1.402436, 1, 0.5882353, 0, 1,
-1.280408, 1.218032, -3.431037, 1, 0.5921569, 0, 1,
-1.275619, 0.6089121, -1.879616, 1, 0.6, 0, 1,
-1.268311, -0.4700148, -0.8220949, 1, 0.6078432, 0, 1,
-1.258193, -0.5089441, -1.634094, 1, 0.6117647, 0, 1,
-1.253845, -0.1793475, -2.922569, 1, 0.6196079, 0, 1,
-1.25349, -0.3701719, -1.254029, 1, 0.6235294, 0, 1,
-1.249219, -0.2764632, -2.398021, 1, 0.6313726, 0, 1,
-1.244009, -0.349687, -0.6481447, 1, 0.6352941, 0, 1,
-1.235918, -0.5948141, -1.737706, 1, 0.6431373, 0, 1,
-1.224644, 1.395505, -1.4713, 1, 0.6470588, 0, 1,
-1.223761, 1.472177, -0.8301033, 1, 0.654902, 0, 1,
-1.223505, 0.4368671, -1.060766, 1, 0.6588235, 0, 1,
-1.217775, 0.2782651, -0.01733618, 1, 0.6666667, 0, 1,
-1.196324, -1.536545, -2.038908, 1, 0.6705883, 0, 1,
-1.187423, -1.82374, -3.300238, 1, 0.6784314, 0, 1,
-1.182229, 0.45808, -0.2900821, 1, 0.682353, 0, 1,
-1.179502, 0.03551505, -1.238305, 1, 0.6901961, 0, 1,
-1.178558, -0.318206, -4.480651, 1, 0.6941177, 0, 1,
-1.172592, -1.088026, -1.769011, 1, 0.7019608, 0, 1,
-1.161286, 1.612516, -0.1396386, 1, 0.7098039, 0, 1,
-1.156656, 0.4081004, -1.339968, 1, 0.7137255, 0, 1,
-1.156456, -0.6291673, -2.432613, 1, 0.7215686, 0, 1,
-1.155115, -0.01039061, -1.579545, 1, 0.7254902, 0, 1,
-1.152802, 2.363244, -1.612177, 1, 0.7333333, 0, 1,
-1.146665, -0.03917526, -2.181678, 1, 0.7372549, 0, 1,
-1.143196, -1.766238, -2.581358, 1, 0.7450981, 0, 1,
-1.133763, 1.745807, -1.896569, 1, 0.7490196, 0, 1,
-1.125291, -0.4704559, -3.257034, 1, 0.7568628, 0, 1,
-1.124414, 0.1402957, -0.4199395, 1, 0.7607843, 0, 1,
-1.12296, -2.844126, -2.078102, 1, 0.7686275, 0, 1,
-1.122484, 0.252428, -3.920251, 1, 0.772549, 0, 1,
-1.11683, 0.05106729, -0.6432188, 1, 0.7803922, 0, 1,
-1.102516, -0.211447, -1.947642, 1, 0.7843137, 0, 1,
-1.096657, -1.627504, -2.663286, 1, 0.7921569, 0, 1,
-1.089031, 0.2852266, -1.160475, 1, 0.7960784, 0, 1,
-1.084977, -0.5826783, -1.621819, 1, 0.8039216, 0, 1,
-1.06754, -1.189211, -0.899229, 1, 0.8117647, 0, 1,
-1.062589, -1.609748, -1.293075, 1, 0.8156863, 0, 1,
-1.053875, 0.5505967, -0.113986, 1, 0.8235294, 0, 1,
-1.05234, -1.094202, -3.804124, 1, 0.827451, 0, 1,
-1.05202, -2.173649, -1.682711, 1, 0.8352941, 0, 1,
-1.049441, -0.5906556, -2.435989, 1, 0.8392157, 0, 1,
-1.040603, 0.2078921, -0.932734, 1, 0.8470588, 0, 1,
-1.031622, -0.1266203, -0.7501858, 1, 0.8509804, 0, 1,
-1.022289, -0.8084326, -2.27147, 1, 0.8588235, 0, 1,
-1.018893, -0.3662261, -2.370911, 1, 0.8627451, 0, 1,
-1.012489, 0.5914243, -2.971064, 1, 0.8705882, 0, 1,
-1.007543, 0.7610989, 0.3751326, 1, 0.8745098, 0, 1,
-1.0006, -1.164662, -2.418365, 1, 0.8823529, 0, 1,
-0.9971733, 1.636607, 0.2743036, 1, 0.8862745, 0, 1,
-0.9882565, 1.608041, 0.1516929, 1, 0.8941177, 0, 1,
-0.9741092, -0.4612318, -0.5237907, 1, 0.8980392, 0, 1,
-0.9726814, -0.2246529, -1.762024, 1, 0.9058824, 0, 1,
-0.9657627, -0.4425285, -3.040588, 1, 0.9137255, 0, 1,
-0.9597914, 0.006980381, 0.15335, 1, 0.9176471, 0, 1,
-0.9589878, -1.768209, -2.277335, 1, 0.9254902, 0, 1,
-0.9568225, -0.01191835, -3.153931, 1, 0.9294118, 0, 1,
-0.9537299, 1.069946, -0.3571722, 1, 0.9372549, 0, 1,
-0.9501627, -0.828716, -2.294806, 1, 0.9411765, 0, 1,
-0.9485719, -0.2932262, -2.537381, 1, 0.9490196, 0, 1,
-0.9404664, 0.3048699, -2.157234, 1, 0.9529412, 0, 1,
-0.9380425, -0.7501785, -1.259616, 1, 0.9607843, 0, 1,
-0.9334854, 0.9127247, -1.950518, 1, 0.9647059, 0, 1,
-0.9329481, -0.6535768, -3.040468, 1, 0.972549, 0, 1,
-0.9324564, 1.447968, 0.04340672, 1, 0.9764706, 0, 1,
-0.9324234, 0.2330105, -2.032351, 1, 0.9843137, 0, 1,
-0.9308326, -0.3206334, -2.643856, 1, 0.9882353, 0, 1,
-0.9293523, -0.7776516, -1.559397, 1, 0.9960784, 0, 1,
-0.9260452, -0.1354394, 0.05219577, 0.9960784, 1, 0, 1,
-0.9181637, -1.027678, -0.370183, 0.9921569, 1, 0, 1,
-0.916867, -0.5789323, -2.529312, 0.9843137, 1, 0, 1,
-0.9158993, 0.798609, -1.914107, 0.9803922, 1, 0, 1,
-0.9153111, 0.3497631, -1.308319, 0.972549, 1, 0, 1,
-0.9133772, -0.3513448, -2.398565, 0.9686275, 1, 0, 1,
-0.9071284, -0.0006421403, -2.769827, 0.9607843, 1, 0, 1,
-0.9041111, -1.391695, -2.089816, 0.9568627, 1, 0, 1,
-0.9031175, 2.116904, -0.6760718, 0.9490196, 1, 0, 1,
-0.9020367, 1.334862, -0.6499386, 0.945098, 1, 0, 1,
-0.8972607, 0.879863, -3.831253, 0.9372549, 1, 0, 1,
-0.8955589, 0.1527005, -1.495236, 0.9333333, 1, 0, 1,
-0.8854931, 1.788029, 0.2987885, 0.9254902, 1, 0, 1,
-0.8828629, 0.9150321, -1.525845, 0.9215686, 1, 0, 1,
-0.8810688, 0.5722562, -2.517661, 0.9137255, 1, 0, 1,
-0.8782044, 1.194733, 0.5103633, 0.9098039, 1, 0, 1,
-0.8735067, -0.09972791, -2.066523, 0.9019608, 1, 0, 1,
-0.8720614, -1.026441, -1.727686, 0.8941177, 1, 0, 1,
-0.8694866, 1.071354, 2.12823, 0.8901961, 1, 0, 1,
-0.8689961, 0.9567398, -0.7529557, 0.8823529, 1, 0, 1,
-0.8567944, 0.4558977, -0.2451627, 0.8784314, 1, 0, 1,
-0.8537381, 0.6058767, -1.348048, 0.8705882, 1, 0, 1,
-0.8510413, 0.4362558, -2.882714, 0.8666667, 1, 0, 1,
-0.843204, -0.03529564, -2.261227, 0.8588235, 1, 0, 1,
-0.8430936, -0.8067519, -2.074084, 0.854902, 1, 0, 1,
-0.8327114, -0.3496854, -1.022917, 0.8470588, 1, 0, 1,
-0.8302317, 0.6867056, -1.663756, 0.8431373, 1, 0, 1,
-0.8279997, -1.385187, -3.824994, 0.8352941, 1, 0, 1,
-0.8273528, -0.02859486, -1.73631, 0.8313726, 1, 0, 1,
-0.826715, -1.150281, -0.6781939, 0.8235294, 1, 0, 1,
-0.8071963, 2.051724, 0.03653044, 0.8196079, 1, 0, 1,
-0.8055048, -0.591864, -3.727523, 0.8117647, 1, 0, 1,
-0.8051521, -0.5384369, -1.780685, 0.8078431, 1, 0, 1,
-0.8035965, -0.7472316, -2.184545, 0.8, 1, 0, 1,
-0.797524, 1.885114, -0.2744719, 0.7921569, 1, 0, 1,
-0.7912217, 1.08699, -0.7771592, 0.7882353, 1, 0, 1,
-0.7896172, 1.038537, -0.7963077, 0.7803922, 1, 0, 1,
-0.7822196, -0.2592072, -1.217387, 0.7764706, 1, 0, 1,
-0.7817455, -2.215886, -2.16603, 0.7686275, 1, 0, 1,
-0.7813399, 0.9302193, -1.347285, 0.7647059, 1, 0, 1,
-0.7757106, -0.2314815, -1.961809, 0.7568628, 1, 0, 1,
-0.7702175, -0.07320927, -2.133685, 0.7529412, 1, 0, 1,
-0.7699279, 0.07079536, -1.293932, 0.7450981, 1, 0, 1,
-0.7648311, -0.7484437, -3.524022, 0.7411765, 1, 0, 1,
-0.7632837, -0.8442158, -2.981707, 0.7333333, 1, 0, 1,
-0.7616345, 0.6481181, -2.353981, 0.7294118, 1, 0, 1,
-0.7611443, 0.5684867, -0.3837471, 0.7215686, 1, 0, 1,
-0.7550867, -0.5490863, -2.835403, 0.7176471, 1, 0, 1,
-0.7489691, -0.6083415, -0.9162288, 0.7098039, 1, 0, 1,
-0.7456065, 1.180787, -1.237953, 0.7058824, 1, 0, 1,
-0.7413569, -0.3394252, -1.676784, 0.6980392, 1, 0, 1,
-0.7387705, 0.6667888, -0.9077306, 0.6901961, 1, 0, 1,
-0.7375031, -1.396386, -2.070101, 0.6862745, 1, 0, 1,
-0.7345344, 0.3026861, -0.2219473, 0.6784314, 1, 0, 1,
-0.7331033, 0.03053988, -1.273231, 0.6745098, 1, 0, 1,
-0.7269087, -0.482002, -3.00358, 0.6666667, 1, 0, 1,
-0.7256564, -0.9879209, -3.095674, 0.6627451, 1, 0, 1,
-0.7184456, -0.6822409, -2.058743, 0.654902, 1, 0, 1,
-0.7132699, -0.04406328, -1.546032, 0.6509804, 1, 0, 1,
-0.7083419, 0.6172573, -0.816162, 0.6431373, 1, 0, 1,
-0.7051089, -0.7068843, -4.273932, 0.6392157, 1, 0, 1,
-0.6997772, 0.0822197, -0.01538001, 0.6313726, 1, 0, 1,
-0.6914959, 0.3172691, -2.309831, 0.627451, 1, 0, 1,
-0.690952, -0.9113223, -3.343062, 0.6196079, 1, 0, 1,
-0.6850241, -0.3120293, -2.714984, 0.6156863, 1, 0, 1,
-0.6812052, -0.7129545, -2.88142, 0.6078432, 1, 0, 1,
-0.6792763, 0.2195393, -2.26962, 0.6039216, 1, 0, 1,
-0.6743638, 0.5419289, -0.07181977, 0.5960785, 1, 0, 1,
-0.6723346, -1.108346, -2.721328, 0.5882353, 1, 0, 1,
-0.6715532, 1.428596, -1.136816, 0.5843138, 1, 0, 1,
-0.6696203, -0.3000938, -2.373963, 0.5764706, 1, 0, 1,
-0.6685967, 0.1850647, -1.988458, 0.572549, 1, 0, 1,
-0.66821, 0.6627567, -2.158738, 0.5647059, 1, 0, 1,
-0.665144, 0.05327736, -0.5210657, 0.5607843, 1, 0, 1,
-0.6649107, -0.3140685, -2.687701, 0.5529412, 1, 0, 1,
-0.6626577, -1.28993, -1.242989, 0.5490196, 1, 0, 1,
-0.6581395, -0.390718, -1.495841, 0.5411765, 1, 0, 1,
-0.6553262, 0.3800849, -1.180492, 0.5372549, 1, 0, 1,
-0.6523779, 0.5149524, 0.3018048, 0.5294118, 1, 0, 1,
-0.6518921, 1.134971, -0.3230278, 0.5254902, 1, 0, 1,
-0.6442333, 0.207186, 0.6335155, 0.5176471, 1, 0, 1,
-0.6438736, -0.302917, -2.99138, 0.5137255, 1, 0, 1,
-0.6433106, -0.7652704, -3.347309, 0.5058824, 1, 0, 1,
-0.6270677, -0.64853, -3.537495, 0.5019608, 1, 0, 1,
-0.6247098, 0.2688151, -0.7066094, 0.4941176, 1, 0, 1,
-0.6158243, -0.2331075, -1.525111, 0.4862745, 1, 0, 1,
-0.6058133, 2.087588, 0.4375556, 0.4823529, 1, 0, 1,
-0.6046494, 0.6335135, -0.5254265, 0.4745098, 1, 0, 1,
-0.6033728, -0.6253356, -2.971727, 0.4705882, 1, 0, 1,
-0.6031901, -0.8147527, -2.746006, 0.4627451, 1, 0, 1,
-0.6022565, -0.3028615, -2.736337, 0.4588235, 1, 0, 1,
-0.602088, 1.335637, -0.9897073, 0.4509804, 1, 0, 1,
-0.5962518, -1.48215, -2.680474, 0.4470588, 1, 0, 1,
-0.5908507, -0.09495261, -0.7585407, 0.4392157, 1, 0, 1,
-0.5889651, 0.9702204, 0.8262057, 0.4352941, 1, 0, 1,
-0.5877909, -0.5537829, -2.207452, 0.427451, 1, 0, 1,
-0.5861083, 0.6275457, -2.190012, 0.4235294, 1, 0, 1,
-0.5836175, -1.336573, -2.857045, 0.4156863, 1, 0, 1,
-0.5817044, -0.3823868, -3.136655, 0.4117647, 1, 0, 1,
-0.579899, -0.1556722, -2.881029, 0.4039216, 1, 0, 1,
-0.578588, -0.4875675, -1.986748, 0.3960784, 1, 0, 1,
-0.5784035, 0.8273627, -2.094622, 0.3921569, 1, 0, 1,
-0.5775996, -0.4944639, -3.195302, 0.3843137, 1, 0, 1,
-0.5743517, 0.4869105, -1.53498, 0.3803922, 1, 0, 1,
-0.574262, 0.7115074, 0.07526693, 0.372549, 1, 0, 1,
-0.5612143, 0.09385857, -1.810673, 0.3686275, 1, 0, 1,
-0.5611072, 1.593073, 0.5270773, 0.3607843, 1, 0, 1,
-0.5493972, -0.2987168, -1.334803, 0.3568628, 1, 0, 1,
-0.5485577, -0.4894039, -3.56505, 0.3490196, 1, 0, 1,
-0.5466653, 1.572182, -0.4019005, 0.345098, 1, 0, 1,
-0.5456482, -0.7729536, -1.45962, 0.3372549, 1, 0, 1,
-0.5450481, -0.004700818, -0.8703516, 0.3333333, 1, 0, 1,
-0.5419788, -0.1589466, -2.640555, 0.3254902, 1, 0, 1,
-0.5323978, 0.997112, 0.3233303, 0.3215686, 1, 0, 1,
-0.5289, -1.603067, -2.115725, 0.3137255, 1, 0, 1,
-0.5271069, 0.4422153, -1.860249, 0.3098039, 1, 0, 1,
-0.5268688, 2.194863, -0.7315848, 0.3019608, 1, 0, 1,
-0.5243183, 0.655107, -1.860898, 0.2941177, 1, 0, 1,
-0.5169707, 0.5903431, 0.159731, 0.2901961, 1, 0, 1,
-0.5161904, -1.489324, -2.133284, 0.282353, 1, 0, 1,
-0.5144282, 1.981254, 0.8979298, 0.2784314, 1, 0, 1,
-0.5079305, -0.11986, -2.736356, 0.2705882, 1, 0, 1,
-0.5068648, 1.378747, -0.2507901, 0.2666667, 1, 0, 1,
-0.5021117, 0.03127731, -2.380844, 0.2588235, 1, 0, 1,
-0.5016624, -0.5914849, -3.161934, 0.254902, 1, 0, 1,
-0.5011477, 0.8036984, -0.4627106, 0.2470588, 1, 0, 1,
-0.4991742, -0.9457604, -3.058979, 0.2431373, 1, 0, 1,
-0.4987589, -0.8230115, -4.269042, 0.2352941, 1, 0, 1,
-0.4959086, -0.4542377, -0.4933963, 0.2313726, 1, 0, 1,
-0.4931775, -0.882051, -1.3473, 0.2235294, 1, 0, 1,
-0.4904155, 1.424047, -0.9928151, 0.2196078, 1, 0, 1,
-0.4892379, -0.6893978, -2.280244, 0.2117647, 1, 0, 1,
-0.4855501, -2.201542, -2.666741, 0.2078431, 1, 0, 1,
-0.4758745, 0.08550961, -1.050598, 0.2, 1, 0, 1,
-0.47087, -1.599373, -3.914046, 0.1921569, 1, 0, 1,
-0.4704675, -0.1740698, -0.5963556, 0.1882353, 1, 0, 1,
-0.4700913, 0.09087781, -3.051231, 0.1803922, 1, 0, 1,
-0.4695596, 1.256633, -0.1813839, 0.1764706, 1, 0, 1,
-0.4694587, 1.30407, -1.479197, 0.1686275, 1, 0, 1,
-0.4687545, -3.038908, -1.429486, 0.1647059, 1, 0, 1,
-0.4591441, 0.6412476, -0.2704878, 0.1568628, 1, 0, 1,
-0.4573067, 2.466811, -1.757073, 0.1529412, 1, 0, 1,
-0.4570541, 1.470104, 0.8966513, 0.145098, 1, 0, 1,
-0.4538908, 1.661637, 0.1950348, 0.1411765, 1, 0, 1,
-0.4490262, 0.2316833, -1.858815, 0.1333333, 1, 0, 1,
-0.4489615, 1.613995, 0.7079914, 0.1294118, 1, 0, 1,
-0.4460374, -0.5518795, -1.728258, 0.1215686, 1, 0, 1,
-0.4459283, 0.2445242, -1.660652, 0.1176471, 1, 0, 1,
-0.43935, -0.7532744, -2.272043, 0.1098039, 1, 0, 1,
-0.4376692, 1.215629, 0.4544289, 0.1058824, 1, 0, 1,
-0.4370413, -1.11898, -3.025668, 0.09803922, 1, 0, 1,
-0.4352492, 0.6034333, -0.1415864, 0.09019608, 1, 0, 1,
-0.4341432, -0.9719216, -1.650081, 0.08627451, 1, 0, 1,
-0.433385, -0.9707022, -4.193611, 0.07843138, 1, 0, 1,
-0.4332879, -1.220934, -2.704677, 0.07450981, 1, 0, 1,
-0.4315515, -1.359997, -1.797992, 0.06666667, 1, 0, 1,
-0.428536, -0.286413, -2.180751, 0.0627451, 1, 0, 1,
-0.4283517, 0.2547753, -1.78457, 0.05490196, 1, 0, 1,
-0.4182633, -0.3837871, -2.063078, 0.05098039, 1, 0, 1,
-0.4126239, -0.3363985, -1.183862, 0.04313726, 1, 0, 1,
-0.4105543, -1.503749, -2.751053, 0.03921569, 1, 0, 1,
-0.4087121, 0.8698648, -1.154519, 0.03137255, 1, 0, 1,
-0.4037518, 0.3239889, -2.221813, 0.02745098, 1, 0, 1,
-0.3973754, 1.667577, -1.305621, 0.01960784, 1, 0, 1,
-0.3955809, 0.4178506, -0.977192, 0.01568628, 1, 0, 1,
-0.3946252, 1.849043, -0.3181469, 0.007843138, 1, 0, 1,
-0.3924792, 0.4552569, 0.5640345, 0.003921569, 1, 0, 1,
-0.3920243, 0.1893185, 1.975307, 0, 1, 0.003921569, 1,
-0.3869328, 0.2056626, -1.998861, 0, 1, 0.01176471, 1,
-0.3848439, -0.3348747, -2.860729, 0, 1, 0.01568628, 1,
-0.3819813, 1.112321, -0.06707145, 0, 1, 0.02352941, 1,
-0.367323, 1.646123, -1.991126, 0, 1, 0.02745098, 1,
-0.3667302, 0.583813, -0.277558, 0, 1, 0.03529412, 1,
-0.3666715, -0.3216733, -3.795335, 0, 1, 0.03921569, 1,
-0.3661928, 0.3463302, 0.7730706, 0, 1, 0.04705882, 1,
-0.3641145, 1.424426, 0.3174647, 0, 1, 0.05098039, 1,
-0.3622259, -0.4293952, -2.310755, 0, 1, 0.05882353, 1,
-0.3616755, -0.8311616, -3.16387, 0, 1, 0.0627451, 1,
-0.360543, -0.1839754, -3.323022, 0, 1, 0.07058824, 1,
-0.3593304, -0.8128214, -3.588712, 0, 1, 0.07450981, 1,
-0.3584881, -2.108925, -3.621614, 0, 1, 0.08235294, 1,
-0.3573513, -0.3503389, -2.516574, 0, 1, 0.08627451, 1,
-0.3562415, 0.6840606, -1.76207, 0, 1, 0.09411765, 1,
-0.3551376, -0.3384508, -1.734358, 0, 1, 0.1019608, 1,
-0.3534654, 0.4685533, 0.9107182, 0, 1, 0.1058824, 1,
-0.3506167, -0.7899354, -2.633379, 0, 1, 0.1137255, 1,
-0.3478964, -0.4867108, -2.667726, 0, 1, 0.1176471, 1,
-0.3469959, -1.969292, -4.355392, 0, 1, 0.1254902, 1,
-0.337299, 0.03189926, -1.724162, 0, 1, 0.1294118, 1,
-0.3352997, -1.851157, -3.15823, 0, 1, 0.1372549, 1,
-0.331863, -0.1661278, -3.98021, 0, 1, 0.1411765, 1,
-0.3279157, 1.403666, -0.497254, 0, 1, 0.1490196, 1,
-0.3270734, -0.3567702, -2.134211, 0, 1, 0.1529412, 1,
-0.3250173, 0.1745495, -1.104096, 0, 1, 0.1607843, 1,
-0.3245183, -1.588213, -3.107448, 0, 1, 0.1647059, 1,
-0.3205245, -0.6744668, -3.696412, 0, 1, 0.172549, 1,
-0.3176602, -0.4410085, -1.595842, 0, 1, 0.1764706, 1,
-0.3158901, -1.267599, -4.085293, 0, 1, 0.1843137, 1,
-0.3145387, -0.9619832, -3.120329, 0, 1, 0.1882353, 1,
-0.3141116, 1.118257, -1.745483, 0, 1, 0.1960784, 1,
-0.3109416, 0.4382882, 0.8714467, 0, 1, 0.2039216, 1,
-0.3103179, 1.712926, -1.750491, 0, 1, 0.2078431, 1,
-0.3070726, 0.4992894, -0.2550309, 0, 1, 0.2156863, 1,
-0.3066688, 0.357558, -2.340935, 0, 1, 0.2196078, 1,
-0.3037384, -0.02907138, -1.788578, 0, 1, 0.227451, 1,
-0.2994005, -1.116994, -2.429188, 0, 1, 0.2313726, 1,
-0.292844, 0.4499181, -1.039212, 0, 1, 0.2392157, 1,
-0.2920347, -0.7484784, -1.189792, 0, 1, 0.2431373, 1,
-0.289722, 0.1520922, -1.925902, 0, 1, 0.2509804, 1,
-0.288157, 0.4567707, -2.127811, 0, 1, 0.254902, 1,
-0.2878577, 0.3742062, 0.003582517, 0, 1, 0.2627451, 1,
-0.2839194, 0.6136294, -1.904366, 0, 1, 0.2666667, 1,
-0.2826074, 1.689224, -0.1877927, 0, 1, 0.2745098, 1,
-0.2824822, 0.8071199, -0.1891593, 0, 1, 0.2784314, 1,
-0.2793212, -2.213061, -2.831598, 0, 1, 0.2862745, 1,
-0.2710478, 1.02778, -0.1450468, 0, 1, 0.2901961, 1,
-0.2710254, -1.313782, -3.487379, 0, 1, 0.2980392, 1,
-0.2683533, -1.094215, -4.472742, 0, 1, 0.3058824, 1,
-0.2641669, 0.1505567, -1.677027, 0, 1, 0.3098039, 1,
-0.2619429, 0.7204091, 0.9737567, 0, 1, 0.3176471, 1,
-0.2606679, -0.7245007, -4.397953, 0, 1, 0.3215686, 1,
-0.2602738, -0.1346099, -4.602044, 0, 1, 0.3294118, 1,
-0.2593263, -0.8924078, -1.989782, 0, 1, 0.3333333, 1,
-0.2581618, -0.1921252, -2.500632, 0, 1, 0.3411765, 1,
-0.2565181, 0.1932185, 0.9200391, 0, 1, 0.345098, 1,
-0.2543982, -1.772421, -2.777002, 0, 1, 0.3529412, 1,
-0.2542553, -0.6508155, -2.293607, 0, 1, 0.3568628, 1,
-0.2516702, 0.7539024, 1.530526, 0, 1, 0.3647059, 1,
-0.2511567, 0.4136125, -0.7252403, 0, 1, 0.3686275, 1,
-0.2496723, 1.167908, -1.108816, 0, 1, 0.3764706, 1,
-0.2492835, -0.4264139, -2.597126, 0, 1, 0.3803922, 1,
-0.2400192, -2.121247, -2.173679, 0, 1, 0.3882353, 1,
-0.2355488, -2.949372, -2.492239, 0, 1, 0.3921569, 1,
-0.2353175, -1.842919, -3.226987, 0, 1, 0.4, 1,
-0.2345786, 0.6116628, -0.1073588, 0, 1, 0.4078431, 1,
-0.2319048, 0.6569588, -1.771323, 0, 1, 0.4117647, 1,
-0.2285762, 0.5937487, -0.1273825, 0, 1, 0.4196078, 1,
-0.2264623, -0.9259667, -2.842492, 0, 1, 0.4235294, 1,
-0.2248159, 0.6949765, -1.174113, 0, 1, 0.4313726, 1,
-0.2206019, -0.3661735, -0.8405485, 0, 1, 0.4352941, 1,
-0.2175389, 0.2755596, 0.2592729, 0, 1, 0.4431373, 1,
-0.2107669, -1.177193, -2.535161, 0, 1, 0.4470588, 1,
-0.2104951, 1.202796, -1.709531, 0, 1, 0.454902, 1,
-0.2100765, -0.9455371, -4.102214, 0, 1, 0.4588235, 1,
-0.2042151, -0.1546467, -2.487802, 0, 1, 0.4666667, 1,
-0.2022719, 0.717383, -1.553352, 0, 1, 0.4705882, 1,
-0.1984098, -0.1140036, -2.240019, 0, 1, 0.4784314, 1,
-0.1977617, -1.284179, -1.556606, 0, 1, 0.4823529, 1,
-0.197095, 0.633446, 0.4449717, 0, 1, 0.4901961, 1,
-0.1951438, 1.310158, 1.65918, 0, 1, 0.4941176, 1,
-0.1939254, 0.3531218, -0.4990251, 0, 1, 0.5019608, 1,
-0.1908783, -1.324096, -2.843083, 0, 1, 0.509804, 1,
-0.188733, -0.4981586, -2.100445, 0, 1, 0.5137255, 1,
-0.1862749, 1.619514, -0.3928286, 0, 1, 0.5215687, 1,
-0.1860918, -0.5934891, -4.058796, 0, 1, 0.5254902, 1,
-0.1836935, 0.1262784, -1.870553, 0, 1, 0.5333334, 1,
-0.183522, -0.4938034, -4.086558, 0, 1, 0.5372549, 1,
-0.1799124, 0.05692514, -2.460795, 0, 1, 0.5450981, 1,
-0.1783436, 0.852991, 0.709975, 0, 1, 0.5490196, 1,
-0.1771946, 0.1899536, 0.0722257, 0, 1, 0.5568628, 1,
-0.1762781, 0.2900234, -0.4090962, 0, 1, 0.5607843, 1,
-0.1752928, 0.08253285, -0.7989497, 0, 1, 0.5686275, 1,
-0.1723901, 0.4757604, -0.3070388, 0, 1, 0.572549, 1,
-0.1707437, 0.009745589, -1.123582, 0, 1, 0.5803922, 1,
-0.1685175, -1.158753, -2.725159, 0, 1, 0.5843138, 1,
-0.1635069, 0.5114316, -1.115545, 0, 1, 0.5921569, 1,
-0.1633709, -1.944624, -3.617795, 0, 1, 0.5960785, 1,
-0.1631823, 0.8165144, -2.267293, 0, 1, 0.6039216, 1,
-0.1630317, -0.4460478, -2.825067, 0, 1, 0.6117647, 1,
-0.1564772, -0.7746168, -3.069475, 0, 1, 0.6156863, 1,
-0.1521737, -1.095691, -5.548921, 0, 1, 0.6235294, 1,
-0.1505956, -1.079178, -2.043728, 0, 1, 0.627451, 1,
-0.1465334, 1.919083, -0.2729568, 0, 1, 0.6352941, 1,
-0.1454339, -0.3351605, -3.771512, 0, 1, 0.6392157, 1,
-0.1367529, -1.503648, -3.38976, 0, 1, 0.6470588, 1,
-0.1312366, -0.1576083, -1.171269, 0, 1, 0.6509804, 1,
-0.1279271, -0.4762754, -1.808201, 0, 1, 0.6588235, 1,
-0.1273458, 0.9577678, -0.3525763, 0, 1, 0.6627451, 1,
-0.1267871, 0.8886095, -1.638614, 0, 1, 0.6705883, 1,
-0.1257897, -1.520254, -3.406446, 0, 1, 0.6745098, 1,
-0.1249502, 0.3202326, -1.612502, 0, 1, 0.682353, 1,
-0.1228709, -0.7481745, -2.944532, 0, 1, 0.6862745, 1,
-0.1214691, -0.3312871, -3.814738, 0, 1, 0.6941177, 1,
-0.1154743, 0.7751076, -1.357362, 0, 1, 0.7019608, 1,
-0.1150037, 0.3674924, -2.883627, 0, 1, 0.7058824, 1,
-0.1140548, 0.1867636, -0.5973454, 0, 1, 0.7137255, 1,
-0.1133845, 0.1837638, 0.2020731, 0, 1, 0.7176471, 1,
-0.1127928, -0.6080273, -3.24023, 0, 1, 0.7254902, 1,
-0.1107721, 0.5374105, 1.078291, 0, 1, 0.7294118, 1,
-0.1083716, -0.2380091, -1.598888, 0, 1, 0.7372549, 1,
-0.1075167, 0.08646931, -0.5183562, 0, 1, 0.7411765, 1,
-0.1063667, 0.7182822, 0.8384972, 0, 1, 0.7490196, 1,
-0.1046323, 2.143494, -0.2710246, 0, 1, 0.7529412, 1,
-0.1045767, -0.8940902, -3.023265, 0, 1, 0.7607843, 1,
-0.1036131, 0.6708299, -0.9490586, 0, 1, 0.7647059, 1,
-0.1017741, 3.360645, 0.2784272, 0, 1, 0.772549, 1,
-0.100156, -0.04936277, -2.979235, 0, 1, 0.7764706, 1,
-0.09793824, -1.017987, -0.960151, 0, 1, 0.7843137, 1,
-0.09234171, -0.5610058, -3.485457, 0, 1, 0.7882353, 1,
-0.09099261, 0.5088227, 0.4745524, 0, 1, 0.7960784, 1,
-0.08877776, 0.6326049, 0.8368871, 0, 1, 0.8039216, 1,
-0.08663907, -0.9177521, -2.362599, 0, 1, 0.8078431, 1,
-0.08212853, -0.8499293, -1.536414, 0, 1, 0.8156863, 1,
-0.08201903, 0.3566495, 1.183524, 0, 1, 0.8196079, 1,
-0.07436503, -1.961879, -5.032673, 0, 1, 0.827451, 1,
-0.07189236, 0.1971284, 0.6876958, 0, 1, 0.8313726, 1,
-0.06875888, 1.332966, 1.768708, 0, 1, 0.8392157, 1,
-0.06767158, -0.1092627, -1.936265, 0, 1, 0.8431373, 1,
-0.06672309, -1.053759, -3.917663, 0, 1, 0.8509804, 1,
-0.06483742, 0.7848036, -0.0967582, 0, 1, 0.854902, 1,
-0.06332789, -0.5067174, -3.161712, 0, 1, 0.8627451, 1,
-0.0597196, 1.997313, -0.9441029, 0, 1, 0.8666667, 1,
-0.0586784, 0.6536321, -0.592463, 0, 1, 0.8745098, 1,
-0.05351047, 1.414418, 0.5554467, 0, 1, 0.8784314, 1,
-0.05244529, -1.350536, -3.341447, 0, 1, 0.8862745, 1,
-0.05215194, -0.4380207, -2.969651, 0, 1, 0.8901961, 1,
-0.0480505, -1.215871, -1.93599, 0, 1, 0.8980392, 1,
-0.04430583, -1.044315, -3.93099, 0, 1, 0.9058824, 1,
-0.04379085, 0.5730022, -0.08409923, 0, 1, 0.9098039, 1,
-0.04273525, 0.06891993, 0.9601439, 0, 1, 0.9176471, 1,
-0.04120303, -0.6005664, -2.12928, 0, 1, 0.9215686, 1,
-0.04089753, 0.3118745, 0.277846, 0, 1, 0.9294118, 1,
-0.04063278, 0.07752189, 0.7687232, 0, 1, 0.9333333, 1,
-0.03034926, 0.8418685, 0.7844929, 0, 1, 0.9411765, 1,
-0.01978188, 1.291661, -1.475971, 0, 1, 0.945098, 1,
-0.01797408, -0.8470325, -5.838561, 0, 1, 0.9529412, 1,
-0.01434957, 1.162239, -0.5922738, 0, 1, 0.9568627, 1,
-0.01416798, -0.2412726, -2.875899, 0, 1, 0.9647059, 1,
-0.01316224, 1.151301, 0.6067727, 0, 1, 0.9686275, 1,
-0.009996941, 0.8716457, 1.684672, 0, 1, 0.9764706, 1,
-0.007257592, -0.005254501, -1.062472, 0, 1, 0.9803922, 1,
-0.00685942, -0.9588277, -3.068045, 0, 1, 0.9882353, 1,
-0.004356379, 0.7346632, 1.228018, 0, 1, 0.9921569, 1,
-0.003092438, 1.75933, 1.048651, 0, 1, 1, 1,
0.003473094, -0.782631, 3.427801, 0, 0.9921569, 1, 1,
0.004739057, -1.631846, 3.778068, 0, 0.9882353, 1, 1,
0.005874012, 0.1229287, -0.549714, 0, 0.9803922, 1, 1,
0.007969914, -0.5558286, 2.42822, 0, 0.9764706, 1, 1,
0.008141995, 1.973486, 2.684023, 0, 0.9686275, 1, 1,
0.008683953, 0.8386758, -0.2599851, 0, 0.9647059, 1, 1,
0.01014925, 0.9619223, 1.392548, 0, 0.9568627, 1, 1,
0.01065197, -1.227286, 2.962093, 0, 0.9529412, 1, 1,
0.0110267, 1.814898, 0.009315143, 0, 0.945098, 1, 1,
0.01252217, -0.7321087, 2.743168, 0, 0.9411765, 1, 1,
0.01410261, 1.384634, -0.4403769, 0, 0.9333333, 1, 1,
0.01516468, -0.113039, 2.676358, 0, 0.9294118, 1, 1,
0.01691141, 0.2087066, 0.04157026, 0, 0.9215686, 1, 1,
0.01950674, 0.4067349, -0.08170476, 0, 0.9176471, 1, 1,
0.02032085, 1.953155, -0.2564925, 0, 0.9098039, 1, 1,
0.02077981, -1.489803, 5.369889, 0, 0.9058824, 1, 1,
0.02152037, 1.136224, -2.243751, 0, 0.8980392, 1, 1,
0.02238066, -0.8293053, 3.146582, 0, 0.8901961, 1, 1,
0.02381689, 1.460028, 0.5342348, 0, 0.8862745, 1, 1,
0.02774367, -0.6444536, 2.583561, 0, 0.8784314, 1, 1,
0.0278338, 0.6732649, 0.145856, 0, 0.8745098, 1, 1,
0.02908584, 0.738807, 0.3746375, 0, 0.8666667, 1, 1,
0.03472438, -1.067782, 2.366054, 0, 0.8627451, 1, 1,
0.03749494, 0.1893439, -0.6591809, 0, 0.854902, 1, 1,
0.03784752, -1.372208, 2.606429, 0, 0.8509804, 1, 1,
0.03787961, -0.9460613, 3.526536, 0, 0.8431373, 1, 1,
0.03935651, 0.3735104, 0.9098644, 0, 0.8392157, 1, 1,
0.03976341, 1.229158, -0.1076027, 0, 0.8313726, 1, 1,
0.04063947, 0.8083186, -0.9708853, 0, 0.827451, 1, 1,
0.04093083, 2.123623, -0.7868507, 0, 0.8196079, 1, 1,
0.04420709, -0.9247375, 2.827106, 0, 0.8156863, 1, 1,
0.04433659, -0.1996318, 3.667217, 0, 0.8078431, 1, 1,
0.04535426, 0.4699244, 0.3585832, 0, 0.8039216, 1, 1,
0.04930063, 0.04419407, 0.5508671, 0, 0.7960784, 1, 1,
0.04978439, 0.5056607, -0.0896453, 0, 0.7882353, 1, 1,
0.05064824, -0.6868485, 4.007503, 0, 0.7843137, 1, 1,
0.05333816, -0.9697559, 2.616567, 0, 0.7764706, 1, 1,
0.05639725, -1.149929, 3.96627, 0, 0.772549, 1, 1,
0.05647163, 0.4127859, -1.090049, 0, 0.7647059, 1, 1,
0.0565973, -1.165795, 5.356544, 0, 0.7607843, 1, 1,
0.06075188, -0.6152497, 3.921949, 0, 0.7529412, 1, 1,
0.06234309, 0.7443648, -0.4772934, 0, 0.7490196, 1, 1,
0.06261703, 0.1343852, -0.2208182, 0, 0.7411765, 1, 1,
0.06479535, 0.1299312, -0.4984285, 0, 0.7372549, 1, 1,
0.06539132, 0.9823781, 1.007373, 0, 0.7294118, 1, 1,
0.06659605, 1.218045, 1.298746, 0, 0.7254902, 1, 1,
0.06942817, -1.120634, 3.780453, 0, 0.7176471, 1, 1,
0.06981735, -0.956983, 0.942977, 0, 0.7137255, 1, 1,
0.07147461, 0.7636504, -2.446054, 0, 0.7058824, 1, 1,
0.07325921, -1.446894, 4.776625, 0, 0.6980392, 1, 1,
0.07401666, -0.2902859, 1.902647, 0, 0.6941177, 1, 1,
0.07926819, 0.9591758, 1.633365, 0, 0.6862745, 1, 1,
0.08086693, 0.5296344, 0.3634949, 0, 0.682353, 1, 1,
0.08422648, -1.311554, 3.014179, 0, 0.6745098, 1, 1,
0.08482775, -0.1968399, 3.60199, 0, 0.6705883, 1, 1,
0.0862894, 0.4475988, 0.4338384, 0, 0.6627451, 1, 1,
0.08686737, -0.1052513, 2.370195, 0, 0.6588235, 1, 1,
0.08892849, -0.05715723, 3.29793, 0, 0.6509804, 1, 1,
0.09063181, 0.5126851, -0.6282823, 0, 0.6470588, 1, 1,
0.09074197, 0.5391008, -2.508598, 0, 0.6392157, 1, 1,
0.09236981, 1.127065, 0.01271444, 0, 0.6352941, 1, 1,
0.09377362, 0.204786, 0.3284111, 0, 0.627451, 1, 1,
0.09555432, -0.7104735, 3.398517, 0, 0.6235294, 1, 1,
0.09700163, -0.00332052, 0.4698181, 0, 0.6156863, 1, 1,
0.09721462, -0.5560793, 3.223171, 0, 0.6117647, 1, 1,
0.09724513, -1.078668, 3.914935, 0, 0.6039216, 1, 1,
0.09742634, 0.805859, 0.5182958, 0, 0.5960785, 1, 1,
0.09820721, -1.741108, 2.136686, 0, 0.5921569, 1, 1,
0.09872586, -0.02471182, 0.9216993, 0, 0.5843138, 1, 1,
0.1088758, 0.8897222, -1.408701, 0, 0.5803922, 1, 1,
0.1105661, 1.07658, -1.663086, 0, 0.572549, 1, 1,
0.11109, 0.3876571, 1.125007, 0, 0.5686275, 1, 1,
0.1113598, 0.535284, 0.5048697, 0, 0.5607843, 1, 1,
0.1141104, 0.3835565, -0.03404395, 0, 0.5568628, 1, 1,
0.116921, 0.834315, -1.077547, 0, 0.5490196, 1, 1,
0.1175183, 2.181191, -0.3322043, 0, 0.5450981, 1, 1,
0.1180553, 1.731975, -1.53284, 0, 0.5372549, 1, 1,
0.1230488, -0.2308799, 0.9911492, 0, 0.5333334, 1, 1,
0.1235133, 0.1153411, 0.9756911, 0, 0.5254902, 1, 1,
0.127593, 1.139134, 0.2078598, 0, 0.5215687, 1, 1,
0.1285194, 1.373964, -0.6553054, 0, 0.5137255, 1, 1,
0.129858, 1.194144, -0.4767314, 0, 0.509804, 1, 1,
0.1326055, 1.918805, -0.8801858, 0, 0.5019608, 1, 1,
0.1366099, -1.003821, 4.270226, 0, 0.4941176, 1, 1,
0.1411039, -1.379807, 3.559672, 0, 0.4901961, 1, 1,
0.1460565, 1.556383, -0.3745706, 0, 0.4823529, 1, 1,
0.1468288, 0.8623542, 0.7326708, 0, 0.4784314, 1, 1,
0.1535219, -0.7928495, 2.221986, 0, 0.4705882, 1, 1,
0.1563001, 1.455886, -0.4188806, 0, 0.4666667, 1, 1,
0.1567737, 0.5266768, 1.742474, 0, 0.4588235, 1, 1,
0.1568587, -1.304686, 3.957474, 0, 0.454902, 1, 1,
0.1596035, 0.4307824, -0.4573497, 0, 0.4470588, 1, 1,
0.1617076, -0.4793926, 2.203053, 0, 0.4431373, 1, 1,
0.163308, -0.5521071, 5.537104, 0, 0.4352941, 1, 1,
0.1685475, -0.6043997, 1.61015, 0, 0.4313726, 1, 1,
0.1728877, -0.7157449, 4.261186, 0, 0.4235294, 1, 1,
0.1793349, 0.6558105, -1.177021, 0, 0.4196078, 1, 1,
0.1820598, 1.187253, -1.546829, 0, 0.4117647, 1, 1,
0.1861063, 0.279965, 2.76948, 0, 0.4078431, 1, 1,
0.1869869, 1.432595, 1.092362, 0, 0.4, 1, 1,
0.1876534, -0.7553287, 4.216878, 0, 0.3921569, 1, 1,
0.188684, -0.8708276, 4.296306, 0, 0.3882353, 1, 1,
0.1919265, 1.659172, 0.7605861, 0, 0.3803922, 1, 1,
0.1927235, -0.639518, 4.098111, 0, 0.3764706, 1, 1,
0.1979281, 0.8064239, 0.2166355, 0, 0.3686275, 1, 1,
0.1993884, -2.446165, 3.737156, 0, 0.3647059, 1, 1,
0.2064191, -0.9932601, 2.081527, 0, 0.3568628, 1, 1,
0.2101693, -1.813424, 3.734782, 0, 0.3529412, 1, 1,
0.2180609, -0.5164329, 2.838071, 0, 0.345098, 1, 1,
0.2205987, 0.9600915, -0.9221573, 0, 0.3411765, 1, 1,
0.222573, -0.1451197, 2.59838, 0, 0.3333333, 1, 1,
0.2316043, 0.8139908, 0.4917233, 0, 0.3294118, 1, 1,
0.23187, 0.7819589, -0.09134018, 0, 0.3215686, 1, 1,
0.2429304, 0.3659918, 1.954302, 0, 0.3176471, 1, 1,
0.2437777, 0.6953233, 0.09875561, 0, 0.3098039, 1, 1,
0.2466788, 0.1268725, 2.503896, 0, 0.3058824, 1, 1,
0.2471913, -0.2701459, 1.414753, 0, 0.2980392, 1, 1,
0.2491294, -0.2471541, 3.893425, 0, 0.2901961, 1, 1,
0.2529201, -0.6847675, 2.851353, 0, 0.2862745, 1, 1,
0.2587569, 0.3789645, 0.5057502, 0, 0.2784314, 1, 1,
0.2606616, 0.8273756, -0.3451693, 0, 0.2745098, 1, 1,
0.2610824, -0.07708153, 1.097416, 0, 0.2666667, 1, 1,
0.2656312, -0.2168333, 2.6027, 0, 0.2627451, 1, 1,
0.2746946, -0.1377638, 3.529173, 0, 0.254902, 1, 1,
0.2751163, 1.257102, 0.04791401, 0, 0.2509804, 1, 1,
0.2760891, -0.1738457, 3.052881, 0, 0.2431373, 1, 1,
0.2765197, 0.2411808, 0.4358769, 0, 0.2392157, 1, 1,
0.2777704, -0.3352036, 2.076806, 0, 0.2313726, 1, 1,
0.2808977, -0.3424114, 2.095662, 0, 0.227451, 1, 1,
0.2811897, 0.5284283, 0.610002, 0, 0.2196078, 1, 1,
0.2816427, -0.6468217, 4.922153, 0, 0.2156863, 1, 1,
0.2831089, 0.4345126, 0.9937808, 0, 0.2078431, 1, 1,
0.290332, 0.9306693, 0.1115028, 0, 0.2039216, 1, 1,
0.3036191, 0.4055893, 1.77522, 0, 0.1960784, 1, 1,
0.3047562, 0.911472, -1.019856, 0, 0.1882353, 1, 1,
0.3062649, 0.7967336, 1.452285, 0, 0.1843137, 1, 1,
0.3080425, -0.5779285, 1.740311, 0, 0.1764706, 1, 1,
0.3094034, 0.4497131, 0.4470131, 0, 0.172549, 1, 1,
0.3125719, 1.378985, 1.380907, 0, 0.1647059, 1, 1,
0.3127006, 0.1540187, 0.7746896, 0, 0.1607843, 1, 1,
0.3130237, -0.8052822, 3.312074, 0, 0.1529412, 1, 1,
0.3163288, -1.006063, 3.412842, 0, 0.1490196, 1, 1,
0.3196609, -0.4368653, 2.071492, 0, 0.1411765, 1, 1,
0.3206113, 0.2089768, 2.874321, 0, 0.1372549, 1, 1,
0.3252484, -0.8944795, 2.155204, 0, 0.1294118, 1, 1,
0.3269854, 2.161792, -1.788571, 0, 0.1254902, 1, 1,
0.3273198, 2.838192, -1.174667, 0, 0.1176471, 1, 1,
0.3425911, 1.441637, 0.4062996, 0, 0.1137255, 1, 1,
0.345026, -0.3040373, 1.280935, 0, 0.1058824, 1, 1,
0.3496915, 0.5592028, 1.811169, 0, 0.09803922, 1, 1,
0.3535112, -1.067925, 2.256296, 0, 0.09411765, 1, 1,
0.3545823, -1.796491, 3.808674, 0, 0.08627451, 1, 1,
0.3579497, -2.344372, 1.594575, 0, 0.08235294, 1, 1,
0.3594966, 0.06785084, 1.24729, 0, 0.07450981, 1, 1,
0.3664827, -0.6834561, 1.748137, 0, 0.07058824, 1, 1,
0.3681997, 0.3525205, -0.5102808, 0, 0.0627451, 1, 1,
0.3747842, -0.2380906, 1.148394, 0, 0.05882353, 1, 1,
0.3795153, 0.2019314, 0.9386606, 0, 0.05098039, 1, 1,
0.3808995, -0.6547555, 3.54359, 0, 0.04705882, 1, 1,
0.3813116, -2.498246, 3.330178, 0, 0.03921569, 1, 1,
0.3822715, 1.423553, 1.013742, 0, 0.03529412, 1, 1,
0.3860821, -0.4730276, 1.422778, 0, 0.02745098, 1, 1,
0.3868742, -0.009132234, 0.4590398, 0, 0.02352941, 1, 1,
0.389538, -1.366812, 2.9976, 0, 0.01568628, 1, 1,
0.3930052, 1.193214, 0.6404803, 0, 0.01176471, 1, 1,
0.3932754, -0.9596601, 2.045465, 0, 0.003921569, 1, 1,
0.3972274, 0.9064049, 0.6375832, 0.003921569, 0, 1, 1,
0.3976234, 0.7236679, -0.7237064, 0.007843138, 0, 1, 1,
0.3987177, 0.4176138, -0.03778965, 0.01568628, 0, 1, 1,
0.4051204, 0.7675065, 0.1540294, 0.01960784, 0, 1, 1,
0.4068302, -0.8650132, 3.174665, 0.02745098, 0, 1, 1,
0.4092485, -0.7562908, 1.465241, 0.03137255, 0, 1, 1,
0.4114763, 0.2910884, 1.119494, 0.03921569, 0, 1, 1,
0.4131114, 0.4338886, 1.153712, 0.04313726, 0, 1, 1,
0.4136634, 1.058298, 0.1250987, 0.05098039, 0, 1, 1,
0.4150918, 0.4064113, 0.3042228, 0.05490196, 0, 1, 1,
0.4151642, 1.04882, 1.45996, 0.0627451, 0, 1, 1,
0.4153143, -0.07802325, 0.1673602, 0.06666667, 0, 1, 1,
0.4163614, 0.2971031, 0.02829312, 0.07450981, 0, 1, 1,
0.416874, -1.233284, 3.29664, 0.07843138, 0, 1, 1,
0.4193053, 0.2744546, 1.344463, 0.08627451, 0, 1, 1,
0.4211408, -1.295408, 3.349335, 0.09019608, 0, 1, 1,
0.427829, -0.8555405, 2.208257, 0.09803922, 0, 1, 1,
0.4281104, 0.220733, 1.45506, 0.1058824, 0, 1, 1,
0.4286478, -0.8395779, 1.47987, 0.1098039, 0, 1, 1,
0.4293803, -1.538423, 2.365231, 0.1176471, 0, 1, 1,
0.4302694, -0.6567415, 3.860953, 0.1215686, 0, 1, 1,
0.430427, 0.5116605, 0.4873534, 0.1294118, 0, 1, 1,
0.430626, -0.838972, 3.00895, 0.1333333, 0, 1, 1,
0.4315655, -2.323701, 2.124247, 0.1411765, 0, 1, 1,
0.4342196, -1.320617, 3.134588, 0.145098, 0, 1, 1,
0.4342292, 1.919258, -0.2308473, 0.1529412, 0, 1, 1,
0.4418381, 1.633867, 2.394443, 0.1568628, 0, 1, 1,
0.4456349, 1.8086, 0.4858501, 0.1647059, 0, 1, 1,
0.4582416, 0.4937267, -1.540692, 0.1686275, 0, 1, 1,
0.4590935, 1.769949, 1.842415, 0.1764706, 0, 1, 1,
0.4596762, 0.9291239, 0.8656095, 0.1803922, 0, 1, 1,
0.4599811, -0.9144495, 1.681981, 0.1882353, 0, 1, 1,
0.4626544, 0.7044813, 1.249593, 0.1921569, 0, 1, 1,
0.4632682, -0.458022, 1.821777, 0.2, 0, 1, 1,
0.4653235, -1.09341, 1.887383, 0.2078431, 0, 1, 1,
0.4660659, 0.6927119, 1.991692, 0.2117647, 0, 1, 1,
0.4666201, 0.6062453, -1.331328, 0.2196078, 0, 1, 1,
0.4676339, 0.3960443, 1.307496, 0.2235294, 0, 1, 1,
0.4680045, -1.426256, 1.488166, 0.2313726, 0, 1, 1,
0.4691213, 1.072015, 0.01905301, 0.2352941, 0, 1, 1,
0.4742174, 1.205744, 0.9523356, 0.2431373, 0, 1, 1,
0.479472, 0.08831531, 1.658796, 0.2470588, 0, 1, 1,
0.4810537, 0.1574443, 1.151841, 0.254902, 0, 1, 1,
0.4833501, 0.8538551, 1.536651, 0.2588235, 0, 1, 1,
0.4834738, -0.8317773, 2.839434, 0.2666667, 0, 1, 1,
0.4869547, -0.484363, 4.074525, 0.2705882, 0, 1, 1,
0.489152, -0.04885532, 2.520902, 0.2784314, 0, 1, 1,
0.4971178, 1.32163, -0.06375515, 0.282353, 0, 1, 1,
0.4995901, 2.380894, 1.019716, 0.2901961, 0, 1, 1,
0.5004407, 0.8972923, -0.8057438, 0.2941177, 0, 1, 1,
0.5019632, 0.4028875, 2.758191, 0.3019608, 0, 1, 1,
0.5153254, 1.21591, 0.9795309, 0.3098039, 0, 1, 1,
0.5218063, -0.6778563, 1.855637, 0.3137255, 0, 1, 1,
0.5244148, -1.532537, 1.918892, 0.3215686, 0, 1, 1,
0.5254003, -1.125451, 2.805761, 0.3254902, 0, 1, 1,
0.526353, -0.01544872, 1.030577, 0.3333333, 0, 1, 1,
0.5276635, -0.968706, 0.6839079, 0.3372549, 0, 1, 1,
0.528269, -0.3118627, 3.608895, 0.345098, 0, 1, 1,
0.5290409, -2.214965, 2.897519, 0.3490196, 0, 1, 1,
0.5293308, 0.7213069, 1.253832, 0.3568628, 0, 1, 1,
0.5311074, -0.3887163, 1.995378, 0.3607843, 0, 1, 1,
0.5380473, 0.715859, 1.402868, 0.3686275, 0, 1, 1,
0.5432385, -1.266649, 3.097272, 0.372549, 0, 1, 1,
0.5448301, 0.4079618, -0.4192895, 0.3803922, 0, 1, 1,
0.5584744, -1.018053, 2.77067, 0.3843137, 0, 1, 1,
0.5642389, -0.1288441, 0.8366198, 0.3921569, 0, 1, 1,
0.5700089, -0.2292638, 3.185422, 0.3960784, 0, 1, 1,
0.5718488, -0.5095001, 5.486999, 0.4039216, 0, 1, 1,
0.575088, 1.472456, 2.005181, 0.4117647, 0, 1, 1,
0.5753859, -0.5598937, 1.445815, 0.4156863, 0, 1, 1,
0.5768328, 0.3868963, 1.268969, 0.4235294, 0, 1, 1,
0.5790915, -0.5817888, 1.852089, 0.427451, 0, 1, 1,
0.5814679, 0.5676615, 1.485922, 0.4352941, 0, 1, 1,
0.5815324, 2.447023, -0.01294714, 0.4392157, 0, 1, 1,
0.5831546, 0.1209274, 0.9289324, 0.4470588, 0, 1, 1,
0.5840738, 0.2923353, 2.364839, 0.4509804, 0, 1, 1,
0.5862135, -0.8117451, 2.211307, 0.4588235, 0, 1, 1,
0.5867297, -0.7815606, 3.112892, 0.4627451, 0, 1, 1,
0.5903409, 0.8721325, 0.494891, 0.4705882, 0, 1, 1,
0.5955439, 2.605798, 0.5279254, 0.4745098, 0, 1, 1,
0.5993333, -0.4005097, 3.34675, 0.4823529, 0, 1, 1,
0.6001931, 2.022122, 0.3111803, 0.4862745, 0, 1, 1,
0.6039066, -0.1931268, 2.336765, 0.4941176, 0, 1, 1,
0.6042849, 0.206204, 0.6196622, 0.5019608, 0, 1, 1,
0.6044378, 0.3627354, -0.2991263, 0.5058824, 0, 1, 1,
0.6061739, 0.2673053, 1.840596, 0.5137255, 0, 1, 1,
0.6098766, -0.09866201, 1.827388, 0.5176471, 0, 1, 1,
0.6143723, 1.106957, 0.5695143, 0.5254902, 0, 1, 1,
0.6153808, -1.089056, 1.812061, 0.5294118, 0, 1, 1,
0.6196325, 1.639774, 2.269675, 0.5372549, 0, 1, 1,
0.6253417, 0.1528028, 2.297157, 0.5411765, 0, 1, 1,
0.630531, 0.3825173, 0.4148104, 0.5490196, 0, 1, 1,
0.6335748, 1.261936, -0.005714246, 0.5529412, 0, 1, 1,
0.633878, -1.584777, 1.990468, 0.5607843, 0, 1, 1,
0.6435223, -0.2717356, 2.031964, 0.5647059, 0, 1, 1,
0.6457586, 0.2747121, 1.255694, 0.572549, 0, 1, 1,
0.649628, -0.4189285, 0.8924687, 0.5764706, 0, 1, 1,
0.6496766, 1.388679, 0.6222304, 0.5843138, 0, 1, 1,
0.6526259, 0.5488668, 1.855682, 0.5882353, 0, 1, 1,
0.6566912, -0.9485725, 4.923478, 0.5960785, 0, 1, 1,
0.6591936, -0.52965, 1.850595, 0.6039216, 0, 1, 1,
0.6600333, 0.390013, 0.6705806, 0.6078432, 0, 1, 1,
0.6666393, 0.172767, 0.3274768, 0.6156863, 0, 1, 1,
0.6730076, -0.3546333, 1.648919, 0.6196079, 0, 1, 1,
0.6742254, -1.134706, 3.077143, 0.627451, 0, 1, 1,
0.6856695, -0.2058264, 2.207677, 0.6313726, 0, 1, 1,
0.6863887, -0.7890296, 3.024348, 0.6392157, 0, 1, 1,
0.6974081, 0.1737213, 1.368085, 0.6431373, 0, 1, 1,
0.699548, 0.3803032, 0.7781717, 0.6509804, 0, 1, 1,
0.7069719, 0.6652215, 0.9787293, 0.654902, 0, 1, 1,
0.7070289, -0.8097969, 0.847308, 0.6627451, 0, 1, 1,
0.7072474, -1.69467, 2.913412, 0.6666667, 0, 1, 1,
0.7156653, -0.6711194, 1.622391, 0.6745098, 0, 1, 1,
0.7162659, -0.001149747, 3.586926, 0.6784314, 0, 1, 1,
0.7205433, -1.450391, 2.295562, 0.6862745, 0, 1, 1,
0.7222148, 0.3300505, -1.038013, 0.6901961, 0, 1, 1,
0.7232501, 2.107031, -2.534225, 0.6980392, 0, 1, 1,
0.7237496, 1.034706, 1.36998, 0.7058824, 0, 1, 1,
0.7251046, 0.237347, 2.001232, 0.7098039, 0, 1, 1,
0.7273358, -2.499617, 3.151095, 0.7176471, 0, 1, 1,
0.7346271, 0.2521405, 0.3674546, 0.7215686, 0, 1, 1,
0.7394257, 0.9813862, 2.005826, 0.7294118, 0, 1, 1,
0.7454825, -0.4200422, 2.553827, 0.7333333, 0, 1, 1,
0.7458879, 0.2144456, -0.9074396, 0.7411765, 0, 1, 1,
0.7503958, 0.4204777, 0.004146372, 0.7450981, 0, 1, 1,
0.7508557, 0.5186945, -0.2089319, 0.7529412, 0, 1, 1,
0.7574298, 0.3553398, 0.1198892, 0.7568628, 0, 1, 1,
0.7616419, 0.7559404, 0.818539, 0.7647059, 0, 1, 1,
0.7638727, -0.3974743, 0.3605151, 0.7686275, 0, 1, 1,
0.7642139, 1.877409, 1.212627, 0.7764706, 0, 1, 1,
0.7648392, 1.483935, -0.02313414, 0.7803922, 0, 1, 1,
0.7662926, 0.437249, 0.4886087, 0.7882353, 0, 1, 1,
0.7714505, -0.5562022, 1.458845, 0.7921569, 0, 1, 1,
0.773972, 0.3877929, 0.5197411, 0.8, 0, 1, 1,
0.7742212, -0.06098408, 2.828885, 0.8078431, 0, 1, 1,
0.7747762, 0.05814971, 1.819254, 0.8117647, 0, 1, 1,
0.7755487, -0.1166756, 2.572435, 0.8196079, 0, 1, 1,
0.7798204, -0.2813123, 0.817095, 0.8235294, 0, 1, 1,
0.7802675, -0.08765596, 3.894616, 0.8313726, 0, 1, 1,
0.7838366, 0.4760506, 2.377152, 0.8352941, 0, 1, 1,
0.7859995, -1.384632, 2.102601, 0.8431373, 0, 1, 1,
0.7880651, -0.9290713, 3.666318, 0.8470588, 0, 1, 1,
0.7920931, 0.2928244, 2.288827, 0.854902, 0, 1, 1,
0.7925984, -2.077452, 3.457853, 0.8588235, 0, 1, 1,
0.8026363, -1.138052, 1.67408, 0.8666667, 0, 1, 1,
0.8133264, -0.7651886, 3.618287, 0.8705882, 0, 1, 1,
0.8143808, -1.818957, 2.723313, 0.8784314, 0, 1, 1,
0.8174016, 0.4623437, 1.632151, 0.8823529, 0, 1, 1,
0.8189507, -0.6556751, 2.034912, 0.8901961, 0, 1, 1,
0.8337694, 0.1499147, 1.316929, 0.8941177, 0, 1, 1,
0.835254, 0.8267127, 0.1785736, 0.9019608, 0, 1, 1,
0.8361367, 0.3495727, 2.362792, 0.9098039, 0, 1, 1,
0.8376208, -0.2442812, 1.103857, 0.9137255, 0, 1, 1,
0.8426955, 1.919958, 0.5135738, 0.9215686, 0, 1, 1,
0.8465615, 0.8014079, 0.4498138, 0.9254902, 0, 1, 1,
0.8542536, -0.6863292, 2.678371, 0.9333333, 0, 1, 1,
0.8558526, 0.6462663, -0.9814519, 0.9372549, 0, 1, 1,
0.8688968, -0.1717044, 1.955988, 0.945098, 0, 1, 1,
0.8704177, -0.6621875, 3.287153, 0.9490196, 0, 1, 1,
0.8714585, 1.343964, -1.553453, 0.9568627, 0, 1, 1,
0.8727894, 0.8460659, 0.05922782, 0.9607843, 0, 1, 1,
0.8746883, 0.4960659, 0.8749477, 0.9686275, 0, 1, 1,
0.8781081, -1.232579, 2.076445, 0.972549, 0, 1, 1,
0.8831802, -1.811155, 4.437168, 0.9803922, 0, 1, 1,
0.8868024, -0.5200893, 2.208846, 0.9843137, 0, 1, 1,
0.8951753, -0.8437445, 1.365111, 0.9921569, 0, 1, 1,
0.9020767, 1.936413, 0.9323688, 0.9960784, 0, 1, 1,
0.9022564, 0.3371991, 1.180653, 1, 0, 0.9960784, 1,
0.9029095, -0.205847, 2.072847, 1, 0, 0.9882353, 1,
0.905624, 1.403416, -0.4254143, 1, 0, 0.9843137, 1,
0.9098476, 0.5855266, 1.236151, 1, 0, 0.9764706, 1,
0.9102935, 0.6251745, 0.7530105, 1, 0, 0.972549, 1,
0.9112868, 1.712924, 2.400806, 1, 0, 0.9647059, 1,
0.9130903, -0.4825494, 1.325393, 1, 0, 0.9607843, 1,
0.9141641, 0.1019055, 1.366058, 1, 0, 0.9529412, 1,
0.9167344, -1.110784, 1.769552, 1, 0, 0.9490196, 1,
0.9189735, -0.4320459, 0.3216048, 1, 0, 0.9411765, 1,
0.9319872, -0.223125, 1.092535, 1, 0, 0.9372549, 1,
0.9391741, -1.202787, 1.281188, 1, 0, 0.9294118, 1,
0.939437, -0.3331032, 3.773446, 1, 0, 0.9254902, 1,
0.943162, -0.469985, 3.439144, 1, 0, 0.9176471, 1,
0.9434779, 0.5003849, -0.1184947, 1, 0, 0.9137255, 1,
0.9493374, 0.5311, 2.801993, 1, 0, 0.9058824, 1,
0.9501798, 0.2184345, 1.989814, 1, 0, 0.9019608, 1,
0.9527277, -1.332754, 0.8678678, 1, 0, 0.8941177, 1,
0.9534796, 0.3474126, 1.253403, 1, 0, 0.8862745, 1,
0.956252, 0.9711727, 1.338353, 1, 0, 0.8823529, 1,
0.9604701, 0.5381501, 1.01002, 1, 0, 0.8745098, 1,
0.9617724, -0.4649822, 2.138021, 1, 0, 0.8705882, 1,
0.9708252, -1.407672, 0.7887869, 1, 0, 0.8627451, 1,
0.9780398, 1.030756, 0.1884588, 1, 0, 0.8588235, 1,
0.989372, -1.252371, 3.240754, 1, 0, 0.8509804, 1,
0.9903588, -0.02951947, 0.9426743, 1, 0, 0.8470588, 1,
0.9942662, -0.04911548, 0.8677551, 1, 0, 0.8392157, 1,
0.9981456, 1.046886, 0.6798517, 1, 0, 0.8352941, 1,
1.006665, -0.4767225, 1.808895, 1, 0, 0.827451, 1,
1.011561, -0.4660103, 0.09990043, 1, 0, 0.8235294, 1,
1.02413, -0.1104105, 1.466651, 1, 0, 0.8156863, 1,
1.025151, -1.965521, 3.110008, 1, 0, 0.8117647, 1,
1.02538, 0.2589334, 1.307532, 1, 0, 0.8039216, 1,
1.031709, -0.6390938, 3.259361, 1, 0, 0.7960784, 1,
1.031837, 1.372226, 0.1768276, 1, 0, 0.7921569, 1,
1.042579, 0.555058, 1.065794, 1, 0, 0.7843137, 1,
1.04518, 0.3475677, -0.001697773, 1, 0, 0.7803922, 1,
1.045739, -0.4243107, 1.659397, 1, 0, 0.772549, 1,
1.047553, -0.232006, 1.877209, 1, 0, 0.7686275, 1,
1.049551, -0.4114944, 1.878453, 1, 0, 0.7607843, 1,
1.056243, 0.06080554, 1.038216, 1, 0, 0.7568628, 1,
1.05787, -0.227704, 3.855412, 1, 0, 0.7490196, 1,
1.079728, 0.6718608, 0.9705715, 1, 0, 0.7450981, 1,
1.088958, -1.595369, 4.09745, 1, 0, 0.7372549, 1,
1.090768, -0.4074787, 3.152515, 1, 0, 0.7333333, 1,
1.09356, 1.002391, 1.437761, 1, 0, 0.7254902, 1,
1.119768, 0.3256644, 0.7763813, 1, 0, 0.7215686, 1,
1.121276, -1.946878, 2.136369, 1, 0, 0.7137255, 1,
1.123932, 1.772471, -1.047491, 1, 0, 0.7098039, 1,
1.133621, -0.0570882, 0.1175041, 1, 0, 0.7019608, 1,
1.143013, -1.202519, 0.7635928, 1, 0, 0.6941177, 1,
1.143113, -0.713083, 1.24919, 1, 0, 0.6901961, 1,
1.153058, 0.05516496, 2.808468, 1, 0, 0.682353, 1,
1.159576, 1.018883, 0.9954427, 1, 0, 0.6784314, 1,
1.163364, -1.619841, 2.232746, 1, 0, 0.6705883, 1,
1.164682, -1.080368, 4.183258, 1, 0, 0.6666667, 1,
1.172272, -1.423414, 3.998867, 1, 0, 0.6588235, 1,
1.193421, -0.7495131, 3.435479, 1, 0, 0.654902, 1,
1.203116, -1.308437, 1.406185, 1, 0, 0.6470588, 1,
1.213186, 0.41118, 1.679296, 1, 0, 0.6431373, 1,
1.21601, -0.4162151, 1.661716, 1, 0, 0.6352941, 1,
1.220527, 2.277926, 0.3542501, 1, 0, 0.6313726, 1,
1.221557, -0.4573169, 3.278094, 1, 0, 0.6235294, 1,
1.223829, -0.2914551, 0.6688961, 1, 0, 0.6196079, 1,
1.225735, 1.559605, 1.482001, 1, 0, 0.6117647, 1,
1.231069, 0.5782616, -0.4851953, 1, 0, 0.6078432, 1,
1.232008, 0.3418635, 0.8477309, 1, 0, 0.6, 1,
1.235901, -0.8588547, 1.472676, 1, 0, 0.5921569, 1,
1.238813, -0.9454972, 2.564729, 1, 0, 0.5882353, 1,
1.23967, -0.5471382, 1.517225, 1, 0, 0.5803922, 1,
1.244891, -0.06306058, 1.56577, 1, 0, 0.5764706, 1,
1.25003, -0.1172399, 1.350716, 1, 0, 0.5686275, 1,
1.25242, -0.9037464, 3.160134, 1, 0, 0.5647059, 1,
1.255065, -0.6399006, 1.526001, 1, 0, 0.5568628, 1,
1.264523, 1.987381, 0.6758196, 1, 0, 0.5529412, 1,
1.272172, 1.121222, -0.1347768, 1, 0, 0.5450981, 1,
1.275449, -0.3921887, 1.787326, 1, 0, 0.5411765, 1,
1.287824, -0.06748085, 2.143378, 1, 0, 0.5333334, 1,
1.307953, 0.115044, 3.094572, 1, 0, 0.5294118, 1,
1.322247, -0.2620213, 2.252781, 1, 0, 0.5215687, 1,
1.3228, -1.401845, 0.644905, 1, 0, 0.5176471, 1,
1.329015, -0.9688398, 2.527798, 1, 0, 0.509804, 1,
1.330943, -1.907467, 1.62778, 1, 0, 0.5058824, 1,
1.351257, 0.5326648, 1.455929, 1, 0, 0.4980392, 1,
1.369088, 1.061758, 2.052646, 1, 0, 0.4901961, 1,
1.373195, 0.6624313, 0.9289771, 1, 0, 0.4862745, 1,
1.37739, -0.4713384, 2.998306, 1, 0, 0.4784314, 1,
1.384606, 1.580867, 0.1199882, 1, 0, 0.4745098, 1,
1.386143, -1.342852, 0.4175568, 1, 0, 0.4666667, 1,
1.401099, 1.91127, 0.04454046, 1, 0, 0.4627451, 1,
1.401608, -0.140249, 1.325049, 1, 0, 0.454902, 1,
1.407491, -0.7942522, 2.872242, 1, 0, 0.4509804, 1,
1.407901, 1.119636, 1.09839, 1, 0, 0.4431373, 1,
1.410166, 0.284503, 2.349528, 1, 0, 0.4392157, 1,
1.413576, 0.34719, 1.342794, 1, 0, 0.4313726, 1,
1.425428, 2.527977, 1.31928, 1, 0, 0.427451, 1,
1.433528, -0.2233739, 1.655949, 1, 0, 0.4196078, 1,
1.44173, 0.7339405, 2.807858, 1, 0, 0.4156863, 1,
1.447037, -1.704934, 4.035491, 1, 0, 0.4078431, 1,
1.455496, 2.137577, 0.7685448, 1, 0, 0.4039216, 1,
1.457488, -1.41564, 1.867239, 1, 0, 0.3960784, 1,
1.472561, 1.696961, 1.370103, 1, 0, 0.3882353, 1,
1.483313, 0.452593, 1.484592, 1, 0, 0.3843137, 1,
1.485082, 0.3781646, 0.4453324, 1, 0, 0.3764706, 1,
1.494594, -0.6564295, 2.215637, 1, 0, 0.372549, 1,
1.516335, -1.052353, 1.017647, 1, 0, 0.3647059, 1,
1.518598, -1.290584, 2.150809, 1, 0, 0.3607843, 1,
1.52911, -1.319495, 3.823955, 1, 0, 0.3529412, 1,
1.548106, -0.00372424, 1.845724, 1, 0, 0.3490196, 1,
1.556949, 1.498409, 0.7569212, 1, 0, 0.3411765, 1,
1.558097, 0.07344575, 2.02057, 1, 0, 0.3372549, 1,
1.575289, 0.7434798, 0.8185596, 1, 0, 0.3294118, 1,
1.589115, -0.7631727, 1.510723, 1, 0, 0.3254902, 1,
1.599537, -1.043033, 2.135377, 1, 0, 0.3176471, 1,
1.610982, -0.0120663, 1.89107, 1, 0, 0.3137255, 1,
1.625193, -0.0936643, 1.660695, 1, 0, 0.3058824, 1,
1.650174, 0.5562676, 2.185706, 1, 0, 0.2980392, 1,
1.654432, 0.425653, 1.071856, 1, 0, 0.2941177, 1,
1.656474, -0.2668595, 0.3512227, 1, 0, 0.2862745, 1,
1.65712, 1.483978, 0.4629596, 1, 0, 0.282353, 1,
1.665707, 1.686786, 1.175615, 1, 0, 0.2745098, 1,
1.666779, -1.451885, 0.6580383, 1, 0, 0.2705882, 1,
1.674125, 1.224806, 2.121097, 1, 0, 0.2627451, 1,
1.690011, 0.4425982, -0.5623299, 1, 0, 0.2588235, 1,
1.714779, -0.7793227, 1.017494, 1, 0, 0.2509804, 1,
1.716423, 0.1950423, 3.120208, 1, 0, 0.2470588, 1,
1.721234, 1.523716, 1.111417, 1, 0, 0.2392157, 1,
1.727829, -1.353205, 2.833133, 1, 0, 0.2352941, 1,
1.758011, 1.527249, 2.431607, 1, 0, 0.227451, 1,
1.764129, 1.255872, 0.9151934, 1, 0, 0.2235294, 1,
1.765052, -0.7004755, 0.9220865, 1, 0, 0.2156863, 1,
1.77695, -1.463795, 2.545886, 1, 0, 0.2117647, 1,
1.793082, 0.6513568, 1.418529, 1, 0, 0.2039216, 1,
1.795895, 0.2175943, 0.14148, 1, 0, 0.1960784, 1,
1.81023, -0.7546886, 1.292539, 1, 0, 0.1921569, 1,
1.810893, 0.1851326, 1.361331, 1, 0, 0.1843137, 1,
1.825966, 0.2642697, 0.7500483, 1, 0, 0.1803922, 1,
1.836607, -1.145964, 1.786821, 1, 0, 0.172549, 1,
1.859863, -1.307429, 3.641113, 1, 0, 0.1686275, 1,
1.863006, -0.416349, 1.647039, 1, 0, 0.1607843, 1,
1.876312, -0.1296275, 0.50261, 1, 0, 0.1568628, 1,
1.892296, 1.694391, -0.541886, 1, 0, 0.1490196, 1,
1.949699, -0.6425695, -0.06244904, 1, 0, 0.145098, 1,
1.97274, 1.061263, -0.3454735, 1, 0, 0.1372549, 1,
1.984691, 0.4781998, -0.2488299, 1, 0, 0.1333333, 1,
2.011485, -1.780863, 1.992536, 1, 0, 0.1254902, 1,
2.039439, -0.2446862, 1.014624, 1, 0, 0.1215686, 1,
2.041536, -0.2214523, 2.199446, 1, 0, 0.1137255, 1,
2.100966, 0.1315607, -0.01412929, 1, 0, 0.1098039, 1,
2.146766, 1.077807, -0.5143805, 1, 0, 0.1019608, 1,
2.157917, -1.255772, 1.425123, 1, 0, 0.09411765, 1,
2.203865, -1.238996, 3.546765, 1, 0, 0.09019608, 1,
2.23381, -0.2619952, 2.336403, 1, 0, 0.08235294, 1,
2.353926, 2.083426, 0.03665349, 1, 0, 0.07843138, 1,
2.376615, 2.348221, 0.01895639, 1, 0, 0.07058824, 1,
2.420037, -1.038612, 2.429853, 1, 0, 0.06666667, 1,
2.448208, 1.379768, 1.579046, 1, 0, 0.05882353, 1,
2.486318, 0.08199491, 1.62205, 1, 0, 0.05490196, 1,
2.498893, 1.400976, 0.5529125, 1, 0, 0.04705882, 1,
2.50728, -0.0876563, 1.545545, 1, 0, 0.04313726, 1,
2.510336, 1.570844, 2.852292, 1, 0, 0.03529412, 1,
2.562422, -0.232705, 1.053411, 1, 0, 0.03137255, 1,
2.844578, -0.3705526, 3.055516, 1, 0, 0.02352941, 1,
2.95925, 0.2673462, -0.3771864, 1, 0, 0.01960784, 1,
3.295203, 0.6804215, 1.408261, 1, 0, 0.01176471, 1,
3.322574, -0.8198217, 0.8089721, 1, 0, 0.007843138, 1
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
0.2877033, -4.138897, -7.766736, 0, -0.5, 0.5, 0.5,
0.2877033, -4.138897, -7.766736, 1, -0.5, 0.5, 0.5,
0.2877033, -4.138897, -7.766736, 1, 1.5, 0.5, 0.5,
0.2877033, -4.138897, -7.766736, 0, 1.5, 0.5, 0.5
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
-3.775989, 0.2059007, -7.766736, 0, -0.5, 0.5, 0.5,
-3.775989, 0.2059007, -7.766736, 1, -0.5, 0.5, 0.5,
-3.775989, 0.2059007, -7.766736, 1, 1.5, 0.5, 0.5,
-3.775989, 0.2059007, -7.766736, 0, 1.5, 0.5, 0.5
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
-3.775989, -4.138897, -0.1507285, 0, -0.5, 0.5, 0.5,
-3.775989, -4.138897, -0.1507285, 1, -0.5, 0.5, 0.5,
-3.775989, -4.138897, -0.1507285, 1, 1.5, 0.5, 0.5,
-3.775989, -4.138897, -0.1507285, 0, 1.5, 0.5, 0.5
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
-2, -3.136252, -6.009195,
3, -3.136252, -6.009195,
-2, -3.136252, -6.009195,
-2, -3.30336, -6.302119,
-1, -3.136252, -6.009195,
-1, -3.30336, -6.302119,
0, -3.136252, -6.009195,
0, -3.30336, -6.302119,
1, -3.136252, -6.009195,
1, -3.30336, -6.302119,
2, -3.136252, -6.009195,
2, -3.30336, -6.302119,
3, -3.136252, -6.009195,
3, -3.30336, -6.302119
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
-2, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
-2, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
-2, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
-2, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5,
-1, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
-1, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
-1, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
-1, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5,
0, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
0, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
0, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
0, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5,
1, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
1, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
1, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
1, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5,
2, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
2, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
2, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
2, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5,
3, -3.637575, -6.887966, 0, -0.5, 0.5, 0.5,
3, -3.637575, -6.887966, 1, -0.5, 0.5, 0.5,
3, -3.637575, -6.887966, 1, 1.5, 0.5, 0.5,
3, -3.637575, -6.887966, 0, 1.5, 0.5, 0.5
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
-2.838214, -3, -6.009195,
-2.838214, 3, -6.009195,
-2.838214, -3, -6.009195,
-2.99451, -3, -6.302119,
-2.838214, -2, -6.009195,
-2.99451, -2, -6.302119,
-2.838214, -1, -6.009195,
-2.99451, -1, -6.302119,
-2.838214, 0, -6.009195,
-2.99451, 0, -6.302119,
-2.838214, 1, -6.009195,
-2.99451, 1, -6.302119,
-2.838214, 2, -6.009195,
-2.99451, 2, -6.302119,
-2.838214, 3, -6.009195,
-2.99451, 3, -6.302119
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
-3.307101, -3, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, -3, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, -3, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, -3, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, -2, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, -2, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, -2, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, -2, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, -1, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, -1, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, -1, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, -1, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, 0, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, 0, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, 0, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, 0, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, 1, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, 1, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, 1, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, 1, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, 2, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, 2, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, 2, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, 2, -6.887966, 0, 1.5, 0.5, 0.5,
-3.307101, 3, -6.887966, 0, -0.5, 0.5, 0.5,
-3.307101, 3, -6.887966, 1, -0.5, 0.5, 0.5,
-3.307101, 3, -6.887966, 1, 1.5, 0.5, 0.5,
-3.307101, 3, -6.887966, 0, 1.5, 0.5, 0.5
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
-2.838214, -3.136252, -4,
-2.838214, -3.136252, 4,
-2.838214, -3.136252, -4,
-2.99451, -3.30336, -4,
-2.838214, -3.136252, -2,
-2.99451, -3.30336, -2,
-2.838214, -3.136252, 0,
-2.99451, -3.30336, 0,
-2.838214, -3.136252, 2,
-2.99451, -3.30336, 2,
-2.838214, -3.136252, 4,
-2.99451, -3.30336, 4
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
-3.307101, -3.637575, -4, 0, -0.5, 0.5, 0.5,
-3.307101, -3.637575, -4, 1, -0.5, 0.5, 0.5,
-3.307101, -3.637575, -4, 1, 1.5, 0.5, 0.5,
-3.307101, -3.637575, -4, 0, 1.5, 0.5, 0.5,
-3.307101, -3.637575, -2, 0, -0.5, 0.5, 0.5,
-3.307101, -3.637575, -2, 1, -0.5, 0.5, 0.5,
-3.307101, -3.637575, -2, 1, 1.5, 0.5, 0.5,
-3.307101, -3.637575, -2, 0, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 0, 0, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 0, 1, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 0, 1, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 0, 0, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 2, 0, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 2, 1, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 2, 1, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 2, 0, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 4, 0, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 4, 1, -0.5, 0.5, 0.5,
-3.307101, -3.637575, 4, 1, 1.5, 0.5, 0.5,
-3.307101, -3.637575, 4, 0, 1.5, 0.5, 0.5
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
-2.838214, -3.136252, -6.009195,
-2.838214, 3.548053, -6.009195,
-2.838214, -3.136252, 5.707738,
-2.838214, 3.548053, 5.707738,
-2.838214, -3.136252, -6.009195,
-2.838214, -3.136252, 5.707738,
-2.838214, 3.548053, -6.009195,
-2.838214, 3.548053, 5.707738,
-2.838214, -3.136252, -6.009195,
3.41362, -3.136252, -6.009195,
-2.838214, -3.136252, 5.707738,
3.41362, -3.136252, 5.707738,
-2.838214, 3.548053, -6.009195,
3.41362, 3.548053, -6.009195,
-2.838214, 3.548053, 5.707738,
3.41362, 3.548053, 5.707738,
3.41362, -3.136252, -6.009195,
3.41362, 3.548053, -6.009195,
3.41362, -3.136252, 5.707738,
3.41362, 3.548053, 5.707738,
3.41362, -3.136252, -6.009195,
3.41362, -3.136252, 5.707738,
3.41362, 3.548053, -6.009195,
3.41362, 3.548053, 5.707738
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
var radius = 7.939124;
var distance = 35.32206;
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
mvMatrix.translate( -0.2877033, -0.2059007, 0.1507285 );
mvMatrix.scale( 1.373027, 1.284193, 0.7326095 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.32206);
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
Aldrin<-read.table("Aldrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Aldrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Aldrin' not found
```

```r
y<-Aldrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Aldrin' not found
```

```r
z<-Aldrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Aldrin' not found
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
-2.747168, -0.2144072, -0.6489664, 0, 0, 1, 1, 1,
-2.744833, 0.889578, -3.023469, 1, 0, 0, 1, 1,
-2.669319, -0.01160515, -1.808109, 1, 0, 0, 1, 1,
-2.462776, -1.257695, -1.705969, 1, 0, 0, 1, 1,
-2.441175, -0.9836099, -1.097305, 1, 0, 0, 1, 1,
-2.430707, 0.9474411, -1.139679, 1, 0, 0, 1, 1,
-2.389842, -0.3186904, -0.06581517, 0, 0, 0, 1, 1,
-2.38635, 0.6554472, -1.506309, 0, 0, 0, 1, 1,
-2.34086, -1.879368, -1.373296, 0, 0, 0, 1, 1,
-2.296575, -0.9166836, -3.555119, 0, 0, 0, 1, 1,
-2.276496, -1.243434, -0.4189999, 0, 0, 0, 1, 1,
-2.266929, 0.5811819, -2.674083, 0, 0, 0, 1, 1,
-2.223649, 0.1241229, -0.6461385, 0, 0, 0, 1, 1,
-2.202584, -0.8578367, -1.974401, 1, 1, 1, 1, 1,
-2.191142, -1.556405, -2.29359, 1, 1, 1, 1, 1,
-2.148288, 1.22734, 0.5948895, 1, 1, 1, 1, 1,
-2.053921, 0.9095073, -1.697237, 1, 1, 1, 1, 1,
-2.051108, -1.116436, -2.148167, 1, 1, 1, 1, 1,
-2.049925, 1.54261, 0.1905656, 1, 1, 1, 1, 1,
-2.037575, -0.4302838, -1.007306, 1, 1, 1, 1, 1,
-2.033291, 0.1586061, -1.924029, 1, 1, 1, 1, 1,
-2.027373, 0.2050942, -1.059186, 1, 1, 1, 1, 1,
-1.995948, -1.096479, 0.4740669, 1, 1, 1, 1, 1,
-1.971743, 1.19697, -2.317268, 1, 1, 1, 1, 1,
-1.939927, 0.561807, -0.1251522, 1, 1, 1, 1, 1,
-1.932965, 0.6013699, -1.824453, 1, 1, 1, 1, 1,
-1.90942, -0.3554224, -1.190682, 1, 1, 1, 1, 1,
-1.840209, -0.2674095, -3.081741, 1, 1, 1, 1, 1,
-1.816064, 0.9045473, -1.763633, 0, 0, 1, 1, 1,
-1.811021, 0.4722703, -0.08284571, 1, 0, 0, 1, 1,
-1.786685, 0.5760311, 0.2048886, 1, 0, 0, 1, 1,
-1.77905, -0.508835, -3.339944, 1, 0, 0, 1, 1,
-1.762192, 0.7309952, -2.191879, 1, 0, 0, 1, 1,
-1.762114, -0.6608994, -0.7027756, 1, 0, 0, 1, 1,
-1.75229, -0.8053378, -2.240439, 0, 0, 0, 1, 1,
-1.722417, -1.971639, -1.621669, 0, 0, 0, 1, 1,
-1.719851, 2.101484, -1.641574, 0, 0, 0, 1, 1,
-1.718969, 0.3532382, -1.970821, 0, 0, 0, 1, 1,
-1.718131, 1.096538, -1.11823, 0, 0, 0, 1, 1,
-1.685355, -1.544546, -1.026947, 0, 0, 0, 1, 1,
-1.681864, 0.4834503, -1.001141, 0, 0, 0, 1, 1,
-1.676998, 0.128384, -0.5253915, 1, 1, 1, 1, 1,
-1.673434, 2.539373, 1.186597, 1, 1, 1, 1, 1,
-1.655421, 2.014931, 0.5855613, 1, 1, 1, 1, 1,
-1.652977, 0.2859184, -1.183443, 1, 1, 1, 1, 1,
-1.651017, 1.398517, -0.1766413, 1, 1, 1, 1, 1,
-1.650089, 0.1402539, -0.8823751, 1, 1, 1, 1, 1,
-1.619235, 0.5257504, -0.6353186, 1, 1, 1, 1, 1,
-1.605935, 1.382923, 0.02696538, 1, 1, 1, 1, 1,
-1.597668, -0.4146363, -2.017704, 1, 1, 1, 1, 1,
-1.597268, 1.442964, -1.607221, 1, 1, 1, 1, 1,
-1.593358, 0.2813845, -2.284468, 1, 1, 1, 1, 1,
-1.579392, -2.685784, -0.6033557, 1, 1, 1, 1, 1,
-1.56949, 0.08259087, -0.2564322, 1, 1, 1, 1, 1,
-1.569363, -0.6646442, -2.530745, 1, 1, 1, 1, 1,
-1.561984, 0.808024, -1.722794, 1, 1, 1, 1, 1,
-1.542787, -2.137092, -1.604604, 0, 0, 1, 1, 1,
-1.534011, 0.0305929, -1.921903, 1, 0, 0, 1, 1,
-1.522339, -0.3003031, -1.071127, 1, 0, 0, 1, 1,
-1.516343, -0.7172794, -0.716152, 1, 0, 0, 1, 1,
-1.512997, -1.017565, -1.597259, 1, 0, 0, 1, 1,
-1.507813, 1.334113, -0.6648527, 1, 0, 0, 1, 1,
-1.500079, 2.283974, -1.597263, 0, 0, 0, 1, 1,
-1.479901, -0.9575257, -1.052619, 0, 0, 0, 1, 1,
-1.478657, -0.4106553, -1.830732, 0, 0, 0, 1, 1,
-1.472876, -0.618602, -1.479051, 0, 0, 0, 1, 1,
-1.462363, -0.1747672, -3.541637, 0, 0, 0, 1, 1,
-1.442284, 0.6277422, -2.028286, 0, 0, 0, 1, 1,
-1.437066, -1.562525, -1.864717, 0, 0, 0, 1, 1,
-1.427215, 0.2185558, -1.690078, 1, 1, 1, 1, 1,
-1.42404, 0.1381325, 0.055651, 1, 1, 1, 1, 1,
-1.423656, 0.7032899, -0.8597073, 1, 1, 1, 1, 1,
-1.419469, -0.3281609, -1.498713, 1, 1, 1, 1, 1,
-1.408064, -0.02583571, -2.173368, 1, 1, 1, 1, 1,
-1.407695, -0.09716919, -0.7223532, 1, 1, 1, 1, 1,
-1.399885, 0.1147161, -0.9847353, 1, 1, 1, 1, 1,
-1.396884, 1.058299, -1.312999, 1, 1, 1, 1, 1,
-1.39518, 1.603416, 0.01047877, 1, 1, 1, 1, 1,
-1.394388, -1.306154, -2.737208, 1, 1, 1, 1, 1,
-1.392902, -0.1349854, -1.482142, 1, 1, 1, 1, 1,
-1.38604, 0.5849091, -2.035611, 1, 1, 1, 1, 1,
-1.372856, 1.797132, -0.5884362, 1, 1, 1, 1, 1,
-1.367674, 1.165274, -0.1487222, 1, 1, 1, 1, 1,
-1.364718, 1.145861, 0.01025499, 1, 1, 1, 1, 1,
-1.359947, 3.450709, 1.217176, 0, 0, 1, 1, 1,
-1.351966, 2.201239, -1.133973, 1, 0, 0, 1, 1,
-1.349602, 0.9873345, -1.202079, 1, 0, 0, 1, 1,
-1.342591, -1.751794, -3.570394, 1, 0, 0, 1, 1,
-1.34155, -0.6324136, -2.23022, 1, 0, 0, 1, 1,
-1.330176, -0.9433569, 0.08748151, 1, 0, 0, 1, 1,
-1.317801, 1.676176, -0.9108937, 0, 0, 0, 1, 1,
-1.31693, 0.6204724, -2.904684, 0, 0, 0, 1, 1,
-1.312047, -0.6869404, -1.742671, 0, 0, 0, 1, 1,
-1.310059, 1.396459, -0.416684, 0, 0, 0, 1, 1,
-1.308755, 1.778189, -1.174163, 0, 0, 0, 1, 1,
-1.30009, 0.03718126, -2.746781, 0, 0, 0, 1, 1,
-1.286821, 2.162948, -0.6988549, 0, 0, 0, 1, 1,
-1.281475, -0.2143678, -2.367573, 1, 1, 1, 1, 1,
-1.281008, -1.715798, -1.402436, 1, 1, 1, 1, 1,
-1.280408, 1.218032, -3.431037, 1, 1, 1, 1, 1,
-1.275619, 0.6089121, -1.879616, 1, 1, 1, 1, 1,
-1.268311, -0.4700148, -0.8220949, 1, 1, 1, 1, 1,
-1.258193, -0.5089441, -1.634094, 1, 1, 1, 1, 1,
-1.253845, -0.1793475, -2.922569, 1, 1, 1, 1, 1,
-1.25349, -0.3701719, -1.254029, 1, 1, 1, 1, 1,
-1.249219, -0.2764632, -2.398021, 1, 1, 1, 1, 1,
-1.244009, -0.349687, -0.6481447, 1, 1, 1, 1, 1,
-1.235918, -0.5948141, -1.737706, 1, 1, 1, 1, 1,
-1.224644, 1.395505, -1.4713, 1, 1, 1, 1, 1,
-1.223761, 1.472177, -0.8301033, 1, 1, 1, 1, 1,
-1.223505, 0.4368671, -1.060766, 1, 1, 1, 1, 1,
-1.217775, 0.2782651, -0.01733618, 1, 1, 1, 1, 1,
-1.196324, -1.536545, -2.038908, 0, 0, 1, 1, 1,
-1.187423, -1.82374, -3.300238, 1, 0, 0, 1, 1,
-1.182229, 0.45808, -0.2900821, 1, 0, 0, 1, 1,
-1.179502, 0.03551505, -1.238305, 1, 0, 0, 1, 1,
-1.178558, -0.318206, -4.480651, 1, 0, 0, 1, 1,
-1.172592, -1.088026, -1.769011, 1, 0, 0, 1, 1,
-1.161286, 1.612516, -0.1396386, 0, 0, 0, 1, 1,
-1.156656, 0.4081004, -1.339968, 0, 0, 0, 1, 1,
-1.156456, -0.6291673, -2.432613, 0, 0, 0, 1, 1,
-1.155115, -0.01039061, -1.579545, 0, 0, 0, 1, 1,
-1.152802, 2.363244, -1.612177, 0, 0, 0, 1, 1,
-1.146665, -0.03917526, -2.181678, 0, 0, 0, 1, 1,
-1.143196, -1.766238, -2.581358, 0, 0, 0, 1, 1,
-1.133763, 1.745807, -1.896569, 1, 1, 1, 1, 1,
-1.125291, -0.4704559, -3.257034, 1, 1, 1, 1, 1,
-1.124414, 0.1402957, -0.4199395, 1, 1, 1, 1, 1,
-1.12296, -2.844126, -2.078102, 1, 1, 1, 1, 1,
-1.122484, 0.252428, -3.920251, 1, 1, 1, 1, 1,
-1.11683, 0.05106729, -0.6432188, 1, 1, 1, 1, 1,
-1.102516, -0.211447, -1.947642, 1, 1, 1, 1, 1,
-1.096657, -1.627504, -2.663286, 1, 1, 1, 1, 1,
-1.089031, 0.2852266, -1.160475, 1, 1, 1, 1, 1,
-1.084977, -0.5826783, -1.621819, 1, 1, 1, 1, 1,
-1.06754, -1.189211, -0.899229, 1, 1, 1, 1, 1,
-1.062589, -1.609748, -1.293075, 1, 1, 1, 1, 1,
-1.053875, 0.5505967, -0.113986, 1, 1, 1, 1, 1,
-1.05234, -1.094202, -3.804124, 1, 1, 1, 1, 1,
-1.05202, -2.173649, -1.682711, 1, 1, 1, 1, 1,
-1.049441, -0.5906556, -2.435989, 0, 0, 1, 1, 1,
-1.040603, 0.2078921, -0.932734, 1, 0, 0, 1, 1,
-1.031622, -0.1266203, -0.7501858, 1, 0, 0, 1, 1,
-1.022289, -0.8084326, -2.27147, 1, 0, 0, 1, 1,
-1.018893, -0.3662261, -2.370911, 1, 0, 0, 1, 1,
-1.012489, 0.5914243, -2.971064, 1, 0, 0, 1, 1,
-1.007543, 0.7610989, 0.3751326, 0, 0, 0, 1, 1,
-1.0006, -1.164662, -2.418365, 0, 0, 0, 1, 1,
-0.9971733, 1.636607, 0.2743036, 0, 0, 0, 1, 1,
-0.9882565, 1.608041, 0.1516929, 0, 0, 0, 1, 1,
-0.9741092, -0.4612318, -0.5237907, 0, 0, 0, 1, 1,
-0.9726814, -0.2246529, -1.762024, 0, 0, 0, 1, 1,
-0.9657627, -0.4425285, -3.040588, 0, 0, 0, 1, 1,
-0.9597914, 0.006980381, 0.15335, 1, 1, 1, 1, 1,
-0.9589878, -1.768209, -2.277335, 1, 1, 1, 1, 1,
-0.9568225, -0.01191835, -3.153931, 1, 1, 1, 1, 1,
-0.9537299, 1.069946, -0.3571722, 1, 1, 1, 1, 1,
-0.9501627, -0.828716, -2.294806, 1, 1, 1, 1, 1,
-0.9485719, -0.2932262, -2.537381, 1, 1, 1, 1, 1,
-0.9404664, 0.3048699, -2.157234, 1, 1, 1, 1, 1,
-0.9380425, -0.7501785, -1.259616, 1, 1, 1, 1, 1,
-0.9334854, 0.9127247, -1.950518, 1, 1, 1, 1, 1,
-0.9329481, -0.6535768, -3.040468, 1, 1, 1, 1, 1,
-0.9324564, 1.447968, 0.04340672, 1, 1, 1, 1, 1,
-0.9324234, 0.2330105, -2.032351, 1, 1, 1, 1, 1,
-0.9308326, -0.3206334, -2.643856, 1, 1, 1, 1, 1,
-0.9293523, -0.7776516, -1.559397, 1, 1, 1, 1, 1,
-0.9260452, -0.1354394, 0.05219577, 1, 1, 1, 1, 1,
-0.9181637, -1.027678, -0.370183, 0, 0, 1, 1, 1,
-0.916867, -0.5789323, -2.529312, 1, 0, 0, 1, 1,
-0.9158993, 0.798609, -1.914107, 1, 0, 0, 1, 1,
-0.9153111, 0.3497631, -1.308319, 1, 0, 0, 1, 1,
-0.9133772, -0.3513448, -2.398565, 1, 0, 0, 1, 1,
-0.9071284, -0.0006421403, -2.769827, 1, 0, 0, 1, 1,
-0.9041111, -1.391695, -2.089816, 0, 0, 0, 1, 1,
-0.9031175, 2.116904, -0.6760718, 0, 0, 0, 1, 1,
-0.9020367, 1.334862, -0.6499386, 0, 0, 0, 1, 1,
-0.8972607, 0.879863, -3.831253, 0, 0, 0, 1, 1,
-0.8955589, 0.1527005, -1.495236, 0, 0, 0, 1, 1,
-0.8854931, 1.788029, 0.2987885, 0, 0, 0, 1, 1,
-0.8828629, 0.9150321, -1.525845, 0, 0, 0, 1, 1,
-0.8810688, 0.5722562, -2.517661, 1, 1, 1, 1, 1,
-0.8782044, 1.194733, 0.5103633, 1, 1, 1, 1, 1,
-0.8735067, -0.09972791, -2.066523, 1, 1, 1, 1, 1,
-0.8720614, -1.026441, -1.727686, 1, 1, 1, 1, 1,
-0.8694866, 1.071354, 2.12823, 1, 1, 1, 1, 1,
-0.8689961, 0.9567398, -0.7529557, 1, 1, 1, 1, 1,
-0.8567944, 0.4558977, -0.2451627, 1, 1, 1, 1, 1,
-0.8537381, 0.6058767, -1.348048, 1, 1, 1, 1, 1,
-0.8510413, 0.4362558, -2.882714, 1, 1, 1, 1, 1,
-0.843204, -0.03529564, -2.261227, 1, 1, 1, 1, 1,
-0.8430936, -0.8067519, -2.074084, 1, 1, 1, 1, 1,
-0.8327114, -0.3496854, -1.022917, 1, 1, 1, 1, 1,
-0.8302317, 0.6867056, -1.663756, 1, 1, 1, 1, 1,
-0.8279997, -1.385187, -3.824994, 1, 1, 1, 1, 1,
-0.8273528, -0.02859486, -1.73631, 1, 1, 1, 1, 1,
-0.826715, -1.150281, -0.6781939, 0, 0, 1, 1, 1,
-0.8071963, 2.051724, 0.03653044, 1, 0, 0, 1, 1,
-0.8055048, -0.591864, -3.727523, 1, 0, 0, 1, 1,
-0.8051521, -0.5384369, -1.780685, 1, 0, 0, 1, 1,
-0.8035965, -0.7472316, -2.184545, 1, 0, 0, 1, 1,
-0.797524, 1.885114, -0.2744719, 1, 0, 0, 1, 1,
-0.7912217, 1.08699, -0.7771592, 0, 0, 0, 1, 1,
-0.7896172, 1.038537, -0.7963077, 0, 0, 0, 1, 1,
-0.7822196, -0.2592072, -1.217387, 0, 0, 0, 1, 1,
-0.7817455, -2.215886, -2.16603, 0, 0, 0, 1, 1,
-0.7813399, 0.9302193, -1.347285, 0, 0, 0, 1, 1,
-0.7757106, -0.2314815, -1.961809, 0, 0, 0, 1, 1,
-0.7702175, -0.07320927, -2.133685, 0, 0, 0, 1, 1,
-0.7699279, 0.07079536, -1.293932, 1, 1, 1, 1, 1,
-0.7648311, -0.7484437, -3.524022, 1, 1, 1, 1, 1,
-0.7632837, -0.8442158, -2.981707, 1, 1, 1, 1, 1,
-0.7616345, 0.6481181, -2.353981, 1, 1, 1, 1, 1,
-0.7611443, 0.5684867, -0.3837471, 1, 1, 1, 1, 1,
-0.7550867, -0.5490863, -2.835403, 1, 1, 1, 1, 1,
-0.7489691, -0.6083415, -0.9162288, 1, 1, 1, 1, 1,
-0.7456065, 1.180787, -1.237953, 1, 1, 1, 1, 1,
-0.7413569, -0.3394252, -1.676784, 1, 1, 1, 1, 1,
-0.7387705, 0.6667888, -0.9077306, 1, 1, 1, 1, 1,
-0.7375031, -1.396386, -2.070101, 1, 1, 1, 1, 1,
-0.7345344, 0.3026861, -0.2219473, 1, 1, 1, 1, 1,
-0.7331033, 0.03053988, -1.273231, 1, 1, 1, 1, 1,
-0.7269087, -0.482002, -3.00358, 1, 1, 1, 1, 1,
-0.7256564, -0.9879209, -3.095674, 1, 1, 1, 1, 1,
-0.7184456, -0.6822409, -2.058743, 0, 0, 1, 1, 1,
-0.7132699, -0.04406328, -1.546032, 1, 0, 0, 1, 1,
-0.7083419, 0.6172573, -0.816162, 1, 0, 0, 1, 1,
-0.7051089, -0.7068843, -4.273932, 1, 0, 0, 1, 1,
-0.6997772, 0.0822197, -0.01538001, 1, 0, 0, 1, 1,
-0.6914959, 0.3172691, -2.309831, 1, 0, 0, 1, 1,
-0.690952, -0.9113223, -3.343062, 0, 0, 0, 1, 1,
-0.6850241, -0.3120293, -2.714984, 0, 0, 0, 1, 1,
-0.6812052, -0.7129545, -2.88142, 0, 0, 0, 1, 1,
-0.6792763, 0.2195393, -2.26962, 0, 0, 0, 1, 1,
-0.6743638, 0.5419289, -0.07181977, 0, 0, 0, 1, 1,
-0.6723346, -1.108346, -2.721328, 0, 0, 0, 1, 1,
-0.6715532, 1.428596, -1.136816, 0, 0, 0, 1, 1,
-0.6696203, -0.3000938, -2.373963, 1, 1, 1, 1, 1,
-0.6685967, 0.1850647, -1.988458, 1, 1, 1, 1, 1,
-0.66821, 0.6627567, -2.158738, 1, 1, 1, 1, 1,
-0.665144, 0.05327736, -0.5210657, 1, 1, 1, 1, 1,
-0.6649107, -0.3140685, -2.687701, 1, 1, 1, 1, 1,
-0.6626577, -1.28993, -1.242989, 1, 1, 1, 1, 1,
-0.6581395, -0.390718, -1.495841, 1, 1, 1, 1, 1,
-0.6553262, 0.3800849, -1.180492, 1, 1, 1, 1, 1,
-0.6523779, 0.5149524, 0.3018048, 1, 1, 1, 1, 1,
-0.6518921, 1.134971, -0.3230278, 1, 1, 1, 1, 1,
-0.6442333, 0.207186, 0.6335155, 1, 1, 1, 1, 1,
-0.6438736, -0.302917, -2.99138, 1, 1, 1, 1, 1,
-0.6433106, -0.7652704, -3.347309, 1, 1, 1, 1, 1,
-0.6270677, -0.64853, -3.537495, 1, 1, 1, 1, 1,
-0.6247098, 0.2688151, -0.7066094, 1, 1, 1, 1, 1,
-0.6158243, -0.2331075, -1.525111, 0, 0, 1, 1, 1,
-0.6058133, 2.087588, 0.4375556, 1, 0, 0, 1, 1,
-0.6046494, 0.6335135, -0.5254265, 1, 0, 0, 1, 1,
-0.6033728, -0.6253356, -2.971727, 1, 0, 0, 1, 1,
-0.6031901, -0.8147527, -2.746006, 1, 0, 0, 1, 1,
-0.6022565, -0.3028615, -2.736337, 1, 0, 0, 1, 1,
-0.602088, 1.335637, -0.9897073, 0, 0, 0, 1, 1,
-0.5962518, -1.48215, -2.680474, 0, 0, 0, 1, 1,
-0.5908507, -0.09495261, -0.7585407, 0, 0, 0, 1, 1,
-0.5889651, 0.9702204, 0.8262057, 0, 0, 0, 1, 1,
-0.5877909, -0.5537829, -2.207452, 0, 0, 0, 1, 1,
-0.5861083, 0.6275457, -2.190012, 0, 0, 0, 1, 1,
-0.5836175, -1.336573, -2.857045, 0, 0, 0, 1, 1,
-0.5817044, -0.3823868, -3.136655, 1, 1, 1, 1, 1,
-0.579899, -0.1556722, -2.881029, 1, 1, 1, 1, 1,
-0.578588, -0.4875675, -1.986748, 1, 1, 1, 1, 1,
-0.5784035, 0.8273627, -2.094622, 1, 1, 1, 1, 1,
-0.5775996, -0.4944639, -3.195302, 1, 1, 1, 1, 1,
-0.5743517, 0.4869105, -1.53498, 1, 1, 1, 1, 1,
-0.574262, 0.7115074, 0.07526693, 1, 1, 1, 1, 1,
-0.5612143, 0.09385857, -1.810673, 1, 1, 1, 1, 1,
-0.5611072, 1.593073, 0.5270773, 1, 1, 1, 1, 1,
-0.5493972, -0.2987168, -1.334803, 1, 1, 1, 1, 1,
-0.5485577, -0.4894039, -3.56505, 1, 1, 1, 1, 1,
-0.5466653, 1.572182, -0.4019005, 1, 1, 1, 1, 1,
-0.5456482, -0.7729536, -1.45962, 1, 1, 1, 1, 1,
-0.5450481, -0.004700818, -0.8703516, 1, 1, 1, 1, 1,
-0.5419788, -0.1589466, -2.640555, 1, 1, 1, 1, 1,
-0.5323978, 0.997112, 0.3233303, 0, 0, 1, 1, 1,
-0.5289, -1.603067, -2.115725, 1, 0, 0, 1, 1,
-0.5271069, 0.4422153, -1.860249, 1, 0, 0, 1, 1,
-0.5268688, 2.194863, -0.7315848, 1, 0, 0, 1, 1,
-0.5243183, 0.655107, -1.860898, 1, 0, 0, 1, 1,
-0.5169707, 0.5903431, 0.159731, 1, 0, 0, 1, 1,
-0.5161904, -1.489324, -2.133284, 0, 0, 0, 1, 1,
-0.5144282, 1.981254, 0.8979298, 0, 0, 0, 1, 1,
-0.5079305, -0.11986, -2.736356, 0, 0, 0, 1, 1,
-0.5068648, 1.378747, -0.2507901, 0, 0, 0, 1, 1,
-0.5021117, 0.03127731, -2.380844, 0, 0, 0, 1, 1,
-0.5016624, -0.5914849, -3.161934, 0, 0, 0, 1, 1,
-0.5011477, 0.8036984, -0.4627106, 0, 0, 0, 1, 1,
-0.4991742, -0.9457604, -3.058979, 1, 1, 1, 1, 1,
-0.4987589, -0.8230115, -4.269042, 1, 1, 1, 1, 1,
-0.4959086, -0.4542377, -0.4933963, 1, 1, 1, 1, 1,
-0.4931775, -0.882051, -1.3473, 1, 1, 1, 1, 1,
-0.4904155, 1.424047, -0.9928151, 1, 1, 1, 1, 1,
-0.4892379, -0.6893978, -2.280244, 1, 1, 1, 1, 1,
-0.4855501, -2.201542, -2.666741, 1, 1, 1, 1, 1,
-0.4758745, 0.08550961, -1.050598, 1, 1, 1, 1, 1,
-0.47087, -1.599373, -3.914046, 1, 1, 1, 1, 1,
-0.4704675, -0.1740698, -0.5963556, 1, 1, 1, 1, 1,
-0.4700913, 0.09087781, -3.051231, 1, 1, 1, 1, 1,
-0.4695596, 1.256633, -0.1813839, 1, 1, 1, 1, 1,
-0.4694587, 1.30407, -1.479197, 1, 1, 1, 1, 1,
-0.4687545, -3.038908, -1.429486, 1, 1, 1, 1, 1,
-0.4591441, 0.6412476, -0.2704878, 1, 1, 1, 1, 1,
-0.4573067, 2.466811, -1.757073, 0, 0, 1, 1, 1,
-0.4570541, 1.470104, 0.8966513, 1, 0, 0, 1, 1,
-0.4538908, 1.661637, 0.1950348, 1, 0, 0, 1, 1,
-0.4490262, 0.2316833, -1.858815, 1, 0, 0, 1, 1,
-0.4489615, 1.613995, 0.7079914, 1, 0, 0, 1, 1,
-0.4460374, -0.5518795, -1.728258, 1, 0, 0, 1, 1,
-0.4459283, 0.2445242, -1.660652, 0, 0, 0, 1, 1,
-0.43935, -0.7532744, -2.272043, 0, 0, 0, 1, 1,
-0.4376692, 1.215629, 0.4544289, 0, 0, 0, 1, 1,
-0.4370413, -1.11898, -3.025668, 0, 0, 0, 1, 1,
-0.4352492, 0.6034333, -0.1415864, 0, 0, 0, 1, 1,
-0.4341432, -0.9719216, -1.650081, 0, 0, 0, 1, 1,
-0.433385, -0.9707022, -4.193611, 0, 0, 0, 1, 1,
-0.4332879, -1.220934, -2.704677, 1, 1, 1, 1, 1,
-0.4315515, -1.359997, -1.797992, 1, 1, 1, 1, 1,
-0.428536, -0.286413, -2.180751, 1, 1, 1, 1, 1,
-0.4283517, 0.2547753, -1.78457, 1, 1, 1, 1, 1,
-0.4182633, -0.3837871, -2.063078, 1, 1, 1, 1, 1,
-0.4126239, -0.3363985, -1.183862, 1, 1, 1, 1, 1,
-0.4105543, -1.503749, -2.751053, 1, 1, 1, 1, 1,
-0.4087121, 0.8698648, -1.154519, 1, 1, 1, 1, 1,
-0.4037518, 0.3239889, -2.221813, 1, 1, 1, 1, 1,
-0.3973754, 1.667577, -1.305621, 1, 1, 1, 1, 1,
-0.3955809, 0.4178506, -0.977192, 1, 1, 1, 1, 1,
-0.3946252, 1.849043, -0.3181469, 1, 1, 1, 1, 1,
-0.3924792, 0.4552569, 0.5640345, 1, 1, 1, 1, 1,
-0.3920243, 0.1893185, 1.975307, 1, 1, 1, 1, 1,
-0.3869328, 0.2056626, -1.998861, 1, 1, 1, 1, 1,
-0.3848439, -0.3348747, -2.860729, 0, 0, 1, 1, 1,
-0.3819813, 1.112321, -0.06707145, 1, 0, 0, 1, 1,
-0.367323, 1.646123, -1.991126, 1, 0, 0, 1, 1,
-0.3667302, 0.583813, -0.277558, 1, 0, 0, 1, 1,
-0.3666715, -0.3216733, -3.795335, 1, 0, 0, 1, 1,
-0.3661928, 0.3463302, 0.7730706, 1, 0, 0, 1, 1,
-0.3641145, 1.424426, 0.3174647, 0, 0, 0, 1, 1,
-0.3622259, -0.4293952, -2.310755, 0, 0, 0, 1, 1,
-0.3616755, -0.8311616, -3.16387, 0, 0, 0, 1, 1,
-0.360543, -0.1839754, -3.323022, 0, 0, 0, 1, 1,
-0.3593304, -0.8128214, -3.588712, 0, 0, 0, 1, 1,
-0.3584881, -2.108925, -3.621614, 0, 0, 0, 1, 1,
-0.3573513, -0.3503389, -2.516574, 0, 0, 0, 1, 1,
-0.3562415, 0.6840606, -1.76207, 1, 1, 1, 1, 1,
-0.3551376, -0.3384508, -1.734358, 1, 1, 1, 1, 1,
-0.3534654, 0.4685533, 0.9107182, 1, 1, 1, 1, 1,
-0.3506167, -0.7899354, -2.633379, 1, 1, 1, 1, 1,
-0.3478964, -0.4867108, -2.667726, 1, 1, 1, 1, 1,
-0.3469959, -1.969292, -4.355392, 1, 1, 1, 1, 1,
-0.337299, 0.03189926, -1.724162, 1, 1, 1, 1, 1,
-0.3352997, -1.851157, -3.15823, 1, 1, 1, 1, 1,
-0.331863, -0.1661278, -3.98021, 1, 1, 1, 1, 1,
-0.3279157, 1.403666, -0.497254, 1, 1, 1, 1, 1,
-0.3270734, -0.3567702, -2.134211, 1, 1, 1, 1, 1,
-0.3250173, 0.1745495, -1.104096, 1, 1, 1, 1, 1,
-0.3245183, -1.588213, -3.107448, 1, 1, 1, 1, 1,
-0.3205245, -0.6744668, -3.696412, 1, 1, 1, 1, 1,
-0.3176602, -0.4410085, -1.595842, 1, 1, 1, 1, 1,
-0.3158901, -1.267599, -4.085293, 0, 0, 1, 1, 1,
-0.3145387, -0.9619832, -3.120329, 1, 0, 0, 1, 1,
-0.3141116, 1.118257, -1.745483, 1, 0, 0, 1, 1,
-0.3109416, 0.4382882, 0.8714467, 1, 0, 0, 1, 1,
-0.3103179, 1.712926, -1.750491, 1, 0, 0, 1, 1,
-0.3070726, 0.4992894, -0.2550309, 1, 0, 0, 1, 1,
-0.3066688, 0.357558, -2.340935, 0, 0, 0, 1, 1,
-0.3037384, -0.02907138, -1.788578, 0, 0, 0, 1, 1,
-0.2994005, -1.116994, -2.429188, 0, 0, 0, 1, 1,
-0.292844, 0.4499181, -1.039212, 0, 0, 0, 1, 1,
-0.2920347, -0.7484784, -1.189792, 0, 0, 0, 1, 1,
-0.289722, 0.1520922, -1.925902, 0, 0, 0, 1, 1,
-0.288157, 0.4567707, -2.127811, 0, 0, 0, 1, 1,
-0.2878577, 0.3742062, 0.003582517, 1, 1, 1, 1, 1,
-0.2839194, 0.6136294, -1.904366, 1, 1, 1, 1, 1,
-0.2826074, 1.689224, -0.1877927, 1, 1, 1, 1, 1,
-0.2824822, 0.8071199, -0.1891593, 1, 1, 1, 1, 1,
-0.2793212, -2.213061, -2.831598, 1, 1, 1, 1, 1,
-0.2710478, 1.02778, -0.1450468, 1, 1, 1, 1, 1,
-0.2710254, -1.313782, -3.487379, 1, 1, 1, 1, 1,
-0.2683533, -1.094215, -4.472742, 1, 1, 1, 1, 1,
-0.2641669, 0.1505567, -1.677027, 1, 1, 1, 1, 1,
-0.2619429, 0.7204091, 0.9737567, 1, 1, 1, 1, 1,
-0.2606679, -0.7245007, -4.397953, 1, 1, 1, 1, 1,
-0.2602738, -0.1346099, -4.602044, 1, 1, 1, 1, 1,
-0.2593263, -0.8924078, -1.989782, 1, 1, 1, 1, 1,
-0.2581618, -0.1921252, -2.500632, 1, 1, 1, 1, 1,
-0.2565181, 0.1932185, 0.9200391, 1, 1, 1, 1, 1,
-0.2543982, -1.772421, -2.777002, 0, 0, 1, 1, 1,
-0.2542553, -0.6508155, -2.293607, 1, 0, 0, 1, 1,
-0.2516702, 0.7539024, 1.530526, 1, 0, 0, 1, 1,
-0.2511567, 0.4136125, -0.7252403, 1, 0, 0, 1, 1,
-0.2496723, 1.167908, -1.108816, 1, 0, 0, 1, 1,
-0.2492835, -0.4264139, -2.597126, 1, 0, 0, 1, 1,
-0.2400192, -2.121247, -2.173679, 0, 0, 0, 1, 1,
-0.2355488, -2.949372, -2.492239, 0, 0, 0, 1, 1,
-0.2353175, -1.842919, -3.226987, 0, 0, 0, 1, 1,
-0.2345786, 0.6116628, -0.1073588, 0, 0, 0, 1, 1,
-0.2319048, 0.6569588, -1.771323, 0, 0, 0, 1, 1,
-0.2285762, 0.5937487, -0.1273825, 0, 0, 0, 1, 1,
-0.2264623, -0.9259667, -2.842492, 0, 0, 0, 1, 1,
-0.2248159, 0.6949765, -1.174113, 1, 1, 1, 1, 1,
-0.2206019, -0.3661735, -0.8405485, 1, 1, 1, 1, 1,
-0.2175389, 0.2755596, 0.2592729, 1, 1, 1, 1, 1,
-0.2107669, -1.177193, -2.535161, 1, 1, 1, 1, 1,
-0.2104951, 1.202796, -1.709531, 1, 1, 1, 1, 1,
-0.2100765, -0.9455371, -4.102214, 1, 1, 1, 1, 1,
-0.2042151, -0.1546467, -2.487802, 1, 1, 1, 1, 1,
-0.2022719, 0.717383, -1.553352, 1, 1, 1, 1, 1,
-0.1984098, -0.1140036, -2.240019, 1, 1, 1, 1, 1,
-0.1977617, -1.284179, -1.556606, 1, 1, 1, 1, 1,
-0.197095, 0.633446, 0.4449717, 1, 1, 1, 1, 1,
-0.1951438, 1.310158, 1.65918, 1, 1, 1, 1, 1,
-0.1939254, 0.3531218, -0.4990251, 1, 1, 1, 1, 1,
-0.1908783, -1.324096, -2.843083, 1, 1, 1, 1, 1,
-0.188733, -0.4981586, -2.100445, 1, 1, 1, 1, 1,
-0.1862749, 1.619514, -0.3928286, 0, 0, 1, 1, 1,
-0.1860918, -0.5934891, -4.058796, 1, 0, 0, 1, 1,
-0.1836935, 0.1262784, -1.870553, 1, 0, 0, 1, 1,
-0.183522, -0.4938034, -4.086558, 1, 0, 0, 1, 1,
-0.1799124, 0.05692514, -2.460795, 1, 0, 0, 1, 1,
-0.1783436, 0.852991, 0.709975, 1, 0, 0, 1, 1,
-0.1771946, 0.1899536, 0.0722257, 0, 0, 0, 1, 1,
-0.1762781, 0.2900234, -0.4090962, 0, 0, 0, 1, 1,
-0.1752928, 0.08253285, -0.7989497, 0, 0, 0, 1, 1,
-0.1723901, 0.4757604, -0.3070388, 0, 0, 0, 1, 1,
-0.1707437, 0.009745589, -1.123582, 0, 0, 0, 1, 1,
-0.1685175, -1.158753, -2.725159, 0, 0, 0, 1, 1,
-0.1635069, 0.5114316, -1.115545, 0, 0, 0, 1, 1,
-0.1633709, -1.944624, -3.617795, 1, 1, 1, 1, 1,
-0.1631823, 0.8165144, -2.267293, 1, 1, 1, 1, 1,
-0.1630317, -0.4460478, -2.825067, 1, 1, 1, 1, 1,
-0.1564772, -0.7746168, -3.069475, 1, 1, 1, 1, 1,
-0.1521737, -1.095691, -5.548921, 1, 1, 1, 1, 1,
-0.1505956, -1.079178, -2.043728, 1, 1, 1, 1, 1,
-0.1465334, 1.919083, -0.2729568, 1, 1, 1, 1, 1,
-0.1454339, -0.3351605, -3.771512, 1, 1, 1, 1, 1,
-0.1367529, -1.503648, -3.38976, 1, 1, 1, 1, 1,
-0.1312366, -0.1576083, -1.171269, 1, 1, 1, 1, 1,
-0.1279271, -0.4762754, -1.808201, 1, 1, 1, 1, 1,
-0.1273458, 0.9577678, -0.3525763, 1, 1, 1, 1, 1,
-0.1267871, 0.8886095, -1.638614, 1, 1, 1, 1, 1,
-0.1257897, -1.520254, -3.406446, 1, 1, 1, 1, 1,
-0.1249502, 0.3202326, -1.612502, 1, 1, 1, 1, 1,
-0.1228709, -0.7481745, -2.944532, 0, 0, 1, 1, 1,
-0.1214691, -0.3312871, -3.814738, 1, 0, 0, 1, 1,
-0.1154743, 0.7751076, -1.357362, 1, 0, 0, 1, 1,
-0.1150037, 0.3674924, -2.883627, 1, 0, 0, 1, 1,
-0.1140548, 0.1867636, -0.5973454, 1, 0, 0, 1, 1,
-0.1133845, 0.1837638, 0.2020731, 1, 0, 0, 1, 1,
-0.1127928, -0.6080273, -3.24023, 0, 0, 0, 1, 1,
-0.1107721, 0.5374105, 1.078291, 0, 0, 0, 1, 1,
-0.1083716, -0.2380091, -1.598888, 0, 0, 0, 1, 1,
-0.1075167, 0.08646931, -0.5183562, 0, 0, 0, 1, 1,
-0.1063667, 0.7182822, 0.8384972, 0, 0, 0, 1, 1,
-0.1046323, 2.143494, -0.2710246, 0, 0, 0, 1, 1,
-0.1045767, -0.8940902, -3.023265, 0, 0, 0, 1, 1,
-0.1036131, 0.6708299, -0.9490586, 1, 1, 1, 1, 1,
-0.1017741, 3.360645, 0.2784272, 1, 1, 1, 1, 1,
-0.100156, -0.04936277, -2.979235, 1, 1, 1, 1, 1,
-0.09793824, -1.017987, -0.960151, 1, 1, 1, 1, 1,
-0.09234171, -0.5610058, -3.485457, 1, 1, 1, 1, 1,
-0.09099261, 0.5088227, 0.4745524, 1, 1, 1, 1, 1,
-0.08877776, 0.6326049, 0.8368871, 1, 1, 1, 1, 1,
-0.08663907, -0.9177521, -2.362599, 1, 1, 1, 1, 1,
-0.08212853, -0.8499293, -1.536414, 1, 1, 1, 1, 1,
-0.08201903, 0.3566495, 1.183524, 1, 1, 1, 1, 1,
-0.07436503, -1.961879, -5.032673, 1, 1, 1, 1, 1,
-0.07189236, 0.1971284, 0.6876958, 1, 1, 1, 1, 1,
-0.06875888, 1.332966, 1.768708, 1, 1, 1, 1, 1,
-0.06767158, -0.1092627, -1.936265, 1, 1, 1, 1, 1,
-0.06672309, -1.053759, -3.917663, 1, 1, 1, 1, 1,
-0.06483742, 0.7848036, -0.0967582, 0, 0, 1, 1, 1,
-0.06332789, -0.5067174, -3.161712, 1, 0, 0, 1, 1,
-0.0597196, 1.997313, -0.9441029, 1, 0, 0, 1, 1,
-0.0586784, 0.6536321, -0.592463, 1, 0, 0, 1, 1,
-0.05351047, 1.414418, 0.5554467, 1, 0, 0, 1, 1,
-0.05244529, -1.350536, -3.341447, 1, 0, 0, 1, 1,
-0.05215194, -0.4380207, -2.969651, 0, 0, 0, 1, 1,
-0.0480505, -1.215871, -1.93599, 0, 0, 0, 1, 1,
-0.04430583, -1.044315, -3.93099, 0, 0, 0, 1, 1,
-0.04379085, 0.5730022, -0.08409923, 0, 0, 0, 1, 1,
-0.04273525, 0.06891993, 0.9601439, 0, 0, 0, 1, 1,
-0.04120303, -0.6005664, -2.12928, 0, 0, 0, 1, 1,
-0.04089753, 0.3118745, 0.277846, 0, 0, 0, 1, 1,
-0.04063278, 0.07752189, 0.7687232, 1, 1, 1, 1, 1,
-0.03034926, 0.8418685, 0.7844929, 1, 1, 1, 1, 1,
-0.01978188, 1.291661, -1.475971, 1, 1, 1, 1, 1,
-0.01797408, -0.8470325, -5.838561, 1, 1, 1, 1, 1,
-0.01434957, 1.162239, -0.5922738, 1, 1, 1, 1, 1,
-0.01416798, -0.2412726, -2.875899, 1, 1, 1, 1, 1,
-0.01316224, 1.151301, 0.6067727, 1, 1, 1, 1, 1,
-0.009996941, 0.8716457, 1.684672, 1, 1, 1, 1, 1,
-0.007257592, -0.005254501, -1.062472, 1, 1, 1, 1, 1,
-0.00685942, -0.9588277, -3.068045, 1, 1, 1, 1, 1,
-0.004356379, 0.7346632, 1.228018, 1, 1, 1, 1, 1,
-0.003092438, 1.75933, 1.048651, 1, 1, 1, 1, 1,
0.003473094, -0.782631, 3.427801, 1, 1, 1, 1, 1,
0.004739057, -1.631846, 3.778068, 1, 1, 1, 1, 1,
0.005874012, 0.1229287, -0.549714, 1, 1, 1, 1, 1,
0.007969914, -0.5558286, 2.42822, 0, 0, 1, 1, 1,
0.008141995, 1.973486, 2.684023, 1, 0, 0, 1, 1,
0.008683953, 0.8386758, -0.2599851, 1, 0, 0, 1, 1,
0.01014925, 0.9619223, 1.392548, 1, 0, 0, 1, 1,
0.01065197, -1.227286, 2.962093, 1, 0, 0, 1, 1,
0.0110267, 1.814898, 0.009315143, 1, 0, 0, 1, 1,
0.01252217, -0.7321087, 2.743168, 0, 0, 0, 1, 1,
0.01410261, 1.384634, -0.4403769, 0, 0, 0, 1, 1,
0.01516468, -0.113039, 2.676358, 0, 0, 0, 1, 1,
0.01691141, 0.2087066, 0.04157026, 0, 0, 0, 1, 1,
0.01950674, 0.4067349, -0.08170476, 0, 0, 0, 1, 1,
0.02032085, 1.953155, -0.2564925, 0, 0, 0, 1, 1,
0.02077981, -1.489803, 5.369889, 0, 0, 0, 1, 1,
0.02152037, 1.136224, -2.243751, 1, 1, 1, 1, 1,
0.02238066, -0.8293053, 3.146582, 1, 1, 1, 1, 1,
0.02381689, 1.460028, 0.5342348, 1, 1, 1, 1, 1,
0.02774367, -0.6444536, 2.583561, 1, 1, 1, 1, 1,
0.0278338, 0.6732649, 0.145856, 1, 1, 1, 1, 1,
0.02908584, 0.738807, 0.3746375, 1, 1, 1, 1, 1,
0.03472438, -1.067782, 2.366054, 1, 1, 1, 1, 1,
0.03749494, 0.1893439, -0.6591809, 1, 1, 1, 1, 1,
0.03784752, -1.372208, 2.606429, 1, 1, 1, 1, 1,
0.03787961, -0.9460613, 3.526536, 1, 1, 1, 1, 1,
0.03935651, 0.3735104, 0.9098644, 1, 1, 1, 1, 1,
0.03976341, 1.229158, -0.1076027, 1, 1, 1, 1, 1,
0.04063947, 0.8083186, -0.9708853, 1, 1, 1, 1, 1,
0.04093083, 2.123623, -0.7868507, 1, 1, 1, 1, 1,
0.04420709, -0.9247375, 2.827106, 1, 1, 1, 1, 1,
0.04433659, -0.1996318, 3.667217, 0, 0, 1, 1, 1,
0.04535426, 0.4699244, 0.3585832, 1, 0, 0, 1, 1,
0.04930063, 0.04419407, 0.5508671, 1, 0, 0, 1, 1,
0.04978439, 0.5056607, -0.0896453, 1, 0, 0, 1, 1,
0.05064824, -0.6868485, 4.007503, 1, 0, 0, 1, 1,
0.05333816, -0.9697559, 2.616567, 1, 0, 0, 1, 1,
0.05639725, -1.149929, 3.96627, 0, 0, 0, 1, 1,
0.05647163, 0.4127859, -1.090049, 0, 0, 0, 1, 1,
0.0565973, -1.165795, 5.356544, 0, 0, 0, 1, 1,
0.06075188, -0.6152497, 3.921949, 0, 0, 0, 1, 1,
0.06234309, 0.7443648, -0.4772934, 0, 0, 0, 1, 1,
0.06261703, 0.1343852, -0.2208182, 0, 0, 0, 1, 1,
0.06479535, 0.1299312, -0.4984285, 0, 0, 0, 1, 1,
0.06539132, 0.9823781, 1.007373, 1, 1, 1, 1, 1,
0.06659605, 1.218045, 1.298746, 1, 1, 1, 1, 1,
0.06942817, -1.120634, 3.780453, 1, 1, 1, 1, 1,
0.06981735, -0.956983, 0.942977, 1, 1, 1, 1, 1,
0.07147461, 0.7636504, -2.446054, 1, 1, 1, 1, 1,
0.07325921, -1.446894, 4.776625, 1, 1, 1, 1, 1,
0.07401666, -0.2902859, 1.902647, 1, 1, 1, 1, 1,
0.07926819, 0.9591758, 1.633365, 1, 1, 1, 1, 1,
0.08086693, 0.5296344, 0.3634949, 1, 1, 1, 1, 1,
0.08422648, -1.311554, 3.014179, 1, 1, 1, 1, 1,
0.08482775, -0.1968399, 3.60199, 1, 1, 1, 1, 1,
0.0862894, 0.4475988, 0.4338384, 1, 1, 1, 1, 1,
0.08686737, -0.1052513, 2.370195, 1, 1, 1, 1, 1,
0.08892849, -0.05715723, 3.29793, 1, 1, 1, 1, 1,
0.09063181, 0.5126851, -0.6282823, 1, 1, 1, 1, 1,
0.09074197, 0.5391008, -2.508598, 0, 0, 1, 1, 1,
0.09236981, 1.127065, 0.01271444, 1, 0, 0, 1, 1,
0.09377362, 0.204786, 0.3284111, 1, 0, 0, 1, 1,
0.09555432, -0.7104735, 3.398517, 1, 0, 0, 1, 1,
0.09700163, -0.00332052, 0.4698181, 1, 0, 0, 1, 1,
0.09721462, -0.5560793, 3.223171, 1, 0, 0, 1, 1,
0.09724513, -1.078668, 3.914935, 0, 0, 0, 1, 1,
0.09742634, 0.805859, 0.5182958, 0, 0, 0, 1, 1,
0.09820721, -1.741108, 2.136686, 0, 0, 0, 1, 1,
0.09872586, -0.02471182, 0.9216993, 0, 0, 0, 1, 1,
0.1088758, 0.8897222, -1.408701, 0, 0, 0, 1, 1,
0.1105661, 1.07658, -1.663086, 0, 0, 0, 1, 1,
0.11109, 0.3876571, 1.125007, 0, 0, 0, 1, 1,
0.1113598, 0.535284, 0.5048697, 1, 1, 1, 1, 1,
0.1141104, 0.3835565, -0.03404395, 1, 1, 1, 1, 1,
0.116921, 0.834315, -1.077547, 1, 1, 1, 1, 1,
0.1175183, 2.181191, -0.3322043, 1, 1, 1, 1, 1,
0.1180553, 1.731975, -1.53284, 1, 1, 1, 1, 1,
0.1230488, -0.2308799, 0.9911492, 1, 1, 1, 1, 1,
0.1235133, 0.1153411, 0.9756911, 1, 1, 1, 1, 1,
0.127593, 1.139134, 0.2078598, 1, 1, 1, 1, 1,
0.1285194, 1.373964, -0.6553054, 1, 1, 1, 1, 1,
0.129858, 1.194144, -0.4767314, 1, 1, 1, 1, 1,
0.1326055, 1.918805, -0.8801858, 1, 1, 1, 1, 1,
0.1366099, -1.003821, 4.270226, 1, 1, 1, 1, 1,
0.1411039, -1.379807, 3.559672, 1, 1, 1, 1, 1,
0.1460565, 1.556383, -0.3745706, 1, 1, 1, 1, 1,
0.1468288, 0.8623542, 0.7326708, 1, 1, 1, 1, 1,
0.1535219, -0.7928495, 2.221986, 0, 0, 1, 1, 1,
0.1563001, 1.455886, -0.4188806, 1, 0, 0, 1, 1,
0.1567737, 0.5266768, 1.742474, 1, 0, 0, 1, 1,
0.1568587, -1.304686, 3.957474, 1, 0, 0, 1, 1,
0.1596035, 0.4307824, -0.4573497, 1, 0, 0, 1, 1,
0.1617076, -0.4793926, 2.203053, 1, 0, 0, 1, 1,
0.163308, -0.5521071, 5.537104, 0, 0, 0, 1, 1,
0.1685475, -0.6043997, 1.61015, 0, 0, 0, 1, 1,
0.1728877, -0.7157449, 4.261186, 0, 0, 0, 1, 1,
0.1793349, 0.6558105, -1.177021, 0, 0, 0, 1, 1,
0.1820598, 1.187253, -1.546829, 0, 0, 0, 1, 1,
0.1861063, 0.279965, 2.76948, 0, 0, 0, 1, 1,
0.1869869, 1.432595, 1.092362, 0, 0, 0, 1, 1,
0.1876534, -0.7553287, 4.216878, 1, 1, 1, 1, 1,
0.188684, -0.8708276, 4.296306, 1, 1, 1, 1, 1,
0.1919265, 1.659172, 0.7605861, 1, 1, 1, 1, 1,
0.1927235, -0.639518, 4.098111, 1, 1, 1, 1, 1,
0.1979281, 0.8064239, 0.2166355, 1, 1, 1, 1, 1,
0.1993884, -2.446165, 3.737156, 1, 1, 1, 1, 1,
0.2064191, -0.9932601, 2.081527, 1, 1, 1, 1, 1,
0.2101693, -1.813424, 3.734782, 1, 1, 1, 1, 1,
0.2180609, -0.5164329, 2.838071, 1, 1, 1, 1, 1,
0.2205987, 0.9600915, -0.9221573, 1, 1, 1, 1, 1,
0.222573, -0.1451197, 2.59838, 1, 1, 1, 1, 1,
0.2316043, 0.8139908, 0.4917233, 1, 1, 1, 1, 1,
0.23187, 0.7819589, -0.09134018, 1, 1, 1, 1, 1,
0.2429304, 0.3659918, 1.954302, 1, 1, 1, 1, 1,
0.2437777, 0.6953233, 0.09875561, 1, 1, 1, 1, 1,
0.2466788, 0.1268725, 2.503896, 0, 0, 1, 1, 1,
0.2471913, -0.2701459, 1.414753, 1, 0, 0, 1, 1,
0.2491294, -0.2471541, 3.893425, 1, 0, 0, 1, 1,
0.2529201, -0.6847675, 2.851353, 1, 0, 0, 1, 1,
0.2587569, 0.3789645, 0.5057502, 1, 0, 0, 1, 1,
0.2606616, 0.8273756, -0.3451693, 1, 0, 0, 1, 1,
0.2610824, -0.07708153, 1.097416, 0, 0, 0, 1, 1,
0.2656312, -0.2168333, 2.6027, 0, 0, 0, 1, 1,
0.2746946, -0.1377638, 3.529173, 0, 0, 0, 1, 1,
0.2751163, 1.257102, 0.04791401, 0, 0, 0, 1, 1,
0.2760891, -0.1738457, 3.052881, 0, 0, 0, 1, 1,
0.2765197, 0.2411808, 0.4358769, 0, 0, 0, 1, 1,
0.2777704, -0.3352036, 2.076806, 0, 0, 0, 1, 1,
0.2808977, -0.3424114, 2.095662, 1, 1, 1, 1, 1,
0.2811897, 0.5284283, 0.610002, 1, 1, 1, 1, 1,
0.2816427, -0.6468217, 4.922153, 1, 1, 1, 1, 1,
0.2831089, 0.4345126, 0.9937808, 1, 1, 1, 1, 1,
0.290332, 0.9306693, 0.1115028, 1, 1, 1, 1, 1,
0.3036191, 0.4055893, 1.77522, 1, 1, 1, 1, 1,
0.3047562, 0.911472, -1.019856, 1, 1, 1, 1, 1,
0.3062649, 0.7967336, 1.452285, 1, 1, 1, 1, 1,
0.3080425, -0.5779285, 1.740311, 1, 1, 1, 1, 1,
0.3094034, 0.4497131, 0.4470131, 1, 1, 1, 1, 1,
0.3125719, 1.378985, 1.380907, 1, 1, 1, 1, 1,
0.3127006, 0.1540187, 0.7746896, 1, 1, 1, 1, 1,
0.3130237, -0.8052822, 3.312074, 1, 1, 1, 1, 1,
0.3163288, -1.006063, 3.412842, 1, 1, 1, 1, 1,
0.3196609, -0.4368653, 2.071492, 1, 1, 1, 1, 1,
0.3206113, 0.2089768, 2.874321, 0, 0, 1, 1, 1,
0.3252484, -0.8944795, 2.155204, 1, 0, 0, 1, 1,
0.3269854, 2.161792, -1.788571, 1, 0, 0, 1, 1,
0.3273198, 2.838192, -1.174667, 1, 0, 0, 1, 1,
0.3425911, 1.441637, 0.4062996, 1, 0, 0, 1, 1,
0.345026, -0.3040373, 1.280935, 1, 0, 0, 1, 1,
0.3496915, 0.5592028, 1.811169, 0, 0, 0, 1, 1,
0.3535112, -1.067925, 2.256296, 0, 0, 0, 1, 1,
0.3545823, -1.796491, 3.808674, 0, 0, 0, 1, 1,
0.3579497, -2.344372, 1.594575, 0, 0, 0, 1, 1,
0.3594966, 0.06785084, 1.24729, 0, 0, 0, 1, 1,
0.3664827, -0.6834561, 1.748137, 0, 0, 0, 1, 1,
0.3681997, 0.3525205, -0.5102808, 0, 0, 0, 1, 1,
0.3747842, -0.2380906, 1.148394, 1, 1, 1, 1, 1,
0.3795153, 0.2019314, 0.9386606, 1, 1, 1, 1, 1,
0.3808995, -0.6547555, 3.54359, 1, 1, 1, 1, 1,
0.3813116, -2.498246, 3.330178, 1, 1, 1, 1, 1,
0.3822715, 1.423553, 1.013742, 1, 1, 1, 1, 1,
0.3860821, -0.4730276, 1.422778, 1, 1, 1, 1, 1,
0.3868742, -0.009132234, 0.4590398, 1, 1, 1, 1, 1,
0.389538, -1.366812, 2.9976, 1, 1, 1, 1, 1,
0.3930052, 1.193214, 0.6404803, 1, 1, 1, 1, 1,
0.3932754, -0.9596601, 2.045465, 1, 1, 1, 1, 1,
0.3972274, 0.9064049, 0.6375832, 1, 1, 1, 1, 1,
0.3976234, 0.7236679, -0.7237064, 1, 1, 1, 1, 1,
0.3987177, 0.4176138, -0.03778965, 1, 1, 1, 1, 1,
0.4051204, 0.7675065, 0.1540294, 1, 1, 1, 1, 1,
0.4068302, -0.8650132, 3.174665, 1, 1, 1, 1, 1,
0.4092485, -0.7562908, 1.465241, 0, 0, 1, 1, 1,
0.4114763, 0.2910884, 1.119494, 1, 0, 0, 1, 1,
0.4131114, 0.4338886, 1.153712, 1, 0, 0, 1, 1,
0.4136634, 1.058298, 0.1250987, 1, 0, 0, 1, 1,
0.4150918, 0.4064113, 0.3042228, 1, 0, 0, 1, 1,
0.4151642, 1.04882, 1.45996, 1, 0, 0, 1, 1,
0.4153143, -0.07802325, 0.1673602, 0, 0, 0, 1, 1,
0.4163614, 0.2971031, 0.02829312, 0, 0, 0, 1, 1,
0.416874, -1.233284, 3.29664, 0, 0, 0, 1, 1,
0.4193053, 0.2744546, 1.344463, 0, 0, 0, 1, 1,
0.4211408, -1.295408, 3.349335, 0, 0, 0, 1, 1,
0.427829, -0.8555405, 2.208257, 0, 0, 0, 1, 1,
0.4281104, 0.220733, 1.45506, 0, 0, 0, 1, 1,
0.4286478, -0.8395779, 1.47987, 1, 1, 1, 1, 1,
0.4293803, -1.538423, 2.365231, 1, 1, 1, 1, 1,
0.4302694, -0.6567415, 3.860953, 1, 1, 1, 1, 1,
0.430427, 0.5116605, 0.4873534, 1, 1, 1, 1, 1,
0.430626, -0.838972, 3.00895, 1, 1, 1, 1, 1,
0.4315655, -2.323701, 2.124247, 1, 1, 1, 1, 1,
0.4342196, -1.320617, 3.134588, 1, 1, 1, 1, 1,
0.4342292, 1.919258, -0.2308473, 1, 1, 1, 1, 1,
0.4418381, 1.633867, 2.394443, 1, 1, 1, 1, 1,
0.4456349, 1.8086, 0.4858501, 1, 1, 1, 1, 1,
0.4582416, 0.4937267, -1.540692, 1, 1, 1, 1, 1,
0.4590935, 1.769949, 1.842415, 1, 1, 1, 1, 1,
0.4596762, 0.9291239, 0.8656095, 1, 1, 1, 1, 1,
0.4599811, -0.9144495, 1.681981, 1, 1, 1, 1, 1,
0.4626544, 0.7044813, 1.249593, 1, 1, 1, 1, 1,
0.4632682, -0.458022, 1.821777, 0, 0, 1, 1, 1,
0.4653235, -1.09341, 1.887383, 1, 0, 0, 1, 1,
0.4660659, 0.6927119, 1.991692, 1, 0, 0, 1, 1,
0.4666201, 0.6062453, -1.331328, 1, 0, 0, 1, 1,
0.4676339, 0.3960443, 1.307496, 1, 0, 0, 1, 1,
0.4680045, -1.426256, 1.488166, 1, 0, 0, 1, 1,
0.4691213, 1.072015, 0.01905301, 0, 0, 0, 1, 1,
0.4742174, 1.205744, 0.9523356, 0, 0, 0, 1, 1,
0.479472, 0.08831531, 1.658796, 0, 0, 0, 1, 1,
0.4810537, 0.1574443, 1.151841, 0, 0, 0, 1, 1,
0.4833501, 0.8538551, 1.536651, 0, 0, 0, 1, 1,
0.4834738, -0.8317773, 2.839434, 0, 0, 0, 1, 1,
0.4869547, -0.484363, 4.074525, 0, 0, 0, 1, 1,
0.489152, -0.04885532, 2.520902, 1, 1, 1, 1, 1,
0.4971178, 1.32163, -0.06375515, 1, 1, 1, 1, 1,
0.4995901, 2.380894, 1.019716, 1, 1, 1, 1, 1,
0.5004407, 0.8972923, -0.8057438, 1, 1, 1, 1, 1,
0.5019632, 0.4028875, 2.758191, 1, 1, 1, 1, 1,
0.5153254, 1.21591, 0.9795309, 1, 1, 1, 1, 1,
0.5218063, -0.6778563, 1.855637, 1, 1, 1, 1, 1,
0.5244148, -1.532537, 1.918892, 1, 1, 1, 1, 1,
0.5254003, -1.125451, 2.805761, 1, 1, 1, 1, 1,
0.526353, -0.01544872, 1.030577, 1, 1, 1, 1, 1,
0.5276635, -0.968706, 0.6839079, 1, 1, 1, 1, 1,
0.528269, -0.3118627, 3.608895, 1, 1, 1, 1, 1,
0.5290409, -2.214965, 2.897519, 1, 1, 1, 1, 1,
0.5293308, 0.7213069, 1.253832, 1, 1, 1, 1, 1,
0.5311074, -0.3887163, 1.995378, 1, 1, 1, 1, 1,
0.5380473, 0.715859, 1.402868, 0, 0, 1, 1, 1,
0.5432385, -1.266649, 3.097272, 1, 0, 0, 1, 1,
0.5448301, 0.4079618, -0.4192895, 1, 0, 0, 1, 1,
0.5584744, -1.018053, 2.77067, 1, 0, 0, 1, 1,
0.5642389, -0.1288441, 0.8366198, 1, 0, 0, 1, 1,
0.5700089, -0.2292638, 3.185422, 1, 0, 0, 1, 1,
0.5718488, -0.5095001, 5.486999, 0, 0, 0, 1, 1,
0.575088, 1.472456, 2.005181, 0, 0, 0, 1, 1,
0.5753859, -0.5598937, 1.445815, 0, 0, 0, 1, 1,
0.5768328, 0.3868963, 1.268969, 0, 0, 0, 1, 1,
0.5790915, -0.5817888, 1.852089, 0, 0, 0, 1, 1,
0.5814679, 0.5676615, 1.485922, 0, 0, 0, 1, 1,
0.5815324, 2.447023, -0.01294714, 0, 0, 0, 1, 1,
0.5831546, 0.1209274, 0.9289324, 1, 1, 1, 1, 1,
0.5840738, 0.2923353, 2.364839, 1, 1, 1, 1, 1,
0.5862135, -0.8117451, 2.211307, 1, 1, 1, 1, 1,
0.5867297, -0.7815606, 3.112892, 1, 1, 1, 1, 1,
0.5903409, 0.8721325, 0.494891, 1, 1, 1, 1, 1,
0.5955439, 2.605798, 0.5279254, 1, 1, 1, 1, 1,
0.5993333, -0.4005097, 3.34675, 1, 1, 1, 1, 1,
0.6001931, 2.022122, 0.3111803, 1, 1, 1, 1, 1,
0.6039066, -0.1931268, 2.336765, 1, 1, 1, 1, 1,
0.6042849, 0.206204, 0.6196622, 1, 1, 1, 1, 1,
0.6044378, 0.3627354, -0.2991263, 1, 1, 1, 1, 1,
0.6061739, 0.2673053, 1.840596, 1, 1, 1, 1, 1,
0.6098766, -0.09866201, 1.827388, 1, 1, 1, 1, 1,
0.6143723, 1.106957, 0.5695143, 1, 1, 1, 1, 1,
0.6153808, -1.089056, 1.812061, 1, 1, 1, 1, 1,
0.6196325, 1.639774, 2.269675, 0, 0, 1, 1, 1,
0.6253417, 0.1528028, 2.297157, 1, 0, 0, 1, 1,
0.630531, 0.3825173, 0.4148104, 1, 0, 0, 1, 1,
0.6335748, 1.261936, -0.005714246, 1, 0, 0, 1, 1,
0.633878, -1.584777, 1.990468, 1, 0, 0, 1, 1,
0.6435223, -0.2717356, 2.031964, 1, 0, 0, 1, 1,
0.6457586, 0.2747121, 1.255694, 0, 0, 0, 1, 1,
0.649628, -0.4189285, 0.8924687, 0, 0, 0, 1, 1,
0.6496766, 1.388679, 0.6222304, 0, 0, 0, 1, 1,
0.6526259, 0.5488668, 1.855682, 0, 0, 0, 1, 1,
0.6566912, -0.9485725, 4.923478, 0, 0, 0, 1, 1,
0.6591936, -0.52965, 1.850595, 0, 0, 0, 1, 1,
0.6600333, 0.390013, 0.6705806, 0, 0, 0, 1, 1,
0.6666393, 0.172767, 0.3274768, 1, 1, 1, 1, 1,
0.6730076, -0.3546333, 1.648919, 1, 1, 1, 1, 1,
0.6742254, -1.134706, 3.077143, 1, 1, 1, 1, 1,
0.6856695, -0.2058264, 2.207677, 1, 1, 1, 1, 1,
0.6863887, -0.7890296, 3.024348, 1, 1, 1, 1, 1,
0.6974081, 0.1737213, 1.368085, 1, 1, 1, 1, 1,
0.699548, 0.3803032, 0.7781717, 1, 1, 1, 1, 1,
0.7069719, 0.6652215, 0.9787293, 1, 1, 1, 1, 1,
0.7070289, -0.8097969, 0.847308, 1, 1, 1, 1, 1,
0.7072474, -1.69467, 2.913412, 1, 1, 1, 1, 1,
0.7156653, -0.6711194, 1.622391, 1, 1, 1, 1, 1,
0.7162659, -0.001149747, 3.586926, 1, 1, 1, 1, 1,
0.7205433, -1.450391, 2.295562, 1, 1, 1, 1, 1,
0.7222148, 0.3300505, -1.038013, 1, 1, 1, 1, 1,
0.7232501, 2.107031, -2.534225, 1, 1, 1, 1, 1,
0.7237496, 1.034706, 1.36998, 0, 0, 1, 1, 1,
0.7251046, 0.237347, 2.001232, 1, 0, 0, 1, 1,
0.7273358, -2.499617, 3.151095, 1, 0, 0, 1, 1,
0.7346271, 0.2521405, 0.3674546, 1, 0, 0, 1, 1,
0.7394257, 0.9813862, 2.005826, 1, 0, 0, 1, 1,
0.7454825, -0.4200422, 2.553827, 1, 0, 0, 1, 1,
0.7458879, 0.2144456, -0.9074396, 0, 0, 0, 1, 1,
0.7503958, 0.4204777, 0.004146372, 0, 0, 0, 1, 1,
0.7508557, 0.5186945, -0.2089319, 0, 0, 0, 1, 1,
0.7574298, 0.3553398, 0.1198892, 0, 0, 0, 1, 1,
0.7616419, 0.7559404, 0.818539, 0, 0, 0, 1, 1,
0.7638727, -0.3974743, 0.3605151, 0, 0, 0, 1, 1,
0.7642139, 1.877409, 1.212627, 0, 0, 0, 1, 1,
0.7648392, 1.483935, -0.02313414, 1, 1, 1, 1, 1,
0.7662926, 0.437249, 0.4886087, 1, 1, 1, 1, 1,
0.7714505, -0.5562022, 1.458845, 1, 1, 1, 1, 1,
0.773972, 0.3877929, 0.5197411, 1, 1, 1, 1, 1,
0.7742212, -0.06098408, 2.828885, 1, 1, 1, 1, 1,
0.7747762, 0.05814971, 1.819254, 1, 1, 1, 1, 1,
0.7755487, -0.1166756, 2.572435, 1, 1, 1, 1, 1,
0.7798204, -0.2813123, 0.817095, 1, 1, 1, 1, 1,
0.7802675, -0.08765596, 3.894616, 1, 1, 1, 1, 1,
0.7838366, 0.4760506, 2.377152, 1, 1, 1, 1, 1,
0.7859995, -1.384632, 2.102601, 1, 1, 1, 1, 1,
0.7880651, -0.9290713, 3.666318, 1, 1, 1, 1, 1,
0.7920931, 0.2928244, 2.288827, 1, 1, 1, 1, 1,
0.7925984, -2.077452, 3.457853, 1, 1, 1, 1, 1,
0.8026363, -1.138052, 1.67408, 1, 1, 1, 1, 1,
0.8133264, -0.7651886, 3.618287, 0, 0, 1, 1, 1,
0.8143808, -1.818957, 2.723313, 1, 0, 0, 1, 1,
0.8174016, 0.4623437, 1.632151, 1, 0, 0, 1, 1,
0.8189507, -0.6556751, 2.034912, 1, 0, 0, 1, 1,
0.8337694, 0.1499147, 1.316929, 1, 0, 0, 1, 1,
0.835254, 0.8267127, 0.1785736, 1, 0, 0, 1, 1,
0.8361367, 0.3495727, 2.362792, 0, 0, 0, 1, 1,
0.8376208, -0.2442812, 1.103857, 0, 0, 0, 1, 1,
0.8426955, 1.919958, 0.5135738, 0, 0, 0, 1, 1,
0.8465615, 0.8014079, 0.4498138, 0, 0, 0, 1, 1,
0.8542536, -0.6863292, 2.678371, 0, 0, 0, 1, 1,
0.8558526, 0.6462663, -0.9814519, 0, 0, 0, 1, 1,
0.8688968, -0.1717044, 1.955988, 0, 0, 0, 1, 1,
0.8704177, -0.6621875, 3.287153, 1, 1, 1, 1, 1,
0.8714585, 1.343964, -1.553453, 1, 1, 1, 1, 1,
0.8727894, 0.8460659, 0.05922782, 1, 1, 1, 1, 1,
0.8746883, 0.4960659, 0.8749477, 1, 1, 1, 1, 1,
0.8781081, -1.232579, 2.076445, 1, 1, 1, 1, 1,
0.8831802, -1.811155, 4.437168, 1, 1, 1, 1, 1,
0.8868024, -0.5200893, 2.208846, 1, 1, 1, 1, 1,
0.8951753, -0.8437445, 1.365111, 1, 1, 1, 1, 1,
0.9020767, 1.936413, 0.9323688, 1, 1, 1, 1, 1,
0.9022564, 0.3371991, 1.180653, 1, 1, 1, 1, 1,
0.9029095, -0.205847, 2.072847, 1, 1, 1, 1, 1,
0.905624, 1.403416, -0.4254143, 1, 1, 1, 1, 1,
0.9098476, 0.5855266, 1.236151, 1, 1, 1, 1, 1,
0.9102935, 0.6251745, 0.7530105, 1, 1, 1, 1, 1,
0.9112868, 1.712924, 2.400806, 1, 1, 1, 1, 1,
0.9130903, -0.4825494, 1.325393, 0, 0, 1, 1, 1,
0.9141641, 0.1019055, 1.366058, 1, 0, 0, 1, 1,
0.9167344, -1.110784, 1.769552, 1, 0, 0, 1, 1,
0.9189735, -0.4320459, 0.3216048, 1, 0, 0, 1, 1,
0.9319872, -0.223125, 1.092535, 1, 0, 0, 1, 1,
0.9391741, -1.202787, 1.281188, 1, 0, 0, 1, 1,
0.939437, -0.3331032, 3.773446, 0, 0, 0, 1, 1,
0.943162, -0.469985, 3.439144, 0, 0, 0, 1, 1,
0.9434779, 0.5003849, -0.1184947, 0, 0, 0, 1, 1,
0.9493374, 0.5311, 2.801993, 0, 0, 0, 1, 1,
0.9501798, 0.2184345, 1.989814, 0, 0, 0, 1, 1,
0.9527277, -1.332754, 0.8678678, 0, 0, 0, 1, 1,
0.9534796, 0.3474126, 1.253403, 0, 0, 0, 1, 1,
0.956252, 0.9711727, 1.338353, 1, 1, 1, 1, 1,
0.9604701, 0.5381501, 1.01002, 1, 1, 1, 1, 1,
0.9617724, -0.4649822, 2.138021, 1, 1, 1, 1, 1,
0.9708252, -1.407672, 0.7887869, 1, 1, 1, 1, 1,
0.9780398, 1.030756, 0.1884588, 1, 1, 1, 1, 1,
0.989372, -1.252371, 3.240754, 1, 1, 1, 1, 1,
0.9903588, -0.02951947, 0.9426743, 1, 1, 1, 1, 1,
0.9942662, -0.04911548, 0.8677551, 1, 1, 1, 1, 1,
0.9981456, 1.046886, 0.6798517, 1, 1, 1, 1, 1,
1.006665, -0.4767225, 1.808895, 1, 1, 1, 1, 1,
1.011561, -0.4660103, 0.09990043, 1, 1, 1, 1, 1,
1.02413, -0.1104105, 1.466651, 1, 1, 1, 1, 1,
1.025151, -1.965521, 3.110008, 1, 1, 1, 1, 1,
1.02538, 0.2589334, 1.307532, 1, 1, 1, 1, 1,
1.031709, -0.6390938, 3.259361, 1, 1, 1, 1, 1,
1.031837, 1.372226, 0.1768276, 0, 0, 1, 1, 1,
1.042579, 0.555058, 1.065794, 1, 0, 0, 1, 1,
1.04518, 0.3475677, -0.001697773, 1, 0, 0, 1, 1,
1.045739, -0.4243107, 1.659397, 1, 0, 0, 1, 1,
1.047553, -0.232006, 1.877209, 1, 0, 0, 1, 1,
1.049551, -0.4114944, 1.878453, 1, 0, 0, 1, 1,
1.056243, 0.06080554, 1.038216, 0, 0, 0, 1, 1,
1.05787, -0.227704, 3.855412, 0, 0, 0, 1, 1,
1.079728, 0.6718608, 0.9705715, 0, 0, 0, 1, 1,
1.088958, -1.595369, 4.09745, 0, 0, 0, 1, 1,
1.090768, -0.4074787, 3.152515, 0, 0, 0, 1, 1,
1.09356, 1.002391, 1.437761, 0, 0, 0, 1, 1,
1.119768, 0.3256644, 0.7763813, 0, 0, 0, 1, 1,
1.121276, -1.946878, 2.136369, 1, 1, 1, 1, 1,
1.123932, 1.772471, -1.047491, 1, 1, 1, 1, 1,
1.133621, -0.0570882, 0.1175041, 1, 1, 1, 1, 1,
1.143013, -1.202519, 0.7635928, 1, 1, 1, 1, 1,
1.143113, -0.713083, 1.24919, 1, 1, 1, 1, 1,
1.153058, 0.05516496, 2.808468, 1, 1, 1, 1, 1,
1.159576, 1.018883, 0.9954427, 1, 1, 1, 1, 1,
1.163364, -1.619841, 2.232746, 1, 1, 1, 1, 1,
1.164682, -1.080368, 4.183258, 1, 1, 1, 1, 1,
1.172272, -1.423414, 3.998867, 1, 1, 1, 1, 1,
1.193421, -0.7495131, 3.435479, 1, 1, 1, 1, 1,
1.203116, -1.308437, 1.406185, 1, 1, 1, 1, 1,
1.213186, 0.41118, 1.679296, 1, 1, 1, 1, 1,
1.21601, -0.4162151, 1.661716, 1, 1, 1, 1, 1,
1.220527, 2.277926, 0.3542501, 1, 1, 1, 1, 1,
1.221557, -0.4573169, 3.278094, 0, 0, 1, 1, 1,
1.223829, -0.2914551, 0.6688961, 1, 0, 0, 1, 1,
1.225735, 1.559605, 1.482001, 1, 0, 0, 1, 1,
1.231069, 0.5782616, -0.4851953, 1, 0, 0, 1, 1,
1.232008, 0.3418635, 0.8477309, 1, 0, 0, 1, 1,
1.235901, -0.8588547, 1.472676, 1, 0, 0, 1, 1,
1.238813, -0.9454972, 2.564729, 0, 0, 0, 1, 1,
1.23967, -0.5471382, 1.517225, 0, 0, 0, 1, 1,
1.244891, -0.06306058, 1.56577, 0, 0, 0, 1, 1,
1.25003, -0.1172399, 1.350716, 0, 0, 0, 1, 1,
1.25242, -0.9037464, 3.160134, 0, 0, 0, 1, 1,
1.255065, -0.6399006, 1.526001, 0, 0, 0, 1, 1,
1.264523, 1.987381, 0.6758196, 0, 0, 0, 1, 1,
1.272172, 1.121222, -0.1347768, 1, 1, 1, 1, 1,
1.275449, -0.3921887, 1.787326, 1, 1, 1, 1, 1,
1.287824, -0.06748085, 2.143378, 1, 1, 1, 1, 1,
1.307953, 0.115044, 3.094572, 1, 1, 1, 1, 1,
1.322247, -0.2620213, 2.252781, 1, 1, 1, 1, 1,
1.3228, -1.401845, 0.644905, 1, 1, 1, 1, 1,
1.329015, -0.9688398, 2.527798, 1, 1, 1, 1, 1,
1.330943, -1.907467, 1.62778, 1, 1, 1, 1, 1,
1.351257, 0.5326648, 1.455929, 1, 1, 1, 1, 1,
1.369088, 1.061758, 2.052646, 1, 1, 1, 1, 1,
1.373195, 0.6624313, 0.9289771, 1, 1, 1, 1, 1,
1.37739, -0.4713384, 2.998306, 1, 1, 1, 1, 1,
1.384606, 1.580867, 0.1199882, 1, 1, 1, 1, 1,
1.386143, -1.342852, 0.4175568, 1, 1, 1, 1, 1,
1.401099, 1.91127, 0.04454046, 1, 1, 1, 1, 1,
1.401608, -0.140249, 1.325049, 0, 0, 1, 1, 1,
1.407491, -0.7942522, 2.872242, 1, 0, 0, 1, 1,
1.407901, 1.119636, 1.09839, 1, 0, 0, 1, 1,
1.410166, 0.284503, 2.349528, 1, 0, 0, 1, 1,
1.413576, 0.34719, 1.342794, 1, 0, 0, 1, 1,
1.425428, 2.527977, 1.31928, 1, 0, 0, 1, 1,
1.433528, -0.2233739, 1.655949, 0, 0, 0, 1, 1,
1.44173, 0.7339405, 2.807858, 0, 0, 0, 1, 1,
1.447037, -1.704934, 4.035491, 0, 0, 0, 1, 1,
1.455496, 2.137577, 0.7685448, 0, 0, 0, 1, 1,
1.457488, -1.41564, 1.867239, 0, 0, 0, 1, 1,
1.472561, 1.696961, 1.370103, 0, 0, 0, 1, 1,
1.483313, 0.452593, 1.484592, 0, 0, 0, 1, 1,
1.485082, 0.3781646, 0.4453324, 1, 1, 1, 1, 1,
1.494594, -0.6564295, 2.215637, 1, 1, 1, 1, 1,
1.516335, -1.052353, 1.017647, 1, 1, 1, 1, 1,
1.518598, -1.290584, 2.150809, 1, 1, 1, 1, 1,
1.52911, -1.319495, 3.823955, 1, 1, 1, 1, 1,
1.548106, -0.00372424, 1.845724, 1, 1, 1, 1, 1,
1.556949, 1.498409, 0.7569212, 1, 1, 1, 1, 1,
1.558097, 0.07344575, 2.02057, 1, 1, 1, 1, 1,
1.575289, 0.7434798, 0.8185596, 1, 1, 1, 1, 1,
1.589115, -0.7631727, 1.510723, 1, 1, 1, 1, 1,
1.599537, -1.043033, 2.135377, 1, 1, 1, 1, 1,
1.610982, -0.0120663, 1.89107, 1, 1, 1, 1, 1,
1.625193, -0.0936643, 1.660695, 1, 1, 1, 1, 1,
1.650174, 0.5562676, 2.185706, 1, 1, 1, 1, 1,
1.654432, 0.425653, 1.071856, 1, 1, 1, 1, 1,
1.656474, -0.2668595, 0.3512227, 0, 0, 1, 1, 1,
1.65712, 1.483978, 0.4629596, 1, 0, 0, 1, 1,
1.665707, 1.686786, 1.175615, 1, 0, 0, 1, 1,
1.666779, -1.451885, 0.6580383, 1, 0, 0, 1, 1,
1.674125, 1.224806, 2.121097, 1, 0, 0, 1, 1,
1.690011, 0.4425982, -0.5623299, 1, 0, 0, 1, 1,
1.714779, -0.7793227, 1.017494, 0, 0, 0, 1, 1,
1.716423, 0.1950423, 3.120208, 0, 0, 0, 1, 1,
1.721234, 1.523716, 1.111417, 0, 0, 0, 1, 1,
1.727829, -1.353205, 2.833133, 0, 0, 0, 1, 1,
1.758011, 1.527249, 2.431607, 0, 0, 0, 1, 1,
1.764129, 1.255872, 0.9151934, 0, 0, 0, 1, 1,
1.765052, -0.7004755, 0.9220865, 0, 0, 0, 1, 1,
1.77695, -1.463795, 2.545886, 1, 1, 1, 1, 1,
1.793082, 0.6513568, 1.418529, 1, 1, 1, 1, 1,
1.795895, 0.2175943, 0.14148, 1, 1, 1, 1, 1,
1.81023, -0.7546886, 1.292539, 1, 1, 1, 1, 1,
1.810893, 0.1851326, 1.361331, 1, 1, 1, 1, 1,
1.825966, 0.2642697, 0.7500483, 1, 1, 1, 1, 1,
1.836607, -1.145964, 1.786821, 1, 1, 1, 1, 1,
1.859863, -1.307429, 3.641113, 1, 1, 1, 1, 1,
1.863006, -0.416349, 1.647039, 1, 1, 1, 1, 1,
1.876312, -0.1296275, 0.50261, 1, 1, 1, 1, 1,
1.892296, 1.694391, -0.541886, 1, 1, 1, 1, 1,
1.949699, -0.6425695, -0.06244904, 1, 1, 1, 1, 1,
1.97274, 1.061263, -0.3454735, 1, 1, 1, 1, 1,
1.984691, 0.4781998, -0.2488299, 1, 1, 1, 1, 1,
2.011485, -1.780863, 1.992536, 1, 1, 1, 1, 1,
2.039439, -0.2446862, 1.014624, 0, 0, 1, 1, 1,
2.041536, -0.2214523, 2.199446, 1, 0, 0, 1, 1,
2.100966, 0.1315607, -0.01412929, 1, 0, 0, 1, 1,
2.146766, 1.077807, -0.5143805, 1, 0, 0, 1, 1,
2.157917, -1.255772, 1.425123, 1, 0, 0, 1, 1,
2.203865, -1.238996, 3.546765, 1, 0, 0, 1, 1,
2.23381, -0.2619952, 2.336403, 0, 0, 0, 1, 1,
2.353926, 2.083426, 0.03665349, 0, 0, 0, 1, 1,
2.376615, 2.348221, 0.01895639, 0, 0, 0, 1, 1,
2.420037, -1.038612, 2.429853, 0, 0, 0, 1, 1,
2.448208, 1.379768, 1.579046, 0, 0, 0, 1, 1,
2.486318, 0.08199491, 1.62205, 0, 0, 0, 1, 1,
2.498893, 1.400976, 0.5529125, 0, 0, 0, 1, 1,
2.50728, -0.0876563, 1.545545, 1, 1, 1, 1, 1,
2.510336, 1.570844, 2.852292, 1, 1, 1, 1, 1,
2.562422, -0.232705, 1.053411, 1, 1, 1, 1, 1,
2.844578, -0.3705526, 3.055516, 1, 1, 1, 1, 1,
2.95925, 0.2673462, -0.3771864, 1, 1, 1, 1, 1,
3.295203, 0.6804215, 1.408261, 1, 1, 1, 1, 1,
3.322574, -0.8198217, 0.8089721, 1, 1, 1, 1, 1
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
var radius = 9.778603;
var distance = 34.34693;
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
mvMatrix.translate( -0.2877034, -0.2059007, 0.1507285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.34693);
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