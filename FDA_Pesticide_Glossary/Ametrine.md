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
-3.176337, -1.233955, -2.04227, 1, 0, 0, 1,
-2.895194, -0.2664801, -1.941621, 1, 0.007843138, 0, 1,
-2.884466, 0.608153, -2.708646, 1, 0.01176471, 0, 1,
-2.593855, 0.1610669, -0.4829486, 1, 0.01960784, 0, 1,
-2.582926, 1.167784, -0.6094367, 1, 0.02352941, 0, 1,
-2.455358, 0.7729416, -0.6858782, 1, 0.03137255, 0, 1,
-2.447317, -1.009125, -2.383191, 1, 0.03529412, 0, 1,
-2.438336, 1.140489, -0.9433797, 1, 0.04313726, 0, 1,
-2.432405, 0.5769808, -3.674641, 1, 0.04705882, 0, 1,
-2.362657, 0.1730045, -1.374552, 1, 0.05490196, 0, 1,
-2.358597, -1.251857, -2.731346, 1, 0.05882353, 0, 1,
-2.298771, 0.3192695, -1.860396, 1, 0.06666667, 0, 1,
-2.29738, -0.502987, -2.126449, 1, 0.07058824, 0, 1,
-2.261621, 0.317996, -2.40654, 1, 0.07843138, 0, 1,
-2.252895, -0.4962471, -1.910041, 1, 0.08235294, 0, 1,
-2.251527, -0.7484942, -0.4788176, 1, 0.09019608, 0, 1,
-2.230393, 0.0891492, -1.047933, 1, 0.09411765, 0, 1,
-2.207371, -0.4656877, -0.5037746, 1, 0.1019608, 0, 1,
-2.145079, 0.7416186, -2.742268, 1, 0.1098039, 0, 1,
-2.131538, 0.7823821, -1.238986, 1, 0.1137255, 0, 1,
-2.127323, 1.91171, 0.01779819, 1, 0.1215686, 0, 1,
-2.119846, -0.9968632, -1.980815, 1, 0.1254902, 0, 1,
-2.11891, 0.03071924, -1.936592, 1, 0.1333333, 0, 1,
-2.106912, -0.9260868, -1.102467, 1, 0.1372549, 0, 1,
-2.075698, -0.6100293, -1.243248, 1, 0.145098, 0, 1,
-2.036012, -0.1193206, -2.89553, 1, 0.1490196, 0, 1,
-2.033459, 0.5371187, -1.148154, 1, 0.1568628, 0, 1,
-2.0192, -0.683897, -0.823841, 1, 0.1607843, 0, 1,
-2.003577, -0.0360842, -3.564233, 1, 0.1686275, 0, 1,
-1.985253, 1.735989, -0.6679421, 1, 0.172549, 0, 1,
-1.913231, -0.06172195, -1.203802, 1, 0.1803922, 0, 1,
-1.911723, -1.573467, -2.476226, 1, 0.1843137, 0, 1,
-1.890041, -1.818475, -2.99212, 1, 0.1921569, 0, 1,
-1.872911, 1.074897, -0.662103, 1, 0.1960784, 0, 1,
-1.871133, -0.5345555, -3.056812, 1, 0.2039216, 0, 1,
-1.869793, -0.1923619, -0.1818489, 1, 0.2117647, 0, 1,
-1.869266, 1.770523, -1.856189, 1, 0.2156863, 0, 1,
-1.862854, -0.5069747, -0.6172825, 1, 0.2235294, 0, 1,
-1.859282, -0.4706174, -1.827394, 1, 0.227451, 0, 1,
-1.853618, 0.4954858, -2.166197, 1, 0.2352941, 0, 1,
-1.834012, 2.270331, -1.937573, 1, 0.2392157, 0, 1,
-1.828013, -0.8487374, -1.761732, 1, 0.2470588, 0, 1,
-1.805493, 0.1733247, -0.8182264, 1, 0.2509804, 0, 1,
-1.762305, -0.1076091, -1.925329, 1, 0.2588235, 0, 1,
-1.762067, 1.750132, 0.8734882, 1, 0.2627451, 0, 1,
-1.759373, 0.6058183, -1.033611, 1, 0.2705882, 0, 1,
-1.743926, 1.115988, 0.6572797, 1, 0.2745098, 0, 1,
-1.714105, -0.0271776, -2.48606, 1, 0.282353, 0, 1,
-1.698218, 0.64459, -2.174638, 1, 0.2862745, 0, 1,
-1.674816, 0.4845102, -3.123122, 1, 0.2941177, 0, 1,
-1.670197, -0.8076048, -1.20918, 1, 0.3019608, 0, 1,
-1.669398, 0.6239538, -1.307792, 1, 0.3058824, 0, 1,
-1.653373, -1.251296, -3.327007, 1, 0.3137255, 0, 1,
-1.647634, -0.8345855, -1.873116, 1, 0.3176471, 0, 1,
-1.639223, -0.4319198, -0.7960184, 1, 0.3254902, 0, 1,
-1.619304, 1.907026, 0.02794049, 1, 0.3294118, 0, 1,
-1.603034, 0.09958881, -1.414339, 1, 0.3372549, 0, 1,
-1.592106, 1.943482, -0.4818713, 1, 0.3411765, 0, 1,
-1.590683, 2.439258, -0.4930965, 1, 0.3490196, 0, 1,
-1.571456, 1.320485, 0.04265174, 1, 0.3529412, 0, 1,
-1.567076, -0.5043225, -1.780629, 1, 0.3607843, 0, 1,
-1.548901, 0.535828, -1.950412, 1, 0.3647059, 0, 1,
-1.548862, 0.8778452, 0.4378548, 1, 0.372549, 0, 1,
-1.548091, -1.865053, 0.3119417, 1, 0.3764706, 0, 1,
-1.530707, 0.1584967, -0.98805, 1, 0.3843137, 0, 1,
-1.52979, 0.3153192, -1.19515, 1, 0.3882353, 0, 1,
-1.528969, -0.05497932, -1.70317, 1, 0.3960784, 0, 1,
-1.519586, -0.9254968, -3.640095, 1, 0.4039216, 0, 1,
-1.513706, 0.2323607, 0.1331797, 1, 0.4078431, 0, 1,
-1.49965, 0.3161002, -0.7046967, 1, 0.4156863, 0, 1,
-1.481632, 0.7227152, -0.1607347, 1, 0.4196078, 0, 1,
-1.474657, -0.722468, -1.73784, 1, 0.427451, 0, 1,
-1.473552, -0.467905, -1.424726, 1, 0.4313726, 0, 1,
-1.47336, 0.6949885, -0.9921203, 1, 0.4392157, 0, 1,
-1.458277, -0.4739355, -2.688681, 1, 0.4431373, 0, 1,
-1.449299, 1.367286, -1.069568, 1, 0.4509804, 0, 1,
-1.448118, 1.029623, 0.3094238, 1, 0.454902, 0, 1,
-1.444297, 0.0007481001, -0.9593486, 1, 0.4627451, 0, 1,
-1.432632, -1.674769, -2.881196, 1, 0.4666667, 0, 1,
-1.426686, -0.04740209, -0.8848283, 1, 0.4745098, 0, 1,
-1.424389, -0.5920597, -2.291804, 1, 0.4784314, 0, 1,
-1.422501, -1.818522, -4.573927, 1, 0.4862745, 0, 1,
-1.415273, -0.1552832, -0.8309515, 1, 0.4901961, 0, 1,
-1.409109, 1.339657, 0.350068, 1, 0.4980392, 0, 1,
-1.392132, 0.5944672, -1.61657, 1, 0.5058824, 0, 1,
-1.371539, -0.2314697, -1.340184, 1, 0.509804, 0, 1,
-1.368552, 1.119358, -0.5234431, 1, 0.5176471, 0, 1,
-1.367823, -0.7165199, -1.696615, 1, 0.5215687, 0, 1,
-1.35257, -0.7152729, -2.126355, 1, 0.5294118, 0, 1,
-1.350253, 1.300097, 0.5173493, 1, 0.5333334, 0, 1,
-1.336564, 0.7784157, -1.645891, 1, 0.5411765, 0, 1,
-1.322315, -0.4828411, -1.306924, 1, 0.5450981, 0, 1,
-1.321078, 0.5777959, -1.072142, 1, 0.5529412, 0, 1,
-1.320048, 0.3009163, -1.253957, 1, 0.5568628, 0, 1,
-1.309461, -0.964127, -1.260198, 1, 0.5647059, 0, 1,
-1.299405, 1.48651, -0.9186147, 1, 0.5686275, 0, 1,
-1.277544, -1.113704, -1.706997, 1, 0.5764706, 0, 1,
-1.274367, 0.2729385, -0.1953027, 1, 0.5803922, 0, 1,
-1.265779, 0.7497126, -0.1043806, 1, 0.5882353, 0, 1,
-1.258909, 0.4658897, -1.996703, 1, 0.5921569, 0, 1,
-1.244347, 0.3175445, -2.389182, 1, 0.6, 0, 1,
-1.242645, -0.7053519, -3.147604, 1, 0.6078432, 0, 1,
-1.23714, 0.002698272, -2.666183, 1, 0.6117647, 0, 1,
-1.231904, -0.5648327, -1.263299, 1, 0.6196079, 0, 1,
-1.225081, -0.4838912, -1.660059, 1, 0.6235294, 0, 1,
-1.223976, 1.286625, -1.739962, 1, 0.6313726, 0, 1,
-1.220531, -1.703176, -0.5113569, 1, 0.6352941, 0, 1,
-1.217724, 0.7237933, -1.802675, 1, 0.6431373, 0, 1,
-1.216645, -0.7900929, -1.306119, 1, 0.6470588, 0, 1,
-1.213508, 0.007437532, -2.076932, 1, 0.654902, 0, 1,
-1.213208, 0.8724439, 0.3148848, 1, 0.6588235, 0, 1,
-1.205877, -0.7895487, -1.401947, 1, 0.6666667, 0, 1,
-1.202635, 0.1467876, -1.637251, 1, 0.6705883, 0, 1,
-1.202056, -0.07961794, -1.415274, 1, 0.6784314, 0, 1,
-1.191753, -1.289988, -2.292553, 1, 0.682353, 0, 1,
-1.191191, 0.04916658, -1.253597, 1, 0.6901961, 0, 1,
-1.190018, 0.526252, 0.7576239, 1, 0.6941177, 0, 1,
-1.185698, -0.5142391, -1.760262, 1, 0.7019608, 0, 1,
-1.180047, -0.4139488, -1.893924, 1, 0.7098039, 0, 1,
-1.168679, 0.4889835, -1.39323, 1, 0.7137255, 0, 1,
-1.163467, 0.2923645, -1.271097, 1, 0.7215686, 0, 1,
-1.161972, 0.1950745, -0.2577503, 1, 0.7254902, 0, 1,
-1.161035, 0.2867212, -1.325186, 1, 0.7333333, 0, 1,
-1.136635, 0.9217108, -2.139921, 1, 0.7372549, 0, 1,
-1.133586, -1.065073, -1.192229, 1, 0.7450981, 0, 1,
-1.123522, 0.5561979, -0.6092567, 1, 0.7490196, 0, 1,
-1.118488, -1.347174, -2.004367, 1, 0.7568628, 0, 1,
-1.118358, 1.364464, -2.151218, 1, 0.7607843, 0, 1,
-1.118185, -0.2993179, -3.175015, 1, 0.7686275, 0, 1,
-1.116726, -1.717667, -3.890944, 1, 0.772549, 0, 1,
-1.116631, -0.9014392, 0.07733757, 1, 0.7803922, 0, 1,
-1.11624, -0.1113472, -1.772225, 1, 0.7843137, 0, 1,
-1.114648, -0.5591317, -0.8330009, 1, 0.7921569, 0, 1,
-1.110574, 0.02794765, -2.384812, 1, 0.7960784, 0, 1,
-1.107332, -0.1685989, -0.3281302, 1, 0.8039216, 0, 1,
-1.103784, 0.7880251, -2.344305, 1, 0.8117647, 0, 1,
-1.091755, 1.627252, 1.015851, 1, 0.8156863, 0, 1,
-1.091317, -1.736409, -3.189488, 1, 0.8235294, 0, 1,
-1.089053, -0.7992354, -1.218549, 1, 0.827451, 0, 1,
-1.086573, -1.140854, -2.808105, 1, 0.8352941, 0, 1,
-1.086357, 0.2227829, -0.2472621, 1, 0.8392157, 0, 1,
-1.083719, 0.9301983, 0.4886197, 1, 0.8470588, 0, 1,
-1.083107, 0.5701884, -1.00497, 1, 0.8509804, 0, 1,
-1.078186, 0.9795725, -0.6999308, 1, 0.8588235, 0, 1,
-1.075193, 0.5283034, 0.1488518, 1, 0.8627451, 0, 1,
-1.069605, 0.4147906, -2.019644, 1, 0.8705882, 0, 1,
-1.061374, 0.6077021, -0.6874616, 1, 0.8745098, 0, 1,
-1.057488, 0.5436032, 0.2874483, 1, 0.8823529, 0, 1,
-1.046311, -2.272691, -2.434426, 1, 0.8862745, 0, 1,
-1.029332, -1.565928, -2.910156, 1, 0.8941177, 0, 1,
-1.024135, -0.8567451, -3.324365, 1, 0.8980392, 0, 1,
-1.019944, -0.858155, -3.671881, 1, 0.9058824, 0, 1,
-1.018646, -0.4131926, -1.981134, 1, 0.9137255, 0, 1,
-1.005818, -0.3637096, -1.750726, 1, 0.9176471, 0, 1,
-1.005774, 0.4033425, -0.4869666, 1, 0.9254902, 0, 1,
-1.004615, -0.3060629, -1.774509, 1, 0.9294118, 0, 1,
-0.997743, -0.1165669, -0.6207494, 1, 0.9372549, 0, 1,
-0.9916799, 0.3828615, -2.410115, 1, 0.9411765, 0, 1,
-0.9871505, 1.581582, -2.897354, 1, 0.9490196, 0, 1,
-0.980316, -0.183648, -1.783559, 1, 0.9529412, 0, 1,
-0.979757, -0.2748861, -0.1452128, 1, 0.9607843, 0, 1,
-0.9763313, 2.202537, -0.3620965, 1, 0.9647059, 0, 1,
-0.9692716, 0.5558379, 0.6611575, 1, 0.972549, 0, 1,
-0.9675975, -1.464461, -2.703256, 1, 0.9764706, 0, 1,
-0.964627, 0.5982072, -2.887166, 1, 0.9843137, 0, 1,
-0.9585811, -0.5203425, -1.757464, 1, 0.9882353, 0, 1,
-0.958119, -1.230241, -2.266423, 1, 0.9960784, 0, 1,
-0.9549915, -0.1295503, -2.341852, 0.9960784, 1, 0, 1,
-0.9508557, 1.052769, -1.17503, 0.9921569, 1, 0, 1,
-0.9465528, -1.338004, -2.728126, 0.9843137, 1, 0, 1,
-0.9463575, -1.014108, -2.117949, 0.9803922, 1, 0, 1,
-0.9441084, 1.498785, -0.3977394, 0.972549, 1, 0, 1,
-0.9278037, 0.7736442, -1.912001, 0.9686275, 1, 0, 1,
-0.9209229, 0.6348562, 0.2051972, 0.9607843, 1, 0, 1,
-0.9146636, -1.716169, -2.888981, 0.9568627, 1, 0, 1,
-0.9109743, 0.75881, -0.595552, 0.9490196, 1, 0, 1,
-0.9098579, 0.6518849, -0.3084137, 0.945098, 1, 0, 1,
-0.9091633, 0.02558648, -0.7412184, 0.9372549, 1, 0, 1,
-0.9080051, 0.07074549, -1.056744, 0.9333333, 1, 0, 1,
-0.9035773, -0.8028384, -3.599878, 0.9254902, 1, 0, 1,
-0.8947252, 0.2027924, 0.7848784, 0.9215686, 1, 0, 1,
-0.8928811, -1.284167, -1.788294, 0.9137255, 1, 0, 1,
-0.8876162, 0.3823844, -1.01956, 0.9098039, 1, 0, 1,
-0.887135, -0.8315078, -2.80049, 0.9019608, 1, 0, 1,
-0.8826829, 0.07282142, -0.9575513, 0.8941177, 1, 0, 1,
-0.8821108, -0.5625091, -2.921829, 0.8901961, 1, 0, 1,
-0.8814033, -1.128045, -1.945239, 0.8823529, 1, 0, 1,
-0.8779479, 1.289776, -0.8603288, 0.8784314, 1, 0, 1,
-0.8716748, -0.8337469, -2.36171, 0.8705882, 1, 0, 1,
-0.8659256, -0.3283086, -2.429373, 0.8666667, 1, 0, 1,
-0.8596966, -0.9093122, -2.817288, 0.8588235, 1, 0, 1,
-0.8559523, 0.6538989, -1.573197, 0.854902, 1, 0, 1,
-0.8489218, 1.337037, 0.3653509, 0.8470588, 1, 0, 1,
-0.8484322, -2.820556, -2.160901, 0.8431373, 1, 0, 1,
-0.8459502, 2.243793, 0.09358408, 0.8352941, 1, 0, 1,
-0.8441105, 0.5357466, -1.803316, 0.8313726, 1, 0, 1,
-0.8428715, 3.242538, 0.8995398, 0.8235294, 1, 0, 1,
-0.8331865, -0.8915349, -2.897999, 0.8196079, 1, 0, 1,
-0.8323849, -1.962728, -0.7063294, 0.8117647, 1, 0, 1,
-0.8311649, 0.1022264, -1.554861, 0.8078431, 1, 0, 1,
-0.8289416, -1.770284, -2.783758, 0.8, 1, 0, 1,
-0.8269104, -0.2975058, -2.886591, 0.7921569, 1, 0, 1,
-0.8254804, -0.1180535, -1.548697, 0.7882353, 1, 0, 1,
-0.8234128, 0.9367091, 0.03462257, 0.7803922, 1, 0, 1,
-0.8217136, -1.195927, -1.7908, 0.7764706, 1, 0, 1,
-0.8166144, -0.8765805, -2.117311, 0.7686275, 1, 0, 1,
-0.8121924, -0.4334269, -1.646125, 0.7647059, 1, 0, 1,
-0.8101234, -1.065005, -2.661969, 0.7568628, 1, 0, 1,
-0.8039032, -0.6725365, -2.378853, 0.7529412, 1, 0, 1,
-0.798136, 1.0254, 0.5213579, 0.7450981, 1, 0, 1,
-0.7970669, 1.937344, -1.28766, 0.7411765, 1, 0, 1,
-0.7944484, -1.328109, -2.523964, 0.7333333, 1, 0, 1,
-0.7907341, -1.108834, -1.940052, 0.7294118, 1, 0, 1,
-0.7886402, 0.08426981, -3.37199, 0.7215686, 1, 0, 1,
-0.7877558, 0.9705718, -1.172496, 0.7176471, 1, 0, 1,
-0.7853665, -2.642136, -3.196125, 0.7098039, 1, 0, 1,
-0.7833586, 0.3758847, -1.190677, 0.7058824, 1, 0, 1,
-0.7709555, -1.128361, -2.385549, 0.6980392, 1, 0, 1,
-0.7679441, -0.1632009, -1.775133, 0.6901961, 1, 0, 1,
-0.7650171, -0.7576011, -3.138693, 0.6862745, 1, 0, 1,
-0.7584736, -0.3493719, -2.896551, 0.6784314, 1, 0, 1,
-0.7552381, 0.5617868, -0.5497086, 0.6745098, 1, 0, 1,
-0.7530226, -1.205997, -2.24249, 0.6666667, 1, 0, 1,
-0.7427083, -0.6558752, -2.897402, 0.6627451, 1, 0, 1,
-0.7368126, 0.209231, 0.1160975, 0.654902, 1, 0, 1,
-0.7343187, -0.05259962, -1.14294, 0.6509804, 1, 0, 1,
-0.7338955, 0.6428167, -0.9068903, 0.6431373, 1, 0, 1,
-0.7322124, -1.555465, -1.808135, 0.6392157, 1, 0, 1,
-0.7289986, 0.05811651, -2.541367, 0.6313726, 1, 0, 1,
-0.7227517, -2.766444, -0.8929309, 0.627451, 1, 0, 1,
-0.7154315, -0.6834528, -2.867228, 0.6196079, 1, 0, 1,
-0.7127114, 0.6977686, -0.80765, 0.6156863, 1, 0, 1,
-0.7114524, 1.83685, 0.1606686, 0.6078432, 1, 0, 1,
-0.7064947, 0.2350501, -1.490534, 0.6039216, 1, 0, 1,
-0.7038291, -0.9126824, -3.681725, 0.5960785, 1, 0, 1,
-0.6977794, 0.4820531, 0.4682117, 0.5882353, 1, 0, 1,
-0.6907018, -0.8399633, -3.706965, 0.5843138, 1, 0, 1,
-0.6881521, -1.84819, -1.581797, 0.5764706, 1, 0, 1,
-0.6871054, 0.5258027, -0.8298466, 0.572549, 1, 0, 1,
-0.6862072, 1.116075, -0.312738, 0.5647059, 1, 0, 1,
-0.6832573, 0.2148837, -1.951019, 0.5607843, 1, 0, 1,
-0.6756697, -0.005753902, -2.490713, 0.5529412, 1, 0, 1,
-0.6726528, -0.6821492, -3.663922, 0.5490196, 1, 0, 1,
-0.6696911, 2.452007, -1.020909, 0.5411765, 1, 0, 1,
-0.6677558, 0.4578008, -2.508234, 0.5372549, 1, 0, 1,
-0.6666655, -0.6785084, -1.906327, 0.5294118, 1, 0, 1,
-0.6654137, -0.5180663, -2.80651, 0.5254902, 1, 0, 1,
-0.6637039, 0.7978259, -0.01742215, 0.5176471, 1, 0, 1,
-0.6613691, 1.190375, 0.4722318, 0.5137255, 1, 0, 1,
-0.6608607, -1.407293, -1.302098, 0.5058824, 1, 0, 1,
-0.6597866, -0.3559055, -1.814725, 0.5019608, 1, 0, 1,
-0.6501285, -0.4255832, -1.715006, 0.4941176, 1, 0, 1,
-0.6475079, 0.746024, -1.100715, 0.4862745, 1, 0, 1,
-0.6466604, 0.6725783, -1.329243, 0.4823529, 1, 0, 1,
-0.6459839, 1.154293, -1.683417, 0.4745098, 1, 0, 1,
-0.6438435, 0.9106091, 0.3861061, 0.4705882, 1, 0, 1,
-0.6414841, 0.5130512, 0.8818293, 0.4627451, 1, 0, 1,
-0.6406085, 0.0337828, -2.564006, 0.4588235, 1, 0, 1,
-0.6392429, -0.5359175, -1.753772, 0.4509804, 1, 0, 1,
-0.6337572, 0.193311, -0.3730741, 0.4470588, 1, 0, 1,
-0.6196089, 0.8482771, -2.626514, 0.4392157, 1, 0, 1,
-0.6191243, -0.1103174, -1.217568, 0.4352941, 1, 0, 1,
-0.61814, 1.251081, -1.167744, 0.427451, 1, 0, 1,
-0.612844, 1.111088, 0.1944705, 0.4235294, 1, 0, 1,
-0.6103684, 0.2664157, -3.591809, 0.4156863, 1, 0, 1,
-0.6089282, 1.685414, -0.5518694, 0.4117647, 1, 0, 1,
-0.608734, -0.01132276, -1.784015, 0.4039216, 1, 0, 1,
-0.6049438, 0.5015106, 0.08160409, 0.3960784, 1, 0, 1,
-0.6049372, -0.3713827, -1.878221, 0.3921569, 1, 0, 1,
-0.5866576, -1.517018, -4.202618, 0.3843137, 1, 0, 1,
-0.5859846, -0.188874, -2.005377, 0.3803922, 1, 0, 1,
-0.5795042, -0.993162, -2.582945, 0.372549, 1, 0, 1,
-0.5791372, 1.225411, 0.4710991, 0.3686275, 1, 0, 1,
-0.5780901, -0.3132579, -2.185719, 0.3607843, 1, 0, 1,
-0.5777835, 0.07991727, -0.264898, 0.3568628, 1, 0, 1,
-0.5773153, -1.862266, -1.027416, 0.3490196, 1, 0, 1,
-0.5763499, -0.1141024, -2.307716, 0.345098, 1, 0, 1,
-0.5739906, -1.135829, -4.278445, 0.3372549, 1, 0, 1,
-0.5710867, 2.937404, 0.3627858, 0.3333333, 1, 0, 1,
-0.5697121, -0.8493103, -1.684586, 0.3254902, 1, 0, 1,
-0.5685095, -0.3848701, -3.947594, 0.3215686, 1, 0, 1,
-0.5661098, -2.147033, -2.089731, 0.3137255, 1, 0, 1,
-0.5587492, -0.8903044, -2.94789, 0.3098039, 1, 0, 1,
-0.5490194, 0.1544578, -1.614841, 0.3019608, 1, 0, 1,
-0.5439347, -2.201901, -3.24339, 0.2941177, 1, 0, 1,
-0.537568, 1.407152, -0.4674028, 0.2901961, 1, 0, 1,
-0.5368212, 1.174649, -1.421555, 0.282353, 1, 0, 1,
-0.5359388, -0.3819423, -2.210255, 0.2784314, 1, 0, 1,
-0.53541, 1.238304, -0.5978746, 0.2705882, 1, 0, 1,
-0.5324264, 0.2672478, -1.370293, 0.2666667, 1, 0, 1,
-0.5314008, 0.63852, -1.027669, 0.2588235, 1, 0, 1,
-0.5291526, -1.010493, -2.726547, 0.254902, 1, 0, 1,
-0.52254, -0.7063769, -3.758023, 0.2470588, 1, 0, 1,
-0.522248, 0.2137156, -1.330725, 0.2431373, 1, 0, 1,
-0.5198005, -0.1284607, -3.491261, 0.2352941, 1, 0, 1,
-0.5186917, -1.863288, -5.169532, 0.2313726, 1, 0, 1,
-0.5184951, -2.4102, -2.809623, 0.2235294, 1, 0, 1,
-0.513065, 0.429796, -1.772412, 0.2196078, 1, 0, 1,
-0.5119908, -1.640402, -3.791569, 0.2117647, 1, 0, 1,
-0.5084839, 0.2006337, -1.550743, 0.2078431, 1, 0, 1,
-0.5012745, 1.241179, 0.5104213, 0.2, 1, 0, 1,
-0.4967641, -1.057937, -4.95599, 0.1921569, 1, 0, 1,
-0.4939898, -1.01829, -2.775481, 0.1882353, 1, 0, 1,
-0.4899634, 0.7380332, -1.289004, 0.1803922, 1, 0, 1,
-0.4868081, -0.0434299, -2.876607, 0.1764706, 1, 0, 1,
-0.4817467, -0.2834627, -2.428875, 0.1686275, 1, 0, 1,
-0.4761129, 0.1961478, -1.454552, 0.1647059, 1, 0, 1,
-0.4757346, -0.79372, -3.207788, 0.1568628, 1, 0, 1,
-0.4755871, -0.3998884, -3.767166, 0.1529412, 1, 0, 1,
-0.47544, -1.600518, -3.323975, 0.145098, 1, 0, 1,
-0.4708714, -0.4205919, -3.539813, 0.1411765, 1, 0, 1,
-0.4703765, -0.5390353, -2.461146, 0.1333333, 1, 0, 1,
-0.4692792, 1.039867, 0.7049921, 0.1294118, 1, 0, 1,
-0.4618395, 0.4374934, -0.6800045, 0.1215686, 1, 0, 1,
-0.4586263, 1.064183, -1.598759, 0.1176471, 1, 0, 1,
-0.4584485, 2.616465, -0.03253118, 0.1098039, 1, 0, 1,
-0.4481012, 1.36342, -0.8153474, 0.1058824, 1, 0, 1,
-0.4462745, 0.6755822, -0.3892722, 0.09803922, 1, 0, 1,
-0.4421342, -1.598023, -3.099886, 0.09019608, 1, 0, 1,
-0.4387144, 0.6521994, -1.266602, 0.08627451, 1, 0, 1,
-0.4369995, 0.223091, -2.566133, 0.07843138, 1, 0, 1,
-0.434188, -2.431484, -4.312794, 0.07450981, 1, 0, 1,
-0.4336395, 0.663833, 0.1032364, 0.06666667, 1, 0, 1,
-0.4320396, 0.3383146, -1.479433, 0.0627451, 1, 0, 1,
-0.4270412, 0.8262034, 0.33038, 0.05490196, 1, 0, 1,
-0.4254442, 0.538931, 0.2372635, 0.05098039, 1, 0, 1,
-0.4215328, 0.287668, -1.250815, 0.04313726, 1, 0, 1,
-0.4199913, 2.040127, -0.08065181, 0.03921569, 1, 0, 1,
-0.4188064, 0.32192, -1.16404, 0.03137255, 1, 0, 1,
-0.418156, 1.69667, 0.8948707, 0.02745098, 1, 0, 1,
-0.4177589, -0.3478836, -2.758822, 0.01960784, 1, 0, 1,
-0.4143017, -0.06522424, -2.755499, 0.01568628, 1, 0, 1,
-0.4134255, -0.04429007, -3.16159, 0.007843138, 1, 0, 1,
-0.4091475, -0.4237394, -2.460941, 0.003921569, 1, 0, 1,
-0.4085826, -1.166937, -3.086802, 0, 1, 0.003921569, 1,
-0.4063846, 0.4791626, -0.05081438, 0, 1, 0.01176471, 1,
-0.4055593, -0.8902953, -0.826629, 0, 1, 0.01568628, 1,
-0.3965262, 0.1433183, -0.9225023, 0, 1, 0.02352941, 1,
-0.3938178, -0.9843193, -2.936661, 0, 1, 0.02745098, 1,
-0.3935792, 0.9343128, -0.1724546, 0, 1, 0.03529412, 1,
-0.3909107, 1.6423, -0.7649151, 0, 1, 0.03921569, 1,
-0.3907988, 0.3442664, -0.8563456, 0, 1, 0.04705882, 1,
-0.3900789, 0.4164378, -2.230557, 0, 1, 0.05098039, 1,
-0.3888119, 0.2673842, -0.7268665, 0, 1, 0.05882353, 1,
-0.3857297, 0.06155772, -0.9341326, 0, 1, 0.0627451, 1,
-0.3833871, -0.7649093, -2.983911, 0, 1, 0.07058824, 1,
-0.3767341, 1.865451, -1.670496, 0, 1, 0.07450981, 1,
-0.3766296, 0.9953205, -0.4082897, 0, 1, 0.08235294, 1,
-0.3618574, 0.1286106, -1.070152, 0, 1, 0.08627451, 1,
-0.3596519, 1.79648, 0.4413404, 0, 1, 0.09411765, 1,
-0.3571079, -0.6619914, -1.064497, 0, 1, 0.1019608, 1,
-0.3545456, 0.7888981, 0.2791687, 0, 1, 0.1058824, 1,
-0.3512895, 0.2042909, -2.888465, 0, 1, 0.1137255, 1,
-0.3506001, 0.3107492, 0.04551638, 0, 1, 0.1176471, 1,
-0.3500671, 1.241658, -0.1253372, 0, 1, 0.1254902, 1,
-0.3479929, -1.085098, -3.716781, 0, 1, 0.1294118, 1,
-0.3469755, 2.634303, -0.9082825, 0, 1, 0.1372549, 1,
-0.3418247, 1.078229, -0.4179789, 0, 1, 0.1411765, 1,
-0.3362735, -0.3172117, -2.779974, 0, 1, 0.1490196, 1,
-0.3344764, -0.07642116, -2.377347, 0, 1, 0.1529412, 1,
-0.3293847, -0.5603244, -2.222592, 0, 1, 0.1607843, 1,
-0.3276598, 0.02703591, -3.29341, 0, 1, 0.1647059, 1,
-0.3256876, -0.8231129, -3.622941, 0, 1, 0.172549, 1,
-0.3160455, -0.6647334, -2.04549, 0, 1, 0.1764706, 1,
-0.3159702, -0.2211748, -1.244186, 0, 1, 0.1843137, 1,
-0.3129829, -1.60367, -3.12644, 0, 1, 0.1882353, 1,
-0.3126695, -0.8248834, -2.799273, 0, 1, 0.1960784, 1,
-0.312209, 0.5480499, -1.896163, 0, 1, 0.2039216, 1,
-0.3114966, 0.2878286, -1.058129, 0, 1, 0.2078431, 1,
-0.3100174, 1.425469, 1.042853, 0, 1, 0.2156863, 1,
-0.3086961, -0.4727723, -0.9817261, 0, 1, 0.2196078, 1,
-0.3080495, 0.5607121, -1.976181, 0, 1, 0.227451, 1,
-0.3057075, -0.9491931, -1.831603, 0, 1, 0.2313726, 1,
-0.3002116, -1.819893, -2.462883, 0, 1, 0.2392157, 1,
-0.2998421, -1.104486, -2.606499, 0, 1, 0.2431373, 1,
-0.2926744, 0.1234474, -0.2385565, 0, 1, 0.2509804, 1,
-0.2923776, 0.3603405, -0.8990278, 0, 1, 0.254902, 1,
-0.2912995, -1.318734, -2.208713, 0, 1, 0.2627451, 1,
-0.2904451, 0.9893587, -0.08699807, 0, 1, 0.2666667, 1,
-0.2882087, 0.01025163, -1.616138, 0, 1, 0.2745098, 1,
-0.2841939, 0.08687349, -1.078777, 0, 1, 0.2784314, 1,
-0.2837424, 0.009278356, -1.707751, 0, 1, 0.2862745, 1,
-0.2782942, 0.6539205, -2.836793, 0, 1, 0.2901961, 1,
-0.2775069, -1.212866, -2.898543, 0, 1, 0.2980392, 1,
-0.2726292, 1.627866, 1.966278, 0, 1, 0.3058824, 1,
-0.2714904, -0.3958329, -2.760567, 0, 1, 0.3098039, 1,
-0.2641182, 1.534373, 0.7573014, 0, 1, 0.3176471, 1,
-0.2588993, -0.3226762, -3.869399, 0, 1, 0.3215686, 1,
-0.2577315, 1.357767, 0.4587468, 0, 1, 0.3294118, 1,
-0.2513613, 1.542831, 0.2753461, 0, 1, 0.3333333, 1,
-0.2466687, -1.72906, -3.7115, 0, 1, 0.3411765, 1,
-0.2400687, 0.06616844, 0.4172255, 0, 1, 0.345098, 1,
-0.2370852, 0.3766755, -0.7033569, 0, 1, 0.3529412, 1,
-0.2281539, 1.679762, -0.2821168, 0, 1, 0.3568628, 1,
-0.2180544, 0.07480919, -1.829043, 0, 1, 0.3647059, 1,
-0.2146902, 0.1213536, -0.8346383, 0, 1, 0.3686275, 1,
-0.1989778, -2.254661, -2.811632, 0, 1, 0.3764706, 1,
-0.1986222, -0.07747883, -2.473578, 0, 1, 0.3803922, 1,
-0.1919818, -0.1993151, -0.4000689, 0, 1, 0.3882353, 1,
-0.1909229, 0.7877542, 1.802228, 0, 1, 0.3921569, 1,
-0.1898417, -1.082861, -2.078759, 0, 1, 0.4, 1,
-0.1889025, 0.8926555, 0.5765135, 0, 1, 0.4078431, 1,
-0.18822, 0.1541287, 0.1541268, 0, 1, 0.4117647, 1,
-0.1856066, -0.5983208, -2.59058, 0, 1, 0.4196078, 1,
-0.1848539, 1.027249, 0.4560816, 0, 1, 0.4235294, 1,
-0.1825694, -0.1236218, -3.711483, 0, 1, 0.4313726, 1,
-0.1816556, -1.0774, -3.05281, 0, 1, 0.4352941, 1,
-0.179933, 0.5765386, -0.6240889, 0, 1, 0.4431373, 1,
-0.178191, 0.5927392, 1.184731, 0, 1, 0.4470588, 1,
-0.1778039, -1.549794, -2.70344, 0, 1, 0.454902, 1,
-0.1776307, 1.231855, -0.004007185, 0, 1, 0.4588235, 1,
-0.1742491, 0.7238552, 1.567375, 0, 1, 0.4666667, 1,
-0.1709419, 0.04870836, -2.574472, 0, 1, 0.4705882, 1,
-0.1683058, 0.1514638, -0.9239349, 0, 1, 0.4784314, 1,
-0.1675412, 0.1857319, -0.7020018, 0, 1, 0.4823529, 1,
-0.1665446, 1.310374, -1.917956, 0, 1, 0.4901961, 1,
-0.1656282, -0.8504338, -3.255775, 0, 1, 0.4941176, 1,
-0.1637507, 0.8097955, -1.234299, 0, 1, 0.5019608, 1,
-0.163577, 1.477032, 0.6414719, 0, 1, 0.509804, 1,
-0.1597727, -0.6419277, -3.40304, 0, 1, 0.5137255, 1,
-0.1595665, 1.40412, 0.1794543, 0, 1, 0.5215687, 1,
-0.1560012, -0.1496277, -1.997935, 0, 1, 0.5254902, 1,
-0.1551683, 0.6353421, -2.359895, 0, 1, 0.5333334, 1,
-0.1550533, 0.8718967, -1.012374, 0, 1, 0.5372549, 1,
-0.1509724, 2.055583, 0.1233922, 0, 1, 0.5450981, 1,
-0.1504612, 0.8223807, -0.2026118, 0, 1, 0.5490196, 1,
-0.1499843, -0.2392511, -2.896874, 0, 1, 0.5568628, 1,
-0.1497807, 0.5488027, -0.1705942, 0, 1, 0.5607843, 1,
-0.1417048, 0.2536202, -0.8738405, 0, 1, 0.5686275, 1,
-0.1361477, 1.747574, -1.169867, 0, 1, 0.572549, 1,
-0.1337802, -1.959507, -1.841852, 0, 1, 0.5803922, 1,
-0.1317345, -0.4569331, -1.301173, 0, 1, 0.5843138, 1,
-0.1280056, -0.8072237, -3.009056, 0, 1, 0.5921569, 1,
-0.1242193, -1.017196, -2.900086, 0, 1, 0.5960785, 1,
-0.1232941, 0.9149635, -0.571788, 0, 1, 0.6039216, 1,
-0.1213804, 0.04131716, -0.7029306, 0, 1, 0.6117647, 1,
-0.1188803, -1.138779, -3.758278, 0, 1, 0.6156863, 1,
-0.1169079, -1.704606, -2.255311, 0, 1, 0.6235294, 1,
-0.114586, -0.3739979, -2.684301, 0, 1, 0.627451, 1,
-0.1114354, -1.503932, -3.581939, 0, 1, 0.6352941, 1,
-0.1111117, -0.7365459, -2.1871, 0, 1, 0.6392157, 1,
-0.1064802, 0.5186394, -0.5363934, 0, 1, 0.6470588, 1,
-0.1049166, -0.1810786, -2.915165, 0, 1, 0.6509804, 1,
-0.1033425, 0.3982115, 0.007633289, 0, 1, 0.6588235, 1,
-0.09662113, -0.5872384, -1.687675, 0, 1, 0.6627451, 1,
-0.09413666, 1.326354, -0.3498529, 0, 1, 0.6705883, 1,
-0.09213411, -0.2873714, -4.374077, 0, 1, 0.6745098, 1,
-0.09172112, 0.8939384, -0.4856474, 0, 1, 0.682353, 1,
-0.08991088, 1.225748, -0.04172639, 0, 1, 0.6862745, 1,
-0.08721592, 0.05457644, -1.315524, 0, 1, 0.6941177, 1,
-0.08674884, 1.444941, 0.7041154, 0, 1, 0.7019608, 1,
-0.08654872, -0.4417971, -2.380485, 0, 1, 0.7058824, 1,
-0.08442593, -1.187988, -2.358337, 0, 1, 0.7137255, 1,
-0.08027185, -0.1840939, -2.221991, 0, 1, 0.7176471, 1,
-0.07475242, -0.7193234, -0.6718802, 0, 1, 0.7254902, 1,
-0.07184832, -0.734359, -2.06234, 0, 1, 0.7294118, 1,
-0.07026547, 0.3651883, -0.7020129, 0, 1, 0.7372549, 1,
-0.06966864, 0.983593, 0.1349497, 0, 1, 0.7411765, 1,
-0.06264421, 1.862943, 2.16765, 0, 1, 0.7490196, 1,
-0.0607921, 0.473482, 0.7544281, 0, 1, 0.7529412, 1,
-0.06071619, -0.4206872, -4.322067, 0, 1, 0.7607843, 1,
-0.05958299, 1.651534, 1.132609, 0, 1, 0.7647059, 1,
-0.05847271, 0.06564766, -1.166773, 0, 1, 0.772549, 1,
-0.05714245, 1.908817, 0.6596327, 0, 1, 0.7764706, 1,
-0.05573296, 1.058375, 0.0538031, 0, 1, 0.7843137, 1,
-0.05390904, -1.163871, -1.243487, 0, 1, 0.7882353, 1,
-0.05364185, -1.627207, -4.600461, 0, 1, 0.7960784, 1,
-0.05222145, 0.2486287, 0.3152991, 0, 1, 0.8039216, 1,
-0.05002604, -1.667933, -2.775989, 0, 1, 0.8078431, 1,
-0.04611963, 0.09334663, 0.364162, 0, 1, 0.8156863, 1,
-0.04452473, 0.719984, 0.2499493, 0, 1, 0.8196079, 1,
-0.03652473, 0.858371, 0.7222335, 0, 1, 0.827451, 1,
-0.03514268, 0.5901446, -0.1182244, 0, 1, 0.8313726, 1,
-0.03498803, 2.231389, 0.4291191, 0, 1, 0.8392157, 1,
-0.03189323, -0.2084837, -1.627949, 0, 1, 0.8431373, 1,
-0.03164805, 0.1025914, 0.2965906, 0, 1, 0.8509804, 1,
-0.03078154, -0.02596165, -1.54152, 0, 1, 0.854902, 1,
-0.02649494, -1.019159, -2.433932, 0, 1, 0.8627451, 1,
-0.02541115, 1.26459, 1.189096, 0, 1, 0.8666667, 1,
-0.02460674, 0.7793642, -1.068999, 0, 1, 0.8745098, 1,
-0.02271373, 0.3421749, 0.03193671, 0, 1, 0.8784314, 1,
-0.02223763, 1.308901, 0.7172025, 0, 1, 0.8862745, 1,
-0.02130463, -0.968874, -4.054496, 0, 1, 0.8901961, 1,
-0.02126349, -0.4717124, -3.816761, 0, 1, 0.8980392, 1,
-0.01660904, -0.4241331, -1.90543, 0, 1, 0.9058824, 1,
-0.01549019, -0.2855232, -1.703522, 0, 1, 0.9098039, 1,
-0.01138976, 0.1013799, -0.365016, 0, 1, 0.9176471, 1,
-0.01002272, -0.7616153, -3.763389, 0, 1, 0.9215686, 1,
-0.009061235, 0.2508798, 0.6701034, 0, 1, 0.9294118, 1,
-0.004932228, -0.2541084, -2.170171, 0, 1, 0.9333333, 1,
-0.002822526, 0.457054, 1.976715, 0, 1, 0.9411765, 1,
-0.001282863, 1.788688, -0.271227, 0, 1, 0.945098, 1,
0.002491255, 0.668542, -0.2420013, 0, 1, 0.9529412, 1,
0.002640504, -0.2908326, 3.263171, 0, 1, 0.9568627, 1,
0.002935986, -1.014982, 3.412948, 0, 1, 0.9647059, 1,
0.005252049, -0.2900614, 2.234824, 0, 1, 0.9686275, 1,
0.006116794, -0.03192824, 2.969106, 0, 1, 0.9764706, 1,
0.006369893, 0.820591, -0.05032067, 0, 1, 0.9803922, 1,
0.007004527, -0.3245616, 3.41482, 0, 1, 0.9882353, 1,
0.008409812, -1.076504, 2.580321, 0, 1, 0.9921569, 1,
0.01056682, 0.2512366, -0.3722126, 0, 1, 1, 1,
0.01290715, -2.012039, 4.0767, 0, 0.9921569, 1, 1,
0.01875872, -0.1218088, 3.854421, 0, 0.9882353, 1, 1,
0.01922314, -0.2910622, 4.31907, 0, 0.9803922, 1, 1,
0.02075737, 0.7058811, -0.8007188, 0, 0.9764706, 1, 1,
0.02115033, 0.1082845, 0.5309684, 0, 0.9686275, 1, 1,
0.02310656, -1.004308, 4.252361, 0, 0.9647059, 1, 1,
0.02343789, -1.696567, 4.318473, 0, 0.9568627, 1, 1,
0.0237981, -1.032593, 4.732124, 0, 0.9529412, 1, 1,
0.02438567, -1.468465, 4.083752, 0, 0.945098, 1, 1,
0.02484379, 1.245028, -0.5188094, 0, 0.9411765, 1, 1,
0.02490629, -0.5076696, 3.455564, 0, 0.9333333, 1, 1,
0.02509601, -0.03210071, 1.991767, 0, 0.9294118, 1, 1,
0.0299158, 0.2220505, 1.149607, 0, 0.9215686, 1, 1,
0.02994067, -2.288528, 3.767863, 0, 0.9176471, 1, 1,
0.03031688, 0.2601311, 0.8800398, 0, 0.9098039, 1, 1,
0.03844296, 0.4784265, -0.1383568, 0, 0.9058824, 1, 1,
0.03923418, 1.484298, -0.7881857, 0, 0.8980392, 1, 1,
0.04007416, 0.5235665, 0.6292251, 0, 0.8901961, 1, 1,
0.0413085, -1.422928, 3.741335, 0, 0.8862745, 1, 1,
0.04371065, 1.110317, -0.3843606, 0, 0.8784314, 1, 1,
0.05368361, -0.7300287, 4.969037, 0, 0.8745098, 1, 1,
0.05456495, 1.098322, 1.320718, 0, 0.8666667, 1, 1,
0.05472502, 1.788428, -1.714031, 0, 0.8627451, 1, 1,
0.05478591, 1.629467, 1.413569, 0, 0.854902, 1, 1,
0.05838449, 0.4850303, -0.0296561, 0, 0.8509804, 1, 1,
0.06119625, -0.5276456, 3.299403, 0, 0.8431373, 1, 1,
0.06339052, -1.146794, 3.553971, 0, 0.8392157, 1, 1,
0.06557187, 0.7043083, -0.9941387, 0, 0.8313726, 1, 1,
0.06580283, 1.006199, -0.8455051, 0, 0.827451, 1, 1,
0.06715672, 2.104438, -1.136351, 0, 0.8196079, 1, 1,
0.0739366, -0.005420099, 1.272888, 0, 0.8156863, 1, 1,
0.07434081, -1.678002, 3.047074, 0, 0.8078431, 1, 1,
0.07535661, -0.2059568, 1.533776, 0, 0.8039216, 1, 1,
0.07888377, -0.994989, 1.783621, 0, 0.7960784, 1, 1,
0.08002983, 0.0818271, 0.2376532, 0, 0.7882353, 1, 1,
0.08189078, -0.6366003, 4.844683, 0, 0.7843137, 1, 1,
0.0883005, 1.122459, 0.4199699, 0, 0.7764706, 1, 1,
0.08989397, -0.03453968, 3.818657, 0, 0.772549, 1, 1,
0.0903492, -0.1493639, 3.136761, 0, 0.7647059, 1, 1,
0.0927662, 0.1233215, 0.1643482, 0, 0.7607843, 1, 1,
0.09320922, -0.4389969, 1.219081, 0, 0.7529412, 1, 1,
0.09409019, -0.7856407, 4.442549, 0, 0.7490196, 1, 1,
0.09440214, 0.5451242, -0.3821307, 0, 0.7411765, 1, 1,
0.09469846, 1.127063, 1.833726, 0, 0.7372549, 1, 1,
0.1039305, -0.2822849, 3.78, 0, 0.7294118, 1, 1,
0.1079971, -0.5396323, 4.243438, 0, 0.7254902, 1, 1,
0.1082156, -1.597436, 3.172287, 0, 0.7176471, 1, 1,
0.1108728, 0.08368856, 0.2733169, 0, 0.7137255, 1, 1,
0.1136045, -0.7618582, 3.611399, 0, 0.7058824, 1, 1,
0.1143195, -0.9127917, 1.586567, 0, 0.6980392, 1, 1,
0.1181273, 0.09638356, 1.326571, 0, 0.6941177, 1, 1,
0.1190322, 0.4033506, 0.5148197, 0, 0.6862745, 1, 1,
0.1210059, 0.4477766, 1.33895, 0, 0.682353, 1, 1,
0.1218626, -0.2671154, 3.316665, 0, 0.6745098, 1, 1,
0.1241308, -0.5036783, 4.650164, 0, 0.6705883, 1, 1,
0.125739, 2.422767, 0.8676827, 0, 0.6627451, 1, 1,
0.1282579, -1.068926, 3.157862, 0, 0.6588235, 1, 1,
0.1313763, 0.1854047, 2.883235, 0, 0.6509804, 1, 1,
0.1318194, -1.161494, 3.446478, 0, 0.6470588, 1, 1,
0.1335422, 0.07693354, 1.547321, 0, 0.6392157, 1, 1,
0.1385041, 0.4403174, 1.747059, 0, 0.6352941, 1, 1,
0.1426301, 1.715896, 1.165012, 0, 0.627451, 1, 1,
0.1428845, 0.4434227, 0.8389862, 0, 0.6235294, 1, 1,
0.1449963, -0.7965862, 2.290119, 0, 0.6156863, 1, 1,
0.1496605, 2.261321, 1.345639, 0, 0.6117647, 1, 1,
0.1515205, -1.905975, 4.449092, 0, 0.6039216, 1, 1,
0.1559868, -0.2725734, 0.7379113, 0, 0.5960785, 1, 1,
0.1584914, 2.049872, -1.095042, 0, 0.5921569, 1, 1,
0.1603002, 1.562165, 0.5773124, 0, 0.5843138, 1, 1,
0.1624753, 0.3493348, -2.194657, 0, 0.5803922, 1, 1,
0.1625142, 0.6145154, -0.5707394, 0, 0.572549, 1, 1,
0.1640139, -1.169694, 2.170909, 0, 0.5686275, 1, 1,
0.1644877, -1.005282, 2.904793, 0, 0.5607843, 1, 1,
0.165679, -0.3688832, 3.657936, 0, 0.5568628, 1, 1,
0.1743466, 1.168807, -1.125234, 0, 0.5490196, 1, 1,
0.1850637, -0.9468048, 2.043337, 0, 0.5450981, 1, 1,
0.1854068, -0.1888864, 4.979433, 0, 0.5372549, 1, 1,
0.1877051, -0.01882993, 0.5085006, 0, 0.5333334, 1, 1,
0.187878, -0.5661232, 2.801015, 0, 0.5254902, 1, 1,
0.1894373, 0.6125658, 0.3371568, 0, 0.5215687, 1, 1,
0.1901027, -0.2301536, 3.375939, 0, 0.5137255, 1, 1,
0.1905801, 1.417669, -0.2653713, 0, 0.509804, 1, 1,
0.1917238, -0.9204603, 5.249947, 0, 0.5019608, 1, 1,
0.1939793, 1.458198, 0.3667341, 0, 0.4941176, 1, 1,
0.196509, -0.7514689, 2.536102, 0, 0.4901961, 1, 1,
0.1978629, 1.498509, 0.2526356, 0, 0.4823529, 1, 1,
0.1982478, -0.9812428, 0.7804434, 0, 0.4784314, 1, 1,
0.1987282, -1.518126, 3.104815, 0, 0.4705882, 1, 1,
0.2006321, -1.756986, 2.208734, 0, 0.4666667, 1, 1,
0.2013146, 0.2491991, 1.864051, 0, 0.4588235, 1, 1,
0.201725, -0.113077, 2.825877, 0, 0.454902, 1, 1,
0.2048173, -0.378853, 4.106703, 0, 0.4470588, 1, 1,
0.205087, -0.6908244, 1.896494, 0, 0.4431373, 1, 1,
0.2069043, -0.2315131, 2.501808, 0, 0.4352941, 1, 1,
0.2084817, -0.7395502, 1.310068, 0, 0.4313726, 1, 1,
0.2099499, -0.4101206, 3.49859, 0, 0.4235294, 1, 1,
0.2168969, 0.4329345, 0.812364, 0, 0.4196078, 1, 1,
0.2192178, -1.734534, 1.826671, 0, 0.4117647, 1, 1,
0.2200303, -0.1394374, 2.714448, 0, 0.4078431, 1, 1,
0.2241456, -0.0164208, 1.982302, 0, 0.4, 1, 1,
0.2283039, 0.252618, -0.05742631, 0, 0.3921569, 1, 1,
0.2303133, -1.883808, 2.483747, 0, 0.3882353, 1, 1,
0.2333671, -0.1188634, 2.658358, 0, 0.3803922, 1, 1,
0.2335358, 1.899788, 0.04790134, 0, 0.3764706, 1, 1,
0.2339284, 0.1350328, 0.4891928, 0, 0.3686275, 1, 1,
0.2389624, -0.6865848, 3.357072, 0, 0.3647059, 1, 1,
0.2412983, -0.4727262, 2.4703, 0, 0.3568628, 1, 1,
0.2433271, 0.4731089, -1.490348, 0, 0.3529412, 1, 1,
0.2499333, 0.4123468, 0.6071995, 0, 0.345098, 1, 1,
0.2599313, 1.38039, -0.4267028, 0, 0.3411765, 1, 1,
0.2631119, -1.161928, 4.774816, 0, 0.3333333, 1, 1,
0.2661784, 2.069062, 0.1902115, 0, 0.3294118, 1, 1,
0.2669911, -0.5786675, 2.677276, 0, 0.3215686, 1, 1,
0.2682183, -1.055698, 3.16671, 0, 0.3176471, 1, 1,
0.2705619, 1.553925, -1.447868, 0, 0.3098039, 1, 1,
0.2719402, 0.7494622, -0.039375, 0, 0.3058824, 1, 1,
0.2735363, -0.3928841, 3.601972, 0, 0.2980392, 1, 1,
0.2784259, 0.3009718, -0.6327174, 0, 0.2901961, 1, 1,
0.2790148, -0.3451486, 1.281478, 0, 0.2862745, 1, 1,
0.2797234, 1.255718, 0.6259931, 0, 0.2784314, 1, 1,
0.2817668, -0.007683629, 0.8999251, 0, 0.2745098, 1, 1,
0.2838446, 0.3180801, 1.553272, 0, 0.2666667, 1, 1,
0.2866865, -1.052273, 3.047432, 0, 0.2627451, 1, 1,
0.2880048, -0.3897862, 2.667256, 0, 0.254902, 1, 1,
0.2882634, 0.4432921, 1.168637, 0, 0.2509804, 1, 1,
0.2900941, 0.8705915, 0.4351187, 0, 0.2431373, 1, 1,
0.2939066, 1.371381, -0.1682932, 0, 0.2392157, 1, 1,
0.3012488, 1.593717, -0.590562, 0, 0.2313726, 1, 1,
0.3080463, 0.8130984, 0.9173375, 0, 0.227451, 1, 1,
0.3088797, 0.3544579, 1.999381, 0, 0.2196078, 1, 1,
0.3144902, 0.8796206, -0.02969159, 0, 0.2156863, 1, 1,
0.3161204, 2.245177, 2.204344, 0, 0.2078431, 1, 1,
0.3224521, 0.7493782, 0.5896518, 0, 0.2039216, 1, 1,
0.3294163, -1.391613, 2.981729, 0, 0.1960784, 1, 1,
0.3326687, -0.5560789, 2.560326, 0, 0.1882353, 1, 1,
0.3329878, 0.2957374, 0.9004331, 0, 0.1843137, 1, 1,
0.3335253, 2.282752, -1.629034, 0, 0.1764706, 1, 1,
0.3373313, 0.1460621, 3.335236, 0, 0.172549, 1, 1,
0.3461941, 1.026937, 1.280617, 0, 0.1647059, 1, 1,
0.3463493, 0.8449667, 0.6079021, 0, 0.1607843, 1, 1,
0.3472552, 0.5317829, 0.2987097, 0, 0.1529412, 1, 1,
0.3486814, -1.391495, 3.873304, 0, 0.1490196, 1, 1,
0.3541708, 0.2874032, -0.6922359, 0, 0.1411765, 1, 1,
0.3586239, -1.157313, 2.975141, 0, 0.1372549, 1, 1,
0.3597669, -0.7346703, 2.354857, 0, 0.1294118, 1, 1,
0.360812, -0.961594, 3.338273, 0, 0.1254902, 1, 1,
0.3619361, -1.702752, 2.427158, 0, 0.1176471, 1, 1,
0.3629848, -0.7339381, 1.346164, 0, 0.1137255, 1, 1,
0.3634909, 0.2750989, 1.524457, 0, 0.1058824, 1, 1,
0.3659336, 0.08374155, 1.546278, 0, 0.09803922, 1, 1,
0.3682937, -0.4205942, 3.056373, 0, 0.09411765, 1, 1,
0.3715968, 0.4045403, 0.06597074, 0, 0.08627451, 1, 1,
0.3719692, 0.1657417, 2.085887, 0, 0.08235294, 1, 1,
0.3815625, -2.18522, 2.63976, 0, 0.07450981, 1, 1,
0.3839585, 0.3725902, 0.7063039, 0, 0.07058824, 1, 1,
0.3865808, 0.4536234, 0.7129328, 0, 0.0627451, 1, 1,
0.3916425, 0.2772549, 0.09596029, 0, 0.05882353, 1, 1,
0.3984067, -1.833393, 3.664671, 0, 0.05098039, 1, 1,
0.405317, 0.4557002, 0.5162829, 0, 0.04705882, 1, 1,
0.4065481, 0.4246688, 2.528417, 0, 0.03921569, 1, 1,
0.4205284, -0.5481014, 4.242554, 0, 0.03529412, 1, 1,
0.4221733, -0.8632292, 4.384126, 0, 0.02745098, 1, 1,
0.4223491, 0.7231406, 0.3403327, 0, 0.02352941, 1, 1,
0.4224063, -0.08150754, 3.737906, 0, 0.01568628, 1, 1,
0.4239697, -0.8364605, 2.754983, 0, 0.01176471, 1, 1,
0.4293131, 1.633815, 1.440297, 0, 0.003921569, 1, 1,
0.4318619, 0.1774091, 0.644971, 0.003921569, 0, 1, 1,
0.4330822, 1.001043, 0.88221, 0.007843138, 0, 1, 1,
0.4380298, -0.2521313, 2.692189, 0.01568628, 0, 1, 1,
0.4440555, -0.409609, 0.2758029, 0.01960784, 0, 1, 1,
0.4441369, 0.9220615, -0.1708204, 0.02745098, 0, 1, 1,
0.4459292, 1.314386, -0.4796949, 0.03137255, 0, 1, 1,
0.4479246, -0.04034345, 2.048707, 0.03921569, 0, 1, 1,
0.4492181, -0.8401405, 2.997773, 0.04313726, 0, 1, 1,
0.4497133, 0.8510791, 0.07609261, 0.05098039, 0, 1, 1,
0.4554696, -0.6201317, 5.119395, 0.05490196, 0, 1, 1,
0.4645437, 0.8529228, 0.4086934, 0.0627451, 0, 1, 1,
0.4662455, 0.283022, 1.259276, 0.06666667, 0, 1, 1,
0.4715628, 0.5257201, 0.06945687, 0.07450981, 0, 1, 1,
0.4750999, -1.810392, 1.726355, 0.07843138, 0, 1, 1,
0.4789661, -0.04194406, 3.532036, 0.08627451, 0, 1, 1,
0.4841975, 1.438967, -0.06921777, 0.09019608, 0, 1, 1,
0.4842556, 1.280863, 2.104204, 0.09803922, 0, 1, 1,
0.4847507, 1.202154, 1.797697, 0.1058824, 0, 1, 1,
0.4869785, 0.7695713, -0.06703264, 0.1098039, 0, 1, 1,
0.4908963, 1.299002, -1.51972, 0.1176471, 0, 1, 1,
0.4916459, 0.3881919, 1.5352, 0.1215686, 0, 1, 1,
0.4937247, -0.9762533, 2.353667, 0.1294118, 0, 1, 1,
0.4959455, -0.9668013, 2.009862, 0.1333333, 0, 1, 1,
0.4967499, 0.284941, 1.781956, 0.1411765, 0, 1, 1,
0.4972243, -0.4253234, 2.995882, 0.145098, 0, 1, 1,
0.497315, 1.082834, 0.0144413, 0.1529412, 0, 1, 1,
0.5023069, -1.291008, 3.161083, 0.1568628, 0, 1, 1,
0.5074495, 0.816528, 2.42366, 0.1647059, 0, 1, 1,
0.510509, 1.448251, 0.3344987, 0.1686275, 0, 1, 1,
0.5132655, -1.06747, 2.552605, 0.1764706, 0, 1, 1,
0.5167391, 0.4735124, 0.03064034, 0.1803922, 0, 1, 1,
0.5207151, -0.1610168, 1.262699, 0.1882353, 0, 1, 1,
0.5219842, -0.4099507, 2.251694, 0.1921569, 0, 1, 1,
0.522517, -1.25463, 1.82184, 0.2, 0, 1, 1,
0.5287799, 0.4139195, -0.3295231, 0.2078431, 0, 1, 1,
0.5340819, 0.3113976, 1.969988, 0.2117647, 0, 1, 1,
0.5341776, 0.5195221, 0.2498108, 0.2196078, 0, 1, 1,
0.5351632, -1.435722, 5.055426, 0.2235294, 0, 1, 1,
0.5405003, 0.8243796, -1.246957, 0.2313726, 0, 1, 1,
0.5409127, -0.5840718, 3.33991, 0.2352941, 0, 1, 1,
0.5412309, -0.2845549, 3.876987, 0.2431373, 0, 1, 1,
0.5423049, 0.2202244, 0.1161548, 0.2470588, 0, 1, 1,
0.542347, -0.2535947, 2.500404, 0.254902, 0, 1, 1,
0.5434591, -0.4751891, 2.018806, 0.2588235, 0, 1, 1,
0.5436826, -0.5017744, 2.335687, 0.2666667, 0, 1, 1,
0.5440938, 0.1225595, 2.427328, 0.2705882, 0, 1, 1,
0.548628, 0.07107446, 1.144482, 0.2784314, 0, 1, 1,
0.5508119, 0.09439635, 1.177961, 0.282353, 0, 1, 1,
0.5541972, -1.385973, 1.628008, 0.2901961, 0, 1, 1,
0.5565253, 1.321828, 0.995109, 0.2941177, 0, 1, 1,
0.5589512, -0.9601333, 3.184482, 0.3019608, 0, 1, 1,
0.5632342, -0.06779499, 2.122992, 0.3098039, 0, 1, 1,
0.5668039, 0.6541259, -0.8137093, 0.3137255, 0, 1, 1,
0.5694085, -1.056931, 2.793143, 0.3215686, 0, 1, 1,
0.5722153, -0.6907822, 3.80405, 0.3254902, 0, 1, 1,
0.5760592, 2.912926, -1.800581, 0.3333333, 0, 1, 1,
0.5780988, 2.115423, 2.319939, 0.3372549, 0, 1, 1,
0.5810378, -0.7602002, 4.374256, 0.345098, 0, 1, 1,
0.5816768, 1.18804, -0.6615367, 0.3490196, 0, 1, 1,
0.5821174, -0.7312258, 4.380295, 0.3568628, 0, 1, 1,
0.5836396, 0.1424953, 1.412554, 0.3607843, 0, 1, 1,
0.5838346, -1.319389, 3.378644, 0.3686275, 0, 1, 1,
0.5961745, 0.1417346, 2.256407, 0.372549, 0, 1, 1,
0.597708, -0.1808786, 1.750365, 0.3803922, 0, 1, 1,
0.601365, -1.377001, 4.979832, 0.3843137, 0, 1, 1,
0.606755, -0.4982846, 2.242278, 0.3921569, 0, 1, 1,
0.6081635, -1.701605, 2.630252, 0.3960784, 0, 1, 1,
0.6083617, -0.8858227, 1.809543, 0.4039216, 0, 1, 1,
0.618078, -0.1334616, 0.9640808, 0.4117647, 0, 1, 1,
0.6187264, -2.035115, 3.782431, 0.4156863, 0, 1, 1,
0.6206473, -0.8716753, 2.068019, 0.4235294, 0, 1, 1,
0.6241362, -0.4794206, 2.495823, 0.427451, 0, 1, 1,
0.6246752, 0.8409365, 2.42054, 0.4352941, 0, 1, 1,
0.6297845, -0.6893109, 2.203722, 0.4392157, 0, 1, 1,
0.6339452, -0.09220275, 2.770129, 0.4470588, 0, 1, 1,
0.6384555, 1.21219, 1.163326, 0.4509804, 0, 1, 1,
0.6454632, -0.6432725, 2.971318, 0.4588235, 0, 1, 1,
0.6470919, -0.443653, 3.259506, 0.4627451, 0, 1, 1,
0.6559481, -1.059476, 3.721713, 0.4705882, 0, 1, 1,
0.6571617, 2.123921, 1.786969, 0.4745098, 0, 1, 1,
0.6578732, -1.877725, 4.181771, 0.4823529, 0, 1, 1,
0.6606088, 1.650253, -0.6312291, 0.4862745, 0, 1, 1,
0.6615064, 1.327145, 0.7799816, 0.4941176, 0, 1, 1,
0.6616892, 0.7573704, 0.3654423, 0.5019608, 0, 1, 1,
0.6628063, -1.075981, 2.220757, 0.5058824, 0, 1, 1,
0.6639223, 0.8446635, 0.06278962, 0.5137255, 0, 1, 1,
0.6650769, 0.2911942, 1.507586, 0.5176471, 0, 1, 1,
0.6662588, -0.04656931, -0.1672485, 0.5254902, 0, 1, 1,
0.6709411, -1.013086, 3.320339, 0.5294118, 0, 1, 1,
0.6797594, 0.3290356, 1.748327, 0.5372549, 0, 1, 1,
0.6845051, 1.080565, -0.4578758, 0.5411765, 0, 1, 1,
0.6863933, 0.5886562, 0.9729538, 0.5490196, 0, 1, 1,
0.6873996, 0.3638438, 1.606933, 0.5529412, 0, 1, 1,
0.6875058, -1.088306, 2.104845, 0.5607843, 0, 1, 1,
0.6959509, 0.5680886, -0.3680315, 0.5647059, 0, 1, 1,
0.6960052, -0.07176115, 1.002374, 0.572549, 0, 1, 1,
0.6963445, 1.139228, 1.728407, 0.5764706, 0, 1, 1,
0.6971765, -0.8624045, 1.619828, 0.5843138, 0, 1, 1,
0.6972178, -0.3835633, 0.4447696, 0.5882353, 0, 1, 1,
0.6995465, 0.6529405, 1.843982, 0.5960785, 0, 1, 1,
0.6996126, -0.4387288, 1.576119, 0.6039216, 0, 1, 1,
0.7002747, 0.325235, 2.196598, 0.6078432, 0, 1, 1,
0.7057626, 0.4239824, 0.9703884, 0.6156863, 0, 1, 1,
0.7077705, -0.3897769, 2.130333, 0.6196079, 0, 1, 1,
0.7081859, 0.875288, -0.327283, 0.627451, 0, 1, 1,
0.7133803, 1.614644, -1.273393, 0.6313726, 0, 1, 1,
0.7167215, -0.4783603, -1.046845, 0.6392157, 0, 1, 1,
0.7283782, -0.7242332, 0.8082221, 0.6431373, 0, 1, 1,
0.7304731, 1.635506, -0.006769598, 0.6509804, 0, 1, 1,
0.7407745, 0.7635942, 0.4313521, 0.654902, 0, 1, 1,
0.7444665, 0.3159937, 0.483729, 0.6627451, 0, 1, 1,
0.745272, 0.9538921, 1.352395, 0.6666667, 0, 1, 1,
0.7541674, -1.100143, 2.72242, 0.6745098, 0, 1, 1,
0.7582312, 2.025665, 1.193458, 0.6784314, 0, 1, 1,
0.7589239, -0.1128851, 2.185631, 0.6862745, 0, 1, 1,
0.7621816, -1.214556, 3.721189, 0.6901961, 0, 1, 1,
0.7623619, 0.2862966, 2.143654, 0.6980392, 0, 1, 1,
0.7623701, 1.895268, 0.2186154, 0.7058824, 0, 1, 1,
0.7704129, -2.330978, 5.436145, 0.7098039, 0, 1, 1,
0.7718264, 0.7985973, 0.5750175, 0.7176471, 0, 1, 1,
0.7721572, 0.04435191, 1.170427, 0.7215686, 0, 1, 1,
0.7728568, -0.8153729, 0.8642328, 0.7294118, 0, 1, 1,
0.7766176, -0.1301173, 2.493395, 0.7333333, 0, 1, 1,
0.7768052, -1.429291, 3.567549, 0.7411765, 0, 1, 1,
0.7792593, 0.5081099, 0.4950593, 0.7450981, 0, 1, 1,
0.783002, -0.9549944, 1.963839, 0.7529412, 0, 1, 1,
0.7840008, -0.4223762, 2.830398, 0.7568628, 0, 1, 1,
0.7886841, -1.439301, 1.53898, 0.7647059, 0, 1, 1,
0.7927868, -0.4353712, 3.069904, 0.7686275, 0, 1, 1,
0.7947173, -0.4958172, 2.043179, 0.7764706, 0, 1, 1,
0.7952137, -1.626265, 3.385, 0.7803922, 0, 1, 1,
0.7986487, -0.9893069, 1.447636, 0.7882353, 0, 1, 1,
0.8031539, -0.2308714, 2.115545, 0.7921569, 0, 1, 1,
0.8038914, -0.07890476, 3.567505, 0.8, 0, 1, 1,
0.804931, 0.08611206, 2.948371, 0.8078431, 0, 1, 1,
0.8072867, 0.897147, 2.601956, 0.8117647, 0, 1, 1,
0.8122624, -0.05401633, -0.3390054, 0.8196079, 0, 1, 1,
0.8167193, -1.465398, 2.479679, 0.8235294, 0, 1, 1,
0.819051, -1.361513, 3.81601, 0.8313726, 0, 1, 1,
0.8217525, -0.06173279, 0.8105763, 0.8352941, 0, 1, 1,
0.8243902, -0.9840641, 2.987234, 0.8431373, 0, 1, 1,
0.8274525, 0.6969023, 1.8305, 0.8470588, 0, 1, 1,
0.8302825, -0.7400258, 3.24244, 0.854902, 0, 1, 1,
0.8320203, 0.3323767, 1.496626, 0.8588235, 0, 1, 1,
0.8336838, 0.3648777, 3.014099, 0.8666667, 0, 1, 1,
0.8368341, -0.3059861, 2.103889, 0.8705882, 0, 1, 1,
0.8398005, -0.9310839, 2.177907, 0.8784314, 0, 1, 1,
0.842539, -0.8488173, 3.609347, 0.8823529, 0, 1, 1,
0.8448783, -0.8995956, 0.3406683, 0.8901961, 0, 1, 1,
0.8636432, -0.8580681, 2.167358, 0.8941177, 0, 1, 1,
0.8670591, -0.8340259, 0.9342428, 0.9019608, 0, 1, 1,
0.8696039, 0.5182241, -0.200733, 0.9098039, 0, 1, 1,
0.8746193, 1.193771, 0.2598773, 0.9137255, 0, 1, 1,
0.8749958, 1.000733, -0.8149531, 0.9215686, 0, 1, 1,
0.8769657, 0.2176803, 0.4087196, 0.9254902, 0, 1, 1,
0.8835047, 0.3451298, 2.60143, 0.9333333, 0, 1, 1,
0.8842795, 0.1174333, 1.226973, 0.9372549, 0, 1, 1,
0.8909302, 0.839239, -0.2489766, 0.945098, 0, 1, 1,
0.8995092, -1.077565, 2.22116, 0.9490196, 0, 1, 1,
0.9018795, -0.4288595, 1.628848, 0.9568627, 0, 1, 1,
0.9057341, 0.3412306, 2.508383, 0.9607843, 0, 1, 1,
0.9077759, -1.494515, 1.864231, 0.9686275, 0, 1, 1,
0.9112598, 1.602644, -1.293603, 0.972549, 0, 1, 1,
0.9120586, -1.898748, 1.903872, 0.9803922, 0, 1, 1,
0.912574, -1.193084, 2.518477, 0.9843137, 0, 1, 1,
0.9127037, 0.7671453, 1.136832, 0.9921569, 0, 1, 1,
0.9191471, -0.09637422, 0.7146118, 0.9960784, 0, 1, 1,
0.9256614, 2.181769, -0.01859499, 1, 0, 0.9960784, 1,
0.9262134, -0.1993946, 1.347799, 1, 0, 0.9882353, 1,
0.9269454, -0.3732758, 1.533922, 1, 0, 0.9843137, 1,
0.9356063, -1.534565, 3.048755, 1, 0, 0.9764706, 1,
0.9438804, 1.417912, 1.042966, 1, 0, 0.972549, 1,
0.9493491, -0.3886499, 0.7769821, 1, 0, 0.9647059, 1,
0.9502402, 0.1386093, 1.324476, 1, 0, 0.9607843, 1,
0.9512661, 1.727883, 0.2937678, 1, 0, 0.9529412, 1,
0.9558511, 0.9566541, -0.07584974, 1, 0, 0.9490196, 1,
0.9664057, -0.9218935, 2.976585, 1, 0, 0.9411765, 1,
0.9679328, -0.7056645, 2.465994, 1, 0, 0.9372549, 1,
0.9694681, -0.3848197, 1.867978, 1, 0, 0.9294118, 1,
0.9776947, 0.3133108, 2.27225, 1, 0, 0.9254902, 1,
0.9955406, 1.822622, -0.1638207, 1, 0, 0.9176471, 1,
0.9983453, -1.060345, 1.745057, 1, 0, 0.9137255, 1,
1.000453, 0.1252773, 0.9926157, 1, 0, 0.9058824, 1,
1.002796, 1.164474, 1.727195, 1, 0, 0.9019608, 1,
1.013939, 0.1442394, 3.235639, 1, 0, 0.8941177, 1,
1.019781, -0.6269596, 0.198871, 1, 0, 0.8862745, 1,
1.021065, -1.689444, 3.562442, 1, 0, 0.8823529, 1,
1.021698, -0.003982603, 2.188514, 1, 0, 0.8745098, 1,
1.029529, 0.577217, 0.1210997, 1, 0, 0.8705882, 1,
1.036137, 0.0359572, 3.855129, 1, 0, 0.8627451, 1,
1.043357, -0.101522, 2.774826, 1, 0, 0.8588235, 1,
1.044872, 1.552457, -0.6044851, 1, 0, 0.8509804, 1,
1.044902, 0.2374866, 1.033187, 1, 0, 0.8470588, 1,
1.046985, -0.2073198, 0.193563, 1, 0, 0.8392157, 1,
1.054106, -0.7539774, 1.984203, 1, 0, 0.8352941, 1,
1.054214, 0.4765797, 2.600295, 1, 0, 0.827451, 1,
1.062672, -0.02774616, 1.86654, 1, 0, 0.8235294, 1,
1.068606, 0.9148977, 2.635358, 1, 0, 0.8156863, 1,
1.068664, -0.3522327, 1.297398, 1, 0, 0.8117647, 1,
1.068829, -1.013427, 1.499374, 1, 0, 0.8039216, 1,
1.069285, -1.838043, 3.19759, 1, 0, 0.7960784, 1,
1.070648, 0.4717794, -0.1921927, 1, 0, 0.7921569, 1,
1.078828, 0.9374134, 1.62485, 1, 0, 0.7843137, 1,
1.082661, -0.2288772, 0.7805259, 1, 0, 0.7803922, 1,
1.084704, -0.6289129, 2.73144, 1, 0, 0.772549, 1,
1.096043, 2.126214, 0.8428997, 1, 0, 0.7686275, 1,
1.102289, 0.3378843, 2.564857, 1, 0, 0.7607843, 1,
1.106978, -0.1263932, 1.355341, 1, 0, 0.7568628, 1,
1.110272, 0.9159781, -1.960484, 1, 0, 0.7490196, 1,
1.113534, -0.6956383, 2.473592, 1, 0, 0.7450981, 1,
1.115256, 0.7856613, 0.2202473, 1, 0, 0.7372549, 1,
1.131882, 0.3191327, 1.20484, 1, 0, 0.7333333, 1,
1.13749, 0.09358122, 1.374709, 1, 0, 0.7254902, 1,
1.139908, 0.5205035, 1.273938, 1, 0, 0.7215686, 1,
1.144414, 1.363987, 0.3830503, 1, 0, 0.7137255, 1,
1.14506, 0.06819415, 1.298824, 1, 0, 0.7098039, 1,
1.146444, 0.5909895, 1.989039, 1, 0, 0.7019608, 1,
1.154897, -0.8906602, 3.22971, 1, 0, 0.6941177, 1,
1.15679, -1.112175, 3.920587, 1, 0, 0.6901961, 1,
1.164892, 0.7428071, 0.09446523, 1, 0, 0.682353, 1,
1.166756, 0.6651387, 0.9758456, 1, 0, 0.6784314, 1,
1.173946, -1.056482, 1.177191, 1, 0, 0.6705883, 1,
1.186165, -0.967909, 2.774382, 1, 0, 0.6666667, 1,
1.189308, 2.111558, 0.724447, 1, 0, 0.6588235, 1,
1.191113, 0.4231385, 1.493046, 1, 0, 0.654902, 1,
1.21282, 0.9557741, 2.577285, 1, 0, 0.6470588, 1,
1.217877, -2.240525, 3.665798, 1, 0, 0.6431373, 1,
1.225672, -0.2793261, 1.87509, 1, 0, 0.6352941, 1,
1.234612, 0.1397804, 2.01393, 1, 0, 0.6313726, 1,
1.238937, -0.905275, -0.2505805, 1, 0, 0.6235294, 1,
1.242342, -1.081555, 2.231321, 1, 0, 0.6196079, 1,
1.245461, 1.452947, -0.1309696, 1, 0, 0.6117647, 1,
1.2477, -0.1836113, 1.847244, 1, 0, 0.6078432, 1,
1.252019, -0.463801, 0.7023997, 1, 0, 0.6, 1,
1.254431, -0.8646602, 2.19096, 1, 0, 0.5921569, 1,
1.261437, 2.018197, 0.522686, 1, 0, 0.5882353, 1,
1.26246, 1.187064, -0.152694, 1, 0, 0.5803922, 1,
1.266695, -0.2696941, 2.364526, 1, 0, 0.5764706, 1,
1.272291, -0.4326216, 1.385991, 1, 0, 0.5686275, 1,
1.279208, 1.965283, 2.34837, 1, 0, 0.5647059, 1,
1.290629, -2.314374, 4.123836, 1, 0, 0.5568628, 1,
1.300341, -0.7097886, 1.544665, 1, 0, 0.5529412, 1,
1.301995, 0.3408529, 1.051455, 1, 0, 0.5450981, 1,
1.307844, -1.954516, 3.606742, 1, 0, 0.5411765, 1,
1.309623, 0.0009435599, 0.8185892, 1, 0, 0.5333334, 1,
1.311726, -0.9408272, 1.292321, 1, 0, 0.5294118, 1,
1.329991, -0.8054662, 3.160461, 1, 0, 0.5215687, 1,
1.341457, -1.314134, 1.363103, 1, 0, 0.5176471, 1,
1.343915, -0.351818, -1.092592, 1, 0, 0.509804, 1,
1.359427, 0.9340714, 0.01917323, 1, 0, 0.5058824, 1,
1.382347, 0.6474497, 2.125942, 1, 0, 0.4980392, 1,
1.386457, -2.355242, 2.26639, 1, 0, 0.4901961, 1,
1.38914, -0.4937943, 1.931346, 1, 0, 0.4862745, 1,
1.397463, 0.6744085, 2.24898, 1, 0, 0.4784314, 1,
1.412056, -1.164734, 1.531737, 1, 0, 0.4745098, 1,
1.415073, 0.1725698, -0.2714731, 1, 0, 0.4666667, 1,
1.415089, -0.06258121, 1.28585, 1, 0, 0.4627451, 1,
1.420466, -0.4590575, 1.635686, 1, 0, 0.454902, 1,
1.424363, 0.587518, 2.071334, 1, 0, 0.4509804, 1,
1.467339, -1.225516, 2.297869, 1, 0, 0.4431373, 1,
1.47238, 1.940992, 1.173739, 1, 0, 0.4392157, 1,
1.477296, 0.5602411, 1.007455, 1, 0, 0.4313726, 1,
1.48915, -0.9288446, 1.701507, 1, 0, 0.427451, 1,
1.491402, 1.043544, 1.401108, 1, 0, 0.4196078, 1,
1.494409, 0.6011717, 1.34097, 1, 0, 0.4156863, 1,
1.49982, -2.089574, 2.486259, 1, 0, 0.4078431, 1,
1.50073, 0.7351874, -0.8209513, 1, 0, 0.4039216, 1,
1.513063, -0.9441912, 2.492087, 1, 0, 0.3960784, 1,
1.527341, 0.7247979, -0.3425946, 1, 0, 0.3882353, 1,
1.529229, -1.552865, 1.776549, 1, 0, 0.3843137, 1,
1.538618, 0.7117836, 0.1870705, 1, 0, 0.3764706, 1,
1.543504, -1.669377, 2.681084, 1, 0, 0.372549, 1,
1.549427, -0.05140093, 2.486443, 1, 0, 0.3647059, 1,
1.580914, 0.04805192, 0.6594902, 1, 0, 0.3607843, 1,
1.584057, 0.6583297, -0.01832163, 1, 0, 0.3529412, 1,
1.588031, -0.7809211, 1.554358, 1, 0, 0.3490196, 1,
1.59155, 0.7111248, 1.054445, 1, 0, 0.3411765, 1,
1.594647, -0.3588216, 1.149336, 1, 0, 0.3372549, 1,
1.595696, 0.061963, 0.2611398, 1, 0, 0.3294118, 1,
1.616686, 0.6772586, 1.664209, 1, 0, 0.3254902, 1,
1.649546, 0.05458362, 1.970272, 1, 0, 0.3176471, 1,
1.671606, 0.2572421, 1.886724, 1, 0, 0.3137255, 1,
1.681616, 0.4574318, 1.385324, 1, 0, 0.3058824, 1,
1.687505, 0.0007029284, 1.498888, 1, 0, 0.2980392, 1,
1.692281, -0.313825, 1.961585, 1, 0, 0.2941177, 1,
1.701277, -1.238032, 2.916969, 1, 0, 0.2862745, 1,
1.738263, -1.112058, 1.809672, 1, 0, 0.282353, 1,
1.74762, 0.5071289, 2.007173, 1, 0, 0.2745098, 1,
1.747849, -0.0433148, 2.078016, 1, 0, 0.2705882, 1,
1.751127, -0.399353, 2.079507, 1, 0, 0.2627451, 1,
1.765436, 0.724349, 2.581657, 1, 0, 0.2588235, 1,
1.771656, 0.2313801, -0.9594651, 1, 0, 0.2509804, 1,
1.77283, -0.6677207, 1.06656, 1, 0, 0.2470588, 1,
1.794828, 1.12415, 1.646801, 1, 0, 0.2392157, 1,
1.796792, 0.948801, 0.7376893, 1, 0, 0.2352941, 1,
1.798528, 0.1122448, 1.938119, 1, 0, 0.227451, 1,
1.801127, 0.8285643, 2.266163, 1, 0, 0.2235294, 1,
1.804467, -0.02336695, 1.333092, 1, 0, 0.2156863, 1,
1.820521, -0.1724087, 0.6825145, 1, 0, 0.2117647, 1,
1.823877, 0.3626981, -0.7500666, 1, 0, 0.2039216, 1,
1.829508, -0.8638601, 3.597836, 1, 0, 0.1960784, 1,
1.844759, 0.6904488, 0.622999, 1, 0, 0.1921569, 1,
1.850244, 0.6342934, 3.306834, 1, 0, 0.1843137, 1,
1.895786, -0.5304791, 2.060498, 1, 0, 0.1803922, 1,
1.907509, 2.296999, -0.2094717, 1, 0, 0.172549, 1,
1.911799, 0.09712302, 0.6219431, 1, 0, 0.1686275, 1,
1.916614, -0.4154176, 2.584453, 1, 0, 0.1607843, 1,
1.959952, -0.2625063, 2.31842, 1, 0, 0.1568628, 1,
1.960823, -0.08701922, 2.173146, 1, 0, 0.1490196, 1,
1.9675, 0.6355343, 2.802617, 1, 0, 0.145098, 1,
1.967967, -1.578742, 1.287636, 1, 0, 0.1372549, 1,
2.036395, 0.7332677, 0.2916207, 1, 0, 0.1333333, 1,
2.041863, -0.6546463, 1.808841, 1, 0, 0.1254902, 1,
2.041993, -0.482601, 0.9195745, 1, 0, 0.1215686, 1,
2.069792, 0.4877135, 0.8885563, 1, 0, 0.1137255, 1,
2.247602, -0.4614147, 1.4047, 1, 0, 0.1098039, 1,
2.250105, 0.2271588, 0.3660267, 1, 0, 0.1019608, 1,
2.276403, -1.44981, 2.924938, 1, 0, 0.09411765, 1,
2.488588, -1.678539, 2.720214, 1, 0, 0.09019608, 1,
2.499702, -0.2715572, 2.764897, 1, 0, 0.08235294, 1,
2.500778, 0.6938574, 2.637668, 1, 0, 0.07843138, 1,
2.649564, 1.602282, 0.4842279, 1, 0, 0.07058824, 1,
2.66595, -0.02472184, 1.969959, 1, 0, 0.06666667, 1,
2.741728, -0.2009584, 3.926332, 1, 0, 0.05882353, 1,
2.755013, 0.3339278, 0.04804152, 1, 0, 0.05490196, 1,
2.806105, -1.547975, 1.207478, 1, 0, 0.04705882, 1,
2.947211, 1.346461, 1.375343, 1, 0, 0.04313726, 1,
2.956381, -0.2783746, 1.538381, 1, 0, 0.03529412, 1,
2.98236, -0.135132, 3.700708, 1, 0, 0.03137255, 1,
2.982718, 2.403097, 0.7114468, 1, 0, 0.02352941, 1,
3.167531, -1.00196, 3.988037, 1, 0, 0.01960784, 1,
3.209591, -0.3794295, 0.6014974, 1, 0, 0.01176471, 1,
3.304832, 2.016648, 2.59065, 1, 0, 0.007843138, 1
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
0.06424725, -3.848251, -6.967194, 0, -0.5, 0.5, 0.5,
0.06424725, -3.848251, -6.967194, 1, -0.5, 0.5, 0.5,
0.06424725, -3.848251, -6.967194, 1, 1.5, 0.5, 0.5,
0.06424725, -3.848251, -6.967194, 0, 1.5, 0.5, 0.5
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
-4.274895, 0.210991, -6.967194, 0, -0.5, 0.5, 0.5,
-4.274895, 0.210991, -6.967194, 1, -0.5, 0.5, 0.5,
-4.274895, 0.210991, -6.967194, 1, 1.5, 0.5, 0.5,
-4.274895, 0.210991, -6.967194, 0, 1.5, 0.5, 0.5
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
-4.274895, -3.848251, 0.1333067, 0, -0.5, 0.5, 0.5,
-4.274895, -3.848251, 0.1333067, 1, -0.5, 0.5, 0.5,
-4.274895, -3.848251, 0.1333067, 1, 1.5, 0.5, 0.5,
-4.274895, -3.848251, 0.1333067, 0, 1.5, 0.5, 0.5
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
-3, -2.911503, -5.328617,
3, -2.911503, -5.328617,
-3, -2.911503, -5.328617,
-3, -3.067627, -5.601713,
-2, -2.911503, -5.328617,
-2, -3.067627, -5.601713,
-1, -2.911503, -5.328617,
-1, -3.067627, -5.601713,
0, -2.911503, -5.328617,
0, -3.067627, -5.601713,
1, -2.911503, -5.328617,
1, -3.067627, -5.601713,
2, -2.911503, -5.328617,
2, -3.067627, -5.601713,
3, -2.911503, -5.328617,
3, -3.067627, -5.601713
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
-3, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
-3, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
-3, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
-3, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
-2, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
-2, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
-2, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
-2, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
-1, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
-1, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
-1, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
-1, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
0, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
0, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
0, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
0, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
1, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
1, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
1, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
1, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
2, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
2, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
2, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
2, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5,
3, -3.379877, -6.147905, 0, -0.5, 0.5, 0.5,
3, -3.379877, -6.147905, 1, -0.5, 0.5, 0.5,
3, -3.379877, -6.147905, 1, 1.5, 0.5, 0.5,
3, -3.379877, -6.147905, 0, 1.5, 0.5, 0.5
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
-3.273555, -2, -5.328617,
-3.273555, 3, -5.328617,
-3.273555, -2, -5.328617,
-3.440445, -2, -5.601713,
-3.273555, -1, -5.328617,
-3.440445, -1, -5.601713,
-3.273555, 0, -5.328617,
-3.440445, 0, -5.601713,
-3.273555, 1, -5.328617,
-3.440445, 1, -5.601713,
-3.273555, 2, -5.328617,
-3.440445, 2, -5.601713,
-3.273555, 3, -5.328617,
-3.440445, 3, -5.601713
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
-3.774225, -2, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, -2, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, -2, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, -2, -6.147905, 0, 1.5, 0.5, 0.5,
-3.774225, -1, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, -1, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, -1, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, -1, -6.147905, 0, 1.5, 0.5, 0.5,
-3.774225, 0, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, 0, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, 0, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, 0, -6.147905, 0, 1.5, 0.5, 0.5,
-3.774225, 1, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, 1, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, 1, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, 1, -6.147905, 0, 1.5, 0.5, 0.5,
-3.774225, 2, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, 2, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, 2, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, 2, -6.147905, 0, 1.5, 0.5, 0.5,
-3.774225, 3, -6.147905, 0, -0.5, 0.5, 0.5,
-3.774225, 3, -6.147905, 1, -0.5, 0.5, 0.5,
-3.774225, 3, -6.147905, 1, 1.5, 0.5, 0.5,
-3.774225, 3, -6.147905, 0, 1.5, 0.5, 0.5
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
-3.273555, -2.911503, -4,
-3.273555, -2.911503, 4,
-3.273555, -2.911503, -4,
-3.440445, -3.067627, -4,
-3.273555, -2.911503, -2,
-3.440445, -3.067627, -2,
-3.273555, -2.911503, 0,
-3.440445, -3.067627, 0,
-3.273555, -2.911503, 2,
-3.440445, -3.067627, 2,
-3.273555, -2.911503, 4,
-3.440445, -3.067627, 4
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
-3.774225, -3.379877, -4, 0, -0.5, 0.5, 0.5,
-3.774225, -3.379877, -4, 1, -0.5, 0.5, 0.5,
-3.774225, -3.379877, -4, 1, 1.5, 0.5, 0.5,
-3.774225, -3.379877, -4, 0, 1.5, 0.5, 0.5,
-3.774225, -3.379877, -2, 0, -0.5, 0.5, 0.5,
-3.774225, -3.379877, -2, 1, -0.5, 0.5, 0.5,
-3.774225, -3.379877, -2, 1, 1.5, 0.5, 0.5,
-3.774225, -3.379877, -2, 0, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 0, 0, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 0, 1, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 0, 1, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 0, 0, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 2, 0, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 2, 1, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 2, 1, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 2, 0, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 4, 0, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 4, 1, -0.5, 0.5, 0.5,
-3.774225, -3.379877, 4, 1, 1.5, 0.5, 0.5,
-3.774225, -3.379877, 4, 0, 1.5, 0.5, 0.5
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
-3.273555, -2.911503, -5.328617,
-3.273555, 3.333485, -5.328617,
-3.273555, -2.911503, 5.595231,
-3.273555, 3.333485, 5.595231,
-3.273555, -2.911503, -5.328617,
-3.273555, -2.911503, 5.595231,
-3.273555, 3.333485, -5.328617,
-3.273555, 3.333485, 5.595231,
-3.273555, -2.911503, -5.328617,
3.402049, -2.911503, -5.328617,
-3.273555, -2.911503, 5.595231,
3.402049, -2.911503, 5.595231,
-3.273555, 3.333485, -5.328617,
3.402049, 3.333485, -5.328617,
-3.273555, 3.333485, 5.595231,
3.402049, 3.333485, 5.595231,
3.402049, -2.911503, -5.328617,
3.402049, 3.333485, -5.328617,
3.402049, -2.911503, 5.595231,
3.402049, 3.333485, 5.595231,
3.402049, -2.911503, -5.328617,
3.402049, -2.911503, 5.595231,
3.402049, 3.333485, -5.328617,
3.402049, 3.333485, 5.595231
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
var radius = 7.606065;
var distance = 33.84024;
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
mvMatrix.translate( -0.06424725, -0.210991, -0.1333067 );
mvMatrix.scale( 1.231923, 1.316868, 0.7528325 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84024);
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
Ametrine<-read.table("Ametrine.xyz")
```

```
## Error in read.table("Ametrine.xyz"): no lines available in input
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
-3.176337, -1.233955, -2.04227, 0, 0, 1, 1, 1,
-2.895194, -0.2664801, -1.941621, 1, 0, 0, 1, 1,
-2.884466, 0.608153, -2.708646, 1, 0, 0, 1, 1,
-2.593855, 0.1610669, -0.4829486, 1, 0, 0, 1, 1,
-2.582926, 1.167784, -0.6094367, 1, 0, 0, 1, 1,
-2.455358, 0.7729416, -0.6858782, 1, 0, 0, 1, 1,
-2.447317, -1.009125, -2.383191, 0, 0, 0, 1, 1,
-2.438336, 1.140489, -0.9433797, 0, 0, 0, 1, 1,
-2.432405, 0.5769808, -3.674641, 0, 0, 0, 1, 1,
-2.362657, 0.1730045, -1.374552, 0, 0, 0, 1, 1,
-2.358597, -1.251857, -2.731346, 0, 0, 0, 1, 1,
-2.298771, 0.3192695, -1.860396, 0, 0, 0, 1, 1,
-2.29738, -0.502987, -2.126449, 0, 0, 0, 1, 1,
-2.261621, 0.317996, -2.40654, 1, 1, 1, 1, 1,
-2.252895, -0.4962471, -1.910041, 1, 1, 1, 1, 1,
-2.251527, -0.7484942, -0.4788176, 1, 1, 1, 1, 1,
-2.230393, 0.0891492, -1.047933, 1, 1, 1, 1, 1,
-2.207371, -0.4656877, -0.5037746, 1, 1, 1, 1, 1,
-2.145079, 0.7416186, -2.742268, 1, 1, 1, 1, 1,
-2.131538, 0.7823821, -1.238986, 1, 1, 1, 1, 1,
-2.127323, 1.91171, 0.01779819, 1, 1, 1, 1, 1,
-2.119846, -0.9968632, -1.980815, 1, 1, 1, 1, 1,
-2.11891, 0.03071924, -1.936592, 1, 1, 1, 1, 1,
-2.106912, -0.9260868, -1.102467, 1, 1, 1, 1, 1,
-2.075698, -0.6100293, -1.243248, 1, 1, 1, 1, 1,
-2.036012, -0.1193206, -2.89553, 1, 1, 1, 1, 1,
-2.033459, 0.5371187, -1.148154, 1, 1, 1, 1, 1,
-2.0192, -0.683897, -0.823841, 1, 1, 1, 1, 1,
-2.003577, -0.0360842, -3.564233, 0, 0, 1, 1, 1,
-1.985253, 1.735989, -0.6679421, 1, 0, 0, 1, 1,
-1.913231, -0.06172195, -1.203802, 1, 0, 0, 1, 1,
-1.911723, -1.573467, -2.476226, 1, 0, 0, 1, 1,
-1.890041, -1.818475, -2.99212, 1, 0, 0, 1, 1,
-1.872911, 1.074897, -0.662103, 1, 0, 0, 1, 1,
-1.871133, -0.5345555, -3.056812, 0, 0, 0, 1, 1,
-1.869793, -0.1923619, -0.1818489, 0, 0, 0, 1, 1,
-1.869266, 1.770523, -1.856189, 0, 0, 0, 1, 1,
-1.862854, -0.5069747, -0.6172825, 0, 0, 0, 1, 1,
-1.859282, -0.4706174, -1.827394, 0, 0, 0, 1, 1,
-1.853618, 0.4954858, -2.166197, 0, 0, 0, 1, 1,
-1.834012, 2.270331, -1.937573, 0, 0, 0, 1, 1,
-1.828013, -0.8487374, -1.761732, 1, 1, 1, 1, 1,
-1.805493, 0.1733247, -0.8182264, 1, 1, 1, 1, 1,
-1.762305, -0.1076091, -1.925329, 1, 1, 1, 1, 1,
-1.762067, 1.750132, 0.8734882, 1, 1, 1, 1, 1,
-1.759373, 0.6058183, -1.033611, 1, 1, 1, 1, 1,
-1.743926, 1.115988, 0.6572797, 1, 1, 1, 1, 1,
-1.714105, -0.0271776, -2.48606, 1, 1, 1, 1, 1,
-1.698218, 0.64459, -2.174638, 1, 1, 1, 1, 1,
-1.674816, 0.4845102, -3.123122, 1, 1, 1, 1, 1,
-1.670197, -0.8076048, -1.20918, 1, 1, 1, 1, 1,
-1.669398, 0.6239538, -1.307792, 1, 1, 1, 1, 1,
-1.653373, -1.251296, -3.327007, 1, 1, 1, 1, 1,
-1.647634, -0.8345855, -1.873116, 1, 1, 1, 1, 1,
-1.639223, -0.4319198, -0.7960184, 1, 1, 1, 1, 1,
-1.619304, 1.907026, 0.02794049, 1, 1, 1, 1, 1,
-1.603034, 0.09958881, -1.414339, 0, 0, 1, 1, 1,
-1.592106, 1.943482, -0.4818713, 1, 0, 0, 1, 1,
-1.590683, 2.439258, -0.4930965, 1, 0, 0, 1, 1,
-1.571456, 1.320485, 0.04265174, 1, 0, 0, 1, 1,
-1.567076, -0.5043225, -1.780629, 1, 0, 0, 1, 1,
-1.548901, 0.535828, -1.950412, 1, 0, 0, 1, 1,
-1.548862, 0.8778452, 0.4378548, 0, 0, 0, 1, 1,
-1.548091, -1.865053, 0.3119417, 0, 0, 0, 1, 1,
-1.530707, 0.1584967, -0.98805, 0, 0, 0, 1, 1,
-1.52979, 0.3153192, -1.19515, 0, 0, 0, 1, 1,
-1.528969, -0.05497932, -1.70317, 0, 0, 0, 1, 1,
-1.519586, -0.9254968, -3.640095, 0, 0, 0, 1, 1,
-1.513706, 0.2323607, 0.1331797, 0, 0, 0, 1, 1,
-1.49965, 0.3161002, -0.7046967, 1, 1, 1, 1, 1,
-1.481632, 0.7227152, -0.1607347, 1, 1, 1, 1, 1,
-1.474657, -0.722468, -1.73784, 1, 1, 1, 1, 1,
-1.473552, -0.467905, -1.424726, 1, 1, 1, 1, 1,
-1.47336, 0.6949885, -0.9921203, 1, 1, 1, 1, 1,
-1.458277, -0.4739355, -2.688681, 1, 1, 1, 1, 1,
-1.449299, 1.367286, -1.069568, 1, 1, 1, 1, 1,
-1.448118, 1.029623, 0.3094238, 1, 1, 1, 1, 1,
-1.444297, 0.0007481001, -0.9593486, 1, 1, 1, 1, 1,
-1.432632, -1.674769, -2.881196, 1, 1, 1, 1, 1,
-1.426686, -0.04740209, -0.8848283, 1, 1, 1, 1, 1,
-1.424389, -0.5920597, -2.291804, 1, 1, 1, 1, 1,
-1.422501, -1.818522, -4.573927, 1, 1, 1, 1, 1,
-1.415273, -0.1552832, -0.8309515, 1, 1, 1, 1, 1,
-1.409109, 1.339657, 0.350068, 1, 1, 1, 1, 1,
-1.392132, 0.5944672, -1.61657, 0, 0, 1, 1, 1,
-1.371539, -0.2314697, -1.340184, 1, 0, 0, 1, 1,
-1.368552, 1.119358, -0.5234431, 1, 0, 0, 1, 1,
-1.367823, -0.7165199, -1.696615, 1, 0, 0, 1, 1,
-1.35257, -0.7152729, -2.126355, 1, 0, 0, 1, 1,
-1.350253, 1.300097, 0.5173493, 1, 0, 0, 1, 1,
-1.336564, 0.7784157, -1.645891, 0, 0, 0, 1, 1,
-1.322315, -0.4828411, -1.306924, 0, 0, 0, 1, 1,
-1.321078, 0.5777959, -1.072142, 0, 0, 0, 1, 1,
-1.320048, 0.3009163, -1.253957, 0, 0, 0, 1, 1,
-1.309461, -0.964127, -1.260198, 0, 0, 0, 1, 1,
-1.299405, 1.48651, -0.9186147, 0, 0, 0, 1, 1,
-1.277544, -1.113704, -1.706997, 0, 0, 0, 1, 1,
-1.274367, 0.2729385, -0.1953027, 1, 1, 1, 1, 1,
-1.265779, 0.7497126, -0.1043806, 1, 1, 1, 1, 1,
-1.258909, 0.4658897, -1.996703, 1, 1, 1, 1, 1,
-1.244347, 0.3175445, -2.389182, 1, 1, 1, 1, 1,
-1.242645, -0.7053519, -3.147604, 1, 1, 1, 1, 1,
-1.23714, 0.002698272, -2.666183, 1, 1, 1, 1, 1,
-1.231904, -0.5648327, -1.263299, 1, 1, 1, 1, 1,
-1.225081, -0.4838912, -1.660059, 1, 1, 1, 1, 1,
-1.223976, 1.286625, -1.739962, 1, 1, 1, 1, 1,
-1.220531, -1.703176, -0.5113569, 1, 1, 1, 1, 1,
-1.217724, 0.7237933, -1.802675, 1, 1, 1, 1, 1,
-1.216645, -0.7900929, -1.306119, 1, 1, 1, 1, 1,
-1.213508, 0.007437532, -2.076932, 1, 1, 1, 1, 1,
-1.213208, 0.8724439, 0.3148848, 1, 1, 1, 1, 1,
-1.205877, -0.7895487, -1.401947, 1, 1, 1, 1, 1,
-1.202635, 0.1467876, -1.637251, 0, 0, 1, 1, 1,
-1.202056, -0.07961794, -1.415274, 1, 0, 0, 1, 1,
-1.191753, -1.289988, -2.292553, 1, 0, 0, 1, 1,
-1.191191, 0.04916658, -1.253597, 1, 0, 0, 1, 1,
-1.190018, 0.526252, 0.7576239, 1, 0, 0, 1, 1,
-1.185698, -0.5142391, -1.760262, 1, 0, 0, 1, 1,
-1.180047, -0.4139488, -1.893924, 0, 0, 0, 1, 1,
-1.168679, 0.4889835, -1.39323, 0, 0, 0, 1, 1,
-1.163467, 0.2923645, -1.271097, 0, 0, 0, 1, 1,
-1.161972, 0.1950745, -0.2577503, 0, 0, 0, 1, 1,
-1.161035, 0.2867212, -1.325186, 0, 0, 0, 1, 1,
-1.136635, 0.9217108, -2.139921, 0, 0, 0, 1, 1,
-1.133586, -1.065073, -1.192229, 0, 0, 0, 1, 1,
-1.123522, 0.5561979, -0.6092567, 1, 1, 1, 1, 1,
-1.118488, -1.347174, -2.004367, 1, 1, 1, 1, 1,
-1.118358, 1.364464, -2.151218, 1, 1, 1, 1, 1,
-1.118185, -0.2993179, -3.175015, 1, 1, 1, 1, 1,
-1.116726, -1.717667, -3.890944, 1, 1, 1, 1, 1,
-1.116631, -0.9014392, 0.07733757, 1, 1, 1, 1, 1,
-1.11624, -0.1113472, -1.772225, 1, 1, 1, 1, 1,
-1.114648, -0.5591317, -0.8330009, 1, 1, 1, 1, 1,
-1.110574, 0.02794765, -2.384812, 1, 1, 1, 1, 1,
-1.107332, -0.1685989, -0.3281302, 1, 1, 1, 1, 1,
-1.103784, 0.7880251, -2.344305, 1, 1, 1, 1, 1,
-1.091755, 1.627252, 1.015851, 1, 1, 1, 1, 1,
-1.091317, -1.736409, -3.189488, 1, 1, 1, 1, 1,
-1.089053, -0.7992354, -1.218549, 1, 1, 1, 1, 1,
-1.086573, -1.140854, -2.808105, 1, 1, 1, 1, 1,
-1.086357, 0.2227829, -0.2472621, 0, 0, 1, 1, 1,
-1.083719, 0.9301983, 0.4886197, 1, 0, 0, 1, 1,
-1.083107, 0.5701884, -1.00497, 1, 0, 0, 1, 1,
-1.078186, 0.9795725, -0.6999308, 1, 0, 0, 1, 1,
-1.075193, 0.5283034, 0.1488518, 1, 0, 0, 1, 1,
-1.069605, 0.4147906, -2.019644, 1, 0, 0, 1, 1,
-1.061374, 0.6077021, -0.6874616, 0, 0, 0, 1, 1,
-1.057488, 0.5436032, 0.2874483, 0, 0, 0, 1, 1,
-1.046311, -2.272691, -2.434426, 0, 0, 0, 1, 1,
-1.029332, -1.565928, -2.910156, 0, 0, 0, 1, 1,
-1.024135, -0.8567451, -3.324365, 0, 0, 0, 1, 1,
-1.019944, -0.858155, -3.671881, 0, 0, 0, 1, 1,
-1.018646, -0.4131926, -1.981134, 0, 0, 0, 1, 1,
-1.005818, -0.3637096, -1.750726, 1, 1, 1, 1, 1,
-1.005774, 0.4033425, -0.4869666, 1, 1, 1, 1, 1,
-1.004615, -0.3060629, -1.774509, 1, 1, 1, 1, 1,
-0.997743, -0.1165669, -0.6207494, 1, 1, 1, 1, 1,
-0.9916799, 0.3828615, -2.410115, 1, 1, 1, 1, 1,
-0.9871505, 1.581582, -2.897354, 1, 1, 1, 1, 1,
-0.980316, -0.183648, -1.783559, 1, 1, 1, 1, 1,
-0.979757, -0.2748861, -0.1452128, 1, 1, 1, 1, 1,
-0.9763313, 2.202537, -0.3620965, 1, 1, 1, 1, 1,
-0.9692716, 0.5558379, 0.6611575, 1, 1, 1, 1, 1,
-0.9675975, -1.464461, -2.703256, 1, 1, 1, 1, 1,
-0.964627, 0.5982072, -2.887166, 1, 1, 1, 1, 1,
-0.9585811, -0.5203425, -1.757464, 1, 1, 1, 1, 1,
-0.958119, -1.230241, -2.266423, 1, 1, 1, 1, 1,
-0.9549915, -0.1295503, -2.341852, 1, 1, 1, 1, 1,
-0.9508557, 1.052769, -1.17503, 0, 0, 1, 1, 1,
-0.9465528, -1.338004, -2.728126, 1, 0, 0, 1, 1,
-0.9463575, -1.014108, -2.117949, 1, 0, 0, 1, 1,
-0.9441084, 1.498785, -0.3977394, 1, 0, 0, 1, 1,
-0.9278037, 0.7736442, -1.912001, 1, 0, 0, 1, 1,
-0.9209229, 0.6348562, 0.2051972, 1, 0, 0, 1, 1,
-0.9146636, -1.716169, -2.888981, 0, 0, 0, 1, 1,
-0.9109743, 0.75881, -0.595552, 0, 0, 0, 1, 1,
-0.9098579, 0.6518849, -0.3084137, 0, 0, 0, 1, 1,
-0.9091633, 0.02558648, -0.7412184, 0, 0, 0, 1, 1,
-0.9080051, 0.07074549, -1.056744, 0, 0, 0, 1, 1,
-0.9035773, -0.8028384, -3.599878, 0, 0, 0, 1, 1,
-0.8947252, 0.2027924, 0.7848784, 0, 0, 0, 1, 1,
-0.8928811, -1.284167, -1.788294, 1, 1, 1, 1, 1,
-0.8876162, 0.3823844, -1.01956, 1, 1, 1, 1, 1,
-0.887135, -0.8315078, -2.80049, 1, 1, 1, 1, 1,
-0.8826829, 0.07282142, -0.9575513, 1, 1, 1, 1, 1,
-0.8821108, -0.5625091, -2.921829, 1, 1, 1, 1, 1,
-0.8814033, -1.128045, -1.945239, 1, 1, 1, 1, 1,
-0.8779479, 1.289776, -0.8603288, 1, 1, 1, 1, 1,
-0.8716748, -0.8337469, -2.36171, 1, 1, 1, 1, 1,
-0.8659256, -0.3283086, -2.429373, 1, 1, 1, 1, 1,
-0.8596966, -0.9093122, -2.817288, 1, 1, 1, 1, 1,
-0.8559523, 0.6538989, -1.573197, 1, 1, 1, 1, 1,
-0.8489218, 1.337037, 0.3653509, 1, 1, 1, 1, 1,
-0.8484322, -2.820556, -2.160901, 1, 1, 1, 1, 1,
-0.8459502, 2.243793, 0.09358408, 1, 1, 1, 1, 1,
-0.8441105, 0.5357466, -1.803316, 1, 1, 1, 1, 1,
-0.8428715, 3.242538, 0.8995398, 0, 0, 1, 1, 1,
-0.8331865, -0.8915349, -2.897999, 1, 0, 0, 1, 1,
-0.8323849, -1.962728, -0.7063294, 1, 0, 0, 1, 1,
-0.8311649, 0.1022264, -1.554861, 1, 0, 0, 1, 1,
-0.8289416, -1.770284, -2.783758, 1, 0, 0, 1, 1,
-0.8269104, -0.2975058, -2.886591, 1, 0, 0, 1, 1,
-0.8254804, -0.1180535, -1.548697, 0, 0, 0, 1, 1,
-0.8234128, 0.9367091, 0.03462257, 0, 0, 0, 1, 1,
-0.8217136, -1.195927, -1.7908, 0, 0, 0, 1, 1,
-0.8166144, -0.8765805, -2.117311, 0, 0, 0, 1, 1,
-0.8121924, -0.4334269, -1.646125, 0, 0, 0, 1, 1,
-0.8101234, -1.065005, -2.661969, 0, 0, 0, 1, 1,
-0.8039032, -0.6725365, -2.378853, 0, 0, 0, 1, 1,
-0.798136, 1.0254, 0.5213579, 1, 1, 1, 1, 1,
-0.7970669, 1.937344, -1.28766, 1, 1, 1, 1, 1,
-0.7944484, -1.328109, -2.523964, 1, 1, 1, 1, 1,
-0.7907341, -1.108834, -1.940052, 1, 1, 1, 1, 1,
-0.7886402, 0.08426981, -3.37199, 1, 1, 1, 1, 1,
-0.7877558, 0.9705718, -1.172496, 1, 1, 1, 1, 1,
-0.7853665, -2.642136, -3.196125, 1, 1, 1, 1, 1,
-0.7833586, 0.3758847, -1.190677, 1, 1, 1, 1, 1,
-0.7709555, -1.128361, -2.385549, 1, 1, 1, 1, 1,
-0.7679441, -0.1632009, -1.775133, 1, 1, 1, 1, 1,
-0.7650171, -0.7576011, -3.138693, 1, 1, 1, 1, 1,
-0.7584736, -0.3493719, -2.896551, 1, 1, 1, 1, 1,
-0.7552381, 0.5617868, -0.5497086, 1, 1, 1, 1, 1,
-0.7530226, -1.205997, -2.24249, 1, 1, 1, 1, 1,
-0.7427083, -0.6558752, -2.897402, 1, 1, 1, 1, 1,
-0.7368126, 0.209231, 0.1160975, 0, 0, 1, 1, 1,
-0.7343187, -0.05259962, -1.14294, 1, 0, 0, 1, 1,
-0.7338955, 0.6428167, -0.9068903, 1, 0, 0, 1, 1,
-0.7322124, -1.555465, -1.808135, 1, 0, 0, 1, 1,
-0.7289986, 0.05811651, -2.541367, 1, 0, 0, 1, 1,
-0.7227517, -2.766444, -0.8929309, 1, 0, 0, 1, 1,
-0.7154315, -0.6834528, -2.867228, 0, 0, 0, 1, 1,
-0.7127114, 0.6977686, -0.80765, 0, 0, 0, 1, 1,
-0.7114524, 1.83685, 0.1606686, 0, 0, 0, 1, 1,
-0.7064947, 0.2350501, -1.490534, 0, 0, 0, 1, 1,
-0.7038291, -0.9126824, -3.681725, 0, 0, 0, 1, 1,
-0.6977794, 0.4820531, 0.4682117, 0, 0, 0, 1, 1,
-0.6907018, -0.8399633, -3.706965, 0, 0, 0, 1, 1,
-0.6881521, -1.84819, -1.581797, 1, 1, 1, 1, 1,
-0.6871054, 0.5258027, -0.8298466, 1, 1, 1, 1, 1,
-0.6862072, 1.116075, -0.312738, 1, 1, 1, 1, 1,
-0.6832573, 0.2148837, -1.951019, 1, 1, 1, 1, 1,
-0.6756697, -0.005753902, -2.490713, 1, 1, 1, 1, 1,
-0.6726528, -0.6821492, -3.663922, 1, 1, 1, 1, 1,
-0.6696911, 2.452007, -1.020909, 1, 1, 1, 1, 1,
-0.6677558, 0.4578008, -2.508234, 1, 1, 1, 1, 1,
-0.6666655, -0.6785084, -1.906327, 1, 1, 1, 1, 1,
-0.6654137, -0.5180663, -2.80651, 1, 1, 1, 1, 1,
-0.6637039, 0.7978259, -0.01742215, 1, 1, 1, 1, 1,
-0.6613691, 1.190375, 0.4722318, 1, 1, 1, 1, 1,
-0.6608607, -1.407293, -1.302098, 1, 1, 1, 1, 1,
-0.6597866, -0.3559055, -1.814725, 1, 1, 1, 1, 1,
-0.6501285, -0.4255832, -1.715006, 1, 1, 1, 1, 1,
-0.6475079, 0.746024, -1.100715, 0, 0, 1, 1, 1,
-0.6466604, 0.6725783, -1.329243, 1, 0, 0, 1, 1,
-0.6459839, 1.154293, -1.683417, 1, 0, 0, 1, 1,
-0.6438435, 0.9106091, 0.3861061, 1, 0, 0, 1, 1,
-0.6414841, 0.5130512, 0.8818293, 1, 0, 0, 1, 1,
-0.6406085, 0.0337828, -2.564006, 1, 0, 0, 1, 1,
-0.6392429, -0.5359175, -1.753772, 0, 0, 0, 1, 1,
-0.6337572, 0.193311, -0.3730741, 0, 0, 0, 1, 1,
-0.6196089, 0.8482771, -2.626514, 0, 0, 0, 1, 1,
-0.6191243, -0.1103174, -1.217568, 0, 0, 0, 1, 1,
-0.61814, 1.251081, -1.167744, 0, 0, 0, 1, 1,
-0.612844, 1.111088, 0.1944705, 0, 0, 0, 1, 1,
-0.6103684, 0.2664157, -3.591809, 0, 0, 0, 1, 1,
-0.6089282, 1.685414, -0.5518694, 1, 1, 1, 1, 1,
-0.608734, -0.01132276, -1.784015, 1, 1, 1, 1, 1,
-0.6049438, 0.5015106, 0.08160409, 1, 1, 1, 1, 1,
-0.6049372, -0.3713827, -1.878221, 1, 1, 1, 1, 1,
-0.5866576, -1.517018, -4.202618, 1, 1, 1, 1, 1,
-0.5859846, -0.188874, -2.005377, 1, 1, 1, 1, 1,
-0.5795042, -0.993162, -2.582945, 1, 1, 1, 1, 1,
-0.5791372, 1.225411, 0.4710991, 1, 1, 1, 1, 1,
-0.5780901, -0.3132579, -2.185719, 1, 1, 1, 1, 1,
-0.5777835, 0.07991727, -0.264898, 1, 1, 1, 1, 1,
-0.5773153, -1.862266, -1.027416, 1, 1, 1, 1, 1,
-0.5763499, -0.1141024, -2.307716, 1, 1, 1, 1, 1,
-0.5739906, -1.135829, -4.278445, 1, 1, 1, 1, 1,
-0.5710867, 2.937404, 0.3627858, 1, 1, 1, 1, 1,
-0.5697121, -0.8493103, -1.684586, 1, 1, 1, 1, 1,
-0.5685095, -0.3848701, -3.947594, 0, 0, 1, 1, 1,
-0.5661098, -2.147033, -2.089731, 1, 0, 0, 1, 1,
-0.5587492, -0.8903044, -2.94789, 1, 0, 0, 1, 1,
-0.5490194, 0.1544578, -1.614841, 1, 0, 0, 1, 1,
-0.5439347, -2.201901, -3.24339, 1, 0, 0, 1, 1,
-0.537568, 1.407152, -0.4674028, 1, 0, 0, 1, 1,
-0.5368212, 1.174649, -1.421555, 0, 0, 0, 1, 1,
-0.5359388, -0.3819423, -2.210255, 0, 0, 0, 1, 1,
-0.53541, 1.238304, -0.5978746, 0, 0, 0, 1, 1,
-0.5324264, 0.2672478, -1.370293, 0, 0, 0, 1, 1,
-0.5314008, 0.63852, -1.027669, 0, 0, 0, 1, 1,
-0.5291526, -1.010493, -2.726547, 0, 0, 0, 1, 1,
-0.52254, -0.7063769, -3.758023, 0, 0, 0, 1, 1,
-0.522248, 0.2137156, -1.330725, 1, 1, 1, 1, 1,
-0.5198005, -0.1284607, -3.491261, 1, 1, 1, 1, 1,
-0.5186917, -1.863288, -5.169532, 1, 1, 1, 1, 1,
-0.5184951, -2.4102, -2.809623, 1, 1, 1, 1, 1,
-0.513065, 0.429796, -1.772412, 1, 1, 1, 1, 1,
-0.5119908, -1.640402, -3.791569, 1, 1, 1, 1, 1,
-0.5084839, 0.2006337, -1.550743, 1, 1, 1, 1, 1,
-0.5012745, 1.241179, 0.5104213, 1, 1, 1, 1, 1,
-0.4967641, -1.057937, -4.95599, 1, 1, 1, 1, 1,
-0.4939898, -1.01829, -2.775481, 1, 1, 1, 1, 1,
-0.4899634, 0.7380332, -1.289004, 1, 1, 1, 1, 1,
-0.4868081, -0.0434299, -2.876607, 1, 1, 1, 1, 1,
-0.4817467, -0.2834627, -2.428875, 1, 1, 1, 1, 1,
-0.4761129, 0.1961478, -1.454552, 1, 1, 1, 1, 1,
-0.4757346, -0.79372, -3.207788, 1, 1, 1, 1, 1,
-0.4755871, -0.3998884, -3.767166, 0, 0, 1, 1, 1,
-0.47544, -1.600518, -3.323975, 1, 0, 0, 1, 1,
-0.4708714, -0.4205919, -3.539813, 1, 0, 0, 1, 1,
-0.4703765, -0.5390353, -2.461146, 1, 0, 0, 1, 1,
-0.4692792, 1.039867, 0.7049921, 1, 0, 0, 1, 1,
-0.4618395, 0.4374934, -0.6800045, 1, 0, 0, 1, 1,
-0.4586263, 1.064183, -1.598759, 0, 0, 0, 1, 1,
-0.4584485, 2.616465, -0.03253118, 0, 0, 0, 1, 1,
-0.4481012, 1.36342, -0.8153474, 0, 0, 0, 1, 1,
-0.4462745, 0.6755822, -0.3892722, 0, 0, 0, 1, 1,
-0.4421342, -1.598023, -3.099886, 0, 0, 0, 1, 1,
-0.4387144, 0.6521994, -1.266602, 0, 0, 0, 1, 1,
-0.4369995, 0.223091, -2.566133, 0, 0, 0, 1, 1,
-0.434188, -2.431484, -4.312794, 1, 1, 1, 1, 1,
-0.4336395, 0.663833, 0.1032364, 1, 1, 1, 1, 1,
-0.4320396, 0.3383146, -1.479433, 1, 1, 1, 1, 1,
-0.4270412, 0.8262034, 0.33038, 1, 1, 1, 1, 1,
-0.4254442, 0.538931, 0.2372635, 1, 1, 1, 1, 1,
-0.4215328, 0.287668, -1.250815, 1, 1, 1, 1, 1,
-0.4199913, 2.040127, -0.08065181, 1, 1, 1, 1, 1,
-0.4188064, 0.32192, -1.16404, 1, 1, 1, 1, 1,
-0.418156, 1.69667, 0.8948707, 1, 1, 1, 1, 1,
-0.4177589, -0.3478836, -2.758822, 1, 1, 1, 1, 1,
-0.4143017, -0.06522424, -2.755499, 1, 1, 1, 1, 1,
-0.4134255, -0.04429007, -3.16159, 1, 1, 1, 1, 1,
-0.4091475, -0.4237394, -2.460941, 1, 1, 1, 1, 1,
-0.4085826, -1.166937, -3.086802, 1, 1, 1, 1, 1,
-0.4063846, 0.4791626, -0.05081438, 1, 1, 1, 1, 1,
-0.4055593, -0.8902953, -0.826629, 0, 0, 1, 1, 1,
-0.3965262, 0.1433183, -0.9225023, 1, 0, 0, 1, 1,
-0.3938178, -0.9843193, -2.936661, 1, 0, 0, 1, 1,
-0.3935792, 0.9343128, -0.1724546, 1, 0, 0, 1, 1,
-0.3909107, 1.6423, -0.7649151, 1, 0, 0, 1, 1,
-0.3907988, 0.3442664, -0.8563456, 1, 0, 0, 1, 1,
-0.3900789, 0.4164378, -2.230557, 0, 0, 0, 1, 1,
-0.3888119, 0.2673842, -0.7268665, 0, 0, 0, 1, 1,
-0.3857297, 0.06155772, -0.9341326, 0, 0, 0, 1, 1,
-0.3833871, -0.7649093, -2.983911, 0, 0, 0, 1, 1,
-0.3767341, 1.865451, -1.670496, 0, 0, 0, 1, 1,
-0.3766296, 0.9953205, -0.4082897, 0, 0, 0, 1, 1,
-0.3618574, 0.1286106, -1.070152, 0, 0, 0, 1, 1,
-0.3596519, 1.79648, 0.4413404, 1, 1, 1, 1, 1,
-0.3571079, -0.6619914, -1.064497, 1, 1, 1, 1, 1,
-0.3545456, 0.7888981, 0.2791687, 1, 1, 1, 1, 1,
-0.3512895, 0.2042909, -2.888465, 1, 1, 1, 1, 1,
-0.3506001, 0.3107492, 0.04551638, 1, 1, 1, 1, 1,
-0.3500671, 1.241658, -0.1253372, 1, 1, 1, 1, 1,
-0.3479929, -1.085098, -3.716781, 1, 1, 1, 1, 1,
-0.3469755, 2.634303, -0.9082825, 1, 1, 1, 1, 1,
-0.3418247, 1.078229, -0.4179789, 1, 1, 1, 1, 1,
-0.3362735, -0.3172117, -2.779974, 1, 1, 1, 1, 1,
-0.3344764, -0.07642116, -2.377347, 1, 1, 1, 1, 1,
-0.3293847, -0.5603244, -2.222592, 1, 1, 1, 1, 1,
-0.3276598, 0.02703591, -3.29341, 1, 1, 1, 1, 1,
-0.3256876, -0.8231129, -3.622941, 1, 1, 1, 1, 1,
-0.3160455, -0.6647334, -2.04549, 1, 1, 1, 1, 1,
-0.3159702, -0.2211748, -1.244186, 0, 0, 1, 1, 1,
-0.3129829, -1.60367, -3.12644, 1, 0, 0, 1, 1,
-0.3126695, -0.8248834, -2.799273, 1, 0, 0, 1, 1,
-0.312209, 0.5480499, -1.896163, 1, 0, 0, 1, 1,
-0.3114966, 0.2878286, -1.058129, 1, 0, 0, 1, 1,
-0.3100174, 1.425469, 1.042853, 1, 0, 0, 1, 1,
-0.3086961, -0.4727723, -0.9817261, 0, 0, 0, 1, 1,
-0.3080495, 0.5607121, -1.976181, 0, 0, 0, 1, 1,
-0.3057075, -0.9491931, -1.831603, 0, 0, 0, 1, 1,
-0.3002116, -1.819893, -2.462883, 0, 0, 0, 1, 1,
-0.2998421, -1.104486, -2.606499, 0, 0, 0, 1, 1,
-0.2926744, 0.1234474, -0.2385565, 0, 0, 0, 1, 1,
-0.2923776, 0.3603405, -0.8990278, 0, 0, 0, 1, 1,
-0.2912995, -1.318734, -2.208713, 1, 1, 1, 1, 1,
-0.2904451, 0.9893587, -0.08699807, 1, 1, 1, 1, 1,
-0.2882087, 0.01025163, -1.616138, 1, 1, 1, 1, 1,
-0.2841939, 0.08687349, -1.078777, 1, 1, 1, 1, 1,
-0.2837424, 0.009278356, -1.707751, 1, 1, 1, 1, 1,
-0.2782942, 0.6539205, -2.836793, 1, 1, 1, 1, 1,
-0.2775069, -1.212866, -2.898543, 1, 1, 1, 1, 1,
-0.2726292, 1.627866, 1.966278, 1, 1, 1, 1, 1,
-0.2714904, -0.3958329, -2.760567, 1, 1, 1, 1, 1,
-0.2641182, 1.534373, 0.7573014, 1, 1, 1, 1, 1,
-0.2588993, -0.3226762, -3.869399, 1, 1, 1, 1, 1,
-0.2577315, 1.357767, 0.4587468, 1, 1, 1, 1, 1,
-0.2513613, 1.542831, 0.2753461, 1, 1, 1, 1, 1,
-0.2466687, -1.72906, -3.7115, 1, 1, 1, 1, 1,
-0.2400687, 0.06616844, 0.4172255, 1, 1, 1, 1, 1,
-0.2370852, 0.3766755, -0.7033569, 0, 0, 1, 1, 1,
-0.2281539, 1.679762, -0.2821168, 1, 0, 0, 1, 1,
-0.2180544, 0.07480919, -1.829043, 1, 0, 0, 1, 1,
-0.2146902, 0.1213536, -0.8346383, 1, 0, 0, 1, 1,
-0.1989778, -2.254661, -2.811632, 1, 0, 0, 1, 1,
-0.1986222, -0.07747883, -2.473578, 1, 0, 0, 1, 1,
-0.1919818, -0.1993151, -0.4000689, 0, 0, 0, 1, 1,
-0.1909229, 0.7877542, 1.802228, 0, 0, 0, 1, 1,
-0.1898417, -1.082861, -2.078759, 0, 0, 0, 1, 1,
-0.1889025, 0.8926555, 0.5765135, 0, 0, 0, 1, 1,
-0.18822, 0.1541287, 0.1541268, 0, 0, 0, 1, 1,
-0.1856066, -0.5983208, -2.59058, 0, 0, 0, 1, 1,
-0.1848539, 1.027249, 0.4560816, 0, 0, 0, 1, 1,
-0.1825694, -0.1236218, -3.711483, 1, 1, 1, 1, 1,
-0.1816556, -1.0774, -3.05281, 1, 1, 1, 1, 1,
-0.179933, 0.5765386, -0.6240889, 1, 1, 1, 1, 1,
-0.178191, 0.5927392, 1.184731, 1, 1, 1, 1, 1,
-0.1778039, -1.549794, -2.70344, 1, 1, 1, 1, 1,
-0.1776307, 1.231855, -0.004007185, 1, 1, 1, 1, 1,
-0.1742491, 0.7238552, 1.567375, 1, 1, 1, 1, 1,
-0.1709419, 0.04870836, -2.574472, 1, 1, 1, 1, 1,
-0.1683058, 0.1514638, -0.9239349, 1, 1, 1, 1, 1,
-0.1675412, 0.1857319, -0.7020018, 1, 1, 1, 1, 1,
-0.1665446, 1.310374, -1.917956, 1, 1, 1, 1, 1,
-0.1656282, -0.8504338, -3.255775, 1, 1, 1, 1, 1,
-0.1637507, 0.8097955, -1.234299, 1, 1, 1, 1, 1,
-0.163577, 1.477032, 0.6414719, 1, 1, 1, 1, 1,
-0.1597727, -0.6419277, -3.40304, 1, 1, 1, 1, 1,
-0.1595665, 1.40412, 0.1794543, 0, 0, 1, 1, 1,
-0.1560012, -0.1496277, -1.997935, 1, 0, 0, 1, 1,
-0.1551683, 0.6353421, -2.359895, 1, 0, 0, 1, 1,
-0.1550533, 0.8718967, -1.012374, 1, 0, 0, 1, 1,
-0.1509724, 2.055583, 0.1233922, 1, 0, 0, 1, 1,
-0.1504612, 0.8223807, -0.2026118, 1, 0, 0, 1, 1,
-0.1499843, -0.2392511, -2.896874, 0, 0, 0, 1, 1,
-0.1497807, 0.5488027, -0.1705942, 0, 0, 0, 1, 1,
-0.1417048, 0.2536202, -0.8738405, 0, 0, 0, 1, 1,
-0.1361477, 1.747574, -1.169867, 0, 0, 0, 1, 1,
-0.1337802, -1.959507, -1.841852, 0, 0, 0, 1, 1,
-0.1317345, -0.4569331, -1.301173, 0, 0, 0, 1, 1,
-0.1280056, -0.8072237, -3.009056, 0, 0, 0, 1, 1,
-0.1242193, -1.017196, -2.900086, 1, 1, 1, 1, 1,
-0.1232941, 0.9149635, -0.571788, 1, 1, 1, 1, 1,
-0.1213804, 0.04131716, -0.7029306, 1, 1, 1, 1, 1,
-0.1188803, -1.138779, -3.758278, 1, 1, 1, 1, 1,
-0.1169079, -1.704606, -2.255311, 1, 1, 1, 1, 1,
-0.114586, -0.3739979, -2.684301, 1, 1, 1, 1, 1,
-0.1114354, -1.503932, -3.581939, 1, 1, 1, 1, 1,
-0.1111117, -0.7365459, -2.1871, 1, 1, 1, 1, 1,
-0.1064802, 0.5186394, -0.5363934, 1, 1, 1, 1, 1,
-0.1049166, -0.1810786, -2.915165, 1, 1, 1, 1, 1,
-0.1033425, 0.3982115, 0.007633289, 1, 1, 1, 1, 1,
-0.09662113, -0.5872384, -1.687675, 1, 1, 1, 1, 1,
-0.09413666, 1.326354, -0.3498529, 1, 1, 1, 1, 1,
-0.09213411, -0.2873714, -4.374077, 1, 1, 1, 1, 1,
-0.09172112, 0.8939384, -0.4856474, 1, 1, 1, 1, 1,
-0.08991088, 1.225748, -0.04172639, 0, 0, 1, 1, 1,
-0.08721592, 0.05457644, -1.315524, 1, 0, 0, 1, 1,
-0.08674884, 1.444941, 0.7041154, 1, 0, 0, 1, 1,
-0.08654872, -0.4417971, -2.380485, 1, 0, 0, 1, 1,
-0.08442593, -1.187988, -2.358337, 1, 0, 0, 1, 1,
-0.08027185, -0.1840939, -2.221991, 1, 0, 0, 1, 1,
-0.07475242, -0.7193234, -0.6718802, 0, 0, 0, 1, 1,
-0.07184832, -0.734359, -2.06234, 0, 0, 0, 1, 1,
-0.07026547, 0.3651883, -0.7020129, 0, 0, 0, 1, 1,
-0.06966864, 0.983593, 0.1349497, 0, 0, 0, 1, 1,
-0.06264421, 1.862943, 2.16765, 0, 0, 0, 1, 1,
-0.0607921, 0.473482, 0.7544281, 0, 0, 0, 1, 1,
-0.06071619, -0.4206872, -4.322067, 0, 0, 0, 1, 1,
-0.05958299, 1.651534, 1.132609, 1, 1, 1, 1, 1,
-0.05847271, 0.06564766, -1.166773, 1, 1, 1, 1, 1,
-0.05714245, 1.908817, 0.6596327, 1, 1, 1, 1, 1,
-0.05573296, 1.058375, 0.0538031, 1, 1, 1, 1, 1,
-0.05390904, -1.163871, -1.243487, 1, 1, 1, 1, 1,
-0.05364185, -1.627207, -4.600461, 1, 1, 1, 1, 1,
-0.05222145, 0.2486287, 0.3152991, 1, 1, 1, 1, 1,
-0.05002604, -1.667933, -2.775989, 1, 1, 1, 1, 1,
-0.04611963, 0.09334663, 0.364162, 1, 1, 1, 1, 1,
-0.04452473, 0.719984, 0.2499493, 1, 1, 1, 1, 1,
-0.03652473, 0.858371, 0.7222335, 1, 1, 1, 1, 1,
-0.03514268, 0.5901446, -0.1182244, 1, 1, 1, 1, 1,
-0.03498803, 2.231389, 0.4291191, 1, 1, 1, 1, 1,
-0.03189323, -0.2084837, -1.627949, 1, 1, 1, 1, 1,
-0.03164805, 0.1025914, 0.2965906, 1, 1, 1, 1, 1,
-0.03078154, -0.02596165, -1.54152, 0, 0, 1, 1, 1,
-0.02649494, -1.019159, -2.433932, 1, 0, 0, 1, 1,
-0.02541115, 1.26459, 1.189096, 1, 0, 0, 1, 1,
-0.02460674, 0.7793642, -1.068999, 1, 0, 0, 1, 1,
-0.02271373, 0.3421749, 0.03193671, 1, 0, 0, 1, 1,
-0.02223763, 1.308901, 0.7172025, 1, 0, 0, 1, 1,
-0.02130463, -0.968874, -4.054496, 0, 0, 0, 1, 1,
-0.02126349, -0.4717124, -3.816761, 0, 0, 0, 1, 1,
-0.01660904, -0.4241331, -1.90543, 0, 0, 0, 1, 1,
-0.01549019, -0.2855232, -1.703522, 0, 0, 0, 1, 1,
-0.01138976, 0.1013799, -0.365016, 0, 0, 0, 1, 1,
-0.01002272, -0.7616153, -3.763389, 0, 0, 0, 1, 1,
-0.009061235, 0.2508798, 0.6701034, 0, 0, 0, 1, 1,
-0.004932228, -0.2541084, -2.170171, 1, 1, 1, 1, 1,
-0.002822526, 0.457054, 1.976715, 1, 1, 1, 1, 1,
-0.001282863, 1.788688, -0.271227, 1, 1, 1, 1, 1,
0.002491255, 0.668542, -0.2420013, 1, 1, 1, 1, 1,
0.002640504, -0.2908326, 3.263171, 1, 1, 1, 1, 1,
0.002935986, -1.014982, 3.412948, 1, 1, 1, 1, 1,
0.005252049, -0.2900614, 2.234824, 1, 1, 1, 1, 1,
0.006116794, -0.03192824, 2.969106, 1, 1, 1, 1, 1,
0.006369893, 0.820591, -0.05032067, 1, 1, 1, 1, 1,
0.007004527, -0.3245616, 3.41482, 1, 1, 1, 1, 1,
0.008409812, -1.076504, 2.580321, 1, 1, 1, 1, 1,
0.01056682, 0.2512366, -0.3722126, 1, 1, 1, 1, 1,
0.01290715, -2.012039, 4.0767, 1, 1, 1, 1, 1,
0.01875872, -0.1218088, 3.854421, 1, 1, 1, 1, 1,
0.01922314, -0.2910622, 4.31907, 1, 1, 1, 1, 1,
0.02075737, 0.7058811, -0.8007188, 0, 0, 1, 1, 1,
0.02115033, 0.1082845, 0.5309684, 1, 0, 0, 1, 1,
0.02310656, -1.004308, 4.252361, 1, 0, 0, 1, 1,
0.02343789, -1.696567, 4.318473, 1, 0, 0, 1, 1,
0.0237981, -1.032593, 4.732124, 1, 0, 0, 1, 1,
0.02438567, -1.468465, 4.083752, 1, 0, 0, 1, 1,
0.02484379, 1.245028, -0.5188094, 0, 0, 0, 1, 1,
0.02490629, -0.5076696, 3.455564, 0, 0, 0, 1, 1,
0.02509601, -0.03210071, 1.991767, 0, 0, 0, 1, 1,
0.0299158, 0.2220505, 1.149607, 0, 0, 0, 1, 1,
0.02994067, -2.288528, 3.767863, 0, 0, 0, 1, 1,
0.03031688, 0.2601311, 0.8800398, 0, 0, 0, 1, 1,
0.03844296, 0.4784265, -0.1383568, 0, 0, 0, 1, 1,
0.03923418, 1.484298, -0.7881857, 1, 1, 1, 1, 1,
0.04007416, 0.5235665, 0.6292251, 1, 1, 1, 1, 1,
0.0413085, -1.422928, 3.741335, 1, 1, 1, 1, 1,
0.04371065, 1.110317, -0.3843606, 1, 1, 1, 1, 1,
0.05368361, -0.7300287, 4.969037, 1, 1, 1, 1, 1,
0.05456495, 1.098322, 1.320718, 1, 1, 1, 1, 1,
0.05472502, 1.788428, -1.714031, 1, 1, 1, 1, 1,
0.05478591, 1.629467, 1.413569, 1, 1, 1, 1, 1,
0.05838449, 0.4850303, -0.0296561, 1, 1, 1, 1, 1,
0.06119625, -0.5276456, 3.299403, 1, 1, 1, 1, 1,
0.06339052, -1.146794, 3.553971, 1, 1, 1, 1, 1,
0.06557187, 0.7043083, -0.9941387, 1, 1, 1, 1, 1,
0.06580283, 1.006199, -0.8455051, 1, 1, 1, 1, 1,
0.06715672, 2.104438, -1.136351, 1, 1, 1, 1, 1,
0.0739366, -0.005420099, 1.272888, 1, 1, 1, 1, 1,
0.07434081, -1.678002, 3.047074, 0, 0, 1, 1, 1,
0.07535661, -0.2059568, 1.533776, 1, 0, 0, 1, 1,
0.07888377, -0.994989, 1.783621, 1, 0, 0, 1, 1,
0.08002983, 0.0818271, 0.2376532, 1, 0, 0, 1, 1,
0.08189078, -0.6366003, 4.844683, 1, 0, 0, 1, 1,
0.0883005, 1.122459, 0.4199699, 1, 0, 0, 1, 1,
0.08989397, -0.03453968, 3.818657, 0, 0, 0, 1, 1,
0.0903492, -0.1493639, 3.136761, 0, 0, 0, 1, 1,
0.0927662, 0.1233215, 0.1643482, 0, 0, 0, 1, 1,
0.09320922, -0.4389969, 1.219081, 0, 0, 0, 1, 1,
0.09409019, -0.7856407, 4.442549, 0, 0, 0, 1, 1,
0.09440214, 0.5451242, -0.3821307, 0, 0, 0, 1, 1,
0.09469846, 1.127063, 1.833726, 0, 0, 0, 1, 1,
0.1039305, -0.2822849, 3.78, 1, 1, 1, 1, 1,
0.1079971, -0.5396323, 4.243438, 1, 1, 1, 1, 1,
0.1082156, -1.597436, 3.172287, 1, 1, 1, 1, 1,
0.1108728, 0.08368856, 0.2733169, 1, 1, 1, 1, 1,
0.1136045, -0.7618582, 3.611399, 1, 1, 1, 1, 1,
0.1143195, -0.9127917, 1.586567, 1, 1, 1, 1, 1,
0.1181273, 0.09638356, 1.326571, 1, 1, 1, 1, 1,
0.1190322, 0.4033506, 0.5148197, 1, 1, 1, 1, 1,
0.1210059, 0.4477766, 1.33895, 1, 1, 1, 1, 1,
0.1218626, -0.2671154, 3.316665, 1, 1, 1, 1, 1,
0.1241308, -0.5036783, 4.650164, 1, 1, 1, 1, 1,
0.125739, 2.422767, 0.8676827, 1, 1, 1, 1, 1,
0.1282579, -1.068926, 3.157862, 1, 1, 1, 1, 1,
0.1313763, 0.1854047, 2.883235, 1, 1, 1, 1, 1,
0.1318194, -1.161494, 3.446478, 1, 1, 1, 1, 1,
0.1335422, 0.07693354, 1.547321, 0, 0, 1, 1, 1,
0.1385041, 0.4403174, 1.747059, 1, 0, 0, 1, 1,
0.1426301, 1.715896, 1.165012, 1, 0, 0, 1, 1,
0.1428845, 0.4434227, 0.8389862, 1, 0, 0, 1, 1,
0.1449963, -0.7965862, 2.290119, 1, 0, 0, 1, 1,
0.1496605, 2.261321, 1.345639, 1, 0, 0, 1, 1,
0.1515205, -1.905975, 4.449092, 0, 0, 0, 1, 1,
0.1559868, -0.2725734, 0.7379113, 0, 0, 0, 1, 1,
0.1584914, 2.049872, -1.095042, 0, 0, 0, 1, 1,
0.1603002, 1.562165, 0.5773124, 0, 0, 0, 1, 1,
0.1624753, 0.3493348, -2.194657, 0, 0, 0, 1, 1,
0.1625142, 0.6145154, -0.5707394, 0, 0, 0, 1, 1,
0.1640139, -1.169694, 2.170909, 0, 0, 0, 1, 1,
0.1644877, -1.005282, 2.904793, 1, 1, 1, 1, 1,
0.165679, -0.3688832, 3.657936, 1, 1, 1, 1, 1,
0.1743466, 1.168807, -1.125234, 1, 1, 1, 1, 1,
0.1850637, -0.9468048, 2.043337, 1, 1, 1, 1, 1,
0.1854068, -0.1888864, 4.979433, 1, 1, 1, 1, 1,
0.1877051, -0.01882993, 0.5085006, 1, 1, 1, 1, 1,
0.187878, -0.5661232, 2.801015, 1, 1, 1, 1, 1,
0.1894373, 0.6125658, 0.3371568, 1, 1, 1, 1, 1,
0.1901027, -0.2301536, 3.375939, 1, 1, 1, 1, 1,
0.1905801, 1.417669, -0.2653713, 1, 1, 1, 1, 1,
0.1917238, -0.9204603, 5.249947, 1, 1, 1, 1, 1,
0.1939793, 1.458198, 0.3667341, 1, 1, 1, 1, 1,
0.196509, -0.7514689, 2.536102, 1, 1, 1, 1, 1,
0.1978629, 1.498509, 0.2526356, 1, 1, 1, 1, 1,
0.1982478, -0.9812428, 0.7804434, 1, 1, 1, 1, 1,
0.1987282, -1.518126, 3.104815, 0, 0, 1, 1, 1,
0.2006321, -1.756986, 2.208734, 1, 0, 0, 1, 1,
0.2013146, 0.2491991, 1.864051, 1, 0, 0, 1, 1,
0.201725, -0.113077, 2.825877, 1, 0, 0, 1, 1,
0.2048173, -0.378853, 4.106703, 1, 0, 0, 1, 1,
0.205087, -0.6908244, 1.896494, 1, 0, 0, 1, 1,
0.2069043, -0.2315131, 2.501808, 0, 0, 0, 1, 1,
0.2084817, -0.7395502, 1.310068, 0, 0, 0, 1, 1,
0.2099499, -0.4101206, 3.49859, 0, 0, 0, 1, 1,
0.2168969, 0.4329345, 0.812364, 0, 0, 0, 1, 1,
0.2192178, -1.734534, 1.826671, 0, 0, 0, 1, 1,
0.2200303, -0.1394374, 2.714448, 0, 0, 0, 1, 1,
0.2241456, -0.0164208, 1.982302, 0, 0, 0, 1, 1,
0.2283039, 0.252618, -0.05742631, 1, 1, 1, 1, 1,
0.2303133, -1.883808, 2.483747, 1, 1, 1, 1, 1,
0.2333671, -0.1188634, 2.658358, 1, 1, 1, 1, 1,
0.2335358, 1.899788, 0.04790134, 1, 1, 1, 1, 1,
0.2339284, 0.1350328, 0.4891928, 1, 1, 1, 1, 1,
0.2389624, -0.6865848, 3.357072, 1, 1, 1, 1, 1,
0.2412983, -0.4727262, 2.4703, 1, 1, 1, 1, 1,
0.2433271, 0.4731089, -1.490348, 1, 1, 1, 1, 1,
0.2499333, 0.4123468, 0.6071995, 1, 1, 1, 1, 1,
0.2599313, 1.38039, -0.4267028, 1, 1, 1, 1, 1,
0.2631119, -1.161928, 4.774816, 1, 1, 1, 1, 1,
0.2661784, 2.069062, 0.1902115, 1, 1, 1, 1, 1,
0.2669911, -0.5786675, 2.677276, 1, 1, 1, 1, 1,
0.2682183, -1.055698, 3.16671, 1, 1, 1, 1, 1,
0.2705619, 1.553925, -1.447868, 1, 1, 1, 1, 1,
0.2719402, 0.7494622, -0.039375, 0, 0, 1, 1, 1,
0.2735363, -0.3928841, 3.601972, 1, 0, 0, 1, 1,
0.2784259, 0.3009718, -0.6327174, 1, 0, 0, 1, 1,
0.2790148, -0.3451486, 1.281478, 1, 0, 0, 1, 1,
0.2797234, 1.255718, 0.6259931, 1, 0, 0, 1, 1,
0.2817668, -0.007683629, 0.8999251, 1, 0, 0, 1, 1,
0.2838446, 0.3180801, 1.553272, 0, 0, 0, 1, 1,
0.2866865, -1.052273, 3.047432, 0, 0, 0, 1, 1,
0.2880048, -0.3897862, 2.667256, 0, 0, 0, 1, 1,
0.2882634, 0.4432921, 1.168637, 0, 0, 0, 1, 1,
0.2900941, 0.8705915, 0.4351187, 0, 0, 0, 1, 1,
0.2939066, 1.371381, -0.1682932, 0, 0, 0, 1, 1,
0.3012488, 1.593717, -0.590562, 0, 0, 0, 1, 1,
0.3080463, 0.8130984, 0.9173375, 1, 1, 1, 1, 1,
0.3088797, 0.3544579, 1.999381, 1, 1, 1, 1, 1,
0.3144902, 0.8796206, -0.02969159, 1, 1, 1, 1, 1,
0.3161204, 2.245177, 2.204344, 1, 1, 1, 1, 1,
0.3224521, 0.7493782, 0.5896518, 1, 1, 1, 1, 1,
0.3294163, -1.391613, 2.981729, 1, 1, 1, 1, 1,
0.3326687, -0.5560789, 2.560326, 1, 1, 1, 1, 1,
0.3329878, 0.2957374, 0.9004331, 1, 1, 1, 1, 1,
0.3335253, 2.282752, -1.629034, 1, 1, 1, 1, 1,
0.3373313, 0.1460621, 3.335236, 1, 1, 1, 1, 1,
0.3461941, 1.026937, 1.280617, 1, 1, 1, 1, 1,
0.3463493, 0.8449667, 0.6079021, 1, 1, 1, 1, 1,
0.3472552, 0.5317829, 0.2987097, 1, 1, 1, 1, 1,
0.3486814, -1.391495, 3.873304, 1, 1, 1, 1, 1,
0.3541708, 0.2874032, -0.6922359, 1, 1, 1, 1, 1,
0.3586239, -1.157313, 2.975141, 0, 0, 1, 1, 1,
0.3597669, -0.7346703, 2.354857, 1, 0, 0, 1, 1,
0.360812, -0.961594, 3.338273, 1, 0, 0, 1, 1,
0.3619361, -1.702752, 2.427158, 1, 0, 0, 1, 1,
0.3629848, -0.7339381, 1.346164, 1, 0, 0, 1, 1,
0.3634909, 0.2750989, 1.524457, 1, 0, 0, 1, 1,
0.3659336, 0.08374155, 1.546278, 0, 0, 0, 1, 1,
0.3682937, -0.4205942, 3.056373, 0, 0, 0, 1, 1,
0.3715968, 0.4045403, 0.06597074, 0, 0, 0, 1, 1,
0.3719692, 0.1657417, 2.085887, 0, 0, 0, 1, 1,
0.3815625, -2.18522, 2.63976, 0, 0, 0, 1, 1,
0.3839585, 0.3725902, 0.7063039, 0, 0, 0, 1, 1,
0.3865808, 0.4536234, 0.7129328, 0, 0, 0, 1, 1,
0.3916425, 0.2772549, 0.09596029, 1, 1, 1, 1, 1,
0.3984067, -1.833393, 3.664671, 1, 1, 1, 1, 1,
0.405317, 0.4557002, 0.5162829, 1, 1, 1, 1, 1,
0.4065481, 0.4246688, 2.528417, 1, 1, 1, 1, 1,
0.4205284, -0.5481014, 4.242554, 1, 1, 1, 1, 1,
0.4221733, -0.8632292, 4.384126, 1, 1, 1, 1, 1,
0.4223491, 0.7231406, 0.3403327, 1, 1, 1, 1, 1,
0.4224063, -0.08150754, 3.737906, 1, 1, 1, 1, 1,
0.4239697, -0.8364605, 2.754983, 1, 1, 1, 1, 1,
0.4293131, 1.633815, 1.440297, 1, 1, 1, 1, 1,
0.4318619, 0.1774091, 0.644971, 1, 1, 1, 1, 1,
0.4330822, 1.001043, 0.88221, 1, 1, 1, 1, 1,
0.4380298, -0.2521313, 2.692189, 1, 1, 1, 1, 1,
0.4440555, -0.409609, 0.2758029, 1, 1, 1, 1, 1,
0.4441369, 0.9220615, -0.1708204, 1, 1, 1, 1, 1,
0.4459292, 1.314386, -0.4796949, 0, 0, 1, 1, 1,
0.4479246, -0.04034345, 2.048707, 1, 0, 0, 1, 1,
0.4492181, -0.8401405, 2.997773, 1, 0, 0, 1, 1,
0.4497133, 0.8510791, 0.07609261, 1, 0, 0, 1, 1,
0.4554696, -0.6201317, 5.119395, 1, 0, 0, 1, 1,
0.4645437, 0.8529228, 0.4086934, 1, 0, 0, 1, 1,
0.4662455, 0.283022, 1.259276, 0, 0, 0, 1, 1,
0.4715628, 0.5257201, 0.06945687, 0, 0, 0, 1, 1,
0.4750999, -1.810392, 1.726355, 0, 0, 0, 1, 1,
0.4789661, -0.04194406, 3.532036, 0, 0, 0, 1, 1,
0.4841975, 1.438967, -0.06921777, 0, 0, 0, 1, 1,
0.4842556, 1.280863, 2.104204, 0, 0, 0, 1, 1,
0.4847507, 1.202154, 1.797697, 0, 0, 0, 1, 1,
0.4869785, 0.7695713, -0.06703264, 1, 1, 1, 1, 1,
0.4908963, 1.299002, -1.51972, 1, 1, 1, 1, 1,
0.4916459, 0.3881919, 1.5352, 1, 1, 1, 1, 1,
0.4937247, -0.9762533, 2.353667, 1, 1, 1, 1, 1,
0.4959455, -0.9668013, 2.009862, 1, 1, 1, 1, 1,
0.4967499, 0.284941, 1.781956, 1, 1, 1, 1, 1,
0.4972243, -0.4253234, 2.995882, 1, 1, 1, 1, 1,
0.497315, 1.082834, 0.0144413, 1, 1, 1, 1, 1,
0.5023069, -1.291008, 3.161083, 1, 1, 1, 1, 1,
0.5074495, 0.816528, 2.42366, 1, 1, 1, 1, 1,
0.510509, 1.448251, 0.3344987, 1, 1, 1, 1, 1,
0.5132655, -1.06747, 2.552605, 1, 1, 1, 1, 1,
0.5167391, 0.4735124, 0.03064034, 1, 1, 1, 1, 1,
0.5207151, -0.1610168, 1.262699, 1, 1, 1, 1, 1,
0.5219842, -0.4099507, 2.251694, 1, 1, 1, 1, 1,
0.522517, -1.25463, 1.82184, 0, 0, 1, 1, 1,
0.5287799, 0.4139195, -0.3295231, 1, 0, 0, 1, 1,
0.5340819, 0.3113976, 1.969988, 1, 0, 0, 1, 1,
0.5341776, 0.5195221, 0.2498108, 1, 0, 0, 1, 1,
0.5351632, -1.435722, 5.055426, 1, 0, 0, 1, 1,
0.5405003, 0.8243796, -1.246957, 1, 0, 0, 1, 1,
0.5409127, -0.5840718, 3.33991, 0, 0, 0, 1, 1,
0.5412309, -0.2845549, 3.876987, 0, 0, 0, 1, 1,
0.5423049, 0.2202244, 0.1161548, 0, 0, 0, 1, 1,
0.542347, -0.2535947, 2.500404, 0, 0, 0, 1, 1,
0.5434591, -0.4751891, 2.018806, 0, 0, 0, 1, 1,
0.5436826, -0.5017744, 2.335687, 0, 0, 0, 1, 1,
0.5440938, 0.1225595, 2.427328, 0, 0, 0, 1, 1,
0.548628, 0.07107446, 1.144482, 1, 1, 1, 1, 1,
0.5508119, 0.09439635, 1.177961, 1, 1, 1, 1, 1,
0.5541972, -1.385973, 1.628008, 1, 1, 1, 1, 1,
0.5565253, 1.321828, 0.995109, 1, 1, 1, 1, 1,
0.5589512, -0.9601333, 3.184482, 1, 1, 1, 1, 1,
0.5632342, -0.06779499, 2.122992, 1, 1, 1, 1, 1,
0.5668039, 0.6541259, -0.8137093, 1, 1, 1, 1, 1,
0.5694085, -1.056931, 2.793143, 1, 1, 1, 1, 1,
0.5722153, -0.6907822, 3.80405, 1, 1, 1, 1, 1,
0.5760592, 2.912926, -1.800581, 1, 1, 1, 1, 1,
0.5780988, 2.115423, 2.319939, 1, 1, 1, 1, 1,
0.5810378, -0.7602002, 4.374256, 1, 1, 1, 1, 1,
0.5816768, 1.18804, -0.6615367, 1, 1, 1, 1, 1,
0.5821174, -0.7312258, 4.380295, 1, 1, 1, 1, 1,
0.5836396, 0.1424953, 1.412554, 1, 1, 1, 1, 1,
0.5838346, -1.319389, 3.378644, 0, 0, 1, 1, 1,
0.5961745, 0.1417346, 2.256407, 1, 0, 0, 1, 1,
0.597708, -0.1808786, 1.750365, 1, 0, 0, 1, 1,
0.601365, -1.377001, 4.979832, 1, 0, 0, 1, 1,
0.606755, -0.4982846, 2.242278, 1, 0, 0, 1, 1,
0.6081635, -1.701605, 2.630252, 1, 0, 0, 1, 1,
0.6083617, -0.8858227, 1.809543, 0, 0, 0, 1, 1,
0.618078, -0.1334616, 0.9640808, 0, 0, 0, 1, 1,
0.6187264, -2.035115, 3.782431, 0, 0, 0, 1, 1,
0.6206473, -0.8716753, 2.068019, 0, 0, 0, 1, 1,
0.6241362, -0.4794206, 2.495823, 0, 0, 0, 1, 1,
0.6246752, 0.8409365, 2.42054, 0, 0, 0, 1, 1,
0.6297845, -0.6893109, 2.203722, 0, 0, 0, 1, 1,
0.6339452, -0.09220275, 2.770129, 1, 1, 1, 1, 1,
0.6384555, 1.21219, 1.163326, 1, 1, 1, 1, 1,
0.6454632, -0.6432725, 2.971318, 1, 1, 1, 1, 1,
0.6470919, -0.443653, 3.259506, 1, 1, 1, 1, 1,
0.6559481, -1.059476, 3.721713, 1, 1, 1, 1, 1,
0.6571617, 2.123921, 1.786969, 1, 1, 1, 1, 1,
0.6578732, -1.877725, 4.181771, 1, 1, 1, 1, 1,
0.6606088, 1.650253, -0.6312291, 1, 1, 1, 1, 1,
0.6615064, 1.327145, 0.7799816, 1, 1, 1, 1, 1,
0.6616892, 0.7573704, 0.3654423, 1, 1, 1, 1, 1,
0.6628063, -1.075981, 2.220757, 1, 1, 1, 1, 1,
0.6639223, 0.8446635, 0.06278962, 1, 1, 1, 1, 1,
0.6650769, 0.2911942, 1.507586, 1, 1, 1, 1, 1,
0.6662588, -0.04656931, -0.1672485, 1, 1, 1, 1, 1,
0.6709411, -1.013086, 3.320339, 1, 1, 1, 1, 1,
0.6797594, 0.3290356, 1.748327, 0, 0, 1, 1, 1,
0.6845051, 1.080565, -0.4578758, 1, 0, 0, 1, 1,
0.6863933, 0.5886562, 0.9729538, 1, 0, 0, 1, 1,
0.6873996, 0.3638438, 1.606933, 1, 0, 0, 1, 1,
0.6875058, -1.088306, 2.104845, 1, 0, 0, 1, 1,
0.6959509, 0.5680886, -0.3680315, 1, 0, 0, 1, 1,
0.6960052, -0.07176115, 1.002374, 0, 0, 0, 1, 1,
0.6963445, 1.139228, 1.728407, 0, 0, 0, 1, 1,
0.6971765, -0.8624045, 1.619828, 0, 0, 0, 1, 1,
0.6972178, -0.3835633, 0.4447696, 0, 0, 0, 1, 1,
0.6995465, 0.6529405, 1.843982, 0, 0, 0, 1, 1,
0.6996126, -0.4387288, 1.576119, 0, 0, 0, 1, 1,
0.7002747, 0.325235, 2.196598, 0, 0, 0, 1, 1,
0.7057626, 0.4239824, 0.9703884, 1, 1, 1, 1, 1,
0.7077705, -0.3897769, 2.130333, 1, 1, 1, 1, 1,
0.7081859, 0.875288, -0.327283, 1, 1, 1, 1, 1,
0.7133803, 1.614644, -1.273393, 1, 1, 1, 1, 1,
0.7167215, -0.4783603, -1.046845, 1, 1, 1, 1, 1,
0.7283782, -0.7242332, 0.8082221, 1, 1, 1, 1, 1,
0.7304731, 1.635506, -0.006769598, 1, 1, 1, 1, 1,
0.7407745, 0.7635942, 0.4313521, 1, 1, 1, 1, 1,
0.7444665, 0.3159937, 0.483729, 1, 1, 1, 1, 1,
0.745272, 0.9538921, 1.352395, 1, 1, 1, 1, 1,
0.7541674, -1.100143, 2.72242, 1, 1, 1, 1, 1,
0.7582312, 2.025665, 1.193458, 1, 1, 1, 1, 1,
0.7589239, -0.1128851, 2.185631, 1, 1, 1, 1, 1,
0.7621816, -1.214556, 3.721189, 1, 1, 1, 1, 1,
0.7623619, 0.2862966, 2.143654, 1, 1, 1, 1, 1,
0.7623701, 1.895268, 0.2186154, 0, 0, 1, 1, 1,
0.7704129, -2.330978, 5.436145, 1, 0, 0, 1, 1,
0.7718264, 0.7985973, 0.5750175, 1, 0, 0, 1, 1,
0.7721572, 0.04435191, 1.170427, 1, 0, 0, 1, 1,
0.7728568, -0.8153729, 0.8642328, 1, 0, 0, 1, 1,
0.7766176, -0.1301173, 2.493395, 1, 0, 0, 1, 1,
0.7768052, -1.429291, 3.567549, 0, 0, 0, 1, 1,
0.7792593, 0.5081099, 0.4950593, 0, 0, 0, 1, 1,
0.783002, -0.9549944, 1.963839, 0, 0, 0, 1, 1,
0.7840008, -0.4223762, 2.830398, 0, 0, 0, 1, 1,
0.7886841, -1.439301, 1.53898, 0, 0, 0, 1, 1,
0.7927868, -0.4353712, 3.069904, 0, 0, 0, 1, 1,
0.7947173, -0.4958172, 2.043179, 0, 0, 0, 1, 1,
0.7952137, -1.626265, 3.385, 1, 1, 1, 1, 1,
0.7986487, -0.9893069, 1.447636, 1, 1, 1, 1, 1,
0.8031539, -0.2308714, 2.115545, 1, 1, 1, 1, 1,
0.8038914, -0.07890476, 3.567505, 1, 1, 1, 1, 1,
0.804931, 0.08611206, 2.948371, 1, 1, 1, 1, 1,
0.8072867, 0.897147, 2.601956, 1, 1, 1, 1, 1,
0.8122624, -0.05401633, -0.3390054, 1, 1, 1, 1, 1,
0.8167193, -1.465398, 2.479679, 1, 1, 1, 1, 1,
0.819051, -1.361513, 3.81601, 1, 1, 1, 1, 1,
0.8217525, -0.06173279, 0.8105763, 1, 1, 1, 1, 1,
0.8243902, -0.9840641, 2.987234, 1, 1, 1, 1, 1,
0.8274525, 0.6969023, 1.8305, 1, 1, 1, 1, 1,
0.8302825, -0.7400258, 3.24244, 1, 1, 1, 1, 1,
0.8320203, 0.3323767, 1.496626, 1, 1, 1, 1, 1,
0.8336838, 0.3648777, 3.014099, 1, 1, 1, 1, 1,
0.8368341, -0.3059861, 2.103889, 0, 0, 1, 1, 1,
0.8398005, -0.9310839, 2.177907, 1, 0, 0, 1, 1,
0.842539, -0.8488173, 3.609347, 1, 0, 0, 1, 1,
0.8448783, -0.8995956, 0.3406683, 1, 0, 0, 1, 1,
0.8636432, -0.8580681, 2.167358, 1, 0, 0, 1, 1,
0.8670591, -0.8340259, 0.9342428, 1, 0, 0, 1, 1,
0.8696039, 0.5182241, -0.200733, 0, 0, 0, 1, 1,
0.8746193, 1.193771, 0.2598773, 0, 0, 0, 1, 1,
0.8749958, 1.000733, -0.8149531, 0, 0, 0, 1, 1,
0.8769657, 0.2176803, 0.4087196, 0, 0, 0, 1, 1,
0.8835047, 0.3451298, 2.60143, 0, 0, 0, 1, 1,
0.8842795, 0.1174333, 1.226973, 0, 0, 0, 1, 1,
0.8909302, 0.839239, -0.2489766, 0, 0, 0, 1, 1,
0.8995092, -1.077565, 2.22116, 1, 1, 1, 1, 1,
0.9018795, -0.4288595, 1.628848, 1, 1, 1, 1, 1,
0.9057341, 0.3412306, 2.508383, 1, 1, 1, 1, 1,
0.9077759, -1.494515, 1.864231, 1, 1, 1, 1, 1,
0.9112598, 1.602644, -1.293603, 1, 1, 1, 1, 1,
0.9120586, -1.898748, 1.903872, 1, 1, 1, 1, 1,
0.912574, -1.193084, 2.518477, 1, 1, 1, 1, 1,
0.9127037, 0.7671453, 1.136832, 1, 1, 1, 1, 1,
0.9191471, -0.09637422, 0.7146118, 1, 1, 1, 1, 1,
0.9256614, 2.181769, -0.01859499, 1, 1, 1, 1, 1,
0.9262134, -0.1993946, 1.347799, 1, 1, 1, 1, 1,
0.9269454, -0.3732758, 1.533922, 1, 1, 1, 1, 1,
0.9356063, -1.534565, 3.048755, 1, 1, 1, 1, 1,
0.9438804, 1.417912, 1.042966, 1, 1, 1, 1, 1,
0.9493491, -0.3886499, 0.7769821, 1, 1, 1, 1, 1,
0.9502402, 0.1386093, 1.324476, 0, 0, 1, 1, 1,
0.9512661, 1.727883, 0.2937678, 1, 0, 0, 1, 1,
0.9558511, 0.9566541, -0.07584974, 1, 0, 0, 1, 1,
0.9664057, -0.9218935, 2.976585, 1, 0, 0, 1, 1,
0.9679328, -0.7056645, 2.465994, 1, 0, 0, 1, 1,
0.9694681, -0.3848197, 1.867978, 1, 0, 0, 1, 1,
0.9776947, 0.3133108, 2.27225, 0, 0, 0, 1, 1,
0.9955406, 1.822622, -0.1638207, 0, 0, 0, 1, 1,
0.9983453, -1.060345, 1.745057, 0, 0, 0, 1, 1,
1.000453, 0.1252773, 0.9926157, 0, 0, 0, 1, 1,
1.002796, 1.164474, 1.727195, 0, 0, 0, 1, 1,
1.013939, 0.1442394, 3.235639, 0, 0, 0, 1, 1,
1.019781, -0.6269596, 0.198871, 0, 0, 0, 1, 1,
1.021065, -1.689444, 3.562442, 1, 1, 1, 1, 1,
1.021698, -0.003982603, 2.188514, 1, 1, 1, 1, 1,
1.029529, 0.577217, 0.1210997, 1, 1, 1, 1, 1,
1.036137, 0.0359572, 3.855129, 1, 1, 1, 1, 1,
1.043357, -0.101522, 2.774826, 1, 1, 1, 1, 1,
1.044872, 1.552457, -0.6044851, 1, 1, 1, 1, 1,
1.044902, 0.2374866, 1.033187, 1, 1, 1, 1, 1,
1.046985, -0.2073198, 0.193563, 1, 1, 1, 1, 1,
1.054106, -0.7539774, 1.984203, 1, 1, 1, 1, 1,
1.054214, 0.4765797, 2.600295, 1, 1, 1, 1, 1,
1.062672, -0.02774616, 1.86654, 1, 1, 1, 1, 1,
1.068606, 0.9148977, 2.635358, 1, 1, 1, 1, 1,
1.068664, -0.3522327, 1.297398, 1, 1, 1, 1, 1,
1.068829, -1.013427, 1.499374, 1, 1, 1, 1, 1,
1.069285, -1.838043, 3.19759, 1, 1, 1, 1, 1,
1.070648, 0.4717794, -0.1921927, 0, 0, 1, 1, 1,
1.078828, 0.9374134, 1.62485, 1, 0, 0, 1, 1,
1.082661, -0.2288772, 0.7805259, 1, 0, 0, 1, 1,
1.084704, -0.6289129, 2.73144, 1, 0, 0, 1, 1,
1.096043, 2.126214, 0.8428997, 1, 0, 0, 1, 1,
1.102289, 0.3378843, 2.564857, 1, 0, 0, 1, 1,
1.106978, -0.1263932, 1.355341, 0, 0, 0, 1, 1,
1.110272, 0.9159781, -1.960484, 0, 0, 0, 1, 1,
1.113534, -0.6956383, 2.473592, 0, 0, 0, 1, 1,
1.115256, 0.7856613, 0.2202473, 0, 0, 0, 1, 1,
1.131882, 0.3191327, 1.20484, 0, 0, 0, 1, 1,
1.13749, 0.09358122, 1.374709, 0, 0, 0, 1, 1,
1.139908, 0.5205035, 1.273938, 0, 0, 0, 1, 1,
1.144414, 1.363987, 0.3830503, 1, 1, 1, 1, 1,
1.14506, 0.06819415, 1.298824, 1, 1, 1, 1, 1,
1.146444, 0.5909895, 1.989039, 1, 1, 1, 1, 1,
1.154897, -0.8906602, 3.22971, 1, 1, 1, 1, 1,
1.15679, -1.112175, 3.920587, 1, 1, 1, 1, 1,
1.164892, 0.7428071, 0.09446523, 1, 1, 1, 1, 1,
1.166756, 0.6651387, 0.9758456, 1, 1, 1, 1, 1,
1.173946, -1.056482, 1.177191, 1, 1, 1, 1, 1,
1.186165, -0.967909, 2.774382, 1, 1, 1, 1, 1,
1.189308, 2.111558, 0.724447, 1, 1, 1, 1, 1,
1.191113, 0.4231385, 1.493046, 1, 1, 1, 1, 1,
1.21282, 0.9557741, 2.577285, 1, 1, 1, 1, 1,
1.217877, -2.240525, 3.665798, 1, 1, 1, 1, 1,
1.225672, -0.2793261, 1.87509, 1, 1, 1, 1, 1,
1.234612, 0.1397804, 2.01393, 1, 1, 1, 1, 1,
1.238937, -0.905275, -0.2505805, 0, 0, 1, 1, 1,
1.242342, -1.081555, 2.231321, 1, 0, 0, 1, 1,
1.245461, 1.452947, -0.1309696, 1, 0, 0, 1, 1,
1.2477, -0.1836113, 1.847244, 1, 0, 0, 1, 1,
1.252019, -0.463801, 0.7023997, 1, 0, 0, 1, 1,
1.254431, -0.8646602, 2.19096, 1, 0, 0, 1, 1,
1.261437, 2.018197, 0.522686, 0, 0, 0, 1, 1,
1.26246, 1.187064, -0.152694, 0, 0, 0, 1, 1,
1.266695, -0.2696941, 2.364526, 0, 0, 0, 1, 1,
1.272291, -0.4326216, 1.385991, 0, 0, 0, 1, 1,
1.279208, 1.965283, 2.34837, 0, 0, 0, 1, 1,
1.290629, -2.314374, 4.123836, 0, 0, 0, 1, 1,
1.300341, -0.7097886, 1.544665, 0, 0, 0, 1, 1,
1.301995, 0.3408529, 1.051455, 1, 1, 1, 1, 1,
1.307844, -1.954516, 3.606742, 1, 1, 1, 1, 1,
1.309623, 0.0009435599, 0.8185892, 1, 1, 1, 1, 1,
1.311726, -0.9408272, 1.292321, 1, 1, 1, 1, 1,
1.329991, -0.8054662, 3.160461, 1, 1, 1, 1, 1,
1.341457, -1.314134, 1.363103, 1, 1, 1, 1, 1,
1.343915, -0.351818, -1.092592, 1, 1, 1, 1, 1,
1.359427, 0.9340714, 0.01917323, 1, 1, 1, 1, 1,
1.382347, 0.6474497, 2.125942, 1, 1, 1, 1, 1,
1.386457, -2.355242, 2.26639, 1, 1, 1, 1, 1,
1.38914, -0.4937943, 1.931346, 1, 1, 1, 1, 1,
1.397463, 0.6744085, 2.24898, 1, 1, 1, 1, 1,
1.412056, -1.164734, 1.531737, 1, 1, 1, 1, 1,
1.415073, 0.1725698, -0.2714731, 1, 1, 1, 1, 1,
1.415089, -0.06258121, 1.28585, 1, 1, 1, 1, 1,
1.420466, -0.4590575, 1.635686, 0, 0, 1, 1, 1,
1.424363, 0.587518, 2.071334, 1, 0, 0, 1, 1,
1.467339, -1.225516, 2.297869, 1, 0, 0, 1, 1,
1.47238, 1.940992, 1.173739, 1, 0, 0, 1, 1,
1.477296, 0.5602411, 1.007455, 1, 0, 0, 1, 1,
1.48915, -0.9288446, 1.701507, 1, 0, 0, 1, 1,
1.491402, 1.043544, 1.401108, 0, 0, 0, 1, 1,
1.494409, 0.6011717, 1.34097, 0, 0, 0, 1, 1,
1.49982, -2.089574, 2.486259, 0, 0, 0, 1, 1,
1.50073, 0.7351874, -0.8209513, 0, 0, 0, 1, 1,
1.513063, -0.9441912, 2.492087, 0, 0, 0, 1, 1,
1.527341, 0.7247979, -0.3425946, 0, 0, 0, 1, 1,
1.529229, -1.552865, 1.776549, 0, 0, 0, 1, 1,
1.538618, 0.7117836, 0.1870705, 1, 1, 1, 1, 1,
1.543504, -1.669377, 2.681084, 1, 1, 1, 1, 1,
1.549427, -0.05140093, 2.486443, 1, 1, 1, 1, 1,
1.580914, 0.04805192, 0.6594902, 1, 1, 1, 1, 1,
1.584057, 0.6583297, -0.01832163, 1, 1, 1, 1, 1,
1.588031, -0.7809211, 1.554358, 1, 1, 1, 1, 1,
1.59155, 0.7111248, 1.054445, 1, 1, 1, 1, 1,
1.594647, -0.3588216, 1.149336, 1, 1, 1, 1, 1,
1.595696, 0.061963, 0.2611398, 1, 1, 1, 1, 1,
1.616686, 0.6772586, 1.664209, 1, 1, 1, 1, 1,
1.649546, 0.05458362, 1.970272, 1, 1, 1, 1, 1,
1.671606, 0.2572421, 1.886724, 1, 1, 1, 1, 1,
1.681616, 0.4574318, 1.385324, 1, 1, 1, 1, 1,
1.687505, 0.0007029284, 1.498888, 1, 1, 1, 1, 1,
1.692281, -0.313825, 1.961585, 1, 1, 1, 1, 1,
1.701277, -1.238032, 2.916969, 0, 0, 1, 1, 1,
1.738263, -1.112058, 1.809672, 1, 0, 0, 1, 1,
1.74762, 0.5071289, 2.007173, 1, 0, 0, 1, 1,
1.747849, -0.0433148, 2.078016, 1, 0, 0, 1, 1,
1.751127, -0.399353, 2.079507, 1, 0, 0, 1, 1,
1.765436, 0.724349, 2.581657, 1, 0, 0, 1, 1,
1.771656, 0.2313801, -0.9594651, 0, 0, 0, 1, 1,
1.77283, -0.6677207, 1.06656, 0, 0, 0, 1, 1,
1.794828, 1.12415, 1.646801, 0, 0, 0, 1, 1,
1.796792, 0.948801, 0.7376893, 0, 0, 0, 1, 1,
1.798528, 0.1122448, 1.938119, 0, 0, 0, 1, 1,
1.801127, 0.8285643, 2.266163, 0, 0, 0, 1, 1,
1.804467, -0.02336695, 1.333092, 0, 0, 0, 1, 1,
1.820521, -0.1724087, 0.6825145, 1, 1, 1, 1, 1,
1.823877, 0.3626981, -0.7500666, 1, 1, 1, 1, 1,
1.829508, -0.8638601, 3.597836, 1, 1, 1, 1, 1,
1.844759, 0.6904488, 0.622999, 1, 1, 1, 1, 1,
1.850244, 0.6342934, 3.306834, 1, 1, 1, 1, 1,
1.895786, -0.5304791, 2.060498, 1, 1, 1, 1, 1,
1.907509, 2.296999, -0.2094717, 1, 1, 1, 1, 1,
1.911799, 0.09712302, 0.6219431, 1, 1, 1, 1, 1,
1.916614, -0.4154176, 2.584453, 1, 1, 1, 1, 1,
1.959952, -0.2625063, 2.31842, 1, 1, 1, 1, 1,
1.960823, -0.08701922, 2.173146, 1, 1, 1, 1, 1,
1.9675, 0.6355343, 2.802617, 1, 1, 1, 1, 1,
1.967967, -1.578742, 1.287636, 1, 1, 1, 1, 1,
2.036395, 0.7332677, 0.2916207, 1, 1, 1, 1, 1,
2.041863, -0.6546463, 1.808841, 1, 1, 1, 1, 1,
2.041993, -0.482601, 0.9195745, 0, 0, 1, 1, 1,
2.069792, 0.4877135, 0.8885563, 1, 0, 0, 1, 1,
2.247602, -0.4614147, 1.4047, 1, 0, 0, 1, 1,
2.250105, 0.2271588, 0.3660267, 1, 0, 0, 1, 1,
2.276403, -1.44981, 2.924938, 1, 0, 0, 1, 1,
2.488588, -1.678539, 2.720214, 1, 0, 0, 1, 1,
2.499702, -0.2715572, 2.764897, 0, 0, 0, 1, 1,
2.500778, 0.6938574, 2.637668, 0, 0, 0, 1, 1,
2.649564, 1.602282, 0.4842279, 0, 0, 0, 1, 1,
2.66595, -0.02472184, 1.969959, 0, 0, 0, 1, 1,
2.741728, -0.2009584, 3.926332, 0, 0, 0, 1, 1,
2.755013, 0.3339278, 0.04804152, 0, 0, 0, 1, 1,
2.806105, -1.547975, 1.207478, 0, 0, 0, 1, 1,
2.947211, 1.346461, 1.375343, 1, 1, 1, 1, 1,
2.956381, -0.2783746, 1.538381, 1, 1, 1, 1, 1,
2.98236, -0.135132, 3.700708, 1, 1, 1, 1, 1,
2.982718, 2.403097, 0.7114468, 1, 1, 1, 1, 1,
3.167531, -1.00196, 3.988037, 1, 1, 1, 1, 1,
3.209591, -0.3794295, 0.6014974, 1, 1, 1, 1, 1,
3.304832, 2.016648, 2.59065, 1, 1, 1, 1, 1
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
var radius = 9.460109;
var distance = 33.22823;
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
mvMatrix.translate( -0.06424713, -0.210991, -0.1333067 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22823);
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
