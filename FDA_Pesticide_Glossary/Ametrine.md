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
-3.460674, -0.7068863, -0.6566416, 1, 0, 0, 1,
-2.996222, -0.09505942, -1.578386, 1, 0.007843138, 0, 1,
-2.934052, 0.3427557, -1.870444, 1, 0.01176471, 0, 1,
-2.7684, -0.2125881, -1.524094, 1, 0.01960784, 0, 1,
-2.724075, -0.09157899, -2.107419, 1, 0.02352941, 0, 1,
-2.723622, -1.215782, -1.741756, 1, 0.03137255, 0, 1,
-2.675054, 0.5830838, -3.731146, 1, 0.03529412, 0, 1,
-2.622499, 1.197783, -2.523723, 1, 0.04313726, 0, 1,
-2.436825, -0.3847744, -2.992803, 1, 0.04705882, 0, 1,
-2.408008, -0.6197084, -1.396138, 1, 0.05490196, 0, 1,
-2.352965, -0.9571369, -3.635204, 1, 0.05882353, 0, 1,
-2.352024, -0.1647343, -1.500926, 1, 0.06666667, 0, 1,
-2.337827, 0.3425815, 0.1040156, 1, 0.07058824, 0, 1,
-2.319098, 1.633457, -1.429119, 1, 0.07843138, 0, 1,
-2.306603, 0.9660417, -1.993947, 1, 0.08235294, 0, 1,
-2.266836, 1.58326, -1.197053, 1, 0.09019608, 0, 1,
-2.26125, 1.151526, -0.4358776, 1, 0.09411765, 0, 1,
-2.205016, 1.657352, -3.471053, 1, 0.1019608, 0, 1,
-2.162402, 0.2704832, -2.844874, 1, 0.1098039, 0, 1,
-2.138668, 0.6946018, -0.5880827, 1, 0.1137255, 0, 1,
-2.098837, -0.4705926, -1.482573, 1, 0.1215686, 0, 1,
-2.096241, 0.666272, 0.3779601, 1, 0.1254902, 0, 1,
-2.003402, 1.109397, -1.434108, 1, 0.1333333, 0, 1,
-1.993683, 0.9443053, -1.015616, 1, 0.1372549, 0, 1,
-1.97221, 0.9859301, -1.046153, 1, 0.145098, 0, 1,
-1.95495, -0.5412785, -2.181867, 1, 0.1490196, 0, 1,
-1.953737, 0.528237, -1.969875, 1, 0.1568628, 0, 1,
-1.944017, 1.198734, -1.673675, 1, 0.1607843, 0, 1,
-1.936009, -2.953514, -5.424685, 1, 0.1686275, 0, 1,
-1.935326, 0.3512515, -0.8251927, 1, 0.172549, 0, 1,
-1.9154, -0.2797507, -2.783343, 1, 0.1803922, 0, 1,
-1.888985, 0.4653443, -0.9131073, 1, 0.1843137, 0, 1,
-1.800735, -0.04211602, -2.66649, 1, 0.1921569, 0, 1,
-1.744764, 0.4306236, 1.083626, 1, 0.1960784, 0, 1,
-1.727873, 1.574384, 0.3640816, 1, 0.2039216, 0, 1,
-1.723732, 0.4092952, -0.540187, 1, 0.2117647, 0, 1,
-1.7197, 0.8341976, -0.9366242, 1, 0.2156863, 0, 1,
-1.705789, 0.4745501, -1.235772, 1, 0.2235294, 0, 1,
-1.696123, -0.4624312, -1.864461, 1, 0.227451, 0, 1,
-1.69136, 1.068433, 1.150257, 1, 0.2352941, 0, 1,
-1.688962, 1.176344, -1.425715, 1, 0.2392157, 0, 1,
-1.681283, 0.491134, -0.6154966, 1, 0.2470588, 0, 1,
-1.680295, 0.3784879, -1.786052, 1, 0.2509804, 0, 1,
-1.668193, 1.582788, -1.653837, 1, 0.2588235, 0, 1,
-1.662008, 0.2728367, -2.724821, 1, 0.2627451, 0, 1,
-1.661093, 0.771951, 1.731266, 1, 0.2705882, 0, 1,
-1.638625, 0.4841668, -1.778464, 1, 0.2745098, 0, 1,
-1.638066, -0.03104834, -0.6933068, 1, 0.282353, 0, 1,
-1.630236, 1.45369, -2.558789, 1, 0.2862745, 0, 1,
-1.627054, -1.231695, -0.3793491, 1, 0.2941177, 0, 1,
-1.597879, -0.8453494, -1.10112, 1, 0.3019608, 0, 1,
-1.59439, -0.3929681, -3.430365, 1, 0.3058824, 0, 1,
-1.576478, 0.3151765, -0.9909598, 1, 0.3137255, 0, 1,
-1.565374, 1.673552, 0.8932656, 1, 0.3176471, 0, 1,
-1.54512, -1.705275, -2.163937, 1, 0.3254902, 0, 1,
-1.541792, 0.5400401, -1.135272, 1, 0.3294118, 0, 1,
-1.535393, 1.251179, -0.4446772, 1, 0.3372549, 0, 1,
-1.533375, 0.5761318, 0.7203977, 1, 0.3411765, 0, 1,
-1.532724, -0.2076851, -1.947196, 1, 0.3490196, 0, 1,
-1.52536, 0.5338144, -1.167882, 1, 0.3529412, 0, 1,
-1.522367, 1.083735, -1.313597, 1, 0.3607843, 0, 1,
-1.51809, 1.513843, -0.03141597, 1, 0.3647059, 0, 1,
-1.512059, -0.05160607, -3.454589, 1, 0.372549, 0, 1,
-1.511361, 1.394631, -1.520817, 1, 0.3764706, 0, 1,
-1.507082, 0.9937273, -1.648393, 1, 0.3843137, 0, 1,
-1.466958, -0.4979014, -1.29126, 1, 0.3882353, 0, 1,
-1.46461, -0.2632414, -0.02967167, 1, 0.3960784, 0, 1,
-1.462315, -1.112313, -1.891973, 1, 0.4039216, 0, 1,
-1.461005, 1.76436, -0.7928291, 1, 0.4078431, 0, 1,
-1.454936, -0.6138247, -0.9736932, 1, 0.4156863, 0, 1,
-1.443729, 0.3348336, -1.554116, 1, 0.4196078, 0, 1,
-1.442118, -0.02598749, -0.408897, 1, 0.427451, 0, 1,
-1.429259, -1.782542, -3.131362, 1, 0.4313726, 0, 1,
-1.420086, -0.3590166, -3.199336, 1, 0.4392157, 0, 1,
-1.395559, -0.8740404, -2.045812, 1, 0.4431373, 0, 1,
-1.376492, 0.4911253, -1.915906, 1, 0.4509804, 0, 1,
-1.373644, -0.403306, -2.444153, 1, 0.454902, 0, 1,
-1.368875, -0.4185069, -3.822695, 1, 0.4627451, 0, 1,
-1.362415, 1.838257, 0.557666, 1, 0.4666667, 0, 1,
-1.359565, -0.1516609, -2.322799, 1, 0.4745098, 0, 1,
-1.349357, -1.035558, -4.246852, 1, 0.4784314, 0, 1,
-1.3442, 0.2664699, 0.9633443, 1, 0.4862745, 0, 1,
-1.343325, 1.601199, -0.04290748, 1, 0.4901961, 0, 1,
-1.343086, -1.972453, -1.438225, 1, 0.4980392, 0, 1,
-1.333066, 0.6636827, -0.6639647, 1, 0.5058824, 0, 1,
-1.32796, -0.6794416, -1.063332, 1, 0.509804, 0, 1,
-1.323984, -0.2821944, -0.8049536, 1, 0.5176471, 0, 1,
-1.312123, 1.278221, -2.426711, 1, 0.5215687, 0, 1,
-1.301058, -0.1422522, -0.5688426, 1, 0.5294118, 0, 1,
-1.297127, 0.9512349, 0.9097309, 1, 0.5333334, 0, 1,
-1.296925, 0.1329435, -0.1151173, 1, 0.5411765, 0, 1,
-1.281362, 0.06638005, -1.978365, 1, 0.5450981, 0, 1,
-1.279085, -0.9936762, -3.487043, 1, 0.5529412, 0, 1,
-1.264486, -0.3224152, -2.03996, 1, 0.5568628, 0, 1,
-1.242628, 0.721877, -0.1209212, 1, 0.5647059, 0, 1,
-1.236802, -1.109282, -2.784958, 1, 0.5686275, 0, 1,
-1.228795, -0.3434808, -3.60841, 1, 0.5764706, 0, 1,
-1.227555, -0.5030425, -1.50702, 1, 0.5803922, 0, 1,
-1.219846, -1.29261, -2.623159, 1, 0.5882353, 0, 1,
-1.206793, -1.76958, -2.358029, 1, 0.5921569, 0, 1,
-1.202939, -0.2096526, -0.4834961, 1, 0.6, 0, 1,
-1.201311, -0.02415911, -1.94069, 1, 0.6078432, 0, 1,
-1.200498, 0.4246364, -0.3596311, 1, 0.6117647, 0, 1,
-1.198425, -0.1301539, -1.552454, 1, 0.6196079, 0, 1,
-1.19621, -1.16345, -0.4380923, 1, 0.6235294, 0, 1,
-1.192269, 1.306475, 0.9993108, 1, 0.6313726, 0, 1,
-1.191533, -0.2787128, -1.732235, 1, 0.6352941, 0, 1,
-1.190319, 0.6082504, -2.327115, 1, 0.6431373, 0, 1,
-1.190313, 1.695409, -0.5762286, 1, 0.6470588, 0, 1,
-1.183824, -0.4929187, -1.686547, 1, 0.654902, 0, 1,
-1.180844, -0.1127326, -2.085263, 1, 0.6588235, 0, 1,
-1.168386, -1.479336, -0.8676983, 1, 0.6666667, 0, 1,
-1.165859, 0.7174074, -1.065442, 1, 0.6705883, 0, 1,
-1.162664, -0.6434819, -0.7606191, 1, 0.6784314, 0, 1,
-1.160489, 0.7175136, -1.94292, 1, 0.682353, 0, 1,
-1.153306, 0.5775297, -1.642771, 1, 0.6901961, 0, 1,
-1.14991, 0.3073964, -3.306576, 1, 0.6941177, 0, 1,
-1.145693, -1.445326, -2.748796, 1, 0.7019608, 0, 1,
-1.145144, -0.1322312, -0.8751229, 1, 0.7098039, 0, 1,
-1.12947, 1.092763, -1.385536, 1, 0.7137255, 0, 1,
-1.127989, -0.8179628, -1.762427, 1, 0.7215686, 0, 1,
-1.127055, 0.4668999, -1.223946, 1, 0.7254902, 0, 1,
-1.118324, 0.8162239, 0.3277941, 1, 0.7333333, 0, 1,
-1.11329, 1.077994, -0.017322, 1, 0.7372549, 0, 1,
-1.111796, -0.2436577, -2.982333, 1, 0.7450981, 0, 1,
-1.104438, -1.308215, -3.21531, 1, 0.7490196, 0, 1,
-1.098543, 0.937259, -0.8170598, 1, 0.7568628, 0, 1,
-1.092348, -0.2209972, -1.655531, 1, 0.7607843, 0, 1,
-1.091417, 0.5150573, -0.7280741, 1, 0.7686275, 0, 1,
-1.090431, 0.4573939, -2.318042, 1, 0.772549, 0, 1,
-1.080769, -1.571927, -4.639518, 1, 0.7803922, 0, 1,
-1.078023, -0.1370544, -2.135793, 1, 0.7843137, 0, 1,
-1.067243, 0.2035903, -2.476272, 1, 0.7921569, 0, 1,
-1.065018, -0.3396307, -0.8798497, 1, 0.7960784, 0, 1,
-1.061653, 1.01624, -0.08707892, 1, 0.8039216, 0, 1,
-1.061423, 1.121006, 0.4524372, 1, 0.8117647, 0, 1,
-1.057667, -1.083375, -3.484326, 1, 0.8156863, 0, 1,
-1.043748, 1.462107, 0.5253491, 1, 0.8235294, 0, 1,
-1.04279, -0.01914, -3.407632, 1, 0.827451, 0, 1,
-1.026284, 0.421538, 0.5158868, 1, 0.8352941, 0, 1,
-1.025893, 1.358974, -0.3571174, 1, 0.8392157, 0, 1,
-1.017971, 0.9337219, -0.5650968, 1, 0.8470588, 0, 1,
-1.01496, -0.7784348, -2.522703, 1, 0.8509804, 0, 1,
-1.011771, -0.5518802, -0.5793731, 1, 0.8588235, 0, 1,
-1.011624, 1.257437, -3.101879, 1, 0.8627451, 0, 1,
-1.008703, 0.8381853, -0.7249019, 1, 0.8705882, 0, 1,
-1.007396, -2.180586, -3.21384, 1, 0.8745098, 0, 1,
-1.00309, 0.01973721, -3.217017, 1, 0.8823529, 0, 1,
-1.000746, -1.229325, -1.294584, 1, 0.8862745, 0, 1,
-0.9999237, -1.389586, -3.04425, 1, 0.8941177, 0, 1,
-0.9978575, 1.455294, -0.6791806, 1, 0.8980392, 0, 1,
-0.9972392, -1.172518, -1.552889, 1, 0.9058824, 0, 1,
-0.9947578, 0.04932385, -1.748806, 1, 0.9137255, 0, 1,
-0.9899798, 0.6078376, -0.7483546, 1, 0.9176471, 0, 1,
-0.9883202, 0.5804691, -0.07535718, 1, 0.9254902, 0, 1,
-0.9880967, 0.5761414, -1.394929, 1, 0.9294118, 0, 1,
-0.9847277, 0.5765596, -2.413563, 1, 0.9372549, 0, 1,
-0.9838989, 0.6393515, -0.6404408, 1, 0.9411765, 0, 1,
-0.9804156, 0.613077, -0.5204896, 1, 0.9490196, 0, 1,
-0.9753729, -0.9892249, -2.089526, 1, 0.9529412, 0, 1,
-0.9748605, -0.1778119, -0.802314, 1, 0.9607843, 0, 1,
-0.970286, -1.139547, -0.5931125, 1, 0.9647059, 0, 1,
-0.9668432, 0.7023056, 0.1062575, 1, 0.972549, 0, 1,
-0.9668241, 0.5593346, -0.9963802, 1, 0.9764706, 0, 1,
-0.9660469, 0.708718, 0.7162476, 1, 0.9843137, 0, 1,
-0.965561, -0.06098039, -0.2438466, 1, 0.9882353, 0, 1,
-0.963311, 0.8805552, -0.06185584, 1, 0.9960784, 0, 1,
-0.9569598, 1.723877, 0.2970769, 0.9960784, 1, 0, 1,
-0.9556249, -2.698953, -3.884127, 0.9921569, 1, 0, 1,
-0.95074, 1.405518, -1.144797, 0.9843137, 1, 0, 1,
-0.9448411, 0.8476225, 0.2888616, 0.9803922, 1, 0, 1,
-0.9437228, -0.3800231, -0.865297, 0.972549, 1, 0, 1,
-0.9436945, -0.2354931, -2.871495, 0.9686275, 1, 0, 1,
-0.9418615, -0.3666384, -2.846338, 0.9607843, 1, 0, 1,
-0.9357584, 0.4027335, 0.07168584, 0.9568627, 1, 0, 1,
-0.9221866, -1.166835, -2.463106, 0.9490196, 1, 0, 1,
-0.9212323, 1.021749, -0.4082666, 0.945098, 1, 0, 1,
-0.9178883, -0.6342726, -2.532702, 0.9372549, 1, 0, 1,
-0.9111301, -0.1208825, -2.146039, 0.9333333, 1, 0, 1,
-0.9086806, -1.216754, -1.737107, 0.9254902, 1, 0, 1,
-0.8984077, -0.5153359, -0.8953878, 0.9215686, 1, 0, 1,
-0.8962665, 1.111073, 0.7739405, 0.9137255, 1, 0, 1,
-0.8932384, 0.4233981, -0.6547354, 0.9098039, 1, 0, 1,
-0.8862658, 0.4502027, -1.058965, 0.9019608, 1, 0, 1,
-0.8862076, -1.918317, -3.801047, 0.8941177, 1, 0, 1,
-0.8846489, -1.249213, -2.690956, 0.8901961, 1, 0, 1,
-0.8833717, 1.245596, -1.434073, 0.8823529, 1, 0, 1,
-0.8759884, 1.766465, -1.073228, 0.8784314, 1, 0, 1,
-0.8756971, -0.2496422, -0.7753231, 0.8705882, 1, 0, 1,
-0.868589, 1.283141, -0.548192, 0.8666667, 1, 0, 1,
-0.8672125, 0.4750074, -1.243595, 0.8588235, 1, 0, 1,
-0.8645626, 0.573636, -2.61059, 0.854902, 1, 0, 1,
-0.8579714, 1.131729, -1.093319, 0.8470588, 1, 0, 1,
-0.8568078, -0.757375, -0.3827855, 0.8431373, 1, 0, 1,
-0.8545325, 1.007269, -2.013932, 0.8352941, 1, 0, 1,
-0.8539889, 1.103662, -0.4839368, 0.8313726, 1, 0, 1,
-0.8532203, 0.9213586, -0.06043183, 0.8235294, 1, 0, 1,
-0.8505351, 0.06276043, -2.078218, 0.8196079, 1, 0, 1,
-0.8467147, -1.768731, -2.312961, 0.8117647, 1, 0, 1,
-0.8460355, -0.08560021, -0.9248448, 0.8078431, 1, 0, 1,
-0.8369238, 0.9866505, -1.233339, 0.8, 1, 0, 1,
-0.8350435, 0.8389879, -0.6874362, 0.7921569, 1, 0, 1,
-0.8331981, 0.8726847, -1.581815, 0.7882353, 1, 0, 1,
-0.8276753, 1.236255, -0.5962744, 0.7803922, 1, 0, 1,
-0.8276144, -0.721257, -2.646946, 0.7764706, 1, 0, 1,
-0.8273039, -0.2007231, -1.97071, 0.7686275, 1, 0, 1,
-0.8255231, 0.1444063, -0.3779048, 0.7647059, 1, 0, 1,
-0.8216127, 1.315009, -1.441497, 0.7568628, 1, 0, 1,
-0.8207557, -1.075892, -1.138704, 0.7529412, 1, 0, 1,
-0.8185487, -0.2727357, -1.541567, 0.7450981, 1, 0, 1,
-0.8124577, -1.022668, -4.034488, 0.7411765, 1, 0, 1,
-0.8079864, 1.578701, -2.422593, 0.7333333, 1, 0, 1,
-0.7979768, 0.03441486, -0.3843691, 0.7294118, 1, 0, 1,
-0.7978154, 0.8036311, 0.2789545, 0.7215686, 1, 0, 1,
-0.7926447, 0.8531296, -0.02958874, 0.7176471, 1, 0, 1,
-0.7908931, 0.1383192, -0.8211789, 0.7098039, 1, 0, 1,
-0.7900475, 1.411709, -1.366291, 0.7058824, 1, 0, 1,
-0.7893716, 2.204311, 0.8722031, 0.6980392, 1, 0, 1,
-0.7870013, -1.139973, -2.668966, 0.6901961, 1, 0, 1,
-0.78579, -0.5198289, -1.703857, 0.6862745, 1, 0, 1,
-0.7857282, -0.06629901, -2.782359, 0.6784314, 1, 0, 1,
-0.7825124, 0.08405142, -1.807053, 0.6745098, 1, 0, 1,
-0.7820539, -0.2868151, -1.403807, 0.6666667, 1, 0, 1,
-0.7809006, -0.995366, -2.218396, 0.6627451, 1, 0, 1,
-0.7772086, 0.09685211, -3.040541, 0.654902, 1, 0, 1,
-0.7748752, -1.413476, -1.886557, 0.6509804, 1, 0, 1,
-0.7736902, 1.083822, 0.06852569, 0.6431373, 1, 0, 1,
-0.7661454, 0.2351217, -3.952499, 0.6392157, 1, 0, 1,
-0.7593897, 1.602361, 0.3120585, 0.6313726, 1, 0, 1,
-0.7492643, -0.1856594, -2.193306, 0.627451, 1, 0, 1,
-0.7454371, -0.2525712, -0.599118, 0.6196079, 1, 0, 1,
-0.7376083, 1.171016, -0.821627, 0.6156863, 1, 0, 1,
-0.7362812, 0.5053005, -1.469232, 0.6078432, 1, 0, 1,
-0.7331793, -1.319626, -3.075013, 0.6039216, 1, 0, 1,
-0.7302945, -0.4856953, -0.9801332, 0.5960785, 1, 0, 1,
-0.7264695, -1.222491, -2.833155, 0.5882353, 1, 0, 1,
-0.7260393, 1.004802, -1.159665, 0.5843138, 1, 0, 1,
-0.7214214, -1.056896, -3.491372, 0.5764706, 1, 0, 1,
-0.7208337, 1.461689, -0.7080478, 0.572549, 1, 0, 1,
-0.7129222, -0.3682372, -3.806415, 0.5647059, 1, 0, 1,
-0.7093449, -2.396866, -5.055588, 0.5607843, 1, 0, 1,
-0.706553, -0.5766881, -2.499476, 0.5529412, 1, 0, 1,
-0.7058752, 0.3882943, 0.08640296, 0.5490196, 1, 0, 1,
-0.7055226, -2.752824, -2.852697, 0.5411765, 1, 0, 1,
-0.7040993, 0.3713104, -1.933883, 0.5372549, 1, 0, 1,
-0.6941221, -0.08942534, -3.108926, 0.5294118, 1, 0, 1,
-0.6817656, -0.1126581, -0.8541355, 0.5254902, 1, 0, 1,
-0.6816296, 0.9126536, -0.6945273, 0.5176471, 1, 0, 1,
-0.6771867, -2.124751, -3.606467, 0.5137255, 1, 0, 1,
-0.676912, 0.3342542, -2.030152, 0.5058824, 1, 0, 1,
-0.6760409, -0.550604, -0.7983692, 0.5019608, 1, 0, 1,
-0.6756375, 1.048152, 1.64162, 0.4941176, 1, 0, 1,
-0.6753043, 1.264894, 2.551724, 0.4862745, 1, 0, 1,
-0.6745588, 0.6160066, 0.2086575, 0.4823529, 1, 0, 1,
-0.6699017, 1.160144, -1.194403, 0.4745098, 1, 0, 1,
-0.6696706, -0.02075721, -1.09207, 0.4705882, 1, 0, 1,
-0.6654273, 0.2016446, -1.194746, 0.4627451, 1, 0, 1,
-0.662679, -1.448242, -0.3224141, 0.4588235, 1, 0, 1,
-0.6593776, 0.3283859, -0.4816964, 0.4509804, 1, 0, 1,
-0.6541232, -1.24149, -2.736748, 0.4470588, 1, 0, 1,
-0.6518033, 0.1059076, -0.4302567, 0.4392157, 1, 0, 1,
-0.6503749, -1.816849, -1.371274, 0.4352941, 1, 0, 1,
-0.6495247, -0.4264224, -2.405359, 0.427451, 1, 0, 1,
-0.6476467, -0.1288465, -3.727584, 0.4235294, 1, 0, 1,
-0.644494, -0.577989, -2.846352, 0.4156863, 1, 0, 1,
-0.6417482, 0.5230892, -0.9829847, 0.4117647, 1, 0, 1,
-0.6368527, -0.5326601, -2.697669, 0.4039216, 1, 0, 1,
-0.6360391, 0.952435, -0.6572446, 0.3960784, 1, 0, 1,
-0.6351517, 0.47935, -0.284871, 0.3921569, 1, 0, 1,
-0.6326209, 0.2335268, -1.733895, 0.3843137, 1, 0, 1,
-0.6320812, 0.279951, -1.184325, 0.3803922, 1, 0, 1,
-0.6317984, 0.005886315, -2.470198, 0.372549, 1, 0, 1,
-0.6290484, 0.8821012, 0.5598894, 0.3686275, 1, 0, 1,
-0.6260704, -0.4381293, -0.7952748, 0.3607843, 1, 0, 1,
-0.6245645, 1.426437, -1.508042, 0.3568628, 1, 0, 1,
-0.6244558, 1.466301, -1.666469, 0.3490196, 1, 0, 1,
-0.6238776, -0.7295858, -3.097551, 0.345098, 1, 0, 1,
-0.6188277, -0.243632, -2.433792, 0.3372549, 1, 0, 1,
-0.6162413, 0.7983235, -0.387913, 0.3333333, 1, 0, 1,
-0.6156428, -1.186303, -2.986113, 0.3254902, 1, 0, 1,
-0.612852, 0.4527732, 0.1346857, 0.3215686, 1, 0, 1,
-0.6119874, -1.391503, -2.37476, 0.3137255, 1, 0, 1,
-0.6062409, 0.5121395, -0.3543483, 0.3098039, 1, 0, 1,
-0.6022679, 2.868495, 0.2742965, 0.3019608, 1, 0, 1,
-0.5997988, 1.388626, -1.532805, 0.2941177, 1, 0, 1,
-0.5991377, 1.488741, -0.06818178, 0.2901961, 1, 0, 1,
-0.5977, 0.151916, -0.8756719, 0.282353, 1, 0, 1,
-0.5950081, 0.6474364, -0.5840566, 0.2784314, 1, 0, 1,
-0.5939432, -0.4335756, -4.050786, 0.2705882, 1, 0, 1,
-0.593923, 1.712987, 1.506038, 0.2666667, 1, 0, 1,
-0.5920895, 0.6102647, -1.444287, 0.2588235, 1, 0, 1,
-0.591779, -0.4928811, -2.260889, 0.254902, 1, 0, 1,
-0.5912132, 0.01258731, -0.8807227, 0.2470588, 1, 0, 1,
-0.5896317, 3.190695, 0.1478075, 0.2431373, 1, 0, 1,
-0.5862548, -0.9254904, -3.340857, 0.2352941, 1, 0, 1,
-0.5841993, 1.41578, -1.14889, 0.2313726, 1, 0, 1,
-0.5823997, 3.44376, -0.8571137, 0.2235294, 1, 0, 1,
-0.5779002, -0.8608872, -2.213317, 0.2196078, 1, 0, 1,
-0.5763339, 0.7652311, -0.4364621, 0.2117647, 1, 0, 1,
-0.5741807, 1.602551, 1.030294, 0.2078431, 1, 0, 1,
-0.572437, 1.187943, -0.6582062, 0.2, 1, 0, 1,
-0.5723284, -0.1076962, -1.524969, 0.1921569, 1, 0, 1,
-0.5628794, 0.6951745, 0.06278104, 0.1882353, 1, 0, 1,
-0.5582733, 0.6365701, 1.143728, 0.1803922, 1, 0, 1,
-0.5573656, 1.536761, -0.2250645, 0.1764706, 1, 0, 1,
-0.543556, -0.9468657, -1.837656, 0.1686275, 1, 0, 1,
-0.5431244, -0.2519148, -2.07632, 0.1647059, 1, 0, 1,
-0.5428002, -0.04533675, -1.03583, 0.1568628, 1, 0, 1,
-0.5399826, -0.06979922, -1.857619, 0.1529412, 1, 0, 1,
-0.534959, -0.02804826, -2.2765, 0.145098, 1, 0, 1,
-0.5343187, 2.383501, 1.187614, 0.1411765, 1, 0, 1,
-0.531219, 0.5249333, -1.512878, 0.1333333, 1, 0, 1,
-0.5305892, -0.8188544, -2.867897, 0.1294118, 1, 0, 1,
-0.5299245, 0.3500879, -1.28739, 0.1215686, 1, 0, 1,
-0.5299038, -1.432926, -3.254847, 0.1176471, 1, 0, 1,
-0.5295105, 1.126307, -2.319649, 0.1098039, 1, 0, 1,
-0.5270894, 0.01703744, -3.115694, 0.1058824, 1, 0, 1,
-0.5269535, -0.4837915, -3.445399, 0.09803922, 1, 0, 1,
-0.5264586, -0.411236, -0.2668187, 0.09019608, 1, 0, 1,
-0.5237952, -0.3183922, -2.854118, 0.08627451, 1, 0, 1,
-0.5211846, 0.2354958, -1.118061, 0.07843138, 1, 0, 1,
-0.5211502, 0.3419304, 0.07136536, 0.07450981, 1, 0, 1,
-0.5207641, 1.065858, 0.9602135, 0.06666667, 1, 0, 1,
-0.5168957, 0.9957736, -1.06593, 0.0627451, 1, 0, 1,
-0.5153453, 1.011035, 2.581007, 0.05490196, 1, 0, 1,
-0.5150639, -0.8511772, -2.701693, 0.05098039, 1, 0, 1,
-0.5119761, -0.259185, -0.8611206, 0.04313726, 1, 0, 1,
-0.5109693, -0.5992974, -2.395885, 0.03921569, 1, 0, 1,
-0.4993579, -0.3171583, -0.1538768, 0.03137255, 1, 0, 1,
-0.4948338, 0.7703745, -1.230564, 0.02745098, 1, 0, 1,
-0.4891692, 0.06860178, -3.663193, 0.01960784, 1, 0, 1,
-0.4841468, 0.9864336, -0.02810722, 0.01568628, 1, 0, 1,
-0.4838809, -0.1781955, -3.533264, 0.007843138, 1, 0, 1,
-0.4815114, -0.4821187, -1.851401, 0.003921569, 1, 0, 1,
-0.4790614, 0.5691164, 0.5242435, 0, 1, 0.003921569, 1,
-0.4702054, -0.5735399, -3.350179, 0, 1, 0.01176471, 1,
-0.4621907, 1.060393, 0.6469076, 0, 1, 0.01568628, 1,
-0.460155, -0.03864878, -0.8758168, 0, 1, 0.02352941, 1,
-0.4544695, 0.1543194, 1.259725, 0, 1, 0.02745098, 1,
-0.4461284, 1.305158, -1.572633, 0, 1, 0.03529412, 1,
-0.4397922, -2.94751, -1.848383, 0, 1, 0.03921569, 1,
-0.4386813, -0.232172, -0.6803303, 0, 1, 0.04705882, 1,
-0.4386322, 1.602325, -1.490683, 0, 1, 0.05098039, 1,
-0.4370019, -0.1380019, -3.373382, 0, 1, 0.05882353, 1,
-0.4302271, 0.006138648, -0.3701643, 0, 1, 0.0627451, 1,
-0.424934, -0.4218847, -2.694196, 0, 1, 0.07058824, 1,
-0.4217846, -2.836653, -4.288518, 0, 1, 0.07450981, 1,
-0.4159792, 1.367622, 1.27219, 0, 1, 0.08235294, 1,
-0.4144752, -0.01277081, -4.63971, 0, 1, 0.08627451, 1,
-0.4124098, 2.105683, 0.6482674, 0, 1, 0.09411765, 1,
-0.4101797, 0.104162, -0.1376546, 0, 1, 0.1019608, 1,
-0.4063228, -0.2338865, -3.397352, 0, 1, 0.1058824, 1,
-0.4054466, -0.7886777, -0.5041058, 0, 1, 0.1137255, 1,
-0.4017822, 0.6147906, 0.0320985, 0, 1, 0.1176471, 1,
-0.3980245, -0.3776994, -3.936498, 0, 1, 0.1254902, 1,
-0.3920255, 0.06421475, -1.230641, 0, 1, 0.1294118, 1,
-0.3884735, 0.4329411, -1.412386, 0, 1, 0.1372549, 1,
-0.3881677, -0.4548479, -2.2946, 0, 1, 0.1411765, 1,
-0.3878085, 0.8609045, 1.768464, 0, 1, 0.1490196, 1,
-0.3848276, -1.898126, -3.816622, 0, 1, 0.1529412, 1,
-0.3811432, 1.349238, -1.732424, 0, 1, 0.1607843, 1,
-0.3770302, 1.906435, 0.9573863, 0, 1, 0.1647059, 1,
-0.3764062, 0.7581775, -1.189043, 0, 1, 0.172549, 1,
-0.3725682, -0.01164466, -1.141822, 0, 1, 0.1764706, 1,
-0.371795, -0.09035421, -3.788264, 0, 1, 0.1843137, 1,
-0.3702022, -0.0134458, -1.250019, 0, 1, 0.1882353, 1,
-0.3603522, 0.6786286, 0.8107072, 0, 1, 0.1960784, 1,
-0.3568795, 0.7741941, -1.764785, 0, 1, 0.2039216, 1,
-0.3556044, -1.242996, -2.328706, 0, 1, 0.2078431, 1,
-0.3545102, 0.3404316, -1.015267, 0, 1, 0.2156863, 1,
-0.3522354, 0.6160508, -2.186213, 0, 1, 0.2196078, 1,
-0.3494924, 2.212512, -1.359091, 0, 1, 0.227451, 1,
-0.3493484, 1.28007, -1.172921, 0, 1, 0.2313726, 1,
-0.3447339, -0.4750052, -0.6468169, 0, 1, 0.2392157, 1,
-0.3412221, -2.321482, -2.092873, 0, 1, 0.2431373, 1,
-0.3387599, 0.3916524, 0.001363902, 0, 1, 0.2509804, 1,
-0.3375742, 0.4519271, -0.9922186, 0, 1, 0.254902, 1,
-0.3360986, 0.09589835, -1.751021, 0, 1, 0.2627451, 1,
-0.3355434, -1.488019, -6.134351, 0, 1, 0.2666667, 1,
-0.3348041, 0.6223629, -0.8836288, 0, 1, 0.2745098, 1,
-0.3326396, 0.1913933, -1.419813, 0, 1, 0.2784314, 1,
-0.327625, 0.7071221, -1.781082, 0, 1, 0.2862745, 1,
-0.3261501, 0.7183868, -0.28526, 0, 1, 0.2901961, 1,
-0.3256448, 0.07252212, -1.249839, 0, 1, 0.2980392, 1,
-0.3248779, 0.7191782, -0.4434474, 0, 1, 0.3058824, 1,
-0.3220378, 0.1228214, -0.4788138, 0, 1, 0.3098039, 1,
-0.3214145, 1.518569, 0.7091935, 0, 1, 0.3176471, 1,
-0.3206151, 1.785375, 0.8788038, 0, 1, 0.3215686, 1,
-0.3191441, -0.924695, -4.272073, 0, 1, 0.3294118, 1,
-0.3190451, -2.724803, -2.660391, 0, 1, 0.3333333, 1,
-0.3169933, 0.3580945, -0.6069661, 0, 1, 0.3411765, 1,
-0.3157101, 0.02119955, -2.887176, 0, 1, 0.345098, 1,
-0.3144808, -0.049233, -1.963081, 0, 1, 0.3529412, 1,
-0.3133155, -0.4740603, -2.146403, 0, 1, 0.3568628, 1,
-0.3114839, 0.5544771, -1.701683, 0, 1, 0.3647059, 1,
-0.3105128, -0.1446609, -0.5044426, 0, 1, 0.3686275, 1,
-0.3095665, 0.2916083, 0.7014003, 0, 1, 0.3764706, 1,
-0.3081244, -0.03614191, -1.319308, 0, 1, 0.3803922, 1,
-0.3079822, -0.6985751, -4.163016, 0, 1, 0.3882353, 1,
-0.3048063, 0.09321921, -2.50678, 0, 1, 0.3921569, 1,
-0.2998291, 0.6443455, -0.4607743, 0, 1, 0.4, 1,
-0.2954838, -0.9763805, -3.439291, 0, 1, 0.4078431, 1,
-0.2949755, 0.6034058, 0.6160616, 0, 1, 0.4117647, 1,
-0.2936103, 0.7158586, -2.100692, 0, 1, 0.4196078, 1,
-0.2904295, -0.5429409, -1.880735, 0, 1, 0.4235294, 1,
-0.2870515, 0.4049825, -2.183587, 0, 1, 0.4313726, 1,
-0.284717, 0.307665, -1.167021, 0, 1, 0.4352941, 1,
-0.2816099, 0.2173501, -0.03392764, 0, 1, 0.4431373, 1,
-0.2776859, 0.2724331, -1.92384, 0, 1, 0.4470588, 1,
-0.276513, 0.5916289, -0.3541403, 0, 1, 0.454902, 1,
-0.2763976, -0.5387034, -2.24266, 0, 1, 0.4588235, 1,
-0.2726573, -0.245389, -3.029365, 0, 1, 0.4666667, 1,
-0.2667159, -0.2890976, -2.292351, 0, 1, 0.4705882, 1,
-0.2612942, -0.634824, -0.9577315, 0, 1, 0.4784314, 1,
-0.2588274, -0.4096817, -1.931811, 0, 1, 0.4823529, 1,
-0.2575851, 0.6143318, 1.183439, 0, 1, 0.4901961, 1,
-0.2515224, -0.3761889, -3.347404, 0, 1, 0.4941176, 1,
-0.2453841, 1.252564, -2.050391, 0, 1, 0.5019608, 1,
-0.2368401, 0.228837, -0.9238445, 0, 1, 0.509804, 1,
-0.2291237, 0.85902, -0.1172817, 0, 1, 0.5137255, 1,
-0.2287517, 0.3025031, 0.9572845, 0, 1, 0.5215687, 1,
-0.2215172, -0.7608859, -3.535422, 0, 1, 0.5254902, 1,
-0.2164796, 0.3892068, -1.070278, 0, 1, 0.5333334, 1,
-0.2152654, 1.060999, -1.148731, 0, 1, 0.5372549, 1,
-0.2137898, -1.354026, -2.894203, 0, 1, 0.5450981, 1,
-0.2124489, -0.5436008, -3.596159, 0, 1, 0.5490196, 1,
-0.2120434, -1.341979, -2.392379, 0, 1, 0.5568628, 1,
-0.2095693, -0.1654401, -2.855194, 0, 1, 0.5607843, 1,
-0.2093296, -0.7534922, 0.217327, 0, 1, 0.5686275, 1,
-0.2042231, 0.6487629, 0.7414824, 0, 1, 0.572549, 1,
-0.1932369, 1.383588, -0.04364536, 0, 1, 0.5803922, 1,
-0.1867566, 0.4080489, 1.091105, 0, 1, 0.5843138, 1,
-0.1808656, -0.3563909, -3.071307, 0, 1, 0.5921569, 1,
-0.1789654, -0.2923668, -0.6633287, 0, 1, 0.5960785, 1,
-0.1770253, -0.1712679, -3.162866, 0, 1, 0.6039216, 1,
-0.173392, 0.4489118, 0.5514244, 0, 1, 0.6117647, 1,
-0.1684799, 1.16778, 0.08181141, 0, 1, 0.6156863, 1,
-0.165466, 0.292176, 0.5181832, 0, 1, 0.6235294, 1,
-0.1626698, -1.520554, -1.430038, 0, 1, 0.627451, 1,
-0.1605434, 0.838973, 1.300774, 0, 1, 0.6352941, 1,
-0.160501, 2.283913, -0.9019608, 0, 1, 0.6392157, 1,
-0.1495491, 0.9844407, -0.4930104, 0, 1, 0.6470588, 1,
-0.1475833, -1.86472, -2.495606, 0, 1, 0.6509804, 1,
-0.146561, 1.099361, -1.151249, 0, 1, 0.6588235, 1,
-0.1353954, 0.1924514, -2.285817, 0, 1, 0.6627451, 1,
-0.1296369, 0.04970637, -1.440191, 0, 1, 0.6705883, 1,
-0.1289174, -0.1891151, -2.609249, 0, 1, 0.6745098, 1,
-0.1239369, -1.694412, -3.78725, 0, 1, 0.682353, 1,
-0.1237058, 0.6001855, 0.6943634, 0, 1, 0.6862745, 1,
-0.1231028, 0.2062499, -0.730319, 0, 1, 0.6941177, 1,
-0.122353, -0.558787, -3.685426, 0, 1, 0.7019608, 1,
-0.121572, -0.0267738, -0.9554641, 0, 1, 0.7058824, 1,
-0.119245, 1.97144, 0.1385782, 0, 1, 0.7137255, 1,
-0.1149511, -0.6886913, -5.515752, 0, 1, 0.7176471, 1,
-0.1139948, 0.07380848, -2.359968, 0, 1, 0.7254902, 1,
-0.1131577, 0.1174287, -2.101699, 0, 1, 0.7294118, 1,
-0.1128849, -1.009054, -3.208224, 0, 1, 0.7372549, 1,
-0.1128698, -1.136888, -3.347197, 0, 1, 0.7411765, 1,
-0.111815, 0.7783333, -3.523537, 0, 1, 0.7490196, 1,
-0.1102735, -0.4971342, -3.727596, 0, 1, 0.7529412, 1,
-0.1083053, -1.132174, -2.512256, 0, 1, 0.7607843, 1,
-0.1052074, 0.7616966, 0.2975942, 0, 1, 0.7647059, 1,
-0.1024494, -0.3117741, -1.85454, 0, 1, 0.772549, 1,
-0.09872195, 0.2976753, 0.7193829, 0, 1, 0.7764706, 1,
-0.09848456, 1.234814, -1.170039, 0, 1, 0.7843137, 1,
-0.09785054, -0.3251007, -2.027768, 0, 1, 0.7882353, 1,
-0.09653546, 0.06062083, -0.08885391, 0, 1, 0.7960784, 1,
-0.09494884, 1.325046, 0.406473, 0, 1, 0.8039216, 1,
-0.09393646, -0.530816, -2.45073, 0, 1, 0.8078431, 1,
-0.09328437, 0.1414373, -0.2073665, 0, 1, 0.8156863, 1,
-0.09261455, 0.7586603, -0.1091918, 0, 1, 0.8196079, 1,
-0.084182, 2.249615, 1.366733, 0, 1, 0.827451, 1,
-0.08196602, 1.429412, -2.021012, 0, 1, 0.8313726, 1,
-0.08184934, -0.1654365, -3.911135, 0, 1, 0.8392157, 1,
-0.07335792, -1.459831, -2.460706, 0, 1, 0.8431373, 1,
-0.07069549, 1.131588, -0.9988366, 0, 1, 0.8509804, 1,
-0.07028683, -0.2581557, -2.155172, 0, 1, 0.854902, 1,
-0.06976943, -0.2944829, -2.82116, 0, 1, 0.8627451, 1,
-0.06550049, -0.8585107, -1.247902, 0, 1, 0.8666667, 1,
-0.0631758, -0.7091618, -3.519802, 0, 1, 0.8745098, 1,
-0.06261272, -0.2340704, -1.308936, 0, 1, 0.8784314, 1,
-0.06022952, -0.7285947, -3.177415, 0, 1, 0.8862745, 1,
-0.05999397, -1.565727, -2.140139, 0, 1, 0.8901961, 1,
-0.0596601, 1.084083, -0.8710225, 0, 1, 0.8980392, 1,
-0.0589916, -0.9373257, -2.870494, 0, 1, 0.9058824, 1,
-0.0575571, 0.3556507, 0.5278703, 0, 1, 0.9098039, 1,
-0.05689229, 0.4912801, -0.9717836, 0, 1, 0.9176471, 1,
-0.05597362, 1.147861, -0.3611644, 0, 1, 0.9215686, 1,
-0.05007089, -0.4579796, -2.269075, 0, 1, 0.9294118, 1,
-0.04467403, -0.2035515, -4.724019, 0, 1, 0.9333333, 1,
-0.04370351, 1.517914, 0.1219293, 0, 1, 0.9411765, 1,
-0.04035084, 0.7587436, 0.641367, 0, 1, 0.945098, 1,
-0.03677035, 0.9677442, 0.008898918, 0, 1, 0.9529412, 1,
-0.02975485, 1.253301, 0.04417447, 0, 1, 0.9568627, 1,
-0.02380236, 1.979668, 0.7002581, 0, 1, 0.9647059, 1,
-0.02279275, -1.263856, -1.999592, 0, 1, 0.9686275, 1,
-0.011814, 0.8266348, 0.8424239, 0, 1, 0.9764706, 1,
-0.01149625, -0.4840907, -2.321506, 0, 1, 0.9803922, 1,
-0.009195407, 0.3876057, 0.03530507, 0, 1, 0.9882353, 1,
-0.007346501, 0.139185, -0.485445, 0, 1, 0.9921569, 1,
-0.002556443, -0.4021803, -2.394456, 0, 1, 1, 1,
0.001430881, -0.1657815, 2.833492, 0, 0.9921569, 1, 1,
0.01106024, 0.8220323, -0.06664849, 0, 0.9882353, 1, 1,
0.0132071, 2.961191, 0.3794329, 0, 0.9803922, 1, 1,
0.01858317, -0.1890635, 4.025774, 0, 0.9764706, 1, 1,
0.02314369, 0.2940487, 0.6290125, 0, 0.9686275, 1, 1,
0.02514658, -1.541144, 4.203972, 0, 0.9647059, 1, 1,
0.02887141, 0.5239025, 0.7508852, 0, 0.9568627, 1, 1,
0.03054029, -1.196066, 4.519211, 0, 0.9529412, 1, 1,
0.03132565, -1.728776, 2.738778, 0, 0.945098, 1, 1,
0.03238897, 0.8789557, 0.2483465, 0, 0.9411765, 1, 1,
0.03290242, 0.001474786, 0.3607902, 0, 0.9333333, 1, 1,
0.03469266, 0.5531073, -0.8629352, 0, 0.9294118, 1, 1,
0.03605999, 0.3033354, 0.007459125, 0, 0.9215686, 1, 1,
0.0361752, -2.38315, 3.453612, 0, 0.9176471, 1, 1,
0.03772055, 0.2789791, 0.9762099, 0, 0.9098039, 1, 1,
0.03844198, -0.00924206, 1.879135, 0, 0.9058824, 1, 1,
0.03887045, -0.2686261, 3.462618, 0, 0.8980392, 1, 1,
0.03892208, 0.6516899, -0.5271059, 0, 0.8901961, 1, 1,
0.04064536, -0.4682136, 2.751836, 0, 0.8862745, 1, 1,
0.04447808, 0.9294328, 0.9432418, 0, 0.8784314, 1, 1,
0.04522349, 0.5581966, 1.295887, 0, 0.8745098, 1, 1,
0.04825516, -1.304669, 3.82973, 0, 0.8666667, 1, 1,
0.0484168, -0.3732736, 1.590288, 0, 0.8627451, 1, 1,
0.05253293, 2.595821, 0.398979, 0, 0.854902, 1, 1,
0.05483949, -0.1164231, 3.062127, 0, 0.8509804, 1, 1,
0.05495186, 0.6551291, 0.06603513, 0, 0.8431373, 1, 1,
0.05534881, -0.02468418, 2.43881, 0, 0.8392157, 1, 1,
0.06163939, -0.1915669, 3.097489, 0, 0.8313726, 1, 1,
0.06180119, 1.59228, 0.8335831, 0, 0.827451, 1, 1,
0.06815179, -0.04627555, 2.596343, 0, 0.8196079, 1, 1,
0.07123816, 1.071582, 0.04601728, 0, 0.8156863, 1, 1,
0.07705925, 0.04459191, 1.104877, 0, 0.8078431, 1, 1,
0.07916443, -0.3630868, 0.2482588, 0, 0.8039216, 1, 1,
0.08282835, -2.139502, 2.180349, 0, 0.7960784, 1, 1,
0.08637794, -0.7866369, 3.879005, 0, 0.7882353, 1, 1,
0.08748124, 0.3575326, 0.07043201, 0, 0.7843137, 1, 1,
0.09555582, 1.521637, 2.328644, 0, 0.7764706, 1, 1,
0.09845351, 0.4868729, -0.4101216, 0, 0.772549, 1, 1,
0.09853578, -0.1610007, 4.497043, 0, 0.7647059, 1, 1,
0.09932862, -1.722242, 1.102035, 0, 0.7607843, 1, 1,
0.09939068, -1.330411, 2.557463, 0, 0.7529412, 1, 1,
0.09943069, 1.259134, 2.047041, 0, 0.7490196, 1, 1,
0.09952363, -0.001591993, 1.967224, 0, 0.7411765, 1, 1,
0.1010158, -0.3865504, 3.086376, 0, 0.7372549, 1, 1,
0.1014055, -0.8566338, 3.065088, 0, 0.7294118, 1, 1,
0.101579, -0.9626921, 2.829497, 0, 0.7254902, 1, 1,
0.1059138, 0.07220694, 1.760148, 0, 0.7176471, 1, 1,
0.1059342, -0.2100081, 3.062055, 0, 0.7137255, 1, 1,
0.1077473, 0.1927948, 2.60496, 0, 0.7058824, 1, 1,
0.1146323, -0.316627, 1.222094, 0, 0.6980392, 1, 1,
0.119457, -0.724888, 3.8159, 0, 0.6941177, 1, 1,
0.1225798, -0.8131868, 2.802256, 0, 0.6862745, 1, 1,
0.1266318, -0.5135708, 3.427487, 0, 0.682353, 1, 1,
0.1399481, 0.1466378, 0.4935847, 0, 0.6745098, 1, 1,
0.1449519, -0.4562062, 3.148594, 0, 0.6705883, 1, 1,
0.1499864, 1.322868, -2.438044, 0, 0.6627451, 1, 1,
0.1500386, 0.4002087, 0.6227009, 0, 0.6588235, 1, 1,
0.1505973, 0.8297179, 0.8908956, 0, 0.6509804, 1, 1,
0.1566563, 0.3471173, 1.474236, 0, 0.6470588, 1, 1,
0.1572435, -0.4314568, 2.581845, 0, 0.6392157, 1, 1,
0.1574289, 0.8716887, -0.4447848, 0, 0.6352941, 1, 1,
0.1676104, 1.291089, 0.898293, 0, 0.627451, 1, 1,
0.1718774, -1.065872, 4.65871, 0, 0.6235294, 1, 1,
0.1723555, 0.1899661, 1.345429, 0, 0.6156863, 1, 1,
0.1757098, -1.109927, 3.79914, 0, 0.6117647, 1, 1,
0.1777851, 0.7493807, 0.4576525, 0, 0.6039216, 1, 1,
0.1788704, 0.002825539, 0.6637067, 0, 0.5960785, 1, 1,
0.1802502, 0.04045745, 2.625794, 0, 0.5921569, 1, 1,
0.1818925, 0.2355321, 0.8370451, 0, 0.5843138, 1, 1,
0.1847848, 0.7067911, -0.5802099, 0, 0.5803922, 1, 1,
0.188434, 1.848652, 1.170278, 0, 0.572549, 1, 1,
0.1906438, -0.001228252, 1.578623, 0, 0.5686275, 1, 1,
0.1968711, 1.107824, -0.4311841, 0, 0.5607843, 1, 1,
0.1969528, 0.06621887, 2.139475, 0, 0.5568628, 1, 1,
0.1972912, 1.269726, -0.01343245, 0, 0.5490196, 1, 1,
0.1984682, -1.003864, 0.9908464, 0, 0.5450981, 1, 1,
0.2064281, 1.221987, -0.00706537, 0, 0.5372549, 1, 1,
0.2087574, -0.7734393, 2.895782, 0, 0.5333334, 1, 1,
0.215409, 0.371515, 1.344867, 0, 0.5254902, 1, 1,
0.215518, -0.7601721, 2.356655, 0, 0.5215687, 1, 1,
0.2178621, 1.28637, 1.477845, 0, 0.5137255, 1, 1,
0.2181524, 0.5228898, 0.3069161, 0, 0.509804, 1, 1,
0.2183971, -0.5766106, 3.429939, 0, 0.5019608, 1, 1,
0.2194493, -0.1589633, 2.646051, 0, 0.4941176, 1, 1,
0.2205996, -0.4218805, 1.991038, 0, 0.4901961, 1, 1,
0.2209695, 0.7037508, -1.453902, 0, 0.4823529, 1, 1,
0.2241519, 0.5986285, 0.03566963, 0, 0.4784314, 1, 1,
0.2258458, -1.331282, 1.147393, 0, 0.4705882, 1, 1,
0.2280194, 0.06951568, -0.07445434, 0, 0.4666667, 1, 1,
0.2314176, 1.575844, -1.079996, 0, 0.4588235, 1, 1,
0.2326435, -1.01456, 3.010896, 0, 0.454902, 1, 1,
0.2344299, -1.616176, 2.754816, 0, 0.4470588, 1, 1,
0.2376812, 0.1199222, 1.991537, 0, 0.4431373, 1, 1,
0.238613, -0.5498807, 3.641668, 0, 0.4352941, 1, 1,
0.2437063, -0.08572146, 2.030292, 0, 0.4313726, 1, 1,
0.2466537, -1.322819, 2.908884, 0, 0.4235294, 1, 1,
0.2467179, 1.403734, 0.8230149, 0, 0.4196078, 1, 1,
0.2483101, -0.7224914, 2.836014, 0, 0.4117647, 1, 1,
0.2602602, -0.5856231, 1.532, 0, 0.4078431, 1, 1,
0.2682032, -0.6835909, 1.866305, 0, 0.4, 1, 1,
0.2683177, 0.2469481, -0.09005503, 0, 0.3921569, 1, 1,
0.270291, -1.052281, 1.317441, 0, 0.3882353, 1, 1,
0.2828475, 1.460762, 0.4656505, 0, 0.3803922, 1, 1,
0.2879611, -1.917549, 1.968929, 0, 0.3764706, 1, 1,
0.2885194, -0.478688, 1.023647, 0, 0.3686275, 1, 1,
0.2896097, -0.5942522, 2.734804, 0, 0.3647059, 1, 1,
0.2929027, -1.577561, 4.473249, 0, 0.3568628, 1, 1,
0.2936972, -1.55578, 1.979729, 0, 0.3529412, 1, 1,
0.2958664, -0.9872369, 3.1496, 0, 0.345098, 1, 1,
0.3023419, 0.416522, 1.621485, 0, 0.3411765, 1, 1,
0.3044153, -0.5369214, 3.008719, 0, 0.3333333, 1, 1,
0.3066815, -0.6278277, 2.200764, 0, 0.3294118, 1, 1,
0.3079904, -0.2056553, 2.252854, 0, 0.3215686, 1, 1,
0.3126431, 0.120732, 0.5855056, 0, 0.3176471, 1, 1,
0.3174027, 1.386677, -0.3563805, 0, 0.3098039, 1, 1,
0.3213111, -0.02179678, 1.066147, 0, 0.3058824, 1, 1,
0.3255153, 0.8537057, 0.3329141, 0, 0.2980392, 1, 1,
0.32614, -0.5820146, 2.871293, 0, 0.2901961, 1, 1,
0.3318742, -0.3621595, 1.969591, 0, 0.2862745, 1, 1,
0.3392812, -0.9597567, 3.03825, 0, 0.2784314, 1, 1,
0.3394993, 1.2119, 0.9011598, 0, 0.2745098, 1, 1,
0.3399809, 1.678471, -0.1197376, 0, 0.2666667, 1, 1,
0.3445638, -2.764287, 3.443272, 0, 0.2627451, 1, 1,
0.3535751, -0.01960893, 1.337116, 0, 0.254902, 1, 1,
0.3538443, 0.6017309, 2.508554, 0, 0.2509804, 1, 1,
0.3552282, -0.6621237, 2.825324, 0, 0.2431373, 1, 1,
0.3632089, -0.3142832, 1.300578, 0, 0.2392157, 1, 1,
0.3638572, 0.5848145, 1.574711, 0, 0.2313726, 1, 1,
0.3639353, 1.031551, 0.150693, 0, 0.227451, 1, 1,
0.3665904, 1.468563, -1.190333, 0, 0.2196078, 1, 1,
0.3670752, -0.3311541, 2.859152, 0, 0.2156863, 1, 1,
0.3676901, 0.1820727, 2.057498, 0, 0.2078431, 1, 1,
0.372574, 1.22591, 0.306242, 0, 0.2039216, 1, 1,
0.3768088, -0.1265839, 2.530701, 0, 0.1960784, 1, 1,
0.3796231, -0.722715, 0.6216233, 0, 0.1882353, 1, 1,
0.3803901, -0.04231737, 1.807602, 0, 0.1843137, 1, 1,
0.3887593, 1.428012, -0.5142493, 0, 0.1764706, 1, 1,
0.3911737, -0.7637625, 3.51585, 0, 0.172549, 1, 1,
0.4011841, 1.237548, -0.6922128, 0, 0.1647059, 1, 1,
0.4048511, -1.348388, 2.783378, 0, 0.1607843, 1, 1,
0.405871, -1.568587, 3.555677, 0, 0.1529412, 1, 1,
0.407766, 0.5568532, 0.06201109, 0, 0.1490196, 1, 1,
0.4078511, -0.582015, 2.212883, 0, 0.1411765, 1, 1,
0.4095705, 0.1734418, 2.302744, 0, 0.1372549, 1, 1,
0.4123072, 1.138417, 0.426919, 0, 0.1294118, 1, 1,
0.4134414, -1.266414, 2.764255, 0, 0.1254902, 1, 1,
0.4156256, 1.443151, 0.01501106, 0, 0.1176471, 1, 1,
0.4167891, 0.1042466, 2.996366, 0, 0.1137255, 1, 1,
0.4172495, -1.218259, 4.018222, 0, 0.1058824, 1, 1,
0.4173589, 0.3825666, 2.111487, 0, 0.09803922, 1, 1,
0.4183038, 0.6071825, 0.4779049, 0, 0.09411765, 1, 1,
0.4217226, -0.4358942, 3.777078, 0, 0.08627451, 1, 1,
0.4235269, -0.1972683, 2.042246, 0, 0.08235294, 1, 1,
0.4242309, -0.3829997, 3.148738, 0, 0.07450981, 1, 1,
0.428758, -0.1696379, 2.637008, 0, 0.07058824, 1, 1,
0.4353186, 0.4297492, 1.4141, 0, 0.0627451, 1, 1,
0.4357345, -0.4833636, 1.676263, 0, 0.05882353, 1, 1,
0.4466175, -1.053496, 2.000287, 0, 0.05098039, 1, 1,
0.4515485, -1.479105, 4.685388, 0, 0.04705882, 1, 1,
0.4563987, 0.2590869, 0.1071618, 0, 0.03921569, 1, 1,
0.4576752, 0.6981989, 0.0837356, 0, 0.03529412, 1, 1,
0.4588669, -3.881213, 3.146453, 0, 0.02745098, 1, 1,
0.459625, 0.2716576, -0.1583888, 0, 0.02352941, 1, 1,
0.4609234, 0.952564, 0.3978181, 0, 0.01568628, 1, 1,
0.4662152, -1.669205, 2.206683, 0, 0.01176471, 1, 1,
0.470935, -0.05829448, 3.215695, 0, 0.003921569, 1, 1,
0.4718776, 0.7133306, 0.3283124, 0.003921569, 0, 1, 1,
0.4726116, 2.298499, 0.3544981, 0.007843138, 0, 1, 1,
0.4753041, -0.2595788, 3.842266, 0.01568628, 0, 1, 1,
0.4771107, 0.8481534, 0.8043804, 0.01960784, 0, 1, 1,
0.4774184, 1.122814, 1.004355, 0.02745098, 0, 1, 1,
0.4793172, 2.131857, 0.4948161, 0.03137255, 0, 1, 1,
0.4824376, -0.06264862, 1.952759, 0.03921569, 0, 1, 1,
0.4832241, -1.485545, 1.666638, 0.04313726, 0, 1, 1,
0.4835757, 3.104206, 1.798411, 0.05098039, 0, 1, 1,
0.4846638, -0.02298967, 3.054477, 0.05490196, 0, 1, 1,
0.4847101, -1.080277, 3.156085, 0.0627451, 0, 1, 1,
0.4857645, 1.202357, 0.7757437, 0.06666667, 0, 1, 1,
0.4872424, 0.1431339, 1.173995, 0.07450981, 0, 1, 1,
0.4880939, -0.867795, 3.622381, 0.07843138, 0, 1, 1,
0.4889835, 0.8103672, 2.733171, 0.08627451, 0, 1, 1,
0.492842, -1.02727, 1.466913, 0.09019608, 0, 1, 1,
0.4998026, -2.426886, 3.829245, 0.09803922, 0, 1, 1,
0.5008646, -2.312975, 1.52942, 0.1058824, 0, 1, 1,
0.5012724, -0.3773434, 2.213755, 0.1098039, 0, 1, 1,
0.504254, 0.2600603, 1.016015, 0.1176471, 0, 1, 1,
0.5070325, -0.04736377, 1.567669, 0.1215686, 0, 1, 1,
0.508671, -0.5263733, 1.454556, 0.1294118, 0, 1, 1,
0.5109584, 1.541784, -0.5671135, 0.1333333, 0, 1, 1,
0.5118731, 1.367577, 1.89755, 0.1411765, 0, 1, 1,
0.5236218, -0.9987219, 2.897239, 0.145098, 0, 1, 1,
0.5294555, 0.4609838, 0.8049141, 0.1529412, 0, 1, 1,
0.5295386, 1.185758, -1.269122, 0.1568628, 0, 1, 1,
0.5306094, -0.009837975, 1.756663, 0.1647059, 0, 1, 1,
0.5344414, 1.438116, -0.1229674, 0.1686275, 0, 1, 1,
0.5345642, 0.7547094, 0.1366025, 0.1764706, 0, 1, 1,
0.5376386, 0.3376586, 2.197663, 0.1803922, 0, 1, 1,
0.5461163, 0.3464838, 0.1253442, 0.1882353, 0, 1, 1,
0.5491601, -1.03976, 2.336369, 0.1921569, 0, 1, 1,
0.5500669, 2.067707, -0.1636169, 0.2, 0, 1, 1,
0.5521443, -1.367763, 2.091584, 0.2078431, 0, 1, 1,
0.5594304, -0.04941843, 2.06816, 0.2117647, 0, 1, 1,
0.566067, -0.2002576, 2.098721, 0.2196078, 0, 1, 1,
0.5664643, -1.369852, 1.165961, 0.2235294, 0, 1, 1,
0.5664715, -0.2785227, 1.878639, 0.2313726, 0, 1, 1,
0.5709223, 0.01127777, 2.105542, 0.2352941, 0, 1, 1,
0.5755786, 0.3615088, -1.120494, 0.2431373, 0, 1, 1,
0.5774644, -0.3092554, 2.009928, 0.2470588, 0, 1, 1,
0.579608, -0.1347176, 3.261535, 0.254902, 0, 1, 1,
0.5825447, -1.138858, 2.855071, 0.2588235, 0, 1, 1,
0.5842903, 0.1117751, 2.828043, 0.2666667, 0, 1, 1,
0.5850123, -1.244345, 1.845472, 0.2705882, 0, 1, 1,
0.585545, -1.990023, 2.95357, 0.2784314, 0, 1, 1,
0.5871646, 0.5307328, 0.2845115, 0.282353, 0, 1, 1,
0.5880323, 0.06202994, 2.558576, 0.2901961, 0, 1, 1,
0.59194, -0.2745827, 2.104518, 0.2941177, 0, 1, 1,
0.5925215, -0.6020038, 1.946188, 0.3019608, 0, 1, 1,
0.6025, 1.294837, -0.9800309, 0.3098039, 0, 1, 1,
0.6030729, 0.1367424, 2.54819, 0.3137255, 0, 1, 1,
0.608623, -0.609968, 1.432013, 0.3215686, 0, 1, 1,
0.6096323, -0.2082801, 0.2829209, 0.3254902, 0, 1, 1,
0.6102536, -1.401588, 4.477846, 0.3333333, 0, 1, 1,
0.6105764, -0.6161131, 0.4125955, 0.3372549, 0, 1, 1,
0.6133114, -0.6913177, 2.526223, 0.345098, 0, 1, 1,
0.6151766, -0.6450805, 2.33315, 0.3490196, 0, 1, 1,
0.6169001, -0.14578, 2.252697, 0.3568628, 0, 1, 1,
0.6215931, 0.7694726, 0.6886764, 0.3607843, 0, 1, 1,
0.6239623, -0.8944631, 3.916231, 0.3686275, 0, 1, 1,
0.62617, 0.8702639, 1.906533, 0.372549, 0, 1, 1,
0.6267424, -0.9251059, 1.70206, 0.3803922, 0, 1, 1,
0.6272463, 0.1271691, -1.109372, 0.3843137, 0, 1, 1,
0.6322656, 0.08799469, 0.9969191, 0.3921569, 0, 1, 1,
0.635014, -0.2826986, 2.745241, 0.3960784, 0, 1, 1,
0.6375328, 0.7556754, 0.5536877, 0.4039216, 0, 1, 1,
0.6395393, -0.7982542, 1.698442, 0.4117647, 0, 1, 1,
0.6462296, 0.1848373, 2.5942, 0.4156863, 0, 1, 1,
0.64974, -1.337178, 1.504786, 0.4235294, 0, 1, 1,
0.6549942, -0.2922152, 2.15401, 0.427451, 0, 1, 1,
0.6550796, 0.6011701, 0.8018834, 0.4352941, 0, 1, 1,
0.6560289, 0.7743391, 1.691483, 0.4392157, 0, 1, 1,
0.6586412, 1.607015, 0.1945211, 0.4470588, 0, 1, 1,
0.6635817, -0.745002, 1.556128, 0.4509804, 0, 1, 1,
0.6652931, 0.9242724, 1.321598, 0.4588235, 0, 1, 1,
0.6660188, 0.1682801, 3.615539, 0.4627451, 0, 1, 1,
0.6677294, -0.0746982, 1.609779, 0.4705882, 0, 1, 1,
0.6682642, -0.6130692, 3.460108, 0.4745098, 0, 1, 1,
0.6713966, 0.1810554, 0.7980797, 0.4823529, 0, 1, 1,
0.6747177, -0.1686991, 1.2387, 0.4862745, 0, 1, 1,
0.6811848, 0.1360378, 1.681958, 0.4941176, 0, 1, 1,
0.6827746, -0.8521153, -0.5100912, 0.5019608, 0, 1, 1,
0.6921447, 1.053558, 0.7471902, 0.5058824, 0, 1, 1,
0.695993, 0.8960729, -1.863451, 0.5137255, 0, 1, 1,
0.6962482, -0.8571674, 1.580269, 0.5176471, 0, 1, 1,
0.6986755, -0.987515, 1.594245, 0.5254902, 0, 1, 1,
0.6988646, -0.06075881, 1.396228, 0.5294118, 0, 1, 1,
0.7000015, 0.538218, 2.523482, 0.5372549, 0, 1, 1,
0.7007487, 0.6472059, 1.684156, 0.5411765, 0, 1, 1,
0.7010568, -1.380315, 3.653639, 0.5490196, 0, 1, 1,
0.7015822, 1.489087, 0.08352908, 0.5529412, 0, 1, 1,
0.7031857, 0.8501309, 1.207385, 0.5607843, 0, 1, 1,
0.7063062, 1.27792, 0.227321, 0.5647059, 0, 1, 1,
0.7110389, 0.03698828, 1.854509, 0.572549, 0, 1, 1,
0.7119865, -0.2679581, 3.276598, 0.5764706, 0, 1, 1,
0.7125798, 1.312472, 1.334751, 0.5843138, 0, 1, 1,
0.7135072, -0.9422901, 2.224275, 0.5882353, 0, 1, 1,
0.7169777, -0.5597703, 1.643665, 0.5960785, 0, 1, 1,
0.7182116, 2.161148, -0.5261274, 0.6039216, 0, 1, 1,
0.7183607, -2.195202, 2.284012, 0.6078432, 0, 1, 1,
0.724865, 1.723784, -1.365409, 0.6156863, 0, 1, 1,
0.7251943, -1.819245, 2.982306, 0.6196079, 0, 1, 1,
0.7252081, 1.661179, -0.2010218, 0.627451, 0, 1, 1,
0.7264459, 0.6184304, 2.488968, 0.6313726, 0, 1, 1,
0.7303003, -1.003237, 1.668366, 0.6392157, 0, 1, 1,
0.7306837, 0.7111052, 0.7463101, 0.6431373, 0, 1, 1,
0.7337295, -1.287634, 4.082654, 0.6509804, 0, 1, 1,
0.7405568, 0.5857177, 1.357044, 0.654902, 0, 1, 1,
0.7437966, -0.3171334, 1.502044, 0.6627451, 0, 1, 1,
0.7444994, 1.005285, -0.6621088, 0.6666667, 0, 1, 1,
0.7480134, 1.737095, 0.1619358, 0.6745098, 0, 1, 1,
0.7486884, -0.281032, 2.438254, 0.6784314, 0, 1, 1,
0.750911, -1.498088, 2.370575, 0.6862745, 0, 1, 1,
0.7538387, 0.1274514, 0.3194215, 0.6901961, 0, 1, 1,
0.7560962, -0.7228046, 2.935822, 0.6980392, 0, 1, 1,
0.7585616, -0.01551803, 1.606283, 0.7058824, 0, 1, 1,
0.7602075, -0.3018023, 1.346227, 0.7098039, 0, 1, 1,
0.7672729, -1.227076, 4.468384, 0.7176471, 0, 1, 1,
0.7736384, -1.728063, 1.916585, 0.7215686, 0, 1, 1,
0.7742257, 1.984558, -0.2300552, 0.7294118, 0, 1, 1,
0.7748302, -0.289782, 2.496245, 0.7333333, 0, 1, 1,
0.7751035, 1.596227, -0.01598774, 0.7411765, 0, 1, 1,
0.775965, -1.729018, 1.834593, 0.7450981, 0, 1, 1,
0.7760744, 1.442057, 0.4796659, 0.7529412, 0, 1, 1,
0.7777152, 2.550117, 0.7895724, 0.7568628, 0, 1, 1,
0.7800993, -1.189634, 3.984446, 0.7647059, 0, 1, 1,
0.7816868, -0.49844, 3.045483, 0.7686275, 0, 1, 1,
0.7833183, 1.018238, -1.485693, 0.7764706, 0, 1, 1,
0.7910395, 2.188908, -1.373118, 0.7803922, 0, 1, 1,
0.7914497, -0.2960164, 2.205983, 0.7882353, 0, 1, 1,
0.7922837, 0.1761003, 0.3977131, 0.7921569, 0, 1, 1,
0.798341, 0.1028121, 2.902451, 0.8, 0, 1, 1,
0.7984431, -0.4346797, 2.311185, 0.8078431, 0, 1, 1,
0.8041011, 0.3063644, 0.8107244, 0.8117647, 0, 1, 1,
0.8108414, -0.3289372, 1.642837, 0.8196079, 0, 1, 1,
0.8250934, -0.7053472, 2.747038, 0.8235294, 0, 1, 1,
0.8257602, -0.4397819, 1.906912, 0.8313726, 0, 1, 1,
0.8285609, -0.625948, 1.921233, 0.8352941, 0, 1, 1,
0.8328784, -0.3189247, 2.447425, 0.8431373, 0, 1, 1,
0.8382884, 1.937963, -0.06461819, 0.8470588, 0, 1, 1,
0.8387145, -1.890053, 1.464714, 0.854902, 0, 1, 1,
0.8430303, 0.732417, 0.4784008, 0.8588235, 0, 1, 1,
0.8491803, -1.383073, 1.547409, 0.8666667, 0, 1, 1,
0.8514903, 0.9161091, 0.3034377, 0.8705882, 0, 1, 1,
0.8517289, 0.5665248, 1.743761, 0.8784314, 0, 1, 1,
0.8589132, -0.7874362, 3.434728, 0.8823529, 0, 1, 1,
0.8604454, -0.07148069, 0.2773808, 0.8901961, 0, 1, 1,
0.8618593, 0.1983496, 0.357603, 0.8941177, 0, 1, 1,
0.8629904, -0.002875701, 0.470696, 0.9019608, 0, 1, 1,
0.8631303, -0.1450686, 2.662365, 0.9098039, 0, 1, 1,
0.872512, 0.3775515, 2.199462, 0.9137255, 0, 1, 1,
0.8756241, 0.3800802, 0.6361374, 0.9215686, 0, 1, 1,
0.8840228, -0.7659927, 2.454105, 0.9254902, 0, 1, 1,
0.8877293, 1.022409, -0.6079339, 0.9333333, 0, 1, 1,
0.888082, 0.3243299, 0.2553812, 0.9372549, 0, 1, 1,
0.888807, -0.1847046, 2.435001, 0.945098, 0, 1, 1,
0.9052477, -0.9750338, 1.644333, 0.9490196, 0, 1, 1,
0.9054404, 0.6933326, 1.893382, 0.9568627, 0, 1, 1,
0.9055459, 0.934045, 0.01368498, 0.9607843, 0, 1, 1,
0.9061378, -0.4629965, -0.2292544, 0.9686275, 0, 1, 1,
0.9066642, -1.09114, 2.603034, 0.972549, 0, 1, 1,
0.906732, -0.3761489, 2.733881, 0.9803922, 0, 1, 1,
0.9110435, -1.449144, 2.647465, 0.9843137, 0, 1, 1,
0.911912, 0.4834906, 0.3556026, 0.9921569, 0, 1, 1,
0.9159176, -1.693612, 3.072851, 0.9960784, 0, 1, 1,
0.9235843, -0.09401166, 1.828725, 1, 0, 0.9960784, 1,
0.9246156, 1.276695, 2.453259, 1, 0, 0.9882353, 1,
0.9321383, 0.1021993, 1.731371, 1, 0, 0.9843137, 1,
0.9404302, -2.243891, 2.849454, 1, 0, 0.9764706, 1,
0.9407653, 1.975826, 1.303712, 1, 0, 0.972549, 1,
0.9418381, 0.3576306, 0.8462656, 1, 0, 0.9647059, 1,
0.947726, -0.01142908, 2.508973, 1, 0, 0.9607843, 1,
0.9520831, 0.8811295, 0.918621, 1, 0, 0.9529412, 1,
0.9579578, 0.5900128, 1.171482, 1, 0, 0.9490196, 1,
0.9611819, -0.8634005, 1.269731, 1, 0, 0.9411765, 1,
0.9647378, 1.847255, 2.460994, 1, 0, 0.9372549, 1,
0.9685965, -0.6060077, 1.553886, 1, 0, 0.9294118, 1,
0.9697291, 0.07602007, 1.311113, 1, 0, 0.9254902, 1,
0.9728023, 1.07779, -0.4524916, 1, 0, 0.9176471, 1,
0.9819624, 2.393505, 1.145239, 1, 0, 0.9137255, 1,
0.9843723, -0.0732916, 1.670709, 1, 0, 0.9058824, 1,
0.9852066, -0.3702843, 2.387271, 1, 0, 0.9019608, 1,
0.986881, -0.005892078, 3.091021, 1, 0, 0.8941177, 1,
0.9886109, 0.558723, 1.919635, 1, 0, 0.8862745, 1,
0.990362, 0.9831851, 0.6732183, 1, 0, 0.8823529, 1,
0.9906379, -0.07072563, 1.102366, 1, 0, 0.8745098, 1,
0.9927464, 0.7955442, 1.103786, 1, 0, 0.8705882, 1,
0.995474, 0.4357007, 1.967896, 1, 0, 0.8627451, 1,
1.001666, -0.03190172, 2.231628, 1, 0, 0.8588235, 1,
1.002317, 2.058331, 0.5181218, 1, 0, 0.8509804, 1,
1.006602, 1.047827, 2.554077, 1, 0, 0.8470588, 1,
1.007799, -1.324994, 1.665244, 1, 0, 0.8392157, 1,
1.009798, -0.2298906, 0.9907688, 1, 0, 0.8352941, 1,
1.014349, 1.477458, 1.06303, 1, 0, 0.827451, 1,
1.021258, -1.016501, 2.81921, 1, 0, 0.8235294, 1,
1.029665, 0.8035969, 0.2319801, 1, 0, 0.8156863, 1,
1.037918, -0.4277219, 2.481996, 1, 0, 0.8117647, 1,
1.043831, 0.3666309, 0.3229574, 1, 0, 0.8039216, 1,
1.045328, -0.3936211, 0.3257646, 1, 0, 0.7960784, 1,
1.045609, 0.09080359, -0.4562835, 1, 0, 0.7921569, 1,
1.047618, 0.3445585, 1.326299, 1, 0, 0.7843137, 1,
1.048315, 1.241286, -0.9555427, 1, 0, 0.7803922, 1,
1.051931, 1.315858, 0.1630416, 1, 0, 0.772549, 1,
1.0681, -2.156491, 3.744248, 1, 0, 0.7686275, 1,
1.070914, -0.671739, 3.628219, 1, 0, 0.7607843, 1,
1.0782, 1.989358, 0.2827608, 1, 0, 0.7568628, 1,
1.08506, -1.064343, 3.914578, 1, 0, 0.7490196, 1,
1.085285, 0.2951159, 2.247368, 1, 0, 0.7450981, 1,
1.085923, 0.617761, 2.060821, 1, 0, 0.7372549, 1,
1.089137, -0.3395691, 2.255763, 1, 0, 0.7333333, 1,
1.09343, -0.4822612, 1.225498, 1, 0, 0.7254902, 1,
1.096268, -0.5961169, 2.008944, 1, 0, 0.7215686, 1,
1.096586, 1.640458, 1.2912, 1, 0, 0.7137255, 1,
1.098898, -1.474519, 1.529045, 1, 0, 0.7098039, 1,
1.11036, 1.590008, -0.2319252, 1, 0, 0.7019608, 1,
1.119881, 1.003809, -0.9121026, 1, 0, 0.6941177, 1,
1.137031, 1.066246, 1.267666, 1, 0, 0.6901961, 1,
1.140218, 0.8377625, 1.240647, 1, 0, 0.682353, 1,
1.145684, -0.1119114, 2.198012, 1, 0, 0.6784314, 1,
1.154987, 1.808146, -0.1253055, 1, 0, 0.6705883, 1,
1.157941, -0.7778633, 2.172321, 1, 0, 0.6666667, 1,
1.160694, 1.168875, 1.105587, 1, 0, 0.6588235, 1,
1.166687, 0.3976589, 1.226999, 1, 0, 0.654902, 1,
1.170129, -1.224555, 1.818721, 1, 0, 0.6470588, 1,
1.173053, -0.09980797, 3.212199, 1, 0, 0.6431373, 1,
1.179452, 0.5999648, 0.6288028, 1, 0, 0.6352941, 1,
1.187482, 1.024138, 0.5956837, 1, 0, 0.6313726, 1,
1.200169, -0.1139215, 2.326, 1, 0, 0.6235294, 1,
1.201467, -0.9358401, 2.716754, 1, 0, 0.6196079, 1,
1.202469, 0.05408534, 1.700979, 1, 0, 0.6117647, 1,
1.210332, -0.07906474, 1.007045, 1, 0, 0.6078432, 1,
1.211869, -2.660551, 2.35688, 1, 0, 0.6, 1,
1.215332, 0.1716096, 1.997059, 1, 0, 0.5921569, 1,
1.217165, 0.3601105, 1.038544, 1, 0, 0.5882353, 1,
1.223104, 0.1837892, -1.171235, 1, 0, 0.5803922, 1,
1.225841, -0.8465926, 1.104554, 1, 0, 0.5764706, 1,
1.23101, 0.4253354, 1.630848, 1, 0, 0.5686275, 1,
1.236824, 0.3010588, 0.6680052, 1, 0, 0.5647059, 1,
1.248191, 0.3064353, 2.664664, 1, 0, 0.5568628, 1,
1.248308, 0.9489855, 1.759969, 1, 0, 0.5529412, 1,
1.248618, 0.3338982, 0.3494069, 1, 0, 0.5450981, 1,
1.251388, 1.639258, 2.004291, 1, 0, 0.5411765, 1,
1.256577, 0.02961259, 1.252542, 1, 0, 0.5333334, 1,
1.259907, 0.9976532, 1.045644, 1, 0, 0.5294118, 1,
1.265914, -0.6155105, 3.733574, 1, 0, 0.5215687, 1,
1.268912, 0.340372, 1.639405, 1, 0, 0.5176471, 1,
1.269821, -1.249276, 1.055856, 1, 0, 0.509804, 1,
1.277988, 1.729417, 0.5866534, 1, 0, 0.5058824, 1,
1.28103, -0.06744555, 2.279917, 1, 0, 0.4980392, 1,
1.282959, -0.3209006, 1.997399, 1, 0, 0.4901961, 1,
1.284761, 1.522384, 4.139139, 1, 0, 0.4862745, 1,
1.298588, 0.1672334, 2.824311, 1, 0, 0.4784314, 1,
1.301863, 0.9025653, -0.642262, 1, 0, 0.4745098, 1,
1.312903, -0.2157244, 2.473627, 1, 0, 0.4666667, 1,
1.329794, 0.7894666, 1.790168, 1, 0, 0.4627451, 1,
1.337151, -1.637664, 1.186497, 1, 0, 0.454902, 1,
1.34178, 2.27021, 0.4914498, 1, 0, 0.4509804, 1,
1.345568, -0.9884781, 1.712621, 1, 0, 0.4431373, 1,
1.352278, -0.4920518, 2.549462, 1, 0, 0.4392157, 1,
1.365111, -1.005269, 1.143669, 1, 0, 0.4313726, 1,
1.36865, 0.3938443, 0.8737686, 1, 0, 0.427451, 1,
1.376826, 0.04902113, 4.463668, 1, 0, 0.4196078, 1,
1.378796, 0.9244599, 0.7864447, 1, 0, 0.4156863, 1,
1.380138, -0.314789, 0.8191848, 1, 0, 0.4078431, 1,
1.39251, -1.05906, 1.654467, 1, 0, 0.4039216, 1,
1.393995, 2.35666, 0.04960441, 1, 0, 0.3960784, 1,
1.399534, -1.659878, 1.52364, 1, 0, 0.3882353, 1,
1.406227, 1.118168, 1.187442, 1, 0, 0.3843137, 1,
1.407837, 1.274298, 1.304623, 1, 0, 0.3764706, 1,
1.415334, -1.282874, 0.1523815, 1, 0, 0.372549, 1,
1.434189, -0.2231765, 0.5776269, 1, 0, 0.3647059, 1,
1.452974, -0.4899879, 0.7454478, 1, 0, 0.3607843, 1,
1.468566, 0.001245415, 2.4355, 1, 0, 0.3529412, 1,
1.471808, 0.6137532, 2.098937, 1, 0, 0.3490196, 1,
1.486673, 0.8744858, -1.061331, 1, 0, 0.3411765, 1,
1.496266, -1.917341, 2.307821, 1, 0, 0.3372549, 1,
1.498194, -0.5951803, 1.297721, 1, 0, 0.3294118, 1,
1.503062, -1.541766, 1.953909, 1, 0, 0.3254902, 1,
1.503711, -1.556976, 1.845119, 1, 0, 0.3176471, 1,
1.50651, 0.5157574, 2.2131, 1, 0, 0.3137255, 1,
1.509106, -0.3069665, 1.538391, 1, 0, 0.3058824, 1,
1.51498, 0.1153343, 1.699244, 1, 0, 0.2980392, 1,
1.545054, 0.1197056, 2.694761, 1, 0, 0.2941177, 1,
1.549767, -0.4070539, 2.060366, 1, 0, 0.2862745, 1,
1.551771, -1.312575, 2.288947, 1, 0, 0.282353, 1,
1.554751, -0.02059227, 0.02395305, 1, 0, 0.2745098, 1,
1.555405, -0.8399346, 1.145117, 1, 0, 0.2705882, 1,
1.561636, 0.06524333, 2.414205, 1, 0, 0.2627451, 1,
1.56643, -0.6404117, 1.604634, 1, 0, 0.2588235, 1,
1.569747, -0.375995, 1.070254, 1, 0, 0.2509804, 1,
1.57643, 0.3057867, 0.9804203, 1, 0, 0.2470588, 1,
1.579473, 0.4699533, 0.8964866, 1, 0, 0.2392157, 1,
1.597227, -1.429726, 3.250896, 1, 0, 0.2352941, 1,
1.642085, 0.5284276, 1.11148, 1, 0, 0.227451, 1,
1.674425, 1.723167, 1.883116, 1, 0, 0.2235294, 1,
1.677386, -1.150143, 0.5817133, 1, 0, 0.2156863, 1,
1.696242, -1.740467, 2.790755, 1, 0, 0.2117647, 1,
1.697907, 0.1448655, 2.64761, 1, 0, 0.2039216, 1,
1.712358, 0.6113118, 1.20877, 1, 0, 0.1960784, 1,
1.720031, -1.61585, 2.471154, 1, 0, 0.1921569, 1,
1.7288, 0.7381417, 0.4248338, 1, 0, 0.1843137, 1,
1.749903, 0.2054384, 1.955489, 1, 0, 0.1803922, 1,
1.764467, -0.8079775, 1.514756, 1, 0, 0.172549, 1,
1.780531, 0.5697088, 2.092593, 1, 0, 0.1686275, 1,
1.780863, -0.241542, -0.0545655, 1, 0, 0.1607843, 1,
1.834652, -0.7178272, 3.715394, 1, 0, 0.1568628, 1,
1.846575, -0.8537304, 1.481183, 1, 0, 0.1490196, 1,
1.855399, -0.6670434, 2.330414, 1, 0, 0.145098, 1,
1.878922, 0.4403012, 1.571437, 1, 0, 0.1372549, 1,
1.896409, -0.9944659, 0.8477476, 1, 0, 0.1333333, 1,
1.924458, -1.135104, 1.783473, 1, 0, 0.1254902, 1,
1.94732, -1.573484, 0.8977558, 1, 0, 0.1215686, 1,
1.950478, 0.2550716, 2.076303, 1, 0, 0.1137255, 1,
1.958181, 0.7764786, 2.344169, 1, 0, 0.1098039, 1,
1.966241, -0.2079038, 2.847163, 1, 0, 0.1019608, 1,
1.970248, -0.01877652, 0.8234354, 1, 0, 0.09411765, 1,
2.016049, -0.2843663, 0.3564487, 1, 0, 0.09019608, 1,
2.065734, 0.2618824, 1.304204, 1, 0, 0.08235294, 1,
2.077825, 0.03967068, 0.2850574, 1, 0, 0.07843138, 1,
2.123088, 0.5535526, 1.987181, 1, 0, 0.07058824, 1,
2.127375, -0.5254373, 1.642264, 1, 0, 0.06666667, 1,
2.169562, -0.5838745, 2.935884, 1, 0, 0.05882353, 1,
2.290821, 0.4338081, 0.6076002, 1, 0, 0.05490196, 1,
2.402456, 1.480286, 0.09821934, 1, 0, 0.04705882, 1,
2.440062, -0.6243564, 3.325597, 1, 0, 0.04313726, 1,
2.461071, -0.9106176, -0.2726562, 1, 0, 0.03529412, 1,
2.515512, -0.2695256, 2.409, 1, 0, 0.03137255, 1,
2.600703, 1.27573, 0.8279142, 1, 0, 0.02352941, 1,
2.771505, 1.099414, 1.015833, 1, 0, 0.01960784, 1,
2.816019, 1.997429, 0.6601049, 1, 0, 0.01176471, 1,
3.258443, -0.2586721, 2.358366, 1, 0, 0.007843138, 1
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
-0.1011157, -5.122796, -7.968297, 0, -0.5, 0.5, 0.5,
-0.1011157, -5.122796, -7.968297, 1, -0.5, 0.5, 0.5,
-0.1011157, -5.122796, -7.968297, 1, 1.5, 0.5, 0.5,
-0.1011157, -5.122796, -7.968297, 0, 1.5, 0.5, 0.5
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
-4.599565, -0.2187264, -7.968297, 0, -0.5, 0.5, 0.5,
-4.599565, -0.2187264, -7.968297, 1, -0.5, 0.5, 0.5,
-4.599565, -0.2187264, -7.968297, 1, 1.5, 0.5, 0.5,
-4.599565, -0.2187264, -7.968297, 0, 1.5, 0.5, 0.5
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
-4.599565, -5.122796, -0.7244816, 0, -0.5, 0.5, 0.5,
-4.599565, -5.122796, -0.7244816, 1, -0.5, 0.5, 0.5,
-4.599565, -5.122796, -0.7244816, 1, 1.5, 0.5, 0.5,
-4.599565, -5.122796, -0.7244816, 0, 1.5, 0.5, 0.5
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
-3, -3.991087, -6.296648,
3, -3.991087, -6.296648,
-3, -3.991087, -6.296648,
-3, -4.179706, -6.575255,
-2, -3.991087, -6.296648,
-2, -4.179706, -6.575255,
-1, -3.991087, -6.296648,
-1, -4.179706, -6.575255,
0, -3.991087, -6.296648,
0, -4.179706, -6.575255,
1, -3.991087, -6.296648,
1, -4.179706, -6.575255,
2, -3.991087, -6.296648,
2, -4.179706, -6.575255,
3, -3.991087, -6.296648,
3, -4.179706, -6.575255
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
-3, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
-3, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
-3, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
-3, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
-2, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
-2, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
-2, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
-2, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
-1, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
-1, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
-1, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
-1, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
0, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
0, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
0, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
0, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
1, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
1, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
1, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
1, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
2, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
2, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
2, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
2, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5,
3, -4.556942, -7.132472, 0, -0.5, 0.5, 0.5,
3, -4.556942, -7.132472, 1, -0.5, 0.5, 0.5,
3, -4.556942, -7.132472, 1, 1.5, 0.5, 0.5,
3, -4.556942, -7.132472, 0, 1.5, 0.5, 0.5
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
-3.561461, -2, -6.296648,
-3.561461, 2, -6.296648,
-3.561461, -2, -6.296648,
-3.734478, -2, -6.575255,
-3.561461, 0, -6.296648,
-3.734478, 0, -6.575255,
-3.561461, 2, -6.296648,
-3.734478, 2, -6.575255
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
-4.080513, -2, -7.132472, 0, -0.5, 0.5, 0.5,
-4.080513, -2, -7.132472, 1, -0.5, 0.5, 0.5,
-4.080513, -2, -7.132472, 1, 1.5, 0.5, 0.5,
-4.080513, -2, -7.132472, 0, 1.5, 0.5, 0.5,
-4.080513, 0, -7.132472, 0, -0.5, 0.5, 0.5,
-4.080513, 0, -7.132472, 1, -0.5, 0.5, 0.5,
-4.080513, 0, -7.132472, 1, 1.5, 0.5, 0.5,
-4.080513, 0, -7.132472, 0, 1.5, 0.5, 0.5,
-4.080513, 2, -7.132472, 0, -0.5, 0.5, 0.5,
-4.080513, 2, -7.132472, 1, -0.5, 0.5, 0.5,
-4.080513, 2, -7.132472, 1, 1.5, 0.5, 0.5,
-4.080513, 2, -7.132472, 0, 1.5, 0.5, 0.5
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
-3.561461, -3.991087, -6,
-3.561461, -3.991087, 4,
-3.561461, -3.991087, -6,
-3.734478, -4.179706, -6,
-3.561461, -3.991087, -4,
-3.734478, -4.179706, -4,
-3.561461, -3.991087, -2,
-3.734478, -4.179706, -2,
-3.561461, -3.991087, 0,
-3.734478, -4.179706, 0,
-3.561461, -3.991087, 2,
-3.734478, -4.179706, 2,
-3.561461, -3.991087, 4,
-3.734478, -4.179706, 4
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
-4.080513, -4.556942, -6, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -6, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -6, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, -6, 0, 1.5, 0.5, 0.5,
-4.080513, -4.556942, -4, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -4, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -4, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, -4, 0, 1.5, 0.5, 0.5,
-4.080513, -4.556942, -2, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -2, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, -2, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, -2, 0, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 0, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 0, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 0, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 0, 0, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 2, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 2, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 2, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 2, 0, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 4, 0, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 4, 1, -0.5, 0.5, 0.5,
-4.080513, -4.556942, 4, 1, 1.5, 0.5, 0.5,
-4.080513, -4.556942, 4, 0, 1.5, 0.5, 0.5
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
-3.561461, -3.991087, -6.296648,
-3.561461, 3.553635, -6.296648,
-3.561461, -3.991087, 4.847684,
-3.561461, 3.553635, 4.847684,
-3.561461, -3.991087, -6.296648,
-3.561461, -3.991087, 4.847684,
-3.561461, 3.553635, -6.296648,
-3.561461, 3.553635, 4.847684,
-3.561461, -3.991087, -6.296648,
3.359229, -3.991087, -6.296648,
-3.561461, -3.991087, 4.847684,
3.359229, -3.991087, 4.847684,
-3.561461, 3.553635, -6.296648,
3.359229, 3.553635, -6.296648,
-3.561461, 3.553635, 4.847684,
3.359229, 3.553635, 4.847684,
3.359229, -3.991087, -6.296648,
3.359229, 3.553635, -6.296648,
3.359229, -3.991087, 4.847684,
3.359229, 3.553635, 4.847684,
3.359229, -3.991087, -6.296648,
3.359229, -3.991087, 4.847684,
3.359229, 3.553635, -6.296648,
3.359229, 3.553635, 4.847684
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
var radius = 8.080856;
var distance = 35.95264;
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
mvMatrix.translate( 0.1011157, 0.2187264, 0.7244816 );
mvMatrix.scale( 1.262472, 1.158052, 0.7840021 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.95264);
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
Ametrine<-read.table("Ametrine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Ametrine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ametrine' not found
```

```r
y<-Ametrine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ametrine' not found
```

```r
z<-Ametrine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ametrine' not found
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
-3.460674, -0.7068863, -0.6566416, 0, 0, 1, 1, 1,
-2.996222, -0.09505942, -1.578386, 1, 0, 0, 1, 1,
-2.934052, 0.3427557, -1.870444, 1, 0, 0, 1, 1,
-2.7684, -0.2125881, -1.524094, 1, 0, 0, 1, 1,
-2.724075, -0.09157899, -2.107419, 1, 0, 0, 1, 1,
-2.723622, -1.215782, -1.741756, 1, 0, 0, 1, 1,
-2.675054, 0.5830838, -3.731146, 0, 0, 0, 1, 1,
-2.622499, 1.197783, -2.523723, 0, 0, 0, 1, 1,
-2.436825, -0.3847744, -2.992803, 0, 0, 0, 1, 1,
-2.408008, -0.6197084, -1.396138, 0, 0, 0, 1, 1,
-2.352965, -0.9571369, -3.635204, 0, 0, 0, 1, 1,
-2.352024, -0.1647343, -1.500926, 0, 0, 0, 1, 1,
-2.337827, 0.3425815, 0.1040156, 0, 0, 0, 1, 1,
-2.319098, 1.633457, -1.429119, 1, 1, 1, 1, 1,
-2.306603, 0.9660417, -1.993947, 1, 1, 1, 1, 1,
-2.266836, 1.58326, -1.197053, 1, 1, 1, 1, 1,
-2.26125, 1.151526, -0.4358776, 1, 1, 1, 1, 1,
-2.205016, 1.657352, -3.471053, 1, 1, 1, 1, 1,
-2.162402, 0.2704832, -2.844874, 1, 1, 1, 1, 1,
-2.138668, 0.6946018, -0.5880827, 1, 1, 1, 1, 1,
-2.098837, -0.4705926, -1.482573, 1, 1, 1, 1, 1,
-2.096241, 0.666272, 0.3779601, 1, 1, 1, 1, 1,
-2.003402, 1.109397, -1.434108, 1, 1, 1, 1, 1,
-1.993683, 0.9443053, -1.015616, 1, 1, 1, 1, 1,
-1.97221, 0.9859301, -1.046153, 1, 1, 1, 1, 1,
-1.95495, -0.5412785, -2.181867, 1, 1, 1, 1, 1,
-1.953737, 0.528237, -1.969875, 1, 1, 1, 1, 1,
-1.944017, 1.198734, -1.673675, 1, 1, 1, 1, 1,
-1.936009, -2.953514, -5.424685, 0, 0, 1, 1, 1,
-1.935326, 0.3512515, -0.8251927, 1, 0, 0, 1, 1,
-1.9154, -0.2797507, -2.783343, 1, 0, 0, 1, 1,
-1.888985, 0.4653443, -0.9131073, 1, 0, 0, 1, 1,
-1.800735, -0.04211602, -2.66649, 1, 0, 0, 1, 1,
-1.744764, 0.4306236, 1.083626, 1, 0, 0, 1, 1,
-1.727873, 1.574384, 0.3640816, 0, 0, 0, 1, 1,
-1.723732, 0.4092952, -0.540187, 0, 0, 0, 1, 1,
-1.7197, 0.8341976, -0.9366242, 0, 0, 0, 1, 1,
-1.705789, 0.4745501, -1.235772, 0, 0, 0, 1, 1,
-1.696123, -0.4624312, -1.864461, 0, 0, 0, 1, 1,
-1.69136, 1.068433, 1.150257, 0, 0, 0, 1, 1,
-1.688962, 1.176344, -1.425715, 0, 0, 0, 1, 1,
-1.681283, 0.491134, -0.6154966, 1, 1, 1, 1, 1,
-1.680295, 0.3784879, -1.786052, 1, 1, 1, 1, 1,
-1.668193, 1.582788, -1.653837, 1, 1, 1, 1, 1,
-1.662008, 0.2728367, -2.724821, 1, 1, 1, 1, 1,
-1.661093, 0.771951, 1.731266, 1, 1, 1, 1, 1,
-1.638625, 0.4841668, -1.778464, 1, 1, 1, 1, 1,
-1.638066, -0.03104834, -0.6933068, 1, 1, 1, 1, 1,
-1.630236, 1.45369, -2.558789, 1, 1, 1, 1, 1,
-1.627054, -1.231695, -0.3793491, 1, 1, 1, 1, 1,
-1.597879, -0.8453494, -1.10112, 1, 1, 1, 1, 1,
-1.59439, -0.3929681, -3.430365, 1, 1, 1, 1, 1,
-1.576478, 0.3151765, -0.9909598, 1, 1, 1, 1, 1,
-1.565374, 1.673552, 0.8932656, 1, 1, 1, 1, 1,
-1.54512, -1.705275, -2.163937, 1, 1, 1, 1, 1,
-1.541792, 0.5400401, -1.135272, 1, 1, 1, 1, 1,
-1.535393, 1.251179, -0.4446772, 0, 0, 1, 1, 1,
-1.533375, 0.5761318, 0.7203977, 1, 0, 0, 1, 1,
-1.532724, -0.2076851, -1.947196, 1, 0, 0, 1, 1,
-1.52536, 0.5338144, -1.167882, 1, 0, 0, 1, 1,
-1.522367, 1.083735, -1.313597, 1, 0, 0, 1, 1,
-1.51809, 1.513843, -0.03141597, 1, 0, 0, 1, 1,
-1.512059, -0.05160607, -3.454589, 0, 0, 0, 1, 1,
-1.511361, 1.394631, -1.520817, 0, 0, 0, 1, 1,
-1.507082, 0.9937273, -1.648393, 0, 0, 0, 1, 1,
-1.466958, -0.4979014, -1.29126, 0, 0, 0, 1, 1,
-1.46461, -0.2632414, -0.02967167, 0, 0, 0, 1, 1,
-1.462315, -1.112313, -1.891973, 0, 0, 0, 1, 1,
-1.461005, 1.76436, -0.7928291, 0, 0, 0, 1, 1,
-1.454936, -0.6138247, -0.9736932, 1, 1, 1, 1, 1,
-1.443729, 0.3348336, -1.554116, 1, 1, 1, 1, 1,
-1.442118, -0.02598749, -0.408897, 1, 1, 1, 1, 1,
-1.429259, -1.782542, -3.131362, 1, 1, 1, 1, 1,
-1.420086, -0.3590166, -3.199336, 1, 1, 1, 1, 1,
-1.395559, -0.8740404, -2.045812, 1, 1, 1, 1, 1,
-1.376492, 0.4911253, -1.915906, 1, 1, 1, 1, 1,
-1.373644, -0.403306, -2.444153, 1, 1, 1, 1, 1,
-1.368875, -0.4185069, -3.822695, 1, 1, 1, 1, 1,
-1.362415, 1.838257, 0.557666, 1, 1, 1, 1, 1,
-1.359565, -0.1516609, -2.322799, 1, 1, 1, 1, 1,
-1.349357, -1.035558, -4.246852, 1, 1, 1, 1, 1,
-1.3442, 0.2664699, 0.9633443, 1, 1, 1, 1, 1,
-1.343325, 1.601199, -0.04290748, 1, 1, 1, 1, 1,
-1.343086, -1.972453, -1.438225, 1, 1, 1, 1, 1,
-1.333066, 0.6636827, -0.6639647, 0, 0, 1, 1, 1,
-1.32796, -0.6794416, -1.063332, 1, 0, 0, 1, 1,
-1.323984, -0.2821944, -0.8049536, 1, 0, 0, 1, 1,
-1.312123, 1.278221, -2.426711, 1, 0, 0, 1, 1,
-1.301058, -0.1422522, -0.5688426, 1, 0, 0, 1, 1,
-1.297127, 0.9512349, 0.9097309, 1, 0, 0, 1, 1,
-1.296925, 0.1329435, -0.1151173, 0, 0, 0, 1, 1,
-1.281362, 0.06638005, -1.978365, 0, 0, 0, 1, 1,
-1.279085, -0.9936762, -3.487043, 0, 0, 0, 1, 1,
-1.264486, -0.3224152, -2.03996, 0, 0, 0, 1, 1,
-1.242628, 0.721877, -0.1209212, 0, 0, 0, 1, 1,
-1.236802, -1.109282, -2.784958, 0, 0, 0, 1, 1,
-1.228795, -0.3434808, -3.60841, 0, 0, 0, 1, 1,
-1.227555, -0.5030425, -1.50702, 1, 1, 1, 1, 1,
-1.219846, -1.29261, -2.623159, 1, 1, 1, 1, 1,
-1.206793, -1.76958, -2.358029, 1, 1, 1, 1, 1,
-1.202939, -0.2096526, -0.4834961, 1, 1, 1, 1, 1,
-1.201311, -0.02415911, -1.94069, 1, 1, 1, 1, 1,
-1.200498, 0.4246364, -0.3596311, 1, 1, 1, 1, 1,
-1.198425, -0.1301539, -1.552454, 1, 1, 1, 1, 1,
-1.19621, -1.16345, -0.4380923, 1, 1, 1, 1, 1,
-1.192269, 1.306475, 0.9993108, 1, 1, 1, 1, 1,
-1.191533, -0.2787128, -1.732235, 1, 1, 1, 1, 1,
-1.190319, 0.6082504, -2.327115, 1, 1, 1, 1, 1,
-1.190313, 1.695409, -0.5762286, 1, 1, 1, 1, 1,
-1.183824, -0.4929187, -1.686547, 1, 1, 1, 1, 1,
-1.180844, -0.1127326, -2.085263, 1, 1, 1, 1, 1,
-1.168386, -1.479336, -0.8676983, 1, 1, 1, 1, 1,
-1.165859, 0.7174074, -1.065442, 0, 0, 1, 1, 1,
-1.162664, -0.6434819, -0.7606191, 1, 0, 0, 1, 1,
-1.160489, 0.7175136, -1.94292, 1, 0, 0, 1, 1,
-1.153306, 0.5775297, -1.642771, 1, 0, 0, 1, 1,
-1.14991, 0.3073964, -3.306576, 1, 0, 0, 1, 1,
-1.145693, -1.445326, -2.748796, 1, 0, 0, 1, 1,
-1.145144, -0.1322312, -0.8751229, 0, 0, 0, 1, 1,
-1.12947, 1.092763, -1.385536, 0, 0, 0, 1, 1,
-1.127989, -0.8179628, -1.762427, 0, 0, 0, 1, 1,
-1.127055, 0.4668999, -1.223946, 0, 0, 0, 1, 1,
-1.118324, 0.8162239, 0.3277941, 0, 0, 0, 1, 1,
-1.11329, 1.077994, -0.017322, 0, 0, 0, 1, 1,
-1.111796, -0.2436577, -2.982333, 0, 0, 0, 1, 1,
-1.104438, -1.308215, -3.21531, 1, 1, 1, 1, 1,
-1.098543, 0.937259, -0.8170598, 1, 1, 1, 1, 1,
-1.092348, -0.2209972, -1.655531, 1, 1, 1, 1, 1,
-1.091417, 0.5150573, -0.7280741, 1, 1, 1, 1, 1,
-1.090431, 0.4573939, -2.318042, 1, 1, 1, 1, 1,
-1.080769, -1.571927, -4.639518, 1, 1, 1, 1, 1,
-1.078023, -0.1370544, -2.135793, 1, 1, 1, 1, 1,
-1.067243, 0.2035903, -2.476272, 1, 1, 1, 1, 1,
-1.065018, -0.3396307, -0.8798497, 1, 1, 1, 1, 1,
-1.061653, 1.01624, -0.08707892, 1, 1, 1, 1, 1,
-1.061423, 1.121006, 0.4524372, 1, 1, 1, 1, 1,
-1.057667, -1.083375, -3.484326, 1, 1, 1, 1, 1,
-1.043748, 1.462107, 0.5253491, 1, 1, 1, 1, 1,
-1.04279, -0.01914, -3.407632, 1, 1, 1, 1, 1,
-1.026284, 0.421538, 0.5158868, 1, 1, 1, 1, 1,
-1.025893, 1.358974, -0.3571174, 0, 0, 1, 1, 1,
-1.017971, 0.9337219, -0.5650968, 1, 0, 0, 1, 1,
-1.01496, -0.7784348, -2.522703, 1, 0, 0, 1, 1,
-1.011771, -0.5518802, -0.5793731, 1, 0, 0, 1, 1,
-1.011624, 1.257437, -3.101879, 1, 0, 0, 1, 1,
-1.008703, 0.8381853, -0.7249019, 1, 0, 0, 1, 1,
-1.007396, -2.180586, -3.21384, 0, 0, 0, 1, 1,
-1.00309, 0.01973721, -3.217017, 0, 0, 0, 1, 1,
-1.000746, -1.229325, -1.294584, 0, 0, 0, 1, 1,
-0.9999237, -1.389586, -3.04425, 0, 0, 0, 1, 1,
-0.9978575, 1.455294, -0.6791806, 0, 0, 0, 1, 1,
-0.9972392, -1.172518, -1.552889, 0, 0, 0, 1, 1,
-0.9947578, 0.04932385, -1.748806, 0, 0, 0, 1, 1,
-0.9899798, 0.6078376, -0.7483546, 1, 1, 1, 1, 1,
-0.9883202, 0.5804691, -0.07535718, 1, 1, 1, 1, 1,
-0.9880967, 0.5761414, -1.394929, 1, 1, 1, 1, 1,
-0.9847277, 0.5765596, -2.413563, 1, 1, 1, 1, 1,
-0.9838989, 0.6393515, -0.6404408, 1, 1, 1, 1, 1,
-0.9804156, 0.613077, -0.5204896, 1, 1, 1, 1, 1,
-0.9753729, -0.9892249, -2.089526, 1, 1, 1, 1, 1,
-0.9748605, -0.1778119, -0.802314, 1, 1, 1, 1, 1,
-0.970286, -1.139547, -0.5931125, 1, 1, 1, 1, 1,
-0.9668432, 0.7023056, 0.1062575, 1, 1, 1, 1, 1,
-0.9668241, 0.5593346, -0.9963802, 1, 1, 1, 1, 1,
-0.9660469, 0.708718, 0.7162476, 1, 1, 1, 1, 1,
-0.965561, -0.06098039, -0.2438466, 1, 1, 1, 1, 1,
-0.963311, 0.8805552, -0.06185584, 1, 1, 1, 1, 1,
-0.9569598, 1.723877, 0.2970769, 1, 1, 1, 1, 1,
-0.9556249, -2.698953, -3.884127, 0, 0, 1, 1, 1,
-0.95074, 1.405518, -1.144797, 1, 0, 0, 1, 1,
-0.9448411, 0.8476225, 0.2888616, 1, 0, 0, 1, 1,
-0.9437228, -0.3800231, -0.865297, 1, 0, 0, 1, 1,
-0.9436945, -0.2354931, -2.871495, 1, 0, 0, 1, 1,
-0.9418615, -0.3666384, -2.846338, 1, 0, 0, 1, 1,
-0.9357584, 0.4027335, 0.07168584, 0, 0, 0, 1, 1,
-0.9221866, -1.166835, -2.463106, 0, 0, 0, 1, 1,
-0.9212323, 1.021749, -0.4082666, 0, 0, 0, 1, 1,
-0.9178883, -0.6342726, -2.532702, 0, 0, 0, 1, 1,
-0.9111301, -0.1208825, -2.146039, 0, 0, 0, 1, 1,
-0.9086806, -1.216754, -1.737107, 0, 0, 0, 1, 1,
-0.8984077, -0.5153359, -0.8953878, 0, 0, 0, 1, 1,
-0.8962665, 1.111073, 0.7739405, 1, 1, 1, 1, 1,
-0.8932384, 0.4233981, -0.6547354, 1, 1, 1, 1, 1,
-0.8862658, 0.4502027, -1.058965, 1, 1, 1, 1, 1,
-0.8862076, -1.918317, -3.801047, 1, 1, 1, 1, 1,
-0.8846489, -1.249213, -2.690956, 1, 1, 1, 1, 1,
-0.8833717, 1.245596, -1.434073, 1, 1, 1, 1, 1,
-0.8759884, 1.766465, -1.073228, 1, 1, 1, 1, 1,
-0.8756971, -0.2496422, -0.7753231, 1, 1, 1, 1, 1,
-0.868589, 1.283141, -0.548192, 1, 1, 1, 1, 1,
-0.8672125, 0.4750074, -1.243595, 1, 1, 1, 1, 1,
-0.8645626, 0.573636, -2.61059, 1, 1, 1, 1, 1,
-0.8579714, 1.131729, -1.093319, 1, 1, 1, 1, 1,
-0.8568078, -0.757375, -0.3827855, 1, 1, 1, 1, 1,
-0.8545325, 1.007269, -2.013932, 1, 1, 1, 1, 1,
-0.8539889, 1.103662, -0.4839368, 1, 1, 1, 1, 1,
-0.8532203, 0.9213586, -0.06043183, 0, 0, 1, 1, 1,
-0.8505351, 0.06276043, -2.078218, 1, 0, 0, 1, 1,
-0.8467147, -1.768731, -2.312961, 1, 0, 0, 1, 1,
-0.8460355, -0.08560021, -0.9248448, 1, 0, 0, 1, 1,
-0.8369238, 0.9866505, -1.233339, 1, 0, 0, 1, 1,
-0.8350435, 0.8389879, -0.6874362, 1, 0, 0, 1, 1,
-0.8331981, 0.8726847, -1.581815, 0, 0, 0, 1, 1,
-0.8276753, 1.236255, -0.5962744, 0, 0, 0, 1, 1,
-0.8276144, -0.721257, -2.646946, 0, 0, 0, 1, 1,
-0.8273039, -0.2007231, -1.97071, 0, 0, 0, 1, 1,
-0.8255231, 0.1444063, -0.3779048, 0, 0, 0, 1, 1,
-0.8216127, 1.315009, -1.441497, 0, 0, 0, 1, 1,
-0.8207557, -1.075892, -1.138704, 0, 0, 0, 1, 1,
-0.8185487, -0.2727357, -1.541567, 1, 1, 1, 1, 1,
-0.8124577, -1.022668, -4.034488, 1, 1, 1, 1, 1,
-0.8079864, 1.578701, -2.422593, 1, 1, 1, 1, 1,
-0.7979768, 0.03441486, -0.3843691, 1, 1, 1, 1, 1,
-0.7978154, 0.8036311, 0.2789545, 1, 1, 1, 1, 1,
-0.7926447, 0.8531296, -0.02958874, 1, 1, 1, 1, 1,
-0.7908931, 0.1383192, -0.8211789, 1, 1, 1, 1, 1,
-0.7900475, 1.411709, -1.366291, 1, 1, 1, 1, 1,
-0.7893716, 2.204311, 0.8722031, 1, 1, 1, 1, 1,
-0.7870013, -1.139973, -2.668966, 1, 1, 1, 1, 1,
-0.78579, -0.5198289, -1.703857, 1, 1, 1, 1, 1,
-0.7857282, -0.06629901, -2.782359, 1, 1, 1, 1, 1,
-0.7825124, 0.08405142, -1.807053, 1, 1, 1, 1, 1,
-0.7820539, -0.2868151, -1.403807, 1, 1, 1, 1, 1,
-0.7809006, -0.995366, -2.218396, 1, 1, 1, 1, 1,
-0.7772086, 0.09685211, -3.040541, 0, 0, 1, 1, 1,
-0.7748752, -1.413476, -1.886557, 1, 0, 0, 1, 1,
-0.7736902, 1.083822, 0.06852569, 1, 0, 0, 1, 1,
-0.7661454, 0.2351217, -3.952499, 1, 0, 0, 1, 1,
-0.7593897, 1.602361, 0.3120585, 1, 0, 0, 1, 1,
-0.7492643, -0.1856594, -2.193306, 1, 0, 0, 1, 1,
-0.7454371, -0.2525712, -0.599118, 0, 0, 0, 1, 1,
-0.7376083, 1.171016, -0.821627, 0, 0, 0, 1, 1,
-0.7362812, 0.5053005, -1.469232, 0, 0, 0, 1, 1,
-0.7331793, -1.319626, -3.075013, 0, 0, 0, 1, 1,
-0.7302945, -0.4856953, -0.9801332, 0, 0, 0, 1, 1,
-0.7264695, -1.222491, -2.833155, 0, 0, 0, 1, 1,
-0.7260393, 1.004802, -1.159665, 0, 0, 0, 1, 1,
-0.7214214, -1.056896, -3.491372, 1, 1, 1, 1, 1,
-0.7208337, 1.461689, -0.7080478, 1, 1, 1, 1, 1,
-0.7129222, -0.3682372, -3.806415, 1, 1, 1, 1, 1,
-0.7093449, -2.396866, -5.055588, 1, 1, 1, 1, 1,
-0.706553, -0.5766881, -2.499476, 1, 1, 1, 1, 1,
-0.7058752, 0.3882943, 0.08640296, 1, 1, 1, 1, 1,
-0.7055226, -2.752824, -2.852697, 1, 1, 1, 1, 1,
-0.7040993, 0.3713104, -1.933883, 1, 1, 1, 1, 1,
-0.6941221, -0.08942534, -3.108926, 1, 1, 1, 1, 1,
-0.6817656, -0.1126581, -0.8541355, 1, 1, 1, 1, 1,
-0.6816296, 0.9126536, -0.6945273, 1, 1, 1, 1, 1,
-0.6771867, -2.124751, -3.606467, 1, 1, 1, 1, 1,
-0.676912, 0.3342542, -2.030152, 1, 1, 1, 1, 1,
-0.6760409, -0.550604, -0.7983692, 1, 1, 1, 1, 1,
-0.6756375, 1.048152, 1.64162, 1, 1, 1, 1, 1,
-0.6753043, 1.264894, 2.551724, 0, 0, 1, 1, 1,
-0.6745588, 0.6160066, 0.2086575, 1, 0, 0, 1, 1,
-0.6699017, 1.160144, -1.194403, 1, 0, 0, 1, 1,
-0.6696706, -0.02075721, -1.09207, 1, 0, 0, 1, 1,
-0.6654273, 0.2016446, -1.194746, 1, 0, 0, 1, 1,
-0.662679, -1.448242, -0.3224141, 1, 0, 0, 1, 1,
-0.6593776, 0.3283859, -0.4816964, 0, 0, 0, 1, 1,
-0.6541232, -1.24149, -2.736748, 0, 0, 0, 1, 1,
-0.6518033, 0.1059076, -0.4302567, 0, 0, 0, 1, 1,
-0.6503749, -1.816849, -1.371274, 0, 0, 0, 1, 1,
-0.6495247, -0.4264224, -2.405359, 0, 0, 0, 1, 1,
-0.6476467, -0.1288465, -3.727584, 0, 0, 0, 1, 1,
-0.644494, -0.577989, -2.846352, 0, 0, 0, 1, 1,
-0.6417482, 0.5230892, -0.9829847, 1, 1, 1, 1, 1,
-0.6368527, -0.5326601, -2.697669, 1, 1, 1, 1, 1,
-0.6360391, 0.952435, -0.6572446, 1, 1, 1, 1, 1,
-0.6351517, 0.47935, -0.284871, 1, 1, 1, 1, 1,
-0.6326209, 0.2335268, -1.733895, 1, 1, 1, 1, 1,
-0.6320812, 0.279951, -1.184325, 1, 1, 1, 1, 1,
-0.6317984, 0.005886315, -2.470198, 1, 1, 1, 1, 1,
-0.6290484, 0.8821012, 0.5598894, 1, 1, 1, 1, 1,
-0.6260704, -0.4381293, -0.7952748, 1, 1, 1, 1, 1,
-0.6245645, 1.426437, -1.508042, 1, 1, 1, 1, 1,
-0.6244558, 1.466301, -1.666469, 1, 1, 1, 1, 1,
-0.6238776, -0.7295858, -3.097551, 1, 1, 1, 1, 1,
-0.6188277, -0.243632, -2.433792, 1, 1, 1, 1, 1,
-0.6162413, 0.7983235, -0.387913, 1, 1, 1, 1, 1,
-0.6156428, -1.186303, -2.986113, 1, 1, 1, 1, 1,
-0.612852, 0.4527732, 0.1346857, 0, 0, 1, 1, 1,
-0.6119874, -1.391503, -2.37476, 1, 0, 0, 1, 1,
-0.6062409, 0.5121395, -0.3543483, 1, 0, 0, 1, 1,
-0.6022679, 2.868495, 0.2742965, 1, 0, 0, 1, 1,
-0.5997988, 1.388626, -1.532805, 1, 0, 0, 1, 1,
-0.5991377, 1.488741, -0.06818178, 1, 0, 0, 1, 1,
-0.5977, 0.151916, -0.8756719, 0, 0, 0, 1, 1,
-0.5950081, 0.6474364, -0.5840566, 0, 0, 0, 1, 1,
-0.5939432, -0.4335756, -4.050786, 0, 0, 0, 1, 1,
-0.593923, 1.712987, 1.506038, 0, 0, 0, 1, 1,
-0.5920895, 0.6102647, -1.444287, 0, 0, 0, 1, 1,
-0.591779, -0.4928811, -2.260889, 0, 0, 0, 1, 1,
-0.5912132, 0.01258731, -0.8807227, 0, 0, 0, 1, 1,
-0.5896317, 3.190695, 0.1478075, 1, 1, 1, 1, 1,
-0.5862548, -0.9254904, -3.340857, 1, 1, 1, 1, 1,
-0.5841993, 1.41578, -1.14889, 1, 1, 1, 1, 1,
-0.5823997, 3.44376, -0.8571137, 1, 1, 1, 1, 1,
-0.5779002, -0.8608872, -2.213317, 1, 1, 1, 1, 1,
-0.5763339, 0.7652311, -0.4364621, 1, 1, 1, 1, 1,
-0.5741807, 1.602551, 1.030294, 1, 1, 1, 1, 1,
-0.572437, 1.187943, -0.6582062, 1, 1, 1, 1, 1,
-0.5723284, -0.1076962, -1.524969, 1, 1, 1, 1, 1,
-0.5628794, 0.6951745, 0.06278104, 1, 1, 1, 1, 1,
-0.5582733, 0.6365701, 1.143728, 1, 1, 1, 1, 1,
-0.5573656, 1.536761, -0.2250645, 1, 1, 1, 1, 1,
-0.543556, -0.9468657, -1.837656, 1, 1, 1, 1, 1,
-0.5431244, -0.2519148, -2.07632, 1, 1, 1, 1, 1,
-0.5428002, -0.04533675, -1.03583, 1, 1, 1, 1, 1,
-0.5399826, -0.06979922, -1.857619, 0, 0, 1, 1, 1,
-0.534959, -0.02804826, -2.2765, 1, 0, 0, 1, 1,
-0.5343187, 2.383501, 1.187614, 1, 0, 0, 1, 1,
-0.531219, 0.5249333, -1.512878, 1, 0, 0, 1, 1,
-0.5305892, -0.8188544, -2.867897, 1, 0, 0, 1, 1,
-0.5299245, 0.3500879, -1.28739, 1, 0, 0, 1, 1,
-0.5299038, -1.432926, -3.254847, 0, 0, 0, 1, 1,
-0.5295105, 1.126307, -2.319649, 0, 0, 0, 1, 1,
-0.5270894, 0.01703744, -3.115694, 0, 0, 0, 1, 1,
-0.5269535, -0.4837915, -3.445399, 0, 0, 0, 1, 1,
-0.5264586, -0.411236, -0.2668187, 0, 0, 0, 1, 1,
-0.5237952, -0.3183922, -2.854118, 0, 0, 0, 1, 1,
-0.5211846, 0.2354958, -1.118061, 0, 0, 0, 1, 1,
-0.5211502, 0.3419304, 0.07136536, 1, 1, 1, 1, 1,
-0.5207641, 1.065858, 0.9602135, 1, 1, 1, 1, 1,
-0.5168957, 0.9957736, -1.06593, 1, 1, 1, 1, 1,
-0.5153453, 1.011035, 2.581007, 1, 1, 1, 1, 1,
-0.5150639, -0.8511772, -2.701693, 1, 1, 1, 1, 1,
-0.5119761, -0.259185, -0.8611206, 1, 1, 1, 1, 1,
-0.5109693, -0.5992974, -2.395885, 1, 1, 1, 1, 1,
-0.4993579, -0.3171583, -0.1538768, 1, 1, 1, 1, 1,
-0.4948338, 0.7703745, -1.230564, 1, 1, 1, 1, 1,
-0.4891692, 0.06860178, -3.663193, 1, 1, 1, 1, 1,
-0.4841468, 0.9864336, -0.02810722, 1, 1, 1, 1, 1,
-0.4838809, -0.1781955, -3.533264, 1, 1, 1, 1, 1,
-0.4815114, -0.4821187, -1.851401, 1, 1, 1, 1, 1,
-0.4790614, 0.5691164, 0.5242435, 1, 1, 1, 1, 1,
-0.4702054, -0.5735399, -3.350179, 1, 1, 1, 1, 1,
-0.4621907, 1.060393, 0.6469076, 0, 0, 1, 1, 1,
-0.460155, -0.03864878, -0.8758168, 1, 0, 0, 1, 1,
-0.4544695, 0.1543194, 1.259725, 1, 0, 0, 1, 1,
-0.4461284, 1.305158, -1.572633, 1, 0, 0, 1, 1,
-0.4397922, -2.94751, -1.848383, 1, 0, 0, 1, 1,
-0.4386813, -0.232172, -0.6803303, 1, 0, 0, 1, 1,
-0.4386322, 1.602325, -1.490683, 0, 0, 0, 1, 1,
-0.4370019, -0.1380019, -3.373382, 0, 0, 0, 1, 1,
-0.4302271, 0.006138648, -0.3701643, 0, 0, 0, 1, 1,
-0.424934, -0.4218847, -2.694196, 0, 0, 0, 1, 1,
-0.4217846, -2.836653, -4.288518, 0, 0, 0, 1, 1,
-0.4159792, 1.367622, 1.27219, 0, 0, 0, 1, 1,
-0.4144752, -0.01277081, -4.63971, 0, 0, 0, 1, 1,
-0.4124098, 2.105683, 0.6482674, 1, 1, 1, 1, 1,
-0.4101797, 0.104162, -0.1376546, 1, 1, 1, 1, 1,
-0.4063228, -0.2338865, -3.397352, 1, 1, 1, 1, 1,
-0.4054466, -0.7886777, -0.5041058, 1, 1, 1, 1, 1,
-0.4017822, 0.6147906, 0.0320985, 1, 1, 1, 1, 1,
-0.3980245, -0.3776994, -3.936498, 1, 1, 1, 1, 1,
-0.3920255, 0.06421475, -1.230641, 1, 1, 1, 1, 1,
-0.3884735, 0.4329411, -1.412386, 1, 1, 1, 1, 1,
-0.3881677, -0.4548479, -2.2946, 1, 1, 1, 1, 1,
-0.3878085, 0.8609045, 1.768464, 1, 1, 1, 1, 1,
-0.3848276, -1.898126, -3.816622, 1, 1, 1, 1, 1,
-0.3811432, 1.349238, -1.732424, 1, 1, 1, 1, 1,
-0.3770302, 1.906435, 0.9573863, 1, 1, 1, 1, 1,
-0.3764062, 0.7581775, -1.189043, 1, 1, 1, 1, 1,
-0.3725682, -0.01164466, -1.141822, 1, 1, 1, 1, 1,
-0.371795, -0.09035421, -3.788264, 0, 0, 1, 1, 1,
-0.3702022, -0.0134458, -1.250019, 1, 0, 0, 1, 1,
-0.3603522, 0.6786286, 0.8107072, 1, 0, 0, 1, 1,
-0.3568795, 0.7741941, -1.764785, 1, 0, 0, 1, 1,
-0.3556044, -1.242996, -2.328706, 1, 0, 0, 1, 1,
-0.3545102, 0.3404316, -1.015267, 1, 0, 0, 1, 1,
-0.3522354, 0.6160508, -2.186213, 0, 0, 0, 1, 1,
-0.3494924, 2.212512, -1.359091, 0, 0, 0, 1, 1,
-0.3493484, 1.28007, -1.172921, 0, 0, 0, 1, 1,
-0.3447339, -0.4750052, -0.6468169, 0, 0, 0, 1, 1,
-0.3412221, -2.321482, -2.092873, 0, 0, 0, 1, 1,
-0.3387599, 0.3916524, 0.001363902, 0, 0, 0, 1, 1,
-0.3375742, 0.4519271, -0.9922186, 0, 0, 0, 1, 1,
-0.3360986, 0.09589835, -1.751021, 1, 1, 1, 1, 1,
-0.3355434, -1.488019, -6.134351, 1, 1, 1, 1, 1,
-0.3348041, 0.6223629, -0.8836288, 1, 1, 1, 1, 1,
-0.3326396, 0.1913933, -1.419813, 1, 1, 1, 1, 1,
-0.327625, 0.7071221, -1.781082, 1, 1, 1, 1, 1,
-0.3261501, 0.7183868, -0.28526, 1, 1, 1, 1, 1,
-0.3256448, 0.07252212, -1.249839, 1, 1, 1, 1, 1,
-0.3248779, 0.7191782, -0.4434474, 1, 1, 1, 1, 1,
-0.3220378, 0.1228214, -0.4788138, 1, 1, 1, 1, 1,
-0.3214145, 1.518569, 0.7091935, 1, 1, 1, 1, 1,
-0.3206151, 1.785375, 0.8788038, 1, 1, 1, 1, 1,
-0.3191441, -0.924695, -4.272073, 1, 1, 1, 1, 1,
-0.3190451, -2.724803, -2.660391, 1, 1, 1, 1, 1,
-0.3169933, 0.3580945, -0.6069661, 1, 1, 1, 1, 1,
-0.3157101, 0.02119955, -2.887176, 1, 1, 1, 1, 1,
-0.3144808, -0.049233, -1.963081, 0, 0, 1, 1, 1,
-0.3133155, -0.4740603, -2.146403, 1, 0, 0, 1, 1,
-0.3114839, 0.5544771, -1.701683, 1, 0, 0, 1, 1,
-0.3105128, -0.1446609, -0.5044426, 1, 0, 0, 1, 1,
-0.3095665, 0.2916083, 0.7014003, 1, 0, 0, 1, 1,
-0.3081244, -0.03614191, -1.319308, 1, 0, 0, 1, 1,
-0.3079822, -0.6985751, -4.163016, 0, 0, 0, 1, 1,
-0.3048063, 0.09321921, -2.50678, 0, 0, 0, 1, 1,
-0.2998291, 0.6443455, -0.4607743, 0, 0, 0, 1, 1,
-0.2954838, -0.9763805, -3.439291, 0, 0, 0, 1, 1,
-0.2949755, 0.6034058, 0.6160616, 0, 0, 0, 1, 1,
-0.2936103, 0.7158586, -2.100692, 0, 0, 0, 1, 1,
-0.2904295, -0.5429409, -1.880735, 0, 0, 0, 1, 1,
-0.2870515, 0.4049825, -2.183587, 1, 1, 1, 1, 1,
-0.284717, 0.307665, -1.167021, 1, 1, 1, 1, 1,
-0.2816099, 0.2173501, -0.03392764, 1, 1, 1, 1, 1,
-0.2776859, 0.2724331, -1.92384, 1, 1, 1, 1, 1,
-0.276513, 0.5916289, -0.3541403, 1, 1, 1, 1, 1,
-0.2763976, -0.5387034, -2.24266, 1, 1, 1, 1, 1,
-0.2726573, -0.245389, -3.029365, 1, 1, 1, 1, 1,
-0.2667159, -0.2890976, -2.292351, 1, 1, 1, 1, 1,
-0.2612942, -0.634824, -0.9577315, 1, 1, 1, 1, 1,
-0.2588274, -0.4096817, -1.931811, 1, 1, 1, 1, 1,
-0.2575851, 0.6143318, 1.183439, 1, 1, 1, 1, 1,
-0.2515224, -0.3761889, -3.347404, 1, 1, 1, 1, 1,
-0.2453841, 1.252564, -2.050391, 1, 1, 1, 1, 1,
-0.2368401, 0.228837, -0.9238445, 1, 1, 1, 1, 1,
-0.2291237, 0.85902, -0.1172817, 1, 1, 1, 1, 1,
-0.2287517, 0.3025031, 0.9572845, 0, 0, 1, 1, 1,
-0.2215172, -0.7608859, -3.535422, 1, 0, 0, 1, 1,
-0.2164796, 0.3892068, -1.070278, 1, 0, 0, 1, 1,
-0.2152654, 1.060999, -1.148731, 1, 0, 0, 1, 1,
-0.2137898, -1.354026, -2.894203, 1, 0, 0, 1, 1,
-0.2124489, -0.5436008, -3.596159, 1, 0, 0, 1, 1,
-0.2120434, -1.341979, -2.392379, 0, 0, 0, 1, 1,
-0.2095693, -0.1654401, -2.855194, 0, 0, 0, 1, 1,
-0.2093296, -0.7534922, 0.217327, 0, 0, 0, 1, 1,
-0.2042231, 0.6487629, 0.7414824, 0, 0, 0, 1, 1,
-0.1932369, 1.383588, -0.04364536, 0, 0, 0, 1, 1,
-0.1867566, 0.4080489, 1.091105, 0, 0, 0, 1, 1,
-0.1808656, -0.3563909, -3.071307, 0, 0, 0, 1, 1,
-0.1789654, -0.2923668, -0.6633287, 1, 1, 1, 1, 1,
-0.1770253, -0.1712679, -3.162866, 1, 1, 1, 1, 1,
-0.173392, 0.4489118, 0.5514244, 1, 1, 1, 1, 1,
-0.1684799, 1.16778, 0.08181141, 1, 1, 1, 1, 1,
-0.165466, 0.292176, 0.5181832, 1, 1, 1, 1, 1,
-0.1626698, -1.520554, -1.430038, 1, 1, 1, 1, 1,
-0.1605434, 0.838973, 1.300774, 1, 1, 1, 1, 1,
-0.160501, 2.283913, -0.9019608, 1, 1, 1, 1, 1,
-0.1495491, 0.9844407, -0.4930104, 1, 1, 1, 1, 1,
-0.1475833, -1.86472, -2.495606, 1, 1, 1, 1, 1,
-0.146561, 1.099361, -1.151249, 1, 1, 1, 1, 1,
-0.1353954, 0.1924514, -2.285817, 1, 1, 1, 1, 1,
-0.1296369, 0.04970637, -1.440191, 1, 1, 1, 1, 1,
-0.1289174, -0.1891151, -2.609249, 1, 1, 1, 1, 1,
-0.1239369, -1.694412, -3.78725, 1, 1, 1, 1, 1,
-0.1237058, 0.6001855, 0.6943634, 0, 0, 1, 1, 1,
-0.1231028, 0.2062499, -0.730319, 1, 0, 0, 1, 1,
-0.122353, -0.558787, -3.685426, 1, 0, 0, 1, 1,
-0.121572, -0.0267738, -0.9554641, 1, 0, 0, 1, 1,
-0.119245, 1.97144, 0.1385782, 1, 0, 0, 1, 1,
-0.1149511, -0.6886913, -5.515752, 1, 0, 0, 1, 1,
-0.1139948, 0.07380848, -2.359968, 0, 0, 0, 1, 1,
-0.1131577, 0.1174287, -2.101699, 0, 0, 0, 1, 1,
-0.1128849, -1.009054, -3.208224, 0, 0, 0, 1, 1,
-0.1128698, -1.136888, -3.347197, 0, 0, 0, 1, 1,
-0.111815, 0.7783333, -3.523537, 0, 0, 0, 1, 1,
-0.1102735, -0.4971342, -3.727596, 0, 0, 0, 1, 1,
-0.1083053, -1.132174, -2.512256, 0, 0, 0, 1, 1,
-0.1052074, 0.7616966, 0.2975942, 1, 1, 1, 1, 1,
-0.1024494, -0.3117741, -1.85454, 1, 1, 1, 1, 1,
-0.09872195, 0.2976753, 0.7193829, 1, 1, 1, 1, 1,
-0.09848456, 1.234814, -1.170039, 1, 1, 1, 1, 1,
-0.09785054, -0.3251007, -2.027768, 1, 1, 1, 1, 1,
-0.09653546, 0.06062083, -0.08885391, 1, 1, 1, 1, 1,
-0.09494884, 1.325046, 0.406473, 1, 1, 1, 1, 1,
-0.09393646, -0.530816, -2.45073, 1, 1, 1, 1, 1,
-0.09328437, 0.1414373, -0.2073665, 1, 1, 1, 1, 1,
-0.09261455, 0.7586603, -0.1091918, 1, 1, 1, 1, 1,
-0.084182, 2.249615, 1.366733, 1, 1, 1, 1, 1,
-0.08196602, 1.429412, -2.021012, 1, 1, 1, 1, 1,
-0.08184934, -0.1654365, -3.911135, 1, 1, 1, 1, 1,
-0.07335792, -1.459831, -2.460706, 1, 1, 1, 1, 1,
-0.07069549, 1.131588, -0.9988366, 1, 1, 1, 1, 1,
-0.07028683, -0.2581557, -2.155172, 0, 0, 1, 1, 1,
-0.06976943, -0.2944829, -2.82116, 1, 0, 0, 1, 1,
-0.06550049, -0.8585107, -1.247902, 1, 0, 0, 1, 1,
-0.0631758, -0.7091618, -3.519802, 1, 0, 0, 1, 1,
-0.06261272, -0.2340704, -1.308936, 1, 0, 0, 1, 1,
-0.06022952, -0.7285947, -3.177415, 1, 0, 0, 1, 1,
-0.05999397, -1.565727, -2.140139, 0, 0, 0, 1, 1,
-0.0596601, 1.084083, -0.8710225, 0, 0, 0, 1, 1,
-0.0589916, -0.9373257, -2.870494, 0, 0, 0, 1, 1,
-0.0575571, 0.3556507, 0.5278703, 0, 0, 0, 1, 1,
-0.05689229, 0.4912801, -0.9717836, 0, 0, 0, 1, 1,
-0.05597362, 1.147861, -0.3611644, 0, 0, 0, 1, 1,
-0.05007089, -0.4579796, -2.269075, 0, 0, 0, 1, 1,
-0.04467403, -0.2035515, -4.724019, 1, 1, 1, 1, 1,
-0.04370351, 1.517914, 0.1219293, 1, 1, 1, 1, 1,
-0.04035084, 0.7587436, 0.641367, 1, 1, 1, 1, 1,
-0.03677035, 0.9677442, 0.008898918, 1, 1, 1, 1, 1,
-0.02975485, 1.253301, 0.04417447, 1, 1, 1, 1, 1,
-0.02380236, 1.979668, 0.7002581, 1, 1, 1, 1, 1,
-0.02279275, -1.263856, -1.999592, 1, 1, 1, 1, 1,
-0.011814, 0.8266348, 0.8424239, 1, 1, 1, 1, 1,
-0.01149625, -0.4840907, -2.321506, 1, 1, 1, 1, 1,
-0.009195407, 0.3876057, 0.03530507, 1, 1, 1, 1, 1,
-0.007346501, 0.139185, -0.485445, 1, 1, 1, 1, 1,
-0.002556443, -0.4021803, -2.394456, 1, 1, 1, 1, 1,
0.001430881, -0.1657815, 2.833492, 1, 1, 1, 1, 1,
0.01106024, 0.8220323, -0.06664849, 1, 1, 1, 1, 1,
0.0132071, 2.961191, 0.3794329, 1, 1, 1, 1, 1,
0.01858317, -0.1890635, 4.025774, 0, 0, 1, 1, 1,
0.02314369, 0.2940487, 0.6290125, 1, 0, 0, 1, 1,
0.02514658, -1.541144, 4.203972, 1, 0, 0, 1, 1,
0.02887141, 0.5239025, 0.7508852, 1, 0, 0, 1, 1,
0.03054029, -1.196066, 4.519211, 1, 0, 0, 1, 1,
0.03132565, -1.728776, 2.738778, 1, 0, 0, 1, 1,
0.03238897, 0.8789557, 0.2483465, 0, 0, 0, 1, 1,
0.03290242, 0.001474786, 0.3607902, 0, 0, 0, 1, 1,
0.03469266, 0.5531073, -0.8629352, 0, 0, 0, 1, 1,
0.03605999, 0.3033354, 0.007459125, 0, 0, 0, 1, 1,
0.0361752, -2.38315, 3.453612, 0, 0, 0, 1, 1,
0.03772055, 0.2789791, 0.9762099, 0, 0, 0, 1, 1,
0.03844198, -0.00924206, 1.879135, 0, 0, 0, 1, 1,
0.03887045, -0.2686261, 3.462618, 1, 1, 1, 1, 1,
0.03892208, 0.6516899, -0.5271059, 1, 1, 1, 1, 1,
0.04064536, -0.4682136, 2.751836, 1, 1, 1, 1, 1,
0.04447808, 0.9294328, 0.9432418, 1, 1, 1, 1, 1,
0.04522349, 0.5581966, 1.295887, 1, 1, 1, 1, 1,
0.04825516, -1.304669, 3.82973, 1, 1, 1, 1, 1,
0.0484168, -0.3732736, 1.590288, 1, 1, 1, 1, 1,
0.05253293, 2.595821, 0.398979, 1, 1, 1, 1, 1,
0.05483949, -0.1164231, 3.062127, 1, 1, 1, 1, 1,
0.05495186, 0.6551291, 0.06603513, 1, 1, 1, 1, 1,
0.05534881, -0.02468418, 2.43881, 1, 1, 1, 1, 1,
0.06163939, -0.1915669, 3.097489, 1, 1, 1, 1, 1,
0.06180119, 1.59228, 0.8335831, 1, 1, 1, 1, 1,
0.06815179, -0.04627555, 2.596343, 1, 1, 1, 1, 1,
0.07123816, 1.071582, 0.04601728, 1, 1, 1, 1, 1,
0.07705925, 0.04459191, 1.104877, 0, 0, 1, 1, 1,
0.07916443, -0.3630868, 0.2482588, 1, 0, 0, 1, 1,
0.08282835, -2.139502, 2.180349, 1, 0, 0, 1, 1,
0.08637794, -0.7866369, 3.879005, 1, 0, 0, 1, 1,
0.08748124, 0.3575326, 0.07043201, 1, 0, 0, 1, 1,
0.09555582, 1.521637, 2.328644, 1, 0, 0, 1, 1,
0.09845351, 0.4868729, -0.4101216, 0, 0, 0, 1, 1,
0.09853578, -0.1610007, 4.497043, 0, 0, 0, 1, 1,
0.09932862, -1.722242, 1.102035, 0, 0, 0, 1, 1,
0.09939068, -1.330411, 2.557463, 0, 0, 0, 1, 1,
0.09943069, 1.259134, 2.047041, 0, 0, 0, 1, 1,
0.09952363, -0.001591993, 1.967224, 0, 0, 0, 1, 1,
0.1010158, -0.3865504, 3.086376, 0, 0, 0, 1, 1,
0.1014055, -0.8566338, 3.065088, 1, 1, 1, 1, 1,
0.101579, -0.9626921, 2.829497, 1, 1, 1, 1, 1,
0.1059138, 0.07220694, 1.760148, 1, 1, 1, 1, 1,
0.1059342, -0.2100081, 3.062055, 1, 1, 1, 1, 1,
0.1077473, 0.1927948, 2.60496, 1, 1, 1, 1, 1,
0.1146323, -0.316627, 1.222094, 1, 1, 1, 1, 1,
0.119457, -0.724888, 3.8159, 1, 1, 1, 1, 1,
0.1225798, -0.8131868, 2.802256, 1, 1, 1, 1, 1,
0.1266318, -0.5135708, 3.427487, 1, 1, 1, 1, 1,
0.1399481, 0.1466378, 0.4935847, 1, 1, 1, 1, 1,
0.1449519, -0.4562062, 3.148594, 1, 1, 1, 1, 1,
0.1499864, 1.322868, -2.438044, 1, 1, 1, 1, 1,
0.1500386, 0.4002087, 0.6227009, 1, 1, 1, 1, 1,
0.1505973, 0.8297179, 0.8908956, 1, 1, 1, 1, 1,
0.1566563, 0.3471173, 1.474236, 1, 1, 1, 1, 1,
0.1572435, -0.4314568, 2.581845, 0, 0, 1, 1, 1,
0.1574289, 0.8716887, -0.4447848, 1, 0, 0, 1, 1,
0.1676104, 1.291089, 0.898293, 1, 0, 0, 1, 1,
0.1718774, -1.065872, 4.65871, 1, 0, 0, 1, 1,
0.1723555, 0.1899661, 1.345429, 1, 0, 0, 1, 1,
0.1757098, -1.109927, 3.79914, 1, 0, 0, 1, 1,
0.1777851, 0.7493807, 0.4576525, 0, 0, 0, 1, 1,
0.1788704, 0.002825539, 0.6637067, 0, 0, 0, 1, 1,
0.1802502, 0.04045745, 2.625794, 0, 0, 0, 1, 1,
0.1818925, 0.2355321, 0.8370451, 0, 0, 0, 1, 1,
0.1847848, 0.7067911, -0.5802099, 0, 0, 0, 1, 1,
0.188434, 1.848652, 1.170278, 0, 0, 0, 1, 1,
0.1906438, -0.001228252, 1.578623, 0, 0, 0, 1, 1,
0.1968711, 1.107824, -0.4311841, 1, 1, 1, 1, 1,
0.1969528, 0.06621887, 2.139475, 1, 1, 1, 1, 1,
0.1972912, 1.269726, -0.01343245, 1, 1, 1, 1, 1,
0.1984682, -1.003864, 0.9908464, 1, 1, 1, 1, 1,
0.2064281, 1.221987, -0.00706537, 1, 1, 1, 1, 1,
0.2087574, -0.7734393, 2.895782, 1, 1, 1, 1, 1,
0.215409, 0.371515, 1.344867, 1, 1, 1, 1, 1,
0.215518, -0.7601721, 2.356655, 1, 1, 1, 1, 1,
0.2178621, 1.28637, 1.477845, 1, 1, 1, 1, 1,
0.2181524, 0.5228898, 0.3069161, 1, 1, 1, 1, 1,
0.2183971, -0.5766106, 3.429939, 1, 1, 1, 1, 1,
0.2194493, -0.1589633, 2.646051, 1, 1, 1, 1, 1,
0.2205996, -0.4218805, 1.991038, 1, 1, 1, 1, 1,
0.2209695, 0.7037508, -1.453902, 1, 1, 1, 1, 1,
0.2241519, 0.5986285, 0.03566963, 1, 1, 1, 1, 1,
0.2258458, -1.331282, 1.147393, 0, 0, 1, 1, 1,
0.2280194, 0.06951568, -0.07445434, 1, 0, 0, 1, 1,
0.2314176, 1.575844, -1.079996, 1, 0, 0, 1, 1,
0.2326435, -1.01456, 3.010896, 1, 0, 0, 1, 1,
0.2344299, -1.616176, 2.754816, 1, 0, 0, 1, 1,
0.2376812, 0.1199222, 1.991537, 1, 0, 0, 1, 1,
0.238613, -0.5498807, 3.641668, 0, 0, 0, 1, 1,
0.2437063, -0.08572146, 2.030292, 0, 0, 0, 1, 1,
0.2466537, -1.322819, 2.908884, 0, 0, 0, 1, 1,
0.2467179, 1.403734, 0.8230149, 0, 0, 0, 1, 1,
0.2483101, -0.7224914, 2.836014, 0, 0, 0, 1, 1,
0.2602602, -0.5856231, 1.532, 0, 0, 0, 1, 1,
0.2682032, -0.6835909, 1.866305, 0, 0, 0, 1, 1,
0.2683177, 0.2469481, -0.09005503, 1, 1, 1, 1, 1,
0.270291, -1.052281, 1.317441, 1, 1, 1, 1, 1,
0.2828475, 1.460762, 0.4656505, 1, 1, 1, 1, 1,
0.2879611, -1.917549, 1.968929, 1, 1, 1, 1, 1,
0.2885194, -0.478688, 1.023647, 1, 1, 1, 1, 1,
0.2896097, -0.5942522, 2.734804, 1, 1, 1, 1, 1,
0.2929027, -1.577561, 4.473249, 1, 1, 1, 1, 1,
0.2936972, -1.55578, 1.979729, 1, 1, 1, 1, 1,
0.2958664, -0.9872369, 3.1496, 1, 1, 1, 1, 1,
0.3023419, 0.416522, 1.621485, 1, 1, 1, 1, 1,
0.3044153, -0.5369214, 3.008719, 1, 1, 1, 1, 1,
0.3066815, -0.6278277, 2.200764, 1, 1, 1, 1, 1,
0.3079904, -0.2056553, 2.252854, 1, 1, 1, 1, 1,
0.3126431, 0.120732, 0.5855056, 1, 1, 1, 1, 1,
0.3174027, 1.386677, -0.3563805, 1, 1, 1, 1, 1,
0.3213111, -0.02179678, 1.066147, 0, 0, 1, 1, 1,
0.3255153, 0.8537057, 0.3329141, 1, 0, 0, 1, 1,
0.32614, -0.5820146, 2.871293, 1, 0, 0, 1, 1,
0.3318742, -0.3621595, 1.969591, 1, 0, 0, 1, 1,
0.3392812, -0.9597567, 3.03825, 1, 0, 0, 1, 1,
0.3394993, 1.2119, 0.9011598, 1, 0, 0, 1, 1,
0.3399809, 1.678471, -0.1197376, 0, 0, 0, 1, 1,
0.3445638, -2.764287, 3.443272, 0, 0, 0, 1, 1,
0.3535751, -0.01960893, 1.337116, 0, 0, 0, 1, 1,
0.3538443, 0.6017309, 2.508554, 0, 0, 0, 1, 1,
0.3552282, -0.6621237, 2.825324, 0, 0, 0, 1, 1,
0.3632089, -0.3142832, 1.300578, 0, 0, 0, 1, 1,
0.3638572, 0.5848145, 1.574711, 0, 0, 0, 1, 1,
0.3639353, 1.031551, 0.150693, 1, 1, 1, 1, 1,
0.3665904, 1.468563, -1.190333, 1, 1, 1, 1, 1,
0.3670752, -0.3311541, 2.859152, 1, 1, 1, 1, 1,
0.3676901, 0.1820727, 2.057498, 1, 1, 1, 1, 1,
0.372574, 1.22591, 0.306242, 1, 1, 1, 1, 1,
0.3768088, -0.1265839, 2.530701, 1, 1, 1, 1, 1,
0.3796231, -0.722715, 0.6216233, 1, 1, 1, 1, 1,
0.3803901, -0.04231737, 1.807602, 1, 1, 1, 1, 1,
0.3887593, 1.428012, -0.5142493, 1, 1, 1, 1, 1,
0.3911737, -0.7637625, 3.51585, 1, 1, 1, 1, 1,
0.4011841, 1.237548, -0.6922128, 1, 1, 1, 1, 1,
0.4048511, -1.348388, 2.783378, 1, 1, 1, 1, 1,
0.405871, -1.568587, 3.555677, 1, 1, 1, 1, 1,
0.407766, 0.5568532, 0.06201109, 1, 1, 1, 1, 1,
0.4078511, -0.582015, 2.212883, 1, 1, 1, 1, 1,
0.4095705, 0.1734418, 2.302744, 0, 0, 1, 1, 1,
0.4123072, 1.138417, 0.426919, 1, 0, 0, 1, 1,
0.4134414, -1.266414, 2.764255, 1, 0, 0, 1, 1,
0.4156256, 1.443151, 0.01501106, 1, 0, 0, 1, 1,
0.4167891, 0.1042466, 2.996366, 1, 0, 0, 1, 1,
0.4172495, -1.218259, 4.018222, 1, 0, 0, 1, 1,
0.4173589, 0.3825666, 2.111487, 0, 0, 0, 1, 1,
0.4183038, 0.6071825, 0.4779049, 0, 0, 0, 1, 1,
0.4217226, -0.4358942, 3.777078, 0, 0, 0, 1, 1,
0.4235269, -0.1972683, 2.042246, 0, 0, 0, 1, 1,
0.4242309, -0.3829997, 3.148738, 0, 0, 0, 1, 1,
0.428758, -0.1696379, 2.637008, 0, 0, 0, 1, 1,
0.4353186, 0.4297492, 1.4141, 0, 0, 0, 1, 1,
0.4357345, -0.4833636, 1.676263, 1, 1, 1, 1, 1,
0.4466175, -1.053496, 2.000287, 1, 1, 1, 1, 1,
0.4515485, -1.479105, 4.685388, 1, 1, 1, 1, 1,
0.4563987, 0.2590869, 0.1071618, 1, 1, 1, 1, 1,
0.4576752, 0.6981989, 0.0837356, 1, 1, 1, 1, 1,
0.4588669, -3.881213, 3.146453, 1, 1, 1, 1, 1,
0.459625, 0.2716576, -0.1583888, 1, 1, 1, 1, 1,
0.4609234, 0.952564, 0.3978181, 1, 1, 1, 1, 1,
0.4662152, -1.669205, 2.206683, 1, 1, 1, 1, 1,
0.470935, -0.05829448, 3.215695, 1, 1, 1, 1, 1,
0.4718776, 0.7133306, 0.3283124, 1, 1, 1, 1, 1,
0.4726116, 2.298499, 0.3544981, 1, 1, 1, 1, 1,
0.4753041, -0.2595788, 3.842266, 1, 1, 1, 1, 1,
0.4771107, 0.8481534, 0.8043804, 1, 1, 1, 1, 1,
0.4774184, 1.122814, 1.004355, 1, 1, 1, 1, 1,
0.4793172, 2.131857, 0.4948161, 0, 0, 1, 1, 1,
0.4824376, -0.06264862, 1.952759, 1, 0, 0, 1, 1,
0.4832241, -1.485545, 1.666638, 1, 0, 0, 1, 1,
0.4835757, 3.104206, 1.798411, 1, 0, 0, 1, 1,
0.4846638, -0.02298967, 3.054477, 1, 0, 0, 1, 1,
0.4847101, -1.080277, 3.156085, 1, 0, 0, 1, 1,
0.4857645, 1.202357, 0.7757437, 0, 0, 0, 1, 1,
0.4872424, 0.1431339, 1.173995, 0, 0, 0, 1, 1,
0.4880939, -0.867795, 3.622381, 0, 0, 0, 1, 1,
0.4889835, 0.8103672, 2.733171, 0, 0, 0, 1, 1,
0.492842, -1.02727, 1.466913, 0, 0, 0, 1, 1,
0.4998026, -2.426886, 3.829245, 0, 0, 0, 1, 1,
0.5008646, -2.312975, 1.52942, 0, 0, 0, 1, 1,
0.5012724, -0.3773434, 2.213755, 1, 1, 1, 1, 1,
0.504254, 0.2600603, 1.016015, 1, 1, 1, 1, 1,
0.5070325, -0.04736377, 1.567669, 1, 1, 1, 1, 1,
0.508671, -0.5263733, 1.454556, 1, 1, 1, 1, 1,
0.5109584, 1.541784, -0.5671135, 1, 1, 1, 1, 1,
0.5118731, 1.367577, 1.89755, 1, 1, 1, 1, 1,
0.5236218, -0.9987219, 2.897239, 1, 1, 1, 1, 1,
0.5294555, 0.4609838, 0.8049141, 1, 1, 1, 1, 1,
0.5295386, 1.185758, -1.269122, 1, 1, 1, 1, 1,
0.5306094, -0.009837975, 1.756663, 1, 1, 1, 1, 1,
0.5344414, 1.438116, -0.1229674, 1, 1, 1, 1, 1,
0.5345642, 0.7547094, 0.1366025, 1, 1, 1, 1, 1,
0.5376386, 0.3376586, 2.197663, 1, 1, 1, 1, 1,
0.5461163, 0.3464838, 0.1253442, 1, 1, 1, 1, 1,
0.5491601, -1.03976, 2.336369, 1, 1, 1, 1, 1,
0.5500669, 2.067707, -0.1636169, 0, 0, 1, 1, 1,
0.5521443, -1.367763, 2.091584, 1, 0, 0, 1, 1,
0.5594304, -0.04941843, 2.06816, 1, 0, 0, 1, 1,
0.566067, -0.2002576, 2.098721, 1, 0, 0, 1, 1,
0.5664643, -1.369852, 1.165961, 1, 0, 0, 1, 1,
0.5664715, -0.2785227, 1.878639, 1, 0, 0, 1, 1,
0.5709223, 0.01127777, 2.105542, 0, 0, 0, 1, 1,
0.5755786, 0.3615088, -1.120494, 0, 0, 0, 1, 1,
0.5774644, -0.3092554, 2.009928, 0, 0, 0, 1, 1,
0.579608, -0.1347176, 3.261535, 0, 0, 0, 1, 1,
0.5825447, -1.138858, 2.855071, 0, 0, 0, 1, 1,
0.5842903, 0.1117751, 2.828043, 0, 0, 0, 1, 1,
0.5850123, -1.244345, 1.845472, 0, 0, 0, 1, 1,
0.585545, -1.990023, 2.95357, 1, 1, 1, 1, 1,
0.5871646, 0.5307328, 0.2845115, 1, 1, 1, 1, 1,
0.5880323, 0.06202994, 2.558576, 1, 1, 1, 1, 1,
0.59194, -0.2745827, 2.104518, 1, 1, 1, 1, 1,
0.5925215, -0.6020038, 1.946188, 1, 1, 1, 1, 1,
0.6025, 1.294837, -0.9800309, 1, 1, 1, 1, 1,
0.6030729, 0.1367424, 2.54819, 1, 1, 1, 1, 1,
0.608623, -0.609968, 1.432013, 1, 1, 1, 1, 1,
0.6096323, -0.2082801, 0.2829209, 1, 1, 1, 1, 1,
0.6102536, -1.401588, 4.477846, 1, 1, 1, 1, 1,
0.6105764, -0.6161131, 0.4125955, 1, 1, 1, 1, 1,
0.6133114, -0.6913177, 2.526223, 1, 1, 1, 1, 1,
0.6151766, -0.6450805, 2.33315, 1, 1, 1, 1, 1,
0.6169001, -0.14578, 2.252697, 1, 1, 1, 1, 1,
0.6215931, 0.7694726, 0.6886764, 1, 1, 1, 1, 1,
0.6239623, -0.8944631, 3.916231, 0, 0, 1, 1, 1,
0.62617, 0.8702639, 1.906533, 1, 0, 0, 1, 1,
0.6267424, -0.9251059, 1.70206, 1, 0, 0, 1, 1,
0.6272463, 0.1271691, -1.109372, 1, 0, 0, 1, 1,
0.6322656, 0.08799469, 0.9969191, 1, 0, 0, 1, 1,
0.635014, -0.2826986, 2.745241, 1, 0, 0, 1, 1,
0.6375328, 0.7556754, 0.5536877, 0, 0, 0, 1, 1,
0.6395393, -0.7982542, 1.698442, 0, 0, 0, 1, 1,
0.6462296, 0.1848373, 2.5942, 0, 0, 0, 1, 1,
0.64974, -1.337178, 1.504786, 0, 0, 0, 1, 1,
0.6549942, -0.2922152, 2.15401, 0, 0, 0, 1, 1,
0.6550796, 0.6011701, 0.8018834, 0, 0, 0, 1, 1,
0.6560289, 0.7743391, 1.691483, 0, 0, 0, 1, 1,
0.6586412, 1.607015, 0.1945211, 1, 1, 1, 1, 1,
0.6635817, -0.745002, 1.556128, 1, 1, 1, 1, 1,
0.6652931, 0.9242724, 1.321598, 1, 1, 1, 1, 1,
0.6660188, 0.1682801, 3.615539, 1, 1, 1, 1, 1,
0.6677294, -0.0746982, 1.609779, 1, 1, 1, 1, 1,
0.6682642, -0.6130692, 3.460108, 1, 1, 1, 1, 1,
0.6713966, 0.1810554, 0.7980797, 1, 1, 1, 1, 1,
0.6747177, -0.1686991, 1.2387, 1, 1, 1, 1, 1,
0.6811848, 0.1360378, 1.681958, 1, 1, 1, 1, 1,
0.6827746, -0.8521153, -0.5100912, 1, 1, 1, 1, 1,
0.6921447, 1.053558, 0.7471902, 1, 1, 1, 1, 1,
0.695993, 0.8960729, -1.863451, 1, 1, 1, 1, 1,
0.6962482, -0.8571674, 1.580269, 1, 1, 1, 1, 1,
0.6986755, -0.987515, 1.594245, 1, 1, 1, 1, 1,
0.6988646, -0.06075881, 1.396228, 1, 1, 1, 1, 1,
0.7000015, 0.538218, 2.523482, 0, 0, 1, 1, 1,
0.7007487, 0.6472059, 1.684156, 1, 0, 0, 1, 1,
0.7010568, -1.380315, 3.653639, 1, 0, 0, 1, 1,
0.7015822, 1.489087, 0.08352908, 1, 0, 0, 1, 1,
0.7031857, 0.8501309, 1.207385, 1, 0, 0, 1, 1,
0.7063062, 1.27792, 0.227321, 1, 0, 0, 1, 1,
0.7110389, 0.03698828, 1.854509, 0, 0, 0, 1, 1,
0.7119865, -0.2679581, 3.276598, 0, 0, 0, 1, 1,
0.7125798, 1.312472, 1.334751, 0, 0, 0, 1, 1,
0.7135072, -0.9422901, 2.224275, 0, 0, 0, 1, 1,
0.7169777, -0.5597703, 1.643665, 0, 0, 0, 1, 1,
0.7182116, 2.161148, -0.5261274, 0, 0, 0, 1, 1,
0.7183607, -2.195202, 2.284012, 0, 0, 0, 1, 1,
0.724865, 1.723784, -1.365409, 1, 1, 1, 1, 1,
0.7251943, -1.819245, 2.982306, 1, 1, 1, 1, 1,
0.7252081, 1.661179, -0.2010218, 1, 1, 1, 1, 1,
0.7264459, 0.6184304, 2.488968, 1, 1, 1, 1, 1,
0.7303003, -1.003237, 1.668366, 1, 1, 1, 1, 1,
0.7306837, 0.7111052, 0.7463101, 1, 1, 1, 1, 1,
0.7337295, -1.287634, 4.082654, 1, 1, 1, 1, 1,
0.7405568, 0.5857177, 1.357044, 1, 1, 1, 1, 1,
0.7437966, -0.3171334, 1.502044, 1, 1, 1, 1, 1,
0.7444994, 1.005285, -0.6621088, 1, 1, 1, 1, 1,
0.7480134, 1.737095, 0.1619358, 1, 1, 1, 1, 1,
0.7486884, -0.281032, 2.438254, 1, 1, 1, 1, 1,
0.750911, -1.498088, 2.370575, 1, 1, 1, 1, 1,
0.7538387, 0.1274514, 0.3194215, 1, 1, 1, 1, 1,
0.7560962, -0.7228046, 2.935822, 1, 1, 1, 1, 1,
0.7585616, -0.01551803, 1.606283, 0, 0, 1, 1, 1,
0.7602075, -0.3018023, 1.346227, 1, 0, 0, 1, 1,
0.7672729, -1.227076, 4.468384, 1, 0, 0, 1, 1,
0.7736384, -1.728063, 1.916585, 1, 0, 0, 1, 1,
0.7742257, 1.984558, -0.2300552, 1, 0, 0, 1, 1,
0.7748302, -0.289782, 2.496245, 1, 0, 0, 1, 1,
0.7751035, 1.596227, -0.01598774, 0, 0, 0, 1, 1,
0.775965, -1.729018, 1.834593, 0, 0, 0, 1, 1,
0.7760744, 1.442057, 0.4796659, 0, 0, 0, 1, 1,
0.7777152, 2.550117, 0.7895724, 0, 0, 0, 1, 1,
0.7800993, -1.189634, 3.984446, 0, 0, 0, 1, 1,
0.7816868, -0.49844, 3.045483, 0, 0, 0, 1, 1,
0.7833183, 1.018238, -1.485693, 0, 0, 0, 1, 1,
0.7910395, 2.188908, -1.373118, 1, 1, 1, 1, 1,
0.7914497, -0.2960164, 2.205983, 1, 1, 1, 1, 1,
0.7922837, 0.1761003, 0.3977131, 1, 1, 1, 1, 1,
0.798341, 0.1028121, 2.902451, 1, 1, 1, 1, 1,
0.7984431, -0.4346797, 2.311185, 1, 1, 1, 1, 1,
0.8041011, 0.3063644, 0.8107244, 1, 1, 1, 1, 1,
0.8108414, -0.3289372, 1.642837, 1, 1, 1, 1, 1,
0.8250934, -0.7053472, 2.747038, 1, 1, 1, 1, 1,
0.8257602, -0.4397819, 1.906912, 1, 1, 1, 1, 1,
0.8285609, -0.625948, 1.921233, 1, 1, 1, 1, 1,
0.8328784, -0.3189247, 2.447425, 1, 1, 1, 1, 1,
0.8382884, 1.937963, -0.06461819, 1, 1, 1, 1, 1,
0.8387145, -1.890053, 1.464714, 1, 1, 1, 1, 1,
0.8430303, 0.732417, 0.4784008, 1, 1, 1, 1, 1,
0.8491803, -1.383073, 1.547409, 1, 1, 1, 1, 1,
0.8514903, 0.9161091, 0.3034377, 0, 0, 1, 1, 1,
0.8517289, 0.5665248, 1.743761, 1, 0, 0, 1, 1,
0.8589132, -0.7874362, 3.434728, 1, 0, 0, 1, 1,
0.8604454, -0.07148069, 0.2773808, 1, 0, 0, 1, 1,
0.8618593, 0.1983496, 0.357603, 1, 0, 0, 1, 1,
0.8629904, -0.002875701, 0.470696, 1, 0, 0, 1, 1,
0.8631303, -0.1450686, 2.662365, 0, 0, 0, 1, 1,
0.872512, 0.3775515, 2.199462, 0, 0, 0, 1, 1,
0.8756241, 0.3800802, 0.6361374, 0, 0, 0, 1, 1,
0.8840228, -0.7659927, 2.454105, 0, 0, 0, 1, 1,
0.8877293, 1.022409, -0.6079339, 0, 0, 0, 1, 1,
0.888082, 0.3243299, 0.2553812, 0, 0, 0, 1, 1,
0.888807, -0.1847046, 2.435001, 0, 0, 0, 1, 1,
0.9052477, -0.9750338, 1.644333, 1, 1, 1, 1, 1,
0.9054404, 0.6933326, 1.893382, 1, 1, 1, 1, 1,
0.9055459, 0.934045, 0.01368498, 1, 1, 1, 1, 1,
0.9061378, -0.4629965, -0.2292544, 1, 1, 1, 1, 1,
0.9066642, -1.09114, 2.603034, 1, 1, 1, 1, 1,
0.906732, -0.3761489, 2.733881, 1, 1, 1, 1, 1,
0.9110435, -1.449144, 2.647465, 1, 1, 1, 1, 1,
0.911912, 0.4834906, 0.3556026, 1, 1, 1, 1, 1,
0.9159176, -1.693612, 3.072851, 1, 1, 1, 1, 1,
0.9235843, -0.09401166, 1.828725, 1, 1, 1, 1, 1,
0.9246156, 1.276695, 2.453259, 1, 1, 1, 1, 1,
0.9321383, 0.1021993, 1.731371, 1, 1, 1, 1, 1,
0.9404302, -2.243891, 2.849454, 1, 1, 1, 1, 1,
0.9407653, 1.975826, 1.303712, 1, 1, 1, 1, 1,
0.9418381, 0.3576306, 0.8462656, 1, 1, 1, 1, 1,
0.947726, -0.01142908, 2.508973, 0, 0, 1, 1, 1,
0.9520831, 0.8811295, 0.918621, 1, 0, 0, 1, 1,
0.9579578, 0.5900128, 1.171482, 1, 0, 0, 1, 1,
0.9611819, -0.8634005, 1.269731, 1, 0, 0, 1, 1,
0.9647378, 1.847255, 2.460994, 1, 0, 0, 1, 1,
0.9685965, -0.6060077, 1.553886, 1, 0, 0, 1, 1,
0.9697291, 0.07602007, 1.311113, 0, 0, 0, 1, 1,
0.9728023, 1.07779, -0.4524916, 0, 0, 0, 1, 1,
0.9819624, 2.393505, 1.145239, 0, 0, 0, 1, 1,
0.9843723, -0.0732916, 1.670709, 0, 0, 0, 1, 1,
0.9852066, -0.3702843, 2.387271, 0, 0, 0, 1, 1,
0.986881, -0.005892078, 3.091021, 0, 0, 0, 1, 1,
0.9886109, 0.558723, 1.919635, 0, 0, 0, 1, 1,
0.990362, 0.9831851, 0.6732183, 1, 1, 1, 1, 1,
0.9906379, -0.07072563, 1.102366, 1, 1, 1, 1, 1,
0.9927464, 0.7955442, 1.103786, 1, 1, 1, 1, 1,
0.995474, 0.4357007, 1.967896, 1, 1, 1, 1, 1,
1.001666, -0.03190172, 2.231628, 1, 1, 1, 1, 1,
1.002317, 2.058331, 0.5181218, 1, 1, 1, 1, 1,
1.006602, 1.047827, 2.554077, 1, 1, 1, 1, 1,
1.007799, -1.324994, 1.665244, 1, 1, 1, 1, 1,
1.009798, -0.2298906, 0.9907688, 1, 1, 1, 1, 1,
1.014349, 1.477458, 1.06303, 1, 1, 1, 1, 1,
1.021258, -1.016501, 2.81921, 1, 1, 1, 1, 1,
1.029665, 0.8035969, 0.2319801, 1, 1, 1, 1, 1,
1.037918, -0.4277219, 2.481996, 1, 1, 1, 1, 1,
1.043831, 0.3666309, 0.3229574, 1, 1, 1, 1, 1,
1.045328, -0.3936211, 0.3257646, 1, 1, 1, 1, 1,
1.045609, 0.09080359, -0.4562835, 0, 0, 1, 1, 1,
1.047618, 0.3445585, 1.326299, 1, 0, 0, 1, 1,
1.048315, 1.241286, -0.9555427, 1, 0, 0, 1, 1,
1.051931, 1.315858, 0.1630416, 1, 0, 0, 1, 1,
1.0681, -2.156491, 3.744248, 1, 0, 0, 1, 1,
1.070914, -0.671739, 3.628219, 1, 0, 0, 1, 1,
1.0782, 1.989358, 0.2827608, 0, 0, 0, 1, 1,
1.08506, -1.064343, 3.914578, 0, 0, 0, 1, 1,
1.085285, 0.2951159, 2.247368, 0, 0, 0, 1, 1,
1.085923, 0.617761, 2.060821, 0, 0, 0, 1, 1,
1.089137, -0.3395691, 2.255763, 0, 0, 0, 1, 1,
1.09343, -0.4822612, 1.225498, 0, 0, 0, 1, 1,
1.096268, -0.5961169, 2.008944, 0, 0, 0, 1, 1,
1.096586, 1.640458, 1.2912, 1, 1, 1, 1, 1,
1.098898, -1.474519, 1.529045, 1, 1, 1, 1, 1,
1.11036, 1.590008, -0.2319252, 1, 1, 1, 1, 1,
1.119881, 1.003809, -0.9121026, 1, 1, 1, 1, 1,
1.137031, 1.066246, 1.267666, 1, 1, 1, 1, 1,
1.140218, 0.8377625, 1.240647, 1, 1, 1, 1, 1,
1.145684, -0.1119114, 2.198012, 1, 1, 1, 1, 1,
1.154987, 1.808146, -0.1253055, 1, 1, 1, 1, 1,
1.157941, -0.7778633, 2.172321, 1, 1, 1, 1, 1,
1.160694, 1.168875, 1.105587, 1, 1, 1, 1, 1,
1.166687, 0.3976589, 1.226999, 1, 1, 1, 1, 1,
1.170129, -1.224555, 1.818721, 1, 1, 1, 1, 1,
1.173053, -0.09980797, 3.212199, 1, 1, 1, 1, 1,
1.179452, 0.5999648, 0.6288028, 1, 1, 1, 1, 1,
1.187482, 1.024138, 0.5956837, 1, 1, 1, 1, 1,
1.200169, -0.1139215, 2.326, 0, 0, 1, 1, 1,
1.201467, -0.9358401, 2.716754, 1, 0, 0, 1, 1,
1.202469, 0.05408534, 1.700979, 1, 0, 0, 1, 1,
1.210332, -0.07906474, 1.007045, 1, 0, 0, 1, 1,
1.211869, -2.660551, 2.35688, 1, 0, 0, 1, 1,
1.215332, 0.1716096, 1.997059, 1, 0, 0, 1, 1,
1.217165, 0.3601105, 1.038544, 0, 0, 0, 1, 1,
1.223104, 0.1837892, -1.171235, 0, 0, 0, 1, 1,
1.225841, -0.8465926, 1.104554, 0, 0, 0, 1, 1,
1.23101, 0.4253354, 1.630848, 0, 0, 0, 1, 1,
1.236824, 0.3010588, 0.6680052, 0, 0, 0, 1, 1,
1.248191, 0.3064353, 2.664664, 0, 0, 0, 1, 1,
1.248308, 0.9489855, 1.759969, 0, 0, 0, 1, 1,
1.248618, 0.3338982, 0.3494069, 1, 1, 1, 1, 1,
1.251388, 1.639258, 2.004291, 1, 1, 1, 1, 1,
1.256577, 0.02961259, 1.252542, 1, 1, 1, 1, 1,
1.259907, 0.9976532, 1.045644, 1, 1, 1, 1, 1,
1.265914, -0.6155105, 3.733574, 1, 1, 1, 1, 1,
1.268912, 0.340372, 1.639405, 1, 1, 1, 1, 1,
1.269821, -1.249276, 1.055856, 1, 1, 1, 1, 1,
1.277988, 1.729417, 0.5866534, 1, 1, 1, 1, 1,
1.28103, -0.06744555, 2.279917, 1, 1, 1, 1, 1,
1.282959, -0.3209006, 1.997399, 1, 1, 1, 1, 1,
1.284761, 1.522384, 4.139139, 1, 1, 1, 1, 1,
1.298588, 0.1672334, 2.824311, 1, 1, 1, 1, 1,
1.301863, 0.9025653, -0.642262, 1, 1, 1, 1, 1,
1.312903, -0.2157244, 2.473627, 1, 1, 1, 1, 1,
1.329794, 0.7894666, 1.790168, 1, 1, 1, 1, 1,
1.337151, -1.637664, 1.186497, 0, 0, 1, 1, 1,
1.34178, 2.27021, 0.4914498, 1, 0, 0, 1, 1,
1.345568, -0.9884781, 1.712621, 1, 0, 0, 1, 1,
1.352278, -0.4920518, 2.549462, 1, 0, 0, 1, 1,
1.365111, -1.005269, 1.143669, 1, 0, 0, 1, 1,
1.36865, 0.3938443, 0.8737686, 1, 0, 0, 1, 1,
1.376826, 0.04902113, 4.463668, 0, 0, 0, 1, 1,
1.378796, 0.9244599, 0.7864447, 0, 0, 0, 1, 1,
1.380138, -0.314789, 0.8191848, 0, 0, 0, 1, 1,
1.39251, -1.05906, 1.654467, 0, 0, 0, 1, 1,
1.393995, 2.35666, 0.04960441, 0, 0, 0, 1, 1,
1.399534, -1.659878, 1.52364, 0, 0, 0, 1, 1,
1.406227, 1.118168, 1.187442, 0, 0, 0, 1, 1,
1.407837, 1.274298, 1.304623, 1, 1, 1, 1, 1,
1.415334, -1.282874, 0.1523815, 1, 1, 1, 1, 1,
1.434189, -0.2231765, 0.5776269, 1, 1, 1, 1, 1,
1.452974, -0.4899879, 0.7454478, 1, 1, 1, 1, 1,
1.468566, 0.001245415, 2.4355, 1, 1, 1, 1, 1,
1.471808, 0.6137532, 2.098937, 1, 1, 1, 1, 1,
1.486673, 0.8744858, -1.061331, 1, 1, 1, 1, 1,
1.496266, -1.917341, 2.307821, 1, 1, 1, 1, 1,
1.498194, -0.5951803, 1.297721, 1, 1, 1, 1, 1,
1.503062, -1.541766, 1.953909, 1, 1, 1, 1, 1,
1.503711, -1.556976, 1.845119, 1, 1, 1, 1, 1,
1.50651, 0.5157574, 2.2131, 1, 1, 1, 1, 1,
1.509106, -0.3069665, 1.538391, 1, 1, 1, 1, 1,
1.51498, 0.1153343, 1.699244, 1, 1, 1, 1, 1,
1.545054, 0.1197056, 2.694761, 1, 1, 1, 1, 1,
1.549767, -0.4070539, 2.060366, 0, 0, 1, 1, 1,
1.551771, -1.312575, 2.288947, 1, 0, 0, 1, 1,
1.554751, -0.02059227, 0.02395305, 1, 0, 0, 1, 1,
1.555405, -0.8399346, 1.145117, 1, 0, 0, 1, 1,
1.561636, 0.06524333, 2.414205, 1, 0, 0, 1, 1,
1.56643, -0.6404117, 1.604634, 1, 0, 0, 1, 1,
1.569747, -0.375995, 1.070254, 0, 0, 0, 1, 1,
1.57643, 0.3057867, 0.9804203, 0, 0, 0, 1, 1,
1.579473, 0.4699533, 0.8964866, 0, 0, 0, 1, 1,
1.597227, -1.429726, 3.250896, 0, 0, 0, 1, 1,
1.642085, 0.5284276, 1.11148, 0, 0, 0, 1, 1,
1.674425, 1.723167, 1.883116, 0, 0, 0, 1, 1,
1.677386, -1.150143, 0.5817133, 0, 0, 0, 1, 1,
1.696242, -1.740467, 2.790755, 1, 1, 1, 1, 1,
1.697907, 0.1448655, 2.64761, 1, 1, 1, 1, 1,
1.712358, 0.6113118, 1.20877, 1, 1, 1, 1, 1,
1.720031, -1.61585, 2.471154, 1, 1, 1, 1, 1,
1.7288, 0.7381417, 0.4248338, 1, 1, 1, 1, 1,
1.749903, 0.2054384, 1.955489, 1, 1, 1, 1, 1,
1.764467, -0.8079775, 1.514756, 1, 1, 1, 1, 1,
1.780531, 0.5697088, 2.092593, 1, 1, 1, 1, 1,
1.780863, -0.241542, -0.0545655, 1, 1, 1, 1, 1,
1.834652, -0.7178272, 3.715394, 1, 1, 1, 1, 1,
1.846575, -0.8537304, 1.481183, 1, 1, 1, 1, 1,
1.855399, -0.6670434, 2.330414, 1, 1, 1, 1, 1,
1.878922, 0.4403012, 1.571437, 1, 1, 1, 1, 1,
1.896409, -0.9944659, 0.8477476, 1, 1, 1, 1, 1,
1.924458, -1.135104, 1.783473, 1, 1, 1, 1, 1,
1.94732, -1.573484, 0.8977558, 0, 0, 1, 1, 1,
1.950478, 0.2550716, 2.076303, 1, 0, 0, 1, 1,
1.958181, 0.7764786, 2.344169, 1, 0, 0, 1, 1,
1.966241, -0.2079038, 2.847163, 1, 0, 0, 1, 1,
1.970248, -0.01877652, 0.8234354, 1, 0, 0, 1, 1,
2.016049, -0.2843663, 0.3564487, 1, 0, 0, 1, 1,
2.065734, 0.2618824, 1.304204, 0, 0, 0, 1, 1,
2.077825, 0.03967068, 0.2850574, 0, 0, 0, 1, 1,
2.123088, 0.5535526, 1.987181, 0, 0, 0, 1, 1,
2.127375, -0.5254373, 1.642264, 0, 0, 0, 1, 1,
2.169562, -0.5838745, 2.935884, 0, 0, 0, 1, 1,
2.290821, 0.4338081, 0.6076002, 0, 0, 0, 1, 1,
2.402456, 1.480286, 0.09821934, 0, 0, 0, 1, 1,
2.440062, -0.6243564, 3.325597, 1, 1, 1, 1, 1,
2.461071, -0.9106176, -0.2726562, 1, 1, 1, 1, 1,
2.515512, -0.2695256, 2.409, 1, 1, 1, 1, 1,
2.600703, 1.27573, 0.8279142, 1, 1, 1, 1, 1,
2.771505, 1.099414, 1.015833, 1, 1, 1, 1, 1,
2.816019, 1.997429, 0.6601049, 1, 1, 1, 1, 1,
3.258443, -0.2586721, 2.358366, 1, 1, 1, 1, 1
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
var radius = 9.950651;
var distance = 34.95124;
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
mvMatrix.translate( 0.1011157, 0.2187266, 0.7244816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.95124);
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
