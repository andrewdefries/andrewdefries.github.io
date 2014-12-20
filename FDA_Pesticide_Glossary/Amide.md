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
-3.023404, -0.2237498, -1.940778, 1, 0, 0, 1,
-2.689278, 0.4339613, -0.6273272, 1, 0.007843138, 0, 1,
-2.676458, -0.3390908, -1.58223, 1, 0.01176471, 0, 1,
-2.615749, -0.3003719, -0.3737369, 1, 0.01960784, 0, 1,
-2.549055, -1.155273, -1.98067, 1, 0.02352941, 0, 1,
-2.533108, -0.6838261, -1.773323, 1, 0.03137255, 0, 1,
-2.505312, 0.3230681, -0.3967123, 1, 0.03529412, 0, 1,
-2.505068, -1.96221, -1.940863, 1, 0.04313726, 0, 1,
-2.379279, -2.194294, -2.523851, 1, 0.04705882, 0, 1,
-2.356025, 0.2917919, -1.393384, 1, 0.05490196, 0, 1,
-2.322862, -0.074967, -2.475652, 1, 0.05882353, 0, 1,
-2.321066, -0.4700058, -1.842494, 1, 0.06666667, 0, 1,
-2.277677, 1.355129, -0.8081482, 1, 0.07058824, 0, 1,
-2.277495, 1.282671, -1.358103, 1, 0.07843138, 0, 1,
-2.271112, 0.7757673, -1.565658, 1, 0.08235294, 0, 1,
-2.172146, -1.176113, -0.2081177, 1, 0.09019608, 0, 1,
-2.153832, -1.222801, -2.430151, 1, 0.09411765, 0, 1,
-2.145406, 0.7023141, -0.8477015, 1, 0.1019608, 0, 1,
-2.123641, 0.7204722, -0.667591, 1, 0.1098039, 0, 1,
-2.11206, -0.01671812, -1.00607, 1, 0.1137255, 0, 1,
-2.083961, -1.339903, -4.40055, 1, 0.1215686, 0, 1,
-2.056452, 1.063661, -1.228673, 1, 0.1254902, 0, 1,
-2.055357, -0.2465148, -1.728603, 1, 0.1333333, 0, 1,
-2.051429, -1.796443, -2.913694, 1, 0.1372549, 0, 1,
-2.014491, -0.4397927, -2.997374, 1, 0.145098, 0, 1,
-1.955371, -0.6958806, -0.9719462, 1, 0.1490196, 0, 1,
-1.936903, 1.338228, -0.1579014, 1, 0.1568628, 0, 1,
-1.91732, -1.467601, -4.030254, 1, 0.1607843, 0, 1,
-1.851961, -0.1965232, -3.331971, 1, 0.1686275, 0, 1,
-1.841864, -1.901551, -1.548928, 1, 0.172549, 0, 1,
-1.836054, 1.833549, -1.429976, 1, 0.1803922, 0, 1,
-1.803178, 1.519936, 0.2472367, 1, 0.1843137, 0, 1,
-1.798542, 2.363708, -1.583081, 1, 0.1921569, 0, 1,
-1.785326, -0.1018636, -2.749977, 1, 0.1960784, 0, 1,
-1.78433, 0.004565139, -1.623587, 1, 0.2039216, 0, 1,
-1.767886, 0.4910765, -2.142171, 1, 0.2117647, 0, 1,
-1.751482, -0.5407885, -0.6943271, 1, 0.2156863, 0, 1,
-1.747156, -0.4314501, -0.4287319, 1, 0.2235294, 0, 1,
-1.745426, -0.1474196, -1.48057, 1, 0.227451, 0, 1,
-1.74538, 1.429133, -1.054744, 1, 0.2352941, 0, 1,
-1.730165, -0.7259357, -4.779047, 1, 0.2392157, 0, 1,
-1.721424, -3.402538, -2.756489, 1, 0.2470588, 0, 1,
-1.687739, -0.564747, -2.714932, 1, 0.2509804, 0, 1,
-1.681391, -0.04877717, -2.398383, 1, 0.2588235, 0, 1,
-1.677786, 0.2653927, -0.07210793, 1, 0.2627451, 0, 1,
-1.664995, -1.023391, -2.671547, 1, 0.2705882, 0, 1,
-1.656989, -0.4275128, -0.4036845, 1, 0.2745098, 0, 1,
-1.651807, -0.7942691, -3.368683, 1, 0.282353, 0, 1,
-1.642991, 0.1628994, 0.3901663, 1, 0.2862745, 0, 1,
-1.629297, -0.07030089, -0.9804917, 1, 0.2941177, 0, 1,
-1.628666, 0.4973845, -0.971121, 1, 0.3019608, 0, 1,
-1.612143, -1.740527, -0.5015894, 1, 0.3058824, 0, 1,
-1.60997, -1.430686, -1.346454, 1, 0.3137255, 0, 1,
-1.591611, 0.3755923, 0.5152255, 1, 0.3176471, 0, 1,
-1.589775, -0.3014562, -1.101451, 1, 0.3254902, 0, 1,
-1.586614, 0.9491326, -2.065189, 1, 0.3294118, 0, 1,
-1.585776, 1.53526, -0.7347518, 1, 0.3372549, 0, 1,
-1.584234, 1.224072, -1.483339, 1, 0.3411765, 0, 1,
-1.570357, -0.608784, -1.485288, 1, 0.3490196, 0, 1,
-1.56963, -0.9911146, -0.6666584, 1, 0.3529412, 0, 1,
-1.548395, 0.6627818, -2.862628, 1, 0.3607843, 0, 1,
-1.54117, 0.9653328, -0.5880162, 1, 0.3647059, 0, 1,
-1.529387, -2.272198, -1.58271, 1, 0.372549, 0, 1,
-1.503113, -0.5742938, -3.354085, 1, 0.3764706, 0, 1,
-1.500897, 0.5669266, 0.1208322, 1, 0.3843137, 0, 1,
-1.489137, -0.9234336, -1.648875, 1, 0.3882353, 0, 1,
-1.483191, 0.2571198, -1.32849, 1, 0.3960784, 0, 1,
-1.481869, 2.304323, 0.001215877, 1, 0.4039216, 0, 1,
-1.469364, -0.4687431, -1.417382, 1, 0.4078431, 0, 1,
-1.469203, -0.5970612, -3.289869, 1, 0.4156863, 0, 1,
-1.468496, 0.49832, -0.6040229, 1, 0.4196078, 0, 1,
-1.458194, -1.498785, -0.5953054, 1, 0.427451, 0, 1,
-1.446852, 1.37197, -1.509833, 1, 0.4313726, 0, 1,
-1.443363, 0.9606373, -1.699136, 1, 0.4392157, 0, 1,
-1.442915, 0.4452965, -2.162099, 1, 0.4431373, 0, 1,
-1.438754, -0.0360568, -1.961903, 1, 0.4509804, 0, 1,
-1.435266, -0.939734, -4.150954, 1, 0.454902, 0, 1,
-1.43109, 1.147154, -1.294366, 1, 0.4627451, 0, 1,
-1.428834, 0.716359, -0.441154, 1, 0.4666667, 0, 1,
-1.423921, -0.02690905, -1.894897, 1, 0.4745098, 0, 1,
-1.420705, -0.6777641, -1.645328, 1, 0.4784314, 0, 1,
-1.418916, -1.572412, -3.989278, 1, 0.4862745, 0, 1,
-1.417811, -1.809001, -2.397674, 1, 0.4901961, 0, 1,
-1.406869, -0.6804585, -2.441535, 1, 0.4980392, 0, 1,
-1.401842, 0.491579, -4.144217, 1, 0.5058824, 0, 1,
-1.398665, 1.147564, -1.34753, 1, 0.509804, 0, 1,
-1.395992, 0.3590032, -1.108906, 1, 0.5176471, 0, 1,
-1.391622, -0.942712, -0.4506057, 1, 0.5215687, 0, 1,
-1.3871, 1.32102, -1.8007, 1, 0.5294118, 0, 1,
-1.380145, 0.01468056, 0.1805598, 1, 0.5333334, 0, 1,
-1.379797, 1.142543, 0.3550317, 1, 0.5411765, 0, 1,
-1.376468, -0.3780338, -4.957451, 1, 0.5450981, 0, 1,
-1.357008, 0.747851, -1.524034, 1, 0.5529412, 0, 1,
-1.352004, 0.07826939, -0.7530137, 1, 0.5568628, 0, 1,
-1.350283, 1.418886, -0.4844638, 1, 0.5647059, 0, 1,
-1.349814, 3.251331, -0.8667098, 1, 0.5686275, 0, 1,
-1.32612, -0.754617, -2.507128, 1, 0.5764706, 0, 1,
-1.306617, 0.6371062, -0.8056589, 1, 0.5803922, 0, 1,
-1.303109, -0.3460653, -2.438214, 1, 0.5882353, 0, 1,
-1.301984, -1.401442, -1.665885, 1, 0.5921569, 0, 1,
-1.300113, 0.572102, -1.19002, 1, 0.6, 0, 1,
-1.280293, -0.7230726, -2.47952, 1, 0.6078432, 0, 1,
-1.266148, 1.383559, -1.189073, 1, 0.6117647, 0, 1,
-1.243736, 0.8888522, -0.3179162, 1, 0.6196079, 0, 1,
-1.240066, 0.9462932, -1.8568, 1, 0.6235294, 0, 1,
-1.235102, -0.2195028, -2.060428, 1, 0.6313726, 0, 1,
-1.217629, -2.098585, -3.50385, 1, 0.6352941, 0, 1,
-1.215829, -0.8118792, -1.958023, 1, 0.6431373, 0, 1,
-1.211068, -0.1969185, -0.7660048, 1, 0.6470588, 0, 1,
-1.210107, 1.322019, -0.6359739, 1, 0.654902, 0, 1,
-1.205027, -0.4799592, -1.68033, 1, 0.6588235, 0, 1,
-1.203501, -1.262065, -2.728589, 1, 0.6666667, 0, 1,
-1.194548, -1.470359, -2.488162, 1, 0.6705883, 0, 1,
-1.190773, 0.8108867, 0.1217286, 1, 0.6784314, 0, 1,
-1.188528, 0.5343712, -0.8178228, 1, 0.682353, 0, 1,
-1.180625, -0.614758, -2.406331, 1, 0.6901961, 0, 1,
-1.17163, -0.9490958, -2.184529, 1, 0.6941177, 0, 1,
-1.162976, -0.4884546, -1.810104, 1, 0.7019608, 0, 1,
-1.160821, -1.041862, -2.254722, 1, 0.7098039, 0, 1,
-1.160009, -0.7125503, -1.607758, 1, 0.7137255, 0, 1,
-1.159065, -0.3239686, -2.141753, 1, 0.7215686, 0, 1,
-1.145825, -0.9644296, -2.09051, 1, 0.7254902, 0, 1,
-1.145487, 0.006534822, -3.086915, 1, 0.7333333, 0, 1,
-1.134296, 1.503, 1.343658, 1, 0.7372549, 0, 1,
-1.131451, -0.422317, -2.792694, 1, 0.7450981, 0, 1,
-1.127235, 0.7056876, 0.9588621, 1, 0.7490196, 0, 1,
-1.115601, 1.254745, -1.456841, 1, 0.7568628, 0, 1,
-1.10462, -1.307763, -2.167877, 1, 0.7607843, 0, 1,
-1.101359, -0.0576374, -1.532673, 1, 0.7686275, 0, 1,
-1.082111, 1.460826, -3.363519, 1, 0.772549, 0, 1,
-1.080888, -0.443287, -3.00564, 1, 0.7803922, 0, 1,
-1.079036, -1.526717, -2.519041, 1, 0.7843137, 0, 1,
-1.07793, 0.2635198, -1.663849, 1, 0.7921569, 0, 1,
-1.075309, 0.7941492, -0.8548416, 1, 0.7960784, 0, 1,
-1.072344, 0.8429542, -1.587438, 1, 0.8039216, 0, 1,
-1.070148, 0.7355304, -1.702881, 1, 0.8117647, 0, 1,
-1.056738, -0.5969835, -2.621539, 1, 0.8156863, 0, 1,
-1.055587, -0.01567316, 0.1561748, 1, 0.8235294, 0, 1,
-1.05258, 0.9429716, 0.118366, 1, 0.827451, 0, 1,
-1.04351, 0.3020803, -1.877785, 1, 0.8352941, 0, 1,
-1.040531, 0.9175425, -0.5304324, 1, 0.8392157, 0, 1,
-1.039449, -0.8373545, -2.804991, 1, 0.8470588, 0, 1,
-1.037435, 0.4061548, -2.729344, 1, 0.8509804, 0, 1,
-1.029991, 0.4472114, -0.8962359, 1, 0.8588235, 0, 1,
-1.028461, 0.09116827, -1.170756, 1, 0.8627451, 0, 1,
-1.027062, -0.4061343, -2.360776, 1, 0.8705882, 0, 1,
-1.026244, -0.7025694, -1.511933, 1, 0.8745098, 0, 1,
-1.025169, 0.287134, -1.818267, 1, 0.8823529, 0, 1,
-1.020126, -1.381084, -3.834297, 1, 0.8862745, 0, 1,
-1.01439, 1.685247, -0.1828543, 1, 0.8941177, 0, 1,
-0.998381, 0.8955718, -2.966986, 1, 0.8980392, 0, 1,
-0.9957224, -0.627773, -0.08301419, 1, 0.9058824, 0, 1,
-0.9923952, -0.6197127, -1.015127, 1, 0.9137255, 0, 1,
-0.9888397, 1.060423, -2.270587, 1, 0.9176471, 0, 1,
-0.9878246, 1.148741, -3.225922, 1, 0.9254902, 0, 1,
-0.9837647, -0.7797712, -1.172568, 1, 0.9294118, 0, 1,
-0.982983, -0.2085332, -3.908715, 1, 0.9372549, 0, 1,
-0.9803736, -0.08567254, -2.334696, 1, 0.9411765, 0, 1,
-0.9797637, 0.9484911, -2.410279, 1, 0.9490196, 0, 1,
-0.9688324, -1.497395, -3.620958, 1, 0.9529412, 0, 1,
-0.9675799, -0.3396914, -2.964186, 1, 0.9607843, 0, 1,
-0.9658449, 0.7678148, -1.933452, 1, 0.9647059, 0, 1,
-0.9619504, -0.3576805, -0.3706046, 1, 0.972549, 0, 1,
-0.9564403, 1.183242, -0.2285318, 1, 0.9764706, 0, 1,
-0.9563757, -1.936137, -3.605848, 1, 0.9843137, 0, 1,
-0.95535, -0.06208574, -1.0766, 1, 0.9882353, 0, 1,
-0.9504466, -0.2535398, -2.320236, 1, 0.9960784, 0, 1,
-0.9499608, 1.04868, -0.4069861, 0.9960784, 1, 0, 1,
-0.9497222, 0.266083, -1.883819, 0.9921569, 1, 0, 1,
-0.9444343, 0.35966, -2.108922, 0.9843137, 1, 0, 1,
-0.9384189, -0.4364291, -0.1091506, 0.9803922, 1, 0, 1,
-0.9375144, -0.4132985, -3.154395, 0.972549, 1, 0, 1,
-0.9367534, -0.5199619, -0.1771463, 0.9686275, 1, 0, 1,
-0.9354854, 0.7743647, -2.212296, 0.9607843, 1, 0, 1,
-0.9258885, -0.406299, -1.253309, 0.9568627, 1, 0, 1,
-0.9254119, -0.9103682, -3.329426, 0.9490196, 1, 0, 1,
-0.9200586, -0.0719342, -3.315911, 0.945098, 1, 0, 1,
-0.9187967, -0.7767575, -0.746096, 0.9372549, 1, 0, 1,
-0.9169075, 0.6171322, -0.5155998, 0.9333333, 1, 0, 1,
-0.9168542, 0.5428519, -1.16975, 0.9254902, 1, 0, 1,
-0.9102995, 0.05493887, -1.028121, 0.9215686, 1, 0, 1,
-0.9032602, -0.0292372, -3.084239, 0.9137255, 1, 0, 1,
-0.900362, -1.909825, -1.167248, 0.9098039, 1, 0, 1,
-0.8959714, -1.134409, -3.288452, 0.9019608, 1, 0, 1,
-0.8869435, 0.1208911, -2.438062, 0.8941177, 1, 0, 1,
-0.8815104, -1.157105, -1.31697, 0.8901961, 1, 0, 1,
-0.8765808, -1.29654, -2.964176, 0.8823529, 1, 0, 1,
-0.8755862, -1.198061, -1.981733, 0.8784314, 1, 0, 1,
-0.8717375, -0.7183795, -1.328689, 0.8705882, 1, 0, 1,
-0.8707432, 1.824586, 0.3899699, 0.8666667, 1, 0, 1,
-0.8494982, -1.196722, -2.361341, 0.8588235, 1, 0, 1,
-0.8468231, 0.2901422, -0.3356793, 0.854902, 1, 0, 1,
-0.8466663, 0.7726789, 0.2391445, 0.8470588, 1, 0, 1,
-0.8394989, 1.016974, 1.807586, 0.8431373, 1, 0, 1,
-0.8389827, -0.567211, -2.583072, 0.8352941, 1, 0, 1,
-0.8379555, 0.1119376, -2.509222, 0.8313726, 1, 0, 1,
-0.8342612, 0.1243045, -2.356159, 0.8235294, 1, 0, 1,
-0.8255577, 2.35687, -0.2468991, 0.8196079, 1, 0, 1,
-0.8243266, -1.153138, -1.557886, 0.8117647, 1, 0, 1,
-0.8119429, 0.393913, -0.99321, 0.8078431, 1, 0, 1,
-0.8036883, -1.765547, -2.519271, 0.8, 1, 0, 1,
-0.8004378, -1.020919, -2.275547, 0.7921569, 1, 0, 1,
-0.792382, -0.4801784, -2.408456, 0.7882353, 1, 0, 1,
-0.7920818, 0.5080505, -0.6318201, 0.7803922, 1, 0, 1,
-0.7899979, 0.270154, -0.8480713, 0.7764706, 1, 0, 1,
-0.7803769, 0.8606932, -1.770663, 0.7686275, 1, 0, 1,
-0.7777298, 1.573915, 0.6002379, 0.7647059, 1, 0, 1,
-0.7764178, 1.595647, -1.038252, 0.7568628, 1, 0, 1,
-0.774307, 0.6601143, -0.3826778, 0.7529412, 1, 0, 1,
-0.7731321, 0.7569829, -0.7736373, 0.7450981, 1, 0, 1,
-0.7646078, 1.210185, 0.8684139, 0.7411765, 1, 0, 1,
-0.7624978, -0.03674047, -1.005152, 0.7333333, 1, 0, 1,
-0.7560504, -1.038538, -0.672604, 0.7294118, 1, 0, 1,
-0.7559311, 0.1534119, -1.109954, 0.7215686, 1, 0, 1,
-0.7530399, 0.8097007, -2.07431, 0.7176471, 1, 0, 1,
-0.7511397, 2.108757, -0.3979767, 0.7098039, 1, 0, 1,
-0.7406717, -0.7349125, -1.43255, 0.7058824, 1, 0, 1,
-0.7356791, -0.4994436, -2.293229, 0.6980392, 1, 0, 1,
-0.7345775, -1.245405, -2.253723, 0.6901961, 1, 0, 1,
-0.7340891, 0.2720226, -0.7305848, 0.6862745, 1, 0, 1,
-0.7324869, -0.7603579, -3.113347, 0.6784314, 1, 0, 1,
-0.7307118, -1.212931, -1.086689, 0.6745098, 1, 0, 1,
-0.7284569, 0.402681, 0.293154, 0.6666667, 1, 0, 1,
-0.728393, -1.522698, -2.368947, 0.6627451, 1, 0, 1,
-0.7212121, -0.2206477, -3.608255, 0.654902, 1, 0, 1,
-0.7205233, -1.745377, -2.65968, 0.6509804, 1, 0, 1,
-0.7190474, -0.5151043, -1.548872, 0.6431373, 1, 0, 1,
-0.7170093, -0.4016539, -1.637838, 0.6392157, 1, 0, 1,
-0.7166526, -0.3454086, 0.1207594, 0.6313726, 1, 0, 1,
-0.715305, 1.986339, 0.6576141, 0.627451, 1, 0, 1,
-0.7138746, 0.6921052, 0.6256196, 0.6196079, 1, 0, 1,
-0.7131426, -2.301917, -2.944576, 0.6156863, 1, 0, 1,
-0.7127745, -0.394895, -2.138499, 0.6078432, 1, 0, 1,
-0.7121851, 1.383869, -1.45142, 0.6039216, 1, 0, 1,
-0.710314, -1.075679, -4.321247, 0.5960785, 1, 0, 1,
-0.7098977, 0.2484329, -1.383456, 0.5882353, 1, 0, 1,
-0.7056314, -0.05538807, -1.891101, 0.5843138, 1, 0, 1,
-0.7052009, 0.3028625, 0.3677143, 0.5764706, 1, 0, 1,
-0.7034521, 0.3432882, -1.578436, 0.572549, 1, 0, 1,
-0.7031591, 0.09308638, -2.328598, 0.5647059, 1, 0, 1,
-0.7031249, 1.355222, -0.5547929, 0.5607843, 1, 0, 1,
-0.7019038, 1.039832, -0.2812529, 0.5529412, 1, 0, 1,
-0.701524, 0.3188286, 0.293744, 0.5490196, 1, 0, 1,
-0.7001752, -0.8696651, -1.893638, 0.5411765, 1, 0, 1,
-0.6929431, 0.3031495, -0.2953624, 0.5372549, 1, 0, 1,
-0.691672, 0.2094361, -2.450495, 0.5294118, 1, 0, 1,
-0.6882213, -0.8915259, -2.108396, 0.5254902, 1, 0, 1,
-0.6848813, 1.229348, 0.265351, 0.5176471, 1, 0, 1,
-0.6790537, -0.8119234, -2.925689, 0.5137255, 1, 0, 1,
-0.6766148, -1.559647, -2.528755, 0.5058824, 1, 0, 1,
-0.6753443, -0.06848735, -2.309158, 0.5019608, 1, 0, 1,
-0.6736701, -0.4623236, -3.01283, 0.4941176, 1, 0, 1,
-0.6706539, 0.3798878, -1.79196, 0.4862745, 1, 0, 1,
-0.6699039, -0.575399, -1.474751, 0.4823529, 1, 0, 1,
-0.6693576, -0.2022474, -2.786631, 0.4745098, 1, 0, 1,
-0.6687142, -0.1829972, -3.023218, 0.4705882, 1, 0, 1,
-0.6657836, 0.2346703, -1.735042, 0.4627451, 1, 0, 1,
-0.6624008, -0.525494, -3.261217, 0.4588235, 1, 0, 1,
-0.6623648, -0.6274515, -1.693711, 0.4509804, 1, 0, 1,
-0.6590346, 0.7328449, -0.3447173, 0.4470588, 1, 0, 1,
-0.6479955, -1.651348, -3.653837, 0.4392157, 1, 0, 1,
-0.6329597, -2.152685, -4.040133, 0.4352941, 1, 0, 1,
-0.6304084, -0.7960972, -3.751481, 0.427451, 1, 0, 1,
-0.6284682, 0.5256083, -0.2768749, 0.4235294, 1, 0, 1,
-0.6270102, 1.861949, 0.3622889, 0.4156863, 1, 0, 1,
-0.6265272, 0.5077396, -0.7860494, 0.4117647, 1, 0, 1,
-0.6217475, 3.321389, 2.101593, 0.4039216, 1, 0, 1,
-0.6019479, -1.781239, -1.696466, 0.3960784, 1, 0, 1,
-0.6013921, 1.433774, 1.229215, 0.3921569, 1, 0, 1,
-0.6009873, -1.231302, -3.451178, 0.3843137, 1, 0, 1,
-0.594932, -0.5048201, -1.882628, 0.3803922, 1, 0, 1,
-0.5926157, 0.2673384, 0.5513819, 0.372549, 1, 0, 1,
-0.5919973, -1.650177, -2.92161, 0.3686275, 1, 0, 1,
-0.5905129, -2.42562, -1.998965, 0.3607843, 1, 0, 1,
-0.5874523, -0.1511229, -2.929071, 0.3568628, 1, 0, 1,
-0.5862033, 0.5135354, 0.3944906, 0.3490196, 1, 0, 1,
-0.5851323, 1.294638, -0.6668122, 0.345098, 1, 0, 1,
-0.5834076, -0.03364495, -1.111686, 0.3372549, 1, 0, 1,
-0.5814299, 1.462551, 0.1732183, 0.3333333, 1, 0, 1,
-0.5770106, -0.9181112, -3.296314, 0.3254902, 1, 0, 1,
-0.5766451, -1.408692, -3.825145, 0.3215686, 1, 0, 1,
-0.575541, 1.447349, 0.4450289, 0.3137255, 1, 0, 1,
-0.5745956, 0.9973626, -0.3101657, 0.3098039, 1, 0, 1,
-0.5672799, -0.3966686, -4.239553, 0.3019608, 1, 0, 1,
-0.5629832, -0.3726129, -1.273123, 0.2941177, 1, 0, 1,
-0.5618951, -0.939855, -1.45871, 0.2901961, 1, 0, 1,
-0.5608602, 0.08035214, -1.469156, 0.282353, 1, 0, 1,
-0.5502315, -1.139833, -3.473985, 0.2784314, 1, 0, 1,
-0.5499914, 0.2700824, 0.01779363, 0.2705882, 1, 0, 1,
-0.5480928, 0.1281028, -3.053066, 0.2666667, 1, 0, 1,
-0.547661, -1.281104, -3.533784, 0.2588235, 1, 0, 1,
-0.5467894, 0.1168303, -1.385358, 0.254902, 1, 0, 1,
-0.5467713, 0.06503914, -0.7182414, 0.2470588, 1, 0, 1,
-0.5463611, -1.140513, -3.118079, 0.2431373, 1, 0, 1,
-0.5443037, 0.8090003, -0.8567917, 0.2352941, 1, 0, 1,
-0.5374047, 0.5660914, 0.3902303, 0.2313726, 1, 0, 1,
-0.5335994, 1.382363, -0.5559463, 0.2235294, 1, 0, 1,
-0.5308167, 0.3565316, -1.324076, 0.2196078, 1, 0, 1,
-0.5276463, 0.8457133, -1.788629, 0.2117647, 1, 0, 1,
-0.5261252, -0.1908074, -1.557132, 0.2078431, 1, 0, 1,
-0.5224176, 0.674818, 0.5622312, 0.2, 1, 0, 1,
-0.5219986, -0.2902862, -2.397182, 0.1921569, 1, 0, 1,
-0.5218869, 1.388673, 0.284862, 0.1882353, 1, 0, 1,
-0.5141543, -1.567309, -4.471535, 0.1803922, 1, 0, 1,
-0.5135839, 0.5004681, -1.189035, 0.1764706, 1, 0, 1,
-0.512858, -0.4741585, -3.360929, 0.1686275, 1, 0, 1,
-0.5124424, -0.744837, -1.728805, 0.1647059, 1, 0, 1,
-0.5089154, -1.521516, -3.843415, 0.1568628, 1, 0, 1,
-0.5079746, 0.3903806, 1.175274, 0.1529412, 1, 0, 1,
-0.5066715, 1.239018, -1.373484, 0.145098, 1, 0, 1,
-0.5051625, 1.203272, 0.1506766, 0.1411765, 1, 0, 1,
-0.5034079, -0.615849, -2.881496, 0.1333333, 1, 0, 1,
-0.5018001, 2.640111, -1.881256, 0.1294118, 1, 0, 1,
-0.4985513, 0.06407929, -0.03590506, 0.1215686, 1, 0, 1,
-0.4962311, 0.2719586, -0.7597405, 0.1176471, 1, 0, 1,
-0.4910664, -0.3180847, -2.058715, 0.1098039, 1, 0, 1,
-0.4864709, -1.486744, -2.035873, 0.1058824, 1, 0, 1,
-0.4843222, 0.08912995, -2.130194, 0.09803922, 1, 0, 1,
-0.4837625, 0.0247439, -2.527542, 0.09019608, 1, 0, 1,
-0.4787727, -0.7897428, -2.321252, 0.08627451, 1, 0, 1,
-0.4771567, 1.295676, -0.8225242, 0.07843138, 1, 0, 1,
-0.4724997, 0.6754751, 0.5844072, 0.07450981, 1, 0, 1,
-0.4535564, 0.9752356, -0.03589016, 0.06666667, 1, 0, 1,
-0.4503503, -1.489203, -1.432677, 0.0627451, 1, 0, 1,
-0.4498753, 0.1268845, -1.616573, 0.05490196, 1, 0, 1,
-0.4471488, -1.216851, -1.176888, 0.05098039, 1, 0, 1,
-0.4468005, 0.3837012, -0.5670878, 0.04313726, 1, 0, 1,
-0.4430732, 2.135321, 0.0926353, 0.03921569, 1, 0, 1,
-0.4425896, -0.5818979, -2.459615, 0.03137255, 1, 0, 1,
-0.4370221, 0.3337406, -1.704507, 0.02745098, 1, 0, 1,
-0.4260828, 0.2334959, -2.045276, 0.01960784, 1, 0, 1,
-0.4252277, 0.6143455, 0.6100499, 0.01568628, 1, 0, 1,
-0.4195137, 1.126369, -0.1215369, 0.007843138, 1, 0, 1,
-0.4176015, 0.4104872, -1.507217, 0.003921569, 1, 0, 1,
-0.4147947, -0.6897057, -3.046356, 0, 1, 0.003921569, 1,
-0.4136125, -1.243211, -2.601477, 0, 1, 0.01176471, 1,
-0.4126557, 0.4051386, -1.022118, 0, 1, 0.01568628, 1,
-0.4108074, 1.671898, -0.8195457, 0, 1, 0.02352941, 1,
-0.4073127, 0.8973407, -0.3993044, 0, 1, 0.02745098, 1,
-0.4060667, 0.6866506, 1.453499, 0, 1, 0.03529412, 1,
-0.4047058, -1.253501, -4.263657, 0, 1, 0.03921569, 1,
-0.4006444, -0.6780404, -1.65177, 0, 1, 0.04705882, 1,
-0.400643, 1.166785, 0.5768015, 0, 1, 0.05098039, 1,
-0.3986157, 0.6834072, -1.600128, 0, 1, 0.05882353, 1,
-0.3965318, 0.8112844, -0.4835563, 0, 1, 0.0627451, 1,
-0.3932119, 0.6394506, 0.03591336, 0, 1, 0.07058824, 1,
-0.3883269, -0.6694634, -3.317268, 0, 1, 0.07450981, 1,
-0.3861505, -0.2728637, -1.512847, 0, 1, 0.08235294, 1,
-0.3860172, -0.6670783, -1.74444, 0, 1, 0.08627451, 1,
-0.3819431, 0.3519048, -1.087416, 0, 1, 0.09411765, 1,
-0.3799989, 1.509556, 0.856665, 0, 1, 0.1019608, 1,
-0.3732263, 1.126256, -0.6520285, 0, 1, 0.1058824, 1,
-0.3712057, 0.8501037, 0.812861, 0, 1, 0.1137255, 1,
-0.3701003, 1.778586, -0.6471462, 0, 1, 0.1176471, 1,
-0.3663185, 0.4635605, -0.4993823, 0, 1, 0.1254902, 1,
-0.3641974, 1.689369, 0.2457722, 0, 1, 0.1294118, 1,
-0.3640726, 0.3482324, -0.04572248, 0, 1, 0.1372549, 1,
-0.3624164, -0.9245718, -4.660737, 0, 1, 0.1411765, 1,
-0.3611896, 1.352747, -0.6799918, 0, 1, 0.1490196, 1,
-0.3597755, -0.08083459, -1.077309, 0, 1, 0.1529412, 1,
-0.3555366, 0.3886483, -0.9652915, 0, 1, 0.1607843, 1,
-0.3490386, -0.4795306, -2.267042, 0, 1, 0.1647059, 1,
-0.3490022, -0.7776352, -2.065135, 0, 1, 0.172549, 1,
-0.3474286, -0.5963252, -1.364408, 0, 1, 0.1764706, 1,
-0.3430676, 0.7968568, -1.953755, 0, 1, 0.1843137, 1,
-0.3398545, -1.169914, -2.997954, 0, 1, 0.1882353, 1,
-0.3277353, 0.5584635, -0.6461068, 0, 1, 0.1960784, 1,
-0.3253269, 0.7102841, -0.9622781, 0, 1, 0.2039216, 1,
-0.323837, -0.8839157, -2.169405, 0, 1, 0.2078431, 1,
-0.3172319, -0.1310502, -0.8165326, 0, 1, 0.2156863, 1,
-0.3136453, -1.329024, -4.400564, 0, 1, 0.2196078, 1,
-0.3093586, 0.283175, -0.3027966, 0, 1, 0.227451, 1,
-0.3087337, -0.6967863, -2.751066, 0, 1, 0.2313726, 1,
-0.3075588, -0.04235224, -1.114259, 0, 1, 0.2392157, 1,
-0.3068023, -0.3236117, -2.458437, 0, 1, 0.2431373, 1,
-0.3016958, -1.186686, -3.723056, 0, 1, 0.2509804, 1,
-0.2970796, 0.148161, -0.09223936, 0, 1, 0.254902, 1,
-0.2940466, -0.7591985, -2.494975, 0, 1, 0.2627451, 1,
-0.2914512, -0.1956538, -1.62219, 0, 1, 0.2666667, 1,
-0.2873318, -0.4099442, -1.29405, 0, 1, 0.2745098, 1,
-0.2873016, 0.6084941, -2.575789, 0, 1, 0.2784314, 1,
-0.2865134, -0.2874505, -3.419721, 0, 1, 0.2862745, 1,
-0.2790636, 0.07906681, -2.490476, 0, 1, 0.2901961, 1,
-0.2767998, -0.913621, -2.932456, 0, 1, 0.2980392, 1,
-0.2763456, 1.175305, 0.78319, 0, 1, 0.3058824, 1,
-0.2760364, -1.25471, -0.3438606, 0, 1, 0.3098039, 1,
-0.2758247, 0.2978593, -0.7745194, 0, 1, 0.3176471, 1,
-0.2722354, 0.3875819, -0.4737237, 0, 1, 0.3215686, 1,
-0.2711687, 0.5904399, 0.541041, 0, 1, 0.3294118, 1,
-0.270911, 0.9965445, 0.7722785, 0, 1, 0.3333333, 1,
-0.2706823, 1.241374, -0.9615136, 0, 1, 0.3411765, 1,
-0.2669497, 2.168188, 0.8276266, 0, 1, 0.345098, 1,
-0.2591312, -0.4793652, -3.632497, 0, 1, 0.3529412, 1,
-0.258947, -0.0534017, -2.901124, 0, 1, 0.3568628, 1,
-0.2533992, -1.102957, -4.944195, 0, 1, 0.3647059, 1,
-0.2447499, 0.4899787, -0.6625152, 0, 1, 0.3686275, 1,
-0.2442526, -0.2526518, -2.390421, 0, 1, 0.3764706, 1,
-0.2436159, -0.1570716, -2.273754, 0, 1, 0.3803922, 1,
-0.2429799, 1.336924, -1.188197, 0, 1, 0.3882353, 1,
-0.2424322, -2.470532, -1.885568, 0, 1, 0.3921569, 1,
-0.2420798, 0.6304381, 1.930093, 0, 1, 0.4, 1,
-0.2400916, 0.558739, -0.730968, 0, 1, 0.4078431, 1,
-0.2372639, -0.3855149, -3.077633, 0, 1, 0.4117647, 1,
-0.2366539, 0.9083608, -1.104099, 0, 1, 0.4196078, 1,
-0.2297527, -0.07679077, -1.626094, 0, 1, 0.4235294, 1,
-0.2285391, -1.129522, -4.178609, 0, 1, 0.4313726, 1,
-0.2238063, -1.20719, -3.101482, 0, 1, 0.4352941, 1,
-0.2227667, -0.3048064, -2.397167, 0, 1, 0.4431373, 1,
-0.2218046, 0.4363373, -1.692034, 0, 1, 0.4470588, 1,
-0.2155415, -0.1459586, -2.246057, 0, 1, 0.454902, 1,
-0.214359, 0.1529486, -2.034742, 0, 1, 0.4588235, 1,
-0.2139506, 0.7243454, -0.4979665, 0, 1, 0.4666667, 1,
-0.2044492, -0.4978724, -4.897104, 0, 1, 0.4705882, 1,
-0.2017138, 0.8618461, -0.08947785, 0, 1, 0.4784314, 1,
-0.2010678, 0.5068781, -1.0256, 0, 1, 0.4823529, 1,
-0.1995191, -0.352582, -4.730677, 0, 1, 0.4901961, 1,
-0.1947241, 1.159792, 1.09147, 0, 1, 0.4941176, 1,
-0.1934917, 1.558159, 1.131615, 0, 1, 0.5019608, 1,
-0.1934783, 1.021906, 1.173487, 0, 1, 0.509804, 1,
-0.1929968, -0.3185067, -3.589691, 0, 1, 0.5137255, 1,
-0.186696, -0.4229854, -2.099627, 0, 1, 0.5215687, 1,
-0.1862729, -0.8843685, -3.700559, 0, 1, 0.5254902, 1,
-0.1856333, -0.4091889, -1.805123, 0, 1, 0.5333334, 1,
-0.1850779, -0.1928013, -2.159733, 0, 1, 0.5372549, 1,
-0.1835286, 0.773126, 0.3933071, 0, 1, 0.5450981, 1,
-0.1791568, -2.263844, -3.058717, 0, 1, 0.5490196, 1,
-0.1783608, -0.08686034, -0.9402207, 0, 1, 0.5568628, 1,
-0.1747501, 1.390406, -0.1416219, 0, 1, 0.5607843, 1,
-0.1695878, -1.248978, -4.288622, 0, 1, 0.5686275, 1,
-0.1689177, 0.1283405, -1.279568, 0, 1, 0.572549, 1,
-0.1684293, -1.594308, -3.322401, 0, 1, 0.5803922, 1,
-0.1656215, -0.2225189, -3.164595, 0, 1, 0.5843138, 1,
-0.16416, 1.026306, -0.3607349, 0, 1, 0.5921569, 1,
-0.158539, -0.5994931, -2.636242, 0, 1, 0.5960785, 1,
-0.1561918, -1.1462, -3.31096, 0, 1, 0.6039216, 1,
-0.1502765, -0.4047875, -2.224547, 0, 1, 0.6117647, 1,
-0.1490093, 1.032885, 0.2458634, 0, 1, 0.6156863, 1,
-0.1486424, 1.591757, 1.423222, 0, 1, 0.6235294, 1,
-0.1473708, -0.04259969, -3.863347, 0, 1, 0.627451, 1,
-0.145718, 1.763368, 0.6267663, 0, 1, 0.6352941, 1,
-0.1444156, -0.03631434, -0.5771354, 0, 1, 0.6392157, 1,
-0.1437227, 1.757011, -0.5900637, 0, 1, 0.6470588, 1,
-0.1406535, 0.3998453, 0.3920967, 0, 1, 0.6509804, 1,
-0.1357063, -0.1961152, -1.610616, 0, 1, 0.6588235, 1,
-0.1339428, -1.026481, -1.801357, 0, 1, 0.6627451, 1,
-0.1324639, -0.475028, -2.41654, 0, 1, 0.6705883, 1,
-0.1278421, -0.2162984, -2.329167, 0, 1, 0.6745098, 1,
-0.1270937, 1.442544, 1.429461, 0, 1, 0.682353, 1,
-0.1239011, 1.299651, -1.060783, 0, 1, 0.6862745, 1,
-0.1235738, 0.3236903, 0.03531908, 0, 1, 0.6941177, 1,
-0.1229736, 0.4796212, -1.227522, 0, 1, 0.7019608, 1,
-0.1181734, -0.3253739, -3.035678, 0, 1, 0.7058824, 1,
-0.1155398, -0.5225078, -3.00912, 0, 1, 0.7137255, 1,
-0.1118673, -0.1732688, -1.612199, 0, 1, 0.7176471, 1,
-0.1113867, 0.3841935, -1.386754, 0, 1, 0.7254902, 1,
-0.1109557, 0.381614, 0.4711304, 0, 1, 0.7294118, 1,
-0.1104491, 0.05097509, -3.037877, 0, 1, 0.7372549, 1,
-0.1054448, 0.2988407, -0.7103252, 0, 1, 0.7411765, 1,
-0.1047113, -1.099062, -3.111634, 0, 1, 0.7490196, 1,
-0.09730212, -0.3645642, -2.965548, 0, 1, 0.7529412, 1,
-0.09382872, 0.9000965, 1.312155, 0, 1, 0.7607843, 1,
-0.09093962, -0.2876039, -2.878432, 0, 1, 0.7647059, 1,
-0.08752523, 1.168958, 0.2995773, 0, 1, 0.772549, 1,
-0.0875086, 0.9513291, 0.2646702, 0, 1, 0.7764706, 1,
-0.08653107, -0.3561682, -2.424379, 0, 1, 0.7843137, 1,
-0.08611414, -0.1415852, -3.257771, 0, 1, 0.7882353, 1,
-0.07562745, -1.051181, -5.158587, 0, 1, 0.7960784, 1,
-0.07402785, 0.3834138, 0.8729417, 0, 1, 0.8039216, 1,
-0.07283904, -0.4831556, -3.989129, 0, 1, 0.8078431, 1,
-0.07126403, 0.119449, -2.326497, 0, 1, 0.8156863, 1,
-0.06966243, -1.061376, -4.106236, 0, 1, 0.8196079, 1,
-0.06436969, 1.013933, -2.160658, 0, 1, 0.827451, 1,
-0.06364344, 0.9646258, -0.7508192, 0, 1, 0.8313726, 1,
-0.06291131, 0.1780913, -0.4442801, 0, 1, 0.8392157, 1,
-0.05952716, 1.299745, -0.5438809, 0, 1, 0.8431373, 1,
-0.05911337, -1.845533, -3.026565, 0, 1, 0.8509804, 1,
-0.05889693, -1.761447, -0.4014657, 0, 1, 0.854902, 1,
-0.04261725, -1.461749, -2.810212, 0, 1, 0.8627451, 1,
-0.04094979, 0.8304681, 0.1833737, 0, 1, 0.8666667, 1,
-0.03888064, 0.0993255, 0.8181134, 0, 1, 0.8745098, 1,
-0.03833049, 1.176301, -1.607775, 0, 1, 0.8784314, 1,
-0.03691543, 0.2939653, 1.823998, 0, 1, 0.8862745, 1,
-0.03472759, 1.22818, -0.7127928, 0, 1, 0.8901961, 1,
-0.0341079, -1.940584, -2.945652, 0, 1, 0.8980392, 1,
-0.03322726, 1.102686, -2.117104, 0, 1, 0.9058824, 1,
-0.03132029, -0.5847838, -2.387148, 0, 1, 0.9098039, 1,
-0.03087427, 0.4063011, -1.209019, 0, 1, 0.9176471, 1,
-0.02385653, -1.022218, -5.350678, 0, 1, 0.9215686, 1,
-0.02314822, -1.474788, -4.054967, 0, 1, 0.9294118, 1,
-0.02175192, 1.168483, 0.6018004, 0, 1, 0.9333333, 1,
-0.02081226, 3.051238, 0.3367611, 0, 1, 0.9411765, 1,
-0.01092965, -0.9351718, -1.88676, 0, 1, 0.945098, 1,
-0.006847345, -0.9246697, -1.064211, 0, 1, 0.9529412, 1,
-0.004497011, -0.9666526, -2.223259, 0, 1, 0.9568627, 1,
-0.001549091, -1.096373, -2.69782, 0, 1, 0.9647059, 1,
-0.0002638348, 2.474918, 0.2495776, 0, 1, 0.9686275, 1,
0.005315344, 0.6346202, 0.2016318, 0, 1, 0.9764706, 1,
0.01194173, -0.6013147, 2.499397, 0, 1, 0.9803922, 1,
0.01377241, 1.614025, -0.8751168, 0, 1, 0.9882353, 1,
0.01440375, -0.1481701, 3.432632, 0, 1, 0.9921569, 1,
0.01477901, 0.3869319, 0.1353957, 0, 1, 1, 1,
0.01852671, 1.427621, -0.4609925, 0, 0.9921569, 1, 1,
0.02178854, 0.4862452, -0.3959669, 0, 0.9882353, 1, 1,
0.02406872, 0.3144167, -1.813859, 0, 0.9803922, 1, 1,
0.02696948, 0.006725524, 2.073227, 0, 0.9764706, 1, 1,
0.02842157, 0.1130136, -0.2972066, 0, 0.9686275, 1, 1,
0.0298945, -0.1048923, 2.467321, 0, 0.9647059, 1, 1,
0.03228818, 1.24458, -0.8548302, 0, 0.9568627, 1, 1,
0.04047965, 0.8074538, -0.969047, 0, 0.9529412, 1, 1,
0.04308544, -0.144282, 2.699129, 0, 0.945098, 1, 1,
0.04375445, 0.9295492, 0.3365468, 0, 0.9411765, 1, 1,
0.04775113, 0.1367015, 0.2231488, 0, 0.9333333, 1, 1,
0.05021233, 0.6622129, -0.9631487, 0, 0.9294118, 1, 1,
0.05248638, -0.02378753, 2.432928, 0, 0.9215686, 1, 1,
0.05482148, 0.1000785, 0.2336832, 0, 0.9176471, 1, 1,
0.05621107, -1.974106, 3.54403, 0, 0.9098039, 1, 1,
0.05654861, 0.9071231, -0.6434031, 0, 0.9058824, 1, 1,
0.05728145, -1.112725, 4.324488, 0, 0.8980392, 1, 1,
0.06133191, -0.48212, 2.134675, 0, 0.8901961, 1, 1,
0.061886, 0.6816612, 0.7047974, 0, 0.8862745, 1, 1,
0.06420203, -0.6350116, 2.964829, 0, 0.8784314, 1, 1,
0.06521908, -1.043459, 2.565546, 0, 0.8745098, 1, 1,
0.0657476, 0.4088202, 0.004904952, 0, 0.8666667, 1, 1,
0.06627951, -2.3568, 3.991989, 0, 0.8627451, 1, 1,
0.06738675, -0.9549772, 2.678042, 0, 0.854902, 1, 1,
0.07240894, 1.299821, 0.2858107, 0, 0.8509804, 1, 1,
0.07523052, 1.130327, 1.04892, 0, 0.8431373, 1, 1,
0.07626837, -0.7865329, 1.821039, 0, 0.8392157, 1, 1,
0.07647901, 0.3017486, 0.7885992, 0, 0.8313726, 1, 1,
0.07977828, 1.725569, -1.028735, 0, 0.827451, 1, 1,
0.08063675, 0.10679, 1.195819, 0, 0.8196079, 1, 1,
0.0819415, -0.5173123, 3.131904, 0, 0.8156863, 1, 1,
0.0848161, -0.9112284, 2.922875, 0, 0.8078431, 1, 1,
0.08881116, 0.1523873, 0.2142983, 0, 0.8039216, 1, 1,
0.08991166, -0.3594412, 3.672609, 0, 0.7960784, 1, 1,
0.09250923, -1.23441, 2.257934, 0, 0.7882353, 1, 1,
0.09381088, -0.09026586, 1.460312, 0, 0.7843137, 1, 1,
0.09404743, 0.492101, 0.4275892, 0, 0.7764706, 1, 1,
0.1004846, 1.147003, 1.564625, 0, 0.772549, 1, 1,
0.1014967, -0.003335044, 0.3411084, 0, 0.7647059, 1, 1,
0.1051929, 1.972075, 2.089077, 0, 0.7607843, 1, 1,
0.1081147, -0.5532452, 3.739915, 0, 0.7529412, 1, 1,
0.1107837, -0.794449, 3.678045, 0, 0.7490196, 1, 1,
0.1112938, -0.5842436, 2.895476, 0, 0.7411765, 1, 1,
0.1155802, -0.7758972, 1.27946, 0, 0.7372549, 1, 1,
0.1172482, -1.640865, 4.559147, 0, 0.7294118, 1, 1,
0.1225544, 0.8198334, 1.208046, 0, 0.7254902, 1, 1,
0.1316946, 0.2310964, 0.4705606, 0, 0.7176471, 1, 1,
0.1319402, -1.443249, 2.78889, 0, 0.7137255, 1, 1,
0.1334291, 0.4341898, -0.2660659, 0, 0.7058824, 1, 1,
0.1359529, -0.6017986, 2.313176, 0, 0.6980392, 1, 1,
0.1410193, 1.402939, -1.434667, 0, 0.6941177, 1, 1,
0.1455784, -0.1945287, 4.692892, 0, 0.6862745, 1, 1,
0.1462543, 0.1477183, -0.7332028, 0, 0.682353, 1, 1,
0.1470848, 0.487581, -0.9346226, 0, 0.6745098, 1, 1,
0.1472151, 1.579528, -0.3738808, 0, 0.6705883, 1, 1,
0.1506063, -0.06450375, 1.613783, 0, 0.6627451, 1, 1,
0.1564541, 0.382688, -0.7270235, 0, 0.6588235, 1, 1,
0.163603, 0.0638958, 0.2366503, 0, 0.6509804, 1, 1,
0.1653538, 0.5520388, -0.07351574, 0, 0.6470588, 1, 1,
0.1655019, -0.02272721, 3.006074, 0, 0.6392157, 1, 1,
0.1656898, -0.5572293, 2.679183, 0, 0.6352941, 1, 1,
0.1671875, 0.7819146, 1.728702, 0, 0.627451, 1, 1,
0.1722663, 0.7789556, -0.7115438, 0, 0.6235294, 1, 1,
0.1729517, 0.8296791, 1.371674, 0, 0.6156863, 1, 1,
0.1748571, -1.704527, 3.596605, 0, 0.6117647, 1, 1,
0.1833683, -0.3439308, 2.89825, 0, 0.6039216, 1, 1,
0.1875051, 0.9115202, 1.636172, 0, 0.5960785, 1, 1,
0.1882294, -1.406558, 2.012715, 0, 0.5921569, 1, 1,
0.1891248, 0.2875586, 0.1522401, 0, 0.5843138, 1, 1,
0.1974049, -0.6455515, 2.168261, 0, 0.5803922, 1, 1,
0.1977842, 0.1889271, 0.6764623, 0, 0.572549, 1, 1,
0.199376, 1.233622, 1.175142, 0, 0.5686275, 1, 1,
0.1994743, -0.7248278, 1.083308, 0, 0.5607843, 1, 1,
0.2002047, 1.277511, -0.500889, 0, 0.5568628, 1, 1,
0.2022618, 0.5445018, 0.5318299, 0, 0.5490196, 1, 1,
0.2062089, -0.6730305, 3.086312, 0, 0.5450981, 1, 1,
0.2070937, -1.047173, 2.784643, 0, 0.5372549, 1, 1,
0.2072432, 1.079128, -0.216493, 0, 0.5333334, 1, 1,
0.210084, -0.1170454, 1.509075, 0, 0.5254902, 1, 1,
0.2134724, -1.074476, 4.164098, 0, 0.5215687, 1, 1,
0.2265355, 0.7188649, -0.8689297, 0, 0.5137255, 1, 1,
0.2319063, -1.462891, 1.27284, 0, 0.509804, 1, 1,
0.2360398, 0.6233104, 0.8837626, 0, 0.5019608, 1, 1,
0.2373769, -1.11906, 2.212639, 0, 0.4941176, 1, 1,
0.2381001, -0.6998038, 1.845065, 0, 0.4901961, 1, 1,
0.2460607, 2.493649, 0.6298001, 0, 0.4823529, 1, 1,
0.2493774, -1.143073, 0.9013747, 0, 0.4784314, 1, 1,
0.2517609, 1.77811, 0.8444923, 0, 0.4705882, 1, 1,
0.255446, 1.303194, 0.4279628, 0, 0.4666667, 1, 1,
0.2600029, 0.3120222, 0.6223162, 0, 0.4588235, 1, 1,
0.2601304, -0.315672, 2.700583, 0, 0.454902, 1, 1,
0.2625953, 1.963591, -1.064679, 0, 0.4470588, 1, 1,
0.2634107, -0.1579841, 0.8123171, 0, 0.4431373, 1, 1,
0.2682355, -0.5247614, 2.458545, 0, 0.4352941, 1, 1,
0.275599, 0.1652156, 1.888123, 0, 0.4313726, 1, 1,
0.2760256, -0.5002887, 1.557587, 0, 0.4235294, 1, 1,
0.2786103, 0.5518879, -1.779859, 0, 0.4196078, 1, 1,
0.2841185, -0.723134, 1.872754, 0, 0.4117647, 1, 1,
0.2870856, 1.131349, -0.4523812, 0, 0.4078431, 1, 1,
0.2891587, -1.505042, 4.755561, 0, 0.4, 1, 1,
0.2896817, -0.6354499, 4.29293, 0, 0.3921569, 1, 1,
0.291729, -0.9278562, 3.705682, 0, 0.3882353, 1, 1,
0.2920697, 0.9790118, 1.924239, 0, 0.3803922, 1, 1,
0.2947138, -0.83797, 1.840527, 0, 0.3764706, 1, 1,
0.2952093, -0.7190743, 4.199231, 0, 0.3686275, 1, 1,
0.2969468, 0.7507196, 0.07737946, 0, 0.3647059, 1, 1,
0.2987698, -0.01972051, 0.8168739, 0, 0.3568628, 1, 1,
0.3000402, -0.6077843, 1.513239, 0, 0.3529412, 1, 1,
0.3053305, 1.362644, 2.028423, 0, 0.345098, 1, 1,
0.3060107, -0.2151898, 3.594674, 0, 0.3411765, 1, 1,
0.3083784, 1.35801, -0.08246976, 0, 0.3333333, 1, 1,
0.3098237, 1.640651, 0.5483702, 0, 0.3294118, 1, 1,
0.3123143, -2.38741, 1.873207, 0, 0.3215686, 1, 1,
0.318502, 0.01728497, 1.777256, 0, 0.3176471, 1, 1,
0.3195162, -1.358701, 3.417283, 0, 0.3098039, 1, 1,
0.324094, 0.04384496, 1.551757, 0, 0.3058824, 1, 1,
0.3248504, -2.075854, 3.823087, 0, 0.2980392, 1, 1,
0.3277695, -0.0577538, 2.220725, 0, 0.2901961, 1, 1,
0.3307205, -1.636467, 4.425141, 0, 0.2862745, 1, 1,
0.3317076, -1.21818, 2.900955, 0, 0.2784314, 1, 1,
0.3401248, -0.1404843, 1.014203, 0, 0.2745098, 1, 1,
0.3419003, -0.4958126, 2.159151, 0, 0.2666667, 1, 1,
0.3450114, 0.1016812, 1.419489, 0, 0.2627451, 1, 1,
0.3496644, -1.636736, 2.309005, 0, 0.254902, 1, 1,
0.3525843, -0.576099, 1.646948, 0, 0.2509804, 1, 1,
0.3536606, 0.896993, 0.7002121, 0, 0.2431373, 1, 1,
0.3547757, 0.27383, 0.5383044, 0, 0.2392157, 1, 1,
0.358556, 1.362123, 0.5106591, 0, 0.2313726, 1, 1,
0.3617855, 0.7432501, -0.05332245, 0, 0.227451, 1, 1,
0.3619447, -0.6624777, 1.645473, 0, 0.2196078, 1, 1,
0.3663474, 0.08336451, 1.950975, 0, 0.2156863, 1, 1,
0.3669083, -0.2316171, 1.215652, 0, 0.2078431, 1, 1,
0.3688525, -1.527065, 2.756774, 0, 0.2039216, 1, 1,
0.3698254, 0.8168028, -0.9850523, 0, 0.1960784, 1, 1,
0.3704782, -0.7626091, 3.12254, 0, 0.1882353, 1, 1,
0.3710291, 1.418384, -0.2823929, 0, 0.1843137, 1, 1,
0.3718008, 0.5359591, 0.4066086, 0, 0.1764706, 1, 1,
0.3725798, -0.5613, 2.94764, 0, 0.172549, 1, 1,
0.3749894, 1.807096, -0.6636361, 0, 0.1647059, 1, 1,
0.3766423, -0.9902093, 3.91171, 0, 0.1607843, 1, 1,
0.3767826, 0.7889541, 1.137821, 0, 0.1529412, 1, 1,
0.3810044, 1.721242, -1.01345, 0, 0.1490196, 1, 1,
0.3816112, 0.4251632, 1.229263, 0, 0.1411765, 1, 1,
0.3830802, 0.946651, 0.8763474, 0, 0.1372549, 1, 1,
0.3866049, -0.8360215, 4.470326, 0, 0.1294118, 1, 1,
0.3866833, 0.1199344, 2.395506, 0, 0.1254902, 1, 1,
0.3868919, 0.3909693, 3.080179, 0, 0.1176471, 1, 1,
0.387108, -0.685746, 2.283125, 0, 0.1137255, 1, 1,
0.3877572, -0.8561051, 2.038759, 0, 0.1058824, 1, 1,
0.3878828, 0.01072585, 1.402606, 0, 0.09803922, 1, 1,
0.3894005, 0.4981238, 1.392562, 0, 0.09411765, 1, 1,
0.3894431, -0.3184744, 1.237036, 0, 0.08627451, 1, 1,
0.3900367, 1.325247, 1.676253, 0, 0.08235294, 1, 1,
0.394226, 1.442475, 0.8208891, 0, 0.07450981, 1, 1,
0.3949541, -1.641526, 2.609412, 0, 0.07058824, 1, 1,
0.3950519, 1.515692, 0.305447, 0, 0.0627451, 1, 1,
0.3956588, -0.1432145, 0.9032791, 0, 0.05882353, 1, 1,
0.3961081, -0.7367421, 2.999723, 0, 0.05098039, 1, 1,
0.3997692, 1.747096, -0.1047316, 0, 0.04705882, 1, 1,
0.3999429, 1.876455, 0.5723947, 0, 0.03921569, 1, 1,
0.400777, -0.4352182, 2.412746, 0, 0.03529412, 1, 1,
0.4028386, 1.617071, -0.7863877, 0, 0.02745098, 1, 1,
0.4041822, 1.372295, 0.2356669, 0, 0.02352941, 1, 1,
0.4085324, 1.208129, 0.5583549, 0, 0.01568628, 1, 1,
0.4132253, 0.481975, 0.00674755, 0, 0.01176471, 1, 1,
0.4157187, 1.357373, 1.032882, 0, 0.003921569, 1, 1,
0.4210927, -0.3110231, 0.9710383, 0.003921569, 0, 1, 1,
0.4243976, 1.907155, -1.708136, 0.007843138, 0, 1, 1,
0.4259368, 0.3881284, 1.34893, 0.01568628, 0, 1, 1,
0.4262623, -1.026812, 2.017915, 0.01960784, 0, 1, 1,
0.4291373, -1.043597, 2.747841, 0.02745098, 0, 1, 1,
0.4340659, 0.7797444, 1.829373, 0.03137255, 0, 1, 1,
0.4364463, 2.119661, 0.09328335, 0.03921569, 0, 1, 1,
0.4389635, 0.3821744, -0.2755287, 0.04313726, 0, 1, 1,
0.4392328, 1.055969, -0.9419466, 0.05098039, 0, 1, 1,
0.4459264, -1.509828, 3.349826, 0.05490196, 0, 1, 1,
0.4509076, -0.7955953, 2.23471, 0.0627451, 0, 1, 1,
0.4618108, 1.310616, 1.338936, 0.06666667, 0, 1, 1,
0.4640658, -0.6232885, 0.593704, 0.07450981, 0, 1, 1,
0.4668627, -0.886961, 3.888738, 0.07843138, 0, 1, 1,
0.4672737, 0.4044083, 1.368972, 0.08627451, 0, 1, 1,
0.4731499, -1.13236, 1.661266, 0.09019608, 0, 1, 1,
0.48162, 0.416752, 1.932941, 0.09803922, 0, 1, 1,
0.4864794, -0.1062282, 2.483476, 0.1058824, 0, 1, 1,
0.4904307, -0.2684239, 0.8723215, 0.1098039, 0, 1, 1,
0.4921469, 1.356168, -0.7471322, 0.1176471, 0, 1, 1,
0.493289, 1.060221, -0.5532953, 0.1215686, 0, 1, 1,
0.493448, 0.8976887, -0.4703739, 0.1294118, 0, 1, 1,
0.4949192, -1.360813, 4.55964, 0.1333333, 0, 1, 1,
0.4949873, -0.5023448, 2.356725, 0.1411765, 0, 1, 1,
0.4955549, 1.127639, 0.3629254, 0.145098, 0, 1, 1,
0.4971771, -0.2897857, 2.98701, 0.1529412, 0, 1, 1,
0.5032659, 0.3011167, 1.015093, 0.1568628, 0, 1, 1,
0.5041075, -0.3898267, 1.617694, 0.1647059, 0, 1, 1,
0.5082283, -1.49735, 1.208633, 0.1686275, 0, 1, 1,
0.510214, 2.171716, -0.2577347, 0.1764706, 0, 1, 1,
0.510528, -0.4847881, 2.623497, 0.1803922, 0, 1, 1,
0.5107921, -0.5302604, 2.40877, 0.1882353, 0, 1, 1,
0.5116649, -0.9252728, 3.709733, 0.1921569, 0, 1, 1,
0.5133494, -0.7323068, 2.895219, 0.2, 0, 1, 1,
0.5199716, 1.107356, 0.3764877, 0.2078431, 0, 1, 1,
0.5264775, 0.6266696, 1.478474, 0.2117647, 0, 1, 1,
0.5274627, -0.8029837, 2.808869, 0.2196078, 0, 1, 1,
0.5305195, -1.28476, 2.114608, 0.2235294, 0, 1, 1,
0.5320982, -0.318187, 0.2508498, 0.2313726, 0, 1, 1,
0.5345975, -0.243498, 3.298252, 0.2352941, 0, 1, 1,
0.5382326, 0.06505828, 1.713986, 0.2431373, 0, 1, 1,
0.5411164, 0.8980936, 1.275931, 0.2470588, 0, 1, 1,
0.5415068, 1.709637, 1.42719, 0.254902, 0, 1, 1,
0.5440133, 0.6179382, -1.11392, 0.2588235, 0, 1, 1,
0.5480352, -0.1738262, 1.30574, 0.2666667, 0, 1, 1,
0.5534046, 2.101863, 1.840686, 0.2705882, 0, 1, 1,
0.5548136, -1.348311, 1.825791, 0.2784314, 0, 1, 1,
0.5621853, 1.185019, 0.9053069, 0.282353, 0, 1, 1,
0.5627695, 0.4682842, 2.336823, 0.2901961, 0, 1, 1,
0.5713434, 0.00721344, 1.646855, 0.2941177, 0, 1, 1,
0.5738913, 0.03641398, 1.189217, 0.3019608, 0, 1, 1,
0.5760304, 0.439045, 0.8351547, 0.3098039, 0, 1, 1,
0.5810578, 0.2305886, 3.213806, 0.3137255, 0, 1, 1,
0.5815959, -0.2377047, 1.355418, 0.3215686, 0, 1, 1,
0.5819561, -1.69142, 1.438536, 0.3254902, 0, 1, 1,
0.5850025, -0.06947132, 1.727531, 0.3333333, 0, 1, 1,
0.5851973, 0.3058338, 0.6618477, 0.3372549, 0, 1, 1,
0.5881753, -0.3695931, 3.418035, 0.345098, 0, 1, 1,
0.5914215, -0.5072632, 1.391059, 0.3490196, 0, 1, 1,
0.5928802, -1.290397, 2.140604, 0.3568628, 0, 1, 1,
0.5974819, -1.036176, 1.837714, 0.3607843, 0, 1, 1,
0.5992731, -1.026578, 3.649191, 0.3686275, 0, 1, 1,
0.6106807, -1.379726, 1.87278, 0.372549, 0, 1, 1,
0.6110466, 0.1264626, 0.6013523, 0.3803922, 0, 1, 1,
0.6173297, 0.4851463, 0.7228799, 0.3843137, 0, 1, 1,
0.6179683, -1.390214, 2.636454, 0.3921569, 0, 1, 1,
0.6196894, 1.386763, 0.4011841, 0.3960784, 0, 1, 1,
0.6225768, 0.003401944, 1.459836, 0.4039216, 0, 1, 1,
0.6232324, 0.4337338, 1.186602, 0.4117647, 0, 1, 1,
0.6287807, 0.7117479, -0.06563243, 0.4156863, 0, 1, 1,
0.6293189, -0.5524985, 1.56478, 0.4235294, 0, 1, 1,
0.6351819, -0.8430384, 2.562718, 0.427451, 0, 1, 1,
0.6353982, 0.1317282, 2.345244, 0.4352941, 0, 1, 1,
0.638293, -1.517053, 4.772182, 0.4392157, 0, 1, 1,
0.6416171, 0.5093358, 2.516085, 0.4470588, 0, 1, 1,
0.6463332, -0.1374533, 2.261563, 0.4509804, 0, 1, 1,
0.651589, -0.1744778, 2.071456, 0.4588235, 0, 1, 1,
0.6563544, 1.01833, 0.7533019, 0.4627451, 0, 1, 1,
0.6640986, -0.8883078, 4.378103, 0.4705882, 0, 1, 1,
0.6755977, 0.8177379, -1.207267, 0.4745098, 0, 1, 1,
0.6760131, -1.434372, 0.5673381, 0.4823529, 0, 1, 1,
0.6773525, 0.05103097, 2.204863, 0.4862745, 0, 1, 1,
0.6813304, 0.09372072, 0.05084192, 0.4941176, 0, 1, 1,
0.6831188, 1.091215, 0.5844619, 0.5019608, 0, 1, 1,
0.687418, 0.9750166, 1.329191, 0.5058824, 0, 1, 1,
0.6895137, -1.396469, 1.519782, 0.5137255, 0, 1, 1,
0.6902102, -1.183378, 3.243046, 0.5176471, 0, 1, 1,
0.6965659, 0.1452045, 1.644547, 0.5254902, 0, 1, 1,
0.6999886, -0.2712086, 2.837857, 0.5294118, 0, 1, 1,
0.7009529, -0.9856365, 2.993882, 0.5372549, 0, 1, 1,
0.7042251, 0.1005767, 1.482785, 0.5411765, 0, 1, 1,
0.7045934, 0.2029039, 1.187496, 0.5490196, 0, 1, 1,
0.7072576, -0.2824335, 1.951095, 0.5529412, 0, 1, 1,
0.710751, 0.6467327, 1.530114, 0.5607843, 0, 1, 1,
0.7113139, -0.07736035, -0.02210251, 0.5647059, 0, 1, 1,
0.7162212, -0.1969524, 1.601807, 0.572549, 0, 1, 1,
0.7166669, 0.9965913, -0.07355963, 0.5764706, 0, 1, 1,
0.7178047, -1.76641, 2.635339, 0.5843138, 0, 1, 1,
0.7210598, -0.04523492, 2.032664, 0.5882353, 0, 1, 1,
0.7228718, -0.6777184, 1.739681, 0.5960785, 0, 1, 1,
0.7244141, -0.9108164, 3.781787, 0.6039216, 0, 1, 1,
0.7348175, 1.39587, 1.265338, 0.6078432, 0, 1, 1,
0.7357515, 0.8691952, 0.6339595, 0.6156863, 0, 1, 1,
0.7363648, 1.368988, -0.7474875, 0.6196079, 0, 1, 1,
0.7381425, 1.821318, 1.359096, 0.627451, 0, 1, 1,
0.7415854, 1.447649, 1.364223, 0.6313726, 0, 1, 1,
0.7507841, -1.597494, 4.241663, 0.6392157, 0, 1, 1,
0.7523585, 1.487396, 0.3422676, 0.6431373, 0, 1, 1,
0.7552177, 0.6160222, 1.073124, 0.6509804, 0, 1, 1,
0.7602154, 1.299009, 2.255872, 0.654902, 0, 1, 1,
0.7621946, -0.2443803, 1.676457, 0.6627451, 0, 1, 1,
0.7647912, -1.291624, 1.303146, 0.6666667, 0, 1, 1,
0.7662217, 1.11688, 1.896306, 0.6745098, 0, 1, 1,
0.7709431, -0.4155034, 1.286901, 0.6784314, 0, 1, 1,
0.7716403, -0.756016, 1.761538, 0.6862745, 0, 1, 1,
0.778465, 0.9248212, 0.1652785, 0.6901961, 0, 1, 1,
0.7807091, 0.1753142, 0.5694421, 0.6980392, 0, 1, 1,
0.785029, 0.7440351, 0.5351881, 0.7058824, 0, 1, 1,
0.785951, 0.1889242, 0.2148865, 0.7098039, 0, 1, 1,
0.7874508, 1.316582, -1.288809, 0.7176471, 0, 1, 1,
0.7947202, -1.109139, 4.107721, 0.7215686, 0, 1, 1,
0.7978237, -0.1286405, 2.099986, 0.7294118, 0, 1, 1,
0.8041569, -0.4127922, 3.881398, 0.7333333, 0, 1, 1,
0.8088077, 0.30415, 1.9518, 0.7411765, 0, 1, 1,
0.8112159, -0.2660378, 3.358087, 0.7450981, 0, 1, 1,
0.8136873, -0.9166083, 2.427169, 0.7529412, 0, 1, 1,
0.8145002, 0.459183, 0.7674927, 0.7568628, 0, 1, 1,
0.8188704, 0.885156, 0.2964468, 0.7647059, 0, 1, 1,
0.8211021, 0.02222841, 2.357917, 0.7686275, 0, 1, 1,
0.8234347, -0.8744282, 2.807622, 0.7764706, 0, 1, 1,
0.8298491, 1.094729, 2.194772, 0.7803922, 0, 1, 1,
0.8306049, 0.07976171, -0.04588808, 0.7882353, 0, 1, 1,
0.8351523, -1.694283, 1.642075, 0.7921569, 0, 1, 1,
0.8413154, -0.6431619, 1.648082, 0.8, 0, 1, 1,
0.8422707, -1.529195, 3.472042, 0.8078431, 0, 1, 1,
0.8429089, 0.8741397, 0.5613788, 0.8117647, 0, 1, 1,
0.8433077, -1.26862, 3.050441, 0.8196079, 0, 1, 1,
0.8464961, 1.48095, 2.806516, 0.8235294, 0, 1, 1,
0.8476521, -0.5437939, 2.420363, 0.8313726, 0, 1, 1,
0.8504598, -1.131334, 3.325196, 0.8352941, 0, 1, 1,
0.8589686, -0.1127051, 2.49029, 0.8431373, 0, 1, 1,
0.8629707, -0.8970809, 1.938918, 0.8470588, 0, 1, 1,
0.8647737, -0.6444956, 2.463802, 0.854902, 0, 1, 1,
0.8775735, -1.210966, 1.82294, 0.8588235, 0, 1, 1,
0.8804281, -1.452497, 3.870015, 0.8666667, 0, 1, 1,
0.8891377, -0.3940568, 0.3207369, 0.8705882, 0, 1, 1,
0.8939242, 0.6942818, 0.6093352, 0.8784314, 0, 1, 1,
0.8954402, 0.7789366, -0.5381704, 0.8823529, 0, 1, 1,
0.8967092, 0.8694106, 1.085465, 0.8901961, 0, 1, 1,
0.9070771, 0.4119717, 1.454008, 0.8941177, 0, 1, 1,
0.9087299, 2.275922, 1.703738, 0.9019608, 0, 1, 1,
0.9120283, -0.7779153, 2.086351, 0.9098039, 0, 1, 1,
0.9148048, -1.754944, 4.585382, 0.9137255, 0, 1, 1,
0.9153402, 0.06782692, 2.026547, 0.9215686, 0, 1, 1,
0.9168674, -2.308026, 1.141814, 0.9254902, 0, 1, 1,
0.9252241, -0.4374294, 0.06344843, 0.9333333, 0, 1, 1,
0.9272105, -1.502894, 1.361593, 0.9372549, 0, 1, 1,
0.9316878, -0.2525494, 3.245192, 0.945098, 0, 1, 1,
0.9325863, -0.1308308, 1.039986, 0.9490196, 0, 1, 1,
0.935766, 0.07997618, 1.170473, 0.9568627, 0, 1, 1,
0.9368161, 0.6993726, 1.242047, 0.9607843, 0, 1, 1,
0.9420075, 0.5512966, 2.92475, 0.9686275, 0, 1, 1,
0.9529201, -0.1018799, -0.3072789, 0.972549, 0, 1, 1,
0.9558019, -1.147628, 2.5386, 0.9803922, 0, 1, 1,
0.957416, -0.734417, 0.9132053, 0.9843137, 0, 1, 1,
0.960391, 0.988996, 1.404275, 0.9921569, 0, 1, 1,
0.9642914, 0.9871396, 1.100979, 0.9960784, 0, 1, 1,
0.9809154, -0.6595081, 2.618874, 1, 0, 0.9960784, 1,
0.9822397, -0.2028904, 3.032909, 1, 0, 0.9882353, 1,
0.9836573, 0.3292007, 0.05874449, 1, 0, 0.9843137, 1,
0.9924016, 0.4152269, 1.585912, 1, 0, 0.9764706, 1,
0.9972128, -0.5172098, 2.162259, 1, 0, 0.972549, 1,
1.007094, -1.055516, 1.25563, 1, 0, 0.9647059, 1,
1.020092, -1.539178, 3.625302, 1, 0, 0.9607843, 1,
1.020452, -1.423462, 2.342915, 1, 0, 0.9529412, 1,
1.021236, -0.5769141, 1.506697, 1, 0, 0.9490196, 1,
1.023413, 0.5695748, 0.3834659, 1, 0, 0.9411765, 1,
1.023914, -1.956804, 2.058184, 1, 0, 0.9372549, 1,
1.024822, -0.5611845, 3.104072, 1, 0, 0.9294118, 1,
1.033447, -0.3166101, 0.9391173, 1, 0, 0.9254902, 1,
1.03467, -0.7070838, 2.668444, 1, 0, 0.9176471, 1,
1.035288, -0.7646931, 2.785455, 1, 0, 0.9137255, 1,
1.039157, -0.401282, 1.1151, 1, 0, 0.9058824, 1,
1.044619, -0.6304083, 2.051234, 1, 0, 0.9019608, 1,
1.048582, -0.06552924, 3.180762, 1, 0, 0.8941177, 1,
1.049618, 0.5031769, 1.711099, 1, 0, 0.8862745, 1,
1.063218, -0.7056617, 1.89333, 1, 0, 0.8823529, 1,
1.065637, 0.2163738, 1.660977, 1, 0, 0.8745098, 1,
1.06845, -1.787154, 4.229028, 1, 0, 0.8705882, 1,
1.070513, -0.6108009, 1.126449, 1, 0, 0.8627451, 1,
1.073927, 1.852084, 0.8471861, 1, 0, 0.8588235, 1,
1.078984, 0.3494382, 2.092949, 1, 0, 0.8509804, 1,
1.08132, -0.8179554, 2.503355, 1, 0, 0.8470588, 1,
1.084483, -0.1932879, 1.575695, 1, 0, 0.8392157, 1,
1.095879, 1.251032, -0.2586379, 1, 0, 0.8352941, 1,
1.096021, -0.2257981, 1.409834, 1, 0, 0.827451, 1,
1.104115, -1.68126, 3.721949, 1, 0, 0.8235294, 1,
1.104802, -0.2905041, 2.391731, 1, 0, 0.8156863, 1,
1.105709, -0.9799576, 0.7267285, 1, 0, 0.8117647, 1,
1.106442, 0.05918438, 2.796321, 1, 0, 0.8039216, 1,
1.114396, 0.7011929, 0.6327225, 1, 0, 0.7960784, 1,
1.119139, 0.8672176, 0.9379772, 1, 0, 0.7921569, 1,
1.120504, 1.143012, 2.846422, 1, 0, 0.7843137, 1,
1.128809, -0.7442288, 1.112201, 1, 0, 0.7803922, 1,
1.12887, -1.529355, 3.042294, 1, 0, 0.772549, 1,
1.13136, -0.6846249, 1.276444, 1, 0, 0.7686275, 1,
1.131919, -0.808616, 1.657763, 1, 0, 0.7607843, 1,
1.13641, 0.4502397, 0.6153967, 1, 0, 0.7568628, 1,
1.142312, -0.7916918, 0.5168947, 1, 0, 0.7490196, 1,
1.144767, -0.02211191, 1.724225, 1, 0, 0.7450981, 1,
1.151428, -0.2681993, 1.683431, 1, 0, 0.7372549, 1,
1.154668, 0.2160632, 0.8642693, 1, 0, 0.7333333, 1,
1.168048, 0.8757396, 1.90002, 1, 0, 0.7254902, 1,
1.170679, 0.4852285, 0.3403305, 1, 0, 0.7215686, 1,
1.179778, -0.2917203, 1.503652, 1, 0, 0.7137255, 1,
1.182161, -1.039405, 2.229031, 1, 0, 0.7098039, 1,
1.183582, -0.3927196, 1.642218, 1, 0, 0.7019608, 1,
1.185799, 0.3407447, 2.019561, 1, 0, 0.6941177, 1,
1.192666, -0.2814908, 3.409363, 1, 0, 0.6901961, 1,
1.204001, -1.627113, 3.207278, 1, 0, 0.682353, 1,
1.213357, -0.1265639, 1.434755, 1, 0, 0.6784314, 1,
1.216291, -1.226889, -0.06013839, 1, 0, 0.6705883, 1,
1.218185, 0.6423737, 1.768689, 1, 0, 0.6666667, 1,
1.22021, -0.3343149, 0.727505, 1, 0, 0.6588235, 1,
1.230677, 1.365641, -0.9830793, 1, 0, 0.654902, 1,
1.231705, 0.7047965, 1.529655, 1, 0, 0.6470588, 1,
1.246483, -1.009972, 2.46296, 1, 0, 0.6431373, 1,
1.248834, -0.133053, 3.918894, 1, 0, 0.6352941, 1,
1.254119, -0.7260144, 1.559598, 1, 0, 0.6313726, 1,
1.258483, 1.262398, 2.865674, 1, 0, 0.6235294, 1,
1.271959, -1.225747, 3.081588, 1, 0, 0.6196079, 1,
1.273854, 1.623866, -0.2424148, 1, 0, 0.6117647, 1,
1.274781, 1.040115, 2.000895, 1, 0, 0.6078432, 1,
1.281167, -0.2274732, 1.124789, 1, 0, 0.6, 1,
1.290921, 0.2519812, 0.7449979, 1, 0, 0.5921569, 1,
1.29318, 0.9096715, 0.1862714, 1, 0, 0.5882353, 1,
1.297439, 0.9339085, -1.125268, 1, 0, 0.5803922, 1,
1.299151, 0.1301571, 3.241987, 1, 0, 0.5764706, 1,
1.300752, -0.06054262, 0.540202, 1, 0, 0.5686275, 1,
1.304146, 2.920403, 2.574003, 1, 0, 0.5647059, 1,
1.309802, 1.008261, 1.596822, 1, 0, 0.5568628, 1,
1.319255, 2.565888, -0.4475174, 1, 0, 0.5529412, 1,
1.320364, -0.8769538, 2.735155, 1, 0, 0.5450981, 1,
1.323499, 0.4876682, 1.592506, 1, 0, 0.5411765, 1,
1.330977, 0.3180244, 1.216655, 1, 0, 0.5333334, 1,
1.336224, 1.281562, 0.9584556, 1, 0, 0.5294118, 1,
1.33698, 0.7876461, 0.4615617, 1, 0, 0.5215687, 1,
1.337822, -1.031579, 3.001995, 1, 0, 0.5176471, 1,
1.338608, 0.7871468, 0.777465, 1, 0, 0.509804, 1,
1.339821, 0.02573812, 3.075246, 1, 0, 0.5058824, 1,
1.340732, 1.189095, -0.1724789, 1, 0, 0.4980392, 1,
1.348864, 1.334334, 0.06960526, 1, 0, 0.4901961, 1,
1.350782, 0.202556, 2.433839, 1, 0, 0.4862745, 1,
1.362318, 1.090154, -0.03632229, 1, 0, 0.4784314, 1,
1.36473, -0.2257309, -0.1664466, 1, 0, 0.4745098, 1,
1.368736, 0.9040654, 2.71245, 1, 0, 0.4666667, 1,
1.383564, -0.7273698, 2.778922, 1, 0, 0.4627451, 1,
1.384715, -0.4001686, 1.421424, 1, 0, 0.454902, 1,
1.395837, 0.515256, 1.720451, 1, 0, 0.4509804, 1,
1.407459, 0.2604849, 0.460475, 1, 0, 0.4431373, 1,
1.412592, 1.693461, 0.2391028, 1, 0, 0.4392157, 1,
1.416877, 0.6733151, 0.7623159, 1, 0, 0.4313726, 1,
1.425645, -0.3488629, 3.264247, 1, 0, 0.427451, 1,
1.433571, -1.961601, 0.8105624, 1, 0, 0.4196078, 1,
1.443395, 0.3573934, 0.2838325, 1, 0, 0.4156863, 1,
1.459764, -0.1868393, 1.632004, 1, 0, 0.4078431, 1,
1.460365, 0.1941063, 0.9483188, 1, 0, 0.4039216, 1,
1.461746, 1.186948, -0.3737291, 1, 0, 0.3960784, 1,
1.462973, -0.1203469, 1.463534, 1, 0, 0.3882353, 1,
1.463934, -1.970571, 1.245937, 1, 0, 0.3843137, 1,
1.466278, 1.708211, 0.2645146, 1, 0, 0.3764706, 1,
1.477337, 0.5036511, 2.185966, 1, 0, 0.372549, 1,
1.489696, -0.3449983, 1.942651, 1, 0, 0.3647059, 1,
1.496197, -0.1970517, 0.6487713, 1, 0, 0.3607843, 1,
1.504211, -0.5547786, 2.528734, 1, 0, 0.3529412, 1,
1.529516, -0.5548781, 1.56137, 1, 0, 0.3490196, 1,
1.534414, -0.4826125, 3.612826, 1, 0, 0.3411765, 1,
1.543173, -1.299604, 2.442772, 1, 0, 0.3372549, 1,
1.543232, -0.1347039, 2.8871, 1, 0, 0.3294118, 1,
1.547513, -0.07201373, 0.1612197, 1, 0, 0.3254902, 1,
1.553764, -1.923083, 3.379323, 1, 0, 0.3176471, 1,
1.55466, 1.079681, 0.4224171, 1, 0, 0.3137255, 1,
1.560096, 0.5900578, 1.842048, 1, 0, 0.3058824, 1,
1.577262, -0.89263, 0.5496946, 1, 0, 0.2980392, 1,
1.588447, -0.5381714, 0.2459822, 1, 0, 0.2941177, 1,
1.600305, -1.945196, 4.819438, 1, 0, 0.2862745, 1,
1.601631, -1.513651, 1.718311, 1, 0, 0.282353, 1,
1.634607, 0.4412537, 0.9800128, 1, 0, 0.2745098, 1,
1.639122, -1.828181, 2.096079, 1, 0, 0.2705882, 1,
1.655402, 0.08193516, 0.1928011, 1, 0, 0.2627451, 1,
1.657105, -0.1123194, 1.81693, 1, 0, 0.2588235, 1,
1.669626, 0.1042424, 2.53303, 1, 0, 0.2509804, 1,
1.670019, -0.8186196, 1.625655, 1, 0, 0.2470588, 1,
1.685275, -0.1292176, 2.71613, 1, 0, 0.2392157, 1,
1.731618, -0.3174913, -0.09468027, 1, 0, 0.2352941, 1,
1.747125, 0.212394, 2.058449, 1, 0, 0.227451, 1,
1.784843, 0.7679581, 1.92015, 1, 0, 0.2235294, 1,
1.821687, 0.7560499, 1.9168, 1, 0, 0.2156863, 1,
1.825591, -1.602142, 2.525502, 1, 0, 0.2117647, 1,
1.84289, 0.6671277, 0.373013, 1, 0, 0.2039216, 1,
1.845533, -0.5377509, 1.01303, 1, 0, 0.1960784, 1,
1.867543, 0.04954784, 2.319891, 1, 0, 0.1921569, 1,
1.873702, -0.8076572, 2.238051, 1, 0, 0.1843137, 1,
1.877042, 1.566793, -0.03630989, 1, 0, 0.1803922, 1,
1.943367, -1.40863, 3.033835, 1, 0, 0.172549, 1,
1.960636, 1.211846, 1.072423, 1, 0, 0.1686275, 1,
1.963028, 0.9674555, 0.7117844, 1, 0, 0.1607843, 1,
1.963607, -1.729613, 3.494071, 1, 0, 0.1568628, 1,
2.00728, 0.0436935, 1.674295, 1, 0, 0.1490196, 1,
2.051906, -0.7357509, 2.097956, 1, 0, 0.145098, 1,
2.060697, -1.517756, 3.605009, 1, 0, 0.1372549, 1,
2.069454, -0.5959159, 3.262974, 1, 0, 0.1333333, 1,
2.144567, 0.7434389, 1.656413, 1, 0, 0.1254902, 1,
2.147842, -1.363032, 2.143612, 1, 0, 0.1215686, 1,
2.203989, -0.3987914, 1.519116, 1, 0, 0.1137255, 1,
2.213661, 1.906633, -0.8624645, 1, 0, 0.1098039, 1,
2.21933, -0.6136878, 0.8411748, 1, 0, 0.1019608, 1,
2.224481, -0.04230059, 0.08158129, 1, 0, 0.09411765, 1,
2.26669, -2.106109, 2.801773, 1, 0, 0.09019608, 1,
2.298856, -1.217133, 4.347369, 1, 0, 0.08235294, 1,
2.317612, 2.482739, -0.6517816, 1, 0, 0.07843138, 1,
2.331587, 0.6606789, 1.527386, 1, 0, 0.07058824, 1,
2.361697, -1.555304, 1.254965, 1, 0, 0.06666667, 1,
2.364218, -2.937702, 2.126547, 1, 0, 0.05882353, 1,
2.364438, 0.1410664, 1.476607, 1, 0, 0.05490196, 1,
2.461766, 0.15865, -0.1722776, 1, 0, 0.04705882, 1,
2.517589, -3.096939, 1.476673, 1, 0, 0.04313726, 1,
2.629256, -0.3046001, 2.257276, 1, 0, 0.03529412, 1,
2.650164, 0.9042512, -0.04615186, 1, 0, 0.03137255, 1,
2.683505, 0.03816441, 2.496308, 1, 0, 0.02352941, 1,
2.701485, 0.7346461, -0.01894762, 1, 0, 0.01960784, 1,
2.822057, -0.4322575, 2.508059, 1, 0, 0.01176471, 1,
3.575811, -1.138411, 0.2987645, 1, 0, 0.007843138, 1
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
0.2762036, -4.542243, -7.074513, 0, -0.5, 0.5, 0.5,
0.2762036, -4.542243, -7.074513, 1, -0.5, 0.5, 0.5,
0.2762036, -4.542243, -7.074513, 1, 1.5, 0.5, 0.5,
0.2762036, -4.542243, -7.074513, 0, 1.5, 0.5, 0.5
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
-4.141971, -0.04057431, -7.074513, 0, -0.5, 0.5, 0.5,
-4.141971, -0.04057431, -7.074513, 1, -0.5, 0.5, 0.5,
-4.141971, -0.04057431, -7.074513, 1, 1.5, 0.5, 0.5,
-4.141971, -0.04057431, -7.074513, 0, 1.5, 0.5, 0.5
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
-4.141971, -4.542243, -0.2656205, 0, -0.5, 0.5, 0.5,
-4.141971, -4.542243, -0.2656205, 1, -0.5, 0.5, 0.5,
-4.141971, -4.542243, -0.2656205, 1, 1.5, 0.5, 0.5,
-4.141971, -4.542243, -0.2656205, 0, 1.5, 0.5, 0.5
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
-3, -3.503397, -5.50323,
3, -3.503397, -5.50323,
-3, -3.503397, -5.50323,
-3, -3.676538, -5.76511,
-2, -3.503397, -5.50323,
-2, -3.676538, -5.76511,
-1, -3.503397, -5.50323,
-1, -3.676538, -5.76511,
0, -3.503397, -5.50323,
0, -3.676538, -5.76511,
1, -3.503397, -5.50323,
1, -3.676538, -5.76511,
2, -3.503397, -5.50323,
2, -3.676538, -5.76511,
3, -3.503397, -5.50323,
3, -3.676538, -5.76511
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
-3, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
-3, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
-3, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
-3, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
-2, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
-2, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
-2, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
-2, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
-1, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
-1, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
-1, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
-1, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
0, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
0, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
0, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
0, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
1, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
1, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
1, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
1, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
2, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
2, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
2, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
2, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5,
3, -4.02282, -6.288872, 0, -0.5, 0.5, 0.5,
3, -4.02282, -6.288872, 1, -0.5, 0.5, 0.5,
3, -4.02282, -6.288872, 1, 1.5, 0.5, 0.5,
3, -4.02282, -6.288872, 0, 1.5, 0.5, 0.5
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
-3.122392, -3, -5.50323,
-3.122392, 3, -5.50323,
-3.122392, -3, -5.50323,
-3.292322, -3, -5.76511,
-3.122392, -2, -5.50323,
-3.292322, -2, -5.76511,
-3.122392, -1, -5.50323,
-3.292322, -1, -5.76511,
-3.122392, 0, -5.50323,
-3.292322, 0, -5.76511,
-3.122392, 1, -5.50323,
-3.292322, 1, -5.76511,
-3.122392, 2, -5.50323,
-3.292322, 2, -5.76511,
-3.122392, 3, -5.50323,
-3.292322, 3, -5.76511
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
-3.632181, -3, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, -3, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, -3, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, -3, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, -2, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, -2, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, -2, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, -2, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, -1, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, -1, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, -1, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, -1, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, 0, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, 0, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, 0, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, 0, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, 1, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, 1, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, 1, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, 1, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, 2, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, 2, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, 2, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, 2, -6.288872, 0, 1.5, 0.5, 0.5,
-3.632181, 3, -6.288872, 0, -0.5, 0.5, 0.5,
-3.632181, 3, -6.288872, 1, -0.5, 0.5, 0.5,
-3.632181, 3, -6.288872, 1, 1.5, 0.5, 0.5,
-3.632181, 3, -6.288872, 0, 1.5, 0.5, 0.5
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
-3.122392, -3.503397, -4,
-3.122392, -3.503397, 4,
-3.122392, -3.503397, -4,
-3.292322, -3.676538, -4,
-3.122392, -3.503397, -2,
-3.292322, -3.676538, -2,
-3.122392, -3.503397, 0,
-3.292322, -3.676538, 0,
-3.122392, -3.503397, 2,
-3.292322, -3.676538, 2,
-3.122392, -3.503397, 4,
-3.292322, -3.676538, 4
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
-3.632181, -4.02282, -4, 0, -0.5, 0.5, 0.5,
-3.632181, -4.02282, -4, 1, -0.5, 0.5, 0.5,
-3.632181, -4.02282, -4, 1, 1.5, 0.5, 0.5,
-3.632181, -4.02282, -4, 0, 1.5, 0.5, 0.5,
-3.632181, -4.02282, -2, 0, -0.5, 0.5, 0.5,
-3.632181, -4.02282, -2, 1, -0.5, 0.5, 0.5,
-3.632181, -4.02282, -2, 1, 1.5, 0.5, 0.5,
-3.632181, -4.02282, -2, 0, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 0, 0, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 0, 1, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 0, 1, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 0, 0, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 2, 0, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 2, 1, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 2, 1, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 2, 0, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 4, 0, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 4, 1, -0.5, 0.5, 0.5,
-3.632181, -4.02282, 4, 1, 1.5, 0.5, 0.5,
-3.632181, -4.02282, 4, 0, 1.5, 0.5, 0.5
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
-3.122392, -3.503397, -5.50323,
-3.122392, 3.422248, -5.50323,
-3.122392, -3.503397, 4.971989,
-3.122392, 3.422248, 4.971989,
-3.122392, -3.503397, -5.50323,
-3.122392, -3.503397, 4.971989,
-3.122392, 3.422248, -5.50323,
-3.122392, 3.422248, 4.971989,
-3.122392, -3.503397, -5.50323,
3.674799, -3.503397, -5.50323,
-3.122392, -3.503397, 4.971989,
3.674799, -3.503397, 4.971989,
-3.122392, 3.422248, -5.50323,
3.674799, 3.422248, -5.50323,
-3.122392, 3.422248, 4.971989,
3.674799, 3.422248, 4.971989,
3.674799, -3.503397, -5.50323,
3.674799, 3.422248, -5.50323,
3.674799, -3.503397, 4.971989,
3.674799, 3.422248, 4.971989,
3.674799, -3.503397, -5.50323,
3.674799, -3.503397, 4.971989,
3.674799, 3.422248, -5.50323,
3.674799, 3.422248, 4.971989
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
var radius = 7.624835;
var distance = 33.92375;
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
mvMatrix.translate( -0.2762036, 0.04057431, 0.2656205 );
mvMatrix.scale( 1.212872, 1.190376, 0.7870117 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.92375);
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
Amide<-read.table("Amide.xyz")
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
-3.023404, -0.2237498, -1.940778, 0, 0, 1, 1, 1,
-2.689278, 0.4339613, -0.6273272, 1, 0, 0, 1, 1,
-2.676458, -0.3390908, -1.58223, 1, 0, 0, 1, 1,
-2.615749, -0.3003719, -0.3737369, 1, 0, 0, 1, 1,
-2.549055, -1.155273, -1.98067, 1, 0, 0, 1, 1,
-2.533108, -0.6838261, -1.773323, 1, 0, 0, 1, 1,
-2.505312, 0.3230681, -0.3967123, 0, 0, 0, 1, 1,
-2.505068, -1.96221, -1.940863, 0, 0, 0, 1, 1,
-2.379279, -2.194294, -2.523851, 0, 0, 0, 1, 1,
-2.356025, 0.2917919, -1.393384, 0, 0, 0, 1, 1,
-2.322862, -0.074967, -2.475652, 0, 0, 0, 1, 1,
-2.321066, -0.4700058, -1.842494, 0, 0, 0, 1, 1,
-2.277677, 1.355129, -0.8081482, 0, 0, 0, 1, 1,
-2.277495, 1.282671, -1.358103, 1, 1, 1, 1, 1,
-2.271112, 0.7757673, -1.565658, 1, 1, 1, 1, 1,
-2.172146, -1.176113, -0.2081177, 1, 1, 1, 1, 1,
-2.153832, -1.222801, -2.430151, 1, 1, 1, 1, 1,
-2.145406, 0.7023141, -0.8477015, 1, 1, 1, 1, 1,
-2.123641, 0.7204722, -0.667591, 1, 1, 1, 1, 1,
-2.11206, -0.01671812, -1.00607, 1, 1, 1, 1, 1,
-2.083961, -1.339903, -4.40055, 1, 1, 1, 1, 1,
-2.056452, 1.063661, -1.228673, 1, 1, 1, 1, 1,
-2.055357, -0.2465148, -1.728603, 1, 1, 1, 1, 1,
-2.051429, -1.796443, -2.913694, 1, 1, 1, 1, 1,
-2.014491, -0.4397927, -2.997374, 1, 1, 1, 1, 1,
-1.955371, -0.6958806, -0.9719462, 1, 1, 1, 1, 1,
-1.936903, 1.338228, -0.1579014, 1, 1, 1, 1, 1,
-1.91732, -1.467601, -4.030254, 1, 1, 1, 1, 1,
-1.851961, -0.1965232, -3.331971, 0, 0, 1, 1, 1,
-1.841864, -1.901551, -1.548928, 1, 0, 0, 1, 1,
-1.836054, 1.833549, -1.429976, 1, 0, 0, 1, 1,
-1.803178, 1.519936, 0.2472367, 1, 0, 0, 1, 1,
-1.798542, 2.363708, -1.583081, 1, 0, 0, 1, 1,
-1.785326, -0.1018636, -2.749977, 1, 0, 0, 1, 1,
-1.78433, 0.004565139, -1.623587, 0, 0, 0, 1, 1,
-1.767886, 0.4910765, -2.142171, 0, 0, 0, 1, 1,
-1.751482, -0.5407885, -0.6943271, 0, 0, 0, 1, 1,
-1.747156, -0.4314501, -0.4287319, 0, 0, 0, 1, 1,
-1.745426, -0.1474196, -1.48057, 0, 0, 0, 1, 1,
-1.74538, 1.429133, -1.054744, 0, 0, 0, 1, 1,
-1.730165, -0.7259357, -4.779047, 0, 0, 0, 1, 1,
-1.721424, -3.402538, -2.756489, 1, 1, 1, 1, 1,
-1.687739, -0.564747, -2.714932, 1, 1, 1, 1, 1,
-1.681391, -0.04877717, -2.398383, 1, 1, 1, 1, 1,
-1.677786, 0.2653927, -0.07210793, 1, 1, 1, 1, 1,
-1.664995, -1.023391, -2.671547, 1, 1, 1, 1, 1,
-1.656989, -0.4275128, -0.4036845, 1, 1, 1, 1, 1,
-1.651807, -0.7942691, -3.368683, 1, 1, 1, 1, 1,
-1.642991, 0.1628994, 0.3901663, 1, 1, 1, 1, 1,
-1.629297, -0.07030089, -0.9804917, 1, 1, 1, 1, 1,
-1.628666, 0.4973845, -0.971121, 1, 1, 1, 1, 1,
-1.612143, -1.740527, -0.5015894, 1, 1, 1, 1, 1,
-1.60997, -1.430686, -1.346454, 1, 1, 1, 1, 1,
-1.591611, 0.3755923, 0.5152255, 1, 1, 1, 1, 1,
-1.589775, -0.3014562, -1.101451, 1, 1, 1, 1, 1,
-1.586614, 0.9491326, -2.065189, 1, 1, 1, 1, 1,
-1.585776, 1.53526, -0.7347518, 0, 0, 1, 1, 1,
-1.584234, 1.224072, -1.483339, 1, 0, 0, 1, 1,
-1.570357, -0.608784, -1.485288, 1, 0, 0, 1, 1,
-1.56963, -0.9911146, -0.6666584, 1, 0, 0, 1, 1,
-1.548395, 0.6627818, -2.862628, 1, 0, 0, 1, 1,
-1.54117, 0.9653328, -0.5880162, 1, 0, 0, 1, 1,
-1.529387, -2.272198, -1.58271, 0, 0, 0, 1, 1,
-1.503113, -0.5742938, -3.354085, 0, 0, 0, 1, 1,
-1.500897, 0.5669266, 0.1208322, 0, 0, 0, 1, 1,
-1.489137, -0.9234336, -1.648875, 0, 0, 0, 1, 1,
-1.483191, 0.2571198, -1.32849, 0, 0, 0, 1, 1,
-1.481869, 2.304323, 0.001215877, 0, 0, 0, 1, 1,
-1.469364, -0.4687431, -1.417382, 0, 0, 0, 1, 1,
-1.469203, -0.5970612, -3.289869, 1, 1, 1, 1, 1,
-1.468496, 0.49832, -0.6040229, 1, 1, 1, 1, 1,
-1.458194, -1.498785, -0.5953054, 1, 1, 1, 1, 1,
-1.446852, 1.37197, -1.509833, 1, 1, 1, 1, 1,
-1.443363, 0.9606373, -1.699136, 1, 1, 1, 1, 1,
-1.442915, 0.4452965, -2.162099, 1, 1, 1, 1, 1,
-1.438754, -0.0360568, -1.961903, 1, 1, 1, 1, 1,
-1.435266, -0.939734, -4.150954, 1, 1, 1, 1, 1,
-1.43109, 1.147154, -1.294366, 1, 1, 1, 1, 1,
-1.428834, 0.716359, -0.441154, 1, 1, 1, 1, 1,
-1.423921, -0.02690905, -1.894897, 1, 1, 1, 1, 1,
-1.420705, -0.6777641, -1.645328, 1, 1, 1, 1, 1,
-1.418916, -1.572412, -3.989278, 1, 1, 1, 1, 1,
-1.417811, -1.809001, -2.397674, 1, 1, 1, 1, 1,
-1.406869, -0.6804585, -2.441535, 1, 1, 1, 1, 1,
-1.401842, 0.491579, -4.144217, 0, 0, 1, 1, 1,
-1.398665, 1.147564, -1.34753, 1, 0, 0, 1, 1,
-1.395992, 0.3590032, -1.108906, 1, 0, 0, 1, 1,
-1.391622, -0.942712, -0.4506057, 1, 0, 0, 1, 1,
-1.3871, 1.32102, -1.8007, 1, 0, 0, 1, 1,
-1.380145, 0.01468056, 0.1805598, 1, 0, 0, 1, 1,
-1.379797, 1.142543, 0.3550317, 0, 0, 0, 1, 1,
-1.376468, -0.3780338, -4.957451, 0, 0, 0, 1, 1,
-1.357008, 0.747851, -1.524034, 0, 0, 0, 1, 1,
-1.352004, 0.07826939, -0.7530137, 0, 0, 0, 1, 1,
-1.350283, 1.418886, -0.4844638, 0, 0, 0, 1, 1,
-1.349814, 3.251331, -0.8667098, 0, 0, 0, 1, 1,
-1.32612, -0.754617, -2.507128, 0, 0, 0, 1, 1,
-1.306617, 0.6371062, -0.8056589, 1, 1, 1, 1, 1,
-1.303109, -0.3460653, -2.438214, 1, 1, 1, 1, 1,
-1.301984, -1.401442, -1.665885, 1, 1, 1, 1, 1,
-1.300113, 0.572102, -1.19002, 1, 1, 1, 1, 1,
-1.280293, -0.7230726, -2.47952, 1, 1, 1, 1, 1,
-1.266148, 1.383559, -1.189073, 1, 1, 1, 1, 1,
-1.243736, 0.8888522, -0.3179162, 1, 1, 1, 1, 1,
-1.240066, 0.9462932, -1.8568, 1, 1, 1, 1, 1,
-1.235102, -0.2195028, -2.060428, 1, 1, 1, 1, 1,
-1.217629, -2.098585, -3.50385, 1, 1, 1, 1, 1,
-1.215829, -0.8118792, -1.958023, 1, 1, 1, 1, 1,
-1.211068, -0.1969185, -0.7660048, 1, 1, 1, 1, 1,
-1.210107, 1.322019, -0.6359739, 1, 1, 1, 1, 1,
-1.205027, -0.4799592, -1.68033, 1, 1, 1, 1, 1,
-1.203501, -1.262065, -2.728589, 1, 1, 1, 1, 1,
-1.194548, -1.470359, -2.488162, 0, 0, 1, 1, 1,
-1.190773, 0.8108867, 0.1217286, 1, 0, 0, 1, 1,
-1.188528, 0.5343712, -0.8178228, 1, 0, 0, 1, 1,
-1.180625, -0.614758, -2.406331, 1, 0, 0, 1, 1,
-1.17163, -0.9490958, -2.184529, 1, 0, 0, 1, 1,
-1.162976, -0.4884546, -1.810104, 1, 0, 0, 1, 1,
-1.160821, -1.041862, -2.254722, 0, 0, 0, 1, 1,
-1.160009, -0.7125503, -1.607758, 0, 0, 0, 1, 1,
-1.159065, -0.3239686, -2.141753, 0, 0, 0, 1, 1,
-1.145825, -0.9644296, -2.09051, 0, 0, 0, 1, 1,
-1.145487, 0.006534822, -3.086915, 0, 0, 0, 1, 1,
-1.134296, 1.503, 1.343658, 0, 0, 0, 1, 1,
-1.131451, -0.422317, -2.792694, 0, 0, 0, 1, 1,
-1.127235, 0.7056876, 0.9588621, 1, 1, 1, 1, 1,
-1.115601, 1.254745, -1.456841, 1, 1, 1, 1, 1,
-1.10462, -1.307763, -2.167877, 1, 1, 1, 1, 1,
-1.101359, -0.0576374, -1.532673, 1, 1, 1, 1, 1,
-1.082111, 1.460826, -3.363519, 1, 1, 1, 1, 1,
-1.080888, -0.443287, -3.00564, 1, 1, 1, 1, 1,
-1.079036, -1.526717, -2.519041, 1, 1, 1, 1, 1,
-1.07793, 0.2635198, -1.663849, 1, 1, 1, 1, 1,
-1.075309, 0.7941492, -0.8548416, 1, 1, 1, 1, 1,
-1.072344, 0.8429542, -1.587438, 1, 1, 1, 1, 1,
-1.070148, 0.7355304, -1.702881, 1, 1, 1, 1, 1,
-1.056738, -0.5969835, -2.621539, 1, 1, 1, 1, 1,
-1.055587, -0.01567316, 0.1561748, 1, 1, 1, 1, 1,
-1.05258, 0.9429716, 0.118366, 1, 1, 1, 1, 1,
-1.04351, 0.3020803, -1.877785, 1, 1, 1, 1, 1,
-1.040531, 0.9175425, -0.5304324, 0, 0, 1, 1, 1,
-1.039449, -0.8373545, -2.804991, 1, 0, 0, 1, 1,
-1.037435, 0.4061548, -2.729344, 1, 0, 0, 1, 1,
-1.029991, 0.4472114, -0.8962359, 1, 0, 0, 1, 1,
-1.028461, 0.09116827, -1.170756, 1, 0, 0, 1, 1,
-1.027062, -0.4061343, -2.360776, 1, 0, 0, 1, 1,
-1.026244, -0.7025694, -1.511933, 0, 0, 0, 1, 1,
-1.025169, 0.287134, -1.818267, 0, 0, 0, 1, 1,
-1.020126, -1.381084, -3.834297, 0, 0, 0, 1, 1,
-1.01439, 1.685247, -0.1828543, 0, 0, 0, 1, 1,
-0.998381, 0.8955718, -2.966986, 0, 0, 0, 1, 1,
-0.9957224, -0.627773, -0.08301419, 0, 0, 0, 1, 1,
-0.9923952, -0.6197127, -1.015127, 0, 0, 0, 1, 1,
-0.9888397, 1.060423, -2.270587, 1, 1, 1, 1, 1,
-0.9878246, 1.148741, -3.225922, 1, 1, 1, 1, 1,
-0.9837647, -0.7797712, -1.172568, 1, 1, 1, 1, 1,
-0.982983, -0.2085332, -3.908715, 1, 1, 1, 1, 1,
-0.9803736, -0.08567254, -2.334696, 1, 1, 1, 1, 1,
-0.9797637, 0.9484911, -2.410279, 1, 1, 1, 1, 1,
-0.9688324, -1.497395, -3.620958, 1, 1, 1, 1, 1,
-0.9675799, -0.3396914, -2.964186, 1, 1, 1, 1, 1,
-0.9658449, 0.7678148, -1.933452, 1, 1, 1, 1, 1,
-0.9619504, -0.3576805, -0.3706046, 1, 1, 1, 1, 1,
-0.9564403, 1.183242, -0.2285318, 1, 1, 1, 1, 1,
-0.9563757, -1.936137, -3.605848, 1, 1, 1, 1, 1,
-0.95535, -0.06208574, -1.0766, 1, 1, 1, 1, 1,
-0.9504466, -0.2535398, -2.320236, 1, 1, 1, 1, 1,
-0.9499608, 1.04868, -0.4069861, 1, 1, 1, 1, 1,
-0.9497222, 0.266083, -1.883819, 0, 0, 1, 1, 1,
-0.9444343, 0.35966, -2.108922, 1, 0, 0, 1, 1,
-0.9384189, -0.4364291, -0.1091506, 1, 0, 0, 1, 1,
-0.9375144, -0.4132985, -3.154395, 1, 0, 0, 1, 1,
-0.9367534, -0.5199619, -0.1771463, 1, 0, 0, 1, 1,
-0.9354854, 0.7743647, -2.212296, 1, 0, 0, 1, 1,
-0.9258885, -0.406299, -1.253309, 0, 0, 0, 1, 1,
-0.9254119, -0.9103682, -3.329426, 0, 0, 0, 1, 1,
-0.9200586, -0.0719342, -3.315911, 0, 0, 0, 1, 1,
-0.9187967, -0.7767575, -0.746096, 0, 0, 0, 1, 1,
-0.9169075, 0.6171322, -0.5155998, 0, 0, 0, 1, 1,
-0.9168542, 0.5428519, -1.16975, 0, 0, 0, 1, 1,
-0.9102995, 0.05493887, -1.028121, 0, 0, 0, 1, 1,
-0.9032602, -0.0292372, -3.084239, 1, 1, 1, 1, 1,
-0.900362, -1.909825, -1.167248, 1, 1, 1, 1, 1,
-0.8959714, -1.134409, -3.288452, 1, 1, 1, 1, 1,
-0.8869435, 0.1208911, -2.438062, 1, 1, 1, 1, 1,
-0.8815104, -1.157105, -1.31697, 1, 1, 1, 1, 1,
-0.8765808, -1.29654, -2.964176, 1, 1, 1, 1, 1,
-0.8755862, -1.198061, -1.981733, 1, 1, 1, 1, 1,
-0.8717375, -0.7183795, -1.328689, 1, 1, 1, 1, 1,
-0.8707432, 1.824586, 0.3899699, 1, 1, 1, 1, 1,
-0.8494982, -1.196722, -2.361341, 1, 1, 1, 1, 1,
-0.8468231, 0.2901422, -0.3356793, 1, 1, 1, 1, 1,
-0.8466663, 0.7726789, 0.2391445, 1, 1, 1, 1, 1,
-0.8394989, 1.016974, 1.807586, 1, 1, 1, 1, 1,
-0.8389827, -0.567211, -2.583072, 1, 1, 1, 1, 1,
-0.8379555, 0.1119376, -2.509222, 1, 1, 1, 1, 1,
-0.8342612, 0.1243045, -2.356159, 0, 0, 1, 1, 1,
-0.8255577, 2.35687, -0.2468991, 1, 0, 0, 1, 1,
-0.8243266, -1.153138, -1.557886, 1, 0, 0, 1, 1,
-0.8119429, 0.393913, -0.99321, 1, 0, 0, 1, 1,
-0.8036883, -1.765547, -2.519271, 1, 0, 0, 1, 1,
-0.8004378, -1.020919, -2.275547, 1, 0, 0, 1, 1,
-0.792382, -0.4801784, -2.408456, 0, 0, 0, 1, 1,
-0.7920818, 0.5080505, -0.6318201, 0, 0, 0, 1, 1,
-0.7899979, 0.270154, -0.8480713, 0, 0, 0, 1, 1,
-0.7803769, 0.8606932, -1.770663, 0, 0, 0, 1, 1,
-0.7777298, 1.573915, 0.6002379, 0, 0, 0, 1, 1,
-0.7764178, 1.595647, -1.038252, 0, 0, 0, 1, 1,
-0.774307, 0.6601143, -0.3826778, 0, 0, 0, 1, 1,
-0.7731321, 0.7569829, -0.7736373, 1, 1, 1, 1, 1,
-0.7646078, 1.210185, 0.8684139, 1, 1, 1, 1, 1,
-0.7624978, -0.03674047, -1.005152, 1, 1, 1, 1, 1,
-0.7560504, -1.038538, -0.672604, 1, 1, 1, 1, 1,
-0.7559311, 0.1534119, -1.109954, 1, 1, 1, 1, 1,
-0.7530399, 0.8097007, -2.07431, 1, 1, 1, 1, 1,
-0.7511397, 2.108757, -0.3979767, 1, 1, 1, 1, 1,
-0.7406717, -0.7349125, -1.43255, 1, 1, 1, 1, 1,
-0.7356791, -0.4994436, -2.293229, 1, 1, 1, 1, 1,
-0.7345775, -1.245405, -2.253723, 1, 1, 1, 1, 1,
-0.7340891, 0.2720226, -0.7305848, 1, 1, 1, 1, 1,
-0.7324869, -0.7603579, -3.113347, 1, 1, 1, 1, 1,
-0.7307118, -1.212931, -1.086689, 1, 1, 1, 1, 1,
-0.7284569, 0.402681, 0.293154, 1, 1, 1, 1, 1,
-0.728393, -1.522698, -2.368947, 1, 1, 1, 1, 1,
-0.7212121, -0.2206477, -3.608255, 0, 0, 1, 1, 1,
-0.7205233, -1.745377, -2.65968, 1, 0, 0, 1, 1,
-0.7190474, -0.5151043, -1.548872, 1, 0, 0, 1, 1,
-0.7170093, -0.4016539, -1.637838, 1, 0, 0, 1, 1,
-0.7166526, -0.3454086, 0.1207594, 1, 0, 0, 1, 1,
-0.715305, 1.986339, 0.6576141, 1, 0, 0, 1, 1,
-0.7138746, 0.6921052, 0.6256196, 0, 0, 0, 1, 1,
-0.7131426, -2.301917, -2.944576, 0, 0, 0, 1, 1,
-0.7127745, -0.394895, -2.138499, 0, 0, 0, 1, 1,
-0.7121851, 1.383869, -1.45142, 0, 0, 0, 1, 1,
-0.710314, -1.075679, -4.321247, 0, 0, 0, 1, 1,
-0.7098977, 0.2484329, -1.383456, 0, 0, 0, 1, 1,
-0.7056314, -0.05538807, -1.891101, 0, 0, 0, 1, 1,
-0.7052009, 0.3028625, 0.3677143, 1, 1, 1, 1, 1,
-0.7034521, 0.3432882, -1.578436, 1, 1, 1, 1, 1,
-0.7031591, 0.09308638, -2.328598, 1, 1, 1, 1, 1,
-0.7031249, 1.355222, -0.5547929, 1, 1, 1, 1, 1,
-0.7019038, 1.039832, -0.2812529, 1, 1, 1, 1, 1,
-0.701524, 0.3188286, 0.293744, 1, 1, 1, 1, 1,
-0.7001752, -0.8696651, -1.893638, 1, 1, 1, 1, 1,
-0.6929431, 0.3031495, -0.2953624, 1, 1, 1, 1, 1,
-0.691672, 0.2094361, -2.450495, 1, 1, 1, 1, 1,
-0.6882213, -0.8915259, -2.108396, 1, 1, 1, 1, 1,
-0.6848813, 1.229348, 0.265351, 1, 1, 1, 1, 1,
-0.6790537, -0.8119234, -2.925689, 1, 1, 1, 1, 1,
-0.6766148, -1.559647, -2.528755, 1, 1, 1, 1, 1,
-0.6753443, -0.06848735, -2.309158, 1, 1, 1, 1, 1,
-0.6736701, -0.4623236, -3.01283, 1, 1, 1, 1, 1,
-0.6706539, 0.3798878, -1.79196, 0, 0, 1, 1, 1,
-0.6699039, -0.575399, -1.474751, 1, 0, 0, 1, 1,
-0.6693576, -0.2022474, -2.786631, 1, 0, 0, 1, 1,
-0.6687142, -0.1829972, -3.023218, 1, 0, 0, 1, 1,
-0.6657836, 0.2346703, -1.735042, 1, 0, 0, 1, 1,
-0.6624008, -0.525494, -3.261217, 1, 0, 0, 1, 1,
-0.6623648, -0.6274515, -1.693711, 0, 0, 0, 1, 1,
-0.6590346, 0.7328449, -0.3447173, 0, 0, 0, 1, 1,
-0.6479955, -1.651348, -3.653837, 0, 0, 0, 1, 1,
-0.6329597, -2.152685, -4.040133, 0, 0, 0, 1, 1,
-0.6304084, -0.7960972, -3.751481, 0, 0, 0, 1, 1,
-0.6284682, 0.5256083, -0.2768749, 0, 0, 0, 1, 1,
-0.6270102, 1.861949, 0.3622889, 0, 0, 0, 1, 1,
-0.6265272, 0.5077396, -0.7860494, 1, 1, 1, 1, 1,
-0.6217475, 3.321389, 2.101593, 1, 1, 1, 1, 1,
-0.6019479, -1.781239, -1.696466, 1, 1, 1, 1, 1,
-0.6013921, 1.433774, 1.229215, 1, 1, 1, 1, 1,
-0.6009873, -1.231302, -3.451178, 1, 1, 1, 1, 1,
-0.594932, -0.5048201, -1.882628, 1, 1, 1, 1, 1,
-0.5926157, 0.2673384, 0.5513819, 1, 1, 1, 1, 1,
-0.5919973, -1.650177, -2.92161, 1, 1, 1, 1, 1,
-0.5905129, -2.42562, -1.998965, 1, 1, 1, 1, 1,
-0.5874523, -0.1511229, -2.929071, 1, 1, 1, 1, 1,
-0.5862033, 0.5135354, 0.3944906, 1, 1, 1, 1, 1,
-0.5851323, 1.294638, -0.6668122, 1, 1, 1, 1, 1,
-0.5834076, -0.03364495, -1.111686, 1, 1, 1, 1, 1,
-0.5814299, 1.462551, 0.1732183, 1, 1, 1, 1, 1,
-0.5770106, -0.9181112, -3.296314, 1, 1, 1, 1, 1,
-0.5766451, -1.408692, -3.825145, 0, 0, 1, 1, 1,
-0.575541, 1.447349, 0.4450289, 1, 0, 0, 1, 1,
-0.5745956, 0.9973626, -0.3101657, 1, 0, 0, 1, 1,
-0.5672799, -0.3966686, -4.239553, 1, 0, 0, 1, 1,
-0.5629832, -0.3726129, -1.273123, 1, 0, 0, 1, 1,
-0.5618951, -0.939855, -1.45871, 1, 0, 0, 1, 1,
-0.5608602, 0.08035214, -1.469156, 0, 0, 0, 1, 1,
-0.5502315, -1.139833, -3.473985, 0, 0, 0, 1, 1,
-0.5499914, 0.2700824, 0.01779363, 0, 0, 0, 1, 1,
-0.5480928, 0.1281028, -3.053066, 0, 0, 0, 1, 1,
-0.547661, -1.281104, -3.533784, 0, 0, 0, 1, 1,
-0.5467894, 0.1168303, -1.385358, 0, 0, 0, 1, 1,
-0.5467713, 0.06503914, -0.7182414, 0, 0, 0, 1, 1,
-0.5463611, -1.140513, -3.118079, 1, 1, 1, 1, 1,
-0.5443037, 0.8090003, -0.8567917, 1, 1, 1, 1, 1,
-0.5374047, 0.5660914, 0.3902303, 1, 1, 1, 1, 1,
-0.5335994, 1.382363, -0.5559463, 1, 1, 1, 1, 1,
-0.5308167, 0.3565316, -1.324076, 1, 1, 1, 1, 1,
-0.5276463, 0.8457133, -1.788629, 1, 1, 1, 1, 1,
-0.5261252, -0.1908074, -1.557132, 1, 1, 1, 1, 1,
-0.5224176, 0.674818, 0.5622312, 1, 1, 1, 1, 1,
-0.5219986, -0.2902862, -2.397182, 1, 1, 1, 1, 1,
-0.5218869, 1.388673, 0.284862, 1, 1, 1, 1, 1,
-0.5141543, -1.567309, -4.471535, 1, 1, 1, 1, 1,
-0.5135839, 0.5004681, -1.189035, 1, 1, 1, 1, 1,
-0.512858, -0.4741585, -3.360929, 1, 1, 1, 1, 1,
-0.5124424, -0.744837, -1.728805, 1, 1, 1, 1, 1,
-0.5089154, -1.521516, -3.843415, 1, 1, 1, 1, 1,
-0.5079746, 0.3903806, 1.175274, 0, 0, 1, 1, 1,
-0.5066715, 1.239018, -1.373484, 1, 0, 0, 1, 1,
-0.5051625, 1.203272, 0.1506766, 1, 0, 0, 1, 1,
-0.5034079, -0.615849, -2.881496, 1, 0, 0, 1, 1,
-0.5018001, 2.640111, -1.881256, 1, 0, 0, 1, 1,
-0.4985513, 0.06407929, -0.03590506, 1, 0, 0, 1, 1,
-0.4962311, 0.2719586, -0.7597405, 0, 0, 0, 1, 1,
-0.4910664, -0.3180847, -2.058715, 0, 0, 0, 1, 1,
-0.4864709, -1.486744, -2.035873, 0, 0, 0, 1, 1,
-0.4843222, 0.08912995, -2.130194, 0, 0, 0, 1, 1,
-0.4837625, 0.0247439, -2.527542, 0, 0, 0, 1, 1,
-0.4787727, -0.7897428, -2.321252, 0, 0, 0, 1, 1,
-0.4771567, 1.295676, -0.8225242, 0, 0, 0, 1, 1,
-0.4724997, 0.6754751, 0.5844072, 1, 1, 1, 1, 1,
-0.4535564, 0.9752356, -0.03589016, 1, 1, 1, 1, 1,
-0.4503503, -1.489203, -1.432677, 1, 1, 1, 1, 1,
-0.4498753, 0.1268845, -1.616573, 1, 1, 1, 1, 1,
-0.4471488, -1.216851, -1.176888, 1, 1, 1, 1, 1,
-0.4468005, 0.3837012, -0.5670878, 1, 1, 1, 1, 1,
-0.4430732, 2.135321, 0.0926353, 1, 1, 1, 1, 1,
-0.4425896, -0.5818979, -2.459615, 1, 1, 1, 1, 1,
-0.4370221, 0.3337406, -1.704507, 1, 1, 1, 1, 1,
-0.4260828, 0.2334959, -2.045276, 1, 1, 1, 1, 1,
-0.4252277, 0.6143455, 0.6100499, 1, 1, 1, 1, 1,
-0.4195137, 1.126369, -0.1215369, 1, 1, 1, 1, 1,
-0.4176015, 0.4104872, -1.507217, 1, 1, 1, 1, 1,
-0.4147947, -0.6897057, -3.046356, 1, 1, 1, 1, 1,
-0.4136125, -1.243211, -2.601477, 1, 1, 1, 1, 1,
-0.4126557, 0.4051386, -1.022118, 0, 0, 1, 1, 1,
-0.4108074, 1.671898, -0.8195457, 1, 0, 0, 1, 1,
-0.4073127, 0.8973407, -0.3993044, 1, 0, 0, 1, 1,
-0.4060667, 0.6866506, 1.453499, 1, 0, 0, 1, 1,
-0.4047058, -1.253501, -4.263657, 1, 0, 0, 1, 1,
-0.4006444, -0.6780404, -1.65177, 1, 0, 0, 1, 1,
-0.400643, 1.166785, 0.5768015, 0, 0, 0, 1, 1,
-0.3986157, 0.6834072, -1.600128, 0, 0, 0, 1, 1,
-0.3965318, 0.8112844, -0.4835563, 0, 0, 0, 1, 1,
-0.3932119, 0.6394506, 0.03591336, 0, 0, 0, 1, 1,
-0.3883269, -0.6694634, -3.317268, 0, 0, 0, 1, 1,
-0.3861505, -0.2728637, -1.512847, 0, 0, 0, 1, 1,
-0.3860172, -0.6670783, -1.74444, 0, 0, 0, 1, 1,
-0.3819431, 0.3519048, -1.087416, 1, 1, 1, 1, 1,
-0.3799989, 1.509556, 0.856665, 1, 1, 1, 1, 1,
-0.3732263, 1.126256, -0.6520285, 1, 1, 1, 1, 1,
-0.3712057, 0.8501037, 0.812861, 1, 1, 1, 1, 1,
-0.3701003, 1.778586, -0.6471462, 1, 1, 1, 1, 1,
-0.3663185, 0.4635605, -0.4993823, 1, 1, 1, 1, 1,
-0.3641974, 1.689369, 0.2457722, 1, 1, 1, 1, 1,
-0.3640726, 0.3482324, -0.04572248, 1, 1, 1, 1, 1,
-0.3624164, -0.9245718, -4.660737, 1, 1, 1, 1, 1,
-0.3611896, 1.352747, -0.6799918, 1, 1, 1, 1, 1,
-0.3597755, -0.08083459, -1.077309, 1, 1, 1, 1, 1,
-0.3555366, 0.3886483, -0.9652915, 1, 1, 1, 1, 1,
-0.3490386, -0.4795306, -2.267042, 1, 1, 1, 1, 1,
-0.3490022, -0.7776352, -2.065135, 1, 1, 1, 1, 1,
-0.3474286, -0.5963252, -1.364408, 1, 1, 1, 1, 1,
-0.3430676, 0.7968568, -1.953755, 0, 0, 1, 1, 1,
-0.3398545, -1.169914, -2.997954, 1, 0, 0, 1, 1,
-0.3277353, 0.5584635, -0.6461068, 1, 0, 0, 1, 1,
-0.3253269, 0.7102841, -0.9622781, 1, 0, 0, 1, 1,
-0.323837, -0.8839157, -2.169405, 1, 0, 0, 1, 1,
-0.3172319, -0.1310502, -0.8165326, 1, 0, 0, 1, 1,
-0.3136453, -1.329024, -4.400564, 0, 0, 0, 1, 1,
-0.3093586, 0.283175, -0.3027966, 0, 0, 0, 1, 1,
-0.3087337, -0.6967863, -2.751066, 0, 0, 0, 1, 1,
-0.3075588, -0.04235224, -1.114259, 0, 0, 0, 1, 1,
-0.3068023, -0.3236117, -2.458437, 0, 0, 0, 1, 1,
-0.3016958, -1.186686, -3.723056, 0, 0, 0, 1, 1,
-0.2970796, 0.148161, -0.09223936, 0, 0, 0, 1, 1,
-0.2940466, -0.7591985, -2.494975, 1, 1, 1, 1, 1,
-0.2914512, -0.1956538, -1.62219, 1, 1, 1, 1, 1,
-0.2873318, -0.4099442, -1.29405, 1, 1, 1, 1, 1,
-0.2873016, 0.6084941, -2.575789, 1, 1, 1, 1, 1,
-0.2865134, -0.2874505, -3.419721, 1, 1, 1, 1, 1,
-0.2790636, 0.07906681, -2.490476, 1, 1, 1, 1, 1,
-0.2767998, -0.913621, -2.932456, 1, 1, 1, 1, 1,
-0.2763456, 1.175305, 0.78319, 1, 1, 1, 1, 1,
-0.2760364, -1.25471, -0.3438606, 1, 1, 1, 1, 1,
-0.2758247, 0.2978593, -0.7745194, 1, 1, 1, 1, 1,
-0.2722354, 0.3875819, -0.4737237, 1, 1, 1, 1, 1,
-0.2711687, 0.5904399, 0.541041, 1, 1, 1, 1, 1,
-0.270911, 0.9965445, 0.7722785, 1, 1, 1, 1, 1,
-0.2706823, 1.241374, -0.9615136, 1, 1, 1, 1, 1,
-0.2669497, 2.168188, 0.8276266, 1, 1, 1, 1, 1,
-0.2591312, -0.4793652, -3.632497, 0, 0, 1, 1, 1,
-0.258947, -0.0534017, -2.901124, 1, 0, 0, 1, 1,
-0.2533992, -1.102957, -4.944195, 1, 0, 0, 1, 1,
-0.2447499, 0.4899787, -0.6625152, 1, 0, 0, 1, 1,
-0.2442526, -0.2526518, -2.390421, 1, 0, 0, 1, 1,
-0.2436159, -0.1570716, -2.273754, 1, 0, 0, 1, 1,
-0.2429799, 1.336924, -1.188197, 0, 0, 0, 1, 1,
-0.2424322, -2.470532, -1.885568, 0, 0, 0, 1, 1,
-0.2420798, 0.6304381, 1.930093, 0, 0, 0, 1, 1,
-0.2400916, 0.558739, -0.730968, 0, 0, 0, 1, 1,
-0.2372639, -0.3855149, -3.077633, 0, 0, 0, 1, 1,
-0.2366539, 0.9083608, -1.104099, 0, 0, 0, 1, 1,
-0.2297527, -0.07679077, -1.626094, 0, 0, 0, 1, 1,
-0.2285391, -1.129522, -4.178609, 1, 1, 1, 1, 1,
-0.2238063, -1.20719, -3.101482, 1, 1, 1, 1, 1,
-0.2227667, -0.3048064, -2.397167, 1, 1, 1, 1, 1,
-0.2218046, 0.4363373, -1.692034, 1, 1, 1, 1, 1,
-0.2155415, -0.1459586, -2.246057, 1, 1, 1, 1, 1,
-0.214359, 0.1529486, -2.034742, 1, 1, 1, 1, 1,
-0.2139506, 0.7243454, -0.4979665, 1, 1, 1, 1, 1,
-0.2044492, -0.4978724, -4.897104, 1, 1, 1, 1, 1,
-0.2017138, 0.8618461, -0.08947785, 1, 1, 1, 1, 1,
-0.2010678, 0.5068781, -1.0256, 1, 1, 1, 1, 1,
-0.1995191, -0.352582, -4.730677, 1, 1, 1, 1, 1,
-0.1947241, 1.159792, 1.09147, 1, 1, 1, 1, 1,
-0.1934917, 1.558159, 1.131615, 1, 1, 1, 1, 1,
-0.1934783, 1.021906, 1.173487, 1, 1, 1, 1, 1,
-0.1929968, -0.3185067, -3.589691, 1, 1, 1, 1, 1,
-0.186696, -0.4229854, -2.099627, 0, 0, 1, 1, 1,
-0.1862729, -0.8843685, -3.700559, 1, 0, 0, 1, 1,
-0.1856333, -0.4091889, -1.805123, 1, 0, 0, 1, 1,
-0.1850779, -0.1928013, -2.159733, 1, 0, 0, 1, 1,
-0.1835286, 0.773126, 0.3933071, 1, 0, 0, 1, 1,
-0.1791568, -2.263844, -3.058717, 1, 0, 0, 1, 1,
-0.1783608, -0.08686034, -0.9402207, 0, 0, 0, 1, 1,
-0.1747501, 1.390406, -0.1416219, 0, 0, 0, 1, 1,
-0.1695878, -1.248978, -4.288622, 0, 0, 0, 1, 1,
-0.1689177, 0.1283405, -1.279568, 0, 0, 0, 1, 1,
-0.1684293, -1.594308, -3.322401, 0, 0, 0, 1, 1,
-0.1656215, -0.2225189, -3.164595, 0, 0, 0, 1, 1,
-0.16416, 1.026306, -0.3607349, 0, 0, 0, 1, 1,
-0.158539, -0.5994931, -2.636242, 1, 1, 1, 1, 1,
-0.1561918, -1.1462, -3.31096, 1, 1, 1, 1, 1,
-0.1502765, -0.4047875, -2.224547, 1, 1, 1, 1, 1,
-0.1490093, 1.032885, 0.2458634, 1, 1, 1, 1, 1,
-0.1486424, 1.591757, 1.423222, 1, 1, 1, 1, 1,
-0.1473708, -0.04259969, -3.863347, 1, 1, 1, 1, 1,
-0.145718, 1.763368, 0.6267663, 1, 1, 1, 1, 1,
-0.1444156, -0.03631434, -0.5771354, 1, 1, 1, 1, 1,
-0.1437227, 1.757011, -0.5900637, 1, 1, 1, 1, 1,
-0.1406535, 0.3998453, 0.3920967, 1, 1, 1, 1, 1,
-0.1357063, -0.1961152, -1.610616, 1, 1, 1, 1, 1,
-0.1339428, -1.026481, -1.801357, 1, 1, 1, 1, 1,
-0.1324639, -0.475028, -2.41654, 1, 1, 1, 1, 1,
-0.1278421, -0.2162984, -2.329167, 1, 1, 1, 1, 1,
-0.1270937, 1.442544, 1.429461, 1, 1, 1, 1, 1,
-0.1239011, 1.299651, -1.060783, 0, 0, 1, 1, 1,
-0.1235738, 0.3236903, 0.03531908, 1, 0, 0, 1, 1,
-0.1229736, 0.4796212, -1.227522, 1, 0, 0, 1, 1,
-0.1181734, -0.3253739, -3.035678, 1, 0, 0, 1, 1,
-0.1155398, -0.5225078, -3.00912, 1, 0, 0, 1, 1,
-0.1118673, -0.1732688, -1.612199, 1, 0, 0, 1, 1,
-0.1113867, 0.3841935, -1.386754, 0, 0, 0, 1, 1,
-0.1109557, 0.381614, 0.4711304, 0, 0, 0, 1, 1,
-0.1104491, 0.05097509, -3.037877, 0, 0, 0, 1, 1,
-0.1054448, 0.2988407, -0.7103252, 0, 0, 0, 1, 1,
-0.1047113, -1.099062, -3.111634, 0, 0, 0, 1, 1,
-0.09730212, -0.3645642, -2.965548, 0, 0, 0, 1, 1,
-0.09382872, 0.9000965, 1.312155, 0, 0, 0, 1, 1,
-0.09093962, -0.2876039, -2.878432, 1, 1, 1, 1, 1,
-0.08752523, 1.168958, 0.2995773, 1, 1, 1, 1, 1,
-0.0875086, 0.9513291, 0.2646702, 1, 1, 1, 1, 1,
-0.08653107, -0.3561682, -2.424379, 1, 1, 1, 1, 1,
-0.08611414, -0.1415852, -3.257771, 1, 1, 1, 1, 1,
-0.07562745, -1.051181, -5.158587, 1, 1, 1, 1, 1,
-0.07402785, 0.3834138, 0.8729417, 1, 1, 1, 1, 1,
-0.07283904, -0.4831556, -3.989129, 1, 1, 1, 1, 1,
-0.07126403, 0.119449, -2.326497, 1, 1, 1, 1, 1,
-0.06966243, -1.061376, -4.106236, 1, 1, 1, 1, 1,
-0.06436969, 1.013933, -2.160658, 1, 1, 1, 1, 1,
-0.06364344, 0.9646258, -0.7508192, 1, 1, 1, 1, 1,
-0.06291131, 0.1780913, -0.4442801, 1, 1, 1, 1, 1,
-0.05952716, 1.299745, -0.5438809, 1, 1, 1, 1, 1,
-0.05911337, -1.845533, -3.026565, 1, 1, 1, 1, 1,
-0.05889693, -1.761447, -0.4014657, 0, 0, 1, 1, 1,
-0.04261725, -1.461749, -2.810212, 1, 0, 0, 1, 1,
-0.04094979, 0.8304681, 0.1833737, 1, 0, 0, 1, 1,
-0.03888064, 0.0993255, 0.8181134, 1, 0, 0, 1, 1,
-0.03833049, 1.176301, -1.607775, 1, 0, 0, 1, 1,
-0.03691543, 0.2939653, 1.823998, 1, 0, 0, 1, 1,
-0.03472759, 1.22818, -0.7127928, 0, 0, 0, 1, 1,
-0.0341079, -1.940584, -2.945652, 0, 0, 0, 1, 1,
-0.03322726, 1.102686, -2.117104, 0, 0, 0, 1, 1,
-0.03132029, -0.5847838, -2.387148, 0, 0, 0, 1, 1,
-0.03087427, 0.4063011, -1.209019, 0, 0, 0, 1, 1,
-0.02385653, -1.022218, -5.350678, 0, 0, 0, 1, 1,
-0.02314822, -1.474788, -4.054967, 0, 0, 0, 1, 1,
-0.02175192, 1.168483, 0.6018004, 1, 1, 1, 1, 1,
-0.02081226, 3.051238, 0.3367611, 1, 1, 1, 1, 1,
-0.01092965, -0.9351718, -1.88676, 1, 1, 1, 1, 1,
-0.006847345, -0.9246697, -1.064211, 1, 1, 1, 1, 1,
-0.004497011, -0.9666526, -2.223259, 1, 1, 1, 1, 1,
-0.001549091, -1.096373, -2.69782, 1, 1, 1, 1, 1,
-0.0002638348, 2.474918, 0.2495776, 1, 1, 1, 1, 1,
0.005315344, 0.6346202, 0.2016318, 1, 1, 1, 1, 1,
0.01194173, -0.6013147, 2.499397, 1, 1, 1, 1, 1,
0.01377241, 1.614025, -0.8751168, 1, 1, 1, 1, 1,
0.01440375, -0.1481701, 3.432632, 1, 1, 1, 1, 1,
0.01477901, 0.3869319, 0.1353957, 1, 1, 1, 1, 1,
0.01852671, 1.427621, -0.4609925, 1, 1, 1, 1, 1,
0.02178854, 0.4862452, -0.3959669, 1, 1, 1, 1, 1,
0.02406872, 0.3144167, -1.813859, 1, 1, 1, 1, 1,
0.02696948, 0.006725524, 2.073227, 0, 0, 1, 1, 1,
0.02842157, 0.1130136, -0.2972066, 1, 0, 0, 1, 1,
0.0298945, -0.1048923, 2.467321, 1, 0, 0, 1, 1,
0.03228818, 1.24458, -0.8548302, 1, 0, 0, 1, 1,
0.04047965, 0.8074538, -0.969047, 1, 0, 0, 1, 1,
0.04308544, -0.144282, 2.699129, 1, 0, 0, 1, 1,
0.04375445, 0.9295492, 0.3365468, 0, 0, 0, 1, 1,
0.04775113, 0.1367015, 0.2231488, 0, 0, 0, 1, 1,
0.05021233, 0.6622129, -0.9631487, 0, 0, 0, 1, 1,
0.05248638, -0.02378753, 2.432928, 0, 0, 0, 1, 1,
0.05482148, 0.1000785, 0.2336832, 0, 0, 0, 1, 1,
0.05621107, -1.974106, 3.54403, 0, 0, 0, 1, 1,
0.05654861, 0.9071231, -0.6434031, 0, 0, 0, 1, 1,
0.05728145, -1.112725, 4.324488, 1, 1, 1, 1, 1,
0.06133191, -0.48212, 2.134675, 1, 1, 1, 1, 1,
0.061886, 0.6816612, 0.7047974, 1, 1, 1, 1, 1,
0.06420203, -0.6350116, 2.964829, 1, 1, 1, 1, 1,
0.06521908, -1.043459, 2.565546, 1, 1, 1, 1, 1,
0.0657476, 0.4088202, 0.004904952, 1, 1, 1, 1, 1,
0.06627951, -2.3568, 3.991989, 1, 1, 1, 1, 1,
0.06738675, -0.9549772, 2.678042, 1, 1, 1, 1, 1,
0.07240894, 1.299821, 0.2858107, 1, 1, 1, 1, 1,
0.07523052, 1.130327, 1.04892, 1, 1, 1, 1, 1,
0.07626837, -0.7865329, 1.821039, 1, 1, 1, 1, 1,
0.07647901, 0.3017486, 0.7885992, 1, 1, 1, 1, 1,
0.07977828, 1.725569, -1.028735, 1, 1, 1, 1, 1,
0.08063675, 0.10679, 1.195819, 1, 1, 1, 1, 1,
0.0819415, -0.5173123, 3.131904, 1, 1, 1, 1, 1,
0.0848161, -0.9112284, 2.922875, 0, 0, 1, 1, 1,
0.08881116, 0.1523873, 0.2142983, 1, 0, 0, 1, 1,
0.08991166, -0.3594412, 3.672609, 1, 0, 0, 1, 1,
0.09250923, -1.23441, 2.257934, 1, 0, 0, 1, 1,
0.09381088, -0.09026586, 1.460312, 1, 0, 0, 1, 1,
0.09404743, 0.492101, 0.4275892, 1, 0, 0, 1, 1,
0.1004846, 1.147003, 1.564625, 0, 0, 0, 1, 1,
0.1014967, -0.003335044, 0.3411084, 0, 0, 0, 1, 1,
0.1051929, 1.972075, 2.089077, 0, 0, 0, 1, 1,
0.1081147, -0.5532452, 3.739915, 0, 0, 0, 1, 1,
0.1107837, -0.794449, 3.678045, 0, 0, 0, 1, 1,
0.1112938, -0.5842436, 2.895476, 0, 0, 0, 1, 1,
0.1155802, -0.7758972, 1.27946, 0, 0, 0, 1, 1,
0.1172482, -1.640865, 4.559147, 1, 1, 1, 1, 1,
0.1225544, 0.8198334, 1.208046, 1, 1, 1, 1, 1,
0.1316946, 0.2310964, 0.4705606, 1, 1, 1, 1, 1,
0.1319402, -1.443249, 2.78889, 1, 1, 1, 1, 1,
0.1334291, 0.4341898, -0.2660659, 1, 1, 1, 1, 1,
0.1359529, -0.6017986, 2.313176, 1, 1, 1, 1, 1,
0.1410193, 1.402939, -1.434667, 1, 1, 1, 1, 1,
0.1455784, -0.1945287, 4.692892, 1, 1, 1, 1, 1,
0.1462543, 0.1477183, -0.7332028, 1, 1, 1, 1, 1,
0.1470848, 0.487581, -0.9346226, 1, 1, 1, 1, 1,
0.1472151, 1.579528, -0.3738808, 1, 1, 1, 1, 1,
0.1506063, -0.06450375, 1.613783, 1, 1, 1, 1, 1,
0.1564541, 0.382688, -0.7270235, 1, 1, 1, 1, 1,
0.163603, 0.0638958, 0.2366503, 1, 1, 1, 1, 1,
0.1653538, 0.5520388, -0.07351574, 1, 1, 1, 1, 1,
0.1655019, -0.02272721, 3.006074, 0, 0, 1, 1, 1,
0.1656898, -0.5572293, 2.679183, 1, 0, 0, 1, 1,
0.1671875, 0.7819146, 1.728702, 1, 0, 0, 1, 1,
0.1722663, 0.7789556, -0.7115438, 1, 0, 0, 1, 1,
0.1729517, 0.8296791, 1.371674, 1, 0, 0, 1, 1,
0.1748571, -1.704527, 3.596605, 1, 0, 0, 1, 1,
0.1833683, -0.3439308, 2.89825, 0, 0, 0, 1, 1,
0.1875051, 0.9115202, 1.636172, 0, 0, 0, 1, 1,
0.1882294, -1.406558, 2.012715, 0, 0, 0, 1, 1,
0.1891248, 0.2875586, 0.1522401, 0, 0, 0, 1, 1,
0.1974049, -0.6455515, 2.168261, 0, 0, 0, 1, 1,
0.1977842, 0.1889271, 0.6764623, 0, 0, 0, 1, 1,
0.199376, 1.233622, 1.175142, 0, 0, 0, 1, 1,
0.1994743, -0.7248278, 1.083308, 1, 1, 1, 1, 1,
0.2002047, 1.277511, -0.500889, 1, 1, 1, 1, 1,
0.2022618, 0.5445018, 0.5318299, 1, 1, 1, 1, 1,
0.2062089, -0.6730305, 3.086312, 1, 1, 1, 1, 1,
0.2070937, -1.047173, 2.784643, 1, 1, 1, 1, 1,
0.2072432, 1.079128, -0.216493, 1, 1, 1, 1, 1,
0.210084, -0.1170454, 1.509075, 1, 1, 1, 1, 1,
0.2134724, -1.074476, 4.164098, 1, 1, 1, 1, 1,
0.2265355, 0.7188649, -0.8689297, 1, 1, 1, 1, 1,
0.2319063, -1.462891, 1.27284, 1, 1, 1, 1, 1,
0.2360398, 0.6233104, 0.8837626, 1, 1, 1, 1, 1,
0.2373769, -1.11906, 2.212639, 1, 1, 1, 1, 1,
0.2381001, -0.6998038, 1.845065, 1, 1, 1, 1, 1,
0.2460607, 2.493649, 0.6298001, 1, 1, 1, 1, 1,
0.2493774, -1.143073, 0.9013747, 1, 1, 1, 1, 1,
0.2517609, 1.77811, 0.8444923, 0, 0, 1, 1, 1,
0.255446, 1.303194, 0.4279628, 1, 0, 0, 1, 1,
0.2600029, 0.3120222, 0.6223162, 1, 0, 0, 1, 1,
0.2601304, -0.315672, 2.700583, 1, 0, 0, 1, 1,
0.2625953, 1.963591, -1.064679, 1, 0, 0, 1, 1,
0.2634107, -0.1579841, 0.8123171, 1, 0, 0, 1, 1,
0.2682355, -0.5247614, 2.458545, 0, 0, 0, 1, 1,
0.275599, 0.1652156, 1.888123, 0, 0, 0, 1, 1,
0.2760256, -0.5002887, 1.557587, 0, 0, 0, 1, 1,
0.2786103, 0.5518879, -1.779859, 0, 0, 0, 1, 1,
0.2841185, -0.723134, 1.872754, 0, 0, 0, 1, 1,
0.2870856, 1.131349, -0.4523812, 0, 0, 0, 1, 1,
0.2891587, -1.505042, 4.755561, 0, 0, 0, 1, 1,
0.2896817, -0.6354499, 4.29293, 1, 1, 1, 1, 1,
0.291729, -0.9278562, 3.705682, 1, 1, 1, 1, 1,
0.2920697, 0.9790118, 1.924239, 1, 1, 1, 1, 1,
0.2947138, -0.83797, 1.840527, 1, 1, 1, 1, 1,
0.2952093, -0.7190743, 4.199231, 1, 1, 1, 1, 1,
0.2969468, 0.7507196, 0.07737946, 1, 1, 1, 1, 1,
0.2987698, -0.01972051, 0.8168739, 1, 1, 1, 1, 1,
0.3000402, -0.6077843, 1.513239, 1, 1, 1, 1, 1,
0.3053305, 1.362644, 2.028423, 1, 1, 1, 1, 1,
0.3060107, -0.2151898, 3.594674, 1, 1, 1, 1, 1,
0.3083784, 1.35801, -0.08246976, 1, 1, 1, 1, 1,
0.3098237, 1.640651, 0.5483702, 1, 1, 1, 1, 1,
0.3123143, -2.38741, 1.873207, 1, 1, 1, 1, 1,
0.318502, 0.01728497, 1.777256, 1, 1, 1, 1, 1,
0.3195162, -1.358701, 3.417283, 1, 1, 1, 1, 1,
0.324094, 0.04384496, 1.551757, 0, 0, 1, 1, 1,
0.3248504, -2.075854, 3.823087, 1, 0, 0, 1, 1,
0.3277695, -0.0577538, 2.220725, 1, 0, 0, 1, 1,
0.3307205, -1.636467, 4.425141, 1, 0, 0, 1, 1,
0.3317076, -1.21818, 2.900955, 1, 0, 0, 1, 1,
0.3401248, -0.1404843, 1.014203, 1, 0, 0, 1, 1,
0.3419003, -0.4958126, 2.159151, 0, 0, 0, 1, 1,
0.3450114, 0.1016812, 1.419489, 0, 0, 0, 1, 1,
0.3496644, -1.636736, 2.309005, 0, 0, 0, 1, 1,
0.3525843, -0.576099, 1.646948, 0, 0, 0, 1, 1,
0.3536606, 0.896993, 0.7002121, 0, 0, 0, 1, 1,
0.3547757, 0.27383, 0.5383044, 0, 0, 0, 1, 1,
0.358556, 1.362123, 0.5106591, 0, 0, 0, 1, 1,
0.3617855, 0.7432501, -0.05332245, 1, 1, 1, 1, 1,
0.3619447, -0.6624777, 1.645473, 1, 1, 1, 1, 1,
0.3663474, 0.08336451, 1.950975, 1, 1, 1, 1, 1,
0.3669083, -0.2316171, 1.215652, 1, 1, 1, 1, 1,
0.3688525, -1.527065, 2.756774, 1, 1, 1, 1, 1,
0.3698254, 0.8168028, -0.9850523, 1, 1, 1, 1, 1,
0.3704782, -0.7626091, 3.12254, 1, 1, 1, 1, 1,
0.3710291, 1.418384, -0.2823929, 1, 1, 1, 1, 1,
0.3718008, 0.5359591, 0.4066086, 1, 1, 1, 1, 1,
0.3725798, -0.5613, 2.94764, 1, 1, 1, 1, 1,
0.3749894, 1.807096, -0.6636361, 1, 1, 1, 1, 1,
0.3766423, -0.9902093, 3.91171, 1, 1, 1, 1, 1,
0.3767826, 0.7889541, 1.137821, 1, 1, 1, 1, 1,
0.3810044, 1.721242, -1.01345, 1, 1, 1, 1, 1,
0.3816112, 0.4251632, 1.229263, 1, 1, 1, 1, 1,
0.3830802, 0.946651, 0.8763474, 0, 0, 1, 1, 1,
0.3866049, -0.8360215, 4.470326, 1, 0, 0, 1, 1,
0.3866833, 0.1199344, 2.395506, 1, 0, 0, 1, 1,
0.3868919, 0.3909693, 3.080179, 1, 0, 0, 1, 1,
0.387108, -0.685746, 2.283125, 1, 0, 0, 1, 1,
0.3877572, -0.8561051, 2.038759, 1, 0, 0, 1, 1,
0.3878828, 0.01072585, 1.402606, 0, 0, 0, 1, 1,
0.3894005, 0.4981238, 1.392562, 0, 0, 0, 1, 1,
0.3894431, -0.3184744, 1.237036, 0, 0, 0, 1, 1,
0.3900367, 1.325247, 1.676253, 0, 0, 0, 1, 1,
0.394226, 1.442475, 0.8208891, 0, 0, 0, 1, 1,
0.3949541, -1.641526, 2.609412, 0, 0, 0, 1, 1,
0.3950519, 1.515692, 0.305447, 0, 0, 0, 1, 1,
0.3956588, -0.1432145, 0.9032791, 1, 1, 1, 1, 1,
0.3961081, -0.7367421, 2.999723, 1, 1, 1, 1, 1,
0.3997692, 1.747096, -0.1047316, 1, 1, 1, 1, 1,
0.3999429, 1.876455, 0.5723947, 1, 1, 1, 1, 1,
0.400777, -0.4352182, 2.412746, 1, 1, 1, 1, 1,
0.4028386, 1.617071, -0.7863877, 1, 1, 1, 1, 1,
0.4041822, 1.372295, 0.2356669, 1, 1, 1, 1, 1,
0.4085324, 1.208129, 0.5583549, 1, 1, 1, 1, 1,
0.4132253, 0.481975, 0.00674755, 1, 1, 1, 1, 1,
0.4157187, 1.357373, 1.032882, 1, 1, 1, 1, 1,
0.4210927, -0.3110231, 0.9710383, 1, 1, 1, 1, 1,
0.4243976, 1.907155, -1.708136, 1, 1, 1, 1, 1,
0.4259368, 0.3881284, 1.34893, 1, 1, 1, 1, 1,
0.4262623, -1.026812, 2.017915, 1, 1, 1, 1, 1,
0.4291373, -1.043597, 2.747841, 1, 1, 1, 1, 1,
0.4340659, 0.7797444, 1.829373, 0, 0, 1, 1, 1,
0.4364463, 2.119661, 0.09328335, 1, 0, 0, 1, 1,
0.4389635, 0.3821744, -0.2755287, 1, 0, 0, 1, 1,
0.4392328, 1.055969, -0.9419466, 1, 0, 0, 1, 1,
0.4459264, -1.509828, 3.349826, 1, 0, 0, 1, 1,
0.4509076, -0.7955953, 2.23471, 1, 0, 0, 1, 1,
0.4618108, 1.310616, 1.338936, 0, 0, 0, 1, 1,
0.4640658, -0.6232885, 0.593704, 0, 0, 0, 1, 1,
0.4668627, -0.886961, 3.888738, 0, 0, 0, 1, 1,
0.4672737, 0.4044083, 1.368972, 0, 0, 0, 1, 1,
0.4731499, -1.13236, 1.661266, 0, 0, 0, 1, 1,
0.48162, 0.416752, 1.932941, 0, 0, 0, 1, 1,
0.4864794, -0.1062282, 2.483476, 0, 0, 0, 1, 1,
0.4904307, -0.2684239, 0.8723215, 1, 1, 1, 1, 1,
0.4921469, 1.356168, -0.7471322, 1, 1, 1, 1, 1,
0.493289, 1.060221, -0.5532953, 1, 1, 1, 1, 1,
0.493448, 0.8976887, -0.4703739, 1, 1, 1, 1, 1,
0.4949192, -1.360813, 4.55964, 1, 1, 1, 1, 1,
0.4949873, -0.5023448, 2.356725, 1, 1, 1, 1, 1,
0.4955549, 1.127639, 0.3629254, 1, 1, 1, 1, 1,
0.4971771, -0.2897857, 2.98701, 1, 1, 1, 1, 1,
0.5032659, 0.3011167, 1.015093, 1, 1, 1, 1, 1,
0.5041075, -0.3898267, 1.617694, 1, 1, 1, 1, 1,
0.5082283, -1.49735, 1.208633, 1, 1, 1, 1, 1,
0.510214, 2.171716, -0.2577347, 1, 1, 1, 1, 1,
0.510528, -0.4847881, 2.623497, 1, 1, 1, 1, 1,
0.5107921, -0.5302604, 2.40877, 1, 1, 1, 1, 1,
0.5116649, -0.9252728, 3.709733, 1, 1, 1, 1, 1,
0.5133494, -0.7323068, 2.895219, 0, 0, 1, 1, 1,
0.5199716, 1.107356, 0.3764877, 1, 0, 0, 1, 1,
0.5264775, 0.6266696, 1.478474, 1, 0, 0, 1, 1,
0.5274627, -0.8029837, 2.808869, 1, 0, 0, 1, 1,
0.5305195, -1.28476, 2.114608, 1, 0, 0, 1, 1,
0.5320982, -0.318187, 0.2508498, 1, 0, 0, 1, 1,
0.5345975, -0.243498, 3.298252, 0, 0, 0, 1, 1,
0.5382326, 0.06505828, 1.713986, 0, 0, 0, 1, 1,
0.5411164, 0.8980936, 1.275931, 0, 0, 0, 1, 1,
0.5415068, 1.709637, 1.42719, 0, 0, 0, 1, 1,
0.5440133, 0.6179382, -1.11392, 0, 0, 0, 1, 1,
0.5480352, -0.1738262, 1.30574, 0, 0, 0, 1, 1,
0.5534046, 2.101863, 1.840686, 0, 0, 0, 1, 1,
0.5548136, -1.348311, 1.825791, 1, 1, 1, 1, 1,
0.5621853, 1.185019, 0.9053069, 1, 1, 1, 1, 1,
0.5627695, 0.4682842, 2.336823, 1, 1, 1, 1, 1,
0.5713434, 0.00721344, 1.646855, 1, 1, 1, 1, 1,
0.5738913, 0.03641398, 1.189217, 1, 1, 1, 1, 1,
0.5760304, 0.439045, 0.8351547, 1, 1, 1, 1, 1,
0.5810578, 0.2305886, 3.213806, 1, 1, 1, 1, 1,
0.5815959, -0.2377047, 1.355418, 1, 1, 1, 1, 1,
0.5819561, -1.69142, 1.438536, 1, 1, 1, 1, 1,
0.5850025, -0.06947132, 1.727531, 1, 1, 1, 1, 1,
0.5851973, 0.3058338, 0.6618477, 1, 1, 1, 1, 1,
0.5881753, -0.3695931, 3.418035, 1, 1, 1, 1, 1,
0.5914215, -0.5072632, 1.391059, 1, 1, 1, 1, 1,
0.5928802, -1.290397, 2.140604, 1, 1, 1, 1, 1,
0.5974819, -1.036176, 1.837714, 1, 1, 1, 1, 1,
0.5992731, -1.026578, 3.649191, 0, 0, 1, 1, 1,
0.6106807, -1.379726, 1.87278, 1, 0, 0, 1, 1,
0.6110466, 0.1264626, 0.6013523, 1, 0, 0, 1, 1,
0.6173297, 0.4851463, 0.7228799, 1, 0, 0, 1, 1,
0.6179683, -1.390214, 2.636454, 1, 0, 0, 1, 1,
0.6196894, 1.386763, 0.4011841, 1, 0, 0, 1, 1,
0.6225768, 0.003401944, 1.459836, 0, 0, 0, 1, 1,
0.6232324, 0.4337338, 1.186602, 0, 0, 0, 1, 1,
0.6287807, 0.7117479, -0.06563243, 0, 0, 0, 1, 1,
0.6293189, -0.5524985, 1.56478, 0, 0, 0, 1, 1,
0.6351819, -0.8430384, 2.562718, 0, 0, 0, 1, 1,
0.6353982, 0.1317282, 2.345244, 0, 0, 0, 1, 1,
0.638293, -1.517053, 4.772182, 0, 0, 0, 1, 1,
0.6416171, 0.5093358, 2.516085, 1, 1, 1, 1, 1,
0.6463332, -0.1374533, 2.261563, 1, 1, 1, 1, 1,
0.651589, -0.1744778, 2.071456, 1, 1, 1, 1, 1,
0.6563544, 1.01833, 0.7533019, 1, 1, 1, 1, 1,
0.6640986, -0.8883078, 4.378103, 1, 1, 1, 1, 1,
0.6755977, 0.8177379, -1.207267, 1, 1, 1, 1, 1,
0.6760131, -1.434372, 0.5673381, 1, 1, 1, 1, 1,
0.6773525, 0.05103097, 2.204863, 1, 1, 1, 1, 1,
0.6813304, 0.09372072, 0.05084192, 1, 1, 1, 1, 1,
0.6831188, 1.091215, 0.5844619, 1, 1, 1, 1, 1,
0.687418, 0.9750166, 1.329191, 1, 1, 1, 1, 1,
0.6895137, -1.396469, 1.519782, 1, 1, 1, 1, 1,
0.6902102, -1.183378, 3.243046, 1, 1, 1, 1, 1,
0.6965659, 0.1452045, 1.644547, 1, 1, 1, 1, 1,
0.6999886, -0.2712086, 2.837857, 1, 1, 1, 1, 1,
0.7009529, -0.9856365, 2.993882, 0, 0, 1, 1, 1,
0.7042251, 0.1005767, 1.482785, 1, 0, 0, 1, 1,
0.7045934, 0.2029039, 1.187496, 1, 0, 0, 1, 1,
0.7072576, -0.2824335, 1.951095, 1, 0, 0, 1, 1,
0.710751, 0.6467327, 1.530114, 1, 0, 0, 1, 1,
0.7113139, -0.07736035, -0.02210251, 1, 0, 0, 1, 1,
0.7162212, -0.1969524, 1.601807, 0, 0, 0, 1, 1,
0.7166669, 0.9965913, -0.07355963, 0, 0, 0, 1, 1,
0.7178047, -1.76641, 2.635339, 0, 0, 0, 1, 1,
0.7210598, -0.04523492, 2.032664, 0, 0, 0, 1, 1,
0.7228718, -0.6777184, 1.739681, 0, 0, 0, 1, 1,
0.7244141, -0.9108164, 3.781787, 0, 0, 0, 1, 1,
0.7348175, 1.39587, 1.265338, 0, 0, 0, 1, 1,
0.7357515, 0.8691952, 0.6339595, 1, 1, 1, 1, 1,
0.7363648, 1.368988, -0.7474875, 1, 1, 1, 1, 1,
0.7381425, 1.821318, 1.359096, 1, 1, 1, 1, 1,
0.7415854, 1.447649, 1.364223, 1, 1, 1, 1, 1,
0.7507841, -1.597494, 4.241663, 1, 1, 1, 1, 1,
0.7523585, 1.487396, 0.3422676, 1, 1, 1, 1, 1,
0.7552177, 0.6160222, 1.073124, 1, 1, 1, 1, 1,
0.7602154, 1.299009, 2.255872, 1, 1, 1, 1, 1,
0.7621946, -0.2443803, 1.676457, 1, 1, 1, 1, 1,
0.7647912, -1.291624, 1.303146, 1, 1, 1, 1, 1,
0.7662217, 1.11688, 1.896306, 1, 1, 1, 1, 1,
0.7709431, -0.4155034, 1.286901, 1, 1, 1, 1, 1,
0.7716403, -0.756016, 1.761538, 1, 1, 1, 1, 1,
0.778465, 0.9248212, 0.1652785, 1, 1, 1, 1, 1,
0.7807091, 0.1753142, 0.5694421, 1, 1, 1, 1, 1,
0.785029, 0.7440351, 0.5351881, 0, 0, 1, 1, 1,
0.785951, 0.1889242, 0.2148865, 1, 0, 0, 1, 1,
0.7874508, 1.316582, -1.288809, 1, 0, 0, 1, 1,
0.7947202, -1.109139, 4.107721, 1, 0, 0, 1, 1,
0.7978237, -0.1286405, 2.099986, 1, 0, 0, 1, 1,
0.8041569, -0.4127922, 3.881398, 1, 0, 0, 1, 1,
0.8088077, 0.30415, 1.9518, 0, 0, 0, 1, 1,
0.8112159, -0.2660378, 3.358087, 0, 0, 0, 1, 1,
0.8136873, -0.9166083, 2.427169, 0, 0, 0, 1, 1,
0.8145002, 0.459183, 0.7674927, 0, 0, 0, 1, 1,
0.8188704, 0.885156, 0.2964468, 0, 0, 0, 1, 1,
0.8211021, 0.02222841, 2.357917, 0, 0, 0, 1, 1,
0.8234347, -0.8744282, 2.807622, 0, 0, 0, 1, 1,
0.8298491, 1.094729, 2.194772, 1, 1, 1, 1, 1,
0.8306049, 0.07976171, -0.04588808, 1, 1, 1, 1, 1,
0.8351523, -1.694283, 1.642075, 1, 1, 1, 1, 1,
0.8413154, -0.6431619, 1.648082, 1, 1, 1, 1, 1,
0.8422707, -1.529195, 3.472042, 1, 1, 1, 1, 1,
0.8429089, 0.8741397, 0.5613788, 1, 1, 1, 1, 1,
0.8433077, -1.26862, 3.050441, 1, 1, 1, 1, 1,
0.8464961, 1.48095, 2.806516, 1, 1, 1, 1, 1,
0.8476521, -0.5437939, 2.420363, 1, 1, 1, 1, 1,
0.8504598, -1.131334, 3.325196, 1, 1, 1, 1, 1,
0.8589686, -0.1127051, 2.49029, 1, 1, 1, 1, 1,
0.8629707, -0.8970809, 1.938918, 1, 1, 1, 1, 1,
0.8647737, -0.6444956, 2.463802, 1, 1, 1, 1, 1,
0.8775735, -1.210966, 1.82294, 1, 1, 1, 1, 1,
0.8804281, -1.452497, 3.870015, 1, 1, 1, 1, 1,
0.8891377, -0.3940568, 0.3207369, 0, 0, 1, 1, 1,
0.8939242, 0.6942818, 0.6093352, 1, 0, 0, 1, 1,
0.8954402, 0.7789366, -0.5381704, 1, 0, 0, 1, 1,
0.8967092, 0.8694106, 1.085465, 1, 0, 0, 1, 1,
0.9070771, 0.4119717, 1.454008, 1, 0, 0, 1, 1,
0.9087299, 2.275922, 1.703738, 1, 0, 0, 1, 1,
0.9120283, -0.7779153, 2.086351, 0, 0, 0, 1, 1,
0.9148048, -1.754944, 4.585382, 0, 0, 0, 1, 1,
0.9153402, 0.06782692, 2.026547, 0, 0, 0, 1, 1,
0.9168674, -2.308026, 1.141814, 0, 0, 0, 1, 1,
0.9252241, -0.4374294, 0.06344843, 0, 0, 0, 1, 1,
0.9272105, -1.502894, 1.361593, 0, 0, 0, 1, 1,
0.9316878, -0.2525494, 3.245192, 0, 0, 0, 1, 1,
0.9325863, -0.1308308, 1.039986, 1, 1, 1, 1, 1,
0.935766, 0.07997618, 1.170473, 1, 1, 1, 1, 1,
0.9368161, 0.6993726, 1.242047, 1, 1, 1, 1, 1,
0.9420075, 0.5512966, 2.92475, 1, 1, 1, 1, 1,
0.9529201, -0.1018799, -0.3072789, 1, 1, 1, 1, 1,
0.9558019, -1.147628, 2.5386, 1, 1, 1, 1, 1,
0.957416, -0.734417, 0.9132053, 1, 1, 1, 1, 1,
0.960391, 0.988996, 1.404275, 1, 1, 1, 1, 1,
0.9642914, 0.9871396, 1.100979, 1, 1, 1, 1, 1,
0.9809154, -0.6595081, 2.618874, 1, 1, 1, 1, 1,
0.9822397, -0.2028904, 3.032909, 1, 1, 1, 1, 1,
0.9836573, 0.3292007, 0.05874449, 1, 1, 1, 1, 1,
0.9924016, 0.4152269, 1.585912, 1, 1, 1, 1, 1,
0.9972128, -0.5172098, 2.162259, 1, 1, 1, 1, 1,
1.007094, -1.055516, 1.25563, 1, 1, 1, 1, 1,
1.020092, -1.539178, 3.625302, 0, 0, 1, 1, 1,
1.020452, -1.423462, 2.342915, 1, 0, 0, 1, 1,
1.021236, -0.5769141, 1.506697, 1, 0, 0, 1, 1,
1.023413, 0.5695748, 0.3834659, 1, 0, 0, 1, 1,
1.023914, -1.956804, 2.058184, 1, 0, 0, 1, 1,
1.024822, -0.5611845, 3.104072, 1, 0, 0, 1, 1,
1.033447, -0.3166101, 0.9391173, 0, 0, 0, 1, 1,
1.03467, -0.7070838, 2.668444, 0, 0, 0, 1, 1,
1.035288, -0.7646931, 2.785455, 0, 0, 0, 1, 1,
1.039157, -0.401282, 1.1151, 0, 0, 0, 1, 1,
1.044619, -0.6304083, 2.051234, 0, 0, 0, 1, 1,
1.048582, -0.06552924, 3.180762, 0, 0, 0, 1, 1,
1.049618, 0.5031769, 1.711099, 0, 0, 0, 1, 1,
1.063218, -0.7056617, 1.89333, 1, 1, 1, 1, 1,
1.065637, 0.2163738, 1.660977, 1, 1, 1, 1, 1,
1.06845, -1.787154, 4.229028, 1, 1, 1, 1, 1,
1.070513, -0.6108009, 1.126449, 1, 1, 1, 1, 1,
1.073927, 1.852084, 0.8471861, 1, 1, 1, 1, 1,
1.078984, 0.3494382, 2.092949, 1, 1, 1, 1, 1,
1.08132, -0.8179554, 2.503355, 1, 1, 1, 1, 1,
1.084483, -0.1932879, 1.575695, 1, 1, 1, 1, 1,
1.095879, 1.251032, -0.2586379, 1, 1, 1, 1, 1,
1.096021, -0.2257981, 1.409834, 1, 1, 1, 1, 1,
1.104115, -1.68126, 3.721949, 1, 1, 1, 1, 1,
1.104802, -0.2905041, 2.391731, 1, 1, 1, 1, 1,
1.105709, -0.9799576, 0.7267285, 1, 1, 1, 1, 1,
1.106442, 0.05918438, 2.796321, 1, 1, 1, 1, 1,
1.114396, 0.7011929, 0.6327225, 1, 1, 1, 1, 1,
1.119139, 0.8672176, 0.9379772, 0, 0, 1, 1, 1,
1.120504, 1.143012, 2.846422, 1, 0, 0, 1, 1,
1.128809, -0.7442288, 1.112201, 1, 0, 0, 1, 1,
1.12887, -1.529355, 3.042294, 1, 0, 0, 1, 1,
1.13136, -0.6846249, 1.276444, 1, 0, 0, 1, 1,
1.131919, -0.808616, 1.657763, 1, 0, 0, 1, 1,
1.13641, 0.4502397, 0.6153967, 0, 0, 0, 1, 1,
1.142312, -0.7916918, 0.5168947, 0, 0, 0, 1, 1,
1.144767, -0.02211191, 1.724225, 0, 0, 0, 1, 1,
1.151428, -0.2681993, 1.683431, 0, 0, 0, 1, 1,
1.154668, 0.2160632, 0.8642693, 0, 0, 0, 1, 1,
1.168048, 0.8757396, 1.90002, 0, 0, 0, 1, 1,
1.170679, 0.4852285, 0.3403305, 0, 0, 0, 1, 1,
1.179778, -0.2917203, 1.503652, 1, 1, 1, 1, 1,
1.182161, -1.039405, 2.229031, 1, 1, 1, 1, 1,
1.183582, -0.3927196, 1.642218, 1, 1, 1, 1, 1,
1.185799, 0.3407447, 2.019561, 1, 1, 1, 1, 1,
1.192666, -0.2814908, 3.409363, 1, 1, 1, 1, 1,
1.204001, -1.627113, 3.207278, 1, 1, 1, 1, 1,
1.213357, -0.1265639, 1.434755, 1, 1, 1, 1, 1,
1.216291, -1.226889, -0.06013839, 1, 1, 1, 1, 1,
1.218185, 0.6423737, 1.768689, 1, 1, 1, 1, 1,
1.22021, -0.3343149, 0.727505, 1, 1, 1, 1, 1,
1.230677, 1.365641, -0.9830793, 1, 1, 1, 1, 1,
1.231705, 0.7047965, 1.529655, 1, 1, 1, 1, 1,
1.246483, -1.009972, 2.46296, 1, 1, 1, 1, 1,
1.248834, -0.133053, 3.918894, 1, 1, 1, 1, 1,
1.254119, -0.7260144, 1.559598, 1, 1, 1, 1, 1,
1.258483, 1.262398, 2.865674, 0, 0, 1, 1, 1,
1.271959, -1.225747, 3.081588, 1, 0, 0, 1, 1,
1.273854, 1.623866, -0.2424148, 1, 0, 0, 1, 1,
1.274781, 1.040115, 2.000895, 1, 0, 0, 1, 1,
1.281167, -0.2274732, 1.124789, 1, 0, 0, 1, 1,
1.290921, 0.2519812, 0.7449979, 1, 0, 0, 1, 1,
1.29318, 0.9096715, 0.1862714, 0, 0, 0, 1, 1,
1.297439, 0.9339085, -1.125268, 0, 0, 0, 1, 1,
1.299151, 0.1301571, 3.241987, 0, 0, 0, 1, 1,
1.300752, -0.06054262, 0.540202, 0, 0, 0, 1, 1,
1.304146, 2.920403, 2.574003, 0, 0, 0, 1, 1,
1.309802, 1.008261, 1.596822, 0, 0, 0, 1, 1,
1.319255, 2.565888, -0.4475174, 0, 0, 0, 1, 1,
1.320364, -0.8769538, 2.735155, 1, 1, 1, 1, 1,
1.323499, 0.4876682, 1.592506, 1, 1, 1, 1, 1,
1.330977, 0.3180244, 1.216655, 1, 1, 1, 1, 1,
1.336224, 1.281562, 0.9584556, 1, 1, 1, 1, 1,
1.33698, 0.7876461, 0.4615617, 1, 1, 1, 1, 1,
1.337822, -1.031579, 3.001995, 1, 1, 1, 1, 1,
1.338608, 0.7871468, 0.777465, 1, 1, 1, 1, 1,
1.339821, 0.02573812, 3.075246, 1, 1, 1, 1, 1,
1.340732, 1.189095, -0.1724789, 1, 1, 1, 1, 1,
1.348864, 1.334334, 0.06960526, 1, 1, 1, 1, 1,
1.350782, 0.202556, 2.433839, 1, 1, 1, 1, 1,
1.362318, 1.090154, -0.03632229, 1, 1, 1, 1, 1,
1.36473, -0.2257309, -0.1664466, 1, 1, 1, 1, 1,
1.368736, 0.9040654, 2.71245, 1, 1, 1, 1, 1,
1.383564, -0.7273698, 2.778922, 1, 1, 1, 1, 1,
1.384715, -0.4001686, 1.421424, 0, 0, 1, 1, 1,
1.395837, 0.515256, 1.720451, 1, 0, 0, 1, 1,
1.407459, 0.2604849, 0.460475, 1, 0, 0, 1, 1,
1.412592, 1.693461, 0.2391028, 1, 0, 0, 1, 1,
1.416877, 0.6733151, 0.7623159, 1, 0, 0, 1, 1,
1.425645, -0.3488629, 3.264247, 1, 0, 0, 1, 1,
1.433571, -1.961601, 0.8105624, 0, 0, 0, 1, 1,
1.443395, 0.3573934, 0.2838325, 0, 0, 0, 1, 1,
1.459764, -0.1868393, 1.632004, 0, 0, 0, 1, 1,
1.460365, 0.1941063, 0.9483188, 0, 0, 0, 1, 1,
1.461746, 1.186948, -0.3737291, 0, 0, 0, 1, 1,
1.462973, -0.1203469, 1.463534, 0, 0, 0, 1, 1,
1.463934, -1.970571, 1.245937, 0, 0, 0, 1, 1,
1.466278, 1.708211, 0.2645146, 1, 1, 1, 1, 1,
1.477337, 0.5036511, 2.185966, 1, 1, 1, 1, 1,
1.489696, -0.3449983, 1.942651, 1, 1, 1, 1, 1,
1.496197, -0.1970517, 0.6487713, 1, 1, 1, 1, 1,
1.504211, -0.5547786, 2.528734, 1, 1, 1, 1, 1,
1.529516, -0.5548781, 1.56137, 1, 1, 1, 1, 1,
1.534414, -0.4826125, 3.612826, 1, 1, 1, 1, 1,
1.543173, -1.299604, 2.442772, 1, 1, 1, 1, 1,
1.543232, -0.1347039, 2.8871, 1, 1, 1, 1, 1,
1.547513, -0.07201373, 0.1612197, 1, 1, 1, 1, 1,
1.553764, -1.923083, 3.379323, 1, 1, 1, 1, 1,
1.55466, 1.079681, 0.4224171, 1, 1, 1, 1, 1,
1.560096, 0.5900578, 1.842048, 1, 1, 1, 1, 1,
1.577262, -0.89263, 0.5496946, 1, 1, 1, 1, 1,
1.588447, -0.5381714, 0.2459822, 1, 1, 1, 1, 1,
1.600305, -1.945196, 4.819438, 0, 0, 1, 1, 1,
1.601631, -1.513651, 1.718311, 1, 0, 0, 1, 1,
1.634607, 0.4412537, 0.9800128, 1, 0, 0, 1, 1,
1.639122, -1.828181, 2.096079, 1, 0, 0, 1, 1,
1.655402, 0.08193516, 0.1928011, 1, 0, 0, 1, 1,
1.657105, -0.1123194, 1.81693, 1, 0, 0, 1, 1,
1.669626, 0.1042424, 2.53303, 0, 0, 0, 1, 1,
1.670019, -0.8186196, 1.625655, 0, 0, 0, 1, 1,
1.685275, -0.1292176, 2.71613, 0, 0, 0, 1, 1,
1.731618, -0.3174913, -0.09468027, 0, 0, 0, 1, 1,
1.747125, 0.212394, 2.058449, 0, 0, 0, 1, 1,
1.784843, 0.7679581, 1.92015, 0, 0, 0, 1, 1,
1.821687, 0.7560499, 1.9168, 0, 0, 0, 1, 1,
1.825591, -1.602142, 2.525502, 1, 1, 1, 1, 1,
1.84289, 0.6671277, 0.373013, 1, 1, 1, 1, 1,
1.845533, -0.5377509, 1.01303, 1, 1, 1, 1, 1,
1.867543, 0.04954784, 2.319891, 1, 1, 1, 1, 1,
1.873702, -0.8076572, 2.238051, 1, 1, 1, 1, 1,
1.877042, 1.566793, -0.03630989, 1, 1, 1, 1, 1,
1.943367, -1.40863, 3.033835, 1, 1, 1, 1, 1,
1.960636, 1.211846, 1.072423, 1, 1, 1, 1, 1,
1.963028, 0.9674555, 0.7117844, 1, 1, 1, 1, 1,
1.963607, -1.729613, 3.494071, 1, 1, 1, 1, 1,
2.00728, 0.0436935, 1.674295, 1, 1, 1, 1, 1,
2.051906, -0.7357509, 2.097956, 1, 1, 1, 1, 1,
2.060697, -1.517756, 3.605009, 1, 1, 1, 1, 1,
2.069454, -0.5959159, 3.262974, 1, 1, 1, 1, 1,
2.144567, 0.7434389, 1.656413, 1, 1, 1, 1, 1,
2.147842, -1.363032, 2.143612, 0, 0, 1, 1, 1,
2.203989, -0.3987914, 1.519116, 1, 0, 0, 1, 1,
2.213661, 1.906633, -0.8624645, 1, 0, 0, 1, 1,
2.21933, -0.6136878, 0.8411748, 1, 0, 0, 1, 1,
2.224481, -0.04230059, 0.08158129, 1, 0, 0, 1, 1,
2.26669, -2.106109, 2.801773, 1, 0, 0, 1, 1,
2.298856, -1.217133, 4.347369, 0, 0, 0, 1, 1,
2.317612, 2.482739, -0.6517816, 0, 0, 0, 1, 1,
2.331587, 0.6606789, 1.527386, 0, 0, 0, 1, 1,
2.361697, -1.555304, 1.254965, 0, 0, 0, 1, 1,
2.364218, -2.937702, 2.126547, 0, 0, 0, 1, 1,
2.364438, 0.1410664, 1.476607, 0, 0, 0, 1, 1,
2.461766, 0.15865, -0.1722776, 0, 0, 0, 1, 1,
2.517589, -3.096939, 1.476673, 1, 1, 1, 1, 1,
2.629256, -0.3046001, 2.257276, 1, 1, 1, 1, 1,
2.650164, 0.9042512, -0.04615186, 1, 1, 1, 1, 1,
2.683505, 0.03816441, 2.496308, 1, 1, 1, 1, 1,
2.701485, 0.7346461, -0.01894762, 1, 1, 1, 1, 1,
2.822057, -0.4322575, 2.508059, 1, 1, 1, 1, 1,
3.575811, -1.138411, 0.2987645, 1, 1, 1, 1, 1
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
var radius = 9.497102;
var distance = 33.35817;
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
mvMatrix.translate( -0.2762036, 0.04057431, 0.2656205 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.35817);
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
