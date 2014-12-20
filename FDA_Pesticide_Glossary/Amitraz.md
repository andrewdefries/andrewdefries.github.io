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
-3.35041, -0.1791978, -2.45213, 1, 0, 0, 1,
-2.582504, -1.819638, -1.258526, 1, 0.007843138, 0, 1,
-2.532558, -0.1645499, -1.069694, 1, 0.01176471, 0, 1,
-2.475895, 2.24084, -1.401255, 1, 0.01960784, 0, 1,
-2.45962, 3.078036, -0.6027843, 1, 0.02352941, 0, 1,
-2.40968, 0.002833643, -0.4748934, 1, 0.03137255, 0, 1,
-2.296896, -0.7491274, -1.5824, 1, 0.03529412, 0, 1,
-2.279035, 0.3949345, -1.132285, 1, 0.04313726, 0, 1,
-2.219882, 0.03782408, -1.700665, 1, 0.04705882, 0, 1,
-2.185587, 0.2995495, -1.234223, 1, 0.05490196, 0, 1,
-2.116214, 0.2265555, -1.089686, 1, 0.05882353, 0, 1,
-2.103028, 0.6673774, -1.251513, 1, 0.06666667, 0, 1,
-2.083148, 0.5625858, -2.273491, 1, 0.07058824, 0, 1,
-2.050615, -0.1560702, -1.695009, 1, 0.07843138, 0, 1,
-1.991842, -0.4659448, -0.8646099, 1, 0.08235294, 0, 1,
-1.955373, 0.527536, -0.8461018, 1, 0.09019608, 0, 1,
-1.940872, 0.8018293, 0.4555738, 1, 0.09411765, 0, 1,
-1.93924, -1.35371, -3.917331, 1, 0.1019608, 0, 1,
-1.915532, 1.742339, -0.7270049, 1, 0.1098039, 0, 1,
-1.888021, -0.8390172, -1.536363, 1, 0.1137255, 0, 1,
-1.884889, 1.493019, -0.942259, 1, 0.1215686, 0, 1,
-1.878581, 0.9812267, -0.8150573, 1, 0.1254902, 0, 1,
-1.864107, 0.0760546, -0.7091692, 1, 0.1333333, 0, 1,
-1.838878, 0.1391564, -0.8144763, 1, 0.1372549, 0, 1,
-1.838117, 0.2888044, -0.4744512, 1, 0.145098, 0, 1,
-1.828948, 1.562844, -0.4184166, 1, 0.1490196, 0, 1,
-1.812936, 0.4810111, -1.46986, 1, 0.1568628, 0, 1,
-1.810265, 1.350701, 1.656823, 1, 0.1607843, 0, 1,
-1.803287, 0.2483099, -2.999356, 1, 0.1686275, 0, 1,
-1.797018, 0.02794878, -2.130748, 1, 0.172549, 0, 1,
-1.778402, 0.6789864, -0.4535969, 1, 0.1803922, 0, 1,
-1.762597, 0.03276656, -2.014164, 1, 0.1843137, 0, 1,
-1.752542, -1.69726, -2.991432, 1, 0.1921569, 0, 1,
-1.735092, -0.09425031, -1.433644, 1, 0.1960784, 0, 1,
-1.70954, 1.150239, -2.225172, 1, 0.2039216, 0, 1,
-1.70492, 0.2599367, -2.872858, 1, 0.2117647, 0, 1,
-1.696935, 0.1543512, -0.06543517, 1, 0.2156863, 0, 1,
-1.690623, 1.887342, 0.1766345, 1, 0.2235294, 0, 1,
-1.678623, -0.1553923, -2.725708, 1, 0.227451, 0, 1,
-1.66233, -0.8763888, -1.858023, 1, 0.2352941, 0, 1,
-1.661543, -1.132949, -2.426668, 1, 0.2392157, 0, 1,
-1.638706, 0.5441349, -2.980722, 1, 0.2470588, 0, 1,
-1.637411, 0.4141319, -0.169482, 1, 0.2509804, 0, 1,
-1.605523, 0.2842406, -0.8990713, 1, 0.2588235, 0, 1,
-1.600866, -0.858219, -1.192518, 1, 0.2627451, 0, 1,
-1.583049, -0.2706482, -1.497931, 1, 0.2705882, 0, 1,
-1.575606, -1.570865, -1.821859, 1, 0.2745098, 0, 1,
-1.575034, 0.09085229, -1.115585, 1, 0.282353, 0, 1,
-1.568728, -1.215435, -0.501619, 1, 0.2862745, 0, 1,
-1.564609, -0.1897112, -1.541058, 1, 0.2941177, 0, 1,
-1.550092, 0.7721353, 1.048682, 1, 0.3019608, 0, 1,
-1.547859, 0.833292, -1.264397, 1, 0.3058824, 0, 1,
-1.529341, -0.04801748, -0.005241294, 1, 0.3137255, 0, 1,
-1.525178, 0.1251341, -0.5947419, 1, 0.3176471, 0, 1,
-1.509791, -0.04278737, -2.545046, 1, 0.3254902, 0, 1,
-1.499829, 0.4451886, -1.881462, 1, 0.3294118, 0, 1,
-1.498728, 0.6490958, -1.837321, 1, 0.3372549, 0, 1,
-1.485025, -0.1620988, -2.450669, 1, 0.3411765, 0, 1,
-1.475686, -0.009449339, -1.28008, 1, 0.3490196, 0, 1,
-1.466238, -1.378526, -3.611381, 1, 0.3529412, 0, 1,
-1.463552, -0.7740946, -1.446658, 1, 0.3607843, 0, 1,
-1.458802, 1.417266, -2.264303, 1, 0.3647059, 0, 1,
-1.444204, 0.5009896, -0.982882, 1, 0.372549, 0, 1,
-1.441141, -0.06405487, -2.231593, 1, 0.3764706, 0, 1,
-1.436349, -0.003706705, -3.223259, 1, 0.3843137, 0, 1,
-1.430359, -0.8336837, -1.237056, 1, 0.3882353, 0, 1,
-1.430057, 2.116426, -0.2401903, 1, 0.3960784, 0, 1,
-1.419978, 0.9486535, -1.683297, 1, 0.4039216, 0, 1,
-1.41987, -0.7889505, -2.08103, 1, 0.4078431, 0, 1,
-1.41545, 0.7742043, -1.670661, 1, 0.4156863, 0, 1,
-1.412421, -0.1091256, -0.7245022, 1, 0.4196078, 0, 1,
-1.408694, -2.199765, -1.932338, 1, 0.427451, 0, 1,
-1.401603, -0.1263636, -1.752792, 1, 0.4313726, 0, 1,
-1.399831, 0.07886752, -3.122593, 1, 0.4392157, 0, 1,
-1.390502, 0.2866259, -2.657526, 1, 0.4431373, 0, 1,
-1.37395, -1.199633, -3.083441, 1, 0.4509804, 0, 1,
-1.369647, -0.5878175, -1.973911, 1, 0.454902, 0, 1,
-1.369591, -0.1778772, -2.403782, 1, 0.4627451, 0, 1,
-1.367856, 1.180466, -0.5231959, 1, 0.4666667, 0, 1,
-1.358022, 0.5240451, -1.647087, 1, 0.4745098, 0, 1,
-1.357679, 0.05347728, -1.991206, 1, 0.4784314, 0, 1,
-1.355727, 1.810468, -0.1394408, 1, 0.4862745, 0, 1,
-1.343261, 0.1227326, -1.42959, 1, 0.4901961, 0, 1,
-1.336619, -1.602412, -2.139287, 1, 0.4980392, 0, 1,
-1.334277, -0.5473543, -0.7773545, 1, 0.5058824, 0, 1,
-1.329358, -0.8206037, -1.999463, 1, 0.509804, 0, 1,
-1.328248, -0.06264261, -3.545457, 1, 0.5176471, 0, 1,
-1.319345, 1.028637, -0.2888019, 1, 0.5215687, 0, 1,
-1.310573, 1.315212, 0.2673161, 1, 0.5294118, 0, 1,
-1.310224, 0.6398738, -1.324501, 1, 0.5333334, 0, 1,
-1.309975, -1.131073, -1.538215, 1, 0.5411765, 0, 1,
-1.290807, -0.5338062, -1.574448, 1, 0.5450981, 0, 1,
-1.285974, -1.381409, -3.621217, 1, 0.5529412, 0, 1,
-1.280187, -1.513711, -2.275736, 1, 0.5568628, 0, 1,
-1.276813, -0.1525117, -1.108377, 1, 0.5647059, 0, 1,
-1.276037, -0.04445842, 0.02407629, 1, 0.5686275, 0, 1,
-1.270666, -0.2629032, -0.5482484, 1, 0.5764706, 0, 1,
-1.262229, 1.555029, 0.9759457, 1, 0.5803922, 0, 1,
-1.250616, -1.215806, -2.721165, 1, 0.5882353, 0, 1,
-1.244176, 1.580781, -1.810128, 1, 0.5921569, 0, 1,
-1.228767, 0.9964648, -1.648037, 1, 0.6, 0, 1,
-1.228323, -0.1825548, -3.556488, 1, 0.6078432, 0, 1,
-1.227235, 0.3246161, -2.860553, 1, 0.6117647, 0, 1,
-1.212028, 0.7530589, -1.851182, 1, 0.6196079, 0, 1,
-1.211923, 0.9553065, -1.785532, 1, 0.6235294, 0, 1,
-1.20107, -0.8331823, -3.837041, 1, 0.6313726, 0, 1,
-1.200281, -0.02851281, -1.943233, 1, 0.6352941, 0, 1,
-1.198253, 0.848568, -2.917982, 1, 0.6431373, 0, 1,
-1.17717, -1.164996, -4.477497, 1, 0.6470588, 0, 1,
-1.174356, -0.7931164, -2.100703, 1, 0.654902, 0, 1,
-1.173169, -0.08241533, -0.9953592, 1, 0.6588235, 0, 1,
-1.168739, -0.4923441, -3.266714, 1, 0.6666667, 0, 1,
-1.167287, 0.9876648, -2.021816, 1, 0.6705883, 0, 1,
-1.161647, 0.6835893, -0.6528114, 1, 0.6784314, 0, 1,
-1.157518, -1.451981, -3.339143, 1, 0.682353, 0, 1,
-1.15214, 0.6326538, -2.157203, 1, 0.6901961, 0, 1,
-1.148186, -1.473781, -1.12757, 1, 0.6941177, 0, 1,
-1.14791, 1.029936, -1.047457, 1, 0.7019608, 0, 1,
-1.146815, -1.12655, -3.544047, 1, 0.7098039, 0, 1,
-1.14022, 0.2119647, 0.8684828, 1, 0.7137255, 0, 1,
-1.117479, -0.7122072, -1.152302, 1, 0.7215686, 0, 1,
-1.115643, 0.3599219, -1.100711, 1, 0.7254902, 0, 1,
-1.10845, -0.2152605, -2.544149, 1, 0.7333333, 0, 1,
-1.103896, -1.844586, -3.586733, 1, 0.7372549, 0, 1,
-1.094239, -1.361944, -1.444163, 1, 0.7450981, 0, 1,
-1.091176, -0.7567942, -3.213891, 1, 0.7490196, 0, 1,
-1.0842, -0.9609464, -1.43459, 1, 0.7568628, 0, 1,
-1.082832, -0.5703683, -3.528193, 1, 0.7607843, 0, 1,
-1.07784, 0.02358696, -1.684546, 1, 0.7686275, 0, 1,
-1.074764, 1.061215, -0.09557986, 1, 0.772549, 0, 1,
-1.072131, -0.8774006, -1.523489, 1, 0.7803922, 0, 1,
-1.069919, -1.943939, -5.572831, 1, 0.7843137, 0, 1,
-1.06693, 1.042332, -0.9773197, 1, 0.7921569, 0, 1,
-1.064142, -1.173935, -3.553084, 1, 0.7960784, 0, 1,
-1.062114, -1.091265, -1.731703, 1, 0.8039216, 0, 1,
-1.055777, 0.3055566, -0.2850569, 1, 0.8117647, 0, 1,
-1.053117, 0.4418668, -1.238486, 1, 0.8156863, 0, 1,
-1.051075, 0.2679304, -0.6165588, 1, 0.8235294, 0, 1,
-1.049756, -1.414243, -2.790367, 1, 0.827451, 0, 1,
-1.044382, 0.627649, -0.04308591, 1, 0.8352941, 0, 1,
-1.041864, -2.454541, -0.9652456, 1, 0.8392157, 0, 1,
-1.040854, -0.9863688, -1.182969, 1, 0.8470588, 0, 1,
-1.038867, -0.1287715, -1.311911, 1, 0.8509804, 0, 1,
-1.035242, -0.04336887, -2.068378, 1, 0.8588235, 0, 1,
-1.034932, -1.643439, -3.677873, 1, 0.8627451, 0, 1,
-1.033123, -1.36878, -3.508401, 1, 0.8705882, 0, 1,
-1.029088, 0.7529393, 0.8103948, 1, 0.8745098, 0, 1,
-1.02798, -0.9441577, -3.527499, 1, 0.8823529, 0, 1,
-1.027479, 1.58372, -0.900699, 1, 0.8862745, 0, 1,
-1.027103, -0.1356401, -1.729475, 1, 0.8941177, 0, 1,
-1.027045, 1.445552, -1.615349, 1, 0.8980392, 0, 1,
-1.022392, -1.12459, -1.774228, 1, 0.9058824, 0, 1,
-1.021092, -2.270036, -2.88335, 1, 0.9137255, 0, 1,
-1.011001, 1.167695, -1.523387, 1, 0.9176471, 0, 1,
-0.9950786, 0.6449465, -0.1150956, 1, 0.9254902, 0, 1,
-0.9919074, -0.5909645, -1.556632, 1, 0.9294118, 0, 1,
-0.9910376, 0.3823943, -0.7797119, 1, 0.9372549, 0, 1,
-0.9854546, -1.597129, -2.459601, 1, 0.9411765, 0, 1,
-0.9841502, -1.243031, -3.657868, 1, 0.9490196, 0, 1,
-0.9831557, -1.368257, -4.735195, 1, 0.9529412, 0, 1,
-0.9814904, 1.392702, -1.847661, 1, 0.9607843, 0, 1,
-0.9730802, 0.6320177, -0.7465528, 1, 0.9647059, 0, 1,
-0.9714696, -1.88075, -2.866238, 1, 0.972549, 0, 1,
-0.9711679, -2.164627, -3.262986, 1, 0.9764706, 0, 1,
-0.9707276, -1.781489, -2.178438, 1, 0.9843137, 0, 1,
-0.9511068, -0.2071406, -1.75072, 1, 0.9882353, 0, 1,
-0.9504998, 0.6727819, -0.3551491, 1, 0.9960784, 0, 1,
-0.9493815, 1.130161, -1.177822, 0.9960784, 1, 0, 1,
-0.9475468, 0.3422274, -0.6118933, 0.9921569, 1, 0, 1,
-0.9433878, -1.366408, -1.656153, 0.9843137, 1, 0, 1,
-0.9426399, 0.1810677, -2.09176, 0.9803922, 1, 0, 1,
-0.9366494, -0.2068216, -0.7320731, 0.972549, 1, 0, 1,
-0.9353984, -0.5900673, -1.058663, 0.9686275, 1, 0, 1,
-0.9348466, 0.1676663, -0.4192888, 0.9607843, 1, 0, 1,
-0.9239324, -0.481534, -2.013002, 0.9568627, 1, 0, 1,
-0.9226, 0.01112214, -0.6908274, 0.9490196, 1, 0, 1,
-0.9194779, -0.9234087, -2.413651, 0.945098, 1, 0, 1,
-0.9173353, -0.4150279, -2.347347, 0.9372549, 1, 0, 1,
-0.9098385, -0.2372373, -0.3099391, 0.9333333, 1, 0, 1,
-0.9065811, -0.4916535, -1.044684, 0.9254902, 1, 0, 1,
-0.9065043, -1.369154, -2.58562, 0.9215686, 1, 0, 1,
-0.9016865, 0.5459099, -1.310069, 0.9137255, 1, 0, 1,
-0.8979074, -0.481091, -3.161252, 0.9098039, 1, 0, 1,
-0.8934372, 0.2932192, -0.979235, 0.9019608, 1, 0, 1,
-0.8930354, 0.005689911, -0.07079422, 0.8941177, 1, 0, 1,
-0.8850724, -0.6982303, -0.6406854, 0.8901961, 1, 0, 1,
-0.8798892, -0.3302816, -2.645016, 0.8823529, 1, 0, 1,
-0.8762642, 1.853712, 0.004774814, 0.8784314, 1, 0, 1,
-0.8710834, 1.079925, -1.463586, 0.8705882, 1, 0, 1,
-0.8652682, -0.4948132, -1.190866, 0.8666667, 1, 0, 1,
-0.8642944, 0.7018306, -0.6013308, 0.8588235, 1, 0, 1,
-0.86408, 0.7609435, -2.436901, 0.854902, 1, 0, 1,
-0.8621746, -0.8730072, -2.974008, 0.8470588, 1, 0, 1,
-0.8605304, 1.200999, -0.7449118, 0.8431373, 1, 0, 1,
-0.8597526, 0.4037862, -2.763573, 0.8352941, 1, 0, 1,
-0.8570553, -1.543071, -1.574039, 0.8313726, 1, 0, 1,
-0.8538541, -0.1468448, -1.240732, 0.8235294, 1, 0, 1,
-0.8537827, 1.302258, -0.1414503, 0.8196079, 1, 0, 1,
-0.8503262, -1.033156, -1.990355, 0.8117647, 1, 0, 1,
-0.8440054, -1.337443, -2.258303, 0.8078431, 1, 0, 1,
-0.8417976, -0.1339599, -2.643242, 0.8, 1, 0, 1,
-0.8407583, 0.5614015, -0.6940852, 0.7921569, 1, 0, 1,
-0.8370849, 0.7365539, -0.6854658, 0.7882353, 1, 0, 1,
-0.8252406, 0.6330394, -1.01952, 0.7803922, 1, 0, 1,
-0.8249835, -1.894024, -1.3758, 0.7764706, 1, 0, 1,
-0.81507, 0.4153613, -0.1834617, 0.7686275, 1, 0, 1,
-0.8144116, 0.9575144, 0.1790271, 0.7647059, 1, 0, 1,
-0.806126, -0.8224217, -2.749487, 0.7568628, 1, 0, 1,
-0.7931221, 0.1290921, -1.146694, 0.7529412, 1, 0, 1,
-0.7930582, -1.099206, -2.8522, 0.7450981, 1, 0, 1,
-0.7859533, 0.01320386, -3.250883, 0.7411765, 1, 0, 1,
-0.784394, 1.245795, 0.9621477, 0.7333333, 1, 0, 1,
-0.7808895, -0.2655753, -3.350224, 0.7294118, 1, 0, 1,
-0.7692875, 0.5821824, -2.625256, 0.7215686, 1, 0, 1,
-0.7658503, 0.1509828, -1.432676, 0.7176471, 1, 0, 1,
-0.7604488, -1.470477, -1.807565, 0.7098039, 1, 0, 1,
-0.7583187, 0.1143549, -0.7693477, 0.7058824, 1, 0, 1,
-0.7484922, 0.373588, 0.9275892, 0.6980392, 1, 0, 1,
-0.7459102, 2.609498, 0.9685636, 0.6901961, 1, 0, 1,
-0.7436085, 1.574867, 0.7315452, 0.6862745, 1, 0, 1,
-0.7393071, -1.444584, -2.729047, 0.6784314, 1, 0, 1,
-0.7350278, 2.446861, -0.9233679, 0.6745098, 1, 0, 1,
-0.7344068, 0.2514871, -0.289743, 0.6666667, 1, 0, 1,
-0.7328044, -0.3440875, -2.530897, 0.6627451, 1, 0, 1,
-0.7326272, 0.294272, -1.724775, 0.654902, 1, 0, 1,
-0.7295692, 0.2961889, 1.112524, 0.6509804, 1, 0, 1,
-0.7274995, 0.7397119, -1.576738, 0.6431373, 1, 0, 1,
-0.7197011, 0.3210535, -0.8642417, 0.6392157, 1, 0, 1,
-0.7196105, 0.08503427, -0.6719272, 0.6313726, 1, 0, 1,
-0.7159006, 0.7988189, -1.178144, 0.627451, 1, 0, 1,
-0.7063705, 0.7830123, -0.4569618, 0.6196079, 1, 0, 1,
-0.7037795, -0.9762566, -1.983817, 0.6156863, 1, 0, 1,
-0.7007586, 0.5863031, -1.180755, 0.6078432, 1, 0, 1,
-0.6986294, 0.9019843, 0.6827883, 0.6039216, 1, 0, 1,
-0.6942051, 1.09067, -1.955655, 0.5960785, 1, 0, 1,
-0.6932406, -1.050378, -1.723684, 0.5882353, 1, 0, 1,
-0.6852884, -1.810004, -3.081742, 0.5843138, 1, 0, 1,
-0.6816052, 0.7746493, 0.8227932, 0.5764706, 1, 0, 1,
-0.6661332, -0.7590966, -1.127936, 0.572549, 1, 0, 1,
-0.6618438, -0.3508399, -2.155344, 0.5647059, 1, 0, 1,
-0.6604347, 0.8645778, -1.18953, 0.5607843, 1, 0, 1,
-0.659379, -1.73405, -2.469055, 0.5529412, 1, 0, 1,
-0.6577268, 1.134381, 1.140827, 0.5490196, 1, 0, 1,
-0.6533642, 0.5562603, -0.316585, 0.5411765, 1, 0, 1,
-0.6509759, 0.4176992, -1.77397, 0.5372549, 1, 0, 1,
-0.6479383, -0.9040283, -3.940888, 0.5294118, 1, 0, 1,
-0.64685, -0.8121381, -1.839617, 0.5254902, 1, 0, 1,
-0.6465067, 1.453647, -0.3417202, 0.5176471, 1, 0, 1,
-0.6463879, 0.477784, -0.6483123, 0.5137255, 1, 0, 1,
-0.6462286, 0.1373775, -1.667715, 0.5058824, 1, 0, 1,
-0.6462148, -0.1202987, -2.188885, 0.5019608, 1, 0, 1,
-0.6461619, 0.5534528, -1.557618, 0.4941176, 1, 0, 1,
-0.644038, -1.207997, -2.315514, 0.4862745, 1, 0, 1,
-0.6418152, 1.46679, -0.8921687, 0.4823529, 1, 0, 1,
-0.6408147, -0.2382186, -2.230004, 0.4745098, 1, 0, 1,
-0.6407353, 0.09686901, -2.386934, 0.4705882, 1, 0, 1,
-0.6379138, 0.7328264, -0.8140754, 0.4627451, 1, 0, 1,
-0.6268209, -0.1735789, -0.0682489, 0.4588235, 1, 0, 1,
-0.626202, 0.9398349, -0.7075631, 0.4509804, 1, 0, 1,
-0.6257964, -0.09296989, 0.8465357, 0.4470588, 1, 0, 1,
-0.6251467, -0.3604382, -1.35854, 0.4392157, 1, 0, 1,
-0.6201791, 0.9827407, -1.053803, 0.4352941, 1, 0, 1,
-0.618727, -1.625672, -3.291795, 0.427451, 1, 0, 1,
-0.6116561, 0.4531493, -0.6027657, 0.4235294, 1, 0, 1,
-0.6082578, 1.592116, -1.845328, 0.4156863, 1, 0, 1,
-0.6078212, 1.211419, -1.463959, 0.4117647, 1, 0, 1,
-0.6040452, -0.09447291, -2.737208, 0.4039216, 1, 0, 1,
-0.6009779, 1.82003, 0.06027954, 0.3960784, 1, 0, 1,
-0.5970255, -0.7433754, -2.643538, 0.3921569, 1, 0, 1,
-0.5926597, 0.3872944, -1.446158, 0.3843137, 1, 0, 1,
-0.5905854, -0.1241708, -2.781679, 0.3803922, 1, 0, 1,
-0.5879412, 1.133652, -1.614581, 0.372549, 1, 0, 1,
-0.5841565, 0.4882776, -2.114481, 0.3686275, 1, 0, 1,
-0.5836402, -0.731873, -0.9645703, 0.3607843, 1, 0, 1,
-0.5834644, -0.357167, -1.017825, 0.3568628, 1, 0, 1,
-0.5809088, -0.8392895, -3.305424, 0.3490196, 1, 0, 1,
-0.5775394, 0.9001579, 0.02252079, 0.345098, 1, 0, 1,
-0.577413, 1.937958, 0.2975471, 0.3372549, 1, 0, 1,
-0.5754979, -0.8630593, -2.0498, 0.3333333, 1, 0, 1,
-0.5744766, -0.07275979, -0.4086311, 0.3254902, 1, 0, 1,
-0.5729144, 0.7853161, 0.3614022, 0.3215686, 1, 0, 1,
-0.5642006, 1.230471, -0.4160641, 0.3137255, 1, 0, 1,
-0.5521199, -0.1741214, -2.093669, 0.3098039, 1, 0, 1,
-0.5511606, 0.09405607, -3.779743, 0.3019608, 1, 0, 1,
-0.5504011, -0.1040158, -2.09504, 0.2941177, 1, 0, 1,
-0.5488392, -1.659108, -1.932385, 0.2901961, 1, 0, 1,
-0.5484934, -0.5336764, -3.885609, 0.282353, 1, 0, 1,
-0.5457086, -1.326952, -2.055228, 0.2784314, 1, 0, 1,
-0.5453439, -1.796648, -2.156939, 0.2705882, 1, 0, 1,
-0.5436279, 2.83294, -1.422829, 0.2666667, 1, 0, 1,
-0.5431275, 2.13992, -0.8297342, 0.2588235, 1, 0, 1,
-0.5430123, 0.8672946, -0.9406043, 0.254902, 1, 0, 1,
-0.5406557, -0.1909417, -1.543741, 0.2470588, 1, 0, 1,
-0.5361287, 0.7968673, -0.9388638, 0.2431373, 1, 0, 1,
-0.5347639, -1.094193, -2.269979, 0.2352941, 1, 0, 1,
-0.5321504, -0.5037866, -2.666838, 0.2313726, 1, 0, 1,
-0.531994, 0.6890029, -1.159014, 0.2235294, 1, 0, 1,
-0.5301104, 0.8523703, 0.1002895, 0.2196078, 1, 0, 1,
-0.5283253, 1.409628, -1.21258, 0.2117647, 1, 0, 1,
-0.5258493, 1.874135, 0.2993451, 0.2078431, 1, 0, 1,
-0.5227647, -1.569059, -4.3716, 0.2, 1, 0, 1,
-0.519528, 0.4469303, -1.138447, 0.1921569, 1, 0, 1,
-0.5175205, 1.606759, 0.1163027, 0.1882353, 1, 0, 1,
-0.5152778, 1.997388, 0.5384219, 0.1803922, 1, 0, 1,
-0.5144506, -0.009579456, -0.3141771, 0.1764706, 1, 0, 1,
-0.514254, -0.9003031, -1.163517, 0.1686275, 1, 0, 1,
-0.513737, -1.526053, -2.074504, 0.1647059, 1, 0, 1,
-0.511413, 0.5164084, -0.3690256, 0.1568628, 1, 0, 1,
-0.5096832, 0.354759, -2.357865, 0.1529412, 1, 0, 1,
-0.5045652, 0.135059, -1.639109, 0.145098, 1, 0, 1,
-0.5018253, 0.1900982, -2.22771, 0.1411765, 1, 0, 1,
-0.501032, -1.33195, -2.434482, 0.1333333, 1, 0, 1,
-0.5003635, 1.083179, 0.3116897, 0.1294118, 1, 0, 1,
-0.498783, -1.399545, -3.848897, 0.1215686, 1, 0, 1,
-0.4983331, 0.5013919, -2.2663, 0.1176471, 1, 0, 1,
-0.4974143, 0.7427759, -1.575652, 0.1098039, 1, 0, 1,
-0.4961585, -0.1682492, -2.922673, 0.1058824, 1, 0, 1,
-0.4959084, -0.3431349, -1.368011, 0.09803922, 1, 0, 1,
-0.4905077, 0.4547797, -1.32949, 0.09019608, 1, 0, 1,
-0.4892072, -0.3398295, -1.396662, 0.08627451, 1, 0, 1,
-0.4859, -0.5667552, -2.529457, 0.07843138, 1, 0, 1,
-0.48496, 0.3101076, -2.399151, 0.07450981, 1, 0, 1,
-0.4817311, 1.582983, 0.09415081, 0.06666667, 1, 0, 1,
-0.4799801, 1.19336, -0.3766287, 0.0627451, 1, 0, 1,
-0.4795349, -2.116038, -1.576151, 0.05490196, 1, 0, 1,
-0.4766639, -1.471892, -2.866453, 0.05098039, 1, 0, 1,
-0.4719887, 1.868887, 0.9504293, 0.04313726, 1, 0, 1,
-0.4671912, -0.06004981, -2.035063, 0.03921569, 1, 0, 1,
-0.4662726, 0.2084966, -1.261188, 0.03137255, 1, 0, 1,
-0.4661308, 0.2476695, 0.01450352, 0.02745098, 1, 0, 1,
-0.4628229, 1.157106, -1.221477, 0.01960784, 1, 0, 1,
-0.4617987, 1.516214, -1.003543, 0.01568628, 1, 0, 1,
-0.4480841, -0.1263681, -1.13723, 0.007843138, 1, 0, 1,
-0.4472825, -1.07479, -1.187351, 0.003921569, 1, 0, 1,
-0.4462218, 0.6438317, -0.5007762, 0, 1, 0.003921569, 1,
-0.443912, -0.2524406, -3.240531, 0, 1, 0.01176471, 1,
-0.4385475, -1.605664, -3.26877, 0, 1, 0.01568628, 1,
-0.4382466, -1.081595, -2.749287, 0, 1, 0.02352941, 1,
-0.4320852, 1.060149, -1.200146, 0, 1, 0.02745098, 1,
-0.431467, -1.746033, -2.383751, 0, 1, 0.03529412, 1,
-0.4311949, 0.3687149, -0.9447581, 0, 1, 0.03921569, 1,
-0.4232131, -0.3988861, -2.032987, 0, 1, 0.04705882, 1,
-0.4211968, 0.6085102, -0.6999906, 0, 1, 0.05098039, 1,
-0.4193079, 0.6524594, 1.991388, 0, 1, 0.05882353, 1,
-0.4118538, 0.3845042, -1.889326, 0, 1, 0.0627451, 1,
-0.4065918, -1.700176, -4.122779, 0, 1, 0.07058824, 1,
-0.4063525, -0.9079804, -3.053618, 0, 1, 0.07450981, 1,
-0.4048317, -0.3956662, -3.871397, 0, 1, 0.08235294, 1,
-0.4013739, 0.3748084, -1.327324, 0, 1, 0.08627451, 1,
-0.4003959, -2.186625, -4.675977, 0, 1, 0.09411765, 1,
-0.3976644, -1.41225, -3.225169, 0, 1, 0.1019608, 1,
-0.3964239, -0.7997941, -2.488636, 0, 1, 0.1058824, 1,
-0.3846582, -0.4633532, -4.276875, 0, 1, 0.1137255, 1,
-0.3812138, 0.1936175, -2.100921, 0, 1, 0.1176471, 1,
-0.3791088, -0.9811724, -0.935366, 0, 1, 0.1254902, 1,
-0.3739023, 0.9235379, -1.332938, 0, 1, 0.1294118, 1,
-0.3711415, 0.06632847, -2.866498, 0, 1, 0.1372549, 1,
-0.3701855, 0.4315092, 0.3695656, 0, 1, 0.1411765, 1,
-0.3696534, 0.8739569, 0.07208911, 0, 1, 0.1490196, 1,
-0.3651961, 0.5363324, -0.3127405, 0, 1, 0.1529412, 1,
-0.3633529, -0.1557631, -1.453918, 0, 1, 0.1607843, 1,
-0.3588772, 0.1824266, -1.14881, 0, 1, 0.1647059, 1,
-0.3545992, -1.214807, -3.192225, 0, 1, 0.172549, 1,
-0.3526793, -0.2752622, -3.897075, 0, 1, 0.1764706, 1,
-0.3524515, 0.4260928, 0.3987896, 0, 1, 0.1843137, 1,
-0.351474, -0.02445944, -2.183512, 0, 1, 0.1882353, 1,
-0.3504126, -0.8767676, -2.721523, 0, 1, 0.1960784, 1,
-0.3437786, 1.057391, -0.9032542, 0, 1, 0.2039216, 1,
-0.3430885, 0.8551893, 0.9744566, 0, 1, 0.2078431, 1,
-0.3421619, -1.500314, -2.333568, 0, 1, 0.2156863, 1,
-0.3402152, -0.5579086, -2.187654, 0, 1, 0.2196078, 1,
-0.3398126, -0.7595867, -2.733205, 0, 1, 0.227451, 1,
-0.3348672, 0.5628015, -0.7218996, 0, 1, 0.2313726, 1,
-0.3305453, -0.6425033, -4.293868, 0, 1, 0.2392157, 1,
-0.3286743, -0.1793585, -3.515878, 0, 1, 0.2431373, 1,
-0.3286726, 0.7298695, -1.131607, 0, 1, 0.2509804, 1,
-0.3276405, 0.1564278, -1.621747, 0, 1, 0.254902, 1,
-0.3207471, -0.893138, -4.52098, 0, 1, 0.2627451, 1,
-0.3204808, 0.7241086, -0.5063447, 0, 1, 0.2666667, 1,
-0.319925, -0.5283483, -2.712512, 0, 1, 0.2745098, 1,
-0.3196559, -0.7830608, -2.397758, 0, 1, 0.2784314, 1,
-0.3108897, 1.054912, 0.1640033, 0, 1, 0.2862745, 1,
-0.3092803, -0.3898224, -2.625125, 0, 1, 0.2901961, 1,
-0.308363, -0.9793609, -1.698692, 0, 1, 0.2980392, 1,
-0.3077505, -2.08962, -3.627927, 0, 1, 0.3058824, 1,
-0.3028076, -1.287006, -3.617029, 0, 1, 0.3098039, 1,
-0.3026321, 0.3535442, -1.069482, 0, 1, 0.3176471, 1,
-0.3021013, -0.4234717, -3.867045, 0, 1, 0.3215686, 1,
-0.3017319, 0.8069797, -0.597077, 0, 1, 0.3294118, 1,
-0.2998191, 0.5306826, -1.059902, 0, 1, 0.3333333, 1,
-0.2991292, 0.1659002, -0.0282097, 0, 1, 0.3411765, 1,
-0.2927488, -0.7736644, -1.827412, 0, 1, 0.345098, 1,
-0.2903117, -0.6728265, -2.650738, 0, 1, 0.3529412, 1,
-0.2823241, 0.42371, -0.4547067, 0, 1, 0.3568628, 1,
-0.2808297, 3.078317, -1.03663, 0, 1, 0.3647059, 1,
-0.2750051, -1.622869, -0.7388098, 0, 1, 0.3686275, 1,
-0.2747821, 0.6242508, -1.032134, 0, 1, 0.3764706, 1,
-0.2742908, 0.8800368, 0.3180877, 0, 1, 0.3803922, 1,
-0.2736755, -0.4932769, -1.74377, 0, 1, 0.3882353, 1,
-0.2720822, -0.4403717, -1.737587, 0, 1, 0.3921569, 1,
-0.2697657, 1.01687, -0.5532387, 0, 1, 0.4, 1,
-0.2673799, -1.22209, -2.291948, 0, 1, 0.4078431, 1,
-0.2654192, 0.2999603, 0.4568674, 0, 1, 0.4117647, 1,
-0.2653562, 0.3649844, 0.3817127, 0, 1, 0.4196078, 1,
-0.2644762, 0.2890104, 0.08514688, 0, 1, 0.4235294, 1,
-0.2608668, -0.2645349, -3.529845, 0, 1, 0.4313726, 1,
-0.2550267, -0.07150289, -1.468455, 0, 1, 0.4352941, 1,
-0.2549625, 0.5303369, -1.824329, 0, 1, 0.4431373, 1,
-0.2501838, 0.3937118, -1.872955, 0, 1, 0.4470588, 1,
-0.2500092, 2.001348, -0.7637731, 0, 1, 0.454902, 1,
-0.249233, 1.571621, 0.4080039, 0, 1, 0.4588235, 1,
-0.2448035, 0.7803445, 0.2141389, 0, 1, 0.4666667, 1,
-0.2443011, 0.8943405, -1.920694, 0, 1, 0.4705882, 1,
-0.239213, 0.03225443, -0.7893901, 0, 1, 0.4784314, 1,
-0.2352977, -2.784837, -4.387794, 0, 1, 0.4823529, 1,
-0.2330705, 0.1448146, 0.6820427, 0, 1, 0.4901961, 1,
-0.2328208, -0.7727944, -1.830384, 0, 1, 0.4941176, 1,
-0.2306895, -0.7027197, -3.179602, 0, 1, 0.5019608, 1,
-0.2299803, 0.1627534, -0.8865728, 0, 1, 0.509804, 1,
-0.2243237, 0.1315246, -2.951616, 0, 1, 0.5137255, 1,
-0.2242811, -0.02394225, -0.7469841, 0, 1, 0.5215687, 1,
-0.2213638, -1.451371, -4.876688, 0, 1, 0.5254902, 1,
-0.219562, 0.6638992, 0.3975373, 0, 1, 0.5333334, 1,
-0.2126126, -0.1821971, -2.381302, 0, 1, 0.5372549, 1,
-0.2109038, -0.4163595, -2.144854, 0, 1, 0.5450981, 1,
-0.2108931, 0.09780399, 1.259586, 0, 1, 0.5490196, 1,
-0.2101881, -0.1413951, -3.397269, 0, 1, 0.5568628, 1,
-0.2070136, -1.693916, -3.948984, 0, 1, 0.5607843, 1,
-0.2060323, 0.3521016, 0.02103329, 0, 1, 0.5686275, 1,
-0.2053294, 0.1100543, -0.8357477, 0, 1, 0.572549, 1,
-0.2042406, -0.07268979, -2.798394, 0, 1, 0.5803922, 1,
-0.1997411, 0.24692, -0.7578909, 0, 1, 0.5843138, 1,
-0.1994384, -0.06632813, -3.242659, 0, 1, 0.5921569, 1,
-0.1929247, 0.5470316, 0.1241266, 0, 1, 0.5960785, 1,
-0.1922222, -2.616936, -0.7215015, 0, 1, 0.6039216, 1,
-0.1921976, 0.9269685, 0.09984193, 0, 1, 0.6117647, 1,
-0.1916095, -0.7590222, -3.76988, 0, 1, 0.6156863, 1,
-0.19115, 0.6992881, -1.7038, 0, 1, 0.6235294, 1,
-0.1880144, -1.342658, -3.180565, 0, 1, 0.627451, 1,
-0.1847772, -0.08195656, -1.620428, 0, 1, 0.6352941, 1,
-0.1827505, -1.456856, -3.93681, 0, 1, 0.6392157, 1,
-0.1782848, -1.128796, -1.311221, 0, 1, 0.6470588, 1,
-0.1748222, -1.38536, -4.786907, 0, 1, 0.6509804, 1,
-0.1735698, -0.08735404, -1.533104, 0, 1, 0.6588235, 1,
-0.1701546, 0.2880488, -1.265188, 0, 1, 0.6627451, 1,
-0.1681981, -0.3911305, -4.08234, 0, 1, 0.6705883, 1,
-0.1657262, 0.484119, 1.58214, 0, 1, 0.6745098, 1,
-0.1607463, 1.532349, -0.2479747, 0, 1, 0.682353, 1,
-0.160293, -1.088443, -3.40817, 0, 1, 0.6862745, 1,
-0.1527227, -0.4777477, -3.146558, 0, 1, 0.6941177, 1,
-0.1525306, 0.9514425, 1.089085, 0, 1, 0.7019608, 1,
-0.150048, 1.42962, -0.6714418, 0, 1, 0.7058824, 1,
-0.1470842, 2.188594, 1.591583, 0, 1, 0.7137255, 1,
-0.1442357, -0.4223185, -2.757636, 0, 1, 0.7176471, 1,
-0.1435705, 1.156436, -0.0746348, 0, 1, 0.7254902, 1,
-0.1422194, -0.7146451, -3.133544, 0, 1, 0.7294118, 1,
-0.1402556, 2.003715, 1.789359, 0, 1, 0.7372549, 1,
-0.1388606, 1.300426, -0.9244282, 0, 1, 0.7411765, 1,
-0.1367767, 1.161697, 0.732487, 0, 1, 0.7490196, 1,
-0.136095, 0.8858253, -1.7761, 0, 1, 0.7529412, 1,
-0.1348557, 1.25135, 0.02741151, 0, 1, 0.7607843, 1,
-0.1313311, 0.8336619, 1.746575, 0, 1, 0.7647059, 1,
-0.130538, -0.6583721, -3.08738, 0, 1, 0.772549, 1,
-0.1298465, 0.2080421, 1.390877, 0, 1, 0.7764706, 1,
-0.1264795, 0.1344012, -1.074896, 0, 1, 0.7843137, 1,
-0.1262248, 2.475853, -2.152436, 0, 1, 0.7882353, 1,
-0.1259671, 1.2446, -1.553419, 0, 1, 0.7960784, 1,
-0.1236492, -1.205237, -1.798955, 0, 1, 0.8039216, 1,
-0.1209358, 1.229644, -0.4343257, 0, 1, 0.8078431, 1,
-0.1160153, -1.105854, -2.471346, 0, 1, 0.8156863, 1,
-0.1143231, -1.991373, -3.157648, 0, 1, 0.8196079, 1,
-0.1137257, -1.80754, -3.156815, 0, 1, 0.827451, 1,
-0.1127038, 0.2214778, 0.8420156, 0, 1, 0.8313726, 1,
-0.1044288, -0.807384, -3.712825, 0, 1, 0.8392157, 1,
-0.09885942, -0.09027018, -2.911383, 0, 1, 0.8431373, 1,
-0.09390707, -0.9383861, -3.016077, 0, 1, 0.8509804, 1,
-0.09301735, -0.9593015, -2.151413, 0, 1, 0.854902, 1,
-0.08809485, -2.11165, -2.127751, 0, 1, 0.8627451, 1,
-0.08691948, 0.1977631, 1.761382, 0, 1, 0.8666667, 1,
-0.08049503, -1.262904, -2.240938, 0, 1, 0.8745098, 1,
-0.08018355, 0.6886843, -0.6382129, 0, 1, 0.8784314, 1,
-0.07100199, -0.8539699, -4.268968, 0, 1, 0.8862745, 1,
-0.07080738, 0.3365355, 0.7731262, 0, 1, 0.8901961, 1,
-0.0657598, -1.587227, -2.578974, 0, 1, 0.8980392, 1,
-0.06175471, -0.308435, -4.117504, 0, 1, 0.9058824, 1,
-0.06046708, 0.3664546, 1.565889, 0, 1, 0.9098039, 1,
-0.05911477, 0.8478617, 1.325179, 0, 1, 0.9176471, 1,
-0.0583612, -0.1033453, -1.685159, 0, 1, 0.9215686, 1,
-0.05600212, -0.8120233, -2.512387, 0, 1, 0.9294118, 1,
-0.05210279, -2.133849, -1.718187, 0, 1, 0.9333333, 1,
-0.05180398, -2.085107, -2.877801, 0, 1, 0.9411765, 1,
-0.05092513, -0.9796277, -3.620659, 0, 1, 0.945098, 1,
-0.04938608, -0.2302293, -1.34521, 0, 1, 0.9529412, 1,
-0.04510267, 0.1758243, 1.085167, 0, 1, 0.9568627, 1,
-0.04034922, 0.393693, 0.6196038, 0, 1, 0.9647059, 1,
-0.04014009, -1.595659, -4.173302, 0, 1, 0.9686275, 1,
-0.03804763, 0.02274897, -1.752387, 0, 1, 0.9764706, 1,
-0.03712426, -0.1348973, -2.426878, 0, 1, 0.9803922, 1,
-0.03171425, 0.3771549, -0.02230915, 0, 1, 0.9882353, 1,
-0.02590066, 0.3284804, -0.7259266, 0, 1, 0.9921569, 1,
-0.02588383, -0.6175591, -3.979855, 0, 1, 1, 1,
-0.02480818, 0.9341829, -0.364223, 0, 0.9921569, 1, 1,
-0.02396171, 0.3149561, -0.6142274, 0, 0.9882353, 1, 1,
-0.009452553, 0.7054595, -0.7930624, 0, 0.9803922, 1, 1,
-0.008115124, 0.3564627, 0.3435797, 0, 0.9764706, 1, 1,
-0.006983703, -1.334008, -2.750965, 0, 0.9686275, 1, 1,
-0.006619722, -0.3997747, -2.702125, 0, 0.9647059, 1, 1,
0.001589395, 0.01298768, -0.9240461, 0, 0.9568627, 1, 1,
0.005409006, 0.09885957, 1.041661, 0, 0.9529412, 1, 1,
0.005518673, -2.119529, 5.201978, 0, 0.945098, 1, 1,
0.007301099, -0.06970035, 4.237386, 0, 0.9411765, 1, 1,
0.00741825, 1.777637, 0.5012503, 0, 0.9333333, 1, 1,
0.008097326, 1.048788, -1.279173, 0, 0.9294118, 1, 1,
0.01162042, -0.2038739, 3.713976, 0, 0.9215686, 1, 1,
0.01438773, 0.4818899, 0.004399728, 0, 0.9176471, 1, 1,
0.01709455, -2.000711, 4.33631, 0, 0.9098039, 1, 1,
0.02202199, -0.9104389, 4.219022, 0, 0.9058824, 1, 1,
0.02481761, 0.4984582, 0.3315625, 0, 0.8980392, 1, 1,
0.02634142, -1.234907, 1.87026, 0, 0.8901961, 1, 1,
0.02911163, 0.5679469, -1.902608, 0, 0.8862745, 1, 1,
0.03207455, -2.122427, 3.25868, 0, 0.8784314, 1, 1,
0.03581556, -0.2183665, 2.428621, 0, 0.8745098, 1, 1,
0.03865286, -1.711231, 4.761502, 0, 0.8666667, 1, 1,
0.03910116, 1.045543, -0.2256951, 0, 0.8627451, 1, 1,
0.04204245, 1.51989, 0.9607969, 0, 0.854902, 1, 1,
0.04616215, -0.3090423, 2.784722, 0, 0.8509804, 1, 1,
0.04882203, 0.6737231, 0.6093332, 0, 0.8431373, 1, 1,
0.05145171, 0.3267508, 1.031265, 0, 0.8392157, 1, 1,
0.0557307, -0.8176491, 3.697566, 0, 0.8313726, 1, 1,
0.05732273, 2.237684, -1.023126, 0, 0.827451, 1, 1,
0.05904933, -0.2861965, 2.026305, 0, 0.8196079, 1, 1,
0.06170208, 0.258464, 0.07079723, 0, 0.8156863, 1, 1,
0.06379768, 0.3382569, 1.893003, 0, 0.8078431, 1, 1,
0.06427603, 0.3478431, 1.065712, 0, 0.8039216, 1, 1,
0.07131465, 0.7574781, -1.878335, 0, 0.7960784, 1, 1,
0.07785439, 0.2969136, 1.973541, 0, 0.7882353, 1, 1,
0.08435486, 1.45789, 2.274458, 0, 0.7843137, 1, 1,
0.08756354, -1.163078, 3.950484, 0, 0.7764706, 1, 1,
0.09473578, 0.18861, -0.1594761, 0, 0.772549, 1, 1,
0.09556903, -1.203536, 2.128081, 0, 0.7647059, 1, 1,
0.0956629, 2.15194, 0.6173016, 0, 0.7607843, 1, 1,
0.09928811, 0.5593193, -1.715122, 0, 0.7529412, 1, 1,
0.1014063, -1.881088, 2.252707, 0, 0.7490196, 1, 1,
0.1015197, 0.2012889, 1.787287, 0, 0.7411765, 1, 1,
0.1057819, 0.6683493, -0.9068347, 0, 0.7372549, 1, 1,
0.110558, -1.192906, 4.625652, 0, 0.7294118, 1, 1,
0.1121252, -0.155394, 2.168756, 0, 0.7254902, 1, 1,
0.114607, -1.016878, 1.607831, 0, 0.7176471, 1, 1,
0.1155894, 1.335915, 0.1746706, 0, 0.7137255, 1, 1,
0.1242592, 1.742919, 0.1540228, 0, 0.7058824, 1, 1,
0.1242997, -0.5164667, 3.446704, 0, 0.6980392, 1, 1,
0.1257129, -2.407146, 1.539801, 0, 0.6941177, 1, 1,
0.1266292, 0.9995355, 0.7784296, 0, 0.6862745, 1, 1,
0.1287019, 0.5000163, 0.4534975, 0, 0.682353, 1, 1,
0.1312571, -0.6889901, 2.52458, 0, 0.6745098, 1, 1,
0.1323671, -0.3824858, 5.230575, 0, 0.6705883, 1, 1,
0.1331925, 0.6422372, -0.2372168, 0, 0.6627451, 1, 1,
0.1388285, -0.2314041, 1.619606, 0, 0.6588235, 1, 1,
0.1401302, -0.4849858, 2.93185, 0, 0.6509804, 1, 1,
0.1407539, 0.7439522, 0.6852077, 0, 0.6470588, 1, 1,
0.1426479, 0.1657454, 0.4003305, 0, 0.6392157, 1, 1,
0.1431918, 1.456378, -2.023584, 0, 0.6352941, 1, 1,
0.1436897, -0.7200004, 2.53573, 0, 0.627451, 1, 1,
0.1444293, 0.2812037, 0.2679158, 0, 0.6235294, 1, 1,
0.144724, 0.1371422, -0.2459444, 0, 0.6156863, 1, 1,
0.1449732, 0.8843165, -0.1556342, 0, 0.6117647, 1, 1,
0.1517558, -0.9641326, 2.139174, 0, 0.6039216, 1, 1,
0.1541053, 1.115416, 1.06506, 0, 0.5960785, 1, 1,
0.158034, -0.2857909, 1.722562, 0, 0.5921569, 1, 1,
0.1663764, -0.6344188, 2.980805, 0, 0.5843138, 1, 1,
0.1680049, 0.8557609, 0.04262352, 0, 0.5803922, 1, 1,
0.1686949, -0.6690331, 3.561451, 0, 0.572549, 1, 1,
0.1687368, -1.496358, 2.284216, 0, 0.5686275, 1, 1,
0.1766299, -1.357919, 3.268998, 0, 0.5607843, 1, 1,
0.1827097, -0.8072677, 4.218811, 0, 0.5568628, 1, 1,
0.1896928, 0.7356453, 1.043369, 0, 0.5490196, 1, 1,
0.1909264, 0.772512, -0.8618666, 0, 0.5450981, 1, 1,
0.1913606, -1.050149, 2.318438, 0, 0.5372549, 1, 1,
0.1921697, -0.1244045, 2.478641, 0, 0.5333334, 1, 1,
0.1950996, -0.8764308, 2.307243, 0, 0.5254902, 1, 1,
0.2014337, 0.4194197, -0.4687084, 0, 0.5215687, 1, 1,
0.2026665, 0.5918521, 0.3831627, 0, 0.5137255, 1, 1,
0.2079979, 0.1816009, 1.56909, 0, 0.509804, 1, 1,
0.2090172, 0.482674, 0.5139315, 0, 0.5019608, 1, 1,
0.2157943, -1.078004, 4.448085, 0, 0.4941176, 1, 1,
0.220812, -0.6761917, 3.760494, 0, 0.4901961, 1, 1,
0.2213804, 0.4583787, 1.297191, 0, 0.4823529, 1, 1,
0.221522, 0.7045323, 1.048657, 0, 0.4784314, 1, 1,
0.222283, 0.05623486, 1.185661, 0, 0.4705882, 1, 1,
0.2305132, -0.5461416, 4.513368, 0, 0.4666667, 1, 1,
0.2327392, -0.5540655, 3.563663, 0, 0.4588235, 1, 1,
0.2340727, 0.150257, 0.931575, 0, 0.454902, 1, 1,
0.2442324, 1.141664, -1.841106, 0, 0.4470588, 1, 1,
0.2445456, 0.1474411, -0.6106517, 0, 0.4431373, 1, 1,
0.2446179, 0.3599793, -0.05068315, 0, 0.4352941, 1, 1,
0.2497122, -0.1308667, 1.838403, 0, 0.4313726, 1, 1,
0.2501213, 1.254182, -0.5095924, 0, 0.4235294, 1, 1,
0.2507029, -1.867536, 3.866715, 0, 0.4196078, 1, 1,
0.2508222, 0.4846137, 2.026417, 0, 0.4117647, 1, 1,
0.2511184, -0.7783806, 3.115204, 0, 0.4078431, 1, 1,
0.2528876, 0.9756504, 1.810813, 0, 0.4, 1, 1,
0.2532901, 1.625054, -1.20023, 0, 0.3921569, 1, 1,
0.256772, 0.6116807, -0.4187901, 0, 0.3882353, 1, 1,
0.2586751, 0.001411454, 2.434345, 0, 0.3803922, 1, 1,
0.270992, -1.250263, 1.095759, 0, 0.3764706, 1, 1,
0.2785502, -1.351013, 2.964865, 0, 0.3686275, 1, 1,
0.282386, -0.8890345, 1.603363, 0, 0.3647059, 1, 1,
0.2854035, -1.21187, 1.391127, 0, 0.3568628, 1, 1,
0.2877131, -0.9537953, 1.386038, 0, 0.3529412, 1, 1,
0.2898833, 0.9129316, -0.08817293, 0, 0.345098, 1, 1,
0.2968394, -1.479597, 4.115989, 0, 0.3411765, 1, 1,
0.3064854, -0.8491647, 1.906411, 0, 0.3333333, 1, 1,
0.3077689, 0.4927044, 0.7356732, 0, 0.3294118, 1, 1,
0.3175777, -1.750159, 4.803256, 0, 0.3215686, 1, 1,
0.3228346, -1.271005, 2.115624, 0, 0.3176471, 1, 1,
0.3236658, 0.6139733, 0.5825224, 0, 0.3098039, 1, 1,
0.3268324, -0.166342, 2.780336, 0, 0.3058824, 1, 1,
0.3299402, 0.5430702, -0.08273931, 0, 0.2980392, 1, 1,
0.3325299, 0.7463033, 1.009469, 0, 0.2901961, 1, 1,
0.3353915, 0.005516225, 2.8305, 0, 0.2862745, 1, 1,
0.3367812, -0.9031042, 2.988629, 0, 0.2784314, 1, 1,
0.3446607, -0.3104293, 1.685906, 0, 0.2745098, 1, 1,
0.3471672, 0.1943071, 1.902808, 0, 0.2666667, 1, 1,
0.3496056, -0.743618, 2.540603, 0, 0.2627451, 1, 1,
0.3562908, -0.6024647, 3.414639, 0, 0.254902, 1, 1,
0.356575, -0.521794, 2.236297, 0, 0.2509804, 1, 1,
0.358258, -2.212831, 2.568619, 0, 0.2431373, 1, 1,
0.3587223, -0.5099117, 2.057828, 0, 0.2392157, 1, 1,
0.3603425, 0.4581174, 0.7499648, 0, 0.2313726, 1, 1,
0.3605077, 0.07532105, 2.06044, 0, 0.227451, 1, 1,
0.3611941, -0.4471801, 2.746255, 0, 0.2196078, 1, 1,
0.3655512, -0.5828967, 2.71289, 0, 0.2156863, 1, 1,
0.3747495, -0.09776165, 0.04217887, 0, 0.2078431, 1, 1,
0.3775906, 0.1494184, -0.9839761, 0, 0.2039216, 1, 1,
0.3815584, -0.7509103, 3.038938, 0, 0.1960784, 1, 1,
0.3817705, 1.215468, 0.7725447, 0, 0.1882353, 1, 1,
0.3891574, 0.4147779, -0.2123973, 0, 0.1843137, 1, 1,
0.3910539, 1.468587, 0.7417251, 0, 0.1764706, 1, 1,
0.3942083, 0.5153906, 0.5740978, 0, 0.172549, 1, 1,
0.3953954, -0.825527, 3.128853, 0, 0.1647059, 1, 1,
0.3970763, -0.8494692, 1.967465, 0, 0.1607843, 1, 1,
0.4013548, 0.3885548, 1.352776, 0, 0.1529412, 1, 1,
0.4056304, -0.666886, 2.699967, 0, 0.1490196, 1, 1,
0.407003, 0.5903371, -0.6035867, 0, 0.1411765, 1, 1,
0.4071448, -1.62905, 1.941676, 0, 0.1372549, 1, 1,
0.4088563, -1.936407, 3.265707, 0, 0.1294118, 1, 1,
0.409571, -1.167089, 2.885939, 0, 0.1254902, 1, 1,
0.4103262, 0.1778001, 0.4765071, 0, 0.1176471, 1, 1,
0.4107232, 0.8393715, 0.4663763, 0, 0.1137255, 1, 1,
0.4113092, 0.3734616, 0.2026252, 0, 0.1058824, 1, 1,
0.4116282, 0.8450672, -0.09457147, 0, 0.09803922, 1, 1,
0.4136291, 0.4150825, -1.021352, 0, 0.09411765, 1, 1,
0.413848, -0.2395485, 3.062787, 0, 0.08627451, 1, 1,
0.4141031, -0.9775874, 3.213735, 0, 0.08235294, 1, 1,
0.4212296, -0.6942661, 2.356448, 0, 0.07450981, 1, 1,
0.4263405, 1.404783, 1.450342, 0, 0.07058824, 1, 1,
0.4311126, -0.7681648, 3.733383, 0, 0.0627451, 1, 1,
0.438781, 0.07138254, 1.083358, 0, 0.05882353, 1, 1,
0.4391774, -0.02134261, 1.552804, 0, 0.05098039, 1, 1,
0.4424866, -0.5494205, 1.647884, 0, 0.04705882, 1, 1,
0.4440795, 2.104156, 1.588187, 0, 0.03921569, 1, 1,
0.4506707, 0.1621419, -0.1223852, 0, 0.03529412, 1, 1,
0.4557743, -0.8736479, 2.370487, 0, 0.02745098, 1, 1,
0.4584162, 1.664668, 1.364108, 0, 0.02352941, 1, 1,
0.4592948, -2.287644, 2.961202, 0, 0.01568628, 1, 1,
0.4607265, -0.7348363, 3.47839, 0, 0.01176471, 1, 1,
0.4631604, -0.930409, 0.8303381, 0, 0.003921569, 1, 1,
0.4636674, -1.341618, 2.802887, 0.003921569, 0, 1, 1,
0.4655371, 0.5968124, 0.8745107, 0.007843138, 0, 1, 1,
0.4742724, -1.015064, 1.446933, 0.01568628, 0, 1, 1,
0.480398, 0.3207726, 1.640698, 0.01960784, 0, 1, 1,
0.4829163, -0.04149313, 0.7199677, 0.02745098, 0, 1, 1,
0.4872896, 1.440871, 2.284975, 0.03137255, 0, 1, 1,
0.4874765, 0.9568712, 1.779228, 0.03921569, 0, 1, 1,
0.4885538, -1.461955, 1.916398, 0.04313726, 0, 1, 1,
0.490578, 0.8121529, 1.388651, 0.05098039, 0, 1, 1,
0.4931794, 0.1876885, 1.367213, 0.05490196, 0, 1, 1,
0.4981614, 1.618094, 0.5900584, 0.0627451, 0, 1, 1,
0.505522, -0.210305, 0.02088205, 0.06666667, 0, 1, 1,
0.5115843, -2.055188, 3.085663, 0.07450981, 0, 1, 1,
0.5128669, -0.9171224, 1.613532, 0.07843138, 0, 1, 1,
0.5148406, -2.179441, 2.431834, 0.08627451, 0, 1, 1,
0.5150982, 0.2974144, 3.342528, 0.09019608, 0, 1, 1,
0.5172528, 0.07696133, 1.338145, 0.09803922, 0, 1, 1,
0.5184039, -0.4707284, 4.431872, 0.1058824, 0, 1, 1,
0.5193869, -1.053192, 3.435225, 0.1098039, 0, 1, 1,
0.5219454, -0.4073227, 1.875448, 0.1176471, 0, 1, 1,
0.5279691, 0.03519849, 1.208816, 0.1215686, 0, 1, 1,
0.529045, -1.526516, 1.602927, 0.1294118, 0, 1, 1,
0.5295404, -0.1639223, 1.352393, 0.1333333, 0, 1, 1,
0.5318785, -0.8698765, 2.766276, 0.1411765, 0, 1, 1,
0.5340468, -1.490621, 3.066131, 0.145098, 0, 1, 1,
0.5417804, -1.076009, 3.528291, 0.1529412, 0, 1, 1,
0.5438001, 0.300459, -0.3199174, 0.1568628, 0, 1, 1,
0.546519, -0.2594123, 2.024518, 0.1647059, 0, 1, 1,
0.546846, 1.07031, 2.165925, 0.1686275, 0, 1, 1,
0.547166, 0.3948058, 0.7929937, 0.1764706, 0, 1, 1,
0.5477681, -1.248147, 3.212764, 0.1803922, 0, 1, 1,
0.5528996, 1.940326, -0.3099258, 0.1882353, 0, 1, 1,
0.5596524, -0.3372564, 1.973729, 0.1921569, 0, 1, 1,
0.5597091, -1.372301, 2.890955, 0.2, 0, 1, 1,
0.5625874, -0.8590762, 3.98741, 0.2078431, 0, 1, 1,
0.5657441, 0.8297281, 0.3845865, 0.2117647, 0, 1, 1,
0.5661799, 0.603787, 0.5564746, 0.2196078, 0, 1, 1,
0.567369, 2.176405, -0.8380221, 0.2235294, 0, 1, 1,
0.5677435, 1.796361, 0.03375984, 0.2313726, 0, 1, 1,
0.570042, -0.1972423, 0.5323571, 0.2352941, 0, 1, 1,
0.5701751, -0.5154166, 3.142332, 0.2431373, 0, 1, 1,
0.5708066, -0.09502262, -0.4924624, 0.2470588, 0, 1, 1,
0.5731705, -0.5638646, 2.621653, 0.254902, 0, 1, 1,
0.5734613, -1.930795, 4.379831, 0.2588235, 0, 1, 1,
0.5743337, -0.6967701, 2.455601, 0.2666667, 0, 1, 1,
0.5760106, 1.204902, 0.1805981, 0.2705882, 0, 1, 1,
0.5762361, -0.2292267, 3.589096, 0.2784314, 0, 1, 1,
0.5764167, 0.4862639, 0.4156875, 0.282353, 0, 1, 1,
0.5857322, 0.5290645, 0.7005387, 0.2901961, 0, 1, 1,
0.5868706, 0.1504095, 4.653095, 0.2941177, 0, 1, 1,
0.5884415, 0.2233873, 2.870872, 0.3019608, 0, 1, 1,
0.5889301, 0.5736365, 0.6842204, 0.3098039, 0, 1, 1,
0.5926771, 0.2944414, 0.972989, 0.3137255, 0, 1, 1,
0.5952959, -0.3682898, 2.956304, 0.3215686, 0, 1, 1,
0.6005386, 0.8694415, 0.7868312, 0.3254902, 0, 1, 1,
0.6007572, 0.4539608, 1.29326, 0.3333333, 0, 1, 1,
0.6017817, 0.8497622, -0.0937245, 0.3372549, 0, 1, 1,
0.6025403, -0.1010589, 1.381432, 0.345098, 0, 1, 1,
0.6028295, 0.2339581, 0.8936827, 0.3490196, 0, 1, 1,
0.603228, 0.07209036, 1.594205, 0.3568628, 0, 1, 1,
0.606614, 0.05873764, 2.069007, 0.3607843, 0, 1, 1,
0.610677, 0.1527714, 2.305321, 0.3686275, 0, 1, 1,
0.6135697, 1.265536, 0.439001, 0.372549, 0, 1, 1,
0.6168535, 1.118632, -0.8964282, 0.3803922, 0, 1, 1,
0.6171211, 0.1576616, 1.864771, 0.3843137, 0, 1, 1,
0.6243131, 0.9284267, 1.376053, 0.3921569, 0, 1, 1,
0.6251408, 1.073761, -0.3867854, 0.3960784, 0, 1, 1,
0.6251452, -2.236978, 2.435696, 0.4039216, 0, 1, 1,
0.6269328, -1.281846, 4.011347, 0.4117647, 0, 1, 1,
0.6275747, -1.322311, 2.79907, 0.4156863, 0, 1, 1,
0.6349756, -0.2401437, 2.160372, 0.4235294, 0, 1, 1,
0.6386297, -0.389109, 2.186533, 0.427451, 0, 1, 1,
0.6451988, -1.703792, 0.806328, 0.4352941, 0, 1, 1,
0.6490124, -1.441137, 2.648498, 0.4392157, 0, 1, 1,
0.655359, -1.247082, 2.792983, 0.4470588, 0, 1, 1,
0.6566457, -1.076319, 3.326892, 0.4509804, 0, 1, 1,
0.657975, 2.26028, 1.159358, 0.4588235, 0, 1, 1,
0.6603051, 0.8539996, 2.096561, 0.4627451, 0, 1, 1,
0.6704114, -0.3057398, 1.387751, 0.4705882, 0, 1, 1,
0.6816759, 0.9021785, 0.4421327, 0.4745098, 0, 1, 1,
0.6870361, -0.0558934, 2.581954, 0.4823529, 0, 1, 1,
0.6943797, -0.04025177, 2.936521, 0.4862745, 0, 1, 1,
0.6950763, -0.5068182, 1.393046, 0.4941176, 0, 1, 1,
0.7001832, -0.6639241, 4.275315, 0.5019608, 0, 1, 1,
0.7038099, -2.502792, 2.765738, 0.5058824, 0, 1, 1,
0.7051788, -0.1162925, 1.670495, 0.5137255, 0, 1, 1,
0.7098237, -0.1293661, 2.853066, 0.5176471, 0, 1, 1,
0.7117684, -1.032602, 2.410404, 0.5254902, 0, 1, 1,
0.71206, 1.004247, -1.015232, 0.5294118, 0, 1, 1,
0.7136738, -1.60497, 2.621221, 0.5372549, 0, 1, 1,
0.7146145, -1.345537, 2.28844, 0.5411765, 0, 1, 1,
0.7225856, 0.8373369, -0.7316425, 0.5490196, 0, 1, 1,
0.7462969, 1.631491, 0.3906535, 0.5529412, 0, 1, 1,
0.7464293, 0.4983608, 1.899359, 0.5607843, 0, 1, 1,
0.7475601, -1.362047, 3.14556, 0.5647059, 0, 1, 1,
0.7480059, -2.084254, 2.683964, 0.572549, 0, 1, 1,
0.7497247, -0.4501192, 2.436337, 0.5764706, 0, 1, 1,
0.7536643, 0.3942146, 0.6646969, 0.5843138, 0, 1, 1,
0.7573174, -0.5061918, 1.682315, 0.5882353, 0, 1, 1,
0.758509, -0.1823079, -0.176738, 0.5960785, 0, 1, 1,
0.7647133, -0.1664288, 0.7928364, 0.6039216, 0, 1, 1,
0.7865991, -0.6256481, 3.812665, 0.6078432, 0, 1, 1,
0.7869742, -0.05682091, 4.756976, 0.6156863, 0, 1, 1,
0.7890738, -1.564738, 0.1867529, 0.6196079, 0, 1, 1,
0.8028536, -1.794606, 1.182096, 0.627451, 0, 1, 1,
0.809329, 0.2572768, 1.383384, 0.6313726, 0, 1, 1,
0.8121635, 1.155863, 1.470774, 0.6392157, 0, 1, 1,
0.8151353, 0.515828, 1.200424, 0.6431373, 0, 1, 1,
0.8167669, 1.608604, 2.037597, 0.6509804, 0, 1, 1,
0.8187566, 0.06147772, 1.933132, 0.654902, 0, 1, 1,
0.8198676, 0.1623136, 1.291925, 0.6627451, 0, 1, 1,
0.8203538, 1.437469, 2.112138, 0.6666667, 0, 1, 1,
0.8207403, -1.850156, 3.389524, 0.6745098, 0, 1, 1,
0.8237354, 1.824925, 0.8746929, 0.6784314, 0, 1, 1,
0.8249953, 0.4381955, 1.19116, 0.6862745, 0, 1, 1,
0.8259318, 0.6760493, -0.9879181, 0.6901961, 0, 1, 1,
0.8284869, 0.2368071, 0.1402861, 0.6980392, 0, 1, 1,
0.8372231, -0.6321455, 1.640414, 0.7058824, 0, 1, 1,
0.8384766, 0.1109251, 3.235133, 0.7098039, 0, 1, 1,
0.8385256, 1.048643, 1.835626, 0.7176471, 0, 1, 1,
0.8396617, -0.904754, 2.941882, 0.7215686, 0, 1, 1,
0.8531339, -0.09558693, 3.260261, 0.7294118, 0, 1, 1,
0.8598768, 0.3263588, 0.8531461, 0.7333333, 0, 1, 1,
0.8632915, -0.0002202429, 1.057503, 0.7411765, 0, 1, 1,
0.8683285, -0.288334, 2.760419, 0.7450981, 0, 1, 1,
0.871094, 1.815557, 1.139462, 0.7529412, 0, 1, 1,
0.8735862, 0.160657, -0.1294964, 0.7568628, 0, 1, 1,
0.8750767, 1.073204, 0.8048306, 0.7647059, 0, 1, 1,
0.875258, -1.08467, 2.912046, 0.7686275, 0, 1, 1,
0.8756446, -0.0226367, 2.789709, 0.7764706, 0, 1, 1,
0.8764793, -0.04000754, 1.814312, 0.7803922, 0, 1, 1,
0.8826876, 0.9486319, 1.289323, 0.7882353, 0, 1, 1,
0.8878536, 0.3907477, 1.626614, 0.7921569, 0, 1, 1,
0.8912887, 0.3897444, 3.098749, 0.8, 0, 1, 1,
0.9009941, 0.3798783, 0.9096187, 0.8078431, 0, 1, 1,
0.9023259, -0.7767431, 1.869148, 0.8117647, 0, 1, 1,
0.9093841, -0.1304954, 1.552111, 0.8196079, 0, 1, 1,
0.9147034, 0.7958439, 1.607187, 0.8235294, 0, 1, 1,
0.9177631, 1.684587, -0.6312901, 0.8313726, 0, 1, 1,
0.9223568, 1.061016, -0.08235274, 0.8352941, 0, 1, 1,
0.9246826, 0.01402553, 2.52444, 0.8431373, 0, 1, 1,
0.9262673, 1.345218, -0.1533568, 0.8470588, 0, 1, 1,
0.9288437, 0.5108265, 0.2413947, 0.854902, 0, 1, 1,
0.9294705, 0.9993582, 0.7918904, 0.8588235, 0, 1, 1,
0.9305698, 0.6145869, -1.329681, 0.8666667, 0, 1, 1,
0.9329017, 0.4905633, 1.018224, 0.8705882, 0, 1, 1,
0.9359927, -1.315268, 3.041443, 0.8784314, 0, 1, 1,
0.9409027, -1.194489, 1.845382, 0.8823529, 0, 1, 1,
0.9453494, 0.002689182, 2.218825, 0.8901961, 0, 1, 1,
0.9460528, -0.8654276, 2.571015, 0.8941177, 0, 1, 1,
0.9484395, -0.02729595, 0.172383, 0.9019608, 0, 1, 1,
0.9496396, -0.8516881, 2.072674, 0.9098039, 0, 1, 1,
0.9505578, -0.6439973, 3.633839, 0.9137255, 0, 1, 1,
0.9584974, 0.2097011, 1.703429, 0.9215686, 0, 1, 1,
0.9590042, -0.1041033, 1.465164, 0.9254902, 0, 1, 1,
0.9630064, -0.4609979, 1.395335, 0.9333333, 0, 1, 1,
0.9642637, -1.166478, 3.528056, 0.9372549, 0, 1, 1,
0.9666663, 0.164441, 3.039291, 0.945098, 0, 1, 1,
0.9723584, 0.7331126, 2.036507, 0.9490196, 0, 1, 1,
0.9792589, 0.8540942, 0.0867993, 0.9568627, 0, 1, 1,
0.9889255, 0.4911146, 0.1197964, 0.9607843, 0, 1, 1,
0.9910513, 1.302705, 0.5187998, 0.9686275, 0, 1, 1,
0.992995, 0.9598343, 0.9888306, 0.972549, 0, 1, 1,
0.9936808, -0.8533345, 1.343033, 0.9803922, 0, 1, 1,
0.9991999, 0.9955693, -0.9348041, 0.9843137, 0, 1, 1,
1.001758, 0.222589, 1.392306, 0.9921569, 0, 1, 1,
1.007405, -0.5293795, 2.353927, 0.9960784, 0, 1, 1,
1.017398, -0.1989791, 2.093305, 1, 0, 0.9960784, 1,
1.023926, 0.9022107, 0.9089518, 1, 0, 0.9882353, 1,
1.038474, -0.5616434, 2.446561, 1, 0, 0.9843137, 1,
1.044726, -1.048553, 3.735071, 1, 0, 0.9764706, 1,
1.04916, -0.9245182, 1.183412, 1, 0, 0.972549, 1,
1.055012, -1.880329, 2.627112, 1, 0, 0.9647059, 1,
1.058418, -1.874896, 1.292755, 1, 0, 0.9607843, 1,
1.062438, -1.767153, 1.115888, 1, 0, 0.9529412, 1,
1.063923, -0.552597, 3.255051, 1, 0, 0.9490196, 1,
1.064179, 0.9920939, 1.259941, 1, 0, 0.9411765, 1,
1.066381, 1.677769, 0.7323414, 1, 0, 0.9372549, 1,
1.071153, 2.360509, 1.194264, 1, 0, 0.9294118, 1,
1.086966, 2.321276, -0.8461236, 1, 0, 0.9254902, 1,
1.087947, -0.6056348, 1.50412, 1, 0, 0.9176471, 1,
1.089893, -0.8878243, 3.38474, 1, 0, 0.9137255, 1,
1.09015, 1.220991, 1.113832, 1, 0, 0.9058824, 1,
1.090858, -0.2223031, 2.501392, 1, 0, 0.9019608, 1,
1.096259, 1.32464, 0.8364015, 1, 0, 0.8941177, 1,
1.096299, -0.2573951, 2.960727, 1, 0, 0.8862745, 1,
1.101909, 0.2228035, 2.968352, 1, 0, 0.8823529, 1,
1.10974, -1.154323, 2.850225, 1, 0, 0.8745098, 1,
1.111677, 0.7321023, 1.396927, 1, 0, 0.8705882, 1,
1.112192, 1.510231, 0.7511865, 1, 0, 0.8627451, 1,
1.113774, -0.998026, 3.547091, 1, 0, 0.8588235, 1,
1.114378, -0.05710044, 1.782824, 1, 0, 0.8509804, 1,
1.114604, 1.138478, 1.394484, 1, 0, 0.8470588, 1,
1.119172, 0.1836809, 2.019783, 1, 0, 0.8392157, 1,
1.122083, 0.2078044, 1.704979, 1, 0, 0.8352941, 1,
1.13, 0.7358928, -0.5818099, 1, 0, 0.827451, 1,
1.136668, 0.2055, -1.104848, 1, 0, 0.8235294, 1,
1.156375, 0.2771529, 1.587486, 1, 0, 0.8156863, 1,
1.15742, 1.142935, 0.2059, 1, 0, 0.8117647, 1,
1.157648, 1.451935, -1.484606, 1, 0, 0.8039216, 1,
1.159155, 1.909626, -0.8446631, 1, 0, 0.7960784, 1,
1.1697, 0.09890123, 2.742182, 1, 0, 0.7921569, 1,
1.175688, 0.4749573, -0.2721255, 1, 0, 0.7843137, 1,
1.178775, -0.2564121, 3.157028, 1, 0, 0.7803922, 1,
1.179142, -0.02532967, 1.185255, 1, 0, 0.772549, 1,
1.180576, -0.05664843, 1.683968, 1, 0, 0.7686275, 1,
1.181342, 0.2608209, 1.078846, 1, 0, 0.7607843, 1,
1.182839, 0.3654986, 1.274733, 1, 0, 0.7568628, 1,
1.183053, -0.5775866, 2.891012, 1, 0, 0.7490196, 1,
1.187043, -1.841268, 2.13303, 1, 0, 0.7450981, 1,
1.197797, 0.8478824, 1.400203, 1, 0, 0.7372549, 1,
1.198046, 0.9919316, -0.04458434, 1, 0, 0.7333333, 1,
1.200562, 1.248804, 1.308049, 1, 0, 0.7254902, 1,
1.214673, 0.315559, 1.500443, 1, 0, 0.7215686, 1,
1.21587, -0.9875351, 1.812008, 1, 0, 0.7137255, 1,
1.215959, 0.6377971, 2.261816, 1, 0, 0.7098039, 1,
1.218185, 0.3479077, 0.9246011, 1, 0, 0.7019608, 1,
1.229873, -0.5843294, 3.208374, 1, 0, 0.6941177, 1,
1.235538, 0.5493455, -0.6923319, 1, 0, 0.6901961, 1,
1.243733, 0.3062104, 1.521894, 1, 0, 0.682353, 1,
1.247177, -1.037089, 3.964617, 1, 0, 0.6784314, 1,
1.253343, -1.020105, 1.897399, 1, 0, 0.6705883, 1,
1.297571, -2.223046, 2.390399, 1, 0, 0.6666667, 1,
1.300646, 0.4905191, 1.69029, 1, 0, 0.6588235, 1,
1.308908, -0.8268279, 2.123249, 1, 0, 0.654902, 1,
1.330326, -0.06329881, 2.665167, 1, 0, 0.6470588, 1,
1.335855, -0.3808533, 2.314085, 1, 0, 0.6431373, 1,
1.340391, 0.2311879, -0.3581509, 1, 0, 0.6352941, 1,
1.340714, -1.081866, 2.703479, 1, 0, 0.6313726, 1,
1.343881, -1.471679, 2.227072, 1, 0, 0.6235294, 1,
1.353016, 0.3414524, 1.579448, 1, 0, 0.6196079, 1,
1.355131, 0.1590578, 1.942738, 1, 0, 0.6117647, 1,
1.357916, -2.518137, 1.430815, 1, 0, 0.6078432, 1,
1.359465, 0.5009209, -0.3967611, 1, 0, 0.6, 1,
1.361722, 1.134043, 1.183266, 1, 0, 0.5921569, 1,
1.368611, 0.6032865, -0.2543387, 1, 0, 0.5882353, 1,
1.398097, 0.02141642, 2.529437, 1, 0, 0.5803922, 1,
1.400583, 0.3615273, 1.360381, 1, 0, 0.5764706, 1,
1.401044, -0.8777962, 1.901208, 1, 0, 0.5686275, 1,
1.402534, 0.5598175, 2.048553, 1, 0, 0.5647059, 1,
1.406846, 0.3033334, 0.7639294, 1, 0, 0.5568628, 1,
1.408007, -0.8095316, 1.731689, 1, 0, 0.5529412, 1,
1.410973, 0.4953266, 1.2972, 1, 0, 0.5450981, 1,
1.421961, 0.03785522, 2.399282, 1, 0, 0.5411765, 1,
1.43032, -0.04166139, 3.876926, 1, 0, 0.5333334, 1,
1.438743, -0.3636852, 1.540433, 1, 0, 0.5294118, 1,
1.456785, -0.1454476, 1.261728, 1, 0, 0.5215687, 1,
1.457903, 0.2268273, 2.072551, 1, 0, 0.5176471, 1,
1.469135, 1.182203, 0.4192167, 1, 0, 0.509804, 1,
1.475593, -1.718051, 2.978193, 1, 0, 0.5058824, 1,
1.480352, 0.2682618, 3.102321, 1, 0, 0.4980392, 1,
1.482374, 0.7795324, 2.110009, 1, 0, 0.4901961, 1,
1.483454, 1.87227, -1.442577, 1, 0, 0.4862745, 1,
1.486076, -0.2088195, 0.5929788, 1, 0, 0.4784314, 1,
1.491165, 0.8486978, 1.206602, 1, 0, 0.4745098, 1,
1.506377, 1.456494, 0.1249236, 1, 0, 0.4666667, 1,
1.507967, -0.1612545, 2.529349, 1, 0, 0.4627451, 1,
1.513311, -0.2801542, 2.252941, 1, 0, 0.454902, 1,
1.517026, -1.085703, 4.131446, 1, 0, 0.4509804, 1,
1.519152, 0.01043919, 1.988684, 1, 0, 0.4431373, 1,
1.523415, 1.095621, 1.310159, 1, 0, 0.4392157, 1,
1.527492, 0.7107307, -0.9139408, 1, 0, 0.4313726, 1,
1.532499, 0.1589951, 1.851801, 1, 0, 0.427451, 1,
1.53758, 0.5399188, 2.430112, 1, 0, 0.4196078, 1,
1.546959, 2.129906, -1.570919, 1, 0, 0.4156863, 1,
1.549461, -0.6425952, 2.749779, 1, 0, 0.4078431, 1,
1.551606, 1.620772, 1.150767, 1, 0, 0.4039216, 1,
1.585898, -1.209851, 3.772919, 1, 0, 0.3960784, 1,
1.586762, -0.4368369, 0.02934523, 1, 0, 0.3882353, 1,
1.593543, 0.9003512, 1.69805, 1, 0, 0.3843137, 1,
1.595591, -1.883228, 2.866708, 1, 0, 0.3764706, 1,
1.613637, 1.322504, -0.9923383, 1, 0, 0.372549, 1,
1.619917, 0.3244797, 1.08586, 1, 0, 0.3647059, 1,
1.626024, 0.1866727, 1.154338, 1, 0, 0.3607843, 1,
1.632958, 0.310904, 1.386781, 1, 0, 0.3529412, 1,
1.633494, 0.1966707, 3.096411, 1, 0, 0.3490196, 1,
1.635061, 1.221068, 0.7807211, 1, 0, 0.3411765, 1,
1.637449, 0.2187681, 0.2502436, 1, 0, 0.3372549, 1,
1.639095, 0.8918072, 0.1761093, 1, 0, 0.3294118, 1,
1.647823, -1.295453, 1.740111, 1, 0, 0.3254902, 1,
1.654095, 0.2797853, 0.246221, 1, 0, 0.3176471, 1,
1.654137, 0.7915598, 0.9200883, 1, 0, 0.3137255, 1,
1.654217, -1.286135, 2.024868, 1, 0, 0.3058824, 1,
1.659508, -0.32133, 1.295151, 1, 0, 0.2980392, 1,
1.666167, 0.1633487, 0.8468084, 1, 0, 0.2941177, 1,
1.676116, 0.365447, 2.051401, 1, 0, 0.2862745, 1,
1.689304, -0.5481761, -0.3112949, 1, 0, 0.282353, 1,
1.722093, 0.3382044, 1.01846, 1, 0, 0.2745098, 1,
1.727783, 0.4339589, 0.1510452, 1, 0, 0.2705882, 1,
1.727813, -0.036236, 1.747038, 1, 0, 0.2627451, 1,
1.742965, -0.157319, 2.304564, 1, 0, 0.2588235, 1,
1.744888, -0.5345141, 2.841666, 1, 0, 0.2509804, 1,
1.747294, 0.7859231, 1.995953, 1, 0, 0.2470588, 1,
1.747695, 0.8385959, 1.339086, 1, 0, 0.2392157, 1,
1.748669, -1.060746, 1.333828, 1, 0, 0.2352941, 1,
1.749027, -0.1484678, 0.9012477, 1, 0, 0.227451, 1,
1.750849, 0.007372656, 1.507651, 1, 0, 0.2235294, 1,
1.758132, -1.013019, 3.12872, 1, 0, 0.2156863, 1,
1.766774, -1.732155, 1.785717, 1, 0, 0.2117647, 1,
1.794524, 0.466977, 1.743609, 1, 0, 0.2039216, 1,
1.796307, -0.5246248, 1.113123, 1, 0, 0.1960784, 1,
1.861363, 0.362714, 1.404722, 1, 0, 0.1921569, 1,
1.880211, 1.29798, 0.09608769, 1, 0, 0.1843137, 1,
1.921838, -0.9705573, 1.452141, 1, 0, 0.1803922, 1,
1.938933, -0.943718, 2.930791, 1, 0, 0.172549, 1,
1.947906, 0.7521803, 1.045483, 1, 0, 0.1686275, 1,
1.955202, -2.642344, 0.4933841, 1, 0, 0.1607843, 1,
2.005971, 0.9740058, 3.255607, 1, 0, 0.1568628, 1,
2.010105, 1.415299, 2.013063, 1, 0, 0.1490196, 1,
2.02821, 2.518291, 0.3273467, 1, 0, 0.145098, 1,
2.049446, 0.2787304, 2.927321, 1, 0, 0.1372549, 1,
2.076328, 1.075895, 0.8887391, 1, 0, 0.1333333, 1,
2.11715, 0.3627741, -0.2652135, 1, 0, 0.1254902, 1,
2.117415, 1.806246, -2.283907, 1, 0, 0.1215686, 1,
2.119633, 1.43776, 3.412193, 1, 0, 0.1137255, 1,
2.13944, 0.1719188, 0.6283531, 1, 0, 0.1098039, 1,
2.158794, 0.3837612, 0.761788, 1, 0, 0.1019608, 1,
2.190386, 1.537811, 1.121195, 1, 0, 0.09411765, 1,
2.230656, -0.1623968, 2.928041, 1, 0, 0.09019608, 1,
2.243368, -1.779966, 2.200792, 1, 0, 0.08235294, 1,
2.275861, 0.01132558, 0.2984234, 1, 0, 0.07843138, 1,
2.276957, 0.2650038, 1.559035, 1, 0, 0.07058824, 1,
2.278826, 0.4289892, 0.9593358, 1, 0, 0.06666667, 1,
2.296128, -0.2009945, 1.829793, 1, 0, 0.05882353, 1,
2.371616, 0.9346902, 1.798899, 1, 0, 0.05490196, 1,
2.490747, -0.006739918, 0.820054, 1, 0, 0.04705882, 1,
2.589256, -1.642271, 2.257966, 1, 0, 0.04313726, 1,
2.598641, 0.07584072, 1.276379, 1, 0, 0.03529412, 1,
2.620959, 0.330009, 1.568878, 1, 0, 0.03137255, 1,
2.90634, 1.607414, 0.7266301, 1, 0, 0.02352941, 1,
3.077441, 0.8059168, 0.7895117, 1, 0, 0.01960784, 1,
3.117182, 0.1331307, 3.212536, 1, 0, 0.01176471, 1,
3.70254, 0.9944021, 1.989947, 1, 0, 0.007843138, 1
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
0.1760651, -3.778642, -7.404008, 0, -0.5, 0.5, 0.5,
0.1760651, -3.778642, -7.404008, 1, -0.5, 0.5, 0.5,
0.1760651, -3.778642, -7.404008, 1, 1.5, 0.5, 0.5,
0.1760651, -3.778642, -7.404008, 0, 1.5, 0.5, 0.5
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
-4.545885, 0.1467401, -7.404008, 0, -0.5, 0.5, 0.5,
-4.545885, 0.1467401, -7.404008, 1, -0.5, 0.5, 0.5,
-4.545885, 0.1467401, -7.404008, 1, 1.5, 0.5, 0.5,
-4.545885, 0.1467401, -7.404008, 0, 1.5, 0.5, 0.5
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
-4.545885, -3.778642, -0.171128, 0, -0.5, 0.5, 0.5,
-4.545885, -3.778642, -0.171128, 1, -0.5, 0.5, 0.5,
-4.545885, -3.778642, -0.171128, 1, 1.5, 0.5, 0.5,
-4.545885, -3.778642, -0.171128, 0, 1.5, 0.5, 0.5
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
-2, -2.872785, -5.734882,
2, -2.872785, -5.734882,
-2, -2.872785, -5.734882,
-2, -3.023761, -6.01307,
0, -2.872785, -5.734882,
0, -3.023761, -6.01307,
2, -2.872785, -5.734882,
2, -3.023761, -6.01307
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
-2, -3.325713, -6.569446, 0, -0.5, 0.5, 0.5,
-2, -3.325713, -6.569446, 1, -0.5, 0.5, 0.5,
-2, -3.325713, -6.569446, 1, 1.5, 0.5, 0.5,
-2, -3.325713, -6.569446, 0, 1.5, 0.5, 0.5,
0, -3.325713, -6.569446, 0, -0.5, 0.5, 0.5,
0, -3.325713, -6.569446, 1, -0.5, 0.5, 0.5,
0, -3.325713, -6.569446, 1, 1.5, 0.5, 0.5,
0, -3.325713, -6.569446, 0, 1.5, 0.5, 0.5,
2, -3.325713, -6.569446, 0, -0.5, 0.5, 0.5,
2, -3.325713, -6.569446, 1, -0.5, 0.5, 0.5,
2, -3.325713, -6.569446, 1, 1.5, 0.5, 0.5,
2, -3.325713, -6.569446, 0, 1.5, 0.5, 0.5
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
-3.456204, -2, -5.734882,
-3.456204, 3, -5.734882,
-3.456204, -2, -5.734882,
-3.637817, -2, -6.01307,
-3.456204, -1, -5.734882,
-3.637817, -1, -6.01307,
-3.456204, 0, -5.734882,
-3.637817, 0, -6.01307,
-3.456204, 1, -5.734882,
-3.637817, 1, -6.01307,
-3.456204, 2, -5.734882,
-3.637817, 2, -6.01307,
-3.456204, 3, -5.734882,
-3.637817, 3, -6.01307
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
-4.001044, -2, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, -2, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, -2, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, -2, -6.569446, 0, 1.5, 0.5, 0.5,
-4.001044, -1, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, -1, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, -1, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, -1, -6.569446, 0, 1.5, 0.5, 0.5,
-4.001044, 0, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, 0, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, 0, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, 0, -6.569446, 0, 1.5, 0.5, 0.5,
-4.001044, 1, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, 1, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, 1, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, 1, -6.569446, 0, 1.5, 0.5, 0.5,
-4.001044, 2, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, 2, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, 2, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, 2, -6.569446, 0, 1.5, 0.5, 0.5,
-4.001044, 3, -6.569446, 0, -0.5, 0.5, 0.5,
-4.001044, 3, -6.569446, 1, -0.5, 0.5, 0.5,
-4.001044, 3, -6.569446, 1, 1.5, 0.5, 0.5,
-4.001044, 3, -6.569446, 0, 1.5, 0.5, 0.5
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
-3.456204, -2.872785, -4,
-3.456204, -2.872785, 4,
-3.456204, -2.872785, -4,
-3.637817, -3.023761, -4,
-3.456204, -2.872785, -2,
-3.637817, -3.023761, -2,
-3.456204, -2.872785, 0,
-3.637817, -3.023761, 0,
-3.456204, -2.872785, 2,
-3.637817, -3.023761, 2,
-3.456204, -2.872785, 4,
-3.637817, -3.023761, 4
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
-4.001044, -3.325713, -4, 0, -0.5, 0.5, 0.5,
-4.001044, -3.325713, -4, 1, -0.5, 0.5, 0.5,
-4.001044, -3.325713, -4, 1, 1.5, 0.5, 0.5,
-4.001044, -3.325713, -4, 0, 1.5, 0.5, 0.5,
-4.001044, -3.325713, -2, 0, -0.5, 0.5, 0.5,
-4.001044, -3.325713, -2, 1, -0.5, 0.5, 0.5,
-4.001044, -3.325713, -2, 1, 1.5, 0.5, 0.5,
-4.001044, -3.325713, -2, 0, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 0, 0, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 0, 1, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 0, 1, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 0, 0, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 2, 0, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 2, 1, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 2, 1, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 2, 0, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 4, 0, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 4, 1, -0.5, 0.5, 0.5,
-4.001044, -3.325713, 4, 1, 1.5, 0.5, 0.5,
-4.001044, -3.325713, 4, 0, 1.5, 0.5, 0.5
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
-3.456204, -2.872785, -5.734882,
-3.456204, 3.166265, -5.734882,
-3.456204, -2.872785, 5.392626,
-3.456204, 3.166265, 5.392626,
-3.456204, -2.872785, -5.734882,
-3.456204, -2.872785, 5.392626,
-3.456204, 3.166265, -5.734882,
-3.456204, 3.166265, 5.392626,
-3.456204, -2.872785, -5.734882,
3.808334, -2.872785, -5.734882,
-3.456204, -2.872785, 5.392626,
3.808334, -2.872785, 5.392626,
-3.456204, 3.166265, -5.734882,
3.808334, 3.166265, -5.734882,
-3.456204, 3.166265, 5.392626,
3.808334, 3.166265, 5.392626,
3.808334, -2.872785, -5.734882,
3.808334, 3.166265, -5.734882,
3.808334, -2.872785, 5.392626,
3.808334, 3.166265, 5.392626,
3.808334, -2.872785, -5.734882,
3.808334, -2.872785, 5.392626,
3.808334, 3.166265, -5.734882,
3.808334, 3.166265, 5.392626
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
var radius = 7.79438;
var distance = 34.67808;
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
mvMatrix.translate( -0.1760651, -0.1467401, 0.171128 );
mvMatrix.scale( 1.160079, 1.395491, 0.7573516 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67808);
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
Amitraz<-read.table("Amitraz.xyz")
```

```
## Error in read.table("Amitraz.xyz"): no lines available in input
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
-3.35041, -0.1791978, -2.45213, 0, 0, 1, 1, 1,
-2.582504, -1.819638, -1.258526, 1, 0, 0, 1, 1,
-2.532558, -0.1645499, -1.069694, 1, 0, 0, 1, 1,
-2.475895, 2.24084, -1.401255, 1, 0, 0, 1, 1,
-2.45962, 3.078036, -0.6027843, 1, 0, 0, 1, 1,
-2.40968, 0.002833643, -0.4748934, 1, 0, 0, 1, 1,
-2.296896, -0.7491274, -1.5824, 0, 0, 0, 1, 1,
-2.279035, 0.3949345, -1.132285, 0, 0, 0, 1, 1,
-2.219882, 0.03782408, -1.700665, 0, 0, 0, 1, 1,
-2.185587, 0.2995495, -1.234223, 0, 0, 0, 1, 1,
-2.116214, 0.2265555, -1.089686, 0, 0, 0, 1, 1,
-2.103028, 0.6673774, -1.251513, 0, 0, 0, 1, 1,
-2.083148, 0.5625858, -2.273491, 0, 0, 0, 1, 1,
-2.050615, -0.1560702, -1.695009, 1, 1, 1, 1, 1,
-1.991842, -0.4659448, -0.8646099, 1, 1, 1, 1, 1,
-1.955373, 0.527536, -0.8461018, 1, 1, 1, 1, 1,
-1.940872, 0.8018293, 0.4555738, 1, 1, 1, 1, 1,
-1.93924, -1.35371, -3.917331, 1, 1, 1, 1, 1,
-1.915532, 1.742339, -0.7270049, 1, 1, 1, 1, 1,
-1.888021, -0.8390172, -1.536363, 1, 1, 1, 1, 1,
-1.884889, 1.493019, -0.942259, 1, 1, 1, 1, 1,
-1.878581, 0.9812267, -0.8150573, 1, 1, 1, 1, 1,
-1.864107, 0.0760546, -0.7091692, 1, 1, 1, 1, 1,
-1.838878, 0.1391564, -0.8144763, 1, 1, 1, 1, 1,
-1.838117, 0.2888044, -0.4744512, 1, 1, 1, 1, 1,
-1.828948, 1.562844, -0.4184166, 1, 1, 1, 1, 1,
-1.812936, 0.4810111, -1.46986, 1, 1, 1, 1, 1,
-1.810265, 1.350701, 1.656823, 1, 1, 1, 1, 1,
-1.803287, 0.2483099, -2.999356, 0, 0, 1, 1, 1,
-1.797018, 0.02794878, -2.130748, 1, 0, 0, 1, 1,
-1.778402, 0.6789864, -0.4535969, 1, 0, 0, 1, 1,
-1.762597, 0.03276656, -2.014164, 1, 0, 0, 1, 1,
-1.752542, -1.69726, -2.991432, 1, 0, 0, 1, 1,
-1.735092, -0.09425031, -1.433644, 1, 0, 0, 1, 1,
-1.70954, 1.150239, -2.225172, 0, 0, 0, 1, 1,
-1.70492, 0.2599367, -2.872858, 0, 0, 0, 1, 1,
-1.696935, 0.1543512, -0.06543517, 0, 0, 0, 1, 1,
-1.690623, 1.887342, 0.1766345, 0, 0, 0, 1, 1,
-1.678623, -0.1553923, -2.725708, 0, 0, 0, 1, 1,
-1.66233, -0.8763888, -1.858023, 0, 0, 0, 1, 1,
-1.661543, -1.132949, -2.426668, 0, 0, 0, 1, 1,
-1.638706, 0.5441349, -2.980722, 1, 1, 1, 1, 1,
-1.637411, 0.4141319, -0.169482, 1, 1, 1, 1, 1,
-1.605523, 0.2842406, -0.8990713, 1, 1, 1, 1, 1,
-1.600866, -0.858219, -1.192518, 1, 1, 1, 1, 1,
-1.583049, -0.2706482, -1.497931, 1, 1, 1, 1, 1,
-1.575606, -1.570865, -1.821859, 1, 1, 1, 1, 1,
-1.575034, 0.09085229, -1.115585, 1, 1, 1, 1, 1,
-1.568728, -1.215435, -0.501619, 1, 1, 1, 1, 1,
-1.564609, -0.1897112, -1.541058, 1, 1, 1, 1, 1,
-1.550092, 0.7721353, 1.048682, 1, 1, 1, 1, 1,
-1.547859, 0.833292, -1.264397, 1, 1, 1, 1, 1,
-1.529341, -0.04801748, -0.005241294, 1, 1, 1, 1, 1,
-1.525178, 0.1251341, -0.5947419, 1, 1, 1, 1, 1,
-1.509791, -0.04278737, -2.545046, 1, 1, 1, 1, 1,
-1.499829, 0.4451886, -1.881462, 1, 1, 1, 1, 1,
-1.498728, 0.6490958, -1.837321, 0, 0, 1, 1, 1,
-1.485025, -0.1620988, -2.450669, 1, 0, 0, 1, 1,
-1.475686, -0.009449339, -1.28008, 1, 0, 0, 1, 1,
-1.466238, -1.378526, -3.611381, 1, 0, 0, 1, 1,
-1.463552, -0.7740946, -1.446658, 1, 0, 0, 1, 1,
-1.458802, 1.417266, -2.264303, 1, 0, 0, 1, 1,
-1.444204, 0.5009896, -0.982882, 0, 0, 0, 1, 1,
-1.441141, -0.06405487, -2.231593, 0, 0, 0, 1, 1,
-1.436349, -0.003706705, -3.223259, 0, 0, 0, 1, 1,
-1.430359, -0.8336837, -1.237056, 0, 0, 0, 1, 1,
-1.430057, 2.116426, -0.2401903, 0, 0, 0, 1, 1,
-1.419978, 0.9486535, -1.683297, 0, 0, 0, 1, 1,
-1.41987, -0.7889505, -2.08103, 0, 0, 0, 1, 1,
-1.41545, 0.7742043, -1.670661, 1, 1, 1, 1, 1,
-1.412421, -0.1091256, -0.7245022, 1, 1, 1, 1, 1,
-1.408694, -2.199765, -1.932338, 1, 1, 1, 1, 1,
-1.401603, -0.1263636, -1.752792, 1, 1, 1, 1, 1,
-1.399831, 0.07886752, -3.122593, 1, 1, 1, 1, 1,
-1.390502, 0.2866259, -2.657526, 1, 1, 1, 1, 1,
-1.37395, -1.199633, -3.083441, 1, 1, 1, 1, 1,
-1.369647, -0.5878175, -1.973911, 1, 1, 1, 1, 1,
-1.369591, -0.1778772, -2.403782, 1, 1, 1, 1, 1,
-1.367856, 1.180466, -0.5231959, 1, 1, 1, 1, 1,
-1.358022, 0.5240451, -1.647087, 1, 1, 1, 1, 1,
-1.357679, 0.05347728, -1.991206, 1, 1, 1, 1, 1,
-1.355727, 1.810468, -0.1394408, 1, 1, 1, 1, 1,
-1.343261, 0.1227326, -1.42959, 1, 1, 1, 1, 1,
-1.336619, -1.602412, -2.139287, 1, 1, 1, 1, 1,
-1.334277, -0.5473543, -0.7773545, 0, 0, 1, 1, 1,
-1.329358, -0.8206037, -1.999463, 1, 0, 0, 1, 1,
-1.328248, -0.06264261, -3.545457, 1, 0, 0, 1, 1,
-1.319345, 1.028637, -0.2888019, 1, 0, 0, 1, 1,
-1.310573, 1.315212, 0.2673161, 1, 0, 0, 1, 1,
-1.310224, 0.6398738, -1.324501, 1, 0, 0, 1, 1,
-1.309975, -1.131073, -1.538215, 0, 0, 0, 1, 1,
-1.290807, -0.5338062, -1.574448, 0, 0, 0, 1, 1,
-1.285974, -1.381409, -3.621217, 0, 0, 0, 1, 1,
-1.280187, -1.513711, -2.275736, 0, 0, 0, 1, 1,
-1.276813, -0.1525117, -1.108377, 0, 0, 0, 1, 1,
-1.276037, -0.04445842, 0.02407629, 0, 0, 0, 1, 1,
-1.270666, -0.2629032, -0.5482484, 0, 0, 0, 1, 1,
-1.262229, 1.555029, 0.9759457, 1, 1, 1, 1, 1,
-1.250616, -1.215806, -2.721165, 1, 1, 1, 1, 1,
-1.244176, 1.580781, -1.810128, 1, 1, 1, 1, 1,
-1.228767, 0.9964648, -1.648037, 1, 1, 1, 1, 1,
-1.228323, -0.1825548, -3.556488, 1, 1, 1, 1, 1,
-1.227235, 0.3246161, -2.860553, 1, 1, 1, 1, 1,
-1.212028, 0.7530589, -1.851182, 1, 1, 1, 1, 1,
-1.211923, 0.9553065, -1.785532, 1, 1, 1, 1, 1,
-1.20107, -0.8331823, -3.837041, 1, 1, 1, 1, 1,
-1.200281, -0.02851281, -1.943233, 1, 1, 1, 1, 1,
-1.198253, 0.848568, -2.917982, 1, 1, 1, 1, 1,
-1.17717, -1.164996, -4.477497, 1, 1, 1, 1, 1,
-1.174356, -0.7931164, -2.100703, 1, 1, 1, 1, 1,
-1.173169, -0.08241533, -0.9953592, 1, 1, 1, 1, 1,
-1.168739, -0.4923441, -3.266714, 1, 1, 1, 1, 1,
-1.167287, 0.9876648, -2.021816, 0, 0, 1, 1, 1,
-1.161647, 0.6835893, -0.6528114, 1, 0, 0, 1, 1,
-1.157518, -1.451981, -3.339143, 1, 0, 0, 1, 1,
-1.15214, 0.6326538, -2.157203, 1, 0, 0, 1, 1,
-1.148186, -1.473781, -1.12757, 1, 0, 0, 1, 1,
-1.14791, 1.029936, -1.047457, 1, 0, 0, 1, 1,
-1.146815, -1.12655, -3.544047, 0, 0, 0, 1, 1,
-1.14022, 0.2119647, 0.8684828, 0, 0, 0, 1, 1,
-1.117479, -0.7122072, -1.152302, 0, 0, 0, 1, 1,
-1.115643, 0.3599219, -1.100711, 0, 0, 0, 1, 1,
-1.10845, -0.2152605, -2.544149, 0, 0, 0, 1, 1,
-1.103896, -1.844586, -3.586733, 0, 0, 0, 1, 1,
-1.094239, -1.361944, -1.444163, 0, 0, 0, 1, 1,
-1.091176, -0.7567942, -3.213891, 1, 1, 1, 1, 1,
-1.0842, -0.9609464, -1.43459, 1, 1, 1, 1, 1,
-1.082832, -0.5703683, -3.528193, 1, 1, 1, 1, 1,
-1.07784, 0.02358696, -1.684546, 1, 1, 1, 1, 1,
-1.074764, 1.061215, -0.09557986, 1, 1, 1, 1, 1,
-1.072131, -0.8774006, -1.523489, 1, 1, 1, 1, 1,
-1.069919, -1.943939, -5.572831, 1, 1, 1, 1, 1,
-1.06693, 1.042332, -0.9773197, 1, 1, 1, 1, 1,
-1.064142, -1.173935, -3.553084, 1, 1, 1, 1, 1,
-1.062114, -1.091265, -1.731703, 1, 1, 1, 1, 1,
-1.055777, 0.3055566, -0.2850569, 1, 1, 1, 1, 1,
-1.053117, 0.4418668, -1.238486, 1, 1, 1, 1, 1,
-1.051075, 0.2679304, -0.6165588, 1, 1, 1, 1, 1,
-1.049756, -1.414243, -2.790367, 1, 1, 1, 1, 1,
-1.044382, 0.627649, -0.04308591, 1, 1, 1, 1, 1,
-1.041864, -2.454541, -0.9652456, 0, 0, 1, 1, 1,
-1.040854, -0.9863688, -1.182969, 1, 0, 0, 1, 1,
-1.038867, -0.1287715, -1.311911, 1, 0, 0, 1, 1,
-1.035242, -0.04336887, -2.068378, 1, 0, 0, 1, 1,
-1.034932, -1.643439, -3.677873, 1, 0, 0, 1, 1,
-1.033123, -1.36878, -3.508401, 1, 0, 0, 1, 1,
-1.029088, 0.7529393, 0.8103948, 0, 0, 0, 1, 1,
-1.02798, -0.9441577, -3.527499, 0, 0, 0, 1, 1,
-1.027479, 1.58372, -0.900699, 0, 0, 0, 1, 1,
-1.027103, -0.1356401, -1.729475, 0, 0, 0, 1, 1,
-1.027045, 1.445552, -1.615349, 0, 0, 0, 1, 1,
-1.022392, -1.12459, -1.774228, 0, 0, 0, 1, 1,
-1.021092, -2.270036, -2.88335, 0, 0, 0, 1, 1,
-1.011001, 1.167695, -1.523387, 1, 1, 1, 1, 1,
-0.9950786, 0.6449465, -0.1150956, 1, 1, 1, 1, 1,
-0.9919074, -0.5909645, -1.556632, 1, 1, 1, 1, 1,
-0.9910376, 0.3823943, -0.7797119, 1, 1, 1, 1, 1,
-0.9854546, -1.597129, -2.459601, 1, 1, 1, 1, 1,
-0.9841502, -1.243031, -3.657868, 1, 1, 1, 1, 1,
-0.9831557, -1.368257, -4.735195, 1, 1, 1, 1, 1,
-0.9814904, 1.392702, -1.847661, 1, 1, 1, 1, 1,
-0.9730802, 0.6320177, -0.7465528, 1, 1, 1, 1, 1,
-0.9714696, -1.88075, -2.866238, 1, 1, 1, 1, 1,
-0.9711679, -2.164627, -3.262986, 1, 1, 1, 1, 1,
-0.9707276, -1.781489, -2.178438, 1, 1, 1, 1, 1,
-0.9511068, -0.2071406, -1.75072, 1, 1, 1, 1, 1,
-0.9504998, 0.6727819, -0.3551491, 1, 1, 1, 1, 1,
-0.9493815, 1.130161, -1.177822, 1, 1, 1, 1, 1,
-0.9475468, 0.3422274, -0.6118933, 0, 0, 1, 1, 1,
-0.9433878, -1.366408, -1.656153, 1, 0, 0, 1, 1,
-0.9426399, 0.1810677, -2.09176, 1, 0, 0, 1, 1,
-0.9366494, -0.2068216, -0.7320731, 1, 0, 0, 1, 1,
-0.9353984, -0.5900673, -1.058663, 1, 0, 0, 1, 1,
-0.9348466, 0.1676663, -0.4192888, 1, 0, 0, 1, 1,
-0.9239324, -0.481534, -2.013002, 0, 0, 0, 1, 1,
-0.9226, 0.01112214, -0.6908274, 0, 0, 0, 1, 1,
-0.9194779, -0.9234087, -2.413651, 0, 0, 0, 1, 1,
-0.9173353, -0.4150279, -2.347347, 0, 0, 0, 1, 1,
-0.9098385, -0.2372373, -0.3099391, 0, 0, 0, 1, 1,
-0.9065811, -0.4916535, -1.044684, 0, 0, 0, 1, 1,
-0.9065043, -1.369154, -2.58562, 0, 0, 0, 1, 1,
-0.9016865, 0.5459099, -1.310069, 1, 1, 1, 1, 1,
-0.8979074, -0.481091, -3.161252, 1, 1, 1, 1, 1,
-0.8934372, 0.2932192, -0.979235, 1, 1, 1, 1, 1,
-0.8930354, 0.005689911, -0.07079422, 1, 1, 1, 1, 1,
-0.8850724, -0.6982303, -0.6406854, 1, 1, 1, 1, 1,
-0.8798892, -0.3302816, -2.645016, 1, 1, 1, 1, 1,
-0.8762642, 1.853712, 0.004774814, 1, 1, 1, 1, 1,
-0.8710834, 1.079925, -1.463586, 1, 1, 1, 1, 1,
-0.8652682, -0.4948132, -1.190866, 1, 1, 1, 1, 1,
-0.8642944, 0.7018306, -0.6013308, 1, 1, 1, 1, 1,
-0.86408, 0.7609435, -2.436901, 1, 1, 1, 1, 1,
-0.8621746, -0.8730072, -2.974008, 1, 1, 1, 1, 1,
-0.8605304, 1.200999, -0.7449118, 1, 1, 1, 1, 1,
-0.8597526, 0.4037862, -2.763573, 1, 1, 1, 1, 1,
-0.8570553, -1.543071, -1.574039, 1, 1, 1, 1, 1,
-0.8538541, -0.1468448, -1.240732, 0, 0, 1, 1, 1,
-0.8537827, 1.302258, -0.1414503, 1, 0, 0, 1, 1,
-0.8503262, -1.033156, -1.990355, 1, 0, 0, 1, 1,
-0.8440054, -1.337443, -2.258303, 1, 0, 0, 1, 1,
-0.8417976, -0.1339599, -2.643242, 1, 0, 0, 1, 1,
-0.8407583, 0.5614015, -0.6940852, 1, 0, 0, 1, 1,
-0.8370849, 0.7365539, -0.6854658, 0, 0, 0, 1, 1,
-0.8252406, 0.6330394, -1.01952, 0, 0, 0, 1, 1,
-0.8249835, -1.894024, -1.3758, 0, 0, 0, 1, 1,
-0.81507, 0.4153613, -0.1834617, 0, 0, 0, 1, 1,
-0.8144116, 0.9575144, 0.1790271, 0, 0, 0, 1, 1,
-0.806126, -0.8224217, -2.749487, 0, 0, 0, 1, 1,
-0.7931221, 0.1290921, -1.146694, 0, 0, 0, 1, 1,
-0.7930582, -1.099206, -2.8522, 1, 1, 1, 1, 1,
-0.7859533, 0.01320386, -3.250883, 1, 1, 1, 1, 1,
-0.784394, 1.245795, 0.9621477, 1, 1, 1, 1, 1,
-0.7808895, -0.2655753, -3.350224, 1, 1, 1, 1, 1,
-0.7692875, 0.5821824, -2.625256, 1, 1, 1, 1, 1,
-0.7658503, 0.1509828, -1.432676, 1, 1, 1, 1, 1,
-0.7604488, -1.470477, -1.807565, 1, 1, 1, 1, 1,
-0.7583187, 0.1143549, -0.7693477, 1, 1, 1, 1, 1,
-0.7484922, 0.373588, 0.9275892, 1, 1, 1, 1, 1,
-0.7459102, 2.609498, 0.9685636, 1, 1, 1, 1, 1,
-0.7436085, 1.574867, 0.7315452, 1, 1, 1, 1, 1,
-0.7393071, -1.444584, -2.729047, 1, 1, 1, 1, 1,
-0.7350278, 2.446861, -0.9233679, 1, 1, 1, 1, 1,
-0.7344068, 0.2514871, -0.289743, 1, 1, 1, 1, 1,
-0.7328044, -0.3440875, -2.530897, 1, 1, 1, 1, 1,
-0.7326272, 0.294272, -1.724775, 0, 0, 1, 1, 1,
-0.7295692, 0.2961889, 1.112524, 1, 0, 0, 1, 1,
-0.7274995, 0.7397119, -1.576738, 1, 0, 0, 1, 1,
-0.7197011, 0.3210535, -0.8642417, 1, 0, 0, 1, 1,
-0.7196105, 0.08503427, -0.6719272, 1, 0, 0, 1, 1,
-0.7159006, 0.7988189, -1.178144, 1, 0, 0, 1, 1,
-0.7063705, 0.7830123, -0.4569618, 0, 0, 0, 1, 1,
-0.7037795, -0.9762566, -1.983817, 0, 0, 0, 1, 1,
-0.7007586, 0.5863031, -1.180755, 0, 0, 0, 1, 1,
-0.6986294, 0.9019843, 0.6827883, 0, 0, 0, 1, 1,
-0.6942051, 1.09067, -1.955655, 0, 0, 0, 1, 1,
-0.6932406, -1.050378, -1.723684, 0, 0, 0, 1, 1,
-0.6852884, -1.810004, -3.081742, 0, 0, 0, 1, 1,
-0.6816052, 0.7746493, 0.8227932, 1, 1, 1, 1, 1,
-0.6661332, -0.7590966, -1.127936, 1, 1, 1, 1, 1,
-0.6618438, -0.3508399, -2.155344, 1, 1, 1, 1, 1,
-0.6604347, 0.8645778, -1.18953, 1, 1, 1, 1, 1,
-0.659379, -1.73405, -2.469055, 1, 1, 1, 1, 1,
-0.6577268, 1.134381, 1.140827, 1, 1, 1, 1, 1,
-0.6533642, 0.5562603, -0.316585, 1, 1, 1, 1, 1,
-0.6509759, 0.4176992, -1.77397, 1, 1, 1, 1, 1,
-0.6479383, -0.9040283, -3.940888, 1, 1, 1, 1, 1,
-0.64685, -0.8121381, -1.839617, 1, 1, 1, 1, 1,
-0.6465067, 1.453647, -0.3417202, 1, 1, 1, 1, 1,
-0.6463879, 0.477784, -0.6483123, 1, 1, 1, 1, 1,
-0.6462286, 0.1373775, -1.667715, 1, 1, 1, 1, 1,
-0.6462148, -0.1202987, -2.188885, 1, 1, 1, 1, 1,
-0.6461619, 0.5534528, -1.557618, 1, 1, 1, 1, 1,
-0.644038, -1.207997, -2.315514, 0, 0, 1, 1, 1,
-0.6418152, 1.46679, -0.8921687, 1, 0, 0, 1, 1,
-0.6408147, -0.2382186, -2.230004, 1, 0, 0, 1, 1,
-0.6407353, 0.09686901, -2.386934, 1, 0, 0, 1, 1,
-0.6379138, 0.7328264, -0.8140754, 1, 0, 0, 1, 1,
-0.6268209, -0.1735789, -0.0682489, 1, 0, 0, 1, 1,
-0.626202, 0.9398349, -0.7075631, 0, 0, 0, 1, 1,
-0.6257964, -0.09296989, 0.8465357, 0, 0, 0, 1, 1,
-0.6251467, -0.3604382, -1.35854, 0, 0, 0, 1, 1,
-0.6201791, 0.9827407, -1.053803, 0, 0, 0, 1, 1,
-0.618727, -1.625672, -3.291795, 0, 0, 0, 1, 1,
-0.6116561, 0.4531493, -0.6027657, 0, 0, 0, 1, 1,
-0.6082578, 1.592116, -1.845328, 0, 0, 0, 1, 1,
-0.6078212, 1.211419, -1.463959, 1, 1, 1, 1, 1,
-0.6040452, -0.09447291, -2.737208, 1, 1, 1, 1, 1,
-0.6009779, 1.82003, 0.06027954, 1, 1, 1, 1, 1,
-0.5970255, -0.7433754, -2.643538, 1, 1, 1, 1, 1,
-0.5926597, 0.3872944, -1.446158, 1, 1, 1, 1, 1,
-0.5905854, -0.1241708, -2.781679, 1, 1, 1, 1, 1,
-0.5879412, 1.133652, -1.614581, 1, 1, 1, 1, 1,
-0.5841565, 0.4882776, -2.114481, 1, 1, 1, 1, 1,
-0.5836402, -0.731873, -0.9645703, 1, 1, 1, 1, 1,
-0.5834644, -0.357167, -1.017825, 1, 1, 1, 1, 1,
-0.5809088, -0.8392895, -3.305424, 1, 1, 1, 1, 1,
-0.5775394, 0.9001579, 0.02252079, 1, 1, 1, 1, 1,
-0.577413, 1.937958, 0.2975471, 1, 1, 1, 1, 1,
-0.5754979, -0.8630593, -2.0498, 1, 1, 1, 1, 1,
-0.5744766, -0.07275979, -0.4086311, 1, 1, 1, 1, 1,
-0.5729144, 0.7853161, 0.3614022, 0, 0, 1, 1, 1,
-0.5642006, 1.230471, -0.4160641, 1, 0, 0, 1, 1,
-0.5521199, -0.1741214, -2.093669, 1, 0, 0, 1, 1,
-0.5511606, 0.09405607, -3.779743, 1, 0, 0, 1, 1,
-0.5504011, -0.1040158, -2.09504, 1, 0, 0, 1, 1,
-0.5488392, -1.659108, -1.932385, 1, 0, 0, 1, 1,
-0.5484934, -0.5336764, -3.885609, 0, 0, 0, 1, 1,
-0.5457086, -1.326952, -2.055228, 0, 0, 0, 1, 1,
-0.5453439, -1.796648, -2.156939, 0, 0, 0, 1, 1,
-0.5436279, 2.83294, -1.422829, 0, 0, 0, 1, 1,
-0.5431275, 2.13992, -0.8297342, 0, 0, 0, 1, 1,
-0.5430123, 0.8672946, -0.9406043, 0, 0, 0, 1, 1,
-0.5406557, -0.1909417, -1.543741, 0, 0, 0, 1, 1,
-0.5361287, 0.7968673, -0.9388638, 1, 1, 1, 1, 1,
-0.5347639, -1.094193, -2.269979, 1, 1, 1, 1, 1,
-0.5321504, -0.5037866, -2.666838, 1, 1, 1, 1, 1,
-0.531994, 0.6890029, -1.159014, 1, 1, 1, 1, 1,
-0.5301104, 0.8523703, 0.1002895, 1, 1, 1, 1, 1,
-0.5283253, 1.409628, -1.21258, 1, 1, 1, 1, 1,
-0.5258493, 1.874135, 0.2993451, 1, 1, 1, 1, 1,
-0.5227647, -1.569059, -4.3716, 1, 1, 1, 1, 1,
-0.519528, 0.4469303, -1.138447, 1, 1, 1, 1, 1,
-0.5175205, 1.606759, 0.1163027, 1, 1, 1, 1, 1,
-0.5152778, 1.997388, 0.5384219, 1, 1, 1, 1, 1,
-0.5144506, -0.009579456, -0.3141771, 1, 1, 1, 1, 1,
-0.514254, -0.9003031, -1.163517, 1, 1, 1, 1, 1,
-0.513737, -1.526053, -2.074504, 1, 1, 1, 1, 1,
-0.511413, 0.5164084, -0.3690256, 1, 1, 1, 1, 1,
-0.5096832, 0.354759, -2.357865, 0, 0, 1, 1, 1,
-0.5045652, 0.135059, -1.639109, 1, 0, 0, 1, 1,
-0.5018253, 0.1900982, -2.22771, 1, 0, 0, 1, 1,
-0.501032, -1.33195, -2.434482, 1, 0, 0, 1, 1,
-0.5003635, 1.083179, 0.3116897, 1, 0, 0, 1, 1,
-0.498783, -1.399545, -3.848897, 1, 0, 0, 1, 1,
-0.4983331, 0.5013919, -2.2663, 0, 0, 0, 1, 1,
-0.4974143, 0.7427759, -1.575652, 0, 0, 0, 1, 1,
-0.4961585, -0.1682492, -2.922673, 0, 0, 0, 1, 1,
-0.4959084, -0.3431349, -1.368011, 0, 0, 0, 1, 1,
-0.4905077, 0.4547797, -1.32949, 0, 0, 0, 1, 1,
-0.4892072, -0.3398295, -1.396662, 0, 0, 0, 1, 1,
-0.4859, -0.5667552, -2.529457, 0, 0, 0, 1, 1,
-0.48496, 0.3101076, -2.399151, 1, 1, 1, 1, 1,
-0.4817311, 1.582983, 0.09415081, 1, 1, 1, 1, 1,
-0.4799801, 1.19336, -0.3766287, 1, 1, 1, 1, 1,
-0.4795349, -2.116038, -1.576151, 1, 1, 1, 1, 1,
-0.4766639, -1.471892, -2.866453, 1, 1, 1, 1, 1,
-0.4719887, 1.868887, 0.9504293, 1, 1, 1, 1, 1,
-0.4671912, -0.06004981, -2.035063, 1, 1, 1, 1, 1,
-0.4662726, 0.2084966, -1.261188, 1, 1, 1, 1, 1,
-0.4661308, 0.2476695, 0.01450352, 1, 1, 1, 1, 1,
-0.4628229, 1.157106, -1.221477, 1, 1, 1, 1, 1,
-0.4617987, 1.516214, -1.003543, 1, 1, 1, 1, 1,
-0.4480841, -0.1263681, -1.13723, 1, 1, 1, 1, 1,
-0.4472825, -1.07479, -1.187351, 1, 1, 1, 1, 1,
-0.4462218, 0.6438317, -0.5007762, 1, 1, 1, 1, 1,
-0.443912, -0.2524406, -3.240531, 1, 1, 1, 1, 1,
-0.4385475, -1.605664, -3.26877, 0, 0, 1, 1, 1,
-0.4382466, -1.081595, -2.749287, 1, 0, 0, 1, 1,
-0.4320852, 1.060149, -1.200146, 1, 0, 0, 1, 1,
-0.431467, -1.746033, -2.383751, 1, 0, 0, 1, 1,
-0.4311949, 0.3687149, -0.9447581, 1, 0, 0, 1, 1,
-0.4232131, -0.3988861, -2.032987, 1, 0, 0, 1, 1,
-0.4211968, 0.6085102, -0.6999906, 0, 0, 0, 1, 1,
-0.4193079, 0.6524594, 1.991388, 0, 0, 0, 1, 1,
-0.4118538, 0.3845042, -1.889326, 0, 0, 0, 1, 1,
-0.4065918, -1.700176, -4.122779, 0, 0, 0, 1, 1,
-0.4063525, -0.9079804, -3.053618, 0, 0, 0, 1, 1,
-0.4048317, -0.3956662, -3.871397, 0, 0, 0, 1, 1,
-0.4013739, 0.3748084, -1.327324, 0, 0, 0, 1, 1,
-0.4003959, -2.186625, -4.675977, 1, 1, 1, 1, 1,
-0.3976644, -1.41225, -3.225169, 1, 1, 1, 1, 1,
-0.3964239, -0.7997941, -2.488636, 1, 1, 1, 1, 1,
-0.3846582, -0.4633532, -4.276875, 1, 1, 1, 1, 1,
-0.3812138, 0.1936175, -2.100921, 1, 1, 1, 1, 1,
-0.3791088, -0.9811724, -0.935366, 1, 1, 1, 1, 1,
-0.3739023, 0.9235379, -1.332938, 1, 1, 1, 1, 1,
-0.3711415, 0.06632847, -2.866498, 1, 1, 1, 1, 1,
-0.3701855, 0.4315092, 0.3695656, 1, 1, 1, 1, 1,
-0.3696534, 0.8739569, 0.07208911, 1, 1, 1, 1, 1,
-0.3651961, 0.5363324, -0.3127405, 1, 1, 1, 1, 1,
-0.3633529, -0.1557631, -1.453918, 1, 1, 1, 1, 1,
-0.3588772, 0.1824266, -1.14881, 1, 1, 1, 1, 1,
-0.3545992, -1.214807, -3.192225, 1, 1, 1, 1, 1,
-0.3526793, -0.2752622, -3.897075, 1, 1, 1, 1, 1,
-0.3524515, 0.4260928, 0.3987896, 0, 0, 1, 1, 1,
-0.351474, -0.02445944, -2.183512, 1, 0, 0, 1, 1,
-0.3504126, -0.8767676, -2.721523, 1, 0, 0, 1, 1,
-0.3437786, 1.057391, -0.9032542, 1, 0, 0, 1, 1,
-0.3430885, 0.8551893, 0.9744566, 1, 0, 0, 1, 1,
-0.3421619, -1.500314, -2.333568, 1, 0, 0, 1, 1,
-0.3402152, -0.5579086, -2.187654, 0, 0, 0, 1, 1,
-0.3398126, -0.7595867, -2.733205, 0, 0, 0, 1, 1,
-0.3348672, 0.5628015, -0.7218996, 0, 0, 0, 1, 1,
-0.3305453, -0.6425033, -4.293868, 0, 0, 0, 1, 1,
-0.3286743, -0.1793585, -3.515878, 0, 0, 0, 1, 1,
-0.3286726, 0.7298695, -1.131607, 0, 0, 0, 1, 1,
-0.3276405, 0.1564278, -1.621747, 0, 0, 0, 1, 1,
-0.3207471, -0.893138, -4.52098, 1, 1, 1, 1, 1,
-0.3204808, 0.7241086, -0.5063447, 1, 1, 1, 1, 1,
-0.319925, -0.5283483, -2.712512, 1, 1, 1, 1, 1,
-0.3196559, -0.7830608, -2.397758, 1, 1, 1, 1, 1,
-0.3108897, 1.054912, 0.1640033, 1, 1, 1, 1, 1,
-0.3092803, -0.3898224, -2.625125, 1, 1, 1, 1, 1,
-0.308363, -0.9793609, -1.698692, 1, 1, 1, 1, 1,
-0.3077505, -2.08962, -3.627927, 1, 1, 1, 1, 1,
-0.3028076, -1.287006, -3.617029, 1, 1, 1, 1, 1,
-0.3026321, 0.3535442, -1.069482, 1, 1, 1, 1, 1,
-0.3021013, -0.4234717, -3.867045, 1, 1, 1, 1, 1,
-0.3017319, 0.8069797, -0.597077, 1, 1, 1, 1, 1,
-0.2998191, 0.5306826, -1.059902, 1, 1, 1, 1, 1,
-0.2991292, 0.1659002, -0.0282097, 1, 1, 1, 1, 1,
-0.2927488, -0.7736644, -1.827412, 1, 1, 1, 1, 1,
-0.2903117, -0.6728265, -2.650738, 0, 0, 1, 1, 1,
-0.2823241, 0.42371, -0.4547067, 1, 0, 0, 1, 1,
-0.2808297, 3.078317, -1.03663, 1, 0, 0, 1, 1,
-0.2750051, -1.622869, -0.7388098, 1, 0, 0, 1, 1,
-0.2747821, 0.6242508, -1.032134, 1, 0, 0, 1, 1,
-0.2742908, 0.8800368, 0.3180877, 1, 0, 0, 1, 1,
-0.2736755, -0.4932769, -1.74377, 0, 0, 0, 1, 1,
-0.2720822, -0.4403717, -1.737587, 0, 0, 0, 1, 1,
-0.2697657, 1.01687, -0.5532387, 0, 0, 0, 1, 1,
-0.2673799, -1.22209, -2.291948, 0, 0, 0, 1, 1,
-0.2654192, 0.2999603, 0.4568674, 0, 0, 0, 1, 1,
-0.2653562, 0.3649844, 0.3817127, 0, 0, 0, 1, 1,
-0.2644762, 0.2890104, 0.08514688, 0, 0, 0, 1, 1,
-0.2608668, -0.2645349, -3.529845, 1, 1, 1, 1, 1,
-0.2550267, -0.07150289, -1.468455, 1, 1, 1, 1, 1,
-0.2549625, 0.5303369, -1.824329, 1, 1, 1, 1, 1,
-0.2501838, 0.3937118, -1.872955, 1, 1, 1, 1, 1,
-0.2500092, 2.001348, -0.7637731, 1, 1, 1, 1, 1,
-0.249233, 1.571621, 0.4080039, 1, 1, 1, 1, 1,
-0.2448035, 0.7803445, 0.2141389, 1, 1, 1, 1, 1,
-0.2443011, 0.8943405, -1.920694, 1, 1, 1, 1, 1,
-0.239213, 0.03225443, -0.7893901, 1, 1, 1, 1, 1,
-0.2352977, -2.784837, -4.387794, 1, 1, 1, 1, 1,
-0.2330705, 0.1448146, 0.6820427, 1, 1, 1, 1, 1,
-0.2328208, -0.7727944, -1.830384, 1, 1, 1, 1, 1,
-0.2306895, -0.7027197, -3.179602, 1, 1, 1, 1, 1,
-0.2299803, 0.1627534, -0.8865728, 1, 1, 1, 1, 1,
-0.2243237, 0.1315246, -2.951616, 1, 1, 1, 1, 1,
-0.2242811, -0.02394225, -0.7469841, 0, 0, 1, 1, 1,
-0.2213638, -1.451371, -4.876688, 1, 0, 0, 1, 1,
-0.219562, 0.6638992, 0.3975373, 1, 0, 0, 1, 1,
-0.2126126, -0.1821971, -2.381302, 1, 0, 0, 1, 1,
-0.2109038, -0.4163595, -2.144854, 1, 0, 0, 1, 1,
-0.2108931, 0.09780399, 1.259586, 1, 0, 0, 1, 1,
-0.2101881, -0.1413951, -3.397269, 0, 0, 0, 1, 1,
-0.2070136, -1.693916, -3.948984, 0, 0, 0, 1, 1,
-0.2060323, 0.3521016, 0.02103329, 0, 0, 0, 1, 1,
-0.2053294, 0.1100543, -0.8357477, 0, 0, 0, 1, 1,
-0.2042406, -0.07268979, -2.798394, 0, 0, 0, 1, 1,
-0.1997411, 0.24692, -0.7578909, 0, 0, 0, 1, 1,
-0.1994384, -0.06632813, -3.242659, 0, 0, 0, 1, 1,
-0.1929247, 0.5470316, 0.1241266, 1, 1, 1, 1, 1,
-0.1922222, -2.616936, -0.7215015, 1, 1, 1, 1, 1,
-0.1921976, 0.9269685, 0.09984193, 1, 1, 1, 1, 1,
-0.1916095, -0.7590222, -3.76988, 1, 1, 1, 1, 1,
-0.19115, 0.6992881, -1.7038, 1, 1, 1, 1, 1,
-0.1880144, -1.342658, -3.180565, 1, 1, 1, 1, 1,
-0.1847772, -0.08195656, -1.620428, 1, 1, 1, 1, 1,
-0.1827505, -1.456856, -3.93681, 1, 1, 1, 1, 1,
-0.1782848, -1.128796, -1.311221, 1, 1, 1, 1, 1,
-0.1748222, -1.38536, -4.786907, 1, 1, 1, 1, 1,
-0.1735698, -0.08735404, -1.533104, 1, 1, 1, 1, 1,
-0.1701546, 0.2880488, -1.265188, 1, 1, 1, 1, 1,
-0.1681981, -0.3911305, -4.08234, 1, 1, 1, 1, 1,
-0.1657262, 0.484119, 1.58214, 1, 1, 1, 1, 1,
-0.1607463, 1.532349, -0.2479747, 1, 1, 1, 1, 1,
-0.160293, -1.088443, -3.40817, 0, 0, 1, 1, 1,
-0.1527227, -0.4777477, -3.146558, 1, 0, 0, 1, 1,
-0.1525306, 0.9514425, 1.089085, 1, 0, 0, 1, 1,
-0.150048, 1.42962, -0.6714418, 1, 0, 0, 1, 1,
-0.1470842, 2.188594, 1.591583, 1, 0, 0, 1, 1,
-0.1442357, -0.4223185, -2.757636, 1, 0, 0, 1, 1,
-0.1435705, 1.156436, -0.0746348, 0, 0, 0, 1, 1,
-0.1422194, -0.7146451, -3.133544, 0, 0, 0, 1, 1,
-0.1402556, 2.003715, 1.789359, 0, 0, 0, 1, 1,
-0.1388606, 1.300426, -0.9244282, 0, 0, 0, 1, 1,
-0.1367767, 1.161697, 0.732487, 0, 0, 0, 1, 1,
-0.136095, 0.8858253, -1.7761, 0, 0, 0, 1, 1,
-0.1348557, 1.25135, 0.02741151, 0, 0, 0, 1, 1,
-0.1313311, 0.8336619, 1.746575, 1, 1, 1, 1, 1,
-0.130538, -0.6583721, -3.08738, 1, 1, 1, 1, 1,
-0.1298465, 0.2080421, 1.390877, 1, 1, 1, 1, 1,
-0.1264795, 0.1344012, -1.074896, 1, 1, 1, 1, 1,
-0.1262248, 2.475853, -2.152436, 1, 1, 1, 1, 1,
-0.1259671, 1.2446, -1.553419, 1, 1, 1, 1, 1,
-0.1236492, -1.205237, -1.798955, 1, 1, 1, 1, 1,
-0.1209358, 1.229644, -0.4343257, 1, 1, 1, 1, 1,
-0.1160153, -1.105854, -2.471346, 1, 1, 1, 1, 1,
-0.1143231, -1.991373, -3.157648, 1, 1, 1, 1, 1,
-0.1137257, -1.80754, -3.156815, 1, 1, 1, 1, 1,
-0.1127038, 0.2214778, 0.8420156, 1, 1, 1, 1, 1,
-0.1044288, -0.807384, -3.712825, 1, 1, 1, 1, 1,
-0.09885942, -0.09027018, -2.911383, 1, 1, 1, 1, 1,
-0.09390707, -0.9383861, -3.016077, 1, 1, 1, 1, 1,
-0.09301735, -0.9593015, -2.151413, 0, 0, 1, 1, 1,
-0.08809485, -2.11165, -2.127751, 1, 0, 0, 1, 1,
-0.08691948, 0.1977631, 1.761382, 1, 0, 0, 1, 1,
-0.08049503, -1.262904, -2.240938, 1, 0, 0, 1, 1,
-0.08018355, 0.6886843, -0.6382129, 1, 0, 0, 1, 1,
-0.07100199, -0.8539699, -4.268968, 1, 0, 0, 1, 1,
-0.07080738, 0.3365355, 0.7731262, 0, 0, 0, 1, 1,
-0.0657598, -1.587227, -2.578974, 0, 0, 0, 1, 1,
-0.06175471, -0.308435, -4.117504, 0, 0, 0, 1, 1,
-0.06046708, 0.3664546, 1.565889, 0, 0, 0, 1, 1,
-0.05911477, 0.8478617, 1.325179, 0, 0, 0, 1, 1,
-0.0583612, -0.1033453, -1.685159, 0, 0, 0, 1, 1,
-0.05600212, -0.8120233, -2.512387, 0, 0, 0, 1, 1,
-0.05210279, -2.133849, -1.718187, 1, 1, 1, 1, 1,
-0.05180398, -2.085107, -2.877801, 1, 1, 1, 1, 1,
-0.05092513, -0.9796277, -3.620659, 1, 1, 1, 1, 1,
-0.04938608, -0.2302293, -1.34521, 1, 1, 1, 1, 1,
-0.04510267, 0.1758243, 1.085167, 1, 1, 1, 1, 1,
-0.04034922, 0.393693, 0.6196038, 1, 1, 1, 1, 1,
-0.04014009, -1.595659, -4.173302, 1, 1, 1, 1, 1,
-0.03804763, 0.02274897, -1.752387, 1, 1, 1, 1, 1,
-0.03712426, -0.1348973, -2.426878, 1, 1, 1, 1, 1,
-0.03171425, 0.3771549, -0.02230915, 1, 1, 1, 1, 1,
-0.02590066, 0.3284804, -0.7259266, 1, 1, 1, 1, 1,
-0.02588383, -0.6175591, -3.979855, 1, 1, 1, 1, 1,
-0.02480818, 0.9341829, -0.364223, 1, 1, 1, 1, 1,
-0.02396171, 0.3149561, -0.6142274, 1, 1, 1, 1, 1,
-0.009452553, 0.7054595, -0.7930624, 1, 1, 1, 1, 1,
-0.008115124, 0.3564627, 0.3435797, 0, 0, 1, 1, 1,
-0.006983703, -1.334008, -2.750965, 1, 0, 0, 1, 1,
-0.006619722, -0.3997747, -2.702125, 1, 0, 0, 1, 1,
0.001589395, 0.01298768, -0.9240461, 1, 0, 0, 1, 1,
0.005409006, 0.09885957, 1.041661, 1, 0, 0, 1, 1,
0.005518673, -2.119529, 5.201978, 1, 0, 0, 1, 1,
0.007301099, -0.06970035, 4.237386, 0, 0, 0, 1, 1,
0.00741825, 1.777637, 0.5012503, 0, 0, 0, 1, 1,
0.008097326, 1.048788, -1.279173, 0, 0, 0, 1, 1,
0.01162042, -0.2038739, 3.713976, 0, 0, 0, 1, 1,
0.01438773, 0.4818899, 0.004399728, 0, 0, 0, 1, 1,
0.01709455, -2.000711, 4.33631, 0, 0, 0, 1, 1,
0.02202199, -0.9104389, 4.219022, 0, 0, 0, 1, 1,
0.02481761, 0.4984582, 0.3315625, 1, 1, 1, 1, 1,
0.02634142, -1.234907, 1.87026, 1, 1, 1, 1, 1,
0.02911163, 0.5679469, -1.902608, 1, 1, 1, 1, 1,
0.03207455, -2.122427, 3.25868, 1, 1, 1, 1, 1,
0.03581556, -0.2183665, 2.428621, 1, 1, 1, 1, 1,
0.03865286, -1.711231, 4.761502, 1, 1, 1, 1, 1,
0.03910116, 1.045543, -0.2256951, 1, 1, 1, 1, 1,
0.04204245, 1.51989, 0.9607969, 1, 1, 1, 1, 1,
0.04616215, -0.3090423, 2.784722, 1, 1, 1, 1, 1,
0.04882203, 0.6737231, 0.6093332, 1, 1, 1, 1, 1,
0.05145171, 0.3267508, 1.031265, 1, 1, 1, 1, 1,
0.0557307, -0.8176491, 3.697566, 1, 1, 1, 1, 1,
0.05732273, 2.237684, -1.023126, 1, 1, 1, 1, 1,
0.05904933, -0.2861965, 2.026305, 1, 1, 1, 1, 1,
0.06170208, 0.258464, 0.07079723, 1, 1, 1, 1, 1,
0.06379768, 0.3382569, 1.893003, 0, 0, 1, 1, 1,
0.06427603, 0.3478431, 1.065712, 1, 0, 0, 1, 1,
0.07131465, 0.7574781, -1.878335, 1, 0, 0, 1, 1,
0.07785439, 0.2969136, 1.973541, 1, 0, 0, 1, 1,
0.08435486, 1.45789, 2.274458, 1, 0, 0, 1, 1,
0.08756354, -1.163078, 3.950484, 1, 0, 0, 1, 1,
0.09473578, 0.18861, -0.1594761, 0, 0, 0, 1, 1,
0.09556903, -1.203536, 2.128081, 0, 0, 0, 1, 1,
0.0956629, 2.15194, 0.6173016, 0, 0, 0, 1, 1,
0.09928811, 0.5593193, -1.715122, 0, 0, 0, 1, 1,
0.1014063, -1.881088, 2.252707, 0, 0, 0, 1, 1,
0.1015197, 0.2012889, 1.787287, 0, 0, 0, 1, 1,
0.1057819, 0.6683493, -0.9068347, 0, 0, 0, 1, 1,
0.110558, -1.192906, 4.625652, 1, 1, 1, 1, 1,
0.1121252, -0.155394, 2.168756, 1, 1, 1, 1, 1,
0.114607, -1.016878, 1.607831, 1, 1, 1, 1, 1,
0.1155894, 1.335915, 0.1746706, 1, 1, 1, 1, 1,
0.1242592, 1.742919, 0.1540228, 1, 1, 1, 1, 1,
0.1242997, -0.5164667, 3.446704, 1, 1, 1, 1, 1,
0.1257129, -2.407146, 1.539801, 1, 1, 1, 1, 1,
0.1266292, 0.9995355, 0.7784296, 1, 1, 1, 1, 1,
0.1287019, 0.5000163, 0.4534975, 1, 1, 1, 1, 1,
0.1312571, -0.6889901, 2.52458, 1, 1, 1, 1, 1,
0.1323671, -0.3824858, 5.230575, 1, 1, 1, 1, 1,
0.1331925, 0.6422372, -0.2372168, 1, 1, 1, 1, 1,
0.1388285, -0.2314041, 1.619606, 1, 1, 1, 1, 1,
0.1401302, -0.4849858, 2.93185, 1, 1, 1, 1, 1,
0.1407539, 0.7439522, 0.6852077, 1, 1, 1, 1, 1,
0.1426479, 0.1657454, 0.4003305, 0, 0, 1, 1, 1,
0.1431918, 1.456378, -2.023584, 1, 0, 0, 1, 1,
0.1436897, -0.7200004, 2.53573, 1, 0, 0, 1, 1,
0.1444293, 0.2812037, 0.2679158, 1, 0, 0, 1, 1,
0.144724, 0.1371422, -0.2459444, 1, 0, 0, 1, 1,
0.1449732, 0.8843165, -0.1556342, 1, 0, 0, 1, 1,
0.1517558, -0.9641326, 2.139174, 0, 0, 0, 1, 1,
0.1541053, 1.115416, 1.06506, 0, 0, 0, 1, 1,
0.158034, -0.2857909, 1.722562, 0, 0, 0, 1, 1,
0.1663764, -0.6344188, 2.980805, 0, 0, 0, 1, 1,
0.1680049, 0.8557609, 0.04262352, 0, 0, 0, 1, 1,
0.1686949, -0.6690331, 3.561451, 0, 0, 0, 1, 1,
0.1687368, -1.496358, 2.284216, 0, 0, 0, 1, 1,
0.1766299, -1.357919, 3.268998, 1, 1, 1, 1, 1,
0.1827097, -0.8072677, 4.218811, 1, 1, 1, 1, 1,
0.1896928, 0.7356453, 1.043369, 1, 1, 1, 1, 1,
0.1909264, 0.772512, -0.8618666, 1, 1, 1, 1, 1,
0.1913606, -1.050149, 2.318438, 1, 1, 1, 1, 1,
0.1921697, -0.1244045, 2.478641, 1, 1, 1, 1, 1,
0.1950996, -0.8764308, 2.307243, 1, 1, 1, 1, 1,
0.2014337, 0.4194197, -0.4687084, 1, 1, 1, 1, 1,
0.2026665, 0.5918521, 0.3831627, 1, 1, 1, 1, 1,
0.2079979, 0.1816009, 1.56909, 1, 1, 1, 1, 1,
0.2090172, 0.482674, 0.5139315, 1, 1, 1, 1, 1,
0.2157943, -1.078004, 4.448085, 1, 1, 1, 1, 1,
0.220812, -0.6761917, 3.760494, 1, 1, 1, 1, 1,
0.2213804, 0.4583787, 1.297191, 1, 1, 1, 1, 1,
0.221522, 0.7045323, 1.048657, 1, 1, 1, 1, 1,
0.222283, 0.05623486, 1.185661, 0, 0, 1, 1, 1,
0.2305132, -0.5461416, 4.513368, 1, 0, 0, 1, 1,
0.2327392, -0.5540655, 3.563663, 1, 0, 0, 1, 1,
0.2340727, 0.150257, 0.931575, 1, 0, 0, 1, 1,
0.2442324, 1.141664, -1.841106, 1, 0, 0, 1, 1,
0.2445456, 0.1474411, -0.6106517, 1, 0, 0, 1, 1,
0.2446179, 0.3599793, -0.05068315, 0, 0, 0, 1, 1,
0.2497122, -0.1308667, 1.838403, 0, 0, 0, 1, 1,
0.2501213, 1.254182, -0.5095924, 0, 0, 0, 1, 1,
0.2507029, -1.867536, 3.866715, 0, 0, 0, 1, 1,
0.2508222, 0.4846137, 2.026417, 0, 0, 0, 1, 1,
0.2511184, -0.7783806, 3.115204, 0, 0, 0, 1, 1,
0.2528876, 0.9756504, 1.810813, 0, 0, 0, 1, 1,
0.2532901, 1.625054, -1.20023, 1, 1, 1, 1, 1,
0.256772, 0.6116807, -0.4187901, 1, 1, 1, 1, 1,
0.2586751, 0.001411454, 2.434345, 1, 1, 1, 1, 1,
0.270992, -1.250263, 1.095759, 1, 1, 1, 1, 1,
0.2785502, -1.351013, 2.964865, 1, 1, 1, 1, 1,
0.282386, -0.8890345, 1.603363, 1, 1, 1, 1, 1,
0.2854035, -1.21187, 1.391127, 1, 1, 1, 1, 1,
0.2877131, -0.9537953, 1.386038, 1, 1, 1, 1, 1,
0.2898833, 0.9129316, -0.08817293, 1, 1, 1, 1, 1,
0.2968394, -1.479597, 4.115989, 1, 1, 1, 1, 1,
0.3064854, -0.8491647, 1.906411, 1, 1, 1, 1, 1,
0.3077689, 0.4927044, 0.7356732, 1, 1, 1, 1, 1,
0.3175777, -1.750159, 4.803256, 1, 1, 1, 1, 1,
0.3228346, -1.271005, 2.115624, 1, 1, 1, 1, 1,
0.3236658, 0.6139733, 0.5825224, 1, 1, 1, 1, 1,
0.3268324, -0.166342, 2.780336, 0, 0, 1, 1, 1,
0.3299402, 0.5430702, -0.08273931, 1, 0, 0, 1, 1,
0.3325299, 0.7463033, 1.009469, 1, 0, 0, 1, 1,
0.3353915, 0.005516225, 2.8305, 1, 0, 0, 1, 1,
0.3367812, -0.9031042, 2.988629, 1, 0, 0, 1, 1,
0.3446607, -0.3104293, 1.685906, 1, 0, 0, 1, 1,
0.3471672, 0.1943071, 1.902808, 0, 0, 0, 1, 1,
0.3496056, -0.743618, 2.540603, 0, 0, 0, 1, 1,
0.3562908, -0.6024647, 3.414639, 0, 0, 0, 1, 1,
0.356575, -0.521794, 2.236297, 0, 0, 0, 1, 1,
0.358258, -2.212831, 2.568619, 0, 0, 0, 1, 1,
0.3587223, -0.5099117, 2.057828, 0, 0, 0, 1, 1,
0.3603425, 0.4581174, 0.7499648, 0, 0, 0, 1, 1,
0.3605077, 0.07532105, 2.06044, 1, 1, 1, 1, 1,
0.3611941, -0.4471801, 2.746255, 1, 1, 1, 1, 1,
0.3655512, -0.5828967, 2.71289, 1, 1, 1, 1, 1,
0.3747495, -0.09776165, 0.04217887, 1, 1, 1, 1, 1,
0.3775906, 0.1494184, -0.9839761, 1, 1, 1, 1, 1,
0.3815584, -0.7509103, 3.038938, 1, 1, 1, 1, 1,
0.3817705, 1.215468, 0.7725447, 1, 1, 1, 1, 1,
0.3891574, 0.4147779, -0.2123973, 1, 1, 1, 1, 1,
0.3910539, 1.468587, 0.7417251, 1, 1, 1, 1, 1,
0.3942083, 0.5153906, 0.5740978, 1, 1, 1, 1, 1,
0.3953954, -0.825527, 3.128853, 1, 1, 1, 1, 1,
0.3970763, -0.8494692, 1.967465, 1, 1, 1, 1, 1,
0.4013548, 0.3885548, 1.352776, 1, 1, 1, 1, 1,
0.4056304, -0.666886, 2.699967, 1, 1, 1, 1, 1,
0.407003, 0.5903371, -0.6035867, 1, 1, 1, 1, 1,
0.4071448, -1.62905, 1.941676, 0, 0, 1, 1, 1,
0.4088563, -1.936407, 3.265707, 1, 0, 0, 1, 1,
0.409571, -1.167089, 2.885939, 1, 0, 0, 1, 1,
0.4103262, 0.1778001, 0.4765071, 1, 0, 0, 1, 1,
0.4107232, 0.8393715, 0.4663763, 1, 0, 0, 1, 1,
0.4113092, 0.3734616, 0.2026252, 1, 0, 0, 1, 1,
0.4116282, 0.8450672, -0.09457147, 0, 0, 0, 1, 1,
0.4136291, 0.4150825, -1.021352, 0, 0, 0, 1, 1,
0.413848, -0.2395485, 3.062787, 0, 0, 0, 1, 1,
0.4141031, -0.9775874, 3.213735, 0, 0, 0, 1, 1,
0.4212296, -0.6942661, 2.356448, 0, 0, 0, 1, 1,
0.4263405, 1.404783, 1.450342, 0, 0, 0, 1, 1,
0.4311126, -0.7681648, 3.733383, 0, 0, 0, 1, 1,
0.438781, 0.07138254, 1.083358, 1, 1, 1, 1, 1,
0.4391774, -0.02134261, 1.552804, 1, 1, 1, 1, 1,
0.4424866, -0.5494205, 1.647884, 1, 1, 1, 1, 1,
0.4440795, 2.104156, 1.588187, 1, 1, 1, 1, 1,
0.4506707, 0.1621419, -0.1223852, 1, 1, 1, 1, 1,
0.4557743, -0.8736479, 2.370487, 1, 1, 1, 1, 1,
0.4584162, 1.664668, 1.364108, 1, 1, 1, 1, 1,
0.4592948, -2.287644, 2.961202, 1, 1, 1, 1, 1,
0.4607265, -0.7348363, 3.47839, 1, 1, 1, 1, 1,
0.4631604, -0.930409, 0.8303381, 1, 1, 1, 1, 1,
0.4636674, -1.341618, 2.802887, 1, 1, 1, 1, 1,
0.4655371, 0.5968124, 0.8745107, 1, 1, 1, 1, 1,
0.4742724, -1.015064, 1.446933, 1, 1, 1, 1, 1,
0.480398, 0.3207726, 1.640698, 1, 1, 1, 1, 1,
0.4829163, -0.04149313, 0.7199677, 1, 1, 1, 1, 1,
0.4872896, 1.440871, 2.284975, 0, 0, 1, 1, 1,
0.4874765, 0.9568712, 1.779228, 1, 0, 0, 1, 1,
0.4885538, -1.461955, 1.916398, 1, 0, 0, 1, 1,
0.490578, 0.8121529, 1.388651, 1, 0, 0, 1, 1,
0.4931794, 0.1876885, 1.367213, 1, 0, 0, 1, 1,
0.4981614, 1.618094, 0.5900584, 1, 0, 0, 1, 1,
0.505522, -0.210305, 0.02088205, 0, 0, 0, 1, 1,
0.5115843, -2.055188, 3.085663, 0, 0, 0, 1, 1,
0.5128669, -0.9171224, 1.613532, 0, 0, 0, 1, 1,
0.5148406, -2.179441, 2.431834, 0, 0, 0, 1, 1,
0.5150982, 0.2974144, 3.342528, 0, 0, 0, 1, 1,
0.5172528, 0.07696133, 1.338145, 0, 0, 0, 1, 1,
0.5184039, -0.4707284, 4.431872, 0, 0, 0, 1, 1,
0.5193869, -1.053192, 3.435225, 1, 1, 1, 1, 1,
0.5219454, -0.4073227, 1.875448, 1, 1, 1, 1, 1,
0.5279691, 0.03519849, 1.208816, 1, 1, 1, 1, 1,
0.529045, -1.526516, 1.602927, 1, 1, 1, 1, 1,
0.5295404, -0.1639223, 1.352393, 1, 1, 1, 1, 1,
0.5318785, -0.8698765, 2.766276, 1, 1, 1, 1, 1,
0.5340468, -1.490621, 3.066131, 1, 1, 1, 1, 1,
0.5417804, -1.076009, 3.528291, 1, 1, 1, 1, 1,
0.5438001, 0.300459, -0.3199174, 1, 1, 1, 1, 1,
0.546519, -0.2594123, 2.024518, 1, 1, 1, 1, 1,
0.546846, 1.07031, 2.165925, 1, 1, 1, 1, 1,
0.547166, 0.3948058, 0.7929937, 1, 1, 1, 1, 1,
0.5477681, -1.248147, 3.212764, 1, 1, 1, 1, 1,
0.5528996, 1.940326, -0.3099258, 1, 1, 1, 1, 1,
0.5596524, -0.3372564, 1.973729, 1, 1, 1, 1, 1,
0.5597091, -1.372301, 2.890955, 0, 0, 1, 1, 1,
0.5625874, -0.8590762, 3.98741, 1, 0, 0, 1, 1,
0.5657441, 0.8297281, 0.3845865, 1, 0, 0, 1, 1,
0.5661799, 0.603787, 0.5564746, 1, 0, 0, 1, 1,
0.567369, 2.176405, -0.8380221, 1, 0, 0, 1, 1,
0.5677435, 1.796361, 0.03375984, 1, 0, 0, 1, 1,
0.570042, -0.1972423, 0.5323571, 0, 0, 0, 1, 1,
0.5701751, -0.5154166, 3.142332, 0, 0, 0, 1, 1,
0.5708066, -0.09502262, -0.4924624, 0, 0, 0, 1, 1,
0.5731705, -0.5638646, 2.621653, 0, 0, 0, 1, 1,
0.5734613, -1.930795, 4.379831, 0, 0, 0, 1, 1,
0.5743337, -0.6967701, 2.455601, 0, 0, 0, 1, 1,
0.5760106, 1.204902, 0.1805981, 0, 0, 0, 1, 1,
0.5762361, -0.2292267, 3.589096, 1, 1, 1, 1, 1,
0.5764167, 0.4862639, 0.4156875, 1, 1, 1, 1, 1,
0.5857322, 0.5290645, 0.7005387, 1, 1, 1, 1, 1,
0.5868706, 0.1504095, 4.653095, 1, 1, 1, 1, 1,
0.5884415, 0.2233873, 2.870872, 1, 1, 1, 1, 1,
0.5889301, 0.5736365, 0.6842204, 1, 1, 1, 1, 1,
0.5926771, 0.2944414, 0.972989, 1, 1, 1, 1, 1,
0.5952959, -0.3682898, 2.956304, 1, 1, 1, 1, 1,
0.6005386, 0.8694415, 0.7868312, 1, 1, 1, 1, 1,
0.6007572, 0.4539608, 1.29326, 1, 1, 1, 1, 1,
0.6017817, 0.8497622, -0.0937245, 1, 1, 1, 1, 1,
0.6025403, -0.1010589, 1.381432, 1, 1, 1, 1, 1,
0.6028295, 0.2339581, 0.8936827, 1, 1, 1, 1, 1,
0.603228, 0.07209036, 1.594205, 1, 1, 1, 1, 1,
0.606614, 0.05873764, 2.069007, 1, 1, 1, 1, 1,
0.610677, 0.1527714, 2.305321, 0, 0, 1, 1, 1,
0.6135697, 1.265536, 0.439001, 1, 0, 0, 1, 1,
0.6168535, 1.118632, -0.8964282, 1, 0, 0, 1, 1,
0.6171211, 0.1576616, 1.864771, 1, 0, 0, 1, 1,
0.6243131, 0.9284267, 1.376053, 1, 0, 0, 1, 1,
0.6251408, 1.073761, -0.3867854, 1, 0, 0, 1, 1,
0.6251452, -2.236978, 2.435696, 0, 0, 0, 1, 1,
0.6269328, -1.281846, 4.011347, 0, 0, 0, 1, 1,
0.6275747, -1.322311, 2.79907, 0, 0, 0, 1, 1,
0.6349756, -0.2401437, 2.160372, 0, 0, 0, 1, 1,
0.6386297, -0.389109, 2.186533, 0, 0, 0, 1, 1,
0.6451988, -1.703792, 0.806328, 0, 0, 0, 1, 1,
0.6490124, -1.441137, 2.648498, 0, 0, 0, 1, 1,
0.655359, -1.247082, 2.792983, 1, 1, 1, 1, 1,
0.6566457, -1.076319, 3.326892, 1, 1, 1, 1, 1,
0.657975, 2.26028, 1.159358, 1, 1, 1, 1, 1,
0.6603051, 0.8539996, 2.096561, 1, 1, 1, 1, 1,
0.6704114, -0.3057398, 1.387751, 1, 1, 1, 1, 1,
0.6816759, 0.9021785, 0.4421327, 1, 1, 1, 1, 1,
0.6870361, -0.0558934, 2.581954, 1, 1, 1, 1, 1,
0.6943797, -0.04025177, 2.936521, 1, 1, 1, 1, 1,
0.6950763, -0.5068182, 1.393046, 1, 1, 1, 1, 1,
0.7001832, -0.6639241, 4.275315, 1, 1, 1, 1, 1,
0.7038099, -2.502792, 2.765738, 1, 1, 1, 1, 1,
0.7051788, -0.1162925, 1.670495, 1, 1, 1, 1, 1,
0.7098237, -0.1293661, 2.853066, 1, 1, 1, 1, 1,
0.7117684, -1.032602, 2.410404, 1, 1, 1, 1, 1,
0.71206, 1.004247, -1.015232, 1, 1, 1, 1, 1,
0.7136738, -1.60497, 2.621221, 0, 0, 1, 1, 1,
0.7146145, -1.345537, 2.28844, 1, 0, 0, 1, 1,
0.7225856, 0.8373369, -0.7316425, 1, 0, 0, 1, 1,
0.7462969, 1.631491, 0.3906535, 1, 0, 0, 1, 1,
0.7464293, 0.4983608, 1.899359, 1, 0, 0, 1, 1,
0.7475601, -1.362047, 3.14556, 1, 0, 0, 1, 1,
0.7480059, -2.084254, 2.683964, 0, 0, 0, 1, 1,
0.7497247, -0.4501192, 2.436337, 0, 0, 0, 1, 1,
0.7536643, 0.3942146, 0.6646969, 0, 0, 0, 1, 1,
0.7573174, -0.5061918, 1.682315, 0, 0, 0, 1, 1,
0.758509, -0.1823079, -0.176738, 0, 0, 0, 1, 1,
0.7647133, -0.1664288, 0.7928364, 0, 0, 0, 1, 1,
0.7865991, -0.6256481, 3.812665, 0, 0, 0, 1, 1,
0.7869742, -0.05682091, 4.756976, 1, 1, 1, 1, 1,
0.7890738, -1.564738, 0.1867529, 1, 1, 1, 1, 1,
0.8028536, -1.794606, 1.182096, 1, 1, 1, 1, 1,
0.809329, 0.2572768, 1.383384, 1, 1, 1, 1, 1,
0.8121635, 1.155863, 1.470774, 1, 1, 1, 1, 1,
0.8151353, 0.515828, 1.200424, 1, 1, 1, 1, 1,
0.8167669, 1.608604, 2.037597, 1, 1, 1, 1, 1,
0.8187566, 0.06147772, 1.933132, 1, 1, 1, 1, 1,
0.8198676, 0.1623136, 1.291925, 1, 1, 1, 1, 1,
0.8203538, 1.437469, 2.112138, 1, 1, 1, 1, 1,
0.8207403, -1.850156, 3.389524, 1, 1, 1, 1, 1,
0.8237354, 1.824925, 0.8746929, 1, 1, 1, 1, 1,
0.8249953, 0.4381955, 1.19116, 1, 1, 1, 1, 1,
0.8259318, 0.6760493, -0.9879181, 1, 1, 1, 1, 1,
0.8284869, 0.2368071, 0.1402861, 1, 1, 1, 1, 1,
0.8372231, -0.6321455, 1.640414, 0, 0, 1, 1, 1,
0.8384766, 0.1109251, 3.235133, 1, 0, 0, 1, 1,
0.8385256, 1.048643, 1.835626, 1, 0, 0, 1, 1,
0.8396617, -0.904754, 2.941882, 1, 0, 0, 1, 1,
0.8531339, -0.09558693, 3.260261, 1, 0, 0, 1, 1,
0.8598768, 0.3263588, 0.8531461, 1, 0, 0, 1, 1,
0.8632915, -0.0002202429, 1.057503, 0, 0, 0, 1, 1,
0.8683285, -0.288334, 2.760419, 0, 0, 0, 1, 1,
0.871094, 1.815557, 1.139462, 0, 0, 0, 1, 1,
0.8735862, 0.160657, -0.1294964, 0, 0, 0, 1, 1,
0.8750767, 1.073204, 0.8048306, 0, 0, 0, 1, 1,
0.875258, -1.08467, 2.912046, 0, 0, 0, 1, 1,
0.8756446, -0.0226367, 2.789709, 0, 0, 0, 1, 1,
0.8764793, -0.04000754, 1.814312, 1, 1, 1, 1, 1,
0.8826876, 0.9486319, 1.289323, 1, 1, 1, 1, 1,
0.8878536, 0.3907477, 1.626614, 1, 1, 1, 1, 1,
0.8912887, 0.3897444, 3.098749, 1, 1, 1, 1, 1,
0.9009941, 0.3798783, 0.9096187, 1, 1, 1, 1, 1,
0.9023259, -0.7767431, 1.869148, 1, 1, 1, 1, 1,
0.9093841, -0.1304954, 1.552111, 1, 1, 1, 1, 1,
0.9147034, 0.7958439, 1.607187, 1, 1, 1, 1, 1,
0.9177631, 1.684587, -0.6312901, 1, 1, 1, 1, 1,
0.9223568, 1.061016, -0.08235274, 1, 1, 1, 1, 1,
0.9246826, 0.01402553, 2.52444, 1, 1, 1, 1, 1,
0.9262673, 1.345218, -0.1533568, 1, 1, 1, 1, 1,
0.9288437, 0.5108265, 0.2413947, 1, 1, 1, 1, 1,
0.9294705, 0.9993582, 0.7918904, 1, 1, 1, 1, 1,
0.9305698, 0.6145869, -1.329681, 1, 1, 1, 1, 1,
0.9329017, 0.4905633, 1.018224, 0, 0, 1, 1, 1,
0.9359927, -1.315268, 3.041443, 1, 0, 0, 1, 1,
0.9409027, -1.194489, 1.845382, 1, 0, 0, 1, 1,
0.9453494, 0.002689182, 2.218825, 1, 0, 0, 1, 1,
0.9460528, -0.8654276, 2.571015, 1, 0, 0, 1, 1,
0.9484395, -0.02729595, 0.172383, 1, 0, 0, 1, 1,
0.9496396, -0.8516881, 2.072674, 0, 0, 0, 1, 1,
0.9505578, -0.6439973, 3.633839, 0, 0, 0, 1, 1,
0.9584974, 0.2097011, 1.703429, 0, 0, 0, 1, 1,
0.9590042, -0.1041033, 1.465164, 0, 0, 0, 1, 1,
0.9630064, -0.4609979, 1.395335, 0, 0, 0, 1, 1,
0.9642637, -1.166478, 3.528056, 0, 0, 0, 1, 1,
0.9666663, 0.164441, 3.039291, 0, 0, 0, 1, 1,
0.9723584, 0.7331126, 2.036507, 1, 1, 1, 1, 1,
0.9792589, 0.8540942, 0.0867993, 1, 1, 1, 1, 1,
0.9889255, 0.4911146, 0.1197964, 1, 1, 1, 1, 1,
0.9910513, 1.302705, 0.5187998, 1, 1, 1, 1, 1,
0.992995, 0.9598343, 0.9888306, 1, 1, 1, 1, 1,
0.9936808, -0.8533345, 1.343033, 1, 1, 1, 1, 1,
0.9991999, 0.9955693, -0.9348041, 1, 1, 1, 1, 1,
1.001758, 0.222589, 1.392306, 1, 1, 1, 1, 1,
1.007405, -0.5293795, 2.353927, 1, 1, 1, 1, 1,
1.017398, -0.1989791, 2.093305, 1, 1, 1, 1, 1,
1.023926, 0.9022107, 0.9089518, 1, 1, 1, 1, 1,
1.038474, -0.5616434, 2.446561, 1, 1, 1, 1, 1,
1.044726, -1.048553, 3.735071, 1, 1, 1, 1, 1,
1.04916, -0.9245182, 1.183412, 1, 1, 1, 1, 1,
1.055012, -1.880329, 2.627112, 1, 1, 1, 1, 1,
1.058418, -1.874896, 1.292755, 0, 0, 1, 1, 1,
1.062438, -1.767153, 1.115888, 1, 0, 0, 1, 1,
1.063923, -0.552597, 3.255051, 1, 0, 0, 1, 1,
1.064179, 0.9920939, 1.259941, 1, 0, 0, 1, 1,
1.066381, 1.677769, 0.7323414, 1, 0, 0, 1, 1,
1.071153, 2.360509, 1.194264, 1, 0, 0, 1, 1,
1.086966, 2.321276, -0.8461236, 0, 0, 0, 1, 1,
1.087947, -0.6056348, 1.50412, 0, 0, 0, 1, 1,
1.089893, -0.8878243, 3.38474, 0, 0, 0, 1, 1,
1.09015, 1.220991, 1.113832, 0, 0, 0, 1, 1,
1.090858, -0.2223031, 2.501392, 0, 0, 0, 1, 1,
1.096259, 1.32464, 0.8364015, 0, 0, 0, 1, 1,
1.096299, -0.2573951, 2.960727, 0, 0, 0, 1, 1,
1.101909, 0.2228035, 2.968352, 1, 1, 1, 1, 1,
1.10974, -1.154323, 2.850225, 1, 1, 1, 1, 1,
1.111677, 0.7321023, 1.396927, 1, 1, 1, 1, 1,
1.112192, 1.510231, 0.7511865, 1, 1, 1, 1, 1,
1.113774, -0.998026, 3.547091, 1, 1, 1, 1, 1,
1.114378, -0.05710044, 1.782824, 1, 1, 1, 1, 1,
1.114604, 1.138478, 1.394484, 1, 1, 1, 1, 1,
1.119172, 0.1836809, 2.019783, 1, 1, 1, 1, 1,
1.122083, 0.2078044, 1.704979, 1, 1, 1, 1, 1,
1.13, 0.7358928, -0.5818099, 1, 1, 1, 1, 1,
1.136668, 0.2055, -1.104848, 1, 1, 1, 1, 1,
1.156375, 0.2771529, 1.587486, 1, 1, 1, 1, 1,
1.15742, 1.142935, 0.2059, 1, 1, 1, 1, 1,
1.157648, 1.451935, -1.484606, 1, 1, 1, 1, 1,
1.159155, 1.909626, -0.8446631, 1, 1, 1, 1, 1,
1.1697, 0.09890123, 2.742182, 0, 0, 1, 1, 1,
1.175688, 0.4749573, -0.2721255, 1, 0, 0, 1, 1,
1.178775, -0.2564121, 3.157028, 1, 0, 0, 1, 1,
1.179142, -0.02532967, 1.185255, 1, 0, 0, 1, 1,
1.180576, -0.05664843, 1.683968, 1, 0, 0, 1, 1,
1.181342, 0.2608209, 1.078846, 1, 0, 0, 1, 1,
1.182839, 0.3654986, 1.274733, 0, 0, 0, 1, 1,
1.183053, -0.5775866, 2.891012, 0, 0, 0, 1, 1,
1.187043, -1.841268, 2.13303, 0, 0, 0, 1, 1,
1.197797, 0.8478824, 1.400203, 0, 0, 0, 1, 1,
1.198046, 0.9919316, -0.04458434, 0, 0, 0, 1, 1,
1.200562, 1.248804, 1.308049, 0, 0, 0, 1, 1,
1.214673, 0.315559, 1.500443, 0, 0, 0, 1, 1,
1.21587, -0.9875351, 1.812008, 1, 1, 1, 1, 1,
1.215959, 0.6377971, 2.261816, 1, 1, 1, 1, 1,
1.218185, 0.3479077, 0.9246011, 1, 1, 1, 1, 1,
1.229873, -0.5843294, 3.208374, 1, 1, 1, 1, 1,
1.235538, 0.5493455, -0.6923319, 1, 1, 1, 1, 1,
1.243733, 0.3062104, 1.521894, 1, 1, 1, 1, 1,
1.247177, -1.037089, 3.964617, 1, 1, 1, 1, 1,
1.253343, -1.020105, 1.897399, 1, 1, 1, 1, 1,
1.297571, -2.223046, 2.390399, 1, 1, 1, 1, 1,
1.300646, 0.4905191, 1.69029, 1, 1, 1, 1, 1,
1.308908, -0.8268279, 2.123249, 1, 1, 1, 1, 1,
1.330326, -0.06329881, 2.665167, 1, 1, 1, 1, 1,
1.335855, -0.3808533, 2.314085, 1, 1, 1, 1, 1,
1.340391, 0.2311879, -0.3581509, 1, 1, 1, 1, 1,
1.340714, -1.081866, 2.703479, 1, 1, 1, 1, 1,
1.343881, -1.471679, 2.227072, 0, 0, 1, 1, 1,
1.353016, 0.3414524, 1.579448, 1, 0, 0, 1, 1,
1.355131, 0.1590578, 1.942738, 1, 0, 0, 1, 1,
1.357916, -2.518137, 1.430815, 1, 0, 0, 1, 1,
1.359465, 0.5009209, -0.3967611, 1, 0, 0, 1, 1,
1.361722, 1.134043, 1.183266, 1, 0, 0, 1, 1,
1.368611, 0.6032865, -0.2543387, 0, 0, 0, 1, 1,
1.398097, 0.02141642, 2.529437, 0, 0, 0, 1, 1,
1.400583, 0.3615273, 1.360381, 0, 0, 0, 1, 1,
1.401044, -0.8777962, 1.901208, 0, 0, 0, 1, 1,
1.402534, 0.5598175, 2.048553, 0, 0, 0, 1, 1,
1.406846, 0.3033334, 0.7639294, 0, 0, 0, 1, 1,
1.408007, -0.8095316, 1.731689, 0, 0, 0, 1, 1,
1.410973, 0.4953266, 1.2972, 1, 1, 1, 1, 1,
1.421961, 0.03785522, 2.399282, 1, 1, 1, 1, 1,
1.43032, -0.04166139, 3.876926, 1, 1, 1, 1, 1,
1.438743, -0.3636852, 1.540433, 1, 1, 1, 1, 1,
1.456785, -0.1454476, 1.261728, 1, 1, 1, 1, 1,
1.457903, 0.2268273, 2.072551, 1, 1, 1, 1, 1,
1.469135, 1.182203, 0.4192167, 1, 1, 1, 1, 1,
1.475593, -1.718051, 2.978193, 1, 1, 1, 1, 1,
1.480352, 0.2682618, 3.102321, 1, 1, 1, 1, 1,
1.482374, 0.7795324, 2.110009, 1, 1, 1, 1, 1,
1.483454, 1.87227, -1.442577, 1, 1, 1, 1, 1,
1.486076, -0.2088195, 0.5929788, 1, 1, 1, 1, 1,
1.491165, 0.8486978, 1.206602, 1, 1, 1, 1, 1,
1.506377, 1.456494, 0.1249236, 1, 1, 1, 1, 1,
1.507967, -0.1612545, 2.529349, 1, 1, 1, 1, 1,
1.513311, -0.2801542, 2.252941, 0, 0, 1, 1, 1,
1.517026, -1.085703, 4.131446, 1, 0, 0, 1, 1,
1.519152, 0.01043919, 1.988684, 1, 0, 0, 1, 1,
1.523415, 1.095621, 1.310159, 1, 0, 0, 1, 1,
1.527492, 0.7107307, -0.9139408, 1, 0, 0, 1, 1,
1.532499, 0.1589951, 1.851801, 1, 0, 0, 1, 1,
1.53758, 0.5399188, 2.430112, 0, 0, 0, 1, 1,
1.546959, 2.129906, -1.570919, 0, 0, 0, 1, 1,
1.549461, -0.6425952, 2.749779, 0, 0, 0, 1, 1,
1.551606, 1.620772, 1.150767, 0, 0, 0, 1, 1,
1.585898, -1.209851, 3.772919, 0, 0, 0, 1, 1,
1.586762, -0.4368369, 0.02934523, 0, 0, 0, 1, 1,
1.593543, 0.9003512, 1.69805, 0, 0, 0, 1, 1,
1.595591, -1.883228, 2.866708, 1, 1, 1, 1, 1,
1.613637, 1.322504, -0.9923383, 1, 1, 1, 1, 1,
1.619917, 0.3244797, 1.08586, 1, 1, 1, 1, 1,
1.626024, 0.1866727, 1.154338, 1, 1, 1, 1, 1,
1.632958, 0.310904, 1.386781, 1, 1, 1, 1, 1,
1.633494, 0.1966707, 3.096411, 1, 1, 1, 1, 1,
1.635061, 1.221068, 0.7807211, 1, 1, 1, 1, 1,
1.637449, 0.2187681, 0.2502436, 1, 1, 1, 1, 1,
1.639095, 0.8918072, 0.1761093, 1, 1, 1, 1, 1,
1.647823, -1.295453, 1.740111, 1, 1, 1, 1, 1,
1.654095, 0.2797853, 0.246221, 1, 1, 1, 1, 1,
1.654137, 0.7915598, 0.9200883, 1, 1, 1, 1, 1,
1.654217, -1.286135, 2.024868, 1, 1, 1, 1, 1,
1.659508, -0.32133, 1.295151, 1, 1, 1, 1, 1,
1.666167, 0.1633487, 0.8468084, 1, 1, 1, 1, 1,
1.676116, 0.365447, 2.051401, 0, 0, 1, 1, 1,
1.689304, -0.5481761, -0.3112949, 1, 0, 0, 1, 1,
1.722093, 0.3382044, 1.01846, 1, 0, 0, 1, 1,
1.727783, 0.4339589, 0.1510452, 1, 0, 0, 1, 1,
1.727813, -0.036236, 1.747038, 1, 0, 0, 1, 1,
1.742965, -0.157319, 2.304564, 1, 0, 0, 1, 1,
1.744888, -0.5345141, 2.841666, 0, 0, 0, 1, 1,
1.747294, 0.7859231, 1.995953, 0, 0, 0, 1, 1,
1.747695, 0.8385959, 1.339086, 0, 0, 0, 1, 1,
1.748669, -1.060746, 1.333828, 0, 0, 0, 1, 1,
1.749027, -0.1484678, 0.9012477, 0, 0, 0, 1, 1,
1.750849, 0.007372656, 1.507651, 0, 0, 0, 1, 1,
1.758132, -1.013019, 3.12872, 0, 0, 0, 1, 1,
1.766774, -1.732155, 1.785717, 1, 1, 1, 1, 1,
1.794524, 0.466977, 1.743609, 1, 1, 1, 1, 1,
1.796307, -0.5246248, 1.113123, 1, 1, 1, 1, 1,
1.861363, 0.362714, 1.404722, 1, 1, 1, 1, 1,
1.880211, 1.29798, 0.09608769, 1, 1, 1, 1, 1,
1.921838, -0.9705573, 1.452141, 1, 1, 1, 1, 1,
1.938933, -0.943718, 2.930791, 1, 1, 1, 1, 1,
1.947906, 0.7521803, 1.045483, 1, 1, 1, 1, 1,
1.955202, -2.642344, 0.4933841, 1, 1, 1, 1, 1,
2.005971, 0.9740058, 3.255607, 1, 1, 1, 1, 1,
2.010105, 1.415299, 2.013063, 1, 1, 1, 1, 1,
2.02821, 2.518291, 0.3273467, 1, 1, 1, 1, 1,
2.049446, 0.2787304, 2.927321, 1, 1, 1, 1, 1,
2.076328, 1.075895, 0.8887391, 1, 1, 1, 1, 1,
2.11715, 0.3627741, -0.2652135, 1, 1, 1, 1, 1,
2.117415, 1.806246, -2.283907, 0, 0, 1, 1, 1,
2.119633, 1.43776, 3.412193, 1, 0, 0, 1, 1,
2.13944, 0.1719188, 0.6283531, 1, 0, 0, 1, 1,
2.158794, 0.3837612, 0.761788, 1, 0, 0, 1, 1,
2.190386, 1.537811, 1.121195, 1, 0, 0, 1, 1,
2.230656, -0.1623968, 2.928041, 1, 0, 0, 1, 1,
2.243368, -1.779966, 2.200792, 0, 0, 0, 1, 1,
2.275861, 0.01132558, 0.2984234, 0, 0, 0, 1, 1,
2.276957, 0.2650038, 1.559035, 0, 0, 0, 1, 1,
2.278826, 0.4289892, 0.9593358, 0, 0, 0, 1, 1,
2.296128, -0.2009945, 1.829793, 0, 0, 0, 1, 1,
2.371616, 0.9346902, 1.798899, 0, 0, 0, 1, 1,
2.490747, -0.006739918, 0.820054, 0, 0, 0, 1, 1,
2.589256, -1.642271, 2.257966, 1, 1, 1, 1, 1,
2.598641, 0.07584072, 1.276379, 1, 1, 1, 1, 1,
2.620959, 0.330009, 1.568878, 1, 1, 1, 1, 1,
2.90634, 1.607414, 0.7266301, 1, 1, 1, 1, 1,
3.077441, 0.8059168, 0.7895117, 1, 1, 1, 1, 1,
3.117182, 0.1331307, 3.212536, 1, 1, 1, 1, 1,
3.70254, 0.9944021, 1.989947, 1, 1, 1, 1, 1
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
var radius = 9.647952;
var distance = 33.88802;
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
mvMatrix.translate( -0.176065, -0.1467402, 0.171128 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88802);
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
