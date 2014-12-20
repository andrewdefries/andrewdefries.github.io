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
-3.571163, 1.563261, -0.5835247, 1, 0, 0, 1,
-3.402078, -0.1517804, -0.9623727, 1, 0.007843138, 0, 1,
-3.343371, 0.6290985, 0.2734047, 1, 0.01176471, 0, 1,
-3.057382, 0.06595813, -1.390032, 1, 0.01960784, 0, 1,
-3.017397, -1.503165, -0.2468244, 1, 0.02352941, 0, 1,
-2.834116, -0.5347342, -2.381984, 1, 0.03137255, 0, 1,
-2.817781, 1.666028, -2.276368, 1, 0.03529412, 0, 1,
-2.778285, 1.132423, -1.92493, 1, 0.04313726, 0, 1,
-2.652977, 0.06566403, -1.871871, 1, 0.04705882, 0, 1,
-2.569222, 0.717381, -0.735512, 1, 0.05490196, 0, 1,
-2.545029, -0.09392688, -1.903624, 1, 0.05882353, 0, 1,
-2.324157, -0.2573843, 0.1836703, 1, 0.06666667, 0, 1,
-2.271928, -0.2231331, -2.461849, 1, 0.07058824, 0, 1,
-2.223283, 0.100044, -2.795498, 1, 0.07843138, 0, 1,
-2.163422, 1.029682, -0.7109718, 1, 0.08235294, 0, 1,
-2.14078, 0.05993731, 0.06961485, 1, 0.09019608, 0, 1,
-2.071784, 0.4075092, -1.143487, 1, 0.09411765, 0, 1,
-2.029919, -0.8982677, 0.05042317, 1, 0.1019608, 0, 1,
-2.014907, -0.2008584, -2.647636, 1, 0.1098039, 0, 1,
-2.014794, -1.304537, -1.976669, 1, 0.1137255, 0, 1,
-2.005339, 0.1894001, -0.9985113, 1, 0.1215686, 0, 1,
-1.983192, 1.79076, -1.051618, 1, 0.1254902, 0, 1,
-1.97795, 0.1811798, -2.458237, 1, 0.1333333, 0, 1,
-1.977469, -0.05437022, -0.1099714, 1, 0.1372549, 0, 1,
-1.960024, 2.45267, -1.812415, 1, 0.145098, 0, 1,
-1.925749, 0.5389721, -0.2058923, 1, 0.1490196, 0, 1,
-1.913864, 0.3264063, -0.4473336, 1, 0.1568628, 0, 1,
-1.902586, 0.2781667, -1.880537, 1, 0.1607843, 0, 1,
-1.888157, -0.0112204, -2.933032, 1, 0.1686275, 0, 1,
-1.832047, 0.3472118, -0.8565168, 1, 0.172549, 0, 1,
-1.814555, 1.41522, -0.4568831, 1, 0.1803922, 0, 1,
-1.795461, 1.026048, -0.8444601, 1, 0.1843137, 0, 1,
-1.778942, -0.6202691, -1.648686, 1, 0.1921569, 0, 1,
-1.761794, 0.914865, -1.418447, 1, 0.1960784, 0, 1,
-1.760651, 0.72967, -1.494221, 1, 0.2039216, 0, 1,
-1.758538, 0.5571436, -1.606301, 1, 0.2117647, 0, 1,
-1.747547, 0.9268627, -0.4726667, 1, 0.2156863, 0, 1,
-1.718079, -1.217015, -1.236644, 1, 0.2235294, 0, 1,
-1.705885, 0.8369429, -2.506269, 1, 0.227451, 0, 1,
-1.702698, -0.1118747, -2.965314, 1, 0.2352941, 0, 1,
-1.693853, 1.435373, -0.5238518, 1, 0.2392157, 0, 1,
-1.687494, -0.06130134, -2.254799, 1, 0.2470588, 0, 1,
-1.661504, -0.09051713, -1.931668, 1, 0.2509804, 0, 1,
-1.659288, 1.081125, -0.5999341, 1, 0.2588235, 0, 1,
-1.658494, 0.2592336, -1.165343, 1, 0.2627451, 0, 1,
-1.649599, -0.07739131, -1.399431, 1, 0.2705882, 0, 1,
-1.643003, -0.7292081, -2.47358, 1, 0.2745098, 0, 1,
-1.634559, 0.1015796, -1.458655, 1, 0.282353, 0, 1,
-1.632797, -0.6045075, -1.850089, 1, 0.2862745, 0, 1,
-1.632145, -0.07648106, -3.146248, 1, 0.2941177, 0, 1,
-1.627756, -0.1661793, -3.609137, 1, 0.3019608, 0, 1,
-1.605771, 0.4569424, -0.1983248, 1, 0.3058824, 0, 1,
-1.589583, -0.1621307, -1.673148, 1, 0.3137255, 0, 1,
-1.587018, 0.912963, -0.7135836, 1, 0.3176471, 0, 1,
-1.58558, 0.5641106, -0.8303863, 1, 0.3254902, 0, 1,
-1.579915, 0.006338457, -0.04771201, 1, 0.3294118, 0, 1,
-1.578388, 0.8157116, -2.713439, 1, 0.3372549, 0, 1,
-1.573562, 0.2466127, -2.239172, 1, 0.3411765, 0, 1,
-1.572349, -0.5318237, -0.7292674, 1, 0.3490196, 0, 1,
-1.563141, -0.2574061, -0.1355778, 1, 0.3529412, 0, 1,
-1.553606, 0.5265357, -3.081095, 1, 0.3607843, 0, 1,
-1.544441, -0.7058849, -1.595486, 1, 0.3647059, 0, 1,
-1.537431, -0.05657605, -3.054026, 1, 0.372549, 0, 1,
-1.532672, -1.100136, -1.578983, 1, 0.3764706, 0, 1,
-1.532258, 0.8124123, -2.093373, 1, 0.3843137, 0, 1,
-1.528864, -0.5125124, -0.9261158, 1, 0.3882353, 0, 1,
-1.524059, 0.4576351, 0.1190909, 1, 0.3960784, 0, 1,
-1.521393, -1.891415, -0.5490579, 1, 0.4039216, 0, 1,
-1.512805, 1.809576, -1.65, 1, 0.4078431, 0, 1,
-1.474386, -0.4552094, -1.976386, 1, 0.4156863, 0, 1,
-1.462789, -0.05838443, -2.535463, 1, 0.4196078, 0, 1,
-1.454898, -0.03600883, -1.193103, 1, 0.427451, 0, 1,
-1.446634, 0.3145714, -2.16554, 1, 0.4313726, 0, 1,
-1.439044, -1.429318, -2.211505, 1, 0.4392157, 0, 1,
-1.431051, -0.0006289664, -2.742039, 1, 0.4431373, 0, 1,
-1.427073, -0.9130478, -1.615627, 1, 0.4509804, 0, 1,
-1.418087, -0.01458548, -0.923603, 1, 0.454902, 0, 1,
-1.410615, -0.2780281, -1.136563, 1, 0.4627451, 0, 1,
-1.407548, -0.6475923, -3.752781, 1, 0.4666667, 0, 1,
-1.400374, -1.576347, -3.364684, 1, 0.4745098, 0, 1,
-1.383529, 0.1127805, 0.1203813, 1, 0.4784314, 0, 1,
-1.382389, -0.7610832, -1.656391, 1, 0.4862745, 0, 1,
-1.374586, 0.4989313, -0.1880172, 1, 0.4901961, 0, 1,
-1.374182, 0.9137871, -2.042984, 1, 0.4980392, 0, 1,
-1.373827, 2.508347, -1.906068, 1, 0.5058824, 0, 1,
-1.370003, -0.7858711, -3.420194, 1, 0.509804, 0, 1,
-1.362135, -0.5244726, -1.223785, 1, 0.5176471, 0, 1,
-1.360323, -0.6263935, -0.9316652, 1, 0.5215687, 0, 1,
-1.357477, -1.019302, -0.8121467, 1, 0.5294118, 0, 1,
-1.356468, 0.4353422, -1.726419, 1, 0.5333334, 0, 1,
-1.35632, -0.8800882, -3.268573, 1, 0.5411765, 0, 1,
-1.352877, -0.2675261, -3.77447, 1, 0.5450981, 0, 1,
-1.334964, 0.2229393, -1.849711, 1, 0.5529412, 0, 1,
-1.332885, 1.272443, -0.262991, 1, 0.5568628, 0, 1,
-1.330478, 0.741084, -0.9663761, 1, 0.5647059, 0, 1,
-1.324319, -0.8633459, -2.205522, 1, 0.5686275, 0, 1,
-1.323243, -1.58049, -3.176781, 1, 0.5764706, 0, 1,
-1.322091, 1.307174, -1.051297, 1, 0.5803922, 0, 1,
-1.321254, -0.256354, -2.606032, 1, 0.5882353, 0, 1,
-1.315592, 0.7563527, -0.09056818, 1, 0.5921569, 0, 1,
-1.314959, 0.8981956, -1.435646, 1, 0.6, 0, 1,
-1.309872, -0.5365967, -1.199964, 1, 0.6078432, 0, 1,
-1.30317, -0.5418991, -1.500884, 1, 0.6117647, 0, 1,
-1.301013, -0.9641371, -3.091509, 1, 0.6196079, 0, 1,
-1.300387, 1.12818, -0.6982031, 1, 0.6235294, 0, 1,
-1.296655, 0.2793162, -1.403591, 1, 0.6313726, 0, 1,
-1.294371, -1.437335, -2.477417, 1, 0.6352941, 0, 1,
-1.293214, -2.044786, -1.904768, 1, 0.6431373, 0, 1,
-1.292079, -1.200237, -1.378406, 1, 0.6470588, 0, 1,
-1.291719, 0.00455418, -3.130222, 1, 0.654902, 0, 1,
-1.290676, -1.050409, -1.425395, 1, 0.6588235, 0, 1,
-1.286408, -1.318928, -1.510029, 1, 0.6666667, 0, 1,
-1.278661, -0.2260269, -1.966862, 1, 0.6705883, 0, 1,
-1.275839, 0.4555176, -1.179387, 1, 0.6784314, 0, 1,
-1.272286, -1.05713, -2.790901, 1, 0.682353, 0, 1,
-1.271391, 0.05121551, -1.391489, 1, 0.6901961, 0, 1,
-1.269768, -0.06206911, -2.015924, 1, 0.6941177, 0, 1,
-1.268676, -0.5370511, -1.75898, 1, 0.7019608, 0, 1,
-1.268387, 2.518296, 0.4087546, 1, 0.7098039, 0, 1,
-1.266398, -0.01525148, -2.605705, 1, 0.7137255, 0, 1,
-1.263545, -1.354454, -2.090885, 1, 0.7215686, 0, 1,
-1.253746, 1.156047, -0.5660889, 1, 0.7254902, 0, 1,
-1.251794, 0.595321, -0.9636589, 1, 0.7333333, 0, 1,
-1.244059, -1.231842, -1.385747, 1, 0.7372549, 0, 1,
-1.241262, -0.1135485, -1.862772, 1, 0.7450981, 0, 1,
-1.23464, -0.8443524, -3.301569, 1, 0.7490196, 0, 1,
-1.2321, 0.01346283, -2.125046, 1, 0.7568628, 0, 1,
-1.230033, -1.525208, -4.060912, 1, 0.7607843, 0, 1,
-1.221488, 0.1331633, -2.537098, 1, 0.7686275, 0, 1,
-1.221118, -1.190889, -1.976934, 1, 0.772549, 0, 1,
-1.215541, 0.7369966, -2.183077, 1, 0.7803922, 0, 1,
-1.202261, -0.8740396, -2.067772, 1, 0.7843137, 0, 1,
-1.197192, -1.633812, -1.332513, 1, 0.7921569, 0, 1,
-1.192162, 1.661117, -3.087577, 1, 0.7960784, 0, 1,
-1.1908, -0.8749136, -3.08402, 1, 0.8039216, 0, 1,
-1.190562, -1.123159, -1.283962, 1, 0.8117647, 0, 1,
-1.177508, 0.9294338, -1.781467, 1, 0.8156863, 0, 1,
-1.158156, 0.1444101, -0.0388137, 1, 0.8235294, 0, 1,
-1.157483, -0.2122065, -2.250079, 1, 0.827451, 0, 1,
-1.14412, 0.9953278, -2.05203, 1, 0.8352941, 0, 1,
-1.140372, 1.764891, -0.0007517778, 1, 0.8392157, 0, 1,
-1.139832, 0.02840608, -1.70637, 1, 0.8470588, 0, 1,
-1.13876, 0.03572785, -2.150607, 1, 0.8509804, 0, 1,
-1.138353, -0.3711615, -1.406554, 1, 0.8588235, 0, 1,
-1.135734, 0.8086186, 0.05341582, 1, 0.8627451, 0, 1,
-1.134138, 0.6091248, -2.249913, 1, 0.8705882, 0, 1,
-1.131757, 1.07818, 0.5075217, 1, 0.8745098, 0, 1,
-1.131135, 0.5124626, -1.492497, 1, 0.8823529, 0, 1,
-1.130623, -0.1446424, -1.963856, 1, 0.8862745, 0, 1,
-1.10721, 1.083694, -2.096419, 1, 0.8941177, 0, 1,
-1.099704, 1.828907, -0.7074514, 1, 0.8980392, 0, 1,
-1.095168, 1.055719, -1.789884, 1, 0.9058824, 0, 1,
-1.092089, -0.2289204, -1.964867, 1, 0.9137255, 0, 1,
-1.079038, 1.285861, -1.342254, 1, 0.9176471, 0, 1,
-1.076519, -2.271477, -2.421996, 1, 0.9254902, 0, 1,
-1.075843, 0.03328237, -2.055833, 1, 0.9294118, 0, 1,
-1.075615, 1.225037, -1.805659, 1, 0.9372549, 0, 1,
-1.074596, 1.390662, -1.234717, 1, 0.9411765, 0, 1,
-1.066143, 0.8438731, 0.1681332, 1, 0.9490196, 0, 1,
-1.064666, -2.628484, -2.198645, 1, 0.9529412, 0, 1,
-1.064535, -1.034614, -1.081848, 1, 0.9607843, 0, 1,
-1.058731, -0.0527198, -2.934569, 1, 0.9647059, 0, 1,
-1.045699, 0.5649097, -0.5608923, 1, 0.972549, 0, 1,
-1.037565, 0.7364351, -1.495872, 1, 0.9764706, 0, 1,
-1.035584, -0.7939295, -1.994124, 1, 0.9843137, 0, 1,
-1.03271, 1.332732, 1.763402, 1, 0.9882353, 0, 1,
-1.032306, -2.710119, -2.77875, 1, 0.9960784, 0, 1,
-1.030727, 0.5378963, -0.7285822, 0.9960784, 1, 0, 1,
-1.019848, 0.2236997, 0.5008363, 0.9921569, 1, 0, 1,
-1.017637, 1.589464, -1.479123, 0.9843137, 1, 0, 1,
-1.013264, 1.896256, 0.01483028, 0.9803922, 1, 0, 1,
-1.011246, -0.4375121, -2.465864, 0.972549, 1, 0, 1,
-1.005947, -0.4152288, -0.7059941, 0.9686275, 1, 0, 1,
-1.005026, -1.256384, -3.279174, 0.9607843, 1, 0, 1,
-1.003515, 0.1797552, -2.354969, 0.9568627, 1, 0, 1,
-0.9982122, 1.352964, -1.661554, 0.9490196, 1, 0, 1,
-0.9980105, -1.377131, -2.342524, 0.945098, 1, 0, 1,
-0.9977289, -2.292521, -2.507667, 0.9372549, 1, 0, 1,
-0.9920916, -0.3208331, -1.259666, 0.9333333, 1, 0, 1,
-0.9920337, -1.141943, -2.901151, 0.9254902, 1, 0, 1,
-0.9763242, -0.003367752, -1.813755, 0.9215686, 1, 0, 1,
-0.9676924, -0.6726601, -1.196624, 0.9137255, 1, 0, 1,
-0.9608665, -0.6497238, -3.475528, 0.9098039, 1, 0, 1,
-0.952576, -0.6967528, -2.154922, 0.9019608, 1, 0, 1,
-0.9516428, 0.04655519, -3.357574, 0.8941177, 1, 0, 1,
-0.951161, -0.8681476, -2.099611, 0.8901961, 1, 0, 1,
-0.9438646, -1.277194, -2.067333, 0.8823529, 1, 0, 1,
-0.942556, 0.8314728, -0.4945074, 0.8784314, 1, 0, 1,
-0.9374264, 0.3566963, -0.7036998, 0.8705882, 1, 0, 1,
-0.9343341, 0.9273244, -0.4739963, 0.8666667, 1, 0, 1,
-0.9320726, -0.6776753, 0.178522, 0.8588235, 1, 0, 1,
-0.9277027, 0.36142, 0.9147898, 0.854902, 1, 0, 1,
-0.9262099, -1.520536, -3.200662, 0.8470588, 1, 0, 1,
-0.9254325, 1.197808, -1.557377, 0.8431373, 1, 0, 1,
-0.9211019, -1.291482, -1.996555, 0.8352941, 1, 0, 1,
-0.9205706, 0.4469397, 0.3346277, 0.8313726, 1, 0, 1,
-0.9177288, 1.447868, 0.9356463, 0.8235294, 1, 0, 1,
-0.9166673, 0.3152331, -0.4403676, 0.8196079, 1, 0, 1,
-0.9112731, 0.4558602, -1.298796, 0.8117647, 1, 0, 1,
-0.8932829, 1.469087, -1.31575, 0.8078431, 1, 0, 1,
-0.8928501, -0.9678509, -2.596934, 0.8, 1, 0, 1,
-0.8914227, -0.8927886, -3.32275, 0.7921569, 1, 0, 1,
-0.8898662, -0.2588024, -2.911899, 0.7882353, 1, 0, 1,
-0.8897363, -1.002848, -1.066955, 0.7803922, 1, 0, 1,
-0.888805, 1.616753, -2.486735, 0.7764706, 1, 0, 1,
-0.8831373, -0.003205629, -1.891086, 0.7686275, 1, 0, 1,
-0.8797801, 0.5774395, -1.069167, 0.7647059, 1, 0, 1,
-0.8779644, 0.5314668, -2.625732, 0.7568628, 1, 0, 1,
-0.8777589, -1.999097, -3.413145, 0.7529412, 1, 0, 1,
-0.8776379, -0.5473897, -1.058613, 0.7450981, 1, 0, 1,
-0.8678424, 0.4773585, -2.667678, 0.7411765, 1, 0, 1,
-0.8663648, 0.6802887, -0.4740182, 0.7333333, 1, 0, 1,
-0.8636895, -0.2855289, -2.932898, 0.7294118, 1, 0, 1,
-0.8601899, -0.8250706, -1.101368, 0.7215686, 1, 0, 1,
-0.8477878, 1.107948, -1.178136, 0.7176471, 1, 0, 1,
-0.8464479, -0.07375114, -2.396494, 0.7098039, 1, 0, 1,
-0.8410125, -0.9873039, -1.844061, 0.7058824, 1, 0, 1,
-0.831063, 0.8651167, -2.495354, 0.6980392, 1, 0, 1,
-0.8243794, 0.3347251, -1.193278, 0.6901961, 1, 0, 1,
-0.8225995, -1.50865, -4.372424, 0.6862745, 1, 0, 1,
-0.8180342, -1.95304, -0.721948, 0.6784314, 1, 0, 1,
-0.8178219, 0.4577641, -1.721765, 0.6745098, 1, 0, 1,
-0.8107655, 0.5391757, -1.756542, 0.6666667, 1, 0, 1,
-0.8100224, -1.022051, -2.986278, 0.6627451, 1, 0, 1,
-0.8088493, 1.498804, -1.040116, 0.654902, 1, 0, 1,
-0.8054, 0.06158948, -0.639061, 0.6509804, 1, 0, 1,
-0.8009467, -0.1351222, -1.837331, 0.6431373, 1, 0, 1,
-0.8007262, -0.2466811, -0.9881256, 0.6392157, 1, 0, 1,
-0.7960435, 0.6203803, -0.4907786, 0.6313726, 1, 0, 1,
-0.7958808, -0.632619, -2.64252, 0.627451, 1, 0, 1,
-0.7919, 0.4683594, -0.5062772, 0.6196079, 1, 0, 1,
-0.7909641, 1.308596, 0.2634911, 0.6156863, 1, 0, 1,
-0.7864656, 0.8871902, 0.9858846, 0.6078432, 1, 0, 1,
-0.7809985, -1.514004, -2.845202, 0.6039216, 1, 0, 1,
-0.7769976, 0.9061486, -1.905108, 0.5960785, 1, 0, 1,
-0.7755166, -0.6200554, -1.728899, 0.5882353, 1, 0, 1,
-0.7729677, -0.08907771, -0.9230127, 0.5843138, 1, 0, 1,
-0.7725248, -0.9065644, -0.4136967, 0.5764706, 1, 0, 1,
-0.769156, 1.166432, -1.377664, 0.572549, 1, 0, 1,
-0.7650114, -0.3516621, -1.296139, 0.5647059, 1, 0, 1,
-0.7571463, 0.08279856, -1.674021, 0.5607843, 1, 0, 1,
-0.7458796, 1.220108, -0.7483867, 0.5529412, 1, 0, 1,
-0.7426645, -0.2980559, -2.157124, 0.5490196, 1, 0, 1,
-0.7415161, -0.9411323, -2.663548, 0.5411765, 1, 0, 1,
-0.7380838, -0.03231666, -1.498704, 0.5372549, 1, 0, 1,
-0.7270861, 0.369936, 0.3584714, 0.5294118, 1, 0, 1,
-0.7249977, -0.3556254, -2.746169, 0.5254902, 1, 0, 1,
-0.7241395, 0.3533372, -1.122464, 0.5176471, 1, 0, 1,
-0.7188321, -0.1032702, -1.786802, 0.5137255, 1, 0, 1,
-0.7154797, -0.6950386, -3.322597, 0.5058824, 1, 0, 1,
-0.7153557, 1.517483, -0.709335, 0.5019608, 1, 0, 1,
-0.7118335, 0.7298115, 0.5862472, 0.4941176, 1, 0, 1,
-0.7107891, 2.203145, 0.2124228, 0.4862745, 1, 0, 1,
-0.7095447, 0.5664288, -3.059211, 0.4823529, 1, 0, 1,
-0.7023764, 0.1304143, -1.831654, 0.4745098, 1, 0, 1,
-0.698466, 0.3981, -0.4838424, 0.4705882, 1, 0, 1,
-0.6977309, -0.2593747, -3.155287, 0.4627451, 1, 0, 1,
-0.6973482, -1.830881, -4.001092, 0.4588235, 1, 0, 1,
-0.6949325, 0.8229568, -1.389103, 0.4509804, 1, 0, 1,
-0.6930119, 0.6612014, -0.7963248, 0.4470588, 1, 0, 1,
-0.6915101, 0.4343826, 1.096989, 0.4392157, 1, 0, 1,
-0.6908901, -0.9117371, -3.417605, 0.4352941, 1, 0, 1,
-0.6851404, 0.1275494, 0.3688302, 0.427451, 1, 0, 1,
-0.6830715, 0.005658229, -2.145136, 0.4235294, 1, 0, 1,
-0.6827991, -0.4997506, -0.1990585, 0.4156863, 1, 0, 1,
-0.6824785, -0.1359496, -3.134956, 0.4117647, 1, 0, 1,
-0.6817055, -0.1042572, -2.753573, 0.4039216, 1, 0, 1,
-0.6752042, 0.009465858, -2.579896, 0.3960784, 1, 0, 1,
-0.6696432, -0.4674067, -2.401504, 0.3921569, 1, 0, 1,
-0.6694013, -0.8042562, -2.710114, 0.3843137, 1, 0, 1,
-0.6690883, 1.517688, -2.698171, 0.3803922, 1, 0, 1,
-0.661196, -0.4525431, -1.542328, 0.372549, 1, 0, 1,
-0.6560359, -0.2036486, -2.097569, 0.3686275, 1, 0, 1,
-0.6542454, 0.7744988, -1.097374, 0.3607843, 1, 0, 1,
-0.6524208, -0.1891893, -0.4339691, 0.3568628, 1, 0, 1,
-0.6447653, -2.631953, -3.115601, 0.3490196, 1, 0, 1,
-0.6436843, 0.7603369, 0.6039519, 0.345098, 1, 0, 1,
-0.6436157, -0.2671193, -0.4947446, 0.3372549, 1, 0, 1,
-0.6304909, -1.259272, -1.848066, 0.3333333, 1, 0, 1,
-0.6257657, -0.3771099, -4.417316, 0.3254902, 1, 0, 1,
-0.6243392, -0.6744879, -2.347239, 0.3215686, 1, 0, 1,
-0.6210917, 0.947318, -0.5569168, 0.3137255, 1, 0, 1,
-0.6200164, 0.4925632, -1.342234, 0.3098039, 1, 0, 1,
-0.6125672, -1.689943, -2.233878, 0.3019608, 1, 0, 1,
-0.6121069, 1.756775, 0.8954565, 0.2941177, 1, 0, 1,
-0.6111689, 0.7337266, -1.425802, 0.2901961, 1, 0, 1,
-0.6084759, 1.188908, -0.7979098, 0.282353, 1, 0, 1,
-0.6046057, -0.9922621, -3.859893, 0.2784314, 1, 0, 1,
-0.601535, 0.3032148, 0.5233589, 0.2705882, 1, 0, 1,
-0.5967552, -0.3603047, -2.104661, 0.2666667, 1, 0, 1,
-0.5911556, 0.1433964, -1.279684, 0.2588235, 1, 0, 1,
-0.590611, 3.476143, 1.190346, 0.254902, 1, 0, 1,
-0.5872526, -0.06371164, -1.743518, 0.2470588, 1, 0, 1,
-0.5797974, 0.6858976, -0.5007321, 0.2431373, 1, 0, 1,
-0.5781297, 1.052577, 0.2100681, 0.2352941, 1, 0, 1,
-0.5739613, -0.6986471, -2.237623, 0.2313726, 1, 0, 1,
-0.5680581, -0.2905954, 0.2975998, 0.2235294, 1, 0, 1,
-0.5667228, -0.4288322, -1.141006, 0.2196078, 1, 0, 1,
-0.5647233, 1.498273, 0.1567975, 0.2117647, 1, 0, 1,
-0.5646033, -0.8783858, -2.805337, 0.2078431, 1, 0, 1,
-0.5631638, 1.703245, 0.415381, 0.2, 1, 0, 1,
-0.5618712, -0.82608, -2.807188, 0.1921569, 1, 0, 1,
-0.5614931, 0.4839442, -2.006113, 0.1882353, 1, 0, 1,
-0.5570457, -1.148563, -1.99655, 0.1803922, 1, 0, 1,
-0.5521795, 0.4734007, -0.07498564, 0.1764706, 1, 0, 1,
-0.5518919, 0.3930368, -0.8037973, 0.1686275, 1, 0, 1,
-0.5488909, -0.2526103, -0.6338517, 0.1647059, 1, 0, 1,
-0.5462209, -0.4985775, -1.547817, 0.1568628, 1, 0, 1,
-0.5456485, 1.126456, -0.1216853, 0.1529412, 1, 0, 1,
-0.5399777, 0.7630842, -1.984304, 0.145098, 1, 0, 1,
-0.5317978, -0.1128337, -2.016257, 0.1411765, 1, 0, 1,
-0.5265141, -0.07303384, -1.364846, 0.1333333, 1, 0, 1,
-0.5246504, -0.4029315, -2.372974, 0.1294118, 1, 0, 1,
-0.522498, 0.2531074, -2.648719, 0.1215686, 1, 0, 1,
-0.5205494, -0.4991004, -1.203867, 0.1176471, 1, 0, 1,
-0.5173798, -1.713728, -3.07382, 0.1098039, 1, 0, 1,
-0.5136635, -1.256201, -3.855986, 0.1058824, 1, 0, 1,
-0.5120929, -0.2395965, -0.4990908, 0.09803922, 1, 0, 1,
-0.5063989, 1.051533, -0.5452735, 0.09019608, 1, 0, 1,
-0.5057983, -0.2166234, -2.160396, 0.08627451, 1, 0, 1,
-0.5046359, 0.259743, -2.068758, 0.07843138, 1, 0, 1,
-0.5009529, 1.715138, -0.2676933, 0.07450981, 1, 0, 1,
-0.4978929, -1.509404, -3.159327, 0.06666667, 1, 0, 1,
-0.4952121, -0.3532137, -1.578089, 0.0627451, 1, 0, 1,
-0.4948364, -0.8408929, -2.075747, 0.05490196, 1, 0, 1,
-0.4906777, -0.8179674, -2.907799, 0.05098039, 1, 0, 1,
-0.4895236, 0.07599732, -1.312662, 0.04313726, 1, 0, 1,
-0.4873677, -1.746112, -3.179941, 0.03921569, 1, 0, 1,
-0.4873247, -0.2454193, -2.387491, 0.03137255, 1, 0, 1,
-0.486637, -0.1798353, -1.401386, 0.02745098, 1, 0, 1,
-0.4841009, 0.05662698, 0.3213933, 0.01960784, 1, 0, 1,
-0.4838691, -1.684392, -4.76165, 0.01568628, 1, 0, 1,
-0.4803896, -1.116877, -3.7592, 0.007843138, 1, 0, 1,
-0.479854, 0.1913274, 0.3696718, 0.003921569, 1, 0, 1,
-0.4684631, 0.1400015, -0.104284, 0, 1, 0.003921569, 1,
-0.459015, -0.09154771, -1.59751, 0, 1, 0.01176471, 1,
-0.4589106, -1.225475, -4.967737, 0, 1, 0.01568628, 1,
-0.4552748, 1.074179, 0.5214939, 0, 1, 0.02352941, 1,
-0.454651, 0.5003444, -1.353224, 0, 1, 0.02745098, 1,
-0.4502087, -1.497285, -4.568968, 0, 1, 0.03529412, 1,
-0.4500291, 0.02840852, -0.3672426, 0, 1, 0.03921569, 1,
-0.4498211, 1.296965, 0.6198581, 0, 1, 0.04705882, 1,
-0.4456373, 2.108649, 0.6722276, 0, 1, 0.05098039, 1,
-0.4424012, 1.281899, -1.459439, 0, 1, 0.05882353, 1,
-0.4406493, 0.6256413, -0.3480067, 0, 1, 0.0627451, 1,
-0.440325, -0.3799969, -1.661435, 0, 1, 0.07058824, 1,
-0.4370932, -0.4659114, -3.204564, 0, 1, 0.07450981, 1,
-0.4357708, 1.69875, -0.9275937, 0, 1, 0.08235294, 1,
-0.4307378, 0.4118423, -0.5249422, 0, 1, 0.08627451, 1,
-0.4299021, -0.3843667, -3.313698, 0, 1, 0.09411765, 1,
-0.4269601, 1.221899, -1.069746, 0, 1, 0.1019608, 1,
-0.4191349, -0.6325659, -4.060691, 0, 1, 0.1058824, 1,
-0.418573, -1.651013, -3.153029, 0, 1, 0.1137255, 1,
-0.4163975, 1.274333, 0.471763, 0, 1, 0.1176471, 1,
-0.4093004, -0.4028886, -1.043222, 0, 1, 0.1254902, 1,
-0.408465, -0.1469266, -2.581682, 0, 1, 0.1294118, 1,
-0.4080867, -0.3286751, -3.805979, 0, 1, 0.1372549, 1,
-0.4035344, 2.069724, 0.3876818, 0, 1, 0.1411765, 1,
-0.3948336, -1.422318, -3.448968, 0, 1, 0.1490196, 1,
-0.3912653, 0.4955244, -1.583553, 0, 1, 0.1529412, 1,
-0.3911791, -1.663731, -2.4486, 0, 1, 0.1607843, 1,
-0.3892258, 0.2618511, -0.1001447, 0, 1, 0.1647059, 1,
-0.3886565, 1.301715, 0.1505269, 0, 1, 0.172549, 1,
-0.3873001, -0.100793, -2.925824, 0, 1, 0.1764706, 1,
-0.3848748, -2.041749, -1.751389, 0, 1, 0.1843137, 1,
-0.3801688, 0.3734342, 0.05639629, 0, 1, 0.1882353, 1,
-0.3786434, 0.08179104, -2.146052, 0, 1, 0.1960784, 1,
-0.377979, 0.6643508, -1.550163, 0, 1, 0.2039216, 1,
-0.3741561, 1.91537, -0.458838, 0, 1, 0.2078431, 1,
-0.370309, -2.360229, -2.98972, 0, 1, 0.2156863, 1,
-0.3610919, 0.6088163, -0.7099051, 0, 1, 0.2196078, 1,
-0.360606, -0.6979846, -4.306757, 0, 1, 0.227451, 1,
-0.36026, -0.6705018, -2.063317, 0, 1, 0.2313726, 1,
-0.3580204, 0.2713825, -0.8890398, 0, 1, 0.2392157, 1,
-0.3580169, 1.271227, -0.1713928, 0, 1, 0.2431373, 1,
-0.3578978, 0.01394736, 0.6251314, 0, 1, 0.2509804, 1,
-0.3551132, -1.15201, -3.416618, 0, 1, 0.254902, 1,
-0.3541121, -0.4090258, -1.9683, 0, 1, 0.2627451, 1,
-0.3535658, -2.472637, -4.319381, 0, 1, 0.2666667, 1,
-0.3533443, 0.292248, -2.105256, 0, 1, 0.2745098, 1,
-0.3500967, -0.6866676, -4.157273, 0, 1, 0.2784314, 1,
-0.3488157, -0.1090347, -1.677286, 0, 1, 0.2862745, 1,
-0.3484678, 1.387416, -1.892981, 0, 1, 0.2901961, 1,
-0.3474963, -1.141976, -2.420176, 0, 1, 0.2980392, 1,
-0.3467905, 1.265086, 0.503023, 0, 1, 0.3058824, 1,
-0.3442284, 0.2396601, -1.493925, 0, 1, 0.3098039, 1,
-0.3440003, 0.3378191, 0.7556618, 0, 1, 0.3176471, 1,
-0.3416587, -0.845651, -3.048182, 0, 1, 0.3215686, 1,
-0.3399701, 1.671831, 1.215307, 0, 1, 0.3294118, 1,
-0.3386923, -0.2922716, -1.952734, 0, 1, 0.3333333, 1,
-0.3312086, 0.4886677, -1.327761, 0, 1, 0.3411765, 1,
-0.3301619, -0.5104646, -3.463071, 0, 1, 0.345098, 1,
-0.3278962, -0.4246088, -2.038746, 0, 1, 0.3529412, 1,
-0.3251105, -0.3447056, -2.560462, 0, 1, 0.3568628, 1,
-0.3246905, 1.218714, 0.4764338, 0, 1, 0.3647059, 1,
-0.3240764, -2.237521, -2.471054, 0, 1, 0.3686275, 1,
-0.3206311, 0.7294695, -2.478027, 0, 1, 0.3764706, 1,
-0.3192996, -0.5863401, -2.548021, 0, 1, 0.3803922, 1,
-0.3190928, -0.9195074, -4.530128, 0, 1, 0.3882353, 1,
-0.3168483, 0.07036249, -3.349176, 0, 1, 0.3921569, 1,
-0.3125594, -0.6113684, -4.636413, 0, 1, 0.4, 1,
-0.3108742, -0.6739938, -1.376974, 0, 1, 0.4078431, 1,
-0.3105288, -1.228118, -4.268696, 0, 1, 0.4117647, 1,
-0.3065272, 0.2403991, 0.1985918, 0, 1, 0.4196078, 1,
-0.305171, -1.597563, -3.58037, 0, 1, 0.4235294, 1,
-0.304837, -0.6884146, -1.493777, 0, 1, 0.4313726, 1,
-0.3044997, -0.4239926, -2.87743, 0, 1, 0.4352941, 1,
-0.3037745, 0.631423, 1.273253, 0, 1, 0.4431373, 1,
-0.3025887, -0.1697804, -2.995506, 0, 1, 0.4470588, 1,
-0.3019165, 0.07513608, -0.5058271, 0, 1, 0.454902, 1,
-0.29394, -1.010415, -3.800341, 0, 1, 0.4588235, 1,
-0.2904978, -1.171466, -2.355051, 0, 1, 0.4666667, 1,
-0.2899556, -0.9724413, -3.391943, 0, 1, 0.4705882, 1,
-0.289028, 1.406142, 0.844389, 0, 1, 0.4784314, 1,
-0.2876717, -0.4163661, -2.181013, 0, 1, 0.4823529, 1,
-0.2863986, -1.199895, -1.558618, 0, 1, 0.4901961, 1,
-0.2815067, -1.254125, -1.08858, 0, 1, 0.4941176, 1,
-0.280892, -0.0497677, -1.099797, 0, 1, 0.5019608, 1,
-0.2762614, -0.4782432, -2.216473, 0, 1, 0.509804, 1,
-0.2682721, 0.9808065, -0.7179976, 0, 1, 0.5137255, 1,
-0.2663749, -0.0155323, -0.5260726, 0, 1, 0.5215687, 1,
-0.2660747, -0.3366883, -2.839747, 0, 1, 0.5254902, 1,
-0.2610621, -1.527335, -4.246053, 0, 1, 0.5333334, 1,
-0.2571976, 1.060999, -0.03868563, 0, 1, 0.5372549, 1,
-0.2554506, -0.06640159, -0.9186202, 0, 1, 0.5450981, 1,
-0.2543757, 1.000269, -0.9542919, 0, 1, 0.5490196, 1,
-0.2517945, -0.6157931, -2.72569, 0, 1, 0.5568628, 1,
-0.2507026, 0.1294391, -2.43761, 0, 1, 0.5607843, 1,
-0.2488149, 0.100213, -0.326782, 0, 1, 0.5686275, 1,
-0.2339964, 0.01453918, -0.6112644, 0, 1, 0.572549, 1,
-0.233491, 2.218352, -0.7943851, 0, 1, 0.5803922, 1,
-0.2330419, 0.4548421, 0.5054018, 0, 1, 0.5843138, 1,
-0.2276011, 0.5559763, -1.485489, 0, 1, 0.5921569, 1,
-0.2270092, -0.3342471, -1.480077, 0, 1, 0.5960785, 1,
-0.2258596, 0.1042288, -1.181225, 0, 1, 0.6039216, 1,
-0.2249132, 1.990834, 0.7312481, 0, 1, 0.6117647, 1,
-0.2248482, -0.4857119, -3.382775, 0, 1, 0.6156863, 1,
-0.2175664, -2.117753, -4.035766, 0, 1, 0.6235294, 1,
-0.2160946, -0.9390709, -4.229206, 0, 1, 0.627451, 1,
-0.2156379, -0.5550635, -3.621137, 0, 1, 0.6352941, 1,
-0.2099838, -0.8972406, -2.50388, 0, 1, 0.6392157, 1,
-0.2069554, -1.058037, -2.578958, 0, 1, 0.6470588, 1,
-0.2046423, -0.9442865, -2.771483, 0, 1, 0.6509804, 1,
-0.2039256, -1.237268, -2.624434, 0, 1, 0.6588235, 1,
-0.2030055, -0.2449364, -2.811008, 0, 1, 0.6627451, 1,
-0.1990049, -1.792468, -4.616987, 0, 1, 0.6705883, 1,
-0.1934737, 1.312863, -1.289232, 0, 1, 0.6745098, 1,
-0.1929956, -0.2870986, -3.269401, 0, 1, 0.682353, 1,
-0.1892559, -0.8527117, -3.812755, 0, 1, 0.6862745, 1,
-0.1841409, 1.146692, -1.884425, 0, 1, 0.6941177, 1,
-0.1799718, 0.5722037, 0.3713324, 0, 1, 0.7019608, 1,
-0.179113, -0.1873072, -2.744189, 0, 1, 0.7058824, 1,
-0.176486, -0.01120657, -1.428838, 0, 1, 0.7137255, 1,
-0.1762827, 0.2944877, -1.130032, 0, 1, 0.7176471, 1,
-0.1744518, -0.5127338, -1.810644, 0, 1, 0.7254902, 1,
-0.1743081, 0.8460037, -1.221943, 0, 1, 0.7294118, 1,
-0.1740241, -1.854534, -2.777424, 0, 1, 0.7372549, 1,
-0.1707409, -0.5609476, -3.5019, 0, 1, 0.7411765, 1,
-0.1682224, -0.6051202, -2.410974, 0, 1, 0.7490196, 1,
-0.1669706, -2.081998, -3.603777, 0, 1, 0.7529412, 1,
-0.1643391, 0.2456351, -2.477257, 0, 1, 0.7607843, 1,
-0.1527163, -1.05036, -2.697099, 0, 1, 0.7647059, 1,
-0.1524669, -0.5016502, -1.700462, 0, 1, 0.772549, 1,
-0.1510599, 0.09247424, -1.508448, 0, 1, 0.7764706, 1,
-0.1438657, -0.1552468, -1.851941, 0, 1, 0.7843137, 1,
-0.1366843, 0.5623637, 0.08401614, 0, 1, 0.7882353, 1,
-0.1308188, -0.01574238, -1.469342, 0, 1, 0.7960784, 1,
-0.1306372, 0.2960086, -0.4775127, 0, 1, 0.8039216, 1,
-0.1296228, 0.6385679, -0.595315, 0, 1, 0.8078431, 1,
-0.1267048, -0.2106023, -3.893816, 0, 1, 0.8156863, 1,
-0.1262769, 0.6514909, -1.257703, 0, 1, 0.8196079, 1,
-0.1217639, -0.4270313, -4.848988, 0, 1, 0.827451, 1,
-0.1187811, -1.04299, -2.988964, 0, 1, 0.8313726, 1,
-0.1184446, 2.0717, 1.513622, 0, 1, 0.8392157, 1,
-0.114624, -0.4300724, -3.30057, 0, 1, 0.8431373, 1,
-0.1093244, -0.1244047, -2.990675, 0, 1, 0.8509804, 1,
-0.1092173, 0.08095567, -0.6014246, 0, 1, 0.854902, 1,
-0.1023569, -0.9561042, -2.950439, 0, 1, 0.8627451, 1,
-0.09330969, -0.177209, -1.952449, 0, 1, 0.8666667, 1,
-0.093292, -1.10237, -3.783514, 0, 1, 0.8745098, 1,
-0.08963183, -0.2710174, -4.524573, 0, 1, 0.8784314, 1,
-0.08841899, -0.5298171, -2.926011, 0, 1, 0.8862745, 1,
-0.08736505, -0.06151379, -2.153002, 0, 1, 0.8901961, 1,
-0.08328506, -1.326314, -1.715288, 0, 1, 0.8980392, 1,
-0.0822909, 0.7551157, 0.9781159, 0, 1, 0.9058824, 1,
-0.0794764, -0.6315964, -4.48192, 0, 1, 0.9098039, 1,
-0.07571381, 0.3809168, 1.139459, 0, 1, 0.9176471, 1,
-0.07514974, 0.1708014, -0.5333068, 0, 1, 0.9215686, 1,
-0.07425889, 1.101461, 0.6406363, 0, 1, 0.9294118, 1,
-0.07398286, -2.322516, -2.866287, 0, 1, 0.9333333, 1,
-0.0713497, 0.8972392, 1.460615, 0, 1, 0.9411765, 1,
-0.07027755, 1.014226, 2.265253, 0, 1, 0.945098, 1,
-0.06824119, 0.6282975, 0.9271572, 0, 1, 0.9529412, 1,
-0.06780621, -1.087375, -3.207526, 0, 1, 0.9568627, 1,
-0.06533023, 0.5750195, 0.3075356, 0, 1, 0.9647059, 1,
-0.06351402, -0.4822506, -4.143263, 0, 1, 0.9686275, 1,
-0.06201638, 0.9886873, 1.272892, 0, 1, 0.9764706, 1,
-0.06127515, 0.2967914, 0.02602923, 0, 1, 0.9803922, 1,
-0.05905171, -0.9788221, -3.660637, 0, 1, 0.9882353, 1,
-0.05696514, -1.430041, -3.285504, 0, 1, 0.9921569, 1,
-0.05620778, -0.9774544, -2.039352, 0, 1, 1, 1,
-0.05469538, -0.870162, -1.752981, 0, 0.9921569, 1, 1,
-0.05146172, -0.8003435, -4.022488, 0, 0.9882353, 1, 1,
-0.05031031, -0.932661, -3.653527, 0, 0.9803922, 1, 1,
-0.04751556, 0.09317087, 1.800441, 0, 0.9764706, 1, 1,
-0.04335176, 0.8773501, -0.1151488, 0, 0.9686275, 1, 1,
-0.04305697, 0.6643616, -1.619446, 0, 0.9647059, 1, 1,
-0.04108857, 0.06117366, -2.443856, 0, 0.9568627, 1, 1,
-0.03661047, 0.08323328, 0.950721, 0, 0.9529412, 1, 1,
-0.03551029, -1.630307, -4.100529, 0, 0.945098, 1, 1,
-0.03459259, 0.06982784, 0.1172384, 0, 0.9411765, 1, 1,
-0.03348319, 0.2842918, 1.171611, 0, 0.9333333, 1, 1,
-0.03037616, 0.7107322, -1.039539, 0, 0.9294118, 1, 1,
-0.02865096, 1.328277, -0.613039, 0, 0.9215686, 1, 1,
-0.02609574, 0.1635652, 1.340999, 0, 0.9176471, 1, 1,
-0.01712571, 0.8192827, 1.01066, 0, 0.9098039, 1, 1,
-0.0147066, -0.05307708, -2.371866, 0, 0.9058824, 1, 1,
-0.01308967, 0.7381027, 0.5820091, 0, 0.8980392, 1, 1,
-0.01149921, -1.356206, -1.962195, 0, 0.8901961, 1, 1,
-0.01072221, 0.2208136, -0.5443053, 0, 0.8862745, 1, 1,
-0.009795518, 1.132095, -0.5361293, 0, 0.8784314, 1, 1,
-0.007366427, 1.075038, -0.2028315, 0, 0.8745098, 1, 1,
-0.005613144, 1.170047, -0.8728597, 0, 0.8666667, 1, 1,
-0.005007371, 0.2426991, -0.6412969, 0, 0.8627451, 1, 1,
-0.002067422, -0.01460543, -2.936004, 0, 0.854902, 1, 1,
0.003553689, -0.9961709, 3.089582, 0, 0.8509804, 1, 1,
0.003739775, 0.649868, 0.2136609, 0, 0.8431373, 1, 1,
0.004002176, -1.284734, 4.091755, 0, 0.8392157, 1, 1,
0.006752516, -0.6372032, 3.761147, 0, 0.8313726, 1, 1,
0.01319256, 0.8896701, -2.355677, 0, 0.827451, 1, 1,
0.01325765, -1.143779, 4.335776, 0, 0.8196079, 1, 1,
0.01675242, -0.755425, 3.30021, 0, 0.8156863, 1, 1,
0.01823915, 0.121054, 2.241674, 0, 0.8078431, 1, 1,
0.0187098, -1.025518, 4.397069, 0, 0.8039216, 1, 1,
0.0189867, 0.6139762, -0.1450551, 0, 0.7960784, 1, 1,
0.01904547, -0.740675, 3.052911, 0, 0.7882353, 1, 1,
0.0207344, 0.4329104, 1.002532, 0, 0.7843137, 1, 1,
0.0264071, 0.7588415, -0.7953977, 0, 0.7764706, 1, 1,
0.02978542, 1.255804, -0.3442273, 0, 0.772549, 1, 1,
0.03148637, -3.221887, 2.484894, 0, 0.7647059, 1, 1,
0.03282664, 0.2993356, 0.2022329, 0, 0.7607843, 1, 1,
0.035606, 0.4714001, -0.4150157, 0, 0.7529412, 1, 1,
0.03923369, -1.952724, 2.157359, 0, 0.7490196, 1, 1,
0.04001967, 0.9313445, -1.01777, 0, 0.7411765, 1, 1,
0.04514233, 0.2171424, 0.6964384, 0, 0.7372549, 1, 1,
0.0452176, 1.817186, -0.1693511, 0, 0.7294118, 1, 1,
0.04735839, 0.5639441, -1.432324, 0, 0.7254902, 1, 1,
0.05421269, 0.06902473, -0.3649524, 0, 0.7176471, 1, 1,
0.05450545, 0.3110107, 0.9882107, 0, 0.7137255, 1, 1,
0.05506112, 0.4546535, 0.8662648, 0, 0.7058824, 1, 1,
0.05598056, -1.321336, 3.684265, 0, 0.6980392, 1, 1,
0.05701143, 0.8082452, 0.4506078, 0, 0.6941177, 1, 1,
0.06010748, 0.1343984, 0.7488972, 0, 0.6862745, 1, 1,
0.06303589, 0.8867774, -1.334383, 0, 0.682353, 1, 1,
0.06675844, -0.4497364, 1.998397, 0, 0.6745098, 1, 1,
0.07076203, 1.775967, -0.2825983, 0, 0.6705883, 1, 1,
0.07717509, -0.9119149, 3.496607, 0, 0.6627451, 1, 1,
0.07805841, -0.8675672, 2.806591, 0, 0.6588235, 1, 1,
0.07988694, 0.3166877, 0.7953098, 0, 0.6509804, 1, 1,
0.08132694, -0.3118693, 3.35094, 0, 0.6470588, 1, 1,
0.08318247, -0.5767608, 2.321837, 0, 0.6392157, 1, 1,
0.08543742, -1.967752, 1.836216, 0, 0.6352941, 1, 1,
0.08675831, 0.7785156, -0.6743932, 0, 0.627451, 1, 1,
0.09444961, -1.282808, 3.326519, 0, 0.6235294, 1, 1,
0.09669629, -0.7317216, 3.695976, 0, 0.6156863, 1, 1,
0.09750379, 0.5299972, -1.015293, 0, 0.6117647, 1, 1,
0.101327, 0.6891294, 0.3469203, 0, 0.6039216, 1, 1,
0.1030089, -0.3511087, 3.84204, 0, 0.5960785, 1, 1,
0.1053062, 0.1509057, 0.6202866, 0, 0.5921569, 1, 1,
0.1055501, -0.6030504, 2.103509, 0, 0.5843138, 1, 1,
0.1062627, 1.184435, 1.921136, 0, 0.5803922, 1, 1,
0.1064647, -0.4630587, 2.756011, 0, 0.572549, 1, 1,
0.1070085, -2.417043, 1.411842, 0, 0.5686275, 1, 1,
0.1085963, 0.5884751, 0.1810225, 0, 0.5607843, 1, 1,
0.1175334, -0.257863, 3.087071, 0, 0.5568628, 1, 1,
0.1212972, -0.05106819, 3.099943, 0, 0.5490196, 1, 1,
0.1295285, -1.889887, 1.300445, 0, 0.5450981, 1, 1,
0.131774, 0.6733254, -0.8566157, 0, 0.5372549, 1, 1,
0.1344198, 0.4768881, 1.166498, 0, 0.5333334, 1, 1,
0.1352328, -0.4326358, 2.600235, 0, 0.5254902, 1, 1,
0.1378806, 0.2005654, 0.371667, 0, 0.5215687, 1, 1,
0.1434134, 1.543403, -1.122835, 0, 0.5137255, 1, 1,
0.1442622, 1.205397, -0.3340228, 0, 0.509804, 1, 1,
0.1454289, -0.4724283, 3.082319, 0, 0.5019608, 1, 1,
0.1489249, -0.5907449, 3.487387, 0, 0.4941176, 1, 1,
0.1490895, -1.052766, 1.138296, 0, 0.4901961, 1, 1,
0.1516367, 0.6247394, -1.050604, 0, 0.4823529, 1, 1,
0.1572681, 0.1027429, -0.3428941, 0, 0.4784314, 1, 1,
0.1619275, -0.6377512, 2.190529, 0, 0.4705882, 1, 1,
0.1641257, 1.124552, 0.4472654, 0, 0.4666667, 1, 1,
0.1643197, 1.080718, -0.6374986, 0, 0.4588235, 1, 1,
0.1674498, 0.8635026, 1.549435, 0, 0.454902, 1, 1,
0.1691442, -0.7325029, 3.947143, 0, 0.4470588, 1, 1,
0.1705812, 1.110265, 1.141103, 0, 0.4431373, 1, 1,
0.1716527, 0.2016006, -0.1322031, 0, 0.4352941, 1, 1,
0.1726796, -0.5149187, 4.721653, 0, 0.4313726, 1, 1,
0.1727192, 0.6074706, 0.7146816, 0, 0.4235294, 1, 1,
0.1727814, 0.4595269, 0.3427305, 0, 0.4196078, 1, 1,
0.1767282, -0.6003445, 2.205137, 0, 0.4117647, 1, 1,
0.1768556, 0.6276239, 1.33144, 0, 0.4078431, 1, 1,
0.1773443, 1.450977, -1.967685, 0, 0.4, 1, 1,
0.1795228, -0.2305759, 3.497916, 0, 0.3921569, 1, 1,
0.1796311, 0.2803474, 1.570521, 0, 0.3882353, 1, 1,
0.1813002, 1.365075, 1.834955, 0, 0.3803922, 1, 1,
0.1896851, -0.1767637, 0.3986662, 0, 0.3764706, 1, 1,
0.1948473, -1.165014, 3.510333, 0, 0.3686275, 1, 1,
0.1962265, -0.5413353, 4.412838, 0, 0.3647059, 1, 1,
0.2022773, -0.4390885, 1.648068, 0, 0.3568628, 1, 1,
0.2044811, 1.526212, 0.6147452, 0, 0.3529412, 1, 1,
0.2112943, -1.778237, 3.663528, 0, 0.345098, 1, 1,
0.2172654, -0.08647148, 0.5321857, 0, 0.3411765, 1, 1,
0.2191413, -0.1309406, 2.980613, 0, 0.3333333, 1, 1,
0.2233782, -0.6420285, 4.195756, 0, 0.3294118, 1, 1,
0.2253828, 1.031769, 0.05677034, 0, 0.3215686, 1, 1,
0.2271304, -0.7171955, 3.245262, 0, 0.3176471, 1, 1,
0.2303754, -0.2255279, 2.1303, 0, 0.3098039, 1, 1,
0.2320148, -0.3678161, 3.524767, 0, 0.3058824, 1, 1,
0.2356246, 0.5925696, -1.066177, 0, 0.2980392, 1, 1,
0.2358219, -0.7605536, 4.937476, 0, 0.2901961, 1, 1,
0.2384629, 0.5911152, 0.9698086, 0, 0.2862745, 1, 1,
0.2390987, -0.6043901, 4.982025, 0, 0.2784314, 1, 1,
0.2393641, 0.835377, -0.3309437, 0, 0.2745098, 1, 1,
0.241193, 0.6553992, -0.8138733, 0, 0.2666667, 1, 1,
0.2442351, -0.2616668, 2.955416, 0, 0.2627451, 1, 1,
0.2476109, -1.953879, 3.316003, 0, 0.254902, 1, 1,
0.2548946, -1.677167, 2.711952, 0, 0.2509804, 1, 1,
0.2573344, 1.876406, 0.763923, 0, 0.2431373, 1, 1,
0.2594681, 0.1580449, 1.713122, 0, 0.2392157, 1, 1,
0.2603454, -0.5920519, 3.545782, 0, 0.2313726, 1, 1,
0.2611046, 1.879849, 0.3440255, 0, 0.227451, 1, 1,
0.2634085, -0.6743636, 2.964108, 0, 0.2196078, 1, 1,
0.2636478, 0.3891839, 0.6820021, 0, 0.2156863, 1, 1,
0.2667654, -0.09026848, 1.057886, 0, 0.2078431, 1, 1,
0.2713976, 1.867058, -0.7988465, 0, 0.2039216, 1, 1,
0.2722068, 0.6061217, 1.454344, 0, 0.1960784, 1, 1,
0.27433, -0.8497794, 2.64009, 0, 0.1882353, 1, 1,
0.2764903, -0.2763735, 2.177548, 0, 0.1843137, 1, 1,
0.2777496, -0.2258632, 2.432752, 0, 0.1764706, 1, 1,
0.281841, -0.09082939, 2.348605, 0, 0.172549, 1, 1,
0.2852399, -0.2640786, 2.513417, 0, 0.1647059, 1, 1,
0.2870516, 0.7878159, -0.09358044, 0, 0.1607843, 1, 1,
0.2888907, 0.5786734, -1.35501, 0, 0.1529412, 1, 1,
0.2908179, 0.7076088, -0.4852323, 0, 0.1490196, 1, 1,
0.3015697, 0.3471299, 0.1367023, 0, 0.1411765, 1, 1,
0.3019828, 0.8618302, 2.715869, 0, 0.1372549, 1, 1,
0.3068904, 1.330416, 0.01620407, 0, 0.1294118, 1, 1,
0.3131974, 1.788904, -1.533967, 0, 0.1254902, 1, 1,
0.3174473, -0.9878403, 5.032934, 0, 0.1176471, 1, 1,
0.3220292, 0.4949616, -0.2054223, 0, 0.1137255, 1, 1,
0.3297542, -1.592653, 1.30828, 0, 0.1058824, 1, 1,
0.3329387, 1.743559, 0.3942494, 0, 0.09803922, 1, 1,
0.3353398, 0.9836601, 0.4627313, 0, 0.09411765, 1, 1,
0.3454988, -0.2906565, 1.02854, 0, 0.08627451, 1, 1,
0.3526044, 0.1535214, 3.120083, 0, 0.08235294, 1, 1,
0.3542196, -1.206589, 2.377182, 0, 0.07450981, 1, 1,
0.3552645, 0.09430026, 1.593449, 0, 0.07058824, 1, 1,
0.3613802, 0.9520636, 0.8677464, 0, 0.0627451, 1, 1,
0.3617799, 0.9623284, 2.003036, 0, 0.05882353, 1, 1,
0.3621257, 0.2348492, 1.979182, 0, 0.05098039, 1, 1,
0.3645663, 0.9424437, 0.6483108, 0, 0.04705882, 1, 1,
0.3668, 1.35955, -0.1856579, 0, 0.03921569, 1, 1,
0.3678001, -0.8278337, 3.027243, 0, 0.03529412, 1, 1,
0.371849, 0.6793288, 1.67081, 0, 0.02745098, 1, 1,
0.3731841, -0.3111855, 1.174326, 0, 0.02352941, 1, 1,
0.3765984, -0.4118021, 0.6779637, 0, 0.01568628, 1, 1,
0.3771612, -0.380217, 0.2684149, 0, 0.01176471, 1, 1,
0.3772733, -0.4787202, 3.783706, 0, 0.003921569, 1, 1,
0.3790028, -1.009207, 4.595785, 0.003921569, 0, 1, 1,
0.3815419, 1.416229, -1.672161, 0.007843138, 0, 1, 1,
0.3853874, -0.6916692, 3.270749, 0.01568628, 0, 1, 1,
0.394174, 0.5615269, 0.2890635, 0.01960784, 0, 1, 1,
0.3958589, -1.082552, 2.430868, 0.02745098, 0, 1, 1,
0.4010834, 1.566494, 0.2422148, 0.03137255, 0, 1, 1,
0.4053842, 0.4371199, -0.1317106, 0.03921569, 0, 1, 1,
0.4062376, 1.482788, -0.9590117, 0.04313726, 0, 1, 1,
0.4129933, 1.43512, -0.2331226, 0.05098039, 0, 1, 1,
0.4166812, -0.6926605, 2.619458, 0.05490196, 0, 1, 1,
0.4173553, -0.2744757, -0.04669547, 0.0627451, 0, 1, 1,
0.4196405, -1.378496, 3.113992, 0.06666667, 0, 1, 1,
0.4198419, -0.4283585, 2.998795, 0.07450981, 0, 1, 1,
0.4237252, -1.730987, 2.89312, 0.07843138, 0, 1, 1,
0.4294118, 0.6362268, -1.683595, 0.08627451, 0, 1, 1,
0.4332845, 0.2052942, 1.874218, 0.09019608, 0, 1, 1,
0.4338157, 0.1849384, 0.05193098, 0.09803922, 0, 1, 1,
0.4346797, 0.7224083, 0.0608998, 0.1058824, 0, 1, 1,
0.4351229, -2.109468, 4.450986, 0.1098039, 0, 1, 1,
0.437304, 0.7953879, 1.435837, 0.1176471, 0, 1, 1,
0.439125, -0.04587121, 1.308338, 0.1215686, 0, 1, 1,
0.4462157, 0.3807143, 1.751831, 0.1294118, 0, 1, 1,
0.4476421, -1.581765, 3.582436, 0.1333333, 0, 1, 1,
0.450737, -0.006091501, 0.8412186, 0.1411765, 0, 1, 1,
0.4564875, -1.202904, 0.4367245, 0.145098, 0, 1, 1,
0.4614579, 0.07040568, 2.130089, 0.1529412, 0, 1, 1,
0.4618434, -0.0470568, 1.550705, 0.1568628, 0, 1, 1,
0.4624196, 0.2163114, 2.318457, 0.1647059, 0, 1, 1,
0.4626496, 1.979364, -0.6685819, 0.1686275, 0, 1, 1,
0.4638865, 1.971471, 0.8263345, 0.1764706, 0, 1, 1,
0.4639295, -1.38576, 4.072977, 0.1803922, 0, 1, 1,
0.4642387, 0.4236124, -0.5335159, 0.1882353, 0, 1, 1,
0.4706526, 0.09722941, 2.510397, 0.1921569, 0, 1, 1,
0.4724689, -0.06969783, 1.039121, 0.2, 0, 1, 1,
0.4737155, 0.4314174, 0.7259752, 0.2078431, 0, 1, 1,
0.4747256, 0.8155698, -0.8326529, 0.2117647, 0, 1, 1,
0.4749649, -0.6238, 2.771025, 0.2196078, 0, 1, 1,
0.475869, -0.3154947, 0.3296521, 0.2235294, 0, 1, 1,
0.4824651, -0.9739308, 2.180332, 0.2313726, 0, 1, 1,
0.4886647, -0.0668451, 0.1828304, 0.2352941, 0, 1, 1,
0.4894162, 1.016804, 0.2712794, 0.2431373, 0, 1, 1,
0.4900801, -0.4170941, 2.606508, 0.2470588, 0, 1, 1,
0.4925914, -0.7603686, 1.911753, 0.254902, 0, 1, 1,
0.4926039, -0.7504653, 2.136852, 0.2588235, 0, 1, 1,
0.5035221, -0.9795068, 2.663764, 0.2666667, 0, 1, 1,
0.5043153, -0.9217824, 2.859804, 0.2705882, 0, 1, 1,
0.5062301, -1.028173, 1.953385, 0.2784314, 0, 1, 1,
0.5082719, 1.133701, 0.9523964, 0.282353, 0, 1, 1,
0.5092273, -0.1373161, 2.035746, 0.2901961, 0, 1, 1,
0.510571, -0.6023912, 3.262645, 0.2941177, 0, 1, 1,
0.5178925, 0.38091, 1.952192, 0.3019608, 0, 1, 1,
0.5186257, -1.110073, 4.200524, 0.3098039, 0, 1, 1,
0.520924, -0.4428568, 1.55853, 0.3137255, 0, 1, 1,
0.5261613, 1.172135, 1.119685, 0.3215686, 0, 1, 1,
0.5296916, -0.973553, 1.725374, 0.3254902, 0, 1, 1,
0.5338186, 1.748489, 0.1307865, 0.3333333, 0, 1, 1,
0.5371442, 1.692502, -0.5563894, 0.3372549, 0, 1, 1,
0.5385936, -0.2979446, 2.332838, 0.345098, 0, 1, 1,
0.5436379, -1.034696, 3.132614, 0.3490196, 0, 1, 1,
0.5442337, 2.226453, 0.965624, 0.3568628, 0, 1, 1,
0.5458643, 0.9145384, 1.008695, 0.3607843, 0, 1, 1,
0.5482736, 0.1611782, -0.01782053, 0.3686275, 0, 1, 1,
0.5486714, 0.160728, 1.670522, 0.372549, 0, 1, 1,
0.5507294, 0.04729607, 1.259073, 0.3803922, 0, 1, 1,
0.5563228, 1.164624, -0.03968453, 0.3843137, 0, 1, 1,
0.5653955, -0.7601934, 4.635859, 0.3921569, 0, 1, 1,
0.5664805, 0.669712, 0.9529579, 0.3960784, 0, 1, 1,
0.568122, 0.3261158, 1.021036, 0.4039216, 0, 1, 1,
0.5786964, 0.6074891, 0.9867619, 0.4117647, 0, 1, 1,
0.5835617, 1.8082, 1.227487, 0.4156863, 0, 1, 1,
0.5918398, -1.991681, 1.811213, 0.4235294, 0, 1, 1,
0.5937872, -1.010402, 2.288353, 0.427451, 0, 1, 1,
0.5984682, -0.3466636, 2.693731, 0.4352941, 0, 1, 1,
0.6029157, 0.1179781, 2.028328, 0.4392157, 0, 1, 1,
0.6051287, 0.9479405, 0.7646054, 0.4470588, 0, 1, 1,
0.6068717, 0.3200015, 1.372066, 0.4509804, 0, 1, 1,
0.6113666, 0.0001488344, 2.046238, 0.4588235, 0, 1, 1,
0.6146426, -0.4091981, 0.1488761, 0.4627451, 0, 1, 1,
0.6156111, -0.7356861, 2.605811, 0.4705882, 0, 1, 1,
0.621128, 0.2828598, 1.604371, 0.4745098, 0, 1, 1,
0.6215158, -1.708045, 3.509772, 0.4823529, 0, 1, 1,
0.6232047, -1.041922, 2.331932, 0.4862745, 0, 1, 1,
0.6294395, -0.03236758, 3.629681, 0.4941176, 0, 1, 1,
0.6317483, -0.1404654, 3.07508, 0.5019608, 0, 1, 1,
0.6369878, 0.0784703, 1.557771, 0.5058824, 0, 1, 1,
0.6387952, 1.639143, -1.045649, 0.5137255, 0, 1, 1,
0.6413056, 1.713064, 0.2759381, 0.5176471, 0, 1, 1,
0.6515009, 0.9292516, -0.805527, 0.5254902, 0, 1, 1,
0.6550581, 0.274139, -0.1033784, 0.5294118, 0, 1, 1,
0.6584231, 1.012926, 2.204848, 0.5372549, 0, 1, 1,
0.6638177, -0.0679189, 1.92322, 0.5411765, 0, 1, 1,
0.6664802, -0.3162157, 2.485182, 0.5490196, 0, 1, 1,
0.6682963, 1.530066, -0.7948, 0.5529412, 0, 1, 1,
0.6683117, -0.7362984, 3.723795, 0.5607843, 0, 1, 1,
0.6753887, -1.210546, 2.450025, 0.5647059, 0, 1, 1,
0.6758135, 0.6767655, 2.113158, 0.572549, 0, 1, 1,
0.6762955, -0.8656434, 2.330626, 0.5764706, 0, 1, 1,
0.6815698, 0.398915, 1.810367, 0.5843138, 0, 1, 1,
0.6817719, -2.705772, 0.7147155, 0.5882353, 0, 1, 1,
0.6871946, 0.7890137, 0.8664664, 0.5960785, 0, 1, 1,
0.6897168, 1.160632, 0.7985176, 0.6039216, 0, 1, 1,
0.6913593, 0.07962007, 2.149874, 0.6078432, 0, 1, 1,
0.6925318, -1.290598, 2.683525, 0.6156863, 0, 1, 1,
0.693106, -0.04570768, 2.315137, 0.6196079, 0, 1, 1,
0.6933347, 0.236874, 2.370251, 0.627451, 0, 1, 1,
0.6943529, 1.524712, 1.015539, 0.6313726, 0, 1, 1,
0.7116488, 0.4781801, 1.402207, 0.6392157, 0, 1, 1,
0.7117894, 0.5256628, 1.169395, 0.6431373, 0, 1, 1,
0.7118582, 0.5137599, 0.493302, 0.6509804, 0, 1, 1,
0.7177293, 0.9044983, 0.4202804, 0.654902, 0, 1, 1,
0.7188696, -0.03303346, 0.3555569, 0.6627451, 0, 1, 1,
0.7198752, 1.387932, 0.2262756, 0.6666667, 0, 1, 1,
0.7223067, -2.114701, 3.190229, 0.6745098, 0, 1, 1,
0.7245942, 0.01711659, 2.450176, 0.6784314, 0, 1, 1,
0.7252132, -0.447043, 1.661862, 0.6862745, 0, 1, 1,
0.730126, 0.1150356, 0.9061291, 0.6901961, 0, 1, 1,
0.7359974, 1.874251, 1.618553, 0.6980392, 0, 1, 1,
0.751527, 0.5380527, -0.4786072, 0.7058824, 0, 1, 1,
0.7515779, -0.1348457, 1.507061, 0.7098039, 0, 1, 1,
0.7602654, 0.05550541, 0.9649673, 0.7176471, 0, 1, 1,
0.7608649, 1.854446, 2.364006, 0.7215686, 0, 1, 1,
0.7624874, 1.562015, 0.3921411, 0.7294118, 0, 1, 1,
0.7704244, 1.208042, 0.8879764, 0.7333333, 0, 1, 1,
0.7742772, 0.2886951, 2.23063, 0.7411765, 0, 1, 1,
0.7777461, -1.190974, 2.779847, 0.7450981, 0, 1, 1,
0.7796812, -2.084145, 1.005379, 0.7529412, 0, 1, 1,
0.7837752, -0.7275485, 2.849364, 0.7568628, 0, 1, 1,
0.7859614, 1.588351, -0.8129131, 0.7647059, 0, 1, 1,
0.7877743, 0.2236185, 2.39454, 0.7686275, 0, 1, 1,
0.7950959, -0.9162786, 2.4485, 0.7764706, 0, 1, 1,
0.7958676, -1.968996, 3.295106, 0.7803922, 0, 1, 1,
0.8003446, -0.4812231, 1.499928, 0.7882353, 0, 1, 1,
0.8040912, 2.192612, 0.9198789, 0.7921569, 0, 1, 1,
0.8053576, -1.175799, 2.244666, 0.8, 0, 1, 1,
0.8071535, 0.4384624, 2.582717, 0.8078431, 0, 1, 1,
0.8109689, -0.4356446, 2.342316, 0.8117647, 0, 1, 1,
0.8125291, 0.1641454, 1.980967, 0.8196079, 0, 1, 1,
0.8151318, 0.3534319, 1.093177, 0.8235294, 0, 1, 1,
0.8153336, 0.01688658, 1.49009, 0.8313726, 0, 1, 1,
0.818421, 0.2753038, -0.1508026, 0.8352941, 0, 1, 1,
0.8190397, 0.1681298, 0.5532064, 0.8431373, 0, 1, 1,
0.8240249, 1.221946, -0.3384002, 0.8470588, 0, 1, 1,
0.8277368, 2.093082, -1.120226, 0.854902, 0, 1, 1,
0.8372307, 0.3665893, 1.577797, 0.8588235, 0, 1, 1,
0.8389125, -0.3888163, 0.5280778, 0.8666667, 0, 1, 1,
0.8412173, -0.4580685, 3.665396, 0.8705882, 0, 1, 1,
0.8435155, -0.713587, 2.35045, 0.8784314, 0, 1, 1,
0.8446414, -0.08636521, 3.635716, 0.8823529, 0, 1, 1,
0.8475833, -1.042938, 1.895827, 0.8901961, 0, 1, 1,
0.8489663, 1.213721, 1.716624, 0.8941177, 0, 1, 1,
0.8576444, 0.2626172, 2.566086, 0.9019608, 0, 1, 1,
0.8638905, 0.735145, 1.111524, 0.9098039, 0, 1, 1,
0.8687569, -0.6833909, 1.820352, 0.9137255, 0, 1, 1,
0.8712379, -0.4571118, 2.509315, 0.9215686, 0, 1, 1,
0.8719602, -0.6214836, 0.6314176, 0.9254902, 0, 1, 1,
0.883704, 0.9824454, 0.9495891, 0.9333333, 0, 1, 1,
0.8863243, -0.5198826, 0.9789894, 0.9372549, 0, 1, 1,
0.8911237, 1.156785, 0.2854846, 0.945098, 0, 1, 1,
0.8934252, -1.075441, 1.932632, 0.9490196, 0, 1, 1,
0.8959989, 1.966021, 0.7789769, 0.9568627, 0, 1, 1,
0.8975148, 0.4007438, 1.689609, 0.9607843, 0, 1, 1,
0.9033629, -0.6695031, 2.871065, 0.9686275, 0, 1, 1,
0.9041645, -0.5596962, 2.723253, 0.972549, 0, 1, 1,
0.904893, -1.101931, 2.131411, 0.9803922, 0, 1, 1,
0.905463, 2.044163, 1.383168, 0.9843137, 0, 1, 1,
0.9163299, -0.03355893, 2.013977, 0.9921569, 0, 1, 1,
0.9163763, -0.9467978, 0.8466695, 0.9960784, 0, 1, 1,
0.9196143, 0.3772385, 3.363146, 1, 0, 0.9960784, 1,
0.9274859, 0.3940323, 2.040022, 1, 0, 0.9882353, 1,
0.9339495, 1.560207, 0.7084169, 1, 0, 0.9843137, 1,
0.9365754, -0.3213917, 1.982215, 1, 0, 0.9764706, 1,
0.9368236, -0.2233715, 0.46383, 1, 0, 0.972549, 1,
0.9437094, 0.7563486, 0.6866822, 1, 0, 0.9647059, 1,
0.9510407, 0.515672, 1.064311, 1, 0, 0.9607843, 1,
0.9513234, -1.392546, 2.568473, 1, 0, 0.9529412, 1,
0.9513739, -0.9181603, 3.040129, 1, 0, 0.9490196, 1,
0.9602884, 1.364074, -1.500079, 1, 0, 0.9411765, 1,
0.9605188, -0.7748822, 2.155256, 1, 0, 0.9372549, 1,
0.9625998, -0.7760653, 3.17234, 1, 0, 0.9294118, 1,
0.9647974, -0.07720387, 1.117088, 1, 0, 0.9254902, 1,
0.9729632, -0.02347377, 0.1571512, 1, 0, 0.9176471, 1,
0.9855301, 1.566839, 0.4792505, 1, 0, 0.9137255, 1,
0.9942868, -0.6287325, 2.655574, 1, 0, 0.9058824, 1,
1.001391, 0.760406, -1.517764, 1, 0, 0.9019608, 1,
1.004046, -0.30537, 2.785572, 1, 0, 0.8941177, 1,
1.006158, 0.03925479, 1.235264, 1, 0, 0.8862745, 1,
1.013867, -2.213356, 4.027572, 1, 0, 0.8823529, 1,
1.024654, -0.1297233, 0.5479216, 1, 0, 0.8745098, 1,
1.026182, -0.4195606, 2.187157, 1, 0, 0.8705882, 1,
1.029878, 0.5967424, 1.810464, 1, 0, 0.8627451, 1,
1.036202, -1.316151, 1.493967, 1, 0, 0.8588235, 1,
1.036293, -1.984709, 2.231386, 1, 0, 0.8509804, 1,
1.03797, 0.09210651, 2.002744, 1, 0, 0.8470588, 1,
1.038355, -1.1521, 1.964198, 1, 0, 0.8392157, 1,
1.040653, 0.8177144, -0.1972328, 1, 0, 0.8352941, 1,
1.041827, 1.201396, -0.1007488, 1, 0, 0.827451, 1,
1.042846, -1.542653, 2.889031, 1, 0, 0.8235294, 1,
1.049161, -0.3116685, 1.677388, 1, 0, 0.8156863, 1,
1.049885, -0.8542758, 1.365827, 1, 0, 0.8117647, 1,
1.062563, 0.6649312, 0.8391288, 1, 0, 0.8039216, 1,
1.06393, 0.5612558, 2.008874, 1, 0, 0.7960784, 1,
1.068444, -1.67101, 1.281802, 1, 0, 0.7921569, 1,
1.069559, -0.3785969, 1.605695, 1, 0, 0.7843137, 1,
1.06965, -0.4198613, -0.007817481, 1, 0, 0.7803922, 1,
1.077877, -1.026956, 1.563607, 1, 0, 0.772549, 1,
1.080833, -1.13997, 2.24806, 1, 0, 0.7686275, 1,
1.082728, -0.0519383, 1.15857, 1, 0, 0.7607843, 1,
1.087836, -0.5844342, 0.7922024, 1, 0, 0.7568628, 1,
1.102397, -0.8904725, 0.8800288, 1, 0, 0.7490196, 1,
1.102817, 0.5104532, -1.278048, 1, 0, 0.7450981, 1,
1.102962, 0.03169802, 1.52886, 1, 0, 0.7372549, 1,
1.103153, 1.35953, -0.5250793, 1, 0, 0.7333333, 1,
1.112012, 1.393526, -1.673717, 1, 0, 0.7254902, 1,
1.117858, -0.8166099, 3.296482, 1, 0, 0.7215686, 1,
1.121468, 1.363748, 1.417022, 1, 0, 0.7137255, 1,
1.121498, 0.2856317, 2.756275, 1, 0, 0.7098039, 1,
1.123411, -0.1297779, 2.764757, 1, 0, 0.7019608, 1,
1.130316, -0.9497818, 2.089018, 1, 0, 0.6941177, 1,
1.136467, 0.2901945, 1.563954, 1, 0, 0.6901961, 1,
1.136473, 2.760768, 2.224389, 1, 0, 0.682353, 1,
1.142766, 0.01106476, -0.2747088, 1, 0, 0.6784314, 1,
1.144109, -0.8374252, 2.545556, 1, 0, 0.6705883, 1,
1.181416, -0.3583684, 0.5202255, 1, 0, 0.6666667, 1,
1.181645, -1.685681, 1.749626, 1, 0, 0.6588235, 1,
1.182088, -3.1486, 3.335337, 1, 0, 0.654902, 1,
1.186379, -1.784723, 2.087522, 1, 0, 0.6470588, 1,
1.190971, 0.04158329, 1.854442, 1, 0, 0.6431373, 1,
1.195668, -0.6846973, 1.55303, 1, 0, 0.6352941, 1,
1.198638, -1.060327, 4.631645, 1, 0, 0.6313726, 1,
1.209693, -0.005021422, 1.516021, 1, 0, 0.6235294, 1,
1.213332, -0.04216988, 2.266659, 1, 0, 0.6196079, 1,
1.224184, -1.892818, 0.7766427, 1, 0, 0.6117647, 1,
1.231739, -0.7914997, 1.663296, 1, 0, 0.6078432, 1,
1.234247, -0.5041362, 0.6196121, 1, 0, 0.6, 1,
1.240984, 1.204733, -0.2075882, 1, 0, 0.5921569, 1,
1.243672, 0.3754734, 1.209219, 1, 0, 0.5882353, 1,
1.244081, -0.8533287, 3.577949, 1, 0, 0.5803922, 1,
1.247843, -0.4464776, 1.477329, 1, 0, 0.5764706, 1,
1.266217, 1.690073, -0.4110302, 1, 0, 0.5686275, 1,
1.270464, 0.3961976, 2.403778, 1, 0, 0.5647059, 1,
1.283789, 0.6696984, 1.475234, 1, 0, 0.5568628, 1,
1.286609, -0.406058, -0.4779484, 1, 0, 0.5529412, 1,
1.287241, -1.273242, 3.649758, 1, 0, 0.5450981, 1,
1.290002, -0.4169919, 2.132215, 1, 0, 0.5411765, 1,
1.29564, 0.3743872, 1.579591, 1, 0, 0.5333334, 1,
1.297122, -0.5187271, 2.975133, 1, 0, 0.5294118, 1,
1.298488, 0.1488009, 1.123187, 1, 0, 0.5215687, 1,
1.30636, 0.08120922, 2.760004, 1, 0, 0.5176471, 1,
1.309842, -1.11499, 2.227334, 1, 0, 0.509804, 1,
1.316885, 0.7625044, -0.3946227, 1, 0, 0.5058824, 1,
1.318824, -0.5528519, 1.916458, 1, 0, 0.4980392, 1,
1.319707, 0.2703623, 1.034883, 1, 0, 0.4901961, 1,
1.32059, -0.3715711, -0.1187308, 1, 0, 0.4862745, 1,
1.321476, 0.3144422, 0.7073855, 1, 0, 0.4784314, 1,
1.33523, -0.2317329, 2.444788, 1, 0, 0.4745098, 1,
1.339983, 0.4761233, 1.766617, 1, 0, 0.4666667, 1,
1.341744, -0.1028456, 1.819088, 1, 0, 0.4627451, 1,
1.361396, -1.378661, 2.94925, 1, 0, 0.454902, 1,
1.36381, 0.1223146, 1.603534, 1, 0, 0.4509804, 1,
1.370358, 0.4071409, 1.307365, 1, 0, 0.4431373, 1,
1.384726, -0.6953079, 2.488998, 1, 0, 0.4392157, 1,
1.387906, -0.3455579, 1.93355, 1, 0, 0.4313726, 1,
1.389527, 1.633867, 0.06489291, 1, 0, 0.427451, 1,
1.395112, -0.1818075, 1.293343, 1, 0, 0.4196078, 1,
1.399595, 0.8437664, 0.5401368, 1, 0, 0.4156863, 1,
1.40325, -0.7710534, 3.161302, 1, 0, 0.4078431, 1,
1.426818, 0.3882436, 1.977701, 1, 0, 0.4039216, 1,
1.431535, -0.08200427, 2.017799, 1, 0, 0.3960784, 1,
1.455567, 0.5025484, 2.702728, 1, 0, 0.3882353, 1,
1.45645, -1.05771, 1.537592, 1, 0, 0.3843137, 1,
1.456784, 1.651993, -0.03490959, 1, 0, 0.3764706, 1,
1.481828, 0.4484056, 2.079259, 1, 0, 0.372549, 1,
1.507515, -0.8517813, 3.933064, 1, 0, 0.3647059, 1,
1.526994, 0.4148391, 0.8082352, 1, 0, 0.3607843, 1,
1.538704, -1.347111, 1.326271, 1, 0, 0.3529412, 1,
1.539941, 0.1060019, 0.9587497, 1, 0, 0.3490196, 1,
1.548914, -0.487149, 1.295471, 1, 0, 0.3411765, 1,
1.557447, 1.426727, 0.5442445, 1, 0, 0.3372549, 1,
1.558015, 0.5100439, 2.188993, 1, 0, 0.3294118, 1,
1.564829, 1.398479, -0.04682388, 1, 0, 0.3254902, 1,
1.565017, 1.425162, 0.2849298, 1, 0, 0.3176471, 1,
1.567457, -1.433772, 2.554831, 1, 0, 0.3137255, 1,
1.56811, 0.4132084, -0.1718426, 1, 0, 0.3058824, 1,
1.576196, -1.304146, 1.685986, 1, 0, 0.2980392, 1,
1.596317, -0.8340012, 4.478361, 1, 0, 0.2941177, 1,
1.607839, -1.077587, 3.849828, 1, 0, 0.2862745, 1,
1.628434, -0.7648609, 1.801313, 1, 0, 0.282353, 1,
1.642961, -1.782511, 0.6727353, 1, 0, 0.2745098, 1,
1.655698, -1.379513, 1.0803, 1, 0, 0.2705882, 1,
1.65768, -1.523211, 1.665736, 1, 0, 0.2627451, 1,
1.663552, 1.595318, 0.5625556, 1, 0, 0.2588235, 1,
1.665323, -0.8847832, 3.356549, 1, 0, 0.2509804, 1,
1.690354, -1.006495, 1.238337, 1, 0, 0.2470588, 1,
1.693307, -0.8247792, 2.228709, 1, 0, 0.2392157, 1,
1.705708, 1.817759, 0.9460399, 1, 0, 0.2352941, 1,
1.71101, 1.271773, -0.9763358, 1, 0, 0.227451, 1,
1.761191, 0.3767908, 1.892548, 1, 0, 0.2235294, 1,
1.777229, -1.629014, 2.830458, 1, 0, 0.2156863, 1,
1.780686, 1.366017, -0.05680235, 1, 0, 0.2117647, 1,
1.809373, 0.4515, 1.241703, 1, 0, 0.2039216, 1,
1.811505, 0.9188409, 1.342668, 1, 0, 0.1960784, 1,
1.823898, 0.7870098, 1.499612, 1, 0, 0.1921569, 1,
1.854937, 0.7522756, 0.4113469, 1, 0, 0.1843137, 1,
1.855014, 0.3140668, 1.03868, 1, 0, 0.1803922, 1,
1.874157, -3.256107, 0.5818185, 1, 0, 0.172549, 1,
1.877886, -1.860901, 2.524166, 1, 0, 0.1686275, 1,
1.891471, 1.572933, 1.170658, 1, 0, 0.1607843, 1,
1.908909, -1.40373, 1.727704, 1, 0, 0.1568628, 1,
1.926339, -0.8038589, 1.38125, 1, 0, 0.1490196, 1,
1.951952, -1.924738, 1.322559, 1, 0, 0.145098, 1,
1.962248, 0.3326052, 1.610349, 1, 0, 0.1372549, 1,
2.001597, 0.4419559, 3.096695, 1, 0, 0.1333333, 1,
2.009105, -0.980538, 2.616369, 1, 0, 0.1254902, 1,
2.019856, 0.2082639, -0.09587818, 1, 0, 0.1215686, 1,
2.049849, 1.200602, 0.6095996, 1, 0, 0.1137255, 1,
2.055335, -0.02827325, 3.589296, 1, 0, 0.1098039, 1,
2.107899, 0.989756, 1.132698, 1, 0, 0.1019608, 1,
2.122598, 0.8024355, 0.9897138, 1, 0, 0.09411765, 1,
2.140589, 0.01354553, -0.08387452, 1, 0, 0.09019608, 1,
2.144824, 0.5913631, 0.4208319, 1, 0, 0.08235294, 1,
2.157146, 0.1173915, 1.115364, 1, 0, 0.07843138, 1,
2.202084, -0.05268144, 2.896448, 1, 0, 0.07058824, 1,
2.208421, -1.301464, 1.609337, 1, 0, 0.06666667, 1,
2.224463, -0.5016412, 3.347382, 1, 0, 0.05882353, 1,
2.258199, 0.2217928, 2.883311, 1, 0, 0.05490196, 1,
2.265434, 0.8996704, 3.354393, 1, 0, 0.04705882, 1,
2.321815, -0.6685707, 2.857269, 1, 0, 0.04313726, 1,
2.355321, -0.2945072, 0.5129606, 1, 0, 0.03529412, 1,
2.472003, -1.374826, 3.1431, 1, 0, 0.03137255, 1,
2.480199, -0.02867096, 1.913116, 1, 0, 0.02352941, 1,
2.534407, 1.144378, 0.6601483, 1, 0, 0.01960784, 1,
2.62425, -0.3965249, 1.942276, 1, 0, 0.01176471, 1,
3.289594, -0.2286443, 2.778956, 1, 0, 0.007843138, 1
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
-0.1407844, -4.397223, -6.66285, 0, -0.5, 0.5, 0.5,
-0.1407844, -4.397223, -6.66285, 1, -0.5, 0.5, 0.5,
-0.1407844, -4.397223, -6.66285, 1, 1.5, 0.5, 0.5,
-0.1407844, -4.397223, -6.66285, 0, 1.5, 0.5, 0.5
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
-4.734061, 0.110018, -6.66285, 0, -0.5, 0.5, 0.5,
-4.734061, 0.110018, -6.66285, 1, -0.5, 0.5, 0.5,
-4.734061, 0.110018, -6.66285, 1, 1.5, 0.5, 0.5,
-4.734061, 0.110018, -6.66285, 0, 1.5, 0.5, 0.5
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
-4.734061, -4.397223, 0.0325985, 0, -0.5, 0.5, 0.5,
-4.734061, -4.397223, 0.0325985, 1, -0.5, 0.5, 0.5,
-4.734061, -4.397223, 0.0325985, 1, 1.5, 0.5, 0.5,
-4.734061, -4.397223, 0.0325985, 0, 1.5, 0.5, 0.5
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
-3, -3.357091, -5.117747,
3, -3.357091, -5.117747,
-3, -3.357091, -5.117747,
-3, -3.530446, -5.375264,
-2, -3.357091, -5.117747,
-2, -3.530446, -5.375264,
-1, -3.357091, -5.117747,
-1, -3.530446, -5.375264,
0, -3.357091, -5.117747,
0, -3.530446, -5.375264,
1, -3.357091, -5.117747,
1, -3.530446, -5.375264,
2, -3.357091, -5.117747,
2, -3.530446, -5.375264,
3, -3.357091, -5.117747,
3, -3.530446, -5.375264
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
-3, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
-3, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
-3, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
-3, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
-2, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
-2, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
-2, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
-2, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
-1, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
-1, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
-1, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
-1, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
0, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
0, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
0, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
0, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
1, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
1, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
1, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
1, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
2, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
2, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
2, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
2, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5,
3, -3.877157, -5.890298, 0, -0.5, 0.5, 0.5,
3, -3.877157, -5.890298, 1, -0.5, 0.5, 0.5,
3, -3.877157, -5.890298, 1, 1.5, 0.5, 0.5,
3, -3.877157, -5.890298, 0, 1.5, 0.5, 0.5
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
-3.674074, -3, -5.117747,
-3.674074, 3, -5.117747,
-3.674074, -3, -5.117747,
-3.850739, -3, -5.375264,
-3.674074, -2, -5.117747,
-3.850739, -2, -5.375264,
-3.674074, -1, -5.117747,
-3.850739, -1, -5.375264,
-3.674074, 0, -5.117747,
-3.850739, 0, -5.375264,
-3.674074, 1, -5.117747,
-3.850739, 1, -5.375264,
-3.674074, 2, -5.117747,
-3.850739, 2, -5.375264,
-3.674074, 3, -5.117747,
-3.850739, 3, -5.375264
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
-4.204068, -3, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, -3, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, -3, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, -3, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, -2, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, -2, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, -2, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, -2, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, -1, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, -1, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, -1, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, -1, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, 0, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, 0, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, 0, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, 0, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, 1, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, 1, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, 1, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, 1, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, 2, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, 2, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, 2, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, 2, -5.890298, 0, 1.5, 0.5, 0.5,
-4.204068, 3, -5.890298, 0, -0.5, 0.5, 0.5,
-4.204068, 3, -5.890298, 1, -0.5, 0.5, 0.5,
-4.204068, 3, -5.890298, 1, 1.5, 0.5, 0.5,
-4.204068, 3, -5.890298, 0, 1.5, 0.5, 0.5
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
-3.674074, -3.357091, -4,
-3.674074, -3.357091, 4,
-3.674074, -3.357091, -4,
-3.850739, -3.530446, -4,
-3.674074, -3.357091, -2,
-3.850739, -3.530446, -2,
-3.674074, -3.357091, 0,
-3.850739, -3.530446, 0,
-3.674074, -3.357091, 2,
-3.850739, -3.530446, 2,
-3.674074, -3.357091, 4,
-3.850739, -3.530446, 4
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
-4.204068, -3.877157, -4, 0, -0.5, 0.5, 0.5,
-4.204068, -3.877157, -4, 1, -0.5, 0.5, 0.5,
-4.204068, -3.877157, -4, 1, 1.5, 0.5, 0.5,
-4.204068, -3.877157, -4, 0, 1.5, 0.5, 0.5,
-4.204068, -3.877157, -2, 0, -0.5, 0.5, 0.5,
-4.204068, -3.877157, -2, 1, -0.5, 0.5, 0.5,
-4.204068, -3.877157, -2, 1, 1.5, 0.5, 0.5,
-4.204068, -3.877157, -2, 0, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 0, 0, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 0, 1, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 0, 1, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 0, 0, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 2, 0, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 2, 1, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 2, 1, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 2, 0, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 4, 0, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 4, 1, -0.5, 0.5, 0.5,
-4.204068, -3.877157, 4, 1, 1.5, 0.5, 0.5,
-4.204068, -3.877157, 4, 0, 1.5, 0.5, 0.5
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
-3.674074, -3.357091, -5.117747,
-3.674074, 3.577127, -5.117747,
-3.674074, -3.357091, 5.182944,
-3.674074, 3.577127, 5.182944,
-3.674074, -3.357091, -5.117747,
-3.674074, -3.357091, 5.182944,
-3.674074, 3.577127, -5.117747,
-3.674074, 3.577127, 5.182944,
-3.674074, -3.357091, -5.117747,
3.392506, -3.357091, -5.117747,
-3.674074, -3.357091, 5.182944,
3.392506, -3.357091, 5.182944,
-3.674074, 3.577127, -5.117747,
3.392506, 3.577127, -5.117747,
-3.674074, 3.577127, 5.182944,
3.392506, 3.577127, 5.182944,
3.392506, -3.357091, -5.117747,
3.392506, 3.577127, -5.117747,
3.392506, -3.357091, 5.182944,
3.392506, 3.577127, 5.182944,
3.392506, -3.357091, -5.117747,
3.392506, -3.357091, 5.182944,
3.392506, 3.577127, -5.117747,
3.392506, 3.577127, 5.182944
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
var radius = 7.629089;
var distance = 33.94268;
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
mvMatrix.translate( 0.1407844, -0.110018, -0.0325985 );
mvMatrix.scale( 1.167286, 1.189568, 0.8007929 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94268);
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
## Error in read.table("Amide.xyz"): no lines available in input
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
-3.571163, 1.563261, -0.5835247, 0, 0, 1, 1, 1,
-3.402078, -0.1517804, -0.9623727, 1, 0, 0, 1, 1,
-3.343371, 0.6290985, 0.2734047, 1, 0, 0, 1, 1,
-3.057382, 0.06595813, -1.390032, 1, 0, 0, 1, 1,
-3.017397, -1.503165, -0.2468244, 1, 0, 0, 1, 1,
-2.834116, -0.5347342, -2.381984, 1, 0, 0, 1, 1,
-2.817781, 1.666028, -2.276368, 0, 0, 0, 1, 1,
-2.778285, 1.132423, -1.92493, 0, 0, 0, 1, 1,
-2.652977, 0.06566403, -1.871871, 0, 0, 0, 1, 1,
-2.569222, 0.717381, -0.735512, 0, 0, 0, 1, 1,
-2.545029, -0.09392688, -1.903624, 0, 0, 0, 1, 1,
-2.324157, -0.2573843, 0.1836703, 0, 0, 0, 1, 1,
-2.271928, -0.2231331, -2.461849, 0, 0, 0, 1, 1,
-2.223283, 0.100044, -2.795498, 1, 1, 1, 1, 1,
-2.163422, 1.029682, -0.7109718, 1, 1, 1, 1, 1,
-2.14078, 0.05993731, 0.06961485, 1, 1, 1, 1, 1,
-2.071784, 0.4075092, -1.143487, 1, 1, 1, 1, 1,
-2.029919, -0.8982677, 0.05042317, 1, 1, 1, 1, 1,
-2.014907, -0.2008584, -2.647636, 1, 1, 1, 1, 1,
-2.014794, -1.304537, -1.976669, 1, 1, 1, 1, 1,
-2.005339, 0.1894001, -0.9985113, 1, 1, 1, 1, 1,
-1.983192, 1.79076, -1.051618, 1, 1, 1, 1, 1,
-1.97795, 0.1811798, -2.458237, 1, 1, 1, 1, 1,
-1.977469, -0.05437022, -0.1099714, 1, 1, 1, 1, 1,
-1.960024, 2.45267, -1.812415, 1, 1, 1, 1, 1,
-1.925749, 0.5389721, -0.2058923, 1, 1, 1, 1, 1,
-1.913864, 0.3264063, -0.4473336, 1, 1, 1, 1, 1,
-1.902586, 0.2781667, -1.880537, 1, 1, 1, 1, 1,
-1.888157, -0.0112204, -2.933032, 0, 0, 1, 1, 1,
-1.832047, 0.3472118, -0.8565168, 1, 0, 0, 1, 1,
-1.814555, 1.41522, -0.4568831, 1, 0, 0, 1, 1,
-1.795461, 1.026048, -0.8444601, 1, 0, 0, 1, 1,
-1.778942, -0.6202691, -1.648686, 1, 0, 0, 1, 1,
-1.761794, 0.914865, -1.418447, 1, 0, 0, 1, 1,
-1.760651, 0.72967, -1.494221, 0, 0, 0, 1, 1,
-1.758538, 0.5571436, -1.606301, 0, 0, 0, 1, 1,
-1.747547, 0.9268627, -0.4726667, 0, 0, 0, 1, 1,
-1.718079, -1.217015, -1.236644, 0, 0, 0, 1, 1,
-1.705885, 0.8369429, -2.506269, 0, 0, 0, 1, 1,
-1.702698, -0.1118747, -2.965314, 0, 0, 0, 1, 1,
-1.693853, 1.435373, -0.5238518, 0, 0, 0, 1, 1,
-1.687494, -0.06130134, -2.254799, 1, 1, 1, 1, 1,
-1.661504, -0.09051713, -1.931668, 1, 1, 1, 1, 1,
-1.659288, 1.081125, -0.5999341, 1, 1, 1, 1, 1,
-1.658494, 0.2592336, -1.165343, 1, 1, 1, 1, 1,
-1.649599, -0.07739131, -1.399431, 1, 1, 1, 1, 1,
-1.643003, -0.7292081, -2.47358, 1, 1, 1, 1, 1,
-1.634559, 0.1015796, -1.458655, 1, 1, 1, 1, 1,
-1.632797, -0.6045075, -1.850089, 1, 1, 1, 1, 1,
-1.632145, -0.07648106, -3.146248, 1, 1, 1, 1, 1,
-1.627756, -0.1661793, -3.609137, 1, 1, 1, 1, 1,
-1.605771, 0.4569424, -0.1983248, 1, 1, 1, 1, 1,
-1.589583, -0.1621307, -1.673148, 1, 1, 1, 1, 1,
-1.587018, 0.912963, -0.7135836, 1, 1, 1, 1, 1,
-1.58558, 0.5641106, -0.8303863, 1, 1, 1, 1, 1,
-1.579915, 0.006338457, -0.04771201, 1, 1, 1, 1, 1,
-1.578388, 0.8157116, -2.713439, 0, 0, 1, 1, 1,
-1.573562, 0.2466127, -2.239172, 1, 0, 0, 1, 1,
-1.572349, -0.5318237, -0.7292674, 1, 0, 0, 1, 1,
-1.563141, -0.2574061, -0.1355778, 1, 0, 0, 1, 1,
-1.553606, 0.5265357, -3.081095, 1, 0, 0, 1, 1,
-1.544441, -0.7058849, -1.595486, 1, 0, 0, 1, 1,
-1.537431, -0.05657605, -3.054026, 0, 0, 0, 1, 1,
-1.532672, -1.100136, -1.578983, 0, 0, 0, 1, 1,
-1.532258, 0.8124123, -2.093373, 0, 0, 0, 1, 1,
-1.528864, -0.5125124, -0.9261158, 0, 0, 0, 1, 1,
-1.524059, 0.4576351, 0.1190909, 0, 0, 0, 1, 1,
-1.521393, -1.891415, -0.5490579, 0, 0, 0, 1, 1,
-1.512805, 1.809576, -1.65, 0, 0, 0, 1, 1,
-1.474386, -0.4552094, -1.976386, 1, 1, 1, 1, 1,
-1.462789, -0.05838443, -2.535463, 1, 1, 1, 1, 1,
-1.454898, -0.03600883, -1.193103, 1, 1, 1, 1, 1,
-1.446634, 0.3145714, -2.16554, 1, 1, 1, 1, 1,
-1.439044, -1.429318, -2.211505, 1, 1, 1, 1, 1,
-1.431051, -0.0006289664, -2.742039, 1, 1, 1, 1, 1,
-1.427073, -0.9130478, -1.615627, 1, 1, 1, 1, 1,
-1.418087, -0.01458548, -0.923603, 1, 1, 1, 1, 1,
-1.410615, -0.2780281, -1.136563, 1, 1, 1, 1, 1,
-1.407548, -0.6475923, -3.752781, 1, 1, 1, 1, 1,
-1.400374, -1.576347, -3.364684, 1, 1, 1, 1, 1,
-1.383529, 0.1127805, 0.1203813, 1, 1, 1, 1, 1,
-1.382389, -0.7610832, -1.656391, 1, 1, 1, 1, 1,
-1.374586, 0.4989313, -0.1880172, 1, 1, 1, 1, 1,
-1.374182, 0.9137871, -2.042984, 1, 1, 1, 1, 1,
-1.373827, 2.508347, -1.906068, 0, 0, 1, 1, 1,
-1.370003, -0.7858711, -3.420194, 1, 0, 0, 1, 1,
-1.362135, -0.5244726, -1.223785, 1, 0, 0, 1, 1,
-1.360323, -0.6263935, -0.9316652, 1, 0, 0, 1, 1,
-1.357477, -1.019302, -0.8121467, 1, 0, 0, 1, 1,
-1.356468, 0.4353422, -1.726419, 1, 0, 0, 1, 1,
-1.35632, -0.8800882, -3.268573, 0, 0, 0, 1, 1,
-1.352877, -0.2675261, -3.77447, 0, 0, 0, 1, 1,
-1.334964, 0.2229393, -1.849711, 0, 0, 0, 1, 1,
-1.332885, 1.272443, -0.262991, 0, 0, 0, 1, 1,
-1.330478, 0.741084, -0.9663761, 0, 0, 0, 1, 1,
-1.324319, -0.8633459, -2.205522, 0, 0, 0, 1, 1,
-1.323243, -1.58049, -3.176781, 0, 0, 0, 1, 1,
-1.322091, 1.307174, -1.051297, 1, 1, 1, 1, 1,
-1.321254, -0.256354, -2.606032, 1, 1, 1, 1, 1,
-1.315592, 0.7563527, -0.09056818, 1, 1, 1, 1, 1,
-1.314959, 0.8981956, -1.435646, 1, 1, 1, 1, 1,
-1.309872, -0.5365967, -1.199964, 1, 1, 1, 1, 1,
-1.30317, -0.5418991, -1.500884, 1, 1, 1, 1, 1,
-1.301013, -0.9641371, -3.091509, 1, 1, 1, 1, 1,
-1.300387, 1.12818, -0.6982031, 1, 1, 1, 1, 1,
-1.296655, 0.2793162, -1.403591, 1, 1, 1, 1, 1,
-1.294371, -1.437335, -2.477417, 1, 1, 1, 1, 1,
-1.293214, -2.044786, -1.904768, 1, 1, 1, 1, 1,
-1.292079, -1.200237, -1.378406, 1, 1, 1, 1, 1,
-1.291719, 0.00455418, -3.130222, 1, 1, 1, 1, 1,
-1.290676, -1.050409, -1.425395, 1, 1, 1, 1, 1,
-1.286408, -1.318928, -1.510029, 1, 1, 1, 1, 1,
-1.278661, -0.2260269, -1.966862, 0, 0, 1, 1, 1,
-1.275839, 0.4555176, -1.179387, 1, 0, 0, 1, 1,
-1.272286, -1.05713, -2.790901, 1, 0, 0, 1, 1,
-1.271391, 0.05121551, -1.391489, 1, 0, 0, 1, 1,
-1.269768, -0.06206911, -2.015924, 1, 0, 0, 1, 1,
-1.268676, -0.5370511, -1.75898, 1, 0, 0, 1, 1,
-1.268387, 2.518296, 0.4087546, 0, 0, 0, 1, 1,
-1.266398, -0.01525148, -2.605705, 0, 0, 0, 1, 1,
-1.263545, -1.354454, -2.090885, 0, 0, 0, 1, 1,
-1.253746, 1.156047, -0.5660889, 0, 0, 0, 1, 1,
-1.251794, 0.595321, -0.9636589, 0, 0, 0, 1, 1,
-1.244059, -1.231842, -1.385747, 0, 0, 0, 1, 1,
-1.241262, -0.1135485, -1.862772, 0, 0, 0, 1, 1,
-1.23464, -0.8443524, -3.301569, 1, 1, 1, 1, 1,
-1.2321, 0.01346283, -2.125046, 1, 1, 1, 1, 1,
-1.230033, -1.525208, -4.060912, 1, 1, 1, 1, 1,
-1.221488, 0.1331633, -2.537098, 1, 1, 1, 1, 1,
-1.221118, -1.190889, -1.976934, 1, 1, 1, 1, 1,
-1.215541, 0.7369966, -2.183077, 1, 1, 1, 1, 1,
-1.202261, -0.8740396, -2.067772, 1, 1, 1, 1, 1,
-1.197192, -1.633812, -1.332513, 1, 1, 1, 1, 1,
-1.192162, 1.661117, -3.087577, 1, 1, 1, 1, 1,
-1.1908, -0.8749136, -3.08402, 1, 1, 1, 1, 1,
-1.190562, -1.123159, -1.283962, 1, 1, 1, 1, 1,
-1.177508, 0.9294338, -1.781467, 1, 1, 1, 1, 1,
-1.158156, 0.1444101, -0.0388137, 1, 1, 1, 1, 1,
-1.157483, -0.2122065, -2.250079, 1, 1, 1, 1, 1,
-1.14412, 0.9953278, -2.05203, 1, 1, 1, 1, 1,
-1.140372, 1.764891, -0.0007517778, 0, 0, 1, 1, 1,
-1.139832, 0.02840608, -1.70637, 1, 0, 0, 1, 1,
-1.13876, 0.03572785, -2.150607, 1, 0, 0, 1, 1,
-1.138353, -0.3711615, -1.406554, 1, 0, 0, 1, 1,
-1.135734, 0.8086186, 0.05341582, 1, 0, 0, 1, 1,
-1.134138, 0.6091248, -2.249913, 1, 0, 0, 1, 1,
-1.131757, 1.07818, 0.5075217, 0, 0, 0, 1, 1,
-1.131135, 0.5124626, -1.492497, 0, 0, 0, 1, 1,
-1.130623, -0.1446424, -1.963856, 0, 0, 0, 1, 1,
-1.10721, 1.083694, -2.096419, 0, 0, 0, 1, 1,
-1.099704, 1.828907, -0.7074514, 0, 0, 0, 1, 1,
-1.095168, 1.055719, -1.789884, 0, 0, 0, 1, 1,
-1.092089, -0.2289204, -1.964867, 0, 0, 0, 1, 1,
-1.079038, 1.285861, -1.342254, 1, 1, 1, 1, 1,
-1.076519, -2.271477, -2.421996, 1, 1, 1, 1, 1,
-1.075843, 0.03328237, -2.055833, 1, 1, 1, 1, 1,
-1.075615, 1.225037, -1.805659, 1, 1, 1, 1, 1,
-1.074596, 1.390662, -1.234717, 1, 1, 1, 1, 1,
-1.066143, 0.8438731, 0.1681332, 1, 1, 1, 1, 1,
-1.064666, -2.628484, -2.198645, 1, 1, 1, 1, 1,
-1.064535, -1.034614, -1.081848, 1, 1, 1, 1, 1,
-1.058731, -0.0527198, -2.934569, 1, 1, 1, 1, 1,
-1.045699, 0.5649097, -0.5608923, 1, 1, 1, 1, 1,
-1.037565, 0.7364351, -1.495872, 1, 1, 1, 1, 1,
-1.035584, -0.7939295, -1.994124, 1, 1, 1, 1, 1,
-1.03271, 1.332732, 1.763402, 1, 1, 1, 1, 1,
-1.032306, -2.710119, -2.77875, 1, 1, 1, 1, 1,
-1.030727, 0.5378963, -0.7285822, 1, 1, 1, 1, 1,
-1.019848, 0.2236997, 0.5008363, 0, 0, 1, 1, 1,
-1.017637, 1.589464, -1.479123, 1, 0, 0, 1, 1,
-1.013264, 1.896256, 0.01483028, 1, 0, 0, 1, 1,
-1.011246, -0.4375121, -2.465864, 1, 0, 0, 1, 1,
-1.005947, -0.4152288, -0.7059941, 1, 0, 0, 1, 1,
-1.005026, -1.256384, -3.279174, 1, 0, 0, 1, 1,
-1.003515, 0.1797552, -2.354969, 0, 0, 0, 1, 1,
-0.9982122, 1.352964, -1.661554, 0, 0, 0, 1, 1,
-0.9980105, -1.377131, -2.342524, 0, 0, 0, 1, 1,
-0.9977289, -2.292521, -2.507667, 0, 0, 0, 1, 1,
-0.9920916, -0.3208331, -1.259666, 0, 0, 0, 1, 1,
-0.9920337, -1.141943, -2.901151, 0, 0, 0, 1, 1,
-0.9763242, -0.003367752, -1.813755, 0, 0, 0, 1, 1,
-0.9676924, -0.6726601, -1.196624, 1, 1, 1, 1, 1,
-0.9608665, -0.6497238, -3.475528, 1, 1, 1, 1, 1,
-0.952576, -0.6967528, -2.154922, 1, 1, 1, 1, 1,
-0.9516428, 0.04655519, -3.357574, 1, 1, 1, 1, 1,
-0.951161, -0.8681476, -2.099611, 1, 1, 1, 1, 1,
-0.9438646, -1.277194, -2.067333, 1, 1, 1, 1, 1,
-0.942556, 0.8314728, -0.4945074, 1, 1, 1, 1, 1,
-0.9374264, 0.3566963, -0.7036998, 1, 1, 1, 1, 1,
-0.9343341, 0.9273244, -0.4739963, 1, 1, 1, 1, 1,
-0.9320726, -0.6776753, 0.178522, 1, 1, 1, 1, 1,
-0.9277027, 0.36142, 0.9147898, 1, 1, 1, 1, 1,
-0.9262099, -1.520536, -3.200662, 1, 1, 1, 1, 1,
-0.9254325, 1.197808, -1.557377, 1, 1, 1, 1, 1,
-0.9211019, -1.291482, -1.996555, 1, 1, 1, 1, 1,
-0.9205706, 0.4469397, 0.3346277, 1, 1, 1, 1, 1,
-0.9177288, 1.447868, 0.9356463, 0, 0, 1, 1, 1,
-0.9166673, 0.3152331, -0.4403676, 1, 0, 0, 1, 1,
-0.9112731, 0.4558602, -1.298796, 1, 0, 0, 1, 1,
-0.8932829, 1.469087, -1.31575, 1, 0, 0, 1, 1,
-0.8928501, -0.9678509, -2.596934, 1, 0, 0, 1, 1,
-0.8914227, -0.8927886, -3.32275, 1, 0, 0, 1, 1,
-0.8898662, -0.2588024, -2.911899, 0, 0, 0, 1, 1,
-0.8897363, -1.002848, -1.066955, 0, 0, 0, 1, 1,
-0.888805, 1.616753, -2.486735, 0, 0, 0, 1, 1,
-0.8831373, -0.003205629, -1.891086, 0, 0, 0, 1, 1,
-0.8797801, 0.5774395, -1.069167, 0, 0, 0, 1, 1,
-0.8779644, 0.5314668, -2.625732, 0, 0, 0, 1, 1,
-0.8777589, -1.999097, -3.413145, 0, 0, 0, 1, 1,
-0.8776379, -0.5473897, -1.058613, 1, 1, 1, 1, 1,
-0.8678424, 0.4773585, -2.667678, 1, 1, 1, 1, 1,
-0.8663648, 0.6802887, -0.4740182, 1, 1, 1, 1, 1,
-0.8636895, -0.2855289, -2.932898, 1, 1, 1, 1, 1,
-0.8601899, -0.8250706, -1.101368, 1, 1, 1, 1, 1,
-0.8477878, 1.107948, -1.178136, 1, 1, 1, 1, 1,
-0.8464479, -0.07375114, -2.396494, 1, 1, 1, 1, 1,
-0.8410125, -0.9873039, -1.844061, 1, 1, 1, 1, 1,
-0.831063, 0.8651167, -2.495354, 1, 1, 1, 1, 1,
-0.8243794, 0.3347251, -1.193278, 1, 1, 1, 1, 1,
-0.8225995, -1.50865, -4.372424, 1, 1, 1, 1, 1,
-0.8180342, -1.95304, -0.721948, 1, 1, 1, 1, 1,
-0.8178219, 0.4577641, -1.721765, 1, 1, 1, 1, 1,
-0.8107655, 0.5391757, -1.756542, 1, 1, 1, 1, 1,
-0.8100224, -1.022051, -2.986278, 1, 1, 1, 1, 1,
-0.8088493, 1.498804, -1.040116, 0, 0, 1, 1, 1,
-0.8054, 0.06158948, -0.639061, 1, 0, 0, 1, 1,
-0.8009467, -0.1351222, -1.837331, 1, 0, 0, 1, 1,
-0.8007262, -0.2466811, -0.9881256, 1, 0, 0, 1, 1,
-0.7960435, 0.6203803, -0.4907786, 1, 0, 0, 1, 1,
-0.7958808, -0.632619, -2.64252, 1, 0, 0, 1, 1,
-0.7919, 0.4683594, -0.5062772, 0, 0, 0, 1, 1,
-0.7909641, 1.308596, 0.2634911, 0, 0, 0, 1, 1,
-0.7864656, 0.8871902, 0.9858846, 0, 0, 0, 1, 1,
-0.7809985, -1.514004, -2.845202, 0, 0, 0, 1, 1,
-0.7769976, 0.9061486, -1.905108, 0, 0, 0, 1, 1,
-0.7755166, -0.6200554, -1.728899, 0, 0, 0, 1, 1,
-0.7729677, -0.08907771, -0.9230127, 0, 0, 0, 1, 1,
-0.7725248, -0.9065644, -0.4136967, 1, 1, 1, 1, 1,
-0.769156, 1.166432, -1.377664, 1, 1, 1, 1, 1,
-0.7650114, -0.3516621, -1.296139, 1, 1, 1, 1, 1,
-0.7571463, 0.08279856, -1.674021, 1, 1, 1, 1, 1,
-0.7458796, 1.220108, -0.7483867, 1, 1, 1, 1, 1,
-0.7426645, -0.2980559, -2.157124, 1, 1, 1, 1, 1,
-0.7415161, -0.9411323, -2.663548, 1, 1, 1, 1, 1,
-0.7380838, -0.03231666, -1.498704, 1, 1, 1, 1, 1,
-0.7270861, 0.369936, 0.3584714, 1, 1, 1, 1, 1,
-0.7249977, -0.3556254, -2.746169, 1, 1, 1, 1, 1,
-0.7241395, 0.3533372, -1.122464, 1, 1, 1, 1, 1,
-0.7188321, -0.1032702, -1.786802, 1, 1, 1, 1, 1,
-0.7154797, -0.6950386, -3.322597, 1, 1, 1, 1, 1,
-0.7153557, 1.517483, -0.709335, 1, 1, 1, 1, 1,
-0.7118335, 0.7298115, 0.5862472, 1, 1, 1, 1, 1,
-0.7107891, 2.203145, 0.2124228, 0, 0, 1, 1, 1,
-0.7095447, 0.5664288, -3.059211, 1, 0, 0, 1, 1,
-0.7023764, 0.1304143, -1.831654, 1, 0, 0, 1, 1,
-0.698466, 0.3981, -0.4838424, 1, 0, 0, 1, 1,
-0.6977309, -0.2593747, -3.155287, 1, 0, 0, 1, 1,
-0.6973482, -1.830881, -4.001092, 1, 0, 0, 1, 1,
-0.6949325, 0.8229568, -1.389103, 0, 0, 0, 1, 1,
-0.6930119, 0.6612014, -0.7963248, 0, 0, 0, 1, 1,
-0.6915101, 0.4343826, 1.096989, 0, 0, 0, 1, 1,
-0.6908901, -0.9117371, -3.417605, 0, 0, 0, 1, 1,
-0.6851404, 0.1275494, 0.3688302, 0, 0, 0, 1, 1,
-0.6830715, 0.005658229, -2.145136, 0, 0, 0, 1, 1,
-0.6827991, -0.4997506, -0.1990585, 0, 0, 0, 1, 1,
-0.6824785, -0.1359496, -3.134956, 1, 1, 1, 1, 1,
-0.6817055, -0.1042572, -2.753573, 1, 1, 1, 1, 1,
-0.6752042, 0.009465858, -2.579896, 1, 1, 1, 1, 1,
-0.6696432, -0.4674067, -2.401504, 1, 1, 1, 1, 1,
-0.6694013, -0.8042562, -2.710114, 1, 1, 1, 1, 1,
-0.6690883, 1.517688, -2.698171, 1, 1, 1, 1, 1,
-0.661196, -0.4525431, -1.542328, 1, 1, 1, 1, 1,
-0.6560359, -0.2036486, -2.097569, 1, 1, 1, 1, 1,
-0.6542454, 0.7744988, -1.097374, 1, 1, 1, 1, 1,
-0.6524208, -0.1891893, -0.4339691, 1, 1, 1, 1, 1,
-0.6447653, -2.631953, -3.115601, 1, 1, 1, 1, 1,
-0.6436843, 0.7603369, 0.6039519, 1, 1, 1, 1, 1,
-0.6436157, -0.2671193, -0.4947446, 1, 1, 1, 1, 1,
-0.6304909, -1.259272, -1.848066, 1, 1, 1, 1, 1,
-0.6257657, -0.3771099, -4.417316, 1, 1, 1, 1, 1,
-0.6243392, -0.6744879, -2.347239, 0, 0, 1, 1, 1,
-0.6210917, 0.947318, -0.5569168, 1, 0, 0, 1, 1,
-0.6200164, 0.4925632, -1.342234, 1, 0, 0, 1, 1,
-0.6125672, -1.689943, -2.233878, 1, 0, 0, 1, 1,
-0.6121069, 1.756775, 0.8954565, 1, 0, 0, 1, 1,
-0.6111689, 0.7337266, -1.425802, 1, 0, 0, 1, 1,
-0.6084759, 1.188908, -0.7979098, 0, 0, 0, 1, 1,
-0.6046057, -0.9922621, -3.859893, 0, 0, 0, 1, 1,
-0.601535, 0.3032148, 0.5233589, 0, 0, 0, 1, 1,
-0.5967552, -0.3603047, -2.104661, 0, 0, 0, 1, 1,
-0.5911556, 0.1433964, -1.279684, 0, 0, 0, 1, 1,
-0.590611, 3.476143, 1.190346, 0, 0, 0, 1, 1,
-0.5872526, -0.06371164, -1.743518, 0, 0, 0, 1, 1,
-0.5797974, 0.6858976, -0.5007321, 1, 1, 1, 1, 1,
-0.5781297, 1.052577, 0.2100681, 1, 1, 1, 1, 1,
-0.5739613, -0.6986471, -2.237623, 1, 1, 1, 1, 1,
-0.5680581, -0.2905954, 0.2975998, 1, 1, 1, 1, 1,
-0.5667228, -0.4288322, -1.141006, 1, 1, 1, 1, 1,
-0.5647233, 1.498273, 0.1567975, 1, 1, 1, 1, 1,
-0.5646033, -0.8783858, -2.805337, 1, 1, 1, 1, 1,
-0.5631638, 1.703245, 0.415381, 1, 1, 1, 1, 1,
-0.5618712, -0.82608, -2.807188, 1, 1, 1, 1, 1,
-0.5614931, 0.4839442, -2.006113, 1, 1, 1, 1, 1,
-0.5570457, -1.148563, -1.99655, 1, 1, 1, 1, 1,
-0.5521795, 0.4734007, -0.07498564, 1, 1, 1, 1, 1,
-0.5518919, 0.3930368, -0.8037973, 1, 1, 1, 1, 1,
-0.5488909, -0.2526103, -0.6338517, 1, 1, 1, 1, 1,
-0.5462209, -0.4985775, -1.547817, 1, 1, 1, 1, 1,
-0.5456485, 1.126456, -0.1216853, 0, 0, 1, 1, 1,
-0.5399777, 0.7630842, -1.984304, 1, 0, 0, 1, 1,
-0.5317978, -0.1128337, -2.016257, 1, 0, 0, 1, 1,
-0.5265141, -0.07303384, -1.364846, 1, 0, 0, 1, 1,
-0.5246504, -0.4029315, -2.372974, 1, 0, 0, 1, 1,
-0.522498, 0.2531074, -2.648719, 1, 0, 0, 1, 1,
-0.5205494, -0.4991004, -1.203867, 0, 0, 0, 1, 1,
-0.5173798, -1.713728, -3.07382, 0, 0, 0, 1, 1,
-0.5136635, -1.256201, -3.855986, 0, 0, 0, 1, 1,
-0.5120929, -0.2395965, -0.4990908, 0, 0, 0, 1, 1,
-0.5063989, 1.051533, -0.5452735, 0, 0, 0, 1, 1,
-0.5057983, -0.2166234, -2.160396, 0, 0, 0, 1, 1,
-0.5046359, 0.259743, -2.068758, 0, 0, 0, 1, 1,
-0.5009529, 1.715138, -0.2676933, 1, 1, 1, 1, 1,
-0.4978929, -1.509404, -3.159327, 1, 1, 1, 1, 1,
-0.4952121, -0.3532137, -1.578089, 1, 1, 1, 1, 1,
-0.4948364, -0.8408929, -2.075747, 1, 1, 1, 1, 1,
-0.4906777, -0.8179674, -2.907799, 1, 1, 1, 1, 1,
-0.4895236, 0.07599732, -1.312662, 1, 1, 1, 1, 1,
-0.4873677, -1.746112, -3.179941, 1, 1, 1, 1, 1,
-0.4873247, -0.2454193, -2.387491, 1, 1, 1, 1, 1,
-0.486637, -0.1798353, -1.401386, 1, 1, 1, 1, 1,
-0.4841009, 0.05662698, 0.3213933, 1, 1, 1, 1, 1,
-0.4838691, -1.684392, -4.76165, 1, 1, 1, 1, 1,
-0.4803896, -1.116877, -3.7592, 1, 1, 1, 1, 1,
-0.479854, 0.1913274, 0.3696718, 1, 1, 1, 1, 1,
-0.4684631, 0.1400015, -0.104284, 1, 1, 1, 1, 1,
-0.459015, -0.09154771, -1.59751, 1, 1, 1, 1, 1,
-0.4589106, -1.225475, -4.967737, 0, 0, 1, 1, 1,
-0.4552748, 1.074179, 0.5214939, 1, 0, 0, 1, 1,
-0.454651, 0.5003444, -1.353224, 1, 0, 0, 1, 1,
-0.4502087, -1.497285, -4.568968, 1, 0, 0, 1, 1,
-0.4500291, 0.02840852, -0.3672426, 1, 0, 0, 1, 1,
-0.4498211, 1.296965, 0.6198581, 1, 0, 0, 1, 1,
-0.4456373, 2.108649, 0.6722276, 0, 0, 0, 1, 1,
-0.4424012, 1.281899, -1.459439, 0, 0, 0, 1, 1,
-0.4406493, 0.6256413, -0.3480067, 0, 0, 0, 1, 1,
-0.440325, -0.3799969, -1.661435, 0, 0, 0, 1, 1,
-0.4370932, -0.4659114, -3.204564, 0, 0, 0, 1, 1,
-0.4357708, 1.69875, -0.9275937, 0, 0, 0, 1, 1,
-0.4307378, 0.4118423, -0.5249422, 0, 0, 0, 1, 1,
-0.4299021, -0.3843667, -3.313698, 1, 1, 1, 1, 1,
-0.4269601, 1.221899, -1.069746, 1, 1, 1, 1, 1,
-0.4191349, -0.6325659, -4.060691, 1, 1, 1, 1, 1,
-0.418573, -1.651013, -3.153029, 1, 1, 1, 1, 1,
-0.4163975, 1.274333, 0.471763, 1, 1, 1, 1, 1,
-0.4093004, -0.4028886, -1.043222, 1, 1, 1, 1, 1,
-0.408465, -0.1469266, -2.581682, 1, 1, 1, 1, 1,
-0.4080867, -0.3286751, -3.805979, 1, 1, 1, 1, 1,
-0.4035344, 2.069724, 0.3876818, 1, 1, 1, 1, 1,
-0.3948336, -1.422318, -3.448968, 1, 1, 1, 1, 1,
-0.3912653, 0.4955244, -1.583553, 1, 1, 1, 1, 1,
-0.3911791, -1.663731, -2.4486, 1, 1, 1, 1, 1,
-0.3892258, 0.2618511, -0.1001447, 1, 1, 1, 1, 1,
-0.3886565, 1.301715, 0.1505269, 1, 1, 1, 1, 1,
-0.3873001, -0.100793, -2.925824, 1, 1, 1, 1, 1,
-0.3848748, -2.041749, -1.751389, 0, 0, 1, 1, 1,
-0.3801688, 0.3734342, 0.05639629, 1, 0, 0, 1, 1,
-0.3786434, 0.08179104, -2.146052, 1, 0, 0, 1, 1,
-0.377979, 0.6643508, -1.550163, 1, 0, 0, 1, 1,
-0.3741561, 1.91537, -0.458838, 1, 0, 0, 1, 1,
-0.370309, -2.360229, -2.98972, 1, 0, 0, 1, 1,
-0.3610919, 0.6088163, -0.7099051, 0, 0, 0, 1, 1,
-0.360606, -0.6979846, -4.306757, 0, 0, 0, 1, 1,
-0.36026, -0.6705018, -2.063317, 0, 0, 0, 1, 1,
-0.3580204, 0.2713825, -0.8890398, 0, 0, 0, 1, 1,
-0.3580169, 1.271227, -0.1713928, 0, 0, 0, 1, 1,
-0.3578978, 0.01394736, 0.6251314, 0, 0, 0, 1, 1,
-0.3551132, -1.15201, -3.416618, 0, 0, 0, 1, 1,
-0.3541121, -0.4090258, -1.9683, 1, 1, 1, 1, 1,
-0.3535658, -2.472637, -4.319381, 1, 1, 1, 1, 1,
-0.3533443, 0.292248, -2.105256, 1, 1, 1, 1, 1,
-0.3500967, -0.6866676, -4.157273, 1, 1, 1, 1, 1,
-0.3488157, -0.1090347, -1.677286, 1, 1, 1, 1, 1,
-0.3484678, 1.387416, -1.892981, 1, 1, 1, 1, 1,
-0.3474963, -1.141976, -2.420176, 1, 1, 1, 1, 1,
-0.3467905, 1.265086, 0.503023, 1, 1, 1, 1, 1,
-0.3442284, 0.2396601, -1.493925, 1, 1, 1, 1, 1,
-0.3440003, 0.3378191, 0.7556618, 1, 1, 1, 1, 1,
-0.3416587, -0.845651, -3.048182, 1, 1, 1, 1, 1,
-0.3399701, 1.671831, 1.215307, 1, 1, 1, 1, 1,
-0.3386923, -0.2922716, -1.952734, 1, 1, 1, 1, 1,
-0.3312086, 0.4886677, -1.327761, 1, 1, 1, 1, 1,
-0.3301619, -0.5104646, -3.463071, 1, 1, 1, 1, 1,
-0.3278962, -0.4246088, -2.038746, 0, 0, 1, 1, 1,
-0.3251105, -0.3447056, -2.560462, 1, 0, 0, 1, 1,
-0.3246905, 1.218714, 0.4764338, 1, 0, 0, 1, 1,
-0.3240764, -2.237521, -2.471054, 1, 0, 0, 1, 1,
-0.3206311, 0.7294695, -2.478027, 1, 0, 0, 1, 1,
-0.3192996, -0.5863401, -2.548021, 1, 0, 0, 1, 1,
-0.3190928, -0.9195074, -4.530128, 0, 0, 0, 1, 1,
-0.3168483, 0.07036249, -3.349176, 0, 0, 0, 1, 1,
-0.3125594, -0.6113684, -4.636413, 0, 0, 0, 1, 1,
-0.3108742, -0.6739938, -1.376974, 0, 0, 0, 1, 1,
-0.3105288, -1.228118, -4.268696, 0, 0, 0, 1, 1,
-0.3065272, 0.2403991, 0.1985918, 0, 0, 0, 1, 1,
-0.305171, -1.597563, -3.58037, 0, 0, 0, 1, 1,
-0.304837, -0.6884146, -1.493777, 1, 1, 1, 1, 1,
-0.3044997, -0.4239926, -2.87743, 1, 1, 1, 1, 1,
-0.3037745, 0.631423, 1.273253, 1, 1, 1, 1, 1,
-0.3025887, -0.1697804, -2.995506, 1, 1, 1, 1, 1,
-0.3019165, 0.07513608, -0.5058271, 1, 1, 1, 1, 1,
-0.29394, -1.010415, -3.800341, 1, 1, 1, 1, 1,
-0.2904978, -1.171466, -2.355051, 1, 1, 1, 1, 1,
-0.2899556, -0.9724413, -3.391943, 1, 1, 1, 1, 1,
-0.289028, 1.406142, 0.844389, 1, 1, 1, 1, 1,
-0.2876717, -0.4163661, -2.181013, 1, 1, 1, 1, 1,
-0.2863986, -1.199895, -1.558618, 1, 1, 1, 1, 1,
-0.2815067, -1.254125, -1.08858, 1, 1, 1, 1, 1,
-0.280892, -0.0497677, -1.099797, 1, 1, 1, 1, 1,
-0.2762614, -0.4782432, -2.216473, 1, 1, 1, 1, 1,
-0.2682721, 0.9808065, -0.7179976, 1, 1, 1, 1, 1,
-0.2663749, -0.0155323, -0.5260726, 0, 0, 1, 1, 1,
-0.2660747, -0.3366883, -2.839747, 1, 0, 0, 1, 1,
-0.2610621, -1.527335, -4.246053, 1, 0, 0, 1, 1,
-0.2571976, 1.060999, -0.03868563, 1, 0, 0, 1, 1,
-0.2554506, -0.06640159, -0.9186202, 1, 0, 0, 1, 1,
-0.2543757, 1.000269, -0.9542919, 1, 0, 0, 1, 1,
-0.2517945, -0.6157931, -2.72569, 0, 0, 0, 1, 1,
-0.2507026, 0.1294391, -2.43761, 0, 0, 0, 1, 1,
-0.2488149, 0.100213, -0.326782, 0, 0, 0, 1, 1,
-0.2339964, 0.01453918, -0.6112644, 0, 0, 0, 1, 1,
-0.233491, 2.218352, -0.7943851, 0, 0, 0, 1, 1,
-0.2330419, 0.4548421, 0.5054018, 0, 0, 0, 1, 1,
-0.2276011, 0.5559763, -1.485489, 0, 0, 0, 1, 1,
-0.2270092, -0.3342471, -1.480077, 1, 1, 1, 1, 1,
-0.2258596, 0.1042288, -1.181225, 1, 1, 1, 1, 1,
-0.2249132, 1.990834, 0.7312481, 1, 1, 1, 1, 1,
-0.2248482, -0.4857119, -3.382775, 1, 1, 1, 1, 1,
-0.2175664, -2.117753, -4.035766, 1, 1, 1, 1, 1,
-0.2160946, -0.9390709, -4.229206, 1, 1, 1, 1, 1,
-0.2156379, -0.5550635, -3.621137, 1, 1, 1, 1, 1,
-0.2099838, -0.8972406, -2.50388, 1, 1, 1, 1, 1,
-0.2069554, -1.058037, -2.578958, 1, 1, 1, 1, 1,
-0.2046423, -0.9442865, -2.771483, 1, 1, 1, 1, 1,
-0.2039256, -1.237268, -2.624434, 1, 1, 1, 1, 1,
-0.2030055, -0.2449364, -2.811008, 1, 1, 1, 1, 1,
-0.1990049, -1.792468, -4.616987, 1, 1, 1, 1, 1,
-0.1934737, 1.312863, -1.289232, 1, 1, 1, 1, 1,
-0.1929956, -0.2870986, -3.269401, 1, 1, 1, 1, 1,
-0.1892559, -0.8527117, -3.812755, 0, 0, 1, 1, 1,
-0.1841409, 1.146692, -1.884425, 1, 0, 0, 1, 1,
-0.1799718, 0.5722037, 0.3713324, 1, 0, 0, 1, 1,
-0.179113, -0.1873072, -2.744189, 1, 0, 0, 1, 1,
-0.176486, -0.01120657, -1.428838, 1, 0, 0, 1, 1,
-0.1762827, 0.2944877, -1.130032, 1, 0, 0, 1, 1,
-0.1744518, -0.5127338, -1.810644, 0, 0, 0, 1, 1,
-0.1743081, 0.8460037, -1.221943, 0, 0, 0, 1, 1,
-0.1740241, -1.854534, -2.777424, 0, 0, 0, 1, 1,
-0.1707409, -0.5609476, -3.5019, 0, 0, 0, 1, 1,
-0.1682224, -0.6051202, -2.410974, 0, 0, 0, 1, 1,
-0.1669706, -2.081998, -3.603777, 0, 0, 0, 1, 1,
-0.1643391, 0.2456351, -2.477257, 0, 0, 0, 1, 1,
-0.1527163, -1.05036, -2.697099, 1, 1, 1, 1, 1,
-0.1524669, -0.5016502, -1.700462, 1, 1, 1, 1, 1,
-0.1510599, 0.09247424, -1.508448, 1, 1, 1, 1, 1,
-0.1438657, -0.1552468, -1.851941, 1, 1, 1, 1, 1,
-0.1366843, 0.5623637, 0.08401614, 1, 1, 1, 1, 1,
-0.1308188, -0.01574238, -1.469342, 1, 1, 1, 1, 1,
-0.1306372, 0.2960086, -0.4775127, 1, 1, 1, 1, 1,
-0.1296228, 0.6385679, -0.595315, 1, 1, 1, 1, 1,
-0.1267048, -0.2106023, -3.893816, 1, 1, 1, 1, 1,
-0.1262769, 0.6514909, -1.257703, 1, 1, 1, 1, 1,
-0.1217639, -0.4270313, -4.848988, 1, 1, 1, 1, 1,
-0.1187811, -1.04299, -2.988964, 1, 1, 1, 1, 1,
-0.1184446, 2.0717, 1.513622, 1, 1, 1, 1, 1,
-0.114624, -0.4300724, -3.30057, 1, 1, 1, 1, 1,
-0.1093244, -0.1244047, -2.990675, 1, 1, 1, 1, 1,
-0.1092173, 0.08095567, -0.6014246, 0, 0, 1, 1, 1,
-0.1023569, -0.9561042, -2.950439, 1, 0, 0, 1, 1,
-0.09330969, -0.177209, -1.952449, 1, 0, 0, 1, 1,
-0.093292, -1.10237, -3.783514, 1, 0, 0, 1, 1,
-0.08963183, -0.2710174, -4.524573, 1, 0, 0, 1, 1,
-0.08841899, -0.5298171, -2.926011, 1, 0, 0, 1, 1,
-0.08736505, -0.06151379, -2.153002, 0, 0, 0, 1, 1,
-0.08328506, -1.326314, -1.715288, 0, 0, 0, 1, 1,
-0.0822909, 0.7551157, 0.9781159, 0, 0, 0, 1, 1,
-0.0794764, -0.6315964, -4.48192, 0, 0, 0, 1, 1,
-0.07571381, 0.3809168, 1.139459, 0, 0, 0, 1, 1,
-0.07514974, 0.1708014, -0.5333068, 0, 0, 0, 1, 1,
-0.07425889, 1.101461, 0.6406363, 0, 0, 0, 1, 1,
-0.07398286, -2.322516, -2.866287, 1, 1, 1, 1, 1,
-0.0713497, 0.8972392, 1.460615, 1, 1, 1, 1, 1,
-0.07027755, 1.014226, 2.265253, 1, 1, 1, 1, 1,
-0.06824119, 0.6282975, 0.9271572, 1, 1, 1, 1, 1,
-0.06780621, -1.087375, -3.207526, 1, 1, 1, 1, 1,
-0.06533023, 0.5750195, 0.3075356, 1, 1, 1, 1, 1,
-0.06351402, -0.4822506, -4.143263, 1, 1, 1, 1, 1,
-0.06201638, 0.9886873, 1.272892, 1, 1, 1, 1, 1,
-0.06127515, 0.2967914, 0.02602923, 1, 1, 1, 1, 1,
-0.05905171, -0.9788221, -3.660637, 1, 1, 1, 1, 1,
-0.05696514, -1.430041, -3.285504, 1, 1, 1, 1, 1,
-0.05620778, -0.9774544, -2.039352, 1, 1, 1, 1, 1,
-0.05469538, -0.870162, -1.752981, 1, 1, 1, 1, 1,
-0.05146172, -0.8003435, -4.022488, 1, 1, 1, 1, 1,
-0.05031031, -0.932661, -3.653527, 1, 1, 1, 1, 1,
-0.04751556, 0.09317087, 1.800441, 0, 0, 1, 1, 1,
-0.04335176, 0.8773501, -0.1151488, 1, 0, 0, 1, 1,
-0.04305697, 0.6643616, -1.619446, 1, 0, 0, 1, 1,
-0.04108857, 0.06117366, -2.443856, 1, 0, 0, 1, 1,
-0.03661047, 0.08323328, 0.950721, 1, 0, 0, 1, 1,
-0.03551029, -1.630307, -4.100529, 1, 0, 0, 1, 1,
-0.03459259, 0.06982784, 0.1172384, 0, 0, 0, 1, 1,
-0.03348319, 0.2842918, 1.171611, 0, 0, 0, 1, 1,
-0.03037616, 0.7107322, -1.039539, 0, 0, 0, 1, 1,
-0.02865096, 1.328277, -0.613039, 0, 0, 0, 1, 1,
-0.02609574, 0.1635652, 1.340999, 0, 0, 0, 1, 1,
-0.01712571, 0.8192827, 1.01066, 0, 0, 0, 1, 1,
-0.0147066, -0.05307708, -2.371866, 0, 0, 0, 1, 1,
-0.01308967, 0.7381027, 0.5820091, 1, 1, 1, 1, 1,
-0.01149921, -1.356206, -1.962195, 1, 1, 1, 1, 1,
-0.01072221, 0.2208136, -0.5443053, 1, 1, 1, 1, 1,
-0.009795518, 1.132095, -0.5361293, 1, 1, 1, 1, 1,
-0.007366427, 1.075038, -0.2028315, 1, 1, 1, 1, 1,
-0.005613144, 1.170047, -0.8728597, 1, 1, 1, 1, 1,
-0.005007371, 0.2426991, -0.6412969, 1, 1, 1, 1, 1,
-0.002067422, -0.01460543, -2.936004, 1, 1, 1, 1, 1,
0.003553689, -0.9961709, 3.089582, 1, 1, 1, 1, 1,
0.003739775, 0.649868, 0.2136609, 1, 1, 1, 1, 1,
0.004002176, -1.284734, 4.091755, 1, 1, 1, 1, 1,
0.006752516, -0.6372032, 3.761147, 1, 1, 1, 1, 1,
0.01319256, 0.8896701, -2.355677, 1, 1, 1, 1, 1,
0.01325765, -1.143779, 4.335776, 1, 1, 1, 1, 1,
0.01675242, -0.755425, 3.30021, 1, 1, 1, 1, 1,
0.01823915, 0.121054, 2.241674, 0, 0, 1, 1, 1,
0.0187098, -1.025518, 4.397069, 1, 0, 0, 1, 1,
0.0189867, 0.6139762, -0.1450551, 1, 0, 0, 1, 1,
0.01904547, -0.740675, 3.052911, 1, 0, 0, 1, 1,
0.0207344, 0.4329104, 1.002532, 1, 0, 0, 1, 1,
0.0264071, 0.7588415, -0.7953977, 1, 0, 0, 1, 1,
0.02978542, 1.255804, -0.3442273, 0, 0, 0, 1, 1,
0.03148637, -3.221887, 2.484894, 0, 0, 0, 1, 1,
0.03282664, 0.2993356, 0.2022329, 0, 0, 0, 1, 1,
0.035606, 0.4714001, -0.4150157, 0, 0, 0, 1, 1,
0.03923369, -1.952724, 2.157359, 0, 0, 0, 1, 1,
0.04001967, 0.9313445, -1.01777, 0, 0, 0, 1, 1,
0.04514233, 0.2171424, 0.6964384, 0, 0, 0, 1, 1,
0.0452176, 1.817186, -0.1693511, 1, 1, 1, 1, 1,
0.04735839, 0.5639441, -1.432324, 1, 1, 1, 1, 1,
0.05421269, 0.06902473, -0.3649524, 1, 1, 1, 1, 1,
0.05450545, 0.3110107, 0.9882107, 1, 1, 1, 1, 1,
0.05506112, 0.4546535, 0.8662648, 1, 1, 1, 1, 1,
0.05598056, -1.321336, 3.684265, 1, 1, 1, 1, 1,
0.05701143, 0.8082452, 0.4506078, 1, 1, 1, 1, 1,
0.06010748, 0.1343984, 0.7488972, 1, 1, 1, 1, 1,
0.06303589, 0.8867774, -1.334383, 1, 1, 1, 1, 1,
0.06675844, -0.4497364, 1.998397, 1, 1, 1, 1, 1,
0.07076203, 1.775967, -0.2825983, 1, 1, 1, 1, 1,
0.07717509, -0.9119149, 3.496607, 1, 1, 1, 1, 1,
0.07805841, -0.8675672, 2.806591, 1, 1, 1, 1, 1,
0.07988694, 0.3166877, 0.7953098, 1, 1, 1, 1, 1,
0.08132694, -0.3118693, 3.35094, 1, 1, 1, 1, 1,
0.08318247, -0.5767608, 2.321837, 0, 0, 1, 1, 1,
0.08543742, -1.967752, 1.836216, 1, 0, 0, 1, 1,
0.08675831, 0.7785156, -0.6743932, 1, 0, 0, 1, 1,
0.09444961, -1.282808, 3.326519, 1, 0, 0, 1, 1,
0.09669629, -0.7317216, 3.695976, 1, 0, 0, 1, 1,
0.09750379, 0.5299972, -1.015293, 1, 0, 0, 1, 1,
0.101327, 0.6891294, 0.3469203, 0, 0, 0, 1, 1,
0.1030089, -0.3511087, 3.84204, 0, 0, 0, 1, 1,
0.1053062, 0.1509057, 0.6202866, 0, 0, 0, 1, 1,
0.1055501, -0.6030504, 2.103509, 0, 0, 0, 1, 1,
0.1062627, 1.184435, 1.921136, 0, 0, 0, 1, 1,
0.1064647, -0.4630587, 2.756011, 0, 0, 0, 1, 1,
0.1070085, -2.417043, 1.411842, 0, 0, 0, 1, 1,
0.1085963, 0.5884751, 0.1810225, 1, 1, 1, 1, 1,
0.1175334, -0.257863, 3.087071, 1, 1, 1, 1, 1,
0.1212972, -0.05106819, 3.099943, 1, 1, 1, 1, 1,
0.1295285, -1.889887, 1.300445, 1, 1, 1, 1, 1,
0.131774, 0.6733254, -0.8566157, 1, 1, 1, 1, 1,
0.1344198, 0.4768881, 1.166498, 1, 1, 1, 1, 1,
0.1352328, -0.4326358, 2.600235, 1, 1, 1, 1, 1,
0.1378806, 0.2005654, 0.371667, 1, 1, 1, 1, 1,
0.1434134, 1.543403, -1.122835, 1, 1, 1, 1, 1,
0.1442622, 1.205397, -0.3340228, 1, 1, 1, 1, 1,
0.1454289, -0.4724283, 3.082319, 1, 1, 1, 1, 1,
0.1489249, -0.5907449, 3.487387, 1, 1, 1, 1, 1,
0.1490895, -1.052766, 1.138296, 1, 1, 1, 1, 1,
0.1516367, 0.6247394, -1.050604, 1, 1, 1, 1, 1,
0.1572681, 0.1027429, -0.3428941, 1, 1, 1, 1, 1,
0.1619275, -0.6377512, 2.190529, 0, 0, 1, 1, 1,
0.1641257, 1.124552, 0.4472654, 1, 0, 0, 1, 1,
0.1643197, 1.080718, -0.6374986, 1, 0, 0, 1, 1,
0.1674498, 0.8635026, 1.549435, 1, 0, 0, 1, 1,
0.1691442, -0.7325029, 3.947143, 1, 0, 0, 1, 1,
0.1705812, 1.110265, 1.141103, 1, 0, 0, 1, 1,
0.1716527, 0.2016006, -0.1322031, 0, 0, 0, 1, 1,
0.1726796, -0.5149187, 4.721653, 0, 0, 0, 1, 1,
0.1727192, 0.6074706, 0.7146816, 0, 0, 0, 1, 1,
0.1727814, 0.4595269, 0.3427305, 0, 0, 0, 1, 1,
0.1767282, -0.6003445, 2.205137, 0, 0, 0, 1, 1,
0.1768556, 0.6276239, 1.33144, 0, 0, 0, 1, 1,
0.1773443, 1.450977, -1.967685, 0, 0, 0, 1, 1,
0.1795228, -0.2305759, 3.497916, 1, 1, 1, 1, 1,
0.1796311, 0.2803474, 1.570521, 1, 1, 1, 1, 1,
0.1813002, 1.365075, 1.834955, 1, 1, 1, 1, 1,
0.1896851, -0.1767637, 0.3986662, 1, 1, 1, 1, 1,
0.1948473, -1.165014, 3.510333, 1, 1, 1, 1, 1,
0.1962265, -0.5413353, 4.412838, 1, 1, 1, 1, 1,
0.2022773, -0.4390885, 1.648068, 1, 1, 1, 1, 1,
0.2044811, 1.526212, 0.6147452, 1, 1, 1, 1, 1,
0.2112943, -1.778237, 3.663528, 1, 1, 1, 1, 1,
0.2172654, -0.08647148, 0.5321857, 1, 1, 1, 1, 1,
0.2191413, -0.1309406, 2.980613, 1, 1, 1, 1, 1,
0.2233782, -0.6420285, 4.195756, 1, 1, 1, 1, 1,
0.2253828, 1.031769, 0.05677034, 1, 1, 1, 1, 1,
0.2271304, -0.7171955, 3.245262, 1, 1, 1, 1, 1,
0.2303754, -0.2255279, 2.1303, 1, 1, 1, 1, 1,
0.2320148, -0.3678161, 3.524767, 0, 0, 1, 1, 1,
0.2356246, 0.5925696, -1.066177, 1, 0, 0, 1, 1,
0.2358219, -0.7605536, 4.937476, 1, 0, 0, 1, 1,
0.2384629, 0.5911152, 0.9698086, 1, 0, 0, 1, 1,
0.2390987, -0.6043901, 4.982025, 1, 0, 0, 1, 1,
0.2393641, 0.835377, -0.3309437, 1, 0, 0, 1, 1,
0.241193, 0.6553992, -0.8138733, 0, 0, 0, 1, 1,
0.2442351, -0.2616668, 2.955416, 0, 0, 0, 1, 1,
0.2476109, -1.953879, 3.316003, 0, 0, 0, 1, 1,
0.2548946, -1.677167, 2.711952, 0, 0, 0, 1, 1,
0.2573344, 1.876406, 0.763923, 0, 0, 0, 1, 1,
0.2594681, 0.1580449, 1.713122, 0, 0, 0, 1, 1,
0.2603454, -0.5920519, 3.545782, 0, 0, 0, 1, 1,
0.2611046, 1.879849, 0.3440255, 1, 1, 1, 1, 1,
0.2634085, -0.6743636, 2.964108, 1, 1, 1, 1, 1,
0.2636478, 0.3891839, 0.6820021, 1, 1, 1, 1, 1,
0.2667654, -0.09026848, 1.057886, 1, 1, 1, 1, 1,
0.2713976, 1.867058, -0.7988465, 1, 1, 1, 1, 1,
0.2722068, 0.6061217, 1.454344, 1, 1, 1, 1, 1,
0.27433, -0.8497794, 2.64009, 1, 1, 1, 1, 1,
0.2764903, -0.2763735, 2.177548, 1, 1, 1, 1, 1,
0.2777496, -0.2258632, 2.432752, 1, 1, 1, 1, 1,
0.281841, -0.09082939, 2.348605, 1, 1, 1, 1, 1,
0.2852399, -0.2640786, 2.513417, 1, 1, 1, 1, 1,
0.2870516, 0.7878159, -0.09358044, 1, 1, 1, 1, 1,
0.2888907, 0.5786734, -1.35501, 1, 1, 1, 1, 1,
0.2908179, 0.7076088, -0.4852323, 1, 1, 1, 1, 1,
0.3015697, 0.3471299, 0.1367023, 1, 1, 1, 1, 1,
0.3019828, 0.8618302, 2.715869, 0, 0, 1, 1, 1,
0.3068904, 1.330416, 0.01620407, 1, 0, 0, 1, 1,
0.3131974, 1.788904, -1.533967, 1, 0, 0, 1, 1,
0.3174473, -0.9878403, 5.032934, 1, 0, 0, 1, 1,
0.3220292, 0.4949616, -0.2054223, 1, 0, 0, 1, 1,
0.3297542, -1.592653, 1.30828, 1, 0, 0, 1, 1,
0.3329387, 1.743559, 0.3942494, 0, 0, 0, 1, 1,
0.3353398, 0.9836601, 0.4627313, 0, 0, 0, 1, 1,
0.3454988, -0.2906565, 1.02854, 0, 0, 0, 1, 1,
0.3526044, 0.1535214, 3.120083, 0, 0, 0, 1, 1,
0.3542196, -1.206589, 2.377182, 0, 0, 0, 1, 1,
0.3552645, 0.09430026, 1.593449, 0, 0, 0, 1, 1,
0.3613802, 0.9520636, 0.8677464, 0, 0, 0, 1, 1,
0.3617799, 0.9623284, 2.003036, 1, 1, 1, 1, 1,
0.3621257, 0.2348492, 1.979182, 1, 1, 1, 1, 1,
0.3645663, 0.9424437, 0.6483108, 1, 1, 1, 1, 1,
0.3668, 1.35955, -0.1856579, 1, 1, 1, 1, 1,
0.3678001, -0.8278337, 3.027243, 1, 1, 1, 1, 1,
0.371849, 0.6793288, 1.67081, 1, 1, 1, 1, 1,
0.3731841, -0.3111855, 1.174326, 1, 1, 1, 1, 1,
0.3765984, -0.4118021, 0.6779637, 1, 1, 1, 1, 1,
0.3771612, -0.380217, 0.2684149, 1, 1, 1, 1, 1,
0.3772733, -0.4787202, 3.783706, 1, 1, 1, 1, 1,
0.3790028, -1.009207, 4.595785, 1, 1, 1, 1, 1,
0.3815419, 1.416229, -1.672161, 1, 1, 1, 1, 1,
0.3853874, -0.6916692, 3.270749, 1, 1, 1, 1, 1,
0.394174, 0.5615269, 0.2890635, 1, 1, 1, 1, 1,
0.3958589, -1.082552, 2.430868, 1, 1, 1, 1, 1,
0.4010834, 1.566494, 0.2422148, 0, 0, 1, 1, 1,
0.4053842, 0.4371199, -0.1317106, 1, 0, 0, 1, 1,
0.4062376, 1.482788, -0.9590117, 1, 0, 0, 1, 1,
0.4129933, 1.43512, -0.2331226, 1, 0, 0, 1, 1,
0.4166812, -0.6926605, 2.619458, 1, 0, 0, 1, 1,
0.4173553, -0.2744757, -0.04669547, 1, 0, 0, 1, 1,
0.4196405, -1.378496, 3.113992, 0, 0, 0, 1, 1,
0.4198419, -0.4283585, 2.998795, 0, 0, 0, 1, 1,
0.4237252, -1.730987, 2.89312, 0, 0, 0, 1, 1,
0.4294118, 0.6362268, -1.683595, 0, 0, 0, 1, 1,
0.4332845, 0.2052942, 1.874218, 0, 0, 0, 1, 1,
0.4338157, 0.1849384, 0.05193098, 0, 0, 0, 1, 1,
0.4346797, 0.7224083, 0.0608998, 0, 0, 0, 1, 1,
0.4351229, -2.109468, 4.450986, 1, 1, 1, 1, 1,
0.437304, 0.7953879, 1.435837, 1, 1, 1, 1, 1,
0.439125, -0.04587121, 1.308338, 1, 1, 1, 1, 1,
0.4462157, 0.3807143, 1.751831, 1, 1, 1, 1, 1,
0.4476421, -1.581765, 3.582436, 1, 1, 1, 1, 1,
0.450737, -0.006091501, 0.8412186, 1, 1, 1, 1, 1,
0.4564875, -1.202904, 0.4367245, 1, 1, 1, 1, 1,
0.4614579, 0.07040568, 2.130089, 1, 1, 1, 1, 1,
0.4618434, -0.0470568, 1.550705, 1, 1, 1, 1, 1,
0.4624196, 0.2163114, 2.318457, 1, 1, 1, 1, 1,
0.4626496, 1.979364, -0.6685819, 1, 1, 1, 1, 1,
0.4638865, 1.971471, 0.8263345, 1, 1, 1, 1, 1,
0.4639295, -1.38576, 4.072977, 1, 1, 1, 1, 1,
0.4642387, 0.4236124, -0.5335159, 1, 1, 1, 1, 1,
0.4706526, 0.09722941, 2.510397, 1, 1, 1, 1, 1,
0.4724689, -0.06969783, 1.039121, 0, 0, 1, 1, 1,
0.4737155, 0.4314174, 0.7259752, 1, 0, 0, 1, 1,
0.4747256, 0.8155698, -0.8326529, 1, 0, 0, 1, 1,
0.4749649, -0.6238, 2.771025, 1, 0, 0, 1, 1,
0.475869, -0.3154947, 0.3296521, 1, 0, 0, 1, 1,
0.4824651, -0.9739308, 2.180332, 1, 0, 0, 1, 1,
0.4886647, -0.0668451, 0.1828304, 0, 0, 0, 1, 1,
0.4894162, 1.016804, 0.2712794, 0, 0, 0, 1, 1,
0.4900801, -0.4170941, 2.606508, 0, 0, 0, 1, 1,
0.4925914, -0.7603686, 1.911753, 0, 0, 0, 1, 1,
0.4926039, -0.7504653, 2.136852, 0, 0, 0, 1, 1,
0.5035221, -0.9795068, 2.663764, 0, 0, 0, 1, 1,
0.5043153, -0.9217824, 2.859804, 0, 0, 0, 1, 1,
0.5062301, -1.028173, 1.953385, 1, 1, 1, 1, 1,
0.5082719, 1.133701, 0.9523964, 1, 1, 1, 1, 1,
0.5092273, -0.1373161, 2.035746, 1, 1, 1, 1, 1,
0.510571, -0.6023912, 3.262645, 1, 1, 1, 1, 1,
0.5178925, 0.38091, 1.952192, 1, 1, 1, 1, 1,
0.5186257, -1.110073, 4.200524, 1, 1, 1, 1, 1,
0.520924, -0.4428568, 1.55853, 1, 1, 1, 1, 1,
0.5261613, 1.172135, 1.119685, 1, 1, 1, 1, 1,
0.5296916, -0.973553, 1.725374, 1, 1, 1, 1, 1,
0.5338186, 1.748489, 0.1307865, 1, 1, 1, 1, 1,
0.5371442, 1.692502, -0.5563894, 1, 1, 1, 1, 1,
0.5385936, -0.2979446, 2.332838, 1, 1, 1, 1, 1,
0.5436379, -1.034696, 3.132614, 1, 1, 1, 1, 1,
0.5442337, 2.226453, 0.965624, 1, 1, 1, 1, 1,
0.5458643, 0.9145384, 1.008695, 1, 1, 1, 1, 1,
0.5482736, 0.1611782, -0.01782053, 0, 0, 1, 1, 1,
0.5486714, 0.160728, 1.670522, 1, 0, 0, 1, 1,
0.5507294, 0.04729607, 1.259073, 1, 0, 0, 1, 1,
0.5563228, 1.164624, -0.03968453, 1, 0, 0, 1, 1,
0.5653955, -0.7601934, 4.635859, 1, 0, 0, 1, 1,
0.5664805, 0.669712, 0.9529579, 1, 0, 0, 1, 1,
0.568122, 0.3261158, 1.021036, 0, 0, 0, 1, 1,
0.5786964, 0.6074891, 0.9867619, 0, 0, 0, 1, 1,
0.5835617, 1.8082, 1.227487, 0, 0, 0, 1, 1,
0.5918398, -1.991681, 1.811213, 0, 0, 0, 1, 1,
0.5937872, -1.010402, 2.288353, 0, 0, 0, 1, 1,
0.5984682, -0.3466636, 2.693731, 0, 0, 0, 1, 1,
0.6029157, 0.1179781, 2.028328, 0, 0, 0, 1, 1,
0.6051287, 0.9479405, 0.7646054, 1, 1, 1, 1, 1,
0.6068717, 0.3200015, 1.372066, 1, 1, 1, 1, 1,
0.6113666, 0.0001488344, 2.046238, 1, 1, 1, 1, 1,
0.6146426, -0.4091981, 0.1488761, 1, 1, 1, 1, 1,
0.6156111, -0.7356861, 2.605811, 1, 1, 1, 1, 1,
0.621128, 0.2828598, 1.604371, 1, 1, 1, 1, 1,
0.6215158, -1.708045, 3.509772, 1, 1, 1, 1, 1,
0.6232047, -1.041922, 2.331932, 1, 1, 1, 1, 1,
0.6294395, -0.03236758, 3.629681, 1, 1, 1, 1, 1,
0.6317483, -0.1404654, 3.07508, 1, 1, 1, 1, 1,
0.6369878, 0.0784703, 1.557771, 1, 1, 1, 1, 1,
0.6387952, 1.639143, -1.045649, 1, 1, 1, 1, 1,
0.6413056, 1.713064, 0.2759381, 1, 1, 1, 1, 1,
0.6515009, 0.9292516, -0.805527, 1, 1, 1, 1, 1,
0.6550581, 0.274139, -0.1033784, 1, 1, 1, 1, 1,
0.6584231, 1.012926, 2.204848, 0, 0, 1, 1, 1,
0.6638177, -0.0679189, 1.92322, 1, 0, 0, 1, 1,
0.6664802, -0.3162157, 2.485182, 1, 0, 0, 1, 1,
0.6682963, 1.530066, -0.7948, 1, 0, 0, 1, 1,
0.6683117, -0.7362984, 3.723795, 1, 0, 0, 1, 1,
0.6753887, -1.210546, 2.450025, 1, 0, 0, 1, 1,
0.6758135, 0.6767655, 2.113158, 0, 0, 0, 1, 1,
0.6762955, -0.8656434, 2.330626, 0, 0, 0, 1, 1,
0.6815698, 0.398915, 1.810367, 0, 0, 0, 1, 1,
0.6817719, -2.705772, 0.7147155, 0, 0, 0, 1, 1,
0.6871946, 0.7890137, 0.8664664, 0, 0, 0, 1, 1,
0.6897168, 1.160632, 0.7985176, 0, 0, 0, 1, 1,
0.6913593, 0.07962007, 2.149874, 0, 0, 0, 1, 1,
0.6925318, -1.290598, 2.683525, 1, 1, 1, 1, 1,
0.693106, -0.04570768, 2.315137, 1, 1, 1, 1, 1,
0.6933347, 0.236874, 2.370251, 1, 1, 1, 1, 1,
0.6943529, 1.524712, 1.015539, 1, 1, 1, 1, 1,
0.7116488, 0.4781801, 1.402207, 1, 1, 1, 1, 1,
0.7117894, 0.5256628, 1.169395, 1, 1, 1, 1, 1,
0.7118582, 0.5137599, 0.493302, 1, 1, 1, 1, 1,
0.7177293, 0.9044983, 0.4202804, 1, 1, 1, 1, 1,
0.7188696, -0.03303346, 0.3555569, 1, 1, 1, 1, 1,
0.7198752, 1.387932, 0.2262756, 1, 1, 1, 1, 1,
0.7223067, -2.114701, 3.190229, 1, 1, 1, 1, 1,
0.7245942, 0.01711659, 2.450176, 1, 1, 1, 1, 1,
0.7252132, -0.447043, 1.661862, 1, 1, 1, 1, 1,
0.730126, 0.1150356, 0.9061291, 1, 1, 1, 1, 1,
0.7359974, 1.874251, 1.618553, 1, 1, 1, 1, 1,
0.751527, 0.5380527, -0.4786072, 0, 0, 1, 1, 1,
0.7515779, -0.1348457, 1.507061, 1, 0, 0, 1, 1,
0.7602654, 0.05550541, 0.9649673, 1, 0, 0, 1, 1,
0.7608649, 1.854446, 2.364006, 1, 0, 0, 1, 1,
0.7624874, 1.562015, 0.3921411, 1, 0, 0, 1, 1,
0.7704244, 1.208042, 0.8879764, 1, 0, 0, 1, 1,
0.7742772, 0.2886951, 2.23063, 0, 0, 0, 1, 1,
0.7777461, -1.190974, 2.779847, 0, 0, 0, 1, 1,
0.7796812, -2.084145, 1.005379, 0, 0, 0, 1, 1,
0.7837752, -0.7275485, 2.849364, 0, 0, 0, 1, 1,
0.7859614, 1.588351, -0.8129131, 0, 0, 0, 1, 1,
0.7877743, 0.2236185, 2.39454, 0, 0, 0, 1, 1,
0.7950959, -0.9162786, 2.4485, 0, 0, 0, 1, 1,
0.7958676, -1.968996, 3.295106, 1, 1, 1, 1, 1,
0.8003446, -0.4812231, 1.499928, 1, 1, 1, 1, 1,
0.8040912, 2.192612, 0.9198789, 1, 1, 1, 1, 1,
0.8053576, -1.175799, 2.244666, 1, 1, 1, 1, 1,
0.8071535, 0.4384624, 2.582717, 1, 1, 1, 1, 1,
0.8109689, -0.4356446, 2.342316, 1, 1, 1, 1, 1,
0.8125291, 0.1641454, 1.980967, 1, 1, 1, 1, 1,
0.8151318, 0.3534319, 1.093177, 1, 1, 1, 1, 1,
0.8153336, 0.01688658, 1.49009, 1, 1, 1, 1, 1,
0.818421, 0.2753038, -0.1508026, 1, 1, 1, 1, 1,
0.8190397, 0.1681298, 0.5532064, 1, 1, 1, 1, 1,
0.8240249, 1.221946, -0.3384002, 1, 1, 1, 1, 1,
0.8277368, 2.093082, -1.120226, 1, 1, 1, 1, 1,
0.8372307, 0.3665893, 1.577797, 1, 1, 1, 1, 1,
0.8389125, -0.3888163, 0.5280778, 1, 1, 1, 1, 1,
0.8412173, -0.4580685, 3.665396, 0, 0, 1, 1, 1,
0.8435155, -0.713587, 2.35045, 1, 0, 0, 1, 1,
0.8446414, -0.08636521, 3.635716, 1, 0, 0, 1, 1,
0.8475833, -1.042938, 1.895827, 1, 0, 0, 1, 1,
0.8489663, 1.213721, 1.716624, 1, 0, 0, 1, 1,
0.8576444, 0.2626172, 2.566086, 1, 0, 0, 1, 1,
0.8638905, 0.735145, 1.111524, 0, 0, 0, 1, 1,
0.8687569, -0.6833909, 1.820352, 0, 0, 0, 1, 1,
0.8712379, -0.4571118, 2.509315, 0, 0, 0, 1, 1,
0.8719602, -0.6214836, 0.6314176, 0, 0, 0, 1, 1,
0.883704, 0.9824454, 0.9495891, 0, 0, 0, 1, 1,
0.8863243, -0.5198826, 0.9789894, 0, 0, 0, 1, 1,
0.8911237, 1.156785, 0.2854846, 0, 0, 0, 1, 1,
0.8934252, -1.075441, 1.932632, 1, 1, 1, 1, 1,
0.8959989, 1.966021, 0.7789769, 1, 1, 1, 1, 1,
0.8975148, 0.4007438, 1.689609, 1, 1, 1, 1, 1,
0.9033629, -0.6695031, 2.871065, 1, 1, 1, 1, 1,
0.9041645, -0.5596962, 2.723253, 1, 1, 1, 1, 1,
0.904893, -1.101931, 2.131411, 1, 1, 1, 1, 1,
0.905463, 2.044163, 1.383168, 1, 1, 1, 1, 1,
0.9163299, -0.03355893, 2.013977, 1, 1, 1, 1, 1,
0.9163763, -0.9467978, 0.8466695, 1, 1, 1, 1, 1,
0.9196143, 0.3772385, 3.363146, 1, 1, 1, 1, 1,
0.9274859, 0.3940323, 2.040022, 1, 1, 1, 1, 1,
0.9339495, 1.560207, 0.7084169, 1, 1, 1, 1, 1,
0.9365754, -0.3213917, 1.982215, 1, 1, 1, 1, 1,
0.9368236, -0.2233715, 0.46383, 1, 1, 1, 1, 1,
0.9437094, 0.7563486, 0.6866822, 1, 1, 1, 1, 1,
0.9510407, 0.515672, 1.064311, 0, 0, 1, 1, 1,
0.9513234, -1.392546, 2.568473, 1, 0, 0, 1, 1,
0.9513739, -0.9181603, 3.040129, 1, 0, 0, 1, 1,
0.9602884, 1.364074, -1.500079, 1, 0, 0, 1, 1,
0.9605188, -0.7748822, 2.155256, 1, 0, 0, 1, 1,
0.9625998, -0.7760653, 3.17234, 1, 0, 0, 1, 1,
0.9647974, -0.07720387, 1.117088, 0, 0, 0, 1, 1,
0.9729632, -0.02347377, 0.1571512, 0, 0, 0, 1, 1,
0.9855301, 1.566839, 0.4792505, 0, 0, 0, 1, 1,
0.9942868, -0.6287325, 2.655574, 0, 0, 0, 1, 1,
1.001391, 0.760406, -1.517764, 0, 0, 0, 1, 1,
1.004046, -0.30537, 2.785572, 0, 0, 0, 1, 1,
1.006158, 0.03925479, 1.235264, 0, 0, 0, 1, 1,
1.013867, -2.213356, 4.027572, 1, 1, 1, 1, 1,
1.024654, -0.1297233, 0.5479216, 1, 1, 1, 1, 1,
1.026182, -0.4195606, 2.187157, 1, 1, 1, 1, 1,
1.029878, 0.5967424, 1.810464, 1, 1, 1, 1, 1,
1.036202, -1.316151, 1.493967, 1, 1, 1, 1, 1,
1.036293, -1.984709, 2.231386, 1, 1, 1, 1, 1,
1.03797, 0.09210651, 2.002744, 1, 1, 1, 1, 1,
1.038355, -1.1521, 1.964198, 1, 1, 1, 1, 1,
1.040653, 0.8177144, -0.1972328, 1, 1, 1, 1, 1,
1.041827, 1.201396, -0.1007488, 1, 1, 1, 1, 1,
1.042846, -1.542653, 2.889031, 1, 1, 1, 1, 1,
1.049161, -0.3116685, 1.677388, 1, 1, 1, 1, 1,
1.049885, -0.8542758, 1.365827, 1, 1, 1, 1, 1,
1.062563, 0.6649312, 0.8391288, 1, 1, 1, 1, 1,
1.06393, 0.5612558, 2.008874, 1, 1, 1, 1, 1,
1.068444, -1.67101, 1.281802, 0, 0, 1, 1, 1,
1.069559, -0.3785969, 1.605695, 1, 0, 0, 1, 1,
1.06965, -0.4198613, -0.007817481, 1, 0, 0, 1, 1,
1.077877, -1.026956, 1.563607, 1, 0, 0, 1, 1,
1.080833, -1.13997, 2.24806, 1, 0, 0, 1, 1,
1.082728, -0.0519383, 1.15857, 1, 0, 0, 1, 1,
1.087836, -0.5844342, 0.7922024, 0, 0, 0, 1, 1,
1.102397, -0.8904725, 0.8800288, 0, 0, 0, 1, 1,
1.102817, 0.5104532, -1.278048, 0, 0, 0, 1, 1,
1.102962, 0.03169802, 1.52886, 0, 0, 0, 1, 1,
1.103153, 1.35953, -0.5250793, 0, 0, 0, 1, 1,
1.112012, 1.393526, -1.673717, 0, 0, 0, 1, 1,
1.117858, -0.8166099, 3.296482, 0, 0, 0, 1, 1,
1.121468, 1.363748, 1.417022, 1, 1, 1, 1, 1,
1.121498, 0.2856317, 2.756275, 1, 1, 1, 1, 1,
1.123411, -0.1297779, 2.764757, 1, 1, 1, 1, 1,
1.130316, -0.9497818, 2.089018, 1, 1, 1, 1, 1,
1.136467, 0.2901945, 1.563954, 1, 1, 1, 1, 1,
1.136473, 2.760768, 2.224389, 1, 1, 1, 1, 1,
1.142766, 0.01106476, -0.2747088, 1, 1, 1, 1, 1,
1.144109, -0.8374252, 2.545556, 1, 1, 1, 1, 1,
1.181416, -0.3583684, 0.5202255, 1, 1, 1, 1, 1,
1.181645, -1.685681, 1.749626, 1, 1, 1, 1, 1,
1.182088, -3.1486, 3.335337, 1, 1, 1, 1, 1,
1.186379, -1.784723, 2.087522, 1, 1, 1, 1, 1,
1.190971, 0.04158329, 1.854442, 1, 1, 1, 1, 1,
1.195668, -0.6846973, 1.55303, 1, 1, 1, 1, 1,
1.198638, -1.060327, 4.631645, 1, 1, 1, 1, 1,
1.209693, -0.005021422, 1.516021, 0, 0, 1, 1, 1,
1.213332, -0.04216988, 2.266659, 1, 0, 0, 1, 1,
1.224184, -1.892818, 0.7766427, 1, 0, 0, 1, 1,
1.231739, -0.7914997, 1.663296, 1, 0, 0, 1, 1,
1.234247, -0.5041362, 0.6196121, 1, 0, 0, 1, 1,
1.240984, 1.204733, -0.2075882, 1, 0, 0, 1, 1,
1.243672, 0.3754734, 1.209219, 0, 0, 0, 1, 1,
1.244081, -0.8533287, 3.577949, 0, 0, 0, 1, 1,
1.247843, -0.4464776, 1.477329, 0, 0, 0, 1, 1,
1.266217, 1.690073, -0.4110302, 0, 0, 0, 1, 1,
1.270464, 0.3961976, 2.403778, 0, 0, 0, 1, 1,
1.283789, 0.6696984, 1.475234, 0, 0, 0, 1, 1,
1.286609, -0.406058, -0.4779484, 0, 0, 0, 1, 1,
1.287241, -1.273242, 3.649758, 1, 1, 1, 1, 1,
1.290002, -0.4169919, 2.132215, 1, 1, 1, 1, 1,
1.29564, 0.3743872, 1.579591, 1, 1, 1, 1, 1,
1.297122, -0.5187271, 2.975133, 1, 1, 1, 1, 1,
1.298488, 0.1488009, 1.123187, 1, 1, 1, 1, 1,
1.30636, 0.08120922, 2.760004, 1, 1, 1, 1, 1,
1.309842, -1.11499, 2.227334, 1, 1, 1, 1, 1,
1.316885, 0.7625044, -0.3946227, 1, 1, 1, 1, 1,
1.318824, -0.5528519, 1.916458, 1, 1, 1, 1, 1,
1.319707, 0.2703623, 1.034883, 1, 1, 1, 1, 1,
1.32059, -0.3715711, -0.1187308, 1, 1, 1, 1, 1,
1.321476, 0.3144422, 0.7073855, 1, 1, 1, 1, 1,
1.33523, -0.2317329, 2.444788, 1, 1, 1, 1, 1,
1.339983, 0.4761233, 1.766617, 1, 1, 1, 1, 1,
1.341744, -0.1028456, 1.819088, 1, 1, 1, 1, 1,
1.361396, -1.378661, 2.94925, 0, 0, 1, 1, 1,
1.36381, 0.1223146, 1.603534, 1, 0, 0, 1, 1,
1.370358, 0.4071409, 1.307365, 1, 0, 0, 1, 1,
1.384726, -0.6953079, 2.488998, 1, 0, 0, 1, 1,
1.387906, -0.3455579, 1.93355, 1, 0, 0, 1, 1,
1.389527, 1.633867, 0.06489291, 1, 0, 0, 1, 1,
1.395112, -0.1818075, 1.293343, 0, 0, 0, 1, 1,
1.399595, 0.8437664, 0.5401368, 0, 0, 0, 1, 1,
1.40325, -0.7710534, 3.161302, 0, 0, 0, 1, 1,
1.426818, 0.3882436, 1.977701, 0, 0, 0, 1, 1,
1.431535, -0.08200427, 2.017799, 0, 0, 0, 1, 1,
1.455567, 0.5025484, 2.702728, 0, 0, 0, 1, 1,
1.45645, -1.05771, 1.537592, 0, 0, 0, 1, 1,
1.456784, 1.651993, -0.03490959, 1, 1, 1, 1, 1,
1.481828, 0.4484056, 2.079259, 1, 1, 1, 1, 1,
1.507515, -0.8517813, 3.933064, 1, 1, 1, 1, 1,
1.526994, 0.4148391, 0.8082352, 1, 1, 1, 1, 1,
1.538704, -1.347111, 1.326271, 1, 1, 1, 1, 1,
1.539941, 0.1060019, 0.9587497, 1, 1, 1, 1, 1,
1.548914, -0.487149, 1.295471, 1, 1, 1, 1, 1,
1.557447, 1.426727, 0.5442445, 1, 1, 1, 1, 1,
1.558015, 0.5100439, 2.188993, 1, 1, 1, 1, 1,
1.564829, 1.398479, -0.04682388, 1, 1, 1, 1, 1,
1.565017, 1.425162, 0.2849298, 1, 1, 1, 1, 1,
1.567457, -1.433772, 2.554831, 1, 1, 1, 1, 1,
1.56811, 0.4132084, -0.1718426, 1, 1, 1, 1, 1,
1.576196, -1.304146, 1.685986, 1, 1, 1, 1, 1,
1.596317, -0.8340012, 4.478361, 1, 1, 1, 1, 1,
1.607839, -1.077587, 3.849828, 0, 0, 1, 1, 1,
1.628434, -0.7648609, 1.801313, 1, 0, 0, 1, 1,
1.642961, -1.782511, 0.6727353, 1, 0, 0, 1, 1,
1.655698, -1.379513, 1.0803, 1, 0, 0, 1, 1,
1.65768, -1.523211, 1.665736, 1, 0, 0, 1, 1,
1.663552, 1.595318, 0.5625556, 1, 0, 0, 1, 1,
1.665323, -0.8847832, 3.356549, 0, 0, 0, 1, 1,
1.690354, -1.006495, 1.238337, 0, 0, 0, 1, 1,
1.693307, -0.8247792, 2.228709, 0, 0, 0, 1, 1,
1.705708, 1.817759, 0.9460399, 0, 0, 0, 1, 1,
1.71101, 1.271773, -0.9763358, 0, 0, 0, 1, 1,
1.761191, 0.3767908, 1.892548, 0, 0, 0, 1, 1,
1.777229, -1.629014, 2.830458, 0, 0, 0, 1, 1,
1.780686, 1.366017, -0.05680235, 1, 1, 1, 1, 1,
1.809373, 0.4515, 1.241703, 1, 1, 1, 1, 1,
1.811505, 0.9188409, 1.342668, 1, 1, 1, 1, 1,
1.823898, 0.7870098, 1.499612, 1, 1, 1, 1, 1,
1.854937, 0.7522756, 0.4113469, 1, 1, 1, 1, 1,
1.855014, 0.3140668, 1.03868, 1, 1, 1, 1, 1,
1.874157, -3.256107, 0.5818185, 1, 1, 1, 1, 1,
1.877886, -1.860901, 2.524166, 1, 1, 1, 1, 1,
1.891471, 1.572933, 1.170658, 1, 1, 1, 1, 1,
1.908909, -1.40373, 1.727704, 1, 1, 1, 1, 1,
1.926339, -0.8038589, 1.38125, 1, 1, 1, 1, 1,
1.951952, -1.924738, 1.322559, 1, 1, 1, 1, 1,
1.962248, 0.3326052, 1.610349, 1, 1, 1, 1, 1,
2.001597, 0.4419559, 3.096695, 1, 1, 1, 1, 1,
2.009105, -0.980538, 2.616369, 1, 1, 1, 1, 1,
2.019856, 0.2082639, -0.09587818, 0, 0, 1, 1, 1,
2.049849, 1.200602, 0.6095996, 1, 0, 0, 1, 1,
2.055335, -0.02827325, 3.589296, 1, 0, 0, 1, 1,
2.107899, 0.989756, 1.132698, 1, 0, 0, 1, 1,
2.122598, 0.8024355, 0.9897138, 1, 0, 0, 1, 1,
2.140589, 0.01354553, -0.08387452, 1, 0, 0, 1, 1,
2.144824, 0.5913631, 0.4208319, 0, 0, 0, 1, 1,
2.157146, 0.1173915, 1.115364, 0, 0, 0, 1, 1,
2.202084, -0.05268144, 2.896448, 0, 0, 0, 1, 1,
2.208421, -1.301464, 1.609337, 0, 0, 0, 1, 1,
2.224463, -0.5016412, 3.347382, 0, 0, 0, 1, 1,
2.258199, 0.2217928, 2.883311, 0, 0, 0, 1, 1,
2.265434, 0.8996704, 3.354393, 0, 0, 0, 1, 1,
2.321815, -0.6685707, 2.857269, 1, 1, 1, 1, 1,
2.355321, -0.2945072, 0.5129606, 1, 1, 1, 1, 1,
2.472003, -1.374826, 3.1431, 1, 1, 1, 1, 1,
2.480199, -0.02867096, 1.913116, 1, 1, 1, 1, 1,
2.534407, 1.144378, 0.6601483, 1, 1, 1, 1, 1,
2.62425, -0.3965249, 1.942276, 1, 1, 1, 1, 1,
3.289594, -0.2286443, 2.778956, 1, 1, 1, 1, 1
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
var radius = 9.50691;
var distance = 33.39262;
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
mvMatrix.translate( 0.1407845, -0.110018, -0.0325985 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.39262);
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
