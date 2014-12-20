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
-2.854749, -1.088063, -2.182348, 1, 0, 0, 1,
-2.79465, -0.9832562, -1.868196, 1, 0.007843138, 0, 1,
-2.725944, -0.4040824, -1.642736, 1, 0.01176471, 0, 1,
-2.627189, 0.3515141, 1.579249, 1, 0.01960784, 0, 1,
-2.534801, -1.833309, -2.469599, 1, 0.02352941, 0, 1,
-2.528715, 0.4049806, -1.605455, 1, 0.03137255, 0, 1,
-2.51553, -0.4574844, -1.018347, 1, 0.03529412, 0, 1,
-2.412794, -1.874691, -3.188112, 1, 0.04313726, 0, 1,
-2.411565, 2.11416, -1.327629, 1, 0.04705882, 0, 1,
-2.399001, 0.01508581, -2.440783, 1, 0.05490196, 0, 1,
-2.394976, -0.4182351, -1.501598, 1, 0.05882353, 0, 1,
-2.379582, 0.1636398, -1.01394, 1, 0.06666667, 0, 1,
-2.371747, -1.430353, -2.594682, 1, 0.07058824, 0, 1,
-2.348454, -0.4486996, -1.860648, 1, 0.07843138, 0, 1,
-2.337816, -0.2169554, -1.611617, 1, 0.08235294, 0, 1,
-2.180547, -0.2200499, -3.060497, 1, 0.09019608, 0, 1,
-2.169719, -0.7158156, -2.542443, 1, 0.09411765, 0, 1,
-2.164968, -1.522144, -1.996942, 1, 0.1019608, 0, 1,
-2.133588, 0.114772, -3.249977, 1, 0.1098039, 0, 1,
-2.133574, -0.6356798, -1.407251, 1, 0.1137255, 0, 1,
-2.114276, 0.3979378, 0.2618718, 1, 0.1215686, 0, 1,
-2.092795, 1.475021, -0.6076211, 1, 0.1254902, 0, 1,
-2.048736, -1.824889, -2.579406, 1, 0.1333333, 0, 1,
-2.046716, 0.9867327, -0.02781272, 1, 0.1372549, 0, 1,
-2.021527, -0.3766046, -0.3579319, 1, 0.145098, 0, 1,
-1.945157, 0.7717998, -3.097224, 1, 0.1490196, 0, 1,
-1.924447, 0.3491221, -1.535177, 1, 0.1568628, 0, 1,
-1.921184, 0.6929802, -1.899413, 1, 0.1607843, 0, 1,
-1.901028, 1.019017, -1.555652, 1, 0.1686275, 0, 1,
-1.884899, 0.3108474, -0.2297564, 1, 0.172549, 0, 1,
-1.869905, 0.6408142, -1.125851, 1, 0.1803922, 0, 1,
-1.854316, -0.486763, -3.034801, 1, 0.1843137, 0, 1,
-1.849927, 0.2778732, -1.008612, 1, 0.1921569, 0, 1,
-1.820364, -0.498808, -3.23418, 1, 0.1960784, 0, 1,
-1.814621, -0.7276142, -1.577924, 1, 0.2039216, 0, 1,
-1.794638, -0.8666478, -3.119733, 1, 0.2117647, 0, 1,
-1.788235, 0.9360088, -1.038815, 1, 0.2156863, 0, 1,
-1.782056, -0.6929302, -3.496886, 1, 0.2235294, 0, 1,
-1.781769, -0.799188, -2.597307, 1, 0.227451, 0, 1,
-1.762416, 0.2754711, -0.4824656, 1, 0.2352941, 0, 1,
-1.762241, 0.1177006, -0.6428995, 1, 0.2392157, 0, 1,
-1.752228, -0.501087, -2.101668, 1, 0.2470588, 0, 1,
-1.751922, 1.772464, 1.315047, 1, 0.2509804, 0, 1,
-1.737948, -0.2648401, -1.218853, 1, 0.2588235, 0, 1,
-1.731463, -2.103353, -1.762301, 1, 0.2627451, 0, 1,
-1.729311, 0.1347002, -0.4655025, 1, 0.2705882, 0, 1,
-1.719214, 0.2982937, -0.9116157, 1, 0.2745098, 0, 1,
-1.688808, -0.8321666, -0.8705267, 1, 0.282353, 0, 1,
-1.679058, -1.229484, -1.946968, 1, 0.2862745, 0, 1,
-1.665438, -0.6182256, -2.05515, 1, 0.2941177, 0, 1,
-1.659266, 0.4712188, -1.696398, 1, 0.3019608, 0, 1,
-1.655842, -0.771816, -0.8729221, 1, 0.3058824, 0, 1,
-1.650436, 2.525664, 0.1282389, 1, 0.3137255, 0, 1,
-1.644611, -0.8180455, -1.308488, 1, 0.3176471, 0, 1,
-1.62775, 1.804528, -0.5502664, 1, 0.3254902, 0, 1,
-1.627485, 0.5204733, -1.884231, 1, 0.3294118, 0, 1,
-1.618035, -1.162375, -2.522799, 1, 0.3372549, 0, 1,
-1.604816, -0.4163307, -2.174523, 1, 0.3411765, 0, 1,
-1.602071, 0.3793329, -1.783712, 1, 0.3490196, 0, 1,
-1.582086, -0.1992276, -1.271589, 1, 0.3529412, 0, 1,
-1.577757, -1.044952, -2.152836, 1, 0.3607843, 0, 1,
-1.571177, -0.8057236, -3.2766, 1, 0.3647059, 0, 1,
-1.559576, 0.9760264, -3.466134, 1, 0.372549, 0, 1,
-1.556998, 0.3784577, -1.378743, 1, 0.3764706, 0, 1,
-1.543024, -0.6708145, -0.8757821, 1, 0.3843137, 0, 1,
-1.524161, 1.873521, -0.1134608, 1, 0.3882353, 0, 1,
-1.509884, 0.7925918, -1.902007, 1, 0.3960784, 0, 1,
-1.484913, 1.170695, -0.898452, 1, 0.4039216, 0, 1,
-1.475374, -0.007130679, -0.3951342, 1, 0.4078431, 0, 1,
-1.461855, -1.099287, -1.813155, 1, 0.4156863, 0, 1,
-1.454227, 0.02353532, -0.6299896, 1, 0.4196078, 0, 1,
-1.452367, -0.5475468, -3.090736, 1, 0.427451, 0, 1,
-1.447943, -0.8820799, -1.088614, 1, 0.4313726, 0, 1,
-1.446741, -1.488117, -2.951495, 1, 0.4392157, 0, 1,
-1.421923, -0.6057673, -1.761644, 1, 0.4431373, 0, 1,
-1.419296, -1.941234, -2.556573, 1, 0.4509804, 0, 1,
-1.417814, -0.2417385, -1.736236, 1, 0.454902, 0, 1,
-1.413799, -0.5352864, -0.4455932, 1, 0.4627451, 0, 1,
-1.4125, 0.9566569, -1.230627, 1, 0.4666667, 0, 1,
-1.408559, 0.08720442, -2.189221, 1, 0.4745098, 0, 1,
-1.405469, 0.09387417, -2.499421, 1, 0.4784314, 0, 1,
-1.401791, -1.028029, -5.134817, 1, 0.4862745, 0, 1,
-1.397244, -0.5392342, -2.565533, 1, 0.4901961, 0, 1,
-1.379922, -1.68768, -2.583853, 1, 0.4980392, 0, 1,
-1.373262, -0.6066684, -2.734253, 1, 0.5058824, 0, 1,
-1.365022, -1.594198, -1.965406, 1, 0.509804, 0, 1,
-1.36219, -0.2622536, -0.4949375, 1, 0.5176471, 0, 1,
-1.358794, -1.999485, -1.78134, 1, 0.5215687, 0, 1,
-1.354056, -1.068255, -1.000457, 1, 0.5294118, 0, 1,
-1.328495, -0.01846602, -1.303434, 1, 0.5333334, 0, 1,
-1.328006, 1.228231, -0.6425295, 1, 0.5411765, 0, 1,
-1.323007, -0.8628319, -2.966955, 1, 0.5450981, 0, 1,
-1.314338, -0.7754773, -4.58005, 1, 0.5529412, 0, 1,
-1.310064, -0.01934085, -0.2638405, 1, 0.5568628, 0, 1,
-1.30871, 0.4234324, -1.05476, 1, 0.5647059, 0, 1,
-1.307238, -1.200605, -2.863218, 1, 0.5686275, 0, 1,
-1.303111, 1.501643, -0.8981971, 1, 0.5764706, 0, 1,
-1.286484, 0.5946371, -1.689432, 1, 0.5803922, 0, 1,
-1.28556, -1.116904, -2.165757, 1, 0.5882353, 0, 1,
-1.284727, 0.6409237, -1.499871, 1, 0.5921569, 0, 1,
-1.255568, 1.338323, 0.7040516, 1, 0.6, 0, 1,
-1.255128, -1.29509, -3.250375, 1, 0.6078432, 0, 1,
-1.252488, -0.8006601, -1.18856, 1, 0.6117647, 0, 1,
-1.249788, 1.2834, -1.574606, 1, 0.6196079, 0, 1,
-1.241647, -0.8143387, -2.389377, 1, 0.6235294, 0, 1,
-1.235278, 0.4349762, -2.218387, 1, 0.6313726, 0, 1,
-1.232832, 0.5485262, -1.487717, 1, 0.6352941, 0, 1,
-1.232747, -1.127044, -2.114389, 1, 0.6431373, 0, 1,
-1.232558, 1.427012, -1.553799, 1, 0.6470588, 0, 1,
-1.23101, -1.959211, -2.917841, 1, 0.654902, 0, 1,
-1.230354, -1.278509, -3.094164, 1, 0.6588235, 0, 1,
-1.229033, -1.127244, -3.009604, 1, 0.6666667, 0, 1,
-1.227859, -0.4418461, -2.53033, 1, 0.6705883, 0, 1,
-1.222756, -1.383765, -1.104918, 1, 0.6784314, 0, 1,
-1.222185, 2.392774, 0.4179007, 1, 0.682353, 0, 1,
-1.219737, 0.436081, -1.250208, 1, 0.6901961, 0, 1,
-1.218172, 1.578918, -1.171571, 1, 0.6941177, 0, 1,
-1.214959, -0.517967, -3.024783, 1, 0.7019608, 0, 1,
-1.212359, -0.4379543, -2.252296, 1, 0.7098039, 0, 1,
-1.208839, -0.5598745, -1.430634, 1, 0.7137255, 0, 1,
-1.207854, 1.825203, -0.8588767, 1, 0.7215686, 0, 1,
-1.20013, -1.507092, -3.238302, 1, 0.7254902, 0, 1,
-1.19696, 1.684538, -1.724837, 1, 0.7333333, 0, 1,
-1.191873, 0.112013, -3.868542, 1, 0.7372549, 0, 1,
-1.190639, -1.66137, -1.637906, 1, 0.7450981, 0, 1,
-1.190102, -0.8115773, -3.199944, 1, 0.7490196, 0, 1,
-1.186608, -0.9301617, -1.241733, 1, 0.7568628, 0, 1,
-1.184758, 0.9909925, -1.390395, 1, 0.7607843, 0, 1,
-1.177919, -1.533699, -2.156446, 1, 0.7686275, 0, 1,
-1.177868, 0.5822934, -0.3565274, 1, 0.772549, 0, 1,
-1.175894, -0.9491453, -2.459348, 1, 0.7803922, 0, 1,
-1.171445, -1.803422, -2.292069, 1, 0.7843137, 0, 1,
-1.165984, 0.9051826, 0.6127965, 1, 0.7921569, 0, 1,
-1.159744, 0.182298, -3.231278, 1, 0.7960784, 0, 1,
-1.15736, 1.341165, -0.2489287, 1, 0.8039216, 0, 1,
-1.156167, 0.1458721, -0.7319955, 1, 0.8117647, 0, 1,
-1.146839, -0.9784222, -3.557959, 1, 0.8156863, 0, 1,
-1.146456, -0.8842883, -2.692331, 1, 0.8235294, 0, 1,
-1.1397, 0.1039462, -2.819486, 1, 0.827451, 0, 1,
-1.138283, -0.3985092, -3.181054, 1, 0.8352941, 0, 1,
-1.136367, 0.09088258, -3.484273, 1, 0.8392157, 0, 1,
-1.132565, -0.2696548, -2.584659, 1, 0.8470588, 0, 1,
-1.123616, 0.02579509, -2.518251, 1, 0.8509804, 0, 1,
-1.122916, 1.1022, -1.477336, 1, 0.8588235, 0, 1,
-1.121329, -0.05876365, -2.348436, 1, 0.8627451, 0, 1,
-1.118744, 1.177882, -2.141136, 1, 0.8705882, 0, 1,
-1.108232, 1.760227, 0.5367723, 1, 0.8745098, 0, 1,
-1.099493, 0.1122889, -1.697712, 1, 0.8823529, 0, 1,
-1.099142, -2.397731, -2.267373, 1, 0.8862745, 0, 1,
-1.068544, 0.6081661, -0.8609983, 1, 0.8941177, 0, 1,
-1.068449, -1.616617, -1.979372, 1, 0.8980392, 0, 1,
-1.048584, 0.5875305, 0.2995896, 1, 0.9058824, 0, 1,
-1.037676, -1.05495, -1.956249, 1, 0.9137255, 0, 1,
-1.035336, 0.549777, -0.4150611, 1, 0.9176471, 0, 1,
-1.032855, -1.083023, -1.992867, 1, 0.9254902, 0, 1,
-1.027385, -1.800904, -2.642779, 1, 0.9294118, 0, 1,
-1.022591, 1.496258, -1.26831, 1, 0.9372549, 0, 1,
-0.9944102, -0.6948926, -2.312394, 1, 0.9411765, 0, 1,
-0.991861, 0.2978159, -1.087408, 1, 0.9490196, 0, 1,
-0.9886499, 0.3135847, -0.7097062, 1, 0.9529412, 0, 1,
-0.986172, 1.467324, -0.2384922, 1, 0.9607843, 0, 1,
-0.9810981, 0.1210759, -1.417533, 1, 0.9647059, 0, 1,
-0.9758664, -0.2923487, -2.188742, 1, 0.972549, 0, 1,
-0.9717898, 1.123432, -0.6224887, 1, 0.9764706, 0, 1,
-0.970593, -0.1019156, -3.759861, 1, 0.9843137, 0, 1,
-0.9677408, 0.2721434, -0.9102702, 1, 0.9882353, 0, 1,
-0.9570313, 0.3852593, -1.599686, 1, 0.9960784, 0, 1,
-0.950637, 1.331073, 0.225898, 0.9960784, 1, 0, 1,
-0.9489897, -0.08960734, -1.817183, 0.9921569, 1, 0, 1,
-0.9465238, 0.6138338, -0.1016515, 0.9843137, 1, 0, 1,
-0.944699, -0.6934948, -2.443317, 0.9803922, 1, 0, 1,
-0.9443399, -0.8583105, -1.022224, 0.972549, 1, 0, 1,
-0.9419228, -1.486122, -0.9312181, 0.9686275, 1, 0, 1,
-0.9415222, 0.6805791, -0.61731, 0.9607843, 1, 0, 1,
-0.9370434, 0.9003149, 1.050024, 0.9568627, 1, 0, 1,
-0.936857, -1.855874, -3.37365, 0.9490196, 1, 0, 1,
-0.9360836, 0.4839308, -0.0539534, 0.945098, 1, 0, 1,
-0.9344532, -0.7649562, -2.75813, 0.9372549, 1, 0, 1,
-0.9308786, -0.5631036, -0.5849877, 0.9333333, 1, 0, 1,
-0.9275278, 1.722407, -2.68579, 0.9254902, 1, 0, 1,
-0.9253761, -1.02733, 0.1394283, 0.9215686, 1, 0, 1,
-0.915037, -0.272909, -2.575226, 0.9137255, 1, 0, 1,
-0.9145968, -0.2696588, -2.815823, 0.9098039, 1, 0, 1,
-0.9128969, -0.4732756, -2.169689, 0.9019608, 1, 0, 1,
-0.9089097, -1.055553, -3.547057, 0.8941177, 1, 0, 1,
-0.9031297, -1.001058, -3.353489, 0.8901961, 1, 0, 1,
-0.901507, 0.7785851, -0.01996548, 0.8823529, 1, 0, 1,
-0.8910695, -1.348528, -3.671195, 0.8784314, 1, 0, 1,
-0.8897529, 1.47216, -0.5832514, 0.8705882, 1, 0, 1,
-0.8862444, -1.022377, -2.113491, 0.8666667, 1, 0, 1,
-0.8797355, -1.51935, -2.803607, 0.8588235, 1, 0, 1,
-0.8786407, -0.1592195, -0.6970246, 0.854902, 1, 0, 1,
-0.8778588, 1.377912, -0.5910228, 0.8470588, 1, 0, 1,
-0.877328, 0.372362, 0.5238438, 0.8431373, 1, 0, 1,
-0.8722513, 0.6401972, -0.6922033, 0.8352941, 1, 0, 1,
-0.8719519, 1.658943, -2.412175, 0.8313726, 1, 0, 1,
-0.8648667, 0.04641975, -2.371753, 0.8235294, 1, 0, 1,
-0.8554537, -0.7561181, -1.918562, 0.8196079, 1, 0, 1,
-0.8543239, 0.5213415, -0.9808372, 0.8117647, 1, 0, 1,
-0.8500131, 0.5157755, -1.391084, 0.8078431, 1, 0, 1,
-0.8482565, -0.6339371, -1.56003, 0.8, 1, 0, 1,
-0.8430325, 1.471192, -0.07134688, 0.7921569, 1, 0, 1,
-0.8360932, -2.570283, -2.356821, 0.7882353, 1, 0, 1,
-0.8336729, 1.373103, -0.9291028, 0.7803922, 1, 0, 1,
-0.829042, 0.02771007, -1.776763, 0.7764706, 1, 0, 1,
-0.8288835, 1.39765, -0.2523915, 0.7686275, 1, 0, 1,
-0.8247292, -0.5293781, -3.007015, 0.7647059, 1, 0, 1,
-0.8178124, -0.5626081, -0.1339126, 0.7568628, 1, 0, 1,
-0.8113049, -0.3652402, -2.907269, 0.7529412, 1, 0, 1,
-0.8071361, 0.500515, -1.409529, 0.7450981, 1, 0, 1,
-0.8049099, -0.04272409, -1.07721, 0.7411765, 1, 0, 1,
-0.7996321, 1.172896, -0.1160354, 0.7333333, 1, 0, 1,
-0.7994731, 0.8009118, 0.1863504, 0.7294118, 1, 0, 1,
-0.7970317, 1.112402, -0.5720168, 0.7215686, 1, 0, 1,
-0.7908069, 0.2463393, -1.017088, 0.7176471, 1, 0, 1,
-0.7889021, 1.214579, -0.05813049, 0.7098039, 1, 0, 1,
-0.7859842, 1.546787, -2.206064, 0.7058824, 1, 0, 1,
-0.7858441, -1.440165, -4.682572, 0.6980392, 1, 0, 1,
-0.7791467, -0.5802115, -2.422309, 0.6901961, 1, 0, 1,
-0.772733, 0.9480506, 1.08338, 0.6862745, 1, 0, 1,
-0.7703835, 1.063494, -1.523893, 0.6784314, 1, 0, 1,
-0.7702736, -0.2931558, -1.532784, 0.6745098, 1, 0, 1,
-0.7691052, 0.1492682, -0.8012809, 0.6666667, 1, 0, 1,
-0.7603235, -0.6113538, -0.9035499, 0.6627451, 1, 0, 1,
-0.7595236, 0.6740384, 0.9172855, 0.654902, 1, 0, 1,
-0.74793, 0.4040711, -1.200426, 0.6509804, 1, 0, 1,
-0.7424565, 0.6648891, -1.122608, 0.6431373, 1, 0, 1,
-0.7409756, 0.6515052, -1.342088, 0.6392157, 1, 0, 1,
-0.739895, 1.678404, -0.1454299, 0.6313726, 1, 0, 1,
-0.7370982, 1.659565, -0.8838688, 0.627451, 1, 0, 1,
-0.7322022, 1.388361, -0.9402934, 0.6196079, 1, 0, 1,
-0.7288694, 0.581808, -0.7350255, 0.6156863, 1, 0, 1,
-0.7285815, -0.525875, -4.22195, 0.6078432, 1, 0, 1,
-0.719206, -0.1338534, -2.270374, 0.6039216, 1, 0, 1,
-0.7141404, -0.5205512, -1.390265, 0.5960785, 1, 0, 1,
-0.7056748, -0.06901461, -0.03383195, 0.5882353, 1, 0, 1,
-0.7023478, 0.1883036, -2.179793, 0.5843138, 1, 0, 1,
-0.6994552, 1.47268, -1.554698, 0.5764706, 1, 0, 1,
-0.6988651, 0.07203259, -1.870731, 0.572549, 1, 0, 1,
-0.6967604, 0.9324301, -1.324373, 0.5647059, 1, 0, 1,
-0.696515, 0.3286071, -0.979107, 0.5607843, 1, 0, 1,
-0.6925733, -0.5239854, -2.298463, 0.5529412, 1, 0, 1,
-0.6888617, 0.6571211, -0.2497628, 0.5490196, 1, 0, 1,
-0.6815207, 2.219855, -2.022293, 0.5411765, 1, 0, 1,
-0.6794905, 2.930958, -1.550533, 0.5372549, 1, 0, 1,
-0.6781893, 0.06300861, -1.318974, 0.5294118, 1, 0, 1,
-0.6771169, 0.4906255, -2.17142, 0.5254902, 1, 0, 1,
-0.6742806, 0.4745235, -0.2626063, 0.5176471, 1, 0, 1,
-0.6721673, -1.054769, -2.461625, 0.5137255, 1, 0, 1,
-0.6652333, 0.4481303, -0.2476915, 0.5058824, 1, 0, 1,
-0.6616733, -1.016182, -1.688974, 0.5019608, 1, 0, 1,
-0.6555694, 0.4317203, 0.2766653, 0.4941176, 1, 0, 1,
-0.6549219, 0.1443712, -2.205036, 0.4862745, 1, 0, 1,
-0.654824, -0.8117977, -3.546973, 0.4823529, 1, 0, 1,
-0.6532864, -0.3005356, -1.998233, 0.4745098, 1, 0, 1,
-0.6531315, -0.3831283, -1.725187, 0.4705882, 1, 0, 1,
-0.651123, 0.06557066, -1.447529, 0.4627451, 1, 0, 1,
-0.6480358, 0.2814291, -0.2169859, 0.4588235, 1, 0, 1,
-0.6470143, 0.3976908, -1.63219, 0.4509804, 1, 0, 1,
-0.644972, 1.170551, -0.3281959, 0.4470588, 1, 0, 1,
-0.642994, -0.8509909, -0.7907288, 0.4392157, 1, 0, 1,
-0.6305635, -1.250398, -3.426638, 0.4352941, 1, 0, 1,
-0.6294025, 1.850259, -0.2868832, 0.427451, 1, 0, 1,
-0.6239572, 1.238487, 0.5275196, 0.4235294, 1, 0, 1,
-0.6187947, 1.376091, -0.9407265, 0.4156863, 1, 0, 1,
-0.6184569, -0.5573079, -2.90496, 0.4117647, 1, 0, 1,
-0.6160434, 0.8475721, -0.7761579, 0.4039216, 1, 0, 1,
-0.6141578, -1.000409, -3.11688, 0.3960784, 1, 0, 1,
-0.6131113, -2.516434, -2.572639, 0.3921569, 1, 0, 1,
-0.6111796, 0.1273043, -2.371096, 0.3843137, 1, 0, 1,
-0.6091634, -1.640955, -3.300492, 0.3803922, 1, 0, 1,
-0.6072195, 0.5571272, -0.7683299, 0.372549, 1, 0, 1,
-0.6044669, -0.8138876, -3.135526, 0.3686275, 1, 0, 1,
-0.5931659, 1.72034, -1.659618, 0.3607843, 1, 0, 1,
-0.5922219, 0.4135055, -2.136931, 0.3568628, 1, 0, 1,
-0.5781692, -0.2230505, -0.9987999, 0.3490196, 1, 0, 1,
-0.5775015, -0.5193174, -1.572163, 0.345098, 1, 0, 1,
-0.5695117, -0.4520647, -1.846447, 0.3372549, 1, 0, 1,
-0.5666769, 1.248175, -1.107126, 0.3333333, 1, 0, 1,
-0.5657513, 0.2494462, -2.10642, 0.3254902, 1, 0, 1,
-0.5617337, -1.589935, -2.766745, 0.3215686, 1, 0, 1,
-0.560209, -1.80313, -1.913421, 0.3137255, 1, 0, 1,
-0.557908, 0.3368595, 0.06140884, 0.3098039, 1, 0, 1,
-0.5532353, 0.5083017, -0.6073752, 0.3019608, 1, 0, 1,
-0.5474731, 0.08096636, -1.686406, 0.2941177, 1, 0, 1,
-0.5461386, -0.5087752, -0.09643517, 0.2901961, 1, 0, 1,
-0.544802, -0.5703218, -1.838533, 0.282353, 1, 0, 1,
-0.5439758, 0.7060189, -0.1967249, 0.2784314, 1, 0, 1,
-0.5366176, 1.90256, -1.961245, 0.2705882, 1, 0, 1,
-0.5355758, 0.9638359, -1.60783, 0.2666667, 1, 0, 1,
-0.5353709, -2.167498, -4.071341, 0.2588235, 1, 0, 1,
-0.530457, -1.570464, -3.043398, 0.254902, 1, 0, 1,
-0.5289617, 0.980758, -1.568238, 0.2470588, 1, 0, 1,
-0.5277087, -0.3737424, -1.090914, 0.2431373, 1, 0, 1,
-0.5256807, -2.695011, -6.08225, 0.2352941, 1, 0, 1,
-0.519594, 0.7322826, 1.141109, 0.2313726, 1, 0, 1,
-0.5129506, 0.9534643, -0.6796085, 0.2235294, 1, 0, 1,
-0.4998572, 1.893853, -0.4081216, 0.2196078, 1, 0, 1,
-0.4996571, -0.1482123, -2.611143, 0.2117647, 1, 0, 1,
-0.4943545, 0.1177452, -0.8917296, 0.2078431, 1, 0, 1,
-0.4935147, -0.3192854, -1.813381, 0.2, 1, 0, 1,
-0.4895245, -0.03980663, -1.555843, 0.1921569, 1, 0, 1,
-0.4857738, 1.376477, -0.7154831, 0.1882353, 1, 0, 1,
-0.4785588, 0.6096197, -0.3735516, 0.1803922, 1, 0, 1,
-0.4760588, 0.1333017, -1.786757, 0.1764706, 1, 0, 1,
-0.475809, 0.4105702, -0.166122, 0.1686275, 1, 0, 1,
-0.4746425, 1.140456, 0.1022159, 0.1647059, 1, 0, 1,
-0.473432, -0.7488629, -4.216012, 0.1568628, 1, 0, 1,
-0.4702752, -0.06169941, -2.799235, 0.1529412, 1, 0, 1,
-0.4664564, 0.9811287, -0.4480133, 0.145098, 1, 0, 1,
-0.4610001, -0.08104203, -2.068129, 0.1411765, 1, 0, 1,
-0.4590023, 1.073014, -0.8855362, 0.1333333, 1, 0, 1,
-0.4573307, -0.4406732, -2.037539, 0.1294118, 1, 0, 1,
-0.4557362, -0.4944208, -3.887828, 0.1215686, 1, 0, 1,
-0.4544212, 0.8799189, -1.750998, 0.1176471, 1, 0, 1,
-0.4506254, 0.4224306, 0.5016856, 0.1098039, 1, 0, 1,
-0.444296, -1.631877, -4.20592, 0.1058824, 1, 0, 1,
-0.4416474, -1.760323, -1.125185, 0.09803922, 1, 0, 1,
-0.4373786, -0.822458, -4.149951, 0.09019608, 1, 0, 1,
-0.4355762, -0.8066586, -1.415392, 0.08627451, 1, 0, 1,
-0.4351149, -1.199018, -2.841819, 0.07843138, 1, 0, 1,
-0.4305605, 0.9591408, 0.06522581, 0.07450981, 1, 0, 1,
-0.4286067, -0.7908025, -1.843722, 0.06666667, 1, 0, 1,
-0.4249686, -0.6247559, -1.212096, 0.0627451, 1, 0, 1,
-0.4197217, -0.2103754, -1.885745, 0.05490196, 1, 0, 1,
-0.4185017, 1.938051, 0.03618601, 0.05098039, 1, 0, 1,
-0.4183446, 2.489883, 0.5971627, 0.04313726, 1, 0, 1,
-0.4167065, 0.8010276, -1.425527, 0.03921569, 1, 0, 1,
-0.4135823, -1.928062, -1.119446, 0.03137255, 1, 0, 1,
-0.4119608, -0.2382378, -1.21332, 0.02745098, 1, 0, 1,
-0.4090315, -1.937803, 0.3615223, 0.01960784, 1, 0, 1,
-0.4071328, -1.077565, -4.046686, 0.01568628, 1, 0, 1,
-0.4061692, 0.2232181, -1.340925, 0.007843138, 1, 0, 1,
-0.3962797, -1.036439, -4.854122, 0.003921569, 1, 0, 1,
-0.3923874, 0.2756038, -0.5239362, 0, 1, 0.003921569, 1,
-0.3883369, 0.3069769, -1.966369, 0, 1, 0.01176471, 1,
-0.3877687, -0.1643295, -2.738758, 0, 1, 0.01568628, 1,
-0.3874714, 0.1960735, -2.296676, 0, 1, 0.02352941, 1,
-0.3853627, 2.479035, 1.144618, 0, 1, 0.02745098, 1,
-0.3822989, -0.1361513, -0.7920366, 0, 1, 0.03529412, 1,
-0.3799722, -0.4048769, -2.671429, 0, 1, 0.03921569, 1,
-0.378827, 0.3825974, -2.339569, 0, 1, 0.04705882, 1,
-0.3782677, 0.4300111, -1.149667, 0, 1, 0.05098039, 1,
-0.3715121, -1.605466, -4.081057, 0, 1, 0.05882353, 1,
-0.3652307, -1.045478, -1.483572, 0, 1, 0.0627451, 1,
-0.3597869, -1.021663, -3.538991, 0, 1, 0.07058824, 1,
-0.3576127, 0.1466719, -0.4954391, 0, 1, 0.07450981, 1,
-0.3539664, -1.26585, -1.799889, 0, 1, 0.08235294, 1,
-0.3526634, 0.7503164, -0.7440991, 0, 1, 0.08627451, 1,
-0.3515839, -0.1887048, -1.727784, 0, 1, 0.09411765, 1,
-0.3507216, 1.412087, 0.06405053, 0, 1, 0.1019608, 1,
-0.3493158, 0.8211951, -2.854175, 0, 1, 0.1058824, 1,
-0.3435661, 0.8696748, -0.8181499, 0, 1, 0.1137255, 1,
-0.3389133, 0.5346888, -0.5316278, 0, 1, 0.1176471, 1,
-0.338133, 1.528503, -0.1154233, 0, 1, 0.1254902, 1,
-0.333481, -0.5891001, -2.77086, 0, 1, 0.1294118, 1,
-0.3302908, 0.6795793, -0.7553084, 0, 1, 0.1372549, 1,
-0.3254916, 0.4780386, 0.5818046, 0, 1, 0.1411765, 1,
-0.3253714, 0.3640157, -0.6514738, 0, 1, 0.1490196, 1,
-0.3250978, 1.849382, -0.8138188, 0, 1, 0.1529412, 1,
-0.3238842, -1.709609, -2.41161, 0, 1, 0.1607843, 1,
-0.320497, -0.3635142, -3.251778, 0, 1, 0.1647059, 1,
-0.3200342, 0.8176414, -1.172957, 0, 1, 0.172549, 1,
-0.3172143, 2.189946, -0.9153123, 0, 1, 0.1764706, 1,
-0.3149877, -1.912025, -3.829763, 0, 1, 0.1843137, 1,
-0.3113838, -2.115989, -3.290925, 0, 1, 0.1882353, 1,
-0.3094393, -0.614976, -3.25336, 0, 1, 0.1960784, 1,
-0.3065472, 0.5645986, -1.11468, 0, 1, 0.2039216, 1,
-0.3060032, -0.9122531, -4.209373, 0, 1, 0.2078431, 1,
-0.3049198, 2.010798, -0.2515426, 0, 1, 0.2156863, 1,
-0.3037074, 1.449874, -1.324692, 0, 1, 0.2196078, 1,
-0.3014345, -0.2891871, -1.152595, 0, 1, 0.227451, 1,
-0.301077, -0.3600499, -2.605642, 0, 1, 0.2313726, 1,
-0.3005474, -0.7379228, -3.162214, 0, 1, 0.2392157, 1,
-0.2983353, -0.989641, -2.320267, 0, 1, 0.2431373, 1,
-0.2969702, 0.4348369, 0.1032787, 0, 1, 0.2509804, 1,
-0.2923262, 0.1867141, -1.986693, 0, 1, 0.254902, 1,
-0.2915646, -1.295891, -1.656011, 0, 1, 0.2627451, 1,
-0.2895038, -0.4345078, -3.173019, 0, 1, 0.2666667, 1,
-0.2884811, -0.1910862, -2.044691, 0, 1, 0.2745098, 1,
-0.2868267, 1.483555, -0.3508196, 0, 1, 0.2784314, 1,
-0.2860515, 0.257599, 0.9376497, 0, 1, 0.2862745, 1,
-0.2848856, -1.464163, -5.523673, 0, 1, 0.2901961, 1,
-0.2829396, -1.179904, -3.164586, 0, 1, 0.2980392, 1,
-0.2818455, -1.138783, -3.771267, 0, 1, 0.3058824, 1,
-0.2747612, 0.7669642, -0.9383394, 0, 1, 0.3098039, 1,
-0.2722196, -0.8298985, -3.952131, 0, 1, 0.3176471, 1,
-0.2715172, -2.323849, -2.832538, 0, 1, 0.3215686, 1,
-0.2702996, 0.5566626, -1.518014, 0, 1, 0.3294118, 1,
-0.2641697, 1.00878, -1.432805, 0, 1, 0.3333333, 1,
-0.2630908, -0.3782091, -2.375671, 0, 1, 0.3411765, 1,
-0.2622394, 0.09891302, -0.6084267, 0, 1, 0.345098, 1,
-0.2621802, 0.1083149, -1.629742, 0, 1, 0.3529412, 1,
-0.2583118, -1.348778, -1.831962, 0, 1, 0.3568628, 1,
-0.2576778, -2.698646, -3.750288, 0, 1, 0.3647059, 1,
-0.2549825, -0.3460491, -1.9109, 0, 1, 0.3686275, 1,
-0.2535935, -0.5392795, -2.63666, 0, 1, 0.3764706, 1,
-0.2525966, -0.8810468, -2.48159, 0, 1, 0.3803922, 1,
-0.2517817, -2.086085, -2.92258, 0, 1, 0.3882353, 1,
-0.2445692, -0.2959545, -3.25152, 0, 1, 0.3921569, 1,
-0.2430162, -0.1505207, -2.688319, 0, 1, 0.4, 1,
-0.2343585, 0.1872675, -1.449814, 0, 1, 0.4078431, 1,
-0.2339336, 1.185274, 0.699049, 0, 1, 0.4117647, 1,
-0.2333965, -0.5930049, -3.237566, 0, 1, 0.4196078, 1,
-0.2318562, 0.639318, -0.5890822, 0, 1, 0.4235294, 1,
-0.231232, -0.3299663, -1.90789, 0, 1, 0.4313726, 1,
-0.2310028, 1.652818, 1.470294, 0, 1, 0.4352941, 1,
-0.2261269, 0.5752142, -1.207961, 0, 1, 0.4431373, 1,
-0.2252015, 0.1318268, 1.229585, 0, 1, 0.4470588, 1,
-0.2217612, -1.421111, -2.938011, 0, 1, 0.454902, 1,
-0.2200452, 2.646955, -0.2331156, 0, 1, 0.4588235, 1,
-0.2191861, -0.1480505, -0.5933307, 0, 1, 0.4666667, 1,
-0.2150356, 2.203959, -2.682725, 0, 1, 0.4705882, 1,
-0.2142628, 0.01443025, -1.128305, 0, 1, 0.4784314, 1,
-0.2114846, -0.5355459, -1.50106, 0, 1, 0.4823529, 1,
-0.2102522, 1.025549, -0.5670133, 0, 1, 0.4901961, 1,
-0.205142, 0.6068378, 1.348484, 0, 1, 0.4941176, 1,
-0.2006385, -0.09779304, -2.054692, 0, 1, 0.5019608, 1,
-0.1976847, 0.1057501, -1.707925, 0, 1, 0.509804, 1,
-0.1950782, -0.008650378, -0.607531, 0, 1, 0.5137255, 1,
-0.1948217, -0.3861076, -0.1563806, 0, 1, 0.5215687, 1,
-0.1942311, -0.584292, -1.792442, 0, 1, 0.5254902, 1,
-0.1890987, 1.494809, -1.030552, 0, 1, 0.5333334, 1,
-0.1868705, 0.1314497, -1.563748, 0, 1, 0.5372549, 1,
-0.1828498, -0.6900195, -2.036351, 0, 1, 0.5450981, 1,
-0.1814584, 0.4553897, -0.9019196, 0, 1, 0.5490196, 1,
-0.1809436, 1.359079, 1.450715, 0, 1, 0.5568628, 1,
-0.1767822, 1.747382, -0.7624337, 0, 1, 0.5607843, 1,
-0.1745587, -0.337145, -3.012253, 0, 1, 0.5686275, 1,
-0.1731583, 0.140301, -0.8018571, 0, 1, 0.572549, 1,
-0.1693238, -0.5022698, -3.301208, 0, 1, 0.5803922, 1,
-0.1690348, 0.4411917, -0.7549436, 0, 1, 0.5843138, 1,
-0.1653821, -0.541659, -3.190497, 0, 1, 0.5921569, 1,
-0.1645885, 1.837105, -0.1236893, 0, 1, 0.5960785, 1,
-0.1560771, 0.1705638, -0.5862519, 0, 1, 0.6039216, 1,
-0.1506691, 1.318304, 0.6004816, 0, 1, 0.6117647, 1,
-0.1500058, 0.9134247, -0.6516778, 0, 1, 0.6156863, 1,
-0.1488872, 1.302572, 0.4342746, 0, 1, 0.6235294, 1,
-0.1472563, 1.088246, 0.3708457, 0, 1, 0.627451, 1,
-0.1436993, 0.8454711, 0.09121136, 0, 1, 0.6352941, 1,
-0.1436093, 0.1849871, -1.857524, 0, 1, 0.6392157, 1,
-0.1433464, 0.9209107, -0.5952783, 0, 1, 0.6470588, 1,
-0.1400279, 1.096297, -0.06222714, 0, 1, 0.6509804, 1,
-0.1398569, -1.947498, -2.670022, 0, 1, 0.6588235, 1,
-0.1398353, -0.9486673, -3.820646, 0, 1, 0.6627451, 1,
-0.1361583, 0.4511184, -1.461612, 0, 1, 0.6705883, 1,
-0.1360874, -0.5342796, -2.26462, 0, 1, 0.6745098, 1,
-0.1337602, 0.7884819, -0.5184578, 0, 1, 0.682353, 1,
-0.1321887, -0.8853481, -2.571831, 0, 1, 0.6862745, 1,
-0.1318362, -0.7051612, -2.633019, 0, 1, 0.6941177, 1,
-0.1308726, -1.388561, -2.766484, 0, 1, 0.7019608, 1,
-0.1306365, 1.366022, -1.320814, 0, 1, 0.7058824, 1,
-0.1293904, -0.4270834, -2.605768, 0, 1, 0.7137255, 1,
-0.1280943, -0.594442, -2.413966, 0, 1, 0.7176471, 1,
-0.1262753, 0.8465997, -0.9429862, 0, 1, 0.7254902, 1,
-0.1201995, 1.210575, 1.191743, 0, 1, 0.7294118, 1,
-0.1180783, -0.7175216, -3.791555, 0, 1, 0.7372549, 1,
-0.1137181, -1.733089, -2.487612, 0, 1, 0.7411765, 1,
-0.1133145, -0.05724654, -1.767445, 0, 1, 0.7490196, 1,
-0.1111235, 0.003008108, -1.106574, 0, 1, 0.7529412, 1,
-0.1078105, 0.03417112, -1.45701, 0, 1, 0.7607843, 1,
-0.1034438, 0.7910638, -0.3651961, 0, 1, 0.7647059, 1,
-0.1032729, 0.2962673, -0.7282824, 0, 1, 0.772549, 1,
-0.1031212, -0.6016147, -2.407722, 0, 1, 0.7764706, 1,
-0.09966932, 0.4616349, 1.381912, 0, 1, 0.7843137, 1,
-0.09739296, 0.9319978, 0.1234455, 0, 1, 0.7882353, 1,
-0.09686479, 0.3604888, -1.793439, 0, 1, 0.7960784, 1,
-0.09666314, 0.2370329, -0.5577391, 0, 1, 0.8039216, 1,
-0.09138421, 2.314716, -0.08135699, 0, 1, 0.8078431, 1,
-0.0902935, -0.2833906, -3.269617, 0, 1, 0.8156863, 1,
-0.08988962, -0.2653084, -2.265162, 0, 1, 0.8196079, 1,
-0.08757396, -0.9981527, -3.679264, 0, 1, 0.827451, 1,
-0.08666667, 0.5147275, -0.3656212, 0, 1, 0.8313726, 1,
-0.08513427, 1.224565, 1.36873, 0, 1, 0.8392157, 1,
-0.08188995, -0.2090934, -4.040982, 0, 1, 0.8431373, 1,
-0.08084397, -0.01549573, -2.169881, 0, 1, 0.8509804, 1,
-0.08018283, -0.5659861, -3.199885, 0, 1, 0.854902, 1,
-0.08016591, 0.6704842, -0.5301106, 0, 1, 0.8627451, 1,
-0.07486738, -0.06499223, -2.59885, 0, 1, 0.8666667, 1,
-0.07075566, 0.1753659, 0.1370757, 0, 1, 0.8745098, 1,
-0.0623052, -0.5578567, -1.623661, 0, 1, 0.8784314, 1,
-0.06217241, 0.8846555, -1.131359, 0, 1, 0.8862745, 1,
-0.06068373, -1.849082, -2.655155, 0, 1, 0.8901961, 1,
-0.05655002, 0.2674652, -1.931142, 0, 1, 0.8980392, 1,
-0.052151, 0.8557866, 1.27401, 0, 1, 0.9058824, 1,
-0.05036782, -0.4370231, -1.360265, 0, 1, 0.9098039, 1,
-0.04517249, 0.4758911, 0.4600469, 0, 1, 0.9176471, 1,
-0.04078182, -1.178731, -3.974117, 0, 1, 0.9215686, 1,
-0.037584, -0.4910378, -4.615808, 0, 1, 0.9294118, 1,
-0.03214407, -0.7291259, -3.923689, 0, 1, 0.9333333, 1,
-0.0312898, 1.059761, 0.3782825, 0, 1, 0.9411765, 1,
-0.0291526, 0.6741877, 1.479907, 0, 1, 0.945098, 1,
-0.02911993, -0.07427814, -1.937189, 0, 1, 0.9529412, 1,
-0.02372532, 0.6740679, -0.1853891, 0, 1, 0.9568627, 1,
-0.01803472, -0.7196589, -3.337098, 0, 1, 0.9647059, 1,
-0.01761872, 0.01382631, -0.9431128, 0, 1, 0.9686275, 1,
-0.01466787, 2.175933, 0.8297527, 0, 1, 0.9764706, 1,
-0.01115176, -0.5931678, -3.575479, 0, 1, 0.9803922, 1,
-0.008744303, 0.9431815, -1.575977, 0, 1, 0.9882353, 1,
-0.008154348, 0.8184209, -0.8504452, 0, 1, 0.9921569, 1,
-0.007438423, 0.639102, -0.1480724, 0, 1, 1, 1,
-0.006216549, -0.4199781, -3.403576, 0, 0.9921569, 1, 1,
0.003535218, -0.838987, 4.239244, 0, 0.9882353, 1, 1,
0.005350004, 1.369985, -0.1607308, 0, 0.9803922, 1, 1,
0.006123476, -0.2667183, 2.091574, 0, 0.9764706, 1, 1,
0.007259381, -1.305524, 3.03004, 0, 0.9686275, 1, 1,
0.01129532, -1.158514, 2.729713, 0, 0.9647059, 1, 1,
0.0116367, 3.161941, -0.8036007, 0, 0.9568627, 1, 1,
0.0117854, 0.01983895, 0.7114201, 0, 0.9529412, 1, 1,
0.01418826, -0.2465709, 2.750122, 0, 0.945098, 1, 1,
0.02220702, 2.633662, 0.5275174, 0, 0.9411765, 1, 1,
0.02456801, 1.888109, 1.101539, 0, 0.9333333, 1, 1,
0.02569032, -0.2780488, 3.764081, 0, 0.9294118, 1, 1,
0.02852962, 0.5900283, -0.5206638, 0, 0.9215686, 1, 1,
0.02889249, -0.7185352, 4.287398, 0, 0.9176471, 1, 1,
0.03119809, -0.6301695, 3.529623, 0, 0.9098039, 1, 1,
0.03225156, 0.4403585, -1.309085, 0, 0.9058824, 1, 1,
0.04116357, 1.522585, -0.5679314, 0, 0.8980392, 1, 1,
0.04476197, 1.113587, 2.523103, 0, 0.8901961, 1, 1,
0.04534658, 1.524131, 1.012921, 0, 0.8862745, 1, 1,
0.04726243, 0.8323415, 1.019453, 0, 0.8784314, 1, 1,
0.05326364, 0.3184172, 0.4066235, 0, 0.8745098, 1, 1,
0.05635077, -1.341865, 4.425077, 0, 0.8666667, 1, 1,
0.05886685, -0.2435118, 3.900772, 0, 0.8627451, 1, 1,
0.06260902, -0.2015623, 3.538924, 0, 0.854902, 1, 1,
0.06435031, 1.164959, 0.1066066, 0, 0.8509804, 1, 1,
0.06647459, 0.6241644, -0.1554806, 0, 0.8431373, 1, 1,
0.06896767, -0.2812472, 2.422617, 0, 0.8392157, 1, 1,
0.06962918, -1.75727, 3.179307, 0, 0.8313726, 1, 1,
0.07131136, 0.685903, 0.7427538, 0, 0.827451, 1, 1,
0.07530876, 1.035447, -0.5232334, 0, 0.8196079, 1, 1,
0.08404817, -0.7802987, 3.578335, 0, 0.8156863, 1, 1,
0.085548, 0.7348981, 0.2510651, 0, 0.8078431, 1, 1,
0.08630981, 0.1523125, 1.303762, 0, 0.8039216, 1, 1,
0.08930036, 1.510264, 0.1475518, 0, 0.7960784, 1, 1,
0.0899342, -0.5206014, 3.116654, 0, 0.7882353, 1, 1,
0.09432585, -0.6314542, 1.870128, 0, 0.7843137, 1, 1,
0.09608261, -0.2052034, 3.968344, 0, 0.7764706, 1, 1,
0.09989475, -0.24208, 2.122922, 0, 0.772549, 1, 1,
0.1009416, 0.08315431, 0.1087977, 0, 0.7647059, 1, 1,
0.1063468, 1.863349, -0.5513341, 0, 0.7607843, 1, 1,
0.1071503, 0.02194355, 0.7708481, 0, 0.7529412, 1, 1,
0.1083226, -0.1334771, -0.168499, 0, 0.7490196, 1, 1,
0.1090261, 0.3587553, 0.5835651, 0, 0.7411765, 1, 1,
0.1143957, 0.4294273, 0.2477626, 0, 0.7372549, 1, 1,
0.1202247, -0.199989, 4.255094, 0, 0.7294118, 1, 1,
0.1211374, 0.7494945, 1.004673, 0, 0.7254902, 1, 1,
0.1213752, -1.198765, 2.201936, 0, 0.7176471, 1, 1,
0.1243644, -1.307592, 2.184269, 0, 0.7137255, 1, 1,
0.1273587, 0.01439975, 2.652507, 0, 0.7058824, 1, 1,
0.128514, 1.197426, 1.196687, 0, 0.6980392, 1, 1,
0.1297635, 0.5766039, 0.6209573, 0, 0.6941177, 1, 1,
0.1298944, 1.254423, 0.6488891, 0, 0.6862745, 1, 1,
0.1319837, -0.1533331, 2.192802, 0, 0.682353, 1, 1,
0.1396987, -0.155329, 2.55255, 0, 0.6745098, 1, 1,
0.1397343, 0.1070424, 0.5578971, 0, 0.6705883, 1, 1,
0.1442446, -1.356985, 2.266671, 0, 0.6627451, 1, 1,
0.1458136, 1.658804, -1.362719, 0, 0.6588235, 1, 1,
0.148216, 0.3336947, 0.09334292, 0, 0.6509804, 1, 1,
0.150526, 1.569056, 0.676436, 0, 0.6470588, 1, 1,
0.1521074, 1.674459, 1.688655, 0, 0.6392157, 1, 1,
0.157693, -0.9194768, 2.795318, 0, 0.6352941, 1, 1,
0.1591484, 1.628036, -0.9078822, 0, 0.627451, 1, 1,
0.1602522, -2.06341, 5.021616, 0, 0.6235294, 1, 1,
0.1641018, 1.576291, 0.1991248, 0, 0.6156863, 1, 1,
0.1721446, -0.1413933, 2.989705, 0, 0.6117647, 1, 1,
0.1770157, -0.3585988, 1.91055, 0, 0.6039216, 1, 1,
0.1833466, 0.8097174, 0.1644205, 0, 0.5960785, 1, 1,
0.1844423, -0.1021815, 2.459213, 0, 0.5921569, 1, 1,
0.189266, 0.09510147, 0.9543453, 0, 0.5843138, 1, 1,
0.192867, 0.7586726, -0.04803441, 0, 0.5803922, 1, 1,
0.2029288, -1.143841, 0.5942212, 0, 0.572549, 1, 1,
0.2073866, -1.087645, 3.90847, 0, 0.5686275, 1, 1,
0.2094655, -2.126028, 2.558598, 0, 0.5607843, 1, 1,
0.2101706, 0.02780985, 0.5109588, 0, 0.5568628, 1, 1,
0.2188393, -0.1559272, 3.737766, 0, 0.5490196, 1, 1,
0.2191819, -0.1238874, 2.323576, 0, 0.5450981, 1, 1,
0.2200157, -0.5469868, 3.274435, 0, 0.5372549, 1, 1,
0.2204581, 0.5495209, 0.8834536, 0, 0.5333334, 1, 1,
0.2211057, -0.8593712, 1.72383, 0, 0.5254902, 1, 1,
0.2256442, -1.35112, 3.462203, 0, 0.5215687, 1, 1,
0.2303802, -0.3593129, 2.63167, 0, 0.5137255, 1, 1,
0.231725, -2.121678, 2.785816, 0, 0.509804, 1, 1,
0.2374997, 1.994263, -1.578756, 0, 0.5019608, 1, 1,
0.2419006, -1.864816, 2.707992, 0, 0.4941176, 1, 1,
0.2443323, 0.639768, 1.475794, 0, 0.4901961, 1, 1,
0.2461534, -2.210808, 3.52204, 0, 0.4823529, 1, 1,
0.2505703, 0.9977523, 1.28441, 0, 0.4784314, 1, 1,
0.2570777, 1.306745, -1.341075, 0, 0.4705882, 1, 1,
0.2583346, -0.2415202, 1.493369, 0, 0.4666667, 1, 1,
0.2588843, 0.1668304, 0.593692, 0, 0.4588235, 1, 1,
0.2596596, 1.52474, -1.671371, 0, 0.454902, 1, 1,
0.2616, -0.01130495, -0.8070184, 0, 0.4470588, 1, 1,
0.264273, -0.07108782, 2.776039, 0, 0.4431373, 1, 1,
0.2651455, 1.174946, 1.407981, 0, 0.4352941, 1, 1,
0.2673812, -0.3732134, 4.704008, 0, 0.4313726, 1, 1,
0.2678234, -0.4975538, 2.581791, 0, 0.4235294, 1, 1,
0.2682128, 0.3397727, 0.8692976, 0, 0.4196078, 1, 1,
0.2687305, -0.5556994, 1.803957, 0, 0.4117647, 1, 1,
0.269249, -0.5155807, 1.438147, 0, 0.4078431, 1, 1,
0.269774, -2.339698, 2.442346, 0, 0.4, 1, 1,
0.2746516, -2.212906, 2.857871, 0, 0.3921569, 1, 1,
0.2783677, 1.093826, 0.8846086, 0, 0.3882353, 1, 1,
0.2801482, -0.08681652, 2.21423, 0, 0.3803922, 1, 1,
0.2879578, -1.977636, 0.9462208, 0, 0.3764706, 1, 1,
0.2915224, -1.495965, 1.862863, 0, 0.3686275, 1, 1,
0.2921203, 1.273446, -1.427489, 0, 0.3647059, 1, 1,
0.2921446, 0.8283911, 0.9159436, 0, 0.3568628, 1, 1,
0.2938903, 0.9939569, 1.031258, 0, 0.3529412, 1, 1,
0.2940247, 0.6640484, -0.3972668, 0, 0.345098, 1, 1,
0.2997259, -1.056869, 3.172039, 0, 0.3411765, 1, 1,
0.3028514, 1.872145, 0.0976379, 0, 0.3333333, 1, 1,
0.3047462, -0.2793657, 1.940263, 0, 0.3294118, 1, 1,
0.3146208, 1.65182, 1.403849, 0, 0.3215686, 1, 1,
0.3191505, -0.7381774, 3.917531, 0, 0.3176471, 1, 1,
0.3210032, 1.946107, 0.2732311, 0, 0.3098039, 1, 1,
0.321878, -0.6258816, 2.353249, 0, 0.3058824, 1, 1,
0.325496, 1.854265, -0.6508327, 0, 0.2980392, 1, 1,
0.3269074, 2.487464, 0.8909261, 0, 0.2901961, 1, 1,
0.3281742, 1.685869, -0.4101752, 0, 0.2862745, 1, 1,
0.32932, -0.4372023, 2.730595, 0, 0.2784314, 1, 1,
0.3319926, -0.8688288, 2.466034, 0, 0.2745098, 1, 1,
0.337789, -1.633583, 3.656119, 0, 0.2666667, 1, 1,
0.3430506, 0.09593146, 0.7084245, 0, 0.2627451, 1, 1,
0.3434463, 0.5615383, 0.1587388, 0, 0.254902, 1, 1,
0.3442466, -1.005557, 3.458758, 0, 0.2509804, 1, 1,
0.3457635, -0.04808465, 2.210268, 0, 0.2431373, 1, 1,
0.3487262, 1.341163, -0.3493288, 0, 0.2392157, 1, 1,
0.3542826, -0.3195662, 3.38148, 0, 0.2313726, 1, 1,
0.3673178, -0.5964509, 2.516211, 0, 0.227451, 1, 1,
0.3730664, -1.646894, 2.250821, 0, 0.2196078, 1, 1,
0.3755832, 1.045515, 1.83451, 0, 0.2156863, 1, 1,
0.3765293, 1.323911, 0.5029103, 0, 0.2078431, 1, 1,
0.3787026, -0.1003502, 1.050091, 0, 0.2039216, 1, 1,
0.3791805, -0.6920623, 0.7532201, 0, 0.1960784, 1, 1,
0.3826731, -0.5543199, 4.103885, 0, 0.1882353, 1, 1,
0.3833323, 0.9942624, 0.03858369, 0, 0.1843137, 1, 1,
0.3896804, -0.8657218, 3.694222, 0, 0.1764706, 1, 1,
0.3939991, -0.7050482, 2.511907, 0, 0.172549, 1, 1,
0.3948924, 1.145906, 0.3585973, 0, 0.1647059, 1, 1,
0.395944, 0.6623556, 0.5730059, 0, 0.1607843, 1, 1,
0.401757, 0.2194524, 0.6443, 0, 0.1529412, 1, 1,
0.4045541, -0.5156845, 1.595385, 0, 0.1490196, 1, 1,
0.4073461, 0.8943769, 0.4744142, 0, 0.1411765, 1, 1,
0.4107566, -0.7968256, 3.539349, 0, 0.1372549, 1, 1,
0.4158695, -0.2855511, 3.304282, 0, 0.1294118, 1, 1,
0.419032, -0.2556652, 1.792642, 0, 0.1254902, 1, 1,
0.4202908, 0.05825502, 0.9724266, 0, 0.1176471, 1, 1,
0.420416, 0.2454302, 1.594873, 0, 0.1137255, 1, 1,
0.4230912, -1.109672, 1.592474, 0, 0.1058824, 1, 1,
0.4269637, 0.4331792, 1.599414, 0, 0.09803922, 1, 1,
0.4305845, -0.7216178, 3.390647, 0, 0.09411765, 1, 1,
0.4328946, -0.04669832, 0.601895, 0, 0.08627451, 1, 1,
0.4354896, 1.179083, 1.35949, 0, 0.08235294, 1, 1,
0.444514, 1.087679, 1.201183, 0, 0.07450981, 1, 1,
0.4449099, 1.495184, 1.735339, 0, 0.07058824, 1, 1,
0.4451382, -0.9159501, 4.172274, 0, 0.0627451, 1, 1,
0.4477028, -1.959137, 3.262741, 0, 0.05882353, 1, 1,
0.4540094, -0.1028336, 1.756898, 0, 0.05098039, 1, 1,
0.4548929, -1.118407, 4.116514, 0, 0.04705882, 1, 1,
0.4624506, 1.869879, 0.1671773, 0, 0.03921569, 1, 1,
0.4630625, -0.6648735, 2.068353, 0, 0.03529412, 1, 1,
0.4631132, -1.372722, 1.436863, 0, 0.02745098, 1, 1,
0.4636782, 0.9092665, 0.03634347, 0, 0.02352941, 1, 1,
0.4677703, -1.313818, 2.646583, 0, 0.01568628, 1, 1,
0.4695704, 0.5093651, 0.3500075, 0, 0.01176471, 1, 1,
0.4699988, 2.025536, 0.008589329, 0, 0.003921569, 1, 1,
0.4744348, -0.4434831, 4.587256, 0.003921569, 0, 1, 1,
0.4761426, -0.7250058, 2.019536, 0.007843138, 0, 1, 1,
0.4773569, -0.2758022, 2.694066, 0.01568628, 0, 1, 1,
0.4820522, -0.3118968, 2.669521, 0.01960784, 0, 1, 1,
0.4837527, 1.041895, -0.1592103, 0.02745098, 0, 1, 1,
0.4871362, 1.113734, -0.9909387, 0.03137255, 0, 1, 1,
0.4948027, -0.8507425, 2.235711, 0.03921569, 0, 1, 1,
0.4969933, -0.8651098, 1.694903, 0.04313726, 0, 1, 1,
0.5052174, -1.006856, 3.257495, 0.05098039, 0, 1, 1,
0.5069249, 0.09049532, 1.243733, 0.05490196, 0, 1, 1,
0.5127766, 1.89832, 1.044528, 0.0627451, 0, 1, 1,
0.515397, 0.8675752, 0.7482879, 0.06666667, 0, 1, 1,
0.5191476, -0.1458655, 2.319626, 0.07450981, 0, 1, 1,
0.5205475, -1.393821, 1.846576, 0.07843138, 0, 1, 1,
0.5231633, -0.4908189, 2.807652, 0.08627451, 0, 1, 1,
0.5238684, 0.2606801, 0.7729185, 0.09019608, 0, 1, 1,
0.5269288, 0.07754701, 1.777429, 0.09803922, 0, 1, 1,
0.5297622, -0.2113951, 4.333071, 0.1058824, 0, 1, 1,
0.5299749, -0.05721597, 1.608116, 0.1098039, 0, 1, 1,
0.5312819, 0.4427753, 1.241609, 0.1176471, 0, 1, 1,
0.5352842, 0.07343872, 2.946578, 0.1215686, 0, 1, 1,
0.5359001, 0.06457274, 3.227399, 0.1294118, 0, 1, 1,
0.5380961, 0.006707838, 2.652499, 0.1333333, 0, 1, 1,
0.5397564, 0.454051, 1.647162, 0.1411765, 0, 1, 1,
0.539843, -0.859592, 2.190104, 0.145098, 0, 1, 1,
0.5429049, 1.706235, -0.5162427, 0.1529412, 0, 1, 1,
0.5442502, -0.9263713, 2.338674, 0.1568628, 0, 1, 1,
0.5498268, -1.73699, 3.908224, 0.1647059, 0, 1, 1,
0.5508406, -0.04471437, 0.5598537, 0.1686275, 0, 1, 1,
0.5555848, -0.9613764, 4.224635, 0.1764706, 0, 1, 1,
0.5556754, 1.617491, -1.101828, 0.1803922, 0, 1, 1,
0.5602205, -0.7569517, 2.769054, 0.1882353, 0, 1, 1,
0.5611652, -1.377577, 2.79277, 0.1921569, 0, 1, 1,
0.5706618, 0.7496225, 1.462752, 0.2, 0, 1, 1,
0.5706714, -0.9878114, 1.726126, 0.2078431, 0, 1, 1,
0.5789289, -1.604193, 3.76892, 0.2117647, 0, 1, 1,
0.5850291, -1.932793, 3.425646, 0.2196078, 0, 1, 1,
0.5857911, -0.7552034, 3.366765, 0.2235294, 0, 1, 1,
0.5938379, -0.9888062, 4.831788, 0.2313726, 0, 1, 1,
0.5941793, 0.3494406, 0.3408996, 0.2352941, 0, 1, 1,
0.5954779, 0.2838686, 1.80651, 0.2431373, 0, 1, 1,
0.6027375, 1.340937, -0.4425383, 0.2470588, 0, 1, 1,
0.6062394, 1.206574, 0.8417863, 0.254902, 0, 1, 1,
0.6065047, -1.070912, 3.182988, 0.2588235, 0, 1, 1,
0.608332, 0.1626527, 2.20023, 0.2666667, 0, 1, 1,
0.6087167, 0.01119282, 3.23353, 0.2705882, 0, 1, 1,
0.613493, -1.743459, 3.4312, 0.2784314, 0, 1, 1,
0.6140328, -0.5989694, 2.570536, 0.282353, 0, 1, 1,
0.6212653, -0.6329256, 4.052347, 0.2901961, 0, 1, 1,
0.6219875, 0.4128737, 1.919012, 0.2941177, 0, 1, 1,
0.6226031, -1.808653, 2.981948, 0.3019608, 0, 1, 1,
0.6288978, 1.768442, 0.2177191, 0.3098039, 0, 1, 1,
0.6323699, 0.9882447, -1.525404, 0.3137255, 0, 1, 1,
0.6363391, 2.016354, 1.052087, 0.3215686, 0, 1, 1,
0.6406366, -0.07405955, 1.722536, 0.3254902, 0, 1, 1,
0.6408692, 1.705838, 0.3410731, 0.3333333, 0, 1, 1,
0.6474191, -0.1129716, 3.501525, 0.3372549, 0, 1, 1,
0.6511064, 0.7993152, -0.1787798, 0.345098, 0, 1, 1,
0.6514191, -0.4067308, 3.090023, 0.3490196, 0, 1, 1,
0.6581023, 0.6446106, 1.63913, 0.3568628, 0, 1, 1,
0.6581281, 1.771328, 0.3262228, 0.3607843, 0, 1, 1,
0.6605766, -2.277228, 2.649654, 0.3686275, 0, 1, 1,
0.6621868, 0.6015891, 1.33378, 0.372549, 0, 1, 1,
0.666043, -1.227416, 1.191513, 0.3803922, 0, 1, 1,
0.6688451, -1.307711, 1.907119, 0.3843137, 0, 1, 1,
0.6695991, -0.7566109, 2.458277, 0.3921569, 0, 1, 1,
0.6698986, 0.01160014, 1.882557, 0.3960784, 0, 1, 1,
0.6732015, -0.2954691, 2.001584, 0.4039216, 0, 1, 1,
0.6750222, 1.584473, -0.2356434, 0.4117647, 0, 1, 1,
0.6763955, 0.7665092, 0.5798972, 0.4156863, 0, 1, 1,
0.6807895, 0.6047536, 0.9922017, 0.4235294, 0, 1, 1,
0.6852655, -0.62815, 0.4765753, 0.427451, 0, 1, 1,
0.6858534, -1.158535, 2.641239, 0.4352941, 0, 1, 1,
0.6893845, 0.8366049, -0.5982685, 0.4392157, 0, 1, 1,
0.689424, 0.1359328, 4.216348, 0.4470588, 0, 1, 1,
0.6917248, -0.208562, 2.213809, 0.4509804, 0, 1, 1,
0.6918634, -0.3315763, 1.179134, 0.4588235, 0, 1, 1,
0.692022, 0.6411999, 1.475401, 0.4627451, 0, 1, 1,
0.6922286, 1.241156, 3.106709, 0.4705882, 0, 1, 1,
0.705842, -0.8330955, 1.376352, 0.4745098, 0, 1, 1,
0.7094898, -0.02527129, 3.53298, 0.4823529, 0, 1, 1,
0.7114837, -1.973289, 2.924468, 0.4862745, 0, 1, 1,
0.7138604, -0.787584, 1.372961, 0.4941176, 0, 1, 1,
0.7208609, 0.9730585, 0.04725714, 0.5019608, 0, 1, 1,
0.7273962, 0.344429, -0.3068873, 0.5058824, 0, 1, 1,
0.729075, -0.8713719, 2.388947, 0.5137255, 0, 1, 1,
0.7293656, 0.8941604, 1.260595, 0.5176471, 0, 1, 1,
0.7336172, 0.6478724, -0.493155, 0.5254902, 0, 1, 1,
0.7336658, 1.538597, -0.3915274, 0.5294118, 0, 1, 1,
0.7359593, -0.9491733, 1.810654, 0.5372549, 0, 1, 1,
0.7394261, -0.2661121, 2.388269, 0.5411765, 0, 1, 1,
0.7474657, -1.170905, 2.299336, 0.5490196, 0, 1, 1,
0.747704, -0.4596752, 1.143058, 0.5529412, 0, 1, 1,
0.7485033, 1.297233, 0.3267068, 0.5607843, 0, 1, 1,
0.760484, 1.246767, 0.1854492, 0.5647059, 0, 1, 1,
0.7611272, -0.5287423, 1.062941, 0.572549, 0, 1, 1,
0.7623532, 1.257551, 2.378232, 0.5764706, 0, 1, 1,
0.763674, -0.4197775, 1.971339, 0.5843138, 0, 1, 1,
0.7680171, -0.1639439, 1.762972, 0.5882353, 0, 1, 1,
0.7702994, -0.7856971, 2.770561, 0.5960785, 0, 1, 1,
0.7715447, -0.9318117, 2.129461, 0.6039216, 0, 1, 1,
0.7749621, 1.424259, 0.3307612, 0.6078432, 0, 1, 1,
0.7761677, 0.5025957, 2.485811, 0.6156863, 0, 1, 1,
0.7780025, 1.049818, -0.5916533, 0.6196079, 0, 1, 1,
0.7853891, -0.02432875, 3.202142, 0.627451, 0, 1, 1,
0.7858663, 1.613162, 0.7937586, 0.6313726, 0, 1, 1,
0.7933558, 1.153954, 0.02970241, 0.6392157, 0, 1, 1,
0.7938903, 1.652059, 0.6852847, 0.6431373, 0, 1, 1,
0.8037297, 1.154696, 0.2889536, 0.6509804, 0, 1, 1,
0.8063529, -1.903571, 3.217384, 0.654902, 0, 1, 1,
0.8081729, -1.924223, 2.67344, 0.6627451, 0, 1, 1,
0.8138721, -0.5001811, 4.544459, 0.6666667, 0, 1, 1,
0.8141562, -0.2816, 1.728178, 0.6745098, 0, 1, 1,
0.8143143, -2.100133, 2.804674, 0.6784314, 0, 1, 1,
0.8145148, -0.885362, 0.8427502, 0.6862745, 0, 1, 1,
0.816303, 0.2117375, 2.980898, 0.6901961, 0, 1, 1,
0.8170693, -0.2609125, -0.4359079, 0.6980392, 0, 1, 1,
0.8171017, 0.07965998, 0.5127145, 0.7058824, 0, 1, 1,
0.8187144, 1.03042, 0.4820493, 0.7098039, 0, 1, 1,
0.8214329, 0.04868164, 1.583394, 0.7176471, 0, 1, 1,
0.8267941, -1.368677, 2.418072, 0.7215686, 0, 1, 1,
0.8405194, 0.6277571, -0.5264496, 0.7294118, 0, 1, 1,
0.8406807, -0.523921, 0.5633837, 0.7333333, 0, 1, 1,
0.8421791, 2.923061, -0.3812244, 0.7411765, 0, 1, 1,
0.8463112, -0.3703148, 3.61861, 0.7450981, 0, 1, 1,
0.8474575, -1.128565, 1.826592, 0.7529412, 0, 1, 1,
0.8481004, -0.621618, 2.109064, 0.7568628, 0, 1, 1,
0.8498558, -1.331102, 2.24815, 0.7647059, 0, 1, 1,
0.8514114, 0.7714113, 3.279478, 0.7686275, 0, 1, 1,
0.8597802, 1.162915, 1.285986, 0.7764706, 0, 1, 1,
0.8640271, 0.8649116, 0.1229491, 0.7803922, 0, 1, 1,
0.8687723, 0.2140135, 0.8867006, 0.7882353, 0, 1, 1,
0.8721218, -0.1766518, 0.9831814, 0.7921569, 0, 1, 1,
0.8729752, -0.3102033, 0.8770939, 0.8, 0, 1, 1,
0.8859202, -0.8572629, 3.619477, 0.8078431, 0, 1, 1,
0.8871929, -0.5641796, 3.860571, 0.8117647, 0, 1, 1,
0.8877311, -0.2053587, 2.569326, 0.8196079, 0, 1, 1,
0.8888484, -0.5638011, 3.054305, 0.8235294, 0, 1, 1,
0.8939467, -0.5646741, 2.644426, 0.8313726, 0, 1, 1,
0.8961737, -0.3332407, 1.960394, 0.8352941, 0, 1, 1,
0.8968955, -0.435135, 2.803136, 0.8431373, 0, 1, 1,
0.8983933, 0.7450864, 1.409938, 0.8470588, 0, 1, 1,
0.8984321, -1.385444, 4.139228, 0.854902, 0, 1, 1,
0.898638, 0.9747614, 1.405772, 0.8588235, 0, 1, 1,
0.899497, -0.5369189, 1.52462, 0.8666667, 0, 1, 1,
0.900117, -0.253418, 0.6442478, 0.8705882, 0, 1, 1,
0.9005666, -0.6985875, 2.181018, 0.8784314, 0, 1, 1,
0.9016371, -0.4288327, 3.558212, 0.8823529, 0, 1, 1,
0.9028774, 0.2918117, 0.300431, 0.8901961, 0, 1, 1,
0.9069072, 0.6792454, 1.467111, 0.8941177, 0, 1, 1,
0.9092463, -0.2864111, 0.3776581, 0.9019608, 0, 1, 1,
0.9098402, -0.3520741, 1.965356, 0.9098039, 0, 1, 1,
0.9111739, 0.06411362, 0.8720517, 0.9137255, 0, 1, 1,
0.9117887, -1.945561, 2.849294, 0.9215686, 0, 1, 1,
0.9175459, 0.4280539, -1.102605, 0.9254902, 0, 1, 1,
0.9258641, 1.212407, 0.7643098, 0.9333333, 0, 1, 1,
0.9286509, 0.4030916, 1.416112, 0.9372549, 0, 1, 1,
0.9344587, -0.2561485, 2.386826, 0.945098, 0, 1, 1,
0.9375596, -0.3418966, -0.2098293, 0.9490196, 0, 1, 1,
0.9441975, -0.8278262, 2.771835, 0.9568627, 0, 1, 1,
0.9490978, 0.9420667, 0.6564658, 0.9607843, 0, 1, 1,
0.9547244, 0.2050902, 3.197683, 0.9686275, 0, 1, 1,
0.9565778, -0.4866615, 2.661073, 0.972549, 0, 1, 1,
0.9592177, -1.976782, 1.184542, 0.9803922, 0, 1, 1,
0.9640064, 0.09436002, 1.652825, 0.9843137, 0, 1, 1,
0.9642423, -0.4667169, 2.087829, 0.9921569, 0, 1, 1,
0.9680827, 1.631971, 0.7012428, 0.9960784, 0, 1, 1,
0.9690542, -0.3206794, 1.409587, 1, 0, 0.9960784, 1,
0.9807096, -0.3122035, 1.275305, 1, 0, 0.9882353, 1,
0.9811404, -0.6075586, 2.477446, 1, 0, 0.9843137, 1,
0.9812427, 1.424872, 0.8955197, 1, 0, 0.9764706, 1,
0.9924815, 1.580828, 0.3588835, 1, 0, 0.972549, 1,
0.9954261, -0.2086333, 1.865123, 1, 0, 0.9647059, 1,
1.003043, 0.2747134, 1.190864, 1, 0, 0.9607843, 1,
1.011233, 1.146019, 1.192296, 1, 0, 0.9529412, 1,
1.016717, 0.6267301, 0.9888593, 1, 0, 0.9490196, 1,
1.016732, 0.5844232, 2.211056, 1, 0, 0.9411765, 1,
1.020217, -1.023541, 0.1732507, 1, 0, 0.9372549, 1,
1.029807, -0.2287386, 0.8260403, 1, 0, 0.9294118, 1,
1.034372, 0.850201, 1.132821, 1, 0, 0.9254902, 1,
1.035376, 2.308205, -1.335497, 1, 0, 0.9176471, 1,
1.040664, 0.3234072, 2.490443, 1, 0, 0.9137255, 1,
1.04171, 1.261758, -0.3985314, 1, 0, 0.9058824, 1,
1.045072, -1.624557, 2.534845, 1, 0, 0.9019608, 1,
1.045712, 0.4013882, -0.02740725, 1, 0, 0.8941177, 1,
1.048572, -0.3643024, 2.316671, 1, 0, 0.8862745, 1,
1.050751, -0.3298312, -1.403677, 1, 0, 0.8823529, 1,
1.05573, -0.4929004, 4.335709, 1, 0, 0.8745098, 1,
1.056236, -2.395641, 2.974402, 1, 0, 0.8705882, 1,
1.065876, -0.1879457, 1.874481, 1, 0, 0.8627451, 1,
1.068419, -0.2899087, 0.9580777, 1, 0, 0.8588235, 1,
1.07246, 1.882762, 0.7763639, 1, 0, 0.8509804, 1,
1.07258, 1.996372, -0.5748453, 1, 0, 0.8470588, 1,
1.081436, -0.9485385, 1.209648, 1, 0, 0.8392157, 1,
1.08478, -0.2661107, 1.840259, 1, 0, 0.8352941, 1,
1.094632, -0.3208801, 2.244996, 1, 0, 0.827451, 1,
1.096493, 0.977375, -0.3202078, 1, 0, 0.8235294, 1,
1.100862, 0.1802965, 0.8079016, 1, 0, 0.8156863, 1,
1.103877, -0.5028375, 2.393671, 1, 0, 0.8117647, 1,
1.105225, -0.7773073, 2.444937, 1, 0, 0.8039216, 1,
1.107098, 0.6541898, 1.951292, 1, 0, 0.7960784, 1,
1.10746, -0.8953791, 3.239623, 1, 0, 0.7921569, 1,
1.108083, -0.1318721, 2.596848, 1, 0, 0.7843137, 1,
1.108104, -2.611313, 3.11116, 1, 0, 0.7803922, 1,
1.108297, -1.874545, 2.61653, 1, 0, 0.772549, 1,
1.113376, -1.96981, 2.665814, 1, 0, 0.7686275, 1,
1.116383, 0.1819237, 2.072105, 1, 0, 0.7607843, 1,
1.117981, 0.9985554, -0.1780102, 1, 0, 0.7568628, 1,
1.123534, -0.6254377, 1.899539, 1, 0, 0.7490196, 1,
1.123948, -0.005270844, 1.825435, 1, 0, 0.7450981, 1,
1.127164, -0.4152342, 1.568243, 1, 0, 0.7372549, 1,
1.128451, 0.04075585, -0.1430571, 1, 0, 0.7333333, 1,
1.133401, 0.3642744, 2.790386, 1, 0, 0.7254902, 1,
1.137004, 1.596247, 1.051218, 1, 0, 0.7215686, 1,
1.13881, -0.4865845, 2.72006, 1, 0, 0.7137255, 1,
1.151138, 0.5512543, 0.7732421, 1, 0, 0.7098039, 1,
1.159738, -0.7943282, 2.038604, 1, 0, 0.7019608, 1,
1.160597, 0.2861742, 2.48387, 1, 0, 0.6941177, 1,
1.163365, 0.7003215, 1.930301, 1, 0, 0.6901961, 1,
1.16352, -1.16785, 1.107916, 1, 0, 0.682353, 1,
1.173228, -1.403406, 1.003839, 1, 0, 0.6784314, 1,
1.192768, -0.8388538, 1.645548, 1, 0, 0.6705883, 1,
1.193847, 0.3113461, 1.585627, 1, 0, 0.6666667, 1,
1.201279, 1.289099, 0.5811419, 1, 0, 0.6588235, 1,
1.212903, 1.814523, -0.02203881, 1, 0, 0.654902, 1,
1.21316, 0.3611438, 1.009981, 1, 0, 0.6470588, 1,
1.216117, -1.964759, 2.652091, 1, 0, 0.6431373, 1,
1.217192, -0.01049443, 2.924046, 1, 0, 0.6352941, 1,
1.22485, 1.033314, 1.229048, 1, 0, 0.6313726, 1,
1.234709, 0.7190106, 0.6557322, 1, 0, 0.6235294, 1,
1.238826, 1.852634, -0.9152834, 1, 0, 0.6196079, 1,
1.245614, -0.2967058, 2.968648, 1, 0, 0.6117647, 1,
1.249216, -1.522607, 3.529215, 1, 0, 0.6078432, 1,
1.250028, 0.8216069, 0.4601722, 1, 0, 0.6, 1,
1.251623, -0.9485643, 2.070848, 1, 0, 0.5921569, 1,
1.261829, 1.691933, 1.516831, 1, 0, 0.5882353, 1,
1.267321, 0.09995917, -0.1348663, 1, 0, 0.5803922, 1,
1.273762, 0.03073446, 0.4917889, 1, 0, 0.5764706, 1,
1.275393, 0.5040486, 1.375499, 1, 0, 0.5686275, 1,
1.283806, 0.9656389, -0.2341089, 1, 0, 0.5647059, 1,
1.285741, 0.1287549, -0.04506843, 1, 0, 0.5568628, 1,
1.286684, 0.503018, 1.480367, 1, 0, 0.5529412, 1,
1.286993, -0.4661646, -1.714919, 1, 0, 0.5450981, 1,
1.291515, -2.010503, 2.671179, 1, 0, 0.5411765, 1,
1.301746, 1.341819, -0.1270006, 1, 0, 0.5333334, 1,
1.304101, -0.3034315, 1.83474, 1, 0, 0.5294118, 1,
1.313318, -0.2738778, 2.791675, 1, 0, 0.5215687, 1,
1.314705, 1.211412, 0.5566943, 1, 0, 0.5176471, 1,
1.32903, 0.1719406, 2.829351, 1, 0, 0.509804, 1,
1.345021, 0.5519512, 0.1793285, 1, 0, 0.5058824, 1,
1.365025, -0.3130761, 1.970868, 1, 0, 0.4980392, 1,
1.376809, 1.167814, -0.5000488, 1, 0, 0.4901961, 1,
1.37978, 0.1031503, 1.010497, 1, 0, 0.4862745, 1,
1.392488, -0.2320852, 2.430663, 1, 0, 0.4784314, 1,
1.39728, -0.8031234, 4.374431, 1, 0, 0.4745098, 1,
1.400326, 0.1945712, 0.8374839, 1, 0, 0.4666667, 1,
1.419247, 3.316838, 1.269956, 1, 0, 0.4627451, 1,
1.423872, -0.3603711, 2.557376, 1, 0, 0.454902, 1,
1.426426, -0.0835906, 0.1304242, 1, 0, 0.4509804, 1,
1.432812, 0.1819721, -0.3530172, 1, 0, 0.4431373, 1,
1.435992, -1.344913, 2.365799, 1, 0, 0.4392157, 1,
1.442394, -1.534113, 0.6462492, 1, 0, 0.4313726, 1,
1.449254, 0.1529511, 1.420102, 1, 0, 0.427451, 1,
1.449801, -1.572529, 1.935862, 1, 0, 0.4196078, 1,
1.450401, 1.395969, 0.3221413, 1, 0, 0.4156863, 1,
1.469685, 0.7475233, 0.9343112, 1, 0, 0.4078431, 1,
1.474194, -1.170147, 2.393775, 1, 0, 0.4039216, 1,
1.475906, 0.974476, 2.852927, 1, 0, 0.3960784, 1,
1.488301, -1.702149, 1.601544, 1, 0, 0.3882353, 1,
1.496483, 0.6988542, 1.564945, 1, 0, 0.3843137, 1,
1.499689, -0.8874217, 2.76984, 1, 0, 0.3764706, 1,
1.49982, -1.010566, 1.892629, 1, 0, 0.372549, 1,
1.507645, -2.793634, 1.838639, 1, 0, 0.3647059, 1,
1.509767, 0.8289046, 1.02675, 1, 0, 0.3607843, 1,
1.518941, 0.1156187, 2.690394, 1, 0, 0.3529412, 1,
1.522833, 0.8609858, -0.3019731, 1, 0, 0.3490196, 1,
1.524772, 0.9380878, 1.036013, 1, 0, 0.3411765, 1,
1.540999, 1.893558, 1.133583, 1, 0, 0.3372549, 1,
1.542424, 0.7238988, 1.487804, 1, 0, 0.3294118, 1,
1.547213, 0.5563124, 0.9577861, 1, 0, 0.3254902, 1,
1.549709, -2.083939, 2.306511, 1, 0, 0.3176471, 1,
1.558632, -0.1932286, 2.574816, 1, 0, 0.3137255, 1,
1.568123, -0.6710433, 2.125376, 1, 0, 0.3058824, 1,
1.569331, 0.2092422, 2.09649, 1, 0, 0.2980392, 1,
1.574267, 2.012443, -0.8994671, 1, 0, 0.2941177, 1,
1.57464, 1.559243, 0.6690814, 1, 0, 0.2862745, 1,
1.576913, 0.2856425, 0.3281417, 1, 0, 0.282353, 1,
1.601358, 0.4476543, 0.4719541, 1, 0, 0.2745098, 1,
1.610688, -1.453896, 2.183316, 1, 0, 0.2705882, 1,
1.630043, 2.073, 2.138592, 1, 0, 0.2627451, 1,
1.631495, -0.8299677, 2.400529, 1, 0, 0.2588235, 1,
1.632049, -0.05544282, 2.788248, 1, 0, 0.2509804, 1,
1.632798, -1.306546, 1.506739, 1, 0, 0.2470588, 1,
1.635114, -1.427867, 0.4070632, 1, 0, 0.2392157, 1,
1.643328, -0.9991634, 1.744098, 1, 0, 0.2352941, 1,
1.643927, -2.634529, 3.911095, 1, 0, 0.227451, 1,
1.648448, -0.6732135, 2.314255, 1, 0, 0.2235294, 1,
1.654142, -0.1304751, 0.6285819, 1, 0, 0.2156863, 1,
1.661012, -0.796098, 1.301995, 1, 0, 0.2117647, 1,
1.67453, -0.3525747, 0.7560159, 1, 0, 0.2039216, 1,
1.698493, -0.06607914, 2.748456, 1, 0, 0.1960784, 1,
1.717211, -0.6222515, 2.345936, 1, 0, 0.1921569, 1,
1.754548, 0.3432264, 2.061651, 1, 0, 0.1843137, 1,
1.75644, -0.136915, 1.797871, 1, 0, 0.1803922, 1,
1.765655, -2.036364, 3.621809, 1, 0, 0.172549, 1,
1.768242, 1.48256, -0.1866987, 1, 0, 0.1686275, 1,
1.788593, -0.4935777, 3.453564, 1, 0, 0.1607843, 1,
1.792838, 1.557779, 0.9081883, 1, 0, 0.1568628, 1,
1.809255, -1.613349, 2.901879, 1, 0, 0.1490196, 1,
1.809804, 1.766886, 0.4225867, 1, 0, 0.145098, 1,
1.831075, -1.605817, 2.479134, 1, 0, 0.1372549, 1,
1.851198, -0.04504989, 1.552943, 1, 0, 0.1333333, 1,
1.87628, 1.249875, 1.891116, 1, 0, 0.1254902, 1,
1.894141, 0.6260895, 1.268552, 1, 0, 0.1215686, 1,
1.896789, -0.2028901, 1.079594, 1, 0, 0.1137255, 1,
1.954549, 1.258349, 0.2135929, 1, 0, 0.1098039, 1,
1.99884, 0.6888327, 1.704583, 1, 0, 0.1019608, 1,
2.019013, 0.1374095, 1.989534, 1, 0, 0.09411765, 1,
2.038183, -1.386199, 0.9292606, 1, 0, 0.09019608, 1,
2.096435, -0.0181351, 1.478023, 1, 0, 0.08235294, 1,
2.09754, 0.06430191, 2.083967, 1, 0, 0.07843138, 1,
2.149188, 0.7873431, 2.086411, 1, 0, 0.07058824, 1,
2.174169, -0.9693229, -0.01325603, 1, 0, 0.06666667, 1,
2.203525, 1.710665, 1.870596, 1, 0, 0.05882353, 1,
2.229944, 0.133777, 1.142136, 1, 0, 0.05490196, 1,
2.249389, -0.2917823, 2.855699, 1, 0, 0.04705882, 1,
2.274567, -1.130183, 1.926019, 1, 0, 0.04313726, 1,
2.376545, -0.1242507, 1.908428, 1, 0, 0.03529412, 1,
2.411493, -0.02370532, 2.966905, 1, 0, 0.03137255, 1,
2.472022, 1.195138, 2.161639, 1, 0, 0.02352941, 1,
2.541602, 0.6930872, 3.156463, 1, 0, 0.01960784, 1,
2.595161, 0.4195186, 2.165142, 1, 0, 0.01176471, 1,
2.816865, 2.627941, 1.722063, 1, 0, 0.007843138, 1
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
-0.018942, -3.829359, -7.964355, 0, -0.5, 0.5, 0.5,
-0.018942, -3.829359, -7.964355, 1, -0.5, 0.5, 0.5,
-0.018942, -3.829359, -7.964355, 1, 1.5, 0.5, 0.5,
-0.018942, -3.829359, -7.964355, 0, 1.5, 0.5, 0.5
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
-3.816087, 0.2616022, -7.964355, 0, -0.5, 0.5, 0.5,
-3.816087, 0.2616022, -7.964355, 1, -0.5, 0.5, 0.5,
-3.816087, 0.2616022, -7.964355, 1, 1.5, 0.5, 0.5,
-3.816087, 0.2616022, -7.964355, 0, 1.5, 0.5, 0.5
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
-3.816087, -3.829359, -0.5303166, 0, -0.5, 0.5, 0.5,
-3.816087, -3.829359, -0.5303166, 1, -0.5, 0.5, 0.5,
-3.816087, -3.829359, -0.5303166, 1, 1.5, 0.5, 0.5,
-3.816087, -3.829359, -0.5303166, 0, 1.5, 0.5, 0.5
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
-2, -2.885291, -6.248807,
2, -2.885291, -6.248807,
-2, -2.885291, -6.248807,
-2, -3.042636, -6.534732,
-1, -2.885291, -6.248807,
-1, -3.042636, -6.534732,
0, -2.885291, -6.248807,
0, -3.042636, -6.534732,
1, -2.885291, -6.248807,
1, -3.042636, -6.534732,
2, -2.885291, -6.248807,
2, -3.042636, -6.534732
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
-2, -3.357325, -7.106581, 0, -0.5, 0.5, 0.5,
-2, -3.357325, -7.106581, 1, -0.5, 0.5, 0.5,
-2, -3.357325, -7.106581, 1, 1.5, 0.5, 0.5,
-2, -3.357325, -7.106581, 0, 1.5, 0.5, 0.5,
-1, -3.357325, -7.106581, 0, -0.5, 0.5, 0.5,
-1, -3.357325, -7.106581, 1, -0.5, 0.5, 0.5,
-1, -3.357325, -7.106581, 1, 1.5, 0.5, 0.5,
-1, -3.357325, -7.106581, 0, 1.5, 0.5, 0.5,
0, -3.357325, -7.106581, 0, -0.5, 0.5, 0.5,
0, -3.357325, -7.106581, 1, -0.5, 0.5, 0.5,
0, -3.357325, -7.106581, 1, 1.5, 0.5, 0.5,
0, -3.357325, -7.106581, 0, 1.5, 0.5, 0.5,
1, -3.357325, -7.106581, 0, -0.5, 0.5, 0.5,
1, -3.357325, -7.106581, 1, -0.5, 0.5, 0.5,
1, -3.357325, -7.106581, 1, 1.5, 0.5, 0.5,
1, -3.357325, -7.106581, 0, 1.5, 0.5, 0.5,
2, -3.357325, -7.106581, 0, -0.5, 0.5, 0.5,
2, -3.357325, -7.106581, 1, -0.5, 0.5, 0.5,
2, -3.357325, -7.106581, 1, 1.5, 0.5, 0.5,
2, -3.357325, -7.106581, 0, 1.5, 0.5, 0.5
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
-2.939823, -2, -6.248807,
-2.939823, 3, -6.248807,
-2.939823, -2, -6.248807,
-3.085867, -2, -6.534732,
-2.939823, -1, -6.248807,
-3.085867, -1, -6.534732,
-2.939823, 0, -6.248807,
-3.085867, 0, -6.534732,
-2.939823, 1, -6.248807,
-3.085867, 1, -6.534732,
-2.939823, 2, -6.248807,
-3.085867, 2, -6.534732,
-2.939823, 3, -6.248807,
-3.085867, 3, -6.534732
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
-3.377955, -2, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, -2, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, -2, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, -2, -7.106581, 0, 1.5, 0.5, 0.5,
-3.377955, -1, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, -1, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, -1, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, -1, -7.106581, 0, 1.5, 0.5, 0.5,
-3.377955, 0, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, 0, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, 0, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, 0, -7.106581, 0, 1.5, 0.5, 0.5,
-3.377955, 1, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, 1, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, 1, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, 1, -7.106581, 0, 1.5, 0.5, 0.5,
-3.377955, 2, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, 2, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, 2, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, 2, -7.106581, 0, 1.5, 0.5, 0.5,
-3.377955, 3, -7.106581, 0, -0.5, 0.5, 0.5,
-3.377955, 3, -7.106581, 1, -0.5, 0.5, 0.5,
-3.377955, 3, -7.106581, 1, 1.5, 0.5, 0.5,
-3.377955, 3, -7.106581, 0, 1.5, 0.5, 0.5
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
-2.939823, -2.885291, -6,
-2.939823, -2.885291, 4,
-2.939823, -2.885291, -6,
-3.085867, -3.042636, -6,
-2.939823, -2.885291, -4,
-3.085867, -3.042636, -4,
-2.939823, -2.885291, -2,
-3.085867, -3.042636, -2,
-2.939823, -2.885291, 0,
-3.085867, -3.042636, 0,
-2.939823, -2.885291, 2,
-3.085867, -3.042636, 2,
-2.939823, -2.885291, 4,
-3.085867, -3.042636, 4
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
-3.377955, -3.357325, -6, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -6, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -6, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, -6, 0, 1.5, 0.5, 0.5,
-3.377955, -3.357325, -4, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -4, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -4, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, -4, 0, 1.5, 0.5, 0.5,
-3.377955, -3.357325, -2, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -2, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, -2, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, -2, 0, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 0, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 0, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 0, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 0, 0, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 2, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 2, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 2, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 2, 0, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 4, 0, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 4, 1, -0.5, 0.5, 0.5,
-3.377955, -3.357325, 4, 1, 1.5, 0.5, 0.5,
-3.377955, -3.357325, 4, 0, 1.5, 0.5, 0.5
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
-2.939823, -2.885291, -6.248807,
-2.939823, 3.408495, -6.248807,
-2.939823, -2.885291, 5.188174,
-2.939823, 3.408495, 5.188174,
-2.939823, -2.885291, -6.248807,
-2.939823, -2.885291, 5.188174,
-2.939823, 3.408495, -6.248807,
-2.939823, 3.408495, 5.188174,
-2.939823, -2.885291, -6.248807,
2.901939, -2.885291, -6.248807,
-2.939823, -2.885291, 5.188174,
2.901939, -2.885291, 5.188174,
-2.939823, 3.408495, -6.248807,
2.901939, 3.408495, -6.248807,
-2.939823, 3.408495, 5.188174,
2.901939, 3.408495, 5.188174,
2.901939, -2.885291, -6.248807,
2.901939, 3.408495, -6.248807,
2.901939, -2.885291, 5.188174,
2.901939, 3.408495, 5.188174,
2.901939, -2.885291, -6.248807,
2.901939, -2.885291, 5.188174,
2.901939, 3.408495, -6.248807,
2.901939, 3.408495, 5.188174
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
var radius = 7.636902;
var distance = 33.97744;
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
mvMatrix.translate( 0.018942, -0.2616022, 0.5303166 );
mvMatrix.scale( 1.413472, 1.311956, 0.7219709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.97744);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Allophanate<-read.table("Allophanate.xyz", skip=1)
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
-2.854749, -1.088063, -2.182348, 0, 0, 1, 1, 1,
-2.79465, -0.9832562, -1.868196, 1, 0, 0, 1, 1,
-2.725944, -0.4040824, -1.642736, 1, 0, 0, 1, 1,
-2.627189, 0.3515141, 1.579249, 1, 0, 0, 1, 1,
-2.534801, -1.833309, -2.469599, 1, 0, 0, 1, 1,
-2.528715, 0.4049806, -1.605455, 1, 0, 0, 1, 1,
-2.51553, -0.4574844, -1.018347, 0, 0, 0, 1, 1,
-2.412794, -1.874691, -3.188112, 0, 0, 0, 1, 1,
-2.411565, 2.11416, -1.327629, 0, 0, 0, 1, 1,
-2.399001, 0.01508581, -2.440783, 0, 0, 0, 1, 1,
-2.394976, -0.4182351, -1.501598, 0, 0, 0, 1, 1,
-2.379582, 0.1636398, -1.01394, 0, 0, 0, 1, 1,
-2.371747, -1.430353, -2.594682, 0, 0, 0, 1, 1,
-2.348454, -0.4486996, -1.860648, 1, 1, 1, 1, 1,
-2.337816, -0.2169554, -1.611617, 1, 1, 1, 1, 1,
-2.180547, -0.2200499, -3.060497, 1, 1, 1, 1, 1,
-2.169719, -0.7158156, -2.542443, 1, 1, 1, 1, 1,
-2.164968, -1.522144, -1.996942, 1, 1, 1, 1, 1,
-2.133588, 0.114772, -3.249977, 1, 1, 1, 1, 1,
-2.133574, -0.6356798, -1.407251, 1, 1, 1, 1, 1,
-2.114276, 0.3979378, 0.2618718, 1, 1, 1, 1, 1,
-2.092795, 1.475021, -0.6076211, 1, 1, 1, 1, 1,
-2.048736, -1.824889, -2.579406, 1, 1, 1, 1, 1,
-2.046716, 0.9867327, -0.02781272, 1, 1, 1, 1, 1,
-2.021527, -0.3766046, -0.3579319, 1, 1, 1, 1, 1,
-1.945157, 0.7717998, -3.097224, 1, 1, 1, 1, 1,
-1.924447, 0.3491221, -1.535177, 1, 1, 1, 1, 1,
-1.921184, 0.6929802, -1.899413, 1, 1, 1, 1, 1,
-1.901028, 1.019017, -1.555652, 0, 0, 1, 1, 1,
-1.884899, 0.3108474, -0.2297564, 1, 0, 0, 1, 1,
-1.869905, 0.6408142, -1.125851, 1, 0, 0, 1, 1,
-1.854316, -0.486763, -3.034801, 1, 0, 0, 1, 1,
-1.849927, 0.2778732, -1.008612, 1, 0, 0, 1, 1,
-1.820364, -0.498808, -3.23418, 1, 0, 0, 1, 1,
-1.814621, -0.7276142, -1.577924, 0, 0, 0, 1, 1,
-1.794638, -0.8666478, -3.119733, 0, 0, 0, 1, 1,
-1.788235, 0.9360088, -1.038815, 0, 0, 0, 1, 1,
-1.782056, -0.6929302, -3.496886, 0, 0, 0, 1, 1,
-1.781769, -0.799188, -2.597307, 0, 0, 0, 1, 1,
-1.762416, 0.2754711, -0.4824656, 0, 0, 0, 1, 1,
-1.762241, 0.1177006, -0.6428995, 0, 0, 0, 1, 1,
-1.752228, -0.501087, -2.101668, 1, 1, 1, 1, 1,
-1.751922, 1.772464, 1.315047, 1, 1, 1, 1, 1,
-1.737948, -0.2648401, -1.218853, 1, 1, 1, 1, 1,
-1.731463, -2.103353, -1.762301, 1, 1, 1, 1, 1,
-1.729311, 0.1347002, -0.4655025, 1, 1, 1, 1, 1,
-1.719214, 0.2982937, -0.9116157, 1, 1, 1, 1, 1,
-1.688808, -0.8321666, -0.8705267, 1, 1, 1, 1, 1,
-1.679058, -1.229484, -1.946968, 1, 1, 1, 1, 1,
-1.665438, -0.6182256, -2.05515, 1, 1, 1, 1, 1,
-1.659266, 0.4712188, -1.696398, 1, 1, 1, 1, 1,
-1.655842, -0.771816, -0.8729221, 1, 1, 1, 1, 1,
-1.650436, 2.525664, 0.1282389, 1, 1, 1, 1, 1,
-1.644611, -0.8180455, -1.308488, 1, 1, 1, 1, 1,
-1.62775, 1.804528, -0.5502664, 1, 1, 1, 1, 1,
-1.627485, 0.5204733, -1.884231, 1, 1, 1, 1, 1,
-1.618035, -1.162375, -2.522799, 0, 0, 1, 1, 1,
-1.604816, -0.4163307, -2.174523, 1, 0, 0, 1, 1,
-1.602071, 0.3793329, -1.783712, 1, 0, 0, 1, 1,
-1.582086, -0.1992276, -1.271589, 1, 0, 0, 1, 1,
-1.577757, -1.044952, -2.152836, 1, 0, 0, 1, 1,
-1.571177, -0.8057236, -3.2766, 1, 0, 0, 1, 1,
-1.559576, 0.9760264, -3.466134, 0, 0, 0, 1, 1,
-1.556998, 0.3784577, -1.378743, 0, 0, 0, 1, 1,
-1.543024, -0.6708145, -0.8757821, 0, 0, 0, 1, 1,
-1.524161, 1.873521, -0.1134608, 0, 0, 0, 1, 1,
-1.509884, 0.7925918, -1.902007, 0, 0, 0, 1, 1,
-1.484913, 1.170695, -0.898452, 0, 0, 0, 1, 1,
-1.475374, -0.007130679, -0.3951342, 0, 0, 0, 1, 1,
-1.461855, -1.099287, -1.813155, 1, 1, 1, 1, 1,
-1.454227, 0.02353532, -0.6299896, 1, 1, 1, 1, 1,
-1.452367, -0.5475468, -3.090736, 1, 1, 1, 1, 1,
-1.447943, -0.8820799, -1.088614, 1, 1, 1, 1, 1,
-1.446741, -1.488117, -2.951495, 1, 1, 1, 1, 1,
-1.421923, -0.6057673, -1.761644, 1, 1, 1, 1, 1,
-1.419296, -1.941234, -2.556573, 1, 1, 1, 1, 1,
-1.417814, -0.2417385, -1.736236, 1, 1, 1, 1, 1,
-1.413799, -0.5352864, -0.4455932, 1, 1, 1, 1, 1,
-1.4125, 0.9566569, -1.230627, 1, 1, 1, 1, 1,
-1.408559, 0.08720442, -2.189221, 1, 1, 1, 1, 1,
-1.405469, 0.09387417, -2.499421, 1, 1, 1, 1, 1,
-1.401791, -1.028029, -5.134817, 1, 1, 1, 1, 1,
-1.397244, -0.5392342, -2.565533, 1, 1, 1, 1, 1,
-1.379922, -1.68768, -2.583853, 1, 1, 1, 1, 1,
-1.373262, -0.6066684, -2.734253, 0, 0, 1, 1, 1,
-1.365022, -1.594198, -1.965406, 1, 0, 0, 1, 1,
-1.36219, -0.2622536, -0.4949375, 1, 0, 0, 1, 1,
-1.358794, -1.999485, -1.78134, 1, 0, 0, 1, 1,
-1.354056, -1.068255, -1.000457, 1, 0, 0, 1, 1,
-1.328495, -0.01846602, -1.303434, 1, 0, 0, 1, 1,
-1.328006, 1.228231, -0.6425295, 0, 0, 0, 1, 1,
-1.323007, -0.8628319, -2.966955, 0, 0, 0, 1, 1,
-1.314338, -0.7754773, -4.58005, 0, 0, 0, 1, 1,
-1.310064, -0.01934085, -0.2638405, 0, 0, 0, 1, 1,
-1.30871, 0.4234324, -1.05476, 0, 0, 0, 1, 1,
-1.307238, -1.200605, -2.863218, 0, 0, 0, 1, 1,
-1.303111, 1.501643, -0.8981971, 0, 0, 0, 1, 1,
-1.286484, 0.5946371, -1.689432, 1, 1, 1, 1, 1,
-1.28556, -1.116904, -2.165757, 1, 1, 1, 1, 1,
-1.284727, 0.6409237, -1.499871, 1, 1, 1, 1, 1,
-1.255568, 1.338323, 0.7040516, 1, 1, 1, 1, 1,
-1.255128, -1.29509, -3.250375, 1, 1, 1, 1, 1,
-1.252488, -0.8006601, -1.18856, 1, 1, 1, 1, 1,
-1.249788, 1.2834, -1.574606, 1, 1, 1, 1, 1,
-1.241647, -0.8143387, -2.389377, 1, 1, 1, 1, 1,
-1.235278, 0.4349762, -2.218387, 1, 1, 1, 1, 1,
-1.232832, 0.5485262, -1.487717, 1, 1, 1, 1, 1,
-1.232747, -1.127044, -2.114389, 1, 1, 1, 1, 1,
-1.232558, 1.427012, -1.553799, 1, 1, 1, 1, 1,
-1.23101, -1.959211, -2.917841, 1, 1, 1, 1, 1,
-1.230354, -1.278509, -3.094164, 1, 1, 1, 1, 1,
-1.229033, -1.127244, -3.009604, 1, 1, 1, 1, 1,
-1.227859, -0.4418461, -2.53033, 0, 0, 1, 1, 1,
-1.222756, -1.383765, -1.104918, 1, 0, 0, 1, 1,
-1.222185, 2.392774, 0.4179007, 1, 0, 0, 1, 1,
-1.219737, 0.436081, -1.250208, 1, 0, 0, 1, 1,
-1.218172, 1.578918, -1.171571, 1, 0, 0, 1, 1,
-1.214959, -0.517967, -3.024783, 1, 0, 0, 1, 1,
-1.212359, -0.4379543, -2.252296, 0, 0, 0, 1, 1,
-1.208839, -0.5598745, -1.430634, 0, 0, 0, 1, 1,
-1.207854, 1.825203, -0.8588767, 0, 0, 0, 1, 1,
-1.20013, -1.507092, -3.238302, 0, 0, 0, 1, 1,
-1.19696, 1.684538, -1.724837, 0, 0, 0, 1, 1,
-1.191873, 0.112013, -3.868542, 0, 0, 0, 1, 1,
-1.190639, -1.66137, -1.637906, 0, 0, 0, 1, 1,
-1.190102, -0.8115773, -3.199944, 1, 1, 1, 1, 1,
-1.186608, -0.9301617, -1.241733, 1, 1, 1, 1, 1,
-1.184758, 0.9909925, -1.390395, 1, 1, 1, 1, 1,
-1.177919, -1.533699, -2.156446, 1, 1, 1, 1, 1,
-1.177868, 0.5822934, -0.3565274, 1, 1, 1, 1, 1,
-1.175894, -0.9491453, -2.459348, 1, 1, 1, 1, 1,
-1.171445, -1.803422, -2.292069, 1, 1, 1, 1, 1,
-1.165984, 0.9051826, 0.6127965, 1, 1, 1, 1, 1,
-1.159744, 0.182298, -3.231278, 1, 1, 1, 1, 1,
-1.15736, 1.341165, -0.2489287, 1, 1, 1, 1, 1,
-1.156167, 0.1458721, -0.7319955, 1, 1, 1, 1, 1,
-1.146839, -0.9784222, -3.557959, 1, 1, 1, 1, 1,
-1.146456, -0.8842883, -2.692331, 1, 1, 1, 1, 1,
-1.1397, 0.1039462, -2.819486, 1, 1, 1, 1, 1,
-1.138283, -0.3985092, -3.181054, 1, 1, 1, 1, 1,
-1.136367, 0.09088258, -3.484273, 0, 0, 1, 1, 1,
-1.132565, -0.2696548, -2.584659, 1, 0, 0, 1, 1,
-1.123616, 0.02579509, -2.518251, 1, 0, 0, 1, 1,
-1.122916, 1.1022, -1.477336, 1, 0, 0, 1, 1,
-1.121329, -0.05876365, -2.348436, 1, 0, 0, 1, 1,
-1.118744, 1.177882, -2.141136, 1, 0, 0, 1, 1,
-1.108232, 1.760227, 0.5367723, 0, 0, 0, 1, 1,
-1.099493, 0.1122889, -1.697712, 0, 0, 0, 1, 1,
-1.099142, -2.397731, -2.267373, 0, 0, 0, 1, 1,
-1.068544, 0.6081661, -0.8609983, 0, 0, 0, 1, 1,
-1.068449, -1.616617, -1.979372, 0, 0, 0, 1, 1,
-1.048584, 0.5875305, 0.2995896, 0, 0, 0, 1, 1,
-1.037676, -1.05495, -1.956249, 0, 0, 0, 1, 1,
-1.035336, 0.549777, -0.4150611, 1, 1, 1, 1, 1,
-1.032855, -1.083023, -1.992867, 1, 1, 1, 1, 1,
-1.027385, -1.800904, -2.642779, 1, 1, 1, 1, 1,
-1.022591, 1.496258, -1.26831, 1, 1, 1, 1, 1,
-0.9944102, -0.6948926, -2.312394, 1, 1, 1, 1, 1,
-0.991861, 0.2978159, -1.087408, 1, 1, 1, 1, 1,
-0.9886499, 0.3135847, -0.7097062, 1, 1, 1, 1, 1,
-0.986172, 1.467324, -0.2384922, 1, 1, 1, 1, 1,
-0.9810981, 0.1210759, -1.417533, 1, 1, 1, 1, 1,
-0.9758664, -0.2923487, -2.188742, 1, 1, 1, 1, 1,
-0.9717898, 1.123432, -0.6224887, 1, 1, 1, 1, 1,
-0.970593, -0.1019156, -3.759861, 1, 1, 1, 1, 1,
-0.9677408, 0.2721434, -0.9102702, 1, 1, 1, 1, 1,
-0.9570313, 0.3852593, -1.599686, 1, 1, 1, 1, 1,
-0.950637, 1.331073, 0.225898, 1, 1, 1, 1, 1,
-0.9489897, -0.08960734, -1.817183, 0, 0, 1, 1, 1,
-0.9465238, 0.6138338, -0.1016515, 1, 0, 0, 1, 1,
-0.944699, -0.6934948, -2.443317, 1, 0, 0, 1, 1,
-0.9443399, -0.8583105, -1.022224, 1, 0, 0, 1, 1,
-0.9419228, -1.486122, -0.9312181, 1, 0, 0, 1, 1,
-0.9415222, 0.6805791, -0.61731, 1, 0, 0, 1, 1,
-0.9370434, 0.9003149, 1.050024, 0, 0, 0, 1, 1,
-0.936857, -1.855874, -3.37365, 0, 0, 0, 1, 1,
-0.9360836, 0.4839308, -0.0539534, 0, 0, 0, 1, 1,
-0.9344532, -0.7649562, -2.75813, 0, 0, 0, 1, 1,
-0.9308786, -0.5631036, -0.5849877, 0, 0, 0, 1, 1,
-0.9275278, 1.722407, -2.68579, 0, 0, 0, 1, 1,
-0.9253761, -1.02733, 0.1394283, 0, 0, 0, 1, 1,
-0.915037, -0.272909, -2.575226, 1, 1, 1, 1, 1,
-0.9145968, -0.2696588, -2.815823, 1, 1, 1, 1, 1,
-0.9128969, -0.4732756, -2.169689, 1, 1, 1, 1, 1,
-0.9089097, -1.055553, -3.547057, 1, 1, 1, 1, 1,
-0.9031297, -1.001058, -3.353489, 1, 1, 1, 1, 1,
-0.901507, 0.7785851, -0.01996548, 1, 1, 1, 1, 1,
-0.8910695, -1.348528, -3.671195, 1, 1, 1, 1, 1,
-0.8897529, 1.47216, -0.5832514, 1, 1, 1, 1, 1,
-0.8862444, -1.022377, -2.113491, 1, 1, 1, 1, 1,
-0.8797355, -1.51935, -2.803607, 1, 1, 1, 1, 1,
-0.8786407, -0.1592195, -0.6970246, 1, 1, 1, 1, 1,
-0.8778588, 1.377912, -0.5910228, 1, 1, 1, 1, 1,
-0.877328, 0.372362, 0.5238438, 1, 1, 1, 1, 1,
-0.8722513, 0.6401972, -0.6922033, 1, 1, 1, 1, 1,
-0.8719519, 1.658943, -2.412175, 1, 1, 1, 1, 1,
-0.8648667, 0.04641975, -2.371753, 0, 0, 1, 1, 1,
-0.8554537, -0.7561181, -1.918562, 1, 0, 0, 1, 1,
-0.8543239, 0.5213415, -0.9808372, 1, 0, 0, 1, 1,
-0.8500131, 0.5157755, -1.391084, 1, 0, 0, 1, 1,
-0.8482565, -0.6339371, -1.56003, 1, 0, 0, 1, 1,
-0.8430325, 1.471192, -0.07134688, 1, 0, 0, 1, 1,
-0.8360932, -2.570283, -2.356821, 0, 0, 0, 1, 1,
-0.8336729, 1.373103, -0.9291028, 0, 0, 0, 1, 1,
-0.829042, 0.02771007, -1.776763, 0, 0, 0, 1, 1,
-0.8288835, 1.39765, -0.2523915, 0, 0, 0, 1, 1,
-0.8247292, -0.5293781, -3.007015, 0, 0, 0, 1, 1,
-0.8178124, -0.5626081, -0.1339126, 0, 0, 0, 1, 1,
-0.8113049, -0.3652402, -2.907269, 0, 0, 0, 1, 1,
-0.8071361, 0.500515, -1.409529, 1, 1, 1, 1, 1,
-0.8049099, -0.04272409, -1.07721, 1, 1, 1, 1, 1,
-0.7996321, 1.172896, -0.1160354, 1, 1, 1, 1, 1,
-0.7994731, 0.8009118, 0.1863504, 1, 1, 1, 1, 1,
-0.7970317, 1.112402, -0.5720168, 1, 1, 1, 1, 1,
-0.7908069, 0.2463393, -1.017088, 1, 1, 1, 1, 1,
-0.7889021, 1.214579, -0.05813049, 1, 1, 1, 1, 1,
-0.7859842, 1.546787, -2.206064, 1, 1, 1, 1, 1,
-0.7858441, -1.440165, -4.682572, 1, 1, 1, 1, 1,
-0.7791467, -0.5802115, -2.422309, 1, 1, 1, 1, 1,
-0.772733, 0.9480506, 1.08338, 1, 1, 1, 1, 1,
-0.7703835, 1.063494, -1.523893, 1, 1, 1, 1, 1,
-0.7702736, -0.2931558, -1.532784, 1, 1, 1, 1, 1,
-0.7691052, 0.1492682, -0.8012809, 1, 1, 1, 1, 1,
-0.7603235, -0.6113538, -0.9035499, 1, 1, 1, 1, 1,
-0.7595236, 0.6740384, 0.9172855, 0, 0, 1, 1, 1,
-0.74793, 0.4040711, -1.200426, 1, 0, 0, 1, 1,
-0.7424565, 0.6648891, -1.122608, 1, 0, 0, 1, 1,
-0.7409756, 0.6515052, -1.342088, 1, 0, 0, 1, 1,
-0.739895, 1.678404, -0.1454299, 1, 0, 0, 1, 1,
-0.7370982, 1.659565, -0.8838688, 1, 0, 0, 1, 1,
-0.7322022, 1.388361, -0.9402934, 0, 0, 0, 1, 1,
-0.7288694, 0.581808, -0.7350255, 0, 0, 0, 1, 1,
-0.7285815, -0.525875, -4.22195, 0, 0, 0, 1, 1,
-0.719206, -0.1338534, -2.270374, 0, 0, 0, 1, 1,
-0.7141404, -0.5205512, -1.390265, 0, 0, 0, 1, 1,
-0.7056748, -0.06901461, -0.03383195, 0, 0, 0, 1, 1,
-0.7023478, 0.1883036, -2.179793, 0, 0, 0, 1, 1,
-0.6994552, 1.47268, -1.554698, 1, 1, 1, 1, 1,
-0.6988651, 0.07203259, -1.870731, 1, 1, 1, 1, 1,
-0.6967604, 0.9324301, -1.324373, 1, 1, 1, 1, 1,
-0.696515, 0.3286071, -0.979107, 1, 1, 1, 1, 1,
-0.6925733, -0.5239854, -2.298463, 1, 1, 1, 1, 1,
-0.6888617, 0.6571211, -0.2497628, 1, 1, 1, 1, 1,
-0.6815207, 2.219855, -2.022293, 1, 1, 1, 1, 1,
-0.6794905, 2.930958, -1.550533, 1, 1, 1, 1, 1,
-0.6781893, 0.06300861, -1.318974, 1, 1, 1, 1, 1,
-0.6771169, 0.4906255, -2.17142, 1, 1, 1, 1, 1,
-0.6742806, 0.4745235, -0.2626063, 1, 1, 1, 1, 1,
-0.6721673, -1.054769, -2.461625, 1, 1, 1, 1, 1,
-0.6652333, 0.4481303, -0.2476915, 1, 1, 1, 1, 1,
-0.6616733, -1.016182, -1.688974, 1, 1, 1, 1, 1,
-0.6555694, 0.4317203, 0.2766653, 1, 1, 1, 1, 1,
-0.6549219, 0.1443712, -2.205036, 0, 0, 1, 1, 1,
-0.654824, -0.8117977, -3.546973, 1, 0, 0, 1, 1,
-0.6532864, -0.3005356, -1.998233, 1, 0, 0, 1, 1,
-0.6531315, -0.3831283, -1.725187, 1, 0, 0, 1, 1,
-0.651123, 0.06557066, -1.447529, 1, 0, 0, 1, 1,
-0.6480358, 0.2814291, -0.2169859, 1, 0, 0, 1, 1,
-0.6470143, 0.3976908, -1.63219, 0, 0, 0, 1, 1,
-0.644972, 1.170551, -0.3281959, 0, 0, 0, 1, 1,
-0.642994, -0.8509909, -0.7907288, 0, 0, 0, 1, 1,
-0.6305635, -1.250398, -3.426638, 0, 0, 0, 1, 1,
-0.6294025, 1.850259, -0.2868832, 0, 0, 0, 1, 1,
-0.6239572, 1.238487, 0.5275196, 0, 0, 0, 1, 1,
-0.6187947, 1.376091, -0.9407265, 0, 0, 0, 1, 1,
-0.6184569, -0.5573079, -2.90496, 1, 1, 1, 1, 1,
-0.6160434, 0.8475721, -0.7761579, 1, 1, 1, 1, 1,
-0.6141578, -1.000409, -3.11688, 1, 1, 1, 1, 1,
-0.6131113, -2.516434, -2.572639, 1, 1, 1, 1, 1,
-0.6111796, 0.1273043, -2.371096, 1, 1, 1, 1, 1,
-0.6091634, -1.640955, -3.300492, 1, 1, 1, 1, 1,
-0.6072195, 0.5571272, -0.7683299, 1, 1, 1, 1, 1,
-0.6044669, -0.8138876, -3.135526, 1, 1, 1, 1, 1,
-0.5931659, 1.72034, -1.659618, 1, 1, 1, 1, 1,
-0.5922219, 0.4135055, -2.136931, 1, 1, 1, 1, 1,
-0.5781692, -0.2230505, -0.9987999, 1, 1, 1, 1, 1,
-0.5775015, -0.5193174, -1.572163, 1, 1, 1, 1, 1,
-0.5695117, -0.4520647, -1.846447, 1, 1, 1, 1, 1,
-0.5666769, 1.248175, -1.107126, 1, 1, 1, 1, 1,
-0.5657513, 0.2494462, -2.10642, 1, 1, 1, 1, 1,
-0.5617337, -1.589935, -2.766745, 0, 0, 1, 1, 1,
-0.560209, -1.80313, -1.913421, 1, 0, 0, 1, 1,
-0.557908, 0.3368595, 0.06140884, 1, 0, 0, 1, 1,
-0.5532353, 0.5083017, -0.6073752, 1, 0, 0, 1, 1,
-0.5474731, 0.08096636, -1.686406, 1, 0, 0, 1, 1,
-0.5461386, -0.5087752, -0.09643517, 1, 0, 0, 1, 1,
-0.544802, -0.5703218, -1.838533, 0, 0, 0, 1, 1,
-0.5439758, 0.7060189, -0.1967249, 0, 0, 0, 1, 1,
-0.5366176, 1.90256, -1.961245, 0, 0, 0, 1, 1,
-0.5355758, 0.9638359, -1.60783, 0, 0, 0, 1, 1,
-0.5353709, -2.167498, -4.071341, 0, 0, 0, 1, 1,
-0.530457, -1.570464, -3.043398, 0, 0, 0, 1, 1,
-0.5289617, 0.980758, -1.568238, 0, 0, 0, 1, 1,
-0.5277087, -0.3737424, -1.090914, 1, 1, 1, 1, 1,
-0.5256807, -2.695011, -6.08225, 1, 1, 1, 1, 1,
-0.519594, 0.7322826, 1.141109, 1, 1, 1, 1, 1,
-0.5129506, 0.9534643, -0.6796085, 1, 1, 1, 1, 1,
-0.4998572, 1.893853, -0.4081216, 1, 1, 1, 1, 1,
-0.4996571, -0.1482123, -2.611143, 1, 1, 1, 1, 1,
-0.4943545, 0.1177452, -0.8917296, 1, 1, 1, 1, 1,
-0.4935147, -0.3192854, -1.813381, 1, 1, 1, 1, 1,
-0.4895245, -0.03980663, -1.555843, 1, 1, 1, 1, 1,
-0.4857738, 1.376477, -0.7154831, 1, 1, 1, 1, 1,
-0.4785588, 0.6096197, -0.3735516, 1, 1, 1, 1, 1,
-0.4760588, 0.1333017, -1.786757, 1, 1, 1, 1, 1,
-0.475809, 0.4105702, -0.166122, 1, 1, 1, 1, 1,
-0.4746425, 1.140456, 0.1022159, 1, 1, 1, 1, 1,
-0.473432, -0.7488629, -4.216012, 1, 1, 1, 1, 1,
-0.4702752, -0.06169941, -2.799235, 0, 0, 1, 1, 1,
-0.4664564, 0.9811287, -0.4480133, 1, 0, 0, 1, 1,
-0.4610001, -0.08104203, -2.068129, 1, 0, 0, 1, 1,
-0.4590023, 1.073014, -0.8855362, 1, 0, 0, 1, 1,
-0.4573307, -0.4406732, -2.037539, 1, 0, 0, 1, 1,
-0.4557362, -0.4944208, -3.887828, 1, 0, 0, 1, 1,
-0.4544212, 0.8799189, -1.750998, 0, 0, 0, 1, 1,
-0.4506254, 0.4224306, 0.5016856, 0, 0, 0, 1, 1,
-0.444296, -1.631877, -4.20592, 0, 0, 0, 1, 1,
-0.4416474, -1.760323, -1.125185, 0, 0, 0, 1, 1,
-0.4373786, -0.822458, -4.149951, 0, 0, 0, 1, 1,
-0.4355762, -0.8066586, -1.415392, 0, 0, 0, 1, 1,
-0.4351149, -1.199018, -2.841819, 0, 0, 0, 1, 1,
-0.4305605, 0.9591408, 0.06522581, 1, 1, 1, 1, 1,
-0.4286067, -0.7908025, -1.843722, 1, 1, 1, 1, 1,
-0.4249686, -0.6247559, -1.212096, 1, 1, 1, 1, 1,
-0.4197217, -0.2103754, -1.885745, 1, 1, 1, 1, 1,
-0.4185017, 1.938051, 0.03618601, 1, 1, 1, 1, 1,
-0.4183446, 2.489883, 0.5971627, 1, 1, 1, 1, 1,
-0.4167065, 0.8010276, -1.425527, 1, 1, 1, 1, 1,
-0.4135823, -1.928062, -1.119446, 1, 1, 1, 1, 1,
-0.4119608, -0.2382378, -1.21332, 1, 1, 1, 1, 1,
-0.4090315, -1.937803, 0.3615223, 1, 1, 1, 1, 1,
-0.4071328, -1.077565, -4.046686, 1, 1, 1, 1, 1,
-0.4061692, 0.2232181, -1.340925, 1, 1, 1, 1, 1,
-0.3962797, -1.036439, -4.854122, 1, 1, 1, 1, 1,
-0.3923874, 0.2756038, -0.5239362, 1, 1, 1, 1, 1,
-0.3883369, 0.3069769, -1.966369, 1, 1, 1, 1, 1,
-0.3877687, -0.1643295, -2.738758, 0, 0, 1, 1, 1,
-0.3874714, 0.1960735, -2.296676, 1, 0, 0, 1, 1,
-0.3853627, 2.479035, 1.144618, 1, 0, 0, 1, 1,
-0.3822989, -0.1361513, -0.7920366, 1, 0, 0, 1, 1,
-0.3799722, -0.4048769, -2.671429, 1, 0, 0, 1, 1,
-0.378827, 0.3825974, -2.339569, 1, 0, 0, 1, 1,
-0.3782677, 0.4300111, -1.149667, 0, 0, 0, 1, 1,
-0.3715121, -1.605466, -4.081057, 0, 0, 0, 1, 1,
-0.3652307, -1.045478, -1.483572, 0, 0, 0, 1, 1,
-0.3597869, -1.021663, -3.538991, 0, 0, 0, 1, 1,
-0.3576127, 0.1466719, -0.4954391, 0, 0, 0, 1, 1,
-0.3539664, -1.26585, -1.799889, 0, 0, 0, 1, 1,
-0.3526634, 0.7503164, -0.7440991, 0, 0, 0, 1, 1,
-0.3515839, -0.1887048, -1.727784, 1, 1, 1, 1, 1,
-0.3507216, 1.412087, 0.06405053, 1, 1, 1, 1, 1,
-0.3493158, 0.8211951, -2.854175, 1, 1, 1, 1, 1,
-0.3435661, 0.8696748, -0.8181499, 1, 1, 1, 1, 1,
-0.3389133, 0.5346888, -0.5316278, 1, 1, 1, 1, 1,
-0.338133, 1.528503, -0.1154233, 1, 1, 1, 1, 1,
-0.333481, -0.5891001, -2.77086, 1, 1, 1, 1, 1,
-0.3302908, 0.6795793, -0.7553084, 1, 1, 1, 1, 1,
-0.3254916, 0.4780386, 0.5818046, 1, 1, 1, 1, 1,
-0.3253714, 0.3640157, -0.6514738, 1, 1, 1, 1, 1,
-0.3250978, 1.849382, -0.8138188, 1, 1, 1, 1, 1,
-0.3238842, -1.709609, -2.41161, 1, 1, 1, 1, 1,
-0.320497, -0.3635142, -3.251778, 1, 1, 1, 1, 1,
-0.3200342, 0.8176414, -1.172957, 1, 1, 1, 1, 1,
-0.3172143, 2.189946, -0.9153123, 1, 1, 1, 1, 1,
-0.3149877, -1.912025, -3.829763, 0, 0, 1, 1, 1,
-0.3113838, -2.115989, -3.290925, 1, 0, 0, 1, 1,
-0.3094393, -0.614976, -3.25336, 1, 0, 0, 1, 1,
-0.3065472, 0.5645986, -1.11468, 1, 0, 0, 1, 1,
-0.3060032, -0.9122531, -4.209373, 1, 0, 0, 1, 1,
-0.3049198, 2.010798, -0.2515426, 1, 0, 0, 1, 1,
-0.3037074, 1.449874, -1.324692, 0, 0, 0, 1, 1,
-0.3014345, -0.2891871, -1.152595, 0, 0, 0, 1, 1,
-0.301077, -0.3600499, -2.605642, 0, 0, 0, 1, 1,
-0.3005474, -0.7379228, -3.162214, 0, 0, 0, 1, 1,
-0.2983353, -0.989641, -2.320267, 0, 0, 0, 1, 1,
-0.2969702, 0.4348369, 0.1032787, 0, 0, 0, 1, 1,
-0.2923262, 0.1867141, -1.986693, 0, 0, 0, 1, 1,
-0.2915646, -1.295891, -1.656011, 1, 1, 1, 1, 1,
-0.2895038, -0.4345078, -3.173019, 1, 1, 1, 1, 1,
-0.2884811, -0.1910862, -2.044691, 1, 1, 1, 1, 1,
-0.2868267, 1.483555, -0.3508196, 1, 1, 1, 1, 1,
-0.2860515, 0.257599, 0.9376497, 1, 1, 1, 1, 1,
-0.2848856, -1.464163, -5.523673, 1, 1, 1, 1, 1,
-0.2829396, -1.179904, -3.164586, 1, 1, 1, 1, 1,
-0.2818455, -1.138783, -3.771267, 1, 1, 1, 1, 1,
-0.2747612, 0.7669642, -0.9383394, 1, 1, 1, 1, 1,
-0.2722196, -0.8298985, -3.952131, 1, 1, 1, 1, 1,
-0.2715172, -2.323849, -2.832538, 1, 1, 1, 1, 1,
-0.2702996, 0.5566626, -1.518014, 1, 1, 1, 1, 1,
-0.2641697, 1.00878, -1.432805, 1, 1, 1, 1, 1,
-0.2630908, -0.3782091, -2.375671, 1, 1, 1, 1, 1,
-0.2622394, 0.09891302, -0.6084267, 1, 1, 1, 1, 1,
-0.2621802, 0.1083149, -1.629742, 0, 0, 1, 1, 1,
-0.2583118, -1.348778, -1.831962, 1, 0, 0, 1, 1,
-0.2576778, -2.698646, -3.750288, 1, 0, 0, 1, 1,
-0.2549825, -0.3460491, -1.9109, 1, 0, 0, 1, 1,
-0.2535935, -0.5392795, -2.63666, 1, 0, 0, 1, 1,
-0.2525966, -0.8810468, -2.48159, 1, 0, 0, 1, 1,
-0.2517817, -2.086085, -2.92258, 0, 0, 0, 1, 1,
-0.2445692, -0.2959545, -3.25152, 0, 0, 0, 1, 1,
-0.2430162, -0.1505207, -2.688319, 0, 0, 0, 1, 1,
-0.2343585, 0.1872675, -1.449814, 0, 0, 0, 1, 1,
-0.2339336, 1.185274, 0.699049, 0, 0, 0, 1, 1,
-0.2333965, -0.5930049, -3.237566, 0, 0, 0, 1, 1,
-0.2318562, 0.639318, -0.5890822, 0, 0, 0, 1, 1,
-0.231232, -0.3299663, -1.90789, 1, 1, 1, 1, 1,
-0.2310028, 1.652818, 1.470294, 1, 1, 1, 1, 1,
-0.2261269, 0.5752142, -1.207961, 1, 1, 1, 1, 1,
-0.2252015, 0.1318268, 1.229585, 1, 1, 1, 1, 1,
-0.2217612, -1.421111, -2.938011, 1, 1, 1, 1, 1,
-0.2200452, 2.646955, -0.2331156, 1, 1, 1, 1, 1,
-0.2191861, -0.1480505, -0.5933307, 1, 1, 1, 1, 1,
-0.2150356, 2.203959, -2.682725, 1, 1, 1, 1, 1,
-0.2142628, 0.01443025, -1.128305, 1, 1, 1, 1, 1,
-0.2114846, -0.5355459, -1.50106, 1, 1, 1, 1, 1,
-0.2102522, 1.025549, -0.5670133, 1, 1, 1, 1, 1,
-0.205142, 0.6068378, 1.348484, 1, 1, 1, 1, 1,
-0.2006385, -0.09779304, -2.054692, 1, 1, 1, 1, 1,
-0.1976847, 0.1057501, -1.707925, 1, 1, 1, 1, 1,
-0.1950782, -0.008650378, -0.607531, 1, 1, 1, 1, 1,
-0.1948217, -0.3861076, -0.1563806, 0, 0, 1, 1, 1,
-0.1942311, -0.584292, -1.792442, 1, 0, 0, 1, 1,
-0.1890987, 1.494809, -1.030552, 1, 0, 0, 1, 1,
-0.1868705, 0.1314497, -1.563748, 1, 0, 0, 1, 1,
-0.1828498, -0.6900195, -2.036351, 1, 0, 0, 1, 1,
-0.1814584, 0.4553897, -0.9019196, 1, 0, 0, 1, 1,
-0.1809436, 1.359079, 1.450715, 0, 0, 0, 1, 1,
-0.1767822, 1.747382, -0.7624337, 0, 0, 0, 1, 1,
-0.1745587, -0.337145, -3.012253, 0, 0, 0, 1, 1,
-0.1731583, 0.140301, -0.8018571, 0, 0, 0, 1, 1,
-0.1693238, -0.5022698, -3.301208, 0, 0, 0, 1, 1,
-0.1690348, 0.4411917, -0.7549436, 0, 0, 0, 1, 1,
-0.1653821, -0.541659, -3.190497, 0, 0, 0, 1, 1,
-0.1645885, 1.837105, -0.1236893, 1, 1, 1, 1, 1,
-0.1560771, 0.1705638, -0.5862519, 1, 1, 1, 1, 1,
-0.1506691, 1.318304, 0.6004816, 1, 1, 1, 1, 1,
-0.1500058, 0.9134247, -0.6516778, 1, 1, 1, 1, 1,
-0.1488872, 1.302572, 0.4342746, 1, 1, 1, 1, 1,
-0.1472563, 1.088246, 0.3708457, 1, 1, 1, 1, 1,
-0.1436993, 0.8454711, 0.09121136, 1, 1, 1, 1, 1,
-0.1436093, 0.1849871, -1.857524, 1, 1, 1, 1, 1,
-0.1433464, 0.9209107, -0.5952783, 1, 1, 1, 1, 1,
-0.1400279, 1.096297, -0.06222714, 1, 1, 1, 1, 1,
-0.1398569, -1.947498, -2.670022, 1, 1, 1, 1, 1,
-0.1398353, -0.9486673, -3.820646, 1, 1, 1, 1, 1,
-0.1361583, 0.4511184, -1.461612, 1, 1, 1, 1, 1,
-0.1360874, -0.5342796, -2.26462, 1, 1, 1, 1, 1,
-0.1337602, 0.7884819, -0.5184578, 1, 1, 1, 1, 1,
-0.1321887, -0.8853481, -2.571831, 0, 0, 1, 1, 1,
-0.1318362, -0.7051612, -2.633019, 1, 0, 0, 1, 1,
-0.1308726, -1.388561, -2.766484, 1, 0, 0, 1, 1,
-0.1306365, 1.366022, -1.320814, 1, 0, 0, 1, 1,
-0.1293904, -0.4270834, -2.605768, 1, 0, 0, 1, 1,
-0.1280943, -0.594442, -2.413966, 1, 0, 0, 1, 1,
-0.1262753, 0.8465997, -0.9429862, 0, 0, 0, 1, 1,
-0.1201995, 1.210575, 1.191743, 0, 0, 0, 1, 1,
-0.1180783, -0.7175216, -3.791555, 0, 0, 0, 1, 1,
-0.1137181, -1.733089, -2.487612, 0, 0, 0, 1, 1,
-0.1133145, -0.05724654, -1.767445, 0, 0, 0, 1, 1,
-0.1111235, 0.003008108, -1.106574, 0, 0, 0, 1, 1,
-0.1078105, 0.03417112, -1.45701, 0, 0, 0, 1, 1,
-0.1034438, 0.7910638, -0.3651961, 1, 1, 1, 1, 1,
-0.1032729, 0.2962673, -0.7282824, 1, 1, 1, 1, 1,
-0.1031212, -0.6016147, -2.407722, 1, 1, 1, 1, 1,
-0.09966932, 0.4616349, 1.381912, 1, 1, 1, 1, 1,
-0.09739296, 0.9319978, 0.1234455, 1, 1, 1, 1, 1,
-0.09686479, 0.3604888, -1.793439, 1, 1, 1, 1, 1,
-0.09666314, 0.2370329, -0.5577391, 1, 1, 1, 1, 1,
-0.09138421, 2.314716, -0.08135699, 1, 1, 1, 1, 1,
-0.0902935, -0.2833906, -3.269617, 1, 1, 1, 1, 1,
-0.08988962, -0.2653084, -2.265162, 1, 1, 1, 1, 1,
-0.08757396, -0.9981527, -3.679264, 1, 1, 1, 1, 1,
-0.08666667, 0.5147275, -0.3656212, 1, 1, 1, 1, 1,
-0.08513427, 1.224565, 1.36873, 1, 1, 1, 1, 1,
-0.08188995, -0.2090934, -4.040982, 1, 1, 1, 1, 1,
-0.08084397, -0.01549573, -2.169881, 1, 1, 1, 1, 1,
-0.08018283, -0.5659861, -3.199885, 0, 0, 1, 1, 1,
-0.08016591, 0.6704842, -0.5301106, 1, 0, 0, 1, 1,
-0.07486738, -0.06499223, -2.59885, 1, 0, 0, 1, 1,
-0.07075566, 0.1753659, 0.1370757, 1, 0, 0, 1, 1,
-0.0623052, -0.5578567, -1.623661, 1, 0, 0, 1, 1,
-0.06217241, 0.8846555, -1.131359, 1, 0, 0, 1, 1,
-0.06068373, -1.849082, -2.655155, 0, 0, 0, 1, 1,
-0.05655002, 0.2674652, -1.931142, 0, 0, 0, 1, 1,
-0.052151, 0.8557866, 1.27401, 0, 0, 0, 1, 1,
-0.05036782, -0.4370231, -1.360265, 0, 0, 0, 1, 1,
-0.04517249, 0.4758911, 0.4600469, 0, 0, 0, 1, 1,
-0.04078182, -1.178731, -3.974117, 0, 0, 0, 1, 1,
-0.037584, -0.4910378, -4.615808, 0, 0, 0, 1, 1,
-0.03214407, -0.7291259, -3.923689, 1, 1, 1, 1, 1,
-0.0312898, 1.059761, 0.3782825, 1, 1, 1, 1, 1,
-0.0291526, 0.6741877, 1.479907, 1, 1, 1, 1, 1,
-0.02911993, -0.07427814, -1.937189, 1, 1, 1, 1, 1,
-0.02372532, 0.6740679, -0.1853891, 1, 1, 1, 1, 1,
-0.01803472, -0.7196589, -3.337098, 1, 1, 1, 1, 1,
-0.01761872, 0.01382631, -0.9431128, 1, 1, 1, 1, 1,
-0.01466787, 2.175933, 0.8297527, 1, 1, 1, 1, 1,
-0.01115176, -0.5931678, -3.575479, 1, 1, 1, 1, 1,
-0.008744303, 0.9431815, -1.575977, 1, 1, 1, 1, 1,
-0.008154348, 0.8184209, -0.8504452, 1, 1, 1, 1, 1,
-0.007438423, 0.639102, -0.1480724, 1, 1, 1, 1, 1,
-0.006216549, -0.4199781, -3.403576, 1, 1, 1, 1, 1,
0.003535218, -0.838987, 4.239244, 1, 1, 1, 1, 1,
0.005350004, 1.369985, -0.1607308, 1, 1, 1, 1, 1,
0.006123476, -0.2667183, 2.091574, 0, 0, 1, 1, 1,
0.007259381, -1.305524, 3.03004, 1, 0, 0, 1, 1,
0.01129532, -1.158514, 2.729713, 1, 0, 0, 1, 1,
0.0116367, 3.161941, -0.8036007, 1, 0, 0, 1, 1,
0.0117854, 0.01983895, 0.7114201, 1, 0, 0, 1, 1,
0.01418826, -0.2465709, 2.750122, 1, 0, 0, 1, 1,
0.02220702, 2.633662, 0.5275174, 0, 0, 0, 1, 1,
0.02456801, 1.888109, 1.101539, 0, 0, 0, 1, 1,
0.02569032, -0.2780488, 3.764081, 0, 0, 0, 1, 1,
0.02852962, 0.5900283, -0.5206638, 0, 0, 0, 1, 1,
0.02889249, -0.7185352, 4.287398, 0, 0, 0, 1, 1,
0.03119809, -0.6301695, 3.529623, 0, 0, 0, 1, 1,
0.03225156, 0.4403585, -1.309085, 0, 0, 0, 1, 1,
0.04116357, 1.522585, -0.5679314, 1, 1, 1, 1, 1,
0.04476197, 1.113587, 2.523103, 1, 1, 1, 1, 1,
0.04534658, 1.524131, 1.012921, 1, 1, 1, 1, 1,
0.04726243, 0.8323415, 1.019453, 1, 1, 1, 1, 1,
0.05326364, 0.3184172, 0.4066235, 1, 1, 1, 1, 1,
0.05635077, -1.341865, 4.425077, 1, 1, 1, 1, 1,
0.05886685, -0.2435118, 3.900772, 1, 1, 1, 1, 1,
0.06260902, -0.2015623, 3.538924, 1, 1, 1, 1, 1,
0.06435031, 1.164959, 0.1066066, 1, 1, 1, 1, 1,
0.06647459, 0.6241644, -0.1554806, 1, 1, 1, 1, 1,
0.06896767, -0.2812472, 2.422617, 1, 1, 1, 1, 1,
0.06962918, -1.75727, 3.179307, 1, 1, 1, 1, 1,
0.07131136, 0.685903, 0.7427538, 1, 1, 1, 1, 1,
0.07530876, 1.035447, -0.5232334, 1, 1, 1, 1, 1,
0.08404817, -0.7802987, 3.578335, 1, 1, 1, 1, 1,
0.085548, 0.7348981, 0.2510651, 0, 0, 1, 1, 1,
0.08630981, 0.1523125, 1.303762, 1, 0, 0, 1, 1,
0.08930036, 1.510264, 0.1475518, 1, 0, 0, 1, 1,
0.0899342, -0.5206014, 3.116654, 1, 0, 0, 1, 1,
0.09432585, -0.6314542, 1.870128, 1, 0, 0, 1, 1,
0.09608261, -0.2052034, 3.968344, 1, 0, 0, 1, 1,
0.09989475, -0.24208, 2.122922, 0, 0, 0, 1, 1,
0.1009416, 0.08315431, 0.1087977, 0, 0, 0, 1, 1,
0.1063468, 1.863349, -0.5513341, 0, 0, 0, 1, 1,
0.1071503, 0.02194355, 0.7708481, 0, 0, 0, 1, 1,
0.1083226, -0.1334771, -0.168499, 0, 0, 0, 1, 1,
0.1090261, 0.3587553, 0.5835651, 0, 0, 0, 1, 1,
0.1143957, 0.4294273, 0.2477626, 0, 0, 0, 1, 1,
0.1202247, -0.199989, 4.255094, 1, 1, 1, 1, 1,
0.1211374, 0.7494945, 1.004673, 1, 1, 1, 1, 1,
0.1213752, -1.198765, 2.201936, 1, 1, 1, 1, 1,
0.1243644, -1.307592, 2.184269, 1, 1, 1, 1, 1,
0.1273587, 0.01439975, 2.652507, 1, 1, 1, 1, 1,
0.128514, 1.197426, 1.196687, 1, 1, 1, 1, 1,
0.1297635, 0.5766039, 0.6209573, 1, 1, 1, 1, 1,
0.1298944, 1.254423, 0.6488891, 1, 1, 1, 1, 1,
0.1319837, -0.1533331, 2.192802, 1, 1, 1, 1, 1,
0.1396987, -0.155329, 2.55255, 1, 1, 1, 1, 1,
0.1397343, 0.1070424, 0.5578971, 1, 1, 1, 1, 1,
0.1442446, -1.356985, 2.266671, 1, 1, 1, 1, 1,
0.1458136, 1.658804, -1.362719, 1, 1, 1, 1, 1,
0.148216, 0.3336947, 0.09334292, 1, 1, 1, 1, 1,
0.150526, 1.569056, 0.676436, 1, 1, 1, 1, 1,
0.1521074, 1.674459, 1.688655, 0, 0, 1, 1, 1,
0.157693, -0.9194768, 2.795318, 1, 0, 0, 1, 1,
0.1591484, 1.628036, -0.9078822, 1, 0, 0, 1, 1,
0.1602522, -2.06341, 5.021616, 1, 0, 0, 1, 1,
0.1641018, 1.576291, 0.1991248, 1, 0, 0, 1, 1,
0.1721446, -0.1413933, 2.989705, 1, 0, 0, 1, 1,
0.1770157, -0.3585988, 1.91055, 0, 0, 0, 1, 1,
0.1833466, 0.8097174, 0.1644205, 0, 0, 0, 1, 1,
0.1844423, -0.1021815, 2.459213, 0, 0, 0, 1, 1,
0.189266, 0.09510147, 0.9543453, 0, 0, 0, 1, 1,
0.192867, 0.7586726, -0.04803441, 0, 0, 0, 1, 1,
0.2029288, -1.143841, 0.5942212, 0, 0, 0, 1, 1,
0.2073866, -1.087645, 3.90847, 0, 0, 0, 1, 1,
0.2094655, -2.126028, 2.558598, 1, 1, 1, 1, 1,
0.2101706, 0.02780985, 0.5109588, 1, 1, 1, 1, 1,
0.2188393, -0.1559272, 3.737766, 1, 1, 1, 1, 1,
0.2191819, -0.1238874, 2.323576, 1, 1, 1, 1, 1,
0.2200157, -0.5469868, 3.274435, 1, 1, 1, 1, 1,
0.2204581, 0.5495209, 0.8834536, 1, 1, 1, 1, 1,
0.2211057, -0.8593712, 1.72383, 1, 1, 1, 1, 1,
0.2256442, -1.35112, 3.462203, 1, 1, 1, 1, 1,
0.2303802, -0.3593129, 2.63167, 1, 1, 1, 1, 1,
0.231725, -2.121678, 2.785816, 1, 1, 1, 1, 1,
0.2374997, 1.994263, -1.578756, 1, 1, 1, 1, 1,
0.2419006, -1.864816, 2.707992, 1, 1, 1, 1, 1,
0.2443323, 0.639768, 1.475794, 1, 1, 1, 1, 1,
0.2461534, -2.210808, 3.52204, 1, 1, 1, 1, 1,
0.2505703, 0.9977523, 1.28441, 1, 1, 1, 1, 1,
0.2570777, 1.306745, -1.341075, 0, 0, 1, 1, 1,
0.2583346, -0.2415202, 1.493369, 1, 0, 0, 1, 1,
0.2588843, 0.1668304, 0.593692, 1, 0, 0, 1, 1,
0.2596596, 1.52474, -1.671371, 1, 0, 0, 1, 1,
0.2616, -0.01130495, -0.8070184, 1, 0, 0, 1, 1,
0.264273, -0.07108782, 2.776039, 1, 0, 0, 1, 1,
0.2651455, 1.174946, 1.407981, 0, 0, 0, 1, 1,
0.2673812, -0.3732134, 4.704008, 0, 0, 0, 1, 1,
0.2678234, -0.4975538, 2.581791, 0, 0, 0, 1, 1,
0.2682128, 0.3397727, 0.8692976, 0, 0, 0, 1, 1,
0.2687305, -0.5556994, 1.803957, 0, 0, 0, 1, 1,
0.269249, -0.5155807, 1.438147, 0, 0, 0, 1, 1,
0.269774, -2.339698, 2.442346, 0, 0, 0, 1, 1,
0.2746516, -2.212906, 2.857871, 1, 1, 1, 1, 1,
0.2783677, 1.093826, 0.8846086, 1, 1, 1, 1, 1,
0.2801482, -0.08681652, 2.21423, 1, 1, 1, 1, 1,
0.2879578, -1.977636, 0.9462208, 1, 1, 1, 1, 1,
0.2915224, -1.495965, 1.862863, 1, 1, 1, 1, 1,
0.2921203, 1.273446, -1.427489, 1, 1, 1, 1, 1,
0.2921446, 0.8283911, 0.9159436, 1, 1, 1, 1, 1,
0.2938903, 0.9939569, 1.031258, 1, 1, 1, 1, 1,
0.2940247, 0.6640484, -0.3972668, 1, 1, 1, 1, 1,
0.2997259, -1.056869, 3.172039, 1, 1, 1, 1, 1,
0.3028514, 1.872145, 0.0976379, 1, 1, 1, 1, 1,
0.3047462, -0.2793657, 1.940263, 1, 1, 1, 1, 1,
0.3146208, 1.65182, 1.403849, 1, 1, 1, 1, 1,
0.3191505, -0.7381774, 3.917531, 1, 1, 1, 1, 1,
0.3210032, 1.946107, 0.2732311, 1, 1, 1, 1, 1,
0.321878, -0.6258816, 2.353249, 0, 0, 1, 1, 1,
0.325496, 1.854265, -0.6508327, 1, 0, 0, 1, 1,
0.3269074, 2.487464, 0.8909261, 1, 0, 0, 1, 1,
0.3281742, 1.685869, -0.4101752, 1, 0, 0, 1, 1,
0.32932, -0.4372023, 2.730595, 1, 0, 0, 1, 1,
0.3319926, -0.8688288, 2.466034, 1, 0, 0, 1, 1,
0.337789, -1.633583, 3.656119, 0, 0, 0, 1, 1,
0.3430506, 0.09593146, 0.7084245, 0, 0, 0, 1, 1,
0.3434463, 0.5615383, 0.1587388, 0, 0, 0, 1, 1,
0.3442466, -1.005557, 3.458758, 0, 0, 0, 1, 1,
0.3457635, -0.04808465, 2.210268, 0, 0, 0, 1, 1,
0.3487262, 1.341163, -0.3493288, 0, 0, 0, 1, 1,
0.3542826, -0.3195662, 3.38148, 0, 0, 0, 1, 1,
0.3673178, -0.5964509, 2.516211, 1, 1, 1, 1, 1,
0.3730664, -1.646894, 2.250821, 1, 1, 1, 1, 1,
0.3755832, 1.045515, 1.83451, 1, 1, 1, 1, 1,
0.3765293, 1.323911, 0.5029103, 1, 1, 1, 1, 1,
0.3787026, -0.1003502, 1.050091, 1, 1, 1, 1, 1,
0.3791805, -0.6920623, 0.7532201, 1, 1, 1, 1, 1,
0.3826731, -0.5543199, 4.103885, 1, 1, 1, 1, 1,
0.3833323, 0.9942624, 0.03858369, 1, 1, 1, 1, 1,
0.3896804, -0.8657218, 3.694222, 1, 1, 1, 1, 1,
0.3939991, -0.7050482, 2.511907, 1, 1, 1, 1, 1,
0.3948924, 1.145906, 0.3585973, 1, 1, 1, 1, 1,
0.395944, 0.6623556, 0.5730059, 1, 1, 1, 1, 1,
0.401757, 0.2194524, 0.6443, 1, 1, 1, 1, 1,
0.4045541, -0.5156845, 1.595385, 1, 1, 1, 1, 1,
0.4073461, 0.8943769, 0.4744142, 1, 1, 1, 1, 1,
0.4107566, -0.7968256, 3.539349, 0, 0, 1, 1, 1,
0.4158695, -0.2855511, 3.304282, 1, 0, 0, 1, 1,
0.419032, -0.2556652, 1.792642, 1, 0, 0, 1, 1,
0.4202908, 0.05825502, 0.9724266, 1, 0, 0, 1, 1,
0.420416, 0.2454302, 1.594873, 1, 0, 0, 1, 1,
0.4230912, -1.109672, 1.592474, 1, 0, 0, 1, 1,
0.4269637, 0.4331792, 1.599414, 0, 0, 0, 1, 1,
0.4305845, -0.7216178, 3.390647, 0, 0, 0, 1, 1,
0.4328946, -0.04669832, 0.601895, 0, 0, 0, 1, 1,
0.4354896, 1.179083, 1.35949, 0, 0, 0, 1, 1,
0.444514, 1.087679, 1.201183, 0, 0, 0, 1, 1,
0.4449099, 1.495184, 1.735339, 0, 0, 0, 1, 1,
0.4451382, -0.9159501, 4.172274, 0, 0, 0, 1, 1,
0.4477028, -1.959137, 3.262741, 1, 1, 1, 1, 1,
0.4540094, -0.1028336, 1.756898, 1, 1, 1, 1, 1,
0.4548929, -1.118407, 4.116514, 1, 1, 1, 1, 1,
0.4624506, 1.869879, 0.1671773, 1, 1, 1, 1, 1,
0.4630625, -0.6648735, 2.068353, 1, 1, 1, 1, 1,
0.4631132, -1.372722, 1.436863, 1, 1, 1, 1, 1,
0.4636782, 0.9092665, 0.03634347, 1, 1, 1, 1, 1,
0.4677703, -1.313818, 2.646583, 1, 1, 1, 1, 1,
0.4695704, 0.5093651, 0.3500075, 1, 1, 1, 1, 1,
0.4699988, 2.025536, 0.008589329, 1, 1, 1, 1, 1,
0.4744348, -0.4434831, 4.587256, 1, 1, 1, 1, 1,
0.4761426, -0.7250058, 2.019536, 1, 1, 1, 1, 1,
0.4773569, -0.2758022, 2.694066, 1, 1, 1, 1, 1,
0.4820522, -0.3118968, 2.669521, 1, 1, 1, 1, 1,
0.4837527, 1.041895, -0.1592103, 1, 1, 1, 1, 1,
0.4871362, 1.113734, -0.9909387, 0, 0, 1, 1, 1,
0.4948027, -0.8507425, 2.235711, 1, 0, 0, 1, 1,
0.4969933, -0.8651098, 1.694903, 1, 0, 0, 1, 1,
0.5052174, -1.006856, 3.257495, 1, 0, 0, 1, 1,
0.5069249, 0.09049532, 1.243733, 1, 0, 0, 1, 1,
0.5127766, 1.89832, 1.044528, 1, 0, 0, 1, 1,
0.515397, 0.8675752, 0.7482879, 0, 0, 0, 1, 1,
0.5191476, -0.1458655, 2.319626, 0, 0, 0, 1, 1,
0.5205475, -1.393821, 1.846576, 0, 0, 0, 1, 1,
0.5231633, -0.4908189, 2.807652, 0, 0, 0, 1, 1,
0.5238684, 0.2606801, 0.7729185, 0, 0, 0, 1, 1,
0.5269288, 0.07754701, 1.777429, 0, 0, 0, 1, 1,
0.5297622, -0.2113951, 4.333071, 0, 0, 0, 1, 1,
0.5299749, -0.05721597, 1.608116, 1, 1, 1, 1, 1,
0.5312819, 0.4427753, 1.241609, 1, 1, 1, 1, 1,
0.5352842, 0.07343872, 2.946578, 1, 1, 1, 1, 1,
0.5359001, 0.06457274, 3.227399, 1, 1, 1, 1, 1,
0.5380961, 0.006707838, 2.652499, 1, 1, 1, 1, 1,
0.5397564, 0.454051, 1.647162, 1, 1, 1, 1, 1,
0.539843, -0.859592, 2.190104, 1, 1, 1, 1, 1,
0.5429049, 1.706235, -0.5162427, 1, 1, 1, 1, 1,
0.5442502, -0.9263713, 2.338674, 1, 1, 1, 1, 1,
0.5498268, -1.73699, 3.908224, 1, 1, 1, 1, 1,
0.5508406, -0.04471437, 0.5598537, 1, 1, 1, 1, 1,
0.5555848, -0.9613764, 4.224635, 1, 1, 1, 1, 1,
0.5556754, 1.617491, -1.101828, 1, 1, 1, 1, 1,
0.5602205, -0.7569517, 2.769054, 1, 1, 1, 1, 1,
0.5611652, -1.377577, 2.79277, 1, 1, 1, 1, 1,
0.5706618, 0.7496225, 1.462752, 0, 0, 1, 1, 1,
0.5706714, -0.9878114, 1.726126, 1, 0, 0, 1, 1,
0.5789289, -1.604193, 3.76892, 1, 0, 0, 1, 1,
0.5850291, -1.932793, 3.425646, 1, 0, 0, 1, 1,
0.5857911, -0.7552034, 3.366765, 1, 0, 0, 1, 1,
0.5938379, -0.9888062, 4.831788, 1, 0, 0, 1, 1,
0.5941793, 0.3494406, 0.3408996, 0, 0, 0, 1, 1,
0.5954779, 0.2838686, 1.80651, 0, 0, 0, 1, 1,
0.6027375, 1.340937, -0.4425383, 0, 0, 0, 1, 1,
0.6062394, 1.206574, 0.8417863, 0, 0, 0, 1, 1,
0.6065047, -1.070912, 3.182988, 0, 0, 0, 1, 1,
0.608332, 0.1626527, 2.20023, 0, 0, 0, 1, 1,
0.6087167, 0.01119282, 3.23353, 0, 0, 0, 1, 1,
0.613493, -1.743459, 3.4312, 1, 1, 1, 1, 1,
0.6140328, -0.5989694, 2.570536, 1, 1, 1, 1, 1,
0.6212653, -0.6329256, 4.052347, 1, 1, 1, 1, 1,
0.6219875, 0.4128737, 1.919012, 1, 1, 1, 1, 1,
0.6226031, -1.808653, 2.981948, 1, 1, 1, 1, 1,
0.6288978, 1.768442, 0.2177191, 1, 1, 1, 1, 1,
0.6323699, 0.9882447, -1.525404, 1, 1, 1, 1, 1,
0.6363391, 2.016354, 1.052087, 1, 1, 1, 1, 1,
0.6406366, -0.07405955, 1.722536, 1, 1, 1, 1, 1,
0.6408692, 1.705838, 0.3410731, 1, 1, 1, 1, 1,
0.6474191, -0.1129716, 3.501525, 1, 1, 1, 1, 1,
0.6511064, 0.7993152, -0.1787798, 1, 1, 1, 1, 1,
0.6514191, -0.4067308, 3.090023, 1, 1, 1, 1, 1,
0.6581023, 0.6446106, 1.63913, 1, 1, 1, 1, 1,
0.6581281, 1.771328, 0.3262228, 1, 1, 1, 1, 1,
0.6605766, -2.277228, 2.649654, 0, 0, 1, 1, 1,
0.6621868, 0.6015891, 1.33378, 1, 0, 0, 1, 1,
0.666043, -1.227416, 1.191513, 1, 0, 0, 1, 1,
0.6688451, -1.307711, 1.907119, 1, 0, 0, 1, 1,
0.6695991, -0.7566109, 2.458277, 1, 0, 0, 1, 1,
0.6698986, 0.01160014, 1.882557, 1, 0, 0, 1, 1,
0.6732015, -0.2954691, 2.001584, 0, 0, 0, 1, 1,
0.6750222, 1.584473, -0.2356434, 0, 0, 0, 1, 1,
0.6763955, 0.7665092, 0.5798972, 0, 0, 0, 1, 1,
0.6807895, 0.6047536, 0.9922017, 0, 0, 0, 1, 1,
0.6852655, -0.62815, 0.4765753, 0, 0, 0, 1, 1,
0.6858534, -1.158535, 2.641239, 0, 0, 0, 1, 1,
0.6893845, 0.8366049, -0.5982685, 0, 0, 0, 1, 1,
0.689424, 0.1359328, 4.216348, 1, 1, 1, 1, 1,
0.6917248, -0.208562, 2.213809, 1, 1, 1, 1, 1,
0.6918634, -0.3315763, 1.179134, 1, 1, 1, 1, 1,
0.692022, 0.6411999, 1.475401, 1, 1, 1, 1, 1,
0.6922286, 1.241156, 3.106709, 1, 1, 1, 1, 1,
0.705842, -0.8330955, 1.376352, 1, 1, 1, 1, 1,
0.7094898, -0.02527129, 3.53298, 1, 1, 1, 1, 1,
0.7114837, -1.973289, 2.924468, 1, 1, 1, 1, 1,
0.7138604, -0.787584, 1.372961, 1, 1, 1, 1, 1,
0.7208609, 0.9730585, 0.04725714, 1, 1, 1, 1, 1,
0.7273962, 0.344429, -0.3068873, 1, 1, 1, 1, 1,
0.729075, -0.8713719, 2.388947, 1, 1, 1, 1, 1,
0.7293656, 0.8941604, 1.260595, 1, 1, 1, 1, 1,
0.7336172, 0.6478724, -0.493155, 1, 1, 1, 1, 1,
0.7336658, 1.538597, -0.3915274, 1, 1, 1, 1, 1,
0.7359593, -0.9491733, 1.810654, 0, 0, 1, 1, 1,
0.7394261, -0.2661121, 2.388269, 1, 0, 0, 1, 1,
0.7474657, -1.170905, 2.299336, 1, 0, 0, 1, 1,
0.747704, -0.4596752, 1.143058, 1, 0, 0, 1, 1,
0.7485033, 1.297233, 0.3267068, 1, 0, 0, 1, 1,
0.760484, 1.246767, 0.1854492, 1, 0, 0, 1, 1,
0.7611272, -0.5287423, 1.062941, 0, 0, 0, 1, 1,
0.7623532, 1.257551, 2.378232, 0, 0, 0, 1, 1,
0.763674, -0.4197775, 1.971339, 0, 0, 0, 1, 1,
0.7680171, -0.1639439, 1.762972, 0, 0, 0, 1, 1,
0.7702994, -0.7856971, 2.770561, 0, 0, 0, 1, 1,
0.7715447, -0.9318117, 2.129461, 0, 0, 0, 1, 1,
0.7749621, 1.424259, 0.3307612, 0, 0, 0, 1, 1,
0.7761677, 0.5025957, 2.485811, 1, 1, 1, 1, 1,
0.7780025, 1.049818, -0.5916533, 1, 1, 1, 1, 1,
0.7853891, -0.02432875, 3.202142, 1, 1, 1, 1, 1,
0.7858663, 1.613162, 0.7937586, 1, 1, 1, 1, 1,
0.7933558, 1.153954, 0.02970241, 1, 1, 1, 1, 1,
0.7938903, 1.652059, 0.6852847, 1, 1, 1, 1, 1,
0.8037297, 1.154696, 0.2889536, 1, 1, 1, 1, 1,
0.8063529, -1.903571, 3.217384, 1, 1, 1, 1, 1,
0.8081729, -1.924223, 2.67344, 1, 1, 1, 1, 1,
0.8138721, -0.5001811, 4.544459, 1, 1, 1, 1, 1,
0.8141562, -0.2816, 1.728178, 1, 1, 1, 1, 1,
0.8143143, -2.100133, 2.804674, 1, 1, 1, 1, 1,
0.8145148, -0.885362, 0.8427502, 1, 1, 1, 1, 1,
0.816303, 0.2117375, 2.980898, 1, 1, 1, 1, 1,
0.8170693, -0.2609125, -0.4359079, 1, 1, 1, 1, 1,
0.8171017, 0.07965998, 0.5127145, 0, 0, 1, 1, 1,
0.8187144, 1.03042, 0.4820493, 1, 0, 0, 1, 1,
0.8214329, 0.04868164, 1.583394, 1, 0, 0, 1, 1,
0.8267941, -1.368677, 2.418072, 1, 0, 0, 1, 1,
0.8405194, 0.6277571, -0.5264496, 1, 0, 0, 1, 1,
0.8406807, -0.523921, 0.5633837, 1, 0, 0, 1, 1,
0.8421791, 2.923061, -0.3812244, 0, 0, 0, 1, 1,
0.8463112, -0.3703148, 3.61861, 0, 0, 0, 1, 1,
0.8474575, -1.128565, 1.826592, 0, 0, 0, 1, 1,
0.8481004, -0.621618, 2.109064, 0, 0, 0, 1, 1,
0.8498558, -1.331102, 2.24815, 0, 0, 0, 1, 1,
0.8514114, 0.7714113, 3.279478, 0, 0, 0, 1, 1,
0.8597802, 1.162915, 1.285986, 0, 0, 0, 1, 1,
0.8640271, 0.8649116, 0.1229491, 1, 1, 1, 1, 1,
0.8687723, 0.2140135, 0.8867006, 1, 1, 1, 1, 1,
0.8721218, -0.1766518, 0.9831814, 1, 1, 1, 1, 1,
0.8729752, -0.3102033, 0.8770939, 1, 1, 1, 1, 1,
0.8859202, -0.8572629, 3.619477, 1, 1, 1, 1, 1,
0.8871929, -0.5641796, 3.860571, 1, 1, 1, 1, 1,
0.8877311, -0.2053587, 2.569326, 1, 1, 1, 1, 1,
0.8888484, -0.5638011, 3.054305, 1, 1, 1, 1, 1,
0.8939467, -0.5646741, 2.644426, 1, 1, 1, 1, 1,
0.8961737, -0.3332407, 1.960394, 1, 1, 1, 1, 1,
0.8968955, -0.435135, 2.803136, 1, 1, 1, 1, 1,
0.8983933, 0.7450864, 1.409938, 1, 1, 1, 1, 1,
0.8984321, -1.385444, 4.139228, 1, 1, 1, 1, 1,
0.898638, 0.9747614, 1.405772, 1, 1, 1, 1, 1,
0.899497, -0.5369189, 1.52462, 1, 1, 1, 1, 1,
0.900117, -0.253418, 0.6442478, 0, 0, 1, 1, 1,
0.9005666, -0.6985875, 2.181018, 1, 0, 0, 1, 1,
0.9016371, -0.4288327, 3.558212, 1, 0, 0, 1, 1,
0.9028774, 0.2918117, 0.300431, 1, 0, 0, 1, 1,
0.9069072, 0.6792454, 1.467111, 1, 0, 0, 1, 1,
0.9092463, -0.2864111, 0.3776581, 1, 0, 0, 1, 1,
0.9098402, -0.3520741, 1.965356, 0, 0, 0, 1, 1,
0.9111739, 0.06411362, 0.8720517, 0, 0, 0, 1, 1,
0.9117887, -1.945561, 2.849294, 0, 0, 0, 1, 1,
0.9175459, 0.4280539, -1.102605, 0, 0, 0, 1, 1,
0.9258641, 1.212407, 0.7643098, 0, 0, 0, 1, 1,
0.9286509, 0.4030916, 1.416112, 0, 0, 0, 1, 1,
0.9344587, -0.2561485, 2.386826, 0, 0, 0, 1, 1,
0.9375596, -0.3418966, -0.2098293, 1, 1, 1, 1, 1,
0.9441975, -0.8278262, 2.771835, 1, 1, 1, 1, 1,
0.9490978, 0.9420667, 0.6564658, 1, 1, 1, 1, 1,
0.9547244, 0.2050902, 3.197683, 1, 1, 1, 1, 1,
0.9565778, -0.4866615, 2.661073, 1, 1, 1, 1, 1,
0.9592177, -1.976782, 1.184542, 1, 1, 1, 1, 1,
0.9640064, 0.09436002, 1.652825, 1, 1, 1, 1, 1,
0.9642423, -0.4667169, 2.087829, 1, 1, 1, 1, 1,
0.9680827, 1.631971, 0.7012428, 1, 1, 1, 1, 1,
0.9690542, -0.3206794, 1.409587, 1, 1, 1, 1, 1,
0.9807096, -0.3122035, 1.275305, 1, 1, 1, 1, 1,
0.9811404, -0.6075586, 2.477446, 1, 1, 1, 1, 1,
0.9812427, 1.424872, 0.8955197, 1, 1, 1, 1, 1,
0.9924815, 1.580828, 0.3588835, 1, 1, 1, 1, 1,
0.9954261, -0.2086333, 1.865123, 1, 1, 1, 1, 1,
1.003043, 0.2747134, 1.190864, 0, 0, 1, 1, 1,
1.011233, 1.146019, 1.192296, 1, 0, 0, 1, 1,
1.016717, 0.6267301, 0.9888593, 1, 0, 0, 1, 1,
1.016732, 0.5844232, 2.211056, 1, 0, 0, 1, 1,
1.020217, -1.023541, 0.1732507, 1, 0, 0, 1, 1,
1.029807, -0.2287386, 0.8260403, 1, 0, 0, 1, 1,
1.034372, 0.850201, 1.132821, 0, 0, 0, 1, 1,
1.035376, 2.308205, -1.335497, 0, 0, 0, 1, 1,
1.040664, 0.3234072, 2.490443, 0, 0, 0, 1, 1,
1.04171, 1.261758, -0.3985314, 0, 0, 0, 1, 1,
1.045072, -1.624557, 2.534845, 0, 0, 0, 1, 1,
1.045712, 0.4013882, -0.02740725, 0, 0, 0, 1, 1,
1.048572, -0.3643024, 2.316671, 0, 0, 0, 1, 1,
1.050751, -0.3298312, -1.403677, 1, 1, 1, 1, 1,
1.05573, -0.4929004, 4.335709, 1, 1, 1, 1, 1,
1.056236, -2.395641, 2.974402, 1, 1, 1, 1, 1,
1.065876, -0.1879457, 1.874481, 1, 1, 1, 1, 1,
1.068419, -0.2899087, 0.9580777, 1, 1, 1, 1, 1,
1.07246, 1.882762, 0.7763639, 1, 1, 1, 1, 1,
1.07258, 1.996372, -0.5748453, 1, 1, 1, 1, 1,
1.081436, -0.9485385, 1.209648, 1, 1, 1, 1, 1,
1.08478, -0.2661107, 1.840259, 1, 1, 1, 1, 1,
1.094632, -0.3208801, 2.244996, 1, 1, 1, 1, 1,
1.096493, 0.977375, -0.3202078, 1, 1, 1, 1, 1,
1.100862, 0.1802965, 0.8079016, 1, 1, 1, 1, 1,
1.103877, -0.5028375, 2.393671, 1, 1, 1, 1, 1,
1.105225, -0.7773073, 2.444937, 1, 1, 1, 1, 1,
1.107098, 0.6541898, 1.951292, 1, 1, 1, 1, 1,
1.10746, -0.8953791, 3.239623, 0, 0, 1, 1, 1,
1.108083, -0.1318721, 2.596848, 1, 0, 0, 1, 1,
1.108104, -2.611313, 3.11116, 1, 0, 0, 1, 1,
1.108297, -1.874545, 2.61653, 1, 0, 0, 1, 1,
1.113376, -1.96981, 2.665814, 1, 0, 0, 1, 1,
1.116383, 0.1819237, 2.072105, 1, 0, 0, 1, 1,
1.117981, 0.9985554, -0.1780102, 0, 0, 0, 1, 1,
1.123534, -0.6254377, 1.899539, 0, 0, 0, 1, 1,
1.123948, -0.005270844, 1.825435, 0, 0, 0, 1, 1,
1.127164, -0.4152342, 1.568243, 0, 0, 0, 1, 1,
1.128451, 0.04075585, -0.1430571, 0, 0, 0, 1, 1,
1.133401, 0.3642744, 2.790386, 0, 0, 0, 1, 1,
1.137004, 1.596247, 1.051218, 0, 0, 0, 1, 1,
1.13881, -0.4865845, 2.72006, 1, 1, 1, 1, 1,
1.151138, 0.5512543, 0.7732421, 1, 1, 1, 1, 1,
1.159738, -0.7943282, 2.038604, 1, 1, 1, 1, 1,
1.160597, 0.2861742, 2.48387, 1, 1, 1, 1, 1,
1.163365, 0.7003215, 1.930301, 1, 1, 1, 1, 1,
1.16352, -1.16785, 1.107916, 1, 1, 1, 1, 1,
1.173228, -1.403406, 1.003839, 1, 1, 1, 1, 1,
1.192768, -0.8388538, 1.645548, 1, 1, 1, 1, 1,
1.193847, 0.3113461, 1.585627, 1, 1, 1, 1, 1,
1.201279, 1.289099, 0.5811419, 1, 1, 1, 1, 1,
1.212903, 1.814523, -0.02203881, 1, 1, 1, 1, 1,
1.21316, 0.3611438, 1.009981, 1, 1, 1, 1, 1,
1.216117, -1.964759, 2.652091, 1, 1, 1, 1, 1,
1.217192, -0.01049443, 2.924046, 1, 1, 1, 1, 1,
1.22485, 1.033314, 1.229048, 1, 1, 1, 1, 1,
1.234709, 0.7190106, 0.6557322, 0, 0, 1, 1, 1,
1.238826, 1.852634, -0.9152834, 1, 0, 0, 1, 1,
1.245614, -0.2967058, 2.968648, 1, 0, 0, 1, 1,
1.249216, -1.522607, 3.529215, 1, 0, 0, 1, 1,
1.250028, 0.8216069, 0.4601722, 1, 0, 0, 1, 1,
1.251623, -0.9485643, 2.070848, 1, 0, 0, 1, 1,
1.261829, 1.691933, 1.516831, 0, 0, 0, 1, 1,
1.267321, 0.09995917, -0.1348663, 0, 0, 0, 1, 1,
1.273762, 0.03073446, 0.4917889, 0, 0, 0, 1, 1,
1.275393, 0.5040486, 1.375499, 0, 0, 0, 1, 1,
1.283806, 0.9656389, -0.2341089, 0, 0, 0, 1, 1,
1.285741, 0.1287549, -0.04506843, 0, 0, 0, 1, 1,
1.286684, 0.503018, 1.480367, 0, 0, 0, 1, 1,
1.286993, -0.4661646, -1.714919, 1, 1, 1, 1, 1,
1.291515, -2.010503, 2.671179, 1, 1, 1, 1, 1,
1.301746, 1.341819, -0.1270006, 1, 1, 1, 1, 1,
1.304101, -0.3034315, 1.83474, 1, 1, 1, 1, 1,
1.313318, -0.2738778, 2.791675, 1, 1, 1, 1, 1,
1.314705, 1.211412, 0.5566943, 1, 1, 1, 1, 1,
1.32903, 0.1719406, 2.829351, 1, 1, 1, 1, 1,
1.345021, 0.5519512, 0.1793285, 1, 1, 1, 1, 1,
1.365025, -0.3130761, 1.970868, 1, 1, 1, 1, 1,
1.376809, 1.167814, -0.5000488, 1, 1, 1, 1, 1,
1.37978, 0.1031503, 1.010497, 1, 1, 1, 1, 1,
1.392488, -0.2320852, 2.430663, 1, 1, 1, 1, 1,
1.39728, -0.8031234, 4.374431, 1, 1, 1, 1, 1,
1.400326, 0.1945712, 0.8374839, 1, 1, 1, 1, 1,
1.419247, 3.316838, 1.269956, 1, 1, 1, 1, 1,
1.423872, -0.3603711, 2.557376, 0, 0, 1, 1, 1,
1.426426, -0.0835906, 0.1304242, 1, 0, 0, 1, 1,
1.432812, 0.1819721, -0.3530172, 1, 0, 0, 1, 1,
1.435992, -1.344913, 2.365799, 1, 0, 0, 1, 1,
1.442394, -1.534113, 0.6462492, 1, 0, 0, 1, 1,
1.449254, 0.1529511, 1.420102, 1, 0, 0, 1, 1,
1.449801, -1.572529, 1.935862, 0, 0, 0, 1, 1,
1.450401, 1.395969, 0.3221413, 0, 0, 0, 1, 1,
1.469685, 0.7475233, 0.9343112, 0, 0, 0, 1, 1,
1.474194, -1.170147, 2.393775, 0, 0, 0, 1, 1,
1.475906, 0.974476, 2.852927, 0, 0, 0, 1, 1,
1.488301, -1.702149, 1.601544, 0, 0, 0, 1, 1,
1.496483, 0.6988542, 1.564945, 0, 0, 0, 1, 1,
1.499689, -0.8874217, 2.76984, 1, 1, 1, 1, 1,
1.49982, -1.010566, 1.892629, 1, 1, 1, 1, 1,
1.507645, -2.793634, 1.838639, 1, 1, 1, 1, 1,
1.509767, 0.8289046, 1.02675, 1, 1, 1, 1, 1,
1.518941, 0.1156187, 2.690394, 1, 1, 1, 1, 1,
1.522833, 0.8609858, -0.3019731, 1, 1, 1, 1, 1,
1.524772, 0.9380878, 1.036013, 1, 1, 1, 1, 1,
1.540999, 1.893558, 1.133583, 1, 1, 1, 1, 1,
1.542424, 0.7238988, 1.487804, 1, 1, 1, 1, 1,
1.547213, 0.5563124, 0.9577861, 1, 1, 1, 1, 1,
1.549709, -2.083939, 2.306511, 1, 1, 1, 1, 1,
1.558632, -0.1932286, 2.574816, 1, 1, 1, 1, 1,
1.568123, -0.6710433, 2.125376, 1, 1, 1, 1, 1,
1.569331, 0.2092422, 2.09649, 1, 1, 1, 1, 1,
1.574267, 2.012443, -0.8994671, 1, 1, 1, 1, 1,
1.57464, 1.559243, 0.6690814, 0, 0, 1, 1, 1,
1.576913, 0.2856425, 0.3281417, 1, 0, 0, 1, 1,
1.601358, 0.4476543, 0.4719541, 1, 0, 0, 1, 1,
1.610688, -1.453896, 2.183316, 1, 0, 0, 1, 1,
1.630043, 2.073, 2.138592, 1, 0, 0, 1, 1,
1.631495, -0.8299677, 2.400529, 1, 0, 0, 1, 1,
1.632049, -0.05544282, 2.788248, 0, 0, 0, 1, 1,
1.632798, -1.306546, 1.506739, 0, 0, 0, 1, 1,
1.635114, -1.427867, 0.4070632, 0, 0, 0, 1, 1,
1.643328, -0.9991634, 1.744098, 0, 0, 0, 1, 1,
1.643927, -2.634529, 3.911095, 0, 0, 0, 1, 1,
1.648448, -0.6732135, 2.314255, 0, 0, 0, 1, 1,
1.654142, -0.1304751, 0.6285819, 0, 0, 0, 1, 1,
1.661012, -0.796098, 1.301995, 1, 1, 1, 1, 1,
1.67453, -0.3525747, 0.7560159, 1, 1, 1, 1, 1,
1.698493, -0.06607914, 2.748456, 1, 1, 1, 1, 1,
1.717211, -0.6222515, 2.345936, 1, 1, 1, 1, 1,
1.754548, 0.3432264, 2.061651, 1, 1, 1, 1, 1,
1.75644, -0.136915, 1.797871, 1, 1, 1, 1, 1,
1.765655, -2.036364, 3.621809, 1, 1, 1, 1, 1,
1.768242, 1.48256, -0.1866987, 1, 1, 1, 1, 1,
1.788593, -0.4935777, 3.453564, 1, 1, 1, 1, 1,
1.792838, 1.557779, 0.9081883, 1, 1, 1, 1, 1,
1.809255, -1.613349, 2.901879, 1, 1, 1, 1, 1,
1.809804, 1.766886, 0.4225867, 1, 1, 1, 1, 1,
1.831075, -1.605817, 2.479134, 1, 1, 1, 1, 1,
1.851198, -0.04504989, 1.552943, 1, 1, 1, 1, 1,
1.87628, 1.249875, 1.891116, 1, 1, 1, 1, 1,
1.894141, 0.6260895, 1.268552, 0, 0, 1, 1, 1,
1.896789, -0.2028901, 1.079594, 1, 0, 0, 1, 1,
1.954549, 1.258349, 0.2135929, 1, 0, 0, 1, 1,
1.99884, 0.6888327, 1.704583, 1, 0, 0, 1, 1,
2.019013, 0.1374095, 1.989534, 1, 0, 0, 1, 1,
2.038183, -1.386199, 0.9292606, 1, 0, 0, 1, 1,
2.096435, -0.0181351, 1.478023, 0, 0, 0, 1, 1,
2.09754, 0.06430191, 2.083967, 0, 0, 0, 1, 1,
2.149188, 0.7873431, 2.086411, 0, 0, 0, 1, 1,
2.174169, -0.9693229, -0.01325603, 0, 0, 0, 1, 1,
2.203525, 1.710665, 1.870596, 0, 0, 0, 1, 1,
2.229944, 0.133777, 1.142136, 0, 0, 0, 1, 1,
2.249389, -0.2917823, 2.855699, 0, 0, 0, 1, 1,
2.274567, -1.130183, 1.926019, 1, 1, 1, 1, 1,
2.376545, -0.1242507, 1.908428, 1, 1, 1, 1, 1,
2.411493, -0.02370532, 2.966905, 1, 1, 1, 1, 1,
2.472022, 1.195138, 2.161639, 1, 1, 1, 1, 1,
2.541602, 0.6930872, 3.156463, 1, 1, 1, 1, 1,
2.595161, 0.4195186, 2.165142, 1, 1, 1, 1, 1,
2.816865, 2.627941, 1.722063, 1, 1, 1, 1, 1
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
var radius = 9.468066;
var distance = 33.25618;
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
mvMatrix.translate( 0.018942, -0.2616022, 0.5303166 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.25618);
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
