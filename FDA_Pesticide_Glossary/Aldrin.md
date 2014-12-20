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
-2.87961, 0.1516062, -0.7487326, 1, 0, 0, 1,
-2.741281, -1.620487, -2.673143, 1, 0.007843138, 0, 1,
-2.716765, -0.3386986, -1.006241, 1, 0.01176471, 0, 1,
-2.705918, 1.889192, 0.6533644, 1, 0.01960784, 0, 1,
-2.649381, 0.1645271, -2.046285, 1, 0.02352941, 0, 1,
-2.540907, -0.2996918, -0.106572, 1, 0.03137255, 0, 1,
-2.53861, -0.5428739, -2.794073, 1, 0.03529412, 0, 1,
-2.53391, -1.06112, -2.906231, 1, 0.04313726, 0, 1,
-2.473467, 0.6262829, -1.77997, 1, 0.04705882, 0, 1,
-2.472188, 0.5628561, -1.749751, 1, 0.05490196, 0, 1,
-2.318347, -0.8350866, -3.295323, 1, 0.05882353, 0, 1,
-2.279544, -1.159131, -2.694206, 1, 0.06666667, 0, 1,
-2.247433, -0.658645, -1.122438, 1, 0.07058824, 0, 1,
-2.238364, -1.039971, -2.548411, 1, 0.07843138, 0, 1,
-2.217764, 0.6303703, -0.3833253, 1, 0.08235294, 0, 1,
-2.170847, -0.5229549, -1.625712, 1, 0.09019608, 0, 1,
-2.149001, 0.3467975, -1.759571, 1, 0.09411765, 0, 1,
-2.148207, 0.2672766, 0.908604, 1, 0.1019608, 0, 1,
-2.1365, -1.105889, -1.15487, 1, 0.1098039, 0, 1,
-2.043153, 0.4187493, 0.2057903, 1, 0.1137255, 0, 1,
-1.993968, -0.1073989, -1.310533, 1, 0.1215686, 0, 1,
-1.978339, -0.7204455, -0.6111605, 1, 0.1254902, 0, 1,
-1.972854, -0.09068917, -2.823799, 1, 0.1333333, 0, 1,
-1.961045, -0.6204521, -1.689731, 1, 0.1372549, 0, 1,
-1.953525, -0.6961623, -0.4170082, 1, 0.145098, 0, 1,
-1.939031, -0.2217433, -0.444792, 1, 0.1490196, 0, 1,
-1.880464, -0.5127051, -3.025239, 1, 0.1568628, 0, 1,
-1.855625, -0.1181148, -1.329493, 1, 0.1607843, 0, 1,
-1.848495, 0.4179517, -0.8311542, 1, 0.1686275, 0, 1,
-1.811796, 0.2213043, -2.251869, 1, 0.172549, 0, 1,
-1.807601, 0.846625, -0.7247855, 1, 0.1803922, 0, 1,
-1.801885, 0.3756229, -2.077083, 1, 0.1843137, 0, 1,
-1.80092, -0.3830608, -0.9464108, 1, 0.1921569, 0, 1,
-1.798985, -0.08921229, -1.098669, 1, 0.1960784, 0, 1,
-1.798804, 1.243652, -0.4659425, 1, 0.2039216, 0, 1,
-1.793577, 0.796728, 0.6075705, 1, 0.2117647, 0, 1,
-1.786517, -0.3903013, -1.743695, 1, 0.2156863, 0, 1,
-1.766613, 0.5336658, -1.464258, 1, 0.2235294, 0, 1,
-1.763004, 0.370043, -0.5277669, 1, 0.227451, 0, 1,
-1.760864, 1.444895, 0.7899406, 1, 0.2352941, 0, 1,
-1.744438, 0.08716682, -1.814, 1, 0.2392157, 0, 1,
-1.740029, -0.216455, -1.529372, 1, 0.2470588, 0, 1,
-1.739774, -0.3404847, -3.196411, 1, 0.2509804, 0, 1,
-1.737063, -0.1093158, -1.527382, 1, 0.2588235, 0, 1,
-1.7354, -0.6016813, -2.730344, 1, 0.2627451, 0, 1,
-1.730116, 1.682459, -0.2348346, 1, 0.2705882, 0, 1,
-1.729017, 0.8278276, 0.08912233, 1, 0.2745098, 0, 1,
-1.713659, 0.5819716, -0.2730702, 1, 0.282353, 0, 1,
-1.709738, 0.2217922, -0.4023081, 1, 0.2862745, 0, 1,
-1.706747, -0.6414477, -1.898789, 1, 0.2941177, 0, 1,
-1.693507, 0.4865286, -0.5441022, 1, 0.3019608, 0, 1,
-1.686986, 0.3131186, -1.976017, 1, 0.3058824, 0, 1,
-1.672689, -0.6439677, -2.024537, 1, 0.3137255, 0, 1,
-1.670298, 0.2078866, -2.035504, 1, 0.3176471, 0, 1,
-1.665647, 2.042217, 0.3578959, 1, 0.3254902, 0, 1,
-1.663797, -0.06935095, -1.554991, 1, 0.3294118, 0, 1,
-1.659769, 0.1853819, -1.271692, 1, 0.3372549, 0, 1,
-1.657809, 0.7706643, -1.389965, 1, 0.3411765, 0, 1,
-1.6493, -0.7627476, -2.926327, 1, 0.3490196, 0, 1,
-1.626972, 1.920566, -0.4344098, 1, 0.3529412, 0, 1,
-1.613894, -0.3449917, -0.9331738, 1, 0.3607843, 0, 1,
-1.609238, -0.7906247, -0.9851473, 1, 0.3647059, 0, 1,
-1.604466, -0.2034306, -0.443494, 1, 0.372549, 0, 1,
-1.604214, 0.1436026, -2.927617, 1, 0.3764706, 0, 1,
-1.589823, 0.09472818, -1.258453, 1, 0.3843137, 0, 1,
-1.576812, 2.42624, -0.5616915, 1, 0.3882353, 0, 1,
-1.554606, -0.603191, -1.635482, 1, 0.3960784, 0, 1,
-1.546387, 0.5893279, -2.277102, 1, 0.4039216, 0, 1,
-1.546214, 0.01977673, -0.495869, 1, 0.4078431, 0, 1,
-1.543596, -0.106503, -0.8201906, 1, 0.4156863, 0, 1,
-1.531119, -0.9244911, -3.137125, 1, 0.4196078, 0, 1,
-1.530514, 0.7689143, -0.9446999, 1, 0.427451, 0, 1,
-1.528116, -0.9692427, -2.566287, 1, 0.4313726, 0, 1,
-1.526752, -0.3108959, -3.167698, 1, 0.4392157, 0, 1,
-1.513086, 0.1156141, -1.346993, 1, 0.4431373, 0, 1,
-1.511186, -0.7028919, -0.1913796, 1, 0.4509804, 0, 1,
-1.504209, -0.5528944, -0.8734033, 1, 0.454902, 0, 1,
-1.497552, -0.8614226, -2.158583, 1, 0.4627451, 0, 1,
-1.495503, -0.04987875, -1.135895, 1, 0.4666667, 0, 1,
-1.47972, 1.302073, 0.4224875, 1, 0.4745098, 0, 1,
-1.475921, 0.2093292, -0.1730394, 1, 0.4784314, 0, 1,
-1.474757, 0.4355522, 0.0005686613, 1, 0.4862745, 0, 1,
-1.460366, -1.937635, -3.957229, 1, 0.4901961, 0, 1,
-1.457812, -1.749063, -2.373166, 1, 0.4980392, 0, 1,
-1.455391, -1.040245, -1.293067, 1, 0.5058824, 0, 1,
-1.45239, -1.176643, -3.004539, 1, 0.509804, 0, 1,
-1.452237, -0.8927535, -1.343111, 1, 0.5176471, 0, 1,
-1.450313, 0.5383483, -1.164024, 1, 0.5215687, 0, 1,
-1.426086, -2.242313, -1.513786, 1, 0.5294118, 0, 1,
-1.405064, 1.236256, -1.439238, 1, 0.5333334, 0, 1,
-1.397375, -0.7997109, -1.478917, 1, 0.5411765, 0, 1,
-1.38935, 0.0307636, -1.600524, 1, 0.5450981, 0, 1,
-1.386938, 0.3172945, -0.8982611, 1, 0.5529412, 0, 1,
-1.380404, -0.4899372, -3.24774, 1, 0.5568628, 0, 1,
-1.379617, 1.396015, 0.3529814, 1, 0.5647059, 0, 1,
-1.373413, -0.8789631, -2.312342, 1, 0.5686275, 0, 1,
-1.372835, 0.4490627, -1.816769, 1, 0.5764706, 0, 1,
-1.366388, 0.9127486, -0.6841683, 1, 0.5803922, 0, 1,
-1.366359, -0.3336054, -1.530902, 1, 0.5882353, 0, 1,
-1.350301, -0.5911902, -1.377943, 1, 0.5921569, 0, 1,
-1.349327, 1.153271, 0.4971271, 1, 0.6, 0, 1,
-1.345979, -0.4163065, -1.774378, 1, 0.6078432, 0, 1,
-1.337063, -1.281939, -5.197176, 1, 0.6117647, 0, 1,
-1.335762, 1.075064, -1.033252, 1, 0.6196079, 0, 1,
-1.332096, -0.01914164, -0.2671986, 1, 0.6235294, 0, 1,
-1.330245, 0.90563, -0.2891447, 1, 0.6313726, 0, 1,
-1.327141, -1.075511, -0.4275323, 1, 0.6352941, 0, 1,
-1.32603, -0.01474369, -1.06606, 1, 0.6431373, 0, 1,
-1.316584, 0.1064812, -1.208878, 1, 0.6470588, 0, 1,
-1.31562, -0.9492764, -1.539976, 1, 0.654902, 0, 1,
-1.311086, -0.1643314, -2.692382, 1, 0.6588235, 0, 1,
-1.31075, 0.02987192, -1.796485, 1, 0.6666667, 0, 1,
-1.296441, 1.314094, -1.706683, 1, 0.6705883, 0, 1,
-1.287771, -0.7239932, -2.290572, 1, 0.6784314, 0, 1,
-1.272032, 1.616468, -0.7363991, 1, 0.682353, 0, 1,
-1.267835, 0.7170877, -0.4129337, 1, 0.6901961, 0, 1,
-1.266225, 0.02354113, -1.635954, 1, 0.6941177, 0, 1,
-1.26389, 0.3673332, -1.557253, 1, 0.7019608, 0, 1,
-1.260584, 1.131882, 0.3838105, 1, 0.7098039, 0, 1,
-1.251915, 1.598714, -0.5719728, 1, 0.7137255, 0, 1,
-1.248335, 0.6366087, -0.2338871, 1, 0.7215686, 0, 1,
-1.241525, 0.399336, -1.06752, 1, 0.7254902, 0, 1,
-1.239022, -1.93051, -2.218759, 1, 0.7333333, 0, 1,
-1.236388, 1.31476, 1.060985, 1, 0.7372549, 0, 1,
-1.236352, -0.1433701, -1.560633, 1, 0.7450981, 0, 1,
-1.227634, 1.665854, -1.509446, 1, 0.7490196, 0, 1,
-1.215434, -1.00959, -1.284311, 1, 0.7568628, 0, 1,
-1.20872, 0.7302406, -2.073625, 1, 0.7607843, 0, 1,
-1.206698, -0.9745579, -4.446897, 1, 0.7686275, 0, 1,
-1.20612, 0.7254007, -1.387191, 1, 0.772549, 0, 1,
-1.204906, -0.2700489, -0.5115067, 1, 0.7803922, 0, 1,
-1.202704, 0.07348076, -2.198473, 1, 0.7843137, 0, 1,
-1.201572, 0.5558426, -0.2713215, 1, 0.7921569, 0, 1,
-1.198245, -1.796041, -0.8286996, 1, 0.7960784, 0, 1,
-1.194765, 0.8911548, -1.879028, 1, 0.8039216, 0, 1,
-1.192953, 1.135188, -0.5455314, 1, 0.8117647, 0, 1,
-1.190359, 0.4392177, -1.919563, 1, 0.8156863, 0, 1,
-1.18818, -0.8146484, -2.036876, 1, 0.8235294, 0, 1,
-1.183849, 0.02139537, -1.019888, 1, 0.827451, 0, 1,
-1.173663, -0.8950697, -3.114425, 1, 0.8352941, 0, 1,
-1.16707, 0.7538976, -2.315902, 1, 0.8392157, 0, 1,
-1.166928, 0.04754124, -3.425646, 1, 0.8470588, 0, 1,
-1.16269, -0.09238195, -1.523943, 1, 0.8509804, 0, 1,
-1.159805, -0.9323919, -3.700301, 1, 0.8588235, 0, 1,
-1.159513, -1.47645, -1.90587, 1, 0.8627451, 0, 1,
-1.154124, 1.788676, -0.1653511, 1, 0.8705882, 0, 1,
-1.148789, 0.2294469, -2.754967, 1, 0.8745098, 0, 1,
-1.143761, -1.039545, -0.8989581, 1, 0.8823529, 0, 1,
-1.143442, -1.102733, -2.510965, 1, 0.8862745, 0, 1,
-1.142612, 0.1976909, -0.9554012, 1, 0.8941177, 0, 1,
-1.142122, -2.506418, -2.979704, 1, 0.8980392, 0, 1,
-1.137248, -0.1621962, -1.292107, 1, 0.9058824, 0, 1,
-1.129217, 3.09563, 0.3922034, 1, 0.9137255, 0, 1,
-1.124634, -0.7717162, -3.105172, 1, 0.9176471, 0, 1,
-1.117499, 0.3264166, -1.325156, 1, 0.9254902, 0, 1,
-1.112861, 1.53149, 0.7794016, 1, 0.9294118, 0, 1,
-1.112411, -0.06914459, -1.473925, 1, 0.9372549, 0, 1,
-1.096342, 0.1356503, -2.079348, 1, 0.9411765, 0, 1,
-1.094133, 0.3913556, -1.251535, 1, 0.9490196, 0, 1,
-1.090098, 0.675464, -1.888329, 1, 0.9529412, 0, 1,
-1.064807, -0.520424, -0.2358295, 1, 0.9607843, 0, 1,
-1.060584, 1.083793, -1.213651, 1, 0.9647059, 0, 1,
-1.053957, -1.118168, -2.180244, 1, 0.972549, 0, 1,
-1.052115, 1.454372, -0.4431367, 1, 0.9764706, 0, 1,
-1.052045, 1.761189, -0.8561182, 1, 0.9843137, 0, 1,
-1.050289, 1.082037, -0.1722253, 1, 0.9882353, 0, 1,
-1.048095, -0.9995546, -4.658034, 1, 0.9960784, 0, 1,
-1.044311, -0.1121872, -1.640067, 0.9960784, 1, 0, 1,
-1.041825, -0.3963234, -1.183517, 0.9921569, 1, 0, 1,
-1.030544, 1.028604, -0.6669642, 0.9843137, 1, 0, 1,
-1.026347, -0.1019872, -1.298778, 0.9803922, 1, 0, 1,
-1.023302, -1.1235, -1.792499, 0.972549, 1, 0, 1,
-1.020918, -0.9672852, -3.464738, 0.9686275, 1, 0, 1,
-1.019074, -0.4847888, -0.01080058, 0.9607843, 1, 0, 1,
-1.01877, -0.05310787, -2.187193, 0.9568627, 1, 0, 1,
-1.0172, 0.5233042, -0.6150001, 0.9490196, 1, 0, 1,
-1.004768, 1.020709, 0.03303713, 0.945098, 1, 0, 1,
-1.004251, -0.7545872, -2.77371, 0.9372549, 1, 0, 1,
-1.003527, -1.222969, -2.221971, 0.9333333, 1, 0, 1,
-0.998251, -0.04343378, -0.4265791, 0.9254902, 1, 0, 1,
-0.9970579, 0.9131902, -2.834631, 0.9215686, 1, 0, 1,
-0.9953239, -1.754015, -2.12931, 0.9137255, 1, 0, 1,
-0.9930649, -1.055428, -1.562766, 0.9098039, 1, 0, 1,
-0.9859371, 1.326141, -0.8384173, 0.9019608, 1, 0, 1,
-0.9720656, 0.8958405, -2.600822, 0.8941177, 1, 0, 1,
-0.9701324, -0.6049026, -1.644344, 0.8901961, 1, 0, 1,
-0.9602379, -1.571591, -1.14252, 0.8823529, 1, 0, 1,
-0.9467124, 1.191584, 0.2606941, 0.8784314, 1, 0, 1,
-0.9445238, -0.5689846, -1.774698, 0.8705882, 1, 0, 1,
-0.9379279, 0.7136531, -0.1316131, 0.8666667, 1, 0, 1,
-0.9364226, -1.953485, -3.85104, 0.8588235, 1, 0, 1,
-0.9350007, -0.8994507, -3.203666, 0.854902, 1, 0, 1,
-0.9262735, 0.3215274, 1.167738, 0.8470588, 1, 0, 1,
-0.9219369, 1.555148, -1.984965, 0.8431373, 1, 0, 1,
-0.920076, 2.535509, -1.456801, 0.8352941, 1, 0, 1,
-0.9158016, 1.226255, -1.981453, 0.8313726, 1, 0, 1,
-0.9157681, 0.802855, -1.261208, 0.8235294, 1, 0, 1,
-0.9082007, -0.1101791, -1.692267, 0.8196079, 1, 0, 1,
-0.906817, -0.9259724, -3.028224, 0.8117647, 1, 0, 1,
-0.9032126, 0.7784671, -1.097679, 0.8078431, 1, 0, 1,
-0.9026187, -0.508873, -1.984019, 0.8, 1, 0, 1,
-0.897859, -1.074119, -1.973199, 0.7921569, 1, 0, 1,
-0.8813707, 0.1968356, -0.6790088, 0.7882353, 1, 0, 1,
-0.8730093, -1.402947, -2.885667, 0.7803922, 1, 0, 1,
-0.8657043, 1.34163, -0.9896928, 0.7764706, 1, 0, 1,
-0.8612626, -1.12229, -1.140654, 0.7686275, 1, 0, 1,
-0.8604556, -0.6595352, -2.896049, 0.7647059, 1, 0, 1,
-0.8592898, 0.5896345, -2.190203, 0.7568628, 1, 0, 1,
-0.8550961, -1.686949, -3.420597, 0.7529412, 1, 0, 1,
-0.8535682, 0.4767124, -0.8398979, 0.7450981, 1, 0, 1,
-0.8358874, -0.3400574, -1.274289, 0.7411765, 1, 0, 1,
-0.8311639, 0.1717695, -2.294011, 0.7333333, 1, 0, 1,
-0.8300293, -0.321649, -1.351172, 0.7294118, 1, 0, 1,
-0.8296586, 0.4826343, -1.605545, 0.7215686, 1, 0, 1,
-0.8274562, -0.09008735, -1.438391, 0.7176471, 1, 0, 1,
-0.8271793, -1.011472, -2.561226, 0.7098039, 1, 0, 1,
-0.8244597, 0.3688232, -1.823486, 0.7058824, 1, 0, 1,
-0.82406, 0.4351527, 0.5303096, 0.6980392, 1, 0, 1,
-0.8155733, -0.5695469, -1.126944, 0.6901961, 1, 0, 1,
-0.8050931, 1.856536, -2.562378, 0.6862745, 1, 0, 1,
-0.7959202, -0.1306063, -2.651112, 0.6784314, 1, 0, 1,
-0.7931083, -0.07477511, -2.470163, 0.6745098, 1, 0, 1,
-0.7923894, 0.4773122, -0.664949, 0.6666667, 1, 0, 1,
-0.7890016, -0.1020432, -2.838181, 0.6627451, 1, 0, 1,
-0.7870935, -0.9778161, -3.765931, 0.654902, 1, 0, 1,
-0.7861888, -0.395118, -1.126931, 0.6509804, 1, 0, 1,
-0.7859291, -0.751496, -0.7907127, 0.6431373, 1, 0, 1,
-0.783549, 0.4498325, -0.2572478, 0.6392157, 1, 0, 1,
-0.7834791, -0.3631206, -1.876925, 0.6313726, 1, 0, 1,
-0.783309, -0.9714235, -1.972752, 0.627451, 1, 0, 1,
-0.7831705, 0.3081834, -0.04574214, 0.6196079, 1, 0, 1,
-0.7831205, -0.01336669, -0.907888, 0.6156863, 1, 0, 1,
-0.7811245, 0.3210407, -2.083413, 0.6078432, 1, 0, 1,
-0.7745033, -0.2711429, -0.9703766, 0.6039216, 1, 0, 1,
-0.7730008, -0.7553653, -1.677612, 0.5960785, 1, 0, 1,
-0.7706333, -0.8347626, -2.828022, 0.5882353, 1, 0, 1,
-0.7658479, -0.5273262, -2.519407, 0.5843138, 1, 0, 1,
-0.758141, 0.09998343, -2.930124, 0.5764706, 1, 0, 1,
-0.7528164, -1.553337, -3.609526, 0.572549, 1, 0, 1,
-0.7496087, 0.8654686, -2.153653, 0.5647059, 1, 0, 1,
-0.7454915, -0.6995575, -0.5877129, 0.5607843, 1, 0, 1,
-0.7454098, 1.961832, -0.5085195, 0.5529412, 1, 0, 1,
-0.7428477, -1.285527, -4.618388, 0.5490196, 1, 0, 1,
-0.7411479, 1.667263, 0.7136872, 0.5411765, 1, 0, 1,
-0.7350191, 0.654313, -0.9985341, 0.5372549, 1, 0, 1,
-0.7257182, -1.004421, -3.817095, 0.5294118, 1, 0, 1,
-0.7217106, 1.411222, -0.9231362, 0.5254902, 1, 0, 1,
-0.7175279, 0.867175, -0.9410594, 0.5176471, 1, 0, 1,
-0.7139816, 1.261373, -0.8676407, 0.5137255, 1, 0, 1,
-0.7135065, -0.0006871521, -1.18365, 0.5058824, 1, 0, 1,
-0.7116996, -0.6935341, -1.293588, 0.5019608, 1, 0, 1,
-0.7111683, 2.844941, -0.8773234, 0.4941176, 1, 0, 1,
-0.7042059, -1.405991, -4.279247, 0.4862745, 1, 0, 1,
-0.7032306, 0.5632167, 0.3279751, 0.4823529, 1, 0, 1,
-0.6989936, -0.1771389, -1.32397, 0.4745098, 1, 0, 1,
-0.6968486, -0.595121, -2.184311, 0.4705882, 1, 0, 1,
-0.6933941, -0.6427425, -2.999178, 0.4627451, 1, 0, 1,
-0.691029, 0.9342515, -2.04141, 0.4588235, 1, 0, 1,
-0.6879814, -0.9747766, -3.00597, 0.4509804, 1, 0, 1,
-0.6858081, 1.677677, 0.6367919, 0.4470588, 1, 0, 1,
-0.6857902, -0.02936281, -0.3335151, 0.4392157, 1, 0, 1,
-0.6813545, 1.32772, -0.2464453, 0.4352941, 1, 0, 1,
-0.6784385, -0.8014951, -1.752974, 0.427451, 1, 0, 1,
-0.6781184, -0.4143791, -3.87485, 0.4235294, 1, 0, 1,
-0.668457, 0.7671316, 0.01440156, 0.4156863, 1, 0, 1,
-0.6643607, 0.271119, -0.3849539, 0.4117647, 1, 0, 1,
-0.6615179, -0.1138842, -1.953384, 0.4039216, 1, 0, 1,
-0.6593038, -0.6509875, -3.375691, 0.3960784, 1, 0, 1,
-0.6579224, -0.8708314, -2.514901, 0.3921569, 1, 0, 1,
-0.651563, -0.3630691, -0.81419, 0.3843137, 1, 0, 1,
-0.6479321, 0.5473604, -2.167918, 0.3803922, 1, 0, 1,
-0.6468201, -0.8111404, -3.511972, 0.372549, 1, 0, 1,
-0.6461111, -1.69359, -3.40643, 0.3686275, 1, 0, 1,
-0.6454563, 0.4478213, -0.4760217, 0.3607843, 1, 0, 1,
-0.641435, 0.6213098, -0.8937337, 0.3568628, 1, 0, 1,
-0.6411386, -0.538121, -2.196547, 0.3490196, 1, 0, 1,
-0.6390738, -0.07338381, -0.6843953, 0.345098, 1, 0, 1,
-0.6384594, -0.3618771, -2.316158, 0.3372549, 1, 0, 1,
-0.6330506, -0.5552498, -1.610496, 0.3333333, 1, 0, 1,
-0.6295317, 0.2041824, -0.2064326, 0.3254902, 1, 0, 1,
-0.6256406, 0.6129109, -1.309822, 0.3215686, 1, 0, 1,
-0.6256217, 0.01475067, -0.1603873, 0.3137255, 1, 0, 1,
-0.6232932, 0.8882108, -1.12189, 0.3098039, 1, 0, 1,
-0.6205101, -1.762088, -3.567686, 0.3019608, 1, 0, 1,
-0.6181497, -0.2499977, -1.083937, 0.2941177, 1, 0, 1,
-0.6167799, -0.5065345, -1.440187, 0.2901961, 1, 0, 1,
-0.6142644, 1.005228, -1.292079, 0.282353, 1, 0, 1,
-0.611421, 1.38943, 0.03793585, 0.2784314, 1, 0, 1,
-0.610452, -2.10706, -3.659503, 0.2705882, 1, 0, 1,
-0.6072006, 0.3081226, -1.860773, 0.2666667, 1, 0, 1,
-0.600903, 0.2366786, -1.623773, 0.2588235, 1, 0, 1,
-0.6002464, 0.8376698, -2.192819, 0.254902, 1, 0, 1,
-0.5988477, -0.237021, -0.9362855, 0.2470588, 1, 0, 1,
-0.5980126, -0.00293797, -1.948305, 0.2431373, 1, 0, 1,
-0.5974922, -1.595232, -2.591955, 0.2352941, 1, 0, 1,
-0.5955921, 0.3812049, -1.451872, 0.2313726, 1, 0, 1,
-0.5945501, 1.333123, 0.7150709, 0.2235294, 1, 0, 1,
-0.592473, 0.2930185, -0.4194734, 0.2196078, 1, 0, 1,
-0.5846496, -2.048149, -2.83922, 0.2117647, 1, 0, 1,
-0.5831643, -0.7735788, -1.469736, 0.2078431, 1, 0, 1,
-0.5813559, 0.1688938, 0.3213386, 0.2, 1, 0, 1,
-0.5811379, -0.1117333, -1.30468, 0.1921569, 1, 0, 1,
-0.5777503, -0.2581288, -2.012952, 0.1882353, 1, 0, 1,
-0.5721529, 1.675611, 1.101923, 0.1803922, 1, 0, 1,
-0.5690778, 1.415783, 0.5094634, 0.1764706, 1, 0, 1,
-0.5631337, 0.2541578, -1.817564, 0.1686275, 1, 0, 1,
-0.5629143, 1.249892, 0.04473135, 0.1647059, 1, 0, 1,
-0.5554689, -0.6790241, -1.021266, 0.1568628, 1, 0, 1,
-0.5534981, -0.1548306, -2.17212, 0.1529412, 1, 0, 1,
-0.5525791, 0.6335396, 0.7882268, 0.145098, 1, 0, 1,
-0.5485405, 0.4482663, -0.2232951, 0.1411765, 1, 0, 1,
-0.548273, 0.4215406, 0.4528447, 0.1333333, 1, 0, 1,
-0.5403773, 0.5267209, -1.84595, 0.1294118, 1, 0, 1,
-0.5398856, -1.769234, -3.743549, 0.1215686, 1, 0, 1,
-0.5398198, 0.01544961, -0.9233174, 0.1176471, 1, 0, 1,
-0.5388376, -0.2720223, -0.4802943, 0.1098039, 1, 0, 1,
-0.538323, 0.7185341, -0.2412178, 0.1058824, 1, 0, 1,
-0.5380543, 1.577381, 0.441834, 0.09803922, 1, 0, 1,
-0.5363662, 1.77197, -1.089962, 0.09019608, 1, 0, 1,
-0.534212, -0.3140998, -3.119904, 0.08627451, 1, 0, 1,
-0.5306303, -0.399295, -2.032787, 0.07843138, 1, 0, 1,
-0.5304391, -0.1112607, -0.8351495, 0.07450981, 1, 0, 1,
-0.5290523, 0.675952, 1.595046, 0.06666667, 1, 0, 1,
-0.5251412, -0.4927872, -3.079697, 0.0627451, 1, 0, 1,
-0.5209348, 1.121106, -0.9677446, 0.05490196, 1, 0, 1,
-0.520836, 1.188356, -1.401447, 0.05098039, 1, 0, 1,
-0.5207004, 0.9327078, -1.014013, 0.04313726, 1, 0, 1,
-0.512693, -0.8659246, -3.140533, 0.03921569, 1, 0, 1,
-0.5119662, -0.2796294, -3.544822, 0.03137255, 1, 0, 1,
-0.5115277, 1.706593, -0.4505149, 0.02745098, 1, 0, 1,
-0.5092532, -1.92272, -3.778409, 0.01960784, 1, 0, 1,
-0.5034066, 0.06375811, -0.1263107, 0.01568628, 1, 0, 1,
-0.5030972, 1.741142, -0.1045077, 0.007843138, 1, 0, 1,
-0.5010856, 0.1930423, -0.6549448, 0.003921569, 1, 0, 1,
-0.4998662, -1.447247, -3.231637, 0, 1, 0.003921569, 1,
-0.4992511, 0.7812779, -2.079938, 0, 1, 0.01176471, 1,
-0.4969764, -0.4561313, -3.041731, 0, 1, 0.01568628, 1,
-0.4966328, -0.9945362, -2.699019, 0, 1, 0.02352941, 1,
-0.4960812, -1.354774, -3.633783, 0, 1, 0.02745098, 1,
-0.4943629, -0.3281767, -1.978001, 0, 1, 0.03529412, 1,
-0.4931985, 0.1742249, -2.420037, 0, 1, 0.03921569, 1,
-0.4823073, -0.3021351, -3.315887, 0, 1, 0.04705882, 1,
-0.4779911, -0.5880614, -0.984667, 0, 1, 0.05098039, 1,
-0.4688146, -1.09108, -4.148361, 0, 1, 0.05882353, 1,
-0.4646996, 0.6918457, 0.1817351, 0, 1, 0.0627451, 1,
-0.4645288, 0.1597535, -1.2516, 0, 1, 0.07058824, 1,
-0.4644415, 0.6675282, -0.5401268, 0, 1, 0.07450981, 1,
-0.4586436, 0.7159591, -1.463227, 0, 1, 0.08235294, 1,
-0.4579426, -0.07616851, -2.747927, 0, 1, 0.08627451, 1,
-0.4574198, 2.11605, -1.756627, 0, 1, 0.09411765, 1,
-0.4570163, -0.377694, -3.022628, 0, 1, 0.1019608, 1,
-0.4542345, 1.183154, 0.9883194, 0, 1, 0.1058824, 1,
-0.4541666, 1.304056, -0.04943557, 0, 1, 0.1137255, 1,
-0.4499117, -1.942119, -2.65818, 0, 1, 0.1176471, 1,
-0.4494789, -1.022103, -1.58712, 0, 1, 0.1254902, 1,
-0.4486181, -1.382599, -2.710446, 0, 1, 0.1294118, 1,
-0.444146, 0.8295968, -0.2513089, 0, 1, 0.1372549, 1,
-0.4423574, 0.1944472, -1.653556, 0, 1, 0.1411765, 1,
-0.4422897, -0.1872233, -1.236312, 0, 1, 0.1490196, 1,
-0.440298, 1.404966, -0.9244168, 0, 1, 0.1529412, 1,
-0.4386559, -0.7688774, -1.179331, 0, 1, 0.1607843, 1,
-0.4352894, -0.5337636, -2.056706, 0, 1, 0.1647059, 1,
-0.434312, 1.888239, -0.2068865, 0, 1, 0.172549, 1,
-0.4338623, -0.7138557, -4.354345, 0, 1, 0.1764706, 1,
-0.4325264, -0.6459804, -2.877233, 0, 1, 0.1843137, 1,
-0.4319494, 0.05507539, -2.129642, 0, 1, 0.1882353, 1,
-0.4297726, 0.3525423, -2.393376, 0, 1, 0.1960784, 1,
-0.4285842, 0.9208697, 1.236915, 0, 1, 0.2039216, 1,
-0.4230445, 0.960285, -0.4937964, 0, 1, 0.2078431, 1,
-0.4229145, 0.9495755, -1.364299, 0, 1, 0.2156863, 1,
-0.4174239, 1.081045, -0.4921859, 0, 1, 0.2196078, 1,
-0.4148677, -0.7755521, -2.980669, 0, 1, 0.227451, 1,
-0.4142553, 0.2347003, -0.4489917, 0, 1, 0.2313726, 1,
-0.4097263, -0.06210126, -1.086192, 0, 1, 0.2392157, 1,
-0.4084481, -0.4332933, -3.60107, 0, 1, 0.2431373, 1,
-0.4073181, 0.4042301, -0.5952159, 0, 1, 0.2509804, 1,
-0.4070584, 1.107125, -1.046269, 0, 1, 0.254902, 1,
-0.4055132, -1.248493, -2.057242, 0, 1, 0.2627451, 1,
-0.4039163, 0.368458, -3.584008, 0, 1, 0.2666667, 1,
-0.4037379, -0.8981465, -2.444759, 0, 1, 0.2745098, 1,
-0.4017442, 0.7343639, -1.063162, 0, 1, 0.2784314, 1,
-0.3955287, 0.2459271, -0.9047135, 0, 1, 0.2862745, 1,
-0.393756, -0.4148214, -3.595706, 0, 1, 0.2901961, 1,
-0.3886809, 0.3816011, -0.8155575, 0, 1, 0.2980392, 1,
-0.3866137, -0.3548658, -2.778167, 0, 1, 0.3058824, 1,
-0.3863889, 0.7580098, -1.106751, 0, 1, 0.3098039, 1,
-0.3743924, -0.9257995, -3.131908, 0, 1, 0.3176471, 1,
-0.3711222, 1.587171, -0.551706, 0, 1, 0.3215686, 1,
-0.3684433, -1.274871, -2.654373, 0, 1, 0.3294118, 1,
-0.3656412, -0.2669793, -3.358573, 0, 1, 0.3333333, 1,
-0.361645, -1.394204, -3.52558, 0, 1, 0.3411765, 1,
-0.3565032, -0.3474803, -3.721596, 0, 1, 0.345098, 1,
-0.3480921, -0.5586146, -4.720914, 0, 1, 0.3529412, 1,
-0.3453519, -1.626337, -3.118754, 0, 1, 0.3568628, 1,
-0.3441184, 0.2520477, -0.2950642, 0, 1, 0.3647059, 1,
-0.3438676, -1.762779, -3.241058, 0, 1, 0.3686275, 1,
-0.3430349, -0.1029628, -3.802177, 0, 1, 0.3764706, 1,
-0.3428774, -0.9288798, -2.614749, 0, 1, 0.3803922, 1,
-0.3408625, -1.028551, -2.346206, 0, 1, 0.3882353, 1,
-0.3405169, -0.1989828, -2.942639, 0, 1, 0.3921569, 1,
-0.3380382, 0.1896187, 0.2820067, 0, 1, 0.4, 1,
-0.3379003, 0.3070066, -2.920083, 0, 1, 0.4078431, 1,
-0.3365097, 0.5984338, -0.2949705, 0, 1, 0.4117647, 1,
-0.3354116, 0.05784954, -1.578671, 0, 1, 0.4196078, 1,
-0.3309028, 0.396786, -1.554439, 0, 1, 0.4235294, 1,
-0.3205294, -0.4403237, -2.449058, 0, 1, 0.4313726, 1,
-0.3198679, 0.8518998, 0.3999625, 0, 1, 0.4352941, 1,
-0.3188457, 0.6006564, -2.367925, 0, 1, 0.4431373, 1,
-0.3181344, 0.6169733, -1.244912, 0, 1, 0.4470588, 1,
-0.3135422, -1.608375, -4.236952, 0, 1, 0.454902, 1,
-0.3082583, 0.1198902, -2.478257, 0, 1, 0.4588235, 1,
-0.3000774, 1.000764, 1.635583, 0, 1, 0.4666667, 1,
-0.2993742, -0.4848997, -1.671513, 0, 1, 0.4705882, 1,
-0.2989934, 0.8678058, 0.1676526, 0, 1, 0.4784314, 1,
-0.2982388, -0.03313026, -0.804649, 0, 1, 0.4823529, 1,
-0.2960644, 0.3942989, 0.6132538, 0, 1, 0.4901961, 1,
-0.2946986, 1.208417, -1.97891, 0, 1, 0.4941176, 1,
-0.2897371, 1.438835, -0.4407009, 0, 1, 0.5019608, 1,
-0.2864349, 0.3067807, -1.176316, 0, 1, 0.509804, 1,
-0.2853824, 0.2110369, -0.2879569, 0, 1, 0.5137255, 1,
-0.2833767, 1.877207, -1.251846, 0, 1, 0.5215687, 1,
-0.2831675, -0.304186, -2.744885, 0, 1, 0.5254902, 1,
-0.2795931, -0.523811, -3.476901, 0, 1, 0.5333334, 1,
-0.2769246, 1.535275, 0.2645907, 0, 1, 0.5372549, 1,
-0.2754557, 0.6727566, 0.2823681, 0, 1, 0.5450981, 1,
-0.274318, 0.3784325, -0.5753701, 0, 1, 0.5490196, 1,
-0.270437, -0.3634997, -4.619677, 0, 1, 0.5568628, 1,
-0.2638765, -0.2165257, -1.940953, 0, 1, 0.5607843, 1,
-0.2624126, 1.68565, -1.528385, 0, 1, 0.5686275, 1,
-0.2620742, 1.056557, 0.4014028, 0, 1, 0.572549, 1,
-0.2562547, 0.779952, 0.3721417, 0, 1, 0.5803922, 1,
-0.2546042, -0.931552, -2.72588, 0, 1, 0.5843138, 1,
-0.2535291, 0.1789897, -2.51154, 0, 1, 0.5921569, 1,
-0.2532617, 0.7682143, -0.9473247, 0, 1, 0.5960785, 1,
-0.2531952, -0.7332542, -1.676212, 0, 1, 0.6039216, 1,
-0.246507, -0.837638, -2.349042, 0, 1, 0.6117647, 1,
-0.2411811, 0.1951364, -2.111216, 0, 1, 0.6156863, 1,
-0.2406057, 0.7002478, -0.05665204, 0, 1, 0.6235294, 1,
-0.2351314, 0.3972833, -0.677504, 0, 1, 0.627451, 1,
-0.2345748, -1.395893, -1.990431, 0, 1, 0.6352941, 1,
-0.2345249, -0.02479989, -1.008282, 0, 1, 0.6392157, 1,
-0.2311573, 0.1236821, -1.688514, 0, 1, 0.6470588, 1,
-0.2293542, 1.310487, -0.5766845, 0, 1, 0.6509804, 1,
-0.2289569, -2.222128, -3.720575, 0, 1, 0.6588235, 1,
-0.2256839, -0.2853226, -2.222513, 0, 1, 0.6627451, 1,
-0.2251615, 0.3275254, -0.7596747, 0, 1, 0.6705883, 1,
-0.2240222, -0.1524044, -3.363252, 0, 1, 0.6745098, 1,
-0.2225901, -2.023908, -2.088158, 0, 1, 0.682353, 1,
-0.2196707, -0.8081458, -1.658215, 0, 1, 0.6862745, 1,
-0.217652, 1.009669, -0.7148175, 0, 1, 0.6941177, 1,
-0.2108234, 0.3880633, 0.1498003, 0, 1, 0.7019608, 1,
-0.2107127, -0.7341194, -2.961158, 0, 1, 0.7058824, 1,
-0.203895, 1.477225, -0.3545355, 0, 1, 0.7137255, 1,
-0.2037072, -2.14783, -1.19785, 0, 1, 0.7176471, 1,
-0.2011587, 1.092009, 1.15794, 0, 1, 0.7254902, 1,
-0.1866311, -2.621008, -2.279019, 0, 1, 0.7294118, 1,
-0.1800357, -0.02914191, -2.709733, 0, 1, 0.7372549, 1,
-0.1782218, -0.6514664, -1.087749, 0, 1, 0.7411765, 1,
-0.1743532, 2.543286, -0.7513731, 0, 1, 0.7490196, 1,
-0.1692735, 0.1063454, -0.8235494, 0, 1, 0.7529412, 1,
-0.1651923, 1.079651, -0.7830055, 0, 1, 0.7607843, 1,
-0.163848, 0.230608, 0.3890069, 0, 1, 0.7647059, 1,
-0.1580393, -0.615553, -2.379093, 0, 1, 0.772549, 1,
-0.1547555, 1.818958, -1.468461, 0, 1, 0.7764706, 1,
-0.1513667, 0.5440268, -0.5833352, 0, 1, 0.7843137, 1,
-0.150648, 0.8460523, 0.993201, 0, 1, 0.7882353, 1,
-0.1472958, 0.6128586, -1.818579, 0, 1, 0.7960784, 1,
-0.1415278, 0.09381378, -1.820806, 0, 1, 0.8039216, 1,
-0.1405089, 0.8404811, -0.3202601, 0, 1, 0.8078431, 1,
-0.1376489, -1.252934, -3.681521, 0, 1, 0.8156863, 1,
-0.1366144, 0.7194791, -1.251976, 0, 1, 0.8196079, 1,
-0.1363589, -0.8629245, -3.30389, 0, 1, 0.827451, 1,
-0.1356028, 0.1638644, -0.2998218, 0, 1, 0.8313726, 1,
-0.1325156, -0.08525608, -2.27242, 0, 1, 0.8392157, 1,
-0.1294332, -0.4880779, -5.57168, 0, 1, 0.8431373, 1,
-0.1291791, -1.42662, -5.008159, 0, 1, 0.8509804, 1,
-0.1281017, 0.6131424, -0.139805, 0, 1, 0.854902, 1,
-0.1274962, -0.4062511, -0.6782771, 0, 1, 0.8627451, 1,
-0.1265419, 1.30094, 1.880166, 0, 1, 0.8666667, 1,
-0.123325, 2.003464, -0.742247, 0, 1, 0.8745098, 1,
-0.1219259, 0.7187163, 0.5424588, 0, 1, 0.8784314, 1,
-0.1194004, -0.9014137, -1.363558, 0, 1, 0.8862745, 1,
-0.1185955, 1.855078, 1.96189, 0, 1, 0.8901961, 1,
-0.1145947, 0.4098918, -1.090928, 0, 1, 0.8980392, 1,
-0.1084599, -0.4149202, -2.149418, 0, 1, 0.9058824, 1,
-0.1072895, -0.2182762, -0.3540924, 0, 1, 0.9098039, 1,
-0.1067521, -0.5393509, -3.133091, 0, 1, 0.9176471, 1,
-0.1007067, -0.6157864, -2.146304, 0, 1, 0.9215686, 1,
-0.09644072, -0.2001802, -2.908083, 0, 1, 0.9294118, 1,
-0.09541319, -0.4306978, -2.614225, 0, 1, 0.9333333, 1,
-0.09498204, -2.137396, -1.638442, 0, 1, 0.9411765, 1,
-0.09187317, -0.4882313, -1.596595, 0, 1, 0.945098, 1,
-0.08878882, 1.105721, 0.8682019, 0, 1, 0.9529412, 1,
-0.08797837, 0.9815851, 1.065231, 0, 1, 0.9568627, 1,
-0.08332457, 0.4287018, -1.812628, 0, 1, 0.9647059, 1,
-0.08147022, -0.9389685, -3.692269, 0, 1, 0.9686275, 1,
-0.08111385, -0.9695526, -2.329218, 0, 1, 0.9764706, 1,
-0.08109071, 0.3452314, 0.2166072, 0, 1, 0.9803922, 1,
-0.07987301, 0.1906937, -1.741373, 0, 1, 0.9882353, 1,
-0.07948688, -1.822813, -1.835621, 0, 1, 0.9921569, 1,
-0.07805896, 0.7039299, -1.646858, 0, 1, 1, 1,
-0.07782581, -0.364263, -2.608644, 0, 0.9921569, 1, 1,
-0.07731827, 0.3149673, 0.8818344, 0, 0.9882353, 1, 1,
-0.07452824, -0.9588493, -3.132385, 0, 0.9803922, 1, 1,
-0.07154726, 1.18539, 0.9212159, 0, 0.9764706, 1, 1,
-0.05811367, 2.790114, 0.4142047, 0, 0.9686275, 1, 1,
-0.05543671, -0.4416276, -2.639742, 0, 0.9647059, 1, 1,
-0.04773845, -1.081198, -3.142968, 0, 0.9568627, 1, 1,
-0.04553, -0.1534023, -1.838908, 0, 0.9529412, 1, 1,
-0.04549295, -1.551305, -3.441978, 0, 0.945098, 1, 1,
-0.04491446, -0.03233091, -2.330979, 0, 0.9411765, 1, 1,
-0.04391467, -0.9934091, -1.560106, 0, 0.9333333, 1, 1,
-0.04388212, 0.6253266, 1.368246, 0, 0.9294118, 1, 1,
-0.04386874, -0.05879679, -0.3802846, 0, 0.9215686, 1, 1,
-0.04305254, -1.871847, -4.826289, 0, 0.9176471, 1, 1,
-0.03550348, 0.2264483, 0.1397581, 0, 0.9098039, 1, 1,
-0.03544172, 0.07580504, -0.4075279, 0, 0.9058824, 1, 1,
-0.03426437, -0.6984872, -2.696611, 0, 0.8980392, 1, 1,
-0.03051301, 0.3011798, -0.7550902, 0, 0.8901961, 1, 1,
-0.030511, 0.6593483, 0.5537636, 0, 0.8862745, 1, 1,
-0.03012645, -0.3538517, -2.517257, 0, 0.8784314, 1, 1,
-0.02299369, 0.7235107, 1.488337, 0, 0.8745098, 1, 1,
-0.02013378, 1.328407, -0.4975896, 0, 0.8666667, 1, 1,
-0.01830718, -0.5660337, -0.2400857, 0, 0.8627451, 1, 1,
-0.01259576, 0.1324528, 3.425792, 0, 0.854902, 1, 1,
-0.006374171, -0.1893819, -3.622622, 0, 0.8509804, 1, 1,
-0.00587396, 1.4133, 0.9194424, 0, 0.8431373, 1, 1,
-0.003129627, -1.845725, -3.561057, 0, 0.8392157, 1, 1,
-0.002844454, -1.773077, -4.542227, 0, 0.8313726, 1, 1,
0.0001801989, 1.22641, -0.2756416, 0, 0.827451, 1, 1,
0.0005361498, -0.462402, 2.37603, 0, 0.8196079, 1, 1,
0.001548638, 0.7364569, -1.079027, 0, 0.8156863, 1, 1,
0.002632249, 0.9797596, -0.9140084, 0, 0.8078431, 1, 1,
0.006661523, -0.6684457, 4.080924, 0, 0.8039216, 1, 1,
0.01019116, 0.1476245, 0.04074125, 0, 0.7960784, 1, 1,
0.01644024, -0.5605932, 2.273127, 0, 0.7882353, 1, 1,
0.01796355, 1.258442, 0.2577974, 0, 0.7843137, 1, 1,
0.01863644, -1.834681, 3.026547, 0, 0.7764706, 1, 1,
0.02045249, -1.716004, 1.887415, 0, 0.772549, 1, 1,
0.02448015, 1.644225, 0.2020571, 0, 0.7647059, 1, 1,
0.02761542, 1.478462, -0.6319519, 0, 0.7607843, 1, 1,
0.03037818, -1.247714, 2.635521, 0, 0.7529412, 1, 1,
0.0326747, 0.2536904, 1.502183, 0, 0.7490196, 1, 1,
0.03469169, 0.4809012, -0.05604553, 0, 0.7411765, 1, 1,
0.03553971, 0.345403, 0.5812211, 0, 0.7372549, 1, 1,
0.03790998, -1.245237, 4.644689, 0, 0.7294118, 1, 1,
0.04051115, 0.0932316, 0.2909058, 0, 0.7254902, 1, 1,
0.04099207, -0.8662038, 5.75911, 0, 0.7176471, 1, 1,
0.04239462, -1.002786, 1.487483, 0, 0.7137255, 1, 1,
0.04509841, 0.6072422, -0.305434, 0, 0.7058824, 1, 1,
0.04531679, -0.2033605, 2.174408, 0, 0.6980392, 1, 1,
0.04921092, 0.04828459, 3.662376, 0, 0.6941177, 1, 1,
0.04931366, -1.821224, 2.444056, 0, 0.6862745, 1, 1,
0.05919824, -1.195917, 2.73314, 0, 0.682353, 1, 1,
0.05963886, -0.5007869, 2.364267, 0, 0.6745098, 1, 1,
0.06363048, 0.9643499, 0.8498669, 0, 0.6705883, 1, 1,
0.06842823, -2.092578, 3.915407, 0, 0.6627451, 1, 1,
0.07658259, 1.096443, 1.006178, 0, 0.6588235, 1, 1,
0.07976434, 0.7964318, -0.4823048, 0, 0.6509804, 1, 1,
0.08211271, 0.9805976, 0.3321664, 0, 0.6470588, 1, 1,
0.08808638, -0.243273, 4.369867, 0, 0.6392157, 1, 1,
0.08867989, 1.858227, 2.49005, 0, 0.6352941, 1, 1,
0.08992278, -2.30656, 5.921807, 0, 0.627451, 1, 1,
0.09235215, 0.3738591, 0.05747586, 0, 0.6235294, 1, 1,
0.09605005, -0.9102793, 3.917157, 0, 0.6156863, 1, 1,
0.09638724, -1.575923, 2.496463, 0, 0.6117647, 1, 1,
0.09984385, 0.9029534, 0.660679, 0, 0.6039216, 1, 1,
0.1011642, -0.3653408, 2.578614, 0, 0.5960785, 1, 1,
0.1045568, 0.1258051, 0.561845, 0, 0.5921569, 1, 1,
0.105053, -1.935952, 4.08721, 0, 0.5843138, 1, 1,
0.1067591, 1.377443, 2.012361, 0, 0.5803922, 1, 1,
0.114699, 0.6846255, 0.1132947, 0, 0.572549, 1, 1,
0.1163895, -0.3874919, 2.950651, 0, 0.5686275, 1, 1,
0.1186245, 0.1943756, 0.5811385, 0, 0.5607843, 1, 1,
0.1200548, -0.7675202, 1.657511, 0, 0.5568628, 1, 1,
0.1266895, 0.8954477, -0.1223494, 0, 0.5490196, 1, 1,
0.1280983, -1.580845, 2.438624, 0, 0.5450981, 1, 1,
0.1292314, -1.174695, 2.543922, 0, 0.5372549, 1, 1,
0.1297025, -0.6177794, 3.48611, 0, 0.5333334, 1, 1,
0.1316094, 0.3680043, 0.560361, 0, 0.5254902, 1, 1,
0.1336642, 1.004446, 1.40496, 0, 0.5215687, 1, 1,
0.1357248, 0.708481, 2.118297, 0, 0.5137255, 1, 1,
0.1430291, -0.1546605, 2.427629, 0, 0.509804, 1, 1,
0.1458019, 1.253008, 0.04282173, 0, 0.5019608, 1, 1,
0.1497992, 1.14513, 2.373934, 0, 0.4941176, 1, 1,
0.1518082, -0.6947715, 3.365289, 0, 0.4901961, 1, 1,
0.1520644, -1.952132, 3.582712, 0, 0.4823529, 1, 1,
0.1605978, -2.078136, 2.823544, 0, 0.4784314, 1, 1,
0.1611985, -0.8927497, 3.140158, 0, 0.4705882, 1, 1,
0.162942, -0.6422248, 2.882418, 0, 0.4666667, 1, 1,
0.1629705, 1.039837, -0.542724, 0, 0.4588235, 1, 1,
0.1687948, -0.6602467, 3.926816, 0, 0.454902, 1, 1,
0.170793, 1.575157, 0.3144885, 0, 0.4470588, 1, 1,
0.171258, -0.7780465, 2.00181, 0, 0.4431373, 1, 1,
0.1769164, -0.2066009, 3.091193, 0, 0.4352941, 1, 1,
0.1825414, -0.8100933, 3.585427, 0, 0.4313726, 1, 1,
0.1950853, 0.763421, 1.07251, 0, 0.4235294, 1, 1,
0.1983821, 0.8930743, -1.328708, 0, 0.4196078, 1, 1,
0.208854, 2.637189, 1.813377, 0, 0.4117647, 1, 1,
0.2091179, -0.9308122, 1.894393, 0, 0.4078431, 1, 1,
0.2098359, 0.4384397, 1.920201, 0, 0.4, 1, 1,
0.2098826, 1.117059, 1.708107, 0, 0.3921569, 1, 1,
0.2111496, -0.8309715, 3.162018, 0, 0.3882353, 1, 1,
0.213269, -0.2763406, 3.688748, 0, 0.3803922, 1, 1,
0.2168004, 2.145179, -0.157473, 0, 0.3764706, 1, 1,
0.2175736, 1.111278, 0.3462994, 0, 0.3686275, 1, 1,
0.2187458, 0.260092, 0.1830715, 0, 0.3647059, 1, 1,
0.2207734, 0.9971167, 2.050113, 0, 0.3568628, 1, 1,
0.2256983, -0.4303465, 3.361117, 0, 0.3529412, 1, 1,
0.2306155, -0.2997254, 2.094717, 0, 0.345098, 1, 1,
0.2315425, -1.912, 2.607245, 0, 0.3411765, 1, 1,
0.2347598, 0.6972524, 0.6658246, 0, 0.3333333, 1, 1,
0.2406501, -0.7100059, 4.192974, 0, 0.3294118, 1, 1,
0.24236, 0.6793687, -0.1344283, 0, 0.3215686, 1, 1,
0.2452457, 0.418527, 0.7679381, 0, 0.3176471, 1, 1,
0.2457474, 0.317016, -0.8289559, 0, 0.3098039, 1, 1,
0.2475149, -0.4803268, 3.034936, 0, 0.3058824, 1, 1,
0.2478568, -1.645882, 3.554535, 0, 0.2980392, 1, 1,
0.2554274, -2.397721, 0.7970273, 0, 0.2901961, 1, 1,
0.2679035, 0.5259839, -1.077762, 0, 0.2862745, 1, 1,
0.2718556, 1.482155, 1.839232, 0, 0.2784314, 1, 1,
0.272218, 0.8493819, 1.019786, 0, 0.2745098, 1, 1,
0.2724319, 1.174959, 0.3675714, 0, 0.2666667, 1, 1,
0.2744547, -0.1171928, 1.429871, 0, 0.2627451, 1, 1,
0.2760012, -0.5954077, 2.295882, 0, 0.254902, 1, 1,
0.2760254, 0.4695871, 2.057828, 0, 0.2509804, 1, 1,
0.2766882, 0.1786565, 0.0439899, 0, 0.2431373, 1, 1,
0.28232, -0.7976955, 3.469225, 0, 0.2392157, 1, 1,
0.2833643, 0.8857421, -0.8952456, 0, 0.2313726, 1, 1,
0.2833783, 1.613707, -0.1991074, 0, 0.227451, 1, 1,
0.2923274, 0.7595831, -0.1432968, 0, 0.2196078, 1, 1,
0.2936998, -0.4010138, 3.065472, 0, 0.2156863, 1, 1,
0.3077278, 0.8741581, -0.3086817, 0, 0.2078431, 1, 1,
0.3144433, -0.500137, 2.972585, 0, 0.2039216, 1, 1,
0.3237443, -0.5505945, 1.622982, 0, 0.1960784, 1, 1,
0.3251104, -0.2221708, 1.436084, 0, 0.1882353, 1, 1,
0.3256381, 1.6422, 0.1846183, 0, 0.1843137, 1, 1,
0.3274283, 0.2367486, 0.8298382, 0, 0.1764706, 1, 1,
0.3292436, -1.579818, 3.654401, 0, 0.172549, 1, 1,
0.3306347, -0.3692982, 2.033808, 0, 0.1647059, 1, 1,
0.3317319, -0.01708249, 2.05384, 0, 0.1607843, 1, 1,
0.3343655, -0.9307553, 3.298832, 0, 0.1529412, 1, 1,
0.3400142, 1.085737, -1.048064, 0, 0.1490196, 1, 1,
0.3410285, 1.806531, 0.128814, 0, 0.1411765, 1, 1,
0.3434705, -0.1575577, 1.59845, 0, 0.1372549, 1, 1,
0.3438843, 1.157075, 1.347892, 0, 0.1294118, 1, 1,
0.3442788, -0.003777362, -0.3741785, 0, 0.1254902, 1, 1,
0.3455314, -2.789247, 2.331362, 0, 0.1176471, 1, 1,
0.3478409, 1.005081, 0.4141458, 0, 0.1137255, 1, 1,
0.3491153, -0.558196, 3.487605, 0, 0.1058824, 1, 1,
0.3562861, -0.7051339, 3.674952, 0, 0.09803922, 1, 1,
0.366634, -0.7319902, 2.395322, 0, 0.09411765, 1, 1,
0.367222, -1.101958, 3.438951, 0, 0.08627451, 1, 1,
0.3693579, -0.2766677, 2.434037, 0, 0.08235294, 1, 1,
0.3698028, 1.968297, 0.8909403, 0, 0.07450981, 1, 1,
0.3710942, -0.2588186, 2.019104, 0, 0.07058824, 1, 1,
0.373033, 1.185165, 0.147737, 0, 0.0627451, 1, 1,
0.3802851, 2.20625, 0.1533857, 0, 0.05882353, 1, 1,
0.3948889, 1.651105, -1.013973, 0, 0.05098039, 1, 1,
0.3959501, -0.03969889, 1.51216, 0, 0.04705882, 1, 1,
0.3968182, -0.5868608, 2.415514, 0, 0.03921569, 1, 1,
0.4010825, 1.247545, 0.9848332, 0, 0.03529412, 1, 1,
0.4037361, 1.015213, -0.5048377, 0, 0.02745098, 1, 1,
0.4055307, -0.804568, 1.507896, 0, 0.02352941, 1, 1,
0.4057736, 0.2442907, 0.05715119, 0, 0.01568628, 1, 1,
0.4088847, 1.57174, 1.299142, 0, 0.01176471, 1, 1,
0.4101214, -0.3356052, 2.181287, 0, 0.003921569, 1, 1,
0.410316, -1.362879, 3.282506, 0.003921569, 0, 1, 1,
0.4190717, 0.6068695, 0.1743238, 0.007843138, 0, 1, 1,
0.4199403, -0.7974448, 0.5583106, 0.01568628, 0, 1, 1,
0.4220155, -0.8969684, 2.948338, 0.01960784, 0, 1, 1,
0.4274692, -0.5156864, 1.194093, 0.02745098, 0, 1, 1,
0.4327593, -0.3822879, 2.172225, 0.03137255, 0, 1, 1,
0.4349691, 0.560873, -0.3785664, 0.03921569, 0, 1, 1,
0.4356539, -0.9379767, 1.064281, 0.04313726, 0, 1, 1,
0.4364058, 0.6778984, 0.7822185, 0.05098039, 0, 1, 1,
0.4374549, -1.808938, 1.68047, 0.05490196, 0, 1, 1,
0.4436058, -1.504311, 2.14167, 0.0627451, 0, 1, 1,
0.4438134, -1.27457, 3.536143, 0.06666667, 0, 1, 1,
0.4462516, 0.1060413, 2.817352, 0.07450981, 0, 1, 1,
0.4473229, 0.5492772, 1.257707, 0.07843138, 0, 1, 1,
0.4519101, -0.1619917, 0.862233, 0.08627451, 0, 1, 1,
0.4566025, 0.5777916, 1.999393, 0.09019608, 0, 1, 1,
0.4617139, -1.095683, 1.817897, 0.09803922, 0, 1, 1,
0.4733474, 1.084754, 1.244627, 0.1058824, 0, 1, 1,
0.4761677, 1.402613, -1.395173, 0.1098039, 0, 1, 1,
0.4772188, 1.10081, 1.242482, 0.1176471, 0, 1, 1,
0.47729, 0.3382505, 2.201684, 0.1215686, 0, 1, 1,
0.4803144, 0.1374423, 0.4301736, 0.1294118, 0, 1, 1,
0.4830534, -0.3828009, 0.4486817, 0.1333333, 0, 1, 1,
0.4962958, -0.7224277, 3.468612, 0.1411765, 0, 1, 1,
0.4972237, 0.3034788, 1.703887, 0.145098, 0, 1, 1,
0.5018411, -0.8209696, 3.473564, 0.1529412, 0, 1, 1,
0.5034895, 0.775481, 1.657309, 0.1568628, 0, 1, 1,
0.5050485, 1.542256, 1.471717, 0.1647059, 0, 1, 1,
0.5058948, 1.07623, 0.1328194, 0.1686275, 0, 1, 1,
0.5066746, 0.07643735, 1.709691, 0.1764706, 0, 1, 1,
0.5099673, -0.6412497, 2.174517, 0.1803922, 0, 1, 1,
0.5101966, 1.082928, 0.4694903, 0.1882353, 0, 1, 1,
0.5111938, -0.4543608, 1.603499, 0.1921569, 0, 1, 1,
0.5117791, 0.0264212, 1.765336, 0.2, 0, 1, 1,
0.5121655, 0.421699, 0.8600931, 0.2078431, 0, 1, 1,
0.5142305, -0.1438191, 1.468963, 0.2117647, 0, 1, 1,
0.5171821, -0.5122818, 0.6462759, 0.2196078, 0, 1, 1,
0.5189057, -0.07019632, 3.541607, 0.2235294, 0, 1, 1,
0.5219735, -0.1357858, 2.990178, 0.2313726, 0, 1, 1,
0.5222291, -0.0939193, 1.615446, 0.2352941, 0, 1, 1,
0.5385315, 0.7922203, 1.098899, 0.2431373, 0, 1, 1,
0.5418254, 0.04035179, 1.682872, 0.2470588, 0, 1, 1,
0.551625, 0.5433787, -0.567347, 0.254902, 0, 1, 1,
0.5528592, 0.8154083, -0.1278363, 0.2588235, 0, 1, 1,
0.5547854, -0.5143557, 0.3255106, 0.2666667, 0, 1, 1,
0.5551159, -0.8970703, 2.876516, 0.2705882, 0, 1, 1,
0.5564721, -0.5313222, 5.615783, 0.2784314, 0, 1, 1,
0.5567009, -0.6178369, 2.304657, 0.282353, 0, 1, 1,
0.5657621, 1.240936, 1.363615, 0.2901961, 0, 1, 1,
0.5658087, 1.056275, 1.957069, 0.2941177, 0, 1, 1,
0.5688512, -0.01065807, 2.160376, 0.3019608, 0, 1, 1,
0.5708348, -0.6099026, 3.059898, 0.3098039, 0, 1, 1,
0.5709869, -0.4146301, 3.18778, 0.3137255, 0, 1, 1,
0.5739356, 0.2537757, 2.325971, 0.3215686, 0, 1, 1,
0.5741746, 0.5581487, 1.791397, 0.3254902, 0, 1, 1,
0.5746616, 1.392017, 1.362009, 0.3333333, 0, 1, 1,
0.5763882, 0.607833, 1.981831, 0.3372549, 0, 1, 1,
0.5815378, -2.28923, 2.484004, 0.345098, 0, 1, 1,
0.5817838, -0.3582502, 1.472953, 0.3490196, 0, 1, 1,
0.5829875, 1.904647, 0.5494966, 0.3568628, 0, 1, 1,
0.5871776, -0.4886797, 2.042438, 0.3607843, 0, 1, 1,
0.5893758, 0.9779108, 1.998506, 0.3686275, 0, 1, 1,
0.5948604, -0.923004, 3.673166, 0.372549, 0, 1, 1,
0.6040267, -0.9141305, 3.511104, 0.3803922, 0, 1, 1,
0.607232, 0.5073333, 0.4942303, 0.3843137, 0, 1, 1,
0.6075364, -0.7865745, 3.034229, 0.3921569, 0, 1, 1,
0.6082134, 1.174647, 1.144181, 0.3960784, 0, 1, 1,
0.6085576, -0.546473, 2.529593, 0.4039216, 0, 1, 1,
0.6090807, -1.087269, 3.497699, 0.4117647, 0, 1, 1,
0.6093895, 0.2576101, 1.618375, 0.4156863, 0, 1, 1,
0.6102722, 1.039151, 0.4862102, 0.4235294, 0, 1, 1,
0.613563, -0.7082422, 2.899888, 0.427451, 0, 1, 1,
0.6151229, 1.314938, -0.103323, 0.4352941, 0, 1, 1,
0.6285971, -0.4654856, 2.562238, 0.4392157, 0, 1, 1,
0.6384745, -0.4467739, 3.288429, 0.4470588, 0, 1, 1,
0.6404449, 0.5165346, -0.6217004, 0.4509804, 0, 1, 1,
0.6464276, -0.7716764, 3.279566, 0.4588235, 0, 1, 1,
0.655449, 1.876813, 0.996068, 0.4627451, 0, 1, 1,
0.6633673, -0.2333519, 3.908158, 0.4705882, 0, 1, 1,
0.6654179, 0.02140497, 1.742069, 0.4745098, 0, 1, 1,
0.6671584, 1.190756, 0.3898044, 0.4823529, 0, 1, 1,
0.6716886, 1.157438, 0.676564, 0.4862745, 0, 1, 1,
0.6724255, -0.8431101, 2.442834, 0.4941176, 0, 1, 1,
0.6756762, -0.4641917, 0.5692508, 0.5019608, 0, 1, 1,
0.6768684, -0.409546, 2.799162, 0.5058824, 0, 1, 1,
0.6844836, -1.738509, 2.660701, 0.5137255, 0, 1, 1,
0.6879609, 0.1767912, 1.506647, 0.5176471, 0, 1, 1,
0.68815, 0.8535941, 0.5313337, 0.5254902, 0, 1, 1,
0.6893383, 0.8851007, -0.1489533, 0.5294118, 0, 1, 1,
0.6963227, -0.5500093, 1.790897, 0.5372549, 0, 1, 1,
0.7009463, -2.042065, 4.013825, 0.5411765, 0, 1, 1,
0.7060978, 0.272383, 1.084052, 0.5490196, 0, 1, 1,
0.7076345, -0.8647271, 0.8341484, 0.5529412, 0, 1, 1,
0.7097969, 1.084078, 1.474672, 0.5607843, 0, 1, 1,
0.7118941, -0.1916378, 2.903141, 0.5647059, 0, 1, 1,
0.7128947, -1.47799, 1.634104, 0.572549, 0, 1, 1,
0.7131687, -1.955351, 2.672497, 0.5764706, 0, 1, 1,
0.7147089, 0.9182798, 0.6764756, 0.5843138, 0, 1, 1,
0.7148826, 0.902293, 0.4369223, 0.5882353, 0, 1, 1,
0.7158167, -0.3623146, 3.069176, 0.5960785, 0, 1, 1,
0.728202, -1.104146, 2.705808, 0.6039216, 0, 1, 1,
0.7284107, 0.5550978, 1.211918, 0.6078432, 0, 1, 1,
0.7325953, -0.2397765, 1.210903, 0.6156863, 0, 1, 1,
0.7328525, -0.220186, 2.164428, 0.6196079, 0, 1, 1,
0.7393227, -0.6953318, 3.637518, 0.627451, 0, 1, 1,
0.740994, 1.877211, -1.143851, 0.6313726, 0, 1, 1,
0.7477269, -1.16358, 2.843237, 0.6392157, 0, 1, 1,
0.7495208, -0.7024395, 1.028344, 0.6431373, 0, 1, 1,
0.7508883, -1.878746, 1.812167, 0.6509804, 0, 1, 1,
0.7530851, 1.482629, 0.06704345, 0.654902, 0, 1, 1,
0.7535639, -1.216481, 2.856897, 0.6627451, 0, 1, 1,
0.7535724, 0.06338465, -1.431788, 0.6666667, 0, 1, 1,
0.7537502, 0.3371907, -0.4366281, 0.6745098, 0, 1, 1,
0.7548089, -0.05015638, 0.6326094, 0.6784314, 0, 1, 1,
0.7549099, -0.5368811, 2.473652, 0.6862745, 0, 1, 1,
0.7578009, -0.8929693, 2.966966, 0.6901961, 0, 1, 1,
0.7618707, -0.5891692, 2.233772, 0.6980392, 0, 1, 1,
0.7692502, 1.29865, 0.2441038, 0.7058824, 0, 1, 1,
0.7756793, -0.4353348, 1.89185, 0.7098039, 0, 1, 1,
0.7773904, 0.3194306, 1.762196, 0.7176471, 0, 1, 1,
0.7809048, 0.62203, 2.839211, 0.7215686, 0, 1, 1,
0.7914507, -0.6707898, 2.672168, 0.7294118, 0, 1, 1,
0.7931635, -0.4256541, 2.62201, 0.7333333, 0, 1, 1,
0.7935464, 1.263698, 0.5683917, 0.7411765, 0, 1, 1,
0.8031262, -0.2577708, 1.159214, 0.7450981, 0, 1, 1,
0.8062803, -0.5166397, 2.669622, 0.7529412, 0, 1, 1,
0.8079752, -0.02238819, 1.134214, 0.7568628, 0, 1, 1,
0.8091648, 1.881204, 1.276079, 0.7647059, 0, 1, 1,
0.8093506, 1.573341, 1.392413, 0.7686275, 0, 1, 1,
0.8093633, -1.67684, 1.699641, 0.7764706, 0, 1, 1,
0.8102582, 0.238843, 2.87836, 0.7803922, 0, 1, 1,
0.8143081, 0.6109101, 1.473062, 0.7882353, 0, 1, 1,
0.8146523, -1.319322, 2.53392, 0.7921569, 0, 1, 1,
0.8183889, -1.024353, 1.912147, 0.8, 0, 1, 1,
0.819725, -0.9830475, 2.848066, 0.8078431, 0, 1, 1,
0.8205113, 0.2338921, -0.9250712, 0.8117647, 0, 1, 1,
0.8238373, -0.4324208, 2.807424, 0.8196079, 0, 1, 1,
0.8251787, -0.5032423, 1.660574, 0.8235294, 0, 1, 1,
0.8263867, 0.478981, 1.870996, 0.8313726, 0, 1, 1,
0.8277659, 0.2726788, 2.147593, 0.8352941, 0, 1, 1,
0.8286839, -0.3588365, 0.1315418, 0.8431373, 0, 1, 1,
0.8322279, -0.934489, 1.983497, 0.8470588, 0, 1, 1,
0.8333746, -0.5406738, 1.895135, 0.854902, 0, 1, 1,
0.8352956, -1.55429, 2.59242, 0.8588235, 0, 1, 1,
0.8354308, -0.260907, 3.431225, 0.8666667, 0, 1, 1,
0.8363825, -1.787971, 3.319915, 0.8705882, 0, 1, 1,
0.8460145, -0.08915991, 0.5546325, 0.8784314, 0, 1, 1,
0.850338, 0.3893288, 0.4395538, 0.8823529, 0, 1, 1,
0.8511599, 1.645487, 0.6942776, 0.8901961, 0, 1, 1,
0.8516124, -0.1403777, 1.05702, 0.8941177, 0, 1, 1,
0.8564829, 1.978578, 0.002149997, 0.9019608, 0, 1, 1,
0.8583202, -0.8841326, 2.613428, 0.9098039, 0, 1, 1,
0.858336, 0.9241863, -0.5664114, 0.9137255, 0, 1, 1,
0.8606765, 0.9890124, 0.2657617, 0.9215686, 0, 1, 1,
0.8624687, 0.6465898, 0.7421559, 0.9254902, 0, 1, 1,
0.8708677, -2.420495, 3.798452, 0.9333333, 0, 1, 1,
0.8761119, 0.05277104, 1.167952, 0.9372549, 0, 1, 1,
0.8764932, -1.007425, 3.217458, 0.945098, 0, 1, 1,
0.8780718, 1.272597, -0.02713256, 0.9490196, 0, 1, 1,
0.8807193, -2.000528, 3.476294, 0.9568627, 0, 1, 1,
0.8820325, -1.385066, 3.023878, 0.9607843, 0, 1, 1,
0.8820849, -0.5643318, 1.508216, 0.9686275, 0, 1, 1,
0.8840292, -0.4737999, 2.620238, 0.972549, 0, 1, 1,
0.8846318, 0.7004946, -1.328059, 0.9803922, 0, 1, 1,
0.8893644, -0.7367818, 1.295009, 0.9843137, 0, 1, 1,
0.9127675, 0.7155563, 1.606105, 0.9921569, 0, 1, 1,
0.9140912, 0.1183616, 1.978087, 0.9960784, 0, 1, 1,
0.9265526, 0.3062791, 0.9633479, 1, 0, 0.9960784, 1,
0.9272871, -0.2191157, 2.262873, 1, 0, 0.9882353, 1,
0.9378116, -1.163165, 3.970258, 1, 0, 0.9843137, 1,
0.9411889, -0.6516701, 1.54337, 1, 0, 0.9764706, 1,
0.9450297, -0.8079231, 1.835358, 1, 0, 0.972549, 1,
0.9475611, 0.4380376, -1.445929, 1, 0, 0.9647059, 1,
0.9502015, -0.1330354, 1.871639, 1, 0, 0.9607843, 1,
0.9525766, 0.1095139, 0.2760139, 1, 0, 0.9529412, 1,
0.9531271, -0.7275354, 3.219902, 1, 0, 0.9490196, 1,
0.9602155, -0.4426435, 1.271471, 1, 0, 0.9411765, 1,
0.9619745, -0.1471565, 2.128024, 1, 0, 0.9372549, 1,
0.9697876, 1.513293, 0.8962939, 1, 0, 0.9294118, 1,
0.9756036, -0.260741, 2.117044, 1, 0, 0.9254902, 1,
0.9785047, 1.567327, 2.455817, 1, 0, 0.9176471, 1,
0.9841271, 1.238416, 1.576685, 1, 0, 0.9137255, 1,
0.9841804, 0.644714, 0.5356967, 1, 0, 0.9058824, 1,
0.9874423, 0.1968986, 2.10426, 1, 0, 0.9019608, 1,
0.9876493, -1.010016, 2.173275, 1, 0, 0.8941177, 1,
0.9881955, -1.103452, 1.299049, 1, 0, 0.8862745, 1,
0.9891886, -1.677835, 1.759381, 1, 0, 0.8823529, 1,
0.9892008, -1.432974, 2.656047, 1, 0, 0.8745098, 1,
0.9918235, 0.6082205, 0.5033475, 1, 0, 0.8705882, 1,
1.00376, 0.05647514, 0.9277375, 1, 0, 0.8627451, 1,
1.014649, -0.2275488, 2.284537, 1, 0, 0.8588235, 1,
1.04784, -0.5879596, 2.826801, 1, 0, 0.8509804, 1,
1.049593, 0.2771285, 1.736745, 1, 0, 0.8470588, 1,
1.049652, 0.8045846, 1.110632, 1, 0, 0.8392157, 1,
1.054328, 2.228659, 0.02564932, 1, 0, 0.8352941, 1,
1.056836, 0.1723285, 1.128953, 1, 0, 0.827451, 1,
1.057009, -0.664261, 3.627615, 1, 0, 0.8235294, 1,
1.06239, 0.4487137, 1.722533, 1, 0, 0.8156863, 1,
1.065884, -0.8443029, 1.189463, 1, 0, 0.8117647, 1,
1.066603, 2.034027, 0.6643038, 1, 0, 0.8039216, 1,
1.069608, -1.011114, 0.653136, 1, 0, 0.7960784, 1,
1.07235, -0.4231449, 1.380839, 1, 0, 0.7921569, 1,
1.074534, 0.1802872, 0.7419815, 1, 0, 0.7843137, 1,
1.085483, 1.17718, 2.179886, 1, 0, 0.7803922, 1,
1.089679, 0.1983076, 1.828445, 1, 0, 0.772549, 1,
1.091686, 0.08029053, 0.8555009, 1, 0, 0.7686275, 1,
1.099836, -0.1815788, 2.01339, 1, 0, 0.7607843, 1,
1.111244, 0.2118585, -0.1810306, 1, 0, 0.7568628, 1,
1.11401, 1.913969, -0.5616269, 1, 0, 0.7490196, 1,
1.126868, -0.1108078, 1.153578, 1, 0, 0.7450981, 1,
1.13067, -0.1469945, 0.2278224, 1, 0, 0.7372549, 1,
1.139048, 0.05241072, 0.7344822, 1, 0, 0.7333333, 1,
1.16301, -0.2154029, 1.710503, 1, 0, 0.7254902, 1,
1.163947, -0.7696585, 3.405013, 1, 0, 0.7215686, 1,
1.164664, -0.2397695, 2.312516, 1, 0, 0.7137255, 1,
1.16514, -0.7203438, 0.5382639, 1, 0, 0.7098039, 1,
1.172597, 0.3496454, 2.147013, 1, 0, 0.7019608, 1,
1.174775, 0.1452978, 0.5740745, 1, 0, 0.6941177, 1,
1.179085, -0.1835672, 0.9582638, 1, 0, 0.6901961, 1,
1.18356, 1.677343, 1.702544, 1, 0, 0.682353, 1,
1.198948, -0.2780013, 2.099861, 1, 0, 0.6784314, 1,
1.204551, 0.3010548, 0.5706654, 1, 0, 0.6705883, 1,
1.207126, -0.02305524, 0.9736492, 1, 0, 0.6666667, 1,
1.226099, -1.506747, 2.066351, 1, 0, 0.6588235, 1,
1.230277, -0.07590489, -0.8033625, 1, 0, 0.654902, 1,
1.233939, 0.6288584, -0.374349, 1, 0, 0.6470588, 1,
1.243332, -0.9310573, 1.77556, 1, 0, 0.6431373, 1,
1.246151, -0.697384, 2.706372, 1, 0, 0.6352941, 1,
1.24729, 0.1204024, 0.2716839, 1, 0, 0.6313726, 1,
1.247739, 0.5849816, 0.2792054, 1, 0, 0.6235294, 1,
1.250693, -1.100653, 2.235968, 1, 0, 0.6196079, 1,
1.2519, -0.7458994, 2.471729, 1, 0, 0.6117647, 1,
1.255886, -0.08561482, 1.627295, 1, 0, 0.6078432, 1,
1.266219, 0.3524982, 2.735654, 1, 0, 0.6, 1,
1.271568, -0.4009822, 3.757121, 1, 0, 0.5921569, 1,
1.293733, -0.6181753, 1.769072, 1, 0, 0.5882353, 1,
1.294376, 2.410428, 0.1954872, 1, 0, 0.5803922, 1,
1.29443, -0.5940591, 1.53728, 1, 0, 0.5764706, 1,
1.296121, -0.3558121, 2.386716, 1, 0, 0.5686275, 1,
1.300058, 0.392539, -0.1281359, 1, 0, 0.5647059, 1,
1.308582, 1.26173, 0.4541335, 1, 0, 0.5568628, 1,
1.317596, 0.2216307, 1.374524, 1, 0, 0.5529412, 1,
1.317727, -1.224945, 2.045068, 1, 0, 0.5450981, 1,
1.318605, -0.4798366, 3.59365, 1, 0, 0.5411765, 1,
1.318905, -1.519917, 2.6099, 1, 0, 0.5333334, 1,
1.319215, 0.3272471, 0.5433216, 1, 0, 0.5294118, 1,
1.33024, 2.331559, 0.8931787, 1, 0, 0.5215687, 1,
1.3309, -0.2197733, 0.8107082, 1, 0, 0.5176471, 1,
1.340559, -1.0103, 2.459935, 1, 0, 0.509804, 1,
1.350691, 1.541948, -0.7455173, 1, 0, 0.5058824, 1,
1.352947, -0.2308249, 3.344602, 1, 0, 0.4980392, 1,
1.363647, 1.257565, 0.8764873, 1, 0, 0.4901961, 1,
1.383918, 0.5707195, 0.9593067, 1, 0, 0.4862745, 1,
1.392351, -0.3667176, 1.147222, 1, 0, 0.4784314, 1,
1.394252, -1.723158, 3.146891, 1, 0, 0.4745098, 1,
1.396772, 0.124945, 1.918098, 1, 0, 0.4666667, 1,
1.397275, 0.6869057, 3.672843, 1, 0, 0.4627451, 1,
1.411924, -1.831399, 1.154556, 1, 0, 0.454902, 1,
1.424752, 0.6469734, 0.9622476, 1, 0, 0.4509804, 1,
1.426226, -0.1504332, 0.4240897, 1, 0, 0.4431373, 1,
1.42982, -0.2596197, 1.594985, 1, 0, 0.4392157, 1,
1.440054, -0.8043755, 1.73327, 1, 0, 0.4313726, 1,
1.442487, -0.2963738, 1.577797, 1, 0, 0.427451, 1,
1.453969, 1.461707, 0.08424652, 1, 0, 0.4196078, 1,
1.458529, 0.9914715, 0.5265123, 1, 0, 0.4156863, 1,
1.476519, -0.04228316, 1.262959, 1, 0, 0.4078431, 1,
1.484687, -0.9121646, 1.605619, 1, 0, 0.4039216, 1,
1.484814, -0.339875, 2.53791, 1, 0, 0.3960784, 1,
1.488951, 0.9866341, 0.01180612, 1, 0, 0.3882353, 1,
1.496745, -1.905365, 1.809351, 1, 0, 0.3843137, 1,
1.497901, 0.2277898, 1.629414, 1, 0, 0.3764706, 1,
1.515447, 0.8902751, -0.5017013, 1, 0, 0.372549, 1,
1.519667, 1.112882, 1.12817, 1, 0, 0.3647059, 1,
1.521776, 0.843633, 0.464233, 1, 0, 0.3607843, 1,
1.540349, 0.209763, 1.421625, 1, 0, 0.3529412, 1,
1.547735, 0.8107044, 2.921928, 1, 0, 0.3490196, 1,
1.553776, -0.3296429, 1.021462, 1, 0, 0.3411765, 1,
1.558786, -1.062138, 0.6348088, 1, 0, 0.3372549, 1,
1.58339, 0.9126597, 0.7538337, 1, 0, 0.3294118, 1,
1.586051, -0.3874511, 2.183789, 1, 0, 0.3254902, 1,
1.597943, 0.4876071, 3.12794, 1, 0, 0.3176471, 1,
1.631541, 0.8431318, -0.02855091, 1, 0, 0.3137255, 1,
1.636083, 0.7480183, 1.710187, 1, 0, 0.3058824, 1,
1.639652, -0.3401731, 0.5606911, 1, 0, 0.2980392, 1,
1.647646, 0.7077795, 2.989504, 1, 0, 0.2941177, 1,
1.654513, 0.1874413, 1.676338, 1, 0, 0.2862745, 1,
1.667931, -0.001252193, 3.409189, 1, 0, 0.282353, 1,
1.691332, -0.7188689, 2.799971, 1, 0, 0.2745098, 1,
1.713646, 0.7271101, 1.210917, 1, 0, 0.2705882, 1,
1.717871, 0.7994186, 0.7314505, 1, 0, 0.2627451, 1,
1.755531, 1.361224, 3.52248, 1, 0, 0.2588235, 1,
1.757565, -0.4475254, 1.17279, 1, 0, 0.2509804, 1,
1.767914, 0.7467291, 0.7767432, 1, 0, 0.2470588, 1,
1.773464, -1.782872, 1.411059, 1, 0, 0.2392157, 1,
1.780385, 1.810224, -1.045954, 1, 0, 0.2352941, 1,
1.783911, 0.8693576, 2.634573, 1, 0, 0.227451, 1,
1.803919, -2.474774, 2.169529, 1, 0, 0.2235294, 1,
1.835842, 0.02001789, 1.900299, 1, 0, 0.2156863, 1,
1.836554, 0.4428427, 1.77937, 1, 0, 0.2117647, 1,
1.839543, -1.521508, 2.774429, 1, 0, 0.2039216, 1,
1.852743, -0.2739192, 1.937325, 1, 0, 0.1960784, 1,
1.855569, 0.4022805, 1.699548, 1, 0, 0.1921569, 1,
1.867427, -0.7156662, 1.057547, 1, 0, 0.1843137, 1,
1.868247, -0.2797417, 2.81055, 1, 0, 0.1803922, 1,
1.897252, 0.3406895, 0.4921554, 1, 0, 0.172549, 1,
1.901471, -0.4840359, 1.196311, 1, 0, 0.1686275, 1,
1.938338, -0.7486067, 0.6023239, 1, 0, 0.1607843, 1,
1.939413, -1.315235, 1.953414, 1, 0, 0.1568628, 1,
1.950063, -0.3539545, 1.172112, 1, 0, 0.1490196, 1,
1.988999, -1.156334, 0.8711295, 1, 0, 0.145098, 1,
2.012296, 0.3946155, 1.410929, 1, 0, 0.1372549, 1,
2.082436, -0.307511, 2.329977, 1, 0, 0.1333333, 1,
2.12485, 1.056588, 2.07498, 1, 0, 0.1254902, 1,
2.142181, 0.3493208, 2.636516, 1, 0, 0.1215686, 1,
2.142517, -0.3838015, -1.300949, 1, 0, 0.1137255, 1,
2.157055, -0.6848491, 1.316552, 1, 0, 0.1098039, 1,
2.16158, 0.177335, 2.055737, 1, 0, 0.1019608, 1,
2.18332, -0.1286265, 2.902117, 1, 0, 0.09411765, 1,
2.238546, -0.4941763, 1.549861, 1, 0, 0.09019608, 1,
2.260753, -0.6176455, 1.039312, 1, 0, 0.08235294, 1,
2.312504, -2.069988, 0.3800552, 1, 0, 0.07843138, 1,
2.334454, -0.7452919, 1.090856, 1, 0, 0.07058824, 1,
2.343303, -0.07138225, 0.9732395, 1, 0, 0.06666667, 1,
2.361697, 0.1969607, 0.9032754, 1, 0, 0.05882353, 1,
2.371809, 0.3727726, 1.030486, 1, 0, 0.05490196, 1,
2.384822, 1.431064, 0.6722242, 1, 0, 0.04705882, 1,
2.468727, 0.9878117, 1.37725, 1, 0, 0.04313726, 1,
2.471176, -1.58862, 2.24991, 1, 0, 0.03529412, 1,
2.584385, 0.5861095, 2.041282, 1, 0, 0.03137255, 1,
2.738365, 1.163131, 2.839093, 1, 0, 0.02352941, 1,
2.811549, 1.076849, 0.3398475, 1, 0, 0.01960784, 1,
2.823804, 2.227937, 1.023605, 1, 0, 0.01176471, 1,
3.069409, 0.4470609, 1.383007, 1, 0, 0.007843138, 1
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
0.09489954, -3.786733, -7.519826, 0, -0.5, 0.5, 0.5,
0.09489954, -3.786733, -7.519826, 1, -0.5, 0.5, 0.5,
0.09489954, -3.786733, -7.519826, 1, 1.5, 0.5, 0.5,
0.09489954, -3.786733, -7.519826, 0, 1.5, 0.5, 0.5
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
-3.887969, 0.1531917, -7.519826, 0, -0.5, 0.5, 0.5,
-3.887969, 0.1531917, -7.519826, 1, -0.5, 0.5, 0.5,
-3.887969, 0.1531917, -7.519826, 1, 1.5, 0.5, 0.5,
-3.887969, 0.1531917, -7.519826, 0, 1.5, 0.5, 0.5
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
-3.887969, -3.786733, 0.1750634, 0, -0.5, 0.5, 0.5,
-3.887969, -3.786733, 0.1750634, 1, -0.5, 0.5, 0.5,
-3.887969, -3.786733, 0.1750634, 1, 1.5, 0.5, 0.5,
-3.887969, -3.786733, 0.1750634, 0, 1.5, 0.5, 0.5
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
-2, -2.87752, -5.744082,
3, -2.87752, -5.744082,
-2, -2.87752, -5.744082,
-2, -3.029055, -6.04004,
-1, -2.87752, -5.744082,
-1, -3.029055, -6.04004,
0, -2.87752, -5.744082,
0, -3.029055, -6.04004,
1, -2.87752, -5.744082,
1, -3.029055, -6.04004,
2, -2.87752, -5.744082,
2, -3.029055, -6.04004,
3, -2.87752, -5.744082,
3, -3.029055, -6.04004
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
-2, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
-2, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
-2, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
-2, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5,
-1, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
-1, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
-1, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
-1, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5,
0, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
0, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
0, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
0, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5,
1, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
1, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
1, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
1, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5,
2, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
2, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
2, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
2, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5,
3, -3.332126, -6.631954, 0, -0.5, 0.5, 0.5,
3, -3.332126, -6.631954, 1, -0.5, 0.5, 0.5,
3, -3.332126, -6.631954, 1, 1.5, 0.5, 0.5,
3, -3.332126, -6.631954, 0, 1.5, 0.5, 0.5
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
-2.968845, -2, -5.744082,
-2.968845, 3, -5.744082,
-2.968845, -2, -5.744082,
-3.122032, -2, -6.04004,
-2.968845, -1, -5.744082,
-3.122032, -1, -6.04004,
-2.968845, 0, -5.744082,
-3.122032, 0, -6.04004,
-2.968845, 1, -5.744082,
-3.122032, 1, -6.04004,
-2.968845, 2, -5.744082,
-3.122032, 2, -6.04004,
-2.968845, 3, -5.744082,
-3.122032, 3, -6.04004
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
-3.428407, -2, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, -2, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, -2, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, -2, -6.631954, 0, 1.5, 0.5, 0.5,
-3.428407, -1, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, -1, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, -1, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, -1, -6.631954, 0, 1.5, 0.5, 0.5,
-3.428407, 0, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, 0, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, 0, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, 0, -6.631954, 0, 1.5, 0.5, 0.5,
-3.428407, 1, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, 1, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, 1, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, 1, -6.631954, 0, 1.5, 0.5, 0.5,
-3.428407, 2, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, 2, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, 2, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, 2, -6.631954, 0, 1.5, 0.5, 0.5,
-3.428407, 3, -6.631954, 0, -0.5, 0.5, 0.5,
-3.428407, 3, -6.631954, 1, -0.5, 0.5, 0.5,
-3.428407, 3, -6.631954, 1, 1.5, 0.5, 0.5,
-3.428407, 3, -6.631954, 0, 1.5, 0.5, 0.5
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
-2.968845, -2.87752, -4,
-2.968845, -2.87752, 4,
-2.968845, -2.87752, -4,
-3.122032, -3.029055, -4,
-2.968845, -2.87752, -2,
-3.122032, -3.029055, -2,
-2.968845, -2.87752, 0,
-3.122032, -3.029055, 0,
-2.968845, -2.87752, 2,
-3.122032, -3.029055, 2,
-2.968845, -2.87752, 4,
-3.122032, -3.029055, 4
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
-3.428407, -3.332126, -4, 0, -0.5, 0.5, 0.5,
-3.428407, -3.332126, -4, 1, -0.5, 0.5, 0.5,
-3.428407, -3.332126, -4, 1, 1.5, 0.5, 0.5,
-3.428407, -3.332126, -4, 0, 1.5, 0.5, 0.5,
-3.428407, -3.332126, -2, 0, -0.5, 0.5, 0.5,
-3.428407, -3.332126, -2, 1, -0.5, 0.5, 0.5,
-3.428407, -3.332126, -2, 1, 1.5, 0.5, 0.5,
-3.428407, -3.332126, -2, 0, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 0, 0, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 0, 1, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 0, 1, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 0, 0, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 2, 0, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 2, 1, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 2, 1, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 2, 0, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 4, 0, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 4, 1, -0.5, 0.5, 0.5,
-3.428407, -3.332126, 4, 1, 1.5, 0.5, 0.5,
-3.428407, -3.332126, 4, 0, 1.5, 0.5, 0.5
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
-2.968845, -2.87752, -5.744082,
-2.968845, 3.183903, -5.744082,
-2.968845, -2.87752, 6.094209,
-2.968845, 3.183903, 6.094209,
-2.968845, -2.87752, -5.744082,
-2.968845, -2.87752, 6.094209,
-2.968845, 3.183903, -5.744082,
-2.968845, 3.183903, 6.094209,
-2.968845, -2.87752, -5.744082,
3.158644, -2.87752, -5.744082,
-2.968845, -2.87752, 6.094209,
3.158644, -2.87752, 6.094209,
-2.968845, 3.183903, -5.744082,
3.158644, 3.183903, -5.744082,
-2.968845, 3.183903, 6.094209,
3.158644, 3.183903, 6.094209,
3.158644, -2.87752, -5.744082,
3.158644, 3.183903, -5.744082,
3.158644, -2.87752, 6.094209,
3.158644, 3.183903, 6.094209,
3.158644, -2.87752, -5.744082,
3.158644, -2.87752, 6.094209,
3.158644, 3.183903, -5.744082,
3.158644, 3.183903, 6.094209
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
var radius = 7.819345;
var distance = 34.78915;
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
mvMatrix.translate( -0.09489954, -0.1531917, -0.1750634 );
mvMatrix.scale( 1.379754, 1.394793, 0.7141595 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.78915);
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
Aldrin<-read.table("Aldrin.xyz")
```

```
## Error in read.table("Aldrin.xyz"): no lines available in input
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
-2.87961, 0.1516062, -0.7487326, 0, 0, 1, 1, 1,
-2.741281, -1.620487, -2.673143, 1, 0, 0, 1, 1,
-2.716765, -0.3386986, -1.006241, 1, 0, 0, 1, 1,
-2.705918, 1.889192, 0.6533644, 1, 0, 0, 1, 1,
-2.649381, 0.1645271, -2.046285, 1, 0, 0, 1, 1,
-2.540907, -0.2996918, -0.106572, 1, 0, 0, 1, 1,
-2.53861, -0.5428739, -2.794073, 0, 0, 0, 1, 1,
-2.53391, -1.06112, -2.906231, 0, 0, 0, 1, 1,
-2.473467, 0.6262829, -1.77997, 0, 0, 0, 1, 1,
-2.472188, 0.5628561, -1.749751, 0, 0, 0, 1, 1,
-2.318347, -0.8350866, -3.295323, 0, 0, 0, 1, 1,
-2.279544, -1.159131, -2.694206, 0, 0, 0, 1, 1,
-2.247433, -0.658645, -1.122438, 0, 0, 0, 1, 1,
-2.238364, -1.039971, -2.548411, 1, 1, 1, 1, 1,
-2.217764, 0.6303703, -0.3833253, 1, 1, 1, 1, 1,
-2.170847, -0.5229549, -1.625712, 1, 1, 1, 1, 1,
-2.149001, 0.3467975, -1.759571, 1, 1, 1, 1, 1,
-2.148207, 0.2672766, 0.908604, 1, 1, 1, 1, 1,
-2.1365, -1.105889, -1.15487, 1, 1, 1, 1, 1,
-2.043153, 0.4187493, 0.2057903, 1, 1, 1, 1, 1,
-1.993968, -0.1073989, -1.310533, 1, 1, 1, 1, 1,
-1.978339, -0.7204455, -0.6111605, 1, 1, 1, 1, 1,
-1.972854, -0.09068917, -2.823799, 1, 1, 1, 1, 1,
-1.961045, -0.6204521, -1.689731, 1, 1, 1, 1, 1,
-1.953525, -0.6961623, -0.4170082, 1, 1, 1, 1, 1,
-1.939031, -0.2217433, -0.444792, 1, 1, 1, 1, 1,
-1.880464, -0.5127051, -3.025239, 1, 1, 1, 1, 1,
-1.855625, -0.1181148, -1.329493, 1, 1, 1, 1, 1,
-1.848495, 0.4179517, -0.8311542, 0, 0, 1, 1, 1,
-1.811796, 0.2213043, -2.251869, 1, 0, 0, 1, 1,
-1.807601, 0.846625, -0.7247855, 1, 0, 0, 1, 1,
-1.801885, 0.3756229, -2.077083, 1, 0, 0, 1, 1,
-1.80092, -0.3830608, -0.9464108, 1, 0, 0, 1, 1,
-1.798985, -0.08921229, -1.098669, 1, 0, 0, 1, 1,
-1.798804, 1.243652, -0.4659425, 0, 0, 0, 1, 1,
-1.793577, 0.796728, 0.6075705, 0, 0, 0, 1, 1,
-1.786517, -0.3903013, -1.743695, 0, 0, 0, 1, 1,
-1.766613, 0.5336658, -1.464258, 0, 0, 0, 1, 1,
-1.763004, 0.370043, -0.5277669, 0, 0, 0, 1, 1,
-1.760864, 1.444895, 0.7899406, 0, 0, 0, 1, 1,
-1.744438, 0.08716682, -1.814, 0, 0, 0, 1, 1,
-1.740029, -0.216455, -1.529372, 1, 1, 1, 1, 1,
-1.739774, -0.3404847, -3.196411, 1, 1, 1, 1, 1,
-1.737063, -0.1093158, -1.527382, 1, 1, 1, 1, 1,
-1.7354, -0.6016813, -2.730344, 1, 1, 1, 1, 1,
-1.730116, 1.682459, -0.2348346, 1, 1, 1, 1, 1,
-1.729017, 0.8278276, 0.08912233, 1, 1, 1, 1, 1,
-1.713659, 0.5819716, -0.2730702, 1, 1, 1, 1, 1,
-1.709738, 0.2217922, -0.4023081, 1, 1, 1, 1, 1,
-1.706747, -0.6414477, -1.898789, 1, 1, 1, 1, 1,
-1.693507, 0.4865286, -0.5441022, 1, 1, 1, 1, 1,
-1.686986, 0.3131186, -1.976017, 1, 1, 1, 1, 1,
-1.672689, -0.6439677, -2.024537, 1, 1, 1, 1, 1,
-1.670298, 0.2078866, -2.035504, 1, 1, 1, 1, 1,
-1.665647, 2.042217, 0.3578959, 1, 1, 1, 1, 1,
-1.663797, -0.06935095, -1.554991, 1, 1, 1, 1, 1,
-1.659769, 0.1853819, -1.271692, 0, 0, 1, 1, 1,
-1.657809, 0.7706643, -1.389965, 1, 0, 0, 1, 1,
-1.6493, -0.7627476, -2.926327, 1, 0, 0, 1, 1,
-1.626972, 1.920566, -0.4344098, 1, 0, 0, 1, 1,
-1.613894, -0.3449917, -0.9331738, 1, 0, 0, 1, 1,
-1.609238, -0.7906247, -0.9851473, 1, 0, 0, 1, 1,
-1.604466, -0.2034306, -0.443494, 0, 0, 0, 1, 1,
-1.604214, 0.1436026, -2.927617, 0, 0, 0, 1, 1,
-1.589823, 0.09472818, -1.258453, 0, 0, 0, 1, 1,
-1.576812, 2.42624, -0.5616915, 0, 0, 0, 1, 1,
-1.554606, -0.603191, -1.635482, 0, 0, 0, 1, 1,
-1.546387, 0.5893279, -2.277102, 0, 0, 0, 1, 1,
-1.546214, 0.01977673, -0.495869, 0, 0, 0, 1, 1,
-1.543596, -0.106503, -0.8201906, 1, 1, 1, 1, 1,
-1.531119, -0.9244911, -3.137125, 1, 1, 1, 1, 1,
-1.530514, 0.7689143, -0.9446999, 1, 1, 1, 1, 1,
-1.528116, -0.9692427, -2.566287, 1, 1, 1, 1, 1,
-1.526752, -0.3108959, -3.167698, 1, 1, 1, 1, 1,
-1.513086, 0.1156141, -1.346993, 1, 1, 1, 1, 1,
-1.511186, -0.7028919, -0.1913796, 1, 1, 1, 1, 1,
-1.504209, -0.5528944, -0.8734033, 1, 1, 1, 1, 1,
-1.497552, -0.8614226, -2.158583, 1, 1, 1, 1, 1,
-1.495503, -0.04987875, -1.135895, 1, 1, 1, 1, 1,
-1.47972, 1.302073, 0.4224875, 1, 1, 1, 1, 1,
-1.475921, 0.2093292, -0.1730394, 1, 1, 1, 1, 1,
-1.474757, 0.4355522, 0.0005686613, 1, 1, 1, 1, 1,
-1.460366, -1.937635, -3.957229, 1, 1, 1, 1, 1,
-1.457812, -1.749063, -2.373166, 1, 1, 1, 1, 1,
-1.455391, -1.040245, -1.293067, 0, 0, 1, 1, 1,
-1.45239, -1.176643, -3.004539, 1, 0, 0, 1, 1,
-1.452237, -0.8927535, -1.343111, 1, 0, 0, 1, 1,
-1.450313, 0.5383483, -1.164024, 1, 0, 0, 1, 1,
-1.426086, -2.242313, -1.513786, 1, 0, 0, 1, 1,
-1.405064, 1.236256, -1.439238, 1, 0, 0, 1, 1,
-1.397375, -0.7997109, -1.478917, 0, 0, 0, 1, 1,
-1.38935, 0.0307636, -1.600524, 0, 0, 0, 1, 1,
-1.386938, 0.3172945, -0.8982611, 0, 0, 0, 1, 1,
-1.380404, -0.4899372, -3.24774, 0, 0, 0, 1, 1,
-1.379617, 1.396015, 0.3529814, 0, 0, 0, 1, 1,
-1.373413, -0.8789631, -2.312342, 0, 0, 0, 1, 1,
-1.372835, 0.4490627, -1.816769, 0, 0, 0, 1, 1,
-1.366388, 0.9127486, -0.6841683, 1, 1, 1, 1, 1,
-1.366359, -0.3336054, -1.530902, 1, 1, 1, 1, 1,
-1.350301, -0.5911902, -1.377943, 1, 1, 1, 1, 1,
-1.349327, 1.153271, 0.4971271, 1, 1, 1, 1, 1,
-1.345979, -0.4163065, -1.774378, 1, 1, 1, 1, 1,
-1.337063, -1.281939, -5.197176, 1, 1, 1, 1, 1,
-1.335762, 1.075064, -1.033252, 1, 1, 1, 1, 1,
-1.332096, -0.01914164, -0.2671986, 1, 1, 1, 1, 1,
-1.330245, 0.90563, -0.2891447, 1, 1, 1, 1, 1,
-1.327141, -1.075511, -0.4275323, 1, 1, 1, 1, 1,
-1.32603, -0.01474369, -1.06606, 1, 1, 1, 1, 1,
-1.316584, 0.1064812, -1.208878, 1, 1, 1, 1, 1,
-1.31562, -0.9492764, -1.539976, 1, 1, 1, 1, 1,
-1.311086, -0.1643314, -2.692382, 1, 1, 1, 1, 1,
-1.31075, 0.02987192, -1.796485, 1, 1, 1, 1, 1,
-1.296441, 1.314094, -1.706683, 0, 0, 1, 1, 1,
-1.287771, -0.7239932, -2.290572, 1, 0, 0, 1, 1,
-1.272032, 1.616468, -0.7363991, 1, 0, 0, 1, 1,
-1.267835, 0.7170877, -0.4129337, 1, 0, 0, 1, 1,
-1.266225, 0.02354113, -1.635954, 1, 0, 0, 1, 1,
-1.26389, 0.3673332, -1.557253, 1, 0, 0, 1, 1,
-1.260584, 1.131882, 0.3838105, 0, 0, 0, 1, 1,
-1.251915, 1.598714, -0.5719728, 0, 0, 0, 1, 1,
-1.248335, 0.6366087, -0.2338871, 0, 0, 0, 1, 1,
-1.241525, 0.399336, -1.06752, 0, 0, 0, 1, 1,
-1.239022, -1.93051, -2.218759, 0, 0, 0, 1, 1,
-1.236388, 1.31476, 1.060985, 0, 0, 0, 1, 1,
-1.236352, -0.1433701, -1.560633, 0, 0, 0, 1, 1,
-1.227634, 1.665854, -1.509446, 1, 1, 1, 1, 1,
-1.215434, -1.00959, -1.284311, 1, 1, 1, 1, 1,
-1.20872, 0.7302406, -2.073625, 1, 1, 1, 1, 1,
-1.206698, -0.9745579, -4.446897, 1, 1, 1, 1, 1,
-1.20612, 0.7254007, -1.387191, 1, 1, 1, 1, 1,
-1.204906, -0.2700489, -0.5115067, 1, 1, 1, 1, 1,
-1.202704, 0.07348076, -2.198473, 1, 1, 1, 1, 1,
-1.201572, 0.5558426, -0.2713215, 1, 1, 1, 1, 1,
-1.198245, -1.796041, -0.8286996, 1, 1, 1, 1, 1,
-1.194765, 0.8911548, -1.879028, 1, 1, 1, 1, 1,
-1.192953, 1.135188, -0.5455314, 1, 1, 1, 1, 1,
-1.190359, 0.4392177, -1.919563, 1, 1, 1, 1, 1,
-1.18818, -0.8146484, -2.036876, 1, 1, 1, 1, 1,
-1.183849, 0.02139537, -1.019888, 1, 1, 1, 1, 1,
-1.173663, -0.8950697, -3.114425, 1, 1, 1, 1, 1,
-1.16707, 0.7538976, -2.315902, 0, 0, 1, 1, 1,
-1.166928, 0.04754124, -3.425646, 1, 0, 0, 1, 1,
-1.16269, -0.09238195, -1.523943, 1, 0, 0, 1, 1,
-1.159805, -0.9323919, -3.700301, 1, 0, 0, 1, 1,
-1.159513, -1.47645, -1.90587, 1, 0, 0, 1, 1,
-1.154124, 1.788676, -0.1653511, 1, 0, 0, 1, 1,
-1.148789, 0.2294469, -2.754967, 0, 0, 0, 1, 1,
-1.143761, -1.039545, -0.8989581, 0, 0, 0, 1, 1,
-1.143442, -1.102733, -2.510965, 0, 0, 0, 1, 1,
-1.142612, 0.1976909, -0.9554012, 0, 0, 0, 1, 1,
-1.142122, -2.506418, -2.979704, 0, 0, 0, 1, 1,
-1.137248, -0.1621962, -1.292107, 0, 0, 0, 1, 1,
-1.129217, 3.09563, 0.3922034, 0, 0, 0, 1, 1,
-1.124634, -0.7717162, -3.105172, 1, 1, 1, 1, 1,
-1.117499, 0.3264166, -1.325156, 1, 1, 1, 1, 1,
-1.112861, 1.53149, 0.7794016, 1, 1, 1, 1, 1,
-1.112411, -0.06914459, -1.473925, 1, 1, 1, 1, 1,
-1.096342, 0.1356503, -2.079348, 1, 1, 1, 1, 1,
-1.094133, 0.3913556, -1.251535, 1, 1, 1, 1, 1,
-1.090098, 0.675464, -1.888329, 1, 1, 1, 1, 1,
-1.064807, -0.520424, -0.2358295, 1, 1, 1, 1, 1,
-1.060584, 1.083793, -1.213651, 1, 1, 1, 1, 1,
-1.053957, -1.118168, -2.180244, 1, 1, 1, 1, 1,
-1.052115, 1.454372, -0.4431367, 1, 1, 1, 1, 1,
-1.052045, 1.761189, -0.8561182, 1, 1, 1, 1, 1,
-1.050289, 1.082037, -0.1722253, 1, 1, 1, 1, 1,
-1.048095, -0.9995546, -4.658034, 1, 1, 1, 1, 1,
-1.044311, -0.1121872, -1.640067, 1, 1, 1, 1, 1,
-1.041825, -0.3963234, -1.183517, 0, 0, 1, 1, 1,
-1.030544, 1.028604, -0.6669642, 1, 0, 0, 1, 1,
-1.026347, -0.1019872, -1.298778, 1, 0, 0, 1, 1,
-1.023302, -1.1235, -1.792499, 1, 0, 0, 1, 1,
-1.020918, -0.9672852, -3.464738, 1, 0, 0, 1, 1,
-1.019074, -0.4847888, -0.01080058, 1, 0, 0, 1, 1,
-1.01877, -0.05310787, -2.187193, 0, 0, 0, 1, 1,
-1.0172, 0.5233042, -0.6150001, 0, 0, 0, 1, 1,
-1.004768, 1.020709, 0.03303713, 0, 0, 0, 1, 1,
-1.004251, -0.7545872, -2.77371, 0, 0, 0, 1, 1,
-1.003527, -1.222969, -2.221971, 0, 0, 0, 1, 1,
-0.998251, -0.04343378, -0.4265791, 0, 0, 0, 1, 1,
-0.9970579, 0.9131902, -2.834631, 0, 0, 0, 1, 1,
-0.9953239, -1.754015, -2.12931, 1, 1, 1, 1, 1,
-0.9930649, -1.055428, -1.562766, 1, 1, 1, 1, 1,
-0.9859371, 1.326141, -0.8384173, 1, 1, 1, 1, 1,
-0.9720656, 0.8958405, -2.600822, 1, 1, 1, 1, 1,
-0.9701324, -0.6049026, -1.644344, 1, 1, 1, 1, 1,
-0.9602379, -1.571591, -1.14252, 1, 1, 1, 1, 1,
-0.9467124, 1.191584, 0.2606941, 1, 1, 1, 1, 1,
-0.9445238, -0.5689846, -1.774698, 1, 1, 1, 1, 1,
-0.9379279, 0.7136531, -0.1316131, 1, 1, 1, 1, 1,
-0.9364226, -1.953485, -3.85104, 1, 1, 1, 1, 1,
-0.9350007, -0.8994507, -3.203666, 1, 1, 1, 1, 1,
-0.9262735, 0.3215274, 1.167738, 1, 1, 1, 1, 1,
-0.9219369, 1.555148, -1.984965, 1, 1, 1, 1, 1,
-0.920076, 2.535509, -1.456801, 1, 1, 1, 1, 1,
-0.9158016, 1.226255, -1.981453, 1, 1, 1, 1, 1,
-0.9157681, 0.802855, -1.261208, 0, 0, 1, 1, 1,
-0.9082007, -0.1101791, -1.692267, 1, 0, 0, 1, 1,
-0.906817, -0.9259724, -3.028224, 1, 0, 0, 1, 1,
-0.9032126, 0.7784671, -1.097679, 1, 0, 0, 1, 1,
-0.9026187, -0.508873, -1.984019, 1, 0, 0, 1, 1,
-0.897859, -1.074119, -1.973199, 1, 0, 0, 1, 1,
-0.8813707, 0.1968356, -0.6790088, 0, 0, 0, 1, 1,
-0.8730093, -1.402947, -2.885667, 0, 0, 0, 1, 1,
-0.8657043, 1.34163, -0.9896928, 0, 0, 0, 1, 1,
-0.8612626, -1.12229, -1.140654, 0, 0, 0, 1, 1,
-0.8604556, -0.6595352, -2.896049, 0, 0, 0, 1, 1,
-0.8592898, 0.5896345, -2.190203, 0, 0, 0, 1, 1,
-0.8550961, -1.686949, -3.420597, 0, 0, 0, 1, 1,
-0.8535682, 0.4767124, -0.8398979, 1, 1, 1, 1, 1,
-0.8358874, -0.3400574, -1.274289, 1, 1, 1, 1, 1,
-0.8311639, 0.1717695, -2.294011, 1, 1, 1, 1, 1,
-0.8300293, -0.321649, -1.351172, 1, 1, 1, 1, 1,
-0.8296586, 0.4826343, -1.605545, 1, 1, 1, 1, 1,
-0.8274562, -0.09008735, -1.438391, 1, 1, 1, 1, 1,
-0.8271793, -1.011472, -2.561226, 1, 1, 1, 1, 1,
-0.8244597, 0.3688232, -1.823486, 1, 1, 1, 1, 1,
-0.82406, 0.4351527, 0.5303096, 1, 1, 1, 1, 1,
-0.8155733, -0.5695469, -1.126944, 1, 1, 1, 1, 1,
-0.8050931, 1.856536, -2.562378, 1, 1, 1, 1, 1,
-0.7959202, -0.1306063, -2.651112, 1, 1, 1, 1, 1,
-0.7931083, -0.07477511, -2.470163, 1, 1, 1, 1, 1,
-0.7923894, 0.4773122, -0.664949, 1, 1, 1, 1, 1,
-0.7890016, -0.1020432, -2.838181, 1, 1, 1, 1, 1,
-0.7870935, -0.9778161, -3.765931, 0, 0, 1, 1, 1,
-0.7861888, -0.395118, -1.126931, 1, 0, 0, 1, 1,
-0.7859291, -0.751496, -0.7907127, 1, 0, 0, 1, 1,
-0.783549, 0.4498325, -0.2572478, 1, 0, 0, 1, 1,
-0.7834791, -0.3631206, -1.876925, 1, 0, 0, 1, 1,
-0.783309, -0.9714235, -1.972752, 1, 0, 0, 1, 1,
-0.7831705, 0.3081834, -0.04574214, 0, 0, 0, 1, 1,
-0.7831205, -0.01336669, -0.907888, 0, 0, 0, 1, 1,
-0.7811245, 0.3210407, -2.083413, 0, 0, 0, 1, 1,
-0.7745033, -0.2711429, -0.9703766, 0, 0, 0, 1, 1,
-0.7730008, -0.7553653, -1.677612, 0, 0, 0, 1, 1,
-0.7706333, -0.8347626, -2.828022, 0, 0, 0, 1, 1,
-0.7658479, -0.5273262, -2.519407, 0, 0, 0, 1, 1,
-0.758141, 0.09998343, -2.930124, 1, 1, 1, 1, 1,
-0.7528164, -1.553337, -3.609526, 1, 1, 1, 1, 1,
-0.7496087, 0.8654686, -2.153653, 1, 1, 1, 1, 1,
-0.7454915, -0.6995575, -0.5877129, 1, 1, 1, 1, 1,
-0.7454098, 1.961832, -0.5085195, 1, 1, 1, 1, 1,
-0.7428477, -1.285527, -4.618388, 1, 1, 1, 1, 1,
-0.7411479, 1.667263, 0.7136872, 1, 1, 1, 1, 1,
-0.7350191, 0.654313, -0.9985341, 1, 1, 1, 1, 1,
-0.7257182, -1.004421, -3.817095, 1, 1, 1, 1, 1,
-0.7217106, 1.411222, -0.9231362, 1, 1, 1, 1, 1,
-0.7175279, 0.867175, -0.9410594, 1, 1, 1, 1, 1,
-0.7139816, 1.261373, -0.8676407, 1, 1, 1, 1, 1,
-0.7135065, -0.0006871521, -1.18365, 1, 1, 1, 1, 1,
-0.7116996, -0.6935341, -1.293588, 1, 1, 1, 1, 1,
-0.7111683, 2.844941, -0.8773234, 1, 1, 1, 1, 1,
-0.7042059, -1.405991, -4.279247, 0, 0, 1, 1, 1,
-0.7032306, 0.5632167, 0.3279751, 1, 0, 0, 1, 1,
-0.6989936, -0.1771389, -1.32397, 1, 0, 0, 1, 1,
-0.6968486, -0.595121, -2.184311, 1, 0, 0, 1, 1,
-0.6933941, -0.6427425, -2.999178, 1, 0, 0, 1, 1,
-0.691029, 0.9342515, -2.04141, 1, 0, 0, 1, 1,
-0.6879814, -0.9747766, -3.00597, 0, 0, 0, 1, 1,
-0.6858081, 1.677677, 0.6367919, 0, 0, 0, 1, 1,
-0.6857902, -0.02936281, -0.3335151, 0, 0, 0, 1, 1,
-0.6813545, 1.32772, -0.2464453, 0, 0, 0, 1, 1,
-0.6784385, -0.8014951, -1.752974, 0, 0, 0, 1, 1,
-0.6781184, -0.4143791, -3.87485, 0, 0, 0, 1, 1,
-0.668457, 0.7671316, 0.01440156, 0, 0, 0, 1, 1,
-0.6643607, 0.271119, -0.3849539, 1, 1, 1, 1, 1,
-0.6615179, -0.1138842, -1.953384, 1, 1, 1, 1, 1,
-0.6593038, -0.6509875, -3.375691, 1, 1, 1, 1, 1,
-0.6579224, -0.8708314, -2.514901, 1, 1, 1, 1, 1,
-0.651563, -0.3630691, -0.81419, 1, 1, 1, 1, 1,
-0.6479321, 0.5473604, -2.167918, 1, 1, 1, 1, 1,
-0.6468201, -0.8111404, -3.511972, 1, 1, 1, 1, 1,
-0.6461111, -1.69359, -3.40643, 1, 1, 1, 1, 1,
-0.6454563, 0.4478213, -0.4760217, 1, 1, 1, 1, 1,
-0.641435, 0.6213098, -0.8937337, 1, 1, 1, 1, 1,
-0.6411386, -0.538121, -2.196547, 1, 1, 1, 1, 1,
-0.6390738, -0.07338381, -0.6843953, 1, 1, 1, 1, 1,
-0.6384594, -0.3618771, -2.316158, 1, 1, 1, 1, 1,
-0.6330506, -0.5552498, -1.610496, 1, 1, 1, 1, 1,
-0.6295317, 0.2041824, -0.2064326, 1, 1, 1, 1, 1,
-0.6256406, 0.6129109, -1.309822, 0, 0, 1, 1, 1,
-0.6256217, 0.01475067, -0.1603873, 1, 0, 0, 1, 1,
-0.6232932, 0.8882108, -1.12189, 1, 0, 0, 1, 1,
-0.6205101, -1.762088, -3.567686, 1, 0, 0, 1, 1,
-0.6181497, -0.2499977, -1.083937, 1, 0, 0, 1, 1,
-0.6167799, -0.5065345, -1.440187, 1, 0, 0, 1, 1,
-0.6142644, 1.005228, -1.292079, 0, 0, 0, 1, 1,
-0.611421, 1.38943, 0.03793585, 0, 0, 0, 1, 1,
-0.610452, -2.10706, -3.659503, 0, 0, 0, 1, 1,
-0.6072006, 0.3081226, -1.860773, 0, 0, 0, 1, 1,
-0.600903, 0.2366786, -1.623773, 0, 0, 0, 1, 1,
-0.6002464, 0.8376698, -2.192819, 0, 0, 0, 1, 1,
-0.5988477, -0.237021, -0.9362855, 0, 0, 0, 1, 1,
-0.5980126, -0.00293797, -1.948305, 1, 1, 1, 1, 1,
-0.5974922, -1.595232, -2.591955, 1, 1, 1, 1, 1,
-0.5955921, 0.3812049, -1.451872, 1, 1, 1, 1, 1,
-0.5945501, 1.333123, 0.7150709, 1, 1, 1, 1, 1,
-0.592473, 0.2930185, -0.4194734, 1, 1, 1, 1, 1,
-0.5846496, -2.048149, -2.83922, 1, 1, 1, 1, 1,
-0.5831643, -0.7735788, -1.469736, 1, 1, 1, 1, 1,
-0.5813559, 0.1688938, 0.3213386, 1, 1, 1, 1, 1,
-0.5811379, -0.1117333, -1.30468, 1, 1, 1, 1, 1,
-0.5777503, -0.2581288, -2.012952, 1, 1, 1, 1, 1,
-0.5721529, 1.675611, 1.101923, 1, 1, 1, 1, 1,
-0.5690778, 1.415783, 0.5094634, 1, 1, 1, 1, 1,
-0.5631337, 0.2541578, -1.817564, 1, 1, 1, 1, 1,
-0.5629143, 1.249892, 0.04473135, 1, 1, 1, 1, 1,
-0.5554689, -0.6790241, -1.021266, 1, 1, 1, 1, 1,
-0.5534981, -0.1548306, -2.17212, 0, 0, 1, 1, 1,
-0.5525791, 0.6335396, 0.7882268, 1, 0, 0, 1, 1,
-0.5485405, 0.4482663, -0.2232951, 1, 0, 0, 1, 1,
-0.548273, 0.4215406, 0.4528447, 1, 0, 0, 1, 1,
-0.5403773, 0.5267209, -1.84595, 1, 0, 0, 1, 1,
-0.5398856, -1.769234, -3.743549, 1, 0, 0, 1, 1,
-0.5398198, 0.01544961, -0.9233174, 0, 0, 0, 1, 1,
-0.5388376, -0.2720223, -0.4802943, 0, 0, 0, 1, 1,
-0.538323, 0.7185341, -0.2412178, 0, 0, 0, 1, 1,
-0.5380543, 1.577381, 0.441834, 0, 0, 0, 1, 1,
-0.5363662, 1.77197, -1.089962, 0, 0, 0, 1, 1,
-0.534212, -0.3140998, -3.119904, 0, 0, 0, 1, 1,
-0.5306303, -0.399295, -2.032787, 0, 0, 0, 1, 1,
-0.5304391, -0.1112607, -0.8351495, 1, 1, 1, 1, 1,
-0.5290523, 0.675952, 1.595046, 1, 1, 1, 1, 1,
-0.5251412, -0.4927872, -3.079697, 1, 1, 1, 1, 1,
-0.5209348, 1.121106, -0.9677446, 1, 1, 1, 1, 1,
-0.520836, 1.188356, -1.401447, 1, 1, 1, 1, 1,
-0.5207004, 0.9327078, -1.014013, 1, 1, 1, 1, 1,
-0.512693, -0.8659246, -3.140533, 1, 1, 1, 1, 1,
-0.5119662, -0.2796294, -3.544822, 1, 1, 1, 1, 1,
-0.5115277, 1.706593, -0.4505149, 1, 1, 1, 1, 1,
-0.5092532, -1.92272, -3.778409, 1, 1, 1, 1, 1,
-0.5034066, 0.06375811, -0.1263107, 1, 1, 1, 1, 1,
-0.5030972, 1.741142, -0.1045077, 1, 1, 1, 1, 1,
-0.5010856, 0.1930423, -0.6549448, 1, 1, 1, 1, 1,
-0.4998662, -1.447247, -3.231637, 1, 1, 1, 1, 1,
-0.4992511, 0.7812779, -2.079938, 1, 1, 1, 1, 1,
-0.4969764, -0.4561313, -3.041731, 0, 0, 1, 1, 1,
-0.4966328, -0.9945362, -2.699019, 1, 0, 0, 1, 1,
-0.4960812, -1.354774, -3.633783, 1, 0, 0, 1, 1,
-0.4943629, -0.3281767, -1.978001, 1, 0, 0, 1, 1,
-0.4931985, 0.1742249, -2.420037, 1, 0, 0, 1, 1,
-0.4823073, -0.3021351, -3.315887, 1, 0, 0, 1, 1,
-0.4779911, -0.5880614, -0.984667, 0, 0, 0, 1, 1,
-0.4688146, -1.09108, -4.148361, 0, 0, 0, 1, 1,
-0.4646996, 0.6918457, 0.1817351, 0, 0, 0, 1, 1,
-0.4645288, 0.1597535, -1.2516, 0, 0, 0, 1, 1,
-0.4644415, 0.6675282, -0.5401268, 0, 0, 0, 1, 1,
-0.4586436, 0.7159591, -1.463227, 0, 0, 0, 1, 1,
-0.4579426, -0.07616851, -2.747927, 0, 0, 0, 1, 1,
-0.4574198, 2.11605, -1.756627, 1, 1, 1, 1, 1,
-0.4570163, -0.377694, -3.022628, 1, 1, 1, 1, 1,
-0.4542345, 1.183154, 0.9883194, 1, 1, 1, 1, 1,
-0.4541666, 1.304056, -0.04943557, 1, 1, 1, 1, 1,
-0.4499117, -1.942119, -2.65818, 1, 1, 1, 1, 1,
-0.4494789, -1.022103, -1.58712, 1, 1, 1, 1, 1,
-0.4486181, -1.382599, -2.710446, 1, 1, 1, 1, 1,
-0.444146, 0.8295968, -0.2513089, 1, 1, 1, 1, 1,
-0.4423574, 0.1944472, -1.653556, 1, 1, 1, 1, 1,
-0.4422897, -0.1872233, -1.236312, 1, 1, 1, 1, 1,
-0.440298, 1.404966, -0.9244168, 1, 1, 1, 1, 1,
-0.4386559, -0.7688774, -1.179331, 1, 1, 1, 1, 1,
-0.4352894, -0.5337636, -2.056706, 1, 1, 1, 1, 1,
-0.434312, 1.888239, -0.2068865, 1, 1, 1, 1, 1,
-0.4338623, -0.7138557, -4.354345, 1, 1, 1, 1, 1,
-0.4325264, -0.6459804, -2.877233, 0, 0, 1, 1, 1,
-0.4319494, 0.05507539, -2.129642, 1, 0, 0, 1, 1,
-0.4297726, 0.3525423, -2.393376, 1, 0, 0, 1, 1,
-0.4285842, 0.9208697, 1.236915, 1, 0, 0, 1, 1,
-0.4230445, 0.960285, -0.4937964, 1, 0, 0, 1, 1,
-0.4229145, 0.9495755, -1.364299, 1, 0, 0, 1, 1,
-0.4174239, 1.081045, -0.4921859, 0, 0, 0, 1, 1,
-0.4148677, -0.7755521, -2.980669, 0, 0, 0, 1, 1,
-0.4142553, 0.2347003, -0.4489917, 0, 0, 0, 1, 1,
-0.4097263, -0.06210126, -1.086192, 0, 0, 0, 1, 1,
-0.4084481, -0.4332933, -3.60107, 0, 0, 0, 1, 1,
-0.4073181, 0.4042301, -0.5952159, 0, 0, 0, 1, 1,
-0.4070584, 1.107125, -1.046269, 0, 0, 0, 1, 1,
-0.4055132, -1.248493, -2.057242, 1, 1, 1, 1, 1,
-0.4039163, 0.368458, -3.584008, 1, 1, 1, 1, 1,
-0.4037379, -0.8981465, -2.444759, 1, 1, 1, 1, 1,
-0.4017442, 0.7343639, -1.063162, 1, 1, 1, 1, 1,
-0.3955287, 0.2459271, -0.9047135, 1, 1, 1, 1, 1,
-0.393756, -0.4148214, -3.595706, 1, 1, 1, 1, 1,
-0.3886809, 0.3816011, -0.8155575, 1, 1, 1, 1, 1,
-0.3866137, -0.3548658, -2.778167, 1, 1, 1, 1, 1,
-0.3863889, 0.7580098, -1.106751, 1, 1, 1, 1, 1,
-0.3743924, -0.9257995, -3.131908, 1, 1, 1, 1, 1,
-0.3711222, 1.587171, -0.551706, 1, 1, 1, 1, 1,
-0.3684433, -1.274871, -2.654373, 1, 1, 1, 1, 1,
-0.3656412, -0.2669793, -3.358573, 1, 1, 1, 1, 1,
-0.361645, -1.394204, -3.52558, 1, 1, 1, 1, 1,
-0.3565032, -0.3474803, -3.721596, 1, 1, 1, 1, 1,
-0.3480921, -0.5586146, -4.720914, 0, 0, 1, 1, 1,
-0.3453519, -1.626337, -3.118754, 1, 0, 0, 1, 1,
-0.3441184, 0.2520477, -0.2950642, 1, 0, 0, 1, 1,
-0.3438676, -1.762779, -3.241058, 1, 0, 0, 1, 1,
-0.3430349, -0.1029628, -3.802177, 1, 0, 0, 1, 1,
-0.3428774, -0.9288798, -2.614749, 1, 0, 0, 1, 1,
-0.3408625, -1.028551, -2.346206, 0, 0, 0, 1, 1,
-0.3405169, -0.1989828, -2.942639, 0, 0, 0, 1, 1,
-0.3380382, 0.1896187, 0.2820067, 0, 0, 0, 1, 1,
-0.3379003, 0.3070066, -2.920083, 0, 0, 0, 1, 1,
-0.3365097, 0.5984338, -0.2949705, 0, 0, 0, 1, 1,
-0.3354116, 0.05784954, -1.578671, 0, 0, 0, 1, 1,
-0.3309028, 0.396786, -1.554439, 0, 0, 0, 1, 1,
-0.3205294, -0.4403237, -2.449058, 1, 1, 1, 1, 1,
-0.3198679, 0.8518998, 0.3999625, 1, 1, 1, 1, 1,
-0.3188457, 0.6006564, -2.367925, 1, 1, 1, 1, 1,
-0.3181344, 0.6169733, -1.244912, 1, 1, 1, 1, 1,
-0.3135422, -1.608375, -4.236952, 1, 1, 1, 1, 1,
-0.3082583, 0.1198902, -2.478257, 1, 1, 1, 1, 1,
-0.3000774, 1.000764, 1.635583, 1, 1, 1, 1, 1,
-0.2993742, -0.4848997, -1.671513, 1, 1, 1, 1, 1,
-0.2989934, 0.8678058, 0.1676526, 1, 1, 1, 1, 1,
-0.2982388, -0.03313026, -0.804649, 1, 1, 1, 1, 1,
-0.2960644, 0.3942989, 0.6132538, 1, 1, 1, 1, 1,
-0.2946986, 1.208417, -1.97891, 1, 1, 1, 1, 1,
-0.2897371, 1.438835, -0.4407009, 1, 1, 1, 1, 1,
-0.2864349, 0.3067807, -1.176316, 1, 1, 1, 1, 1,
-0.2853824, 0.2110369, -0.2879569, 1, 1, 1, 1, 1,
-0.2833767, 1.877207, -1.251846, 0, 0, 1, 1, 1,
-0.2831675, -0.304186, -2.744885, 1, 0, 0, 1, 1,
-0.2795931, -0.523811, -3.476901, 1, 0, 0, 1, 1,
-0.2769246, 1.535275, 0.2645907, 1, 0, 0, 1, 1,
-0.2754557, 0.6727566, 0.2823681, 1, 0, 0, 1, 1,
-0.274318, 0.3784325, -0.5753701, 1, 0, 0, 1, 1,
-0.270437, -0.3634997, -4.619677, 0, 0, 0, 1, 1,
-0.2638765, -0.2165257, -1.940953, 0, 0, 0, 1, 1,
-0.2624126, 1.68565, -1.528385, 0, 0, 0, 1, 1,
-0.2620742, 1.056557, 0.4014028, 0, 0, 0, 1, 1,
-0.2562547, 0.779952, 0.3721417, 0, 0, 0, 1, 1,
-0.2546042, -0.931552, -2.72588, 0, 0, 0, 1, 1,
-0.2535291, 0.1789897, -2.51154, 0, 0, 0, 1, 1,
-0.2532617, 0.7682143, -0.9473247, 1, 1, 1, 1, 1,
-0.2531952, -0.7332542, -1.676212, 1, 1, 1, 1, 1,
-0.246507, -0.837638, -2.349042, 1, 1, 1, 1, 1,
-0.2411811, 0.1951364, -2.111216, 1, 1, 1, 1, 1,
-0.2406057, 0.7002478, -0.05665204, 1, 1, 1, 1, 1,
-0.2351314, 0.3972833, -0.677504, 1, 1, 1, 1, 1,
-0.2345748, -1.395893, -1.990431, 1, 1, 1, 1, 1,
-0.2345249, -0.02479989, -1.008282, 1, 1, 1, 1, 1,
-0.2311573, 0.1236821, -1.688514, 1, 1, 1, 1, 1,
-0.2293542, 1.310487, -0.5766845, 1, 1, 1, 1, 1,
-0.2289569, -2.222128, -3.720575, 1, 1, 1, 1, 1,
-0.2256839, -0.2853226, -2.222513, 1, 1, 1, 1, 1,
-0.2251615, 0.3275254, -0.7596747, 1, 1, 1, 1, 1,
-0.2240222, -0.1524044, -3.363252, 1, 1, 1, 1, 1,
-0.2225901, -2.023908, -2.088158, 1, 1, 1, 1, 1,
-0.2196707, -0.8081458, -1.658215, 0, 0, 1, 1, 1,
-0.217652, 1.009669, -0.7148175, 1, 0, 0, 1, 1,
-0.2108234, 0.3880633, 0.1498003, 1, 0, 0, 1, 1,
-0.2107127, -0.7341194, -2.961158, 1, 0, 0, 1, 1,
-0.203895, 1.477225, -0.3545355, 1, 0, 0, 1, 1,
-0.2037072, -2.14783, -1.19785, 1, 0, 0, 1, 1,
-0.2011587, 1.092009, 1.15794, 0, 0, 0, 1, 1,
-0.1866311, -2.621008, -2.279019, 0, 0, 0, 1, 1,
-0.1800357, -0.02914191, -2.709733, 0, 0, 0, 1, 1,
-0.1782218, -0.6514664, -1.087749, 0, 0, 0, 1, 1,
-0.1743532, 2.543286, -0.7513731, 0, 0, 0, 1, 1,
-0.1692735, 0.1063454, -0.8235494, 0, 0, 0, 1, 1,
-0.1651923, 1.079651, -0.7830055, 0, 0, 0, 1, 1,
-0.163848, 0.230608, 0.3890069, 1, 1, 1, 1, 1,
-0.1580393, -0.615553, -2.379093, 1, 1, 1, 1, 1,
-0.1547555, 1.818958, -1.468461, 1, 1, 1, 1, 1,
-0.1513667, 0.5440268, -0.5833352, 1, 1, 1, 1, 1,
-0.150648, 0.8460523, 0.993201, 1, 1, 1, 1, 1,
-0.1472958, 0.6128586, -1.818579, 1, 1, 1, 1, 1,
-0.1415278, 0.09381378, -1.820806, 1, 1, 1, 1, 1,
-0.1405089, 0.8404811, -0.3202601, 1, 1, 1, 1, 1,
-0.1376489, -1.252934, -3.681521, 1, 1, 1, 1, 1,
-0.1366144, 0.7194791, -1.251976, 1, 1, 1, 1, 1,
-0.1363589, -0.8629245, -3.30389, 1, 1, 1, 1, 1,
-0.1356028, 0.1638644, -0.2998218, 1, 1, 1, 1, 1,
-0.1325156, -0.08525608, -2.27242, 1, 1, 1, 1, 1,
-0.1294332, -0.4880779, -5.57168, 1, 1, 1, 1, 1,
-0.1291791, -1.42662, -5.008159, 1, 1, 1, 1, 1,
-0.1281017, 0.6131424, -0.139805, 0, 0, 1, 1, 1,
-0.1274962, -0.4062511, -0.6782771, 1, 0, 0, 1, 1,
-0.1265419, 1.30094, 1.880166, 1, 0, 0, 1, 1,
-0.123325, 2.003464, -0.742247, 1, 0, 0, 1, 1,
-0.1219259, 0.7187163, 0.5424588, 1, 0, 0, 1, 1,
-0.1194004, -0.9014137, -1.363558, 1, 0, 0, 1, 1,
-0.1185955, 1.855078, 1.96189, 0, 0, 0, 1, 1,
-0.1145947, 0.4098918, -1.090928, 0, 0, 0, 1, 1,
-0.1084599, -0.4149202, -2.149418, 0, 0, 0, 1, 1,
-0.1072895, -0.2182762, -0.3540924, 0, 0, 0, 1, 1,
-0.1067521, -0.5393509, -3.133091, 0, 0, 0, 1, 1,
-0.1007067, -0.6157864, -2.146304, 0, 0, 0, 1, 1,
-0.09644072, -0.2001802, -2.908083, 0, 0, 0, 1, 1,
-0.09541319, -0.4306978, -2.614225, 1, 1, 1, 1, 1,
-0.09498204, -2.137396, -1.638442, 1, 1, 1, 1, 1,
-0.09187317, -0.4882313, -1.596595, 1, 1, 1, 1, 1,
-0.08878882, 1.105721, 0.8682019, 1, 1, 1, 1, 1,
-0.08797837, 0.9815851, 1.065231, 1, 1, 1, 1, 1,
-0.08332457, 0.4287018, -1.812628, 1, 1, 1, 1, 1,
-0.08147022, -0.9389685, -3.692269, 1, 1, 1, 1, 1,
-0.08111385, -0.9695526, -2.329218, 1, 1, 1, 1, 1,
-0.08109071, 0.3452314, 0.2166072, 1, 1, 1, 1, 1,
-0.07987301, 0.1906937, -1.741373, 1, 1, 1, 1, 1,
-0.07948688, -1.822813, -1.835621, 1, 1, 1, 1, 1,
-0.07805896, 0.7039299, -1.646858, 1, 1, 1, 1, 1,
-0.07782581, -0.364263, -2.608644, 1, 1, 1, 1, 1,
-0.07731827, 0.3149673, 0.8818344, 1, 1, 1, 1, 1,
-0.07452824, -0.9588493, -3.132385, 1, 1, 1, 1, 1,
-0.07154726, 1.18539, 0.9212159, 0, 0, 1, 1, 1,
-0.05811367, 2.790114, 0.4142047, 1, 0, 0, 1, 1,
-0.05543671, -0.4416276, -2.639742, 1, 0, 0, 1, 1,
-0.04773845, -1.081198, -3.142968, 1, 0, 0, 1, 1,
-0.04553, -0.1534023, -1.838908, 1, 0, 0, 1, 1,
-0.04549295, -1.551305, -3.441978, 1, 0, 0, 1, 1,
-0.04491446, -0.03233091, -2.330979, 0, 0, 0, 1, 1,
-0.04391467, -0.9934091, -1.560106, 0, 0, 0, 1, 1,
-0.04388212, 0.6253266, 1.368246, 0, 0, 0, 1, 1,
-0.04386874, -0.05879679, -0.3802846, 0, 0, 0, 1, 1,
-0.04305254, -1.871847, -4.826289, 0, 0, 0, 1, 1,
-0.03550348, 0.2264483, 0.1397581, 0, 0, 0, 1, 1,
-0.03544172, 0.07580504, -0.4075279, 0, 0, 0, 1, 1,
-0.03426437, -0.6984872, -2.696611, 1, 1, 1, 1, 1,
-0.03051301, 0.3011798, -0.7550902, 1, 1, 1, 1, 1,
-0.030511, 0.6593483, 0.5537636, 1, 1, 1, 1, 1,
-0.03012645, -0.3538517, -2.517257, 1, 1, 1, 1, 1,
-0.02299369, 0.7235107, 1.488337, 1, 1, 1, 1, 1,
-0.02013378, 1.328407, -0.4975896, 1, 1, 1, 1, 1,
-0.01830718, -0.5660337, -0.2400857, 1, 1, 1, 1, 1,
-0.01259576, 0.1324528, 3.425792, 1, 1, 1, 1, 1,
-0.006374171, -0.1893819, -3.622622, 1, 1, 1, 1, 1,
-0.00587396, 1.4133, 0.9194424, 1, 1, 1, 1, 1,
-0.003129627, -1.845725, -3.561057, 1, 1, 1, 1, 1,
-0.002844454, -1.773077, -4.542227, 1, 1, 1, 1, 1,
0.0001801989, 1.22641, -0.2756416, 1, 1, 1, 1, 1,
0.0005361498, -0.462402, 2.37603, 1, 1, 1, 1, 1,
0.001548638, 0.7364569, -1.079027, 1, 1, 1, 1, 1,
0.002632249, 0.9797596, -0.9140084, 0, 0, 1, 1, 1,
0.006661523, -0.6684457, 4.080924, 1, 0, 0, 1, 1,
0.01019116, 0.1476245, 0.04074125, 1, 0, 0, 1, 1,
0.01644024, -0.5605932, 2.273127, 1, 0, 0, 1, 1,
0.01796355, 1.258442, 0.2577974, 1, 0, 0, 1, 1,
0.01863644, -1.834681, 3.026547, 1, 0, 0, 1, 1,
0.02045249, -1.716004, 1.887415, 0, 0, 0, 1, 1,
0.02448015, 1.644225, 0.2020571, 0, 0, 0, 1, 1,
0.02761542, 1.478462, -0.6319519, 0, 0, 0, 1, 1,
0.03037818, -1.247714, 2.635521, 0, 0, 0, 1, 1,
0.0326747, 0.2536904, 1.502183, 0, 0, 0, 1, 1,
0.03469169, 0.4809012, -0.05604553, 0, 0, 0, 1, 1,
0.03553971, 0.345403, 0.5812211, 0, 0, 0, 1, 1,
0.03790998, -1.245237, 4.644689, 1, 1, 1, 1, 1,
0.04051115, 0.0932316, 0.2909058, 1, 1, 1, 1, 1,
0.04099207, -0.8662038, 5.75911, 1, 1, 1, 1, 1,
0.04239462, -1.002786, 1.487483, 1, 1, 1, 1, 1,
0.04509841, 0.6072422, -0.305434, 1, 1, 1, 1, 1,
0.04531679, -0.2033605, 2.174408, 1, 1, 1, 1, 1,
0.04921092, 0.04828459, 3.662376, 1, 1, 1, 1, 1,
0.04931366, -1.821224, 2.444056, 1, 1, 1, 1, 1,
0.05919824, -1.195917, 2.73314, 1, 1, 1, 1, 1,
0.05963886, -0.5007869, 2.364267, 1, 1, 1, 1, 1,
0.06363048, 0.9643499, 0.8498669, 1, 1, 1, 1, 1,
0.06842823, -2.092578, 3.915407, 1, 1, 1, 1, 1,
0.07658259, 1.096443, 1.006178, 1, 1, 1, 1, 1,
0.07976434, 0.7964318, -0.4823048, 1, 1, 1, 1, 1,
0.08211271, 0.9805976, 0.3321664, 1, 1, 1, 1, 1,
0.08808638, -0.243273, 4.369867, 0, 0, 1, 1, 1,
0.08867989, 1.858227, 2.49005, 1, 0, 0, 1, 1,
0.08992278, -2.30656, 5.921807, 1, 0, 0, 1, 1,
0.09235215, 0.3738591, 0.05747586, 1, 0, 0, 1, 1,
0.09605005, -0.9102793, 3.917157, 1, 0, 0, 1, 1,
0.09638724, -1.575923, 2.496463, 1, 0, 0, 1, 1,
0.09984385, 0.9029534, 0.660679, 0, 0, 0, 1, 1,
0.1011642, -0.3653408, 2.578614, 0, 0, 0, 1, 1,
0.1045568, 0.1258051, 0.561845, 0, 0, 0, 1, 1,
0.105053, -1.935952, 4.08721, 0, 0, 0, 1, 1,
0.1067591, 1.377443, 2.012361, 0, 0, 0, 1, 1,
0.114699, 0.6846255, 0.1132947, 0, 0, 0, 1, 1,
0.1163895, -0.3874919, 2.950651, 0, 0, 0, 1, 1,
0.1186245, 0.1943756, 0.5811385, 1, 1, 1, 1, 1,
0.1200548, -0.7675202, 1.657511, 1, 1, 1, 1, 1,
0.1266895, 0.8954477, -0.1223494, 1, 1, 1, 1, 1,
0.1280983, -1.580845, 2.438624, 1, 1, 1, 1, 1,
0.1292314, -1.174695, 2.543922, 1, 1, 1, 1, 1,
0.1297025, -0.6177794, 3.48611, 1, 1, 1, 1, 1,
0.1316094, 0.3680043, 0.560361, 1, 1, 1, 1, 1,
0.1336642, 1.004446, 1.40496, 1, 1, 1, 1, 1,
0.1357248, 0.708481, 2.118297, 1, 1, 1, 1, 1,
0.1430291, -0.1546605, 2.427629, 1, 1, 1, 1, 1,
0.1458019, 1.253008, 0.04282173, 1, 1, 1, 1, 1,
0.1497992, 1.14513, 2.373934, 1, 1, 1, 1, 1,
0.1518082, -0.6947715, 3.365289, 1, 1, 1, 1, 1,
0.1520644, -1.952132, 3.582712, 1, 1, 1, 1, 1,
0.1605978, -2.078136, 2.823544, 1, 1, 1, 1, 1,
0.1611985, -0.8927497, 3.140158, 0, 0, 1, 1, 1,
0.162942, -0.6422248, 2.882418, 1, 0, 0, 1, 1,
0.1629705, 1.039837, -0.542724, 1, 0, 0, 1, 1,
0.1687948, -0.6602467, 3.926816, 1, 0, 0, 1, 1,
0.170793, 1.575157, 0.3144885, 1, 0, 0, 1, 1,
0.171258, -0.7780465, 2.00181, 1, 0, 0, 1, 1,
0.1769164, -0.2066009, 3.091193, 0, 0, 0, 1, 1,
0.1825414, -0.8100933, 3.585427, 0, 0, 0, 1, 1,
0.1950853, 0.763421, 1.07251, 0, 0, 0, 1, 1,
0.1983821, 0.8930743, -1.328708, 0, 0, 0, 1, 1,
0.208854, 2.637189, 1.813377, 0, 0, 0, 1, 1,
0.2091179, -0.9308122, 1.894393, 0, 0, 0, 1, 1,
0.2098359, 0.4384397, 1.920201, 0, 0, 0, 1, 1,
0.2098826, 1.117059, 1.708107, 1, 1, 1, 1, 1,
0.2111496, -0.8309715, 3.162018, 1, 1, 1, 1, 1,
0.213269, -0.2763406, 3.688748, 1, 1, 1, 1, 1,
0.2168004, 2.145179, -0.157473, 1, 1, 1, 1, 1,
0.2175736, 1.111278, 0.3462994, 1, 1, 1, 1, 1,
0.2187458, 0.260092, 0.1830715, 1, 1, 1, 1, 1,
0.2207734, 0.9971167, 2.050113, 1, 1, 1, 1, 1,
0.2256983, -0.4303465, 3.361117, 1, 1, 1, 1, 1,
0.2306155, -0.2997254, 2.094717, 1, 1, 1, 1, 1,
0.2315425, -1.912, 2.607245, 1, 1, 1, 1, 1,
0.2347598, 0.6972524, 0.6658246, 1, 1, 1, 1, 1,
0.2406501, -0.7100059, 4.192974, 1, 1, 1, 1, 1,
0.24236, 0.6793687, -0.1344283, 1, 1, 1, 1, 1,
0.2452457, 0.418527, 0.7679381, 1, 1, 1, 1, 1,
0.2457474, 0.317016, -0.8289559, 1, 1, 1, 1, 1,
0.2475149, -0.4803268, 3.034936, 0, 0, 1, 1, 1,
0.2478568, -1.645882, 3.554535, 1, 0, 0, 1, 1,
0.2554274, -2.397721, 0.7970273, 1, 0, 0, 1, 1,
0.2679035, 0.5259839, -1.077762, 1, 0, 0, 1, 1,
0.2718556, 1.482155, 1.839232, 1, 0, 0, 1, 1,
0.272218, 0.8493819, 1.019786, 1, 0, 0, 1, 1,
0.2724319, 1.174959, 0.3675714, 0, 0, 0, 1, 1,
0.2744547, -0.1171928, 1.429871, 0, 0, 0, 1, 1,
0.2760012, -0.5954077, 2.295882, 0, 0, 0, 1, 1,
0.2760254, 0.4695871, 2.057828, 0, 0, 0, 1, 1,
0.2766882, 0.1786565, 0.0439899, 0, 0, 0, 1, 1,
0.28232, -0.7976955, 3.469225, 0, 0, 0, 1, 1,
0.2833643, 0.8857421, -0.8952456, 0, 0, 0, 1, 1,
0.2833783, 1.613707, -0.1991074, 1, 1, 1, 1, 1,
0.2923274, 0.7595831, -0.1432968, 1, 1, 1, 1, 1,
0.2936998, -0.4010138, 3.065472, 1, 1, 1, 1, 1,
0.3077278, 0.8741581, -0.3086817, 1, 1, 1, 1, 1,
0.3144433, -0.500137, 2.972585, 1, 1, 1, 1, 1,
0.3237443, -0.5505945, 1.622982, 1, 1, 1, 1, 1,
0.3251104, -0.2221708, 1.436084, 1, 1, 1, 1, 1,
0.3256381, 1.6422, 0.1846183, 1, 1, 1, 1, 1,
0.3274283, 0.2367486, 0.8298382, 1, 1, 1, 1, 1,
0.3292436, -1.579818, 3.654401, 1, 1, 1, 1, 1,
0.3306347, -0.3692982, 2.033808, 1, 1, 1, 1, 1,
0.3317319, -0.01708249, 2.05384, 1, 1, 1, 1, 1,
0.3343655, -0.9307553, 3.298832, 1, 1, 1, 1, 1,
0.3400142, 1.085737, -1.048064, 1, 1, 1, 1, 1,
0.3410285, 1.806531, 0.128814, 1, 1, 1, 1, 1,
0.3434705, -0.1575577, 1.59845, 0, 0, 1, 1, 1,
0.3438843, 1.157075, 1.347892, 1, 0, 0, 1, 1,
0.3442788, -0.003777362, -0.3741785, 1, 0, 0, 1, 1,
0.3455314, -2.789247, 2.331362, 1, 0, 0, 1, 1,
0.3478409, 1.005081, 0.4141458, 1, 0, 0, 1, 1,
0.3491153, -0.558196, 3.487605, 1, 0, 0, 1, 1,
0.3562861, -0.7051339, 3.674952, 0, 0, 0, 1, 1,
0.366634, -0.7319902, 2.395322, 0, 0, 0, 1, 1,
0.367222, -1.101958, 3.438951, 0, 0, 0, 1, 1,
0.3693579, -0.2766677, 2.434037, 0, 0, 0, 1, 1,
0.3698028, 1.968297, 0.8909403, 0, 0, 0, 1, 1,
0.3710942, -0.2588186, 2.019104, 0, 0, 0, 1, 1,
0.373033, 1.185165, 0.147737, 0, 0, 0, 1, 1,
0.3802851, 2.20625, 0.1533857, 1, 1, 1, 1, 1,
0.3948889, 1.651105, -1.013973, 1, 1, 1, 1, 1,
0.3959501, -0.03969889, 1.51216, 1, 1, 1, 1, 1,
0.3968182, -0.5868608, 2.415514, 1, 1, 1, 1, 1,
0.4010825, 1.247545, 0.9848332, 1, 1, 1, 1, 1,
0.4037361, 1.015213, -0.5048377, 1, 1, 1, 1, 1,
0.4055307, -0.804568, 1.507896, 1, 1, 1, 1, 1,
0.4057736, 0.2442907, 0.05715119, 1, 1, 1, 1, 1,
0.4088847, 1.57174, 1.299142, 1, 1, 1, 1, 1,
0.4101214, -0.3356052, 2.181287, 1, 1, 1, 1, 1,
0.410316, -1.362879, 3.282506, 1, 1, 1, 1, 1,
0.4190717, 0.6068695, 0.1743238, 1, 1, 1, 1, 1,
0.4199403, -0.7974448, 0.5583106, 1, 1, 1, 1, 1,
0.4220155, -0.8969684, 2.948338, 1, 1, 1, 1, 1,
0.4274692, -0.5156864, 1.194093, 1, 1, 1, 1, 1,
0.4327593, -0.3822879, 2.172225, 0, 0, 1, 1, 1,
0.4349691, 0.560873, -0.3785664, 1, 0, 0, 1, 1,
0.4356539, -0.9379767, 1.064281, 1, 0, 0, 1, 1,
0.4364058, 0.6778984, 0.7822185, 1, 0, 0, 1, 1,
0.4374549, -1.808938, 1.68047, 1, 0, 0, 1, 1,
0.4436058, -1.504311, 2.14167, 1, 0, 0, 1, 1,
0.4438134, -1.27457, 3.536143, 0, 0, 0, 1, 1,
0.4462516, 0.1060413, 2.817352, 0, 0, 0, 1, 1,
0.4473229, 0.5492772, 1.257707, 0, 0, 0, 1, 1,
0.4519101, -0.1619917, 0.862233, 0, 0, 0, 1, 1,
0.4566025, 0.5777916, 1.999393, 0, 0, 0, 1, 1,
0.4617139, -1.095683, 1.817897, 0, 0, 0, 1, 1,
0.4733474, 1.084754, 1.244627, 0, 0, 0, 1, 1,
0.4761677, 1.402613, -1.395173, 1, 1, 1, 1, 1,
0.4772188, 1.10081, 1.242482, 1, 1, 1, 1, 1,
0.47729, 0.3382505, 2.201684, 1, 1, 1, 1, 1,
0.4803144, 0.1374423, 0.4301736, 1, 1, 1, 1, 1,
0.4830534, -0.3828009, 0.4486817, 1, 1, 1, 1, 1,
0.4962958, -0.7224277, 3.468612, 1, 1, 1, 1, 1,
0.4972237, 0.3034788, 1.703887, 1, 1, 1, 1, 1,
0.5018411, -0.8209696, 3.473564, 1, 1, 1, 1, 1,
0.5034895, 0.775481, 1.657309, 1, 1, 1, 1, 1,
0.5050485, 1.542256, 1.471717, 1, 1, 1, 1, 1,
0.5058948, 1.07623, 0.1328194, 1, 1, 1, 1, 1,
0.5066746, 0.07643735, 1.709691, 1, 1, 1, 1, 1,
0.5099673, -0.6412497, 2.174517, 1, 1, 1, 1, 1,
0.5101966, 1.082928, 0.4694903, 1, 1, 1, 1, 1,
0.5111938, -0.4543608, 1.603499, 1, 1, 1, 1, 1,
0.5117791, 0.0264212, 1.765336, 0, 0, 1, 1, 1,
0.5121655, 0.421699, 0.8600931, 1, 0, 0, 1, 1,
0.5142305, -0.1438191, 1.468963, 1, 0, 0, 1, 1,
0.5171821, -0.5122818, 0.6462759, 1, 0, 0, 1, 1,
0.5189057, -0.07019632, 3.541607, 1, 0, 0, 1, 1,
0.5219735, -0.1357858, 2.990178, 1, 0, 0, 1, 1,
0.5222291, -0.0939193, 1.615446, 0, 0, 0, 1, 1,
0.5385315, 0.7922203, 1.098899, 0, 0, 0, 1, 1,
0.5418254, 0.04035179, 1.682872, 0, 0, 0, 1, 1,
0.551625, 0.5433787, -0.567347, 0, 0, 0, 1, 1,
0.5528592, 0.8154083, -0.1278363, 0, 0, 0, 1, 1,
0.5547854, -0.5143557, 0.3255106, 0, 0, 0, 1, 1,
0.5551159, -0.8970703, 2.876516, 0, 0, 0, 1, 1,
0.5564721, -0.5313222, 5.615783, 1, 1, 1, 1, 1,
0.5567009, -0.6178369, 2.304657, 1, 1, 1, 1, 1,
0.5657621, 1.240936, 1.363615, 1, 1, 1, 1, 1,
0.5658087, 1.056275, 1.957069, 1, 1, 1, 1, 1,
0.5688512, -0.01065807, 2.160376, 1, 1, 1, 1, 1,
0.5708348, -0.6099026, 3.059898, 1, 1, 1, 1, 1,
0.5709869, -0.4146301, 3.18778, 1, 1, 1, 1, 1,
0.5739356, 0.2537757, 2.325971, 1, 1, 1, 1, 1,
0.5741746, 0.5581487, 1.791397, 1, 1, 1, 1, 1,
0.5746616, 1.392017, 1.362009, 1, 1, 1, 1, 1,
0.5763882, 0.607833, 1.981831, 1, 1, 1, 1, 1,
0.5815378, -2.28923, 2.484004, 1, 1, 1, 1, 1,
0.5817838, -0.3582502, 1.472953, 1, 1, 1, 1, 1,
0.5829875, 1.904647, 0.5494966, 1, 1, 1, 1, 1,
0.5871776, -0.4886797, 2.042438, 1, 1, 1, 1, 1,
0.5893758, 0.9779108, 1.998506, 0, 0, 1, 1, 1,
0.5948604, -0.923004, 3.673166, 1, 0, 0, 1, 1,
0.6040267, -0.9141305, 3.511104, 1, 0, 0, 1, 1,
0.607232, 0.5073333, 0.4942303, 1, 0, 0, 1, 1,
0.6075364, -0.7865745, 3.034229, 1, 0, 0, 1, 1,
0.6082134, 1.174647, 1.144181, 1, 0, 0, 1, 1,
0.6085576, -0.546473, 2.529593, 0, 0, 0, 1, 1,
0.6090807, -1.087269, 3.497699, 0, 0, 0, 1, 1,
0.6093895, 0.2576101, 1.618375, 0, 0, 0, 1, 1,
0.6102722, 1.039151, 0.4862102, 0, 0, 0, 1, 1,
0.613563, -0.7082422, 2.899888, 0, 0, 0, 1, 1,
0.6151229, 1.314938, -0.103323, 0, 0, 0, 1, 1,
0.6285971, -0.4654856, 2.562238, 0, 0, 0, 1, 1,
0.6384745, -0.4467739, 3.288429, 1, 1, 1, 1, 1,
0.6404449, 0.5165346, -0.6217004, 1, 1, 1, 1, 1,
0.6464276, -0.7716764, 3.279566, 1, 1, 1, 1, 1,
0.655449, 1.876813, 0.996068, 1, 1, 1, 1, 1,
0.6633673, -0.2333519, 3.908158, 1, 1, 1, 1, 1,
0.6654179, 0.02140497, 1.742069, 1, 1, 1, 1, 1,
0.6671584, 1.190756, 0.3898044, 1, 1, 1, 1, 1,
0.6716886, 1.157438, 0.676564, 1, 1, 1, 1, 1,
0.6724255, -0.8431101, 2.442834, 1, 1, 1, 1, 1,
0.6756762, -0.4641917, 0.5692508, 1, 1, 1, 1, 1,
0.6768684, -0.409546, 2.799162, 1, 1, 1, 1, 1,
0.6844836, -1.738509, 2.660701, 1, 1, 1, 1, 1,
0.6879609, 0.1767912, 1.506647, 1, 1, 1, 1, 1,
0.68815, 0.8535941, 0.5313337, 1, 1, 1, 1, 1,
0.6893383, 0.8851007, -0.1489533, 1, 1, 1, 1, 1,
0.6963227, -0.5500093, 1.790897, 0, 0, 1, 1, 1,
0.7009463, -2.042065, 4.013825, 1, 0, 0, 1, 1,
0.7060978, 0.272383, 1.084052, 1, 0, 0, 1, 1,
0.7076345, -0.8647271, 0.8341484, 1, 0, 0, 1, 1,
0.7097969, 1.084078, 1.474672, 1, 0, 0, 1, 1,
0.7118941, -0.1916378, 2.903141, 1, 0, 0, 1, 1,
0.7128947, -1.47799, 1.634104, 0, 0, 0, 1, 1,
0.7131687, -1.955351, 2.672497, 0, 0, 0, 1, 1,
0.7147089, 0.9182798, 0.6764756, 0, 0, 0, 1, 1,
0.7148826, 0.902293, 0.4369223, 0, 0, 0, 1, 1,
0.7158167, -0.3623146, 3.069176, 0, 0, 0, 1, 1,
0.728202, -1.104146, 2.705808, 0, 0, 0, 1, 1,
0.7284107, 0.5550978, 1.211918, 0, 0, 0, 1, 1,
0.7325953, -0.2397765, 1.210903, 1, 1, 1, 1, 1,
0.7328525, -0.220186, 2.164428, 1, 1, 1, 1, 1,
0.7393227, -0.6953318, 3.637518, 1, 1, 1, 1, 1,
0.740994, 1.877211, -1.143851, 1, 1, 1, 1, 1,
0.7477269, -1.16358, 2.843237, 1, 1, 1, 1, 1,
0.7495208, -0.7024395, 1.028344, 1, 1, 1, 1, 1,
0.7508883, -1.878746, 1.812167, 1, 1, 1, 1, 1,
0.7530851, 1.482629, 0.06704345, 1, 1, 1, 1, 1,
0.7535639, -1.216481, 2.856897, 1, 1, 1, 1, 1,
0.7535724, 0.06338465, -1.431788, 1, 1, 1, 1, 1,
0.7537502, 0.3371907, -0.4366281, 1, 1, 1, 1, 1,
0.7548089, -0.05015638, 0.6326094, 1, 1, 1, 1, 1,
0.7549099, -0.5368811, 2.473652, 1, 1, 1, 1, 1,
0.7578009, -0.8929693, 2.966966, 1, 1, 1, 1, 1,
0.7618707, -0.5891692, 2.233772, 1, 1, 1, 1, 1,
0.7692502, 1.29865, 0.2441038, 0, 0, 1, 1, 1,
0.7756793, -0.4353348, 1.89185, 1, 0, 0, 1, 1,
0.7773904, 0.3194306, 1.762196, 1, 0, 0, 1, 1,
0.7809048, 0.62203, 2.839211, 1, 0, 0, 1, 1,
0.7914507, -0.6707898, 2.672168, 1, 0, 0, 1, 1,
0.7931635, -0.4256541, 2.62201, 1, 0, 0, 1, 1,
0.7935464, 1.263698, 0.5683917, 0, 0, 0, 1, 1,
0.8031262, -0.2577708, 1.159214, 0, 0, 0, 1, 1,
0.8062803, -0.5166397, 2.669622, 0, 0, 0, 1, 1,
0.8079752, -0.02238819, 1.134214, 0, 0, 0, 1, 1,
0.8091648, 1.881204, 1.276079, 0, 0, 0, 1, 1,
0.8093506, 1.573341, 1.392413, 0, 0, 0, 1, 1,
0.8093633, -1.67684, 1.699641, 0, 0, 0, 1, 1,
0.8102582, 0.238843, 2.87836, 1, 1, 1, 1, 1,
0.8143081, 0.6109101, 1.473062, 1, 1, 1, 1, 1,
0.8146523, -1.319322, 2.53392, 1, 1, 1, 1, 1,
0.8183889, -1.024353, 1.912147, 1, 1, 1, 1, 1,
0.819725, -0.9830475, 2.848066, 1, 1, 1, 1, 1,
0.8205113, 0.2338921, -0.9250712, 1, 1, 1, 1, 1,
0.8238373, -0.4324208, 2.807424, 1, 1, 1, 1, 1,
0.8251787, -0.5032423, 1.660574, 1, 1, 1, 1, 1,
0.8263867, 0.478981, 1.870996, 1, 1, 1, 1, 1,
0.8277659, 0.2726788, 2.147593, 1, 1, 1, 1, 1,
0.8286839, -0.3588365, 0.1315418, 1, 1, 1, 1, 1,
0.8322279, -0.934489, 1.983497, 1, 1, 1, 1, 1,
0.8333746, -0.5406738, 1.895135, 1, 1, 1, 1, 1,
0.8352956, -1.55429, 2.59242, 1, 1, 1, 1, 1,
0.8354308, -0.260907, 3.431225, 1, 1, 1, 1, 1,
0.8363825, -1.787971, 3.319915, 0, 0, 1, 1, 1,
0.8460145, -0.08915991, 0.5546325, 1, 0, 0, 1, 1,
0.850338, 0.3893288, 0.4395538, 1, 0, 0, 1, 1,
0.8511599, 1.645487, 0.6942776, 1, 0, 0, 1, 1,
0.8516124, -0.1403777, 1.05702, 1, 0, 0, 1, 1,
0.8564829, 1.978578, 0.002149997, 1, 0, 0, 1, 1,
0.8583202, -0.8841326, 2.613428, 0, 0, 0, 1, 1,
0.858336, 0.9241863, -0.5664114, 0, 0, 0, 1, 1,
0.8606765, 0.9890124, 0.2657617, 0, 0, 0, 1, 1,
0.8624687, 0.6465898, 0.7421559, 0, 0, 0, 1, 1,
0.8708677, -2.420495, 3.798452, 0, 0, 0, 1, 1,
0.8761119, 0.05277104, 1.167952, 0, 0, 0, 1, 1,
0.8764932, -1.007425, 3.217458, 0, 0, 0, 1, 1,
0.8780718, 1.272597, -0.02713256, 1, 1, 1, 1, 1,
0.8807193, -2.000528, 3.476294, 1, 1, 1, 1, 1,
0.8820325, -1.385066, 3.023878, 1, 1, 1, 1, 1,
0.8820849, -0.5643318, 1.508216, 1, 1, 1, 1, 1,
0.8840292, -0.4737999, 2.620238, 1, 1, 1, 1, 1,
0.8846318, 0.7004946, -1.328059, 1, 1, 1, 1, 1,
0.8893644, -0.7367818, 1.295009, 1, 1, 1, 1, 1,
0.9127675, 0.7155563, 1.606105, 1, 1, 1, 1, 1,
0.9140912, 0.1183616, 1.978087, 1, 1, 1, 1, 1,
0.9265526, 0.3062791, 0.9633479, 1, 1, 1, 1, 1,
0.9272871, -0.2191157, 2.262873, 1, 1, 1, 1, 1,
0.9378116, -1.163165, 3.970258, 1, 1, 1, 1, 1,
0.9411889, -0.6516701, 1.54337, 1, 1, 1, 1, 1,
0.9450297, -0.8079231, 1.835358, 1, 1, 1, 1, 1,
0.9475611, 0.4380376, -1.445929, 1, 1, 1, 1, 1,
0.9502015, -0.1330354, 1.871639, 0, 0, 1, 1, 1,
0.9525766, 0.1095139, 0.2760139, 1, 0, 0, 1, 1,
0.9531271, -0.7275354, 3.219902, 1, 0, 0, 1, 1,
0.9602155, -0.4426435, 1.271471, 1, 0, 0, 1, 1,
0.9619745, -0.1471565, 2.128024, 1, 0, 0, 1, 1,
0.9697876, 1.513293, 0.8962939, 1, 0, 0, 1, 1,
0.9756036, -0.260741, 2.117044, 0, 0, 0, 1, 1,
0.9785047, 1.567327, 2.455817, 0, 0, 0, 1, 1,
0.9841271, 1.238416, 1.576685, 0, 0, 0, 1, 1,
0.9841804, 0.644714, 0.5356967, 0, 0, 0, 1, 1,
0.9874423, 0.1968986, 2.10426, 0, 0, 0, 1, 1,
0.9876493, -1.010016, 2.173275, 0, 0, 0, 1, 1,
0.9881955, -1.103452, 1.299049, 0, 0, 0, 1, 1,
0.9891886, -1.677835, 1.759381, 1, 1, 1, 1, 1,
0.9892008, -1.432974, 2.656047, 1, 1, 1, 1, 1,
0.9918235, 0.6082205, 0.5033475, 1, 1, 1, 1, 1,
1.00376, 0.05647514, 0.9277375, 1, 1, 1, 1, 1,
1.014649, -0.2275488, 2.284537, 1, 1, 1, 1, 1,
1.04784, -0.5879596, 2.826801, 1, 1, 1, 1, 1,
1.049593, 0.2771285, 1.736745, 1, 1, 1, 1, 1,
1.049652, 0.8045846, 1.110632, 1, 1, 1, 1, 1,
1.054328, 2.228659, 0.02564932, 1, 1, 1, 1, 1,
1.056836, 0.1723285, 1.128953, 1, 1, 1, 1, 1,
1.057009, -0.664261, 3.627615, 1, 1, 1, 1, 1,
1.06239, 0.4487137, 1.722533, 1, 1, 1, 1, 1,
1.065884, -0.8443029, 1.189463, 1, 1, 1, 1, 1,
1.066603, 2.034027, 0.6643038, 1, 1, 1, 1, 1,
1.069608, -1.011114, 0.653136, 1, 1, 1, 1, 1,
1.07235, -0.4231449, 1.380839, 0, 0, 1, 1, 1,
1.074534, 0.1802872, 0.7419815, 1, 0, 0, 1, 1,
1.085483, 1.17718, 2.179886, 1, 0, 0, 1, 1,
1.089679, 0.1983076, 1.828445, 1, 0, 0, 1, 1,
1.091686, 0.08029053, 0.8555009, 1, 0, 0, 1, 1,
1.099836, -0.1815788, 2.01339, 1, 0, 0, 1, 1,
1.111244, 0.2118585, -0.1810306, 0, 0, 0, 1, 1,
1.11401, 1.913969, -0.5616269, 0, 0, 0, 1, 1,
1.126868, -0.1108078, 1.153578, 0, 0, 0, 1, 1,
1.13067, -0.1469945, 0.2278224, 0, 0, 0, 1, 1,
1.139048, 0.05241072, 0.7344822, 0, 0, 0, 1, 1,
1.16301, -0.2154029, 1.710503, 0, 0, 0, 1, 1,
1.163947, -0.7696585, 3.405013, 0, 0, 0, 1, 1,
1.164664, -0.2397695, 2.312516, 1, 1, 1, 1, 1,
1.16514, -0.7203438, 0.5382639, 1, 1, 1, 1, 1,
1.172597, 0.3496454, 2.147013, 1, 1, 1, 1, 1,
1.174775, 0.1452978, 0.5740745, 1, 1, 1, 1, 1,
1.179085, -0.1835672, 0.9582638, 1, 1, 1, 1, 1,
1.18356, 1.677343, 1.702544, 1, 1, 1, 1, 1,
1.198948, -0.2780013, 2.099861, 1, 1, 1, 1, 1,
1.204551, 0.3010548, 0.5706654, 1, 1, 1, 1, 1,
1.207126, -0.02305524, 0.9736492, 1, 1, 1, 1, 1,
1.226099, -1.506747, 2.066351, 1, 1, 1, 1, 1,
1.230277, -0.07590489, -0.8033625, 1, 1, 1, 1, 1,
1.233939, 0.6288584, -0.374349, 1, 1, 1, 1, 1,
1.243332, -0.9310573, 1.77556, 1, 1, 1, 1, 1,
1.246151, -0.697384, 2.706372, 1, 1, 1, 1, 1,
1.24729, 0.1204024, 0.2716839, 1, 1, 1, 1, 1,
1.247739, 0.5849816, 0.2792054, 0, 0, 1, 1, 1,
1.250693, -1.100653, 2.235968, 1, 0, 0, 1, 1,
1.2519, -0.7458994, 2.471729, 1, 0, 0, 1, 1,
1.255886, -0.08561482, 1.627295, 1, 0, 0, 1, 1,
1.266219, 0.3524982, 2.735654, 1, 0, 0, 1, 1,
1.271568, -0.4009822, 3.757121, 1, 0, 0, 1, 1,
1.293733, -0.6181753, 1.769072, 0, 0, 0, 1, 1,
1.294376, 2.410428, 0.1954872, 0, 0, 0, 1, 1,
1.29443, -0.5940591, 1.53728, 0, 0, 0, 1, 1,
1.296121, -0.3558121, 2.386716, 0, 0, 0, 1, 1,
1.300058, 0.392539, -0.1281359, 0, 0, 0, 1, 1,
1.308582, 1.26173, 0.4541335, 0, 0, 0, 1, 1,
1.317596, 0.2216307, 1.374524, 0, 0, 0, 1, 1,
1.317727, -1.224945, 2.045068, 1, 1, 1, 1, 1,
1.318605, -0.4798366, 3.59365, 1, 1, 1, 1, 1,
1.318905, -1.519917, 2.6099, 1, 1, 1, 1, 1,
1.319215, 0.3272471, 0.5433216, 1, 1, 1, 1, 1,
1.33024, 2.331559, 0.8931787, 1, 1, 1, 1, 1,
1.3309, -0.2197733, 0.8107082, 1, 1, 1, 1, 1,
1.340559, -1.0103, 2.459935, 1, 1, 1, 1, 1,
1.350691, 1.541948, -0.7455173, 1, 1, 1, 1, 1,
1.352947, -0.2308249, 3.344602, 1, 1, 1, 1, 1,
1.363647, 1.257565, 0.8764873, 1, 1, 1, 1, 1,
1.383918, 0.5707195, 0.9593067, 1, 1, 1, 1, 1,
1.392351, -0.3667176, 1.147222, 1, 1, 1, 1, 1,
1.394252, -1.723158, 3.146891, 1, 1, 1, 1, 1,
1.396772, 0.124945, 1.918098, 1, 1, 1, 1, 1,
1.397275, 0.6869057, 3.672843, 1, 1, 1, 1, 1,
1.411924, -1.831399, 1.154556, 0, 0, 1, 1, 1,
1.424752, 0.6469734, 0.9622476, 1, 0, 0, 1, 1,
1.426226, -0.1504332, 0.4240897, 1, 0, 0, 1, 1,
1.42982, -0.2596197, 1.594985, 1, 0, 0, 1, 1,
1.440054, -0.8043755, 1.73327, 1, 0, 0, 1, 1,
1.442487, -0.2963738, 1.577797, 1, 0, 0, 1, 1,
1.453969, 1.461707, 0.08424652, 0, 0, 0, 1, 1,
1.458529, 0.9914715, 0.5265123, 0, 0, 0, 1, 1,
1.476519, -0.04228316, 1.262959, 0, 0, 0, 1, 1,
1.484687, -0.9121646, 1.605619, 0, 0, 0, 1, 1,
1.484814, -0.339875, 2.53791, 0, 0, 0, 1, 1,
1.488951, 0.9866341, 0.01180612, 0, 0, 0, 1, 1,
1.496745, -1.905365, 1.809351, 0, 0, 0, 1, 1,
1.497901, 0.2277898, 1.629414, 1, 1, 1, 1, 1,
1.515447, 0.8902751, -0.5017013, 1, 1, 1, 1, 1,
1.519667, 1.112882, 1.12817, 1, 1, 1, 1, 1,
1.521776, 0.843633, 0.464233, 1, 1, 1, 1, 1,
1.540349, 0.209763, 1.421625, 1, 1, 1, 1, 1,
1.547735, 0.8107044, 2.921928, 1, 1, 1, 1, 1,
1.553776, -0.3296429, 1.021462, 1, 1, 1, 1, 1,
1.558786, -1.062138, 0.6348088, 1, 1, 1, 1, 1,
1.58339, 0.9126597, 0.7538337, 1, 1, 1, 1, 1,
1.586051, -0.3874511, 2.183789, 1, 1, 1, 1, 1,
1.597943, 0.4876071, 3.12794, 1, 1, 1, 1, 1,
1.631541, 0.8431318, -0.02855091, 1, 1, 1, 1, 1,
1.636083, 0.7480183, 1.710187, 1, 1, 1, 1, 1,
1.639652, -0.3401731, 0.5606911, 1, 1, 1, 1, 1,
1.647646, 0.7077795, 2.989504, 1, 1, 1, 1, 1,
1.654513, 0.1874413, 1.676338, 0, 0, 1, 1, 1,
1.667931, -0.001252193, 3.409189, 1, 0, 0, 1, 1,
1.691332, -0.7188689, 2.799971, 1, 0, 0, 1, 1,
1.713646, 0.7271101, 1.210917, 1, 0, 0, 1, 1,
1.717871, 0.7994186, 0.7314505, 1, 0, 0, 1, 1,
1.755531, 1.361224, 3.52248, 1, 0, 0, 1, 1,
1.757565, -0.4475254, 1.17279, 0, 0, 0, 1, 1,
1.767914, 0.7467291, 0.7767432, 0, 0, 0, 1, 1,
1.773464, -1.782872, 1.411059, 0, 0, 0, 1, 1,
1.780385, 1.810224, -1.045954, 0, 0, 0, 1, 1,
1.783911, 0.8693576, 2.634573, 0, 0, 0, 1, 1,
1.803919, -2.474774, 2.169529, 0, 0, 0, 1, 1,
1.835842, 0.02001789, 1.900299, 0, 0, 0, 1, 1,
1.836554, 0.4428427, 1.77937, 1, 1, 1, 1, 1,
1.839543, -1.521508, 2.774429, 1, 1, 1, 1, 1,
1.852743, -0.2739192, 1.937325, 1, 1, 1, 1, 1,
1.855569, 0.4022805, 1.699548, 1, 1, 1, 1, 1,
1.867427, -0.7156662, 1.057547, 1, 1, 1, 1, 1,
1.868247, -0.2797417, 2.81055, 1, 1, 1, 1, 1,
1.897252, 0.3406895, 0.4921554, 1, 1, 1, 1, 1,
1.901471, -0.4840359, 1.196311, 1, 1, 1, 1, 1,
1.938338, -0.7486067, 0.6023239, 1, 1, 1, 1, 1,
1.939413, -1.315235, 1.953414, 1, 1, 1, 1, 1,
1.950063, -0.3539545, 1.172112, 1, 1, 1, 1, 1,
1.988999, -1.156334, 0.8711295, 1, 1, 1, 1, 1,
2.012296, 0.3946155, 1.410929, 1, 1, 1, 1, 1,
2.082436, -0.307511, 2.329977, 1, 1, 1, 1, 1,
2.12485, 1.056588, 2.07498, 1, 1, 1, 1, 1,
2.142181, 0.3493208, 2.636516, 0, 0, 1, 1, 1,
2.142517, -0.3838015, -1.300949, 1, 0, 0, 1, 1,
2.157055, -0.6848491, 1.316552, 1, 0, 0, 1, 1,
2.16158, 0.177335, 2.055737, 1, 0, 0, 1, 1,
2.18332, -0.1286265, 2.902117, 1, 0, 0, 1, 1,
2.238546, -0.4941763, 1.549861, 1, 0, 0, 1, 1,
2.260753, -0.6176455, 1.039312, 0, 0, 0, 1, 1,
2.312504, -2.069988, 0.3800552, 0, 0, 0, 1, 1,
2.334454, -0.7452919, 1.090856, 0, 0, 0, 1, 1,
2.343303, -0.07138225, 0.9732395, 0, 0, 0, 1, 1,
2.361697, 0.1969607, 0.9032754, 0, 0, 0, 1, 1,
2.371809, 0.3727726, 1.030486, 0, 0, 0, 1, 1,
2.384822, 1.431064, 0.6722242, 0, 0, 0, 1, 1,
2.468727, 0.9878117, 1.37725, 1, 1, 1, 1, 1,
2.471176, -1.58862, 2.24991, 1, 1, 1, 1, 1,
2.584385, 0.5861095, 2.041282, 1, 1, 1, 1, 1,
2.738365, 1.163131, 2.839093, 1, 1, 1, 1, 1,
2.811549, 1.076849, 0.3398475, 1, 1, 1, 1, 1,
2.823804, 2.227937, 1.023605, 1, 1, 1, 1, 1,
3.069409, 0.4470609, 1.383007, 1, 1, 1, 1, 1
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
var radius = 9.643562;
var distance = 33.8726;
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
mvMatrix.translate( -0.09489954, -0.1531916, -0.1750634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8726);
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
