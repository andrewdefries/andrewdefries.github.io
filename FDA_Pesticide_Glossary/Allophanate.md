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
-3.238068, 0.02555148, -1.562607, 1, 0, 0, 1,
-2.933704, 0.4008443, -1.414088, 1, 0.007843138, 0, 1,
-2.913934, -0.4612569, -2.36715, 1, 0.01176471, 0, 1,
-2.580016, 0.7218167, -1.186157, 1, 0.01960784, 0, 1,
-2.450168, -1.582144, -1.099529, 1, 0.02352941, 0, 1,
-2.38312, 0.1547842, -0.8217909, 1, 0.03137255, 0, 1,
-2.367076, -0.1867857, -1.931099, 1, 0.03529412, 0, 1,
-2.343943, -0.6105841, -2.535954, 1, 0.04313726, 0, 1,
-2.242681, 0.2823094, -1.708547, 1, 0.04705882, 0, 1,
-2.224879, -1.536814, -1.457484, 1, 0.05490196, 0, 1,
-2.211158, -0.56769, -1.493442, 1, 0.05882353, 0, 1,
-2.156231, 0.2274139, -1.766161, 1, 0.06666667, 0, 1,
-2.108158, 0.4611456, -1.999413, 1, 0.07058824, 0, 1,
-2.072832, 0.3681502, -0.7936646, 1, 0.07843138, 0, 1,
-2.071728, -1.276276, -3.651654, 1, 0.08235294, 0, 1,
-2.050209, 1.480501, -1.520878, 1, 0.09019608, 0, 1,
-2.038339, -0.6934053, -2.087248, 1, 0.09411765, 0, 1,
-2.026472, -0.8563216, -2.85953, 1, 0.1019608, 0, 1,
-2.011106, 0.3918233, -1.912336, 1, 0.1098039, 0, 1,
-1.988183, 1.017502, -1.503546, 1, 0.1137255, 0, 1,
-1.951669, -1.654641, -1.376842, 1, 0.1215686, 0, 1,
-1.934201, -0.3265706, -1.257827, 1, 0.1254902, 0, 1,
-1.922891, -0.1561278, -0.8200098, 1, 0.1333333, 0, 1,
-1.914229, -0.6719567, -1.807898, 1, 0.1372549, 0, 1,
-1.907979, 0.5190093, -0.692496, 1, 0.145098, 0, 1,
-1.9003, -0.07119825, -0.05332145, 1, 0.1490196, 0, 1,
-1.896809, -0.4771985, -2.783323, 1, 0.1568628, 0, 1,
-1.876573, 0.9441273, -0.2284734, 1, 0.1607843, 0, 1,
-1.875391, -0.2391772, -1.750773, 1, 0.1686275, 0, 1,
-1.872684, 0.7750041, 1.14104, 1, 0.172549, 0, 1,
-1.851205, 0.6532197, -1.522293, 1, 0.1803922, 0, 1,
-1.843282, 0.0819492, -0.516593, 1, 0.1843137, 0, 1,
-1.831277, -1.567778, -3.26503, 1, 0.1921569, 0, 1,
-1.82994, -0.7379193, -3.249981, 1, 0.1960784, 0, 1,
-1.820879, 1.196974, -1.626368, 1, 0.2039216, 0, 1,
-1.817844, 0.4333855, -1.098552, 1, 0.2117647, 0, 1,
-1.784819, 1.572532, -1.130196, 1, 0.2156863, 0, 1,
-1.770939, 0.2613697, -2.439063, 1, 0.2235294, 0, 1,
-1.756919, -0.7625495, -1.091163, 1, 0.227451, 0, 1,
-1.72457, -0.3608045, -1.661082, 1, 0.2352941, 0, 1,
-1.723498, -0.9791787, -2.458327, 1, 0.2392157, 0, 1,
-1.716458, 0.6522797, -1.873693, 1, 0.2470588, 0, 1,
-1.709335, -0.9103604, -0.7815839, 1, 0.2509804, 0, 1,
-1.696481, -1.98307, -1.162479, 1, 0.2588235, 0, 1,
-1.692989, 0.2073707, -1.406213, 1, 0.2627451, 0, 1,
-1.692517, 1.365418, -0.3091398, 1, 0.2705882, 0, 1,
-1.691071, 0.9341772, -1.646571, 1, 0.2745098, 0, 1,
-1.688679, 0.1671945, -1.744863, 1, 0.282353, 0, 1,
-1.683875, 0.1411854, -2.065735, 1, 0.2862745, 0, 1,
-1.670292, -0.2888118, -0.1192651, 1, 0.2941177, 0, 1,
-1.668705, 0.2358544, -1.439977, 1, 0.3019608, 0, 1,
-1.667988, -0.5709942, -1.326601, 1, 0.3058824, 0, 1,
-1.651857, 2.060859, -1.277734, 1, 0.3137255, 0, 1,
-1.645823, -0.3578025, -0.459949, 1, 0.3176471, 0, 1,
-1.645185, -0.8506815, -1.890631, 1, 0.3254902, 0, 1,
-1.644035, -0.1619617, -2.570027, 1, 0.3294118, 0, 1,
-1.636062, -0.4850597, -3.613522, 1, 0.3372549, 0, 1,
-1.607324, 0.3454315, -0.9874774, 1, 0.3411765, 0, 1,
-1.589133, -0.3675808, -1.350189, 1, 0.3490196, 0, 1,
-1.58582, 0.3062845, 1.192108, 1, 0.3529412, 0, 1,
-1.566211, 0.8950933, -2.660418, 1, 0.3607843, 0, 1,
-1.565964, -0.4281447, -1.133456, 1, 0.3647059, 0, 1,
-1.554381, -0.05199429, -1.771461, 1, 0.372549, 0, 1,
-1.54026, -0.4242193, -2.335768, 1, 0.3764706, 0, 1,
-1.531229, 0.1959479, 0.1757139, 1, 0.3843137, 0, 1,
-1.524137, 0.04516207, -0.4137819, 1, 0.3882353, 0, 1,
-1.503194, -0.0847672, -0.7939311, 1, 0.3960784, 0, 1,
-1.501559, -0.1251583, -1.144107, 1, 0.4039216, 0, 1,
-1.487451, 0.8199118, -1.432563, 1, 0.4078431, 0, 1,
-1.485112, -0.3304509, -2.805271, 1, 0.4156863, 0, 1,
-1.483363, -0.3579346, -0.1991958, 1, 0.4196078, 0, 1,
-1.481279, -1.200912, -2.847266, 1, 0.427451, 0, 1,
-1.473906, -0.06602881, -1.528266, 1, 0.4313726, 0, 1,
-1.471421, 0.4057, -1.608092, 1, 0.4392157, 0, 1,
-1.466442, -0.1627811, -3.164605, 1, 0.4431373, 0, 1,
-1.466068, 0.8595536, -1.364493, 1, 0.4509804, 0, 1,
-1.463336, 0.8064736, -1.668696, 1, 0.454902, 0, 1,
-1.457333, -0.3394302, -1.056076, 1, 0.4627451, 0, 1,
-1.453111, 0.9611166, -0.5628442, 1, 0.4666667, 0, 1,
-1.450614, 0.6239464, -0.9572728, 1, 0.4745098, 0, 1,
-1.447203, 0.3151956, -1.637004, 1, 0.4784314, 0, 1,
-1.445227, 0.740315, 0.437354, 1, 0.4862745, 0, 1,
-1.441116, -1.22301, -1.481318, 1, 0.4901961, 0, 1,
-1.437261, -0.4370158, -1.206803, 1, 0.4980392, 0, 1,
-1.432645, -0.5673184, -2.313894, 1, 0.5058824, 0, 1,
-1.42988, 0.9600617, 1.408667, 1, 0.509804, 0, 1,
-1.417788, -1.16824, -2.166923, 1, 0.5176471, 0, 1,
-1.400119, -1.70256, -2.388716, 1, 0.5215687, 0, 1,
-1.389527, 0.1620233, -1.536806, 1, 0.5294118, 0, 1,
-1.376511, 1.167512, -0.28575, 1, 0.5333334, 0, 1,
-1.372017, -0.3333925, -1.985686, 1, 0.5411765, 0, 1,
-1.368999, -1.62569, -2.092346, 1, 0.5450981, 0, 1,
-1.368619, 0.2788052, -1.319913, 1, 0.5529412, 0, 1,
-1.347237, -1.325073, -2.666834, 1, 0.5568628, 0, 1,
-1.34241, 0.3064166, -1.464879, 1, 0.5647059, 0, 1,
-1.331386, 0.3410075, -1.021079, 1, 0.5686275, 0, 1,
-1.330735, -0.8114542, -0.6015012, 1, 0.5764706, 0, 1,
-1.324402, -1.014377, -3.144009, 1, 0.5803922, 0, 1,
-1.323522, -0.623341, -2.371459, 1, 0.5882353, 0, 1,
-1.323277, 1.463043, 0.5208077, 1, 0.5921569, 0, 1,
-1.309042, -0.9802294, -1.81714, 1, 0.6, 0, 1,
-1.308824, -1.162798, -1.687393, 1, 0.6078432, 0, 1,
-1.284703, -1.046015, -2.568165, 1, 0.6117647, 0, 1,
-1.275542, -1.358395, -3.639695, 1, 0.6196079, 0, 1,
-1.266532, 1.509846, 0.7479221, 1, 0.6235294, 0, 1,
-1.259914, -0.5032309, -1.903068, 1, 0.6313726, 0, 1,
-1.249146, -0.1098447, -2.518906, 1, 0.6352941, 0, 1,
-1.24886, 0.09151597, -2.069527, 1, 0.6431373, 0, 1,
-1.239419, 0.3570709, -1.145866, 1, 0.6470588, 0, 1,
-1.237131, 0.9218374, -0.9095812, 1, 0.654902, 0, 1,
-1.221751, -1.701758, -3.558402, 1, 0.6588235, 0, 1,
-1.219724, 1.354407, -0.2397431, 1, 0.6666667, 0, 1,
-1.211889, -0.02029004, -2.30515, 1, 0.6705883, 0, 1,
-1.209923, 1.591326, -0.9801105, 1, 0.6784314, 0, 1,
-1.203777, -0.4612923, 0.07042725, 1, 0.682353, 0, 1,
-1.201863, 0.1414871, -1.570428, 1, 0.6901961, 0, 1,
-1.200268, -1.77359, -3.26226, 1, 0.6941177, 0, 1,
-1.200095, 0.7317454, -0.8469013, 1, 0.7019608, 0, 1,
-1.196087, 0.9682141, -1.28636, 1, 0.7098039, 0, 1,
-1.192377, -0.8012785, -2.785951, 1, 0.7137255, 0, 1,
-1.179266, 0.3549738, -2.521826, 1, 0.7215686, 0, 1,
-1.174569, 0.4079863, -0.428553, 1, 0.7254902, 0, 1,
-1.170863, 0.8821523, -0.853343, 1, 0.7333333, 0, 1,
-1.169797, -1.429102, -3.4667, 1, 0.7372549, 0, 1,
-1.168216, -0.2191114, -2.308578, 1, 0.7450981, 0, 1,
-1.167582, -1.228717, -3.231197, 1, 0.7490196, 0, 1,
-1.157221, 0.05807539, -2.424604, 1, 0.7568628, 0, 1,
-1.146312, -1.4181, -4.356963, 1, 0.7607843, 0, 1,
-1.141868, 0.6371527, -1.022972, 1, 0.7686275, 0, 1,
-1.141786, -1.402621, -2.848806, 1, 0.772549, 0, 1,
-1.138948, -0.3615911, -3.906096, 1, 0.7803922, 0, 1,
-1.134928, -1.002897, -2.727054, 1, 0.7843137, 0, 1,
-1.134197, 1.35122, -0.5812047, 1, 0.7921569, 0, 1,
-1.132929, 0.5856539, -0.2722554, 1, 0.7960784, 0, 1,
-1.130049, -0.6642123, -2.522572, 1, 0.8039216, 0, 1,
-1.126676, 1.121825, -0.1777715, 1, 0.8117647, 0, 1,
-1.114839, -1.345006, -4.37757, 1, 0.8156863, 0, 1,
-1.109883, -1.493132, -2.967136, 1, 0.8235294, 0, 1,
-1.109434, -3.184583, -1.613712, 1, 0.827451, 0, 1,
-1.100386, -0.5044593, -1.572522, 1, 0.8352941, 0, 1,
-1.099179, -0.3077706, -2.526079, 1, 0.8392157, 0, 1,
-1.092669, -0.07008676, -1.389416, 1, 0.8470588, 0, 1,
-1.087572, 0.07515962, -1.528586, 1, 0.8509804, 0, 1,
-1.082687, -1.981619, -2.729536, 1, 0.8588235, 0, 1,
-1.081478, -3.110358, -2.6903, 1, 0.8627451, 0, 1,
-1.073692, 1.503144, 0.9609534, 1, 0.8705882, 0, 1,
-1.073569, -0.4050388, -2.740299, 1, 0.8745098, 0, 1,
-1.072082, -1.090355, -2.138208, 1, 0.8823529, 0, 1,
-1.07055, 1.128549, 0.1884707, 1, 0.8862745, 0, 1,
-1.066634, -0.4798618, -2.003916, 1, 0.8941177, 0, 1,
-1.062777, 0.2705538, -3.500965, 1, 0.8980392, 0, 1,
-1.048304, -0.8539822, -1.618044, 1, 0.9058824, 0, 1,
-1.045124, 1.348342, -1.940347, 1, 0.9137255, 0, 1,
-1.035802, -0.4825795, -2.392701, 1, 0.9176471, 0, 1,
-1.03359, -0.3796631, -0.5931305, 1, 0.9254902, 0, 1,
-1.022242, -0.05272719, -0.6373402, 1, 0.9294118, 0, 1,
-1.019445, 1.123447, -0.4935621, 1, 0.9372549, 0, 1,
-1.016915, 0.09829489, -1.149391, 1, 0.9411765, 0, 1,
-1.009632, 1.109972, -0.6202786, 1, 0.9490196, 0, 1,
-1.009529, 1.230271, 0.2237174, 1, 0.9529412, 0, 1,
-1.005633, 1.20441, 0.8714359, 1, 0.9607843, 0, 1,
-1.004877, 0.4342121, 0.7233752, 1, 0.9647059, 0, 1,
-1.002356, 0.4195339, -1.462613, 1, 0.972549, 0, 1,
-1.001828, 0.5857193, -2.647111, 1, 0.9764706, 0, 1,
-1.000144, -0.3257477, -3.079015, 1, 0.9843137, 0, 1,
-0.9996572, -1.286322, -3.229106, 1, 0.9882353, 0, 1,
-0.9933423, -0.08707175, -2.528357, 1, 0.9960784, 0, 1,
-0.9884713, 0.3440263, 0.2770514, 0.9960784, 1, 0, 1,
-0.9882753, 0.8174699, -0.6051951, 0.9921569, 1, 0, 1,
-0.9782247, -1.159196, -2.050875, 0.9843137, 1, 0, 1,
-0.9779765, -0.3428949, -2.39641, 0.9803922, 1, 0, 1,
-0.9744995, 0.648901, -2.577847, 0.972549, 1, 0, 1,
-0.9659001, 1.023142, -1.075483, 0.9686275, 1, 0, 1,
-0.9561601, 0.2731702, -0.1750468, 0.9607843, 1, 0, 1,
-0.9508692, -0.9866669, -2.604255, 0.9568627, 1, 0, 1,
-0.9469121, -0.7769985, -1.911228, 0.9490196, 1, 0, 1,
-0.9428335, -0.1898226, -2.173448, 0.945098, 1, 0, 1,
-0.9416749, 0.3751885, -0.009354203, 0.9372549, 1, 0, 1,
-0.9414228, -0.04675306, -1.249291, 0.9333333, 1, 0, 1,
-0.9405711, -0.4872852, -2.584472, 0.9254902, 1, 0, 1,
-0.9375414, 0.9756857, 1.244164, 0.9215686, 1, 0, 1,
-0.9343615, 0.5506691, -1.560294, 0.9137255, 1, 0, 1,
-0.934184, 0.4153935, -2.206817, 0.9098039, 1, 0, 1,
-0.9329513, 0.6631017, -0.857758, 0.9019608, 1, 0, 1,
-0.9325079, 2.466387, 0.2445567, 0.8941177, 1, 0, 1,
-0.9313198, 1.356065, 0.2843446, 0.8901961, 1, 0, 1,
-0.9304912, 0.9098507, -2.044933, 0.8823529, 1, 0, 1,
-0.9205596, 1.349561, -0.3659507, 0.8784314, 1, 0, 1,
-0.9142351, 0.5941092, 0.9006845, 0.8705882, 1, 0, 1,
-0.9094796, -0.465712, -2.215799, 0.8666667, 1, 0, 1,
-0.9072445, 1.446887, 0.3457896, 0.8588235, 1, 0, 1,
-0.9054496, -0.4391659, -2.273049, 0.854902, 1, 0, 1,
-0.8914342, -2.035393, -2.326156, 0.8470588, 1, 0, 1,
-0.8862604, 2.218104, 0.1362851, 0.8431373, 1, 0, 1,
-0.8805305, 0.6601407, 0.3284329, 0.8352941, 1, 0, 1,
-0.8755742, -0.5483406, -2.224746, 0.8313726, 1, 0, 1,
-0.8713369, 0.654573, -0.5477237, 0.8235294, 1, 0, 1,
-0.8707647, -1.060767, -3.573648, 0.8196079, 1, 0, 1,
-0.869525, -0.1077918, -1.621275, 0.8117647, 1, 0, 1,
-0.8672378, -1.089782, -1.32183, 0.8078431, 1, 0, 1,
-0.8655583, -1.183864, -0.9176928, 0.8, 1, 0, 1,
-0.8547184, -0.5434802, -3.030484, 0.7921569, 1, 0, 1,
-0.8538529, -0.8097098, -4.851647, 0.7882353, 1, 0, 1,
-0.8536354, -0.7068655, -3.499182, 0.7803922, 1, 0, 1,
-0.8503533, -0.6370832, -2.788869, 0.7764706, 1, 0, 1,
-0.848299, 0.04865572, -2.066028, 0.7686275, 1, 0, 1,
-0.8481897, -0.1543428, -2.503232, 0.7647059, 1, 0, 1,
-0.8480791, -0.8693659, -2.514091, 0.7568628, 1, 0, 1,
-0.8460982, 0.7174134, -0.3472817, 0.7529412, 1, 0, 1,
-0.8443735, -0.5793337, -4.193463, 0.7450981, 1, 0, 1,
-0.8430623, -1.703664, -2.997559, 0.7411765, 1, 0, 1,
-0.8330902, -0.1487809, -0.6211258, 0.7333333, 1, 0, 1,
-0.8328402, 1.151169, -3.119089, 0.7294118, 1, 0, 1,
-0.8328089, -0.5563653, -1.421904, 0.7215686, 1, 0, 1,
-0.8263738, 1.208923, 0.6271383, 0.7176471, 1, 0, 1,
-0.819518, 0.506656, -0.2511031, 0.7098039, 1, 0, 1,
-0.819005, 0.7575961, -0.4628859, 0.7058824, 1, 0, 1,
-0.8156331, -0.2697916, -2.185184, 0.6980392, 1, 0, 1,
-0.8076488, 0.8606199, -1.475091, 0.6901961, 1, 0, 1,
-0.8029293, 0.5515332, -1.542502, 0.6862745, 1, 0, 1,
-0.8021253, -0.1729048, -0.8660536, 0.6784314, 1, 0, 1,
-0.8000678, -0.5593128, -1.751006, 0.6745098, 1, 0, 1,
-0.7978174, -0.3829594, -2.520593, 0.6666667, 1, 0, 1,
-0.7926409, 0.09742202, -1.320852, 0.6627451, 1, 0, 1,
-0.788869, -0.8820578, -3.362316, 0.654902, 1, 0, 1,
-0.7842206, -0.9659919, -1.498623, 0.6509804, 1, 0, 1,
-0.780964, 0.1613582, -1.506646, 0.6431373, 1, 0, 1,
-0.7731069, 0.1250495, -0.6705034, 0.6392157, 1, 0, 1,
-0.7726989, -1.035644, -5.099205, 0.6313726, 1, 0, 1,
-0.7698971, 1.17924, -0.8351846, 0.627451, 1, 0, 1,
-0.7675294, -1.057242, -2.699737, 0.6196079, 1, 0, 1,
-0.766972, 0.5589988, -0.7626838, 0.6156863, 1, 0, 1,
-0.7652325, -0.06850393, -1.491555, 0.6078432, 1, 0, 1,
-0.7618244, -0.889779, -2.086838, 0.6039216, 1, 0, 1,
-0.7595349, -0.7776879, -3.211372, 0.5960785, 1, 0, 1,
-0.7576382, 0.1998375, -0.9847487, 0.5882353, 1, 0, 1,
-0.7565705, 0.6095701, 0.1138654, 0.5843138, 1, 0, 1,
-0.7548136, 0.008602911, -1.398225, 0.5764706, 1, 0, 1,
-0.7531719, 0.3680935, 0.360589, 0.572549, 1, 0, 1,
-0.7498934, 0.2864315, -2.471272, 0.5647059, 1, 0, 1,
-0.7448364, 0.3776121, -2.356831, 0.5607843, 1, 0, 1,
-0.7422991, 0.6344628, 0.2112134, 0.5529412, 1, 0, 1,
-0.7376832, 0.5664428, 0.6429175, 0.5490196, 1, 0, 1,
-0.7351251, 0.1965523, -0.9402945, 0.5411765, 1, 0, 1,
-0.7330189, -0.4682818, -2.953937, 0.5372549, 1, 0, 1,
-0.7241656, 0.382944, -0.9470778, 0.5294118, 1, 0, 1,
-0.7231264, 1.465067, 2.006463, 0.5254902, 1, 0, 1,
-0.710389, -1.096217, -2.123132, 0.5176471, 1, 0, 1,
-0.7069997, -1.032043, -2.114536, 0.5137255, 1, 0, 1,
-0.7065786, -3.410205, -1.544098, 0.5058824, 1, 0, 1,
-0.7047368, -0.841631, -4.250631, 0.5019608, 1, 0, 1,
-0.6949369, -0.2980099, -2.423598, 0.4941176, 1, 0, 1,
-0.6948369, 1.425994, -2.404518, 0.4862745, 1, 0, 1,
-0.6945955, -1.258123, -4.210515, 0.4823529, 1, 0, 1,
-0.6911079, 0.702813, -0.9683583, 0.4745098, 1, 0, 1,
-0.6860226, 2.674272, -0.9896683, 0.4705882, 1, 0, 1,
-0.6795947, 2.781984, 0.193982, 0.4627451, 1, 0, 1,
-0.6787761, 0.8634458, -1.159832, 0.4588235, 1, 0, 1,
-0.6747203, -1.409152, -3.241519, 0.4509804, 1, 0, 1,
-0.6673527, -0.6993228, -2.905773, 0.4470588, 1, 0, 1,
-0.6603693, 0.3140649, -1.763701, 0.4392157, 1, 0, 1,
-0.659305, -1.46395, -0.7782119, 0.4352941, 1, 0, 1,
-0.65748, 0.6934604, 0.8672524, 0.427451, 1, 0, 1,
-0.6566976, -1.067074, -2.274754, 0.4235294, 1, 0, 1,
-0.6553568, 1.888507, -0.5631303, 0.4156863, 1, 0, 1,
-0.6547067, 0.3997913, -0.4307925, 0.4117647, 1, 0, 1,
-0.6537964, -0.4328096, -2.450685, 0.4039216, 1, 0, 1,
-0.6487144, -1.215618, -2.699377, 0.3960784, 1, 0, 1,
-0.6480595, -0.5749591, -1.095559, 0.3921569, 1, 0, 1,
-0.6468232, 0.04796947, -0.7450953, 0.3843137, 1, 0, 1,
-0.6444573, -0.04620992, -1.654043, 0.3803922, 1, 0, 1,
-0.6441643, -0.9277182, -1.353795, 0.372549, 1, 0, 1,
-0.6401603, -1.286834, -4.768123, 0.3686275, 1, 0, 1,
-0.6318407, -0.1535383, -1.767253, 0.3607843, 1, 0, 1,
-0.6228157, -0.1615799, -0.4988106, 0.3568628, 1, 0, 1,
-0.6198989, -0.4072647, -1.292463, 0.3490196, 1, 0, 1,
-0.6096013, -0.8333293, -2.154658, 0.345098, 1, 0, 1,
-0.6093723, -1.069038, -1.882445, 0.3372549, 1, 0, 1,
-0.6062399, -0.4620163, -2.781487, 0.3333333, 1, 0, 1,
-0.5965419, -1.356926, -3.734369, 0.3254902, 1, 0, 1,
-0.5942433, -0.3414676, -2.65345, 0.3215686, 1, 0, 1,
-0.5909812, -2.413897, -3.157995, 0.3137255, 1, 0, 1,
-0.586291, -0.9239878, -3.596867, 0.3098039, 1, 0, 1,
-0.5862173, 1.03003, -0.8691381, 0.3019608, 1, 0, 1,
-0.5801902, -0.006561995, -2.181565, 0.2941177, 1, 0, 1,
-0.5740281, -0.2163888, -1.494274, 0.2901961, 1, 0, 1,
-0.572085, 0.3188557, -0.8446332, 0.282353, 1, 0, 1,
-0.5607143, -1.040835, -3.701745, 0.2784314, 1, 0, 1,
-0.5582854, 0.5179533, -1.923365, 0.2705882, 1, 0, 1,
-0.5579768, 0.03757496, -0.2665717, 0.2666667, 1, 0, 1,
-0.5574615, 1.725711, -0.6566355, 0.2588235, 1, 0, 1,
-0.5504864, -0.9068083, -3.655076, 0.254902, 1, 0, 1,
-0.5470169, 0.5724564, 1.468383, 0.2470588, 1, 0, 1,
-0.5468577, -0.4989568, -1.687302, 0.2431373, 1, 0, 1,
-0.5454554, 1.91871, -0.831196, 0.2352941, 1, 0, 1,
-0.5430729, -0.3600722, -2.911731, 0.2313726, 1, 0, 1,
-0.5362154, 0.6161286, -1.227566, 0.2235294, 1, 0, 1,
-0.5331534, 0.3967208, -1.866756, 0.2196078, 1, 0, 1,
-0.5327809, -0.5328981, -0.1806916, 0.2117647, 1, 0, 1,
-0.5326208, 0.8571754, -0.6274503, 0.2078431, 1, 0, 1,
-0.5322633, -0.3978496, -2.800793, 0.2, 1, 0, 1,
-0.5311845, 1.362528, -1.431, 0.1921569, 1, 0, 1,
-0.5284556, 0.1711128, -1.612816, 0.1882353, 1, 0, 1,
-0.5238798, -0.7919812, -1.753131, 0.1803922, 1, 0, 1,
-0.5213275, -0.8829311, -4.766912, 0.1764706, 1, 0, 1,
-0.5146701, -0.6761891, -2.760291, 0.1686275, 1, 0, 1,
-0.5129729, 0.8639855, 0.1716606, 0.1647059, 1, 0, 1,
-0.5119179, 1.894261, 0.3849165, 0.1568628, 1, 0, 1,
-0.511593, -0.2401603, -1.529927, 0.1529412, 1, 0, 1,
-0.5105727, -0.1087386, -0.497753, 0.145098, 1, 0, 1,
-0.5099848, 0.2511064, -1.865713, 0.1411765, 1, 0, 1,
-0.5011361, -0.456614, -1.743608, 0.1333333, 1, 0, 1,
-0.5003856, -1.453395, -2.652215, 0.1294118, 1, 0, 1,
-0.4962293, -0.1352705, -2.340531, 0.1215686, 1, 0, 1,
-0.4924281, -1.06919, -2.463025, 0.1176471, 1, 0, 1,
-0.4912, -0.5127789, -3.698694, 0.1098039, 1, 0, 1,
-0.4901774, -0.9748064, -4.590933, 0.1058824, 1, 0, 1,
-0.4811599, -1.002369, -3.118983, 0.09803922, 1, 0, 1,
-0.4784145, 0.1165027, -0.7039049, 0.09019608, 1, 0, 1,
-0.4758651, -1.014824, -3.726759, 0.08627451, 1, 0, 1,
-0.4731847, -0.40164, -3.004671, 0.07843138, 1, 0, 1,
-0.4701554, -0.6400443, -1.984192, 0.07450981, 1, 0, 1,
-0.4679015, -1.076157, -3.213212, 0.06666667, 1, 0, 1,
-0.4637288, -0.3036252, -0.8489978, 0.0627451, 1, 0, 1,
-0.4599339, -0.6534425, -3.825269, 0.05490196, 1, 0, 1,
-0.4569152, 0.8418922, 0.3906418, 0.05098039, 1, 0, 1,
-0.4545234, -1.88816, -2.953706, 0.04313726, 1, 0, 1,
-0.4534068, 0.8595961, 1.76896, 0.03921569, 1, 0, 1,
-0.4471015, 0.3120547, -2.590689, 0.03137255, 1, 0, 1,
-0.4463259, -0.04144835, -0.6534735, 0.02745098, 1, 0, 1,
-0.4437712, -1.595267, -3.528088, 0.01960784, 1, 0, 1,
-0.4437373, -0.2206106, -2.657032, 0.01568628, 1, 0, 1,
-0.4434686, -1.945239, -3.076615, 0.007843138, 1, 0, 1,
-0.4385779, 0.5508634, 0.6810966, 0.003921569, 1, 0, 1,
-0.4314443, -0.9270257, -3.430237, 0, 1, 0.003921569, 1,
-0.4291324, 1.776607, 0.2477851, 0, 1, 0.01176471, 1,
-0.4263774, -0.1491251, -1.252004, 0, 1, 0.01568628, 1,
-0.4240392, -1.106528, -1.825828, 0, 1, 0.02352941, 1,
-0.4187405, 1.89415, 0.1478673, 0, 1, 0.02745098, 1,
-0.416658, -0.7646132, -2.706154, 0, 1, 0.03529412, 1,
-0.4149859, 1.80026, 0.4021459, 0, 1, 0.03921569, 1,
-0.4071826, -0.6553535, -4.390833, 0, 1, 0.04705882, 1,
-0.4057502, -1.374762, -4.110247, 0, 1, 0.05098039, 1,
-0.4040459, -0.1740649, -2.694841, 0, 1, 0.05882353, 1,
-0.4011077, -0.1307229, -2.057688, 0, 1, 0.0627451, 1,
-0.3955672, 0.5822095, -1.607448, 0, 1, 0.07058824, 1,
-0.3953728, 0.1838641, -1.437778, 0, 1, 0.07450981, 1,
-0.3912, 0.8079486, 0.4563046, 0, 1, 0.08235294, 1,
-0.3909902, -0.00352246, -2.658774, 0, 1, 0.08627451, 1,
-0.3900232, -0.1651121, -3.414854, 0, 1, 0.09411765, 1,
-0.3895622, -0.9004415, -1.065299, 0, 1, 0.1019608, 1,
-0.3870922, -0.1469442, -3.665879, 0, 1, 0.1058824, 1,
-0.3860461, 1.106047, -0.8688083, 0, 1, 0.1137255, 1,
-0.3853461, -0.6822641, -2.997112, 0, 1, 0.1176471, 1,
-0.3788899, 1.043844, -0.1520695, 0, 1, 0.1254902, 1,
-0.3778122, -0.4283539, -2.849664, 0, 1, 0.1294118, 1,
-0.3684312, 0.02188978, -1.900752, 0, 1, 0.1372549, 1,
-0.3684298, -0.8259836, -4.865228, 0, 1, 0.1411765, 1,
-0.3595401, -1.283997, -4.712058, 0, 1, 0.1490196, 1,
-0.3593221, 1.334926, -0.518633, 0, 1, 0.1529412, 1,
-0.3567765, 0.04524137, -2.004374, 0, 1, 0.1607843, 1,
-0.3493973, -0.2136745, -0.9830126, 0, 1, 0.1647059, 1,
-0.3482006, -0.5992171, -4.843879, 0, 1, 0.172549, 1,
-0.347063, 0.6210125, -0.2774879, 0, 1, 0.1764706, 1,
-0.3433909, 1.072418, -0.619048, 0, 1, 0.1843137, 1,
-0.3430471, 2.189461, -0.02472221, 0, 1, 0.1882353, 1,
-0.341799, 0.0147673, -2.215944, 0, 1, 0.1960784, 1,
-0.3412022, 0.1643678, 0.7758732, 0, 1, 0.2039216, 1,
-0.3411646, -0.8779453, -1.811326, 0, 1, 0.2078431, 1,
-0.3388742, 1.632307, 0.1765936, 0, 1, 0.2156863, 1,
-0.3352008, -0.6068394, -2.921869, 0, 1, 0.2196078, 1,
-0.3342989, -0.4052801, -1.581534, 0, 1, 0.227451, 1,
-0.3331917, 0.1682298, -1.930163, 0, 1, 0.2313726, 1,
-0.3318892, 0.9829852, -1.458042, 0, 1, 0.2392157, 1,
-0.3296882, 0.7850716, -0.4674704, 0, 1, 0.2431373, 1,
-0.3239596, 0.6944391, 0.640283, 0, 1, 0.2509804, 1,
-0.3231489, 1.620866, -2.758279, 0, 1, 0.254902, 1,
-0.319978, 0.1027021, -0.7265502, 0, 1, 0.2627451, 1,
-0.3178668, -0.363452, -5.383794, 0, 1, 0.2666667, 1,
-0.3155064, -0.7730073, -2.451591, 0, 1, 0.2745098, 1,
-0.314676, -0.7563853, -2.724657, 0, 1, 0.2784314, 1,
-0.3098524, -0.4952891, -4.679267, 0, 1, 0.2862745, 1,
-0.3086606, -0.3568508, -1.13811, 0, 1, 0.2901961, 1,
-0.3022927, -0.7781278, -1.472055, 0, 1, 0.2980392, 1,
-0.2948864, -0.6501054, -4.017627, 0, 1, 0.3058824, 1,
-0.2934736, 0.9344418, 0.05672483, 0, 1, 0.3098039, 1,
-0.2925056, 0.1034136, -2.934478, 0, 1, 0.3176471, 1,
-0.291846, -0.870309, -1.96744, 0, 1, 0.3215686, 1,
-0.2911833, -0.9124988, -1.662082, 0, 1, 0.3294118, 1,
-0.2900115, -1.354012, -4.215392, 0, 1, 0.3333333, 1,
-0.2877029, -0.9735426, -3.678649, 0, 1, 0.3411765, 1,
-0.2874284, -0.1111306, -3.243761, 0, 1, 0.345098, 1,
-0.2834182, 0.2100948, -2.637033, 0, 1, 0.3529412, 1,
-0.2826672, 0.02896762, -0.8950988, 0, 1, 0.3568628, 1,
-0.282608, 0.8871147, -0.02044078, 0, 1, 0.3647059, 1,
-0.2812956, 1.528391, -1.489079, 0, 1, 0.3686275, 1,
-0.2759001, 1.206983, -0.6081204, 0, 1, 0.3764706, 1,
-0.2756308, 0.2828957, -0.4999306, 0, 1, 0.3803922, 1,
-0.2716293, 0.383873, -0.8000277, 0, 1, 0.3882353, 1,
-0.2696432, -0.3022986, -2.353362, 0, 1, 0.3921569, 1,
-0.2649834, 0.3146001, 0.2243757, 0, 1, 0.4, 1,
-0.2636479, 0.3944235, -1.65383, 0, 1, 0.4078431, 1,
-0.2608874, 0.3244001, -1.542907, 0, 1, 0.4117647, 1,
-0.2597588, 1.65559, 1.036413, 0, 1, 0.4196078, 1,
-0.2585239, -0.3631091, -3.036755, 0, 1, 0.4235294, 1,
-0.2558627, -1.325054, -2.913985, 0, 1, 0.4313726, 1,
-0.2545526, 1.309124, 0.8138931, 0, 1, 0.4352941, 1,
-0.2534666, -0.5308375, -4.541164, 0, 1, 0.4431373, 1,
-0.2523628, 0.5066396, -1.272089, 0, 1, 0.4470588, 1,
-0.2510044, 0.7974939, -1.17274, 0, 1, 0.454902, 1,
-0.247346, 0.9965647, -2.032931, 0, 1, 0.4588235, 1,
-0.2456028, -1.592311, -2.756152, 0, 1, 0.4666667, 1,
-0.2447917, 1.112039, -0.4064561, 0, 1, 0.4705882, 1,
-0.239649, 0.349448, -0.1045943, 0, 1, 0.4784314, 1,
-0.2291753, 1.477458, 1.54853, 0, 1, 0.4823529, 1,
-0.2279966, 0.6391177, -1.916501, 0, 1, 0.4901961, 1,
-0.2271898, -0.6794696, -3.006731, 0, 1, 0.4941176, 1,
-0.2222948, 1.995322, 0.9528698, 0, 1, 0.5019608, 1,
-0.2216972, -1.381092, -2.913789, 0, 1, 0.509804, 1,
-0.214381, -1.551289, -3.094375, 0, 1, 0.5137255, 1,
-0.2133582, -0.3793072, -3.223203, 0, 1, 0.5215687, 1,
-0.212996, 0.4745805, -0.7441576, 0, 1, 0.5254902, 1,
-0.2110311, -0.8880737, -3.958565, 0, 1, 0.5333334, 1,
-0.2109607, 0.4305427, 1.219372, 0, 1, 0.5372549, 1,
-0.2055009, -0.784322, -1.40998, 0, 1, 0.5450981, 1,
-0.203705, -0.8644753, -2.393962, 0, 1, 0.5490196, 1,
-0.2030117, -1.117279, -2.652968, 0, 1, 0.5568628, 1,
-0.2026342, -0.412136, -2.519542, 0, 1, 0.5607843, 1,
-0.2009542, 1.345591, 1.428023, 0, 1, 0.5686275, 1,
-0.2007774, -0.2445768, -1.215522, 0, 1, 0.572549, 1,
-0.1967292, 2.194337, -0.1883445, 0, 1, 0.5803922, 1,
-0.1964164, 0.4820324, -0.2672445, 0, 1, 0.5843138, 1,
-0.1952757, -0.2942165, -2.05248, 0, 1, 0.5921569, 1,
-0.190269, 2.37235, 1.415282, 0, 1, 0.5960785, 1,
-0.1834256, -1.228922, -5.804727, 0, 1, 0.6039216, 1,
-0.1812417, 0.05306071, -1.90289, 0, 1, 0.6117647, 1,
-0.1777713, -1.052097, -3.204166, 0, 1, 0.6156863, 1,
-0.1776491, 0.5620167, -1.229236, 0, 1, 0.6235294, 1,
-0.176559, 0.1546164, -0.5402669, 0, 1, 0.627451, 1,
-0.1755414, 0.9216441, -0.135114, 0, 1, 0.6352941, 1,
-0.1749185, 1.130285, -0.8255364, 0, 1, 0.6392157, 1,
-0.1720374, 1.111991, -0.734649, 0, 1, 0.6470588, 1,
-0.1702589, 1.523505, -1.256652, 0, 1, 0.6509804, 1,
-0.1689992, -0.3354803, -2.350355, 0, 1, 0.6588235, 1,
-0.168227, -0.83603, -2.713763, 0, 1, 0.6627451, 1,
-0.1493725, 0.006406168, -1.978835, 0, 1, 0.6705883, 1,
-0.1485146, -0.1912668, -2.992996, 0, 1, 0.6745098, 1,
-0.1484725, 0.1715875, -1.657604, 0, 1, 0.682353, 1,
-0.1474758, 0.4481225, 0.8100014, 0, 1, 0.6862745, 1,
-0.1450044, -0.9814947, -2.415341, 0, 1, 0.6941177, 1,
-0.1444732, 0.2466342, -0.5951992, 0, 1, 0.7019608, 1,
-0.1425374, 0.5349939, 0.09486642, 0, 1, 0.7058824, 1,
-0.1414845, 1.927612, 0.3382416, 0, 1, 0.7137255, 1,
-0.1412044, 0.8663304, 0.0628907, 0, 1, 0.7176471, 1,
-0.1398886, -0.8641971, -2.350786, 0, 1, 0.7254902, 1,
-0.1388755, 0.2558668, -2.087256, 0, 1, 0.7294118, 1,
-0.1387639, 1.98984, 0.9995921, 0, 1, 0.7372549, 1,
-0.1366372, -1.119133, -1.44082, 0, 1, 0.7411765, 1,
-0.1336396, -0.2498201, -0.8301528, 0, 1, 0.7490196, 1,
-0.1322892, -0.360457, -4.171019, 0, 1, 0.7529412, 1,
-0.1254709, -0.3751805, -3.151897, 0, 1, 0.7607843, 1,
-0.1253181, 1.875208, -0.2138016, 0, 1, 0.7647059, 1,
-0.1232308, 0.1201224, -3.167594, 0, 1, 0.772549, 1,
-0.1154924, 0.2770638, -2.116952, 0, 1, 0.7764706, 1,
-0.1119788, -1.323135, -3.13631, 0, 1, 0.7843137, 1,
-0.1108831, -0.9982185, -4.418504, 0, 1, 0.7882353, 1,
-0.1064987, -0.5127617, -3.869741, 0, 1, 0.7960784, 1,
-0.1051393, 0.01271326, -0.6547263, 0, 1, 0.8039216, 1,
-0.1049907, 0.9095206, -1.262255, 0, 1, 0.8078431, 1,
-0.1015561, 0.4409007, -0.1467679, 0, 1, 0.8156863, 1,
-0.09723382, -1.293524, -4.327032, 0, 1, 0.8196079, 1,
-0.09564762, 0.1619547, 0.06164677, 0, 1, 0.827451, 1,
-0.09354421, -1.122802, -3.582956, 0, 1, 0.8313726, 1,
-0.09194245, 0.6144326, -1.742923, 0, 1, 0.8392157, 1,
-0.0904568, 0.991195, 1.34061, 0, 1, 0.8431373, 1,
-0.08535566, -0.8257779, -3.96948, 0, 1, 0.8509804, 1,
-0.0823746, -1.597414, -3.72605, 0, 1, 0.854902, 1,
-0.08134696, -0.3480739, -4.450511, 0, 1, 0.8627451, 1,
-0.0812093, -1.117208, -3.15191, 0, 1, 0.8666667, 1,
-0.08042611, 0.5949566, -0.7180455, 0, 1, 0.8745098, 1,
-0.07694167, -0.1278813, -3.748487, 0, 1, 0.8784314, 1,
-0.06440391, -0.3289407, -3.267592, 0, 1, 0.8862745, 1,
-0.06434771, 0.405485, -1.081833, 0, 1, 0.8901961, 1,
-0.06127628, 1.315664, -0.8932566, 0, 1, 0.8980392, 1,
-0.06007937, 0.2212356, 1.197959, 0, 1, 0.9058824, 1,
-0.0528528, -0.8910308, -2.223753, 0, 1, 0.9098039, 1,
-0.05075426, -2.429919, -3.299748, 0, 1, 0.9176471, 1,
-0.04579327, -2.018566, -3.308587, 0, 1, 0.9215686, 1,
-0.04422254, -1.467553, -3.821417, 0, 1, 0.9294118, 1,
-0.04380086, -1.045378, -2.840786, 0, 1, 0.9333333, 1,
-0.04135741, 1.737782, 1.707228, 0, 1, 0.9411765, 1,
-0.04063235, -0.6651379, -3.893118, 0, 1, 0.945098, 1,
-0.0370439, 0.8583289, 0.05697308, 0, 1, 0.9529412, 1,
-0.03628017, 0.1075223, 0.5672768, 0, 1, 0.9568627, 1,
-0.03415497, 0.9363236, 0.2477854, 0, 1, 0.9647059, 1,
-0.03290144, -0.8045009, -3.096877, 0, 1, 0.9686275, 1,
-0.0325697, 0.8957603, -0.5395276, 0, 1, 0.9764706, 1,
-0.03219852, 0.2812231, 0.5297839, 0, 1, 0.9803922, 1,
-0.03168076, -0.6596303, -4.533312, 0, 1, 0.9882353, 1,
-0.03064611, 2.085726, -0.3199329, 0, 1, 0.9921569, 1,
-0.02657877, 0.05432981, -1.579409, 0, 1, 1, 1,
-0.02455655, 1.259344, -0.6784462, 0, 0.9921569, 1, 1,
-0.02320261, 0.3414473, -0.5571051, 0, 0.9882353, 1, 1,
-0.01927282, -2.157361, -3.806827, 0, 0.9803922, 1, 1,
-0.01527089, -0.1908298, -5.206127, 0, 0.9764706, 1, 1,
-0.01130148, 0.9419451, -0.5549922, 0, 0.9686275, 1, 1,
-0.01010611, -0.3251429, -4.551246, 0, 0.9647059, 1, 1,
-0.007912561, -0.3294661, -0.5344791, 0, 0.9568627, 1, 1,
-0.00785321, 0.8507767, -0.4377781, 0, 0.9529412, 1, 1,
-0.0066855, -0.3063948, -2.968425, 0, 0.945098, 1, 1,
-0.005131103, -1.289394, -3.240692, 0, 0.9411765, 1, 1,
-0.003435948, -1.094978, -2.886949, 0, 0.9333333, 1, 1,
0.001176127, 0.1749484, 0.1372823, 0, 0.9294118, 1, 1,
0.001759119, -0.1558555, 3.150456, 0, 0.9215686, 1, 1,
0.002359411, 1.899796, 0.01497655, 0, 0.9176471, 1, 1,
0.004786822, 0.3662761, 1.066905, 0, 0.9098039, 1, 1,
0.005152527, 1.765669, 0.4857235, 0, 0.9058824, 1, 1,
0.01175633, -0.1600108, 3.333162, 0, 0.8980392, 1, 1,
0.01402076, -0.845652, 3.021829, 0, 0.8901961, 1, 1,
0.01429375, -1.964104, 3.291382, 0, 0.8862745, 1, 1,
0.01868309, 0.5940099, 0.8130605, 0, 0.8784314, 1, 1,
0.02044116, -0.01996881, 2.470646, 0, 0.8745098, 1, 1,
0.02170924, 0.01080996, 1.188568, 0, 0.8666667, 1, 1,
0.02300927, 0.2527853, 0.07482485, 0, 0.8627451, 1, 1,
0.02320721, 0.5004104, -0.627387, 0, 0.854902, 1, 1,
0.02454306, 1.124134, 1.537125, 0, 0.8509804, 1, 1,
0.02747502, 0.4480865, 0.3920392, 0, 0.8431373, 1, 1,
0.02918313, 0.5838271, -1.587122, 0, 0.8392157, 1, 1,
0.03000901, -1.424257, 1.735177, 0, 0.8313726, 1, 1,
0.03003832, 0.03693569, 0.1293915, 0, 0.827451, 1, 1,
0.03020087, -0.712942, 2.000957, 0, 0.8196079, 1, 1,
0.03153164, -0.4302162, 3.696126, 0, 0.8156863, 1, 1,
0.03860819, -0.7685571, 3.009827, 0, 0.8078431, 1, 1,
0.04035154, -0.5351502, 1.556608, 0, 0.8039216, 1, 1,
0.05254365, 1.025876, 1.479392, 0, 0.7960784, 1, 1,
0.05257113, -0.2664139, 3.259688, 0, 0.7882353, 1, 1,
0.05371806, 0.1103849, 1.36325, 0, 0.7843137, 1, 1,
0.05399119, -0.3442509, 3.603295, 0, 0.7764706, 1, 1,
0.05461593, 0.2884545, -0.7919849, 0, 0.772549, 1, 1,
0.05543308, -2.225668, 3.345968, 0, 0.7647059, 1, 1,
0.05678931, 0.5190254, 0.79067, 0, 0.7607843, 1, 1,
0.05765098, 0.7167871, 0.7818364, 0, 0.7529412, 1, 1,
0.05850413, -0.8393506, 2.694626, 0, 0.7490196, 1, 1,
0.05853773, 0.9778866, -2.161635, 0, 0.7411765, 1, 1,
0.05962976, -0.009732838, 1.965172, 0, 0.7372549, 1, 1,
0.06029858, 1.790599, 0.1354856, 0, 0.7294118, 1, 1,
0.0668529, 0.3607769, 1.618924, 0, 0.7254902, 1, 1,
0.0714874, -0.789846, 2.084471, 0, 0.7176471, 1, 1,
0.07387969, 1.142555, -0.1566872, 0, 0.7137255, 1, 1,
0.07529233, -1.433923, 3.343505, 0, 0.7058824, 1, 1,
0.07626894, -0.5451298, 2.371881, 0, 0.6980392, 1, 1,
0.08059203, 0.02937561, 3.16886, 0, 0.6941177, 1, 1,
0.08230595, -2.617148, 2.179843, 0, 0.6862745, 1, 1,
0.08497602, 0.1886, 1.050959, 0, 0.682353, 1, 1,
0.08609823, 0.6784827, -0.3094046, 0, 0.6745098, 1, 1,
0.0867656, -2.580139, 3.486324, 0, 0.6705883, 1, 1,
0.09283635, 0.8626883, 0.300205, 0, 0.6627451, 1, 1,
0.09317134, 0.7716517, -0.1260619, 0, 0.6588235, 1, 1,
0.1026666, 1.590329, -0.1922881, 0, 0.6509804, 1, 1,
0.1031738, 0.3635533, 0.7873118, 0, 0.6470588, 1, 1,
0.1036846, -0.741358, 2.307875, 0, 0.6392157, 1, 1,
0.1100638, 2.739811, 0.7848166, 0, 0.6352941, 1, 1,
0.1111018, 0.7982228, -1.334967, 0, 0.627451, 1, 1,
0.112635, -0.6651468, 2.36964, 0, 0.6235294, 1, 1,
0.1129612, 2.499985, -0.35631, 0, 0.6156863, 1, 1,
0.1204051, 0.298675, -2.26723, 0, 0.6117647, 1, 1,
0.1209756, -0.7114047, 3.952279, 0, 0.6039216, 1, 1,
0.1248323, 0.6125087, 0.7335147, 0, 0.5960785, 1, 1,
0.1253237, 0.2998911, -0.8378262, 0, 0.5921569, 1, 1,
0.1258214, -0.1098621, 0.9338817, 0, 0.5843138, 1, 1,
0.1272288, 0.2349819, -1.295669, 0, 0.5803922, 1, 1,
0.130483, -1.371515, 3.218191, 0, 0.572549, 1, 1,
0.1374998, 1.57724, 1.878964, 0, 0.5686275, 1, 1,
0.1416555, -1.385188, 3.252736, 0, 0.5607843, 1, 1,
0.1438333, 0.1194107, 1.596681, 0, 0.5568628, 1, 1,
0.144467, 0.2840457, 0.8644914, 0, 0.5490196, 1, 1,
0.1509407, -0.2193847, 2.667717, 0, 0.5450981, 1, 1,
0.1530009, 0.2604888, 1.39546, 0, 0.5372549, 1, 1,
0.1651692, 0.6291498, 1.32962, 0, 0.5333334, 1, 1,
0.1654025, -0.2554137, 0.9609659, 0, 0.5254902, 1, 1,
0.1656918, -0.7569942, 4.560882, 0, 0.5215687, 1, 1,
0.1667302, 0.5189416, 0.484154, 0, 0.5137255, 1, 1,
0.167024, -0.1026163, 1.813577, 0, 0.509804, 1, 1,
0.1704738, 1.056713, -0.4145999, 0, 0.5019608, 1, 1,
0.1715274, 1.62001, 1.709112, 0, 0.4941176, 1, 1,
0.1728376, -0.2057058, 2.228727, 0, 0.4901961, 1, 1,
0.1762185, 0.3081774, -0.2881065, 0, 0.4823529, 1, 1,
0.1829376, -0.7398816, 2.906516, 0, 0.4784314, 1, 1,
0.1830394, 0.1626943, 0.9844697, 0, 0.4705882, 1, 1,
0.1857419, -0.1736958, 3.643726, 0, 0.4666667, 1, 1,
0.1894748, 2.42339, 1.185343, 0, 0.4588235, 1, 1,
0.1946059, -0.2959909, 1.829467, 0, 0.454902, 1, 1,
0.195402, 0.9263867, -0.707649, 0, 0.4470588, 1, 1,
0.1958681, 0.3847596, 0.5804369, 0, 0.4431373, 1, 1,
0.196957, 0.2145049, 2.207375, 0, 0.4352941, 1, 1,
0.1970631, 0.4171538, 0.7563767, 0, 0.4313726, 1, 1,
0.1976048, -1.699742, 2.210945, 0, 0.4235294, 1, 1,
0.1979435, 0.3981249, -0.3303089, 0, 0.4196078, 1, 1,
0.1983782, -0.8633426, 2.81968, 0, 0.4117647, 1, 1,
0.2001089, 0.0241481, 0.7454808, 0, 0.4078431, 1, 1,
0.2122503, -0.5206262, 2.465086, 0, 0.4, 1, 1,
0.2136763, 0.4800564, -1.236718, 0, 0.3921569, 1, 1,
0.2189871, 0.6013194, 1.364637, 0, 0.3882353, 1, 1,
0.2208609, -0.619877, 2.896603, 0, 0.3803922, 1, 1,
0.2210037, 0.6505457, 0.3856722, 0, 0.3764706, 1, 1,
0.224176, 2.476541, -0.7804136, 0, 0.3686275, 1, 1,
0.2256986, -1.230693, 3.101175, 0, 0.3647059, 1, 1,
0.2375879, -0.08843621, 2.486991, 0, 0.3568628, 1, 1,
0.2396325, 0.6680247, 0.0619157, 0, 0.3529412, 1, 1,
0.2416469, -0.343778, 3.311481, 0, 0.345098, 1, 1,
0.2469422, -0.5834867, 2.148038, 0, 0.3411765, 1, 1,
0.2552565, -0.860604, 2.516467, 0, 0.3333333, 1, 1,
0.2560778, -0.3044305, 3.177935, 0, 0.3294118, 1, 1,
0.260265, 0.5722987, -0.9597143, 0, 0.3215686, 1, 1,
0.2606054, -1.06605, 2.335248, 0, 0.3176471, 1, 1,
0.2615104, 0.7073363, -0.06200531, 0, 0.3098039, 1, 1,
0.2621278, -0.4917136, 5.139414, 0, 0.3058824, 1, 1,
0.264403, -2.178158, 4.023503, 0, 0.2980392, 1, 1,
0.2654197, -1.465624, 4.462133, 0, 0.2901961, 1, 1,
0.2662273, 0.1845674, 1.736531, 0, 0.2862745, 1, 1,
0.2667548, 1.752904, -0.5246707, 0, 0.2784314, 1, 1,
0.2680909, -0.8549339, 2.586942, 0, 0.2745098, 1, 1,
0.2698615, -0.5177375, 3.260501, 0, 0.2666667, 1, 1,
0.2703425, 0.2545471, 1.57636, 0, 0.2627451, 1, 1,
0.2709916, 1.535426, -0.0477979, 0, 0.254902, 1, 1,
0.2720188, -0.1235831, 3.5579, 0, 0.2509804, 1, 1,
0.2722591, 0.2920839, 0.661573, 0, 0.2431373, 1, 1,
0.2808666, 0.000495844, 2.423821, 0, 0.2392157, 1, 1,
0.2829524, -2.105718, 2.621658, 0, 0.2313726, 1, 1,
0.2841471, -0.4105344, 3.428859, 0, 0.227451, 1, 1,
0.2893115, 0.9908569, 1.118583, 0, 0.2196078, 1, 1,
0.2969361, -1.745858, 2.575466, 0, 0.2156863, 1, 1,
0.2977507, 2.132908, 0.7795317, 0, 0.2078431, 1, 1,
0.2984155, -1.305941, 2.168551, 0, 0.2039216, 1, 1,
0.3020092, -3.592088, 6.20294, 0, 0.1960784, 1, 1,
0.3023418, -0.6982318, 1.268515, 0, 0.1882353, 1, 1,
0.3077768, -1.023276, 3.649017, 0, 0.1843137, 1, 1,
0.3082798, -0.8756129, 2.931145, 0, 0.1764706, 1, 1,
0.3093726, -0.5049611, 4.268226, 0, 0.172549, 1, 1,
0.3125416, 0.5480976, 0.006073701, 0, 0.1647059, 1, 1,
0.3136525, 0.2619637, 0.8526003, 0, 0.1607843, 1, 1,
0.3153521, -0.3593429, 4.495007, 0, 0.1529412, 1, 1,
0.3196617, -1.35589, 1.1191, 0, 0.1490196, 1, 1,
0.3224447, 0.2314762, -0.02308357, 0, 0.1411765, 1, 1,
0.3238563, -0.3529422, 1.87583, 0, 0.1372549, 1, 1,
0.3249049, -1.431401, 4.199888, 0, 0.1294118, 1, 1,
0.3253989, 1.629905, -0.4329172, 0, 0.1254902, 1, 1,
0.3329925, -1.346439, 3.881252, 0, 0.1176471, 1, 1,
0.3357267, -0.3874082, 2.837668, 0, 0.1137255, 1, 1,
0.3394115, 1.778351, 1.346921, 0, 0.1058824, 1, 1,
0.3449771, -0.5443289, 3.99893, 0, 0.09803922, 1, 1,
0.3467412, 0.3336431, 0.7999705, 0, 0.09411765, 1, 1,
0.3557207, 2.017572, -0.1652592, 0, 0.08627451, 1, 1,
0.3569224, 1.455831, 1.533443, 0, 0.08235294, 1, 1,
0.3578852, 0.6595656, 0.6328868, 0, 0.07450981, 1, 1,
0.3600578, -0.5952414, 2.485608, 0, 0.07058824, 1, 1,
0.3635142, 0.6384183, 0.01442535, 0, 0.0627451, 1, 1,
0.363585, -1.004861, 3.884272, 0, 0.05882353, 1, 1,
0.3691322, 1.434503, -0.1164701, 0, 0.05098039, 1, 1,
0.3859191, -0.3365743, 1.798399, 0, 0.04705882, 1, 1,
0.3918675, -0.626921, 3.92182, 0, 0.03921569, 1, 1,
0.3958767, 0.6091136, 2.497236, 0, 0.03529412, 1, 1,
0.3979747, 0.2038176, 0.007732976, 0, 0.02745098, 1, 1,
0.3989877, 0.8076187, 0.746136, 0, 0.02352941, 1, 1,
0.402163, -0.5986996, 1.888456, 0, 0.01568628, 1, 1,
0.4066424, 0.6309705, 2.584316, 0, 0.01176471, 1, 1,
0.4149575, -1.435238, 2.029323, 0, 0.003921569, 1, 1,
0.4174473, -1.129418, 4.056292, 0.003921569, 0, 1, 1,
0.4227253, 0.501899, 0.7257862, 0.007843138, 0, 1, 1,
0.4228225, -0.6938457, 1.92765, 0.01568628, 0, 1, 1,
0.4361281, 0.04899147, 1.542996, 0.01960784, 0, 1, 1,
0.4380603, 0.3624155, 3.074331, 0.02745098, 0, 1, 1,
0.4394207, -1.508456, 0.670591, 0.03137255, 0, 1, 1,
0.4407742, 1.13588, 1.239836, 0.03921569, 0, 1, 1,
0.4429958, -0.7468771, 2.802285, 0.04313726, 0, 1, 1,
0.4435835, 0.5266832, 2.561934, 0.05098039, 0, 1, 1,
0.4488808, 1.938501, 0.097799, 0.05490196, 0, 1, 1,
0.4500839, 3.330793e-05, 2.434442, 0.0627451, 0, 1, 1,
0.4519255, 0.8644594, -1.80722, 0.06666667, 0, 1, 1,
0.4527668, -0.5676537, 3.091069, 0.07450981, 0, 1, 1,
0.4535007, -0.8637778, 1.923815, 0.07843138, 0, 1, 1,
0.4566817, -0.4027956, 1.149687, 0.08627451, 0, 1, 1,
0.4655361, 0.1163883, 0.8222926, 0.09019608, 0, 1, 1,
0.4689607, 0.2390628, 0.3128709, 0.09803922, 0, 1, 1,
0.4703307, -0.5433896, 2.803777, 0.1058824, 0, 1, 1,
0.4707378, 2.021732, 1.185868, 0.1098039, 0, 1, 1,
0.4744448, -0.3553156, 3.614635, 0.1176471, 0, 1, 1,
0.4771559, 0.1160103, 0.9219418, 0.1215686, 0, 1, 1,
0.478765, 0.2148343, 1.827133, 0.1294118, 0, 1, 1,
0.479367, -1.161453, 2.861571, 0.1333333, 0, 1, 1,
0.4835904, 2.529223, -0.129884, 0.1411765, 0, 1, 1,
0.4907907, 0.52271, -0.08976257, 0.145098, 0, 1, 1,
0.4909135, 0.3369769, 1.168224, 0.1529412, 0, 1, 1,
0.4938768, 0.384236, 0.9368406, 0.1568628, 0, 1, 1,
0.497819, -0.2302579, 3.068456, 0.1647059, 0, 1, 1,
0.4985455, -2.469803, 4.545327, 0.1686275, 0, 1, 1,
0.5038933, 0.4659515, -0.1884466, 0.1764706, 0, 1, 1,
0.5067313, -2.213152, 2.300275, 0.1803922, 0, 1, 1,
0.5099316, -0.3219598, 1.514351, 0.1882353, 0, 1, 1,
0.51262, 0.2756, 0.3584169, 0.1921569, 0, 1, 1,
0.5159848, -1.530966, 2.428204, 0.2, 0, 1, 1,
0.5176411, -0.3469009, 1.094923, 0.2078431, 0, 1, 1,
0.5189294, 0.1002762, 2.410981, 0.2117647, 0, 1, 1,
0.5193867, 1.951342, 1.651797, 0.2196078, 0, 1, 1,
0.5204701, -1.81565, 2.904791, 0.2235294, 0, 1, 1,
0.5304092, -1.165454, 2.166735, 0.2313726, 0, 1, 1,
0.5329666, -0.3239082, 1.88926, 0.2352941, 0, 1, 1,
0.5339124, -0.8223948, 2.342626, 0.2431373, 0, 1, 1,
0.534953, -2.425482, 3.7496, 0.2470588, 0, 1, 1,
0.5385719, 0.5569063, -2.030424, 0.254902, 0, 1, 1,
0.5394496, 0.4526174, 0.9398402, 0.2588235, 0, 1, 1,
0.5418289, 0.2672428, 2.610203, 0.2666667, 0, 1, 1,
0.5421705, -0.7022385, 4.379543, 0.2705882, 0, 1, 1,
0.5520099, -0.1457312, 0.7111901, 0.2784314, 0, 1, 1,
0.5536569, -1.241707, 1.686405, 0.282353, 0, 1, 1,
0.5550869, -0.332466, 2.863237, 0.2901961, 0, 1, 1,
0.5594154, -0.3740655, 2.028555, 0.2941177, 0, 1, 1,
0.5605281, -0.9694149, 1.656838, 0.3019608, 0, 1, 1,
0.5615531, 1.211271, -0.07129704, 0.3098039, 0, 1, 1,
0.5644153, -0.5105319, 2.22607, 0.3137255, 0, 1, 1,
0.5662163, -0.4833363, 2.202698, 0.3215686, 0, 1, 1,
0.5686255, 2.531121, -0.4777368, 0.3254902, 0, 1, 1,
0.5692057, -0.2425035, 2.076897, 0.3333333, 0, 1, 1,
0.5775739, 0.8058347, 1.233768, 0.3372549, 0, 1, 1,
0.579187, 1.49164, 0.9348975, 0.345098, 0, 1, 1,
0.5872765, 0.872171, 0.8850594, 0.3490196, 0, 1, 1,
0.5898505, 1.794773, 1.154296, 0.3568628, 0, 1, 1,
0.5927058, -1.859432, 2.243626, 0.3607843, 0, 1, 1,
0.595934, -0.04166244, 1.395193, 0.3686275, 0, 1, 1,
0.5987107, -0.9298267, 2.621678, 0.372549, 0, 1, 1,
0.5988344, -0.3312297, 2.017132, 0.3803922, 0, 1, 1,
0.5996432, 0.9229058, 0.4383048, 0.3843137, 0, 1, 1,
0.6032288, -1.211994, 1.625082, 0.3921569, 0, 1, 1,
0.604058, -0.3541997, 2.210877, 0.3960784, 0, 1, 1,
0.6049708, -1.453072, 4.334805, 0.4039216, 0, 1, 1,
0.6085732, 0.6769802, 0.9101505, 0.4117647, 0, 1, 1,
0.6094637, -0.2000991, 3.01827, 0.4156863, 0, 1, 1,
0.6099904, 0.5979526, 1.000276, 0.4235294, 0, 1, 1,
0.611142, 0.5768698, -1.979563, 0.427451, 0, 1, 1,
0.6140637, -0.661971, 1.11745, 0.4352941, 0, 1, 1,
0.6161512, -0.3146363, 1.439149, 0.4392157, 0, 1, 1,
0.6185385, 1.545538, 1.149265, 0.4470588, 0, 1, 1,
0.6205502, 1.752866, 0.7856488, 0.4509804, 0, 1, 1,
0.6223612, 0.08920565, 3.246666, 0.4588235, 0, 1, 1,
0.6287255, -0.4981161, 1.793442, 0.4627451, 0, 1, 1,
0.6292133, 1.634569, -1.237173, 0.4705882, 0, 1, 1,
0.629533, -0.1560745, 1.50396, 0.4745098, 0, 1, 1,
0.6311576, 0.9278258, 0.9428816, 0.4823529, 0, 1, 1,
0.6324229, -0.07376148, 2.831011, 0.4862745, 0, 1, 1,
0.6325391, -0.3494436, 3.201728, 0.4941176, 0, 1, 1,
0.633223, 0.6926368, 1.822421, 0.5019608, 0, 1, 1,
0.633305, -0.5383773, 2.406088, 0.5058824, 0, 1, 1,
0.6353216, -1.225553, 1.582859, 0.5137255, 0, 1, 1,
0.639333, -0.9891761, 2.272601, 0.5176471, 0, 1, 1,
0.6394725, -0.565259, 3.524386, 0.5254902, 0, 1, 1,
0.6470094, 1.148356, 0.1112447, 0.5294118, 0, 1, 1,
0.6511685, -0.4441819, 2.089076, 0.5372549, 0, 1, 1,
0.654511, -1.383391, 3.822157, 0.5411765, 0, 1, 1,
0.6551536, 0.5524688, 1.599915, 0.5490196, 0, 1, 1,
0.6552148, -0.0832257, 1.333766, 0.5529412, 0, 1, 1,
0.6553639, -0.5390752, 0.5607095, 0.5607843, 0, 1, 1,
0.6555191, -0.1862044, 0.5857179, 0.5647059, 0, 1, 1,
0.6585613, 0.01052222, 1.095564, 0.572549, 0, 1, 1,
0.6631649, 1.883569, -1.185883, 0.5764706, 0, 1, 1,
0.6686998, 0.1862431, 1.214598, 0.5843138, 0, 1, 1,
0.6721, -0.2512243, 0.6582227, 0.5882353, 0, 1, 1,
0.6764916, 0.5285776, -0.2238831, 0.5960785, 0, 1, 1,
0.678203, -0.6371457, 2.607993, 0.6039216, 0, 1, 1,
0.6792679, -0.7070805, 2.825671, 0.6078432, 0, 1, 1,
0.6814414, 0.1116846, -1.578492, 0.6156863, 0, 1, 1,
0.6814687, -0.5013689, 2.68015, 0.6196079, 0, 1, 1,
0.6865984, 1.835499, -0.4444672, 0.627451, 0, 1, 1,
0.6883059, 0.2399649, 2.135838, 0.6313726, 0, 1, 1,
0.6889917, -1.394628, 3.3064, 0.6392157, 0, 1, 1,
0.694459, 0.2758394, 1.579773, 0.6431373, 0, 1, 1,
0.697188, -1.271973, 2.939288, 0.6509804, 0, 1, 1,
0.698001, 0.3816665, 1.918049, 0.654902, 0, 1, 1,
0.7110216, -0.4139375, 2.242743, 0.6627451, 0, 1, 1,
0.7115925, -0.4785303, 3.538467, 0.6666667, 0, 1, 1,
0.7150401, -0.459349, 0.5697955, 0.6745098, 0, 1, 1,
0.7173099, 1.406708, -0.1558155, 0.6784314, 0, 1, 1,
0.7220272, -0.6596138, 1.116649, 0.6862745, 0, 1, 1,
0.7270922, -1.860333, 2.737535, 0.6901961, 0, 1, 1,
0.7278323, -0.06524481, 1.923821, 0.6980392, 0, 1, 1,
0.7302544, -0.8783366, 1.783182, 0.7058824, 0, 1, 1,
0.7375832, 1.094127, 0.9221597, 0.7098039, 0, 1, 1,
0.7477356, -1.200095, 0.736735, 0.7176471, 0, 1, 1,
0.755009, 1.937352, 0.1168483, 0.7215686, 0, 1, 1,
0.7553336, -0.2925278, 1.860798, 0.7294118, 0, 1, 1,
0.7558341, 1.72362, 0.7219062, 0.7333333, 0, 1, 1,
0.7572078, -0.608991, 2.223206, 0.7411765, 0, 1, 1,
0.7577772, 0.1945482, 1.097198, 0.7450981, 0, 1, 1,
0.7588744, 1.334115, 2.498687, 0.7529412, 0, 1, 1,
0.7615451, 1.054127, -0.5651883, 0.7568628, 0, 1, 1,
0.7633993, -1.249887, 3.084061, 0.7647059, 0, 1, 1,
0.7674187, 0.3046464, -0.3538592, 0.7686275, 0, 1, 1,
0.7707728, 1.322631, -0.8364452, 0.7764706, 0, 1, 1,
0.7726361, 0.06803227, 2.100705, 0.7803922, 0, 1, 1,
0.7744488, 0.697616, -1.295149, 0.7882353, 0, 1, 1,
0.7820884, 0.3041076, 0.2944379, 0.7921569, 0, 1, 1,
0.7874558, 0.3733146, 0.9690706, 0.8, 0, 1, 1,
0.8003202, -0.5182725, 1.08487, 0.8078431, 0, 1, 1,
0.8005033, -1.112261, 2.04669, 0.8117647, 0, 1, 1,
0.8079509, -0.7816141, 1.768105, 0.8196079, 0, 1, 1,
0.8154364, 0.7459628, 0.1524416, 0.8235294, 0, 1, 1,
0.8180835, 0.1935155, 0.2862546, 0.8313726, 0, 1, 1,
0.8187985, -0.9191865, 1.826431, 0.8352941, 0, 1, 1,
0.8241357, -0.1452897, 0.9347103, 0.8431373, 0, 1, 1,
0.8243358, 0.01487645, 1.42507, 0.8470588, 0, 1, 1,
0.8267574, -0.4218252, 2.954092, 0.854902, 0, 1, 1,
0.8292897, 0.3155132, 3.96712, 0.8588235, 0, 1, 1,
0.8544098, -0.8540528, 2.7495, 0.8666667, 0, 1, 1,
0.8581677, 2.221822, 0.6817873, 0.8705882, 0, 1, 1,
0.8620484, -1.274625, 2.935181, 0.8784314, 0, 1, 1,
0.8649107, -1.261253, 1.328603, 0.8823529, 0, 1, 1,
0.869494, 2.331297, 2.231589, 0.8901961, 0, 1, 1,
0.8741603, -1.022641, 2.910657, 0.8941177, 0, 1, 1,
0.8840461, 1.729949, -0.1368881, 0.9019608, 0, 1, 1,
0.8861411, -1.582389, 0.5999476, 0.9098039, 0, 1, 1,
0.8899248, 0.4700081, 3.042075, 0.9137255, 0, 1, 1,
0.8911509, -0.007459476, 1.338475, 0.9215686, 0, 1, 1,
0.8916295, -0.998514, 2.037957, 0.9254902, 0, 1, 1,
0.8972493, 0.4392093, 0.9127356, 0.9333333, 0, 1, 1,
0.9062901, -2.236781, 4.620099, 0.9372549, 0, 1, 1,
0.9069866, -0.08013718, 2.274587, 0.945098, 0, 1, 1,
0.9109125, 1.274685, 0.4283732, 0.9490196, 0, 1, 1,
0.9121416, 0.8077288, -0.8083987, 0.9568627, 0, 1, 1,
0.9137161, 0.464114, 2.700294, 0.9607843, 0, 1, 1,
0.9139142, -0.05551348, 1.381205, 0.9686275, 0, 1, 1,
0.9202745, -1.594252, 2.81489, 0.972549, 0, 1, 1,
0.9204109, -1.102023, 3.319908, 0.9803922, 0, 1, 1,
0.9227057, -0.7320641, 1.217692, 0.9843137, 0, 1, 1,
0.9232159, -0.7848749, 3.124945, 0.9921569, 0, 1, 1,
0.9258497, -0.801285, 4.170176, 0.9960784, 0, 1, 1,
0.9300328, 2.31618, -0.7434933, 1, 0, 0.9960784, 1,
0.9358431, -0.3792182, 2.706035, 1, 0, 0.9882353, 1,
0.936802, 0.2394968, 1.362259, 1, 0, 0.9843137, 1,
0.9369852, 0.5418967, -0.1377522, 1, 0, 0.9764706, 1,
0.9383508, -0.1750447, 2.085589, 1, 0, 0.972549, 1,
0.9406815, 1.015693, 1.885066, 1, 0, 0.9647059, 1,
0.9407609, 1.58612, -0.5442913, 1, 0, 0.9607843, 1,
0.9457224, 0.7375706, 1.328222, 1, 0, 0.9529412, 1,
0.9576063, -2.594351, 2.068349, 1, 0, 0.9490196, 1,
0.9745814, 0.3505713, 0.4022241, 1, 0, 0.9411765, 1,
0.9772965, 1.781067, -0.235382, 1, 0, 0.9372549, 1,
0.9810708, -1.934587, 3.003315, 1, 0, 0.9294118, 1,
0.9938294, 1.022884, 0.6894169, 1, 0, 0.9254902, 1,
1.001419, -0.5713553, 2.117571, 1, 0, 0.9176471, 1,
1.006328, -0.5009015, 2.855563, 1, 0, 0.9137255, 1,
1.006853, -1.009006, 1.846316, 1, 0, 0.9058824, 1,
1.012638, 0.2158959, -0.1465788, 1, 0, 0.9019608, 1,
1.016267, -0.1904265, 1.035633, 1, 0, 0.8941177, 1,
1.02297, -0.3613025, 1.780675, 1, 0, 0.8862745, 1,
1.026658, -0.5975472, 2.085308, 1, 0, 0.8823529, 1,
1.030501, 0.7034869, 1.349603, 1, 0, 0.8745098, 1,
1.046945, 0.2842959, 0.6240697, 1, 0, 0.8705882, 1,
1.053606, -0.9055262, 1.433817, 1, 0, 0.8627451, 1,
1.06399, 0.2223389, 2.146014, 1, 0, 0.8588235, 1,
1.080961, 2.228318, -0.8416759, 1, 0, 0.8509804, 1,
1.082244, 0.326791, 0.7395053, 1, 0, 0.8470588, 1,
1.085034, -1.664864, 2.357047, 1, 0, 0.8392157, 1,
1.086696, 0.7560557, -0.5397297, 1, 0, 0.8352941, 1,
1.087648, 1.358572, 0.4506967, 1, 0, 0.827451, 1,
1.097936, 0.1852058, 0.899524, 1, 0, 0.8235294, 1,
1.098655, 1.151578, 0.6584698, 1, 0, 0.8156863, 1,
1.10034, -0.5915952, 2.071158, 1, 0, 0.8117647, 1,
1.105079, 0.9299378, 0.478253, 1, 0, 0.8039216, 1,
1.105369, -1.195174, 3.065363, 1, 0, 0.7960784, 1,
1.105828, -0.0144215, 3.313524, 1, 0, 0.7921569, 1,
1.121269, -0.640025, 2.165663, 1, 0, 0.7843137, 1,
1.134179, 0.04992723, 0.7923253, 1, 0, 0.7803922, 1,
1.136341, 0.5827462, -0.1957135, 1, 0, 0.772549, 1,
1.142473, -1.143698, 3.09054, 1, 0, 0.7686275, 1,
1.155694, -0.0079833, 1.959266, 1, 0, 0.7607843, 1,
1.157008, 0.476995, -1.358549, 1, 0, 0.7568628, 1,
1.159218, 0.7457079, 0.3344779, 1, 0, 0.7490196, 1,
1.175969, -0.7613112, 3.440885, 1, 0, 0.7450981, 1,
1.178429, -0.5442324, 2.355094, 1, 0, 0.7372549, 1,
1.189005, -0.4230373, 1.073528, 1, 0, 0.7333333, 1,
1.205528, 0.0482433, 2.335989, 1, 0, 0.7254902, 1,
1.205597, -1.200532, 1.525589, 1, 0, 0.7215686, 1,
1.208772, -0.2882681, 1.111591, 1, 0, 0.7137255, 1,
1.226885, -0.2097891, 2.818161, 1, 0, 0.7098039, 1,
1.230836, 0.3822632, 0.04428919, 1, 0, 0.7019608, 1,
1.238215, -1.465741, 2.309866, 1, 0, 0.6941177, 1,
1.2401, -1.053512, -0.2254802, 1, 0, 0.6901961, 1,
1.241776, -0.5349367, 2.336377, 1, 0, 0.682353, 1,
1.245609, 0.7534451, 0.1260438, 1, 0, 0.6784314, 1,
1.248946, 1.591875, 2.246989, 1, 0, 0.6705883, 1,
1.252324, -0.5692351, 1.816565, 1, 0, 0.6666667, 1,
1.25255, -0.6740478, 1.731899, 1, 0, 0.6588235, 1,
1.255903, -0.22069, 2.948824, 1, 0, 0.654902, 1,
1.260674, -0.4847809, 2.944642, 1, 0, 0.6470588, 1,
1.264038, -0.000606165, 0.3195131, 1, 0, 0.6431373, 1,
1.266505, -0.1271705, 0.4864649, 1, 0, 0.6352941, 1,
1.275197, 0.02116171, 1.611852, 1, 0, 0.6313726, 1,
1.275457, 0.08415674, 0.3556522, 1, 0, 0.6235294, 1,
1.287696, 1.435463, -1.108488, 1, 0, 0.6196079, 1,
1.296389, -0.7146617, 1.852906, 1, 0, 0.6117647, 1,
1.299191, 2.309415, -0.3361351, 1, 0, 0.6078432, 1,
1.302398, 0.6913231, 1.852041, 1, 0, 0.6, 1,
1.312746, -1.645442, 4.273391, 1, 0, 0.5921569, 1,
1.327534, -0.7811226, 2.047355, 1, 0, 0.5882353, 1,
1.353539, 0.8606219, 1.974902, 1, 0, 0.5803922, 1,
1.357918, -1.167475, 1.38356, 1, 0, 0.5764706, 1,
1.371481, -0.2899207, 2.499237, 1, 0, 0.5686275, 1,
1.372525, -1.331668, 3.682215, 1, 0, 0.5647059, 1,
1.387952, -1.058305, 0.5090972, 1, 0, 0.5568628, 1,
1.396676, 0.9342344, 0.9747754, 1, 0, 0.5529412, 1,
1.402514, 1.214175, -1.073157, 1, 0, 0.5450981, 1,
1.408207, -2.029758, 2.250224, 1, 0, 0.5411765, 1,
1.418601, -0.489527, 1.524168, 1, 0, 0.5333334, 1,
1.421835, -0.06624021, 2.294341, 1, 0, 0.5294118, 1,
1.427527, -0.4547028, 1.984502, 1, 0, 0.5215687, 1,
1.428503, 1.788291, -0.1823898, 1, 0, 0.5176471, 1,
1.436709, 0.8781629, 1.065961, 1, 0, 0.509804, 1,
1.437093, 0.5714423, 0.9446096, 1, 0, 0.5058824, 1,
1.442583, 0.2812783, 1.304181, 1, 0, 0.4980392, 1,
1.442725, 0.7876484, 1.922872, 1, 0, 0.4901961, 1,
1.454363, 0.6088513, 1.220456, 1, 0, 0.4862745, 1,
1.46339, 0.1691013, 1.094431, 1, 0, 0.4784314, 1,
1.465814, -0.1223994, 3.651303, 1, 0, 0.4745098, 1,
1.48672, 0.2006133, 2.772658, 1, 0, 0.4666667, 1,
1.487087, 0.4766391, 2.052212, 1, 0, 0.4627451, 1,
1.489034, -0.4762464, 1.55782, 1, 0, 0.454902, 1,
1.504953, -1.549391, 1.42551, 1, 0, 0.4509804, 1,
1.512018, 0.2885899, 1.040419, 1, 0, 0.4431373, 1,
1.518274, 0.5182406, 2.20448, 1, 0, 0.4392157, 1,
1.530417, -1.39433, 1.937992, 1, 0, 0.4313726, 1,
1.543225, -1.762815, 1.842739, 1, 0, 0.427451, 1,
1.550095, -0.9890671, 2.218245, 1, 0, 0.4196078, 1,
1.55821, 1.388066, 0.1777909, 1, 0, 0.4156863, 1,
1.561633, -0.8035501, 2.245601, 1, 0, 0.4078431, 1,
1.574742, 0.07654941, 0.8293931, 1, 0, 0.4039216, 1,
1.579479, 1.054495, -0.02392992, 1, 0, 0.3960784, 1,
1.588822, -1.193829, 0.5948737, 1, 0, 0.3882353, 1,
1.596273, 0.4719564, 0.7762959, 1, 0, 0.3843137, 1,
1.605573, -1.795734, 4.071954, 1, 0, 0.3764706, 1,
1.624714, 0.2326633, 1.720989, 1, 0, 0.372549, 1,
1.633161, 1.172683, 0.565596, 1, 0, 0.3647059, 1,
1.641955, -0.3352914, 2.986834, 1, 0, 0.3607843, 1,
1.646151, 1.923867, 1.268375, 1, 0, 0.3529412, 1,
1.647339, 0.9115389, 1.071536, 1, 0, 0.3490196, 1,
1.662205, 0.2401003, 0.6476138, 1, 0, 0.3411765, 1,
1.674231, 0.131368, 1.045791, 1, 0, 0.3372549, 1,
1.682653, -0.3975759, 2.583972, 1, 0, 0.3294118, 1,
1.691434, -1.313443, 1.628747, 1, 0, 0.3254902, 1,
1.699522, -2.19349, 0.7609022, 1, 0, 0.3176471, 1,
1.701109, 1.480821, 1.379154, 1, 0, 0.3137255, 1,
1.703208, 0.5937217, 1.148746, 1, 0, 0.3058824, 1,
1.708683, 0.1152417, 2.654159, 1, 0, 0.2980392, 1,
1.710537, -0.7055648, 1.572202, 1, 0, 0.2941177, 1,
1.714125, -0.08582839, 2.263209, 1, 0, 0.2862745, 1,
1.716696, -1.621239, 0.4399529, 1, 0, 0.282353, 1,
1.733182, -0.7809451, 1.276254, 1, 0, 0.2745098, 1,
1.736405, 1.440584, 2.567812, 1, 0, 0.2705882, 1,
1.739245, -0.2303797, -0.5127314, 1, 0, 0.2627451, 1,
1.770775, 0.3068166, 1.04176, 1, 0, 0.2588235, 1,
1.798897, -0.6787715, 3.712278, 1, 0, 0.2509804, 1,
1.802037, 1.367513, 0.08598923, 1, 0, 0.2470588, 1,
1.835373, -0.8676206, 2.958851, 1, 0, 0.2392157, 1,
1.84677, 0.09170512, 0.8786688, 1, 0, 0.2352941, 1,
1.857368, -0.8384643, 1.783931, 1, 0, 0.227451, 1,
1.873245, 0.9326473, 2.036813, 1, 0, 0.2235294, 1,
1.874717, -0.3640827, 3.033504, 1, 0, 0.2156863, 1,
1.887327, -2.390957, 1.695618, 1, 0, 0.2117647, 1,
1.895241, -0.7190566, 2.283851, 1, 0, 0.2039216, 1,
1.903383, -1.690131, 2.85254, 1, 0, 0.1960784, 1,
1.968917, 0.6515988, 1.463981, 1, 0, 0.1921569, 1,
1.978888, -0.872548, 3.935533, 1, 0, 0.1843137, 1,
1.980502, -0.5783061, 2.018794, 1, 0, 0.1803922, 1,
1.986444, 0.8063334, 0.236775, 1, 0, 0.172549, 1,
2.023555, 0.02074788, 2.278488, 1, 0, 0.1686275, 1,
2.025138, -0.5508983, 0.856353, 1, 0, 0.1607843, 1,
2.048391, 0.3274532, 1.941134, 1, 0, 0.1568628, 1,
2.060682, 1.443506, 1.66003, 1, 0, 0.1490196, 1,
2.067654, 1.494432, 2.608319, 1, 0, 0.145098, 1,
2.071323, -0.5499225, 1.090855, 1, 0, 0.1372549, 1,
2.09174, -0.7145146, 2.357071, 1, 0, 0.1333333, 1,
2.114114, -1.4063, 2.732509, 1, 0, 0.1254902, 1,
2.116576, 0.003851318, 1.264901, 1, 0, 0.1215686, 1,
2.120559, 1.804636, 1.630025, 1, 0, 0.1137255, 1,
2.12474, 0.1398132, 1.460501, 1, 0, 0.1098039, 1,
2.143243, -0.8168343, 1.721146, 1, 0, 0.1019608, 1,
2.187396, 0.1962743, 1.409621, 1, 0, 0.09411765, 1,
2.1981, 0.3878472, 1.407499, 1, 0, 0.09019608, 1,
2.209945, -0.4094071, 2.348601, 1, 0, 0.08235294, 1,
2.227301, 0.08525444, 3.010956, 1, 0, 0.07843138, 1,
2.238204, 0.7727177, -1.721125, 1, 0, 0.07058824, 1,
2.325709, -1.536528, 3.538476, 1, 0, 0.06666667, 1,
2.451975, -1.124352, 1.720136, 1, 0, 0.05882353, 1,
2.565335, -1.206298, 2.244503, 1, 0, 0.05490196, 1,
2.614738, 1.254524, 3.466799, 1, 0, 0.04705882, 1,
2.627627, 0.03127496, 2.332973, 1, 0, 0.04313726, 1,
2.630799, 2.909612, -0.1756515, 1, 0, 0.03529412, 1,
2.631643, 0.3262283, 1.261223, 1, 0, 0.03137255, 1,
2.65899, -0.9013639, 1.456816, 1, 0, 0.02352941, 1,
2.663513, -0.8926712, 1.761615, 1, 0, 0.01960784, 1,
2.755448, -0.270098, 1.178147, 1, 0, 0.01176471, 1,
2.999953, -0.6421785, 2.462711, 1, 0, 0.007843138, 1
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
-0.1190574, -4.694126, -7.840026, 0, -0.5, 0.5, 0.5,
-0.1190574, -4.694126, -7.840026, 1, -0.5, 0.5, 0.5,
-0.1190574, -4.694126, -7.840026, 1, 1.5, 0.5, 0.5,
-0.1190574, -4.694126, -7.840026, 0, 1.5, 0.5, 0.5
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
-4.295412, -0.341238, -7.840026, 0, -0.5, 0.5, 0.5,
-4.295412, -0.341238, -7.840026, 1, -0.5, 0.5, 0.5,
-4.295412, -0.341238, -7.840026, 1, 1.5, 0.5, 0.5,
-4.295412, -0.341238, -7.840026, 0, 1.5, 0.5, 0.5
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
-4.295412, -4.694126, 0.1991065, 0, -0.5, 0.5, 0.5,
-4.295412, -4.694126, 0.1991065, 1, -0.5, 0.5, 0.5,
-4.295412, -4.694126, 0.1991065, 1, 1.5, 0.5, 0.5,
-4.295412, -4.694126, 0.1991065, 0, 1.5, 0.5, 0.5
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
-3, -3.689614, -5.984842,
2, -3.689614, -5.984842,
-3, -3.689614, -5.984842,
-3, -3.857032, -6.294039,
-2, -3.689614, -5.984842,
-2, -3.857032, -6.294039,
-1, -3.689614, -5.984842,
-1, -3.857032, -6.294039,
0, -3.689614, -5.984842,
0, -3.857032, -6.294039,
1, -3.689614, -5.984842,
1, -3.857032, -6.294039,
2, -3.689614, -5.984842,
2, -3.857032, -6.294039
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
-3, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
-3, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
-3, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
-3, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5,
-2, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
-2, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
-2, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
-2, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5,
-1, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
-1, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
-1, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
-1, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5,
0, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
0, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
0, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
0, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5,
1, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
1, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
1, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
1, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5,
2, -4.19187, -6.912434, 0, -0.5, 0.5, 0.5,
2, -4.19187, -6.912434, 1, -0.5, 0.5, 0.5,
2, -4.19187, -6.912434, 1, 1.5, 0.5, 0.5,
2, -4.19187, -6.912434, 0, 1.5, 0.5, 0.5
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
-3.331638, -3, -5.984842,
-3.331638, 2, -5.984842,
-3.331638, -3, -5.984842,
-3.492267, -3, -6.294039,
-3.331638, -2, -5.984842,
-3.492267, -2, -6.294039,
-3.331638, -1, -5.984842,
-3.492267, -1, -6.294039,
-3.331638, 0, -5.984842,
-3.492267, 0, -6.294039,
-3.331638, 1, -5.984842,
-3.492267, 1, -6.294039,
-3.331638, 2, -5.984842,
-3.492267, 2, -6.294039
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
-3.813525, -3, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, -3, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, -3, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, -3, -6.912434, 0, 1.5, 0.5, 0.5,
-3.813525, -2, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, -2, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, -2, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, -2, -6.912434, 0, 1.5, 0.5, 0.5,
-3.813525, -1, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, -1, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, -1, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, -1, -6.912434, 0, 1.5, 0.5, 0.5,
-3.813525, 0, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, 0, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, 0, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, 0, -6.912434, 0, 1.5, 0.5, 0.5,
-3.813525, 1, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, 1, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, 1, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, 1, -6.912434, 0, 1.5, 0.5, 0.5,
-3.813525, 2, -6.912434, 0, -0.5, 0.5, 0.5,
-3.813525, 2, -6.912434, 1, -0.5, 0.5, 0.5,
-3.813525, 2, -6.912434, 1, 1.5, 0.5, 0.5,
-3.813525, 2, -6.912434, 0, 1.5, 0.5, 0.5
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
-3.331638, -3.689614, -4,
-3.331638, -3.689614, 6,
-3.331638, -3.689614, -4,
-3.492267, -3.857032, -4,
-3.331638, -3.689614, -2,
-3.492267, -3.857032, -2,
-3.331638, -3.689614, 0,
-3.492267, -3.857032, 0,
-3.331638, -3.689614, 2,
-3.492267, -3.857032, 2,
-3.331638, -3.689614, 4,
-3.492267, -3.857032, 4,
-3.331638, -3.689614, 6,
-3.492267, -3.857032, 6
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
-3.813525, -4.19187, -4, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, -4, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, -4, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, -4, 0, 1.5, 0.5, 0.5,
-3.813525, -4.19187, -2, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, -2, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, -2, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, -2, 0, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 0, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 0, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 0, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 0, 0, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 2, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 2, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 2, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 2, 0, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 4, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 4, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 4, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 4, 0, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 6, 0, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 6, 1, -0.5, 0.5, 0.5,
-3.813525, -4.19187, 6, 1, 1.5, 0.5, 0.5,
-3.813525, -4.19187, 6, 0, 1.5, 0.5, 0.5
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
-3.331638, -3.689614, -5.984842,
-3.331638, 3.007138, -5.984842,
-3.331638, -3.689614, 6.383055,
-3.331638, 3.007138, 6.383055,
-3.331638, -3.689614, -5.984842,
-3.331638, -3.689614, 6.383055,
-3.331638, 3.007138, -5.984842,
-3.331638, 3.007138, 6.383055,
-3.331638, -3.689614, -5.984842,
3.093523, -3.689614, -5.984842,
-3.331638, -3.689614, 6.383055,
3.093523, -3.689614, 6.383055,
-3.331638, 3.007138, -5.984842,
3.093523, 3.007138, -5.984842,
-3.331638, 3.007138, 6.383055,
3.093523, 3.007138, 6.383055,
3.093523, -3.689614, -5.984842,
3.093523, 3.007138, -5.984842,
3.093523, -3.689614, 6.383055,
3.093523, 3.007138, 6.383055,
3.093523, -3.689614, -5.984842,
3.093523, -3.689614, 6.383055,
3.093523, 3.007138, -5.984842,
3.093523, 3.007138, 6.383055
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
var radius = 8.256763;
var distance = 36.73527;
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
mvMatrix.translate( 0.1190574, 0.341238, -0.1991065 );
mvMatrix.scale( 1.38944, 1.33309, 0.7218183 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.73527);
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
Allophanate<-read.table("Allophanate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Allophanate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Allophanate' not found
```

```r
y<-Allophanate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Allophanate' not found
```

```r
z<-Allophanate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Allophanate' not found
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
-3.238068, 0.02555148, -1.562607, 0, 0, 1, 1, 1,
-2.933704, 0.4008443, -1.414088, 1, 0, 0, 1, 1,
-2.913934, -0.4612569, -2.36715, 1, 0, 0, 1, 1,
-2.580016, 0.7218167, -1.186157, 1, 0, 0, 1, 1,
-2.450168, -1.582144, -1.099529, 1, 0, 0, 1, 1,
-2.38312, 0.1547842, -0.8217909, 1, 0, 0, 1, 1,
-2.367076, -0.1867857, -1.931099, 0, 0, 0, 1, 1,
-2.343943, -0.6105841, -2.535954, 0, 0, 0, 1, 1,
-2.242681, 0.2823094, -1.708547, 0, 0, 0, 1, 1,
-2.224879, -1.536814, -1.457484, 0, 0, 0, 1, 1,
-2.211158, -0.56769, -1.493442, 0, 0, 0, 1, 1,
-2.156231, 0.2274139, -1.766161, 0, 0, 0, 1, 1,
-2.108158, 0.4611456, -1.999413, 0, 0, 0, 1, 1,
-2.072832, 0.3681502, -0.7936646, 1, 1, 1, 1, 1,
-2.071728, -1.276276, -3.651654, 1, 1, 1, 1, 1,
-2.050209, 1.480501, -1.520878, 1, 1, 1, 1, 1,
-2.038339, -0.6934053, -2.087248, 1, 1, 1, 1, 1,
-2.026472, -0.8563216, -2.85953, 1, 1, 1, 1, 1,
-2.011106, 0.3918233, -1.912336, 1, 1, 1, 1, 1,
-1.988183, 1.017502, -1.503546, 1, 1, 1, 1, 1,
-1.951669, -1.654641, -1.376842, 1, 1, 1, 1, 1,
-1.934201, -0.3265706, -1.257827, 1, 1, 1, 1, 1,
-1.922891, -0.1561278, -0.8200098, 1, 1, 1, 1, 1,
-1.914229, -0.6719567, -1.807898, 1, 1, 1, 1, 1,
-1.907979, 0.5190093, -0.692496, 1, 1, 1, 1, 1,
-1.9003, -0.07119825, -0.05332145, 1, 1, 1, 1, 1,
-1.896809, -0.4771985, -2.783323, 1, 1, 1, 1, 1,
-1.876573, 0.9441273, -0.2284734, 1, 1, 1, 1, 1,
-1.875391, -0.2391772, -1.750773, 0, 0, 1, 1, 1,
-1.872684, 0.7750041, 1.14104, 1, 0, 0, 1, 1,
-1.851205, 0.6532197, -1.522293, 1, 0, 0, 1, 1,
-1.843282, 0.0819492, -0.516593, 1, 0, 0, 1, 1,
-1.831277, -1.567778, -3.26503, 1, 0, 0, 1, 1,
-1.82994, -0.7379193, -3.249981, 1, 0, 0, 1, 1,
-1.820879, 1.196974, -1.626368, 0, 0, 0, 1, 1,
-1.817844, 0.4333855, -1.098552, 0, 0, 0, 1, 1,
-1.784819, 1.572532, -1.130196, 0, 0, 0, 1, 1,
-1.770939, 0.2613697, -2.439063, 0, 0, 0, 1, 1,
-1.756919, -0.7625495, -1.091163, 0, 0, 0, 1, 1,
-1.72457, -0.3608045, -1.661082, 0, 0, 0, 1, 1,
-1.723498, -0.9791787, -2.458327, 0, 0, 0, 1, 1,
-1.716458, 0.6522797, -1.873693, 1, 1, 1, 1, 1,
-1.709335, -0.9103604, -0.7815839, 1, 1, 1, 1, 1,
-1.696481, -1.98307, -1.162479, 1, 1, 1, 1, 1,
-1.692989, 0.2073707, -1.406213, 1, 1, 1, 1, 1,
-1.692517, 1.365418, -0.3091398, 1, 1, 1, 1, 1,
-1.691071, 0.9341772, -1.646571, 1, 1, 1, 1, 1,
-1.688679, 0.1671945, -1.744863, 1, 1, 1, 1, 1,
-1.683875, 0.1411854, -2.065735, 1, 1, 1, 1, 1,
-1.670292, -0.2888118, -0.1192651, 1, 1, 1, 1, 1,
-1.668705, 0.2358544, -1.439977, 1, 1, 1, 1, 1,
-1.667988, -0.5709942, -1.326601, 1, 1, 1, 1, 1,
-1.651857, 2.060859, -1.277734, 1, 1, 1, 1, 1,
-1.645823, -0.3578025, -0.459949, 1, 1, 1, 1, 1,
-1.645185, -0.8506815, -1.890631, 1, 1, 1, 1, 1,
-1.644035, -0.1619617, -2.570027, 1, 1, 1, 1, 1,
-1.636062, -0.4850597, -3.613522, 0, 0, 1, 1, 1,
-1.607324, 0.3454315, -0.9874774, 1, 0, 0, 1, 1,
-1.589133, -0.3675808, -1.350189, 1, 0, 0, 1, 1,
-1.58582, 0.3062845, 1.192108, 1, 0, 0, 1, 1,
-1.566211, 0.8950933, -2.660418, 1, 0, 0, 1, 1,
-1.565964, -0.4281447, -1.133456, 1, 0, 0, 1, 1,
-1.554381, -0.05199429, -1.771461, 0, 0, 0, 1, 1,
-1.54026, -0.4242193, -2.335768, 0, 0, 0, 1, 1,
-1.531229, 0.1959479, 0.1757139, 0, 0, 0, 1, 1,
-1.524137, 0.04516207, -0.4137819, 0, 0, 0, 1, 1,
-1.503194, -0.0847672, -0.7939311, 0, 0, 0, 1, 1,
-1.501559, -0.1251583, -1.144107, 0, 0, 0, 1, 1,
-1.487451, 0.8199118, -1.432563, 0, 0, 0, 1, 1,
-1.485112, -0.3304509, -2.805271, 1, 1, 1, 1, 1,
-1.483363, -0.3579346, -0.1991958, 1, 1, 1, 1, 1,
-1.481279, -1.200912, -2.847266, 1, 1, 1, 1, 1,
-1.473906, -0.06602881, -1.528266, 1, 1, 1, 1, 1,
-1.471421, 0.4057, -1.608092, 1, 1, 1, 1, 1,
-1.466442, -0.1627811, -3.164605, 1, 1, 1, 1, 1,
-1.466068, 0.8595536, -1.364493, 1, 1, 1, 1, 1,
-1.463336, 0.8064736, -1.668696, 1, 1, 1, 1, 1,
-1.457333, -0.3394302, -1.056076, 1, 1, 1, 1, 1,
-1.453111, 0.9611166, -0.5628442, 1, 1, 1, 1, 1,
-1.450614, 0.6239464, -0.9572728, 1, 1, 1, 1, 1,
-1.447203, 0.3151956, -1.637004, 1, 1, 1, 1, 1,
-1.445227, 0.740315, 0.437354, 1, 1, 1, 1, 1,
-1.441116, -1.22301, -1.481318, 1, 1, 1, 1, 1,
-1.437261, -0.4370158, -1.206803, 1, 1, 1, 1, 1,
-1.432645, -0.5673184, -2.313894, 0, 0, 1, 1, 1,
-1.42988, 0.9600617, 1.408667, 1, 0, 0, 1, 1,
-1.417788, -1.16824, -2.166923, 1, 0, 0, 1, 1,
-1.400119, -1.70256, -2.388716, 1, 0, 0, 1, 1,
-1.389527, 0.1620233, -1.536806, 1, 0, 0, 1, 1,
-1.376511, 1.167512, -0.28575, 1, 0, 0, 1, 1,
-1.372017, -0.3333925, -1.985686, 0, 0, 0, 1, 1,
-1.368999, -1.62569, -2.092346, 0, 0, 0, 1, 1,
-1.368619, 0.2788052, -1.319913, 0, 0, 0, 1, 1,
-1.347237, -1.325073, -2.666834, 0, 0, 0, 1, 1,
-1.34241, 0.3064166, -1.464879, 0, 0, 0, 1, 1,
-1.331386, 0.3410075, -1.021079, 0, 0, 0, 1, 1,
-1.330735, -0.8114542, -0.6015012, 0, 0, 0, 1, 1,
-1.324402, -1.014377, -3.144009, 1, 1, 1, 1, 1,
-1.323522, -0.623341, -2.371459, 1, 1, 1, 1, 1,
-1.323277, 1.463043, 0.5208077, 1, 1, 1, 1, 1,
-1.309042, -0.9802294, -1.81714, 1, 1, 1, 1, 1,
-1.308824, -1.162798, -1.687393, 1, 1, 1, 1, 1,
-1.284703, -1.046015, -2.568165, 1, 1, 1, 1, 1,
-1.275542, -1.358395, -3.639695, 1, 1, 1, 1, 1,
-1.266532, 1.509846, 0.7479221, 1, 1, 1, 1, 1,
-1.259914, -0.5032309, -1.903068, 1, 1, 1, 1, 1,
-1.249146, -0.1098447, -2.518906, 1, 1, 1, 1, 1,
-1.24886, 0.09151597, -2.069527, 1, 1, 1, 1, 1,
-1.239419, 0.3570709, -1.145866, 1, 1, 1, 1, 1,
-1.237131, 0.9218374, -0.9095812, 1, 1, 1, 1, 1,
-1.221751, -1.701758, -3.558402, 1, 1, 1, 1, 1,
-1.219724, 1.354407, -0.2397431, 1, 1, 1, 1, 1,
-1.211889, -0.02029004, -2.30515, 0, 0, 1, 1, 1,
-1.209923, 1.591326, -0.9801105, 1, 0, 0, 1, 1,
-1.203777, -0.4612923, 0.07042725, 1, 0, 0, 1, 1,
-1.201863, 0.1414871, -1.570428, 1, 0, 0, 1, 1,
-1.200268, -1.77359, -3.26226, 1, 0, 0, 1, 1,
-1.200095, 0.7317454, -0.8469013, 1, 0, 0, 1, 1,
-1.196087, 0.9682141, -1.28636, 0, 0, 0, 1, 1,
-1.192377, -0.8012785, -2.785951, 0, 0, 0, 1, 1,
-1.179266, 0.3549738, -2.521826, 0, 0, 0, 1, 1,
-1.174569, 0.4079863, -0.428553, 0, 0, 0, 1, 1,
-1.170863, 0.8821523, -0.853343, 0, 0, 0, 1, 1,
-1.169797, -1.429102, -3.4667, 0, 0, 0, 1, 1,
-1.168216, -0.2191114, -2.308578, 0, 0, 0, 1, 1,
-1.167582, -1.228717, -3.231197, 1, 1, 1, 1, 1,
-1.157221, 0.05807539, -2.424604, 1, 1, 1, 1, 1,
-1.146312, -1.4181, -4.356963, 1, 1, 1, 1, 1,
-1.141868, 0.6371527, -1.022972, 1, 1, 1, 1, 1,
-1.141786, -1.402621, -2.848806, 1, 1, 1, 1, 1,
-1.138948, -0.3615911, -3.906096, 1, 1, 1, 1, 1,
-1.134928, -1.002897, -2.727054, 1, 1, 1, 1, 1,
-1.134197, 1.35122, -0.5812047, 1, 1, 1, 1, 1,
-1.132929, 0.5856539, -0.2722554, 1, 1, 1, 1, 1,
-1.130049, -0.6642123, -2.522572, 1, 1, 1, 1, 1,
-1.126676, 1.121825, -0.1777715, 1, 1, 1, 1, 1,
-1.114839, -1.345006, -4.37757, 1, 1, 1, 1, 1,
-1.109883, -1.493132, -2.967136, 1, 1, 1, 1, 1,
-1.109434, -3.184583, -1.613712, 1, 1, 1, 1, 1,
-1.100386, -0.5044593, -1.572522, 1, 1, 1, 1, 1,
-1.099179, -0.3077706, -2.526079, 0, 0, 1, 1, 1,
-1.092669, -0.07008676, -1.389416, 1, 0, 0, 1, 1,
-1.087572, 0.07515962, -1.528586, 1, 0, 0, 1, 1,
-1.082687, -1.981619, -2.729536, 1, 0, 0, 1, 1,
-1.081478, -3.110358, -2.6903, 1, 0, 0, 1, 1,
-1.073692, 1.503144, 0.9609534, 1, 0, 0, 1, 1,
-1.073569, -0.4050388, -2.740299, 0, 0, 0, 1, 1,
-1.072082, -1.090355, -2.138208, 0, 0, 0, 1, 1,
-1.07055, 1.128549, 0.1884707, 0, 0, 0, 1, 1,
-1.066634, -0.4798618, -2.003916, 0, 0, 0, 1, 1,
-1.062777, 0.2705538, -3.500965, 0, 0, 0, 1, 1,
-1.048304, -0.8539822, -1.618044, 0, 0, 0, 1, 1,
-1.045124, 1.348342, -1.940347, 0, 0, 0, 1, 1,
-1.035802, -0.4825795, -2.392701, 1, 1, 1, 1, 1,
-1.03359, -0.3796631, -0.5931305, 1, 1, 1, 1, 1,
-1.022242, -0.05272719, -0.6373402, 1, 1, 1, 1, 1,
-1.019445, 1.123447, -0.4935621, 1, 1, 1, 1, 1,
-1.016915, 0.09829489, -1.149391, 1, 1, 1, 1, 1,
-1.009632, 1.109972, -0.6202786, 1, 1, 1, 1, 1,
-1.009529, 1.230271, 0.2237174, 1, 1, 1, 1, 1,
-1.005633, 1.20441, 0.8714359, 1, 1, 1, 1, 1,
-1.004877, 0.4342121, 0.7233752, 1, 1, 1, 1, 1,
-1.002356, 0.4195339, -1.462613, 1, 1, 1, 1, 1,
-1.001828, 0.5857193, -2.647111, 1, 1, 1, 1, 1,
-1.000144, -0.3257477, -3.079015, 1, 1, 1, 1, 1,
-0.9996572, -1.286322, -3.229106, 1, 1, 1, 1, 1,
-0.9933423, -0.08707175, -2.528357, 1, 1, 1, 1, 1,
-0.9884713, 0.3440263, 0.2770514, 1, 1, 1, 1, 1,
-0.9882753, 0.8174699, -0.6051951, 0, 0, 1, 1, 1,
-0.9782247, -1.159196, -2.050875, 1, 0, 0, 1, 1,
-0.9779765, -0.3428949, -2.39641, 1, 0, 0, 1, 1,
-0.9744995, 0.648901, -2.577847, 1, 0, 0, 1, 1,
-0.9659001, 1.023142, -1.075483, 1, 0, 0, 1, 1,
-0.9561601, 0.2731702, -0.1750468, 1, 0, 0, 1, 1,
-0.9508692, -0.9866669, -2.604255, 0, 0, 0, 1, 1,
-0.9469121, -0.7769985, -1.911228, 0, 0, 0, 1, 1,
-0.9428335, -0.1898226, -2.173448, 0, 0, 0, 1, 1,
-0.9416749, 0.3751885, -0.009354203, 0, 0, 0, 1, 1,
-0.9414228, -0.04675306, -1.249291, 0, 0, 0, 1, 1,
-0.9405711, -0.4872852, -2.584472, 0, 0, 0, 1, 1,
-0.9375414, 0.9756857, 1.244164, 0, 0, 0, 1, 1,
-0.9343615, 0.5506691, -1.560294, 1, 1, 1, 1, 1,
-0.934184, 0.4153935, -2.206817, 1, 1, 1, 1, 1,
-0.9329513, 0.6631017, -0.857758, 1, 1, 1, 1, 1,
-0.9325079, 2.466387, 0.2445567, 1, 1, 1, 1, 1,
-0.9313198, 1.356065, 0.2843446, 1, 1, 1, 1, 1,
-0.9304912, 0.9098507, -2.044933, 1, 1, 1, 1, 1,
-0.9205596, 1.349561, -0.3659507, 1, 1, 1, 1, 1,
-0.9142351, 0.5941092, 0.9006845, 1, 1, 1, 1, 1,
-0.9094796, -0.465712, -2.215799, 1, 1, 1, 1, 1,
-0.9072445, 1.446887, 0.3457896, 1, 1, 1, 1, 1,
-0.9054496, -0.4391659, -2.273049, 1, 1, 1, 1, 1,
-0.8914342, -2.035393, -2.326156, 1, 1, 1, 1, 1,
-0.8862604, 2.218104, 0.1362851, 1, 1, 1, 1, 1,
-0.8805305, 0.6601407, 0.3284329, 1, 1, 1, 1, 1,
-0.8755742, -0.5483406, -2.224746, 1, 1, 1, 1, 1,
-0.8713369, 0.654573, -0.5477237, 0, 0, 1, 1, 1,
-0.8707647, -1.060767, -3.573648, 1, 0, 0, 1, 1,
-0.869525, -0.1077918, -1.621275, 1, 0, 0, 1, 1,
-0.8672378, -1.089782, -1.32183, 1, 0, 0, 1, 1,
-0.8655583, -1.183864, -0.9176928, 1, 0, 0, 1, 1,
-0.8547184, -0.5434802, -3.030484, 1, 0, 0, 1, 1,
-0.8538529, -0.8097098, -4.851647, 0, 0, 0, 1, 1,
-0.8536354, -0.7068655, -3.499182, 0, 0, 0, 1, 1,
-0.8503533, -0.6370832, -2.788869, 0, 0, 0, 1, 1,
-0.848299, 0.04865572, -2.066028, 0, 0, 0, 1, 1,
-0.8481897, -0.1543428, -2.503232, 0, 0, 0, 1, 1,
-0.8480791, -0.8693659, -2.514091, 0, 0, 0, 1, 1,
-0.8460982, 0.7174134, -0.3472817, 0, 0, 0, 1, 1,
-0.8443735, -0.5793337, -4.193463, 1, 1, 1, 1, 1,
-0.8430623, -1.703664, -2.997559, 1, 1, 1, 1, 1,
-0.8330902, -0.1487809, -0.6211258, 1, 1, 1, 1, 1,
-0.8328402, 1.151169, -3.119089, 1, 1, 1, 1, 1,
-0.8328089, -0.5563653, -1.421904, 1, 1, 1, 1, 1,
-0.8263738, 1.208923, 0.6271383, 1, 1, 1, 1, 1,
-0.819518, 0.506656, -0.2511031, 1, 1, 1, 1, 1,
-0.819005, 0.7575961, -0.4628859, 1, 1, 1, 1, 1,
-0.8156331, -0.2697916, -2.185184, 1, 1, 1, 1, 1,
-0.8076488, 0.8606199, -1.475091, 1, 1, 1, 1, 1,
-0.8029293, 0.5515332, -1.542502, 1, 1, 1, 1, 1,
-0.8021253, -0.1729048, -0.8660536, 1, 1, 1, 1, 1,
-0.8000678, -0.5593128, -1.751006, 1, 1, 1, 1, 1,
-0.7978174, -0.3829594, -2.520593, 1, 1, 1, 1, 1,
-0.7926409, 0.09742202, -1.320852, 1, 1, 1, 1, 1,
-0.788869, -0.8820578, -3.362316, 0, 0, 1, 1, 1,
-0.7842206, -0.9659919, -1.498623, 1, 0, 0, 1, 1,
-0.780964, 0.1613582, -1.506646, 1, 0, 0, 1, 1,
-0.7731069, 0.1250495, -0.6705034, 1, 0, 0, 1, 1,
-0.7726989, -1.035644, -5.099205, 1, 0, 0, 1, 1,
-0.7698971, 1.17924, -0.8351846, 1, 0, 0, 1, 1,
-0.7675294, -1.057242, -2.699737, 0, 0, 0, 1, 1,
-0.766972, 0.5589988, -0.7626838, 0, 0, 0, 1, 1,
-0.7652325, -0.06850393, -1.491555, 0, 0, 0, 1, 1,
-0.7618244, -0.889779, -2.086838, 0, 0, 0, 1, 1,
-0.7595349, -0.7776879, -3.211372, 0, 0, 0, 1, 1,
-0.7576382, 0.1998375, -0.9847487, 0, 0, 0, 1, 1,
-0.7565705, 0.6095701, 0.1138654, 0, 0, 0, 1, 1,
-0.7548136, 0.008602911, -1.398225, 1, 1, 1, 1, 1,
-0.7531719, 0.3680935, 0.360589, 1, 1, 1, 1, 1,
-0.7498934, 0.2864315, -2.471272, 1, 1, 1, 1, 1,
-0.7448364, 0.3776121, -2.356831, 1, 1, 1, 1, 1,
-0.7422991, 0.6344628, 0.2112134, 1, 1, 1, 1, 1,
-0.7376832, 0.5664428, 0.6429175, 1, 1, 1, 1, 1,
-0.7351251, 0.1965523, -0.9402945, 1, 1, 1, 1, 1,
-0.7330189, -0.4682818, -2.953937, 1, 1, 1, 1, 1,
-0.7241656, 0.382944, -0.9470778, 1, 1, 1, 1, 1,
-0.7231264, 1.465067, 2.006463, 1, 1, 1, 1, 1,
-0.710389, -1.096217, -2.123132, 1, 1, 1, 1, 1,
-0.7069997, -1.032043, -2.114536, 1, 1, 1, 1, 1,
-0.7065786, -3.410205, -1.544098, 1, 1, 1, 1, 1,
-0.7047368, -0.841631, -4.250631, 1, 1, 1, 1, 1,
-0.6949369, -0.2980099, -2.423598, 1, 1, 1, 1, 1,
-0.6948369, 1.425994, -2.404518, 0, 0, 1, 1, 1,
-0.6945955, -1.258123, -4.210515, 1, 0, 0, 1, 1,
-0.6911079, 0.702813, -0.9683583, 1, 0, 0, 1, 1,
-0.6860226, 2.674272, -0.9896683, 1, 0, 0, 1, 1,
-0.6795947, 2.781984, 0.193982, 1, 0, 0, 1, 1,
-0.6787761, 0.8634458, -1.159832, 1, 0, 0, 1, 1,
-0.6747203, -1.409152, -3.241519, 0, 0, 0, 1, 1,
-0.6673527, -0.6993228, -2.905773, 0, 0, 0, 1, 1,
-0.6603693, 0.3140649, -1.763701, 0, 0, 0, 1, 1,
-0.659305, -1.46395, -0.7782119, 0, 0, 0, 1, 1,
-0.65748, 0.6934604, 0.8672524, 0, 0, 0, 1, 1,
-0.6566976, -1.067074, -2.274754, 0, 0, 0, 1, 1,
-0.6553568, 1.888507, -0.5631303, 0, 0, 0, 1, 1,
-0.6547067, 0.3997913, -0.4307925, 1, 1, 1, 1, 1,
-0.6537964, -0.4328096, -2.450685, 1, 1, 1, 1, 1,
-0.6487144, -1.215618, -2.699377, 1, 1, 1, 1, 1,
-0.6480595, -0.5749591, -1.095559, 1, 1, 1, 1, 1,
-0.6468232, 0.04796947, -0.7450953, 1, 1, 1, 1, 1,
-0.6444573, -0.04620992, -1.654043, 1, 1, 1, 1, 1,
-0.6441643, -0.9277182, -1.353795, 1, 1, 1, 1, 1,
-0.6401603, -1.286834, -4.768123, 1, 1, 1, 1, 1,
-0.6318407, -0.1535383, -1.767253, 1, 1, 1, 1, 1,
-0.6228157, -0.1615799, -0.4988106, 1, 1, 1, 1, 1,
-0.6198989, -0.4072647, -1.292463, 1, 1, 1, 1, 1,
-0.6096013, -0.8333293, -2.154658, 1, 1, 1, 1, 1,
-0.6093723, -1.069038, -1.882445, 1, 1, 1, 1, 1,
-0.6062399, -0.4620163, -2.781487, 1, 1, 1, 1, 1,
-0.5965419, -1.356926, -3.734369, 1, 1, 1, 1, 1,
-0.5942433, -0.3414676, -2.65345, 0, 0, 1, 1, 1,
-0.5909812, -2.413897, -3.157995, 1, 0, 0, 1, 1,
-0.586291, -0.9239878, -3.596867, 1, 0, 0, 1, 1,
-0.5862173, 1.03003, -0.8691381, 1, 0, 0, 1, 1,
-0.5801902, -0.006561995, -2.181565, 1, 0, 0, 1, 1,
-0.5740281, -0.2163888, -1.494274, 1, 0, 0, 1, 1,
-0.572085, 0.3188557, -0.8446332, 0, 0, 0, 1, 1,
-0.5607143, -1.040835, -3.701745, 0, 0, 0, 1, 1,
-0.5582854, 0.5179533, -1.923365, 0, 0, 0, 1, 1,
-0.5579768, 0.03757496, -0.2665717, 0, 0, 0, 1, 1,
-0.5574615, 1.725711, -0.6566355, 0, 0, 0, 1, 1,
-0.5504864, -0.9068083, -3.655076, 0, 0, 0, 1, 1,
-0.5470169, 0.5724564, 1.468383, 0, 0, 0, 1, 1,
-0.5468577, -0.4989568, -1.687302, 1, 1, 1, 1, 1,
-0.5454554, 1.91871, -0.831196, 1, 1, 1, 1, 1,
-0.5430729, -0.3600722, -2.911731, 1, 1, 1, 1, 1,
-0.5362154, 0.6161286, -1.227566, 1, 1, 1, 1, 1,
-0.5331534, 0.3967208, -1.866756, 1, 1, 1, 1, 1,
-0.5327809, -0.5328981, -0.1806916, 1, 1, 1, 1, 1,
-0.5326208, 0.8571754, -0.6274503, 1, 1, 1, 1, 1,
-0.5322633, -0.3978496, -2.800793, 1, 1, 1, 1, 1,
-0.5311845, 1.362528, -1.431, 1, 1, 1, 1, 1,
-0.5284556, 0.1711128, -1.612816, 1, 1, 1, 1, 1,
-0.5238798, -0.7919812, -1.753131, 1, 1, 1, 1, 1,
-0.5213275, -0.8829311, -4.766912, 1, 1, 1, 1, 1,
-0.5146701, -0.6761891, -2.760291, 1, 1, 1, 1, 1,
-0.5129729, 0.8639855, 0.1716606, 1, 1, 1, 1, 1,
-0.5119179, 1.894261, 0.3849165, 1, 1, 1, 1, 1,
-0.511593, -0.2401603, -1.529927, 0, 0, 1, 1, 1,
-0.5105727, -0.1087386, -0.497753, 1, 0, 0, 1, 1,
-0.5099848, 0.2511064, -1.865713, 1, 0, 0, 1, 1,
-0.5011361, -0.456614, -1.743608, 1, 0, 0, 1, 1,
-0.5003856, -1.453395, -2.652215, 1, 0, 0, 1, 1,
-0.4962293, -0.1352705, -2.340531, 1, 0, 0, 1, 1,
-0.4924281, -1.06919, -2.463025, 0, 0, 0, 1, 1,
-0.4912, -0.5127789, -3.698694, 0, 0, 0, 1, 1,
-0.4901774, -0.9748064, -4.590933, 0, 0, 0, 1, 1,
-0.4811599, -1.002369, -3.118983, 0, 0, 0, 1, 1,
-0.4784145, 0.1165027, -0.7039049, 0, 0, 0, 1, 1,
-0.4758651, -1.014824, -3.726759, 0, 0, 0, 1, 1,
-0.4731847, -0.40164, -3.004671, 0, 0, 0, 1, 1,
-0.4701554, -0.6400443, -1.984192, 1, 1, 1, 1, 1,
-0.4679015, -1.076157, -3.213212, 1, 1, 1, 1, 1,
-0.4637288, -0.3036252, -0.8489978, 1, 1, 1, 1, 1,
-0.4599339, -0.6534425, -3.825269, 1, 1, 1, 1, 1,
-0.4569152, 0.8418922, 0.3906418, 1, 1, 1, 1, 1,
-0.4545234, -1.88816, -2.953706, 1, 1, 1, 1, 1,
-0.4534068, 0.8595961, 1.76896, 1, 1, 1, 1, 1,
-0.4471015, 0.3120547, -2.590689, 1, 1, 1, 1, 1,
-0.4463259, -0.04144835, -0.6534735, 1, 1, 1, 1, 1,
-0.4437712, -1.595267, -3.528088, 1, 1, 1, 1, 1,
-0.4437373, -0.2206106, -2.657032, 1, 1, 1, 1, 1,
-0.4434686, -1.945239, -3.076615, 1, 1, 1, 1, 1,
-0.4385779, 0.5508634, 0.6810966, 1, 1, 1, 1, 1,
-0.4314443, -0.9270257, -3.430237, 1, 1, 1, 1, 1,
-0.4291324, 1.776607, 0.2477851, 1, 1, 1, 1, 1,
-0.4263774, -0.1491251, -1.252004, 0, 0, 1, 1, 1,
-0.4240392, -1.106528, -1.825828, 1, 0, 0, 1, 1,
-0.4187405, 1.89415, 0.1478673, 1, 0, 0, 1, 1,
-0.416658, -0.7646132, -2.706154, 1, 0, 0, 1, 1,
-0.4149859, 1.80026, 0.4021459, 1, 0, 0, 1, 1,
-0.4071826, -0.6553535, -4.390833, 1, 0, 0, 1, 1,
-0.4057502, -1.374762, -4.110247, 0, 0, 0, 1, 1,
-0.4040459, -0.1740649, -2.694841, 0, 0, 0, 1, 1,
-0.4011077, -0.1307229, -2.057688, 0, 0, 0, 1, 1,
-0.3955672, 0.5822095, -1.607448, 0, 0, 0, 1, 1,
-0.3953728, 0.1838641, -1.437778, 0, 0, 0, 1, 1,
-0.3912, 0.8079486, 0.4563046, 0, 0, 0, 1, 1,
-0.3909902, -0.00352246, -2.658774, 0, 0, 0, 1, 1,
-0.3900232, -0.1651121, -3.414854, 1, 1, 1, 1, 1,
-0.3895622, -0.9004415, -1.065299, 1, 1, 1, 1, 1,
-0.3870922, -0.1469442, -3.665879, 1, 1, 1, 1, 1,
-0.3860461, 1.106047, -0.8688083, 1, 1, 1, 1, 1,
-0.3853461, -0.6822641, -2.997112, 1, 1, 1, 1, 1,
-0.3788899, 1.043844, -0.1520695, 1, 1, 1, 1, 1,
-0.3778122, -0.4283539, -2.849664, 1, 1, 1, 1, 1,
-0.3684312, 0.02188978, -1.900752, 1, 1, 1, 1, 1,
-0.3684298, -0.8259836, -4.865228, 1, 1, 1, 1, 1,
-0.3595401, -1.283997, -4.712058, 1, 1, 1, 1, 1,
-0.3593221, 1.334926, -0.518633, 1, 1, 1, 1, 1,
-0.3567765, 0.04524137, -2.004374, 1, 1, 1, 1, 1,
-0.3493973, -0.2136745, -0.9830126, 1, 1, 1, 1, 1,
-0.3482006, -0.5992171, -4.843879, 1, 1, 1, 1, 1,
-0.347063, 0.6210125, -0.2774879, 1, 1, 1, 1, 1,
-0.3433909, 1.072418, -0.619048, 0, 0, 1, 1, 1,
-0.3430471, 2.189461, -0.02472221, 1, 0, 0, 1, 1,
-0.341799, 0.0147673, -2.215944, 1, 0, 0, 1, 1,
-0.3412022, 0.1643678, 0.7758732, 1, 0, 0, 1, 1,
-0.3411646, -0.8779453, -1.811326, 1, 0, 0, 1, 1,
-0.3388742, 1.632307, 0.1765936, 1, 0, 0, 1, 1,
-0.3352008, -0.6068394, -2.921869, 0, 0, 0, 1, 1,
-0.3342989, -0.4052801, -1.581534, 0, 0, 0, 1, 1,
-0.3331917, 0.1682298, -1.930163, 0, 0, 0, 1, 1,
-0.3318892, 0.9829852, -1.458042, 0, 0, 0, 1, 1,
-0.3296882, 0.7850716, -0.4674704, 0, 0, 0, 1, 1,
-0.3239596, 0.6944391, 0.640283, 0, 0, 0, 1, 1,
-0.3231489, 1.620866, -2.758279, 0, 0, 0, 1, 1,
-0.319978, 0.1027021, -0.7265502, 1, 1, 1, 1, 1,
-0.3178668, -0.363452, -5.383794, 1, 1, 1, 1, 1,
-0.3155064, -0.7730073, -2.451591, 1, 1, 1, 1, 1,
-0.314676, -0.7563853, -2.724657, 1, 1, 1, 1, 1,
-0.3098524, -0.4952891, -4.679267, 1, 1, 1, 1, 1,
-0.3086606, -0.3568508, -1.13811, 1, 1, 1, 1, 1,
-0.3022927, -0.7781278, -1.472055, 1, 1, 1, 1, 1,
-0.2948864, -0.6501054, -4.017627, 1, 1, 1, 1, 1,
-0.2934736, 0.9344418, 0.05672483, 1, 1, 1, 1, 1,
-0.2925056, 0.1034136, -2.934478, 1, 1, 1, 1, 1,
-0.291846, -0.870309, -1.96744, 1, 1, 1, 1, 1,
-0.2911833, -0.9124988, -1.662082, 1, 1, 1, 1, 1,
-0.2900115, -1.354012, -4.215392, 1, 1, 1, 1, 1,
-0.2877029, -0.9735426, -3.678649, 1, 1, 1, 1, 1,
-0.2874284, -0.1111306, -3.243761, 1, 1, 1, 1, 1,
-0.2834182, 0.2100948, -2.637033, 0, 0, 1, 1, 1,
-0.2826672, 0.02896762, -0.8950988, 1, 0, 0, 1, 1,
-0.282608, 0.8871147, -0.02044078, 1, 0, 0, 1, 1,
-0.2812956, 1.528391, -1.489079, 1, 0, 0, 1, 1,
-0.2759001, 1.206983, -0.6081204, 1, 0, 0, 1, 1,
-0.2756308, 0.2828957, -0.4999306, 1, 0, 0, 1, 1,
-0.2716293, 0.383873, -0.8000277, 0, 0, 0, 1, 1,
-0.2696432, -0.3022986, -2.353362, 0, 0, 0, 1, 1,
-0.2649834, 0.3146001, 0.2243757, 0, 0, 0, 1, 1,
-0.2636479, 0.3944235, -1.65383, 0, 0, 0, 1, 1,
-0.2608874, 0.3244001, -1.542907, 0, 0, 0, 1, 1,
-0.2597588, 1.65559, 1.036413, 0, 0, 0, 1, 1,
-0.2585239, -0.3631091, -3.036755, 0, 0, 0, 1, 1,
-0.2558627, -1.325054, -2.913985, 1, 1, 1, 1, 1,
-0.2545526, 1.309124, 0.8138931, 1, 1, 1, 1, 1,
-0.2534666, -0.5308375, -4.541164, 1, 1, 1, 1, 1,
-0.2523628, 0.5066396, -1.272089, 1, 1, 1, 1, 1,
-0.2510044, 0.7974939, -1.17274, 1, 1, 1, 1, 1,
-0.247346, 0.9965647, -2.032931, 1, 1, 1, 1, 1,
-0.2456028, -1.592311, -2.756152, 1, 1, 1, 1, 1,
-0.2447917, 1.112039, -0.4064561, 1, 1, 1, 1, 1,
-0.239649, 0.349448, -0.1045943, 1, 1, 1, 1, 1,
-0.2291753, 1.477458, 1.54853, 1, 1, 1, 1, 1,
-0.2279966, 0.6391177, -1.916501, 1, 1, 1, 1, 1,
-0.2271898, -0.6794696, -3.006731, 1, 1, 1, 1, 1,
-0.2222948, 1.995322, 0.9528698, 1, 1, 1, 1, 1,
-0.2216972, -1.381092, -2.913789, 1, 1, 1, 1, 1,
-0.214381, -1.551289, -3.094375, 1, 1, 1, 1, 1,
-0.2133582, -0.3793072, -3.223203, 0, 0, 1, 1, 1,
-0.212996, 0.4745805, -0.7441576, 1, 0, 0, 1, 1,
-0.2110311, -0.8880737, -3.958565, 1, 0, 0, 1, 1,
-0.2109607, 0.4305427, 1.219372, 1, 0, 0, 1, 1,
-0.2055009, -0.784322, -1.40998, 1, 0, 0, 1, 1,
-0.203705, -0.8644753, -2.393962, 1, 0, 0, 1, 1,
-0.2030117, -1.117279, -2.652968, 0, 0, 0, 1, 1,
-0.2026342, -0.412136, -2.519542, 0, 0, 0, 1, 1,
-0.2009542, 1.345591, 1.428023, 0, 0, 0, 1, 1,
-0.2007774, -0.2445768, -1.215522, 0, 0, 0, 1, 1,
-0.1967292, 2.194337, -0.1883445, 0, 0, 0, 1, 1,
-0.1964164, 0.4820324, -0.2672445, 0, 0, 0, 1, 1,
-0.1952757, -0.2942165, -2.05248, 0, 0, 0, 1, 1,
-0.190269, 2.37235, 1.415282, 1, 1, 1, 1, 1,
-0.1834256, -1.228922, -5.804727, 1, 1, 1, 1, 1,
-0.1812417, 0.05306071, -1.90289, 1, 1, 1, 1, 1,
-0.1777713, -1.052097, -3.204166, 1, 1, 1, 1, 1,
-0.1776491, 0.5620167, -1.229236, 1, 1, 1, 1, 1,
-0.176559, 0.1546164, -0.5402669, 1, 1, 1, 1, 1,
-0.1755414, 0.9216441, -0.135114, 1, 1, 1, 1, 1,
-0.1749185, 1.130285, -0.8255364, 1, 1, 1, 1, 1,
-0.1720374, 1.111991, -0.734649, 1, 1, 1, 1, 1,
-0.1702589, 1.523505, -1.256652, 1, 1, 1, 1, 1,
-0.1689992, -0.3354803, -2.350355, 1, 1, 1, 1, 1,
-0.168227, -0.83603, -2.713763, 1, 1, 1, 1, 1,
-0.1493725, 0.006406168, -1.978835, 1, 1, 1, 1, 1,
-0.1485146, -0.1912668, -2.992996, 1, 1, 1, 1, 1,
-0.1484725, 0.1715875, -1.657604, 1, 1, 1, 1, 1,
-0.1474758, 0.4481225, 0.8100014, 0, 0, 1, 1, 1,
-0.1450044, -0.9814947, -2.415341, 1, 0, 0, 1, 1,
-0.1444732, 0.2466342, -0.5951992, 1, 0, 0, 1, 1,
-0.1425374, 0.5349939, 0.09486642, 1, 0, 0, 1, 1,
-0.1414845, 1.927612, 0.3382416, 1, 0, 0, 1, 1,
-0.1412044, 0.8663304, 0.0628907, 1, 0, 0, 1, 1,
-0.1398886, -0.8641971, -2.350786, 0, 0, 0, 1, 1,
-0.1388755, 0.2558668, -2.087256, 0, 0, 0, 1, 1,
-0.1387639, 1.98984, 0.9995921, 0, 0, 0, 1, 1,
-0.1366372, -1.119133, -1.44082, 0, 0, 0, 1, 1,
-0.1336396, -0.2498201, -0.8301528, 0, 0, 0, 1, 1,
-0.1322892, -0.360457, -4.171019, 0, 0, 0, 1, 1,
-0.1254709, -0.3751805, -3.151897, 0, 0, 0, 1, 1,
-0.1253181, 1.875208, -0.2138016, 1, 1, 1, 1, 1,
-0.1232308, 0.1201224, -3.167594, 1, 1, 1, 1, 1,
-0.1154924, 0.2770638, -2.116952, 1, 1, 1, 1, 1,
-0.1119788, -1.323135, -3.13631, 1, 1, 1, 1, 1,
-0.1108831, -0.9982185, -4.418504, 1, 1, 1, 1, 1,
-0.1064987, -0.5127617, -3.869741, 1, 1, 1, 1, 1,
-0.1051393, 0.01271326, -0.6547263, 1, 1, 1, 1, 1,
-0.1049907, 0.9095206, -1.262255, 1, 1, 1, 1, 1,
-0.1015561, 0.4409007, -0.1467679, 1, 1, 1, 1, 1,
-0.09723382, -1.293524, -4.327032, 1, 1, 1, 1, 1,
-0.09564762, 0.1619547, 0.06164677, 1, 1, 1, 1, 1,
-0.09354421, -1.122802, -3.582956, 1, 1, 1, 1, 1,
-0.09194245, 0.6144326, -1.742923, 1, 1, 1, 1, 1,
-0.0904568, 0.991195, 1.34061, 1, 1, 1, 1, 1,
-0.08535566, -0.8257779, -3.96948, 1, 1, 1, 1, 1,
-0.0823746, -1.597414, -3.72605, 0, 0, 1, 1, 1,
-0.08134696, -0.3480739, -4.450511, 1, 0, 0, 1, 1,
-0.0812093, -1.117208, -3.15191, 1, 0, 0, 1, 1,
-0.08042611, 0.5949566, -0.7180455, 1, 0, 0, 1, 1,
-0.07694167, -0.1278813, -3.748487, 1, 0, 0, 1, 1,
-0.06440391, -0.3289407, -3.267592, 1, 0, 0, 1, 1,
-0.06434771, 0.405485, -1.081833, 0, 0, 0, 1, 1,
-0.06127628, 1.315664, -0.8932566, 0, 0, 0, 1, 1,
-0.06007937, 0.2212356, 1.197959, 0, 0, 0, 1, 1,
-0.0528528, -0.8910308, -2.223753, 0, 0, 0, 1, 1,
-0.05075426, -2.429919, -3.299748, 0, 0, 0, 1, 1,
-0.04579327, -2.018566, -3.308587, 0, 0, 0, 1, 1,
-0.04422254, -1.467553, -3.821417, 0, 0, 0, 1, 1,
-0.04380086, -1.045378, -2.840786, 1, 1, 1, 1, 1,
-0.04135741, 1.737782, 1.707228, 1, 1, 1, 1, 1,
-0.04063235, -0.6651379, -3.893118, 1, 1, 1, 1, 1,
-0.0370439, 0.8583289, 0.05697308, 1, 1, 1, 1, 1,
-0.03628017, 0.1075223, 0.5672768, 1, 1, 1, 1, 1,
-0.03415497, 0.9363236, 0.2477854, 1, 1, 1, 1, 1,
-0.03290144, -0.8045009, -3.096877, 1, 1, 1, 1, 1,
-0.0325697, 0.8957603, -0.5395276, 1, 1, 1, 1, 1,
-0.03219852, 0.2812231, 0.5297839, 1, 1, 1, 1, 1,
-0.03168076, -0.6596303, -4.533312, 1, 1, 1, 1, 1,
-0.03064611, 2.085726, -0.3199329, 1, 1, 1, 1, 1,
-0.02657877, 0.05432981, -1.579409, 1, 1, 1, 1, 1,
-0.02455655, 1.259344, -0.6784462, 1, 1, 1, 1, 1,
-0.02320261, 0.3414473, -0.5571051, 1, 1, 1, 1, 1,
-0.01927282, -2.157361, -3.806827, 1, 1, 1, 1, 1,
-0.01527089, -0.1908298, -5.206127, 0, 0, 1, 1, 1,
-0.01130148, 0.9419451, -0.5549922, 1, 0, 0, 1, 1,
-0.01010611, -0.3251429, -4.551246, 1, 0, 0, 1, 1,
-0.007912561, -0.3294661, -0.5344791, 1, 0, 0, 1, 1,
-0.00785321, 0.8507767, -0.4377781, 1, 0, 0, 1, 1,
-0.0066855, -0.3063948, -2.968425, 1, 0, 0, 1, 1,
-0.005131103, -1.289394, -3.240692, 0, 0, 0, 1, 1,
-0.003435948, -1.094978, -2.886949, 0, 0, 0, 1, 1,
0.001176127, 0.1749484, 0.1372823, 0, 0, 0, 1, 1,
0.001759119, -0.1558555, 3.150456, 0, 0, 0, 1, 1,
0.002359411, 1.899796, 0.01497655, 0, 0, 0, 1, 1,
0.004786822, 0.3662761, 1.066905, 0, 0, 0, 1, 1,
0.005152527, 1.765669, 0.4857235, 0, 0, 0, 1, 1,
0.01175633, -0.1600108, 3.333162, 1, 1, 1, 1, 1,
0.01402076, -0.845652, 3.021829, 1, 1, 1, 1, 1,
0.01429375, -1.964104, 3.291382, 1, 1, 1, 1, 1,
0.01868309, 0.5940099, 0.8130605, 1, 1, 1, 1, 1,
0.02044116, -0.01996881, 2.470646, 1, 1, 1, 1, 1,
0.02170924, 0.01080996, 1.188568, 1, 1, 1, 1, 1,
0.02300927, 0.2527853, 0.07482485, 1, 1, 1, 1, 1,
0.02320721, 0.5004104, -0.627387, 1, 1, 1, 1, 1,
0.02454306, 1.124134, 1.537125, 1, 1, 1, 1, 1,
0.02747502, 0.4480865, 0.3920392, 1, 1, 1, 1, 1,
0.02918313, 0.5838271, -1.587122, 1, 1, 1, 1, 1,
0.03000901, -1.424257, 1.735177, 1, 1, 1, 1, 1,
0.03003832, 0.03693569, 0.1293915, 1, 1, 1, 1, 1,
0.03020087, -0.712942, 2.000957, 1, 1, 1, 1, 1,
0.03153164, -0.4302162, 3.696126, 1, 1, 1, 1, 1,
0.03860819, -0.7685571, 3.009827, 0, 0, 1, 1, 1,
0.04035154, -0.5351502, 1.556608, 1, 0, 0, 1, 1,
0.05254365, 1.025876, 1.479392, 1, 0, 0, 1, 1,
0.05257113, -0.2664139, 3.259688, 1, 0, 0, 1, 1,
0.05371806, 0.1103849, 1.36325, 1, 0, 0, 1, 1,
0.05399119, -0.3442509, 3.603295, 1, 0, 0, 1, 1,
0.05461593, 0.2884545, -0.7919849, 0, 0, 0, 1, 1,
0.05543308, -2.225668, 3.345968, 0, 0, 0, 1, 1,
0.05678931, 0.5190254, 0.79067, 0, 0, 0, 1, 1,
0.05765098, 0.7167871, 0.7818364, 0, 0, 0, 1, 1,
0.05850413, -0.8393506, 2.694626, 0, 0, 0, 1, 1,
0.05853773, 0.9778866, -2.161635, 0, 0, 0, 1, 1,
0.05962976, -0.009732838, 1.965172, 0, 0, 0, 1, 1,
0.06029858, 1.790599, 0.1354856, 1, 1, 1, 1, 1,
0.0668529, 0.3607769, 1.618924, 1, 1, 1, 1, 1,
0.0714874, -0.789846, 2.084471, 1, 1, 1, 1, 1,
0.07387969, 1.142555, -0.1566872, 1, 1, 1, 1, 1,
0.07529233, -1.433923, 3.343505, 1, 1, 1, 1, 1,
0.07626894, -0.5451298, 2.371881, 1, 1, 1, 1, 1,
0.08059203, 0.02937561, 3.16886, 1, 1, 1, 1, 1,
0.08230595, -2.617148, 2.179843, 1, 1, 1, 1, 1,
0.08497602, 0.1886, 1.050959, 1, 1, 1, 1, 1,
0.08609823, 0.6784827, -0.3094046, 1, 1, 1, 1, 1,
0.0867656, -2.580139, 3.486324, 1, 1, 1, 1, 1,
0.09283635, 0.8626883, 0.300205, 1, 1, 1, 1, 1,
0.09317134, 0.7716517, -0.1260619, 1, 1, 1, 1, 1,
0.1026666, 1.590329, -0.1922881, 1, 1, 1, 1, 1,
0.1031738, 0.3635533, 0.7873118, 1, 1, 1, 1, 1,
0.1036846, -0.741358, 2.307875, 0, 0, 1, 1, 1,
0.1100638, 2.739811, 0.7848166, 1, 0, 0, 1, 1,
0.1111018, 0.7982228, -1.334967, 1, 0, 0, 1, 1,
0.112635, -0.6651468, 2.36964, 1, 0, 0, 1, 1,
0.1129612, 2.499985, -0.35631, 1, 0, 0, 1, 1,
0.1204051, 0.298675, -2.26723, 1, 0, 0, 1, 1,
0.1209756, -0.7114047, 3.952279, 0, 0, 0, 1, 1,
0.1248323, 0.6125087, 0.7335147, 0, 0, 0, 1, 1,
0.1253237, 0.2998911, -0.8378262, 0, 0, 0, 1, 1,
0.1258214, -0.1098621, 0.9338817, 0, 0, 0, 1, 1,
0.1272288, 0.2349819, -1.295669, 0, 0, 0, 1, 1,
0.130483, -1.371515, 3.218191, 0, 0, 0, 1, 1,
0.1374998, 1.57724, 1.878964, 0, 0, 0, 1, 1,
0.1416555, -1.385188, 3.252736, 1, 1, 1, 1, 1,
0.1438333, 0.1194107, 1.596681, 1, 1, 1, 1, 1,
0.144467, 0.2840457, 0.8644914, 1, 1, 1, 1, 1,
0.1509407, -0.2193847, 2.667717, 1, 1, 1, 1, 1,
0.1530009, 0.2604888, 1.39546, 1, 1, 1, 1, 1,
0.1651692, 0.6291498, 1.32962, 1, 1, 1, 1, 1,
0.1654025, -0.2554137, 0.9609659, 1, 1, 1, 1, 1,
0.1656918, -0.7569942, 4.560882, 1, 1, 1, 1, 1,
0.1667302, 0.5189416, 0.484154, 1, 1, 1, 1, 1,
0.167024, -0.1026163, 1.813577, 1, 1, 1, 1, 1,
0.1704738, 1.056713, -0.4145999, 1, 1, 1, 1, 1,
0.1715274, 1.62001, 1.709112, 1, 1, 1, 1, 1,
0.1728376, -0.2057058, 2.228727, 1, 1, 1, 1, 1,
0.1762185, 0.3081774, -0.2881065, 1, 1, 1, 1, 1,
0.1829376, -0.7398816, 2.906516, 1, 1, 1, 1, 1,
0.1830394, 0.1626943, 0.9844697, 0, 0, 1, 1, 1,
0.1857419, -0.1736958, 3.643726, 1, 0, 0, 1, 1,
0.1894748, 2.42339, 1.185343, 1, 0, 0, 1, 1,
0.1946059, -0.2959909, 1.829467, 1, 0, 0, 1, 1,
0.195402, 0.9263867, -0.707649, 1, 0, 0, 1, 1,
0.1958681, 0.3847596, 0.5804369, 1, 0, 0, 1, 1,
0.196957, 0.2145049, 2.207375, 0, 0, 0, 1, 1,
0.1970631, 0.4171538, 0.7563767, 0, 0, 0, 1, 1,
0.1976048, -1.699742, 2.210945, 0, 0, 0, 1, 1,
0.1979435, 0.3981249, -0.3303089, 0, 0, 0, 1, 1,
0.1983782, -0.8633426, 2.81968, 0, 0, 0, 1, 1,
0.2001089, 0.0241481, 0.7454808, 0, 0, 0, 1, 1,
0.2122503, -0.5206262, 2.465086, 0, 0, 0, 1, 1,
0.2136763, 0.4800564, -1.236718, 1, 1, 1, 1, 1,
0.2189871, 0.6013194, 1.364637, 1, 1, 1, 1, 1,
0.2208609, -0.619877, 2.896603, 1, 1, 1, 1, 1,
0.2210037, 0.6505457, 0.3856722, 1, 1, 1, 1, 1,
0.224176, 2.476541, -0.7804136, 1, 1, 1, 1, 1,
0.2256986, -1.230693, 3.101175, 1, 1, 1, 1, 1,
0.2375879, -0.08843621, 2.486991, 1, 1, 1, 1, 1,
0.2396325, 0.6680247, 0.0619157, 1, 1, 1, 1, 1,
0.2416469, -0.343778, 3.311481, 1, 1, 1, 1, 1,
0.2469422, -0.5834867, 2.148038, 1, 1, 1, 1, 1,
0.2552565, -0.860604, 2.516467, 1, 1, 1, 1, 1,
0.2560778, -0.3044305, 3.177935, 1, 1, 1, 1, 1,
0.260265, 0.5722987, -0.9597143, 1, 1, 1, 1, 1,
0.2606054, -1.06605, 2.335248, 1, 1, 1, 1, 1,
0.2615104, 0.7073363, -0.06200531, 1, 1, 1, 1, 1,
0.2621278, -0.4917136, 5.139414, 0, 0, 1, 1, 1,
0.264403, -2.178158, 4.023503, 1, 0, 0, 1, 1,
0.2654197, -1.465624, 4.462133, 1, 0, 0, 1, 1,
0.2662273, 0.1845674, 1.736531, 1, 0, 0, 1, 1,
0.2667548, 1.752904, -0.5246707, 1, 0, 0, 1, 1,
0.2680909, -0.8549339, 2.586942, 1, 0, 0, 1, 1,
0.2698615, -0.5177375, 3.260501, 0, 0, 0, 1, 1,
0.2703425, 0.2545471, 1.57636, 0, 0, 0, 1, 1,
0.2709916, 1.535426, -0.0477979, 0, 0, 0, 1, 1,
0.2720188, -0.1235831, 3.5579, 0, 0, 0, 1, 1,
0.2722591, 0.2920839, 0.661573, 0, 0, 0, 1, 1,
0.2808666, 0.000495844, 2.423821, 0, 0, 0, 1, 1,
0.2829524, -2.105718, 2.621658, 0, 0, 0, 1, 1,
0.2841471, -0.4105344, 3.428859, 1, 1, 1, 1, 1,
0.2893115, 0.9908569, 1.118583, 1, 1, 1, 1, 1,
0.2969361, -1.745858, 2.575466, 1, 1, 1, 1, 1,
0.2977507, 2.132908, 0.7795317, 1, 1, 1, 1, 1,
0.2984155, -1.305941, 2.168551, 1, 1, 1, 1, 1,
0.3020092, -3.592088, 6.20294, 1, 1, 1, 1, 1,
0.3023418, -0.6982318, 1.268515, 1, 1, 1, 1, 1,
0.3077768, -1.023276, 3.649017, 1, 1, 1, 1, 1,
0.3082798, -0.8756129, 2.931145, 1, 1, 1, 1, 1,
0.3093726, -0.5049611, 4.268226, 1, 1, 1, 1, 1,
0.3125416, 0.5480976, 0.006073701, 1, 1, 1, 1, 1,
0.3136525, 0.2619637, 0.8526003, 1, 1, 1, 1, 1,
0.3153521, -0.3593429, 4.495007, 1, 1, 1, 1, 1,
0.3196617, -1.35589, 1.1191, 1, 1, 1, 1, 1,
0.3224447, 0.2314762, -0.02308357, 1, 1, 1, 1, 1,
0.3238563, -0.3529422, 1.87583, 0, 0, 1, 1, 1,
0.3249049, -1.431401, 4.199888, 1, 0, 0, 1, 1,
0.3253989, 1.629905, -0.4329172, 1, 0, 0, 1, 1,
0.3329925, -1.346439, 3.881252, 1, 0, 0, 1, 1,
0.3357267, -0.3874082, 2.837668, 1, 0, 0, 1, 1,
0.3394115, 1.778351, 1.346921, 1, 0, 0, 1, 1,
0.3449771, -0.5443289, 3.99893, 0, 0, 0, 1, 1,
0.3467412, 0.3336431, 0.7999705, 0, 0, 0, 1, 1,
0.3557207, 2.017572, -0.1652592, 0, 0, 0, 1, 1,
0.3569224, 1.455831, 1.533443, 0, 0, 0, 1, 1,
0.3578852, 0.6595656, 0.6328868, 0, 0, 0, 1, 1,
0.3600578, -0.5952414, 2.485608, 0, 0, 0, 1, 1,
0.3635142, 0.6384183, 0.01442535, 0, 0, 0, 1, 1,
0.363585, -1.004861, 3.884272, 1, 1, 1, 1, 1,
0.3691322, 1.434503, -0.1164701, 1, 1, 1, 1, 1,
0.3859191, -0.3365743, 1.798399, 1, 1, 1, 1, 1,
0.3918675, -0.626921, 3.92182, 1, 1, 1, 1, 1,
0.3958767, 0.6091136, 2.497236, 1, 1, 1, 1, 1,
0.3979747, 0.2038176, 0.007732976, 1, 1, 1, 1, 1,
0.3989877, 0.8076187, 0.746136, 1, 1, 1, 1, 1,
0.402163, -0.5986996, 1.888456, 1, 1, 1, 1, 1,
0.4066424, 0.6309705, 2.584316, 1, 1, 1, 1, 1,
0.4149575, -1.435238, 2.029323, 1, 1, 1, 1, 1,
0.4174473, -1.129418, 4.056292, 1, 1, 1, 1, 1,
0.4227253, 0.501899, 0.7257862, 1, 1, 1, 1, 1,
0.4228225, -0.6938457, 1.92765, 1, 1, 1, 1, 1,
0.4361281, 0.04899147, 1.542996, 1, 1, 1, 1, 1,
0.4380603, 0.3624155, 3.074331, 1, 1, 1, 1, 1,
0.4394207, -1.508456, 0.670591, 0, 0, 1, 1, 1,
0.4407742, 1.13588, 1.239836, 1, 0, 0, 1, 1,
0.4429958, -0.7468771, 2.802285, 1, 0, 0, 1, 1,
0.4435835, 0.5266832, 2.561934, 1, 0, 0, 1, 1,
0.4488808, 1.938501, 0.097799, 1, 0, 0, 1, 1,
0.4500839, 3.330793e-05, 2.434442, 1, 0, 0, 1, 1,
0.4519255, 0.8644594, -1.80722, 0, 0, 0, 1, 1,
0.4527668, -0.5676537, 3.091069, 0, 0, 0, 1, 1,
0.4535007, -0.8637778, 1.923815, 0, 0, 0, 1, 1,
0.4566817, -0.4027956, 1.149687, 0, 0, 0, 1, 1,
0.4655361, 0.1163883, 0.8222926, 0, 0, 0, 1, 1,
0.4689607, 0.2390628, 0.3128709, 0, 0, 0, 1, 1,
0.4703307, -0.5433896, 2.803777, 0, 0, 0, 1, 1,
0.4707378, 2.021732, 1.185868, 1, 1, 1, 1, 1,
0.4744448, -0.3553156, 3.614635, 1, 1, 1, 1, 1,
0.4771559, 0.1160103, 0.9219418, 1, 1, 1, 1, 1,
0.478765, 0.2148343, 1.827133, 1, 1, 1, 1, 1,
0.479367, -1.161453, 2.861571, 1, 1, 1, 1, 1,
0.4835904, 2.529223, -0.129884, 1, 1, 1, 1, 1,
0.4907907, 0.52271, -0.08976257, 1, 1, 1, 1, 1,
0.4909135, 0.3369769, 1.168224, 1, 1, 1, 1, 1,
0.4938768, 0.384236, 0.9368406, 1, 1, 1, 1, 1,
0.497819, -0.2302579, 3.068456, 1, 1, 1, 1, 1,
0.4985455, -2.469803, 4.545327, 1, 1, 1, 1, 1,
0.5038933, 0.4659515, -0.1884466, 1, 1, 1, 1, 1,
0.5067313, -2.213152, 2.300275, 1, 1, 1, 1, 1,
0.5099316, -0.3219598, 1.514351, 1, 1, 1, 1, 1,
0.51262, 0.2756, 0.3584169, 1, 1, 1, 1, 1,
0.5159848, -1.530966, 2.428204, 0, 0, 1, 1, 1,
0.5176411, -0.3469009, 1.094923, 1, 0, 0, 1, 1,
0.5189294, 0.1002762, 2.410981, 1, 0, 0, 1, 1,
0.5193867, 1.951342, 1.651797, 1, 0, 0, 1, 1,
0.5204701, -1.81565, 2.904791, 1, 0, 0, 1, 1,
0.5304092, -1.165454, 2.166735, 1, 0, 0, 1, 1,
0.5329666, -0.3239082, 1.88926, 0, 0, 0, 1, 1,
0.5339124, -0.8223948, 2.342626, 0, 0, 0, 1, 1,
0.534953, -2.425482, 3.7496, 0, 0, 0, 1, 1,
0.5385719, 0.5569063, -2.030424, 0, 0, 0, 1, 1,
0.5394496, 0.4526174, 0.9398402, 0, 0, 0, 1, 1,
0.5418289, 0.2672428, 2.610203, 0, 0, 0, 1, 1,
0.5421705, -0.7022385, 4.379543, 0, 0, 0, 1, 1,
0.5520099, -0.1457312, 0.7111901, 1, 1, 1, 1, 1,
0.5536569, -1.241707, 1.686405, 1, 1, 1, 1, 1,
0.5550869, -0.332466, 2.863237, 1, 1, 1, 1, 1,
0.5594154, -0.3740655, 2.028555, 1, 1, 1, 1, 1,
0.5605281, -0.9694149, 1.656838, 1, 1, 1, 1, 1,
0.5615531, 1.211271, -0.07129704, 1, 1, 1, 1, 1,
0.5644153, -0.5105319, 2.22607, 1, 1, 1, 1, 1,
0.5662163, -0.4833363, 2.202698, 1, 1, 1, 1, 1,
0.5686255, 2.531121, -0.4777368, 1, 1, 1, 1, 1,
0.5692057, -0.2425035, 2.076897, 1, 1, 1, 1, 1,
0.5775739, 0.8058347, 1.233768, 1, 1, 1, 1, 1,
0.579187, 1.49164, 0.9348975, 1, 1, 1, 1, 1,
0.5872765, 0.872171, 0.8850594, 1, 1, 1, 1, 1,
0.5898505, 1.794773, 1.154296, 1, 1, 1, 1, 1,
0.5927058, -1.859432, 2.243626, 1, 1, 1, 1, 1,
0.595934, -0.04166244, 1.395193, 0, 0, 1, 1, 1,
0.5987107, -0.9298267, 2.621678, 1, 0, 0, 1, 1,
0.5988344, -0.3312297, 2.017132, 1, 0, 0, 1, 1,
0.5996432, 0.9229058, 0.4383048, 1, 0, 0, 1, 1,
0.6032288, -1.211994, 1.625082, 1, 0, 0, 1, 1,
0.604058, -0.3541997, 2.210877, 1, 0, 0, 1, 1,
0.6049708, -1.453072, 4.334805, 0, 0, 0, 1, 1,
0.6085732, 0.6769802, 0.9101505, 0, 0, 0, 1, 1,
0.6094637, -0.2000991, 3.01827, 0, 0, 0, 1, 1,
0.6099904, 0.5979526, 1.000276, 0, 0, 0, 1, 1,
0.611142, 0.5768698, -1.979563, 0, 0, 0, 1, 1,
0.6140637, -0.661971, 1.11745, 0, 0, 0, 1, 1,
0.6161512, -0.3146363, 1.439149, 0, 0, 0, 1, 1,
0.6185385, 1.545538, 1.149265, 1, 1, 1, 1, 1,
0.6205502, 1.752866, 0.7856488, 1, 1, 1, 1, 1,
0.6223612, 0.08920565, 3.246666, 1, 1, 1, 1, 1,
0.6287255, -0.4981161, 1.793442, 1, 1, 1, 1, 1,
0.6292133, 1.634569, -1.237173, 1, 1, 1, 1, 1,
0.629533, -0.1560745, 1.50396, 1, 1, 1, 1, 1,
0.6311576, 0.9278258, 0.9428816, 1, 1, 1, 1, 1,
0.6324229, -0.07376148, 2.831011, 1, 1, 1, 1, 1,
0.6325391, -0.3494436, 3.201728, 1, 1, 1, 1, 1,
0.633223, 0.6926368, 1.822421, 1, 1, 1, 1, 1,
0.633305, -0.5383773, 2.406088, 1, 1, 1, 1, 1,
0.6353216, -1.225553, 1.582859, 1, 1, 1, 1, 1,
0.639333, -0.9891761, 2.272601, 1, 1, 1, 1, 1,
0.6394725, -0.565259, 3.524386, 1, 1, 1, 1, 1,
0.6470094, 1.148356, 0.1112447, 1, 1, 1, 1, 1,
0.6511685, -0.4441819, 2.089076, 0, 0, 1, 1, 1,
0.654511, -1.383391, 3.822157, 1, 0, 0, 1, 1,
0.6551536, 0.5524688, 1.599915, 1, 0, 0, 1, 1,
0.6552148, -0.0832257, 1.333766, 1, 0, 0, 1, 1,
0.6553639, -0.5390752, 0.5607095, 1, 0, 0, 1, 1,
0.6555191, -0.1862044, 0.5857179, 1, 0, 0, 1, 1,
0.6585613, 0.01052222, 1.095564, 0, 0, 0, 1, 1,
0.6631649, 1.883569, -1.185883, 0, 0, 0, 1, 1,
0.6686998, 0.1862431, 1.214598, 0, 0, 0, 1, 1,
0.6721, -0.2512243, 0.6582227, 0, 0, 0, 1, 1,
0.6764916, 0.5285776, -0.2238831, 0, 0, 0, 1, 1,
0.678203, -0.6371457, 2.607993, 0, 0, 0, 1, 1,
0.6792679, -0.7070805, 2.825671, 0, 0, 0, 1, 1,
0.6814414, 0.1116846, -1.578492, 1, 1, 1, 1, 1,
0.6814687, -0.5013689, 2.68015, 1, 1, 1, 1, 1,
0.6865984, 1.835499, -0.4444672, 1, 1, 1, 1, 1,
0.6883059, 0.2399649, 2.135838, 1, 1, 1, 1, 1,
0.6889917, -1.394628, 3.3064, 1, 1, 1, 1, 1,
0.694459, 0.2758394, 1.579773, 1, 1, 1, 1, 1,
0.697188, -1.271973, 2.939288, 1, 1, 1, 1, 1,
0.698001, 0.3816665, 1.918049, 1, 1, 1, 1, 1,
0.7110216, -0.4139375, 2.242743, 1, 1, 1, 1, 1,
0.7115925, -0.4785303, 3.538467, 1, 1, 1, 1, 1,
0.7150401, -0.459349, 0.5697955, 1, 1, 1, 1, 1,
0.7173099, 1.406708, -0.1558155, 1, 1, 1, 1, 1,
0.7220272, -0.6596138, 1.116649, 1, 1, 1, 1, 1,
0.7270922, -1.860333, 2.737535, 1, 1, 1, 1, 1,
0.7278323, -0.06524481, 1.923821, 1, 1, 1, 1, 1,
0.7302544, -0.8783366, 1.783182, 0, 0, 1, 1, 1,
0.7375832, 1.094127, 0.9221597, 1, 0, 0, 1, 1,
0.7477356, -1.200095, 0.736735, 1, 0, 0, 1, 1,
0.755009, 1.937352, 0.1168483, 1, 0, 0, 1, 1,
0.7553336, -0.2925278, 1.860798, 1, 0, 0, 1, 1,
0.7558341, 1.72362, 0.7219062, 1, 0, 0, 1, 1,
0.7572078, -0.608991, 2.223206, 0, 0, 0, 1, 1,
0.7577772, 0.1945482, 1.097198, 0, 0, 0, 1, 1,
0.7588744, 1.334115, 2.498687, 0, 0, 0, 1, 1,
0.7615451, 1.054127, -0.5651883, 0, 0, 0, 1, 1,
0.7633993, -1.249887, 3.084061, 0, 0, 0, 1, 1,
0.7674187, 0.3046464, -0.3538592, 0, 0, 0, 1, 1,
0.7707728, 1.322631, -0.8364452, 0, 0, 0, 1, 1,
0.7726361, 0.06803227, 2.100705, 1, 1, 1, 1, 1,
0.7744488, 0.697616, -1.295149, 1, 1, 1, 1, 1,
0.7820884, 0.3041076, 0.2944379, 1, 1, 1, 1, 1,
0.7874558, 0.3733146, 0.9690706, 1, 1, 1, 1, 1,
0.8003202, -0.5182725, 1.08487, 1, 1, 1, 1, 1,
0.8005033, -1.112261, 2.04669, 1, 1, 1, 1, 1,
0.8079509, -0.7816141, 1.768105, 1, 1, 1, 1, 1,
0.8154364, 0.7459628, 0.1524416, 1, 1, 1, 1, 1,
0.8180835, 0.1935155, 0.2862546, 1, 1, 1, 1, 1,
0.8187985, -0.9191865, 1.826431, 1, 1, 1, 1, 1,
0.8241357, -0.1452897, 0.9347103, 1, 1, 1, 1, 1,
0.8243358, 0.01487645, 1.42507, 1, 1, 1, 1, 1,
0.8267574, -0.4218252, 2.954092, 1, 1, 1, 1, 1,
0.8292897, 0.3155132, 3.96712, 1, 1, 1, 1, 1,
0.8544098, -0.8540528, 2.7495, 1, 1, 1, 1, 1,
0.8581677, 2.221822, 0.6817873, 0, 0, 1, 1, 1,
0.8620484, -1.274625, 2.935181, 1, 0, 0, 1, 1,
0.8649107, -1.261253, 1.328603, 1, 0, 0, 1, 1,
0.869494, 2.331297, 2.231589, 1, 0, 0, 1, 1,
0.8741603, -1.022641, 2.910657, 1, 0, 0, 1, 1,
0.8840461, 1.729949, -0.1368881, 1, 0, 0, 1, 1,
0.8861411, -1.582389, 0.5999476, 0, 0, 0, 1, 1,
0.8899248, 0.4700081, 3.042075, 0, 0, 0, 1, 1,
0.8911509, -0.007459476, 1.338475, 0, 0, 0, 1, 1,
0.8916295, -0.998514, 2.037957, 0, 0, 0, 1, 1,
0.8972493, 0.4392093, 0.9127356, 0, 0, 0, 1, 1,
0.9062901, -2.236781, 4.620099, 0, 0, 0, 1, 1,
0.9069866, -0.08013718, 2.274587, 0, 0, 0, 1, 1,
0.9109125, 1.274685, 0.4283732, 1, 1, 1, 1, 1,
0.9121416, 0.8077288, -0.8083987, 1, 1, 1, 1, 1,
0.9137161, 0.464114, 2.700294, 1, 1, 1, 1, 1,
0.9139142, -0.05551348, 1.381205, 1, 1, 1, 1, 1,
0.9202745, -1.594252, 2.81489, 1, 1, 1, 1, 1,
0.9204109, -1.102023, 3.319908, 1, 1, 1, 1, 1,
0.9227057, -0.7320641, 1.217692, 1, 1, 1, 1, 1,
0.9232159, -0.7848749, 3.124945, 1, 1, 1, 1, 1,
0.9258497, -0.801285, 4.170176, 1, 1, 1, 1, 1,
0.9300328, 2.31618, -0.7434933, 1, 1, 1, 1, 1,
0.9358431, -0.3792182, 2.706035, 1, 1, 1, 1, 1,
0.936802, 0.2394968, 1.362259, 1, 1, 1, 1, 1,
0.9369852, 0.5418967, -0.1377522, 1, 1, 1, 1, 1,
0.9383508, -0.1750447, 2.085589, 1, 1, 1, 1, 1,
0.9406815, 1.015693, 1.885066, 1, 1, 1, 1, 1,
0.9407609, 1.58612, -0.5442913, 0, 0, 1, 1, 1,
0.9457224, 0.7375706, 1.328222, 1, 0, 0, 1, 1,
0.9576063, -2.594351, 2.068349, 1, 0, 0, 1, 1,
0.9745814, 0.3505713, 0.4022241, 1, 0, 0, 1, 1,
0.9772965, 1.781067, -0.235382, 1, 0, 0, 1, 1,
0.9810708, -1.934587, 3.003315, 1, 0, 0, 1, 1,
0.9938294, 1.022884, 0.6894169, 0, 0, 0, 1, 1,
1.001419, -0.5713553, 2.117571, 0, 0, 0, 1, 1,
1.006328, -0.5009015, 2.855563, 0, 0, 0, 1, 1,
1.006853, -1.009006, 1.846316, 0, 0, 0, 1, 1,
1.012638, 0.2158959, -0.1465788, 0, 0, 0, 1, 1,
1.016267, -0.1904265, 1.035633, 0, 0, 0, 1, 1,
1.02297, -0.3613025, 1.780675, 0, 0, 0, 1, 1,
1.026658, -0.5975472, 2.085308, 1, 1, 1, 1, 1,
1.030501, 0.7034869, 1.349603, 1, 1, 1, 1, 1,
1.046945, 0.2842959, 0.6240697, 1, 1, 1, 1, 1,
1.053606, -0.9055262, 1.433817, 1, 1, 1, 1, 1,
1.06399, 0.2223389, 2.146014, 1, 1, 1, 1, 1,
1.080961, 2.228318, -0.8416759, 1, 1, 1, 1, 1,
1.082244, 0.326791, 0.7395053, 1, 1, 1, 1, 1,
1.085034, -1.664864, 2.357047, 1, 1, 1, 1, 1,
1.086696, 0.7560557, -0.5397297, 1, 1, 1, 1, 1,
1.087648, 1.358572, 0.4506967, 1, 1, 1, 1, 1,
1.097936, 0.1852058, 0.899524, 1, 1, 1, 1, 1,
1.098655, 1.151578, 0.6584698, 1, 1, 1, 1, 1,
1.10034, -0.5915952, 2.071158, 1, 1, 1, 1, 1,
1.105079, 0.9299378, 0.478253, 1, 1, 1, 1, 1,
1.105369, -1.195174, 3.065363, 1, 1, 1, 1, 1,
1.105828, -0.0144215, 3.313524, 0, 0, 1, 1, 1,
1.121269, -0.640025, 2.165663, 1, 0, 0, 1, 1,
1.134179, 0.04992723, 0.7923253, 1, 0, 0, 1, 1,
1.136341, 0.5827462, -0.1957135, 1, 0, 0, 1, 1,
1.142473, -1.143698, 3.09054, 1, 0, 0, 1, 1,
1.155694, -0.0079833, 1.959266, 1, 0, 0, 1, 1,
1.157008, 0.476995, -1.358549, 0, 0, 0, 1, 1,
1.159218, 0.7457079, 0.3344779, 0, 0, 0, 1, 1,
1.175969, -0.7613112, 3.440885, 0, 0, 0, 1, 1,
1.178429, -0.5442324, 2.355094, 0, 0, 0, 1, 1,
1.189005, -0.4230373, 1.073528, 0, 0, 0, 1, 1,
1.205528, 0.0482433, 2.335989, 0, 0, 0, 1, 1,
1.205597, -1.200532, 1.525589, 0, 0, 0, 1, 1,
1.208772, -0.2882681, 1.111591, 1, 1, 1, 1, 1,
1.226885, -0.2097891, 2.818161, 1, 1, 1, 1, 1,
1.230836, 0.3822632, 0.04428919, 1, 1, 1, 1, 1,
1.238215, -1.465741, 2.309866, 1, 1, 1, 1, 1,
1.2401, -1.053512, -0.2254802, 1, 1, 1, 1, 1,
1.241776, -0.5349367, 2.336377, 1, 1, 1, 1, 1,
1.245609, 0.7534451, 0.1260438, 1, 1, 1, 1, 1,
1.248946, 1.591875, 2.246989, 1, 1, 1, 1, 1,
1.252324, -0.5692351, 1.816565, 1, 1, 1, 1, 1,
1.25255, -0.6740478, 1.731899, 1, 1, 1, 1, 1,
1.255903, -0.22069, 2.948824, 1, 1, 1, 1, 1,
1.260674, -0.4847809, 2.944642, 1, 1, 1, 1, 1,
1.264038, -0.000606165, 0.3195131, 1, 1, 1, 1, 1,
1.266505, -0.1271705, 0.4864649, 1, 1, 1, 1, 1,
1.275197, 0.02116171, 1.611852, 1, 1, 1, 1, 1,
1.275457, 0.08415674, 0.3556522, 0, 0, 1, 1, 1,
1.287696, 1.435463, -1.108488, 1, 0, 0, 1, 1,
1.296389, -0.7146617, 1.852906, 1, 0, 0, 1, 1,
1.299191, 2.309415, -0.3361351, 1, 0, 0, 1, 1,
1.302398, 0.6913231, 1.852041, 1, 0, 0, 1, 1,
1.312746, -1.645442, 4.273391, 1, 0, 0, 1, 1,
1.327534, -0.7811226, 2.047355, 0, 0, 0, 1, 1,
1.353539, 0.8606219, 1.974902, 0, 0, 0, 1, 1,
1.357918, -1.167475, 1.38356, 0, 0, 0, 1, 1,
1.371481, -0.2899207, 2.499237, 0, 0, 0, 1, 1,
1.372525, -1.331668, 3.682215, 0, 0, 0, 1, 1,
1.387952, -1.058305, 0.5090972, 0, 0, 0, 1, 1,
1.396676, 0.9342344, 0.9747754, 0, 0, 0, 1, 1,
1.402514, 1.214175, -1.073157, 1, 1, 1, 1, 1,
1.408207, -2.029758, 2.250224, 1, 1, 1, 1, 1,
1.418601, -0.489527, 1.524168, 1, 1, 1, 1, 1,
1.421835, -0.06624021, 2.294341, 1, 1, 1, 1, 1,
1.427527, -0.4547028, 1.984502, 1, 1, 1, 1, 1,
1.428503, 1.788291, -0.1823898, 1, 1, 1, 1, 1,
1.436709, 0.8781629, 1.065961, 1, 1, 1, 1, 1,
1.437093, 0.5714423, 0.9446096, 1, 1, 1, 1, 1,
1.442583, 0.2812783, 1.304181, 1, 1, 1, 1, 1,
1.442725, 0.7876484, 1.922872, 1, 1, 1, 1, 1,
1.454363, 0.6088513, 1.220456, 1, 1, 1, 1, 1,
1.46339, 0.1691013, 1.094431, 1, 1, 1, 1, 1,
1.465814, -0.1223994, 3.651303, 1, 1, 1, 1, 1,
1.48672, 0.2006133, 2.772658, 1, 1, 1, 1, 1,
1.487087, 0.4766391, 2.052212, 1, 1, 1, 1, 1,
1.489034, -0.4762464, 1.55782, 0, 0, 1, 1, 1,
1.504953, -1.549391, 1.42551, 1, 0, 0, 1, 1,
1.512018, 0.2885899, 1.040419, 1, 0, 0, 1, 1,
1.518274, 0.5182406, 2.20448, 1, 0, 0, 1, 1,
1.530417, -1.39433, 1.937992, 1, 0, 0, 1, 1,
1.543225, -1.762815, 1.842739, 1, 0, 0, 1, 1,
1.550095, -0.9890671, 2.218245, 0, 0, 0, 1, 1,
1.55821, 1.388066, 0.1777909, 0, 0, 0, 1, 1,
1.561633, -0.8035501, 2.245601, 0, 0, 0, 1, 1,
1.574742, 0.07654941, 0.8293931, 0, 0, 0, 1, 1,
1.579479, 1.054495, -0.02392992, 0, 0, 0, 1, 1,
1.588822, -1.193829, 0.5948737, 0, 0, 0, 1, 1,
1.596273, 0.4719564, 0.7762959, 0, 0, 0, 1, 1,
1.605573, -1.795734, 4.071954, 1, 1, 1, 1, 1,
1.624714, 0.2326633, 1.720989, 1, 1, 1, 1, 1,
1.633161, 1.172683, 0.565596, 1, 1, 1, 1, 1,
1.641955, -0.3352914, 2.986834, 1, 1, 1, 1, 1,
1.646151, 1.923867, 1.268375, 1, 1, 1, 1, 1,
1.647339, 0.9115389, 1.071536, 1, 1, 1, 1, 1,
1.662205, 0.2401003, 0.6476138, 1, 1, 1, 1, 1,
1.674231, 0.131368, 1.045791, 1, 1, 1, 1, 1,
1.682653, -0.3975759, 2.583972, 1, 1, 1, 1, 1,
1.691434, -1.313443, 1.628747, 1, 1, 1, 1, 1,
1.699522, -2.19349, 0.7609022, 1, 1, 1, 1, 1,
1.701109, 1.480821, 1.379154, 1, 1, 1, 1, 1,
1.703208, 0.5937217, 1.148746, 1, 1, 1, 1, 1,
1.708683, 0.1152417, 2.654159, 1, 1, 1, 1, 1,
1.710537, -0.7055648, 1.572202, 1, 1, 1, 1, 1,
1.714125, -0.08582839, 2.263209, 0, 0, 1, 1, 1,
1.716696, -1.621239, 0.4399529, 1, 0, 0, 1, 1,
1.733182, -0.7809451, 1.276254, 1, 0, 0, 1, 1,
1.736405, 1.440584, 2.567812, 1, 0, 0, 1, 1,
1.739245, -0.2303797, -0.5127314, 1, 0, 0, 1, 1,
1.770775, 0.3068166, 1.04176, 1, 0, 0, 1, 1,
1.798897, -0.6787715, 3.712278, 0, 0, 0, 1, 1,
1.802037, 1.367513, 0.08598923, 0, 0, 0, 1, 1,
1.835373, -0.8676206, 2.958851, 0, 0, 0, 1, 1,
1.84677, 0.09170512, 0.8786688, 0, 0, 0, 1, 1,
1.857368, -0.8384643, 1.783931, 0, 0, 0, 1, 1,
1.873245, 0.9326473, 2.036813, 0, 0, 0, 1, 1,
1.874717, -0.3640827, 3.033504, 0, 0, 0, 1, 1,
1.887327, -2.390957, 1.695618, 1, 1, 1, 1, 1,
1.895241, -0.7190566, 2.283851, 1, 1, 1, 1, 1,
1.903383, -1.690131, 2.85254, 1, 1, 1, 1, 1,
1.968917, 0.6515988, 1.463981, 1, 1, 1, 1, 1,
1.978888, -0.872548, 3.935533, 1, 1, 1, 1, 1,
1.980502, -0.5783061, 2.018794, 1, 1, 1, 1, 1,
1.986444, 0.8063334, 0.236775, 1, 1, 1, 1, 1,
2.023555, 0.02074788, 2.278488, 1, 1, 1, 1, 1,
2.025138, -0.5508983, 0.856353, 1, 1, 1, 1, 1,
2.048391, 0.3274532, 1.941134, 1, 1, 1, 1, 1,
2.060682, 1.443506, 1.66003, 1, 1, 1, 1, 1,
2.067654, 1.494432, 2.608319, 1, 1, 1, 1, 1,
2.071323, -0.5499225, 1.090855, 1, 1, 1, 1, 1,
2.09174, -0.7145146, 2.357071, 1, 1, 1, 1, 1,
2.114114, -1.4063, 2.732509, 1, 1, 1, 1, 1,
2.116576, 0.003851318, 1.264901, 0, 0, 1, 1, 1,
2.120559, 1.804636, 1.630025, 1, 0, 0, 1, 1,
2.12474, 0.1398132, 1.460501, 1, 0, 0, 1, 1,
2.143243, -0.8168343, 1.721146, 1, 0, 0, 1, 1,
2.187396, 0.1962743, 1.409621, 1, 0, 0, 1, 1,
2.1981, 0.3878472, 1.407499, 1, 0, 0, 1, 1,
2.209945, -0.4094071, 2.348601, 0, 0, 0, 1, 1,
2.227301, 0.08525444, 3.010956, 0, 0, 0, 1, 1,
2.238204, 0.7727177, -1.721125, 0, 0, 0, 1, 1,
2.325709, -1.536528, 3.538476, 0, 0, 0, 1, 1,
2.451975, -1.124352, 1.720136, 0, 0, 0, 1, 1,
2.565335, -1.206298, 2.244503, 0, 0, 0, 1, 1,
2.614738, 1.254524, 3.466799, 0, 0, 0, 1, 1,
2.627627, 0.03127496, 2.332973, 1, 1, 1, 1, 1,
2.630799, 2.909612, -0.1756515, 1, 1, 1, 1, 1,
2.631643, 0.3262283, 1.261223, 1, 1, 1, 1, 1,
2.65899, -0.9013639, 1.456816, 1, 1, 1, 1, 1,
2.663513, -0.8926712, 1.761615, 1, 1, 1, 1, 1,
2.755448, -0.270098, 1.178147, 1, 1, 1, 1, 1,
2.999953, -0.6421785, 2.462711, 1, 1, 1, 1, 1
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
var radius = 10.08704;
var distance = 35.43031;
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
mvMatrix.translate( 0.1190574, 0.3412379, -0.1991065 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.43031);
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
