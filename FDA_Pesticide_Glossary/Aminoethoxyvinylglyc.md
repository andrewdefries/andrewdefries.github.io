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
-3.432204, 0.1247308, -1.446669, 1, 0, 0, 1,
-3.02537, 2.180031, -1.879862, 1, 0.007843138, 0, 1,
-2.872727, -1.039633, -2.41944, 1, 0.01176471, 0, 1,
-2.857748, 1.125406, -0.5863209, 1, 0.01960784, 0, 1,
-2.815602, 0.8009245, -2.581962, 1, 0.02352941, 0, 1,
-2.763344, 0.9710879, -2.323482, 1, 0.03137255, 0, 1,
-2.555275, 1.572645, -0.8398705, 1, 0.03529412, 0, 1,
-2.501466, -2.533436, -2.587167, 1, 0.04313726, 0, 1,
-2.407919, 0.2591457, -1.878944, 1, 0.04705882, 0, 1,
-2.289543, -0.534462, -1.861648, 1, 0.05490196, 0, 1,
-2.225394, 1.157529, -2.53181, 1, 0.05882353, 0, 1,
-2.200253, 0.01839784, -1.026394, 1, 0.06666667, 0, 1,
-2.192527, 0.4316891, -1.67353, 1, 0.07058824, 0, 1,
-2.174789, -1.24064, -1.967055, 1, 0.07843138, 0, 1,
-2.159455, -0.805512, -1.749031, 1, 0.08235294, 0, 1,
-2.129191, -1.852753, -2.309189, 1, 0.09019608, 0, 1,
-2.119983, -1.449839, -3.020289, 1, 0.09411765, 0, 1,
-2.090643, 0.1381581, -3.577454, 1, 0.1019608, 0, 1,
-2.04205, 1.292414, 1.068083, 1, 0.1098039, 0, 1,
-2.031954, 0.3836121, -2.505857, 1, 0.1137255, 0, 1,
-2.022139, 2.028813, -0.5891488, 1, 0.1215686, 0, 1,
-1.996893, 0.3283705, -1.097923, 1, 0.1254902, 0, 1,
-1.979203, 0.3068015, 0.6682762, 1, 0.1333333, 0, 1,
-1.977154, 1.300575, -0.8959796, 1, 0.1372549, 0, 1,
-1.97214, 1.260495, -0.6620119, 1, 0.145098, 0, 1,
-1.947452, 0.2986002, -0.8089395, 1, 0.1490196, 0, 1,
-1.932123, 0.1033591, -1.093321, 1, 0.1568628, 0, 1,
-1.923561, -0.06820408, 0.2335081, 1, 0.1607843, 0, 1,
-1.920023, -0.8373189, -2.092273, 1, 0.1686275, 0, 1,
-1.919397, 1.409604, -1.028017, 1, 0.172549, 0, 1,
-1.89345, 0.84337, -1.324582, 1, 0.1803922, 0, 1,
-1.883524, -0.08535947, -2.35052, 1, 0.1843137, 0, 1,
-1.866237, -0.4296131, -0.9606076, 1, 0.1921569, 0, 1,
-1.849379, 1.310398, -0.9114761, 1, 0.1960784, 0, 1,
-1.824631, -0.7330414, -2.038629, 1, 0.2039216, 0, 1,
-1.81773, 1.300194, -0.4263132, 1, 0.2117647, 0, 1,
-1.793692, 0.3095613, -2.942327, 1, 0.2156863, 0, 1,
-1.775549, 0.4050037, -1.149659, 1, 0.2235294, 0, 1,
-1.763357, 0.5910934, -2.003431, 1, 0.227451, 0, 1,
-1.715629, 1.075875, -1.950075, 1, 0.2352941, 0, 1,
-1.688971, 1.309146, -0.8922814, 1, 0.2392157, 0, 1,
-1.682412, 1.697541, -1.834953, 1, 0.2470588, 0, 1,
-1.682117, 0.3952201, -1.962073, 1, 0.2509804, 0, 1,
-1.641581, 0.79366, -1.402799, 1, 0.2588235, 0, 1,
-1.631475, -0.5979322, -0.8925421, 1, 0.2627451, 0, 1,
-1.628641, 1.620698, -1.550246, 1, 0.2705882, 0, 1,
-1.612723, -0.154231, -2.621398, 1, 0.2745098, 0, 1,
-1.599994, 0.08129958, -2.079226, 1, 0.282353, 0, 1,
-1.598637, -0.4352943, -0.5502012, 1, 0.2862745, 0, 1,
-1.59381, -0.1160887, -1.193689, 1, 0.2941177, 0, 1,
-1.564632, -0.5092887, -1.585663, 1, 0.3019608, 0, 1,
-1.561961, -1.159247, -0.971855, 1, 0.3058824, 0, 1,
-1.560072, -0.7972389, -2.500251, 1, 0.3137255, 0, 1,
-1.558863, 0.3117144, -1.271283, 1, 0.3176471, 0, 1,
-1.558738, -0.09156683, -0.2928047, 1, 0.3254902, 0, 1,
-1.54884, 1.455838, -2.196209, 1, 0.3294118, 0, 1,
-1.547827, -0.7314677, -2.626965, 1, 0.3372549, 0, 1,
-1.546074, -1.899666, -1.710039, 1, 0.3411765, 0, 1,
-1.545436, -0.2937149, -1.468854, 1, 0.3490196, 0, 1,
-1.544876, -0.4625674, -1.999043, 1, 0.3529412, 0, 1,
-1.543348, -0.6151726, -1.516124, 1, 0.3607843, 0, 1,
-1.542799, 0.2737875, -1.69386, 1, 0.3647059, 0, 1,
-1.532506, -0.9875283, -2.617335, 1, 0.372549, 0, 1,
-1.52688, -2.264658, -2.073539, 1, 0.3764706, 0, 1,
-1.521164, -0.4759017, -2.585865, 1, 0.3843137, 0, 1,
-1.50655, -1.290362, -0.3630662, 1, 0.3882353, 0, 1,
-1.49746, 0.4980034, -3.02001, 1, 0.3960784, 0, 1,
-1.474205, 1.258577, -1.646195, 1, 0.4039216, 0, 1,
-1.471668, 0.8655222, -1.593363, 1, 0.4078431, 0, 1,
-1.469541, -0.8236209, -3.161067, 1, 0.4156863, 0, 1,
-1.468392, -2.593417, -4.044081, 1, 0.4196078, 0, 1,
-1.464608, 1.634272, -1.72428, 1, 0.427451, 0, 1,
-1.464301, -0.1053238, 0.078661, 1, 0.4313726, 0, 1,
-1.456365, 0.9406638, -1.392518, 1, 0.4392157, 0, 1,
-1.442605, -0.2522717, -2.611156, 1, 0.4431373, 0, 1,
-1.434033, -0.3468036, -0.6374511, 1, 0.4509804, 0, 1,
-1.425104, -2.709251, -1.749673, 1, 0.454902, 0, 1,
-1.415852, -0.2752856, -1.159569, 1, 0.4627451, 0, 1,
-1.402795, -0.5479707, -1.878566, 1, 0.4666667, 0, 1,
-1.401479, 0.5585238, 0.6689797, 1, 0.4745098, 0, 1,
-1.399955, 1.114366, -0.8017634, 1, 0.4784314, 0, 1,
-1.391957, -1.059693, -4.911545, 1, 0.4862745, 0, 1,
-1.387568, -0.6168271, -3.167011, 1, 0.4901961, 0, 1,
-1.382571, 0.9169308, -0.4119792, 1, 0.4980392, 0, 1,
-1.379013, 0.8704367, 0.2524611, 1, 0.5058824, 0, 1,
-1.374675, -0.05422104, -3.643594, 1, 0.509804, 0, 1,
-1.373633, 1.475596, -1.232251, 1, 0.5176471, 0, 1,
-1.360652, -0.2776054, -0.8979046, 1, 0.5215687, 0, 1,
-1.359107, -1.205394, -2.796294, 1, 0.5294118, 0, 1,
-1.345397, 0.3325918, -0.3398288, 1, 0.5333334, 0, 1,
-1.340854, 1.438468, -2.726245, 1, 0.5411765, 0, 1,
-1.326345, -1.374894, -3.328058, 1, 0.5450981, 0, 1,
-1.322289, 1.006748, -2.205926, 1, 0.5529412, 0, 1,
-1.318323, -0.6466703, -2.88565, 1, 0.5568628, 0, 1,
-1.316049, -0.9629436, -1.519528, 1, 0.5647059, 0, 1,
-1.302775, 0.05142564, -2.676226, 1, 0.5686275, 0, 1,
-1.298709, -0.9363008, -2.948931, 1, 0.5764706, 0, 1,
-1.296401, 0.6995118, -2.154195, 1, 0.5803922, 0, 1,
-1.280512, -0.314272, -2.341727, 1, 0.5882353, 0, 1,
-1.279987, 0.8694444, -1.19936, 1, 0.5921569, 0, 1,
-1.271757, -0.3787023, -2.956407, 1, 0.6, 0, 1,
-1.271735, 1.805749, 0.09026573, 1, 0.6078432, 0, 1,
-1.262455, 0.3424475, -0.8558847, 1, 0.6117647, 0, 1,
-1.248737, -0.1532482, -1.113242, 1, 0.6196079, 0, 1,
-1.241925, 0.4558848, -0.3630168, 1, 0.6235294, 0, 1,
-1.240664, -1.890061, -2.949925, 1, 0.6313726, 0, 1,
-1.239736, 0.1336756, -0.9357117, 1, 0.6352941, 0, 1,
-1.229286, 0.2459799, 0.9669037, 1, 0.6431373, 0, 1,
-1.227973, -1.709363, -3.312371, 1, 0.6470588, 0, 1,
-1.219085, -0.873802, -0.7380989, 1, 0.654902, 0, 1,
-1.218516, 1.711492, -2.817107, 1, 0.6588235, 0, 1,
-1.208541, 0.6339905, -1.714762, 1, 0.6666667, 0, 1,
-1.19982, -0.3801951, -1.697617, 1, 0.6705883, 0, 1,
-1.193115, -0.9219192, -3.21402, 1, 0.6784314, 0, 1,
-1.182216, -0.2349968, -1.748087, 1, 0.682353, 0, 1,
-1.180403, -0.1521227, -2.006138, 1, 0.6901961, 0, 1,
-1.173683, 0.06004318, -1.544199, 1, 0.6941177, 0, 1,
-1.172525, 0.228454, -1.102167, 1, 0.7019608, 0, 1,
-1.169503, -3.106555, -3.718889, 1, 0.7098039, 0, 1,
-1.161833, 0.2385831, -1.231212, 1, 0.7137255, 0, 1,
-1.157246, 0.3064818, -1.466147, 1, 0.7215686, 0, 1,
-1.150352, 1.193303, -1.791525, 1, 0.7254902, 0, 1,
-1.146628, -0.7543592, -2.008227, 1, 0.7333333, 0, 1,
-1.146466, 1.124586, -0.6531245, 1, 0.7372549, 0, 1,
-1.143293, -2.184126, -0.438911, 1, 0.7450981, 0, 1,
-1.142405, -1.342616, -1.055953, 1, 0.7490196, 0, 1,
-1.141756, -1.698839, -1.80204, 1, 0.7568628, 0, 1,
-1.139695, 1.099227, 0.7074929, 1, 0.7607843, 0, 1,
-1.134422, -1.849742, -1.509034, 1, 0.7686275, 0, 1,
-1.131528, 0.6625226, -2.230969, 1, 0.772549, 0, 1,
-1.126223, -0.6437045, -2.314543, 1, 0.7803922, 0, 1,
-1.123932, 0.8256679, 0.2537293, 1, 0.7843137, 0, 1,
-1.123268, -0.6190073, -2.083304, 1, 0.7921569, 0, 1,
-1.119843, -0.004474166, -1.231246, 1, 0.7960784, 0, 1,
-1.114139, 0.9234262, -0.7498608, 1, 0.8039216, 0, 1,
-1.091787, -0.4125939, -1.574379, 1, 0.8117647, 0, 1,
-1.090079, -0.3995015, -3.609857, 1, 0.8156863, 0, 1,
-1.08613, 0.5319254, 0.2722528, 1, 0.8235294, 0, 1,
-1.08524, 0.7563592, -1.028479, 1, 0.827451, 0, 1,
-1.084825, -1.614509, -2.199089, 1, 0.8352941, 0, 1,
-1.08363, 0.3439529, -0.445351, 1, 0.8392157, 0, 1,
-1.080951, 0.4925644, -1.098131, 1, 0.8470588, 0, 1,
-1.078472, -0.3409477, -1.303011, 1, 0.8509804, 0, 1,
-1.076194, -0.2595458, -2.891123, 1, 0.8588235, 0, 1,
-1.076118, -0.3634253, -2.150465, 1, 0.8627451, 0, 1,
-1.075945, -1.026546, -3.127989, 1, 0.8705882, 0, 1,
-1.068229, -2.293124, -2.406306, 1, 0.8745098, 0, 1,
-1.067967, -0.3423539, -1.758344, 1, 0.8823529, 0, 1,
-1.064774, 0.7012136, -1.206611, 1, 0.8862745, 0, 1,
-1.063294, -0.8599025, -1.377212, 1, 0.8941177, 0, 1,
-1.06123, -0.2151757, -1.447192, 1, 0.8980392, 0, 1,
-1.060815, 1.416846, 0.04201572, 1, 0.9058824, 0, 1,
-1.048503, 0.3711385, -0.9673289, 1, 0.9137255, 0, 1,
-1.047326, -0.562728, -0.2618534, 1, 0.9176471, 0, 1,
-1.042569, -0.7433752, -2.343009, 1, 0.9254902, 0, 1,
-1.042433, 0.4668303, -1.876722, 1, 0.9294118, 0, 1,
-1.032143, 2.138326, 1.513871, 1, 0.9372549, 0, 1,
-1.023954, 0.3068064, -1.296483, 1, 0.9411765, 0, 1,
-1.018679, 0.3731844, -0.8356357, 1, 0.9490196, 0, 1,
-1.01288, 0.7444043, -1.677371, 1, 0.9529412, 0, 1,
-1.012135, 1.454834, -1.780491, 1, 0.9607843, 0, 1,
-1.01173, 0.5874408, -2.195278, 1, 0.9647059, 0, 1,
-0.9947325, -0.7630105, -2.496665, 1, 0.972549, 0, 1,
-0.9924888, -0.5290903, -4.108294, 1, 0.9764706, 0, 1,
-0.9902527, 1.665478, 0.3073002, 1, 0.9843137, 0, 1,
-0.9879991, 0.1812682, -0.9580213, 1, 0.9882353, 0, 1,
-0.9804451, 0.1745846, -1.562082, 1, 0.9960784, 0, 1,
-0.9763746, 1.56117, -0.5898708, 0.9960784, 1, 0, 1,
-0.9759935, 0.4938618, -1.881243, 0.9921569, 1, 0, 1,
-0.9742228, -0.247267, -1.629586, 0.9843137, 1, 0, 1,
-0.9710218, 0.2318542, -2.887186, 0.9803922, 1, 0, 1,
-0.9669673, 0.4956644, -0.1479049, 0.972549, 1, 0, 1,
-0.95916, 1.034068, 0.7123208, 0.9686275, 1, 0, 1,
-0.9589153, -0.2348637, 0.9862679, 0.9607843, 1, 0, 1,
-0.9563043, 0.3291475, -2.067003, 0.9568627, 1, 0, 1,
-0.9475071, -0.6163013, -3.926909, 0.9490196, 1, 0, 1,
-0.9444459, 2.034086, -0.3435179, 0.945098, 1, 0, 1,
-0.9408823, -0.2930898, -2.439439, 0.9372549, 1, 0, 1,
-0.9396266, -0.06233277, -1.346933, 0.9333333, 1, 0, 1,
-0.9311089, -0.9225578, -2.52358, 0.9254902, 1, 0, 1,
-0.9269146, 1.555752, -0.08669722, 0.9215686, 1, 0, 1,
-0.9197867, -0.703411, -2.30623, 0.9137255, 1, 0, 1,
-0.9185514, 1.415386, -1.157091, 0.9098039, 1, 0, 1,
-0.9174501, 1.33164, 0.9045454, 0.9019608, 1, 0, 1,
-0.9167013, 0.07691782, -0.6446594, 0.8941177, 1, 0, 1,
-0.9154791, 0.7738124, -0.4561658, 0.8901961, 1, 0, 1,
-0.9111812, 0.2204297, 0.2278039, 0.8823529, 1, 0, 1,
-0.9101414, -0.8511163, -3.522717, 0.8784314, 1, 0, 1,
-0.9099372, 0.4063056, -0.481263, 0.8705882, 1, 0, 1,
-0.9079617, -0.7767835, -3.422235, 0.8666667, 1, 0, 1,
-0.9067555, -0.5016483, -3.302831, 0.8588235, 1, 0, 1,
-0.9060649, -0.6449504, -1.307848, 0.854902, 1, 0, 1,
-0.9058223, -0.1998993, -3.046598, 0.8470588, 1, 0, 1,
-0.904552, 1.513855, -1.272885, 0.8431373, 1, 0, 1,
-0.9024144, -1.480175, -3.634292, 0.8352941, 1, 0, 1,
-0.8948701, -0.4015667, -1.740132, 0.8313726, 1, 0, 1,
-0.8860673, 0.6667016, -0.1262511, 0.8235294, 1, 0, 1,
-0.8843697, -1.70822, 0.2039805, 0.8196079, 1, 0, 1,
-0.882795, -0.09694433, -3.77184, 0.8117647, 1, 0, 1,
-0.8799801, -0.1661803, -3.891627, 0.8078431, 1, 0, 1,
-0.8734248, -0.34253, -2.288051, 0.8, 1, 0, 1,
-0.8710418, -2.056691, -1.058554, 0.7921569, 1, 0, 1,
-0.8656328, -1.089633, -2.099185, 0.7882353, 1, 0, 1,
-0.8608972, -0.3867646, -1.138126, 0.7803922, 1, 0, 1,
-0.8605153, -1.358105, -2.075103, 0.7764706, 1, 0, 1,
-0.8591822, -0.6096956, -1.701698, 0.7686275, 1, 0, 1,
-0.8582364, -0.3402875, -2.105444, 0.7647059, 1, 0, 1,
-0.8430151, 0.787587, -0.5454653, 0.7568628, 1, 0, 1,
-0.842612, 0.8003896, -0.8904338, 0.7529412, 1, 0, 1,
-0.8397964, 0.6559768, -0.8827909, 0.7450981, 1, 0, 1,
-0.8317086, -1.146018, -2.760237, 0.7411765, 1, 0, 1,
-0.8294171, 0.11624, -3.384973, 0.7333333, 1, 0, 1,
-0.8246993, -0.9157068, -2.854172, 0.7294118, 1, 0, 1,
-0.8240649, 0.8869073, 0.6502226, 0.7215686, 1, 0, 1,
-0.8231419, -0.6938394, -2.018305, 0.7176471, 1, 0, 1,
-0.8218213, 0.4889416, 0.473471, 0.7098039, 1, 0, 1,
-0.8122907, -0.2196817, -2.495, 0.7058824, 1, 0, 1,
-0.8090519, 0.07676386, -1.90395, 0.6980392, 1, 0, 1,
-0.7891319, -2.936379, -3.987546, 0.6901961, 1, 0, 1,
-0.7841058, 0.6070787, -1.83804, 0.6862745, 1, 0, 1,
-0.7829483, 0.3528009, -1.762415, 0.6784314, 1, 0, 1,
-0.7752782, -1.391827, -1.888696, 0.6745098, 1, 0, 1,
-0.7665665, -0.5398954, -2.429096, 0.6666667, 1, 0, 1,
-0.7640486, -1.583247, -3.282671, 0.6627451, 1, 0, 1,
-0.7604371, -2.108063, -3.018151, 0.654902, 1, 0, 1,
-0.7551579, -1.645267, -2.942866, 0.6509804, 1, 0, 1,
-0.7516088, -0.6482084, -0.928729, 0.6431373, 1, 0, 1,
-0.7505517, 2.162616, 1.853919, 0.6392157, 1, 0, 1,
-0.7493086, -0.009028289, -1.441752, 0.6313726, 1, 0, 1,
-0.7482698, -1.210562, -1.55305, 0.627451, 1, 0, 1,
-0.7475078, 1.373148, -0.6354676, 0.6196079, 1, 0, 1,
-0.7412052, 0.8439258, 0.6951192, 0.6156863, 1, 0, 1,
-0.7389093, -1.959263, -2.160447, 0.6078432, 1, 0, 1,
-0.738872, -1.668325, -2.913033, 0.6039216, 1, 0, 1,
-0.7385953, -1.833018, -3.556743, 0.5960785, 1, 0, 1,
-0.7319412, -0.4690578, -2.73405, 0.5882353, 1, 0, 1,
-0.7208994, -0.01976184, -1.478227, 0.5843138, 1, 0, 1,
-0.7187377, 0.51078, -0.5950959, 0.5764706, 1, 0, 1,
-0.7156363, -0.5942203, -2.550967, 0.572549, 1, 0, 1,
-0.7131033, -1.376331, -3.123505, 0.5647059, 1, 0, 1,
-0.7122141, -2.197187, -4.230752, 0.5607843, 1, 0, 1,
-0.7121417, 0.2894813, -0.3394796, 0.5529412, 1, 0, 1,
-0.7121283, 0.5366626, -1.264529, 0.5490196, 1, 0, 1,
-0.7120517, 1.611721, 0.5892894, 0.5411765, 1, 0, 1,
-0.7101372, -0.6190499, -2.076732, 0.5372549, 1, 0, 1,
-0.709604, -0.5860234, -2.861145, 0.5294118, 1, 0, 1,
-0.7090649, -1.351116, -0.9551148, 0.5254902, 1, 0, 1,
-0.7072619, -1.09506, -2.739364, 0.5176471, 1, 0, 1,
-0.7023697, -0.2359912, -1.289289, 0.5137255, 1, 0, 1,
-0.6916987, -0.5718092, -0.9165004, 0.5058824, 1, 0, 1,
-0.6897085, -0.5860953, -3.619205, 0.5019608, 1, 0, 1,
-0.6890855, -0.06357682, -0.9113023, 0.4941176, 1, 0, 1,
-0.6872347, 1.82139, 0.9448353, 0.4862745, 1, 0, 1,
-0.6845406, -0.03965889, -1.138082, 0.4823529, 1, 0, 1,
-0.6840276, 1.55153, -1.733027, 0.4745098, 1, 0, 1,
-0.6765242, 0.7794396, 0.3828923, 0.4705882, 1, 0, 1,
-0.6762643, 0.231836, -0.1604515, 0.4627451, 1, 0, 1,
-0.6685057, -0.3060685, -0.9255006, 0.4588235, 1, 0, 1,
-0.6680245, -1.357741, -2.482748, 0.4509804, 1, 0, 1,
-0.6680049, 0.8543659, -1.66179, 0.4470588, 1, 0, 1,
-0.6674739, 1.431338, 1.110186, 0.4392157, 1, 0, 1,
-0.6665031, 0.4069545, -1.45987, 0.4352941, 1, 0, 1,
-0.6649473, -1.71737, -2.608553, 0.427451, 1, 0, 1,
-0.6643133, 1.384663, -1.604549, 0.4235294, 1, 0, 1,
-0.6630467, -0.3514895, -1.774557, 0.4156863, 1, 0, 1,
-0.6570793, 0.2730612, -1.058431, 0.4117647, 1, 0, 1,
-0.656738, 1.307826, -0.7942958, 0.4039216, 1, 0, 1,
-0.6519991, -0.09872679, -1.939992, 0.3960784, 1, 0, 1,
-0.6492912, -1.248248, -2.039079, 0.3921569, 1, 0, 1,
-0.6452595, -0.4933254, -1.165283, 0.3843137, 1, 0, 1,
-0.6425558, -0.1118591, -2.271436, 0.3803922, 1, 0, 1,
-0.6413783, 0.0997174, 0.1686954, 0.372549, 1, 0, 1,
-0.6409987, -0.9951975, -0.9726607, 0.3686275, 1, 0, 1,
-0.6399587, -0.3117644, -0.8980474, 0.3607843, 1, 0, 1,
-0.6386424, 0.01275356, -3.427657, 0.3568628, 1, 0, 1,
-0.6239121, 0.5034394, -0.792592, 0.3490196, 1, 0, 1,
-0.6178805, -1.109823, -2.633475, 0.345098, 1, 0, 1,
-0.6105607, -0.7150543, -2.231405, 0.3372549, 1, 0, 1,
-0.6104454, -0.5823497, -2.83339, 0.3333333, 1, 0, 1,
-0.6088948, -1.088734, -1.577712, 0.3254902, 1, 0, 1,
-0.6064195, 0.3825752, -0.6364449, 0.3215686, 1, 0, 1,
-0.6019715, 0.3823637, -2.359107, 0.3137255, 1, 0, 1,
-0.6011142, -1.41619, -2.885277, 0.3098039, 1, 0, 1,
-0.6002231, 1.227566, -1.132467, 0.3019608, 1, 0, 1,
-0.5979307, -0.3969389, -2.208925, 0.2941177, 1, 0, 1,
-0.5941708, 1.307468, -1.34105, 0.2901961, 1, 0, 1,
-0.5931207, -0.3221158, -2.019892, 0.282353, 1, 0, 1,
-0.5885854, 0.7865713, -1.190747, 0.2784314, 1, 0, 1,
-0.5836361, 0.100656, -0.976699, 0.2705882, 1, 0, 1,
-0.5810942, 0.515154, -0.8862761, 0.2666667, 1, 0, 1,
-0.5771875, 1.70452, 0.05508792, 0.2588235, 1, 0, 1,
-0.5734838, 0.9926494, 0.7954197, 0.254902, 1, 0, 1,
-0.56802, -0.5215653, -1.884086, 0.2470588, 1, 0, 1,
-0.5679377, -0.5592425, -2.917989, 0.2431373, 1, 0, 1,
-0.5664853, 1.586924, -0.3065017, 0.2352941, 1, 0, 1,
-0.5639881, 2.342927, -0.1326894, 0.2313726, 1, 0, 1,
-0.5580216, 0.3941004, -1.051489, 0.2235294, 1, 0, 1,
-0.5579909, -2.123791, -3.902534, 0.2196078, 1, 0, 1,
-0.5579536, -0.7844958, -2.330673, 0.2117647, 1, 0, 1,
-0.5560078, 0.1181184, -2.448139, 0.2078431, 1, 0, 1,
-0.5545693, -0.3303131, -1.856102, 0.2, 1, 0, 1,
-0.5536976, -1.334924, -2.758427, 0.1921569, 1, 0, 1,
-0.5505496, 0.1239124, -1.088918, 0.1882353, 1, 0, 1,
-0.5451488, 0.1608498, -0.7212145, 0.1803922, 1, 0, 1,
-0.5449061, 0.252466, -1.067187, 0.1764706, 1, 0, 1,
-0.5442681, -0.8389133, -4.587449, 0.1686275, 1, 0, 1,
-0.5374826, -0.642583, -2.408145, 0.1647059, 1, 0, 1,
-0.5362462, 0.5971992, -0.9987777, 0.1568628, 1, 0, 1,
-0.5293519, -2.427281, -1.631199, 0.1529412, 1, 0, 1,
-0.5277308, -0.2379157, -1.020243, 0.145098, 1, 0, 1,
-0.5265714, 1.452271, 0.7828627, 0.1411765, 1, 0, 1,
-0.5224402, -1.15656, -2.411646, 0.1333333, 1, 0, 1,
-0.5214362, -1.991136, -2.549005, 0.1294118, 1, 0, 1,
-0.516686, -1.829181, -3.075234, 0.1215686, 1, 0, 1,
-0.5161024, 1.353066, -1.526862, 0.1176471, 1, 0, 1,
-0.5143786, 0.5251831, -1.961802, 0.1098039, 1, 0, 1,
-0.5124908, -0.5324092, -1.666186, 0.1058824, 1, 0, 1,
-0.5118113, 1.274688, 0.8839574, 0.09803922, 1, 0, 1,
-0.5081784, 0.5828094, 0.4997338, 0.09019608, 1, 0, 1,
-0.5070228, -0.4619903, -0.9081484, 0.08627451, 1, 0, 1,
-0.5065592, 0.2816473, -0.1996202, 0.07843138, 1, 0, 1,
-0.4935889, -0.4193252, -0.9581549, 0.07450981, 1, 0, 1,
-0.4898746, -0.326926, -2.189235, 0.06666667, 1, 0, 1,
-0.4875949, -0.07864261, -3.583044, 0.0627451, 1, 0, 1,
-0.4854892, 0.3755378, -1.622593, 0.05490196, 1, 0, 1,
-0.4814805, 0.8167325, -0.285542, 0.05098039, 1, 0, 1,
-0.477172, -1.067013, -3.173323, 0.04313726, 1, 0, 1,
-0.4771082, 0.5852086, -0.2605483, 0.03921569, 1, 0, 1,
-0.4761943, -0.8556058, -3.473359, 0.03137255, 1, 0, 1,
-0.4706583, 2.657709, 0.3755482, 0.02745098, 1, 0, 1,
-0.4700615, 0.6294149, -1.129849, 0.01960784, 1, 0, 1,
-0.4682651, -0.3597493, -1.972064, 0.01568628, 1, 0, 1,
-0.4638671, -2.359255, -2.770262, 0.007843138, 1, 0, 1,
-0.4619847, 0.7669716, 0.2638061, 0.003921569, 1, 0, 1,
-0.460701, 1.346579, 0.8776311, 0, 1, 0.003921569, 1,
-0.4567243, -2.090589, -1.516165, 0, 1, 0.01176471, 1,
-0.4563318, -0.7313582, -3.397517, 0, 1, 0.01568628, 1,
-0.4545752, 1.597078, -1.369311, 0, 1, 0.02352941, 1,
-0.4525369, 0.5420086, -0.3399753, 0, 1, 0.02745098, 1,
-0.4508283, -0.7095281, -3.368452, 0, 1, 0.03529412, 1,
-0.447998, -0.4874419, -1.785395, 0, 1, 0.03921569, 1,
-0.4474143, 0.4860142, -2.937923, 0, 1, 0.04705882, 1,
-0.4314618, 0.2522675, -0.6952879, 0, 1, 0.05098039, 1,
-0.4287547, 0.171067, -0.6640202, 0, 1, 0.05882353, 1,
-0.4238791, 1.123828, -0.5934982, 0, 1, 0.0627451, 1,
-0.4178652, 1.78376, 0.4009294, 0, 1, 0.07058824, 1,
-0.4158035, 0.6920679, -2.237121, 0, 1, 0.07450981, 1,
-0.4152186, 1.181492, -1.259672, 0, 1, 0.08235294, 1,
-0.4146655, 0.6659358, -0.356432, 0, 1, 0.08627451, 1,
-0.4112332, 1.23966, -1.195343, 0, 1, 0.09411765, 1,
-0.4109335, -0.3217231, -2.040315, 0, 1, 0.1019608, 1,
-0.410858, -1.085045, -2.885936, 0, 1, 0.1058824, 1,
-0.4098143, -0.4445871, -1.87872, 0, 1, 0.1137255, 1,
-0.4086093, 1.959663, -0.2753361, 0, 1, 0.1176471, 1,
-0.407197, -1.101878, -1.790408, 0, 1, 0.1254902, 1,
-0.3999812, 0.8269788, 0.2533504, 0, 1, 0.1294118, 1,
-0.3996146, 0.3518505, -0.4180627, 0, 1, 0.1372549, 1,
-0.3989024, -0.7827645, -5.252433, 0, 1, 0.1411765, 1,
-0.3984909, -1.198651, -1.506169, 0, 1, 0.1490196, 1,
-0.3978648, 1.939531, 2.012205, 0, 1, 0.1529412, 1,
-0.3972395, -1.447456, -1.916106, 0, 1, 0.1607843, 1,
-0.3954098, 0.227521, 1.788197, 0, 1, 0.1647059, 1,
-0.3951102, 1.342524, -0.5045245, 0, 1, 0.172549, 1,
-0.3930416, -0.02034863, -2.147589, 0, 1, 0.1764706, 1,
-0.3815594, 0.9280791, -0.1911248, 0, 1, 0.1843137, 1,
-0.3803436, -0.1664313, -1.319838, 0, 1, 0.1882353, 1,
-0.3767551, 1.717856, -0.325245, 0, 1, 0.1960784, 1,
-0.3672195, -0.3465309, -1.525895, 0, 1, 0.2039216, 1,
-0.3651022, 0.4586261, 0.0482657, 0, 1, 0.2078431, 1,
-0.3583542, 0.4066612, -1.786383, 0, 1, 0.2156863, 1,
-0.35707, -0.4859163, -0.7217962, 0, 1, 0.2196078, 1,
-0.3537386, 2.546658, -0.6253113, 0, 1, 0.227451, 1,
-0.3499188, 0.6183321, -0.1828008, 0, 1, 0.2313726, 1,
-0.3481895, 0.10742, -0.4825935, 0, 1, 0.2392157, 1,
-0.3421858, -0.07584389, -1.493867, 0, 1, 0.2431373, 1,
-0.3392913, -1.063349, -4.638199, 0, 1, 0.2509804, 1,
-0.3382833, -1.405579, -4.160364, 0, 1, 0.254902, 1,
-0.3358105, 0.2031944, -0.3455798, 0, 1, 0.2627451, 1,
-0.3355798, 0.222107, -0.2203166, 0, 1, 0.2666667, 1,
-0.334566, -0.1051866, -3.442023, 0, 1, 0.2745098, 1,
-0.3290997, 0.9993147, 1.041467, 0, 1, 0.2784314, 1,
-0.3220848, -0.5827726, -3.295575, 0, 1, 0.2862745, 1,
-0.3199936, -0.1587456, -3.200604, 0, 1, 0.2901961, 1,
-0.3196226, -2.005563, -3.477628, 0, 1, 0.2980392, 1,
-0.318482, 0.41408, -1.792873, 0, 1, 0.3058824, 1,
-0.3175777, -0.968362, -3.901661, 0, 1, 0.3098039, 1,
-0.3160184, 1.124876, -0.2686599, 0, 1, 0.3176471, 1,
-0.3120966, 1.620065, 0.5257847, 0, 1, 0.3215686, 1,
-0.3116866, -0.9439097, -2.718951, 0, 1, 0.3294118, 1,
-0.3115316, 0.3359911, 1.364309, 0, 1, 0.3333333, 1,
-0.3107985, 0.1206675, -1.039592, 0, 1, 0.3411765, 1,
-0.3067386, 0.950816, 0.7757465, 0, 1, 0.345098, 1,
-0.3029775, 1.92323, -0.618564, 0, 1, 0.3529412, 1,
-0.3026243, -0.5564631, -4.071891, 0, 1, 0.3568628, 1,
-0.2986945, -0.3461151, -2.886861, 0, 1, 0.3647059, 1,
-0.2960461, 0.910235, -0.5012971, 0, 1, 0.3686275, 1,
-0.2942406, 1.431517, 0.1171646, 0, 1, 0.3764706, 1,
-0.2921817, -1.335598, -1.390547, 0, 1, 0.3803922, 1,
-0.2911934, -0.02504097, -2.949546, 0, 1, 0.3882353, 1,
-0.2911269, -1.028875, -3.618036, 0, 1, 0.3921569, 1,
-0.2864483, 0.286195, -1.452112, 0, 1, 0.4, 1,
-0.2850565, -0.750181, -0.8297433, 0, 1, 0.4078431, 1,
-0.2825188, -0.9937583, -2.005229, 0, 1, 0.4117647, 1,
-0.279034, 0.3571103, 0.1215914, 0, 1, 0.4196078, 1,
-0.278243, -0.7063869, -3.75192, 0, 1, 0.4235294, 1,
-0.2752426, 1.188603, 0.6330818, 0, 1, 0.4313726, 1,
-0.2703497, 0.8788784, -1.498734, 0, 1, 0.4352941, 1,
-0.2688201, 0.9308195, 1.231345, 0, 1, 0.4431373, 1,
-0.2633924, 0.7376627, -0.3732497, 0, 1, 0.4470588, 1,
-0.260013, 0.7885105, 0.7146932, 0, 1, 0.454902, 1,
-0.2594537, -0.1618793, -0.4900724, 0, 1, 0.4588235, 1,
-0.2587865, 1.030754, -0.2651331, 0, 1, 0.4666667, 1,
-0.2547638, 0.0995562, -0.9460476, 0, 1, 0.4705882, 1,
-0.251301, 2.295831, -1.09934, 0, 1, 0.4784314, 1,
-0.2467453, 0.1274786, -0.9782445, 0, 1, 0.4823529, 1,
-0.2441358, -1.905104, -2.63593, 0, 1, 0.4901961, 1,
-0.2440323, -0.2016786, -3.80261, 0, 1, 0.4941176, 1,
-0.2431912, 0.1419717, -0.8140964, 0, 1, 0.5019608, 1,
-0.2422169, -0.9134246, -2.498284, 0, 1, 0.509804, 1,
-0.241176, -0.3361659, -1.999461, 0, 1, 0.5137255, 1,
-0.2354354, -1.547385, -2.406132, 0, 1, 0.5215687, 1,
-0.2285028, 1.427013, -0.4557762, 0, 1, 0.5254902, 1,
-0.2236043, -2.019088, -3.65787, 0, 1, 0.5333334, 1,
-0.2213887, 0.8354055, 1.264792, 0, 1, 0.5372549, 1,
-0.2157639, 1.055137, -0.3226968, 0, 1, 0.5450981, 1,
-0.2155875, 0.7446557, -0.9649183, 0, 1, 0.5490196, 1,
-0.2155085, -0.07307837, -2.082099, 0, 1, 0.5568628, 1,
-0.2143787, -0.07437929, -1.981419, 0, 1, 0.5607843, 1,
-0.2036857, 0.9585513, -1.347341, 0, 1, 0.5686275, 1,
-0.2000848, 0.4288139, 0.5241755, 0, 1, 0.572549, 1,
-0.1987607, 1.291696, -0.1327036, 0, 1, 0.5803922, 1,
-0.1966095, 0.3114228, -1.243104, 0, 1, 0.5843138, 1,
-0.1931243, -1.289713, -3.117911, 0, 1, 0.5921569, 1,
-0.1908184, 0.9837462, 0.1948267, 0, 1, 0.5960785, 1,
-0.1897418, 0.5923935, -0.2039427, 0, 1, 0.6039216, 1,
-0.1878076, 1.301001, 0.8781844, 0, 1, 0.6117647, 1,
-0.1877905, -1.084123, -2.120688, 0, 1, 0.6156863, 1,
-0.1858418, -1.121036, -2.537447, 0, 1, 0.6235294, 1,
-0.185245, 1.322804, -0.03038551, 0, 1, 0.627451, 1,
-0.1847976, 0.6497247, 0.03283678, 0, 1, 0.6352941, 1,
-0.1784384, 0.5652425, 0.293052, 0, 1, 0.6392157, 1,
-0.1668499, 0.4738023, -0.8596795, 0, 1, 0.6470588, 1,
-0.1654896, -0.2620267, -2.66231, 0, 1, 0.6509804, 1,
-0.1643822, 0.02881342, -0.8116452, 0, 1, 0.6588235, 1,
-0.1639821, -1.472735, -2.304278, 0, 1, 0.6627451, 1,
-0.1629864, 1.359676, 0.9179268, 0, 1, 0.6705883, 1,
-0.1614683, -0.204959, -1.185433, 0, 1, 0.6745098, 1,
-0.1607555, 0.8334306, -2.05456, 0, 1, 0.682353, 1,
-0.1541902, 2.066235, -0.8196974, 0, 1, 0.6862745, 1,
-0.1535381, -1.553336, -4.089798, 0, 1, 0.6941177, 1,
-0.1534977, -0.3421864, -2.967392, 0, 1, 0.7019608, 1,
-0.1531538, 1.183125, -0.8581421, 0, 1, 0.7058824, 1,
-0.1472845, 2.520714, 0.3244332, 0, 1, 0.7137255, 1,
-0.1468245, -0.7179548, -3.110142, 0, 1, 0.7176471, 1,
-0.1423316, 0.1810291, -0.04137604, 0, 1, 0.7254902, 1,
-0.1411134, -0.06850669, -0.6178096, 0, 1, 0.7294118, 1,
-0.1389424, -0.5477492, -3.011747, 0, 1, 0.7372549, 1,
-0.1370537, -1.883605, -3.49128, 0, 1, 0.7411765, 1,
-0.136222, -0.4215996, -2.71679, 0, 1, 0.7490196, 1,
-0.1356822, -0.6929618, -0.1837728, 0, 1, 0.7529412, 1,
-0.1315097, -0.7129475, -3.622559, 0, 1, 0.7607843, 1,
-0.1312709, 0.4688024, -0.5594859, 0, 1, 0.7647059, 1,
-0.1280891, 1.676357, -0.2657429, 0, 1, 0.772549, 1,
-0.1274692, 0.7029058, -0.7368041, 0, 1, 0.7764706, 1,
-0.125274, 1.42339, -0.4634357, 0, 1, 0.7843137, 1,
-0.1223156, 0.325409, 0.2502449, 0, 1, 0.7882353, 1,
-0.1211989, -0.2511248, -1.885786, 0, 1, 0.7960784, 1,
-0.1171379, -0.9599125, -3.742765, 0, 1, 0.8039216, 1,
-0.114862, 0.5291901, 0.9942583, 0, 1, 0.8078431, 1,
-0.1128755, -0.9153214, -2.708414, 0, 1, 0.8156863, 1,
-0.1113408, 2.089864, -1.127554, 0, 1, 0.8196079, 1,
-0.1106687, -2.242883, -3.210654, 0, 1, 0.827451, 1,
-0.1083011, 1.495847, -1.302233, 0, 1, 0.8313726, 1,
-0.1058155, -0.7991969, -2.625972, 0, 1, 0.8392157, 1,
-0.1023443, -0.3417802, -1.815579, 0, 1, 0.8431373, 1,
-0.1016218, 0.6443184, 0.7358271, 0, 1, 0.8509804, 1,
-0.09542184, 0.9907608, 0.7159683, 0, 1, 0.854902, 1,
-0.09523711, 0.4020404, 0.3227676, 0, 1, 0.8627451, 1,
-0.08988588, 0.3307315, -1.6086, 0, 1, 0.8666667, 1,
-0.08473125, 0.5086583, 0.4337081, 0, 1, 0.8745098, 1,
-0.0770288, -0.9502888, -3.530422, 0, 1, 0.8784314, 1,
-0.0731356, 0.7759063, -0.7986803, 0, 1, 0.8862745, 1,
-0.07149892, 1.534023, -1.930673, 0, 1, 0.8901961, 1,
-0.07125108, 2.178726, -0.8875608, 0, 1, 0.8980392, 1,
-0.07115953, 0.3293504, 1.067564, 0, 1, 0.9058824, 1,
-0.07100247, 1.698357, 0.9065203, 0, 1, 0.9098039, 1,
-0.07073732, 0.2041574, 0.6981275, 0, 1, 0.9176471, 1,
-0.06285319, 0.422294, 0.2202234, 0, 1, 0.9215686, 1,
-0.06193472, 1.342221, -0.7774132, 0, 1, 0.9294118, 1,
-0.06040821, 0.2529571, -1.081197, 0, 1, 0.9333333, 1,
-0.05647071, -2.803037, -4.465529, 0, 1, 0.9411765, 1,
-0.05535587, 0.1970769, 0.2677936, 0, 1, 0.945098, 1,
-0.05404553, -1.067738, -2.589547, 0, 1, 0.9529412, 1,
-0.05038421, -1.144545, -3.627152, 0, 1, 0.9568627, 1,
-0.050344, 0.557639, 0.2474914, 0, 1, 0.9647059, 1,
-0.04946951, -2.627773, -1.677402, 0, 1, 0.9686275, 1,
-0.04768486, 0.5149311, -1.414958, 0, 1, 0.9764706, 1,
-0.04701667, -0.0204512, -1.734127, 0, 1, 0.9803922, 1,
-0.04572143, 0.6231408, 0.2221519, 0, 1, 0.9882353, 1,
-0.04551034, 1.771986, -0.4724108, 0, 1, 0.9921569, 1,
-0.04524679, -0.3762209, -2.135925, 0, 1, 1, 1,
-0.04448379, -0.8943889, -4.33886, 0, 0.9921569, 1, 1,
-0.04239164, 0.5464174, 0.4932054, 0, 0.9882353, 1, 1,
-0.03998588, -1.132228, -4.025131, 0, 0.9803922, 1, 1,
-0.03515027, -1.670449, -2.010329, 0, 0.9764706, 1, 1,
-0.033309, -0.7961758, -4.666808, 0, 0.9686275, 1, 1,
-0.03081341, 0.3375231, -1.164171, 0, 0.9647059, 1, 1,
-0.03027198, -0.1870599, -3.609161, 0, 0.9568627, 1, 1,
-0.03014143, -0.07215907, -3.590694, 0, 0.9529412, 1, 1,
-0.03008557, 0.3038351, -0.6487222, 0, 0.945098, 1, 1,
-0.02302017, 0.3577298, -0.2635975, 0, 0.9411765, 1, 1,
-0.02238847, 1.23093, 0.6255527, 0, 0.9333333, 1, 1,
-0.02159239, -0.4347215, -2.415368, 0, 0.9294118, 1, 1,
-0.01939213, 0.3586313, -0.1470493, 0, 0.9215686, 1, 1,
-0.01585633, 0.9973975, 0.3420998, 0, 0.9176471, 1, 1,
-0.01305274, -2.802856, -3.092212, 0, 0.9098039, 1, 1,
-0.01232806, 1.664081, -0.6871311, 0, 0.9058824, 1, 1,
-0.01138768, 0.6986265, 1.920027, 0, 0.8980392, 1, 1,
-0.01099271, 0.2198951, 0.3014482, 0, 0.8901961, 1, 1,
-0.009457988, 0.3767633, 1.228294, 0, 0.8862745, 1, 1,
-0.00685791, -0.9433563, -4.706592, 0, 0.8784314, 1, 1,
-0.004280649, -0.7217451, -2.949192, 0, 0.8745098, 1, 1,
-0.003836622, 0.094394, -0.4624885, 0, 0.8666667, 1, 1,
0.002310622, 0.7370633, 0.9120336, 0, 0.8627451, 1, 1,
0.002882842, -0.8419505, 4.167188, 0, 0.854902, 1, 1,
0.003436117, -0.3416923, 2.242911, 0, 0.8509804, 1, 1,
0.005644069, 1.108037, -0.05682808, 0, 0.8431373, 1, 1,
0.005954067, 0.4413913, 0.1961177, 0, 0.8392157, 1, 1,
0.009244704, -0.2888095, 4.66737, 0, 0.8313726, 1, 1,
0.01092146, 0.5828842, -0.1472827, 0, 0.827451, 1, 1,
0.01841254, 0.8477381, -1.777539, 0, 0.8196079, 1, 1,
0.03244605, -0.4047742, 2.503189, 0, 0.8156863, 1, 1,
0.03747135, 1.472438, 1.987152, 0, 0.8078431, 1, 1,
0.04038497, 0.6690075, -0.157262, 0, 0.8039216, 1, 1,
0.04070704, -0.434693, 3.40973, 0, 0.7960784, 1, 1,
0.04360308, -2.808276, 3.482048, 0, 0.7882353, 1, 1,
0.04535636, 0.2561354, -0.1494907, 0, 0.7843137, 1, 1,
0.04868858, -0.2240486, 3.092205, 0, 0.7764706, 1, 1,
0.05331831, -0.06941892, 3.356899, 0, 0.772549, 1, 1,
0.05557986, -1.138609, 4.138047, 0, 0.7647059, 1, 1,
0.05744258, -0.6447358, 2.52722, 0, 0.7607843, 1, 1,
0.06007994, 1.095673, 0.8048091, 0, 0.7529412, 1, 1,
0.06382878, 0.5412859, 0.6883753, 0, 0.7490196, 1, 1,
0.0665479, 0.4938684, 0.4670476, 0, 0.7411765, 1, 1,
0.06892167, -0.8324858, 2.926022, 0, 0.7372549, 1, 1,
0.06983081, 0.4747948, -0.7077682, 0, 0.7294118, 1, 1,
0.06988058, -0.05507364, 2.410603, 0, 0.7254902, 1, 1,
0.07240021, -0.1464695, 3.783994, 0, 0.7176471, 1, 1,
0.07330366, -0.2163185, 1.450284, 0, 0.7137255, 1, 1,
0.07469013, 0.2113242, -0.1998641, 0, 0.7058824, 1, 1,
0.07478913, -0.4192819, 1.813998, 0, 0.6980392, 1, 1,
0.07483704, 0.02620731, 2.253374, 0, 0.6941177, 1, 1,
0.077388, 1.236023, 0.04887717, 0, 0.6862745, 1, 1,
0.08047195, 0.4339803, -0.2053749, 0, 0.682353, 1, 1,
0.08520174, 0.9117893, 0.1823484, 0, 0.6745098, 1, 1,
0.08598146, 0.33824, -0.289358, 0, 0.6705883, 1, 1,
0.08790482, 0.1087392, -0.0274695, 0, 0.6627451, 1, 1,
0.08813525, 0.9653819, 0.2101993, 0, 0.6588235, 1, 1,
0.09214217, 0.1376934, 1.919242, 0, 0.6509804, 1, 1,
0.09237397, -0.747151, 1.681425, 0, 0.6470588, 1, 1,
0.09292518, -0.9678949, 0.4617873, 0, 0.6392157, 1, 1,
0.09667126, 0.07420523, -0.8311764, 0, 0.6352941, 1, 1,
0.09876949, -0.3385537, 1.703745, 0, 0.627451, 1, 1,
0.1024358, 1.308764, -0.042831, 0, 0.6235294, 1, 1,
0.1041367, -1.028313, 3.042537, 0, 0.6156863, 1, 1,
0.1165883, -0.2352419, 3.803008, 0, 0.6117647, 1, 1,
0.1166044, -0.9754209, 0.4878718, 0, 0.6039216, 1, 1,
0.116668, -0.7709914, 3.417572, 0, 0.5960785, 1, 1,
0.1178589, -1.270156, 3.305129, 0, 0.5921569, 1, 1,
0.1216201, 0.03426072, 1.155724, 0, 0.5843138, 1, 1,
0.1232634, 0.5821935, -2.130941, 0, 0.5803922, 1, 1,
0.1235127, 1.316937, 0.5679224, 0, 0.572549, 1, 1,
0.1236627, -0.946211, 2.641651, 0, 0.5686275, 1, 1,
0.1288716, 0.1841402, 1.691458, 0, 0.5607843, 1, 1,
0.1305543, -2.730968, 3.992901, 0, 0.5568628, 1, 1,
0.1312225, 1.345408, -1.033179, 0, 0.5490196, 1, 1,
0.1333322, -0.8523505, 2.624045, 0, 0.5450981, 1, 1,
0.1340572, -0.9138521, 2.818846, 0, 0.5372549, 1, 1,
0.1406702, 0.4704828, -0.4793763, 0, 0.5333334, 1, 1,
0.1425415, -0.4498749, 1.416667, 0, 0.5254902, 1, 1,
0.143158, 0.2044834, 0.5614855, 0, 0.5215687, 1, 1,
0.1499603, 0.7585133, -1.129128, 0, 0.5137255, 1, 1,
0.1504231, 1.76084, 1.183865, 0, 0.509804, 1, 1,
0.1523024, 0.5138658, -1.505212, 0, 0.5019608, 1, 1,
0.1557877, 1.133045, 0.2880055, 0, 0.4941176, 1, 1,
0.1571796, 0.5889171, 0.2322379, 0, 0.4901961, 1, 1,
0.160696, -0.8656928, 2.990141, 0, 0.4823529, 1, 1,
0.1623957, -2.729535, 3.429535, 0, 0.4784314, 1, 1,
0.1644818, -0.01634063, 2.175116, 0, 0.4705882, 1, 1,
0.1741028, 0.1119434, 2.554564, 0, 0.4666667, 1, 1,
0.1748552, -1.485634, 3.299737, 0, 0.4588235, 1, 1,
0.1760886, -1.061647, 3.041591, 0, 0.454902, 1, 1,
0.1768826, -0.9877985, 2.143414, 0, 0.4470588, 1, 1,
0.1772823, -1.019217, 2.648996, 0, 0.4431373, 1, 1,
0.1777357, -0.1505622, 2.218317, 0, 0.4352941, 1, 1,
0.1793001, -0.08744841, 3.454237, 0, 0.4313726, 1, 1,
0.1793193, 0.2990862, 1.705408, 0, 0.4235294, 1, 1,
0.1824715, -1.316648, 2.116276, 0, 0.4196078, 1, 1,
0.1829378, -0.7412149, 1.537975, 0, 0.4117647, 1, 1,
0.1833327, -0.7556287, 2.726714, 0, 0.4078431, 1, 1,
0.1839048, 1.41896, 0.6828302, 0, 0.4, 1, 1,
0.1848833, 2.143202, -1.52584, 0, 0.3921569, 1, 1,
0.1984502, 1.560621, -0.4468229, 0, 0.3882353, 1, 1,
0.1996865, 2.002366, 0.6514801, 0, 0.3803922, 1, 1,
0.1998209, -1.48742, 4.335317, 0, 0.3764706, 1, 1,
0.201139, -0.3460215, 2.995894, 0, 0.3686275, 1, 1,
0.2028955, -0.1225624, 1.683748, 0, 0.3647059, 1, 1,
0.2044207, 0.2359964, 0.4568237, 0, 0.3568628, 1, 1,
0.2134348, -0.493723, 3.498726, 0, 0.3529412, 1, 1,
0.2150464, -1.037396, 4.252978, 0, 0.345098, 1, 1,
0.2156463, 0.2560407, -2.015234, 0, 0.3411765, 1, 1,
0.2160268, -1.280863, 3.534849, 0, 0.3333333, 1, 1,
0.2165103, -0.3535885, 4.391845, 0, 0.3294118, 1, 1,
0.2175208, -1.157171, 3.089918, 0, 0.3215686, 1, 1,
0.2181537, -1.941748, 2.508079, 0, 0.3176471, 1, 1,
0.2249946, 0.8098155, 0.643504, 0, 0.3098039, 1, 1,
0.2262539, -0.837939, 2.081103, 0, 0.3058824, 1, 1,
0.2270571, 1.312935, -0.6675971, 0, 0.2980392, 1, 1,
0.2279631, 1.637045, 0.6693824, 0, 0.2901961, 1, 1,
0.2282899, -1.15692, 2.436695, 0, 0.2862745, 1, 1,
0.2309761, -0.1429654, 3.0302, 0, 0.2784314, 1, 1,
0.2369568, -1.381972, 5.737142, 0, 0.2745098, 1, 1,
0.2370906, -0.4308589, 2.761517, 0, 0.2666667, 1, 1,
0.2390715, -1.330762, 2.877721, 0, 0.2627451, 1, 1,
0.240754, -0.8346033, 3.760003, 0, 0.254902, 1, 1,
0.2424446, -0.5121151, -0.5404463, 0, 0.2509804, 1, 1,
0.2437888, 0.046356, 2.886871, 0, 0.2431373, 1, 1,
0.2533201, 0.1497711, -0.1808311, 0, 0.2392157, 1, 1,
0.2579729, 0.9932747, 0.08661609, 0, 0.2313726, 1, 1,
0.2587351, -0.7861048, 4.214394, 0, 0.227451, 1, 1,
0.2612785, -0.1693132, 2.93663, 0, 0.2196078, 1, 1,
0.2658191, 0.7162735, 0.3076339, 0, 0.2156863, 1, 1,
0.2679868, -0.02768955, 3.713816, 0, 0.2078431, 1, 1,
0.2680092, 2.127869, -0.1902182, 0, 0.2039216, 1, 1,
0.2703469, -0.274138, 4.504072, 0, 0.1960784, 1, 1,
0.2753067, 0.4983677, 0.5126403, 0, 0.1882353, 1, 1,
0.2754275, -0.6768087, 3.141026, 0, 0.1843137, 1, 1,
0.2767999, -0.5124388, 1.503741, 0, 0.1764706, 1, 1,
0.2782389, -1.544567, 2.442223, 0, 0.172549, 1, 1,
0.2816513, -1.680494, 2.650696, 0, 0.1647059, 1, 1,
0.2826928, -0.9843724, 1.821035, 0, 0.1607843, 1, 1,
0.2845783, 0.3249718, -0.5293112, 0, 0.1529412, 1, 1,
0.2930629, -0.7989123, 3.113889, 0, 0.1490196, 1, 1,
0.2950726, 1.278409, -1.02128, 0, 0.1411765, 1, 1,
0.2952698, -0.09721447, 2.450434, 0, 0.1372549, 1, 1,
0.3040058, 1.212651, -0.4565769, 0, 0.1294118, 1, 1,
0.3099449, 0.7124063, 0.1548496, 0, 0.1254902, 1, 1,
0.3114497, -0.4262639, 1.449963, 0, 0.1176471, 1, 1,
0.3130306, -0.3711441, 3.56248, 0, 0.1137255, 1, 1,
0.3145244, -0.5939608, 1.810995, 0, 0.1058824, 1, 1,
0.3154577, -1.628026, 1.151797, 0, 0.09803922, 1, 1,
0.324157, -0.2220856, 2.359375, 0, 0.09411765, 1, 1,
0.3241906, 0.5211367, 0.770189, 0, 0.08627451, 1, 1,
0.3276847, -0.1816145, 2.558129, 0, 0.08235294, 1, 1,
0.3277333, 0.6651391, 1.365541, 0, 0.07450981, 1, 1,
0.3288429, 0.8810691, 0.008194653, 0, 0.07058824, 1, 1,
0.3357986, -0.06239462, 2.682322, 0, 0.0627451, 1, 1,
0.3381041, 0.8251368, 1.941321, 0, 0.05882353, 1, 1,
0.3402581, -0.4680364, 3.336439, 0, 0.05098039, 1, 1,
0.3442089, 1.03671, 2.108539, 0, 0.04705882, 1, 1,
0.3468979, 0.3564505, 0.967768, 0, 0.03921569, 1, 1,
0.3535617, -2.296662, 3.841571, 0, 0.03529412, 1, 1,
0.3604347, 0.8422148, 0.200299, 0, 0.02745098, 1, 1,
0.3627706, 0.4336505, 0.06211183, 0, 0.02352941, 1, 1,
0.3632865, 0.3372401, -0.1288472, 0, 0.01568628, 1, 1,
0.3637471, -0.07439911, 0.1187456, 0, 0.01176471, 1, 1,
0.3696696, -0.2483078, 2.551491, 0, 0.003921569, 1, 1,
0.3704873, -0.4667652, 3.924849, 0.003921569, 0, 1, 1,
0.372199, -0.07001099, 0.9009123, 0.007843138, 0, 1, 1,
0.372625, 0.008314961, 1.679196, 0.01568628, 0, 1, 1,
0.3728211, -0.3313463, 1.197015, 0.01960784, 0, 1, 1,
0.3792111, 0.09800259, 0.8249848, 0.02745098, 0, 1, 1,
0.3815566, -0.4602241, 1.198308, 0.03137255, 0, 1, 1,
0.3867595, 0.8167108, 0.2418939, 0.03921569, 0, 1, 1,
0.3875652, -1.927185, 4.055424, 0.04313726, 0, 1, 1,
0.3881734, -0.7962393, 1.804106, 0.05098039, 0, 1, 1,
0.3901514, -1.456768, 2.304405, 0.05490196, 0, 1, 1,
0.3903468, 1.590818, -0.3642136, 0.0627451, 0, 1, 1,
0.3999714, -0.5662037, 1.442882, 0.06666667, 0, 1, 1,
0.4017636, 0.6557032, -1.319257, 0.07450981, 0, 1, 1,
0.4066184, -0.2168738, 3.362756, 0.07843138, 0, 1, 1,
0.4099078, 0.3781658, -1.123049, 0.08627451, 0, 1, 1,
0.410424, -0.1562967, 1.665937, 0.09019608, 0, 1, 1,
0.4173875, 0.6320339, 0.9120173, 0.09803922, 0, 1, 1,
0.4196577, -1.831154, 2.332828, 0.1058824, 0, 1, 1,
0.4251751, 0.1680701, 2.28668, 0.1098039, 0, 1, 1,
0.4282279, 0.695812, 2.36208, 0.1176471, 0, 1, 1,
0.4291399, -0.1048228, 2.700853, 0.1215686, 0, 1, 1,
0.4313616, 0.1719614, 0.8928818, 0.1294118, 0, 1, 1,
0.4318775, 1.685732, 1.285787, 0.1333333, 0, 1, 1,
0.4402243, -0.4054562, 1.572728, 0.1411765, 0, 1, 1,
0.4410699, -1.661229, 4.294509, 0.145098, 0, 1, 1,
0.4421557, 1.003399, 1.104697, 0.1529412, 0, 1, 1,
0.4436368, 0.9812847, -0.4007224, 0.1568628, 0, 1, 1,
0.4458246, -1.86827, 3.145429, 0.1647059, 0, 1, 1,
0.4473113, 0.123991, 0.5174739, 0.1686275, 0, 1, 1,
0.4484635, 0.7440324, -1.281231, 0.1764706, 0, 1, 1,
0.4491569, -0.01105833, 1.076493, 0.1803922, 0, 1, 1,
0.4526718, -1.07172, 2.217985, 0.1882353, 0, 1, 1,
0.4603432, -1.855495, 2.744028, 0.1921569, 0, 1, 1,
0.4651842, 0.1892838, 3.039311, 0.2, 0, 1, 1,
0.4702598, -0.4494361, -0.139888, 0.2078431, 0, 1, 1,
0.4727823, 0.4031886, 0.4199399, 0.2117647, 0, 1, 1,
0.4740951, -0.6888146, 0.6084965, 0.2196078, 0, 1, 1,
0.4776986, -0.9958987, 2.597917, 0.2235294, 0, 1, 1,
0.4777718, 0.1885016, 0.00972139, 0.2313726, 0, 1, 1,
0.481085, 0.06145824, 1.278449, 0.2352941, 0, 1, 1,
0.4836953, -0.05098729, 1.850834, 0.2431373, 0, 1, 1,
0.4847998, -0.933592, 1.834162, 0.2470588, 0, 1, 1,
0.4856422, 0.2538868, 2.953926, 0.254902, 0, 1, 1,
0.4902798, 0.4105869, 0.4804252, 0.2588235, 0, 1, 1,
0.4976203, -1.121373, 1.809373, 0.2666667, 0, 1, 1,
0.4985008, -0.2267822, 1.301979, 0.2705882, 0, 1, 1,
0.5054387, 1.192871, -0.172808, 0.2784314, 0, 1, 1,
0.5083014, 0.4357625, 1.222572, 0.282353, 0, 1, 1,
0.508812, -0.2777448, 2.456981, 0.2901961, 0, 1, 1,
0.51224, -1.24803, 3.0889, 0.2941177, 0, 1, 1,
0.5147803, 0.02909259, 2.994778, 0.3019608, 0, 1, 1,
0.5199222, 2.905405, 1.600211, 0.3098039, 0, 1, 1,
0.521109, 1.327882, 0.2940604, 0.3137255, 0, 1, 1,
0.5325416, 1.556109, -0.3616618, 0.3215686, 0, 1, 1,
0.5334105, -0.8156737, 2.634256, 0.3254902, 0, 1, 1,
0.5457814, -1.076117, 2.192257, 0.3333333, 0, 1, 1,
0.5460323, 2.783359, 0.3555846, 0.3372549, 0, 1, 1,
0.5471943, 0.3614976, 1.884007, 0.345098, 0, 1, 1,
0.5477587, -0.4473619, 1.943206, 0.3490196, 0, 1, 1,
0.549468, -0.03939549, 2.870003, 0.3568628, 0, 1, 1,
0.55338, 1.069299, 0.4646401, 0.3607843, 0, 1, 1,
0.5607349, -1.527338, 4.171662, 0.3686275, 0, 1, 1,
0.5611482, -0.6420149, 2.237495, 0.372549, 0, 1, 1,
0.5626886, -0.6177124, 3.074538, 0.3803922, 0, 1, 1,
0.5644212, -0.3453273, 2.70383, 0.3843137, 0, 1, 1,
0.5698991, 0.2678699, 1.956865, 0.3921569, 0, 1, 1,
0.5707099, -0.8779615, 1.695086, 0.3960784, 0, 1, 1,
0.5756478, 0.6005515, 1.680379, 0.4039216, 0, 1, 1,
0.5805336, 1.034981, 1.415879, 0.4117647, 0, 1, 1,
0.5876629, 0.1259542, 0.8665606, 0.4156863, 0, 1, 1,
0.588537, 0.461979, 1.178044, 0.4235294, 0, 1, 1,
0.5896454, 2.119734, 0.3479515, 0.427451, 0, 1, 1,
0.5938241, 1.314006, 0.9351012, 0.4352941, 0, 1, 1,
0.596278, 1.091584, -0.09370348, 0.4392157, 0, 1, 1,
0.6046388, 0.1694863, 0.2705995, 0.4470588, 0, 1, 1,
0.6107896, -1.182738, 2.452113, 0.4509804, 0, 1, 1,
0.6115972, 0.2565746, 1.65854, 0.4588235, 0, 1, 1,
0.6220657, 0.7873437, 0.7001867, 0.4627451, 0, 1, 1,
0.6270275, 1.005922, 2.105151, 0.4705882, 0, 1, 1,
0.6367185, -1.846107, 4.192626, 0.4745098, 0, 1, 1,
0.6378241, -1.448212, 3.082901, 0.4823529, 0, 1, 1,
0.6385189, 1.535988, 0.9258857, 0.4862745, 0, 1, 1,
0.6394435, 2.078863, -0.1127842, 0.4941176, 0, 1, 1,
0.641689, 0.7085727, 1.446181, 0.5019608, 0, 1, 1,
0.6439916, 1.119379, 0.7811944, 0.5058824, 0, 1, 1,
0.6448704, -1.091885, 2.200434, 0.5137255, 0, 1, 1,
0.6481308, 0.6452945, 0.6896194, 0.5176471, 0, 1, 1,
0.650982, 2.067874, 1.080842, 0.5254902, 0, 1, 1,
0.651992, 0.1384014, 1.538992, 0.5294118, 0, 1, 1,
0.6634113, -0.1879085, 1.282364, 0.5372549, 0, 1, 1,
0.6634529, -0.1556757, 1.928427, 0.5411765, 0, 1, 1,
0.6675151, -0.7651741, 1.385481, 0.5490196, 0, 1, 1,
0.6678877, 0.1459229, 1.75118, 0.5529412, 0, 1, 1,
0.6692607, 0.970787, 0.0722426, 0.5607843, 0, 1, 1,
0.6701005, -1.185581, 1.135043, 0.5647059, 0, 1, 1,
0.6710936, 1.0002, 0.1420705, 0.572549, 0, 1, 1,
0.6718245, -0.8212388, 4.88153, 0.5764706, 0, 1, 1,
0.6740332, -1.121981, 2.136054, 0.5843138, 0, 1, 1,
0.696644, 0.287968, 1.401892, 0.5882353, 0, 1, 1,
0.6971055, -0.3943488, 1.817944, 0.5960785, 0, 1, 1,
0.7040481, 0.04872682, 2.943634, 0.6039216, 0, 1, 1,
0.7065125, -2.071479, 4.162271, 0.6078432, 0, 1, 1,
0.709953, -0.3582768, 1.838498, 0.6156863, 0, 1, 1,
0.7120687, 2.339668, 0.3175173, 0.6196079, 0, 1, 1,
0.7152691, 1.029355, 1.591794, 0.627451, 0, 1, 1,
0.7157465, -0.6533257, 2.569811, 0.6313726, 0, 1, 1,
0.7161362, -0.09172253, 1.600888, 0.6392157, 0, 1, 1,
0.7164745, 0.02989275, -0.1281638, 0.6431373, 0, 1, 1,
0.7208688, 0.1644903, 1.415692, 0.6509804, 0, 1, 1,
0.7266599, 1.45096, 0.8163841, 0.654902, 0, 1, 1,
0.7289751, -0.4174494, 1.660208, 0.6627451, 0, 1, 1,
0.7362618, 0.7546363, -0.8097436, 0.6666667, 0, 1, 1,
0.7447535, -0.4797042, 3.04427, 0.6745098, 0, 1, 1,
0.7465751, 0.1049784, 2.36114, 0.6784314, 0, 1, 1,
0.7497672, 0.6265628, -0.7301265, 0.6862745, 0, 1, 1,
0.7565925, 1.661777, 1.886474, 0.6901961, 0, 1, 1,
0.7567534, -0.8142043, 4.545005, 0.6980392, 0, 1, 1,
0.7581591, 0.143506, 0.5479994, 0.7058824, 0, 1, 1,
0.7588586, 0.7324982, 0.2700272, 0.7098039, 0, 1, 1,
0.7695711, 1.26312, 0.9991996, 0.7176471, 0, 1, 1,
0.7777522, -0.8164234, 1.52654, 0.7215686, 0, 1, 1,
0.7791543, -0.2702369, 1.197883, 0.7294118, 0, 1, 1,
0.7851722, 0.4033852, 0.524001, 0.7333333, 0, 1, 1,
0.7873769, -0.01402004, 2.168231, 0.7411765, 0, 1, 1,
0.7914398, 1.168556, 2.060748, 0.7450981, 0, 1, 1,
0.7941202, 1.330738, 0.3755721, 0.7529412, 0, 1, 1,
0.799816, 0.01586239, 1.711613, 0.7568628, 0, 1, 1,
0.8018932, 0.2224203, 0.1441218, 0.7647059, 0, 1, 1,
0.8027841, -1.572347, 3.816226, 0.7686275, 0, 1, 1,
0.8032122, -0.1387055, 2.672043, 0.7764706, 0, 1, 1,
0.8058496, 0.738102, 1.36465, 0.7803922, 0, 1, 1,
0.8079218, -1.037534, 2.677162, 0.7882353, 0, 1, 1,
0.8095794, 0.1287295, 0.8444827, 0.7921569, 0, 1, 1,
0.8134369, -0.9059741, 2.86026, 0.8, 0, 1, 1,
0.8138762, -0.4955455, 1.92611, 0.8078431, 0, 1, 1,
0.8242892, -0.2750501, 1.766977, 0.8117647, 0, 1, 1,
0.8256593, -0.3531501, 1.720232, 0.8196079, 0, 1, 1,
0.8260622, -0.8146051, 1.461416, 0.8235294, 0, 1, 1,
0.8264657, -2.426061, 3.149027, 0.8313726, 0, 1, 1,
0.8310425, -1.46355, 1.100102, 0.8352941, 0, 1, 1,
0.8316553, -0.6721737, 1.937058, 0.8431373, 0, 1, 1,
0.8340503, -0.3080703, 1.473264, 0.8470588, 0, 1, 1,
0.8396121, 0.4795111, 1.196952, 0.854902, 0, 1, 1,
0.8447248, -0.631228, 2.243433, 0.8588235, 0, 1, 1,
0.8506386, -1.827805, 1.792262, 0.8666667, 0, 1, 1,
0.8528184, 0.06102927, 1.712368, 0.8705882, 0, 1, 1,
0.854438, 0.8568367, -0.0375644, 0.8784314, 0, 1, 1,
0.8554744, -0.5060036, 3.14591, 0.8823529, 0, 1, 1,
0.856753, 0.3832732, 1.774883, 0.8901961, 0, 1, 1,
0.8590396, -0.4890226, 1.451729, 0.8941177, 0, 1, 1,
0.8650351, -0.293586, 1.374259, 0.9019608, 0, 1, 1,
0.8660915, 1.888046, 0.495764, 0.9098039, 0, 1, 1,
0.8664864, 1.472218, 1.270621, 0.9137255, 0, 1, 1,
0.8682083, 1.455101, 0.3953404, 0.9215686, 0, 1, 1,
0.8763272, 2.718608, -0.5869021, 0.9254902, 0, 1, 1,
0.880627, 0.5253856, 1.155363, 0.9333333, 0, 1, 1,
0.8813203, -0.167522, 1.375746, 0.9372549, 0, 1, 1,
0.8835365, -0.1195445, 3.047549, 0.945098, 0, 1, 1,
0.8910578, -0.5851464, 1.59873, 0.9490196, 0, 1, 1,
0.8978997, 0.8217362, 0.009153968, 0.9568627, 0, 1, 1,
0.9060457, -0.7964563, 2.202147, 0.9607843, 0, 1, 1,
0.9093967, 0.5277586, 1.853996, 0.9686275, 0, 1, 1,
0.9105523, -0.9363192, 3.477973, 0.972549, 0, 1, 1,
0.9123732, -0.6389999, 1.933475, 0.9803922, 0, 1, 1,
0.9145133, -0.2978288, 1.50537, 0.9843137, 0, 1, 1,
0.9166152, -0.846764, 3.278203, 0.9921569, 0, 1, 1,
0.9196947, 0.5527718, 0.2321379, 0.9960784, 0, 1, 1,
0.9240041, 0.6226615, 4.191003, 1, 0, 0.9960784, 1,
0.9361612, -0.03936255, 3.608615, 1, 0, 0.9882353, 1,
0.9385551, 0.6972159, 0.1721677, 1, 0, 0.9843137, 1,
0.9557725, 0.4850356, 1.636786, 1, 0, 0.9764706, 1,
0.963923, -0.8059131, 3.142719, 1, 0, 0.972549, 1,
0.9652268, -1.090064, 3.335675, 1, 0, 0.9647059, 1,
0.9665546, 1.801091, -0.436426, 1, 0, 0.9607843, 1,
0.9699973, -1.040768, 1.696092, 1, 0, 0.9529412, 1,
0.9790297, -0.2331328, 0.6357701, 1, 0, 0.9490196, 1,
0.9791756, 0.6795265, 0.6477755, 1, 0, 0.9411765, 1,
0.9829645, 0.1686921, 0.4227962, 1, 0, 0.9372549, 1,
0.9885471, -1.183582, 1.635467, 1, 0, 0.9294118, 1,
0.9892374, 0.1241138, 1.733408, 1, 0, 0.9254902, 1,
1.009944, -0.0618494, 0.8844148, 1, 0, 0.9176471, 1,
1.017142, -0.2549726, 2.42268, 1, 0, 0.9137255, 1,
1.035449, 0.5927452, 0.8284218, 1, 0, 0.9058824, 1,
1.042452, -1.969807, 2.770828, 1, 0, 0.9019608, 1,
1.042564, 0.5320142, 1.258227, 1, 0, 0.8941177, 1,
1.053376, -1.507578, 2.83101, 1, 0, 0.8862745, 1,
1.054143, -0.3709081, 0.7244857, 1, 0, 0.8823529, 1,
1.063238, 0.6843253, 0.5871598, 1, 0, 0.8745098, 1,
1.064624, -1.059028, 1.351767, 1, 0, 0.8705882, 1,
1.065357, -1.155803, 1.508309, 1, 0, 0.8627451, 1,
1.077707, 0.4080543, 1.186175, 1, 0, 0.8588235, 1,
1.07959, 0.3322974, 1.210212, 1, 0, 0.8509804, 1,
1.11453, -0.4284493, 3.165353, 1, 0, 0.8470588, 1,
1.117423, -0.2425324, 1.234198, 1, 0, 0.8392157, 1,
1.11874, 0.6537054, -0.1013837, 1, 0, 0.8352941, 1,
1.128056, -0.3846934, 1.617257, 1, 0, 0.827451, 1,
1.133943, 0.9163498, -0.7781272, 1, 0, 0.8235294, 1,
1.135426, 1.378022, -0.2487818, 1, 0, 0.8156863, 1,
1.138445, 0.3956635, 1.657965, 1, 0, 0.8117647, 1,
1.142263, -0.1938088, 2.207441, 1, 0, 0.8039216, 1,
1.142494, -0.2468473, 1.255591, 1, 0, 0.7960784, 1,
1.15093, 0.4021569, 0.8936537, 1, 0, 0.7921569, 1,
1.151872, 0.7272693, 0.3165168, 1, 0, 0.7843137, 1,
1.157334, -0.06335455, 1.45551, 1, 0, 0.7803922, 1,
1.164075, 1.340407, 2.70802, 1, 0, 0.772549, 1,
1.168069, 0.6107365, 0.5846443, 1, 0, 0.7686275, 1,
1.178151, -0.6747167, 0.5820169, 1, 0, 0.7607843, 1,
1.179468, 0.09182148, 0.1816082, 1, 0, 0.7568628, 1,
1.193878, 0.3151897, 2.12974, 1, 0, 0.7490196, 1,
1.196262, 1.160166, 1.326752, 1, 0, 0.7450981, 1,
1.198607, 1.534858, 0.4608494, 1, 0, 0.7372549, 1,
1.202898, -0.172154, 1.244215, 1, 0, 0.7333333, 1,
1.218486, 0.8594381, 0.2266333, 1, 0, 0.7254902, 1,
1.222638, 0.185122, 0.9799224, 1, 0, 0.7215686, 1,
1.229952, -0.3776974, 1.215806, 1, 0, 0.7137255, 1,
1.236997, 1.502366, -0.2828737, 1, 0, 0.7098039, 1,
1.24426, -0.004105934, 1.151429, 1, 0, 0.7019608, 1,
1.254602, -2.396621, 3.372448, 1, 0, 0.6941177, 1,
1.256748, -1.353496, 4.26747, 1, 0, 0.6901961, 1,
1.259873, 0.9180295, 1.554717, 1, 0, 0.682353, 1,
1.262435, -0.273294, 1.604093, 1, 0, 0.6784314, 1,
1.266837, 1.712897, 1.090885, 1, 0, 0.6705883, 1,
1.269176, -1.123118, 1.524205, 1, 0, 0.6666667, 1,
1.272289, -0.234632, 2.092039, 1, 0, 0.6588235, 1,
1.284815, -0.8315741, 2.581094, 1, 0, 0.654902, 1,
1.286002, -0.6908399, 0.8459756, 1, 0, 0.6470588, 1,
1.290947, 0.9637284, 3.244945, 1, 0, 0.6431373, 1,
1.292687, -0.4062107, 2.463309, 1, 0, 0.6352941, 1,
1.301252, -0.727046, 1.166638, 1, 0, 0.6313726, 1,
1.310552, 0.6996857, 1.7998, 1, 0, 0.6235294, 1,
1.313234, 0.02201863, 1.69828, 1, 0, 0.6196079, 1,
1.314736, 1.659652, 0.1027434, 1, 0, 0.6117647, 1,
1.328207, 1.454603, 0.8537226, 1, 0, 0.6078432, 1,
1.328941, -0.1021188, 0.7798181, 1, 0, 0.6, 1,
1.333564, -1.120009, 0.4321778, 1, 0, 0.5921569, 1,
1.334009, 1.743106, -0.08405195, 1, 0, 0.5882353, 1,
1.336145, 0.07622085, 1.667918, 1, 0, 0.5803922, 1,
1.34294, -1.383579, 0.4811381, 1, 0, 0.5764706, 1,
1.351118, 1.53531, -0.7975175, 1, 0, 0.5686275, 1,
1.353362, -0.741663, 1.933988, 1, 0, 0.5647059, 1,
1.353722, 2.12095, -2.810059, 1, 0, 0.5568628, 1,
1.356508, 0.1023989, 1.399101, 1, 0, 0.5529412, 1,
1.357278, -0.2882757, 1.08638, 1, 0, 0.5450981, 1,
1.362984, 0.03336621, 1.648649, 1, 0, 0.5411765, 1,
1.382041, 0.7087446, 2.455024, 1, 0, 0.5333334, 1,
1.385646, -1.06799, 1.231952, 1, 0, 0.5294118, 1,
1.389442, 0.3539039, 2.384101, 1, 0, 0.5215687, 1,
1.390739, 1.234176, -0.2362289, 1, 0, 0.5176471, 1,
1.397673, -1.336389, 4.217025, 1, 0, 0.509804, 1,
1.401747, -0.1066851, 0.8003244, 1, 0, 0.5058824, 1,
1.404583, 0.3108291, 0.6315627, 1, 0, 0.4980392, 1,
1.409508, 0.4427006, 0.1067242, 1, 0, 0.4901961, 1,
1.410817, -2.458364, 1.485242, 1, 0, 0.4862745, 1,
1.43039, 0.2665037, 0.4570459, 1, 0, 0.4784314, 1,
1.466988, 0.3845807, 0.1073327, 1, 0, 0.4745098, 1,
1.482149, -0.564314, 2.078852, 1, 0, 0.4666667, 1,
1.484134, 0.3695922, 1.271021, 1, 0, 0.4627451, 1,
1.484954, -0.5057825, 1.743363, 1, 0, 0.454902, 1,
1.485557, 0.2479036, 0.555901, 1, 0, 0.4509804, 1,
1.498781, -2.466319, 2.772588, 1, 0, 0.4431373, 1,
1.500463, -0.370184, 1.454376, 1, 0, 0.4392157, 1,
1.520266, 1.307735, 0.7447519, 1, 0, 0.4313726, 1,
1.525965, 0.8333402, 0.6451632, 1, 0, 0.427451, 1,
1.553269, -1.373728, 2.309646, 1, 0, 0.4196078, 1,
1.563538, 0.8892109, -0.01746442, 1, 0, 0.4156863, 1,
1.56828, -0.9440735, 2.193159, 1, 0, 0.4078431, 1,
1.581136, 0.1853321, 0.4733137, 1, 0, 0.4039216, 1,
1.598988, -0.06923172, 0.9508733, 1, 0, 0.3960784, 1,
1.602449, 0.3619011, 0.8311266, 1, 0, 0.3882353, 1,
1.617412, -0.226669, 1.166198, 1, 0, 0.3843137, 1,
1.637202, -0.7011181, 1.801776, 1, 0, 0.3764706, 1,
1.638794, -0.3456695, 2.193271, 1, 0, 0.372549, 1,
1.657142, -0.7191271, 2.27098, 1, 0, 0.3647059, 1,
1.665413, 1.595301, -0.6467872, 1, 0, 0.3607843, 1,
1.672186, -1.087861, 1.149863, 1, 0, 0.3529412, 1,
1.675514, -0.8646836, 2.821815, 1, 0, 0.3490196, 1,
1.689689, -0.7255496, 3.230358, 1, 0, 0.3411765, 1,
1.694892, -0.179575, 1.640855, 1, 0, 0.3372549, 1,
1.694945, -1.007898, 1.325791, 1, 0, 0.3294118, 1,
1.697944, 0.3761419, 2.340151, 1, 0, 0.3254902, 1,
1.705326, 0.07810797, -0.9645904, 1, 0, 0.3176471, 1,
1.710618, 0.5742338, 2.022674, 1, 0, 0.3137255, 1,
1.711988, 0.0736336, -0.5623657, 1, 0, 0.3058824, 1,
1.71224, 1.427335, 0.5232585, 1, 0, 0.2980392, 1,
1.713282, 0.9328966, 0.7811984, 1, 0, 0.2941177, 1,
1.718388, -0.4601085, 3.571927, 1, 0, 0.2862745, 1,
1.720311, -1.462727, 3.495688, 1, 0, 0.282353, 1,
1.721949, 0.5231423, -0.1740475, 1, 0, 0.2745098, 1,
1.726776, -1.282462, 1.737457, 1, 0, 0.2705882, 1,
1.736238, -0.7651435, 0.5737697, 1, 0, 0.2627451, 1,
1.76057, -0.2058527, 0.7475111, 1, 0, 0.2588235, 1,
1.779798, -0.5689967, 3.848713, 1, 0, 0.2509804, 1,
1.808726, -0.809801, 1.082539, 1, 0, 0.2470588, 1,
1.809423, 1.373266, 0.546269, 1, 0, 0.2392157, 1,
1.814863, -0.2576773, 1.430823, 1, 0, 0.2352941, 1,
1.820688, 0.5000598, 0.3746693, 1, 0, 0.227451, 1,
1.822259, -0.3669356, 1.295685, 1, 0, 0.2235294, 1,
1.856158, -0.1424309, 2.656626, 1, 0, 0.2156863, 1,
1.858729, -0.6231896, 2.401717, 1, 0, 0.2117647, 1,
1.861974, -0.05954996, 2.54475, 1, 0, 0.2039216, 1,
1.880072, 1.186624, 1.712836, 1, 0, 0.1960784, 1,
1.894805, 2.436695, 0.07236747, 1, 0, 0.1921569, 1,
1.900285, 0.4112342, 2.69692, 1, 0, 0.1843137, 1,
1.911019, 0.6169311, 1.363686, 1, 0, 0.1803922, 1,
1.911846, -1.544221, 2.529704, 1, 0, 0.172549, 1,
1.927325, 0.4394346, 1.266742, 1, 0, 0.1686275, 1,
1.954317, -0.6068607, 1.066689, 1, 0, 0.1607843, 1,
1.969164, 0.08835682, 0.758835, 1, 0, 0.1568628, 1,
1.99911, -0.4990326, 1.985749, 1, 0, 0.1490196, 1,
2.011271, -0.9303968, 3.485595, 1, 0, 0.145098, 1,
2.014474, 0.1622704, -0.07782067, 1, 0, 0.1372549, 1,
2.018438, 0.724583, 0.1460906, 1, 0, 0.1333333, 1,
2.064407, -0.74349, 2.506973, 1, 0, 0.1254902, 1,
2.067282, 0.08461676, 0.1188653, 1, 0, 0.1215686, 1,
2.069167, -0.7133695, 0.4863994, 1, 0, 0.1137255, 1,
2.069211, -2.198377, 0.3498729, 1, 0, 0.1098039, 1,
2.080527, -1.783872, 0.9060764, 1, 0, 0.1019608, 1,
2.17125, 0.09151785, 2.287924, 1, 0, 0.09411765, 1,
2.193416, -1.594788, 2.342096, 1, 0, 0.09019608, 1,
2.217913, 0.5289805, 1.483138, 1, 0, 0.08235294, 1,
2.24219, -0.4203458, 2.817281, 1, 0, 0.07843138, 1,
2.244529, -0.3346474, 1.014506, 1, 0, 0.07058824, 1,
2.262985, -0.3889788, 1.666864, 1, 0, 0.06666667, 1,
2.277593, 1.867173, 1.508909, 1, 0, 0.05882353, 1,
2.401354, 0.2402627, 2.392702, 1, 0, 0.05490196, 1,
2.479388, -2.188569, 3.491629, 1, 0, 0.04705882, 1,
2.566417, -0.4828025, 1.126573, 1, 0, 0.04313726, 1,
2.611683, 0.4890148, 1.719435, 1, 0, 0.03529412, 1,
2.631152, -0.6128789, 1.18643, 1, 0, 0.03137255, 1,
2.63193, -0.5812955, 2.972538, 1, 0, 0.02352941, 1,
2.951359, 0.01128907, 1.69435, 1, 0, 0.01960784, 1,
2.958873, 2.031322, 0.2866036, 1, 0, 0.01176471, 1,
3.513879, 0.07095911, 1.827134, 1, 0, 0.007843138, 1
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
0.04083741, -4.125582, -7.115166, 0, -0.5, 0.5, 0.5,
0.04083741, -4.125582, -7.115166, 1, -0.5, 0.5, 0.5,
0.04083741, -4.125582, -7.115166, 1, 1.5, 0.5, 0.5,
0.04083741, -4.125582, -7.115166, 0, 1.5, 0.5, 0.5
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
-4.609566, -0.1005747, -7.115166, 0, -0.5, 0.5, 0.5,
-4.609566, -0.1005747, -7.115166, 1, -0.5, 0.5, 0.5,
-4.609566, -0.1005747, -7.115166, 1, 1.5, 0.5, 0.5,
-4.609566, -0.1005747, -7.115166, 0, 1.5, 0.5, 0.5
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
-4.609566, -4.125582, 0.2423542, 0, -0.5, 0.5, 0.5,
-4.609566, -4.125582, 0.2423542, 1, -0.5, 0.5, 0.5,
-4.609566, -4.125582, 0.2423542, 1, 1.5, 0.5, 0.5,
-4.609566, -4.125582, 0.2423542, 0, 1.5, 0.5, 0.5
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
-3, -3.196734, -5.417277,
3, -3.196734, -5.417277,
-3, -3.196734, -5.417277,
-3, -3.351542, -5.700258,
-2, -3.196734, -5.417277,
-2, -3.351542, -5.700258,
-1, -3.196734, -5.417277,
-1, -3.351542, -5.700258,
0, -3.196734, -5.417277,
0, -3.351542, -5.700258,
1, -3.196734, -5.417277,
1, -3.351542, -5.700258,
2, -3.196734, -5.417277,
2, -3.351542, -5.700258,
3, -3.196734, -5.417277,
3, -3.351542, -5.700258
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
-3, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
-3, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
-3, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
-3, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
-2, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
-2, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
-2, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
-2, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
-1, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
-1, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
-1, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
-1, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
0, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
0, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
0, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
0, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
1, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
1, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
1, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
1, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
2, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
2, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
2, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
2, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5,
3, -3.661158, -6.266222, 0, -0.5, 0.5, 0.5,
3, -3.661158, -6.266222, 1, -0.5, 0.5, 0.5,
3, -3.661158, -6.266222, 1, 1.5, 0.5, 0.5,
3, -3.661158, -6.266222, 0, 1.5, 0.5, 0.5
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
-3.536396, -3, -5.417277,
-3.536396, 2, -5.417277,
-3.536396, -3, -5.417277,
-3.715257, -3, -5.700258,
-3.536396, -2, -5.417277,
-3.715257, -2, -5.700258,
-3.536396, -1, -5.417277,
-3.715257, -1, -5.700258,
-3.536396, 0, -5.417277,
-3.715257, 0, -5.700258,
-3.536396, 1, -5.417277,
-3.715257, 1, -5.700258,
-3.536396, 2, -5.417277,
-3.715257, 2, -5.700258
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
-4.072981, -3, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, -3, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, -3, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, -3, -6.266222, 0, 1.5, 0.5, 0.5,
-4.072981, -2, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, -2, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, -2, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, -2, -6.266222, 0, 1.5, 0.5, 0.5,
-4.072981, -1, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, -1, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, -1, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, -1, -6.266222, 0, 1.5, 0.5, 0.5,
-4.072981, 0, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, 0, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, 0, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, 0, -6.266222, 0, 1.5, 0.5, 0.5,
-4.072981, 1, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, 1, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, 1, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, 1, -6.266222, 0, 1.5, 0.5, 0.5,
-4.072981, 2, -6.266222, 0, -0.5, 0.5, 0.5,
-4.072981, 2, -6.266222, 1, -0.5, 0.5, 0.5,
-4.072981, 2, -6.266222, 1, 1.5, 0.5, 0.5,
-4.072981, 2, -6.266222, 0, 1.5, 0.5, 0.5
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
-3.536396, -3.196734, -4,
-3.536396, -3.196734, 4,
-3.536396, -3.196734, -4,
-3.715257, -3.351542, -4,
-3.536396, -3.196734, -2,
-3.715257, -3.351542, -2,
-3.536396, -3.196734, 0,
-3.715257, -3.351542, 0,
-3.536396, -3.196734, 2,
-3.715257, -3.351542, 2,
-3.536396, -3.196734, 4,
-3.715257, -3.351542, 4
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
-4.072981, -3.661158, -4, 0, -0.5, 0.5, 0.5,
-4.072981, -3.661158, -4, 1, -0.5, 0.5, 0.5,
-4.072981, -3.661158, -4, 1, 1.5, 0.5, 0.5,
-4.072981, -3.661158, -4, 0, 1.5, 0.5, 0.5,
-4.072981, -3.661158, -2, 0, -0.5, 0.5, 0.5,
-4.072981, -3.661158, -2, 1, -0.5, 0.5, 0.5,
-4.072981, -3.661158, -2, 1, 1.5, 0.5, 0.5,
-4.072981, -3.661158, -2, 0, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 0, 0, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 0, 1, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 0, 1, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 0, 0, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 2, 0, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 2, 1, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 2, 1, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 2, 0, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 4, 0, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 4, 1, -0.5, 0.5, 0.5,
-4.072981, -3.661158, 4, 1, 1.5, 0.5, 0.5,
-4.072981, -3.661158, 4, 0, 1.5, 0.5, 0.5
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
-3.536396, -3.196734, -5.417277,
-3.536396, 2.995585, -5.417277,
-3.536396, -3.196734, 5.901985,
-3.536396, 2.995585, 5.901985,
-3.536396, -3.196734, -5.417277,
-3.536396, -3.196734, 5.901985,
-3.536396, 2.995585, -5.417277,
-3.536396, 2.995585, 5.901985,
-3.536396, -3.196734, -5.417277,
3.618071, -3.196734, -5.417277,
-3.536396, -3.196734, 5.901985,
3.618071, -3.196734, 5.901985,
-3.536396, 2.995585, -5.417277,
3.618071, 2.995585, -5.417277,
-3.536396, 2.995585, 5.901985,
3.618071, 2.995585, 5.901985,
3.618071, -3.196734, -5.417277,
3.618071, 2.995585, -5.417277,
3.618071, -3.196734, 5.901985,
3.618071, 2.995585, 5.901985,
3.618071, -3.196734, -5.417277,
3.618071, -3.196734, 5.901985,
3.618071, 2.995585, -5.417277,
3.618071, 2.995585, 5.901985
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
var radius = 7.877922;
var distance = 35.04976;
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
mvMatrix.translate( -0.04083741, 0.1005747, -0.2423542 );
mvMatrix.scale( 1.190552, 1.375537, 0.7525017 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.04976);
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
Aminoethoxyvinylglyc<-read.table("Aminoethoxyvinylglyc.xyz")
```

```
## Error in read.table("Aminoethoxyvinylglyc.xyz"): no lines available in input
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
-3.432204, 0.1247308, -1.446669, 0, 0, 1, 1, 1,
-3.02537, 2.180031, -1.879862, 1, 0, 0, 1, 1,
-2.872727, -1.039633, -2.41944, 1, 0, 0, 1, 1,
-2.857748, 1.125406, -0.5863209, 1, 0, 0, 1, 1,
-2.815602, 0.8009245, -2.581962, 1, 0, 0, 1, 1,
-2.763344, 0.9710879, -2.323482, 1, 0, 0, 1, 1,
-2.555275, 1.572645, -0.8398705, 0, 0, 0, 1, 1,
-2.501466, -2.533436, -2.587167, 0, 0, 0, 1, 1,
-2.407919, 0.2591457, -1.878944, 0, 0, 0, 1, 1,
-2.289543, -0.534462, -1.861648, 0, 0, 0, 1, 1,
-2.225394, 1.157529, -2.53181, 0, 0, 0, 1, 1,
-2.200253, 0.01839784, -1.026394, 0, 0, 0, 1, 1,
-2.192527, 0.4316891, -1.67353, 0, 0, 0, 1, 1,
-2.174789, -1.24064, -1.967055, 1, 1, 1, 1, 1,
-2.159455, -0.805512, -1.749031, 1, 1, 1, 1, 1,
-2.129191, -1.852753, -2.309189, 1, 1, 1, 1, 1,
-2.119983, -1.449839, -3.020289, 1, 1, 1, 1, 1,
-2.090643, 0.1381581, -3.577454, 1, 1, 1, 1, 1,
-2.04205, 1.292414, 1.068083, 1, 1, 1, 1, 1,
-2.031954, 0.3836121, -2.505857, 1, 1, 1, 1, 1,
-2.022139, 2.028813, -0.5891488, 1, 1, 1, 1, 1,
-1.996893, 0.3283705, -1.097923, 1, 1, 1, 1, 1,
-1.979203, 0.3068015, 0.6682762, 1, 1, 1, 1, 1,
-1.977154, 1.300575, -0.8959796, 1, 1, 1, 1, 1,
-1.97214, 1.260495, -0.6620119, 1, 1, 1, 1, 1,
-1.947452, 0.2986002, -0.8089395, 1, 1, 1, 1, 1,
-1.932123, 0.1033591, -1.093321, 1, 1, 1, 1, 1,
-1.923561, -0.06820408, 0.2335081, 1, 1, 1, 1, 1,
-1.920023, -0.8373189, -2.092273, 0, 0, 1, 1, 1,
-1.919397, 1.409604, -1.028017, 1, 0, 0, 1, 1,
-1.89345, 0.84337, -1.324582, 1, 0, 0, 1, 1,
-1.883524, -0.08535947, -2.35052, 1, 0, 0, 1, 1,
-1.866237, -0.4296131, -0.9606076, 1, 0, 0, 1, 1,
-1.849379, 1.310398, -0.9114761, 1, 0, 0, 1, 1,
-1.824631, -0.7330414, -2.038629, 0, 0, 0, 1, 1,
-1.81773, 1.300194, -0.4263132, 0, 0, 0, 1, 1,
-1.793692, 0.3095613, -2.942327, 0, 0, 0, 1, 1,
-1.775549, 0.4050037, -1.149659, 0, 0, 0, 1, 1,
-1.763357, 0.5910934, -2.003431, 0, 0, 0, 1, 1,
-1.715629, 1.075875, -1.950075, 0, 0, 0, 1, 1,
-1.688971, 1.309146, -0.8922814, 0, 0, 0, 1, 1,
-1.682412, 1.697541, -1.834953, 1, 1, 1, 1, 1,
-1.682117, 0.3952201, -1.962073, 1, 1, 1, 1, 1,
-1.641581, 0.79366, -1.402799, 1, 1, 1, 1, 1,
-1.631475, -0.5979322, -0.8925421, 1, 1, 1, 1, 1,
-1.628641, 1.620698, -1.550246, 1, 1, 1, 1, 1,
-1.612723, -0.154231, -2.621398, 1, 1, 1, 1, 1,
-1.599994, 0.08129958, -2.079226, 1, 1, 1, 1, 1,
-1.598637, -0.4352943, -0.5502012, 1, 1, 1, 1, 1,
-1.59381, -0.1160887, -1.193689, 1, 1, 1, 1, 1,
-1.564632, -0.5092887, -1.585663, 1, 1, 1, 1, 1,
-1.561961, -1.159247, -0.971855, 1, 1, 1, 1, 1,
-1.560072, -0.7972389, -2.500251, 1, 1, 1, 1, 1,
-1.558863, 0.3117144, -1.271283, 1, 1, 1, 1, 1,
-1.558738, -0.09156683, -0.2928047, 1, 1, 1, 1, 1,
-1.54884, 1.455838, -2.196209, 1, 1, 1, 1, 1,
-1.547827, -0.7314677, -2.626965, 0, 0, 1, 1, 1,
-1.546074, -1.899666, -1.710039, 1, 0, 0, 1, 1,
-1.545436, -0.2937149, -1.468854, 1, 0, 0, 1, 1,
-1.544876, -0.4625674, -1.999043, 1, 0, 0, 1, 1,
-1.543348, -0.6151726, -1.516124, 1, 0, 0, 1, 1,
-1.542799, 0.2737875, -1.69386, 1, 0, 0, 1, 1,
-1.532506, -0.9875283, -2.617335, 0, 0, 0, 1, 1,
-1.52688, -2.264658, -2.073539, 0, 0, 0, 1, 1,
-1.521164, -0.4759017, -2.585865, 0, 0, 0, 1, 1,
-1.50655, -1.290362, -0.3630662, 0, 0, 0, 1, 1,
-1.49746, 0.4980034, -3.02001, 0, 0, 0, 1, 1,
-1.474205, 1.258577, -1.646195, 0, 0, 0, 1, 1,
-1.471668, 0.8655222, -1.593363, 0, 0, 0, 1, 1,
-1.469541, -0.8236209, -3.161067, 1, 1, 1, 1, 1,
-1.468392, -2.593417, -4.044081, 1, 1, 1, 1, 1,
-1.464608, 1.634272, -1.72428, 1, 1, 1, 1, 1,
-1.464301, -0.1053238, 0.078661, 1, 1, 1, 1, 1,
-1.456365, 0.9406638, -1.392518, 1, 1, 1, 1, 1,
-1.442605, -0.2522717, -2.611156, 1, 1, 1, 1, 1,
-1.434033, -0.3468036, -0.6374511, 1, 1, 1, 1, 1,
-1.425104, -2.709251, -1.749673, 1, 1, 1, 1, 1,
-1.415852, -0.2752856, -1.159569, 1, 1, 1, 1, 1,
-1.402795, -0.5479707, -1.878566, 1, 1, 1, 1, 1,
-1.401479, 0.5585238, 0.6689797, 1, 1, 1, 1, 1,
-1.399955, 1.114366, -0.8017634, 1, 1, 1, 1, 1,
-1.391957, -1.059693, -4.911545, 1, 1, 1, 1, 1,
-1.387568, -0.6168271, -3.167011, 1, 1, 1, 1, 1,
-1.382571, 0.9169308, -0.4119792, 1, 1, 1, 1, 1,
-1.379013, 0.8704367, 0.2524611, 0, 0, 1, 1, 1,
-1.374675, -0.05422104, -3.643594, 1, 0, 0, 1, 1,
-1.373633, 1.475596, -1.232251, 1, 0, 0, 1, 1,
-1.360652, -0.2776054, -0.8979046, 1, 0, 0, 1, 1,
-1.359107, -1.205394, -2.796294, 1, 0, 0, 1, 1,
-1.345397, 0.3325918, -0.3398288, 1, 0, 0, 1, 1,
-1.340854, 1.438468, -2.726245, 0, 0, 0, 1, 1,
-1.326345, -1.374894, -3.328058, 0, 0, 0, 1, 1,
-1.322289, 1.006748, -2.205926, 0, 0, 0, 1, 1,
-1.318323, -0.6466703, -2.88565, 0, 0, 0, 1, 1,
-1.316049, -0.9629436, -1.519528, 0, 0, 0, 1, 1,
-1.302775, 0.05142564, -2.676226, 0, 0, 0, 1, 1,
-1.298709, -0.9363008, -2.948931, 0, 0, 0, 1, 1,
-1.296401, 0.6995118, -2.154195, 1, 1, 1, 1, 1,
-1.280512, -0.314272, -2.341727, 1, 1, 1, 1, 1,
-1.279987, 0.8694444, -1.19936, 1, 1, 1, 1, 1,
-1.271757, -0.3787023, -2.956407, 1, 1, 1, 1, 1,
-1.271735, 1.805749, 0.09026573, 1, 1, 1, 1, 1,
-1.262455, 0.3424475, -0.8558847, 1, 1, 1, 1, 1,
-1.248737, -0.1532482, -1.113242, 1, 1, 1, 1, 1,
-1.241925, 0.4558848, -0.3630168, 1, 1, 1, 1, 1,
-1.240664, -1.890061, -2.949925, 1, 1, 1, 1, 1,
-1.239736, 0.1336756, -0.9357117, 1, 1, 1, 1, 1,
-1.229286, 0.2459799, 0.9669037, 1, 1, 1, 1, 1,
-1.227973, -1.709363, -3.312371, 1, 1, 1, 1, 1,
-1.219085, -0.873802, -0.7380989, 1, 1, 1, 1, 1,
-1.218516, 1.711492, -2.817107, 1, 1, 1, 1, 1,
-1.208541, 0.6339905, -1.714762, 1, 1, 1, 1, 1,
-1.19982, -0.3801951, -1.697617, 0, 0, 1, 1, 1,
-1.193115, -0.9219192, -3.21402, 1, 0, 0, 1, 1,
-1.182216, -0.2349968, -1.748087, 1, 0, 0, 1, 1,
-1.180403, -0.1521227, -2.006138, 1, 0, 0, 1, 1,
-1.173683, 0.06004318, -1.544199, 1, 0, 0, 1, 1,
-1.172525, 0.228454, -1.102167, 1, 0, 0, 1, 1,
-1.169503, -3.106555, -3.718889, 0, 0, 0, 1, 1,
-1.161833, 0.2385831, -1.231212, 0, 0, 0, 1, 1,
-1.157246, 0.3064818, -1.466147, 0, 0, 0, 1, 1,
-1.150352, 1.193303, -1.791525, 0, 0, 0, 1, 1,
-1.146628, -0.7543592, -2.008227, 0, 0, 0, 1, 1,
-1.146466, 1.124586, -0.6531245, 0, 0, 0, 1, 1,
-1.143293, -2.184126, -0.438911, 0, 0, 0, 1, 1,
-1.142405, -1.342616, -1.055953, 1, 1, 1, 1, 1,
-1.141756, -1.698839, -1.80204, 1, 1, 1, 1, 1,
-1.139695, 1.099227, 0.7074929, 1, 1, 1, 1, 1,
-1.134422, -1.849742, -1.509034, 1, 1, 1, 1, 1,
-1.131528, 0.6625226, -2.230969, 1, 1, 1, 1, 1,
-1.126223, -0.6437045, -2.314543, 1, 1, 1, 1, 1,
-1.123932, 0.8256679, 0.2537293, 1, 1, 1, 1, 1,
-1.123268, -0.6190073, -2.083304, 1, 1, 1, 1, 1,
-1.119843, -0.004474166, -1.231246, 1, 1, 1, 1, 1,
-1.114139, 0.9234262, -0.7498608, 1, 1, 1, 1, 1,
-1.091787, -0.4125939, -1.574379, 1, 1, 1, 1, 1,
-1.090079, -0.3995015, -3.609857, 1, 1, 1, 1, 1,
-1.08613, 0.5319254, 0.2722528, 1, 1, 1, 1, 1,
-1.08524, 0.7563592, -1.028479, 1, 1, 1, 1, 1,
-1.084825, -1.614509, -2.199089, 1, 1, 1, 1, 1,
-1.08363, 0.3439529, -0.445351, 0, 0, 1, 1, 1,
-1.080951, 0.4925644, -1.098131, 1, 0, 0, 1, 1,
-1.078472, -0.3409477, -1.303011, 1, 0, 0, 1, 1,
-1.076194, -0.2595458, -2.891123, 1, 0, 0, 1, 1,
-1.076118, -0.3634253, -2.150465, 1, 0, 0, 1, 1,
-1.075945, -1.026546, -3.127989, 1, 0, 0, 1, 1,
-1.068229, -2.293124, -2.406306, 0, 0, 0, 1, 1,
-1.067967, -0.3423539, -1.758344, 0, 0, 0, 1, 1,
-1.064774, 0.7012136, -1.206611, 0, 0, 0, 1, 1,
-1.063294, -0.8599025, -1.377212, 0, 0, 0, 1, 1,
-1.06123, -0.2151757, -1.447192, 0, 0, 0, 1, 1,
-1.060815, 1.416846, 0.04201572, 0, 0, 0, 1, 1,
-1.048503, 0.3711385, -0.9673289, 0, 0, 0, 1, 1,
-1.047326, -0.562728, -0.2618534, 1, 1, 1, 1, 1,
-1.042569, -0.7433752, -2.343009, 1, 1, 1, 1, 1,
-1.042433, 0.4668303, -1.876722, 1, 1, 1, 1, 1,
-1.032143, 2.138326, 1.513871, 1, 1, 1, 1, 1,
-1.023954, 0.3068064, -1.296483, 1, 1, 1, 1, 1,
-1.018679, 0.3731844, -0.8356357, 1, 1, 1, 1, 1,
-1.01288, 0.7444043, -1.677371, 1, 1, 1, 1, 1,
-1.012135, 1.454834, -1.780491, 1, 1, 1, 1, 1,
-1.01173, 0.5874408, -2.195278, 1, 1, 1, 1, 1,
-0.9947325, -0.7630105, -2.496665, 1, 1, 1, 1, 1,
-0.9924888, -0.5290903, -4.108294, 1, 1, 1, 1, 1,
-0.9902527, 1.665478, 0.3073002, 1, 1, 1, 1, 1,
-0.9879991, 0.1812682, -0.9580213, 1, 1, 1, 1, 1,
-0.9804451, 0.1745846, -1.562082, 1, 1, 1, 1, 1,
-0.9763746, 1.56117, -0.5898708, 1, 1, 1, 1, 1,
-0.9759935, 0.4938618, -1.881243, 0, 0, 1, 1, 1,
-0.9742228, -0.247267, -1.629586, 1, 0, 0, 1, 1,
-0.9710218, 0.2318542, -2.887186, 1, 0, 0, 1, 1,
-0.9669673, 0.4956644, -0.1479049, 1, 0, 0, 1, 1,
-0.95916, 1.034068, 0.7123208, 1, 0, 0, 1, 1,
-0.9589153, -0.2348637, 0.9862679, 1, 0, 0, 1, 1,
-0.9563043, 0.3291475, -2.067003, 0, 0, 0, 1, 1,
-0.9475071, -0.6163013, -3.926909, 0, 0, 0, 1, 1,
-0.9444459, 2.034086, -0.3435179, 0, 0, 0, 1, 1,
-0.9408823, -0.2930898, -2.439439, 0, 0, 0, 1, 1,
-0.9396266, -0.06233277, -1.346933, 0, 0, 0, 1, 1,
-0.9311089, -0.9225578, -2.52358, 0, 0, 0, 1, 1,
-0.9269146, 1.555752, -0.08669722, 0, 0, 0, 1, 1,
-0.9197867, -0.703411, -2.30623, 1, 1, 1, 1, 1,
-0.9185514, 1.415386, -1.157091, 1, 1, 1, 1, 1,
-0.9174501, 1.33164, 0.9045454, 1, 1, 1, 1, 1,
-0.9167013, 0.07691782, -0.6446594, 1, 1, 1, 1, 1,
-0.9154791, 0.7738124, -0.4561658, 1, 1, 1, 1, 1,
-0.9111812, 0.2204297, 0.2278039, 1, 1, 1, 1, 1,
-0.9101414, -0.8511163, -3.522717, 1, 1, 1, 1, 1,
-0.9099372, 0.4063056, -0.481263, 1, 1, 1, 1, 1,
-0.9079617, -0.7767835, -3.422235, 1, 1, 1, 1, 1,
-0.9067555, -0.5016483, -3.302831, 1, 1, 1, 1, 1,
-0.9060649, -0.6449504, -1.307848, 1, 1, 1, 1, 1,
-0.9058223, -0.1998993, -3.046598, 1, 1, 1, 1, 1,
-0.904552, 1.513855, -1.272885, 1, 1, 1, 1, 1,
-0.9024144, -1.480175, -3.634292, 1, 1, 1, 1, 1,
-0.8948701, -0.4015667, -1.740132, 1, 1, 1, 1, 1,
-0.8860673, 0.6667016, -0.1262511, 0, 0, 1, 1, 1,
-0.8843697, -1.70822, 0.2039805, 1, 0, 0, 1, 1,
-0.882795, -0.09694433, -3.77184, 1, 0, 0, 1, 1,
-0.8799801, -0.1661803, -3.891627, 1, 0, 0, 1, 1,
-0.8734248, -0.34253, -2.288051, 1, 0, 0, 1, 1,
-0.8710418, -2.056691, -1.058554, 1, 0, 0, 1, 1,
-0.8656328, -1.089633, -2.099185, 0, 0, 0, 1, 1,
-0.8608972, -0.3867646, -1.138126, 0, 0, 0, 1, 1,
-0.8605153, -1.358105, -2.075103, 0, 0, 0, 1, 1,
-0.8591822, -0.6096956, -1.701698, 0, 0, 0, 1, 1,
-0.8582364, -0.3402875, -2.105444, 0, 0, 0, 1, 1,
-0.8430151, 0.787587, -0.5454653, 0, 0, 0, 1, 1,
-0.842612, 0.8003896, -0.8904338, 0, 0, 0, 1, 1,
-0.8397964, 0.6559768, -0.8827909, 1, 1, 1, 1, 1,
-0.8317086, -1.146018, -2.760237, 1, 1, 1, 1, 1,
-0.8294171, 0.11624, -3.384973, 1, 1, 1, 1, 1,
-0.8246993, -0.9157068, -2.854172, 1, 1, 1, 1, 1,
-0.8240649, 0.8869073, 0.6502226, 1, 1, 1, 1, 1,
-0.8231419, -0.6938394, -2.018305, 1, 1, 1, 1, 1,
-0.8218213, 0.4889416, 0.473471, 1, 1, 1, 1, 1,
-0.8122907, -0.2196817, -2.495, 1, 1, 1, 1, 1,
-0.8090519, 0.07676386, -1.90395, 1, 1, 1, 1, 1,
-0.7891319, -2.936379, -3.987546, 1, 1, 1, 1, 1,
-0.7841058, 0.6070787, -1.83804, 1, 1, 1, 1, 1,
-0.7829483, 0.3528009, -1.762415, 1, 1, 1, 1, 1,
-0.7752782, -1.391827, -1.888696, 1, 1, 1, 1, 1,
-0.7665665, -0.5398954, -2.429096, 1, 1, 1, 1, 1,
-0.7640486, -1.583247, -3.282671, 1, 1, 1, 1, 1,
-0.7604371, -2.108063, -3.018151, 0, 0, 1, 1, 1,
-0.7551579, -1.645267, -2.942866, 1, 0, 0, 1, 1,
-0.7516088, -0.6482084, -0.928729, 1, 0, 0, 1, 1,
-0.7505517, 2.162616, 1.853919, 1, 0, 0, 1, 1,
-0.7493086, -0.009028289, -1.441752, 1, 0, 0, 1, 1,
-0.7482698, -1.210562, -1.55305, 1, 0, 0, 1, 1,
-0.7475078, 1.373148, -0.6354676, 0, 0, 0, 1, 1,
-0.7412052, 0.8439258, 0.6951192, 0, 0, 0, 1, 1,
-0.7389093, -1.959263, -2.160447, 0, 0, 0, 1, 1,
-0.738872, -1.668325, -2.913033, 0, 0, 0, 1, 1,
-0.7385953, -1.833018, -3.556743, 0, 0, 0, 1, 1,
-0.7319412, -0.4690578, -2.73405, 0, 0, 0, 1, 1,
-0.7208994, -0.01976184, -1.478227, 0, 0, 0, 1, 1,
-0.7187377, 0.51078, -0.5950959, 1, 1, 1, 1, 1,
-0.7156363, -0.5942203, -2.550967, 1, 1, 1, 1, 1,
-0.7131033, -1.376331, -3.123505, 1, 1, 1, 1, 1,
-0.7122141, -2.197187, -4.230752, 1, 1, 1, 1, 1,
-0.7121417, 0.2894813, -0.3394796, 1, 1, 1, 1, 1,
-0.7121283, 0.5366626, -1.264529, 1, 1, 1, 1, 1,
-0.7120517, 1.611721, 0.5892894, 1, 1, 1, 1, 1,
-0.7101372, -0.6190499, -2.076732, 1, 1, 1, 1, 1,
-0.709604, -0.5860234, -2.861145, 1, 1, 1, 1, 1,
-0.7090649, -1.351116, -0.9551148, 1, 1, 1, 1, 1,
-0.7072619, -1.09506, -2.739364, 1, 1, 1, 1, 1,
-0.7023697, -0.2359912, -1.289289, 1, 1, 1, 1, 1,
-0.6916987, -0.5718092, -0.9165004, 1, 1, 1, 1, 1,
-0.6897085, -0.5860953, -3.619205, 1, 1, 1, 1, 1,
-0.6890855, -0.06357682, -0.9113023, 1, 1, 1, 1, 1,
-0.6872347, 1.82139, 0.9448353, 0, 0, 1, 1, 1,
-0.6845406, -0.03965889, -1.138082, 1, 0, 0, 1, 1,
-0.6840276, 1.55153, -1.733027, 1, 0, 0, 1, 1,
-0.6765242, 0.7794396, 0.3828923, 1, 0, 0, 1, 1,
-0.6762643, 0.231836, -0.1604515, 1, 0, 0, 1, 1,
-0.6685057, -0.3060685, -0.9255006, 1, 0, 0, 1, 1,
-0.6680245, -1.357741, -2.482748, 0, 0, 0, 1, 1,
-0.6680049, 0.8543659, -1.66179, 0, 0, 0, 1, 1,
-0.6674739, 1.431338, 1.110186, 0, 0, 0, 1, 1,
-0.6665031, 0.4069545, -1.45987, 0, 0, 0, 1, 1,
-0.6649473, -1.71737, -2.608553, 0, 0, 0, 1, 1,
-0.6643133, 1.384663, -1.604549, 0, 0, 0, 1, 1,
-0.6630467, -0.3514895, -1.774557, 0, 0, 0, 1, 1,
-0.6570793, 0.2730612, -1.058431, 1, 1, 1, 1, 1,
-0.656738, 1.307826, -0.7942958, 1, 1, 1, 1, 1,
-0.6519991, -0.09872679, -1.939992, 1, 1, 1, 1, 1,
-0.6492912, -1.248248, -2.039079, 1, 1, 1, 1, 1,
-0.6452595, -0.4933254, -1.165283, 1, 1, 1, 1, 1,
-0.6425558, -0.1118591, -2.271436, 1, 1, 1, 1, 1,
-0.6413783, 0.0997174, 0.1686954, 1, 1, 1, 1, 1,
-0.6409987, -0.9951975, -0.9726607, 1, 1, 1, 1, 1,
-0.6399587, -0.3117644, -0.8980474, 1, 1, 1, 1, 1,
-0.6386424, 0.01275356, -3.427657, 1, 1, 1, 1, 1,
-0.6239121, 0.5034394, -0.792592, 1, 1, 1, 1, 1,
-0.6178805, -1.109823, -2.633475, 1, 1, 1, 1, 1,
-0.6105607, -0.7150543, -2.231405, 1, 1, 1, 1, 1,
-0.6104454, -0.5823497, -2.83339, 1, 1, 1, 1, 1,
-0.6088948, -1.088734, -1.577712, 1, 1, 1, 1, 1,
-0.6064195, 0.3825752, -0.6364449, 0, 0, 1, 1, 1,
-0.6019715, 0.3823637, -2.359107, 1, 0, 0, 1, 1,
-0.6011142, -1.41619, -2.885277, 1, 0, 0, 1, 1,
-0.6002231, 1.227566, -1.132467, 1, 0, 0, 1, 1,
-0.5979307, -0.3969389, -2.208925, 1, 0, 0, 1, 1,
-0.5941708, 1.307468, -1.34105, 1, 0, 0, 1, 1,
-0.5931207, -0.3221158, -2.019892, 0, 0, 0, 1, 1,
-0.5885854, 0.7865713, -1.190747, 0, 0, 0, 1, 1,
-0.5836361, 0.100656, -0.976699, 0, 0, 0, 1, 1,
-0.5810942, 0.515154, -0.8862761, 0, 0, 0, 1, 1,
-0.5771875, 1.70452, 0.05508792, 0, 0, 0, 1, 1,
-0.5734838, 0.9926494, 0.7954197, 0, 0, 0, 1, 1,
-0.56802, -0.5215653, -1.884086, 0, 0, 0, 1, 1,
-0.5679377, -0.5592425, -2.917989, 1, 1, 1, 1, 1,
-0.5664853, 1.586924, -0.3065017, 1, 1, 1, 1, 1,
-0.5639881, 2.342927, -0.1326894, 1, 1, 1, 1, 1,
-0.5580216, 0.3941004, -1.051489, 1, 1, 1, 1, 1,
-0.5579909, -2.123791, -3.902534, 1, 1, 1, 1, 1,
-0.5579536, -0.7844958, -2.330673, 1, 1, 1, 1, 1,
-0.5560078, 0.1181184, -2.448139, 1, 1, 1, 1, 1,
-0.5545693, -0.3303131, -1.856102, 1, 1, 1, 1, 1,
-0.5536976, -1.334924, -2.758427, 1, 1, 1, 1, 1,
-0.5505496, 0.1239124, -1.088918, 1, 1, 1, 1, 1,
-0.5451488, 0.1608498, -0.7212145, 1, 1, 1, 1, 1,
-0.5449061, 0.252466, -1.067187, 1, 1, 1, 1, 1,
-0.5442681, -0.8389133, -4.587449, 1, 1, 1, 1, 1,
-0.5374826, -0.642583, -2.408145, 1, 1, 1, 1, 1,
-0.5362462, 0.5971992, -0.9987777, 1, 1, 1, 1, 1,
-0.5293519, -2.427281, -1.631199, 0, 0, 1, 1, 1,
-0.5277308, -0.2379157, -1.020243, 1, 0, 0, 1, 1,
-0.5265714, 1.452271, 0.7828627, 1, 0, 0, 1, 1,
-0.5224402, -1.15656, -2.411646, 1, 0, 0, 1, 1,
-0.5214362, -1.991136, -2.549005, 1, 0, 0, 1, 1,
-0.516686, -1.829181, -3.075234, 1, 0, 0, 1, 1,
-0.5161024, 1.353066, -1.526862, 0, 0, 0, 1, 1,
-0.5143786, 0.5251831, -1.961802, 0, 0, 0, 1, 1,
-0.5124908, -0.5324092, -1.666186, 0, 0, 0, 1, 1,
-0.5118113, 1.274688, 0.8839574, 0, 0, 0, 1, 1,
-0.5081784, 0.5828094, 0.4997338, 0, 0, 0, 1, 1,
-0.5070228, -0.4619903, -0.9081484, 0, 0, 0, 1, 1,
-0.5065592, 0.2816473, -0.1996202, 0, 0, 0, 1, 1,
-0.4935889, -0.4193252, -0.9581549, 1, 1, 1, 1, 1,
-0.4898746, -0.326926, -2.189235, 1, 1, 1, 1, 1,
-0.4875949, -0.07864261, -3.583044, 1, 1, 1, 1, 1,
-0.4854892, 0.3755378, -1.622593, 1, 1, 1, 1, 1,
-0.4814805, 0.8167325, -0.285542, 1, 1, 1, 1, 1,
-0.477172, -1.067013, -3.173323, 1, 1, 1, 1, 1,
-0.4771082, 0.5852086, -0.2605483, 1, 1, 1, 1, 1,
-0.4761943, -0.8556058, -3.473359, 1, 1, 1, 1, 1,
-0.4706583, 2.657709, 0.3755482, 1, 1, 1, 1, 1,
-0.4700615, 0.6294149, -1.129849, 1, 1, 1, 1, 1,
-0.4682651, -0.3597493, -1.972064, 1, 1, 1, 1, 1,
-0.4638671, -2.359255, -2.770262, 1, 1, 1, 1, 1,
-0.4619847, 0.7669716, 0.2638061, 1, 1, 1, 1, 1,
-0.460701, 1.346579, 0.8776311, 1, 1, 1, 1, 1,
-0.4567243, -2.090589, -1.516165, 1, 1, 1, 1, 1,
-0.4563318, -0.7313582, -3.397517, 0, 0, 1, 1, 1,
-0.4545752, 1.597078, -1.369311, 1, 0, 0, 1, 1,
-0.4525369, 0.5420086, -0.3399753, 1, 0, 0, 1, 1,
-0.4508283, -0.7095281, -3.368452, 1, 0, 0, 1, 1,
-0.447998, -0.4874419, -1.785395, 1, 0, 0, 1, 1,
-0.4474143, 0.4860142, -2.937923, 1, 0, 0, 1, 1,
-0.4314618, 0.2522675, -0.6952879, 0, 0, 0, 1, 1,
-0.4287547, 0.171067, -0.6640202, 0, 0, 0, 1, 1,
-0.4238791, 1.123828, -0.5934982, 0, 0, 0, 1, 1,
-0.4178652, 1.78376, 0.4009294, 0, 0, 0, 1, 1,
-0.4158035, 0.6920679, -2.237121, 0, 0, 0, 1, 1,
-0.4152186, 1.181492, -1.259672, 0, 0, 0, 1, 1,
-0.4146655, 0.6659358, -0.356432, 0, 0, 0, 1, 1,
-0.4112332, 1.23966, -1.195343, 1, 1, 1, 1, 1,
-0.4109335, -0.3217231, -2.040315, 1, 1, 1, 1, 1,
-0.410858, -1.085045, -2.885936, 1, 1, 1, 1, 1,
-0.4098143, -0.4445871, -1.87872, 1, 1, 1, 1, 1,
-0.4086093, 1.959663, -0.2753361, 1, 1, 1, 1, 1,
-0.407197, -1.101878, -1.790408, 1, 1, 1, 1, 1,
-0.3999812, 0.8269788, 0.2533504, 1, 1, 1, 1, 1,
-0.3996146, 0.3518505, -0.4180627, 1, 1, 1, 1, 1,
-0.3989024, -0.7827645, -5.252433, 1, 1, 1, 1, 1,
-0.3984909, -1.198651, -1.506169, 1, 1, 1, 1, 1,
-0.3978648, 1.939531, 2.012205, 1, 1, 1, 1, 1,
-0.3972395, -1.447456, -1.916106, 1, 1, 1, 1, 1,
-0.3954098, 0.227521, 1.788197, 1, 1, 1, 1, 1,
-0.3951102, 1.342524, -0.5045245, 1, 1, 1, 1, 1,
-0.3930416, -0.02034863, -2.147589, 1, 1, 1, 1, 1,
-0.3815594, 0.9280791, -0.1911248, 0, 0, 1, 1, 1,
-0.3803436, -0.1664313, -1.319838, 1, 0, 0, 1, 1,
-0.3767551, 1.717856, -0.325245, 1, 0, 0, 1, 1,
-0.3672195, -0.3465309, -1.525895, 1, 0, 0, 1, 1,
-0.3651022, 0.4586261, 0.0482657, 1, 0, 0, 1, 1,
-0.3583542, 0.4066612, -1.786383, 1, 0, 0, 1, 1,
-0.35707, -0.4859163, -0.7217962, 0, 0, 0, 1, 1,
-0.3537386, 2.546658, -0.6253113, 0, 0, 0, 1, 1,
-0.3499188, 0.6183321, -0.1828008, 0, 0, 0, 1, 1,
-0.3481895, 0.10742, -0.4825935, 0, 0, 0, 1, 1,
-0.3421858, -0.07584389, -1.493867, 0, 0, 0, 1, 1,
-0.3392913, -1.063349, -4.638199, 0, 0, 0, 1, 1,
-0.3382833, -1.405579, -4.160364, 0, 0, 0, 1, 1,
-0.3358105, 0.2031944, -0.3455798, 1, 1, 1, 1, 1,
-0.3355798, 0.222107, -0.2203166, 1, 1, 1, 1, 1,
-0.334566, -0.1051866, -3.442023, 1, 1, 1, 1, 1,
-0.3290997, 0.9993147, 1.041467, 1, 1, 1, 1, 1,
-0.3220848, -0.5827726, -3.295575, 1, 1, 1, 1, 1,
-0.3199936, -0.1587456, -3.200604, 1, 1, 1, 1, 1,
-0.3196226, -2.005563, -3.477628, 1, 1, 1, 1, 1,
-0.318482, 0.41408, -1.792873, 1, 1, 1, 1, 1,
-0.3175777, -0.968362, -3.901661, 1, 1, 1, 1, 1,
-0.3160184, 1.124876, -0.2686599, 1, 1, 1, 1, 1,
-0.3120966, 1.620065, 0.5257847, 1, 1, 1, 1, 1,
-0.3116866, -0.9439097, -2.718951, 1, 1, 1, 1, 1,
-0.3115316, 0.3359911, 1.364309, 1, 1, 1, 1, 1,
-0.3107985, 0.1206675, -1.039592, 1, 1, 1, 1, 1,
-0.3067386, 0.950816, 0.7757465, 1, 1, 1, 1, 1,
-0.3029775, 1.92323, -0.618564, 0, 0, 1, 1, 1,
-0.3026243, -0.5564631, -4.071891, 1, 0, 0, 1, 1,
-0.2986945, -0.3461151, -2.886861, 1, 0, 0, 1, 1,
-0.2960461, 0.910235, -0.5012971, 1, 0, 0, 1, 1,
-0.2942406, 1.431517, 0.1171646, 1, 0, 0, 1, 1,
-0.2921817, -1.335598, -1.390547, 1, 0, 0, 1, 1,
-0.2911934, -0.02504097, -2.949546, 0, 0, 0, 1, 1,
-0.2911269, -1.028875, -3.618036, 0, 0, 0, 1, 1,
-0.2864483, 0.286195, -1.452112, 0, 0, 0, 1, 1,
-0.2850565, -0.750181, -0.8297433, 0, 0, 0, 1, 1,
-0.2825188, -0.9937583, -2.005229, 0, 0, 0, 1, 1,
-0.279034, 0.3571103, 0.1215914, 0, 0, 0, 1, 1,
-0.278243, -0.7063869, -3.75192, 0, 0, 0, 1, 1,
-0.2752426, 1.188603, 0.6330818, 1, 1, 1, 1, 1,
-0.2703497, 0.8788784, -1.498734, 1, 1, 1, 1, 1,
-0.2688201, 0.9308195, 1.231345, 1, 1, 1, 1, 1,
-0.2633924, 0.7376627, -0.3732497, 1, 1, 1, 1, 1,
-0.260013, 0.7885105, 0.7146932, 1, 1, 1, 1, 1,
-0.2594537, -0.1618793, -0.4900724, 1, 1, 1, 1, 1,
-0.2587865, 1.030754, -0.2651331, 1, 1, 1, 1, 1,
-0.2547638, 0.0995562, -0.9460476, 1, 1, 1, 1, 1,
-0.251301, 2.295831, -1.09934, 1, 1, 1, 1, 1,
-0.2467453, 0.1274786, -0.9782445, 1, 1, 1, 1, 1,
-0.2441358, -1.905104, -2.63593, 1, 1, 1, 1, 1,
-0.2440323, -0.2016786, -3.80261, 1, 1, 1, 1, 1,
-0.2431912, 0.1419717, -0.8140964, 1, 1, 1, 1, 1,
-0.2422169, -0.9134246, -2.498284, 1, 1, 1, 1, 1,
-0.241176, -0.3361659, -1.999461, 1, 1, 1, 1, 1,
-0.2354354, -1.547385, -2.406132, 0, 0, 1, 1, 1,
-0.2285028, 1.427013, -0.4557762, 1, 0, 0, 1, 1,
-0.2236043, -2.019088, -3.65787, 1, 0, 0, 1, 1,
-0.2213887, 0.8354055, 1.264792, 1, 0, 0, 1, 1,
-0.2157639, 1.055137, -0.3226968, 1, 0, 0, 1, 1,
-0.2155875, 0.7446557, -0.9649183, 1, 0, 0, 1, 1,
-0.2155085, -0.07307837, -2.082099, 0, 0, 0, 1, 1,
-0.2143787, -0.07437929, -1.981419, 0, 0, 0, 1, 1,
-0.2036857, 0.9585513, -1.347341, 0, 0, 0, 1, 1,
-0.2000848, 0.4288139, 0.5241755, 0, 0, 0, 1, 1,
-0.1987607, 1.291696, -0.1327036, 0, 0, 0, 1, 1,
-0.1966095, 0.3114228, -1.243104, 0, 0, 0, 1, 1,
-0.1931243, -1.289713, -3.117911, 0, 0, 0, 1, 1,
-0.1908184, 0.9837462, 0.1948267, 1, 1, 1, 1, 1,
-0.1897418, 0.5923935, -0.2039427, 1, 1, 1, 1, 1,
-0.1878076, 1.301001, 0.8781844, 1, 1, 1, 1, 1,
-0.1877905, -1.084123, -2.120688, 1, 1, 1, 1, 1,
-0.1858418, -1.121036, -2.537447, 1, 1, 1, 1, 1,
-0.185245, 1.322804, -0.03038551, 1, 1, 1, 1, 1,
-0.1847976, 0.6497247, 0.03283678, 1, 1, 1, 1, 1,
-0.1784384, 0.5652425, 0.293052, 1, 1, 1, 1, 1,
-0.1668499, 0.4738023, -0.8596795, 1, 1, 1, 1, 1,
-0.1654896, -0.2620267, -2.66231, 1, 1, 1, 1, 1,
-0.1643822, 0.02881342, -0.8116452, 1, 1, 1, 1, 1,
-0.1639821, -1.472735, -2.304278, 1, 1, 1, 1, 1,
-0.1629864, 1.359676, 0.9179268, 1, 1, 1, 1, 1,
-0.1614683, -0.204959, -1.185433, 1, 1, 1, 1, 1,
-0.1607555, 0.8334306, -2.05456, 1, 1, 1, 1, 1,
-0.1541902, 2.066235, -0.8196974, 0, 0, 1, 1, 1,
-0.1535381, -1.553336, -4.089798, 1, 0, 0, 1, 1,
-0.1534977, -0.3421864, -2.967392, 1, 0, 0, 1, 1,
-0.1531538, 1.183125, -0.8581421, 1, 0, 0, 1, 1,
-0.1472845, 2.520714, 0.3244332, 1, 0, 0, 1, 1,
-0.1468245, -0.7179548, -3.110142, 1, 0, 0, 1, 1,
-0.1423316, 0.1810291, -0.04137604, 0, 0, 0, 1, 1,
-0.1411134, -0.06850669, -0.6178096, 0, 0, 0, 1, 1,
-0.1389424, -0.5477492, -3.011747, 0, 0, 0, 1, 1,
-0.1370537, -1.883605, -3.49128, 0, 0, 0, 1, 1,
-0.136222, -0.4215996, -2.71679, 0, 0, 0, 1, 1,
-0.1356822, -0.6929618, -0.1837728, 0, 0, 0, 1, 1,
-0.1315097, -0.7129475, -3.622559, 0, 0, 0, 1, 1,
-0.1312709, 0.4688024, -0.5594859, 1, 1, 1, 1, 1,
-0.1280891, 1.676357, -0.2657429, 1, 1, 1, 1, 1,
-0.1274692, 0.7029058, -0.7368041, 1, 1, 1, 1, 1,
-0.125274, 1.42339, -0.4634357, 1, 1, 1, 1, 1,
-0.1223156, 0.325409, 0.2502449, 1, 1, 1, 1, 1,
-0.1211989, -0.2511248, -1.885786, 1, 1, 1, 1, 1,
-0.1171379, -0.9599125, -3.742765, 1, 1, 1, 1, 1,
-0.114862, 0.5291901, 0.9942583, 1, 1, 1, 1, 1,
-0.1128755, -0.9153214, -2.708414, 1, 1, 1, 1, 1,
-0.1113408, 2.089864, -1.127554, 1, 1, 1, 1, 1,
-0.1106687, -2.242883, -3.210654, 1, 1, 1, 1, 1,
-0.1083011, 1.495847, -1.302233, 1, 1, 1, 1, 1,
-0.1058155, -0.7991969, -2.625972, 1, 1, 1, 1, 1,
-0.1023443, -0.3417802, -1.815579, 1, 1, 1, 1, 1,
-0.1016218, 0.6443184, 0.7358271, 1, 1, 1, 1, 1,
-0.09542184, 0.9907608, 0.7159683, 0, 0, 1, 1, 1,
-0.09523711, 0.4020404, 0.3227676, 1, 0, 0, 1, 1,
-0.08988588, 0.3307315, -1.6086, 1, 0, 0, 1, 1,
-0.08473125, 0.5086583, 0.4337081, 1, 0, 0, 1, 1,
-0.0770288, -0.9502888, -3.530422, 1, 0, 0, 1, 1,
-0.0731356, 0.7759063, -0.7986803, 1, 0, 0, 1, 1,
-0.07149892, 1.534023, -1.930673, 0, 0, 0, 1, 1,
-0.07125108, 2.178726, -0.8875608, 0, 0, 0, 1, 1,
-0.07115953, 0.3293504, 1.067564, 0, 0, 0, 1, 1,
-0.07100247, 1.698357, 0.9065203, 0, 0, 0, 1, 1,
-0.07073732, 0.2041574, 0.6981275, 0, 0, 0, 1, 1,
-0.06285319, 0.422294, 0.2202234, 0, 0, 0, 1, 1,
-0.06193472, 1.342221, -0.7774132, 0, 0, 0, 1, 1,
-0.06040821, 0.2529571, -1.081197, 1, 1, 1, 1, 1,
-0.05647071, -2.803037, -4.465529, 1, 1, 1, 1, 1,
-0.05535587, 0.1970769, 0.2677936, 1, 1, 1, 1, 1,
-0.05404553, -1.067738, -2.589547, 1, 1, 1, 1, 1,
-0.05038421, -1.144545, -3.627152, 1, 1, 1, 1, 1,
-0.050344, 0.557639, 0.2474914, 1, 1, 1, 1, 1,
-0.04946951, -2.627773, -1.677402, 1, 1, 1, 1, 1,
-0.04768486, 0.5149311, -1.414958, 1, 1, 1, 1, 1,
-0.04701667, -0.0204512, -1.734127, 1, 1, 1, 1, 1,
-0.04572143, 0.6231408, 0.2221519, 1, 1, 1, 1, 1,
-0.04551034, 1.771986, -0.4724108, 1, 1, 1, 1, 1,
-0.04524679, -0.3762209, -2.135925, 1, 1, 1, 1, 1,
-0.04448379, -0.8943889, -4.33886, 1, 1, 1, 1, 1,
-0.04239164, 0.5464174, 0.4932054, 1, 1, 1, 1, 1,
-0.03998588, -1.132228, -4.025131, 1, 1, 1, 1, 1,
-0.03515027, -1.670449, -2.010329, 0, 0, 1, 1, 1,
-0.033309, -0.7961758, -4.666808, 1, 0, 0, 1, 1,
-0.03081341, 0.3375231, -1.164171, 1, 0, 0, 1, 1,
-0.03027198, -0.1870599, -3.609161, 1, 0, 0, 1, 1,
-0.03014143, -0.07215907, -3.590694, 1, 0, 0, 1, 1,
-0.03008557, 0.3038351, -0.6487222, 1, 0, 0, 1, 1,
-0.02302017, 0.3577298, -0.2635975, 0, 0, 0, 1, 1,
-0.02238847, 1.23093, 0.6255527, 0, 0, 0, 1, 1,
-0.02159239, -0.4347215, -2.415368, 0, 0, 0, 1, 1,
-0.01939213, 0.3586313, -0.1470493, 0, 0, 0, 1, 1,
-0.01585633, 0.9973975, 0.3420998, 0, 0, 0, 1, 1,
-0.01305274, -2.802856, -3.092212, 0, 0, 0, 1, 1,
-0.01232806, 1.664081, -0.6871311, 0, 0, 0, 1, 1,
-0.01138768, 0.6986265, 1.920027, 1, 1, 1, 1, 1,
-0.01099271, 0.2198951, 0.3014482, 1, 1, 1, 1, 1,
-0.009457988, 0.3767633, 1.228294, 1, 1, 1, 1, 1,
-0.00685791, -0.9433563, -4.706592, 1, 1, 1, 1, 1,
-0.004280649, -0.7217451, -2.949192, 1, 1, 1, 1, 1,
-0.003836622, 0.094394, -0.4624885, 1, 1, 1, 1, 1,
0.002310622, 0.7370633, 0.9120336, 1, 1, 1, 1, 1,
0.002882842, -0.8419505, 4.167188, 1, 1, 1, 1, 1,
0.003436117, -0.3416923, 2.242911, 1, 1, 1, 1, 1,
0.005644069, 1.108037, -0.05682808, 1, 1, 1, 1, 1,
0.005954067, 0.4413913, 0.1961177, 1, 1, 1, 1, 1,
0.009244704, -0.2888095, 4.66737, 1, 1, 1, 1, 1,
0.01092146, 0.5828842, -0.1472827, 1, 1, 1, 1, 1,
0.01841254, 0.8477381, -1.777539, 1, 1, 1, 1, 1,
0.03244605, -0.4047742, 2.503189, 1, 1, 1, 1, 1,
0.03747135, 1.472438, 1.987152, 0, 0, 1, 1, 1,
0.04038497, 0.6690075, -0.157262, 1, 0, 0, 1, 1,
0.04070704, -0.434693, 3.40973, 1, 0, 0, 1, 1,
0.04360308, -2.808276, 3.482048, 1, 0, 0, 1, 1,
0.04535636, 0.2561354, -0.1494907, 1, 0, 0, 1, 1,
0.04868858, -0.2240486, 3.092205, 1, 0, 0, 1, 1,
0.05331831, -0.06941892, 3.356899, 0, 0, 0, 1, 1,
0.05557986, -1.138609, 4.138047, 0, 0, 0, 1, 1,
0.05744258, -0.6447358, 2.52722, 0, 0, 0, 1, 1,
0.06007994, 1.095673, 0.8048091, 0, 0, 0, 1, 1,
0.06382878, 0.5412859, 0.6883753, 0, 0, 0, 1, 1,
0.0665479, 0.4938684, 0.4670476, 0, 0, 0, 1, 1,
0.06892167, -0.8324858, 2.926022, 0, 0, 0, 1, 1,
0.06983081, 0.4747948, -0.7077682, 1, 1, 1, 1, 1,
0.06988058, -0.05507364, 2.410603, 1, 1, 1, 1, 1,
0.07240021, -0.1464695, 3.783994, 1, 1, 1, 1, 1,
0.07330366, -0.2163185, 1.450284, 1, 1, 1, 1, 1,
0.07469013, 0.2113242, -0.1998641, 1, 1, 1, 1, 1,
0.07478913, -0.4192819, 1.813998, 1, 1, 1, 1, 1,
0.07483704, 0.02620731, 2.253374, 1, 1, 1, 1, 1,
0.077388, 1.236023, 0.04887717, 1, 1, 1, 1, 1,
0.08047195, 0.4339803, -0.2053749, 1, 1, 1, 1, 1,
0.08520174, 0.9117893, 0.1823484, 1, 1, 1, 1, 1,
0.08598146, 0.33824, -0.289358, 1, 1, 1, 1, 1,
0.08790482, 0.1087392, -0.0274695, 1, 1, 1, 1, 1,
0.08813525, 0.9653819, 0.2101993, 1, 1, 1, 1, 1,
0.09214217, 0.1376934, 1.919242, 1, 1, 1, 1, 1,
0.09237397, -0.747151, 1.681425, 1, 1, 1, 1, 1,
0.09292518, -0.9678949, 0.4617873, 0, 0, 1, 1, 1,
0.09667126, 0.07420523, -0.8311764, 1, 0, 0, 1, 1,
0.09876949, -0.3385537, 1.703745, 1, 0, 0, 1, 1,
0.1024358, 1.308764, -0.042831, 1, 0, 0, 1, 1,
0.1041367, -1.028313, 3.042537, 1, 0, 0, 1, 1,
0.1165883, -0.2352419, 3.803008, 1, 0, 0, 1, 1,
0.1166044, -0.9754209, 0.4878718, 0, 0, 0, 1, 1,
0.116668, -0.7709914, 3.417572, 0, 0, 0, 1, 1,
0.1178589, -1.270156, 3.305129, 0, 0, 0, 1, 1,
0.1216201, 0.03426072, 1.155724, 0, 0, 0, 1, 1,
0.1232634, 0.5821935, -2.130941, 0, 0, 0, 1, 1,
0.1235127, 1.316937, 0.5679224, 0, 0, 0, 1, 1,
0.1236627, -0.946211, 2.641651, 0, 0, 0, 1, 1,
0.1288716, 0.1841402, 1.691458, 1, 1, 1, 1, 1,
0.1305543, -2.730968, 3.992901, 1, 1, 1, 1, 1,
0.1312225, 1.345408, -1.033179, 1, 1, 1, 1, 1,
0.1333322, -0.8523505, 2.624045, 1, 1, 1, 1, 1,
0.1340572, -0.9138521, 2.818846, 1, 1, 1, 1, 1,
0.1406702, 0.4704828, -0.4793763, 1, 1, 1, 1, 1,
0.1425415, -0.4498749, 1.416667, 1, 1, 1, 1, 1,
0.143158, 0.2044834, 0.5614855, 1, 1, 1, 1, 1,
0.1499603, 0.7585133, -1.129128, 1, 1, 1, 1, 1,
0.1504231, 1.76084, 1.183865, 1, 1, 1, 1, 1,
0.1523024, 0.5138658, -1.505212, 1, 1, 1, 1, 1,
0.1557877, 1.133045, 0.2880055, 1, 1, 1, 1, 1,
0.1571796, 0.5889171, 0.2322379, 1, 1, 1, 1, 1,
0.160696, -0.8656928, 2.990141, 1, 1, 1, 1, 1,
0.1623957, -2.729535, 3.429535, 1, 1, 1, 1, 1,
0.1644818, -0.01634063, 2.175116, 0, 0, 1, 1, 1,
0.1741028, 0.1119434, 2.554564, 1, 0, 0, 1, 1,
0.1748552, -1.485634, 3.299737, 1, 0, 0, 1, 1,
0.1760886, -1.061647, 3.041591, 1, 0, 0, 1, 1,
0.1768826, -0.9877985, 2.143414, 1, 0, 0, 1, 1,
0.1772823, -1.019217, 2.648996, 1, 0, 0, 1, 1,
0.1777357, -0.1505622, 2.218317, 0, 0, 0, 1, 1,
0.1793001, -0.08744841, 3.454237, 0, 0, 0, 1, 1,
0.1793193, 0.2990862, 1.705408, 0, 0, 0, 1, 1,
0.1824715, -1.316648, 2.116276, 0, 0, 0, 1, 1,
0.1829378, -0.7412149, 1.537975, 0, 0, 0, 1, 1,
0.1833327, -0.7556287, 2.726714, 0, 0, 0, 1, 1,
0.1839048, 1.41896, 0.6828302, 0, 0, 0, 1, 1,
0.1848833, 2.143202, -1.52584, 1, 1, 1, 1, 1,
0.1984502, 1.560621, -0.4468229, 1, 1, 1, 1, 1,
0.1996865, 2.002366, 0.6514801, 1, 1, 1, 1, 1,
0.1998209, -1.48742, 4.335317, 1, 1, 1, 1, 1,
0.201139, -0.3460215, 2.995894, 1, 1, 1, 1, 1,
0.2028955, -0.1225624, 1.683748, 1, 1, 1, 1, 1,
0.2044207, 0.2359964, 0.4568237, 1, 1, 1, 1, 1,
0.2134348, -0.493723, 3.498726, 1, 1, 1, 1, 1,
0.2150464, -1.037396, 4.252978, 1, 1, 1, 1, 1,
0.2156463, 0.2560407, -2.015234, 1, 1, 1, 1, 1,
0.2160268, -1.280863, 3.534849, 1, 1, 1, 1, 1,
0.2165103, -0.3535885, 4.391845, 1, 1, 1, 1, 1,
0.2175208, -1.157171, 3.089918, 1, 1, 1, 1, 1,
0.2181537, -1.941748, 2.508079, 1, 1, 1, 1, 1,
0.2249946, 0.8098155, 0.643504, 1, 1, 1, 1, 1,
0.2262539, -0.837939, 2.081103, 0, 0, 1, 1, 1,
0.2270571, 1.312935, -0.6675971, 1, 0, 0, 1, 1,
0.2279631, 1.637045, 0.6693824, 1, 0, 0, 1, 1,
0.2282899, -1.15692, 2.436695, 1, 0, 0, 1, 1,
0.2309761, -0.1429654, 3.0302, 1, 0, 0, 1, 1,
0.2369568, -1.381972, 5.737142, 1, 0, 0, 1, 1,
0.2370906, -0.4308589, 2.761517, 0, 0, 0, 1, 1,
0.2390715, -1.330762, 2.877721, 0, 0, 0, 1, 1,
0.240754, -0.8346033, 3.760003, 0, 0, 0, 1, 1,
0.2424446, -0.5121151, -0.5404463, 0, 0, 0, 1, 1,
0.2437888, 0.046356, 2.886871, 0, 0, 0, 1, 1,
0.2533201, 0.1497711, -0.1808311, 0, 0, 0, 1, 1,
0.2579729, 0.9932747, 0.08661609, 0, 0, 0, 1, 1,
0.2587351, -0.7861048, 4.214394, 1, 1, 1, 1, 1,
0.2612785, -0.1693132, 2.93663, 1, 1, 1, 1, 1,
0.2658191, 0.7162735, 0.3076339, 1, 1, 1, 1, 1,
0.2679868, -0.02768955, 3.713816, 1, 1, 1, 1, 1,
0.2680092, 2.127869, -0.1902182, 1, 1, 1, 1, 1,
0.2703469, -0.274138, 4.504072, 1, 1, 1, 1, 1,
0.2753067, 0.4983677, 0.5126403, 1, 1, 1, 1, 1,
0.2754275, -0.6768087, 3.141026, 1, 1, 1, 1, 1,
0.2767999, -0.5124388, 1.503741, 1, 1, 1, 1, 1,
0.2782389, -1.544567, 2.442223, 1, 1, 1, 1, 1,
0.2816513, -1.680494, 2.650696, 1, 1, 1, 1, 1,
0.2826928, -0.9843724, 1.821035, 1, 1, 1, 1, 1,
0.2845783, 0.3249718, -0.5293112, 1, 1, 1, 1, 1,
0.2930629, -0.7989123, 3.113889, 1, 1, 1, 1, 1,
0.2950726, 1.278409, -1.02128, 1, 1, 1, 1, 1,
0.2952698, -0.09721447, 2.450434, 0, 0, 1, 1, 1,
0.3040058, 1.212651, -0.4565769, 1, 0, 0, 1, 1,
0.3099449, 0.7124063, 0.1548496, 1, 0, 0, 1, 1,
0.3114497, -0.4262639, 1.449963, 1, 0, 0, 1, 1,
0.3130306, -0.3711441, 3.56248, 1, 0, 0, 1, 1,
0.3145244, -0.5939608, 1.810995, 1, 0, 0, 1, 1,
0.3154577, -1.628026, 1.151797, 0, 0, 0, 1, 1,
0.324157, -0.2220856, 2.359375, 0, 0, 0, 1, 1,
0.3241906, 0.5211367, 0.770189, 0, 0, 0, 1, 1,
0.3276847, -0.1816145, 2.558129, 0, 0, 0, 1, 1,
0.3277333, 0.6651391, 1.365541, 0, 0, 0, 1, 1,
0.3288429, 0.8810691, 0.008194653, 0, 0, 0, 1, 1,
0.3357986, -0.06239462, 2.682322, 0, 0, 0, 1, 1,
0.3381041, 0.8251368, 1.941321, 1, 1, 1, 1, 1,
0.3402581, -0.4680364, 3.336439, 1, 1, 1, 1, 1,
0.3442089, 1.03671, 2.108539, 1, 1, 1, 1, 1,
0.3468979, 0.3564505, 0.967768, 1, 1, 1, 1, 1,
0.3535617, -2.296662, 3.841571, 1, 1, 1, 1, 1,
0.3604347, 0.8422148, 0.200299, 1, 1, 1, 1, 1,
0.3627706, 0.4336505, 0.06211183, 1, 1, 1, 1, 1,
0.3632865, 0.3372401, -0.1288472, 1, 1, 1, 1, 1,
0.3637471, -0.07439911, 0.1187456, 1, 1, 1, 1, 1,
0.3696696, -0.2483078, 2.551491, 1, 1, 1, 1, 1,
0.3704873, -0.4667652, 3.924849, 1, 1, 1, 1, 1,
0.372199, -0.07001099, 0.9009123, 1, 1, 1, 1, 1,
0.372625, 0.008314961, 1.679196, 1, 1, 1, 1, 1,
0.3728211, -0.3313463, 1.197015, 1, 1, 1, 1, 1,
0.3792111, 0.09800259, 0.8249848, 1, 1, 1, 1, 1,
0.3815566, -0.4602241, 1.198308, 0, 0, 1, 1, 1,
0.3867595, 0.8167108, 0.2418939, 1, 0, 0, 1, 1,
0.3875652, -1.927185, 4.055424, 1, 0, 0, 1, 1,
0.3881734, -0.7962393, 1.804106, 1, 0, 0, 1, 1,
0.3901514, -1.456768, 2.304405, 1, 0, 0, 1, 1,
0.3903468, 1.590818, -0.3642136, 1, 0, 0, 1, 1,
0.3999714, -0.5662037, 1.442882, 0, 0, 0, 1, 1,
0.4017636, 0.6557032, -1.319257, 0, 0, 0, 1, 1,
0.4066184, -0.2168738, 3.362756, 0, 0, 0, 1, 1,
0.4099078, 0.3781658, -1.123049, 0, 0, 0, 1, 1,
0.410424, -0.1562967, 1.665937, 0, 0, 0, 1, 1,
0.4173875, 0.6320339, 0.9120173, 0, 0, 0, 1, 1,
0.4196577, -1.831154, 2.332828, 0, 0, 0, 1, 1,
0.4251751, 0.1680701, 2.28668, 1, 1, 1, 1, 1,
0.4282279, 0.695812, 2.36208, 1, 1, 1, 1, 1,
0.4291399, -0.1048228, 2.700853, 1, 1, 1, 1, 1,
0.4313616, 0.1719614, 0.8928818, 1, 1, 1, 1, 1,
0.4318775, 1.685732, 1.285787, 1, 1, 1, 1, 1,
0.4402243, -0.4054562, 1.572728, 1, 1, 1, 1, 1,
0.4410699, -1.661229, 4.294509, 1, 1, 1, 1, 1,
0.4421557, 1.003399, 1.104697, 1, 1, 1, 1, 1,
0.4436368, 0.9812847, -0.4007224, 1, 1, 1, 1, 1,
0.4458246, -1.86827, 3.145429, 1, 1, 1, 1, 1,
0.4473113, 0.123991, 0.5174739, 1, 1, 1, 1, 1,
0.4484635, 0.7440324, -1.281231, 1, 1, 1, 1, 1,
0.4491569, -0.01105833, 1.076493, 1, 1, 1, 1, 1,
0.4526718, -1.07172, 2.217985, 1, 1, 1, 1, 1,
0.4603432, -1.855495, 2.744028, 1, 1, 1, 1, 1,
0.4651842, 0.1892838, 3.039311, 0, 0, 1, 1, 1,
0.4702598, -0.4494361, -0.139888, 1, 0, 0, 1, 1,
0.4727823, 0.4031886, 0.4199399, 1, 0, 0, 1, 1,
0.4740951, -0.6888146, 0.6084965, 1, 0, 0, 1, 1,
0.4776986, -0.9958987, 2.597917, 1, 0, 0, 1, 1,
0.4777718, 0.1885016, 0.00972139, 1, 0, 0, 1, 1,
0.481085, 0.06145824, 1.278449, 0, 0, 0, 1, 1,
0.4836953, -0.05098729, 1.850834, 0, 0, 0, 1, 1,
0.4847998, -0.933592, 1.834162, 0, 0, 0, 1, 1,
0.4856422, 0.2538868, 2.953926, 0, 0, 0, 1, 1,
0.4902798, 0.4105869, 0.4804252, 0, 0, 0, 1, 1,
0.4976203, -1.121373, 1.809373, 0, 0, 0, 1, 1,
0.4985008, -0.2267822, 1.301979, 0, 0, 0, 1, 1,
0.5054387, 1.192871, -0.172808, 1, 1, 1, 1, 1,
0.5083014, 0.4357625, 1.222572, 1, 1, 1, 1, 1,
0.508812, -0.2777448, 2.456981, 1, 1, 1, 1, 1,
0.51224, -1.24803, 3.0889, 1, 1, 1, 1, 1,
0.5147803, 0.02909259, 2.994778, 1, 1, 1, 1, 1,
0.5199222, 2.905405, 1.600211, 1, 1, 1, 1, 1,
0.521109, 1.327882, 0.2940604, 1, 1, 1, 1, 1,
0.5325416, 1.556109, -0.3616618, 1, 1, 1, 1, 1,
0.5334105, -0.8156737, 2.634256, 1, 1, 1, 1, 1,
0.5457814, -1.076117, 2.192257, 1, 1, 1, 1, 1,
0.5460323, 2.783359, 0.3555846, 1, 1, 1, 1, 1,
0.5471943, 0.3614976, 1.884007, 1, 1, 1, 1, 1,
0.5477587, -0.4473619, 1.943206, 1, 1, 1, 1, 1,
0.549468, -0.03939549, 2.870003, 1, 1, 1, 1, 1,
0.55338, 1.069299, 0.4646401, 1, 1, 1, 1, 1,
0.5607349, -1.527338, 4.171662, 0, 0, 1, 1, 1,
0.5611482, -0.6420149, 2.237495, 1, 0, 0, 1, 1,
0.5626886, -0.6177124, 3.074538, 1, 0, 0, 1, 1,
0.5644212, -0.3453273, 2.70383, 1, 0, 0, 1, 1,
0.5698991, 0.2678699, 1.956865, 1, 0, 0, 1, 1,
0.5707099, -0.8779615, 1.695086, 1, 0, 0, 1, 1,
0.5756478, 0.6005515, 1.680379, 0, 0, 0, 1, 1,
0.5805336, 1.034981, 1.415879, 0, 0, 0, 1, 1,
0.5876629, 0.1259542, 0.8665606, 0, 0, 0, 1, 1,
0.588537, 0.461979, 1.178044, 0, 0, 0, 1, 1,
0.5896454, 2.119734, 0.3479515, 0, 0, 0, 1, 1,
0.5938241, 1.314006, 0.9351012, 0, 0, 0, 1, 1,
0.596278, 1.091584, -0.09370348, 0, 0, 0, 1, 1,
0.6046388, 0.1694863, 0.2705995, 1, 1, 1, 1, 1,
0.6107896, -1.182738, 2.452113, 1, 1, 1, 1, 1,
0.6115972, 0.2565746, 1.65854, 1, 1, 1, 1, 1,
0.6220657, 0.7873437, 0.7001867, 1, 1, 1, 1, 1,
0.6270275, 1.005922, 2.105151, 1, 1, 1, 1, 1,
0.6367185, -1.846107, 4.192626, 1, 1, 1, 1, 1,
0.6378241, -1.448212, 3.082901, 1, 1, 1, 1, 1,
0.6385189, 1.535988, 0.9258857, 1, 1, 1, 1, 1,
0.6394435, 2.078863, -0.1127842, 1, 1, 1, 1, 1,
0.641689, 0.7085727, 1.446181, 1, 1, 1, 1, 1,
0.6439916, 1.119379, 0.7811944, 1, 1, 1, 1, 1,
0.6448704, -1.091885, 2.200434, 1, 1, 1, 1, 1,
0.6481308, 0.6452945, 0.6896194, 1, 1, 1, 1, 1,
0.650982, 2.067874, 1.080842, 1, 1, 1, 1, 1,
0.651992, 0.1384014, 1.538992, 1, 1, 1, 1, 1,
0.6634113, -0.1879085, 1.282364, 0, 0, 1, 1, 1,
0.6634529, -0.1556757, 1.928427, 1, 0, 0, 1, 1,
0.6675151, -0.7651741, 1.385481, 1, 0, 0, 1, 1,
0.6678877, 0.1459229, 1.75118, 1, 0, 0, 1, 1,
0.6692607, 0.970787, 0.0722426, 1, 0, 0, 1, 1,
0.6701005, -1.185581, 1.135043, 1, 0, 0, 1, 1,
0.6710936, 1.0002, 0.1420705, 0, 0, 0, 1, 1,
0.6718245, -0.8212388, 4.88153, 0, 0, 0, 1, 1,
0.6740332, -1.121981, 2.136054, 0, 0, 0, 1, 1,
0.696644, 0.287968, 1.401892, 0, 0, 0, 1, 1,
0.6971055, -0.3943488, 1.817944, 0, 0, 0, 1, 1,
0.7040481, 0.04872682, 2.943634, 0, 0, 0, 1, 1,
0.7065125, -2.071479, 4.162271, 0, 0, 0, 1, 1,
0.709953, -0.3582768, 1.838498, 1, 1, 1, 1, 1,
0.7120687, 2.339668, 0.3175173, 1, 1, 1, 1, 1,
0.7152691, 1.029355, 1.591794, 1, 1, 1, 1, 1,
0.7157465, -0.6533257, 2.569811, 1, 1, 1, 1, 1,
0.7161362, -0.09172253, 1.600888, 1, 1, 1, 1, 1,
0.7164745, 0.02989275, -0.1281638, 1, 1, 1, 1, 1,
0.7208688, 0.1644903, 1.415692, 1, 1, 1, 1, 1,
0.7266599, 1.45096, 0.8163841, 1, 1, 1, 1, 1,
0.7289751, -0.4174494, 1.660208, 1, 1, 1, 1, 1,
0.7362618, 0.7546363, -0.8097436, 1, 1, 1, 1, 1,
0.7447535, -0.4797042, 3.04427, 1, 1, 1, 1, 1,
0.7465751, 0.1049784, 2.36114, 1, 1, 1, 1, 1,
0.7497672, 0.6265628, -0.7301265, 1, 1, 1, 1, 1,
0.7565925, 1.661777, 1.886474, 1, 1, 1, 1, 1,
0.7567534, -0.8142043, 4.545005, 1, 1, 1, 1, 1,
0.7581591, 0.143506, 0.5479994, 0, 0, 1, 1, 1,
0.7588586, 0.7324982, 0.2700272, 1, 0, 0, 1, 1,
0.7695711, 1.26312, 0.9991996, 1, 0, 0, 1, 1,
0.7777522, -0.8164234, 1.52654, 1, 0, 0, 1, 1,
0.7791543, -0.2702369, 1.197883, 1, 0, 0, 1, 1,
0.7851722, 0.4033852, 0.524001, 1, 0, 0, 1, 1,
0.7873769, -0.01402004, 2.168231, 0, 0, 0, 1, 1,
0.7914398, 1.168556, 2.060748, 0, 0, 0, 1, 1,
0.7941202, 1.330738, 0.3755721, 0, 0, 0, 1, 1,
0.799816, 0.01586239, 1.711613, 0, 0, 0, 1, 1,
0.8018932, 0.2224203, 0.1441218, 0, 0, 0, 1, 1,
0.8027841, -1.572347, 3.816226, 0, 0, 0, 1, 1,
0.8032122, -0.1387055, 2.672043, 0, 0, 0, 1, 1,
0.8058496, 0.738102, 1.36465, 1, 1, 1, 1, 1,
0.8079218, -1.037534, 2.677162, 1, 1, 1, 1, 1,
0.8095794, 0.1287295, 0.8444827, 1, 1, 1, 1, 1,
0.8134369, -0.9059741, 2.86026, 1, 1, 1, 1, 1,
0.8138762, -0.4955455, 1.92611, 1, 1, 1, 1, 1,
0.8242892, -0.2750501, 1.766977, 1, 1, 1, 1, 1,
0.8256593, -0.3531501, 1.720232, 1, 1, 1, 1, 1,
0.8260622, -0.8146051, 1.461416, 1, 1, 1, 1, 1,
0.8264657, -2.426061, 3.149027, 1, 1, 1, 1, 1,
0.8310425, -1.46355, 1.100102, 1, 1, 1, 1, 1,
0.8316553, -0.6721737, 1.937058, 1, 1, 1, 1, 1,
0.8340503, -0.3080703, 1.473264, 1, 1, 1, 1, 1,
0.8396121, 0.4795111, 1.196952, 1, 1, 1, 1, 1,
0.8447248, -0.631228, 2.243433, 1, 1, 1, 1, 1,
0.8506386, -1.827805, 1.792262, 1, 1, 1, 1, 1,
0.8528184, 0.06102927, 1.712368, 0, 0, 1, 1, 1,
0.854438, 0.8568367, -0.0375644, 1, 0, 0, 1, 1,
0.8554744, -0.5060036, 3.14591, 1, 0, 0, 1, 1,
0.856753, 0.3832732, 1.774883, 1, 0, 0, 1, 1,
0.8590396, -0.4890226, 1.451729, 1, 0, 0, 1, 1,
0.8650351, -0.293586, 1.374259, 1, 0, 0, 1, 1,
0.8660915, 1.888046, 0.495764, 0, 0, 0, 1, 1,
0.8664864, 1.472218, 1.270621, 0, 0, 0, 1, 1,
0.8682083, 1.455101, 0.3953404, 0, 0, 0, 1, 1,
0.8763272, 2.718608, -0.5869021, 0, 0, 0, 1, 1,
0.880627, 0.5253856, 1.155363, 0, 0, 0, 1, 1,
0.8813203, -0.167522, 1.375746, 0, 0, 0, 1, 1,
0.8835365, -0.1195445, 3.047549, 0, 0, 0, 1, 1,
0.8910578, -0.5851464, 1.59873, 1, 1, 1, 1, 1,
0.8978997, 0.8217362, 0.009153968, 1, 1, 1, 1, 1,
0.9060457, -0.7964563, 2.202147, 1, 1, 1, 1, 1,
0.9093967, 0.5277586, 1.853996, 1, 1, 1, 1, 1,
0.9105523, -0.9363192, 3.477973, 1, 1, 1, 1, 1,
0.9123732, -0.6389999, 1.933475, 1, 1, 1, 1, 1,
0.9145133, -0.2978288, 1.50537, 1, 1, 1, 1, 1,
0.9166152, -0.846764, 3.278203, 1, 1, 1, 1, 1,
0.9196947, 0.5527718, 0.2321379, 1, 1, 1, 1, 1,
0.9240041, 0.6226615, 4.191003, 1, 1, 1, 1, 1,
0.9361612, -0.03936255, 3.608615, 1, 1, 1, 1, 1,
0.9385551, 0.6972159, 0.1721677, 1, 1, 1, 1, 1,
0.9557725, 0.4850356, 1.636786, 1, 1, 1, 1, 1,
0.963923, -0.8059131, 3.142719, 1, 1, 1, 1, 1,
0.9652268, -1.090064, 3.335675, 1, 1, 1, 1, 1,
0.9665546, 1.801091, -0.436426, 0, 0, 1, 1, 1,
0.9699973, -1.040768, 1.696092, 1, 0, 0, 1, 1,
0.9790297, -0.2331328, 0.6357701, 1, 0, 0, 1, 1,
0.9791756, 0.6795265, 0.6477755, 1, 0, 0, 1, 1,
0.9829645, 0.1686921, 0.4227962, 1, 0, 0, 1, 1,
0.9885471, -1.183582, 1.635467, 1, 0, 0, 1, 1,
0.9892374, 0.1241138, 1.733408, 0, 0, 0, 1, 1,
1.009944, -0.0618494, 0.8844148, 0, 0, 0, 1, 1,
1.017142, -0.2549726, 2.42268, 0, 0, 0, 1, 1,
1.035449, 0.5927452, 0.8284218, 0, 0, 0, 1, 1,
1.042452, -1.969807, 2.770828, 0, 0, 0, 1, 1,
1.042564, 0.5320142, 1.258227, 0, 0, 0, 1, 1,
1.053376, -1.507578, 2.83101, 0, 0, 0, 1, 1,
1.054143, -0.3709081, 0.7244857, 1, 1, 1, 1, 1,
1.063238, 0.6843253, 0.5871598, 1, 1, 1, 1, 1,
1.064624, -1.059028, 1.351767, 1, 1, 1, 1, 1,
1.065357, -1.155803, 1.508309, 1, 1, 1, 1, 1,
1.077707, 0.4080543, 1.186175, 1, 1, 1, 1, 1,
1.07959, 0.3322974, 1.210212, 1, 1, 1, 1, 1,
1.11453, -0.4284493, 3.165353, 1, 1, 1, 1, 1,
1.117423, -0.2425324, 1.234198, 1, 1, 1, 1, 1,
1.11874, 0.6537054, -0.1013837, 1, 1, 1, 1, 1,
1.128056, -0.3846934, 1.617257, 1, 1, 1, 1, 1,
1.133943, 0.9163498, -0.7781272, 1, 1, 1, 1, 1,
1.135426, 1.378022, -0.2487818, 1, 1, 1, 1, 1,
1.138445, 0.3956635, 1.657965, 1, 1, 1, 1, 1,
1.142263, -0.1938088, 2.207441, 1, 1, 1, 1, 1,
1.142494, -0.2468473, 1.255591, 1, 1, 1, 1, 1,
1.15093, 0.4021569, 0.8936537, 0, 0, 1, 1, 1,
1.151872, 0.7272693, 0.3165168, 1, 0, 0, 1, 1,
1.157334, -0.06335455, 1.45551, 1, 0, 0, 1, 1,
1.164075, 1.340407, 2.70802, 1, 0, 0, 1, 1,
1.168069, 0.6107365, 0.5846443, 1, 0, 0, 1, 1,
1.178151, -0.6747167, 0.5820169, 1, 0, 0, 1, 1,
1.179468, 0.09182148, 0.1816082, 0, 0, 0, 1, 1,
1.193878, 0.3151897, 2.12974, 0, 0, 0, 1, 1,
1.196262, 1.160166, 1.326752, 0, 0, 0, 1, 1,
1.198607, 1.534858, 0.4608494, 0, 0, 0, 1, 1,
1.202898, -0.172154, 1.244215, 0, 0, 0, 1, 1,
1.218486, 0.8594381, 0.2266333, 0, 0, 0, 1, 1,
1.222638, 0.185122, 0.9799224, 0, 0, 0, 1, 1,
1.229952, -0.3776974, 1.215806, 1, 1, 1, 1, 1,
1.236997, 1.502366, -0.2828737, 1, 1, 1, 1, 1,
1.24426, -0.004105934, 1.151429, 1, 1, 1, 1, 1,
1.254602, -2.396621, 3.372448, 1, 1, 1, 1, 1,
1.256748, -1.353496, 4.26747, 1, 1, 1, 1, 1,
1.259873, 0.9180295, 1.554717, 1, 1, 1, 1, 1,
1.262435, -0.273294, 1.604093, 1, 1, 1, 1, 1,
1.266837, 1.712897, 1.090885, 1, 1, 1, 1, 1,
1.269176, -1.123118, 1.524205, 1, 1, 1, 1, 1,
1.272289, -0.234632, 2.092039, 1, 1, 1, 1, 1,
1.284815, -0.8315741, 2.581094, 1, 1, 1, 1, 1,
1.286002, -0.6908399, 0.8459756, 1, 1, 1, 1, 1,
1.290947, 0.9637284, 3.244945, 1, 1, 1, 1, 1,
1.292687, -0.4062107, 2.463309, 1, 1, 1, 1, 1,
1.301252, -0.727046, 1.166638, 1, 1, 1, 1, 1,
1.310552, 0.6996857, 1.7998, 0, 0, 1, 1, 1,
1.313234, 0.02201863, 1.69828, 1, 0, 0, 1, 1,
1.314736, 1.659652, 0.1027434, 1, 0, 0, 1, 1,
1.328207, 1.454603, 0.8537226, 1, 0, 0, 1, 1,
1.328941, -0.1021188, 0.7798181, 1, 0, 0, 1, 1,
1.333564, -1.120009, 0.4321778, 1, 0, 0, 1, 1,
1.334009, 1.743106, -0.08405195, 0, 0, 0, 1, 1,
1.336145, 0.07622085, 1.667918, 0, 0, 0, 1, 1,
1.34294, -1.383579, 0.4811381, 0, 0, 0, 1, 1,
1.351118, 1.53531, -0.7975175, 0, 0, 0, 1, 1,
1.353362, -0.741663, 1.933988, 0, 0, 0, 1, 1,
1.353722, 2.12095, -2.810059, 0, 0, 0, 1, 1,
1.356508, 0.1023989, 1.399101, 0, 0, 0, 1, 1,
1.357278, -0.2882757, 1.08638, 1, 1, 1, 1, 1,
1.362984, 0.03336621, 1.648649, 1, 1, 1, 1, 1,
1.382041, 0.7087446, 2.455024, 1, 1, 1, 1, 1,
1.385646, -1.06799, 1.231952, 1, 1, 1, 1, 1,
1.389442, 0.3539039, 2.384101, 1, 1, 1, 1, 1,
1.390739, 1.234176, -0.2362289, 1, 1, 1, 1, 1,
1.397673, -1.336389, 4.217025, 1, 1, 1, 1, 1,
1.401747, -0.1066851, 0.8003244, 1, 1, 1, 1, 1,
1.404583, 0.3108291, 0.6315627, 1, 1, 1, 1, 1,
1.409508, 0.4427006, 0.1067242, 1, 1, 1, 1, 1,
1.410817, -2.458364, 1.485242, 1, 1, 1, 1, 1,
1.43039, 0.2665037, 0.4570459, 1, 1, 1, 1, 1,
1.466988, 0.3845807, 0.1073327, 1, 1, 1, 1, 1,
1.482149, -0.564314, 2.078852, 1, 1, 1, 1, 1,
1.484134, 0.3695922, 1.271021, 1, 1, 1, 1, 1,
1.484954, -0.5057825, 1.743363, 0, 0, 1, 1, 1,
1.485557, 0.2479036, 0.555901, 1, 0, 0, 1, 1,
1.498781, -2.466319, 2.772588, 1, 0, 0, 1, 1,
1.500463, -0.370184, 1.454376, 1, 0, 0, 1, 1,
1.520266, 1.307735, 0.7447519, 1, 0, 0, 1, 1,
1.525965, 0.8333402, 0.6451632, 1, 0, 0, 1, 1,
1.553269, -1.373728, 2.309646, 0, 0, 0, 1, 1,
1.563538, 0.8892109, -0.01746442, 0, 0, 0, 1, 1,
1.56828, -0.9440735, 2.193159, 0, 0, 0, 1, 1,
1.581136, 0.1853321, 0.4733137, 0, 0, 0, 1, 1,
1.598988, -0.06923172, 0.9508733, 0, 0, 0, 1, 1,
1.602449, 0.3619011, 0.8311266, 0, 0, 0, 1, 1,
1.617412, -0.226669, 1.166198, 0, 0, 0, 1, 1,
1.637202, -0.7011181, 1.801776, 1, 1, 1, 1, 1,
1.638794, -0.3456695, 2.193271, 1, 1, 1, 1, 1,
1.657142, -0.7191271, 2.27098, 1, 1, 1, 1, 1,
1.665413, 1.595301, -0.6467872, 1, 1, 1, 1, 1,
1.672186, -1.087861, 1.149863, 1, 1, 1, 1, 1,
1.675514, -0.8646836, 2.821815, 1, 1, 1, 1, 1,
1.689689, -0.7255496, 3.230358, 1, 1, 1, 1, 1,
1.694892, -0.179575, 1.640855, 1, 1, 1, 1, 1,
1.694945, -1.007898, 1.325791, 1, 1, 1, 1, 1,
1.697944, 0.3761419, 2.340151, 1, 1, 1, 1, 1,
1.705326, 0.07810797, -0.9645904, 1, 1, 1, 1, 1,
1.710618, 0.5742338, 2.022674, 1, 1, 1, 1, 1,
1.711988, 0.0736336, -0.5623657, 1, 1, 1, 1, 1,
1.71224, 1.427335, 0.5232585, 1, 1, 1, 1, 1,
1.713282, 0.9328966, 0.7811984, 1, 1, 1, 1, 1,
1.718388, -0.4601085, 3.571927, 0, 0, 1, 1, 1,
1.720311, -1.462727, 3.495688, 1, 0, 0, 1, 1,
1.721949, 0.5231423, -0.1740475, 1, 0, 0, 1, 1,
1.726776, -1.282462, 1.737457, 1, 0, 0, 1, 1,
1.736238, -0.7651435, 0.5737697, 1, 0, 0, 1, 1,
1.76057, -0.2058527, 0.7475111, 1, 0, 0, 1, 1,
1.779798, -0.5689967, 3.848713, 0, 0, 0, 1, 1,
1.808726, -0.809801, 1.082539, 0, 0, 0, 1, 1,
1.809423, 1.373266, 0.546269, 0, 0, 0, 1, 1,
1.814863, -0.2576773, 1.430823, 0, 0, 0, 1, 1,
1.820688, 0.5000598, 0.3746693, 0, 0, 0, 1, 1,
1.822259, -0.3669356, 1.295685, 0, 0, 0, 1, 1,
1.856158, -0.1424309, 2.656626, 0, 0, 0, 1, 1,
1.858729, -0.6231896, 2.401717, 1, 1, 1, 1, 1,
1.861974, -0.05954996, 2.54475, 1, 1, 1, 1, 1,
1.880072, 1.186624, 1.712836, 1, 1, 1, 1, 1,
1.894805, 2.436695, 0.07236747, 1, 1, 1, 1, 1,
1.900285, 0.4112342, 2.69692, 1, 1, 1, 1, 1,
1.911019, 0.6169311, 1.363686, 1, 1, 1, 1, 1,
1.911846, -1.544221, 2.529704, 1, 1, 1, 1, 1,
1.927325, 0.4394346, 1.266742, 1, 1, 1, 1, 1,
1.954317, -0.6068607, 1.066689, 1, 1, 1, 1, 1,
1.969164, 0.08835682, 0.758835, 1, 1, 1, 1, 1,
1.99911, -0.4990326, 1.985749, 1, 1, 1, 1, 1,
2.011271, -0.9303968, 3.485595, 1, 1, 1, 1, 1,
2.014474, 0.1622704, -0.07782067, 1, 1, 1, 1, 1,
2.018438, 0.724583, 0.1460906, 1, 1, 1, 1, 1,
2.064407, -0.74349, 2.506973, 1, 1, 1, 1, 1,
2.067282, 0.08461676, 0.1188653, 0, 0, 1, 1, 1,
2.069167, -0.7133695, 0.4863994, 1, 0, 0, 1, 1,
2.069211, -2.198377, 0.3498729, 1, 0, 0, 1, 1,
2.080527, -1.783872, 0.9060764, 1, 0, 0, 1, 1,
2.17125, 0.09151785, 2.287924, 1, 0, 0, 1, 1,
2.193416, -1.594788, 2.342096, 1, 0, 0, 1, 1,
2.217913, 0.5289805, 1.483138, 0, 0, 0, 1, 1,
2.24219, -0.4203458, 2.817281, 0, 0, 0, 1, 1,
2.244529, -0.3346474, 1.014506, 0, 0, 0, 1, 1,
2.262985, -0.3889788, 1.666864, 0, 0, 0, 1, 1,
2.277593, 1.867173, 1.508909, 0, 0, 0, 1, 1,
2.401354, 0.2402627, 2.392702, 0, 0, 0, 1, 1,
2.479388, -2.188569, 3.491629, 0, 0, 0, 1, 1,
2.566417, -0.4828025, 1.126573, 1, 1, 1, 1, 1,
2.611683, 0.4890148, 1.719435, 1, 1, 1, 1, 1,
2.631152, -0.6128789, 1.18643, 1, 1, 1, 1, 1,
2.63193, -0.5812955, 2.972538, 1, 1, 1, 1, 1,
2.951359, 0.01128907, 1.69435, 1, 1, 1, 1, 1,
2.958873, 2.031322, 0.2866036, 1, 1, 1, 1, 1,
3.513879, 0.07095911, 1.827134, 1, 1, 1, 1, 1
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
var radius = 9.729762;
var distance = 34.17537;
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
mvMatrix.translate( -0.04083753, 0.1005749, -0.2423542 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.17537);
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
