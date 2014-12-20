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
-3.256067, -1.890891, -4.06813, 1, 0, 0, 1,
-3.003314, -1.02895, -2.321651, 1, 0.007843138, 0, 1,
-2.751367, 0.6565957, -1.151756, 1, 0.01176471, 0, 1,
-2.706221, 0.140127, -1.381216, 1, 0.01960784, 0, 1,
-2.57742, 0.4398661, -2.04491, 1, 0.02352941, 0, 1,
-2.566926, -0.3369175, -2.301491, 1, 0.03137255, 0, 1,
-2.543846, -0.7099174, -1.262673, 1, 0.03529412, 0, 1,
-2.528443, -0.2184888, -3.225314, 1, 0.04313726, 0, 1,
-2.515186, 2.312483, -0.5274571, 1, 0.04705882, 0, 1,
-2.449249, -0.2374166, -2.307852, 1, 0.05490196, 0, 1,
-2.399508, 0.05278, -1.473059, 1, 0.05882353, 0, 1,
-2.358797, -0.6405534, -2.70232, 1, 0.06666667, 0, 1,
-2.315595, 0.8220508, -0.04997644, 1, 0.07058824, 0, 1,
-2.313196, 1.016571, -2.092258, 1, 0.07843138, 0, 1,
-2.261278, -1.012769, -1.840445, 1, 0.08235294, 0, 1,
-2.202169, 0.1212387, -1.666091, 1, 0.09019608, 0, 1,
-2.176707, 0.4663463, -1.602625, 1, 0.09411765, 0, 1,
-2.16372, 0.2486375, -0.9979596, 1, 0.1019608, 0, 1,
-2.153056, 0.5427865, -2.374804, 1, 0.1098039, 0, 1,
-2.104517, 2.169133, -2.60901, 1, 0.1137255, 0, 1,
-2.086933, -0.4533815, -1.501378, 1, 0.1215686, 0, 1,
-2.084396, -0.3206018, -1.077376, 1, 0.1254902, 0, 1,
-2.03127, -0.3649742, -2.009094, 1, 0.1333333, 0, 1,
-2.027978, -0.5967643, -0.7254405, 1, 0.1372549, 0, 1,
-2.00082, 2.584357, -0.4678719, 1, 0.145098, 0, 1,
-1.993642, -1.830579, -3.211291, 1, 0.1490196, 0, 1,
-1.989931, 2.006588, -0.09997527, 1, 0.1568628, 0, 1,
-1.985964, -1.684194, -2.778853, 1, 0.1607843, 0, 1,
-1.984124, 1.148672, -0.5897154, 1, 0.1686275, 0, 1,
-1.953957, -2.041385, -2.291155, 1, 0.172549, 0, 1,
-1.941799, -1.314543, -2.268908, 1, 0.1803922, 0, 1,
-1.924806, 0.3805252, -2.82008, 1, 0.1843137, 0, 1,
-1.914061, -0.4448715, -2.003312, 1, 0.1921569, 0, 1,
-1.906611, -0.4700849, -2.320998, 1, 0.1960784, 0, 1,
-1.897333, 0.04126743, -1.30933, 1, 0.2039216, 0, 1,
-1.892622, 0.4709686, -2.335736, 1, 0.2117647, 0, 1,
-1.885826, -0.90901, -1.446964, 1, 0.2156863, 0, 1,
-1.854965, -0.4095282, -1.910689, 1, 0.2235294, 0, 1,
-1.85483, 0.2692675, -2.131111, 1, 0.227451, 0, 1,
-1.847654, -1.599641, -2.374239, 1, 0.2352941, 0, 1,
-1.840577, 0.2677121, -0.722637, 1, 0.2392157, 0, 1,
-1.824149, 0.2850262, -2.373546, 1, 0.2470588, 0, 1,
-1.816248, -0.1904739, -0.2647819, 1, 0.2509804, 0, 1,
-1.808511, -0.1977234, -0.3362718, 1, 0.2588235, 0, 1,
-1.766971, -0.3272413, -2.293518, 1, 0.2627451, 0, 1,
-1.754858, 0.8467335, -0.9826467, 1, 0.2705882, 0, 1,
-1.747868, 0.5405111, -1.432279, 1, 0.2745098, 0, 1,
-1.721046, 0.5559492, -1.983403, 1, 0.282353, 0, 1,
-1.715885, -0.4639185, -2.229731, 1, 0.2862745, 0, 1,
-1.712583, -1.363381, -1.59674, 1, 0.2941177, 0, 1,
-1.648124, -1.570375, -1.905263, 1, 0.3019608, 0, 1,
-1.638664, 1.058114, -1.686136, 1, 0.3058824, 0, 1,
-1.615798, 0.1374276, -1.099277, 1, 0.3137255, 0, 1,
-1.599622, 0.3679153, -0.508544, 1, 0.3176471, 0, 1,
-1.580485, -0.01689725, -2.480627, 1, 0.3254902, 0, 1,
-1.577085, 0.3678512, -2.824958, 1, 0.3294118, 0, 1,
-1.576003, 0.1562021, -1.537525, 1, 0.3372549, 0, 1,
-1.557034, -0.1254421, -0.810991, 1, 0.3411765, 0, 1,
-1.551935, 1.141788, -1.608778, 1, 0.3490196, 0, 1,
-1.549961, 1.182529, -2.055576, 1, 0.3529412, 0, 1,
-1.542642, -1.143023, -2.395921, 1, 0.3607843, 0, 1,
-1.54001, 0.371547, -1.844161, 1, 0.3647059, 0, 1,
-1.538188, -0.1194154, 0.05125824, 1, 0.372549, 0, 1,
-1.521199, -0.1329204, -1.020976, 1, 0.3764706, 0, 1,
-1.510477, 2.044614, -1.088878, 1, 0.3843137, 0, 1,
-1.478414, -1.267886, -2.962737, 1, 0.3882353, 0, 1,
-1.445426, -0.5364281, -1.537357, 1, 0.3960784, 0, 1,
-1.443147, 0.4144089, -0.2522732, 1, 0.4039216, 0, 1,
-1.434753, -0.5272867, -3.335497, 1, 0.4078431, 0, 1,
-1.429704, 0.03197622, -2.731909, 1, 0.4156863, 0, 1,
-1.426666, -1.808686, -0.2468255, 1, 0.4196078, 0, 1,
-1.408561, -1.127721, -1.247293, 1, 0.427451, 0, 1,
-1.405264, 0.1516874, -1.893512, 1, 0.4313726, 0, 1,
-1.404113, -0.6231627, -1.442783, 1, 0.4392157, 0, 1,
-1.402496, -1.036872, -3.683419, 1, 0.4431373, 0, 1,
-1.395659, -0.8903559, -1.740657, 1, 0.4509804, 0, 1,
-1.395462, -0.2763025, -2.657593, 1, 0.454902, 0, 1,
-1.386762, 0.8707631, -2.67297, 1, 0.4627451, 0, 1,
-1.382424, -0.5737835, -1.456059, 1, 0.4666667, 0, 1,
-1.374279, -0.3383217, -2.519102, 1, 0.4745098, 0, 1,
-1.373566, 1.00612, -0.7874282, 1, 0.4784314, 0, 1,
-1.366805, 1.087649, -0.5154679, 1, 0.4862745, 0, 1,
-1.364511, -1.761787, -2.860622, 1, 0.4901961, 0, 1,
-1.354259, -1.459667, -1.656641, 1, 0.4980392, 0, 1,
-1.351363, 2.513078, 0.5991057, 1, 0.5058824, 0, 1,
-1.350498, 1.617042, -1.265839, 1, 0.509804, 0, 1,
-1.340274, -0.1151868, -2.896568, 1, 0.5176471, 0, 1,
-1.314964, 0.01450111, -1.858001, 1, 0.5215687, 0, 1,
-1.305194, -0.258035, -2.055994, 1, 0.5294118, 0, 1,
-1.297435, 0.6451876, 0.5389189, 1, 0.5333334, 0, 1,
-1.289347, -1.194355, -0.208624, 1, 0.5411765, 0, 1,
-1.281656, 1.526686, 0.3831038, 1, 0.5450981, 0, 1,
-1.280449, -0.03272809, -0.4172707, 1, 0.5529412, 0, 1,
-1.276409, -0.9675571, -3.789388, 1, 0.5568628, 0, 1,
-1.275232, 0.01641303, -2.486464, 1, 0.5647059, 0, 1,
-1.269954, -0.2010206, -3.104376, 1, 0.5686275, 0, 1,
-1.266668, 0.1721367, 0.5276402, 1, 0.5764706, 0, 1,
-1.260175, -0.3544658, -1.637867, 1, 0.5803922, 0, 1,
-1.258802, -0.4299746, -1.786193, 1, 0.5882353, 0, 1,
-1.256172, -0.3642254, -2.736352, 1, 0.5921569, 0, 1,
-1.25568, 1.404804, -2.483686, 1, 0.6, 0, 1,
-1.248131, -1.219419, -3.636562, 1, 0.6078432, 0, 1,
-1.247423, 0.5352206, 0.9709368, 1, 0.6117647, 0, 1,
-1.240291, -1.312161, -3.006503, 1, 0.6196079, 0, 1,
-1.23532, -0.4457083, -2.350427, 1, 0.6235294, 0, 1,
-1.225409, 0.5355058, -0.539587, 1, 0.6313726, 0, 1,
-1.207925, -0.4787443, -1.678306, 1, 0.6352941, 0, 1,
-1.206284, -0.6773682, -1.427795, 1, 0.6431373, 0, 1,
-1.204697, 0.2504898, 0.3502988, 1, 0.6470588, 0, 1,
-1.195126, -2.082703, -2.542096, 1, 0.654902, 0, 1,
-1.190833, -0.1103784, 0.3489256, 1, 0.6588235, 0, 1,
-1.186602, 0.9139598, 2.449424, 1, 0.6666667, 0, 1,
-1.186019, -0.8729824, -3.028905, 1, 0.6705883, 0, 1,
-1.184908, 0.1225833, -2.256954, 1, 0.6784314, 0, 1,
-1.182161, 0.617195, -0.08294847, 1, 0.682353, 0, 1,
-1.18166, -0.3584847, -1.400813, 1, 0.6901961, 0, 1,
-1.175367, 0.02963175, -2.328438, 1, 0.6941177, 0, 1,
-1.169978, -2.476277, -1.780957, 1, 0.7019608, 0, 1,
-1.168551, 0.8017014, -1.697373, 1, 0.7098039, 0, 1,
-1.167792, 0.4174322, -0.06304819, 1, 0.7137255, 0, 1,
-1.167583, 0.1983604, -1.934699, 1, 0.7215686, 0, 1,
-1.165415, -0.6814327, -2.707803, 1, 0.7254902, 0, 1,
-1.162476, 0.04604099, -1.153963, 1, 0.7333333, 0, 1,
-1.154395, 1.706366, -0.9202157, 1, 0.7372549, 0, 1,
-1.132827, 0.3930439, -2.08233, 1, 0.7450981, 0, 1,
-1.131624, -1.221491, -3.195387, 1, 0.7490196, 0, 1,
-1.115784, -0.06014114, -2.229375, 1, 0.7568628, 0, 1,
-1.114184, -0.7915196, -1.667516, 1, 0.7607843, 0, 1,
-1.110806, -0.2682318, -1.93083, 1, 0.7686275, 0, 1,
-1.105028, 0.08646017, 0.06496359, 1, 0.772549, 0, 1,
-1.101063, 0.03153001, -0.3138707, 1, 0.7803922, 0, 1,
-1.084329, -0.4254113, -2.147421, 1, 0.7843137, 0, 1,
-1.08362, -0.8349662, -2.238986, 1, 0.7921569, 0, 1,
-1.083598, -1.375277, -1.622446, 1, 0.7960784, 0, 1,
-1.079658, -0.2995775, -2.077113, 1, 0.8039216, 0, 1,
-1.077806, 0.2746304, -2.484715, 1, 0.8117647, 0, 1,
-1.07708, 0.7352078, -1.914274, 1, 0.8156863, 0, 1,
-1.073591, -0.05561596, 0.2721155, 1, 0.8235294, 0, 1,
-1.06516, 0.5880261, -2.848675, 1, 0.827451, 0, 1,
-1.061835, -0.6215669, -2.032907, 1, 0.8352941, 0, 1,
-1.061227, -0.2674071, -1.895561, 1, 0.8392157, 0, 1,
-1.050652, -0.375313, -2.825762, 1, 0.8470588, 0, 1,
-1.050505, -0.9489939, -1.874529, 1, 0.8509804, 0, 1,
-1.0498, -1.192691, -2.434062, 1, 0.8588235, 0, 1,
-1.032724, -1.243161, -4.779636, 1, 0.8627451, 0, 1,
-1.030171, -1.390936, -3.106308, 1, 0.8705882, 0, 1,
-1.030098, -0.3938206, -2.071772, 1, 0.8745098, 0, 1,
-1.029701, 0.4645779, -1.467987, 1, 0.8823529, 0, 1,
-1.020741, -0.6853005, -1.594406, 1, 0.8862745, 0, 1,
-1.01568, -0.6242998, -2.852944, 1, 0.8941177, 0, 1,
-1.006811, -2.890805, -2.556432, 1, 0.8980392, 0, 1,
-1.002487, 0.999532, -1.432309, 1, 0.9058824, 0, 1,
-1.001997, -1.419989, -1.962741, 1, 0.9137255, 0, 1,
-1.000429, 2.027112, 0.105191, 1, 0.9176471, 0, 1,
-0.9967216, 1.177028, -1.652531, 1, 0.9254902, 0, 1,
-0.9910192, -0.9811298, -1.993439, 1, 0.9294118, 0, 1,
-0.9887241, 0.01324309, -2.967021, 1, 0.9372549, 0, 1,
-0.9837292, -0.2131881, -0.8269945, 1, 0.9411765, 0, 1,
-0.9706149, 2.212886, -1.123196, 1, 0.9490196, 0, 1,
-0.9671806, 0.07247818, -1.538735, 1, 0.9529412, 0, 1,
-0.963515, -0.5230629, -2.259401, 1, 0.9607843, 0, 1,
-0.9539753, 0.854668, -2.107649, 1, 0.9647059, 0, 1,
-0.9539403, 1.881896, 0.05491494, 1, 0.972549, 0, 1,
-0.9488406, -0.8695074, -2.710664, 1, 0.9764706, 0, 1,
-0.947175, -0.7926771, -2.917367, 1, 0.9843137, 0, 1,
-0.9450473, 0.1139862, -1.759948, 1, 0.9882353, 0, 1,
-0.9356757, -0.3557656, -2.005533, 1, 0.9960784, 0, 1,
-0.9337789, -0.1322178, -2.820738, 0.9960784, 1, 0, 1,
-0.9331915, 0.05343089, -0.8710493, 0.9921569, 1, 0, 1,
-0.9293293, 1.279211, -0.5886311, 0.9843137, 1, 0, 1,
-0.9111564, 0.1162504, -1.222136, 0.9803922, 1, 0, 1,
-0.9042877, 1.176931, -2.356209, 0.972549, 1, 0, 1,
-0.900944, 0.1888005, -1.822958, 0.9686275, 1, 0, 1,
-0.8987762, -0.4812775, -1.833459, 0.9607843, 1, 0, 1,
-0.8951067, -0.6341301, -2.285295, 0.9568627, 1, 0, 1,
-0.8947391, -0.3559442, -3.586846, 0.9490196, 1, 0, 1,
-0.8914236, 1.243715, -1.179877, 0.945098, 1, 0, 1,
-0.8888944, -1.822034, -1.73343, 0.9372549, 1, 0, 1,
-0.8867744, -0.03655866, -2.459241, 0.9333333, 1, 0, 1,
-0.8796161, 0.247811, -0.6662637, 0.9254902, 1, 0, 1,
-0.8769554, -1.535595, -1.927717, 0.9215686, 1, 0, 1,
-0.8757831, 2.326494, -0.6724336, 0.9137255, 1, 0, 1,
-0.8741373, 0.5412809, -0.2547451, 0.9098039, 1, 0, 1,
-0.8598959, 0.7542015, -1.490379, 0.9019608, 1, 0, 1,
-0.8590695, 0.6536692, -1.278674, 0.8941177, 1, 0, 1,
-0.8580006, 0.9678602, -0.008493897, 0.8901961, 1, 0, 1,
-0.8560014, -0.2920848, -2.116321, 0.8823529, 1, 0, 1,
-0.8508455, 2.51989, -1.392069, 0.8784314, 1, 0, 1,
-0.8499213, 1.724831, 0.2027795, 0.8705882, 1, 0, 1,
-0.8475156, 0.03337756, -2.274112, 0.8666667, 1, 0, 1,
-0.8460998, 0.04366066, -1.415926, 0.8588235, 1, 0, 1,
-0.8284311, -0.04108254, -1.282006, 0.854902, 1, 0, 1,
-0.8269772, -1.188975, -0.5354393, 0.8470588, 1, 0, 1,
-0.8268419, 0.4318206, -0.06992389, 0.8431373, 1, 0, 1,
-0.8257012, -0.9153849, -0.693829, 0.8352941, 1, 0, 1,
-0.8236071, -0.4873067, -2.003733, 0.8313726, 1, 0, 1,
-0.8162227, -0.610931, -2.502038, 0.8235294, 1, 0, 1,
-0.8141673, 1.5113, -0.04551164, 0.8196079, 1, 0, 1,
-0.8123938, 0.959096, -1.094165, 0.8117647, 1, 0, 1,
-0.8115359, 1.236962, -0.9641582, 0.8078431, 1, 0, 1,
-0.8085892, -1.531681, -2.396887, 0.8, 1, 0, 1,
-0.8082561, -1.053571, -2.146714, 0.7921569, 1, 0, 1,
-0.8071858, -2.150601, -2.269038, 0.7882353, 1, 0, 1,
-0.806879, -0.6942516, -2.938603, 0.7803922, 1, 0, 1,
-0.804193, -0.3551783, -1.363852, 0.7764706, 1, 0, 1,
-0.8000074, -0.9865328, -2.080176, 0.7686275, 1, 0, 1,
-0.7977139, 0.9914804, 0.3627788, 0.7647059, 1, 0, 1,
-0.792741, 0.3099209, -1.361466, 0.7568628, 1, 0, 1,
-0.7847351, -0.7700079, -0.9959995, 0.7529412, 1, 0, 1,
-0.7824975, -0.7162717, -3.762619, 0.7450981, 1, 0, 1,
-0.7813064, 1.291078, 0.6678389, 0.7411765, 1, 0, 1,
-0.7776108, 0.3499467, -1.048178, 0.7333333, 1, 0, 1,
-0.7772003, 0.6035836, -0.9395241, 0.7294118, 1, 0, 1,
-0.7681632, -0.3464126, -3.609853, 0.7215686, 1, 0, 1,
-0.7659196, -0.7033315, -2.522965, 0.7176471, 1, 0, 1,
-0.761517, -0.1813609, -2.153829, 0.7098039, 1, 0, 1,
-0.7614712, -1.657967, -2.225326, 0.7058824, 1, 0, 1,
-0.7577065, 1.796951, 1.105961, 0.6980392, 1, 0, 1,
-0.756775, 0.1375011, -1.441836, 0.6901961, 1, 0, 1,
-0.7543138, -0.1358563, -1.227878, 0.6862745, 1, 0, 1,
-0.7521375, 1.383393, 0.08780103, 0.6784314, 1, 0, 1,
-0.7487676, 0.1796092, -2.185609, 0.6745098, 1, 0, 1,
-0.7487515, -0.6299514, -3.579251, 0.6666667, 1, 0, 1,
-0.7478082, -1.095578, -1.928705, 0.6627451, 1, 0, 1,
-0.7476105, -0.1591589, -0.7387332, 0.654902, 1, 0, 1,
-0.7452392, -0.2171159, -1.355564, 0.6509804, 1, 0, 1,
-0.7438122, -0.1685427, -1.786596, 0.6431373, 1, 0, 1,
-0.743003, -0.5883051, -2.040832, 0.6392157, 1, 0, 1,
-0.7403914, 0.2750803, -0.06063023, 0.6313726, 1, 0, 1,
-0.7367146, -0.171622, -3.045501, 0.627451, 1, 0, 1,
-0.7359141, 0.2522419, -2.189147, 0.6196079, 1, 0, 1,
-0.7304437, 0.6219453, -1.681111, 0.6156863, 1, 0, 1,
-0.730293, -2.015433, -4.737572, 0.6078432, 1, 0, 1,
-0.7268084, -0.1514125, -1.488093, 0.6039216, 1, 0, 1,
-0.7217321, 0.9454467, -0.8416625, 0.5960785, 1, 0, 1,
-0.7212692, 0.6723541, -2.716953, 0.5882353, 1, 0, 1,
-0.7197807, -1.305357, -3.750867, 0.5843138, 1, 0, 1,
-0.7155007, 0.2831666, -1.117376, 0.5764706, 1, 0, 1,
-0.713632, -1.244444, -2.730331, 0.572549, 1, 0, 1,
-0.7134002, 0.4075048, -1.076389, 0.5647059, 1, 0, 1,
-0.7062874, 1.742269, -0.2954642, 0.5607843, 1, 0, 1,
-0.7028735, 0.764949, -0.7040234, 0.5529412, 1, 0, 1,
-0.6990986, -0.9000474, -2.134868, 0.5490196, 1, 0, 1,
-0.6984209, 0.06619749, -1.662172, 0.5411765, 1, 0, 1,
-0.6960865, 1.752709, 0.8542244, 0.5372549, 1, 0, 1,
-0.6896899, -0.2320089, -1.320446, 0.5294118, 1, 0, 1,
-0.6836691, -1.877636, -2.303904, 0.5254902, 1, 0, 1,
-0.6739519, -0.7236021, -3.224051, 0.5176471, 1, 0, 1,
-0.6681707, -1.675148, -3.304543, 0.5137255, 1, 0, 1,
-0.6674072, 1.136992, -2.12463, 0.5058824, 1, 0, 1,
-0.666424, 0.6035261, -2.305129, 0.5019608, 1, 0, 1,
-0.65751, 0.3015241, -0.8011215, 0.4941176, 1, 0, 1,
-0.6529896, 0.4748325, -1.37484, 0.4862745, 1, 0, 1,
-0.6504942, -1.185538, -3.133536, 0.4823529, 1, 0, 1,
-0.6488013, 1.627098, -1.780141, 0.4745098, 1, 0, 1,
-0.635344, 0.01227245, -1.925184, 0.4705882, 1, 0, 1,
-0.6299363, -1.035275, -2.907191, 0.4627451, 1, 0, 1,
-0.6271418, -0.4077283, -3.398233, 0.4588235, 1, 0, 1,
-0.6257598, -1.695741, -2.875068, 0.4509804, 1, 0, 1,
-0.6211715, -0.5095921, -1.169768, 0.4470588, 1, 0, 1,
-0.6148089, 1.343317, -1.340147, 0.4392157, 1, 0, 1,
-0.6144167, -0.1436332, -1.596666, 0.4352941, 1, 0, 1,
-0.613431, -0.282757, -3.003393, 0.427451, 1, 0, 1,
-0.6107486, -1.40777, -1.811245, 0.4235294, 1, 0, 1,
-0.6106504, -0.2769931, -2.681399, 0.4156863, 1, 0, 1,
-0.6087891, 1.435446, -0.03328005, 0.4117647, 1, 0, 1,
-0.6077014, -0.2618056, -2.054971, 0.4039216, 1, 0, 1,
-0.606877, 0.6074257, -0.966062, 0.3960784, 1, 0, 1,
-0.6038197, -0.2153109, -1.388314, 0.3921569, 1, 0, 1,
-0.6031471, -0.3767923, -3.595928, 0.3843137, 1, 0, 1,
-0.5981542, 0.1075166, -1.3573, 0.3803922, 1, 0, 1,
-0.5951401, -0.2012141, -1.160398, 0.372549, 1, 0, 1,
-0.5897673, 0.9959416, -0.04518221, 0.3686275, 1, 0, 1,
-0.5894617, 0.3511097, -2.889051, 0.3607843, 1, 0, 1,
-0.5879632, 1.947478, 0.33577, 0.3568628, 1, 0, 1,
-0.5869472, 0.1168176, -2.206412, 0.3490196, 1, 0, 1,
-0.5849714, -0.7658517, -3.340458, 0.345098, 1, 0, 1,
-0.5782852, -0.3762204, -1.816484, 0.3372549, 1, 0, 1,
-0.5780673, -0.8683763, -3.836322, 0.3333333, 1, 0, 1,
-0.5768932, 0.4940363, 0.2899597, 0.3254902, 1, 0, 1,
-0.5749857, 0.07853985, -2.044591, 0.3215686, 1, 0, 1,
-0.5721111, 0.5282819, -0.6708526, 0.3137255, 1, 0, 1,
-0.5713162, -0.9106302, -3.748038, 0.3098039, 1, 0, 1,
-0.5668398, -0.1988204, -0.5697531, 0.3019608, 1, 0, 1,
-0.5639452, 0.173864, 0.08350555, 0.2941177, 1, 0, 1,
-0.5617288, 0.6716968, -1.911468, 0.2901961, 1, 0, 1,
-0.558286, -0.3210741, -1.05347, 0.282353, 1, 0, 1,
-0.5568392, 0.8518478, -2.525438, 0.2784314, 1, 0, 1,
-0.5472485, 1.157157, 0.05297395, 0.2705882, 1, 0, 1,
-0.5468981, 0.6257407, -1.662693, 0.2666667, 1, 0, 1,
-0.5401718, -0.3536512, -2.814297, 0.2588235, 1, 0, 1,
-0.5385619, 1.019564, -0.9774603, 0.254902, 1, 0, 1,
-0.5363114, 1.133116, 0.972258, 0.2470588, 1, 0, 1,
-0.5257043, 2.038921, 1.0004, 0.2431373, 1, 0, 1,
-0.5225013, 0.087341, -1.346002, 0.2352941, 1, 0, 1,
-0.5160518, -0.007801082, -2.332008, 0.2313726, 1, 0, 1,
-0.5155454, 0.9099773, -2.107875, 0.2235294, 1, 0, 1,
-0.5136924, -3.073427, -1.96706, 0.2196078, 1, 0, 1,
-0.5126639, -1.243133, -3.070961, 0.2117647, 1, 0, 1,
-0.5008851, -0.5527796, -1.5667, 0.2078431, 1, 0, 1,
-0.4977375, 0.6978372, -1.059282, 0.2, 1, 0, 1,
-0.4966651, -0.176263, -2.19547, 0.1921569, 1, 0, 1,
-0.4955292, 0.4263446, -0.1601028, 0.1882353, 1, 0, 1,
-0.4951121, -0.01784366, -1.996803, 0.1803922, 1, 0, 1,
-0.493792, 0.3608419, -0.756296, 0.1764706, 1, 0, 1,
-0.4932333, -0.1237911, -0.3227982, 0.1686275, 1, 0, 1,
-0.492666, 0.5664437, -0.7142601, 0.1647059, 1, 0, 1,
-0.4918213, 1.130761, -0.4252366, 0.1568628, 1, 0, 1,
-0.4890172, -0.3476595, -1.444391, 0.1529412, 1, 0, 1,
-0.4872368, -1.379826, -3.777928, 0.145098, 1, 0, 1,
-0.4832255, -0.784152, -1.469032, 0.1411765, 1, 0, 1,
-0.4820372, 1.018377, 0.2744497, 0.1333333, 1, 0, 1,
-0.4799148, -0.2881417, -4.434245, 0.1294118, 1, 0, 1,
-0.4793347, 0.5372962, 0.3214845, 0.1215686, 1, 0, 1,
-0.4763761, 0.5140714, 0.7171591, 0.1176471, 1, 0, 1,
-0.4759549, 0.8246304, -1.343117, 0.1098039, 1, 0, 1,
-0.4736695, 0.3879309, -1.121624, 0.1058824, 1, 0, 1,
-0.4733302, -1.105096, -2.422958, 0.09803922, 1, 0, 1,
-0.4678064, 0.4124439, -1.168997, 0.09019608, 1, 0, 1,
-0.4636025, -0.7132579, -2.803191, 0.08627451, 1, 0, 1,
-0.4618796, 3.146933, -1.425587, 0.07843138, 1, 0, 1,
-0.4603516, 0.4359681, -2.054734, 0.07450981, 1, 0, 1,
-0.460072, 1.500405, -0.108891, 0.06666667, 1, 0, 1,
-0.4592865, 0.2140707, -2.767049, 0.0627451, 1, 0, 1,
-0.4549852, 0.1211288, -0.8609464, 0.05490196, 1, 0, 1,
-0.4527084, -0.7748311, -2.001257, 0.05098039, 1, 0, 1,
-0.449459, -0.9878523, -1.301217, 0.04313726, 1, 0, 1,
-0.4459411, 1.713073, -1.311385, 0.03921569, 1, 0, 1,
-0.4454672, 0.5845488, 0.462419, 0.03137255, 1, 0, 1,
-0.4404187, -0.6902629, -2.798476, 0.02745098, 1, 0, 1,
-0.4375288, 0.03077053, -1.195363, 0.01960784, 1, 0, 1,
-0.4358892, 0.1267104, -0.2388479, 0.01568628, 1, 0, 1,
-0.4347225, -0.2878445, -2.030912, 0.007843138, 1, 0, 1,
-0.431249, 0.1883, -2.074048, 0.003921569, 1, 0, 1,
-0.4264677, 0.6856476, -0.06687579, 0, 1, 0.003921569, 1,
-0.4229688, 0.8760843, -0.4226733, 0, 1, 0.01176471, 1,
-0.4226839, -1.744565, -3.560984, 0, 1, 0.01568628, 1,
-0.4203438, 2.053437, 0.6084436, 0, 1, 0.02352941, 1,
-0.4102634, -0.4461483, -3.57027, 0, 1, 0.02745098, 1,
-0.4097876, 1.177056, 0.8486087, 0, 1, 0.03529412, 1,
-0.4075955, 0.4544138, -2.510432, 0, 1, 0.03921569, 1,
-0.4045706, -0.003918306, -0.6175152, 0, 1, 0.04705882, 1,
-0.4032097, -0.8679258, -3.028721, 0, 1, 0.05098039, 1,
-0.3991463, -0.264536, -2.824445, 0, 1, 0.05882353, 1,
-0.3977923, -1.401508, -2.768217, 0, 1, 0.0627451, 1,
-0.397444, 0.3861926, 0.5537243, 0, 1, 0.07058824, 1,
-0.3959234, -0.4063403, -2.631031, 0, 1, 0.07450981, 1,
-0.3947279, -0.8099582, -2.278416, 0, 1, 0.08235294, 1,
-0.3940033, 0.4135781, -0.8277303, 0, 1, 0.08627451, 1,
-0.3919828, -1.259505, -3.880569, 0, 1, 0.09411765, 1,
-0.3907149, 1.596114, -0.2269544, 0, 1, 0.1019608, 1,
-0.3854693, -0.9971122, -2.883563, 0, 1, 0.1058824, 1,
-0.3804228, 0.6052132, -0.2385995, 0, 1, 0.1137255, 1,
-0.379736, 0.8539065, -0.9793199, 0, 1, 0.1176471, 1,
-0.3792109, 0.3304684, -0.5622902, 0, 1, 0.1254902, 1,
-0.3784213, -0.2593065, -1.312497, 0, 1, 0.1294118, 1,
-0.3704446, -0.5104532, -1.714045, 0, 1, 0.1372549, 1,
-0.3691894, -1.073057, -2.599182, 0, 1, 0.1411765, 1,
-0.3658494, -1.086072, -2.362049, 0, 1, 0.1490196, 1,
-0.363897, 1.085541, 0.07777557, 0, 1, 0.1529412, 1,
-0.363249, -0.4729741, -1.311433, 0, 1, 0.1607843, 1,
-0.3627073, -0.1357333, -0.8105621, 0, 1, 0.1647059, 1,
-0.3499868, 1.569323, 0.04230293, 0, 1, 0.172549, 1,
-0.3452875, 0.8685995, -0.5855096, 0, 1, 0.1764706, 1,
-0.3441704, -0.2603693, -2.167196, 0, 1, 0.1843137, 1,
-0.340912, 0.3039912, 0.6633106, 0, 1, 0.1882353, 1,
-0.3405097, -0.5590438, -2.54195, 0, 1, 0.1960784, 1,
-0.3364428, -0.5503216, -2.597711, 0, 1, 0.2039216, 1,
-0.3337906, -1.113817, -2.301504, 0, 1, 0.2078431, 1,
-0.3302015, -0.5239999, -2.481437, 0, 1, 0.2156863, 1,
-0.3265117, -0.2773202, -0.2315917, 0, 1, 0.2196078, 1,
-0.322275, -0.5424858, -1.672473, 0, 1, 0.227451, 1,
-0.3168317, 1.106983, 0.743355, 0, 1, 0.2313726, 1,
-0.3148766, 0.6007955, 0.2872044, 0, 1, 0.2392157, 1,
-0.3143463, 1.239794, -0.6171355, 0, 1, 0.2431373, 1,
-0.3125738, 0.6805444, 0.1288452, 0, 1, 0.2509804, 1,
-0.3120079, -1.717399, -3.329787, 0, 1, 0.254902, 1,
-0.3088987, 0.2089218, -1.987663, 0, 1, 0.2627451, 1,
-0.3077822, -0.2811639, -1.461161, 0, 1, 0.2666667, 1,
-0.3068936, -1.495984, -3.780198, 0, 1, 0.2745098, 1,
-0.3051292, -0.4275394, -2.281179, 0, 1, 0.2784314, 1,
-0.3021217, 0.529965, -1.442267, 0, 1, 0.2862745, 1,
-0.2945113, -0.3123237, -3.554283, 0, 1, 0.2901961, 1,
-0.2939004, 0.07470211, -2.006821, 0, 1, 0.2980392, 1,
-0.2914159, 0.2813586, -0.4790699, 0, 1, 0.3058824, 1,
-0.2905128, -0.692689, -0.4750898, 0, 1, 0.3098039, 1,
-0.2861087, 0.9071517, 2.006934, 0, 1, 0.3176471, 1,
-0.2859836, -1.521648, -3.507093, 0, 1, 0.3215686, 1,
-0.2829813, 0.6044588, -0.2076389, 0, 1, 0.3294118, 1,
-0.28186, -0.06084134, -2.151269, 0, 1, 0.3333333, 1,
-0.2753955, 0.470294, -1.894423, 0, 1, 0.3411765, 1,
-0.2739289, -1.20877, -3.267548, 0, 1, 0.345098, 1,
-0.2603405, 0.4745928, -1.296978, 0, 1, 0.3529412, 1,
-0.2587388, -0.06462998, -2.982198, 0, 1, 0.3568628, 1,
-0.2535182, 1.697134, 0.724593, 0, 1, 0.3647059, 1,
-0.2481791, 0.1643136, -0.4476424, 0, 1, 0.3686275, 1,
-0.2466227, -0.07007708, -1.774762, 0, 1, 0.3764706, 1,
-0.2465188, -0.6683896, -3.310782, 0, 1, 0.3803922, 1,
-0.242077, 1.059411, -1.014874, 0, 1, 0.3882353, 1,
-0.2376037, -1.669013, -3.653765, 0, 1, 0.3921569, 1,
-0.2239842, -0.9888659, -1.893948, 0, 1, 0.4, 1,
-0.216294, 1.050739, -0.7636034, 0, 1, 0.4078431, 1,
-0.2148439, 0.04925724, -2.047217, 0, 1, 0.4117647, 1,
-0.2070957, -1.113729, -1.896776, 0, 1, 0.4196078, 1,
-0.2033198, 1.484869, -0.5622335, 0, 1, 0.4235294, 1,
-0.2004194, 0.9792908, -0.6372247, 0, 1, 0.4313726, 1,
-0.1948769, 0.7777806, -0.4380482, 0, 1, 0.4352941, 1,
-0.191426, -0.6655046, -1.306257, 0, 1, 0.4431373, 1,
-0.1899209, -1.154611, -1.986528, 0, 1, 0.4470588, 1,
-0.1894302, -2.269506, -3.132372, 0, 1, 0.454902, 1,
-0.1884622, -0.4644307, -1.494161, 0, 1, 0.4588235, 1,
-0.1824341, -0.4243034, -1.916831, 0, 1, 0.4666667, 1,
-0.1799615, 1.668797, -2.264989, 0, 1, 0.4705882, 1,
-0.176951, -1.408977, -3.202689, 0, 1, 0.4784314, 1,
-0.1765414, 1.319872, -0.3155476, 0, 1, 0.4823529, 1,
-0.175168, -0.7583286, -3.286422, 0, 1, 0.4901961, 1,
-0.1741481, 1.905778, -0.1846404, 0, 1, 0.4941176, 1,
-0.1739903, 0.3510351, -0.6714206, 0, 1, 0.5019608, 1,
-0.1729601, -0.9246007, -4.260641, 0, 1, 0.509804, 1,
-0.1710046, 1.893505, 0.3379349, 0, 1, 0.5137255, 1,
-0.1688845, -0.4584415, -1.655245, 0, 1, 0.5215687, 1,
-0.1672779, -0.4294171, -5.303681, 0, 1, 0.5254902, 1,
-0.1644052, -0.7829275, -4.247437, 0, 1, 0.5333334, 1,
-0.1625074, -0.1170682, -2.225948, 0, 1, 0.5372549, 1,
-0.153166, -0.2472148, -2.77707, 0, 1, 0.5450981, 1,
-0.1514821, -0.5975394, -1.660634, 0, 1, 0.5490196, 1,
-0.1441273, -1.147186, -3.850026, 0, 1, 0.5568628, 1,
-0.142528, -0.8356157, -2.981032, 0, 1, 0.5607843, 1,
-0.1399457, 0.5735341, -0.1407234, 0, 1, 0.5686275, 1,
-0.1377807, 0.2721919, -1.27081, 0, 1, 0.572549, 1,
-0.1371642, -0.7965068, -4.619656, 0, 1, 0.5803922, 1,
-0.1344241, 0.3633578, -1.829751, 0, 1, 0.5843138, 1,
-0.1338618, 2.87575, -0.5344243, 0, 1, 0.5921569, 1,
-0.1338024, -0.2749256, -2.504845, 0, 1, 0.5960785, 1,
-0.1319159, -0.9198409, -2.894135, 0, 1, 0.6039216, 1,
-0.129752, 1.1314, 0.5993636, 0, 1, 0.6117647, 1,
-0.1223038, 0.2880645, -1.580804, 0, 1, 0.6156863, 1,
-0.1158686, 0.4107147, -0.02093061, 0, 1, 0.6235294, 1,
-0.1146318, 0.0868632, -0.5286012, 0, 1, 0.627451, 1,
-0.1129965, 0.3997402, 0.5126849, 0, 1, 0.6352941, 1,
-0.1097882, 1.118448, 0.4726415, 0, 1, 0.6392157, 1,
-0.1095957, 1.081036, 0.3197387, 0, 1, 0.6470588, 1,
-0.1093779, 0.1726053, -1.252393, 0, 1, 0.6509804, 1,
-0.1035887, -0.4755628, -2.601017, 0, 1, 0.6588235, 1,
-0.09957232, 0.2591142, -2.27815, 0, 1, 0.6627451, 1,
-0.09827233, -1.755771, -4.241366, 0, 1, 0.6705883, 1,
-0.09661794, 0.6781629, -0.7352817, 0, 1, 0.6745098, 1,
-0.09002455, 1.450362, 2.65696, 0, 1, 0.682353, 1,
-0.08972921, 0.4216963, 0.8252817, 0, 1, 0.6862745, 1,
-0.08890826, 1.13395, 1.692545, 0, 1, 0.6941177, 1,
-0.08840675, -1.068581, -2.552869, 0, 1, 0.7019608, 1,
-0.08810655, 0.9436079, 0.1196517, 0, 1, 0.7058824, 1,
-0.08561651, -0.1031519, -1.358925, 0, 1, 0.7137255, 1,
-0.08446725, 1.098458, -1.498033, 0, 1, 0.7176471, 1,
-0.08404235, -1.441971, -5.298773, 0, 1, 0.7254902, 1,
-0.07845785, 0.3873293, -0.4457732, 0, 1, 0.7294118, 1,
-0.07811353, -0.9948484, -2.785069, 0, 1, 0.7372549, 1,
-0.07762168, -0.3530734, -3.720671, 0, 1, 0.7411765, 1,
-0.07738268, 0.06375677, -0.638407, 0, 1, 0.7490196, 1,
-0.07703409, 1.226272, 0.07258262, 0, 1, 0.7529412, 1,
-0.07035799, -1.134024, -0.4257809, 0, 1, 0.7607843, 1,
-0.06662588, 0.7509579, -0.9803213, 0, 1, 0.7647059, 1,
-0.06011385, -0.5995613, -3.265467, 0, 1, 0.772549, 1,
-0.05885277, -0.7954059, -4.006089, 0, 1, 0.7764706, 1,
-0.05570537, 0.4296592, -0.7424974, 0, 1, 0.7843137, 1,
-0.05507794, 1.580048, -1.41008, 0, 1, 0.7882353, 1,
-0.05344466, -2.305069, -4.133257, 0, 1, 0.7960784, 1,
-0.05282009, -0.6898495, -2.301819, 0, 1, 0.8039216, 1,
-0.05012555, -0.4285392, -2.761304, 0, 1, 0.8078431, 1,
-0.04601797, 0.8063292, -0.1798474, 0, 1, 0.8156863, 1,
-0.04076374, 0.5820778, 0.2119532, 0, 1, 0.8196079, 1,
-0.03781397, -1.692984, -2.029913, 0, 1, 0.827451, 1,
-0.03601402, 1.362983, 0.9272125, 0, 1, 0.8313726, 1,
-0.03484312, -0.9734169, -3.067706, 0, 1, 0.8392157, 1,
-0.03171095, -0.2177579, -5.500616, 0, 1, 0.8431373, 1,
-0.03125851, 0.1377267, 1.942707, 0, 1, 0.8509804, 1,
-0.02902133, -1.807739, -3.465833, 0, 1, 0.854902, 1,
-0.028154, 0.4740282, -0.9623264, 0, 1, 0.8627451, 1,
-0.02684557, -2.195491, -2.814719, 0, 1, 0.8666667, 1,
-0.02205476, -0.4636692, -3.116497, 0, 1, 0.8745098, 1,
-0.02007648, 0.07746658, -0.8710113, 0, 1, 0.8784314, 1,
-0.01470078, -1.004044, -3.726515, 0, 1, 0.8862745, 1,
-0.01090484, -0.712461, -4.341187, 0, 1, 0.8901961, 1,
-0.009033074, 0.5279, -0.4204671, 0, 1, 0.8980392, 1,
-0.001440401, 0.3530278, -0.8283987, 0, 1, 0.9058824, 1,
-0.0001530072, -0.3829246, -4.322017, 0, 1, 0.9098039, 1,
0.005783396, 1.803602, 0.4958421, 0, 1, 0.9176471, 1,
0.007835985, -0.1896099, 4.356721, 0, 1, 0.9215686, 1,
0.008291646, 0.3739541, -0.7522772, 0, 1, 0.9294118, 1,
0.008458535, -0.605507, 4.780751, 0, 1, 0.9333333, 1,
0.009007543, 0.5357054, 0.4994107, 0, 1, 0.9411765, 1,
0.009906243, -0.1765553, 2.205398, 0, 1, 0.945098, 1,
0.01205198, -0.6830322, 2.657835, 0, 1, 0.9529412, 1,
0.02253733, -0.1704435, 4.305155, 0, 1, 0.9568627, 1,
0.02400465, 0.7732394, 0.391353, 0, 1, 0.9647059, 1,
0.02411547, 0.8187238, -0.5603213, 0, 1, 0.9686275, 1,
0.02740528, 0.2305243, 1.48164, 0, 1, 0.9764706, 1,
0.03322581, 1.684795, 1.729025, 0, 1, 0.9803922, 1,
0.03732246, -1.370293, 2.060102, 0, 1, 0.9882353, 1,
0.04305889, -1.922911, 3.828581, 0, 1, 0.9921569, 1,
0.04616353, 1.00965, -0.5391887, 0, 1, 1, 1,
0.04654382, -0.8205706, 5.044312, 0, 0.9921569, 1, 1,
0.0474653, -0.6845765, 3.220096, 0, 0.9882353, 1, 1,
0.05149823, -1.503654, 1.402086, 0, 0.9803922, 1, 1,
0.05290506, 0.7592563, -0.6083927, 0, 0.9764706, 1, 1,
0.05556516, 1.043613, 0.6413907, 0, 0.9686275, 1, 1,
0.05651131, -0.4045467, 3.739342, 0, 0.9647059, 1, 1,
0.05655263, -2.074364, 2.724158, 0, 0.9568627, 1, 1,
0.06471568, -0.8474014, 4.594689, 0, 0.9529412, 1, 1,
0.06618199, 1.175787, 0.2536786, 0, 0.945098, 1, 1,
0.07530962, 0.3703582, -0.2225335, 0, 0.9411765, 1, 1,
0.0764345, -1.149478, 4.869592, 0, 0.9333333, 1, 1,
0.08159986, -0.654916, 3.868008, 0, 0.9294118, 1, 1,
0.08473257, 0.6557589, 0.4271403, 0, 0.9215686, 1, 1,
0.08701473, -1.03692, 1.821561, 0, 0.9176471, 1, 1,
0.0875028, 0.222591, 0.7674726, 0, 0.9098039, 1, 1,
0.09571221, 0.7104602, 0.6737279, 0, 0.9058824, 1, 1,
0.096098, 0.6630854, -0.9552642, 0, 0.8980392, 1, 1,
0.09633789, 1.128004, 0.9344426, 0, 0.8901961, 1, 1,
0.09694847, 0.4699699, 1.439074, 0, 0.8862745, 1, 1,
0.09776422, -0.8103539, 2.94627, 0, 0.8784314, 1, 1,
0.09809356, 1.006168, 1.094915, 0, 0.8745098, 1, 1,
0.09931987, -0.07440811, 3.843742, 0, 0.8666667, 1, 1,
0.09935811, -1.307289, 3.747736, 0, 0.8627451, 1, 1,
0.1026687, -1.298965, 2.92511, 0, 0.854902, 1, 1,
0.1054405, 0.2006664, 0.9320988, 0, 0.8509804, 1, 1,
0.1073394, -1.959546, 2.757711, 0, 0.8431373, 1, 1,
0.1170354, 0.3863328, 0.8084962, 0, 0.8392157, 1, 1,
0.1187093, -0.9807613, 3.183948, 0, 0.8313726, 1, 1,
0.123311, -1.022615, 5.586266, 0, 0.827451, 1, 1,
0.1241637, 0.7972269, -1.953501, 0, 0.8196079, 1, 1,
0.1263125, -1.138202, 3.807456, 0, 0.8156863, 1, 1,
0.1313213, 0.6747936, -1.255161, 0, 0.8078431, 1, 1,
0.1364519, 1.079387, 0.8549323, 0, 0.8039216, 1, 1,
0.1373286, 0.61388, -0.1053042, 0, 0.7960784, 1, 1,
0.1388057, -0.4266487, 3.18948, 0, 0.7882353, 1, 1,
0.1398788, -0.4412041, 1.8129, 0, 0.7843137, 1, 1,
0.1399339, -0.1557643, 2.97712, 0, 0.7764706, 1, 1,
0.1462478, -0.8316428, 3.332488, 0, 0.772549, 1, 1,
0.1552857, -0.5753714, 2.564022, 0, 0.7647059, 1, 1,
0.155325, 2.30523, -0.1477979, 0, 0.7607843, 1, 1,
0.1596536, -0.3156488, 2.431106, 0, 0.7529412, 1, 1,
0.1639353, 0.9069175, 2.022984, 0, 0.7490196, 1, 1,
0.178964, 0.7146826, 1.251178, 0, 0.7411765, 1, 1,
0.1830786, -0.2578925, 2.138457, 0, 0.7372549, 1, 1,
0.1861455, -0.8567237, 4.451708, 0, 0.7294118, 1, 1,
0.188254, -0.8158439, 1.998918, 0, 0.7254902, 1, 1,
0.1906365, 0.7482738, -1.078272, 0, 0.7176471, 1, 1,
0.1929787, 0.4594904, 1.254458, 0, 0.7137255, 1, 1,
0.1948193, 0.1087984, 0.4172543, 0, 0.7058824, 1, 1,
0.19498, -0.7581326, 2.538998, 0, 0.6980392, 1, 1,
0.1967341, -2.323287, 3.505335, 0, 0.6941177, 1, 1,
0.198926, -1.105807, 1.486621, 0, 0.6862745, 1, 1,
0.199407, 0.2078152, 0.3240044, 0, 0.682353, 1, 1,
0.1994188, 0.215701, -0.6309243, 0, 0.6745098, 1, 1,
0.1999915, -1.323642, 2.474761, 0, 0.6705883, 1, 1,
0.2034775, 1.258971, -0.7981616, 0, 0.6627451, 1, 1,
0.2054001, -0.7637008, 1.580902, 0, 0.6588235, 1, 1,
0.2162885, -0.5978028, 2.761538, 0, 0.6509804, 1, 1,
0.2163783, 1.542308, 0.2280037, 0, 0.6470588, 1, 1,
0.2170685, -1.356122, 3.131433, 0, 0.6392157, 1, 1,
0.2179462, 1.257304, 0.4428042, 0, 0.6352941, 1, 1,
0.2188933, 1.370546, -0.7264198, 0, 0.627451, 1, 1,
0.2234157, 0.2483417, 1.053631, 0, 0.6235294, 1, 1,
0.2250131, -0.5565516, 2.14766, 0, 0.6156863, 1, 1,
0.2251189, -1.006255, 3.163527, 0, 0.6117647, 1, 1,
0.2283537, 0.1669504, -1.026987, 0, 0.6039216, 1, 1,
0.2314034, -1.138564, 2.630559, 0, 0.5960785, 1, 1,
0.2328275, -0.05114393, 2.371898, 0, 0.5921569, 1, 1,
0.2358329, -0.5472637, 3.838808, 0, 0.5843138, 1, 1,
0.2369281, 0.07629152, 1.346749, 0, 0.5803922, 1, 1,
0.2374332, 1.022879, 2.357967, 0, 0.572549, 1, 1,
0.2417766, -1.235393, 3.577485, 0, 0.5686275, 1, 1,
0.2461815, 0.3569563, 0.6529441, 0, 0.5607843, 1, 1,
0.2495438, -0.0417368, 2.305374, 0, 0.5568628, 1, 1,
0.2503984, 0.3772617, 2.624045, 0, 0.5490196, 1, 1,
0.2652367, -0.526171, 3.460637, 0, 0.5450981, 1, 1,
0.2677796, -0.6158444, 2.475851, 0, 0.5372549, 1, 1,
0.2740507, 1.074791, 0.9342731, 0, 0.5333334, 1, 1,
0.280283, -1.450802, 3.937412, 0, 0.5254902, 1, 1,
0.2819092, 0.9504263, 0.2245317, 0, 0.5215687, 1, 1,
0.2844532, -1.308253, 4.122568, 0, 0.5137255, 1, 1,
0.2854422, 0.6806512, -0.1678498, 0, 0.509804, 1, 1,
0.2856961, 1.445071, 0.1614127, 0, 0.5019608, 1, 1,
0.2873852, -1.268253, 3.295696, 0, 0.4941176, 1, 1,
0.2905873, 1.036741, -1.017215, 0, 0.4901961, 1, 1,
0.2927922, -0.3004455, 0.5246035, 0, 0.4823529, 1, 1,
0.2929651, 1.930205, 0.1733656, 0, 0.4784314, 1, 1,
0.2950844, 0.9288148, -0.009701786, 0, 0.4705882, 1, 1,
0.2981695, -1.771798, 2.210794, 0, 0.4666667, 1, 1,
0.3018893, 0.3139444, -0.184058, 0, 0.4588235, 1, 1,
0.3042227, -0.893836, 3.700889, 0, 0.454902, 1, 1,
0.3046132, -2.22795, 3.058145, 0, 0.4470588, 1, 1,
0.3066033, -0.02750759, 2.118932, 0, 0.4431373, 1, 1,
0.3071804, -0.5056601, 1.791455, 0, 0.4352941, 1, 1,
0.3077772, -0.1735496, 2.251768, 0, 0.4313726, 1, 1,
0.3098963, 0.3944471, 1.131379, 0, 0.4235294, 1, 1,
0.3132436, 1.668174, 0.7043657, 0, 0.4196078, 1, 1,
0.3139412, -0.6151692, 2.544898, 0, 0.4117647, 1, 1,
0.3153301, 0.6369259, 0.620514, 0, 0.4078431, 1, 1,
0.3221016, -1.643527, 2.639687, 0, 0.4, 1, 1,
0.329246, -0.4326423, 2.631038, 0, 0.3921569, 1, 1,
0.3326922, -0.6098154, 2.605658, 0, 0.3882353, 1, 1,
0.3345282, -0.4805764, 2.703043, 0, 0.3803922, 1, 1,
0.335875, -1.148762, 2.097881, 0, 0.3764706, 1, 1,
0.3400455, 0.5017025, 1.106896, 0, 0.3686275, 1, 1,
0.3414066, -0.5172135, 1.325248, 0, 0.3647059, 1, 1,
0.3417313, -0.388465, 1.213354, 0, 0.3568628, 1, 1,
0.348073, -0.4837729, 1.253244, 0, 0.3529412, 1, 1,
0.3505487, -0.283088, 1.311934, 0, 0.345098, 1, 1,
0.3538821, -0.04471796, 1.858644, 0, 0.3411765, 1, 1,
0.3552248, -1.534713, 1.777315, 0, 0.3333333, 1, 1,
0.3552306, -0.3122419, 0.9970034, 0, 0.3294118, 1, 1,
0.3552777, 1.548282, -0.2159861, 0, 0.3215686, 1, 1,
0.3560995, -0.4371892, 0.4306478, 0, 0.3176471, 1, 1,
0.3561248, 0.9209809, 0.4285136, 0, 0.3098039, 1, 1,
0.3623843, 0.1067473, 1.942453, 0, 0.3058824, 1, 1,
0.3680933, -1.023071, 1.306501, 0, 0.2980392, 1, 1,
0.3711007, -1.458444, 3.285924, 0, 0.2901961, 1, 1,
0.3780967, -0.9659575, 0.9507629, 0, 0.2862745, 1, 1,
0.3814485, -0.7921815, 2.578832, 0, 0.2784314, 1, 1,
0.3880858, -0.06434048, 1.085501, 0, 0.2745098, 1, 1,
0.3886851, -1.855496, 3.620542, 0, 0.2666667, 1, 1,
0.3934051, 1.079311, -0.2332396, 0, 0.2627451, 1, 1,
0.3942081, 0.8421602, 0.3218252, 0, 0.254902, 1, 1,
0.397409, 1.68032, 0.559772, 0, 0.2509804, 1, 1,
0.3982718, -0.130504, 2.864428, 0, 0.2431373, 1, 1,
0.4009498, -0.08414203, 2.462451, 0, 0.2392157, 1, 1,
0.4017562, -1.27292, 2.495929, 0, 0.2313726, 1, 1,
0.4028834, 0.3337992, 1.991502, 0, 0.227451, 1, 1,
0.4049792, 0.5633115, 0.555046, 0, 0.2196078, 1, 1,
0.4051764, -1.235592, 3.65123, 0, 0.2156863, 1, 1,
0.4097671, -1.032246, 1.863629, 0, 0.2078431, 1, 1,
0.4156765, 0.4858494, -1.707841, 0, 0.2039216, 1, 1,
0.4161008, 0.2194335, 0.9870264, 0, 0.1960784, 1, 1,
0.4174553, -2.815624, 1.121432, 0, 0.1882353, 1, 1,
0.4233973, -0.1753311, 2.189189, 0, 0.1843137, 1, 1,
0.4365784, -0.09411587, 2.632, 0, 0.1764706, 1, 1,
0.4386357, 0.157125, -0.2420639, 0, 0.172549, 1, 1,
0.4503161, -0.657083, 0.4795546, 0, 0.1647059, 1, 1,
0.4584493, -0.2806764, 0.8230329, 0, 0.1607843, 1, 1,
0.460364, -0.7274632, 2.809299, 0, 0.1529412, 1, 1,
0.4619952, -0.9134857, 2.13006, 0, 0.1490196, 1, 1,
0.4642906, -0.2941528, 1.456971, 0, 0.1411765, 1, 1,
0.4696256, -0.2632518, 2.144156, 0, 0.1372549, 1, 1,
0.4703474, 1.567433, 0.393365, 0, 0.1294118, 1, 1,
0.4724792, -0.8889593, 4.718544, 0, 0.1254902, 1, 1,
0.477398, 0.944411, -1.737041, 0, 0.1176471, 1, 1,
0.4802081, 0.7854678, 0.2877546, 0, 0.1137255, 1, 1,
0.4839034, -1.645276, 3.54865, 0, 0.1058824, 1, 1,
0.4872259, -0.0909021, 2.108124, 0, 0.09803922, 1, 1,
0.4915932, 1.006186, -1.205534, 0, 0.09411765, 1, 1,
0.4999494, -2.230466, 2.477509, 0, 0.08627451, 1, 1,
0.500649, 0.0257294, 3.07335, 0, 0.08235294, 1, 1,
0.5037723, -2.420015, 2.228009, 0, 0.07450981, 1, 1,
0.5041095, 0.1834299, 1.771259, 0, 0.07058824, 1, 1,
0.5056104, -0.2556914, 0.2446184, 0, 0.0627451, 1, 1,
0.5099735, -0.1656065, 2.129545, 0, 0.05882353, 1, 1,
0.5164187, -1.078121, 2.620407, 0, 0.05098039, 1, 1,
0.5165206, 0.6072929, 0.5237855, 0, 0.04705882, 1, 1,
0.5204332, -0.5662259, 2.103639, 0, 0.03921569, 1, 1,
0.5215706, 1.223993, -1.155355, 0, 0.03529412, 1, 1,
0.5221658, -0.5026757, 3.20529, 0, 0.02745098, 1, 1,
0.5275877, -2.098923, 2.67289, 0, 0.02352941, 1, 1,
0.5289119, 1.30258, 0.5606639, 0, 0.01568628, 1, 1,
0.5341966, 1.07841, 0.3387683, 0, 0.01176471, 1, 1,
0.539792, 0.3178774, 2.438657, 0, 0.003921569, 1, 1,
0.5400959, -0.5371408, 1.281142, 0.003921569, 0, 1, 1,
0.5448113, 0.5405889, 0.5129091, 0.007843138, 0, 1, 1,
0.5452334, -0.03156009, 1.814304, 0.01568628, 0, 1, 1,
0.5468469, 0.845778, 0.2174668, 0.01960784, 0, 1, 1,
0.5496336, 0.9239753, -0.5041308, 0.02745098, 0, 1, 1,
0.5499792, 1.334019, 0.3669445, 0.03137255, 0, 1, 1,
0.5548873, -0.8719854, 3.597084, 0.03921569, 0, 1, 1,
0.5556851, 1.172343, 0.6125388, 0.04313726, 0, 1, 1,
0.5565655, 0.2939519, 1.345822, 0.05098039, 0, 1, 1,
0.5620691, 0.9803189, 0.9643577, 0.05490196, 0, 1, 1,
0.5647433, -1.418448, 4.794472, 0.0627451, 0, 1, 1,
0.5651767, -0.383579, 1.80614, 0.06666667, 0, 1, 1,
0.5661656, 0.6833703, 0.5338306, 0.07450981, 0, 1, 1,
0.5688632, 0.54118, 0.2001274, 0.07843138, 0, 1, 1,
0.5760311, -1.452292, 1.902413, 0.08627451, 0, 1, 1,
0.5766572, 1.153204, 0.7790317, 0.09019608, 0, 1, 1,
0.5768114, -0.1064514, 1.12482, 0.09803922, 0, 1, 1,
0.5775312, -0.6837559, 2.304999, 0.1058824, 0, 1, 1,
0.5785237, 0.5953948, -0.435397, 0.1098039, 0, 1, 1,
0.5808716, 0.9564862, 0.4600698, 0.1176471, 0, 1, 1,
0.584287, -0.6165506, 3.560544, 0.1215686, 0, 1, 1,
0.5853217, -0.2034492, 2.388205, 0.1294118, 0, 1, 1,
0.5872648, -0.5675281, 2.92437, 0.1333333, 0, 1, 1,
0.5883967, 0.8320357, -0.2019275, 0.1411765, 0, 1, 1,
0.5892242, 1.434441, 1.409733, 0.145098, 0, 1, 1,
0.5893321, 0.9339843, 1.35906, 0.1529412, 0, 1, 1,
0.5961903, 0.5731619, 0.04793036, 0.1568628, 0, 1, 1,
0.5964578, 0.7773864, -0.7324965, 0.1647059, 0, 1, 1,
0.5977465, 1.867391, -0.7944833, 0.1686275, 0, 1, 1,
0.6027158, 0.5125009, 1.249068, 0.1764706, 0, 1, 1,
0.6079498, -0.4128679, 2.525845, 0.1803922, 0, 1, 1,
0.6085635, 1.266065, -1.666778, 0.1882353, 0, 1, 1,
0.6103414, 0.5572839, 2.042973, 0.1921569, 0, 1, 1,
0.6104788, -0.5661119, 2.332416, 0.2, 0, 1, 1,
0.6117128, 0.3834141, -0.1082814, 0.2078431, 0, 1, 1,
0.6127871, 1.961923, -0.3176631, 0.2117647, 0, 1, 1,
0.6128815, 0.2702372, 1.537438, 0.2196078, 0, 1, 1,
0.6137285, 1.07411, 2.143922, 0.2235294, 0, 1, 1,
0.6139845, -0.5669336, 1.480855, 0.2313726, 0, 1, 1,
0.6142845, -1.633885, 3.62611, 0.2352941, 0, 1, 1,
0.6150365, -0.8413842, 3.511972, 0.2431373, 0, 1, 1,
0.6181206, 0.4484557, 0.4295675, 0.2470588, 0, 1, 1,
0.6193503, 0.3547282, 0.8682803, 0.254902, 0, 1, 1,
0.6200785, -0.4325293, 2.133741, 0.2588235, 0, 1, 1,
0.6218839, -0.5463267, 3.297868, 0.2666667, 0, 1, 1,
0.6251661, 0.4443157, 1.68728, 0.2705882, 0, 1, 1,
0.6254356, 0.5574992, 0.2390974, 0.2784314, 0, 1, 1,
0.6262478, -0.9843474, 3.110244, 0.282353, 0, 1, 1,
0.6276586, 0.5364636, 0.6763627, 0.2901961, 0, 1, 1,
0.6282385, 0.4178948, 0.8996974, 0.2941177, 0, 1, 1,
0.6291687, 0.2513925, 3.0523, 0.3019608, 0, 1, 1,
0.6307822, 0.2198759, 1.913999, 0.3098039, 0, 1, 1,
0.6345971, -2.399931, 1.761845, 0.3137255, 0, 1, 1,
0.6381654, 2.443753, 0.9867005, 0.3215686, 0, 1, 1,
0.6458721, 0.1812362, 1.117186, 0.3254902, 0, 1, 1,
0.6460432, -0.5628248, 3.156096, 0.3333333, 0, 1, 1,
0.6485282, -0.9904141, 3.708438, 0.3372549, 0, 1, 1,
0.6522487, -1.258962, 2.455499, 0.345098, 0, 1, 1,
0.6536312, -0.5152169, 3.044731, 0.3490196, 0, 1, 1,
0.6590628, -2.119452, 3.532161, 0.3568628, 0, 1, 1,
0.6591416, 0.6073547, 1.60685, 0.3607843, 0, 1, 1,
0.6593668, -1.042156, 2.723733, 0.3686275, 0, 1, 1,
0.6623033, 0.7661641, -0.4958743, 0.372549, 0, 1, 1,
0.6640516, -1.653078, 2.20172, 0.3803922, 0, 1, 1,
0.669769, -0.4682547, 2.051588, 0.3843137, 0, 1, 1,
0.6703631, -0.4908798, 2.520267, 0.3921569, 0, 1, 1,
0.6728847, 1.828325, -0.03268113, 0.3960784, 0, 1, 1,
0.6732271, -2.159972, 1.819392, 0.4039216, 0, 1, 1,
0.6763588, -0.4879687, 1.150292, 0.4117647, 0, 1, 1,
0.6764902, 1.169261, 0.761821, 0.4156863, 0, 1, 1,
0.6798881, -0.2359926, 3.164021, 0.4235294, 0, 1, 1,
0.6837474, -0.4540012, 1.932139, 0.427451, 0, 1, 1,
0.6856049, -0.2490255, 1.941405, 0.4352941, 0, 1, 1,
0.6903163, 1.758565, 2.530917, 0.4392157, 0, 1, 1,
0.6985593, -0.5400949, 3.682211, 0.4470588, 0, 1, 1,
0.6989537, -0.07561675, 4.337174, 0.4509804, 0, 1, 1,
0.7071167, 3.050866, 2.254134, 0.4588235, 0, 1, 1,
0.7137873, -2.193455, 2.54818, 0.4627451, 0, 1, 1,
0.7174135, -0.7016991, 3.105033, 0.4705882, 0, 1, 1,
0.7231044, -1.015686, 4.367154, 0.4745098, 0, 1, 1,
0.7247938, 0.5369383, 0.3688926, 0.4823529, 0, 1, 1,
0.7297981, 2.248504, 0.7320371, 0.4862745, 0, 1, 1,
0.7301295, -1.304612, 2.386787, 0.4941176, 0, 1, 1,
0.7328438, 0.7205762, 0.3064987, 0.5019608, 0, 1, 1,
0.7353328, 1.146446, -0.176836, 0.5058824, 0, 1, 1,
0.7388086, 0.04868294, 1.805589, 0.5137255, 0, 1, 1,
0.7471872, 0.4919538, -1.727631, 0.5176471, 0, 1, 1,
0.7513635, -0.1778646, 3.134353, 0.5254902, 0, 1, 1,
0.7517245, 1.90805, 0.03126458, 0.5294118, 0, 1, 1,
0.7545525, -0.5792511, 0.7446631, 0.5372549, 0, 1, 1,
0.7565987, -1.825656, 0.6956666, 0.5411765, 0, 1, 1,
0.7567753, 1.942199, 0.7886141, 0.5490196, 0, 1, 1,
0.7585077, 1.347535, 0.7233988, 0.5529412, 0, 1, 1,
0.7612625, -0.1539478, 0.666995, 0.5607843, 0, 1, 1,
0.7666773, 0.9033007, 1.929526, 0.5647059, 0, 1, 1,
0.7683146, -0.5257644, 0.893536, 0.572549, 0, 1, 1,
0.7701856, 1.155625, 1.58316, 0.5764706, 0, 1, 1,
0.7762294, -0.833803, 1.834257, 0.5843138, 0, 1, 1,
0.7790083, 0.9971067, -0.4267393, 0.5882353, 0, 1, 1,
0.7844138, -0.9945176, 2.879483, 0.5960785, 0, 1, 1,
0.7847362, -0.04889134, 1.798302, 0.6039216, 0, 1, 1,
0.7980428, -0.3253972, 2.710001, 0.6078432, 0, 1, 1,
0.7985776, -0.2105658, 0.5479741, 0.6156863, 0, 1, 1,
0.8003697, 0.333061, 1.928106, 0.6196079, 0, 1, 1,
0.8078507, -1.238555, 2.87794, 0.627451, 0, 1, 1,
0.8126599, 0.1108403, 2.09138, 0.6313726, 0, 1, 1,
0.8153894, -1.64077, 2.646713, 0.6392157, 0, 1, 1,
0.8222339, 0.5685745, -0.1274928, 0.6431373, 0, 1, 1,
0.8226095, -1.346568, 2.699289, 0.6509804, 0, 1, 1,
0.8289744, -1.939019, 2.696865, 0.654902, 0, 1, 1,
0.8290828, -0.1747735, 1.903207, 0.6627451, 0, 1, 1,
0.8328723, 0.5004637, 2.513086, 0.6666667, 0, 1, 1,
0.8329422, 0.5992489, -0.9649805, 0.6745098, 0, 1, 1,
0.8339403, 2.517668, -0.4084721, 0.6784314, 0, 1, 1,
0.8374466, -0.9531549, 3.713417, 0.6862745, 0, 1, 1,
0.8396554, -1.904978, 1.716903, 0.6901961, 0, 1, 1,
0.8409981, 0.2603098, 0.5824739, 0.6980392, 0, 1, 1,
0.8435526, 1.08409, -0.1585243, 0.7058824, 0, 1, 1,
0.8443803, 1.330183, 0.5259832, 0.7098039, 0, 1, 1,
0.8470506, -0.5627975, 2.354042, 0.7176471, 0, 1, 1,
0.8501016, -0.06731703, 1.553191, 0.7215686, 0, 1, 1,
0.8627653, 1.068287, 0.6255302, 0.7294118, 0, 1, 1,
0.8682529, -0.6753712, 2.280826, 0.7333333, 0, 1, 1,
0.8706849, 1.84841, 1.133554, 0.7411765, 0, 1, 1,
0.8713458, 0.1821491, 2.109457, 0.7450981, 0, 1, 1,
0.8725215, -0.8973562, 2.025298, 0.7529412, 0, 1, 1,
0.8752468, 0.5260959, 1.431014, 0.7568628, 0, 1, 1,
0.8797349, 1.210888, 0.9654206, 0.7647059, 0, 1, 1,
0.8830449, 0.06458361, 1.584615, 0.7686275, 0, 1, 1,
0.892912, -1.789191, 1.811378, 0.7764706, 0, 1, 1,
0.8955914, 1.029858, 0.4923283, 0.7803922, 0, 1, 1,
0.8992245, -0.6832857, 4.510719, 0.7882353, 0, 1, 1,
0.9023878, -0.6158772, 3.076329, 0.7921569, 0, 1, 1,
0.9032924, -1.196301, 4.263071, 0.8, 0, 1, 1,
0.9036858, -1.288252, 1.793936, 0.8078431, 0, 1, 1,
0.9045194, -0.1971357, 2.263998, 0.8117647, 0, 1, 1,
0.9090161, 0.3848867, 0.4894423, 0.8196079, 0, 1, 1,
0.9116973, 0.07498001, 1.46809, 0.8235294, 0, 1, 1,
0.9194064, -1.565327, 2.119283, 0.8313726, 0, 1, 1,
0.9194904, 0.9805988, 0.4517875, 0.8352941, 0, 1, 1,
0.9246841, 0.8617986, 0.424329, 0.8431373, 0, 1, 1,
0.9331985, -0.6584164, 3.679122, 0.8470588, 0, 1, 1,
0.9341307, 2.017728, 1.604772, 0.854902, 0, 1, 1,
0.9351135, -1.422401, 1.449514, 0.8588235, 0, 1, 1,
0.9364633, 0.481117, 1.147794, 0.8666667, 0, 1, 1,
0.9444146, 0.9435879, 0.610172, 0.8705882, 0, 1, 1,
0.9523816, 1.077249, 2.287159, 0.8784314, 0, 1, 1,
0.9527834, -0.849295, 2.738095, 0.8823529, 0, 1, 1,
0.95472, 0.1630414, 2.246189, 0.8901961, 0, 1, 1,
0.958164, 0.7062318, 0.5599251, 0.8941177, 0, 1, 1,
0.9601185, -1.805625, 4.558496, 0.9019608, 0, 1, 1,
0.9608735, -0.2704023, 2.480022, 0.9098039, 0, 1, 1,
0.9622042, 0.6202646, 1.892975, 0.9137255, 0, 1, 1,
0.9669736, 2.044189, 1.368422, 0.9215686, 0, 1, 1,
0.968751, -0.640403, 1.848204, 0.9254902, 0, 1, 1,
0.9752263, -0.3548347, 1.578761, 0.9333333, 0, 1, 1,
0.976371, 0.542194, 2.889699, 0.9372549, 0, 1, 1,
0.9794676, -0.779951, 2.525807, 0.945098, 0, 1, 1,
0.9808912, 1.004757, 0.8292484, 0.9490196, 0, 1, 1,
0.9811398, 0.221406, 1.976736, 0.9568627, 0, 1, 1,
0.987945, 2.062702, 0.7733145, 0.9607843, 0, 1, 1,
0.9887121, 0.1829495, 2.108457, 0.9686275, 0, 1, 1,
0.9951829, 0.8001896, 1.380228, 0.972549, 0, 1, 1,
0.9972727, -0.4670171, 0.9077908, 0.9803922, 0, 1, 1,
0.999418, 0.08166721, 2.007294, 0.9843137, 0, 1, 1,
1.00595, 0.378195, 2.260156, 0.9921569, 0, 1, 1,
1.006901, 0.579752, 0.8350751, 0.9960784, 0, 1, 1,
1.008522, 1.106219, 1.523355, 1, 0, 0.9960784, 1,
1.009081, -0.8930385, 1.70592, 1, 0, 0.9882353, 1,
1.014343, -0.8681205, 3.183733, 1, 0, 0.9843137, 1,
1.019764, -0.1523095, 0.9713874, 1, 0, 0.9764706, 1,
1.020852, 1.594445, 0.5900803, 1, 0, 0.972549, 1,
1.022063, 0.3034478, 1.924414, 1, 0, 0.9647059, 1,
1.035382, 0.7860169, 0.0452494, 1, 0, 0.9607843, 1,
1.036765, 0.4615982, 1.010862, 1, 0, 0.9529412, 1,
1.038515, 1.821467, -0.7015532, 1, 0, 0.9490196, 1,
1.042268, -0.9283691, 0.8075906, 1, 0, 0.9411765, 1,
1.04334, -0.9310623, 3.566683, 1, 0, 0.9372549, 1,
1.044708, 0.05561804, 0.5327806, 1, 0, 0.9294118, 1,
1.055344, 1.304285, -0.527787, 1, 0, 0.9254902, 1,
1.057243, -1.167849, 3.534262, 1, 0, 0.9176471, 1,
1.073015, 0.1711964, 1.600835, 1, 0, 0.9137255, 1,
1.073275, -0.8408943, 1.344191, 1, 0, 0.9058824, 1,
1.090056, 1.074653, 1.230624, 1, 0, 0.9019608, 1,
1.090821, -2.260748, 1.395393, 1, 0, 0.8941177, 1,
1.094205, 0.9280256, 1.791278, 1, 0, 0.8862745, 1,
1.099055, 0.5852762, 0.9948846, 1, 0, 0.8823529, 1,
1.105052, -0.3273328, 4.156192, 1, 0, 0.8745098, 1,
1.105106, 0.8418651, 2.886643, 1, 0, 0.8705882, 1,
1.114335, 0.9823828, -0.5755218, 1, 0, 0.8627451, 1,
1.117148, 1.094975, 1.806564, 1, 0, 0.8588235, 1,
1.125749, 1.385801, -0.734745, 1, 0, 0.8509804, 1,
1.131646, 0.06901672, 0.7566943, 1, 0, 0.8470588, 1,
1.135224, 2.136384, 0.08130956, 1, 0, 0.8392157, 1,
1.13649, 0.9937862, 0.1258038, 1, 0, 0.8352941, 1,
1.147324, 1.313264, 2.711317, 1, 0, 0.827451, 1,
1.159041, -1.007971, 1.558956, 1, 0, 0.8235294, 1,
1.167171, 0.5467749, 1.073909, 1, 0, 0.8156863, 1,
1.168455, 0.5983165, 1.799701, 1, 0, 0.8117647, 1,
1.168944, 0.2382386, 1.343156, 1, 0, 0.8039216, 1,
1.170005, 0.8356788, -1.298621, 1, 0, 0.7960784, 1,
1.18084, 0.0444657, 3.13605, 1, 0, 0.7921569, 1,
1.18492, 1.028274, 2.057797, 1, 0, 0.7843137, 1,
1.193159, 0.7485687, 0.7456757, 1, 0, 0.7803922, 1,
1.199962, 1.14081, 0.7186486, 1, 0, 0.772549, 1,
1.205062, -0.157095, 2.047065, 1, 0, 0.7686275, 1,
1.20654, 0.2289079, 1.956539, 1, 0, 0.7607843, 1,
1.209886, 0.4896119, 0.6772214, 1, 0, 0.7568628, 1,
1.210126, -0.2912033, 0.9668733, 1, 0, 0.7490196, 1,
1.211249, 1.009794, 1.266821, 1, 0, 0.7450981, 1,
1.21239, -0.1098618, 0.9517477, 1, 0, 0.7372549, 1,
1.213354, 0.01894704, 0.00611741, 1, 0, 0.7333333, 1,
1.213644, -0.05208979, -0.5805239, 1, 0, 0.7254902, 1,
1.219063, 2.105865, -0.4979535, 1, 0, 0.7215686, 1,
1.219158, -0.3122817, 2.111964, 1, 0, 0.7137255, 1,
1.222213, -0.1611829, 1.468086, 1, 0, 0.7098039, 1,
1.228279, 0.1669543, 0.7527581, 1, 0, 0.7019608, 1,
1.235632, -0.8372784, 2.248128, 1, 0, 0.6941177, 1,
1.242136, 0.7364631, 1.093699, 1, 0, 0.6901961, 1,
1.242635, -0.9580155, 3.013621, 1, 0, 0.682353, 1,
1.244802, 0.8121498, 0.4127616, 1, 0, 0.6784314, 1,
1.258596, -1.969642, 2.950282, 1, 0, 0.6705883, 1,
1.260064, -0.8642487, 0.4579852, 1, 0, 0.6666667, 1,
1.269994, -0.4204795, 0.8996818, 1, 0, 0.6588235, 1,
1.270784, 1.31262, 2.557765, 1, 0, 0.654902, 1,
1.276489, -0.1340968, 1.845435, 1, 0, 0.6470588, 1,
1.280636, 1.099772, 1.067236, 1, 0, 0.6431373, 1,
1.290566, 0.4137728, 1.618542, 1, 0, 0.6352941, 1,
1.294964, 0.4391288, -0.718419, 1, 0, 0.6313726, 1,
1.308575, -1.785953, 3.280423, 1, 0, 0.6235294, 1,
1.318642, 0.6486508, 2.207038, 1, 0, 0.6196079, 1,
1.32045, 2.283016, 0.6767944, 1, 0, 0.6117647, 1,
1.327036, 0.1773512, 0.3691382, 1, 0, 0.6078432, 1,
1.330592, 1.490517, 0.2123455, 1, 0, 0.6, 1,
1.341221, -0.1451822, 1.945603, 1, 0, 0.5921569, 1,
1.341834, -0.6752641, 1.896911, 1, 0, 0.5882353, 1,
1.343918, -1.522131, -0.4259294, 1, 0, 0.5803922, 1,
1.356218, -0.8795643, 2.44784, 1, 0, 0.5764706, 1,
1.366624, 0.1137767, 2.614914, 1, 0, 0.5686275, 1,
1.373879, 0.8619325, 0.6288094, 1, 0, 0.5647059, 1,
1.374191, 0.149451, 1.006595, 1, 0, 0.5568628, 1,
1.374607, 1.529938, 1.616428, 1, 0, 0.5529412, 1,
1.380449, -1.495104, 0.7398273, 1, 0, 0.5450981, 1,
1.383523, 0.5490348, 1.36412, 1, 0, 0.5411765, 1,
1.391859, 0.06948847, 3.79773, 1, 0, 0.5333334, 1,
1.391991, 0.6151716, 0.4708106, 1, 0, 0.5294118, 1,
1.407345, 0.3242461, 0.4441525, 1, 0, 0.5215687, 1,
1.421982, -0.3895339, 0.008206767, 1, 0, 0.5176471, 1,
1.423795, 0.2962709, 1.13373, 1, 0, 0.509804, 1,
1.439076, -1.340418, 0.700936, 1, 0, 0.5058824, 1,
1.452368, -1.006641, 2.891754, 1, 0, 0.4980392, 1,
1.45287, -1.162251, 1.47288, 1, 0, 0.4901961, 1,
1.455284, -2.023821, 4.532605, 1, 0, 0.4862745, 1,
1.471916, 0.7050978, 0.8365293, 1, 0, 0.4784314, 1,
1.486401, -2.126009, 4.710207, 1, 0, 0.4745098, 1,
1.497478, -0.4407882, 3.332328, 1, 0, 0.4666667, 1,
1.502418, -0.2362871, 1.433108, 1, 0, 0.4627451, 1,
1.513898, -1.314617, 2.958076, 1, 0, 0.454902, 1,
1.522652, 0.8283699, 2.16525, 1, 0, 0.4509804, 1,
1.530409, -1.04638, 2.310049, 1, 0, 0.4431373, 1,
1.530663, 0.1603907, 2.228186, 1, 0, 0.4392157, 1,
1.549437, -1.589933, 2.354453, 1, 0, 0.4313726, 1,
1.55738, 0.4188986, 2.189962, 1, 0, 0.427451, 1,
1.558042, 0.01418009, 2.767092, 1, 0, 0.4196078, 1,
1.561742, -1.706195, 2.3251, 1, 0, 0.4156863, 1,
1.566116, 1.748039, 3.293204, 1, 0, 0.4078431, 1,
1.577752, -1.283485, 0.3274899, 1, 0, 0.4039216, 1,
1.578521, 0.2920372, 1.491166, 1, 0, 0.3960784, 1,
1.586176, 1.750922, -1.025236, 1, 0, 0.3882353, 1,
1.587009, -0.2348729, 3.016571, 1, 0, 0.3843137, 1,
1.597231, 0.7414046, 2.355895, 1, 0, 0.3764706, 1,
1.599901, 1.57643, 0.2652847, 1, 0, 0.372549, 1,
1.610717, -1.225583, 2.019591, 1, 0, 0.3647059, 1,
1.614265, 1.187075, 0.5776087, 1, 0, 0.3607843, 1,
1.614848, -0.7112594, 1.776886, 1, 0, 0.3529412, 1,
1.617946, -0.3754865, 1.780824, 1, 0, 0.3490196, 1,
1.621742, -0.131953, 1.641823, 1, 0, 0.3411765, 1,
1.62796, 0.6981638, 1.662683, 1, 0, 0.3372549, 1,
1.629401, -1.873162, 2.849895, 1, 0, 0.3294118, 1,
1.63029, 1.797143, 1.085288, 1, 0, 0.3254902, 1,
1.635761, -0.3597997, 1.460134, 1, 0, 0.3176471, 1,
1.639483, 1.255689, 1.107728, 1, 0, 0.3137255, 1,
1.643876, -0.160371, 1.492562, 1, 0, 0.3058824, 1,
1.660094, -1.540598, 1.81728, 1, 0, 0.2980392, 1,
1.66545, -0.2407793, 0.00862221, 1, 0, 0.2941177, 1,
1.667175, 0.4063754, 1.052403, 1, 0, 0.2862745, 1,
1.707051, 1.096218, 1.224867, 1, 0, 0.282353, 1,
1.707475, -0.7083606, 0.7964031, 1, 0, 0.2745098, 1,
1.724802, 0.1231415, -0.9968585, 1, 0, 0.2705882, 1,
1.72515, 0.1217673, 1.772476, 1, 0, 0.2627451, 1,
1.73379, 0.09774496, 3.342051, 1, 0, 0.2588235, 1,
1.791797, 0.3135299, -0.02434741, 1, 0, 0.2509804, 1,
1.800189, 1.474042, 2.012525, 1, 0, 0.2470588, 1,
1.803115, -0.7171451, 1.755915, 1, 0, 0.2392157, 1,
1.814828, 0.6232869, 0.06941967, 1, 0, 0.2352941, 1,
1.88238, -0.08071354, 3.436535, 1, 0, 0.227451, 1,
1.888739, -0.530999, 1.053359, 1, 0, 0.2235294, 1,
1.889725, 1.833067, 1.506758, 1, 0, 0.2156863, 1,
1.893329, -0.1870316, -0.05452621, 1, 0, 0.2117647, 1,
1.909944, -1.162942, 2.549347, 1, 0, 0.2039216, 1,
1.916409, -0.7823168, 0.8056656, 1, 0, 0.1960784, 1,
1.939653, 0.4114695, -0.02510586, 1, 0, 0.1921569, 1,
1.958338, 0.6579473, 0.4841023, 1, 0, 0.1843137, 1,
1.963486, -1.261759, 3.767689, 1, 0, 0.1803922, 1,
2.007263, -0.1802015, 1.18898, 1, 0, 0.172549, 1,
2.01435, -0.1644307, 0.4003365, 1, 0, 0.1686275, 1,
2.021243, -1.221609, 2.868145, 1, 0, 0.1607843, 1,
2.037856, 2.036172, 0.9428163, 1, 0, 0.1568628, 1,
2.052838, 1.463628, 1.36076, 1, 0, 0.1490196, 1,
2.065351, 0.6167263, 2.206855, 1, 0, 0.145098, 1,
2.073167, -0.2708352, 2.600744, 1, 0, 0.1372549, 1,
2.133528, -0.8454027, 0.7658468, 1, 0, 0.1333333, 1,
2.138512, -0.2834184, 0.2585249, 1, 0, 0.1254902, 1,
2.164527, 0.9715901, 0.5045909, 1, 0, 0.1215686, 1,
2.181742, -0.8304549, 2.910882, 1, 0, 0.1137255, 1,
2.188665, 1.331142, 0.2491859, 1, 0, 0.1098039, 1,
2.256964, -0.773034, 2.210158, 1, 0, 0.1019608, 1,
2.347666, 1.069885, 0.2412707, 1, 0, 0.09411765, 1,
2.409441, 0.7260495, 1.201048, 1, 0, 0.09019608, 1,
2.436827, -0.4350574, 3.088891, 1, 0, 0.08235294, 1,
2.508435, 0.1165009, 0.1551695, 1, 0, 0.07843138, 1,
2.525397, 0.3470349, 0.4155483, 1, 0, 0.07058824, 1,
2.57868, -1.964967, 2.98616, 1, 0, 0.06666667, 1,
2.606416, 2.416438, 0.551042, 1, 0, 0.05882353, 1,
2.616366, -2.096079, 0.9181479, 1, 0, 0.05490196, 1,
2.790398, 1.956378, 1.889109, 1, 0, 0.04705882, 1,
2.926353, -0.4147626, 1.125029, 1, 0, 0.04313726, 1,
3.025425, -0.9159246, 2.36461, 1, 0, 0.03529412, 1,
3.066872, 0.6858111, 1.209586, 1, 0, 0.03137255, 1,
3.299473, 2.313988, -0.6952244, 1, 0, 0.02352941, 1,
3.321775, -0.9291674, 0.7325071, 1, 0, 0.01960784, 1,
3.456093, -0.9059993, 0.8179162, 1, 0, 0.01176471, 1,
3.77142, 0.8676252, 1.600366, 1, 0, 0.007843138, 1
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
0.2576768, -4.127779, -7.379842, 0, -0.5, 0.5, 0.5,
0.2576768, -4.127779, -7.379842, 1, -0.5, 0.5, 0.5,
0.2576768, -4.127779, -7.379842, 1, 1.5, 0.5, 0.5,
0.2576768, -4.127779, -7.379842, 0, 1.5, 0.5, 0.5
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
-4.447226, 0.03675282, -7.379842, 0, -0.5, 0.5, 0.5,
-4.447226, 0.03675282, -7.379842, 1, -0.5, 0.5, 0.5,
-4.447226, 0.03675282, -7.379842, 1, 1.5, 0.5, 0.5,
-4.447226, 0.03675282, -7.379842, 0, 1.5, 0.5, 0.5
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
-4.447226, -4.127779, 0.04282522, 0, -0.5, 0.5, 0.5,
-4.447226, -4.127779, 0.04282522, 1, -0.5, 0.5, 0.5,
-4.447226, -4.127779, 0.04282522, 1, 1.5, 0.5, 0.5,
-4.447226, -4.127779, 0.04282522, 0, 1.5, 0.5, 0.5
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
-2, -3.166733, -5.666919,
2, -3.166733, -5.666919,
-2, -3.166733, -5.666919,
-2, -3.326907, -5.952406,
0, -3.166733, -5.666919,
0, -3.326907, -5.952406,
2, -3.166733, -5.666919,
2, -3.326907, -5.952406
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
-2, -3.647256, -6.52338, 0, -0.5, 0.5, 0.5,
-2, -3.647256, -6.52338, 1, -0.5, 0.5, 0.5,
-2, -3.647256, -6.52338, 1, 1.5, 0.5, 0.5,
-2, -3.647256, -6.52338, 0, 1.5, 0.5, 0.5,
0, -3.647256, -6.52338, 0, -0.5, 0.5, 0.5,
0, -3.647256, -6.52338, 1, -0.5, 0.5, 0.5,
0, -3.647256, -6.52338, 1, 1.5, 0.5, 0.5,
0, -3.647256, -6.52338, 0, 1.5, 0.5, 0.5,
2, -3.647256, -6.52338, 0, -0.5, 0.5, 0.5,
2, -3.647256, -6.52338, 1, -0.5, 0.5, 0.5,
2, -3.647256, -6.52338, 1, 1.5, 0.5, 0.5,
2, -3.647256, -6.52338, 0, 1.5, 0.5, 0.5
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
-3.361479, -3, -5.666919,
-3.361479, 3, -5.666919,
-3.361479, -3, -5.666919,
-3.542437, -3, -5.952406,
-3.361479, -2, -5.666919,
-3.542437, -2, -5.952406,
-3.361479, -1, -5.666919,
-3.542437, -1, -5.952406,
-3.361479, 0, -5.666919,
-3.542437, 0, -5.952406,
-3.361479, 1, -5.666919,
-3.542437, 1, -5.952406,
-3.361479, 2, -5.666919,
-3.542437, 2, -5.952406,
-3.361479, 3, -5.666919,
-3.542437, 3, -5.952406
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
-3.904352, -3, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, -3, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, -3, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, -3, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, -2, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, -2, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, -2, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, -2, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, -1, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, -1, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, -1, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, -1, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, 0, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, 0, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, 0, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, 0, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, 1, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, 1, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, 1, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, 1, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, 2, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, 2, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, 2, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, 2, -6.52338, 0, 1.5, 0.5, 0.5,
-3.904352, 3, -6.52338, 0, -0.5, 0.5, 0.5,
-3.904352, 3, -6.52338, 1, -0.5, 0.5, 0.5,
-3.904352, 3, -6.52338, 1, 1.5, 0.5, 0.5,
-3.904352, 3, -6.52338, 0, 1.5, 0.5, 0.5
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
-3.361479, -3.166733, -4,
-3.361479, -3.166733, 4,
-3.361479, -3.166733, -4,
-3.542437, -3.326907, -4,
-3.361479, -3.166733, -2,
-3.542437, -3.326907, -2,
-3.361479, -3.166733, 0,
-3.542437, -3.326907, 0,
-3.361479, -3.166733, 2,
-3.542437, -3.326907, 2,
-3.361479, -3.166733, 4,
-3.542437, -3.326907, 4
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
-3.904352, -3.647256, -4, 0, -0.5, 0.5, 0.5,
-3.904352, -3.647256, -4, 1, -0.5, 0.5, 0.5,
-3.904352, -3.647256, -4, 1, 1.5, 0.5, 0.5,
-3.904352, -3.647256, -4, 0, 1.5, 0.5, 0.5,
-3.904352, -3.647256, -2, 0, -0.5, 0.5, 0.5,
-3.904352, -3.647256, -2, 1, -0.5, 0.5, 0.5,
-3.904352, -3.647256, -2, 1, 1.5, 0.5, 0.5,
-3.904352, -3.647256, -2, 0, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 0, 0, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 0, 1, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 0, 1, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 0, 0, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 2, 0, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 2, 1, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 2, 1, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 2, 0, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 4, 0, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 4, 1, -0.5, 0.5, 0.5,
-3.904352, -3.647256, 4, 1, 1.5, 0.5, 0.5,
-3.904352, -3.647256, 4, 0, 1.5, 0.5, 0.5
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
-3.361479, -3.166733, -5.666919,
-3.361479, 3.240238, -5.666919,
-3.361479, -3.166733, 5.752569,
-3.361479, 3.240238, 5.752569,
-3.361479, -3.166733, -5.666919,
-3.361479, -3.166733, 5.752569,
-3.361479, 3.240238, -5.666919,
-3.361479, 3.240238, 5.752569,
-3.361479, -3.166733, -5.666919,
3.876832, -3.166733, -5.666919,
-3.361479, -3.166733, 5.752569,
3.876832, -3.166733, 5.752569,
-3.361479, 3.240238, -5.666919,
3.876832, 3.240238, -5.666919,
-3.361479, 3.240238, 5.752569,
3.876832, 3.240238, 5.752569,
3.876832, -3.166733, -5.666919,
3.876832, 3.240238, -5.666919,
3.876832, -3.166733, 5.752569,
3.876832, 3.240238, 5.752569,
3.876832, -3.166733, -5.666919,
3.876832, -3.166733, 5.752569,
3.876832, 3.240238, -5.666919,
3.876832, 3.240238, 5.752569
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
var radius = 7.989162;
var distance = 35.54469;
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
mvMatrix.translate( -0.2576768, -0.03675282, -0.04282522 );
mvMatrix.scale( 1.193378, 1.348225, 0.7564296 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54469);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Aminoethoxyvinylglyc<-read.table("Aminoethoxyvinylglyc.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Aminoethoxyvinylglyc$V2
```

```
## Error in eval(expr, envir, enclos): object 'Aminoethoxyvinylglyc' not found
```

```r
y<-Aminoethoxyvinylglyc$V3
```

```
## Error in eval(expr, envir, enclos): object 'Aminoethoxyvinylglyc' not found
```

```r
z<-Aminoethoxyvinylglyc$V4
```

```
## Error in eval(expr, envir, enclos): object 'Aminoethoxyvinylglyc' not found
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
-3.256067, -1.890891, -4.06813, 0, 0, 1, 1, 1,
-3.003314, -1.02895, -2.321651, 1, 0, 0, 1, 1,
-2.751367, 0.6565957, -1.151756, 1, 0, 0, 1, 1,
-2.706221, 0.140127, -1.381216, 1, 0, 0, 1, 1,
-2.57742, 0.4398661, -2.04491, 1, 0, 0, 1, 1,
-2.566926, -0.3369175, -2.301491, 1, 0, 0, 1, 1,
-2.543846, -0.7099174, -1.262673, 0, 0, 0, 1, 1,
-2.528443, -0.2184888, -3.225314, 0, 0, 0, 1, 1,
-2.515186, 2.312483, -0.5274571, 0, 0, 0, 1, 1,
-2.449249, -0.2374166, -2.307852, 0, 0, 0, 1, 1,
-2.399508, 0.05278, -1.473059, 0, 0, 0, 1, 1,
-2.358797, -0.6405534, -2.70232, 0, 0, 0, 1, 1,
-2.315595, 0.8220508, -0.04997644, 0, 0, 0, 1, 1,
-2.313196, 1.016571, -2.092258, 1, 1, 1, 1, 1,
-2.261278, -1.012769, -1.840445, 1, 1, 1, 1, 1,
-2.202169, 0.1212387, -1.666091, 1, 1, 1, 1, 1,
-2.176707, 0.4663463, -1.602625, 1, 1, 1, 1, 1,
-2.16372, 0.2486375, -0.9979596, 1, 1, 1, 1, 1,
-2.153056, 0.5427865, -2.374804, 1, 1, 1, 1, 1,
-2.104517, 2.169133, -2.60901, 1, 1, 1, 1, 1,
-2.086933, -0.4533815, -1.501378, 1, 1, 1, 1, 1,
-2.084396, -0.3206018, -1.077376, 1, 1, 1, 1, 1,
-2.03127, -0.3649742, -2.009094, 1, 1, 1, 1, 1,
-2.027978, -0.5967643, -0.7254405, 1, 1, 1, 1, 1,
-2.00082, 2.584357, -0.4678719, 1, 1, 1, 1, 1,
-1.993642, -1.830579, -3.211291, 1, 1, 1, 1, 1,
-1.989931, 2.006588, -0.09997527, 1, 1, 1, 1, 1,
-1.985964, -1.684194, -2.778853, 1, 1, 1, 1, 1,
-1.984124, 1.148672, -0.5897154, 0, 0, 1, 1, 1,
-1.953957, -2.041385, -2.291155, 1, 0, 0, 1, 1,
-1.941799, -1.314543, -2.268908, 1, 0, 0, 1, 1,
-1.924806, 0.3805252, -2.82008, 1, 0, 0, 1, 1,
-1.914061, -0.4448715, -2.003312, 1, 0, 0, 1, 1,
-1.906611, -0.4700849, -2.320998, 1, 0, 0, 1, 1,
-1.897333, 0.04126743, -1.30933, 0, 0, 0, 1, 1,
-1.892622, 0.4709686, -2.335736, 0, 0, 0, 1, 1,
-1.885826, -0.90901, -1.446964, 0, 0, 0, 1, 1,
-1.854965, -0.4095282, -1.910689, 0, 0, 0, 1, 1,
-1.85483, 0.2692675, -2.131111, 0, 0, 0, 1, 1,
-1.847654, -1.599641, -2.374239, 0, 0, 0, 1, 1,
-1.840577, 0.2677121, -0.722637, 0, 0, 0, 1, 1,
-1.824149, 0.2850262, -2.373546, 1, 1, 1, 1, 1,
-1.816248, -0.1904739, -0.2647819, 1, 1, 1, 1, 1,
-1.808511, -0.1977234, -0.3362718, 1, 1, 1, 1, 1,
-1.766971, -0.3272413, -2.293518, 1, 1, 1, 1, 1,
-1.754858, 0.8467335, -0.9826467, 1, 1, 1, 1, 1,
-1.747868, 0.5405111, -1.432279, 1, 1, 1, 1, 1,
-1.721046, 0.5559492, -1.983403, 1, 1, 1, 1, 1,
-1.715885, -0.4639185, -2.229731, 1, 1, 1, 1, 1,
-1.712583, -1.363381, -1.59674, 1, 1, 1, 1, 1,
-1.648124, -1.570375, -1.905263, 1, 1, 1, 1, 1,
-1.638664, 1.058114, -1.686136, 1, 1, 1, 1, 1,
-1.615798, 0.1374276, -1.099277, 1, 1, 1, 1, 1,
-1.599622, 0.3679153, -0.508544, 1, 1, 1, 1, 1,
-1.580485, -0.01689725, -2.480627, 1, 1, 1, 1, 1,
-1.577085, 0.3678512, -2.824958, 1, 1, 1, 1, 1,
-1.576003, 0.1562021, -1.537525, 0, 0, 1, 1, 1,
-1.557034, -0.1254421, -0.810991, 1, 0, 0, 1, 1,
-1.551935, 1.141788, -1.608778, 1, 0, 0, 1, 1,
-1.549961, 1.182529, -2.055576, 1, 0, 0, 1, 1,
-1.542642, -1.143023, -2.395921, 1, 0, 0, 1, 1,
-1.54001, 0.371547, -1.844161, 1, 0, 0, 1, 1,
-1.538188, -0.1194154, 0.05125824, 0, 0, 0, 1, 1,
-1.521199, -0.1329204, -1.020976, 0, 0, 0, 1, 1,
-1.510477, 2.044614, -1.088878, 0, 0, 0, 1, 1,
-1.478414, -1.267886, -2.962737, 0, 0, 0, 1, 1,
-1.445426, -0.5364281, -1.537357, 0, 0, 0, 1, 1,
-1.443147, 0.4144089, -0.2522732, 0, 0, 0, 1, 1,
-1.434753, -0.5272867, -3.335497, 0, 0, 0, 1, 1,
-1.429704, 0.03197622, -2.731909, 1, 1, 1, 1, 1,
-1.426666, -1.808686, -0.2468255, 1, 1, 1, 1, 1,
-1.408561, -1.127721, -1.247293, 1, 1, 1, 1, 1,
-1.405264, 0.1516874, -1.893512, 1, 1, 1, 1, 1,
-1.404113, -0.6231627, -1.442783, 1, 1, 1, 1, 1,
-1.402496, -1.036872, -3.683419, 1, 1, 1, 1, 1,
-1.395659, -0.8903559, -1.740657, 1, 1, 1, 1, 1,
-1.395462, -0.2763025, -2.657593, 1, 1, 1, 1, 1,
-1.386762, 0.8707631, -2.67297, 1, 1, 1, 1, 1,
-1.382424, -0.5737835, -1.456059, 1, 1, 1, 1, 1,
-1.374279, -0.3383217, -2.519102, 1, 1, 1, 1, 1,
-1.373566, 1.00612, -0.7874282, 1, 1, 1, 1, 1,
-1.366805, 1.087649, -0.5154679, 1, 1, 1, 1, 1,
-1.364511, -1.761787, -2.860622, 1, 1, 1, 1, 1,
-1.354259, -1.459667, -1.656641, 1, 1, 1, 1, 1,
-1.351363, 2.513078, 0.5991057, 0, 0, 1, 1, 1,
-1.350498, 1.617042, -1.265839, 1, 0, 0, 1, 1,
-1.340274, -0.1151868, -2.896568, 1, 0, 0, 1, 1,
-1.314964, 0.01450111, -1.858001, 1, 0, 0, 1, 1,
-1.305194, -0.258035, -2.055994, 1, 0, 0, 1, 1,
-1.297435, 0.6451876, 0.5389189, 1, 0, 0, 1, 1,
-1.289347, -1.194355, -0.208624, 0, 0, 0, 1, 1,
-1.281656, 1.526686, 0.3831038, 0, 0, 0, 1, 1,
-1.280449, -0.03272809, -0.4172707, 0, 0, 0, 1, 1,
-1.276409, -0.9675571, -3.789388, 0, 0, 0, 1, 1,
-1.275232, 0.01641303, -2.486464, 0, 0, 0, 1, 1,
-1.269954, -0.2010206, -3.104376, 0, 0, 0, 1, 1,
-1.266668, 0.1721367, 0.5276402, 0, 0, 0, 1, 1,
-1.260175, -0.3544658, -1.637867, 1, 1, 1, 1, 1,
-1.258802, -0.4299746, -1.786193, 1, 1, 1, 1, 1,
-1.256172, -0.3642254, -2.736352, 1, 1, 1, 1, 1,
-1.25568, 1.404804, -2.483686, 1, 1, 1, 1, 1,
-1.248131, -1.219419, -3.636562, 1, 1, 1, 1, 1,
-1.247423, 0.5352206, 0.9709368, 1, 1, 1, 1, 1,
-1.240291, -1.312161, -3.006503, 1, 1, 1, 1, 1,
-1.23532, -0.4457083, -2.350427, 1, 1, 1, 1, 1,
-1.225409, 0.5355058, -0.539587, 1, 1, 1, 1, 1,
-1.207925, -0.4787443, -1.678306, 1, 1, 1, 1, 1,
-1.206284, -0.6773682, -1.427795, 1, 1, 1, 1, 1,
-1.204697, 0.2504898, 0.3502988, 1, 1, 1, 1, 1,
-1.195126, -2.082703, -2.542096, 1, 1, 1, 1, 1,
-1.190833, -0.1103784, 0.3489256, 1, 1, 1, 1, 1,
-1.186602, 0.9139598, 2.449424, 1, 1, 1, 1, 1,
-1.186019, -0.8729824, -3.028905, 0, 0, 1, 1, 1,
-1.184908, 0.1225833, -2.256954, 1, 0, 0, 1, 1,
-1.182161, 0.617195, -0.08294847, 1, 0, 0, 1, 1,
-1.18166, -0.3584847, -1.400813, 1, 0, 0, 1, 1,
-1.175367, 0.02963175, -2.328438, 1, 0, 0, 1, 1,
-1.169978, -2.476277, -1.780957, 1, 0, 0, 1, 1,
-1.168551, 0.8017014, -1.697373, 0, 0, 0, 1, 1,
-1.167792, 0.4174322, -0.06304819, 0, 0, 0, 1, 1,
-1.167583, 0.1983604, -1.934699, 0, 0, 0, 1, 1,
-1.165415, -0.6814327, -2.707803, 0, 0, 0, 1, 1,
-1.162476, 0.04604099, -1.153963, 0, 0, 0, 1, 1,
-1.154395, 1.706366, -0.9202157, 0, 0, 0, 1, 1,
-1.132827, 0.3930439, -2.08233, 0, 0, 0, 1, 1,
-1.131624, -1.221491, -3.195387, 1, 1, 1, 1, 1,
-1.115784, -0.06014114, -2.229375, 1, 1, 1, 1, 1,
-1.114184, -0.7915196, -1.667516, 1, 1, 1, 1, 1,
-1.110806, -0.2682318, -1.93083, 1, 1, 1, 1, 1,
-1.105028, 0.08646017, 0.06496359, 1, 1, 1, 1, 1,
-1.101063, 0.03153001, -0.3138707, 1, 1, 1, 1, 1,
-1.084329, -0.4254113, -2.147421, 1, 1, 1, 1, 1,
-1.08362, -0.8349662, -2.238986, 1, 1, 1, 1, 1,
-1.083598, -1.375277, -1.622446, 1, 1, 1, 1, 1,
-1.079658, -0.2995775, -2.077113, 1, 1, 1, 1, 1,
-1.077806, 0.2746304, -2.484715, 1, 1, 1, 1, 1,
-1.07708, 0.7352078, -1.914274, 1, 1, 1, 1, 1,
-1.073591, -0.05561596, 0.2721155, 1, 1, 1, 1, 1,
-1.06516, 0.5880261, -2.848675, 1, 1, 1, 1, 1,
-1.061835, -0.6215669, -2.032907, 1, 1, 1, 1, 1,
-1.061227, -0.2674071, -1.895561, 0, 0, 1, 1, 1,
-1.050652, -0.375313, -2.825762, 1, 0, 0, 1, 1,
-1.050505, -0.9489939, -1.874529, 1, 0, 0, 1, 1,
-1.0498, -1.192691, -2.434062, 1, 0, 0, 1, 1,
-1.032724, -1.243161, -4.779636, 1, 0, 0, 1, 1,
-1.030171, -1.390936, -3.106308, 1, 0, 0, 1, 1,
-1.030098, -0.3938206, -2.071772, 0, 0, 0, 1, 1,
-1.029701, 0.4645779, -1.467987, 0, 0, 0, 1, 1,
-1.020741, -0.6853005, -1.594406, 0, 0, 0, 1, 1,
-1.01568, -0.6242998, -2.852944, 0, 0, 0, 1, 1,
-1.006811, -2.890805, -2.556432, 0, 0, 0, 1, 1,
-1.002487, 0.999532, -1.432309, 0, 0, 0, 1, 1,
-1.001997, -1.419989, -1.962741, 0, 0, 0, 1, 1,
-1.000429, 2.027112, 0.105191, 1, 1, 1, 1, 1,
-0.9967216, 1.177028, -1.652531, 1, 1, 1, 1, 1,
-0.9910192, -0.9811298, -1.993439, 1, 1, 1, 1, 1,
-0.9887241, 0.01324309, -2.967021, 1, 1, 1, 1, 1,
-0.9837292, -0.2131881, -0.8269945, 1, 1, 1, 1, 1,
-0.9706149, 2.212886, -1.123196, 1, 1, 1, 1, 1,
-0.9671806, 0.07247818, -1.538735, 1, 1, 1, 1, 1,
-0.963515, -0.5230629, -2.259401, 1, 1, 1, 1, 1,
-0.9539753, 0.854668, -2.107649, 1, 1, 1, 1, 1,
-0.9539403, 1.881896, 0.05491494, 1, 1, 1, 1, 1,
-0.9488406, -0.8695074, -2.710664, 1, 1, 1, 1, 1,
-0.947175, -0.7926771, -2.917367, 1, 1, 1, 1, 1,
-0.9450473, 0.1139862, -1.759948, 1, 1, 1, 1, 1,
-0.9356757, -0.3557656, -2.005533, 1, 1, 1, 1, 1,
-0.9337789, -0.1322178, -2.820738, 1, 1, 1, 1, 1,
-0.9331915, 0.05343089, -0.8710493, 0, 0, 1, 1, 1,
-0.9293293, 1.279211, -0.5886311, 1, 0, 0, 1, 1,
-0.9111564, 0.1162504, -1.222136, 1, 0, 0, 1, 1,
-0.9042877, 1.176931, -2.356209, 1, 0, 0, 1, 1,
-0.900944, 0.1888005, -1.822958, 1, 0, 0, 1, 1,
-0.8987762, -0.4812775, -1.833459, 1, 0, 0, 1, 1,
-0.8951067, -0.6341301, -2.285295, 0, 0, 0, 1, 1,
-0.8947391, -0.3559442, -3.586846, 0, 0, 0, 1, 1,
-0.8914236, 1.243715, -1.179877, 0, 0, 0, 1, 1,
-0.8888944, -1.822034, -1.73343, 0, 0, 0, 1, 1,
-0.8867744, -0.03655866, -2.459241, 0, 0, 0, 1, 1,
-0.8796161, 0.247811, -0.6662637, 0, 0, 0, 1, 1,
-0.8769554, -1.535595, -1.927717, 0, 0, 0, 1, 1,
-0.8757831, 2.326494, -0.6724336, 1, 1, 1, 1, 1,
-0.8741373, 0.5412809, -0.2547451, 1, 1, 1, 1, 1,
-0.8598959, 0.7542015, -1.490379, 1, 1, 1, 1, 1,
-0.8590695, 0.6536692, -1.278674, 1, 1, 1, 1, 1,
-0.8580006, 0.9678602, -0.008493897, 1, 1, 1, 1, 1,
-0.8560014, -0.2920848, -2.116321, 1, 1, 1, 1, 1,
-0.8508455, 2.51989, -1.392069, 1, 1, 1, 1, 1,
-0.8499213, 1.724831, 0.2027795, 1, 1, 1, 1, 1,
-0.8475156, 0.03337756, -2.274112, 1, 1, 1, 1, 1,
-0.8460998, 0.04366066, -1.415926, 1, 1, 1, 1, 1,
-0.8284311, -0.04108254, -1.282006, 1, 1, 1, 1, 1,
-0.8269772, -1.188975, -0.5354393, 1, 1, 1, 1, 1,
-0.8268419, 0.4318206, -0.06992389, 1, 1, 1, 1, 1,
-0.8257012, -0.9153849, -0.693829, 1, 1, 1, 1, 1,
-0.8236071, -0.4873067, -2.003733, 1, 1, 1, 1, 1,
-0.8162227, -0.610931, -2.502038, 0, 0, 1, 1, 1,
-0.8141673, 1.5113, -0.04551164, 1, 0, 0, 1, 1,
-0.8123938, 0.959096, -1.094165, 1, 0, 0, 1, 1,
-0.8115359, 1.236962, -0.9641582, 1, 0, 0, 1, 1,
-0.8085892, -1.531681, -2.396887, 1, 0, 0, 1, 1,
-0.8082561, -1.053571, -2.146714, 1, 0, 0, 1, 1,
-0.8071858, -2.150601, -2.269038, 0, 0, 0, 1, 1,
-0.806879, -0.6942516, -2.938603, 0, 0, 0, 1, 1,
-0.804193, -0.3551783, -1.363852, 0, 0, 0, 1, 1,
-0.8000074, -0.9865328, -2.080176, 0, 0, 0, 1, 1,
-0.7977139, 0.9914804, 0.3627788, 0, 0, 0, 1, 1,
-0.792741, 0.3099209, -1.361466, 0, 0, 0, 1, 1,
-0.7847351, -0.7700079, -0.9959995, 0, 0, 0, 1, 1,
-0.7824975, -0.7162717, -3.762619, 1, 1, 1, 1, 1,
-0.7813064, 1.291078, 0.6678389, 1, 1, 1, 1, 1,
-0.7776108, 0.3499467, -1.048178, 1, 1, 1, 1, 1,
-0.7772003, 0.6035836, -0.9395241, 1, 1, 1, 1, 1,
-0.7681632, -0.3464126, -3.609853, 1, 1, 1, 1, 1,
-0.7659196, -0.7033315, -2.522965, 1, 1, 1, 1, 1,
-0.761517, -0.1813609, -2.153829, 1, 1, 1, 1, 1,
-0.7614712, -1.657967, -2.225326, 1, 1, 1, 1, 1,
-0.7577065, 1.796951, 1.105961, 1, 1, 1, 1, 1,
-0.756775, 0.1375011, -1.441836, 1, 1, 1, 1, 1,
-0.7543138, -0.1358563, -1.227878, 1, 1, 1, 1, 1,
-0.7521375, 1.383393, 0.08780103, 1, 1, 1, 1, 1,
-0.7487676, 0.1796092, -2.185609, 1, 1, 1, 1, 1,
-0.7487515, -0.6299514, -3.579251, 1, 1, 1, 1, 1,
-0.7478082, -1.095578, -1.928705, 1, 1, 1, 1, 1,
-0.7476105, -0.1591589, -0.7387332, 0, 0, 1, 1, 1,
-0.7452392, -0.2171159, -1.355564, 1, 0, 0, 1, 1,
-0.7438122, -0.1685427, -1.786596, 1, 0, 0, 1, 1,
-0.743003, -0.5883051, -2.040832, 1, 0, 0, 1, 1,
-0.7403914, 0.2750803, -0.06063023, 1, 0, 0, 1, 1,
-0.7367146, -0.171622, -3.045501, 1, 0, 0, 1, 1,
-0.7359141, 0.2522419, -2.189147, 0, 0, 0, 1, 1,
-0.7304437, 0.6219453, -1.681111, 0, 0, 0, 1, 1,
-0.730293, -2.015433, -4.737572, 0, 0, 0, 1, 1,
-0.7268084, -0.1514125, -1.488093, 0, 0, 0, 1, 1,
-0.7217321, 0.9454467, -0.8416625, 0, 0, 0, 1, 1,
-0.7212692, 0.6723541, -2.716953, 0, 0, 0, 1, 1,
-0.7197807, -1.305357, -3.750867, 0, 0, 0, 1, 1,
-0.7155007, 0.2831666, -1.117376, 1, 1, 1, 1, 1,
-0.713632, -1.244444, -2.730331, 1, 1, 1, 1, 1,
-0.7134002, 0.4075048, -1.076389, 1, 1, 1, 1, 1,
-0.7062874, 1.742269, -0.2954642, 1, 1, 1, 1, 1,
-0.7028735, 0.764949, -0.7040234, 1, 1, 1, 1, 1,
-0.6990986, -0.9000474, -2.134868, 1, 1, 1, 1, 1,
-0.6984209, 0.06619749, -1.662172, 1, 1, 1, 1, 1,
-0.6960865, 1.752709, 0.8542244, 1, 1, 1, 1, 1,
-0.6896899, -0.2320089, -1.320446, 1, 1, 1, 1, 1,
-0.6836691, -1.877636, -2.303904, 1, 1, 1, 1, 1,
-0.6739519, -0.7236021, -3.224051, 1, 1, 1, 1, 1,
-0.6681707, -1.675148, -3.304543, 1, 1, 1, 1, 1,
-0.6674072, 1.136992, -2.12463, 1, 1, 1, 1, 1,
-0.666424, 0.6035261, -2.305129, 1, 1, 1, 1, 1,
-0.65751, 0.3015241, -0.8011215, 1, 1, 1, 1, 1,
-0.6529896, 0.4748325, -1.37484, 0, 0, 1, 1, 1,
-0.6504942, -1.185538, -3.133536, 1, 0, 0, 1, 1,
-0.6488013, 1.627098, -1.780141, 1, 0, 0, 1, 1,
-0.635344, 0.01227245, -1.925184, 1, 0, 0, 1, 1,
-0.6299363, -1.035275, -2.907191, 1, 0, 0, 1, 1,
-0.6271418, -0.4077283, -3.398233, 1, 0, 0, 1, 1,
-0.6257598, -1.695741, -2.875068, 0, 0, 0, 1, 1,
-0.6211715, -0.5095921, -1.169768, 0, 0, 0, 1, 1,
-0.6148089, 1.343317, -1.340147, 0, 0, 0, 1, 1,
-0.6144167, -0.1436332, -1.596666, 0, 0, 0, 1, 1,
-0.613431, -0.282757, -3.003393, 0, 0, 0, 1, 1,
-0.6107486, -1.40777, -1.811245, 0, 0, 0, 1, 1,
-0.6106504, -0.2769931, -2.681399, 0, 0, 0, 1, 1,
-0.6087891, 1.435446, -0.03328005, 1, 1, 1, 1, 1,
-0.6077014, -0.2618056, -2.054971, 1, 1, 1, 1, 1,
-0.606877, 0.6074257, -0.966062, 1, 1, 1, 1, 1,
-0.6038197, -0.2153109, -1.388314, 1, 1, 1, 1, 1,
-0.6031471, -0.3767923, -3.595928, 1, 1, 1, 1, 1,
-0.5981542, 0.1075166, -1.3573, 1, 1, 1, 1, 1,
-0.5951401, -0.2012141, -1.160398, 1, 1, 1, 1, 1,
-0.5897673, 0.9959416, -0.04518221, 1, 1, 1, 1, 1,
-0.5894617, 0.3511097, -2.889051, 1, 1, 1, 1, 1,
-0.5879632, 1.947478, 0.33577, 1, 1, 1, 1, 1,
-0.5869472, 0.1168176, -2.206412, 1, 1, 1, 1, 1,
-0.5849714, -0.7658517, -3.340458, 1, 1, 1, 1, 1,
-0.5782852, -0.3762204, -1.816484, 1, 1, 1, 1, 1,
-0.5780673, -0.8683763, -3.836322, 1, 1, 1, 1, 1,
-0.5768932, 0.4940363, 0.2899597, 1, 1, 1, 1, 1,
-0.5749857, 0.07853985, -2.044591, 0, 0, 1, 1, 1,
-0.5721111, 0.5282819, -0.6708526, 1, 0, 0, 1, 1,
-0.5713162, -0.9106302, -3.748038, 1, 0, 0, 1, 1,
-0.5668398, -0.1988204, -0.5697531, 1, 0, 0, 1, 1,
-0.5639452, 0.173864, 0.08350555, 1, 0, 0, 1, 1,
-0.5617288, 0.6716968, -1.911468, 1, 0, 0, 1, 1,
-0.558286, -0.3210741, -1.05347, 0, 0, 0, 1, 1,
-0.5568392, 0.8518478, -2.525438, 0, 0, 0, 1, 1,
-0.5472485, 1.157157, 0.05297395, 0, 0, 0, 1, 1,
-0.5468981, 0.6257407, -1.662693, 0, 0, 0, 1, 1,
-0.5401718, -0.3536512, -2.814297, 0, 0, 0, 1, 1,
-0.5385619, 1.019564, -0.9774603, 0, 0, 0, 1, 1,
-0.5363114, 1.133116, 0.972258, 0, 0, 0, 1, 1,
-0.5257043, 2.038921, 1.0004, 1, 1, 1, 1, 1,
-0.5225013, 0.087341, -1.346002, 1, 1, 1, 1, 1,
-0.5160518, -0.007801082, -2.332008, 1, 1, 1, 1, 1,
-0.5155454, 0.9099773, -2.107875, 1, 1, 1, 1, 1,
-0.5136924, -3.073427, -1.96706, 1, 1, 1, 1, 1,
-0.5126639, -1.243133, -3.070961, 1, 1, 1, 1, 1,
-0.5008851, -0.5527796, -1.5667, 1, 1, 1, 1, 1,
-0.4977375, 0.6978372, -1.059282, 1, 1, 1, 1, 1,
-0.4966651, -0.176263, -2.19547, 1, 1, 1, 1, 1,
-0.4955292, 0.4263446, -0.1601028, 1, 1, 1, 1, 1,
-0.4951121, -0.01784366, -1.996803, 1, 1, 1, 1, 1,
-0.493792, 0.3608419, -0.756296, 1, 1, 1, 1, 1,
-0.4932333, -0.1237911, -0.3227982, 1, 1, 1, 1, 1,
-0.492666, 0.5664437, -0.7142601, 1, 1, 1, 1, 1,
-0.4918213, 1.130761, -0.4252366, 1, 1, 1, 1, 1,
-0.4890172, -0.3476595, -1.444391, 0, 0, 1, 1, 1,
-0.4872368, -1.379826, -3.777928, 1, 0, 0, 1, 1,
-0.4832255, -0.784152, -1.469032, 1, 0, 0, 1, 1,
-0.4820372, 1.018377, 0.2744497, 1, 0, 0, 1, 1,
-0.4799148, -0.2881417, -4.434245, 1, 0, 0, 1, 1,
-0.4793347, 0.5372962, 0.3214845, 1, 0, 0, 1, 1,
-0.4763761, 0.5140714, 0.7171591, 0, 0, 0, 1, 1,
-0.4759549, 0.8246304, -1.343117, 0, 0, 0, 1, 1,
-0.4736695, 0.3879309, -1.121624, 0, 0, 0, 1, 1,
-0.4733302, -1.105096, -2.422958, 0, 0, 0, 1, 1,
-0.4678064, 0.4124439, -1.168997, 0, 0, 0, 1, 1,
-0.4636025, -0.7132579, -2.803191, 0, 0, 0, 1, 1,
-0.4618796, 3.146933, -1.425587, 0, 0, 0, 1, 1,
-0.4603516, 0.4359681, -2.054734, 1, 1, 1, 1, 1,
-0.460072, 1.500405, -0.108891, 1, 1, 1, 1, 1,
-0.4592865, 0.2140707, -2.767049, 1, 1, 1, 1, 1,
-0.4549852, 0.1211288, -0.8609464, 1, 1, 1, 1, 1,
-0.4527084, -0.7748311, -2.001257, 1, 1, 1, 1, 1,
-0.449459, -0.9878523, -1.301217, 1, 1, 1, 1, 1,
-0.4459411, 1.713073, -1.311385, 1, 1, 1, 1, 1,
-0.4454672, 0.5845488, 0.462419, 1, 1, 1, 1, 1,
-0.4404187, -0.6902629, -2.798476, 1, 1, 1, 1, 1,
-0.4375288, 0.03077053, -1.195363, 1, 1, 1, 1, 1,
-0.4358892, 0.1267104, -0.2388479, 1, 1, 1, 1, 1,
-0.4347225, -0.2878445, -2.030912, 1, 1, 1, 1, 1,
-0.431249, 0.1883, -2.074048, 1, 1, 1, 1, 1,
-0.4264677, 0.6856476, -0.06687579, 1, 1, 1, 1, 1,
-0.4229688, 0.8760843, -0.4226733, 1, 1, 1, 1, 1,
-0.4226839, -1.744565, -3.560984, 0, 0, 1, 1, 1,
-0.4203438, 2.053437, 0.6084436, 1, 0, 0, 1, 1,
-0.4102634, -0.4461483, -3.57027, 1, 0, 0, 1, 1,
-0.4097876, 1.177056, 0.8486087, 1, 0, 0, 1, 1,
-0.4075955, 0.4544138, -2.510432, 1, 0, 0, 1, 1,
-0.4045706, -0.003918306, -0.6175152, 1, 0, 0, 1, 1,
-0.4032097, -0.8679258, -3.028721, 0, 0, 0, 1, 1,
-0.3991463, -0.264536, -2.824445, 0, 0, 0, 1, 1,
-0.3977923, -1.401508, -2.768217, 0, 0, 0, 1, 1,
-0.397444, 0.3861926, 0.5537243, 0, 0, 0, 1, 1,
-0.3959234, -0.4063403, -2.631031, 0, 0, 0, 1, 1,
-0.3947279, -0.8099582, -2.278416, 0, 0, 0, 1, 1,
-0.3940033, 0.4135781, -0.8277303, 0, 0, 0, 1, 1,
-0.3919828, -1.259505, -3.880569, 1, 1, 1, 1, 1,
-0.3907149, 1.596114, -0.2269544, 1, 1, 1, 1, 1,
-0.3854693, -0.9971122, -2.883563, 1, 1, 1, 1, 1,
-0.3804228, 0.6052132, -0.2385995, 1, 1, 1, 1, 1,
-0.379736, 0.8539065, -0.9793199, 1, 1, 1, 1, 1,
-0.3792109, 0.3304684, -0.5622902, 1, 1, 1, 1, 1,
-0.3784213, -0.2593065, -1.312497, 1, 1, 1, 1, 1,
-0.3704446, -0.5104532, -1.714045, 1, 1, 1, 1, 1,
-0.3691894, -1.073057, -2.599182, 1, 1, 1, 1, 1,
-0.3658494, -1.086072, -2.362049, 1, 1, 1, 1, 1,
-0.363897, 1.085541, 0.07777557, 1, 1, 1, 1, 1,
-0.363249, -0.4729741, -1.311433, 1, 1, 1, 1, 1,
-0.3627073, -0.1357333, -0.8105621, 1, 1, 1, 1, 1,
-0.3499868, 1.569323, 0.04230293, 1, 1, 1, 1, 1,
-0.3452875, 0.8685995, -0.5855096, 1, 1, 1, 1, 1,
-0.3441704, -0.2603693, -2.167196, 0, 0, 1, 1, 1,
-0.340912, 0.3039912, 0.6633106, 1, 0, 0, 1, 1,
-0.3405097, -0.5590438, -2.54195, 1, 0, 0, 1, 1,
-0.3364428, -0.5503216, -2.597711, 1, 0, 0, 1, 1,
-0.3337906, -1.113817, -2.301504, 1, 0, 0, 1, 1,
-0.3302015, -0.5239999, -2.481437, 1, 0, 0, 1, 1,
-0.3265117, -0.2773202, -0.2315917, 0, 0, 0, 1, 1,
-0.322275, -0.5424858, -1.672473, 0, 0, 0, 1, 1,
-0.3168317, 1.106983, 0.743355, 0, 0, 0, 1, 1,
-0.3148766, 0.6007955, 0.2872044, 0, 0, 0, 1, 1,
-0.3143463, 1.239794, -0.6171355, 0, 0, 0, 1, 1,
-0.3125738, 0.6805444, 0.1288452, 0, 0, 0, 1, 1,
-0.3120079, -1.717399, -3.329787, 0, 0, 0, 1, 1,
-0.3088987, 0.2089218, -1.987663, 1, 1, 1, 1, 1,
-0.3077822, -0.2811639, -1.461161, 1, 1, 1, 1, 1,
-0.3068936, -1.495984, -3.780198, 1, 1, 1, 1, 1,
-0.3051292, -0.4275394, -2.281179, 1, 1, 1, 1, 1,
-0.3021217, 0.529965, -1.442267, 1, 1, 1, 1, 1,
-0.2945113, -0.3123237, -3.554283, 1, 1, 1, 1, 1,
-0.2939004, 0.07470211, -2.006821, 1, 1, 1, 1, 1,
-0.2914159, 0.2813586, -0.4790699, 1, 1, 1, 1, 1,
-0.2905128, -0.692689, -0.4750898, 1, 1, 1, 1, 1,
-0.2861087, 0.9071517, 2.006934, 1, 1, 1, 1, 1,
-0.2859836, -1.521648, -3.507093, 1, 1, 1, 1, 1,
-0.2829813, 0.6044588, -0.2076389, 1, 1, 1, 1, 1,
-0.28186, -0.06084134, -2.151269, 1, 1, 1, 1, 1,
-0.2753955, 0.470294, -1.894423, 1, 1, 1, 1, 1,
-0.2739289, -1.20877, -3.267548, 1, 1, 1, 1, 1,
-0.2603405, 0.4745928, -1.296978, 0, 0, 1, 1, 1,
-0.2587388, -0.06462998, -2.982198, 1, 0, 0, 1, 1,
-0.2535182, 1.697134, 0.724593, 1, 0, 0, 1, 1,
-0.2481791, 0.1643136, -0.4476424, 1, 0, 0, 1, 1,
-0.2466227, -0.07007708, -1.774762, 1, 0, 0, 1, 1,
-0.2465188, -0.6683896, -3.310782, 1, 0, 0, 1, 1,
-0.242077, 1.059411, -1.014874, 0, 0, 0, 1, 1,
-0.2376037, -1.669013, -3.653765, 0, 0, 0, 1, 1,
-0.2239842, -0.9888659, -1.893948, 0, 0, 0, 1, 1,
-0.216294, 1.050739, -0.7636034, 0, 0, 0, 1, 1,
-0.2148439, 0.04925724, -2.047217, 0, 0, 0, 1, 1,
-0.2070957, -1.113729, -1.896776, 0, 0, 0, 1, 1,
-0.2033198, 1.484869, -0.5622335, 0, 0, 0, 1, 1,
-0.2004194, 0.9792908, -0.6372247, 1, 1, 1, 1, 1,
-0.1948769, 0.7777806, -0.4380482, 1, 1, 1, 1, 1,
-0.191426, -0.6655046, -1.306257, 1, 1, 1, 1, 1,
-0.1899209, -1.154611, -1.986528, 1, 1, 1, 1, 1,
-0.1894302, -2.269506, -3.132372, 1, 1, 1, 1, 1,
-0.1884622, -0.4644307, -1.494161, 1, 1, 1, 1, 1,
-0.1824341, -0.4243034, -1.916831, 1, 1, 1, 1, 1,
-0.1799615, 1.668797, -2.264989, 1, 1, 1, 1, 1,
-0.176951, -1.408977, -3.202689, 1, 1, 1, 1, 1,
-0.1765414, 1.319872, -0.3155476, 1, 1, 1, 1, 1,
-0.175168, -0.7583286, -3.286422, 1, 1, 1, 1, 1,
-0.1741481, 1.905778, -0.1846404, 1, 1, 1, 1, 1,
-0.1739903, 0.3510351, -0.6714206, 1, 1, 1, 1, 1,
-0.1729601, -0.9246007, -4.260641, 1, 1, 1, 1, 1,
-0.1710046, 1.893505, 0.3379349, 1, 1, 1, 1, 1,
-0.1688845, -0.4584415, -1.655245, 0, 0, 1, 1, 1,
-0.1672779, -0.4294171, -5.303681, 1, 0, 0, 1, 1,
-0.1644052, -0.7829275, -4.247437, 1, 0, 0, 1, 1,
-0.1625074, -0.1170682, -2.225948, 1, 0, 0, 1, 1,
-0.153166, -0.2472148, -2.77707, 1, 0, 0, 1, 1,
-0.1514821, -0.5975394, -1.660634, 1, 0, 0, 1, 1,
-0.1441273, -1.147186, -3.850026, 0, 0, 0, 1, 1,
-0.142528, -0.8356157, -2.981032, 0, 0, 0, 1, 1,
-0.1399457, 0.5735341, -0.1407234, 0, 0, 0, 1, 1,
-0.1377807, 0.2721919, -1.27081, 0, 0, 0, 1, 1,
-0.1371642, -0.7965068, -4.619656, 0, 0, 0, 1, 1,
-0.1344241, 0.3633578, -1.829751, 0, 0, 0, 1, 1,
-0.1338618, 2.87575, -0.5344243, 0, 0, 0, 1, 1,
-0.1338024, -0.2749256, -2.504845, 1, 1, 1, 1, 1,
-0.1319159, -0.9198409, -2.894135, 1, 1, 1, 1, 1,
-0.129752, 1.1314, 0.5993636, 1, 1, 1, 1, 1,
-0.1223038, 0.2880645, -1.580804, 1, 1, 1, 1, 1,
-0.1158686, 0.4107147, -0.02093061, 1, 1, 1, 1, 1,
-0.1146318, 0.0868632, -0.5286012, 1, 1, 1, 1, 1,
-0.1129965, 0.3997402, 0.5126849, 1, 1, 1, 1, 1,
-0.1097882, 1.118448, 0.4726415, 1, 1, 1, 1, 1,
-0.1095957, 1.081036, 0.3197387, 1, 1, 1, 1, 1,
-0.1093779, 0.1726053, -1.252393, 1, 1, 1, 1, 1,
-0.1035887, -0.4755628, -2.601017, 1, 1, 1, 1, 1,
-0.09957232, 0.2591142, -2.27815, 1, 1, 1, 1, 1,
-0.09827233, -1.755771, -4.241366, 1, 1, 1, 1, 1,
-0.09661794, 0.6781629, -0.7352817, 1, 1, 1, 1, 1,
-0.09002455, 1.450362, 2.65696, 1, 1, 1, 1, 1,
-0.08972921, 0.4216963, 0.8252817, 0, 0, 1, 1, 1,
-0.08890826, 1.13395, 1.692545, 1, 0, 0, 1, 1,
-0.08840675, -1.068581, -2.552869, 1, 0, 0, 1, 1,
-0.08810655, 0.9436079, 0.1196517, 1, 0, 0, 1, 1,
-0.08561651, -0.1031519, -1.358925, 1, 0, 0, 1, 1,
-0.08446725, 1.098458, -1.498033, 1, 0, 0, 1, 1,
-0.08404235, -1.441971, -5.298773, 0, 0, 0, 1, 1,
-0.07845785, 0.3873293, -0.4457732, 0, 0, 0, 1, 1,
-0.07811353, -0.9948484, -2.785069, 0, 0, 0, 1, 1,
-0.07762168, -0.3530734, -3.720671, 0, 0, 0, 1, 1,
-0.07738268, 0.06375677, -0.638407, 0, 0, 0, 1, 1,
-0.07703409, 1.226272, 0.07258262, 0, 0, 0, 1, 1,
-0.07035799, -1.134024, -0.4257809, 0, 0, 0, 1, 1,
-0.06662588, 0.7509579, -0.9803213, 1, 1, 1, 1, 1,
-0.06011385, -0.5995613, -3.265467, 1, 1, 1, 1, 1,
-0.05885277, -0.7954059, -4.006089, 1, 1, 1, 1, 1,
-0.05570537, 0.4296592, -0.7424974, 1, 1, 1, 1, 1,
-0.05507794, 1.580048, -1.41008, 1, 1, 1, 1, 1,
-0.05344466, -2.305069, -4.133257, 1, 1, 1, 1, 1,
-0.05282009, -0.6898495, -2.301819, 1, 1, 1, 1, 1,
-0.05012555, -0.4285392, -2.761304, 1, 1, 1, 1, 1,
-0.04601797, 0.8063292, -0.1798474, 1, 1, 1, 1, 1,
-0.04076374, 0.5820778, 0.2119532, 1, 1, 1, 1, 1,
-0.03781397, -1.692984, -2.029913, 1, 1, 1, 1, 1,
-0.03601402, 1.362983, 0.9272125, 1, 1, 1, 1, 1,
-0.03484312, -0.9734169, -3.067706, 1, 1, 1, 1, 1,
-0.03171095, -0.2177579, -5.500616, 1, 1, 1, 1, 1,
-0.03125851, 0.1377267, 1.942707, 1, 1, 1, 1, 1,
-0.02902133, -1.807739, -3.465833, 0, 0, 1, 1, 1,
-0.028154, 0.4740282, -0.9623264, 1, 0, 0, 1, 1,
-0.02684557, -2.195491, -2.814719, 1, 0, 0, 1, 1,
-0.02205476, -0.4636692, -3.116497, 1, 0, 0, 1, 1,
-0.02007648, 0.07746658, -0.8710113, 1, 0, 0, 1, 1,
-0.01470078, -1.004044, -3.726515, 1, 0, 0, 1, 1,
-0.01090484, -0.712461, -4.341187, 0, 0, 0, 1, 1,
-0.009033074, 0.5279, -0.4204671, 0, 0, 0, 1, 1,
-0.001440401, 0.3530278, -0.8283987, 0, 0, 0, 1, 1,
-0.0001530072, -0.3829246, -4.322017, 0, 0, 0, 1, 1,
0.005783396, 1.803602, 0.4958421, 0, 0, 0, 1, 1,
0.007835985, -0.1896099, 4.356721, 0, 0, 0, 1, 1,
0.008291646, 0.3739541, -0.7522772, 0, 0, 0, 1, 1,
0.008458535, -0.605507, 4.780751, 1, 1, 1, 1, 1,
0.009007543, 0.5357054, 0.4994107, 1, 1, 1, 1, 1,
0.009906243, -0.1765553, 2.205398, 1, 1, 1, 1, 1,
0.01205198, -0.6830322, 2.657835, 1, 1, 1, 1, 1,
0.02253733, -0.1704435, 4.305155, 1, 1, 1, 1, 1,
0.02400465, 0.7732394, 0.391353, 1, 1, 1, 1, 1,
0.02411547, 0.8187238, -0.5603213, 1, 1, 1, 1, 1,
0.02740528, 0.2305243, 1.48164, 1, 1, 1, 1, 1,
0.03322581, 1.684795, 1.729025, 1, 1, 1, 1, 1,
0.03732246, -1.370293, 2.060102, 1, 1, 1, 1, 1,
0.04305889, -1.922911, 3.828581, 1, 1, 1, 1, 1,
0.04616353, 1.00965, -0.5391887, 1, 1, 1, 1, 1,
0.04654382, -0.8205706, 5.044312, 1, 1, 1, 1, 1,
0.0474653, -0.6845765, 3.220096, 1, 1, 1, 1, 1,
0.05149823, -1.503654, 1.402086, 1, 1, 1, 1, 1,
0.05290506, 0.7592563, -0.6083927, 0, 0, 1, 1, 1,
0.05556516, 1.043613, 0.6413907, 1, 0, 0, 1, 1,
0.05651131, -0.4045467, 3.739342, 1, 0, 0, 1, 1,
0.05655263, -2.074364, 2.724158, 1, 0, 0, 1, 1,
0.06471568, -0.8474014, 4.594689, 1, 0, 0, 1, 1,
0.06618199, 1.175787, 0.2536786, 1, 0, 0, 1, 1,
0.07530962, 0.3703582, -0.2225335, 0, 0, 0, 1, 1,
0.0764345, -1.149478, 4.869592, 0, 0, 0, 1, 1,
0.08159986, -0.654916, 3.868008, 0, 0, 0, 1, 1,
0.08473257, 0.6557589, 0.4271403, 0, 0, 0, 1, 1,
0.08701473, -1.03692, 1.821561, 0, 0, 0, 1, 1,
0.0875028, 0.222591, 0.7674726, 0, 0, 0, 1, 1,
0.09571221, 0.7104602, 0.6737279, 0, 0, 0, 1, 1,
0.096098, 0.6630854, -0.9552642, 1, 1, 1, 1, 1,
0.09633789, 1.128004, 0.9344426, 1, 1, 1, 1, 1,
0.09694847, 0.4699699, 1.439074, 1, 1, 1, 1, 1,
0.09776422, -0.8103539, 2.94627, 1, 1, 1, 1, 1,
0.09809356, 1.006168, 1.094915, 1, 1, 1, 1, 1,
0.09931987, -0.07440811, 3.843742, 1, 1, 1, 1, 1,
0.09935811, -1.307289, 3.747736, 1, 1, 1, 1, 1,
0.1026687, -1.298965, 2.92511, 1, 1, 1, 1, 1,
0.1054405, 0.2006664, 0.9320988, 1, 1, 1, 1, 1,
0.1073394, -1.959546, 2.757711, 1, 1, 1, 1, 1,
0.1170354, 0.3863328, 0.8084962, 1, 1, 1, 1, 1,
0.1187093, -0.9807613, 3.183948, 1, 1, 1, 1, 1,
0.123311, -1.022615, 5.586266, 1, 1, 1, 1, 1,
0.1241637, 0.7972269, -1.953501, 1, 1, 1, 1, 1,
0.1263125, -1.138202, 3.807456, 1, 1, 1, 1, 1,
0.1313213, 0.6747936, -1.255161, 0, 0, 1, 1, 1,
0.1364519, 1.079387, 0.8549323, 1, 0, 0, 1, 1,
0.1373286, 0.61388, -0.1053042, 1, 0, 0, 1, 1,
0.1388057, -0.4266487, 3.18948, 1, 0, 0, 1, 1,
0.1398788, -0.4412041, 1.8129, 1, 0, 0, 1, 1,
0.1399339, -0.1557643, 2.97712, 1, 0, 0, 1, 1,
0.1462478, -0.8316428, 3.332488, 0, 0, 0, 1, 1,
0.1552857, -0.5753714, 2.564022, 0, 0, 0, 1, 1,
0.155325, 2.30523, -0.1477979, 0, 0, 0, 1, 1,
0.1596536, -0.3156488, 2.431106, 0, 0, 0, 1, 1,
0.1639353, 0.9069175, 2.022984, 0, 0, 0, 1, 1,
0.178964, 0.7146826, 1.251178, 0, 0, 0, 1, 1,
0.1830786, -0.2578925, 2.138457, 0, 0, 0, 1, 1,
0.1861455, -0.8567237, 4.451708, 1, 1, 1, 1, 1,
0.188254, -0.8158439, 1.998918, 1, 1, 1, 1, 1,
0.1906365, 0.7482738, -1.078272, 1, 1, 1, 1, 1,
0.1929787, 0.4594904, 1.254458, 1, 1, 1, 1, 1,
0.1948193, 0.1087984, 0.4172543, 1, 1, 1, 1, 1,
0.19498, -0.7581326, 2.538998, 1, 1, 1, 1, 1,
0.1967341, -2.323287, 3.505335, 1, 1, 1, 1, 1,
0.198926, -1.105807, 1.486621, 1, 1, 1, 1, 1,
0.199407, 0.2078152, 0.3240044, 1, 1, 1, 1, 1,
0.1994188, 0.215701, -0.6309243, 1, 1, 1, 1, 1,
0.1999915, -1.323642, 2.474761, 1, 1, 1, 1, 1,
0.2034775, 1.258971, -0.7981616, 1, 1, 1, 1, 1,
0.2054001, -0.7637008, 1.580902, 1, 1, 1, 1, 1,
0.2162885, -0.5978028, 2.761538, 1, 1, 1, 1, 1,
0.2163783, 1.542308, 0.2280037, 1, 1, 1, 1, 1,
0.2170685, -1.356122, 3.131433, 0, 0, 1, 1, 1,
0.2179462, 1.257304, 0.4428042, 1, 0, 0, 1, 1,
0.2188933, 1.370546, -0.7264198, 1, 0, 0, 1, 1,
0.2234157, 0.2483417, 1.053631, 1, 0, 0, 1, 1,
0.2250131, -0.5565516, 2.14766, 1, 0, 0, 1, 1,
0.2251189, -1.006255, 3.163527, 1, 0, 0, 1, 1,
0.2283537, 0.1669504, -1.026987, 0, 0, 0, 1, 1,
0.2314034, -1.138564, 2.630559, 0, 0, 0, 1, 1,
0.2328275, -0.05114393, 2.371898, 0, 0, 0, 1, 1,
0.2358329, -0.5472637, 3.838808, 0, 0, 0, 1, 1,
0.2369281, 0.07629152, 1.346749, 0, 0, 0, 1, 1,
0.2374332, 1.022879, 2.357967, 0, 0, 0, 1, 1,
0.2417766, -1.235393, 3.577485, 0, 0, 0, 1, 1,
0.2461815, 0.3569563, 0.6529441, 1, 1, 1, 1, 1,
0.2495438, -0.0417368, 2.305374, 1, 1, 1, 1, 1,
0.2503984, 0.3772617, 2.624045, 1, 1, 1, 1, 1,
0.2652367, -0.526171, 3.460637, 1, 1, 1, 1, 1,
0.2677796, -0.6158444, 2.475851, 1, 1, 1, 1, 1,
0.2740507, 1.074791, 0.9342731, 1, 1, 1, 1, 1,
0.280283, -1.450802, 3.937412, 1, 1, 1, 1, 1,
0.2819092, 0.9504263, 0.2245317, 1, 1, 1, 1, 1,
0.2844532, -1.308253, 4.122568, 1, 1, 1, 1, 1,
0.2854422, 0.6806512, -0.1678498, 1, 1, 1, 1, 1,
0.2856961, 1.445071, 0.1614127, 1, 1, 1, 1, 1,
0.2873852, -1.268253, 3.295696, 1, 1, 1, 1, 1,
0.2905873, 1.036741, -1.017215, 1, 1, 1, 1, 1,
0.2927922, -0.3004455, 0.5246035, 1, 1, 1, 1, 1,
0.2929651, 1.930205, 0.1733656, 1, 1, 1, 1, 1,
0.2950844, 0.9288148, -0.009701786, 0, 0, 1, 1, 1,
0.2981695, -1.771798, 2.210794, 1, 0, 0, 1, 1,
0.3018893, 0.3139444, -0.184058, 1, 0, 0, 1, 1,
0.3042227, -0.893836, 3.700889, 1, 0, 0, 1, 1,
0.3046132, -2.22795, 3.058145, 1, 0, 0, 1, 1,
0.3066033, -0.02750759, 2.118932, 1, 0, 0, 1, 1,
0.3071804, -0.5056601, 1.791455, 0, 0, 0, 1, 1,
0.3077772, -0.1735496, 2.251768, 0, 0, 0, 1, 1,
0.3098963, 0.3944471, 1.131379, 0, 0, 0, 1, 1,
0.3132436, 1.668174, 0.7043657, 0, 0, 0, 1, 1,
0.3139412, -0.6151692, 2.544898, 0, 0, 0, 1, 1,
0.3153301, 0.6369259, 0.620514, 0, 0, 0, 1, 1,
0.3221016, -1.643527, 2.639687, 0, 0, 0, 1, 1,
0.329246, -0.4326423, 2.631038, 1, 1, 1, 1, 1,
0.3326922, -0.6098154, 2.605658, 1, 1, 1, 1, 1,
0.3345282, -0.4805764, 2.703043, 1, 1, 1, 1, 1,
0.335875, -1.148762, 2.097881, 1, 1, 1, 1, 1,
0.3400455, 0.5017025, 1.106896, 1, 1, 1, 1, 1,
0.3414066, -0.5172135, 1.325248, 1, 1, 1, 1, 1,
0.3417313, -0.388465, 1.213354, 1, 1, 1, 1, 1,
0.348073, -0.4837729, 1.253244, 1, 1, 1, 1, 1,
0.3505487, -0.283088, 1.311934, 1, 1, 1, 1, 1,
0.3538821, -0.04471796, 1.858644, 1, 1, 1, 1, 1,
0.3552248, -1.534713, 1.777315, 1, 1, 1, 1, 1,
0.3552306, -0.3122419, 0.9970034, 1, 1, 1, 1, 1,
0.3552777, 1.548282, -0.2159861, 1, 1, 1, 1, 1,
0.3560995, -0.4371892, 0.4306478, 1, 1, 1, 1, 1,
0.3561248, 0.9209809, 0.4285136, 1, 1, 1, 1, 1,
0.3623843, 0.1067473, 1.942453, 0, 0, 1, 1, 1,
0.3680933, -1.023071, 1.306501, 1, 0, 0, 1, 1,
0.3711007, -1.458444, 3.285924, 1, 0, 0, 1, 1,
0.3780967, -0.9659575, 0.9507629, 1, 0, 0, 1, 1,
0.3814485, -0.7921815, 2.578832, 1, 0, 0, 1, 1,
0.3880858, -0.06434048, 1.085501, 1, 0, 0, 1, 1,
0.3886851, -1.855496, 3.620542, 0, 0, 0, 1, 1,
0.3934051, 1.079311, -0.2332396, 0, 0, 0, 1, 1,
0.3942081, 0.8421602, 0.3218252, 0, 0, 0, 1, 1,
0.397409, 1.68032, 0.559772, 0, 0, 0, 1, 1,
0.3982718, -0.130504, 2.864428, 0, 0, 0, 1, 1,
0.4009498, -0.08414203, 2.462451, 0, 0, 0, 1, 1,
0.4017562, -1.27292, 2.495929, 0, 0, 0, 1, 1,
0.4028834, 0.3337992, 1.991502, 1, 1, 1, 1, 1,
0.4049792, 0.5633115, 0.555046, 1, 1, 1, 1, 1,
0.4051764, -1.235592, 3.65123, 1, 1, 1, 1, 1,
0.4097671, -1.032246, 1.863629, 1, 1, 1, 1, 1,
0.4156765, 0.4858494, -1.707841, 1, 1, 1, 1, 1,
0.4161008, 0.2194335, 0.9870264, 1, 1, 1, 1, 1,
0.4174553, -2.815624, 1.121432, 1, 1, 1, 1, 1,
0.4233973, -0.1753311, 2.189189, 1, 1, 1, 1, 1,
0.4365784, -0.09411587, 2.632, 1, 1, 1, 1, 1,
0.4386357, 0.157125, -0.2420639, 1, 1, 1, 1, 1,
0.4503161, -0.657083, 0.4795546, 1, 1, 1, 1, 1,
0.4584493, -0.2806764, 0.8230329, 1, 1, 1, 1, 1,
0.460364, -0.7274632, 2.809299, 1, 1, 1, 1, 1,
0.4619952, -0.9134857, 2.13006, 1, 1, 1, 1, 1,
0.4642906, -0.2941528, 1.456971, 1, 1, 1, 1, 1,
0.4696256, -0.2632518, 2.144156, 0, 0, 1, 1, 1,
0.4703474, 1.567433, 0.393365, 1, 0, 0, 1, 1,
0.4724792, -0.8889593, 4.718544, 1, 0, 0, 1, 1,
0.477398, 0.944411, -1.737041, 1, 0, 0, 1, 1,
0.4802081, 0.7854678, 0.2877546, 1, 0, 0, 1, 1,
0.4839034, -1.645276, 3.54865, 1, 0, 0, 1, 1,
0.4872259, -0.0909021, 2.108124, 0, 0, 0, 1, 1,
0.4915932, 1.006186, -1.205534, 0, 0, 0, 1, 1,
0.4999494, -2.230466, 2.477509, 0, 0, 0, 1, 1,
0.500649, 0.0257294, 3.07335, 0, 0, 0, 1, 1,
0.5037723, -2.420015, 2.228009, 0, 0, 0, 1, 1,
0.5041095, 0.1834299, 1.771259, 0, 0, 0, 1, 1,
0.5056104, -0.2556914, 0.2446184, 0, 0, 0, 1, 1,
0.5099735, -0.1656065, 2.129545, 1, 1, 1, 1, 1,
0.5164187, -1.078121, 2.620407, 1, 1, 1, 1, 1,
0.5165206, 0.6072929, 0.5237855, 1, 1, 1, 1, 1,
0.5204332, -0.5662259, 2.103639, 1, 1, 1, 1, 1,
0.5215706, 1.223993, -1.155355, 1, 1, 1, 1, 1,
0.5221658, -0.5026757, 3.20529, 1, 1, 1, 1, 1,
0.5275877, -2.098923, 2.67289, 1, 1, 1, 1, 1,
0.5289119, 1.30258, 0.5606639, 1, 1, 1, 1, 1,
0.5341966, 1.07841, 0.3387683, 1, 1, 1, 1, 1,
0.539792, 0.3178774, 2.438657, 1, 1, 1, 1, 1,
0.5400959, -0.5371408, 1.281142, 1, 1, 1, 1, 1,
0.5448113, 0.5405889, 0.5129091, 1, 1, 1, 1, 1,
0.5452334, -0.03156009, 1.814304, 1, 1, 1, 1, 1,
0.5468469, 0.845778, 0.2174668, 1, 1, 1, 1, 1,
0.5496336, 0.9239753, -0.5041308, 1, 1, 1, 1, 1,
0.5499792, 1.334019, 0.3669445, 0, 0, 1, 1, 1,
0.5548873, -0.8719854, 3.597084, 1, 0, 0, 1, 1,
0.5556851, 1.172343, 0.6125388, 1, 0, 0, 1, 1,
0.5565655, 0.2939519, 1.345822, 1, 0, 0, 1, 1,
0.5620691, 0.9803189, 0.9643577, 1, 0, 0, 1, 1,
0.5647433, -1.418448, 4.794472, 1, 0, 0, 1, 1,
0.5651767, -0.383579, 1.80614, 0, 0, 0, 1, 1,
0.5661656, 0.6833703, 0.5338306, 0, 0, 0, 1, 1,
0.5688632, 0.54118, 0.2001274, 0, 0, 0, 1, 1,
0.5760311, -1.452292, 1.902413, 0, 0, 0, 1, 1,
0.5766572, 1.153204, 0.7790317, 0, 0, 0, 1, 1,
0.5768114, -0.1064514, 1.12482, 0, 0, 0, 1, 1,
0.5775312, -0.6837559, 2.304999, 0, 0, 0, 1, 1,
0.5785237, 0.5953948, -0.435397, 1, 1, 1, 1, 1,
0.5808716, 0.9564862, 0.4600698, 1, 1, 1, 1, 1,
0.584287, -0.6165506, 3.560544, 1, 1, 1, 1, 1,
0.5853217, -0.2034492, 2.388205, 1, 1, 1, 1, 1,
0.5872648, -0.5675281, 2.92437, 1, 1, 1, 1, 1,
0.5883967, 0.8320357, -0.2019275, 1, 1, 1, 1, 1,
0.5892242, 1.434441, 1.409733, 1, 1, 1, 1, 1,
0.5893321, 0.9339843, 1.35906, 1, 1, 1, 1, 1,
0.5961903, 0.5731619, 0.04793036, 1, 1, 1, 1, 1,
0.5964578, 0.7773864, -0.7324965, 1, 1, 1, 1, 1,
0.5977465, 1.867391, -0.7944833, 1, 1, 1, 1, 1,
0.6027158, 0.5125009, 1.249068, 1, 1, 1, 1, 1,
0.6079498, -0.4128679, 2.525845, 1, 1, 1, 1, 1,
0.6085635, 1.266065, -1.666778, 1, 1, 1, 1, 1,
0.6103414, 0.5572839, 2.042973, 1, 1, 1, 1, 1,
0.6104788, -0.5661119, 2.332416, 0, 0, 1, 1, 1,
0.6117128, 0.3834141, -0.1082814, 1, 0, 0, 1, 1,
0.6127871, 1.961923, -0.3176631, 1, 0, 0, 1, 1,
0.6128815, 0.2702372, 1.537438, 1, 0, 0, 1, 1,
0.6137285, 1.07411, 2.143922, 1, 0, 0, 1, 1,
0.6139845, -0.5669336, 1.480855, 1, 0, 0, 1, 1,
0.6142845, -1.633885, 3.62611, 0, 0, 0, 1, 1,
0.6150365, -0.8413842, 3.511972, 0, 0, 0, 1, 1,
0.6181206, 0.4484557, 0.4295675, 0, 0, 0, 1, 1,
0.6193503, 0.3547282, 0.8682803, 0, 0, 0, 1, 1,
0.6200785, -0.4325293, 2.133741, 0, 0, 0, 1, 1,
0.6218839, -0.5463267, 3.297868, 0, 0, 0, 1, 1,
0.6251661, 0.4443157, 1.68728, 0, 0, 0, 1, 1,
0.6254356, 0.5574992, 0.2390974, 1, 1, 1, 1, 1,
0.6262478, -0.9843474, 3.110244, 1, 1, 1, 1, 1,
0.6276586, 0.5364636, 0.6763627, 1, 1, 1, 1, 1,
0.6282385, 0.4178948, 0.8996974, 1, 1, 1, 1, 1,
0.6291687, 0.2513925, 3.0523, 1, 1, 1, 1, 1,
0.6307822, 0.2198759, 1.913999, 1, 1, 1, 1, 1,
0.6345971, -2.399931, 1.761845, 1, 1, 1, 1, 1,
0.6381654, 2.443753, 0.9867005, 1, 1, 1, 1, 1,
0.6458721, 0.1812362, 1.117186, 1, 1, 1, 1, 1,
0.6460432, -0.5628248, 3.156096, 1, 1, 1, 1, 1,
0.6485282, -0.9904141, 3.708438, 1, 1, 1, 1, 1,
0.6522487, -1.258962, 2.455499, 1, 1, 1, 1, 1,
0.6536312, -0.5152169, 3.044731, 1, 1, 1, 1, 1,
0.6590628, -2.119452, 3.532161, 1, 1, 1, 1, 1,
0.6591416, 0.6073547, 1.60685, 1, 1, 1, 1, 1,
0.6593668, -1.042156, 2.723733, 0, 0, 1, 1, 1,
0.6623033, 0.7661641, -0.4958743, 1, 0, 0, 1, 1,
0.6640516, -1.653078, 2.20172, 1, 0, 0, 1, 1,
0.669769, -0.4682547, 2.051588, 1, 0, 0, 1, 1,
0.6703631, -0.4908798, 2.520267, 1, 0, 0, 1, 1,
0.6728847, 1.828325, -0.03268113, 1, 0, 0, 1, 1,
0.6732271, -2.159972, 1.819392, 0, 0, 0, 1, 1,
0.6763588, -0.4879687, 1.150292, 0, 0, 0, 1, 1,
0.6764902, 1.169261, 0.761821, 0, 0, 0, 1, 1,
0.6798881, -0.2359926, 3.164021, 0, 0, 0, 1, 1,
0.6837474, -0.4540012, 1.932139, 0, 0, 0, 1, 1,
0.6856049, -0.2490255, 1.941405, 0, 0, 0, 1, 1,
0.6903163, 1.758565, 2.530917, 0, 0, 0, 1, 1,
0.6985593, -0.5400949, 3.682211, 1, 1, 1, 1, 1,
0.6989537, -0.07561675, 4.337174, 1, 1, 1, 1, 1,
0.7071167, 3.050866, 2.254134, 1, 1, 1, 1, 1,
0.7137873, -2.193455, 2.54818, 1, 1, 1, 1, 1,
0.7174135, -0.7016991, 3.105033, 1, 1, 1, 1, 1,
0.7231044, -1.015686, 4.367154, 1, 1, 1, 1, 1,
0.7247938, 0.5369383, 0.3688926, 1, 1, 1, 1, 1,
0.7297981, 2.248504, 0.7320371, 1, 1, 1, 1, 1,
0.7301295, -1.304612, 2.386787, 1, 1, 1, 1, 1,
0.7328438, 0.7205762, 0.3064987, 1, 1, 1, 1, 1,
0.7353328, 1.146446, -0.176836, 1, 1, 1, 1, 1,
0.7388086, 0.04868294, 1.805589, 1, 1, 1, 1, 1,
0.7471872, 0.4919538, -1.727631, 1, 1, 1, 1, 1,
0.7513635, -0.1778646, 3.134353, 1, 1, 1, 1, 1,
0.7517245, 1.90805, 0.03126458, 1, 1, 1, 1, 1,
0.7545525, -0.5792511, 0.7446631, 0, 0, 1, 1, 1,
0.7565987, -1.825656, 0.6956666, 1, 0, 0, 1, 1,
0.7567753, 1.942199, 0.7886141, 1, 0, 0, 1, 1,
0.7585077, 1.347535, 0.7233988, 1, 0, 0, 1, 1,
0.7612625, -0.1539478, 0.666995, 1, 0, 0, 1, 1,
0.7666773, 0.9033007, 1.929526, 1, 0, 0, 1, 1,
0.7683146, -0.5257644, 0.893536, 0, 0, 0, 1, 1,
0.7701856, 1.155625, 1.58316, 0, 0, 0, 1, 1,
0.7762294, -0.833803, 1.834257, 0, 0, 0, 1, 1,
0.7790083, 0.9971067, -0.4267393, 0, 0, 0, 1, 1,
0.7844138, -0.9945176, 2.879483, 0, 0, 0, 1, 1,
0.7847362, -0.04889134, 1.798302, 0, 0, 0, 1, 1,
0.7980428, -0.3253972, 2.710001, 0, 0, 0, 1, 1,
0.7985776, -0.2105658, 0.5479741, 1, 1, 1, 1, 1,
0.8003697, 0.333061, 1.928106, 1, 1, 1, 1, 1,
0.8078507, -1.238555, 2.87794, 1, 1, 1, 1, 1,
0.8126599, 0.1108403, 2.09138, 1, 1, 1, 1, 1,
0.8153894, -1.64077, 2.646713, 1, 1, 1, 1, 1,
0.8222339, 0.5685745, -0.1274928, 1, 1, 1, 1, 1,
0.8226095, -1.346568, 2.699289, 1, 1, 1, 1, 1,
0.8289744, -1.939019, 2.696865, 1, 1, 1, 1, 1,
0.8290828, -0.1747735, 1.903207, 1, 1, 1, 1, 1,
0.8328723, 0.5004637, 2.513086, 1, 1, 1, 1, 1,
0.8329422, 0.5992489, -0.9649805, 1, 1, 1, 1, 1,
0.8339403, 2.517668, -0.4084721, 1, 1, 1, 1, 1,
0.8374466, -0.9531549, 3.713417, 1, 1, 1, 1, 1,
0.8396554, -1.904978, 1.716903, 1, 1, 1, 1, 1,
0.8409981, 0.2603098, 0.5824739, 1, 1, 1, 1, 1,
0.8435526, 1.08409, -0.1585243, 0, 0, 1, 1, 1,
0.8443803, 1.330183, 0.5259832, 1, 0, 0, 1, 1,
0.8470506, -0.5627975, 2.354042, 1, 0, 0, 1, 1,
0.8501016, -0.06731703, 1.553191, 1, 0, 0, 1, 1,
0.8627653, 1.068287, 0.6255302, 1, 0, 0, 1, 1,
0.8682529, -0.6753712, 2.280826, 1, 0, 0, 1, 1,
0.8706849, 1.84841, 1.133554, 0, 0, 0, 1, 1,
0.8713458, 0.1821491, 2.109457, 0, 0, 0, 1, 1,
0.8725215, -0.8973562, 2.025298, 0, 0, 0, 1, 1,
0.8752468, 0.5260959, 1.431014, 0, 0, 0, 1, 1,
0.8797349, 1.210888, 0.9654206, 0, 0, 0, 1, 1,
0.8830449, 0.06458361, 1.584615, 0, 0, 0, 1, 1,
0.892912, -1.789191, 1.811378, 0, 0, 0, 1, 1,
0.8955914, 1.029858, 0.4923283, 1, 1, 1, 1, 1,
0.8992245, -0.6832857, 4.510719, 1, 1, 1, 1, 1,
0.9023878, -0.6158772, 3.076329, 1, 1, 1, 1, 1,
0.9032924, -1.196301, 4.263071, 1, 1, 1, 1, 1,
0.9036858, -1.288252, 1.793936, 1, 1, 1, 1, 1,
0.9045194, -0.1971357, 2.263998, 1, 1, 1, 1, 1,
0.9090161, 0.3848867, 0.4894423, 1, 1, 1, 1, 1,
0.9116973, 0.07498001, 1.46809, 1, 1, 1, 1, 1,
0.9194064, -1.565327, 2.119283, 1, 1, 1, 1, 1,
0.9194904, 0.9805988, 0.4517875, 1, 1, 1, 1, 1,
0.9246841, 0.8617986, 0.424329, 1, 1, 1, 1, 1,
0.9331985, -0.6584164, 3.679122, 1, 1, 1, 1, 1,
0.9341307, 2.017728, 1.604772, 1, 1, 1, 1, 1,
0.9351135, -1.422401, 1.449514, 1, 1, 1, 1, 1,
0.9364633, 0.481117, 1.147794, 1, 1, 1, 1, 1,
0.9444146, 0.9435879, 0.610172, 0, 0, 1, 1, 1,
0.9523816, 1.077249, 2.287159, 1, 0, 0, 1, 1,
0.9527834, -0.849295, 2.738095, 1, 0, 0, 1, 1,
0.95472, 0.1630414, 2.246189, 1, 0, 0, 1, 1,
0.958164, 0.7062318, 0.5599251, 1, 0, 0, 1, 1,
0.9601185, -1.805625, 4.558496, 1, 0, 0, 1, 1,
0.9608735, -0.2704023, 2.480022, 0, 0, 0, 1, 1,
0.9622042, 0.6202646, 1.892975, 0, 0, 0, 1, 1,
0.9669736, 2.044189, 1.368422, 0, 0, 0, 1, 1,
0.968751, -0.640403, 1.848204, 0, 0, 0, 1, 1,
0.9752263, -0.3548347, 1.578761, 0, 0, 0, 1, 1,
0.976371, 0.542194, 2.889699, 0, 0, 0, 1, 1,
0.9794676, -0.779951, 2.525807, 0, 0, 0, 1, 1,
0.9808912, 1.004757, 0.8292484, 1, 1, 1, 1, 1,
0.9811398, 0.221406, 1.976736, 1, 1, 1, 1, 1,
0.987945, 2.062702, 0.7733145, 1, 1, 1, 1, 1,
0.9887121, 0.1829495, 2.108457, 1, 1, 1, 1, 1,
0.9951829, 0.8001896, 1.380228, 1, 1, 1, 1, 1,
0.9972727, -0.4670171, 0.9077908, 1, 1, 1, 1, 1,
0.999418, 0.08166721, 2.007294, 1, 1, 1, 1, 1,
1.00595, 0.378195, 2.260156, 1, 1, 1, 1, 1,
1.006901, 0.579752, 0.8350751, 1, 1, 1, 1, 1,
1.008522, 1.106219, 1.523355, 1, 1, 1, 1, 1,
1.009081, -0.8930385, 1.70592, 1, 1, 1, 1, 1,
1.014343, -0.8681205, 3.183733, 1, 1, 1, 1, 1,
1.019764, -0.1523095, 0.9713874, 1, 1, 1, 1, 1,
1.020852, 1.594445, 0.5900803, 1, 1, 1, 1, 1,
1.022063, 0.3034478, 1.924414, 1, 1, 1, 1, 1,
1.035382, 0.7860169, 0.0452494, 0, 0, 1, 1, 1,
1.036765, 0.4615982, 1.010862, 1, 0, 0, 1, 1,
1.038515, 1.821467, -0.7015532, 1, 0, 0, 1, 1,
1.042268, -0.9283691, 0.8075906, 1, 0, 0, 1, 1,
1.04334, -0.9310623, 3.566683, 1, 0, 0, 1, 1,
1.044708, 0.05561804, 0.5327806, 1, 0, 0, 1, 1,
1.055344, 1.304285, -0.527787, 0, 0, 0, 1, 1,
1.057243, -1.167849, 3.534262, 0, 0, 0, 1, 1,
1.073015, 0.1711964, 1.600835, 0, 0, 0, 1, 1,
1.073275, -0.8408943, 1.344191, 0, 0, 0, 1, 1,
1.090056, 1.074653, 1.230624, 0, 0, 0, 1, 1,
1.090821, -2.260748, 1.395393, 0, 0, 0, 1, 1,
1.094205, 0.9280256, 1.791278, 0, 0, 0, 1, 1,
1.099055, 0.5852762, 0.9948846, 1, 1, 1, 1, 1,
1.105052, -0.3273328, 4.156192, 1, 1, 1, 1, 1,
1.105106, 0.8418651, 2.886643, 1, 1, 1, 1, 1,
1.114335, 0.9823828, -0.5755218, 1, 1, 1, 1, 1,
1.117148, 1.094975, 1.806564, 1, 1, 1, 1, 1,
1.125749, 1.385801, -0.734745, 1, 1, 1, 1, 1,
1.131646, 0.06901672, 0.7566943, 1, 1, 1, 1, 1,
1.135224, 2.136384, 0.08130956, 1, 1, 1, 1, 1,
1.13649, 0.9937862, 0.1258038, 1, 1, 1, 1, 1,
1.147324, 1.313264, 2.711317, 1, 1, 1, 1, 1,
1.159041, -1.007971, 1.558956, 1, 1, 1, 1, 1,
1.167171, 0.5467749, 1.073909, 1, 1, 1, 1, 1,
1.168455, 0.5983165, 1.799701, 1, 1, 1, 1, 1,
1.168944, 0.2382386, 1.343156, 1, 1, 1, 1, 1,
1.170005, 0.8356788, -1.298621, 1, 1, 1, 1, 1,
1.18084, 0.0444657, 3.13605, 0, 0, 1, 1, 1,
1.18492, 1.028274, 2.057797, 1, 0, 0, 1, 1,
1.193159, 0.7485687, 0.7456757, 1, 0, 0, 1, 1,
1.199962, 1.14081, 0.7186486, 1, 0, 0, 1, 1,
1.205062, -0.157095, 2.047065, 1, 0, 0, 1, 1,
1.20654, 0.2289079, 1.956539, 1, 0, 0, 1, 1,
1.209886, 0.4896119, 0.6772214, 0, 0, 0, 1, 1,
1.210126, -0.2912033, 0.9668733, 0, 0, 0, 1, 1,
1.211249, 1.009794, 1.266821, 0, 0, 0, 1, 1,
1.21239, -0.1098618, 0.9517477, 0, 0, 0, 1, 1,
1.213354, 0.01894704, 0.00611741, 0, 0, 0, 1, 1,
1.213644, -0.05208979, -0.5805239, 0, 0, 0, 1, 1,
1.219063, 2.105865, -0.4979535, 0, 0, 0, 1, 1,
1.219158, -0.3122817, 2.111964, 1, 1, 1, 1, 1,
1.222213, -0.1611829, 1.468086, 1, 1, 1, 1, 1,
1.228279, 0.1669543, 0.7527581, 1, 1, 1, 1, 1,
1.235632, -0.8372784, 2.248128, 1, 1, 1, 1, 1,
1.242136, 0.7364631, 1.093699, 1, 1, 1, 1, 1,
1.242635, -0.9580155, 3.013621, 1, 1, 1, 1, 1,
1.244802, 0.8121498, 0.4127616, 1, 1, 1, 1, 1,
1.258596, -1.969642, 2.950282, 1, 1, 1, 1, 1,
1.260064, -0.8642487, 0.4579852, 1, 1, 1, 1, 1,
1.269994, -0.4204795, 0.8996818, 1, 1, 1, 1, 1,
1.270784, 1.31262, 2.557765, 1, 1, 1, 1, 1,
1.276489, -0.1340968, 1.845435, 1, 1, 1, 1, 1,
1.280636, 1.099772, 1.067236, 1, 1, 1, 1, 1,
1.290566, 0.4137728, 1.618542, 1, 1, 1, 1, 1,
1.294964, 0.4391288, -0.718419, 1, 1, 1, 1, 1,
1.308575, -1.785953, 3.280423, 0, 0, 1, 1, 1,
1.318642, 0.6486508, 2.207038, 1, 0, 0, 1, 1,
1.32045, 2.283016, 0.6767944, 1, 0, 0, 1, 1,
1.327036, 0.1773512, 0.3691382, 1, 0, 0, 1, 1,
1.330592, 1.490517, 0.2123455, 1, 0, 0, 1, 1,
1.341221, -0.1451822, 1.945603, 1, 0, 0, 1, 1,
1.341834, -0.6752641, 1.896911, 0, 0, 0, 1, 1,
1.343918, -1.522131, -0.4259294, 0, 0, 0, 1, 1,
1.356218, -0.8795643, 2.44784, 0, 0, 0, 1, 1,
1.366624, 0.1137767, 2.614914, 0, 0, 0, 1, 1,
1.373879, 0.8619325, 0.6288094, 0, 0, 0, 1, 1,
1.374191, 0.149451, 1.006595, 0, 0, 0, 1, 1,
1.374607, 1.529938, 1.616428, 0, 0, 0, 1, 1,
1.380449, -1.495104, 0.7398273, 1, 1, 1, 1, 1,
1.383523, 0.5490348, 1.36412, 1, 1, 1, 1, 1,
1.391859, 0.06948847, 3.79773, 1, 1, 1, 1, 1,
1.391991, 0.6151716, 0.4708106, 1, 1, 1, 1, 1,
1.407345, 0.3242461, 0.4441525, 1, 1, 1, 1, 1,
1.421982, -0.3895339, 0.008206767, 1, 1, 1, 1, 1,
1.423795, 0.2962709, 1.13373, 1, 1, 1, 1, 1,
1.439076, -1.340418, 0.700936, 1, 1, 1, 1, 1,
1.452368, -1.006641, 2.891754, 1, 1, 1, 1, 1,
1.45287, -1.162251, 1.47288, 1, 1, 1, 1, 1,
1.455284, -2.023821, 4.532605, 1, 1, 1, 1, 1,
1.471916, 0.7050978, 0.8365293, 1, 1, 1, 1, 1,
1.486401, -2.126009, 4.710207, 1, 1, 1, 1, 1,
1.497478, -0.4407882, 3.332328, 1, 1, 1, 1, 1,
1.502418, -0.2362871, 1.433108, 1, 1, 1, 1, 1,
1.513898, -1.314617, 2.958076, 0, 0, 1, 1, 1,
1.522652, 0.8283699, 2.16525, 1, 0, 0, 1, 1,
1.530409, -1.04638, 2.310049, 1, 0, 0, 1, 1,
1.530663, 0.1603907, 2.228186, 1, 0, 0, 1, 1,
1.549437, -1.589933, 2.354453, 1, 0, 0, 1, 1,
1.55738, 0.4188986, 2.189962, 1, 0, 0, 1, 1,
1.558042, 0.01418009, 2.767092, 0, 0, 0, 1, 1,
1.561742, -1.706195, 2.3251, 0, 0, 0, 1, 1,
1.566116, 1.748039, 3.293204, 0, 0, 0, 1, 1,
1.577752, -1.283485, 0.3274899, 0, 0, 0, 1, 1,
1.578521, 0.2920372, 1.491166, 0, 0, 0, 1, 1,
1.586176, 1.750922, -1.025236, 0, 0, 0, 1, 1,
1.587009, -0.2348729, 3.016571, 0, 0, 0, 1, 1,
1.597231, 0.7414046, 2.355895, 1, 1, 1, 1, 1,
1.599901, 1.57643, 0.2652847, 1, 1, 1, 1, 1,
1.610717, -1.225583, 2.019591, 1, 1, 1, 1, 1,
1.614265, 1.187075, 0.5776087, 1, 1, 1, 1, 1,
1.614848, -0.7112594, 1.776886, 1, 1, 1, 1, 1,
1.617946, -0.3754865, 1.780824, 1, 1, 1, 1, 1,
1.621742, -0.131953, 1.641823, 1, 1, 1, 1, 1,
1.62796, 0.6981638, 1.662683, 1, 1, 1, 1, 1,
1.629401, -1.873162, 2.849895, 1, 1, 1, 1, 1,
1.63029, 1.797143, 1.085288, 1, 1, 1, 1, 1,
1.635761, -0.3597997, 1.460134, 1, 1, 1, 1, 1,
1.639483, 1.255689, 1.107728, 1, 1, 1, 1, 1,
1.643876, -0.160371, 1.492562, 1, 1, 1, 1, 1,
1.660094, -1.540598, 1.81728, 1, 1, 1, 1, 1,
1.66545, -0.2407793, 0.00862221, 1, 1, 1, 1, 1,
1.667175, 0.4063754, 1.052403, 0, 0, 1, 1, 1,
1.707051, 1.096218, 1.224867, 1, 0, 0, 1, 1,
1.707475, -0.7083606, 0.7964031, 1, 0, 0, 1, 1,
1.724802, 0.1231415, -0.9968585, 1, 0, 0, 1, 1,
1.72515, 0.1217673, 1.772476, 1, 0, 0, 1, 1,
1.73379, 0.09774496, 3.342051, 1, 0, 0, 1, 1,
1.791797, 0.3135299, -0.02434741, 0, 0, 0, 1, 1,
1.800189, 1.474042, 2.012525, 0, 0, 0, 1, 1,
1.803115, -0.7171451, 1.755915, 0, 0, 0, 1, 1,
1.814828, 0.6232869, 0.06941967, 0, 0, 0, 1, 1,
1.88238, -0.08071354, 3.436535, 0, 0, 0, 1, 1,
1.888739, -0.530999, 1.053359, 0, 0, 0, 1, 1,
1.889725, 1.833067, 1.506758, 0, 0, 0, 1, 1,
1.893329, -0.1870316, -0.05452621, 1, 1, 1, 1, 1,
1.909944, -1.162942, 2.549347, 1, 1, 1, 1, 1,
1.916409, -0.7823168, 0.8056656, 1, 1, 1, 1, 1,
1.939653, 0.4114695, -0.02510586, 1, 1, 1, 1, 1,
1.958338, 0.6579473, 0.4841023, 1, 1, 1, 1, 1,
1.963486, -1.261759, 3.767689, 1, 1, 1, 1, 1,
2.007263, -0.1802015, 1.18898, 1, 1, 1, 1, 1,
2.01435, -0.1644307, 0.4003365, 1, 1, 1, 1, 1,
2.021243, -1.221609, 2.868145, 1, 1, 1, 1, 1,
2.037856, 2.036172, 0.9428163, 1, 1, 1, 1, 1,
2.052838, 1.463628, 1.36076, 1, 1, 1, 1, 1,
2.065351, 0.6167263, 2.206855, 1, 1, 1, 1, 1,
2.073167, -0.2708352, 2.600744, 1, 1, 1, 1, 1,
2.133528, -0.8454027, 0.7658468, 1, 1, 1, 1, 1,
2.138512, -0.2834184, 0.2585249, 1, 1, 1, 1, 1,
2.164527, 0.9715901, 0.5045909, 0, 0, 1, 1, 1,
2.181742, -0.8304549, 2.910882, 1, 0, 0, 1, 1,
2.188665, 1.331142, 0.2491859, 1, 0, 0, 1, 1,
2.256964, -0.773034, 2.210158, 1, 0, 0, 1, 1,
2.347666, 1.069885, 0.2412707, 1, 0, 0, 1, 1,
2.409441, 0.7260495, 1.201048, 1, 0, 0, 1, 1,
2.436827, -0.4350574, 3.088891, 0, 0, 0, 1, 1,
2.508435, 0.1165009, 0.1551695, 0, 0, 0, 1, 1,
2.525397, 0.3470349, 0.4155483, 0, 0, 0, 1, 1,
2.57868, -1.964967, 2.98616, 0, 0, 0, 1, 1,
2.606416, 2.416438, 0.551042, 0, 0, 0, 1, 1,
2.616366, -2.096079, 0.9181479, 0, 0, 0, 1, 1,
2.790398, 1.956378, 1.889109, 0, 0, 0, 1, 1,
2.926353, -0.4147626, 1.125029, 1, 1, 1, 1, 1,
3.025425, -0.9159246, 2.36461, 1, 1, 1, 1, 1,
3.066872, 0.6858111, 1.209586, 1, 1, 1, 1, 1,
3.299473, 2.313988, -0.6952244, 1, 1, 1, 1, 1,
3.321775, -0.9291674, 0.7325071, 1, 1, 1, 1, 1,
3.456093, -0.9059993, 0.8179162, 1, 1, 1, 1, 1,
3.77142, 0.8676252, 1.600366, 1, 1, 1, 1, 1
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
var radius = 9.843868;
var distance = 34.57617;
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
mvMatrix.translate( -0.2576771, -0.03675294, -0.04282522 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.57617);
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
