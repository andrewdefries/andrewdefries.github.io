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
-3.104369, 1.828446, -0.5891784, 1, 0, 0, 1,
-2.732745, -0.6665866, -2.224521, 1, 0.007843138, 0, 1,
-2.69083, 1.488676, -0.927604, 1, 0.01176471, 0, 1,
-2.655431, -0.1400015, -2.724814, 1, 0.01960784, 0, 1,
-2.622571, 0.2092585, -3.224698, 1, 0.02352941, 0, 1,
-2.616876, -0.739868, -2.757681, 1, 0.03137255, 0, 1,
-2.344813, 1.117592, -2.863698, 1, 0.03529412, 0, 1,
-2.30607, -1.013607, -1.757386, 1, 0.04313726, 0, 1,
-2.147772, 1.286707, -2.306693, 1, 0.04705882, 0, 1,
-2.132699, -1.476363, -1.810878, 1, 0.05490196, 0, 1,
-2.12757, 1.038817, -0.9776515, 1, 0.05882353, 0, 1,
-2.100432, 2.423187, -0.6564155, 1, 0.06666667, 0, 1,
-2.03363, -1.58069, -2.877865, 1, 0.07058824, 0, 1,
-2.005449, 1.656172, -1.383638, 1, 0.07843138, 0, 1,
-1.986384, 0.7952714, -0.967056, 1, 0.08235294, 0, 1,
-1.950866, -0.6405401, -3.198458, 1, 0.09019608, 0, 1,
-1.943192, -0.102835, -1.712267, 1, 0.09411765, 0, 1,
-1.934527, -0.7504432, -0.2751393, 1, 0.1019608, 0, 1,
-1.93396, 0.6956642, -2.055552, 1, 0.1098039, 0, 1,
-1.922074, -1.55587, -2.467705, 1, 0.1137255, 0, 1,
-1.921011, -0.544448, -1.560313, 1, 0.1215686, 0, 1,
-1.911108, -1.676343, -1.879221, 1, 0.1254902, 0, 1,
-1.905423, 0.1426235, -0.6754786, 1, 0.1333333, 0, 1,
-1.895135, -0.7971365, -1.17085, 1, 0.1372549, 0, 1,
-1.887353, 1.092525, -1.080911, 1, 0.145098, 0, 1,
-1.887351, 1.855637, -0.8745592, 1, 0.1490196, 0, 1,
-1.874468, -0.6530548, -1.45328, 1, 0.1568628, 0, 1,
-1.871194, 0.2450308, -0.9411674, 1, 0.1607843, 0, 1,
-1.869678, 1.820445, -0.5280834, 1, 0.1686275, 0, 1,
-1.831984, -1.076212, -2.642972, 1, 0.172549, 0, 1,
-1.783214, 2.749787, 0.7383118, 1, 0.1803922, 0, 1,
-1.766181, 1.438196, -0.9531818, 1, 0.1843137, 0, 1,
-1.75616, -0.3918156, -1.164253, 1, 0.1921569, 0, 1,
-1.753262, -0.3042349, -4.057913, 1, 0.1960784, 0, 1,
-1.753102, 0.7068717, 0.08008513, 1, 0.2039216, 0, 1,
-1.733975, -1.012045, -2.709141, 1, 0.2117647, 0, 1,
-1.729371, -0.6064236, -0.4028145, 1, 0.2156863, 0, 1,
-1.727411, 0.06200534, -2.07206, 1, 0.2235294, 0, 1,
-1.723922, -0.6306076, -2.521576, 1, 0.227451, 0, 1,
-1.71847, 1.347255, -0.9080709, 1, 0.2352941, 0, 1,
-1.715736, 0.6726236, 0.1692961, 1, 0.2392157, 0, 1,
-1.715489, 2.4475, -1.066914, 1, 0.2470588, 0, 1,
-1.715389, -0.6192902, -1.430573, 1, 0.2509804, 0, 1,
-1.711139, 0.336808, -0.7006773, 1, 0.2588235, 0, 1,
-1.705041, -0.9235204, -2.080199, 1, 0.2627451, 0, 1,
-1.676773, -1.25118, -2.669374, 1, 0.2705882, 0, 1,
-1.67533, -0.3662159, 0.3308442, 1, 0.2745098, 0, 1,
-1.674153, -1.18983, -1.696565, 1, 0.282353, 0, 1,
-1.673941, 0.2358196, -0.7247961, 1, 0.2862745, 0, 1,
-1.672995, 0.09742452, -1.415066, 1, 0.2941177, 0, 1,
-1.63473, -0.4340429, -2.060138, 1, 0.3019608, 0, 1,
-1.621212, -1.347448, -1.393921, 1, 0.3058824, 0, 1,
-1.621164, -0.07311089, -2.998275, 1, 0.3137255, 0, 1,
-1.610472, -0.08417154, -2.507874, 1, 0.3176471, 0, 1,
-1.607154, 2.548017, 0.04977484, 1, 0.3254902, 0, 1,
-1.599346, 0.3556745, -1.723446, 1, 0.3294118, 0, 1,
-1.598884, 0.6897984, -1.426524, 1, 0.3372549, 0, 1,
-1.597654, 0.6762543, -0.1492522, 1, 0.3411765, 0, 1,
-1.59741, 0.9912646, -1.6563, 1, 0.3490196, 0, 1,
-1.593395, 0.3127686, -2.639304, 1, 0.3529412, 0, 1,
-1.592194, -3.237901, -2.321318, 1, 0.3607843, 0, 1,
-1.591661, 1.073194, -1.979869, 1, 0.3647059, 0, 1,
-1.590396, 1.326978, -0.3889989, 1, 0.372549, 0, 1,
-1.564213, 1.199375, -0.3979796, 1, 0.3764706, 0, 1,
-1.546167, 1.352499, -1.122867, 1, 0.3843137, 0, 1,
-1.544849, -0.7131967, -0.6680548, 1, 0.3882353, 0, 1,
-1.526853, 0.5586603, -1.857967, 1, 0.3960784, 0, 1,
-1.521938, -0.432496, -1.609114, 1, 0.4039216, 0, 1,
-1.521425, -0.6978472, -1.690019, 1, 0.4078431, 0, 1,
-1.492016, 0.6011286, -2.842293, 1, 0.4156863, 0, 1,
-1.480909, 0.7756882, -3.997722, 1, 0.4196078, 0, 1,
-1.477765, -0.9142186, -2.500748, 1, 0.427451, 0, 1,
-1.475137, -0.4941531, -0.4842634, 1, 0.4313726, 0, 1,
-1.457734, -1.381032, -2.232618, 1, 0.4392157, 0, 1,
-1.456948, -0.7332423, -1.116076, 1, 0.4431373, 0, 1,
-1.455918, 0.2478387, -2.312784, 1, 0.4509804, 0, 1,
-1.453884, 0.1717954, -1.247957, 1, 0.454902, 0, 1,
-1.45257, -0.9000268, -4.127181, 1, 0.4627451, 0, 1,
-1.442525, -0.1166504, -2.11002, 1, 0.4666667, 0, 1,
-1.435585, -0.7589747, -0.005329277, 1, 0.4745098, 0, 1,
-1.435401, -0.90213, -2.861019, 1, 0.4784314, 0, 1,
-1.409407, 0.3110131, -2.163509, 1, 0.4862745, 0, 1,
-1.394612, -1.485468, -2.863015, 1, 0.4901961, 0, 1,
-1.376916, 0.2546454, -2.457175, 1, 0.4980392, 0, 1,
-1.375423, -0.02206569, 0.08100718, 1, 0.5058824, 0, 1,
-1.372323, 1.116866, -0.4934287, 1, 0.509804, 0, 1,
-1.362934, 0.02247703, -1.794046, 1, 0.5176471, 0, 1,
-1.35509, 0.09309312, -1.147086, 1, 0.5215687, 0, 1,
-1.345536, -0.06154, -1.300998, 1, 0.5294118, 0, 1,
-1.328392, -0.531222, -1.10666, 1, 0.5333334, 0, 1,
-1.320737, -1.367251, -1.636901, 1, 0.5411765, 0, 1,
-1.311499, -1.554505, -2.87121, 1, 0.5450981, 0, 1,
-1.309273, -0.7794076, -1.772955, 1, 0.5529412, 0, 1,
-1.307034, 0.9180593, 0.8914382, 1, 0.5568628, 0, 1,
-1.303431, 1.764978, -1.181087, 1, 0.5647059, 0, 1,
-1.296958, 0.775196, -1.201797, 1, 0.5686275, 0, 1,
-1.293337, -1.450757, -4.057221, 1, 0.5764706, 0, 1,
-1.292915, 1.213872, -1.060727, 1, 0.5803922, 0, 1,
-1.291486, -1.240002, -2.170366, 1, 0.5882353, 0, 1,
-1.285932, -1.418576, -1.582802, 1, 0.5921569, 0, 1,
-1.284626, 1.05888, -0.9826389, 1, 0.6, 0, 1,
-1.280712, 0.7195217, -1.31042, 1, 0.6078432, 0, 1,
-1.279649, 1.621646, -2.112226, 1, 0.6117647, 0, 1,
-1.271888, 0.05711151, -0.9405897, 1, 0.6196079, 0, 1,
-1.2717, 0.4796576, -1.597594, 1, 0.6235294, 0, 1,
-1.269829, 1.834065, -0.6345648, 1, 0.6313726, 0, 1,
-1.268528, -1.618816, -2.111417, 1, 0.6352941, 0, 1,
-1.262876, -0.9151959, -1.765071, 1, 0.6431373, 0, 1,
-1.249223, 0.213247, -1.277145, 1, 0.6470588, 0, 1,
-1.243256, 0.1278322, -1.787647, 1, 0.654902, 0, 1,
-1.237636, -0.3167913, -1.625388, 1, 0.6588235, 0, 1,
-1.22792, -0.3583635, -1.166001, 1, 0.6666667, 0, 1,
-1.222436, 0.4133155, -3.025243, 1, 0.6705883, 0, 1,
-1.2207, -0.7623946, -1.927623, 1, 0.6784314, 0, 1,
-1.209982, 0.2920136, -1.494557, 1, 0.682353, 0, 1,
-1.207544, 0.3398044, -2.347488, 1, 0.6901961, 0, 1,
-1.2064, -2.175267, -2.491036, 1, 0.6941177, 0, 1,
-1.199594, -0.3157121, -2.077446, 1, 0.7019608, 0, 1,
-1.186618, 2.019331, -1.965807, 1, 0.7098039, 0, 1,
-1.161516, -1.04609, -2.497516, 1, 0.7137255, 0, 1,
-1.158541, -0.9460849, -1.217151, 1, 0.7215686, 0, 1,
-1.155041, 0.4462374, -3.14331, 1, 0.7254902, 0, 1,
-1.153968, 0.1358003, -1.298959, 1, 0.7333333, 0, 1,
-1.14958, 0.7010705, 1.225673, 1, 0.7372549, 0, 1,
-1.148268, -0.2162369, -1.569485, 1, 0.7450981, 0, 1,
-1.144385, 0.01688421, -2.715306, 1, 0.7490196, 0, 1,
-1.143233, -0.002809922, -1.228134, 1, 0.7568628, 0, 1,
-1.142155, 2.122104, 1.882796, 1, 0.7607843, 0, 1,
-1.139241, 0.8519054, -2.306475, 1, 0.7686275, 0, 1,
-1.138497, -0.08638957, -0.4612008, 1, 0.772549, 0, 1,
-1.133533, 1.075536, -0.0427972, 1, 0.7803922, 0, 1,
-1.128056, -0.07393435, -1.531544, 1, 0.7843137, 0, 1,
-1.115952, -1.074266, -1.37519, 1, 0.7921569, 0, 1,
-1.110787, 0.7342259, -1.876161, 1, 0.7960784, 0, 1,
-1.105929, -1.866865, -3.245634, 1, 0.8039216, 0, 1,
-1.104006, -1.342002, -2.860416, 1, 0.8117647, 0, 1,
-1.092478, 0.05161506, -1.489679, 1, 0.8156863, 0, 1,
-1.080378, -0.7057597, -2.799964, 1, 0.8235294, 0, 1,
-1.080211, -1.47203, -1.864472, 1, 0.827451, 0, 1,
-1.078221, 1.352191, -3.290007, 1, 0.8352941, 0, 1,
-1.074651, 1.871207, 0.5273464, 1, 0.8392157, 0, 1,
-1.072549, -0.5357754, -2.149014, 1, 0.8470588, 0, 1,
-1.064948, -0.3391811, -1.025355, 1, 0.8509804, 0, 1,
-1.064744, 1.105183, 0.2424506, 1, 0.8588235, 0, 1,
-1.057361, 1.632489, 0.009900604, 1, 0.8627451, 0, 1,
-1.056561, 1.358923, -0.01184933, 1, 0.8705882, 0, 1,
-1.046498, 0.0344911, -1.027768, 1, 0.8745098, 0, 1,
-1.041193, -0.4752052, -2.648113, 1, 0.8823529, 0, 1,
-1.036171, 1.128717, -0.7079859, 1, 0.8862745, 0, 1,
-1.032581, 1.685368, -1.870358, 1, 0.8941177, 0, 1,
-1.030695, 1.461377, -0.4956243, 1, 0.8980392, 0, 1,
-1.029719, 0.1322032, 1.145483, 1, 0.9058824, 0, 1,
-1.026356, 0.254994, -0.9352174, 1, 0.9137255, 0, 1,
-1.02256, -0.0230484, -2.215721, 1, 0.9176471, 0, 1,
-1.019168, 0.7653782, -0.6875933, 1, 0.9254902, 0, 1,
-1.015767, -0.2917037, -1.96912, 1, 0.9294118, 0, 1,
-1.015546, -0.7455699, -2.345035, 1, 0.9372549, 0, 1,
-1.012937, 1.049113, -0.1225153, 1, 0.9411765, 0, 1,
-1.006957, -1.727019, -1.579683, 1, 0.9490196, 0, 1,
-1.006112, 0.7523423, -2.035531, 1, 0.9529412, 0, 1,
-1.003037, -1.194455, -2.492079, 1, 0.9607843, 0, 1,
-1.00232, -0.8844926, -1.50848, 1, 0.9647059, 0, 1,
-0.9952279, -1.33912, -3.231435, 1, 0.972549, 0, 1,
-0.9898811, 1.543239, -0.8866648, 1, 0.9764706, 0, 1,
-0.9858332, -1.121299, -2.092178, 1, 0.9843137, 0, 1,
-0.9779272, 0.7568511, -3.096466, 1, 0.9882353, 0, 1,
-0.9714744, -0.6306672, -1.517182, 1, 0.9960784, 0, 1,
-0.96303, 0.03646076, -1.903138, 0.9960784, 1, 0, 1,
-0.9598143, 0.4803684, -2.118234, 0.9921569, 1, 0, 1,
-0.9597338, -1.301092, -1.399577, 0.9843137, 1, 0, 1,
-0.9595447, -0.08793759, -0.8405617, 0.9803922, 1, 0, 1,
-0.9561954, -0.4240078, -3.552656, 0.972549, 1, 0, 1,
-0.953872, 1.109005, -1.142843, 0.9686275, 1, 0, 1,
-0.9525145, -0.2435823, 1.139889, 0.9607843, 1, 0, 1,
-0.9476001, 0.3945564, -1.181469, 0.9568627, 1, 0, 1,
-0.9402469, -1.190724, -2.69635, 0.9490196, 1, 0, 1,
-0.9397369, -0.5403823, -0.8002958, 0.945098, 1, 0, 1,
-0.9260347, -0.04154287, -1.375689, 0.9372549, 1, 0, 1,
-0.9250655, -0.9969468, -0.9320821, 0.9333333, 1, 0, 1,
-0.9210008, -0.2377564, -1.941099, 0.9254902, 1, 0, 1,
-0.9066284, -1.577222, -3.158867, 0.9215686, 1, 0, 1,
-0.9065108, 1.138963, -1.200976, 0.9137255, 1, 0, 1,
-0.8972425, -0.8071613, -1.403394, 0.9098039, 1, 0, 1,
-0.8939764, 0.458064, 0.5859693, 0.9019608, 1, 0, 1,
-0.8897996, -0.5175279, -3.351782, 0.8941177, 1, 0, 1,
-0.8891351, -2.023221, -4.136623, 0.8901961, 1, 0, 1,
-0.8874239, -0.4713136, -3.441328, 0.8823529, 1, 0, 1,
-0.8825575, 1.88342, 0.8559636, 0.8784314, 1, 0, 1,
-0.8653876, 0.5978168, -1.575593, 0.8705882, 1, 0, 1,
-0.8648904, -1.026199, -1.400307, 0.8666667, 1, 0, 1,
-0.864266, -0.5537837, -2.150898, 0.8588235, 1, 0, 1,
-0.8632919, 0.4504503, -1.092803, 0.854902, 1, 0, 1,
-0.8502001, -1.5904, -2.700682, 0.8470588, 1, 0, 1,
-0.8485982, -0.5182949, -3.259055, 0.8431373, 1, 0, 1,
-0.8456283, -0.496913, -3.154273, 0.8352941, 1, 0, 1,
-0.8448659, -2.155149, -0.3946593, 0.8313726, 1, 0, 1,
-0.8443057, -0.460373, -2.156769, 0.8235294, 1, 0, 1,
-0.8428758, -0.1124289, -2.369521, 0.8196079, 1, 0, 1,
-0.8425043, -0.4636648, -3.270861, 0.8117647, 1, 0, 1,
-0.8336905, 2.559954, -1.253726, 0.8078431, 1, 0, 1,
-0.8331958, -0.2134131, 0.2325127, 0.8, 1, 0, 1,
-0.8320629, -0.3069299, -2.813222, 0.7921569, 1, 0, 1,
-0.8307442, -1.810375, -2.765403, 0.7882353, 1, 0, 1,
-0.8219302, -0.2202399, -1.951426, 0.7803922, 1, 0, 1,
-0.8141314, 0.2359141, -2.749846, 0.7764706, 1, 0, 1,
-0.8096322, 0.4248167, -1.92862, 0.7686275, 1, 0, 1,
-0.8057117, 0.4859727, -0.6759543, 0.7647059, 1, 0, 1,
-0.7959149, 1.32463, 0.2127517, 0.7568628, 1, 0, 1,
-0.7927322, 0.800724, -0.069244, 0.7529412, 1, 0, 1,
-0.7896107, 1.404625, -0.6915399, 0.7450981, 1, 0, 1,
-0.7874887, -1.91405, -2.007966, 0.7411765, 1, 0, 1,
-0.786884, -0.6960499, -2.409179, 0.7333333, 1, 0, 1,
-0.7830167, -0.7362663, -1.016557, 0.7294118, 1, 0, 1,
-0.7788779, 1.224583, -1.304554, 0.7215686, 1, 0, 1,
-0.7754731, -0.240126, -1.895644, 0.7176471, 1, 0, 1,
-0.7710106, -0.5134723, -3.260075, 0.7098039, 1, 0, 1,
-0.7652625, -1.407429, -1.928222, 0.7058824, 1, 0, 1,
-0.7591463, 0.9906863, 0.05356058, 0.6980392, 1, 0, 1,
-0.7570364, -0.9331071, -3.069612, 0.6901961, 1, 0, 1,
-0.7542136, 0.5570414, -0.3834684, 0.6862745, 1, 0, 1,
-0.7493797, 1.501931, 0.7588148, 0.6784314, 1, 0, 1,
-0.7454917, 1.529824, 1.043518, 0.6745098, 1, 0, 1,
-0.7422672, -0.2983832, -2.784471, 0.6666667, 1, 0, 1,
-0.735511, 0.4738028, -0.6050759, 0.6627451, 1, 0, 1,
-0.7325723, 1.449811, 0.843901, 0.654902, 1, 0, 1,
-0.7308813, 2.091922, 0.005838803, 0.6509804, 1, 0, 1,
-0.7292034, -0.1992741, -1.587553, 0.6431373, 1, 0, 1,
-0.7226804, 0.3868708, -1.145216, 0.6392157, 1, 0, 1,
-0.7225837, -0.8607239, -4.557606, 0.6313726, 1, 0, 1,
-0.7204425, 0.875695, 1.576795, 0.627451, 1, 0, 1,
-0.716389, -0.3701629, -3.095448, 0.6196079, 1, 0, 1,
-0.7064556, -0.4284545, -1.780471, 0.6156863, 1, 0, 1,
-0.7045956, -1.361725, -3.561596, 0.6078432, 1, 0, 1,
-0.7023706, -1.093775, -2.083267, 0.6039216, 1, 0, 1,
-0.692845, 0.4495085, -1.371151, 0.5960785, 1, 0, 1,
-0.690914, -1.309074, -2.27951, 0.5882353, 1, 0, 1,
-0.6877341, -1.118556, -2.449468, 0.5843138, 1, 0, 1,
-0.6832916, -0.9221693, -4.249479, 0.5764706, 1, 0, 1,
-0.6812737, 1.042486, -1.801986, 0.572549, 1, 0, 1,
-0.6799135, -1.439849, -2.953904, 0.5647059, 1, 0, 1,
-0.6795434, -0.7824226, -1.395249, 0.5607843, 1, 0, 1,
-0.6785724, -0.1296883, -3.816545, 0.5529412, 1, 0, 1,
-0.6772013, 1.083467, 0.02373987, 0.5490196, 1, 0, 1,
-0.6771247, -0.1034268, -1.644677, 0.5411765, 1, 0, 1,
-0.6757046, -0.1351041, -0.06655392, 0.5372549, 1, 0, 1,
-0.6706836, -2.568818, -3.290883, 0.5294118, 1, 0, 1,
-0.6601781, 1.440862, -1.793565, 0.5254902, 1, 0, 1,
-0.6557921, 1.829906, 0.5171327, 0.5176471, 1, 0, 1,
-0.6553857, -1.392055, -3.647528, 0.5137255, 1, 0, 1,
-0.6459215, 1.264939, 1.83714, 0.5058824, 1, 0, 1,
-0.6452737, 0.8758498, -0.3308281, 0.5019608, 1, 0, 1,
-0.642316, 0.9848199, -1.022595, 0.4941176, 1, 0, 1,
-0.6408274, 1.173794, 0.2227026, 0.4862745, 1, 0, 1,
-0.6343635, -1.931559, -2.077998, 0.4823529, 1, 0, 1,
-0.6339248, 0.3951845, -2.050388, 0.4745098, 1, 0, 1,
-0.6334293, 0.6491636, -1.937106, 0.4705882, 1, 0, 1,
-0.6314065, -0.4036705, -3.702085, 0.4627451, 1, 0, 1,
-0.6309381, -0.6876265, -1.947349, 0.4588235, 1, 0, 1,
-0.6235221, 0.2098225, -1.297711, 0.4509804, 1, 0, 1,
-0.6160047, -2.003621, -1.549211, 0.4470588, 1, 0, 1,
-0.6127661, 0.626882, -2.064311, 0.4392157, 1, 0, 1,
-0.6057081, -0.8876827, -3.964363, 0.4352941, 1, 0, 1,
-0.6035608, 0.8991178, -1.105321, 0.427451, 1, 0, 1,
-0.6032935, 0.3433723, -1.165475, 0.4235294, 1, 0, 1,
-0.6010719, 0.204599, -0.2075512, 0.4156863, 1, 0, 1,
-0.5963227, -1.033094, -3.506565, 0.4117647, 1, 0, 1,
-0.5853354, 0.1098009, -0.8656605, 0.4039216, 1, 0, 1,
-0.5844854, 0.8303956, -0.6982594, 0.3960784, 1, 0, 1,
-0.5843503, 0.03151199, -0.0951851, 0.3921569, 1, 0, 1,
-0.5812472, -0.4672008, -2.30156, 0.3843137, 1, 0, 1,
-0.5757725, 2.136076, 0.7906212, 0.3803922, 1, 0, 1,
-0.5752588, -0.2864861, -2.248712, 0.372549, 1, 0, 1,
-0.5717277, 0.2495648, -1.368161, 0.3686275, 1, 0, 1,
-0.5650144, -0.5235428, -1.627971, 0.3607843, 1, 0, 1,
-0.5632364, 1.06355, -0.534695, 0.3568628, 1, 0, 1,
-0.5616426, -0.6443377, -3.79945, 0.3490196, 1, 0, 1,
-0.561489, 0.7196698, -0.4205422, 0.345098, 1, 0, 1,
-0.5515673, 1.318367, -1.049421, 0.3372549, 1, 0, 1,
-0.5474827, -0.5010756, -2.537398, 0.3333333, 1, 0, 1,
-0.5473881, 1.396898, 1.822454, 0.3254902, 1, 0, 1,
-0.5467807, 0.4363731, -1.293304, 0.3215686, 1, 0, 1,
-0.5462073, 1.576641, -0.843713, 0.3137255, 1, 0, 1,
-0.5452103, -0.7596581, -4.904629, 0.3098039, 1, 0, 1,
-0.5414174, 0.4824327, -0.4309448, 0.3019608, 1, 0, 1,
-0.5346779, 0.3361577, 1.216815, 0.2941177, 1, 0, 1,
-0.5270058, -0.4530269, -2.890831, 0.2901961, 1, 0, 1,
-0.5223953, 0.5125852, -2.367515, 0.282353, 1, 0, 1,
-0.5197393, -0.1226399, -1.589883, 0.2784314, 1, 0, 1,
-0.5195028, 0.6900778, 1.671211, 0.2705882, 1, 0, 1,
-0.5138842, 0.1521534, -3.010643, 0.2666667, 1, 0, 1,
-0.5121307, 0.5947144, 0.9523127, 0.2588235, 1, 0, 1,
-0.5117506, -0.4069131, -2.194547, 0.254902, 1, 0, 1,
-0.5106479, -0.2713479, -2.212445, 0.2470588, 1, 0, 1,
-0.5101189, 1.423992, 0.6713976, 0.2431373, 1, 0, 1,
-0.5093839, -0.7405809, -3.397009, 0.2352941, 1, 0, 1,
-0.505614, 0.2051188, -0.9845643, 0.2313726, 1, 0, 1,
-0.5046905, -1.38122, -1.992213, 0.2235294, 1, 0, 1,
-0.5037178, -0.3994919, -1.852392, 0.2196078, 1, 0, 1,
-0.5016223, 2.893527, -1.681261, 0.2117647, 1, 0, 1,
-0.5001722, -0.8870195, -4.678876, 0.2078431, 1, 0, 1,
-0.4912145, -0.603998, -3.151455, 0.2, 1, 0, 1,
-0.4904584, 1.603783, -1.861907, 0.1921569, 1, 0, 1,
-0.4889386, 0.292231, 0.124669, 0.1882353, 1, 0, 1,
-0.4882092, -0.6969278, -1.534178, 0.1803922, 1, 0, 1,
-0.4842187, -0.006334904, 0.4308163, 0.1764706, 1, 0, 1,
-0.4834177, -0.7976347, -2.731365, 0.1686275, 1, 0, 1,
-0.4701664, 0.5269302, -0.9929796, 0.1647059, 1, 0, 1,
-0.4667014, 1.827642, -2.378573, 0.1568628, 1, 0, 1,
-0.4662741, 3.560678, -1.858394, 0.1529412, 1, 0, 1,
-0.4631518, -0.01997596, -2.424181, 0.145098, 1, 0, 1,
-0.4626842, 0.8156468, -0.7438735, 0.1411765, 1, 0, 1,
-0.4612702, 0.6611739, 0.8918161, 0.1333333, 1, 0, 1,
-0.4607511, -1.051366, -2.251828, 0.1294118, 1, 0, 1,
-0.4605999, 2.036804, -1.453078, 0.1215686, 1, 0, 1,
-0.4596239, -0.9014646, -2.361325, 0.1176471, 1, 0, 1,
-0.4540715, -0.3982016, -1.162556, 0.1098039, 1, 0, 1,
-0.4530621, 0.3761492, -1.867425, 0.1058824, 1, 0, 1,
-0.4507892, 0.04400414, -1.255823, 0.09803922, 1, 0, 1,
-0.4505122, -0.3959028, -2.899581, 0.09019608, 1, 0, 1,
-0.4470952, -1.290105, -2.347378, 0.08627451, 1, 0, 1,
-0.4458629, -0.4877954, -2.05243, 0.07843138, 1, 0, 1,
-0.4449016, -0.5549539, -2.176944, 0.07450981, 1, 0, 1,
-0.4411125, -0.3276305, -2.555682, 0.06666667, 1, 0, 1,
-0.4338537, -1.153664, -4.2539, 0.0627451, 1, 0, 1,
-0.4328692, 0.1676574, -1.129761, 0.05490196, 1, 0, 1,
-0.4315465, -0.5121573, -2.904665, 0.05098039, 1, 0, 1,
-0.4308456, -0.7779437, -1.973179, 0.04313726, 1, 0, 1,
-0.4302465, 0.2657676, -2.244093, 0.03921569, 1, 0, 1,
-0.4276183, 0.5296291, -1.506442, 0.03137255, 1, 0, 1,
-0.4188171, -2.30926, -2.984675, 0.02745098, 1, 0, 1,
-0.4160284, -1.15722, -3.829513, 0.01960784, 1, 0, 1,
-0.4113531, 0.6160353, 0.5702887, 0.01568628, 1, 0, 1,
-0.4026269, 0.1241299, -1.644585, 0.007843138, 1, 0, 1,
-0.4025067, -0.8990231, -2.662013, 0.003921569, 1, 0, 1,
-0.4010103, 0.3787775, -2.05593, 0, 1, 0.003921569, 1,
-0.3974757, 0.05717824, -3.30918, 0, 1, 0.01176471, 1,
-0.3967671, -0.7512062, -3.851271, 0, 1, 0.01568628, 1,
-0.39623, 0.7392372, -1.430856, 0, 1, 0.02352941, 1,
-0.3949045, -0.6703505, -3.209242, 0, 1, 0.02745098, 1,
-0.3938764, 0.5143764, -1.627713, 0, 1, 0.03529412, 1,
-0.3868811, 1.51515, -0.5579774, 0, 1, 0.03921569, 1,
-0.3824897, 1.432756, -0.5668986, 0, 1, 0.04705882, 1,
-0.3818456, -0.1125241, -1.7473, 0, 1, 0.05098039, 1,
-0.3817674, 1.969271, 0.06099747, 0, 1, 0.05882353, 1,
-0.3799481, 1.827941, -1.721463, 0, 1, 0.0627451, 1,
-0.3762169, -0.6036607, -2.922069, 0, 1, 0.07058824, 1,
-0.3715986, -1.009283, -3.497224, 0, 1, 0.07450981, 1,
-0.3714929, 0.09994574, -1.705637, 0, 1, 0.08235294, 1,
-0.3678938, -1.255256, -0.932587, 0, 1, 0.08627451, 1,
-0.3656678, 2.053756, 0.1014909, 0, 1, 0.09411765, 1,
-0.3642513, 1.327016, -0.4368872, 0, 1, 0.1019608, 1,
-0.3623286, -2.256254, -2.394107, 0, 1, 0.1058824, 1,
-0.3590561, -0.7796004, -3.239882, 0, 1, 0.1137255, 1,
-0.358214, -1.390183, -3.392448, 0, 1, 0.1176471, 1,
-0.3572525, 0.4957126, 1.877244, 0, 1, 0.1254902, 1,
-0.35725, -0.5551495, -3.467412, 0, 1, 0.1294118, 1,
-0.3554198, -1.035564, -1.107728, 0, 1, 0.1372549, 1,
-0.3498564, 0.315627, -1.8497, 0, 1, 0.1411765, 1,
-0.3448198, -0.163885, -1.36492, 0, 1, 0.1490196, 1,
-0.3439469, 0.08210933, -3.234206, 0, 1, 0.1529412, 1,
-0.3436918, 0.8773884, -1.318812, 0, 1, 0.1607843, 1,
-0.3436498, -0.1465463, -2.462191, 0, 1, 0.1647059, 1,
-0.3337004, 1.622625, -0.5685036, 0, 1, 0.172549, 1,
-0.3314366, 0.1462788, -1.901276, 0, 1, 0.1764706, 1,
-0.3311983, -0.3040091, -1.243325, 0, 1, 0.1843137, 1,
-0.3302884, 0.09476996, -0.2796967, 0, 1, 0.1882353, 1,
-0.3279608, -0.3762976, -2.865589, 0, 1, 0.1960784, 1,
-0.3254746, -0.3272128, -2.546923, 0, 1, 0.2039216, 1,
-0.3232265, -0.8435507, -2.326347, 0, 1, 0.2078431, 1,
-0.3219475, 1.333021, -1.875055, 0, 1, 0.2156863, 1,
-0.3216711, 0.312418, -1.717985, 0, 1, 0.2196078, 1,
-0.3210105, 0.5164416, -0.1818478, 0, 1, 0.227451, 1,
-0.3135997, -0.2012955, -2.370906, 0, 1, 0.2313726, 1,
-0.3109583, -0.4086004, -0.9858931, 0, 1, 0.2392157, 1,
-0.3102794, 0.2050649, -1.696769, 0, 1, 0.2431373, 1,
-0.3086708, -0.8711658, -2.018265, 0, 1, 0.2509804, 1,
-0.3056971, 0.1503962, -0.7511708, 0, 1, 0.254902, 1,
-0.3056688, -0.582829, -2.705216, 0, 1, 0.2627451, 1,
-0.3042514, -0.3149175, -4.017495, 0, 1, 0.2666667, 1,
-0.3032005, 0.2092718, -2.280917, 0, 1, 0.2745098, 1,
-0.2989959, -0.528156, -2.506443, 0, 1, 0.2784314, 1,
-0.2982005, 1.493898, -0.04631231, 0, 1, 0.2862745, 1,
-0.2959244, -0.07608269, -1.29601, 0, 1, 0.2901961, 1,
-0.2928398, 0.04269338, -1.132985, 0, 1, 0.2980392, 1,
-0.2834473, -1.535763, -2.408767, 0, 1, 0.3058824, 1,
-0.2814435, -1.489197, -4.080987, 0, 1, 0.3098039, 1,
-0.2767758, 0.6105462, 0.02733922, 0, 1, 0.3176471, 1,
-0.2765948, -0.554969, -2.346124, 0, 1, 0.3215686, 1,
-0.2745635, 0.5625569, -0.2551131, 0, 1, 0.3294118, 1,
-0.2735983, 1.066621, 0.8724729, 0, 1, 0.3333333, 1,
-0.2627366, 0.41168, -1.693005, 0, 1, 0.3411765, 1,
-0.262289, 0.7212891, 2.176396, 0, 1, 0.345098, 1,
-0.2605724, -0.3070377, -2.262298, 0, 1, 0.3529412, 1,
-0.2552944, -0.2057878, -1.919442, 0, 1, 0.3568628, 1,
-0.2529875, 0.1369058, -2.886447, 0, 1, 0.3647059, 1,
-0.2504117, 0.3742059, 0.4802205, 0, 1, 0.3686275, 1,
-0.2500742, 0.4644314, -0.5250069, 0, 1, 0.3764706, 1,
-0.2380823, 1.257017, -0.4267709, 0, 1, 0.3803922, 1,
-0.2372187, 0.7994565, 0.0514965, 0, 1, 0.3882353, 1,
-0.237096, 0.974473, -1.402458, 0, 1, 0.3921569, 1,
-0.2320337, -0.7293437, -4.395647, 0, 1, 0.4, 1,
-0.230472, 0.3176753, -2.676118, 0, 1, 0.4078431, 1,
-0.2278894, 0.06605962, -0.7048528, 0, 1, 0.4117647, 1,
-0.2255157, 0.4487324, -0.9347569, 0, 1, 0.4196078, 1,
-0.2247153, 0.223092, -2.367789, 0, 1, 0.4235294, 1,
-0.2174304, -0.01998726, -1.449581, 0, 1, 0.4313726, 1,
-0.2145819, -0.1807625, -1.44075, 0, 1, 0.4352941, 1,
-0.2087013, -0.7269474, -1.837482, 0, 1, 0.4431373, 1,
-0.2066187, 0.902831, -1.899201, 0, 1, 0.4470588, 1,
-0.2051669, -0.4222262, -5.290785, 0, 1, 0.454902, 1,
-0.2005325, -0.3881158, -2.946005, 0, 1, 0.4588235, 1,
-0.1964003, 0.2261751, -0.1738873, 0, 1, 0.4666667, 1,
-0.1900663, 0.558672, 0.5434626, 0, 1, 0.4705882, 1,
-0.1866683, -0.1556474, -1.768178, 0, 1, 0.4784314, 1,
-0.1832777, -1.053488, -2.617547, 0, 1, 0.4823529, 1,
-0.1823506, -1.075596, -1.971251, 0, 1, 0.4901961, 1,
-0.1736865, -0.8594271, -1.389383, 0, 1, 0.4941176, 1,
-0.1725448, -1.050846, -3.30993, 0, 1, 0.5019608, 1,
-0.1715923, 0.9585259, -1.766936, 0, 1, 0.509804, 1,
-0.1688763, -0.1585941, -1.572003, 0, 1, 0.5137255, 1,
-0.1683483, -2.759675, -3.212704, 0, 1, 0.5215687, 1,
-0.1677515, -1.179237, -2.024223, 0, 1, 0.5254902, 1,
-0.1626705, -0.9704364, -3.425895, 0, 1, 0.5333334, 1,
-0.1577536, -0.7594734, -3.932733, 0, 1, 0.5372549, 1,
-0.1574792, -0.5811269, -2.702723, 0, 1, 0.5450981, 1,
-0.1564191, -0.7796772, -2.464665, 0, 1, 0.5490196, 1,
-0.1520999, -0.7719893, -2.636512, 0, 1, 0.5568628, 1,
-0.1425554, 0.02964691, -2.049256, 0, 1, 0.5607843, 1,
-0.1383841, 0.3161287, -0.3234727, 0, 1, 0.5686275, 1,
-0.1363801, 2.108359, -1.39393, 0, 1, 0.572549, 1,
-0.1325405, -1.034613, -4.481565, 0, 1, 0.5803922, 1,
-0.1309229, -1.685715, -4.951678, 0, 1, 0.5843138, 1,
-0.1308009, 0.4988126, -2.373099, 0, 1, 0.5921569, 1,
-0.1263436, -1.459584, -1.68278, 0, 1, 0.5960785, 1,
-0.1178905, 0.3309036, -0.3413622, 0, 1, 0.6039216, 1,
-0.1159243, -0.6889943, -2.482208, 0, 1, 0.6117647, 1,
-0.1110353, 1.317734, -0.3442077, 0, 1, 0.6156863, 1,
-0.1021692, -2.166572, -2.945686, 0, 1, 0.6235294, 1,
-0.1005487, -0.2839496, -2.482591, 0, 1, 0.627451, 1,
-0.09752679, -0.9781322, -4.105139, 0, 1, 0.6352941, 1,
-0.09184802, -0.954065, -2.58482, 0, 1, 0.6392157, 1,
-0.08155157, 1.916984, 0.05751935, 0, 1, 0.6470588, 1,
-0.07721008, 0.1027884, 0.3283325, 0, 1, 0.6509804, 1,
-0.07460422, 0.4207767, -0.9210581, 0, 1, 0.6588235, 1,
-0.07236447, 0.606338, 0.304062, 0, 1, 0.6627451, 1,
-0.07137783, 2.008312, -1.468286, 0, 1, 0.6705883, 1,
-0.06867742, -1.183082, -2.23093, 0, 1, 0.6745098, 1,
-0.06486802, 1.157692, 0.9819301, 0, 1, 0.682353, 1,
-0.06103458, -0.6183776, -3.45988, 0, 1, 0.6862745, 1,
-0.05168878, -0.5880334, -3.872027, 0, 1, 0.6941177, 1,
-0.05115205, -0.2472249, -2.598933, 0, 1, 0.7019608, 1,
-0.04725972, -0.4722883, -2.797481, 0, 1, 0.7058824, 1,
-0.04591929, 0.00265703, -2.267643, 0, 1, 0.7137255, 1,
-0.04552931, 1.668432, 0.7854925, 0, 1, 0.7176471, 1,
-0.04452547, -0.2537523, -3.948713, 0, 1, 0.7254902, 1,
-0.04300565, 1.193938, -0.742004, 0, 1, 0.7294118, 1,
-0.04123759, 1.909422, 1.168962, 0, 1, 0.7372549, 1,
-0.0389198, 0.7913671, -0.7825652, 0, 1, 0.7411765, 1,
-0.0383699, 0.2364585, -0.8710089, 0, 1, 0.7490196, 1,
-0.03659234, -0.1142517, -3.454811, 0, 1, 0.7529412, 1,
-0.03524811, 0.5177456, -0.05335777, 0, 1, 0.7607843, 1,
-0.0277328, -1.636174, -2.445036, 0, 1, 0.7647059, 1,
-0.02417399, -1.14287, -3.702578, 0, 1, 0.772549, 1,
-0.02103596, -0.480345, -2.949499, 0, 1, 0.7764706, 1,
-0.01805776, 0.868287, 0.1659245, 0, 1, 0.7843137, 1,
-0.01083193, 0.2963771, -0.5123243, 0, 1, 0.7882353, 1,
-0.008844331, -0.325, -4.356687, 0, 1, 0.7960784, 1,
-0.007275222, 0.647413, 0.8045257, 0, 1, 0.8039216, 1,
-0.005974552, 0.304892, -0.5207316, 0, 1, 0.8078431, 1,
-0.004805084, 0.3981507, -0.1771203, 0, 1, 0.8156863, 1,
-0.004515933, 1.200827, 0.5229944, 0, 1, 0.8196079, 1,
-0.003950115, 0.09799191, 0.04338927, 0, 1, 0.827451, 1,
-0.001457933, -0.5674148, -5.518909, 0, 1, 0.8313726, 1,
-0.001007179, -1.802822, -3.601944, 0, 1, 0.8392157, 1,
0.00110512, 0.02899218, -1.381086, 0, 1, 0.8431373, 1,
0.002044426, 0.5772249, 0.534769, 0, 1, 0.8509804, 1,
0.003053678, -0.4285896, 3.3946, 0, 1, 0.854902, 1,
0.00405532, 2.870145, -0.3037489, 0, 1, 0.8627451, 1,
0.01097953, 0.8109947, 0.6721007, 0, 1, 0.8666667, 1,
0.01131377, -0.7480521, 3.020609, 0, 1, 0.8745098, 1,
0.01519916, 2.168236, 0.9660019, 0, 1, 0.8784314, 1,
0.01532021, 0.4719661, -1.316116, 0, 1, 0.8862745, 1,
0.01620003, 0.929537, -0.3584218, 0, 1, 0.8901961, 1,
0.01884968, -0.712528, 3.658381, 0, 1, 0.8980392, 1,
0.02021976, -0.4975336, 3.979685, 0, 1, 0.9058824, 1,
0.02140651, -0.2273353, 2.42378, 0, 1, 0.9098039, 1,
0.02162217, 0.1212581, 2.326286, 0, 1, 0.9176471, 1,
0.02751642, 1.485786, 0.6759768, 0, 1, 0.9215686, 1,
0.02796922, -0.7063351, 2.291914, 0, 1, 0.9294118, 1,
0.03038001, -1.442569, 3.515692, 0, 1, 0.9333333, 1,
0.03146666, -0.8559787, 1.918509, 0, 1, 0.9411765, 1,
0.03533802, 0.2296277, 0.4369231, 0, 1, 0.945098, 1,
0.03859725, 0.1355032, 1.863626, 0, 1, 0.9529412, 1,
0.03915656, 0.1263385, 1.10561, 0, 1, 0.9568627, 1,
0.03983297, -0.5656264, 3.898946, 0, 1, 0.9647059, 1,
0.03998632, 0.08734132, 0.6985034, 0, 1, 0.9686275, 1,
0.04003081, 0.07676934, 1.147932, 0, 1, 0.9764706, 1,
0.04360892, 0.03335286, 1.988787, 0, 1, 0.9803922, 1,
0.04391921, 0.6451187, -0.5226385, 0, 1, 0.9882353, 1,
0.04704756, 0.3630888, 0.06548235, 0, 1, 0.9921569, 1,
0.05006299, -0.3696516, 3.062662, 0, 1, 1, 1,
0.05665194, 0.008424762, 2.089794, 0, 0.9921569, 1, 1,
0.05895721, 1.38931, -1.046083, 0, 0.9882353, 1, 1,
0.06155552, -0.1768549, 2.752526, 0, 0.9803922, 1, 1,
0.06328452, 0.3807165, -0.01894426, 0, 0.9764706, 1, 1,
0.0650565, 0.04529915, 2.100275, 0, 0.9686275, 1, 1,
0.07137754, -0.5845153, 3.888448, 0, 0.9647059, 1, 1,
0.07264115, -0.1700411, 1.655297, 0, 0.9568627, 1, 1,
0.0823354, 0.6375181, 0.8491574, 0, 0.9529412, 1, 1,
0.08387659, 3.161662, 0.8626309, 0, 0.945098, 1, 1,
0.09313753, 0.5125508, -0.8752927, 0, 0.9411765, 1, 1,
0.09857526, 0.3602065, -0.5021079, 0, 0.9333333, 1, 1,
0.1017251, -0.07345624, 1.837087, 0, 0.9294118, 1, 1,
0.1017689, -1.022181, 4.174266, 0, 0.9215686, 1, 1,
0.1046678, 1.225916, 1.091765, 0, 0.9176471, 1, 1,
0.1077783, -0.3517241, 2.40183, 0, 0.9098039, 1, 1,
0.109874, 1.157328, -1.44822, 0, 0.9058824, 1, 1,
0.1124201, 1.624394, -0.3147562, 0, 0.8980392, 1, 1,
0.1163467, 0.8145501, -0.8088382, 0, 0.8901961, 1, 1,
0.1197109, 0.7857373, 2.268569, 0, 0.8862745, 1, 1,
0.1214819, 1.439245, -0.04046581, 0, 0.8784314, 1, 1,
0.1269328, 0.5606364, 0.2807278, 0, 0.8745098, 1, 1,
0.1358539, 0.9150587, -1.377217, 0, 0.8666667, 1, 1,
0.1368477, 1.70557, -0.5591464, 0, 0.8627451, 1, 1,
0.1400988, 0.8187946, 0.8374135, 0, 0.854902, 1, 1,
0.1411852, 1.528521, -0.03146588, 0, 0.8509804, 1, 1,
0.1420428, -1.651185, 4.029361, 0, 0.8431373, 1, 1,
0.1475028, 2.168704, -0.2564712, 0, 0.8392157, 1, 1,
0.1483674, -1.832619, 3.596301, 0, 0.8313726, 1, 1,
0.1492686, -0.4266942, 2.388095, 0, 0.827451, 1, 1,
0.1640042, -0.3376409, 2.905395, 0, 0.8196079, 1, 1,
0.1655704, -0.6491867, 3.004306, 0, 0.8156863, 1, 1,
0.1659701, 1.627684, 1.458975, 0, 0.8078431, 1, 1,
0.1665306, 2.166183, 1.448527, 0, 0.8039216, 1, 1,
0.1671447, -0.5468133, 2.133412, 0, 0.7960784, 1, 1,
0.1682542, 1.559718, -0.2418734, 0, 0.7882353, 1, 1,
0.1702969, -2.265951, 2.554529, 0, 0.7843137, 1, 1,
0.1728665, 2.215923, -1.414524, 0, 0.7764706, 1, 1,
0.1776463, 0.07332546, 0.6595445, 0, 0.772549, 1, 1,
0.1795662, -0.5613712, 2.966217, 0, 0.7647059, 1, 1,
0.1813102, -1.144746, 4.50314, 0, 0.7607843, 1, 1,
0.1817409, -1.010492, 4.324208, 0, 0.7529412, 1, 1,
0.1826368, -0.4408928, 3.462688, 0, 0.7490196, 1, 1,
0.1854397, -1.491281, 2.877773, 0, 0.7411765, 1, 1,
0.1924567, -1.07214, 3.171957, 0, 0.7372549, 1, 1,
0.1989871, 1.951766, 0.1474395, 0, 0.7294118, 1, 1,
0.2021809, 1.320471, 1.004699, 0, 0.7254902, 1, 1,
0.2028594, 1.329663, 0.5559996, 0, 0.7176471, 1, 1,
0.2093414, -0.2269137, 1.685696, 0, 0.7137255, 1, 1,
0.2097595, -0.9161778, 3.980114, 0, 0.7058824, 1, 1,
0.2109887, 2.000277, 0.3037815, 0, 0.6980392, 1, 1,
0.2149692, -0.2595155, 1.605668, 0, 0.6941177, 1, 1,
0.2186226, -1.682549, 3.883739, 0, 0.6862745, 1, 1,
0.2193355, -0.5462178, 2.987344, 0, 0.682353, 1, 1,
0.2226873, 0.7979503, 0.7082441, 0, 0.6745098, 1, 1,
0.2246367, -0.1379277, 0.8352727, 0, 0.6705883, 1, 1,
0.2277016, -0.6815293, 3.295746, 0, 0.6627451, 1, 1,
0.2377276, -0.6854247, 0.3816088, 0, 0.6588235, 1, 1,
0.239164, -0.3171892, 3.098526, 0, 0.6509804, 1, 1,
0.241166, -2.062277, 3.151816, 0, 0.6470588, 1, 1,
0.2419116, -0.6420212, 2.760152, 0, 0.6392157, 1, 1,
0.2436494, 0.5568413, 0.6929911, 0, 0.6352941, 1, 1,
0.244412, -1.228077, 2.595498, 0, 0.627451, 1, 1,
0.2586481, -1.089558, 3.530795, 0, 0.6235294, 1, 1,
0.2595085, -1.521545, 1.470562, 0, 0.6156863, 1, 1,
0.2636571, 0.1195097, 0.28228, 0, 0.6117647, 1, 1,
0.2638371, -0.5220712, 1.361783, 0, 0.6039216, 1, 1,
0.2650083, 1.285451, 0.4866536, 0, 0.5960785, 1, 1,
0.2674296, 0.4951734, -0.02450153, 0, 0.5921569, 1, 1,
0.2710088, -0.8456131, 3.535831, 0, 0.5843138, 1, 1,
0.2713015, -0.6160904, 4.57964, 0, 0.5803922, 1, 1,
0.2820469, -0.8560029, 2.675576, 0, 0.572549, 1, 1,
0.2851647, -0.276962, 0.9025537, 0, 0.5686275, 1, 1,
0.2901203, 0.6255038, 1.375318, 0, 0.5607843, 1, 1,
0.2941835, -1.893138, 3.854957, 0, 0.5568628, 1, 1,
0.2957083, -0.03079394, 1.818682, 0, 0.5490196, 1, 1,
0.3004644, -1.369735, 3.268909, 0, 0.5450981, 1, 1,
0.3011023, 0.09459852, -0.4512909, 0, 0.5372549, 1, 1,
0.3041746, 0.235637, -0.1206655, 0, 0.5333334, 1, 1,
0.3100161, -0.1642348, 1.963564, 0, 0.5254902, 1, 1,
0.3102998, 2.619506, 2.002145, 0, 0.5215687, 1, 1,
0.3146461, -0.7860978, 4.163126, 0, 0.5137255, 1, 1,
0.3166575, 0.07211439, 3.556433, 0, 0.509804, 1, 1,
0.3185561, -0.7965181, 2.497288, 0, 0.5019608, 1, 1,
0.3191001, 0.3713146, -0.510632, 0, 0.4941176, 1, 1,
0.3202614, 0.1239382, 1.02439, 0, 0.4901961, 1, 1,
0.3209916, 1.396508, 0.5814366, 0, 0.4823529, 1, 1,
0.3216404, 0.007037251, 2.113907, 0, 0.4784314, 1, 1,
0.325057, 0.3243194, 1.885355, 0, 0.4705882, 1, 1,
0.3267942, 1.4054, -0.4336174, 0, 0.4666667, 1, 1,
0.3280448, -0.02184257, 2.089092, 0, 0.4588235, 1, 1,
0.3289821, 0.1790095, 1.181609, 0, 0.454902, 1, 1,
0.3295454, -1.242603, 2.372804, 0, 0.4470588, 1, 1,
0.32961, 0.5645565, 0.257457, 0, 0.4431373, 1, 1,
0.3309866, -0.03542745, 1.720509, 0, 0.4352941, 1, 1,
0.3337946, 2.162476, -0.5592048, 0, 0.4313726, 1, 1,
0.3338858, 0.4833453, -0.2032041, 0, 0.4235294, 1, 1,
0.3361528, 0.8554454, -2.021147, 0, 0.4196078, 1, 1,
0.340908, 1.394286, 1.33832, 0, 0.4117647, 1, 1,
0.3424697, -0.779015, 2.716161, 0, 0.4078431, 1, 1,
0.3425024, -0.512374, 2.146184, 0, 0.4, 1, 1,
0.3429269, -0.8575193, 2.31083, 0, 0.3921569, 1, 1,
0.3453119, 1.368127, -0.03742946, 0, 0.3882353, 1, 1,
0.3458061, -1.412762, 2.254735, 0, 0.3803922, 1, 1,
0.3458262, -0.4384172, 3.409019, 0, 0.3764706, 1, 1,
0.3470654, -0.01401532, 2.652904, 0, 0.3686275, 1, 1,
0.3479343, -0.03193432, 2.168287, 0, 0.3647059, 1, 1,
0.3499733, 1.403441, 1.677887, 0, 0.3568628, 1, 1,
0.3505811, -1.216449, 3.428314, 0, 0.3529412, 1, 1,
0.3542218, 0.3289068, -0.4647444, 0, 0.345098, 1, 1,
0.3569137, -0.3499488, 1.780542, 0, 0.3411765, 1, 1,
0.3571521, 0.1628111, 2.336197, 0, 0.3333333, 1, 1,
0.3572243, 0.02795168, 1.882361, 0, 0.3294118, 1, 1,
0.3690427, 0.1624716, 0.5932013, 0, 0.3215686, 1, 1,
0.3695757, -0.9418478, 1.49379, 0, 0.3176471, 1, 1,
0.3723268, 0.1545159, 1.16662, 0, 0.3098039, 1, 1,
0.3724298, -1.622767, 3.867772, 0, 0.3058824, 1, 1,
0.3746013, 0.5430391, 1.095121, 0, 0.2980392, 1, 1,
0.3767112, -0.5432854, 2.767464, 0, 0.2901961, 1, 1,
0.3804076, -0.1578372, 1.798795, 0, 0.2862745, 1, 1,
0.3831943, 1.784596, -0.973807, 0, 0.2784314, 1, 1,
0.3834744, 0.3476305, 0.5822548, 0, 0.2745098, 1, 1,
0.3876271, -0.6208147, 4.20524, 0, 0.2666667, 1, 1,
0.3885715, 1.838143, 0.71339, 0, 0.2627451, 1, 1,
0.3945836, -0.1835885, 1.119414, 0, 0.254902, 1, 1,
0.3948022, -0.5260456, 2.210333, 0, 0.2509804, 1, 1,
0.3951829, 0.5525828, 1.805331, 0, 0.2431373, 1, 1,
0.3952138, -0.4288695, 3.17371, 0, 0.2392157, 1, 1,
0.3962803, 0.1374052, 0.2185754, 0, 0.2313726, 1, 1,
0.3986468, 1.388323, -0.09082369, 0, 0.227451, 1, 1,
0.4069553, -0.02062714, 0.698455, 0, 0.2196078, 1, 1,
0.4079921, 0.2364186, 1.095443, 0, 0.2156863, 1, 1,
0.4102079, 0.1408485, 1.086605, 0, 0.2078431, 1, 1,
0.4117462, 0.4092827, 0.1186345, 0, 0.2039216, 1, 1,
0.4142799, 0.2419375, 3.161681, 0, 0.1960784, 1, 1,
0.4150337, 1.289119, -0.3811888, 0, 0.1882353, 1, 1,
0.4162178, -0.7967134, 3.416138, 0, 0.1843137, 1, 1,
0.4231314, -0.6049753, 3.696974, 0, 0.1764706, 1, 1,
0.4242468, -0.128275, 2.618283, 0, 0.172549, 1, 1,
0.4244985, -0.1627524, 3.12137, 0, 0.1647059, 1, 1,
0.4274188, 2.11902, -0.5635111, 0, 0.1607843, 1, 1,
0.4275985, 0.05790535, 0.6297304, 0, 0.1529412, 1, 1,
0.4281345, -0.5825185, 2.008382, 0, 0.1490196, 1, 1,
0.4287903, 1.799581, -1.862712, 0, 0.1411765, 1, 1,
0.4297062, -0.3694698, 2.755961, 0, 0.1372549, 1, 1,
0.4313148, 0.4035513, 1.044581, 0, 0.1294118, 1, 1,
0.431792, 0.7864287, 1.517132, 0, 0.1254902, 1, 1,
0.4326383, -1.696041, 1.884135, 0, 0.1176471, 1, 1,
0.4333664, 0.5238128, 1.764356, 0, 0.1137255, 1, 1,
0.4382704, 0.4960234, 0.2985649, 0, 0.1058824, 1, 1,
0.4409048, -0.3967084, 3.330523, 0, 0.09803922, 1, 1,
0.4431659, -0.0703791, 1.436179, 0, 0.09411765, 1, 1,
0.4446609, 0.0437385, 0.2525266, 0, 0.08627451, 1, 1,
0.4464995, 0.7581009, 0.5920233, 0, 0.08235294, 1, 1,
0.4474511, -0.8479339, 2.37261, 0, 0.07450981, 1, 1,
0.4538991, -0.1605454, 1.288744, 0, 0.07058824, 1, 1,
0.455815, 1.049383, 0.5472793, 0, 0.0627451, 1, 1,
0.4560585, -0.3565903, 1.977255, 0, 0.05882353, 1, 1,
0.4575599, -0.4283928, 1.842842, 0, 0.05098039, 1, 1,
0.4585923, 1.315837, -1.103085, 0, 0.04705882, 1, 1,
0.4602248, -0.4467393, 2.366873, 0, 0.03921569, 1, 1,
0.4621099, -1.452659, 3.537224, 0, 0.03529412, 1, 1,
0.4635399, 1.511906, 1.950861, 0, 0.02745098, 1, 1,
0.4645706, -0.6288431, 3.267183, 0, 0.02352941, 1, 1,
0.4729949, 0.2911055, 1.549436, 0, 0.01568628, 1, 1,
0.4749399, 0.1946602, -0.1612448, 0, 0.01176471, 1, 1,
0.4782047, 1.075356, 0.5912616, 0, 0.003921569, 1, 1,
0.4796488, -0.168968, 1.727353, 0.003921569, 0, 1, 1,
0.4822918, -0.3339395, 3.433101, 0.007843138, 0, 1, 1,
0.4849539, 0.1534103, 0.6181792, 0.01568628, 0, 1, 1,
0.4852143, -0.3189657, 2.718159, 0.01960784, 0, 1, 1,
0.4857565, -0.2021056, 1.815995, 0.02745098, 0, 1, 1,
0.490344, 1.302601, 1.711524, 0.03137255, 0, 1, 1,
0.4916815, 0.5840937, 0.6557215, 0.03921569, 0, 1, 1,
0.4930888, 0.7860816, 3.205132, 0.04313726, 0, 1, 1,
0.4981932, 0.8206665, 2.421705, 0.05098039, 0, 1, 1,
0.4995818, -1.667156, 1.756989, 0.05490196, 0, 1, 1,
0.5016677, -0.1955248, 2.584202, 0.0627451, 0, 1, 1,
0.5041075, 0.43044, 2.362535, 0.06666667, 0, 1, 1,
0.5095905, -0.6403663, 2.994644, 0.07450981, 0, 1, 1,
0.5151643, 1.47622, -1.776903, 0.07843138, 0, 1, 1,
0.5210108, 0.5601378, -0.3254194, 0.08627451, 0, 1, 1,
0.5280874, -0.5786414, 2.081796, 0.09019608, 0, 1, 1,
0.5399783, -1.544236, 3.374678, 0.09803922, 0, 1, 1,
0.5411488, 0.4945716, -0.0206223, 0.1058824, 0, 1, 1,
0.5448376, 0.05483625, 3.352217, 0.1098039, 0, 1, 1,
0.5448936, 0.7878505, -0.3535176, 0.1176471, 0, 1, 1,
0.5475897, 0.0261121, 1.648974, 0.1215686, 0, 1, 1,
0.5538089, -0.7928619, 1.788747, 0.1294118, 0, 1, 1,
0.5556055, 0.2906149, 1.157157, 0.1333333, 0, 1, 1,
0.555654, 0.4844235, 0.2262266, 0.1411765, 0, 1, 1,
0.555894, 0.5076676, 0.2352106, 0.145098, 0, 1, 1,
0.5575463, -1.355083, 2.840488, 0.1529412, 0, 1, 1,
0.5580196, 0.9108108, 1.88654, 0.1568628, 0, 1, 1,
0.558639, 1.934527, -0.4947082, 0.1647059, 0, 1, 1,
0.5716783, 1.778238, 0.8194901, 0.1686275, 0, 1, 1,
0.5717669, 1.054, -0.2487488, 0.1764706, 0, 1, 1,
0.5722849, -1.400236, 2.127775, 0.1803922, 0, 1, 1,
0.5725921, 0.05686572, 1.977632, 0.1882353, 0, 1, 1,
0.5762984, 0.827538, 1.096019, 0.1921569, 0, 1, 1,
0.5766301, 0.1165315, 1.925128, 0.2, 0, 1, 1,
0.5770298, -0.8773775, 2.416924, 0.2078431, 0, 1, 1,
0.5787849, -0.3563539, 0.6025239, 0.2117647, 0, 1, 1,
0.5789575, -1.519457, 3.518554, 0.2196078, 0, 1, 1,
0.5802923, 0.6230792, 1.260571, 0.2235294, 0, 1, 1,
0.5867881, 0.2298937, 1.195919, 0.2313726, 0, 1, 1,
0.5878676, 0.8466451, -0.3284289, 0.2352941, 0, 1, 1,
0.5886082, -0.5004613, 3.236751, 0.2431373, 0, 1, 1,
0.5927393, -1.706798, 1.323039, 0.2470588, 0, 1, 1,
0.5984675, 0.7972515, -1.640847, 0.254902, 0, 1, 1,
0.6006771, 0.3930485, 2.16666, 0.2588235, 0, 1, 1,
0.6068978, 0.6205662, 0.07395339, 0.2666667, 0, 1, 1,
0.6094286, 0.3043206, 0.8034138, 0.2705882, 0, 1, 1,
0.6102778, -0.3498795, 2.201303, 0.2784314, 0, 1, 1,
0.6208656, -0.6941537, 3.278691, 0.282353, 0, 1, 1,
0.6229278, -1.110462, 2.347716, 0.2901961, 0, 1, 1,
0.6232369, -1.6215, 3.042069, 0.2941177, 0, 1, 1,
0.6240507, 0.08867823, 0.3451533, 0.3019608, 0, 1, 1,
0.6257651, -0.3639791, 1.93354, 0.3098039, 0, 1, 1,
0.6316373, -0.6443881, 4.156967, 0.3137255, 0, 1, 1,
0.6334122, 0.9896515, 1.015338, 0.3215686, 0, 1, 1,
0.6378589, 0.8786014, -0.6062609, 0.3254902, 0, 1, 1,
0.6433727, 1.732388, 0.3427193, 0.3333333, 0, 1, 1,
0.6454681, -0.6775308, 4.713424, 0.3372549, 0, 1, 1,
0.6492184, -0.2760328, 1.314665, 0.345098, 0, 1, 1,
0.6547525, 0.6577926, 1.909645, 0.3490196, 0, 1, 1,
0.6684058, -0.7845753, 4.478261, 0.3568628, 0, 1, 1,
0.6687115, 0.7647417, 1.701109, 0.3607843, 0, 1, 1,
0.6706852, 1.289602, -0.3172389, 0.3686275, 0, 1, 1,
0.6715679, 0.06469093, 1.171175, 0.372549, 0, 1, 1,
0.6719288, 0.7536505, 1.464938, 0.3803922, 0, 1, 1,
0.6723933, -0.3588076, 1.773412, 0.3843137, 0, 1, 1,
0.6748976, 0.4209575, 0.3708073, 0.3921569, 0, 1, 1,
0.6762628, 0.02283576, 3.130159, 0.3960784, 0, 1, 1,
0.6771636, 1.619241, -0.2449657, 0.4039216, 0, 1, 1,
0.6796492, 1.408945, 0.4834954, 0.4117647, 0, 1, 1,
0.6836748, 0.4162638, 0.221622, 0.4156863, 0, 1, 1,
0.6838455, 0.03797753, 2.313654, 0.4235294, 0, 1, 1,
0.6859436, -1.914785, 0.1078894, 0.427451, 0, 1, 1,
0.6894403, -1.531892, 4.49462, 0.4352941, 0, 1, 1,
0.6936982, -0.2664624, 2.379928, 0.4392157, 0, 1, 1,
0.6939563, 1.716839, 0.8744202, 0.4470588, 0, 1, 1,
0.6939698, 0.1260647, 1.453834, 0.4509804, 0, 1, 1,
0.6994188, 0.1972019, 0.8241871, 0.4588235, 0, 1, 1,
0.6998681, 1.84682, -1.411637, 0.4627451, 0, 1, 1,
0.7102385, 1.246019, 1.265229, 0.4705882, 0, 1, 1,
0.7109697, -0.6995256, 2.187605, 0.4745098, 0, 1, 1,
0.7111878, -1.532655, 1.734718, 0.4823529, 0, 1, 1,
0.712669, -0.1577555, 1.765227, 0.4862745, 0, 1, 1,
0.7131855, -0.3835388, 1.312984, 0.4941176, 0, 1, 1,
0.7144395, 0.9080509, 1.360818, 0.5019608, 0, 1, 1,
0.7185418, -1.808672, 3.760194, 0.5058824, 0, 1, 1,
0.7225802, -2.076564, 2.805538, 0.5137255, 0, 1, 1,
0.7237161, -0.9696845, 1.989712, 0.5176471, 0, 1, 1,
0.723975, 0.936234, 1.092413, 0.5254902, 0, 1, 1,
0.732779, -0.7503069, 3.236944, 0.5294118, 0, 1, 1,
0.7340676, 1.665445, 1.269873, 0.5372549, 0, 1, 1,
0.7350729, 0.05001532, 3.164049, 0.5411765, 0, 1, 1,
0.7361707, 1.190944, 0.6699149, 0.5490196, 0, 1, 1,
0.7387163, 0.9066927, 0.3926, 0.5529412, 0, 1, 1,
0.739642, 0.6504955, 1.13288, 0.5607843, 0, 1, 1,
0.7423205, 1.890077, 0.5877738, 0.5647059, 0, 1, 1,
0.7460716, -0.5586556, -0.3452557, 0.572549, 0, 1, 1,
0.758027, 1.796291, -0.4595886, 0.5764706, 0, 1, 1,
0.7622797, 0.9807178, 0.5032142, 0.5843138, 0, 1, 1,
0.7628383, -0.7837939, 1.486959, 0.5882353, 0, 1, 1,
0.7634537, -0.7615902, 2.15196, 0.5960785, 0, 1, 1,
0.7645115, 0.9620466, 0.02956208, 0.6039216, 0, 1, 1,
0.7685562, -0.8700593, 1.881636, 0.6078432, 0, 1, 1,
0.7714301, 0.07485181, 3.657148, 0.6156863, 0, 1, 1,
0.7715818, -1.514151, 2.676363, 0.6196079, 0, 1, 1,
0.7739328, 0.6439583, -0.5088929, 0.627451, 0, 1, 1,
0.7740617, 0.7397656, 0.6723511, 0.6313726, 0, 1, 1,
0.7788365, 0.3781663, 1.469125, 0.6392157, 0, 1, 1,
0.7888366, -0.4553334, 1.752579, 0.6431373, 0, 1, 1,
0.7895935, 0.8533902, 0.9233028, 0.6509804, 0, 1, 1,
0.7917284, -0.73586, 3.521462, 0.654902, 0, 1, 1,
0.7919214, -0.7306951, 0.8992604, 0.6627451, 0, 1, 1,
0.7934271, 0.963726, -1.119512, 0.6666667, 0, 1, 1,
0.7949429, 0.0007108458, 2.255754, 0.6745098, 0, 1, 1,
0.801314, 0.1520057, 1.482837, 0.6784314, 0, 1, 1,
0.8028103, -0.5562635, 3.140863, 0.6862745, 0, 1, 1,
0.8038864, 1.6006, -1.135806, 0.6901961, 0, 1, 1,
0.8039445, 0.07838539, -0.429669, 0.6980392, 0, 1, 1,
0.8085669, -1.484432, 3.36984, 0.7058824, 0, 1, 1,
0.8111714, -0.4972016, 3.142036, 0.7098039, 0, 1, 1,
0.8119965, -0.9105461, 3.497412, 0.7176471, 0, 1, 1,
0.8141347, 1.084319, 1.212942, 0.7215686, 0, 1, 1,
0.8257908, 0.3166946, 2.248226, 0.7294118, 0, 1, 1,
0.8305452, 1.013668, 0.5588844, 0.7333333, 0, 1, 1,
0.8310567, -0.8681311, 1.117306, 0.7411765, 0, 1, 1,
0.8314502, 0.1754844, 0.8398584, 0.7450981, 0, 1, 1,
0.8382049, 1.027362, 0.4956326, 0.7529412, 0, 1, 1,
0.8394207, 0.5592607, -0.06710768, 0.7568628, 0, 1, 1,
0.8408458, -0.05838469, 0.6452453, 0.7647059, 0, 1, 1,
0.8410577, 0.259046, 1.765469, 0.7686275, 0, 1, 1,
0.8442236, 0.01409543, 1.757232, 0.7764706, 0, 1, 1,
0.8469025, 0.7167767, 0.5783018, 0.7803922, 0, 1, 1,
0.8474117, 2.510693, -0.161868, 0.7882353, 0, 1, 1,
0.8516625, -1.558086, 1.780095, 0.7921569, 0, 1, 1,
0.8647376, -1.626634, 2.792306, 0.8, 0, 1, 1,
0.8681809, 0.6742538, 1.066347, 0.8078431, 0, 1, 1,
0.8764648, -2.15739, 2.340676, 0.8117647, 0, 1, 1,
0.8811916, -0.2579708, 0.8039815, 0.8196079, 0, 1, 1,
0.8815595, -1.316859, 3.444756, 0.8235294, 0, 1, 1,
0.8833596, 0.1787968, 0.9737173, 0.8313726, 0, 1, 1,
0.886297, -0.4790464, 1.667821, 0.8352941, 0, 1, 1,
0.8919659, 0.4800821, 2.106437, 0.8431373, 0, 1, 1,
0.893179, 0.1638682, 2.42432, 0.8470588, 0, 1, 1,
0.8939681, -0.1181336, 0.3652589, 0.854902, 0, 1, 1,
0.8976473, 0.0892764, 0.815528, 0.8588235, 0, 1, 1,
0.8982393, -0.2853268, 0.5398844, 0.8666667, 0, 1, 1,
0.9026433, 0.1508338, 1.256426, 0.8705882, 0, 1, 1,
0.9045138, -1.687725, 2.113476, 0.8784314, 0, 1, 1,
0.9050763, -1.547882, 1.85952, 0.8823529, 0, 1, 1,
0.9052839, 0.3974207, 1.264335, 0.8901961, 0, 1, 1,
0.910389, 0.741414, 2.8698, 0.8941177, 0, 1, 1,
0.9122126, -2.2364, 1.550744, 0.9019608, 0, 1, 1,
0.9143111, 0.7721575, 2.015884, 0.9098039, 0, 1, 1,
0.9189181, -1.62332, 3.709819, 0.9137255, 0, 1, 1,
0.9189454, -0.3632248, 1.883503, 0.9215686, 0, 1, 1,
0.9211344, 0.3326168, -0.2134125, 0.9254902, 0, 1, 1,
0.9233947, 0.5361043, 1.557061, 0.9333333, 0, 1, 1,
0.92565, 0.6005954, 0.1028666, 0.9372549, 0, 1, 1,
0.9350215, 1.365557, 0.3620794, 0.945098, 0, 1, 1,
0.9533353, 0.3422222, 0.5808567, 0.9490196, 0, 1, 1,
0.9553459, -0.6658641, 2.786655, 0.9568627, 0, 1, 1,
0.9603876, -1.181866, 0.7966623, 0.9607843, 0, 1, 1,
0.9645131, 0.5281022, 0.543776, 0.9686275, 0, 1, 1,
0.9658375, 0.3845016, 1.632855, 0.972549, 0, 1, 1,
0.9783418, 1.977926, 0.7128509, 0.9803922, 0, 1, 1,
0.9820423, -0.9833084, 2.772632, 0.9843137, 0, 1, 1,
0.9843145, 0.8018939, 0.8413042, 0.9921569, 0, 1, 1,
0.9924418, -0.2878057, 1.5132, 0.9960784, 0, 1, 1,
1.001653, 0.02417319, -0.6483112, 1, 0, 0.9960784, 1,
1.007398, -0.01864425, 3.247919, 1, 0, 0.9882353, 1,
1.011714, 0.2505089, 0.95917, 1, 0, 0.9843137, 1,
1.015698, -1.5187, 2.036586, 1, 0, 0.9764706, 1,
1.019755, 0.01722442, 1.716699, 1, 0, 0.972549, 1,
1.020971, -0.9951826, 2.911496, 1, 0, 0.9647059, 1,
1.023986, -1.275718, 3.183033, 1, 0, 0.9607843, 1,
1.025478, 1.545264, 1.491883, 1, 0, 0.9529412, 1,
1.028541, 0.09227552, 0.4993961, 1, 0, 0.9490196, 1,
1.035357, 0.625644, 1.655745, 1, 0, 0.9411765, 1,
1.039209, 0.8812672, 1.200724, 1, 0, 0.9372549, 1,
1.045659, -0.3460909, 2.680048, 1, 0, 0.9294118, 1,
1.048126, 0.6143748, 1.6135, 1, 0, 0.9254902, 1,
1.049802, -2.248721, 2.268518, 1, 0, 0.9176471, 1,
1.049878, -0.6835536, 2.815034, 1, 0, 0.9137255, 1,
1.060903, -0.132501, 0.150446, 1, 0, 0.9058824, 1,
1.062875, -0.2102649, 1.730036, 1, 0, 0.9019608, 1,
1.064088, -0.6975344, 2.125161, 1, 0, 0.8941177, 1,
1.066992, 0.65797, 1.105697, 1, 0, 0.8862745, 1,
1.071072, -0.2354784, 0.6206834, 1, 0, 0.8823529, 1,
1.072473, 0.02007264, 2.24516, 1, 0, 0.8745098, 1,
1.073264, 0.9489808, 1.517733, 1, 0, 0.8705882, 1,
1.075498, 0.1577008, 3.541319, 1, 0, 0.8627451, 1,
1.09296, 0.383887, 1.476277, 1, 0, 0.8588235, 1,
1.104799, 0.2661805, -0.01939048, 1, 0, 0.8509804, 1,
1.111697, -0.005995221, 1.943105, 1, 0, 0.8470588, 1,
1.120394, -1.615567, 3.297646, 1, 0, 0.8392157, 1,
1.123532, 0.4045112, 2.984418, 1, 0, 0.8352941, 1,
1.125735, -1.835472, 1.687151, 1, 0, 0.827451, 1,
1.12575, 1.246059, 0.8419196, 1, 0, 0.8235294, 1,
1.14011, 0.8807548, 1.90976, 1, 0, 0.8156863, 1,
1.144107, -0.6137655, 3.516095, 1, 0, 0.8117647, 1,
1.144983, 2.213069, 1.946368, 1, 0, 0.8039216, 1,
1.147246, 0.2657425, 2.485735, 1, 0, 0.7960784, 1,
1.149537, 0.2264394, 1.695214, 1, 0, 0.7921569, 1,
1.152434, 0.8595512, 0.4098192, 1, 0, 0.7843137, 1,
1.16925, 2.320511, 0.4549891, 1, 0, 0.7803922, 1,
1.172485, -1.238772, 2.815736, 1, 0, 0.772549, 1,
1.17281, 0.766138, 1.327263, 1, 0, 0.7686275, 1,
1.177484, 1.052123, -0.2363506, 1, 0, 0.7607843, 1,
1.179715, 1.285656, 0.9329329, 1, 0, 0.7568628, 1,
1.190775, -2.842977, 3.96069, 1, 0, 0.7490196, 1,
1.19151, 2.092023, 1.801191, 1, 0, 0.7450981, 1,
1.198136, 0.02965181, 0.3955235, 1, 0, 0.7372549, 1,
1.20541, -0.07879981, 0.9073082, 1, 0, 0.7333333, 1,
1.209535, -1.864331, 2.630107, 1, 0, 0.7254902, 1,
1.217406, 0.7087058, 0.1944929, 1, 0, 0.7215686, 1,
1.219174, -0.8377919, 3.19359, 1, 0, 0.7137255, 1,
1.229623, -0.05573923, 1.948172, 1, 0, 0.7098039, 1,
1.233727, 0.3703854, 0.7688929, 1, 0, 0.7019608, 1,
1.260489, 0.341835, 0.7520375, 1, 0, 0.6941177, 1,
1.262517, -0.02752475, 2.022624, 1, 0, 0.6901961, 1,
1.268434, 1.282483, 1.683908, 1, 0, 0.682353, 1,
1.269508, 0.4837388, 1.699648, 1, 0, 0.6784314, 1,
1.280902, 1.126679, 0.1997948, 1, 0, 0.6705883, 1,
1.281551, -0.7285618, 2.150964, 1, 0, 0.6666667, 1,
1.294201, 0.4831735, 1.183464, 1, 0, 0.6588235, 1,
1.295635, 0.1246369, 4.281742, 1, 0, 0.654902, 1,
1.29936, -0.1863814, 2.468715, 1, 0, 0.6470588, 1,
1.310591, 1.533605, -0.1748504, 1, 0, 0.6431373, 1,
1.311106, -0.4980896, 1.232467, 1, 0, 0.6352941, 1,
1.323045, 0.1057473, 0.6003799, 1, 0, 0.6313726, 1,
1.327547, -1.629296, 1.852162, 1, 0, 0.6235294, 1,
1.330678, -1.217226, 0.8239821, 1, 0, 0.6196079, 1,
1.3383, 1.023833, 0.2866226, 1, 0, 0.6117647, 1,
1.341274, 0.5386931, 2.337449, 1, 0, 0.6078432, 1,
1.342966, -0.6299188, 3.663684, 1, 0, 0.6, 1,
1.347328, -0.67788, 1.919152, 1, 0, 0.5921569, 1,
1.352091, 0.7716174, 0.184486, 1, 0, 0.5882353, 1,
1.353301, -0.7175545, 1.645196, 1, 0, 0.5803922, 1,
1.35531, -0.1814561, 3.344442, 1, 0, 0.5764706, 1,
1.385918, 0.5181083, 0.9970913, 1, 0, 0.5686275, 1,
1.388369, -1.213784, 2.953492, 1, 0, 0.5647059, 1,
1.399849, 0.2959122, -0.4996792, 1, 0, 0.5568628, 1,
1.412281, -0.1658129, 3.759211, 1, 0, 0.5529412, 1,
1.42257, -0.3001007, 1.628175, 1, 0, 0.5450981, 1,
1.467527, 0.7925571, 1.174309, 1, 0, 0.5411765, 1,
1.468347, -0.0516071, 1.171295, 1, 0, 0.5333334, 1,
1.471365, -0.01097135, 1.734175, 1, 0, 0.5294118, 1,
1.480532, 1.058668, 2.778435, 1, 0, 0.5215687, 1,
1.490223, 0.8131017, -0.1306593, 1, 0, 0.5176471, 1,
1.492853, 3.302542, 0.6096306, 1, 0, 0.509804, 1,
1.496988, -1.340433, 1.989904, 1, 0, 0.5058824, 1,
1.499401, 0.3647803, 0.128137, 1, 0, 0.4980392, 1,
1.505478, -0.5061278, 1.975083, 1, 0, 0.4901961, 1,
1.507943, 1.093395, 1.11317, 1, 0, 0.4862745, 1,
1.508847, 1.033289, 1.166573, 1, 0, 0.4784314, 1,
1.511323, -0.8083668, -0.2071896, 1, 0, 0.4745098, 1,
1.511326, -1.26278, 1.114072, 1, 0, 0.4666667, 1,
1.511833, 0.5357966, 1.350565, 1, 0, 0.4627451, 1,
1.529791, 0.6819779, 1.50258, 1, 0, 0.454902, 1,
1.535228, -0.4721518, 2.158441, 1, 0, 0.4509804, 1,
1.535994, -0.62093, 2.578114, 1, 0, 0.4431373, 1,
1.546303, 0.7351252, 1.886571, 1, 0, 0.4392157, 1,
1.548281, -0.6148416, 1.89366, 1, 0, 0.4313726, 1,
1.555497, -0.3884281, 2.976201, 1, 0, 0.427451, 1,
1.561226, 0.356319, 0.6296015, 1, 0, 0.4196078, 1,
1.563699, -0.5898012, 1.710671, 1, 0, 0.4156863, 1,
1.564607, 1.095929, -0.4416965, 1, 0, 0.4078431, 1,
1.575532, 1.345874, 0.6331875, 1, 0, 0.4039216, 1,
1.590331, -0.6119061, 1.045131, 1, 0, 0.3960784, 1,
1.619031, -0.3678706, 1.381109, 1, 0, 0.3882353, 1,
1.61993, 0.2886966, 0.5978636, 1, 0, 0.3843137, 1,
1.622323, -0.7210611, 1.107751, 1, 0, 0.3764706, 1,
1.631855, 0.1882669, 0.4642573, 1, 0, 0.372549, 1,
1.639441, -0.1768322, 2.25122, 1, 0, 0.3647059, 1,
1.641751, 0.8163285, 0.6697131, 1, 0, 0.3607843, 1,
1.642801, -0.06442054, -1.031546, 1, 0, 0.3529412, 1,
1.647438, -0.9983224, 3.159579, 1, 0, 0.3490196, 1,
1.656986, 0.4793227, 1.024111, 1, 0, 0.3411765, 1,
1.669236, 0.598749, 1.542842, 1, 0, 0.3372549, 1,
1.675521, 1.445445, 2.910601, 1, 0, 0.3294118, 1,
1.675632, 0.7954509, 2.608747, 1, 0, 0.3254902, 1,
1.678087, -1.862193, 4.655876, 1, 0, 0.3176471, 1,
1.696287, 0.4980756, 2.070612, 1, 0, 0.3137255, 1,
1.708079, -0.3254136, 3.085529, 1, 0, 0.3058824, 1,
1.709327, -0.5415045, 1.221431, 1, 0, 0.2980392, 1,
1.71561, -0.6568756, 2.765091, 1, 0, 0.2941177, 1,
1.719444, -0.4495345, 1.060148, 1, 0, 0.2862745, 1,
1.728748, 0.4973878, 0.8955731, 1, 0, 0.282353, 1,
1.73376, -0.5425502, 2.75401, 1, 0, 0.2745098, 1,
1.735123, 0.3292921, 0.1000916, 1, 0, 0.2705882, 1,
1.73817, -0.3578462, 1.935706, 1, 0, 0.2627451, 1,
1.745384, -0.04393216, 1.809219, 1, 0, 0.2588235, 1,
1.754953, 0.1043591, 2.776632, 1, 0, 0.2509804, 1,
1.763062, -1.332478, 2.526155, 1, 0, 0.2470588, 1,
1.797254, 1.522769, 0.6923854, 1, 0, 0.2392157, 1,
1.797473, -1.074506, 1.793079, 1, 0, 0.2352941, 1,
1.823402, 0.637471, 1.182588, 1, 0, 0.227451, 1,
1.848441, -0.4347431, 1.825127, 1, 0, 0.2235294, 1,
1.870396, 0.7559572, 0.7963258, 1, 0, 0.2156863, 1,
1.883264, 0.1333825, 0.6221712, 1, 0, 0.2117647, 1,
1.921083, 0.2211225, 1.998532, 1, 0, 0.2039216, 1,
1.936276, 0.02996235, 2.320361, 1, 0, 0.1960784, 1,
1.948774, -1.484896, 2.005481, 1, 0, 0.1921569, 1,
1.957526, -0.9750215, 0.9677132, 1, 0, 0.1843137, 1,
1.963303, -2.148218, 4.370211, 1, 0, 0.1803922, 1,
1.964408, 0.4081781, 1.907744, 1, 0, 0.172549, 1,
1.983892, 0.652023, 1.181785, 1, 0, 0.1686275, 1,
1.988516, 0.0731632, -0.361809, 1, 0, 0.1607843, 1,
2.006472, 0.2912494, 1.907496, 1, 0, 0.1568628, 1,
2.015625, -2.017693, 2.442268, 1, 0, 0.1490196, 1,
2.030014, 1.717131, 2.755189, 1, 0, 0.145098, 1,
2.030636, -2.133786, 1.2228, 1, 0, 0.1372549, 1,
2.057497, 1.813834, 1.384236, 1, 0, 0.1333333, 1,
2.061267, 2.244231, 0.0828053, 1, 0, 0.1254902, 1,
2.069887, 0.4737476, 0.4066219, 1, 0, 0.1215686, 1,
2.087645, 0.4523799, 2.186255, 1, 0, 0.1137255, 1,
2.096086, 0.4610588, 1.309796, 1, 0, 0.1098039, 1,
2.118567, 1.512284, 0.2489327, 1, 0, 0.1019608, 1,
2.124545, -1.150634, 0.4327018, 1, 0, 0.09411765, 1,
2.127712, -0.08769991, 2.486097, 1, 0, 0.09019608, 1,
2.150464, 1.096082, 0.5743669, 1, 0, 0.08235294, 1,
2.187341, -0.6616219, 1.695713, 1, 0, 0.07843138, 1,
2.204461, 0.8910593, -0.01310092, 1, 0, 0.07058824, 1,
2.229549, -0.5428563, 1.674375, 1, 0, 0.06666667, 1,
2.268247, 1.95612, -0.1832882, 1, 0, 0.05882353, 1,
2.300291, -0.3767109, 1.572387, 1, 0, 0.05490196, 1,
2.346414, 0.5265519, 0.9806116, 1, 0, 0.04705882, 1,
2.454573, -0.3046957, 0.6064131, 1, 0, 0.04313726, 1,
2.463953, 0.06288702, 0.7008299, 1, 0, 0.03529412, 1,
2.55182, -1.893886, 2.025965, 1, 0, 0.03137255, 1,
2.662458, -0.01012488, 0.8688184, 1, 0, 0.02352941, 1,
2.776921, 1.836404, 0.296519, 1, 0, 0.01960784, 1,
3.288489, -0.666952, 2.096838, 1, 0, 0.01176471, 1,
3.697807, 0.6659502, 0.8509966, 1, 0, 0.007843138, 1
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
0.2967186, -4.39026, -7.25329, 0, -0.5, 0.5, 0.5,
0.2967186, -4.39026, -7.25329, 1, -0.5, 0.5, 0.5,
0.2967186, -4.39026, -7.25329, 1, 1.5, 0.5, 0.5,
0.2967186, -4.39026, -7.25329, 0, 1.5, 0.5, 0.5
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
-4.257338, 0.1613885, -7.25329, 0, -0.5, 0.5, 0.5,
-4.257338, 0.1613885, -7.25329, 1, -0.5, 0.5, 0.5,
-4.257338, 0.1613885, -7.25329, 1, 1.5, 0.5, 0.5,
-4.257338, 0.1613885, -7.25329, 0, 1.5, 0.5, 0.5
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
-4.257338, -4.39026, -0.4027426, 0, -0.5, 0.5, 0.5,
-4.257338, -4.39026, -0.4027426, 1, -0.5, 0.5, 0.5,
-4.257338, -4.39026, -0.4027426, 1, 1.5, 0.5, 0.5,
-4.257338, -4.39026, -0.4027426, 0, 1.5, 0.5, 0.5
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
-3, -3.33988, -5.672394,
3, -3.33988, -5.672394,
-3, -3.33988, -5.672394,
-3, -3.514943, -5.935877,
-2, -3.33988, -5.672394,
-2, -3.514943, -5.935877,
-1, -3.33988, -5.672394,
-1, -3.514943, -5.935877,
0, -3.33988, -5.672394,
0, -3.514943, -5.935877,
1, -3.33988, -5.672394,
1, -3.514943, -5.935877,
2, -3.33988, -5.672394,
2, -3.514943, -5.935877,
3, -3.33988, -5.672394,
3, -3.514943, -5.935877
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
-3, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
-3, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
-3, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
-3, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
-2, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
-2, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
-2, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
-2, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
-1, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
-1, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
-1, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
-1, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
0, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
0, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
0, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
0, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
1, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
1, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
1, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
1, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
2, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
2, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
2, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
2, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5,
3, -3.86507, -6.462842, 0, -0.5, 0.5, 0.5,
3, -3.86507, -6.462842, 1, -0.5, 0.5, 0.5,
3, -3.86507, -6.462842, 1, 1.5, 0.5, 0.5,
3, -3.86507, -6.462842, 0, 1.5, 0.5, 0.5
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
-3.206402, -3, -5.672394,
-3.206402, 3, -5.672394,
-3.206402, -3, -5.672394,
-3.381558, -3, -5.935877,
-3.206402, -2, -5.672394,
-3.381558, -2, -5.935877,
-3.206402, -1, -5.672394,
-3.381558, -1, -5.935877,
-3.206402, 0, -5.672394,
-3.381558, 0, -5.935877,
-3.206402, 1, -5.672394,
-3.381558, 1, -5.935877,
-3.206402, 2, -5.672394,
-3.381558, 2, -5.935877,
-3.206402, 3, -5.672394,
-3.381558, 3, -5.935877
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
-3.73187, -3, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, -3, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, -3, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, -3, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, -2, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, -2, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, -2, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, -2, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, -1, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, -1, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, -1, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, -1, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, 0, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, 0, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, 0, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, 0, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, 1, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, 1, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, 1, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, 1, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, 2, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, 2, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, 2, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, 2, -6.462842, 0, 1.5, 0.5, 0.5,
-3.73187, 3, -6.462842, 0, -0.5, 0.5, 0.5,
-3.73187, 3, -6.462842, 1, -0.5, 0.5, 0.5,
-3.73187, 3, -6.462842, 1, 1.5, 0.5, 0.5,
-3.73187, 3, -6.462842, 0, 1.5, 0.5, 0.5
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
-3.206402, -3.33988, -4,
-3.206402, -3.33988, 4,
-3.206402, -3.33988, -4,
-3.381558, -3.514943, -4,
-3.206402, -3.33988, -2,
-3.381558, -3.514943, -2,
-3.206402, -3.33988, 0,
-3.381558, -3.514943, 0,
-3.206402, -3.33988, 2,
-3.381558, -3.514943, 2,
-3.206402, -3.33988, 4,
-3.381558, -3.514943, 4
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
-3.73187, -3.86507, -4, 0, -0.5, 0.5, 0.5,
-3.73187, -3.86507, -4, 1, -0.5, 0.5, 0.5,
-3.73187, -3.86507, -4, 1, 1.5, 0.5, 0.5,
-3.73187, -3.86507, -4, 0, 1.5, 0.5, 0.5,
-3.73187, -3.86507, -2, 0, -0.5, 0.5, 0.5,
-3.73187, -3.86507, -2, 1, -0.5, 0.5, 0.5,
-3.73187, -3.86507, -2, 1, 1.5, 0.5, 0.5,
-3.73187, -3.86507, -2, 0, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 0, 0, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 0, 1, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 0, 1, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 0, 0, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 2, 0, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 2, 1, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 2, 1, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 2, 0, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 4, 0, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 4, 1, -0.5, 0.5, 0.5,
-3.73187, -3.86507, 4, 1, 1.5, 0.5, 0.5,
-3.73187, -3.86507, 4, 0, 1.5, 0.5, 0.5
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
-3.206402, -3.33988, -5.672394,
-3.206402, 3.662657, -5.672394,
-3.206402, -3.33988, 4.866909,
-3.206402, 3.662657, 4.866909,
-3.206402, -3.33988, -5.672394,
-3.206402, -3.33988, 4.866909,
-3.206402, 3.662657, -5.672394,
-3.206402, 3.662657, 4.866909,
-3.206402, -3.33988, -5.672394,
3.799839, -3.33988, -5.672394,
-3.206402, -3.33988, 4.866909,
3.799839, -3.33988, 4.866909,
-3.206402, 3.662657, -5.672394,
3.799839, 3.662657, -5.672394,
-3.206402, 3.662657, 4.866909,
3.799839, 3.662657, 4.866909,
3.799839, -3.33988, -5.672394,
3.799839, 3.662657, -5.672394,
3.799839, -3.33988, 4.866909,
3.799839, 3.662657, 4.866909,
3.799839, -3.33988, -5.672394,
3.799839, -3.33988, 4.866909,
3.799839, 3.662657, -5.672394,
3.799839, 3.662657, 4.866909
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
var radius = 7.723358;
var distance = 34.36209;
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
mvMatrix.translate( -0.2967186, -0.1613885, 0.4027426 );
mvMatrix.scale( 1.191887, 1.192517, 0.7923337 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.36209);
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
Ansar<-read.table("Ansar.xyz")
```

```
## Error in read.table("Ansar.xyz"): no lines available in input
```

```r
x<-Ansar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ansar' not found
```

```r
y<-Ansar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ansar' not found
```

```r
z<-Ansar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ansar' not found
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
-3.104369, 1.828446, -0.5891784, 0, 0, 1, 1, 1,
-2.732745, -0.6665866, -2.224521, 1, 0, 0, 1, 1,
-2.69083, 1.488676, -0.927604, 1, 0, 0, 1, 1,
-2.655431, -0.1400015, -2.724814, 1, 0, 0, 1, 1,
-2.622571, 0.2092585, -3.224698, 1, 0, 0, 1, 1,
-2.616876, -0.739868, -2.757681, 1, 0, 0, 1, 1,
-2.344813, 1.117592, -2.863698, 0, 0, 0, 1, 1,
-2.30607, -1.013607, -1.757386, 0, 0, 0, 1, 1,
-2.147772, 1.286707, -2.306693, 0, 0, 0, 1, 1,
-2.132699, -1.476363, -1.810878, 0, 0, 0, 1, 1,
-2.12757, 1.038817, -0.9776515, 0, 0, 0, 1, 1,
-2.100432, 2.423187, -0.6564155, 0, 0, 0, 1, 1,
-2.03363, -1.58069, -2.877865, 0, 0, 0, 1, 1,
-2.005449, 1.656172, -1.383638, 1, 1, 1, 1, 1,
-1.986384, 0.7952714, -0.967056, 1, 1, 1, 1, 1,
-1.950866, -0.6405401, -3.198458, 1, 1, 1, 1, 1,
-1.943192, -0.102835, -1.712267, 1, 1, 1, 1, 1,
-1.934527, -0.7504432, -0.2751393, 1, 1, 1, 1, 1,
-1.93396, 0.6956642, -2.055552, 1, 1, 1, 1, 1,
-1.922074, -1.55587, -2.467705, 1, 1, 1, 1, 1,
-1.921011, -0.544448, -1.560313, 1, 1, 1, 1, 1,
-1.911108, -1.676343, -1.879221, 1, 1, 1, 1, 1,
-1.905423, 0.1426235, -0.6754786, 1, 1, 1, 1, 1,
-1.895135, -0.7971365, -1.17085, 1, 1, 1, 1, 1,
-1.887353, 1.092525, -1.080911, 1, 1, 1, 1, 1,
-1.887351, 1.855637, -0.8745592, 1, 1, 1, 1, 1,
-1.874468, -0.6530548, -1.45328, 1, 1, 1, 1, 1,
-1.871194, 0.2450308, -0.9411674, 1, 1, 1, 1, 1,
-1.869678, 1.820445, -0.5280834, 0, 0, 1, 1, 1,
-1.831984, -1.076212, -2.642972, 1, 0, 0, 1, 1,
-1.783214, 2.749787, 0.7383118, 1, 0, 0, 1, 1,
-1.766181, 1.438196, -0.9531818, 1, 0, 0, 1, 1,
-1.75616, -0.3918156, -1.164253, 1, 0, 0, 1, 1,
-1.753262, -0.3042349, -4.057913, 1, 0, 0, 1, 1,
-1.753102, 0.7068717, 0.08008513, 0, 0, 0, 1, 1,
-1.733975, -1.012045, -2.709141, 0, 0, 0, 1, 1,
-1.729371, -0.6064236, -0.4028145, 0, 0, 0, 1, 1,
-1.727411, 0.06200534, -2.07206, 0, 0, 0, 1, 1,
-1.723922, -0.6306076, -2.521576, 0, 0, 0, 1, 1,
-1.71847, 1.347255, -0.9080709, 0, 0, 0, 1, 1,
-1.715736, 0.6726236, 0.1692961, 0, 0, 0, 1, 1,
-1.715489, 2.4475, -1.066914, 1, 1, 1, 1, 1,
-1.715389, -0.6192902, -1.430573, 1, 1, 1, 1, 1,
-1.711139, 0.336808, -0.7006773, 1, 1, 1, 1, 1,
-1.705041, -0.9235204, -2.080199, 1, 1, 1, 1, 1,
-1.676773, -1.25118, -2.669374, 1, 1, 1, 1, 1,
-1.67533, -0.3662159, 0.3308442, 1, 1, 1, 1, 1,
-1.674153, -1.18983, -1.696565, 1, 1, 1, 1, 1,
-1.673941, 0.2358196, -0.7247961, 1, 1, 1, 1, 1,
-1.672995, 0.09742452, -1.415066, 1, 1, 1, 1, 1,
-1.63473, -0.4340429, -2.060138, 1, 1, 1, 1, 1,
-1.621212, -1.347448, -1.393921, 1, 1, 1, 1, 1,
-1.621164, -0.07311089, -2.998275, 1, 1, 1, 1, 1,
-1.610472, -0.08417154, -2.507874, 1, 1, 1, 1, 1,
-1.607154, 2.548017, 0.04977484, 1, 1, 1, 1, 1,
-1.599346, 0.3556745, -1.723446, 1, 1, 1, 1, 1,
-1.598884, 0.6897984, -1.426524, 0, 0, 1, 1, 1,
-1.597654, 0.6762543, -0.1492522, 1, 0, 0, 1, 1,
-1.59741, 0.9912646, -1.6563, 1, 0, 0, 1, 1,
-1.593395, 0.3127686, -2.639304, 1, 0, 0, 1, 1,
-1.592194, -3.237901, -2.321318, 1, 0, 0, 1, 1,
-1.591661, 1.073194, -1.979869, 1, 0, 0, 1, 1,
-1.590396, 1.326978, -0.3889989, 0, 0, 0, 1, 1,
-1.564213, 1.199375, -0.3979796, 0, 0, 0, 1, 1,
-1.546167, 1.352499, -1.122867, 0, 0, 0, 1, 1,
-1.544849, -0.7131967, -0.6680548, 0, 0, 0, 1, 1,
-1.526853, 0.5586603, -1.857967, 0, 0, 0, 1, 1,
-1.521938, -0.432496, -1.609114, 0, 0, 0, 1, 1,
-1.521425, -0.6978472, -1.690019, 0, 0, 0, 1, 1,
-1.492016, 0.6011286, -2.842293, 1, 1, 1, 1, 1,
-1.480909, 0.7756882, -3.997722, 1, 1, 1, 1, 1,
-1.477765, -0.9142186, -2.500748, 1, 1, 1, 1, 1,
-1.475137, -0.4941531, -0.4842634, 1, 1, 1, 1, 1,
-1.457734, -1.381032, -2.232618, 1, 1, 1, 1, 1,
-1.456948, -0.7332423, -1.116076, 1, 1, 1, 1, 1,
-1.455918, 0.2478387, -2.312784, 1, 1, 1, 1, 1,
-1.453884, 0.1717954, -1.247957, 1, 1, 1, 1, 1,
-1.45257, -0.9000268, -4.127181, 1, 1, 1, 1, 1,
-1.442525, -0.1166504, -2.11002, 1, 1, 1, 1, 1,
-1.435585, -0.7589747, -0.005329277, 1, 1, 1, 1, 1,
-1.435401, -0.90213, -2.861019, 1, 1, 1, 1, 1,
-1.409407, 0.3110131, -2.163509, 1, 1, 1, 1, 1,
-1.394612, -1.485468, -2.863015, 1, 1, 1, 1, 1,
-1.376916, 0.2546454, -2.457175, 1, 1, 1, 1, 1,
-1.375423, -0.02206569, 0.08100718, 0, 0, 1, 1, 1,
-1.372323, 1.116866, -0.4934287, 1, 0, 0, 1, 1,
-1.362934, 0.02247703, -1.794046, 1, 0, 0, 1, 1,
-1.35509, 0.09309312, -1.147086, 1, 0, 0, 1, 1,
-1.345536, -0.06154, -1.300998, 1, 0, 0, 1, 1,
-1.328392, -0.531222, -1.10666, 1, 0, 0, 1, 1,
-1.320737, -1.367251, -1.636901, 0, 0, 0, 1, 1,
-1.311499, -1.554505, -2.87121, 0, 0, 0, 1, 1,
-1.309273, -0.7794076, -1.772955, 0, 0, 0, 1, 1,
-1.307034, 0.9180593, 0.8914382, 0, 0, 0, 1, 1,
-1.303431, 1.764978, -1.181087, 0, 0, 0, 1, 1,
-1.296958, 0.775196, -1.201797, 0, 0, 0, 1, 1,
-1.293337, -1.450757, -4.057221, 0, 0, 0, 1, 1,
-1.292915, 1.213872, -1.060727, 1, 1, 1, 1, 1,
-1.291486, -1.240002, -2.170366, 1, 1, 1, 1, 1,
-1.285932, -1.418576, -1.582802, 1, 1, 1, 1, 1,
-1.284626, 1.05888, -0.9826389, 1, 1, 1, 1, 1,
-1.280712, 0.7195217, -1.31042, 1, 1, 1, 1, 1,
-1.279649, 1.621646, -2.112226, 1, 1, 1, 1, 1,
-1.271888, 0.05711151, -0.9405897, 1, 1, 1, 1, 1,
-1.2717, 0.4796576, -1.597594, 1, 1, 1, 1, 1,
-1.269829, 1.834065, -0.6345648, 1, 1, 1, 1, 1,
-1.268528, -1.618816, -2.111417, 1, 1, 1, 1, 1,
-1.262876, -0.9151959, -1.765071, 1, 1, 1, 1, 1,
-1.249223, 0.213247, -1.277145, 1, 1, 1, 1, 1,
-1.243256, 0.1278322, -1.787647, 1, 1, 1, 1, 1,
-1.237636, -0.3167913, -1.625388, 1, 1, 1, 1, 1,
-1.22792, -0.3583635, -1.166001, 1, 1, 1, 1, 1,
-1.222436, 0.4133155, -3.025243, 0, 0, 1, 1, 1,
-1.2207, -0.7623946, -1.927623, 1, 0, 0, 1, 1,
-1.209982, 0.2920136, -1.494557, 1, 0, 0, 1, 1,
-1.207544, 0.3398044, -2.347488, 1, 0, 0, 1, 1,
-1.2064, -2.175267, -2.491036, 1, 0, 0, 1, 1,
-1.199594, -0.3157121, -2.077446, 1, 0, 0, 1, 1,
-1.186618, 2.019331, -1.965807, 0, 0, 0, 1, 1,
-1.161516, -1.04609, -2.497516, 0, 0, 0, 1, 1,
-1.158541, -0.9460849, -1.217151, 0, 0, 0, 1, 1,
-1.155041, 0.4462374, -3.14331, 0, 0, 0, 1, 1,
-1.153968, 0.1358003, -1.298959, 0, 0, 0, 1, 1,
-1.14958, 0.7010705, 1.225673, 0, 0, 0, 1, 1,
-1.148268, -0.2162369, -1.569485, 0, 0, 0, 1, 1,
-1.144385, 0.01688421, -2.715306, 1, 1, 1, 1, 1,
-1.143233, -0.002809922, -1.228134, 1, 1, 1, 1, 1,
-1.142155, 2.122104, 1.882796, 1, 1, 1, 1, 1,
-1.139241, 0.8519054, -2.306475, 1, 1, 1, 1, 1,
-1.138497, -0.08638957, -0.4612008, 1, 1, 1, 1, 1,
-1.133533, 1.075536, -0.0427972, 1, 1, 1, 1, 1,
-1.128056, -0.07393435, -1.531544, 1, 1, 1, 1, 1,
-1.115952, -1.074266, -1.37519, 1, 1, 1, 1, 1,
-1.110787, 0.7342259, -1.876161, 1, 1, 1, 1, 1,
-1.105929, -1.866865, -3.245634, 1, 1, 1, 1, 1,
-1.104006, -1.342002, -2.860416, 1, 1, 1, 1, 1,
-1.092478, 0.05161506, -1.489679, 1, 1, 1, 1, 1,
-1.080378, -0.7057597, -2.799964, 1, 1, 1, 1, 1,
-1.080211, -1.47203, -1.864472, 1, 1, 1, 1, 1,
-1.078221, 1.352191, -3.290007, 1, 1, 1, 1, 1,
-1.074651, 1.871207, 0.5273464, 0, 0, 1, 1, 1,
-1.072549, -0.5357754, -2.149014, 1, 0, 0, 1, 1,
-1.064948, -0.3391811, -1.025355, 1, 0, 0, 1, 1,
-1.064744, 1.105183, 0.2424506, 1, 0, 0, 1, 1,
-1.057361, 1.632489, 0.009900604, 1, 0, 0, 1, 1,
-1.056561, 1.358923, -0.01184933, 1, 0, 0, 1, 1,
-1.046498, 0.0344911, -1.027768, 0, 0, 0, 1, 1,
-1.041193, -0.4752052, -2.648113, 0, 0, 0, 1, 1,
-1.036171, 1.128717, -0.7079859, 0, 0, 0, 1, 1,
-1.032581, 1.685368, -1.870358, 0, 0, 0, 1, 1,
-1.030695, 1.461377, -0.4956243, 0, 0, 0, 1, 1,
-1.029719, 0.1322032, 1.145483, 0, 0, 0, 1, 1,
-1.026356, 0.254994, -0.9352174, 0, 0, 0, 1, 1,
-1.02256, -0.0230484, -2.215721, 1, 1, 1, 1, 1,
-1.019168, 0.7653782, -0.6875933, 1, 1, 1, 1, 1,
-1.015767, -0.2917037, -1.96912, 1, 1, 1, 1, 1,
-1.015546, -0.7455699, -2.345035, 1, 1, 1, 1, 1,
-1.012937, 1.049113, -0.1225153, 1, 1, 1, 1, 1,
-1.006957, -1.727019, -1.579683, 1, 1, 1, 1, 1,
-1.006112, 0.7523423, -2.035531, 1, 1, 1, 1, 1,
-1.003037, -1.194455, -2.492079, 1, 1, 1, 1, 1,
-1.00232, -0.8844926, -1.50848, 1, 1, 1, 1, 1,
-0.9952279, -1.33912, -3.231435, 1, 1, 1, 1, 1,
-0.9898811, 1.543239, -0.8866648, 1, 1, 1, 1, 1,
-0.9858332, -1.121299, -2.092178, 1, 1, 1, 1, 1,
-0.9779272, 0.7568511, -3.096466, 1, 1, 1, 1, 1,
-0.9714744, -0.6306672, -1.517182, 1, 1, 1, 1, 1,
-0.96303, 0.03646076, -1.903138, 1, 1, 1, 1, 1,
-0.9598143, 0.4803684, -2.118234, 0, 0, 1, 1, 1,
-0.9597338, -1.301092, -1.399577, 1, 0, 0, 1, 1,
-0.9595447, -0.08793759, -0.8405617, 1, 0, 0, 1, 1,
-0.9561954, -0.4240078, -3.552656, 1, 0, 0, 1, 1,
-0.953872, 1.109005, -1.142843, 1, 0, 0, 1, 1,
-0.9525145, -0.2435823, 1.139889, 1, 0, 0, 1, 1,
-0.9476001, 0.3945564, -1.181469, 0, 0, 0, 1, 1,
-0.9402469, -1.190724, -2.69635, 0, 0, 0, 1, 1,
-0.9397369, -0.5403823, -0.8002958, 0, 0, 0, 1, 1,
-0.9260347, -0.04154287, -1.375689, 0, 0, 0, 1, 1,
-0.9250655, -0.9969468, -0.9320821, 0, 0, 0, 1, 1,
-0.9210008, -0.2377564, -1.941099, 0, 0, 0, 1, 1,
-0.9066284, -1.577222, -3.158867, 0, 0, 0, 1, 1,
-0.9065108, 1.138963, -1.200976, 1, 1, 1, 1, 1,
-0.8972425, -0.8071613, -1.403394, 1, 1, 1, 1, 1,
-0.8939764, 0.458064, 0.5859693, 1, 1, 1, 1, 1,
-0.8897996, -0.5175279, -3.351782, 1, 1, 1, 1, 1,
-0.8891351, -2.023221, -4.136623, 1, 1, 1, 1, 1,
-0.8874239, -0.4713136, -3.441328, 1, 1, 1, 1, 1,
-0.8825575, 1.88342, 0.8559636, 1, 1, 1, 1, 1,
-0.8653876, 0.5978168, -1.575593, 1, 1, 1, 1, 1,
-0.8648904, -1.026199, -1.400307, 1, 1, 1, 1, 1,
-0.864266, -0.5537837, -2.150898, 1, 1, 1, 1, 1,
-0.8632919, 0.4504503, -1.092803, 1, 1, 1, 1, 1,
-0.8502001, -1.5904, -2.700682, 1, 1, 1, 1, 1,
-0.8485982, -0.5182949, -3.259055, 1, 1, 1, 1, 1,
-0.8456283, -0.496913, -3.154273, 1, 1, 1, 1, 1,
-0.8448659, -2.155149, -0.3946593, 1, 1, 1, 1, 1,
-0.8443057, -0.460373, -2.156769, 0, 0, 1, 1, 1,
-0.8428758, -0.1124289, -2.369521, 1, 0, 0, 1, 1,
-0.8425043, -0.4636648, -3.270861, 1, 0, 0, 1, 1,
-0.8336905, 2.559954, -1.253726, 1, 0, 0, 1, 1,
-0.8331958, -0.2134131, 0.2325127, 1, 0, 0, 1, 1,
-0.8320629, -0.3069299, -2.813222, 1, 0, 0, 1, 1,
-0.8307442, -1.810375, -2.765403, 0, 0, 0, 1, 1,
-0.8219302, -0.2202399, -1.951426, 0, 0, 0, 1, 1,
-0.8141314, 0.2359141, -2.749846, 0, 0, 0, 1, 1,
-0.8096322, 0.4248167, -1.92862, 0, 0, 0, 1, 1,
-0.8057117, 0.4859727, -0.6759543, 0, 0, 0, 1, 1,
-0.7959149, 1.32463, 0.2127517, 0, 0, 0, 1, 1,
-0.7927322, 0.800724, -0.069244, 0, 0, 0, 1, 1,
-0.7896107, 1.404625, -0.6915399, 1, 1, 1, 1, 1,
-0.7874887, -1.91405, -2.007966, 1, 1, 1, 1, 1,
-0.786884, -0.6960499, -2.409179, 1, 1, 1, 1, 1,
-0.7830167, -0.7362663, -1.016557, 1, 1, 1, 1, 1,
-0.7788779, 1.224583, -1.304554, 1, 1, 1, 1, 1,
-0.7754731, -0.240126, -1.895644, 1, 1, 1, 1, 1,
-0.7710106, -0.5134723, -3.260075, 1, 1, 1, 1, 1,
-0.7652625, -1.407429, -1.928222, 1, 1, 1, 1, 1,
-0.7591463, 0.9906863, 0.05356058, 1, 1, 1, 1, 1,
-0.7570364, -0.9331071, -3.069612, 1, 1, 1, 1, 1,
-0.7542136, 0.5570414, -0.3834684, 1, 1, 1, 1, 1,
-0.7493797, 1.501931, 0.7588148, 1, 1, 1, 1, 1,
-0.7454917, 1.529824, 1.043518, 1, 1, 1, 1, 1,
-0.7422672, -0.2983832, -2.784471, 1, 1, 1, 1, 1,
-0.735511, 0.4738028, -0.6050759, 1, 1, 1, 1, 1,
-0.7325723, 1.449811, 0.843901, 0, 0, 1, 1, 1,
-0.7308813, 2.091922, 0.005838803, 1, 0, 0, 1, 1,
-0.7292034, -0.1992741, -1.587553, 1, 0, 0, 1, 1,
-0.7226804, 0.3868708, -1.145216, 1, 0, 0, 1, 1,
-0.7225837, -0.8607239, -4.557606, 1, 0, 0, 1, 1,
-0.7204425, 0.875695, 1.576795, 1, 0, 0, 1, 1,
-0.716389, -0.3701629, -3.095448, 0, 0, 0, 1, 1,
-0.7064556, -0.4284545, -1.780471, 0, 0, 0, 1, 1,
-0.7045956, -1.361725, -3.561596, 0, 0, 0, 1, 1,
-0.7023706, -1.093775, -2.083267, 0, 0, 0, 1, 1,
-0.692845, 0.4495085, -1.371151, 0, 0, 0, 1, 1,
-0.690914, -1.309074, -2.27951, 0, 0, 0, 1, 1,
-0.6877341, -1.118556, -2.449468, 0, 0, 0, 1, 1,
-0.6832916, -0.9221693, -4.249479, 1, 1, 1, 1, 1,
-0.6812737, 1.042486, -1.801986, 1, 1, 1, 1, 1,
-0.6799135, -1.439849, -2.953904, 1, 1, 1, 1, 1,
-0.6795434, -0.7824226, -1.395249, 1, 1, 1, 1, 1,
-0.6785724, -0.1296883, -3.816545, 1, 1, 1, 1, 1,
-0.6772013, 1.083467, 0.02373987, 1, 1, 1, 1, 1,
-0.6771247, -0.1034268, -1.644677, 1, 1, 1, 1, 1,
-0.6757046, -0.1351041, -0.06655392, 1, 1, 1, 1, 1,
-0.6706836, -2.568818, -3.290883, 1, 1, 1, 1, 1,
-0.6601781, 1.440862, -1.793565, 1, 1, 1, 1, 1,
-0.6557921, 1.829906, 0.5171327, 1, 1, 1, 1, 1,
-0.6553857, -1.392055, -3.647528, 1, 1, 1, 1, 1,
-0.6459215, 1.264939, 1.83714, 1, 1, 1, 1, 1,
-0.6452737, 0.8758498, -0.3308281, 1, 1, 1, 1, 1,
-0.642316, 0.9848199, -1.022595, 1, 1, 1, 1, 1,
-0.6408274, 1.173794, 0.2227026, 0, 0, 1, 1, 1,
-0.6343635, -1.931559, -2.077998, 1, 0, 0, 1, 1,
-0.6339248, 0.3951845, -2.050388, 1, 0, 0, 1, 1,
-0.6334293, 0.6491636, -1.937106, 1, 0, 0, 1, 1,
-0.6314065, -0.4036705, -3.702085, 1, 0, 0, 1, 1,
-0.6309381, -0.6876265, -1.947349, 1, 0, 0, 1, 1,
-0.6235221, 0.2098225, -1.297711, 0, 0, 0, 1, 1,
-0.6160047, -2.003621, -1.549211, 0, 0, 0, 1, 1,
-0.6127661, 0.626882, -2.064311, 0, 0, 0, 1, 1,
-0.6057081, -0.8876827, -3.964363, 0, 0, 0, 1, 1,
-0.6035608, 0.8991178, -1.105321, 0, 0, 0, 1, 1,
-0.6032935, 0.3433723, -1.165475, 0, 0, 0, 1, 1,
-0.6010719, 0.204599, -0.2075512, 0, 0, 0, 1, 1,
-0.5963227, -1.033094, -3.506565, 1, 1, 1, 1, 1,
-0.5853354, 0.1098009, -0.8656605, 1, 1, 1, 1, 1,
-0.5844854, 0.8303956, -0.6982594, 1, 1, 1, 1, 1,
-0.5843503, 0.03151199, -0.0951851, 1, 1, 1, 1, 1,
-0.5812472, -0.4672008, -2.30156, 1, 1, 1, 1, 1,
-0.5757725, 2.136076, 0.7906212, 1, 1, 1, 1, 1,
-0.5752588, -0.2864861, -2.248712, 1, 1, 1, 1, 1,
-0.5717277, 0.2495648, -1.368161, 1, 1, 1, 1, 1,
-0.5650144, -0.5235428, -1.627971, 1, 1, 1, 1, 1,
-0.5632364, 1.06355, -0.534695, 1, 1, 1, 1, 1,
-0.5616426, -0.6443377, -3.79945, 1, 1, 1, 1, 1,
-0.561489, 0.7196698, -0.4205422, 1, 1, 1, 1, 1,
-0.5515673, 1.318367, -1.049421, 1, 1, 1, 1, 1,
-0.5474827, -0.5010756, -2.537398, 1, 1, 1, 1, 1,
-0.5473881, 1.396898, 1.822454, 1, 1, 1, 1, 1,
-0.5467807, 0.4363731, -1.293304, 0, 0, 1, 1, 1,
-0.5462073, 1.576641, -0.843713, 1, 0, 0, 1, 1,
-0.5452103, -0.7596581, -4.904629, 1, 0, 0, 1, 1,
-0.5414174, 0.4824327, -0.4309448, 1, 0, 0, 1, 1,
-0.5346779, 0.3361577, 1.216815, 1, 0, 0, 1, 1,
-0.5270058, -0.4530269, -2.890831, 1, 0, 0, 1, 1,
-0.5223953, 0.5125852, -2.367515, 0, 0, 0, 1, 1,
-0.5197393, -0.1226399, -1.589883, 0, 0, 0, 1, 1,
-0.5195028, 0.6900778, 1.671211, 0, 0, 0, 1, 1,
-0.5138842, 0.1521534, -3.010643, 0, 0, 0, 1, 1,
-0.5121307, 0.5947144, 0.9523127, 0, 0, 0, 1, 1,
-0.5117506, -0.4069131, -2.194547, 0, 0, 0, 1, 1,
-0.5106479, -0.2713479, -2.212445, 0, 0, 0, 1, 1,
-0.5101189, 1.423992, 0.6713976, 1, 1, 1, 1, 1,
-0.5093839, -0.7405809, -3.397009, 1, 1, 1, 1, 1,
-0.505614, 0.2051188, -0.9845643, 1, 1, 1, 1, 1,
-0.5046905, -1.38122, -1.992213, 1, 1, 1, 1, 1,
-0.5037178, -0.3994919, -1.852392, 1, 1, 1, 1, 1,
-0.5016223, 2.893527, -1.681261, 1, 1, 1, 1, 1,
-0.5001722, -0.8870195, -4.678876, 1, 1, 1, 1, 1,
-0.4912145, -0.603998, -3.151455, 1, 1, 1, 1, 1,
-0.4904584, 1.603783, -1.861907, 1, 1, 1, 1, 1,
-0.4889386, 0.292231, 0.124669, 1, 1, 1, 1, 1,
-0.4882092, -0.6969278, -1.534178, 1, 1, 1, 1, 1,
-0.4842187, -0.006334904, 0.4308163, 1, 1, 1, 1, 1,
-0.4834177, -0.7976347, -2.731365, 1, 1, 1, 1, 1,
-0.4701664, 0.5269302, -0.9929796, 1, 1, 1, 1, 1,
-0.4667014, 1.827642, -2.378573, 1, 1, 1, 1, 1,
-0.4662741, 3.560678, -1.858394, 0, 0, 1, 1, 1,
-0.4631518, -0.01997596, -2.424181, 1, 0, 0, 1, 1,
-0.4626842, 0.8156468, -0.7438735, 1, 0, 0, 1, 1,
-0.4612702, 0.6611739, 0.8918161, 1, 0, 0, 1, 1,
-0.4607511, -1.051366, -2.251828, 1, 0, 0, 1, 1,
-0.4605999, 2.036804, -1.453078, 1, 0, 0, 1, 1,
-0.4596239, -0.9014646, -2.361325, 0, 0, 0, 1, 1,
-0.4540715, -0.3982016, -1.162556, 0, 0, 0, 1, 1,
-0.4530621, 0.3761492, -1.867425, 0, 0, 0, 1, 1,
-0.4507892, 0.04400414, -1.255823, 0, 0, 0, 1, 1,
-0.4505122, -0.3959028, -2.899581, 0, 0, 0, 1, 1,
-0.4470952, -1.290105, -2.347378, 0, 0, 0, 1, 1,
-0.4458629, -0.4877954, -2.05243, 0, 0, 0, 1, 1,
-0.4449016, -0.5549539, -2.176944, 1, 1, 1, 1, 1,
-0.4411125, -0.3276305, -2.555682, 1, 1, 1, 1, 1,
-0.4338537, -1.153664, -4.2539, 1, 1, 1, 1, 1,
-0.4328692, 0.1676574, -1.129761, 1, 1, 1, 1, 1,
-0.4315465, -0.5121573, -2.904665, 1, 1, 1, 1, 1,
-0.4308456, -0.7779437, -1.973179, 1, 1, 1, 1, 1,
-0.4302465, 0.2657676, -2.244093, 1, 1, 1, 1, 1,
-0.4276183, 0.5296291, -1.506442, 1, 1, 1, 1, 1,
-0.4188171, -2.30926, -2.984675, 1, 1, 1, 1, 1,
-0.4160284, -1.15722, -3.829513, 1, 1, 1, 1, 1,
-0.4113531, 0.6160353, 0.5702887, 1, 1, 1, 1, 1,
-0.4026269, 0.1241299, -1.644585, 1, 1, 1, 1, 1,
-0.4025067, -0.8990231, -2.662013, 1, 1, 1, 1, 1,
-0.4010103, 0.3787775, -2.05593, 1, 1, 1, 1, 1,
-0.3974757, 0.05717824, -3.30918, 1, 1, 1, 1, 1,
-0.3967671, -0.7512062, -3.851271, 0, 0, 1, 1, 1,
-0.39623, 0.7392372, -1.430856, 1, 0, 0, 1, 1,
-0.3949045, -0.6703505, -3.209242, 1, 0, 0, 1, 1,
-0.3938764, 0.5143764, -1.627713, 1, 0, 0, 1, 1,
-0.3868811, 1.51515, -0.5579774, 1, 0, 0, 1, 1,
-0.3824897, 1.432756, -0.5668986, 1, 0, 0, 1, 1,
-0.3818456, -0.1125241, -1.7473, 0, 0, 0, 1, 1,
-0.3817674, 1.969271, 0.06099747, 0, 0, 0, 1, 1,
-0.3799481, 1.827941, -1.721463, 0, 0, 0, 1, 1,
-0.3762169, -0.6036607, -2.922069, 0, 0, 0, 1, 1,
-0.3715986, -1.009283, -3.497224, 0, 0, 0, 1, 1,
-0.3714929, 0.09994574, -1.705637, 0, 0, 0, 1, 1,
-0.3678938, -1.255256, -0.932587, 0, 0, 0, 1, 1,
-0.3656678, 2.053756, 0.1014909, 1, 1, 1, 1, 1,
-0.3642513, 1.327016, -0.4368872, 1, 1, 1, 1, 1,
-0.3623286, -2.256254, -2.394107, 1, 1, 1, 1, 1,
-0.3590561, -0.7796004, -3.239882, 1, 1, 1, 1, 1,
-0.358214, -1.390183, -3.392448, 1, 1, 1, 1, 1,
-0.3572525, 0.4957126, 1.877244, 1, 1, 1, 1, 1,
-0.35725, -0.5551495, -3.467412, 1, 1, 1, 1, 1,
-0.3554198, -1.035564, -1.107728, 1, 1, 1, 1, 1,
-0.3498564, 0.315627, -1.8497, 1, 1, 1, 1, 1,
-0.3448198, -0.163885, -1.36492, 1, 1, 1, 1, 1,
-0.3439469, 0.08210933, -3.234206, 1, 1, 1, 1, 1,
-0.3436918, 0.8773884, -1.318812, 1, 1, 1, 1, 1,
-0.3436498, -0.1465463, -2.462191, 1, 1, 1, 1, 1,
-0.3337004, 1.622625, -0.5685036, 1, 1, 1, 1, 1,
-0.3314366, 0.1462788, -1.901276, 1, 1, 1, 1, 1,
-0.3311983, -0.3040091, -1.243325, 0, 0, 1, 1, 1,
-0.3302884, 0.09476996, -0.2796967, 1, 0, 0, 1, 1,
-0.3279608, -0.3762976, -2.865589, 1, 0, 0, 1, 1,
-0.3254746, -0.3272128, -2.546923, 1, 0, 0, 1, 1,
-0.3232265, -0.8435507, -2.326347, 1, 0, 0, 1, 1,
-0.3219475, 1.333021, -1.875055, 1, 0, 0, 1, 1,
-0.3216711, 0.312418, -1.717985, 0, 0, 0, 1, 1,
-0.3210105, 0.5164416, -0.1818478, 0, 0, 0, 1, 1,
-0.3135997, -0.2012955, -2.370906, 0, 0, 0, 1, 1,
-0.3109583, -0.4086004, -0.9858931, 0, 0, 0, 1, 1,
-0.3102794, 0.2050649, -1.696769, 0, 0, 0, 1, 1,
-0.3086708, -0.8711658, -2.018265, 0, 0, 0, 1, 1,
-0.3056971, 0.1503962, -0.7511708, 0, 0, 0, 1, 1,
-0.3056688, -0.582829, -2.705216, 1, 1, 1, 1, 1,
-0.3042514, -0.3149175, -4.017495, 1, 1, 1, 1, 1,
-0.3032005, 0.2092718, -2.280917, 1, 1, 1, 1, 1,
-0.2989959, -0.528156, -2.506443, 1, 1, 1, 1, 1,
-0.2982005, 1.493898, -0.04631231, 1, 1, 1, 1, 1,
-0.2959244, -0.07608269, -1.29601, 1, 1, 1, 1, 1,
-0.2928398, 0.04269338, -1.132985, 1, 1, 1, 1, 1,
-0.2834473, -1.535763, -2.408767, 1, 1, 1, 1, 1,
-0.2814435, -1.489197, -4.080987, 1, 1, 1, 1, 1,
-0.2767758, 0.6105462, 0.02733922, 1, 1, 1, 1, 1,
-0.2765948, -0.554969, -2.346124, 1, 1, 1, 1, 1,
-0.2745635, 0.5625569, -0.2551131, 1, 1, 1, 1, 1,
-0.2735983, 1.066621, 0.8724729, 1, 1, 1, 1, 1,
-0.2627366, 0.41168, -1.693005, 1, 1, 1, 1, 1,
-0.262289, 0.7212891, 2.176396, 1, 1, 1, 1, 1,
-0.2605724, -0.3070377, -2.262298, 0, 0, 1, 1, 1,
-0.2552944, -0.2057878, -1.919442, 1, 0, 0, 1, 1,
-0.2529875, 0.1369058, -2.886447, 1, 0, 0, 1, 1,
-0.2504117, 0.3742059, 0.4802205, 1, 0, 0, 1, 1,
-0.2500742, 0.4644314, -0.5250069, 1, 0, 0, 1, 1,
-0.2380823, 1.257017, -0.4267709, 1, 0, 0, 1, 1,
-0.2372187, 0.7994565, 0.0514965, 0, 0, 0, 1, 1,
-0.237096, 0.974473, -1.402458, 0, 0, 0, 1, 1,
-0.2320337, -0.7293437, -4.395647, 0, 0, 0, 1, 1,
-0.230472, 0.3176753, -2.676118, 0, 0, 0, 1, 1,
-0.2278894, 0.06605962, -0.7048528, 0, 0, 0, 1, 1,
-0.2255157, 0.4487324, -0.9347569, 0, 0, 0, 1, 1,
-0.2247153, 0.223092, -2.367789, 0, 0, 0, 1, 1,
-0.2174304, -0.01998726, -1.449581, 1, 1, 1, 1, 1,
-0.2145819, -0.1807625, -1.44075, 1, 1, 1, 1, 1,
-0.2087013, -0.7269474, -1.837482, 1, 1, 1, 1, 1,
-0.2066187, 0.902831, -1.899201, 1, 1, 1, 1, 1,
-0.2051669, -0.4222262, -5.290785, 1, 1, 1, 1, 1,
-0.2005325, -0.3881158, -2.946005, 1, 1, 1, 1, 1,
-0.1964003, 0.2261751, -0.1738873, 1, 1, 1, 1, 1,
-0.1900663, 0.558672, 0.5434626, 1, 1, 1, 1, 1,
-0.1866683, -0.1556474, -1.768178, 1, 1, 1, 1, 1,
-0.1832777, -1.053488, -2.617547, 1, 1, 1, 1, 1,
-0.1823506, -1.075596, -1.971251, 1, 1, 1, 1, 1,
-0.1736865, -0.8594271, -1.389383, 1, 1, 1, 1, 1,
-0.1725448, -1.050846, -3.30993, 1, 1, 1, 1, 1,
-0.1715923, 0.9585259, -1.766936, 1, 1, 1, 1, 1,
-0.1688763, -0.1585941, -1.572003, 1, 1, 1, 1, 1,
-0.1683483, -2.759675, -3.212704, 0, 0, 1, 1, 1,
-0.1677515, -1.179237, -2.024223, 1, 0, 0, 1, 1,
-0.1626705, -0.9704364, -3.425895, 1, 0, 0, 1, 1,
-0.1577536, -0.7594734, -3.932733, 1, 0, 0, 1, 1,
-0.1574792, -0.5811269, -2.702723, 1, 0, 0, 1, 1,
-0.1564191, -0.7796772, -2.464665, 1, 0, 0, 1, 1,
-0.1520999, -0.7719893, -2.636512, 0, 0, 0, 1, 1,
-0.1425554, 0.02964691, -2.049256, 0, 0, 0, 1, 1,
-0.1383841, 0.3161287, -0.3234727, 0, 0, 0, 1, 1,
-0.1363801, 2.108359, -1.39393, 0, 0, 0, 1, 1,
-0.1325405, -1.034613, -4.481565, 0, 0, 0, 1, 1,
-0.1309229, -1.685715, -4.951678, 0, 0, 0, 1, 1,
-0.1308009, 0.4988126, -2.373099, 0, 0, 0, 1, 1,
-0.1263436, -1.459584, -1.68278, 1, 1, 1, 1, 1,
-0.1178905, 0.3309036, -0.3413622, 1, 1, 1, 1, 1,
-0.1159243, -0.6889943, -2.482208, 1, 1, 1, 1, 1,
-0.1110353, 1.317734, -0.3442077, 1, 1, 1, 1, 1,
-0.1021692, -2.166572, -2.945686, 1, 1, 1, 1, 1,
-0.1005487, -0.2839496, -2.482591, 1, 1, 1, 1, 1,
-0.09752679, -0.9781322, -4.105139, 1, 1, 1, 1, 1,
-0.09184802, -0.954065, -2.58482, 1, 1, 1, 1, 1,
-0.08155157, 1.916984, 0.05751935, 1, 1, 1, 1, 1,
-0.07721008, 0.1027884, 0.3283325, 1, 1, 1, 1, 1,
-0.07460422, 0.4207767, -0.9210581, 1, 1, 1, 1, 1,
-0.07236447, 0.606338, 0.304062, 1, 1, 1, 1, 1,
-0.07137783, 2.008312, -1.468286, 1, 1, 1, 1, 1,
-0.06867742, -1.183082, -2.23093, 1, 1, 1, 1, 1,
-0.06486802, 1.157692, 0.9819301, 1, 1, 1, 1, 1,
-0.06103458, -0.6183776, -3.45988, 0, 0, 1, 1, 1,
-0.05168878, -0.5880334, -3.872027, 1, 0, 0, 1, 1,
-0.05115205, -0.2472249, -2.598933, 1, 0, 0, 1, 1,
-0.04725972, -0.4722883, -2.797481, 1, 0, 0, 1, 1,
-0.04591929, 0.00265703, -2.267643, 1, 0, 0, 1, 1,
-0.04552931, 1.668432, 0.7854925, 1, 0, 0, 1, 1,
-0.04452547, -0.2537523, -3.948713, 0, 0, 0, 1, 1,
-0.04300565, 1.193938, -0.742004, 0, 0, 0, 1, 1,
-0.04123759, 1.909422, 1.168962, 0, 0, 0, 1, 1,
-0.0389198, 0.7913671, -0.7825652, 0, 0, 0, 1, 1,
-0.0383699, 0.2364585, -0.8710089, 0, 0, 0, 1, 1,
-0.03659234, -0.1142517, -3.454811, 0, 0, 0, 1, 1,
-0.03524811, 0.5177456, -0.05335777, 0, 0, 0, 1, 1,
-0.0277328, -1.636174, -2.445036, 1, 1, 1, 1, 1,
-0.02417399, -1.14287, -3.702578, 1, 1, 1, 1, 1,
-0.02103596, -0.480345, -2.949499, 1, 1, 1, 1, 1,
-0.01805776, 0.868287, 0.1659245, 1, 1, 1, 1, 1,
-0.01083193, 0.2963771, -0.5123243, 1, 1, 1, 1, 1,
-0.008844331, -0.325, -4.356687, 1, 1, 1, 1, 1,
-0.007275222, 0.647413, 0.8045257, 1, 1, 1, 1, 1,
-0.005974552, 0.304892, -0.5207316, 1, 1, 1, 1, 1,
-0.004805084, 0.3981507, -0.1771203, 1, 1, 1, 1, 1,
-0.004515933, 1.200827, 0.5229944, 1, 1, 1, 1, 1,
-0.003950115, 0.09799191, 0.04338927, 1, 1, 1, 1, 1,
-0.001457933, -0.5674148, -5.518909, 1, 1, 1, 1, 1,
-0.001007179, -1.802822, -3.601944, 1, 1, 1, 1, 1,
0.00110512, 0.02899218, -1.381086, 1, 1, 1, 1, 1,
0.002044426, 0.5772249, 0.534769, 1, 1, 1, 1, 1,
0.003053678, -0.4285896, 3.3946, 0, 0, 1, 1, 1,
0.00405532, 2.870145, -0.3037489, 1, 0, 0, 1, 1,
0.01097953, 0.8109947, 0.6721007, 1, 0, 0, 1, 1,
0.01131377, -0.7480521, 3.020609, 1, 0, 0, 1, 1,
0.01519916, 2.168236, 0.9660019, 1, 0, 0, 1, 1,
0.01532021, 0.4719661, -1.316116, 1, 0, 0, 1, 1,
0.01620003, 0.929537, -0.3584218, 0, 0, 0, 1, 1,
0.01884968, -0.712528, 3.658381, 0, 0, 0, 1, 1,
0.02021976, -0.4975336, 3.979685, 0, 0, 0, 1, 1,
0.02140651, -0.2273353, 2.42378, 0, 0, 0, 1, 1,
0.02162217, 0.1212581, 2.326286, 0, 0, 0, 1, 1,
0.02751642, 1.485786, 0.6759768, 0, 0, 0, 1, 1,
0.02796922, -0.7063351, 2.291914, 0, 0, 0, 1, 1,
0.03038001, -1.442569, 3.515692, 1, 1, 1, 1, 1,
0.03146666, -0.8559787, 1.918509, 1, 1, 1, 1, 1,
0.03533802, 0.2296277, 0.4369231, 1, 1, 1, 1, 1,
0.03859725, 0.1355032, 1.863626, 1, 1, 1, 1, 1,
0.03915656, 0.1263385, 1.10561, 1, 1, 1, 1, 1,
0.03983297, -0.5656264, 3.898946, 1, 1, 1, 1, 1,
0.03998632, 0.08734132, 0.6985034, 1, 1, 1, 1, 1,
0.04003081, 0.07676934, 1.147932, 1, 1, 1, 1, 1,
0.04360892, 0.03335286, 1.988787, 1, 1, 1, 1, 1,
0.04391921, 0.6451187, -0.5226385, 1, 1, 1, 1, 1,
0.04704756, 0.3630888, 0.06548235, 1, 1, 1, 1, 1,
0.05006299, -0.3696516, 3.062662, 1, 1, 1, 1, 1,
0.05665194, 0.008424762, 2.089794, 1, 1, 1, 1, 1,
0.05895721, 1.38931, -1.046083, 1, 1, 1, 1, 1,
0.06155552, -0.1768549, 2.752526, 1, 1, 1, 1, 1,
0.06328452, 0.3807165, -0.01894426, 0, 0, 1, 1, 1,
0.0650565, 0.04529915, 2.100275, 1, 0, 0, 1, 1,
0.07137754, -0.5845153, 3.888448, 1, 0, 0, 1, 1,
0.07264115, -0.1700411, 1.655297, 1, 0, 0, 1, 1,
0.0823354, 0.6375181, 0.8491574, 1, 0, 0, 1, 1,
0.08387659, 3.161662, 0.8626309, 1, 0, 0, 1, 1,
0.09313753, 0.5125508, -0.8752927, 0, 0, 0, 1, 1,
0.09857526, 0.3602065, -0.5021079, 0, 0, 0, 1, 1,
0.1017251, -0.07345624, 1.837087, 0, 0, 0, 1, 1,
0.1017689, -1.022181, 4.174266, 0, 0, 0, 1, 1,
0.1046678, 1.225916, 1.091765, 0, 0, 0, 1, 1,
0.1077783, -0.3517241, 2.40183, 0, 0, 0, 1, 1,
0.109874, 1.157328, -1.44822, 0, 0, 0, 1, 1,
0.1124201, 1.624394, -0.3147562, 1, 1, 1, 1, 1,
0.1163467, 0.8145501, -0.8088382, 1, 1, 1, 1, 1,
0.1197109, 0.7857373, 2.268569, 1, 1, 1, 1, 1,
0.1214819, 1.439245, -0.04046581, 1, 1, 1, 1, 1,
0.1269328, 0.5606364, 0.2807278, 1, 1, 1, 1, 1,
0.1358539, 0.9150587, -1.377217, 1, 1, 1, 1, 1,
0.1368477, 1.70557, -0.5591464, 1, 1, 1, 1, 1,
0.1400988, 0.8187946, 0.8374135, 1, 1, 1, 1, 1,
0.1411852, 1.528521, -0.03146588, 1, 1, 1, 1, 1,
0.1420428, -1.651185, 4.029361, 1, 1, 1, 1, 1,
0.1475028, 2.168704, -0.2564712, 1, 1, 1, 1, 1,
0.1483674, -1.832619, 3.596301, 1, 1, 1, 1, 1,
0.1492686, -0.4266942, 2.388095, 1, 1, 1, 1, 1,
0.1640042, -0.3376409, 2.905395, 1, 1, 1, 1, 1,
0.1655704, -0.6491867, 3.004306, 1, 1, 1, 1, 1,
0.1659701, 1.627684, 1.458975, 0, 0, 1, 1, 1,
0.1665306, 2.166183, 1.448527, 1, 0, 0, 1, 1,
0.1671447, -0.5468133, 2.133412, 1, 0, 0, 1, 1,
0.1682542, 1.559718, -0.2418734, 1, 0, 0, 1, 1,
0.1702969, -2.265951, 2.554529, 1, 0, 0, 1, 1,
0.1728665, 2.215923, -1.414524, 1, 0, 0, 1, 1,
0.1776463, 0.07332546, 0.6595445, 0, 0, 0, 1, 1,
0.1795662, -0.5613712, 2.966217, 0, 0, 0, 1, 1,
0.1813102, -1.144746, 4.50314, 0, 0, 0, 1, 1,
0.1817409, -1.010492, 4.324208, 0, 0, 0, 1, 1,
0.1826368, -0.4408928, 3.462688, 0, 0, 0, 1, 1,
0.1854397, -1.491281, 2.877773, 0, 0, 0, 1, 1,
0.1924567, -1.07214, 3.171957, 0, 0, 0, 1, 1,
0.1989871, 1.951766, 0.1474395, 1, 1, 1, 1, 1,
0.2021809, 1.320471, 1.004699, 1, 1, 1, 1, 1,
0.2028594, 1.329663, 0.5559996, 1, 1, 1, 1, 1,
0.2093414, -0.2269137, 1.685696, 1, 1, 1, 1, 1,
0.2097595, -0.9161778, 3.980114, 1, 1, 1, 1, 1,
0.2109887, 2.000277, 0.3037815, 1, 1, 1, 1, 1,
0.2149692, -0.2595155, 1.605668, 1, 1, 1, 1, 1,
0.2186226, -1.682549, 3.883739, 1, 1, 1, 1, 1,
0.2193355, -0.5462178, 2.987344, 1, 1, 1, 1, 1,
0.2226873, 0.7979503, 0.7082441, 1, 1, 1, 1, 1,
0.2246367, -0.1379277, 0.8352727, 1, 1, 1, 1, 1,
0.2277016, -0.6815293, 3.295746, 1, 1, 1, 1, 1,
0.2377276, -0.6854247, 0.3816088, 1, 1, 1, 1, 1,
0.239164, -0.3171892, 3.098526, 1, 1, 1, 1, 1,
0.241166, -2.062277, 3.151816, 1, 1, 1, 1, 1,
0.2419116, -0.6420212, 2.760152, 0, 0, 1, 1, 1,
0.2436494, 0.5568413, 0.6929911, 1, 0, 0, 1, 1,
0.244412, -1.228077, 2.595498, 1, 0, 0, 1, 1,
0.2586481, -1.089558, 3.530795, 1, 0, 0, 1, 1,
0.2595085, -1.521545, 1.470562, 1, 0, 0, 1, 1,
0.2636571, 0.1195097, 0.28228, 1, 0, 0, 1, 1,
0.2638371, -0.5220712, 1.361783, 0, 0, 0, 1, 1,
0.2650083, 1.285451, 0.4866536, 0, 0, 0, 1, 1,
0.2674296, 0.4951734, -0.02450153, 0, 0, 0, 1, 1,
0.2710088, -0.8456131, 3.535831, 0, 0, 0, 1, 1,
0.2713015, -0.6160904, 4.57964, 0, 0, 0, 1, 1,
0.2820469, -0.8560029, 2.675576, 0, 0, 0, 1, 1,
0.2851647, -0.276962, 0.9025537, 0, 0, 0, 1, 1,
0.2901203, 0.6255038, 1.375318, 1, 1, 1, 1, 1,
0.2941835, -1.893138, 3.854957, 1, 1, 1, 1, 1,
0.2957083, -0.03079394, 1.818682, 1, 1, 1, 1, 1,
0.3004644, -1.369735, 3.268909, 1, 1, 1, 1, 1,
0.3011023, 0.09459852, -0.4512909, 1, 1, 1, 1, 1,
0.3041746, 0.235637, -0.1206655, 1, 1, 1, 1, 1,
0.3100161, -0.1642348, 1.963564, 1, 1, 1, 1, 1,
0.3102998, 2.619506, 2.002145, 1, 1, 1, 1, 1,
0.3146461, -0.7860978, 4.163126, 1, 1, 1, 1, 1,
0.3166575, 0.07211439, 3.556433, 1, 1, 1, 1, 1,
0.3185561, -0.7965181, 2.497288, 1, 1, 1, 1, 1,
0.3191001, 0.3713146, -0.510632, 1, 1, 1, 1, 1,
0.3202614, 0.1239382, 1.02439, 1, 1, 1, 1, 1,
0.3209916, 1.396508, 0.5814366, 1, 1, 1, 1, 1,
0.3216404, 0.007037251, 2.113907, 1, 1, 1, 1, 1,
0.325057, 0.3243194, 1.885355, 0, 0, 1, 1, 1,
0.3267942, 1.4054, -0.4336174, 1, 0, 0, 1, 1,
0.3280448, -0.02184257, 2.089092, 1, 0, 0, 1, 1,
0.3289821, 0.1790095, 1.181609, 1, 0, 0, 1, 1,
0.3295454, -1.242603, 2.372804, 1, 0, 0, 1, 1,
0.32961, 0.5645565, 0.257457, 1, 0, 0, 1, 1,
0.3309866, -0.03542745, 1.720509, 0, 0, 0, 1, 1,
0.3337946, 2.162476, -0.5592048, 0, 0, 0, 1, 1,
0.3338858, 0.4833453, -0.2032041, 0, 0, 0, 1, 1,
0.3361528, 0.8554454, -2.021147, 0, 0, 0, 1, 1,
0.340908, 1.394286, 1.33832, 0, 0, 0, 1, 1,
0.3424697, -0.779015, 2.716161, 0, 0, 0, 1, 1,
0.3425024, -0.512374, 2.146184, 0, 0, 0, 1, 1,
0.3429269, -0.8575193, 2.31083, 1, 1, 1, 1, 1,
0.3453119, 1.368127, -0.03742946, 1, 1, 1, 1, 1,
0.3458061, -1.412762, 2.254735, 1, 1, 1, 1, 1,
0.3458262, -0.4384172, 3.409019, 1, 1, 1, 1, 1,
0.3470654, -0.01401532, 2.652904, 1, 1, 1, 1, 1,
0.3479343, -0.03193432, 2.168287, 1, 1, 1, 1, 1,
0.3499733, 1.403441, 1.677887, 1, 1, 1, 1, 1,
0.3505811, -1.216449, 3.428314, 1, 1, 1, 1, 1,
0.3542218, 0.3289068, -0.4647444, 1, 1, 1, 1, 1,
0.3569137, -0.3499488, 1.780542, 1, 1, 1, 1, 1,
0.3571521, 0.1628111, 2.336197, 1, 1, 1, 1, 1,
0.3572243, 0.02795168, 1.882361, 1, 1, 1, 1, 1,
0.3690427, 0.1624716, 0.5932013, 1, 1, 1, 1, 1,
0.3695757, -0.9418478, 1.49379, 1, 1, 1, 1, 1,
0.3723268, 0.1545159, 1.16662, 1, 1, 1, 1, 1,
0.3724298, -1.622767, 3.867772, 0, 0, 1, 1, 1,
0.3746013, 0.5430391, 1.095121, 1, 0, 0, 1, 1,
0.3767112, -0.5432854, 2.767464, 1, 0, 0, 1, 1,
0.3804076, -0.1578372, 1.798795, 1, 0, 0, 1, 1,
0.3831943, 1.784596, -0.973807, 1, 0, 0, 1, 1,
0.3834744, 0.3476305, 0.5822548, 1, 0, 0, 1, 1,
0.3876271, -0.6208147, 4.20524, 0, 0, 0, 1, 1,
0.3885715, 1.838143, 0.71339, 0, 0, 0, 1, 1,
0.3945836, -0.1835885, 1.119414, 0, 0, 0, 1, 1,
0.3948022, -0.5260456, 2.210333, 0, 0, 0, 1, 1,
0.3951829, 0.5525828, 1.805331, 0, 0, 0, 1, 1,
0.3952138, -0.4288695, 3.17371, 0, 0, 0, 1, 1,
0.3962803, 0.1374052, 0.2185754, 0, 0, 0, 1, 1,
0.3986468, 1.388323, -0.09082369, 1, 1, 1, 1, 1,
0.4069553, -0.02062714, 0.698455, 1, 1, 1, 1, 1,
0.4079921, 0.2364186, 1.095443, 1, 1, 1, 1, 1,
0.4102079, 0.1408485, 1.086605, 1, 1, 1, 1, 1,
0.4117462, 0.4092827, 0.1186345, 1, 1, 1, 1, 1,
0.4142799, 0.2419375, 3.161681, 1, 1, 1, 1, 1,
0.4150337, 1.289119, -0.3811888, 1, 1, 1, 1, 1,
0.4162178, -0.7967134, 3.416138, 1, 1, 1, 1, 1,
0.4231314, -0.6049753, 3.696974, 1, 1, 1, 1, 1,
0.4242468, -0.128275, 2.618283, 1, 1, 1, 1, 1,
0.4244985, -0.1627524, 3.12137, 1, 1, 1, 1, 1,
0.4274188, 2.11902, -0.5635111, 1, 1, 1, 1, 1,
0.4275985, 0.05790535, 0.6297304, 1, 1, 1, 1, 1,
0.4281345, -0.5825185, 2.008382, 1, 1, 1, 1, 1,
0.4287903, 1.799581, -1.862712, 1, 1, 1, 1, 1,
0.4297062, -0.3694698, 2.755961, 0, 0, 1, 1, 1,
0.4313148, 0.4035513, 1.044581, 1, 0, 0, 1, 1,
0.431792, 0.7864287, 1.517132, 1, 0, 0, 1, 1,
0.4326383, -1.696041, 1.884135, 1, 0, 0, 1, 1,
0.4333664, 0.5238128, 1.764356, 1, 0, 0, 1, 1,
0.4382704, 0.4960234, 0.2985649, 1, 0, 0, 1, 1,
0.4409048, -0.3967084, 3.330523, 0, 0, 0, 1, 1,
0.4431659, -0.0703791, 1.436179, 0, 0, 0, 1, 1,
0.4446609, 0.0437385, 0.2525266, 0, 0, 0, 1, 1,
0.4464995, 0.7581009, 0.5920233, 0, 0, 0, 1, 1,
0.4474511, -0.8479339, 2.37261, 0, 0, 0, 1, 1,
0.4538991, -0.1605454, 1.288744, 0, 0, 0, 1, 1,
0.455815, 1.049383, 0.5472793, 0, 0, 0, 1, 1,
0.4560585, -0.3565903, 1.977255, 1, 1, 1, 1, 1,
0.4575599, -0.4283928, 1.842842, 1, 1, 1, 1, 1,
0.4585923, 1.315837, -1.103085, 1, 1, 1, 1, 1,
0.4602248, -0.4467393, 2.366873, 1, 1, 1, 1, 1,
0.4621099, -1.452659, 3.537224, 1, 1, 1, 1, 1,
0.4635399, 1.511906, 1.950861, 1, 1, 1, 1, 1,
0.4645706, -0.6288431, 3.267183, 1, 1, 1, 1, 1,
0.4729949, 0.2911055, 1.549436, 1, 1, 1, 1, 1,
0.4749399, 0.1946602, -0.1612448, 1, 1, 1, 1, 1,
0.4782047, 1.075356, 0.5912616, 1, 1, 1, 1, 1,
0.4796488, -0.168968, 1.727353, 1, 1, 1, 1, 1,
0.4822918, -0.3339395, 3.433101, 1, 1, 1, 1, 1,
0.4849539, 0.1534103, 0.6181792, 1, 1, 1, 1, 1,
0.4852143, -0.3189657, 2.718159, 1, 1, 1, 1, 1,
0.4857565, -0.2021056, 1.815995, 1, 1, 1, 1, 1,
0.490344, 1.302601, 1.711524, 0, 0, 1, 1, 1,
0.4916815, 0.5840937, 0.6557215, 1, 0, 0, 1, 1,
0.4930888, 0.7860816, 3.205132, 1, 0, 0, 1, 1,
0.4981932, 0.8206665, 2.421705, 1, 0, 0, 1, 1,
0.4995818, -1.667156, 1.756989, 1, 0, 0, 1, 1,
0.5016677, -0.1955248, 2.584202, 1, 0, 0, 1, 1,
0.5041075, 0.43044, 2.362535, 0, 0, 0, 1, 1,
0.5095905, -0.6403663, 2.994644, 0, 0, 0, 1, 1,
0.5151643, 1.47622, -1.776903, 0, 0, 0, 1, 1,
0.5210108, 0.5601378, -0.3254194, 0, 0, 0, 1, 1,
0.5280874, -0.5786414, 2.081796, 0, 0, 0, 1, 1,
0.5399783, -1.544236, 3.374678, 0, 0, 0, 1, 1,
0.5411488, 0.4945716, -0.0206223, 0, 0, 0, 1, 1,
0.5448376, 0.05483625, 3.352217, 1, 1, 1, 1, 1,
0.5448936, 0.7878505, -0.3535176, 1, 1, 1, 1, 1,
0.5475897, 0.0261121, 1.648974, 1, 1, 1, 1, 1,
0.5538089, -0.7928619, 1.788747, 1, 1, 1, 1, 1,
0.5556055, 0.2906149, 1.157157, 1, 1, 1, 1, 1,
0.555654, 0.4844235, 0.2262266, 1, 1, 1, 1, 1,
0.555894, 0.5076676, 0.2352106, 1, 1, 1, 1, 1,
0.5575463, -1.355083, 2.840488, 1, 1, 1, 1, 1,
0.5580196, 0.9108108, 1.88654, 1, 1, 1, 1, 1,
0.558639, 1.934527, -0.4947082, 1, 1, 1, 1, 1,
0.5716783, 1.778238, 0.8194901, 1, 1, 1, 1, 1,
0.5717669, 1.054, -0.2487488, 1, 1, 1, 1, 1,
0.5722849, -1.400236, 2.127775, 1, 1, 1, 1, 1,
0.5725921, 0.05686572, 1.977632, 1, 1, 1, 1, 1,
0.5762984, 0.827538, 1.096019, 1, 1, 1, 1, 1,
0.5766301, 0.1165315, 1.925128, 0, 0, 1, 1, 1,
0.5770298, -0.8773775, 2.416924, 1, 0, 0, 1, 1,
0.5787849, -0.3563539, 0.6025239, 1, 0, 0, 1, 1,
0.5789575, -1.519457, 3.518554, 1, 0, 0, 1, 1,
0.5802923, 0.6230792, 1.260571, 1, 0, 0, 1, 1,
0.5867881, 0.2298937, 1.195919, 1, 0, 0, 1, 1,
0.5878676, 0.8466451, -0.3284289, 0, 0, 0, 1, 1,
0.5886082, -0.5004613, 3.236751, 0, 0, 0, 1, 1,
0.5927393, -1.706798, 1.323039, 0, 0, 0, 1, 1,
0.5984675, 0.7972515, -1.640847, 0, 0, 0, 1, 1,
0.6006771, 0.3930485, 2.16666, 0, 0, 0, 1, 1,
0.6068978, 0.6205662, 0.07395339, 0, 0, 0, 1, 1,
0.6094286, 0.3043206, 0.8034138, 0, 0, 0, 1, 1,
0.6102778, -0.3498795, 2.201303, 1, 1, 1, 1, 1,
0.6208656, -0.6941537, 3.278691, 1, 1, 1, 1, 1,
0.6229278, -1.110462, 2.347716, 1, 1, 1, 1, 1,
0.6232369, -1.6215, 3.042069, 1, 1, 1, 1, 1,
0.6240507, 0.08867823, 0.3451533, 1, 1, 1, 1, 1,
0.6257651, -0.3639791, 1.93354, 1, 1, 1, 1, 1,
0.6316373, -0.6443881, 4.156967, 1, 1, 1, 1, 1,
0.6334122, 0.9896515, 1.015338, 1, 1, 1, 1, 1,
0.6378589, 0.8786014, -0.6062609, 1, 1, 1, 1, 1,
0.6433727, 1.732388, 0.3427193, 1, 1, 1, 1, 1,
0.6454681, -0.6775308, 4.713424, 1, 1, 1, 1, 1,
0.6492184, -0.2760328, 1.314665, 1, 1, 1, 1, 1,
0.6547525, 0.6577926, 1.909645, 1, 1, 1, 1, 1,
0.6684058, -0.7845753, 4.478261, 1, 1, 1, 1, 1,
0.6687115, 0.7647417, 1.701109, 1, 1, 1, 1, 1,
0.6706852, 1.289602, -0.3172389, 0, 0, 1, 1, 1,
0.6715679, 0.06469093, 1.171175, 1, 0, 0, 1, 1,
0.6719288, 0.7536505, 1.464938, 1, 0, 0, 1, 1,
0.6723933, -0.3588076, 1.773412, 1, 0, 0, 1, 1,
0.6748976, 0.4209575, 0.3708073, 1, 0, 0, 1, 1,
0.6762628, 0.02283576, 3.130159, 1, 0, 0, 1, 1,
0.6771636, 1.619241, -0.2449657, 0, 0, 0, 1, 1,
0.6796492, 1.408945, 0.4834954, 0, 0, 0, 1, 1,
0.6836748, 0.4162638, 0.221622, 0, 0, 0, 1, 1,
0.6838455, 0.03797753, 2.313654, 0, 0, 0, 1, 1,
0.6859436, -1.914785, 0.1078894, 0, 0, 0, 1, 1,
0.6894403, -1.531892, 4.49462, 0, 0, 0, 1, 1,
0.6936982, -0.2664624, 2.379928, 0, 0, 0, 1, 1,
0.6939563, 1.716839, 0.8744202, 1, 1, 1, 1, 1,
0.6939698, 0.1260647, 1.453834, 1, 1, 1, 1, 1,
0.6994188, 0.1972019, 0.8241871, 1, 1, 1, 1, 1,
0.6998681, 1.84682, -1.411637, 1, 1, 1, 1, 1,
0.7102385, 1.246019, 1.265229, 1, 1, 1, 1, 1,
0.7109697, -0.6995256, 2.187605, 1, 1, 1, 1, 1,
0.7111878, -1.532655, 1.734718, 1, 1, 1, 1, 1,
0.712669, -0.1577555, 1.765227, 1, 1, 1, 1, 1,
0.7131855, -0.3835388, 1.312984, 1, 1, 1, 1, 1,
0.7144395, 0.9080509, 1.360818, 1, 1, 1, 1, 1,
0.7185418, -1.808672, 3.760194, 1, 1, 1, 1, 1,
0.7225802, -2.076564, 2.805538, 1, 1, 1, 1, 1,
0.7237161, -0.9696845, 1.989712, 1, 1, 1, 1, 1,
0.723975, 0.936234, 1.092413, 1, 1, 1, 1, 1,
0.732779, -0.7503069, 3.236944, 1, 1, 1, 1, 1,
0.7340676, 1.665445, 1.269873, 0, 0, 1, 1, 1,
0.7350729, 0.05001532, 3.164049, 1, 0, 0, 1, 1,
0.7361707, 1.190944, 0.6699149, 1, 0, 0, 1, 1,
0.7387163, 0.9066927, 0.3926, 1, 0, 0, 1, 1,
0.739642, 0.6504955, 1.13288, 1, 0, 0, 1, 1,
0.7423205, 1.890077, 0.5877738, 1, 0, 0, 1, 1,
0.7460716, -0.5586556, -0.3452557, 0, 0, 0, 1, 1,
0.758027, 1.796291, -0.4595886, 0, 0, 0, 1, 1,
0.7622797, 0.9807178, 0.5032142, 0, 0, 0, 1, 1,
0.7628383, -0.7837939, 1.486959, 0, 0, 0, 1, 1,
0.7634537, -0.7615902, 2.15196, 0, 0, 0, 1, 1,
0.7645115, 0.9620466, 0.02956208, 0, 0, 0, 1, 1,
0.7685562, -0.8700593, 1.881636, 0, 0, 0, 1, 1,
0.7714301, 0.07485181, 3.657148, 1, 1, 1, 1, 1,
0.7715818, -1.514151, 2.676363, 1, 1, 1, 1, 1,
0.7739328, 0.6439583, -0.5088929, 1, 1, 1, 1, 1,
0.7740617, 0.7397656, 0.6723511, 1, 1, 1, 1, 1,
0.7788365, 0.3781663, 1.469125, 1, 1, 1, 1, 1,
0.7888366, -0.4553334, 1.752579, 1, 1, 1, 1, 1,
0.7895935, 0.8533902, 0.9233028, 1, 1, 1, 1, 1,
0.7917284, -0.73586, 3.521462, 1, 1, 1, 1, 1,
0.7919214, -0.7306951, 0.8992604, 1, 1, 1, 1, 1,
0.7934271, 0.963726, -1.119512, 1, 1, 1, 1, 1,
0.7949429, 0.0007108458, 2.255754, 1, 1, 1, 1, 1,
0.801314, 0.1520057, 1.482837, 1, 1, 1, 1, 1,
0.8028103, -0.5562635, 3.140863, 1, 1, 1, 1, 1,
0.8038864, 1.6006, -1.135806, 1, 1, 1, 1, 1,
0.8039445, 0.07838539, -0.429669, 1, 1, 1, 1, 1,
0.8085669, -1.484432, 3.36984, 0, 0, 1, 1, 1,
0.8111714, -0.4972016, 3.142036, 1, 0, 0, 1, 1,
0.8119965, -0.9105461, 3.497412, 1, 0, 0, 1, 1,
0.8141347, 1.084319, 1.212942, 1, 0, 0, 1, 1,
0.8257908, 0.3166946, 2.248226, 1, 0, 0, 1, 1,
0.8305452, 1.013668, 0.5588844, 1, 0, 0, 1, 1,
0.8310567, -0.8681311, 1.117306, 0, 0, 0, 1, 1,
0.8314502, 0.1754844, 0.8398584, 0, 0, 0, 1, 1,
0.8382049, 1.027362, 0.4956326, 0, 0, 0, 1, 1,
0.8394207, 0.5592607, -0.06710768, 0, 0, 0, 1, 1,
0.8408458, -0.05838469, 0.6452453, 0, 0, 0, 1, 1,
0.8410577, 0.259046, 1.765469, 0, 0, 0, 1, 1,
0.8442236, 0.01409543, 1.757232, 0, 0, 0, 1, 1,
0.8469025, 0.7167767, 0.5783018, 1, 1, 1, 1, 1,
0.8474117, 2.510693, -0.161868, 1, 1, 1, 1, 1,
0.8516625, -1.558086, 1.780095, 1, 1, 1, 1, 1,
0.8647376, -1.626634, 2.792306, 1, 1, 1, 1, 1,
0.8681809, 0.6742538, 1.066347, 1, 1, 1, 1, 1,
0.8764648, -2.15739, 2.340676, 1, 1, 1, 1, 1,
0.8811916, -0.2579708, 0.8039815, 1, 1, 1, 1, 1,
0.8815595, -1.316859, 3.444756, 1, 1, 1, 1, 1,
0.8833596, 0.1787968, 0.9737173, 1, 1, 1, 1, 1,
0.886297, -0.4790464, 1.667821, 1, 1, 1, 1, 1,
0.8919659, 0.4800821, 2.106437, 1, 1, 1, 1, 1,
0.893179, 0.1638682, 2.42432, 1, 1, 1, 1, 1,
0.8939681, -0.1181336, 0.3652589, 1, 1, 1, 1, 1,
0.8976473, 0.0892764, 0.815528, 1, 1, 1, 1, 1,
0.8982393, -0.2853268, 0.5398844, 1, 1, 1, 1, 1,
0.9026433, 0.1508338, 1.256426, 0, 0, 1, 1, 1,
0.9045138, -1.687725, 2.113476, 1, 0, 0, 1, 1,
0.9050763, -1.547882, 1.85952, 1, 0, 0, 1, 1,
0.9052839, 0.3974207, 1.264335, 1, 0, 0, 1, 1,
0.910389, 0.741414, 2.8698, 1, 0, 0, 1, 1,
0.9122126, -2.2364, 1.550744, 1, 0, 0, 1, 1,
0.9143111, 0.7721575, 2.015884, 0, 0, 0, 1, 1,
0.9189181, -1.62332, 3.709819, 0, 0, 0, 1, 1,
0.9189454, -0.3632248, 1.883503, 0, 0, 0, 1, 1,
0.9211344, 0.3326168, -0.2134125, 0, 0, 0, 1, 1,
0.9233947, 0.5361043, 1.557061, 0, 0, 0, 1, 1,
0.92565, 0.6005954, 0.1028666, 0, 0, 0, 1, 1,
0.9350215, 1.365557, 0.3620794, 0, 0, 0, 1, 1,
0.9533353, 0.3422222, 0.5808567, 1, 1, 1, 1, 1,
0.9553459, -0.6658641, 2.786655, 1, 1, 1, 1, 1,
0.9603876, -1.181866, 0.7966623, 1, 1, 1, 1, 1,
0.9645131, 0.5281022, 0.543776, 1, 1, 1, 1, 1,
0.9658375, 0.3845016, 1.632855, 1, 1, 1, 1, 1,
0.9783418, 1.977926, 0.7128509, 1, 1, 1, 1, 1,
0.9820423, -0.9833084, 2.772632, 1, 1, 1, 1, 1,
0.9843145, 0.8018939, 0.8413042, 1, 1, 1, 1, 1,
0.9924418, -0.2878057, 1.5132, 1, 1, 1, 1, 1,
1.001653, 0.02417319, -0.6483112, 1, 1, 1, 1, 1,
1.007398, -0.01864425, 3.247919, 1, 1, 1, 1, 1,
1.011714, 0.2505089, 0.95917, 1, 1, 1, 1, 1,
1.015698, -1.5187, 2.036586, 1, 1, 1, 1, 1,
1.019755, 0.01722442, 1.716699, 1, 1, 1, 1, 1,
1.020971, -0.9951826, 2.911496, 1, 1, 1, 1, 1,
1.023986, -1.275718, 3.183033, 0, 0, 1, 1, 1,
1.025478, 1.545264, 1.491883, 1, 0, 0, 1, 1,
1.028541, 0.09227552, 0.4993961, 1, 0, 0, 1, 1,
1.035357, 0.625644, 1.655745, 1, 0, 0, 1, 1,
1.039209, 0.8812672, 1.200724, 1, 0, 0, 1, 1,
1.045659, -0.3460909, 2.680048, 1, 0, 0, 1, 1,
1.048126, 0.6143748, 1.6135, 0, 0, 0, 1, 1,
1.049802, -2.248721, 2.268518, 0, 0, 0, 1, 1,
1.049878, -0.6835536, 2.815034, 0, 0, 0, 1, 1,
1.060903, -0.132501, 0.150446, 0, 0, 0, 1, 1,
1.062875, -0.2102649, 1.730036, 0, 0, 0, 1, 1,
1.064088, -0.6975344, 2.125161, 0, 0, 0, 1, 1,
1.066992, 0.65797, 1.105697, 0, 0, 0, 1, 1,
1.071072, -0.2354784, 0.6206834, 1, 1, 1, 1, 1,
1.072473, 0.02007264, 2.24516, 1, 1, 1, 1, 1,
1.073264, 0.9489808, 1.517733, 1, 1, 1, 1, 1,
1.075498, 0.1577008, 3.541319, 1, 1, 1, 1, 1,
1.09296, 0.383887, 1.476277, 1, 1, 1, 1, 1,
1.104799, 0.2661805, -0.01939048, 1, 1, 1, 1, 1,
1.111697, -0.005995221, 1.943105, 1, 1, 1, 1, 1,
1.120394, -1.615567, 3.297646, 1, 1, 1, 1, 1,
1.123532, 0.4045112, 2.984418, 1, 1, 1, 1, 1,
1.125735, -1.835472, 1.687151, 1, 1, 1, 1, 1,
1.12575, 1.246059, 0.8419196, 1, 1, 1, 1, 1,
1.14011, 0.8807548, 1.90976, 1, 1, 1, 1, 1,
1.144107, -0.6137655, 3.516095, 1, 1, 1, 1, 1,
1.144983, 2.213069, 1.946368, 1, 1, 1, 1, 1,
1.147246, 0.2657425, 2.485735, 1, 1, 1, 1, 1,
1.149537, 0.2264394, 1.695214, 0, 0, 1, 1, 1,
1.152434, 0.8595512, 0.4098192, 1, 0, 0, 1, 1,
1.16925, 2.320511, 0.4549891, 1, 0, 0, 1, 1,
1.172485, -1.238772, 2.815736, 1, 0, 0, 1, 1,
1.17281, 0.766138, 1.327263, 1, 0, 0, 1, 1,
1.177484, 1.052123, -0.2363506, 1, 0, 0, 1, 1,
1.179715, 1.285656, 0.9329329, 0, 0, 0, 1, 1,
1.190775, -2.842977, 3.96069, 0, 0, 0, 1, 1,
1.19151, 2.092023, 1.801191, 0, 0, 0, 1, 1,
1.198136, 0.02965181, 0.3955235, 0, 0, 0, 1, 1,
1.20541, -0.07879981, 0.9073082, 0, 0, 0, 1, 1,
1.209535, -1.864331, 2.630107, 0, 0, 0, 1, 1,
1.217406, 0.7087058, 0.1944929, 0, 0, 0, 1, 1,
1.219174, -0.8377919, 3.19359, 1, 1, 1, 1, 1,
1.229623, -0.05573923, 1.948172, 1, 1, 1, 1, 1,
1.233727, 0.3703854, 0.7688929, 1, 1, 1, 1, 1,
1.260489, 0.341835, 0.7520375, 1, 1, 1, 1, 1,
1.262517, -0.02752475, 2.022624, 1, 1, 1, 1, 1,
1.268434, 1.282483, 1.683908, 1, 1, 1, 1, 1,
1.269508, 0.4837388, 1.699648, 1, 1, 1, 1, 1,
1.280902, 1.126679, 0.1997948, 1, 1, 1, 1, 1,
1.281551, -0.7285618, 2.150964, 1, 1, 1, 1, 1,
1.294201, 0.4831735, 1.183464, 1, 1, 1, 1, 1,
1.295635, 0.1246369, 4.281742, 1, 1, 1, 1, 1,
1.29936, -0.1863814, 2.468715, 1, 1, 1, 1, 1,
1.310591, 1.533605, -0.1748504, 1, 1, 1, 1, 1,
1.311106, -0.4980896, 1.232467, 1, 1, 1, 1, 1,
1.323045, 0.1057473, 0.6003799, 1, 1, 1, 1, 1,
1.327547, -1.629296, 1.852162, 0, 0, 1, 1, 1,
1.330678, -1.217226, 0.8239821, 1, 0, 0, 1, 1,
1.3383, 1.023833, 0.2866226, 1, 0, 0, 1, 1,
1.341274, 0.5386931, 2.337449, 1, 0, 0, 1, 1,
1.342966, -0.6299188, 3.663684, 1, 0, 0, 1, 1,
1.347328, -0.67788, 1.919152, 1, 0, 0, 1, 1,
1.352091, 0.7716174, 0.184486, 0, 0, 0, 1, 1,
1.353301, -0.7175545, 1.645196, 0, 0, 0, 1, 1,
1.35531, -0.1814561, 3.344442, 0, 0, 0, 1, 1,
1.385918, 0.5181083, 0.9970913, 0, 0, 0, 1, 1,
1.388369, -1.213784, 2.953492, 0, 0, 0, 1, 1,
1.399849, 0.2959122, -0.4996792, 0, 0, 0, 1, 1,
1.412281, -0.1658129, 3.759211, 0, 0, 0, 1, 1,
1.42257, -0.3001007, 1.628175, 1, 1, 1, 1, 1,
1.467527, 0.7925571, 1.174309, 1, 1, 1, 1, 1,
1.468347, -0.0516071, 1.171295, 1, 1, 1, 1, 1,
1.471365, -0.01097135, 1.734175, 1, 1, 1, 1, 1,
1.480532, 1.058668, 2.778435, 1, 1, 1, 1, 1,
1.490223, 0.8131017, -0.1306593, 1, 1, 1, 1, 1,
1.492853, 3.302542, 0.6096306, 1, 1, 1, 1, 1,
1.496988, -1.340433, 1.989904, 1, 1, 1, 1, 1,
1.499401, 0.3647803, 0.128137, 1, 1, 1, 1, 1,
1.505478, -0.5061278, 1.975083, 1, 1, 1, 1, 1,
1.507943, 1.093395, 1.11317, 1, 1, 1, 1, 1,
1.508847, 1.033289, 1.166573, 1, 1, 1, 1, 1,
1.511323, -0.8083668, -0.2071896, 1, 1, 1, 1, 1,
1.511326, -1.26278, 1.114072, 1, 1, 1, 1, 1,
1.511833, 0.5357966, 1.350565, 1, 1, 1, 1, 1,
1.529791, 0.6819779, 1.50258, 0, 0, 1, 1, 1,
1.535228, -0.4721518, 2.158441, 1, 0, 0, 1, 1,
1.535994, -0.62093, 2.578114, 1, 0, 0, 1, 1,
1.546303, 0.7351252, 1.886571, 1, 0, 0, 1, 1,
1.548281, -0.6148416, 1.89366, 1, 0, 0, 1, 1,
1.555497, -0.3884281, 2.976201, 1, 0, 0, 1, 1,
1.561226, 0.356319, 0.6296015, 0, 0, 0, 1, 1,
1.563699, -0.5898012, 1.710671, 0, 0, 0, 1, 1,
1.564607, 1.095929, -0.4416965, 0, 0, 0, 1, 1,
1.575532, 1.345874, 0.6331875, 0, 0, 0, 1, 1,
1.590331, -0.6119061, 1.045131, 0, 0, 0, 1, 1,
1.619031, -0.3678706, 1.381109, 0, 0, 0, 1, 1,
1.61993, 0.2886966, 0.5978636, 0, 0, 0, 1, 1,
1.622323, -0.7210611, 1.107751, 1, 1, 1, 1, 1,
1.631855, 0.1882669, 0.4642573, 1, 1, 1, 1, 1,
1.639441, -0.1768322, 2.25122, 1, 1, 1, 1, 1,
1.641751, 0.8163285, 0.6697131, 1, 1, 1, 1, 1,
1.642801, -0.06442054, -1.031546, 1, 1, 1, 1, 1,
1.647438, -0.9983224, 3.159579, 1, 1, 1, 1, 1,
1.656986, 0.4793227, 1.024111, 1, 1, 1, 1, 1,
1.669236, 0.598749, 1.542842, 1, 1, 1, 1, 1,
1.675521, 1.445445, 2.910601, 1, 1, 1, 1, 1,
1.675632, 0.7954509, 2.608747, 1, 1, 1, 1, 1,
1.678087, -1.862193, 4.655876, 1, 1, 1, 1, 1,
1.696287, 0.4980756, 2.070612, 1, 1, 1, 1, 1,
1.708079, -0.3254136, 3.085529, 1, 1, 1, 1, 1,
1.709327, -0.5415045, 1.221431, 1, 1, 1, 1, 1,
1.71561, -0.6568756, 2.765091, 1, 1, 1, 1, 1,
1.719444, -0.4495345, 1.060148, 0, 0, 1, 1, 1,
1.728748, 0.4973878, 0.8955731, 1, 0, 0, 1, 1,
1.73376, -0.5425502, 2.75401, 1, 0, 0, 1, 1,
1.735123, 0.3292921, 0.1000916, 1, 0, 0, 1, 1,
1.73817, -0.3578462, 1.935706, 1, 0, 0, 1, 1,
1.745384, -0.04393216, 1.809219, 1, 0, 0, 1, 1,
1.754953, 0.1043591, 2.776632, 0, 0, 0, 1, 1,
1.763062, -1.332478, 2.526155, 0, 0, 0, 1, 1,
1.797254, 1.522769, 0.6923854, 0, 0, 0, 1, 1,
1.797473, -1.074506, 1.793079, 0, 0, 0, 1, 1,
1.823402, 0.637471, 1.182588, 0, 0, 0, 1, 1,
1.848441, -0.4347431, 1.825127, 0, 0, 0, 1, 1,
1.870396, 0.7559572, 0.7963258, 0, 0, 0, 1, 1,
1.883264, 0.1333825, 0.6221712, 1, 1, 1, 1, 1,
1.921083, 0.2211225, 1.998532, 1, 1, 1, 1, 1,
1.936276, 0.02996235, 2.320361, 1, 1, 1, 1, 1,
1.948774, -1.484896, 2.005481, 1, 1, 1, 1, 1,
1.957526, -0.9750215, 0.9677132, 1, 1, 1, 1, 1,
1.963303, -2.148218, 4.370211, 1, 1, 1, 1, 1,
1.964408, 0.4081781, 1.907744, 1, 1, 1, 1, 1,
1.983892, 0.652023, 1.181785, 1, 1, 1, 1, 1,
1.988516, 0.0731632, -0.361809, 1, 1, 1, 1, 1,
2.006472, 0.2912494, 1.907496, 1, 1, 1, 1, 1,
2.015625, -2.017693, 2.442268, 1, 1, 1, 1, 1,
2.030014, 1.717131, 2.755189, 1, 1, 1, 1, 1,
2.030636, -2.133786, 1.2228, 1, 1, 1, 1, 1,
2.057497, 1.813834, 1.384236, 1, 1, 1, 1, 1,
2.061267, 2.244231, 0.0828053, 1, 1, 1, 1, 1,
2.069887, 0.4737476, 0.4066219, 0, 0, 1, 1, 1,
2.087645, 0.4523799, 2.186255, 1, 0, 0, 1, 1,
2.096086, 0.4610588, 1.309796, 1, 0, 0, 1, 1,
2.118567, 1.512284, 0.2489327, 1, 0, 0, 1, 1,
2.124545, -1.150634, 0.4327018, 1, 0, 0, 1, 1,
2.127712, -0.08769991, 2.486097, 1, 0, 0, 1, 1,
2.150464, 1.096082, 0.5743669, 0, 0, 0, 1, 1,
2.187341, -0.6616219, 1.695713, 0, 0, 0, 1, 1,
2.204461, 0.8910593, -0.01310092, 0, 0, 0, 1, 1,
2.229549, -0.5428563, 1.674375, 0, 0, 0, 1, 1,
2.268247, 1.95612, -0.1832882, 0, 0, 0, 1, 1,
2.300291, -0.3767109, 1.572387, 0, 0, 0, 1, 1,
2.346414, 0.5265519, 0.9806116, 0, 0, 0, 1, 1,
2.454573, -0.3046957, 0.6064131, 1, 1, 1, 1, 1,
2.463953, 0.06288702, 0.7008299, 1, 1, 1, 1, 1,
2.55182, -1.893886, 2.025965, 1, 1, 1, 1, 1,
2.662458, -0.01012488, 0.8688184, 1, 1, 1, 1, 1,
2.776921, 1.836404, 0.296519, 1, 1, 1, 1, 1,
3.288489, -0.666952, 2.096838, 1, 1, 1, 1, 1,
3.697807, 0.6659502, 0.8509966, 1, 1, 1, 1, 1
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
var radius = 9.597828;
var distance = 33.71196;
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
mvMatrix.translate( -0.2967186, -0.1613886, 0.4027426 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.71196);
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
