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
-2.994824, 0.336762, -1.287572, 1, 0, 0, 1,
-2.642818, -0.6360103, -1.880637, 1, 0.007843138, 0, 1,
-2.61371, -0.787213, -2.072512, 1, 0.01176471, 0, 1,
-2.575486, -0.06660487, -1.731057, 1, 0.01960784, 0, 1,
-2.430228, -0.7953321, -0.5482105, 1, 0.02352941, 0, 1,
-2.418564, 0.4517206, -0.9845929, 1, 0.03137255, 0, 1,
-2.402099, 0.8857145, -1.41301, 1, 0.03529412, 0, 1,
-2.397907, -0.6952006, -0.9468568, 1, 0.04313726, 0, 1,
-2.381732, 1.456611, -0.07528993, 1, 0.04705882, 0, 1,
-2.356443, 0.1979107, -1.431515, 1, 0.05490196, 0, 1,
-2.355098, 0.2701627, -1.235457, 1, 0.05882353, 0, 1,
-2.350672, -0.6484612, -1.404817, 1, 0.06666667, 0, 1,
-2.339252, -1.261466, -1.071277, 1, 0.07058824, 0, 1,
-2.307204, -1.504999, -2.039912, 1, 0.07843138, 0, 1,
-2.302857, 0.1522088, -2.403822, 1, 0.08235294, 0, 1,
-2.284984, 0.1718464, 0.3648804, 1, 0.09019608, 0, 1,
-2.261203, 0.6248857, -0.530134, 1, 0.09411765, 0, 1,
-2.255155, 1.263802, -1.736726, 1, 0.1019608, 0, 1,
-2.177556, -0.07533217, -2.210302, 1, 0.1098039, 0, 1,
-2.151422, 0.8551483, -0.5070133, 1, 0.1137255, 0, 1,
-2.092907, -0.06470173, -2.8392, 1, 0.1215686, 0, 1,
-2.089732, -1.426572, -4.992789, 1, 0.1254902, 0, 1,
-2.082922, 0.05428819, -0.6026657, 1, 0.1333333, 0, 1,
-2.063195, 0.7360231, -2.248648, 1, 0.1372549, 0, 1,
-2.055086, -0.7928354, -1.795986, 1, 0.145098, 0, 1,
-2.051638, -1.194113, -3.132951, 1, 0.1490196, 0, 1,
-2.025303, -0.2594444, -2.450014, 1, 0.1568628, 0, 1,
-2.012562, 0.09788369, -1.766404, 1, 0.1607843, 0, 1,
-2.005573, 1.07881, -1.956604, 1, 0.1686275, 0, 1,
-1.961985, -1.595014, -1.655688, 1, 0.172549, 0, 1,
-1.960704, -0.671271, -1.580981, 1, 0.1803922, 0, 1,
-1.959812, 0.3151292, -1.702229, 1, 0.1843137, 0, 1,
-1.955607, -0.6691493, -0.448269, 1, 0.1921569, 0, 1,
-1.952697, 0.149583, -2.532617, 1, 0.1960784, 0, 1,
-1.941209, 1.890096, 0.09710444, 1, 0.2039216, 0, 1,
-1.916879, -0.244433, -2.064934, 1, 0.2117647, 0, 1,
-1.90402, 1.06828, -2.358528, 1, 0.2156863, 0, 1,
-1.897007, -1.06635, -3.315558, 1, 0.2235294, 0, 1,
-1.882969, 0.4353637, -1.270363, 1, 0.227451, 0, 1,
-1.878417, 0.4969689, -1.851106, 1, 0.2352941, 0, 1,
-1.873101, -0.8413524, -1.872714, 1, 0.2392157, 0, 1,
-1.845027, -0.3300266, -1.915427, 1, 0.2470588, 0, 1,
-1.825182, -1.114713, -1.782141, 1, 0.2509804, 0, 1,
-1.805576, 0.2378406, -2.862006, 1, 0.2588235, 0, 1,
-1.802157, 0.4317276, -0.9352629, 1, 0.2627451, 0, 1,
-1.798838, 0.1394658, -1.402573, 1, 0.2705882, 0, 1,
-1.781706, 0.5962086, -0.6315147, 1, 0.2745098, 0, 1,
-1.745698, 1.215102, 0.2269858, 1, 0.282353, 0, 1,
-1.739987, 2.429778, -0.1790497, 1, 0.2862745, 0, 1,
-1.720827, 1.102077, 0.565312, 1, 0.2941177, 0, 1,
-1.714081, -1.77102, -2.067409, 1, 0.3019608, 0, 1,
-1.713664, -1.276484, -4.13049, 1, 0.3058824, 0, 1,
-1.695489, 0.4466129, -2.258543, 1, 0.3137255, 0, 1,
-1.663761, -0.3391429, -0.9962258, 1, 0.3176471, 0, 1,
-1.658566, -0.2922469, -1.626174, 1, 0.3254902, 0, 1,
-1.656915, 1.090932, -0.274829, 1, 0.3294118, 0, 1,
-1.656054, 0.9656042, -0.6884853, 1, 0.3372549, 0, 1,
-1.646367, -0.4751688, -1.914694, 1, 0.3411765, 0, 1,
-1.644704, -0.6653794, -1.258064, 1, 0.3490196, 0, 1,
-1.640095, -2.0579, -2.774479, 1, 0.3529412, 0, 1,
-1.633933, -0.5774337, -1.738488, 1, 0.3607843, 0, 1,
-1.630252, 1.182973, -0.5254159, 1, 0.3647059, 0, 1,
-1.626528, -1.064081, -0.002459972, 1, 0.372549, 0, 1,
-1.616167, -0.6218159, -2.605707, 1, 0.3764706, 0, 1,
-1.614416, 0.6000233, -1.259058, 1, 0.3843137, 0, 1,
-1.608351, -0.6974424, -3.61924, 1, 0.3882353, 0, 1,
-1.535644, 0.401834, -0.5880586, 1, 0.3960784, 0, 1,
-1.52957, 0.909663, 0.7334032, 1, 0.4039216, 0, 1,
-1.525811, -1.712197, -3.094817, 1, 0.4078431, 0, 1,
-1.512498, 0.6044188, -2.390007, 1, 0.4156863, 0, 1,
-1.512151, -0.8105133, -2.04626, 1, 0.4196078, 0, 1,
-1.511296, -1.480052, -2.605865, 1, 0.427451, 0, 1,
-1.500901, 0.4565198, -2.227046, 1, 0.4313726, 0, 1,
-1.495491, 0.1651938, -0.9297267, 1, 0.4392157, 0, 1,
-1.491118, 0.4338219, -0.9369255, 1, 0.4431373, 0, 1,
-1.488277, 0.9850212, -3.170255, 1, 0.4509804, 0, 1,
-1.469868, 1.117094, -0.5874792, 1, 0.454902, 0, 1,
-1.462025, -1.54639, -1.208943, 1, 0.4627451, 0, 1,
-1.458959, 1.177269, 0.9251303, 1, 0.4666667, 0, 1,
-1.453726, -0.7738022, -2.621331, 1, 0.4745098, 0, 1,
-1.452834, 0.4762613, -1.094795, 1, 0.4784314, 0, 1,
-1.451878, -0.3255396, -0.9734734, 1, 0.4862745, 0, 1,
-1.449918, 0.6744864, -1.204682, 1, 0.4901961, 0, 1,
-1.446408, 0.2614139, -0.6443249, 1, 0.4980392, 0, 1,
-1.427605, 0.5722779, -0.3980778, 1, 0.5058824, 0, 1,
-1.425056, 0.3451372, 0.565967, 1, 0.509804, 0, 1,
-1.416301, 0.4337465, -3.167539, 1, 0.5176471, 0, 1,
-1.414462, -1.024526, -1.174398, 1, 0.5215687, 0, 1,
-1.398682, 0.6314644, -0.8718853, 1, 0.5294118, 0, 1,
-1.390443, 0.1571395, -1.707892, 1, 0.5333334, 0, 1,
-1.383539, -1.229625, -0.5413325, 1, 0.5411765, 0, 1,
-1.379704, -1.208581, -3.950791, 1, 0.5450981, 0, 1,
-1.379329, -1.632698, -3.852962, 1, 0.5529412, 0, 1,
-1.366683, -1.406954, -0.7481962, 1, 0.5568628, 0, 1,
-1.347623, 0.8214517, -0.8520604, 1, 0.5647059, 0, 1,
-1.343989, 0.08640067, -2.072726, 1, 0.5686275, 0, 1,
-1.341854, 0.7987824, -1.456066, 1, 0.5764706, 0, 1,
-1.341126, 0.3634254, -4.305872, 1, 0.5803922, 0, 1,
-1.338077, -0.9974815, -1.718498, 1, 0.5882353, 0, 1,
-1.336872, 1.128172, -2.061453, 1, 0.5921569, 0, 1,
-1.327649, -0.02207284, -1.986715, 1, 0.6, 0, 1,
-1.327315, 0.8780185, 0.7294943, 1, 0.6078432, 0, 1,
-1.324887, -1.036003, -4.04429, 1, 0.6117647, 0, 1,
-1.320335, 1.132473, -1.257145, 1, 0.6196079, 0, 1,
-1.317998, -0.3227392, -3.208886, 1, 0.6235294, 0, 1,
-1.317815, -0.9478803, -1.952392, 1, 0.6313726, 0, 1,
-1.309045, 0.8826919, -2.943409, 1, 0.6352941, 0, 1,
-1.292639, 0.5546116, -0.9718267, 1, 0.6431373, 0, 1,
-1.288943, 1.533383, -3.334532, 1, 0.6470588, 0, 1,
-1.288422, 0.7143729, -0.8847392, 1, 0.654902, 0, 1,
-1.287468, 0.5137457, -1.477993, 1, 0.6588235, 0, 1,
-1.285947, 1.808849, -0.2319331, 1, 0.6666667, 0, 1,
-1.283026, 1.567896, -1.199438, 1, 0.6705883, 0, 1,
-1.260465, 0.4656695, -1.708402, 1, 0.6784314, 0, 1,
-1.257247, 0.01934303, -1.245933, 1, 0.682353, 0, 1,
-1.256184, -1.024338, -1.334403, 1, 0.6901961, 0, 1,
-1.2491, -0.2294779, -2.025427, 1, 0.6941177, 0, 1,
-1.246032, -0.6208094, -1.838604, 1, 0.7019608, 0, 1,
-1.238739, 0.802282, -1.571944, 1, 0.7098039, 0, 1,
-1.238182, 0.06569991, -2.666401, 1, 0.7137255, 0, 1,
-1.234396, 0.6327238, -2.133085, 1, 0.7215686, 0, 1,
-1.223419, 1.640656, -0.1300356, 1, 0.7254902, 0, 1,
-1.20823, -0.6089317, -1.926248, 1, 0.7333333, 0, 1,
-1.205194, 0.889894, -2.498904, 1, 0.7372549, 0, 1,
-1.199074, -1.424221, -3.644732, 1, 0.7450981, 0, 1,
-1.196146, -0.2221245, -1.774734, 1, 0.7490196, 0, 1,
-1.194105, 0.5686514, -0.503877, 1, 0.7568628, 0, 1,
-1.19129, -0.01138831, -1.695928, 1, 0.7607843, 0, 1,
-1.179891, -0.05304299, -1.424931, 1, 0.7686275, 0, 1,
-1.161858, -1.123646, -1.65709, 1, 0.772549, 0, 1,
-1.153716, 1.111824, -0.6734, 1, 0.7803922, 0, 1,
-1.151123, 1.300198, 0.6763651, 1, 0.7843137, 0, 1,
-1.142009, -1.006093, -1.385549, 1, 0.7921569, 0, 1,
-1.134004, -0.3464733, -1.270669, 1, 0.7960784, 0, 1,
-1.132023, -1.351099, -3.536919, 1, 0.8039216, 0, 1,
-1.130581, -1.506853, -2.149201, 1, 0.8117647, 0, 1,
-1.117186, -0.3036928, -0.7128333, 1, 0.8156863, 0, 1,
-1.115958, -1.182863, -1.458039, 1, 0.8235294, 0, 1,
-1.111022, 1.342903, -2.270583, 1, 0.827451, 0, 1,
-1.108821, -0.5833501, -5.353224, 1, 0.8352941, 0, 1,
-1.106662, 1.10121, -0.4242898, 1, 0.8392157, 0, 1,
-1.10184, -1.294992, -1.45286, 1, 0.8470588, 0, 1,
-1.100922, -0.3045965, -1.409961, 1, 0.8509804, 0, 1,
-1.099025, -0.7366819, -2.582342, 1, 0.8588235, 0, 1,
-1.092751, 0.01974877, -1.780416, 1, 0.8627451, 0, 1,
-1.085821, -0.2668702, -0.9056043, 1, 0.8705882, 0, 1,
-1.083385, -0.2032235, -3.90728, 1, 0.8745098, 0, 1,
-1.066382, -0.01532718, -1.967502, 1, 0.8823529, 0, 1,
-1.064368, 0.1646722, -2.302036, 1, 0.8862745, 0, 1,
-1.063785, 0.3901872, -2.586519, 1, 0.8941177, 0, 1,
-1.062217, -0.1535574, 0.3699524, 1, 0.8980392, 0, 1,
-1.059281, -0.9192008, -1.243705, 1, 0.9058824, 0, 1,
-1.042861, 0.6251217, -1.45307, 1, 0.9137255, 0, 1,
-1.042339, -1.500993, -1.650376, 1, 0.9176471, 0, 1,
-1.040518, -1.143087, -2.749873, 1, 0.9254902, 0, 1,
-1.037985, 0.4607255, -2.359548, 1, 0.9294118, 0, 1,
-1.033125, -1.502387, -1.093916, 1, 0.9372549, 0, 1,
-1.026972, -0.7196634, -1.110473, 1, 0.9411765, 0, 1,
-1.024377, -1.224549, -2.076835, 1, 0.9490196, 0, 1,
-1.014244, 0.1048407, -2.931896, 1, 0.9529412, 0, 1,
-0.9997005, -0.3552314, -1.146027, 1, 0.9607843, 0, 1,
-0.9996476, -0.3407618, -2.233545, 1, 0.9647059, 0, 1,
-0.9941539, 1.257335, -0.6915801, 1, 0.972549, 0, 1,
-0.9917306, -0.8528919, -1.64307, 1, 0.9764706, 0, 1,
-0.984898, -0.4396511, -0.5806991, 1, 0.9843137, 0, 1,
-0.9832406, -1.032613, -4.239887, 1, 0.9882353, 0, 1,
-0.9782615, 0.733435, -0.3718209, 1, 0.9960784, 0, 1,
-0.9746789, 1.380409, -0.936002, 0.9960784, 1, 0, 1,
-0.9690177, 0.01471893, -3.253622, 0.9921569, 1, 0, 1,
-0.9629715, -1.370372, -4.950049, 0.9843137, 1, 0, 1,
-0.9595652, 0.1792451, -1.894451, 0.9803922, 1, 0, 1,
-0.9588681, -0.176391, -1.4893, 0.972549, 1, 0, 1,
-0.9578651, 0.6372978, -1.145531, 0.9686275, 1, 0, 1,
-0.9573826, 0.5648627, -1.643763, 0.9607843, 1, 0, 1,
-0.9573727, -0.2399987, -2.439353, 0.9568627, 1, 0, 1,
-0.9566893, 0.8761334, -0.8141385, 0.9490196, 1, 0, 1,
-0.9505358, 1.312275, -0.4262356, 0.945098, 1, 0, 1,
-0.9431668, -1.485429, -2.873576, 0.9372549, 1, 0, 1,
-0.9397901, 0.3224803, -2.356706, 0.9333333, 1, 0, 1,
-0.939474, 1.034613, -1.918453, 0.9254902, 1, 0, 1,
-0.9376932, -0.333391, -1.822762, 0.9215686, 1, 0, 1,
-0.9360614, -0.5384538, -1.818598, 0.9137255, 1, 0, 1,
-0.933894, -1.424494, -3.31164, 0.9098039, 1, 0, 1,
-0.9311051, -0.9195873, -3.840375, 0.9019608, 1, 0, 1,
-0.9287367, -0.6582041, -2.295232, 0.8941177, 1, 0, 1,
-0.9202225, -0.274554, -2.913857, 0.8901961, 1, 0, 1,
-0.9161797, -1.284009, -3.887973, 0.8823529, 1, 0, 1,
-0.9148843, 1.013163, -2.466457, 0.8784314, 1, 0, 1,
-0.9147769, -0.06864216, -0.6482772, 0.8705882, 1, 0, 1,
-0.9017058, -0.8663371, -1.974157, 0.8666667, 1, 0, 1,
-0.9009315, 0.8961209, -0.6423857, 0.8588235, 1, 0, 1,
-0.8973103, -0.4046482, -3.067729, 0.854902, 1, 0, 1,
-0.8968796, 0.06219175, -1.111226, 0.8470588, 1, 0, 1,
-0.8961325, 0.5451446, -2.400259, 0.8431373, 1, 0, 1,
-0.8946967, 2.759712, -0.7615638, 0.8352941, 1, 0, 1,
-0.8928916, -1.396721, -2.403139, 0.8313726, 1, 0, 1,
-0.8894293, 1.145164, 0.8752403, 0.8235294, 1, 0, 1,
-0.8891494, 0.2792861, -1.679542, 0.8196079, 1, 0, 1,
-0.8862157, 1.165007, -1.12429, 0.8117647, 1, 0, 1,
-0.8861561, -0.2776801, -1.979339, 0.8078431, 1, 0, 1,
-0.8860437, 0.4344526, -1.095853, 0.8, 1, 0, 1,
-0.8846834, -1.610519, -0.5836866, 0.7921569, 1, 0, 1,
-0.8841501, -0.7258889, -3.5509, 0.7882353, 1, 0, 1,
-0.8754229, -0.06487314, -0.9774073, 0.7803922, 1, 0, 1,
-0.8684179, 1.214775, -0.01893448, 0.7764706, 1, 0, 1,
-0.867326, -0.7901029, -1.321682, 0.7686275, 1, 0, 1,
-0.8642516, -1.428011, -2.065114, 0.7647059, 1, 0, 1,
-0.8572495, -0.09869026, -1.528736, 0.7568628, 1, 0, 1,
-0.8556334, -0.524519, -1.033334, 0.7529412, 1, 0, 1,
-0.851528, -1.583222, -2.022876, 0.7450981, 1, 0, 1,
-0.8514076, -0.1000804, -0.5690458, 0.7411765, 1, 0, 1,
-0.8510824, 0.7956221, -1.293244, 0.7333333, 1, 0, 1,
-0.8453649, 1.776903, -1.030491, 0.7294118, 1, 0, 1,
-0.8414049, 1.348654, -1.843765, 0.7215686, 1, 0, 1,
-0.8379208, -0.5824042, -0.962093, 0.7176471, 1, 0, 1,
-0.8344908, 1.845385, -0.2828736, 0.7098039, 1, 0, 1,
-0.8225847, 0.1742072, -0.6696928, 0.7058824, 1, 0, 1,
-0.8174044, 0.01234855, -0.9445792, 0.6980392, 1, 0, 1,
-0.8158024, 1.168515, -1.771888, 0.6901961, 1, 0, 1,
-0.8135972, 1.273225, -0.9074726, 0.6862745, 1, 0, 1,
-0.806102, 0.6877168, 1.725845, 0.6784314, 1, 0, 1,
-0.8050932, -0.05996477, -2.596453, 0.6745098, 1, 0, 1,
-0.802179, 1.507402, -0.4693509, 0.6666667, 1, 0, 1,
-0.7988573, 0.7930459, 0.1795667, 0.6627451, 1, 0, 1,
-0.7985052, 0.4977923, -1.4364, 0.654902, 1, 0, 1,
-0.7971789, -0.2066039, -1.42171, 0.6509804, 1, 0, 1,
-0.7934715, -0.654991, -2.76361, 0.6431373, 1, 0, 1,
-0.7933038, -1.122704, -3.906226, 0.6392157, 1, 0, 1,
-0.7862711, 0.5801862, -0.8107156, 0.6313726, 1, 0, 1,
-0.7837867, -1.293708, -3.590083, 0.627451, 1, 0, 1,
-0.7800159, 0.1699391, -0.04297868, 0.6196079, 1, 0, 1,
-0.7711056, -0.260943, -0.7989236, 0.6156863, 1, 0, 1,
-0.7697525, 0.8066743, -1.360081, 0.6078432, 1, 0, 1,
-0.7694282, 0.1789081, -3.003835, 0.6039216, 1, 0, 1,
-0.7685022, 0.817571, 0.7747349, 0.5960785, 1, 0, 1,
-0.7673544, 0.04022221, -0.9284974, 0.5882353, 1, 0, 1,
-0.7659928, 0.2994964, -0.1049605, 0.5843138, 1, 0, 1,
-0.7652422, -1.326393, -2.029702, 0.5764706, 1, 0, 1,
-0.7593336, 1.27965, -0.495446, 0.572549, 1, 0, 1,
-0.7577454, 0.6029636, -0.02883242, 0.5647059, 1, 0, 1,
-0.7544068, -1.067741, -2.751606, 0.5607843, 1, 0, 1,
-0.7493711, 0.1840299, -1.953227, 0.5529412, 1, 0, 1,
-0.7473242, 1.232712, 1.099361, 0.5490196, 1, 0, 1,
-0.7430575, 0.8040965, -1.3987, 0.5411765, 1, 0, 1,
-0.7385883, -0.2298605, -2.031197, 0.5372549, 1, 0, 1,
-0.7373835, 1.324223, -0.02458838, 0.5294118, 1, 0, 1,
-0.727706, 0.9935624, -1.525845, 0.5254902, 1, 0, 1,
-0.7271026, 1.710605, 0.5085313, 0.5176471, 1, 0, 1,
-0.7234385, -0.4232262, -2.75232, 0.5137255, 1, 0, 1,
-0.722546, 0.5457231, -1.298832, 0.5058824, 1, 0, 1,
-0.7171431, 0.4700943, -0.3558003, 0.5019608, 1, 0, 1,
-0.7091237, 3.021566, -1.131176, 0.4941176, 1, 0, 1,
-0.6977529, 0.0149517, 0.6534948, 0.4862745, 1, 0, 1,
-0.6927629, -1.050086, -3.164377, 0.4823529, 1, 0, 1,
-0.6804848, -0.1308107, -1.163405, 0.4745098, 1, 0, 1,
-0.6790572, -1.653801, -2.510846, 0.4705882, 1, 0, 1,
-0.6774217, -0.3801882, -1.33981, 0.4627451, 1, 0, 1,
-0.6752183, -0.6803319, -1.918267, 0.4588235, 1, 0, 1,
-0.6722857, -0.2247183, -3.106485, 0.4509804, 1, 0, 1,
-0.6616211, -0.6598595, -2.853918, 0.4470588, 1, 0, 1,
-0.6611797, -1.53205, -1.839703, 0.4392157, 1, 0, 1,
-0.6539219, -1.464587, -3.468898, 0.4352941, 1, 0, 1,
-0.6515812, 0.1114501, -1.789025, 0.427451, 1, 0, 1,
-0.6511187, -0.8933899, -2.038862, 0.4235294, 1, 0, 1,
-0.6506094, -0.3538539, -2.25344, 0.4156863, 1, 0, 1,
-0.6488666, 0.8741174, 0.176092, 0.4117647, 1, 0, 1,
-0.6469083, -0.4089174, -2.194202, 0.4039216, 1, 0, 1,
-0.6441253, 0.9463791, 0.3156756, 0.3960784, 1, 0, 1,
-0.6357648, 0.4164724, -1.857991, 0.3921569, 1, 0, 1,
-0.6354523, 0.7003951, -0.3365732, 0.3843137, 1, 0, 1,
-0.6311541, 0.9206678, -0.8271358, 0.3803922, 1, 0, 1,
-0.6295343, -1.88776, -2.759339, 0.372549, 1, 0, 1,
-0.6288528, 0.1468728, -2.82664, 0.3686275, 1, 0, 1,
-0.6235676, 0.887585, 0.5117935, 0.3607843, 1, 0, 1,
-0.6205068, 0.4572696, -1.717204, 0.3568628, 1, 0, 1,
-0.62018, -1.150056, -1.154587, 0.3490196, 1, 0, 1,
-0.6195222, -0.1538125, -0.3442351, 0.345098, 1, 0, 1,
-0.6175957, 0.8022434, 0.7833925, 0.3372549, 1, 0, 1,
-0.6153147, -0.6409447, -1.301797, 0.3333333, 1, 0, 1,
-0.6124066, 1.252498, 0.2023543, 0.3254902, 1, 0, 1,
-0.6106302, -0.7914521, -4.352465, 0.3215686, 1, 0, 1,
-0.6092011, -0.889432, -2.289738, 0.3137255, 1, 0, 1,
-0.6062368, -0.6218233, -3.922658, 0.3098039, 1, 0, 1,
-0.603686, -1.04797, -1.702182, 0.3019608, 1, 0, 1,
-0.6014625, 0.4608706, 0.2786418, 0.2941177, 1, 0, 1,
-0.5974059, -0.6027609, -3.552601, 0.2901961, 1, 0, 1,
-0.5906829, 0.04738819, -1.576372, 0.282353, 1, 0, 1,
-0.5806384, -0.8203785, -2.619939, 0.2784314, 1, 0, 1,
-0.5794742, 0.8718786, -0.9698737, 0.2705882, 1, 0, 1,
-0.5785578, 0.02388986, -1.299476, 0.2666667, 1, 0, 1,
-0.5767094, -1.11083, -3.344084, 0.2588235, 1, 0, 1,
-0.5766475, -1.699977, -3.172872, 0.254902, 1, 0, 1,
-0.5742907, -2.394777, -1.781117, 0.2470588, 1, 0, 1,
-0.5621446, 1.34406, -1.307858, 0.2431373, 1, 0, 1,
-0.5575585, -0.9872019, -3.777643, 0.2352941, 1, 0, 1,
-0.5575197, -0.1951031, -0.4827776, 0.2313726, 1, 0, 1,
-0.5566996, -0.9049662, -1.770842, 0.2235294, 1, 0, 1,
-0.5564747, -0.7795448, -1.802857, 0.2196078, 1, 0, 1,
-0.5538998, 2.480611, 0.4362612, 0.2117647, 1, 0, 1,
-0.5457927, -0.3346539, -2.432725, 0.2078431, 1, 0, 1,
-0.5393996, -0.3881043, -1.721233, 0.2, 1, 0, 1,
-0.5386147, 1.298076, 1.058852, 0.1921569, 1, 0, 1,
-0.5380382, 0.2229941, -2.333495, 0.1882353, 1, 0, 1,
-0.5378866, 1.702594, 0.007173738, 0.1803922, 1, 0, 1,
-0.5368876, -0.7594743, -0.8539053, 0.1764706, 1, 0, 1,
-0.5325627, 0.120901, -2.077288, 0.1686275, 1, 0, 1,
-0.5320868, 2.371516, 0.9078227, 0.1647059, 1, 0, 1,
-0.5277938, -0.06741743, -1.0434, 0.1568628, 1, 0, 1,
-0.5214623, -0.3517722, -2.421758, 0.1529412, 1, 0, 1,
-0.5204, 1.233313, -0.4434277, 0.145098, 1, 0, 1,
-0.5193733, 1.110123, 0.7879373, 0.1411765, 1, 0, 1,
-0.5186331, -0.6939117, -1.924906, 0.1333333, 1, 0, 1,
-0.51526, 1.382914, 0.2268237, 0.1294118, 1, 0, 1,
-0.5125571, -1.642107, -2.973704, 0.1215686, 1, 0, 1,
-0.5079616, -0.3654619, -0.8093098, 0.1176471, 1, 0, 1,
-0.4980575, 0.467762, -0.3978016, 0.1098039, 1, 0, 1,
-0.4902857, 0.9805281, 0.2100877, 0.1058824, 1, 0, 1,
-0.486803, -0.04327134, -0.5562349, 0.09803922, 1, 0, 1,
-0.4860932, -0.9053789, -1.952665, 0.09019608, 1, 0, 1,
-0.4813377, 1.128385, -0.4631186, 0.08627451, 1, 0, 1,
-0.4796286, -0.3526219, -3.554548, 0.07843138, 1, 0, 1,
-0.475649, -0.8742609, -1.394199, 0.07450981, 1, 0, 1,
-0.4715475, -1.00876, -3.149809, 0.06666667, 1, 0, 1,
-0.4693682, -0.7581595, -2.077832, 0.0627451, 1, 0, 1,
-0.4637589, -0.1959961, -3.751459, 0.05490196, 1, 0, 1,
-0.4630249, -0.9727375, -2.632963, 0.05098039, 1, 0, 1,
-0.4582211, -0.5713862, -3.67214, 0.04313726, 1, 0, 1,
-0.4500426, 0.9410893, -0.6040612, 0.03921569, 1, 0, 1,
-0.4467362, -1.167218, -2.942419, 0.03137255, 1, 0, 1,
-0.4465553, -0.2281338, -1.62431, 0.02745098, 1, 0, 1,
-0.44456, 1.754829, -0.4331404, 0.01960784, 1, 0, 1,
-0.4423495, -1.011969, -3.035567, 0.01568628, 1, 0, 1,
-0.4393286, -1.630349, -3.952918, 0.007843138, 1, 0, 1,
-0.4350563, -0.8142266, -5.421548, 0.003921569, 1, 0, 1,
-0.434865, 1.499776, -0.5160334, 0, 1, 0.003921569, 1,
-0.4341638, 0.8977295, -2.079221, 0, 1, 0.01176471, 1,
-0.4317856, -1.03371, -4.615349, 0, 1, 0.01568628, 1,
-0.4316037, 2.717835, -0.968289, 0, 1, 0.02352941, 1,
-0.4315035, 0.2394114, -0.3515697, 0, 1, 0.02745098, 1,
-0.4259039, -0.4175863, -2.729672, 0, 1, 0.03529412, 1,
-0.4242424, -0.9628143, -1.589408, 0, 1, 0.03921569, 1,
-0.4238134, -0.7930624, -3.491619, 0, 1, 0.04705882, 1,
-0.4197048, -0.8394278, -3.718007, 0, 1, 0.05098039, 1,
-0.4174121, 0.6285257, 0.2766495, 0, 1, 0.05882353, 1,
-0.4173019, -1.178599, -3.055568, 0, 1, 0.0627451, 1,
-0.4161864, 0.5244185, -0.5195901, 0, 1, 0.07058824, 1,
-0.4157586, -0.9780096, -2.465789, 0, 1, 0.07450981, 1,
-0.4148495, -0.6839962, -1.85945, 0, 1, 0.08235294, 1,
-0.4140679, 1.495557, -1.085904, 0, 1, 0.08627451, 1,
-0.4138898, 1.32148, -1.322266, 0, 1, 0.09411765, 1,
-0.408783, -1.462764, -2.034766, 0, 1, 0.1019608, 1,
-0.4070071, 1.07507, -1.076668, 0, 1, 0.1058824, 1,
-0.4002931, -0.8933231, -4.507317, 0, 1, 0.1137255, 1,
-0.3973424, 1.488067, 0.5590621, 0, 1, 0.1176471, 1,
-0.3955311, -2.277589, -3.478782, 0, 1, 0.1254902, 1,
-0.3954242, 0.274933, -0.2306098, 0, 1, 0.1294118, 1,
-0.3901471, 0.4811497, -0.4545067, 0, 1, 0.1372549, 1,
-0.3897258, -0.986006, -3.392814, 0, 1, 0.1411765, 1,
-0.3812285, 0.1300421, -0.5102507, 0, 1, 0.1490196, 1,
-0.3795943, -0.3324004, -5.461386, 0, 1, 0.1529412, 1,
-0.3787623, -2.016862, -0.7777359, 0, 1, 0.1607843, 1,
-0.3737627, -1.268608, -2.417629, 0, 1, 0.1647059, 1,
-0.3714643, -0.173112, -1.367015, 0, 1, 0.172549, 1,
-0.3706624, -1.006397, -2.85975, 0, 1, 0.1764706, 1,
-0.3659796, -0.3619689, -3.395386, 0, 1, 0.1843137, 1,
-0.365412, 0.4259156, -1.213129, 0, 1, 0.1882353, 1,
-0.3594442, 0.09542019, -0.5851138, 0, 1, 0.1960784, 1,
-0.3560715, 0.4556668, -1.577885, 0, 1, 0.2039216, 1,
-0.3558222, 0.4123293, -0.1613004, 0, 1, 0.2078431, 1,
-0.3538758, 0.4776865, -0.1647464, 0, 1, 0.2156863, 1,
-0.3499194, 0.2487462, -1.694102, 0, 1, 0.2196078, 1,
-0.3484955, 0.732453, -2.258385, 0, 1, 0.227451, 1,
-0.344821, 1.551114, 0.8456103, 0, 1, 0.2313726, 1,
-0.343903, -0.3279417, -2.069191, 0, 1, 0.2392157, 1,
-0.3430121, -1.047698, -3.398887, 0, 1, 0.2431373, 1,
-0.3391481, 1.401812, -0.2056653, 0, 1, 0.2509804, 1,
-0.3291587, 0.9455189, -0.8605999, 0, 1, 0.254902, 1,
-0.3264645, 0.04320916, -0.3186384, 0, 1, 0.2627451, 1,
-0.3251996, 2.369043, 0.1608038, 0, 1, 0.2666667, 1,
-0.3213384, 1.549847, -2.005615, 0, 1, 0.2745098, 1,
-0.3194053, 0.449105, 0.6096202, 0, 1, 0.2784314, 1,
-0.317871, -1.356122, -4.480065, 0, 1, 0.2862745, 1,
-0.3171086, -1.323601, -3.34832, 0, 1, 0.2901961, 1,
-0.3149251, 1.987549, 0.1494693, 0, 1, 0.2980392, 1,
-0.3110641, 0.6080435, 1.059133, 0, 1, 0.3058824, 1,
-0.3036934, 1.338385, -0.05974822, 0, 1, 0.3098039, 1,
-0.2995986, 1.149291, -0.3567432, 0, 1, 0.3176471, 1,
-0.2983996, -0.1576551, -2.264351, 0, 1, 0.3215686, 1,
-0.2977814, -0.09902303, -2.63954, 0, 1, 0.3294118, 1,
-0.2967975, 0.812315, -1.352138, 0, 1, 0.3333333, 1,
-0.2940507, 0.347858, -0.7723165, 0, 1, 0.3411765, 1,
-0.2849454, -0.580534, -1.690574, 0, 1, 0.345098, 1,
-0.2808783, -0.2345129, -4.165221, 0, 1, 0.3529412, 1,
-0.2806391, -0.7201469, -2.915299, 0, 1, 0.3568628, 1,
-0.2765367, 0.2020185, -1.867269, 0, 1, 0.3647059, 1,
-0.2752337, 0.2720857, -0.04347714, 0, 1, 0.3686275, 1,
-0.2743773, -1.099874, -1.082605, 0, 1, 0.3764706, 1,
-0.271016, -0.05623914, -1.005515, 0, 1, 0.3803922, 1,
-0.2676435, 0.9033452, 2.291445, 0, 1, 0.3882353, 1,
-0.2673213, -1.218947, -1.983203, 0, 1, 0.3921569, 1,
-0.2666062, 2.298683, 2.393981, 0, 1, 0.4, 1,
-0.2663548, -0.4195316, -3.663122, 0, 1, 0.4078431, 1,
-0.2607828, 1.07188, -1.695991, 0, 1, 0.4117647, 1,
-0.259421, 0.4681539, -1.823332, 0, 1, 0.4196078, 1,
-0.2538204, -0.7988762, -2.130563, 0, 1, 0.4235294, 1,
-0.2460741, 1.231379, 0.9380916, 0, 1, 0.4313726, 1,
-0.2451594, -0.7194827, -1.62638, 0, 1, 0.4352941, 1,
-0.2433954, 1.078409, -1.00947, 0, 1, 0.4431373, 1,
-0.2431238, 1.143416, 0.1107903, 0, 1, 0.4470588, 1,
-0.2418051, -0.6244813, -3.212777, 0, 1, 0.454902, 1,
-0.2407693, -0.8695981, -1.911977, 0, 1, 0.4588235, 1,
-0.2393815, -1.030863, -1.872986, 0, 1, 0.4666667, 1,
-0.234633, -0.02806499, -1.390321, 0, 1, 0.4705882, 1,
-0.2344632, -0.9788685, -2.376517, 0, 1, 0.4784314, 1,
-0.2327719, -0.8284084, -3.773736, 0, 1, 0.4823529, 1,
-0.2303941, -0.7066166, -2.213749, 0, 1, 0.4901961, 1,
-0.2294631, -2.087712, -2.270321, 0, 1, 0.4941176, 1,
-0.2271093, -0.4893609, -1.695454, 0, 1, 0.5019608, 1,
-0.2254229, 0.3238937, -0.4168421, 0, 1, 0.509804, 1,
-0.2247957, 1.140689, -2.129427, 0, 1, 0.5137255, 1,
-0.2245058, -1.570847, -2.663591, 0, 1, 0.5215687, 1,
-0.2233358, 0.7322385, -1.542303, 0, 1, 0.5254902, 1,
-0.2228565, -0.4887401, -1.875243, 0, 1, 0.5333334, 1,
-0.2216309, -1.155831, -3.044491, 0, 1, 0.5372549, 1,
-0.2187556, 2.467659, 1.253332, 0, 1, 0.5450981, 1,
-0.2161008, 0.8931437, 0.7231463, 0, 1, 0.5490196, 1,
-0.2096172, 0.2441051, 0.3426252, 0, 1, 0.5568628, 1,
-0.2030208, 0.4584742, -0.6296834, 0, 1, 0.5607843, 1,
-0.2007141, 0.3634068, -2.154505, 0, 1, 0.5686275, 1,
-0.1974284, -0.7787272, -2.569354, 0, 1, 0.572549, 1,
-0.195524, -0.7215573, -1.990218, 0, 1, 0.5803922, 1,
-0.1948744, 0.6393503, -1.057927, 0, 1, 0.5843138, 1,
-0.1916886, -0.03259339, -1.741327, 0, 1, 0.5921569, 1,
-0.1889427, 1.875067, -1.70933, 0, 1, 0.5960785, 1,
-0.1869635, -0.6417408, -2.961846, 0, 1, 0.6039216, 1,
-0.1801047, -0.3453214, -2.56832, 0, 1, 0.6117647, 1,
-0.1744766, 0.3409334, -0.2769043, 0, 1, 0.6156863, 1,
-0.172796, -0.05288665, -1.696015, 0, 1, 0.6235294, 1,
-0.1721703, 0.6951609, 1.146691, 0, 1, 0.627451, 1,
-0.171224, 0.6708624, 0.05713012, 0, 1, 0.6352941, 1,
-0.1680656, 2.852403, 0.1299213, 0, 1, 0.6392157, 1,
-0.1680069, 1.333412, -0.3140347, 0, 1, 0.6470588, 1,
-0.166208, -0.2943321, -3.863093, 0, 1, 0.6509804, 1,
-0.1655129, 0.9534774, -1.371918, 0, 1, 0.6588235, 1,
-0.1611635, 1.21574, -0.9318546, 0, 1, 0.6627451, 1,
-0.1545971, -0.8063441, -4.065053, 0, 1, 0.6705883, 1,
-0.1538591, -1.260741, -3.432873, 0, 1, 0.6745098, 1,
-0.1501207, -0.2956149, -3.642318, 0, 1, 0.682353, 1,
-0.1494536, -0.7951717, -3.630855, 0, 1, 0.6862745, 1,
-0.1459287, -0.4492833, -3.81008, 0, 1, 0.6941177, 1,
-0.1452107, 0.7490644, 0.3561352, 0, 1, 0.7019608, 1,
-0.1326401, -1.17112, -3.127119, 0, 1, 0.7058824, 1,
-0.1287483, -0.4145258, -1.426617, 0, 1, 0.7137255, 1,
-0.12799, -0.03333327, -1.853229, 0, 1, 0.7176471, 1,
-0.1279185, 1.350146, 0.8580439, 0, 1, 0.7254902, 1,
-0.124668, 0.2301931, -0.224777, 0, 1, 0.7294118, 1,
-0.1241197, 1.400088, 0.8699862, 0, 1, 0.7372549, 1,
-0.1151336, -1.102375, -4.353992, 0, 1, 0.7411765, 1,
-0.1119761, 0.124653, -2.025445, 0, 1, 0.7490196, 1,
-0.1099137, -1.438445, -2.722982, 0, 1, 0.7529412, 1,
-0.109731, 1.198201, -0.07821549, 0, 1, 0.7607843, 1,
-0.1063107, 0.7669584, -0.4599598, 0, 1, 0.7647059, 1,
-0.1049628, -0.7837451, -4.152352, 0, 1, 0.772549, 1,
-0.1015556, 1.058759, 0.5974143, 0, 1, 0.7764706, 1,
-0.1009527, -1.370022, -2.64224, 0, 1, 0.7843137, 1,
-0.09694369, -1.212134, -3.811252, 0, 1, 0.7882353, 1,
-0.09641045, -1.344947, -3.289956, 0, 1, 0.7960784, 1,
-0.09574009, -0.9292498, -1.794382, 0, 1, 0.8039216, 1,
-0.09388212, -1.614887, -2.156771, 0, 1, 0.8078431, 1,
-0.09197731, 0.2031913, -1.000592, 0, 1, 0.8156863, 1,
-0.0886491, 0.5225398, 0.1029802, 0, 1, 0.8196079, 1,
-0.08533352, 0.940667, -1.772865, 0, 1, 0.827451, 1,
-0.08408471, -0.9549482, -2.570641, 0, 1, 0.8313726, 1,
-0.08283398, 0.6143034, 3.237643, 0, 1, 0.8392157, 1,
-0.08222235, 0.678147, -0.1953689, 0, 1, 0.8431373, 1,
-0.08181772, 0.5277665, -0.07264037, 0, 1, 0.8509804, 1,
-0.08117944, 0.1842183, -1.02398, 0, 1, 0.854902, 1,
-0.07963912, 0.2724738, 0.561749, 0, 1, 0.8627451, 1,
-0.07821839, 0.1743654, -2.119009, 0, 1, 0.8666667, 1,
-0.07723349, 0.07047739, -1.989442, 0, 1, 0.8745098, 1,
-0.07390922, -0.6798459, -3.912876, 0, 1, 0.8784314, 1,
-0.0697877, 1.861871, 0.1624549, 0, 1, 0.8862745, 1,
-0.06918021, 1.692839, -0.2180134, 0, 1, 0.8901961, 1,
-0.06501213, 0.9370757, 0.09436154, 0, 1, 0.8980392, 1,
-0.06375568, 0.9600736, -1.877732, 0, 1, 0.9058824, 1,
-0.06332523, 0.7967206, 3.019254, 0, 1, 0.9098039, 1,
-0.06290601, -0.06226945, -2.462225, 0, 1, 0.9176471, 1,
-0.06228869, -2.011909, -2.855432, 0, 1, 0.9215686, 1,
-0.06158453, 1.037431, 0.4253945, 0, 1, 0.9294118, 1,
-0.06071393, 0.9790213, -1.422636, 0, 1, 0.9333333, 1,
-0.06031038, -0.184508, -2.513303, 0, 1, 0.9411765, 1,
-0.05365108, 2.115504, -0.4586758, 0, 1, 0.945098, 1,
-0.05041099, 0.1454725, 0.02126167, 0, 1, 0.9529412, 1,
-0.04973439, -0.7916107, -3.341721, 0, 1, 0.9568627, 1,
-0.0459154, 0.2224781, 0.387226, 0, 1, 0.9647059, 1,
-0.04501994, -1.819677, -4.452146, 0, 1, 0.9686275, 1,
-0.04342949, -1.301958, -1.929163, 0, 1, 0.9764706, 1,
-0.04208384, 0.03756395, 0.1366422, 0, 1, 0.9803922, 1,
-0.03802076, 0.2377077, -0.02216142, 0, 1, 0.9882353, 1,
-0.03465208, 0.3681943, -0.4389568, 0, 1, 0.9921569, 1,
-0.02892458, -0.4195776, -3.397464, 0, 1, 1, 1,
-0.02694064, -1.15948, -2.9369, 0, 0.9921569, 1, 1,
-0.02625026, -1.772179, -2.215602, 0, 0.9882353, 1, 1,
-0.02439046, -0.6844239, -5.214259, 0, 0.9803922, 1, 1,
-0.02221436, 0.2324154, -0.0007121709, 0, 0.9764706, 1, 1,
-0.0210584, -1.15245, -3.578496, 0, 0.9686275, 1, 1,
-0.02057777, -0.01968373, -2.376619, 0, 0.9647059, 1, 1,
-0.01988188, 2.09795, -0.7564241, 0, 0.9568627, 1, 1,
-0.01900833, -1.506747, -3.560811, 0, 0.9529412, 1, 1,
-0.0148215, -0.06740964, -2.362724, 0, 0.945098, 1, 1,
-0.01172136, -0.7746303, -3.803487, 0, 0.9411765, 1, 1,
-0.01066406, 1.571549, -0.9464732, 0, 0.9333333, 1, 1,
-0.006768194, 0.2499495, -1.075649, 0, 0.9294118, 1, 1,
-0.006490928, 1.873599, -0.504219, 0, 0.9215686, 1, 1,
0.0008285906, -0.5734243, 2.922087, 0, 0.9176471, 1, 1,
0.001179634, -0.5946379, 5.226792, 0, 0.9098039, 1, 1,
0.001311809, -0.4022175, 3.974342, 0, 0.9058824, 1, 1,
0.004475891, -0.6957214, 3.844543, 0, 0.8980392, 1, 1,
0.008507808, 0.3814495, -0.1048453, 0, 0.8901961, 1, 1,
0.008754124, 0.2259289, 0.4244287, 0, 0.8862745, 1, 1,
0.01367364, -1.280128, 3.709255, 0, 0.8784314, 1, 1,
0.01576398, 0.18453, -0.8888383, 0, 0.8745098, 1, 1,
0.01717283, -1.262638, 5.122825, 0, 0.8666667, 1, 1,
0.02019164, -1.513088, 3.018739, 0, 0.8627451, 1, 1,
0.02100844, 0.2252613, 0.4652652, 0, 0.854902, 1, 1,
0.02227626, 0.05207589, 1.986354, 0, 0.8509804, 1, 1,
0.02448609, 0.9496452, 0.6167784, 0, 0.8431373, 1, 1,
0.02528023, -0.9219663, 3.614943, 0, 0.8392157, 1, 1,
0.03091263, -0.2663438, 4.880223, 0, 0.8313726, 1, 1,
0.03116144, -1.501559, 2.704257, 0, 0.827451, 1, 1,
0.03145016, -0.5555617, 3.184438, 0, 0.8196079, 1, 1,
0.03171156, -0.8129694, 4.176845, 0, 0.8156863, 1, 1,
0.03339843, -0.4877566, 2.828293, 0, 0.8078431, 1, 1,
0.03553379, 0.2122033, -0.4846908, 0, 0.8039216, 1, 1,
0.04051509, -0.4668895, 2.972026, 0, 0.7960784, 1, 1,
0.04276745, -1.269002, 4.904245, 0, 0.7882353, 1, 1,
0.04490637, -0.4484322, 1.429028, 0, 0.7843137, 1, 1,
0.0464146, 0.2444585, 0.7168881, 0, 0.7764706, 1, 1,
0.05040983, -1.583511, 2.704214, 0, 0.772549, 1, 1,
0.05157397, -0.0836481, 2.344325, 0, 0.7647059, 1, 1,
0.06280525, -0.3022129, 3.064232, 0, 0.7607843, 1, 1,
0.06474057, -1.770873, 4.122107, 0, 0.7529412, 1, 1,
0.06481563, 0.3327632, 0.4031979, 0, 0.7490196, 1, 1,
0.06514563, -1.261533, 3.971713, 0, 0.7411765, 1, 1,
0.06639591, 2.67121, -0.44764, 0, 0.7372549, 1, 1,
0.0678934, -0.7391356, 3.680117, 0, 0.7294118, 1, 1,
0.07015499, -1.272574, 0.9139817, 0, 0.7254902, 1, 1,
0.07019451, 0.6007228, 0.5770164, 0, 0.7176471, 1, 1,
0.07366855, -0.3504749, 4.911469, 0, 0.7137255, 1, 1,
0.07401314, -0.5168528, 4.661899, 0, 0.7058824, 1, 1,
0.07764842, 2.407715, -1.380614, 0, 0.6980392, 1, 1,
0.07910541, 1.154664, -1.018738, 0, 0.6941177, 1, 1,
0.08528787, 1.149942, -0.02282915, 0, 0.6862745, 1, 1,
0.08710705, 0.8829858, 0.1785696, 0, 0.682353, 1, 1,
0.08917429, 1.501648, 0.3283442, 0, 0.6745098, 1, 1,
0.09012114, 0.1787415, 0.5414706, 0, 0.6705883, 1, 1,
0.09363668, 1.100412, -1.588238, 0, 0.6627451, 1, 1,
0.09635184, 0.7837554, -1.64794, 0, 0.6588235, 1, 1,
0.09643402, 0.4147889, 0.4789337, 0, 0.6509804, 1, 1,
0.09765758, -1.290643, 3.908081, 0, 0.6470588, 1, 1,
0.1008601, 0.2714898, 1.011014, 0, 0.6392157, 1, 1,
0.1022928, -1.327693, 2.065716, 0, 0.6352941, 1, 1,
0.1039275, 1.356228, 0.9964594, 0, 0.627451, 1, 1,
0.1056625, 0.09448715, 0.9569345, 0, 0.6235294, 1, 1,
0.1148861, -0.9455383, 4.538146, 0, 0.6156863, 1, 1,
0.1156391, -1.090889, 4.445123, 0, 0.6117647, 1, 1,
0.1189679, 0.6391515, -0.05057973, 0, 0.6039216, 1, 1,
0.126181, 0.7877542, -0.7299492, 0, 0.5960785, 1, 1,
0.1299879, 0.6167806, 0.4243636, 0, 0.5921569, 1, 1,
0.1302654, 0.1009574, 0.2543955, 0, 0.5843138, 1, 1,
0.1343817, -2.243281, 3.806528, 0, 0.5803922, 1, 1,
0.136063, 0.6057522, 0.2328049, 0, 0.572549, 1, 1,
0.1483873, 0.2243687, 1.895505, 0, 0.5686275, 1, 1,
0.1496067, -0.2719415, 3.328934, 0, 0.5607843, 1, 1,
0.1538815, -1.381916, 3.760652, 0, 0.5568628, 1, 1,
0.1547067, -1.481639, 2.508822, 0, 0.5490196, 1, 1,
0.158023, -1.089331, 3.98547, 0, 0.5450981, 1, 1,
0.1678406, -0.03028448, 2.197207, 0, 0.5372549, 1, 1,
0.1731618, -2.065846, 2.049854, 0, 0.5333334, 1, 1,
0.1759703, 0.549569, 0.2386255, 0, 0.5254902, 1, 1,
0.1766716, -1.011582, 2.507376, 0, 0.5215687, 1, 1,
0.1768564, -0.5721222, 2.736632, 0, 0.5137255, 1, 1,
0.1833896, -1.169266, 2.098091, 0, 0.509804, 1, 1,
0.1885947, 0.3901632, 0.1994746, 0, 0.5019608, 1, 1,
0.1926389, -0.5261387, 0.8771663, 0, 0.4941176, 1, 1,
0.1941555, 1.80378, -0.6059197, 0, 0.4901961, 1, 1,
0.1947944, -0.07666126, 2.205707, 0, 0.4823529, 1, 1,
0.1951202, -0.9594572, 3.181515, 0, 0.4784314, 1, 1,
0.1984421, 0.04433607, 0.9566309, 0, 0.4705882, 1, 1,
0.2014225, -1.525538, 1.854636, 0, 0.4666667, 1, 1,
0.2041522, 0.3133127, -0.3657825, 0, 0.4588235, 1, 1,
0.2109806, 2.567045, -1.209884, 0, 0.454902, 1, 1,
0.2171409, 0.3035481, 0.7335086, 0, 0.4470588, 1, 1,
0.2176502, 0.221832, 0.1440945, 0, 0.4431373, 1, 1,
0.2176705, 0.05295938, 2.286078, 0, 0.4352941, 1, 1,
0.2207339, 0.4001948, 1.19859, 0, 0.4313726, 1, 1,
0.2275209, -1.946716, 4.515472, 0, 0.4235294, 1, 1,
0.2306414, -1.090872, 2.775508, 0, 0.4196078, 1, 1,
0.2326601, 0.3838577, 0.6857606, 0, 0.4117647, 1, 1,
0.2356222, -0.1715902, 3.024859, 0, 0.4078431, 1, 1,
0.238777, -0.5851606, 4.210873, 0, 0.4, 1, 1,
0.2416914, 1.328565, 0.5725334, 0, 0.3921569, 1, 1,
0.2454297, 1.202892, 0.8771097, 0, 0.3882353, 1, 1,
0.2457513, 1.470976, 0.1343524, 0, 0.3803922, 1, 1,
0.2474824, -0.8840466, 3.848857, 0, 0.3764706, 1, 1,
0.2503698, 1.636627, 1.521258, 0, 0.3686275, 1, 1,
0.2512699, 0.9778191, -0.2107136, 0, 0.3647059, 1, 1,
0.2516757, -0.161326, 0.7370655, 0, 0.3568628, 1, 1,
0.255664, -0.6472568, 5.163841, 0, 0.3529412, 1, 1,
0.2557208, -0.1051769, 2.629036, 0, 0.345098, 1, 1,
0.257512, 1.244719, 1.000448, 0, 0.3411765, 1, 1,
0.2635264, -0.4378321, 2.954905, 0, 0.3333333, 1, 1,
0.2649431, 0.2176123, 1.1065, 0, 0.3294118, 1, 1,
0.2655466, 0.4670781, 0.1245059, 0, 0.3215686, 1, 1,
0.2673871, 0.7909386, -0.4959844, 0, 0.3176471, 1, 1,
0.2693298, -0.2388447, 1.521716, 0, 0.3098039, 1, 1,
0.2704436, -0.2176525, 2.016667, 0, 0.3058824, 1, 1,
0.2737605, -0.441592, 2.513406, 0, 0.2980392, 1, 1,
0.2737994, 0.9639165, -0.9406858, 0, 0.2901961, 1, 1,
0.2750422, 0.660511, -0.3019404, 0, 0.2862745, 1, 1,
0.2760418, -0.9883165, 3.348318, 0, 0.2784314, 1, 1,
0.2787616, 0.8042479, -0.08934553, 0, 0.2745098, 1, 1,
0.2807916, 1.855402, -0.4040245, 0, 0.2666667, 1, 1,
0.2828909, -1.119412, 3.220051, 0, 0.2627451, 1, 1,
0.2838479, -1.22148, 1.413342, 0, 0.254902, 1, 1,
0.2839038, 0.1678128, 2.041953, 0, 0.2509804, 1, 1,
0.2844422, 1.352788, -0.05346354, 0, 0.2431373, 1, 1,
0.2850273, -0.004336122, 1.131125, 0, 0.2392157, 1, 1,
0.2890784, -1.127253, 2.893533, 0, 0.2313726, 1, 1,
0.2920429, 1.631611, -1.984582, 0, 0.227451, 1, 1,
0.2935461, 1.00775, 1.803769, 0, 0.2196078, 1, 1,
0.2993256, 1.175426, 2.003448, 0, 0.2156863, 1, 1,
0.2996319, -0.2280971, 2.641981, 0, 0.2078431, 1, 1,
0.3088285, 0.1363634, 1.671586, 0, 0.2039216, 1, 1,
0.3117075, 0.8066213, -0.8533041, 0, 0.1960784, 1, 1,
0.3176677, -0.3301648, 2.454575, 0, 0.1882353, 1, 1,
0.3182804, -0.765322, 3.172092, 0, 0.1843137, 1, 1,
0.3225094, 0.08269196, 1.892428, 0, 0.1764706, 1, 1,
0.3285305, -0.2676176, 2.056065, 0, 0.172549, 1, 1,
0.3295165, -0.9843662, 3.3961, 0, 0.1647059, 1, 1,
0.3318987, 0.4147449, 2.43134, 0, 0.1607843, 1, 1,
0.3336631, -1.090843, 5.196171, 0, 0.1529412, 1, 1,
0.3349761, -0.00361978, 0.7599458, 0, 0.1490196, 1, 1,
0.3363931, 0.2456076, 0.6293509, 0, 0.1411765, 1, 1,
0.3364609, 0.6243303, 0.5372794, 0, 0.1372549, 1, 1,
0.3366587, -1.403114, 2.284594, 0, 0.1294118, 1, 1,
0.3395472, 1.119319, 0.8403676, 0, 0.1254902, 1, 1,
0.3396896, -0.7503369, 3.092392, 0, 0.1176471, 1, 1,
0.3436665, -0.05248831, 3.957796, 0, 0.1137255, 1, 1,
0.3463922, 1.121079, -0.6181269, 0, 0.1058824, 1, 1,
0.3481158, 1.372157, -0.7401432, 0, 0.09803922, 1, 1,
0.3516693, 1.649902, -0.2686903, 0, 0.09411765, 1, 1,
0.3535542, 0.8790659, 0.3982805, 0, 0.08627451, 1, 1,
0.3564152, -0.5105437, 2.790405, 0, 0.08235294, 1, 1,
0.3601983, -0.5764386, 2.796534, 0, 0.07450981, 1, 1,
0.3674525, -0.512317, 3.51726, 0, 0.07058824, 1, 1,
0.367677, -2.194423, 3.590529, 0, 0.0627451, 1, 1,
0.3749335, -0.109599, 3.078084, 0, 0.05882353, 1, 1,
0.3755368, 0.1318343, 1.040849, 0, 0.05098039, 1, 1,
0.3854277, -0.2554289, 3.554957, 0, 0.04705882, 1, 1,
0.3862289, 0.6235618, -0.5771893, 0, 0.03921569, 1, 1,
0.3880284, -0.1259494, 3.90823, 0, 0.03529412, 1, 1,
0.3886918, -0.9592377, 4.406928, 0, 0.02745098, 1, 1,
0.3934327, -1.157236, 2.863159, 0, 0.02352941, 1, 1,
0.3950975, 0.553467, 0.5999834, 0, 0.01568628, 1, 1,
0.3977613, -0.8154871, 2.665276, 0, 0.01176471, 1, 1,
0.4000464, -1.121338, 5.189821, 0, 0.003921569, 1, 1,
0.4016951, 0.2079535, 0.5139521, 0.003921569, 0, 1, 1,
0.4038013, -0.1105527, 0.8452277, 0.007843138, 0, 1, 1,
0.4045036, 1.768775, 0.527368, 0.01568628, 0, 1, 1,
0.4061821, -1.164524, 2.727125, 0.01960784, 0, 1, 1,
0.4068277, 0.8512963, 1.296435, 0.02745098, 0, 1, 1,
0.4074994, 4.497101, -0.974319, 0.03137255, 0, 1, 1,
0.4112017, -0.01934472, -0.07442438, 0.03921569, 0, 1, 1,
0.4112136, -0.2537124, 1.505106, 0.04313726, 0, 1, 1,
0.4115356, 0.4342647, 0.0955634, 0.05098039, 0, 1, 1,
0.4129746, 0.2501382, 1.437299, 0.05490196, 0, 1, 1,
0.4131156, 0.0289661, 1.85731, 0.0627451, 0, 1, 1,
0.413632, 0.07462405, 2.034878, 0.06666667, 0, 1, 1,
0.4156478, 1.630737, -0.2313985, 0.07450981, 0, 1, 1,
0.4161182, 0.07656997, 1.903188, 0.07843138, 0, 1, 1,
0.4174327, 0.8526452, -0.04173102, 0.08627451, 0, 1, 1,
0.4184507, -1.889522, 2.375906, 0.09019608, 0, 1, 1,
0.4185318, -0.2036672, 3.216427, 0.09803922, 0, 1, 1,
0.4204625, 0.5448314, -0.4820227, 0.1058824, 0, 1, 1,
0.4205414, -0.9837175, 4.001006, 0.1098039, 0, 1, 1,
0.4227623, 1.738655, 1.378481, 0.1176471, 0, 1, 1,
0.4242142, -1.701792, 1.897233, 0.1215686, 0, 1, 1,
0.4264465, 1.485578, -0.7454774, 0.1294118, 0, 1, 1,
0.4307287, 0.7141662, 0.5583096, 0.1333333, 0, 1, 1,
0.4342291, 1.772888, -0.2386617, 0.1411765, 0, 1, 1,
0.4398291, -1.24008, 2.455391, 0.145098, 0, 1, 1,
0.441109, -2.089102, 2.734406, 0.1529412, 0, 1, 1,
0.4443444, -2.233169, 1.963225, 0.1568628, 0, 1, 1,
0.4461142, -0.6516548, 2.269312, 0.1647059, 0, 1, 1,
0.4481874, 0.6191556, -1.226877, 0.1686275, 0, 1, 1,
0.4524454, 0.6428338, 1.082679, 0.1764706, 0, 1, 1,
0.4549889, 0.6502391, -0.8853726, 0.1803922, 0, 1, 1,
0.4605706, 0.2602619, 1.345554, 0.1882353, 0, 1, 1,
0.4624626, -1.222255, 1.93508, 0.1921569, 0, 1, 1,
0.4652838, 1.854954, 0.4493935, 0.2, 0, 1, 1,
0.4686336, -0.03791152, 1.609303, 0.2078431, 0, 1, 1,
0.4707549, -0.3201084, 1.081523, 0.2117647, 0, 1, 1,
0.4730898, -1.521951, 1.992059, 0.2196078, 0, 1, 1,
0.474456, -1.483604, 2.462599, 0.2235294, 0, 1, 1,
0.4771227, 1.365011, 1.121017, 0.2313726, 0, 1, 1,
0.477198, -1.59072, 2.037327, 0.2352941, 0, 1, 1,
0.478158, 1.641776, 2.578198, 0.2431373, 0, 1, 1,
0.4898825, -0.828765, 3.688432, 0.2470588, 0, 1, 1,
0.4910881, -1.305968, 4.121798, 0.254902, 0, 1, 1,
0.4963996, -0.7861744, 3.79911, 0.2588235, 0, 1, 1,
0.4978249, 0.2458884, 2.879838, 0.2666667, 0, 1, 1,
0.4991519, 0.3547128, 0.4061166, 0.2705882, 0, 1, 1,
0.5004048, -1.640234, 2.005603, 0.2784314, 0, 1, 1,
0.5054974, -0.5017848, 2.081114, 0.282353, 0, 1, 1,
0.5109548, -0.5627519, 2.251512, 0.2901961, 0, 1, 1,
0.5169443, 0.9120026, 0.9974722, 0.2941177, 0, 1, 1,
0.517166, -0.6536339, 3.129137, 0.3019608, 0, 1, 1,
0.5216478, -1.433346, 3.411313, 0.3098039, 0, 1, 1,
0.5252882, 0.3038637, 1.891384, 0.3137255, 0, 1, 1,
0.5302377, 0.8081133, 0.6865816, 0.3215686, 0, 1, 1,
0.5323842, 0.4936918, 2.512974, 0.3254902, 0, 1, 1,
0.534104, -1.644858, 2.336801, 0.3333333, 0, 1, 1,
0.5346298, 0.3288765, 0.7987683, 0.3372549, 0, 1, 1,
0.5357821, 1.808221, -0.1942392, 0.345098, 0, 1, 1,
0.5364462, 0.7056218, 0.1225462, 0.3490196, 0, 1, 1,
0.5412911, 1.384358, 0.1379997, 0.3568628, 0, 1, 1,
0.5416709, 1.908628, -0.8577059, 0.3607843, 0, 1, 1,
0.5480142, 0.526659, -0.120764, 0.3686275, 0, 1, 1,
0.5481644, -0.8084061, 2.985231, 0.372549, 0, 1, 1,
0.5496992, 0.827084, 0.04211376, 0.3803922, 0, 1, 1,
0.5509757, 0.07069644, 0.4481104, 0.3843137, 0, 1, 1,
0.5516831, 1.493586, 0.03006094, 0.3921569, 0, 1, 1,
0.5545126, 1.612443, -2.551735, 0.3960784, 0, 1, 1,
0.5570028, -2.752072, 2.611573, 0.4039216, 0, 1, 1,
0.5572858, -0.2366386, 4.293456, 0.4117647, 0, 1, 1,
0.5578144, -0.08716106, 1.739836, 0.4156863, 0, 1, 1,
0.5606104, 1.484502, 0.3037677, 0.4235294, 0, 1, 1,
0.5655692, -0.02934188, 1.705476, 0.427451, 0, 1, 1,
0.5698794, -0.09906132, 1.69448, 0.4352941, 0, 1, 1,
0.5749401, -1.480085, 3.77493, 0.4392157, 0, 1, 1,
0.5793296, 1.332263, -0.4383808, 0.4470588, 0, 1, 1,
0.5833644, -0.3671327, 3.146286, 0.4509804, 0, 1, 1,
0.5860121, 1.245822, -1.379443, 0.4588235, 0, 1, 1,
0.5894542, -0.5043122, 1.563736, 0.4627451, 0, 1, 1,
0.5903757, -0.215957, 2.882118, 0.4705882, 0, 1, 1,
0.5912446, 0.6993008, 3.15856, 0.4745098, 0, 1, 1,
0.5930312, -0.1019515, 2.052785, 0.4823529, 0, 1, 1,
0.5941053, 1.309482, -1.334635, 0.4862745, 0, 1, 1,
0.5998656, -0.3439388, 1.619867, 0.4941176, 0, 1, 1,
0.6063361, -1.364589, 2.738328, 0.5019608, 0, 1, 1,
0.6083124, -1.106393, 1.533109, 0.5058824, 0, 1, 1,
0.6113414, 0.4842179, 2.486789, 0.5137255, 0, 1, 1,
0.6123614, -0.1239041, 1.19909, 0.5176471, 0, 1, 1,
0.6129382, -0.8385791, 1.724692, 0.5254902, 0, 1, 1,
0.6186544, -0.4931158, 1.266725, 0.5294118, 0, 1, 1,
0.6188062, 0.1239013, 1.366367, 0.5372549, 0, 1, 1,
0.6198764, -0.03668471, 1.326726, 0.5411765, 0, 1, 1,
0.62358, 0.6424364, 0.5285897, 0.5490196, 0, 1, 1,
0.6257246, 1.703294, 1.969923, 0.5529412, 0, 1, 1,
0.6275001, -0.7671153, 4.511916, 0.5607843, 0, 1, 1,
0.6285337, 0.2300384, 1.757826, 0.5647059, 0, 1, 1,
0.6367252, 2.635023, 1.738239, 0.572549, 0, 1, 1,
0.640938, -0.03122174, 1.26291, 0.5764706, 0, 1, 1,
0.6517807, 0.5594462, 0.8021718, 0.5843138, 0, 1, 1,
0.6528246, -1.943716, 3.980715, 0.5882353, 0, 1, 1,
0.656717, -0.3144455, 2.778995, 0.5960785, 0, 1, 1,
0.6586551, 0.3691502, 1.529857, 0.6039216, 0, 1, 1,
0.6592737, -0.5405396, 2.455309, 0.6078432, 0, 1, 1,
0.6635951, 0.4309584, 3.439384, 0.6156863, 0, 1, 1,
0.6643859, -0.6603653, 4.065384, 0.6196079, 0, 1, 1,
0.6653144, 0.789856, 1.511194, 0.627451, 0, 1, 1,
0.6656355, 0.7549084, -0.3942399, 0.6313726, 0, 1, 1,
0.6670557, 1.088496, -0.3351768, 0.6392157, 0, 1, 1,
0.6701975, -1.674684, 2.742116, 0.6431373, 0, 1, 1,
0.6707357, -0.4716387, 1.784889, 0.6509804, 0, 1, 1,
0.6737651, 0.2517059, 1.493424, 0.654902, 0, 1, 1,
0.683348, 0.3742025, 0.4703876, 0.6627451, 0, 1, 1,
0.6862166, -0.9377475, 2.372232, 0.6666667, 0, 1, 1,
0.6883882, -0.802981, 2.212931, 0.6745098, 0, 1, 1,
0.6890486, -1.221269, 2.138219, 0.6784314, 0, 1, 1,
0.6895987, -1.015255, 1.05005, 0.6862745, 0, 1, 1,
0.6919709, 0.4841033, 2.573201, 0.6901961, 0, 1, 1,
0.693699, -1.024451, 2.002996, 0.6980392, 0, 1, 1,
0.693898, 1.18608, 1.25441, 0.7058824, 0, 1, 1,
0.6955885, -0.06523685, 2.719099, 0.7098039, 0, 1, 1,
0.6984833, 0.114355, 1.145901, 0.7176471, 0, 1, 1,
0.7035169, 1.650754, -0.2332855, 0.7215686, 0, 1, 1,
0.7061211, -0.3485014, 1.886503, 0.7294118, 0, 1, 1,
0.7082354, 2.691404, 0.2474471, 0.7333333, 0, 1, 1,
0.7111545, -0.8043141, 2.774712, 0.7411765, 0, 1, 1,
0.7123711, -0.08561249, 0.7040859, 0.7450981, 0, 1, 1,
0.7334012, 2.663445, 0.9128321, 0.7529412, 0, 1, 1,
0.7452169, 0.2379719, 1.725038, 0.7568628, 0, 1, 1,
0.7488685, -0.4991888, 1.702734, 0.7647059, 0, 1, 1,
0.759712, 1.297481, -0.06808628, 0.7686275, 0, 1, 1,
0.7605038, 0.7375072, 0.2994063, 0.7764706, 0, 1, 1,
0.7643212, 0.480892, 0.9549814, 0.7803922, 0, 1, 1,
0.7648053, 0.5469679, 1.057155, 0.7882353, 0, 1, 1,
0.770538, 0.3865399, 1.137204, 0.7921569, 0, 1, 1,
0.7795143, 1.421651, -0.6448159, 0.8, 0, 1, 1,
0.7813089, -0.6055983, 1.662696, 0.8078431, 0, 1, 1,
0.7866738, -0.2540368, 0.7022009, 0.8117647, 0, 1, 1,
0.7979105, -1.043182, 1.804441, 0.8196079, 0, 1, 1,
0.8011871, -0.3664342, 0.8434061, 0.8235294, 0, 1, 1,
0.8014693, 0.2190046, 1.204692, 0.8313726, 0, 1, 1,
0.8036413, -1.299647, 2.405209, 0.8352941, 0, 1, 1,
0.8111808, 2.25875, 1.563267, 0.8431373, 0, 1, 1,
0.8150019, 0.5289444, -0.9837326, 0.8470588, 0, 1, 1,
0.8151597, -1.129635, 1.635623, 0.854902, 0, 1, 1,
0.8163077, -0.08959893, 2.181665, 0.8588235, 0, 1, 1,
0.8231047, 1.706947, -0.3300966, 0.8666667, 0, 1, 1,
0.8232732, -1.587553, 1.77815, 0.8705882, 0, 1, 1,
0.8248854, 0.507924, 2.171024, 0.8784314, 0, 1, 1,
0.8422261, 1.111645, 0.07097755, 0.8823529, 0, 1, 1,
0.8560426, 0.03948845, 2.346632, 0.8901961, 0, 1, 1,
0.8575836, -0.2139885, 1.600141, 0.8941177, 0, 1, 1,
0.8609543, -0.2290585, 1.702362, 0.9019608, 0, 1, 1,
0.8610968, 0.3402752, 0.4652861, 0.9098039, 0, 1, 1,
0.8617508, -1.071467, 4.043337, 0.9137255, 0, 1, 1,
0.8664364, 1.305001, -0.2234836, 0.9215686, 0, 1, 1,
0.8686822, -0.2270236, 2.744275, 0.9254902, 0, 1, 1,
0.8805138, -1.282442, 4.087189, 0.9333333, 0, 1, 1,
0.8822019, -0.2480729, 2.720802, 0.9372549, 0, 1, 1,
0.8834532, 1.438206, 0.4366321, 0.945098, 0, 1, 1,
0.8918999, -0.569792, 2.33812, 0.9490196, 0, 1, 1,
0.8964991, 0.8460016, 0.3744888, 0.9568627, 0, 1, 1,
0.899289, 0.7810065, 0.6149088, 0.9607843, 0, 1, 1,
0.9113972, -0.1882834, 2.080503, 0.9686275, 0, 1, 1,
0.9127195, 1.576541, 0.3261963, 0.972549, 0, 1, 1,
0.9189954, -1.055397, 1.589622, 0.9803922, 0, 1, 1,
0.9280847, -1.353924, 2.026477, 0.9843137, 0, 1, 1,
0.9318154, -0.5427758, 1.280052, 0.9921569, 0, 1, 1,
0.9346894, 1.370893, 0.9292756, 0.9960784, 0, 1, 1,
0.9412706, -1.427378, 2.437297, 1, 0, 0.9960784, 1,
0.9425936, -0.09915395, 1.886341, 1, 0, 0.9882353, 1,
0.9569721, -1.118631, 2.18472, 1, 0, 0.9843137, 1,
0.9604741, 0.6490309, -0.4012873, 1, 0, 0.9764706, 1,
0.9700595, -0.1192836, 1.220942, 1, 0, 0.972549, 1,
0.97006, -0.5379736, -0.008407038, 1, 0, 0.9647059, 1,
0.9708542, -0.5246335, 2.382279, 1, 0, 0.9607843, 1,
0.9723586, 0.6866907, 2.117959, 1, 0, 0.9529412, 1,
0.9739694, 0.3029516, -0.3996041, 1, 0, 0.9490196, 1,
0.9817103, 1.36778, -0.02707448, 1, 0, 0.9411765, 1,
0.9872556, -0.1125422, 2.111772, 1, 0, 0.9372549, 1,
0.9905807, 1.729392, 0.5266178, 1, 0, 0.9294118, 1,
1.000392, 0.4057989, 0.6810163, 1, 0, 0.9254902, 1,
1.008317, -1.466699, 4.320157, 1, 0, 0.9176471, 1,
1.012377, -1.828942, 1.8137, 1, 0, 0.9137255, 1,
1.015745, 0.6382225, 0.9980334, 1, 0, 0.9058824, 1,
1.017012, -0.4850675, 3.937921, 1, 0, 0.9019608, 1,
1.024796, -0.4842855, 1.810543, 1, 0, 0.8941177, 1,
1.027457, 0.02088743, 1.913748, 1, 0, 0.8862745, 1,
1.030498, 1.856457, 0.160226, 1, 0, 0.8823529, 1,
1.035658, -0.3694856, 0.2385526, 1, 0, 0.8745098, 1,
1.037036, 0.9812037, 1.76193, 1, 0, 0.8705882, 1,
1.037625, 1.11822, 0.7134839, 1, 0, 0.8627451, 1,
1.069181, 0.3597556, 0.1203711, 1, 0, 0.8588235, 1,
1.070868, -1.001881, 2.408202, 1, 0, 0.8509804, 1,
1.072499, 0.22556, 0.9831359, 1, 0, 0.8470588, 1,
1.074664, -1.294123, 1.700028, 1, 0, 0.8392157, 1,
1.075288, 1.298403, 0.00344746, 1, 0, 0.8352941, 1,
1.078276, 0.2599048, 0.6873466, 1, 0, 0.827451, 1,
1.079432, -0.491488, 1.49727, 1, 0, 0.8235294, 1,
1.079952, -0.7494809, 3.817111, 1, 0, 0.8156863, 1,
1.081873, -0.2875686, 2.218332, 1, 0, 0.8117647, 1,
1.086305, 0.2700189, 0.2814139, 1, 0, 0.8039216, 1,
1.089318, -0.6329644, 2.182974, 1, 0, 0.7960784, 1,
1.091418, 0.2417265, 1.743851, 1, 0, 0.7921569, 1,
1.096399, 0.5956659, 1.412196, 1, 0, 0.7843137, 1,
1.099814, 0.7226327, -1.104695, 1, 0, 0.7803922, 1,
1.108289, 0.2383422, 1.279368, 1, 0, 0.772549, 1,
1.109964, -1.380326, 2.944587, 1, 0, 0.7686275, 1,
1.110534, 0.3795355, 3.728479, 1, 0, 0.7607843, 1,
1.111194, 0.1744239, 1.483464, 1, 0, 0.7568628, 1,
1.120005, -0.003137171, 2.56192, 1, 0, 0.7490196, 1,
1.122431, -0.2035624, 2.392988, 1, 0, 0.7450981, 1,
1.123041, 2.400548, 0.04228134, 1, 0, 0.7372549, 1,
1.123304, -0.7434058, 1.743133, 1, 0, 0.7333333, 1,
1.126968, 0.4649573, 2.283971, 1, 0, 0.7254902, 1,
1.134274, 0.1100207, 1.445165, 1, 0, 0.7215686, 1,
1.136401, 0.6784594, -0.5318475, 1, 0, 0.7137255, 1,
1.138429, -0.9500896, -0.04363256, 1, 0, 0.7098039, 1,
1.140265, 0.4754758, 1.70049, 1, 0, 0.7019608, 1,
1.149607, 2.109042, -0.2995281, 1, 0, 0.6941177, 1,
1.158575, 0.6989632, 1.034293, 1, 0, 0.6901961, 1,
1.165059, 0.4707882, 2.045227, 1, 0, 0.682353, 1,
1.165434, 1.833669, 2.418025, 1, 0, 0.6784314, 1,
1.16882, 0.5462304, 2.310472, 1, 0, 0.6705883, 1,
1.196488, 0.1899982, 2.011207, 1, 0, 0.6666667, 1,
1.20341, 0.3521145, -1.124815, 1, 0, 0.6588235, 1,
1.203916, -0.7798054, 3.77721, 1, 0, 0.654902, 1,
1.212276, -1.370613, 1.888403, 1, 0, 0.6470588, 1,
1.213487, 1.202464, 2.610523, 1, 0, 0.6431373, 1,
1.218083, 0.05014702, 1.897568, 1, 0, 0.6352941, 1,
1.226983, -0.2767977, 1.122871, 1, 0, 0.6313726, 1,
1.233118, -0.1467932, 0.9697847, 1, 0, 0.6235294, 1,
1.238255, 0.9396908, -0.9350343, 1, 0, 0.6196079, 1,
1.238726, -1.953753, 1.299224, 1, 0, 0.6117647, 1,
1.23948, -0.7984202, 0.4398935, 1, 0, 0.6078432, 1,
1.249353, 0.9424913, 1.359023, 1, 0, 0.6, 1,
1.25374, 0.1306373, -0.01719152, 1, 0, 0.5921569, 1,
1.272643, 0.5795639, 1.541015, 1, 0, 0.5882353, 1,
1.273634, -1.08099, 1.203642, 1, 0, 0.5803922, 1,
1.276598, -1.14308, 2.076345, 1, 0, 0.5764706, 1,
1.280796, -0.4095075, 1.334706, 1, 0, 0.5686275, 1,
1.284357, 1.015256, -0.6838871, 1, 0, 0.5647059, 1,
1.287586, -0.9953368, 2.650393, 1, 0, 0.5568628, 1,
1.303262, 1.911408, -0.1207824, 1, 0, 0.5529412, 1,
1.313509, -0.1186134, 2.783328, 1, 0, 0.5450981, 1,
1.315937, 0.6486694, 0.3775418, 1, 0, 0.5411765, 1,
1.325748, -0.463822, 2.228076, 1, 0, 0.5333334, 1,
1.326933, 0.8840546, 1.952338, 1, 0, 0.5294118, 1,
1.332833, 1.170326, -0.2659143, 1, 0, 0.5215687, 1,
1.345949, 0.08906694, 1.23217, 1, 0, 0.5176471, 1,
1.348821, 2.723373, 0.6137276, 1, 0, 0.509804, 1,
1.351243, -0.2106575, 2.257619, 1, 0, 0.5058824, 1,
1.358737, 0.9076694, 2.095475, 1, 0, 0.4980392, 1,
1.358784, 0.04426301, 1.08931, 1, 0, 0.4901961, 1,
1.371587, 0.4244422, 1.768639, 1, 0, 0.4862745, 1,
1.371814, -1.530728, 1.587531, 1, 0, 0.4784314, 1,
1.379179, 1.926673, -0.9449658, 1, 0, 0.4745098, 1,
1.380512, -1.964763, 3.17749, 1, 0, 0.4666667, 1,
1.398789, -0.468596, 2.85003, 1, 0, 0.4627451, 1,
1.415776, -0.3877708, 2.359556, 1, 0, 0.454902, 1,
1.41994, -1.294922, 1.766726, 1, 0, 0.4509804, 1,
1.433239, 0.33528, 1.253761, 1, 0, 0.4431373, 1,
1.434637, -0.2558893, 0.9305111, 1, 0, 0.4392157, 1,
1.439451, 0.3323813, 3.876836, 1, 0, 0.4313726, 1,
1.456349, 0.9637498, 2.435559, 1, 0, 0.427451, 1,
1.457579, 0.8313407, 1.561139, 1, 0, 0.4196078, 1,
1.460054, 0.6825687, 2.195843, 1, 0, 0.4156863, 1,
1.461466, 0.3925944, 0.5837615, 1, 0, 0.4078431, 1,
1.461495, 1.386101, 2.017413, 1, 0, 0.4039216, 1,
1.462281, -1.284762, 1.230895, 1, 0, 0.3960784, 1,
1.464411, -0.3037263, 2.917556, 1, 0, 0.3882353, 1,
1.471472, -1.402176, 1.948003, 1, 0, 0.3843137, 1,
1.477065, -1.494251, 0.261485, 1, 0, 0.3764706, 1,
1.477913, 1.932217, 0.161548, 1, 0, 0.372549, 1,
1.494977, 0.4426933, 1.274919, 1, 0, 0.3647059, 1,
1.497301, 0.6479229, 0.8971635, 1, 0, 0.3607843, 1,
1.517141, 1.680626, 1.554899, 1, 0, 0.3529412, 1,
1.519374, -0.4412276, 2.179807, 1, 0, 0.3490196, 1,
1.525393, -0.6028982, 1.93941, 1, 0, 0.3411765, 1,
1.532277, 0.01129023, -0.2482905, 1, 0, 0.3372549, 1,
1.548094, -0.7400783, 3.250819, 1, 0, 0.3294118, 1,
1.550379, -0.3620733, -0.8858795, 1, 0, 0.3254902, 1,
1.569924, 0.4606337, 1.716219, 1, 0, 0.3176471, 1,
1.576912, 0.6259649, 1.907402, 1, 0, 0.3137255, 1,
1.585567, -1.771091, 2.447385, 1, 0, 0.3058824, 1,
1.587306, -1.915059, 3.159775, 1, 0, 0.2980392, 1,
1.589321, 1.795723, -1.326747, 1, 0, 0.2941177, 1,
1.607689, 1.08194, 1.213502, 1, 0, 0.2862745, 1,
1.619944, -0.1021907, 0.2854209, 1, 0, 0.282353, 1,
1.655487, -1.407699, 2.287844, 1, 0, 0.2745098, 1,
1.657737, -0.9044408, 1.86589, 1, 0, 0.2705882, 1,
1.65892, -0.604906, 2.847192, 1, 0, 0.2627451, 1,
1.661839, 0.2622015, 1.713487, 1, 0, 0.2588235, 1,
1.678851, 1.183053, 1.200618, 1, 0, 0.2509804, 1,
1.696718, 0.8809065, -0.8233493, 1, 0, 0.2470588, 1,
1.717345, 0.6037114, 0.9241912, 1, 0, 0.2392157, 1,
1.722299, -0.8558861, 3.571261, 1, 0, 0.2352941, 1,
1.725451, 1.039275, 1.979224, 1, 0, 0.227451, 1,
1.739693, -0.583193, 0.2373631, 1, 0, 0.2235294, 1,
1.7397, -0.3293367, 0.5065084, 1, 0, 0.2156863, 1,
1.746678, 0.5842546, 1.834625, 1, 0, 0.2117647, 1,
1.746936, 2.109811, 0.3739176, 1, 0, 0.2039216, 1,
1.751035, 0.6618051, 2.063541, 1, 0, 0.1960784, 1,
1.754171, 1.169472, 2.246831, 1, 0, 0.1921569, 1,
1.759821, 1.132287, 0.7359555, 1, 0, 0.1843137, 1,
1.767302, 0.0008255125, -0.6046603, 1, 0, 0.1803922, 1,
1.793591, -0.3223626, 1.10912, 1, 0, 0.172549, 1,
1.794765, 1.170909, -0.7973553, 1, 0, 0.1686275, 1,
1.820988, 1.165877, -0.1268888, 1, 0, 0.1607843, 1,
1.837486, -0.5164272, 3.592347, 1, 0, 0.1568628, 1,
1.844873, 1.540851, 2.258143, 1, 0, 0.1490196, 1,
1.858788, -0.3906822, 1.667096, 1, 0, 0.145098, 1,
1.906608, -0.8673804, 1.449592, 1, 0, 0.1372549, 1,
1.907799, 0.4083041, 1.062059, 1, 0, 0.1333333, 1,
1.930174, 0.8447278, 1.031587, 1, 0, 0.1254902, 1,
1.940074, -0.3366786, 2.700785, 1, 0, 0.1215686, 1,
1.9428, 1.769023, 0.8258437, 1, 0, 0.1137255, 1,
1.948706, -0.5110639, 2.379884, 1, 0, 0.1098039, 1,
1.953134, -0.3090423, 3.672697, 1, 0, 0.1019608, 1,
1.968138, -0.6672028, 0.352349, 1, 0, 0.09411765, 1,
1.971598, 1.82873, 0.7818736, 1, 0, 0.09019608, 1,
1.997874, 0.2815676, 2.267833, 1, 0, 0.08235294, 1,
1.999794, -0.1786645, 1.320028, 1, 0, 0.07843138, 1,
2.0091, -0.05988884, 0.4759714, 1, 0, 0.07058824, 1,
2.030127, -1.470714, 2.793086, 1, 0, 0.06666667, 1,
2.038169, 0.3386139, 1.870618, 1, 0, 0.05882353, 1,
2.101688, -0.8275828, 1.605712, 1, 0, 0.05490196, 1,
2.120528, -0.01928912, 1.720253, 1, 0, 0.04705882, 1,
2.244995, -1.404158, 2.444877, 1, 0, 0.04313726, 1,
2.418996, 0.01077312, 2.578484, 1, 0, 0.03529412, 1,
2.447133, -1.227193, 1.254115, 1, 0, 0.03137255, 1,
2.451237, -0.07127808, 0.1609556, 1, 0, 0.02352941, 1,
2.493958, 1.655261, 0.4918638, 1, 0, 0.01960784, 1,
2.657405, -1.042459, 1.997369, 1, 0, 0.01176471, 1,
2.83479, -1.024411, 2.524078, 1, 0, 0.007843138, 1
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
-0.08001673, -3.980807, -7.273032, 0, -0.5, 0.5, 0.5,
-0.08001673, -3.980807, -7.273032, 1, -0.5, 0.5, 0.5,
-0.08001673, -3.980807, -7.273032, 1, 1.5, 0.5, 0.5,
-0.08001673, -3.980807, -7.273032, 0, 1.5, 0.5, 0.5
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
-3.982944, 0.8725146, -7.273032, 0, -0.5, 0.5, 0.5,
-3.982944, 0.8725146, -7.273032, 1, -0.5, 0.5, 0.5,
-3.982944, 0.8725146, -7.273032, 1, 1.5, 0.5, 0.5,
-3.982944, 0.8725146, -7.273032, 0, 1.5, 0.5, 0.5
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
-3.982944, -3.980807, -0.1172967, 0, -0.5, 0.5, 0.5,
-3.982944, -3.980807, -0.1172967, 1, -0.5, 0.5, 0.5,
-3.982944, -3.980807, -0.1172967, 1, 1.5, 0.5, 0.5,
-3.982944, -3.980807, -0.1172967, 0, 1.5, 0.5, 0.5
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
-2, -2.86081, -5.621708,
2, -2.86081, -5.621708,
-2, -2.86081, -5.621708,
-2, -3.047476, -5.896929,
-1, -2.86081, -5.621708,
-1, -3.047476, -5.896929,
0, -2.86081, -5.621708,
0, -3.047476, -5.896929,
1, -2.86081, -5.621708,
1, -3.047476, -5.896929,
2, -2.86081, -5.621708,
2, -3.047476, -5.896929
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
-2, -3.420808, -6.44737, 0, -0.5, 0.5, 0.5,
-2, -3.420808, -6.44737, 1, -0.5, 0.5, 0.5,
-2, -3.420808, -6.44737, 1, 1.5, 0.5, 0.5,
-2, -3.420808, -6.44737, 0, 1.5, 0.5, 0.5,
-1, -3.420808, -6.44737, 0, -0.5, 0.5, 0.5,
-1, -3.420808, -6.44737, 1, -0.5, 0.5, 0.5,
-1, -3.420808, -6.44737, 1, 1.5, 0.5, 0.5,
-1, -3.420808, -6.44737, 0, 1.5, 0.5, 0.5,
0, -3.420808, -6.44737, 0, -0.5, 0.5, 0.5,
0, -3.420808, -6.44737, 1, -0.5, 0.5, 0.5,
0, -3.420808, -6.44737, 1, 1.5, 0.5, 0.5,
0, -3.420808, -6.44737, 0, 1.5, 0.5, 0.5,
1, -3.420808, -6.44737, 0, -0.5, 0.5, 0.5,
1, -3.420808, -6.44737, 1, -0.5, 0.5, 0.5,
1, -3.420808, -6.44737, 1, 1.5, 0.5, 0.5,
1, -3.420808, -6.44737, 0, 1.5, 0.5, 0.5,
2, -3.420808, -6.44737, 0, -0.5, 0.5, 0.5,
2, -3.420808, -6.44737, 1, -0.5, 0.5, 0.5,
2, -3.420808, -6.44737, 1, 1.5, 0.5, 0.5,
2, -3.420808, -6.44737, 0, 1.5, 0.5, 0.5
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
-3.082268, -2, -5.621708,
-3.082268, 4, -5.621708,
-3.082268, -2, -5.621708,
-3.232381, -2, -5.896929,
-3.082268, 0, -5.621708,
-3.232381, 0, -5.896929,
-3.082268, 2, -5.621708,
-3.232381, 2, -5.896929,
-3.082268, 4, -5.621708,
-3.232381, 4, -5.896929
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
-3.532606, -2, -6.44737, 0, -0.5, 0.5, 0.5,
-3.532606, -2, -6.44737, 1, -0.5, 0.5, 0.5,
-3.532606, -2, -6.44737, 1, 1.5, 0.5, 0.5,
-3.532606, -2, -6.44737, 0, 1.5, 0.5, 0.5,
-3.532606, 0, -6.44737, 0, -0.5, 0.5, 0.5,
-3.532606, 0, -6.44737, 1, -0.5, 0.5, 0.5,
-3.532606, 0, -6.44737, 1, 1.5, 0.5, 0.5,
-3.532606, 0, -6.44737, 0, 1.5, 0.5, 0.5,
-3.532606, 2, -6.44737, 0, -0.5, 0.5, 0.5,
-3.532606, 2, -6.44737, 1, -0.5, 0.5, 0.5,
-3.532606, 2, -6.44737, 1, 1.5, 0.5, 0.5,
-3.532606, 2, -6.44737, 0, 1.5, 0.5, 0.5,
-3.532606, 4, -6.44737, 0, -0.5, 0.5, 0.5,
-3.532606, 4, -6.44737, 1, -0.5, 0.5, 0.5,
-3.532606, 4, -6.44737, 1, 1.5, 0.5, 0.5,
-3.532606, 4, -6.44737, 0, 1.5, 0.5, 0.5
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
-3.082268, -2.86081, -4,
-3.082268, -2.86081, 4,
-3.082268, -2.86081, -4,
-3.232381, -3.047476, -4,
-3.082268, -2.86081, -2,
-3.232381, -3.047476, -2,
-3.082268, -2.86081, 0,
-3.232381, -3.047476, 0,
-3.082268, -2.86081, 2,
-3.232381, -3.047476, 2,
-3.082268, -2.86081, 4,
-3.232381, -3.047476, 4
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
-3.532606, -3.420808, -4, 0, -0.5, 0.5, 0.5,
-3.532606, -3.420808, -4, 1, -0.5, 0.5, 0.5,
-3.532606, -3.420808, -4, 1, 1.5, 0.5, 0.5,
-3.532606, -3.420808, -4, 0, 1.5, 0.5, 0.5,
-3.532606, -3.420808, -2, 0, -0.5, 0.5, 0.5,
-3.532606, -3.420808, -2, 1, -0.5, 0.5, 0.5,
-3.532606, -3.420808, -2, 1, 1.5, 0.5, 0.5,
-3.532606, -3.420808, -2, 0, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 0, 0, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 0, 1, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 0, 1, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 0, 0, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 2, 0, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 2, 1, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 2, 1, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 2, 0, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 4, 0, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 4, 1, -0.5, 0.5, 0.5,
-3.532606, -3.420808, 4, 1, 1.5, 0.5, 0.5,
-3.532606, -3.420808, 4, 0, 1.5, 0.5, 0.5
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
-3.082268, -2.86081, -5.621708,
-3.082268, 4.605839, -5.621708,
-3.082268, -2.86081, 5.387115,
-3.082268, 4.605839, 5.387115,
-3.082268, -2.86081, -5.621708,
-3.082268, -2.86081, 5.387115,
-3.082268, 4.605839, -5.621708,
-3.082268, 4.605839, 5.387115,
-3.082268, -2.86081, -5.621708,
2.922235, -2.86081, -5.621708,
-3.082268, -2.86081, 5.387115,
2.922235, -2.86081, 5.387115,
-3.082268, 4.605839, -5.621708,
2.922235, 4.605839, -5.621708,
-3.082268, 4.605839, 5.387115,
2.922235, 4.605839, 5.387115,
2.922235, -2.86081, -5.621708,
2.922235, 4.605839, -5.621708,
2.922235, -2.86081, 5.387115,
2.922235, 4.605839, 5.387115,
2.922235, -2.86081, -5.621708,
2.922235, -2.86081, 5.387115,
2.922235, 4.605839, -5.621708,
2.922235, 4.605839, 5.387115
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
var radius = 7.793173;
var distance = 34.67271;
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
mvMatrix.translate( 0.08001673, -0.8725146, 0.1172967 );
mvMatrix.scale( 1.403302, 1.128502, 0.765398 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67271);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Anilazine<-read.table("Anilazine.xyz")
```

```
## Error in read.table("Anilazine.xyz"): no lines available in input
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
-2.994824, 0.336762, -1.287572, 0, 0, 1, 1, 1,
-2.642818, -0.6360103, -1.880637, 1, 0, 0, 1, 1,
-2.61371, -0.787213, -2.072512, 1, 0, 0, 1, 1,
-2.575486, -0.06660487, -1.731057, 1, 0, 0, 1, 1,
-2.430228, -0.7953321, -0.5482105, 1, 0, 0, 1, 1,
-2.418564, 0.4517206, -0.9845929, 1, 0, 0, 1, 1,
-2.402099, 0.8857145, -1.41301, 0, 0, 0, 1, 1,
-2.397907, -0.6952006, -0.9468568, 0, 0, 0, 1, 1,
-2.381732, 1.456611, -0.07528993, 0, 0, 0, 1, 1,
-2.356443, 0.1979107, -1.431515, 0, 0, 0, 1, 1,
-2.355098, 0.2701627, -1.235457, 0, 0, 0, 1, 1,
-2.350672, -0.6484612, -1.404817, 0, 0, 0, 1, 1,
-2.339252, -1.261466, -1.071277, 0, 0, 0, 1, 1,
-2.307204, -1.504999, -2.039912, 1, 1, 1, 1, 1,
-2.302857, 0.1522088, -2.403822, 1, 1, 1, 1, 1,
-2.284984, 0.1718464, 0.3648804, 1, 1, 1, 1, 1,
-2.261203, 0.6248857, -0.530134, 1, 1, 1, 1, 1,
-2.255155, 1.263802, -1.736726, 1, 1, 1, 1, 1,
-2.177556, -0.07533217, -2.210302, 1, 1, 1, 1, 1,
-2.151422, 0.8551483, -0.5070133, 1, 1, 1, 1, 1,
-2.092907, -0.06470173, -2.8392, 1, 1, 1, 1, 1,
-2.089732, -1.426572, -4.992789, 1, 1, 1, 1, 1,
-2.082922, 0.05428819, -0.6026657, 1, 1, 1, 1, 1,
-2.063195, 0.7360231, -2.248648, 1, 1, 1, 1, 1,
-2.055086, -0.7928354, -1.795986, 1, 1, 1, 1, 1,
-2.051638, -1.194113, -3.132951, 1, 1, 1, 1, 1,
-2.025303, -0.2594444, -2.450014, 1, 1, 1, 1, 1,
-2.012562, 0.09788369, -1.766404, 1, 1, 1, 1, 1,
-2.005573, 1.07881, -1.956604, 0, 0, 1, 1, 1,
-1.961985, -1.595014, -1.655688, 1, 0, 0, 1, 1,
-1.960704, -0.671271, -1.580981, 1, 0, 0, 1, 1,
-1.959812, 0.3151292, -1.702229, 1, 0, 0, 1, 1,
-1.955607, -0.6691493, -0.448269, 1, 0, 0, 1, 1,
-1.952697, 0.149583, -2.532617, 1, 0, 0, 1, 1,
-1.941209, 1.890096, 0.09710444, 0, 0, 0, 1, 1,
-1.916879, -0.244433, -2.064934, 0, 0, 0, 1, 1,
-1.90402, 1.06828, -2.358528, 0, 0, 0, 1, 1,
-1.897007, -1.06635, -3.315558, 0, 0, 0, 1, 1,
-1.882969, 0.4353637, -1.270363, 0, 0, 0, 1, 1,
-1.878417, 0.4969689, -1.851106, 0, 0, 0, 1, 1,
-1.873101, -0.8413524, -1.872714, 0, 0, 0, 1, 1,
-1.845027, -0.3300266, -1.915427, 1, 1, 1, 1, 1,
-1.825182, -1.114713, -1.782141, 1, 1, 1, 1, 1,
-1.805576, 0.2378406, -2.862006, 1, 1, 1, 1, 1,
-1.802157, 0.4317276, -0.9352629, 1, 1, 1, 1, 1,
-1.798838, 0.1394658, -1.402573, 1, 1, 1, 1, 1,
-1.781706, 0.5962086, -0.6315147, 1, 1, 1, 1, 1,
-1.745698, 1.215102, 0.2269858, 1, 1, 1, 1, 1,
-1.739987, 2.429778, -0.1790497, 1, 1, 1, 1, 1,
-1.720827, 1.102077, 0.565312, 1, 1, 1, 1, 1,
-1.714081, -1.77102, -2.067409, 1, 1, 1, 1, 1,
-1.713664, -1.276484, -4.13049, 1, 1, 1, 1, 1,
-1.695489, 0.4466129, -2.258543, 1, 1, 1, 1, 1,
-1.663761, -0.3391429, -0.9962258, 1, 1, 1, 1, 1,
-1.658566, -0.2922469, -1.626174, 1, 1, 1, 1, 1,
-1.656915, 1.090932, -0.274829, 1, 1, 1, 1, 1,
-1.656054, 0.9656042, -0.6884853, 0, 0, 1, 1, 1,
-1.646367, -0.4751688, -1.914694, 1, 0, 0, 1, 1,
-1.644704, -0.6653794, -1.258064, 1, 0, 0, 1, 1,
-1.640095, -2.0579, -2.774479, 1, 0, 0, 1, 1,
-1.633933, -0.5774337, -1.738488, 1, 0, 0, 1, 1,
-1.630252, 1.182973, -0.5254159, 1, 0, 0, 1, 1,
-1.626528, -1.064081, -0.002459972, 0, 0, 0, 1, 1,
-1.616167, -0.6218159, -2.605707, 0, 0, 0, 1, 1,
-1.614416, 0.6000233, -1.259058, 0, 0, 0, 1, 1,
-1.608351, -0.6974424, -3.61924, 0, 0, 0, 1, 1,
-1.535644, 0.401834, -0.5880586, 0, 0, 0, 1, 1,
-1.52957, 0.909663, 0.7334032, 0, 0, 0, 1, 1,
-1.525811, -1.712197, -3.094817, 0, 0, 0, 1, 1,
-1.512498, 0.6044188, -2.390007, 1, 1, 1, 1, 1,
-1.512151, -0.8105133, -2.04626, 1, 1, 1, 1, 1,
-1.511296, -1.480052, -2.605865, 1, 1, 1, 1, 1,
-1.500901, 0.4565198, -2.227046, 1, 1, 1, 1, 1,
-1.495491, 0.1651938, -0.9297267, 1, 1, 1, 1, 1,
-1.491118, 0.4338219, -0.9369255, 1, 1, 1, 1, 1,
-1.488277, 0.9850212, -3.170255, 1, 1, 1, 1, 1,
-1.469868, 1.117094, -0.5874792, 1, 1, 1, 1, 1,
-1.462025, -1.54639, -1.208943, 1, 1, 1, 1, 1,
-1.458959, 1.177269, 0.9251303, 1, 1, 1, 1, 1,
-1.453726, -0.7738022, -2.621331, 1, 1, 1, 1, 1,
-1.452834, 0.4762613, -1.094795, 1, 1, 1, 1, 1,
-1.451878, -0.3255396, -0.9734734, 1, 1, 1, 1, 1,
-1.449918, 0.6744864, -1.204682, 1, 1, 1, 1, 1,
-1.446408, 0.2614139, -0.6443249, 1, 1, 1, 1, 1,
-1.427605, 0.5722779, -0.3980778, 0, 0, 1, 1, 1,
-1.425056, 0.3451372, 0.565967, 1, 0, 0, 1, 1,
-1.416301, 0.4337465, -3.167539, 1, 0, 0, 1, 1,
-1.414462, -1.024526, -1.174398, 1, 0, 0, 1, 1,
-1.398682, 0.6314644, -0.8718853, 1, 0, 0, 1, 1,
-1.390443, 0.1571395, -1.707892, 1, 0, 0, 1, 1,
-1.383539, -1.229625, -0.5413325, 0, 0, 0, 1, 1,
-1.379704, -1.208581, -3.950791, 0, 0, 0, 1, 1,
-1.379329, -1.632698, -3.852962, 0, 0, 0, 1, 1,
-1.366683, -1.406954, -0.7481962, 0, 0, 0, 1, 1,
-1.347623, 0.8214517, -0.8520604, 0, 0, 0, 1, 1,
-1.343989, 0.08640067, -2.072726, 0, 0, 0, 1, 1,
-1.341854, 0.7987824, -1.456066, 0, 0, 0, 1, 1,
-1.341126, 0.3634254, -4.305872, 1, 1, 1, 1, 1,
-1.338077, -0.9974815, -1.718498, 1, 1, 1, 1, 1,
-1.336872, 1.128172, -2.061453, 1, 1, 1, 1, 1,
-1.327649, -0.02207284, -1.986715, 1, 1, 1, 1, 1,
-1.327315, 0.8780185, 0.7294943, 1, 1, 1, 1, 1,
-1.324887, -1.036003, -4.04429, 1, 1, 1, 1, 1,
-1.320335, 1.132473, -1.257145, 1, 1, 1, 1, 1,
-1.317998, -0.3227392, -3.208886, 1, 1, 1, 1, 1,
-1.317815, -0.9478803, -1.952392, 1, 1, 1, 1, 1,
-1.309045, 0.8826919, -2.943409, 1, 1, 1, 1, 1,
-1.292639, 0.5546116, -0.9718267, 1, 1, 1, 1, 1,
-1.288943, 1.533383, -3.334532, 1, 1, 1, 1, 1,
-1.288422, 0.7143729, -0.8847392, 1, 1, 1, 1, 1,
-1.287468, 0.5137457, -1.477993, 1, 1, 1, 1, 1,
-1.285947, 1.808849, -0.2319331, 1, 1, 1, 1, 1,
-1.283026, 1.567896, -1.199438, 0, 0, 1, 1, 1,
-1.260465, 0.4656695, -1.708402, 1, 0, 0, 1, 1,
-1.257247, 0.01934303, -1.245933, 1, 0, 0, 1, 1,
-1.256184, -1.024338, -1.334403, 1, 0, 0, 1, 1,
-1.2491, -0.2294779, -2.025427, 1, 0, 0, 1, 1,
-1.246032, -0.6208094, -1.838604, 1, 0, 0, 1, 1,
-1.238739, 0.802282, -1.571944, 0, 0, 0, 1, 1,
-1.238182, 0.06569991, -2.666401, 0, 0, 0, 1, 1,
-1.234396, 0.6327238, -2.133085, 0, 0, 0, 1, 1,
-1.223419, 1.640656, -0.1300356, 0, 0, 0, 1, 1,
-1.20823, -0.6089317, -1.926248, 0, 0, 0, 1, 1,
-1.205194, 0.889894, -2.498904, 0, 0, 0, 1, 1,
-1.199074, -1.424221, -3.644732, 0, 0, 0, 1, 1,
-1.196146, -0.2221245, -1.774734, 1, 1, 1, 1, 1,
-1.194105, 0.5686514, -0.503877, 1, 1, 1, 1, 1,
-1.19129, -0.01138831, -1.695928, 1, 1, 1, 1, 1,
-1.179891, -0.05304299, -1.424931, 1, 1, 1, 1, 1,
-1.161858, -1.123646, -1.65709, 1, 1, 1, 1, 1,
-1.153716, 1.111824, -0.6734, 1, 1, 1, 1, 1,
-1.151123, 1.300198, 0.6763651, 1, 1, 1, 1, 1,
-1.142009, -1.006093, -1.385549, 1, 1, 1, 1, 1,
-1.134004, -0.3464733, -1.270669, 1, 1, 1, 1, 1,
-1.132023, -1.351099, -3.536919, 1, 1, 1, 1, 1,
-1.130581, -1.506853, -2.149201, 1, 1, 1, 1, 1,
-1.117186, -0.3036928, -0.7128333, 1, 1, 1, 1, 1,
-1.115958, -1.182863, -1.458039, 1, 1, 1, 1, 1,
-1.111022, 1.342903, -2.270583, 1, 1, 1, 1, 1,
-1.108821, -0.5833501, -5.353224, 1, 1, 1, 1, 1,
-1.106662, 1.10121, -0.4242898, 0, 0, 1, 1, 1,
-1.10184, -1.294992, -1.45286, 1, 0, 0, 1, 1,
-1.100922, -0.3045965, -1.409961, 1, 0, 0, 1, 1,
-1.099025, -0.7366819, -2.582342, 1, 0, 0, 1, 1,
-1.092751, 0.01974877, -1.780416, 1, 0, 0, 1, 1,
-1.085821, -0.2668702, -0.9056043, 1, 0, 0, 1, 1,
-1.083385, -0.2032235, -3.90728, 0, 0, 0, 1, 1,
-1.066382, -0.01532718, -1.967502, 0, 0, 0, 1, 1,
-1.064368, 0.1646722, -2.302036, 0, 0, 0, 1, 1,
-1.063785, 0.3901872, -2.586519, 0, 0, 0, 1, 1,
-1.062217, -0.1535574, 0.3699524, 0, 0, 0, 1, 1,
-1.059281, -0.9192008, -1.243705, 0, 0, 0, 1, 1,
-1.042861, 0.6251217, -1.45307, 0, 0, 0, 1, 1,
-1.042339, -1.500993, -1.650376, 1, 1, 1, 1, 1,
-1.040518, -1.143087, -2.749873, 1, 1, 1, 1, 1,
-1.037985, 0.4607255, -2.359548, 1, 1, 1, 1, 1,
-1.033125, -1.502387, -1.093916, 1, 1, 1, 1, 1,
-1.026972, -0.7196634, -1.110473, 1, 1, 1, 1, 1,
-1.024377, -1.224549, -2.076835, 1, 1, 1, 1, 1,
-1.014244, 0.1048407, -2.931896, 1, 1, 1, 1, 1,
-0.9997005, -0.3552314, -1.146027, 1, 1, 1, 1, 1,
-0.9996476, -0.3407618, -2.233545, 1, 1, 1, 1, 1,
-0.9941539, 1.257335, -0.6915801, 1, 1, 1, 1, 1,
-0.9917306, -0.8528919, -1.64307, 1, 1, 1, 1, 1,
-0.984898, -0.4396511, -0.5806991, 1, 1, 1, 1, 1,
-0.9832406, -1.032613, -4.239887, 1, 1, 1, 1, 1,
-0.9782615, 0.733435, -0.3718209, 1, 1, 1, 1, 1,
-0.9746789, 1.380409, -0.936002, 1, 1, 1, 1, 1,
-0.9690177, 0.01471893, -3.253622, 0, 0, 1, 1, 1,
-0.9629715, -1.370372, -4.950049, 1, 0, 0, 1, 1,
-0.9595652, 0.1792451, -1.894451, 1, 0, 0, 1, 1,
-0.9588681, -0.176391, -1.4893, 1, 0, 0, 1, 1,
-0.9578651, 0.6372978, -1.145531, 1, 0, 0, 1, 1,
-0.9573826, 0.5648627, -1.643763, 1, 0, 0, 1, 1,
-0.9573727, -0.2399987, -2.439353, 0, 0, 0, 1, 1,
-0.9566893, 0.8761334, -0.8141385, 0, 0, 0, 1, 1,
-0.9505358, 1.312275, -0.4262356, 0, 0, 0, 1, 1,
-0.9431668, -1.485429, -2.873576, 0, 0, 0, 1, 1,
-0.9397901, 0.3224803, -2.356706, 0, 0, 0, 1, 1,
-0.939474, 1.034613, -1.918453, 0, 0, 0, 1, 1,
-0.9376932, -0.333391, -1.822762, 0, 0, 0, 1, 1,
-0.9360614, -0.5384538, -1.818598, 1, 1, 1, 1, 1,
-0.933894, -1.424494, -3.31164, 1, 1, 1, 1, 1,
-0.9311051, -0.9195873, -3.840375, 1, 1, 1, 1, 1,
-0.9287367, -0.6582041, -2.295232, 1, 1, 1, 1, 1,
-0.9202225, -0.274554, -2.913857, 1, 1, 1, 1, 1,
-0.9161797, -1.284009, -3.887973, 1, 1, 1, 1, 1,
-0.9148843, 1.013163, -2.466457, 1, 1, 1, 1, 1,
-0.9147769, -0.06864216, -0.6482772, 1, 1, 1, 1, 1,
-0.9017058, -0.8663371, -1.974157, 1, 1, 1, 1, 1,
-0.9009315, 0.8961209, -0.6423857, 1, 1, 1, 1, 1,
-0.8973103, -0.4046482, -3.067729, 1, 1, 1, 1, 1,
-0.8968796, 0.06219175, -1.111226, 1, 1, 1, 1, 1,
-0.8961325, 0.5451446, -2.400259, 1, 1, 1, 1, 1,
-0.8946967, 2.759712, -0.7615638, 1, 1, 1, 1, 1,
-0.8928916, -1.396721, -2.403139, 1, 1, 1, 1, 1,
-0.8894293, 1.145164, 0.8752403, 0, 0, 1, 1, 1,
-0.8891494, 0.2792861, -1.679542, 1, 0, 0, 1, 1,
-0.8862157, 1.165007, -1.12429, 1, 0, 0, 1, 1,
-0.8861561, -0.2776801, -1.979339, 1, 0, 0, 1, 1,
-0.8860437, 0.4344526, -1.095853, 1, 0, 0, 1, 1,
-0.8846834, -1.610519, -0.5836866, 1, 0, 0, 1, 1,
-0.8841501, -0.7258889, -3.5509, 0, 0, 0, 1, 1,
-0.8754229, -0.06487314, -0.9774073, 0, 0, 0, 1, 1,
-0.8684179, 1.214775, -0.01893448, 0, 0, 0, 1, 1,
-0.867326, -0.7901029, -1.321682, 0, 0, 0, 1, 1,
-0.8642516, -1.428011, -2.065114, 0, 0, 0, 1, 1,
-0.8572495, -0.09869026, -1.528736, 0, 0, 0, 1, 1,
-0.8556334, -0.524519, -1.033334, 0, 0, 0, 1, 1,
-0.851528, -1.583222, -2.022876, 1, 1, 1, 1, 1,
-0.8514076, -0.1000804, -0.5690458, 1, 1, 1, 1, 1,
-0.8510824, 0.7956221, -1.293244, 1, 1, 1, 1, 1,
-0.8453649, 1.776903, -1.030491, 1, 1, 1, 1, 1,
-0.8414049, 1.348654, -1.843765, 1, 1, 1, 1, 1,
-0.8379208, -0.5824042, -0.962093, 1, 1, 1, 1, 1,
-0.8344908, 1.845385, -0.2828736, 1, 1, 1, 1, 1,
-0.8225847, 0.1742072, -0.6696928, 1, 1, 1, 1, 1,
-0.8174044, 0.01234855, -0.9445792, 1, 1, 1, 1, 1,
-0.8158024, 1.168515, -1.771888, 1, 1, 1, 1, 1,
-0.8135972, 1.273225, -0.9074726, 1, 1, 1, 1, 1,
-0.806102, 0.6877168, 1.725845, 1, 1, 1, 1, 1,
-0.8050932, -0.05996477, -2.596453, 1, 1, 1, 1, 1,
-0.802179, 1.507402, -0.4693509, 1, 1, 1, 1, 1,
-0.7988573, 0.7930459, 0.1795667, 1, 1, 1, 1, 1,
-0.7985052, 0.4977923, -1.4364, 0, 0, 1, 1, 1,
-0.7971789, -0.2066039, -1.42171, 1, 0, 0, 1, 1,
-0.7934715, -0.654991, -2.76361, 1, 0, 0, 1, 1,
-0.7933038, -1.122704, -3.906226, 1, 0, 0, 1, 1,
-0.7862711, 0.5801862, -0.8107156, 1, 0, 0, 1, 1,
-0.7837867, -1.293708, -3.590083, 1, 0, 0, 1, 1,
-0.7800159, 0.1699391, -0.04297868, 0, 0, 0, 1, 1,
-0.7711056, -0.260943, -0.7989236, 0, 0, 0, 1, 1,
-0.7697525, 0.8066743, -1.360081, 0, 0, 0, 1, 1,
-0.7694282, 0.1789081, -3.003835, 0, 0, 0, 1, 1,
-0.7685022, 0.817571, 0.7747349, 0, 0, 0, 1, 1,
-0.7673544, 0.04022221, -0.9284974, 0, 0, 0, 1, 1,
-0.7659928, 0.2994964, -0.1049605, 0, 0, 0, 1, 1,
-0.7652422, -1.326393, -2.029702, 1, 1, 1, 1, 1,
-0.7593336, 1.27965, -0.495446, 1, 1, 1, 1, 1,
-0.7577454, 0.6029636, -0.02883242, 1, 1, 1, 1, 1,
-0.7544068, -1.067741, -2.751606, 1, 1, 1, 1, 1,
-0.7493711, 0.1840299, -1.953227, 1, 1, 1, 1, 1,
-0.7473242, 1.232712, 1.099361, 1, 1, 1, 1, 1,
-0.7430575, 0.8040965, -1.3987, 1, 1, 1, 1, 1,
-0.7385883, -0.2298605, -2.031197, 1, 1, 1, 1, 1,
-0.7373835, 1.324223, -0.02458838, 1, 1, 1, 1, 1,
-0.727706, 0.9935624, -1.525845, 1, 1, 1, 1, 1,
-0.7271026, 1.710605, 0.5085313, 1, 1, 1, 1, 1,
-0.7234385, -0.4232262, -2.75232, 1, 1, 1, 1, 1,
-0.722546, 0.5457231, -1.298832, 1, 1, 1, 1, 1,
-0.7171431, 0.4700943, -0.3558003, 1, 1, 1, 1, 1,
-0.7091237, 3.021566, -1.131176, 1, 1, 1, 1, 1,
-0.6977529, 0.0149517, 0.6534948, 0, 0, 1, 1, 1,
-0.6927629, -1.050086, -3.164377, 1, 0, 0, 1, 1,
-0.6804848, -0.1308107, -1.163405, 1, 0, 0, 1, 1,
-0.6790572, -1.653801, -2.510846, 1, 0, 0, 1, 1,
-0.6774217, -0.3801882, -1.33981, 1, 0, 0, 1, 1,
-0.6752183, -0.6803319, -1.918267, 1, 0, 0, 1, 1,
-0.6722857, -0.2247183, -3.106485, 0, 0, 0, 1, 1,
-0.6616211, -0.6598595, -2.853918, 0, 0, 0, 1, 1,
-0.6611797, -1.53205, -1.839703, 0, 0, 0, 1, 1,
-0.6539219, -1.464587, -3.468898, 0, 0, 0, 1, 1,
-0.6515812, 0.1114501, -1.789025, 0, 0, 0, 1, 1,
-0.6511187, -0.8933899, -2.038862, 0, 0, 0, 1, 1,
-0.6506094, -0.3538539, -2.25344, 0, 0, 0, 1, 1,
-0.6488666, 0.8741174, 0.176092, 1, 1, 1, 1, 1,
-0.6469083, -0.4089174, -2.194202, 1, 1, 1, 1, 1,
-0.6441253, 0.9463791, 0.3156756, 1, 1, 1, 1, 1,
-0.6357648, 0.4164724, -1.857991, 1, 1, 1, 1, 1,
-0.6354523, 0.7003951, -0.3365732, 1, 1, 1, 1, 1,
-0.6311541, 0.9206678, -0.8271358, 1, 1, 1, 1, 1,
-0.6295343, -1.88776, -2.759339, 1, 1, 1, 1, 1,
-0.6288528, 0.1468728, -2.82664, 1, 1, 1, 1, 1,
-0.6235676, 0.887585, 0.5117935, 1, 1, 1, 1, 1,
-0.6205068, 0.4572696, -1.717204, 1, 1, 1, 1, 1,
-0.62018, -1.150056, -1.154587, 1, 1, 1, 1, 1,
-0.6195222, -0.1538125, -0.3442351, 1, 1, 1, 1, 1,
-0.6175957, 0.8022434, 0.7833925, 1, 1, 1, 1, 1,
-0.6153147, -0.6409447, -1.301797, 1, 1, 1, 1, 1,
-0.6124066, 1.252498, 0.2023543, 1, 1, 1, 1, 1,
-0.6106302, -0.7914521, -4.352465, 0, 0, 1, 1, 1,
-0.6092011, -0.889432, -2.289738, 1, 0, 0, 1, 1,
-0.6062368, -0.6218233, -3.922658, 1, 0, 0, 1, 1,
-0.603686, -1.04797, -1.702182, 1, 0, 0, 1, 1,
-0.6014625, 0.4608706, 0.2786418, 1, 0, 0, 1, 1,
-0.5974059, -0.6027609, -3.552601, 1, 0, 0, 1, 1,
-0.5906829, 0.04738819, -1.576372, 0, 0, 0, 1, 1,
-0.5806384, -0.8203785, -2.619939, 0, 0, 0, 1, 1,
-0.5794742, 0.8718786, -0.9698737, 0, 0, 0, 1, 1,
-0.5785578, 0.02388986, -1.299476, 0, 0, 0, 1, 1,
-0.5767094, -1.11083, -3.344084, 0, 0, 0, 1, 1,
-0.5766475, -1.699977, -3.172872, 0, 0, 0, 1, 1,
-0.5742907, -2.394777, -1.781117, 0, 0, 0, 1, 1,
-0.5621446, 1.34406, -1.307858, 1, 1, 1, 1, 1,
-0.5575585, -0.9872019, -3.777643, 1, 1, 1, 1, 1,
-0.5575197, -0.1951031, -0.4827776, 1, 1, 1, 1, 1,
-0.5566996, -0.9049662, -1.770842, 1, 1, 1, 1, 1,
-0.5564747, -0.7795448, -1.802857, 1, 1, 1, 1, 1,
-0.5538998, 2.480611, 0.4362612, 1, 1, 1, 1, 1,
-0.5457927, -0.3346539, -2.432725, 1, 1, 1, 1, 1,
-0.5393996, -0.3881043, -1.721233, 1, 1, 1, 1, 1,
-0.5386147, 1.298076, 1.058852, 1, 1, 1, 1, 1,
-0.5380382, 0.2229941, -2.333495, 1, 1, 1, 1, 1,
-0.5378866, 1.702594, 0.007173738, 1, 1, 1, 1, 1,
-0.5368876, -0.7594743, -0.8539053, 1, 1, 1, 1, 1,
-0.5325627, 0.120901, -2.077288, 1, 1, 1, 1, 1,
-0.5320868, 2.371516, 0.9078227, 1, 1, 1, 1, 1,
-0.5277938, -0.06741743, -1.0434, 1, 1, 1, 1, 1,
-0.5214623, -0.3517722, -2.421758, 0, 0, 1, 1, 1,
-0.5204, 1.233313, -0.4434277, 1, 0, 0, 1, 1,
-0.5193733, 1.110123, 0.7879373, 1, 0, 0, 1, 1,
-0.5186331, -0.6939117, -1.924906, 1, 0, 0, 1, 1,
-0.51526, 1.382914, 0.2268237, 1, 0, 0, 1, 1,
-0.5125571, -1.642107, -2.973704, 1, 0, 0, 1, 1,
-0.5079616, -0.3654619, -0.8093098, 0, 0, 0, 1, 1,
-0.4980575, 0.467762, -0.3978016, 0, 0, 0, 1, 1,
-0.4902857, 0.9805281, 0.2100877, 0, 0, 0, 1, 1,
-0.486803, -0.04327134, -0.5562349, 0, 0, 0, 1, 1,
-0.4860932, -0.9053789, -1.952665, 0, 0, 0, 1, 1,
-0.4813377, 1.128385, -0.4631186, 0, 0, 0, 1, 1,
-0.4796286, -0.3526219, -3.554548, 0, 0, 0, 1, 1,
-0.475649, -0.8742609, -1.394199, 1, 1, 1, 1, 1,
-0.4715475, -1.00876, -3.149809, 1, 1, 1, 1, 1,
-0.4693682, -0.7581595, -2.077832, 1, 1, 1, 1, 1,
-0.4637589, -0.1959961, -3.751459, 1, 1, 1, 1, 1,
-0.4630249, -0.9727375, -2.632963, 1, 1, 1, 1, 1,
-0.4582211, -0.5713862, -3.67214, 1, 1, 1, 1, 1,
-0.4500426, 0.9410893, -0.6040612, 1, 1, 1, 1, 1,
-0.4467362, -1.167218, -2.942419, 1, 1, 1, 1, 1,
-0.4465553, -0.2281338, -1.62431, 1, 1, 1, 1, 1,
-0.44456, 1.754829, -0.4331404, 1, 1, 1, 1, 1,
-0.4423495, -1.011969, -3.035567, 1, 1, 1, 1, 1,
-0.4393286, -1.630349, -3.952918, 1, 1, 1, 1, 1,
-0.4350563, -0.8142266, -5.421548, 1, 1, 1, 1, 1,
-0.434865, 1.499776, -0.5160334, 1, 1, 1, 1, 1,
-0.4341638, 0.8977295, -2.079221, 1, 1, 1, 1, 1,
-0.4317856, -1.03371, -4.615349, 0, 0, 1, 1, 1,
-0.4316037, 2.717835, -0.968289, 1, 0, 0, 1, 1,
-0.4315035, 0.2394114, -0.3515697, 1, 0, 0, 1, 1,
-0.4259039, -0.4175863, -2.729672, 1, 0, 0, 1, 1,
-0.4242424, -0.9628143, -1.589408, 1, 0, 0, 1, 1,
-0.4238134, -0.7930624, -3.491619, 1, 0, 0, 1, 1,
-0.4197048, -0.8394278, -3.718007, 0, 0, 0, 1, 1,
-0.4174121, 0.6285257, 0.2766495, 0, 0, 0, 1, 1,
-0.4173019, -1.178599, -3.055568, 0, 0, 0, 1, 1,
-0.4161864, 0.5244185, -0.5195901, 0, 0, 0, 1, 1,
-0.4157586, -0.9780096, -2.465789, 0, 0, 0, 1, 1,
-0.4148495, -0.6839962, -1.85945, 0, 0, 0, 1, 1,
-0.4140679, 1.495557, -1.085904, 0, 0, 0, 1, 1,
-0.4138898, 1.32148, -1.322266, 1, 1, 1, 1, 1,
-0.408783, -1.462764, -2.034766, 1, 1, 1, 1, 1,
-0.4070071, 1.07507, -1.076668, 1, 1, 1, 1, 1,
-0.4002931, -0.8933231, -4.507317, 1, 1, 1, 1, 1,
-0.3973424, 1.488067, 0.5590621, 1, 1, 1, 1, 1,
-0.3955311, -2.277589, -3.478782, 1, 1, 1, 1, 1,
-0.3954242, 0.274933, -0.2306098, 1, 1, 1, 1, 1,
-0.3901471, 0.4811497, -0.4545067, 1, 1, 1, 1, 1,
-0.3897258, -0.986006, -3.392814, 1, 1, 1, 1, 1,
-0.3812285, 0.1300421, -0.5102507, 1, 1, 1, 1, 1,
-0.3795943, -0.3324004, -5.461386, 1, 1, 1, 1, 1,
-0.3787623, -2.016862, -0.7777359, 1, 1, 1, 1, 1,
-0.3737627, -1.268608, -2.417629, 1, 1, 1, 1, 1,
-0.3714643, -0.173112, -1.367015, 1, 1, 1, 1, 1,
-0.3706624, -1.006397, -2.85975, 1, 1, 1, 1, 1,
-0.3659796, -0.3619689, -3.395386, 0, 0, 1, 1, 1,
-0.365412, 0.4259156, -1.213129, 1, 0, 0, 1, 1,
-0.3594442, 0.09542019, -0.5851138, 1, 0, 0, 1, 1,
-0.3560715, 0.4556668, -1.577885, 1, 0, 0, 1, 1,
-0.3558222, 0.4123293, -0.1613004, 1, 0, 0, 1, 1,
-0.3538758, 0.4776865, -0.1647464, 1, 0, 0, 1, 1,
-0.3499194, 0.2487462, -1.694102, 0, 0, 0, 1, 1,
-0.3484955, 0.732453, -2.258385, 0, 0, 0, 1, 1,
-0.344821, 1.551114, 0.8456103, 0, 0, 0, 1, 1,
-0.343903, -0.3279417, -2.069191, 0, 0, 0, 1, 1,
-0.3430121, -1.047698, -3.398887, 0, 0, 0, 1, 1,
-0.3391481, 1.401812, -0.2056653, 0, 0, 0, 1, 1,
-0.3291587, 0.9455189, -0.8605999, 0, 0, 0, 1, 1,
-0.3264645, 0.04320916, -0.3186384, 1, 1, 1, 1, 1,
-0.3251996, 2.369043, 0.1608038, 1, 1, 1, 1, 1,
-0.3213384, 1.549847, -2.005615, 1, 1, 1, 1, 1,
-0.3194053, 0.449105, 0.6096202, 1, 1, 1, 1, 1,
-0.317871, -1.356122, -4.480065, 1, 1, 1, 1, 1,
-0.3171086, -1.323601, -3.34832, 1, 1, 1, 1, 1,
-0.3149251, 1.987549, 0.1494693, 1, 1, 1, 1, 1,
-0.3110641, 0.6080435, 1.059133, 1, 1, 1, 1, 1,
-0.3036934, 1.338385, -0.05974822, 1, 1, 1, 1, 1,
-0.2995986, 1.149291, -0.3567432, 1, 1, 1, 1, 1,
-0.2983996, -0.1576551, -2.264351, 1, 1, 1, 1, 1,
-0.2977814, -0.09902303, -2.63954, 1, 1, 1, 1, 1,
-0.2967975, 0.812315, -1.352138, 1, 1, 1, 1, 1,
-0.2940507, 0.347858, -0.7723165, 1, 1, 1, 1, 1,
-0.2849454, -0.580534, -1.690574, 1, 1, 1, 1, 1,
-0.2808783, -0.2345129, -4.165221, 0, 0, 1, 1, 1,
-0.2806391, -0.7201469, -2.915299, 1, 0, 0, 1, 1,
-0.2765367, 0.2020185, -1.867269, 1, 0, 0, 1, 1,
-0.2752337, 0.2720857, -0.04347714, 1, 0, 0, 1, 1,
-0.2743773, -1.099874, -1.082605, 1, 0, 0, 1, 1,
-0.271016, -0.05623914, -1.005515, 1, 0, 0, 1, 1,
-0.2676435, 0.9033452, 2.291445, 0, 0, 0, 1, 1,
-0.2673213, -1.218947, -1.983203, 0, 0, 0, 1, 1,
-0.2666062, 2.298683, 2.393981, 0, 0, 0, 1, 1,
-0.2663548, -0.4195316, -3.663122, 0, 0, 0, 1, 1,
-0.2607828, 1.07188, -1.695991, 0, 0, 0, 1, 1,
-0.259421, 0.4681539, -1.823332, 0, 0, 0, 1, 1,
-0.2538204, -0.7988762, -2.130563, 0, 0, 0, 1, 1,
-0.2460741, 1.231379, 0.9380916, 1, 1, 1, 1, 1,
-0.2451594, -0.7194827, -1.62638, 1, 1, 1, 1, 1,
-0.2433954, 1.078409, -1.00947, 1, 1, 1, 1, 1,
-0.2431238, 1.143416, 0.1107903, 1, 1, 1, 1, 1,
-0.2418051, -0.6244813, -3.212777, 1, 1, 1, 1, 1,
-0.2407693, -0.8695981, -1.911977, 1, 1, 1, 1, 1,
-0.2393815, -1.030863, -1.872986, 1, 1, 1, 1, 1,
-0.234633, -0.02806499, -1.390321, 1, 1, 1, 1, 1,
-0.2344632, -0.9788685, -2.376517, 1, 1, 1, 1, 1,
-0.2327719, -0.8284084, -3.773736, 1, 1, 1, 1, 1,
-0.2303941, -0.7066166, -2.213749, 1, 1, 1, 1, 1,
-0.2294631, -2.087712, -2.270321, 1, 1, 1, 1, 1,
-0.2271093, -0.4893609, -1.695454, 1, 1, 1, 1, 1,
-0.2254229, 0.3238937, -0.4168421, 1, 1, 1, 1, 1,
-0.2247957, 1.140689, -2.129427, 1, 1, 1, 1, 1,
-0.2245058, -1.570847, -2.663591, 0, 0, 1, 1, 1,
-0.2233358, 0.7322385, -1.542303, 1, 0, 0, 1, 1,
-0.2228565, -0.4887401, -1.875243, 1, 0, 0, 1, 1,
-0.2216309, -1.155831, -3.044491, 1, 0, 0, 1, 1,
-0.2187556, 2.467659, 1.253332, 1, 0, 0, 1, 1,
-0.2161008, 0.8931437, 0.7231463, 1, 0, 0, 1, 1,
-0.2096172, 0.2441051, 0.3426252, 0, 0, 0, 1, 1,
-0.2030208, 0.4584742, -0.6296834, 0, 0, 0, 1, 1,
-0.2007141, 0.3634068, -2.154505, 0, 0, 0, 1, 1,
-0.1974284, -0.7787272, -2.569354, 0, 0, 0, 1, 1,
-0.195524, -0.7215573, -1.990218, 0, 0, 0, 1, 1,
-0.1948744, 0.6393503, -1.057927, 0, 0, 0, 1, 1,
-0.1916886, -0.03259339, -1.741327, 0, 0, 0, 1, 1,
-0.1889427, 1.875067, -1.70933, 1, 1, 1, 1, 1,
-0.1869635, -0.6417408, -2.961846, 1, 1, 1, 1, 1,
-0.1801047, -0.3453214, -2.56832, 1, 1, 1, 1, 1,
-0.1744766, 0.3409334, -0.2769043, 1, 1, 1, 1, 1,
-0.172796, -0.05288665, -1.696015, 1, 1, 1, 1, 1,
-0.1721703, 0.6951609, 1.146691, 1, 1, 1, 1, 1,
-0.171224, 0.6708624, 0.05713012, 1, 1, 1, 1, 1,
-0.1680656, 2.852403, 0.1299213, 1, 1, 1, 1, 1,
-0.1680069, 1.333412, -0.3140347, 1, 1, 1, 1, 1,
-0.166208, -0.2943321, -3.863093, 1, 1, 1, 1, 1,
-0.1655129, 0.9534774, -1.371918, 1, 1, 1, 1, 1,
-0.1611635, 1.21574, -0.9318546, 1, 1, 1, 1, 1,
-0.1545971, -0.8063441, -4.065053, 1, 1, 1, 1, 1,
-0.1538591, -1.260741, -3.432873, 1, 1, 1, 1, 1,
-0.1501207, -0.2956149, -3.642318, 1, 1, 1, 1, 1,
-0.1494536, -0.7951717, -3.630855, 0, 0, 1, 1, 1,
-0.1459287, -0.4492833, -3.81008, 1, 0, 0, 1, 1,
-0.1452107, 0.7490644, 0.3561352, 1, 0, 0, 1, 1,
-0.1326401, -1.17112, -3.127119, 1, 0, 0, 1, 1,
-0.1287483, -0.4145258, -1.426617, 1, 0, 0, 1, 1,
-0.12799, -0.03333327, -1.853229, 1, 0, 0, 1, 1,
-0.1279185, 1.350146, 0.8580439, 0, 0, 0, 1, 1,
-0.124668, 0.2301931, -0.224777, 0, 0, 0, 1, 1,
-0.1241197, 1.400088, 0.8699862, 0, 0, 0, 1, 1,
-0.1151336, -1.102375, -4.353992, 0, 0, 0, 1, 1,
-0.1119761, 0.124653, -2.025445, 0, 0, 0, 1, 1,
-0.1099137, -1.438445, -2.722982, 0, 0, 0, 1, 1,
-0.109731, 1.198201, -0.07821549, 0, 0, 0, 1, 1,
-0.1063107, 0.7669584, -0.4599598, 1, 1, 1, 1, 1,
-0.1049628, -0.7837451, -4.152352, 1, 1, 1, 1, 1,
-0.1015556, 1.058759, 0.5974143, 1, 1, 1, 1, 1,
-0.1009527, -1.370022, -2.64224, 1, 1, 1, 1, 1,
-0.09694369, -1.212134, -3.811252, 1, 1, 1, 1, 1,
-0.09641045, -1.344947, -3.289956, 1, 1, 1, 1, 1,
-0.09574009, -0.9292498, -1.794382, 1, 1, 1, 1, 1,
-0.09388212, -1.614887, -2.156771, 1, 1, 1, 1, 1,
-0.09197731, 0.2031913, -1.000592, 1, 1, 1, 1, 1,
-0.0886491, 0.5225398, 0.1029802, 1, 1, 1, 1, 1,
-0.08533352, 0.940667, -1.772865, 1, 1, 1, 1, 1,
-0.08408471, -0.9549482, -2.570641, 1, 1, 1, 1, 1,
-0.08283398, 0.6143034, 3.237643, 1, 1, 1, 1, 1,
-0.08222235, 0.678147, -0.1953689, 1, 1, 1, 1, 1,
-0.08181772, 0.5277665, -0.07264037, 1, 1, 1, 1, 1,
-0.08117944, 0.1842183, -1.02398, 0, 0, 1, 1, 1,
-0.07963912, 0.2724738, 0.561749, 1, 0, 0, 1, 1,
-0.07821839, 0.1743654, -2.119009, 1, 0, 0, 1, 1,
-0.07723349, 0.07047739, -1.989442, 1, 0, 0, 1, 1,
-0.07390922, -0.6798459, -3.912876, 1, 0, 0, 1, 1,
-0.0697877, 1.861871, 0.1624549, 1, 0, 0, 1, 1,
-0.06918021, 1.692839, -0.2180134, 0, 0, 0, 1, 1,
-0.06501213, 0.9370757, 0.09436154, 0, 0, 0, 1, 1,
-0.06375568, 0.9600736, -1.877732, 0, 0, 0, 1, 1,
-0.06332523, 0.7967206, 3.019254, 0, 0, 0, 1, 1,
-0.06290601, -0.06226945, -2.462225, 0, 0, 0, 1, 1,
-0.06228869, -2.011909, -2.855432, 0, 0, 0, 1, 1,
-0.06158453, 1.037431, 0.4253945, 0, 0, 0, 1, 1,
-0.06071393, 0.9790213, -1.422636, 1, 1, 1, 1, 1,
-0.06031038, -0.184508, -2.513303, 1, 1, 1, 1, 1,
-0.05365108, 2.115504, -0.4586758, 1, 1, 1, 1, 1,
-0.05041099, 0.1454725, 0.02126167, 1, 1, 1, 1, 1,
-0.04973439, -0.7916107, -3.341721, 1, 1, 1, 1, 1,
-0.0459154, 0.2224781, 0.387226, 1, 1, 1, 1, 1,
-0.04501994, -1.819677, -4.452146, 1, 1, 1, 1, 1,
-0.04342949, -1.301958, -1.929163, 1, 1, 1, 1, 1,
-0.04208384, 0.03756395, 0.1366422, 1, 1, 1, 1, 1,
-0.03802076, 0.2377077, -0.02216142, 1, 1, 1, 1, 1,
-0.03465208, 0.3681943, -0.4389568, 1, 1, 1, 1, 1,
-0.02892458, -0.4195776, -3.397464, 1, 1, 1, 1, 1,
-0.02694064, -1.15948, -2.9369, 1, 1, 1, 1, 1,
-0.02625026, -1.772179, -2.215602, 1, 1, 1, 1, 1,
-0.02439046, -0.6844239, -5.214259, 1, 1, 1, 1, 1,
-0.02221436, 0.2324154, -0.0007121709, 0, 0, 1, 1, 1,
-0.0210584, -1.15245, -3.578496, 1, 0, 0, 1, 1,
-0.02057777, -0.01968373, -2.376619, 1, 0, 0, 1, 1,
-0.01988188, 2.09795, -0.7564241, 1, 0, 0, 1, 1,
-0.01900833, -1.506747, -3.560811, 1, 0, 0, 1, 1,
-0.0148215, -0.06740964, -2.362724, 1, 0, 0, 1, 1,
-0.01172136, -0.7746303, -3.803487, 0, 0, 0, 1, 1,
-0.01066406, 1.571549, -0.9464732, 0, 0, 0, 1, 1,
-0.006768194, 0.2499495, -1.075649, 0, 0, 0, 1, 1,
-0.006490928, 1.873599, -0.504219, 0, 0, 0, 1, 1,
0.0008285906, -0.5734243, 2.922087, 0, 0, 0, 1, 1,
0.001179634, -0.5946379, 5.226792, 0, 0, 0, 1, 1,
0.001311809, -0.4022175, 3.974342, 0, 0, 0, 1, 1,
0.004475891, -0.6957214, 3.844543, 1, 1, 1, 1, 1,
0.008507808, 0.3814495, -0.1048453, 1, 1, 1, 1, 1,
0.008754124, 0.2259289, 0.4244287, 1, 1, 1, 1, 1,
0.01367364, -1.280128, 3.709255, 1, 1, 1, 1, 1,
0.01576398, 0.18453, -0.8888383, 1, 1, 1, 1, 1,
0.01717283, -1.262638, 5.122825, 1, 1, 1, 1, 1,
0.02019164, -1.513088, 3.018739, 1, 1, 1, 1, 1,
0.02100844, 0.2252613, 0.4652652, 1, 1, 1, 1, 1,
0.02227626, 0.05207589, 1.986354, 1, 1, 1, 1, 1,
0.02448609, 0.9496452, 0.6167784, 1, 1, 1, 1, 1,
0.02528023, -0.9219663, 3.614943, 1, 1, 1, 1, 1,
0.03091263, -0.2663438, 4.880223, 1, 1, 1, 1, 1,
0.03116144, -1.501559, 2.704257, 1, 1, 1, 1, 1,
0.03145016, -0.5555617, 3.184438, 1, 1, 1, 1, 1,
0.03171156, -0.8129694, 4.176845, 1, 1, 1, 1, 1,
0.03339843, -0.4877566, 2.828293, 0, 0, 1, 1, 1,
0.03553379, 0.2122033, -0.4846908, 1, 0, 0, 1, 1,
0.04051509, -0.4668895, 2.972026, 1, 0, 0, 1, 1,
0.04276745, -1.269002, 4.904245, 1, 0, 0, 1, 1,
0.04490637, -0.4484322, 1.429028, 1, 0, 0, 1, 1,
0.0464146, 0.2444585, 0.7168881, 1, 0, 0, 1, 1,
0.05040983, -1.583511, 2.704214, 0, 0, 0, 1, 1,
0.05157397, -0.0836481, 2.344325, 0, 0, 0, 1, 1,
0.06280525, -0.3022129, 3.064232, 0, 0, 0, 1, 1,
0.06474057, -1.770873, 4.122107, 0, 0, 0, 1, 1,
0.06481563, 0.3327632, 0.4031979, 0, 0, 0, 1, 1,
0.06514563, -1.261533, 3.971713, 0, 0, 0, 1, 1,
0.06639591, 2.67121, -0.44764, 0, 0, 0, 1, 1,
0.0678934, -0.7391356, 3.680117, 1, 1, 1, 1, 1,
0.07015499, -1.272574, 0.9139817, 1, 1, 1, 1, 1,
0.07019451, 0.6007228, 0.5770164, 1, 1, 1, 1, 1,
0.07366855, -0.3504749, 4.911469, 1, 1, 1, 1, 1,
0.07401314, -0.5168528, 4.661899, 1, 1, 1, 1, 1,
0.07764842, 2.407715, -1.380614, 1, 1, 1, 1, 1,
0.07910541, 1.154664, -1.018738, 1, 1, 1, 1, 1,
0.08528787, 1.149942, -0.02282915, 1, 1, 1, 1, 1,
0.08710705, 0.8829858, 0.1785696, 1, 1, 1, 1, 1,
0.08917429, 1.501648, 0.3283442, 1, 1, 1, 1, 1,
0.09012114, 0.1787415, 0.5414706, 1, 1, 1, 1, 1,
0.09363668, 1.100412, -1.588238, 1, 1, 1, 1, 1,
0.09635184, 0.7837554, -1.64794, 1, 1, 1, 1, 1,
0.09643402, 0.4147889, 0.4789337, 1, 1, 1, 1, 1,
0.09765758, -1.290643, 3.908081, 1, 1, 1, 1, 1,
0.1008601, 0.2714898, 1.011014, 0, 0, 1, 1, 1,
0.1022928, -1.327693, 2.065716, 1, 0, 0, 1, 1,
0.1039275, 1.356228, 0.9964594, 1, 0, 0, 1, 1,
0.1056625, 0.09448715, 0.9569345, 1, 0, 0, 1, 1,
0.1148861, -0.9455383, 4.538146, 1, 0, 0, 1, 1,
0.1156391, -1.090889, 4.445123, 1, 0, 0, 1, 1,
0.1189679, 0.6391515, -0.05057973, 0, 0, 0, 1, 1,
0.126181, 0.7877542, -0.7299492, 0, 0, 0, 1, 1,
0.1299879, 0.6167806, 0.4243636, 0, 0, 0, 1, 1,
0.1302654, 0.1009574, 0.2543955, 0, 0, 0, 1, 1,
0.1343817, -2.243281, 3.806528, 0, 0, 0, 1, 1,
0.136063, 0.6057522, 0.2328049, 0, 0, 0, 1, 1,
0.1483873, 0.2243687, 1.895505, 0, 0, 0, 1, 1,
0.1496067, -0.2719415, 3.328934, 1, 1, 1, 1, 1,
0.1538815, -1.381916, 3.760652, 1, 1, 1, 1, 1,
0.1547067, -1.481639, 2.508822, 1, 1, 1, 1, 1,
0.158023, -1.089331, 3.98547, 1, 1, 1, 1, 1,
0.1678406, -0.03028448, 2.197207, 1, 1, 1, 1, 1,
0.1731618, -2.065846, 2.049854, 1, 1, 1, 1, 1,
0.1759703, 0.549569, 0.2386255, 1, 1, 1, 1, 1,
0.1766716, -1.011582, 2.507376, 1, 1, 1, 1, 1,
0.1768564, -0.5721222, 2.736632, 1, 1, 1, 1, 1,
0.1833896, -1.169266, 2.098091, 1, 1, 1, 1, 1,
0.1885947, 0.3901632, 0.1994746, 1, 1, 1, 1, 1,
0.1926389, -0.5261387, 0.8771663, 1, 1, 1, 1, 1,
0.1941555, 1.80378, -0.6059197, 1, 1, 1, 1, 1,
0.1947944, -0.07666126, 2.205707, 1, 1, 1, 1, 1,
0.1951202, -0.9594572, 3.181515, 1, 1, 1, 1, 1,
0.1984421, 0.04433607, 0.9566309, 0, 0, 1, 1, 1,
0.2014225, -1.525538, 1.854636, 1, 0, 0, 1, 1,
0.2041522, 0.3133127, -0.3657825, 1, 0, 0, 1, 1,
0.2109806, 2.567045, -1.209884, 1, 0, 0, 1, 1,
0.2171409, 0.3035481, 0.7335086, 1, 0, 0, 1, 1,
0.2176502, 0.221832, 0.1440945, 1, 0, 0, 1, 1,
0.2176705, 0.05295938, 2.286078, 0, 0, 0, 1, 1,
0.2207339, 0.4001948, 1.19859, 0, 0, 0, 1, 1,
0.2275209, -1.946716, 4.515472, 0, 0, 0, 1, 1,
0.2306414, -1.090872, 2.775508, 0, 0, 0, 1, 1,
0.2326601, 0.3838577, 0.6857606, 0, 0, 0, 1, 1,
0.2356222, -0.1715902, 3.024859, 0, 0, 0, 1, 1,
0.238777, -0.5851606, 4.210873, 0, 0, 0, 1, 1,
0.2416914, 1.328565, 0.5725334, 1, 1, 1, 1, 1,
0.2454297, 1.202892, 0.8771097, 1, 1, 1, 1, 1,
0.2457513, 1.470976, 0.1343524, 1, 1, 1, 1, 1,
0.2474824, -0.8840466, 3.848857, 1, 1, 1, 1, 1,
0.2503698, 1.636627, 1.521258, 1, 1, 1, 1, 1,
0.2512699, 0.9778191, -0.2107136, 1, 1, 1, 1, 1,
0.2516757, -0.161326, 0.7370655, 1, 1, 1, 1, 1,
0.255664, -0.6472568, 5.163841, 1, 1, 1, 1, 1,
0.2557208, -0.1051769, 2.629036, 1, 1, 1, 1, 1,
0.257512, 1.244719, 1.000448, 1, 1, 1, 1, 1,
0.2635264, -0.4378321, 2.954905, 1, 1, 1, 1, 1,
0.2649431, 0.2176123, 1.1065, 1, 1, 1, 1, 1,
0.2655466, 0.4670781, 0.1245059, 1, 1, 1, 1, 1,
0.2673871, 0.7909386, -0.4959844, 1, 1, 1, 1, 1,
0.2693298, -0.2388447, 1.521716, 1, 1, 1, 1, 1,
0.2704436, -0.2176525, 2.016667, 0, 0, 1, 1, 1,
0.2737605, -0.441592, 2.513406, 1, 0, 0, 1, 1,
0.2737994, 0.9639165, -0.9406858, 1, 0, 0, 1, 1,
0.2750422, 0.660511, -0.3019404, 1, 0, 0, 1, 1,
0.2760418, -0.9883165, 3.348318, 1, 0, 0, 1, 1,
0.2787616, 0.8042479, -0.08934553, 1, 0, 0, 1, 1,
0.2807916, 1.855402, -0.4040245, 0, 0, 0, 1, 1,
0.2828909, -1.119412, 3.220051, 0, 0, 0, 1, 1,
0.2838479, -1.22148, 1.413342, 0, 0, 0, 1, 1,
0.2839038, 0.1678128, 2.041953, 0, 0, 0, 1, 1,
0.2844422, 1.352788, -0.05346354, 0, 0, 0, 1, 1,
0.2850273, -0.004336122, 1.131125, 0, 0, 0, 1, 1,
0.2890784, -1.127253, 2.893533, 0, 0, 0, 1, 1,
0.2920429, 1.631611, -1.984582, 1, 1, 1, 1, 1,
0.2935461, 1.00775, 1.803769, 1, 1, 1, 1, 1,
0.2993256, 1.175426, 2.003448, 1, 1, 1, 1, 1,
0.2996319, -0.2280971, 2.641981, 1, 1, 1, 1, 1,
0.3088285, 0.1363634, 1.671586, 1, 1, 1, 1, 1,
0.3117075, 0.8066213, -0.8533041, 1, 1, 1, 1, 1,
0.3176677, -0.3301648, 2.454575, 1, 1, 1, 1, 1,
0.3182804, -0.765322, 3.172092, 1, 1, 1, 1, 1,
0.3225094, 0.08269196, 1.892428, 1, 1, 1, 1, 1,
0.3285305, -0.2676176, 2.056065, 1, 1, 1, 1, 1,
0.3295165, -0.9843662, 3.3961, 1, 1, 1, 1, 1,
0.3318987, 0.4147449, 2.43134, 1, 1, 1, 1, 1,
0.3336631, -1.090843, 5.196171, 1, 1, 1, 1, 1,
0.3349761, -0.00361978, 0.7599458, 1, 1, 1, 1, 1,
0.3363931, 0.2456076, 0.6293509, 1, 1, 1, 1, 1,
0.3364609, 0.6243303, 0.5372794, 0, 0, 1, 1, 1,
0.3366587, -1.403114, 2.284594, 1, 0, 0, 1, 1,
0.3395472, 1.119319, 0.8403676, 1, 0, 0, 1, 1,
0.3396896, -0.7503369, 3.092392, 1, 0, 0, 1, 1,
0.3436665, -0.05248831, 3.957796, 1, 0, 0, 1, 1,
0.3463922, 1.121079, -0.6181269, 1, 0, 0, 1, 1,
0.3481158, 1.372157, -0.7401432, 0, 0, 0, 1, 1,
0.3516693, 1.649902, -0.2686903, 0, 0, 0, 1, 1,
0.3535542, 0.8790659, 0.3982805, 0, 0, 0, 1, 1,
0.3564152, -0.5105437, 2.790405, 0, 0, 0, 1, 1,
0.3601983, -0.5764386, 2.796534, 0, 0, 0, 1, 1,
0.3674525, -0.512317, 3.51726, 0, 0, 0, 1, 1,
0.367677, -2.194423, 3.590529, 0, 0, 0, 1, 1,
0.3749335, -0.109599, 3.078084, 1, 1, 1, 1, 1,
0.3755368, 0.1318343, 1.040849, 1, 1, 1, 1, 1,
0.3854277, -0.2554289, 3.554957, 1, 1, 1, 1, 1,
0.3862289, 0.6235618, -0.5771893, 1, 1, 1, 1, 1,
0.3880284, -0.1259494, 3.90823, 1, 1, 1, 1, 1,
0.3886918, -0.9592377, 4.406928, 1, 1, 1, 1, 1,
0.3934327, -1.157236, 2.863159, 1, 1, 1, 1, 1,
0.3950975, 0.553467, 0.5999834, 1, 1, 1, 1, 1,
0.3977613, -0.8154871, 2.665276, 1, 1, 1, 1, 1,
0.4000464, -1.121338, 5.189821, 1, 1, 1, 1, 1,
0.4016951, 0.2079535, 0.5139521, 1, 1, 1, 1, 1,
0.4038013, -0.1105527, 0.8452277, 1, 1, 1, 1, 1,
0.4045036, 1.768775, 0.527368, 1, 1, 1, 1, 1,
0.4061821, -1.164524, 2.727125, 1, 1, 1, 1, 1,
0.4068277, 0.8512963, 1.296435, 1, 1, 1, 1, 1,
0.4074994, 4.497101, -0.974319, 0, 0, 1, 1, 1,
0.4112017, -0.01934472, -0.07442438, 1, 0, 0, 1, 1,
0.4112136, -0.2537124, 1.505106, 1, 0, 0, 1, 1,
0.4115356, 0.4342647, 0.0955634, 1, 0, 0, 1, 1,
0.4129746, 0.2501382, 1.437299, 1, 0, 0, 1, 1,
0.4131156, 0.0289661, 1.85731, 1, 0, 0, 1, 1,
0.413632, 0.07462405, 2.034878, 0, 0, 0, 1, 1,
0.4156478, 1.630737, -0.2313985, 0, 0, 0, 1, 1,
0.4161182, 0.07656997, 1.903188, 0, 0, 0, 1, 1,
0.4174327, 0.8526452, -0.04173102, 0, 0, 0, 1, 1,
0.4184507, -1.889522, 2.375906, 0, 0, 0, 1, 1,
0.4185318, -0.2036672, 3.216427, 0, 0, 0, 1, 1,
0.4204625, 0.5448314, -0.4820227, 0, 0, 0, 1, 1,
0.4205414, -0.9837175, 4.001006, 1, 1, 1, 1, 1,
0.4227623, 1.738655, 1.378481, 1, 1, 1, 1, 1,
0.4242142, -1.701792, 1.897233, 1, 1, 1, 1, 1,
0.4264465, 1.485578, -0.7454774, 1, 1, 1, 1, 1,
0.4307287, 0.7141662, 0.5583096, 1, 1, 1, 1, 1,
0.4342291, 1.772888, -0.2386617, 1, 1, 1, 1, 1,
0.4398291, -1.24008, 2.455391, 1, 1, 1, 1, 1,
0.441109, -2.089102, 2.734406, 1, 1, 1, 1, 1,
0.4443444, -2.233169, 1.963225, 1, 1, 1, 1, 1,
0.4461142, -0.6516548, 2.269312, 1, 1, 1, 1, 1,
0.4481874, 0.6191556, -1.226877, 1, 1, 1, 1, 1,
0.4524454, 0.6428338, 1.082679, 1, 1, 1, 1, 1,
0.4549889, 0.6502391, -0.8853726, 1, 1, 1, 1, 1,
0.4605706, 0.2602619, 1.345554, 1, 1, 1, 1, 1,
0.4624626, -1.222255, 1.93508, 1, 1, 1, 1, 1,
0.4652838, 1.854954, 0.4493935, 0, 0, 1, 1, 1,
0.4686336, -0.03791152, 1.609303, 1, 0, 0, 1, 1,
0.4707549, -0.3201084, 1.081523, 1, 0, 0, 1, 1,
0.4730898, -1.521951, 1.992059, 1, 0, 0, 1, 1,
0.474456, -1.483604, 2.462599, 1, 0, 0, 1, 1,
0.4771227, 1.365011, 1.121017, 1, 0, 0, 1, 1,
0.477198, -1.59072, 2.037327, 0, 0, 0, 1, 1,
0.478158, 1.641776, 2.578198, 0, 0, 0, 1, 1,
0.4898825, -0.828765, 3.688432, 0, 0, 0, 1, 1,
0.4910881, -1.305968, 4.121798, 0, 0, 0, 1, 1,
0.4963996, -0.7861744, 3.79911, 0, 0, 0, 1, 1,
0.4978249, 0.2458884, 2.879838, 0, 0, 0, 1, 1,
0.4991519, 0.3547128, 0.4061166, 0, 0, 0, 1, 1,
0.5004048, -1.640234, 2.005603, 1, 1, 1, 1, 1,
0.5054974, -0.5017848, 2.081114, 1, 1, 1, 1, 1,
0.5109548, -0.5627519, 2.251512, 1, 1, 1, 1, 1,
0.5169443, 0.9120026, 0.9974722, 1, 1, 1, 1, 1,
0.517166, -0.6536339, 3.129137, 1, 1, 1, 1, 1,
0.5216478, -1.433346, 3.411313, 1, 1, 1, 1, 1,
0.5252882, 0.3038637, 1.891384, 1, 1, 1, 1, 1,
0.5302377, 0.8081133, 0.6865816, 1, 1, 1, 1, 1,
0.5323842, 0.4936918, 2.512974, 1, 1, 1, 1, 1,
0.534104, -1.644858, 2.336801, 1, 1, 1, 1, 1,
0.5346298, 0.3288765, 0.7987683, 1, 1, 1, 1, 1,
0.5357821, 1.808221, -0.1942392, 1, 1, 1, 1, 1,
0.5364462, 0.7056218, 0.1225462, 1, 1, 1, 1, 1,
0.5412911, 1.384358, 0.1379997, 1, 1, 1, 1, 1,
0.5416709, 1.908628, -0.8577059, 1, 1, 1, 1, 1,
0.5480142, 0.526659, -0.120764, 0, 0, 1, 1, 1,
0.5481644, -0.8084061, 2.985231, 1, 0, 0, 1, 1,
0.5496992, 0.827084, 0.04211376, 1, 0, 0, 1, 1,
0.5509757, 0.07069644, 0.4481104, 1, 0, 0, 1, 1,
0.5516831, 1.493586, 0.03006094, 1, 0, 0, 1, 1,
0.5545126, 1.612443, -2.551735, 1, 0, 0, 1, 1,
0.5570028, -2.752072, 2.611573, 0, 0, 0, 1, 1,
0.5572858, -0.2366386, 4.293456, 0, 0, 0, 1, 1,
0.5578144, -0.08716106, 1.739836, 0, 0, 0, 1, 1,
0.5606104, 1.484502, 0.3037677, 0, 0, 0, 1, 1,
0.5655692, -0.02934188, 1.705476, 0, 0, 0, 1, 1,
0.5698794, -0.09906132, 1.69448, 0, 0, 0, 1, 1,
0.5749401, -1.480085, 3.77493, 0, 0, 0, 1, 1,
0.5793296, 1.332263, -0.4383808, 1, 1, 1, 1, 1,
0.5833644, -0.3671327, 3.146286, 1, 1, 1, 1, 1,
0.5860121, 1.245822, -1.379443, 1, 1, 1, 1, 1,
0.5894542, -0.5043122, 1.563736, 1, 1, 1, 1, 1,
0.5903757, -0.215957, 2.882118, 1, 1, 1, 1, 1,
0.5912446, 0.6993008, 3.15856, 1, 1, 1, 1, 1,
0.5930312, -0.1019515, 2.052785, 1, 1, 1, 1, 1,
0.5941053, 1.309482, -1.334635, 1, 1, 1, 1, 1,
0.5998656, -0.3439388, 1.619867, 1, 1, 1, 1, 1,
0.6063361, -1.364589, 2.738328, 1, 1, 1, 1, 1,
0.6083124, -1.106393, 1.533109, 1, 1, 1, 1, 1,
0.6113414, 0.4842179, 2.486789, 1, 1, 1, 1, 1,
0.6123614, -0.1239041, 1.19909, 1, 1, 1, 1, 1,
0.6129382, -0.8385791, 1.724692, 1, 1, 1, 1, 1,
0.6186544, -0.4931158, 1.266725, 1, 1, 1, 1, 1,
0.6188062, 0.1239013, 1.366367, 0, 0, 1, 1, 1,
0.6198764, -0.03668471, 1.326726, 1, 0, 0, 1, 1,
0.62358, 0.6424364, 0.5285897, 1, 0, 0, 1, 1,
0.6257246, 1.703294, 1.969923, 1, 0, 0, 1, 1,
0.6275001, -0.7671153, 4.511916, 1, 0, 0, 1, 1,
0.6285337, 0.2300384, 1.757826, 1, 0, 0, 1, 1,
0.6367252, 2.635023, 1.738239, 0, 0, 0, 1, 1,
0.640938, -0.03122174, 1.26291, 0, 0, 0, 1, 1,
0.6517807, 0.5594462, 0.8021718, 0, 0, 0, 1, 1,
0.6528246, -1.943716, 3.980715, 0, 0, 0, 1, 1,
0.656717, -0.3144455, 2.778995, 0, 0, 0, 1, 1,
0.6586551, 0.3691502, 1.529857, 0, 0, 0, 1, 1,
0.6592737, -0.5405396, 2.455309, 0, 0, 0, 1, 1,
0.6635951, 0.4309584, 3.439384, 1, 1, 1, 1, 1,
0.6643859, -0.6603653, 4.065384, 1, 1, 1, 1, 1,
0.6653144, 0.789856, 1.511194, 1, 1, 1, 1, 1,
0.6656355, 0.7549084, -0.3942399, 1, 1, 1, 1, 1,
0.6670557, 1.088496, -0.3351768, 1, 1, 1, 1, 1,
0.6701975, -1.674684, 2.742116, 1, 1, 1, 1, 1,
0.6707357, -0.4716387, 1.784889, 1, 1, 1, 1, 1,
0.6737651, 0.2517059, 1.493424, 1, 1, 1, 1, 1,
0.683348, 0.3742025, 0.4703876, 1, 1, 1, 1, 1,
0.6862166, -0.9377475, 2.372232, 1, 1, 1, 1, 1,
0.6883882, -0.802981, 2.212931, 1, 1, 1, 1, 1,
0.6890486, -1.221269, 2.138219, 1, 1, 1, 1, 1,
0.6895987, -1.015255, 1.05005, 1, 1, 1, 1, 1,
0.6919709, 0.4841033, 2.573201, 1, 1, 1, 1, 1,
0.693699, -1.024451, 2.002996, 1, 1, 1, 1, 1,
0.693898, 1.18608, 1.25441, 0, 0, 1, 1, 1,
0.6955885, -0.06523685, 2.719099, 1, 0, 0, 1, 1,
0.6984833, 0.114355, 1.145901, 1, 0, 0, 1, 1,
0.7035169, 1.650754, -0.2332855, 1, 0, 0, 1, 1,
0.7061211, -0.3485014, 1.886503, 1, 0, 0, 1, 1,
0.7082354, 2.691404, 0.2474471, 1, 0, 0, 1, 1,
0.7111545, -0.8043141, 2.774712, 0, 0, 0, 1, 1,
0.7123711, -0.08561249, 0.7040859, 0, 0, 0, 1, 1,
0.7334012, 2.663445, 0.9128321, 0, 0, 0, 1, 1,
0.7452169, 0.2379719, 1.725038, 0, 0, 0, 1, 1,
0.7488685, -0.4991888, 1.702734, 0, 0, 0, 1, 1,
0.759712, 1.297481, -0.06808628, 0, 0, 0, 1, 1,
0.7605038, 0.7375072, 0.2994063, 0, 0, 0, 1, 1,
0.7643212, 0.480892, 0.9549814, 1, 1, 1, 1, 1,
0.7648053, 0.5469679, 1.057155, 1, 1, 1, 1, 1,
0.770538, 0.3865399, 1.137204, 1, 1, 1, 1, 1,
0.7795143, 1.421651, -0.6448159, 1, 1, 1, 1, 1,
0.7813089, -0.6055983, 1.662696, 1, 1, 1, 1, 1,
0.7866738, -0.2540368, 0.7022009, 1, 1, 1, 1, 1,
0.7979105, -1.043182, 1.804441, 1, 1, 1, 1, 1,
0.8011871, -0.3664342, 0.8434061, 1, 1, 1, 1, 1,
0.8014693, 0.2190046, 1.204692, 1, 1, 1, 1, 1,
0.8036413, -1.299647, 2.405209, 1, 1, 1, 1, 1,
0.8111808, 2.25875, 1.563267, 1, 1, 1, 1, 1,
0.8150019, 0.5289444, -0.9837326, 1, 1, 1, 1, 1,
0.8151597, -1.129635, 1.635623, 1, 1, 1, 1, 1,
0.8163077, -0.08959893, 2.181665, 1, 1, 1, 1, 1,
0.8231047, 1.706947, -0.3300966, 1, 1, 1, 1, 1,
0.8232732, -1.587553, 1.77815, 0, 0, 1, 1, 1,
0.8248854, 0.507924, 2.171024, 1, 0, 0, 1, 1,
0.8422261, 1.111645, 0.07097755, 1, 0, 0, 1, 1,
0.8560426, 0.03948845, 2.346632, 1, 0, 0, 1, 1,
0.8575836, -0.2139885, 1.600141, 1, 0, 0, 1, 1,
0.8609543, -0.2290585, 1.702362, 1, 0, 0, 1, 1,
0.8610968, 0.3402752, 0.4652861, 0, 0, 0, 1, 1,
0.8617508, -1.071467, 4.043337, 0, 0, 0, 1, 1,
0.8664364, 1.305001, -0.2234836, 0, 0, 0, 1, 1,
0.8686822, -0.2270236, 2.744275, 0, 0, 0, 1, 1,
0.8805138, -1.282442, 4.087189, 0, 0, 0, 1, 1,
0.8822019, -0.2480729, 2.720802, 0, 0, 0, 1, 1,
0.8834532, 1.438206, 0.4366321, 0, 0, 0, 1, 1,
0.8918999, -0.569792, 2.33812, 1, 1, 1, 1, 1,
0.8964991, 0.8460016, 0.3744888, 1, 1, 1, 1, 1,
0.899289, 0.7810065, 0.6149088, 1, 1, 1, 1, 1,
0.9113972, -0.1882834, 2.080503, 1, 1, 1, 1, 1,
0.9127195, 1.576541, 0.3261963, 1, 1, 1, 1, 1,
0.9189954, -1.055397, 1.589622, 1, 1, 1, 1, 1,
0.9280847, -1.353924, 2.026477, 1, 1, 1, 1, 1,
0.9318154, -0.5427758, 1.280052, 1, 1, 1, 1, 1,
0.9346894, 1.370893, 0.9292756, 1, 1, 1, 1, 1,
0.9412706, -1.427378, 2.437297, 1, 1, 1, 1, 1,
0.9425936, -0.09915395, 1.886341, 1, 1, 1, 1, 1,
0.9569721, -1.118631, 2.18472, 1, 1, 1, 1, 1,
0.9604741, 0.6490309, -0.4012873, 1, 1, 1, 1, 1,
0.9700595, -0.1192836, 1.220942, 1, 1, 1, 1, 1,
0.97006, -0.5379736, -0.008407038, 1, 1, 1, 1, 1,
0.9708542, -0.5246335, 2.382279, 0, 0, 1, 1, 1,
0.9723586, 0.6866907, 2.117959, 1, 0, 0, 1, 1,
0.9739694, 0.3029516, -0.3996041, 1, 0, 0, 1, 1,
0.9817103, 1.36778, -0.02707448, 1, 0, 0, 1, 1,
0.9872556, -0.1125422, 2.111772, 1, 0, 0, 1, 1,
0.9905807, 1.729392, 0.5266178, 1, 0, 0, 1, 1,
1.000392, 0.4057989, 0.6810163, 0, 0, 0, 1, 1,
1.008317, -1.466699, 4.320157, 0, 0, 0, 1, 1,
1.012377, -1.828942, 1.8137, 0, 0, 0, 1, 1,
1.015745, 0.6382225, 0.9980334, 0, 0, 0, 1, 1,
1.017012, -0.4850675, 3.937921, 0, 0, 0, 1, 1,
1.024796, -0.4842855, 1.810543, 0, 0, 0, 1, 1,
1.027457, 0.02088743, 1.913748, 0, 0, 0, 1, 1,
1.030498, 1.856457, 0.160226, 1, 1, 1, 1, 1,
1.035658, -0.3694856, 0.2385526, 1, 1, 1, 1, 1,
1.037036, 0.9812037, 1.76193, 1, 1, 1, 1, 1,
1.037625, 1.11822, 0.7134839, 1, 1, 1, 1, 1,
1.069181, 0.3597556, 0.1203711, 1, 1, 1, 1, 1,
1.070868, -1.001881, 2.408202, 1, 1, 1, 1, 1,
1.072499, 0.22556, 0.9831359, 1, 1, 1, 1, 1,
1.074664, -1.294123, 1.700028, 1, 1, 1, 1, 1,
1.075288, 1.298403, 0.00344746, 1, 1, 1, 1, 1,
1.078276, 0.2599048, 0.6873466, 1, 1, 1, 1, 1,
1.079432, -0.491488, 1.49727, 1, 1, 1, 1, 1,
1.079952, -0.7494809, 3.817111, 1, 1, 1, 1, 1,
1.081873, -0.2875686, 2.218332, 1, 1, 1, 1, 1,
1.086305, 0.2700189, 0.2814139, 1, 1, 1, 1, 1,
1.089318, -0.6329644, 2.182974, 1, 1, 1, 1, 1,
1.091418, 0.2417265, 1.743851, 0, 0, 1, 1, 1,
1.096399, 0.5956659, 1.412196, 1, 0, 0, 1, 1,
1.099814, 0.7226327, -1.104695, 1, 0, 0, 1, 1,
1.108289, 0.2383422, 1.279368, 1, 0, 0, 1, 1,
1.109964, -1.380326, 2.944587, 1, 0, 0, 1, 1,
1.110534, 0.3795355, 3.728479, 1, 0, 0, 1, 1,
1.111194, 0.1744239, 1.483464, 0, 0, 0, 1, 1,
1.120005, -0.003137171, 2.56192, 0, 0, 0, 1, 1,
1.122431, -0.2035624, 2.392988, 0, 0, 0, 1, 1,
1.123041, 2.400548, 0.04228134, 0, 0, 0, 1, 1,
1.123304, -0.7434058, 1.743133, 0, 0, 0, 1, 1,
1.126968, 0.4649573, 2.283971, 0, 0, 0, 1, 1,
1.134274, 0.1100207, 1.445165, 0, 0, 0, 1, 1,
1.136401, 0.6784594, -0.5318475, 1, 1, 1, 1, 1,
1.138429, -0.9500896, -0.04363256, 1, 1, 1, 1, 1,
1.140265, 0.4754758, 1.70049, 1, 1, 1, 1, 1,
1.149607, 2.109042, -0.2995281, 1, 1, 1, 1, 1,
1.158575, 0.6989632, 1.034293, 1, 1, 1, 1, 1,
1.165059, 0.4707882, 2.045227, 1, 1, 1, 1, 1,
1.165434, 1.833669, 2.418025, 1, 1, 1, 1, 1,
1.16882, 0.5462304, 2.310472, 1, 1, 1, 1, 1,
1.196488, 0.1899982, 2.011207, 1, 1, 1, 1, 1,
1.20341, 0.3521145, -1.124815, 1, 1, 1, 1, 1,
1.203916, -0.7798054, 3.77721, 1, 1, 1, 1, 1,
1.212276, -1.370613, 1.888403, 1, 1, 1, 1, 1,
1.213487, 1.202464, 2.610523, 1, 1, 1, 1, 1,
1.218083, 0.05014702, 1.897568, 1, 1, 1, 1, 1,
1.226983, -0.2767977, 1.122871, 1, 1, 1, 1, 1,
1.233118, -0.1467932, 0.9697847, 0, 0, 1, 1, 1,
1.238255, 0.9396908, -0.9350343, 1, 0, 0, 1, 1,
1.238726, -1.953753, 1.299224, 1, 0, 0, 1, 1,
1.23948, -0.7984202, 0.4398935, 1, 0, 0, 1, 1,
1.249353, 0.9424913, 1.359023, 1, 0, 0, 1, 1,
1.25374, 0.1306373, -0.01719152, 1, 0, 0, 1, 1,
1.272643, 0.5795639, 1.541015, 0, 0, 0, 1, 1,
1.273634, -1.08099, 1.203642, 0, 0, 0, 1, 1,
1.276598, -1.14308, 2.076345, 0, 0, 0, 1, 1,
1.280796, -0.4095075, 1.334706, 0, 0, 0, 1, 1,
1.284357, 1.015256, -0.6838871, 0, 0, 0, 1, 1,
1.287586, -0.9953368, 2.650393, 0, 0, 0, 1, 1,
1.303262, 1.911408, -0.1207824, 0, 0, 0, 1, 1,
1.313509, -0.1186134, 2.783328, 1, 1, 1, 1, 1,
1.315937, 0.6486694, 0.3775418, 1, 1, 1, 1, 1,
1.325748, -0.463822, 2.228076, 1, 1, 1, 1, 1,
1.326933, 0.8840546, 1.952338, 1, 1, 1, 1, 1,
1.332833, 1.170326, -0.2659143, 1, 1, 1, 1, 1,
1.345949, 0.08906694, 1.23217, 1, 1, 1, 1, 1,
1.348821, 2.723373, 0.6137276, 1, 1, 1, 1, 1,
1.351243, -0.2106575, 2.257619, 1, 1, 1, 1, 1,
1.358737, 0.9076694, 2.095475, 1, 1, 1, 1, 1,
1.358784, 0.04426301, 1.08931, 1, 1, 1, 1, 1,
1.371587, 0.4244422, 1.768639, 1, 1, 1, 1, 1,
1.371814, -1.530728, 1.587531, 1, 1, 1, 1, 1,
1.379179, 1.926673, -0.9449658, 1, 1, 1, 1, 1,
1.380512, -1.964763, 3.17749, 1, 1, 1, 1, 1,
1.398789, -0.468596, 2.85003, 1, 1, 1, 1, 1,
1.415776, -0.3877708, 2.359556, 0, 0, 1, 1, 1,
1.41994, -1.294922, 1.766726, 1, 0, 0, 1, 1,
1.433239, 0.33528, 1.253761, 1, 0, 0, 1, 1,
1.434637, -0.2558893, 0.9305111, 1, 0, 0, 1, 1,
1.439451, 0.3323813, 3.876836, 1, 0, 0, 1, 1,
1.456349, 0.9637498, 2.435559, 1, 0, 0, 1, 1,
1.457579, 0.8313407, 1.561139, 0, 0, 0, 1, 1,
1.460054, 0.6825687, 2.195843, 0, 0, 0, 1, 1,
1.461466, 0.3925944, 0.5837615, 0, 0, 0, 1, 1,
1.461495, 1.386101, 2.017413, 0, 0, 0, 1, 1,
1.462281, -1.284762, 1.230895, 0, 0, 0, 1, 1,
1.464411, -0.3037263, 2.917556, 0, 0, 0, 1, 1,
1.471472, -1.402176, 1.948003, 0, 0, 0, 1, 1,
1.477065, -1.494251, 0.261485, 1, 1, 1, 1, 1,
1.477913, 1.932217, 0.161548, 1, 1, 1, 1, 1,
1.494977, 0.4426933, 1.274919, 1, 1, 1, 1, 1,
1.497301, 0.6479229, 0.8971635, 1, 1, 1, 1, 1,
1.517141, 1.680626, 1.554899, 1, 1, 1, 1, 1,
1.519374, -0.4412276, 2.179807, 1, 1, 1, 1, 1,
1.525393, -0.6028982, 1.93941, 1, 1, 1, 1, 1,
1.532277, 0.01129023, -0.2482905, 1, 1, 1, 1, 1,
1.548094, -0.7400783, 3.250819, 1, 1, 1, 1, 1,
1.550379, -0.3620733, -0.8858795, 1, 1, 1, 1, 1,
1.569924, 0.4606337, 1.716219, 1, 1, 1, 1, 1,
1.576912, 0.6259649, 1.907402, 1, 1, 1, 1, 1,
1.585567, -1.771091, 2.447385, 1, 1, 1, 1, 1,
1.587306, -1.915059, 3.159775, 1, 1, 1, 1, 1,
1.589321, 1.795723, -1.326747, 1, 1, 1, 1, 1,
1.607689, 1.08194, 1.213502, 0, 0, 1, 1, 1,
1.619944, -0.1021907, 0.2854209, 1, 0, 0, 1, 1,
1.655487, -1.407699, 2.287844, 1, 0, 0, 1, 1,
1.657737, -0.9044408, 1.86589, 1, 0, 0, 1, 1,
1.65892, -0.604906, 2.847192, 1, 0, 0, 1, 1,
1.661839, 0.2622015, 1.713487, 1, 0, 0, 1, 1,
1.678851, 1.183053, 1.200618, 0, 0, 0, 1, 1,
1.696718, 0.8809065, -0.8233493, 0, 0, 0, 1, 1,
1.717345, 0.6037114, 0.9241912, 0, 0, 0, 1, 1,
1.722299, -0.8558861, 3.571261, 0, 0, 0, 1, 1,
1.725451, 1.039275, 1.979224, 0, 0, 0, 1, 1,
1.739693, -0.583193, 0.2373631, 0, 0, 0, 1, 1,
1.7397, -0.3293367, 0.5065084, 0, 0, 0, 1, 1,
1.746678, 0.5842546, 1.834625, 1, 1, 1, 1, 1,
1.746936, 2.109811, 0.3739176, 1, 1, 1, 1, 1,
1.751035, 0.6618051, 2.063541, 1, 1, 1, 1, 1,
1.754171, 1.169472, 2.246831, 1, 1, 1, 1, 1,
1.759821, 1.132287, 0.7359555, 1, 1, 1, 1, 1,
1.767302, 0.0008255125, -0.6046603, 1, 1, 1, 1, 1,
1.793591, -0.3223626, 1.10912, 1, 1, 1, 1, 1,
1.794765, 1.170909, -0.7973553, 1, 1, 1, 1, 1,
1.820988, 1.165877, -0.1268888, 1, 1, 1, 1, 1,
1.837486, -0.5164272, 3.592347, 1, 1, 1, 1, 1,
1.844873, 1.540851, 2.258143, 1, 1, 1, 1, 1,
1.858788, -0.3906822, 1.667096, 1, 1, 1, 1, 1,
1.906608, -0.8673804, 1.449592, 1, 1, 1, 1, 1,
1.907799, 0.4083041, 1.062059, 1, 1, 1, 1, 1,
1.930174, 0.8447278, 1.031587, 1, 1, 1, 1, 1,
1.940074, -0.3366786, 2.700785, 0, 0, 1, 1, 1,
1.9428, 1.769023, 0.8258437, 1, 0, 0, 1, 1,
1.948706, -0.5110639, 2.379884, 1, 0, 0, 1, 1,
1.953134, -0.3090423, 3.672697, 1, 0, 0, 1, 1,
1.968138, -0.6672028, 0.352349, 1, 0, 0, 1, 1,
1.971598, 1.82873, 0.7818736, 1, 0, 0, 1, 1,
1.997874, 0.2815676, 2.267833, 0, 0, 0, 1, 1,
1.999794, -0.1786645, 1.320028, 0, 0, 0, 1, 1,
2.0091, -0.05988884, 0.4759714, 0, 0, 0, 1, 1,
2.030127, -1.470714, 2.793086, 0, 0, 0, 1, 1,
2.038169, 0.3386139, 1.870618, 0, 0, 0, 1, 1,
2.101688, -0.8275828, 1.605712, 0, 0, 0, 1, 1,
2.120528, -0.01928912, 1.720253, 0, 0, 0, 1, 1,
2.244995, -1.404158, 2.444877, 1, 1, 1, 1, 1,
2.418996, 0.01077312, 2.578484, 1, 1, 1, 1, 1,
2.447133, -1.227193, 1.254115, 1, 1, 1, 1, 1,
2.451237, -0.07127808, 0.1609556, 1, 1, 1, 1, 1,
2.493958, 1.655261, 0.4918638, 1, 1, 1, 1, 1,
2.657405, -1.042459, 1.997369, 1, 1, 1, 1, 1,
2.83479, -1.024411, 2.524078, 1, 1, 1, 1, 1
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
var radius = 9.649952;
var distance = 33.89505;
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
mvMatrix.translate( 0.08001673, -0.8725146, 0.1172967 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89505);
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
