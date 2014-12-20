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
-2.994214, -0.6992232, -0.2239731, 1, 0, 0, 1,
-2.951644, -0.03812887, -0.6481349, 1, 0.007843138, 0, 1,
-2.819694, -1.341769, -2.893456, 1, 0.01176471, 0, 1,
-2.698206, -1.063073, -1.880376, 1, 0.01960784, 0, 1,
-2.417794, -1.055132, -3.111669, 1, 0.02352941, 0, 1,
-2.401352, -1.196362, -1.129249, 1, 0.03137255, 0, 1,
-2.326094, 1.004534, -0.5728264, 1, 0.03529412, 0, 1,
-2.326003, 0.03766981, -1.526013, 1, 0.04313726, 0, 1,
-2.193249, 0.1309925, -2.030854, 1, 0.04705882, 0, 1,
-2.189696, 0.6472376, -1.31734, 1, 0.05490196, 0, 1,
-2.168289, 0.5020064, -1.81268, 1, 0.05882353, 0, 1,
-2.152842, -0.5952867, -1.949608, 1, 0.06666667, 0, 1,
-2.1469, 0.09874757, 0.3510365, 1, 0.07058824, 0, 1,
-2.136961, -0.6786712, -0.7775487, 1, 0.07843138, 0, 1,
-2.133495, -1.048462, -2.279146, 1, 0.08235294, 0, 1,
-2.131542, 0.7532671, -0.8762518, 1, 0.09019608, 0, 1,
-2.10674, -1.264207, -1.600895, 1, 0.09411765, 0, 1,
-2.081783, 1.289548, -2.341389, 1, 0.1019608, 0, 1,
-2.028371, -0.5377814, -0.8910477, 1, 0.1098039, 0, 1,
-2.010087, 0.04909204, -0.6741231, 1, 0.1137255, 0, 1,
-1.994744, 0.6372679, -1.668102, 1, 0.1215686, 0, 1,
-1.955395, -1.52882, -1.076574, 1, 0.1254902, 0, 1,
-1.92859, 1.090515, -0.2035086, 1, 0.1333333, 0, 1,
-1.921722, -0.9435354, -0.7503536, 1, 0.1372549, 0, 1,
-1.909463, 2.707727, -1.612128, 1, 0.145098, 0, 1,
-1.903111, 0.3402859, -0.2931286, 1, 0.1490196, 0, 1,
-1.897702, -0.539108, -1.748041, 1, 0.1568628, 0, 1,
-1.875696, 0.834506, -1.871818, 1, 0.1607843, 0, 1,
-1.856537, 2.774725, -3.017839, 1, 0.1686275, 0, 1,
-1.848315, 0.3037427, -1.643539, 1, 0.172549, 0, 1,
-1.845996, -0.5203114, -0.1856051, 1, 0.1803922, 0, 1,
-1.841675, 0.04033911, -1.696234, 1, 0.1843137, 0, 1,
-1.823173, 0.6872979, -2.932571, 1, 0.1921569, 0, 1,
-1.811187, 0.1017218, -1.864935, 1, 0.1960784, 0, 1,
-1.787714, 2.329178, -1.553403, 1, 0.2039216, 0, 1,
-1.774275, -0.09336856, -0.7212209, 1, 0.2117647, 0, 1,
-1.770192, 1.21236, -0.1548453, 1, 0.2156863, 0, 1,
-1.757226, 0.2876213, -0.3936622, 1, 0.2235294, 0, 1,
-1.756659, -0.3881577, -1.475222, 1, 0.227451, 0, 1,
-1.75469, 0.9529595, -0.8828614, 1, 0.2352941, 0, 1,
-1.731657, -0.6501279, -0.4231893, 1, 0.2392157, 0, 1,
-1.72681, 0.4590002, 0.06278042, 1, 0.2470588, 0, 1,
-1.724085, -0.8745235, -1.192912, 1, 0.2509804, 0, 1,
-1.674828, 0.6160454, -1.005006, 1, 0.2588235, 0, 1,
-1.673822, 0.6784783, -2.472102, 1, 0.2627451, 0, 1,
-1.660724, 1.722332, -0.6112297, 1, 0.2705882, 0, 1,
-1.659783, 0.3044038, -2.212052, 1, 0.2745098, 0, 1,
-1.648967, 0.438109, -1.082401, 1, 0.282353, 0, 1,
-1.646584, -1.234492, -3.366678, 1, 0.2862745, 0, 1,
-1.635385, -0.5134895, -3.479402, 1, 0.2941177, 0, 1,
-1.602052, -0.9728662, -3.292259, 1, 0.3019608, 0, 1,
-1.592953, 0.2236414, -0.5591231, 1, 0.3058824, 0, 1,
-1.587749, -0.3910784, -2.0247, 1, 0.3137255, 0, 1,
-1.565543, -0.07070963, -1.117021, 1, 0.3176471, 0, 1,
-1.561557, -0.7588887, -0.8278328, 1, 0.3254902, 0, 1,
-1.556476, -0.9061506, -0.8919595, 1, 0.3294118, 0, 1,
-1.556144, 0.9558746, -1.270189, 1, 0.3372549, 0, 1,
-1.552016, 1.215634, -2.22788, 1, 0.3411765, 0, 1,
-1.550797, -0.003505544, -2.414886, 1, 0.3490196, 0, 1,
-1.537497, -0.7760513, -1.52668, 1, 0.3529412, 0, 1,
-1.529454, 0.3993925, -2.476189, 1, 0.3607843, 0, 1,
-1.526989, -1.107551, -1.283834, 1, 0.3647059, 0, 1,
-1.5206, -0.5456083, -2.151446, 1, 0.372549, 0, 1,
-1.516916, -0.6858733, -1.415405, 1, 0.3764706, 0, 1,
-1.512654, -0.8760949, -2.819442, 1, 0.3843137, 0, 1,
-1.494466, -0.1972743, -2.730711, 1, 0.3882353, 0, 1,
-1.492936, 1.588553, -1.117278, 1, 0.3960784, 0, 1,
-1.491203, 0.6569704, 0.02637787, 1, 0.4039216, 0, 1,
-1.483512, 0.4346835, -1.653787, 1, 0.4078431, 0, 1,
-1.464088, -1.066068, -1.723006, 1, 0.4156863, 0, 1,
-1.461652, 0.6953904, -2.350052, 1, 0.4196078, 0, 1,
-1.46033, 0.3279247, -1.195047, 1, 0.427451, 0, 1,
-1.460017, -0.8990644, -2.980394, 1, 0.4313726, 0, 1,
-1.458823, 0.168251, 0.8635885, 1, 0.4392157, 0, 1,
-1.451037, 0.04039935, 0.1513488, 1, 0.4431373, 0, 1,
-1.444571, -0.3250207, -2.287297, 1, 0.4509804, 0, 1,
-1.438639, -0.4016448, -1.343896, 1, 0.454902, 0, 1,
-1.435485, -0.1717096, -1.699324, 1, 0.4627451, 0, 1,
-1.422214, 0.5546442, -0.003968787, 1, 0.4666667, 0, 1,
-1.418312, -1.648975, -1.996143, 1, 0.4745098, 0, 1,
-1.40126, -0.5327067, -1.106602, 1, 0.4784314, 0, 1,
-1.397829, -0.5166451, -3.67012, 1, 0.4862745, 0, 1,
-1.391063, 0.8197606, -1.02453, 1, 0.4901961, 0, 1,
-1.390189, -0.6767403, -3.341237, 1, 0.4980392, 0, 1,
-1.383983, 0.6236714, 0.9612389, 1, 0.5058824, 0, 1,
-1.379923, -0.1508709, -3.47787, 1, 0.509804, 0, 1,
-1.378608, -0.06821765, -2.92134, 1, 0.5176471, 0, 1,
-1.378232, -0.5847354, -0.5175554, 1, 0.5215687, 0, 1,
-1.375681, -1.798937, 0.4230917, 1, 0.5294118, 0, 1,
-1.367805, 1.126301, -1.335063, 1, 0.5333334, 0, 1,
-1.363668, -1.310044, -3.760085, 1, 0.5411765, 0, 1,
-1.3447, 0.74258, -0.7614644, 1, 0.5450981, 0, 1,
-1.3441, -0.4080166, -1.663993, 1, 0.5529412, 0, 1,
-1.34049, -0.6621043, -2.052924, 1, 0.5568628, 0, 1,
-1.331459, 0.5886236, -0.7324433, 1, 0.5647059, 0, 1,
-1.323811, 0.1863153, -2.745828, 1, 0.5686275, 0, 1,
-1.323221, 0.9565199, -0.7910224, 1, 0.5764706, 0, 1,
-1.320505, 0.1091029, 0.500918, 1, 0.5803922, 0, 1,
-1.319706, -1.359677, -3.721132, 1, 0.5882353, 0, 1,
-1.311922, -0.1912009, -1.462912, 1, 0.5921569, 0, 1,
-1.306974, -0.4464326, -2.944061, 1, 0.6, 0, 1,
-1.302145, 0.7164671, -1.312289, 1, 0.6078432, 0, 1,
-1.288417, -2.05558, -3.630524, 1, 0.6117647, 0, 1,
-1.28788, 0.906238, -0.3296061, 1, 0.6196079, 0, 1,
-1.283066, -0.434929, -2.1176, 1, 0.6235294, 0, 1,
-1.273347, -0.4331762, -3.059351, 1, 0.6313726, 0, 1,
-1.272762, -1.660655, -2.902483, 1, 0.6352941, 0, 1,
-1.269006, 1.591998, -0.484332, 1, 0.6431373, 0, 1,
-1.26759, -0.1690784, -2.951715, 1, 0.6470588, 0, 1,
-1.25717, -2.242579, -2.523866, 1, 0.654902, 0, 1,
-1.251808, -0.06402797, -0.60795, 1, 0.6588235, 0, 1,
-1.244143, 0.5363371, -0.9919558, 1, 0.6666667, 0, 1,
-1.243783, 0.1138059, 0.8539639, 1, 0.6705883, 0, 1,
-1.242562, 0.4644586, -0.9463066, 1, 0.6784314, 0, 1,
-1.239777, 0.001778964, -0.4509894, 1, 0.682353, 0, 1,
-1.23545, -2.454985, -1.548476, 1, 0.6901961, 0, 1,
-1.233439, -1.727291, -1.92503, 1, 0.6941177, 0, 1,
-1.230962, 0.5501463, -1.643463, 1, 0.7019608, 0, 1,
-1.229199, -0.7451217, -2.429195, 1, 0.7098039, 0, 1,
-1.228282, 0.4677086, -0.5184703, 1, 0.7137255, 0, 1,
-1.22616, -0.3476935, -0.8585712, 1, 0.7215686, 0, 1,
-1.219067, 0.2574331, -1.441223, 1, 0.7254902, 0, 1,
-1.216269, -0.1914263, -0.5587055, 1, 0.7333333, 0, 1,
-1.201481, 1.22428, 0.8392913, 1, 0.7372549, 0, 1,
-1.200347, -0.868259, -1.894436, 1, 0.7450981, 0, 1,
-1.199131, -0.6020257, -2.743964, 1, 0.7490196, 0, 1,
-1.190213, 0.09572975, -2.705423, 1, 0.7568628, 0, 1,
-1.188933, -0.7755741, -2.341177, 1, 0.7607843, 0, 1,
-1.187828, -0.3367025, -2.6423, 1, 0.7686275, 0, 1,
-1.186195, 0.7392431, -1.899618, 1, 0.772549, 0, 1,
-1.176639, -1.496053, -1.89131, 1, 0.7803922, 0, 1,
-1.17619, 0.03185552, -1.922088, 1, 0.7843137, 0, 1,
-1.175825, 0.5740473, -0.6333221, 1, 0.7921569, 0, 1,
-1.17349, -0.1824713, -1.771376, 1, 0.7960784, 0, 1,
-1.171755, -1.043319, -2.507674, 1, 0.8039216, 0, 1,
-1.171614, -0.9927641, -1.703205, 1, 0.8117647, 0, 1,
-1.167856, -0.8602912, -0.8747621, 1, 0.8156863, 0, 1,
-1.157758, -0.4118942, -4.077652, 1, 0.8235294, 0, 1,
-1.156068, -0.1957155, -1.471859, 1, 0.827451, 0, 1,
-1.154779, -0.3473407, -1.392685, 1, 0.8352941, 0, 1,
-1.153339, 0.34216, -2.24829, 1, 0.8392157, 0, 1,
-1.148345, -0.7342691, -2.687052, 1, 0.8470588, 0, 1,
-1.139798, -0.7285317, -0.3651879, 1, 0.8509804, 0, 1,
-1.133359, 0.6423297, -1.476735, 1, 0.8588235, 0, 1,
-1.13331, 0.1756487, -1.216063, 1, 0.8627451, 0, 1,
-1.131908, -2.577584, -4.072821, 1, 0.8705882, 0, 1,
-1.129124, -0.4587827, -1.080615, 1, 0.8745098, 0, 1,
-1.128795, 0.8267131, -1.134191, 1, 0.8823529, 0, 1,
-1.119747, -0.2588677, -1.669412, 1, 0.8862745, 0, 1,
-1.119197, -0.7401609, -3.073334, 1, 0.8941177, 0, 1,
-1.119096, -1.893812, -4.161825, 1, 0.8980392, 0, 1,
-1.11196, 1.753736, -0.8454255, 1, 0.9058824, 0, 1,
-1.108648, 0.4990982, -1.047628, 1, 0.9137255, 0, 1,
-1.108092, 1.280939, -2.168182, 1, 0.9176471, 0, 1,
-1.103061, 1.668048, -0.4440085, 1, 0.9254902, 0, 1,
-1.097032, -0.1428302, -1.209352, 1, 0.9294118, 0, 1,
-1.096957, -1.843844, -4.023495, 1, 0.9372549, 0, 1,
-1.095628, 0.3998404, -2.608423, 1, 0.9411765, 0, 1,
-1.088337, 0.4217665, -1.698149, 1, 0.9490196, 0, 1,
-1.081015, 2.661472, -0.4125033, 1, 0.9529412, 0, 1,
-1.076027, 1.268941, -1.065789, 1, 0.9607843, 0, 1,
-1.072086, -0.5251174, -1.841789, 1, 0.9647059, 0, 1,
-1.071785, -1.408086, -2.915322, 1, 0.972549, 0, 1,
-1.062567, -0.1322019, -1.401363, 1, 0.9764706, 0, 1,
-1.062373, 0.604876, -1.704508, 1, 0.9843137, 0, 1,
-1.055389, 1.061306, -1.174779, 1, 0.9882353, 0, 1,
-1.052575, 0.1221886, -2.167054, 1, 0.9960784, 0, 1,
-1.052258, -0.2628166, -3.155877, 0.9960784, 1, 0, 1,
-1.04775, -0.5575446, -3.523346, 0.9921569, 1, 0, 1,
-1.043667, 1.01735, -0.7276835, 0.9843137, 1, 0, 1,
-1.042164, 0.1974263, -1.336263, 0.9803922, 1, 0, 1,
-1.041198, -1.774256, -3.921075, 0.972549, 1, 0, 1,
-1.035164, -1.189789, -2.109768, 0.9686275, 1, 0, 1,
-1.034814, 0.5691352, -0.1401957, 0.9607843, 1, 0, 1,
-1.032109, 0.4061407, -2.217224, 0.9568627, 1, 0, 1,
-1.028966, -1.042334, -2.423565, 0.9490196, 1, 0, 1,
-1.025666, 0.07717504, -2.032295, 0.945098, 1, 0, 1,
-1.024981, -0.2393626, -2.066074, 0.9372549, 1, 0, 1,
-1.023472, -0.7989448, -0.3419835, 0.9333333, 1, 0, 1,
-1.022354, -0.5626705, -0.7087282, 0.9254902, 1, 0, 1,
-1.022135, 0.2718379, -2.208785, 0.9215686, 1, 0, 1,
-1.02109, -1.468327, -3.343835, 0.9137255, 1, 0, 1,
-1.0152, 0.01448924, -2.492755, 0.9098039, 1, 0, 1,
-1.006219, 0.5421395, -1.23235, 0.9019608, 1, 0, 1,
-0.9780276, 0.2233184, -0.7878745, 0.8941177, 1, 0, 1,
-0.9626705, 1.816614, -1.367313, 0.8901961, 1, 0, 1,
-0.9592658, 0.3543038, -1.226013, 0.8823529, 1, 0, 1,
-0.9554191, -1.268345, -2.315462, 0.8784314, 1, 0, 1,
-0.9484039, -1.430189, -2.155146, 0.8705882, 1, 0, 1,
-0.9450099, -0.2694738, -1.49808, 0.8666667, 1, 0, 1,
-0.9434304, -1.891244, -4.049573, 0.8588235, 1, 0, 1,
-0.9415295, -0.2340643, -2.954017, 0.854902, 1, 0, 1,
-0.9367312, 0.2381761, -1.101822, 0.8470588, 1, 0, 1,
-0.9165562, 0.1398083, -1.149121, 0.8431373, 1, 0, 1,
-0.9146366, -1.276975, -3.857737, 0.8352941, 1, 0, 1,
-0.8955894, 0.3046493, -1.267252, 0.8313726, 1, 0, 1,
-0.8917191, 0.2470373, -0.968195, 0.8235294, 1, 0, 1,
-0.8890001, -2.813082, -3.115566, 0.8196079, 1, 0, 1,
-0.8830973, 0.6948044, 0.8272679, 0.8117647, 1, 0, 1,
-0.8823935, 0.3814394, -1.619684, 0.8078431, 1, 0, 1,
-0.8801388, 1.485374, -0.7198583, 0.8, 1, 0, 1,
-0.8779851, -1.354517, -0.9628906, 0.7921569, 1, 0, 1,
-0.8764206, -1.860678, -1.957695, 0.7882353, 1, 0, 1,
-0.874921, -0.06887798, -1.730016, 0.7803922, 1, 0, 1,
-0.8722769, 1.090386, -0.6560578, 0.7764706, 1, 0, 1,
-0.861258, 1.678383, -1.794345, 0.7686275, 1, 0, 1,
-0.8565837, -1.434252, -2.101564, 0.7647059, 1, 0, 1,
-0.8553076, -0.2678927, -1.564596, 0.7568628, 1, 0, 1,
-0.850962, 0.1853748, 0.1907963, 0.7529412, 1, 0, 1,
-0.8493408, 0.1353818, -2.384406, 0.7450981, 1, 0, 1,
-0.8487976, 1.414033, -0.7967956, 0.7411765, 1, 0, 1,
-0.8468583, 0.3047417, -1.023417, 0.7333333, 1, 0, 1,
-0.8452538, -1.089203, -0.6677172, 0.7294118, 1, 0, 1,
-0.8423666, 0.9944724, -1.7093, 0.7215686, 1, 0, 1,
-0.8400447, -0.6975715, -2.0382, 0.7176471, 1, 0, 1,
-0.838929, 0.7600893, -1.881728, 0.7098039, 1, 0, 1,
-0.836386, -1.487286, -2.047672, 0.7058824, 1, 0, 1,
-0.8210929, 1.351286, -0.9590029, 0.6980392, 1, 0, 1,
-0.8179706, -0.07153019, -0.6624574, 0.6901961, 1, 0, 1,
-0.8172376, 1.259891, 1.818887, 0.6862745, 1, 0, 1,
-0.8161386, 0.1698269, 0.3257922, 0.6784314, 1, 0, 1,
-0.812238, 0.4113589, -2.399454, 0.6745098, 1, 0, 1,
-0.802325, -0.009743474, -1.811074, 0.6666667, 1, 0, 1,
-0.7928079, 1.663396, -0.7989886, 0.6627451, 1, 0, 1,
-0.7902575, -1.315193, -2.411068, 0.654902, 1, 0, 1,
-0.7884133, -1.356951, -2.840598, 0.6509804, 1, 0, 1,
-0.7877073, -0.1174388, 0.08527139, 0.6431373, 1, 0, 1,
-0.7713886, -0.07365572, -1.351949, 0.6392157, 1, 0, 1,
-0.766657, 0.8154851, -1.460143, 0.6313726, 1, 0, 1,
-0.764935, 0.3649845, -1.744595, 0.627451, 1, 0, 1,
-0.7637354, 0.4285312, 0.2107648, 0.6196079, 1, 0, 1,
-0.7630334, -0.5674699, -0.7048383, 0.6156863, 1, 0, 1,
-0.7610953, -1.113922, -3.32772, 0.6078432, 1, 0, 1,
-0.7602884, -0.2289972, -3.84336, 0.6039216, 1, 0, 1,
-0.7576622, -0.6123143, -1.77874, 0.5960785, 1, 0, 1,
-0.7572769, -0.5706943, -2.296093, 0.5882353, 1, 0, 1,
-0.7516289, 1.437193, 0.6427033, 0.5843138, 1, 0, 1,
-0.7504317, -0.9006395, -3.31568, 0.5764706, 1, 0, 1,
-0.7501723, -1.475398, -2.012169, 0.572549, 1, 0, 1,
-0.7496004, 1.329331, -1.781767, 0.5647059, 1, 0, 1,
-0.7487497, 0.08295424, -4.160491, 0.5607843, 1, 0, 1,
-0.7470415, -0.1628724, -1.011002, 0.5529412, 1, 0, 1,
-0.7349969, 1.564106, -1.031101, 0.5490196, 1, 0, 1,
-0.7319731, -2.212947, -2.638073, 0.5411765, 1, 0, 1,
-0.7313781, 1.986697, 0.337194, 0.5372549, 1, 0, 1,
-0.7240863, 0.857356, -0.4934474, 0.5294118, 1, 0, 1,
-0.7203532, 0.08097764, -1.048333, 0.5254902, 1, 0, 1,
-0.7168605, -1.034413, -3.112059, 0.5176471, 1, 0, 1,
-0.7146122, -0.4760105, -1.131719, 0.5137255, 1, 0, 1,
-0.7140406, -0.2157967, -2.582829, 0.5058824, 1, 0, 1,
-0.7128388, -0.9650978, -1.486609, 0.5019608, 1, 0, 1,
-0.7128327, 1.065926, 0.1815155, 0.4941176, 1, 0, 1,
-0.7122126, 0.797435, -1.286035, 0.4862745, 1, 0, 1,
-0.7116919, -1.488547, -3.669947, 0.4823529, 1, 0, 1,
-0.6964744, 0.886586, 1.444839, 0.4745098, 1, 0, 1,
-0.6918455, 1.390914, 0.5921642, 0.4705882, 1, 0, 1,
-0.6898775, -1.780684, -4.06014, 0.4627451, 1, 0, 1,
-0.6878542, 0.2168506, -3.679626, 0.4588235, 1, 0, 1,
-0.6859741, -0.5139324, -1.835424, 0.4509804, 1, 0, 1,
-0.6823555, 0.3726606, -1.15554, 0.4470588, 1, 0, 1,
-0.6738063, 0.3266316, -0.9035779, 0.4392157, 1, 0, 1,
-0.6723632, -0.5685067, -2.049386, 0.4352941, 1, 0, 1,
-0.6690561, 0.4401691, 1.40003, 0.427451, 1, 0, 1,
-0.6663378, -0.4180144, -1.472028, 0.4235294, 1, 0, 1,
-0.6643134, -0.1140272, -1.467603, 0.4156863, 1, 0, 1,
-0.6589787, 0.7809515, -1.076784, 0.4117647, 1, 0, 1,
-0.656768, -0.1796865, -0.7443097, 0.4039216, 1, 0, 1,
-0.6566682, -0.3575089, -1.521469, 0.3960784, 1, 0, 1,
-0.6529391, 0.5534701, -0.1011673, 0.3921569, 1, 0, 1,
-0.651607, 1.470395, 0.8170848, 0.3843137, 1, 0, 1,
-0.6460972, -0.01369765, -2.362454, 0.3803922, 1, 0, 1,
-0.6445595, -0.2570268, -1.999541, 0.372549, 1, 0, 1,
-0.6384864, -0.7874438, -2.300813, 0.3686275, 1, 0, 1,
-0.6358257, 0.2905258, 0.5388625, 0.3607843, 1, 0, 1,
-0.6357252, 1.157654, -0.1511869, 0.3568628, 1, 0, 1,
-0.6332223, 2.375945, -1.560622, 0.3490196, 1, 0, 1,
-0.6323761, 0.779053, -1.207828, 0.345098, 1, 0, 1,
-0.6291447, 1.871566, -1.038594, 0.3372549, 1, 0, 1,
-0.628989, 0.4714481, -0.9872735, 0.3333333, 1, 0, 1,
-0.6288112, -0.8569564, -2.021996, 0.3254902, 1, 0, 1,
-0.6249496, -0.2508558, -2.303926, 0.3215686, 1, 0, 1,
-0.6237407, 1.958681, 0.2265095, 0.3137255, 1, 0, 1,
-0.6230279, 0.05787576, -1.16792, 0.3098039, 1, 0, 1,
-0.6206095, -0.4898905, -2.705004, 0.3019608, 1, 0, 1,
-0.6204401, 0.3433547, -0.3136765, 0.2941177, 1, 0, 1,
-0.6167951, -0.9664302, -1.397227, 0.2901961, 1, 0, 1,
-0.6130896, -0.4742982, -2.378263, 0.282353, 1, 0, 1,
-0.6066808, -1.240816, -3.738277, 0.2784314, 1, 0, 1,
-0.6041046, -1.778719, -4.156301, 0.2705882, 1, 0, 1,
-0.6026759, -1.424068, -1.264224, 0.2666667, 1, 0, 1,
-0.6017581, -0.5439781, -4.006265, 0.2588235, 1, 0, 1,
-0.6008562, -0.1202192, -0.477094, 0.254902, 1, 0, 1,
-0.5971924, 1.697496, -1.402972, 0.2470588, 1, 0, 1,
-0.5933617, 0.8468935, -0.9829829, 0.2431373, 1, 0, 1,
-0.5927646, 0.4249398, -0.005426326, 0.2352941, 1, 0, 1,
-0.5903884, 0.4076904, -0.8028288, 0.2313726, 1, 0, 1,
-0.5820248, -1.813765, -3.188135, 0.2235294, 1, 0, 1,
-0.5813694, -0.3715589, -1.009915, 0.2196078, 1, 0, 1,
-0.5744287, -0.2629434, -2.017964, 0.2117647, 1, 0, 1,
-0.573633, 0.2690426, -1.609677, 0.2078431, 1, 0, 1,
-0.5728948, 0.3732257, -1.04017, 0.2, 1, 0, 1,
-0.5618103, 2.423022, 0.5846711, 0.1921569, 1, 0, 1,
-0.560742, 0.6423956, -1.293731, 0.1882353, 1, 0, 1,
-0.5604246, 2.361359, -2.247986, 0.1803922, 1, 0, 1,
-0.5586796, -0.1147066, -1.12493, 0.1764706, 1, 0, 1,
-0.5580125, -1.523432, -3.342104, 0.1686275, 1, 0, 1,
-0.5555861, 2.100523, 0.2888397, 0.1647059, 1, 0, 1,
-0.5541555, 1.071147, -1.54912, 0.1568628, 1, 0, 1,
-0.5533616, -1.35592, -2.84345, 0.1529412, 1, 0, 1,
-0.5528986, -0.3841658, -2.582192, 0.145098, 1, 0, 1,
-0.5515898, 1.470089, 2.717775, 0.1411765, 1, 0, 1,
-0.5489968, -1.356842, -2.561714, 0.1333333, 1, 0, 1,
-0.5489359, -0.5102984, -3.421922, 0.1294118, 1, 0, 1,
-0.5470095, 1.159103, 1.732285, 0.1215686, 1, 0, 1,
-0.5394565, -0.978415, -1.739366, 0.1176471, 1, 0, 1,
-0.5376428, 0.1467344, -3.000131, 0.1098039, 1, 0, 1,
-0.5357073, 0.6640707, -1.185282, 0.1058824, 1, 0, 1,
-0.5321618, 0.7346998, -1.356187, 0.09803922, 1, 0, 1,
-0.530549, 0.5232832, -0.1225212, 0.09019608, 1, 0, 1,
-0.5207763, -0.3203914, -1.034582, 0.08627451, 1, 0, 1,
-0.5174362, -0.8597876, -2.14946, 0.07843138, 1, 0, 1,
-0.5152731, -0.03413206, 0.3653812, 0.07450981, 1, 0, 1,
-0.5149199, 1.367061, -1.157139, 0.06666667, 1, 0, 1,
-0.5123037, 0.7260556, 0.7576, 0.0627451, 1, 0, 1,
-0.5119349, 0.03196338, -2.157564, 0.05490196, 1, 0, 1,
-0.5104328, -1.119356, 0.5653493, 0.05098039, 1, 0, 1,
-0.5082805, -0.1264603, -0.8213247, 0.04313726, 1, 0, 1,
-0.5079339, -0.8442988, -4.228922, 0.03921569, 1, 0, 1,
-0.5078084, -0.2121283, -2.655274, 0.03137255, 1, 0, 1,
-0.5075319, -0.09741114, -1.181577, 0.02745098, 1, 0, 1,
-0.5045094, 0.5159885, -0.6169264, 0.01960784, 1, 0, 1,
-0.501861, 0.4717435, -0.4439422, 0.01568628, 1, 0, 1,
-0.4888868, -0.1302775, -0.5202712, 0.007843138, 1, 0, 1,
-0.4846189, -0.2680473, -2.17977, 0.003921569, 1, 0, 1,
-0.4808173, 1.026629, -1.11533, 0, 1, 0.003921569, 1,
-0.480091, -0.3866135, -1.404623, 0, 1, 0.01176471, 1,
-0.4764569, 1.377782, -0.8700721, 0, 1, 0.01568628, 1,
-0.475115, -0.8288182, -1.400092, 0, 1, 0.02352941, 1,
-0.4745284, 0.9508113, -0.06240543, 0, 1, 0.02745098, 1,
-0.4682891, -0.5917442, -1.445048, 0, 1, 0.03529412, 1,
-0.4659212, 0.5020609, 0.05192087, 0, 1, 0.03921569, 1,
-0.4597418, 0.4069896, -1.473894, 0, 1, 0.04705882, 1,
-0.4493456, -0.6512606, -1.758783, 0, 1, 0.05098039, 1,
-0.4290743, 0.9180489, -0.4684813, 0, 1, 0.05882353, 1,
-0.4283324, 0.3067768, -2.755731, 0, 1, 0.0627451, 1,
-0.4249079, 0.5656876, -0.3628106, 0, 1, 0.07058824, 1,
-0.4233786, 0.12699, -0.5569538, 0, 1, 0.07450981, 1,
-0.4145953, 0.5887964, 1.794615, 0, 1, 0.08235294, 1,
-0.4116539, -0.3344176, -1.822662, 0, 1, 0.08627451, 1,
-0.4116441, -1.141683, -2.176716, 0, 1, 0.09411765, 1,
-0.4114884, -0.183546, -1.321776, 0, 1, 0.1019608, 1,
-0.4105545, 0.8524342, 0.9016743, 0, 1, 0.1058824, 1,
-0.4096226, 0.6664858, -0.9585699, 0, 1, 0.1137255, 1,
-0.408011, -0.5085563, -3.206023, 0, 1, 0.1176471, 1,
-0.4020761, 1.002404, -1.101751, 0, 1, 0.1254902, 1,
-0.4015871, -2.154474, -3.989543, 0, 1, 0.1294118, 1,
-0.3976099, -1.795937, -0.6280829, 0, 1, 0.1372549, 1,
-0.3954297, 0.1313673, -0.4428234, 0, 1, 0.1411765, 1,
-0.3925847, -1.020332, -2.257997, 0, 1, 0.1490196, 1,
-0.3821882, 0.3181372, 0.1460315, 0, 1, 0.1529412, 1,
-0.3808261, 0.9533741, 0.2746258, 0, 1, 0.1607843, 1,
-0.3772625, -0.6225848, -2.532346, 0, 1, 0.1647059, 1,
-0.3759412, -1.880394, -3.254771, 0, 1, 0.172549, 1,
-0.3747022, 1.12085, -0.2334198, 0, 1, 0.1764706, 1,
-0.3711285, 0.587813, 0.2322369, 0, 1, 0.1843137, 1,
-0.369463, -2.652265, -3.302422, 0, 1, 0.1882353, 1,
-0.3616673, -0.2357225, -2.455184, 0, 1, 0.1960784, 1,
-0.358494, -0.5759376, -2.45622, 0, 1, 0.2039216, 1,
-0.357403, -1.985875, -2.529498, 0, 1, 0.2078431, 1,
-0.3570042, -2.606483, -3.762184, 0, 1, 0.2156863, 1,
-0.3526042, -0.8377237, -2.324825, 0, 1, 0.2196078, 1,
-0.3517371, -0.5502726, -2.475293, 0, 1, 0.227451, 1,
-0.3504939, 1.995906, 0.07818613, 0, 1, 0.2313726, 1,
-0.3503753, -2.593372, -2.971192, 0, 1, 0.2392157, 1,
-0.35028, 0.101477, -2.379471, 0, 1, 0.2431373, 1,
-0.3481071, 1.431355, 0.9992639, 0, 1, 0.2509804, 1,
-0.3465638, 0.05543819, -1.123898, 0, 1, 0.254902, 1,
-0.3464548, -0.9924568, -3.675116, 0, 1, 0.2627451, 1,
-0.3450473, -0.3663277, -2.919989, 0, 1, 0.2666667, 1,
-0.3377094, -0.4689397, -2.078573, 0, 1, 0.2745098, 1,
-0.337688, -0.06766138, -2.098916, 0, 1, 0.2784314, 1,
-0.3367777, 0.8462082, 0.08411124, 0, 1, 0.2862745, 1,
-0.3367552, 2.072957, 0.1320731, 0, 1, 0.2901961, 1,
-0.3324555, -0.03097666, -0.7376962, 0, 1, 0.2980392, 1,
-0.329859, -2.551626, -3.607454, 0, 1, 0.3058824, 1,
-0.3252035, -0.2445806, -2.143483, 0, 1, 0.3098039, 1,
-0.3175153, 0.659346, -1.242997, 0, 1, 0.3176471, 1,
-0.3111332, -0.2826368, -0.2371554, 0, 1, 0.3215686, 1,
-0.311125, -2.531739, -3.7606, 0, 1, 0.3294118, 1,
-0.3106291, 0.377171, -1.346558, 0, 1, 0.3333333, 1,
-0.3099371, 0.3339234, -2.233316, 0, 1, 0.3411765, 1,
-0.3091651, 1.026054, -1.112398, 0, 1, 0.345098, 1,
-0.3079199, 0.7621379, -1.307108, 0, 1, 0.3529412, 1,
-0.3075867, -0.1335393, -4.476061, 0, 1, 0.3568628, 1,
-0.3036026, -0.5040647, -2.728296, 0, 1, 0.3647059, 1,
-0.2980141, 0.7087883, -0.007354186, 0, 1, 0.3686275, 1,
-0.2937512, -1.285924, -1.956826, 0, 1, 0.3764706, 1,
-0.2898321, 1.575271, -0.1695388, 0, 1, 0.3803922, 1,
-0.2892589, 0.5384605, 0.303301, 0, 1, 0.3882353, 1,
-0.2853908, -1.388247, -2.993572, 0, 1, 0.3921569, 1,
-0.2840723, 0.8685493, 2.263257, 0, 1, 0.4, 1,
-0.2830617, 1.074518, -2.097115, 0, 1, 0.4078431, 1,
-0.27998, 0.4320168, -2.497427, 0, 1, 0.4117647, 1,
-0.2771338, -1.706514, -2.456892, 0, 1, 0.4196078, 1,
-0.2735532, -1.048478, -3.159111, 0, 1, 0.4235294, 1,
-0.271814, -0.4537492, -2.13386, 0, 1, 0.4313726, 1,
-0.2718092, 0.7898203, 0.5110066, 0, 1, 0.4352941, 1,
-0.2713363, 0.07320645, -0.8270108, 0, 1, 0.4431373, 1,
-0.2699885, -0.6824672, -3.482306, 0, 1, 0.4470588, 1,
-0.2695938, -1.301364, -3.310484, 0, 1, 0.454902, 1,
-0.2690935, -1.14058, -3.523222, 0, 1, 0.4588235, 1,
-0.2661604, 0.8956233, -0.522612, 0, 1, 0.4666667, 1,
-0.2656702, 2.152246, 0.8357929, 0, 1, 0.4705882, 1,
-0.2610188, -0.3852983, -3.470178, 0, 1, 0.4784314, 1,
-0.2544207, -0.7919728, -1.610824, 0, 1, 0.4823529, 1,
-0.2534455, -0.1507575, 0.5745295, 0, 1, 0.4901961, 1,
-0.2526487, 0.01016215, -1.111223, 0, 1, 0.4941176, 1,
-0.2520675, -0.6370365, -2.229765, 0, 1, 0.5019608, 1,
-0.2430956, -0.8306224, -2.440762, 0, 1, 0.509804, 1,
-0.2396161, 0.0279201, -3.402911, 0, 1, 0.5137255, 1,
-0.2387377, -0.6201143, -1.65213, 0, 1, 0.5215687, 1,
-0.2360132, 1.78936, -0.09730433, 0, 1, 0.5254902, 1,
-0.2275297, 0.4475668, -0.3874575, 0, 1, 0.5333334, 1,
-0.2247991, 0.9146136, 1.176665, 0, 1, 0.5372549, 1,
-0.222397, 0.31763, -0.1289588, 0, 1, 0.5450981, 1,
-0.2220924, 2.307462, -0.04482698, 0, 1, 0.5490196, 1,
-0.2099302, -0.3700952, -3.347647, 0, 1, 0.5568628, 1,
-0.208464, 0.725541, -0.2975239, 0, 1, 0.5607843, 1,
-0.2079981, -0.2688093, -1.462163, 0, 1, 0.5686275, 1,
-0.206319, 0.2342134, -1.564265, 0, 1, 0.572549, 1,
-0.2059233, -2.350374, -4.473499, 0, 1, 0.5803922, 1,
-0.2026233, 0.7798725, 0.4520117, 0, 1, 0.5843138, 1,
-0.1976475, -0.547698, -2.451353, 0, 1, 0.5921569, 1,
-0.1910787, 1.108793, -1.305698, 0, 1, 0.5960785, 1,
-0.1904319, 0.8731422, -0.7006696, 0, 1, 0.6039216, 1,
-0.1858478, 0.2332729, -0.7685409, 0, 1, 0.6117647, 1,
-0.1858312, -1.388624, -3.186439, 0, 1, 0.6156863, 1,
-0.1855792, 0.4311993, -0.2215059, 0, 1, 0.6235294, 1,
-0.1854397, 2.170122, 0.7191184, 0, 1, 0.627451, 1,
-0.1791827, 2.181464, 0.5813067, 0, 1, 0.6352941, 1,
-0.1740001, -0.5814664, -3.145783, 0, 1, 0.6392157, 1,
-0.1732766, -0.2289895, -1.0117, 0, 1, 0.6470588, 1,
-0.1731719, 1.70087, 1.258083, 0, 1, 0.6509804, 1,
-0.1678431, 0.6403635, -1.48408, 0, 1, 0.6588235, 1,
-0.1668651, 0.03108109, -1.617159, 0, 1, 0.6627451, 1,
-0.1664055, 0.479999, 1.060324, 0, 1, 0.6705883, 1,
-0.1663753, -0.6355782, -1.116017, 0, 1, 0.6745098, 1,
-0.1646559, -1.273002, -2.494946, 0, 1, 0.682353, 1,
-0.1641126, 0.0312616, -2.621403, 0, 1, 0.6862745, 1,
-0.160312, 0.586732, 1.857148, 0, 1, 0.6941177, 1,
-0.1556461, 1.446197, 0.2796809, 0, 1, 0.7019608, 1,
-0.1547252, -0.3406377, -2.040573, 0, 1, 0.7058824, 1,
-0.1477394, -0.113201, -2.499914, 0, 1, 0.7137255, 1,
-0.1440475, 0.7140007, 0.5095336, 0, 1, 0.7176471, 1,
-0.1416252, -0.6036004, -2.308552, 0, 1, 0.7254902, 1,
-0.1351061, 1.369834, -0.621102, 0, 1, 0.7294118, 1,
-0.1333634, 1.011982, 1.064874, 0, 1, 0.7372549, 1,
-0.1331653, 1.18514, -0.3333216, 0, 1, 0.7411765, 1,
-0.1287861, -0.04631016, -3.033834, 0, 1, 0.7490196, 1,
-0.1282258, -0.8206167, -2.214202, 0, 1, 0.7529412, 1,
-0.1260214, 1.574123, -1.162412, 0, 1, 0.7607843, 1,
-0.12413, 1.079331, -0.6534658, 0, 1, 0.7647059, 1,
-0.1228119, -0.619567, -2.993067, 0, 1, 0.772549, 1,
-0.1204186, -1.00786, -1.869426, 0, 1, 0.7764706, 1,
-0.1164834, 0.5123094, -0.806203, 0, 1, 0.7843137, 1,
-0.1154924, 0.170146, 0.06867167, 0, 1, 0.7882353, 1,
-0.1125993, 2.586659, -0.58526, 0, 1, 0.7960784, 1,
-0.1102282, 1.71839, -0.5462219, 0, 1, 0.8039216, 1,
-0.1099272, 2.526184, -1.198421, 0, 1, 0.8078431, 1,
-0.1056936, -0.2562347, -3.902935, 0, 1, 0.8156863, 1,
-0.1049648, 0.040188, 0.5928217, 0, 1, 0.8196079, 1,
-0.1016307, 0.9040565, 1.22676, 0, 1, 0.827451, 1,
-0.1011131, -1.239463, -2.519307, 0, 1, 0.8313726, 1,
-0.09906756, 1.415154, -2.305085, 0, 1, 0.8392157, 1,
-0.09746674, -0.02038666, -2.112385, 0, 1, 0.8431373, 1,
-0.08910214, 1.750185, -1.37451, 0, 1, 0.8509804, 1,
-0.08490794, -0.1477947, -3.385594, 0, 1, 0.854902, 1,
-0.08372701, -1.328763, -3.561615, 0, 1, 0.8627451, 1,
-0.08197258, -1.099987, -3.396058, 0, 1, 0.8666667, 1,
-0.07791405, -0.3197728, -3.250209, 0, 1, 0.8745098, 1,
-0.07722946, 1.197341, 0.7814844, 0, 1, 0.8784314, 1,
-0.07229366, -1.085949, -3.021532, 0, 1, 0.8862745, 1,
-0.07160323, 1.50187, 0.1668832, 0, 1, 0.8901961, 1,
-0.0696713, -0.6606738, -1.928564, 0, 1, 0.8980392, 1,
-0.0646342, 1.640253, 1.440915, 0, 1, 0.9058824, 1,
-0.06343324, 1.062777, -0.4276864, 0, 1, 0.9098039, 1,
-0.06288889, 1.632971, -0.4740871, 0, 1, 0.9176471, 1,
-0.06003719, -2.143246, -3.575107, 0, 1, 0.9215686, 1,
-0.05991406, 0.3026978, -1.23422, 0, 1, 0.9294118, 1,
-0.05433439, 1.508279, 0.9144984, 0, 1, 0.9333333, 1,
-0.05232182, -1.303674, -3.426562, 0, 1, 0.9411765, 1,
-0.04924568, 1.377092, 0.2394302, 0, 1, 0.945098, 1,
-0.04760714, -0.1304054, -5.349831, 0, 1, 0.9529412, 1,
-0.04416701, -1.976581, -3.699369, 0, 1, 0.9568627, 1,
-0.04305716, -0.797182, -2.36571, 0, 1, 0.9647059, 1,
-0.04233569, -0.5380589, -1.948576, 0, 1, 0.9686275, 1,
-0.03175421, 1.34355, -1.18967, 0, 1, 0.9764706, 1,
-0.02702888, 1.297549, -0.7430254, 0, 1, 0.9803922, 1,
-0.02683462, -1.385358, -3.534433, 0, 1, 0.9882353, 1,
-0.02647202, 0.1421715, 1.879275, 0, 1, 0.9921569, 1,
-0.02545366, 2.237741, -0.4825675, 0, 1, 1, 1,
-0.0188565, -0.1030165, -3.583694, 0, 0.9921569, 1, 1,
-0.01653102, -0.9048433, -2.890455, 0, 0.9882353, 1, 1,
-0.01598437, 0.8568892, -0.9035801, 0, 0.9803922, 1, 1,
-0.009637389, -0.1030595, -3.336001, 0, 0.9764706, 1, 1,
-0.009525627, -0.4995626, -4.272147, 0, 0.9686275, 1, 1,
-0.009110268, -0.9203567, -1.903468, 0, 0.9647059, 1, 1,
-0.005731259, -1.988022, -2.620297, 0, 0.9568627, 1, 1,
0.005167841, -0.4071704, 4.062949, 0, 0.9529412, 1, 1,
0.008558098, 0.01682215, 1.455729, 0, 0.945098, 1, 1,
0.01196559, 0.2428439, -1.197312, 0, 0.9411765, 1, 1,
0.0136244, -0.7385749, 2.051212, 0, 0.9333333, 1, 1,
0.01563248, 0.1320467, -0.4700848, 0, 0.9294118, 1, 1,
0.01614576, -1.090595, 3.890692, 0, 0.9215686, 1, 1,
0.01623204, -0.9253037, 2.220975, 0, 0.9176471, 1, 1,
0.02588157, -0.4126877, 3.188797, 0, 0.9098039, 1, 1,
0.02648163, 0.5268346, 1.293124, 0, 0.9058824, 1, 1,
0.0272633, -1.11577, 1.321327, 0, 0.8980392, 1, 1,
0.02799019, -1.29775, 4.164108, 0, 0.8901961, 1, 1,
0.02952203, 0.9420956, 0.2874641, 0, 0.8862745, 1, 1,
0.02978336, -0.3904776, 2.544246, 0, 0.8784314, 1, 1,
0.03001342, 0.584771, 1.465809, 0, 0.8745098, 1, 1,
0.03578507, -1.387478, 2.83982, 0, 0.8666667, 1, 1,
0.03743092, -0.8298695, 4.319283, 0, 0.8627451, 1, 1,
0.04107185, -0.4618182, 2.11541, 0, 0.854902, 1, 1,
0.04465524, 0.1101469, 1.241115, 0, 0.8509804, 1, 1,
0.05006085, -1.082645, 2.275284, 0, 0.8431373, 1, 1,
0.05735512, 1.773211, 0.4331376, 0, 0.8392157, 1, 1,
0.05784028, -1.079428, 3.892377, 0, 0.8313726, 1, 1,
0.05983717, -0.7323577, 2.51802, 0, 0.827451, 1, 1,
0.06087544, 0.1274891, 0.1117226, 0, 0.8196079, 1, 1,
0.07343004, 0.1601937, 1.794183, 0, 0.8156863, 1, 1,
0.07638117, 0.4306895, -0.824753, 0, 0.8078431, 1, 1,
0.0779556, 0.6724401, -0.5571896, 0, 0.8039216, 1, 1,
0.08035551, 0.6687039, -0.8945819, 0, 0.7960784, 1, 1,
0.08831934, -0.9862341, 2.56253, 0, 0.7882353, 1, 1,
0.09140316, -0.4154973, 2.50794, 0, 0.7843137, 1, 1,
0.09174591, -1.411222, 3.605281, 0, 0.7764706, 1, 1,
0.09677513, 1.096648, -0.5901409, 0, 0.772549, 1, 1,
0.09835705, -0.1520534, 2.895301, 0, 0.7647059, 1, 1,
0.09900819, 1.231879, -1.958342, 0, 0.7607843, 1, 1,
0.1003635, -0.2139273, 1.569454, 0, 0.7529412, 1, 1,
0.1009318, -0.06138185, 1.657542, 0, 0.7490196, 1, 1,
0.1018233, -0.2871516, 2.745809, 0, 0.7411765, 1, 1,
0.1052058, -0.6030449, 3.000883, 0, 0.7372549, 1, 1,
0.1067307, 0.4329363, -0.5009317, 0, 0.7294118, 1, 1,
0.1162738, 1.79099, 0.00853312, 0, 0.7254902, 1, 1,
0.1190175, -0.1610105, 2.593294, 0, 0.7176471, 1, 1,
0.1192198, -1.341012, 1.141107, 0, 0.7137255, 1, 1,
0.1236585, -0.3375591, 3.600644, 0, 0.7058824, 1, 1,
0.1242987, -1.951402, 1.116096, 0, 0.6980392, 1, 1,
0.1247803, -0.52705, 4.224988, 0, 0.6941177, 1, 1,
0.1249395, -0.1536986, 1.647881, 0, 0.6862745, 1, 1,
0.1300991, 0.914116, 0.714026, 0, 0.682353, 1, 1,
0.1316464, -0.8267104, 3.724156, 0, 0.6745098, 1, 1,
0.1372439, 1.279898, 0.4065708, 0, 0.6705883, 1, 1,
0.1391394, 0.1649601, 1.464721, 0, 0.6627451, 1, 1,
0.1422117, 0.2248719, 1.321655, 0, 0.6588235, 1, 1,
0.1443802, -1.80057, 1.461626, 0, 0.6509804, 1, 1,
0.1512492, -0.5176922, 3.882701, 0, 0.6470588, 1, 1,
0.1524362, -0.5449547, 1.448659, 0, 0.6392157, 1, 1,
0.1539767, 2.223089, 0.9007508, 0, 0.6352941, 1, 1,
0.1558259, -0.06301478, 1.64305, 0, 0.627451, 1, 1,
0.1565992, 0.814645, -0.2579405, 0, 0.6235294, 1, 1,
0.1571385, -0.1666509, 2.681262, 0, 0.6156863, 1, 1,
0.1586102, -0.2762318, 1.822558, 0, 0.6117647, 1, 1,
0.1594025, 1.542668, -0.1310204, 0, 0.6039216, 1, 1,
0.1610923, 0.02172976, 1.85594, 0, 0.5960785, 1, 1,
0.1658202, -0.7475052, 4.076157, 0, 0.5921569, 1, 1,
0.1690759, -0.2363356, 2.049026, 0, 0.5843138, 1, 1,
0.1748735, 0.4672744, 0.5213878, 0, 0.5803922, 1, 1,
0.1795923, 1.604122, 0.9173787, 0, 0.572549, 1, 1,
0.1921114, -0.3415385, 2.27135, 0, 0.5686275, 1, 1,
0.1929806, 0.68462, 0.6858115, 0, 0.5607843, 1, 1,
0.1934251, -0.01146916, 1.385636, 0, 0.5568628, 1, 1,
0.193778, 0.9618914, 0.1765442, 0, 0.5490196, 1, 1,
0.1962644, 1.861967, 0.02277024, 0, 0.5450981, 1, 1,
0.1976766, -0.8766351, 2.714958, 0, 0.5372549, 1, 1,
0.205829, 0.7882278, -1.445419, 0, 0.5333334, 1, 1,
0.2088984, 0.09791146, 2.969729, 0, 0.5254902, 1, 1,
0.2113535, 0.1135183, 0.6964866, 0, 0.5215687, 1, 1,
0.2122627, -0.1902196, 0.9319607, 0, 0.5137255, 1, 1,
0.2127296, -0.2264116, 3.286369, 0, 0.509804, 1, 1,
0.2232589, 0.8931398, -0.6948307, 0, 0.5019608, 1, 1,
0.2267351, 0.7385101, 0.011501, 0, 0.4941176, 1, 1,
0.2301699, -1.723613, 3.374577, 0, 0.4901961, 1, 1,
0.2311673, -0.5249997, 3.935403, 0, 0.4823529, 1, 1,
0.2312602, 2.064976, 1.475106, 0, 0.4784314, 1, 1,
0.2313946, -0.3828788, 1.963128, 0, 0.4705882, 1, 1,
0.232967, 0.7696787, -1.073389, 0, 0.4666667, 1, 1,
0.2345108, -0.4883581, 2.144197, 0, 0.4588235, 1, 1,
0.2374384, -1.753411, 1.494546, 0, 0.454902, 1, 1,
0.2390924, -0.3364605, 1.824353, 0, 0.4470588, 1, 1,
0.2452888, -0.1459595, 2.217766, 0, 0.4431373, 1, 1,
0.2472643, -1.451299, 3.005826, 0, 0.4352941, 1, 1,
0.248452, 1.222925, -0.8127517, 0, 0.4313726, 1, 1,
0.2498132, -1.040994, 3.421292, 0, 0.4235294, 1, 1,
0.2506668, -0.5759804, 3.925563, 0, 0.4196078, 1, 1,
0.2528648, -0.3986266, 2.850753, 0, 0.4117647, 1, 1,
0.2540264, 0.7592477, -0.617604, 0, 0.4078431, 1, 1,
0.2578076, 0.1972037, -0.5653483, 0, 0.4, 1, 1,
0.2581517, -0.3267738, 1.646121, 0, 0.3921569, 1, 1,
0.2608706, -0.5759355, 4.24431, 0, 0.3882353, 1, 1,
0.2614441, 1.69339, -0.8647281, 0, 0.3803922, 1, 1,
0.2626382, 1.238613, 0.9535902, 0, 0.3764706, 1, 1,
0.2672618, -0.4814986, 1.137993, 0, 0.3686275, 1, 1,
0.2684981, -1.340445, 1.027341, 0, 0.3647059, 1, 1,
0.269655, -1.074256, 1.466642, 0, 0.3568628, 1, 1,
0.2723478, -0.09142978, 3.337678, 0, 0.3529412, 1, 1,
0.2734708, 1.575924, -2.029503, 0, 0.345098, 1, 1,
0.2742239, 0.5849214, 0.589009, 0, 0.3411765, 1, 1,
0.2758487, 0.7332603, 0.3476492, 0, 0.3333333, 1, 1,
0.2779928, -0.6234633, 4.489422, 0, 0.3294118, 1, 1,
0.2786218, 1.463722, 0.3789751, 0, 0.3215686, 1, 1,
0.2788092, 0.2596571, -0.3636619, 0, 0.3176471, 1, 1,
0.2794771, 0.8323696, 0.992556, 0, 0.3098039, 1, 1,
0.2799667, -0.6483622, 1.922045, 0, 0.3058824, 1, 1,
0.28221, 2.417189, -0.4852346, 0, 0.2980392, 1, 1,
0.2892663, 0.2606168, 0.7024248, 0, 0.2901961, 1, 1,
0.2895395, 1.213107, -0.431268, 0, 0.2862745, 1, 1,
0.2909993, 0.9852292, 0.4768476, 0, 0.2784314, 1, 1,
0.2953, -1.547321, 2.952017, 0, 0.2745098, 1, 1,
0.2988671, -0.5098803, 3.917894, 0, 0.2666667, 1, 1,
0.3004439, -0.7460553, 2.024451, 0, 0.2627451, 1, 1,
0.3026448, 1.247328, -0.5270599, 0, 0.254902, 1, 1,
0.3040957, -0.0561658, 1.83026, 0, 0.2509804, 1, 1,
0.3042268, 0.006088891, 1.106918, 0, 0.2431373, 1, 1,
0.3052515, 0.05713527, 1.900576, 0, 0.2392157, 1, 1,
0.3075953, -1.110302, 4.375356, 0, 0.2313726, 1, 1,
0.3146113, 1.017031, -1.013557, 0, 0.227451, 1, 1,
0.3196681, -0.9772013, 3.118353, 0, 0.2196078, 1, 1,
0.3217874, -1.677291, 2.730077, 0, 0.2156863, 1, 1,
0.3219738, 1.59715, -1.090313, 0, 0.2078431, 1, 1,
0.3268957, -1.672404, 2.89933, 0, 0.2039216, 1, 1,
0.3288814, 1.310884, -0.6045148, 0, 0.1960784, 1, 1,
0.3317179, 0.4449287, 0.6641226, 0, 0.1882353, 1, 1,
0.3318508, 0.7273341, -0.5275502, 0, 0.1843137, 1, 1,
0.3382469, -0.1440545, 2.641104, 0, 0.1764706, 1, 1,
0.3386903, -1.041723, 2.221323, 0, 0.172549, 1, 1,
0.3399652, -0.4598467, 1.716468, 0, 0.1647059, 1, 1,
0.3431126, -0.3059888, 2.387661, 0, 0.1607843, 1, 1,
0.3438006, 0.8022225, -1.687188, 0, 0.1529412, 1, 1,
0.344413, -3.070097, 3.216295, 0, 0.1490196, 1, 1,
0.3467851, 0.7290932, 1.166956, 0, 0.1411765, 1, 1,
0.3492214, -1.159379, 2.253559, 0, 0.1372549, 1, 1,
0.3506831, -0.5924918, 2.446672, 0, 0.1294118, 1, 1,
0.3528349, 1.831548, 2.046417, 0, 0.1254902, 1, 1,
0.355051, -0.1414211, 3.750937, 0, 0.1176471, 1, 1,
0.3588387, -0.7389851, 0.7748972, 0, 0.1137255, 1, 1,
0.3625408, -0.9299135, 3.807956, 0, 0.1058824, 1, 1,
0.3641337, -0.07800665, 0.9561035, 0, 0.09803922, 1, 1,
0.3690601, -1.23573, 3.041054, 0, 0.09411765, 1, 1,
0.3699008, 0.04282406, 0.3086531, 0, 0.08627451, 1, 1,
0.3701673, 0.005812235, 1.505449, 0, 0.08235294, 1, 1,
0.3711534, -1.452225, 3.040048, 0, 0.07450981, 1, 1,
0.3766867, 1.404669, 0.2688736, 0, 0.07058824, 1, 1,
0.3819514, -0.2968601, 2.626202, 0, 0.0627451, 1, 1,
0.3833166, -1.872931, 3.546032, 0, 0.05882353, 1, 1,
0.3905294, -1.054889, 3.870548, 0, 0.05098039, 1, 1,
0.3994272, 0.1141384, 0.03429624, 0, 0.04705882, 1, 1,
0.4053538, -1.342258, 4.386075, 0, 0.03921569, 1, 1,
0.4055852, 0.01564498, 2.351816, 0, 0.03529412, 1, 1,
0.4058121, 1.66581, -1.005765, 0, 0.02745098, 1, 1,
0.4061566, -0.0934268, -0.6348762, 0, 0.02352941, 1, 1,
0.4069819, 0.05504733, 2.676479, 0, 0.01568628, 1, 1,
0.4072183, -1.966691, 3.405276, 0, 0.01176471, 1, 1,
0.407289, 0.8690848, -0.3591318, 0, 0.003921569, 1, 1,
0.4080292, -0.1572414, 0.9087298, 0.003921569, 0, 1, 1,
0.4143636, 1.632272, 0.5624076, 0.007843138, 0, 1, 1,
0.4149742, 0.1277023, 0.4206429, 0.01568628, 0, 1, 1,
0.415843, -0.2388714, 0.2873298, 0.01960784, 0, 1, 1,
0.4172138, -1.410177, 2.329628, 0.02745098, 0, 1, 1,
0.4207737, 0.7475827, 1.058949, 0.03137255, 0, 1, 1,
0.4222526, 2.232836, 0.4120993, 0.03921569, 0, 1, 1,
0.4256852, 1.763146, 1.288512, 0.04313726, 0, 1, 1,
0.4297088, -0.6350852, 2.499066, 0.05098039, 0, 1, 1,
0.4299498, -1.976619, 2.878783, 0.05490196, 0, 1, 1,
0.4318693, 1.454849, -0.3483696, 0.0627451, 0, 1, 1,
0.4327306, 1.314428, 0.19404, 0.06666667, 0, 1, 1,
0.4371695, 0.09941927, 1.278264, 0.07450981, 0, 1, 1,
0.4404677, 0.1729732, -0.02764171, 0.07843138, 0, 1, 1,
0.4453602, -0.2624712, 2.247665, 0.08627451, 0, 1, 1,
0.4459493, 0.6694071, 1.902708, 0.09019608, 0, 1, 1,
0.4460395, -0.1303504, 1.298183, 0.09803922, 0, 1, 1,
0.4501777, 0.0548868, 0.5846101, 0.1058824, 0, 1, 1,
0.453145, 0.05233007, 1.922187, 0.1098039, 0, 1, 1,
0.455696, -0.005418959, 2.520555, 0.1176471, 0, 1, 1,
0.4570543, -0.0299051, 0.8201302, 0.1215686, 0, 1, 1,
0.4575324, -1.208922, 3.721525, 0.1294118, 0, 1, 1,
0.4616106, 1.582263, -0.1739634, 0.1333333, 0, 1, 1,
0.4624218, -0.4636934, 3.269528, 0.1411765, 0, 1, 1,
0.4645688, 0.8232506, 1.072626, 0.145098, 0, 1, 1,
0.4655872, -0.5718395, 2.666549, 0.1529412, 0, 1, 1,
0.4700792, 1.915256, 0.08546562, 0.1568628, 0, 1, 1,
0.4745907, -0.4839412, 2.623784, 0.1647059, 0, 1, 1,
0.4802664, 1.770047, 2.950507, 0.1686275, 0, 1, 1,
0.4826218, 0.5742617, 1.271497, 0.1764706, 0, 1, 1,
0.4826673, -1.519255, 2.49393, 0.1803922, 0, 1, 1,
0.4867289, -1.194451, 2.948582, 0.1882353, 0, 1, 1,
0.4869229, -1.683642, 2.911296, 0.1921569, 0, 1, 1,
0.4912167, -0.9240497, 3.309714, 0.2, 0, 1, 1,
0.4926434, -0.4176236, 2.744588, 0.2078431, 0, 1, 1,
0.496918, 0.1683912, -0.4519515, 0.2117647, 0, 1, 1,
0.4982556, -1.17638, 4.69931, 0.2196078, 0, 1, 1,
0.5035172, 0.4801926, 0.3535775, 0.2235294, 0, 1, 1,
0.5041851, -0.3477743, 1.620036, 0.2313726, 0, 1, 1,
0.5076389, -0.9241627, 3.731503, 0.2352941, 0, 1, 1,
0.5084886, -0.06335361, 2.870752, 0.2431373, 0, 1, 1,
0.5093331, 0.09344407, 1.807588, 0.2470588, 0, 1, 1,
0.5136551, 1.921773, 0.8642557, 0.254902, 0, 1, 1,
0.5195976, 1.272969, 0.7631871, 0.2588235, 0, 1, 1,
0.524849, 0.4505809, 1.48818, 0.2666667, 0, 1, 1,
0.5270954, -0.6912062, 3.16791, 0.2705882, 0, 1, 1,
0.5308453, -1.340984, 2.635913, 0.2784314, 0, 1, 1,
0.5335574, 2.335933, 0.5596346, 0.282353, 0, 1, 1,
0.5372075, -0.5509667, 3.062317, 0.2901961, 0, 1, 1,
0.5418293, -0.7949548, 2.469804, 0.2941177, 0, 1, 1,
0.5459251, -1.19156, 0.5876552, 0.3019608, 0, 1, 1,
0.5507576, 0.8432016, 0.7327605, 0.3098039, 0, 1, 1,
0.5575515, -1.118576, 2.681604, 0.3137255, 0, 1, 1,
0.5586624, 0.5210848, -0.1129708, 0.3215686, 0, 1, 1,
0.5700427, 0.05358494, 1.607801, 0.3254902, 0, 1, 1,
0.5709823, 1.071166, 0.0006460292, 0.3333333, 0, 1, 1,
0.5727562, 1.867064, -0.4436652, 0.3372549, 0, 1, 1,
0.5733493, 0.03405557, 1.558403, 0.345098, 0, 1, 1,
0.5738152, -1.286384, 1.253936, 0.3490196, 0, 1, 1,
0.5754821, -0.1986171, -0.44098, 0.3568628, 0, 1, 1,
0.5764114, 0.5234491, 1.072615, 0.3607843, 0, 1, 1,
0.5773202, 0.5641835, 0.0326723, 0.3686275, 0, 1, 1,
0.5801721, -0.3198124, 0.7141085, 0.372549, 0, 1, 1,
0.5819904, -0.4961697, 1.769843, 0.3803922, 0, 1, 1,
0.5825425, 0.2381719, 3.662693, 0.3843137, 0, 1, 1,
0.5869923, 2.132172, 1.161852, 0.3921569, 0, 1, 1,
0.5894408, 1.208161, -0.940147, 0.3960784, 0, 1, 1,
0.5951111, -0.5155008, 3.725972, 0.4039216, 0, 1, 1,
0.6040186, -0.4733717, 0.4970157, 0.4117647, 0, 1, 1,
0.6146628, -1.157702, 3.457514, 0.4156863, 0, 1, 1,
0.622754, 0.2764271, 1.569634, 0.4235294, 0, 1, 1,
0.6269874, -0.3505635, 1.957654, 0.427451, 0, 1, 1,
0.6297911, -1.219678, 3.985073, 0.4352941, 0, 1, 1,
0.6301762, 0.5118145, 1.776599, 0.4392157, 0, 1, 1,
0.6401206, -0.2885892, 0.6195976, 0.4470588, 0, 1, 1,
0.6415851, -0.9771803, 1.240946, 0.4509804, 0, 1, 1,
0.6428177, 0.264624, 2.260187, 0.4588235, 0, 1, 1,
0.6458036, 0.4269101, 1.401978, 0.4627451, 0, 1, 1,
0.6483334, 0.3929876, 1.598024, 0.4705882, 0, 1, 1,
0.6529986, 0.3618972, -0.2515042, 0.4745098, 0, 1, 1,
0.6578454, -0.3374231, 0.02329023, 0.4823529, 0, 1, 1,
0.6579655, 0.9862726, 0.9568523, 0.4862745, 0, 1, 1,
0.6591759, 0.3658642, 1.712144, 0.4941176, 0, 1, 1,
0.6602576, 0.7690253, 3.555664, 0.5019608, 0, 1, 1,
0.6604736, -0.1815888, 2.493968, 0.5058824, 0, 1, 1,
0.6628558, -0.5636778, 2.925927, 0.5137255, 0, 1, 1,
0.6685892, -0.5805864, 1.144306, 0.5176471, 0, 1, 1,
0.6688364, 0.196638, 3.113149, 0.5254902, 0, 1, 1,
0.670962, -0.07688724, 1.20536, 0.5294118, 0, 1, 1,
0.6710507, -0.8576081, 2.194508, 0.5372549, 0, 1, 1,
0.671133, -1.748346, 3.286542, 0.5411765, 0, 1, 1,
0.6748121, -1.333073, 1.580916, 0.5490196, 0, 1, 1,
0.6824095, 0.937794, 2.618226, 0.5529412, 0, 1, 1,
0.6830366, -0.9130248, 1.415636, 0.5607843, 0, 1, 1,
0.6834488, -0.5311015, 1.64048, 0.5647059, 0, 1, 1,
0.6854163, -1.434486, 2.824116, 0.572549, 0, 1, 1,
0.6860062, 1.411582, 0.2949822, 0.5764706, 0, 1, 1,
0.6867322, -0.7153186, 4.155455, 0.5843138, 0, 1, 1,
0.6897234, -0.2779619, 4.174663, 0.5882353, 0, 1, 1,
0.6902218, 0.8016782, 1.145071, 0.5960785, 0, 1, 1,
0.6932236, -0.4895161, 1.541989, 0.6039216, 0, 1, 1,
0.6945101, -0.5171465, 2.681288, 0.6078432, 0, 1, 1,
0.6954995, 0.397419, 0.136234, 0.6156863, 0, 1, 1,
0.701081, -1.819433, 1.430089, 0.6196079, 0, 1, 1,
0.7031311, -1.942742, 4.739448, 0.627451, 0, 1, 1,
0.7065347, 0.3479479, 1.811925, 0.6313726, 0, 1, 1,
0.7128924, -0.3491793, 2.703723, 0.6392157, 0, 1, 1,
0.7143784, 1.909881, -0.1424632, 0.6431373, 0, 1, 1,
0.7182816, -0.6475105, 2.966103, 0.6509804, 0, 1, 1,
0.7222873, 0.377344, -0.2867953, 0.654902, 0, 1, 1,
0.724219, -0.08748206, 1.821661, 0.6627451, 0, 1, 1,
0.7289148, 0.3846571, 1.696712, 0.6666667, 0, 1, 1,
0.7342482, -0.5617746, 0.9992055, 0.6745098, 0, 1, 1,
0.7375792, -0.4929812, 2.849814, 0.6784314, 0, 1, 1,
0.7415738, 0.3727756, -0.0002592705, 0.6862745, 0, 1, 1,
0.7467236, -0.09134912, 0.467014, 0.6901961, 0, 1, 1,
0.7468662, 0.2853902, 0.7785245, 0.6980392, 0, 1, 1,
0.7507429, -0.274563, 3.039973, 0.7058824, 0, 1, 1,
0.7515875, 0.4983483, 0.1565022, 0.7098039, 0, 1, 1,
0.7526547, -0.1110227, 4.169102, 0.7176471, 0, 1, 1,
0.7546238, 2.586149, 0.3025085, 0.7215686, 0, 1, 1,
0.7583982, 0.55277, 1.807485, 0.7294118, 0, 1, 1,
0.7600201, 1.869397, 0.6515853, 0.7333333, 0, 1, 1,
0.7603805, 0.6611735, 0.4990664, 0.7411765, 0, 1, 1,
0.7688711, -1.04575, 2.251101, 0.7450981, 0, 1, 1,
0.7700678, -1.02191, 2.734152, 0.7529412, 0, 1, 1,
0.7713568, 1.290607, 0.4920777, 0.7568628, 0, 1, 1,
0.7725467, 1.964271, 0.2636383, 0.7647059, 0, 1, 1,
0.7801273, 0.2901372, 0.9450995, 0.7686275, 0, 1, 1,
0.7801287, -0.2846207, 3.23484, 0.7764706, 0, 1, 1,
0.7808006, 1.936396, 0.6008278, 0.7803922, 0, 1, 1,
0.7916119, 0.4272289, 0.4211049, 0.7882353, 0, 1, 1,
0.7943913, -0.04160152, 2.885314, 0.7921569, 0, 1, 1,
0.7976988, 1.528834, 1.747359, 0.8, 0, 1, 1,
0.801433, 0.2614092, 0.9407099, 0.8078431, 0, 1, 1,
0.8127308, -1.432229, 2.602709, 0.8117647, 0, 1, 1,
0.8188186, 0.06076649, 2.280757, 0.8196079, 0, 1, 1,
0.8201161, -1.41234, 3.23303, 0.8235294, 0, 1, 1,
0.8205302, -0.3832344, 1.358297, 0.8313726, 0, 1, 1,
0.8207884, -0.8920547, 4.020201, 0.8352941, 0, 1, 1,
0.8266085, 1.391327, 1.571254, 0.8431373, 0, 1, 1,
0.8298864, -1.342057, 2.793941, 0.8470588, 0, 1, 1,
0.8368859, 1.658937, -0.3893583, 0.854902, 0, 1, 1,
0.8424796, 1.189166, -0.3174443, 0.8588235, 0, 1, 1,
0.8449242, 1.833531, 0.9369723, 0.8666667, 0, 1, 1,
0.8506022, 3.009477, 1.580669, 0.8705882, 0, 1, 1,
0.8591083, 0.7263656, -0.6764621, 0.8784314, 0, 1, 1,
0.862495, 1.372416, 1.180982, 0.8823529, 0, 1, 1,
0.8673119, 0.5800028, 1.206365, 0.8901961, 0, 1, 1,
0.8766999, -0.2004201, 2.815987, 0.8941177, 0, 1, 1,
0.8779946, 1.114354, 0.5255389, 0.9019608, 0, 1, 1,
0.8782037, 0.3123398, 2.08205, 0.9098039, 0, 1, 1,
0.883128, -0.5201274, 2.985132, 0.9137255, 0, 1, 1,
0.8940873, -0.4813223, 1.678286, 0.9215686, 0, 1, 1,
0.8941266, -0.5831184, 5.351713, 0.9254902, 0, 1, 1,
0.8944831, -0.8361433, 2.831115, 0.9333333, 0, 1, 1,
0.8982323, -2.450791, 3.425803, 0.9372549, 0, 1, 1,
0.9008199, -1.379333, 3.816334, 0.945098, 0, 1, 1,
0.9011482, -0.04178315, 0.5102218, 0.9490196, 0, 1, 1,
0.9013832, 1.346459, 1.045411, 0.9568627, 0, 1, 1,
0.9056216, -1.238505, 4.131295, 0.9607843, 0, 1, 1,
0.9082382, -0.7101329, 4.101824, 0.9686275, 0, 1, 1,
0.910877, -1.322316, 1.979181, 0.972549, 0, 1, 1,
0.9144647, 0.6516889, 1.189692, 0.9803922, 0, 1, 1,
0.9147018, -1.836192, 3.96385, 0.9843137, 0, 1, 1,
0.9178454, -2.013443, 3.26008, 0.9921569, 0, 1, 1,
0.9284431, 0.237735, -0.2194794, 0.9960784, 0, 1, 1,
0.9366028, 1.050922, 1.040682, 1, 0, 0.9960784, 1,
0.9431052, 0.6325825, 0.3806956, 1, 0, 0.9882353, 1,
0.9548964, 0.1577102, 2.484819, 1, 0, 0.9843137, 1,
0.9585963, 0.7323207, 1.001389, 1, 0, 0.9764706, 1,
0.9670066, -0.145618, 0.48237, 1, 0, 0.972549, 1,
0.9706566, -0.873292, 2.336585, 1, 0, 0.9647059, 1,
0.9720395, -0.3606129, 3.073503, 1, 0, 0.9607843, 1,
0.9805494, 1.35206, 2.872552, 1, 0, 0.9529412, 1,
0.9828253, 0.2434061, 1.077044, 1, 0, 0.9490196, 1,
0.9888972, -0.145991, -0.5118795, 1, 0, 0.9411765, 1,
0.9891927, -0.04227515, 1.267886, 1, 0, 0.9372549, 1,
0.9949976, 0.8978768, -0.1784155, 1, 0, 0.9294118, 1,
0.9952807, -1.0153, 3.122708, 1, 0, 0.9254902, 1,
0.9955866, -0.3114663, 3.947752, 1, 0, 0.9176471, 1,
0.9968119, 1.40693, -0.4237815, 1, 0, 0.9137255, 1,
1.005348, -0.07898729, 0.8556917, 1, 0, 0.9058824, 1,
1.006081, -0.05115162, 1.510383, 1, 0, 0.9019608, 1,
1.007989, 1.310919, 2.689988, 1, 0, 0.8941177, 1,
1.00939, 0.3827232, 1.554946, 1, 0, 0.8862745, 1,
1.011869, 0.1483674, 2.790552, 1, 0, 0.8823529, 1,
1.012859, -0.01434545, 3.057194, 1, 0, 0.8745098, 1,
1.023946, -1.398304, 4.082035, 1, 0, 0.8705882, 1,
1.027573, -0.0928307, 1.377013, 1, 0, 0.8627451, 1,
1.065375, 0.1478635, 0.7390046, 1, 0, 0.8588235, 1,
1.076198, 0.7186454, -0.004677557, 1, 0, 0.8509804, 1,
1.097756, 1.922862, 1.408686, 1, 0, 0.8470588, 1,
1.099367, 1.305661, 1.563847, 1, 0, 0.8392157, 1,
1.101572, 0.9936447, 1.194576, 1, 0, 0.8352941, 1,
1.101776, -0.3022583, 2.001281, 1, 0, 0.827451, 1,
1.127098, 0.4470665, 0.6731023, 1, 0, 0.8235294, 1,
1.134778, -0.4921775, 1.337727, 1, 0, 0.8156863, 1,
1.136076, -0.9827821, 4.522441, 1, 0, 0.8117647, 1,
1.137614, -0.9822242, 1.643006, 1, 0, 0.8039216, 1,
1.138267, -0.1897007, 0.8064401, 1, 0, 0.7960784, 1,
1.141238, -0.3532513, 3.26148, 1, 0, 0.7921569, 1,
1.151429, -0.1235816, 0.5131829, 1, 0, 0.7843137, 1,
1.153272, -0.6857783, 1.100648, 1, 0, 0.7803922, 1,
1.157147, 0.02798922, 1.190804, 1, 0, 0.772549, 1,
1.158192, 0.3904791, 1.319725, 1, 0, 0.7686275, 1,
1.162375, 0.6759201, 0.3703562, 1, 0, 0.7607843, 1,
1.166613, -1.069443, 3.780496, 1, 0, 0.7568628, 1,
1.178131, -0.8684514, 2.13538, 1, 0, 0.7490196, 1,
1.18537, 1.457382, 0.51367, 1, 0, 0.7450981, 1,
1.185622, 0.479744, 0.927672, 1, 0, 0.7372549, 1,
1.192626, 0.6699456, -0.4502617, 1, 0, 0.7333333, 1,
1.197801, 0.2817807, 0.6211122, 1, 0, 0.7254902, 1,
1.199506, -0.1905679, -0.2182118, 1, 0, 0.7215686, 1,
1.201037, 0.3416753, 0.5905926, 1, 0, 0.7137255, 1,
1.204059, -0.09886802, 1.400548, 1, 0, 0.7098039, 1,
1.214263, -0.9979903, 1.624012, 1, 0, 0.7019608, 1,
1.218421, -0.6371037, 3.009472, 1, 0, 0.6941177, 1,
1.230817, -0.1461757, 2.237383, 1, 0, 0.6901961, 1,
1.231837, 0.2564305, 1.408472, 1, 0, 0.682353, 1,
1.252351, -1.131574, 2.759387, 1, 0, 0.6784314, 1,
1.257765, -0.5163598, 1.32448, 1, 0, 0.6705883, 1,
1.26552, -0.5782164, 3.772046, 1, 0, 0.6666667, 1,
1.266887, -0.8857648, -0.1774626, 1, 0, 0.6588235, 1,
1.279454, -0.7218054, 1.758623, 1, 0, 0.654902, 1,
1.280565, -0.1478618, 2.330123, 1, 0, 0.6470588, 1,
1.294967, -0.7543729, 3.003409, 1, 0, 0.6431373, 1,
1.300636, -0.3699682, -0.4539098, 1, 0, 0.6352941, 1,
1.301858, 0.05914395, 3.880713, 1, 0, 0.6313726, 1,
1.309314, 0.9446086, -1.180032, 1, 0, 0.6235294, 1,
1.31496, 0.5694559, 1.817195, 1, 0, 0.6196079, 1,
1.316412, -0.7786555, 2.843498, 1, 0, 0.6117647, 1,
1.321157, -1.534101, 1.262935, 1, 0, 0.6078432, 1,
1.33414, 1.154784, 0.3394747, 1, 0, 0.6, 1,
1.337098, 1.586363, -0.3692014, 1, 0, 0.5921569, 1,
1.343751, -0.1312279, 1.337647, 1, 0, 0.5882353, 1,
1.347033, -0.6440959, 0.2448464, 1, 0, 0.5803922, 1,
1.353258, 0.5644339, 2.360512, 1, 0, 0.5764706, 1,
1.364451, 0.890512, 1.003429, 1, 0, 0.5686275, 1,
1.369852, 1.20669, -0.5168662, 1, 0, 0.5647059, 1,
1.386942, -0.5524701, 2.575989, 1, 0, 0.5568628, 1,
1.404682, 0.3645801, 0.815659, 1, 0, 0.5529412, 1,
1.408497, -1.107807, 2.041059, 1, 0, 0.5450981, 1,
1.426868, 0.6411716, 0.3594379, 1, 0, 0.5411765, 1,
1.428083, -1.613483, 0.8697721, 1, 0, 0.5333334, 1,
1.431564, 1.310962, 1.726896, 1, 0, 0.5294118, 1,
1.434256, 0.2864554, 2.466608, 1, 0, 0.5215687, 1,
1.44529, 0.4970269, 1.059993, 1, 0, 0.5176471, 1,
1.450454, 0.5186334, 1.998576, 1, 0, 0.509804, 1,
1.467768, 1.561738, 1.136244, 1, 0, 0.5058824, 1,
1.473163, 0.7550762, 2.679515, 1, 0, 0.4980392, 1,
1.482496, 0.8785608, 0.5619524, 1, 0, 0.4901961, 1,
1.486, 0.4187448, 2.318738, 1, 0, 0.4862745, 1,
1.4973, 0.2280883, 2.943589, 1, 0, 0.4784314, 1,
1.513641, -3.509155, 3.636892, 1, 0, 0.4745098, 1,
1.515809, 0.1224826, 0.1701443, 1, 0, 0.4666667, 1,
1.516049, -0.2287214, 3.562485, 1, 0, 0.4627451, 1,
1.526638, 0.424356, 1.097611, 1, 0, 0.454902, 1,
1.548742, -0.5981552, 2.598161, 1, 0, 0.4509804, 1,
1.553637, 0.1937585, 2.688728, 1, 0, 0.4431373, 1,
1.557519, -0.1083183, 0.8653544, 1, 0, 0.4392157, 1,
1.559437, 0.4514502, 1.848632, 1, 0, 0.4313726, 1,
1.563283, 0.8321054, -0.0681989, 1, 0, 0.427451, 1,
1.563352, -0.3438645, 2.40206, 1, 0, 0.4196078, 1,
1.566724, 1.40755, -0.2859345, 1, 0, 0.4156863, 1,
1.582665, -1.115808, 1.261184, 1, 0, 0.4078431, 1,
1.591487, 0.577345, 1.728175, 1, 0, 0.4039216, 1,
1.59409, -0.06734788, 2.054557, 1, 0, 0.3960784, 1,
1.596613, 0.4912074, -0.2006294, 1, 0, 0.3882353, 1,
1.60613, 0.3082761, 2.500368, 1, 0, 0.3843137, 1,
1.614586, 0.9853467, 0.861957, 1, 0, 0.3764706, 1,
1.625418, -0.9561965, 0.7840434, 1, 0, 0.372549, 1,
1.630703, -0.6712371, 1.037237, 1, 0, 0.3647059, 1,
1.640358, 0.8383933, 0.4954612, 1, 0, 0.3607843, 1,
1.660798, -0.530966, 1.854339, 1, 0, 0.3529412, 1,
1.682044, 1.551868, 1.142524, 1, 0, 0.3490196, 1,
1.687047, -0.9334579, 3.376088, 1, 0, 0.3411765, 1,
1.688477, 1.733967, -0.9539387, 1, 0, 0.3372549, 1,
1.696561, 1.184381, 0.2141197, 1, 0, 0.3294118, 1,
1.700228, 0.1365421, 0.6824234, 1, 0, 0.3254902, 1,
1.70843, -0.4154161, 2.494118, 1, 0, 0.3176471, 1,
1.735205, 0.9168444, -0.05223184, 1, 0, 0.3137255, 1,
1.73671, 0.8457958, 2.501215, 1, 0, 0.3058824, 1,
1.738035, 0.5192056, 1.398172, 1, 0, 0.2980392, 1,
1.768811, 0.2750235, 0.7510667, 1, 0, 0.2941177, 1,
1.779025, 1.39343, 1.461873, 1, 0, 0.2862745, 1,
1.781817, 0.9561014, -1.20867, 1, 0, 0.282353, 1,
1.808593, -1.019448, 0.9470125, 1, 0, 0.2745098, 1,
1.827954, 0.3877609, 1.089324, 1, 0, 0.2705882, 1,
1.834687, -0.3722698, 1.992096, 1, 0, 0.2627451, 1,
1.838073, 0.7828587, 2.706194, 1, 0, 0.2588235, 1,
1.842409, -0.08550251, 2.676971, 1, 0, 0.2509804, 1,
1.84643, 1.180284, 1.451017, 1, 0, 0.2470588, 1,
1.856023, -0.3853133, 1.912041, 1, 0, 0.2392157, 1,
1.860249, 1.397069, 2.278585, 1, 0, 0.2352941, 1,
1.862342, -0.7391936, 0.5727672, 1, 0, 0.227451, 1,
1.864442, 0.9180185, 0.2860021, 1, 0, 0.2235294, 1,
1.917621, -0.5493187, 2.569712, 1, 0, 0.2156863, 1,
1.919638, 0.3700276, 0.853107, 1, 0, 0.2117647, 1,
1.921355, 1.95158, 2.063389, 1, 0, 0.2039216, 1,
1.957857, 0.5090171, 2.39084, 1, 0, 0.1960784, 1,
1.975701, 0.2969113, 0.7269239, 1, 0, 0.1921569, 1,
1.975846, -1.360162, 2.207317, 1, 0, 0.1843137, 1,
1.980312, 0.2206425, 1.369195, 1, 0, 0.1803922, 1,
1.993562, -0.2437796, 0.5945852, 1, 0, 0.172549, 1,
1.998577, 0.1596805, 1.169855, 1, 0, 0.1686275, 1,
2.002337, -0.1549192, 2.732252, 1, 0, 0.1607843, 1,
2.008416, -0.01929904, 1.966264, 1, 0, 0.1568628, 1,
2.020226, 1.590087, 0.5854545, 1, 0, 0.1490196, 1,
2.063795, 1.430425, 2.450947, 1, 0, 0.145098, 1,
2.126718, 0.1290665, 1.342879, 1, 0, 0.1372549, 1,
2.146252, 0.7239366, 1.448117, 1, 0, 0.1333333, 1,
2.193445, -0.1685582, 3.109023, 1, 0, 0.1254902, 1,
2.197265, -0.9574544, 3.064162, 1, 0, 0.1215686, 1,
2.197568, 0.8351585, 0.5096413, 1, 0, 0.1137255, 1,
2.242478, 1.880101, 0.9542242, 1, 0, 0.1098039, 1,
2.261334, 0.01627047, 1.727523, 1, 0, 0.1019608, 1,
2.26158, 1.552331, 2.292006, 1, 0, 0.09411765, 1,
2.298219, -0.3250103, 1.405424, 1, 0, 0.09019608, 1,
2.311237, 2.103957, 1.439873, 1, 0, 0.08235294, 1,
2.332955, 0.1596137, 3.189474, 1, 0, 0.07843138, 1,
2.533509, -0.7687145, 1.473365, 1, 0, 0.07058824, 1,
2.540509, 0.04617888, 0.9756421, 1, 0, 0.06666667, 1,
2.549332, -0.500812, 1.119395, 1, 0, 0.05882353, 1,
2.550496, 0.1522338, 1.210924, 1, 0, 0.05490196, 1,
2.595576, -1.050046, 2.081269, 1, 0, 0.04705882, 1,
2.666746, -0.8513331, 3.403536, 1, 0, 0.04313726, 1,
2.714163, 0.7353979, 1.340673, 1, 0, 0.03529412, 1,
2.733385, -0.5246956, 1.372284, 1, 0, 0.03137255, 1,
2.763019, -0.4719702, 0.7632923, 1, 0, 0.02352941, 1,
2.857715, -1.082397, 2.474232, 1, 0, 0.01960784, 1,
3.023057, 0.5134038, 2.509614, 1, 0, 0.01176471, 1,
3.417827, 0.860471, 1.480433, 1, 0, 0.007843138, 1
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
0.2118068, -4.614064, -7.163742, 0, -0.5, 0.5, 0.5,
0.2118068, -4.614064, -7.163742, 1, -0.5, 0.5, 0.5,
0.2118068, -4.614064, -7.163742, 1, 1.5, 0.5, 0.5,
0.2118068, -4.614064, -7.163742, 0, 1.5, 0.5, 0.5
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
-4.081055, -0.2498389, -7.163742, 0, -0.5, 0.5, 0.5,
-4.081055, -0.2498389, -7.163742, 1, -0.5, 0.5, 0.5,
-4.081055, -0.2498389, -7.163742, 1, 1.5, 0.5, 0.5,
-4.081055, -0.2498389, -7.163742, 0, 1.5, 0.5, 0.5
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
-4.081055, -4.614064, 0.0009412766, 0, -0.5, 0.5, 0.5,
-4.081055, -4.614064, 0.0009412766, 1, -0.5, 0.5, 0.5,
-4.081055, -4.614064, 0.0009412766, 1, 1.5, 0.5, 0.5,
-4.081055, -4.614064, 0.0009412766, 0, 1.5, 0.5, 0.5
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
-2, -3.606935, -5.510354,
3, -3.606935, -5.510354,
-2, -3.606935, -5.510354,
-2, -3.77479, -5.785919,
-1, -3.606935, -5.510354,
-1, -3.77479, -5.785919,
0, -3.606935, -5.510354,
0, -3.77479, -5.785919,
1, -3.606935, -5.510354,
1, -3.77479, -5.785919,
2, -3.606935, -5.510354,
2, -3.77479, -5.785919,
3, -3.606935, -5.510354,
3, -3.77479, -5.785919
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
-2, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
-2, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
-2, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
-2, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5,
-1, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
-1, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
-1, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
-1, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5,
0, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
0, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
0, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
0, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5,
1, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
1, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
1, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
1, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5,
2, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
2, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
2, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
2, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5,
3, -4.110499, -6.337048, 0, -0.5, 0.5, 0.5,
3, -4.110499, -6.337048, 1, -0.5, 0.5, 0.5,
3, -4.110499, -6.337048, 1, 1.5, 0.5, 0.5,
3, -4.110499, -6.337048, 0, 1.5, 0.5, 0.5
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
-3.090394, -3, -5.510354,
-3.090394, 3, -5.510354,
-3.090394, -3, -5.510354,
-3.255505, -3, -5.785919,
-3.090394, -2, -5.510354,
-3.255505, -2, -5.785919,
-3.090394, -1, -5.510354,
-3.255505, -1, -5.785919,
-3.090394, 0, -5.510354,
-3.255505, 0, -5.785919,
-3.090394, 1, -5.510354,
-3.255505, 1, -5.785919,
-3.090394, 2, -5.510354,
-3.255505, 2, -5.785919,
-3.090394, 3, -5.510354,
-3.255505, 3, -5.785919
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
-3.585725, -3, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, -3, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, -3, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, -3, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, -2, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, -2, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, -2, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, -2, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, -1, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, -1, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, -1, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, -1, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, 0, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, 0, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, 0, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, 0, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, 1, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, 1, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, 1, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, 1, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, 2, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, 2, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, 2, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, 2, -6.337048, 0, 1.5, 0.5, 0.5,
-3.585725, 3, -6.337048, 0, -0.5, 0.5, 0.5,
-3.585725, 3, -6.337048, 1, -0.5, 0.5, 0.5,
-3.585725, 3, -6.337048, 1, 1.5, 0.5, 0.5,
-3.585725, 3, -6.337048, 0, 1.5, 0.5, 0.5
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
-3.090394, -3.606935, -4,
-3.090394, -3.606935, 4,
-3.090394, -3.606935, -4,
-3.255505, -3.77479, -4,
-3.090394, -3.606935, -2,
-3.255505, -3.77479, -2,
-3.090394, -3.606935, 0,
-3.255505, -3.77479, 0,
-3.090394, -3.606935, 2,
-3.255505, -3.77479, 2,
-3.090394, -3.606935, 4,
-3.255505, -3.77479, 4
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
-3.585725, -4.110499, -4, 0, -0.5, 0.5, 0.5,
-3.585725, -4.110499, -4, 1, -0.5, 0.5, 0.5,
-3.585725, -4.110499, -4, 1, 1.5, 0.5, 0.5,
-3.585725, -4.110499, -4, 0, 1.5, 0.5, 0.5,
-3.585725, -4.110499, -2, 0, -0.5, 0.5, 0.5,
-3.585725, -4.110499, -2, 1, -0.5, 0.5, 0.5,
-3.585725, -4.110499, -2, 1, 1.5, 0.5, 0.5,
-3.585725, -4.110499, -2, 0, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 0, 0, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 0, 1, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 0, 1, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 0, 0, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 2, 0, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 2, 1, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 2, 1, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 2, 0, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 4, 0, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 4, 1, -0.5, 0.5, 0.5,
-3.585725, -4.110499, 4, 1, 1.5, 0.5, 0.5,
-3.585725, -4.110499, 4, 0, 1.5, 0.5, 0.5
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
-3.090394, -3.606935, -5.510354,
-3.090394, 3.107257, -5.510354,
-3.090394, -3.606935, 5.512236,
-3.090394, 3.107257, 5.512236,
-3.090394, -3.606935, -5.510354,
-3.090394, -3.606935, 5.512236,
-3.090394, 3.107257, -5.510354,
-3.090394, 3.107257, 5.512236,
-3.090394, -3.606935, -5.510354,
3.514008, -3.606935, -5.510354,
-3.090394, -3.606935, 5.512236,
3.514008, -3.606935, 5.512236,
-3.090394, 3.107257, -5.510354,
3.514008, 3.107257, -5.510354,
-3.090394, 3.107257, 5.512236,
3.514008, 3.107257, 5.512236,
3.514008, -3.606935, -5.510354,
3.514008, 3.107257, -5.510354,
3.514008, -3.606935, 5.512236,
3.514008, 3.107257, 5.512236,
3.514008, -3.606935, -5.510354,
3.514008, -3.606935, 5.512236,
3.514008, 3.107257, -5.510354,
3.514008, 3.107257, 5.512236
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
var radius = 7.741724;
var distance = 34.44381;
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
mvMatrix.translate( -0.2118068, 0.2498389, -0.0009412766 );
mvMatrix.scale( 1.267413, 1.246688, 0.7593954 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.44381);
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
Anisol<-read.table("Anisol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Anisol$V2
```

```
## Error in eval(expr, envir, enclos): object 'Anisol' not found
```

```r
y<-Anisol$V3
```

```
## Error in eval(expr, envir, enclos): object 'Anisol' not found
```

```r
z<-Anisol$V4
```

```
## Error in eval(expr, envir, enclos): object 'Anisol' not found
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
-2.994214, -0.6992232, -0.2239731, 0, 0, 1, 1, 1,
-2.951644, -0.03812887, -0.6481349, 1, 0, 0, 1, 1,
-2.819694, -1.341769, -2.893456, 1, 0, 0, 1, 1,
-2.698206, -1.063073, -1.880376, 1, 0, 0, 1, 1,
-2.417794, -1.055132, -3.111669, 1, 0, 0, 1, 1,
-2.401352, -1.196362, -1.129249, 1, 0, 0, 1, 1,
-2.326094, 1.004534, -0.5728264, 0, 0, 0, 1, 1,
-2.326003, 0.03766981, -1.526013, 0, 0, 0, 1, 1,
-2.193249, 0.1309925, -2.030854, 0, 0, 0, 1, 1,
-2.189696, 0.6472376, -1.31734, 0, 0, 0, 1, 1,
-2.168289, 0.5020064, -1.81268, 0, 0, 0, 1, 1,
-2.152842, -0.5952867, -1.949608, 0, 0, 0, 1, 1,
-2.1469, 0.09874757, 0.3510365, 0, 0, 0, 1, 1,
-2.136961, -0.6786712, -0.7775487, 1, 1, 1, 1, 1,
-2.133495, -1.048462, -2.279146, 1, 1, 1, 1, 1,
-2.131542, 0.7532671, -0.8762518, 1, 1, 1, 1, 1,
-2.10674, -1.264207, -1.600895, 1, 1, 1, 1, 1,
-2.081783, 1.289548, -2.341389, 1, 1, 1, 1, 1,
-2.028371, -0.5377814, -0.8910477, 1, 1, 1, 1, 1,
-2.010087, 0.04909204, -0.6741231, 1, 1, 1, 1, 1,
-1.994744, 0.6372679, -1.668102, 1, 1, 1, 1, 1,
-1.955395, -1.52882, -1.076574, 1, 1, 1, 1, 1,
-1.92859, 1.090515, -0.2035086, 1, 1, 1, 1, 1,
-1.921722, -0.9435354, -0.7503536, 1, 1, 1, 1, 1,
-1.909463, 2.707727, -1.612128, 1, 1, 1, 1, 1,
-1.903111, 0.3402859, -0.2931286, 1, 1, 1, 1, 1,
-1.897702, -0.539108, -1.748041, 1, 1, 1, 1, 1,
-1.875696, 0.834506, -1.871818, 1, 1, 1, 1, 1,
-1.856537, 2.774725, -3.017839, 0, 0, 1, 1, 1,
-1.848315, 0.3037427, -1.643539, 1, 0, 0, 1, 1,
-1.845996, -0.5203114, -0.1856051, 1, 0, 0, 1, 1,
-1.841675, 0.04033911, -1.696234, 1, 0, 0, 1, 1,
-1.823173, 0.6872979, -2.932571, 1, 0, 0, 1, 1,
-1.811187, 0.1017218, -1.864935, 1, 0, 0, 1, 1,
-1.787714, 2.329178, -1.553403, 0, 0, 0, 1, 1,
-1.774275, -0.09336856, -0.7212209, 0, 0, 0, 1, 1,
-1.770192, 1.21236, -0.1548453, 0, 0, 0, 1, 1,
-1.757226, 0.2876213, -0.3936622, 0, 0, 0, 1, 1,
-1.756659, -0.3881577, -1.475222, 0, 0, 0, 1, 1,
-1.75469, 0.9529595, -0.8828614, 0, 0, 0, 1, 1,
-1.731657, -0.6501279, -0.4231893, 0, 0, 0, 1, 1,
-1.72681, 0.4590002, 0.06278042, 1, 1, 1, 1, 1,
-1.724085, -0.8745235, -1.192912, 1, 1, 1, 1, 1,
-1.674828, 0.6160454, -1.005006, 1, 1, 1, 1, 1,
-1.673822, 0.6784783, -2.472102, 1, 1, 1, 1, 1,
-1.660724, 1.722332, -0.6112297, 1, 1, 1, 1, 1,
-1.659783, 0.3044038, -2.212052, 1, 1, 1, 1, 1,
-1.648967, 0.438109, -1.082401, 1, 1, 1, 1, 1,
-1.646584, -1.234492, -3.366678, 1, 1, 1, 1, 1,
-1.635385, -0.5134895, -3.479402, 1, 1, 1, 1, 1,
-1.602052, -0.9728662, -3.292259, 1, 1, 1, 1, 1,
-1.592953, 0.2236414, -0.5591231, 1, 1, 1, 1, 1,
-1.587749, -0.3910784, -2.0247, 1, 1, 1, 1, 1,
-1.565543, -0.07070963, -1.117021, 1, 1, 1, 1, 1,
-1.561557, -0.7588887, -0.8278328, 1, 1, 1, 1, 1,
-1.556476, -0.9061506, -0.8919595, 1, 1, 1, 1, 1,
-1.556144, 0.9558746, -1.270189, 0, 0, 1, 1, 1,
-1.552016, 1.215634, -2.22788, 1, 0, 0, 1, 1,
-1.550797, -0.003505544, -2.414886, 1, 0, 0, 1, 1,
-1.537497, -0.7760513, -1.52668, 1, 0, 0, 1, 1,
-1.529454, 0.3993925, -2.476189, 1, 0, 0, 1, 1,
-1.526989, -1.107551, -1.283834, 1, 0, 0, 1, 1,
-1.5206, -0.5456083, -2.151446, 0, 0, 0, 1, 1,
-1.516916, -0.6858733, -1.415405, 0, 0, 0, 1, 1,
-1.512654, -0.8760949, -2.819442, 0, 0, 0, 1, 1,
-1.494466, -0.1972743, -2.730711, 0, 0, 0, 1, 1,
-1.492936, 1.588553, -1.117278, 0, 0, 0, 1, 1,
-1.491203, 0.6569704, 0.02637787, 0, 0, 0, 1, 1,
-1.483512, 0.4346835, -1.653787, 0, 0, 0, 1, 1,
-1.464088, -1.066068, -1.723006, 1, 1, 1, 1, 1,
-1.461652, 0.6953904, -2.350052, 1, 1, 1, 1, 1,
-1.46033, 0.3279247, -1.195047, 1, 1, 1, 1, 1,
-1.460017, -0.8990644, -2.980394, 1, 1, 1, 1, 1,
-1.458823, 0.168251, 0.8635885, 1, 1, 1, 1, 1,
-1.451037, 0.04039935, 0.1513488, 1, 1, 1, 1, 1,
-1.444571, -0.3250207, -2.287297, 1, 1, 1, 1, 1,
-1.438639, -0.4016448, -1.343896, 1, 1, 1, 1, 1,
-1.435485, -0.1717096, -1.699324, 1, 1, 1, 1, 1,
-1.422214, 0.5546442, -0.003968787, 1, 1, 1, 1, 1,
-1.418312, -1.648975, -1.996143, 1, 1, 1, 1, 1,
-1.40126, -0.5327067, -1.106602, 1, 1, 1, 1, 1,
-1.397829, -0.5166451, -3.67012, 1, 1, 1, 1, 1,
-1.391063, 0.8197606, -1.02453, 1, 1, 1, 1, 1,
-1.390189, -0.6767403, -3.341237, 1, 1, 1, 1, 1,
-1.383983, 0.6236714, 0.9612389, 0, 0, 1, 1, 1,
-1.379923, -0.1508709, -3.47787, 1, 0, 0, 1, 1,
-1.378608, -0.06821765, -2.92134, 1, 0, 0, 1, 1,
-1.378232, -0.5847354, -0.5175554, 1, 0, 0, 1, 1,
-1.375681, -1.798937, 0.4230917, 1, 0, 0, 1, 1,
-1.367805, 1.126301, -1.335063, 1, 0, 0, 1, 1,
-1.363668, -1.310044, -3.760085, 0, 0, 0, 1, 1,
-1.3447, 0.74258, -0.7614644, 0, 0, 0, 1, 1,
-1.3441, -0.4080166, -1.663993, 0, 0, 0, 1, 1,
-1.34049, -0.6621043, -2.052924, 0, 0, 0, 1, 1,
-1.331459, 0.5886236, -0.7324433, 0, 0, 0, 1, 1,
-1.323811, 0.1863153, -2.745828, 0, 0, 0, 1, 1,
-1.323221, 0.9565199, -0.7910224, 0, 0, 0, 1, 1,
-1.320505, 0.1091029, 0.500918, 1, 1, 1, 1, 1,
-1.319706, -1.359677, -3.721132, 1, 1, 1, 1, 1,
-1.311922, -0.1912009, -1.462912, 1, 1, 1, 1, 1,
-1.306974, -0.4464326, -2.944061, 1, 1, 1, 1, 1,
-1.302145, 0.7164671, -1.312289, 1, 1, 1, 1, 1,
-1.288417, -2.05558, -3.630524, 1, 1, 1, 1, 1,
-1.28788, 0.906238, -0.3296061, 1, 1, 1, 1, 1,
-1.283066, -0.434929, -2.1176, 1, 1, 1, 1, 1,
-1.273347, -0.4331762, -3.059351, 1, 1, 1, 1, 1,
-1.272762, -1.660655, -2.902483, 1, 1, 1, 1, 1,
-1.269006, 1.591998, -0.484332, 1, 1, 1, 1, 1,
-1.26759, -0.1690784, -2.951715, 1, 1, 1, 1, 1,
-1.25717, -2.242579, -2.523866, 1, 1, 1, 1, 1,
-1.251808, -0.06402797, -0.60795, 1, 1, 1, 1, 1,
-1.244143, 0.5363371, -0.9919558, 1, 1, 1, 1, 1,
-1.243783, 0.1138059, 0.8539639, 0, 0, 1, 1, 1,
-1.242562, 0.4644586, -0.9463066, 1, 0, 0, 1, 1,
-1.239777, 0.001778964, -0.4509894, 1, 0, 0, 1, 1,
-1.23545, -2.454985, -1.548476, 1, 0, 0, 1, 1,
-1.233439, -1.727291, -1.92503, 1, 0, 0, 1, 1,
-1.230962, 0.5501463, -1.643463, 1, 0, 0, 1, 1,
-1.229199, -0.7451217, -2.429195, 0, 0, 0, 1, 1,
-1.228282, 0.4677086, -0.5184703, 0, 0, 0, 1, 1,
-1.22616, -0.3476935, -0.8585712, 0, 0, 0, 1, 1,
-1.219067, 0.2574331, -1.441223, 0, 0, 0, 1, 1,
-1.216269, -0.1914263, -0.5587055, 0, 0, 0, 1, 1,
-1.201481, 1.22428, 0.8392913, 0, 0, 0, 1, 1,
-1.200347, -0.868259, -1.894436, 0, 0, 0, 1, 1,
-1.199131, -0.6020257, -2.743964, 1, 1, 1, 1, 1,
-1.190213, 0.09572975, -2.705423, 1, 1, 1, 1, 1,
-1.188933, -0.7755741, -2.341177, 1, 1, 1, 1, 1,
-1.187828, -0.3367025, -2.6423, 1, 1, 1, 1, 1,
-1.186195, 0.7392431, -1.899618, 1, 1, 1, 1, 1,
-1.176639, -1.496053, -1.89131, 1, 1, 1, 1, 1,
-1.17619, 0.03185552, -1.922088, 1, 1, 1, 1, 1,
-1.175825, 0.5740473, -0.6333221, 1, 1, 1, 1, 1,
-1.17349, -0.1824713, -1.771376, 1, 1, 1, 1, 1,
-1.171755, -1.043319, -2.507674, 1, 1, 1, 1, 1,
-1.171614, -0.9927641, -1.703205, 1, 1, 1, 1, 1,
-1.167856, -0.8602912, -0.8747621, 1, 1, 1, 1, 1,
-1.157758, -0.4118942, -4.077652, 1, 1, 1, 1, 1,
-1.156068, -0.1957155, -1.471859, 1, 1, 1, 1, 1,
-1.154779, -0.3473407, -1.392685, 1, 1, 1, 1, 1,
-1.153339, 0.34216, -2.24829, 0, 0, 1, 1, 1,
-1.148345, -0.7342691, -2.687052, 1, 0, 0, 1, 1,
-1.139798, -0.7285317, -0.3651879, 1, 0, 0, 1, 1,
-1.133359, 0.6423297, -1.476735, 1, 0, 0, 1, 1,
-1.13331, 0.1756487, -1.216063, 1, 0, 0, 1, 1,
-1.131908, -2.577584, -4.072821, 1, 0, 0, 1, 1,
-1.129124, -0.4587827, -1.080615, 0, 0, 0, 1, 1,
-1.128795, 0.8267131, -1.134191, 0, 0, 0, 1, 1,
-1.119747, -0.2588677, -1.669412, 0, 0, 0, 1, 1,
-1.119197, -0.7401609, -3.073334, 0, 0, 0, 1, 1,
-1.119096, -1.893812, -4.161825, 0, 0, 0, 1, 1,
-1.11196, 1.753736, -0.8454255, 0, 0, 0, 1, 1,
-1.108648, 0.4990982, -1.047628, 0, 0, 0, 1, 1,
-1.108092, 1.280939, -2.168182, 1, 1, 1, 1, 1,
-1.103061, 1.668048, -0.4440085, 1, 1, 1, 1, 1,
-1.097032, -0.1428302, -1.209352, 1, 1, 1, 1, 1,
-1.096957, -1.843844, -4.023495, 1, 1, 1, 1, 1,
-1.095628, 0.3998404, -2.608423, 1, 1, 1, 1, 1,
-1.088337, 0.4217665, -1.698149, 1, 1, 1, 1, 1,
-1.081015, 2.661472, -0.4125033, 1, 1, 1, 1, 1,
-1.076027, 1.268941, -1.065789, 1, 1, 1, 1, 1,
-1.072086, -0.5251174, -1.841789, 1, 1, 1, 1, 1,
-1.071785, -1.408086, -2.915322, 1, 1, 1, 1, 1,
-1.062567, -0.1322019, -1.401363, 1, 1, 1, 1, 1,
-1.062373, 0.604876, -1.704508, 1, 1, 1, 1, 1,
-1.055389, 1.061306, -1.174779, 1, 1, 1, 1, 1,
-1.052575, 0.1221886, -2.167054, 1, 1, 1, 1, 1,
-1.052258, -0.2628166, -3.155877, 1, 1, 1, 1, 1,
-1.04775, -0.5575446, -3.523346, 0, 0, 1, 1, 1,
-1.043667, 1.01735, -0.7276835, 1, 0, 0, 1, 1,
-1.042164, 0.1974263, -1.336263, 1, 0, 0, 1, 1,
-1.041198, -1.774256, -3.921075, 1, 0, 0, 1, 1,
-1.035164, -1.189789, -2.109768, 1, 0, 0, 1, 1,
-1.034814, 0.5691352, -0.1401957, 1, 0, 0, 1, 1,
-1.032109, 0.4061407, -2.217224, 0, 0, 0, 1, 1,
-1.028966, -1.042334, -2.423565, 0, 0, 0, 1, 1,
-1.025666, 0.07717504, -2.032295, 0, 0, 0, 1, 1,
-1.024981, -0.2393626, -2.066074, 0, 0, 0, 1, 1,
-1.023472, -0.7989448, -0.3419835, 0, 0, 0, 1, 1,
-1.022354, -0.5626705, -0.7087282, 0, 0, 0, 1, 1,
-1.022135, 0.2718379, -2.208785, 0, 0, 0, 1, 1,
-1.02109, -1.468327, -3.343835, 1, 1, 1, 1, 1,
-1.0152, 0.01448924, -2.492755, 1, 1, 1, 1, 1,
-1.006219, 0.5421395, -1.23235, 1, 1, 1, 1, 1,
-0.9780276, 0.2233184, -0.7878745, 1, 1, 1, 1, 1,
-0.9626705, 1.816614, -1.367313, 1, 1, 1, 1, 1,
-0.9592658, 0.3543038, -1.226013, 1, 1, 1, 1, 1,
-0.9554191, -1.268345, -2.315462, 1, 1, 1, 1, 1,
-0.9484039, -1.430189, -2.155146, 1, 1, 1, 1, 1,
-0.9450099, -0.2694738, -1.49808, 1, 1, 1, 1, 1,
-0.9434304, -1.891244, -4.049573, 1, 1, 1, 1, 1,
-0.9415295, -0.2340643, -2.954017, 1, 1, 1, 1, 1,
-0.9367312, 0.2381761, -1.101822, 1, 1, 1, 1, 1,
-0.9165562, 0.1398083, -1.149121, 1, 1, 1, 1, 1,
-0.9146366, -1.276975, -3.857737, 1, 1, 1, 1, 1,
-0.8955894, 0.3046493, -1.267252, 1, 1, 1, 1, 1,
-0.8917191, 0.2470373, -0.968195, 0, 0, 1, 1, 1,
-0.8890001, -2.813082, -3.115566, 1, 0, 0, 1, 1,
-0.8830973, 0.6948044, 0.8272679, 1, 0, 0, 1, 1,
-0.8823935, 0.3814394, -1.619684, 1, 0, 0, 1, 1,
-0.8801388, 1.485374, -0.7198583, 1, 0, 0, 1, 1,
-0.8779851, -1.354517, -0.9628906, 1, 0, 0, 1, 1,
-0.8764206, -1.860678, -1.957695, 0, 0, 0, 1, 1,
-0.874921, -0.06887798, -1.730016, 0, 0, 0, 1, 1,
-0.8722769, 1.090386, -0.6560578, 0, 0, 0, 1, 1,
-0.861258, 1.678383, -1.794345, 0, 0, 0, 1, 1,
-0.8565837, -1.434252, -2.101564, 0, 0, 0, 1, 1,
-0.8553076, -0.2678927, -1.564596, 0, 0, 0, 1, 1,
-0.850962, 0.1853748, 0.1907963, 0, 0, 0, 1, 1,
-0.8493408, 0.1353818, -2.384406, 1, 1, 1, 1, 1,
-0.8487976, 1.414033, -0.7967956, 1, 1, 1, 1, 1,
-0.8468583, 0.3047417, -1.023417, 1, 1, 1, 1, 1,
-0.8452538, -1.089203, -0.6677172, 1, 1, 1, 1, 1,
-0.8423666, 0.9944724, -1.7093, 1, 1, 1, 1, 1,
-0.8400447, -0.6975715, -2.0382, 1, 1, 1, 1, 1,
-0.838929, 0.7600893, -1.881728, 1, 1, 1, 1, 1,
-0.836386, -1.487286, -2.047672, 1, 1, 1, 1, 1,
-0.8210929, 1.351286, -0.9590029, 1, 1, 1, 1, 1,
-0.8179706, -0.07153019, -0.6624574, 1, 1, 1, 1, 1,
-0.8172376, 1.259891, 1.818887, 1, 1, 1, 1, 1,
-0.8161386, 0.1698269, 0.3257922, 1, 1, 1, 1, 1,
-0.812238, 0.4113589, -2.399454, 1, 1, 1, 1, 1,
-0.802325, -0.009743474, -1.811074, 1, 1, 1, 1, 1,
-0.7928079, 1.663396, -0.7989886, 1, 1, 1, 1, 1,
-0.7902575, -1.315193, -2.411068, 0, 0, 1, 1, 1,
-0.7884133, -1.356951, -2.840598, 1, 0, 0, 1, 1,
-0.7877073, -0.1174388, 0.08527139, 1, 0, 0, 1, 1,
-0.7713886, -0.07365572, -1.351949, 1, 0, 0, 1, 1,
-0.766657, 0.8154851, -1.460143, 1, 0, 0, 1, 1,
-0.764935, 0.3649845, -1.744595, 1, 0, 0, 1, 1,
-0.7637354, 0.4285312, 0.2107648, 0, 0, 0, 1, 1,
-0.7630334, -0.5674699, -0.7048383, 0, 0, 0, 1, 1,
-0.7610953, -1.113922, -3.32772, 0, 0, 0, 1, 1,
-0.7602884, -0.2289972, -3.84336, 0, 0, 0, 1, 1,
-0.7576622, -0.6123143, -1.77874, 0, 0, 0, 1, 1,
-0.7572769, -0.5706943, -2.296093, 0, 0, 0, 1, 1,
-0.7516289, 1.437193, 0.6427033, 0, 0, 0, 1, 1,
-0.7504317, -0.9006395, -3.31568, 1, 1, 1, 1, 1,
-0.7501723, -1.475398, -2.012169, 1, 1, 1, 1, 1,
-0.7496004, 1.329331, -1.781767, 1, 1, 1, 1, 1,
-0.7487497, 0.08295424, -4.160491, 1, 1, 1, 1, 1,
-0.7470415, -0.1628724, -1.011002, 1, 1, 1, 1, 1,
-0.7349969, 1.564106, -1.031101, 1, 1, 1, 1, 1,
-0.7319731, -2.212947, -2.638073, 1, 1, 1, 1, 1,
-0.7313781, 1.986697, 0.337194, 1, 1, 1, 1, 1,
-0.7240863, 0.857356, -0.4934474, 1, 1, 1, 1, 1,
-0.7203532, 0.08097764, -1.048333, 1, 1, 1, 1, 1,
-0.7168605, -1.034413, -3.112059, 1, 1, 1, 1, 1,
-0.7146122, -0.4760105, -1.131719, 1, 1, 1, 1, 1,
-0.7140406, -0.2157967, -2.582829, 1, 1, 1, 1, 1,
-0.7128388, -0.9650978, -1.486609, 1, 1, 1, 1, 1,
-0.7128327, 1.065926, 0.1815155, 1, 1, 1, 1, 1,
-0.7122126, 0.797435, -1.286035, 0, 0, 1, 1, 1,
-0.7116919, -1.488547, -3.669947, 1, 0, 0, 1, 1,
-0.6964744, 0.886586, 1.444839, 1, 0, 0, 1, 1,
-0.6918455, 1.390914, 0.5921642, 1, 0, 0, 1, 1,
-0.6898775, -1.780684, -4.06014, 1, 0, 0, 1, 1,
-0.6878542, 0.2168506, -3.679626, 1, 0, 0, 1, 1,
-0.6859741, -0.5139324, -1.835424, 0, 0, 0, 1, 1,
-0.6823555, 0.3726606, -1.15554, 0, 0, 0, 1, 1,
-0.6738063, 0.3266316, -0.9035779, 0, 0, 0, 1, 1,
-0.6723632, -0.5685067, -2.049386, 0, 0, 0, 1, 1,
-0.6690561, 0.4401691, 1.40003, 0, 0, 0, 1, 1,
-0.6663378, -0.4180144, -1.472028, 0, 0, 0, 1, 1,
-0.6643134, -0.1140272, -1.467603, 0, 0, 0, 1, 1,
-0.6589787, 0.7809515, -1.076784, 1, 1, 1, 1, 1,
-0.656768, -0.1796865, -0.7443097, 1, 1, 1, 1, 1,
-0.6566682, -0.3575089, -1.521469, 1, 1, 1, 1, 1,
-0.6529391, 0.5534701, -0.1011673, 1, 1, 1, 1, 1,
-0.651607, 1.470395, 0.8170848, 1, 1, 1, 1, 1,
-0.6460972, -0.01369765, -2.362454, 1, 1, 1, 1, 1,
-0.6445595, -0.2570268, -1.999541, 1, 1, 1, 1, 1,
-0.6384864, -0.7874438, -2.300813, 1, 1, 1, 1, 1,
-0.6358257, 0.2905258, 0.5388625, 1, 1, 1, 1, 1,
-0.6357252, 1.157654, -0.1511869, 1, 1, 1, 1, 1,
-0.6332223, 2.375945, -1.560622, 1, 1, 1, 1, 1,
-0.6323761, 0.779053, -1.207828, 1, 1, 1, 1, 1,
-0.6291447, 1.871566, -1.038594, 1, 1, 1, 1, 1,
-0.628989, 0.4714481, -0.9872735, 1, 1, 1, 1, 1,
-0.6288112, -0.8569564, -2.021996, 1, 1, 1, 1, 1,
-0.6249496, -0.2508558, -2.303926, 0, 0, 1, 1, 1,
-0.6237407, 1.958681, 0.2265095, 1, 0, 0, 1, 1,
-0.6230279, 0.05787576, -1.16792, 1, 0, 0, 1, 1,
-0.6206095, -0.4898905, -2.705004, 1, 0, 0, 1, 1,
-0.6204401, 0.3433547, -0.3136765, 1, 0, 0, 1, 1,
-0.6167951, -0.9664302, -1.397227, 1, 0, 0, 1, 1,
-0.6130896, -0.4742982, -2.378263, 0, 0, 0, 1, 1,
-0.6066808, -1.240816, -3.738277, 0, 0, 0, 1, 1,
-0.6041046, -1.778719, -4.156301, 0, 0, 0, 1, 1,
-0.6026759, -1.424068, -1.264224, 0, 0, 0, 1, 1,
-0.6017581, -0.5439781, -4.006265, 0, 0, 0, 1, 1,
-0.6008562, -0.1202192, -0.477094, 0, 0, 0, 1, 1,
-0.5971924, 1.697496, -1.402972, 0, 0, 0, 1, 1,
-0.5933617, 0.8468935, -0.9829829, 1, 1, 1, 1, 1,
-0.5927646, 0.4249398, -0.005426326, 1, 1, 1, 1, 1,
-0.5903884, 0.4076904, -0.8028288, 1, 1, 1, 1, 1,
-0.5820248, -1.813765, -3.188135, 1, 1, 1, 1, 1,
-0.5813694, -0.3715589, -1.009915, 1, 1, 1, 1, 1,
-0.5744287, -0.2629434, -2.017964, 1, 1, 1, 1, 1,
-0.573633, 0.2690426, -1.609677, 1, 1, 1, 1, 1,
-0.5728948, 0.3732257, -1.04017, 1, 1, 1, 1, 1,
-0.5618103, 2.423022, 0.5846711, 1, 1, 1, 1, 1,
-0.560742, 0.6423956, -1.293731, 1, 1, 1, 1, 1,
-0.5604246, 2.361359, -2.247986, 1, 1, 1, 1, 1,
-0.5586796, -0.1147066, -1.12493, 1, 1, 1, 1, 1,
-0.5580125, -1.523432, -3.342104, 1, 1, 1, 1, 1,
-0.5555861, 2.100523, 0.2888397, 1, 1, 1, 1, 1,
-0.5541555, 1.071147, -1.54912, 1, 1, 1, 1, 1,
-0.5533616, -1.35592, -2.84345, 0, 0, 1, 1, 1,
-0.5528986, -0.3841658, -2.582192, 1, 0, 0, 1, 1,
-0.5515898, 1.470089, 2.717775, 1, 0, 0, 1, 1,
-0.5489968, -1.356842, -2.561714, 1, 0, 0, 1, 1,
-0.5489359, -0.5102984, -3.421922, 1, 0, 0, 1, 1,
-0.5470095, 1.159103, 1.732285, 1, 0, 0, 1, 1,
-0.5394565, -0.978415, -1.739366, 0, 0, 0, 1, 1,
-0.5376428, 0.1467344, -3.000131, 0, 0, 0, 1, 1,
-0.5357073, 0.6640707, -1.185282, 0, 0, 0, 1, 1,
-0.5321618, 0.7346998, -1.356187, 0, 0, 0, 1, 1,
-0.530549, 0.5232832, -0.1225212, 0, 0, 0, 1, 1,
-0.5207763, -0.3203914, -1.034582, 0, 0, 0, 1, 1,
-0.5174362, -0.8597876, -2.14946, 0, 0, 0, 1, 1,
-0.5152731, -0.03413206, 0.3653812, 1, 1, 1, 1, 1,
-0.5149199, 1.367061, -1.157139, 1, 1, 1, 1, 1,
-0.5123037, 0.7260556, 0.7576, 1, 1, 1, 1, 1,
-0.5119349, 0.03196338, -2.157564, 1, 1, 1, 1, 1,
-0.5104328, -1.119356, 0.5653493, 1, 1, 1, 1, 1,
-0.5082805, -0.1264603, -0.8213247, 1, 1, 1, 1, 1,
-0.5079339, -0.8442988, -4.228922, 1, 1, 1, 1, 1,
-0.5078084, -0.2121283, -2.655274, 1, 1, 1, 1, 1,
-0.5075319, -0.09741114, -1.181577, 1, 1, 1, 1, 1,
-0.5045094, 0.5159885, -0.6169264, 1, 1, 1, 1, 1,
-0.501861, 0.4717435, -0.4439422, 1, 1, 1, 1, 1,
-0.4888868, -0.1302775, -0.5202712, 1, 1, 1, 1, 1,
-0.4846189, -0.2680473, -2.17977, 1, 1, 1, 1, 1,
-0.4808173, 1.026629, -1.11533, 1, 1, 1, 1, 1,
-0.480091, -0.3866135, -1.404623, 1, 1, 1, 1, 1,
-0.4764569, 1.377782, -0.8700721, 0, 0, 1, 1, 1,
-0.475115, -0.8288182, -1.400092, 1, 0, 0, 1, 1,
-0.4745284, 0.9508113, -0.06240543, 1, 0, 0, 1, 1,
-0.4682891, -0.5917442, -1.445048, 1, 0, 0, 1, 1,
-0.4659212, 0.5020609, 0.05192087, 1, 0, 0, 1, 1,
-0.4597418, 0.4069896, -1.473894, 1, 0, 0, 1, 1,
-0.4493456, -0.6512606, -1.758783, 0, 0, 0, 1, 1,
-0.4290743, 0.9180489, -0.4684813, 0, 0, 0, 1, 1,
-0.4283324, 0.3067768, -2.755731, 0, 0, 0, 1, 1,
-0.4249079, 0.5656876, -0.3628106, 0, 0, 0, 1, 1,
-0.4233786, 0.12699, -0.5569538, 0, 0, 0, 1, 1,
-0.4145953, 0.5887964, 1.794615, 0, 0, 0, 1, 1,
-0.4116539, -0.3344176, -1.822662, 0, 0, 0, 1, 1,
-0.4116441, -1.141683, -2.176716, 1, 1, 1, 1, 1,
-0.4114884, -0.183546, -1.321776, 1, 1, 1, 1, 1,
-0.4105545, 0.8524342, 0.9016743, 1, 1, 1, 1, 1,
-0.4096226, 0.6664858, -0.9585699, 1, 1, 1, 1, 1,
-0.408011, -0.5085563, -3.206023, 1, 1, 1, 1, 1,
-0.4020761, 1.002404, -1.101751, 1, 1, 1, 1, 1,
-0.4015871, -2.154474, -3.989543, 1, 1, 1, 1, 1,
-0.3976099, -1.795937, -0.6280829, 1, 1, 1, 1, 1,
-0.3954297, 0.1313673, -0.4428234, 1, 1, 1, 1, 1,
-0.3925847, -1.020332, -2.257997, 1, 1, 1, 1, 1,
-0.3821882, 0.3181372, 0.1460315, 1, 1, 1, 1, 1,
-0.3808261, 0.9533741, 0.2746258, 1, 1, 1, 1, 1,
-0.3772625, -0.6225848, -2.532346, 1, 1, 1, 1, 1,
-0.3759412, -1.880394, -3.254771, 1, 1, 1, 1, 1,
-0.3747022, 1.12085, -0.2334198, 1, 1, 1, 1, 1,
-0.3711285, 0.587813, 0.2322369, 0, 0, 1, 1, 1,
-0.369463, -2.652265, -3.302422, 1, 0, 0, 1, 1,
-0.3616673, -0.2357225, -2.455184, 1, 0, 0, 1, 1,
-0.358494, -0.5759376, -2.45622, 1, 0, 0, 1, 1,
-0.357403, -1.985875, -2.529498, 1, 0, 0, 1, 1,
-0.3570042, -2.606483, -3.762184, 1, 0, 0, 1, 1,
-0.3526042, -0.8377237, -2.324825, 0, 0, 0, 1, 1,
-0.3517371, -0.5502726, -2.475293, 0, 0, 0, 1, 1,
-0.3504939, 1.995906, 0.07818613, 0, 0, 0, 1, 1,
-0.3503753, -2.593372, -2.971192, 0, 0, 0, 1, 1,
-0.35028, 0.101477, -2.379471, 0, 0, 0, 1, 1,
-0.3481071, 1.431355, 0.9992639, 0, 0, 0, 1, 1,
-0.3465638, 0.05543819, -1.123898, 0, 0, 0, 1, 1,
-0.3464548, -0.9924568, -3.675116, 1, 1, 1, 1, 1,
-0.3450473, -0.3663277, -2.919989, 1, 1, 1, 1, 1,
-0.3377094, -0.4689397, -2.078573, 1, 1, 1, 1, 1,
-0.337688, -0.06766138, -2.098916, 1, 1, 1, 1, 1,
-0.3367777, 0.8462082, 0.08411124, 1, 1, 1, 1, 1,
-0.3367552, 2.072957, 0.1320731, 1, 1, 1, 1, 1,
-0.3324555, -0.03097666, -0.7376962, 1, 1, 1, 1, 1,
-0.329859, -2.551626, -3.607454, 1, 1, 1, 1, 1,
-0.3252035, -0.2445806, -2.143483, 1, 1, 1, 1, 1,
-0.3175153, 0.659346, -1.242997, 1, 1, 1, 1, 1,
-0.3111332, -0.2826368, -0.2371554, 1, 1, 1, 1, 1,
-0.311125, -2.531739, -3.7606, 1, 1, 1, 1, 1,
-0.3106291, 0.377171, -1.346558, 1, 1, 1, 1, 1,
-0.3099371, 0.3339234, -2.233316, 1, 1, 1, 1, 1,
-0.3091651, 1.026054, -1.112398, 1, 1, 1, 1, 1,
-0.3079199, 0.7621379, -1.307108, 0, 0, 1, 1, 1,
-0.3075867, -0.1335393, -4.476061, 1, 0, 0, 1, 1,
-0.3036026, -0.5040647, -2.728296, 1, 0, 0, 1, 1,
-0.2980141, 0.7087883, -0.007354186, 1, 0, 0, 1, 1,
-0.2937512, -1.285924, -1.956826, 1, 0, 0, 1, 1,
-0.2898321, 1.575271, -0.1695388, 1, 0, 0, 1, 1,
-0.2892589, 0.5384605, 0.303301, 0, 0, 0, 1, 1,
-0.2853908, -1.388247, -2.993572, 0, 0, 0, 1, 1,
-0.2840723, 0.8685493, 2.263257, 0, 0, 0, 1, 1,
-0.2830617, 1.074518, -2.097115, 0, 0, 0, 1, 1,
-0.27998, 0.4320168, -2.497427, 0, 0, 0, 1, 1,
-0.2771338, -1.706514, -2.456892, 0, 0, 0, 1, 1,
-0.2735532, -1.048478, -3.159111, 0, 0, 0, 1, 1,
-0.271814, -0.4537492, -2.13386, 1, 1, 1, 1, 1,
-0.2718092, 0.7898203, 0.5110066, 1, 1, 1, 1, 1,
-0.2713363, 0.07320645, -0.8270108, 1, 1, 1, 1, 1,
-0.2699885, -0.6824672, -3.482306, 1, 1, 1, 1, 1,
-0.2695938, -1.301364, -3.310484, 1, 1, 1, 1, 1,
-0.2690935, -1.14058, -3.523222, 1, 1, 1, 1, 1,
-0.2661604, 0.8956233, -0.522612, 1, 1, 1, 1, 1,
-0.2656702, 2.152246, 0.8357929, 1, 1, 1, 1, 1,
-0.2610188, -0.3852983, -3.470178, 1, 1, 1, 1, 1,
-0.2544207, -0.7919728, -1.610824, 1, 1, 1, 1, 1,
-0.2534455, -0.1507575, 0.5745295, 1, 1, 1, 1, 1,
-0.2526487, 0.01016215, -1.111223, 1, 1, 1, 1, 1,
-0.2520675, -0.6370365, -2.229765, 1, 1, 1, 1, 1,
-0.2430956, -0.8306224, -2.440762, 1, 1, 1, 1, 1,
-0.2396161, 0.0279201, -3.402911, 1, 1, 1, 1, 1,
-0.2387377, -0.6201143, -1.65213, 0, 0, 1, 1, 1,
-0.2360132, 1.78936, -0.09730433, 1, 0, 0, 1, 1,
-0.2275297, 0.4475668, -0.3874575, 1, 0, 0, 1, 1,
-0.2247991, 0.9146136, 1.176665, 1, 0, 0, 1, 1,
-0.222397, 0.31763, -0.1289588, 1, 0, 0, 1, 1,
-0.2220924, 2.307462, -0.04482698, 1, 0, 0, 1, 1,
-0.2099302, -0.3700952, -3.347647, 0, 0, 0, 1, 1,
-0.208464, 0.725541, -0.2975239, 0, 0, 0, 1, 1,
-0.2079981, -0.2688093, -1.462163, 0, 0, 0, 1, 1,
-0.206319, 0.2342134, -1.564265, 0, 0, 0, 1, 1,
-0.2059233, -2.350374, -4.473499, 0, 0, 0, 1, 1,
-0.2026233, 0.7798725, 0.4520117, 0, 0, 0, 1, 1,
-0.1976475, -0.547698, -2.451353, 0, 0, 0, 1, 1,
-0.1910787, 1.108793, -1.305698, 1, 1, 1, 1, 1,
-0.1904319, 0.8731422, -0.7006696, 1, 1, 1, 1, 1,
-0.1858478, 0.2332729, -0.7685409, 1, 1, 1, 1, 1,
-0.1858312, -1.388624, -3.186439, 1, 1, 1, 1, 1,
-0.1855792, 0.4311993, -0.2215059, 1, 1, 1, 1, 1,
-0.1854397, 2.170122, 0.7191184, 1, 1, 1, 1, 1,
-0.1791827, 2.181464, 0.5813067, 1, 1, 1, 1, 1,
-0.1740001, -0.5814664, -3.145783, 1, 1, 1, 1, 1,
-0.1732766, -0.2289895, -1.0117, 1, 1, 1, 1, 1,
-0.1731719, 1.70087, 1.258083, 1, 1, 1, 1, 1,
-0.1678431, 0.6403635, -1.48408, 1, 1, 1, 1, 1,
-0.1668651, 0.03108109, -1.617159, 1, 1, 1, 1, 1,
-0.1664055, 0.479999, 1.060324, 1, 1, 1, 1, 1,
-0.1663753, -0.6355782, -1.116017, 1, 1, 1, 1, 1,
-0.1646559, -1.273002, -2.494946, 1, 1, 1, 1, 1,
-0.1641126, 0.0312616, -2.621403, 0, 0, 1, 1, 1,
-0.160312, 0.586732, 1.857148, 1, 0, 0, 1, 1,
-0.1556461, 1.446197, 0.2796809, 1, 0, 0, 1, 1,
-0.1547252, -0.3406377, -2.040573, 1, 0, 0, 1, 1,
-0.1477394, -0.113201, -2.499914, 1, 0, 0, 1, 1,
-0.1440475, 0.7140007, 0.5095336, 1, 0, 0, 1, 1,
-0.1416252, -0.6036004, -2.308552, 0, 0, 0, 1, 1,
-0.1351061, 1.369834, -0.621102, 0, 0, 0, 1, 1,
-0.1333634, 1.011982, 1.064874, 0, 0, 0, 1, 1,
-0.1331653, 1.18514, -0.3333216, 0, 0, 0, 1, 1,
-0.1287861, -0.04631016, -3.033834, 0, 0, 0, 1, 1,
-0.1282258, -0.8206167, -2.214202, 0, 0, 0, 1, 1,
-0.1260214, 1.574123, -1.162412, 0, 0, 0, 1, 1,
-0.12413, 1.079331, -0.6534658, 1, 1, 1, 1, 1,
-0.1228119, -0.619567, -2.993067, 1, 1, 1, 1, 1,
-0.1204186, -1.00786, -1.869426, 1, 1, 1, 1, 1,
-0.1164834, 0.5123094, -0.806203, 1, 1, 1, 1, 1,
-0.1154924, 0.170146, 0.06867167, 1, 1, 1, 1, 1,
-0.1125993, 2.586659, -0.58526, 1, 1, 1, 1, 1,
-0.1102282, 1.71839, -0.5462219, 1, 1, 1, 1, 1,
-0.1099272, 2.526184, -1.198421, 1, 1, 1, 1, 1,
-0.1056936, -0.2562347, -3.902935, 1, 1, 1, 1, 1,
-0.1049648, 0.040188, 0.5928217, 1, 1, 1, 1, 1,
-0.1016307, 0.9040565, 1.22676, 1, 1, 1, 1, 1,
-0.1011131, -1.239463, -2.519307, 1, 1, 1, 1, 1,
-0.09906756, 1.415154, -2.305085, 1, 1, 1, 1, 1,
-0.09746674, -0.02038666, -2.112385, 1, 1, 1, 1, 1,
-0.08910214, 1.750185, -1.37451, 1, 1, 1, 1, 1,
-0.08490794, -0.1477947, -3.385594, 0, 0, 1, 1, 1,
-0.08372701, -1.328763, -3.561615, 1, 0, 0, 1, 1,
-0.08197258, -1.099987, -3.396058, 1, 0, 0, 1, 1,
-0.07791405, -0.3197728, -3.250209, 1, 0, 0, 1, 1,
-0.07722946, 1.197341, 0.7814844, 1, 0, 0, 1, 1,
-0.07229366, -1.085949, -3.021532, 1, 0, 0, 1, 1,
-0.07160323, 1.50187, 0.1668832, 0, 0, 0, 1, 1,
-0.0696713, -0.6606738, -1.928564, 0, 0, 0, 1, 1,
-0.0646342, 1.640253, 1.440915, 0, 0, 0, 1, 1,
-0.06343324, 1.062777, -0.4276864, 0, 0, 0, 1, 1,
-0.06288889, 1.632971, -0.4740871, 0, 0, 0, 1, 1,
-0.06003719, -2.143246, -3.575107, 0, 0, 0, 1, 1,
-0.05991406, 0.3026978, -1.23422, 0, 0, 0, 1, 1,
-0.05433439, 1.508279, 0.9144984, 1, 1, 1, 1, 1,
-0.05232182, -1.303674, -3.426562, 1, 1, 1, 1, 1,
-0.04924568, 1.377092, 0.2394302, 1, 1, 1, 1, 1,
-0.04760714, -0.1304054, -5.349831, 1, 1, 1, 1, 1,
-0.04416701, -1.976581, -3.699369, 1, 1, 1, 1, 1,
-0.04305716, -0.797182, -2.36571, 1, 1, 1, 1, 1,
-0.04233569, -0.5380589, -1.948576, 1, 1, 1, 1, 1,
-0.03175421, 1.34355, -1.18967, 1, 1, 1, 1, 1,
-0.02702888, 1.297549, -0.7430254, 1, 1, 1, 1, 1,
-0.02683462, -1.385358, -3.534433, 1, 1, 1, 1, 1,
-0.02647202, 0.1421715, 1.879275, 1, 1, 1, 1, 1,
-0.02545366, 2.237741, -0.4825675, 1, 1, 1, 1, 1,
-0.0188565, -0.1030165, -3.583694, 1, 1, 1, 1, 1,
-0.01653102, -0.9048433, -2.890455, 1, 1, 1, 1, 1,
-0.01598437, 0.8568892, -0.9035801, 1, 1, 1, 1, 1,
-0.009637389, -0.1030595, -3.336001, 0, 0, 1, 1, 1,
-0.009525627, -0.4995626, -4.272147, 1, 0, 0, 1, 1,
-0.009110268, -0.9203567, -1.903468, 1, 0, 0, 1, 1,
-0.005731259, -1.988022, -2.620297, 1, 0, 0, 1, 1,
0.005167841, -0.4071704, 4.062949, 1, 0, 0, 1, 1,
0.008558098, 0.01682215, 1.455729, 1, 0, 0, 1, 1,
0.01196559, 0.2428439, -1.197312, 0, 0, 0, 1, 1,
0.0136244, -0.7385749, 2.051212, 0, 0, 0, 1, 1,
0.01563248, 0.1320467, -0.4700848, 0, 0, 0, 1, 1,
0.01614576, -1.090595, 3.890692, 0, 0, 0, 1, 1,
0.01623204, -0.9253037, 2.220975, 0, 0, 0, 1, 1,
0.02588157, -0.4126877, 3.188797, 0, 0, 0, 1, 1,
0.02648163, 0.5268346, 1.293124, 0, 0, 0, 1, 1,
0.0272633, -1.11577, 1.321327, 1, 1, 1, 1, 1,
0.02799019, -1.29775, 4.164108, 1, 1, 1, 1, 1,
0.02952203, 0.9420956, 0.2874641, 1, 1, 1, 1, 1,
0.02978336, -0.3904776, 2.544246, 1, 1, 1, 1, 1,
0.03001342, 0.584771, 1.465809, 1, 1, 1, 1, 1,
0.03578507, -1.387478, 2.83982, 1, 1, 1, 1, 1,
0.03743092, -0.8298695, 4.319283, 1, 1, 1, 1, 1,
0.04107185, -0.4618182, 2.11541, 1, 1, 1, 1, 1,
0.04465524, 0.1101469, 1.241115, 1, 1, 1, 1, 1,
0.05006085, -1.082645, 2.275284, 1, 1, 1, 1, 1,
0.05735512, 1.773211, 0.4331376, 1, 1, 1, 1, 1,
0.05784028, -1.079428, 3.892377, 1, 1, 1, 1, 1,
0.05983717, -0.7323577, 2.51802, 1, 1, 1, 1, 1,
0.06087544, 0.1274891, 0.1117226, 1, 1, 1, 1, 1,
0.07343004, 0.1601937, 1.794183, 1, 1, 1, 1, 1,
0.07638117, 0.4306895, -0.824753, 0, 0, 1, 1, 1,
0.0779556, 0.6724401, -0.5571896, 1, 0, 0, 1, 1,
0.08035551, 0.6687039, -0.8945819, 1, 0, 0, 1, 1,
0.08831934, -0.9862341, 2.56253, 1, 0, 0, 1, 1,
0.09140316, -0.4154973, 2.50794, 1, 0, 0, 1, 1,
0.09174591, -1.411222, 3.605281, 1, 0, 0, 1, 1,
0.09677513, 1.096648, -0.5901409, 0, 0, 0, 1, 1,
0.09835705, -0.1520534, 2.895301, 0, 0, 0, 1, 1,
0.09900819, 1.231879, -1.958342, 0, 0, 0, 1, 1,
0.1003635, -0.2139273, 1.569454, 0, 0, 0, 1, 1,
0.1009318, -0.06138185, 1.657542, 0, 0, 0, 1, 1,
0.1018233, -0.2871516, 2.745809, 0, 0, 0, 1, 1,
0.1052058, -0.6030449, 3.000883, 0, 0, 0, 1, 1,
0.1067307, 0.4329363, -0.5009317, 1, 1, 1, 1, 1,
0.1162738, 1.79099, 0.00853312, 1, 1, 1, 1, 1,
0.1190175, -0.1610105, 2.593294, 1, 1, 1, 1, 1,
0.1192198, -1.341012, 1.141107, 1, 1, 1, 1, 1,
0.1236585, -0.3375591, 3.600644, 1, 1, 1, 1, 1,
0.1242987, -1.951402, 1.116096, 1, 1, 1, 1, 1,
0.1247803, -0.52705, 4.224988, 1, 1, 1, 1, 1,
0.1249395, -0.1536986, 1.647881, 1, 1, 1, 1, 1,
0.1300991, 0.914116, 0.714026, 1, 1, 1, 1, 1,
0.1316464, -0.8267104, 3.724156, 1, 1, 1, 1, 1,
0.1372439, 1.279898, 0.4065708, 1, 1, 1, 1, 1,
0.1391394, 0.1649601, 1.464721, 1, 1, 1, 1, 1,
0.1422117, 0.2248719, 1.321655, 1, 1, 1, 1, 1,
0.1443802, -1.80057, 1.461626, 1, 1, 1, 1, 1,
0.1512492, -0.5176922, 3.882701, 1, 1, 1, 1, 1,
0.1524362, -0.5449547, 1.448659, 0, 0, 1, 1, 1,
0.1539767, 2.223089, 0.9007508, 1, 0, 0, 1, 1,
0.1558259, -0.06301478, 1.64305, 1, 0, 0, 1, 1,
0.1565992, 0.814645, -0.2579405, 1, 0, 0, 1, 1,
0.1571385, -0.1666509, 2.681262, 1, 0, 0, 1, 1,
0.1586102, -0.2762318, 1.822558, 1, 0, 0, 1, 1,
0.1594025, 1.542668, -0.1310204, 0, 0, 0, 1, 1,
0.1610923, 0.02172976, 1.85594, 0, 0, 0, 1, 1,
0.1658202, -0.7475052, 4.076157, 0, 0, 0, 1, 1,
0.1690759, -0.2363356, 2.049026, 0, 0, 0, 1, 1,
0.1748735, 0.4672744, 0.5213878, 0, 0, 0, 1, 1,
0.1795923, 1.604122, 0.9173787, 0, 0, 0, 1, 1,
0.1921114, -0.3415385, 2.27135, 0, 0, 0, 1, 1,
0.1929806, 0.68462, 0.6858115, 1, 1, 1, 1, 1,
0.1934251, -0.01146916, 1.385636, 1, 1, 1, 1, 1,
0.193778, 0.9618914, 0.1765442, 1, 1, 1, 1, 1,
0.1962644, 1.861967, 0.02277024, 1, 1, 1, 1, 1,
0.1976766, -0.8766351, 2.714958, 1, 1, 1, 1, 1,
0.205829, 0.7882278, -1.445419, 1, 1, 1, 1, 1,
0.2088984, 0.09791146, 2.969729, 1, 1, 1, 1, 1,
0.2113535, 0.1135183, 0.6964866, 1, 1, 1, 1, 1,
0.2122627, -0.1902196, 0.9319607, 1, 1, 1, 1, 1,
0.2127296, -0.2264116, 3.286369, 1, 1, 1, 1, 1,
0.2232589, 0.8931398, -0.6948307, 1, 1, 1, 1, 1,
0.2267351, 0.7385101, 0.011501, 1, 1, 1, 1, 1,
0.2301699, -1.723613, 3.374577, 1, 1, 1, 1, 1,
0.2311673, -0.5249997, 3.935403, 1, 1, 1, 1, 1,
0.2312602, 2.064976, 1.475106, 1, 1, 1, 1, 1,
0.2313946, -0.3828788, 1.963128, 0, 0, 1, 1, 1,
0.232967, 0.7696787, -1.073389, 1, 0, 0, 1, 1,
0.2345108, -0.4883581, 2.144197, 1, 0, 0, 1, 1,
0.2374384, -1.753411, 1.494546, 1, 0, 0, 1, 1,
0.2390924, -0.3364605, 1.824353, 1, 0, 0, 1, 1,
0.2452888, -0.1459595, 2.217766, 1, 0, 0, 1, 1,
0.2472643, -1.451299, 3.005826, 0, 0, 0, 1, 1,
0.248452, 1.222925, -0.8127517, 0, 0, 0, 1, 1,
0.2498132, -1.040994, 3.421292, 0, 0, 0, 1, 1,
0.2506668, -0.5759804, 3.925563, 0, 0, 0, 1, 1,
0.2528648, -0.3986266, 2.850753, 0, 0, 0, 1, 1,
0.2540264, 0.7592477, -0.617604, 0, 0, 0, 1, 1,
0.2578076, 0.1972037, -0.5653483, 0, 0, 0, 1, 1,
0.2581517, -0.3267738, 1.646121, 1, 1, 1, 1, 1,
0.2608706, -0.5759355, 4.24431, 1, 1, 1, 1, 1,
0.2614441, 1.69339, -0.8647281, 1, 1, 1, 1, 1,
0.2626382, 1.238613, 0.9535902, 1, 1, 1, 1, 1,
0.2672618, -0.4814986, 1.137993, 1, 1, 1, 1, 1,
0.2684981, -1.340445, 1.027341, 1, 1, 1, 1, 1,
0.269655, -1.074256, 1.466642, 1, 1, 1, 1, 1,
0.2723478, -0.09142978, 3.337678, 1, 1, 1, 1, 1,
0.2734708, 1.575924, -2.029503, 1, 1, 1, 1, 1,
0.2742239, 0.5849214, 0.589009, 1, 1, 1, 1, 1,
0.2758487, 0.7332603, 0.3476492, 1, 1, 1, 1, 1,
0.2779928, -0.6234633, 4.489422, 1, 1, 1, 1, 1,
0.2786218, 1.463722, 0.3789751, 1, 1, 1, 1, 1,
0.2788092, 0.2596571, -0.3636619, 1, 1, 1, 1, 1,
0.2794771, 0.8323696, 0.992556, 1, 1, 1, 1, 1,
0.2799667, -0.6483622, 1.922045, 0, 0, 1, 1, 1,
0.28221, 2.417189, -0.4852346, 1, 0, 0, 1, 1,
0.2892663, 0.2606168, 0.7024248, 1, 0, 0, 1, 1,
0.2895395, 1.213107, -0.431268, 1, 0, 0, 1, 1,
0.2909993, 0.9852292, 0.4768476, 1, 0, 0, 1, 1,
0.2953, -1.547321, 2.952017, 1, 0, 0, 1, 1,
0.2988671, -0.5098803, 3.917894, 0, 0, 0, 1, 1,
0.3004439, -0.7460553, 2.024451, 0, 0, 0, 1, 1,
0.3026448, 1.247328, -0.5270599, 0, 0, 0, 1, 1,
0.3040957, -0.0561658, 1.83026, 0, 0, 0, 1, 1,
0.3042268, 0.006088891, 1.106918, 0, 0, 0, 1, 1,
0.3052515, 0.05713527, 1.900576, 0, 0, 0, 1, 1,
0.3075953, -1.110302, 4.375356, 0, 0, 0, 1, 1,
0.3146113, 1.017031, -1.013557, 1, 1, 1, 1, 1,
0.3196681, -0.9772013, 3.118353, 1, 1, 1, 1, 1,
0.3217874, -1.677291, 2.730077, 1, 1, 1, 1, 1,
0.3219738, 1.59715, -1.090313, 1, 1, 1, 1, 1,
0.3268957, -1.672404, 2.89933, 1, 1, 1, 1, 1,
0.3288814, 1.310884, -0.6045148, 1, 1, 1, 1, 1,
0.3317179, 0.4449287, 0.6641226, 1, 1, 1, 1, 1,
0.3318508, 0.7273341, -0.5275502, 1, 1, 1, 1, 1,
0.3382469, -0.1440545, 2.641104, 1, 1, 1, 1, 1,
0.3386903, -1.041723, 2.221323, 1, 1, 1, 1, 1,
0.3399652, -0.4598467, 1.716468, 1, 1, 1, 1, 1,
0.3431126, -0.3059888, 2.387661, 1, 1, 1, 1, 1,
0.3438006, 0.8022225, -1.687188, 1, 1, 1, 1, 1,
0.344413, -3.070097, 3.216295, 1, 1, 1, 1, 1,
0.3467851, 0.7290932, 1.166956, 1, 1, 1, 1, 1,
0.3492214, -1.159379, 2.253559, 0, 0, 1, 1, 1,
0.3506831, -0.5924918, 2.446672, 1, 0, 0, 1, 1,
0.3528349, 1.831548, 2.046417, 1, 0, 0, 1, 1,
0.355051, -0.1414211, 3.750937, 1, 0, 0, 1, 1,
0.3588387, -0.7389851, 0.7748972, 1, 0, 0, 1, 1,
0.3625408, -0.9299135, 3.807956, 1, 0, 0, 1, 1,
0.3641337, -0.07800665, 0.9561035, 0, 0, 0, 1, 1,
0.3690601, -1.23573, 3.041054, 0, 0, 0, 1, 1,
0.3699008, 0.04282406, 0.3086531, 0, 0, 0, 1, 1,
0.3701673, 0.005812235, 1.505449, 0, 0, 0, 1, 1,
0.3711534, -1.452225, 3.040048, 0, 0, 0, 1, 1,
0.3766867, 1.404669, 0.2688736, 0, 0, 0, 1, 1,
0.3819514, -0.2968601, 2.626202, 0, 0, 0, 1, 1,
0.3833166, -1.872931, 3.546032, 1, 1, 1, 1, 1,
0.3905294, -1.054889, 3.870548, 1, 1, 1, 1, 1,
0.3994272, 0.1141384, 0.03429624, 1, 1, 1, 1, 1,
0.4053538, -1.342258, 4.386075, 1, 1, 1, 1, 1,
0.4055852, 0.01564498, 2.351816, 1, 1, 1, 1, 1,
0.4058121, 1.66581, -1.005765, 1, 1, 1, 1, 1,
0.4061566, -0.0934268, -0.6348762, 1, 1, 1, 1, 1,
0.4069819, 0.05504733, 2.676479, 1, 1, 1, 1, 1,
0.4072183, -1.966691, 3.405276, 1, 1, 1, 1, 1,
0.407289, 0.8690848, -0.3591318, 1, 1, 1, 1, 1,
0.4080292, -0.1572414, 0.9087298, 1, 1, 1, 1, 1,
0.4143636, 1.632272, 0.5624076, 1, 1, 1, 1, 1,
0.4149742, 0.1277023, 0.4206429, 1, 1, 1, 1, 1,
0.415843, -0.2388714, 0.2873298, 1, 1, 1, 1, 1,
0.4172138, -1.410177, 2.329628, 1, 1, 1, 1, 1,
0.4207737, 0.7475827, 1.058949, 0, 0, 1, 1, 1,
0.4222526, 2.232836, 0.4120993, 1, 0, 0, 1, 1,
0.4256852, 1.763146, 1.288512, 1, 0, 0, 1, 1,
0.4297088, -0.6350852, 2.499066, 1, 0, 0, 1, 1,
0.4299498, -1.976619, 2.878783, 1, 0, 0, 1, 1,
0.4318693, 1.454849, -0.3483696, 1, 0, 0, 1, 1,
0.4327306, 1.314428, 0.19404, 0, 0, 0, 1, 1,
0.4371695, 0.09941927, 1.278264, 0, 0, 0, 1, 1,
0.4404677, 0.1729732, -0.02764171, 0, 0, 0, 1, 1,
0.4453602, -0.2624712, 2.247665, 0, 0, 0, 1, 1,
0.4459493, 0.6694071, 1.902708, 0, 0, 0, 1, 1,
0.4460395, -0.1303504, 1.298183, 0, 0, 0, 1, 1,
0.4501777, 0.0548868, 0.5846101, 0, 0, 0, 1, 1,
0.453145, 0.05233007, 1.922187, 1, 1, 1, 1, 1,
0.455696, -0.005418959, 2.520555, 1, 1, 1, 1, 1,
0.4570543, -0.0299051, 0.8201302, 1, 1, 1, 1, 1,
0.4575324, -1.208922, 3.721525, 1, 1, 1, 1, 1,
0.4616106, 1.582263, -0.1739634, 1, 1, 1, 1, 1,
0.4624218, -0.4636934, 3.269528, 1, 1, 1, 1, 1,
0.4645688, 0.8232506, 1.072626, 1, 1, 1, 1, 1,
0.4655872, -0.5718395, 2.666549, 1, 1, 1, 1, 1,
0.4700792, 1.915256, 0.08546562, 1, 1, 1, 1, 1,
0.4745907, -0.4839412, 2.623784, 1, 1, 1, 1, 1,
0.4802664, 1.770047, 2.950507, 1, 1, 1, 1, 1,
0.4826218, 0.5742617, 1.271497, 1, 1, 1, 1, 1,
0.4826673, -1.519255, 2.49393, 1, 1, 1, 1, 1,
0.4867289, -1.194451, 2.948582, 1, 1, 1, 1, 1,
0.4869229, -1.683642, 2.911296, 1, 1, 1, 1, 1,
0.4912167, -0.9240497, 3.309714, 0, 0, 1, 1, 1,
0.4926434, -0.4176236, 2.744588, 1, 0, 0, 1, 1,
0.496918, 0.1683912, -0.4519515, 1, 0, 0, 1, 1,
0.4982556, -1.17638, 4.69931, 1, 0, 0, 1, 1,
0.5035172, 0.4801926, 0.3535775, 1, 0, 0, 1, 1,
0.5041851, -0.3477743, 1.620036, 1, 0, 0, 1, 1,
0.5076389, -0.9241627, 3.731503, 0, 0, 0, 1, 1,
0.5084886, -0.06335361, 2.870752, 0, 0, 0, 1, 1,
0.5093331, 0.09344407, 1.807588, 0, 0, 0, 1, 1,
0.5136551, 1.921773, 0.8642557, 0, 0, 0, 1, 1,
0.5195976, 1.272969, 0.7631871, 0, 0, 0, 1, 1,
0.524849, 0.4505809, 1.48818, 0, 0, 0, 1, 1,
0.5270954, -0.6912062, 3.16791, 0, 0, 0, 1, 1,
0.5308453, -1.340984, 2.635913, 1, 1, 1, 1, 1,
0.5335574, 2.335933, 0.5596346, 1, 1, 1, 1, 1,
0.5372075, -0.5509667, 3.062317, 1, 1, 1, 1, 1,
0.5418293, -0.7949548, 2.469804, 1, 1, 1, 1, 1,
0.5459251, -1.19156, 0.5876552, 1, 1, 1, 1, 1,
0.5507576, 0.8432016, 0.7327605, 1, 1, 1, 1, 1,
0.5575515, -1.118576, 2.681604, 1, 1, 1, 1, 1,
0.5586624, 0.5210848, -0.1129708, 1, 1, 1, 1, 1,
0.5700427, 0.05358494, 1.607801, 1, 1, 1, 1, 1,
0.5709823, 1.071166, 0.0006460292, 1, 1, 1, 1, 1,
0.5727562, 1.867064, -0.4436652, 1, 1, 1, 1, 1,
0.5733493, 0.03405557, 1.558403, 1, 1, 1, 1, 1,
0.5738152, -1.286384, 1.253936, 1, 1, 1, 1, 1,
0.5754821, -0.1986171, -0.44098, 1, 1, 1, 1, 1,
0.5764114, 0.5234491, 1.072615, 1, 1, 1, 1, 1,
0.5773202, 0.5641835, 0.0326723, 0, 0, 1, 1, 1,
0.5801721, -0.3198124, 0.7141085, 1, 0, 0, 1, 1,
0.5819904, -0.4961697, 1.769843, 1, 0, 0, 1, 1,
0.5825425, 0.2381719, 3.662693, 1, 0, 0, 1, 1,
0.5869923, 2.132172, 1.161852, 1, 0, 0, 1, 1,
0.5894408, 1.208161, -0.940147, 1, 0, 0, 1, 1,
0.5951111, -0.5155008, 3.725972, 0, 0, 0, 1, 1,
0.6040186, -0.4733717, 0.4970157, 0, 0, 0, 1, 1,
0.6146628, -1.157702, 3.457514, 0, 0, 0, 1, 1,
0.622754, 0.2764271, 1.569634, 0, 0, 0, 1, 1,
0.6269874, -0.3505635, 1.957654, 0, 0, 0, 1, 1,
0.6297911, -1.219678, 3.985073, 0, 0, 0, 1, 1,
0.6301762, 0.5118145, 1.776599, 0, 0, 0, 1, 1,
0.6401206, -0.2885892, 0.6195976, 1, 1, 1, 1, 1,
0.6415851, -0.9771803, 1.240946, 1, 1, 1, 1, 1,
0.6428177, 0.264624, 2.260187, 1, 1, 1, 1, 1,
0.6458036, 0.4269101, 1.401978, 1, 1, 1, 1, 1,
0.6483334, 0.3929876, 1.598024, 1, 1, 1, 1, 1,
0.6529986, 0.3618972, -0.2515042, 1, 1, 1, 1, 1,
0.6578454, -0.3374231, 0.02329023, 1, 1, 1, 1, 1,
0.6579655, 0.9862726, 0.9568523, 1, 1, 1, 1, 1,
0.6591759, 0.3658642, 1.712144, 1, 1, 1, 1, 1,
0.6602576, 0.7690253, 3.555664, 1, 1, 1, 1, 1,
0.6604736, -0.1815888, 2.493968, 1, 1, 1, 1, 1,
0.6628558, -0.5636778, 2.925927, 1, 1, 1, 1, 1,
0.6685892, -0.5805864, 1.144306, 1, 1, 1, 1, 1,
0.6688364, 0.196638, 3.113149, 1, 1, 1, 1, 1,
0.670962, -0.07688724, 1.20536, 1, 1, 1, 1, 1,
0.6710507, -0.8576081, 2.194508, 0, 0, 1, 1, 1,
0.671133, -1.748346, 3.286542, 1, 0, 0, 1, 1,
0.6748121, -1.333073, 1.580916, 1, 0, 0, 1, 1,
0.6824095, 0.937794, 2.618226, 1, 0, 0, 1, 1,
0.6830366, -0.9130248, 1.415636, 1, 0, 0, 1, 1,
0.6834488, -0.5311015, 1.64048, 1, 0, 0, 1, 1,
0.6854163, -1.434486, 2.824116, 0, 0, 0, 1, 1,
0.6860062, 1.411582, 0.2949822, 0, 0, 0, 1, 1,
0.6867322, -0.7153186, 4.155455, 0, 0, 0, 1, 1,
0.6897234, -0.2779619, 4.174663, 0, 0, 0, 1, 1,
0.6902218, 0.8016782, 1.145071, 0, 0, 0, 1, 1,
0.6932236, -0.4895161, 1.541989, 0, 0, 0, 1, 1,
0.6945101, -0.5171465, 2.681288, 0, 0, 0, 1, 1,
0.6954995, 0.397419, 0.136234, 1, 1, 1, 1, 1,
0.701081, -1.819433, 1.430089, 1, 1, 1, 1, 1,
0.7031311, -1.942742, 4.739448, 1, 1, 1, 1, 1,
0.7065347, 0.3479479, 1.811925, 1, 1, 1, 1, 1,
0.7128924, -0.3491793, 2.703723, 1, 1, 1, 1, 1,
0.7143784, 1.909881, -0.1424632, 1, 1, 1, 1, 1,
0.7182816, -0.6475105, 2.966103, 1, 1, 1, 1, 1,
0.7222873, 0.377344, -0.2867953, 1, 1, 1, 1, 1,
0.724219, -0.08748206, 1.821661, 1, 1, 1, 1, 1,
0.7289148, 0.3846571, 1.696712, 1, 1, 1, 1, 1,
0.7342482, -0.5617746, 0.9992055, 1, 1, 1, 1, 1,
0.7375792, -0.4929812, 2.849814, 1, 1, 1, 1, 1,
0.7415738, 0.3727756, -0.0002592705, 1, 1, 1, 1, 1,
0.7467236, -0.09134912, 0.467014, 1, 1, 1, 1, 1,
0.7468662, 0.2853902, 0.7785245, 1, 1, 1, 1, 1,
0.7507429, -0.274563, 3.039973, 0, 0, 1, 1, 1,
0.7515875, 0.4983483, 0.1565022, 1, 0, 0, 1, 1,
0.7526547, -0.1110227, 4.169102, 1, 0, 0, 1, 1,
0.7546238, 2.586149, 0.3025085, 1, 0, 0, 1, 1,
0.7583982, 0.55277, 1.807485, 1, 0, 0, 1, 1,
0.7600201, 1.869397, 0.6515853, 1, 0, 0, 1, 1,
0.7603805, 0.6611735, 0.4990664, 0, 0, 0, 1, 1,
0.7688711, -1.04575, 2.251101, 0, 0, 0, 1, 1,
0.7700678, -1.02191, 2.734152, 0, 0, 0, 1, 1,
0.7713568, 1.290607, 0.4920777, 0, 0, 0, 1, 1,
0.7725467, 1.964271, 0.2636383, 0, 0, 0, 1, 1,
0.7801273, 0.2901372, 0.9450995, 0, 0, 0, 1, 1,
0.7801287, -0.2846207, 3.23484, 0, 0, 0, 1, 1,
0.7808006, 1.936396, 0.6008278, 1, 1, 1, 1, 1,
0.7916119, 0.4272289, 0.4211049, 1, 1, 1, 1, 1,
0.7943913, -0.04160152, 2.885314, 1, 1, 1, 1, 1,
0.7976988, 1.528834, 1.747359, 1, 1, 1, 1, 1,
0.801433, 0.2614092, 0.9407099, 1, 1, 1, 1, 1,
0.8127308, -1.432229, 2.602709, 1, 1, 1, 1, 1,
0.8188186, 0.06076649, 2.280757, 1, 1, 1, 1, 1,
0.8201161, -1.41234, 3.23303, 1, 1, 1, 1, 1,
0.8205302, -0.3832344, 1.358297, 1, 1, 1, 1, 1,
0.8207884, -0.8920547, 4.020201, 1, 1, 1, 1, 1,
0.8266085, 1.391327, 1.571254, 1, 1, 1, 1, 1,
0.8298864, -1.342057, 2.793941, 1, 1, 1, 1, 1,
0.8368859, 1.658937, -0.3893583, 1, 1, 1, 1, 1,
0.8424796, 1.189166, -0.3174443, 1, 1, 1, 1, 1,
0.8449242, 1.833531, 0.9369723, 1, 1, 1, 1, 1,
0.8506022, 3.009477, 1.580669, 0, 0, 1, 1, 1,
0.8591083, 0.7263656, -0.6764621, 1, 0, 0, 1, 1,
0.862495, 1.372416, 1.180982, 1, 0, 0, 1, 1,
0.8673119, 0.5800028, 1.206365, 1, 0, 0, 1, 1,
0.8766999, -0.2004201, 2.815987, 1, 0, 0, 1, 1,
0.8779946, 1.114354, 0.5255389, 1, 0, 0, 1, 1,
0.8782037, 0.3123398, 2.08205, 0, 0, 0, 1, 1,
0.883128, -0.5201274, 2.985132, 0, 0, 0, 1, 1,
0.8940873, -0.4813223, 1.678286, 0, 0, 0, 1, 1,
0.8941266, -0.5831184, 5.351713, 0, 0, 0, 1, 1,
0.8944831, -0.8361433, 2.831115, 0, 0, 0, 1, 1,
0.8982323, -2.450791, 3.425803, 0, 0, 0, 1, 1,
0.9008199, -1.379333, 3.816334, 0, 0, 0, 1, 1,
0.9011482, -0.04178315, 0.5102218, 1, 1, 1, 1, 1,
0.9013832, 1.346459, 1.045411, 1, 1, 1, 1, 1,
0.9056216, -1.238505, 4.131295, 1, 1, 1, 1, 1,
0.9082382, -0.7101329, 4.101824, 1, 1, 1, 1, 1,
0.910877, -1.322316, 1.979181, 1, 1, 1, 1, 1,
0.9144647, 0.6516889, 1.189692, 1, 1, 1, 1, 1,
0.9147018, -1.836192, 3.96385, 1, 1, 1, 1, 1,
0.9178454, -2.013443, 3.26008, 1, 1, 1, 1, 1,
0.9284431, 0.237735, -0.2194794, 1, 1, 1, 1, 1,
0.9366028, 1.050922, 1.040682, 1, 1, 1, 1, 1,
0.9431052, 0.6325825, 0.3806956, 1, 1, 1, 1, 1,
0.9548964, 0.1577102, 2.484819, 1, 1, 1, 1, 1,
0.9585963, 0.7323207, 1.001389, 1, 1, 1, 1, 1,
0.9670066, -0.145618, 0.48237, 1, 1, 1, 1, 1,
0.9706566, -0.873292, 2.336585, 1, 1, 1, 1, 1,
0.9720395, -0.3606129, 3.073503, 0, 0, 1, 1, 1,
0.9805494, 1.35206, 2.872552, 1, 0, 0, 1, 1,
0.9828253, 0.2434061, 1.077044, 1, 0, 0, 1, 1,
0.9888972, -0.145991, -0.5118795, 1, 0, 0, 1, 1,
0.9891927, -0.04227515, 1.267886, 1, 0, 0, 1, 1,
0.9949976, 0.8978768, -0.1784155, 1, 0, 0, 1, 1,
0.9952807, -1.0153, 3.122708, 0, 0, 0, 1, 1,
0.9955866, -0.3114663, 3.947752, 0, 0, 0, 1, 1,
0.9968119, 1.40693, -0.4237815, 0, 0, 0, 1, 1,
1.005348, -0.07898729, 0.8556917, 0, 0, 0, 1, 1,
1.006081, -0.05115162, 1.510383, 0, 0, 0, 1, 1,
1.007989, 1.310919, 2.689988, 0, 0, 0, 1, 1,
1.00939, 0.3827232, 1.554946, 0, 0, 0, 1, 1,
1.011869, 0.1483674, 2.790552, 1, 1, 1, 1, 1,
1.012859, -0.01434545, 3.057194, 1, 1, 1, 1, 1,
1.023946, -1.398304, 4.082035, 1, 1, 1, 1, 1,
1.027573, -0.0928307, 1.377013, 1, 1, 1, 1, 1,
1.065375, 0.1478635, 0.7390046, 1, 1, 1, 1, 1,
1.076198, 0.7186454, -0.004677557, 1, 1, 1, 1, 1,
1.097756, 1.922862, 1.408686, 1, 1, 1, 1, 1,
1.099367, 1.305661, 1.563847, 1, 1, 1, 1, 1,
1.101572, 0.9936447, 1.194576, 1, 1, 1, 1, 1,
1.101776, -0.3022583, 2.001281, 1, 1, 1, 1, 1,
1.127098, 0.4470665, 0.6731023, 1, 1, 1, 1, 1,
1.134778, -0.4921775, 1.337727, 1, 1, 1, 1, 1,
1.136076, -0.9827821, 4.522441, 1, 1, 1, 1, 1,
1.137614, -0.9822242, 1.643006, 1, 1, 1, 1, 1,
1.138267, -0.1897007, 0.8064401, 1, 1, 1, 1, 1,
1.141238, -0.3532513, 3.26148, 0, 0, 1, 1, 1,
1.151429, -0.1235816, 0.5131829, 1, 0, 0, 1, 1,
1.153272, -0.6857783, 1.100648, 1, 0, 0, 1, 1,
1.157147, 0.02798922, 1.190804, 1, 0, 0, 1, 1,
1.158192, 0.3904791, 1.319725, 1, 0, 0, 1, 1,
1.162375, 0.6759201, 0.3703562, 1, 0, 0, 1, 1,
1.166613, -1.069443, 3.780496, 0, 0, 0, 1, 1,
1.178131, -0.8684514, 2.13538, 0, 0, 0, 1, 1,
1.18537, 1.457382, 0.51367, 0, 0, 0, 1, 1,
1.185622, 0.479744, 0.927672, 0, 0, 0, 1, 1,
1.192626, 0.6699456, -0.4502617, 0, 0, 0, 1, 1,
1.197801, 0.2817807, 0.6211122, 0, 0, 0, 1, 1,
1.199506, -0.1905679, -0.2182118, 0, 0, 0, 1, 1,
1.201037, 0.3416753, 0.5905926, 1, 1, 1, 1, 1,
1.204059, -0.09886802, 1.400548, 1, 1, 1, 1, 1,
1.214263, -0.9979903, 1.624012, 1, 1, 1, 1, 1,
1.218421, -0.6371037, 3.009472, 1, 1, 1, 1, 1,
1.230817, -0.1461757, 2.237383, 1, 1, 1, 1, 1,
1.231837, 0.2564305, 1.408472, 1, 1, 1, 1, 1,
1.252351, -1.131574, 2.759387, 1, 1, 1, 1, 1,
1.257765, -0.5163598, 1.32448, 1, 1, 1, 1, 1,
1.26552, -0.5782164, 3.772046, 1, 1, 1, 1, 1,
1.266887, -0.8857648, -0.1774626, 1, 1, 1, 1, 1,
1.279454, -0.7218054, 1.758623, 1, 1, 1, 1, 1,
1.280565, -0.1478618, 2.330123, 1, 1, 1, 1, 1,
1.294967, -0.7543729, 3.003409, 1, 1, 1, 1, 1,
1.300636, -0.3699682, -0.4539098, 1, 1, 1, 1, 1,
1.301858, 0.05914395, 3.880713, 1, 1, 1, 1, 1,
1.309314, 0.9446086, -1.180032, 0, 0, 1, 1, 1,
1.31496, 0.5694559, 1.817195, 1, 0, 0, 1, 1,
1.316412, -0.7786555, 2.843498, 1, 0, 0, 1, 1,
1.321157, -1.534101, 1.262935, 1, 0, 0, 1, 1,
1.33414, 1.154784, 0.3394747, 1, 0, 0, 1, 1,
1.337098, 1.586363, -0.3692014, 1, 0, 0, 1, 1,
1.343751, -0.1312279, 1.337647, 0, 0, 0, 1, 1,
1.347033, -0.6440959, 0.2448464, 0, 0, 0, 1, 1,
1.353258, 0.5644339, 2.360512, 0, 0, 0, 1, 1,
1.364451, 0.890512, 1.003429, 0, 0, 0, 1, 1,
1.369852, 1.20669, -0.5168662, 0, 0, 0, 1, 1,
1.386942, -0.5524701, 2.575989, 0, 0, 0, 1, 1,
1.404682, 0.3645801, 0.815659, 0, 0, 0, 1, 1,
1.408497, -1.107807, 2.041059, 1, 1, 1, 1, 1,
1.426868, 0.6411716, 0.3594379, 1, 1, 1, 1, 1,
1.428083, -1.613483, 0.8697721, 1, 1, 1, 1, 1,
1.431564, 1.310962, 1.726896, 1, 1, 1, 1, 1,
1.434256, 0.2864554, 2.466608, 1, 1, 1, 1, 1,
1.44529, 0.4970269, 1.059993, 1, 1, 1, 1, 1,
1.450454, 0.5186334, 1.998576, 1, 1, 1, 1, 1,
1.467768, 1.561738, 1.136244, 1, 1, 1, 1, 1,
1.473163, 0.7550762, 2.679515, 1, 1, 1, 1, 1,
1.482496, 0.8785608, 0.5619524, 1, 1, 1, 1, 1,
1.486, 0.4187448, 2.318738, 1, 1, 1, 1, 1,
1.4973, 0.2280883, 2.943589, 1, 1, 1, 1, 1,
1.513641, -3.509155, 3.636892, 1, 1, 1, 1, 1,
1.515809, 0.1224826, 0.1701443, 1, 1, 1, 1, 1,
1.516049, -0.2287214, 3.562485, 1, 1, 1, 1, 1,
1.526638, 0.424356, 1.097611, 0, 0, 1, 1, 1,
1.548742, -0.5981552, 2.598161, 1, 0, 0, 1, 1,
1.553637, 0.1937585, 2.688728, 1, 0, 0, 1, 1,
1.557519, -0.1083183, 0.8653544, 1, 0, 0, 1, 1,
1.559437, 0.4514502, 1.848632, 1, 0, 0, 1, 1,
1.563283, 0.8321054, -0.0681989, 1, 0, 0, 1, 1,
1.563352, -0.3438645, 2.40206, 0, 0, 0, 1, 1,
1.566724, 1.40755, -0.2859345, 0, 0, 0, 1, 1,
1.582665, -1.115808, 1.261184, 0, 0, 0, 1, 1,
1.591487, 0.577345, 1.728175, 0, 0, 0, 1, 1,
1.59409, -0.06734788, 2.054557, 0, 0, 0, 1, 1,
1.596613, 0.4912074, -0.2006294, 0, 0, 0, 1, 1,
1.60613, 0.3082761, 2.500368, 0, 0, 0, 1, 1,
1.614586, 0.9853467, 0.861957, 1, 1, 1, 1, 1,
1.625418, -0.9561965, 0.7840434, 1, 1, 1, 1, 1,
1.630703, -0.6712371, 1.037237, 1, 1, 1, 1, 1,
1.640358, 0.8383933, 0.4954612, 1, 1, 1, 1, 1,
1.660798, -0.530966, 1.854339, 1, 1, 1, 1, 1,
1.682044, 1.551868, 1.142524, 1, 1, 1, 1, 1,
1.687047, -0.9334579, 3.376088, 1, 1, 1, 1, 1,
1.688477, 1.733967, -0.9539387, 1, 1, 1, 1, 1,
1.696561, 1.184381, 0.2141197, 1, 1, 1, 1, 1,
1.700228, 0.1365421, 0.6824234, 1, 1, 1, 1, 1,
1.70843, -0.4154161, 2.494118, 1, 1, 1, 1, 1,
1.735205, 0.9168444, -0.05223184, 1, 1, 1, 1, 1,
1.73671, 0.8457958, 2.501215, 1, 1, 1, 1, 1,
1.738035, 0.5192056, 1.398172, 1, 1, 1, 1, 1,
1.768811, 0.2750235, 0.7510667, 1, 1, 1, 1, 1,
1.779025, 1.39343, 1.461873, 0, 0, 1, 1, 1,
1.781817, 0.9561014, -1.20867, 1, 0, 0, 1, 1,
1.808593, -1.019448, 0.9470125, 1, 0, 0, 1, 1,
1.827954, 0.3877609, 1.089324, 1, 0, 0, 1, 1,
1.834687, -0.3722698, 1.992096, 1, 0, 0, 1, 1,
1.838073, 0.7828587, 2.706194, 1, 0, 0, 1, 1,
1.842409, -0.08550251, 2.676971, 0, 0, 0, 1, 1,
1.84643, 1.180284, 1.451017, 0, 0, 0, 1, 1,
1.856023, -0.3853133, 1.912041, 0, 0, 0, 1, 1,
1.860249, 1.397069, 2.278585, 0, 0, 0, 1, 1,
1.862342, -0.7391936, 0.5727672, 0, 0, 0, 1, 1,
1.864442, 0.9180185, 0.2860021, 0, 0, 0, 1, 1,
1.917621, -0.5493187, 2.569712, 0, 0, 0, 1, 1,
1.919638, 0.3700276, 0.853107, 1, 1, 1, 1, 1,
1.921355, 1.95158, 2.063389, 1, 1, 1, 1, 1,
1.957857, 0.5090171, 2.39084, 1, 1, 1, 1, 1,
1.975701, 0.2969113, 0.7269239, 1, 1, 1, 1, 1,
1.975846, -1.360162, 2.207317, 1, 1, 1, 1, 1,
1.980312, 0.2206425, 1.369195, 1, 1, 1, 1, 1,
1.993562, -0.2437796, 0.5945852, 1, 1, 1, 1, 1,
1.998577, 0.1596805, 1.169855, 1, 1, 1, 1, 1,
2.002337, -0.1549192, 2.732252, 1, 1, 1, 1, 1,
2.008416, -0.01929904, 1.966264, 1, 1, 1, 1, 1,
2.020226, 1.590087, 0.5854545, 1, 1, 1, 1, 1,
2.063795, 1.430425, 2.450947, 1, 1, 1, 1, 1,
2.126718, 0.1290665, 1.342879, 1, 1, 1, 1, 1,
2.146252, 0.7239366, 1.448117, 1, 1, 1, 1, 1,
2.193445, -0.1685582, 3.109023, 1, 1, 1, 1, 1,
2.197265, -0.9574544, 3.064162, 0, 0, 1, 1, 1,
2.197568, 0.8351585, 0.5096413, 1, 0, 0, 1, 1,
2.242478, 1.880101, 0.9542242, 1, 0, 0, 1, 1,
2.261334, 0.01627047, 1.727523, 1, 0, 0, 1, 1,
2.26158, 1.552331, 2.292006, 1, 0, 0, 1, 1,
2.298219, -0.3250103, 1.405424, 1, 0, 0, 1, 1,
2.311237, 2.103957, 1.439873, 0, 0, 0, 1, 1,
2.332955, 0.1596137, 3.189474, 0, 0, 0, 1, 1,
2.533509, -0.7687145, 1.473365, 0, 0, 0, 1, 1,
2.540509, 0.04617888, 0.9756421, 0, 0, 0, 1, 1,
2.549332, -0.500812, 1.119395, 0, 0, 0, 1, 1,
2.550496, 0.1522338, 1.210924, 0, 0, 0, 1, 1,
2.595576, -1.050046, 2.081269, 0, 0, 0, 1, 1,
2.666746, -0.8513331, 3.403536, 1, 1, 1, 1, 1,
2.714163, 0.7353979, 1.340673, 1, 1, 1, 1, 1,
2.733385, -0.5246956, 1.372284, 1, 1, 1, 1, 1,
2.763019, -0.4719702, 0.7632923, 1, 1, 1, 1, 1,
2.857715, -1.082397, 2.474232, 1, 1, 1, 1, 1,
3.023057, 0.5134038, 2.509614, 1, 1, 1, 1, 1,
3.417827, 0.860471, 1.480433, 1, 1, 1, 1, 1
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
var radius = 9.599962;
var distance = 33.71946;
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
mvMatrix.translate( -0.2118069, 0.2498388, -0.0009412766 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71946);
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
