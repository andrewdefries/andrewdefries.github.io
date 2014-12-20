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
-3.056696, 0.4087795, -1.314246, 1, 0, 0, 1,
-2.732348, 1.184356, -3.91263, 1, 0.007843138, 0, 1,
-2.698936, 0.05481359, 1.213585, 1, 0.01176471, 0, 1,
-2.569503, -0.7116646, -0.8423652, 1, 0.01960784, 0, 1,
-2.463965, -1.74023, -3.187422, 1, 0.02352941, 0, 1,
-2.46159, 1.047292, -2.795515, 1, 0.03137255, 0, 1,
-2.449996, 0.4344091, -1.920399, 1, 0.03529412, 0, 1,
-2.317174, 1.699539, -1.966472, 1, 0.04313726, 0, 1,
-2.316576, 1.072775, -2.207675, 1, 0.04705882, 0, 1,
-2.294794, -0.481859, -1.199012, 1, 0.05490196, 0, 1,
-2.200349, 0.5868547, 0.01975663, 1, 0.05882353, 0, 1,
-2.188039, -0.6289701, -2.143302, 1, 0.06666667, 0, 1,
-2.154944, 0.6503865, -1.478949, 1, 0.07058824, 0, 1,
-2.147409, -1.335887, -0.8761814, 1, 0.07843138, 0, 1,
-2.135835, -2.125185, -3.207865, 1, 0.08235294, 0, 1,
-2.127863, -0.4298516, -2.199173, 1, 0.09019608, 0, 1,
-2.098432, 0.205196, -0.5483979, 1, 0.09411765, 0, 1,
-2.097652, 2.736703, 0.823274, 1, 0.1019608, 0, 1,
-2.076431, 0.8120419, -2.36281, 1, 0.1098039, 0, 1,
-2.065902, -0.6931061, -3.349311, 1, 0.1137255, 0, 1,
-2.062687, -1.280772, -1.950735, 1, 0.1215686, 0, 1,
-2.054631, 0.04116514, -0.4135137, 1, 0.1254902, 0, 1,
-2.034114, -0.07022737, -2.46825, 1, 0.1333333, 0, 1,
-1.985127, 1.055584, -1.98934, 1, 0.1372549, 0, 1,
-1.984012, -1.314642, -0.3184913, 1, 0.145098, 0, 1,
-1.97069, -1.677786, -1.573864, 1, 0.1490196, 0, 1,
-1.949521, -0.3176305, -1.790321, 1, 0.1568628, 0, 1,
-1.941228, 0.1529902, -2.027057, 1, 0.1607843, 0, 1,
-1.887658, -0.07984932, -2.031526, 1, 0.1686275, 0, 1,
-1.869575, 0.451235, -0.2688856, 1, 0.172549, 0, 1,
-1.863727, 1.026521, -1.367144, 1, 0.1803922, 0, 1,
-1.85291, 1.146775, -1.053404, 1, 0.1843137, 0, 1,
-1.836588, -1.816831, -1.332738, 1, 0.1921569, 0, 1,
-1.808084, -1.040867, -1.586372, 1, 0.1960784, 0, 1,
-1.787656, -0.07529651, -0.4376355, 1, 0.2039216, 0, 1,
-1.787386, 1.506996, -0.3705396, 1, 0.2117647, 0, 1,
-1.759564, -0.6978874, 0.03586097, 1, 0.2156863, 0, 1,
-1.758459, -0.6491997, -3.074244, 1, 0.2235294, 0, 1,
-1.752866, 1.529741, 0.610682, 1, 0.227451, 0, 1,
-1.7487, 0.1558064, -1.209005, 1, 0.2352941, 0, 1,
-1.718095, 0.1476385, -2.106431, 1, 0.2392157, 0, 1,
-1.7043, 1.615949, 0.02216489, 1, 0.2470588, 0, 1,
-1.700994, -0.5510439, -0.8507277, 1, 0.2509804, 0, 1,
-1.699974, -0.1871165, -0.4477238, 1, 0.2588235, 0, 1,
-1.68939, 0.1216827, -1.114084, 1, 0.2627451, 0, 1,
-1.68326, -1.736671, -0.8684034, 1, 0.2705882, 0, 1,
-1.668898, -0.302889, -1.423076, 1, 0.2745098, 0, 1,
-1.668017, 0.4701779, -1.196779, 1, 0.282353, 0, 1,
-1.662578, 2.371651, -0.9786916, 1, 0.2862745, 0, 1,
-1.661968, 1.437063, -0.8915073, 1, 0.2941177, 0, 1,
-1.655864, -0.6628156, -3.031426, 1, 0.3019608, 0, 1,
-1.651636, -0.7026583, -2.812324, 1, 0.3058824, 0, 1,
-1.651414, -2.131891, -3.138643, 1, 0.3137255, 0, 1,
-1.643564, -1.269211, -2.661782, 1, 0.3176471, 0, 1,
-1.627153, 0.1718842, -0.1968751, 1, 0.3254902, 0, 1,
-1.588916, -0.06668089, -1.183765, 1, 0.3294118, 0, 1,
-1.569759, 0.3916661, 0.3971278, 1, 0.3372549, 0, 1,
-1.542637, 0.7461234, -1.515251, 1, 0.3411765, 0, 1,
-1.521882, -1.938582, -0.5162714, 1, 0.3490196, 0, 1,
-1.514318, -1.835111, -2.382387, 1, 0.3529412, 0, 1,
-1.508285, 0.4652986, -0.4231173, 1, 0.3607843, 0, 1,
-1.506896, -1.09183, -2.232434, 1, 0.3647059, 0, 1,
-1.502699, 0.8079534, -1.593331, 1, 0.372549, 0, 1,
-1.502417, -1.452953, -3.528473, 1, 0.3764706, 0, 1,
-1.499572, 0.9543936, -1.989312, 1, 0.3843137, 0, 1,
-1.494252, 2.181555, -1.164786, 1, 0.3882353, 0, 1,
-1.490149, 0.8403406, -0.9576028, 1, 0.3960784, 0, 1,
-1.490042, -3.35181, -0.6565353, 1, 0.4039216, 0, 1,
-1.457468, -1.512312, -2.981282, 1, 0.4078431, 0, 1,
-1.453391, 0.9400583, -2.23554, 1, 0.4156863, 0, 1,
-1.450165, 0.101602, -2.66835, 1, 0.4196078, 0, 1,
-1.425186, -0.9336447, -2.126395, 1, 0.427451, 0, 1,
-1.42002, 1.032552, 1.170085, 1, 0.4313726, 0, 1,
-1.410391, -0.3907447, -1.618669, 1, 0.4392157, 0, 1,
-1.405509, 1.217976, -0.2337317, 1, 0.4431373, 0, 1,
-1.389946, 1.593136, -0.6018199, 1, 0.4509804, 0, 1,
-1.389224, -0.5122896, -2.008193, 1, 0.454902, 0, 1,
-1.384103, 0.5487272, -0.3047446, 1, 0.4627451, 0, 1,
-1.375731, 1.217985, -1.264132, 1, 0.4666667, 0, 1,
-1.366803, 0.7155147, -0.7761863, 1, 0.4745098, 0, 1,
-1.366156, -0.5205123, -1.567861, 1, 0.4784314, 0, 1,
-1.364328, -1.244992, -1.537559, 1, 0.4862745, 0, 1,
-1.356646, -0.3328766, -0.9845872, 1, 0.4901961, 0, 1,
-1.355384, 1.324694, -1.719711, 1, 0.4980392, 0, 1,
-1.34533, 0.6591077, -1.950602, 1, 0.5058824, 0, 1,
-1.340262, 2.210602, -1.196869, 1, 0.509804, 0, 1,
-1.338125, -0.5843211, -2.776789, 1, 0.5176471, 0, 1,
-1.320579, -2.033983, -1.330367, 1, 0.5215687, 0, 1,
-1.316916, -0.1620154, -3.480243, 1, 0.5294118, 0, 1,
-1.314001, -0.8930129, -3.8028, 1, 0.5333334, 0, 1,
-1.311966, 0.05532707, -2.028011, 1, 0.5411765, 0, 1,
-1.309149, -1.160215, -4.631227, 1, 0.5450981, 0, 1,
-1.303854, -0.1840976, -0.7616533, 1, 0.5529412, 0, 1,
-1.303691, -0.2914337, 0.07789368, 1, 0.5568628, 0, 1,
-1.301567, 1.398919, -0.6148383, 1, 0.5647059, 0, 1,
-1.300401, -0.6089664, -1.737659, 1, 0.5686275, 0, 1,
-1.295604, -0.2320797, -2.350182, 1, 0.5764706, 0, 1,
-1.294134, 0.9748095, -1.179943, 1, 0.5803922, 0, 1,
-1.293118, 0.4583242, -1.922943, 1, 0.5882353, 0, 1,
-1.293115, -1.055099, -2.165749, 1, 0.5921569, 0, 1,
-1.281914, 1.177416, -1.958614, 1, 0.6, 0, 1,
-1.278937, 0.4051405, -1.698083, 1, 0.6078432, 0, 1,
-1.267249, -0.2508717, -1.517917, 1, 0.6117647, 0, 1,
-1.263607, 0.60767, -1.036229, 1, 0.6196079, 0, 1,
-1.256327, 1.354877, -0.2426814, 1, 0.6235294, 0, 1,
-1.254402, 0.07253643, -1.497789, 1, 0.6313726, 0, 1,
-1.242045, -0.2911564, -0.7499089, 1, 0.6352941, 0, 1,
-1.225325, -0.4030683, -2.916215, 1, 0.6431373, 0, 1,
-1.215011, 0.4600416, -1.899731, 1, 0.6470588, 0, 1,
-1.21455, 0.9255064, -0.03128795, 1, 0.654902, 0, 1,
-1.206085, -1.163635, -2.675536, 1, 0.6588235, 0, 1,
-1.205165, 0.1019556, -3.483243, 1, 0.6666667, 0, 1,
-1.199752, 0.6152287, -2.220781, 1, 0.6705883, 0, 1,
-1.1968, 1.190163, 1.153069, 1, 0.6784314, 0, 1,
-1.193928, 0.1410133, -1.694356, 1, 0.682353, 0, 1,
-1.191101, -0.9014346, -1.964455, 1, 0.6901961, 0, 1,
-1.187665, 0.8549228, -1.434155, 1, 0.6941177, 0, 1,
-1.186712, -0.5163495, -2.542912, 1, 0.7019608, 0, 1,
-1.178523, 0.4790465, -1.302914, 1, 0.7098039, 0, 1,
-1.178232, -0.471179, -1.008432, 1, 0.7137255, 0, 1,
-1.175717, -1.299789, -2.58182, 1, 0.7215686, 0, 1,
-1.171994, 0.7027271, -2.085978, 1, 0.7254902, 0, 1,
-1.162574, -0.1161165, -1.354157, 1, 0.7333333, 0, 1,
-1.158032, -0.4351456, -1.75929, 1, 0.7372549, 0, 1,
-1.155621, 0.3503249, -2.269725, 1, 0.7450981, 0, 1,
-1.1459, -0.1133942, -1.887869, 1, 0.7490196, 0, 1,
-1.144169, 1.37315, -1.067033, 1, 0.7568628, 0, 1,
-1.134053, -0.3335722, -3.23314, 1, 0.7607843, 0, 1,
-1.131058, -1.177437, -2.529402, 1, 0.7686275, 0, 1,
-1.126605, 1.788719, -2.454468, 1, 0.772549, 0, 1,
-1.123043, 0.5444544, -0.5242567, 1, 0.7803922, 0, 1,
-1.119797, -1.163075, -3.502908, 1, 0.7843137, 0, 1,
-1.111371, -0.04233479, -0.8091299, 1, 0.7921569, 0, 1,
-1.110403, -0.2388009, -1.689008, 1, 0.7960784, 0, 1,
-1.10993, -0.9923533, -1.562392, 1, 0.8039216, 0, 1,
-1.099223, 0.8695687, -2.956852, 1, 0.8117647, 0, 1,
-1.098852, -2.045595, -2.733688, 1, 0.8156863, 0, 1,
-1.098431, 1.95529, -1.398974, 1, 0.8235294, 0, 1,
-1.097528, -0.8607684, -0.9040018, 1, 0.827451, 0, 1,
-1.091287, -1.252652, -2.865222, 1, 0.8352941, 0, 1,
-1.090143, 0.5262956, 0.2616672, 1, 0.8392157, 0, 1,
-1.077223, -0.3320691, -1.617273, 1, 0.8470588, 0, 1,
-1.077052, -0.03299562, -3.320348, 1, 0.8509804, 0, 1,
-1.076313, -0.4852271, -2.160545, 1, 0.8588235, 0, 1,
-1.066309, 1.250435, -0.6738291, 1, 0.8627451, 0, 1,
-1.064559, -0.3455952, -2.243817, 1, 0.8705882, 0, 1,
-1.056073, 1.469781, -0.3584056, 1, 0.8745098, 0, 1,
-1.045529, -1.062627, -2.170815, 1, 0.8823529, 0, 1,
-1.039608, 0.4239205, -2.47745, 1, 0.8862745, 0, 1,
-1.037976, -0.2548974, -1.301518, 1, 0.8941177, 0, 1,
-1.03746, -1.014038, -0.5580806, 1, 0.8980392, 0, 1,
-1.032683, 0.02935572, -1.495582, 1, 0.9058824, 0, 1,
-1.009587, -1.264482, -2.894202, 1, 0.9137255, 0, 1,
-1.00922, -1.400179, -2.411813, 1, 0.9176471, 0, 1,
-1.001428, 0.270649, -1.846921, 1, 0.9254902, 0, 1,
-0.9955739, 0.1794608, -1.649606, 1, 0.9294118, 0, 1,
-0.9952264, 0.4571257, -0.4187455, 1, 0.9372549, 0, 1,
-0.9835832, -1.278918, -2.508726, 1, 0.9411765, 0, 1,
-0.9814075, -1.172284, -1.947597, 1, 0.9490196, 0, 1,
-0.9813609, -0.9640357, -1.351633, 1, 0.9529412, 0, 1,
-0.97597, 0.9884605, -1.686438, 1, 0.9607843, 0, 1,
-0.9708323, -1.520859, -3.645763, 1, 0.9647059, 0, 1,
-0.9676301, 0.004883988, -2.316764, 1, 0.972549, 0, 1,
-0.9634601, 2.162438, 0.4241625, 1, 0.9764706, 0, 1,
-0.9474609, -1.671708, -1.789399, 1, 0.9843137, 0, 1,
-0.946745, 1.31322, -1.343105, 1, 0.9882353, 0, 1,
-0.9425883, -0.3080218, -2.36994, 1, 0.9960784, 0, 1,
-0.94192, -1.489625, -2.368028, 0.9960784, 1, 0, 1,
-0.9362153, -0.406104, -0.6930622, 0.9921569, 1, 0, 1,
-0.93129, -1.030312, -3.156201, 0.9843137, 1, 0, 1,
-0.9293073, -0.4481469, -1.397307, 0.9803922, 1, 0, 1,
-0.928902, 0.172459, 0.5856259, 0.972549, 1, 0, 1,
-0.925133, 1.520388, -1.812769, 0.9686275, 1, 0, 1,
-0.9175376, 0.5864155, -1.538185, 0.9607843, 1, 0, 1,
-0.9139948, 1.668254, 0.2638591, 0.9568627, 1, 0, 1,
-0.9031841, 1.001568, -1.020773, 0.9490196, 1, 0, 1,
-0.8945544, -0.7286645, -1.983527, 0.945098, 1, 0, 1,
-0.8939437, -0.04756982, -0.1305882, 0.9372549, 1, 0, 1,
-0.8815836, 0.3983171, -2.369738, 0.9333333, 1, 0, 1,
-0.8722793, -0.8218929, -4.011954, 0.9254902, 1, 0, 1,
-0.8699658, -0.2376661, -2.09692, 0.9215686, 1, 0, 1,
-0.8630147, 0.2082129, -0.2462768, 0.9137255, 1, 0, 1,
-0.8616927, -0.004092925, -2.265535, 0.9098039, 1, 0, 1,
-0.8605455, 0.1708531, -1.53349, 0.9019608, 1, 0, 1,
-0.8550087, -0.2082727, -2.493686, 0.8941177, 1, 0, 1,
-0.8535607, 2.469079, 0.8167747, 0.8901961, 1, 0, 1,
-0.8529587, -1.590004, -1.996293, 0.8823529, 1, 0, 1,
-0.8493143, -0.4087405, -1.961153, 0.8784314, 1, 0, 1,
-0.8469856, 1.801127, -1.703729, 0.8705882, 1, 0, 1,
-0.8468163, -1.834532, -3.740902, 0.8666667, 1, 0, 1,
-0.8434181, 0.541344, -0.7384768, 0.8588235, 1, 0, 1,
-0.8423814, 0.7870123, -0.4089472, 0.854902, 1, 0, 1,
-0.8412428, -0.1683813, -2.426729, 0.8470588, 1, 0, 1,
-0.8344991, -0.3034267, -1.30961, 0.8431373, 1, 0, 1,
-0.8257812, -0.1164916, -2.625872, 0.8352941, 1, 0, 1,
-0.8254996, 1.214052, -0.8912274, 0.8313726, 1, 0, 1,
-0.8168463, 0.007697892, -2.594351, 0.8235294, 1, 0, 1,
-0.8162328, -0.8724166, 0.1413247, 0.8196079, 1, 0, 1,
-0.8144473, -1.23328, -2.65296, 0.8117647, 1, 0, 1,
-0.8099421, 0.1537815, -1.867167, 0.8078431, 1, 0, 1,
-0.8090372, 0.3783969, 1.18775, 0.8, 1, 0, 1,
-0.8076595, -1.289416, -1.449037, 0.7921569, 1, 0, 1,
-0.8035291, 1.322007, 0.7593719, 0.7882353, 1, 0, 1,
-0.7937391, 0.7340737, -2.460429, 0.7803922, 1, 0, 1,
-0.7802865, -1.375162, -2.535823, 0.7764706, 1, 0, 1,
-0.7764995, 1.661596, -0.1625495, 0.7686275, 1, 0, 1,
-0.7723842, 0.4563909, 0.4097193, 0.7647059, 1, 0, 1,
-0.7660455, 0.4299599, -1.425664, 0.7568628, 1, 0, 1,
-0.7463786, 0.301932, -1.289614, 0.7529412, 1, 0, 1,
-0.7457491, -1.171663, -2.52423, 0.7450981, 1, 0, 1,
-0.7433096, -1.013332, -3.469411, 0.7411765, 1, 0, 1,
-0.7284861, -0.1593941, -1.738945, 0.7333333, 1, 0, 1,
-0.7178203, 0.2193592, -1.19254, 0.7294118, 1, 0, 1,
-0.7000623, -1.173553, -2.284693, 0.7215686, 1, 0, 1,
-0.6982441, 0.1468921, -0.151046, 0.7176471, 1, 0, 1,
-0.6973228, 1.844981, -0.6655081, 0.7098039, 1, 0, 1,
-0.6950339, -1.992061, -2.400371, 0.7058824, 1, 0, 1,
-0.6939981, 0.4110522, -1.452138, 0.6980392, 1, 0, 1,
-0.6915666, -0.2590959, -2.704248, 0.6901961, 1, 0, 1,
-0.6903608, 2.109576, 0.08259794, 0.6862745, 1, 0, 1,
-0.6884747, 0.4685151, 1.660591, 0.6784314, 1, 0, 1,
-0.6863099, -0.6558604, -2.409935, 0.6745098, 1, 0, 1,
-0.6847757, -0.01096063, -1.715029, 0.6666667, 1, 0, 1,
-0.6840951, 1.024497, 0.06224075, 0.6627451, 1, 0, 1,
-0.6836909, 0.2024374, -0.435736, 0.654902, 1, 0, 1,
-0.6834597, -1.14202, -2.143729, 0.6509804, 1, 0, 1,
-0.6834341, 1.113256, 0.3092445, 0.6431373, 1, 0, 1,
-0.6772662, -0.9433331, -4.470412, 0.6392157, 1, 0, 1,
-0.6759147, -0.3121906, -1.985426, 0.6313726, 1, 0, 1,
-0.6699387, 0.3160914, -1.012892, 0.627451, 1, 0, 1,
-0.6687703, -0.7331077, -1.133162, 0.6196079, 1, 0, 1,
-0.6648939, 0.707855, 0.2870666, 0.6156863, 1, 0, 1,
-0.6612888, 2.214362, 0.9451578, 0.6078432, 1, 0, 1,
-0.6598246, 1.066329, 0.3549192, 0.6039216, 1, 0, 1,
-0.6529142, 0.465172, -2.881734, 0.5960785, 1, 0, 1,
-0.6516536, -0.5781043, -3.574286, 0.5882353, 1, 0, 1,
-0.6453333, 0.6885777, -0.436489, 0.5843138, 1, 0, 1,
-0.644527, -2.22789, -0.3218212, 0.5764706, 1, 0, 1,
-0.6407045, 1.841403, -0.6424096, 0.572549, 1, 0, 1,
-0.6387469, 0.6997552, -0.2829916, 0.5647059, 1, 0, 1,
-0.6367476, 0.5306364, -0.9918233, 0.5607843, 1, 0, 1,
-0.6315947, -1.464058, -2.517734, 0.5529412, 1, 0, 1,
-0.6308455, -0.3116203, -0.766938, 0.5490196, 1, 0, 1,
-0.6303048, -0.9725753, -2.261676, 0.5411765, 1, 0, 1,
-0.626451, 0.1513177, -1.268584, 0.5372549, 1, 0, 1,
-0.6186316, 0.5519567, -1.205359, 0.5294118, 1, 0, 1,
-0.6179443, 1.241988, -0.6134272, 0.5254902, 1, 0, 1,
-0.6124902, 1.16435, -0.2141701, 0.5176471, 1, 0, 1,
-0.6049037, -0.8848432, -3.976604, 0.5137255, 1, 0, 1,
-0.6037112, 0.1600824, -2.314419, 0.5058824, 1, 0, 1,
-0.6019546, 0.5365869, 1.10013, 0.5019608, 1, 0, 1,
-0.601178, 0.5401775, -1.920772, 0.4941176, 1, 0, 1,
-0.6005907, 0.6266566, -1.391051, 0.4862745, 1, 0, 1,
-0.6001422, -0.2463363, -2.805259, 0.4823529, 1, 0, 1,
-0.5991611, 1.471176, -1.863857, 0.4745098, 1, 0, 1,
-0.5990204, 0.5661554, -1.635731, 0.4705882, 1, 0, 1,
-0.595659, 0.8830834, 0.3196163, 0.4627451, 1, 0, 1,
-0.5955523, -1.150699, -2.092669, 0.4588235, 1, 0, 1,
-0.5915909, -2.204516, -1.967077, 0.4509804, 1, 0, 1,
-0.5899436, 1.672209, 0.6466376, 0.4470588, 1, 0, 1,
-0.5846273, -2.32759, -4.03712, 0.4392157, 1, 0, 1,
-0.5755568, 0.9389598, -0.2849597, 0.4352941, 1, 0, 1,
-0.5750539, -0.3084027, -2.531859, 0.427451, 1, 0, 1,
-0.5713124, -0.8686451, -2.389852, 0.4235294, 1, 0, 1,
-0.5711784, -1.544612, -2.510262, 0.4156863, 1, 0, 1,
-0.5708808, 1.102158, -0.185752, 0.4117647, 1, 0, 1,
-0.5687258, 0.4235022, -0.07937297, 0.4039216, 1, 0, 1,
-0.5656371, -1.03568, -2.677865, 0.3960784, 1, 0, 1,
-0.5640908, -0.373661, -2.818216, 0.3921569, 1, 0, 1,
-0.5621016, -0.4810096, -1.989951, 0.3843137, 1, 0, 1,
-0.5619818, 0.5410661, -0.2702062, 0.3803922, 1, 0, 1,
-0.5617633, 1.061816, -1.509606, 0.372549, 1, 0, 1,
-0.5547081, 0.9477032, 0.214338, 0.3686275, 1, 0, 1,
-0.5530934, 1.638779, -0.6894462, 0.3607843, 1, 0, 1,
-0.5475953, -1.49365, -3.091996, 0.3568628, 1, 0, 1,
-0.5343752, -3.083399, -2.198111, 0.3490196, 1, 0, 1,
-0.5286794, -2.094546, -3.676162, 0.345098, 1, 0, 1,
-0.5274122, 0.2436783, -0.7697234, 0.3372549, 1, 0, 1,
-0.5235165, -0.5270675, -1.462246, 0.3333333, 1, 0, 1,
-0.5169167, -1.836992, -2.742894, 0.3254902, 1, 0, 1,
-0.5135903, -0.7764406, -2.50975, 0.3215686, 1, 0, 1,
-0.5130399, -0.653522, -1.824686, 0.3137255, 1, 0, 1,
-0.5039698, -0.3671045, -2.310352, 0.3098039, 1, 0, 1,
-0.502067, -1.077652, -1.607356, 0.3019608, 1, 0, 1,
-0.4974038, -1.559898, -3.488132, 0.2941177, 1, 0, 1,
-0.4892275, 0.9420683, 0.6483923, 0.2901961, 1, 0, 1,
-0.4885658, -0.1258448, -2.192386, 0.282353, 1, 0, 1,
-0.4884822, 1.084154, 0.1677122, 0.2784314, 1, 0, 1,
-0.4846996, 0.4860734, -1.003743, 0.2705882, 1, 0, 1,
-0.4841293, -1.030518, -2.418105, 0.2666667, 1, 0, 1,
-0.4824747, 1.67633, -0.5001815, 0.2588235, 1, 0, 1,
-0.4815241, 0.4352644, -0.9978443, 0.254902, 1, 0, 1,
-0.4806248, 0.1322883, -0.8561101, 0.2470588, 1, 0, 1,
-0.4777378, 0.0226556, -2.35638, 0.2431373, 1, 0, 1,
-0.4775093, 0.9441488, -1.521055, 0.2352941, 1, 0, 1,
-0.4732409, -0.1861635, -2.946328, 0.2313726, 1, 0, 1,
-0.4667226, 0.6722631, 0.276441, 0.2235294, 1, 0, 1,
-0.4655503, 0.01718314, -2.565098, 0.2196078, 1, 0, 1,
-0.4596339, -0.5179662, -2.632911, 0.2117647, 1, 0, 1,
-0.4538979, -0.8399194, -2.661621, 0.2078431, 1, 0, 1,
-0.4519404, 0.592856, 0.8372223, 0.2, 1, 0, 1,
-0.4499542, -0.8657601, -2.787441, 0.1921569, 1, 0, 1,
-0.4466892, -0.03677243, -0.3893014, 0.1882353, 1, 0, 1,
-0.4415167, 0.3891607, -1.441299, 0.1803922, 1, 0, 1,
-0.4357553, -2.340035, -2.175418, 0.1764706, 1, 0, 1,
-0.4325465, -0.3177217, -0.3573112, 0.1686275, 1, 0, 1,
-0.4313548, 0.5911251, -0.7310774, 0.1647059, 1, 0, 1,
-0.4270488, -1.622225, -2.92161, 0.1568628, 1, 0, 1,
-0.4229139, -0.8812743, -4.518448, 0.1529412, 1, 0, 1,
-0.4217226, -0.9051183, -2.017262, 0.145098, 1, 0, 1,
-0.4202113, -1.279856, -1.626428, 0.1411765, 1, 0, 1,
-0.4188721, 0.05352001, -3.729522, 0.1333333, 1, 0, 1,
-0.4182172, -0.9390466, -3.738854, 0.1294118, 1, 0, 1,
-0.4168031, 0.7823932, 0.3471181, 0.1215686, 1, 0, 1,
-0.4115749, 1.50076, -1.311379, 0.1176471, 1, 0, 1,
-0.4103495, 0.5370343, -0.4562674, 0.1098039, 1, 0, 1,
-0.4048687, 0.9993691, -0.2260412, 0.1058824, 1, 0, 1,
-0.4009136, -0.7313108, -1.444191, 0.09803922, 1, 0, 1,
-0.3971737, -0.6557947, -1.115582, 0.09019608, 1, 0, 1,
-0.3965534, 0.06492396, -3.244479, 0.08627451, 1, 0, 1,
-0.3947465, -0.2751248, -1.297348, 0.07843138, 1, 0, 1,
-0.3925972, -1.648492, -2.977613, 0.07450981, 1, 0, 1,
-0.3918304, -0.8205313, -3.636436, 0.06666667, 1, 0, 1,
-0.3916148, 0.2002516, -2.248474, 0.0627451, 1, 0, 1,
-0.3911522, -0.4151928, -3.173154, 0.05490196, 1, 0, 1,
-0.3883842, -0.1553023, -0.8838835, 0.05098039, 1, 0, 1,
-0.3815064, 1.969232, -1.691196, 0.04313726, 1, 0, 1,
-0.3784286, -1.078978, -2.084728, 0.03921569, 1, 0, 1,
-0.3772091, 0.5846203, -1.464384, 0.03137255, 1, 0, 1,
-0.3767963, 0.3949841, -0.01902921, 0.02745098, 1, 0, 1,
-0.3639423, -0.4614324, -1.630533, 0.01960784, 1, 0, 1,
-0.3631945, 1.514181, 1.015608, 0.01568628, 1, 0, 1,
-0.3615454, -0.1251311, -0.8242851, 0.007843138, 1, 0, 1,
-0.3611361, -0.2912133, -2.786514, 0.003921569, 1, 0, 1,
-0.3601448, -0.1852603, -2.408074, 0, 1, 0.003921569, 1,
-0.3565429, 0.6848488, 0.2000715, 0, 1, 0.01176471, 1,
-0.3552329, 0.01831247, -0.9324217, 0, 1, 0.01568628, 1,
-0.3437954, 0.3065873, 0.8936962, 0, 1, 0.02352941, 1,
-0.3432772, -1.586578, -4.386637, 0, 1, 0.02745098, 1,
-0.3413131, -1.059901, -5.246127, 0, 1, 0.03529412, 1,
-0.3373999, -1.208623, -2.424598, 0, 1, 0.03921569, 1,
-0.3340588, 0.5312613, 0.5411471, 0, 1, 0.04705882, 1,
-0.3240876, 1.585653, -0.4662673, 0, 1, 0.05098039, 1,
-0.3198313, -1.943633, -5.2236, 0, 1, 0.05882353, 1,
-0.3152436, -0.04652947, -0.8196499, 0, 1, 0.0627451, 1,
-0.3127609, -0.841608, -2.080608, 0, 1, 0.07058824, 1,
-0.3063214, 0.9090325, -0.3131894, 0, 1, 0.07450981, 1,
-0.3028418, -1.864071, -4.455344, 0, 1, 0.08235294, 1,
-0.2997587, -0.699823, -3.202816, 0, 1, 0.08627451, 1,
-0.2984151, 0.9988794, -0.8140602, 0, 1, 0.09411765, 1,
-0.294455, 0.5183251, 0.2886655, 0, 1, 0.1019608, 1,
-0.2910464, 0.3968134, -0.851937, 0, 1, 0.1058824, 1,
-0.2905988, 0.3517676, -1.066572, 0, 1, 0.1137255, 1,
-0.2843373, 0.3607637, 0.2824486, 0, 1, 0.1176471, 1,
-0.2820042, 0.8355872, -1.165962, 0, 1, 0.1254902, 1,
-0.2804314, -0.6486002, -1.713603, 0, 1, 0.1294118, 1,
-0.2801653, 1.012529, -1.578563, 0, 1, 0.1372549, 1,
-0.2789556, 0.7182058, 0.5275423, 0, 1, 0.1411765, 1,
-0.2762758, -0.2058493, -3.107075, 0, 1, 0.1490196, 1,
-0.275107, -1.083173, -1.555109, 0, 1, 0.1529412, 1,
-0.2749645, 1.527681, -0.08104378, 0, 1, 0.1607843, 1,
-0.2745591, -0.913559, -1.012451, 0, 1, 0.1647059, 1,
-0.2734686, -1.522749, -2.852738, 0, 1, 0.172549, 1,
-0.2674575, 0.2354541, -1.350627, 0, 1, 0.1764706, 1,
-0.2662629, -0.1928226, -0.8563875, 0, 1, 0.1843137, 1,
-0.2623719, -0.1170441, -1.667712, 0, 1, 0.1882353, 1,
-0.2552296, -0.5721513, -1.92327, 0, 1, 0.1960784, 1,
-0.2517599, 0.6041048, 0.601755, 0, 1, 0.2039216, 1,
-0.2476115, -0.2197265, -1.368214, 0, 1, 0.2078431, 1,
-0.242953, -0.3572754, -2.659334, 0, 1, 0.2156863, 1,
-0.2428466, 0.5620163, 2.043786, 0, 1, 0.2196078, 1,
-0.2417787, -1.527999, -3.133239, 0, 1, 0.227451, 1,
-0.2389423, -0.9137893, -3.143151, 0, 1, 0.2313726, 1,
-0.2359916, 0.6667395, -0.3682851, 0, 1, 0.2392157, 1,
-0.2344995, 0.4835728, -2.896154, 0, 1, 0.2431373, 1,
-0.2306412, -0.6208056, -2.701592, 0, 1, 0.2509804, 1,
-0.225245, 0.1341037, -2.365758, 0, 1, 0.254902, 1,
-0.2223643, 1.422866, -0.3684443, 0, 1, 0.2627451, 1,
-0.2088283, -0.1960492, -4.067867, 0, 1, 0.2666667, 1,
-0.2034701, -0.8360701, -2.729251, 0, 1, 0.2745098, 1,
-0.1975382, -0.3773975, -2.238881, 0, 1, 0.2784314, 1,
-0.1930203, 0.2734537, -2.943635, 0, 1, 0.2862745, 1,
-0.1875173, -1.462175, -4.019802, 0, 1, 0.2901961, 1,
-0.186187, -0.2559587, -2.91731, 0, 1, 0.2980392, 1,
-0.1837785, -1.502473, -4.159404, 0, 1, 0.3058824, 1,
-0.1798056, 1.114976, 0.7194515, 0, 1, 0.3098039, 1,
-0.17866, 1.300512, 0.4255667, 0, 1, 0.3176471, 1,
-0.1740028, -0.5672871, -3.832162, 0, 1, 0.3215686, 1,
-0.1724782, 0.05133839, -2.470956, 0, 1, 0.3294118, 1,
-0.1715658, 0.4436895, -1.267272, 0, 1, 0.3333333, 1,
-0.1707845, -0.5487044, -2.730464, 0, 1, 0.3411765, 1,
-0.1627086, -0.5079665, -3.575936, 0, 1, 0.345098, 1,
-0.1607596, -0.5861603, -2.056185, 0, 1, 0.3529412, 1,
-0.1576226, -0.339149, -0.8526614, 0, 1, 0.3568628, 1,
-0.1516593, 1.011926, -1.897324, 0, 1, 0.3647059, 1,
-0.1490713, 0.8806621, -2.451251, 0, 1, 0.3686275, 1,
-0.1483254, 0.461934, -2.700503, 0, 1, 0.3764706, 1,
-0.1479382, 0.7653117, 0.2320577, 0, 1, 0.3803922, 1,
-0.1478604, -0.3418015, -0.7101424, 0, 1, 0.3882353, 1,
-0.1458148, -1.742862, -3.315295, 0, 1, 0.3921569, 1,
-0.1423285, -0.7402788, -1.714568, 0, 1, 0.4, 1,
-0.1396075, 0.151821, -0.4602776, 0, 1, 0.4078431, 1,
-0.1362039, 0.9588539, 0.7737755, 0, 1, 0.4117647, 1,
-0.1356581, -0.414935, -2.70523, 0, 1, 0.4196078, 1,
-0.1323177, 1.890267, -0.02515828, 0, 1, 0.4235294, 1,
-0.1320615, -1.29911, -4.182096, 0, 1, 0.4313726, 1,
-0.1250441, 0.9136751, -2.035799, 0, 1, 0.4352941, 1,
-0.123275, 1.073719, 0.9780995, 0, 1, 0.4431373, 1,
-0.1208586, 0.1072415, -2.129092, 0, 1, 0.4470588, 1,
-0.1202489, 1.139191, -0.3117188, 0, 1, 0.454902, 1,
-0.1092162, 0.5218049, -1.442124, 0, 1, 0.4588235, 1,
-0.1087848, -0.1424258, -3.288516, 0, 1, 0.4666667, 1,
-0.1049445, -0.9158617, -1.753235, 0, 1, 0.4705882, 1,
-0.09998622, 1.152797, -0.9526237, 0, 1, 0.4784314, 1,
-0.09912594, -0.08812749, -2.204468, 0, 1, 0.4823529, 1,
-0.09003523, -0.4170854, -3.067748, 0, 1, 0.4901961, 1,
-0.08915654, -0.53517, -3.505708, 0, 1, 0.4941176, 1,
-0.08909663, -0.5354657, -3.55812, 0, 1, 0.5019608, 1,
-0.08794731, 0.1074847, -1.764776, 0, 1, 0.509804, 1,
-0.08459024, 0.07857084, -0.7376547, 0, 1, 0.5137255, 1,
-0.08044049, -1.431232, -2.970154, 0, 1, 0.5215687, 1,
-0.07663735, -1.007906, -3.329335, 0, 1, 0.5254902, 1,
-0.07427364, -0.8871488, -4.182484, 0, 1, 0.5333334, 1,
-0.07365181, -0.3227211, -3.019722, 0, 1, 0.5372549, 1,
-0.07031388, 0.6627457, -1.068438, 0, 1, 0.5450981, 1,
-0.06947552, -1.310468, -3.339889, 0, 1, 0.5490196, 1,
-0.06940485, 0.5655164, 0.3179677, 0, 1, 0.5568628, 1,
-0.06791095, -1.361741, -3.968655, 0, 1, 0.5607843, 1,
-0.06633962, -0.8109543, -1.001512, 0, 1, 0.5686275, 1,
-0.06556918, -0.7130721, -2.891475, 0, 1, 0.572549, 1,
-0.06408618, 0.4483634, -1.039587, 0, 1, 0.5803922, 1,
-0.06265511, -0.07334743, -3.180354, 0, 1, 0.5843138, 1,
-0.06054105, 0.4853949, -0.3409149, 0, 1, 0.5921569, 1,
-0.05912321, -0.3347198, -5.084442, 0, 1, 0.5960785, 1,
-0.05845424, 0.5035799, 1.949339, 0, 1, 0.6039216, 1,
-0.05644348, 0.2717494, -1.354888, 0, 1, 0.6117647, 1,
-0.05409248, 0.8102321, 1.296382, 0, 1, 0.6156863, 1,
-0.05395497, 1.023618, 0.2913609, 0, 1, 0.6235294, 1,
-0.05350978, 0.06458046, -1.053468, 0, 1, 0.627451, 1,
-0.05199065, 0.7300863, 0.9938583, 0, 1, 0.6352941, 1,
-0.04710213, -1.477858, -3.135429, 0, 1, 0.6392157, 1,
-0.04556936, -0.8384401, -3.591486, 0, 1, 0.6470588, 1,
-0.04234861, -0.9324448, -3.303598, 0, 1, 0.6509804, 1,
-0.04233434, 0.964408, 0.4870217, 0, 1, 0.6588235, 1,
-0.03559016, -0.6943158, -3.946416, 0, 1, 0.6627451, 1,
-0.03247464, -0.3954156, -3.777515, 0, 1, 0.6705883, 1,
-0.02666016, -0.2595091, -3.326856, 0, 1, 0.6745098, 1,
-0.02557459, -0.2738248, -2.222816, 0, 1, 0.682353, 1,
-0.02533786, 1.245271, 0.8124871, 0, 1, 0.6862745, 1,
-0.02405348, 0.4204238, -1.721823, 0, 1, 0.6941177, 1,
-0.01985748, -0.2043452, -3.031652, 0, 1, 0.7019608, 1,
-0.0164232, 0.03332152, 0.3540173, 0, 1, 0.7058824, 1,
-0.01466718, -2.196426, -3.175273, 0, 1, 0.7137255, 1,
-0.01461553, 1.423463, 0.5639206, 0, 1, 0.7176471, 1,
-0.01220383, 0.001885263, -0.4281077, 0, 1, 0.7254902, 1,
-0.01160153, -2.533198, -3.02494, 0, 1, 0.7294118, 1,
-0.00975591, 0.08151048, -0.6477102, 0, 1, 0.7372549, 1,
-0.009263061, -0.03333711, -3.463605, 0, 1, 0.7411765, 1,
-0.009163837, -0.5344855, -3.971484, 0, 1, 0.7490196, 1,
-0.007187895, 0.6090949, 0.3359547, 0, 1, 0.7529412, 1,
-0.006234709, 1.883102, 0.01243541, 0, 1, 0.7607843, 1,
-0.004209689, -0.5733725, -3.487579, 0, 1, 0.7647059, 1,
-0.00276038, 1.670708, -0.820879, 0, 1, 0.772549, 1,
0.006026374, -1.458935, 3.10985, 0, 1, 0.7764706, 1,
0.007738714, -0.0558644, 3.110949, 0, 1, 0.7843137, 1,
0.009220445, 0.02157962, 1.596733, 0, 1, 0.7882353, 1,
0.01155294, -0.2345229, 5.079036, 0, 1, 0.7960784, 1,
0.01207044, -0.0860061, 4.312952, 0, 1, 0.8039216, 1,
0.01406245, 0.8690169, -0.5535977, 0, 1, 0.8078431, 1,
0.01546791, -0.7932164, 2.877131, 0, 1, 0.8156863, 1,
0.01655662, 0.7160391, -0.1314104, 0, 1, 0.8196079, 1,
0.02097156, -0.7130576, 2.680237, 0, 1, 0.827451, 1,
0.02300894, 0.4201439, -0.1968653, 0, 1, 0.8313726, 1,
0.03344401, -0.9558985, 1.791966, 0, 1, 0.8392157, 1,
0.03813799, 0.5936978, 0.2430533, 0, 1, 0.8431373, 1,
0.03914471, 0.763558, -0.2397491, 0, 1, 0.8509804, 1,
0.03979218, -0.1000731, 2.472824, 0, 1, 0.854902, 1,
0.0411986, 0.981924, 0.76768, 0, 1, 0.8627451, 1,
0.04652975, 0.4674098, -0.2694964, 0, 1, 0.8666667, 1,
0.04750141, 0.0384484, 0.2684738, 0, 1, 0.8745098, 1,
0.04764089, -0.203982, 3.028075, 0, 1, 0.8784314, 1,
0.05044057, 0.7461663, 0.7583377, 0, 1, 0.8862745, 1,
0.0506528, 1.367892, -0.3081491, 0, 1, 0.8901961, 1,
0.0511647, 1.29094, -0.5559629, 0, 1, 0.8980392, 1,
0.05342462, -1.005216, 3.57015, 0, 1, 0.9058824, 1,
0.05505477, -0.1316872, 1.947429, 0, 1, 0.9098039, 1,
0.05584456, 0.9494957, 0.2202198, 0, 1, 0.9176471, 1,
0.05693334, -0.4132392, 1.035472, 0, 1, 0.9215686, 1,
0.05698368, 0.5155261, -0.5349727, 0, 1, 0.9294118, 1,
0.06084445, 1.29041, -1.203767, 0, 1, 0.9333333, 1,
0.06317938, -1.845605, 1.36082, 0, 1, 0.9411765, 1,
0.06363152, -0.8323517, 3.353142, 0, 1, 0.945098, 1,
0.06391054, -1.011157, 1.688219, 0, 1, 0.9529412, 1,
0.07238189, -0.5791056, 3.16218, 0, 1, 0.9568627, 1,
0.07418502, 0.5329301, -0.3776988, 0, 1, 0.9647059, 1,
0.08167918, -0.3710216, 3.09812, 0, 1, 0.9686275, 1,
0.08521278, 0.09675792, 1.875059, 0, 1, 0.9764706, 1,
0.08816516, -0.1605402, 3.48131, 0, 1, 0.9803922, 1,
0.09099282, 1.37892, 2.131082, 0, 1, 0.9882353, 1,
0.09105901, -1.129639, 2.969948, 0, 1, 0.9921569, 1,
0.09191909, 0.4269068, -1.241242, 0, 1, 1, 1,
0.09325762, 1.006395, -1.958926, 0, 0.9921569, 1, 1,
0.09530208, 0.09819636, 0.8766314, 0, 0.9882353, 1, 1,
0.09688565, 1.087985, 0.2680449, 0, 0.9803922, 1, 1,
0.1068978, 1.577685, 0.09664451, 0, 0.9764706, 1, 1,
0.1098936, -0.2797324, 3.002508, 0, 0.9686275, 1, 1,
0.1118586, 0.2703519, 1.307915, 0, 0.9647059, 1, 1,
0.1141847, 0.479469, -0.2922443, 0, 0.9568627, 1, 1,
0.1169933, 0.1257732, -0.08563313, 0, 0.9529412, 1, 1,
0.1243937, -0.03408521, 2.52469, 0, 0.945098, 1, 1,
0.1252261, -1.151535, 4.940806, 0, 0.9411765, 1, 1,
0.1263872, 1.070105, -0.5317779, 0, 0.9333333, 1, 1,
0.1275403, 0.9826611, 0.3871083, 0, 0.9294118, 1, 1,
0.1276084, 0.5920014, -0.5537117, 0, 0.9215686, 1, 1,
0.1281141, -0.2287394, 2.567925, 0, 0.9176471, 1, 1,
0.1293052, -1.409981, 4.382648, 0, 0.9098039, 1, 1,
0.1385934, -0.05133352, 3.057706, 0, 0.9058824, 1, 1,
0.1410258, 0.6965728, 1.530627, 0, 0.8980392, 1, 1,
0.1473016, 0.1323352, -0.08338055, 0, 0.8901961, 1, 1,
0.1474438, 0.4308138, 2.432843, 0, 0.8862745, 1, 1,
0.1480908, -0.008395021, 0.2907325, 0, 0.8784314, 1, 1,
0.1551474, -0.624903, 1.465718, 0, 0.8745098, 1, 1,
0.1594454, -1.821713, 1.487885, 0, 0.8666667, 1, 1,
0.1642554, -0.3622221, 4.138591, 0, 0.8627451, 1, 1,
0.1673558, 1.744631, -1.154955, 0, 0.854902, 1, 1,
0.1686861, 0.3783254, 1.00971, 0, 0.8509804, 1, 1,
0.1704542, -0.9549718, 2.485573, 0, 0.8431373, 1, 1,
0.1736382, 0.2905456, 0.6489074, 0, 0.8392157, 1, 1,
0.1774449, 1.311614, 0.6494057, 0, 0.8313726, 1, 1,
0.1786974, 0.9098045, -0.5833016, 0, 0.827451, 1, 1,
0.1809088, -0.470339, 1.896125, 0, 0.8196079, 1, 1,
0.1819222, 0.348971, 2.363689, 0, 0.8156863, 1, 1,
0.1859484, -0.1306943, 3.025608, 0, 0.8078431, 1, 1,
0.1894126, -0.2339408, 3.237285, 0, 0.8039216, 1, 1,
0.1939706, 1.19128, 0.7598364, 0, 0.7960784, 1, 1,
0.1955843, 0.8617268, -0.4092889, 0, 0.7882353, 1, 1,
0.1977998, -0.2240639, 2.382963, 0, 0.7843137, 1, 1,
0.2014818, -1.022865, 2.668974, 0, 0.7764706, 1, 1,
0.2024135, -1.723478, 0.9341947, 0, 0.772549, 1, 1,
0.2040375, 0.2567342, 0.9980493, 0, 0.7647059, 1, 1,
0.2063332, -0.2806741, 1.514443, 0, 0.7607843, 1, 1,
0.2093589, 1.687713, 1.066901, 0, 0.7529412, 1, 1,
0.2096624, 0.3571264, -0.5504369, 0, 0.7490196, 1, 1,
0.2133602, 0.3712787, -0.3784624, 0, 0.7411765, 1, 1,
0.2141831, -0.6928215, 4.807823, 0, 0.7372549, 1, 1,
0.2223754, -1.136492, 3.429754, 0, 0.7294118, 1, 1,
0.2249154, 0.2520708, 0.5514812, 0, 0.7254902, 1, 1,
0.2256691, -1.173568, 2.802093, 0, 0.7176471, 1, 1,
0.225862, -3.191917, 2.45157, 0, 0.7137255, 1, 1,
0.2267144, 0.4436046, 1.96304, 0, 0.7058824, 1, 1,
0.2289729, 0.2933539, 0.4386725, 0, 0.6980392, 1, 1,
0.2316254, 2.056536, -0.6756491, 0, 0.6941177, 1, 1,
0.2318901, -0.3332779, 3.426052, 0, 0.6862745, 1, 1,
0.2320112, -0.565102, 4.862946, 0, 0.682353, 1, 1,
0.2356444, 0.5678295, -0.2201385, 0, 0.6745098, 1, 1,
0.2358312, 1.500071, -1.364966, 0, 0.6705883, 1, 1,
0.2365567, 0.2486517, 1.71025, 0, 0.6627451, 1, 1,
0.2369281, -0.6140791, 2.786154, 0, 0.6588235, 1, 1,
0.2405216, -0.1425713, 1.065436, 0, 0.6509804, 1, 1,
0.2418306, 0.5541424, -1.009861, 0, 0.6470588, 1, 1,
0.2451318, -0.009847168, 1.724741, 0, 0.6392157, 1, 1,
0.2491376, -0.7519779, 3.222767, 0, 0.6352941, 1, 1,
0.2571087, -0.5497512, 2.949827, 0, 0.627451, 1, 1,
0.2588992, -1.15193, 1.94764, 0, 0.6235294, 1, 1,
0.2590594, 0.09398619, -1.807329, 0, 0.6156863, 1, 1,
0.2632789, -2.643147, 4.165192, 0, 0.6117647, 1, 1,
0.2646266, 0.6143331, 1.476505, 0, 0.6039216, 1, 1,
0.2687654, 0.4280255, -2.171586, 0, 0.5960785, 1, 1,
0.2713451, 0.8156724, 0.8908443, 0, 0.5921569, 1, 1,
0.2724288, -0.9969523, 4.164764, 0, 0.5843138, 1, 1,
0.2733274, 1.389538, 0.2119028, 0, 0.5803922, 1, 1,
0.2740875, 0.4895852, -0.08420698, 0, 0.572549, 1, 1,
0.2759542, 0.8068581, 1.404576, 0, 0.5686275, 1, 1,
0.2777485, 0.3410437, 1.119445, 0, 0.5607843, 1, 1,
0.2794366, 0.9584953, 1.918167, 0, 0.5568628, 1, 1,
0.2819332, -0.8127902, 3.694097, 0, 0.5490196, 1, 1,
0.282116, 0.4112139, -0.300314, 0, 0.5450981, 1, 1,
0.2839834, 2.296312, 1.39217, 0, 0.5372549, 1, 1,
0.286701, -0.2388989, 2.458458, 0, 0.5333334, 1, 1,
0.2871369, -1.543326, 0.9926689, 0, 0.5254902, 1, 1,
0.2900452, -0.4525578, 1.762823, 0, 0.5215687, 1, 1,
0.2967811, -2.075813, 1.696954, 0, 0.5137255, 1, 1,
0.2996317, -1.739008, 3.260096, 0, 0.509804, 1, 1,
0.3029201, -0.3430437, 0.5344172, 0, 0.5019608, 1, 1,
0.3112048, 0.687467, 0.5949741, 0, 0.4941176, 1, 1,
0.315686, 0.4278849, 0.9668371, 0, 0.4901961, 1, 1,
0.3216917, -0.2376482, 2.41361, 0, 0.4823529, 1, 1,
0.3228384, -0.4995158, 3.69347, 0, 0.4784314, 1, 1,
0.3304554, 0.6661102, 0.5395372, 0, 0.4705882, 1, 1,
0.3333399, -0.5541651, 2.644375, 0, 0.4666667, 1, 1,
0.33401, -1.027329, 2.936989, 0, 0.4588235, 1, 1,
0.3342136, 0.09348634, 1.999747, 0, 0.454902, 1, 1,
0.3373505, -0.9295692, 3.32132, 0, 0.4470588, 1, 1,
0.3419347, -0.7790058, 0.3540812, 0, 0.4431373, 1, 1,
0.3420467, -1.31321, 2.265019, 0, 0.4352941, 1, 1,
0.3421244, -1.272522, 2.924991, 0, 0.4313726, 1, 1,
0.345369, 0.4892949, -1.017274, 0, 0.4235294, 1, 1,
0.349133, 1.780186, 0.3683424, 0, 0.4196078, 1, 1,
0.3492648, 0.1137383, -0.13728, 0, 0.4117647, 1, 1,
0.3532139, 0.259753, 0.6154523, 0, 0.4078431, 1, 1,
0.3536966, -0.8142648, 2.221252, 0, 0.4, 1, 1,
0.3540215, -0.01787854, 1.926399, 0, 0.3921569, 1, 1,
0.3547231, -1.778414, 3.009819, 0, 0.3882353, 1, 1,
0.3550572, -0.5710872, 2.241199, 0, 0.3803922, 1, 1,
0.356576, 1.040552, 0.6181558, 0, 0.3764706, 1, 1,
0.3572462, -0.7918847, 2.32548, 0, 0.3686275, 1, 1,
0.3587863, 0.156712, 0.9218526, 0, 0.3647059, 1, 1,
0.3597211, -1.069851, 2.084019, 0, 0.3568628, 1, 1,
0.3630406, 0.2588785, 1.953725, 0, 0.3529412, 1, 1,
0.3630891, 0.5052681, -0.1356958, 0, 0.345098, 1, 1,
0.3639776, -1.06013, 2.765655, 0, 0.3411765, 1, 1,
0.3692063, 0.611451, 1.13065, 0, 0.3333333, 1, 1,
0.3772424, -0.7386591, 3.430757, 0, 0.3294118, 1, 1,
0.3807203, -1.151847, 1.905667, 0, 0.3215686, 1, 1,
0.3831381, 0.3871197, 0.484916, 0, 0.3176471, 1, 1,
0.38346, -0.1062897, 1.320738, 0, 0.3098039, 1, 1,
0.3852134, 0.9548265, 0.4069107, 0, 0.3058824, 1, 1,
0.3852763, 1.326021, 0.7591382, 0, 0.2980392, 1, 1,
0.3904218, -0.06351829, 2.198228, 0, 0.2901961, 1, 1,
0.3922273, 0.4879872, -0.5202987, 0, 0.2862745, 1, 1,
0.3958022, 1.36223, -0.3195244, 0, 0.2784314, 1, 1,
0.3998076, 0.5448219, -0.8914981, 0, 0.2745098, 1, 1,
0.400378, 0.2628861, 1.530748, 0, 0.2666667, 1, 1,
0.4004359, -0.6105594, 4.990441, 0, 0.2627451, 1, 1,
0.4035049, -1.342613, 2.343714, 0, 0.254902, 1, 1,
0.4058462, 1.721487, -0.939879, 0, 0.2509804, 1, 1,
0.4060488, 0.79255, -0.149186, 0, 0.2431373, 1, 1,
0.4082007, 0.3730564, 1.60025, 0, 0.2392157, 1, 1,
0.4113983, 0.6314414, 0.7380838, 0, 0.2313726, 1, 1,
0.4134847, -0.8465713, 3.488386, 0, 0.227451, 1, 1,
0.4145303, -0.06360888, 2.138079, 0, 0.2196078, 1, 1,
0.4150436, 0.4707464, 0.7561578, 0, 0.2156863, 1, 1,
0.4165453, -1.728049, 2.693806, 0, 0.2078431, 1, 1,
0.4221305, -0.1242676, 2.425387, 0, 0.2039216, 1, 1,
0.4260472, 0.06924864, 1.543845, 0, 0.1960784, 1, 1,
0.4288724, -0.1398904, 1.953335, 0, 0.1882353, 1, 1,
0.434665, -0.8259396, 2.641088, 0, 0.1843137, 1, 1,
0.4378882, 0.2706641, 2.056774, 0, 0.1764706, 1, 1,
0.4397459, 0.2964624, 1.444394, 0, 0.172549, 1, 1,
0.44294, -2.376364, 3.147778, 0, 0.1647059, 1, 1,
0.4501804, -0.5298907, 2.008473, 0, 0.1607843, 1, 1,
0.4527667, 0.310886, 1.248968, 0, 0.1529412, 1, 1,
0.4529043, 0.09522243, 0.8235454, 0, 0.1490196, 1, 1,
0.4536433, 2.698652, -1.417325, 0, 0.1411765, 1, 1,
0.4575197, 0.576871, -0.1511881, 0, 0.1372549, 1, 1,
0.4588583, 0.810342, -0.1959216, 0, 0.1294118, 1, 1,
0.465581, -0.03898035, 2.050079, 0, 0.1254902, 1, 1,
0.4665379, -0.2098234, 3.129934, 0, 0.1176471, 1, 1,
0.466875, 0.8451486, -0.9941536, 0, 0.1137255, 1, 1,
0.4669445, -0.01952005, 2.668989, 0, 0.1058824, 1, 1,
0.4771442, 1.122233, -1.191892, 0, 0.09803922, 1, 1,
0.4785711, 1.100845, 1.257952, 0, 0.09411765, 1, 1,
0.4876797, 0.8502222, -0.2419766, 0, 0.08627451, 1, 1,
0.4903971, -0.8090506, 1.679735, 0, 0.08235294, 1, 1,
0.496347, -1.099164, 2.903782, 0, 0.07450981, 1, 1,
0.4968522, 0.9586664, 0.6218079, 0, 0.07058824, 1, 1,
0.4981006, -1.119848, 4.375489, 0, 0.0627451, 1, 1,
0.4987449, -2.039248, 3.272566, 0, 0.05882353, 1, 1,
0.4988631, -0.8829073, 1.503902, 0, 0.05098039, 1, 1,
0.4997693, -0.1388553, 1.605623, 0, 0.04705882, 1, 1,
0.5025024, 0.4903548, 1.174521, 0, 0.03921569, 1, 1,
0.5038258, 0.3935494, 1.134897, 0, 0.03529412, 1, 1,
0.5101294, 0.6730859, 1.599265, 0, 0.02745098, 1, 1,
0.5147859, 1.221127, 1.763627, 0, 0.02352941, 1, 1,
0.5161694, -2.045369, 2.946513, 0, 0.01568628, 1, 1,
0.5162547, -0.50369, 3.53811, 0, 0.01176471, 1, 1,
0.5250776, 0.7022046, 1.157286, 0, 0.003921569, 1, 1,
0.5255168, 2.226366, 0.6079825, 0.003921569, 0, 1, 1,
0.5255192, -1.39143, 2.240281, 0.007843138, 0, 1, 1,
0.5290077, -0.1290988, 1.02832, 0.01568628, 0, 1, 1,
0.5299561, -0.391194, 3.036966, 0.01960784, 0, 1, 1,
0.5311662, 0.4353515, 1.03015, 0.02745098, 0, 1, 1,
0.5338147, -1.876292, 3.536847, 0.03137255, 0, 1, 1,
0.5394578, 0.8633012, 0.9117892, 0.03921569, 0, 1, 1,
0.5401179, -0.223076, 2.042884, 0.04313726, 0, 1, 1,
0.5468148, -0.8843272, 4.448155, 0.05098039, 0, 1, 1,
0.5468947, -2.311081, 2.183449, 0.05490196, 0, 1, 1,
0.5533082, -0.04487327, 2.219568, 0.0627451, 0, 1, 1,
0.5568748, -0.5701864, 2.939048, 0.06666667, 0, 1, 1,
0.557711, 0.2796654, 0.8562133, 0.07450981, 0, 1, 1,
0.5628264, 1.092557, -1.062391, 0.07843138, 0, 1, 1,
0.5691788, 0.8138061, 0.962868, 0.08627451, 0, 1, 1,
0.5721728, 0.6370631, 0.7840799, 0.09019608, 0, 1, 1,
0.5729674, -0.4122089, 1.444436, 0.09803922, 0, 1, 1,
0.5758033, -0.8766648, 1.617624, 0.1058824, 0, 1, 1,
0.5760823, -0.1204939, 2.057652, 0.1098039, 0, 1, 1,
0.5768723, -0.9091558, 1.144749, 0.1176471, 0, 1, 1,
0.577482, -0.2147211, 2.06904, 0.1215686, 0, 1, 1,
0.5781839, -0.1866244, -0.06434891, 0.1294118, 0, 1, 1,
0.5791245, -1.982015, 2.626436, 0.1333333, 0, 1, 1,
0.5863792, -0.6330017, 2.114583, 0.1411765, 0, 1, 1,
0.5870724, 0.6089808, 0.9825583, 0.145098, 0, 1, 1,
0.588525, -0.5911031, 2.449317, 0.1529412, 0, 1, 1,
0.5901595, -0.2819836, 3.665367, 0.1568628, 0, 1, 1,
0.5941998, -2.083518, 3.03295, 0.1647059, 0, 1, 1,
0.6034311, 1.077098, -0.457989, 0.1686275, 0, 1, 1,
0.6038173, -0.379223, 0.7129782, 0.1764706, 0, 1, 1,
0.6086916, -0.6748264, 3.363765, 0.1803922, 0, 1, 1,
0.6094489, 1.42671, -0.4731437, 0.1882353, 0, 1, 1,
0.6098005, 0.5500645, 2.361342, 0.1921569, 0, 1, 1,
0.6125345, -0.3254366, 1.544285, 0.2, 0, 1, 1,
0.6180187, -0.1711107, 2.281646, 0.2078431, 0, 1, 1,
0.619872, 0.790874, -0.3086922, 0.2117647, 0, 1, 1,
0.6282205, 0.3773784, 1.266441, 0.2196078, 0, 1, 1,
0.6313344, -1.00001, 5.201931, 0.2235294, 0, 1, 1,
0.6342368, 0.2387544, 1.443657, 0.2313726, 0, 1, 1,
0.6352305, -0.6656571, 1.822954, 0.2352941, 0, 1, 1,
0.6407362, 0.8281106, 3.103478, 0.2431373, 0, 1, 1,
0.6419849, 0.3534545, 1.040888, 0.2470588, 0, 1, 1,
0.6452301, 0.4640139, -0.2229215, 0.254902, 0, 1, 1,
0.6459912, -0.0788098, 1.651523, 0.2588235, 0, 1, 1,
0.64786, 1.32895, 0.7801037, 0.2666667, 0, 1, 1,
0.649232, -1.271152, 3.14868, 0.2705882, 0, 1, 1,
0.6553842, -1.602103, 3.07333, 0.2784314, 0, 1, 1,
0.6576635, 0.9652123, 0.9300627, 0.282353, 0, 1, 1,
0.6580809, 0.5970793, -0.02914949, 0.2901961, 0, 1, 1,
0.6587381, -1.151911, 1.471739, 0.2941177, 0, 1, 1,
0.6591105, 0.9384184, -0.8502111, 0.3019608, 0, 1, 1,
0.6605675, -1.435791, 2.751378, 0.3098039, 0, 1, 1,
0.6616238, -0.8717103, 2.600184, 0.3137255, 0, 1, 1,
0.6662796, 0.1693274, 0.03140923, 0.3215686, 0, 1, 1,
0.6741718, 1.131277, -0.09271517, 0.3254902, 0, 1, 1,
0.6765362, 0.7579394, 2.523157, 0.3333333, 0, 1, 1,
0.6782089, -2.321322, 2.894734, 0.3372549, 0, 1, 1,
0.682819, -0.3472259, 0.5308371, 0.345098, 0, 1, 1,
0.6864652, -0.7026991, 4.952368, 0.3490196, 0, 1, 1,
0.6921458, -0.8460094, 3.142649, 0.3568628, 0, 1, 1,
0.69471, -1.334921, 2.282768, 0.3607843, 0, 1, 1,
0.6951774, 0.07480665, 0.2588983, 0.3686275, 0, 1, 1,
0.7001439, -1.306951, 1.675198, 0.372549, 0, 1, 1,
0.7006348, -0.09314825, 1.048759, 0.3803922, 0, 1, 1,
0.7072325, -0.9152413, 2.374811, 0.3843137, 0, 1, 1,
0.7081003, -0.6005386, 1.1926, 0.3921569, 0, 1, 1,
0.7082295, 0.243753, 3.352543, 0.3960784, 0, 1, 1,
0.711651, 2.053506, 1.764979, 0.4039216, 0, 1, 1,
0.7118458, -1.510197, 2.243538, 0.4117647, 0, 1, 1,
0.7174159, -0.4299159, 2.089306, 0.4156863, 0, 1, 1,
0.7189361, -0.4248867, 2.853274, 0.4235294, 0, 1, 1,
0.7221243, -0.5897858, 3.583256, 0.427451, 0, 1, 1,
0.7241833, -0.2420781, 2.57874, 0.4352941, 0, 1, 1,
0.7254995, -1.092764, 1.406548, 0.4392157, 0, 1, 1,
0.7268527, 0.9912674, 0.1930947, 0.4470588, 0, 1, 1,
0.7335588, 0.1568775, 1.116739, 0.4509804, 0, 1, 1,
0.7336721, 0.3049581, 1.023684, 0.4588235, 0, 1, 1,
0.7372367, -0.1481266, -1.730084, 0.4627451, 0, 1, 1,
0.7382955, 0.591167, 1.181729, 0.4705882, 0, 1, 1,
0.7469786, -0.533222, 2.899564, 0.4745098, 0, 1, 1,
0.7473021, -0.1913769, -1.25807, 0.4823529, 0, 1, 1,
0.7510816, -1.356893, 1.629825, 0.4862745, 0, 1, 1,
0.7566496, 0.2310156, 1.556182, 0.4941176, 0, 1, 1,
0.7614837, 1.302699, 2.3373, 0.5019608, 0, 1, 1,
0.7643754, -0.09144272, 3.09687, 0.5058824, 0, 1, 1,
0.7657145, -0.1375064, 3.247139, 0.5137255, 0, 1, 1,
0.7727352, -1.689353, 1.937157, 0.5176471, 0, 1, 1,
0.7737189, -0.3888448, 2.229471, 0.5254902, 0, 1, 1,
0.7777014, 1.191854, 1.68505, 0.5294118, 0, 1, 1,
0.7777865, 1.840537, 0.1419514, 0.5372549, 0, 1, 1,
0.7781396, -1.696106, 4.062365, 0.5411765, 0, 1, 1,
0.7786753, -0.8634403, 2.315117, 0.5490196, 0, 1, 1,
0.7817538, 1.631135, -0.2882406, 0.5529412, 0, 1, 1,
0.7820407, -0.3560672, 2.544242, 0.5607843, 0, 1, 1,
0.7832205, -1.532767, 2.03589, 0.5647059, 0, 1, 1,
0.7838374, 0.5238782, -0.2603331, 0.572549, 0, 1, 1,
0.8011473, -1.034288, 1.99064, 0.5764706, 0, 1, 1,
0.8012968, 0.04610278, 0.9033481, 0.5843138, 0, 1, 1,
0.8053014, 0.1906839, 0.7392459, 0.5882353, 0, 1, 1,
0.8098044, -2.044252, 2.136581, 0.5960785, 0, 1, 1,
0.8127811, 1.077096, 1.101373, 0.6039216, 0, 1, 1,
0.8136401, -0.8008515, 1.944026, 0.6078432, 0, 1, 1,
0.8136704, 0.2979371, 0.8327797, 0.6156863, 0, 1, 1,
0.8175012, 0.7773044, -0.1347602, 0.6196079, 0, 1, 1,
0.822068, -0.224846, 1.609268, 0.627451, 0, 1, 1,
0.8221856, -0.006696827, 1.660278, 0.6313726, 0, 1, 1,
0.8275615, -1.109682, 2.865491, 0.6392157, 0, 1, 1,
0.8370432, 0.09813324, 2.654053, 0.6431373, 0, 1, 1,
0.8389809, 0.5508165, 1.895215, 0.6509804, 0, 1, 1,
0.8397797, 2.813803, 0.9099923, 0.654902, 0, 1, 1,
0.8446643, 0.275677, 2.04357, 0.6627451, 0, 1, 1,
0.8504795, -0.0536876, 0.8937363, 0.6666667, 0, 1, 1,
0.8541051, -0.796623, 1.774283, 0.6745098, 0, 1, 1,
0.8555251, 2.229733, 0.4306011, 0.6784314, 0, 1, 1,
0.8565177, 0.7151352, -1.320034, 0.6862745, 0, 1, 1,
0.8581777, -0.2903973, 1.002039, 0.6901961, 0, 1, 1,
0.8613381, -0.4222789, 1.515575, 0.6980392, 0, 1, 1,
0.8650264, 1.114654, -0.5409061, 0.7058824, 0, 1, 1,
0.8678229, 0.3126924, 1.029547, 0.7098039, 0, 1, 1,
0.872683, -0.2557408, 2.1709, 0.7176471, 0, 1, 1,
0.8764221, 0.2036038, 3.575018, 0.7215686, 0, 1, 1,
0.8790621, 0.171687, 1.580963, 0.7294118, 0, 1, 1,
0.8796681, -0.1861906, 1.543062, 0.7333333, 0, 1, 1,
0.883534, -0.2827968, -0.3482849, 0.7411765, 0, 1, 1,
0.8847775, -0.2878091, 3.613361, 0.7450981, 0, 1, 1,
0.8877997, 0.841501, 0.05488681, 0.7529412, 0, 1, 1,
0.890169, 0.1146552, 2.26412, 0.7568628, 0, 1, 1,
0.8945677, -0.9871213, 2.392118, 0.7647059, 0, 1, 1,
0.8969431, -0.7169188, 2.114307, 0.7686275, 0, 1, 1,
0.9021782, 0.1824865, 0.896814, 0.7764706, 0, 1, 1,
0.9063808, 0.4931395, 0.7669055, 0.7803922, 0, 1, 1,
0.9070728, 0.3022862, 1.060017, 0.7882353, 0, 1, 1,
0.9135119, -3.033545, 2.371636, 0.7921569, 0, 1, 1,
0.9190613, -0.1243414, 2.38328, 0.8, 0, 1, 1,
0.9227643, -0.06212873, 2.559231, 0.8078431, 0, 1, 1,
0.9238638, -0.2397402, 3.675195, 0.8117647, 0, 1, 1,
0.9245485, -0.7466131, 1.712101, 0.8196079, 0, 1, 1,
0.9336113, 0.2429979, 3.053633, 0.8235294, 0, 1, 1,
0.935873, 0.3116148, 1.23189, 0.8313726, 0, 1, 1,
0.9359437, 0.9282587, 1.253429, 0.8352941, 0, 1, 1,
0.9371397, -1.44172, 2.577993, 0.8431373, 0, 1, 1,
0.9487521, -0.2418937, 0.3276004, 0.8470588, 0, 1, 1,
0.9508964, 0.4080541, -1.006641, 0.854902, 0, 1, 1,
0.9523347, -0.3861957, 2.242578, 0.8588235, 0, 1, 1,
0.9558818, -0.5484017, 3.029068, 0.8666667, 0, 1, 1,
0.9621611, 0.4724869, 2.003564, 0.8705882, 0, 1, 1,
0.9637511, 0.1801697, 1.727314, 0.8784314, 0, 1, 1,
0.9655366, 0.5442852, 0.5069773, 0.8823529, 0, 1, 1,
0.9660495, -0.1770984, -1.545951, 0.8901961, 0, 1, 1,
0.9716355, -0.1374832, 0.2731332, 0.8941177, 0, 1, 1,
0.9720075, -0.2940883, 1.737211, 0.9019608, 0, 1, 1,
0.974435, -0.4935218, 2.420931, 0.9098039, 0, 1, 1,
0.9746534, 0.2536386, 1.317126, 0.9137255, 0, 1, 1,
0.9785541, 0.5865103, 1.043952, 0.9215686, 0, 1, 1,
0.978802, -0.02741554, 1.928147, 0.9254902, 0, 1, 1,
0.9845634, 1.336006, 0.04566127, 0.9333333, 0, 1, 1,
0.9853117, -1.996692, 2.729995, 0.9372549, 0, 1, 1,
0.9853747, 0.8871648, 1.064355, 0.945098, 0, 1, 1,
0.9899834, -0.1808588, 1.278936, 0.9490196, 0, 1, 1,
0.9943191, 0.1811569, 1.617937, 0.9568627, 0, 1, 1,
0.9947086, 2.048364, -0.2012686, 0.9607843, 0, 1, 1,
0.9990599, -0.06786664, 2.012925, 0.9686275, 0, 1, 1,
1.004158, 1.284248, -0.443509, 0.972549, 0, 1, 1,
1.01607, 0.4992639, 0.7045515, 0.9803922, 0, 1, 1,
1.016529, 0.6709555, 1.094044, 0.9843137, 0, 1, 1,
1.017104, 0.0008203426, 1.903414, 0.9921569, 0, 1, 1,
1.0225, -0.6447589, 2.263111, 0.9960784, 0, 1, 1,
1.023825, 0.5072747, 1.024174, 1, 0, 0.9960784, 1,
1.027043, -1.289076, 2.338071, 1, 0, 0.9882353, 1,
1.030743, -0.1503636, 1.371182, 1, 0, 0.9843137, 1,
1.034141, 0.6809367, -0.3859687, 1, 0, 0.9764706, 1,
1.037034, 0.0001300213, 1.786441, 1, 0, 0.972549, 1,
1.041222, 0.8519224, 1.046352, 1, 0, 0.9647059, 1,
1.046669, -0.512472, 3.407084, 1, 0, 0.9607843, 1,
1.047403, 0.4986466, 0.6198949, 1, 0, 0.9529412, 1,
1.048209, -0.4359955, 3.377913, 1, 0, 0.9490196, 1,
1.050381, -0.6291789, 1.878718, 1, 0, 0.9411765, 1,
1.052225, 0.7588453, -0.1786714, 1, 0, 0.9372549, 1,
1.054473, -0.5802754, 0.4089933, 1, 0, 0.9294118, 1,
1.054967, -1.009352, 1.332679, 1, 0, 0.9254902, 1,
1.059534, 2.541394, 1.253025, 1, 0, 0.9176471, 1,
1.060721, -0.1805663, 0.4920162, 1, 0, 0.9137255, 1,
1.075237, -0.1982458, 1.659036, 1, 0, 0.9058824, 1,
1.078874, 1.813546, 1.449847, 1, 0, 0.9019608, 1,
1.080212, 0.6198327, 0.9702937, 1, 0, 0.8941177, 1,
1.081333, -0.05455343, 2.809962, 1, 0, 0.8862745, 1,
1.08183, 1.104782, -1.078844, 1, 0, 0.8823529, 1,
1.085737, 1.404884, -0.2123076, 1, 0, 0.8745098, 1,
1.111518, -0.6293216, 2.102252, 1, 0, 0.8705882, 1,
1.117474, 2.211163, -0.2365039, 1, 0, 0.8627451, 1,
1.121147, -0.04409446, 1.881276, 1, 0, 0.8588235, 1,
1.12161, 0.2611074, 1.397529, 1, 0, 0.8509804, 1,
1.121844, -1.558488, 3.121459, 1, 0, 0.8470588, 1,
1.13734, 2.067938, -0.3718679, 1, 0, 0.8392157, 1,
1.139908, 1.281659, 3.479817, 1, 0, 0.8352941, 1,
1.141665, 0.1372991, 0.8991901, 1, 0, 0.827451, 1,
1.144022, 1.483926, 0.3748183, 1, 0, 0.8235294, 1,
1.14757, 0.4172754, 0.382399, 1, 0, 0.8156863, 1,
1.15186, 1.12986, 0.8214523, 1, 0, 0.8117647, 1,
1.158349, -2.23243, 2.098312, 1, 0, 0.8039216, 1,
1.161379, -0.4794912, 3.072347, 1, 0, 0.7960784, 1,
1.16556, -0.4161581, 2.69459, 1, 0, 0.7921569, 1,
1.16573, 0.4147401, 1.325667, 1, 0, 0.7843137, 1,
1.166256, -0.06220317, 2.710371, 1, 0, 0.7803922, 1,
1.175322, -1.318765, 2.948514, 1, 0, 0.772549, 1,
1.1868, -2.341934, 3.155331, 1, 0, 0.7686275, 1,
1.189787, -2.059546, 0.8697727, 1, 0, 0.7607843, 1,
1.191532, -0.2466279, 1.720934, 1, 0, 0.7568628, 1,
1.195509, 0.2184888, 1.561385, 1, 0, 0.7490196, 1,
1.195765, 0.4377219, 1.406284, 1, 0, 0.7450981, 1,
1.197162, 0.6992558, 0.2755304, 1, 0, 0.7372549, 1,
1.198777, 0.09205306, 2.179255, 1, 0, 0.7333333, 1,
1.200135, -1.283049, 0.07181882, 1, 0, 0.7254902, 1,
1.203403, -0.3704467, 2.24206, 1, 0, 0.7215686, 1,
1.205254, 1.529077, -0.7106898, 1, 0, 0.7137255, 1,
1.214403, 1.715501, -0.2142958, 1, 0, 0.7098039, 1,
1.223089, -1.077245, 2.207085, 1, 0, 0.7019608, 1,
1.234289, 0.006451867, 2.028303, 1, 0, 0.6941177, 1,
1.241483, 0.1325978, 2.426217, 1, 0, 0.6901961, 1,
1.242744, 0.5014146, 0.2456209, 1, 0, 0.682353, 1,
1.24813, -0.3512394, 2.303826, 1, 0, 0.6784314, 1,
1.251051, -1.583738, 1.709418, 1, 0, 0.6705883, 1,
1.251544, 1.601104, 1.989381, 1, 0, 0.6666667, 1,
1.25684, -1.147661, -0.5179291, 1, 0, 0.6588235, 1,
1.267348, -0.5413815, 0.9931314, 1, 0, 0.654902, 1,
1.269486, -0.4911401, 1.745205, 1, 0, 0.6470588, 1,
1.27299, 0.1751054, 0.2023906, 1, 0, 0.6431373, 1,
1.280918, 1.272377, 1.528935, 1, 0, 0.6352941, 1,
1.28232, 0.4192055, 3.252072, 1, 0, 0.6313726, 1,
1.282809, -1.322492, 2.230071, 1, 0, 0.6235294, 1,
1.285442, 0.05869886, 1.582635, 1, 0, 0.6196079, 1,
1.290382, -0.09289337, 1.049255, 1, 0, 0.6117647, 1,
1.300724, -0.0171505, 0.8869289, 1, 0, 0.6078432, 1,
1.306057, 0.5710177, 1.976482, 1, 0, 0.6, 1,
1.314903, -1.38234, 1.449525, 1, 0, 0.5921569, 1,
1.347528, 0.3115075, 0.755618, 1, 0, 0.5882353, 1,
1.352942, -1.583348, 5.113445, 1, 0, 0.5803922, 1,
1.360918, -0.9102088, 2.118789, 1, 0, 0.5764706, 1,
1.368625, 0.4007649, 1.015274, 1, 0, 0.5686275, 1,
1.385687, -0.5756837, 3.466793, 1, 0, 0.5647059, 1,
1.388521, -0.7855845, 2.707767, 1, 0, 0.5568628, 1,
1.390177, 1.540794, 1.49295, 1, 0, 0.5529412, 1,
1.402574, 0.6651257, 1.366706, 1, 0, 0.5450981, 1,
1.412459, -0.6627417, 2.38203, 1, 0, 0.5411765, 1,
1.41285, -1.423616, 2.1398, 1, 0, 0.5333334, 1,
1.416024, -0.7328505, 2.395451, 1, 0, 0.5294118, 1,
1.417873, 0.244047, 0.6757541, 1, 0, 0.5215687, 1,
1.41869, 0.1268349, 3.928999, 1, 0, 0.5176471, 1,
1.421697, 1.625969, 1.880899, 1, 0, 0.509804, 1,
1.424419, -1.127525, 1.471867, 1, 0, 0.5058824, 1,
1.435051, 2.233041, 0.7067399, 1, 0, 0.4980392, 1,
1.437546, -0.3001152, 2.034643, 1, 0, 0.4901961, 1,
1.440727, -1.18231, 0.6923085, 1, 0, 0.4862745, 1,
1.44229, 0.07335609, 1.314219, 1, 0, 0.4784314, 1,
1.449166, -1.07241, 3.470638, 1, 0, 0.4745098, 1,
1.453957, -0.9484692, 2.15965, 1, 0, 0.4666667, 1,
1.472825, 0.4182231, 1.034478, 1, 0, 0.4627451, 1,
1.47375, -0.1005896, 2.033873, 1, 0, 0.454902, 1,
1.488302, -1.379573, 2.875005, 1, 0, 0.4509804, 1,
1.505261, 0.6196745, 1.767584, 1, 0, 0.4431373, 1,
1.505438, 1.3591, 0.7293592, 1, 0, 0.4392157, 1,
1.508918, 0.4911071, 0.9171837, 1, 0, 0.4313726, 1,
1.534014, -0.5497829, 1.764173, 1, 0, 0.427451, 1,
1.536086, -0.4177019, 0.2640516, 1, 0, 0.4196078, 1,
1.539293, -0.7659905, 1.646776, 1, 0, 0.4156863, 1,
1.557615, 0.2821504, 1.267191, 1, 0, 0.4078431, 1,
1.563929, -0.8324295, 1.410686, 1, 0, 0.4039216, 1,
1.569269, 0.3199558, 1.766578, 1, 0, 0.3960784, 1,
1.585647, -0.3484542, 2.006083, 1, 0, 0.3882353, 1,
1.592541, 0.804059, 0.9523196, 1, 0, 0.3843137, 1,
1.611637, -0.1422493, 2.017481, 1, 0, 0.3764706, 1,
1.614093, -0.2756536, 1.602846, 1, 0, 0.372549, 1,
1.615451, -0.9487237, 2.374741, 1, 0, 0.3647059, 1,
1.622909, -0.7867188, 2.232704, 1, 0, 0.3607843, 1,
1.624495, 1.249834, 3.171794, 1, 0, 0.3529412, 1,
1.630182, 0.4330463, -0.1918727, 1, 0, 0.3490196, 1,
1.637633, -0.7203411, 2.969693, 1, 0, 0.3411765, 1,
1.651684, 0.2627787, 2.306649, 1, 0, 0.3372549, 1,
1.654571, -0.04050417, 0.4313792, 1, 0, 0.3294118, 1,
1.660678, -1.953896, 1.45872, 1, 0, 0.3254902, 1,
1.676509, 0.7644283, 1.091617, 1, 0, 0.3176471, 1,
1.700627, -0.05100536, 0.8729349, 1, 0, 0.3137255, 1,
1.715101, 0.4801861, 1.059306, 1, 0, 0.3058824, 1,
1.722207, -1.718719, 3.180778, 1, 0, 0.2980392, 1,
1.762884, 2.323327, -0.06578916, 1, 0, 0.2941177, 1,
1.770393, -0.830884, 4.570742, 1, 0, 0.2862745, 1,
1.783517, -1.020209, 1.650425, 1, 0, 0.282353, 1,
1.795931, 0.7403856, 1.235891, 1, 0, 0.2745098, 1,
1.803442, 0.9718927, -1.096698, 1, 0, 0.2705882, 1,
1.818816, -0.1477075, 3.818032, 1, 0, 0.2627451, 1,
1.832709, -0.5880199, 1.605409, 1, 0, 0.2588235, 1,
1.83447, -0.2542728, 1.58497, 1, 0, 0.2509804, 1,
1.843021, -0.3437175, 0.7802331, 1, 0, 0.2470588, 1,
1.855818, -1.080634, 4.348732, 1, 0, 0.2392157, 1,
1.89001, 0.3482953, 0.8513119, 1, 0, 0.2352941, 1,
1.911707, 0.05462017, 1.451072, 1, 0, 0.227451, 1,
1.913487, -1.117416, 1.166665, 1, 0, 0.2235294, 1,
1.933084, -1.428839, 1.874444, 1, 0, 0.2156863, 1,
1.953448, 0.661916, 2.067564, 1, 0, 0.2117647, 1,
1.957707, -3.082389, 2.270027, 1, 0, 0.2039216, 1,
1.959033, -0.2855586, 3.622781, 1, 0, 0.1960784, 1,
1.997183, -1.061258, 0.6037813, 1, 0, 0.1921569, 1,
2.020307, 0.8630028, 1.324461, 1, 0, 0.1843137, 1,
2.042431, 0.6203483, 2.172753, 1, 0, 0.1803922, 1,
2.061419, 1.282735, -0.5070409, 1, 0, 0.172549, 1,
2.066905, -0.7533668, 1.754312, 1, 0, 0.1686275, 1,
2.075547, -0.7472855, 2.278261, 1, 0, 0.1607843, 1,
2.099668, -0.4940784, 2.101595, 1, 0, 0.1568628, 1,
2.107028, -1.870541, 2.567601, 1, 0, 0.1490196, 1,
2.10709, 0.8885537, 1.433367, 1, 0, 0.145098, 1,
2.112917, 0.907205, 0.5559019, 1, 0, 0.1372549, 1,
2.126012, 0.7235134, 4.042397, 1, 0, 0.1333333, 1,
2.168813, 1.083336, 2.031717, 1, 0, 0.1254902, 1,
2.182183, 0.6083316, 2.009681, 1, 0, 0.1215686, 1,
2.208785, 0.3864001, 1.145285, 1, 0, 0.1137255, 1,
2.21058, 0.6690766, 0.4453727, 1, 0, 0.1098039, 1,
2.226613, -0.1752873, 3.190148, 1, 0, 0.1019608, 1,
2.253682, -0.626921, 0.5988744, 1, 0, 0.09411765, 1,
2.280492, -1.192288, 3.706369, 1, 0, 0.09019608, 1,
2.30415, -0.05204273, 2.043107, 1, 0, 0.08235294, 1,
2.342145, 0.4247091, 0.3709839, 1, 0, 0.07843138, 1,
2.360149, 1.753766, 3.007227, 1, 0, 0.07058824, 1,
2.360622, -1.074406, 1.605122, 1, 0, 0.06666667, 1,
2.374181, -0.6219341, 0.8542688, 1, 0, 0.05882353, 1,
2.400062, -1.448333, 3.966513, 1, 0, 0.05490196, 1,
2.423189, 1.184107, 0.6586838, 1, 0, 0.04705882, 1,
2.428662, 0.01976466, 0.9989185, 1, 0, 0.04313726, 1,
2.451782, 4.317839, 2.575659, 1, 0, 0.03529412, 1,
2.663107, 0.2600691, 2.052662, 1, 0, 0.03137255, 1,
2.688267, -1.453221, 2.091709, 1, 0, 0.02352941, 1,
2.707039, -0.07878957, 1.784788, 1, 0, 0.01960784, 1,
2.837181, 0.5128307, 1.670681, 1, 0, 0.01176471, 1,
3.01691, -0.9684983, 3.838665, 1, 0, 0.007843138, 1
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
-0.01989329, -4.651815, -7.017073, 0, -0.5, 0.5, 0.5,
-0.01989329, -4.651815, -7.017073, 1, -0.5, 0.5, 0.5,
-0.01989329, -4.651815, -7.017073, 1, 1.5, 0.5, 0.5,
-0.01989329, -4.651815, -7.017073, 0, 1.5, 0.5, 0.5
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
-4.086173, 0.4830146, -7.017073, 0, -0.5, 0.5, 0.5,
-4.086173, 0.4830146, -7.017073, 1, -0.5, 0.5, 0.5,
-4.086173, 0.4830146, -7.017073, 1, 1.5, 0.5, 0.5,
-4.086173, 0.4830146, -7.017073, 0, 1.5, 0.5, 0.5
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
-4.086173, -4.651815, -0.0220983, 0, -0.5, 0.5, 0.5,
-4.086173, -4.651815, -0.0220983, 1, -0.5, 0.5, 0.5,
-4.086173, -4.651815, -0.0220983, 1, 1.5, 0.5, 0.5,
-4.086173, -4.651815, -0.0220983, 0, 1.5, 0.5, 0.5
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
-3, -3.466855, -5.402848,
3, -3.466855, -5.402848,
-3, -3.466855, -5.402848,
-3, -3.664348, -5.671885,
-2, -3.466855, -5.402848,
-2, -3.664348, -5.671885,
-1, -3.466855, -5.402848,
-1, -3.664348, -5.671885,
0, -3.466855, -5.402848,
0, -3.664348, -5.671885,
1, -3.466855, -5.402848,
1, -3.664348, -5.671885,
2, -3.466855, -5.402848,
2, -3.664348, -5.671885,
3, -3.466855, -5.402848,
3, -3.664348, -5.671885
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
-3, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
-3, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
-3, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
-3, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
-2, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
-2, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
-2, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
-2, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
-1, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
-1, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
-1, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
-1, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
0, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
0, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
0, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
0, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
1, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
1, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
1, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
1, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
2, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
2, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
2, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
2, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5,
3, -4.059335, -6.20996, 0, -0.5, 0.5, 0.5,
3, -4.059335, -6.20996, 1, -0.5, 0.5, 0.5,
3, -4.059335, -6.20996, 1, 1.5, 0.5, 0.5,
3, -4.059335, -6.20996, 0, 1.5, 0.5, 0.5
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
-3.1478, -2, -5.402848,
-3.1478, 4, -5.402848,
-3.1478, -2, -5.402848,
-3.304196, -2, -5.671885,
-3.1478, 0, -5.402848,
-3.304196, 0, -5.671885,
-3.1478, 2, -5.402848,
-3.304196, 2, -5.671885,
-3.1478, 4, -5.402848,
-3.304196, 4, -5.671885
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
"2",
"4"
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
-3.616987, -2, -6.20996, 0, -0.5, 0.5, 0.5,
-3.616987, -2, -6.20996, 1, -0.5, 0.5, 0.5,
-3.616987, -2, -6.20996, 1, 1.5, 0.5, 0.5,
-3.616987, -2, -6.20996, 0, 1.5, 0.5, 0.5,
-3.616987, 0, -6.20996, 0, -0.5, 0.5, 0.5,
-3.616987, 0, -6.20996, 1, -0.5, 0.5, 0.5,
-3.616987, 0, -6.20996, 1, 1.5, 0.5, 0.5,
-3.616987, 0, -6.20996, 0, 1.5, 0.5, 0.5,
-3.616987, 2, -6.20996, 0, -0.5, 0.5, 0.5,
-3.616987, 2, -6.20996, 1, -0.5, 0.5, 0.5,
-3.616987, 2, -6.20996, 1, 1.5, 0.5, 0.5,
-3.616987, 2, -6.20996, 0, 1.5, 0.5, 0.5,
-3.616987, 4, -6.20996, 0, -0.5, 0.5, 0.5,
-3.616987, 4, -6.20996, 1, -0.5, 0.5, 0.5,
-3.616987, 4, -6.20996, 1, 1.5, 0.5, 0.5,
-3.616987, 4, -6.20996, 0, 1.5, 0.5, 0.5
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
-3.1478, -3.466855, -4,
-3.1478, -3.466855, 4,
-3.1478, -3.466855, -4,
-3.304196, -3.664348, -4,
-3.1478, -3.466855, -2,
-3.304196, -3.664348, -2,
-3.1478, -3.466855, 0,
-3.304196, -3.664348, 0,
-3.1478, -3.466855, 2,
-3.304196, -3.664348, 2,
-3.1478, -3.466855, 4,
-3.304196, -3.664348, 4
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
-3.616987, -4.059335, -4, 0, -0.5, 0.5, 0.5,
-3.616987, -4.059335, -4, 1, -0.5, 0.5, 0.5,
-3.616987, -4.059335, -4, 1, 1.5, 0.5, 0.5,
-3.616987, -4.059335, -4, 0, 1.5, 0.5, 0.5,
-3.616987, -4.059335, -2, 0, -0.5, 0.5, 0.5,
-3.616987, -4.059335, -2, 1, -0.5, 0.5, 0.5,
-3.616987, -4.059335, -2, 1, 1.5, 0.5, 0.5,
-3.616987, -4.059335, -2, 0, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 0, 0, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 0, 1, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 0, 1, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 0, 0, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 2, 0, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 2, 1, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 2, 1, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 2, 0, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 4, 0, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 4, 1, -0.5, 0.5, 0.5,
-3.616987, -4.059335, 4, 1, 1.5, 0.5, 0.5,
-3.616987, -4.059335, 4, 0, 1.5, 0.5, 0.5
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
-3.1478, -3.466855, -5.402848,
-3.1478, 4.432884, -5.402848,
-3.1478, -3.466855, 5.358651,
-3.1478, 4.432884, 5.358651,
-3.1478, -3.466855, -5.402848,
-3.1478, -3.466855, 5.358651,
-3.1478, 4.432884, -5.402848,
-3.1478, 4.432884, 5.358651,
-3.1478, -3.466855, -5.402848,
3.108014, -3.466855, -5.402848,
-3.1478, -3.466855, 5.358651,
3.108014, -3.466855, 5.358651,
-3.1478, 4.432884, -5.402848,
3.108014, 4.432884, -5.402848,
-3.1478, 4.432884, 5.358651,
3.108014, 4.432884, 5.358651,
3.108014, -3.466855, -5.402848,
3.108014, 4.432884, -5.402848,
3.108014, -3.466855, 5.358651,
3.108014, 4.432884, 5.358651,
3.108014, -3.466855, -5.402848,
3.108014, -3.466855, 5.358651,
3.108014, 4.432884, -5.402848,
3.108014, 4.432884, 5.358651
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
var radius = 7.872383;
var distance = 35.02512;
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
mvMatrix.translate( 0.01989329, -0.4830146, 0.0220983 );
mvMatrix.scale( 1.360618, 1.077476, 0.790947 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.02512);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Amitraz<-read.table("Amitraz.xyz")
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
-3.056696, 0.4087795, -1.314246, 0, 0, 1, 1, 1,
-2.732348, 1.184356, -3.91263, 1, 0, 0, 1, 1,
-2.698936, 0.05481359, 1.213585, 1, 0, 0, 1, 1,
-2.569503, -0.7116646, -0.8423652, 1, 0, 0, 1, 1,
-2.463965, -1.74023, -3.187422, 1, 0, 0, 1, 1,
-2.46159, 1.047292, -2.795515, 1, 0, 0, 1, 1,
-2.449996, 0.4344091, -1.920399, 0, 0, 0, 1, 1,
-2.317174, 1.699539, -1.966472, 0, 0, 0, 1, 1,
-2.316576, 1.072775, -2.207675, 0, 0, 0, 1, 1,
-2.294794, -0.481859, -1.199012, 0, 0, 0, 1, 1,
-2.200349, 0.5868547, 0.01975663, 0, 0, 0, 1, 1,
-2.188039, -0.6289701, -2.143302, 0, 0, 0, 1, 1,
-2.154944, 0.6503865, -1.478949, 0, 0, 0, 1, 1,
-2.147409, -1.335887, -0.8761814, 1, 1, 1, 1, 1,
-2.135835, -2.125185, -3.207865, 1, 1, 1, 1, 1,
-2.127863, -0.4298516, -2.199173, 1, 1, 1, 1, 1,
-2.098432, 0.205196, -0.5483979, 1, 1, 1, 1, 1,
-2.097652, 2.736703, 0.823274, 1, 1, 1, 1, 1,
-2.076431, 0.8120419, -2.36281, 1, 1, 1, 1, 1,
-2.065902, -0.6931061, -3.349311, 1, 1, 1, 1, 1,
-2.062687, -1.280772, -1.950735, 1, 1, 1, 1, 1,
-2.054631, 0.04116514, -0.4135137, 1, 1, 1, 1, 1,
-2.034114, -0.07022737, -2.46825, 1, 1, 1, 1, 1,
-1.985127, 1.055584, -1.98934, 1, 1, 1, 1, 1,
-1.984012, -1.314642, -0.3184913, 1, 1, 1, 1, 1,
-1.97069, -1.677786, -1.573864, 1, 1, 1, 1, 1,
-1.949521, -0.3176305, -1.790321, 1, 1, 1, 1, 1,
-1.941228, 0.1529902, -2.027057, 1, 1, 1, 1, 1,
-1.887658, -0.07984932, -2.031526, 0, 0, 1, 1, 1,
-1.869575, 0.451235, -0.2688856, 1, 0, 0, 1, 1,
-1.863727, 1.026521, -1.367144, 1, 0, 0, 1, 1,
-1.85291, 1.146775, -1.053404, 1, 0, 0, 1, 1,
-1.836588, -1.816831, -1.332738, 1, 0, 0, 1, 1,
-1.808084, -1.040867, -1.586372, 1, 0, 0, 1, 1,
-1.787656, -0.07529651, -0.4376355, 0, 0, 0, 1, 1,
-1.787386, 1.506996, -0.3705396, 0, 0, 0, 1, 1,
-1.759564, -0.6978874, 0.03586097, 0, 0, 0, 1, 1,
-1.758459, -0.6491997, -3.074244, 0, 0, 0, 1, 1,
-1.752866, 1.529741, 0.610682, 0, 0, 0, 1, 1,
-1.7487, 0.1558064, -1.209005, 0, 0, 0, 1, 1,
-1.718095, 0.1476385, -2.106431, 0, 0, 0, 1, 1,
-1.7043, 1.615949, 0.02216489, 1, 1, 1, 1, 1,
-1.700994, -0.5510439, -0.8507277, 1, 1, 1, 1, 1,
-1.699974, -0.1871165, -0.4477238, 1, 1, 1, 1, 1,
-1.68939, 0.1216827, -1.114084, 1, 1, 1, 1, 1,
-1.68326, -1.736671, -0.8684034, 1, 1, 1, 1, 1,
-1.668898, -0.302889, -1.423076, 1, 1, 1, 1, 1,
-1.668017, 0.4701779, -1.196779, 1, 1, 1, 1, 1,
-1.662578, 2.371651, -0.9786916, 1, 1, 1, 1, 1,
-1.661968, 1.437063, -0.8915073, 1, 1, 1, 1, 1,
-1.655864, -0.6628156, -3.031426, 1, 1, 1, 1, 1,
-1.651636, -0.7026583, -2.812324, 1, 1, 1, 1, 1,
-1.651414, -2.131891, -3.138643, 1, 1, 1, 1, 1,
-1.643564, -1.269211, -2.661782, 1, 1, 1, 1, 1,
-1.627153, 0.1718842, -0.1968751, 1, 1, 1, 1, 1,
-1.588916, -0.06668089, -1.183765, 1, 1, 1, 1, 1,
-1.569759, 0.3916661, 0.3971278, 0, 0, 1, 1, 1,
-1.542637, 0.7461234, -1.515251, 1, 0, 0, 1, 1,
-1.521882, -1.938582, -0.5162714, 1, 0, 0, 1, 1,
-1.514318, -1.835111, -2.382387, 1, 0, 0, 1, 1,
-1.508285, 0.4652986, -0.4231173, 1, 0, 0, 1, 1,
-1.506896, -1.09183, -2.232434, 1, 0, 0, 1, 1,
-1.502699, 0.8079534, -1.593331, 0, 0, 0, 1, 1,
-1.502417, -1.452953, -3.528473, 0, 0, 0, 1, 1,
-1.499572, 0.9543936, -1.989312, 0, 0, 0, 1, 1,
-1.494252, 2.181555, -1.164786, 0, 0, 0, 1, 1,
-1.490149, 0.8403406, -0.9576028, 0, 0, 0, 1, 1,
-1.490042, -3.35181, -0.6565353, 0, 0, 0, 1, 1,
-1.457468, -1.512312, -2.981282, 0, 0, 0, 1, 1,
-1.453391, 0.9400583, -2.23554, 1, 1, 1, 1, 1,
-1.450165, 0.101602, -2.66835, 1, 1, 1, 1, 1,
-1.425186, -0.9336447, -2.126395, 1, 1, 1, 1, 1,
-1.42002, 1.032552, 1.170085, 1, 1, 1, 1, 1,
-1.410391, -0.3907447, -1.618669, 1, 1, 1, 1, 1,
-1.405509, 1.217976, -0.2337317, 1, 1, 1, 1, 1,
-1.389946, 1.593136, -0.6018199, 1, 1, 1, 1, 1,
-1.389224, -0.5122896, -2.008193, 1, 1, 1, 1, 1,
-1.384103, 0.5487272, -0.3047446, 1, 1, 1, 1, 1,
-1.375731, 1.217985, -1.264132, 1, 1, 1, 1, 1,
-1.366803, 0.7155147, -0.7761863, 1, 1, 1, 1, 1,
-1.366156, -0.5205123, -1.567861, 1, 1, 1, 1, 1,
-1.364328, -1.244992, -1.537559, 1, 1, 1, 1, 1,
-1.356646, -0.3328766, -0.9845872, 1, 1, 1, 1, 1,
-1.355384, 1.324694, -1.719711, 1, 1, 1, 1, 1,
-1.34533, 0.6591077, -1.950602, 0, 0, 1, 1, 1,
-1.340262, 2.210602, -1.196869, 1, 0, 0, 1, 1,
-1.338125, -0.5843211, -2.776789, 1, 0, 0, 1, 1,
-1.320579, -2.033983, -1.330367, 1, 0, 0, 1, 1,
-1.316916, -0.1620154, -3.480243, 1, 0, 0, 1, 1,
-1.314001, -0.8930129, -3.8028, 1, 0, 0, 1, 1,
-1.311966, 0.05532707, -2.028011, 0, 0, 0, 1, 1,
-1.309149, -1.160215, -4.631227, 0, 0, 0, 1, 1,
-1.303854, -0.1840976, -0.7616533, 0, 0, 0, 1, 1,
-1.303691, -0.2914337, 0.07789368, 0, 0, 0, 1, 1,
-1.301567, 1.398919, -0.6148383, 0, 0, 0, 1, 1,
-1.300401, -0.6089664, -1.737659, 0, 0, 0, 1, 1,
-1.295604, -0.2320797, -2.350182, 0, 0, 0, 1, 1,
-1.294134, 0.9748095, -1.179943, 1, 1, 1, 1, 1,
-1.293118, 0.4583242, -1.922943, 1, 1, 1, 1, 1,
-1.293115, -1.055099, -2.165749, 1, 1, 1, 1, 1,
-1.281914, 1.177416, -1.958614, 1, 1, 1, 1, 1,
-1.278937, 0.4051405, -1.698083, 1, 1, 1, 1, 1,
-1.267249, -0.2508717, -1.517917, 1, 1, 1, 1, 1,
-1.263607, 0.60767, -1.036229, 1, 1, 1, 1, 1,
-1.256327, 1.354877, -0.2426814, 1, 1, 1, 1, 1,
-1.254402, 0.07253643, -1.497789, 1, 1, 1, 1, 1,
-1.242045, -0.2911564, -0.7499089, 1, 1, 1, 1, 1,
-1.225325, -0.4030683, -2.916215, 1, 1, 1, 1, 1,
-1.215011, 0.4600416, -1.899731, 1, 1, 1, 1, 1,
-1.21455, 0.9255064, -0.03128795, 1, 1, 1, 1, 1,
-1.206085, -1.163635, -2.675536, 1, 1, 1, 1, 1,
-1.205165, 0.1019556, -3.483243, 1, 1, 1, 1, 1,
-1.199752, 0.6152287, -2.220781, 0, 0, 1, 1, 1,
-1.1968, 1.190163, 1.153069, 1, 0, 0, 1, 1,
-1.193928, 0.1410133, -1.694356, 1, 0, 0, 1, 1,
-1.191101, -0.9014346, -1.964455, 1, 0, 0, 1, 1,
-1.187665, 0.8549228, -1.434155, 1, 0, 0, 1, 1,
-1.186712, -0.5163495, -2.542912, 1, 0, 0, 1, 1,
-1.178523, 0.4790465, -1.302914, 0, 0, 0, 1, 1,
-1.178232, -0.471179, -1.008432, 0, 0, 0, 1, 1,
-1.175717, -1.299789, -2.58182, 0, 0, 0, 1, 1,
-1.171994, 0.7027271, -2.085978, 0, 0, 0, 1, 1,
-1.162574, -0.1161165, -1.354157, 0, 0, 0, 1, 1,
-1.158032, -0.4351456, -1.75929, 0, 0, 0, 1, 1,
-1.155621, 0.3503249, -2.269725, 0, 0, 0, 1, 1,
-1.1459, -0.1133942, -1.887869, 1, 1, 1, 1, 1,
-1.144169, 1.37315, -1.067033, 1, 1, 1, 1, 1,
-1.134053, -0.3335722, -3.23314, 1, 1, 1, 1, 1,
-1.131058, -1.177437, -2.529402, 1, 1, 1, 1, 1,
-1.126605, 1.788719, -2.454468, 1, 1, 1, 1, 1,
-1.123043, 0.5444544, -0.5242567, 1, 1, 1, 1, 1,
-1.119797, -1.163075, -3.502908, 1, 1, 1, 1, 1,
-1.111371, -0.04233479, -0.8091299, 1, 1, 1, 1, 1,
-1.110403, -0.2388009, -1.689008, 1, 1, 1, 1, 1,
-1.10993, -0.9923533, -1.562392, 1, 1, 1, 1, 1,
-1.099223, 0.8695687, -2.956852, 1, 1, 1, 1, 1,
-1.098852, -2.045595, -2.733688, 1, 1, 1, 1, 1,
-1.098431, 1.95529, -1.398974, 1, 1, 1, 1, 1,
-1.097528, -0.8607684, -0.9040018, 1, 1, 1, 1, 1,
-1.091287, -1.252652, -2.865222, 1, 1, 1, 1, 1,
-1.090143, 0.5262956, 0.2616672, 0, 0, 1, 1, 1,
-1.077223, -0.3320691, -1.617273, 1, 0, 0, 1, 1,
-1.077052, -0.03299562, -3.320348, 1, 0, 0, 1, 1,
-1.076313, -0.4852271, -2.160545, 1, 0, 0, 1, 1,
-1.066309, 1.250435, -0.6738291, 1, 0, 0, 1, 1,
-1.064559, -0.3455952, -2.243817, 1, 0, 0, 1, 1,
-1.056073, 1.469781, -0.3584056, 0, 0, 0, 1, 1,
-1.045529, -1.062627, -2.170815, 0, 0, 0, 1, 1,
-1.039608, 0.4239205, -2.47745, 0, 0, 0, 1, 1,
-1.037976, -0.2548974, -1.301518, 0, 0, 0, 1, 1,
-1.03746, -1.014038, -0.5580806, 0, 0, 0, 1, 1,
-1.032683, 0.02935572, -1.495582, 0, 0, 0, 1, 1,
-1.009587, -1.264482, -2.894202, 0, 0, 0, 1, 1,
-1.00922, -1.400179, -2.411813, 1, 1, 1, 1, 1,
-1.001428, 0.270649, -1.846921, 1, 1, 1, 1, 1,
-0.9955739, 0.1794608, -1.649606, 1, 1, 1, 1, 1,
-0.9952264, 0.4571257, -0.4187455, 1, 1, 1, 1, 1,
-0.9835832, -1.278918, -2.508726, 1, 1, 1, 1, 1,
-0.9814075, -1.172284, -1.947597, 1, 1, 1, 1, 1,
-0.9813609, -0.9640357, -1.351633, 1, 1, 1, 1, 1,
-0.97597, 0.9884605, -1.686438, 1, 1, 1, 1, 1,
-0.9708323, -1.520859, -3.645763, 1, 1, 1, 1, 1,
-0.9676301, 0.004883988, -2.316764, 1, 1, 1, 1, 1,
-0.9634601, 2.162438, 0.4241625, 1, 1, 1, 1, 1,
-0.9474609, -1.671708, -1.789399, 1, 1, 1, 1, 1,
-0.946745, 1.31322, -1.343105, 1, 1, 1, 1, 1,
-0.9425883, -0.3080218, -2.36994, 1, 1, 1, 1, 1,
-0.94192, -1.489625, -2.368028, 1, 1, 1, 1, 1,
-0.9362153, -0.406104, -0.6930622, 0, 0, 1, 1, 1,
-0.93129, -1.030312, -3.156201, 1, 0, 0, 1, 1,
-0.9293073, -0.4481469, -1.397307, 1, 0, 0, 1, 1,
-0.928902, 0.172459, 0.5856259, 1, 0, 0, 1, 1,
-0.925133, 1.520388, -1.812769, 1, 0, 0, 1, 1,
-0.9175376, 0.5864155, -1.538185, 1, 0, 0, 1, 1,
-0.9139948, 1.668254, 0.2638591, 0, 0, 0, 1, 1,
-0.9031841, 1.001568, -1.020773, 0, 0, 0, 1, 1,
-0.8945544, -0.7286645, -1.983527, 0, 0, 0, 1, 1,
-0.8939437, -0.04756982, -0.1305882, 0, 0, 0, 1, 1,
-0.8815836, 0.3983171, -2.369738, 0, 0, 0, 1, 1,
-0.8722793, -0.8218929, -4.011954, 0, 0, 0, 1, 1,
-0.8699658, -0.2376661, -2.09692, 0, 0, 0, 1, 1,
-0.8630147, 0.2082129, -0.2462768, 1, 1, 1, 1, 1,
-0.8616927, -0.004092925, -2.265535, 1, 1, 1, 1, 1,
-0.8605455, 0.1708531, -1.53349, 1, 1, 1, 1, 1,
-0.8550087, -0.2082727, -2.493686, 1, 1, 1, 1, 1,
-0.8535607, 2.469079, 0.8167747, 1, 1, 1, 1, 1,
-0.8529587, -1.590004, -1.996293, 1, 1, 1, 1, 1,
-0.8493143, -0.4087405, -1.961153, 1, 1, 1, 1, 1,
-0.8469856, 1.801127, -1.703729, 1, 1, 1, 1, 1,
-0.8468163, -1.834532, -3.740902, 1, 1, 1, 1, 1,
-0.8434181, 0.541344, -0.7384768, 1, 1, 1, 1, 1,
-0.8423814, 0.7870123, -0.4089472, 1, 1, 1, 1, 1,
-0.8412428, -0.1683813, -2.426729, 1, 1, 1, 1, 1,
-0.8344991, -0.3034267, -1.30961, 1, 1, 1, 1, 1,
-0.8257812, -0.1164916, -2.625872, 1, 1, 1, 1, 1,
-0.8254996, 1.214052, -0.8912274, 1, 1, 1, 1, 1,
-0.8168463, 0.007697892, -2.594351, 0, 0, 1, 1, 1,
-0.8162328, -0.8724166, 0.1413247, 1, 0, 0, 1, 1,
-0.8144473, -1.23328, -2.65296, 1, 0, 0, 1, 1,
-0.8099421, 0.1537815, -1.867167, 1, 0, 0, 1, 1,
-0.8090372, 0.3783969, 1.18775, 1, 0, 0, 1, 1,
-0.8076595, -1.289416, -1.449037, 1, 0, 0, 1, 1,
-0.8035291, 1.322007, 0.7593719, 0, 0, 0, 1, 1,
-0.7937391, 0.7340737, -2.460429, 0, 0, 0, 1, 1,
-0.7802865, -1.375162, -2.535823, 0, 0, 0, 1, 1,
-0.7764995, 1.661596, -0.1625495, 0, 0, 0, 1, 1,
-0.7723842, 0.4563909, 0.4097193, 0, 0, 0, 1, 1,
-0.7660455, 0.4299599, -1.425664, 0, 0, 0, 1, 1,
-0.7463786, 0.301932, -1.289614, 0, 0, 0, 1, 1,
-0.7457491, -1.171663, -2.52423, 1, 1, 1, 1, 1,
-0.7433096, -1.013332, -3.469411, 1, 1, 1, 1, 1,
-0.7284861, -0.1593941, -1.738945, 1, 1, 1, 1, 1,
-0.7178203, 0.2193592, -1.19254, 1, 1, 1, 1, 1,
-0.7000623, -1.173553, -2.284693, 1, 1, 1, 1, 1,
-0.6982441, 0.1468921, -0.151046, 1, 1, 1, 1, 1,
-0.6973228, 1.844981, -0.6655081, 1, 1, 1, 1, 1,
-0.6950339, -1.992061, -2.400371, 1, 1, 1, 1, 1,
-0.6939981, 0.4110522, -1.452138, 1, 1, 1, 1, 1,
-0.6915666, -0.2590959, -2.704248, 1, 1, 1, 1, 1,
-0.6903608, 2.109576, 0.08259794, 1, 1, 1, 1, 1,
-0.6884747, 0.4685151, 1.660591, 1, 1, 1, 1, 1,
-0.6863099, -0.6558604, -2.409935, 1, 1, 1, 1, 1,
-0.6847757, -0.01096063, -1.715029, 1, 1, 1, 1, 1,
-0.6840951, 1.024497, 0.06224075, 1, 1, 1, 1, 1,
-0.6836909, 0.2024374, -0.435736, 0, 0, 1, 1, 1,
-0.6834597, -1.14202, -2.143729, 1, 0, 0, 1, 1,
-0.6834341, 1.113256, 0.3092445, 1, 0, 0, 1, 1,
-0.6772662, -0.9433331, -4.470412, 1, 0, 0, 1, 1,
-0.6759147, -0.3121906, -1.985426, 1, 0, 0, 1, 1,
-0.6699387, 0.3160914, -1.012892, 1, 0, 0, 1, 1,
-0.6687703, -0.7331077, -1.133162, 0, 0, 0, 1, 1,
-0.6648939, 0.707855, 0.2870666, 0, 0, 0, 1, 1,
-0.6612888, 2.214362, 0.9451578, 0, 0, 0, 1, 1,
-0.6598246, 1.066329, 0.3549192, 0, 0, 0, 1, 1,
-0.6529142, 0.465172, -2.881734, 0, 0, 0, 1, 1,
-0.6516536, -0.5781043, -3.574286, 0, 0, 0, 1, 1,
-0.6453333, 0.6885777, -0.436489, 0, 0, 0, 1, 1,
-0.644527, -2.22789, -0.3218212, 1, 1, 1, 1, 1,
-0.6407045, 1.841403, -0.6424096, 1, 1, 1, 1, 1,
-0.6387469, 0.6997552, -0.2829916, 1, 1, 1, 1, 1,
-0.6367476, 0.5306364, -0.9918233, 1, 1, 1, 1, 1,
-0.6315947, -1.464058, -2.517734, 1, 1, 1, 1, 1,
-0.6308455, -0.3116203, -0.766938, 1, 1, 1, 1, 1,
-0.6303048, -0.9725753, -2.261676, 1, 1, 1, 1, 1,
-0.626451, 0.1513177, -1.268584, 1, 1, 1, 1, 1,
-0.6186316, 0.5519567, -1.205359, 1, 1, 1, 1, 1,
-0.6179443, 1.241988, -0.6134272, 1, 1, 1, 1, 1,
-0.6124902, 1.16435, -0.2141701, 1, 1, 1, 1, 1,
-0.6049037, -0.8848432, -3.976604, 1, 1, 1, 1, 1,
-0.6037112, 0.1600824, -2.314419, 1, 1, 1, 1, 1,
-0.6019546, 0.5365869, 1.10013, 1, 1, 1, 1, 1,
-0.601178, 0.5401775, -1.920772, 1, 1, 1, 1, 1,
-0.6005907, 0.6266566, -1.391051, 0, 0, 1, 1, 1,
-0.6001422, -0.2463363, -2.805259, 1, 0, 0, 1, 1,
-0.5991611, 1.471176, -1.863857, 1, 0, 0, 1, 1,
-0.5990204, 0.5661554, -1.635731, 1, 0, 0, 1, 1,
-0.595659, 0.8830834, 0.3196163, 1, 0, 0, 1, 1,
-0.5955523, -1.150699, -2.092669, 1, 0, 0, 1, 1,
-0.5915909, -2.204516, -1.967077, 0, 0, 0, 1, 1,
-0.5899436, 1.672209, 0.6466376, 0, 0, 0, 1, 1,
-0.5846273, -2.32759, -4.03712, 0, 0, 0, 1, 1,
-0.5755568, 0.9389598, -0.2849597, 0, 0, 0, 1, 1,
-0.5750539, -0.3084027, -2.531859, 0, 0, 0, 1, 1,
-0.5713124, -0.8686451, -2.389852, 0, 0, 0, 1, 1,
-0.5711784, -1.544612, -2.510262, 0, 0, 0, 1, 1,
-0.5708808, 1.102158, -0.185752, 1, 1, 1, 1, 1,
-0.5687258, 0.4235022, -0.07937297, 1, 1, 1, 1, 1,
-0.5656371, -1.03568, -2.677865, 1, 1, 1, 1, 1,
-0.5640908, -0.373661, -2.818216, 1, 1, 1, 1, 1,
-0.5621016, -0.4810096, -1.989951, 1, 1, 1, 1, 1,
-0.5619818, 0.5410661, -0.2702062, 1, 1, 1, 1, 1,
-0.5617633, 1.061816, -1.509606, 1, 1, 1, 1, 1,
-0.5547081, 0.9477032, 0.214338, 1, 1, 1, 1, 1,
-0.5530934, 1.638779, -0.6894462, 1, 1, 1, 1, 1,
-0.5475953, -1.49365, -3.091996, 1, 1, 1, 1, 1,
-0.5343752, -3.083399, -2.198111, 1, 1, 1, 1, 1,
-0.5286794, -2.094546, -3.676162, 1, 1, 1, 1, 1,
-0.5274122, 0.2436783, -0.7697234, 1, 1, 1, 1, 1,
-0.5235165, -0.5270675, -1.462246, 1, 1, 1, 1, 1,
-0.5169167, -1.836992, -2.742894, 1, 1, 1, 1, 1,
-0.5135903, -0.7764406, -2.50975, 0, 0, 1, 1, 1,
-0.5130399, -0.653522, -1.824686, 1, 0, 0, 1, 1,
-0.5039698, -0.3671045, -2.310352, 1, 0, 0, 1, 1,
-0.502067, -1.077652, -1.607356, 1, 0, 0, 1, 1,
-0.4974038, -1.559898, -3.488132, 1, 0, 0, 1, 1,
-0.4892275, 0.9420683, 0.6483923, 1, 0, 0, 1, 1,
-0.4885658, -0.1258448, -2.192386, 0, 0, 0, 1, 1,
-0.4884822, 1.084154, 0.1677122, 0, 0, 0, 1, 1,
-0.4846996, 0.4860734, -1.003743, 0, 0, 0, 1, 1,
-0.4841293, -1.030518, -2.418105, 0, 0, 0, 1, 1,
-0.4824747, 1.67633, -0.5001815, 0, 0, 0, 1, 1,
-0.4815241, 0.4352644, -0.9978443, 0, 0, 0, 1, 1,
-0.4806248, 0.1322883, -0.8561101, 0, 0, 0, 1, 1,
-0.4777378, 0.0226556, -2.35638, 1, 1, 1, 1, 1,
-0.4775093, 0.9441488, -1.521055, 1, 1, 1, 1, 1,
-0.4732409, -0.1861635, -2.946328, 1, 1, 1, 1, 1,
-0.4667226, 0.6722631, 0.276441, 1, 1, 1, 1, 1,
-0.4655503, 0.01718314, -2.565098, 1, 1, 1, 1, 1,
-0.4596339, -0.5179662, -2.632911, 1, 1, 1, 1, 1,
-0.4538979, -0.8399194, -2.661621, 1, 1, 1, 1, 1,
-0.4519404, 0.592856, 0.8372223, 1, 1, 1, 1, 1,
-0.4499542, -0.8657601, -2.787441, 1, 1, 1, 1, 1,
-0.4466892, -0.03677243, -0.3893014, 1, 1, 1, 1, 1,
-0.4415167, 0.3891607, -1.441299, 1, 1, 1, 1, 1,
-0.4357553, -2.340035, -2.175418, 1, 1, 1, 1, 1,
-0.4325465, -0.3177217, -0.3573112, 1, 1, 1, 1, 1,
-0.4313548, 0.5911251, -0.7310774, 1, 1, 1, 1, 1,
-0.4270488, -1.622225, -2.92161, 1, 1, 1, 1, 1,
-0.4229139, -0.8812743, -4.518448, 0, 0, 1, 1, 1,
-0.4217226, -0.9051183, -2.017262, 1, 0, 0, 1, 1,
-0.4202113, -1.279856, -1.626428, 1, 0, 0, 1, 1,
-0.4188721, 0.05352001, -3.729522, 1, 0, 0, 1, 1,
-0.4182172, -0.9390466, -3.738854, 1, 0, 0, 1, 1,
-0.4168031, 0.7823932, 0.3471181, 1, 0, 0, 1, 1,
-0.4115749, 1.50076, -1.311379, 0, 0, 0, 1, 1,
-0.4103495, 0.5370343, -0.4562674, 0, 0, 0, 1, 1,
-0.4048687, 0.9993691, -0.2260412, 0, 0, 0, 1, 1,
-0.4009136, -0.7313108, -1.444191, 0, 0, 0, 1, 1,
-0.3971737, -0.6557947, -1.115582, 0, 0, 0, 1, 1,
-0.3965534, 0.06492396, -3.244479, 0, 0, 0, 1, 1,
-0.3947465, -0.2751248, -1.297348, 0, 0, 0, 1, 1,
-0.3925972, -1.648492, -2.977613, 1, 1, 1, 1, 1,
-0.3918304, -0.8205313, -3.636436, 1, 1, 1, 1, 1,
-0.3916148, 0.2002516, -2.248474, 1, 1, 1, 1, 1,
-0.3911522, -0.4151928, -3.173154, 1, 1, 1, 1, 1,
-0.3883842, -0.1553023, -0.8838835, 1, 1, 1, 1, 1,
-0.3815064, 1.969232, -1.691196, 1, 1, 1, 1, 1,
-0.3784286, -1.078978, -2.084728, 1, 1, 1, 1, 1,
-0.3772091, 0.5846203, -1.464384, 1, 1, 1, 1, 1,
-0.3767963, 0.3949841, -0.01902921, 1, 1, 1, 1, 1,
-0.3639423, -0.4614324, -1.630533, 1, 1, 1, 1, 1,
-0.3631945, 1.514181, 1.015608, 1, 1, 1, 1, 1,
-0.3615454, -0.1251311, -0.8242851, 1, 1, 1, 1, 1,
-0.3611361, -0.2912133, -2.786514, 1, 1, 1, 1, 1,
-0.3601448, -0.1852603, -2.408074, 1, 1, 1, 1, 1,
-0.3565429, 0.6848488, 0.2000715, 1, 1, 1, 1, 1,
-0.3552329, 0.01831247, -0.9324217, 0, 0, 1, 1, 1,
-0.3437954, 0.3065873, 0.8936962, 1, 0, 0, 1, 1,
-0.3432772, -1.586578, -4.386637, 1, 0, 0, 1, 1,
-0.3413131, -1.059901, -5.246127, 1, 0, 0, 1, 1,
-0.3373999, -1.208623, -2.424598, 1, 0, 0, 1, 1,
-0.3340588, 0.5312613, 0.5411471, 1, 0, 0, 1, 1,
-0.3240876, 1.585653, -0.4662673, 0, 0, 0, 1, 1,
-0.3198313, -1.943633, -5.2236, 0, 0, 0, 1, 1,
-0.3152436, -0.04652947, -0.8196499, 0, 0, 0, 1, 1,
-0.3127609, -0.841608, -2.080608, 0, 0, 0, 1, 1,
-0.3063214, 0.9090325, -0.3131894, 0, 0, 0, 1, 1,
-0.3028418, -1.864071, -4.455344, 0, 0, 0, 1, 1,
-0.2997587, -0.699823, -3.202816, 0, 0, 0, 1, 1,
-0.2984151, 0.9988794, -0.8140602, 1, 1, 1, 1, 1,
-0.294455, 0.5183251, 0.2886655, 1, 1, 1, 1, 1,
-0.2910464, 0.3968134, -0.851937, 1, 1, 1, 1, 1,
-0.2905988, 0.3517676, -1.066572, 1, 1, 1, 1, 1,
-0.2843373, 0.3607637, 0.2824486, 1, 1, 1, 1, 1,
-0.2820042, 0.8355872, -1.165962, 1, 1, 1, 1, 1,
-0.2804314, -0.6486002, -1.713603, 1, 1, 1, 1, 1,
-0.2801653, 1.012529, -1.578563, 1, 1, 1, 1, 1,
-0.2789556, 0.7182058, 0.5275423, 1, 1, 1, 1, 1,
-0.2762758, -0.2058493, -3.107075, 1, 1, 1, 1, 1,
-0.275107, -1.083173, -1.555109, 1, 1, 1, 1, 1,
-0.2749645, 1.527681, -0.08104378, 1, 1, 1, 1, 1,
-0.2745591, -0.913559, -1.012451, 1, 1, 1, 1, 1,
-0.2734686, -1.522749, -2.852738, 1, 1, 1, 1, 1,
-0.2674575, 0.2354541, -1.350627, 1, 1, 1, 1, 1,
-0.2662629, -0.1928226, -0.8563875, 0, 0, 1, 1, 1,
-0.2623719, -0.1170441, -1.667712, 1, 0, 0, 1, 1,
-0.2552296, -0.5721513, -1.92327, 1, 0, 0, 1, 1,
-0.2517599, 0.6041048, 0.601755, 1, 0, 0, 1, 1,
-0.2476115, -0.2197265, -1.368214, 1, 0, 0, 1, 1,
-0.242953, -0.3572754, -2.659334, 1, 0, 0, 1, 1,
-0.2428466, 0.5620163, 2.043786, 0, 0, 0, 1, 1,
-0.2417787, -1.527999, -3.133239, 0, 0, 0, 1, 1,
-0.2389423, -0.9137893, -3.143151, 0, 0, 0, 1, 1,
-0.2359916, 0.6667395, -0.3682851, 0, 0, 0, 1, 1,
-0.2344995, 0.4835728, -2.896154, 0, 0, 0, 1, 1,
-0.2306412, -0.6208056, -2.701592, 0, 0, 0, 1, 1,
-0.225245, 0.1341037, -2.365758, 0, 0, 0, 1, 1,
-0.2223643, 1.422866, -0.3684443, 1, 1, 1, 1, 1,
-0.2088283, -0.1960492, -4.067867, 1, 1, 1, 1, 1,
-0.2034701, -0.8360701, -2.729251, 1, 1, 1, 1, 1,
-0.1975382, -0.3773975, -2.238881, 1, 1, 1, 1, 1,
-0.1930203, 0.2734537, -2.943635, 1, 1, 1, 1, 1,
-0.1875173, -1.462175, -4.019802, 1, 1, 1, 1, 1,
-0.186187, -0.2559587, -2.91731, 1, 1, 1, 1, 1,
-0.1837785, -1.502473, -4.159404, 1, 1, 1, 1, 1,
-0.1798056, 1.114976, 0.7194515, 1, 1, 1, 1, 1,
-0.17866, 1.300512, 0.4255667, 1, 1, 1, 1, 1,
-0.1740028, -0.5672871, -3.832162, 1, 1, 1, 1, 1,
-0.1724782, 0.05133839, -2.470956, 1, 1, 1, 1, 1,
-0.1715658, 0.4436895, -1.267272, 1, 1, 1, 1, 1,
-0.1707845, -0.5487044, -2.730464, 1, 1, 1, 1, 1,
-0.1627086, -0.5079665, -3.575936, 1, 1, 1, 1, 1,
-0.1607596, -0.5861603, -2.056185, 0, 0, 1, 1, 1,
-0.1576226, -0.339149, -0.8526614, 1, 0, 0, 1, 1,
-0.1516593, 1.011926, -1.897324, 1, 0, 0, 1, 1,
-0.1490713, 0.8806621, -2.451251, 1, 0, 0, 1, 1,
-0.1483254, 0.461934, -2.700503, 1, 0, 0, 1, 1,
-0.1479382, 0.7653117, 0.2320577, 1, 0, 0, 1, 1,
-0.1478604, -0.3418015, -0.7101424, 0, 0, 0, 1, 1,
-0.1458148, -1.742862, -3.315295, 0, 0, 0, 1, 1,
-0.1423285, -0.7402788, -1.714568, 0, 0, 0, 1, 1,
-0.1396075, 0.151821, -0.4602776, 0, 0, 0, 1, 1,
-0.1362039, 0.9588539, 0.7737755, 0, 0, 0, 1, 1,
-0.1356581, -0.414935, -2.70523, 0, 0, 0, 1, 1,
-0.1323177, 1.890267, -0.02515828, 0, 0, 0, 1, 1,
-0.1320615, -1.29911, -4.182096, 1, 1, 1, 1, 1,
-0.1250441, 0.9136751, -2.035799, 1, 1, 1, 1, 1,
-0.123275, 1.073719, 0.9780995, 1, 1, 1, 1, 1,
-0.1208586, 0.1072415, -2.129092, 1, 1, 1, 1, 1,
-0.1202489, 1.139191, -0.3117188, 1, 1, 1, 1, 1,
-0.1092162, 0.5218049, -1.442124, 1, 1, 1, 1, 1,
-0.1087848, -0.1424258, -3.288516, 1, 1, 1, 1, 1,
-0.1049445, -0.9158617, -1.753235, 1, 1, 1, 1, 1,
-0.09998622, 1.152797, -0.9526237, 1, 1, 1, 1, 1,
-0.09912594, -0.08812749, -2.204468, 1, 1, 1, 1, 1,
-0.09003523, -0.4170854, -3.067748, 1, 1, 1, 1, 1,
-0.08915654, -0.53517, -3.505708, 1, 1, 1, 1, 1,
-0.08909663, -0.5354657, -3.55812, 1, 1, 1, 1, 1,
-0.08794731, 0.1074847, -1.764776, 1, 1, 1, 1, 1,
-0.08459024, 0.07857084, -0.7376547, 1, 1, 1, 1, 1,
-0.08044049, -1.431232, -2.970154, 0, 0, 1, 1, 1,
-0.07663735, -1.007906, -3.329335, 1, 0, 0, 1, 1,
-0.07427364, -0.8871488, -4.182484, 1, 0, 0, 1, 1,
-0.07365181, -0.3227211, -3.019722, 1, 0, 0, 1, 1,
-0.07031388, 0.6627457, -1.068438, 1, 0, 0, 1, 1,
-0.06947552, -1.310468, -3.339889, 1, 0, 0, 1, 1,
-0.06940485, 0.5655164, 0.3179677, 0, 0, 0, 1, 1,
-0.06791095, -1.361741, -3.968655, 0, 0, 0, 1, 1,
-0.06633962, -0.8109543, -1.001512, 0, 0, 0, 1, 1,
-0.06556918, -0.7130721, -2.891475, 0, 0, 0, 1, 1,
-0.06408618, 0.4483634, -1.039587, 0, 0, 0, 1, 1,
-0.06265511, -0.07334743, -3.180354, 0, 0, 0, 1, 1,
-0.06054105, 0.4853949, -0.3409149, 0, 0, 0, 1, 1,
-0.05912321, -0.3347198, -5.084442, 1, 1, 1, 1, 1,
-0.05845424, 0.5035799, 1.949339, 1, 1, 1, 1, 1,
-0.05644348, 0.2717494, -1.354888, 1, 1, 1, 1, 1,
-0.05409248, 0.8102321, 1.296382, 1, 1, 1, 1, 1,
-0.05395497, 1.023618, 0.2913609, 1, 1, 1, 1, 1,
-0.05350978, 0.06458046, -1.053468, 1, 1, 1, 1, 1,
-0.05199065, 0.7300863, 0.9938583, 1, 1, 1, 1, 1,
-0.04710213, -1.477858, -3.135429, 1, 1, 1, 1, 1,
-0.04556936, -0.8384401, -3.591486, 1, 1, 1, 1, 1,
-0.04234861, -0.9324448, -3.303598, 1, 1, 1, 1, 1,
-0.04233434, 0.964408, 0.4870217, 1, 1, 1, 1, 1,
-0.03559016, -0.6943158, -3.946416, 1, 1, 1, 1, 1,
-0.03247464, -0.3954156, -3.777515, 1, 1, 1, 1, 1,
-0.02666016, -0.2595091, -3.326856, 1, 1, 1, 1, 1,
-0.02557459, -0.2738248, -2.222816, 1, 1, 1, 1, 1,
-0.02533786, 1.245271, 0.8124871, 0, 0, 1, 1, 1,
-0.02405348, 0.4204238, -1.721823, 1, 0, 0, 1, 1,
-0.01985748, -0.2043452, -3.031652, 1, 0, 0, 1, 1,
-0.0164232, 0.03332152, 0.3540173, 1, 0, 0, 1, 1,
-0.01466718, -2.196426, -3.175273, 1, 0, 0, 1, 1,
-0.01461553, 1.423463, 0.5639206, 1, 0, 0, 1, 1,
-0.01220383, 0.001885263, -0.4281077, 0, 0, 0, 1, 1,
-0.01160153, -2.533198, -3.02494, 0, 0, 0, 1, 1,
-0.00975591, 0.08151048, -0.6477102, 0, 0, 0, 1, 1,
-0.009263061, -0.03333711, -3.463605, 0, 0, 0, 1, 1,
-0.009163837, -0.5344855, -3.971484, 0, 0, 0, 1, 1,
-0.007187895, 0.6090949, 0.3359547, 0, 0, 0, 1, 1,
-0.006234709, 1.883102, 0.01243541, 0, 0, 0, 1, 1,
-0.004209689, -0.5733725, -3.487579, 1, 1, 1, 1, 1,
-0.00276038, 1.670708, -0.820879, 1, 1, 1, 1, 1,
0.006026374, -1.458935, 3.10985, 1, 1, 1, 1, 1,
0.007738714, -0.0558644, 3.110949, 1, 1, 1, 1, 1,
0.009220445, 0.02157962, 1.596733, 1, 1, 1, 1, 1,
0.01155294, -0.2345229, 5.079036, 1, 1, 1, 1, 1,
0.01207044, -0.0860061, 4.312952, 1, 1, 1, 1, 1,
0.01406245, 0.8690169, -0.5535977, 1, 1, 1, 1, 1,
0.01546791, -0.7932164, 2.877131, 1, 1, 1, 1, 1,
0.01655662, 0.7160391, -0.1314104, 1, 1, 1, 1, 1,
0.02097156, -0.7130576, 2.680237, 1, 1, 1, 1, 1,
0.02300894, 0.4201439, -0.1968653, 1, 1, 1, 1, 1,
0.03344401, -0.9558985, 1.791966, 1, 1, 1, 1, 1,
0.03813799, 0.5936978, 0.2430533, 1, 1, 1, 1, 1,
0.03914471, 0.763558, -0.2397491, 1, 1, 1, 1, 1,
0.03979218, -0.1000731, 2.472824, 0, 0, 1, 1, 1,
0.0411986, 0.981924, 0.76768, 1, 0, 0, 1, 1,
0.04652975, 0.4674098, -0.2694964, 1, 0, 0, 1, 1,
0.04750141, 0.0384484, 0.2684738, 1, 0, 0, 1, 1,
0.04764089, -0.203982, 3.028075, 1, 0, 0, 1, 1,
0.05044057, 0.7461663, 0.7583377, 1, 0, 0, 1, 1,
0.0506528, 1.367892, -0.3081491, 0, 0, 0, 1, 1,
0.0511647, 1.29094, -0.5559629, 0, 0, 0, 1, 1,
0.05342462, -1.005216, 3.57015, 0, 0, 0, 1, 1,
0.05505477, -0.1316872, 1.947429, 0, 0, 0, 1, 1,
0.05584456, 0.9494957, 0.2202198, 0, 0, 0, 1, 1,
0.05693334, -0.4132392, 1.035472, 0, 0, 0, 1, 1,
0.05698368, 0.5155261, -0.5349727, 0, 0, 0, 1, 1,
0.06084445, 1.29041, -1.203767, 1, 1, 1, 1, 1,
0.06317938, -1.845605, 1.36082, 1, 1, 1, 1, 1,
0.06363152, -0.8323517, 3.353142, 1, 1, 1, 1, 1,
0.06391054, -1.011157, 1.688219, 1, 1, 1, 1, 1,
0.07238189, -0.5791056, 3.16218, 1, 1, 1, 1, 1,
0.07418502, 0.5329301, -0.3776988, 1, 1, 1, 1, 1,
0.08167918, -0.3710216, 3.09812, 1, 1, 1, 1, 1,
0.08521278, 0.09675792, 1.875059, 1, 1, 1, 1, 1,
0.08816516, -0.1605402, 3.48131, 1, 1, 1, 1, 1,
0.09099282, 1.37892, 2.131082, 1, 1, 1, 1, 1,
0.09105901, -1.129639, 2.969948, 1, 1, 1, 1, 1,
0.09191909, 0.4269068, -1.241242, 1, 1, 1, 1, 1,
0.09325762, 1.006395, -1.958926, 1, 1, 1, 1, 1,
0.09530208, 0.09819636, 0.8766314, 1, 1, 1, 1, 1,
0.09688565, 1.087985, 0.2680449, 1, 1, 1, 1, 1,
0.1068978, 1.577685, 0.09664451, 0, 0, 1, 1, 1,
0.1098936, -0.2797324, 3.002508, 1, 0, 0, 1, 1,
0.1118586, 0.2703519, 1.307915, 1, 0, 0, 1, 1,
0.1141847, 0.479469, -0.2922443, 1, 0, 0, 1, 1,
0.1169933, 0.1257732, -0.08563313, 1, 0, 0, 1, 1,
0.1243937, -0.03408521, 2.52469, 1, 0, 0, 1, 1,
0.1252261, -1.151535, 4.940806, 0, 0, 0, 1, 1,
0.1263872, 1.070105, -0.5317779, 0, 0, 0, 1, 1,
0.1275403, 0.9826611, 0.3871083, 0, 0, 0, 1, 1,
0.1276084, 0.5920014, -0.5537117, 0, 0, 0, 1, 1,
0.1281141, -0.2287394, 2.567925, 0, 0, 0, 1, 1,
0.1293052, -1.409981, 4.382648, 0, 0, 0, 1, 1,
0.1385934, -0.05133352, 3.057706, 0, 0, 0, 1, 1,
0.1410258, 0.6965728, 1.530627, 1, 1, 1, 1, 1,
0.1473016, 0.1323352, -0.08338055, 1, 1, 1, 1, 1,
0.1474438, 0.4308138, 2.432843, 1, 1, 1, 1, 1,
0.1480908, -0.008395021, 0.2907325, 1, 1, 1, 1, 1,
0.1551474, -0.624903, 1.465718, 1, 1, 1, 1, 1,
0.1594454, -1.821713, 1.487885, 1, 1, 1, 1, 1,
0.1642554, -0.3622221, 4.138591, 1, 1, 1, 1, 1,
0.1673558, 1.744631, -1.154955, 1, 1, 1, 1, 1,
0.1686861, 0.3783254, 1.00971, 1, 1, 1, 1, 1,
0.1704542, -0.9549718, 2.485573, 1, 1, 1, 1, 1,
0.1736382, 0.2905456, 0.6489074, 1, 1, 1, 1, 1,
0.1774449, 1.311614, 0.6494057, 1, 1, 1, 1, 1,
0.1786974, 0.9098045, -0.5833016, 1, 1, 1, 1, 1,
0.1809088, -0.470339, 1.896125, 1, 1, 1, 1, 1,
0.1819222, 0.348971, 2.363689, 1, 1, 1, 1, 1,
0.1859484, -0.1306943, 3.025608, 0, 0, 1, 1, 1,
0.1894126, -0.2339408, 3.237285, 1, 0, 0, 1, 1,
0.1939706, 1.19128, 0.7598364, 1, 0, 0, 1, 1,
0.1955843, 0.8617268, -0.4092889, 1, 0, 0, 1, 1,
0.1977998, -0.2240639, 2.382963, 1, 0, 0, 1, 1,
0.2014818, -1.022865, 2.668974, 1, 0, 0, 1, 1,
0.2024135, -1.723478, 0.9341947, 0, 0, 0, 1, 1,
0.2040375, 0.2567342, 0.9980493, 0, 0, 0, 1, 1,
0.2063332, -0.2806741, 1.514443, 0, 0, 0, 1, 1,
0.2093589, 1.687713, 1.066901, 0, 0, 0, 1, 1,
0.2096624, 0.3571264, -0.5504369, 0, 0, 0, 1, 1,
0.2133602, 0.3712787, -0.3784624, 0, 0, 0, 1, 1,
0.2141831, -0.6928215, 4.807823, 0, 0, 0, 1, 1,
0.2223754, -1.136492, 3.429754, 1, 1, 1, 1, 1,
0.2249154, 0.2520708, 0.5514812, 1, 1, 1, 1, 1,
0.2256691, -1.173568, 2.802093, 1, 1, 1, 1, 1,
0.225862, -3.191917, 2.45157, 1, 1, 1, 1, 1,
0.2267144, 0.4436046, 1.96304, 1, 1, 1, 1, 1,
0.2289729, 0.2933539, 0.4386725, 1, 1, 1, 1, 1,
0.2316254, 2.056536, -0.6756491, 1, 1, 1, 1, 1,
0.2318901, -0.3332779, 3.426052, 1, 1, 1, 1, 1,
0.2320112, -0.565102, 4.862946, 1, 1, 1, 1, 1,
0.2356444, 0.5678295, -0.2201385, 1, 1, 1, 1, 1,
0.2358312, 1.500071, -1.364966, 1, 1, 1, 1, 1,
0.2365567, 0.2486517, 1.71025, 1, 1, 1, 1, 1,
0.2369281, -0.6140791, 2.786154, 1, 1, 1, 1, 1,
0.2405216, -0.1425713, 1.065436, 1, 1, 1, 1, 1,
0.2418306, 0.5541424, -1.009861, 1, 1, 1, 1, 1,
0.2451318, -0.009847168, 1.724741, 0, 0, 1, 1, 1,
0.2491376, -0.7519779, 3.222767, 1, 0, 0, 1, 1,
0.2571087, -0.5497512, 2.949827, 1, 0, 0, 1, 1,
0.2588992, -1.15193, 1.94764, 1, 0, 0, 1, 1,
0.2590594, 0.09398619, -1.807329, 1, 0, 0, 1, 1,
0.2632789, -2.643147, 4.165192, 1, 0, 0, 1, 1,
0.2646266, 0.6143331, 1.476505, 0, 0, 0, 1, 1,
0.2687654, 0.4280255, -2.171586, 0, 0, 0, 1, 1,
0.2713451, 0.8156724, 0.8908443, 0, 0, 0, 1, 1,
0.2724288, -0.9969523, 4.164764, 0, 0, 0, 1, 1,
0.2733274, 1.389538, 0.2119028, 0, 0, 0, 1, 1,
0.2740875, 0.4895852, -0.08420698, 0, 0, 0, 1, 1,
0.2759542, 0.8068581, 1.404576, 0, 0, 0, 1, 1,
0.2777485, 0.3410437, 1.119445, 1, 1, 1, 1, 1,
0.2794366, 0.9584953, 1.918167, 1, 1, 1, 1, 1,
0.2819332, -0.8127902, 3.694097, 1, 1, 1, 1, 1,
0.282116, 0.4112139, -0.300314, 1, 1, 1, 1, 1,
0.2839834, 2.296312, 1.39217, 1, 1, 1, 1, 1,
0.286701, -0.2388989, 2.458458, 1, 1, 1, 1, 1,
0.2871369, -1.543326, 0.9926689, 1, 1, 1, 1, 1,
0.2900452, -0.4525578, 1.762823, 1, 1, 1, 1, 1,
0.2967811, -2.075813, 1.696954, 1, 1, 1, 1, 1,
0.2996317, -1.739008, 3.260096, 1, 1, 1, 1, 1,
0.3029201, -0.3430437, 0.5344172, 1, 1, 1, 1, 1,
0.3112048, 0.687467, 0.5949741, 1, 1, 1, 1, 1,
0.315686, 0.4278849, 0.9668371, 1, 1, 1, 1, 1,
0.3216917, -0.2376482, 2.41361, 1, 1, 1, 1, 1,
0.3228384, -0.4995158, 3.69347, 1, 1, 1, 1, 1,
0.3304554, 0.6661102, 0.5395372, 0, 0, 1, 1, 1,
0.3333399, -0.5541651, 2.644375, 1, 0, 0, 1, 1,
0.33401, -1.027329, 2.936989, 1, 0, 0, 1, 1,
0.3342136, 0.09348634, 1.999747, 1, 0, 0, 1, 1,
0.3373505, -0.9295692, 3.32132, 1, 0, 0, 1, 1,
0.3419347, -0.7790058, 0.3540812, 1, 0, 0, 1, 1,
0.3420467, -1.31321, 2.265019, 0, 0, 0, 1, 1,
0.3421244, -1.272522, 2.924991, 0, 0, 0, 1, 1,
0.345369, 0.4892949, -1.017274, 0, 0, 0, 1, 1,
0.349133, 1.780186, 0.3683424, 0, 0, 0, 1, 1,
0.3492648, 0.1137383, -0.13728, 0, 0, 0, 1, 1,
0.3532139, 0.259753, 0.6154523, 0, 0, 0, 1, 1,
0.3536966, -0.8142648, 2.221252, 0, 0, 0, 1, 1,
0.3540215, -0.01787854, 1.926399, 1, 1, 1, 1, 1,
0.3547231, -1.778414, 3.009819, 1, 1, 1, 1, 1,
0.3550572, -0.5710872, 2.241199, 1, 1, 1, 1, 1,
0.356576, 1.040552, 0.6181558, 1, 1, 1, 1, 1,
0.3572462, -0.7918847, 2.32548, 1, 1, 1, 1, 1,
0.3587863, 0.156712, 0.9218526, 1, 1, 1, 1, 1,
0.3597211, -1.069851, 2.084019, 1, 1, 1, 1, 1,
0.3630406, 0.2588785, 1.953725, 1, 1, 1, 1, 1,
0.3630891, 0.5052681, -0.1356958, 1, 1, 1, 1, 1,
0.3639776, -1.06013, 2.765655, 1, 1, 1, 1, 1,
0.3692063, 0.611451, 1.13065, 1, 1, 1, 1, 1,
0.3772424, -0.7386591, 3.430757, 1, 1, 1, 1, 1,
0.3807203, -1.151847, 1.905667, 1, 1, 1, 1, 1,
0.3831381, 0.3871197, 0.484916, 1, 1, 1, 1, 1,
0.38346, -0.1062897, 1.320738, 1, 1, 1, 1, 1,
0.3852134, 0.9548265, 0.4069107, 0, 0, 1, 1, 1,
0.3852763, 1.326021, 0.7591382, 1, 0, 0, 1, 1,
0.3904218, -0.06351829, 2.198228, 1, 0, 0, 1, 1,
0.3922273, 0.4879872, -0.5202987, 1, 0, 0, 1, 1,
0.3958022, 1.36223, -0.3195244, 1, 0, 0, 1, 1,
0.3998076, 0.5448219, -0.8914981, 1, 0, 0, 1, 1,
0.400378, 0.2628861, 1.530748, 0, 0, 0, 1, 1,
0.4004359, -0.6105594, 4.990441, 0, 0, 0, 1, 1,
0.4035049, -1.342613, 2.343714, 0, 0, 0, 1, 1,
0.4058462, 1.721487, -0.939879, 0, 0, 0, 1, 1,
0.4060488, 0.79255, -0.149186, 0, 0, 0, 1, 1,
0.4082007, 0.3730564, 1.60025, 0, 0, 0, 1, 1,
0.4113983, 0.6314414, 0.7380838, 0, 0, 0, 1, 1,
0.4134847, -0.8465713, 3.488386, 1, 1, 1, 1, 1,
0.4145303, -0.06360888, 2.138079, 1, 1, 1, 1, 1,
0.4150436, 0.4707464, 0.7561578, 1, 1, 1, 1, 1,
0.4165453, -1.728049, 2.693806, 1, 1, 1, 1, 1,
0.4221305, -0.1242676, 2.425387, 1, 1, 1, 1, 1,
0.4260472, 0.06924864, 1.543845, 1, 1, 1, 1, 1,
0.4288724, -0.1398904, 1.953335, 1, 1, 1, 1, 1,
0.434665, -0.8259396, 2.641088, 1, 1, 1, 1, 1,
0.4378882, 0.2706641, 2.056774, 1, 1, 1, 1, 1,
0.4397459, 0.2964624, 1.444394, 1, 1, 1, 1, 1,
0.44294, -2.376364, 3.147778, 1, 1, 1, 1, 1,
0.4501804, -0.5298907, 2.008473, 1, 1, 1, 1, 1,
0.4527667, 0.310886, 1.248968, 1, 1, 1, 1, 1,
0.4529043, 0.09522243, 0.8235454, 1, 1, 1, 1, 1,
0.4536433, 2.698652, -1.417325, 1, 1, 1, 1, 1,
0.4575197, 0.576871, -0.1511881, 0, 0, 1, 1, 1,
0.4588583, 0.810342, -0.1959216, 1, 0, 0, 1, 1,
0.465581, -0.03898035, 2.050079, 1, 0, 0, 1, 1,
0.4665379, -0.2098234, 3.129934, 1, 0, 0, 1, 1,
0.466875, 0.8451486, -0.9941536, 1, 0, 0, 1, 1,
0.4669445, -0.01952005, 2.668989, 1, 0, 0, 1, 1,
0.4771442, 1.122233, -1.191892, 0, 0, 0, 1, 1,
0.4785711, 1.100845, 1.257952, 0, 0, 0, 1, 1,
0.4876797, 0.8502222, -0.2419766, 0, 0, 0, 1, 1,
0.4903971, -0.8090506, 1.679735, 0, 0, 0, 1, 1,
0.496347, -1.099164, 2.903782, 0, 0, 0, 1, 1,
0.4968522, 0.9586664, 0.6218079, 0, 0, 0, 1, 1,
0.4981006, -1.119848, 4.375489, 0, 0, 0, 1, 1,
0.4987449, -2.039248, 3.272566, 1, 1, 1, 1, 1,
0.4988631, -0.8829073, 1.503902, 1, 1, 1, 1, 1,
0.4997693, -0.1388553, 1.605623, 1, 1, 1, 1, 1,
0.5025024, 0.4903548, 1.174521, 1, 1, 1, 1, 1,
0.5038258, 0.3935494, 1.134897, 1, 1, 1, 1, 1,
0.5101294, 0.6730859, 1.599265, 1, 1, 1, 1, 1,
0.5147859, 1.221127, 1.763627, 1, 1, 1, 1, 1,
0.5161694, -2.045369, 2.946513, 1, 1, 1, 1, 1,
0.5162547, -0.50369, 3.53811, 1, 1, 1, 1, 1,
0.5250776, 0.7022046, 1.157286, 1, 1, 1, 1, 1,
0.5255168, 2.226366, 0.6079825, 1, 1, 1, 1, 1,
0.5255192, -1.39143, 2.240281, 1, 1, 1, 1, 1,
0.5290077, -0.1290988, 1.02832, 1, 1, 1, 1, 1,
0.5299561, -0.391194, 3.036966, 1, 1, 1, 1, 1,
0.5311662, 0.4353515, 1.03015, 1, 1, 1, 1, 1,
0.5338147, -1.876292, 3.536847, 0, 0, 1, 1, 1,
0.5394578, 0.8633012, 0.9117892, 1, 0, 0, 1, 1,
0.5401179, -0.223076, 2.042884, 1, 0, 0, 1, 1,
0.5468148, -0.8843272, 4.448155, 1, 0, 0, 1, 1,
0.5468947, -2.311081, 2.183449, 1, 0, 0, 1, 1,
0.5533082, -0.04487327, 2.219568, 1, 0, 0, 1, 1,
0.5568748, -0.5701864, 2.939048, 0, 0, 0, 1, 1,
0.557711, 0.2796654, 0.8562133, 0, 0, 0, 1, 1,
0.5628264, 1.092557, -1.062391, 0, 0, 0, 1, 1,
0.5691788, 0.8138061, 0.962868, 0, 0, 0, 1, 1,
0.5721728, 0.6370631, 0.7840799, 0, 0, 0, 1, 1,
0.5729674, -0.4122089, 1.444436, 0, 0, 0, 1, 1,
0.5758033, -0.8766648, 1.617624, 0, 0, 0, 1, 1,
0.5760823, -0.1204939, 2.057652, 1, 1, 1, 1, 1,
0.5768723, -0.9091558, 1.144749, 1, 1, 1, 1, 1,
0.577482, -0.2147211, 2.06904, 1, 1, 1, 1, 1,
0.5781839, -0.1866244, -0.06434891, 1, 1, 1, 1, 1,
0.5791245, -1.982015, 2.626436, 1, 1, 1, 1, 1,
0.5863792, -0.6330017, 2.114583, 1, 1, 1, 1, 1,
0.5870724, 0.6089808, 0.9825583, 1, 1, 1, 1, 1,
0.588525, -0.5911031, 2.449317, 1, 1, 1, 1, 1,
0.5901595, -0.2819836, 3.665367, 1, 1, 1, 1, 1,
0.5941998, -2.083518, 3.03295, 1, 1, 1, 1, 1,
0.6034311, 1.077098, -0.457989, 1, 1, 1, 1, 1,
0.6038173, -0.379223, 0.7129782, 1, 1, 1, 1, 1,
0.6086916, -0.6748264, 3.363765, 1, 1, 1, 1, 1,
0.6094489, 1.42671, -0.4731437, 1, 1, 1, 1, 1,
0.6098005, 0.5500645, 2.361342, 1, 1, 1, 1, 1,
0.6125345, -0.3254366, 1.544285, 0, 0, 1, 1, 1,
0.6180187, -0.1711107, 2.281646, 1, 0, 0, 1, 1,
0.619872, 0.790874, -0.3086922, 1, 0, 0, 1, 1,
0.6282205, 0.3773784, 1.266441, 1, 0, 0, 1, 1,
0.6313344, -1.00001, 5.201931, 1, 0, 0, 1, 1,
0.6342368, 0.2387544, 1.443657, 1, 0, 0, 1, 1,
0.6352305, -0.6656571, 1.822954, 0, 0, 0, 1, 1,
0.6407362, 0.8281106, 3.103478, 0, 0, 0, 1, 1,
0.6419849, 0.3534545, 1.040888, 0, 0, 0, 1, 1,
0.6452301, 0.4640139, -0.2229215, 0, 0, 0, 1, 1,
0.6459912, -0.0788098, 1.651523, 0, 0, 0, 1, 1,
0.64786, 1.32895, 0.7801037, 0, 0, 0, 1, 1,
0.649232, -1.271152, 3.14868, 0, 0, 0, 1, 1,
0.6553842, -1.602103, 3.07333, 1, 1, 1, 1, 1,
0.6576635, 0.9652123, 0.9300627, 1, 1, 1, 1, 1,
0.6580809, 0.5970793, -0.02914949, 1, 1, 1, 1, 1,
0.6587381, -1.151911, 1.471739, 1, 1, 1, 1, 1,
0.6591105, 0.9384184, -0.8502111, 1, 1, 1, 1, 1,
0.6605675, -1.435791, 2.751378, 1, 1, 1, 1, 1,
0.6616238, -0.8717103, 2.600184, 1, 1, 1, 1, 1,
0.6662796, 0.1693274, 0.03140923, 1, 1, 1, 1, 1,
0.6741718, 1.131277, -0.09271517, 1, 1, 1, 1, 1,
0.6765362, 0.7579394, 2.523157, 1, 1, 1, 1, 1,
0.6782089, -2.321322, 2.894734, 1, 1, 1, 1, 1,
0.682819, -0.3472259, 0.5308371, 1, 1, 1, 1, 1,
0.6864652, -0.7026991, 4.952368, 1, 1, 1, 1, 1,
0.6921458, -0.8460094, 3.142649, 1, 1, 1, 1, 1,
0.69471, -1.334921, 2.282768, 1, 1, 1, 1, 1,
0.6951774, 0.07480665, 0.2588983, 0, 0, 1, 1, 1,
0.7001439, -1.306951, 1.675198, 1, 0, 0, 1, 1,
0.7006348, -0.09314825, 1.048759, 1, 0, 0, 1, 1,
0.7072325, -0.9152413, 2.374811, 1, 0, 0, 1, 1,
0.7081003, -0.6005386, 1.1926, 1, 0, 0, 1, 1,
0.7082295, 0.243753, 3.352543, 1, 0, 0, 1, 1,
0.711651, 2.053506, 1.764979, 0, 0, 0, 1, 1,
0.7118458, -1.510197, 2.243538, 0, 0, 0, 1, 1,
0.7174159, -0.4299159, 2.089306, 0, 0, 0, 1, 1,
0.7189361, -0.4248867, 2.853274, 0, 0, 0, 1, 1,
0.7221243, -0.5897858, 3.583256, 0, 0, 0, 1, 1,
0.7241833, -0.2420781, 2.57874, 0, 0, 0, 1, 1,
0.7254995, -1.092764, 1.406548, 0, 0, 0, 1, 1,
0.7268527, 0.9912674, 0.1930947, 1, 1, 1, 1, 1,
0.7335588, 0.1568775, 1.116739, 1, 1, 1, 1, 1,
0.7336721, 0.3049581, 1.023684, 1, 1, 1, 1, 1,
0.7372367, -0.1481266, -1.730084, 1, 1, 1, 1, 1,
0.7382955, 0.591167, 1.181729, 1, 1, 1, 1, 1,
0.7469786, -0.533222, 2.899564, 1, 1, 1, 1, 1,
0.7473021, -0.1913769, -1.25807, 1, 1, 1, 1, 1,
0.7510816, -1.356893, 1.629825, 1, 1, 1, 1, 1,
0.7566496, 0.2310156, 1.556182, 1, 1, 1, 1, 1,
0.7614837, 1.302699, 2.3373, 1, 1, 1, 1, 1,
0.7643754, -0.09144272, 3.09687, 1, 1, 1, 1, 1,
0.7657145, -0.1375064, 3.247139, 1, 1, 1, 1, 1,
0.7727352, -1.689353, 1.937157, 1, 1, 1, 1, 1,
0.7737189, -0.3888448, 2.229471, 1, 1, 1, 1, 1,
0.7777014, 1.191854, 1.68505, 1, 1, 1, 1, 1,
0.7777865, 1.840537, 0.1419514, 0, 0, 1, 1, 1,
0.7781396, -1.696106, 4.062365, 1, 0, 0, 1, 1,
0.7786753, -0.8634403, 2.315117, 1, 0, 0, 1, 1,
0.7817538, 1.631135, -0.2882406, 1, 0, 0, 1, 1,
0.7820407, -0.3560672, 2.544242, 1, 0, 0, 1, 1,
0.7832205, -1.532767, 2.03589, 1, 0, 0, 1, 1,
0.7838374, 0.5238782, -0.2603331, 0, 0, 0, 1, 1,
0.8011473, -1.034288, 1.99064, 0, 0, 0, 1, 1,
0.8012968, 0.04610278, 0.9033481, 0, 0, 0, 1, 1,
0.8053014, 0.1906839, 0.7392459, 0, 0, 0, 1, 1,
0.8098044, -2.044252, 2.136581, 0, 0, 0, 1, 1,
0.8127811, 1.077096, 1.101373, 0, 0, 0, 1, 1,
0.8136401, -0.8008515, 1.944026, 0, 0, 0, 1, 1,
0.8136704, 0.2979371, 0.8327797, 1, 1, 1, 1, 1,
0.8175012, 0.7773044, -0.1347602, 1, 1, 1, 1, 1,
0.822068, -0.224846, 1.609268, 1, 1, 1, 1, 1,
0.8221856, -0.006696827, 1.660278, 1, 1, 1, 1, 1,
0.8275615, -1.109682, 2.865491, 1, 1, 1, 1, 1,
0.8370432, 0.09813324, 2.654053, 1, 1, 1, 1, 1,
0.8389809, 0.5508165, 1.895215, 1, 1, 1, 1, 1,
0.8397797, 2.813803, 0.9099923, 1, 1, 1, 1, 1,
0.8446643, 0.275677, 2.04357, 1, 1, 1, 1, 1,
0.8504795, -0.0536876, 0.8937363, 1, 1, 1, 1, 1,
0.8541051, -0.796623, 1.774283, 1, 1, 1, 1, 1,
0.8555251, 2.229733, 0.4306011, 1, 1, 1, 1, 1,
0.8565177, 0.7151352, -1.320034, 1, 1, 1, 1, 1,
0.8581777, -0.2903973, 1.002039, 1, 1, 1, 1, 1,
0.8613381, -0.4222789, 1.515575, 1, 1, 1, 1, 1,
0.8650264, 1.114654, -0.5409061, 0, 0, 1, 1, 1,
0.8678229, 0.3126924, 1.029547, 1, 0, 0, 1, 1,
0.872683, -0.2557408, 2.1709, 1, 0, 0, 1, 1,
0.8764221, 0.2036038, 3.575018, 1, 0, 0, 1, 1,
0.8790621, 0.171687, 1.580963, 1, 0, 0, 1, 1,
0.8796681, -0.1861906, 1.543062, 1, 0, 0, 1, 1,
0.883534, -0.2827968, -0.3482849, 0, 0, 0, 1, 1,
0.8847775, -0.2878091, 3.613361, 0, 0, 0, 1, 1,
0.8877997, 0.841501, 0.05488681, 0, 0, 0, 1, 1,
0.890169, 0.1146552, 2.26412, 0, 0, 0, 1, 1,
0.8945677, -0.9871213, 2.392118, 0, 0, 0, 1, 1,
0.8969431, -0.7169188, 2.114307, 0, 0, 0, 1, 1,
0.9021782, 0.1824865, 0.896814, 0, 0, 0, 1, 1,
0.9063808, 0.4931395, 0.7669055, 1, 1, 1, 1, 1,
0.9070728, 0.3022862, 1.060017, 1, 1, 1, 1, 1,
0.9135119, -3.033545, 2.371636, 1, 1, 1, 1, 1,
0.9190613, -0.1243414, 2.38328, 1, 1, 1, 1, 1,
0.9227643, -0.06212873, 2.559231, 1, 1, 1, 1, 1,
0.9238638, -0.2397402, 3.675195, 1, 1, 1, 1, 1,
0.9245485, -0.7466131, 1.712101, 1, 1, 1, 1, 1,
0.9336113, 0.2429979, 3.053633, 1, 1, 1, 1, 1,
0.935873, 0.3116148, 1.23189, 1, 1, 1, 1, 1,
0.9359437, 0.9282587, 1.253429, 1, 1, 1, 1, 1,
0.9371397, -1.44172, 2.577993, 1, 1, 1, 1, 1,
0.9487521, -0.2418937, 0.3276004, 1, 1, 1, 1, 1,
0.9508964, 0.4080541, -1.006641, 1, 1, 1, 1, 1,
0.9523347, -0.3861957, 2.242578, 1, 1, 1, 1, 1,
0.9558818, -0.5484017, 3.029068, 1, 1, 1, 1, 1,
0.9621611, 0.4724869, 2.003564, 0, 0, 1, 1, 1,
0.9637511, 0.1801697, 1.727314, 1, 0, 0, 1, 1,
0.9655366, 0.5442852, 0.5069773, 1, 0, 0, 1, 1,
0.9660495, -0.1770984, -1.545951, 1, 0, 0, 1, 1,
0.9716355, -0.1374832, 0.2731332, 1, 0, 0, 1, 1,
0.9720075, -0.2940883, 1.737211, 1, 0, 0, 1, 1,
0.974435, -0.4935218, 2.420931, 0, 0, 0, 1, 1,
0.9746534, 0.2536386, 1.317126, 0, 0, 0, 1, 1,
0.9785541, 0.5865103, 1.043952, 0, 0, 0, 1, 1,
0.978802, -0.02741554, 1.928147, 0, 0, 0, 1, 1,
0.9845634, 1.336006, 0.04566127, 0, 0, 0, 1, 1,
0.9853117, -1.996692, 2.729995, 0, 0, 0, 1, 1,
0.9853747, 0.8871648, 1.064355, 0, 0, 0, 1, 1,
0.9899834, -0.1808588, 1.278936, 1, 1, 1, 1, 1,
0.9943191, 0.1811569, 1.617937, 1, 1, 1, 1, 1,
0.9947086, 2.048364, -0.2012686, 1, 1, 1, 1, 1,
0.9990599, -0.06786664, 2.012925, 1, 1, 1, 1, 1,
1.004158, 1.284248, -0.443509, 1, 1, 1, 1, 1,
1.01607, 0.4992639, 0.7045515, 1, 1, 1, 1, 1,
1.016529, 0.6709555, 1.094044, 1, 1, 1, 1, 1,
1.017104, 0.0008203426, 1.903414, 1, 1, 1, 1, 1,
1.0225, -0.6447589, 2.263111, 1, 1, 1, 1, 1,
1.023825, 0.5072747, 1.024174, 1, 1, 1, 1, 1,
1.027043, -1.289076, 2.338071, 1, 1, 1, 1, 1,
1.030743, -0.1503636, 1.371182, 1, 1, 1, 1, 1,
1.034141, 0.6809367, -0.3859687, 1, 1, 1, 1, 1,
1.037034, 0.0001300213, 1.786441, 1, 1, 1, 1, 1,
1.041222, 0.8519224, 1.046352, 1, 1, 1, 1, 1,
1.046669, -0.512472, 3.407084, 0, 0, 1, 1, 1,
1.047403, 0.4986466, 0.6198949, 1, 0, 0, 1, 1,
1.048209, -0.4359955, 3.377913, 1, 0, 0, 1, 1,
1.050381, -0.6291789, 1.878718, 1, 0, 0, 1, 1,
1.052225, 0.7588453, -0.1786714, 1, 0, 0, 1, 1,
1.054473, -0.5802754, 0.4089933, 1, 0, 0, 1, 1,
1.054967, -1.009352, 1.332679, 0, 0, 0, 1, 1,
1.059534, 2.541394, 1.253025, 0, 0, 0, 1, 1,
1.060721, -0.1805663, 0.4920162, 0, 0, 0, 1, 1,
1.075237, -0.1982458, 1.659036, 0, 0, 0, 1, 1,
1.078874, 1.813546, 1.449847, 0, 0, 0, 1, 1,
1.080212, 0.6198327, 0.9702937, 0, 0, 0, 1, 1,
1.081333, -0.05455343, 2.809962, 0, 0, 0, 1, 1,
1.08183, 1.104782, -1.078844, 1, 1, 1, 1, 1,
1.085737, 1.404884, -0.2123076, 1, 1, 1, 1, 1,
1.111518, -0.6293216, 2.102252, 1, 1, 1, 1, 1,
1.117474, 2.211163, -0.2365039, 1, 1, 1, 1, 1,
1.121147, -0.04409446, 1.881276, 1, 1, 1, 1, 1,
1.12161, 0.2611074, 1.397529, 1, 1, 1, 1, 1,
1.121844, -1.558488, 3.121459, 1, 1, 1, 1, 1,
1.13734, 2.067938, -0.3718679, 1, 1, 1, 1, 1,
1.139908, 1.281659, 3.479817, 1, 1, 1, 1, 1,
1.141665, 0.1372991, 0.8991901, 1, 1, 1, 1, 1,
1.144022, 1.483926, 0.3748183, 1, 1, 1, 1, 1,
1.14757, 0.4172754, 0.382399, 1, 1, 1, 1, 1,
1.15186, 1.12986, 0.8214523, 1, 1, 1, 1, 1,
1.158349, -2.23243, 2.098312, 1, 1, 1, 1, 1,
1.161379, -0.4794912, 3.072347, 1, 1, 1, 1, 1,
1.16556, -0.4161581, 2.69459, 0, 0, 1, 1, 1,
1.16573, 0.4147401, 1.325667, 1, 0, 0, 1, 1,
1.166256, -0.06220317, 2.710371, 1, 0, 0, 1, 1,
1.175322, -1.318765, 2.948514, 1, 0, 0, 1, 1,
1.1868, -2.341934, 3.155331, 1, 0, 0, 1, 1,
1.189787, -2.059546, 0.8697727, 1, 0, 0, 1, 1,
1.191532, -0.2466279, 1.720934, 0, 0, 0, 1, 1,
1.195509, 0.2184888, 1.561385, 0, 0, 0, 1, 1,
1.195765, 0.4377219, 1.406284, 0, 0, 0, 1, 1,
1.197162, 0.6992558, 0.2755304, 0, 0, 0, 1, 1,
1.198777, 0.09205306, 2.179255, 0, 0, 0, 1, 1,
1.200135, -1.283049, 0.07181882, 0, 0, 0, 1, 1,
1.203403, -0.3704467, 2.24206, 0, 0, 0, 1, 1,
1.205254, 1.529077, -0.7106898, 1, 1, 1, 1, 1,
1.214403, 1.715501, -0.2142958, 1, 1, 1, 1, 1,
1.223089, -1.077245, 2.207085, 1, 1, 1, 1, 1,
1.234289, 0.006451867, 2.028303, 1, 1, 1, 1, 1,
1.241483, 0.1325978, 2.426217, 1, 1, 1, 1, 1,
1.242744, 0.5014146, 0.2456209, 1, 1, 1, 1, 1,
1.24813, -0.3512394, 2.303826, 1, 1, 1, 1, 1,
1.251051, -1.583738, 1.709418, 1, 1, 1, 1, 1,
1.251544, 1.601104, 1.989381, 1, 1, 1, 1, 1,
1.25684, -1.147661, -0.5179291, 1, 1, 1, 1, 1,
1.267348, -0.5413815, 0.9931314, 1, 1, 1, 1, 1,
1.269486, -0.4911401, 1.745205, 1, 1, 1, 1, 1,
1.27299, 0.1751054, 0.2023906, 1, 1, 1, 1, 1,
1.280918, 1.272377, 1.528935, 1, 1, 1, 1, 1,
1.28232, 0.4192055, 3.252072, 1, 1, 1, 1, 1,
1.282809, -1.322492, 2.230071, 0, 0, 1, 1, 1,
1.285442, 0.05869886, 1.582635, 1, 0, 0, 1, 1,
1.290382, -0.09289337, 1.049255, 1, 0, 0, 1, 1,
1.300724, -0.0171505, 0.8869289, 1, 0, 0, 1, 1,
1.306057, 0.5710177, 1.976482, 1, 0, 0, 1, 1,
1.314903, -1.38234, 1.449525, 1, 0, 0, 1, 1,
1.347528, 0.3115075, 0.755618, 0, 0, 0, 1, 1,
1.352942, -1.583348, 5.113445, 0, 0, 0, 1, 1,
1.360918, -0.9102088, 2.118789, 0, 0, 0, 1, 1,
1.368625, 0.4007649, 1.015274, 0, 0, 0, 1, 1,
1.385687, -0.5756837, 3.466793, 0, 0, 0, 1, 1,
1.388521, -0.7855845, 2.707767, 0, 0, 0, 1, 1,
1.390177, 1.540794, 1.49295, 0, 0, 0, 1, 1,
1.402574, 0.6651257, 1.366706, 1, 1, 1, 1, 1,
1.412459, -0.6627417, 2.38203, 1, 1, 1, 1, 1,
1.41285, -1.423616, 2.1398, 1, 1, 1, 1, 1,
1.416024, -0.7328505, 2.395451, 1, 1, 1, 1, 1,
1.417873, 0.244047, 0.6757541, 1, 1, 1, 1, 1,
1.41869, 0.1268349, 3.928999, 1, 1, 1, 1, 1,
1.421697, 1.625969, 1.880899, 1, 1, 1, 1, 1,
1.424419, -1.127525, 1.471867, 1, 1, 1, 1, 1,
1.435051, 2.233041, 0.7067399, 1, 1, 1, 1, 1,
1.437546, -0.3001152, 2.034643, 1, 1, 1, 1, 1,
1.440727, -1.18231, 0.6923085, 1, 1, 1, 1, 1,
1.44229, 0.07335609, 1.314219, 1, 1, 1, 1, 1,
1.449166, -1.07241, 3.470638, 1, 1, 1, 1, 1,
1.453957, -0.9484692, 2.15965, 1, 1, 1, 1, 1,
1.472825, 0.4182231, 1.034478, 1, 1, 1, 1, 1,
1.47375, -0.1005896, 2.033873, 0, 0, 1, 1, 1,
1.488302, -1.379573, 2.875005, 1, 0, 0, 1, 1,
1.505261, 0.6196745, 1.767584, 1, 0, 0, 1, 1,
1.505438, 1.3591, 0.7293592, 1, 0, 0, 1, 1,
1.508918, 0.4911071, 0.9171837, 1, 0, 0, 1, 1,
1.534014, -0.5497829, 1.764173, 1, 0, 0, 1, 1,
1.536086, -0.4177019, 0.2640516, 0, 0, 0, 1, 1,
1.539293, -0.7659905, 1.646776, 0, 0, 0, 1, 1,
1.557615, 0.2821504, 1.267191, 0, 0, 0, 1, 1,
1.563929, -0.8324295, 1.410686, 0, 0, 0, 1, 1,
1.569269, 0.3199558, 1.766578, 0, 0, 0, 1, 1,
1.585647, -0.3484542, 2.006083, 0, 0, 0, 1, 1,
1.592541, 0.804059, 0.9523196, 0, 0, 0, 1, 1,
1.611637, -0.1422493, 2.017481, 1, 1, 1, 1, 1,
1.614093, -0.2756536, 1.602846, 1, 1, 1, 1, 1,
1.615451, -0.9487237, 2.374741, 1, 1, 1, 1, 1,
1.622909, -0.7867188, 2.232704, 1, 1, 1, 1, 1,
1.624495, 1.249834, 3.171794, 1, 1, 1, 1, 1,
1.630182, 0.4330463, -0.1918727, 1, 1, 1, 1, 1,
1.637633, -0.7203411, 2.969693, 1, 1, 1, 1, 1,
1.651684, 0.2627787, 2.306649, 1, 1, 1, 1, 1,
1.654571, -0.04050417, 0.4313792, 1, 1, 1, 1, 1,
1.660678, -1.953896, 1.45872, 1, 1, 1, 1, 1,
1.676509, 0.7644283, 1.091617, 1, 1, 1, 1, 1,
1.700627, -0.05100536, 0.8729349, 1, 1, 1, 1, 1,
1.715101, 0.4801861, 1.059306, 1, 1, 1, 1, 1,
1.722207, -1.718719, 3.180778, 1, 1, 1, 1, 1,
1.762884, 2.323327, -0.06578916, 1, 1, 1, 1, 1,
1.770393, -0.830884, 4.570742, 0, 0, 1, 1, 1,
1.783517, -1.020209, 1.650425, 1, 0, 0, 1, 1,
1.795931, 0.7403856, 1.235891, 1, 0, 0, 1, 1,
1.803442, 0.9718927, -1.096698, 1, 0, 0, 1, 1,
1.818816, -0.1477075, 3.818032, 1, 0, 0, 1, 1,
1.832709, -0.5880199, 1.605409, 1, 0, 0, 1, 1,
1.83447, -0.2542728, 1.58497, 0, 0, 0, 1, 1,
1.843021, -0.3437175, 0.7802331, 0, 0, 0, 1, 1,
1.855818, -1.080634, 4.348732, 0, 0, 0, 1, 1,
1.89001, 0.3482953, 0.8513119, 0, 0, 0, 1, 1,
1.911707, 0.05462017, 1.451072, 0, 0, 0, 1, 1,
1.913487, -1.117416, 1.166665, 0, 0, 0, 1, 1,
1.933084, -1.428839, 1.874444, 0, 0, 0, 1, 1,
1.953448, 0.661916, 2.067564, 1, 1, 1, 1, 1,
1.957707, -3.082389, 2.270027, 1, 1, 1, 1, 1,
1.959033, -0.2855586, 3.622781, 1, 1, 1, 1, 1,
1.997183, -1.061258, 0.6037813, 1, 1, 1, 1, 1,
2.020307, 0.8630028, 1.324461, 1, 1, 1, 1, 1,
2.042431, 0.6203483, 2.172753, 1, 1, 1, 1, 1,
2.061419, 1.282735, -0.5070409, 1, 1, 1, 1, 1,
2.066905, -0.7533668, 1.754312, 1, 1, 1, 1, 1,
2.075547, -0.7472855, 2.278261, 1, 1, 1, 1, 1,
2.099668, -0.4940784, 2.101595, 1, 1, 1, 1, 1,
2.107028, -1.870541, 2.567601, 1, 1, 1, 1, 1,
2.10709, 0.8885537, 1.433367, 1, 1, 1, 1, 1,
2.112917, 0.907205, 0.5559019, 1, 1, 1, 1, 1,
2.126012, 0.7235134, 4.042397, 1, 1, 1, 1, 1,
2.168813, 1.083336, 2.031717, 1, 1, 1, 1, 1,
2.182183, 0.6083316, 2.009681, 0, 0, 1, 1, 1,
2.208785, 0.3864001, 1.145285, 1, 0, 0, 1, 1,
2.21058, 0.6690766, 0.4453727, 1, 0, 0, 1, 1,
2.226613, -0.1752873, 3.190148, 1, 0, 0, 1, 1,
2.253682, -0.626921, 0.5988744, 1, 0, 0, 1, 1,
2.280492, -1.192288, 3.706369, 1, 0, 0, 1, 1,
2.30415, -0.05204273, 2.043107, 0, 0, 0, 1, 1,
2.342145, 0.4247091, 0.3709839, 0, 0, 0, 1, 1,
2.360149, 1.753766, 3.007227, 0, 0, 0, 1, 1,
2.360622, -1.074406, 1.605122, 0, 0, 0, 1, 1,
2.374181, -0.6219341, 0.8542688, 0, 0, 0, 1, 1,
2.400062, -1.448333, 3.966513, 0, 0, 0, 1, 1,
2.423189, 1.184107, 0.6586838, 0, 0, 0, 1, 1,
2.428662, 0.01976466, 0.9989185, 1, 1, 1, 1, 1,
2.451782, 4.317839, 2.575659, 1, 1, 1, 1, 1,
2.663107, 0.2600691, 2.052662, 1, 1, 1, 1, 1,
2.688267, -1.453221, 2.091709, 1, 1, 1, 1, 1,
2.707039, -0.07878957, 1.784788, 1, 1, 1, 1, 1,
2.837181, 0.5128307, 1.670681, 1, 1, 1, 1, 1,
3.01691, -0.9684983, 3.838665, 1, 1, 1, 1, 1
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
var radius = 9.740427;
var distance = 34.21284;
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
mvMatrix.translate( 0.01989341, -0.4830146, 0.0220983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.21284);
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
