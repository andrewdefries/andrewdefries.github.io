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
-4.084295, -1.065307, 0.4771795, 1, 0, 0, 1,
-2.824545, -0.6460986, -1.084475, 1, 0.007843138, 0, 1,
-2.617554, -1.052456, -1.222697, 1, 0.01176471, 0, 1,
-2.544843, -0.01414597, -0.9954847, 1, 0.01960784, 0, 1,
-2.502885, -0.3886998, -0.3303857, 1, 0.02352941, 0, 1,
-2.489039, -0.3323052, -1.467242, 1, 0.03137255, 0, 1,
-2.479087, 0.5823323, -1.253545, 1, 0.03529412, 0, 1,
-2.446278, 0.7391096, -1.120263, 1, 0.04313726, 0, 1,
-2.440855, -1.212691, -1.651421, 1, 0.04705882, 0, 1,
-2.370273, 0.2011368, -0.6360545, 1, 0.05490196, 0, 1,
-2.343603, 0.01199093, -1.38641, 1, 0.05882353, 0, 1,
-2.33481, 1.088733, -3.266474, 1, 0.06666667, 0, 1,
-2.320159, 2.301147, 2.398793, 1, 0.07058824, 0, 1,
-2.290407, 0.6166165, -2.05523, 1, 0.07843138, 0, 1,
-2.279255, 0.2955022, -1.53939, 1, 0.08235294, 0, 1,
-2.278766, 0.5646083, -3.801075, 1, 0.09019608, 0, 1,
-2.257054, -0.5682508, -1.59607, 1, 0.09411765, 0, 1,
-2.234349, 1.039245, -0.7695817, 1, 0.1019608, 0, 1,
-2.196622, -0.02602668, -2.455248, 1, 0.1098039, 0, 1,
-2.179014, 0.04044182, -1.906613, 1, 0.1137255, 0, 1,
-2.147302, 0.3980889, -2.139101, 1, 0.1215686, 0, 1,
-2.133114, 0.1343989, -1.602526, 1, 0.1254902, 0, 1,
-2.088347, -0.09823611, -1.296354, 1, 0.1333333, 0, 1,
-2.047694, 0.8559471, 0.3154959, 1, 0.1372549, 0, 1,
-2.010246, -0.3915892, -0.2112933, 1, 0.145098, 0, 1,
-1.980225, 0.04076087, -0.01344431, 1, 0.1490196, 0, 1,
-1.953647, -0.347522, -2.747938, 1, 0.1568628, 0, 1,
-1.950524, -0.04351242, -3.795081, 1, 0.1607843, 0, 1,
-1.943391, -0.04262014, -3.19839, 1, 0.1686275, 0, 1,
-1.936573, -0.0048816, -1.548907, 1, 0.172549, 0, 1,
-1.933976, 0.78253, -2.370404, 1, 0.1803922, 0, 1,
-1.932448, -0.5581691, -2.248561, 1, 0.1843137, 0, 1,
-1.923283, -1.044627, -1.370266, 1, 0.1921569, 0, 1,
-1.900963, 0.6099437, -2.335029, 1, 0.1960784, 0, 1,
-1.896791, 0.08713129, -2.005233, 1, 0.2039216, 0, 1,
-1.889838, 0.08287995, -0.361304, 1, 0.2117647, 0, 1,
-1.884356, 0.0231811, -1.345668, 1, 0.2156863, 0, 1,
-1.879063, 0.9389825, -0.6930853, 1, 0.2235294, 0, 1,
-1.86729, 1.578014, -0.6043106, 1, 0.227451, 0, 1,
-1.84996, 1.755336, -0.4158539, 1, 0.2352941, 0, 1,
-1.839847, -0.5606274, -2.303104, 1, 0.2392157, 0, 1,
-1.834299, -0.2343716, -2.633793, 1, 0.2470588, 0, 1,
-1.81864, -0.3613331, -4.148448, 1, 0.2509804, 0, 1,
-1.818247, 2.44974, -1.237458, 1, 0.2588235, 0, 1,
-1.807424, -0.6037221, -1.892331, 1, 0.2627451, 0, 1,
-1.805562, 0.4165107, -0.8617327, 1, 0.2705882, 0, 1,
-1.790734, 0.1294095, -2.179666, 1, 0.2745098, 0, 1,
-1.783315, -0.3394104, -2.6018, 1, 0.282353, 0, 1,
-1.782774, -1.171041, -3.089027, 1, 0.2862745, 0, 1,
-1.781876, -0.3240762, -3.664085, 1, 0.2941177, 0, 1,
-1.775387, -1.505621, -2.803839, 1, 0.3019608, 0, 1,
-1.768954, -0.2522717, -0.1400827, 1, 0.3058824, 0, 1,
-1.754597, -0.1411949, -0.1598277, 1, 0.3137255, 0, 1,
-1.731886, 0.8977405, -2.002023, 1, 0.3176471, 0, 1,
-1.729798, 0.4284929, -0.9427311, 1, 0.3254902, 0, 1,
-1.718604, 0.955791, -2.312021, 1, 0.3294118, 0, 1,
-1.713599, -1.6746, -1.998919, 1, 0.3372549, 0, 1,
-1.709111, 0.2239384, -1.336801, 1, 0.3411765, 0, 1,
-1.694686, 0.3289587, -2.992992, 1, 0.3490196, 0, 1,
-1.694158, -0.71583, -0.5919359, 1, 0.3529412, 0, 1,
-1.683137, -0.0525528, -0.9538867, 1, 0.3607843, 0, 1,
-1.680932, 0.9400795, -0.2770192, 1, 0.3647059, 0, 1,
-1.674642, 0.04761365, -1.979941, 1, 0.372549, 0, 1,
-1.672405, 1.012303, -0.9662604, 1, 0.3764706, 0, 1,
-1.657888, 1.499052, -0.2055821, 1, 0.3843137, 0, 1,
-1.650429, -3.141298, -4.599659, 1, 0.3882353, 0, 1,
-1.631936, -0.5760404, -2.019304, 1, 0.3960784, 0, 1,
-1.62888, 1.071475, -0.9427652, 1, 0.4039216, 0, 1,
-1.626115, 0.7138959, -1.117995, 1, 0.4078431, 0, 1,
-1.614789, -1.183191, -2.696096, 1, 0.4156863, 0, 1,
-1.606464, 0.2375297, -1.700933, 1, 0.4196078, 0, 1,
-1.582522, 0.8690354, -1.993133, 1, 0.427451, 0, 1,
-1.580168, -0.7780123, -2.081957, 1, 0.4313726, 0, 1,
-1.579807, -1.850358, -1.548306, 1, 0.4392157, 0, 1,
-1.565334, -0.8875408, -2.8906, 1, 0.4431373, 0, 1,
-1.54985, -0.976248, -4.216198, 1, 0.4509804, 0, 1,
-1.522834, 0.3594146, -2.602096, 1, 0.454902, 0, 1,
-1.499169, -1.102837, -1.700435, 1, 0.4627451, 0, 1,
-1.49473, -0.8050646, -1.251091, 1, 0.4666667, 0, 1,
-1.491301, 1.094855, -0.8166779, 1, 0.4745098, 0, 1,
-1.483369, 2.027589, -0.7438832, 1, 0.4784314, 0, 1,
-1.473009, -0.5941974, 0.07892297, 1, 0.4862745, 0, 1,
-1.446897, -0.5815286, -2.334058, 1, 0.4901961, 0, 1,
-1.434633, -0.1812421, -1.185173, 1, 0.4980392, 0, 1,
-1.428084, -1.301096, -2.790192, 1, 0.5058824, 0, 1,
-1.422636, -0.5034698, -1.953319, 1, 0.509804, 0, 1,
-1.420519, -0.6728616, -0.4235843, 1, 0.5176471, 0, 1,
-1.415305, 1.063148, 0.2919104, 1, 0.5215687, 0, 1,
-1.405794, -0.7713323, -1.650604, 1, 0.5294118, 0, 1,
-1.405085, -1.335009, -4.411388, 1, 0.5333334, 0, 1,
-1.404389, -0.1045318, -0.6944584, 1, 0.5411765, 0, 1,
-1.39382, 0.5573975, -2.228742, 1, 0.5450981, 0, 1,
-1.375508, 1.066428, -1.888994, 1, 0.5529412, 0, 1,
-1.367349, -1.492079, -1.34151, 1, 0.5568628, 0, 1,
-1.361258, -1.779054, -2.347497, 1, 0.5647059, 0, 1,
-1.35749, 0.1943818, -0.9184719, 1, 0.5686275, 0, 1,
-1.344741, 0.8345301, -1.720191, 1, 0.5764706, 0, 1,
-1.344388, 0.7866091, -1.915471, 1, 0.5803922, 0, 1,
-1.341681, -1.280199, -1.242724, 1, 0.5882353, 0, 1,
-1.341171, -0.7119038, -0.6472949, 1, 0.5921569, 0, 1,
-1.334692, -1.708015, -1.844444, 1, 0.6, 0, 1,
-1.329127, -0.2316331, -3.034006, 1, 0.6078432, 0, 1,
-1.325903, 0.03306041, 0.8237012, 1, 0.6117647, 0, 1,
-1.325483, 1.034642, -1.37818, 1, 0.6196079, 0, 1,
-1.31361, -1.14731, -2.037917, 1, 0.6235294, 0, 1,
-1.310176, -0.3964586, -3.314022, 1, 0.6313726, 0, 1,
-1.301908, 0.3812976, -1.420044, 1, 0.6352941, 0, 1,
-1.3019, -0.7155795, -2.493374, 1, 0.6431373, 0, 1,
-1.285147, -0.3960686, -0.6609737, 1, 0.6470588, 0, 1,
-1.279678, 0.1834231, 0.4828433, 1, 0.654902, 0, 1,
-1.276799, 0.6838707, -1.805334, 1, 0.6588235, 0, 1,
-1.266016, 0.5234814, -0.9910929, 1, 0.6666667, 0, 1,
-1.263884, -0.9465656, -1.782075, 1, 0.6705883, 0, 1,
-1.262838, 0.8447809, -2.152949, 1, 0.6784314, 0, 1,
-1.262193, -0.02258504, -1.347663, 1, 0.682353, 0, 1,
-1.261149, -1.262959, -2.218085, 1, 0.6901961, 0, 1,
-1.254716, 0.395339, -1.711607, 1, 0.6941177, 0, 1,
-1.247266, 0.5112295, -0.5671831, 1, 0.7019608, 0, 1,
-1.242802, 0.8730367, -1.915408, 1, 0.7098039, 0, 1,
-1.23442, -1.09753, -3.342401, 1, 0.7137255, 0, 1,
-1.19, -0.4860889, 0.7478586, 1, 0.7215686, 0, 1,
-1.188428, -1.254379, -3.063944, 1, 0.7254902, 0, 1,
-1.187264, 0.8865783, 0.155249, 1, 0.7333333, 0, 1,
-1.180388, -2.187181, -3.641632, 1, 0.7372549, 0, 1,
-1.17926, -1.749181, -3.66945, 1, 0.7450981, 0, 1,
-1.178456, -1.678029, -3.468764, 1, 0.7490196, 0, 1,
-1.176035, -0.1802033, -1.112283, 1, 0.7568628, 0, 1,
-1.174284, 0.2824726, -0.001214297, 1, 0.7607843, 0, 1,
-1.154235, 0.8035355, -0.6521767, 1, 0.7686275, 0, 1,
-1.153747, 1.671198, -0.2143589, 1, 0.772549, 0, 1,
-1.151749, -0.1632756, -2.482655, 1, 0.7803922, 0, 1,
-1.146881, -0.08472966, -0.1465915, 1, 0.7843137, 0, 1,
-1.142521, -0.2338625, -1.875464, 1, 0.7921569, 0, 1,
-1.133344, -0.2685898, -2.765177, 1, 0.7960784, 0, 1,
-1.126145, 0.214902, -1.886015, 1, 0.8039216, 0, 1,
-1.121557, 0.4466946, -2.202526, 1, 0.8117647, 0, 1,
-1.100304, 2.036713, -0.880533, 1, 0.8156863, 0, 1,
-1.094254, 1.009891, -1.318767, 1, 0.8235294, 0, 1,
-1.093294, 0.9536605, 0.2668754, 1, 0.827451, 0, 1,
-1.090961, 0.00161054, -2.143188, 1, 0.8352941, 0, 1,
-1.08521, -1.14929, -3.568191, 1, 0.8392157, 0, 1,
-1.08301, 0.4096332, -1.304699, 1, 0.8470588, 0, 1,
-1.082287, 1.642681, -2.125177, 1, 0.8509804, 0, 1,
-1.071909, 0.2270606, -0.2079963, 1, 0.8588235, 0, 1,
-1.066417, 0.5703133, -1.036803, 1, 0.8627451, 0, 1,
-1.065062, -1.239189, -3.082546, 1, 0.8705882, 0, 1,
-1.064294, 0.6160818, -1.102555, 1, 0.8745098, 0, 1,
-1.050169, -1.441276, -3.805128, 1, 0.8823529, 0, 1,
-1.047014, -0.5450121, -1.4015, 1, 0.8862745, 0, 1,
-1.032454, 0.639157, -0.9210896, 1, 0.8941177, 0, 1,
-1.025372, 0.4650031, -0.5307829, 1, 0.8980392, 0, 1,
-1.022769, 1.315064, -1.994016, 1, 0.9058824, 0, 1,
-1.022697, -0.4103888, -0.5041713, 1, 0.9137255, 0, 1,
-1.021714, -0.3480474, -1.444107, 1, 0.9176471, 0, 1,
-1.01568, 0.5301223, 0.06342972, 1, 0.9254902, 0, 1,
-1.00679, 1.250306, 0.2536626, 1, 0.9294118, 0, 1,
-1.000333, 1.206127, -0.7017702, 1, 0.9372549, 0, 1,
-0.9796327, 0.6951624, -0.09094101, 1, 0.9411765, 0, 1,
-0.9693173, -1.052146, -1.99666, 1, 0.9490196, 0, 1,
-0.968814, -0.2441683, -3.408443, 1, 0.9529412, 0, 1,
-0.9662529, 0.1748081, -1.635557, 1, 0.9607843, 0, 1,
-0.961137, -1.235822, -2.608029, 1, 0.9647059, 0, 1,
-0.9591035, 2.269712, 0.1746502, 1, 0.972549, 0, 1,
-0.9515995, 1.360825, -1.184826, 1, 0.9764706, 0, 1,
-0.9509908, 0.05622041, -1.581451, 1, 0.9843137, 0, 1,
-0.9396207, -0.6155726, -2.890016, 1, 0.9882353, 0, 1,
-0.930399, 0.2926195, -2.777662, 1, 0.9960784, 0, 1,
-0.9275044, -0.1733227, -3.011407, 0.9960784, 1, 0, 1,
-0.9237012, 0.3267756, -0.8636985, 0.9921569, 1, 0, 1,
-0.91693, -1.428221, -3.193393, 0.9843137, 1, 0, 1,
-0.9124078, 0.2617362, -0.6182606, 0.9803922, 1, 0, 1,
-0.9101392, 1.115532, 0.05899785, 0.972549, 1, 0, 1,
-0.9094469, 0.5586067, 0.2556966, 0.9686275, 1, 0, 1,
-0.9089753, 0.3479301, -1.624464, 0.9607843, 1, 0, 1,
-0.9044289, -1.609148, -1.902188, 0.9568627, 1, 0, 1,
-0.8987198, 1.834746, -0.5362204, 0.9490196, 1, 0, 1,
-0.8890476, 0.05573497, -0.9694499, 0.945098, 1, 0, 1,
-0.8735706, -0.3500628, -3.318169, 0.9372549, 1, 0, 1,
-0.8726662, 0.4686358, -1.740389, 0.9333333, 1, 0, 1,
-0.8705618, 2.057406, -1.201113, 0.9254902, 1, 0, 1,
-0.8640916, -0.6476901, -3.577933, 0.9215686, 1, 0, 1,
-0.8621487, 0.751222, -0.1530242, 0.9137255, 1, 0, 1,
-0.8556374, 0.5812322, -0.2236549, 0.9098039, 1, 0, 1,
-0.8549901, 3.000974, -0.1809182, 0.9019608, 1, 0, 1,
-0.8546029, 0.02849919, -2.453641, 0.8941177, 1, 0, 1,
-0.8456206, -0.3927554, -0.531023, 0.8901961, 1, 0, 1,
-0.8407648, 3.269075, -0.5396512, 0.8823529, 1, 0, 1,
-0.8396144, 1.171074, 0.2140513, 0.8784314, 1, 0, 1,
-0.838601, -0.08332312, -1.72466, 0.8705882, 1, 0, 1,
-0.8376843, -0.5110451, -3.085523, 0.8666667, 1, 0, 1,
-0.8332775, -0.2541942, -2.995183, 0.8588235, 1, 0, 1,
-0.8324299, 0.7513032, -1.26975, 0.854902, 1, 0, 1,
-0.8313326, -0.3061256, -2.958994, 0.8470588, 1, 0, 1,
-0.8264928, -1.387822, -2.790185, 0.8431373, 1, 0, 1,
-0.8103795, 0.7228693, 0.4396319, 0.8352941, 1, 0, 1,
-0.8058692, -1.149277, -2.354306, 0.8313726, 1, 0, 1,
-0.8008891, -0.09997078, -3.204012, 0.8235294, 1, 0, 1,
-0.8000978, -0.5577943, -1.26868, 0.8196079, 1, 0, 1,
-0.7987522, 0.08019588, -1.729362, 0.8117647, 1, 0, 1,
-0.7945892, -1.109222, -2.35967, 0.8078431, 1, 0, 1,
-0.7942896, -0.727229, -3.900061, 0.8, 1, 0, 1,
-0.7941171, 1.422589, 1.185869, 0.7921569, 1, 0, 1,
-0.7862304, -1.64124, -3.199897, 0.7882353, 1, 0, 1,
-0.7847943, -1.054517, -1.367395, 0.7803922, 1, 0, 1,
-0.7830679, 0.8048914, -1.615717, 0.7764706, 1, 0, 1,
-0.7814369, 1.279119, -1.445123, 0.7686275, 1, 0, 1,
-0.7793897, -0.6067405, -3.130962, 0.7647059, 1, 0, 1,
-0.7784721, -0.6717396, -2.152471, 0.7568628, 1, 0, 1,
-0.7756918, -0.2397231, -1.814148, 0.7529412, 1, 0, 1,
-0.7660082, -1.019726, -3.367169, 0.7450981, 1, 0, 1,
-0.7634677, 0.0513306, -2.605479, 0.7411765, 1, 0, 1,
-0.7593163, 0.5309196, 2.019261, 0.7333333, 1, 0, 1,
-0.7513077, 0.1910745, -1.353364, 0.7294118, 1, 0, 1,
-0.7508185, 1.082133, -0.176085, 0.7215686, 1, 0, 1,
-0.7491354, 0.1297374, -1.527608, 0.7176471, 1, 0, 1,
-0.745576, -0.9900174, -3.882839, 0.7098039, 1, 0, 1,
-0.7451019, 1.510401, -0.6029843, 0.7058824, 1, 0, 1,
-0.7395162, -0.4920932, -1.660732, 0.6980392, 1, 0, 1,
-0.7290806, 0.1955308, -0.9498074, 0.6901961, 1, 0, 1,
-0.7281951, 0.7032617, -0.4610074, 0.6862745, 1, 0, 1,
-0.7281547, -0.1355401, -1.366478, 0.6784314, 1, 0, 1,
-0.7224007, -1.184218, -2.878328, 0.6745098, 1, 0, 1,
-0.7213101, -0.2852208, 0.1117706, 0.6666667, 1, 0, 1,
-0.7199326, 0.5251538, -0.1481446, 0.6627451, 1, 0, 1,
-0.7188601, -0.4283569, -1.184008, 0.654902, 1, 0, 1,
-0.7128468, -0.2543541, -2.071918, 0.6509804, 1, 0, 1,
-0.7118959, 0.186626, -2.2905, 0.6431373, 1, 0, 1,
-0.7105816, -0.108313, -4.420695, 0.6392157, 1, 0, 1,
-0.695453, 0.6982093, -2.065769, 0.6313726, 1, 0, 1,
-0.6936073, -1.335167, -3.431937, 0.627451, 1, 0, 1,
-0.690094, 1.157452, -0.7340157, 0.6196079, 1, 0, 1,
-0.6882978, -0.9831101, -2.075888, 0.6156863, 1, 0, 1,
-0.6819692, -1.069611, -2.637803, 0.6078432, 1, 0, 1,
-0.679592, 0.4530171, -1.91367, 0.6039216, 1, 0, 1,
-0.6789935, -0.2756804, -2.037787, 0.5960785, 1, 0, 1,
-0.6769927, -0.3408329, -2.228592, 0.5882353, 1, 0, 1,
-0.6769071, -0.6904965, -2.529553, 0.5843138, 1, 0, 1,
-0.668024, -1.076559, -3.464016, 0.5764706, 1, 0, 1,
-0.6648366, 0.7677538, 0.1153306, 0.572549, 1, 0, 1,
-0.6471509, -0.2914527, 0.9200017, 0.5647059, 1, 0, 1,
-0.6467816, 0.895538, 0.3251337, 0.5607843, 1, 0, 1,
-0.6448011, 0.6511262, -0.09095164, 0.5529412, 1, 0, 1,
-0.6417044, 0.4072844, -0.8092904, 0.5490196, 1, 0, 1,
-0.63837, -0.8903112, -3.776065, 0.5411765, 1, 0, 1,
-0.6377416, -0.7616658, -3.043639, 0.5372549, 1, 0, 1,
-0.6321408, -0.7170215, -1.135148, 0.5294118, 1, 0, 1,
-0.6273285, 0.8061637, 0.4159209, 0.5254902, 1, 0, 1,
-0.6252332, 0.6884671, -1.248844, 0.5176471, 1, 0, 1,
-0.6246656, 0.01763808, -1.224264, 0.5137255, 1, 0, 1,
-0.6151237, -0.6457221, -1.587368, 0.5058824, 1, 0, 1,
-0.614602, -1.700518, -1.181149, 0.5019608, 1, 0, 1,
-0.6121368, 0.6684555, -2.113646, 0.4941176, 1, 0, 1,
-0.6073348, -0.3771207, -3.862141, 0.4862745, 1, 0, 1,
-0.6057319, 0.1104983, -1.78023, 0.4823529, 1, 0, 1,
-0.6053684, 0.2895127, -1.056171, 0.4745098, 1, 0, 1,
-0.6043482, -0.4722165, -3.064274, 0.4705882, 1, 0, 1,
-0.6027436, 1.453832, 0.7868973, 0.4627451, 1, 0, 1,
-0.6022631, 1.083113, -0.5887808, 0.4588235, 1, 0, 1,
-0.6000155, 1.337051, -1.052737, 0.4509804, 1, 0, 1,
-0.5989671, 0.3984264, 0.2089128, 0.4470588, 1, 0, 1,
-0.5984548, 1.515001, 0.2532311, 0.4392157, 1, 0, 1,
-0.5938233, 0.6968617, -0.6396717, 0.4352941, 1, 0, 1,
-0.5913624, -1.199082, -2.207967, 0.427451, 1, 0, 1,
-0.5897163, 0.3827721, -0.3352436, 0.4235294, 1, 0, 1,
-0.5882257, -0.8117895, -1.502518, 0.4156863, 1, 0, 1,
-0.5842268, 1.215733, 0.1597174, 0.4117647, 1, 0, 1,
-0.582152, 0.1265107, -2.151933, 0.4039216, 1, 0, 1,
-0.5815095, 0.04031521, -1.664715, 0.3960784, 1, 0, 1,
-0.579964, -1.166705, -2.058732, 0.3921569, 1, 0, 1,
-0.5791874, -1.79189, -2.383363, 0.3843137, 1, 0, 1,
-0.5783967, -1.414528, -2.08983, 0.3803922, 1, 0, 1,
-0.575781, 0.6246305, -0.8219836, 0.372549, 1, 0, 1,
-0.5719696, 0.1604774, -1.323422, 0.3686275, 1, 0, 1,
-0.5686764, -0.2542622, -0.4126014, 0.3607843, 1, 0, 1,
-0.5633762, -0.3872658, -2.486014, 0.3568628, 1, 0, 1,
-0.5628958, 1.174049, -0.4032998, 0.3490196, 1, 0, 1,
-0.5620534, -0.1352879, -1.131739, 0.345098, 1, 0, 1,
-0.558242, -0.1006843, -1.955147, 0.3372549, 1, 0, 1,
-0.5526721, 0.2041364, 0.1792559, 0.3333333, 1, 0, 1,
-0.5510372, 2.119522, -1.489396, 0.3254902, 1, 0, 1,
-0.550851, -0.4258607, -2.521734, 0.3215686, 1, 0, 1,
-0.5507485, -0.9459946, -2.225994, 0.3137255, 1, 0, 1,
-0.5479457, 0.333439, -1.915973, 0.3098039, 1, 0, 1,
-0.5472314, -2.291582, -2.570129, 0.3019608, 1, 0, 1,
-0.5456165, 0.745002, -2.236977, 0.2941177, 1, 0, 1,
-0.5447752, 0.8592145, -0.9740883, 0.2901961, 1, 0, 1,
-0.5428646, -1.045794, -2.185662, 0.282353, 1, 0, 1,
-0.5425329, 0.5794576, -0.9344041, 0.2784314, 1, 0, 1,
-0.5396818, -0.02192905, -1.319008, 0.2705882, 1, 0, 1,
-0.53474, -0.3050467, -1.294418, 0.2666667, 1, 0, 1,
-0.5342262, 0.2200774, -1.313717, 0.2588235, 1, 0, 1,
-0.5342104, -0.1061532, -1.938023, 0.254902, 1, 0, 1,
-0.5297667, -0.05931832, -0.9340753, 0.2470588, 1, 0, 1,
-0.5293897, -0.9157847, -1.503091, 0.2431373, 1, 0, 1,
-0.5278429, 0.2212262, -0.2496075, 0.2352941, 1, 0, 1,
-0.5228291, -0.9235371, -2.327046, 0.2313726, 1, 0, 1,
-0.5158192, 0.3106275, -2.087474, 0.2235294, 1, 0, 1,
-0.5139066, 2.077776, -1.768649, 0.2196078, 1, 0, 1,
-0.5112851, -0.3457346, -1.382455, 0.2117647, 1, 0, 1,
-0.5108485, 1.788116, -0.2710242, 0.2078431, 1, 0, 1,
-0.4934234, 0.5529827, -0.8439598, 0.2, 1, 0, 1,
-0.4895703, -1.068638, -1.811862, 0.1921569, 1, 0, 1,
-0.4891697, 0.5557084, -1.029359, 0.1882353, 1, 0, 1,
-0.4881002, 0.8215952, 0.06862714, 0.1803922, 1, 0, 1,
-0.48592, 0.5788913, -1.276957, 0.1764706, 1, 0, 1,
-0.4855396, -0.09946887, 0.3782284, 0.1686275, 1, 0, 1,
-0.4835566, -1.081915, -1.554838, 0.1647059, 1, 0, 1,
-0.4826188, -0.04038436, -1.520473, 0.1568628, 1, 0, 1,
-0.457754, 1.543872, 0.5285819, 0.1529412, 1, 0, 1,
-0.4569081, 1.496621, -0.4585392, 0.145098, 1, 0, 1,
-0.4568359, -0.6667067, -1.86423, 0.1411765, 1, 0, 1,
-0.4476259, 2.661433, -0.243367, 0.1333333, 1, 0, 1,
-0.4453215, -1.777401, -1.883632, 0.1294118, 1, 0, 1,
-0.4406596, 0.975256, -1.490178, 0.1215686, 1, 0, 1,
-0.4365278, 0.2609191, -1.12321, 0.1176471, 1, 0, 1,
-0.4339772, 1.166164, 0.145447, 0.1098039, 1, 0, 1,
-0.4324877, -1.329942, -4.322537, 0.1058824, 1, 0, 1,
-0.4303459, 0.8291119, -1.55201, 0.09803922, 1, 0, 1,
-0.4288308, 0.7560183, -0.375611, 0.09019608, 1, 0, 1,
-0.4249445, 0.6563571, -0.3984677, 0.08627451, 1, 0, 1,
-0.4225264, 0.5462579, 0.6686018, 0.07843138, 1, 0, 1,
-0.4211903, -0.01891414, -1.733938, 0.07450981, 1, 0, 1,
-0.4173596, 1.509858, -1.315573, 0.06666667, 1, 0, 1,
-0.4168026, 1.270177, -1.147269, 0.0627451, 1, 0, 1,
-0.41269, 0.6624243, -0.1626785, 0.05490196, 1, 0, 1,
-0.4120475, 0.0355814, -1.680348, 0.05098039, 1, 0, 1,
-0.4114696, -0.7855725, -1.537765, 0.04313726, 1, 0, 1,
-0.4061297, 0.03443655, -0.767486, 0.03921569, 1, 0, 1,
-0.404552, 0.5334035, -0.5794725, 0.03137255, 1, 0, 1,
-0.4035573, 0.1291308, -2.155994, 0.02745098, 1, 0, 1,
-0.403129, 0.2033613, 0.1747421, 0.01960784, 1, 0, 1,
-0.4030191, 0.1492674, -2.426947, 0.01568628, 1, 0, 1,
-0.4018593, 0.6417053, -1.169469, 0.007843138, 1, 0, 1,
-0.4010334, -0.8263739, -2.596701, 0.003921569, 1, 0, 1,
-0.3900519, -1.986948, -3.708776, 0, 1, 0.003921569, 1,
-0.3889487, -0.5410676, -0.4177193, 0, 1, 0.01176471, 1,
-0.3887779, 1.692102, 2.600965, 0, 1, 0.01568628, 1,
-0.3875593, -0.1424178, -0.5706047, 0, 1, 0.02352941, 1,
-0.3816938, -1.026913, -2.333467, 0, 1, 0.02745098, 1,
-0.379543, 0.1322947, -1.188738, 0, 1, 0.03529412, 1,
-0.3792815, 1.221071, -0.3888527, 0, 1, 0.03921569, 1,
-0.376163, -0.6303116, -4.119675, 0, 1, 0.04705882, 1,
-0.3726569, 0.3927611, -1.079419, 0, 1, 0.05098039, 1,
-0.3691121, 0.6236787, 0.3689289, 0, 1, 0.05882353, 1,
-0.3669705, -1.363858, -2.509605, 0, 1, 0.0627451, 1,
-0.3622079, -2.083908, -3.928964, 0, 1, 0.07058824, 1,
-0.3610641, 0.04785709, -3.729479, 0, 1, 0.07450981, 1,
-0.3601374, 0.9062095, 1.482189, 0, 1, 0.08235294, 1,
-0.3595749, -0.2922044, -2.489478, 0, 1, 0.08627451, 1,
-0.3582526, -0.556062, -1.420083, 0, 1, 0.09411765, 1,
-0.3459257, 0.4230903, -1.276316, 0, 1, 0.1019608, 1,
-0.3442141, -1.653108, -4.292233, 0, 1, 0.1058824, 1,
-0.3402632, 1.673082, 0.3431149, 0, 1, 0.1137255, 1,
-0.3386318, -1.356704, -2.77796, 0, 1, 0.1176471, 1,
-0.3379066, 0.7032259, -1.846233, 0, 1, 0.1254902, 1,
-0.332413, 0.3878004, -0.7386885, 0, 1, 0.1294118, 1,
-0.3285474, 0.1432056, -1.75593, 0, 1, 0.1372549, 1,
-0.3278597, -0.3285929, -1.869334, 0, 1, 0.1411765, 1,
-0.3238438, 0.7755993, -1.486741, 0, 1, 0.1490196, 1,
-0.322911, 0.2901473, -0.601697, 0, 1, 0.1529412, 1,
-0.3219511, -0.360095, -2.960298, 0, 1, 0.1607843, 1,
-0.3169538, 0.4435002, -0.9309547, 0, 1, 0.1647059, 1,
-0.3156822, 0.6617914, -0.9298961, 0, 1, 0.172549, 1,
-0.3139046, -2.568638, -2.30091, 0, 1, 0.1764706, 1,
-0.3127997, 2.866396, -1.653061, 0, 1, 0.1843137, 1,
-0.3103884, 1.571563, -1.385252, 0, 1, 0.1882353, 1,
-0.302391, 1.13676, -0.3716845, 0, 1, 0.1960784, 1,
-0.2998323, 0.7049469, 0.8215094, 0, 1, 0.2039216, 1,
-0.2997783, 0.5291776, -0.00994287, 0, 1, 0.2078431, 1,
-0.2970704, 0.7230285, 0.2588205, 0, 1, 0.2156863, 1,
-0.2951277, 0.9294828, 0.5684381, 0, 1, 0.2196078, 1,
-0.2938333, 0.3194258, 0.392075, 0, 1, 0.227451, 1,
-0.2906768, -1.721813, -2.456341, 0, 1, 0.2313726, 1,
-0.2894987, 1.433685, -0.07144611, 0, 1, 0.2392157, 1,
-0.2772835, 0.5431958, -0.9445646, 0, 1, 0.2431373, 1,
-0.2764756, 0.5447794, -0.1434072, 0, 1, 0.2509804, 1,
-0.2757082, -1.414857, -2.792679, 0, 1, 0.254902, 1,
-0.2737809, -0.4587457, -1.657926, 0, 1, 0.2627451, 1,
-0.2667158, 1.197107, -2.150503, 0, 1, 0.2666667, 1,
-0.2651286, -1.001899, -2.908771, 0, 1, 0.2745098, 1,
-0.262417, 0.187752, 0.2197112, 0, 1, 0.2784314, 1,
-0.258931, -0.4592506, -3.835442, 0, 1, 0.2862745, 1,
-0.2582596, -1.59353, -3.976974, 0, 1, 0.2901961, 1,
-0.2472296, -0.6014217, -1.577138, 0, 1, 0.2980392, 1,
-0.2465147, 0.7008928, -1.14897, 0, 1, 0.3058824, 1,
-0.2384337, -1.288196, -2.62818, 0, 1, 0.3098039, 1,
-0.2352171, 0.3990819, -1.432972, 0, 1, 0.3176471, 1,
-0.2310946, -1.493032, -3.522291, 0, 1, 0.3215686, 1,
-0.2241709, -0.203183, -1.758731, 0, 1, 0.3294118, 1,
-0.2240823, -0.2081805, 0.04193164, 0, 1, 0.3333333, 1,
-0.2235318, 1.715784, 0.8290306, 0, 1, 0.3411765, 1,
-0.2231915, 0.5249575, -2.45745, 0, 1, 0.345098, 1,
-0.2229566, -1.118865, -3.385886, 0, 1, 0.3529412, 1,
-0.2214657, 1.019953, -1.727469, 0, 1, 0.3568628, 1,
-0.220286, 0.1430761, -0.5114704, 0, 1, 0.3647059, 1,
-0.2182258, -0.1156497, -0.7578555, 0, 1, 0.3686275, 1,
-0.2142263, 1.461959, -0.5324107, 0, 1, 0.3764706, 1,
-0.208978, -0.4391065, -3.21179, 0, 1, 0.3803922, 1,
-0.2077136, 0.3305219, -2.168087, 0, 1, 0.3882353, 1,
-0.2043459, 2.228227, 0.3825805, 0, 1, 0.3921569, 1,
-0.1999048, -0.3619777, -1.955626, 0, 1, 0.4, 1,
-0.1968025, -0.0519779, -2.181956, 0, 1, 0.4078431, 1,
-0.1967948, 0.5822371, -1.018016, 0, 1, 0.4117647, 1,
-0.1962149, 0.1678839, -0.4604474, 0, 1, 0.4196078, 1,
-0.195529, 0.7760713, -1.123652, 0, 1, 0.4235294, 1,
-0.1939609, 1.18811, 0.1258613, 0, 1, 0.4313726, 1,
-0.1939166, -1.071022, -4.036781, 0, 1, 0.4352941, 1,
-0.1924593, 0.5559663, -0.241792, 0, 1, 0.4431373, 1,
-0.1915314, -1.084507, -0.6245443, 0, 1, 0.4470588, 1,
-0.1905447, 0.3976783, -0.1898194, 0, 1, 0.454902, 1,
-0.1894945, -0.4031401, -0.8132095, 0, 1, 0.4588235, 1,
-0.1854733, -0.3027039, -1.884411, 0, 1, 0.4666667, 1,
-0.1841652, -0.3877658, -2.564316, 0, 1, 0.4705882, 1,
-0.1839415, 1.40791, -0.5807943, 0, 1, 0.4784314, 1,
-0.1820898, 0.156457, -0.4881961, 0, 1, 0.4823529, 1,
-0.1790473, -0.4054985, -1.218131, 0, 1, 0.4901961, 1,
-0.1786291, -0.5741086, -3.171191, 0, 1, 0.4941176, 1,
-0.1752048, -0.6213508, -4.798196, 0, 1, 0.5019608, 1,
-0.1739485, 1.249692, -0.1525582, 0, 1, 0.509804, 1,
-0.1722015, -0.9629436, -3.719927, 0, 1, 0.5137255, 1,
-0.1674738, 1.496824, -1.332671, 0, 1, 0.5215687, 1,
-0.1634422, -1.418598, -2.470287, 0, 1, 0.5254902, 1,
-0.1633964, 1.052726, -0.08882912, 0, 1, 0.5333334, 1,
-0.1627506, -1.985493, -3.555743, 0, 1, 0.5372549, 1,
-0.1620741, 1.717873, -0.4386367, 0, 1, 0.5450981, 1,
-0.1560275, 0.3593692, -0.2615763, 0, 1, 0.5490196, 1,
-0.1503355, -1.386849, -4.54343, 0, 1, 0.5568628, 1,
-0.1460911, -0.6832768, -2.923406, 0, 1, 0.5607843, 1,
-0.1459532, -0.06574398, -2.20076, 0, 1, 0.5686275, 1,
-0.1446717, 0.5205031, 0.6738321, 0, 1, 0.572549, 1,
-0.1415783, -0.5077894, -2.46546, 0, 1, 0.5803922, 1,
-0.1412166, -0.5947903, -2.675423, 0, 1, 0.5843138, 1,
-0.1406124, -0.8192123, -3.43114, 0, 1, 0.5921569, 1,
-0.1393691, -0.2701726, -1.915225, 0, 1, 0.5960785, 1,
-0.137097, -0.1246111, -3.082191, 0, 1, 0.6039216, 1,
-0.1365108, 0.5524672, -1.495271, 0, 1, 0.6117647, 1,
-0.1333132, 0.2554469, -1.006762, 0, 1, 0.6156863, 1,
-0.1265181, 0.7856017, -0.3136167, 0, 1, 0.6235294, 1,
-0.1232702, 0.3375649, 0.3975795, 0, 1, 0.627451, 1,
-0.1211352, 0.3637484, -2.199711, 0, 1, 0.6352941, 1,
-0.1205007, 0.134465, 0.841388, 0, 1, 0.6392157, 1,
-0.1164776, 0.1792573, -1.283593, 0, 1, 0.6470588, 1,
-0.1160499, -0.9183676, -2.510935, 0, 1, 0.6509804, 1,
-0.1146967, -1.179611, -2.426614, 0, 1, 0.6588235, 1,
-0.1133237, -0.7853883, -4.802171, 0, 1, 0.6627451, 1,
-0.1131929, -1.141516, -3.377127, 0, 1, 0.6705883, 1,
-0.1123, -0.1218565, -1.691876, 0, 1, 0.6745098, 1,
-0.1102698, -0.653362, -3.232686, 0, 1, 0.682353, 1,
-0.1071071, 1.024651, -0.3187362, 0, 1, 0.6862745, 1,
-0.1060833, 0.7131488, 1.175972, 0, 1, 0.6941177, 1,
-0.1030367, 1.984877, 0.1995708, 0, 1, 0.7019608, 1,
-0.09980816, 2.24053, -1.208656, 0, 1, 0.7058824, 1,
-0.09354497, 0.6336857, -1.651921, 0, 1, 0.7137255, 1,
-0.09192891, -2.437576, -4.347894, 0, 1, 0.7176471, 1,
-0.0917104, -0.3451433, -0.9662759, 0, 1, 0.7254902, 1,
-0.08568387, 1.714626, 0.4037513, 0, 1, 0.7294118, 1,
-0.08085226, -1.200407, -2.371549, 0, 1, 0.7372549, 1,
-0.08047425, 0.2891425, 0.5322377, 0, 1, 0.7411765, 1,
-0.07634374, -0.7429695, -3.395828, 0, 1, 0.7490196, 1,
-0.07568359, -0.2450689, -1.773387, 0, 1, 0.7529412, 1,
-0.07310858, -1.085055, -4.123573, 0, 1, 0.7607843, 1,
-0.07183804, -1.326196, -4.548665, 0, 1, 0.7647059, 1,
-0.07175978, 0.1755296, 1.46047, 0, 1, 0.772549, 1,
-0.07110105, 0.06313778, -0.2331054, 0, 1, 0.7764706, 1,
-0.06971955, -0.1704479, -2.298494, 0, 1, 0.7843137, 1,
-0.0686659, -0.0413418, -1.351517, 0, 1, 0.7882353, 1,
-0.06472936, 0.3410325, -0.6158962, 0, 1, 0.7960784, 1,
-0.06457084, -0.4944775, -3.950356, 0, 1, 0.8039216, 1,
-0.06444997, -0.8823712, -2.832263, 0, 1, 0.8078431, 1,
-0.05973122, -0.1542276, -1.19087, 0, 1, 0.8156863, 1,
-0.05518947, 0.1717958, 0.1575872, 0, 1, 0.8196079, 1,
-0.05234013, -0.6509801, -4.735753, 0, 1, 0.827451, 1,
-0.05227713, 0.4116889, -0.2649476, 0, 1, 0.8313726, 1,
-0.05184184, -0.4658217, -3.344648, 0, 1, 0.8392157, 1,
-0.05113312, -0.3987086, -4.119726, 0, 1, 0.8431373, 1,
-0.05043619, 0.1286, 1.393929, 0, 1, 0.8509804, 1,
-0.04676506, 0.5502123, -0.7554422, 0, 1, 0.854902, 1,
-0.04451115, 0.4399656, 1.166426, 0, 1, 0.8627451, 1,
-0.03904527, -1.258818, -5.138815, 0, 1, 0.8666667, 1,
-0.03904084, -0.7278159, -2.115716, 0, 1, 0.8745098, 1,
-0.03617062, -1.148118, -2.91941, 0, 1, 0.8784314, 1,
-0.03013421, 0.445773, -0.2127505, 0, 1, 0.8862745, 1,
-0.02985858, -0.3652076, -2.627559, 0, 1, 0.8901961, 1,
-0.02343346, 0.4526827, -0.5076422, 0, 1, 0.8980392, 1,
-0.02320146, -0.8822445, -3.280959, 0, 1, 0.9058824, 1,
-0.02042362, 0.3409842, 0.5001638, 0, 1, 0.9098039, 1,
-0.01521815, 0.3763991, 0.5350634, 0, 1, 0.9176471, 1,
-0.01471149, -1.018706, -0.6904131, 0, 1, 0.9215686, 1,
-0.01146946, 1.604499, -0.5172016, 0, 1, 0.9294118, 1,
-0.01098787, -1.80152, -3.552461, 0, 1, 0.9333333, 1,
-0.004776066, -0.1580004, -1.601568, 0, 1, 0.9411765, 1,
-0.001070029, 1.294693, -0.5059323, 0, 1, 0.945098, 1,
0.005853854, 1.356174, 1.059807, 0, 1, 0.9529412, 1,
0.007032982, 0.5430189, 0.7693854, 0, 1, 0.9568627, 1,
0.009653379, -1.2265, 3.09389, 0, 1, 0.9647059, 1,
0.01088303, -0.8253163, 3.700767, 0, 1, 0.9686275, 1,
0.0110192, -0.2016046, 3.799226, 0, 1, 0.9764706, 1,
0.01232593, 1.717444, -0.4811427, 0, 1, 0.9803922, 1,
0.01326085, 1.404762, -0.06579392, 0, 1, 0.9882353, 1,
0.01656886, 0.3388825, 0.8231339, 0, 1, 0.9921569, 1,
0.02164426, 0.6231103, -0.7483093, 0, 1, 1, 1,
0.02183276, -0.01642411, 2.095334, 0, 0.9921569, 1, 1,
0.02845962, 0.9654161, 0.4620695, 0, 0.9882353, 1, 1,
0.03042288, -1.459137, 1.342842, 0, 0.9803922, 1, 1,
0.03140352, -0.8548637, 4.283319, 0, 0.9764706, 1, 1,
0.03445617, 0.8778003, 0.1829446, 0, 0.9686275, 1, 1,
0.03585195, 0.8416551, -0.6503159, 0, 0.9647059, 1, 1,
0.03627129, -0.6686511, 4.167734, 0, 0.9568627, 1, 1,
0.0370497, 0.03992857, 1.307395, 0, 0.9529412, 1, 1,
0.03749927, -1.310758, 2.503099, 0, 0.945098, 1, 1,
0.04133185, -0.3529015, 2.829165, 0, 0.9411765, 1, 1,
0.04533274, 1.52428, 2.629978, 0, 0.9333333, 1, 1,
0.04750244, -0.4004772, 2.373552, 0, 0.9294118, 1, 1,
0.04835981, -1.063647, 3.983849, 0, 0.9215686, 1, 1,
0.04947283, -0.5835694, 3.632723, 0, 0.9176471, 1, 1,
0.04958881, -1.645837, 3.610539, 0, 0.9098039, 1, 1,
0.05770588, -0.3665068, 2.668367, 0, 0.9058824, 1, 1,
0.06349658, 0.152134, -0.9512094, 0, 0.8980392, 1, 1,
0.06354395, 1.389076, 0.621264, 0, 0.8901961, 1, 1,
0.06436086, -0.2618341, 3.318498, 0, 0.8862745, 1, 1,
0.06469772, -1.142037, 3.481904, 0, 0.8784314, 1, 1,
0.06541241, -0.715546, 3.283289, 0, 0.8745098, 1, 1,
0.06841865, -0.4120296, 3.570153, 0, 0.8666667, 1, 1,
0.07826953, -0.8010898, 1.631147, 0, 0.8627451, 1, 1,
0.08368458, -0.737027, 5.268545, 0, 0.854902, 1, 1,
0.08678634, -1.044808, 3.082267, 0, 0.8509804, 1, 1,
0.09314223, -1.12117, 3.222891, 0, 0.8431373, 1, 1,
0.09641164, 0.1652562, -1.090142, 0, 0.8392157, 1, 1,
0.1026658, 0.9813278, 0.7817796, 0, 0.8313726, 1, 1,
0.1040338, -0.5512187, 2.222856, 0, 0.827451, 1, 1,
0.1045793, -0.17402, 1.308629, 0, 0.8196079, 1, 1,
0.1053204, 0.3316785, -1.841461, 0, 0.8156863, 1, 1,
0.1069397, -0.4611872, 2.152368, 0, 0.8078431, 1, 1,
0.1123379, -0.4710277, 3.505237, 0, 0.8039216, 1, 1,
0.1141939, 0.1262376, -1.304018, 0, 0.7960784, 1, 1,
0.1144108, -0.03225687, 2.54891, 0, 0.7882353, 1, 1,
0.1158249, 0.6520399, -0.1525081, 0, 0.7843137, 1, 1,
0.1202929, -0.504365, 3.03082, 0, 0.7764706, 1, 1,
0.1245159, -0.46136, 1.666031, 0, 0.772549, 1, 1,
0.128899, 1.191497, -0.1772391, 0, 0.7647059, 1, 1,
0.1291706, 0.8259761, 0.9908202, 0, 0.7607843, 1, 1,
0.1317642, 0.5202509, 0.9061264, 0, 0.7529412, 1, 1,
0.1325489, -0.1309434, 2.803332, 0, 0.7490196, 1, 1,
0.1337208, 1.379003, -1.326433, 0, 0.7411765, 1, 1,
0.1390936, 0.1152951, 0.2221761, 0, 0.7372549, 1, 1,
0.1421493, -0.3701578, -0.4595856, 0, 0.7294118, 1, 1,
0.1428651, -1.189866, 4.469604, 0, 0.7254902, 1, 1,
0.1430581, 1.324367, -0.6079396, 0, 0.7176471, 1, 1,
0.1461294, -0.8596085, 1.107555, 0, 0.7137255, 1, 1,
0.1539542, -0.3939002, 1.829132, 0, 0.7058824, 1, 1,
0.154163, -0.2910326, 2.972221, 0, 0.6980392, 1, 1,
0.1548333, -1.078141, 3.141493, 0, 0.6941177, 1, 1,
0.1581741, -0.6956685, 3.088356, 0, 0.6862745, 1, 1,
0.1645266, 2.022978, 0.9069739, 0, 0.682353, 1, 1,
0.1705291, 0.6810381, 0.2165506, 0, 0.6745098, 1, 1,
0.1705889, -0.2932347, 4.084121, 0, 0.6705883, 1, 1,
0.1710977, -0.1580436, 1.978161, 0, 0.6627451, 1, 1,
0.17113, 0.1585685, 0.3435155, 0, 0.6588235, 1, 1,
0.1718486, 0.5059877, 0.3032492, 0, 0.6509804, 1, 1,
0.1799401, -0.0578331, 1.835818, 0, 0.6470588, 1, 1,
0.1823726, -0.118204, 2.269613, 0, 0.6392157, 1, 1,
0.1833485, -0.1140171, 3.324273, 0, 0.6352941, 1, 1,
0.1898386, -0.01151064, 1.874797, 0, 0.627451, 1, 1,
0.1898996, -1.898706, 2.162586, 0, 0.6235294, 1, 1,
0.1905268, -0.2311245, 1.926212, 0, 0.6156863, 1, 1,
0.1937036, 1.072693, 0.2893478, 0, 0.6117647, 1, 1,
0.1955803, -1.342352, 1.835584, 0, 0.6039216, 1, 1,
0.200211, -0.4845928, 2.411272, 0, 0.5960785, 1, 1,
0.2007317, -2.113507, 3.347568, 0, 0.5921569, 1, 1,
0.2012541, -1.679765, 1.507479, 0, 0.5843138, 1, 1,
0.2021587, -1.471485, 3.146221, 0, 0.5803922, 1, 1,
0.2042996, 1.848667, 0.114798, 0, 0.572549, 1, 1,
0.2054994, 0.7039046, -0.4909765, 0, 0.5686275, 1, 1,
0.2057611, 0.1505562, -0.3727918, 0, 0.5607843, 1, 1,
0.2074402, 0.7491333, 1.44999, 0, 0.5568628, 1, 1,
0.207652, -0.2525271, 2.151033, 0, 0.5490196, 1, 1,
0.2120518, 0.5197078, 1.610249, 0, 0.5450981, 1, 1,
0.2211289, -0.5365054, 4.92581, 0, 0.5372549, 1, 1,
0.222863, -0.3372277, 1.409363, 0, 0.5333334, 1, 1,
0.223001, 1.024437, -0.4604733, 0, 0.5254902, 1, 1,
0.2239508, 1.206489, -0.1126958, 0, 0.5215687, 1, 1,
0.2240756, 1.042425, 1.536248, 0, 0.5137255, 1, 1,
0.2257822, -0.3274833, 1.501655, 0, 0.509804, 1, 1,
0.2264876, 0.6470665, 0.9479108, 0, 0.5019608, 1, 1,
0.2305042, 1.872292, -0.0490063, 0, 0.4941176, 1, 1,
0.2319499, 0.3815748, -0.4336057, 0, 0.4901961, 1, 1,
0.2326906, -0.8083559, 3.28503, 0, 0.4823529, 1, 1,
0.2343263, 0.07053293, 1.342061, 0, 0.4784314, 1, 1,
0.2350423, 0.9461918, -0.2418677, 0, 0.4705882, 1, 1,
0.2360681, -0.138832, 1.430464, 0, 0.4666667, 1, 1,
0.2362294, -0.4134735, 2.431381, 0, 0.4588235, 1, 1,
0.2366707, -1.238448, 3.305585, 0, 0.454902, 1, 1,
0.2435722, -0.1492222, 2.161689, 0, 0.4470588, 1, 1,
0.2437023, -0.3837905, 2.426224, 0, 0.4431373, 1, 1,
0.2498588, -0.5284404, 3.261043, 0, 0.4352941, 1, 1,
0.2541791, -0.4322686, 1.358587, 0, 0.4313726, 1, 1,
0.2554027, 0.1150228, -0.110173, 0, 0.4235294, 1, 1,
0.2578308, -1.811023, 3.190439, 0, 0.4196078, 1, 1,
0.2584192, -1.828576, 4.162649, 0, 0.4117647, 1, 1,
0.2591128, -0.7865856, 3.551072, 0, 0.4078431, 1, 1,
0.2595873, 1.026191, 1.62247, 0, 0.4, 1, 1,
0.2657692, -0.5028728, 2.981113, 0, 0.3921569, 1, 1,
0.2679167, -0.3698911, 1.004558, 0, 0.3882353, 1, 1,
0.2719069, -0.3574148, 4.216354, 0, 0.3803922, 1, 1,
0.2842847, -0.07810565, 1.604311, 0, 0.3764706, 1, 1,
0.2914948, -0.9160611, 3.20157, 0, 0.3686275, 1, 1,
0.294472, -1.697213, 3.157507, 0, 0.3647059, 1, 1,
0.2982507, -0.1060382, 4.081862, 0, 0.3568628, 1, 1,
0.2998504, 1.968449, 0.07750199, 0, 0.3529412, 1, 1,
0.3009658, -1.315972, 1.504937, 0, 0.345098, 1, 1,
0.3022525, 0.5564291, 1.109458, 0, 0.3411765, 1, 1,
0.3051262, 0.5508831, -0.9699074, 0, 0.3333333, 1, 1,
0.3067416, 1.325864, 1.112494, 0, 0.3294118, 1, 1,
0.3101931, -1.225801, 4.455586, 0, 0.3215686, 1, 1,
0.3134043, 1.276598, 1.211918, 0, 0.3176471, 1, 1,
0.3134723, -1.957075, 2.841282, 0, 0.3098039, 1, 1,
0.3147055, 1.298158, 0.8692095, 0, 0.3058824, 1, 1,
0.3156074, 0.9925439, -0.3996169, 0, 0.2980392, 1, 1,
0.3179444, 2.703066, -2.143989, 0, 0.2901961, 1, 1,
0.3181226, 1.630265, 0.517346, 0, 0.2862745, 1, 1,
0.3187548, -2.694487, 2.308145, 0, 0.2784314, 1, 1,
0.3282952, -0.4531024, 2.435107, 0, 0.2745098, 1, 1,
0.3298822, 0.3157607, 0.6187333, 0, 0.2666667, 1, 1,
0.3298922, 0.5546845, 0.2700549, 0, 0.2627451, 1, 1,
0.3424296, 0.3712352, 0.4014001, 0, 0.254902, 1, 1,
0.3437819, -0.1465196, 3.236006, 0, 0.2509804, 1, 1,
0.3504958, 0.4895363, -2.250256, 0, 0.2431373, 1, 1,
0.3514162, 1.240744, 1.417757, 0, 0.2392157, 1, 1,
0.3615138, 0.762118, -0.3924556, 0, 0.2313726, 1, 1,
0.3632513, -0.2992991, 4.109458, 0, 0.227451, 1, 1,
0.3673282, 0.7918286, 0.2855132, 0, 0.2196078, 1, 1,
0.3684598, -1.078533, 5.29665, 0, 0.2156863, 1, 1,
0.3690748, 0.7676471, 1.361469, 0, 0.2078431, 1, 1,
0.3711912, -0.7872149, 4.626468, 0, 0.2039216, 1, 1,
0.3726703, 0.7276222, -1.007124, 0, 0.1960784, 1, 1,
0.3745017, -1.287161, 1.984207, 0, 0.1882353, 1, 1,
0.3749033, 0.8401907, -1.773426, 0, 0.1843137, 1, 1,
0.3820375, 1.279458, 2.314903, 0, 0.1764706, 1, 1,
0.3838991, -1.073769, 4.464934, 0, 0.172549, 1, 1,
0.3857134, 2.732704, -0.4997793, 0, 0.1647059, 1, 1,
0.3916348, 0.684586, -0.7164514, 0, 0.1607843, 1, 1,
0.393837, 1.476168, -0.7002125, 0, 0.1529412, 1, 1,
0.3954958, -0.4041911, 1.183654, 0, 0.1490196, 1, 1,
0.4007543, -1.019234, 3.667275, 0, 0.1411765, 1, 1,
0.400912, 0.6083103, -1.215423, 0, 0.1372549, 1, 1,
0.4040269, 0.04167581, 1.057, 0, 0.1294118, 1, 1,
0.405355, -1.240964, 1.461794, 0, 0.1254902, 1, 1,
0.4055345, -2.226772, 3.957422, 0, 0.1176471, 1, 1,
0.4098741, 0.5414737, -0.1791888, 0, 0.1137255, 1, 1,
0.4111099, -0.2326162, 1.462455, 0, 0.1058824, 1, 1,
0.4137086, 1.186075, 1.676591, 0, 0.09803922, 1, 1,
0.4172955, 1.389501, -0.06984452, 0, 0.09411765, 1, 1,
0.4189713, -0.6470994, 0.754679, 0, 0.08627451, 1, 1,
0.42333, -0.02204031, 0.4714765, 0, 0.08235294, 1, 1,
0.4300806, -1.978798, 3.150237, 0, 0.07450981, 1, 1,
0.4302418, -0.2234198, 0.534406, 0, 0.07058824, 1, 1,
0.4335399, 0.4477421, 0.1110232, 0, 0.0627451, 1, 1,
0.441331, 0.02763125, 3.357102, 0, 0.05882353, 1, 1,
0.4424365, 0.390822, 0.9895757, 0, 0.05098039, 1, 1,
0.4433873, 0.4466631, 1.409057, 0, 0.04705882, 1, 1,
0.4463464, -0.9497185, 2.814705, 0, 0.03921569, 1, 1,
0.4474171, -0.6972882, 2.281969, 0, 0.03529412, 1, 1,
0.4480726, -0.6614424, 2.608651, 0, 0.02745098, 1, 1,
0.4486981, -2.258247, 2.245158, 0, 0.02352941, 1, 1,
0.4514137, 0.6548508, -1.098875, 0, 0.01568628, 1, 1,
0.4525115, 0.4318335, 0.7532564, 0, 0.01176471, 1, 1,
0.4533129, 1.075257, 0.6652566, 0, 0.003921569, 1, 1,
0.4596656, 0.8081333, -0.2202517, 0.003921569, 0, 1, 1,
0.4600253, -1.799631, 1.020395, 0.007843138, 0, 1, 1,
0.4603097, 0.5598807, 2.601615, 0.01568628, 0, 1, 1,
0.4623822, 0.4554085, 1.440565, 0.01960784, 0, 1, 1,
0.4685421, 0.4647408, -0.1629755, 0.02745098, 0, 1, 1,
0.4732269, -0.3915375, 2.796916, 0.03137255, 0, 1, 1,
0.4740157, -0.8882055, 3.179115, 0.03921569, 0, 1, 1,
0.4778572, 0.6439059, 1.834243, 0.04313726, 0, 1, 1,
0.4820549, -2.220099, 2.554435, 0.05098039, 0, 1, 1,
0.4824739, -0.626617, 0.9329291, 0.05490196, 0, 1, 1,
0.4940093, -0.2179859, 1.13222, 0.0627451, 0, 1, 1,
0.4986093, 0.6115317, 0.86203, 0.06666667, 0, 1, 1,
0.4988904, -0.290684, 2.369024, 0.07450981, 0, 1, 1,
0.499967, -0.5874252, 3.240479, 0.07843138, 0, 1, 1,
0.5042558, 1.89908, 0.7305777, 0.08627451, 0, 1, 1,
0.5072539, -1.07524, 1.553639, 0.09019608, 0, 1, 1,
0.5096129, 0.03016544, 0.6181325, 0.09803922, 0, 1, 1,
0.5100173, -0.6214679, 2.278582, 0.1058824, 0, 1, 1,
0.5117201, -0.2143936, 1.819115, 0.1098039, 0, 1, 1,
0.5231435, -0.2833597, -0.3719601, 0.1176471, 0, 1, 1,
0.5279573, 1.081072, -0.7802464, 0.1215686, 0, 1, 1,
0.529566, 0.5325515, 1.735405, 0.1294118, 0, 1, 1,
0.5317901, 0.1500682, 3.237901, 0.1333333, 0, 1, 1,
0.5374861, -1.726187, 2.615286, 0.1411765, 0, 1, 1,
0.5387954, 1.126949, 2.161025, 0.145098, 0, 1, 1,
0.5423282, 0.2514686, 0.6105015, 0.1529412, 0, 1, 1,
0.5480467, -0.5903628, 1.781618, 0.1568628, 0, 1, 1,
0.5486839, -0.1725954, 1.659686, 0.1647059, 0, 1, 1,
0.5553361, 1.797656, 0.225166, 0.1686275, 0, 1, 1,
0.5587725, 0.5138527, 1.845019, 0.1764706, 0, 1, 1,
0.5604525, -0.6140145, 2.615185, 0.1803922, 0, 1, 1,
0.5621043, -0.1195565, 2.242418, 0.1882353, 0, 1, 1,
0.5652555, -0.2037196, 1.907861, 0.1921569, 0, 1, 1,
0.5664548, -0.8525445, 3.059701, 0.2, 0, 1, 1,
0.5694724, 0.2296288, 2.284838, 0.2078431, 0, 1, 1,
0.5749873, -0.2248095, 2.616284, 0.2117647, 0, 1, 1,
0.5788724, 1.155897, -0.8374094, 0.2196078, 0, 1, 1,
0.5813924, 1.409163, 0.4620569, 0.2235294, 0, 1, 1,
0.5833355, -0.9969292, 2.616732, 0.2313726, 0, 1, 1,
0.5879797, 0.244008, 0.9833809, 0.2352941, 0, 1, 1,
0.590112, 1.334083, 0.1168108, 0.2431373, 0, 1, 1,
0.5927083, 0.5461862, 0.401567, 0.2470588, 0, 1, 1,
0.5994034, -1.827069, 0.6291969, 0.254902, 0, 1, 1,
0.6053319, 0.3620597, -0.8770654, 0.2588235, 0, 1, 1,
0.6070939, 0.01367316, 1.784243, 0.2666667, 0, 1, 1,
0.6092366, -0.5993769, 2.475003, 0.2705882, 0, 1, 1,
0.616437, -0.1921037, 1.833424, 0.2784314, 0, 1, 1,
0.6224971, 0.2468466, 0.9099177, 0.282353, 0, 1, 1,
0.6234419, 1.415839, 0.6506748, 0.2901961, 0, 1, 1,
0.6252573, -0.3518475, 1.812659, 0.2941177, 0, 1, 1,
0.6277202, -0.7175101, 1.277333, 0.3019608, 0, 1, 1,
0.6348296, -0.3270248, 2.16987, 0.3098039, 0, 1, 1,
0.6357278, -0.699804, 1.527622, 0.3137255, 0, 1, 1,
0.6364552, -1.104461, 1.944571, 0.3215686, 0, 1, 1,
0.6392352, -0.5689573, 1.288859, 0.3254902, 0, 1, 1,
0.6434369, -0.6971235, 0.9817457, 0.3333333, 0, 1, 1,
0.644315, -0.7070595, 2.923189, 0.3372549, 0, 1, 1,
0.6445858, 0.1339208, 1.881428, 0.345098, 0, 1, 1,
0.6463524, 0.07971953, 1.755189, 0.3490196, 0, 1, 1,
0.646859, 0.5275598, 0.2343114, 0.3568628, 0, 1, 1,
0.6502923, 0.867862, 2.973506, 0.3607843, 0, 1, 1,
0.6600521, -0.824493, 4.111289, 0.3686275, 0, 1, 1,
0.6612011, 0.1321392, 2.123612, 0.372549, 0, 1, 1,
0.6630427, -0.05396254, 1.217663, 0.3803922, 0, 1, 1,
0.6696389, -0.6484395, 0.8009974, 0.3843137, 0, 1, 1,
0.6743683, -0.8228946, 0.8347767, 0.3921569, 0, 1, 1,
0.6809821, -0.7730562, 3.057301, 0.3960784, 0, 1, 1,
0.6833241, -0.5377431, 1.384211, 0.4039216, 0, 1, 1,
0.6836108, 0.5509578, 1.011584, 0.4117647, 0, 1, 1,
0.689218, 0.4253603, 1.813332, 0.4156863, 0, 1, 1,
0.6904289, 0.449324, 1.961827, 0.4235294, 0, 1, 1,
0.6921877, 1.220728, 0.3928137, 0.427451, 0, 1, 1,
0.6940661, 0.902652, -0.1680869, 0.4352941, 0, 1, 1,
0.6961913, 0.5191896, 0.7230601, 0.4392157, 0, 1, 1,
0.6965687, -0.1244483, 1.53126, 0.4470588, 0, 1, 1,
0.7030384, -0.05924559, 1.334271, 0.4509804, 0, 1, 1,
0.7035077, -0.6939937, 2.254735, 0.4588235, 0, 1, 1,
0.7070504, 0.09150047, 2.999044, 0.4627451, 0, 1, 1,
0.707178, 0.03424627, 0.6601927, 0.4705882, 0, 1, 1,
0.7107744, -0.1898738, 2.390724, 0.4745098, 0, 1, 1,
0.7114224, 0.4401787, -0.2159345, 0.4823529, 0, 1, 1,
0.7189697, -0.4458561, 3.046939, 0.4862745, 0, 1, 1,
0.7197374, -1.160655, 2.591069, 0.4941176, 0, 1, 1,
0.7268006, 1.702951, -0.7675118, 0.5019608, 0, 1, 1,
0.728561, 2.181138, 1.362323, 0.5058824, 0, 1, 1,
0.7291732, -0.5821095, 2.42878, 0.5137255, 0, 1, 1,
0.7305476, -0.2362869, 0.4000854, 0.5176471, 0, 1, 1,
0.7315959, -1.052017, 1.965765, 0.5254902, 0, 1, 1,
0.737097, -0.5975838, 2.868742, 0.5294118, 0, 1, 1,
0.7407848, 0.9609307, 0.3769686, 0.5372549, 0, 1, 1,
0.7457061, 0.3005542, 0.6698513, 0.5411765, 0, 1, 1,
0.7480718, 0.07999427, 2.652514, 0.5490196, 0, 1, 1,
0.7536685, -0.3259982, 1.397006, 0.5529412, 0, 1, 1,
0.7621869, 1.496236, -0.2410673, 0.5607843, 0, 1, 1,
0.7635048, -1.751223, 2.351611, 0.5647059, 0, 1, 1,
0.7645264, -0.7252308, 2.001102, 0.572549, 0, 1, 1,
0.7670814, 1.409763, 0.2109915, 0.5764706, 0, 1, 1,
0.7700382, 0.05002793, 1.573944, 0.5843138, 0, 1, 1,
0.7715472, -0.08961836, 2.355963, 0.5882353, 0, 1, 1,
0.7746127, -1.807094, 2.097069, 0.5960785, 0, 1, 1,
0.7795186, 0.5424686, 0.6957462, 0.6039216, 0, 1, 1,
0.7799276, -0.5956569, 2.392127, 0.6078432, 0, 1, 1,
0.7801172, -1.317401, 2.046535, 0.6156863, 0, 1, 1,
0.7857496, -0.8072803, 2.838926, 0.6196079, 0, 1, 1,
0.7860666, 0.09137245, 0.3352593, 0.627451, 0, 1, 1,
0.791483, 1.189553, -0.131129, 0.6313726, 0, 1, 1,
0.7946901, 0.1943056, 1.872679, 0.6392157, 0, 1, 1,
0.7991841, 0.3735898, 2.692124, 0.6431373, 0, 1, 1,
0.8001877, -0.04665472, 0.8448368, 0.6509804, 0, 1, 1,
0.8005491, -0.1794387, 0.18201, 0.654902, 0, 1, 1,
0.811882, 0.7975491, 0.4901024, 0.6627451, 0, 1, 1,
0.8210568, -0.01749033, 2.958649, 0.6666667, 0, 1, 1,
0.8249526, 0.140677, 3.019996, 0.6745098, 0, 1, 1,
0.8252051, 1.002227, 2.561197, 0.6784314, 0, 1, 1,
0.825242, 0.2867592, 0.3751968, 0.6862745, 0, 1, 1,
0.8275237, 2.072933, 0.2501116, 0.6901961, 0, 1, 1,
0.8290234, 0.176748, 2.772731, 0.6980392, 0, 1, 1,
0.8312989, 0.5721186, 1.072556, 0.7058824, 0, 1, 1,
0.8313789, 0.4715575, 0.7568958, 0.7098039, 0, 1, 1,
0.8317726, 0.9875459, 1.837106, 0.7176471, 0, 1, 1,
0.8331585, -1.924595, 1.279805, 0.7215686, 0, 1, 1,
0.8411712, 0.5002154, -0.8451636, 0.7294118, 0, 1, 1,
0.8448142, -0.3227305, 4.583922, 0.7333333, 0, 1, 1,
0.8486881, 0.7590588, 1.745353, 0.7411765, 0, 1, 1,
0.8505413, -0.5612835, 1.683503, 0.7450981, 0, 1, 1,
0.8523332, -1.372228, 4.131372, 0.7529412, 0, 1, 1,
0.8612272, -0.02919745, 1.067938, 0.7568628, 0, 1, 1,
0.8643196, -0.1026832, 0.7201774, 0.7647059, 0, 1, 1,
0.8645954, -0.5329556, 0.3112659, 0.7686275, 0, 1, 1,
0.8769441, 1.658727, 0.8447531, 0.7764706, 0, 1, 1,
0.8846335, 0.810477, 0.8080491, 0.7803922, 0, 1, 1,
0.8864837, 0.8421494, 0.4480132, 0.7882353, 0, 1, 1,
0.8904427, -0.9973564, 3.540185, 0.7921569, 0, 1, 1,
0.8990704, -1.490926, 3.985044, 0.8, 0, 1, 1,
0.9079871, 0.3871773, 1.78048, 0.8078431, 0, 1, 1,
0.9092079, -1.340753, 2.986469, 0.8117647, 0, 1, 1,
0.9224876, 1.032555, -1.096391, 0.8196079, 0, 1, 1,
0.923242, -0.02325816, 0.7860531, 0.8235294, 0, 1, 1,
0.9316045, -0.5806512, 0.0321998, 0.8313726, 0, 1, 1,
0.9322781, -0.8526413, 2.922707, 0.8352941, 0, 1, 1,
0.9339593, 1.082967, 1.708811, 0.8431373, 0, 1, 1,
0.93422, 1.724378, 0.5004311, 0.8470588, 0, 1, 1,
0.9377554, -0.6632844, 3.585376, 0.854902, 0, 1, 1,
0.9442868, -0.3165271, 2.568214, 0.8588235, 0, 1, 1,
0.9519994, 2.31466, 0.4156052, 0.8666667, 0, 1, 1,
0.955787, 0.6137918, 0.6759678, 0.8705882, 0, 1, 1,
0.9586845, 0.9553498, 2.532281, 0.8784314, 0, 1, 1,
0.9642246, -0.2579019, 0.3505601, 0.8823529, 0, 1, 1,
0.9682176, -0.04327671, 2.131876, 0.8901961, 0, 1, 1,
0.9687097, -1.504378, 1.849614, 0.8941177, 0, 1, 1,
0.976316, 0.3364633, 2.463114, 0.9019608, 0, 1, 1,
0.9779398, -0.4811731, 3.616999, 0.9098039, 0, 1, 1,
0.9792248, 0.4366496, 0.5341038, 0.9137255, 0, 1, 1,
0.9806604, 0.7748781, 0.08424943, 0.9215686, 0, 1, 1,
0.9815449, -0.415159, 4.423924, 0.9254902, 0, 1, 1,
0.990258, 0.0616344, 1.513873, 0.9333333, 0, 1, 1,
0.9967243, -1.196638, 2.953388, 0.9372549, 0, 1, 1,
1.001313, 0.4213499, -0.04757453, 0.945098, 0, 1, 1,
1.00291, 0.6907881, 1.132048, 0.9490196, 0, 1, 1,
1.003123, -2.061104, 1.603799, 0.9568627, 0, 1, 1,
1.004515, -1.133354, 2.611904, 0.9607843, 0, 1, 1,
1.009539, -0.05002839, 0.6346725, 0.9686275, 0, 1, 1,
1.015301, 1.423908, -0.5080541, 0.972549, 0, 1, 1,
1.015685, -0.5612423, 2.968511, 0.9803922, 0, 1, 1,
1.016039, 0.6271996, 0.01655384, 0.9843137, 0, 1, 1,
1.024468, -0.09523987, 0.8564115, 0.9921569, 0, 1, 1,
1.024551, 0.3904882, 0.618623, 0.9960784, 0, 1, 1,
1.024562, 0.4889558, 2.837526, 1, 0, 0.9960784, 1,
1.027704, 1.383605, -1.54216, 1, 0, 0.9882353, 1,
1.031401, -1.564062, 2.907527, 1, 0, 0.9843137, 1,
1.036918, -0.006519045, 3.606393, 1, 0, 0.9764706, 1,
1.036953, -0.2971253, 1.622308, 1, 0, 0.972549, 1,
1.045173, 1.670354, 1.654745, 1, 0, 0.9647059, 1,
1.050873, 0.03483253, 1.698881, 1, 0, 0.9607843, 1,
1.052804, 1.300845, 0.3509364, 1, 0, 0.9529412, 1,
1.056745, -1.418037, 1.819921, 1, 0, 0.9490196, 1,
1.060715, -0.06195879, 0.6557404, 1, 0, 0.9411765, 1,
1.067628, -0.0564021, 1.293855, 1, 0, 0.9372549, 1,
1.070216, 0.3994004, 2.077737, 1, 0, 0.9294118, 1,
1.08499, -2.00602, 2.39059, 1, 0, 0.9254902, 1,
1.085539, 1.163425, 1.841085, 1, 0, 0.9176471, 1,
1.087983, -0.8995656, 2.254683, 1, 0, 0.9137255, 1,
1.09659, -1.235206, 4.111587, 1, 0, 0.9058824, 1,
1.097242, 1.186848, 1.151331, 1, 0, 0.9019608, 1,
1.098607, 1.121411, -0.718708, 1, 0, 0.8941177, 1,
1.101274, 0.3162427, -0.3975717, 1, 0, 0.8862745, 1,
1.110631, 0.8601832, -0.8596898, 1, 0, 0.8823529, 1,
1.111414, -0.7017031, 1.477907, 1, 0, 0.8745098, 1,
1.112058, -0.1992389, 1.085493, 1, 0, 0.8705882, 1,
1.112429, 1.031573, 0.8311526, 1, 0, 0.8627451, 1,
1.114444, -0.5185899, 1.189802, 1, 0, 0.8588235, 1,
1.117728, -1.955218, 1.470211, 1, 0, 0.8509804, 1,
1.122014, 0.6995848, 1.210054, 1, 0, 0.8470588, 1,
1.128528, 0.1147794, -0.2573959, 1, 0, 0.8392157, 1,
1.134257, -1.893238, 3.084687, 1, 0, 0.8352941, 1,
1.137202, 0.09004163, 2.769886, 1, 0, 0.827451, 1,
1.137893, 0.1665184, 0.5540375, 1, 0, 0.8235294, 1,
1.139911, 0.3469741, 0.2255394, 1, 0, 0.8156863, 1,
1.14346, 1.387173, 0.2729194, 1, 0, 0.8117647, 1,
1.14347, -0.3705862, 1.480319, 1, 0, 0.8039216, 1,
1.148561, -0.9512679, 2.661105, 1, 0, 0.7960784, 1,
1.152051, -0.2958671, 1.442737, 1, 0, 0.7921569, 1,
1.159801, -0.4673033, 1.240403, 1, 0, 0.7843137, 1,
1.163261, 1.08393, -0.157578, 1, 0, 0.7803922, 1,
1.166875, 0.7094461, 1.380997, 1, 0, 0.772549, 1,
1.186473, 0.2560742, 0.763613, 1, 0, 0.7686275, 1,
1.187014, 0.6120906, 0.1762485, 1, 0, 0.7607843, 1,
1.19048, -0.5391082, 3.382955, 1, 0, 0.7568628, 1,
1.194631, 0.2503672, 0.6871555, 1, 0, 0.7490196, 1,
1.195844, -0.8178356, 2.919116, 1, 0, 0.7450981, 1,
1.201819, -0.7126659, 0.1394384, 1, 0, 0.7372549, 1,
1.213709, 1.372892, 2.212838, 1, 0, 0.7333333, 1,
1.216743, -0.07923197, 2.865071, 1, 0, 0.7254902, 1,
1.222574, -0.6156451, 0.371552, 1, 0, 0.7215686, 1,
1.222946, -0.980553, 1.976801, 1, 0, 0.7137255, 1,
1.22899, 0.9754461, 1.506147, 1, 0, 0.7098039, 1,
1.251362, 0.9388414, 1.927476, 1, 0, 0.7019608, 1,
1.258485, -0.2934284, 3.293087, 1, 0, 0.6941177, 1,
1.261703, 1.271087, 0.9684558, 1, 0, 0.6901961, 1,
1.26188, -0.5253966, 2.18348, 1, 0, 0.682353, 1,
1.265423, 1.412926, -0.6532989, 1, 0, 0.6784314, 1,
1.268567, -1.657086, 0.8799965, 1, 0, 0.6705883, 1,
1.27257, 2.911068, 0.8820397, 1, 0, 0.6666667, 1,
1.27381, 0.7416241, 1.540902, 1, 0, 0.6588235, 1,
1.285623, -1.939354, 3.448314, 1, 0, 0.654902, 1,
1.29074, -0.5795048, 2.552759, 1, 0, 0.6470588, 1,
1.295488, 0.5633239, 0.4973223, 1, 0, 0.6431373, 1,
1.305227, 0.107995, 3.460516, 1, 0, 0.6352941, 1,
1.319658, 1.416663, 1.453091, 1, 0, 0.6313726, 1,
1.334295, -0.2878464, 1.457135, 1, 0, 0.6235294, 1,
1.334666, -0.7156333, 2.879571, 1, 0, 0.6196079, 1,
1.363598, -0.07357066, 1.953022, 1, 0, 0.6117647, 1,
1.367037, -0.7041029, -0.1285052, 1, 0, 0.6078432, 1,
1.367238, 0.3903411, 1.809917, 1, 0, 0.6, 1,
1.371207, 0.3516257, -0.06802142, 1, 0, 0.5921569, 1,
1.376172, 0.3125708, 1.435103, 1, 0, 0.5882353, 1,
1.400514, -0.5924205, 2.119279, 1, 0, 0.5803922, 1,
1.403263, 1.119806, -0.2122489, 1, 0, 0.5764706, 1,
1.410171, 0.5170729, 1.153119, 1, 0, 0.5686275, 1,
1.410407, -1.205511, 3.146495, 1, 0, 0.5647059, 1,
1.423491, 0.544015, 3.029796, 1, 0, 0.5568628, 1,
1.428817, 1.317719, -0.4321386, 1, 0, 0.5529412, 1,
1.437499, 0.6208828, 0.8407188, 1, 0, 0.5450981, 1,
1.440137, -0.8218083, 2.213948, 1, 0, 0.5411765, 1,
1.444553, -0.6115525, 2.354754, 1, 0, 0.5333334, 1,
1.446643, -1.207183, 3.005152, 1, 0, 0.5294118, 1,
1.449693, 0.4305185, 0.686461, 1, 0, 0.5215687, 1,
1.454796, 1.079776, 1.139613, 1, 0, 0.5176471, 1,
1.457354, -0.7334858, 3.54299, 1, 0, 0.509804, 1,
1.459439, -0.04571285, 2.235294, 1, 0, 0.5058824, 1,
1.47622, -1.640399, 1.337545, 1, 0, 0.4980392, 1,
1.483411, -0.5292722, 1.482777, 1, 0, 0.4901961, 1,
1.485056, -1.00329, 1.877519, 1, 0, 0.4862745, 1,
1.491423, 0.7225306, -0.4205121, 1, 0, 0.4784314, 1,
1.496363, -1.15102, 2.405355, 1, 0, 0.4745098, 1,
1.499789, -1.114053, 0.7540401, 1, 0, 0.4666667, 1,
1.506466, 0.1217312, -0.7306304, 1, 0, 0.4627451, 1,
1.515479, -1.093833, 1.76627, 1, 0, 0.454902, 1,
1.520966, 0.1089954, 1.536586, 1, 0, 0.4509804, 1,
1.521932, -1.038455, 1.493741, 1, 0, 0.4431373, 1,
1.525159, -0.05854198, 1.900333, 1, 0, 0.4392157, 1,
1.537338, -0.3004182, 3.188585, 1, 0, 0.4313726, 1,
1.537567, 1.36396, -0.3513593, 1, 0, 0.427451, 1,
1.551297, 2.637232, -0.2710421, 1, 0, 0.4196078, 1,
1.570253, 1.822894, 1.968981, 1, 0, 0.4156863, 1,
1.575639, -0.945325, 3.643543, 1, 0, 0.4078431, 1,
1.576643, 0.1047678, 1.47077, 1, 0, 0.4039216, 1,
1.578559, -1.182953, 2.044022, 1, 0, 0.3960784, 1,
1.582257, -1.397963, 2.728292, 1, 0, 0.3882353, 1,
1.591797, 0.7174948, 1.401965, 1, 0, 0.3843137, 1,
1.598567, 0.7216863, 1.100043, 1, 0, 0.3764706, 1,
1.600668, 1.20332, 1.788881, 1, 0, 0.372549, 1,
1.612081, -0.6767939, 0.8264247, 1, 0, 0.3647059, 1,
1.617897, 0.4309037, 1.109667, 1, 0, 0.3607843, 1,
1.632902, 0.555027, 0.9677277, 1, 0, 0.3529412, 1,
1.634389, -0.6020347, 2.420638, 1, 0, 0.3490196, 1,
1.644484, 1.310188, -0.2717277, 1, 0, 0.3411765, 1,
1.646591, -0.6244091, 1.946427, 1, 0, 0.3372549, 1,
1.66901, 0.193519, 1.492929, 1, 0, 0.3294118, 1,
1.671102, -0.6831384, 2.140273, 1, 0, 0.3254902, 1,
1.677448, 1.713347, 1.653798, 1, 0, 0.3176471, 1,
1.687186, -2.630234, 1.167536, 1, 0, 0.3137255, 1,
1.705764, 0.4596614, 1.901612, 1, 0, 0.3058824, 1,
1.707489, -0.5430164, 1.314304, 1, 0, 0.2980392, 1,
1.73104, 1.299017, -0.1830621, 1, 0, 0.2941177, 1,
1.748657, 0.6472099, 0.9653435, 1, 0, 0.2862745, 1,
1.76537, -0.40674, 4.184787, 1, 0, 0.282353, 1,
1.771005, -0.928992, 0.6399059, 1, 0, 0.2745098, 1,
1.771631, 0.5094287, 0.5314239, 1, 0, 0.2705882, 1,
1.772037, -0.4508857, 2.787831, 1, 0, 0.2627451, 1,
1.783002, 1.356789, 1.732838, 1, 0, 0.2588235, 1,
1.792223, -0.3908248, 0.301049, 1, 0, 0.2509804, 1,
1.803528, 1.161996, 1.590819, 1, 0, 0.2470588, 1,
1.816185, -0.4651775, 1.892285, 1, 0, 0.2392157, 1,
1.823665, -0.2427545, 1.474681, 1, 0, 0.2352941, 1,
1.826444, 0.9842553, -0.085704, 1, 0, 0.227451, 1,
1.833407, 0.03594534, 1.517941, 1, 0, 0.2235294, 1,
1.837741, 0.3336037, 0.497476, 1, 0, 0.2156863, 1,
1.848989, -1.208564, 1.506985, 1, 0, 0.2117647, 1,
1.85136, 0.2881818, -0.6071906, 1, 0, 0.2039216, 1,
1.863529, 0.6202731, 1.045632, 1, 0, 0.1960784, 1,
1.952391, 1.573363, 2.272135, 1, 0, 0.1921569, 1,
1.956095, 0.3497797, 0.8732263, 1, 0, 0.1843137, 1,
1.963612, 0.5864649, 3.12492, 1, 0, 0.1803922, 1,
1.969169, -0.2141818, 1.816192, 1, 0, 0.172549, 1,
1.981462, 0.7658884, 3.357422, 1, 0, 0.1686275, 1,
1.989163, 0.9915521, 3.380027, 1, 0, 0.1607843, 1,
1.991408, -0.2424862, 0.07995342, 1, 0, 0.1568628, 1,
1.994824, 1.428251, 0.2253741, 1, 0, 0.1490196, 1,
2.010853, -0.1727864, 1.723735, 1, 0, 0.145098, 1,
2.015851, 1.45524, 1.280663, 1, 0, 0.1372549, 1,
2.022893, -0.8115275, 3.339363, 1, 0, 0.1333333, 1,
2.122983, -0.0265669, 1.186371, 1, 0, 0.1254902, 1,
2.131588, -0.1050764, 1.525202, 1, 0, 0.1215686, 1,
2.174695, -1.120261, 0.3347178, 1, 0, 0.1137255, 1,
2.180034, -0.7472726, 2.645569, 1, 0, 0.1098039, 1,
2.233953, 0.1054168, 1.637225, 1, 0, 0.1019608, 1,
2.24675, -1.341797, 0.7927949, 1, 0, 0.09411765, 1,
2.271842, -0.4943403, 0.4522195, 1, 0, 0.09019608, 1,
2.288124, 0.4898801, 0.5153226, 1, 0, 0.08235294, 1,
2.29231, -0.732736, 4.072865, 1, 0, 0.07843138, 1,
2.310941, 1.242589, 1.335806, 1, 0, 0.07058824, 1,
2.373563, 1.083514, 0.7379818, 1, 0, 0.06666667, 1,
2.381482, -0.1938566, 0.6878561, 1, 0, 0.05882353, 1,
2.394589, 0.1989438, 1.645045, 1, 0, 0.05490196, 1,
2.460743, 1.118877, 1.678706, 1, 0, 0.04705882, 1,
2.543815, 2.597764, 0.2245572, 1, 0, 0.04313726, 1,
2.753841, 0.1706122, 0.9903209, 1, 0, 0.03529412, 1,
2.756279, -0.1095491, 2.313278, 1, 0, 0.03137255, 1,
2.771501, -0.9074456, 2.406636, 1, 0, 0.02352941, 1,
2.994155, 0.2840436, 2.121628, 1, 0, 0.01960784, 1,
3.05076, -0.199021, 2.221043, 1, 0, 0.01176471, 1,
3.185317, -0.6779649, 1.605579, 1, 0, 0.007843138, 1
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
-0.449489, -4.227856, -6.907627, 0, -0.5, 0.5, 0.5,
-0.449489, -4.227856, -6.907627, 1, -0.5, 0.5, 0.5,
-0.449489, -4.227856, -6.907627, 1, 1.5, 0.5, 0.5,
-0.449489, -4.227856, -6.907627, 0, 1.5, 0.5, 0.5
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
-5.316494, 0.06388843, -6.907627, 0, -0.5, 0.5, 0.5,
-5.316494, 0.06388843, -6.907627, 1, -0.5, 0.5, 0.5,
-5.316494, 0.06388843, -6.907627, 1, 1.5, 0.5, 0.5,
-5.316494, 0.06388843, -6.907627, 0, 1.5, 0.5, 0.5
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
-5.316494, -4.227856, 0.07891726, 0, -0.5, 0.5, 0.5,
-5.316494, -4.227856, 0.07891726, 1, -0.5, 0.5, 0.5,
-5.316494, -4.227856, 0.07891726, 1, 1.5, 0.5, 0.5,
-5.316494, -4.227856, 0.07891726, 0, 1.5, 0.5, 0.5
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
-4, -3.237453, -5.295347,
2, -3.237453, -5.295347,
-4, -3.237453, -5.295347,
-4, -3.40252, -5.564061,
-2, -3.237453, -5.295347,
-2, -3.40252, -5.564061,
0, -3.237453, -5.295347,
0, -3.40252, -5.564061,
2, -3.237453, -5.295347,
2, -3.40252, -5.564061
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
"-4",
"-2",
"0",
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
-4, -3.732655, -6.101487, 0, -0.5, 0.5, 0.5,
-4, -3.732655, -6.101487, 1, -0.5, 0.5, 0.5,
-4, -3.732655, -6.101487, 1, 1.5, 0.5, 0.5,
-4, -3.732655, -6.101487, 0, 1.5, 0.5, 0.5,
-2, -3.732655, -6.101487, 0, -0.5, 0.5, 0.5,
-2, -3.732655, -6.101487, 1, -0.5, 0.5, 0.5,
-2, -3.732655, -6.101487, 1, 1.5, 0.5, 0.5,
-2, -3.732655, -6.101487, 0, 1.5, 0.5, 0.5,
0, -3.732655, -6.101487, 0, -0.5, 0.5, 0.5,
0, -3.732655, -6.101487, 1, -0.5, 0.5, 0.5,
0, -3.732655, -6.101487, 1, 1.5, 0.5, 0.5,
0, -3.732655, -6.101487, 0, 1.5, 0.5, 0.5,
2, -3.732655, -6.101487, 0, -0.5, 0.5, 0.5,
2, -3.732655, -6.101487, 1, -0.5, 0.5, 0.5,
2, -3.732655, -6.101487, 1, 1.5, 0.5, 0.5,
2, -3.732655, -6.101487, 0, 1.5, 0.5, 0.5
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
-4.193339, -3, -5.295347,
-4.193339, 3, -5.295347,
-4.193339, -3, -5.295347,
-4.380531, -3, -5.564061,
-4.193339, -2, -5.295347,
-4.380531, -2, -5.564061,
-4.193339, -1, -5.295347,
-4.380531, -1, -5.564061,
-4.193339, 0, -5.295347,
-4.380531, 0, -5.564061,
-4.193339, 1, -5.295347,
-4.380531, 1, -5.564061,
-4.193339, 2, -5.295347,
-4.380531, 2, -5.564061,
-4.193339, 3, -5.295347,
-4.380531, 3, -5.564061
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
-4.754917, -3, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, -3, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, -3, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, -3, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, -2, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, -2, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, -2, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, -2, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, -1, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, -1, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, -1, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, -1, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, 0, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, 0, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, 0, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, 0, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, 1, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, 1, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, 1, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, 1, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, 2, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, 2, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, 2, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, 2, -6.101487, 0, 1.5, 0.5, 0.5,
-4.754917, 3, -6.101487, 0, -0.5, 0.5, 0.5,
-4.754917, 3, -6.101487, 1, -0.5, 0.5, 0.5,
-4.754917, 3, -6.101487, 1, 1.5, 0.5, 0.5,
-4.754917, 3, -6.101487, 0, 1.5, 0.5, 0.5
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
-4.193339, -3.237453, -4,
-4.193339, -3.237453, 4,
-4.193339, -3.237453, -4,
-4.380531, -3.40252, -4,
-4.193339, -3.237453, -2,
-4.380531, -3.40252, -2,
-4.193339, -3.237453, 0,
-4.380531, -3.40252, 0,
-4.193339, -3.237453, 2,
-4.380531, -3.40252, 2,
-4.193339, -3.237453, 4,
-4.380531, -3.40252, 4
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
-4.754917, -3.732655, -4, 0, -0.5, 0.5, 0.5,
-4.754917, -3.732655, -4, 1, -0.5, 0.5, 0.5,
-4.754917, -3.732655, -4, 1, 1.5, 0.5, 0.5,
-4.754917, -3.732655, -4, 0, 1.5, 0.5, 0.5,
-4.754917, -3.732655, -2, 0, -0.5, 0.5, 0.5,
-4.754917, -3.732655, -2, 1, -0.5, 0.5, 0.5,
-4.754917, -3.732655, -2, 1, 1.5, 0.5, 0.5,
-4.754917, -3.732655, -2, 0, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 0, 0, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 0, 1, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 0, 1, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 0, 0, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 2, 0, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 2, 1, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 2, 1, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 2, 0, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 4, 0, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 4, 1, -0.5, 0.5, 0.5,
-4.754917, -3.732655, 4, 1, 1.5, 0.5, 0.5,
-4.754917, -3.732655, 4, 0, 1.5, 0.5, 0.5
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
-4.193339, -3.237453, -5.295347,
-4.193339, 3.36523, -5.295347,
-4.193339, -3.237453, 5.453182,
-4.193339, 3.36523, 5.453182,
-4.193339, -3.237453, -5.295347,
-4.193339, -3.237453, 5.453182,
-4.193339, 3.36523, -5.295347,
-4.193339, 3.36523, 5.453182,
-4.193339, -3.237453, -5.295347,
3.294361, -3.237453, -5.295347,
-4.193339, -3.237453, 5.453182,
3.294361, -3.237453, 5.453182,
-4.193339, 3.36523, -5.295347,
3.294361, 3.36523, -5.295347,
-4.193339, 3.36523, 5.453182,
3.294361, 3.36523, 5.453182,
3.294361, -3.237453, -5.295347,
3.294361, 3.36523, -5.295347,
3.294361, -3.237453, 5.453182,
3.294361, 3.36523, 5.453182,
3.294361, -3.237453, -5.295347,
3.294361, -3.237453, 5.453182,
3.294361, 3.36523, -5.295347,
3.294361, 3.36523, 5.453182
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
var radius = 7.833187;
var distance = 34.85073;
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
mvMatrix.translate( 0.449489, -0.06388843, -0.07891726 );
mvMatrix.scale( 1.131108, 1.28272, 0.7879585 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.85073);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Amide<-read.table("Amide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Amide$V2
```

```
## Error in eval(expr, envir, enclos): object 'Amide' not found
```

```r
y<-Amide$V3
```

```
## Error in eval(expr, envir, enclos): object 'Amide' not found
```

```r
z<-Amide$V4
```

```
## Error in eval(expr, envir, enclos): object 'Amide' not found
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
-4.084295, -1.065307, 0.4771795, 0, 0, 1, 1, 1,
-2.824545, -0.6460986, -1.084475, 1, 0, 0, 1, 1,
-2.617554, -1.052456, -1.222697, 1, 0, 0, 1, 1,
-2.544843, -0.01414597, -0.9954847, 1, 0, 0, 1, 1,
-2.502885, -0.3886998, -0.3303857, 1, 0, 0, 1, 1,
-2.489039, -0.3323052, -1.467242, 1, 0, 0, 1, 1,
-2.479087, 0.5823323, -1.253545, 0, 0, 0, 1, 1,
-2.446278, 0.7391096, -1.120263, 0, 0, 0, 1, 1,
-2.440855, -1.212691, -1.651421, 0, 0, 0, 1, 1,
-2.370273, 0.2011368, -0.6360545, 0, 0, 0, 1, 1,
-2.343603, 0.01199093, -1.38641, 0, 0, 0, 1, 1,
-2.33481, 1.088733, -3.266474, 0, 0, 0, 1, 1,
-2.320159, 2.301147, 2.398793, 0, 0, 0, 1, 1,
-2.290407, 0.6166165, -2.05523, 1, 1, 1, 1, 1,
-2.279255, 0.2955022, -1.53939, 1, 1, 1, 1, 1,
-2.278766, 0.5646083, -3.801075, 1, 1, 1, 1, 1,
-2.257054, -0.5682508, -1.59607, 1, 1, 1, 1, 1,
-2.234349, 1.039245, -0.7695817, 1, 1, 1, 1, 1,
-2.196622, -0.02602668, -2.455248, 1, 1, 1, 1, 1,
-2.179014, 0.04044182, -1.906613, 1, 1, 1, 1, 1,
-2.147302, 0.3980889, -2.139101, 1, 1, 1, 1, 1,
-2.133114, 0.1343989, -1.602526, 1, 1, 1, 1, 1,
-2.088347, -0.09823611, -1.296354, 1, 1, 1, 1, 1,
-2.047694, 0.8559471, 0.3154959, 1, 1, 1, 1, 1,
-2.010246, -0.3915892, -0.2112933, 1, 1, 1, 1, 1,
-1.980225, 0.04076087, -0.01344431, 1, 1, 1, 1, 1,
-1.953647, -0.347522, -2.747938, 1, 1, 1, 1, 1,
-1.950524, -0.04351242, -3.795081, 1, 1, 1, 1, 1,
-1.943391, -0.04262014, -3.19839, 0, 0, 1, 1, 1,
-1.936573, -0.0048816, -1.548907, 1, 0, 0, 1, 1,
-1.933976, 0.78253, -2.370404, 1, 0, 0, 1, 1,
-1.932448, -0.5581691, -2.248561, 1, 0, 0, 1, 1,
-1.923283, -1.044627, -1.370266, 1, 0, 0, 1, 1,
-1.900963, 0.6099437, -2.335029, 1, 0, 0, 1, 1,
-1.896791, 0.08713129, -2.005233, 0, 0, 0, 1, 1,
-1.889838, 0.08287995, -0.361304, 0, 0, 0, 1, 1,
-1.884356, 0.0231811, -1.345668, 0, 0, 0, 1, 1,
-1.879063, 0.9389825, -0.6930853, 0, 0, 0, 1, 1,
-1.86729, 1.578014, -0.6043106, 0, 0, 0, 1, 1,
-1.84996, 1.755336, -0.4158539, 0, 0, 0, 1, 1,
-1.839847, -0.5606274, -2.303104, 0, 0, 0, 1, 1,
-1.834299, -0.2343716, -2.633793, 1, 1, 1, 1, 1,
-1.81864, -0.3613331, -4.148448, 1, 1, 1, 1, 1,
-1.818247, 2.44974, -1.237458, 1, 1, 1, 1, 1,
-1.807424, -0.6037221, -1.892331, 1, 1, 1, 1, 1,
-1.805562, 0.4165107, -0.8617327, 1, 1, 1, 1, 1,
-1.790734, 0.1294095, -2.179666, 1, 1, 1, 1, 1,
-1.783315, -0.3394104, -2.6018, 1, 1, 1, 1, 1,
-1.782774, -1.171041, -3.089027, 1, 1, 1, 1, 1,
-1.781876, -0.3240762, -3.664085, 1, 1, 1, 1, 1,
-1.775387, -1.505621, -2.803839, 1, 1, 1, 1, 1,
-1.768954, -0.2522717, -0.1400827, 1, 1, 1, 1, 1,
-1.754597, -0.1411949, -0.1598277, 1, 1, 1, 1, 1,
-1.731886, 0.8977405, -2.002023, 1, 1, 1, 1, 1,
-1.729798, 0.4284929, -0.9427311, 1, 1, 1, 1, 1,
-1.718604, 0.955791, -2.312021, 1, 1, 1, 1, 1,
-1.713599, -1.6746, -1.998919, 0, 0, 1, 1, 1,
-1.709111, 0.2239384, -1.336801, 1, 0, 0, 1, 1,
-1.694686, 0.3289587, -2.992992, 1, 0, 0, 1, 1,
-1.694158, -0.71583, -0.5919359, 1, 0, 0, 1, 1,
-1.683137, -0.0525528, -0.9538867, 1, 0, 0, 1, 1,
-1.680932, 0.9400795, -0.2770192, 1, 0, 0, 1, 1,
-1.674642, 0.04761365, -1.979941, 0, 0, 0, 1, 1,
-1.672405, 1.012303, -0.9662604, 0, 0, 0, 1, 1,
-1.657888, 1.499052, -0.2055821, 0, 0, 0, 1, 1,
-1.650429, -3.141298, -4.599659, 0, 0, 0, 1, 1,
-1.631936, -0.5760404, -2.019304, 0, 0, 0, 1, 1,
-1.62888, 1.071475, -0.9427652, 0, 0, 0, 1, 1,
-1.626115, 0.7138959, -1.117995, 0, 0, 0, 1, 1,
-1.614789, -1.183191, -2.696096, 1, 1, 1, 1, 1,
-1.606464, 0.2375297, -1.700933, 1, 1, 1, 1, 1,
-1.582522, 0.8690354, -1.993133, 1, 1, 1, 1, 1,
-1.580168, -0.7780123, -2.081957, 1, 1, 1, 1, 1,
-1.579807, -1.850358, -1.548306, 1, 1, 1, 1, 1,
-1.565334, -0.8875408, -2.8906, 1, 1, 1, 1, 1,
-1.54985, -0.976248, -4.216198, 1, 1, 1, 1, 1,
-1.522834, 0.3594146, -2.602096, 1, 1, 1, 1, 1,
-1.499169, -1.102837, -1.700435, 1, 1, 1, 1, 1,
-1.49473, -0.8050646, -1.251091, 1, 1, 1, 1, 1,
-1.491301, 1.094855, -0.8166779, 1, 1, 1, 1, 1,
-1.483369, 2.027589, -0.7438832, 1, 1, 1, 1, 1,
-1.473009, -0.5941974, 0.07892297, 1, 1, 1, 1, 1,
-1.446897, -0.5815286, -2.334058, 1, 1, 1, 1, 1,
-1.434633, -0.1812421, -1.185173, 1, 1, 1, 1, 1,
-1.428084, -1.301096, -2.790192, 0, 0, 1, 1, 1,
-1.422636, -0.5034698, -1.953319, 1, 0, 0, 1, 1,
-1.420519, -0.6728616, -0.4235843, 1, 0, 0, 1, 1,
-1.415305, 1.063148, 0.2919104, 1, 0, 0, 1, 1,
-1.405794, -0.7713323, -1.650604, 1, 0, 0, 1, 1,
-1.405085, -1.335009, -4.411388, 1, 0, 0, 1, 1,
-1.404389, -0.1045318, -0.6944584, 0, 0, 0, 1, 1,
-1.39382, 0.5573975, -2.228742, 0, 0, 0, 1, 1,
-1.375508, 1.066428, -1.888994, 0, 0, 0, 1, 1,
-1.367349, -1.492079, -1.34151, 0, 0, 0, 1, 1,
-1.361258, -1.779054, -2.347497, 0, 0, 0, 1, 1,
-1.35749, 0.1943818, -0.9184719, 0, 0, 0, 1, 1,
-1.344741, 0.8345301, -1.720191, 0, 0, 0, 1, 1,
-1.344388, 0.7866091, -1.915471, 1, 1, 1, 1, 1,
-1.341681, -1.280199, -1.242724, 1, 1, 1, 1, 1,
-1.341171, -0.7119038, -0.6472949, 1, 1, 1, 1, 1,
-1.334692, -1.708015, -1.844444, 1, 1, 1, 1, 1,
-1.329127, -0.2316331, -3.034006, 1, 1, 1, 1, 1,
-1.325903, 0.03306041, 0.8237012, 1, 1, 1, 1, 1,
-1.325483, 1.034642, -1.37818, 1, 1, 1, 1, 1,
-1.31361, -1.14731, -2.037917, 1, 1, 1, 1, 1,
-1.310176, -0.3964586, -3.314022, 1, 1, 1, 1, 1,
-1.301908, 0.3812976, -1.420044, 1, 1, 1, 1, 1,
-1.3019, -0.7155795, -2.493374, 1, 1, 1, 1, 1,
-1.285147, -0.3960686, -0.6609737, 1, 1, 1, 1, 1,
-1.279678, 0.1834231, 0.4828433, 1, 1, 1, 1, 1,
-1.276799, 0.6838707, -1.805334, 1, 1, 1, 1, 1,
-1.266016, 0.5234814, -0.9910929, 1, 1, 1, 1, 1,
-1.263884, -0.9465656, -1.782075, 0, 0, 1, 1, 1,
-1.262838, 0.8447809, -2.152949, 1, 0, 0, 1, 1,
-1.262193, -0.02258504, -1.347663, 1, 0, 0, 1, 1,
-1.261149, -1.262959, -2.218085, 1, 0, 0, 1, 1,
-1.254716, 0.395339, -1.711607, 1, 0, 0, 1, 1,
-1.247266, 0.5112295, -0.5671831, 1, 0, 0, 1, 1,
-1.242802, 0.8730367, -1.915408, 0, 0, 0, 1, 1,
-1.23442, -1.09753, -3.342401, 0, 0, 0, 1, 1,
-1.19, -0.4860889, 0.7478586, 0, 0, 0, 1, 1,
-1.188428, -1.254379, -3.063944, 0, 0, 0, 1, 1,
-1.187264, 0.8865783, 0.155249, 0, 0, 0, 1, 1,
-1.180388, -2.187181, -3.641632, 0, 0, 0, 1, 1,
-1.17926, -1.749181, -3.66945, 0, 0, 0, 1, 1,
-1.178456, -1.678029, -3.468764, 1, 1, 1, 1, 1,
-1.176035, -0.1802033, -1.112283, 1, 1, 1, 1, 1,
-1.174284, 0.2824726, -0.001214297, 1, 1, 1, 1, 1,
-1.154235, 0.8035355, -0.6521767, 1, 1, 1, 1, 1,
-1.153747, 1.671198, -0.2143589, 1, 1, 1, 1, 1,
-1.151749, -0.1632756, -2.482655, 1, 1, 1, 1, 1,
-1.146881, -0.08472966, -0.1465915, 1, 1, 1, 1, 1,
-1.142521, -0.2338625, -1.875464, 1, 1, 1, 1, 1,
-1.133344, -0.2685898, -2.765177, 1, 1, 1, 1, 1,
-1.126145, 0.214902, -1.886015, 1, 1, 1, 1, 1,
-1.121557, 0.4466946, -2.202526, 1, 1, 1, 1, 1,
-1.100304, 2.036713, -0.880533, 1, 1, 1, 1, 1,
-1.094254, 1.009891, -1.318767, 1, 1, 1, 1, 1,
-1.093294, 0.9536605, 0.2668754, 1, 1, 1, 1, 1,
-1.090961, 0.00161054, -2.143188, 1, 1, 1, 1, 1,
-1.08521, -1.14929, -3.568191, 0, 0, 1, 1, 1,
-1.08301, 0.4096332, -1.304699, 1, 0, 0, 1, 1,
-1.082287, 1.642681, -2.125177, 1, 0, 0, 1, 1,
-1.071909, 0.2270606, -0.2079963, 1, 0, 0, 1, 1,
-1.066417, 0.5703133, -1.036803, 1, 0, 0, 1, 1,
-1.065062, -1.239189, -3.082546, 1, 0, 0, 1, 1,
-1.064294, 0.6160818, -1.102555, 0, 0, 0, 1, 1,
-1.050169, -1.441276, -3.805128, 0, 0, 0, 1, 1,
-1.047014, -0.5450121, -1.4015, 0, 0, 0, 1, 1,
-1.032454, 0.639157, -0.9210896, 0, 0, 0, 1, 1,
-1.025372, 0.4650031, -0.5307829, 0, 0, 0, 1, 1,
-1.022769, 1.315064, -1.994016, 0, 0, 0, 1, 1,
-1.022697, -0.4103888, -0.5041713, 0, 0, 0, 1, 1,
-1.021714, -0.3480474, -1.444107, 1, 1, 1, 1, 1,
-1.01568, 0.5301223, 0.06342972, 1, 1, 1, 1, 1,
-1.00679, 1.250306, 0.2536626, 1, 1, 1, 1, 1,
-1.000333, 1.206127, -0.7017702, 1, 1, 1, 1, 1,
-0.9796327, 0.6951624, -0.09094101, 1, 1, 1, 1, 1,
-0.9693173, -1.052146, -1.99666, 1, 1, 1, 1, 1,
-0.968814, -0.2441683, -3.408443, 1, 1, 1, 1, 1,
-0.9662529, 0.1748081, -1.635557, 1, 1, 1, 1, 1,
-0.961137, -1.235822, -2.608029, 1, 1, 1, 1, 1,
-0.9591035, 2.269712, 0.1746502, 1, 1, 1, 1, 1,
-0.9515995, 1.360825, -1.184826, 1, 1, 1, 1, 1,
-0.9509908, 0.05622041, -1.581451, 1, 1, 1, 1, 1,
-0.9396207, -0.6155726, -2.890016, 1, 1, 1, 1, 1,
-0.930399, 0.2926195, -2.777662, 1, 1, 1, 1, 1,
-0.9275044, -0.1733227, -3.011407, 1, 1, 1, 1, 1,
-0.9237012, 0.3267756, -0.8636985, 0, 0, 1, 1, 1,
-0.91693, -1.428221, -3.193393, 1, 0, 0, 1, 1,
-0.9124078, 0.2617362, -0.6182606, 1, 0, 0, 1, 1,
-0.9101392, 1.115532, 0.05899785, 1, 0, 0, 1, 1,
-0.9094469, 0.5586067, 0.2556966, 1, 0, 0, 1, 1,
-0.9089753, 0.3479301, -1.624464, 1, 0, 0, 1, 1,
-0.9044289, -1.609148, -1.902188, 0, 0, 0, 1, 1,
-0.8987198, 1.834746, -0.5362204, 0, 0, 0, 1, 1,
-0.8890476, 0.05573497, -0.9694499, 0, 0, 0, 1, 1,
-0.8735706, -0.3500628, -3.318169, 0, 0, 0, 1, 1,
-0.8726662, 0.4686358, -1.740389, 0, 0, 0, 1, 1,
-0.8705618, 2.057406, -1.201113, 0, 0, 0, 1, 1,
-0.8640916, -0.6476901, -3.577933, 0, 0, 0, 1, 1,
-0.8621487, 0.751222, -0.1530242, 1, 1, 1, 1, 1,
-0.8556374, 0.5812322, -0.2236549, 1, 1, 1, 1, 1,
-0.8549901, 3.000974, -0.1809182, 1, 1, 1, 1, 1,
-0.8546029, 0.02849919, -2.453641, 1, 1, 1, 1, 1,
-0.8456206, -0.3927554, -0.531023, 1, 1, 1, 1, 1,
-0.8407648, 3.269075, -0.5396512, 1, 1, 1, 1, 1,
-0.8396144, 1.171074, 0.2140513, 1, 1, 1, 1, 1,
-0.838601, -0.08332312, -1.72466, 1, 1, 1, 1, 1,
-0.8376843, -0.5110451, -3.085523, 1, 1, 1, 1, 1,
-0.8332775, -0.2541942, -2.995183, 1, 1, 1, 1, 1,
-0.8324299, 0.7513032, -1.26975, 1, 1, 1, 1, 1,
-0.8313326, -0.3061256, -2.958994, 1, 1, 1, 1, 1,
-0.8264928, -1.387822, -2.790185, 1, 1, 1, 1, 1,
-0.8103795, 0.7228693, 0.4396319, 1, 1, 1, 1, 1,
-0.8058692, -1.149277, -2.354306, 1, 1, 1, 1, 1,
-0.8008891, -0.09997078, -3.204012, 0, 0, 1, 1, 1,
-0.8000978, -0.5577943, -1.26868, 1, 0, 0, 1, 1,
-0.7987522, 0.08019588, -1.729362, 1, 0, 0, 1, 1,
-0.7945892, -1.109222, -2.35967, 1, 0, 0, 1, 1,
-0.7942896, -0.727229, -3.900061, 1, 0, 0, 1, 1,
-0.7941171, 1.422589, 1.185869, 1, 0, 0, 1, 1,
-0.7862304, -1.64124, -3.199897, 0, 0, 0, 1, 1,
-0.7847943, -1.054517, -1.367395, 0, 0, 0, 1, 1,
-0.7830679, 0.8048914, -1.615717, 0, 0, 0, 1, 1,
-0.7814369, 1.279119, -1.445123, 0, 0, 0, 1, 1,
-0.7793897, -0.6067405, -3.130962, 0, 0, 0, 1, 1,
-0.7784721, -0.6717396, -2.152471, 0, 0, 0, 1, 1,
-0.7756918, -0.2397231, -1.814148, 0, 0, 0, 1, 1,
-0.7660082, -1.019726, -3.367169, 1, 1, 1, 1, 1,
-0.7634677, 0.0513306, -2.605479, 1, 1, 1, 1, 1,
-0.7593163, 0.5309196, 2.019261, 1, 1, 1, 1, 1,
-0.7513077, 0.1910745, -1.353364, 1, 1, 1, 1, 1,
-0.7508185, 1.082133, -0.176085, 1, 1, 1, 1, 1,
-0.7491354, 0.1297374, -1.527608, 1, 1, 1, 1, 1,
-0.745576, -0.9900174, -3.882839, 1, 1, 1, 1, 1,
-0.7451019, 1.510401, -0.6029843, 1, 1, 1, 1, 1,
-0.7395162, -0.4920932, -1.660732, 1, 1, 1, 1, 1,
-0.7290806, 0.1955308, -0.9498074, 1, 1, 1, 1, 1,
-0.7281951, 0.7032617, -0.4610074, 1, 1, 1, 1, 1,
-0.7281547, -0.1355401, -1.366478, 1, 1, 1, 1, 1,
-0.7224007, -1.184218, -2.878328, 1, 1, 1, 1, 1,
-0.7213101, -0.2852208, 0.1117706, 1, 1, 1, 1, 1,
-0.7199326, 0.5251538, -0.1481446, 1, 1, 1, 1, 1,
-0.7188601, -0.4283569, -1.184008, 0, 0, 1, 1, 1,
-0.7128468, -0.2543541, -2.071918, 1, 0, 0, 1, 1,
-0.7118959, 0.186626, -2.2905, 1, 0, 0, 1, 1,
-0.7105816, -0.108313, -4.420695, 1, 0, 0, 1, 1,
-0.695453, 0.6982093, -2.065769, 1, 0, 0, 1, 1,
-0.6936073, -1.335167, -3.431937, 1, 0, 0, 1, 1,
-0.690094, 1.157452, -0.7340157, 0, 0, 0, 1, 1,
-0.6882978, -0.9831101, -2.075888, 0, 0, 0, 1, 1,
-0.6819692, -1.069611, -2.637803, 0, 0, 0, 1, 1,
-0.679592, 0.4530171, -1.91367, 0, 0, 0, 1, 1,
-0.6789935, -0.2756804, -2.037787, 0, 0, 0, 1, 1,
-0.6769927, -0.3408329, -2.228592, 0, 0, 0, 1, 1,
-0.6769071, -0.6904965, -2.529553, 0, 0, 0, 1, 1,
-0.668024, -1.076559, -3.464016, 1, 1, 1, 1, 1,
-0.6648366, 0.7677538, 0.1153306, 1, 1, 1, 1, 1,
-0.6471509, -0.2914527, 0.9200017, 1, 1, 1, 1, 1,
-0.6467816, 0.895538, 0.3251337, 1, 1, 1, 1, 1,
-0.6448011, 0.6511262, -0.09095164, 1, 1, 1, 1, 1,
-0.6417044, 0.4072844, -0.8092904, 1, 1, 1, 1, 1,
-0.63837, -0.8903112, -3.776065, 1, 1, 1, 1, 1,
-0.6377416, -0.7616658, -3.043639, 1, 1, 1, 1, 1,
-0.6321408, -0.7170215, -1.135148, 1, 1, 1, 1, 1,
-0.6273285, 0.8061637, 0.4159209, 1, 1, 1, 1, 1,
-0.6252332, 0.6884671, -1.248844, 1, 1, 1, 1, 1,
-0.6246656, 0.01763808, -1.224264, 1, 1, 1, 1, 1,
-0.6151237, -0.6457221, -1.587368, 1, 1, 1, 1, 1,
-0.614602, -1.700518, -1.181149, 1, 1, 1, 1, 1,
-0.6121368, 0.6684555, -2.113646, 1, 1, 1, 1, 1,
-0.6073348, -0.3771207, -3.862141, 0, 0, 1, 1, 1,
-0.6057319, 0.1104983, -1.78023, 1, 0, 0, 1, 1,
-0.6053684, 0.2895127, -1.056171, 1, 0, 0, 1, 1,
-0.6043482, -0.4722165, -3.064274, 1, 0, 0, 1, 1,
-0.6027436, 1.453832, 0.7868973, 1, 0, 0, 1, 1,
-0.6022631, 1.083113, -0.5887808, 1, 0, 0, 1, 1,
-0.6000155, 1.337051, -1.052737, 0, 0, 0, 1, 1,
-0.5989671, 0.3984264, 0.2089128, 0, 0, 0, 1, 1,
-0.5984548, 1.515001, 0.2532311, 0, 0, 0, 1, 1,
-0.5938233, 0.6968617, -0.6396717, 0, 0, 0, 1, 1,
-0.5913624, -1.199082, -2.207967, 0, 0, 0, 1, 1,
-0.5897163, 0.3827721, -0.3352436, 0, 0, 0, 1, 1,
-0.5882257, -0.8117895, -1.502518, 0, 0, 0, 1, 1,
-0.5842268, 1.215733, 0.1597174, 1, 1, 1, 1, 1,
-0.582152, 0.1265107, -2.151933, 1, 1, 1, 1, 1,
-0.5815095, 0.04031521, -1.664715, 1, 1, 1, 1, 1,
-0.579964, -1.166705, -2.058732, 1, 1, 1, 1, 1,
-0.5791874, -1.79189, -2.383363, 1, 1, 1, 1, 1,
-0.5783967, -1.414528, -2.08983, 1, 1, 1, 1, 1,
-0.575781, 0.6246305, -0.8219836, 1, 1, 1, 1, 1,
-0.5719696, 0.1604774, -1.323422, 1, 1, 1, 1, 1,
-0.5686764, -0.2542622, -0.4126014, 1, 1, 1, 1, 1,
-0.5633762, -0.3872658, -2.486014, 1, 1, 1, 1, 1,
-0.5628958, 1.174049, -0.4032998, 1, 1, 1, 1, 1,
-0.5620534, -0.1352879, -1.131739, 1, 1, 1, 1, 1,
-0.558242, -0.1006843, -1.955147, 1, 1, 1, 1, 1,
-0.5526721, 0.2041364, 0.1792559, 1, 1, 1, 1, 1,
-0.5510372, 2.119522, -1.489396, 1, 1, 1, 1, 1,
-0.550851, -0.4258607, -2.521734, 0, 0, 1, 1, 1,
-0.5507485, -0.9459946, -2.225994, 1, 0, 0, 1, 1,
-0.5479457, 0.333439, -1.915973, 1, 0, 0, 1, 1,
-0.5472314, -2.291582, -2.570129, 1, 0, 0, 1, 1,
-0.5456165, 0.745002, -2.236977, 1, 0, 0, 1, 1,
-0.5447752, 0.8592145, -0.9740883, 1, 0, 0, 1, 1,
-0.5428646, -1.045794, -2.185662, 0, 0, 0, 1, 1,
-0.5425329, 0.5794576, -0.9344041, 0, 0, 0, 1, 1,
-0.5396818, -0.02192905, -1.319008, 0, 0, 0, 1, 1,
-0.53474, -0.3050467, -1.294418, 0, 0, 0, 1, 1,
-0.5342262, 0.2200774, -1.313717, 0, 0, 0, 1, 1,
-0.5342104, -0.1061532, -1.938023, 0, 0, 0, 1, 1,
-0.5297667, -0.05931832, -0.9340753, 0, 0, 0, 1, 1,
-0.5293897, -0.9157847, -1.503091, 1, 1, 1, 1, 1,
-0.5278429, 0.2212262, -0.2496075, 1, 1, 1, 1, 1,
-0.5228291, -0.9235371, -2.327046, 1, 1, 1, 1, 1,
-0.5158192, 0.3106275, -2.087474, 1, 1, 1, 1, 1,
-0.5139066, 2.077776, -1.768649, 1, 1, 1, 1, 1,
-0.5112851, -0.3457346, -1.382455, 1, 1, 1, 1, 1,
-0.5108485, 1.788116, -0.2710242, 1, 1, 1, 1, 1,
-0.4934234, 0.5529827, -0.8439598, 1, 1, 1, 1, 1,
-0.4895703, -1.068638, -1.811862, 1, 1, 1, 1, 1,
-0.4891697, 0.5557084, -1.029359, 1, 1, 1, 1, 1,
-0.4881002, 0.8215952, 0.06862714, 1, 1, 1, 1, 1,
-0.48592, 0.5788913, -1.276957, 1, 1, 1, 1, 1,
-0.4855396, -0.09946887, 0.3782284, 1, 1, 1, 1, 1,
-0.4835566, -1.081915, -1.554838, 1, 1, 1, 1, 1,
-0.4826188, -0.04038436, -1.520473, 1, 1, 1, 1, 1,
-0.457754, 1.543872, 0.5285819, 0, 0, 1, 1, 1,
-0.4569081, 1.496621, -0.4585392, 1, 0, 0, 1, 1,
-0.4568359, -0.6667067, -1.86423, 1, 0, 0, 1, 1,
-0.4476259, 2.661433, -0.243367, 1, 0, 0, 1, 1,
-0.4453215, -1.777401, -1.883632, 1, 0, 0, 1, 1,
-0.4406596, 0.975256, -1.490178, 1, 0, 0, 1, 1,
-0.4365278, 0.2609191, -1.12321, 0, 0, 0, 1, 1,
-0.4339772, 1.166164, 0.145447, 0, 0, 0, 1, 1,
-0.4324877, -1.329942, -4.322537, 0, 0, 0, 1, 1,
-0.4303459, 0.8291119, -1.55201, 0, 0, 0, 1, 1,
-0.4288308, 0.7560183, -0.375611, 0, 0, 0, 1, 1,
-0.4249445, 0.6563571, -0.3984677, 0, 0, 0, 1, 1,
-0.4225264, 0.5462579, 0.6686018, 0, 0, 0, 1, 1,
-0.4211903, -0.01891414, -1.733938, 1, 1, 1, 1, 1,
-0.4173596, 1.509858, -1.315573, 1, 1, 1, 1, 1,
-0.4168026, 1.270177, -1.147269, 1, 1, 1, 1, 1,
-0.41269, 0.6624243, -0.1626785, 1, 1, 1, 1, 1,
-0.4120475, 0.0355814, -1.680348, 1, 1, 1, 1, 1,
-0.4114696, -0.7855725, -1.537765, 1, 1, 1, 1, 1,
-0.4061297, 0.03443655, -0.767486, 1, 1, 1, 1, 1,
-0.404552, 0.5334035, -0.5794725, 1, 1, 1, 1, 1,
-0.4035573, 0.1291308, -2.155994, 1, 1, 1, 1, 1,
-0.403129, 0.2033613, 0.1747421, 1, 1, 1, 1, 1,
-0.4030191, 0.1492674, -2.426947, 1, 1, 1, 1, 1,
-0.4018593, 0.6417053, -1.169469, 1, 1, 1, 1, 1,
-0.4010334, -0.8263739, -2.596701, 1, 1, 1, 1, 1,
-0.3900519, -1.986948, -3.708776, 1, 1, 1, 1, 1,
-0.3889487, -0.5410676, -0.4177193, 1, 1, 1, 1, 1,
-0.3887779, 1.692102, 2.600965, 0, 0, 1, 1, 1,
-0.3875593, -0.1424178, -0.5706047, 1, 0, 0, 1, 1,
-0.3816938, -1.026913, -2.333467, 1, 0, 0, 1, 1,
-0.379543, 0.1322947, -1.188738, 1, 0, 0, 1, 1,
-0.3792815, 1.221071, -0.3888527, 1, 0, 0, 1, 1,
-0.376163, -0.6303116, -4.119675, 1, 0, 0, 1, 1,
-0.3726569, 0.3927611, -1.079419, 0, 0, 0, 1, 1,
-0.3691121, 0.6236787, 0.3689289, 0, 0, 0, 1, 1,
-0.3669705, -1.363858, -2.509605, 0, 0, 0, 1, 1,
-0.3622079, -2.083908, -3.928964, 0, 0, 0, 1, 1,
-0.3610641, 0.04785709, -3.729479, 0, 0, 0, 1, 1,
-0.3601374, 0.9062095, 1.482189, 0, 0, 0, 1, 1,
-0.3595749, -0.2922044, -2.489478, 0, 0, 0, 1, 1,
-0.3582526, -0.556062, -1.420083, 1, 1, 1, 1, 1,
-0.3459257, 0.4230903, -1.276316, 1, 1, 1, 1, 1,
-0.3442141, -1.653108, -4.292233, 1, 1, 1, 1, 1,
-0.3402632, 1.673082, 0.3431149, 1, 1, 1, 1, 1,
-0.3386318, -1.356704, -2.77796, 1, 1, 1, 1, 1,
-0.3379066, 0.7032259, -1.846233, 1, 1, 1, 1, 1,
-0.332413, 0.3878004, -0.7386885, 1, 1, 1, 1, 1,
-0.3285474, 0.1432056, -1.75593, 1, 1, 1, 1, 1,
-0.3278597, -0.3285929, -1.869334, 1, 1, 1, 1, 1,
-0.3238438, 0.7755993, -1.486741, 1, 1, 1, 1, 1,
-0.322911, 0.2901473, -0.601697, 1, 1, 1, 1, 1,
-0.3219511, -0.360095, -2.960298, 1, 1, 1, 1, 1,
-0.3169538, 0.4435002, -0.9309547, 1, 1, 1, 1, 1,
-0.3156822, 0.6617914, -0.9298961, 1, 1, 1, 1, 1,
-0.3139046, -2.568638, -2.30091, 1, 1, 1, 1, 1,
-0.3127997, 2.866396, -1.653061, 0, 0, 1, 1, 1,
-0.3103884, 1.571563, -1.385252, 1, 0, 0, 1, 1,
-0.302391, 1.13676, -0.3716845, 1, 0, 0, 1, 1,
-0.2998323, 0.7049469, 0.8215094, 1, 0, 0, 1, 1,
-0.2997783, 0.5291776, -0.00994287, 1, 0, 0, 1, 1,
-0.2970704, 0.7230285, 0.2588205, 1, 0, 0, 1, 1,
-0.2951277, 0.9294828, 0.5684381, 0, 0, 0, 1, 1,
-0.2938333, 0.3194258, 0.392075, 0, 0, 0, 1, 1,
-0.2906768, -1.721813, -2.456341, 0, 0, 0, 1, 1,
-0.2894987, 1.433685, -0.07144611, 0, 0, 0, 1, 1,
-0.2772835, 0.5431958, -0.9445646, 0, 0, 0, 1, 1,
-0.2764756, 0.5447794, -0.1434072, 0, 0, 0, 1, 1,
-0.2757082, -1.414857, -2.792679, 0, 0, 0, 1, 1,
-0.2737809, -0.4587457, -1.657926, 1, 1, 1, 1, 1,
-0.2667158, 1.197107, -2.150503, 1, 1, 1, 1, 1,
-0.2651286, -1.001899, -2.908771, 1, 1, 1, 1, 1,
-0.262417, 0.187752, 0.2197112, 1, 1, 1, 1, 1,
-0.258931, -0.4592506, -3.835442, 1, 1, 1, 1, 1,
-0.2582596, -1.59353, -3.976974, 1, 1, 1, 1, 1,
-0.2472296, -0.6014217, -1.577138, 1, 1, 1, 1, 1,
-0.2465147, 0.7008928, -1.14897, 1, 1, 1, 1, 1,
-0.2384337, -1.288196, -2.62818, 1, 1, 1, 1, 1,
-0.2352171, 0.3990819, -1.432972, 1, 1, 1, 1, 1,
-0.2310946, -1.493032, -3.522291, 1, 1, 1, 1, 1,
-0.2241709, -0.203183, -1.758731, 1, 1, 1, 1, 1,
-0.2240823, -0.2081805, 0.04193164, 1, 1, 1, 1, 1,
-0.2235318, 1.715784, 0.8290306, 1, 1, 1, 1, 1,
-0.2231915, 0.5249575, -2.45745, 1, 1, 1, 1, 1,
-0.2229566, -1.118865, -3.385886, 0, 0, 1, 1, 1,
-0.2214657, 1.019953, -1.727469, 1, 0, 0, 1, 1,
-0.220286, 0.1430761, -0.5114704, 1, 0, 0, 1, 1,
-0.2182258, -0.1156497, -0.7578555, 1, 0, 0, 1, 1,
-0.2142263, 1.461959, -0.5324107, 1, 0, 0, 1, 1,
-0.208978, -0.4391065, -3.21179, 1, 0, 0, 1, 1,
-0.2077136, 0.3305219, -2.168087, 0, 0, 0, 1, 1,
-0.2043459, 2.228227, 0.3825805, 0, 0, 0, 1, 1,
-0.1999048, -0.3619777, -1.955626, 0, 0, 0, 1, 1,
-0.1968025, -0.0519779, -2.181956, 0, 0, 0, 1, 1,
-0.1967948, 0.5822371, -1.018016, 0, 0, 0, 1, 1,
-0.1962149, 0.1678839, -0.4604474, 0, 0, 0, 1, 1,
-0.195529, 0.7760713, -1.123652, 0, 0, 0, 1, 1,
-0.1939609, 1.18811, 0.1258613, 1, 1, 1, 1, 1,
-0.1939166, -1.071022, -4.036781, 1, 1, 1, 1, 1,
-0.1924593, 0.5559663, -0.241792, 1, 1, 1, 1, 1,
-0.1915314, -1.084507, -0.6245443, 1, 1, 1, 1, 1,
-0.1905447, 0.3976783, -0.1898194, 1, 1, 1, 1, 1,
-0.1894945, -0.4031401, -0.8132095, 1, 1, 1, 1, 1,
-0.1854733, -0.3027039, -1.884411, 1, 1, 1, 1, 1,
-0.1841652, -0.3877658, -2.564316, 1, 1, 1, 1, 1,
-0.1839415, 1.40791, -0.5807943, 1, 1, 1, 1, 1,
-0.1820898, 0.156457, -0.4881961, 1, 1, 1, 1, 1,
-0.1790473, -0.4054985, -1.218131, 1, 1, 1, 1, 1,
-0.1786291, -0.5741086, -3.171191, 1, 1, 1, 1, 1,
-0.1752048, -0.6213508, -4.798196, 1, 1, 1, 1, 1,
-0.1739485, 1.249692, -0.1525582, 1, 1, 1, 1, 1,
-0.1722015, -0.9629436, -3.719927, 1, 1, 1, 1, 1,
-0.1674738, 1.496824, -1.332671, 0, 0, 1, 1, 1,
-0.1634422, -1.418598, -2.470287, 1, 0, 0, 1, 1,
-0.1633964, 1.052726, -0.08882912, 1, 0, 0, 1, 1,
-0.1627506, -1.985493, -3.555743, 1, 0, 0, 1, 1,
-0.1620741, 1.717873, -0.4386367, 1, 0, 0, 1, 1,
-0.1560275, 0.3593692, -0.2615763, 1, 0, 0, 1, 1,
-0.1503355, -1.386849, -4.54343, 0, 0, 0, 1, 1,
-0.1460911, -0.6832768, -2.923406, 0, 0, 0, 1, 1,
-0.1459532, -0.06574398, -2.20076, 0, 0, 0, 1, 1,
-0.1446717, 0.5205031, 0.6738321, 0, 0, 0, 1, 1,
-0.1415783, -0.5077894, -2.46546, 0, 0, 0, 1, 1,
-0.1412166, -0.5947903, -2.675423, 0, 0, 0, 1, 1,
-0.1406124, -0.8192123, -3.43114, 0, 0, 0, 1, 1,
-0.1393691, -0.2701726, -1.915225, 1, 1, 1, 1, 1,
-0.137097, -0.1246111, -3.082191, 1, 1, 1, 1, 1,
-0.1365108, 0.5524672, -1.495271, 1, 1, 1, 1, 1,
-0.1333132, 0.2554469, -1.006762, 1, 1, 1, 1, 1,
-0.1265181, 0.7856017, -0.3136167, 1, 1, 1, 1, 1,
-0.1232702, 0.3375649, 0.3975795, 1, 1, 1, 1, 1,
-0.1211352, 0.3637484, -2.199711, 1, 1, 1, 1, 1,
-0.1205007, 0.134465, 0.841388, 1, 1, 1, 1, 1,
-0.1164776, 0.1792573, -1.283593, 1, 1, 1, 1, 1,
-0.1160499, -0.9183676, -2.510935, 1, 1, 1, 1, 1,
-0.1146967, -1.179611, -2.426614, 1, 1, 1, 1, 1,
-0.1133237, -0.7853883, -4.802171, 1, 1, 1, 1, 1,
-0.1131929, -1.141516, -3.377127, 1, 1, 1, 1, 1,
-0.1123, -0.1218565, -1.691876, 1, 1, 1, 1, 1,
-0.1102698, -0.653362, -3.232686, 1, 1, 1, 1, 1,
-0.1071071, 1.024651, -0.3187362, 0, 0, 1, 1, 1,
-0.1060833, 0.7131488, 1.175972, 1, 0, 0, 1, 1,
-0.1030367, 1.984877, 0.1995708, 1, 0, 0, 1, 1,
-0.09980816, 2.24053, -1.208656, 1, 0, 0, 1, 1,
-0.09354497, 0.6336857, -1.651921, 1, 0, 0, 1, 1,
-0.09192891, -2.437576, -4.347894, 1, 0, 0, 1, 1,
-0.0917104, -0.3451433, -0.9662759, 0, 0, 0, 1, 1,
-0.08568387, 1.714626, 0.4037513, 0, 0, 0, 1, 1,
-0.08085226, -1.200407, -2.371549, 0, 0, 0, 1, 1,
-0.08047425, 0.2891425, 0.5322377, 0, 0, 0, 1, 1,
-0.07634374, -0.7429695, -3.395828, 0, 0, 0, 1, 1,
-0.07568359, -0.2450689, -1.773387, 0, 0, 0, 1, 1,
-0.07310858, -1.085055, -4.123573, 0, 0, 0, 1, 1,
-0.07183804, -1.326196, -4.548665, 1, 1, 1, 1, 1,
-0.07175978, 0.1755296, 1.46047, 1, 1, 1, 1, 1,
-0.07110105, 0.06313778, -0.2331054, 1, 1, 1, 1, 1,
-0.06971955, -0.1704479, -2.298494, 1, 1, 1, 1, 1,
-0.0686659, -0.0413418, -1.351517, 1, 1, 1, 1, 1,
-0.06472936, 0.3410325, -0.6158962, 1, 1, 1, 1, 1,
-0.06457084, -0.4944775, -3.950356, 1, 1, 1, 1, 1,
-0.06444997, -0.8823712, -2.832263, 1, 1, 1, 1, 1,
-0.05973122, -0.1542276, -1.19087, 1, 1, 1, 1, 1,
-0.05518947, 0.1717958, 0.1575872, 1, 1, 1, 1, 1,
-0.05234013, -0.6509801, -4.735753, 1, 1, 1, 1, 1,
-0.05227713, 0.4116889, -0.2649476, 1, 1, 1, 1, 1,
-0.05184184, -0.4658217, -3.344648, 1, 1, 1, 1, 1,
-0.05113312, -0.3987086, -4.119726, 1, 1, 1, 1, 1,
-0.05043619, 0.1286, 1.393929, 1, 1, 1, 1, 1,
-0.04676506, 0.5502123, -0.7554422, 0, 0, 1, 1, 1,
-0.04451115, 0.4399656, 1.166426, 1, 0, 0, 1, 1,
-0.03904527, -1.258818, -5.138815, 1, 0, 0, 1, 1,
-0.03904084, -0.7278159, -2.115716, 1, 0, 0, 1, 1,
-0.03617062, -1.148118, -2.91941, 1, 0, 0, 1, 1,
-0.03013421, 0.445773, -0.2127505, 1, 0, 0, 1, 1,
-0.02985858, -0.3652076, -2.627559, 0, 0, 0, 1, 1,
-0.02343346, 0.4526827, -0.5076422, 0, 0, 0, 1, 1,
-0.02320146, -0.8822445, -3.280959, 0, 0, 0, 1, 1,
-0.02042362, 0.3409842, 0.5001638, 0, 0, 0, 1, 1,
-0.01521815, 0.3763991, 0.5350634, 0, 0, 0, 1, 1,
-0.01471149, -1.018706, -0.6904131, 0, 0, 0, 1, 1,
-0.01146946, 1.604499, -0.5172016, 0, 0, 0, 1, 1,
-0.01098787, -1.80152, -3.552461, 1, 1, 1, 1, 1,
-0.004776066, -0.1580004, -1.601568, 1, 1, 1, 1, 1,
-0.001070029, 1.294693, -0.5059323, 1, 1, 1, 1, 1,
0.005853854, 1.356174, 1.059807, 1, 1, 1, 1, 1,
0.007032982, 0.5430189, 0.7693854, 1, 1, 1, 1, 1,
0.009653379, -1.2265, 3.09389, 1, 1, 1, 1, 1,
0.01088303, -0.8253163, 3.700767, 1, 1, 1, 1, 1,
0.0110192, -0.2016046, 3.799226, 1, 1, 1, 1, 1,
0.01232593, 1.717444, -0.4811427, 1, 1, 1, 1, 1,
0.01326085, 1.404762, -0.06579392, 1, 1, 1, 1, 1,
0.01656886, 0.3388825, 0.8231339, 1, 1, 1, 1, 1,
0.02164426, 0.6231103, -0.7483093, 1, 1, 1, 1, 1,
0.02183276, -0.01642411, 2.095334, 1, 1, 1, 1, 1,
0.02845962, 0.9654161, 0.4620695, 1, 1, 1, 1, 1,
0.03042288, -1.459137, 1.342842, 1, 1, 1, 1, 1,
0.03140352, -0.8548637, 4.283319, 0, 0, 1, 1, 1,
0.03445617, 0.8778003, 0.1829446, 1, 0, 0, 1, 1,
0.03585195, 0.8416551, -0.6503159, 1, 0, 0, 1, 1,
0.03627129, -0.6686511, 4.167734, 1, 0, 0, 1, 1,
0.0370497, 0.03992857, 1.307395, 1, 0, 0, 1, 1,
0.03749927, -1.310758, 2.503099, 1, 0, 0, 1, 1,
0.04133185, -0.3529015, 2.829165, 0, 0, 0, 1, 1,
0.04533274, 1.52428, 2.629978, 0, 0, 0, 1, 1,
0.04750244, -0.4004772, 2.373552, 0, 0, 0, 1, 1,
0.04835981, -1.063647, 3.983849, 0, 0, 0, 1, 1,
0.04947283, -0.5835694, 3.632723, 0, 0, 0, 1, 1,
0.04958881, -1.645837, 3.610539, 0, 0, 0, 1, 1,
0.05770588, -0.3665068, 2.668367, 0, 0, 0, 1, 1,
0.06349658, 0.152134, -0.9512094, 1, 1, 1, 1, 1,
0.06354395, 1.389076, 0.621264, 1, 1, 1, 1, 1,
0.06436086, -0.2618341, 3.318498, 1, 1, 1, 1, 1,
0.06469772, -1.142037, 3.481904, 1, 1, 1, 1, 1,
0.06541241, -0.715546, 3.283289, 1, 1, 1, 1, 1,
0.06841865, -0.4120296, 3.570153, 1, 1, 1, 1, 1,
0.07826953, -0.8010898, 1.631147, 1, 1, 1, 1, 1,
0.08368458, -0.737027, 5.268545, 1, 1, 1, 1, 1,
0.08678634, -1.044808, 3.082267, 1, 1, 1, 1, 1,
0.09314223, -1.12117, 3.222891, 1, 1, 1, 1, 1,
0.09641164, 0.1652562, -1.090142, 1, 1, 1, 1, 1,
0.1026658, 0.9813278, 0.7817796, 1, 1, 1, 1, 1,
0.1040338, -0.5512187, 2.222856, 1, 1, 1, 1, 1,
0.1045793, -0.17402, 1.308629, 1, 1, 1, 1, 1,
0.1053204, 0.3316785, -1.841461, 1, 1, 1, 1, 1,
0.1069397, -0.4611872, 2.152368, 0, 0, 1, 1, 1,
0.1123379, -0.4710277, 3.505237, 1, 0, 0, 1, 1,
0.1141939, 0.1262376, -1.304018, 1, 0, 0, 1, 1,
0.1144108, -0.03225687, 2.54891, 1, 0, 0, 1, 1,
0.1158249, 0.6520399, -0.1525081, 1, 0, 0, 1, 1,
0.1202929, -0.504365, 3.03082, 1, 0, 0, 1, 1,
0.1245159, -0.46136, 1.666031, 0, 0, 0, 1, 1,
0.128899, 1.191497, -0.1772391, 0, 0, 0, 1, 1,
0.1291706, 0.8259761, 0.9908202, 0, 0, 0, 1, 1,
0.1317642, 0.5202509, 0.9061264, 0, 0, 0, 1, 1,
0.1325489, -0.1309434, 2.803332, 0, 0, 0, 1, 1,
0.1337208, 1.379003, -1.326433, 0, 0, 0, 1, 1,
0.1390936, 0.1152951, 0.2221761, 0, 0, 0, 1, 1,
0.1421493, -0.3701578, -0.4595856, 1, 1, 1, 1, 1,
0.1428651, -1.189866, 4.469604, 1, 1, 1, 1, 1,
0.1430581, 1.324367, -0.6079396, 1, 1, 1, 1, 1,
0.1461294, -0.8596085, 1.107555, 1, 1, 1, 1, 1,
0.1539542, -0.3939002, 1.829132, 1, 1, 1, 1, 1,
0.154163, -0.2910326, 2.972221, 1, 1, 1, 1, 1,
0.1548333, -1.078141, 3.141493, 1, 1, 1, 1, 1,
0.1581741, -0.6956685, 3.088356, 1, 1, 1, 1, 1,
0.1645266, 2.022978, 0.9069739, 1, 1, 1, 1, 1,
0.1705291, 0.6810381, 0.2165506, 1, 1, 1, 1, 1,
0.1705889, -0.2932347, 4.084121, 1, 1, 1, 1, 1,
0.1710977, -0.1580436, 1.978161, 1, 1, 1, 1, 1,
0.17113, 0.1585685, 0.3435155, 1, 1, 1, 1, 1,
0.1718486, 0.5059877, 0.3032492, 1, 1, 1, 1, 1,
0.1799401, -0.0578331, 1.835818, 1, 1, 1, 1, 1,
0.1823726, -0.118204, 2.269613, 0, 0, 1, 1, 1,
0.1833485, -0.1140171, 3.324273, 1, 0, 0, 1, 1,
0.1898386, -0.01151064, 1.874797, 1, 0, 0, 1, 1,
0.1898996, -1.898706, 2.162586, 1, 0, 0, 1, 1,
0.1905268, -0.2311245, 1.926212, 1, 0, 0, 1, 1,
0.1937036, 1.072693, 0.2893478, 1, 0, 0, 1, 1,
0.1955803, -1.342352, 1.835584, 0, 0, 0, 1, 1,
0.200211, -0.4845928, 2.411272, 0, 0, 0, 1, 1,
0.2007317, -2.113507, 3.347568, 0, 0, 0, 1, 1,
0.2012541, -1.679765, 1.507479, 0, 0, 0, 1, 1,
0.2021587, -1.471485, 3.146221, 0, 0, 0, 1, 1,
0.2042996, 1.848667, 0.114798, 0, 0, 0, 1, 1,
0.2054994, 0.7039046, -0.4909765, 0, 0, 0, 1, 1,
0.2057611, 0.1505562, -0.3727918, 1, 1, 1, 1, 1,
0.2074402, 0.7491333, 1.44999, 1, 1, 1, 1, 1,
0.207652, -0.2525271, 2.151033, 1, 1, 1, 1, 1,
0.2120518, 0.5197078, 1.610249, 1, 1, 1, 1, 1,
0.2211289, -0.5365054, 4.92581, 1, 1, 1, 1, 1,
0.222863, -0.3372277, 1.409363, 1, 1, 1, 1, 1,
0.223001, 1.024437, -0.4604733, 1, 1, 1, 1, 1,
0.2239508, 1.206489, -0.1126958, 1, 1, 1, 1, 1,
0.2240756, 1.042425, 1.536248, 1, 1, 1, 1, 1,
0.2257822, -0.3274833, 1.501655, 1, 1, 1, 1, 1,
0.2264876, 0.6470665, 0.9479108, 1, 1, 1, 1, 1,
0.2305042, 1.872292, -0.0490063, 1, 1, 1, 1, 1,
0.2319499, 0.3815748, -0.4336057, 1, 1, 1, 1, 1,
0.2326906, -0.8083559, 3.28503, 1, 1, 1, 1, 1,
0.2343263, 0.07053293, 1.342061, 1, 1, 1, 1, 1,
0.2350423, 0.9461918, -0.2418677, 0, 0, 1, 1, 1,
0.2360681, -0.138832, 1.430464, 1, 0, 0, 1, 1,
0.2362294, -0.4134735, 2.431381, 1, 0, 0, 1, 1,
0.2366707, -1.238448, 3.305585, 1, 0, 0, 1, 1,
0.2435722, -0.1492222, 2.161689, 1, 0, 0, 1, 1,
0.2437023, -0.3837905, 2.426224, 1, 0, 0, 1, 1,
0.2498588, -0.5284404, 3.261043, 0, 0, 0, 1, 1,
0.2541791, -0.4322686, 1.358587, 0, 0, 0, 1, 1,
0.2554027, 0.1150228, -0.110173, 0, 0, 0, 1, 1,
0.2578308, -1.811023, 3.190439, 0, 0, 0, 1, 1,
0.2584192, -1.828576, 4.162649, 0, 0, 0, 1, 1,
0.2591128, -0.7865856, 3.551072, 0, 0, 0, 1, 1,
0.2595873, 1.026191, 1.62247, 0, 0, 0, 1, 1,
0.2657692, -0.5028728, 2.981113, 1, 1, 1, 1, 1,
0.2679167, -0.3698911, 1.004558, 1, 1, 1, 1, 1,
0.2719069, -0.3574148, 4.216354, 1, 1, 1, 1, 1,
0.2842847, -0.07810565, 1.604311, 1, 1, 1, 1, 1,
0.2914948, -0.9160611, 3.20157, 1, 1, 1, 1, 1,
0.294472, -1.697213, 3.157507, 1, 1, 1, 1, 1,
0.2982507, -0.1060382, 4.081862, 1, 1, 1, 1, 1,
0.2998504, 1.968449, 0.07750199, 1, 1, 1, 1, 1,
0.3009658, -1.315972, 1.504937, 1, 1, 1, 1, 1,
0.3022525, 0.5564291, 1.109458, 1, 1, 1, 1, 1,
0.3051262, 0.5508831, -0.9699074, 1, 1, 1, 1, 1,
0.3067416, 1.325864, 1.112494, 1, 1, 1, 1, 1,
0.3101931, -1.225801, 4.455586, 1, 1, 1, 1, 1,
0.3134043, 1.276598, 1.211918, 1, 1, 1, 1, 1,
0.3134723, -1.957075, 2.841282, 1, 1, 1, 1, 1,
0.3147055, 1.298158, 0.8692095, 0, 0, 1, 1, 1,
0.3156074, 0.9925439, -0.3996169, 1, 0, 0, 1, 1,
0.3179444, 2.703066, -2.143989, 1, 0, 0, 1, 1,
0.3181226, 1.630265, 0.517346, 1, 0, 0, 1, 1,
0.3187548, -2.694487, 2.308145, 1, 0, 0, 1, 1,
0.3282952, -0.4531024, 2.435107, 1, 0, 0, 1, 1,
0.3298822, 0.3157607, 0.6187333, 0, 0, 0, 1, 1,
0.3298922, 0.5546845, 0.2700549, 0, 0, 0, 1, 1,
0.3424296, 0.3712352, 0.4014001, 0, 0, 0, 1, 1,
0.3437819, -0.1465196, 3.236006, 0, 0, 0, 1, 1,
0.3504958, 0.4895363, -2.250256, 0, 0, 0, 1, 1,
0.3514162, 1.240744, 1.417757, 0, 0, 0, 1, 1,
0.3615138, 0.762118, -0.3924556, 0, 0, 0, 1, 1,
0.3632513, -0.2992991, 4.109458, 1, 1, 1, 1, 1,
0.3673282, 0.7918286, 0.2855132, 1, 1, 1, 1, 1,
0.3684598, -1.078533, 5.29665, 1, 1, 1, 1, 1,
0.3690748, 0.7676471, 1.361469, 1, 1, 1, 1, 1,
0.3711912, -0.7872149, 4.626468, 1, 1, 1, 1, 1,
0.3726703, 0.7276222, -1.007124, 1, 1, 1, 1, 1,
0.3745017, -1.287161, 1.984207, 1, 1, 1, 1, 1,
0.3749033, 0.8401907, -1.773426, 1, 1, 1, 1, 1,
0.3820375, 1.279458, 2.314903, 1, 1, 1, 1, 1,
0.3838991, -1.073769, 4.464934, 1, 1, 1, 1, 1,
0.3857134, 2.732704, -0.4997793, 1, 1, 1, 1, 1,
0.3916348, 0.684586, -0.7164514, 1, 1, 1, 1, 1,
0.393837, 1.476168, -0.7002125, 1, 1, 1, 1, 1,
0.3954958, -0.4041911, 1.183654, 1, 1, 1, 1, 1,
0.4007543, -1.019234, 3.667275, 1, 1, 1, 1, 1,
0.400912, 0.6083103, -1.215423, 0, 0, 1, 1, 1,
0.4040269, 0.04167581, 1.057, 1, 0, 0, 1, 1,
0.405355, -1.240964, 1.461794, 1, 0, 0, 1, 1,
0.4055345, -2.226772, 3.957422, 1, 0, 0, 1, 1,
0.4098741, 0.5414737, -0.1791888, 1, 0, 0, 1, 1,
0.4111099, -0.2326162, 1.462455, 1, 0, 0, 1, 1,
0.4137086, 1.186075, 1.676591, 0, 0, 0, 1, 1,
0.4172955, 1.389501, -0.06984452, 0, 0, 0, 1, 1,
0.4189713, -0.6470994, 0.754679, 0, 0, 0, 1, 1,
0.42333, -0.02204031, 0.4714765, 0, 0, 0, 1, 1,
0.4300806, -1.978798, 3.150237, 0, 0, 0, 1, 1,
0.4302418, -0.2234198, 0.534406, 0, 0, 0, 1, 1,
0.4335399, 0.4477421, 0.1110232, 0, 0, 0, 1, 1,
0.441331, 0.02763125, 3.357102, 1, 1, 1, 1, 1,
0.4424365, 0.390822, 0.9895757, 1, 1, 1, 1, 1,
0.4433873, 0.4466631, 1.409057, 1, 1, 1, 1, 1,
0.4463464, -0.9497185, 2.814705, 1, 1, 1, 1, 1,
0.4474171, -0.6972882, 2.281969, 1, 1, 1, 1, 1,
0.4480726, -0.6614424, 2.608651, 1, 1, 1, 1, 1,
0.4486981, -2.258247, 2.245158, 1, 1, 1, 1, 1,
0.4514137, 0.6548508, -1.098875, 1, 1, 1, 1, 1,
0.4525115, 0.4318335, 0.7532564, 1, 1, 1, 1, 1,
0.4533129, 1.075257, 0.6652566, 1, 1, 1, 1, 1,
0.4596656, 0.8081333, -0.2202517, 1, 1, 1, 1, 1,
0.4600253, -1.799631, 1.020395, 1, 1, 1, 1, 1,
0.4603097, 0.5598807, 2.601615, 1, 1, 1, 1, 1,
0.4623822, 0.4554085, 1.440565, 1, 1, 1, 1, 1,
0.4685421, 0.4647408, -0.1629755, 1, 1, 1, 1, 1,
0.4732269, -0.3915375, 2.796916, 0, 0, 1, 1, 1,
0.4740157, -0.8882055, 3.179115, 1, 0, 0, 1, 1,
0.4778572, 0.6439059, 1.834243, 1, 0, 0, 1, 1,
0.4820549, -2.220099, 2.554435, 1, 0, 0, 1, 1,
0.4824739, -0.626617, 0.9329291, 1, 0, 0, 1, 1,
0.4940093, -0.2179859, 1.13222, 1, 0, 0, 1, 1,
0.4986093, 0.6115317, 0.86203, 0, 0, 0, 1, 1,
0.4988904, -0.290684, 2.369024, 0, 0, 0, 1, 1,
0.499967, -0.5874252, 3.240479, 0, 0, 0, 1, 1,
0.5042558, 1.89908, 0.7305777, 0, 0, 0, 1, 1,
0.5072539, -1.07524, 1.553639, 0, 0, 0, 1, 1,
0.5096129, 0.03016544, 0.6181325, 0, 0, 0, 1, 1,
0.5100173, -0.6214679, 2.278582, 0, 0, 0, 1, 1,
0.5117201, -0.2143936, 1.819115, 1, 1, 1, 1, 1,
0.5231435, -0.2833597, -0.3719601, 1, 1, 1, 1, 1,
0.5279573, 1.081072, -0.7802464, 1, 1, 1, 1, 1,
0.529566, 0.5325515, 1.735405, 1, 1, 1, 1, 1,
0.5317901, 0.1500682, 3.237901, 1, 1, 1, 1, 1,
0.5374861, -1.726187, 2.615286, 1, 1, 1, 1, 1,
0.5387954, 1.126949, 2.161025, 1, 1, 1, 1, 1,
0.5423282, 0.2514686, 0.6105015, 1, 1, 1, 1, 1,
0.5480467, -0.5903628, 1.781618, 1, 1, 1, 1, 1,
0.5486839, -0.1725954, 1.659686, 1, 1, 1, 1, 1,
0.5553361, 1.797656, 0.225166, 1, 1, 1, 1, 1,
0.5587725, 0.5138527, 1.845019, 1, 1, 1, 1, 1,
0.5604525, -0.6140145, 2.615185, 1, 1, 1, 1, 1,
0.5621043, -0.1195565, 2.242418, 1, 1, 1, 1, 1,
0.5652555, -0.2037196, 1.907861, 1, 1, 1, 1, 1,
0.5664548, -0.8525445, 3.059701, 0, 0, 1, 1, 1,
0.5694724, 0.2296288, 2.284838, 1, 0, 0, 1, 1,
0.5749873, -0.2248095, 2.616284, 1, 0, 0, 1, 1,
0.5788724, 1.155897, -0.8374094, 1, 0, 0, 1, 1,
0.5813924, 1.409163, 0.4620569, 1, 0, 0, 1, 1,
0.5833355, -0.9969292, 2.616732, 1, 0, 0, 1, 1,
0.5879797, 0.244008, 0.9833809, 0, 0, 0, 1, 1,
0.590112, 1.334083, 0.1168108, 0, 0, 0, 1, 1,
0.5927083, 0.5461862, 0.401567, 0, 0, 0, 1, 1,
0.5994034, -1.827069, 0.6291969, 0, 0, 0, 1, 1,
0.6053319, 0.3620597, -0.8770654, 0, 0, 0, 1, 1,
0.6070939, 0.01367316, 1.784243, 0, 0, 0, 1, 1,
0.6092366, -0.5993769, 2.475003, 0, 0, 0, 1, 1,
0.616437, -0.1921037, 1.833424, 1, 1, 1, 1, 1,
0.6224971, 0.2468466, 0.9099177, 1, 1, 1, 1, 1,
0.6234419, 1.415839, 0.6506748, 1, 1, 1, 1, 1,
0.6252573, -0.3518475, 1.812659, 1, 1, 1, 1, 1,
0.6277202, -0.7175101, 1.277333, 1, 1, 1, 1, 1,
0.6348296, -0.3270248, 2.16987, 1, 1, 1, 1, 1,
0.6357278, -0.699804, 1.527622, 1, 1, 1, 1, 1,
0.6364552, -1.104461, 1.944571, 1, 1, 1, 1, 1,
0.6392352, -0.5689573, 1.288859, 1, 1, 1, 1, 1,
0.6434369, -0.6971235, 0.9817457, 1, 1, 1, 1, 1,
0.644315, -0.7070595, 2.923189, 1, 1, 1, 1, 1,
0.6445858, 0.1339208, 1.881428, 1, 1, 1, 1, 1,
0.6463524, 0.07971953, 1.755189, 1, 1, 1, 1, 1,
0.646859, 0.5275598, 0.2343114, 1, 1, 1, 1, 1,
0.6502923, 0.867862, 2.973506, 1, 1, 1, 1, 1,
0.6600521, -0.824493, 4.111289, 0, 0, 1, 1, 1,
0.6612011, 0.1321392, 2.123612, 1, 0, 0, 1, 1,
0.6630427, -0.05396254, 1.217663, 1, 0, 0, 1, 1,
0.6696389, -0.6484395, 0.8009974, 1, 0, 0, 1, 1,
0.6743683, -0.8228946, 0.8347767, 1, 0, 0, 1, 1,
0.6809821, -0.7730562, 3.057301, 1, 0, 0, 1, 1,
0.6833241, -0.5377431, 1.384211, 0, 0, 0, 1, 1,
0.6836108, 0.5509578, 1.011584, 0, 0, 0, 1, 1,
0.689218, 0.4253603, 1.813332, 0, 0, 0, 1, 1,
0.6904289, 0.449324, 1.961827, 0, 0, 0, 1, 1,
0.6921877, 1.220728, 0.3928137, 0, 0, 0, 1, 1,
0.6940661, 0.902652, -0.1680869, 0, 0, 0, 1, 1,
0.6961913, 0.5191896, 0.7230601, 0, 0, 0, 1, 1,
0.6965687, -0.1244483, 1.53126, 1, 1, 1, 1, 1,
0.7030384, -0.05924559, 1.334271, 1, 1, 1, 1, 1,
0.7035077, -0.6939937, 2.254735, 1, 1, 1, 1, 1,
0.7070504, 0.09150047, 2.999044, 1, 1, 1, 1, 1,
0.707178, 0.03424627, 0.6601927, 1, 1, 1, 1, 1,
0.7107744, -0.1898738, 2.390724, 1, 1, 1, 1, 1,
0.7114224, 0.4401787, -0.2159345, 1, 1, 1, 1, 1,
0.7189697, -0.4458561, 3.046939, 1, 1, 1, 1, 1,
0.7197374, -1.160655, 2.591069, 1, 1, 1, 1, 1,
0.7268006, 1.702951, -0.7675118, 1, 1, 1, 1, 1,
0.728561, 2.181138, 1.362323, 1, 1, 1, 1, 1,
0.7291732, -0.5821095, 2.42878, 1, 1, 1, 1, 1,
0.7305476, -0.2362869, 0.4000854, 1, 1, 1, 1, 1,
0.7315959, -1.052017, 1.965765, 1, 1, 1, 1, 1,
0.737097, -0.5975838, 2.868742, 1, 1, 1, 1, 1,
0.7407848, 0.9609307, 0.3769686, 0, 0, 1, 1, 1,
0.7457061, 0.3005542, 0.6698513, 1, 0, 0, 1, 1,
0.7480718, 0.07999427, 2.652514, 1, 0, 0, 1, 1,
0.7536685, -0.3259982, 1.397006, 1, 0, 0, 1, 1,
0.7621869, 1.496236, -0.2410673, 1, 0, 0, 1, 1,
0.7635048, -1.751223, 2.351611, 1, 0, 0, 1, 1,
0.7645264, -0.7252308, 2.001102, 0, 0, 0, 1, 1,
0.7670814, 1.409763, 0.2109915, 0, 0, 0, 1, 1,
0.7700382, 0.05002793, 1.573944, 0, 0, 0, 1, 1,
0.7715472, -0.08961836, 2.355963, 0, 0, 0, 1, 1,
0.7746127, -1.807094, 2.097069, 0, 0, 0, 1, 1,
0.7795186, 0.5424686, 0.6957462, 0, 0, 0, 1, 1,
0.7799276, -0.5956569, 2.392127, 0, 0, 0, 1, 1,
0.7801172, -1.317401, 2.046535, 1, 1, 1, 1, 1,
0.7857496, -0.8072803, 2.838926, 1, 1, 1, 1, 1,
0.7860666, 0.09137245, 0.3352593, 1, 1, 1, 1, 1,
0.791483, 1.189553, -0.131129, 1, 1, 1, 1, 1,
0.7946901, 0.1943056, 1.872679, 1, 1, 1, 1, 1,
0.7991841, 0.3735898, 2.692124, 1, 1, 1, 1, 1,
0.8001877, -0.04665472, 0.8448368, 1, 1, 1, 1, 1,
0.8005491, -0.1794387, 0.18201, 1, 1, 1, 1, 1,
0.811882, 0.7975491, 0.4901024, 1, 1, 1, 1, 1,
0.8210568, -0.01749033, 2.958649, 1, 1, 1, 1, 1,
0.8249526, 0.140677, 3.019996, 1, 1, 1, 1, 1,
0.8252051, 1.002227, 2.561197, 1, 1, 1, 1, 1,
0.825242, 0.2867592, 0.3751968, 1, 1, 1, 1, 1,
0.8275237, 2.072933, 0.2501116, 1, 1, 1, 1, 1,
0.8290234, 0.176748, 2.772731, 1, 1, 1, 1, 1,
0.8312989, 0.5721186, 1.072556, 0, 0, 1, 1, 1,
0.8313789, 0.4715575, 0.7568958, 1, 0, 0, 1, 1,
0.8317726, 0.9875459, 1.837106, 1, 0, 0, 1, 1,
0.8331585, -1.924595, 1.279805, 1, 0, 0, 1, 1,
0.8411712, 0.5002154, -0.8451636, 1, 0, 0, 1, 1,
0.8448142, -0.3227305, 4.583922, 1, 0, 0, 1, 1,
0.8486881, 0.7590588, 1.745353, 0, 0, 0, 1, 1,
0.8505413, -0.5612835, 1.683503, 0, 0, 0, 1, 1,
0.8523332, -1.372228, 4.131372, 0, 0, 0, 1, 1,
0.8612272, -0.02919745, 1.067938, 0, 0, 0, 1, 1,
0.8643196, -0.1026832, 0.7201774, 0, 0, 0, 1, 1,
0.8645954, -0.5329556, 0.3112659, 0, 0, 0, 1, 1,
0.8769441, 1.658727, 0.8447531, 0, 0, 0, 1, 1,
0.8846335, 0.810477, 0.8080491, 1, 1, 1, 1, 1,
0.8864837, 0.8421494, 0.4480132, 1, 1, 1, 1, 1,
0.8904427, -0.9973564, 3.540185, 1, 1, 1, 1, 1,
0.8990704, -1.490926, 3.985044, 1, 1, 1, 1, 1,
0.9079871, 0.3871773, 1.78048, 1, 1, 1, 1, 1,
0.9092079, -1.340753, 2.986469, 1, 1, 1, 1, 1,
0.9224876, 1.032555, -1.096391, 1, 1, 1, 1, 1,
0.923242, -0.02325816, 0.7860531, 1, 1, 1, 1, 1,
0.9316045, -0.5806512, 0.0321998, 1, 1, 1, 1, 1,
0.9322781, -0.8526413, 2.922707, 1, 1, 1, 1, 1,
0.9339593, 1.082967, 1.708811, 1, 1, 1, 1, 1,
0.93422, 1.724378, 0.5004311, 1, 1, 1, 1, 1,
0.9377554, -0.6632844, 3.585376, 1, 1, 1, 1, 1,
0.9442868, -0.3165271, 2.568214, 1, 1, 1, 1, 1,
0.9519994, 2.31466, 0.4156052, 1, 1, 1, 1, 1,
0.955787, 0.6137918, 0.6759678, 0, 0, 1, 1, 1,
0.9586845, 0.9553498, 2.532281, 1, 0, 0, 1, 1,
0.9642246, -0.2579019, 0.3505601, 1, 0, 0, 1, 1,
0.9682176, -0.04327671, 2.131876, 1, 0, 0, 1, 1,
0.9687097, -1.504378, 1.849614, 1, 0, 0, 1, 1,
0.976316, 0.3364633, 2.463114, 1, 0, 0, 1, 1,
0.9779398, -0.4811731, 3.616999, 0, 0, 0, 1, 1,
0.9792248, 0.4366496, 0.5341038, 0, 0, 0, 1, 1,
0.9806604, 0.7748781, 0.08424943, 0, 0, 0, 1, 1,
0.9815449, -0.415159, 4.423924, 0, 0, 0, 1, 1,
0.990258, 0.0616344, 1.513873, 0, 0, 0, 1, 1,
0.9967243, -1.196638, 2.953388, 0, 0, 0, 1, 1,
1.001313, 0.4213499, -0.04757453, 0, 0, 0, 1, 1,
1.00291, 0.6907881, 1.132048, 1, 1, 1, 1, 1,
1.003123, -2.061104, 1.603799, 1, 1, 1, 1, 1,
1.004515, -1.133354, 2.611904, 1, 1, 1, 1, 1,
1.009539, -0.05002839, 0.6346725, 1, 1, 1, 1, 1,
1.015301, 1.423908, -0.5080541, 1, 1, 1, 1, 1,
1.015685, -0.5612423, 2.968511, 1, 1, 1, 1, 1,
1.016039, 0.6271996, 0.01655384, 1, 1, 1, 1, 1,
1.024468, -0.09523987, 0.8564115, 1, 1, 1, 1, 1,
1.024551, 0.3904882, 0.618623, 1, 1, 1, 1, 1,
1.024562, 0.4889558, 2.837526, 1, 1, 1, 1, 1,
1.027704, 1.383605, -1.54216, 1, 1, 1, 1, 1,
1.031401, -1.564062, 2.907527, 1, 1, 1, 1, 1,
1.036918, -0.006519045, 3.606393, 1, 1, 1, 1, 1,
1.036953, -0.2971253, 1.622308, 1, 1, 1, 1, 1,
1.045173, 1.670354, 1.654745, 1, 1, 1, 1, 1,
1.050873, 0.03483253, 1.698881, 0, 0, 1, 1, 1,
1.052804, 1.300845, 0.3509364, 1, 0, 0, 1, 1,
1.056745, -1.418037, 1.819921, 1, 0, 0, 1, 1,
1.060715, -0.06195879, 0.6557404, 1, 0, 0, 1, 1,
1.067628, -0.0564021, 1.293855, 1, 0, 0, 1, 1,
1.070216, 0.3994004, 2.077737, 1, 0, 0, 1, 1,
1.08499, -2.00602, 2.39059, 0, 0, 0, 1, 1,
1.085539, 1.163425, 1.841085, 0, 0, 0, 1, 1,
1.087983, -0.8995656, 2.254683, 0, 0, 0, 1, 1,
1.09659, -1.235206, 4.111587, 0, 0, 0, 1, 1,
1.097242, 1.186848, 1.151331, 0, 0, 0, 1, 1,
1.098607, 1.121411, -0.718708, 0, 0, 0, 1, 1,
1.101274, 0.3162427, -0.3975717, 0, 0, 0, 1, 1,
1.110631, 0.8601832, -0.8596898, 1, 1, 1, 1, 1,
1.111414, -0.7017031, 1.477907, 1, 1, 1, 1, 1,
1.112058, -0.1992389, 1.085493, 1, 1, 1, 1, 1,
1.112429, 1.031573, 0.8311526, 1, 1, 1, 1, 1,
1.114444, -0.5185899, 1.189802, 1, 1, 1, 1, 1,
1.117728, -1.955218, 1.470211, 1, 1, 1, 1, 1,
1.122014, 0.6995848, 1.210054, 1, 1, 1, 1, 1,
1.128528, 0.1147794, -0.2573959, 1, 1, 1, 1, 1,
1.134257, -1.893238, 3.084687, 1, 1, 1, 1, 1,
1.137202, 0.09004163, 2.769886, 1, 1, 1, 1, 1,
1.137893, 0.1665184, 0.5540375, 1, 1, 1, 1, 1,
1.139911, 0.3469741, 0.2255394, 1, 1, 1, 1, 1,
1.14346, 1.387173, 0.2729194, 1, 1, 1, 1, 1,
1.14347, -0.3705862, 1.480319, 1, 1, 1, 1, 1,
1.148561, -0.9512679, 2.661105, 1, 1, 1, 1, 1,
1.152051, -0.2958671, 1.442737, 0, 0, 1, 1, 1,
1.159801, -0.4673033, 1.240403, 1, 0, 0, 1, 1,
1.163261, 1.08393, -0.157578, 1, 0, 0, 1, 1,
1.166875, 0.7094461, 1.380997, 1, 0, 0, 1, 1,
1.186473, 0.2560742, 0.763613, 1, 0, 0, 1, 1,
1.187014, 0.6120906, 0.1762485, 1, 0, 0, 1, 1,
1.19048, -0.5391082, 3.382955, 0, 0, 0, 1, 1,
1.194631, 0.2503672, 0.6871555, 0, 0, 0, 1, 1,
1.195844, -0.8178356, 2.919116, 0, 0, 0, 1, 1,
1.201819, -0.7126659, 0.1394384, 0, 0, 0, 1, 1,
1.213709, 1.372892, 2.212838, 0, 0, 0, 1, 1,
1.216743, -0.07923197, 2.865071, 0, 0, 0, 1, 1,
1.222574, -0.6156451, 0.371552, 0, 0, 0, 1, 1,
1.222946, -0.980553, 1.976801, 1, 1, 1, 1, 1,
1.22899, 0.9754461, 1.506147, 1, 1, 1, 1, 1,
1.251362, 0.9388414, 1.927476, 1, 1, 1, 1, 1,
1.258485, -0.2934284, 3.293087, 1, 1, 1, 1, 1,
1.261703, 1.271087, 0.9684558, 1, 1, 1, 1, 1,
1.26188, -0.5253966, 2.18348, 1, 1, 1, 1, 1,
1.265423, 1.412926, -0.6532989, 1, 1, 1, 1, 1,
1.268567, -1.657086, 0.8799965, 1, 1, 1, 1, 1,
1.27257, 2.911068, 0.8820397, 1, 1, 1, 1, 1,
1.27381, 0.7416241, 1.540902, 1, 1, 1, 1, 1,
1.285623, -1.939354, 3.448314, 1, 1, 1, 1, 1,
1.29074, -0.5795048, 2.552759, 1, 1, 1, 1, 1,
1.295488, 0.5633239, 0.4973223, 1, 1, 1, 1, 1,
1.305227, 0.107995, 3.460516, 1, 1, 1, 1, 1,
1.319658, 1.416663, 1.453091, 1, 1, 1, 1, 1,
1.334295, -0.2878464, 1.457135, 0, 0, 1, 1, 1,
1.334666, -0.7156333, 2.879571, 1, 0, 0, 1, 1,
1.363598, -0.07357066, 1.953022, 1, 0, 0, 1, 1,
1.367037, -0.7041029, -0.1285052, 1, 0, 0, 1, 1,
1.367238, 0.3903411, 1.809917, 1, 0, 0, 1, 1,
1.371207, 0.3516257, -0.06802142, 1, 0, 0, 1, 1,
1.376172, 0.3125708, 1.435103, 0, 0, 0, 1, 1,
1.400514, -0.5924205, 2.119279, 0, 0, 0, 1, 1,
1.403263, 1.119806, -0.2122489, 0, 0, 0, 1, 1,
1.410171, 0.5170729, 1.153119, 0, 0, 0, 1, 1,
1.410407, -1.205511, 3.146495, 0, 0, 0, 1, 1,
1.423491, 0.544015, 3.029796, 0, 0, 0, 1, 1,
1.428817, 1.317719, -0.4321386, 0, 0, 0, 1, 1,
1.437499, 0.6208828, 0.8407188, 1, 1, 1, 1, 1,
1.440137, -0.8218083, 2.213948, 1, 1, 1, 1, 1,
1.444553, -0.6115525, 2.354754, 1, 1, 1, 1, 1,
1.446643, -1.207183, 3.005152, 1, 1, 1, 1, 1,
1.449693, 0.4305185, 0.686461, 1, 1, 1, 1, 1,
1.454796, 1.079776, 1.139613, 1, 1, 1, 1, 1,
1.457354, -0.7334858, 3.54299, 1, 1, 1, 1, 1,
1.459439, -0.04571285, 2.235294, 1, 1, 1, 1, 1,
1.47622, -1.640399, 1.337545, 1, 1, 1, 1, 1,
1.483411, -0.5292722, 1.482777, 1, 1, 1, 1, 1,
1.485056, -1.00329, 1.877519, 1, 1, 1, 1, 1,
1.491423, 0.7225306, -0.4205121, 1, 1, 1, 1, 1,
1.496363, -1.15102, 2.405355, 1, 1, 1, 1, 1,
1.499789, -1.114053, 0.7540401, 1, 1, 1, 1, 1,
1.506466, 0.1217312, -0.7306304, 1, 1, 1, 1, 1,
1.515479, -1.093833, 1.76627, 0, 0, 1, 1, 1,
1.520966, 0.1089954, 1.536586, 1, 0, 0, 1, 1,
1.521932, -1.038455, 1.493741, 1, 0, 0, 1, 1,
1.525159, -0.05854198, 1.900333, 1, 0, 0, 1, 1,
1.537338, -0.3004182, 3.188585, 1, 0, 0, 1, 1,
1.537567, 1.36396, -0.3513593, 1, 0, 0, 1, 1,
1.551297, 2.637232, -0.2710421, 0, 0, 0, 1, 1,
1.570253, 1.822894, 1.968981, 0, 0, 0, 1, 1,
1.575639, -0.945325, 3.643543, 0, 0, 0, 1, 1,
1.576643, 0.1047678, 1.47077, 0, 0, 0, 1, 1,
1.578559, -1.182953, 2.044022, 0, 0, 0, 1, 1,
1.582257, -1.397963, 2.728292, 0, 0, 0, 1, 1,
1.591797, 0.7174948, 1.401965, 0, 0, 0, 1, 1,
1.598567, 0.7216863, 1.100043, 1, 1, 1, 1, 1,
1.600668, 1.20332, 1.788881, 1, 1, 1, 1, 1,
1.612081, -0.6767939, 0.8264247, 1, 1, 1, 1, 1,
1.617897, 0.4309037, 1.109667, 1, 1, 1, 1, 1,
1.632902, 0.555027, 0.9677277, 1, 1, 1, 1, 1,
1.634389, -0.6020347, 2.420638, 1, 1, 1, 1, 1,
1.644484, 1.310188, -0.2717277, 1, 1, 1, 1, 1,
1.646591, -0.6244091, 1.946427, 1, 1, 1, 1, 1,
1.66901, 0.193519, 1.492929, 1, 1, 1, 1, 1,
1.671102, -0.6831384, 2.140273, 1, 1, 1, 1, 1,
1.677448, 1.713347, 1.653798, 1, 1, 1, 1, 1,
1.687186, -2.630234, 1.167536, 1, 1, 1, 1, 1,
1.705764, 0.4596614, 1.901612, 1, 1, 1, 1, 1,
1.707489, -0.5430164, 1.314304, 1, 1, 1, 1, 1,
1.73104, 1.299017, -0.1830621, 1, 1, 1, 1, 1,
1.748657, 0.6472099, 0.9653435, 0, 0, 1, 1, 1,
1.76537, -0.40674, 4.184787, 1, 0, 0, 1, 1,
1.771005, -0.928992, 0.6399059, 1, 0, 0, 1, 1,
1.771631, 0.5094287, 0.5314239, 1, 0, 0, 1, 1,
1.772037, -0.4508857, 2.787831, 1, 0, 0, 1, 1,
1.783002, 1.356789, 1.732838, 1, 0, 0, 1, 1,
1.792223, -0.3908248, 0.301049, 0, 0, 0, 1, 1,
1.803528, 1.161996, 1.590819, 0, 0, 0, 1, 1,
1.816185, -0.4651775, 1.892285, 0, 0, 0, 1, 1,
1.823665, -0.2427545, 1.474681, 0, 0, 0, 1, 1,
1.826444, 0.9842553, -0.085704, 0, 0, 0, 1, 1,
1.833407, 0.03594534, 1.517941, 0, 0, 0, 1, 1,
1.837741, 0.3336037, 0.497476, 0, 0, 0, 1, 1,
1.848989, -1.208564, 1.506985, 1, 1, 1, 1, 1,
1.85136, 0.2881818, -0.6071906, 1, 1, 1, 1, 1,
1.863529, 0.6202731, 1.045632, 1, 1, 1, 1, 1,
1.952391, 1.573363, 2.272135, 1, 1, 1, 1, 1,
1.956095, 0.3497797, 0.8732263, 1, 1, 1, 1, 1,
1.963612, 0.5864649, 3.12492, 1, 1, 1, 1, 1,
1.969169, -0.2141818, 1.816192, 1, 1, 1, 1, 1,
1.981462, 0.7658884, 3.357422, 1, 1, 1, 1, 1,
1.989163, 0.9915521, 3.380027, 1, 1, 1, 1, 1,
1.991408, -0.2424862, 0.07995342, 1, 1, 1, 1, 1,
1.994824, 1.428251, 0.2253741, 1, 1, 1, 1, 1,
2.010853, -0.1727864, 1.723735, 1, 1, 1, 1, 1,
2.015851, 1.45524, 1.280663, 1, 1, 1, 1, 1,
2.022893, -0.8115275, 3.339363, 1, 1, 1, 1, 1,
2.122983, -0.0265669, 1.186371, 1, 1, 1, 1, 1,
2.131588, -0.1050764, 1.525202, 0, 0, 1, 1, 1,
2.174695, -1.120261, 0.3347178, 1, 0, 0, 1, 1,
2.180034, -0.7472726, 2.645569, 1, 0, 0, 1, 1,
2.233953, 0.1054168, 1.637225, 1, 0, 0, 1, 1,
2.24675, -1.341797, 0.7927949, 1, 0, 0, 1, 1,
2.271842, -0.4943403, 0.4522195, 1, 0, 0, 1, 1,
2.288124, 0.4898801, 0.5153226, 0, 0, 0, 1, 1,
2.29231, -0.732736, 4.072865, 0, 0, 0, 1, 1,
2.310941, 1.242589, 1.335806, 0, 0, 0, 1, 1,
2.373563, 1.083514, 0.7379818, 0, 0, 0, 1, 1,
2.381482, -0.1938566, 0.6878561, 0, 0, 0, 1, 1,
2.394589, 0.1989438, 1.645045, 0, 0, 0, 1, 1,
2.460743, 1.118877, 1.678706, 0, 0, 0, 1, 1,
2.543815, 2.597764, 0.2245572, 1, 1, 1, 1, 1,
2.753841, 0.1706122, 0.9903209, 1, 1, 1, 1, 1,
2.756279, -0.1095491, 2.313278, 1, 1, 1, 1, 1,
2.771501, -0.9074456, 2.406636, 1, 1, 1, 1, 1,
2.994155, 0.2840436, 2.121628, 1, 1, 1, 1, 1,
3.05076, -0.199021, 2.221043, 1, 1, 1, 1, 1,
3.185317, -0.6779649, 1.605579, 1, 1, 1, 1, 1
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
var radius = 9.704046;
var distance = 34.08505;
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
mvMatrix.translate( 0.4494889, -0.06388831, -0.07891726 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.08505);
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