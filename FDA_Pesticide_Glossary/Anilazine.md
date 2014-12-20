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
-3.605984, -1.539734, -2.305188, 1, 0, 0, 1,
-3.308033, 0.9376743, -1.302108, 1, 0.007843138, 0, 1,
-2.923067, -1.340649, -1.901858, 1, 0.01176471, 0, 1,
-2.558926, -0.2732316, -1.087057, 1, 0.01960784, 0, 1,
-2.558337, -1.791135, -0.6981308, 1, 0.02352941, 0, 1,
-2.532606, -0.58951, -3.386039, 1, 0.03137255, 0, 1,
-2.490467, 2.524661, 0.5607188, 1, 0.03529412, 0, 1,
-2.467586, 0.6069452, -2.494138, 1, 0.04313726, 0, 1,
-2.379213, -1.350076, -3.002616, 1, 0.04705882, 0, 1,
-2.326751, 0.6402536, -2.050458, 1, 0.05490196, 0, 1,
-2.296241, -0.2961892, -2.713298, 1, 0.05882353, 0, 1,
-2.29251, 0.5616433, -0.0368548, 1, 0.06666667, 0, 1,
-2.287055, -0.7446463, -0.2541801, 1, 0.07058824, 0, 1,
-2.279873, 2.815669, -0.3703809, 1, 0.07843138, 0, 1,
-2.276292, 1.421462, -1.646354, 1, 0.08235294, 0, 1,
-2.211762, -0.02537949, -1.032022, 1, 0.09019608, 0, 1,
-2.189037, -1.130489, -1.241466, 1, 0.09411765, 0, 1,
-2.114675, 0.004993904, -3.731431, 1, 0.1019608, 0, 1,
-2.065836, -1.224247, -3.328146, 1, 0.1098039, 0, 1,
-2.061782, 1.101294, -1.06467, 1, 0.1137255, 0, 1,
-2.051806, -0.06620469, -0.4384364, 1, 0.1215686, 0, 1,
-2.038187, -0.4969414, -1.469408, 1, 0.1254902, 0, 1,
-2.037527, -0.4877478, -2.767719, 1, 0.1333333, 0, 1,
-2.033702, 0.1939843, -2.656912, 1, 0.1372549, 0, 1,
-2.029683, -0.03080468, -1.744285, 1, 0.145098, 0, 1,
-2.007143, -0.5671206, -2.181204, 1, 0.1490196, 0, 1,
-1.928095, 0.8505855, -0.7561191, 1, 0.1568628, 0, 1,
-1.910782, 0.3896113, -1.874797, 1, 0.1607843, 0, 1,
-1.890558, 0.12451, -2.283409, 1, 0.1686275, 0, 1,
-1.87176, -0.03110319, -2.369772, 1, 0.172549, 0, 1,
-1.842746, -1.128245, -2.074757, 1, 0.1803922, 0, 1,
-1.84059, -1.629676, -2.563318, 1, 0.1843137, 0, 1,
-1.8403, 0.4296465, -3.307592, 1, 0.1921569, 0, 1,
-1.816649, -0.715872, -1.768678, 1, 0.1960784, 0, 1,
-1.812462, -0.3983588, -2.709729, 1, 0.2039216, 0, 1,
-1.806083, 1.154545, -0.07438969, 1, 0.2117647, 0, 1,
-1.801001, 0.8722564, -1.562898, 1, 0.2156863, 0, 1,
-1.798837, 0.6198685, -0.54035, 1, 0.2235294, 0, 1,
-1.779659, 0.8116415, -1.385883, 1, 0.227451, 0, 1,
-1.746507, -2.495236, -2.287936, 1, 0.2352941, 0, 1,
-1.746432, 0.5449506, -0.4992268, 1, 0.2392157, 0, 1,
-1.727567, -1.602668, 0.1601019, 1, 0.2470588, 0, 1,
-1.726822, -0.1349336, -1.312137, 1, 0.2509804, 0, 1,
-1.724367, 0.7793576, -1.063719, 1, 0.2588235, 0, 1,
-1.694987, -0.8238893, -4.316565, 1, 0.2627451, 0, 1,
-1.676769, 0.7225646, -0.2417262, 1, 0.2705882, 0, 1,
-1.672217, -0.2117455, -0.9902032, 1, 0.2745098, 0, 1,
-1.661336, -1.038997, -1.194424, 1, 0.282353, 0, 1,
-1.659565, -1.506174, -0.9574466, 1, 0.2862745, 0, 1,
-1.656739, -0.4925005, -2.965858, 1, 0.2941177, 0, 1,
-1.645007, -0.1359689, 0.7839143, 1, 0.3019608, 0, 1,
-1.63508, 0.3214217, -1.156398, 1, 0.3058824, 0, 1,
-1.63, -0.230322, -1.485163, 1, 0.3137255, 0, 1,
-1.590679, 0.7000616, -2.10692, 1, 0.3176471, 0, 1,
-1.589553, 0.9888965, -2.113859, 1, 0.3254902, 0, 1,
-1.587547, -0.2360636, -1.211477, 1, 0.3294118, 0, 1,
-1.58334, -0.5081635, -2.359303, 1, 0.3372549, 0, 1,
-1.579811, 0.2764758, -2.126016, 1, 0.3411765, 0, 1,
-1.567073, 0.631667, -0.6468229, 1, 0.3490196, 0, 1,
-1.559344, 0.3613695, -1.818707, 1, 0.3529412, 0, 1,
-1.558751, -0.0734345, -2.842726, 1, 0.3607843, 0, 1,
-1.554315, -0.7336376, -1.818964, 1, 0.3647059, 0, 1,
-1.541779, -0.3278528, -1.319813, 1, 0.372549, 0, 1,
-1.541593, 0.649747, -0.6908154, 1, 0.3764706, 0, 1,
-1.532176, 2.205349, -1.950521, 1, 0.3843137, 0, 1,
-1.514385, 0.002624379, 0.2390545, 1, 0.3882353, 0, 1,
-1.509984, -1.01278, -1.999765, 1, 0.3960784, 0, 1,
-1.505931, -1.097866, -3.000733, 1, 0.4039216, 0, 1,
-1.501952, 0.3787436, -2.434833, 1, 0.4078431, 0, 1,
-1.493782, 0.7774479, -0.5688758, 1, 0.4156863, 0, 1,
-1.489165, -0.01366852, -1.839742, 1, 0.4196078, 0, 1,
-1.485907, 0.07560489, -1.295764, 1, 0.427451, 0, 1,
-1.483549, 0.4302114, -2.53085, 1, 0.4313726, 0, 1,
-1.482414, 0.2060969, -5.460888, 1, 0.4392157, 0, 1,
-1.478961, 1.254449, -2.453461, 1, 0.4431373, 0, 1,
-1.470419, 0.7924581, -1.151481, 1, 0.4509804, 0, 1,
-1.469233, -0.5355545, -1.311631, 1, 0.454902, 0, 1,
-1.466856, -0.9870043, -2.685214, 1, 0.4627451, 0, 1,
-1.460611, -0.1317268, -2.153793, 1, 0.4666667, 0, 1,
-1.460135, -0.4900222, -3.289544, 1, 0.4745098, 0, 1,
-1.460025, 1.112627, -1.028731, 1, 0.4784314, 0, 1,
-1.455861, -3.033908, -2.656269, 1, 0.4862745, 0, 1,
-1.452641, 0.2255277, 1.369386, 1, 0.4901961, 0, 1,
-1.452086, -0.2762514, -0.4520949, 1, 0.4980392, 0, 1,
-1.446842, 0.4694006, -0.3881401, 1, 0.5058824, 0, 1,
-1.429686, -1.621164, -2.213253, 1, 0.509804, 0, 1,
-1.422723, -1.108427, -1.618764, 1, 0.5176471, 0, 1,
-1.414425, 0.7938507, -1.725039, 1, 0.5215687, 0, 1,
-1.38144, 0.2969425, -2.890797, 1, 0.5294118, 0, 1,
-1.372215, -0.4067906, -2.542275, 1, 0.5333334, 0, 1,
-1.36486, -0.4913195, -3.268095, 1, 0.5411765, 0, 1,
-1.362213, -1.698215, -2.998902, 1, 0.5450981, 0, 1,
-1.36097, -0.6848843, -2.750183, 1, 0.5529412, 0, 1,
-1.359274, -0.7555444, -2.012061, 1, 0.5568628, 0, 1,
-1.359018, -0.7928653, -3.149842, 1, 0.5647059, 0, 1,
-1.358746, -0.1184554, -3.076044, 1, 0.5686275, 0, 1,
-1.358542, 0.7467225, 0.10408, 1, 0.5764706, 0, 1,
-1.349182, -0.7365121, -0.6650794, 1, 0.5803922, 0, 1,
-1.332983, -0.3160229, -2.829343, 1, 0.5882353, 0, 1,
-1.318394, -0.7357923, -1.982073, 1, 0.5921569, 0, 1,
-1.318287, -0.891968, -2.591767, 1, 0.6, 0, 1,
-1.313432, -0.09684866, -1.130593, 1, 0.6078432, 0, 1,
-1.312791, 1.705846, -0.4009577, 1, 0.6117647, 0, 1,
-1.308807, 0.9219533, 0.3080978, 1, 0.6196079, 0, 1,
-1.293303, -0.08863079, -2.067704, 1, 0.6235294, 0, 1,
-1.291329, 0.6502512, -1.039234, 1, 0.6313726, 0, 1,
-1.286911, 1.023096, -0.506173, 1, 0.6352941, 0, 1,
-1.27808, 0.1084714, -2.973751, 1, 0.6431373, 0, 1,
-1.276117, -0.7977279, -3.557356, 1, 0.6470588, 0, 1,
-1.273799, 1.83884, -0.008805664, 1, 0.654902, 0, 1,
-1.271028, 1.095441, 1.533757, 1, 0.6588235, 0, 1,
-1.263721, 2.228669, -0.3060515, 1, 0.6666667, 0, 1,
-1.262934, 0.4250779, -0.9334931, 1, 0.6705883, 0, 1,
-1.260115, -2.221033, -2.22775, 1, 0.6784314, 0, 1,
-1.251487, 0.4790008, -1.113621, 1, 0.682353, 0, 1,
-1.246753, 0.4441792, 0.2749625, 1, 0.6901961, 0, 1,
-1.232496, -0.8833147, -1.753937, 1, 0.6941177, 0, 1,
-1.231551, 1.811357, 0.8791552, 1, 0.7019608, 0, 1,
-1.22814, 0.9790041, -2.162512, 1, 0.7098039, 0, 1,
-1.222072, 0.08010121, -2.629538, 1, 0.7137255, 0, 1,
-1.221494, 0.3579859, -1.684918, 1, 0.7215686, 0, 1,
-1.218155, -0.7830702, -2.916863, 1, 0.7254902, 0, 1,
-1.212896, -0.6675203, -3.581949, 1, 0.7333333, 0, 1,
-1.211719, 0.9170637, -0.4775655, 1, 0.7372549, 0, 1,
-1.209122, 0.9787836, -0.6405379, 1, 0.7450981, 0, 1,
-1.203561, -0.1927038, -3.084593, 1, 0.7490196, 0, 1,
-1.202361, -0.5542639, -2.925594, 1, 0.7568628, 0, 1,
-1.18733, -1.878828, -3.95465, 1, 0.7607843, 0, 1,
-1.181477, 1.905533, 0.4251125, 1, 0.7686275, 0, 1,
-1.177825, 0.9501414, -0.1123257, 1, 0.772549, 0, 1,
-1.164672, -2.367019, -3.662117, 1, 0.7803922, 0, 1,
-1.160406, -0.2106789, -2.228477, 1, 0.7843137, 0, 1,
-1.142826, -0.2021039, -1.391144, 1, 0.7921569, 0, 1,
-1.131169, -1.487168, -3.141951, 1, 0.7960784, 0, 1,
-1.130517, -0.3278766, -0.3938549, 1, 0.8039216, 0, 1,
-1.126395, 0.5343994, -1.026657, 1, 0.8117647, 0, 1,
-1.125393, -0.05891281, -2.198248, 1, 0.8156863, 0, 1,
-1.108644, -0.8575333, -1.449266, 1, 0.8235294, 0, 1,
-1.105214, 0.1911849, 0.08451584, 1, 0.827451, 0, 1,
-1.104432, -0.4032723, -1.520498, 1, 0.8352941, 0, 1,
-1.101436, -1.134718, -0.3076078, 1, 0.8392157, 0, 1,
-1.092345, -0.481362, -2.307026, 1, 0.8470588, 0, 1,
-1.076901, 1.702755, 1.821214, 1, 0.8509804, 0, 1,
-1.076891, 0.4493452, -1.496223, 1, 0.8588235, 0, 1,
-1.074796, 0.407245, -1.918682, 1, 0.8627451, 0, 1,
-1.074465, -0.4051699, -3.410545, 1, 0.8705882, 0, 1,
-1.071045, -0.878118, -2.178223, 1, 0.8745098, 0, 1,
-1.066774, -0.2713324, -2.65769, 1, 0.8823529, 0, 1,
-1.063449, 1.401959, 1.507767, 1, 0.8862745, 0, 1,
-1.059035, -0.1176148, -4.782004, 1, 0.8941177, 0, 1,
-1.056629, -0.8425618, -0.7747374, 1, 0.8980392, 0, 1,
-1.055414, 2.239542, 0.7228846, 1, 0.9058824, 0, 1,
-1.054778, -1.871352, -2.341479, 1, 0.9137255, 0, 1,
-1.054007, 0.08102219, -0.9064682, 1, 0.9176471, 0, 1,
-1.053586, -1.84954, -1.701293, 1, 0.9254902, 0, 1,
-1.051368, 1.178885, 0.433561, 1, 0.9294118, 0, 1,
-1.045083, -0.03825491, -0.7337763, 1, 0.9372549, 0, 1,
-1.031222, 0.9146506, -1.064392, 1, 0.9411765, 0, 1,
-1.031087, 0.4528822, -3.097972, 1, 0.9490196, 0, 1,
-1.030297, -0.8060452, -2.074129, 1, 0.9529412, 0, 1,
-1.030125, 1.166372, -1.310712, 1, 0.9607843, 0, 1,
-1.028653, 0.4114134, 0.280127, 1, 0.9647059, 0, 1,
-1.028416, 0.4682471, -2.564781, 1, 0.972549, 0, 1,
-1.026639, 0.7839169, 0.1422536, 1, 0.9764706, 0, 1,
-1.021211, -0.8800855, -3.967052, 1, 0.9843137, 0, 1,
-1.020508, -0.2039554, 0.03528833, 1, 0.9882353, 0, 1,
-1.020459, -0.7957802, -1.594791, 1, 0.9960784, 0, 1,
-1.017623, -0.09401457, -3.862949, 0.9960784, 1, 0, 1,
-1.017357, 1.312538, -1.342136, 0.9921569, 1, 0, 1,
-1.012094, 0.6840661, -0.8428718, 0.9843137, 1, 0, 1,
-1.004271, -1.129869, -3.376225, 0.9803922, 1, 0, 1,
-1.001011, -0.8946679, -4.716154, 0.972549, 1, 0, 1,
-0.9947141, 1.97998, -2.561662, 0.9686275, 1, 0, 1,
-0.9910955, 0.04533133, -1.806132, 0.9607843, 1, 0, 1,
-0.9874254, 0.1107642, -2.316717, 0.9568627, 1, 0, 1,
-0.9872202, 0.683604, -0.04639937, 0.9490196, 1, 0, 1,
-0.9845026, 0.7472464, -2.759394, 0.945098, 1, 0, 1,
-0.9801502, 1.086582, -2.249746, 0.9372549, 1, 0, 1,
-0.9764146, -0.4107319, -1.423447, 0.9333333, 1, 0, 1,
-0.9744004, 0.2146415, -1.612492, 0.9254902, 1, 0, 1,
-0.9706314, -0.5987507, -3.141405, 0.9215686, 1, 0, 1,
-0.9659988, -1.282271, -1.324982, 0.9137255, 1, 0, 1,
-0.9528624, 1.558681, -0.9186417, 0.9098039, 1, 0, 1,
-0.9445061, 0.4654956, -1.885943, 0.9019608, 1, 0, 1,
-0.9291732, 0.1676692, -0.03183324, 0.8941177, 1, 0, 1,
-0.9266848, 0.376609, -0.8524249, 0.8901961, 1, 0, 1,
-0.921334, 1.22733, 1.144631, 0.8823529, 1, 0, 1,
-0.9143248, 0.321388, -2.364362, 0.8784314, 1, 0, 1,
-0.9137701, -1.233014, -4.931715, 0.8705882, 1, 0, 1,
-0.9068635, -0.09796891, -1.070736, 0.8666667, 1, 0, 1,
-0.9012763, -0.439276, -0.9200911, 0.8588235, 1, 0, 1,
-0.900565, -0.4363803, -1.147946, 0.854902, 1, 0, 1,
-0.8985146, -0.5935684, -2.540262, 0.8470588, 1, 0, 1,
-0.8955269, 1.617309, -1.339745, 0.8431373, 1, 0, 1,
-0.8925378, 0.2282191, -2.184493, 0.8352941, 1, 0, 1,
-0.8852579, 0.1617302, -4.169212, 0.8313726, 1, 0, 1,
-0.8828282, 1.570713, 0.3587258, 0.8235294, 1, 0, 1,
-0.8705534, 0.5734724, -1.30501, 0.8196079, 1, 0, 1,
-0.8705463, 0.182691, -0.879969, 0.8117647, 1, 0, 1,
-0.8701274, 0.06214323, 0.5234807, 0.8078431, 1, 0, 1,
-0.8661436, 1.24683, -0.05805631, 0.8, 1, 0, 1,
-0.8606749, -0.8100624, -2.070577, 0.7921569, 1, 0, 1,
-0.8583304, -0.6352075, -2.802918, 0.7882353, 1, 0, 1,
-0.8511349, -0.7314117, -4.240304, 0.7803922, 1, 0, 1,
-0.8476475, 0.1989406, -1.179446, 0.7764706, 1, 0, 1,
-0.8459756, -0.1805153, -1.107946, 0.7686275, 1, 0, 1,
-0.8458398, 0.1983167, -0.8787575, 0.7647059, 1, 0, 1,
-0.8457044, -0.1755923, -2.938321, 0.7568628, 1, 0, 1,
-0.8422356, 0.4414921, -0.6073663, 0.7529412, 1, 0, 1,
-0.8394892, -0.3393717, -1.285921, 0.7450981, 1, 0, 1,
-0.8260192, -0.5083428, -3.266891, 0.7411765, 1, 0, 1,
-0.8229433, 0.5596006, -0.4413302, 0.7333333, 1, 0, 1,
-0.8173625, -2.460397, -1.555758, 0.7294118, 1, 0, 1,
-0.8159088, 0.2872725, -0.3860516, 0.7215686, 1, 0, 1,
-0.8099468, 0.9862641, -0.696269, 0.7176471, 1, 0, 1,
-0.7962993, -1.117719, -1.772738, 0.7098039, 1, 0, 1,
-0.7926054, 0.3197729, -0.7465656, 0.7058824, 1, 0, 1,
-0.7914822, 0.6416631, -0.4478595, 0.6980392, 1, 0, 1,
-0.7897872, 1.588444, -0.8049101, 0.6901961, 1, 0, 1,
-0.789291, -0.9223844, -4.276521, 0.6862745, 1, 0, 1,
-0.7863099, -0.9026937, -2.973003, 0.6784314, 1, 0, 1,
-0.7833957, -0.2894233, -1.069801, 0.6745098, 1, 0, 1,
-0.7796563, 0.5739837, -1.098234, 0.6666667, 1, 0, 1,
-0.7773384, -0.1864127, -2.150487, 0.6627451, 1, 0, 1,
-0.7755262, -1.10377, -4.19599, 0.654902, 1, 0, 1,
-0.7745169, 0.5179598, -0.7711684, 0.6509804, 1, 0, 1,
-0.7736519, -1.500156, -3.32647, 0.6431373, 1, 0, 1,
-0.7626446, -1.913145, -3.007688, 0.6392157, 1, 0, 1,
-0.7596862, -1.013834, -2.505204, 0.6313726, 1, 0, 1,
-0.7567606, 0.6184008, 0.7031244, 0.627451, 1, 0, 1,
-0.7525818, 0.00461288, -1.654283, 0.6196079, 1, 0, 1,
-0.7459005, -0.5589899, -3.445588, 0.6156863, 1, 0, 1,
-0.74523, 0.506276, -1.347452, 0.6078432, 1, 0, 1,
-0.7449306, 0.3449731, 0.4206716, 0.6039216, 1, 0, 1,
-0.7389178, -0.4574766, -1.947851, 0.5960785, 1, 0, 1,
-0.7367949, -0.05665709, -2.300473, 0.5882353, 1, 0, 1,
-0.7351614, 1.685588, 0.7624186, 0.5843138, 1, 0, 1,
-0.7328977, 2.209916, 0.2957415, 0.5764706, 1, 0, 1,
-0.7293054, -2.12333, -2.716158, 0.572549, 1, 0, 1,
-0.7202989, -0.41352, -3.381426, 0.5647059, 1, 0, 1,
-0.7168412, -0.5448753, -2.339159, 0.5607843, 1, 0, 1,
-0.713861, -2.486219, -2.396138, 0.5529412, 1, 0, 1,
-0.7137955, 0.5444138, -0.4096406, 0.5490196, 1, 0, 1,
-0.708005, 1.464702, -2.437395, 0.5411765, 1, 0, 1,
-0.7013245, -1.191492, -4.312482, 0.5372549, 1, 0, 1,
-0.6977215, 1.307427, -0.8373083, 0.5294118, 1, 0, 1,
-0.6975246, -1.213714, -1.990552, 0.5254902, 1, 0, 1,
-0.6935729, 0.4826325, -1.517834, 0.5176471, 1, 0, 1,
-0.6929167, 1.708155, -0.648274, 0.5137255, 1, 0, 1,
-0.6926557, 0.4000121, -0.3266026, 0.5058824, 1, 0, 1,
-0.6925222, -0.2803071, -0.02560364, 0.5019608, 1, 0, 1,
-0.6921104, -0.2462487, -2.440684, 0.4941176, 1, 0, 1,
-0.6918158, -0.7294367, -1.549597, 0.4862745, 1, 0, 1,
-0.6875448, 1.234414, 1.296346, 0.4823529, 1, 0, 1,
-0.6870413, 0.1135626, -1.822788, 0.4745098, 1, 0, 1,
-0.6844149, 0.8665414, -0.4539033, 0.4705882, 1, 0, 1,
-0.6834955, -1.220702, -3.96028, 0.4627451, 1, 0, 1,
-0.6831527, 0.3398757, -2.230098, 0.4588235, 1, 0, 1,
-0.6809773, -0.9911363, -2.55018, 0.4509804, 1, 0, 1,
-0.6780908, -0.4305329, -0.8067238, 0.4470588, 1, 0, 1,
-0.6745194, 1.446944, 0.8691179, 0.4392157, 1, 0, 1,
-0.6606561, 0.1004583, -0.7238403, 0.4352941, 1, 0, 1,
-0.6605983, -0.896195, -0.5434265, 0.427451, 1, 0, 1,
-0.6591409, 0.2179578, -0.9568482, 0.4235294, 1, 0, 1,
-0.6575989, 0.6342683, 0.837423, 0.4156863, 1, 0, 1,
-0.656242, 0.4404301, -2.022746, 0.4117647, 1, 0, 1,
-0.6480854, 0.4235578, -2.538576, 0.4039216, 1, 0, 1,
-0.6448838, 0.07305961, -2.811843, 0.3960784, 1, 0, 1,
-0.6434921, -1.251626, -3.565794, 0.3921569, 1, 0, 1,
-0.6394685, -0.8001202, -0.8597841, 0.3843137, 1, 0, 1,
-0.6334, 0.7444926, -0.09176865, 0.3803922, 1, 0, 1,
-0.6331034, 1.098637, -0.0839236, 0.372549, 1, 0, 1,
-0.6189539, 0.5669926, -3.190517, 0.3686275, 1, 0, 1,
-0.6158825, -1.586464, -2.705883, 0.3607843, 1, 0, 1,
-0.6140646, -1.470297, -3.253135, 0.3568628, 1, 0, 1,
-0.612327, -0.02093045, -0.8811449, 0.3490196, 1, 0, 1,
-0.6118816, -0.3068045, -2.296596, 0.345098, 1, 0, 1,
-0.6047811, -2.324195, -1.511685, 0.3372549, 1, 0, 1,
-0.6028131, 0.03048754, -2.503345, 0.3333333, 1, 0, 1,
-0.6022083, 2.033018, 1.364491, 0.3254902, 1, 0, 1,
-0.5989624, -1.814355, -3.619865, 0.3215686, 1, 0, 1,
-0.5975951, -0.1655486, -2.884637, 0.3137255, 1, 0, 1,
-0.5935451, 0.6306571, -0.1727745, 0.3098039, 1, 0, 1,
-0.5923265, -0.8048769, -1.27154, 0.3019608, 1, 0, 1,
-0.5908939, -1.17966, -2.787506, 0.2941177, 1, 0, 1,
-0.5874196, -0.6525243, -0.3910348, 0.2901961, 1, 0, 1,
-0.5866404, -1.20741, -5.524845, 0.282353, 1, 0, 1,
-0.5841928, 0.1333122, -2.553998, 0.2784314, 1, 0, 1,
-0.5819898, -0.1105478, -0.5469888, 0.2705882, 1, 0, 1,
-0.5815007, 0.05450102, -1.958275, 0.2666667, 1, 0, 1,
-0.5794778, 0.1632108, -1.359629, 0.2588235, 1, 0, 1,
-0.5785259, 0.7320912, -1.6041, 0.254902, 1, 0, 1,
-0.572742, 0.3108185, -0.5101464, 0.2470588, 1, 0, 1,
-0.5715572, 1.323571, -1.917839, 0.2431373, 1, 0, 1,
-0.5672415, 0.3070317, -2.310806, 0.2352941, 1, 0, 1,
-0.5665885, 0.6400903, -0.06710727, 0.2313726, 1, 0, 1,
-0.5635242, 0.6392584, 0.4323253, 0.2235294, 1, 0, 1,
-0.5616865, 0.212189, -0.1635598, 0.2196078, 1, 0, 1,
-0.5611934, -0.5112484, -3.379182, 0.2117647, 1, 0, 1,
-0.5596799, 0.4115679, -0.9086149, 0.2078431, 1, 0, 1,
-0.5512857, -0.05643927, -0.2778753, 0.2, 1, 0, 1,
-0.5488284, -1.781285, -2.939546, 0.1921569, 1, 0, 1,
-0.5469334, 0.958281, -1.326107, 0.1882353, 1, 0, 1,
-0.5424357, 0.9292302, 1.779167, 0.1803922, 1, 0, 1,
-0.5304403, 0.1248201, -0.04592833, 0.1764706, 1, 0, 1,
-0.5246577, -0.3720564, 0.1193806, 0.1686275, 1, 0, 1,
-0.5220864, -0.0120739, 0.6432472, 0.1647059, 1, 0, 1,
-0.5179569, 1.219811, -1.163867, 0.1568628, 1, 0, 1,
-0.5164485, 1.94232, -0.2825722, 0.1529412, 1, 0, 1,
-0.5152211, 0.2928893, -0.9594264, 0.145098, 1, 0, 1,
-0.5145755, 0.0909161, -2.719805, 0.1411765, 1, 0, 1,
-0.5137373, 0.02241839, -2.011545, 0.1333333, 1, 0, 1,
-0.5135998, 1.599486, 1.392767, 0.1294118, 1, 0, 1,
-0.5122811, 0.6224951, 0.6180742, 0.1215686, 1, 0, 1,
-0.5121858, -1.168202, -4.2923, 0.1176471, 1, 0, 1,
-0.5121671, 1.60936, 1.103705, 0.1098039, 1, 0, 1,
-0.5116618, -0.1809146, -2.095385, 0.1058824, 1, 0, 1,
-0.5115919, 0.7717632, 0.7151067, 0.09803922, 1, 0, 1,
-0.5079503, -0.8184301, -1.487004, 0.09019608, 1, 0, 1,
-0.5071716, 0.9942825, -0.3324252, 0.08627451, 1, 0, 1,
-0.5053993, 0.1033643, -1.251996, 0.07843138, 1, 0, 1,
-0.5020105, -0.5272771, -3.298331, 0.07450981, 1, 0, 1,
-0.501562, -1.79684, -2.41333, 0.06666667, 1, 0, 1,
-0.4819375, -0.6615929, -2.635868, 0.0627451, 1, 0, 1,
-0.4801018, -0.4992256, -3.464676, 0.05490196, 1, 0, 1,
-0.4762721, -2.341883, -3.438491, 0.05098039, 1, 0, 1,
-0.4716025, -0.7992489, -1.642787, 0.04313726, 1, 0, 1,
-0.4677598, -0.1562372, -0.4560006, 0.03921569, 1, 0, 1,
-0.4667155, -0.6595991, -2.279179, 0.03137255, 1, 0, 1,
-0.4631956, -0.01929677, -2.902235, 0.02745098, 1, 0, 1,
-0.4599926, 0.9052561, -0.3848005, 0.01960784, 1, 0, 1,
-0.455626, 1.038957, -1.026109, 0.01568628, 1, 0, 1,
-0.4555977, -0.1389763, -0.314052, 0.007843138, 1, 0, 1,
-0.4522667, -0.8443506, -2.724092, 0.003921569, 1, 0, 1,
-0.4424704, -0.4852186, -3.134789, 0, 1, 0.003921569, 1,
-0.4420138, 0.4933511, 0.005945258, 0, 1, 0.01176471, 1,
-0.4357383, -1.676381, -4.69293, 0, 1, 0.01568628, 1,
-0.4299943, 0.4114752, -0.3167388, 0, 1, 0.02352941, 1,
-0.4257868, -1.213273, -1.891653, 0, 1, 0.02745098, 1,
-0.4250524, 0.7513818, 0.3741693, 0, 1, 0.03529412, 1,
-0.4205857, 0.1825953, -1.890309, 0, 1, 0.03921569, 1,
-0.4204255, -0.272211, -3.364043, 0, 1, 0.04705882, 1,
-0.4155902, 0.2996691, -0.4272083, 0, 1, 0.05098039, 1,
-0.4124699, 0.2092308, -1.351606, 0, 1, 0.05882353, 1,
-0.412112, 0.5709653, -0.1005076, 0, 1, 0.0627451, 1,
-0.409162, 0.3440709, -1.442575, 0, 1, 0.07058824, 1,
-0.4059489, -0.01109617, -0.9025372, 0, 1, 0.07450981, 1,
-0.4018381, 1.334058, 0.3098897, 0, 1, 0.08235294, 1,
-0.4007354, 0.004575619, -2.443209, 0, 1, 0.08627451, 1,
-0.399726, 0.0426451, -1.77861, 0, 1, 0.09411765, 1,
-0.3994666, -0.9998246, -1.187775, 0, 1, 0.1019608, 1,
-0.3919526, -0.5979647, -4.877702, 0, 1, 0.1058824, 1,
-0.3834836, -0.4852986, -0.8373922, 0, 1, 0.1137255, 1,
-0.3833887, -0.3741066, -2.672296, 0, 1, 0.1176471, 1,
-0.3833862, 0.586129, -0.9738664, 0, 1, 0.1254902, 1,
-0.3817425, 0.07682577, -1.85461, 0, 1, 0.1294118, 1,
-0.3799721, -0.9715272, -2.680658, 0, 1, 0.1372549, 1,
-0.3777402, 0.3474446, -0.08672994, 0, 1, 0.1411765, 1,
-0.3775515, 0.7448279, -0.2208854, 0, 1, 0.1490196, 1,
-0.37725, -0.04094817, -2.475796, 0, 1, 0.1529412, 1,
-0.3767059, -1.815937, -2.7146, 0, 1, 0.1607843, 1,
-0.3766216, -0.1183231, -1.852427, 0, 1, 0.1647059, 1,
-0.374602, -2.248539, -2.465545, 0, 1, 0.172549, 1,
-0.3723243, 0.4052691, -1.4658, 0, 1, 0.1764706, 1,
-0.3605518, 0.8302653, 1.143535, 0, 1, 0.1843137, 1,
-0.3595273, -1.636789, -3.265844, 0, 1, 0.1882353, 1,
-0.3547119, -0.4092457, -2.105369, 0, 1, 0.1960784, 1,
-0.3430412, 0.8642146, -0.6561639, 0, 1, 0.2039216, 1,
-0.3409579, -0.40843, -2.653739, 0, 1, 0.2078431, 1,
-0.3408428, 0.627821, -0.07460223, 0, 1, 0.2156863, 1,
-0.3387439, 0.4125869, -0.7642196, 0, 1, 0.2196078, 1,
-0.3327828, 0.3579375, -0.8369091, 0, 1, 0.227451, 1,
-0.3269123, 1.787194, 0.2687958, 0, 1, 0.2313726, 1,
-0.3233364, 0.335851, -0.8187322, 0, 1, 0.2392157, 1,
-0.3205956, 0.5223032, 0.9161824, 0, 1, 0.2431373, 1,
-0.31826, 0.2405622, -1.250166, 0, 1, 0.2509804, 1,
-0.3169059, 0.4716797, -0.8273558, 0, 1, 0.254902, 1,
-0.314198, -0.9735403, -1.46038, 0, 1, 0.2627451, 1,
-0.3102686, 0.06771417, -0.4335052, 0, 1, 0.2666667, 1,
-0.3081666, -0.2228688, -1.562077, 0, 1, 0.2745098, 1,
-0.2937582, 1.67319, 0.4135246, 0, 1, 0.2784314, 1,
-0.2814139, -1.288571, -0.3725989, 0, 1, 0.2862745, 1,
-0.2801047, 0.9186016, -0.7611158, 0, 1, 0.2901961, 1,
-0.2788396, 1.466552, 2.616309, 0, 1, 0.2980392, 1,
-0.2641485, -1.897975, -3.197668, 0, 1, 0.3058824, 1,
-0.2563203, 0.7199271, 0.2264595, 0, 1, 0.3098039, 1,
-0.2481155, -0.0841078, -2.074805, 0, 1, 0.3176471, 1,
-0.2461365, 1.271685, 0.977502, 0, 1, 0.3215686, 1,
-0.2455597, -0.6794452, -5.432793, 0, 1, 0.3294118, 1,
-0.2427416, 0.6592273, -1.364907, 0, 1, 0.3333333, 1,
-0.2416658, 1.181753, -0.3977255, 0, 1, 0.3411765, 1,
-0.2416377, -0.1315893, -2.524337, 0, 1, 0.345098, 1,
-0.2401556, 0.4943186, 0.1171669, 0, 1, 0.3529412, 1,
-0.2213768, -0.3461134, -2.449744, 0, 1, 0.3568628, 1,
-0.2198335, 0.3702957, 0.7321348, 0, 1, 0.3647059, 1,
-0.2177721, 0.9198787, -1.328419, 0, 1, 0.3686275, 1,
-0.2167019, -0.2225036, -2.136697, 0, 1, 0.3764706, 1,
-0.2149291, -0.8084332, -5.088348, 0, 1, 0.3803922, 1,
-0.2140587, 1.388769, 0.08963455, 0, 1, 0.3882353, 1,
-0.2103783, -0.2967478, -2.799128, 0, 1, 0.3921569, 1,
-0.2100407, 0.5569481, 0.3108627, 0, 1, 0.4, 1,
-0.2062177, -1.827042, -3.0492, 0, 1, 0.4078431, 1,
-0.2060082, 2.798973, -0.2439173, 0, 1, 0.4117647, 1,
-0.2037434, 0.5683653, 0.1072779, 0, 1, 0.4196078, 1,
-0.1966569, 0.04303672, -2.007224, 0, 1, 0.4235294, 1,
-0.1952209, 0.1033526, -1.903939, 0, 1, 0.4313726, 1,
-0.1910467, 0.2033123, -3.818796, 0, 1, 0.4352941, 1,
-0.1868084, -0.6887412, -3.491239, 0, 1, 0.4431373, 1,
-0.1861307, -0.153584, -2.390935, 0, 1, 0.4470588, 1,
-0.1859462, 0.1407349, -1.206675, 0, 1, 0.454902, 1,
-0.1850262, -0.02226553, -1.57633, 0, 1, 0.4588235, 1,
-0.1830211, -0.8187515, -3.922151, 0, 1, 0.4666667, 1,
-0.1827473, -0.7245924, -2.00837, 0, 1, 0.4705882, 1,
-0.1797663, -0.9156699, -2.657493, 0, 1, 0.4784314, 1,
-0.1785829, -0.1466109, -2.868683, 0, 1, 0.4823529, 1,
-0.1785206, -0.1766429, -3.596651, 0, 1, 0.4901961, 1,
-0.1760931, 1.296502, -0.6493118, 0, 1, 0.4941176, 1,
-0.1700604, -0.5538204, -0.5067248, 0, 1, 0.5019608, 1,
-0.1691586, 0.04041122, -2.427881, 0, 1, 0.509804, 1,
-0.1666048, 0.4332896, -2.242255, 0, 1, 0.5137255, 1,
-0.1659667, -0.4202791, -2.176142, 0, 1, 0.5215687, 1,
-0.1650106, -0.04565287, -1.244071, 0, 1, 0.5254902, 1,
-0.1594504, -1.695056, -1.228462, 0, 1, 0.5333334, 1,
-0.1593536, 0.01042009, -0.6228037, 0, 1, 0.5372549, 1,
-0.159061, 1.702118, 2.187938, 0, 1, 0.5450981, 1,
-0.1588778, 0.7690498, -1.399684, 0, 1, 0.5490196, 1,
-0.1540699, 0.570347, -0.2936277, 0, 1, 0.5568628, 1,
-0.1540484, 1.003497, -0.4304794, 0, 1, 0.5607843, 1,
-0.1540464, 1.106496, -1.073541, 0, 1, 0.5686275, 1,
-0.1518433, 0.1675697, -0.04661049, 0, 1, 0.572549, 1,
-0.1480624, 0.7131548, 0.6865203, 0, 1, 0.5803922, 1,
-0.145485, -0.4182362, -1.886007, 0, 1, 0.5843138, 1,
-0.1443734, -0.1007581, -0.9666325, 0, 1, 0.5921569, 1,
-0.1404301, -0.9992775, -3.524673, 0, 1, 0.5960785, 1,
-0.139624, 0.07653238, -1.722174, 0, 1, 0.6039216, 1,
-0.1376609, 0.08287321, -0.7688068, 0, 1, 0.6117647, 1,
-0.1366039, 1.243154, -0.4478181, 0, 1, 0.6156863, 1,
-0.132484, 1.664015, 0.8270396, 0, 1, 0.6235294, 1,
-0.1309918, 1.287065, 0.3456763, 0, 1, 0.627451, 1,
-0.1257506, -0.5151711, -2.396571, 0, 1, 0.6352941, 1,
-0.1251369, 1.01681, 0.04468425, 0, 1, 0.6392157, 1,
-0.1237065, -0.04473635, -2.214883, 0, 1, 0.6470588, 1,
-0.1197696, -1.307562, -3.150015, 0, 1, 0.6509804, 1,
-0.1183459, -0.3108414, -3.216446, 0, 1, 0.6588235, 1,
-0.1162948, -0.05821237, -1.91752, 0, 1, 0.6627451, 1,
-0.1144311, 0.5238935, 0.3447497, 0, 1, 0.6705883, 1,
-0.1104656, -1.371383, -2.328311, 0, 1, 0.6745098, 1,
-0.1078733, 0.6387253, -0.06397666, 0, 1, 0.682353, 1,
-0.1066209, -0.05325934, -2.505645, 0, 1, 0.6862745, 1,
-0.1021452, -0.5333934, -2.524215, 0, 1, 0.6941177, 1,
-0.09733074, -1.166033, -2.230824, 0, 1, 0.7019608, 1,
-0.0971292, 0.2638412, -1.037506, 0, 1, 0.7058824, 1,
-0.09692281, 0.1437893, -0.362697, 0, 1, 0.7137255, 1,
-0.09516156, 0.7607049, -0.9095215, 0, 1, 0.7176471, 1,
-0.09132794, -1.054246, -2.845349, 0, 1, 0.7254902, 1,
-0.09054285, -2.32, -2.488935, 0, 1, 0.7294118, 1,
-0.08994012, 0.5430612, 0.6777435, 0, 1, 0.7372549, 1,
-0.08958369, -1.049655, -5.16414, 0, 1, 0.7411765, 1,
-0.08937455, 0.692539, 1.112488, 0, 1, 0.7490196, 1,
-0.08296669, 0.796992, -0.4047494, 0, 1, 0.7529412, 1,
-0.08180995, -1.173571, -2.525996, 0, 1, 0.7607843, 1,
-0.07943951, 0.9487797, -0.7306831, 0, 1, 0.7647059, 1,
-0.0749882, -0.6668451, -0.8280439, 0, 1, 0.772549, 1,
-0.07391128, 1.250242, -1.39109, 0, 1, 0.7764706, 1,
-0.07345971, -0.4769279, -1.89802, 0, 1, 0.7843137, 1,
-0.07099631, 0.1348309, 1.513363, 0, 1, 0.7882353, 1,
-0.07090164, 0.7548978, -0.9812517, 0, 1, 0.7960784, 1,
-0.07066216, 0.2740498, -0.0906138, 0, 1, 0.8039216, 1,
-0.06931091, -1.582292, -4.728834, 0, 1, 0.8078431, 1,
-0.06921753, 0.8555048, 1.102348, 0, 1, 0.8156863, 1,
-0.06834431, 1.733174, 0.1700665, 0, 1, 0.8196079, 1,
-0.06510039, -0.2521622, -4.031928, 0, 1, 0.827451, 1,
-0.06416012, 0.5242183, -0.2914004, 0, 1, 0.8313726, 1,
-0.06124505, 2.304339, 0.4888424, 0, 1, 0.8392157, 1,
-0.05687354, 0.3063728, -0.02321417, 0, 1, 0.8431373, 1,
-0.05444079, 1.580071, -0.2505869, 0, 1, 0.8509804, 1,
-0.05248471, 0.5434131, -0.2833705, 0, 1, 0.854902, 1,
-0.05102744, 0.03770079, -1.283799, 0, 1, 0.8627451, 1,
-0.04750083, -2.030336, -4.446136, 0, 1, 0.8666667, 1,
-0.0437614, -0.5080886, -1.926695, 0, 1, 0.8745098, 1,
-0.04323549, -2.230383, -3.071026, 0, 1, 0.8784314, 1,
-0.03957418, 0.09468886, -0.6150131, 0, 1, 0.8862745, 1,
-0.03543098, -0.535814, -3.961716, 0, 1, 0.8901961, 1,
-0.03488824, -0.2502048, -2.429204, 0, 1, 0.8980392, 1,
-0.03412064, -0.07982242, -2.503182, 0, 1, 0.9058824, 1,
-0.03118311, -0.4755777, -3.077608, 0, 1, 0.9098039, 1,
-0.02813444, -0.06094214, -3.066083, 0, 1, 0.9176471, 1,
-0.02674213, -0.4257038, -3.96964, 0, 1, 0.9215686, 1,
-0.02138893, -1.070668, -3.907803, 0, 1, 0.9294118, 1,
-0.01744106, -0.5967357, -3.821702, 0, 1, 0.9333333, 1,
-0.01714771, -1.28194, -2.501196, 0, 1, 0.9411765, 1,
-0.01617867, -0.1270927, -2.209766, 0, 1, 0.945098, 1,
-0.01099857, -1.754177, -3.102513, 0, 1, 0.9529412, 1,
-0.005530628, 0.1434711, -0.4663933, 0, 1, 0.9568627, 1,
-0.004826502, -0.004812349, -1.600326, 0, 1, 0.9647059, 1,
-0.003952906, 1.416288, 1.269101, 0, 1, 0.9686275, 1,
0.001580752, -0.6724626, 3.785212, 0, 1, 0.9764706, 1,
0.001686326, -0.7983556, 3.386524, 0, 1, 0.9803922, 1,
0.001841845, 0.4745074, 0.5472318, 0, 1, 0.9882353, 1,
0.006389813, -0.02090198, 2.022274, 0, 1, 0.9921569, 1,
0.007728671, 0.7450258, -1.766128, 0, 1, 1, 1,
0.009154578, 0.6513315, 1.19941, 0, 0.9921569, 1, 1,
0.009628011, 1.713663, 0.1161111, 0, 0.9882353, 1, 1,
0.01309966, 1.715006, -0.3480229, 0, 0.9803922, 1, 1,
0.01377428, -1.43425, 2.475164, 0, 0.9764706, 1, 1,
0.01379436, -2.078012, 2.56897, 0, 0.9686275, 1, 1,
0.01628154, -1.246624, 3.045661, 0, 0.9647059, 1, 1,
0.01726491, -0.6510676, 4.472431, 0, 0.9568627, 1, 1,
0.02189418, 0.6382483, 1.022037, 0, 0.9529412, 1, 1,
0.02804851, 1.07383, -0.008151444, 0, 0.945098, 1, 1,
0.03899452, 0.5841863, 0.130759, 0, 0.9411765, 1, 1,
0.03960557, 0.3845256, 0.0372929, 0, 0.9333333, 1, 1,
0.04240417, -1.263183, 3.691139, 0, 0.9294118, 1, 1,
0.05932546, -0.4574933, 2.160113, 0, 0.9215686, 1, 1,
0.06048841, -0.009781126, -0.2189837, 0, 0.9176471, 1, 1,
0.06226759, -0.005888714, 0.9796194, 0, 0.9098039, 1, 1,
0.06584083, 0.786829, 1.245978, 0, 0.9058824, 1, 1,
0.06802836, 0.04590486, 2.727395, 0, 0.8980392, 1, 1,
0.07148429, -0.7199239, 2.877474, 0, 0.8901961, 1, 1,
0.07668493, 0.9317951, -2.197524, 0, 0.8862745, 1, 1,
0.07764211, 0.04256205, 0.9298105, 0, 0.8784314, 1, 1,
0.07972281, 1.488921, -1.982625, 0, 0.8745098, 1, 1,
0.08376592, 1.59322, 1.278751, 0, 0.8666667, 1, 1,
0.08399009, -1.080683, 3.022114, 0, 0.8627451, 1, 1,
0.08424079, 1.95591, 0.2087267, 0, 0.854902, 1, 1,
0.08549058, 0.2317012, 1.073938, 0, 0.8509804, 1, 1,
0.08788092, -1.888076, 2.969763, 0, 0.8431373, 1, 1,
0.09158837, -1.818463, 2.192589, 0, 0.8392157, 1, 1,
0.09188945, 0.7531246, -0.3396686, 0, 0.8313726, 1, 1,
0.09450089, -0.05678069, 3.425138, 0, 0.827451, 1, 1,
0.09457457, 0.03820671, 2.930762, 0, 0.8196079, 1, 1,
0.09810906, 0.7809473, -1.210553, 0, 0.8156863, 1, 1,
0.1024859, 0.6473438, -0.3898307, 0, 0.8078431, 1, 1,
0.1029647, 0.3001228, -1.306037, 0, 0.8039216, 1, 1,
0.1059099, 0.6967515, -0.7410221, 0, 0.7960784, 1, 1,
0.1066564, 1.20203, 1.374224, 0, 0.7882353, 1, 1,
0.1068553, 0.6383196, 0.63714, 0, 0.7843137, 1, 1,
0.1071801, -0.3633841, 1.188262, 0, 0.7764706, 1, 1,
0.1123881, 0.1732847, -1.814129, 0, 0.772549, 1, 1,
0.1168185, -1.016899, 2.228265, 0, 0.7647059, 1, 1,
0.1168842, -1.170723, 3.057162, 0, 0.7607843, 1, 1,
0.1198521, 0.8407948, -0.9065693, 0, 0.7529412, 1, 1,
0.1244636, -0.2625324, 2.208377, 0, 0.7490196, 1, 1,
0.1248246, -0.3106184, 4.620355, 0, 0.7411765, 1, 1,
0.1302907, -0.8834437, 3.147474, 0, 0.7372549, 1, 1,
0.1318504, 1.594558, -0.4191014, 0, 0.7294118, 1, 1,
0.1324961, 0.6363915, -0.3546264, 0, 0.7254902, 1, 1,
0.1330624, 0.8259132, 0.1059539, 0, 0.7176471, 1, 1,
0.1343701, 1.527525, 1.095041, 0, 0.7137255, 1, 1,
0.1392111, 0.7743642, 0.1678661, 0, 0.7058824, 1, 1,
0.1475992, -0.786245, 3.030288, 0, 0.6980392, 1, 1,
0.1481522, -0.7454468, 1.857452, 0, 0.6941177, 1, 1,
0.1504958, 0.7644472, 0.2776746, 0, 0.6862745, 1, 1,
0.1505366, -0.6114628, 4.17329, 0, 0.682353, 1, 1,
0.1527712, 1.476593, 1.2389, 0, 0.6745098, 1, 1,
0.1532273, 0.4668422, 0.4362328, 0, 0.6705883, 1, 1,
0.1545025, 0.01053777, 2.063157, 0, 0.6627451, 1, 1,
0.1547774, -2.273029, 4.355233, 0, 0.6588235, 1, 1,
0.1588916, 2.319603, 0.2817213, 0, 0.6509804, 1, 1,
0.1594443, -0.508707, 2.313672, 0, 0.6470588, 1, 1,
0.1609413, -0.3323724, 1.39349, 0, 0.6392157, 1, 1,
0.1610088, 0.8823205, -0.4241571, 0, 0.6352941, 1, 1,
0.1625809, 1.553182, 0.5583038, 0, 0.627451, 1, 1,
0.1643916, -0.1171891, 2.873032, 0, 0.6235294, 1, 1,
0.1668304, -1.214025, 2.48832, 0, 0.6156863, 1, 1,
0.1736564, -0.6573287, 3.252023, 0, 0.6117647, 1, 1,
0.1741828, -0.3338422, 1.323941, 0, 0.6039216, 1, 1,
0.1745603, -1.945558, 3.411502, 0, 0.5960785, 1, 1,
0.1779967, -0.9201084, 0.5471855, 0, 0.5921569, 1, 1,
0.1887672, -0.4975256, 3.841036, 0, 0.5843138, 1, 1,
0.1902725, -0.9029787, 2.20115, 0, 0.5803922, 1, 1,
0.1914599, 1.096701, 0.2031508, 0, 0.572549, 1, 1,
0.1919087, 1.153808, -0.7814623, 0, 0.5686275, 1, 1,
0.1927278, 0.02757282, 3.469625, 0, 0.5607843, 1, 1,
0.1931423, -0.1465238, 2.006136, 0, 0.5568628, 1, 1,
0.1947516, 0.5448451, 0.4204604, 0, 0.5490196, 1, 1,
0.2001445, -2.621741, 1.913269, 0, 0.5450981, 1, 1,
0.2005426, -0.2890195, 2.06411, 0, 0.5372549, 1, 1,
0.2025006, -0.6192034, 3.268272, 0, 0.5333334, 1, 1,
0.2071177, -1.353232, 3.236025, 0, 0.5254902, 1, 1,
0.2075592, 0.7741442, -0.3660106, 0, 0.5215687, 1, 1,
0.2077409, 2.044089, -0.6955827, 0, 0.5137255, 1, 1,
0.2114564, -0.3052547, 1.391376, 0, 0.509804, 1, 1,
0.2118205, 1.379034, 0.3575474, 0, 0.5019608, 1, 1,
0.2159658, -0.2205509, 3.373265, 0, 0.4941176, 1, 1,
0.2195105, 0.1333261, 1.05824, 0, 0.4901961, 1, 1,
0.2211068, -1.276853, 1.514588, 0, 0.4823529, 1, 1,
0.2251618, 1.320221, 0.03703527, 0, 0.4784314, 1, 1,
0.2253741, -0.9278615, 2.930662, 0, 0.4705882, 1, 1,
0.2262016, -0.08181807, 3.237738, 0, 0.4666667, 1, 1,
0.2284426, -2.716471, 3.980125, 0, 0.4588235, 1, 1,
0.2367366, -0.9608942, 3.931996, 0, 0.454902, 1, 1,
0.2379908, 0.6437616, -1.212325, 0, 0.4470588, 1, 1,
0.2383094, 1.064708, -0.6613321, 0, 0.4431373, 1, 1,
0.2400351, 1.24388, 0.3540324, 0, 0.4352941, 1, 1,
0.2412474, -0.5273904, 3.638726, 0, 0.4313726, 1, 1,
0.2475854, 0.5836428, 1.978683, 0, 0.4235294, 1, 1,
0.24953, 1.29011, -0.2379588, 0, 0.4196078, 1, 1,
0.2515783, 0.02695961, 2.414486, 0, 0.4117647, 1, 1,
0.252587, -0.4875492, 2.33274, 0, 0.4078431, 1, 1,
0.2530763, 0.9017709, -0.9541625, 0, 0.4, 1, 1,
0.2537445, -0.6181393, 3.936455, 0, 0.3921569, 1, 1,
0.2543042, -1.144459, 3.717945, 0, 0.3882353, 1, 1,
0.2560476, -0.5302435, 2.752788, 0, 0.3803922, 1, 1,
0.2611634, 0.2501592, -0.902802, 0, 0.3764706, 1, 1,
0.2626667, -0.6331265, 5.107658, 0, 0.3686275, 1, 1,
0.2634573, -0.4992656, 3.717278, 0, 0.3647059, 1, 1,
0.2733402, -1.048037, 3.488852, 0, 0.3568628, 1, 1,
0.2738504, -0.02390507, 0.4530897, 0, 0.3529412, 1, 1,
0.27881, 0.5290849, -2.10899, 0, 0.345098, 1, 1,
0.2808894, 1.115575, 0.7828075, 0, 0.3411765, 1, 1,
0.2834637, 1.850186, 1.369732, 0, 0.3333333, 1, 1,
0.2841595, 0.6443309, 0.6135857, 0, 0.3294118, 1, 1,
0.2860831, -1.800859, 1.226952, 0, 0.3215686, 1, 1,
0.290545, 0.2692041, 0.3982881, 0, 0.3176471, 1, 1,
0.2917405, 1.096316, -0.02831714, 0, 0.3098039, 1, 1,
0.298066, -0.06634969, 0.2101748, 0, 0.3058824, 1, 1,
0.2998946, 1.658793, 0.8153973, 0, 0.2980392, 1, 1,
0.3033262, 1.124467, 1.3726, 0, 0.2901961, 1, 1,
0.3040271, -0.1783156, 2.382638, 0, 0.2862745, 1, 1,
0.3043728, 0.8370351, -1.621884, 0, 0.2784314, 1, 1,
0.3086997, 0.878581, 0.3923643, 0, 0.2745098, 1, 1,
0.3158183, -0.2384763, 2.314495, 0, 0.2666667, 1, 1,
0.3163535, 0.2822159, 2.4016, 0, 0.2627451, 1, 1,
0.3176692, 1.279647, -1.714346, 0, 0.254902, 1, 1,
0.3192486, 1.124795, -0.1041018, 0, 0.2509804, 1, 1,
0.3197221, 1.32712, 1.421376, 0, 0.2431373, 1, 1,
0.3254361, -2.099664, 2.534979, 0, 0.2392157, 1, 1,
0.3258854, -0.1552898, 1.749778, 0, 0.2313726, 1, 1,
0.3333418, 0.2617401, 0.7451446, 0, 0.227451, 1, 1,
0.3359599, 0.4608432, 0.2216874, 0, 0.2196078, 1, 1,
0.3364086, 1.106125, 1.335391, 0, 0.2156863, 1, 1,
0.3386047, -0.7572741, 3.334365, 0, 0.2078431, 1, 1,
0.3394316, -0.3552784, 1.806123, 0, 0.2039216, 1, 1,
0.3406534, -0.1216621, 1.231445, 0, 0.1960784, 1, 1,
0.3407663, -0.6161942, 3.899008, 0, 0.1882353, 1, 1,
0.3420664, -0.06928931, 0.5290456, 0, 0.1843137, 1, 1,
0.3451026, 0.460638, 0.8034843, 0, 0.1764706, 1, 1,
0.3469541, 2.01991, 0.676653, 0, 0.172549, 1, 1,
0.3485013, 0.7564476, -1.242386, 0, 0.1647059, 1, 1,
0.3500359, 0.6356301, 0.6070628, 0, 0.1607843, 1, 1,
0.3510213, -1.345958, 3.683474, 0, 0.1529412, 1, 1,
0.3527161, 0.9390675, -0.9134028, 0, 0.1490196, 1, 1,
0.3532301, 0.6980814, 1.676562, 0, 0.1411765, 1, 1,
0.355242, -0.8667616, 1.96533, 0, 0.1372549, 1, 1,
0.3556831, 0.4720626, 2.718289, 0, 0.1294118, 1, 1,
0.359806, -0.05484185, 2.541623, 0, 0.1254902, 1, 1,
0.3603736, -0.6532385, 1.82767, 0, 0.1176471, 1, 1,
0.3656386, -0.1913872, 1.845095, 0, 0.1137255, 1, 1,
0.3661134, -0.2375421, 2.246053, 0, 0.1058824, 1, 1,
0.3676862, -0.04421823, 1.998565, 0, 0.09803922, 1, 1,
0.373765, 1.40371, -0.2645583, 0, 0.09411765, 1, 1,
0.3764651, 3.61524, -1.898784, 0, 0.08627451, 1, 1,
0.3795474, 0.7519147, -0.8250256, 0, 0.08235294, 1, 1,
0.3804553, -0.58791, 3.432035, 0, 0.07450981, 1, 1,
0.3823422, -1.26801, 2.830963, 0, 0.07058824, 1, 1,
0.3848285, 0.2767954, 1.199628, 0, 0.0627451, 1, 1,
0.3903942, -0.002445829, 3.066857, 0, 0.05882353, 1, 1,
0.3911859, 2.030189, -0.1334589, 0, 0.05098039, 1, 1,
0.3917494, -0.2167681, 0.833979, 0, 0.04705882, 1, 1,
0.392423, 1.5841, 0.0023684, 0, 0.03921569, 1, 1,
0.3980584, -2.698616, 2.583245, 0, 0.03529412, 1, 1,
0.4009939, -0.7454824, 2.749897, 0, 0.02745098, 1, 1,
0.4119775, -0.5630218, 1.548967, 0, 0.02352941, 1, 1,
0.4137936, 0.2232717, 1.755249, 0, 0.01568628, 1, 1,
0.4157558, 1.054024, 0.2618215, 0, 0.01176471, 1, 1,
0.4166456, 0.8092361, 1.416963, 0, 0.003921569, 1, 1,
0.4220598, -1.238996, 3.463881, 0.003921569, 0, 1, 1,
0.4231785, -0.284217, 2.381543, 0.007843138, 0, 1, 1,
0.4236621, 0.3652327, 0.01761384, 0.01568628, 0, 1, 1,
0.4257672, 1.245592, 0.2951769, 0.01960784, 0, 1, 1,
0.4268274, -0.675779, 5.170109, 0.02745098, 0, 1, 1,
0.4325159, 1.475911, -0.4575284, 0.03137255, 0, 1, 1,
0.4392678, -0.4956337, 2.477633, 0.03921569, 0, 1, 1,
0.4436578, 1.563673, 1.556287, 0.04313726, 0, 1, 1,
0.445817, -0.5006551, 2.988838, 0.05098039, 0, 1, 1,
0.4494334, 1.017139, -1.570659, 0.05490196, 0, 1, 1,
0.4585435, 1.809203, -0.1243028, 0.0627451, 0, 1, 1,
0.4609114, 1.40769, 1.044375, 0.06666667, 0, 1, 1,
0.468298, -2.555181, 3.868957, 0.07450981, 0, 1, 1,
0.4737443, -1.400116, 2.971233, 0.07843138, 0, 1, 1,
0.474529, -1.744913, 2.884521, 0.08627451, 0, 1, 1,
0.4779829, 0.3541231, 0.4219644, 0.09019608, 0, 1, 1,
0.4785475, -1.763569, 3.33904, 0.09803922, 0, 1, 1,
0.4793481, -1.57168, 3.105532, 0.1058824, 0, 1, 1,
0.4794232, 0.04026758, 2.494936, 0.1098039, 0, 1, 1,
0.4824173, -1.117057, 2.596952, 0.1176471, 0, 1, 1,
0.4856399, 0.3268636, 1.360496, 0.1215686, 0, 1, 1,
0.486413, -1.197248, 2.61235, 0.1294118, 0, 1, 1,
0.4866287, -0.9118028, 2.079269, 0.1333333, 0, 1, 1,
0.4887771, -0.4818455, 1.946722, 0.1411765, 0, 1, 1,
0.4899588, -1.13552, 3.870248, 0.145098, 0, 1, 1,
0.4938166, 0.6856817, 3.567346, 0.1529412, 0, 1, 1,
0.4982207, 0.4568789, 0.5351241, 0.1568628, 0, 1, 1,
0.4983706, -0.6583802, 3.537846, 0.1647059, 0, 1, 1,
0.4992014, 1.401095, 1.033062, 0.1686275, 0, 1, 1,
0.4999208, -0.5430448, 3.021346, 0.1764706, 0, 1, 1,
0.502991, 0.2534906, 0.2778998, 0.1803922, 0, 1, 1,
0.5038191, -0.1925804, 2.518194, 0.1882353, 0, 1, 1,
0.5088351, 0.7942832, 0.5178109, 0.1921569, 0, 1, 1,
0.5091929, 0.2431067, 1.390051, 0.2, 0, 1, 1,
0.5147994, -0.640386, 2.212589, 0.2078431, 0, 1, 1,
0.5190578, -0.4418359, 1.783832, 0.2117647, 0, 1, 1,
0.5269011, -0.2058592, 1.87304, 0.2196078, 0, 1, 1,
0.5313935, 0.775757, 2.887237, 0.2235294, 0, 1, 1,
0.5334048, -0.951508, 3.820091, 0.2313726, 0, 1, 1,
0.5383012, -0.2227253, 2.809522, 0.2352941, 0, 1, 1,
0.5474337, -0.3493561, 1.757962, 0.2431373, 0, 1, 1,
0.5481108, 1.369801, -0.6323516, 0.2470588, 0, 1, 1,
0.5494681, -0.9117603, 3.457494, 0.254902, 0, 1, 1,
0.5526425, 0.978987, 1.450078, 0.2588235, 0, 1, 1,
0.5599931, -0.6160463, 1.476437, 0.2666667, 0, 1, 1,
0.5609655, -0.2257576, 1.197051, 0.2705882, 0, 1, 1,
0.5643778, 1.553777, -0.4314695, 0.2784314, 0, 1, 1,
0.5652747, 0.819808, -0.9352081, 0.282353, 0, 1, 1,
0.5672035, -0.07095136, 3.529479, 0.2901961, 0, 1, 1,
0.5701873, -0.3017804, 2.549479, 0.2941177, 0, 1, 1,
0.5714198, 0.08835834, 1.774439, 0.3019608, 0, 1, 1,
0.5749942, 0.3848585, 0.6495498, 0.3098039, 0, 1, 1,
0.5759758, 0.298295, 0.1027543, 0.3137255, 0, 1, 1,
0.5759918, 0.2892987, 1.268879, 0.3215686, 0, 1, 1,
0.5762188, 0.5383244, -0.4004024, 0.3254902, 0, 1, 1,
0.5772702, -1.399013, 1.774897, 0.3333333, 0, 1, 1,
0.5800777, -0.03023167, 0.2865932, 0.3372549, 0, 1, 1,
0.580714, -2.740374, 3.042415, 0.345098, 0, 1, 1,
0.5810634, -0.4442646, 3.96905, 0.3490196, 0, 1, 1,
0.5828498, -2.040586, 4.30074, 0.3568628, 0, 1, 1,
0.5832298, -0.3788266, 1.685187, 0.3607843, 0, 1, 1,
0.5838919, 1.035018, 0.7075197, 0.3686275, 0, 1, 1,
0.5885887, 0.07625621, 0.1875777, 0.372549, 0, 1, 1,
0.5911921, 0.487579, 1.916563, 0.3803922, 0, 1, 1,
0.5931466, -1.02042, 3.153839, 0.3843137, 0, 1, 1,
0.5967698, 0.3279905, -2.426985, 0.3921569, 0, 1, 1,
0.5998715, -0.651136, 2.428867, 0.3960784, 0, 1, 1,
0.6021522, -0.3456049, 2.985543, 0.4039216, 0, 1, 1,
0.6045827, -0.06618728, 1.796547, 0.4117647, 0, 1, 1,
0.6094522, -0.4174304, 1.414055, 0.4156863, 0, 1, 1,
0.61244, -0.1300342, 2.949604, 0.4235294, 0, 1, 1,
0.6223093, 1.10527, -0.3338426, 0.427451, 0, 1, 1,
0.6231537, -0.07275575, 2.880067, 0.4352941, 0, 1, 1,
0.6238225, -0.07357739, 1.887769, 0.4392157, 0, 1, 1,
0.6279484, 0.2144069, 2.358444, 0.4470588, 0, 1, 1,
0.6286891, -0.3086606, 1.514994, 0.4509804, 0, 1, 1,
0.6324225, -0.3736052, 2.62847, 0.4588235, 0, 1, 1,
0.6349784, 0.5500848, 1.072052, 0.4627451, 0, 1, 1,
0.6435908, 0.06029696, 0.5661021, 0.4705882, 0, 1, 1,
0.6452463, 1.677232, -0.2221426, 0.4745098, 0, 1, 1,
0.645483, 0.3161812, -0.3653987, 0.4823529, 0, 1, 1,
0.6494034, -1.0064, 0.5677316, 0.4862745, 0, 1, 1,
0.6494725, -0.1323584, 1.712637, 0.4941176, 0, 1, 1,
0.6495048, 1.311516, 0.6981629, 0.5019608, 0, 1, 1,
0.6497335, 0.2097462, 0.7506922, 0.5058824, 0, 1, 1,
0.6503572, -0.05453288, 0.69376, 0.5137255, 0, 1, 1,
0.662342, -1.241661, 3.000246, 0.5176471, 0, 1, 1,
0.6645949, -0.5913993, 3.675816, 0.5254902, 0, 1, 1,
0.6774415, -1.312831, 3.33528, 0.5294118, 0, 1, 1,
0.6806445, -0.1348365, 2.302762, 0.5372549, 0, 1, 1,
0.6822296, -1.506108, 3.196555, 0.5411765, 0, 1, 1,
0.6846678, -0.8308331, 2.477386, 0.5490196, 0, 1, 1,
0.6848595, -0.7775174, 1.21707, 0.5529412, 0, 1, 1,
0.6869321, 1.152467, 0.5826941, 0.5607843, 0, 1, 1,
0.700098, -0.4045957, 0.04312508, 0.5647059, 0, 1, 1,
0.7008842, -0.4009795, 2.661215, 0.572549, 0, 1, 1,
0.7023478, 2.032345, -0.2958762, 0.5764706, 0, 1, 1,
0.7027938, -0.9511461, 4.235323, 0.5843138, 0, 1, 1,
0.7070495, -0.606419, 2.43357, 0.5882353, 0, 1, 1,
0.708007, 0.9786656, 1.476005, 0.5960785, 0, 1, 1,
0.7082289, 0.6565412, 0.2189676, 0.6039216, 0, 1, 1,
0.7090184, -0.4905581, 2.210203, 0.6078432, 0, 1, 1,
0.7106821, -0.2197145, 0.6275101, 0.6156863, 0, 1, 1,
0.7131247, 1.06497, 1.238297, 0.6196079, 0, 1, 1,
0.7152058, -0.4616472, 1.35349, 0.627451, 0, 1, 1,
0.7221851, -0.1623749, 1.810365, 0.6313726, 0, 1, 1,
0.7335405, 0.2602028, 1.410163, 0.6392157, 0, 1, 1,
0.7348565, 1.160835, 1.253006, 0.6431373, 0, 1, 1,
0.7382294, -0.2503481, 0.6199471, 0.6509804, 0, 1, 1,
0.7386631, 1.005743, 2.901349, 0.654902, 0, 1, 1,
0.7389652, 0.4193828, 1.607206, 0.6627451, 0, 1, 1,
0.7410002, 1.003123, 1.038539, 0.6666667, 0, 1, 1,
0.7426911, -0.7586353, 0.2159319, 0.6745098, 0, 1, 1,
0.7457674, -0.3995471, 1.62547, 0.6784314, 0, 1, 1,
0.7617854, 1.091189, 1.019544, 0.6862745, 0, 1, 1,
0.7687773, 0.3253005, 0.1907526, 0.6901961, 0, 1, 1,
0.7714782, -0.6288269, 1.463966, 0.6980392, 0, 1, 1,
0.7743216, -0.002925421, 1.660799, 0.7058824, 0, 1, 1,
0.7823462, 0.9860333, 2.239789, 0.7098039, 0, 1, 1,
0.784901, -0.5538524, 2.743381, 0.7176471, 0, 1, 1,
0.7851567, 0.9546794, 2.830675, 0.7215686, 0, 1, 1,
0.7892407, 2.411313, -0.8404274, 0.7294118, 0, 1, 1,
0.7897336, 0.08788795, 0.3304981, 0.7333333, 0, 1, 1,
0.7923309, -0.04740797, 3.211932, 0.7411765, 0, 1, 1,
0.7946498, 0.2288297, 1.928617, 0.7450981, 0, 1, 1,
0.8035561, 2.001744, -0.3695558, 0.7529412, 0, 1, 1,
0.8058006, 0.1947114, 3.119163, 0.7568628, 0, 1, 1,
0.8094388, -2.245896, 0.7526439, 0.7647059, 0, 1, 1,
0.8131859, -0.2000101, 0.6011674, 0.7686275, 0, 1, 1,
0.817311, -1.413545, 2.459084, 0.7764706, 0, 1, 1,
0.8174589, -0.3272547, 2.0474, 0.7803922, 0, 1, 1,
0.8180686, -1.873653, 2.229038, 0.7882353, 0, 1, 1,
0.8204239, -0.2872936, -0.2372744, 0.7921569, 0, 1, 1,
0.8277947, 0.7305232, 0.8475972, 0.8, 0, 1, 1,
0.8278685, 0.8358828, 0.8863717, 0.8078431, 0, 1, 1,
0.8321454, -0.7141116, 2.472271, 0.8117647, 0, 1, 1,
0.8342259, -0.5865633, 2.241439, 0.8196079, 0, 1, 1,
0.8353319, -0.1849184, 1.252665, 0.8235294, 0, 1, 1,
0.8365468, 0.1086948, 2.342603, 0.8313726, 0, 1, 1,
0.8431187, -0.02682661, -0.411989, 0.8352941, 0, 1, 1,
0.8468041, 0.8400245, -1.504789, 0.8431373, 0, 1, 1,
0.8514228, -0.879388, 1.915648, 0.8470588, 0, 1, 1,
0.8545156, 0.8364977, 1.189627, 0.854902, 0, 1, 1,
0.8552316, -0.2422113, 0.5194281, 0.8588235, 0, 1, 1,
0.8576142, 0.7765211, 1.418081, 0.8666667, 0, 1, 1,
0.8585493, -2.553675, 2.716191, 0.8705882, 0, 1, 1,
0.8612782, 0.3562112, -0.3975889, 0.8784314, 0, 1, 1,
0.8696377, -0.503224, 3.028608, 0.8823529, 0, 1, 1,
0.86988, 1.718391, 0.3298689, 0.8901961, 0, 1, 1,
0.8700117, -2.847535, 4.01345, 0.8941177, 0, 1, 1,
0.8750553, -0.6492808, 0.1235654, 0.9019608, 0, 1, 1,
0.8834895, -1.139965, 2.226173, 0.9098039, 0, 1, 1,
0.8841245, 0.2374682, 1.84009, 0.9137255, 0, 1, 1,
0.8905267, 0.5990545, 1.387756, 0.9215686, 0, 1, 1,
0.8942571, -0.1765427, 0.9438928, 0.9254902, 0, 1, 1,
0.898751, -0.2279864, 2.339872, 0.9333333, 0, 1, 1,
0.9060522, -1.16031, 0.9690654, 0.9372549, 0, 1, 1,
0.9085062, 1.684328, 0.1259629, 0.945098, 0, 1, 1,
0.9088469, 1.681405, 0.1267833, 0.9490196, 0, 1, 1,
0.909736, -0.634613, 1.841537, 0.9568627, 0, 1, 1,
0.9129416, -0.6121338, 1.99494, 0.9607843, 0, 1, 1,
0.9134239, -1.071616, 1.718131, 0.9686275, 0, 1, 1,
0.9173561, -0.9819183, 3.838239, 0.972549, 0, 1, 1,
0.9370997, 0.966489, 1.717888, 0.9803922, 0, 1, 1,
0.939553, 0.04443961, 1.999542, 0.9843137, 0, 1, 1,
0.9401282, -1.301984, 3.006625, 0.9921569, 0, 1, 1,
0.9604055, 1.139353, 1.840763, 0.9960784, 0, 1, 1,
0.9725319, 0.2783361, 2.799793, 1, 0, 0.9960784, 1,
0.9745566, -0.08493989, 1.335825, 1, 0, 0.9882353, 1,
0.9892191, 0.3285027, 1.586648, 1, 0, 0.9843137, 1,
0.996155, -0.533021, 2.846664, 1, 0, 0.9764706, 1,
0.9983692, -0.0524588, 1.706125, 1, 0, 0.972549, 1,
0.9989247, 0.1431049, 0.764868, 1, 0, 0.9647059, 1,
1.003412, -0.9700679, 0.7934688, 1, 0, 0.9607843, 1,
1.004528, 0.7634571, 3.819774, 1, 0, 0.9529412, 1,
1.012198, -2.302342, 4.289515, 1, 0, 0.9490196, 1,
1.012618, -2.595857, 3.541568, 1, 0, 0.9411765, 1,
1.015976, -0.9946344, 3.13971, 1, 0, 0.9372549, 1,
1.018323, -0.6490926, 2.801705, 1, 0, 0.9294118, 1,
1.023516, 1.985349, -1.053329, 1, 0, 0.9254902, 1,
1.027128, -1.073522, 2.397324, 1, 0, 0.9176471, 1,
1.028027, 0.8744509, 1.006783, 1, 0, 0.9137255, 1,
1.029117, -0.4983607, 2.602921, 1, 0, 0.9058824, 1,
1.030093, -0.1029182, 1.013651, 1, 0, 0.9019608, 1,
1.034118, -0.3975104, 2.055581, 1, 0, 0.8941177, 1,
1.050672, -0.1747672, 1.728218, 1, 0, 0.8862745, 1,
1.058008, 1.171847, 0.06756318, 1, 0, 0.8823529, 1,
1.058232, 0.8888031, 1.515523, 1, 0, 0.8745098, 1,
1.061891, -1.083557, 1.871447, 1, 0, 0.8705882, 1,
1.061981, 1.476454, -0.4906349, 1, 0, 0.8627451, 1,
1.063592, 0.4247218, 1.668254, 1, 0, 0.8588235, 1,
1.070298, 0.2677612, 1.655234, 1, 0, 0.8509804, 1,
1.075403, -0.7006732, 4.604674, 1, 0, 0.8470588, 1,
1.076455, -1.665689, 2.922894, 1, 0, 0.8392157, 1,
1.080493, 0.8088766, 2.203704, 1, 0, 0.8352941, 1,
1.083188, 0.374451, -0.7455809, 1, 0, 0.827451, 1,
1.08664, 0.130705, 1.842386, 1, 0, 0.8235294, 1,
1.088629, 1.247416, 1.731136, 1, 0, 0.8156863, 1,
1.102652, 0.3793958, 1.425712, 1, 0, 0.8117647, 1,
1.114365, 1.238128, 1.171803, 1, 0, 0.8039216, 1,
1.115229, -0.2342882, 3.207754, 1, 0, 0.7960784, 1,
1.126352, -0.4474804, 2.036405, 1, 0, 0.7921569, 1,
1.131249, -0.2307453, 1.098614, 1, 0, 0.7843137, 1,
1.135628, 0.5644023, 1.265996, 1, 0, 0.7803922, 1,
1.145582, 1.321977, 2.341187, 1, 0, 0.772549, 1,
1.146922, -0.4687938, 1.107444, 1, 0, 0.7686275, 1,
1.153536, -0.811153, 2.334151, 1, 0, 0.7607843, 1,
1.156949, 2.569219, 1.026403, 1, 0, 0.7568628, 1,
1.163477, -0.1591958, 1.908784, 1, 0, 0.7490196, 1,
1.177284, 0.8862839, 1.007188, 1, 0, 0.7450981, 1,
1.183979, -0.7893878, 2.586378, 1, 0, 0.7372549, 1,
1.18619, -0.5097391, 2.710253, 1, 0, 0.7333333, 1,
1.186618, -2.001256, 1.998143, 1, 0, 0.7254902, 1,
1.189777, -0.9616264, 1.769626, 1, 0, 0.7215686, 1,
1.194103, 0.6021926, -0.01652494, 1, 0, 0.7137255, 1,
1.195505, -0.5363299, 0.9882703, 1, 0, 0.7098039, 1,
1.197577, 0.08397435, 1.56381, 1, 0, 0.7019608, 1,
1.199127, 0.9793736, -0.0102248, 1, 0, 0.6941177, 1,
1.20228, -0.6401984, 2.473428, 1, 0, 0.6901961, 1,
1.203754, 1.080523, 0.1619784, 1, 0, 0.682353, 1,
1.204728, 0.1995573, 2.63579, 1, 0, 0.6784314, 1,
1.222369, -0.3621515, 1.776987, 1, 0, 0.6705883, 1,
1.231024, 0.6011459, 0.7030824, 1, 0, 0.6666667, 1,
1.231966, -0.7728172, 2.764606, 1, 0, 0.6588235, 1,
1.237591, 0.1158383, 0.6484069, 1, 0, 0.654902, 1,
1.245558, 0.6616083, 1.594434, 1, 0, 0.6470588, 1,
1.253138, -0.08199936, 1.585309, 1, 0, 0.6431373, 1,
1.261282, 0.03850354, 1.493482, 1, 0, 0.6352941, 1,
1.263473, 0.5087719, 1.690568, 1, 0, 0.6313726, 1,
1.274333, 1.048105, 1.624037, 1, 0, 0.6235294, 1,
1.278072, 1.012518, 0.1957278, 1, 0, 0.6196079, 1,
1.281839, 2.365906, 1.525581, 1, 0, 0.6117647, 1,
1.285544, 0.6594366, 2.041082, 1, 0, 0.6078432, 1,
1.298526, -0.05104632, 2.945725, 1, 0, 0.6, 1,
1.301182, -0.4554761, 2.858157, 1, 0, 0.5921569, 1,
1.304522, -0.2979441, 1.378772, 1, 0, 0.5882353, 1,
1.310547, 0.719517, 1.53712, 1, 0, 0.5803922, 1,
1.330038, 0.4340228, 1.107363, 1, 0, 0.5764706, 1,
1.343524, 0.1995456, 2.791001, 1, 0, 0.5686275, 1,
1.344103, 0.07600646, 2.40545, 1, 0, 0.5647059, 1,
1.369463, -1.634953, 1.53555, 1, 0, 0.5568628, 1,
1.377603, -1.094133, 2.499346, 1, 0, 0.5529412, 1,
1.382557, 1.533188, -1.117894, 1, 0, 0.5450981, 1,
1.387631, -0.6021116, 0.9250277, 1, 0, 0.5411765, 1,
1.400487, 0.3768918, 0.5521834, 1, 0, 0.5333334, 1,
1.405127, 0.1553274, 3.263593, 1, 0, 0.5294118, 1,
1.40832, -1.341432, 3.19269, 1, 0, 0.5215687, 1,
1.410818, -0.7826652, 1.697202, 1, 0, 0.5176471, 1,
1.413948, 0.05899177, 0.1205778, 1, 0, 0.509804, 1,
1.418489, -0.03515004, 1.953309, 1, 0, 0.5058824, 1,
1.434575, -0.3908261, 2.71363, 1, 0, 0.4980392, 1,
1.438709, -0.2145107, 1.640585, 1, 0, 0.4901961, 1,
1.447175, -0.2078172, 0.2309349, 1, 0, 0.4862745, 1,
1.451864, -0.02870143, 1.109646, 1, 0, 0.4784314, 1,
1.458253, -0.7931461, 3.48243, 1, 0, 0.4745098, 1,
1.472144, -0.6164399, 1.057153, 1, 0, 0.4666667, 1,
1.475134, -0.5780996, 1.912324, 1, 0, 0.4627451, 1,
1.482597, -1.444095, 2.383702, 1, 0, 0.454902, 1,
1.485752, 0.6829416, 0.9891205, 1, 0, 0.4509804, 1,
1.486503, 1.533016, 0.5941396, 1, 0, 0.4431373, 1,
1.486638, -0.1709773, 2.851733, 1, 0, 0.4392157, 1,
1.48858, 0.5930806, 0.2475011, 1, 0, 0.4313726, 1,
1.489645, -0.5158808, 0.4229941, 1, 0, 0.427451, 1,
1.490562, -0.01827475, 1.798286, 1, 0, 0.4196078, 1,
1.493682, 0.2051102, 1.515131, 1, 0, 0.4156863, 1,
1.501875, -0.3445178, 2.155674, 1, 0, 0.4078431, 1,
1.501902, -1.917734, 1.525383, 1, 0, 0.4039216, 1,
1.503902, 0.1492401, 1.77425, 1, 0, 0.3960784, 1,
1.521168, 0.8064421, 2.023236, 1, 0, 0.3882353, 1,
1.532488, -1.029074, 2.486744, 1, 0, 0.3843137, 1,
1.557573, 1.007164, 0.3224126, 1, 0, 0.3764706, 1,
1.559895, -2.032946, 2.082247, 1, 0, 0.372549, 1,
1.563932, -0.7331123, 2.130547, 1, 0, 0.3647059, 1,
1.56547, -0.3583137, 1.173286, 1, 0, 0.3607843, 1,
1.574816, 0.247418, 2.257627, 1, 0, 0.3529412, 1,
1.60174, -1.77694, 0.6371254, 1, 0, 0.3490196, 1,
1.607554, -0.7960037, 2.051384, 1, 0, 0.3411765, 1,
1.637237, 0.5386298, 0.6066013, 1, 0, 0.3372549, 1,
1.65009, 0.9309984, 1.635163, 1, 0, 0.3294118, 1,
1.659527, 2.018041, 1.407692, 1, 0, 0.3254902, 1,
1.662623, -0.2118869, 4.58336, 1, 0, 0.3176471, 1,
1.701154, 0.294915, 2.11917, 1, 0, 0.3137255, 1,
1.713216, -0.8983755, 3.165745, 1, 0, 0.3058824, 1,
1.735893, -0.06148256, 0.2438241, 1, 0, 0.2980392, 1,
1.752847, 0.5395752, -0.1301627, 1, 0, 0.2941177, 1,
1.760935, 0.7059394, 0.3560751, 1, 0, 0.2862745, 1,
1.777173, 0.7655236, 2.020365, 1, 0, 0.282353, 1,
1.788117, -0.8196925, 3.820991, 1, 0, 0.2745098, 1,
1.796979, -1.02397, 2.357621, 1, 0, 0.2705882, 1,
1.805318, 0.02436657, 1.482685, 1, 0, 0.2627451, 1,
1.814734, 0.246142, 3.495669, 1, 0, 0.2588235, 1,
1.835404, 1.747246, 0.712621, 1, 0, 0.2509804, 1,
1.840436, 0.1294893, -0.7612536, 1, 0, 0.2470588, 1,
1.843388, -1.388426, 2.607246, 1, 0, 0.2392157, 1,
1.855517, -0.7335073, 3.382817, 1, 0, 0.2352941, 1,
1.865452, 1.017961, 0.8222981, 1, 0, 0.227451, 1,
1.91021, 0.6088021, 1.024748, 1, 0, 0.2235294, 1,
1.925563, -0.05218579, 2.232364, 1, 0, 0.2156863, 1,
1.931835, 2.64436, 2.216649, 1, 0, 0.2117647, 1,
1.943068, -1.106181, 3.392667, 1, 0, 0.2039216, 1,
1.958947, 1.357996, -0.6283638, 1, 0, 0.1960784, 1,
1.959867, -1.142731, -0.02950779, 1, 0, 0.1921569, 1,
1.963465, 0.7150374, 1.274964, 1, 0, 0.1843137, 1,
1.964984, 1.239383, 2.493079, 1, 0, 0.1803922, 1,
1.974669, -1.257986, 2.749425, 1, 0, 0.172549, 1,
2.018393, -0.2783464, 1.121057, 1, 0, 0.1686275, 1,
2.019992, 0.8429587, 0.5391645, 1, 0, 0.1607843, 1,
2.050266, -0.375345, 2.750233, 1, 0, 0.1568628, 1,
2.080667, -0.751874, 2.814121, 1, 0, 0.1490196, 1,
2.103672, -0.2013866, 1.955023, 1, 0, 0.145098, 1,
2.108739, -0.724525, 2.574292, 1, 0, 0.1372549, 1,
2.129558, 0.6407315, 1.662231, 1, 0, 0.1333333, 1,
2.136543, -0.8369637, 2.152972, 1, 0, 0.1254902, 1,
2.142956, -0.4895885, 1.293504, 1, 0, 0.1215686, 1,
2.14765, -0.7757602, 3.207631, 1, 0, 0.1137255, 1,
2.174114, 0.4574516, -0.05946996, 1, 0, 0.1098039, 1,
2.202623, 0.5098535, 2.324175, 1, 0, 0.1019608, 1,
2.242222, 0.2590541, 0.4397759, 1, 0, 0.09411765, 1,
2.254301, 1.317094, 1.98601, 1, 0, 0.09019608, 1,
2.257727, -0.0996199, 2.897532, 1, 0, 0.08235294, 1,
2.274808, -0.148994, 1.138647, 1, 0, 0.07843138, 1,
2.359907, 0.5828406, 2.447879, 1, 0, 0.07058824, 1,
2.379269, -2.296899, 3.46406, 1, 0, 0.06666667, 1,
2.441408, 1.147374, 1.452653, 1, 0, 0.05882353, 1,
2.475588, -0.3551242, 1.425043, 1, 0, 0.05490196, 1,
2.477549, -0.5793856, 2.143877, 1, 0, 0.04705882, 1,
2.539186, 2.364141, 1.391583, 1, 0, 0.04313726, 1,
2.617745, -0.3631902, 2.825919, 1, 0, 0.03529412, 1,
2.668164, -0.562739, 2.249507, 1, 0, 0.03137255, 1,
2.684785, 1.130101, 1.567716, 1, 0, 0.02352941, 1,
2.739443, 1.068649, 0.9181266, 1, 0, 0.01960784, 1,
2.941952, -1.846424, 1.235184, 1, 0, 0.01176471, 1,
3.055209, -0.4901379, -0.2106038, 1, 0, 0.007843138, 1
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
-0.2753874, -4.160939, -7.33764, 0, -0.5, 0.5, 0.5,
-0.2753874, -4.160939, -7.33764, 1, -0.5, 0.5, 0.5,
-0.2753874, -4.160939, -7.33764, 1, 1.5, 0.5, 0.5,
-0.2753874, -4.160939, -7.33764, 0, 1.5, 0.5, 0.5
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
-4.735056, 0.2906656, -7.33764, 0, -0.5, 0.5, 0.5,
-4.735056, 0.2906656, -7.33764, 1, -0.5, 0.5, 0.5,
-4.735056, 0.2906656, -7.33764, 1, 1.5, 0.5, 0.5,
-4.735056, 0.2906656, -7.33764, 0, 1.5, 0.5, 0.5
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
-4.735056, -4.160939, -0.1773679, 0, -0.5, 0.5, 0.5,
-4.735056, -4.160939, -0.1773679, 1, -0.5, 0.5, 0.5,
-4.735056, -4.160939, -0.1773679, 1, 1.5, 0.5, 0.5,
-4.735056, -4.160939, -0.1773679, 0, 1.5, 0.5, 0.5
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
-3, -3.133646, -5.685269,
3, -3.133646, -5.685269,
-3, -3.133646, -5.685269,
-3, -3.304861, -5.960665,
-2, -3.133646, -5.685269,
-2, -3.304861, -5.960665,
-1, -3.133646, -5.685269,
-1, -3.304861, -5.960665,
0, -3.133646, -5.685269,
0, -3.304861, -5.960665,
1, -3.133646, -5.685269,
1, -3.304861, -5.960665,
2, -3.133646, -5.685269,
2, -3.304861, -5.960665,
3, -3.133646, -5.685269,
3, -3.304861, -5.960665
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
-3, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
-3, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
-3, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
-3, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
-2, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
-2, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
-2, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
-2, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
-1, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
-1, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
-1, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
-1, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
0, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
0, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
0, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
0, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
1, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
1, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
1, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
1, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
2, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
2, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
2, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
2, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5,
3, -3.647292, -6.511455, 0, -0.5, 0.5, 0.5,
3, -3.647292, -6.511455, 1, -0.5, 0.5, 0.5,
3, -3.647292, -6.511455, 1, 1.5, 0.5, 0.5,
3, -3.647292, -6.511455, 0, 1.5, 0.5, 0.5
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
-3.705902, -3, -5.685269,
-3.705902, 3, -5.685269,
-3.705902, -3, -5.685269,
-3.877428, -3, -5.960665,
-3.705902, -2, -5.685269,
-3.877428, -2, -5.960665,
-3.705902, -1, -5.685269,
-3.877428, -1, -5.960665,
-3.705902, 0, -5.685269,
-3.877428, 0, -5.960665,
-3.705902, 1, -5.685269,
-3.877428, 1, -5.960665,
-3.705902, 2, -5.685269,
-3.877428, 2, -5.960665,
-3.705902, 3, -5.685269,
-3.877428, 3, -5.960665
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
-4.220479, -3, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, -3, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, -3, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, -3, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, -2, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, -2, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, -2, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, -2, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, -1, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, -1, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, -1, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, -1, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, 0, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, 0, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, 0, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, 0, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, 1, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, 1, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, 1, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, 1, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, 2, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, 2, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, 2, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, 2, -6.511455, 0, 1.5, 0.5, 0.5,
-4.220479, 3, -6.511455, 0, -0.5, 0.5, 0.5,
-4.220479, 3, -6.511455, 1, -0.5, 0.5, 0.5,
-4.220479, 3, -6.511455, 1, 1.5, 0.5, 0.5,
-4.220479, 3, -6.511455, 0, 1.5, 0.5, 0.5
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
-3.705902, -3.133646, -4,
-3.705902, -3.133646, 4,
-3.705902, -3.133646, -4,
-3.877428, -3.304861, -4,
-3.705902, -3.133646, -2,
-3.877428, -3.304861, -2,
-3.705902, -3.133646, 0,
-3.877428, -3.304861, 0,
-3.705902, -3.133646, 2,
-3.877428, -3.304861, 2,
-3.705902, -3.133646, 4,
-3.877428, -3.304861, 4
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
-4.220479, -3.647292, -4, 0, -0.5, 0.5, 0.5,
-4.220479, -3.647292, -4, 1, -0.5, 0.5, 0.5,
-4.220479, -3.647292, -4, 1, 1.5, 0.5, 0.5,
-4.220479, -3.647292, -4, 0, 1.5, 0.5, 0.5,
-4.220479, -3.647292, -2, 0, -0.5, 0.5, 0.5,
-4.220479, -3.647292, -2, 1, -0.5, 0.5, 0.5,
-4.220479, -3.647292, -2, 1, 1.5, 0.5, 0.5,
-4.220479, -3.647292, -2, 0, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 0, 0, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 0, 1, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 0, 1, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 0, 0, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 2, 0, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 2, 1, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 2, 1, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 2, 0, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 4, 0, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 4, 1, -0.5, 0.5, 0.5,
-4.220479, -3.647292, 4, 1, 1.5, 0.5, 0.5,
-4.220479, -3.647292, 4, 0, 1.5, 0.5, 0.5
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
-3.705902, -3.133646, -5.685269,
-3.705902, 3.714977, -5.685269,
-3.705902, -3.133646, 5.330534,
-3.705902, 3.714977, 5.330534,
-3.705902, -3.133646, -5.685269,
-3.705902, -3.133646, 5.330534,
-3.705902, 3.714977, -5.685269,
-3.705902, 3.714977, 5.330534,
-3.705902, -3.133646, -5.685269,
3.155127, -3.133646, -5.685269,
-3.705902, -3.133646, 5.330534,
3.155127, -3.133646, 5.330534,
-3.705902, 3.714977, -5.685269,
3.155127, 3.714977, -5.685269,
-3.705902, 3.714977, 5.330534,
3.155127, 3.714977, 5.330534,
3.155127, -3.133646, -5.685269,
3.155127, 3.714977, -5.685269,
3.155127, -3.133646, 5.330534,
3.155127, 3.714977, 5.330534,
3.155127, -3.133646, -5.685269,
3.155127, -3.133646, 5.330534,
3.155127, 3.714977, -5.685269,
3.155127, 3.714977, 5.330534
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
var radius = 7.835613;
var distance = 34.86152;
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
mvMatrix.translate( 0.2753874, -0.2906656, 0.1773679 );
mvMatrix.scale( 1.234803, 1.23704, 0.7690786 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.86152);
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
Anilazine<-read.table("Anilazine.xyz")
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
-3.605984, -1.539734, -2.305188, 0, 0, 1, 1, 1,
-3.308033, 0.9376743, -1.302108, 1, 0, 0, 1, 1,
-2.923067, -1.340649, -1.901858, 1, 0, 0, 1, 1,
-2.558926, -0.2732316, -1.087057, 1, 0, 0, 1, 1,
-2.558337, -1.791135, -0.6981308, 1, 0, 0, 1, 1,
-2.532606, -0.58951, -3.386039, 1, 0, 0, 1, 1,
-2.490467, 2.524661, 0.5607188, 0, 0, 0, 1, 1,
-2.467586, 0.6069452, -2.494138, 0, 0, 0, 1, 1,
-2.379213, -1.350076, -3.002616, 0, 0, 0, 1, 1,
-2.326751, 0.6402536, -2.050458, 0, 0, 0, 1, 1,
-2.296241, -0.2961892, -2.713298, 0, 0, 0, 1, 1,
-2.29251, 0.5616433, -0.0368548, 0, 0, 0, 1, 1,
-2.287055, -0.7446463, -0.2541801, 0, 0, 0, 1, 1,
-2.279873, 2.815669, -0.3703809, 1, 1, 1, 1, 1,
-2.276292, 1.421462, -1.646354, 1, 1, 1, 1, 1,
-2.211762, -0.02537949, -1.032022, 1, 1, 1, 1, 1,
-2.189037, -1.130489, -1.241466, 1, 1, 1, 1, 1,
-2.114675, 0.004993904, -3.731431, 1, 1, 1, 1, 1,
-2.065836, -1.224247, -3.328146, 1, 1, 1, 1, 1,
-2.061782, 1.101294, -1.06467, 1, 1, 1, 1, 1,
-2.051806, -0.06620469, -0.4384364, 1, 1, 1, 1, 1,
-2.038187, -0.4969414, -1.469408, 1, 1, 1, 1, 1,
-2.037527, -0.4877478, -2.767719, 1, 1, 1, 1, 1,
-2.033702, 0.1939843, -2.656912, 1, 1, 1, 1, 1,
-2.029683, -0.03080468, -1.744285, 1, 1, 1, 1, 1,
-2.007143, -0.5671206, -2.181204, 1, 1, 1, 1, 1,
-1.928095, 0.8505855, -0.7561191, 1, 1, 1, 1, 1,
-1.910782, 0.3896113, -1.874797, 1, 1, 1, 1, 1,
-1.890558, 0.12451, -2.283409, 0, 0, 1, 1, 1,
-1.87176, -0.03110319, -2.369772, 1, 0, 0, 1, 1,
-1.842746, -1.128245, -2.074757, 1, 0, 0, 1, 1,
-1.84059, -1.629676, -2.563318, 1, 0, 0, 1, 1,
-1.8403, 0.4296465, -3.307592, 1, 0, 0, 1, 1,
-1.816649, -0.715872, -1.768678, 1, 0, 0, 1, 1,
-1.812462, -0.3983588, -2.709729, 0, 0, 0, 1, 1,
-1.806083, 1.154545, -0.07438969, 0, 0, 0, 1, 1,
-1.801001, 0.8722564, -1.562898, 0, 0, 0, 1, 1,
-1.798837, 0.6198685, -0.54035, 0, 0, 0, 1, 1,
-1.779659, 0.8116415, -1.385883, 0, 0, 0, 1, 1,
-1.746507, -2.495236, -2.287936, 0, 0, 0, 1, 1,
-1.746432, 0.5449506, -0.4992268, 0, 0, 0, 1, 1,
-1.727567, -1.602668, 0.1601019, 1, 1, 1, 1, 1,
-1.726822, -0.1349336, -1.312137, 1, 1, 1, 1, 1,
-1.724367, 0.7793576, -1.063719, 1, 1, 1, 1, 1,
-1.694987, -0.8238893, -4.316565, 1, 1, 1, 1, 1,
-1.676769, 0.7225646, -0.2417262, 1, 1, 1, 1, 1,
-1.672217, -0.2117455, -0.9902032, 1, 1, 1, 1, 1,
-1.661336, -1.038997, -1.194424, 1, 1, 1, 1, 1,
-1.659565, -1.506174, -0.9574466, 1, 1, 1, 1, 1,
-1.656739, -0.4925005, -2.965858, 1, 1, 1, 1, 1,
-1.645007, -0.1359689, 0.7839143, 1, 1, 1, 1, 1,
-1.63508, 0.3214217, -1.156398, 1, 1, 1, 1, 1,
-1.63, -0.230322, -1.485163, 1, 1, 1, 1, 1,
-1.590679, 0.7000616, -2.10692, 1, 1, 1, 1, 1,
-1.589553, 0.9888965, -2.113859, 1, 1, 1, 1, 1,
-1.587547, -0.2360636, -1.211477, 1, 1, 1, 1, 1,
-1.58334, -0.5081635, -2.359303, 0, 0, 1, 1, 1,
-1.579811, 0.2764758, -2.126016, 1, 0, 0, 1, 1,
-1.567073, 0.631667, -0.6468229, 1, 0, 0, 1, 1,
-1.559344, 0.3613695, -1.818707, 1, 0, 0, 1, 1,
-1.558751, -0.0734345, -2.842726, 1, 0, 0, 1, 1,
-1.554315, -0.7336376, -1.818964, 1, 0, 0, 1, 1,
-1.541779, -0.3278528, -1.319813, 0, 0, 0, 1, 1,
-1.541593, 0.649747, -0.6908154, 0, 0, 0, 1, 1,
-1.532176, 2.205349, -1.950521, 0, 0, 0, 1, 1,
-1.514385, 0.002624379, 0.2390545, 0, 0, 0, 1, 1,
-1.509984, -1.01278, -1.999765, 0, 0, 0, 1, 1,
-1.505931, -1.097866, -3.000733, 0, 0, 0, 1, 1,
-1.501952, 0.3787436, -2.434833, 0, 0, 0, 1, 1,
-1.493782, 0.7774479, -0.5688758, 1, 1, 1, 1, 1,
-1.489165, -0.01366852, -1.839742, 1, 1, 1, 1, 1,
-1.485907, 0.07560489, -1.295764, 1, 1, 1, 1, 1,
-1.483549, 0.4302114, -2.53085, 1, 1, 1, 1, 1,
-1.482414, 0.2060969, -5.460888, 1, 1, 1, 1, 1,
-1.478961, 1.254449, -2.453461, 1, 1, 1, 1, 1,
-1.470419, 0.7924581, -1.151481, 1, 1, 1, 1, 1,
-1.469233, -0.5355545, -1.311631, 1, 1, 1, 1, 1,
-1.466856, -0.9870043, -2.685214, 1, 1, 1, 1, 1,
-1.460611, -0.1317268, -2.153793, 1, 1, 1, 1, 1,
-1.460135, -0.4900222, -3.289544, 1, 1, 1, 1, 1,
-1.460025, 1.112627, -1.028731, 1, 1, 1, 1, 1,
-1.455861, -3.033908, -2.656269, 1, 1, 1, 1, 1,
-1.452641, 0.2255277, 1.369386, 1, 1, 1, 1, 1,
-1.452086, -0.2762514, -0.4520949, 1, 1, 1, 1, 1,
-1.446842, 0.4694006, -0.3881401, 0, 0, 1, 1, 1,
-1.429686, -1.621164, -2.213253, 1, 0, 0, 1, 1,
-1.422723, -1.108427, -1.618764, 1, 0, 0, 1, 1,
-1.414425, 0.7938507, -1.725039, 1, 0, 0, 1, 1,
-1.38144, 0.2969425, -2.890797, 1, 0, 0, 1, 1,
-1.372215, -0.4067906, -2.542275, 1, 0, 0, 1, 1,
-1.36486, -0.4913195, -3.268095, 0, 0, 0, 1, 1,
-1.362213, -1.698215, -2.998902, 0, 0, 0, 1, 1,
-1.36097, -0.6848843, -2.750183, 0, 0, 0, 1, 1,
-1.359274, -0.7555444, -2.012061, 0, 0, 0, 1, 1,
-1.359018, -0.7928653, -3.149842, 0, 0, 0, 1, 1,
-1.358746, -0.1184554, -3.076044, 0, 0, 0, 1, 1,
-1.358542, 0.7467225, 0.10408, 0, 0, 0, 1, 1,
-1.349182, -0.7365121, -0.6650794, 1, 1, 1, 1, 1,
-1.332983, -0.3160229, -2.829343, 1, 1, 1, 1, 1,
-1.318394, -0.7357923, -1.982073, 1, 1, 1, 1, 1,
-1.318287, -0.891968, -2.591767, 1, 1, 1, 1, 1,
-1.313432, -0.09684866, -1.130593, 1, 1, 1, 1, 1,
-1.312791, 1.705846, -0.4009577, 1, 1, 1, 1, 1,
-1.308807, 0.9219533, 0.3080978, 1, 1, 1, 1, 1,
-1.293303, -0.08863079, -2.067704, 1, 1, 1, 1, 1,
-1.291329, 0.6502512, -1.039234, 1, 1, 1, 1, 1,
-1.286911, 1.023096, -0.506173, 1, 1, 1, 1, 1,
-1.27808, 0.1084714, -2.973751, 1, 1, 1, 1, 1,
-1.276117, -0.7977279, -3.557356, 1, 1, 1, 1, 1,
-1.273799, 1.83884, -0.008805664, 1, 1, 1, 1, 1,
-1.271028, 1.095441, 1.533757, 1, 1, 1, 1, 1,
-1.263721, 2.228669, -0.3060515, 1, 1, 1, 1, 1,
-1.262934, 0.4250779, -0.9334931, 0, 0, 1, 1, 1,
-1.260115, -2.221033, -2.22775, 1, 0, 0, 1, 1,
-1.251487, 0.4790008, -1.113621, 1, 0, 0, 1, 1,
-1.246753, 0.4441792, 0.2749625, 1, 0, 0, 1, 1,
-1.232496, -0.8833147, -1.753937, 1, 0, 0, 1, 1,
-1.231551, 1.811357, 0.8791552, 1, 0, 0, 1, 1,
-1.22814, 0.9790041, -2.162512, 0, 0, 0, 1, 1,
-1.222072, 0.08010121, -2.629538, 0, 0, 0, 1, 1,
-1.221494, 0.3579859, -1.684918, 0, 0, 0, 1, 1,
-1.218155, -0.7830702, -2.916863, 0, 0, 0, 1, 1,
-1.212896, -0.6675203, -3.581949, 0, 0, 0, 1, 1,
-1.211719, 0.9170637, -0.4775655, 0, 0, 0, 1, 1,
-1.209122, 0.9787836, -0.6405379, 0, 0, 0, 1, 1,
-1.203561, -0.1927038, -3.084593, 1, 1, 1, 1, 1,
-1.202361, -0.5542639, -2.925594, 1, 1, 1, 1, 1,
-1.18733, -1.878828, -3.95465, 1, 1, 1, 1, 1,
-1.181477, 1.905533, 0.4251125, 1, 1, 1, 1, 1,
-1.177825, 0.9501414, -0.1123257, 1, 1, 1, 1, 1,
-1.164672, -2.367019, -3.662117, 1, 1, 1, 1, 1,
-1.160406, -0.2106789, -2.228477, 1, 1, 1, 1, 1,
-1.142826, -0.2021039, -1.391144, 1, 1, 1, 1, 1,
-1.131169, -1.487168, -3.141951, 1, 1, 1, 1, 1,
-1.130517, -0.3278766, -0.3938549, 1, 1, 1, 1, 1,
-1.126395, 0.5343994, -1.026657, 1, 1, 1, 1, 1,
-1.125393, -0.05891281, -2.198248, 1, 1, 1, 1, 1,
-1.108644, -0.8575333, -1.449266, 1, 1, 1, 1, 1,
-1.105214, 0.1911849, 0.08451584, 1, 1, 1, 1, 1,
-1.104432, -0.4032723, -1.520498, 1, 1, 1, 1, 1,
-1.101436, -1.134718, -0.3076078, 0, 0, 1, 1, 1,
-1.092345, -0.481362, -2.307026, 1, 0, 0, 1, 1,
-1.076901, 1.702755, 1.821214, 1, 0, 0, 1, 1,
-1.076891, 0.4493452, -1.496223, 1, 0, 0, 1, 1,
-1.074796, 0.407245, -1.918682, 1, 0, 0, 1, 1,
-1.074465, -0.4051699, -3.410545, 1, 0, 0, 1, 1,
-1.071045, -0.878118, -2.178223, 0, 0, 0, 1, 1,
-1.066774, -0.2713324, -2.65769, 0, 0, 0, 1, 1,
-1.063449, 1.401959, 1.507767, 0, 0, 0, 1, 1,
-1.059035, -0.1176148, -4.782004, 0, 0, 0, 1, 1,
-1.056629, -0.8425618, -0.7747374, 0, 0, 0, 1, 1,
-1.055414, 2.239542, 0.7228846, 0, 0, 0, 1, 1,
-1.054778, -1.871352, -2.341479, 0, 0, 0, 1, 1,
-1.054007, 0.08102219, -0.9064682, 1, 1, 1, 1, 1,
-1.053586, -1.84954, -1.701293, 1, 1, 1, 1, 1,
-1.051368, 1.178885, 0.433561, 1, 1, 1, 1, 1,
-1.045083, -0.03825491, -0.7337763, 1, 1, 1, 1, 1,
-1.031222, 0.9146506, -1.064392, 1, 1, 1, 1, 1,
-1.031087, 0.4528822, -3.097972, 1, 1, 1, 1, 1,
-1.030297, -0.8060452, -2.074129, 1, 1, 1, 1, 1,
-1.030125, 1.166372, -1.310712, 1, 1, 1, 1, 1,
-1.028653, 0.4114134, 0.280127, 1, 1, 1, 1, 1,
-1.028416, 0.4682471, -2.564781, 1, 1, 1, 1, 1,
-1.026639, 0.7839169, 0.1422536, 1, 1, 1, 1, 1,
-1.021211, -0.8800855, -3.967052, 1, 1, 1, 1, 1,
-1.020508, -0.2039554, 0.03528833, 1, 1, 1, 1, 1,
-1.020459, -0.7957802, -1.594791, 1, 1, 1, 1, 1,
-1.017623, -0.09401457, -3.862949, 1, 1, 1, 1, 1,
-1.017357, 1.312538, -1.342136, 0, 0, 1, 1, 1,
-1.012094, 0.6840661, -0.8428718, 1, 0, 0, 1, 1,
-1.004271, -1.129869, -3.376225, 1, 0, 0, 1, 1,
-1.001011, -0.8946679, -4.716154, 1, 0, 0, 1, 1,
-0.9947141, 1.97998, -2.561662, 1, 0, 0, 1, 1,
-0.9910955, 0.04533133, -1.806132, 1, 0, 0, 1, 1,
-0.9874254, 0.1107642, -2.316717, 0, 0, 0, 1, 1,
-0.9872202, 0.683604, -0.04639937, 0, 0, 0, 1, 1,
-0.9845026, 0.7472464, -2.759394, 0, 0, 0, 1, 1,
-0.9801502, 1.086582, -2.249746, 0, 0, 0, 1, 1,
-0.9764146, -0.4107319, -1.423447, 0, 0, 0, 1, 1,
-0.9744004, 0.2146415, -1.612492, 0, 0, 0, 1, 1,
-0.9706314, -0.5987507, -3.141405, 0, 0, 0, 1, 1,
-0.9659988, -1.282271, -1.324982, 1, 1, 1, 1, 1,
-0.9528624, 1.558681, -0.9186417, 1, 1, 1, 1, 1,
-0.9445061, 0.4654956, -1.885943, 1, 1, 1, 1, 1,
-0.9291732, 0.1676692, -0.03183324, 1, 1, 1, 1, 1,
-0.9266848, 0.376609, -0.8524249, 1, 1, 1, 1, 1,
-0.921334, 1.22733, 1.144631, 1, 1, 1, 1, 1,
-0.9143248, 0.321388, -2.364362, 1, 1, 1, 1, 1,
-0.9137701, -1.233014, -4.931715, 1, 1, 1, 1, 1,
-0.9068635, -0.09796891, -1.070736, 1, 1, 1, 1, 1,
-0.9012763, -0.439276, -0.9200911, 1, 1, 1, 1, 1,
-0.900565, -0.4363803, -1.147946, 1, 1, 1, 1, 1,
-0.8985146, -0.5935684, -2.540262, 1, 1, 1, 1, 1,
-0.8955269, 1.617309, -1.339745, 1, 1, 1, 1, 1,
-0.8925378, 0.2282191, -2.184493, 1, 1, 1, 1, 1,
-0.8852579, 0.1617302, -4.169212, 1, 1, 1, 1, 1,
-0.8828282, 1.570713, 0.3587258, 0, 0, 1, 1, 1,
-0.8705534, 0.5734724, -1.30501, 1, 0, 0, 1, 1,
-0.8705463, 0.182691, -0.879969, 1, 0, 0, 1, 1,
-0.8701274, 0.06214323, 0.5234807, 1, 0, 0, 1, 1,
-0.8661436, 1.24683, -0.05805631, 1, 0, 0, 1, 1,
-0.8606749, -0.8100624, -2.070577, 1, 0, 0, 1, 1,
-0.8583304, -0.6352075, -2.802918, 0, 0, 0, 1, 1,
-0.8511349, -0.7314117, -4.240304, 0, 0, 0, 1, 1,
-0.8476475, 0.1989406, -1.179446, 0, 0, 0, 1, 1,
-0.8459756, -0.1805153, -1.107946, 0, 0, 0, 1, 1,
-0.8458398, 0.1983167, -0.8787575, 0, 0, 0, 1, 1,
-0.8457044, -0.1755923, -2.938321, 0, 0, 0, 1, 1,
-0.8422356, 0.4414921, -0.6073663, 0, 0, 0, 1, 1,
-0.8394892, -0.3393717, -1.285921, 1, 1, 1, 1, 1,
-0.8260192, -0.5083428, -3.266891, 1, 1, 1, 1, 1,
-0.8229433, 0.5596006, -0.4413302, 1, 1, 1, 1, 1,
-0.8173625, -2.460397, -1.555758, 1, 1, 1, 1, 1,
-0.8159088, 0.2872725, -0.3860516, 1, 1, 1, 1, 1,
-0.8099468, 0.9862641, -0.696269, 1, 1, 1, 1, 1,
-0.7962993, -1.117719, -1.772738, 1, 1, 1, 1, 1,
-0.7926054, 0.3197729, -0.7465656, 1, 1, 1, 1, 1,
-0.7914822, 0.6416631, -0.4478595, 1, 1, 1, 1, 1,
-0.7897872, 1.588444, -0.8049101, 1, 1, 1, 1, 1,
-0.789291, -0.9223844, -4.276521, 1, 1, 1, 1, 1,
-0.7863099, -0.9026937, -2.973003, 1, 1, 1, 1, 1,
-0.7833957, -0.2894233, -1.069801, 1, 1, 1, 1, 1,
-0.7796563, 0.5739837, -1.098234, 1, 1, 1, 1, 1,
-0.7773384, -0.1864127, -2.150487, 1, 1, 1, 1, 1,
-0.7755262, -1.10377, -4.19599, 0, 0, 1, 1, 1,
-0.7745169, 0.5179598, -0.7711684, 1, 0, 0, 1, 1,
-0.7736519, -1.500156, -3.32647, 1, 0, 0, 1, 1,
-0.7626446, -1.913145, -3.007688, 1, 0, 0, 1, 1,
-0.7596862, -1.013834, -2.505204, 1, 0, 0, 1, 1,
-0.7567606, 0.6184008, 0.7031244, 1, 0, 0, 1, 1,
-0.7525818, 0.00461288, -1.654283, 0, 0, 0, 1, 1,
-0.7459005, -0.5589899, -3.445588, 0, 0, 0, 1, 1,
-0.74523, 0.506276, -1.347452, 0, 0, 0, 1, 1,
-0.7449306, 0.3449731, 0.4206716, 0, 0, 0, 1, 1,
-0.7389178, -0.4574766, -1.947851, 0, 0, 0, 1, 1,
-0.7367949, -0.05665709, -2.300473, 0, 0, 0, 1, 1,
-0.7351614, 1.685588, 0.7624186, 0, 0, 0, 1, 1,
-0.7328977, 2.209916, 0.2957415, 1, 1, 1, 1, 1,
-0.7293054, -2.12333, -2.716158, 1, 1, 1, 1, 1,
-0.7202989, -0.41352, -3.381426, 1, 1, 1, 1, 1,
-0.7168412, -0.5448753, -2.339159, 1, 1, 1, 1, 1,
-0.713861, -2.486219, -2.396138, 1, 1, 1, 1, 1,
-0.7137955, 0.5444138, -0.4096406, 1, 1, 1, 1, 1,
-0.708005, 1.464702, -2.437395, 1, 1, 1, 1, 1,
-0.7013245, -1.191492, -4.312482, 1, 1, 1, 1, 1,
-0.6977215, 1.307427, -0.8373083, 1, 1, 1, 1, 1,
-0.6975246, -1.213714, -1.990552, 1, 1, 1, 1, 1,
-0.6935729, 0.4826325, -1.517834, 1, 1, 1, 1, 1,
-0.6929167, 1.708155, -0.648274, 1, 1, 1, 1, 1,
-0.6926557, 0.4000121, -0.3266026, 1, 1, 1, 1, 1,
-0.6925222, -0.2803071, -0.02560364, 1, 1, 1, 1, 1,
-0.6921104, -0.2462487, -2.440684, 1, 1, 1, 1, 1,
-0.6918158, -0.7294367, -1.549597, 0, 0, 1, 1, 1,
-0.6875448, 1.234414, 1.296346, 1, 0, 0, 1, 1,
-0.6870413, 0.1135626, -1.822788, 1, 0, 0, 1, 1,
-0.6844149, 0.8665414, -0.4539033, 1, 0, 0, 1, 1,
-0.6834955, -1.220702, -3.96028, 1, 0, 0, 1, 1,
-0.6831527, 0.3398757, -2.230098, 1, 0, 0, 1, 1,
-0.6809773, -0.9911363, -2.55018, 0, 0, 0, 1, 1,
-0.6780908, -0.4305329, -0.8067238, 0, 0, 0, 1, 1,
-0.6745194, 1.446944, 0.8691179, 0, 0, 0, 1, 1,
-0.6606561, 0.1004583, -0.7238403, 0, 0, 0, 1, 1,
-0.6605983, -0.896195, -0.5434265, 0, 0, 0, 1, 1,
-0.6591409, 0.2179578, -0.9568482, 0, 0, 0, 1, 1,
-0.6575989, 0.6342683, 0.837423, 0, 0, 0, 1, 1,
-0.656242, 0.4404301, -2.022746, 1, 1, 1, 1, 1,
-0.6480854, 0.4235578, -2.538576, 1, 1, 1, 1, 1,
-0.6448838, 0.07305961, -2.811843, 1, 1, 1, 1, 1,
-0.6434921, -1.251626, -3.565794, 1, 1, 1, 1, 1,
-0.6394685, -0.8001202, -0.8597841, 1, 1, 1, 1, 1,
-0.6334, 0.7444926, -0.09176865, 1, 1, 1, 1, 1,
-0.6331034, 1.098637, -0.0839236, 1, 1, 1, 1, 1,
-0.6189539, 0.5669926, -3.190517, 1, 1, 1, 1, 1,
-0.6158825, -1.586464, -2.705883, 1, 1, 1, 1, 1,
-0.6140646, -1.470297, -3.253135, 1, 1, 1, 1, 1,
-0.612327, -0.02093045, -0.8811449, 1, 1, 1, 1, 1,
-0.6118816, -0.3068045, -2.296596, 1, 1, 1, 1, 1,
-0.6047811, -2.324195, -1.511685, 1, 1, 1, 1, 1,
-0.6028131, 0.03048754, -2.503345, 1, 1, 1, 1, 1,
-0.6022083, 2.033018, 1.364491, 1, 1, 1, 1, 1,
-0.5989624, -1.814355, -3.619865, 0, 0, 1, 1, 1,
-0.5975951, -0.1655486, -2.884637, 1, 0, 0, 1, 1,
-0.5935451, 0.6306571, -0.1727745, 1, 0, 0, 1, 1,
-0.5923265, -0.8048769, -1.27154, 1, 0, 0, 1, 1,
-0.5908939, -1.17966, -2.787506, 1, 0, 0, 1, 1,
-0.5874196, -0.6525243, -0.3910348, 1, 0, 0, 1, 1,
-0.5866404, -1.20741, -5.524845, 0, 0, 0, 1, 1,
-0.5841928, 0.1333122, -2.553998, 0, 0, 0, 1, 1,
-0.5819898, -0.1105478, -0.5469888, 0, 0, 0, 1, 1,
-0.5815007, 0.05450102, -1.958275, 0, 0, 0, 1, 1,
-0.5794778, 0.1632108, -1.359629, 0, 0, 0, 1, 1,
-0.5785259, 0.7320912, -1.6041, 0, 0, 0, 1, 1,
-0.572742, 0.3108185, -0.5101464, 0, 0, 0, 1, 1,
-0.5715572, 1.323571, -1.917839, 1, 1, 1, 1, 1,
-0.5672415, 0.3070317, -2.310806, 1, 1, 1, 1, 1,
-0.5665885, 0.6400903, -0.06710727, 1, 1, 1, 1, 1,
-0.5635242, 0.6392584, 0.4323253, 1, 1, 1, 1, 1,
-0.5616865, 0.212189, -0.1635598, 1, 1, 1, 1, 1,
-0.5611934, -0.5112484, -3.379182, 1, 1, 1, 1, 1,
-0.5596799, 0.4115679, -0.9086149, 1, 1, 1, 1, 1,
-0.5512857, -0.05643927, -0.2778753, 1, 1, 1, 1, 1,
-0.5488284, -1.781285, -2.939546, 1, 1, 1, 1, 1,
-0.5469334, 0.958281, -1.326107, 1, 1, 1, 1, 1,
-0.5424357, 0.9292302, 1.779167, 1, 1, 1, 1, 1,
-0.5304403, 0.1248201, -0.04592833, 1, 1, 1, 1, 1,
-0.5246577, -0.3720564, 0.1193806, 1, 1, 1, 1, 1,
-0.5220864, -0.0120739, 0.6432472, 1, 1, 1, 1, 1,
-0.5179569, 1.219811, -1.163867, 1, 1, 1, 1, 1,
-0.5164485, 1.94232, -0.2825722, 0, 0, 1, 1, 1,
-0.5152211, 0.2928893, -0.9594264, 1, 0, 0, 1, 1,
-0.5145755, 0.0909161, -2.719805, 1, 0, 0, 1, 1,
-0.5137373, 0.02241839, -2.011545, 1, 0, 0, 1, 1,
-0.5135998, 1.599486, 1.392767, 1, 0, 0, 1, 1,
-0.5122811, 0.6224951, 0.6180742, 1, 0, 0, 1, 1,
-0.5121858, -1.168202, -4.2923, 0, 0, 0, 1, 1,
-0.5121671, 1.60936, 1.103705, 0, 0, 0, 1, 1,
-0.5116618, -0.1809146, -2.095385, 0, 0, 0, 1, 1,
-0.5115919, 0.7717632, 0.7151067, 0, 0, 0, 1, 1,
-0.5079503, -0.8184301, -1.487004, 0, 0, 0, 1, 1,
-0.5071716, 0.9942825, -0.3324252, 0, 0, 0, 1, 1,
-0.5053993, 0.1033643, -1.251996, 0, 0, 0, 1, 1,
-0.5020105, -0.5272771, -3.298331, 1, 1, 1, 1, 1,
-0.501562, -1.79684, -2.41333, 1, 1, 1, 1, 1,
-0.4819375, -0.6615929, -2.635868, 1, 1, 1, 1, 1,
-0.4801018, -0.4992256, -3.464676, 1, 1, 1, 1, 1,
-0.4762721, -2.341883, -3.438491, 1, 1, 1, 1, 1,
-0.4716025, -0.7992489, -1.642787, 1, 1, 1, 1, 1,
-0.4677598, -0.1562372, -0.4560006, 1, 1, 1, 1, 1,
-0.4667155, -0.6595991, -2.279179, 1, 1, 1, 1, 1,
-0.4631956, -0.01929677, -2.902235, 1, 1, 1, 1, 1,
-0.4599926, 0.9052561, -0.3848005, 1, 1, 1, 1, 1,
-0.455626, 1.038957, -1.026109, 1, 1, 1, 1, 1,
-0.4555977, -0.1389763, -0.314052, 1, 1, 1, 1, 1,
-0.4522667, -0.8443506, -2.724092, 1, 1, 1, 1, 1,
-0.4424704, -0.4852186, -3.134789, 1, 1, 1, 1, 1,
-0.4420138, 0.4933511, 0.005945258, 1, 1, 1, 1, 1,
-0.4357383, -1.676381, -4.69293, 0, 0, 1, 1, 1,
-0.4299943, 0.4114752, -0.3167388, 1, 0, 0, 1, 1,
-0.4257868, -1.213273, -1.891653, 1, 0, 0, 1, 1,
-0.4250524, 0.7513818, 0.3741693, 1, 0, 0, 1, 1,
-0.4205857, 0.1825953, -1.890309, 1, 0, 0, 1, 1,
-0.4204255, -0.272211, -3.364043, 1, 0, 0, 1, 1,
-0.4155902, 0.2996691, -0.4272083, 0, 0, 0, 1, 1,
-0.4124699, 0.2092308, -1.351606, 0, 0, 0, 1, 1,
-0.412112, 0.5709653, -0.1005076, 0, 0, 0, 1, 1,
-0.409162, 0.3440709, -1.442575, 0, 0, 0, 1, 1,
-0.4059489, -0.01109617, -0.9025372, 0, 0, 0, 1, 1,
-0.4018381, 1.334058, 0.3098897, 0, 0, 0, 1, 1,
-0.4007354, 0.004575619, -2.443209, 0, 0, 0, 1, 1,
-0.399726, 0.0426451, -1.77861, 1, 1, 1, 1, 1,
-0.3994666, -0.9998246, -1.187775, 1, 1, 1, 1, 1,
-0.3919526, -0.5979647, -4.877702, 1, 1, 1, 1, 1,
-0.3834836, -0.4852986, -0.8373922, 1, 1, 1, 1, 1,
-0.3833887, -0.3741066, -2.672296, 1, 1, 1, 1, 1,
-0.3833862, 0.586129, -0.9738664, 1, 1, 1, 1, 1,
-0.3817425, 0.07682577, -1.85461, 1, 1, 1, 1, 1,
-0.3799721, -0.9715272, -2.680658, 1, 1, 1, 1, 1,
-0.3777402, 0.3474446, -0.08672994, 1, 1, 1, 1, 1,
-0.3775515, 0.7448279, -0.2208854, 1, 1, 1, 1, 1,
-0.37725, -0.04094817, -2.475796, 1, 1, 1, 1, 1,
-0.3767059, -1.815937, -2.7146, 1, 1, 1, 1, 1,
-0.3766216, -0.1183231, -1.852427, 1, 1, 1, 1, 1,
-0.374602, -2.248539, -2.465545, 1, 1, 1, 1, 1,
-0.3723243, 0.4052691, -1.4658, 1, 1, 1, 1, 1,
-0.3605518, 0.8302653, 1.143535, 0, 0, 1, 1, 1,
-0.3595273, -1.636789, -3.265844, 1, 0, 0, 1, 1,
-0.3547119, -0.4092457, -2.105369, 1, 0, 0, 1, 1,
-0.3430412, 0.8642146, -0.6561639, 1, 0, 0, 1, 1,
-0.3409579, -0.40843, -2.653739, 1, 0, 0, 1, 1,
-0.3408428, 0.627821, -0.07460223, 1, 0, 0, 1, 1,
-0.3387439, 0.4125869, -0.7642196, 0, 0, 0, 1, 1,
-0.3327828, 0.3579375, -0.8369091, 0, 0, 0, 1, 1,
-0.3269123, 1.787194, 0.2687958, 0, 0, 0, 1, 1,
-0.3233364, 0.335851, -0.8187322, 0, 0, 0, 1, 1,
-0.3205956, 0.5223032, 0.9161824, 0, 0, 0, 1, 1,
-0.31826, 0.2405622, -1.250166, 0, 0, 0, 1, 1,
-0.3169059, 0.4716797, -0.8273558, 0, 0, 0, 1, 1,
-0.314198, -0.9735403, -1.46038, 1, 1, 1, 1, 1,
-0.3102686, 0.06771417, -0.4335052, 1, 1, 1, 1, 1,
-0.3081666, -0.2228688, -1.562077, 1, 1, 1, 1, 1,
-0.2937582, 1.67319, 0.4135246, 1, 1, 1, 1, 1,
-0.2814139, -1.288571, -0.3725989, 1, 1, 1, 1, 1,
-0.2801047, 0.9186016, -0.7611158, 1, 1, 1, 1, 1,
-0.2788396, 1.466552, 2.616309, 1, 1, 1, 1, 1,
-0.2641485, -1.897975, -3.197668, 1, 1, 1, 1, 1,
-0.2563203, 0.7199271, 0.2264595, 1, 1, 1, 1, 1,
-0.2481155, -0.0841078, -2.074805, 1, 1, 1, 1, 1,
-0.2461365, 1.271685, 0.977502, 1, 1, 1, 1, 1,
-0.2455597, -0.6794452, -5.432793, 1, 1, 1, 1, 1,
-0.2427416, 0.6592273, -1.364907, 1, 1, 1, 1, 1,
-0.2416658, 1.181753, -0.3977255, 1, 1, 1, 1, 1,
-0.2416377, -0.1315893, -2.524337, 1, 1, 1, 1, 1,
-0.2401556, 0.4943186, 0.1171669, 0, 0, 1, 1, 1,
-0.2213768, -0.3461134, -2.449744, 1, 0, 0, 1, 1,
-0.2198335, 0.3702957, 0.7321348, 1, 0, 0, 1, 1,
-0.2177721, 0.9198787, -1.328419, 1, 0, 0, 1, 1,
-0.2167019, -0.2225036, -2.136697, 1, 0, 0, 1, 1,
-0.2149291, -0.8084332, -5.088348, 1, 0, 0, 1, 1,
-0.2140587, 1.388769, 0.08963455, 0, 0, 0, 1, 1,
-0.2103783, -0.2967478, -2.799128, 0, 0, 0, 1, 1,
-0.2100407, 0.5569481, 0.3108627, 0, 0, 0, 1, 1,
-0.2062177, -1.827042, -3.0492, 0, 0, 0, 1, 1,
-0.2060082, 2.798973, -0.2439173, 0, 0, 0, 1, 1,
-0.2037434, 0.5683653, 0.1072779, 0, 0, 0, 1, 1,
-0.1966569, 0.04303672, -2.007224, 0, 0, 0, 1, 1,
-0.1952209, 0.1033526, -1.903939, 1, 1, 1, 1, 1,
-0.1910467, 0.2033123, -3.818796, 1, 1, 1, 1, 1,
-0.1868084, -0.6887412, -3.491239, 1, 1, 1, 1, 1,
-0.1861307, -0.153584, -2.390935, 1, 1, 1, 1, 1,
-0.1859462, 0.1407349, -1.206675, 1, 1, 1, 1, 1,
-0.1850262, -0.02226553, -1.57633, 1, 1, 1, 1, 1,
-0.1830211, -0.8187515, -3.922151, 1, 1, 1, 1, 1,
-0.1827473, -0.7245924, -2.00837, 1, 1, 1, 1, 1,
-0.1797663, -0.9156699, -2.657493, 1, 1, 1, 1, 1,
-0.1785829, -0.1466109, -2.868683, 1, 1, 1, 1, 1,
-0.1785206, -0.1766429, -3.596651, 1, 1, 1, 1, 1,
-0.1760931, 1.296502, -0.6493118, 1, 1, 1, 1, 1,
-0.1700604, -0.5538204, -0.5067248, 1, 1, 1, 1, 1,
-0.1691586, 0.04041122, -2.427881, 1, 1, 1, 1, 1,
-0.1666048, 0.4332896, -2.242255, 1, 1, 1, 1, 1,
-0.1659667, -0.4202791, -2.176142, 0, 0, 1, 1, 1,
-0.1650106, -0.04565287, -1.244071, 1, 0, 0, 1, 1,
-0.1594504, -1.695056, -1.228462, 1, 0, 0, 1, 1,
-0.1593536, 0.01042009, -0.6228037, 1, 0, 0, 1, 1,
-0.159061, 1.702118, 2.187938, 1, 0, 0, 1, 1,
-0.1588778, 0.7690498, -1.399684, 1, 0, 0, 1, 1,
-0.1540699, 0.570347, -0.2936277, 0, 0, 0, 1, 1,
-0.1540484, 1.003497, -0.4304794, 0, 0, 0, 1, 1,
-0.1540464, 1.106496, -1.073541, 0, 0, 0, 1, 1,
-0.1518433, 0.1675697, -0.04661049, 0, 0, 0, 1, 1,
-0.1480624, 0.7131548, 0.6865203, 0, 0, 0, 1, 1,
-0.145485, -0.4182362, -1.886007, 0, 0, 0, 1, 1,
-0.1443734, -0.1007581, -0.9666325, 0, 0, 0, 1, 1,
-0.1404301, -0.9992775, -3.524673, 1, 1, 1, 1, 1,
-0.139624, 0.07653238, -1.722174, 1, 1, 1, 1, 1,
-0.1376609, 0.08287321, -0.7688068, 1, 1, 1, 1, 1,
-0.1366039, 1.243154, -0.4478181, 1, 1, 1, 1, 1,
-0.132484, 1.664015, 0.8270396, 1, 1, 1, 1, 1,
-0.1309918, 1.287065, 0.3456763, 1, 1, 1, 1, 1,
-0.1257506, -0.5151711, -2.396571, 1, 1, 1, 1, 1,
-0.1251369, 1.01681, 0.04468425, 1, 1, 1, 1, 1,
-0.1237065, -0.04473635, -2.214883, 1, 1, 1, 1, 1,
-0.1197696, -1.307562, -3.150015, 1, 1, 1, 1, 1,
-0.1183459, -0.3108414, -3.216446, 1, 1, 1, 1, 1,
-0.1162948, -0.05821237, -1.91752, 1, 1, 1, 1, 1,
-0.1144311, 0.5238935, 0.3447497, 1, 1, 1, 1, 1,
-0.1104656, -1.371383, -2.328311, 1, 1, 1, 1, 1,
-0.1078733, 0.6387253, -0.06397666, 1, 1, 1, 1, 1,
-0.1066209, -0.05325934, -2.505645, 0, 0, 1, 1, 1,
-0.1021452, -0.5333934, -2.524215, 1, 0, 0, 1, 1,
-0.09733074, -1.166033, -2.230824, 1, 0, 0, 1, 1,
-0.0971292, 0.2638412, -1.037506, 1, 0, 0, 1, 1,
-0.09692281, 0.1437893, -0.362697, 1, 0, 0, 1, 1,
-0.09516156, 0.7607049, -0.9095215, 1, 0, 0, 1, 1,
-0.09132794, -1.054246, -2.845349, 0, 0, 0, 1, 1,
-0.09054285, -2.32, -2.488935, 0, 0, 0, 1, 1,
-0.08994012, 0.5430612, 0.6777435, 0, 0, 0, 1, 1,
-0.08958369, -1.049655, -5.16414, 0, 0, 0, 1, 1,
-0.08937455, 0.692539, 1.112488, 0, 0, 0, 1, 1,
-0.08296669, 0.796992, -0.4047494, 0, 0, 0, 1, 1,
-0.08180995, -1.173571, -2.525996, 0, 0, 0, 1, 1,
-0.07943951, 0.9487797, -0.7306831, 1, 1, 1, 1, 1,
-0.0749882, -0.6668451, -0.8280439, 1, 1, 1, 1, 1,
-0.07391128, 1.250242, -1.39109, 1, 1, 1, 1, 1,
-0.07345971, -0.4769279, -1.89802, 1, 1, 1, 1, 1,
-0.07099631, 0.1348309, 1.513363, 1, 1, 1, 1, 1,
-0.07090164, 0.7548978, -0.9812517, 1, 1, 1, 1, 1,
-0.07066216, 0.2740498, -0.0906138, 1, 1, 1, 1, 1,
-0.06931091, -1.582292, -4.728834, 1, 1, 1, 1, 1,
-0.06921753, 0.8555048, 1.102348, 1, 1, 1, 1, 1,
-0.06834431, 1.733174, 0.1700665, 1, 1, 1, 1, 1,
-0.06510039, -0.2521622, -4.031928, 1, 1, 1, 1, 1,
-0.06416012, 0.5242183, -0.2914004, 1, 1, 1, 1, 1,
-0.06124505, 2.304339, 0.4888424, 1, 1, 1, 1, 1,
-0.05687354, 0.3063728, -0.02321417, 1, 1, 1, 1, 1,
-0.05444079, 1.580071, -0.2505869, 1, 1, 1, 1, 1,
-0.05248471, 0.5434131, -0.2833705, 0, 0, 1, 1, 1,
-0.05102744, 0.03770079, -1.283799, 1, 0, 0, 1, 1,
-0.04750083, -2.030336, -4.446136, 1, 0, 0, 1, 1,
-0.0437614, -0.5080886, -1.926695, 1, 0, 0, 1, 1,
-0.04323549, -2.230383, -3.071026, 1, 0, 0, 1, 1,
-0.03957418, 0.09468886, -0.6150131, 1, 0, 0, 1, 1,
-0.03543098, -0.535814, -3.961716, 0, 0, 0, 1, 1,
-0.03488824, -0.2502048, -2.429204, 0, 0, 0, 1, 1,
-0.03412064, -0.07982242, -2.503182, 0, 0, 0, 1, 1,
-0.03118311, -0.4755777, -3.077608, 0, 0, 0, 1, 1,
-0.02813444, -0.06094214, -3.066083, 0, 0, 0, 1, 1,
-0.02674213, -0.4257038, -3.96964, 0, 0, 0, 1, 1,
-0.02138893, -1.070668, -3.907803, 0, 0, 0, 1, 1,
-0.01744106, -0.5967357, -3.821702, 1, 1, 1, 1, 1,
-0.01714771, -1.28194, -2.501196, 1, 1, 1, 1, 1,
-0.01617867, -0.1270927, -2.209766, 1, 1, 1, 1, 1,
-0.01099857, -1.754177, -3.102513, 1, 1, 1, 1, 1,
-0.005530628, 0.1434711, -0.4663933, 1, 1, 1, 1, 1,
-0.004826502, -0.004812349, -1.600326, 1, 1, 1, 1, 1,
-0.003952906, 1.416288, 1.269101, 1, 1, 1, 1, 1,
0.001580752, -0.6724626, 3.785212, 1, 1, 1, 1, 1,
0.001686326, -0.7983556, 3.386524, 1, 1, 1, 1, 1,
0.001841845, 0.4745074, 0.5472318, 1, 1, 1, 1, 1,
0.006389813, -0.02090198, 2.022274, 1, 1, 1, 1, 1,
0.007728671, 0.7450258, -1.766128, 1, 1, 1, 1, 1,
0.009154578, 0.6513315, 1.19941, 1, 1, 1, 1, 1,
0.009628011, 1.713663, 0.1161111, 1, 1, 1, 1, 1,
0.01309966, 1.715006, -0.3480229, 1, 1, 1, 1, 1,
0.01377428, -1.43425, 2.475164, 0, 0, 1, 1, 1,
0.01379436, -2.078012, 2.56897, 1, 0, 0, 1, 1,
0.01628154, -1.246624, 3.045661, 1, 0, 0, 1, 1,
0.01726491, -0.6510676, 4.472431, 1, 0, 0, 1, 1,
0.02189418, 0.6382483, 1.022037, 1, 0, 0, 1, 1,
0.02804851, 1.07383, -0.008151444, 1, 0, 0, 1, 1,
0.03899452, 0.5841863, 0.130759, 0, 0, 0, 1, 1,
0.03960557, 0.3845256, 0.0372929, 0, 0, 0, 1, 1,
0.04240417, -1.263183, 3.691139, 0, 0, 0, 1, 1,
0.05932546, -0.4574933, 2.160113, 0, 0, 0, 1, 1,
0.06048841, -0.009781126, -0.2189837, 0, 0, 0, 1, 1,
0.06226759, -0.005888714, 0.9796194, 0, 0, 0, 1, 1,
0.06584083, 0.786829, 1.245978, 0, 0, 0, 1, 1,
0.06802836, 0.04590486, 2.727395, 1, 1, 1, 1, 1,
0.07148429, -0.7199239, 2.877474, 1, 1, 1, 1, 1,
0.07668493, 0.9317951, -2.197524, 1, 1, 1, 1, 1,
0.07764211, 0.04256205, 0.9298105, 1, 1, 1, 1, 1,
0.07972281, 1.488921, -1.982625, 1, 1, 1, 1, 1,
0.08376592, 1.59322, 1.278751, 1, 1, 1, 1, 1,
0.08399009, -1.080683, 3.022114, 1, 1, 1, 1, 1,
0.08424079, 1.95591, 0.2087267, 1, 1, 1, 1, 1,
0.08549058, 0.2317012, 1.073938, 1, 1, 1, 1, 1,
0.08788092, -1.888076, 2.969763, 1, 1, 1, 1, 1,
0.09158837, -1.818463, 2.192589, 1, 1, 1, 1, 1,
0.09188945, 0.7531246, -0.3396686, 1, 1, 1, 1, 1,
0.09450089, -0.05678069, 3.425138, 1, 1, 1, 1, 1,
0.09457457, 0.03820671, 2.930762, 1, 1, 1, 1, 1,
0.09810906, 0.7809473, -1.210553, 1, 1, 1, 1, 1,
0.1024859, 0.6473438, -0.3898307, 0, 0, 1, 1, 1,
0.1029647, 0.3001228, -1.306037, 1, 0, 0, 1, 1,
0.1059099, 0.6967515, -0.7410221, 1, 0, 0, 1, 1,
0.1066564, 1.20203, 1.374224, 1, 0, 0, 1, 1,
0.1068553, 0.6383196, 0.63714, 1, 0, 0, 1, 1,
0.1071801, -0.3633841, 1.188262, 1, 0, 0, 1, 1,
0.1123881, 0.1732847, -1.814129, 0, 0, 0, 1, 1,
0.1168185, -1.016899, 2.228265, 0, 0, 0, 1, 1,
0.1168842, -1.170723, 3.057162, 0, 0, 0, 1, 1,
0.1198521, 0.8407948, -0.9065693, 0, 0, 0, 1, 1,
0.1244636, -0.2625324, 2.208377, 0, 0, 0, 1, 1,
0.1248246, -0.3106184, 4.620355, 0, 0, 0, 1, 1,
0.1302907, -0.8834437, 3.147474, 0, 0, 0, 1, 1,
0.1318504, 1.594558, -0.4191014, 1, 1, 1, 1, 1,
0.1324961, 0.6363915, -0.3546264, 1, 1, 1, 1, 1,
0.1330624, 0.8259132, 0.1059539, 1, 1, 1, 1, 1,
0.1343701, 1.527525, 1.095041, 1, 1, 1, 1, 1,
0.1392111, 0.7743642, 0.1678661, 1, 1, 1, 1, 1,
0.1475992, -0.786245, 3.030288, 1, 1, 1, 1, 1,
0.1481522, -0.7454468, 1.857452, 1, 1, 1, 1, 1,
0.1504958, 0.7644472, 0.2776746, 1, 1, 1, 1, 1,
0.1505366, -0.6114628, 4.17329, 1, 1, 1, 1, 1,
0.1527712, 1.476593, 1.2389, 1, 1, 1, 1, 1,
0.1532273, 0.4668422, 0.4362328, 1, 1, 1, 1, 1,
0.1545025, 0.01053777, 2.063157, 1, 1, 1, 1, 1,
0.1547774, -2.273029, 4.355233, 1, 1, 1, 1, 1,
0.1588916, 2.319603, 0.2817213, 1, 1, 1, 1, 1,
0.1594443, -0.508707, 2.313672, 1, 1, 1, 1, 1,
0.1609413, -0.3323724, 1.39349, 0, 0, 1, 1, 1,
0.1610088, 0.8823205, -0.4241571, 1, 0, 0, 1, 1,
0.1625809, 1.553182, 0.5583038, 1, 0, 0, 1, 1,
0.1643916, -0.1171891, 2.873032, 1, 0, 0, 1, 1,
0.1668304, -1.214025, 2.48832, 1, 0, 0, 1, 1,
0.1736564, -0.6573287, 3.252023, 1, 0, 0, 1, 1,
0.1741828, -0.3338422, 1.323941, 0, 0, 0, 1, 1,
0.1745603, -1.945558, 3.411502, 0, 0, 0, 1, 1,
0.1779967, -0.9201084, 0.5471855, 0, 0, 0, 1, 1,
0.1887672, -0.4975256, 3.841036, 0, 0, 0, 1, 1,
0.1902725, -0.9029787, 2.20115, 0, 0, 0, 1, 1,
0.1914599, 1.096701, 0.2031508, 0, 0, 0, 1, 1,
0.1919087, 1.153808, -0.7814623, 0, 0, 0, 1, 1,
0.1927278, 0.02757282, 3.469625, 1, 1, 1, 1, 1,
0.1931423, -0.1465238, 2.006136, 1, 1, 1, 1, 1,
0.1947516, 0.5448451, 0.4204604, 1, 1, 1, 1, 1,
0.2001445, -2.621741, 1.913269, 1, 1, 1, 1, 1,
0.2005426, -0.2890195, 2.06411, 1, 1, 1, 1, 1,
0.2025006, -0.6192034, 3.268272, 1, 1, 1, 1, 1,
0.2071177, -1.353232, 3.236025, 1, 1, 1, 1, 1,
0.2075592, 0.7741442, -0.3660106, 1, 1, 1, 1, 1,
0.2077409, 2.044089, -0.6955827, 1, 1, 1, 1, 1,
0.2114564, -0.3052547, 1.391376, 1, 1, 1, 1, 1,
0.2118205, 1.379034, 0.3575474, 1, 1, 1, 1, 1,
0.2159658, -0.2205509, 3.373265, 1, 1, 1, 1, 1,
0.2195105, 0.1333261, 1.05824, 1, 1, 1, 1, 1,
0.2211068, -1.276853, 1.514588, 1, 1, 1, 1, 1,
0.2251618, 1.320221, 0.03703527, 1, 1, 1, 1, 1,
0.2253741, -0.9278615, 2.930662, 0, 0, 1, 1, 1,
0.2262016, -0.08181807, 3.237738, 1, 0, 0, 1, 1,
0.2284426, -2.716471, 3.980125, 1, 0, 0, 1, 1,
0.2367366, -0.9608942, 3.931996, 1, 0, 0, 1, 1,
0.2379908, 0.6437616, -1.212325, 1, 0, 0, 1, 1,
0.2383094, 1.064708, -0.6613321, 1, 0, 0, 1, 1,
0.2400351, 1.24388, 0.3540324, 0, 0, 0, 1, 1,
0.2412474, -0.5273904, 3.638726, 0, 0, 0, 1, 1,
0.2475854, 0.5836428, 1.978683, 0, 0, 0, 1, 1,
0.24953, 1.29011, -0.2379588, 0, 0, 0, 1, 1,
0.2515783, 0.02695961, 2.414486, 0, 0, 0, 1, 1,
0.252587, -0.4875492, 2.33274, 0, 0, 0, 1, 1,
0.2530763, 0.9017709, -0.9541625, 0, 0, 0, 1, 1,
0.2537445, -0.6181393, 3.936455, 1, 1, 1, 1, 1,
0.2543042, -1.144459, 3.717945, 1, 1, 1, 1, 1,
0.2560476, -0.5302435, 2.752788, 1, 1, 1, 1, 1,
0.2611634, 0.2501592, -0.902802, 1, 1, 1, 1, 1,
0.2626667, -0.6331265, 5.107658, 1, 1, 1, 1, 1,
0.2634573, -0.4992656, 3.717278, 1, 1, 1, 1, 1,
0.2733402, -1.048037, 3.488852, 1, 1, 1, 1, 1,
0.2738504, -0.02390507, 0.4530897, 1, 1, 1, 1, 1,
0.27881, 0.5290849, -2.10899, 1, 1, 1, 1, 1,
0.2808894, 1.115575, 0.7828075, 1, 1, 1, 1, 1,
0.2834637, 1.850186, 1.369732, 1, 1, 1, 1, 1,
0.2841595, 0.6443309, 0.6135857, 1, 1, 1, 1, 1,
0.2860831, -1.800859, 1.226952, 1, 1, 1, 1, 1,
0.290545, 0.2692041, 0.3982881, 1, 1, 1, 1, 1,
0.2917405, 1.096316, -0.02831714, 1, 1, 1, 1, 1,
0.298066, -0.06634969, 0.2101748, 0, 0, 1, 1, 1,
0.2998946, 1.658793, 0.8153973, 1, 0, 0, 1, 1,
0.3033262, 1.124467, 1.3726, 1, 0, 0, 1, 1,
0.3040271, -0.1783156, 2.382638, 1, 0, 0, 1, 1,
0.3043728, 0.8370351, -1.621884, 1, 0, 0, 1, 1,
0.3086997, 0.878581, 0.3923643, 1, 0, 0, 1, 1,
0.3158183, -0.2384763, 2.314495, 0, 0, 0, 1, 1,
0.3163535, 0.2822159, 2.4016, 0, 0, 0, 1, 1,
0.3176692, 1.279647, -1.714346, 0, 0, 0, 1, 1,
0.3192486, 1.124795, -0.1041018, 0, 0, 0, 1, 1,
0.3197221, 1.32712, 1.421376, 0, 0, 0, 1, 1,
0.3254361, -2.099664, 2.534979, 0, 0, 0, 1, 1,
0.3258854, -0.1552898, 1.749778, 0, 0, 0, 1, 1,
0.3333418, 0.2617401, 0.7451446, 1, 1, 1, 1, 1,
0.3359599, 0.4608432, 0.2216874, 1, 1, 1, 1, 1,
0.3364086, 1.106125, 1.335391, 1, 1, 1, 1, 1,
0.3386047, -0.7572741, 3.334365, 1, 1, 1, 1, 1,
0.3394316, -0.3552784, 1.806123, 1, 1, 1, 1, 1,
0.3406534, -0.1216621, 1.231445, 1, 1, 1, 1, 1,
0.3407663, -0.6161942, 3.899008, 1, 1, 1, 1, 1,
0.3420664, -0.06928931, 0.5290456, 1, 1, 1, 1, 1,
0.3451026, 0.460638, 0.8034843, 1, 1, 1, 1, 1,
0.3469541, 2.01991, 0.676653, 1, 1, 1, 1, 1,
0.3485013, 0.7564476, -1.242386, 1, 1, 1, 1, 1,
0.3500359, 0.6356301, 0.6070628, 1, 1, 1, 1, 1,
0.3510213, -1.345958, 3.683474, 1, 1, 1, 1, 1,
0.3527161, 0.9390675, -0.9134028, 1, 1, 1, 1, 1,
0.3532301, 0.6980814, 1.676562, 1, 1, 1, 1, 1,
0.355242, -0.8667616, 1.96533, 0, 0, 1, 1, 1,
0.3556831, 0.4720626, 2.718289, 1, 0, 0, 1, 1,
0.359806, -0.05484185, 2.541623, 1, 0, 0, 1, 1,
0.3603736, -0.6532385, 1.82767, 1, 0, 0, 1, 1,
0.3656386, -0.1913872, 1.845095, 1, 0, 0, 1, 1,
0.3661134, -0.2375421, 2.246053, 1, 0, 0, 1, 1,
0.3676862, -0.04421823, 1.998565, 0, 0, 0, 1, 1,
0.373765, 1.40371, -0.2645583, 0, 0, 0, 1, 1,
0.3764651, 3.61524, -1.898784, 0, 0, 0, 1, 1,
0.3795474, 0.7519147, -0.8250256, 0, 0, 0, 1, 1,
0.3804553, -0.58791, 3.432035, 0, 0, 0, 1, 1,
0.3823422, -1.26801, 2.830963, 0, 0, 0, 1, 1,
0.3848285, 0.2767954, 1.199628, 0, 0, 0, 1, 1,
0.3903942, -0.002445829, 3.066857, 1, 1, 1, 1, 1,
0.3911859, 2.030189, -0.1334589, 1, 1, 1, 1, 1,
0.3917494, -0.2167681, 0.833979, 1, 1, 1, 1, 1,
0.392423, 1.5841, 0.0023684, 1, 1, 1, 1, 1,
0.3980584, -2.698616, 2.583245, 1, 1, 1, 1, 1,
0.4009939, -0.7454824, 2.749897, 1, 1, 1, 1, 1,
0.4119775, -0.5630218, 1.548967, 1, 1, 1, 1, 1,
0.4137936, 0.2232717, 1.755249, 1, 1, 1, 1, 1,
0.4157558, 1.054024, 0.2618215, 1, 1, 1, 1, 1,
0.4166456, 0.8092361, 1.416963, 1, 1, 1, 1, 1,
0.4220598, -1.238996, 3.463881, 1, 1, 1, 1, 1,
0.4231785, -0.284217, 2.381543, 1, 1, 1, 1, 1,
0.4236621, 0.3652327, 0.01761384, 1, 1, 1, 1, 1,
0.4257672, 1.245592, 0.2951769, 1, 1, 1, 1, 1,
0.4268274, -0.675779, 5.170109, 1, 1, 1, 1, 1,
0.4325159, 1.475911, -0.4575284, 0, 0, 1, 1, 1,
0.4392678, -0.4956337, 2.477633, 1, 0, 0, 1, 1,
0.4436578, 1.563673, 1.556287, 1, 0, 0, 1, 1,
0.445817, -0.5006551, 2.988838, 1, 0, 0, 1, 1,
0.4494334, 1.017139, -1.570659, 1, 0, 0, 1, 1,
0.4585435, 1.809203, -0.1243028, 1, 0, 0, 1, 1,
0.4609114, 1.40769, 1.044375, 0, 0, 0, 1, 1,
0.468298, -2.555181, 3.868957, 0, 0, 0, 1, 1,
0.4737443, -1.400116, 2.971233, 0, 0, 0, 1, 1,
0.474529, -1.744913, 2.884521, 0, 0, 0, 1, 1,
0.4779829, 0.3541231, 0.4219644, 0, 0, 0, 1, 1,
0.4785475, -1.763569, 3.33904, 0, 0, 0, 1, 1,
0.4793481, -1.57168, 3.105532, 0, 0, 0, 1, 1,
0.4794232, 0.04026758, 2.494936, 1, 1, 1, 1, 1,
0.4824173, -1.117057, 2.596952, 1, 1, 1, 1, 1,
0.4856399, 0.3268636, 1.360496, 1, 1, 1, 1, 1,
0.486413, -1.197248, 2.61235, 1, 1, 1, 1, 1,
0.4866287, -0.9118028, 2.079269, 1, 1, 1, 1, 1,
0.4887771, -0.4818455, 1.946722, 1, 1, 1, 1, 1,
0.4899588, -1.13552, 3.870248, 1, 1, 1, 1, 1,
0.4938166, 0.6856817, 3.567346, 1, 1, 1, 1, 1,
0.4982207, 0.4568789, 0.5351241, 1, 1, 1, 1, 1,
0.4983706, -0.6583802, 3.537846, 1, 1, 1, 1, 1,
0.4992014, 1.401095, 1.033062, 1, 1, 1, 1, 1,
0.4999208, -0.5430448, 3.021346, 1, 1, 1, 1, 1,
0.502991, 0.2534906, 0.2778998, 1, 1, 1, 1, 1,
0.5038191, -0.1925804, 2.518194, 1, 1, 1, 1, 1,
0.5088351, 0.7942832, 0.5178109, 1, 1, 1, 1, 1,
0.5091929, 0.2431067, 1.390051, 0, 0, 1, 1, 1,
0.5147994, -0.640386, 2.212589, 1, 0, 0, 1, 1,
0.5190578, -0.4418359, 1.783832, 1, 0, 0, 1, 1,
0.5269011, -0.2058592, 1.87304, 1, 0, 0, 1, 1,
0.5313935, 0.775757, 2.887237, 1, 0, 0, 1, 1,
0.5334048, -0.951508, 3.820091, 1, 0, 0, 1, 1,
0.5383012, -0.2227253, 2.809522, 0, 0, 0, 1, 1,
0.5474337, -0.3493561, 1.757962, 0, 0, 0, 1, 1,
0.5481108, 1.369801, -0.6323516, 0, 0, 0, 1, 1,
0.5494681, -0.9117603, 3.457494, 0, 0, 0, 1, 1,
0.5526425, 0.978987, 1.450078, 0, 0, 0, 1, 1,
0.5599931, -0.6160463, 1.476437, 0, 0, 0, 1, 1,
0.5609655, -0.2257576, 1.197051, 0, 0, 0, 1, 1,
0.5643778, 1.553777, -0.4314695, 1, 1, 1, 1, 1,
0.5652747, 0.819808, -0.9352081, 1, 1, 1, 1, 1,
0.5672035, -0.07095136, 3.529479, 1, 1, 1, 1, 1,
0.5701873, -0.3017804, 2.549479, 1, 1, 1, 1, 1,
0.5714198, 0.08835834, 1.774439, 1, 1, 1, 1, 1,
0.5749942, 0.3848585, 0.6495498, 1, 1, 1, 1, 1,
0.5759758, 0.298295, 0.1027543, 1, 1, 1, 1, 1,
0.5759918, 0.2892987, 1.268879, 1, 1, 1, 1, 1,
0.5762188, 0.5383244, -0.4004024, 1, 1, 1, 1, 1,
0.5772702, -1.399013, 1.774897, 1, 1, 1, 1, 1,
0.5800777, -0.03023167, 0.2865932, 1, 1, 1, 1, 1,
0.580714, -2.740374, 3.042415, 1, 1, 1, 1, 1,
0.5810634, -0.4442646, 3.96905, 1, 1, 1, 1, 1,
0.5828498, -2.040586, 4.30074, 1, 1, 1, 1, 1,
0.5832298, -0.3788266, 1.685187, 1, 1, 1, 1, 1,
0.5838919, 1.035018, 0.7075197, 0, 0, 1, 1, 1,
0.5885887, 0.07625621, 0.1875777, 1, 0, 0, 1, 1,
0.5911921, 0.487579, 1.916563, 1, 0, 0, 1, 1,
0.5931466, -1.02042, 3.153839, 1, 0, 0, 1, 1,
0.5967698, 0.3279905, -2.426985, 1, 0, 0, 1, 1,
0.5998715, -0.651136, 2.428867, 1, 0, 0, 1, 1,
0.6021522, -0.3456049, 2.985543, 0, 0, 0, 1, 1,
0.6045827, -0.06618728, 1.796547, 0, 0, 0, 1, 1,
0.6094522, -0.4174304, 1.414055, 0, 0, 0, 1, 1,
0.61244, -0.1300342, 2.949604, 0, 0, 0, 1, 1,
0.6223093, 1.10527, -0.3338426, 0, 0, 0, 1, 1,
0.6231537, -0.07275575, 2.880067, 0, 0, 0, 1, 1,
0.6238225, -0.07357739, 1.887769, 0, 0, 0, 1, 1,
0.6279484, 0.2144069, 2.358444, 1, 1, 1, 1, 1,
0.6286891, -0.3086606, 1.514994, 1, 1, 1, 1, 1,
0.6324225, -0.3736052, 2.62847, 1, 1, 1, 1, 1,
0.6349784, 0.5500848, 1.072052, 1, 1, 1, 1, 1,
0.6435908, 0.06029696, 0.5661021, 1, 1, 1, 1, 1,
0.6452463, 1.677232, -0.2221426, 1, 1, 1, 1, 1,
0.645483, 0.3161812, -0.3653987, 1, 1, 1, 1, 1,
0.6494034, -1.0064, 0.5677316, 1, 1, 1, 1, 1,
0.6494725, -0.1323584, 1.712637, 1, 1, 1, 1, 1,
0.6495048, 1.311516, 0.6981629, 1, 1, 1, 1, 1,
0.6497335, 0.2097462, 0.7506922, 1, 1, 1, 1, 1,
0.6503572, -0.05453288, 0.69376, 1, 1, 1, 1, 1,
0.662342, -1.241661, 3.000246, 1, 1, 1, 1, 1,
0.6645949, -0.5913993, 3.675816, 1, 1, 1, 1, 1,
0.6774415, -1.312831, 3.33528, 1, 1, 1, 1, 1,
0.6806445, -0.1348365, 2.302762, 0, 0, 1, 1, 1,
0.6822296, -1.506108, 3.196555, 1, 0, 0, 1, 1,
0.6846678, -0.8308331, 2.477386, 1, 0, 0, 1, 1,
0.6848595, -0.7775174, 1.21707, 1, 0, 0, 1, 1,
0.6869321, 1.152467, 0.5826941, 1, 0, 0, 1, 1,
0.700098, -0.4045957, 0.04312508, 1, 0, 0, 1, 1,
0.7008842, -0.4009795, 2.661215, 0, 0, 0, 1, 1,
0.7023478, 2.032345, -0.2958762, 0, 0, 0, 1, 1,
0.7027938, -0.9511461, 4.235323, 0, 0, 0, 1, 1,
0.7070495, -0.606419, 2.43357, 0, 0, 0, 1, 1,
0.708007, 0.9786656, 1.476005, 0, 0, 0, 1, 1,
0.7082289, 0.6565412, 0.2189676, 0, 0, 0, 1, 1,
0.7090184, -0.4905581, 2.210203, 0, 0, 0, 1, 1,
0.7106821, -0.2197145, 0.6275101, 1, 1, 1, 1, 1,
0.7131247, 1.06497, 1.238297, 1, 1, 1, 1, 1,
0.7152058, -0.4616472, 1.35349, 1, 1, 1, 1, 1,
0.7221851, -0.1623749, 1.810365, 1, 1, 1, 1, 1,
0.7335405, 0.2602028, 1.410163, 1, 1, 1, 1, 1,
0.7348565, 1.160835, 1.253006, 1, 1, 1, 1, 1,
0.7382294, -0.2503481, 0.6199471, 1, 1, 1, 1, 1,
0.7386631, 1.005743, 2.901349, 1, 1, 1, 1, 1,
0.7389652, 0.4193828, 1.607206, 1, 1, 1, 1, 1,
0.7410002, 1.003123, 1.038539, 1, 1, 1, 1, 1,
0.7426911, -0.7586353, 0.2159319, 1, 1, 1, 1, 1,
0.7457674, -0.3995471, 1.62547, 1, 1, 1, 1, 1,
0.7617854, 1.091189, 1.019544, 1, 1, 1, 1, 1,
0.7687773, 0.3253005, 0.1907526, 1, 1, 1, 1, 1,
0.7714782, -0.6288269, 1.463966, 1, 1, 1, 1, 1,
0.7743216, -0.002925421, 1.660799, 0, 0, 1, 1, 1,
0.7823462, 0.9860333, 2.239789, 1, 0, 0, 1, 1,
0.784901, -0.5538524, 2.743381, 1, 0, 0, 1, 1,
0.7851567, 0.9546794, 2.830675, 1, 0, 0, 1, 1,
0.7892407, 2.411313, -0.8404274, 1, 0, 0, 1, 1,
0.7897336, 0.08788795, 0.3304981, 1, 0, 0, 1, 1,
0.7923309, -0.04740797, 3.211932, 0, 0, 0, 1, 1,
0.7946498, 0.2288297, 1.928617, 0, 0, 0, 1, 1,
0.8035561, 2.001744, -0.3695558, 0, 0, 0, 1, 1,
0.8058006, 0.1947114, 3.119163, 0, 0, 0, 1, 1,
0.8094388, -2.245896, 0.7526439, 0, 0, 0, 1, 1,
0.8131859, -0.2000101, 0.6011674, 0, 0, 0, 1, 1,
0.817311, -1.413545, 2.459084, 0, 0, 0, 1, 1,
0.8174589, -0.3272547, 2.0474, 1, 1, 1, 1, 1,
0.8180686, -1.873653, 2.229038, 1, 1, 1, 1, 1,
0.8204239, -0.2872936, -0.2372744, 1, 1, 1, 1, 1,
0.8277947, 0.7305232, 0.8475972, 1, 1, 1, 1, 1,
0.8278685, 0.8358828, 0.8863717, 1, 1, 1, 1, 1,
0.8321454, -0.7141116, 2.472271, 1, 1, 1, 1, 1,
0.8342259, -0.5865633, 2.241439, 1, 1, 1, 1, 1,
0.8353319, -0.1849184, 1.252665, 1, 1, 1, 1, 1,
0.8365468, 0.1086948, 2.342603, 1, 1, 1, 1, 1,
0.8431187, -0.02682661, -0.411989, 1, 1, 1, 1, 1,
0.8468041, 0.8400245, -1.504789, 1, 1, 1, 1, 1,
0.8514228, -0.879388, 1.915648, 1, 1, 1, 1, 1,
0.8545156, 0.8364977, 1.189627, 1, 1, 1, 1, 1,
0.8552316, -0.2422113, 0.5194281, 1, 1, 1, 1, 1,
0.8576142, 0.7765211, 1.418081, 1, 1, 1, 1, 1,
0.8585493, -2.553675, 2.716191, 0, 0, 1, 1, 1,
0.8612782, 0.3562112, -0.3975889, 1, 0, 0, 1, 1,
0.8696377, -0.503224, 3.028608, 1, 0, 0, 1, 1,
0.86988, 1.718391, 0.3298689, 1, 0, 0, 1, 1,
0.8700117, -2.847535, 4.01345, 1, 0, 0, 1, 1,
0.8750553, -0.6492808, 0.1235654, 1, 0, 0, 1, 1,
0.8834895, -1.139965, 2.226173, 0, 0, 0, 1, 1,
0.8841245, 0.2374682, 1.84009, 0, 0, 0, 1, 1,
0.8905267, 0.5990545, 1.387756, 0, 0, 0, 1, 1,
0.8942571, -0.1765427, 0.9438928, 0, 0, 0, 1, 1,
0.898751, -0.2279864, 2.339872, 0, 0, 0, 1, 1,
0.9060522, -1.16031, 0.9690654, 0, 0, 0, 1, 1,
0.9085062, 1.684328, 0.1259629, 0, 0, 0, 1, 1,
0.9088469, 1.681405, 0.1267833, 1, 1, 1, 1, 1,
0.909736, -0.634613, 1.841537, 1, 1, 1, 1, 1,
0.9129416, -0.6121338, 1.99494, 1, 1, 1, 1, 1,
0.9134239, -1.071616, 1.718131, 1, 1, 1, 1, 1,
0.9173561, -0.9819183, 3.838239, 1, 1, 1, 1, 1,
0.9370997, 0.966489, 1.717888, 1, 1, 1, 1, 1,
0.939553, 0.04443961, 1.999542, 1, 1, 1, 1, 1,
0.9401282, -1.301984, 3.006625, 1, 1, 1, 1, 1,
0.9604055, 1.139353, 1.840763, 1, 1, 1, 1, 1,
0.9725319, 0.2783361, 2.799793, 1, 1, 1, 1, 1,
0.9745566, -0.08493989, 1.335825, 1, 1, 1, 1, 1,
0.9892191, 0.3285027, 1.586648, 1, 1, 1, 1, 1,
0.996155, -0.533021, 2.846664, 1, 1, 1, 1, 1,
0.9983692, -0.0524588, 1.706125, 1, 1, 1, 1, 1,
0.9989247, 0.1431049, 0.764868, 1, 1, 1, 1, 1,
1.003412, -0.9700679, 0.7934688, 0, 0, 1, 1, 1,
1.004528, 0.7634571, 3.819774, 1, 0, 0, 1, 1,
1.012198, -2.302342, 4.289515, 1, 0, 0, 1, 1,
1.012618, -2.595857, 3.541568, 1, 0, 0, 1, 1,
1.015976, -0.9946344, 3.13971, 1, 0, 0, 1, 1,
1.018323, -0.6490926, 2.801705, 1, 0, 0, 1, 1,
1.023516, 1.985349, -1.053329, 0, 0, 0, 1, 1,
1.027128, -1.073522, 2.397324, 0, 0, 0, 1, 1,
1.028027, 0.8744509, 1.006783, 0, 0, 0, 1, 1,
1.029117, -0.4983607, 2.602921, 0, 0, 0, 1, 1,
1.030093, -0.1029182, 1.013651, 0, 0, 0, 1, 1,
1.034118, -0.3975104, 2.055581, 0, 0, 0, 1, 1,
1.050672, -0.1747672, 1.728218, 0, 0, 0, 1, 1,
1.058008, 1.171847, 0.06756318, 1, 1, 1, 1, 1,
1.058232, 0.8888031, 1.515523, 1, 1, 1, 1, 1,
1.061891, -1.083557, 1.871447, 1, 1, 1, 1, 1,
1.061981, 1.476454, -0.4906349, 1, 1, 1, 1, 1,
1.063592, 0.4247218, 1.668254, 1, 1, 1, 1, 1,
1.070298, 0.2677612, 1.655234, 1, 1, 1, 1, 1,
1.075403, -0.7006732, 4.604674, 1, 1, 1, 1, 1,
1.076455, -1.665689, 2.922894, 1, 1, 1, 1, 1,
1.080493, 0.8088766, 2.203704, 1, 1, 1, 1, 1,
1.083188, 0.374451, -0.7455809, 1, 1, 1, 1, 1,
1.08664, 0.130705, 1.842386, 1, 1, 1, 1, 1,
1.088629, 1.247416, 1.731136, 1, 1, 1, 1, 1,
1.102652, 0.3793958, 1.425712, 1, 1, 1, 1, 1,
1.114365, 1.238128, 1.171803, 1, 1, 1, 1, 1,
1.115229, -0.2342882, 3.207754, 1, 1, 1, 1, 1,
1.126352, -0.4474804, 2.036405, 0, 0, 1, 1, 1,
1.131249, -0.2307453, 1.098614, 1, 0, 0, 1, 1,
1.135628, 0.5644023, 1.265996, 1, 0, 0, 1, 1,
1.145582, 1.321977, 2.341187, 1, 0, 0, 1, 1,
1.146922, -0.4687938, 1.107444, 1, 0, 0, 1, 1,
1.153536, -0.811153, 2.334151, 1, 0, 0, 1, 1,
1.156949, 2.569219, 1.026403, 0, 0, 0, 1, 1,
1.163477, -0.1591958, 1.908784, 0, 0, 0, 1, 1,
1.177284, 0.8862839, 1.007188, 0, 0, 0, 1, 1,
1.183979, -0.7893878, 2.586378, 0, 0, 0, 1, 1,
1.18619, -0.5097391, 2.710253, 0, 0, 0, 1, 1,
1.186618, -2.001256, 1.998143, 0, 0, 0, 1, 1,
1.189777, -0.9616264, 1.769626, 0, 0, 0, 1, 1,
1.194103, 0.6021926, -0.01652494, 1, 1, 1, 1, 1,
1.195505, -0.5363299, 0.9882703, 1, 1, 1, 1, 1,
1.197577, 0.08397435, 1.56381, 1, 1, 1, 1, 1,
1.199127, 0.9793736, -0.0102248, 1, 1, 1, 1, 1,
1.20228, -0.6401984, 2.473428, 1, 1, 1, 1, 1,
1.203754, 1.080523, 0.1619784, 1, 1, 1, 1, 1,
1.204728, 0.1995573, 2.63579, 1, 1, 1, 1, 1,
1.222369, -0.3621515, 1.776987, 1, 1, 1, 1, 1,
1.231024, 0.6011459, 0.7030824, 1, 1, 1, 1, 1,
1.231966, -0.7728172, 2.764606, 1, 1, 1, 1, 1,
1.237591, 0.1158383, 0.6484069, 1, 1, 1, 1, 1,
1.245558, 0.6616083, 1.594434, 1, 1, 1, 1, 1,
1.253138, -0.08199936, 1.585309, 1, 1, 1, 1, 1,
1.261282, 0.03850354, 1.493482, 1, 1, 1, 1, 1,
1.263473, 0.5087719, 1.690568, 1, 1, 1, 1, 1,
1.274333, 1.048105, 1.624037, 0, 0, 1, 1, 1,
1.278072, 1.012518, 0.1957278, 1, 0, 0, 1, 1,
1.281839, 2.365906, 1.525581, 1, 0, 0, 1, 1,
1.285544, 0.6594366, 2.041082, 1, 0, 0, 1, 1,
1.298526, -0.05104632, 2.945725, 1, 0, 0, 1, 1,
1.301182, -0.4554761, 2.858157, 1, 0, 0, 1, 1,
1.304522, -0.2979441, 1.378772, 0, 0, 0, 1, 1,
1.310547, 0.719517, 1.53712, 0, 0, 0, 1, 1,
1.330038, 0.4340228, 1.107363, 0, 0, 0, 1, 1,
1.343524, 0.1995456, 2.791001, 0, 0, 0, 1, 1,
1.344103, 0.07600646, 2.40545, 0, 0, 0, 1, 1,
1.369463, -1.634953, 1.53555, 0, 0, 0, 1, 1,
1.377603, -1.094133, 2.499346, 0, 0, 0, 1, 1,
1.382557, 1.533188, -1.117894, 1, 1, 1, 1, 1,
1.387631, -0.6021116, 0.9250277, 1, 1, 1, 1, 1,
1.400487, 0.3768918, 0.5521834, 1, 1, 1, 1, 1,
1.405127, 0.1553274, 3.263593, 1, 1, 1, 1, 1,
1.40832, -1.341432, 3.19269, 1, 1, 1, 1, 1,
1.410818, -0.7826652, 1.697202, 1, 1, 1, 1, 1,
1.413948, 0.05899177, 0.1205778, 1, 1, 1, 1, 1,
1.418489, -0.03515004, 1.953309, 1, 1, 1, 1, 1,
1.434575, -0.3908261, 2.71363, 1, 1, 1, 1, 1,
1.438709, -0.2145107, 1.640585, 1, 1, 1, 1, 1,
1.447175, -0.2078172, 0.2309349, 1, 1, 1, 1, 1,
1.451864, -0.02870143, 1.109646, 1, 1, 1, 1, 1,
1.458253, -0.7931461, 3.48243, 1, 1, 1, 1, 1,
1.472144, -0.6164399, 1.057153, 1, 1, 1, 1, 1,
1.475134, -0.5780996, 1.912324, 1, 1, 1, 1, 1,
1.482597, -1.444095, 2.383702, 0, 0, 1, 1, 1,
1.485752, 0.6829416, 0.9891205, 1, 0, 0, 1, 1,
1.486503, 1.533016, 0.5941396, 1, 0, 0, 1, 1,
1.486638, -0.1709773, 2.851733, 1, 0, 0, 1, 1,
1.48858, 0.5930806, 0.2475011, 1, 0, 0, 1, 1,
1.489645, -0.5158808, 0.4229941, 1, 0, 0, 1, 1,
1.490562, -0.01827475, 1.798286, 0, 0, 0, 1, 1,
1.493682, 0.2051102, 1.515131, 0, 0, 0, 1, 1,
1.501875, -0.3445178, 2.155674, 0, 0, 0, 1, 1,
1.501902, -1.917734, 1.525383, 0, 0, 0, 1, 1,
1.503902, 0.1492401, 1.77425, 0, 0, 0, 1, 1,
1.521168, 0.8064421, 2.023236, 0, 0, 0, 1, 1,
1.532488, -1.029074, 2.486744, 0, 0, 0, 1, 1,
1.557573, 1.007164, 0.3224126, 1, 1, 1, 1, 1,
1.559895, -2.032946, 2.082247, 1, 1, 1, 1, 1,
1.563932, -0.7331123, 2.130547, 1, 1, 1, 1, 1,
1.56547, -0.3583137, 1.173286, 1, 1, 1, 1, 1,
1.574816, 0.247418, 2.257627, 1, 1, 1, 1, 1,
1.60174, -1.77694, 0.6371254, 1, 1, 1, 1, 1,
1.607554, -0.7960037, 2.051384, 1, 1, 1, 1, 1,
1.637237, 0.5386298, 0.6066013, 1, 1, 1, 1, 1,
1.65009, 0.9309984, 1.635163, 1, 1, 1, 1, 1,
1.659527, 2.018041, 1.407692, 1, 1, 1, 1, 1,
1.662623, -0.2118869, 4.58336, 1, 1, 1, 1, 1,
1.701154, 0.294915, 2.11917, 1, 1, 1, 1, 1,
1.713216, -0.8983755, 3.165745, 1, 1, 1, 1, 1,
1.735893, -0.06148256, 0.2438241, 1, 1, 1, 1, 1,
1.752847, 0.5395752, -0.1301627, 1, 1, 1, 1, 1,
1.760935, 0.7059394, 0.3560751, 0, 0, 1, 1, 1,
1.777173, 0.7655236, 2.020365, 1, 0, 0, 1, 1,
1.788117, -0.8196925, 3.820991, 1, 0, 0, 1, 1,
1.796979, -1.02397, 2.357621, 1, 0, 0, 1, 1,
1.805318, 0.02436657, 1.482685, 1, 0, 0, 1, 1,
1.814734, 0.246142, 3.495669, 1, 0, 0, 1, 1,
1.835404, 1.747246, 0.712621, 0, 0, 0, 1, 1,
1.840436, 0.1294893, -0.7612536, 0, 0, 0, 1, 1,
1.843388, -1.388426, 2.607246, 0, 0, 0, 1, 1,
1.855517, -0.7335073, 3.382817, 0, 0, 0, 1, 1,
1.865452, 1.017961, 0.8222981, 0, 0, 0, 1, 1,
1.91021, 0.6088021, 1.024748, 0, 0, 0, 1, 1,
1.925563, -0.05218579, 2.232364, 0, 0, 0, 1, 1,
1.931835, 2.64436, 2.216649, 1, 1, 1, 1, 1,
1.943068, -1.106181, 3.392667, 1, 1, 1, 1, 1,
1.958947, 1.357996, -0.6283638, 1, 1, 1, 1, 1,
1.959867, -1.142731, -0.02950779, 1, 1, 1, 1, 1,
1.963465, 0.7150374, 1.274964, 1, 1, 1, 1, 1,
1.964984, 1.239383, 2.493079, 1, 1, 1, 1, 1,
1.974669, -1.257986, 2.749425, 1, 1, 1, 1, 1,
2.018393, -0.2783464, 1.121057, 1, 1, 1, 1, 1,
2.019992, 0.8429587, 0.5391645, 1, 1, 1, 1, 1,
2.050266, -0.375345, 2.750233, 1, 1, 1, 1, 1,
2.080667, -0.751874, 2.814121, 1, 1, 1, 1, 1,
2.103672, -0.2013866, 1.955023, 1, 1, 1, 1, 1,
2.108739, -0.724525, 2.574292, 1, 1, 1, 1, 1,
2.129558, 0.6407315, 1.662231, 1, 1, 1, 1, 1,
2.136543, -0.8369637, 2.152972, 1, 1, 1, 1, 1,
2.142956, -0.4895885, 1.293504, 0, 0, 1, 1, 1,
2.14765, -0.7757602, 3.207631, 1, 0, 0, 1, 1,
2.174114, 0.4574516, -0.05946996, 1, 0, 0, 1, 1,
2.202623, 0.5098535, 2.324175, 1, 0, 0, 1, 1,
2.242222, 0.2590541, 0.4397759, 1, 0, 0, 1, 1,
2.254301, 1.317094, 1.98601, 1, 0, 0, 1, 1,
2.257727, -0.0996199, 2.897532, 0, 0, 0, 1, 1,
2.274808, -0.148994, 1.138647, 0, 0, 0, 1, 1,
2.359907, 0.5828406, 2.447879, 0, 0, 0, 1, 1,
2.379269, -2.296899, 3.46406, 0, 0, 0, 1, 1,
2.441408, 1.147374, 1.452653, 0, 0, 0, 1, 1,
2.475588, -0.3551242, 1.425043, 0, 0, 0, 1, 1,
2.477549, -0.5793856, 2.143877, 0, 0, 0, 1, 1,
2.539186, 2.364141, 1.391583, 1, 1, 1, 1, 1,
2.617745, -0.3631902, 2.825919, 1, 1, 1, 1, 1,
2.668164, -0.562739, 2.249507, 1, 1, 1, 1, 1,
2.684785, 1.130101, 1.567716, 1, 1, 1, 1, 1,
2.739443, 1.068649, 0.9181266, 1, 1, 1, 1, 1,
2.941952, -1.846424, 1.235184, 1, 1, 1, 1, 1,
3.055209, -0.4901379, -0.2106038, 1, 1, 1, 1, 1
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
var radius = 9.699136;
var distance = 34.0678;
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
mvMatrix.translate( 0.2753873, -0.2906656, 0.1773679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0678);
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
