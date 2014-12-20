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
-2.589821, 0.6307888, -1.15162, 1, 0, 0, 1,
-2.495488, -0.06815685, -3.151342, 1, 0.007843138, 0, 1,
-2.41071, -0.4066136, -4.11111, 1, 0.01176471, 0, 1,
-2.389764, 1.819635, -1.777437, 1, 0.01960784, 0, 1,
-2.383542, -0.6063537, -1.179895, 1, 0.02352941, 0, 1,
-2.354095, -0.4394659, -1.337039, 1, 0.03137255, 0, 1,
-2.318297, -0.9934991, -1.746197, 1, 0.03529412, 0, 1,
-2.305907, -0.1479815, -0.7557102, 1, 0.04313726, 0, 1,
-2.297826, -0.6830751, 0.3625951, 1, 0.04705882, 0, 1,
-2.255044, 2.370605, 0.3617508, 1, 0.05490196, 0, 1,
-2.227571, -1.167997, -1.192668, 1, 0.05882353, 0, 1,
-2.189965, -0.691682, -2.445504, 1, 0.06666667, 0, 1,
-2.120191, 0.612962, -0.8331149, 1, 0.07058824, 0, 1,
-2.101198, -0.4376992, -1.157207, 1, 0.07843138, 0, 1,
-2.093959, 0.2626418, -2.369786, 1, 0.08235294, 0, 1,
-2.084938, 0.6580413, -0.9882783, 1, 0.09019608, 0, 1,
-2.007548, 1.064971, -1.370117, 1, 0.09411765, 0, 1,
-1.97392, 0.6069028, 0.3107286, 1, 0.1019608, 0, 1,
-1.973845, -0.3059552, -4.031795, 1, 0.1098039, 0, 1,
-1.948677, 0.8565884, -0.4226161, 1, 0.1137255, 0, 1,
-1.943724, 0.8364501, -0.01034388, 1, 0.1215686, 0, 1,
-1.939147, -1.18594, -4.318488, 1, 0.1254902, 0, 1,
-1.929021, 0.7067881, -1.233897, 1, 0.1333333, 0, 1,
-1.927203, 1.505297, 0.3171968, 1, 0.1372549, 0, 1,
-1.910741, -1.449338, -3.43749, 1, 0.145098, 0, 1,
-1.895753, 1.13629, -2.007555, 1, 0.1490196, 0, 1,
-1.886801, -0.3226954, -1.559306, 1, 0.1568628, 0, 1,
-1.882438, -0.9531218, -2.065719, 1, 0.1607843, 0, 1,
-1.882328, 0.201277, 0.1100861, 1, 0.1686275, 0, 1,
-1.868389, -1.424063, -3.318027, 1, 0.172549, 0, 1,
-1.860408, 0.3442441, -1.782754, 1, 0.1803922, 0, 1,
-1.854278, 0.297976, -1.943014, 1, 0.1843137, 0, 1,
-1.854191, 0.028181, -2.463792, 1, 0.1921569, 0, 1,
-1.834773, -1.302644, -2.148102, 1, 0.1960784, 0, 1,
-1.832832, -0.4107973, -0.9582828, 1, 0.2039216, 0, 1,
-1.824062, -1.174103, -2.72986, 1, 0.2117647, 0, 1,
-1.812812, 2.109065, -1.671329, 1, 0.2156863, 0, 1,
-1.789657, -1.451186, -2.837804, 1, 0.2235294, 0, 1,
-1.75788, 0.007585193, -1.285223, 1, 0.227451, 0, 1,
-1.731558, 0.8688552, -1.452262, 1, 0.2352941, 0, 1,
-1.722415, -0.04596091, -1.303095, 1, 0.2392157, 0, 1,
-1.70167, -2.252322, -2.421438, 1, 0.2470588, 0, 1,
-1.697548, -1.126935, -3.51172, 1, 0.2509804, 0, 1,
-1.686492, 0.5068659, -2.200576, 1, 0.2588235, 0, 1,
-1.679902, 1.956476, 0.6807054, 1, 0.2627451, 0, 1,
-1.676503, 0.00863917, -1.343701, 1, 0.2705882, 0, 1,
-1.666224, 0.09418236, -0.8788567, 1, 0.2745098, 0, 1,
-1.661856, 1.199799, -0.1895117, 1, 0.282353, 0, 1,
-1.661099, 0.6421431, -3.309438, 1, 0.2862745, 0, 1,
-1.644647, 1.138559, 0.6598302, 1, 0.2941177, 0, 1,
-1.642981, 0.2934664, -1.786432, 1, 0.3019608, 0, 1,
-1.627265, 0.2938, -1.838174, 1, 0.3058824, 0, 1,
-1.622242, -0.4691642, -2.130223, 1, 0.3137255, 0, 1,
-1.621853, 0.171533, -1.706722, 1, 0.3176471, 0, 1,
-1.605239, 0.1997399, -0.08449497, 1, 0.3254902, 0, 1,
-1.594344, 0.4248884, -0.5454825, 1, 0.3294118, 0, 1,
-1.591097, -1.432965, -1.988227, 1, 0.3372549, 0, 1,
-1.584529, 1.704682, -1.959948, 1, 0.3411765, 0, 1,
-1.582618, 0.8175266, -0.6552652, 1, 0.3490196, 0, 1,
-1.570415, -1.521864, -1.74848, 1, 0.3529412, 0, 1,
-1.55109, 0.3306983, -1.590496, 1, 0.3607843, 0, 1,
-1.547744, 1.321168, 0.4882779, 1, 0.3647059, 0, 1,
-1.533698, -0.1328608, -4.034714, 1, 0.372549, 0, 1,
-1.532564, -0.4869764, -1.190147, 1, 0.3764706, 0, 1,
-1.532383, -0.6090917, -2.258949, 1, 0.3843137, 0, 1,
-1.526505, -2.269058, -1.597904, 1, 0.3882353, 0, 1,
-1.52572, 1.715776, -0.7867974, 1, 0.3960784, 0, 1,
-1.522062, 1.694283, -1.079162, 1, 0.4039216, 0, 1,
-1.515574, -1.407232, -1.290594, 1, 0.4078431, 0, 1,
-1.510316, 1.691887, 0.6929739, 1, 0.4156863, 0, 1,
-1.488307, 1.283817, 0.1544241, 1, 0.4196078, 0, 1,
-1.481573, 0.4607182, -1.596438, 1, 0.427451, 0, 1,
-1.472756, 1.243806, -1.643376, 1, 0.4313726, 0, 1,
-1.471931, -1.172663, -1.783749, 1, 0.4392157, 0, 1,
-1.434121, 0.04976057, -0.4974535, 1, 0.4431373, 0, 1,
-1.423394, -1.418145, -2.903285, 1, 0.4509804, 0, 1,
-1.422525, 0.1869705, -0.8075421, 1, 0.454902, 0, 1,
-1.418622, -0.007755805, 0.2420919, 1, 0.4627451, 0, 1,
-1.414716, -3.151128, -1.024097, 1, 0.4666667, 0, 1,
-1.414358, 1.770813, -2.850489, 1, 0.4745098, 0, 1,
-1.409712, 0.6653276, -0.3115271, 1, 0.4784314, 0, 1,
-1.400582, 0.5150005, -0.05547979, 1, 0.4862745, 0, 1,
-1.389433, -0.1411201, -0.9926233, 1, 0.4901961, 0, 1,
-1.375684, -0.773182, -0.8748025, 1, 0.4980392, 0, 1,
-1.373721, -0.635827, -1.723761, 1, 0.5058824, 0, 1,
-1.371902, 1.069668, -1.404073, 1, 0.509804, 0, 1,
-1.371564, 0.2104138, -2.24265, 1, 0.5176471, 0, 1,
-1.370459, 0.7032903, -1.634932, 1, 0.5215687, 0, 1,
-1.359995, -0.5949749, -1.674931, 1, 0.5294118, 0, 1,
-1.356993, -0.124121, -2.714674, 1, 0.5333334, 0, 1,
-1.351476, -0.0020394, -0.3583019, 1, 0.5411765, 0, 1,
-1.348868, -0.01462655, -2.177684, 1, 0.5450981, 0, 1,
-1.340568, 0.04277641, -1.755114, 1, 0.5529412, 0, 1,
-1.315547, -1.624698, -3.055282, 1, 0.5568628, 0, 1,
-1.315511, 0.4559876, -1.888372, 1, 0.5647059, 0, 1,
-1.308879, 0.2232743, -0.6445087, 1, 0.5686275, 0, 1,
-1.29406, -0.3665191, -2.93029, 1, 0.5764706, 0, 1,
-1.283795, -0.6146637, -1.600757, 1, 0.5803922, 0, 1,
-1.280217, 1.169298, -0.5416114, 1, 0.5882353, 0, 1,
-1.279235, 0.5326477, -0.8783322, 1, 0.5921569, 0, 1,
-1.278847, -0.7377613, -1.761216, 1, 0.6, 0, 1,
-1.271935, -0.4608419, -0.9226171, 1, 0.6078432, 0, 1,
-1.258505, -0.6212656, -3.138594, 1, 0.6117647, 0, 1,
-1.244995, 0.4441633, 0.544533, 1, 0.6196079, 0, 1,
-1.237807, 0.05599449, -1.260803, 1, 0.6235294, 0, 1,
-1.237421, -0.9712678, -2.20568, 1, 0.6313726, 0, 1,
-1.237002, 0.4803632, -2.087257, 1, 0.6352941, 0, 1,
-1.232866, 0.3304396, -1.485971, 1, 0.6431373, 0, 1,
-1.23209, -0.1681531, -1.386827, 1, 0.6470588, 0, 1,
-1.225291, 0.5104469, -0.6489639, 1, 0.654902, 0, 1,
-1.209066, 1.614465, 0.06558256, 1, 0.6588235, 0, 1,
-1.208388, -0.7021698, -2.457223, 1, 0.6666667, 0, 1,
-1.194549, 1.255367, -1.835989, 1, 0.6705883, 0, 1,
-1.190039, -0.6747498, -1.072771, 1, 0.6784314, 0, 1,
-1.187217, -0.3259152, -3.604331, 1, 0.682353, 0, 1,
-1.178061, -0.8090612, -2.483679, 1, 0.6901961, 0, 1,
-1.177925, -0.2599173, -3.066422, 1, 0.6941177, 0, 1,
-1.177161, 0.2009231, -0.936222, 1, 0.7019608, 0, 1,
-1.1709, -1.091903, -2.768391, 1, 0.7098039, 0, 1,
-1.169387, 0.9586011, -0.3312131, 1, 0.7137255, 0, 1,
-1.16932, -0.9972734, -3.828791, 1, 0.7215686, 0, 1,
-1.162176, 0.2539928, -1.09346, 1, 0.7254902, 0, 1,
-1.157818, -1.090529, -4.162781, 1, 0.7333333, 0, 1,
-1.157125, -0.6776252, -2.068914, 1, 0.7372549, 0, 1,
-1.15578, 2.495179, -0.2930845, 1, 0.7450981, 0, 1,
-1.153376, -1.143843, -3.045926, 1, 0.7490196, 0, 1,
-1.144873, 0.1581845, -1.289644, 1, 0.7568628, 0, 1,
-1.133165, 0.6007028, -1.896992, 1, 0.7607843, 0, 1,
-1.127166, -0.06956428, -2.528453, 1, 0.7686275, 0, 1,
-1.121418, 1.88298, -0.1746198, 1, 0.772549, 0, 1,
-1.120903, 2.010726, 0.7242702, 1, 0.7803922, 0, 1,
-1.115255, -0.9150222, -1.445123, 1, 0.7843137, 0, 1,
-1.11299, -0.3968987, -0.6272258, 1, 0.7921569, 0, 1,
-1.109374, -0.1899296, -2.811356, 1, 0.7960784, 0, 1,
-1.099324, -1.130438, -0.7481485, 1, 0.8039216, 0, 1,
-1.097638, 0.860437, -1.751871, 1, 0.8117647, 0, 1,
-1.097389, 0.0925682, -2.632704, 1, 0.8156863, 0, 1,
-1.094448, -0.5777822, -2.932907, 1, 0.8235294, 0, 1,
-1.077145, 0.5210451, -2.568335, 1, 0.827451, 0, 1,
-1.075325, 0.05052698, -1.992046, 1, 0.8352941, 0, 1,
-1.072706, 0.3393576, -0.7549848, 1, 0.8392157, 0, 1,
-1.072651, 0.009055727, -1.790288, 1, 0.8470588, 0, 1,
-1.068597, -0.711666, -0.5577188, 1, 0.8509804, 0, 1,
-1.044214, 1.197471, 0.8310795, 1, 0.8588235, 0, 1,
-1.042599, -0.08864634, -1.837208, 1, 0.8627451, 0, 1,
-1.04117, 0.627998, -1.030854, 1, 0.8705882, 0, 1,
-1.039648, 1.793678, -0.4715666, 1, 0.8745098, 0, 1,
-1.039522, -2.02716, -3.557976, 1, 0.8823529, 0, 1,
-1.029982, 0.3914174, -0.1401642, 1, 0.8862745, 0, 1,
-1.026011, -2.262345, -2.602101, 1, 0.8941177, 0, 1,
-1.024265, 0.4317735, -1.781329, 1, 0.8980392, 0, 1,
-1.022267, -1.258363, -1.095832, 1, 0.9058824, 0, 1,
-1.021774, 0.3063032, -0.7496306, 1, 0.9137255, 0, 1,
-1.018942, 0.3724145, -0.5436026, 1, 0.9176471, 0, 1,
-1.017219, -1.27046, -2.940579, 1, 0.9254902, 0, 1,
-1.014959, 1.255295, -0.5351672, 1, 0.9294118, 0, 1,
-1.010833, 0.8744904, -1.065481, 1, 0.9372549, 0, 1,
-1.008879, 0.27177, -0.9909517, 1, 0.9411765, 0, 1,
-1.00867, -0.4378934, -1.999764, 1, 0.9490196, 0, 1,
-1.000571, -1.315335, -2.645791, 1, 0.9529412, 0, 1,
-0.9986947, 0.1155536, -1.364239, 1, 0.9607843, 0, 1,
-0.9971389, 2.090752, -1.618282, 1, 0.9647059, 0, 1,
-0.9891696, -1.561143, -2.943382, 1, 0.972549, 0, 1,
-0.9852073, -2.107988, -1.952473, 1, 0.9764706, 0, 1,
-0.9829952, -2.043188, -1.866858, 1, 0.9843137, 0, 1,
-0.9813341, -0.5362292, -1.716303, 1, 0.9882353, 0, 1,
-0.9794713, 1.306966, -1.812879, 1, 0.9960784, 0, 1,
-0.9783177, -2.093636, -1.369099, 0.9960784, 1, 0, 1,
-0.9714183, 0.3795773, -1.321672, 0.9921569, 1, 0, 1,
-0.9675468, -0.2489424, -1.697755, 0.9843137, 1, 0, 1,
-0.9631499, -0.8343483, -2.972176, 0.9803922, 1, 0, 1,
-0.9599776, 1.110633, 0.6318444, 0.972549, 1, 0, 1,
-0.9558556, -0.8585023, -2.438767, 0.9686275, 1, 0, 1,
-0.9555426, -1.850208, -4.655698, 0.9607843, 1, 0, 1,
-0.9553155, 0.6637998, -0.8174923, 0.9568627, 1, 0, 1,
-0.9470398, 1.054326, -1.096179, 0.9490196, 1, 0, 1,
-0.9469029, -0.7551534, -2.239414, 0.945098, 1, 0, 1,
-0.946802, -1.702878, -0.9569773, 0.9372549, 1, 0, 1,
-0.9437978, -0.6724601, -0.9928686, 0.9333333, 1, 0, 1,
-0.9406326, 2.943227, -0.5735506, 0.9254902, 1, 0, 1,
-0.9336185, 0.2264368, -0.4563707, 0.9215686, 1, 0, 1,
-0.9321697, 3.823338, -0.4319047, 0.9137255, 1, 0, 1,
-0.9221839, 0.4060262, -0.1751846, 0.9098039, 1, 0, 1,
-0.9047807, 0.006234031, -2.437855, 0.9019608, 1, 0, 1,
-0.9044316, -0.8513021, -3.89204, 0.8941177, 1, 0, 1,
-0.8936145, 0.05575275, -1.426278, 0.8901961, 1, 0, 1,
-0.8935385, -1.926145, -4.513579, 0.8823529, 1, 0, 1,
-0.8869129, -1.243354, -1.990794, 0.8784314, 1, 0, 1,
-0.8819892, 1.014645, -0.4169722, 0.8705882, 1, 0, 1,
-0.8804981, 0.9163796, 0.1375459, 0.8666667, 1, 0, 1,
-0.8786036, -0.3064303, -3.059173, 0.8588235, 1, 0, 1,
-0.8743597, -0.1585438, -2.145896, 0.854902, 1, 0, 1,
-0.8664605, -0.3512381, -2.007954, 0.8470588, 1, 0, 1,
-0.8661946, -1.606927, -1.51311, 0.8431373, 1, 0, 1,
-0.8641677, 0.1329264, -2.300959, 0.8352941, 1, 0, 1,
-0.8616847, 1.532182, -1.416234, 0.8313726, 1, 0, 1,
-0.857321, 0.3602805, -2.402571, 0.8235294, 1, 0, 1,
-0.8539019, 0.5431179, -1.692582, 0.8196079, 1, 0, 1,
-0.8443027, -1.263494, -2.237527, 0.8117647, 1, 0, 1,
-0.8433346, -0.1149658, -3.656462, 0.8078431, 1, 0, 1,
-0.8422368, -0.5415993, -2.989546, 0.8, 1, 0, 1,
-0.8340411, 1.615077, -0.7627792, 0.7921569, 1, 0, 1,
-0.8315653, -0.1707508, -0.9568011, 0.7882353, 1, 0, 1,
-0.8276709, 0.1502694, -1.707239, 0.7803922, 1, 0, 1,
-0.8232993, -0.1702126, -0.5028667, 0.7764706, 1, 0, 1,
-0.8227707, -0.7085719, -2.875528, 0.7686275, 1, 0, 1,
-0.8216661, -0.599287, -0.8783168, 0.7647059, 1, 0, 1,
-0.8192689, -0.8374791, -3.27984, 0.7568628, 1, 0, 1,
-0.8104981, 0.5990646, 1.024228, 0.7529412, 1, 0, 1,
-0.8026056, 1.260643, 0.7484047, 0.7450981, 1, 0, 1,
-0.7935047, -1.924328, -2.719686, 0.7411765, 1, 0, 1,
-0.7864028, 0.001763358, -0.838924, 0.7333333, 1, 0, 1,
-0.7854849, -0.5788704, -1.721498, 0.7294118, 1, 0, 1,
-0.7847431, 2.424214, 0.3136858, 0.7215686, 1, 0, 1,
-0.7846819, 2.2265, -1.149312, 0.7176471, 1, 0, 1,
-0.7837247, 0.2371313, -1.324459, 0.7098039, 1, 0, 1,
-0.7828396, 0.3155744, -1.1999, 0.7058824, 1, 0, 1,
-0.7825388, 0.2485139, -1.444109, 0.6980392, 1, 0, 1,
-0.7742314, -1.492279, -3.366846, 0.6901961, 1, 0, 1,
-0.7726352, 0.4988879, -0.5829316, 0.6862745, 1, 0, 1,
-0.7722521, 0.2856731, -1.814996, 0.6784314, 1, 0, 1,
-0.769559, 0.8025478, -0.7361812, 0.6745098, 1, 0, 1,
-0.766498, 1.074517, -1.440666, 0.6666667, 1, 0, 1,
-0.7632484, -0.7187433, -2.400603, 0.6627451, 1, 0, 1,
-0.7588462, 0.180529, -2.468167, 0.654902, 1, 0, 1,
-0.7522336, 0.7268887, -1.413797, 0.6509804, 1, 0, 1,
-0.7507622, -1.199149, -3.62226, 0.6431373, 1, 0, 1,
-0.7501852, 1.144933, 0.5613328, 0.6392157, 1, 0, 1,
-0.7464424, -1.55233, -2.819788, 0.6313726, 1, 0, 1,
-0.7404355, 0.857655, 0.1137643, 0.627451, 1, 0, 1,
-0.7387959, -0.1169212, -1.75905, 0.6196079, 1, 0, 1,
-0.7377753, -0.4139557, -1.044286, 0.6156863, 1, 0, 1,
-0.7337211, -2.516227, -2.80195, 0.6078432, 1, 0, 1,
-0.7309173, 0.1773976, -0.6273341, 0.6039216, 1, 0, 1,
-0.7256054, 1.056012, -1.258243, 0.5960785, 1, 0, 1,
-0.7247335, -0.4887588, -3.587646, 0.5882353, 1, 0, 1,
-0.7245529, -0.6788257, -3.17049, 0.5843138, 1, 0, 1,
-0.7231693, 1.995325, -0.4981966, 0.5764706, 1, 0, 1,
-0.7230967, -0.4161703, -2.406263, 0.572549, 1, 0, 1,
-0.711958, -1.391552, -3.081863, 0.5647059, 1, 0, 1,
-0.7094778, -0.3724622, -1.559453, 0.5607843, 1, 0, 1,
-0.7038258, -2.382766, -3.895447, 0.5529412, 1, 0, 1,
-0.7035529, 0.5555153, -0.1348061, 0.5490196, 1, 0, 1,
-0.7022277, -0.450074, -1.155814, 0.5411765, 1, 0, 1,
-0.7018797, -0.9002029, -3.20436, 0.5372549, 1, 0, 1,
-0.7015743, 0.4631325, 0.8749484, 0.5294118, 1, 0, 1,
-0.6993089, 1.269863, -2.149223, 0.5254902, 1, 0, 1,
-0.6991408, -1.03083, -2.436319, 0.5176471, 1, 0, 1,
-0.6940681, 0.4057281, -0.3689027, 0.5137255, 1, 0, 1,
-0.6910337, 0.1593328, -2.174588, 0.5058824, 1, 0, 1,
-0.6908101, 0.9913728, 0.5577707, 0.5019608, 1, 0, 1,
-0.6875933, -0.7844972, -0.947023, 0.4941176, 1, 0, 1,
-0.6872161, 0.8782696, -1.875455, 0.4862745, 1, 0, 1,
-0.6867064, -0.8945156, -1.904084, 0.4823529, 1, 0, 1,
-0.680481, -0.2119041, -1.319723, 0.4745098, 1, 0, 1,
-0.6740038, -0.4693025, -1.402275, 0.4705882, 1, 0, 1,
-0.6736952, -1.245506, -2.621869, 0.4627451, 1, 0, 1,
-0.6677695, 0.5664247, -0.2712398, 0.4588235, 1, 0, 1,
-0.6638621, -1.740321, -1.785682, 0.4509804, 1, 0, 1,
-0.663635, -0.1579492, -2.27797, 0.4470588, 1, 0, 1,
-0.6632063, 0.5679186, 0.1803998, 0.4392157, 1, 0, 1,
-0.6547192, 0.4934129, 0.08840325, 0.4352941, 1, 0, 1,
-0.6543494, -0.1746912, -2.686719, 0.427451, 1, 0, 1,
-0.6529444, -1.887262, -2.472924, 0.4235294, 1, 0, 1,
-0.6415623, 1.109798, 1.633821, 0.4156863, 1, 0, 1,
-0.6405191, -0.3171186, -2.012009, 0.4117647, 1, 0, 1,
-0.6331488, -0.6564596, -3.078006, 0.4039216, 1, 0, 1,
-0.6304236, 0.1484717, -2.368417, 0.3960784, 1, 0, 1,
-0.6282336, 0.8150822, -0.9826413, 0.3921569, 1, 0, 1,
-0.6268146, 0.5902959, -0.4354234, 0.3843137, 1, 0, 1,
-0.6263925, -1.090459, -2.292336, 0.3803922, 1, 0, 1,
-0.625753, 0.5551456, -1.077191, 0.372549, 1, 0, 1,
-0.6256404, 0.4276175, -1.314927, 0.3686275, 1, 0, 1,
-0.6238708, 1.356973, -1.001187, 0.3607843, 1, 0, 1,
-0.6228483, 0.9953663, -0.7432603, 0.3568628, 1, 0, 1,
-0.6222414, -1.540849, -3.280236, 0.3490196, 1, 0, 1,
-0.6218024, -0.001457909, -1.96956, 0.345098, 1, 0, 1,
-0.6207775, -1.779538, -3.894696, 0.3372549, 1, 0, 1,
-0.6108458, 0.7244437, -2.714103, 0.3333333, 1, 0, 1,
-0.6100581, -0.6775072, -1.714915, 0.3254902, 1, 0, 1,
-0.6031811, 0.8086938, 0.8257099, 0.3215686, 1, 0, 1,
-0.5996161, -0.6992539, -3.742566, 0.3137255, 1, 0, 1,
-0.5984489, -1.137839, -3.493255, 0.3098039, 1, 0, 1,
-0.5941026, -0.1256213, -1.003449, 0.3019608, 1, 0, 1,
-0.5939695, 0.8837981, -0.1019171, 0.2941177, 1, 0, 1,
-0.5930371, -0.7628569, -3.752017, 0.2901961, 1, 0, 1,
-0.58825, 1.346464, -1.725481, 0.282353, 1, 0, 1,
-0.5872427, -1.640731, -1.19919, 0.2784314, 1, 0, 1,
-0.5859018, 0.7901744, -1.643022, 0.2705882, 1, 0, 1,
-0.5845546, 0.5563004, -0.5649441, 0.2666667, 1, 0, 1,
-0.5796031, 0.9542651, -0.2072656, 0.2588235, 1, 0, 1,
-0.5743233, 0.2548848, -1.501808, 0.254902, 1, 0, 1,
-0.5706266, 0.5443841, -0.3798376, 0.2470588, 1, 0, 1,
-0.5656558, -2.392928, -2.113653, 0.2431373, 1, 0, 1,
-0.5620824, 0.3837398, -0.6379761, 0.2352941, 1, 0, 1,
-0.559929, 2.952193, 0.4408596, 0.2313726, 1, 0, 1,
-0.5591931, -0.4617163, -1.856542, 0.2235294, 1, 0, 1,
-0.5578031, 0.08403309, -0.8750896, 0.2196078, 1, 0, 1,
-0.557287, -1.253731, -3.571871, 0.2117647, 1, 0, 1,
-0.5558131, -1.340269, -1.524485, 0.2078431, 1, 0, 1,
-0.5553316, 1.640983, 2.068748, 0.2, 1, 0, 1,
-0.551319, -0.3452815, -1.349262, 0.1921569, 1, 0, 1,
-0.5463263, 0.4590517, -0.9441113, 0.1882353, 1, 0, 1,
-0.5452783, 0.7381296, 0.5077841, 0.1803922, 1, 0, 1,
-0.5436217, -0.6191193, -1.04519, 0.1764706, 1, 0, 1,
-0.5387214, 1.406881, 0.4378861, 0.1686275, 1, 0, 1,
-0.5340886, -0.3081625, -2.389307, 0.1647059, 1, 0, 1,
-0.5319208, 0.1675696, -0.282934, 0.1568628, 1, 0, 1,
-0.5312772, 1.578761, -1.126184, 0.1529412, 1, 0, 1,
-0.5286157, 1.085408, -1.850754, 0.145098, 1, 0, 1,
-0.5277256, 0.2275588, -2.018658, 0.1411765, 1, 0, 1,
-0.5252453, 0.4437906, -2.054798, 0.1333333, 1, 0, 1,
-0.5244035, 0.2189174, -0.3476819, 0.1294118, 1, 0, 1,
-0.5242243, 1.153933, 0.3145507, 0.1215686, 1, 0, 1,
-0.5209371, -0.1040516, -1.822321, 0.1176471, 1, 0, 1,
-0.5198296, -0.1698025, -2.535374, 0.1098039, 1, 0, 1,
-0.5180009, 0.2429996, -2.163355, 0.1058824, 1, 0, 1,
-0.5152754, -0.0007253042, -2.822394, 0.09803922, 1, 0, 1,
-0.514624, 0.249396, -1.615716, 0.09019608, 1, 0, 1,
-0.5115851, 2.252937, -2.606964, 0.08627451, 1, 0, 1,
-0.5110376, 0.7583925, -2.187449, 0.07843138, 1, 0, 1,
-0.5109876, -0.3314684, -2.221585, 0.07450981, 1, 0, 1,
-0.5057385, -1.006977, -1.934885, 0.06666667, 1, 0, 1,
-0.5042498, 0.1279832, -2.439707, 0.0627451, 1, 0, 1,
-0.5041044, -0.1385882, -3.354167, 0.05490196, 1, 0, 1,
-0.5030898, -0.4951362, -2.936704, 0.05098039, 1, 0, 1,
-0.5016056, 0.3400895, -1.281978, 0.04313726, 1, 0, 1,
-0.49491, 0.2200848, -1.55838, 0.03921569, 1, 0, 1,
-0.4928253, 0.08841816, -0.04322876, 0.03137255, 1, 0, 1,
-0.4924265, -1.208912, -2.233379, 0.02745098, 1, 0, 1,
-0.4821067, 0.1011944, -1.588315, 0.01960784, 1, 0, 1,
-0.478215, -2.095537, -3.35064, 0.01568628, 1, 0, 1,
-0.4775994, 1.677229, -1.096449, 0.007843138, 1, 0, 1,
-0.4748107, 0.2102464, -2.219821, 0.003921569, 1, 0, 1,
-0.474089, -0.01739807, -1.236008, 0, 1, 0.003921569, 1,
-0.4714499, 0.2811244, -1.417782, 0, 1, 0.01176471, 1,
-0.4664458, 0.4455147, -2.336923, 0, 1, 0.01568628, 1,
-0.4659729, -1.633661, -2.203221, 0, 1, 0.02352941, 1,
-0.4636781, -0.3390052, -2.501279, 0, 1, 0.02745098, 1,
-0.4607077, 0.5132619, 1.181355, 0, 1, 0.03529412, 1,
-0.4592566, -0.7284438, -2.506653, 0, 1, 0.03921569, 1,
-0.458894, -0.5679223, -2.491234, 0, 1, 0.04705882, 1,
-0.4551803, 0.1420496, -1.639219, 0, 1, 0.05098039, 1,
-0.4542564, 1.756338, 0.5388454, 0, 1, 0.05882353, 1,
-0.4508967, -1.473554, -3.441252, 0, 1, 0.0627451, 1,
-0.4489307, 1.474121, -0.6074741, 0, 1, 0.07058824, 1,
-0.4457585, -1.07347, -2.085311, 0, 1, 0.07450981, 1,
-0.4432576, -0.6151644, -2.877255, 0, 1, 0.08235294, 1,
-0.4392464, -0.417366, -1.960657, 0, 1, 0.08627451, 1,
-0.4324456, -1.492915, -3.144251, 0, 1, 0.09411765, 1,
-0.4297757, 0.2820877, -1.915393, 0, 1, 0.1019608, 1,
-0.4292985, -0.5018831, -1.56912, 0, 1, 0.1058824, 1,
-0.4273548, 1.674222, 0.241659, 0, 1, 0.1137255, 1,
-0.4262283, -0.6190877, -2.353626, 0, 1, 0.1176471, 1,
-0.4206141, -1.030971, -3.291647, 0, 1, 0.1254902, 1,
-0.4173263, 0.1774319, -1.248763, 0, 1, 0.1294118, 1,
-0.4154151, 0.0327577, -1.370296, 0, 1, 0.1372549, 1,
-0.4142988, -1.173435, -2.269854, 0, 1, 0.1411765, 1,
-0.4112105, 0.6950818, 0.2556219, 0, 1, 0.1490196, 1,
-0.4076242, -1.861578, -1.926157, 0, 1, 0.1529412, 1,
-0.4058127, -0.6521052, -4.048368, 0, 1, 0.1607843, 1,
-0.3985529, 0.6820505, 0.5177845, 0, 1, 0.1647059, 1,
-0.3920378, 2.43988, -0.2660255, 0, 1, 0.172549, 1,
-0.3906003, 1.011875, -3.740312, 0, 1, 0.1764706, 1,
-0.3903594, 0.8410643, -0.7278295, 0, 1, 0.1843137, 1,
-0.3882159, 1.594858, 0.03361385, 0, 1, 0.1882353, 1,
-0.3880425, -0.3021133, -1.052318, 0, 1, 0.1960784, 1,
-0.3879457, 2.009316, 0.7989037, 0, 1, 0.2039216, 1,
-0.3858545, 0.2397885, -0.1933193, 0, 1, 0.2078431, 1,
-0.3854243, 0.2476216, -1.788269, 0, 1, 0.2156863, 1,
-0.3846494, 0.4223277, -2.192335, 0, 1, 0.2196078, 1,
-0.3812902, 0.6674463, 1.334407, 0, 1, 0.227451, 1,
-0.3809686, 0.7748444, -1.665373, 0, 1, 0.2313726, 1,
-0.3809233, -1.598473, -5.063659, 0, 1, 0.2392157, 1,
-0.3806498, 0.2705604, -1.436221, 0, 1, 0.2431373, 1,
-0.3721073, -1.250201, -4.390735, 0, 1, 0.2509804, 1,
-0.3699856, -0.3274218, -2.534135, 0, 1, 0.254902, 1,
-0.3687121, -0.9646035, -4.99053, 0, 1, 0.2627451, 1,
-0.3681191, 1.06135, 0.921038, 0, 1, 0.2666667, 1,
-0.3679404, 0.03129156, -2.151098, 0, 1, 0.2745098, 1,
-0.365299, -0.1718844, -2.353522, 0, 1, 0.2784314, 1,
-0.3650538, -0.3926139, -2.436784, 0, 1, 0.2862745, 1,
-0.3634868, -1.850635, -3.34468, 0, 1, 0.2901961, 1,
-0.3618702, 1.203169, 0.04498958, 0, 1, 0.2980392, 1,
-0.3616868, 1.716096, -2.830178, 0, 1, 0.3058824, 1,
-0.3602049, 1.00817, -1.602197, 0, 1, 0.3098039, 1,
-0.3590711, 1.485887, 0.2918605, 0, 1, 0.3176471, 1,
-0.3567154, 0.3505666, 1.346303, 0, 1, 0.3215686, 1,
-0.3553869, -0.4610842, -2.624169, 0, 1, 0.3294118, 1,
-0.3539133, -1.332645, -3.099104, 0, 1, 0.3333333, 1,
-0.3513802, -0.2478278, -1.396155, 0, 1, 0.3411765, 1,
-0.3495295, 0.1700107, -2.543071, 0, 1, 0.345098, 1,
-0.3393225, 0.5465065, -0.8059754, 0, 1, 0.3529412, 1,
-0.3382901, -1.413525, -2.053145, 0, 1, 0.3568628, 1,
-0.3378436, 0.5425772, -0.7367887, 0, 1, 0.3647059, 1,
-0.3358173, 0.7499661, -0.4627524, 0, 1, 0.3686275, 1,
-0.3336152, 0.3792946, -0.6786011, 0, 1, 0.3764706, 1,
-0.3334944, 1.141191, 0.1502427, 0, 1, 0.3803922, 1,
-0.3327832, 0.1267189, -1.831483, 0, 1, 0.3882353, 1,
-0.329377, 0.04872736, -2.53199, 0, 1, 0.3921569, 1,
-0.3285625, 0.09655997, -2.682999, 0, 1, 0.4, 1,
-0.3279121, -0.5209937, -2.205053, 0, 1, 0.4078431, 1,
-0.3250774, -0.8379799, -2.586604, 0, 1, 0.4117647, 1,
-0.3245791, 0.5273642, 0.3143145, 0, 1, 0.4196078, 1,
-0.3240421, 0.2510224, -0.155224, 0, 1, 0.4235294, 1,
-0.3146513, 0.4292602, -0.752657, 0, 1, 0.4313726, 1,
-0.3133058, -0.1113726, -1.114551, 0, 1, 0.4352941, 1,
-0.3065892, 0.4487796, -0.1756022, 0, 1, 0.4431373, 1,
-0.3022579, 0.2075083, -1.174201, 0, 1, 0.4470588, 1,
-0.2988498, -0.07732926, -0.6444725, 0, 1, 0.454902, 1,
-0.2977539, -0.8266886, -2.660201, 0, 1, 0.4588235, 1,
-0.2958994, -0.3323126, -2.516995, 0, 1, 0.4666667, 1,
-0.2932769, -0.3122611, -2.135859, 0, 1, 0.4705882, 1,
-0.2922157, -1.572728, -3.365904, 0, 1, 0.4784314, 1,
-0.2907578, 0.2015908, -1.207523, 0, 1, 0.4823529, 1,
-0.2879087, -0.7459231, -2.776308, 0, 1, 0.4901961, 1,
-0.2859143, -0.413997, -2.009165, 0, 1, 0.4941176, 1,
-0.2812505, -0.8440165, -3.286738, 0, 1, 0.5019608, 1,
-0.2794995, 0.4106068, -1.628499, 0, 1, 0.509804, 1,
-0.2766056, -0.1666218, -1.291472, 0, 1, 0.5137255, 1,
-0.2717289, 0.9076936, -0.08739758, 0, 1, 0.5215687, 1,
-0.2714249, 0.2962133, -2.561943, 0, 1, 0.5254902, 1,
-0.2630696, 0.4868024, 1.990858, 0, 1, 0.5333334, 1,
-0.2591877, -0.5408859, -3.550556, 0, 1, 0.5372549, 1,
-0.2528722, 0.5320495, 1.531566, 0, 1, 0.5450981, 1,
-0.2526146, -0.3628675, -3.48105, 0, 1, 0.5490196, 1,
-0.2514272, 0.001779473, -1.993104, 0, 1, 0.5568628, 1,
-0.2445132, 1.814762, -0.1926751, 0, 1, 0.5607843, 1,
-0.244478, 0.644076, -0.5593921, 0, 1, 0.5686275, 1,
-0.2427439, -1.132339, -2.416149, 0, 1, 0.572549, 1,
-0.2394487, -0.5650172, -2.36567, 0, 1, 0.5803922, 1,
-0.2380531, -1.169299, -2.241721, 0, 1, 0.5843138, 1,
-0.2375236, 0.994412, -1.983252, 0, 1, 0.5921569, 1,
-0.235622, -0.7552115, -2.382607, 0, 1, 0.5960785, 1,
-0.2339117, -1.202853, -1.365354, 0, 1, 0.6039216, 1,
-0.2257551, 2.336274, -0.5677882, 0, 1, 0.6117647, 1,
-0.2204507, 1.236205, -1.530909, 0, 1, 0.6156863, 1,
-0.2178952, 0.0547116, 0.8117934, 0, 1, 0.6235294, 1,
-0.2138992, 0.7603304, -0.5735092, 0, 1, 0.627451, 1,
-0.211866, -0.2144417, -0.7855263, 0, 1, 0.6352941, 1,
-0.2118099, -0.7615798, -1.831339, 0, 1, 0.6392157, 1,
-0.2038058, 0.9639084, -1.267358, 0, 1, 0.6470588, 1,
-0.2027088, -0.5575398, -3.594225, 0, 1, 0.6509804, 1,
-0.1920688, -1.152005, -3.456529, 0, 1, 0.6588235, 1,
-0.1918069, 0.6440224, 0.6054212, 0, 1, 0.6627451, 1,
-0.1915336, -0.4226202, -2.756811, 0, 1, 0.6705883, 1,
-0.1872228, 0.08885854, -1.933936, 0, 1, 0.6745098, 1,
-0.1854549, -0.6440966, -2.529886, 0, 1, 0.682353, 1,
-0.1845908, -0.4006549, -1.841532, 0, 1, 0.6862745, 1,
-0.1841913, 0.4558603, -2.301245, 0, 1, 0.6941177, 1,
-0.1808657, 1.6402, 0.6921233, 0, 1, 0.7019608, 1,
-0.1808636, -0.9499578, -3.146541, 0, 1, 0.7058824, 1,
-0.1804515, 0.7715214, 0.1897828, 0, 1, 0.7137255, 1,
-0.1804281, -0.166473, -4.067621, 0, 1, 0.7176471, 1,
-0.1794929, -0.5466795, -0.9494919, 0, 1, 0.7254902, 1,
-0.175419, 1.61149, 0.9139971, 0, 1, 0.7294118, 1,
-0.1699095, -1.139769, -2.487867, 0, 1, 0.7372549, 1,
-0.1667545, 0.518464, 0.003782036, 0, 1, 0.7411765, 1,
-0.1599107, 0.8339286, -0.8304707, 0, 1, 0.7490196, 1,
-0.1541502, -1.357772, -2.256933, 0, 1, 0.7529412, 1,
-0.1540268, 0.414871, -0.9809157, 0, 1, 0.7607843, 1,
-0.1501828, -0.2288053, -2.134996, 0, 1, 0.7647059, 1,
-0.1496328, -1.79336, -3.191987, 0, 1, 0.772549, 1,
-0.1494458, -1.521938, -4.31821, 0, 1, 0.7764706, 1,
-0.1487242, -0.1155313, -2.864734, 0, 1, 0.7843137, 1,
-0.1467824, 1.85829, 0.01987348, 0, 1, 0.7882353, 1,
-0.1461558, -0.5520748, -1.508063, 0, 1, 0.7960784, 1,
-0.1393257, 1.258072, -0.3135254, 0, 1, 0.8039216, 1,
-0.1366772, -0.6088931, -2.03362, 0, 1, 0.8078431, 1,
-0.1360951, 2.501508, -1.346637, 0, 1, 0.8156863, 1,
-0.1359669, 0.682751, 0.6291423, 0, 1, 0.8196079, 1,
-0.1338476, 0.05976821, 1.003874, 0, 1, 0.827451, 1,
-0.131451, -0.05314054, -1.659325, 0, 1, 0.8313726, 1,
-0.1299282, -0.07609911, -0.8817477, 0, 1, 0.8392157, 1,
-0.1296939, -0.8724562, -4.030198, 0, 1, 0.8431373, 1,
-0.1292914, -0.1122381, -2.583501, 0, 1, 0.8509804, 1,
-0.1213505, -0.2939692, -2.967965, 0, 1, 0.854902, 1,
-0.1142884, -0.38658, -2.518814, 0, 1, 0.8627451, 1,
-0.1077585, 0.9631968, -0.4569253, 0, 1, 0.8666667, 1,
-0.1052492, -0.849173, -3.1777, 0, 1, 0.8745098, 1,
-0.100795, -1.534434, -2.882077, 0, 1, 0.8784314, 1,
-0.09700383, 0.2504947, 0.6755432, 0, 1, 0.8862745, 1,
-0.09286634, -0.7483549, -2.822274, 0, 1, 0.8901961, 1,
-0.09189057, 0.01992293, -1.347522, 0, 1, 0.8980392, 1,
-0.08665176, -0.9169098, -3.333722, 0, 1, 0.9058824, 1,
-0.08458764, 0.2779686, -0.1742406, 0, 1, 0.9098039, 1,
-0.08445361, 1.370385, -0.4857081, 0, 1, 0.9176471, 1,
-0.08229581, -0.04824606, -1.965855, 0, 1, 0.9215686, 1,
-0.08201527, 0.1770612, 1.288352, 0, 1, 0.9294118, 1,
-0.07610158, 0.5013124, 0.7101575, 0, 1, 0.9333333, 1,
-0.07474158, 1.233001, -0.03374592, 0, 1, 0.9411765, 1,
-0.07429616, 3.711483, 0.3092682, 0, 1, 0.945098, 1,
-0.07321789, -2.34155, -4.605785, 0, 1, 0.9529412, 1,
-0.07274389, 0.3304377, -0.9986976, 0, 1, 0.9568627, 1,
-0.07260669, -2.09501, -1.69596, 0, 1, 0.9647059, 1,
-0.06491061, 0.1530447, -0.1521764, 0, 1, 0.9686275, 1,
-0.06079625, 0.647422, 0.2222167, 0, 1, 0.9764706, 1,
-0.05488364, -0.2723995, -1.574726, 0, 1, 0.9803922, 1,
-0.05416863, 0.3501299, -1.059167, 0, 1, 0.9882353, 1,
-0.05292743, 0.7554737, -0.2402652, 0, 1, 0.9921569, 1,
-0.03977834, -0.1350606, -3.097395, 0, 1, 1, 1,
-0.03937241, 0.8996489, 1.308426, 0, 0.9921569, 1, 1,
-0.03801673, -0.3740532, -2.036643, 0, 0.9882353, 1, 1,
-0.03650139, -1.037281, -1.664408, 0, 0.9803922, 1, 1,
-0.03156616, -0.1794185, -2.566449, 0, 0.9764706, 1, 1,
-0.02836984, 1.050131, 0.4230115, 0, 0.9686275, 1, 1,
-0.02626976, 1.664516, 0.09242758, 0, 0.9647059, 1, 1,
-0.02526782, -0.4962578, -3.829128, 0, 0.9568627, 1, 1,
-0.02220213, 0.773156, -1.548717, 0, 0.9529412, 1, 1,
-0.02058939, 0.1249115, -0.4299132, 0, 0.945098, 1, 1,
-0.01658377, 0.7421439, 0.8203474, 0, 0.9411765, 1, 1,
-0.0152613, 0.686558, -1.30378, 0, 0.9333333, 1, 1,
-0.01510904, 1.191956, -0.03858225, 0, 0.9294118, 1, 1,
-0.01356672, -0.3777148, -3.038019, 0, 0.9215686, 1, 1,
-0.01033492, -0.446487, -4.539987, 0, 0.9176471, 1, 1,
-0.008847597, 1.757444, -0.1751311, 0, 0.9098039, 1, 1,
0.0005279432, 1.169596, -1.876221, 0, 0.9058824, 1, 1,
0.0009143079, 0.05329828, -0.4993831, 0, 0.8980392, 1, 1,
0.004100562, -0.6195757, 1.427761, 0, 0.8901961, 1, 1,
0.01054777, -0.6046953, 3.785465, 0, 0.8862745, 1, 1,
0.01166851, -0.4705919, 3.960548, 0, 0.8784314, 1, 1,
0.01577965, -0.1139477, 2.849721, 0, 0.8745098, 1, 1,
0.0189976, 0.2815819, 0.9698625, 0, 0.8666667, 1, 1,
0.02097519, -1.536501, 3.20641, 0, 0.8627451, 1, 1,
0.0215654, 0.08764819, 1.26732, 0, 0.854902, 1, 1,
0.02158147, 1.829002, -0.312342, 0, 0.8509804, 1, 1,
0.02514749, -1.494686, 1.347277, 0, 0.8431373, 1, 1,
0.02732801, 0.7091013, 0.1609063, 0, 0.8392157, 1, 1,
0.03502703, 1.633627, 1.186088, 0, 0.8313726, 1, 1,
0.03641121, 0.623535, 1.309538, 0, 0.827451, 1, 1,
0.04392038, 0.8549454, 0.4192987, 0, 0.8196079, 1, 1,
0.04493963, -0.3218791, 3.461994, 0, 0.8156863, 1, 1,
0.04622962, -1.067722, 4.78954, 0, 0.8078431, 1, 1,
0.04676666, 0.4148203, 0.541953, 0, 0.8039216, 1, 1,
0.05164272, 0.3491046, -0.2260407, 0, 0.7960784, 1, 1,
0.06068376, 0.3931009, 0.33572, 0, 0.7882353, 1, 1,
0.06665438, 0.714401, 0.1228689, 0, 0.7843137, 1, 1,
0.06699312, -0.7723312, 4.011613, 0, 0.7764706, 1, 1,
0.06979277, 0.2094703, 1.336968, 0, 0.772549, 1, 1,
0.07358255, 0.4823221, -0.07299275, 0, 0.7647059, 1, 1,
0.08001792, -1.443598, 3.717259, 0, 0.7607843, 1, 1,
0.08082152, -0.08066617, 2.315072, 0, 0.7529412, 1, 1,
0.08082862, 0.8570261, -0.03068922, 0, 0.7490196, 1, 1,
0.0825403, -1.890164, 2.365661, 0, 0.7411765, 1, 1,
0.0865753, -0.938125, 1.635616, 0, 0.7372549, 1, 1,
0.09537411, -0.7494159, 2.343345, 0, 0.7294118, 1, 1,
0.09618832, 0.07236401, 0.3973205, 0, 0.7254902, 1, 1,
0.09848067, -0.4130926, 3.61326, 0, 0.7176471, 1, 1,
0.0997189, -0.9337777, 2.412258, 0, 0.7137255, 1, 1,
0.1004616, -0.1430613, 2.758789, 0, 0.7058824, 1, 1,
0.1056219, 0.9027523, -0.1859768, 0, 0.6980392, 1, 1,
0.1080342, 0.6344653, -2.291436, 0, 0.6941177, 1, 1,
0.1091911, -0.1739209, 3.229794, 0, 0.6862745, 1, 1,
0.109295, 0.3258255, 1.974629, 0, 0.682353, 1, 1,
0.1106122, -0.3404135, 3.511053, 0, 0.6745098, 1, 1,
0.1190647, -1.840247, 2.322589, 0, 0.6705883, 1, 1,
0.123491, -0.9357879, 1.386445, 0, 0.6627451, 1, 1,
0.1292128, 0.1726074, 1.253307, 0, 0.6588235, 1, 1,
0.1320719, -1.68352, 2.034062, 0, 0.6509804, 1, 1,
0.1326798, -0.4504428, 2.082944, 0, 0.6470588, 1, 1,
0.133735, 0.1166774, 0.9812151, 0, 0.6392157, 1, 1,
0.133894, -0.3435677, 4.17591, 0, 0.6352941, 1, 1,
0.1353294, 0.3434439, 1.306921, 0, 0.627451, 1, 1,
0.1355169, 0.3957864, 0.6696581, 0, 0.6235294, 1, 1,
0.1376182, 0.9302661, 1.420413, 0, 0.6156863, 1, 1,
0.1427327, 0.1465246, 0.9535161, 0, 0.6117647, 1, 1,
0.1536712, 1.158065, 0.1825993, 0, 0.6039216, 1, 1,
0.1541733, 0.7387195, -2.57834, 0, 0.5960785, 1, 1,
0.1546578, 0.7009636, 1.140283, 0, 0.5921569, 1, 1,
0.1551823, 0.7309958, 0.8072398, 0, 0.5843138, 1, 1,
0.1575604, 0.4018372, -0.4067375, 0, 0.5803922, 1, 1,
0.1610711, 0.1979477, -0.2067595, 0, 0.572549, 1, 1,
0.1618252, 1.308895, -1.246763, 0, 0.5686275, 1, 1,
0.1630379, 0.08302335, 1.031182, 0, 0.5607843, 1, 1,
0.1671852, -0.3998916, 3.046437, 0, 0.5568628, 1, 1,
0.1689249, 0.9717652, 1.343213, 0, 0.5490196, 1, 1,
0.1704888, 0.399271, 0.5670123, 0, 0.5450981, 1, 1,
0.1713408, -0.8269548, 6.069489, 0, 0.5372549, 1, 1,
0.172132, -0.2747363, 2.417565, 0, 0.5333334, 1, 1,
0.1752712, -0.3562925, 3.49844, 0, 0.5254902, 1, 1,
0.1782972, -1.132862, 1.699448, 0, 0.5215687, 1, 1,
0.1844099, 0.009680187, 0.9354146, 0, 0.5137255, 1, 1,
0.1860721, 1.012485, 0.07386154, 0, 0.509804, 1, 1,
0.1935539, -1.890311, 2.138122, 0, 0.5019608, 1, 1,
0.1954906, -1.302168, 2.090526, 0, 0.4941176, 1, 1,
0.1973049, -1.005679, 3.241717, 0, 0.4901961, 1, 1,
0.2031375, -0.5673762, 1.915072, 0, 0.4823529, 1, 1,
0.2031928, -0.5630481, 2.345337, 0, 0.4784314, 1, 1,
0.2085438, 1.950401, 0.01294857, 0, 0.4705882, 1, 1,
0.2100694, 0.07336204, 3.230264, 0, 0.4666667, 1, 1,
0.210411, -0.5185654, 1.286235, 0, 0.4588235, 1, 1,
0.2124546, 0.825708, -0.7449709, 0, 0.454902, 1, 1,
0.2132318, 0.05445101, 2.146591, 0, 0.4470588, 1, 1,
0.2165835, 1.872892, -0.0183896, 0, 0.4431373, 1, 1,
0.2165965, -1.227176, 2.055449, 0, 0.4352941, 1, 1,
0.2169962, 0.7079751, 1.898143, 0, 0.4313726, 1, 1,
0.2187187, 0.4141609, -0.1903377, 0, 0.4235294, 1, 1,
0.2249162, 1.139799, 1.995106, 0, 0.4196078, 1, 1,
0.2267404, 0.1979119, 0.7613069, 0, 0.4117647, 1, 1,
0.2269594, 0.209197, 0.906632, 0, 0.4078431, 1, 1,
0.2314062, 0.6222851, -1.59809, 0, 0.4, 1, 1,
0.233037, -1.713021, 3.369881, 0, 0.3921569, 1, 1,
0.2452837, 0.3767753, 0.312825, 0, 0.3882353, 1, 1,
0.2454457, 0.4922188, 1.158203, 0, 0.3803922, 1, 1,
0.2530745, 0.3936653, 0.374819, 0, 0.3764706, 1, 1,
0.2534513, -0.6405565, 3.666551, 0, 0.3686275, 1, 1,
0.2577489, 0.5406452, 0.6027271, 0, 0.3647059, 1, 1,
0.2598859, 0.2926525, 0.7808334, 0, 0.3568628, 1, 1,
0.2622487, -1.927301, 2.601216, 0, 0.3529412, 1, 1,
0.2651375, -1.785052, 1.866441, 0, 0.345098, 1, 1,
0.266805, -0.3395278, 2.376674, 0, 0.3411765, 1, 1,
0.2684066, -0.9174244, 3.909211, 0, 0.3333333, 1, 1,
0.2761911, -0.004517999, 1.051265, 0, 0.3294118, 1, 1,
0.2792055, -1.003669, 2.334367, 0, 0.3215686, 1, 1,
0.2877522, 0.7303331, 1.081568, 0, 0.3176471, 1, 1,
0.2932059, 2.785813, -0.5804387, 0, 0.3098039, 1, 1,
0.2938004, 0.0002369641, -0.4293673, 0, 0.3058824, 1, 1,
0.2940959, -0.7397771, 2.907229, 0, 0.2980392, 1, 1,
0.2960754, -1.452649, 2.339911, 0, 0.2901961, 1, 1,
0.2961273, -1.534623, 3.278694, 0, 0.2862745, 1, 1,
0.3020546, 0.2450704, 1.611086, 0, 0.2784314, 1, 1,
0.3030424, -0.2920017, 3.621139, 0, 0.2745098, 1, 1,
0.3030482, -1.293596, 3.354736, 0, 0.2666667, 1, 1,
0.3035673, -1.506017, 4.018862, 0, 0.2627451, 1, 1,
0.3039899, 1.112612, 0.732768, 0, 0.254902, 1, 1,
0.3042052, -0.6882023, 2.50311, 0, 0.2509804, 1, 1,
0.3046505, -0.2059861, 0.9646337, 0, 0.2431373, 1, 1,
0.3048366, 2.520324, 0.1524218, 0, 0.2392157, 1, 1,
0.3067892, 1.719583, 0.4293587, 0, 0.2313726, 1, 1,
0.3098291, 0.389197, 1.258446, 0, 0.227451, 1, 1,
0.3150398, -0.213463, 1.672467, 0, 0.2196078, 1, 1,
0.3159935, 2.420804, 0.7189593, 0, 0.2156863, 1, 1,
0.3179245, -2.958301, 1.943841, 0, 0.2078431, 1, 1,
0.3216396, -0.3538247, 2.245072, 0, 0.2039216, 1, 1,
0.3285885, 0.2549613, 0.06052386, 0, 0.1960784, 1, 1,
0.3289053, -2.086416, 3.461776, 0, 0.1882353, 1, 1,
0.3298905, -0.5058679, 2.579187, 0, 0.1843137, 1, 1,
0.3311809, 2.259044, 2.076348, 0, 0.1764706, 1, 1,
0.3334584, -0.1287693, 1.242815, 0, 0.172549, 1, 1,
0.3337198, -0.2156507, 1.078366, 0, 0.1647059, 1, 1,
0.3383259, -1.104751, 2.818203, 0, 0.1607843, 1, 1,
0.3384912, 1.936745, -1.089902, 0, 0.1529412, 1, 1,
0.3402524, -0.5028889, 1.241283, 0, 0.1490196, 1, 1,
0.3434273, -1.276482, 3.316154, 0, 0.1411765, 1, 1,
0.3473272, -0.5311852, 1.781766, 0, 0.1372549, 1, 1,
0.3508785, 1.088804, 0.7579614, 0, 0.1294118, 1, 1,
0.3515736, 2.140328, 1.634291, 0, 0.1254902, 1, 1,
0.352114, -0.07629626, 0.3120442, 0, 0.1176471, 1, 1,
0.3546222, -0.01978782, 1.637619, 0, 0.1137255, 1, 1,
0.3592557, -1.072874, 2.72698, 0, 0.1058824, 1, 1,
0.3639064, 0.9638273, -0.7998947, 0, 0.09803922, 1, 1,
0.3639606, -0.403441, 5.131217, 0, 0.09411765, 1, 1,
0.3697617, -0.9359446, 1.890403, 0, 0.08627451, 1, 1,
0.3718408, -0.1231535, 0.2117084, 0, 0.08235294, 1, 1,
0.3739929, 0.170543, 0.8089968, 0, 0.07450981, 1, 1,
0.3791644, -1.208448, 2.970915, 0, 0.07058824, 1, 1,
0.3821767, 0.6202372, 1.253462, 0, 0.0627451, 1, 1,
0.3907526, 1.045186, 0.1578483, 0, 0.05882353, 1, 1,
0.3976187, 0.9519239, 1.428431, 0, 0.05098039, 1, 1,
0.3997928, 0.1981658, -0.2333564, 0, 0.04705882, 1, 1,
0.4045371, -1.04526, 3.281457, 0, 0.03921569, 1, 1,
0.4060937, -2.465003, 2.890526, 0, 0.03529412, 1, 1,
0.4064858, -0.2194139, 1.175471, 0, 0.02745098, 1, 1,
0.4077372, 1.148382, 0.2743969, 0, 0.02352941, 1, 1,
0.4124275, -1.183709, 2.272729, 0, 0.01568628, 1, 1,
0.4125307, -0.8676459, 0.3703463, 0, 0.01176471, 1, 1,
0.4137022, -0.5994424, 2.011617, 0, 0.003921569, 1, 1,
0.4157846, -0.9244887, 4.22581, 0.003921569, 0, 1, 1,
0.4183195, -1.022927, 2.665921, 0.007843138, 0, 1, 1,
0.4184038, 1.208175, 1.173195, 0.01568628, 0, 1, 1,
0.4218159, -0.768437, 1.219334, 0.01960784, 0, 1, 1,
0.4224896, 3.297739, 2.567345, 0.02745098, 0, 1, 1,
0.4311007, 0.3045891, 2.581532, 0.03137255, 0, 1, 1,
0.435688, -0.1861362, 0.8908981, 0.03921569, 0, 1, 1,
0.4362126, -0.4201899, 1.328304, 0.04313726, 0, 1, 1,
0.4465227, 0.1549695, 1.350941, 0.05098039, 0, 1, 1,
0.4473314, -1.11458, 2.259495, 0.05490196, 0, 1, 1,
0.4474506, 0.1513946, -0.7395626, 0.0627451, 0, 1, 1,
0.4475279, 0.183531, 2.439717, 0.06666667, 0, 1, 1,
0.4490109, -1.447174, 2.426744, 0.07450981, 0, 1, 1,
0.4510182, 0.1306527, 0.8288543, 0.07843138, 0, 1, 1,
0.4528024, 0.586294, 1.094778, 0.08627451, 0, 1, 1,
0.4534473, -0.4840091, 3.424754, 0.09019608, 0, 1, 1,
0.4538145, -1.716259, 4.340268, 0.09803922, 0, 1, 1,
0.4584481, 0.7144736, -0.05842343, 0.1058824, 0, 1, 1,
0.4591327, 0.4617065, -0.515994, 0.1098039, 0, 1, 1,
0.4591741, -0.4754003, 2.324401, 0.1176471, 0, 1, 1,
0.4600294, -1.55269, 2.347028, 0.1215686, 0, 1, 1,
0.4649619, -0.4749694, 1.081971, 0.1294118, 0, 1, 1,
0.4754758, -0.5428318, 2.540107, 0.1333333, 0, 1, 1,
0.475677, 1.493652, 0.4791492, 0.1411765, 0, 1, 1,
0.4767421, 1.018251, 1.266567, 0.145098, 0, 1, 1,
0.4777907, 0.4155977, 0.9506267, 0.1529412, 0, 1, 1,
0.4802585, 1.016457, 0.1514384, 0.1568628, 0, 1, 1,
0.4807853, 0.9263777, 1.027369, 0.1647059, 0, 1, 1,
0.4851965, 0.8629332, 0.495422, 0.1686275, 0, 1, 1,
0.4855219, 0.4416844, 0.595813, 0.1764706, 0, 1, 1,
0.4969583, 0.02016025, 0.293341, 0.1803922, 0, 1, 1,
0.4986083, -1.392986, 0.4899135, 0.1882353, 0, 1, 1,
0.5049151, 0.01881909, 1.579101, 0.1921569, 0, 1, 1,
0.5085033, 0.7403668, 0.5636483, 0.2, 0, 1, 1,
0.5101113, -0.03208156, 0.970983, 0.2078431, 0, 1, 1,
0.5120971, 1.592015, 0.4089135, 0.2117647, 0, 1, 1,
0.5126413, 0.1857012, 2.131486, 0.2196078, 0, 1, 1,
0.5193363, 0.03386369, 2.865077, 0.2235294, 0, 1, 1,
0.5202941, 1.165393, -0.488803, 0.2313726, 0, 1, 1,
0.5286124, -1.145641, 1.493719, 0.2352941, 0, 1, 1,
0.5354034, 1.061806, -0.4609158, 0.2431373, 0, 1, 1,
0.5359076, -0.209828, 2.645036, 0.2470588, 0, 1, 1,
0.5404533, -0.5757065, 2.357438, 0.254902, 0, 1, 1,
0.5413138, -0.5157757, 0.8423858, 0.2588235, 0, 1, 1,
0.542439, -0.3657486, 1.885118, 0.2666667, 0, 1, 1,
0.5431273, 0.178779, -0.4853195, 0.2705882, 0, 1, 1,
0.5456303, -0.01738453, 3.377387, 0.2784314, 0, 1, 1,
0.546246, -0.3137075, 3.203709, 0.282353, 0, 1, 1,
0.5463954, -1.06328, 4.525381, 0.2901961, 0, 1, 1,
0.5478536, -1.024133, 3.596589, 0.2941177, 0, 1, 1,
0.5516714, -1.180724, 2.784282, 0.3019608, 0, 1, 1,
0.5547328, -0.563458, 2.582388, 0.3098039, 0, 1, 1,
0.5553285, 0.3832289, 1.449073, 0.3137255, 0, 1, 1,
0.556082, -0.1874768, 2.738136, 0.3215686, 0, 1, 1,
0.5563791, 0.8015095, 0.5185792, 0.3254902, 0, 1, 1,
0.5597184, -0.9558163, 2.316965, 0.3333333, 0, 1, 1,
0.559823, -0.5405826, 2.812726, 0.3372549, 0, 1, 1,
0.560905, 0.3735387, 1.29498, 0.345098, 0, 1, 1,
0.5623422, -1.029793, 3.114677, 0.3490196, 0, 1, 1,
0.5670735, -0.1610251, 5.023461, 0.3568628, 0, 1, 1,
0.5692361, 0.2731508, 0.8180144, 0.3607843, 0, 1, 1,
0.5777677, -0.421669, 2.39956, 0.3686275, 0, 1, 1,
0.5798638, -0.06379747, 1.584046, 0.372549, 0, 1, 1,
0.5910766, -0.9452548, 2.302772, 0.3803922, 0, 1, 1,
0.5925116, 0.2472305, 0.3801191, 0.3843137, 0, 1, 1,
0.5949701, 0.1611819, 0.08978883, 0.3921569, 0, 1, 1,
0.6043022, 1.061896, -0.2051158, 0.3960784, 0, 1, 1,
0.6083476, -0.3730753, 3.179999, 0.4039216, 0, 1, 1,
0.609136, -0.3036176, 1.150478, 0.4117647, 0, 1, 1,
0.6093652, -0.9897917, 2.863623, 0.4156863, 0, 1, 1,
0.6146129, 0.6853002, 1.740534, 0.4235294, 0, 1, 1,
0.6152485, 0.6224455, -0.005231382, 0.427451, 0, 1, 1,
0.6168837, 1.392483, -0.3221031, 0.4352941, 0, 1, 1,
0.6171127, 0.8546962, -0.5965505, 0.4392157, 0, 1, 1,
0.6182643, -1.444059, 3.490519, 0.4470588, 0, 1, 1,
0.6202322, 0.08763318, 2.499871, 0.4509804, 0, 1, 1,
0.6212837, 1.464153, 0.7894368, 0.4588235, 0, 1, 1,
0.6244978, 0.7657476, 0.3984952, 0.4627451, 0, 1, 1,
0.6247494, 0.5973095, 1.774728, 0.4705882, 0, 1, 1,
0.6350746, -0.6201546, 3.161167, 0.4745098, 0, 1, 1,
0.637614, 0.2369809, 0.4689025, 0.4823529, 0, 1, 1,
0.6389696, -1.178948, 2.036516, 0.4862745, 0, 1, 1,
0.6391633, 2.158935, 0.1775242, 0.4941176, 0, 1, 1,
0.6467479, 0.1420723, 2.091928, 0.5019608, 0, 1, 1,
0.6508552, -1.297661, 2.033392, 0.5058824, 0, 1, 1,
0.652155, -0.1484978, 2.807207, 0.5137255, 0, 1, 1,
0.6527956, -0.9070567, 2.544923, 0.5176471, 0, 1, 1,
0.6555851, 0.298653, 1.429687, 0.5254902, 0, 1, 1,
0.656523, 2.052485, 1.524, 0.5294118, 0, 1, 1,
0.6616568, 0.5480723, 0.4293762, 0.5372549, 0, 1, 1,
0.6653022, 2.355047, 0.9504897, 0.5411765, 0, 1, 1,
0.6793147, -0.2907111, 0.2664234, 0.5490196, 0, 1, 1,
0.6819021, -1.274237, 3.706923, 0.5529412, 0, 1, 1,
0.6839002, -0.8174189, 3.226927, 0.5607843, 0, 1, 1,
0.6880119, 1.27672, -1.326669, 0.5647059, 0, 1, 1,
0.7000673, -1.849552, 1.47268, 0.572549, 0, 1, 1,
0.7037078, -0.9709332, 0.2779059, 0.5764706, 0, 1, 1,
0.7037151, -1.55318, 3.902723, 0.5843138, 0, 1, 1,
0.7057069, -1.943545, 2.571331, 0.5882353, 0, 1, 1,
0.7075682, 0.1613669, 0.655013, 0.5960785, 0, 1, 1,
0.707822, 0.8644568, 1.752718, 0.6039216, 0, 1, 1,
0.7089881, -1.142053, 3.051096, 0.6078432, 0, 1, 1,
0.7105746, -0.5711231, 1.951327, 0.6156863, 0, 1, 1,
0.7114609, -0.7956595, 2.443959, 0.6196079, 0, 1, 1,
0.713629, -0.6149527, 2.740658, 0.627451, 0, 1, 1,
0.7155215, -0.3198189, 1.875335, 0.6313726, 0, 1, 1,
0.7174441, -1.077799, 2.583627, 0.6392157, 0, 1, 1,
0.7190672, -0.7762697, 2.140472, 0.6431373, 0, 1, 1,
0.7204034, -1.56738, 2.389758, 0.6509804, 0, 1, 1,
0.7205909, -0.5506827, 1.766778, 0.654902, 0, 1, 1,
0.722108, 0.8085747, -0.06252955, 0.6627451, 0, 1, 1,
0.7230633, -0.5443353, 1.436549, 0.6666667, 0, 1, 1,
0.7255031, 0.9799112, 0.5447065, 0.6745098, 0, 1, 1,
0.7263165, -0.387163, 1.7801, 0.6784314, 0, 1, 1,
0.7280234, -1.02874, -0.1221108, 0.6862745, 0, 1, 1,
0.7340529, 0.03745664, 0.5018573, 0.6901961, 0, 1, 1,
0.7458111, 1.652066, 0.6190703, 0.6980392, 0, 1, 1,
0.7471339, 0.910524, 0.7712291, 0.7058824, 0, 1, 1,
0.7498294, 0.3876713, -0.2368261, 0.7098039, 0, 1, 1,
0.7513986, 1.941383, 0.699666, 0.7176471, 0, 1, 1,
0.7573265, -0.4102377, 1.105951, 0.7215686, 0, 1, 1,
0.7596707, -0.07756422, 1.546196, 0.7294118, 0, 1, 1,
0.7614714, -1.261269, 1.442463, 0.7333333, 0, 1, 1,
0.7621967, -0.8744994, 2.07527, 0.7411765, 0, 1, 1,
0.7630787, 0.9660058, 1.177537, 0.7450981, 0, 1, 1,
0.7639116, 1.070249, 0.8592756, 0.7529412, 0, 1, 1,
0.7653891, 1.17659, 0.6692749, 0.7568628, 0, 1, 1,
0.7779784, -0.3820867, 1.832981, 0.7647059, 0, 1, 1,
0.7812506, 0.4345328, 1.867349, 0.7686275, 0, 1, 1,
0.7852933, -1.283966, 3.381408, 0.7764706, 0, 1, 1,
0.7959391, 1.60265, -0.3427553, 0.7803922, 0, 1, 1,
0.806441, -0.9536308, 3.428318, 0.7882353, 0, 1, 1,
0.8107192, 0.8723928, 1.002454, 0.7921569, 0, 1, 1,
0.8175291, 0.9745621, 0.6921495, 0.8, 0, 1, 1,
0.8254117, 1.458831, -0.1272659, 0.8078431, 0, 1, 1,
0.8266497, -0.06292785, 0.9121812, 0.8117647, 0, 1, 1,
0.8292541, -0.9574983, 3.661663, 0.8196079, 0, 1, 1,
0.8293608, 0.3635678, 0.4850784, 0.8235294, 0, 1, 1,
0.8312632, -0.1031389, 1.23502, 0.8313726, 0, 1, 1,
0.8341363, 0.9026645, 1.702518, 0.8352941, 0, 1, 1,
0.8391829, 0.8400462, 1.824638, 0.8431373, 0, 1, 1,
0.8394669, 0.8825741, 0.1657159, 0.8470588, 0, 1, 1,
0.8437689, -0.3469908, 3.584486, 0.854902, 0, 1, 1,
0.84497, -0.03312359, 2.029021, 0.8588235, 0, 1, 1,
0.8496425, 1.759123, -1.18802, 0.8666667, 0, 1, 1,
0.853762, 0.5900014, 0.7712915, 0.8705882, 0, 1, 1,
0.8609945, 0.386658, -0.9007239, 0.8784314, 0, 1, 1,
0.8630153, -0.3593695, 2.864172, 0.8823529, 0, 1, 1,
0.8656858, -1.211921, 3.205345, 0.8901961, 0, 1, 1,
0.8686185, 0.2140847, 1.070721, 0.8941177, 0, 1, 1,
0.8722191, -0.5506667, 0.4995499, 0.9019608, 0, 1, 1,
0.8787249, -0.355397, 2.700017, 0.9098039, 0, 1, 1,
0.8830982, 0.5150154, -0.427425, 0.9137255, 0, 1, 1,
0.8884794, 0.2173913, -1.581665, 0.9215686, 0, 1, 1,
0.8885584, -0.7452019, 1.217131, 0.9254902, 0, 1, 1,
0.8930628, 2.352441, 0.962571, 0.9333333, 0, 1, 1,
0.8940722, 0.6420569, 2.471541, 0.9372549, 0, 1, 1,
0.9000072, -0.4616339, 2.019127, 0.945098, 0, 1, 1,
0.9002125, -0.3397313, 2.043181, 0.9490196, 0, 1, 1,
0.9121367, 0.05586298, 1.182194, 0.9568627, 0, 1, 1,
0.9134328, 0.7016246, 1.558147, 0.9607843, 0, 1, 1,
0.9143251, -0.69888, 1.24779, 0.9686275, 0, 1, 1,
0.9192043, -1.632111, 4.842428, 0.972549, 0, 1, 1,
0.9274836, -1.421421, 2.398207, 0.9803922, 0, 1, 1,
0.9351559, -0.2038984, 1.154091, 0.9843137, 0, 1, 1,
0.9355519, 0.7434003, 4.110523, 0.9921569, 0, 1, 1,
0.944916, -0.06898385, 1.250457, 0.9960784, 0, 1, 1,
0.9455752, 0.2786053, -0.09165272, 1, 0, 0.9960784, 1,
0.9611012, -0.2940897, 3.3584, 1, 0, 0.9882353, 1,
0.9636318, -0.09268268, 1.269551, 1, 0, 0.9843137, 1,
0.9676992, 1.493406, 0.7240944, 1, 0, 0.9764706, 1,
0.970575, -0.2720557, 2.567702, 1, 0, 0.972549, 1,
0.9713158, 0.2190054, -0.6811779, 1, 0, 0.9647059, 1,
0.9830941, 0.7563489, -0.04801963, 1, 0, 0.9607843, 1,
0.9888851, -0.7565922, 0.513714, 1, 0, 0.9529412, 1,
1.002893, -0.3415857, 2.578076, 1, 0, 0.9490196, 1,
1.00473, 0.4500157, -1.211382, 1, 0, 0.9411765, 1,
1.010347, 0.5230196, 3.16142, 1, 0, 0.9372549, 1,
1.015824, 0.333565, 2.739744, 1, 0, 0.9294118, 1,
1.017466, -0.3112055, 2.173824, 1, 0, 0.9254902, 1,
1.021652, 0.09448088, 3.574434, 1, 0, 0.9176471, 1,
1.02339, 0.4575544, 1.471351, 1, 0, 0.9137255, 1,
1.023714, 0.9129888, 1.8355, 1, 0, 0.9058824, 1,
1.028456, 1.036273, 1.242242, 1, 0, 0.9019608, 1,
1.028853, 1.227505, 2.540848, 1, 0, 0.8941177, 1,
1.038693, -0.4415622, 2.110137, 1, 0, 0.8862745, 1,
1.048229, 1.680819, 0.4649286, 1, 0, 0.8823529, 1,
1.055751, 1.085775, 0.327802, 1, 0, 0.8745098, 1,
1.063275, 0.03444644, 2.726581, 1, 0, 0.8705882, 1,
1.071486, 0.8408761, 2.582177, 1, 0, 0.8627451, 1,
1.071871, 0.1746851, 2.654571, 1, 0, 0.8588235, 1,
1.073656, -0.03759746, 2.251019, 1, 0, 0.8509804, 1,
1.07784, 1.18405, 1.708055, 1, 0, 0.8470588, 1,
1.080119, -1.564944, 4.140983, 1, 0, 0.8392157, 1,
1.083156, -1.237176, 2.623595, 1, 0, 0.8352941, 1,
1.08456, -1.054607, 2.452722, 1, 0, 0.827451, 1,
1.090152, -0.2160225, 1.660987, 1, 0, 0.8235294, 1,
1.091334, 1.662024, 1.397743, 1, 0, 0.8156863, 1,
1.092199, -0.9871922, 3.568727, 1, 0, 0.8117647, 1,
1.096306, 0.7758574, 1.491621, 1, 0, 0.8039216, 1,
1.099269, -0.6748453, 3.299535, 1, 0, 0.7960784, 1,
1.101695, -0.242845, 2.154397, 1, 0, 0.7921569, 1,
1.103933, -0.5483836, 2.342903, 1, 0, 0.7843137, 1,
1.111638, -0.3248323, 2.350286, 1, 0, 0.7803922, 1,
1.113274, -0.7161344, 2.156593, 1, 0, 0.772549, 1,
1.114745, 0.3035116, 0.116315, 1, 0, 0.7686275, 1,
1.115882, -0.4258912, 2.500393, 1, 0, 0.7607843, 1,
1.120484, 0.1341401, 3.735972, 1, 0, 0.7568628, 1,
1.131076, 1.502178, 2.668008, 1, 0, 0.7490196, 1,
1.131148, -0.5954649, 3.948361, 1, 0, 0.7450981, 1,
1.145246, -0.182369, 0.2354673, 1, 0, 0.7372549, 1,
1.145835, 0.7031862, 0.6724711, 1, 0, 0.7333333, 1,
1.16382, -0.09528378, 2.559072, 1, 0, 0.7254902, 1,
1.171142, -0.4734972, 2.415937, 1, 0, 0.7215686, 1,
1.177005, 0.4174811, -0.4605799, 1, 0, 0.7137255, 1,
1.177365, -0.3526197, 3.160129, 1, 0, 0.7098039, 1,
1.179936, 1.567844, 1.436439, 1, 0, 0.7019608, 1,
1.180345, -1.497288, 3.200132, 1, 0, 0.6941177, 1,
1.181137, -0.1590055, 1.24109, 1, 0, 0.6901961, 1,
1.184232, 0.7900058, 1.90045, 1, 0, 0.682353, 1,
1.196612, -1.349886, 3.634098, 1, 0, 0.6784314, 1,
1.204293, -1.141314, 2.371025, 1, 0, 0.6705883, 1,
1.204471, -2.679671, 2.449263, 1, 0, 0.6666667, 1,
1.210422, -0.654698, 2.471313, 1, 0, 0.6588235, 1,
1.216466, 2.018472, 1.712865, 1, 0, 0.654902, 1,
1.21986, -0.1410968, 1.244343, 1, 0, 0.6470588, 1,
1.223893, 1.171754, 0.3878417, 1, 0, 0.6431373, 1,
1.226931, 2.075522, 2.020119, 1, 0, 0.6352941, 1,
1.233383, 0.7312525, 1.806704, 1, 0, 0.6313726, 1,
1.235469, 0.2023287, 0.701588, 1, 0, 0.6235294, 1,
1.235495, 0.05281347, 2.423804, 1, 0, 0.6196079, 1,
1.262793, 2.675658, -0.8724936, 1, 0, 0.6117647, 1,
1.263305, 1.648751, -1.148092, 1, 0, 0.6078432, 1,
1.263438, 0.3424192, -0.521262, 1, 0, 0.6, 1,
1.275517, 0.7697557, 0.4073292, 1, 0, 0.5921569, 1,
1.283554, -0.09906639, 1.22252, 1, 0, 0.5882353, 1,
1.299918, 0.05691424, 1.963026, 1, 0, 0.5803922, 1,
1.301534, 1.00831, 0.6051101, 1, 0, 0.5764706, 1,
1.315455, -0.9968289, 2.090827, 1, 0, 0.5686275, 1,
1.332157, 1.814051, 0.8893377, 1, 0, 0.5647059, 1,
1.333012, -1.193172, 1.319413, 1, 0, 0.5568628, 1,
1.333732, -3.006546, 2.534677, 1, 0, 0.5529412, 1,
1.336779, -0.2044368, 2.328704, 1, 0, 0.5450981, 1,
1.341878, -1.691016, 3.040184, 1, 0, 0.5411765, 1,
1.349301, 2.025854, -0.961108, 1, 0, 0.5333334, 1,
1.362862, -0.9826702, 1.461377, 1, 0, 0.5294118, 1,
1.369177, -0.6085417, 3.73267, 1, 0, 0.5215687, 1,
1.371064, 0.5758774, 2.002624, 1, 0, 0.5176471, 1,
1.376808, -0.06805078, 2.062644, 1, 0, 0.509804, 1,
1.384092, 0.8209925, -2.358475, 1, 0, 0.5058824, 1,
1.389919, -0.6857364, 1.229876, 1, 0, 0.4980392, 1,
1.402638, 0.3354577, 1.70758, 1, 0, 0.4901961, 1,
1.405468, 1.930087, 0.9493779, 1, 0, 0.4862745, 1,
1.431795, 0.9389468, 2.217448, 1, 0, 0.4784314, 1,
1.433979, -0.217714, 1.297931, 1, 0, 0.4745098, 1,
1.434697, -0.1615663, 1.178627, 1, 0, 0.4666667, 1,
1.462296, 0.8318388, 2.806143, 1, 0, 0.4627451, 1,
1.466838, 2.364661, 1.393291, 1, 0, 0.454902, 1,
1.467002, -1.204337, 1.914412, 1, 0, 0.4509804, 1,
1.468077, 0.4042493, 2.771104, 1, 0, 0.4431373, 1,
1.473015, 2.085639, -0.2497104, 1, 0, 0.4392157, 1,
1.478642, 1.661023, 1.106997, 1, 0, 0.4313726, 1,
1.498386, 0.7041234, 1.838243, 1, 0, 0.427451, 1,
1.518892, 0.595495, 1.799993, 1, 0, 0.4196078, 1,
1.529835, 1.483508, 2.290592, 1, 0, 0.4156863, 1,
1.538164, 1.706688, 0.04404613, 1, 0, 0.4078431, 1,
1.539507, 0.9594305, 0.1723741, 1, 0, 0.4039216, 1,
1.547745, 0.5469913, 1.760455, 1, 0, 0.3960784, 1,
1.565099, 0.2684993, 2.388902, 1, 0, 0.3882353, 1,
1.565856, 1.187782, 1.836228, 1, 0, 0.3843137, 1,
1.571528, 2.122158, 0.5710105, 1, 0, 0.3764706, 1,
1.571801, 0.05981509, 0.08096096, 1, 0, 0.372549, 1,
1.582455, 1.842404, 0.5160719, 1, 0, 0.3647059, 1,
1.583659, -0.4674838, 1.828345, 1, 0, 0.3607843, 1,
1.60323, -0.5971603, 2.768623, 1, 0, 0.3529412, 1,
1.603634, 0.2505237, 1.40313, 1, 0, 0.3490196, 1,
1.610333, -2.880348, 3.452413, 1, 0, 0.3411765, 1,
1.619014, 0.07078066, 0.5411617, 1, 0, 0.3372549, 1,
1.619192, -1.720694, 2.135782, 1, 0, 0.3294118, 1,
1.620494, -1.079825, 1.747071, 1, 0, 0.3254902, 1,
1.648321, 0.1317276, 1.742928, 1, 0, 0.3176471, 1,
1.671553, 1.339589, -0.2517622, 1, 0, 0.3137255, 1,
1.676651, -0.0578815, 3.103233, 1, 0, 0.3058824, 1,
1.680236, -0.7360412, 3.830767, 1, 0, 0.2980392, 1,
1.687552, -1.243144, 3.285608, 1, 0, 0.2941177, 1,
1.695008, 0.06398607, 2.147043, 1, 0, 0.2862745, 1,
1.695621, 0.2475101, 2.96858, 1, 0, 0.282353, 1,
1.714948, -1.654079, 0.8124396, 1, 0, 0.2745098, 1,
1.718326, 1.4321, 1.283558, 1, 0, 0.2705882, 1,
1.724726, 0.5377418, 1.898082, 1, 0, 0.2627451, 1,
1.746964, -0.1219291, 2.054024, 1, 0, 0.2588235, 1,
1.750945, -0.7107367, 3.230603, 1, 0, 0.2509804, 1,
1.755201, 1.427932, 2.176808, 1, 0, 0.2470588, 1,
1.764385, -0.6662076, 0.8697866, 1, 0, 0.2392157, 1,
1.779201, 0.2714285, 2.0125, 1, 0, 0.2352941, 1,
1.782285, -0.06267709, 2.181842, 1, 0, 0.227451, 1,
1.783996, 1.147196, -0.3680872, 1, 0, 0.2235294, 1,
1.793862, 0.3476976, 1.890493, 1, 0, 0.2156863, 1,
1.800403, 0.5481289, 2.240959, 1, 0, 0.2117647, 1,
1.811635, -0.01224845, 2.216448, 1, 0, 0.2039216, 1,
1.819198, 0.1611276, 3.214885, 1, 0, 0.1960784, 1,
1.83793, -0.2918814, 2.991183, 1, 0, 0.1921569, 1,
1.841394, -0.6866952, 2.656147, 1, 0, 0.1843137, 1,
1.851491, 1.106399, 1.002686, 1, 0, 0.1803922, 1,
1.853551, -0.05500359, 2.374226, 1, 0, 0.172549, 1,
1.863708, -0.1645605, 2.469373, 1, 0, 0.1686275, 1,
1.865358, -1.088806, 1.484151, 1, 0, 0.1607843, 1,
1.90125, -0.1454654, 1.613686, 1, 0, 0.1568628, 1,
1.916457, 0.3434503, 3.832399, 1, 0, 0.1490196, 1,
1.92754, -0.09213444, 2.965667, 1, 0, 0.145098, 1,
1.938957, -1.294854, 2.269873, 1, 0, 0.1372549, 1,
1.941507, -1.586492, 2.322074, 1, 0, 0.1333333, 1,
1.997206, 1.167537, 1.305693, 1, 0, 0.1254902, 1,
2.041054, 0.02394342, 0.8803889, 1, 0, 0.1215686, 1,
2.05304, 1.777967, 2.75456, 1, 0, 0.1137255, 1,
2.056558, 0.3551568, 1.081204, 1, 0, 0.1098039, 1,
2.092726, -0.6343256, 2.546895, 1, 0, 0.1019608, 1,
2.113734, -1.15681, 2.80793, 1, 0, 0.09411765, 1,
2.124324, 2.264282, 0.3899657, 1, 0, 0.09019608, 1,
2.144557, 0.4505827, 0.2882546, 1, 0, 0.08235294, 1,
2.17643, -2.527719, 3.013741, 1, 0, 0.07843138, 1,
2.22938, 0.9574007, 2.560324, 1, 0, 0.07058824, 1,
2.230276, 0.6879359, 1.093705, 1, 0, 0.06666667, 1,
2.29144, -0.6504288, 1.19051, 1, 0, 0.05882353, 1,
2.301697, -1.336126, 2.898428, 1, 0, 0.05490196, 1,
2.319331, -0.0865023, 1.277426, 1, 0, 0.04705882, 1,
2.324504, -0.5206177, 3.73311, 1, 0, 0.04313726, 1,
2.4222, 1.588934, -0.09220883, 1, 0, 0.03529412, 1,
2.434399, 1.176733, 1.086192, 1, 0, 0.03137255, 1,
2.558062, 0.6420743, 0.02316308, 1, 0, 0.02352941, 1,
2.804063, -0.2597403, 0.5969595, 1, 0, 0.01960784, 1,
2.838291, -0.1392359, 1.608615, 1, 0, 0.01176471, 1,
3.862216, 1.010553, 2.174727, 1, 0, 0.007843138, 1
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
0.6361974, -4.3333, -6.950727, 0, -0.5, 0.5, 0.5,
0.6361974, -4.3333, -6.950727, 1, -0.5, 0.5, 0.5,
0.6361974, -4.3333, -6.950727, 1, 1.5, 0.5, 0.5,
0.6361974, -4.3333, -6.950727, 0, 1.5, 0.5, 0.5
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
-3.683441, 0.3361051, -6.950727, 0, -0.5, 0.5, 0.5,
-3.683441, 0.3361051, -6.950727, 1, -0.5, 0.5, 0.5,
-3.683441, 0.3361051, -6.950727, 1, 1.5, 0.5, 0.5,
-3.683441, 0.3361051, -6.950727, 0, 1.5, 0.5, 0.5
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
-3.683441, -4.3333, 0.5029151, 0, -0.5, 0.5, 0.5,
-3.683441, -4.3333, 0.5029151, 1, -0.5, 0.5, 0.5,
-3.683441, -4.3333, 0.5029151, 1, 1.5, 0.5, 0.5,
-3.683441, -4.3333, 0.5029151, 0, 1.5, 0.5, 0.5
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
-2, -3.255745, -5.230656,
3, -3.255745, -5.230656,
-2, -3.255745, -5.230656,
-2, -3.435338, -5.517334,
-1, -3.255745, -5.230656,
-1, -3.435338, -5.517334,
0, -3.255745, -5.230656,
0, -3.435338, -5.517334,
1, -3.255745, -5.230656,
1, -3.435338, -5.517334,
2, -3.255745, -5.230656,
2, -3.435338, -5.517334,
3, -3.255745, -5.230656,
3, -3.435338, -5.517334
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
-2, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
-2, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
-2, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
-2, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5,
-1, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
-1, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
-1, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
-1, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5,
0, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
0, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
0, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
0, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5,
1, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
1, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
1, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
1, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5,
2, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
2, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
2, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
2, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5,
3, -3.794523, -6.090692, 0, -0.5, 0.5, 0.5,
3, -3.794523, -6.090692, 1, -0.5, 0.5, 0.5,
3, -3.794523, -6.090692, 1, 1.5, 0.5, 0.5,
3, -3.794523, -6.090692, 0, 1.5, 0.5, 0.5
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
-2.686601, -3, -5.230656,
-2.686601, 3, -5.230656,
-2.686601, -3, -5.230656,
-2.852741, -3, -5.517334,
-2.686601, -2, -5.230656,
-2.852741, -2, -5.517334,
-2.686601, -1, -5.230656,
-2.852741, -1, -5.517334,
-2.686601, 0, -5.230656,
-2.852741, 0, -5.517334,
-2.686601, 1, -5.230656,
-2.852741, 1, -5.517334,
-2.686601, 2, -5.230656,
-2.852741, 2, -5.517334,
-2.686601, 3, -5.230656,
-2.852741, 3, -5.517334
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
-3.185021, -3, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, -3, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, -3, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, -3, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, -2, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, -2, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, -2, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, -2, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, -1, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, -1, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, -1, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, -1, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, 0, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, 0, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, 0, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, 0, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, 1, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, 1, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, 1, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, 1, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, 2, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, 2, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, 2, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, 2, -6.090692, 0, 1.5, 0.5, 0.5,
-3.185021, 3, -6.090692, 0, -0.5, 0.5, 0.5,
-3.185021, 3, -6.090692, 1, -0.5, 0.5, 0.5,
-3.185021, 3, -6.090692, 1, 1.5, 0.5, 0.5,
-3.185021, 3, -6.090692, 0, 1.5, 0.5, 0.5
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
-2.686601, -3.255745, -4,
-2.686601, -3.255745, 6,
-2.686601, -3.255745, -4,
-2.852741, -3.435338, -4,
-2.686601, -3.255745, -2,
-2.852741, -3.435338, -2,
-2.686601, -3.255745, 0,
-2.852741, -3.435338, 0,
-2.686601, -3.255745, 2,
-2.852741, -3.435338, 2,
-2.686601, -3.255745, 4,
-2.852741, -3.435338, 4,
-2.686601, -3.255745, 6,
-2.852741, -3.435338, 6
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
-3.185021, -3.794523, -4, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, -4, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, -4, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, -4, 0, 1.5, 0.5, 0.5,
-3.185021, -3.794523, -2, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, -2, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, -2, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, -2, 0, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 0, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 0, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 0, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 0, 0, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 2, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 2, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 2, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 2, 0, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 4, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 4, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 4, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 4, 0, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 6, 0, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 6, 1, -0.5, 0.5, 0.5,
-3.185021, -3.794523, 6, 1, 1.5, 0.5, 0.5,
-3.185021, -3.794523, 6, 0, 1.5, 0.5, 0.5
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
-2.686601, -3.255745, -5.230656,
-2.686601, 3.927955, -5.230656,
-2.686601, -3.255745, 6.236486,
-2.686601, 3.927955, 6.236486,
-2.686601, -3.255745, -5.230656,
-2.686601, -3.255745, 6.236486,
-2.686601, 3.927955, -5.230656,
-2.686601, 3.927955, 6.236486,
-2.686601, -3.255745, -5.230656,
3.958996, -3.255745, -5.230656,
-2.686601, -3.255745, 6.236486,
3.958996, -3.255745, 6.236486,
-2.686601, 3.927955, -5.230656,
3.958996, 3.927955, -5.230656,
-2.686601, 3.927955, 6.236486,
3.958996, 3.927955, 6.236486,
3.958996, -3.255745, -5.230656,
3.958996, 3.927955, -5.230656,
3.958996, -3.255745, 6.236486,
3.958996, 3.927955, 6.236486,
3.958996, -3.255745, -5.230656,
3.958996, -3.255745, 6.236486,
3.958996, 3.927955, -5.230656,
3.958996, 3.927955, 6.236486
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
var radius = 8.049921;
var distance = 35.81501;
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
mvMatrix.translate( -0.6361974, -0.3361051, -0.5029151 );
mvMatrix.scale( 1.309699, 1.211595, 0.759015 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.81501);
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
Amitraz<-read.table("Amitraz.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Amitraz$V2
```

```
## Error in eval(expr, envir, enclos): object 'Amitraz' not found
```

```r
y<-Amitraz$V3
```

```
## Error in eval(expr, envir, enclos): object 'Amitraz' not found
```

```r
z<-Amitraz$V4
```

```
## Error in eval(expr, envir, enclos): object 'Amitraz' not found
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
-2.589821, 0.6307888, -1.15162, 0, 0, 1, 1, 1,
-2.495488, -0.06815685, -3.151342, 1, 0, 0, 1, 1,
-2.41071, -0.4066136, -4.11111, 1, 0, 0, 1, 1,
-2.389764, 1.819635, -1.777437, 1, 0, 0, 1, 1,
-2.383542, -0.6063537, -1.179895, 1, 0, 0, 1, 1,
-2.354095, -0.4394659, -1.337039, 1, 0, 0, 1, 1,
-2.318297, -0.9934991, -1.746197, 0, 0, 0, 1, 1,
-2.305907, -0.1479815, -0.7557102, 0, 0, 0, 1, 1,
-2.297826, -0.6830751, 0.3625951, 0, 0, 0, 1, 1,
-2.255044, 2.370605, 0.3617508, 0, 0, 0, 1, 1,
-2.227571, -1.167997, -1.192668, 0, 0, 0, 1, 1,
-2.189965, -0.691682, -2.445504, 0, 0, 0, 1, 1,
-2.120191, 0.612962, -0.8331149, 0, 0, 0, 1, 1,
-2.101198, -0.4376992, -1.157207, 1, 1, 1, 1, 1,
-2.093959, 0.2626418, -2.369786, 1, 1, 1, 1, 1,
-2.084938, 0.6580413, -0.9882783, 1, 1, 1, 1, 1,
-2.007548, 1.064971, -1.370117, 1, 1, 1, 1, 1,
-1.97392, 0.6069028, 0.3107286, 1, 1, 1, 1, 1,
-1.973845, -0.3059552, -4.031795, 1, 1, 1, 1, 1,
-1.948677, 0.8565884, -0.4226161, 1, 1, 1, 1, 1,
-1.943724, 0.8364501, -0.01034388, 1, 1, 1, 1, 1,
-1.939147, -1.18594, -4.318488, 1, 1, 1, 1, 1,
-1.929021, 0.7067881, -1.233897, 1, 1, 1, 1, 1,
-1.927203, 1.505297, 0.3171968, 1, 1, 1, 1, 1,
-1.910741, -1.449338, -3.43749, 1, 1, 1, 1, 1,
-1.895753, 1.13629, -2.007555, 1, 1, 1, 1, 1,
-1.886801, -0.3226954, -1.559306, 1, 1, 1, 1, 1,
-1.882438, -0.9531218, -2.065719, 1, 1, 1, 1, 1,
-1.882328, 0.201277, 0.1100861, 0, 0, 1, 1, 1,
-1.868389, -1.424063, -3.318027, 1, 0, 0, 1, 1,
-1.860408, 0.3442441, -1.782754, 1, 0, 0, 1, 1,
-1.854278, 0.297976, -1.943014, 1, 0, 0, 1, 1,
-1.854191, 0.028181, -2.463792, 1, 0, 0, 1, 1,
-1.834773, -1.302644, -2.148102, 1, 0, 0, 1, 1,
-1.832832, -0.4107973, -0.9582828, 0, 0, 0, 1, 1,
-1.824062, -1.174103, -2.72986, 0, 0, 0, 1, 1,
-1.812812, 2.109065, -1.671329, 0, 0, 0, 1, 1,
-1.789657, -1.451186, -2.837804, 0, 0, 0, 1, 1,
-1.75788, 0.007585193, -1.285223, 0, 0, 0, 1, 1,
-1.731558, 0.8688552, -1.452262, 0, 0, 0, 1, 1,
-1.722415, -0.04596091, -1.303095, 0, 0, 0, 1, 1,
-1.70167, -2.252322, -2.421438, 1, 1, 1, 1, 1,
-1.697548, -1.126935, -3.51172, 1, 1, 1, 1, 1,
-1.686492, 0.5068659, -2.200576, 1, 1, 1, 1, 1,
-1.679902, 1.956476, 0.6807054, 1, 1, 1, 1, 1,
-1.676503, 0.00863917, -1.343701, 1, 1, 1, 1, 1,
-1.666224, 0.09418236, -0.8788567, 1, 1, 1, 1, 1,
-1.661856, 1.199799, -0.1895117, 1, 1, 1, 1, 1,
-1.661099, 0.6421431, -3.309438, 1, 1, 1, 1, 1,
-1.644647, 1.138559, 0.6598302, 1, 1, 1, 1, 1,
-1.642981, 0.2934664, -1.786432, 1, 1, 1, 1, 1,
-1.627265, 0.2938, -1.838174, 1, 1, 1, 1, 1,
-1.622242, -0.4691642, -2.130223, 1, 1, 1, 1, 1,
-1.621853, 0.171533, -1.706722, 1, 1, 1, 1, 1,
-1.605239, 0.1997399, -0.08449497, 1, 1, 1, 1, 1,
-1.594344, 0.4248884, -0.5454825, 1, 1, 1, 1, 1,
-1.591097, -1.432965, -1.988227, 0, 0, 1, 1, 1,
-1.584529, 1.704682, -1.959948, 1, 0, 0, 1, 1,
-1.582618, 0.8175266, -0.6552652, 1, 0, 0, 1, 1,
-1.570415, -1.521864, -1.74848, 1, 0, 0, 1, 1,
-1.55109, 0.3306983, -1.590496, 1, 0, 0, 1, 1,
-1.547744, 1.321168, 0.4882779, 1, 0, 0, 1, 1,
-1.533698, -0.1328608, -4.034714, 0, 0, 0, 1, 1,
-1.532564, -0.4869764, -1.190147, 0, 0, 0, 1, 1,
-1.532383, -0.6090917, -2.258949, 0, 0, 0, 1, 1,
-1.526505, -2.269058, -1.597904, 0, 0, 0, 1, 1,
-1.52572, 1.715776, -0.7867974, 0, 0, 0, 1, 1,
-1.522062, 1.694283, -1.079162, 0, 0, 0, 1, 1,
-1.515574, -1.407232, -1.290594, 0, 0, 0, 1, 1,
-1.510316, 1.691887, 0.6929739, 1, 1, 1, 1, 1,
-1.488307, 1.283817, 0.1544241, 1, 1, 1, 1, 1,
-1.481573, 0.4607182, -1.596438, 1, 1, 1, 1, 1,
-1.472756, 1.243806, -1.643376, 1, 1, 1, 1, 1,
-1.471931, -1.172663, -1.783749, 1, 1, 1, 1, 1,
-1.434121, 0.04976057, -0.4974535, 1, 1, 1, 1, 1,
-1.423394, -1.418145, -2.903285, 1, 1, 1, 1, 1,
-1.422525, 0.1869705, -0.8075421, 1, 1, 1, 1, 1,
-1.418622, -0.007755805, 0.2420919, 1, 1, 1, 1, 1,
-1.414716, -3.151128, -1.024097, 1, 1, 1, 1, 1,
-1.414358, 1.770813, -2.850489, 1, 1, 1, 1, 1,
-1.409712, 0.6653276, -0.3115271, 1, 1, 1, 1, 1,
-1.400582, 0.5150005, -0.05547979, 1, 1, 1, 1, 1,
-1.389433, -0.1411201, -0.9926233, 1, 1, 1, 1, 1,
-1.375684, -0.773182, -0.8748025, 1, 1, 1, 1, 1,
-1.373721, -0.635827, -1.723761, 0, 0, 1, 1, 1,
-1.371902, 1.069668, -1.404073, 1, 0, 0, 1, 1,
-1.371564, 0.2104138, -2.24265, 1, 0, 0, 1, 1,
-1.370459, 0.7032903, -1.634932, 1, 0, 0, 1, 1,
-1.359995, -0.5949749, -1.674931, 1, 0, 0, 1, 1,
-1.356993, -0.124121, -2.714674, 1, 0, 0, 1, 1,
-1.351476, -0.0020394, -0.3583019, 0, 0, 0, 1, 1,
-1.348868, -0.01462655, -2.177684, 0, 0, 0, 1, 1,
-1.340568, 0.04277641, -1.755114, 0, 0, 0, 1, 1,
-1.315547, -1.624698, -3.055282, 0, 0, 0, 1, 1,
-1.315511, 0.4559876, -1.888372, 0, 0, 0, 1, 1,
-1.308879, 0.2232743, -0.6445087, 0, 0, 0, 1, 1,
-1.29406, -0.3665191, -2.93029, 0, 0, 0, 1, 1,
-1.283795, -0.6146637, -1.600757, 1, 1, 1, 1, 1,
-1.280217, 1.169298, -0.5416114, 1, 1, 1, 1, 1,
-1.279235, 0.5326477, -0.8783322, 1, 1, 1, 1, 1,
-1.278847, -0.7377613, -1.761216, 1, 1, 1, 1, 1,
-1.271935, -0.4608419, -0.9226171, 1, 1, 1, 1, 1,
-1.258505, -0.6212656, -3.138594, 1, 1, 1, 1, 1,
-1.244995, 0.4441633, 0.544533, 1, 1, 1, 1, 1,
-1.237807, 0.05599449, -1.260803, 1, 1, 1, 1, 1,
-1.237421, -0.9712678, -2.20568, 1, 1, 1, 1, 1,
-1.237002, 0.4803632, -2.087257, 1, 1, 1, 1, 1,
-1.232866, 0.3304396, -1.485971, 1, 1, 1, 1, 1,
-1.23209, -0.1681531, -1.386827, 1, 1, 1, 1, 1,
-1.225291, 0.5104469, -0.6489639, 1, 1, 1, 1, 1,
-1.209066, 1.614465, 0.06558256, 1, 1, 1, 1, 1,
-1.208388, -0.7021698, -2.457223, 1, 1, 1, 1, 1,
-1.194549, 1.255367, -1.835989, 0, 0, 1, 1, 1,
-1.190039, -0.6747498, -1.072771, 1, 0, 0, 1, 1,
-1.187217, -0.3259152, -3.604331, 1, 0, 0, 1, 1,
-1.178061, -0.8090612, -2.483679, 1, 0, 0, 1, 1,
-1.177925, -0.2599173, -3.066422, 1, 0, 0, 1, 1,
-1.177161, 0.2009231, -0.936222, 1, 0, 0, 1, 1,
-1.1709, -1.091903, -2.768391, 0, 0, 0, 1, 1,
-1.169387, 0.9586011, -0.3312131, 0, 0, 0, 1, 1,
-1.16932, -0.9972734, -3.828791, 0, 0, 0, 1, 1,
-1.162176, 0.2539928, -1.09346, 0, 0, 0, 1, 1,
-1.157818, -1.090529, -4.162781, 0, 0, 0, 1, 1,
-1.157125, -0.6776252, -2.068914, 0, 0, 0, 1, 1,
-1.15578, 2.495179, -0.2930845, 0, 0, 0, 1, 1,
-1.153376, -1.143843, -3.045926, 1, 1, 1, 1, 1,
-1.144873, 0.1581845, -1.289644, 1, 1, 1, 1, 1,
-1.133165, 0.6007028, -1.896992, 1, 1, 1, 1, 1,
-1.127166, -0.06956428, -2.528453, 1, 1, 1, 1, 1,
-1.121418, 1.88298, -0.1746198, 1, 1, 1, 1, 1,
-1.120903, 2.010726, 0.7242702, 1, 1, 1, 1, 1,
-1.115255, -0.9150222, -1.445123, 1, 1, 1, 1, 1,
-1.11299, -0.3968987, -0.6272258, 1, 1, 1, 1, 1,
-1.109374, -0.1899296, -2.811356, 1, 1, 1, 1, 1,
-1.099324, -1.130438, -0.7481485, 1, 1, 1, 1, 1,
-1.097638, 0.860437, -1.751871, 1, 1, 1, 1, 1,
-1.097389, 0.0925682, -2.632704, 1, 1, 1, 1, 1,
-1.094448, -0.5777822, -2.932907, 1, 1, 1, 1, 1,
-1.077145, 0.5210451, -2.568335, 1, 1, 1, 1, 1,
-1.075325, 0.05052698, -1.992046, 1, 1, 1, 1, 1,
-1.072706, 0.3393576, -0.7549848, 0, 0, 1, 1, 1,
-1.072651, 0.009055727, -1.790288, 1, 0, 0, 1, 1,
-1.068597, -0.711666, -0.5577188, 1, 0, 0, 1, 1,
-1.044214, 1.197471, 0.8310795, 1, 0, 0, 1, 1,
-1.042599, -0.08864634, -1.837208, 1, 0, 0, 1, 1,
-1.04117, 0.627998, -1.030854, 1, 0, 0, 1, 1,
-1.039648, 1.793678, -0.4715666, 0, 0, 0, 1, 1,
-1.039522, -2.02716, -3.557976, 0, 0, 0, 1, 1,
-1.029982, 0.3914174, -0.1401642, 0, 0, 0, 1, 1,
-1.026011, -2.262345, -2.602101, 0, 0, 0, 1, 1,
-1.024265, 0.4317735, -1.781329, 0, 0, 0, 1, 1,
-1.022267, -1.258363, -1.095832, 0, 0, 0, 1, 1,
-1.021774, 0.3063032, -0.7496306, 0, 0, 0, 1, 1,
-1.018942, 0.3724145, -0.5436026, 1, 1, 1, 1, 1,
-1.017219, -1.27046, -2.940579, 1, 1, 1, 1, 1,
-1.014959, 1.255295, -0.5351672, 1, 1, 1, 1, 1,
-1.010833, 0.8744904, -1.065481, 1, 1, 1, 1, 1,
-1.008879, 0.27177, -0.9909517, 1, 1, 1, 1, 1,
-1.00867, -0.4378934, -1.999764, 1, 1, 1, 1, 1,
-1.000571, -1.315335, -2.645791, 1, 1, 1, 1, 1,
-0.9986947, 0.1155536, -1.364239, 1, 1, 1, 1, 1,
-0.9971389, 2.090752, -1.618282, 1, 1, 1, 1, 1,
-0.9891696, -1.561143, -2.943382, 1, 1, 1, 1, 1,
-0.9852073, -2.107988, -1.952473, 1, 1, 1, 1, 1,
-0.9829952, -2.043188, -1.866858, 1, 1, 1, 1, 1,
-0.9813341, -0.5362292, -1.716303, 1, 1, 1, 1, 1,
-0.9794713, 1.306966, -1.812879, 1, 1, 1, 1, 1,
-0.9783177, -2.093636, -1.369099, 1, 1, 1, 1, 1,
-0.9714183, 0.3795773, -1.321672, 0, 0, 1, 1, 1,
-0.9675468, -0.2489424, -1.697755, 1, 0, 0, 1, 1,
-0.9631499, -0.8343483, -2.972176, 1, 0, 0, 1, 1,
-0.9599776, 1.110633, 0.6318444, 1, 0, 0, 1, 1,
-0.9558556, -0.8585023, -2.438767, 1, 0, 0, 1, 1,
-0.9555426, -1.850208, -4.655698, 1, 0, 0, 1, 1,
-0.9553155, 0.6637998, -0.8174923, 0, 0, 0, 1, 1,
-0.9470398, 1.054326, -1.096179, 0, 0, 0, 1, 1,
-0.9469029, -0.7551534, -2.239414, 0, 0, 0, 1, 1,
-0.946802, -1.702878, -0.9569773, 0, 0, 0, 1, 1,
-0.9437978, -0.6724601, -0.9928686, 0, 0, 0, 1, 1,
-0.9406326, 2.943227, -0.5735506, 0, 0, 0, 1, 1,
-0.9336185, 0.2264368, -0.4563707, 0, 0, 0, 1, 1,
-0.9321697, 3.823338, -0.4319047, 1, 1, 1, 1, 1,
-0.9221839, 0.4060262, -0.1751846, 1, 1, 1, 1, 1,
-0.9047807, 0.006234031, -2.437855, 1, 1, 1, 1, 1,
-0.9044316, -0.8513021, -3.89204, 1, 1, 1, 1, 1,
-0.8936145, 0.05575275, -1.426278, 1, 1, 1, 1, 1,
-0.8935385, -1.926145, -4.513579, 1, 1, 1, 1, 1,
-0.8869129, -1.243354, -1.990794, 1, 1, 1, 1, 1,
-0.8819892, 1.014645, -0.4169722, 1, 1, 1, 1, 1,
-0.8804981, 0.9163796, 0.1375459, 1, 1, 1, 1, 1,
-0.8786036, -0.3064303, -3.059173, 1, 1, 1, 1, 1,
-0.8743597, -0.1585438, -2.145896, 1, 1, 1, 1, 1,
-0.8664605, -0.3512381, -2.007954, 1, 1, 1, 1, 1,
-0.8661946, -1.606927, -1.51311, 1, 1, 1, 1, 1,
-0.8641677, 0.1329264, -2.300959, 1, 1, 1, 1, 1,
-0.8616847, 1.532182, -1.416234, 1, 1, 1, 1, 1,
-0.857321, 0.3602805, -2.402571, 0, 0, 1, 1, 1,
-0.8539019, 0.5431179, -1.692582, 1, 0, 0, 1, 1,
-0.8443027, -1.263494, -2.237527, 1, 0, 0, 1, 1,
-0.8433346, -0.1149658, -3.656462, 1, 0, 0, 1, 1,
-0.8422368, -0.5415993, -2.989546, 1, 0, 0, 1, 1,
-0.8340411, 1.615077, -0.7627792, 1, 0, 0, 1, 1,
-0.8315653, -0.1707508, -0.9568011, 0, 0, 0, 1, 1,
-0.8276709, 0.1502694, -1.707239, 0, 0, 0, 1, 1,
-0.8232993, -0.1702126, -0.5028667, 0, 0, 0, 1, 1,
-0.8227707, -0.7085719, -2.875528, 0, 0, 0, 1, 1,
-0.8216661, -0.599287, -0.8783168, 0, 0, 0, 1, 1,
-0.8192689, -0.8374791, -3.27984, 0, 0, 0, 1, 1,
-0.8104981, 0.5990646, 1.024228, 0, 0, 0, 1, 1,
-0.8026056, 1.260643, 0.7484047, 1, 1, 1, 1, 1,
-0.7935047, -1.924328, -2.719686, 1, 1, 1, 1, 1,
-0.7864028, 0.001763358, -0.838924, 1, 1, 1, 1, 1,
-0.7854849, -0.5788704, -1.721498, 1, 1, 1, 1, 1,
-0.7847431, 2.424214, 0.3136858, 1, 1, 1, 1, 1,
-0.7846819, 2.2265, -1.149312, 1, 1, 1, 1, 1,
-0.7837247, 0.2371313, -1.324459, 1, 1, 1, 1, 1,
-0.7828396, 0.3155744, -1.1999, 1, 1, 1, 1, 1,
-0.7825388, 0.2485139, -1.444109, 1, 1, 1, 1, 1,
-0.7742314, -1.492279, -3.366846, 1, 1, 1, 1, 1,
-0.7726352, 0.4988879, -0.5829316, 1, 1, 1, 1, 1,
-0.7722521, 0.2856731, -1.814996, 1, 1, 1, 1, 1,
-0.769559, 0.8025478, -0.7361812, 1, 1, 1, 1, 1,
-0.766498, 1.074517, -1.440666, 1, 1, 1, 1, 1,
-0.7632484, -0.7187433, -2.400603, 1, 1, 1, 1, 1,
-0.7588462, 0.180529, -2.468167, 0, 0, 1, 1, 1,
-0.7522336, 0.7268887, -1.413797, 1, 0, 0, 1, 1,
-0.7507622, -1.199149, -3.62226, 1, 0, 0, 1, 1,
-0.7501852, 1.144933, 0.5613328, 1, 0, 0, 1, 1,
-0.7464424, -1.55233, -2.819788, 1, 0, 0, 1, 1,
-0.7404355, 0.857655, 0.1137643, 1, 0, 0, 1, 1,
-0.7387959, -0.1169212, -1.75905, 0, 0, 0, 1, 1,
-0.7377753, -0.4139557, -1.044286, 0, 0, 0, 1, 1,
-0.7337211, -2.516227, -2.80195, 0, 0, 0, 1, 1,
-0.7309173, 0.1773976, -0.6273341, 0, 0, 0, 1, 1,
-0.7256054, 1.056012, -1.258243, 0, 0, 0, 1, 1,
-0.7247335, -0.4887588, -3.587646, 0, 0, 0, 1, 1,
-0.7245529, -0.6788257, -3.17049, 0, 0, 0, 1, 1,
-0.7231693, 1.995325, -0.4981966, 1, 1, 1, 1, 1,
-0.7230967, -0.4161703, -2.406263, 1, 1, 1, 1, 1,
-0.711958, -1.391552, -3.081863, 1, 1, 1, 1, 1,
-0.7094778, -0.3724622, -1.559453, 1, 1, 1, 1, 1,
-0.7038258, -2.382766, -3.895447, 1, 1, 1, 1, 1,
-0.7035529, 0.5555153, -0.1348061, 1, 1, 1, 1, 1,
-0.7022277, -0.450074, -1.155814, 1, 1, 1, 1, 1,
-0.7018797, -0.9002029, -3.20436, 1, 1, 1, 1, 1,
-0.7015743, 0.4631325, 0.8749484, 1, 1, 1, 1, 1,
-0.6993089, 1.269863, -2.149223, 1, 1, 1, 1, 1,
-0.6991408, -1.03083, -2.436319, 1, 1, 1, 1, 1,
-0.6940681, 0.4057281, -0.3689027, 1, 1, 1, 1, 1,
-0.6910337, 0.1593328, -2.174588, 1, 1, 1, 1, 1,
-0.6908101, 0.9913728, 0.5577707, 1, 1, 1, 1, 1,
-0.6875933, -0.7844972, -0.947023, 1, 1, 1, 1, 1,
-0.6872161, 0.8782696, -1.875455, 0, 0, 1, 1, 1,
-0.6867064, -0.8945156, -1.904084, 1, 0, 0, 1, 1,
-0.680481, -0.2119041, -1.319723, 1, 0, 0, 1, 1,
-0.6740038, -0.4693025, -1.402275, 1, 0, 0, 1, 1,
-0.6736952, -1.245506, -2.621869, 1, 0, 0, 1, 1,
-0.6677695, 0.5664247, -0.2712398, 1, 0, 0, 1, 1,
-0.6638621, -1.740321, -1.785682, 0, 0, 0, 1, 1,
-0.663635, -0.1579492, -2.27797, 0, 0, 0, 1, 1,
-0.6632063, 0.5679186, 0.1803998, 0, 0, 0, 1, 1,
-0.6547192, 0.4934129, 0.08840325, 0, 0, 0, 1, 1,
-0.6543494, -0.1746912, -2.686719, 0, 0, 0, 1, 1,
-0.6529444, -1.887262, -2.472924, 0, 0, 0, 1, 1,
-0.6415623, 1.109798, 1.633821, 0, 0, 0, 1, 1,
-0.6405191, -0.3171186, -2.012009, 1, 1, 1, 1, 1,
-0.6331488, -0.6564596, -3.078006, 1, 1, 1, 1, 1,
-0.6304236, 0.1484717, -2.368417, 1, 1, 1, 1, 1,
-0.6282336, 0.8150822, -0.9826413, 1, 1, 1, 1, 1,
-0.6268146, 0.5902959, -0.4354234, 1, 1, 1, 1, 1,
-0.6263925, -1.090459, -2.292336, 1, 1, 1, 1, 1,
-0.625753, 0.5551456, -1.077191, 1, 1, 1, 1, 1,
-0.6256404, 0.4276175, -1.314927, 1, 1, 1, 1, 1,
-0.6238708, 1.356973, -1.001187, 1, 1, 1, 1, 1,
-0.6228483, 0.9953663, -0.7432603, 1, 1, 1, 1, 1,
-0.6222414, -1.540849, -3.280236, 1, 1, 1, 1, 1,
-0.6218024, -0.001457909, -1.96956, 1, 1, 1, 1, 1,
-0.6207775, -1.779538, -3.894696, 1, 1, 1, 1, 1,
-0.6108458, 0.7244437, -2.714103, 1, 1, 1, 1, 1,
-0.6100581, -0.6775072, -1.714915, 1, 1, 1, 1, 1,
-0.6031811, 0.8086938, 0.8257099, 0, 0, 1, 1, 1,
-0.5996161, -0.6992539, -3.742566, 1, 0, 0, 1, 1,
-0.5984489, -1.137839, -3.493255, 1, 0, 0, 1, 1,
-0.5941026, -0.1256213, -1.003449, 1, 0, 0, 1, 1,
-0.5939695, 0.8837981, -0.1019171, 1, 0, 0, 1, 1,
-0.5930371, -0.7628569, -3.752017, 1, 0, 0, 1, 1,
-0.58825, 1.346464, -1.725481, 0, 0, 0, 1, 1,
-0.5872427, -1.640731, -1.19919, 0, 0, 0, 1, 1,
-0.5859018, 0.7901744, -1.643022, 0, 0, 0, 1, 1,
-0.5845546, 0.5563004, -0.5649441, 0, 0, 0, 1, 1,
-0.5796031, 0.9542651, -0.2072656, 0, 0, 0, 1, 1,
-0.5743233, 0.2548848, -1.501808, 0, 0, 0, 1, 1,
-0.5706266, 0.5443841, -0.3798376, 0, 0, 0, 1, 1,
-0.5656558, -2.392928, -2.113653, 1, 1, 1, 1, 1,
-0.5620824, 0.3837398, -0.6379761, 1, 1, 1, 1, 1,
-0.559929, 2.952193, 0.4408596, 1, 1, 1, 1, 1,
-0.5591931, -0.4617163, -1.856542, 1, 1, 1, 1, 1,
-0.5578031, 0.08403309, -0.8750896, 1, 1, 1, 1, 1,
-0.557287, -1.253731, -3.571871, 1, 1, 1, 1, 1,
-0.5558131, -1.340269, -1.524485, 1, 1, 1, 1, 1,
-0.5553316, 1.640983, 2.068748, 1, 1, 1, 1, 1,
-0.551319, -0.3452815, -1.349262, 1, 1, 1, 1, 1,
-0.5463263, 0.4590517, -0.9441113, 1, 1, 1, 1, 1,
-0.5452783, 0.7381296, 0.5077841, 1, 1, 1, 1, 1,
-0.5436217, -0.6191193, -1.04519, 1, 1, 1, 1, 1,
-0.5387214, 1.406881, 0.4378861, 1, 1, 1, 1, 1,
-0.5340886, -0.3081625, -2.389307, 1, 1, 1, 1, 1,
-0.5319208, 0.1675696, -0.282934, 1, 1, 1, 1, 1,
-0.5312772, 1.578761, -1.126184, 0, 0, 1, 1, 1,
-0.5286157, 1.085408, -1.850754, 1, 0, 0, 1, 1,
-0.5277256, 0.2275588, -2.018658, 1, 0, 0, 1, 1,
-0.5252453, 0.4437906, -2.054798, 1, 0, 0, 1, 1,
-0.5244035, 0.2189174, -0.3476819, 1, 0, 0, 1, 1,
-0.5242243, 1.153933, 0.3145507, 1, 0, 0, 1, 1,
-0.5209371, -0.1040516, -1.822321, 0, 0, 0, 1, 1,
-0.5198296, -0.1698025, -2.535374, 0, 0, 0, 1, 1,
-0.5180009, 0.2429996, -2.163355, 0, 0, 0, 1, 1,
-0.5152754, -0.0007253042, -2.822394, 0, 0, 0, 1, 1,
-0.514624, 0.249396, -1.615716, 0, 0, 0, 1, 1,
-0.5115851, 2.252937, -2.606964, 0, 0, 0, 1, 1,
-0.5110376, 0.7583925, -2.187449, 0, 0, 0, 1, 1,
-0.5109876, -0.3314684, -2.221585, 1, 1, 1, 1, 1,
-0.5057385, -1.006977, -1.934885, 1, 1, 1, 1, 1,
-0.5042498, 0.1279832, -2.439707, 1, 1, 1, 1, 1,
-0.5041044, -0.1385882, -3.354167, 1, 1, 1, 1, 1,
-0.5030898, -0.4951362, -2.936704, 1, 1, 1, 1, 1,
-0.5016056, 0.3400895, -1.281978, 1, 1, 1, 1, 1,
-0.49491, 0.2200848, -1.55838, 1, 1, 1, 1, 1,
-0.4928253, 0.08841816, -0.04322876, 1, 1, 1, 1, 1,
-0.4924265, -1.208912, -2.233379, 1, 1, 1, 1, 1,
-0.4821067, 0.1011944, -1.588315, 1, 1, 1, 1, 1,
-0.478215, -2.095537, -3.35064, 1, 1, 1, 1, 1,
-0.4775994, 1.677229, -1.096449, 1, 1, 1, 1, 1,
-0.4748107, 0.2102464, -2.219821, 1, 1, 1, 1, 1,
-0.474089, -0.01739807, -1.236008, 1, 1, 1, 1, 1,
-0.4714499, 0.2811244, -1.417782, 1, 1, 1, 1, 1,
-0.4664458, 0.4455147, -2.336923, 0, 0, 1, 1, 1,
-0.4659729, -1.633661, -2.203221, 1, 0, 0, 1, 1,
-0.4636781, -0.3390052, -2.501279, 1, 0, 0, 1, 1,
-0.4607077, 0.5132619, 1.181355, 1, 0, 0, 1, 1,
-0.4592566, -0.7284438, -2.506653, 1, 0, 0, 1, 1,
-0.458894, -0.5679223, -2.491234, 1, 0, 0, 1, 1,
-0.4551803, 0.1420496, -1.639219, 0, 0, 0, 1, 1,
-0.4542564, 1.756338, 0.5388454, 0, 0, 0, 1, 1,
-0.4508967, -1.473554, -3.441252, 0, 0, 0, 1, 1,
-0.4489307, 1.474121, -0.6074741, 0, 0, 0, 1, 1,
-0.4457585, -1.07347, -2.085311, 0, 0, 0, 1, 1,
-0.4432576, -0.6151644, -2.877255, 0, 0, 0, 1, 1,
-0.4392464, -0.417366, -1.960657, 0, 0, 0, 1, 1,
-0.4324456, -1.492915, -3.144251, 1, 1, 1, 1, 1,
-0.4297757, 0.2820877, -1.915393, 1, 1, 1, 1, 1,
-0.4292985, -0.5018831, -1.56912, 1, 1, 1, 1, 1,
-0.4273548, 1.674222, 0.241659, 1, 1, 1, 1, 1,
-0.4262283, -0.6190877, -2.353626, 1, 1, 1, 1, 1,
-0.4206141, -1.030971, -3.291647, 1, 1, 1, 1, 1,
-0.4173263, 0.1774319, -1.248763, 1, 1, 1, 1, 1,
-0.4154151, 0.0327577, -1.370296, 1, 1, 1, 1, 1,
-0.4142988, -1.173435, -2.269854, 1, 1, 1, 1, 1,
-0.4112105, 0.6950818, 0.2556219, 1, 1, 1, 1, 1,
-0.4076242, -1.861578, -1.926157, 1, 1, 1, 1, 1,
-0.4058127, -0.6521052, -4.048368, 1, 1, 1, 1, 1,
-0.3985529, 0.6820505, 0.5177845, 1, 1, 1, 1, 1,
-0.3920378, 2.43988, -0.2660255, 1, 1, 1, 1, 1,
-0.3906003, 1.011875, -3.740312, 1, 1, 1, 1, 1,
-0.3903594, 0.8410643, -0.7278295, 0, 0, 1, 1, 1,
-0.3882159, 1.594858, 0.03361385, 1, 0, 0, 1, 1,
-0.3880425, -0.3021133, -1.052318, 1, 0, 0, 1, 1,
-0.3879457, 2.009316, 0.7989037, 1, 0, 0, 1, 1,
-0.3858545, 0.2397885, -0.1933193, 1, 0, 0, 1, 1,
-0.3854243, 0.2476216, -1.788269, 1, 0, 0, 1, 1,
-0.3846494, 0.4223277, -2.192335, 0, 0, 0, 1, 1,
-0.3812902, 0.6674463, 1.334407, 0, 0, 0, 1, 1,
-0.3809686, 0.7748444, -1.665373, 0, 0, 0, 1, 1,
-0.3809233, -1.598473, -5.063659, 0, 0, 0, 1, 1,
-0.3806498, 0.2705604, -1.436221, 0, 0, 0, 1, 1,
-0.3721073, -1.250201, -4.390735, 0, 0, 0, 1, 1,
-0.3699856, -0.3274218, -2.534135, 0, 0, 0, 1, 1,
-0.3687121, -0.9646035, -4.99053, 1, 1, 1, 1, 1,
-0.3681191, 1.06135, 0.921038, 1, 1, 1, 1, 1,
-0.3679404, 0.03129156, -2.151098, 1, 1, 1, 1, 1,
-0.365299, -0.1718844, -2.353522, 1, 1, 1, 1, 1,
-0.3650538, -0.3926139, -2.436784, 1, 1, 1, 1, 1,
-0.3634868, -1.850635, -3.34468, 1, 1, 1, 1, 1,
-0.3618702, 1.203169, 0.04498958, 1, 1, 1, 1, 1,
-0.3616868, 1.716096, -2.830178, 1, 1, 1, 1, 1,
-0.3602049, 1.00817, -1.602197, 1, 1, 1, 1, 1,
-0.3590711, 1.485887, 0.2918605, 1, 1, 1, 1, 1,
-0.3567154, 0.3505666, 1.346303, 1, 1, 1, 1, 1,
-0.3553869, -0.4610842, -2.624169, 1, 1, 1, 1, 1,
-0.3539133, -1.332645, -3.099104, 1, 1, 1, 1, 1,
-0.3513802, -0.2478278, -1.396155, 1, 1, 1, 1, 1,
-0.3495295, 0.1700107, -2.543071, 1, 1, 1, 1, 1,
-0.3393225, 0.5465065, -0.8059754, 0, 0, 1, 1, 1,
-0.3382901, -1.413525, -2.053145, 1, 0, 0, 1, 1,
-0.3378436, 0.5425772, -0.7367887, 1, 0, 0, 1, 1,
-0.3358173, 0.7499661, -0.4627524, 1, 0, 0, 1, 1,
-0.3336152, 0.3792946, -0.6786011, 1, 0, 0, 1, 1,
-0.3334944, 1.141191, 0.1502427, 1, 0, 0, 1, 1,
-0.3327832, 0.1267189, -1.831483, 0, 0, 0, 1, 1,
-0.329377, 0.04872736, -2.53199, 0, 0, 0, 1, 1,
-0.3285625, 0.09655997, -2.682999, 0, 0, 0, 1, 1,
-0.3279121, -0.5209937, -2.205053, 0, 0, 0, 1, 1,
-0.3250774, -0.8379799, -2.586604, 0, 0, 0, 1, 1,
-0.3245791, 0.5273642, 0.3143145, 0, 0, 0, 1, 1,
-0.3240421, 0.2510224, -0.155224, 0, 0, 0, 1, 1,
-0.3146513, 0.4292602, -0.752657, 1, 1, 1, 1, 1,
-0.3133058, -0.1113726, -1.114551, 1, 1, 1, 1, 1,
-0.3065892, 0.4487796, -0.1756022, 1, 1, 1, 1, 1,
-0.3022579, 0.2075083, -1.174201, 1, 1, 1, 1, 1,
-0.2988498, -0.07732926, -0.6444725, 1, 1, 1, 1, 1,
-0.2977539, -0.8266886, -2.660201, 1, 1, 1, 1, 1,
-0.2958994, -0.3323126, -2.516995, 1, 1, 1, 1, 1,
-0.2932769, -0.3122611, -2.135859, 1, 1, 1, 1, 1,
-0.2922157, -1.572728, -3.365904, 1, 1, 1, 1, 1,
-0.2907578, 0.2015908, -1.207523, 1, 1, 1, 1, 1,
-0.2879087, -0.7459231, -2.776308, 1, 1, 1, 1, 1,
-0.2859143, -0.413997, -2.009165, 1, 1, 1, 1, 1,
-0.2812505, -0.8440165, -3.286738, 1, 1, 1, 1, 1,
-0.2794995, 0.4106068, -1.628499, 1, 1, 1, 1, 1,
-0.2766056, -0.1666218, -1.291472, 1, 1, 1, 1, 1,
-0.2717289, 0.9076936, -0.08739758, 0, 0, 1, 1, 1,
-0.2714249, 0.2962133, -2.561943, 1, 0, 0, 1, 1,
-0.2630696, 0.4868024, 1.990858, 1, 0, 0, 1, 1,
-0.2591877, -0.5408859, -3.550556, 1, 0, 0, 1, 1,
-0.2528722, 0.5320495, 1.531566, 1, 0, 0, 1, 1,
-0.2526146, -0.3628675, -3.48105, 1, 0, 0, 1, 1,
-0.2514272, 0.001779473, -1.993104, 0, 0, 0, 1, 1,
-0.2445132, 1.814762, -0.1926751, 0, 0, 0, 1, 1,
-0.244478, 0.644076, -0.5593921, 0, 0, 0, 1, 1,
-0.2427439, -1.132339, -2.416149, 0, 0, 0, 1, 1,
-0.2394487, -0.5650172, -2.36567, 0, 0, 0, 1, 1,
-0.2380531, -1.169299, -2.241721, 0, 0, 0, 1, 1,
-0.2375236, 0.994412, -1.983252, 0, 0, 0, 1, 1,
-0.235622, -0.7552115, -2.382607, 1, 1, 1, 1, 1,
-0.2339117, -1.202853, -1.365354, 1, 1, 1, 1, 1,
-0.2257551, 2.336274, -0.5677882, 1, 1, 1, 1, 1,
-0.2204507, 1.236205, -1.530909, 1, 1, 1, 1, 1,
-0.2178952, 0.0547116, 0.8117934, 1, 1, 1, 1, 1,
-0.2138992, 0.7603304, -0.5735092, 1, 1, 1, 1, 1,
-0.211866, -0.2144417, -0.7855263, 1, 1, 1, 1, 1,
-0.2118099, -0.7615798, -1.831339, 1, 1, 1, 1, 1,
-0.2038058, 0.9639084, -1.267358, 1, 1, 1, 1, 1,
-0.2027088, -0.5575398, -3.594225, 1, 1, 1, 1, 1,
-0.1920688, -1.152005, -3.456529, 1, 1, 1, 1, 1,
-0.1918069, 0.6440224, 0.6054212, 1, 1, 1, 1, 1,
-0.1915336, -0.4226202, -2.756811, 1, 1, 1, 1, 1,
-0.1872228, 0.08885854, -1.933936, 1, 1, 1, 1, 1,
-0.1854549, -0.6440966, -2.529886, 1, 1, 1, 1, 1,
-0.1845908, -0.4006549, -1.841532, 0, 0, 1, 1, 1,
-0.1841913, 0.4558603, -2.301245, 1, 0, 0, 1, 1,
-0.1808657, 1.6402, 0.6921233, 1, 0, 0, 1, 1,
-0.1808636, -0.9499578, -3.146541, 1, 0, 0, 1, 1,
-0.1804515, 0.7715214, 0.1897828, 1, 0, 0, 1, 1,
-0.1804281, -0.166473, -4.067621, 1, 0, 0, 1, 1,
-0.1794929, -0.5466795, -0.9494919, 0, 0, 0, 1, 1,
-0.175419, 1.61149, 0.9139971, 0, 0, 0, 1, 1,
-0.1699095, -1.139769, -2.487867, 0, 0, 0, 1, 1,
-0.1667545, 0.518464, 0.003782036, 0, 0, 0, 1, 1,
-0.1599107, 0.8339286, -0.8304707, 0, 0, 0, 1, 1,
-0.1541502, -1.357772, -2.256933, 0, 0, 0, 1, 1,
-0.1540268, 0.414871, -0.9809157, 0, 0, 0, 1, 1,
-0.1501828, -0.2288053, -2.134996, 1, 1, 1, 1, 1,
-0.1496328, -1.79336, -3.191987, 1, 1, 1, 1, 1,
-0.1494458, -1.521938, -4.31821, 1, 1, 1, 1, 1,
-0.1487242, -0.1155313, -2.864734, 1, 1, 1, 1, 1,
-0.1467824, 1.85829, 0.01987348, 1, 1, 1, 1, 1,
-0.1461558, -0.5520748, -1.508063, 1, 1, 1, 1, 1,
-0.1393257, 1.258072, -0.3135254, 1, 1, 1, 1, 1,
-0.1366772, -0.6088931, -2.03362, 1, 1, 1, 1, 1,
-0.1360951, 2.501508, -1.346637, 1, 1, 1, 1, 1,
-0.1359669, 0.682751, 0.6291423, 1, 1, 1, 1, 1,
-0.1338476, 0.05976821, 1.003874, 1, 1, 1, 1, 1,
-0.131451, -0.05314054, -1.659325, 1, 1, 1, 1, 1,
-0.1299282, -0.07609911, -0.8817477, 1, 1, 1, 1, 1,
-0.1296939, -0.8724562, -4.030198, 1, 1, 1, 1, 1,
-0.1292914, -0.1122381, -2.583501, 1, 1, 1, 1, 1,
-0.1213505, -0.2939692, -2.967965, 0, 0, 1, 1, 1,
-0.1142884, -0.38658, -2.518814, 1, 0, 0, 1, 1,
-0.1077585, 0.9631968, -0.4569253, 1, 0, 0, 1, 1,
-0.1052492, -0.849173, -3.1777, 1, 0, 0, 1, 1,
-0.100795, -1.534434, -2.882077, 1, 0, 0, 1, 1,
-0.09700383, 0.2504947, 0.6755432, 1, 0, 0, 1, 1,
-0.09286634, -0.7483549, -2.822274, 0, 0, 0, 1, 1,
-0.09189057, 0.01992293, -1.347522, 0, 0, 0, 1, 1,
-0.08665176, -0.9169098, -3.333722, 0, 0, 0, 1, 1,
-0.08458764, 0.2779686, -0.1742406, 0, 0, 0, 1, 1,
-0.08445361, 1.370385, -0.4857081, 0, 0, 0, 1, 1,
-0.08229581, -0.04824606, -1.965855, 0, 0, 0, 1, 1,
-0.08201527, 0.1770612, 1.288352, 0, 0, 0, 1, 1,
-0.07610158, 0.5013124, 0.7101575, 1, 1, 1, 1, 1,
-0.07474158, 1.233001, -0.03374592, 1, 1, 1, 1, 1,
-0.07429616, 3.711483, 0.3092682, 1, 1, 1, 1, 1,
-0.07321789, -2.34155, -4.605785, 1, 1, 1, 1, 1,
-0.07274389, 0.3304377, -0.9986976, 1, 1, 1, 1, 1,
-0.07260669, -2.09501, -1.69596, 1, 1, 1, 1, 1,
-0.06491061, 0.1530447, -0.1521764, 1, 1, 1, 1, 1,
-0.06079625, 0.647422, 0.2222167, 1, 1, 1, 1, 1,
-0.05488364, -0.2723995, -1.574726, 1, 1, 1, 1, 1,
-0.05416863, 0.3501299, -1.059167, 1, 1, 1, 1, 1,
-0.05292743, 0.7554737, -0.2402652, 1, 1, 1, 1, 1,
-0.03977834, -0.1350606, -3.097395, 1, 1, 1, 1, 1,
-0.03937241, 0.8996489, 1.308426, 1, 1, 1, 1, 1,
-0.03801673, -0.3740532, -2.036643, 1, 1, 1, 1, 1,
-0.03650139, -1.037281, -1.664408, 1, 1, 1, 1, 1,
-0.03156616, -0.1794185, -2.566449, 0, 0, 1, 1, 1,
-0.02836984, 1.050131, 0.4230115, 1, 0, 0, 1, 1,
-0.02626976, 1.664516, 0.09242758, 1, 0, 0, 1, 1,
-0.02526782, -0.4962578, -3.829128, 1, 0, 0, 1, 1,
-0.02220213, 0.773156, -1.548717, 1, 0, 0, 1, 1,
-0.02058939, 0.1249115, -0.4299132, 1, 0, 0, 1, 1,
-0.01658377, 0.7421439, 0.8203474, 0, 0, 0, 1, 1,
-0.0152613, 0.686558, -1.30378, 0, 0, 0, 1, 1,
-0.01510904, 1.191956, -0.03858225, 0, 0, 0, 1, 1,
-0.01356672, -0.3777148, -3.038019, 0, 0, 0, 1, 1,
-0.01033492, -0.446487, -4.539987, 0, 0, 0, 1, 1,
-0.008847597, 1.757444, -0.1751311, 0, 0, 0, 1, 1,
0.0005279432, 1.169596, -1.876221, 0, 0, 0, 1, 1,
0.0009143079, 0.05329828, -0.4993831, 1, 1, 1, 1, 1,
0.004100562, -0.6195757, 1.427761, 1, 1, 1, 1, 1,
0.01054777, -0.6046953, 3.785465, 1, 1, 1, 1, 1,
0.01166851, -0.4705919, 3.960548, 1, 1, 1, 1, 1,
0.01577965, -0.1139477, 2.849721, 1, 1, 1, 1, 1,
0.0189976, 0.2815819, 0.9698625, 1, 1, 1, 1, 1,
0.02097519, -1.536501, 3.20641, 1, 1, 1, 1, 1,
0.0215654, 0.08764819, 1.26732, 1, 1, 1, 1, 1,
0.02158147, 1.829002, -0.312342, 1, 1, 1, 1, 1,
0.02514749, -1.494686, 1.347277, 1, 1, 1, 1, 1,
0.02732801, 0.7091013, 0.1609063, 1, 1, 1, 1, 1,
0.03502703, 1.633627, 1.186088, 1, 1, 1, 1, 1,
0.03641121, 0.623535, 1.309538, 1, 1, 1, 1, 1,
0.04392038, 0.8549454, 0.4192987, 1, 1, 1, 1, 1,
0.04493963, -0.3218791, 3.461994, 1, 1, 1, 1, 1,
0.04622962, -1.067722, 4.78954, 0, 0, 1, 1, 1,
0.04676666, 0.4148203, 0.541953, 1, 0, 0, 1, 1,
0.05164272, 0.3491046, -0.2260407, 1, 0, 0, 1, 1,
0.06068376, 0.3931009, 0.33572, 1, 0, 0, 1, 1,
0.06665438, 0.714401, 0.1228689, 1, 0, 0, 1, 1,
0.06699312, -0.7723312, 4.011613, 1, 0, 0, 1, 1,
0.06979277, 0.2094703, 1.336968, 0, 0, 0, 1, 1,
0.07358255, 0.4823221, -0.07299275, 0, 0, 0, 1, 1,
0.08001792, -1.443598, 3.717259, 0, 0, 0, 1, 1,
0.08082152, -0.08066617, 2.315072, 0, 0, 0, 1, 1,
0.08082862, 0.8570261, -0.03068922, 0, 0, 0, 1, 1,
0.0825403, -1.890164, 2.365661, 0, 0, 0, 1, 1,
0.0865753, -0.938125, 1.635616, 0, 0, 0, 1, 1,
0.09537411, -0.7494159, 2.343345, 1, 1, 1, 1, 1,
0.09618832, 0.07236401, 0.3973205, 1, 1, 1, 1, 1,
0.09848067, -0.4130926, 3.61326, 1, 1, 1, 1, 1,
0.0997189, -0.9337777, 2.412258, 1, 1, 1, 1, 1,
0.1004616, -0.1430613, 2.758789, 1, 1, 1, 1, 1,
0.1056219, 0.9027523, -0.1859768, 1, 1, 1, 1, 1,
0.1080342, 0.6344653, -2.291436, 1, 1, 1, 1, 1,
0.1091911, -0.1739209, 3.229794, 1, 1, 1, 1, 1,
0.109295, 0.3258255, 1.974629, 1, 1, 1, 1, 1,
0.1106122, -0.3404135, 3.511053, 1, 1, 1, 1, 1,
0.1190647, -1.840247, 2.322589, 1, 1, 1, 1, 1,
0.123491, -0.9357879, 1.386445, 1, 1, 1, 1, 1,
0.1292128, 0.1726074, 1.253307, 1, 1, 1, 1, 1,
0.1320719, -1.68352, 2.034062, 1, 1, 1, 1, 1,
0.1326798, -0.4504428, 2.082944, 1, 1, 1, 1, 1,
0.133735, 0.1166774, 0.9812151, 0, 0, 1, 1, 1,
0.133894, -0.3435677, 4.17591, 1, 0, 0, 1, 1,
0.1353294, 0.3434439, 1.306921, 1, 0, 0, 1, 1,
0.1355169, 0.3957864, 0.6696581, 1, 0, 0, 1, 1,
0.1376182, 0.9302661, 1.420413, 1, 0, 0, 1, 1,
0.1427327, 0.1465246, 0.9535161, 1, 0, 0, 1, 1,
0.1536712, 1.158065, 0.1825993, 0, 0, 0, 1, 1,
0.1541733, 0.7387195, -2.57834, 0, 0, 0, 1, 1,
0.1546578, 0.7009636, 1.140283, 0, 0, 0, 1, 1,
0.1551823, 0.7309958, 0.8072398, 0, 0, 0, 1, 1,
0.1575604, 0.4018372, -0.4067375, 0, 0, 0, 1, 1,
0.1610711, 0.1979477, -0.2067595, 0, 0, 0, 1, 1,
0.1618252, 1.308895, -1.246763, 0, 0, 0, 1, 1,
0.1630379, 0.08302335, 1.031182, 1, 1, 1, 1, 1,
0.1671852, -0.3998916, 3.046437, 1, 1, 1, 1, 1,
0.1689249, 0.9717652, 1.343213, 1, 1, 1, 1, 1,
0.1704888, 0.399271, 0.5670123, 1, 1, 1, 1, 1,
0.1713408, -0.8269548, 6.069489, 1, 1, 1, 1, 1,
0.172132, -0.2747363, 2.417565, 1, 1, 1, 1, 1,
0.1752712, -0.3562925, 3.49844, 1, 1, 1, 1, 1,
0.1782972, -1.132862, 1.699448, 1, 1, 1, 1, 1,
0.1844099, 0.009680187, 0.9354146, 1, 1, 1, 1, 1,
0.1860721, 1.012485, 0.07386154, 1, 1, 1, 1, 1,
0.1935539, -1.890311, 2.138122, 1, 1, 1, 1, 1,
0.1954906, -1.302168, 2.090526, 1, 1, 1, 1, 1,
0.1973049, -1.005679, 3.241717, 1, 1, 1, 1, 1,
0.2031375, -0.5673762, 1.915072, 1, 1, 1, 1, 1,
0.2031928, -0.5630481, 2.345337, 1, 1, 1, 1, 1,
0.2085438, 1.950401, 0.01294857, 0, 0, 1, 1, 1,
0.2100694, 0.07336204, 3.230264, 1, 0, 0, 1, 1,
0.210411, -0.5185654, 1.286235, 1, 0, 0, 1, 1,
0.2124546, 0.825708, -0.7449709, 1, 0, 0, 1, 1,
0.2132318, 0.05445101, 2.146591, 1, 0, 0, 1, 1,
0.2165835, 1.872892, -0.0183896, 1, 0, 0, 1, 1,
0.2165965, -1.227176, 2.055449, 0, 0, 0, 1, 1,
0.2169962, 0.7079751, 1.898143, 0, 0, 0, 1, 1,
0.2187187, 0.4141609, -0.1903377, 0, 0, 0, 1, 1,
0.2249162, 1.139799, 1.995106, 0, 0, 0, 1, 1,
0.2267404, 0.1979119, 0.7613069, 0, 0, 0, 1, 1,
0.2269594, 0.209197, 0.906632, 0, 0, 0, 1, 1,
0.2314062, 0.6222851, -1.59809, 0, 0, 0, 1, 1,
0.233037, -1.713021, 3.369881, 1, 1, 1, 1, 1,
0.2452837, 0.3767753, 0.312825, 1, 1, 1, 1, 1,
0.2454457, 0.4922188, 1.158203, 1, 1, 1, 1, 1,
0.2530745, 0.3936653, 0.374819, 1, 1, 1, 1, 1,
0.2534513, -0.6405565, 3.666551, 1, 1, 1, 1, 1,
0.2577489, 0.5406452, 0.6027271, 1, 1, 1, 1, 1,
0.2598859, 0.2926525, 0.7808334, 1, 1, 1, 1, 1,
0.2622487, -1.927301, 2.601216, 1, 1, 1, 1, 1,
0.2651375, -1.785052, 1.866441, 1, 1, 1, 1, 1,
0.266805, -0.3395278, 2.376674, 1, 1, 1, 1, 1,
0.2684066, -0.9174244, 3.909211, 1, 1, 1, 1, 1,
0.2761911, -0.004517999, 1.051265, 1, 1, 1, 1, 1,
0.2792055, -1.003669, 2.334367, 1, 1, 1, 1, 1,
0.2877522, 0.7303331, 1.081568, 1, 1, 1, 1, 1,
0.2932059, 2.785813, -0.5804387, 1, 1, 1, 1, 1,
0.2938004, 0.0002369641, -0.4293673, 0, 0, 1, 1, 1,
0.2940959, -0.7397771, 2.907229, 1, 0, 0, 1, 1,
0.2960754, -1.452649, 2.339911, 1, 0, 0, 1, 1,
0.2961273, -1.534623, 3.278694, 1, 0, 0, 1, 1,
0.3020546, 0.2450704, 1.611086, 1, 0, 0, 1, 1,
0.3030424, -0.2920017, 3.621139, 1, 0, 0, 1, 1,
0.3030482, -1.293596, 3.354736, 0, 0, 0, 1, 1,
0.3035673, -1.506017, 4.018862, 0, 0, 0, 1, 1,
0.3039899, 1.112612, 0.732768, 0, 0, 0, 1, 1,
0.3042052, -0.6882023, 2.50311, 0, 0, 0, 1, 1,
0.3046505, -0.2059861, 0.9646337, 0, 0, 0, 1, 1,
0.3048366, 2.520324, 0.1524218, 0, 0, 0, 1, 1,
0.3067892, 1.719583, 0.4293587, 0, 0, 0, 1, 1,
0.3098291, 0.389197, 1.258446, 1, 1, 1, 1, 1,
0.3150398, -0.213463, 1.672467, 1, 1, 1, 1, 1,
0.3159935, 2.420804, 0.7189593, 1, 1, 1, 1, 1,
0.3179245, -2.958301, 1.943841, 1, 1, 1, 1, 1,
0.3216396, -0.3538247, 2.245072, 1, 1, 1, 1, 1,
0.3285885, 0.2549613, 0.06052386, 1, 1, 1, 1, 1,
0.3289053, -2.086416, 3.461776, 1, 1, 1, 1, 1,
0.3298905, -0.5058679, 2.579187, 1, 1, 1, 1, 1,
0.3311809, 2.259044, 2.076348, 1, 1, 1, 1, 1,
0.3334584, -0.1287693, 1.242815, 1, 1, 1, 1, 1,
0.3337198, -0.2156507, 1.078366, 1, 1, 1, 1, 1,
0.3383259, -1.104751, 2.818203, 1, 1, 1, 1, 1,
0.3384912, 1.936745, -1.089902, 1, 1, 1, 1, 1,
0.3402524, -0.5028889, 1.241283, 1, 1, 1, 1, 1,
0.3434273, -1.276482, 3.316154, 1, 1, 1, 1, 1,
0.3473272, -0.5311852, 1.781766, 0, 0, 1, 1, 1,
0.3508785, 1.088804, 0.7579614, 1, 0, 0, 1, 1,
0.3515736, 2.140328, 1.634291, 1, 0, 0, 1, 1,
0.352114, -0.07629626, 0.3120442, 1, 0, 0, 1, 1,
0.3546222, -0.01978782, 1.637619, 1, 0, 0, 1, 1,
0.3592557, -1.072874, 2.72698, 1, 0, 0, 1, 1,
0.3639064, 0.9638273, -0.7998947, 0, 0, 0, 1, 1,
0.3639606, -0.403441, 5.131217, 0, 0, 0, 1, 1,
0.3697617, -0.9359446, 1.890403, 0, 0, 0, 1, 1,
0.3718408, -0.1231535, 0.2117084, 0, 0, 0, 1, 1,
0.3739929, 0.170543, 0.8089968, 0, 0, 0, 1, 1,
0.3791644, -1.208448, 2.970915, 0, 0, 0, 1, 1,
0.3821767, 0.6202372, 1.253462, 0, 0, 0, 1, 1,
0.3907526, 1.045186, 0.1578483, 1, 1, 1, 1, 1,
0.3976187, 0.9519239, 1.428431, 1, 1, 1, 1, 1,
0.3997928, 0.1981658, -0.2333564, 1, 1, 1, 1, 1,
0.4045371, -1.04526, 3.281457, 1, 1, 1, 1, 1,
0.4060937, -2.465003, 2.890526, 1, 1, 1, 1, 1,
0.4064858, -0.2194139, 1.175471, 1, 1, 1, 1, 1,
0.4077372, 1.148382, 0.2743969, 1, 1, 1, 1, 1,
0.4124275, -1.183709, 2.272729, 1, 1, 1, 1, 1,
0.4125307, -0.8676459, 0.3703463, 1, 1, 1, 1, 1,
0.4137022, -0.5994424, 2.011617, 1, 1, 1, 1, 1,
0.4157846, -0.9244887, 4.22581, 1, 1, 1, 1, 1,
0.4183195, -1.022927, 2.665921, 1, 1, 1, 1, 1,
0.4184038, 1.208175, 1.173195, 1, 1, 1, 1, 1,
0.4218159, -0.768437, 1.219334, 1, 1, 1, 1, 1,
0.4224896, 3.297739, 2.567345, 1, 1, 1, 1, 1,
0.4311007, 0.3045891, 2.581532, 0, 0, 1, 1, 1,
0.435688, -0.1861362, 0.8908981, 1, 0, 0, 1, 1,
0.4362126, -0.4201899, 1.328304, 1, 0, 0, 1, 1,
0.4465227, 0.1549695, 1.350941, 1, 0, 0, 1, 1,
0.4473314, -1.11458, 2.259495, 1, 0, 0, 1, 1,
0.4474506, 0.1513946, -0.7395626, 1, 0, 0, 1, 1,
0.4475279, 0.183531, 2.439717, 0, 0, 0, 1, 1,
0.4490109, -1.447174, 2.426744, 0, 0, 0, 1, 1,
0.4510182, 0.1306527, 0.8288543, 0, 0, 0, 1, 1,
0.4528024, 0.586294, 1.094778, 0, 0, 0, 1, 1,
0.4534473, -0.4840091, 3.424754, 0, 0, 0, 1, 1,
0.4538145, -1.716259, 4.340268, 0, 0, 0, 1, 1,
0.4584481, 0.7144736, -0.05842343, 0, 0, 0, 1, 1,
0.4591327, 0.4617065, -0.515994, 1, 1, 1, 1, 1,
0.4591741, -0.4754003, 2.324401, 1, 1, 1, 1, 1,
0.4600294, -1.55269, 2.347028, 1, 1, 1, 1, 1,
0.4649619, -0.4749694, 1.081971, 1, 1, 1, 1, 1,
0.4754758, -0.5428318, 2.540107, 1, 1, 1, 1, 1,
0.475677, 1.493652, 0.4791492, 1, 1, 1, 1, 1,
0.4767421, 1.018251, 1.266567, 1, 1, 1, 1, 1,
0.4777907, 0.4155977, 0.9506267, 1, 1, 1, 1, 1,
0.4802585, 1.016457, 0.1514384, 1, 1, 1, 1, 1,
0.4807853, 0.9263777, 1.027369, 1, 1, 1, 1, 1,
0.4851965, 0.8629332, 0.495422, 1, 1, 1, 1, 1,
0.4855219, 0.4416844, 0.595813, 1, 1, 1, 1, 1,
0.4969583, 0.02016025, 0.293341, 1, 1, 1, 1, 1,
0.4986083, -1.392986, 0.4899135, 1, 1, 1, 1, 1,
0.5049151, 0.01881909, 1.579101, 1, 1, 1, 1, 1,
0.5085033, 0.7403668, 0.5636483, 0, 0, 1, 1, 1,
0.5101113, -0.03208156, 0.970983, 1, 0, 0, 1, 1,
0.5120971, 1.592015, 0.4089135, 1, 0, 0, 1, 1,
0.5126413, 0.1857012, 2.131486, 1, 0, 0, 1, 1,
0.5193363, 0.03386369, 2.865077, 1, 0, 0, 1, 1,
0.5202941, 1.165393, -0.488803, 1, 0, 0, 1, 1,
0.5286124, -1.145641, 1.493719, 0, 0, 0, 1, 1,
0.5354034, 1.061806, -0.4609158, 0, 0, 0, 1, 1,
0.5359076, -0.209828, 2.645036, 0, 0, 0, 1, 1,
0.5404533, -0.5757065, 2.357438, 0, 0, 0, 1, 1,
0.5413138, -0.5157757, 0.8423858, 0, 0, 0, 1, 1,
0.542439, -0.3657486, 1.885118, 0, 0, 0, 1, 1,
0.5431273, 0.178779, -0.4853195, 0, 0, 0, 1, 1,
0.5456303, -0.01738453, 3.377387, 1, 1, 1, 1, 1,
0.546246, -0.3137075, 3.203709, 1, 1, 1, 1, 1,
0.5463954, -1.06328, 4.525381, 1, 1, 1, 1, 1,
0.5478536, -1.024133, 3.596589, 1, 1, 1, 1, 1,
0.5516714, -1.180724, 2.784282, 1, 1, 1, 1, 1,
0.5547328, -0.563458, 2.582388, 1, 1, 1, 1, 1,
0.5553285, 0.3832289, 1.449073, 1, 1, 1, 1, 1,
0.556082, -0.1874768, 2.738136, 1, 1, 1, 1, 1,
0.5563791, 0.8015095, 0.5185792, 1, 1, 1, 1, 1,
0.5597184, -0.9558163, 2.316965, 1, 1, 1, 1, 1,
0.559823, -0.5405826, 2.812726, 1, 1, 1, 1, 1,
0.560905, 0.3735387, 1.29498, 1, 1, 1, 1, 1,
0.5623422, -1.029793, 3.114677, 1, 1, 1, 1, 1,
0.5670735, -0.1610251, 5.023461, 1, 1, 1, 1, 1,
0.5692361, 0.2731508, 0.8180144, 1, 1, 1, 1, 1,
0.5777677, -0.421669, 2.39956, 0, 0, 1, 1, 1,
0.5798638, -0.06379747, 1.584046, 1, 0, 0, 1, 1,
0.5910766, -0.9452548, 2.302772, 1, 0, 0, 1, 1,
0.5925116, 0.2472305, 0.3801191, 1, 0, 0, 1, 1,
0.5949701, 0.1611819, 0.08978883, 1, 0, 0, 1, 1,
0.6043022, 1.061896, -0.2051158, 1, 0, 0, 1, 1,
0.6083476, -0.3730753, 3.179999, 0, 0, 0, 1, 1,
0.609136, -0.3036176, 1.150478, 0, 0, 0, 1, 1,
0.6093652, -0.9897917, 2.863623, 0, 0, 0, 1, 1,
0.6146129, 0.6853002, 1.740534, 0, 0, 0, 1, 1,
0.6152485, 0.6224455, -0.005231382, 0, 0, 0, 1, 1,
0.6168837, 1.392483, -0.3221031, 0, 0, 0, 1, 1,
0.6171127, 0.8546962, -0.5965505, 0, 0, 0, 1, 1,
0.6182643, -1.444059, 3.490519, 1, 1, 1, 1, 1,
0.6202322, 0.08763318, 2.499871, 1, 1, 1, 1, 1,
0.6212837, 1.464153, 0.7894368, 1, 1, 1, 1, 1,
0.6244978, 0.7657476, 0.3984952, 1, 1, 1, 1, 1,
0.6247494, 0.5973095, 1.774728, 1, 1, 1, 1, 1,
0.6350746, -0.6201546, 3.161167, 1, 1, 1, 1, 1,
0.637614, 0.2369809, 0.4689025, 1, 1, 1, 1, 1,
0.6389696, -1.178948, 2.036516, 1, 1, 1, 1, 1,
0.6391633, 2.158935, 0.1775242, 1, 1, 1, 1, 1,
0.6467479, 0.1420723, 2.091928, 1, 1, 1, 1, 1,
0.6508552, -1.297661, 2.033392, 1, 1, 1, 1, 1,
0.652155, -0.1484978, 2.807207, 1, 1, 1, 1, 1,
0.6527956, -0.9070567, 2.544923, 1, 1, 1, 1, 1,
0.6555851, 0.298653, 1.429687, 1, 1, 1, 1, 1,
0.656523, 2.052485, 1.524, 1, 1, 1, 1, 1,
0.6616568, 0.5480723, 0.4293762, 0, 0, 1, 1, 1,
0.6653022, 2.355047, 0.9504897, 1, 0, 0, 1, 1,
0.6793147, -0.2907111, 0.2664234, 1, 0, 0, 1, 1,
0.6819021, -1.274237, 3.706923, 1, 0, 0, 1, 1,
0.6839002, -0.8174189, 3.226927, 1, 0, 0, 1, 1,
0.6880119, 1.27672, -1.326669, 1, 0, 0, 1, 1,
0.7000673, -1.849552, 1.47268, 0, 0, 0, 1, 1,
0.7037078, -0.9709332, 0.2779059, 0, 0, 0, 1, 1,
0.7037151, -1.55318, 3.902723, 0, 0, 0, 1, 1,
0.7057069, -1.943545, 2.571331, 0, 0, 0, 1, 1,
0.7075682, 0.1613669, 0.655013, 0, 0, 0, 1, 1,
0.707822, 0.8644568, 1.752718, 0, 0, 0, 1, 1,
0.7089881, -1.142053, 3.051096, 0, 0, 0, 1, 1,
0.7105746, -0.5711231, 1.951327, 1, 1, 1, 1, 1,
0.7114609, -0.7956595, 2.443959, 1, 1, 1, 1, 1,
0.713629, -0.6149527, 2.740658, 1, 1, 1, 1, 1,
0.7155215, -0.3198189, 1.875335, 1, 1, 1, 1, 1,
0.7174441, -1.077799, 2.583627, 1, 1, 1, 1, 1,
0.7190672, -0.7762697, 2.140472, 1, 1, 1, 1, 1,
0.7204034, -1.56738, 2.389758, 1, 1, 1, 1, 1,
0.7205909, -0.5506827, 1.766778, 1, 1, 1, 1, 1,
0.722108, 0.8085747, -0.06252955, 1, 1, 1, 1, 1,
0.7230633, -0.5443353, 1.436549, 1, 1, 1, 1, 1,
0.7255031, 0.9799112, 0.5447065, 1, 1, 1, 1, 1,
0.7263165, -0.387163, 1.7801, 1, 1, 1, 1, 1,
0.7280234, -1.02874, -0.1221108, 1, 1, 1, 1, 1,
0.7340529, 0.03745664, 0.5018573, 1, 1, 1, 1, 1,
0.7458111, 1.652066, 0.6190703, 1, 1, 1, 1, 1,
0.7471339, 0.910524, 0.7712291, 0, 0, 1, 1, 1,
0.7498294, 0.3876713, -0.2368261, 1, 0, 0, 1, 1,
0.7513986, 1.941383, 0.699666, 1, 0, 0, 1, 1,
0.7573265, -0.4102377, 1.105951, 1, 0, 0, 1, 1,
0.7596707, -0.07756422, 1.546196, 1, 0, 0, 1, 1,
0.7614714, -1.261269, 1.442463, 1, 0, 0, 1, 1,
0.7621967, -0.8744994, 2.07527, 0, 0, 0, 1, 1,
0.7630787, 0.9660058, 1.177537, 0, 0, 0, 1, 1,
0.7639116, 1.070249, 0.8592756, 0, 0, 0, 1, 1,
0.7653891, 1.17659, 0.6692749, 0, 0, 0, 1, 1,
0.7779784, -0.3820867, 1.832981, 0, 0, 0, 1, 1,
0.7812506, 0.4345328, 1.867349, 0, 0, 0, 1, 1,
0.7852933, -1.283966, 3.381408, 0, 0, 0, 1, 1,
0.7959391, 1.60265, -0.3427553, 1, 1, 1, 1, 1,
0.806441, -0.9536308, 3.428318, 1, 1, 1, 1, 1,
0.8107192, 0.8723928, 1.002454, 1, 1, 1, 1, 1,
0.8175291, 0.9745621, 0.6921495, 1, 1, 1, 1, 1,
0.8254117, 1.458831, -0.1272659, 1, 1, 1, 1, 1,
0.8266497, -0.06292785, 0.9121812, 1, 1, 1, 1, 1,
0.8292541, -0.9574983, 3.661663, 1, 1, 1, 1, 1,
0.8293608, 0.3635678, 0.4850784, 1, 1, 1, 1, 1,
0.8312632, -0.1031389, 1.23502, 1, 1, 1, 1, 1,
0.8341363, 0.9026645, 1.702518, 1, 1, 1, 1, 1,
0.8391829, 0.8400462, 1.824638, 1, 1, 1, 1, 1,
0.8394669, 0.8825741, 0.1657159, 1, 1, 1, 1, 1,
0.8437689, -0.3469908, 3.584486, 1, 1, 1, 1, 1,
0.84497, -0.03312359, 2.029021, 1, 1, 1, 1, 1,
0.8496425, 1.759123, -1.18802, 1, 1, 1, 1, 1,
0.853762, 0.5900014, 0.7712915, 0, 0, 1, 1, 1,
0.8609945, 0.386658, -0.9007239, 1, 0, 0, 1, 1,
0.8630153, -0.3593695, 2.864172, 1, 0, 0, 1, 1,
0.8656858, -1.211921, 3.205345, 1, 0, 0, 1, 1,
0.8686185, 0.2140847, 1.070721, 1, 0, 0, 1, 1,
0.8722191, -0.5506667, 0.4995499, 1, 0, 0, 1, 1,
0.8787249, -0.355397, 2.700017, 0, 0, 0, 1, 1,
0.8830982, 0.5150154, -0.427425, 0, 0, 0, 1, 1,
0.8884794, 0.2173913, -1.581665, 0, 0, 0, 1, 1,
0.8885584, -0.7452019, 1.217131, 0, 0, 0, 1, 1,
0.8930628, 2.352441, 0.962571, 0, 0, 0, 1, 1,
0.8940722, 0.6420569, 2.471541, 0, 0, 0, 1, 1,
0.9000072, -0.4616339, 2.019127, 0, 0, 0, 1, 1,
0.9002125, -0.3397313, 2.043181, 1, 1, 1, 1, 1,
0.9121367, 0.05586298, 1.182194, 1, 1, 1, 1, 1,
0.9134328, 0.7016246, 1.558147, 1, 1, 1, 1, 1,
0.9143251, -0.69888, 1.24779, 1, 1, 1, 1, 1,
0.9192043, -1.632111, 4.842428, 1, 1, 1, 1, 1,
0.9274836, -1.421421, 2.398207, 1, 1, 1, 1, 1,
0.9351559, -0.2038984, 1.154091, 1, 1, 1, 1, 1,
0.9355519, 0.7434003, 4.110523, 1, 1, 1, 1, 1,
0.944916, -0.06898385, 1.250457, 1, 1, 1, 1, 1,
0.9455752, 0.2786053, -0.09165272, 1, 1, 1, 1, 1,
0.9611012, -0.2940897, 3.3584, 1, 1, 1, 1, 1,
0.9636318, -0.09268268, 1.269551, 1, 1, 1, 1, 1,
0.9676992, 1.493406, 0.7240944, 1, 1, 1, 1, 1,
0.970575, -0.2720557, 2.567702, 1, 1, 1, 1, 1,
0.9713158, 0.2190054, -0.6811779, 1, 1, 1, 1, 1,
0.9830941, 0.7563489, -0.04801963, 0, 0, 1, 1, 1,
0.9888851, -0.7565922, 0.513714, 1, 0, 0, 1, 1,
1.002893, -0.3415857, 2.578076, 1, 0, 0, 1, 1,
1.00473, 0.4500157, -1.211382, 1, 0, 0, 1, 1,
1.010347, 0.5230196, 3.16142, 1, 0, 0, 1, 1,
1.015824, 0.333565, 2.739744, 1, 0, 0, 1, 1,
1.017466, -0.3112055, 2.173824, 0, 0, 0, 1, 1,
1.021652, 0.09448088, 3.574434, 0, 0, 0, 1, 1,
1.02339, 0.4575544, 1.471351, 0, 0, 0, 1, 1,
1.023714, 0.9129888, 1.8355, 0, 0, 0, 1, 1,
1.028456, 1.036273, 1.242242, 0, 0, 0, 1, 1,
1.028853, 1.227505, 2.540848, 0, 0, 0, 1, 1,
1.038693, -0.4415622, 2.110137, 0, 0, 0, 1, 1,
1.048229, 1.680819, 0.4649286, 1, 1, 1, 1, 1,
1.055751, 1.085775, 0.327802, 1, 1, 1, 1, 1,
1.063275, 0.03444644, 2.726581, 1, 1, 1, 1, 1,
1.071486, 0.8408761, 2.582177, 1, 1, 1, 1, 1,
1.071871, 0.1746851, 2.654571, 1, 1, 1, 1, 1,
1.073656, -0.03759746, 2.251019, 1, 1, 1, 1, 1,
1.07784, 1.18405, 1.708055, 1, 1, 1, 1, 1,
1.080119, -1.564944, 4.140983, 1, 1, 1, 1, 1,
1.083156, -1.237176, 2.623595, 1, 1, 1, 1, 1,
1.08456, -1.054607, 2.452722, 1, 1, 1, 1, 1,
1.090152, -0.2160225, 1.660987, 1, 1, 1, 1, 1,
1.091334, 1.662024, 1.397743, 1, 1, 1, 1, 1,
1.092199, -0.9871922, 3.568727, 1, 1, 1, 1, 1,
1.096306, 0.7758574, 1.491621, 1, 1, 1, 1, 1,
1.099269, -0.6748453, 3.299535, 1, 1, 1, 1, 1,
1.101695, -0.242845, 2.154397, 0, 0, 1, 1, 1,
1.103933, -0.5483836, 2.342903, 1, 0, 0, 1, 1,
1.111638, -0.3248323, 2.350286, 1, 0, 0, 1, 1,
1.113274, -0.7161344, 2.156593, 1, 0, 0, 1, 1,
1.114745, 0.3035116, 0.116315, 1, 0, 0, 1, 1,
1.115882, -0.4258912, 2.500393, 1, 0, 0, 1, 1,
1.120484, 0.1341401, 3.735972, 0, 0, 0, 1, 1,
1.131076, 1.502178, 2.668008, 0, 0, 0, 1, 1,
1.131148, -0.5954649, 3.948361, 0, 0, 0, 1, 1,
1.145246, -0.182369, 0.2354673, 0, 0, 0, 1, 1,
1.145835, 0.7031862, 0.6724711, 0, 0, 0, 1, 1,
1.16382, -0.09528378, 2.559072, 0, 0, 0, 1, 1,
1.171142, -0.4734972, 2.415937, 0, 0, 0, 1, 1,
1.177005, 0.4174811, -0.4605799, 1, 1, 1, 1, 1,
1.177365, -0.3526197, 3.160129, 1, 1, 1, 1, 1,
1.179936, 1.567844, 1.436439, 1, 1, 1, 1, 1,
1.180345, -1.497288, 3.200132, 1, 1, 1, 1, 1,
1.181137, -0.1590055, 1.24109, 1, 1, 1, 1, 1,
1.184232, 0.7900058, 1.90045, 1, 1, 1, 1, 1,
1.196612, -1.349886, 3.634098, 1, 1, 1, 1, 1,
1.204293, -1.141314, 2.371025, 1, 1, 1, 1, 1,
1.204471, -2.679671, 2.449263, 1, 1, 1, 1, 1,
1.210422, -0.654698, 2.471313, 1, 1, 1, 1, 1,
1.216466, 2.018472, 1.712865, 1, 1, 1, 1, 1,
1.21986, -0.1410968, 1.244343, 1, 1, 1, 1, 1,
1.223893, 1.171754, 0.3878417, 1, 1, 1, 1, 1,
1.226931, 2.075522, 2.020119, 1, 1, 1, 1, 1,
1.233383, 0.7312525, 1.806704, 1, 1, 1, 1, 1,
1.235469, 0.2023287, 0.701588, 0, 0, 1, 1, 1,
1.235495, 0.05281347, 2.423804, 1, 0, 0, 1, 1,
1.262793, 2.675658, -0.8724936, 1, 0, 0, 1, 1,
1.263305, 1.648751, -1.148092, 1, 0, 0, 1, 1,
1.263438, 0.3424192, -0.521262, 1, 0, 0, 1, 1,
1.275517, 0.7697557, 0.4073292, 1, 0, 0, 1, 1,
1.283554, -0.09906639, 1.22252, 0, 0, 0, 1, 1,
1.299918, 0.05691424, 1.963026, 0, 0, 0, 1, 1,
1.301534, 1.00831, 0.6051101, 0, 0, 0, 1, 1,
1.315455, -0.9968289, 2.090827, 0, 0, 0, 1, 1,
1.332157, 1.814051, 0.8893377, 0, 0, 0, 1, 1,
1.333012, -1.193172, 1.319413, 0, 0, 0, 1, 1,
1.333732, -3.006546, 2.534677, 0, 0, 0, 1, 1,
1.336779, -0.2044368, 2.328704, 1, 1, 1, 1, 1,
1.341878, -1.691016, 3.040184, 1, 1, 1, 1, 1,
1.349301, 2.025854, -0.961108, 1, 1, 1, 1, 1,
1.362862, -0.9826702, 1.461377, 1, 1, 1, 1, 1,
1.369177, -0.6085417, 3.73267, 1, 1, 1, 1, 1,
1.371064, 0.5758774, 2.002624, 1, 1, 1, 1, 1,
1.376808, -0.06805078, 2.062644, 1, 1, 1, 1, 1,
1.384092, 0.8209925, -2.358475, 1, 1, 1, 1, 1,
1.389919, -0.6857364, 1.229876, 1, 1, 1, 1, 1,
1.402638, 0.3354577, 1.70758, 1, 1, 1, 1, 1,
1.405468, 1.930087, 0.9493779, 1, 1, 1, 1, 1,
1.431795, 0.9389468, 2.217448, 1, 1, 1, 1, 1,
1.433979, -0.217714, 1.297931, 1, 1, 1, 1, 1,
1.434697, -0.1615663, 1.178627, 1, 1, 1, 1, 1,
1.462296, 0.8318388, 2.806143, 1, 1, 1, 1, 1,
1.466838, 2.364661, 1.393291, 0, 0, 1, 1, 1,
1.467002, -1.204337, 1.914412, 1, 0, 0, 1, 1,
1.468077, 0.4042493, 2.771104, 1, 0, 0, 1, 1,
1.473015, 2.085639, -0.2497104, 1, 0, 0, 1, 1,
1.478642, 1.661023, 1.106997, 1, 0, 0, 1, 1,
1.498386, 0.7041234, 1.838243, 1, 0, 0, 1, 1,
1.518892, 0.595495, 1.799993, 0, 0, 0, 1, 1,
1.529835, 1.483508, 2.290592, 0, 0, 0, 1, 1,
1.538164, 1.706688, 0.04404613, 0, 0, 0, 1, 1,
1.539507, 0.9594305, 0.1723741, 0, 0, 0, 1, 1,
1.547745, 0.5469913, 1.760455, 0, 0, 0, 1, 1,
1.565099, 0.2684993, 2.388902, 0, 0, 0, 1, 1,
1.565856, 1.187782, 1.836228, 0, 0, 0, 1, 1,
1.571528, 2.122158, 0.5710105, 1, 1, 1, 1, 1,
1.571801, 0.05981509, 0.08096096, 1, 1, 1, 1, 1,
1.582455, 1.842404, 0.5160719, 1, 1, 1, 1, 1,
1.583659, -0.4674838, 1.828345, 1, 1, 1, 1, 1,
1.60323, -0.5971603, 2.768623, 1, 1, 1, 1, 1,
1.603634, 0.2505237, 1.40313, 1, 1, 1, 1, 1,
1.610333, -2.880348, 3.452413, 1, 1, 1, 1, 1,
1.619014, 0.07078066, 0.5411617, 1, 1, 1, 1, 1,
1.619192, -1.720694, 2.135782, 1, 1, 1, 1, 1,
1.620494, -1.079825, 1.747071, 1, 1, 1, 1, 1,
1.648321, 0.1317276, 1.742928, 1, 1, 1, 1, 1,
1.671553, 1.339589, -0.2517622, 1, 1, 1, 1, 1,
1.676651, -0.0578815, 3.103233, 1, 1, 1, 1, 1,
1.680236, -0.7360412, 3.830767, 1, 1, 1, 1, 1,
1.687552, -1.243144, 3.285608, 1, 1, 1, 1, 1,
1.695008, 0.06398607, 2.147043, 0, 0, 1, 1, 1,
1.695621, 0.2475101, 2.96858, 1, 0, 0, 1, 1,
1.714948, -1.654079, 0.8124396, 1, 0, 0, 1, 1,
1.718326, 1.4321, 1.283558, 1, 0, 0, 1, 1,
1.724726, 0.5377418, 1.898082, 1, 0, 0, 1, 1,
1.746964, -0.1219291, 2.054024, 1, 0, 0, 1, 1,
1.750945, -0.7107367, 3.230603, 0, 0, 0, 1, 1,
1.755201, 1.427932, 2.176808, 0, 0, 0, 1, 1,
1.764385, -0.6662076, 0.8697866, 0, 0, 0, 1, 1,
1.779201, 0.2714285, 2.0125, 0, 0, 0, 1, 1,
1.782285, -0.06267709, 2.181842, 0, 0, 0, 1, 1,
1.783996, 1.147196, -0.3680872, 0, 0, 0, 1, 1,
1.793862, 0.3476976, 1.890493, 0, 0, 0, 1, 1,
1.800403, 0.5481289, 2.240959, 1, 1, 1, 1, 1,
1.811635, -0.01224845, 2.216448, 1, 1, 1, 1, 1,
1.819198, 0.1611276, 3.214885, 1, 1, 1, 1, 1,
1.83793, -0.2918814, 2.991183, 1, 1, 1, 1, 1,
1.841394, -0.6866952, 2.656147, 1, 1, 1, 1, 1,
1.851491, 1.106399, 1.002686, 1, 1, 1, 1, 1,
1.853551, -0.05500359, 2.374226, 1, 1, 1, 1, 1,
1.863708, -0.1645605, 2.469373, 1, 1, 1, 1, 1,
1.865358, -1.088806, 1.484151, 1, 1, 1, 1, 1,
1.90125, -0.1454654, 1.613686, 1, 1, 1, 1, 1,
1.916457, 0.3434503, 3.832399, 1, 1, 1, 1, 1,
1.92754, -0.09213444, 2.965667, 1, 1, 1, 1, 1,
1.938957, -1.294854, 2.269873, 1, 1, 1, 1, 1,
1.941507, -1.586492, 2.322074, 1, 1, 1, 1, 1,
1.997206, 1.167537, 1.305693, 1, 1, 1, 1, 1,
2.041054, 0.02394342, 0.8803889, 0, 0, 1, 1, 1,
2.05304, 1.777967, 2.75456, 1, 0, 0, 1, 1,
2.056558, 0.3551568, 1.081204, 1, 0, 0, 1, 1,
2.092726, -0.6343256, 2.546895, 1, 0, 0, 1, 1,
2.113734, -1.15681, 2.80793, 1, 0, 0, 1, 1,
2.124324, 2.264282, 0.3899657, 1, 0, 0, 1, 1,
2.144557, 0.4505827, 0.2882546, 0, 0, 0, 1, 1,
2.17643, -2.527719, 3.013741, 0, 0, 0, 1, 1,
2.22938, 0.9574007, 2.560324, 0, 0, 0, 1, 1,
2.230276, 0.6879359, 1.093705, 0, 0, 0, 1, 1,
2.29144, -0.6504288, 1.19051, 0, 0, 0, 1, 1,
2.301697, -1.336126, 2.898428, 0, 0, 0, 1, 1,
2.319331, -0.0865023, 1.277426, 0, 0, 0, 1, 1,
2.324504, -0.5206177, 3.73311, 1, 1, 1, 1, 1,
2.4222, 1.588934, -0.09220883, 1, 1, 1, 1, 1,
2.434399, 1.176733, 1.086192, 1, 1, 1, 1, 1,
2.558062, 0.6420743, 0.02316308, 1, 1, 1, 1, 1,
2.804063, -0.2597403, 0.5969595, 1, 1, 1, 1, 1,
2.838291, -0.1392359, 1.608615, 1, 1, 1, 1, 1,
3.862216, 1.010553, 2.174727, 1, 1, 1, 1, 1
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
var radius = 9.906988;
var distance = 34.79787;
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
mvMatrix.translate( -0.6361976, -0.3361053, -0.5029151 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79787);
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
