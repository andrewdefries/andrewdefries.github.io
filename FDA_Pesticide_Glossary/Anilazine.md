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
-3.17677, -2.236794, -2.424325, 1, 0, 0, 1,
-2.543386, 0.2150104, -2.163512, 1, 0.007843138, 0, 1,
-2.405771, 1.749171, 1.499184, 1, 0.01176471, 0, 1,
-2.38827, -1.495181, -1.716643, 1, 0.01960784, 0, 1,
-2.340876, -0.1927005, -2.922627, 1, 0.02352941, 0, 1,
-2.298195, -1.763279, -3.256135, 1, 0.03137255, 0, 1,
-2.277485, 0.6561005, -0.1230994, 1, 0.03529412, 0, 1,
-2.24243, -1.105679, -2.616896, 1, 0.04313726, 0, 1,
-2.176255, -0.893645, -1.631497, 1, 0.04705882, 0, 1,
-2.174351, -0.8633339, -1.599331, 1, 0.05490196, 0, 1,
-2.150134, -0.2365469, -2.62015, 1, 0.05882353, 0, 1,
-2.133643, -0.734581, -2.456768, 1, 0.06666667, 0, 1,
-2.133557, -1.697931, -1.783018, 1, 0.07058824, 0, 1,
-2.129476, -0.5887062, 0.06122295, 1, 0.07843138, 0, 1,
-2.098238, 0.6850027, -2.961522, 1, 0.08235294, 0, 1,
-2.078207, -1.118286, -4.250911, 1, 0.09019608, 0, 1,
-2.071187, -0.5818344, -3.357669, 1, 0.09411765, 0, 1,
-2.058585, 1.998347, -2.027481, 1, 0.1019608, 0, 1,
-2.006963, -0.2628459, -3.406661, 1, 0.1098039, 0, 1,
-1.976882, 0.2048205, -1.313943, 1, 0.1137255, 0, 1,
-1.945589, 0.8531486, -0.05326419, 1, 0.1215686, 0, 1,
-1.911417, 0.7322139, -1.919662, 1, 0.1254902, 0, 1,
-1.829857, -1.083836, -1.644296, 1, 0.1333333, 0, 1,
-1.810842, 1.869464, -0.9422295, 1, 0.1372549, 0, 1,
-1.801231, 0.7677281, -1.025405, 1, 0.145098, 0, 1,
-1.79133, -0.0921462, -0.01792905, 1, 0.1490196, 0, 1,
-1.788823, -0.7043318, -1.284011, 1, 0.1568628, 0, 1,
-1.785602, 2.136613, 0.07507994, 1, 0.1607843, 0, 1,
-1.784482, 0.2405898, -2.301266, 1, 0.1686275, 0, 1,
-1.760005, -0.2316072, -2.439096, 1, 0.172549, 0, 1,
-1.756484, 0.7053849, -0.634178, 1, 0.1803922, 0, 1,
-1.751442, -0.792718, -0.621169, 1, 0.1843137, 0, 1,
-1.745432, 1.194581, -2.766674, 1, 0.1921569, 0, 1,
-1.744898, 0.8908823, -2.223399, 1, 0.1960784, 0, 1,
-1.743202, -0.5339542, -0.2470072, 1, 0.2039216, 0, 1,
-1.723289, -1.190483, -1.674394, 1, 0.2117647, 0, 1,
-1.722331, -1.288656, -2.256353, 1, 0.2156863, 0, 1,
-1.720973, 1.720443, -0.02659749, 1, 0.2235294, 0, 1,
-1.706678, -1.022988, -1.096367, 1, 0.227451, 0, 1,
-1.68586, -0.5664715, -0.6506878, 1, 0.2352941, 0, 1,
-1.683233, -0.8059526, -2.50129, 1, 0.2392157, 0, 1,
-1.670229, -2.192957, -3.134511, 1, 0.2470588, 0, 1,
-1.670062, -1.331642, -2.025328, 1, 0.2509804, 0, 1,
-1.668556, 0.3023841, -0.47494, 1, 0.2588235, 0, 1,
-1.661688, 0.16155, -2.375021, 1, 0.2627451, 0, 1,
-1.66096, -0.5982408, -0.5283933, 1, 0.2705882, 0, 1,
-1.660166, -0.2360622, -1.027385, 1, 0.2745098, 0, 1,
-1.650628, -0.8293496, -2.579751, 1, 0.282353, 0, 1,
-1.62617, -1.19012, -1.100355, 1, 0.2862745, 0, 1,
-1.6228, 1.9128, -0.5436225, 1, 0.2941177, 0, 1,
-1.614727, 0.5901967, 0.7062736, 1, 0.3019608, 0, 1,
-1.611107, -0.6542063, -2.528863, 1, 0.3058824, 0, 1,
-1.603634, 0.04731615, 0.04314663, 1, 0.3137255, 0, 1,
-1.603344, -1.647689, -2.345341, 1, 0.3176471, 0, 1,
-1.58649, -0.3700077, -2.500981, 1, 0.3254902, 0, 1,
-1.578617, -1.130861, -1.264267, 1, 0.3294118, 0, 1,
-1.574746, 0.5451732, -0.7210794, 1, 0.3372549, 0, 1,
-1.547284, -0.7642283, -0.1705525, 1, 0.3411765, 0, 1,
-1.537561, 0.9319959, -0.8511443, 1, 0.3490196, 0, 1,
-1.524194, 0.09056655, -1.977526, 1, 0.3529412, 0, 1,
-1.521606, -0.4001914, -2.971295, 1, 0.3607843, 0, 1,
-1.503785, 1.350545, -1.315437, 1, 0.3647059, 0, 1,
-1.491184, 2.25555, -1.62407, 1, 0.372549, 0, 1,
-1.488588, -1.14743, -2.221475, 1, 0.3764706, 0, 1,
-1.478805, -0.8118984, -2.871142, 1, 0.3843137, 0, 1,
-1.478434, -1.146438, -1.755385, 1, 0.3882353, 0, 1,
-1.476071, 0.5745, -0.7959279, 1, 0.3960784, 0, 1,
-1.474996, -0.4888795, -2.866649, 1, 0.4039216, 0, 1,
-1.469893, 0.929998, -1.515544, 1, 0.4078431, 0, 1,
-1.46265, 0.6158093, -1.109941, 1, 0.4156863, 0, 1,
-1.453328, -1.950928, -3.615093, 1, 0.4196078, 0, 1,
-1.428454, 0.3304136, -2.268465, 1, 0.427451, 0, 1,
-1.426929, -0.7102421, -4.181877, 1, 0.4313726, 0, 1,
-1.423925, -2.326999, -2.849519, 1, 0.4392157, 0, 1,
-1.419849, 0.3663505, -1.105709, 1, 0.4431373, 0, 1,
-1.415537, -0.862839, -1.226956, 1, 0.4509804, 0, 1,
-1.401877, -1.153815, -2.120713, 1, 0.454902, 0, 1,
-1.397522, 0.6703439, -0.8066289, 1, 0.4627451, 0, 1,
-1.390457, 1.365363, -1.233244, 1, 0.4666667, 0, 1,
-1.385805, -0.5586867, -3.173942, 1, 0.4745098, 0, 1,
-1.380584, 0.9828182, 0.03581695, 1, 0.4784314, 0, 1,
-1.376227, 1.290154, 0.6363012, 1, 0.4862745, 0, 1,
-1.372909, 1.264686, -0.9561648, 1, 0.4901961, 0, 1,
-1.371877, 1.143637, -1.705961, 1, 0.4980392, 0, 1,
-1.370089, 0.5369505, -2.496277, 1, 0.5058824, 0, 1,
-1.369844, -0.43683, -0.8956975, 1, 0.509804, 0, 1,
-1.368005, -1.146291, -1.662804, 1, 0.5176471, 0, 1,
-1.360588, 1.300554, -0.6263769, 1, 0.5215687, 0, 1,
-1.359873, -0.3705554, -0.1344743, 1, 0.5294118, 0, 1,
-1.352793, -1.674682, -0.1040146, 1, 0.5333334, 0, 1,
-1.343725, -0.3780832, 0.2955967, 1, 0.5411765, 0, 1,
-1.331899, 0.9211524, -0.5605091, 1, 0.5450981, 0, 1,
-1.325197, 0.1256117, -1.785549, 1, 0.5529412, 0, 1,
-1.315583, -0.3224252, 0.5943574, 1, 0.5568628, 0, 1,
-1.312773, -0.9653909, -3.323101, 1, 0.5647059, 0, 1,
-1.308636, 0.3545577, -2.152081, 1, 0.5686275, 0, 1,
-1.287371, 1.461963, 1.519389, 1, 0.5764706, 0, 1,
-1.286392, -1.59135, -4.003467, 1, 0.5803922, 0, 1,
-1.27625, 0.1468263, -2.050287, 1, 0.5882353, 0, 1,
-1.273824, 1.64694, -1.918698, 1, 0.5921569, 0, 1,
-1.266592, 0.6309247, -1.893406, 1, 0.6, 0, 1,
-1.264146, -0.3007917, -3.260327, 1, 0.6078432, 0, 1,
-1.258833, 0.5731292, -0.8424819, 1, 0.6117647, 0, 1,
-1.251322, 0.6285391, -1.229795, 1, 0.6196079, 0, 1,
-1.248325, -0.2795866, -3.425572, 1, 0.6235294, 0, 1,
-1.244358, 0.7502602, -1.852848, 1, 0.6313726, 0, 1,
-1.235233, -0.7771825, -3.739239, 1, 0.6352941, 0, 1,
-1.226822, 0.09267183, -2.052233, 1, 0.6431373, 0, 1,
-1.221439, -1.607381, -2.392177, 1, 0.6470588, 0, 1,
-1.217504, 1.671765, -1.809806, 1, 0.654902, 0, 1,
-1.214164, -0.2923476, -3.551613, 1, 0.6588235, 0, 1,
-1.211353, 0.6883552, -0.35329, 1, 0.6666667, 0, 1,
-1.195986, -0.08394174, 0.5171523, 1, 0.6705883, 0, 1,
-1.194562, -0.9519928, -2.866875, 1, 0.6784314, 0, 1,
-1.188128, -0.2385194, -2.618748, 1, 0.682353, 0, 1,
-1.182964, -0.718631, -1.546711, 1, 0.6901961, 0, 1,
-1.162148, 1.734265, -2.245268, 1, 0.6941177, 0, 1,
-1.159315, -0.322929, -1.66388, 1, 0.7019608, 0, 1,
-1.157852, 0.2080154, -2.268823, 1, 0.7098039, 0, 1,
-1.157426, -2.264074, -2.772936, 1, 0.7137255, 0, 1,
-1.154053, -1.57155, -3.382511, 1, 0.7215686, 0, 1,
-1.148393, 0.1367141, -1.358371, 1, 0.7254902, 0, 1,
-1.145413, 0.9176239, 0.09308928, 1, 0.7333333, 0, 1,
-1.137603, 1.049646, 0.2030793, 1, 0.7372549, 0, 1,
-1.128252, -0.5893191, -4.198482, 1, 0.7450981, 0, 1,
-1.1267, 0.9226226, -1.287316, 1, 0.7490196, 0, 1,
-1.122538, -0.4339281, -2.608328, 1, 0.7568628, 0, 1,
-1.103167, 0.571905, -1.268654, 1, 0.7607843, 0, 1,
-1.095742, 0.4134232, -1.240749, 1, 0.7686275, 0, 1,
-1.092613, -0.181377, -1.282248, 1, 0.772549, 0, 1,
-1.092376, 1.021042, -0.482389, 1, 0.7803922, 0, 1,
-1.09234, -0.8047188, -3.602572, 1, 0.7843137, 0, 1,
-1.087583, 0.6706647, -1.183292, 1, 0.7921569, 0, 1,
-1.065988, 0.914592, -0.6550134, 1, 0.7960784, 0, 1,
-1.065949, 1.502525, -2.220245, 1, 0.8039216, 0, 1,
-1.065101, -0.07826574, -1.343083, 1, 0.8117647, 0, 1,
-1.061772, -1.242748, -2.454227, 1, 0.8156863, 0, 1,
-1.05655, 1.919811, -0.7712863, 1, 0.8235294, 0, 1,
-1.054978, -2.729739, -1.630412, 1, 0.827451, 0, 1,
-1.048923, 0.195839, -1.101869, 1, 0.8352941, 0, 1,
-1.043543, 1.456784, -2.830816, 1, 0.8392157, 0, 1,
-1.040241, -1.268829, -1.985458, 1, 0.8470588, 0, 1,
-1.038227, 0.9914609, -1.307157, 1, 0.8509804, 0, 1,
-1.036193, -0.7516798, -1.135662, 1, 0.8588235, 0, 1,
-1.025017, -1.010533, -2.6042, 1, 0.8627451, 0, 1,
-1.021727, -0.7529382, -2.201567, 1, 0.8705882, 0, 1,
-1.021495, 2.011866, 0.2093753, 1, 0.8745098, 0, 1,
-0.998274, -0.5024113, -1.825304, 1, 0.8823529, 0, 1,
-0.9931077, -0.07600062, -1.146845, 1, 0.8862745, 0, 1,
-0.9921097, -1.098433, -1.488259, 1, 0.8941177, 0, 1,
-0.9814806, 1.627448, -1.324272, 1, 0.8980392, 0, 1,
-0.9805433, 0.2975052, 0.3801495, 1, 0.9058824, 0, 1,
-0.9731521, -0.006991281, -0.4167689, 1, 0.9137255, 0, 1,
-0.9729807, -1.008949, -2.603492, 1, 0.9176471, 0, 1,
-0.967673, -0.008377551, -0.8634346, 1, 0.9254902, 0, 1,
-0.9595399, 0.3460008, 0.02859669, 1, 0.9294118, 0, 1,
-0.9462379, -0.577033, -4.127949, 1, 0.9372549, 0, 1,
-0.9438077, -0.02407175, -2.721655, 1, 0.9411765, 0, 1,
-0.9404998, 0.6755645, -0.9940897, 1, 0.9490196, 0, 1,
-0.9385986, -0.9837203, -1.204479, 1, 0.9529412, 0, 1,
-0.9280508, -0.7426705, -1.543586, 1, 0.9607843, 0, 1,
-0.9280268, -0.8490534, -2.815369, 1, 0.9647059, 0, 1,
-0.926959, -1.050551, -3.939109, 1, 0.972549, 0, 1,
-0.9256983, -0.8558599, -2.591194, 1, 0.9764706, 0, 1,
-0.924934, -1.419601, -3.428959, 1, 0.9843137, 0, 1,
-0.9210171, 1.032214, -0.6862341, 1, 0.9882353, 0, 1,
-0.9202485, -2.293832, -2.918478, 1, 0.9960784, 0, 1,
-0.9176083, 0.9609381, -0.08479827, 0.9960784, 1, 0, 1,
-0.9166022, 0.0777007, -1.797741, 0.9921569, 1, 0, 1,
-0.9137925, -0.5289031, -3.156108, 0.9843137, 1, 0, 1,
-0.9097473, 0.06626775, -1.513139, 0.9803922, 1, 0, 1,
-0.901283, -2.311175, -2.310117, 0.972549, 1, 0, 1,
-0.8995289, -1.141902, -2.358959, 0.9686275, 1, 0, 1,
-0.8987184, -0.6663541, -2.026124, 0.9607843, 1, 0, 1,
-0.8914054, 0.1522201, -1.516691, 0.9568627, 1, 0, 1,
-0.8733442, -0.5746635, -1.938537, 0.9490196, 1, 0, 1,
-0.8715208, -0.3166063, -1.293996, 0.945098, 1, 0, 1,
-0.868478, -1.561855, -0.7139678, 0.9372549, 1, 0, 1,
-0.8681691, 0.002005234, -0.4020636, 0.9333333, 1, 0, 1,
-0.8631703, -0.2402654, -3.17737, 0.9254902, 1, 0, 1,
-0.8617628, -1.183064, -2.435916, 0.9215686, 1, 0, 1,
-0.8530412, -0.783509, -2.372569, 0.9137255, 1, 0, 1,
-0.8452892, 0.8763589, 0.42888, 0.9098039, 1, 0, 1,
-0.8346089, 0.4511647, -1.18701, 0.9019608, 1, 0, 1,
-0.8284798, -0.5968879, -1.942873, 0.8941177, 1, 0, 1,
-0.8251843, 0.4302243, -0.5807548, 0.8901961, 1, 0, 1,
-0.8247778, -1.660451, -2.936419, 0.8823529, 1, 0, 1,
-0.8233998, -0.4530186, -3.822279, 0.8784314, 1, 0, 1,
-0.819233, -0.4254286, -1.906103, 0.8705882, 1, 0, 1,
-0.8190707, -0.2679579, -1.686923, 0.8666667, 1, 0, 1,
-0.8094372, -2.405149, -2.203583, 0.8588235, 1, 0, 1,
-0.8065383, -0.3411109, -3.357204, 0.854902, 1, 0, 1,
-0.8031583, 0.1247192, 0.6425065, 0.8470588, 1, 0, 1,
-0.8002189, -1.323106, -1.744107, 0.8431373, 1, 0, 1,
-0.7963785, 0.06609123, -1.964672, 0.8352941, 1, 0, 1,
-0.7925469, -0.6966504, -3.888846, 0.8313726, 1, 0, 1,
-0.7817721, 0.4376873, 0.1021838, 0.8235294, 1, 0, 1,
-0.771687, 0.9755027, 0.662411, 0.8196079, 1, 0, 1,
-0.7675837, 0.3988361, -2.023577, 0.8117647, 1, 0, 1,
-0.7643187, 0.5855169, 0.3917668, 0.8078431, 1, 0, 1,
-0.7543977, -0.7977697, -3.177547, 0.8, 1, 0, 1,
-0.7524813, -1.889996, -2.927379, 0.7921569, 1, 0, 1,
-0.7506399, -0.6142373, -1.409161, 0.7882353, 1, 0, 1,
-0.7476578, -0.2242484, -1.585467, 0.7803922, 1, 0, 1,
-0.7432487, 0.6923447, -0.3490777, 0.7764706, 1, 0, 1,
-0.7401209, 1.223251, 1.208961, 0.7686275, 1, 0, 1,
-0.7365426, -1.879163, -2.870323, 0.7647059, 1, 0, 1,
-0.7361611, -1.819718, -3.739025, 0.7568628, 1, 0, 1,
-0.7326042, -0.4609247, -2.435984, 0.7529412, 1, 0, 1,
-0.7298452, -0.6786425, -3.136806, 0.7450981, 1, 0, 1,
-0.7292337, 0.07954089, -1.960472, 0.7411765, 1, 0, 1,
-0.7254543, 0.1308169, -1.68184, 0.7333333, 1, 0, 1,
-0.7159022, -0.9439926, -0.3553047, 0.7294118, 1, 0, 1,
-0.7108906, -0.9713133, -3.019806, 0.7215686, 1, 0, 1,
-0.7038791, 0.2040959, -2.226022, 0.7176471, 1, 0, 1,
-0.7012874, -0.6795623, -1.965091, 0.7098039, 1, 0, 1,
-0.6979105, -0.2387466, 0.2661264, 0.7058824, 1, 0, 1,
-0.690651, -1.442894, -3.499622, 0.6980392, 1, 0, 1,
-0.6886764, -0.6760521, -2.034194, 0.6901961, 1, 0, 1,
-0.6872957, -1.254717, -0.9274989, 0.6862745, 1, 0, 1,
-0.684014, -0.4515082, -2.489133, 0.6784314, 1, 0, 1,
-0.6831397, -0.1555971, -1.019475, 0.6745098, 1, 0, 1,
-0.6805528, -0.5107328, -2.563877, 0.6666667, 1, 0, 1,
-0.6792352, -0.7149508, -2.840577, 0.6627451, 1, 0, 1,
-0.6747881, 0.4037939, -0.2618823, 0.654902, 1, 0, 1,
-0.6716305, 0.2426079, -1.975064, 0.6509804, 1, 0, 1,
-0.668278, -0.8860435, -3.582508, 0.6431373, 1, 0, 1,
-0.6664985, 1.052146, 0.3801988, 0.6392157, 1, 0, 1,
-0.6647016, -0.5295406, -2.986461, 0.6313726, 1, 0, 1,
-0.6582175, 0.4114872, -0.7598345, 0.627451, 1, 0, 1,
-0.6444116, 0.8523673, -1.386933, 0.6196079, 1, 0, 1,
-0.6432318, 0.9317989, -0.8276312, 0.6156863, 1, 0, 1,
-0.6403998, -0.5995968, -1.811129, 0.6078432, 1, 0, 1,
-0.6402578, -0.9000855, -5.159052, 0.6039216, 1, 0, 1,
-0.6352908, -0.2544748, -1.515461, 0.5960785, 1, 0, 1,
-0.6333072, 0.1477148, 0.1773795, 0.5882353, 1, 0, 1,
-0.631496, -0.4670395, -2.713714, 0.5843138, 1, 0, 1,
-0.6290742, 1.444368, -1.012311, 0.5764706, 1, 0, 1,
-0.6273249, 0.8045269, -1.874737, 0.572549, 1, 0, 1,
-0.6169272, -0.4434806, -3.530966, 0.5647059, 1, 0, 1,
-0.6165196, -0.7531921, -3.241658, 0.5607843, 1, 0, 1,
-0.6154519, -0.4930764, -3.517477, 0.5529412, 1, 0, 1,
-0.6119371, 0.8303972, -0.08621596, 0.5490196, 1, 0, 1,
-0.6100968, -0.5867916, -0.5212379, 0.5411765, 1, 0, 1,
-0.608879, -1.187915, -2.400191, 0.5372549, 1, 0, 1,
-0.6059842, -1.704046, -0.5023713, 0.5294118, 1, 0, 1,
-0.6053103, 0.6241008, -0.7152844, 0.5254902, 1, 0, 1,
-0.6013892, -1.010044, -2.815726, 0.5176471, 1, 0, 1,
-0.6004385, 0.1508597, -1.670365, 0.5137255, 1, 0, 1,
-0.5967146, -0.2590433, -2.985575, 0.5058824, 1, 0, 1,
-0.5958892, 0.9002354, -1.406828, 0.5019608, 1, 0, 1,
-0.5956838, -0.559957, -1.904254, 0.4941176, 1, 0, 1,
-0.5934761, -1.22217, -2.537719, 0.4862745, 1, 0, 1,
-0.5927054, 0.2771753, -2.134876, 0.4823529, 1, 0, 1,
-0.5910591, -0.1465018, -2.154052, 0.4745098, 1, 0, 1,
-0.5901367, 1.603591, -0.2002074, 0.4705882, 1, 0, 1,
-0.5882732, 1.311289, 0.1388533, 0.4627451, 1, 0, 1,
-0.5861969, -1.742562, -2.430338, 0.4588235, 1, 0, 1,
-0.57954, -0.5057442, -1.910029, 0.4509804, 1, 0, 1,
-0.5788628, 0.6930789, -2.217875, 0.4470588, 1, 0, 1,
-0.5775274, 0.5491311, 0.159602, 0.4392157, 1, 0, 1,
-0.5773845, -0.1421708, 0.08336061, 0.4352941, 1, 0, 1,
-0.5756988, -0.3393973, -1.382187, 0.427451, 1, 0, 1,
-0.5755436, -0.1772685, -4.530796, 0.4235294, 1, 0, 1,
-0.5733306, -2.02487, -3.530509, 0.4156863, 1, 0, 1,
-0.5731739, -0.1457325, -2.240924, 0.4117647, 1, 0, 1,
-0.5725797, 1.488681, 1.329062, 0.4039216, 1, 0, 1,
-0.5688758, -0.351525, -2.304374, 0.3960784, 1, 0, 1,
-0.56591, 1.132591, -1.514423, 0.3921569, 1, 0, 1,
-0.5626726, -1.292055, -1.604873, 0.3843137, 1, 0, 1,
-0.5621458, 0.05625223, 0.5143202, 0.3803922, 1, 0, 1,
-0.5562913, 1.489919, 0.2589006, 0.372549, 1, 0, 1,
-0.5558369, 0.7155294, 0.3199617, 0.3686275, 1, 0, 1,
-0.5483111, 0.620271, 0.2793351, 0.3607843, 1, 0, 1,
-0.5482543, 0.03658362, -0.7316976, 0.3568628, 1, 0, 1,
-0.5469138, 2.218745, 0.630338, 0.3490196, 1, 0, 1,
-0.5434558, 2.228804, -1.361258, 0.345098, 1, 0, 1,
-0.537405, -0.5543658, -3.530832, 0.3372549, 1, 0, 1,
-0.534067, 0.184757, -2.304398, 0.3333333, 1, 0, 1,
-0.5297387, 0.05171539, -2.618425, 0.3254902, 1, 0, 1,
-0.5267643, 0.7382405, 0.3419206, 0.3215686, 1, 0, 1,
-0.5213217, -0.8100817, -3.02169, 0.3137255, 1, 0, 1,
-0.5201208, -0.01989044, -1.944818, 0.3098039, 1, 0, 1,
-0.5132346, -2.295061, -1.6436, 0.3019608, 1, 0, 1,
-0.5104019, 0.3017834, -0.807411, 0.2941177, 1, 0, 1,
-0.5011235, -0.2286442, -1.863158, 0.2901961, 1, 0, 1,
-0.4988092, 1.537581, 0.800344, 0.282353, 1, 0, 1,
-0.4954487, 0.8200601, -3.268676, 0.2784314, 1, 0, 1,
-0.4947252, 0.6941371, -0.5810525, 0.2705882, 1, 0, 1,
-0.492625, -0.2762837, -3.707816, 0.2666667, 1, 0, 1,
-0.4875493, 0.002435417, -1.273293, 0.2588235, 1, 0, 1,
-0.4873915, 1.48947, 0.934131, 0.254902, 1, 0, 1,
-0.4851377, -1.539213, -3.442564, 0.2470588, 1, 0, 1,
-0.4845235, -0.8029786, -1.410951, 0.2431373, 1, 0, 1,
-0.4839246, 0.5159143, -2.064104, 0.2352941, 1, 0, 1,
-0.4826535, -0.564971, -1.445546, 0.2313726, 1, 0, 1,
-0.47913, 0.2665227, -1.424634, 0.2235294, 1, 0, 1,
-0.4788104, -0.375832, -2.554532, 0.2196078, 1, 0, 1,
-0.4740572, -1.291997, -3.813655, 0.2117647, 1, 0, 1,
-0.4739636, 0.2385356, -1.858547, 0.2078431, 1, 0, 1,
-0.4702175, -1.321441, -3.475847, 0.2, 1, 0, 1,
-0.4659298, -1.116663, -2.575036, 0.1921569, 1, 0, 1,
-0.4639695, 0.6521118, -0.4718945, 0.1882353, 1, 0, 1,
-0.4637761, -0.9178449, -2.955131, 0.1803922, 1, 0, 1,
-0.4634432, 0.9038801, -0.3323343, 0.1764706, 1, 0, 1,
-0.4575232, 0.717355, 1.091358, 0.1686275, 1, 0, 1,
-0.4546645, 1.176893, -1.492191, 0.1647059, 1, 0, 1,
-0.4535471, -0.3291287, -2.918647, 0.1568628, 1, 0, 1,
-0.4534369, 0.4019442, 0.2406683, 0.1529412, 1, 0, 1,
-0.4527002, 0.6333944, -0.06612192, 0.145098, 1, 0, 1,
-0.4515671, 1.241114, -1.04867, 0.1411765, 1, 0, 1,
-0.4510176, -0.1436369, -2.101629, 0.1333333, 1, 0, 1,
-0.4496232, 0.07051653, -3.362699, 0.1294118, 1, 0, 1,
-0.449573, 0.2414079, 0.5582989, 0.1215686, 1, 0, 1,
-0.4473638, 0.137753, -1.370921, 0.1176471, 1, 0, 1,
-0.445089, -0.5842592, -1.257751, 0.1098039, 1, 0, 1,
-0.442295, -0.8610226, -1.571094, 0.1058824, 1, 0, 1,
-0.4414814, 2.256852, -0.5498207, 0.09803922, 1, 0, 1,
-0.4414267, -0.9962199, -4.966638, 0.09019608, 1, 0, 1,
-0.4413626, 0.9598511, -1.444552, 0.08627451, 1, 0, 1,
-0.4376029, 0.05111218, -0.7789423, 0.07843138, 1, 0, 1,
-0.4298576, -0.5140878, -3.53866, 0.07450981, 1, 0, 1,
-0.4278453, -1.272385, -0.3687379, 0.06666667, 1, 0, 1,
-0.4228458, 2.153317, -1.47816, 0.0627451, 1, 0, 1,
-0.4202192, 0.966581, -0.3920111, 0.05490196, 1, 0, 1,
-0.4185184, 0.05570153, 0.2520038, 0.05098039, 1, 0, 1,
-0.4163969, -0.3868034, -1.326361, 0.04313726, 1, 0, 1,
-0.4154863, 0.6341155, -0.2099458, 0.03921569, 1, 0, 1,
-0.4149325, 0.3135324, 0.1684331, 0.03137255, 1, 0, 1,
-0.4070731, 0.3582741, -0.2090093, 0.02745098, 1, 0, 1,
-0.4052188, 0.7657861, -0.3767562, 0.01960784, 1, 0, 1,
-0.4011507, 0.686121, 0.8196048, 0.01568628, 1, 0, 1,
-0.3947343, -0.4750088, -2.477552, 0.007843138, 1, 0, 1,
-0.3915652, -0.3551053, -2.02231, 0.003921569, 1, 0, 1,
-0.3895399, -1.434011, -5.266688, 0, 1, 0.003921569, 1,
-0.388487, 0.7181035, -1.446463, 0, 1, 0.01176471, 1,
-0.3884464, 0.9762141, 1.344179, 0, 1, 0.01568628, 1,
-0.3884045, 1.205789, 1.292604, 0, 1, 0.02352941, 1,
-0.3877956, 0.624003, -2.901581, 0, 1, 0.02745098, 1,
-0.381493, -0.8407256, -1.559163, 0, 1, 0.03529412, 1,
-0.380142, 1.492141, -0.7065614, 0, 1, 0.03921569, 1,
-0.376323, -0.4889466, -1.873704, 0, 1, 0.04705882, 1,
-0.3751098, -1.303841, -3.619686, 0, 1, 0.05098039, 1,
-0.3736981, -0.4224767, -1.229759, 0, 1, 0.05882353, 1,
-0.3712448, -0.8795067, -1.907968, 0, 1, 0.0627451, 1,
-0.363127, 0.5381401, -0.07255307, 0, 1, 0.07058824, 1,
-0.3617701, 1.283087, 1.081399, 0, 1, 0.07450981, 1,
-0.3573083, 1.719203, 0.3701312, 0, 1, 0.08235294, 1,
-0.3572745, -0.4022106, -3.647232, 0, 1, 0.08627451, 1,
-0.3563353, -0.4345011, -0.877956, 0, 1, 0.09411765, 1,
-0.3516493, -0.08804669, -1.03841, 0, 1, 0.1019608, 1,
-0.3478065, 0.09867672, -0.8638741, 0, 1, 0.1058824, 1,
-0.3362457, 0.9459032, -1.149212, 0, 1, 0.1137255, 1,
-0.3340995, -0.4158218, -3.557381, 0, 1, 0.1176471, 1,
-0.3333163, -0.3923112, -2.875975, 0, 1, 0.1254902, 1,
-0.3311916, 0.874886, -0.4780473, 0, 1, 0.1294118, 1,
-0.328972, -1.810602, -0.9838338, 0, 1, 0.1372549, 1,
-0.3278438, -1.363555, -2.439338, 0, 1, 0.1411765, 1,
-0.3242548, 1.002074, -0.3337774, 0, 1, 0.1490196, 1,
-0.3217803, 0.552704, -0.06492225, 0, 1, 0.1529412, 1,
-0.3207193, -0.04863185, -1.263837, 0, 1, 0.1607843, 1,
-0.3194062, 0.1283855, -0.6219882, 0, 1, 0.1647059, 1,
-0.3180199, 0.490668, 0.6958116, 0, 1, 0.172549, 1,
-0.3142671, 0.1498434, 0.4410887, 0, 1, 0.1764706, 1,
-0.3099979, -0.03507882, -2.160781, 0, 1, 0.1843137, 1,
-0.3084092, -0.5318673, -2.193475, 0, 1, 0.1882353, 1,
-0.3082026, -0.8971127, -1.937407, 0, 1, 0.1960784, 1,
-0.3052775, -0.05810267, -0.3815332, 0, 1, 0.2039216, 1,
-0.2998089, -0.002307893, -2.074254, 0, 1, 0.2078431, 1,
-0.2944423, -1.845536, -4.004846, 0, 1, 0.2156863, 1,
-0.2940007, -0.7209583, -3.03373, 0, 1, 0.2196078, 1,
-0.2931962, -0.9542674, -1.996069, 0, 1, 0.227451, 1,
-0.284825, 1.014615, 1.005214, 0, 1, 0.2313726, 1,
-0.2777294, 0.6604133, -0.9488077, 0, 1, 0.2392157, 1,
-0.2750255, 0.663329, 0.8884673, 0, 1, 0.2431373, 1,
-0.2750136, 0.6962891, 0.9022444, 0, 1, 0.2509804, 1,
-0.2726055, 1.52567, -1.271226, 0, 1, 0.254902, 1,
-0.2722478, 0.3392161, 0.4250799, 0, 1, 0.2627451, 1,
-0.2689024, -0.2751816, -1.856939, 0, 1, 0.2666667, 1,
-0.2683591, 0.3359905, -1.759204, 0, 1, 0.2745098, 1,
-0.267529, -0.3982145, -3.288927, 0, 1, 0.2784314, 1,
-0.2641689, 0.8622463, -0.1961204, 0, 1, 0.2862745, 1,
-0.263851, 0.2809471, -2.947116, 0, 1, 0.2901961, 1,
-0.2628442, 0.07348561, -2.257133, 0, 1, 0.2980392, 1,
-0.2604192, 0.7662645, 0.004027181, 0, 1, 0.3058824, 1,
-0.2598941, 0.02403025, -2.484361, 0, 1, 0.3098039, 1,
-0.2517167, -0.7758552, -1.989177, 0, 1, 0.3176471, 1,
-0.2481719, 0.0185015, -2.687673, 0, 1, 0.3215686, 1,
-0.2476897, -0.1350898, -5.035225, 0, 1, 0.3294118, 1,
-0.2471662, 0.1183522, -0.2269142, 0, 1, 0.3333333, 1,
-0.2399148, -0.3933115, -2.094212, 0, 1, 0.3411765, 1,
-0.2379994, 0.4199163, -0.648445, 0, 1, 0.345098, 1,
-0.2350706, -0.1930267, -1.884156, 0, 1, 0.3529412, 1,
-0.233098, 0.04173376, -1.640072, 0, 1, 0.3568628, 1,
-0.2319047, -2.803194, -4.124838, 0, 1, 0.3647059, 1,
-0.2293169, 0.5866573, -1.866292, 0, 1, 0.3686275, 1,
-0.2290747, -0.5365477, -2.995031, 0, 1, 0.3764706, 1,
-0.2253971, 1.587716, -2.109627, 0, 1, 0.3803922, 1,
-0.2201621, -0.4825225, -3.756361, 0, 1, 0.3882353, 1,
-0.2200656, -0.7051377, -2.189788, 0, 1, 0.3921569, 1,
-0.2185402, 1.048322, 0.003582412, 0, 1, 0.4, 1,
-0.2171054, -0.8938465, -2.197318, 0, 1, 0.4078431, 1,
-0.2144314, 1.18959, -2.105438, 0, 1, 0.4117647, 1,
-0.2112757, -1.025404, -1.845138, 0, 1, 0.4196078, 1,
-0.2068129, -0.7007011, -2.702455, 0, 1, 0.4235294, 1,
-0.2043752, 0.4656289, -0.4919143, 0, 1, 0.4313726, 1,
-0.2040984, -0.7487164, -2.484855, 0, 1, 0.4352941, 1,
-0.2026755, -1.628016, -1.658978, 0, 1, 0.4431373, 1,
-0.2023947, -0.8989149, -3.813133, 0, 1, 0.4470588, 1,
-0.2012033, -0.0205979, -0.1791038, 0, 1, 0.454902, 1,
-0.1995167, 0.2751912, 1.604389, 0, 1, 0.4588235, 1,
-0.1965133, 0.1582194, -2.193138, 0, 1, 0.4666667, 1,
-0.1957316, 0.3903296, 1.11286, 0, 1, 0.4705882, 1,
-0.1924874, 1.033845, 0.9501271, 0, 1, 0.4784314, 1,
-0.1891559, 0.3103247, 0.3022159, 0, 1, 0.4823529, 1,
-0.1877095, 0.6917838, -1.170956, 0, 1, 0.4901961, 1,
-0.1865153, -0.6448928, -3.027178, 0, 1, 0.4941176, 1,
-0.1828165, -1.099997, -2.950208, 0, 1, 0.5019608, 1,
-0.1812552, -0.8915241, -3.251908, 0, 1, 0.509804, 1,
-0.1770612, -1.149976, -2.230567, 0, 1, 0.5137255, 1,
-0.1762077, -0.9591728, -2.580746, 0, 1, 0.5215687, 1,
-0.1758058, 1.228067, 0.33798, 0, 1, 0.5254902, 1,
-0.1755757, 0.8359905, 0.4109905, 0, 1, 0.5333334, 1,
-0.1755046, 0.6066097, 0.9669209, 0, 1, 0.5372549, 1,
-0.1694937, -0.4592, -3.707864, 0, 1, 0.5450981, 1,
-0.1689864, 0.5890076, -0.7413251, 0, 1, 0.5490196, 1,
-0.1661026, -0.9630902, -3.288657, 0, 1, 0.5568628, 1,
-0.1658292, 0.1961287, 1.040877, 0, 1, 0.5607843, 1,
-0.1575093, -0.09114577, -2.036196, 0, 1, 0.5686275, 1,
-0.155101, -1.260524, -4.10726, 0, 1, 0.572549, 1,
-0.153103, -0.2078083, -3.810753, 0, 1, 0.5803922, 1,
-0.1513568, 0.4631648, -0.7017713, 0, 1, 0.5843138, 1,
-0.150362, -0.4009466, -4.221997, 0, 1, 0.5921569, 1,
-0.1497782, 0.2433381, -1.782154, 0, 1, 0.5960785, 1,
-0.1487326, 0.518828, -0.4943283, 0, 1, 0.6039216, 1,
-0.1483005, -0.5718309, -2.870183, 0, 1, 0.6117647, 1,
-0.1482323, -0.020532, -2.135216, 0, 1, 0.6156863, 1,
-0.1474374, -1.119101, -2.16509, 0, 1, 0.6235294, 1,
-0.1451152, -0.09214663, -0.8400843, 0, 1, 0.627451, 1,
-0.1434205, -1.293149, -1.035392, 0, 1, 0.6352941, 1,
-0.1403862, -0.1312633, -3.410564, 0, 1, 0.6392157, 1,
-0.1371055, 0.3164142, -1.263812, 0, 1, 0.6470588, 1,
-0.1368434, -0.1147502, -2.256009, 0, 1, 0.6509804, 1,
-0.1366504, 0.5864925, -0.8756341, 0, 1, 0.6588235, 1,
-0.1365477, 0.8880099, -0.1686693, 0, 1, 0.6627451, 1,
-0.1326528, 0.8371426, 2.433429, 0, 1, 0.6705883, 1,
-0.1309021, -0.6148267, -3.343116, 0, 1, 0.6745098, 1,
-0.1238646, 0.7789955, 0.1111506, 0, 1, 0.682353, 1,
-0.1179564, 0.3581074, -1.029441, 0, 1, 0.6862745, 1,
-0.1081216, -0.6212701, -3.331119, 0, 1, 0.6941177, 1,
-0.1069881, -0.2746888, -2.353867, 0, 1, 0.7019608, 1,
-0.1050314, 1.029842, -0.2177132, 0, 1, 0.7058824, 1,
-0.1006258, 0.2134025, -1.320306, 0, 1, 0.7137255, 1,
-0.1003018, 1.766703, 1.543526, 0, 1, 0.7176471, 1,
-0.09832723, 0.2915531, -1.090533, 0, 1, 0.7254902, 1,
-0.08912241, 1.074193, -2.140644, 0, 1, 0.7294118, 1,
-0.08235262, -0.6774067, -2.646656, 0, 1, 0.7372549, 1,
-0.08206358, -0.1515505, -2.332408, 0, 1, 0.7411765, 1,
-0.07900923, -1.451341, -3.402195, 0, 1, 0.7490196, 1,
-0.07651451, 1.708127, 0.3742754, 0, 1, 0.7529412, 1,
-0.07334297, 0.8406872, 0.4168084, 0, 1, 0.7607843, 1,
-0.07199021, -1.309052, -2.618435, 0, 1, 0.7647059, 1,
-0.07087181, 0.5604453, -0.5761563, 0, 1, 0.772549, 1,
-0.06824975, -0.8520143, -1.903246, 0, 1, 0.7764706, 1,
-0.06448297, 0.4990769, 0.9744853, 0, 1, 0.7843137, 1,
-0.0576749, 0.1572257, -1.06694, 0, 1, 0.7882353, 1,
-0.05343243, -0.1633384, -2.75506, 0, 1, 0.7960784, 1,
-0.05218687, 0.8238004, -0.9690071, 0, 1, 0.8039216, 1,
-0.04622598, -0.3574139, -2.378228, 0, 1, 0.8078431, 1,
-0.04052443, 1.015134, 0.5372015, 0, 1, 0.8156863, 1,
-0.03343981, -1.751173, -2.611485, 0, 1, 0.8196079, 1,
-0.03212158, 0.9874143, -0.1467455, 0, 1, 0.827451, 1,
-0.02870858, 0.3440057, -0.1841057, 0, 1, 0.8313726, 1,
-0.02492413, 0.8835996, -0.2962245, 0, 1, 0.8392157, 1,
-0.02445346, 0.9577126, -0.3590904, 0, 1, 0.8431373, 1,
-0.02281141, -0.3900036, -2.709616, 0, 1, 0.8509804, 1,
-0.0207833, -0.3769649, -3.63947, 0, 1, 0.854902, 1,
-0.01920324, 1.141902, -1.216386, 0, 1, 0.8627451, 1,
-0.01708422, 1.598682, -1.201585, 0, 1, 0.8666667, 1,
-0.01431859, 0.09926502, -0.1551223, 0, 1, 0.8745098, 1,
-0.01197831, 1.596262, -0.338011, 0, 1, 0.8784314, 1,
-0.01167108, -0.427495, -2.347501, 0, 1, 0.8862745, 1,
-0.006807303, -1.335294, -4.298427, 0, 1, 0.8901961, 1,
-0.004207867, 0.2182272, -1.246616, 0, 1, 0.8980392, 1,
-0.00362184, -0.6101031, -1.992836, 0, 1, 0.9058824, 1,
-0.003574419, -2.20263, -4.706107, 0, 1, 0.9098039, 1,
-0.0001271276, 0.3031265, -0.3027064, 0, 1, 0.9176471, 1,
0.001730703, 2.126014, -0.680571, 0, 1, 0.9215686, 1,
0.009662407, 2.546314, -0.1925635, 0, 1, 0.9294118, 1,
0.01046694, 1.027079, -0.3920431, 0, 1, 0.9333333, 1,
0.01603369, 0.1416084, -0.7040948, 0, 1, 0.9411765, 1,
0.02094053, 0.002508168, 1.348049, 0, 1, 0.945098, 1,
0.02113008, -1.564578, 2.977646, 0, 1, 0.9529412, 1,
0.02409897, 1.342775, 0.4112703, 0, 1, 0.9568627, 1,
0.0258075, 0.1020408, -0.774134, 0, 1, 0.9647059, 1,
0.02978042, -0.394256, 3.408876, 0, 1, 0.9686275, 1,
0.03160116, -0.6773259, 3.347948, 0, 1, 0.9764706, 1,
0.03558438, -2.132073, 3.31939, 0, 1, 0.9803922, 1,
0.0366884, 1.951218, -0.5424736, 0, 1, 0.9882353, 1,
0.04008323, -1.125583, 4.304347, 0, 1, 0.9921569, 1,
0.04515897, -0.7161015, 2.649053, 0, 1, 1, 1,
0.04557024, 0.4430096, 1.681594, 0, 0.9921569, 1, 1,
0.05479027, 0.2981994, 0.00316309, 0, 0.9882353, 1, 1,
0.05856316, 1.462541, -0.5190527, 0, 0.9803922, 1, 1,
0.05902525, -1.32716, 2.436624, 0, 0.9764706, 1, 1,
0.06140705, -1.240782, 4.103889, 0, 0.9686275, 1, 1,
0.06772273, 0.1576858, -0.378455, 0, 0.9647059, 1, 1,
0.06929537, -0.490977, 3.520152, 0, 0.9568627, 1, 1,
0.07017001, 1.276857, 0.08453731, 0, 0.9529412, 1, 1,
0.07032996, 0.7168481, 0.8796546, 0, 0.945098, 1, 1,
0.07137369, -0.5869479, 4.750371, 0, 0.9411765, 1, 1,
0.0718845, 0.09357923, 1.103596, 0, 0.9333333, 1, 1,
0.07339009, 0.7284775, 1.18921, 0, 0.9294118, 1, 1,
0.0769465, 0.7386732, -0.2649792, 0, 0.9215686, 1, 1,
0.08075985, 0.4686743, 0.4016249, 0, 0.9176471, 1, 1,
0.08736942, 0.1416831, 1.979745, 0, 0.9098039, 1, 1,
0.09013256, -1.137619, 3.605508, 0, 0.9058824, 1, 1,
0.09176068, 0.03705747, 2.438875, 0, 0.8980392, 1, 1,
0.09427695, 0.146984, 0.6330048, 0, 0.8901961, 1, 1,
0.1002253, 0.09695531, 0.8731815, 0, 0.8862745, 1, 1,
0.1008253, 1.328207, 1.170269, 0, 0.8784314, 1, 1,
0.1111975, 1.202028, 1.520377, 0, 0.8745098, 1, 1,
0.1122537, -0.7172536, 2.610745, 0, 0.8666667, 1, 1,
0.1124604, -0.9808921, 4.066286, 0, 0.8627451, 1, 1,
0.1144844, 0.9654318, -1.925309, 0, 0.854902, 1, 1,
0.114872, 0.05505672, 2.168971, 0, 0.8509804, 1, 1,
0.1167659, -0.5791076, 3.73701, 0, 0.8431373, 1, 1,
0.1175143, -0.278483, 4.011837, 0, 0.8392157, 1, 1,
0.1207772, 0.8938669, -0.3249814, 0, 0.8313726, 1, 1,
0.1216827, -1.78898, 3.087459, 0, 0.827451, 1, 1,
0.1237687, 0.388243, 0.6737679, 0, 0.8196079, 1, 1,
0.125051, 0.3644446, -1.531085, 0, 0.8156863, 1, 1,
0.1323539, 0.6217924, 0.2984436, 0, 0.8078431, 1, 1,
0.1408514, -0.2519736, 2.605049, 0, 0.8039216, 1, 1,
0.1458364, 0.1230363, 0.3955959, 0, 0.7960784, 1, 1,
0.1563429, -0.5753183, 3.628426, 0, 0.7882353, 1, 1,
0.1565714, -2.439441, 3.681862, 0, 0.7843137, 1, 1,
0.1573229, 0.8675117, 1.942236, 0, 0.7764706, 1, 1,
0.1575308, 0.2984945, 0.6538719, 0, 0.772549, 1, 1,
0.1589409, 0.143164, -0.7001194, 0, 0.7647059, 1, 1,
0.160092, -0.5762841, 1.24591, 0, 0.7607843, 1, 1,
0.1621028, -0.4055401, 3.214225, 0, 0.7529412, 1, 1,
0.1639541, 0.2480512, 0.5565799, 0, 0.7490196, 1, 1,
0.1667054, -0.5940757, 3.10796, 0, 0.7411765, 1, 1,
0.1681882, 0.2772306, 0.3582411, 0, 0.7372549, 1, 1,
0.1691999, 0.2628722, 1.067693, 0, 0.7294118, 1, 1,
0.1764313, -0.7318027, 3.684305, 0, 0.7254902, 1, 1,
0.1768516, 1.977157, 0.554867, 0, 0.7176471, 1, 1,
0.1805567, 0.7259594, -0.7352519, 0, 0.7137255, 1, 1,
0.1828094, -0.371194, 0.91781, 0, 0.7058824, 1, 1,
0.1858714, 0.8864539, -0.1497815, 0, 0.6980392, 1, 1,
0.1863911, -0.783963, 2.591129, 0, 0.6941177, 1, 1,
0.1885066, 1.130522, -0.1072386, 0, 0.6862745, 1, 1,
0.1905448, -0.09527125, 2.248021, 0, 0.682353, 1, 1,
0.1931613, -0.9832532, 3.395198, 0, 0.6745098, 1, 1,
0.1963572, 0.4375313, -0.6281679, 0, 0.6705883, 1, 1,
0.1964982, 0.7870442, 0.05268126, 0, 0.6627451, 1, 1,
0.1966726, -0.3571416, 3.648347, 0, 0.6588235, 1, 1,
0.197153, 0.08860853, 0.008294386, 0, 0.6509804, 1, 1,
0.2018939, 0.2160454, 1.341818, 0, 0.6470588, 1, 1,
0.2106864, -0.3001714, 0.2770656, 0, 0.6392157, 1, 1,
0.214815, 0.08729608, -0.7493364, 0, 0.6352941, 1, 1,
0.2202782, 0.1913295, 0.5771523, 0, 0.627451, 1, 1,
0.2216575, -0.3059413, 1.768777, 0, 0.6235294, 1, 1,
0.2232991, 0.6540042, -0.2490842, 0, 0.6156863, 1, 1,
0.2240236, 0.2032724, -0.5116121, 0, 0.6117647, 1, 1,
0.2244136, 0.5453507, 1.984131, 0, 0.6039216, 1, 1,
0.2265943, 2.241787, 1.123973, 0, 0.5960785, 1, 1,
0.2277491, 1.876535, -0.6904094, 0, 0.5921569, 1, 1,
0.2279626, -1.495109, 3.207601, 0, 0.5843138, 1, 1,
0.2302635, 0.8334249, -0.9488507, 0, 0.5803922, 1, 1,
0.2373836, 1.424374, 0.9546121, 0, 0.572549, 1, 1,
0.2392805, 0.2012653, 1.171758, 0, 0.5686275, 1, 1,
0.2394735, 1.006086, -0.01515174, 0, 0.5607843, 1, 1,
0.2396627, -0.8095175, 1.384649, 0, 0.5568628, 1, 1,
0.2402893, 0.2208924, 0.388381, 0, 0.5490196, 1, 1,
0.2441495, 0.6738243, 1.637561, 0, 0.5450981, 1, 1,
0.2446755, 2.737803, 0.05175335, 0, 0.5372549, 1, 1,
0.2449192, -0.3412371, 2.654828, 0, 0.5333334, 1, 1,
0.2464951, 0.8163294, -1.074891, 0, 0.5254902, 1, 1,
0.2520009, 1.824694, -0.3744482, 0, 0.5215687, 1, 1,
0.252775, -0.4628699, 3.309942, 0, 0.5137255, 1, 1,
0.2566854, 0.3451324, -0.8777803, 0, 0.509804, 1, 1,
0.2635175, 2.738557, 0.8219592, 0, 0.5019608, 1, 1,
0.2697778, 0.9344456, 0.2977907, 0, 0.4941176, 1, 1,
0.2737837, -1.279634, 4.46463, 0, 0.4901961, 1, 1,
0.2741326, -1.593997, 0.6012222, 0, 0.4823529, 1, 1,
0.2793096, -0.1217291, 3.182683, 0, 0.4784314, 1, 1,
0.2810619, 0.8604269, 0.7835761, 0, 0.4705882, 1, 1,
0.2826168, 0.006028269, 2.378985, 0, 0.4666667, 1, 1,
0.2827717, 0.4943987, 0.8648404, 0, 0.4588235, 1, 1,
0.2837384, 0.140414, 1.012776, 0, 0.454902, 1, 1,
0.2868031, 0.02636882, 1.373472, 0, 0.4470588, 1, 1,
0.2873124, 0.8143252, -0.3524722, 0, 0.4431373, 1, 1,
0.2888188, -0.3543127, 4.139574, 0, 0.4352941, 1, 1,
0.2914345, 0.5635237, 1.174876, 0, 0.4313726, 1, 1,
0.2940839, 0.4573123, 0.3118475, 0, 0.4235294, 1, 1,
0.2951472, -0.8499579, 3.169398, 0, 0.4196078, 1, 1,
0.2951585, 0.2072181, 2.817556, 0, 0.4117647, 1, 1,
0.2983458, -0.1444386, 1.897262, 0, 0.4078431, 1, 1,
0.2995494, -1.001595, 0.8937897, 0, 0.4, 1, 1,
0.3030328, 0.4093515, -0.1256646, 0, 0.3921569, 1, 1,
0.3033094, 0.6433143, -0.3169724, 0, 0.3882353, 1, 1,
0.3082967, -0.3753112, 1.852647, 0, 0.3803922, 1, 1,
0.3119494, 0.2160564, 0.7744197, 0, 0.3764706, 1, 1,
0.3131291, -1.285867, 3.692007, 0, 0.3686275, 1, 1,
0.3134788, -0.9781588, 3.925051, 0, 0.3647059, 1, 1,
0.3136951, -1.028186, 2.792089, 0, 0.3568628, 1, 1,
0.3172338, -0.7806143, 3.975827, 0, 0.3529412, 1, 1,
0.3181904, -0.5745189, 3.407129, 0, 0.345098, 1, 1,
0.3201109, 1.616747, 0.6099854, 0, 0.3411765, 1, 1,
0.3217474, 0.01715908, 0.5966447, 0, 0.3333333, 1, 1,
0.3218087, -1.288615, 3.088885, 0, 0.3294118, 1, 1,
0.3226242, 0.714879, -1.21158, 0, 0.3215686, 1, 1,
0.3255, 1.331109, 1.472115, 0, 0.3176471, 1, 1,
0.3255444, -1.023259, 5.444671, 0, 0.3098039, 1, 1,
0.326846, 0.3900199, 1.251187, 0, 0.3058824, 1, 1,
0.3299092, -1.012743, 2.375047, 0, 0.2980392, 1, 1,
0.3309297, -1.094709, 2.576358, 0, 0.2901961, 1, 1,
0.3319786, 1.352407, 0.8423989, 0, 0.2862745, 1, 1,
0.3326787, -0.2666103, 1.490184, 0, 0.2784314, 1, 1,
0.3389904, 0.1073991, -0.5165892, 0, 0.2745098, 1, 1,
0.342158, 0.3386311, 1.342659, 0, 0.2666667, 1, 1,
0.3438644, 0.0112188, 2.457741, 0, 0.2627451, 1, 1,
0.3443598, 0.5148906, 0.850969, 0, 0.254902, 1, 1,
0.3535737, 1.147471, -1.600096, 0, 0.2509804, 1, 1,
0.3653026, 1.485994, 0.9074058, 0, 0.2431373, 1, 1,
0.3690037, -0.2024356, 1.01569, 0, 0.2392157, 1, 1,
0.3699267, 0.9313434, 0.9914498, 0, 0.2313726, 1, 1,
0.3706456, -0.1390402, 1.172093, 0, 0.227451, 1, 1,
0.3714219, 1.699627, -0.5869583, 0, 0.2196078, 1, 1,
0.3791636, 0.6903674, 1.587114, 0, 0.2156863, 1, 1,
0.3793015, -2.577223, 2.81403, 0, 0.2078431, 1, 1,
0.3794203, -1.599235, 3.575941, 0, 0.2039216, 1, 1,
0.3796079, 0.8161797, -1.811729, 0, 0.1960784, 1, 1,
0.3799184, -0.169047, 2.211295, 0, 0.1882353, 1, 1,
0.3810757, -1.089232, 2.92297, 0, 0.1843137, 1, 1,
0.3829461, 1.318513, 0.33959, 0, 0.1764706, 1, 1,
0.3831003, 0.768245, 0.2685359, 0, 0.172549, 1, 1,
0.387987, -1.503718, 2.723406, 0, 0.1647059, 1, 1,
0.3897249, 1.38205, -0.6137518, 0, 0.1607843, 1, 1,
0.3902292, 0.03758764, 2.446996, 0, 0.1529412, 1, 1,
0.3907091, 0.04821637, 2.129231, 0, 0.1490196, 1, 1,
0.3938752, -0.4786206, 2.149432, 0, 0.1411765, 1, 1,
0.402741, -1.102907, 3.146674, 0, 0.1372549, 1, 1,
0.4090239, 0.1696714, 1.100764, 0, 0.1294118, 1, 1,
0.4090306, 0.7865849, -1.561027, 0, 0.1254902, 1, 1,
0.4187492, 0.8812917, 2.602522, 0, 0.1176471, 1, 1,
0.4239661, -1.392892, 0.1813687, 0, 0.1137255, 1, 1,
0.4246405, -1.633179, 2.58486, 0, 0.1058824, 1, 1,
0.4263716, 0.2731191, 0.6955214, 0, 0.09803922, 1, 1,
0.4327336, 0.4174438, 1.775541, 0, 0.09411765, 1, 1,
0.4363503, -0.6789491, 1.350344, 0, 0.08627451, 1, 1,
0.4371913, 0.2669092, -0.5844483, 0, 0.08235294, 1, 1,
0.4373021, -0.02268282, 1.566204, 0, 0.07450981, 1, 1,
0.4407153, 1.212388, 1.340979, 0, 0.07058824, 1, 1,
0.4429716, 0.7511784, 1.500322, 0, 0.0627451, 1, 1,
0.4460849, 0.5375429, 1.337209, 0, 0.05882353, 1, 1,
0.4504659, -0.8276958, 1.367138, 0, 0.05098039, 1, 1,
0.4658194, 1.072394, 0.4046744, 0, 0.04705882, 1, 1,
0.471208, -0.5091175, 3.142155, 0, 0.03921569, 1, 1,
0.4830282, -0.263589, 3.00772, 0, 0.03529412, 1, 1,
0.4838148, -1.376546, 1.407904, 0, 0.02745098, 1, 1,
0.4875462, 1.133648, 0.3699348, 0, 0.02352941, 1, 1,
0.4886391, 1.074394, 0.6773145, 0, 0.01568628, 1, 1,
0.4939843, 1.277607, 1.595209, 0, 0.01176471, 1, 1,
0.5028242, 0.2684908, 1.749791, 0, 0.003921569, 1, 1,
0.5035526, 2.161841, -0.7094519, 0.003921569, 0, 1, 1,
0.5083275, -1.339027, 3.318844, 0.007843138, 0, 1, 1,
0.5109286, 0.2017498, 1.857779, 0.01568628, 0, 1, 1,
0.5150446, -0.8455693, 3.975224, 0.01960784, 0, 1, 1,
0.5198504, 1.49033, 0.2104655, 0.02745098, 0, 1, 1,
0.5299057, 0.4492148, 0.7532662, 0.03137255, 0, 1, 1,
0.5301214, 1.874089, 0.573805, 0.03921569, 0, 1, 1,
0.5319033, -0.2725612, 0.9080518, 0.04313726, 0, 1, 1,
0.5332891, -0.9338984, 2.92198, 0.05098039, 0, 1, 1,
0.5339047, 0.7636978, 1.763256, 0.05490196, 0, 1, 1,
0.5411149, 1.004456, 0.1267494, 0.0627451, 0, 1, 1,
0.5412358, 0.9368979, 1.601078, 0.06666667, 0, 1, 1,
0.5486192, 1.75542, -1.771691, 0.07450981, 0, 1, 1,
0.5494198, 0.9450304, -0.9536012, 0.07843138, 0, 1, 1,
0.5505376, 0.3593684, 1.619973, 0.08627451, 0, 1, 1,
0.5534627, -0.5791855, 2.18979, 0.09019608, 0, 1, 1,
0.5537017, 0.06851925, 1.318, 0.09803922, 0, 1, 1,
0.5562274, 0.2571933, 1.464649, 0.1058824, 0, 1, 1,
0.5565679, 0.2714211, -0.02567695, 0.1098039, 0, 1, 1,
0.5578947, -0.03754339, 1.935589, 0.1176471, 0, 1, 1,
0.5641261, -1.452499, 4.19438, 0.1215686, 0, 1, 1,
0.5647021, -0.4071714, 0.5181738, 0.1294118, 0, 1, 1,
0.5648283, 0.2316464, 1.300612, 0.1333333, 0, 1, 1,
0.5649566, 0.9138421, 2.355098, 0.1411765, 0, 1, 1,
0.5672308, -0.1078929, 2.621492, 0.145098, 0, 1, 1,
0.5717933, 0.9502908, -1.257647, 0.1529412, 0, 1, 1,
0.5734372, -1.79095, 2.915443, 0.1568628, 0, 1, 1,
0.5763249, 0.8577658, -1.234795, 0.1647059, 0, 1, 1,
0.5800026, -1.798535, 5.178071, 0.1686275, 0, 1, 1,
0.5805995, 0.8265515, -0.6396181, 0.1764706, 0, 1, 1,
0.5820072, 0.8975564, -0.7816119, 0.1803922, 0, 1, 1,
0.5822649, -0.4355429, 2.934036, 0.1882353, 0, 1, 1,
0.5950172, 2.324149, -0.6435504, 0.1921569, 0, 1, 1,
0.5959367, 1.207843, 0.3166752, 0.2, 0, 1, 1,
0.5985315, -2.126693, 2.185212, 0.2078431, 0, 1, 1,
0.5994681, 0.9032549, 0.9489239, 0.2117647, 0, 1, 1,
0.6062535, 0.5542235, 0.02832558, 0.2196078, 0, 1, 1,
0.6100246, -0.3513116, 1.631546, 0.2235294, 0, 1, 1,
0.6105039, 0.4303985, 0.928425, 0.2313726, 0, 1, 1,
0.613011, 0.2568806, 0.09058509, 0.2352941, 0, 1, 1,
0.6182348, 0.510254, 1.768613, 0.2431373, 0, 1, 1,
0.621102, -0.04290134, 1.51734, 0.2470588, 0, 1, 1,
0.6214835, -0.2254878, 3.838727, 0.254902, 0, 1, 1,
0.6235069, 0.8355337, 1.871, 0.2588235, 0, 1, 1,
0.6237009, -1.22866, 1.45851, 0.2666667, 0, 1, 1,
0.6237736, -1.182192, 4.093455, 0.2705882, 0, 1, 1,
0.6241597, 1.10084, -0.4927019, 0.2784314, 0, 1, 1,
0.627457, -2.217325, 4.449004, 0.282353, 0, 1, 1,
0.6327658, 0.4514885, 0.3740474, 0.2901961, 0, 1, 1,
0.6415532, 0.949873, -0.5862542, 0.2941177, 0, 1, 1,
0.6455175, 1.371125, -1.591847, 0.3019608, 0, 1, 1,
0.6505845, -1.242634, 3.011919, 0.3098039, 0, 1, 1,
0.6505961, 1.007774, 0.1672066, 0.3137255, 0, 1, 1,
0.6568545, -0.1388853, 3.526204, 0.3215686, 0, 1, 1,
0.6575258, -1.127303, 3.080069, 0.3254902, 0, 1, 1,
0.6608443, 0.8356349, 1.594509, 0.3333333, 0, 1, 1,
0.6640534, -0.3269156, 2.038725, 0.3372549, 0, 1, 1,
0.6640713, -0.4803915, 2.932458, 0.345098, 0, 1, 1,
0.6651844, 0.5261936, 1.806291, 0.3490196, 0, 1, 1,
0.6655599, -0.5391408, 1.01102, 0.3568628, 0, 1, 1,
0.6753979, 0.5376951, 1.301069, 0.3607843, 0, 1, 1,
0.6790324, -1.364426, 1.534818, 0.3686275, 0, 1, 1,
0.679619, 1.380363, -0.4745163, 0.372549, 0, 1, 1,
0.681141, -0.9457643, 0.2362686, 0.3803922, 0, 1, 1,
0.6860465, 1.777417, 1.071144, 0.3843137, 0, 1, 1,
0.6877146, 0.08986543, 0.709962, 0.3921569, 0, 1, 1,
0.6886427, 0.07182199, 1.780094, 0.3960784, 0, 1, 1,
0.6914046, 0.1933296, 0.9500903, 0.4039216, 0, 1, 1,
0.6921787, -0.4260052, 2.434746, 0.4117647, 0, 1, 1,
0.693405, -1.355359, 3.588727, 0.4156863, 0, 1, 1,
0.6948331, -2.784413, 3.499886, 0.4235294, 0, 1, 1,
0.6968536, 0.2773388, 1.70805, 0.427451, 0, 1, 1,
0.6997189, 2.111959, 1.21346, 0.4352941, 0, 1, 1,
0.7000901, 0.8839669, 0.6926386, 0.4392157, 0, 1, 1,
0.7034386, 0.04274232, 2.027756, 0.4470588, 0, 1, 1,
0.7042266, -0.0104795, 3.038692, 0.4509804, 0, 1, 1,
0.7061092, -0.3948126, 2.192183, 0.4588235, 0, 1, 1,
0.7073158, 0.5196025, 2.202222, 0.4627451, 0, 1, 1,
0.7080051, 1.078989, 1.879971, 0.4705882, 0, 1, 1,
0.7106556, 0.1071033, 3.035999, 0.4745098, 0, 1, 1,
0.7207239, -0.4670616, 3.465487, 0.4823529, 0, 1, 1,
0.7209904, 1.433347, 0.908913, 0.4862745, 0, 1, 1,
0.7227862, -0.2251439, 2.070566, 0.4941176, 0, 1, 1,
0.7242329, 0.2784462, -1.046812, 0.5019608, 0, 1, 1,
0.7253788, -0.2569502, 2.85741, 0.5058824, 0, 1, 1,
0.7269197, -0.5044427, 1.947865, 0.5137255, 0, 1, 1,
0.7303689, -2.086195, 2.768273, 0.5176471, 0, 1, 1,
0.7344718, -0.6986386, 2.05721, 0.5254902, 0, 1, 1,
0.735522, -0.2900313, 1.799581, 0.5294118, 0, 1, 1,
0.7357567, 0.443899, 0.3616582, 0.5372549, 0, 1, 1,
0.7422307, 1.005684, 1.306153, 0.5411765, 0, 1, 1,
0.7444103, 0.6011255, 0.2975056, 0.5490196, 0, 1, 1,
0.7470735, 0.03543708, 1.83895, 0.5529412, 0, 1, 1,
0.7475496, 1.987824, 0.2136967, 0.5607843, 0, 1, 1,
0.752165, -0.8558065, 0.7016516, 0.5647059, 0, 1, 1,
0.754368, -0.3761004, 1.040841, 0.572549, 0, 1, 1,
0.7577342, -0.5808081, 3.714592, 0.5764706, 0, 1, 1,
0.7620689, -0.5866328, 2.076535, 0.5843138, 0, 1, 1,
0.7628566, -1.109338, 3.342664, 0.5882353, 0, 1, 1,
0.7637395, -1.08714, 1.352942, 0.5960785, 0, 1, 1,
0.7654886, 0.8346065, 0.1838055, 0.6039216, 0, 1, 1,
0.76875, -0.693715, 0.8680673, 0.6078432, 0, 1, 1,
0.7707601, -0.5414024, 2.243742, 0.6156863, 0, 1, 1,
0.7711762, 0.2341259, 1.386595, 0.6196079, 0, 1, 1,
0.772543, -0.8501276, 3.727249, 0.627451, 0, 1, 1,
0.7835163, -0.3843951, 0.6763485, 0.6313726, 0, 1, 1,
0.7925704, 1.606657, 0.7760366, 0.6392157, 0, 1, 1,
0.792599, -1.390007, 2.423393, 0.6431373, 0, 1, 1,
0.7989419, 0.7606075, 1.671906, 0.6509804, 0, 1, 1,
0.7995487, -0.5995677, 1.16487, 0.654902, 0, 1, 1,
0.8000385, -0.1103866, 1.803215, 0.6627451, 0, 1, 1,
0.8035132, -2.596477, 2.474876, 0.6666667, 0, 1, 1,
0.8037635, -0.2185915, 1.746238, 0.6745098, 0, 1, 1,
0.8075954, -1.162177, 2.742324, 0.6784314, 0, 1, 1,
0.8084219, -0.3508756, 1.938015, 0.6862745, 0, 1, 1,
0.8096167, -0.605373, 1.722673, 0.6901961, 0, 1, 1,
0.8098784, 1.128264, 0.03311268, 0.6980392, 0, 1, 1,
0.8221928, -1.712022, 3.800531, 0.7058824, 0, 1, 1,
0.8252081, -0.4139098, 2.218369, 0.7098039, 0, 1, 1,
0.8321441, 1.171841, 2.059502, 0.7176471, 0, 1, 1,
0.8339593, 1.883017, 0.5991917, 0.7215686, 0, 1, 1,
0.8377259, 0.3942075, 1.913403, 0.7294118, 0, 1, 1,
0.8484682, 0.1974782, 2.029903, 0.7333333, 0, 1, 1,
0.8486621, 0.6624711, 2.048782, 0.7411765, 0, 1, 1,
0.8495888, 1.332367, 0.4374543, 0.7450981, 0, 1, 1,
0.8505173, -1.489969, 3.638429, 0.7529412, 0, 1, 1,
0.8606024, 1.19445, 1.564506, 0.7568628, 0, 1, 1,
0.8680735, 1.102428, -0.3990887, 0.7647059, 0, 1, 1,
0.868255, 1.171921, 0.4870293, 0.7686275, 0, 1, 1,
0.8749723, -0.9042812, 2.617305, 0.7764706, 0, 1, 1,
0.8784607, -0.6165524, 0.9064227, 0.7803922, 0, 1, 1,
0.8796484, 1.301509, 0.6696289, 0.7882353, 0, 1, 1,
0.8839675, 0.2910113, 1.290282, 0.7921569, 0, 1, 1,
0.8874764, -0.4408565, 2.718896, 0.8, 0, 1, 1,
0.887648, 1.28961, -0.6426598, 0.8078431, 0, 1, 1,
0.8887559, -0.9119191, 3.582062, 0.8117647, 0, 1, 1,
0.8921809, -0.5268953, 2.073271, 0.8196079, 0, 1, 1,
0.8963686, 0.8307183, -0.2986392, 0.8235294, 0, 1, 1,
0.8972849, -0.7332019, 0.8437067, 0.8313726, 0, 1, 1,
0.90115, -0.4726379, 1.649763, 0.8352941, 0, 1, 1,
0.9034684, 0.5871868, 0.287539, 0.8431373, 0, 1, 1,
0.9076617, 0.4705307, -0.1159677, 0.8470588, 0, 1, 1,
0.9091192, 1.021889, 2.119035, 0.854902, 0, 1, 1,
0.9093973, -0.2633949, 1.289893, 0.8588235, 0, 1, 1,
0.9115419, 0.507762, 0.8709687, 0.8666667, 0, 1, 1,
0.9121158, -0.9965375, 3.23732, 0.8705882, 0, 1, 1,
0.9248762, 0.7521421, 2.184982, 0.8784314, 0, 1, 1,
0.9257752, -0.2694088, 1.749737, 0.8823529, 0, 1, 1,
0.9272609, 0.1525126, 1.35789, 0.8901961, 0, 1, 1,
0.9282987, -1.382236, 1.628846, 0.8941177, 0, 1, 1,
0.9313518, 0.9571745, -0.1483319, 0.9019608, 0, 1, 1,
0.9415916, 0.1469986, 4.404419, 0.9098039, 0, 1, 1,
0.944679, 1.479478, 3.080967, 0.9137255, 0, 1, 1,
0.94532, -0.6748599, 2.696934, 0.9215686, 0, 1, 1,
0.9503037, -1.301589, 2.311942, 0.9254902, 0, 1, 1,
0.956376, 0.9313935, 0.4946213, 0.9333333, 0, 1, 1,
0.9626868, -1.735261, 2.450478, 0.9372549, 0, 1, 1,
0.968556, -0.373113, 2.541033, 0.945098, 0, 1, 1,
0.9708368, -0.3077949, 1.34798, 0.9490196, 0, 1, 1,
0.9728786, -0.7320378, 1.303192, 0.9568627, 0, 1, 1,
0.974501, -1.084674, 2.615717, 0.9607843, 0, 1, 1,
0.9754041, -0.02251163, 3.521757, 0.9686275, 0, 1, 1,
0.9815468, 0.7914122, 2.04357, 0.972549, 0, 1, 1,
0.9832972, 0.02269549, 2.148139, 0.9803922, 0, 1, 1,
0.9837041, -0.1037919, 2.093956, 0.9843137, 0, 1, 1,
0.985894, -2.084149, 1.226262, 0.9921569, 0, 1, 1,
0.9882166, 0.4377809, -0.05943585, 0.9960784, 0, 1, 1,
0.9934699, 1.00829, 2.450995, 1, 0, 0.9960784, 1,
0.9963199, 0.5388236, 1.387528, 1, 0, 0.9882353, 1,
1.005795, -0.7687185, 1.853116, 1, 0, 0.9843137, 1,
1.022241, -0.4522254, 0.7495468, 1, 0, 0.9764706, 1,
1.031209, -0.6356539, 2.171831, 1, 0, 0.972549, 1,
1.036144, 1.17283, 1.459985, 1, 0, 0.9647059, 1,
1.036236, -0.2115996, 2.708042, 1, 0, 0.9607843, 1,
1.038288, -1.625021, 1.550028, 1, 0, 0.9529412, 1,
1.038781, 0.711327, -0.5566755, 1, 0, 0.9490196, 1,
1.040454, -0.09473997, 3.713448, 1, 0, 0.9411765, 1,
1.041419, 0.2454076, 1.817852, 1, 0, 0.9372549, 1,
1.041866, -2.611342, 2.566255, 1, 0, 0.9294118, 1,
1.042808, 0.316707, -0.1880344, 1, 0, 0.9254902, 1,
1.048103, -0.7492287, 1.78473, 1, 0, 0.9176471, 1,
1.055935, 1.008102, 0.4330533, 1, 0, 0.9137255, 1,
1.061189, -0.08365617, 1.557271, 1, 0, 0.9058824, 1,
1.062129, -0.5536152, 1.347582, 1, 0, 0.9019608, 1,
1.062911, 1.16168, 1.366943, 1, 0, 0.8941177, 1,
1.064092, 0.4090334, 1.140192, 1, 0, 0.8862745, 1,
1.066227, -1.848621, 3.129257, 1, 0, 0.8823529, 1,
1.07105, 2.022143, -0.1164442, 1, 0, 0.8745098, 1,
1.073785, -0.6457783, 4.546519, 1, 0, 0.8705882, 1,
1.078769, -0.1211697, -0.2191515, 1, 0, 0.8627451, 1,
1.084267, 0.4893456, 0.8200339, 1, 0, 0.8588235, 1,
1.084918, 1.167774, -0.8062991, 1, 0, 0.8509804, 1,
1.089369, 0.2965067, 1.170267, 1, 0, 0.8470588, 1,
1.097527, 0.3082023, 1.111671, 1, 0, 0.8392157, 1,
1.121466, 0.6906003, 0.8161488, 1, 0, 0.8352941, 1,
1.127916, 0.01592448, -0.03032972, 1, 0, 0.827451, 1,
1.13295, -0.9473209, 3.026213, 1, 0, 0.8235294, 1,
1.137242, -2.182401, 2.614367, 1, 0, 0.8156863, 1,
1.143664, 0.2432914, -0.3208562, 1, 0, 0.8117647, 1,
1.154592, -0.5454745, 0.09907864, 1, 0, 0.8039216, 1,
1.159948, 0.1643487, 0.9518321, 1, 0, 0.7960784, 1,
1.161339, 1.219073, 1.525682, 1, 0, 0.7921569, 1,
1.162932, 0.2243138, 3.109018, 1, 0, 0.7843137, 1,
1.167386, 0.08338646, 1.239743, 1, 0, 0.7803922, 1,
1.175402, 0.7865119, 0.1404738, 1, 0, 0.772549, 1,
1.175816, -1.032518, 0.8082481, 1, 0, 0.7686275, 1,
1.18275, 0.1732545, 1.443124, 1, 0, 0.7607843, 1,
1.186153, -0.963023, 3.90924, 1, 0, 0.7568628, 1,
1.190541, 0.2884842, 0.9679773, 1, 0, 0.7490196, 1,
1.20449, -1.011013, 0.4447033, 1, 0, 0.7450981, 1,
1.209803, 0.8233043, 0.8826798, 1, 0, 0.7372549, 1,
1.21813, -0.4786847, 2.808468, 1, 0, 0.7333333, 1,
1.218681, 0.2429841, 1.295183, 1, 0, 0.7254902, 1,
1.21893, 0.0840749, 2.454401, 1, 0, 0.7215686, 1,
1.22458, 0.6060776, 1.975764, 1, 0, 0.7137255, 1,
1.227609, -0.1698495, 2.524211, 1, 0, 0.7098039, 1,
1.235396, -0.4654163, 1.704162, 1, 0, 0.7019608, 1,
1.244072, -0.4350107, 1.75766, 1, 0, 0.6941177, 1,
1.244305, -0.1719541, 1.459884, 1, 0, 0.6901961, 1,
1.25436, 0.4119748, 1.589071, 1, 0, 0.682353, 1,
1.261922, -0.1268567, -0.2900534, 1, 0, 0.6784314, 1,
1.262916, 1.247133, 2.106957, 1, 0, 0.6705883, 1,
1.265667, 1.284759, 1.375704, 1, 0, 0.6666667, 1,
1.268323, -0.5467539, 2.504588, 1, 0, 0.6588235, 1,
1.27073, 0.6150983, 1.250613, 1, 0, 0.654902, 1,
1.272642, -1.455723, 4.674442, 1, 0, 0.6470588, 1,
1.27526, 0.2136883, 1.038268, 1, 0, 0.6431373, 1,
1.280086, -0.5785216, 2.014217, 1, 0, 0.6352941, 1,
1.296206, 0.3752776, 1.232751, 1, 0, 0.6313726, 1,
1.298649, -0.6035328, 1.888281, 1, 0, 0.6235294, 1,
1.304777, -0.6155947, -0.1159052, 1, 0, 0.6196079, 1,
1.307159, -0.2765054, 3.368281, 1, 0, 0.6117647, 1,
1.309046, -0.6678916, 0.6899664, 1, 0, 0.6078432, 1,
1.317227, -0.6200889, 3.167874, 1, 0, 0.6, 1,
1.324084, 0.2621885, 2.670604, 1, 0, 0.5921569, 1,
1.336419, -0.6246075, 1.215814, 1, 0, 0.5882353, 1,
1.33659, 1.013201, -0.2380314, 1, 0, 0.5803922, 1,
1.33715, -0.1757724, 2.457869, 1, 0, 0.5764706, 1,
1.338685, 1.219666, 1.203907, 1, 0, 0.5686275, 1,
1.340387, -0.8996686, 1.720894, 1, 0, 0.5647059, 1,
1.347076, 1.187318, 0.9372603, 1, 0, 0.5568628, 1,
1.347733, 0.7849381, -0.4104288, 1, 0, 0.5529412, 1,
1.34818, 0.2941571, 0.8929325, 1, 0, 0.5450981, 1,
1.348242, -0.1956734, -0.04273129, 1, 0, 0.5411765, 1,
1.365153, -0.6181491, 3.000085, 1, 0, 0.5333334, 1,
1.36632, -2.205328, 2.318604, 1, 0, 0.5294118, 1,
1.367042, -0.3493621, 2.205125, 1, 0, 0.5215687, 1,
1.367171, -0.4571057, 2.446372, 1, 0, 0.5176471, 1,
1.367934, 0.3707314, 0.5217732, 1, 0, 0.509804, 1,
1.370556, -1.656406, 3.299438, 1, 0, 0.5058824, 1,
1.372502, 0.3708453, 0.8300458, 1, 0, 0.4980392, 1,
1.378363, -0.3395241, 0.86071, 1, 0, 0.4901961, 1,
1.378958, 0.8050037, -0.07036955, 1, 0, 0.4862745, 1,
1.401214, 0.2169517, 2.360508, 1, 0, 0.4784314, 1,
1.406061, 0.5903247, 0.2799301, 1, 0, 0.4745098, 1,
1.4169, -0.6969302, 2.239679, 1, 0, 0.4666667, 1,
1.424574, -3.722144, 3.303599, 1, 0, 0.4627451, 1,
1.429983, 1.135249, 1.021047, 1, 0, 0.454902, 1,
1.442346, -0.4067957, 2.103305, 1, 0, 0.4509804, 1,
1.442738, -0.5369063, 0.8800673, 1, 0, 0.4431373, 1,
1.44633, -1.393911, 2.370664, 1, 0, 0.4392157, 1,
1.470663, 0.5027668, 2.482597, 1, 0, 0.4313726, 1,
1.475034, -0.7752068, 3.31791, 1, 0, 0.427451, 1,
1.476749, 1.319104, 1.634752, 1, 0, 0.4196078, 1,
1.495521, 0.6522902, 1.3969, 1, 0, 0.4156863, 1,
1.496046, -0.2445085, 1.905903, 1, 0, 0.4078431, 1,
1.49624, -0.5912231, 3.156062, 1, 0, 0.4039216, 1,
1.504942, 0.4004973, 3.386162, 1, 0, 0.3960784, 1,
1.507606, -0.2658472, 3.497302, 1, 0, 0.3882353, 1,
1.518645, -0.2435181, -0.1933757, 1, 0, 0.3843137, 1,
1.534205, -0.2686713, 0.8424516, 1, 0, 0.3764706, 1,
1.543209, 0.7273139, 1.141896, 1, 0, 0.372549, 1,
1.545725, -1.017098, 3.835078, 1, 0, 0.3647059, 1,
1.559522, 0.8787283, 1.3793, 1, 0, 0.3607843, 1,
1.565125, -0.05972916, 1.532074, 1, 0, 0.3529412, 1,
1.573516, -0.9321299, 2.36028, 1, 0, 0.3490196, 1,
1.573521, -0.8411254, 1.833122, 1, 0, 0.3411765, 1,
1.574804, 0.3420431, -0.5520462, 1, 0, 0.3372549, 1,
1.596599, 2.467145, 0.6642371, 1, 0, 0.3294118, 1,
1.602111, -0.07529013, 2.943258, 1, 0, 0.3254902, 1,
1.612858, 2.034202, 1.64303, 1, 0, 0.3176471, 1,
1.629773, 0.6217817, 1.956202, 1, 0, 0.3137255, 1,
1.634467, 0.9190192, 0.3358603, 1, 0, 0.3058824, 1,
1.639488, 0.3742195, 1.057853, 1, 0, 0.2980392, 1,
1.642772, 0.898124, 2.400762, 1, 0, 0.2941177, 1,
1.651064, 0.5564362, 0.8841857, 1, 0, 0.2862745, 1,
1.660248, -0.5933716, 1.604876, 1, 0, 0.282353, 1,
1.677512, 1.73514, 1.571464, 1, 0, 0.2745098, 1,
1.677582, -0.1393342, 0.002870975, 1, 0, 0.2705882, 1,
1.679506, 0.09155759, -0.1766468, 1, 0, 0.2627451, 1,
1.723602, -0.7251257, -0.05182094, 1, 0, 0.2588235, 1,
1.723718, 1.644813, 0.6845687, 1, 0, 0.2509804, 1,
1.726182, -1.711048, 0.8736131, 1, 0, 0.2470588, 1,
1.726946, -1.146963, 1.598274, 1, 0, 0.2392157, 1,
1.736275, -0.3142329, 2.428622, 1, 0, 0.2352941, 1,
1.740018, -1.929268, 4.195208, 1, 0, 0.227451, 1,
1.758371, -1.451742, 1.81119, 1, 0, 0.2235294, 1,
1.765168, 1.092719, 0.7241023, 1, 0, 0.2156863, 1,
1.78294, -1.67265, 0.968406, 1, 0, 0.2117647, 1,
1.78797, 1.196203, 2.601164, 1, 0, 0.2039216, 1,
1.788403, -0.9964379, 0.3840783, 1, 0, 0.1960784, 1,
1.81255, 0.4055794, 2.761608, 1, 0, 0.1921569, 1,
1.81919, 1.079475, 1.025387, 1, 0, 0.1843137, 1,
1.833977, -0.7836592, 2.937893, 1, 0, 0.1803922, 1,
1.837918, -0.5112395, 1.34085, 1, 0, 0.172549, 1,
1.851009, 1.812821, 0.5213891, 1, 0, 0.1686275, 1,
1.856689, 0.7044349, 1.823195, 1, 0, 0.1607843, 1,
1.86962, -0.2466297, 1.675344, 1, 0, 0.1568628, 1,
1.880802, -1.520916, 1.887797, 1, 0, 0.1490196, 1,
1.881046, 0.4971007, 1.974163, 1, 0, 0.145098, 1,
1.925409, 0.4916928, 2.14287, 1, 0, 0.1372549, 1,
1.932678, -0.04899367, 0.2280313, 1, 0, 0.1333333, 1,
1.969434, 2.509072, -0.1487781, 1, 0, 0.1254902, 1,
2.033467, -0.7432705, 2.909528, 1, 0, 0.1215686, 1,
2.063677, 0.3676943, 2.654188, 1, 0, 0.1137255, 1,
2.06389, -1.016971, 1.153281, 1, 0, 0.1098039, 1,
2.092703, 2.259874, -0.2052649, 1, 0, 0.1019608, 1,
2.150208, -0.4145373, 1.777475, 1, 0, 0.09411765, 1,
2.1769, -2.950124, 1.159297, 1, 0, 0.09019608, 1,
2.18044, 0.08969864, 2.186453, 1, 0, 0.08235294, 1,
2.197085, -0.9664509, 3.068299, 1, 0, 0.07843138, 1,
2.202566, 0.7068719, -0.1616802, 1, 0, 0.07058824, 1,
2.210876, 0.6913321, 1.073836, 1, 0, 0.06666667, 1,
2.287341, -0.1798697, -0.08441657, 1, 0, 0.05882353, 1,
2.418061, 0.6902937, 0.3331502, 1, 0, 0.05490196, 1,
2.436394, 0.8661528, 0.6489599, 1, 0, 0.04705882, 1,
2.436517, -0.3054469, 1.38745, 1, 0, 0.04313726, 1,
2.591954, -0.2061308, 3.042923, 1, 0, 0.03529412, 1,
2.593319, -0.4650713, 2.677326, 1, 0, 0.03137255, 1,
2.637423, 0.0042659, 0.2906789, 1, 0, 0.02352941, 1,
2.721163, -0.528429, 2.374998, 1, 0, 0.01960784, 1,
2.817715, -0.4183713, 2.976275, 1, 0, 0.01176471, 1,
2.937193, -1.028861, 1.807079, 1, 0, 0.007843138, 1
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
-0.1197885, -4.817233, -7.082264, 0, -0.5, 0.5, 0.5,
-0.1197885, -4.817233, -7.082264, 1, -0.5, 0.5, 0.5,
-0.1197885, -4.817233, -7.082264, 1, 1.5, 0.5, 0.5,
-0.1197885, -4.817233, -7.082264, 0, 1.5, 0.5, 0.5
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
-4.213087, -0.4917934, -7.082264, 0, -0.5, 0.5, 0.5,
-4.213087, -0.4917934, -7.082264, 1, -0.5, 0.5, 0.5,
-4.213087, -0.4917934, -7.082264, 1, 1.5, 0.5, 0.5,
-4.213087, -0.4917934, -7.082264, 0, 1.5, 0.5, 0.5
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
-4.213087, -4.817233, 0.0889914, 0, -0.5, 0.5, 0.5,
-4.213087, -4.817233, 0.0889914, 1, -0.5, 0.5, 0.5,
-4.213087, -4.817233, 0.0889914, 1, 1.5, 0.5, 0.5,
-4.213087, -4.817233, 0.0889914, 0, 1.5, 0.5, 0.5
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
-3, -3.819054, -5.427359,
2, -3.819054, -5.427359,
-3, -3.819054, -5.427359,
-3, -3.985417, -5.703176,
-2, -3.819054, -5.427359,
-2, -3.985417, -5.703176,
-1, -3.819054, -5.427359,
-1, -3.985417, -5.703176,
0, -3.819054, -5.427359,
0, -3.985417, -5.703176,
1, -3.819054, -5.427359,
1, -3.985417, -5.703176,
2, -3.819054, -5.427359,
2, -3.985417, -5.703176
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
-3, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
-3, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
-3, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
-3, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5,
-2, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
-2, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
-2, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
-2, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5,
-1, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
-1, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
-1, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
-1, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5,
0, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
0, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
0, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
0, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5,
1, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
1, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
1, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
1, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5,
2, -4.318143, -6.254811, 0, -0.5, 0.5, 0.5,
2, -4.318143, -6.254811, 1, -0.5, 0.5, 0.5,
2, -4.318143, -6.254811, 1, 1.5, 0.5, 0.5,
2, -4.318143, -6.254811, 0, 1.5, 0.5, 0.5
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
-3.268479, -3, -5.427359,
-3.268479, 2, -5.427359,
-3.268479, -3, -5.427359,
-3.425914, -3, -5.703176,
-3.268479, -2, -5.427359,
-3.425914, -2, -5.703176,
-3.268479, -1, -5.427359,
-3.425914, -1, -5.703176,
-3.268479, 0, -5.427359,
-3.425914, 0, -5.703176,
-3.268479, 1, -5.427359,
-3.425914, 1, -5.703176,
-3.268479, 2, -5.427359,
-3.425914, 2, -5.703176
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
-3.740783, -3, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, -3, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, -3, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, -3, -6.254811, 0, 1.5, 0.5, 0.5,
-3.740783, -2, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, -2, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, -2, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, -2, -6.254811, 0, 1.5, 0.5, 0.5,
-3.740783, -1, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, -1, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, -1, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, -1, -6.254811, 0, 1.5, 0.5, 0.5,
-3.740783, 0, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, 0, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, 0, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, 0, -6.254811, 0, 1.5, 0.5, 0.5,
-3.740783, 1, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, 1, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, 1, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, 1, -6.254811, 0, 1.5, 0.5, 0.5,
-3.740783, 2, -6.254811, 0, -0.5, 0.5, 0.5,
-3.740783, 2, -6.254811, 1, -0.5, 0.5, 0.5,
-3.740783, 2, -6.254811, 1, 1.5, 0.5, 0.5,
-3.740783, 2, -6.254811, 0, 1.5, 0.5, 0.5
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
-3.268479, -3.819054, -4,
-3.268479, -3.819054, 4,
-3.268479, -3.819054, -4,
-3.425914, -3.985417, -4,
-3.268479, -3.819054, -2,
-3.425914, -3.985417, -2,
-3.268479, -3.819054, 0,
-3.425914, -3.985417, 0,
-3.268479, -3.819054, 2,
-3.425914, -3.985417, 2,
-3.268479, -3.819054, 4,
-3.425914, -3.985417, 4
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
-3.740783, -4.318143, -4, 0, -0.5, 0.5, 0.5,
-3.740783, -4.318143, -4, 1, -0.5, 0.5, 0.5,
-3.740783, -4.318143, -4, 1, 1.5, 0.5, 0.5,
-3.740783, -4.318143, -4, 0, 1.5, 0.5, 0.5,
-3.740783, -4.318143, -2, 0, -0.5, 0.5, 0.5,
-3.740783, -4.318143, -2, 1, -0.5, 0.5, 0.5,
-3.740783, -4.318143, -2, 1, 1.5, 0.5, 0.5,
-3.740783, -4.318143, -2, 0, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 0, 0, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 0, 1, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 0, 1, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 0, 0, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 2, 0, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 2, 1, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 2, 1, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 2, 0, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 4, 0, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 4, 1, -0.5, 0.5, 0.5,
-3.740783, -4.318143, 4, 1, 1.5, 0.5, 0.5,
-3.740783, -4.318143, 4, 0, 1.5, 0.5, 0.5
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
-3.268479, -3.819054, -5.427359,
-3.268479, 2.835467, -5.427359,
-3.268479, -3.819054, 5.605341,
-3.268479, 2.835467, 5.605341,
-3.268479, -3.819054, -5.427359,
-3.268479, -3.819054, 5.605341,
-3.268479, 2.835467, -5.427359,
-3.268479, 2.835467, 5.605341,
-3.268479, -3.819054, -5.427359,
3.028902, -3.819054, -5.427359,
-3.268479, -3.819054, 5.605341,
3.028902, -3.819054, 5.605341,
-3.268479, 2.835467, -5.427359,
3.028902, 2.835467, -5.427359,
-3.268479, 2.835467, 5.605341,
3.028902, 2.835467, 5.605341,
3.028902, -3.819054, -5.427359,
3.028902, 2.835467, -5.427359,
3.028902, -3.819054, 5.605341,
3.028902, 2.835467, 5.605341,
3.028902, -3.819054, -5.427359,
3.028902, -3.819054, 5.605341,
3.028902, 2.835467, -5.427359,
3.028902, 2.835467, 5.605341
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
var radius = 7.657739;
var distance = 34.07014;
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
mvMatrix.translate( 0.1197885, 0.4917934, -0.0889914 );
mvMatrix.scale( 1.314784, 1.244221, 0.7504688 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07014);
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
Anilazine<-read.table("Anilazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Anilazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Anilazine' not found
```

```r
y<-Anilazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Anilazine' not found
```

```r
z<-Anilazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Anilazine' not found
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
-3.17677, -2.236794, -2.424325, 0, 0, 1, 1, 1,
-2.543386, 0.2150104, -2.163512, 1, 0, 0, 1, 1,
-2.405771, 1.749171, 1.499184, 1, 0, 0, 1, 1,
-2.38827, -1.495181, -1.716643, 1, 0, 0, 1, 1,
-2.340876, -0.1927005, -2.922627, 1, 0, 0, 1, 1,
-2.298195, -1.763279, -3.256135, 1, 0, 0, 1, 1,
-2.277485, 0.6561005, -0.1230994, 0, 0, 0, 1, 1,
-2.24243, -1.105679, -2.616896, 0, 0, 0, 1, 1,
-2.176255, -0.893645, -1.631497, 0, 0, 0, 1, 1,
-2.174351, -0.8633339, -1.599331, 0, 0, 0, 1, 1,
-2.150134, -0.2365469, -2.62015, 0, 0, 0, 1, 1,
-2.133643, -0.734581, -2.456768, 0, 0, 0, 1, 1,
-2.133557, -1.697931, -1.783018, 0, 0, 0, 1, 1,
-2.129476, -0.5887062, 0.06122295, 1, 1, 1, 1, 1,
-2.098238, 0.6850027, -2.961522, 1, 1, 1, 1, 1,
-2.078207, -1.118286, -4.250911, 1, 1, 1, 1, 1,
-2.071187, -0.5818344, -3.357669, 1, 1, 1, 1, 1,
-2.058585, 1.998347, -2.027481, 1, 1, 1, 1, 1,
-2.006963, -0.2628459, -3.406661, 1, 1, 1, 1, 1,
-1.976882, 0.2048205, -1.313943, 1, 1, 1, 1, 1,
-1.945589, 0.8531486, -0.05326419, 1, 1, 1, 1, 1,
-1.911417, 0.7322139, -1.919662, 1, 1, 1, 1, 1,
-1.829857, -1.083836, -1.644296, 1, 1, 1, 1, 1,
-1.810842, 1.869464, -0.9422295, 1, 1, 1, 1, 1,
-1.801231, 0.7677281, -1.025405, 1, 1, 1, 1, 1,
-1.79133, -0.0921462, -0.01792905, 1, 1, 1, 1, 1,
-1.788823, -0.7043318, -1.284011, 1, 1, 1, 1, 1,
-1.785602, 2.136613, 0.07507994, 1, 1, 1, 1, 1,
-1.784482, 0.2405898, -2.301266, 0, 0, 1, 1, 1,
-1.760005, -0.2316072, -2.439096, 1, 0, 0, 1, 1,
-1.756484, 0.7053849, -0.634178, 1, 0, 0, 1, 1,
-1.751442, -0.792718, -0.621169, 1, 0, 0, 1, 1,
-1.745432, 1.194581, -2.766674, 1, 0, 0, 1, 1,
-1.744898, 0.8908823, -2.223399, 1, 0, 0, 1, 1,
-1.743202, -0.5339542, -0.2470072, 0, 0, 0, 1, 1,
-1.723289, -1.190483, -1.674394, 0, 0, 0, 1, 1,
-1.722331, -1.288656, -2.256353, 0, 0, 0, 1, 1,
-1.720973, 1.720443, -0.02659749, 0, 0, 0, 1, 1,
-1.706678, -1.022988, -1.096367, 0, 0, 0, 1, 1,
-1.68586, -0.5664715, -0.6506878, 0, 0, 0, 1, 1,
-1.683233, -0.8059526, -2.50129, 0, 0, 0, 1, 1,
-1.670229, -2.192957, -3.134511, 1, 1, 1, 1, 1,
-1.670062, -1.331642, -2.025328, 1, 1, 1, 1, 1,
-1.668556, 0.3023841, -0.47494, 1, 1, 1, 1, 1,
-1.661688, 0.16155, -2.375021, 1, 1, 1, 1, 1,
-1.66096, -0.5982408, -0.5283933, 1, 1, 1, 1, 1,
-1.660166, -0.2360622, -1.027385, 1, 1, 1, 1, 1,
-1.650628, -0.8293496, -2.579751, 1, 1, 1, 1, 1,
-1.62617, -1.19012, -1.100355, 1, 1, 1, 1, 1,
-1.6228, 1.9128, -0.5436225, 1, 1, 1, 1, 1,
-1.614727, 0.5901967, 0.7062736, 1, 1, 1, 1, 1,
-1.611107, -0.6542063, -2.528863, 1, 1, 1, 1, 1,
-1.603634, 0.04731615, 0.04314663, 1, 1, 1, 1, 1,
-1.603344, -1.647689, -2.345341, 1, 1, 1, 1, 1,
-1.58649, -0.3700077, -2.500981, 1, 1, 1, 1, 1,
-1.578617, -1.130861, -1.264267, 1, 1, 1, 1, 1,
-1.574746, 0.5451732, -0.7210794, 0, 0, 1, 1, 1,
-1.547284, -0.7642283, -0.1705525, 1, 0, 0, 1, 1,
-1.537561, 0.9319959, -0.8511443, 1, 0, 0, 1, 1,
-1.524194, 0.09056655, -1.977526, 1, 0, 0, 1, 1,
-1.521606, -0.4001914, -2.971295, 1, 0, 0, 1, 1,
-1.503785, 1.350545, -1.315437, 1, 0, 0, 1, 1,
-1.491184, 2.25555, -1.62407, 0, 0, 0, 1, 1,
-1.488588, -1.14743, -2.221475, 0, 0, 0, 1, 1,
-1.478805, -0.8118984, -2.871142, 0, 0, 0, 1, 1,
-1.478434, -1.146438, -1.755385, 0, 0, 0, 1, 1,
-1.476071, 0.5745, -0.7959279, 0, 0, 0, 1, 1,
-1.474996, -0.4888795, -2.866649, 0, 0, 0, 1, 1,
-1.469893, 0.929998, -1.515544, 0, 0, 0, 1, 1,
-1.46265, 0.6158093, -1.109941, 1, 1, 1, 1, 1,
-1.453328, -1.950928, -3.615093, 1, 1, 1, 1, 1,
-1.428454, 0.3304136, -2.268465, 1, 1, 1, 1, 1,
-1.426929, -0.7102421, -4.181877, 1, 1, 1, 1, 1,
-1.423925, -2.326999, -2.849519, 1, 1, 1, 1, 1,
-1.419849, 0.3663505, -1.105709, 1, 1, 1, 1, 1,
-1.415537, -0.862839, -1.226956, 1, 1, 1, 1, 1,
-1.401877, -1.153815, -2.120713, 1, 1, 1, 1, 1,
-1.397522, 0.6703439, -0.8066289, 1, 1, 1, 1, 1,
-1.390457, 1.365363, -1.233244, 1, 1, 1, 1, 1,
-1.385805, -0.5586867, -3.173942, 1, 1, 1, 1, 1,
-1.380584, 0.9828182, 0.03581695, 1, 1, 1, 1, 1,
-1.376227, 1.290154, 0.6363012, 1, 1, 1, 1, 1,
-1.372909, 1.264686, -0.9561648, 1, 1, 1, 1, 1,
-1.371877, 1.143637, -1.705961, 1, 1, 1, 1, 1,
-1.370089, 0.5369505, -2.496277, 0, 0, 1, 1, 1,
-1.369844, -0.43683, -0.8956975, 1, 0, 0, 1, 1,
-1.368005, -1.146291, -1.662804, 1, 0, 0, 1, 1,
-1.360588, 1.300554, -0.6263769, 1, 0, 0, 1, 1,
-1.359873, -0.3705554, -0.1344743, 1, 0, 0, 1, 1,
-1.352793, -1.674682, -0.1040146, 1, 0, 0, 1, 1,
-1.343725, -0.3780832, 0.2955967, 0, 0, 0, 1, 1,
-1.331899, 0.9211524, -0.5605091, 0, 0, 0, 1, 1,
-1.325197, 0.1256117, -1.785549, 0, 0, 0, 1, 1,
-1.315583, -0.3224252, 0.5943574, 0, 0, 0, 1, 1,
-1.312773, -0.9653909, -3.323101, 0, 0, 0, 1, 1,
-1.308636, 0.3545577, -2.152081, 0, 0, 0, 1, 1,
-1.287371, 1.461963, 1.519389, 0, 0, 0, 1, 1,
-1.286392, -1.59135, -4.003467, 1, 1, 1, 1, 1,
-1.27625, 0.1468263, -2.050287, 1, 1, 1, 1, 1,
-1.273824, 1.64694, -1.918698, 1, 1, 1, 1, 1,
-1.266592, 0.6309247, -1.893406, 1, 1, 1, 1, 1,
-1.264146, -0.3007917, -3.260327, 1, 1, 1, 1, 1,
-1.258833, 0.5731292, -0.8424819, 1, 1, 1, 1, 1,
-1.251322, 0.6285391, -1.229795, 1, 1, 1, 1, 1,
-1.248325, -0.2795866, -3.425572, 1, 1, 1, 1, 1,
-1.244358, 0.7502602, -1.852848, 1, 1, 1, 1, 1,
-1.235233, -0.7771825, -3.739239, 1, 1, 1, 1, 1,
-1.226822, 0.09267183, -2.052233, 1, 1, 1, 1, 1,
-1.221439, -1.607381, -2.392177, 1, 1, 1, 1, 1,
-1.217504, 1.671765, -1.809806, 1, 1, 1, 1, 1,
-1.214164, -0.2923476, -3.551613, 1, 1, 1, 1, 1,
-1.211353, 0.6883552, -0.35329, 1, 1, 1, 1, 1,
-1.195986, -0.08394174, 0.5171523, 0, 0, 1, 1, 1,
-1.194562, -0.9519928, -2.866875, 1, 0, 0, 1, 1,
-1.188128, -0.2385194, -2.618748, 1, 0, 0, 1, 1,
-1.182964, -0.718631, -1.546711, 1, 0, 0, 1, 1,
-1.162148, 1.734265, -2.245268, 1, 0, 0, 1, 1,
-1.159315, -0.322929, -1.66388, 1, 0, 0, 1, 1,
-1.157852, 0.2080154, -2.268823, 0, 0, 0, 1, 1,
-1.157426, -2.264074, -2.772936, 0, 0, 0, 1, 1,
-1.154053, -1.57155, -3.382511, 0, 0, 0, 1, 1,
-1.148393, 0.1367141, -1.358371, 0, 0, 0, 1, 1,
-1.145413, 0.9176239, 0.09308928, 0, 0, 0, 1, 1,
-1.137603, 1.049646, 0.2030793, 0, 0, 0, 1, 1,
-1.128252, -0.5893191, -4.198482, 0, 0, 0, 1, 1,
-1.1267, 0.9226226, -1.287316, 1, 1, 1, 1, 1,
-1.122538, -0.4339281, -2.608328, 1, 1, 1, 1, 1,
-1.103167, 0.571905, -1.268654, 1, 1, 1, 1, 1,
-1.095742, 0.4134232, -1.240749, 1, 1, 1, 1, 1,
-1.092613, -0.181377, -1.282248, 1, 1, 1, 1, 1,
-1.092376, 1.021042, -0.482389, 1, 1, 1, 1, 1,
-1.09234, -0.8047188, -3.602572, 1, 1, 1, 1, 1,
-1.087583, 0.6706647, -1.183292, 1, 1, 1, 1, 1,
-1.065988, 0.914592, -0.6550134, 1, 1, 1, 1, 1,
-1.065949, 1.502525, -2.220245, 1, 1, 1, 1, 1,
-1.065101, -0.07826574, -1.343083, 1, 1, 1, 1, 1,
-1.061772, -1.242748, -2.454227, 1, 1, 1, 1, 1,
-1.05655, 1.919811, -0.7712863, 1, 1, 1, 1, 1,
-1.054978, -2.729739, -1.630412, 1, 1, 1, 1, 1,
-1.048923, 0.195839, -1.101869, 1, 1, 1, 1, 1,
-1.043543, 1.456784, -2.830816, 0, 0, 1, 1, 1,
-1.040241, -1.268829, -1.985458, 1, 0, 0, 1, 1,
-1.038227, 0.9914609, -1.307157, 1, 0, 0, 1, 1,
-1.036193, -0.7516798, -1.135662, 1, 0, 0, 1, 1,
-1.025017, -1.010533, -2.6042, 1, 0, 0, 1, 1,
-1.021727, -0.7529382, -2.201567, 1, 0, 0, 1, 1,
-1.021495, 2.011866, 0.2093753, 0, 0, 0, 1, 1,
-0.998274, -0.5024113, -1.825304, 0, 0, 0, 1, 1,
-0.9931077, -0.07600062, -1.146845, 0, 0, 0, 1, 1,
-0.9921097, -1.098433, -1.488259, 0, 0, 0, 1, 1,
-0.9814806, 1.627448, -1.324272, 0, 0, 0, 1, 1,
-0.9805433, 0.2975052, 0.3801495, 0, 0, 0, 1, 1,
-0.9731521, -0.006991281, -0.4167689, 0, 0, 0, 1, 1,
-0.9729807, -1.008949, -2.603492, 1, 1, 1, 1, 1,
-0.967673, -0.008377551, -0.8634346, 1, 1, 1, 1, 1,
-0.9595399, 0.3460008, 0.02859669, 1, 1, 1, 1, 1,
-0.9462379, -0.577033, -4.127949, 1, 1, 1, 1, 1,
-0.9438077, -0.02407175, -2.721655, 1, 1, 1, 1, 1,
-0.9404998, 0.6755645, -0.9940897, 1, 1, 1, 1, 1,
-0.9385986, -0.9837203, -1.204479, 1, 1, 1, 1, 1,
-0.9280508, -0.7426705, -1.543586, 1, 1, 1, 1, 1,
-0.9280268, -0.8490534, -2.815369, 1, 1, 1, 1, 1,
-0.926959, -1.050551, -3.939109, 1, 1, 1, 1, 1,
-0.9256983, -0.8558599, -2.591194, 1, 1, 1, 1, 1,
-0.924934, -1.419601, -3.428959, 1, 1, 1, 1, 1,
-0.9210171, 1.032214, -0.6862341, 1, 1, 1, 1, 1,
-0.9202485, -2.293832, -2.918478, 1, 1, 1, 1, 1,
-0.9176083, 0.9609381, -0.08479827, 1, 1, 1, 1, 1,
-0.9166022, 0.0777007, -1.797741, 0, 0, 1, 1, 1,
-0.9137925, -0.5289031, -3.156108, 1, 0, 0, 1, 1,
-0.9097473, 0.06626775, -1.513139, 1, 0, 0, 1, 1,
-0.901283, -2.311175, -2.310117, 1, 0, 0, 1, 1,
-0.8995289, -1.141902, -2.358959, 1, 0, 0, 1, 1,
-0.8987184, -0.6663541, -2.026124, 1, 0, 0, 1, 1,
-0.8914054, 0.1522201, -1.516691, 0, 0, 0, 1, 1,
-0.8733442, -0.5746635, -1.938537, 0, 0, 0, 1, 1,
-0.8715208, -0.3166063, -1.293996, 0, 0, 0, 1, 1,
-0.868478, -1.561855, -0.7139678, 0, 0, 0, 1, 1,
-0.8681691, 0.002005234, -0.4020636, 0, 0, 0, 1, 1,
-0.8631703, -0.2402654, -3.17737, 0, 0, 0, 1, 1,
-0.8617628, -1.183064, -2.435916, 0, 0, 0, 1, 1,
-0.8530412, -0.783509, -2.372569, 1, 1, 1, 1, 1,
-0.8452892, 0.8763589, 0.42888, 1, 1, 1, 1, 1,
-0.8346089, 0.4511647, -1.18701, 1, 1, 1, 1, 1,
-0.8284798, -0.5968879, -1.942873, 1, 1, 1, 1, 1,
-0.8251843, 0.4302243, -0.5807548, 1, 1, 1, 1, 1,
-0.8247778, -1.660451, -2.936419, 1, 1, 1, 1, 1,
-0.8233998, -0.4530186, -3.822279, 1, 1, 1, 1, 1,
-0.819233, -0.4254286, -1.906103, 1, 1, 1, 1, 1,
-0.8190707, -0.2679579, -1.686923, 1, 1, 1, 1, 1,
-0.8094372, -2.405149, -2.203583, 1, 1, 1, 1, 1,
-0.8065383, -0.3411109, -3.357204, 1, 1, 1, 1, 1,
-0.8031583, 0.1247192, 0.6425065, 1, 1, 1, 1, 1,
-0.8002189, -1.323106, -1.744107, 1, 1, 1, 1, 1,
-0.7963785, 0.06609123, -1.964672, 1, 1, 1, 1, 1,
-0.7925469, -0.6966504, -3.888846, 1, 1, 1, 1, 1,
-0.7817721, 0.4376873, 0.1021838, 0, 0, 1, 1, 1,
-0.771687, 0.9755027, 0.662411, 1, 0, 0, 1, 1,
-0.7675837, 0.3988361, -2.023577, 1, 0, 0, 1, 1,
-0.7643187, 0.5855169, 0.3917668, 1, 0, 0, 1, 1,
-0.7543977, -0.7977697, -3.177547, 1, 0, 0, 1, 1,
-0.7524813, -1.889996, -2.927379, 1, 0, 0, 1, 1,
-0.7506399, -0.6142373, -1.409161, 0, 0, 0, 1, 1,
-0.7476578, -0.2242484, -1.585467, 0, 0, 0, 1, 1,
-0.7432487, 0.6923447, -0.3490777, 0, 0, 0, 1, 1,
-0.7401209, 1.223251, 1.208961, 0, 0, 0, 1, 1,
-0.7365426, -1.879163, -2.870323, 0, 0, 0, 1, 1,
-0.7361611, -1.819718, -3.739025, 0, 0, 0, 1, 1,
-0.7326042, -0.4609247, -2.435984, 0, 0, 0, 1, 1,
-0.7298452, -0.6786425, -3.136806, 1, 1, 1, 1, 1,
-0.7292337, 0.07954089, -1.960472, 1, 1, 1, 1, 1,
-0.7254543, 0.1308169, -1.68184, 1, 1, 1, 1, 1,
-0.7159022, -0.9439926, -0.3553047, 1, 1, 1, 1, 1,
-0.7108906, -0.9713133, -3.019806, 1, 1, 1, 1, 1,
-0.7038791, 0.2040959, -2.226022, 1, 1, 1, 1, 1,
-0.7012874, -0.6795623, -1.965091, 1, 1, 1, 1, 1,
-0.6979105, -0.2387466, 0.2661264, 1, 1, 1, 1, 1,
-0.690651, -1.442894, -3.499622, 1, 1, 1, 1, 1,
-0.6886764, -0.6760521, -2.034194, 1, 1, 1, 1, 1,
-0.6872957, -1.254717, -0.9274989, 1, 1, 1, 1, 1,
-0.684014, -0.4515082, -2.489133, 1, 1, 1, 1, 1,
-0.6831397, -0.1555971, -1.019475, 1, 1, 1, 1, 1,
-0.6805528, -0.5107328, -2.563877, 1, 1, 1, 1, 1,
-0.6792352, -0.7149508, -2.840577, 1, 1, 1, 1, 1,
-0.6747881, 0.4037939, -0.2618823, 0, 0, 1, 1, 1,
-0.6716305, 0.2426079, -1.975064, 1, 0, 0, 1, 1,
-0.668278, -0.8860435, -3.582508, 1, 0, 0, 1, 1,
-0.6664985, 1.052146, 0.3801988, 1, 0, 0, 1, 1,
-0.6647016, -0.5295406, -2.986461, 1, 0, 0, 1, 1,
-0.6582175, 0.4114872, -0.7598345, 1, 0, 0, 1, 1,
-0.6444116, 0.8523673, -1.386933, 0, 0, 0, 1, 1,
-0.6432318, 0.9317989, -0.8276312, 0, 0, 0, 1, 1,
-0.6403998, -0.5995968, -1.811129, 0, 0, 0, 1, 1,
-0.6402578, -0.9000855, -5.159052, 0, 0, 0, 1, 1,
-0.6352908, -0.2544748, -1.515461, 0, 0, 0, 1, 1,
-0.6333072, 0.1477148, 0.1773795, 0, 0, 0, 1, 1,
-0.631496, -0.4670395, -2.713714, 0, 0, 0, 1, 1,
-0.6290742, 1.444368, -1.012311, 1, 1, 1, 1, 1,
-0.6273249, 0.8045269, -1.874737, 1, 1, 1, 1, 1,
-0.6169272, -0.4434806, -3.530966, 1, 1, 1, 1, 1,
-0.6165196, -0.7531921, -3.241658, 1, 1, 1, 1, 1,
-0.6154519, -0.4930764, -3.517477, 1, 1, 1, 1, 1,
-0.6119371, 0.8303972, -0.08621596, 1, 1, 1, 1, 1,
-0.6100968, -0.5867916, -0.5212379, 1, 1, 1, 1, 1,
-0.608879, -1.187915, -2.400191, 1, 1, 1, 1, 1,
-0.6059842, -1.704046, -0.5023713, 1, 1, 1, 1, 1,
-0.6053103, 0.6241008, -0.7152844, 1, 1, 1, 1, 1,
-0.6013892, -1.010044, -2.815726, 1, 1, 1, 1, 1,
-0.6004385, 0.1508597, -1.670365, 1, 1, 1, 1, 1,
-0.5967146, -0.2590433, -2.985575, 1, 1, 1, 1, 1,
-0.5958892, 0.9002354, -1.406828, 1, 1, 1, 1, 1,
-0.5956838, -0.559957, -1.904254, 1, 1, 1, 1, 1,
-0.5934761, -1.22217, -2.537719, 0, 0, 1, 1, 1,
-0.5927054, 0.2771753, -2.134876, 1, 0, 0, 1, 1,
-0.5910591, -0.1465018, -2.154052, 1, 0, 0, 1, 1,
-0.5901367, 1.603591, -0.2002074, 1, 0, 0, 1, 1,
-0.5882732, 1.311289, 0.1388533, 1, 0, 0, 1, 1,
-0.5861969, -1.742562, -2.430338, 1, 0, 0, 1, 1,
-0.57954, -0.5057442, -1.910029, 0, 0, 0, 1, 1,
-0.5788628, 0.6930789, -2.217875, 0, 0, 0, 1, 1,
-0.5775274, 0.5491311, 0.159602, 0, 0, 0, 1, 1,
-0.5773845, -0.1421708, 0.08336061, 0, 0, 0, 1, 1,
-0.5756988, -0.3393973, -1.382187, 0, 0, 0, 1, 1,
-0.5755436, -0.1772685, -4.530796, 0, 0, 0, 1, 1,
-0.5733306, -2.02487, -3.530509, 0, 0, 0, 1, 1,
-0.5731739, -0.1457325, -2.240924, 1, 1, 1, 1, 1,
-0.5725797, 1.488681, 1.329062, 1, 1, 1, 1, 1,
-0.5688758, -0.351525, -2.304374, 1, 1, 1, 1, 1,
-0.56591, 1.132591, -1.514423, 1, 1, 1, 1, 1,
-0.5626726, -1.292055, -1.604873, 1, 1, 1, 1, 1,
-0.5621458, 0.05625223, 0.5143202, 1, 1, 1, 1, 1,
-0.5562913, 1.489919, 0.2589006, 1, 1, 1, 1, 1,
-0.5558369, 0.7155294, 0.3199617, 1, 1, 1, 1, 1,
-0.5483111, 0.620271, 0.2793351, 1, 1, 1, 1, 1,
-0.5482543, 0.03658362, -0.7316976, 1, 1, 1, 1, 1,
-0.5469138, 2.218745, 0.630338, 1, 1, 1, 1, 1,
-0.5434558, 2.228804, -1.361258, 1, 1, 1, 1, 1,
-0.537405, -0.5543658, -3.530832, 1, 1, 1, 1, 1,
-0.534067, 0.184757, -2.304398, 1, 1, 1, 1, 1,
-0.5297387, 0.05171539, -2.618425, 1, 1, 1, 1, 1,
-0.5267643, 0.7382405, 0.3419206, 0, 0, 1, 1, 1,
-0.5213217, -0.8100817, -3.02169, 1, 0, 0, 1, 1,
-0.5201208, -0.01989044, -1.944818, 1, 0, 0, 1, 1,
-0.5132346, -2.295061, -1.6436, 1, 0, 0, 1, 1,
-0.5104019, 0.3017834, -0.807411, 1, 0, 0, 1, 1,
-0.5011235, -0.2286442, -1.863158, 1, 0, 0, 1, 1,
-0.4988092, 1.537581, 0.800344, 0, 0, 0, 1, 1,
-0.4954487, 0.8200601, -3.268676, 0, 0, 0, 1, 1,
-0.4947252, 0.6941371, -0.5810525, 0, 0, 0, 1, 1,
-0.492625, -0.2762837, -3.707816, 0, 0, 0, 1, 1,
-0.4875493, 0.002435417, -1.273293, 0, 0, 0, 1, 1,
-0.4873915, 1.48947, 0.934131, 0, 0, 0, 1, 1,
-0.4851377, -1.539213, -3.442564, 0, 0, 0, 1, 1,
-0.4845235, -0.8029786, -1.410951, 1, 1, 1, 1, 1,
-0.4839246, 0.5159143, -2.064104, 1, 1, 1, 1, 1,
-0.4826535, -0.564971, -1.445546, 1, 1, 1, 1, 1,
-0.47913, 0.2665227, -1.424634, 1, 1, 1, 1, 1,
-0.4788104, -0.375832, -2.554532, 1, 1, 1, 1, 1,
-0.4740572, -1.291997, -3.813655, 1, 1, 1, 1, 1,
-0.4739636, 0.2385356, -1.858547, 1, 1, 1, 1, 1,
-0.4702175, -1.321441, -3.475847, 1, 1, 1, 1, 1,
-0.4659298, -1.116663, -2.575036, 1, 1, 1, 1, 1,
-0.4639695, 0.6521118, -0.4718945, 1, 1, 1, 1, 1,
-0.4637761, -0.9178449, -2.955131, 1, 1, 1, 1, 1,
-0.4634432, 0.9038801, -0.3323343, 1, 1, 1, 1, 1,
-0.4575232, 0.717355, 1.091358, 1, 1, 1, 1, 1,
-0.4546645, 1.176893, -1.492191, 1, 1, 1, 1, 1,
-0.4535471, -0.3291287, -2.918647, 1, 1, 1, 1, 1,
-0.4534369, 0.4019442, 0.2406683, 0, 0, 1, 1, 1,
-0.4527002, 0.6333944, -0.06612192, 1, 0, 0, 1, 1,
-0.4515671, 1.241114, -1.04867, 1, 0, 0, 1, 1,
-0.4510176, -0.1436369, -2.101629, 1, 0, 0, 1, 1,
-0.4496232, 0.07051653, -3.362699, 1, 0, 0, 1, 1,
-0.449573, 0.2414079, 0.5582989, 1, 0, 0, 1, 1,
-0.4473638, 0.137753, -1.370921, 0, 0, 0, 1, 1,
-0.445089, -0.5842592, -1.257751, 0, 0, 0, 1, 1,
-0.442295, -0.8610226, -1.571094, 0, 0, 0, 1, 1,
-0.4414814, 2.256852, -0.5498207, 0, 0, 0, 1, 1,
-0.4414267, -0.9962199, -4.966638, 0, 0, 0, 1, 1,
-0.4413626, 0.9598511, -1.444552, 0, 0, 0, 1, 1,
-0.4376029, 0.05111218, -0.7789423, 0, 0, 0, 1, 1,
-0.4298576, -0.5140878, -3.53866, 1, 1, 1, 1, 1,
-0.4278453, -1.272385, -0.3687379, 1, 1, 1, 1, 1,
-0.4228458, 2.153317, -1.47816, 1, 1, 1, 1, 1,
-0.4202192, 0.966581, -0.3920111, 1, 1, 1, 1, 1,
-0.4185184, 0.05570153, 0.2520038, 1, 1, 1, 1, 1,
-0.4163969, -0.3868034, -1.326361, 1, 1, 1, 1, 1,
-0.4154863, 0.6341155, -0.2099458, 1, 1, 1, 1, 1,
-0.4149325, 0.3135324, 0.1684331, 1, 1, 1, 1, 1,
-0.4070731, 0.3582741, -0.2090093, 1, 1, 1, 1, 1,
-0.4052188, 0.7657861, -0.3767562, 1, 1, 1, 1, 1,
-0.4011507, 0.686121, 0.8196048, 1, 1, 1, 1, 1,
-0.3947343, -0.4750088, -2.477552, 1, 1, 1, 1, 1,
-0.3915652, -0.3551053, -2.02231, 1, 1, 1, 1, 1,
-0.3895399, -1.434011, -5.266688, 1, 1, 1, 1, 1,
-0.388487, 0.7181035, -1.446463, 1, 1, 1, 1, 1,
-0.3884464, 0.9762141, 1.344179, 0, 0, 1, 1, 1,
-0.3884045, 1.205789, 1.292604, 1, 0, 0, 1, 1,
-0.3877956, 0.624003, -2.901581, 1, 0, 0, 1, 1,
-0.381493, -0.8407256, -1.559163, 1, 0, 0, 1, 1,
-0.380142, 1.492141, -0.7065614, 1, 0, 0, 1, 1,
-0.376323, -0.4889466, -1.873704, 1, 0, 0, 1, 1,
-0.3751098, -1.303841, -3.619686, 0, 0, 0, 1, 1,
-0.3736981, -0.4224767, -1.229759, 0, 0, 0, 1, 1,
-0.3712448, -0.8795067, -1.907968, 0, 0, 0, 1, 1,
-0.363127, 0.5381401, -0.07255307, 0, 0, 0, 1, 1,
-0.3617701, 1.283087, 1.081399, 0, 0, 0, 1, 1,
-0.3573083, 1.719203, 0.3701312, 0, 0, 0, 1, 1,
-0.3572745, -0.4022106, -3.647232, 0, 0, 0, 1, 1,
-0.3563353, -0.4345011, -0.877956, 1, 1, 1, 1, 1,
-0.3516493, -0.08804669, -1.03841, 1, 1, 1, 1, 1,
-0.3478065, 0.09867672, -0.8638741, 1, 1, 1, 1, 1,
-0.3362457, 0.9459032, -1.149212, 1, 1, 1, 1, 1,
-0.3340995, -0.4158218, -3.557381, 1, 1, 1, 1, 1,
-0.3333163, -0.3923112, -2.875975, 1, 1, 1, 1, 1,
-0.3311916, 0.874886, -0.4780473, 1, 1, 1, 1, 1,
-0.328972, -1.810602, -0.9838338, 1, 1, 1, 1, 1,
-0.3278438, -1.363555, -2.439338, 1, 1, 1, 1, 1,
-0.3242548, 1.002074, -0.3337774, 1, 1, 1, 1, 1,
-0.3217803, 0.552704, -0.06492225, 1, 1, 1, 1, 1,
-0.3207193, -0.04863185, -1.263837, 1, 1, 1, 1, 1,
-0.3194062, 0.1283855, -0.6219882, 1, 1, 1, 1, 1,
-0.3180199, 0.490668, 0.6958116, 1, 1, 1, 1, 1,
-0.3142671, 0.1498434, 0.4410887, 1, 1, 1, 1, 1,
-0.3099979, -0.03507882, -2.160781, 0, 0, 1, 1, 1,
-0.3084092, -0.5318673, -2.193475, 1, 0, 0, 1, 1,
-0.3082026, -0.8971127, -1.937407, 1, 0, 0, 1, 1,
-0.3052775, -0.05810267, -0.3815332, 1, 0, 0, 1, 1,
-0.2998089, -0.002307893, -2.074254, 1, 0, 0, 1, 1,
-0.2944423, -1.845536, -4.004846, 1, 0, 0, 1, 1,
-0.2940007, -0.7209583, -3.03373, 0, 0, 0, 1, 1,
-0.2931962, -0.9542674, -1.996069, 0, 0, 0, 1, 1,
-0.284825, 1.014615, 1.005214, 0, 0, 0, 1, 1,
-0.2777294, 0.6604133, -0.9488077, 0, 0, 0, 1, 1,
-0.2750255, 0.663329, 0.8884673, 0, 0, 0, 1, 1,
-0.2750136, 0.6962891, 0.9022444, 0, 0, 0, 1, 1,
-0.2726055, 1.52567, -1.271226, 0, 0, 0, 1, 1,
-0.2722478, 0.3392161, 0.4250799, 1, 1, 1, 1, 1,
-0.2689024, -0.2751816, -1.856939, 1, 1, 1, 1, 1,
-0.2683591, 0.3359905, -1.759204, 1, 1, 1, 1, 1,
-0.267529, -0.3982145, -3.288927, 1, 1, 1, 1, 1,
-0.2641689, 0.8622463, -0.1961204, 1, 1, 1, 1, 1,
-0.263851, 0.2809471, -2.947116, 1, 1, 1, 1, 1,
-0.2628442, 0.07348561, -2.257133, 1, 1, 1, 1, 1,
-0.2604192, 0.7662645, 0.004027181, 1, 1, 1, 1, 1,
-0.2598941, 0.02403025, -2.484361, 1, 1, 1, 1, 1,
-0.2517167, -0.7758552, -1.989177, 1, 1, 1, 1, 1,
-0.2481719, 0.0185015, -2.687673, 1, 1, 1, 1, 1,
-0.2476897, -0.1350898, -5.035225, 1, 1, 1, 1, 1,
-0.2471662, 0.1183522, -0.2269142, 1, 1, 1, 1, 1,
-0.2399148, -0.3933115, -2.094212, 1, 1, 1, 1, 1,
-0.2379994, 0.4199163, -0.648445, 1, 1, 1, 1, 1,
-0.2350706, -0.1930267, -1.884156, 0, 0, 1, 1, 1,
-0.233098, 0.04173376, -1.640072, 1, 0, 0, 1, 1,
-0.2319047, -2.803194, -4.124838, 1, 0, 0, 1, 1,
-0.2293169, 0.5866573, -1.866292, 1, 0, 0, 1, 1,
-0.2290747, -0.5365477, -2.995031, 1, 0, 0, 1, 1,
-0.2253971, 1.587716, -2.109627, 1, 0, 0, 1, 1,
-0.2201621, -0.4825225, -3.756361, 0, 0, 0, 1, 1,
-0.2200656, -0.7051377, -2.189788, 0, 0, 0, 1, 1,
-0.2185402, 1.048322, 0.003582412, 0, 0, 0, 1, 1,
-0.2171054, -0.8938465, -2.197318, 0, 0, 0, 1, 1,
-0.2144314, 1.18959, -2.105438, 0, 0, 0, 1, 1,
-0.2112757, -1.025404, -1.845138, 0, 0, 0, 1, 1,
-0.2068129, -0.7007011, -2.702455, 0, 0, 0, 1, 1,
-0.2043752, 0.4656289, -0.4919143, 1, 1, 1, 1, 1,
-0.2040984, -0.7487164, -2.484855, 1, 1, 1, 1, 1,
-0.2026755, -1.628016, -1.658978, 1, 1, 1, 1, 1,
-0.2023947, -0.8989149, -3.813133, 1, 1, 1, 1, 1,
-0.2012033, -0.0205979, -0.1791038, 1, 1, 1, 1, 1,
-0.1995167, 0.2751912, 1.604389, 1, 1, 1, 1, 1,
-0.1965133, 0.1582194, -2.193138, 1, 1, 1, 1, 1,
-0.1957316, 0.3903296, 1.11286, 1, 1, 1, 1, 1,
-0.1924874, 1.033845, 0.9501271, 1, 1, 1, 1, 1,
-0.1891559, 0.3103247, 0.3022159, 1, 1, 1, 1, 1,
-0.1877095, 0.6917838, -1.170956, 1, 1, 1, 1, 1,
-0.1865153, -0.6448928, -3.027178, 1, 1, 1, 1, 1,
-0.1828165, -1.099997, -2.950208, 1, 1, 1, 1, 1,
-0.1812552, -0.8915241, -3.251908, 1, 1, 1, 1, 1,
-0.1770612, -1.149976, -2.230567, 1, 1, 1, 1, 1,
-0.1762077, -0.9591728, -2.580746, 0, 0, 1, 1, 1,
-0.1758058, 1.228067, 0.33798, 1, 0, 0, 1, 1,
-0.1755757, 0.8359905, 0.4109905, 1, 0, 0, 1, 1,
-0.1755046, 0.6066097, 0.9669209, 1, 0, 0, 1, 1,
-0.1694937, -0.4592, -3.707864, 1, 0, 0, 1, 1,
-0.1689864, 0.5890076, -0.7413251, 1, 0, 0, 1, 1,
-0.1661026, -0.9630902, -3.288657, 0, 0, 0, 1, 1,
-0.1658292, 0.1961287, 1.040877, 0, 0, 0, 1, 1,
-0.1575093, -0.09114577, -2.036196, 0, 0, 0, 1, 1,
-0.155101, -1.260524, -4.10726, 0, 0, 0, 1, 1,
-0.153103, -0.2078083, -3.810753, 0, 0, 0, 1, 1,
-0.1513568, 0.4631648, -0.7017713, 0, 0, 0, 1, 1,
-0.150362, -0.4009466, -4.221997, 0, 0, 0, 1, 1,
-0.1497782, 0.2433381, -1.782154, 1, 1, 1, 1, 1,
-0.1487326, 0.518828, -0.4943283, 1, 1, 1, 1, 1,
-0.1483005, -0.5718309, -2.870183, 1, 1, 1, 1, 1,
-0.1482323, -0.020532, -2.135216, 1, 1, 1, 1, 1,
-0.1474374, -1.119101, -2.16509, 1, 1, 1, 1, 1,
-0.1451152, -0.09214663, -0.8400843, 1, 1, 1, 1, 1,
-0.1434205, -1.293149, -1.035392, 1, 1, 1, 1, 1,
-0.1403862, -0.1312633, -3.410564, 1, 1, 1, 1, 1,
-0.1371055, 0.3164142, -1.263812, 1, 1, 1, 1, 1,
-0.1368434, -0.1147502, -2.256009, 1, 1, 1, 1, 1,
-0.1366504, 0.5864925, -0.8756341, 1, 1, 1, 1, 1,
-0.1365477, 0.8880099, -0.1686693, 1, 1, 1, 1, 1,
-0.1326528, 0.8371426, 2.433429, 1, 1, 1, 1, 1,
-0.1309021, -0.6148267, -3.343116, 1, 1, 1, 1, 1,
-0.1238646, 0.7789955, 0.1111506, 1, 1, 1, 1, 1,
-0.1179564, 0.3581074, -1.029441, 0, 0, 1, 1, 1,
-0.1081216, -0.6212701, -3.331119, 1, 0, 0, 1, 1,
-0.1069881, -0.2746888, -2.353867, 1, 0, 0, 1, 1,
-0.1050314, 1.029842, -0.2177132, 1, 0, 0, 1, 1,
-0.1006258, 0.2134025, -1.320306, 1, 0, 0, 1, 1,
-0.1003018, 1.766703, 1.543526, 1, 0, 0, 1, 1,
-0.09832723, 0.2915531, -1.090533, 0, 0, 0, 1, 1,
-0.08912241, 1.074193, -2.140644, 0, 0, 0, 1, 1,
-0.08235262, -0.6774067, -2.646656, 0, 0, 0, 1, 1,
-0.08206358, -0.1515505, -2.332408, 0, 0, 0, 1, 1,
-0.07900923, -1.451341, -3.402195, 0, 0, 0, 1, 1,
-0.07651451, 1.708127, 0.3742754, 0, 0, 0, 1, 1,
-0.07334297, 0.8406872, 0.4168084, 0, 0, 0, 1, 1,
-0.07199021, -1.309052, -2.618435, 1, 1, 1, 1, 1,
-0.07087181, 0.5604453, -0.5761563, 1, 1, 1, 1, 1,
-0.06824975, -0.8520143, -1.903246, 1, 1, 1, 1, 1,
-0.06448297, 0.4990769, 0.9744853, 1, 1, 1, 1, 1,
-0.0576749, 0.1572257, -1.06694, 1, 1, 1, 1, 1,
-0.05343243, -0.1633384, -2.75506, 1, 1, 1, 1, 1,
-0.05218687, 0.8238004, -0.9690071, 1, 1, 1, 1, 1,
-0.04622598, -0.3574139, -2.378228, 1, 1, 1, 1, 1,
-0.04052443, 1.015134, 0.5372015, 1, 1, 1, 1, 1,
-0.03343981, -1.751173, -2.611485, 1, 1, 1, 1, 1,
-0.03212158, 0.9874143, -0.1467455, 1, 1, 1, 1, 1,
-0.02870858, 0.3440057, -0.1841057, 1, 1, 1, 1, 1,
-0.02492413, 0.8835996, -0.2962245, 1, 1, 1, 1, 1,
-0.02445346, 0.9577126, -0.3590904, 1, 1, 1, 1, 1,
-0.02281141, -0.3900036, -2.709616, 1, 1, 1, 1, 1,
-0.0207833, -0.3769649, -3.63947, 0, 0, 1, 1, 1,
-0.01920324, 1.141902, -1.216386, 1, 0, 0, 1, 1,
-0.01708422, 1.598682, -1.201585, 1, 0, 0, 1, 1,
-0.01431859, 0.09926502, -0.1551223, 1, 0, 0, 1, 1,
-0.01197831, 1.596262, -0.338011, 1, 0, 0, 1, 1,
-0.01167108, -0.427495, -2.347501, 1, 0, 0, 1, 1,
-0.006807303, -1.335294, -4.298427, 0, 0, 0, 1, 1,
-0.004207867, 0.2182272, -1.246616, 0, 0, 0, 1, 1,
-0.00362184, -0.6101031, -1.992836, 0, 0, 0, 1, 1,
-0.003574419, -2.20263, -4.706107, 0, 0, 0, 1, 1,
-0.0001271276, 0.3031265, -0.3027064, 0, 0, 0, 1, 1,
0.001730703, 2.126014, -0.680571, 0, 0, 0, 1, 1,
0.009662407, 2.546314, -0.1925635, 0, 0, 0, 1, 1,
0.01046694, 1.027079, -0.3920431, 1, 1, 1, 1, 1,
0.01603369, 0.1416084, -0.7040948, 1, 1, 1, 1, 1,
0.02094053, 0.002508168, 1.348049, 1, 1, 1, 1, 1,
0.02113008, -1.564578, 2.977646, 1, 1, 1, 1, 1,
0.02409897, 1.342775, 0.4112703, 1, 1, 1, 1, 1,
0.0258075, 0.1020408, -0.774134, 1, 1, 1, 1, 1,
0.02978042, -0.394256, 3.408876, 1, 1, 1, 1, 1,
0.03160116, -0.6773259, 3.347948, 1, 1, 1, 1, 1,
0.03558438, -2.132073, 3.31939, 1, 1, 1, 1, 1,
0.0366884, 1.951218, -0.5424736, 1, 1, 1, 1, 1,
0.04008323, -1.125583, 4.304347, 1, 1, 1, 1, 1,
0.04515897, -0.7161015, 2.649053, 1, 1, 1, 1, 1,
0.04557024, 0.4430096, 1.681594, 1, 1, 1, 1, 1,
0.05479027, 0.2981994, 0.00316309, 1, 1, 1, 1, 1,
0.05856316, 1.462541, -0.5190527, 1, 1, 1, 1, 1,
0.05902525, -1.32716, 2.436624, 0, 0, 1, 1, 1,
0.06140705, -1.240782, 4.103889, 1, 0, 0, 1, 1,
0.06772273, 0.1576858, -0.378455, 1, 0, 0, 1, 1,
0.06929537, -0.490977, 3.520152, 1, 0, 0, 1, 1,
0.07017001, 1.276857, 0.08453731, 1, 0, 0, 1, 1,
0.07032996, 0.7168481, 0.8796546, 1, 0, 0, 1, 1,
0.07137369, -0.5869479, 4.750371, 0, 0, 0, 1, 1,
0.0718845, 0.09357923, 1.103596, 0, 0, 0, 1, 1,
0.07339009, 0.7284775, 1.18921, 0, 0, 0, 1, 1,
0.0769465, 0.7386732, -0.2649792, 0, 0, 0, 1, 1,
0.08075985, 0.4686743, 0.4016249, 0, 0, 0, 1, 1,
0.08736942, 0.1416831, 1.979745, 0, 0, 0, 1, 1,
0.09013256, -1.137619, 3.605508, 0, 0, 0, 1, 1,
0.09176068, 0.03705747, 2.438875, 1, 1, 1, 1, 1,
0.09427695, 0.146984, 0.6330048, 1, 1, 1, 1, 1,
0.1002253, 0.09695531, 0.8731815, 1, 1, 1, 1, 1,
0.1008253, 1.328207, 1.170269, 1, 1, 1, 1, 1,
0.1111975, 1.202028, 1.520377, 1, 1, 1, 1, 1,
0.1122537, -0.7172536, 2.610745, 1, 1, 1, 1, 1,
0.1124604, -0.9808921, 4.066286, 1, 1, 1, 1, 1,
0.1144844, 0.9654318, -1.925309, 1, 1, 1, 1, 1,
0.114872, 0.05505672, 2.168971, 1, 1, 1, 1, 1,
0.1167659, -0.5791076, 3.73701, 1, 1, 1, 1, 1,
0.1175143, -0.278483, 4.011837, 1, 1, 1, 1, 1,
0.1207772, 0.8938669, -0.3249814, 1, 1, 1, 1, 1,
0.1216827, -1.78898, 3.087459, 1, 1, 1, 1, 1,
0.1237687, 0.388243, 0.6737679, 1, 1, 1, 1, 1,
0.125051, 0.3644446, -1.531085, 1, 1, 1, 1, 1,
0.1323539, 0.6217924, 0.2984436, 0, 0, 1, 1, 1,
0.1408514, -0.2519736, 2.605049, 1, 0, 0, 1, 1,
0.1458364, 0.1230363, 0.3955959, 1, 0, 0, 1, 1,
0.1563429, -0.5753183, 3.628426, 1, 0, 0, 1, 1,
0.1565714, -2.439441, 3.681862, 1, 0, 0, 1, 1,
0.1573229, 0.8675117, 1.942236, 1, 0, 0, 1, 1,
0.1575308, 0.2984945, 0.6538719, 0, 0, 0, 1, 1,
0.1589409, 0.143164, -0.7001194, 0, 0, 0, 1, 1,
0.160092, -0.5762841, 1.24591, 0, 0, 0, 1, 1,
0.1621028, -0.4055401, 3.214225, 0, 0, 0, 1, 1,
0.1639541, 0.2480512, 0.5565799, 0, 0, 0, 1, 1,
0.1667054, -0.5940757, 3.10796, 0, 0, 0, 1, 1,
0.1681882, 0.2772306, 0.3582411, 0, 0, 0, 1, 1,
0.1691999, 0.2628722, 1.067693, 1, 1, 1, 1, 1,
0.1764313, -0.7318027, 3.684305, 1, 1, 1, 1, 1,
0.1768516, 1.977157, 0.554867, 1, 1, 1, 1, 1,
0.1805567, 0.7259594, -0.7352519, 1, 1, 1, 1, 1,
0.1828094, -0.371194, 0.91781, 1, 1, 1, 1, 1,
0.1858714, 0.8864539, -0.1497815, 1, 1, 1, 1, 1,
0.1863911, -0.783963, 2.591129, 1, 1, 1, 1, 1,
0.1885066, 1.130522, -0.1072386, 1, 1, 1, 1, 1,
0.1905448, -0.09527125, 2.248021, 1, 1, 1, 1, 1,
0.1931613, -0.9832532, 3.395198, 1, 1, 1, 1, 1,
0.1963572, 0.4375313, -0.6281679, 1, 1, 1, 1, 1,
0.1964982, 0.7870442, 0.05268126, 1, 1, 1, 1, 1,
0.1966726, -0.3571416, 3.648347, 1, 1, 1, 1, 1,
0.197153, 0.08860853, 0.008294386, 1, 1, 1, 1, 1,
0.2018939, 0.2160454, 1.341818, 1, 1, 1, 1, 1,
0.2106864, -0.3001714, 0.2770656, 0, 0, 1, 1, 1,
0.214815, 0.08729608, -0.7493364, 1, 0, 0, 1, 1,
0.2202782, 0.1913295, 0.5771523, 1, 0, 0, 1, 1,
0.2216575, -0.3059413, 1.768777, 1, 0, 0, 1, 1,
0.2232991, 0.6540042, -0.2490842, 1, 0, 0, 1, 1,
0.2240236, 0.2032724, -0.5116121, 1, 0, 0, 1, 1,
0.2244136, 0.5453507, 1.984131, 0, 0, 0, 1, 1,
0.2265943, 2.241787, 1.123973, 0, 0, 0, 1, 1,
0.2277491, 1.876535, -0.6904094, 0, 0, 0, 1, 1,
0.2279626, -1.495109, 3.207601, 0, 0, 0, 1, 1,
0.2302635, 0.8334249, -0.9488507, 0, 0, 0, 1, 1,
0.2373836, 1.424374, 0.9546121, 0, 0, 0, 1, 1,
0.2392805, 0.2012653, 1.171758, 0, 0, 0, 1, 1,
0.2394735, 1.006086, -0.01515174, 1, 1, 1, 1, 1,
0.2396627, -0.8095175, 1.384649, 1, 1, 1, 1, 1,
0.2402893, 0.2208924, 0.388381, 1, 1, 1, 1, 1,
0.2441495, 0.6738243, 1.637561, 1, 1, 1, 1, 1,
0.2446755, 2.737803, 0.05175335, 1, 1, 1, 1, 1,
0.2449192, -0.3412371, 2.654828, 1, 1, 1, 1, 1,
0.2464951, 0.8163294, -1.074891, 1, 1, 1, 1, 1,
0.2520009, 1.824694, -0.3744482, 1, 1, 1, 1, 1,
0.252775, -0.4628699, 3.309942, 1, 1, 1, 1, 1,
0.2566854, 0.3451324, -0.8777803, 1, 1, 1, 1, 1,
0.2635175, 2.738557, 0.8219592, 1, 1, 1, 1, 1,
0.2697778, 0.9344456, 0.2977907, 1, 1, 1, 1, 1,
0.2737837, -1.279634, 4.46463, 1, 1, 1, 1, 1,
0.2741326, -1.593997, 0.6012222, 1, 1, 1, 1, 1,
0.2793096, -0.1217291, 3.182683, 1, 1, 1, 1, 1,
0.2810619, 0.8604269, 0.7835761, 0, 0, 1, 1, 1,
0.2826168, 0.006028269, 2.378985, 1, 0, 0, 1, 1,
0.2827717, 0.4943987, 0.8648404, 1, 0, 0, 1, 1,
0.2837384, 0.140414, 1.012776, 1, 0, 0, 1, 1,
0.2868031, 0.02636882, 1.373472, 1, 0, 0, 1, 1,
0.2873124, 0.8143252, -0.3524722, 1, 0, 0, 1, 1,
0.2888188, -0.3543127, 4.139574, 0, 0, 0, 1, 1,
0.2914345, 0.5635237, 1.174876, 0, 0, 0, 1, 1,
0.2940839, 0.4573123, 0.3118475, 0, 0, 0, 1, 1,
0.2951472, -0.8499579, 3.169398, 0, 0, 0, 1, 1,
0.2951585, 0.2072181, 2.817556, 0, 0, 0, 1, 1,
0.2983458, -0.1444386, 1.897262, 0, 0, 0, 1, 1,
0.2995494, -1.001595, 0.8937897, 0, 0, 0, 1, 1,
0.3030328, 0.4093515, -0.1256646, 1, 1, 1, 1, 1,
0.3033094, 0.6433143, -0.3169724, 1, 1, 1, 1, 1,
0.3082967, -0.3753112, 1.852647, 1, 1, 1, 1, 1,
0.3119494, 0.2160564, 0.7744197, 1, 1, 1, 1, 1,
0.3131291, -1.285867, 3.692007, 1, 1, 1, 1, 1,
0.3134788, -0.9781588, 3.925051, 1, 1, 1, 1, 1,
0.3136951, -1.028186, 2.792089, 1, 1, 1, 1, 1,
0.3172338, -0.7806143, 3.975827, 1, 1, 1, 1, 1,
0.3181904, -0.5745189, 3.407129, 1, 1, 1, 1, 1,
0.3201109, 1.616747, 0.6099854, 1, 1, 1, 1, 1,
0.3217474, 0.01715908, 0.5966447, 1, 1, 1, 1, 1,
0.3218087, -1.288615, 3.088885, 1, 1, 1, 1, 1,
0.3226242, 0.714879, -1.21158, 1, 1, 1, 1, 1,
0.3255, 1.331109, 1.472115, 1, 1, 1, 1, 1,
0.3255444, -1.023259, 5.444671, 1, 1, 1, 1, 1,
0.326846, 0.3900199, 1.251187, 0, 0, 1, 1, 1,
0.3299092, -1.012743, 2.375047, 1, 0, 0, 1, 1,
0.3309297, -1.094709, 2.576358, 1, 0, 0, 1, 1,
0.3319786, 1.352407, 0.8423989, 1, 0, 0, 1, 1,
0.3326787, -0.2666103, 1.490184, 1, 0, 0, 1, 1,
0.3389904, 0.1073991, -0.5165892, 1, 0, 0, 1, 1,
0.342158, 0.3386311, 1.342659, 0, 0, 0, 1, 1,
0.3438644, 0.0112188, 2.457741, 0, 0, 0, 1, 1,
0.3443598, 0.5148906, 0.850969, 0, 0, 0, 1, 1,
0.3535737, 1.147471, -1.600096, 0, 0, 0, 1, 1,
0.3653026, 1.485994, 0.9074058, 0, 0, 0, 1, 1,
0.3690037, -0.2024356, 1.01569, 0, 0, 0, 1, 1,
0.3699267, 0.9313434, 0.9914498, 0, 0, 0, 1, 1,
0.3706456, -0.1390402, 1.172093, 1, 1, 1, 1, 1,
0.3714219, 1.699627, -0.5869583, 1, 1, 1, 1, 1,
0.3791636, 0.6903674, 1.587114, 1, 1, 1, 1, 1,
0.3793015, -2.577223, 2.81403, 1, 1, 1, 1, 1,
0.3794203, -1.599235, 3.575941, 1, 1, 1, 1, 1,
0.3796079, 0.8161797, -1.811729, 1, 1, 1, 1, 1,
0.3799184, -0.169047, 2.211295, 1, 1, 1, 1, 1,
0.3810757, -1.089232, 2.92297, 1, 1, 1, 1, 1,
0.3829461, 1.318513, 0.33959, 1, 1, 1, 1, 1,
0.3831003, 0.768245, 0.2685359, 1, 1, 1, 1, 1,
0.387987, -1.503718, 2.723406, 1, 1, 1, 1, 1,
0.3897249, 1.38205, -0.6137518, 1, 1, 1, 1, 1,
0.3902292, 0.03758764, 2.446996, 1, 1, 1, 1, 1,
0.3907091, 0.04821637, 2.129231, 1, 1, 1, 1, 1,
0.3938752, -0.4786206, 2.149432, 1, 1, 1, 1, 1,
0.402741, -1.102907, 3.146674, 0, 0, 1, 1, 1,
0.4090239, 0.1696714, 1.100764, 1, 0, 0, 1, 1,
0.4090306, 0.7865849, -1.561027, 1, 0, 0, 1, 1,
0.4187492, 0.8812917, 2.602522, 1, 0, 0, 1, 1,
0.4239661, -1.392892, 0.1813687, 1, 0, 0, 1, 1,
0.4246405, -1.633179, 2.58486, 1, 0, 0, 1, 1,
0.4263716, 0.2731191, 0.6955214, 0, 0, 0, 1, 1,
0.4327336, 0.4174438, 1.775541, 0, 0, 0, 1, 1,
0.4363503, -0.6789491, 1.350344, 0, 0, 0, 1, 1,
0.4371913, 0.2669092, -0.5844483, 0, 0, 0, 1, 1,
0.4373021, -0.02268282, 1.566204, 0, 0, 0, 1, 1,
0.4407153, 1.212388, 1.340979, 0, 0, 0, 1, 1,
0.4429716, 0.7511784, 1.500322, 0, 0, 0, 1, 1,
0.4460849, 0.5375429, 1.337209, 1, 1, 1, 1, 1,
0.4504659, -0.8276958, 1.367138, 1, 1, 1, 1, 1,
0.4658194, 1.072394, 0.4046744, 1, 1, 1, 1, 1,
0.471208, -0.5091175, 3.142155, 1, 1, 1, 1, 1,
0.4830282, -0.263589, 3.00772, 1, 1, 1, 1, 1,
0.4838148, -1.376546, 1.407904, 1, 1, 1, 1, 1,
0.4875462, 1.133648, 0.3699348, 1, 1, 1, 1, 1,
0.4886391, 1.074394, 0.6773145, 1, 1, 1, 1, 1,
0.4939843, 1.277607, 1.595209, 1, 1, 1, 1, 1,
0.5028242, 0.2684908, 1.749791, 1, 1, 1, 1, 1,
0.5035526, 2.161841, -0.7094519, 1, 1, 1, 1, 1,
0.5083275, -1.339027, 3.318844, 1, 1, 1, 1, 1,
0.5109286, 0.2017498, 1.857779, 1, 1, 1, 1, 1,
0.5150446, -0.8455693, 3.975224, 1, 1, 1, 1, 1,
0.5198504, 1.49033, 0.2104655, 1, 1, 1, 1, 1,
0.5299057, 0.4492148, 0.7532662, 0, 0, 1, 1, 1,
0.5301214, 1.874089, 0.573805, 1, 0, 0, 1, 1,
0.5319033, -0.2725612, 0.9080518, 1, 0, 0, 1, 1,
0.5332891, -0.9338984, 2.92198, 1, 0, 0, 1, 1,
0.5339047, 0.7636978, 1.763256, 1, 0, 0, 1, 1,
0.5411149, 1.004456, 0.1267494, 1, 0, 0, 1, 1,
0.5412358, 0.9368979, 1.601078, 0, 0, 0, 1, 1,
0.5486192, 1.75542, -1.771691, 0, 0, 0, 1, 1,
0.5494198, 0.9450304, -0.9536012, 0, 0, 0, 1, 1,
0.5505376, 0.3593684, 1.619973, 0, 0, 0, 1, 1,
0.5534627, -0.5791855, 2.18979, 0, 0, 0, 1, 1,
0.5537017, 0.06851925, 1.318, 0, 0, 0, 1, 1,
0.5562274, 0.2571933, 1.464649, 0, 0, 0, 1, 1,
0.5565679, 0.2714211, -0.02567695, 1, 1, 1, 1, 1,
0.5578947, -0.03754339, 1.935589, 1, 1, 1, 1, 1,
0.5641261, -1.452499, 4.19438, 1, 1, 1, 1, 1,
0.5647021, -0.4071714, 0.5181738, 1, 1, 1, 1, 1,
0.5648283, 0.2316464, 1.300612, 1, 1, 1, 1, 1,
0.5649566, 0.9138421, 2.355098, 1, 1, 1, 1, 1,
0.5672308, -0.1078929, 2.621492, 1, 1, 1, 1, 1,
0.5717933, 0.9502908, -1.257647, 1, 1, 1, 1, 1,
0.5734372, -1.79095, 2.915443, 1, 1, 1, 1, 1,
0.5763249, 0.8577658, -1.234795, 1, 1, 1, 1, 1,
0.5800026, -1.798535, 5.178071, 1, 1, 1, 1, 1,
0.5805995, 0.8265515, -0.6396181, 1, 1, 1, 1, 1,
0.5820072, 0.8975564, -0.7816119, 1, 1, 1, 1, 1,
0.5822649, -0.4355429, 2.934036, 1, 1, 1, 1, 1,
0.5950172, 2.324149, -0.6435504, 1, 1, 1, 1, 1,
0.5959367, 1.207843, 0.3166752, 0, 0, 1, 1, 1,
0.5985315, -2.126693, 2.185212, 1, 0, 0, 1, 1,
0.5994681, 0.9032549, 0.9489239, 1, 0, 0, 1, 1,
0.6062535, 0.5542235, 0.02832558, 1, 0, 0, 1, 1,
0.6100246, -0.3513116, 1.631546, 1, 0, 0, 1, 1,
0.6105039, 0.4303985, 0.928425, 1, 0, 0, 1, 1,
0.613011, 0.2568806, 0.09058509, 0, 0, 0, 1, 1,
0.6182348, 0.510254, 1.768613, 0, 0, 0, 1, 1,
0.621102, -0.04290134, 1.51734, 0, 0, 0, 1, 1,
0.6214835, -0.2254878, 3.838727, 0, 0, 0, 1, 1,
0.6235069, 0.8355337, 1.871, 0, 0, 0, 1, 1,
0.6237009, -1.22866, 1.45851, 0, 0, 0, 1, 1,
0.6237736, -1.182192, 4.093455, 0, 0, 0, 1, 1,
0.6241597, 1.10084, -0.4927019, 1, 1, 1, 1, 1,
0.627457, -2.217325, 4.449004, 1, 1, 1, 1, 1,
0.6327658, 0.4514885, 0.3740474, 1, 1, 1, 1, 1,
0.6415532, 0.949873, -0.5862542, 1, 1, 1, 1, 1,
0.6455175, 1.371125, -1.591847, 1, 1, 1, 1, 1,
0.6505845, -1.242634, 3.011919, 1, 1, 1, 1, 1,
0.6505961, 1.007774, 0.1672066, 1, 1, 1, 1, 1,
0.6568545, -0.1388853, 3.526204, 1, 1, 1, 1, 1,
0.6575258, -1.127303, 3.080069, 1, 1, 1, 1, 1,
0.6608443, 0.8356349, 1.594509, 1, 1, 1, 1, 1,
0.6640534, -0.3269156, 2.038725, 1, 1, 1, 1, 1,
0.6640713, -0.4803915, 2.932458, 1, 1, 1, 1, 1,
0.6651844, 0.5261936, 1.806291, 1, 1, 1, 1, 1,
0.6655599, -0.5391408, 1.01102, 1, 1, 1, 1, 1,
0.6753979, 0.5376951, 1.301069, 1, 1, 1, 1, 1,
0.6790324, -1.364426, 1.534818, 0, 0, 1, 1, 1,
0.679619, 1.380363, -0.4745163, 1, 0, 0, 1, 1,
0.681141, -0.9457643, 0.2362686, 1, 0, 0, 1, 1,
0.6860465, 1.777417, 1.071144, 1, 0, 0, 1, 1,
0.6877146, 0.08986543, 0.709962, 1, 0, 0, 1, 1,
0.6886427, 0.07182199, 1.780094, 1, 0, 0, 1, 1,
0.6914046, 0.1933296, 0.9500903, 0, 0, 0, 1, 1,
0.6921787, -0.4260052, 2.434746, 0, 0, 0, 1, 1,
0.693405, -1.355359, 3.588727, 0, 0, 0, 1, 1,
0.6948331, -2.784413, 3.499886, 0, 0, 0, 1, 1,
0.6968536, 0.2773388, 1.70805, 0, 0, 0, 1, 1,
0.6997189, 2.111959, 1.21346, 0, 0, 0, 1, 1,
0.7000901, 0.8839669, 0.6926386, 0, 0, 0, 1, 1,
0.7034386, 0.04274232, 2.027756, 1, 1, 1, 1, 1,
0.7042266, -0.0104795, 3.038692, 1, 1, 1, 1, 1,
0.7061092, -0.3948126, 2.192183, 1, 1, 1, 1, 1,
0.7073158, 0.5196025, 2.202222, 1, 1, 1, 1, 1,
0.7080051, 1.078989, 1.879971, 1, 1, 1, 1, 1,
0.7106556, 0.1071033, 3.035999, 1, 1, 1, 1, 1,
0.7207239, -0.4670616, 3.465487, 1, 1, 1, 1, 1,
0.7209904, 1.433347, 0.908913, 1, 1, 1, 1, 1,
0.7227862, -0.2251439, 2.070566, 1, 1, 1, 1, 1,
0.7242329, 0.2784462, -1.046812, 1, 1, 1, 1, 1,
0.7253788, -0.2569502, 2.85741, 1, 1, 1, 1, 1,
0.7269197, -0.5044427, 1.947865, 1, 1, 1, 1, 1,
0.7303689, -2.086195, 2.768273, 1, 1, 1, 1, 1,
0.7344718, -0.6986386, 2.05721, 1, 1, 1, 1, 1,
0.735522, -0.2900313, 1.799581, 1, 1, 1, 1, 1,
0.7357567, 0.443899, 0.3616582, 0, 0, 1, 1, 1,
0.7422307, 1.005684, 1.306153, 1, 0, 0, 1, 1,
0.7444103, 0.6011255, 0.2975056, 1, 0, 0, 1, 1,
0.7470735, 0.03543708, 1.83895, 1, 0, 0, 1, 1,
0.7475496, 1.987824, 0.2136967, 1, 0, 0, 1, 1,
0.752165, -0.8558065, 0.7016516, 1, 0, 0, 1, 1,
0.754368, -0.3761004, 1.040841, 0, 0, 0, 1, 1,
0.7577342, -0.5808081, 3.714592, 0, 0, 0, 1, 1,
0.7620689, -0.5866328, 2.076535, 0, 0, 0, 1, 1,
0.7628566, -1.109338, 3.342664, 0, 0, 0, 1, 1,
0.7637395, -1.08714, 1.352942, 0, 0, 0, 1, 1,
0.7654886, 0.8346065, 0.1838055, 0, 0, 0, 1, 1,
0.76875, -0.693715, 0.8680673, 0, 0, 0, 1, 1,
0.7707601, -0.5414024, 2.243742, 1, 1, 1, 1, 1,
0.7711762, 0.2341259, 1.386595, 1, 1, 1, 1, 1,
0.772543, -0.8501276, 3.727249, 1, 1, 1, 1, 1,
0.7835163, -0.3843951, 0.6763485, 1, 1, 1, 1, 1,
0.7925704, 1.606657, 0.7760366, 1, 1, 1, 1, 1,
0.792599, -1.390007, 2.423393, 1, 1, 1, 1, 1,
0.7989419, 0.7606075, 1.671906, 1, 1, 1, 1, 1,
0.7995487, -0.5995677, 1.16487, 1, 1, 1, 1, 1,
0.8000385, -0.1103866, 1.803215, 1, 1, 1, 1, 1,
0.8035132, -2.596477, 2.474876, 1, 1, 1, 1, 1,
0.8037635, -0.2185915, 1.746238, 1, 1, 1, 1, 1,
0.8075954, -1.162177, 2.742324, 1, 1, 1, 1, 1,
0.8084219, -0.3508756, 1.938015, 1, 1, 1, 1, 1,
0.8096167, -0.605373, 1.722673, 1, 1, 1, 1, 1,
0.8098784, 1.128264, 0.03311268, 1, 1, 1, 1, 1,
0.8221928, -1.712022, 3.800531, 0, 0, 1, 1, 1,
0.8252081, -0.4139098, 2.218369, 1, 0, 0, 1, 1,
0.8321441, 1.171841, 2.059502, 1, 0, 0, 1, 1,
0.8339593, 1.883017, 0.5991917, 1, 0, 0, 1, 1,
0.8377259, 0.3942075, 1.913403, 1, 0, 0, 1, 1,
0.8484682, 0.1974782, 2.029903, 1, 0, 0, 1, 1,
0.8486621, 0.6624711, 2.048782, 0, 0, 0, 1, 1,
0.8495888, 1.332367, 0.4374543, 0, 0, 0, 1, 1,
0.8505173, -1.489969, 3.638429, 0, 0, 0, 1, 1,
0.8606024, 1.19445, 1.564506, 0, 0, 0, 1, 1,
0.8680735, 1.102428, -0.3990887, 0, 0, 0, 1, 1,
0.868255, 1.171921, 0.4870293, 0, 0, 0, 1, 1,
0.8749723, -0.9042812, 2.617305, 0, 0, 0, 1, 1,
0.8784607, -0.6165524, 0.9064227, 1, 1, 1, 1, 1,
0.8796484, 1.301509, 0.6696289, 1, 1, 1, 1, 1,
0.8839675, 0.2910113, 1.290282, 1, 1, 1, 1, 1,
0.8874764, -0.4408565, 2.718896, 1, 1, 1, 1, 1,
0.887648, 1.28961, -0.6426598, 1, 1, 1, 1, 1,
0.8887559, -0.9119191, 3.582062, 1, 1, 1, 1, 1,
0.8921809, -0.5268953, 2.073271, 1, 1, 1, 1, 1,
0.8963686, 0.8307183, -0.2986392, 1, 1, 1, 1, 1,
0.8972849, -0.7332019, 0.8437067, 1, 1, 1, 1, 1,
0.90115, -0.4726379, 1.649763, 1, 1, 1, 1, 1,
0.9034684, 0.5871868, 0.287539, 1, 1, 1, 1, 1,
0.9076617, 0.4705307, -0.1159677, 1, 1, 1, 1, 1,
0.9091192, 1.021889, 2.119035, 1, 1, 1, 1, 1,
0.9093973, -0.2633949, 1.289893, 1, 1, 1, 1, 1,
0.9115419, 0.507762, 0.8709687, 1, 1, 1, 1, 1,
0.9121158, -0.9965375, 3.23732, 0, 0, 1, 1, 1,
0.9248762, 0.7521421, 2.184982, 1, 0, 0, 1, 1,
0.9257752, -0.2694088, 1.749737, 1, 0, 0, 1, 1,
0.9272609, 0.1525126, 1.35789, 1, 0, 0, 1, 1,
0.9282987, -1.382236, 1.628846, 1, 0, 0, 1, 1,
0.9313518, 0.9571745, -0.1483319, 1, 0, 0, 1, 1,
0.9415916, 0.1469986, 4.404419, 0, 0, 0, 1, 1,
0.944679, 1.479478, 3.080967, 0, 0, 0, 1, 1,
0.94532, -0.6748599, 2.696934, 0, 0, 0, 1, 1,
0.9503037, -1.301589, 2.311942, 0, 0, 0, 1, 1,
0.956376, 0.9313935, 0.4946213, 0, 0, 0, 1, 1,
0.9626868, -1.735261, 2.450478, 0, 0, 0, 1, 1,
0.968556, -0.373113, 2.541033, 0, 0, 0, 1, 1,
0.9708368, -0.3077949, 1.34798, 1, 1, 1, 1, 1,
0.9728786, -0.7320378, 1.303192, 1, 1, 1, 1, 1,
0.974501, -1.084674, 2.615717, 1, 1, 1, 1, 1,
0.9754041, -0.02251163, 3.521757, 1, 1, 1, 1, 1,
0.9815468, 0.7914122, 2.04357, 1, 1, 1, 1, 1,
0.9832972, 0.02269549, 2.148139, 1, 1, 1, 1, 1,
0.9837041, -0.1037919, 2.093956, 1, 1, 1, 1, 1,
0.985894, -2.084149, 1.226262, 1, 1, 1, 1, 1,
0.9882166, 0.4377809, -0.05943585, 1, 1, 1, 1, 1,
0.9934699, 1.00829, 2.450995, 1, 1, 1, 1, 1,
0.9963199, 0.5388236, 1.387528, 1, 1, 1, 1, 1,
1.005795, -0.7687185, 1.853116, 1, 1, 1, 1, 1,
1.022241, -0.4522254, 0.7495468, 1, 1, 1, 1, 1,
1.031209, -0.6356539, 2.171831, 1, 1, 1, 1, 1,
1.036144, 1.17283, 1.459985, 1, 1, 1, 1, 1,
1.036236, -0.2115996, 2.708042, 0, 0, 1, 1, 1,
1.038288, -1.625021, 1.550028, 1, 0, 0, 1, 1,
1.038781, 0.711327, -0.5566755, 1, 0, 0, 1, 1,
1.040454, -0.09473997, 3.713448, 1, 0, 0, 1, 1,
1.041419, 0.2454076, 1.817852, 1, 0, 0, 1, 1,
1.041866, -2.611342, 2.566255, 1, 0, 0, 1, 1,
1.042808, 0.316707, -0.1880344, 0, 0, 0, 1, 1,
1.048103, -0.7492287, 1.78473, 0, 0, 0, 1, 1,
1.055935, 1.008102, 0.4330533, 0, 0, 0, 1, 1,
1.061189, -0.08365617, 1.557271, 0, 0, 0, 1, 1,
1.062129, -0.5536152, 1.347582, 0, 0, 0, 1, 1,
1.062911, 1.16168, 1.366943, 0, 0, 0, 1, 1,
1.064092, 0.4090334, 1.140192, 0, 0, 0, 1, 1,
1.066227, -1.848621, 3.129257, 1, 1, 1, 1, 1,
1.07105, 2.022143, -0.1164442, 1, 1, 1, 1, 1,
1.073785, -0.6457783, 4.546519, 1, 1, 1, 1, 1,
1.078769, -0.1211697, -0.2191515, 1, 1, 1, 1, 1,
1.084267, 0.4893456, 0.8200339, 1, 1, 1, 1, 1,
1.084918, 1.167774, -0.8062991, 1, 1, 1, 1, 1,
1.089369, 0.2965067, 1.170267, 1, 1, 1, 1, 1,
1.097527, 0.3082023, 1.111671, 1, 1, 1, 1, 1,
1.121466, 0.6906003, 0.8161488, 1, 1, 1, 1, 1,
1.127916, 0.01592448, -0.03032972, 1, 1, 1, 1, 1,
1.13295, -0.9473209, 3.026213, 1, 1, 1, 1, 1,
1.137242, -2.182401, 2.614367, 1, 1, 1, 1, 1,
1.143664, 0.2432914, -0.3208562, 1, 1, 1, 1, 1,
1.154592, -0.5454745, 0.09907864, 1, 1, 1, 1, 1,
1.159948, 0.1643487, 0.9518321, 1, 1, 1, 1, 1,
1.161339, 1.219073, 1.525682, 0, 0, 1, 1, 1,
1.162932, 0.2243138, 3.109018, 1, 0, 0, 1, 1,
1.167386, 0.08338646, 1.239743, 1, 0, 0, 1, 1,
1.175402, 0.7865119, 0.1404738, 1, 0, 0, 1, 1,
1.175816, -1.032518, 0.8082481, 1, 0, 0, 1, 1,
1.18275, 0.1732545, 1.443124, 1, 0, 0, 1, 1,
1.186153, -0.963023, 3.90924, 0, 0, 0, 1, 1,
1.190541, 0.2884842, 0.9679773, 0, 0, 0, 1, 1,
1.20449, -1.011013, 0.4447033, 0, 0, 0, 1, 1,
1.209803, 0.8233043, 0.8826798, 0, 0, 0, 1, 1,
1.21813, -0.4786847, 2.808468, 0, 0, 0, 1, 1,
1.218681, 0.2429841, 1.295183, 0, 0, 0, 1, 1,
1.21893, 0.0840749, 2.454401, 0, 0, 0, 1, 1,
1.22458, 0.6060776, 1.975764, 1, 1, 1, 1, 1,
1.227609, -0.1698495, 2.524211, 1, 1, 1, 1, 1,
1.235396, -0.4654163, 1.704162, 1, 1, 1, 1, 1,
1.244072, -0.4350107, 1.75766, 1, 1, 1, 1, 1,
1.244305, -0.1719541, 1.459884, 1, 1, 1, 1, 1,
1.25436, 0.4119748, 1.589071, 1, 1, 1, 1, 1,
1.261922, -0.1268567, -0.2900534, 1, 1, 1, 1, 1,
1.262916, 1.247133, 2.106957, 1, 1, 1, 1, 1,
1.265667, 1.284759, 1.375704, 1, 1, 1, 1, 1,
1.268323, -0.5467539, 2.504588, 1, 1, 1, 1, 1,
1.27073, 0.6150983, 1.250613, 1, 1, 1, 1, 1,
1.272642, -1.455723, 4.674442, 1, 1, 1, 1, 1,
1.27526, 0.2136883, 1.038268, 1, 1, 1, 1, 1,
1.280086, -0.5785216, 2.014217, 1, 1, 1, 1, 1,
1.296206, 0.3752776, 1.232751, 1, 1, 1, 1, 1,
1.298649, -0.6035328, 1.888281, 0, 0, 1, 1, 1,
1.304777, -0.6155947, -0.1159052, 1, 0, 0, 1, 1,
1.307159, -0.2765054, 3.368281, 1, 0, 0, 1, 1,
1.309046, -0.6678916, 0.6899664, 1, 0, 0, 1, 1,
1.317227, -0.6200889, 3.167874, 1, 0, 0, 1, 1,
1.324084, 0.2621885, 2.670604, 1, 0, 0, 1, 1,
1.336419, -0.6246075, 1.215814, 0, 0, 0, 1, 1,
1.33659, 1.013201, -0.2380314, 0, 0, 0, 1, 1,
1.33715, -0.1757724, 2.457869, 0, 0, 0, 1, 1,
1.338685, 1.219666, 1.203907, 0, 0, 0, 1, 1,
1.340387, -0.8996686, 1.720894, 0, 0, 0, 1, 1,
1.347076, 1.187318, 0.9372603, 0, 0, 0, 1, 1,
1.347733, 0.7849381, -0.4104288, 0, 0, 0, 1, 1,
1.34818, 0.2941571, 0.8929325, 1, 1, 1, 1, 1,
1.348242, -0.1956734, -0.04273129, 1, 1, 1, 1, 1,
1.365153, -0.6181491, 3.000085, 1, 1, 1, 1, 1,
1.36632, -2.205328, 2.318604, 1, 1, 1, 1, 1,
1.367042, -0.3493621, 2.205125, 1, 1, 1, 1, 1,
1.367171, -0.4571057, 2.446372, 1, 1, 1, 1, 1,
1.367934, 0.3707314, 0.5217732, 1, 1, 1, 1, 1,
1.370556, -1.656406, 3.299438, 1, 1, 1, 1, 1,
1.372502, 0.3708453, 0.8300458, 1, 1, 1, 1, 1,
1.378363, -0.3395241, 0.86071, 1, 1, 1, 1, 1,
1.378958, 0.8050037, -0.07036955, 1, 1, 1, 1, 1,
1.401214, 0.2169517, 2.360508, 1, 1, 1, 1, 1,
1.406061, 0.5903247, 0.2799301, 1, 1, 1, 1, 1,
1.4169, -0.6969302, 2.239679, 1, 1, 1, 1, 1,
1.424574, -3.722144, 3.303599, 1, 1, 1, 1, 1,
1.429983, 1.135249, 1.021047, 0, 0, 1, 1, 1,
1.442346, -0.4067957, 2.103305, 1, 0, 0, 1, 1,
1.442738, -0.5369063, 0.8800673, 1, 0, 0, 1, 1,
1.44633, -1.393911, 2.370664, 1, 0, 0, 1, 1,
1.470663, 0.5027668, 2.482597, 1, 0, 0, 1, 1,
1.475034, -0.7752068, 3.31791, 1, 0, 0, 1, 1,
1.476749, 1.319104, 1.634752, 0, 0, 0, 1, 1,
1.495521, 0.6522902, 1.3969, 0, 0, 0, 1, 1,
1.496046, -0.2445085, 1.905903, 0, 0, 0, 1, 1,
1.49624, -0.5912231, 3.156062, 0, 0, 0, 1, 1,
1.504942, 0.4004973, 3.386162, 0, 0, 0, 1, 1,
1.507606, -0.2658472, 3.497302, 0, 0, 0, 1, 1,
1.518645, -0.2435181, -0.1933757, 0, 0, 0, 1, 1,
1.534205, -0.2686713, 0.8424516, 1, 1, 1, 1, 1,
1.543209, 0.7273139, 1.141896, 1, 1, 1, 1, 1,
1.545725, -1.017098, 3.835078, 1, 1, 1, 1, 1,
1.559522, 0.8787283, 1.3793, 1, 1, 1, 1, 1,
1.565125, -0.05972916, 1.532074, 1, 1, 1, 1, 1,
1.573516, -0.9321299, 2.36028, 1, 1, 1, 1, 1,
1.573521, -0.8411254, 1.833122, 1, 1, 1, 1, 1,
1.574804, 0.3420431, -0.5520462, 1, 1, 1, 1, 1,
1.596599, 2.467145, 0.6642371, 1, 1, 1, 1, 1,
1.602111, -0.07529013, 2.943258, 1, 1, 1, 1, 1,
1.612858, 2.034202, 1.64303, 1, 1, 1, 1, 1,
1.629773, 0.6217817, 1.956202, 1, 1, 1, 1, 1,
1.634467, 0.9190192, 0.3358603, 1, 1, 1, 1, 1,
1.639488, 0.3742195, 1.057853, 1, 1, 1, 1, 1,
1.642772, 0.898124, 2.400762, 1, 1, 1, 1, 1,
1.651064, 0.5564362, 0.8841857, 0, 0, 1, 1, 1,
1.660248, -0.5933716, 1.604876, 1, 0, 0, 1, 1,
1.677512, 1.73514, 1.571464, 1, 0, 0, 1, 1,
1.677582, -0.1393342, 0.002870975, 1, 0, 0, 1, 1,
1.679506, 0.09155759, -0.1766468, 1, 0, 0, 1, 1,
1.723602, -0.7251257, -0.05182094, 1, 0, 0, 1, 1,
1.723718, 1.644813, 0.6845687, 0, 0, 0, 1, 1,
1.726182, -1.711048, 0.8736131, 0, 0, 0, 1, 1,
1.726946, -1.146963, 1.598274, 0, 0, 0, 1, 1,
1.736275, -0.3142329, 2.428622, 0, 0, 0, 1, 1,
1.740018, -1.929268, 4.195208, 0, 0, 0, 1, 1,
1.758371, -1.451742, 1.81119, 0, 0, 0, 1, 1,
1.765168, 1.092719, 0.7241023, 0, 0, 0, 1, 1,
1.78294, -1.67265, 0.968406, 1, 1, 1, 1, 1,
1.78797, 1.196203, 2.601164, 1, 1, 1, 1, 1,
1.788403, -0.9964379, 0.3840783, 1, 1, 1, 1, 1,
1.81255, 0.4055794, 2.761608, 1, 1, 1, 1, 1,
1.81919, 1.079475, 1.025387, 1, 1, 1, 1, 1,
1.833977, -0.7836592, 2.937893, 1, 1, 1, 1, 1,
1.837918, -0.5112395, 1.34085, 1, 1, 1, 1, 1,
1.851009, 1.812821, 0.5213891, 1, 1, 1, 1, 1,
1.856689, 0.7044349, 1.823195, 1, 1, 1, 1, 1,
1.86962, -0.2466297, 1.675344, 1, 1, 1, 1, 1,
1.880802, -1.520916, 1.887797, 1, 1, 1, 1, 1,
1.881046, 0.4971007, 1.974163, 1, 1, 1, 1, 1,
1.925409, 0.4916928, 2.14287, 1, 1, 1, 1, 1,
1.932678, -0.04899367, 0.2280313, 1, 1, 1, 1, 1,
1.969434, 2.509072, -0.1487781, 1, 1, 1, 1, 1,
2.033467, -0.7432705, 2.909528, 0, 0, 1, 1, 1,
2.063677, 0.3676943, 2.654188, 1, 0, 0, 1, 1,
2.06389, -1.016971, 1.153281, 1, 0, 0, 1, 1,
2.092703, 2.259874, -0.2052649, 1, 0, 0, 1, 1,
2.150208, -0.4145373, 1.777475, 1, 0, 0, 1, 1,
2.1769, -2.950124, 1.159297, 1, 0, 0, 1, 1,
2.18044, 0.08969864, 2.186453, 0, 0, 0, 1, 1,
2.197085, -0.9664509, 3.068299, 0, 0, 0, 1, 1,
2.202566, 0.7068719, -0.1616802, 0, 0, 0, 1, 1,
2.210876, 0.6913321, 1.073836, 0, 0, 0, 1, 1,
2.287341, -0.1798697, -0.08441657, 0, 0, 0, 1, 1,
2.418061, 0.6902937, 0.3331502, 0, 0, 0, 1, 1,
2.436394, 0.8661528, 0.6489599, 0, 0, 0, 1, 1,
2.436517, -0.3054469, 1.38745, 1, 1, 1, 1, 1,
2.591954, -0.2061308, 3.042923, 1, 1, 1, 1, 1,
2.593319, -0.4650713, 2.677326, 1, 1, 1, 1, 1,
2.637423, 0.0042659, 0.2906789, 1, 1, 1, 1, 1,
2.721163, -0.528429, 2.374998, 1, 1, 1, 1, 1,
2.817715, -0.4183713, 2.976275, 1, 1, 1, 1, 1,
2.937193, -1.028861, 1.807079, 1, 1, 1, 1, 1
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
var radius = 9.510365;
var distance = 33.40475;
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
mvMatrix.translate( 0.1197886, 0.4917934, -0.0889914 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.40475);
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
