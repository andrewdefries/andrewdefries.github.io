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
-2.964947, -0.9384111, -2.467625, 1, 0, 0, 1,
-2.66529, -1.488715, -1.974398, 1, 0.007843138, 0, 1,
-2.64777, -0.3975494, -2.764534, 1, 0.01176471, 0, 1,
-2.585211, 0.758637, -1.520047, 1, 0.01960784, 0, 1,
-2.572244, 0.5047551, -2.063303, 1, 0.02352941, 0, 1,
-2.566509, 1.512928, -1.471395, 1, 0.03137255, 0, 1,
-2.554891, 1.600996, -0.9748901, 1, 0.03529412, 0, 1,
-2.553176, -1.592576, -2.729599, 1, 0.04313726, 0, 1,
-2.543821, 0.5565634, -1.091634, 1, 0.04705882, 0, 1,
-2.420095, -0.4572815, -3.355753, 1, 0.05490196, 0, 1,
-2.371835, 0.2035924, -1.864635, 1, 0.05882353, 0, 1,
-2.344048, -0.2991399, -1.378353, 1, 0.06666667, 0, 1,
-2.317183, -0.1814435, -1.347569, 1, 0.07058824, 0, 1,
-2.29385, 0.5862851, -2.806768, 1, 0.07843138, 0, 1,
-2.260131, 0.3605041, -2.176909, 1, 0.08235294, 0, 1,
-2.213997, 0.8601333, 0.268608, 1, 0.09019608, 0, 1,
-2.133754, -1.281749, 0.04772304, 1, 0.09411765, 0, 1,
-2.121058, -0.6097305, -1.424613, 1, 0.1019608, 0, 1,
-2.089129, -1.070895, 0.1932324, 1, 0.1098039, 0, 1,
-2.071829, -2.458255, -1.989458, 1, 0.1137255, 0, 1,
-2.056723, 0.3315829, -1.478135, 1, 0.1215686, 0, 1,
-2.055984, 3.39379, -0.08505931, 1, 0.1254902, 0, 1,
-2.049973, -0.6731105, -3.540498, 1, 0.1333333, 0, 1,
-2.042227, 0.7626259, -0.2852729, 1, 0.1372549, 0, 1,
-2.018182, -0.2836239, -2.611704, 1, 0.145098, 0, 1,
-2.015127, -0.6850752, -3.199542, 1, 0.1490196, 0, 1,
-2.003768, -1.664472, -2.223686, 1, 0.1568628, 0, 1,
-1.99213, -0.01643668, -2.647579, 1, 0.1607843, 0, 1,
-1.97529, 1.506202, 0.5755019, 1, 0.1686275, 0, 1,
-1.966756, -0.1114662, -3.352107, 1, 0.172549, 0, 1,
-1.95889, 1.02946, -0.1822351, 1, 0.1803922, 0, 1,
-1.957308, -1.050106, -0.9571705, 1, 0.1843137, 0, 1,
-1.938919, 0.988851, -1.643052, 1, 0.1921569, 0, 1,
-1.905272, -0.8269697, -2.760721, 1, 0.1960784, 0, 1,
-1.889976, 1.436661, -3.38043, 1, 0.2039216, 0, 1,
-1.88613, -1.751, -1.479823, 1, 0.2117647, 0, 1,
-1.884724, 2.28317, 0.2971985, 1, 0.2156863, 0, 1,
-1.874688, -0.5434653, -3.140913, 1, 0.2235294, 0, 1,
-1.858229, 0.9450169, 1.249292, 1, 0.227451, 0, 1,
-1.849369, -1.030817, -5.334693, 1, 0.2352941, 0, 1,
-1.840668, 0.7045721, -1.131106, 1, 0.2392157, 0, 1,
-1.822841, 0.2687768, -1.978094, 1, 0.2470588, 0, 1,
-1.822177, 1.357134, -1.454814, 1, 0.2509804, 0, 1,
-1.81807, -2.035471, -2.135046, 1, 0.2588235, 0, 1,
-1.813405, 1.750418, -1.382504, 1, 0.2627451, 0, 1,
-1.809602, 0.3541376, -1.938053, 1, 0.2705882, 0, 1,
-1.805241, -0.2074887, -0.5974976, 1, 0.2745098, 0, 1,
-1.802278, -0.6611183, -2.380835, 1, 0.282353, 0, 1,
-1.798462, -0.2854078, -2.367999, 1, 0.2862745, 0, 1,
-1.788614, -0.5575168, -2.203771, 1, 0.2941177, 0, 1,
-1.772817, -0.4998221, 0.5889845, 1, 0.3019608, 0, 1,
-1.754724, 0.0505033, -2.696827, 1, 0.3058824, 0, 1,
-1.749156, -1.192858, -2.752582, 1, 0.3137255, 0, 1,
-1.733, -0.5337884, -1.340315, 1, 0.3176471, 0, 1,
-1.726598, 0.1801838, -1.620834, 1, 0.3254902, 0, 1,
-1.716753, 0.2319084, -1.621629, 1, 0.3294118, 0, 1,
-1.685087, 0.2492553, -3.680885, 1, 0.3372549, 0, 1,
-1.679782, -0.9792932, -0.9188927, 1, 0.3411765, 0, 1,
-1.677481, -0.1281878, -2.291509, 1, 0.3490196, 0, 1,
-1.650672, -0.741325, -2.389858, 1, 0.3529412, 0, 1,
-1.647182, -0.276749, -1.031312, 1, 0.3607843, 0, 1,
-1.640916, 0.7362887, -0.1134223, 1, 0.3647059, 0, 1,
-1.629331, -1.138864, -0.9226635, 1, 0.372549, 0, 1,
-1.60749, 0.4360876, -0.4633908, 1, 0.3764706, 0, 1,
-1.597696, 1.452344, -2.992236, 1, 0.3843137, 0, 1,
-1.597558, 0.357421, -2.494662, 1, 0.3882353, 0, 1,
-1.591917, 0.6931366, -1.746438, 1, 0.3960784, 0, 1,
-1.58128, -0.3221093, -0.5853775, 1, 0.4039216, 0, 1,
-1.566589, -0.8304672, -1.385415, 1, 0.4078431, 0, 1,
-1.562459, 1.194176, -2.708502, 1, 0.4156863, 0, 1,
-1.558212, 0.4519447, -0.5328199, 1, 0.4196078, 0, 1,
-1.551466, -1.686062, -3.008717, 1, 0.427451, 0, 1,
-1.549199, -0.02424283, -1.165816, 1, 0.4313726, 0, 1,
-1.547845, 1.844569, -0.8551947, 1, 0.4392157, 0, 1,
-1.535689, -1.537317, -3.994507, 1, 0.4431373, 0, 1,
-1.525688, 0.9211555, -1.953744, 1, 0.4509804, 0, 1,
-1.507899, -0.7089666, -1.289059, 1, 0.454902, 0, 1,
-1.505675, -1.268672, -2.747107, 1, 0.4627451, 0, 1,
-1.503408, -1.082606, -2.190174, 1, 0.4666667, 0, 1,
-1.49969, -0.8816987, -1.869969, 1, 0.4745098, 0, 1,
-1.498493, 0.388126, -0.6725174, 1, 0.4784314, 0, 1,
-1.497629, 0.04638955, -0.6119569, 1, 0.4862745, 0, 1,
-1.488512, -1.205911, -2.642249, 1, 0.4901961, 0, 1,
-1.48512, 0.4290945, -0.4280179, 1, 0.4980392, 0, 1,
-1.471647, -0.7425126, -0.2751273, 1, 0.5058824, 0, 1,
-1.464166, 1.063616, -1.585014, 1, 0.509804, 0, 1,
-1.453087, -0.2306281, -1.846623, 1, 0.5176471, 0, 1,
-1.435777, -1.068725, -2.48469, 1, 0.5215687, 0, 1,
-1.433226, 0.2172696, -0.1258049, 1, 0.5294118, 0, 1,
-1.430183, -0.1885109, -0.9676584, 1, 0.5333334, 0, 1,
-1.415772, 0.721919, -0.001025822, 1, 0.5411765, 0, 1,
-1.415694, 0.3856312, -1.032762, 1, 0.5450981, 0, 1,
-1.415691, 1.299331, -0.7875548, 1, 0.5529412, 0, 1,
-1.410718, 0.6728866, 0.4591861, 1, 0.5568628, 0, 1,
-1.405559, -2.084269, -1.756026, 1, 0.5647059, 0, 1,
-1.398426, -1.114691, -2.730921, 1, 0.5686275, 0, 1,
-1.392423, 0.3384981, -0.2282146, 1, 0.5764706, 0, 1,
-1.391756, 2.444921, -0.1213362, 1, 0.5803922, 0, 1,
-1.37919, 0.4567417, -3.158136, 1, 0.5882353, 0, 1,
-1.377828, 0.7997638, -1.713925, 1, 0.5921569, 0, 1,
-1.37756, 1.3811, -1.979108, 1, 0.6, 0, 1,
-1.368313, 0.3799632, -2.123863, 1, 0.6078432, 0, 1,
-1.357685, 0.706914, -1.209523, 1, 0.6117647, 0, 1,
-1.350169, -0.1014625, -2.802131, 1, 0.6196079, 0, 1,
-1.330102, 0.2823653, -1.746952, 1, 0.6235294, 0, 1,
-1.329939, -2.504369, -3.147248, 1, 0.6313726, 0, 1,
-1.317244, -0.02740052, -2.684192, 1, 0.6352941, 0, 1,
-1.317107, 1.023168, -2.317967, 1, 0.6431373, 0, 1,
-1.310664, -2.54494, -0.5834308, 1, 0.6470588, 0, 1,
-1.287235, -1.749817, -2.557507, 1, 0.654902, 0, 1,
-1.282101, -2.392635, -3.75741, 1, 0.6588235, 0, 1,
-1.273909, 0.32022, -0.398903, 1, 0.6666667, 0, 1,
-1.269277, 1.307024, -0.7479025, 1, 0.6705883, 0, 1,
-1.264241, -0.6197363, -0.3049647, 1, 0.6784314, 0, 1,
-1.26197, -0.3495923, -2.661835, 1, 0.682353, 0, 1,
-1.255394, -0.6824242, -4.364404, 1, 0.6901961, 0, 1,
-1.250966, 0.4462529, -1.345075, 1, 0.6941177, 0, 1,
-1.245922, -0.5686582, -2.040797, 1, 0.7019608, 0, 1,
-1.243433, -0.7956802, -2.46062, 1, 0.7098039, 0, 1,
-1.225305, -1.390532, -2.623369, 1, 0.7137255, 0, 1,
-1.222413, -1.015867, -1.616678, 1, 0.7215686, 0, 1,
-1.200786, 0.5228897, -3.07007, 1, 0.7254902, 0, 1,
-1.195768, 0.7809836, -1.946593, 1, 0.7333333, 0, 1,
-1.195382, 0.1618336, -2.36346, 1, 0.7372549, 0, 1,
-1.193427, -0.9870492, -1.617471, 1, 0.7450981, 0, 1,
-1.188913, 0.7132322, -1.019635, 1, 0.7490196, 0, 1,
-1.187972, 1.671578, -0.9464137, 1, 0.7568628, 0, 1,
-1.184332, -0.5456412, -2.625091, 1, 0.7607843, 0, 1,
-1.180789, 0.7708262, -2.466014, 1, 0.7686275, 0, 1,
-1.175276, -0.6030247, -0.8659487, 1, 0.772549, 0, 1,
-1.172402, -0.837223, -1.792181, 1, 0.7803922, 0, 1,
-1.159018, -0.1417666, -2.152425, 1, 0.7843137, 0, 1,
-1.157833, -0.2355301, -2.089754, 1, 0.7921569, 0, 1,
-1.149568, -0.09940185, -1.228701, 1, 0.7960784, 0, 1,
-1.149137, -0.2406588, -2.809531, 1, 0.8039216, 0, 1,
-1.148398, 0.6274649, -0.1262955, 1, 0.8117647, 0, 1,
-1.140089, -1.12732, -2.881413, 1, 0.8156863, 0, 1,
-1.13925, 1.04416, -2.727169, 1, 0.8235294, 0, 1,
-1.135535, 0.006193244, -1.397719, 1, 0.827451, 0, 1,
-1.129138, 1.082785, -0.5299031, 1, 0.8352941, 0, 1,
-1.126305, 0.4351605, -1.099841, 1, 0.8392157, 0, 1,
-1.122975, 0.4254388, -1.276611, 1, 0.8470588, 0, 1,
-1.1198, 0.6480829, -1.217054, 1, 0.8509804, 0, 1,
-1.118631, 0.1031832, -1.502893, 1, 0.8588235, 0, 1,
-1.112623, -0.09895279, -1.603052, 1, 0.8627451, 0, 1,
-1.106355, 0.3871476, 1.347624, 1, 0.8705882, 0, 1,
-1.100732, 1.072254, -1.590534, 1, 0.8745098, 0, 1,
-1.097058, 0.8156196, -1.796877, 1, 0.8823529, 0, 1,
-1.09647, 0.8304868, 0.08965702, 1, 0.8862745, 0, 1,
-1.095675, 0.4116746, -1.243688, 1, 0.8941177, 0, 1,
-1.090726, 1.449004, 1.0253, 1, 0.8980392, 0, 1,
-1.088433, -1.091682, -1.747102, 1, 0.9058824, 0, 1,
-1.08533, 1.937846, -0.05126987, 1, 0.9137255, 0, 1,
-1.070301, 0.8400923, 0.2704146, 1, 0.9176471, 0, 1,
-1.067505, 0.189459, -1.665873, 1, 0.9254902, 0, 1,
-1.065504, -0.5669876, -2.304478, 1, 0.9294118, 0, 1,
-1.059472, 0.2255509, -0.9415218, 1, 0.9372549, 0, 1,
-1.05479, -0.7539451, -0.8598328, 1, 0.9411765, 0, 1,
-1.054042, 0.6321542, -1.844989, 1, 0.9490196, 0, 1,
-1.052599, 0.8052106, -1.589841, 1, 0.9529412, 0, 1,
-1.04819, -0.2727815, -1.580409, 1, 0.9607843, 0, 1,
-1.04134, 0.8357747, 0.6901122, 1, 0.9647059, 0, 1,
-1.038224, -0.6583735, -2.040717, 1, 0.972549, 0, 1,
-1.031039, 0.4326587, -1.353186, 1, 0.9764706, 0, 1,
-1.02625, -2.452295, -3.301055, 1, 0.9843137, 0, 1,
-1.023732, 0.07149341, -2.023621, 1, 0.9882353, 0, 1,
-1.02319, 1.232424, 0.6805432, 1, 0.9960784, 0, 1,
-1.019787, 1.159886, -1.325328, 0.9960784, 1, 0, 1,
-1.01937, 1.334902, -0.459041, 0.9921569, 1, 0, 1,
-1.006968, 0.2961406, -2.069221, 0.9843137, 1, 0, 1,
-1.006691, -0.4493428, -2.860933, 0.9803922, 1, 0, 1,
-1.002518, -1.084102, -2.74013, 0.972549, 1, 0, 1,
-1.001407, -0.2836225, -1.81206, 0.9686275, 1, 0, 1,
-0.9975827, 0.9449965, -0.05648394, 0.9607843, 1, 0, 1,
-0.9940177, 1.787983, -2.04944, 0.9568627, 1, 0, 1,
-0.9930872, 0.2611328, 0.493554, 0.9490196, 1, 0, 1,
-0.9927675, 0.3645723, -1.046058, 0.945098, 1, 0, 1,
-0.9911374, -0.839784, -2.548833, 0.9372549, 1, 0, 1,
-0.9805203, 0.6510434, -2.63119, 0.9333333, 1, 0, 1,
-0.9798292, -0.1027665, -1.877512, 0.9254902, 1, 0, 1,
-0.9685289, -0.4992176, -1.130215, 0.9215686, 1, 0, 1,
-0.9672078, 0.4252429, -1.779698, 0.9137255, 1, 0, 1,
-0.9667678, -1.069735, -2.507495, 0.9098039, 1, 0, 1,
-0.9620742, 0.3964764, -1.649794, 0.9019608, 1, 0, 1,
-0.9566172, -1.962275, -3.158745, 0.8941177, 1, 0, 1,
-0.9516783, 0.1164354, -1.443055, 0.8901961, 1, 0, 1,
-0.9504231, 1.039395, -2.056963, 0.8823529, 1, 0, 1,
-0.941641, -1.264256, -2.398087, 0.8784314, 1, 0, 1,
-0.9409279, 1.0571, -0.4777427, 0.8705882, 1, 0, 1,
-0.9387105, 1.320907, -0.3108871, 0.8666667, 1, 0, 1,
-0.9377595, 0.7947691, -1.389973, 0.8588235, 1, 0, 1,
-0.9252396, -0.183146, -1.663562, 0.854902, 1, 0, 1,
-0.9210302, 0.07028027, -0.3131908, 0.8470588, 1, 0, 1,
-0.9197568, -1.556548, -4.510332, 0.8431373, 1, 0, 1,
-0.919217, 0.7255437, -0.6489161, 0.8352941, 1, 0, 1,
-0.9155437, 0.07934494, -1.111382, 0.8313726, 1, 0, 1,
-0.915436, 0.5863295, -2.305704, 0.8235294, 1, 0, 1,
-0.9072479, -0.3598239, -0.04711039, 0.8196079, 1, 0, 1,
-0.902073, 0.5678306, -1.054596, 0.8117647, 1, 0, 1,
-0.8936272, -0.8346716, -1.075333, 0.8078431, 1, 0, 1,
-0.8927574, 0.3892869, -1.014712, 0.8, 1, 0, 1,
-0.8898295, 0.9276349, -1.26096, 0.7921569, 1, 0, 1,
-0.8867598, 1.579389, -0.1651665, 0.7882353, 1, 0, 1,
-0.8784491, 1.255464, -0.04491763, 0.7803922, 1, 0, 1,
-0.8714046, -0.5179071, -2.524269, 0.7764706, 1, 0, 1,
-0.8599491, -0.2311365, -1.345288, 0.7686275, 1, 0, 1,
-0.8597925, -0.8187437, -1.888239, 0.7647059, 1, 0, 1,
-0.8590524, -1.487235, -4.33037, 0.7568628, 1, 0, 1,
-0.8530689, 0.7912875, 0.544414, 0.7529412, 1, 0, 1,
-0.8504487, 1.748478, 0.2084668, 0.7450981, 1, 0, 1,
-0.8498356, -0.6588668, -2.784671, 0.7411765, 1, 0, 1,
-0.8487323, 0.2110062, 0.09625469, 0.7333333, 1, 0, 1,
-0.8484888, -0.9705084, -2.343157, 0.7294118, 1, 0, 1,
-0.8464331, -0.191177, -0.4474966, 0.7215686, 1, 0, 1,
-0.8453848, -0.6464381, -0.7160592, 0.7176471, 1, 0, 1,
-0.8445058, 0.3646763, -1.238466, 0.7098039, 1, 0, 1,
-0.8443041, -0.5871039, -2.390691, 0.7058824, 1, 0, 1,
-0.8419479, 0.9777682, -1.536074, 0.6980392, 1, 0, 1,
-0.8365547, -2.052398, -4.525016, 0.6901961, 1, 0, 1,
-0.8349048, 1.232223, -0.3432916, 0.6862745, 1, 0, 1,
-0.8325439, -0.7875199, -2.79007, 0.6784314, 1, 0, 1,
-0.827147, -0.02919944, -1.140366, 0.6745098, 1, 0, 1,
-0.822331, -0.07407071, -1.032298, 0.6666667, 1, 0, 1,
-0.8215575, 0.2969614, -0.7372928, 0.6627451, 1, 0, 1,
-0.818031, -0.8835059, -2.260609, 0.654902, 1, 0, 1,
-0.8160562, -1.023428, -1.576929, 0.6509804, 1, 0, 1,
-0.8143952, 0.170737, -1.861454, 0.6431373, 1, 0, 1,
-0.8051766, -0.8881589, -2.418817, 0.6392157, 1, 0, 1,
-0.8029881, 0.08840232, -2.716516, 0.6313726, 1, 0, 1,
-0.8027327, -0.9345341, -2.295333, 0.627451, 1, 0, 1,
-0.7959675, 0.4922404, -0.5743085, 0.6196079, 1, 0, 1,
-0.7936183, -0.09836025, -2.268349, 0.6156863, 1, 0, 1,
-0.790551, -1.585364, -1.634374, 0.6078432, 1, 0, 1,
-0.7883638, 0.5935401, -1.121643, 0.6039216, 1, 0, 1,
-0.7859852, 0.2311032, -1.035373, 0.5960785, 1, 0, 1,
-0.7824217, -1.204485, -1.807436, 0.5882353, 1, 0, 1,
-0.7817258, 1.770734, -0.9748418, 0.5843138, 1, 0, 1,
-0.7780355, 0.3722737, -0.3180234, 0.5764706, 1, 0, 1,
-0.7696695, -0.1572088, -1.243367, 0.572549, 1, 0, 1,
-0.7662353, -0.9151776, -1.34919, 0.5647059, 1, 0, 1,
-0.7661036, 0.3151931, 0.3228289, 0.5607843, 1, 0, 1,
-0.7609511, 0.02187846, 0.04134168, 0.5529412, 1, 0, 1,
-0.7604133, -0.8534836, -1.335903, 0.5490196, 1, 0, 1,
-0.7563828, 0.702462, 0.7527757, 0.5411765, 1, 0, 1,
-0.7496179, 0.5294448, -3.796656, 0.5372549, 1, 0, 1,
-0.7472055, -0.9908093, -2.026409, 0.5294118, 1, 0, 1,
-0.7399206, -0.9482775, -2.402352, 0.5254902, 1, 0, 1,
-0.7369236, -0.2456463, -2.724425, 0.5176471, 1, 0, 1,
-0.7361161, -1.335592, -1.954692, 0.5137255, 1, 0, 1,
-0.7347865, -1.750649, -2.261791, 0.5058824, 1, 0, 1,
-0.731311, 0.03896302, -2.074968, 0.5019608, 1, 0, 1,
-0.7289221, -0.5088912, -3.567158, 0.4941176, 1, 0, 1,
-0.7289128, -0.9865706, -4.00063, 0.4862745, 1, 0, 1,
-0.7255546, -0.2900232, -2.840681, 0.4823529, 1, 0, 1,
-0.7194268, -0.9702743, -3.159013, 0.4745098, 1, 0, 1,
-0.7150155, -0.9975766, -1.067826, 0.4705882, 1, 0, 1,
-0.7109756, 0.8601674, -1.299973, 0.4627451, 1, 0, 1,
-0.7098304, -0.8006449, -3.820308, 0.4588235, 1, 0, 1,
-0.707316, -0.4310374, -1.33602, 0.4509804, 1, 0, 1,
-0.7071553, 0.5789808, 0.4522069, 0.4470588, 1, 0, 1,
-0.7048264, 0.7592152, -1.075601, 0.4392157, 1, 0, 1,
-0.703901, -0.5368134, -2.739952, 0.4352941, 1, 0, 1,
-0.7031719, -1.862246, -2.096264, 0.427451, 1, 0, 1,
-0.6983005, -2.005053, -4.68778, 0.4235294, 1, 0, 1,
-0.6950456, -1.779602, -1.793126, 0.4156863, 1, 0, 1,
-0.6871101, -1.612291, -2.397131, 0.4117647, 1, 0, 1,
-0.6857229, 0.4920197, -1.452063, 0.4039216, 1, 0, 1,
-0.6734521, -0.8935104, -2.327161, 0.3960784, 1, 0, 1,
-0.6716768, 0.436072, -0.4233709, 0.3921569, 1, 0, 1,
-0.6707561, 0.7835015, -0.07098629, 0.3843137, 1, 0, 1,
-0.66927, 1.76168, -0.9782993, 0.3803922, 1, 0, 1,
-0.6664785, -0.109714, -3.055701, 0.372549, 1, 0, 1,
-0.6634255, -1.212658, -2.044398, 0.3686275, 1, 0, 1,
-0.6573335, -0.9680892, -0.2844099, 0.3607843, 1, 0, 1,
-0.6549183, -0.5869181, -1.871005, 0.3568628, 1, 0, 1,
-0.6529428, 1.1931, 0.4144377, 0.3490196, 1, 0, 1,
-0.6490635, 0.4350215, -0.3568548, 0.345098, 1, 0, 1,
-0.6474667, -0.0014643, -2.413443, 0.3372549, 1, 0, 1,
-0.6462976, -0.6952457, -0.7818288, 0.3333333, 1, 0, 1,
-0.6461123, 1.85932, -0.08342514, 0.3254902, 1, 0, 1,
-0.6426959, 0.2729104, -0.9522118, 0.3215686, 1, 0, 1,
-0.6423079, 0.4153199, -3.136219, 0.3137255, 1, 0, 1,
-0.6422154, -2.121213, -1.963096, 0.3098039, 1, 0, 1,
-0.637827, 1.041085, -1.240078, 0.3019608, 1, 0, 1,
-0.6202471, -1.719002, -3.300749, 0.2941177, 1, 0, 1,
-0.615407, -0.300785, -1.183864, 0.2901961, 1, 0, 1,
-0.6143902, -0.864696, -0.969372, 0.282353, 1, 0, 1,
-0.6123744, 0.2026793, -1.096085, 0.2784314, 1, 0, 1,
-0.6096223, 2.383085, -0.04543659, 0.2705882, 1, 0, 1,
-0.6036056, 0.232964, -1.134532, 0.2666667, 1, 0, 1,
-0.6023886, -0.4779649, -2.191259, 0.2588235, 1, 0, 1,
-0.5983685, 0.3525508, -2.757479, 0.254902, 1, 0, 1,
-0.5980245, -0.1263978, -1.64337, 0.2470588, 1, 0, 1,
-0.5978008, -1.480716, -2.848879, 0.2431373, 1, 0, 1,
-0.5976018, 1.306782, -0.3647913, 0.2352941, 1, 0, 1,
-0.5925096, -1.168665, -2.780332, 0.2313726, 1, 0, 1,
-0.5919144, -1.144071, -1.847569, 0.2235294, 1, 0, 1,
-0.5913897, 1.572919, 1.725337, 0.2196078, 1, 0, 1,
-0.5898614, -0.8493548, -2.653261, 0.2117647, 1, 0, 1,
-0.5854007, 0.4119204, -1.063569, 0.2078431, 1, 0, 1,
-0.5847551, -0.3519337, -1.981982, 0.2, 1, 0, 1,
-0.582745, -0.732527, -2.253264, 0.1921569, 1, 0, 1,
-0.5802871, 1.072708, 1.066527, 0.1882353, 1, 0, 1,
-0.5798462, -0.118094, -1.748424, 0.1803922, 1, 0, 1,
-0.5795082, 1.283647, 0.009922382, 0.1764706, 1, 0, 1,
-0.5733299, -0.8539644, -3.407291, 0.1686275, 1, 0, 1,
-0.5720944, -0.9203558, -2.873194, 0.1647059, 1, 0, 1,
-0.5709876, 1.335882, 0.1923964, 0.1568628, 1, 0, 1,
-0.5647345, 1.088647, -1.174816, 0.1529412, 1, 0, 1,
-0.555722, 0.01040567, -1.913693, 0.145098, 1, 0, 1,
-0.5537754, 0.9101936, -2.42834, 0.1411765, 1, 0, 1,
-0.5477882, -1.928176, -3.661906, 0.1333333, 1, 0, 1,
-0.5472554, 0.7649298, -1.32947, 0.1294118, 1, 0, 1,
-0.5437601, -0.9275736, -4.331011, 0.1215686, 1, 0, 1,
-0.5390692, 0.1338013, -2.65275, 0.1176471, 1, 0, 1,
-0.5348758, -0.2896773, -1.030717, 0.1098039, 1, 0, 1,
-0.5315735, 1.823074, 0.5540288, 0.1058824, 1, 0, 1,
-0.5232682, 1.828997, -0.6004198, 0.09803922, 1, 0, 1,
-0.5047802, 0.7167344, 0.5389071, 0.09019608, 1, 0, 1,
-0.5041758, 0.6254291, -0.04253379, 0.08627451, 1, 0, 1,
-0.5021972, 0.5830472, 0.4294764, 0.07843138, 1, 0, 1,
-0.5007853, -0.1126717, -3.263793, 0.07450981, 1, 0, 1,
-0.4976224, 1.048178, -1.019513, 0.06666667, 1, 0, 1,
-0.4964173, -1.333214, -2.493644, 0.0627451, 1, 0, 1,
-0.4906033, -0.4553775, -3.00089, 0.05490196, 1, 0, 1,
-0.4866486, -0.7759367, -2.375, 0.05098039, 1, 0, 1,
-0.4813033, 0.6578046, -0.8338155, 0.04313726, 1, 0, 1,
-0.4784328, -1.540682, -2.447267, 0.03921569, 1, 0, 1,
-0.4774826, -0.8988752, -3.116065, 0.03137255, 1, 0, 1,
-0.477236, 0.5708513, 0.5057886, 0.02745098, 1, 0, 1,
-0.4744709, -0.01063707, -3.07362, 0.01960784, 1, 0, 1,
-0.4735905, -0.6807232, -3.612583, 0.01568628, 1, 0, 1,
-0.4710915, 1.219764, -0.6199223, 0.007843138, 1, 0, 1,
-0.470378, -1.792381, -3.820015, 0.003921569, 1, 0, 1,
-0.4701987, -0.277359, -3.338852, 0, 1, 0.003921569, 1,
-0.4679328, 0.6430896, -0.1177764, 0, 1, 0.01176471, 1,
-0.4676301, -0.5021517, -2.12601, 0, 1, 0.01568628, 1,
-0.4639693, -1.904737, -3.844393, 0, 1, 0.02352941, 1,
-0.4634461, -3.00649, -2.404358, 0, 1, 0.02745098, 1,
-0.4626588, 0.8253852, -1.417693, 0, 1, 0.03529412, 1,
-0.4622575, -0.6804783, -2.33132, 0, 1, 0.03921569, 1,
-0.4601699, 0.2955308, -1.923718, 0, 1, 0.04705882, 1,
-0.4552122, -1.169992, -1.663488, 0, 1, 0.05098039, 1,
-0.4537836, -0.5168421, -2.600314, 0, 1, 0.05882353, 1,
-0.4526579, 1.357537, 1.291287, 0, 1, 0.0627451, 1,
-0.4492934, 0.3218035, 0.6247615, 0, 1, 0.07058824, 1,
-0.4485598, -1.131092, -1.778466, 0, 1, 0.07450981, 1,
-0.4477111, 0.2684567, -1.280974, 0, 1, 0.08235294, 1,
-0.4319767, -0.4840778, -2.867215, 0, 1, 0.08627451, 1,
-0.4296876, 0.061666, -4.598893, 0, 1, 0.09411765, 1,
-0.427749, 1.586248, 0.8989848, 0, 1, 0.1019608, 1,
-0.4193385, -0.6567082, -3.842655, 0, 1, 0.1058824, 1,
-0.4124072, 0.2181755, -0.01417598, 0, 1, 0.1137255, 1,
-0.4108397, 1.720979, 2.3066, 0, 1, 0.1176471, 1,
-0.4089147, 2.183119, 3.50128, 0, 1, 0.1254902, 1,
-0.4075017, -0.191534, -2.162321, 0, 1, 0.1294118, 1,
-0.407136, -0.945162, -3.004917, 0, 1, 0.1372549, 1,
-0.4014491, -0.6128401, -1.311695, 0, 1, 0.1411765, 1,
-0.394809, 0.1973743, 0.07107037, 0, 1, 0.1490196, 1,
-0.3911664, 0.5095132, -0.9435523, 0, 1, 0.1529412, 1,
-0.3899593, 1.918418, -0.6549678, 0, 1, 0.1607843, 1,
-0.3889225, 0.4396459, 1.099368, 0, 1, 0.1647059, 1,
-0.3887729, -1.132134, -3.166353, 0, 1, 0.172549, 1,
-0.3881787, -1.181527, -2.432684, 0, 1, 0.1764706, 1,
-0.3773938, 0.5248646, -1.808717, 0, 1, 0.1843137, 1,
-0.3764244, 0.005219633, -3.351044, 0, 1, 0.1882353, 1,
-0.3763123, 0.5204845, -1.892737, 0, 1, 0.1960784, 1,
-0.3761849, -1.103021, -3.645342, 0, 1, 0.2039216, 1,
-0.3756823, 0.2809675, -2.818124, 0, 1, 0.2078431, 1,
-0.3713481, -1.740726, -3.815519, 0, 1, 0.2156863, 1,
-0.3708561, 0.3002777, 0.2666441, 0, 1, 0.2196078, 1,
-0.3631911, -1.268546, -2.280672, 0, 1, 0.227451, 1,
-0.3608685, 0.7179192, -1.105676, 0, 1, 0.2313726, 1,
-0.359203, 0.2366188, -0.3475077, 0, 1, 0.2392157, 1,
-0.3541137, -2.080341, -1.5575, 0, 1, 0.2431373, 1,
-0.3536963, -1.376419, -3.943086, 0, 1, 0.2509804, 1,
-0.3530369, -0.2186545, -1.092213, 0, 1, 0.254902, 1,
-0.3529893, -0.01559978, -0.2510532, 0, 1, 0.2627451, 1,
-0.3352229, 0.6133462, -1.019165, 0, 1, 0.2666667, 1,
-0.3297046, 1.376393, -1.550352, 0, 1, 0.2745098, 1,
-0.3250691, -0.4553522, -1.924447, 0, 1, 0.2784314, 1,
-0.3170314, -0.03118176, -0.1315092, 0, 1, 0.2862745, 1,
-0.3156856, 0.3518868, -1.339518, 0, 1, 0.2901961, 1,
-0.3143652, -1.087443, -1.884216, 0, 1, 0.2980392, 1,
-0.3118595, 0.3146196, -0.3577507, 0, 1, 0.3058824, 1,
-0.3080033, -2.549635, -3.373899, 0, 1, 0.3098039, 1,
-0.3013781, 0.07713389, -0.8585774, 0, 1, 0.3176471, 1,
-0.3009385, 1.51873, -0.1098779, 0, 1, 0.3215686, 1,
-0.3008847, -1.264655, -2.196189, 0, 1, 0.3294118, 1,
-0.3008282, 0.7642215, 0.0241865, 0, 1, 0.3333333, 1,
-0.300622, -0.6109173, -1.18805, 0, 1, 0.3411765, 1,
-0.292109, -0.0008546369, -1.42628, 0, 1, 0.345098, 1,
-0.2867705, -0.5655091, -1.608409, 0, 1, 0.3529412, 1,
-0.2845201, -0.5834693, -3.070772, 0, 1, 0.3568628, 1,
-0.2838441, -2.039606, -3.855239, 0, 1, 0.3647059, 1,
-0.2804247, -1.636361, -2.146496, 0, 1, 0.3686275, 1,
-0.2770192, -0.2384653, -4.431547, 0, 1, 0.3764706, 1,
-0.2753252, -1.534648, -5.421735, 0, 1, 0.3803922, 1,
-0.2702079, 0.07496139, -1.285692, 0, 1, 0.3882353, 1,
-0.2640137, 0.8548435, 0.6330557, 0, 1, 0.3921569, 1,
-0.2484324, 0.8269842, -0.4335878, 0, 1, 0.4, 1,
-0.2454071, -1.197955, -1.08143, 0, 1, 0.4078431, 1,
-0.2430049, -1.512417, -2.15316, 0, 1, 0.4117647, 1,
-0.2409124, 0.3215437, -0.2100951, 0, 1, 0.4196078, 1,
-0.2363515, -0.004347499, -2.435177, 0, 1, 0.4235294, 1,
-0.2282789, -0.2820213, -2.934011, 0, 1, 0.4313726, 1,
-0.2225786, 0.1973754, -1.994721, 0, 1, 0.4352941, 1,
-0.2177165, 2.297331, -0.4867787, 0, 1, 0.4431373, 1,
-0.2102142, -1.000111, -2.158284, 0, 1, 0.4470588, 1,
-0.2100049, -0.08272567, -2.803799, 0, 1, 0.454902, 1,
-0.209743, 0.9711787, 0.787046, 0, 1, 0.4588235, 1,
-0.2071671, 2.646964, 1.897023, 0, 1, 0.4666667, 1,
-0.2068012, -1.117201, -3.646954, 0, 1, 0.4705882, 1,
-0.2060901, 0.05272751, -1.455416, 0, 1, 0.4784314, 1,
-0.2040092, 1.451662, -0.7220909, 0, 1, 0.4823529, 1,
-0.2025208, -2.636335, -2.279533, 0, 1, 0.4901961, 1,
-0.201888, -1.461438, -1.535034, 0, 1, 0.4941176, 1,
-0.1992656, 0.4873769, 1.516272, 0, 1, 0.5019608, 1,
-0.1975804, -2.738986, -1.527137, 0, 1, 0.509804, 1,
-0.1971323, -0.141608, -2.290461, 0, 1, 0.5137255, 1,
-0.1965515, 0.1102136, -1.393314, 0, 1, 0.5215687, 1,
-0.1959233, 3.010878, 1.813149, 0, 1, 0.5254902, 1,
-0.1925272, -0.2605497, -2.354091, 0, 1, 0.5333334, 1,
-0.1906484, -0.2149474, -1.293138, 0, 1, 0.5372549, 1,
-0.1861088, -1.321623, -2.71351, 0, 1, 0.5450981, 1,
-0.1858633, -0.2873476, -2.374568, 0, 1, 0.5490196, 1,
-0.1829968, 1.446765, 0.02945723, 0, 1, 0.5568628, 1,
-0.1759437, -1.517857, -2.886059, 0, 1, 0.5607843, 1,
-0.1747471, -1.813286, -1.143361, 0, 1, 0.5686275, 1,
-0.1709925, 0.640808, -1.651873, 0, 1, 0.572549, 1,
-0.1693777, -0.2342133, -2.755664, 0, 1, 0.5803922, 1,
-0.1614308, 0.8156473, 0.5700882, 0, 1, 0.5843138, 1,
-0.1611139, -0.2109703, -3.928468, 0, 1, 0.5921569, 1,
-0.1578862, -1.564713, -2.000068, 0, 1, 0.5960785, 1,
-0.1569925, -0.2260276, -2.44862, 0, 1, 0.6039216, 1,
-0.1551391, 0.2855001, 0.3224672, 0, 1, 0.6117647, 1,
-0.1465841, -1.174908, -3.569016, 0, 1, 0.6156863, 1,
-0.145886, -1.133635, -3.39446, 0, 1, 0.6235294, 1,
-0.1458349, -0.5758345, -3.900184, 0, 1, 0.627451, 1,
-0.1403166, -0.7153376, -4.077916, 0, 1, 0.6352941, 1,
-0.1356052, 0.07185316, -0.563298, 0, 1, 0.6392157, 1,
-0.1233669, -0.8842803, -3.221657, 0, 1, 0.6470588, 1,
-0.119984, -0.5586994, -1.672286, 0, 1, 0.6509804, 1,
-0.1190296, -0.4497947, -3.434555, 0, 1, 0.6588235, 1,
-0.1093458, -1.020986, -2.479756, 0, 1, 0.6627451, 1,
-0.108954, 0.4508731, -0.876987, 0, 1, 0.6705883, 1,
-0.1069181, -0.2156899, -1.702725, 0, 1, 0.6745098, 1,
-0.106469, 1.074585, 1.061006, 0, 1, 0.682353, 1,
-0.1064569, 0.7066217, 0.5657195, 0, 1, 0.6862745, 1,
-0.1038906, 1.095807, 0.5640231, 0, 1, 0.6941177, 1,
-0.1031147, 0.177071, 0.1792939, 0, 1, 0.7019608, 1,
-0.09982909, 1.420141, -1.601153, 0, 1, 0.7058824, 1,
-0.09952123, -0.2533428, -3.365878, 0, 1, 0.7137255, 1,
-0.08665107, -0.5126618, -4.724193, 0, 1, 0.7176471, 1,
-0.08469612, 0.5787669, -0.8342103, 0, 1, 0.7254902, 1,
-0.08315954, 0.5800518, -1.191447, 0, 1, 0.7294118, 1,
-0.08263914, 2.214939, -1.876717, 0, 1, 0.7372549, 1,
-0.08130453, -0.2525448, -3.890887, 0, 1, 0.7411765, 1,
-0.07823539, -0.5326137, -3.345493, 0, 1, 0.7490196, 1,
-0.0757763, -1.157172, -2.420016, 0, 1, 0.7529412, 1,
-0.07166021, 1.747754, -0.356025, 0, 1, 0.7607843, 1,
-0.06687327, 0.2982155, -0.3867963, 0, 1, 0.7647059, 1,
-0.06395282, 0.2077019, -0.3569128, 0, 1, 0.772549, 1,
-0.06011081, -0.5342498, -2.793531, 0, 1, 0.7764706, 1,
-0.05929376, 0.05704009, -1.274145, 0, 1, 0.7843137, 1,
-0.05897876, -0.0243917, -2.467708, 0, 1, 0.7882353, 1,
-0.05740778, 0.9949174, 1.623884, 0, 1, 0.7960784, 1,
-0.0569378, -1.411448, -2.15982, 0, 1, 0.8039216, 1,
-0.05658668, 0.1722307, 1.26376, 0, 1, 0.8078431, 1,
-0.0542403, -0.1739891, -3.902373, 0, 1, 0.8156863, 1,
-0.05115329, 0.7971373, -0.7006571, 0, 1, 0.8196079, 1,
-0.05068457, 0.4211338, -0.3365681, 0, 1, 0.827451, 1,
-0.04102518, -2.081143, -4.492701, 0, 1, 0.8313726, 1,
-0.03891365, 0.699261, 0.2614555, 0, 1, 0.8392157, 1,
-0.038772, -2.213566, -1.716391, 0, 1, 0.8431373, 1,
-0.0376538, 0.194621, -0.8251289, 0, 1, 0.8509804, 1,
-0.03751679, -0.2572958, -2.596079, 0, 1, 0.854902, 1,
-0.0335629, 2.213798, 0.4813657, 0, 1, 0.8627451, 1,
-0.03355982, -1.31431, -4.088295, 0, 1, 0.8666667, 1,
-0.03225594, -0.747416, -2.418449, 0, 1, 0.8745098, 1,
-0.03118735, -0.2353749, -4.230262, 0, 1, 0.8784314, 1,
-0.02900684, -0.5181133, -2.943289, 0, 1, 0.8862745, 1,
-0.01967947, 0.311024, -1.372942, 0, 1, 0.8901961, 1,
-0.008675615, -0.1207559, -4.573799, 0, 1, 0.8980392, 1,
-0.008140371, 0.2893459, 1.089582, 0, 1, 0.9058824, 1,
-0.005849746, 0.5523004, -2.191778, 0, 1, 0.9098039, 1,
-0.005741782, 1.382439, -1.281001, 0, 1, 0.9176471, 1,
-0.00481532, -0.7689773, -2.53329, 0, 1, 0.9215686, 1,
-0.0002538963, 1.22021, -0.1080102, 0, 1, 0.9294118, 1,
0.000372433, -0.6442834, 4.270851, 0, 1, 0.9333333, 1,
0.001837558, -0.5697819, 4.640768, 0, 1, 0.9411765, 1,
0.001889569, -1.369822, 2.735382, 0, 1, 0.945098, 1,
0.005067656, -1.285745, 4.110296, 0, 1, 0.9529412, 1,
0.01619247, -2.13459, 3.415444, 0, 1, 0.9568627, 1,
0.02392351, -0.2423519, 4.334974, 0, 1, 0.9647059, 1,
0.02462109, 0.3096515, 0.8908088, 0, 1, 0.9686275, 1,
0.02624569, -1.096901, 4.888141, 0, 1, 0.9764706, 1,
0.03408155, -0.4755067, 3.681715, 0, 1, 0.9803922, 1,
0.0365976, 0.4304633, -1.829769, 0, 1, 0.9882353, 1,
0.03990072, 2.177908, 0.878072, 0, 1, 0.9921569, 1,
0.04112041, 0.7515239, -1.433643, 0, 1, 1, 1,
0.04575014, -0.6407201, 3.858185, 0, 0.9921569, 1, 1,
0.04649054, -0.3468756, 1.938374, 0, 0.9882353, 1, 1,
0.06001822, 0.3283363, -1.353714, 0, 0.9803922, 1, 1,
0.06144751, 0.8865876, -0.05159343, 0, 0.9764706, 1, 1,
0.0665549, -2.155263, 3.0103, 0, 0.9686275, 1, 1,
0.06835102, -0.9288394, 4.667625, 0, 0.9647059, 1, 1,
0.07111403, -1.069509, 2.694913, 0, 0.9568627, 1, 1,
0.07233838, 0.1737614, -0.5330672, 0, 0.9529412, 1, 1,
0.07234675, -0.5025429, 3.350468, 0, 0.945098, 1, 1,
0.07409962, 0.8157884, 0.7582739, 0, 0.9411765, 1, 1,
0.07595671, -1.104396, 1.396981, 0, 0.9333333, 1, 1,
0.07821018, -1.591638, 2.450105, 0, 0.9294118, 1, 1,
0.07898123, 0.8639388, -1.251767, 0, 0.9215686, 1, 1,
0.07948226, 0.3358157, -1.78038, 0, 0.9176471, 1, 1,
0.08288974, 0.8030943, 2.320898, 0, 0.9098039, 1, 1,
0.08301783, -1.684731, 3.230114, 0, 0.9058824, 1, 1,
0.08422606, 0.6182515, 0.5302831, 0, 0.8980392, 1, 1,
0.08476567, 0.4654358, 0.01848146, 0, 0.8901961, 1, 1,
0.08503564, -0.3915238, 1.980716, 0, 0.8862745, 1, 1,
0.08568674, 0.5376614, 1.874066, 0, 0.8784314, 1, 1,
0.08592685, 0.2508008, 0.8981466, 0, 0.8745098, 1, 1,
0.08610331, -0.4582033, 5.00593, 0, 0.8666667, 1, 1,
0.0867306, -1.159309, 2.961339, 0, 0.8627451, 1, 1,
0.08831839, 0.3210795, 0.09427582, 0, 0.854902, 1, 1,
0.09260456, -0.2965292, 2.437586, 0, 0.8509804, 1, 1,
0.09928552, -1.163145, 2.777908, 0, 0.8431373, 1, 1,
0.1013673, 0.7929587, -0.1321575, 0, 0.8392157, 1, 1,
0.1020972, -0.6705398, 1.511843, 0, 0.8313726, 1, 1,
0.1022871, -0.5985152, 3.446685, 0, 0.827451, 1, 1,
0.1027052, 1.445049, 0.3751847, 0, 0.8196079, 1, 1,
0.1043648, 0.2441728, 1.059462, 0, 0.8156863, 1, 1,
0.1051456, 0.5377916, 0.4223474, 0, 0.8078431, 1, 1,
0.1075847, -0.5720121, 3.205597, 0, 0.8039216, 1, 1,
0.1086808, 0.2036158, -0.4851196, 0, 0.7960784, 1, 1,
0.1109135, -0.3868169, 2.589804, 0, 0.7882353, 1, 1,
0.1140164, -0.5307609, 3.157309, 0, 0.7843137, 1, 1,
0.1154854, -1.849197, 2.840248, 0, 0.7764706, 1, 1,
0.1155534, 0.1082911, 2.454444, 0, 0.772549, 1, 1,
0.1158301, 0.9492486, 0.908879, 0, 0.7647059, 1, 1,
0.1159735, 1.403382, 1.359914, 0, 0.7607843, 1, 1,
0.1173883, 0.6324821, -0.4577416, 0, 0.7529412, 1, 1,
0.1180588, 0.2479532, 0.8688089, 0, 0.7490196, 1, 1,
0.1192593, 1.549661, -0.2257966, 0, 0.7411765, 1, 1,
0.1240125, -0.9682818, 1.959822, 0, 0.7372549, 1, 1,
0.1256791, 0.3080973, 0.0986324, 0, 0.7294118, 1, 1,
0.1265457, 0.9075392, -1.005568, 0, 0.7254902, 1, 1,
0.1271529, -0.05451438, 2.551388, 0, 0.7176471, 1, 1,
0.1324791, -1.513989, 2.282526, 0, 0.7137255, 1, 1,
0.1328609, -0.5029753, 4.726965, 0, 0.7058824, 1, 1,
0.1353491, 1.958632, -0.7167414, 0, 0.6980392, 1, 1,
0.136395, -0.1678104, 4.22015, 0, 0.6941177, 1, 1,
0.1366616, -0.4568393, 2.98034, 0, 0.6862745, 1, 1,
0.1383086, 0.2772561, 2.250099, 0, 0.682353, 1, 1,
0.1420985, -0.1297233, 3.252649, 0, 0.6745098, 1, 1,
0.1428813, -0.3745741, 2.827711, 0, 0.6705883, 1, 1,
0.144061, 0.2923229, 1.20915, 0, 0.6627451, 1, 1,
0.1472576, -1.139388, 1.921023, 0, 0.6588235, 1, 1,
0.1584469, -1.524365, 2.56425, 0, 0.6509804, 1, 1,
0.1589174, -1.284512, 4.132535, 0, 0.6470588, 1, 1,
0.1605961, -1.110877, 4.642348, 0, 0.6392157, 1, 1,
0.1630398, 0.6793427, 0.3665139, 0, 0.6352941, 1, 1,
0.1635163, 0.02573792, 1.752037, 0, 0.627451, 1, 1,
0.1643835, -0.04253361, 1.28424, 0, 0.6235294, 1, 1,
0.1645577, -1.538952, 2.682798, 0, 0.6156863, 1, 1,
0.1669265, 0.8053669, 0.04085846, 0, 0.6117647, 1, 1,
0.167641, 0.6516623, 0.8206244, 0, 0.6039216, 1, 1,
0.1712564, -1.370468, 3.757608, 0, 0.5960785, 1, 1,
0.1756139, -0.2817805, 2.745745, 0, 0.5921569, 1, 1,
0.1761655, -1.02142, 3.021471, 0, 0.5843138, 1, 1,
0.1768512, 0.1925916, 0.8255597, 0, 0.5803922, 1, 1,
0.1770472, 0.3381055, 1.278961, 0, 0.572549, 1, 1,
0.1774249, -0.00974412, 0.7226617, 0, 0.5686275, 1, 1,
0.1800568, 0.6725362, 0.337848, 0, 0.5607843, 1, 1,
0.1845119, 0.5085171, -0.1513748, 0, 0.5568628, 1, 1,
0.1860927, -0.9929771, 2.889376, 0, 0.5490196, 1, 1,
0.1899403, 0.08577049, 1.157166, 0, 0.5450981, 1, 1,
0.1919663, -1.197356, 2.458917, 0, 0.5372549, 1, 1,
0.1979566, 1.458844, -0.6650509, 0, 0.5333334, 1, 1,
0.198725, -2.140074, 2.974225, 0, 0.5254902, 1, 1,
0.1990724, 0.5895392, -0.7811496, 0, 0.5215687, 1, 1,
0.2024039, -0.318519, -0.5212494, 0, 0.5137255, 1, 1,
0.2033364, 0.3691518, -0.5367518, 0, 0.509804, 1, 1,
0.2043994, 1.321641, 0.5031434, 0, 0.5019608, 1, 1,
0.2056601, -0.7444908, 3.068674, 0, 0.4941176, 1, 1,
0.2071085, 0.837448, 0.2858846, 0, 0.4901961, 1, 1,
0.2078621, -1.594312, 1.370323, 0, 0.4823529, 1, 1,
0.2138993, 0.1957443, 0.01470921, 0, 0.4784314, 1, 1,
0.216269, 0.2283717, 0.2842973, 0, 0.4705882, 1, 1,
0.2167661, -0.2733195, 2.301872, 0, 0.4666667, 1, 1,
0.2178427, -0.5915447, 2.737266, 0, 0.4588235, 1, 1,
0.2213607, -0.5417683, 3.338216, 0, 0.454902, 1, 1,
0.2222219, -0.5762896, 2.088939, 0, 0.4470588, 1, 1,
0.2236354, -0.9553656, 2.903259, 0, 0.4431373, 1, 1,
0.2270081, -0.5388529, 3.433753, 0, 0.4352941, 1, 1,
0.227649, 0.7735636, 0.3942702, 0, 0.4313726, 1, 1,
0.234116, 0.8643453, 0.8171306, 0, 0.4235294, 1, 1,
0.2351772, -0.3140681, 1.071049, 0, 0.4196078, 1, 1,
0.2384209, -1.167151, 3.527513, 0, 0.4117647, 1, 1,
0.2396758, 1.310623, 0.6793882, 0, 0.4078431, 1, 1,
0.2418228, -0.7485039, 2.158993, 0, 0.4, 1, 1,
0.2461543, -0.4287347, 2.56238, 0, 0.3921569, 1, 1,
0.2463182, -0.639044, 1.7622, 0, 0.3882353, 1, 1,
0.2505756, 0.1362871, 2.057271, 0, 0.3803922, 1, 1,
0.2512543, -0.6309594, 1.041723, 0, 0.3764706, 1, 1,
0.2512917, -0.5218281, 2.820082, 0, 0.3686275, 1, 1,
0.2529041, 3.307691, 0.7850336, 0, 0.3647059, 1, 1,
0.256209, 0.52622, 0.1095765, 0, 0.3568628, 1, 1,
0.2564153, 0.2857757, 1.766365, 0, 0.3529412, 1, 1,
0.2575638, 0.5459917, -0.1624325, 0, 0.345098, 1, 1,
0.2674877, 0.5321599, -0.7112966, 0, 0.3411765, 1, 1,
0.2681385, 0.6156241, -0.4360659, 0, 0.3333333, 1, 1,
0.2799083, 1.113062, 0.2638859, 0, 0.3294118, 1, 1,
0.2820848, 0.09186928, 0.2973752, 0, 0.3215686, 1, 1,
0.2829575, -0.6818903, 2.258958, 0, 0.3176471, 1, 1,
0.2878434, -1.428532, 2.55759, 0, 0.3098039, 1, 1,
0.2906451, -0.02805781, 0.8687044, 0, 0.3058824, 1, 1,
0.2911446, 0.1439049, 0.7434641, 0, 0.2980392, 1, 1,
0.2917755, 0.7513056, 0.6369202, 0, 0.2901961, 1, 1,
0.2941062, 0.4744435, -0.314166, 0, 0.2862745, 1, 1,
0.2945618, -0.1211674, 0.8199754, 0, 0.2784314, 1, 1,
0.2976699, -0.2787447, 2.708183, 0, 0.2745098, 1, 1,
0.2978732, 0.3596824, 0.300595, 0, 0.2666667, 1, 1,
0.2983129, 1.849035, -0.7911136, 0, 0.2627451, 1, 1,
0.2997568, -0.2915892, 2.388123, 0, 0.254902, 1, 1,
0.3006911, 1.23551, -1.244828, 0, 0.2509804, 1, 1,
0.3009248, -1.045233, 3.169556, 0, 0.2431373, 1, 1,
0.307032, -0.260026, 3.177269, 0, 0.2392157, 1, 1,
0.3175247, -0.04041567, 1.033779, 0, 0.2313726, 1, 1,
0.3234889, 0.01986438, 2.24636, 0, 0.227451, 1, 1,
0.3243838, 1.384724, -0.4727911, 0, 0.2196078, 1, 1,
0.3293933, -0.3985033, 3.630887, 0, 0.2156863, 1, 1,
0.3302484, -1.43952, 1.297427, 0, 0.2078431, 1, 1,
0.3317756, -0.3709504, 2.969723, 0, 0.2039216, 1, 1,
0.3326037, 1.496611, -0.2444011, 0, 0.1960784, 1, 1,
0.3339458, 0.4106368, -2.47432, 0, 0.1882353, 1, 1,
0.3422309, -0.754573, 2.491916, 0, 0.1843137, 1, 1,
0.3439007, -1.89545, 2.869188, 0, 0.1764706, 1, 1,
0.3469509, -0.9396594, 3.09407, 0, 0.172549, 1, 1,
0.3499683, 0.4513841, 1.11863, 0, 0.1647059, 1, 1,
0.3537468, 2.865596, 0.3154246, 0, 0.1607843, 1, 1,
0.3547598, -1.790612, 3.872591, 0, 0.1529412, 1, 1,
0.3610153, -0.2130623, 2.236497, 0, 0.1490196, 1, 1,
0.3617274, -0.2294165, 2.495491, 0, 0.1411765, 1, 1,
0.3648109, 0.402315, 0.6477866, 0, 0.1372549, 1, 1,
0.3651741, 1.307431, 0.7794599, 0, 0.1294118, 1, 1,
0.3652277, 1.782351, -1.622294, 0, 0.1254902, 1, 1,
0.3727085, -1.216766, 3.074405, 0, 0.1176471, 1, 1,
0.3739513, -1.182799, 4.547006, 0, 0.1137255, 1, 1,
0.375063, -0.910652, 3.393799, 0, 0.1058824, 1, 1,
0.3759356, 0.0057677, 0.9707858, 0, 0.09803922, 1, 1,
0.3761366, 1.347535, 0.734923, 0, 0.09411765, 1, 1,
0.3799492, -0.2973296, 1.083157, 0, 0.08627451, 1, 1,
0.3865249, -0.8345615, 1.558778, 0, 0.08235294, 1, 1,
0.3894082, 0.8468153, 1.513851, 0, 0.07450981, 1, 1,
0.3897039, -0.01671596, 1.26833, 0, 0.07058824, 1, 1,
0.3924287, 0.2884626, -0.6086317, 0, 0.0627451, 1, 1,
0.3968729, 0.5252563, 1.110445, 0, 0.05882353, 1, 1,
0.4116749, 1.526652, 1.020818, 0, 0.05098039, 1, 1,
0.4151683, -1.258089, 2.57028, 0, 0.04705882, 1, 1,
0.4154535, 1.70507, 0.06016586, 0, 0.03921569, 1, 1,
0.4187862, -0.3433422, 4.033691, 0, 0.03529412, 1, 1,
0.41988, 0.7972794, -0.6065336, 0, 0.02745098, 1, 1,
0.4205362, -0.3777141, 2.355914, 0, 0.02352941, 1, 1,
0.4231353, -0.2149448, 4.424529, 0, 0.01568628, 1, 1,
0.4258563, 1.859068, -1.06153, 0, 0.01176471, 1, 1,
0.4279789, 0.6373988, 1.033946, 0, 0.003921569, 1, 1,
0.4311283, 1.027612, 1.628755, 0.003921569, 0, 1, 1,
0.4322836, 0.64977, -0.1050017, 0.007843138, 0, 1, 1,
0.4375708, -0.2661965, 3.106505, 0.01568628, 0, 1, 1,
0.4421688, 0.6000931, 1.984187, 0.01960784, 0, 1, 1,
0.4428775, -0.1786225, 3.784567, 0.02745098, 0, 1, 1,
0.4460404, -0.1992107, 3.315149, 0.03137255, 0, 1, 1,
0.449031, -1.107477, 3.011342, 0.03921569, 0, 1, 1,
0.4501781, 0.3733218, 0.008969487, 0.04313726, 0, 1, 1,
0.4522296, 1.132529, 0.9034762, 0.05098039, 0, 1, 1,
0.4532893, 2.89784, 0.5343797, 0.05490196, 0, 1, 1,
0.4563285, 0.3479382, 0.5428895, 0.0627451, 0, 1, 1,
0.4592691, 0.04428542, -0.4219628, 0.06666667, 0, 1, 1,
0.4605135, -0.1357116, 1.642992, 0.07450981, 0, 1, 1,
0.4608535, 1.664593, -0.4513611, 0.07843138, 0, 1, 1,
0.46213, -1.182894, 2.033105, 0.08627451, 0, 1, 1,
0.4622321, -0.620308, 4.816045, 0.09019608, 0, 1, 1,
0.4633887, 1.11847, 0.113508, 0.09803922, 0, 1, 1,
0.4682119, 0.7887455, -0.3233652, 0.1058824, 0, 1, 1,
0.4797597, 0.2294211, 2.41364, 0.1098039, 0, 1, 1,
0.4816738, -0.3719158, 2.540994, 0.1176471, 0, 1, 1,
0.4861659, -2.332675, 1.537274, 0.1215686, 0, 1, 1,
0.497143, -0.9378198, 2.659917, 0.1294118, 0, 1, 1,
0.4984609, 0.3502564, 1.351974, 0.1333333, 0, 1, 1,
0.5005202, 0.9894017, 1.614828, 0.1411765, 0, 1, 1,
0.50107, -3.072563, 2.525265, 0.145098, 0, 1, 1,
0.507718, -0.2954526, 2.552899, 0.1529412, 0, 1, 1,
0.5127417, 0.4815335, 1.647047, 0.1568628, 0, 1, 1,
0.5134179, 0.4007808, 1.562538, 0.1647059, 0, 1, 1,
0.5172476, 0.3377359, 2.229697, 0.1686275, 0, 1, 1,
0.5188617, 0.01194093, -0.4467282, 0.1764706, 0, 1, 1,
0.5226021, 1.13273, -0.7741873, 0.1803922, 0, 1, 1,
0.5269148, 0.05136873, 1.790371, 0.1882353, 0, 1, 1,
0.5299884, -0.3521881, 3.373676, 0.1921569, 0, 1, 1,
0.5361407, -0.6118077, 0.388445, 0.2, 0, 1, 1,
0.5468143, -0.3081757, 1.848762, 0.2078431, 0, 1, 1,
0.5492877, 1.445554, 0.02704499, 0.2117647, 0, 1, 1,
0.5520074, -0.1870909, 3.431194, 0.2196078, 0, 1, 1,
0.5539171, -1.238521, 3.598204, 0.2235294, 0, 1, 1,
0.5586374, 1.045735, 1.206256, 0.2313726, 0, 1, 1,
0.5591145, 0.8657984, 0.5950108, 0.2352941, 0, 1, 1,
0.5593657, -0.2646868, 2.697751, 0.2431373, 0, 1, 1,
0.5600846, 0.9354929, -0.2648661, 0.2470588, 0, 1, 1,
0.5609788, 0.2607659, 1.113744, 0.254902, 0, 1, 1,
0.5627678, 1.228033, 1.46231, 0.2588235, 0, 1, 1,
0.5654336, -1.574359, 2.920034, 0.2666667, 0, 1, 1,
0.5665482, -1.393092, 2.709324, 0.2705882, 0, 1, 1,
0.5678295, 2.027276, -0.704309, 0.2784314, 0, 1, 1,
0.5715664, 1.116541, 1.585874, 0.282353, 0, 1, 1,
0.5736667, 0.4687857, 0.1383108, 0.2901961, 0, 1, 1,
0.5743039, 0.2725946, 0.7762504, 0.2941177, 0, 1, 1,
0.5854659, -1.026894, 4.137938, 0.3019608, 0, 1, 1,
0.5856604, -1.858715, 2.428023, 0.3098039, 0, 1, 1,
0.5871709, 1.673224, 0.9964026, 0.3137255, 0, 1, 1,
0.5889093, 0.830143, 1.620192, 0.3215686, 0, 1, 1,
0.5902542, 0.3811093, 0.5109383, 0.3254902, 0, 1, 1,
0.5944921, -2.532618, 4.207463, 0.3333333, 0, 1, 1,
0.5964974, 0.752783, -0.1330899, 0.3372549, 0, 1, 1,
0.5984185, 0.2975792, 2.516506, 0.345098, 0, 1, 1,
0.5995204, -1.488985, 4.686287, 0.3490196, 0, 1, 1,
0.6013904, -1.223913, 2.951106, 0.3568628, 0, 1, 1,
0.6029643, 1.416045, -1.519657, 0.3607843, 0, 1, 1,
0.6070213, 0.1087896, 2.062809, 0.3686275, 0, 1, 1,
0.6092477, -0.1447686, 2.897277, 0.372549, 0, 1, 1,
0.619938, -0.2120571, 1.816284, 0.3803922, 0, 1, 1,
0.6216917, -0.5058066, 1.809262, 0.3843137, 0, 1, 1,
0.6282495, 0.5826337, 0.380646, 0.3921569, 0, 1, 1,
0.631805, -0.1379012, 2.510661, 0.3960784, 0, 1, 1,
0.6407396, 1.222607, 2.184862, 0.4039216, 0, 1, 1,
0.6516484, 0.3467781, -0.4759773, 0.4117647, 0, 1, 1,
0.6543309, 0.04158021, 2.211567, 0.4156863, 0, 1, 1,
0.6555069, -0.5614068, 0.4166267, 0.4235294, 0, 1, 1,
0.6608332, 0.03584987, 3.251685, 0.427451, 0, 1, 1,
0.6615313, -0.1798702, 0.1812769, 0.4352941, 0, 1, 1,
0.6656565, 1.191357, 1.120759, 0.4392157, 0, 1, 1,
0.6688027, 0.9600014, -0.1022529, 0.4470588, 0, 1, 1,
0.6693302, -0.6602079, 1.941601, 0.4509804, 0, 1, 1,
0.6720278, -0.4390979, 0.4614951, 0.4588235, 0, 1, 1,
0.672471, -2.035269, 1.938969, 0.4627451, 0, 1, 1,
0.67265, 0.3158029, -0.04333436, 0.4705882, 0, 1, 1,
0.6737834, 0.2755302, 0.130093, 0.4745098, 0, 1, 1,
0.6738884, 0.2464719, 0.8491331, 0.4823529, 0, 1, 1,
0.6746373, -0.9336618, 3.550023, 0.4862745, 0, 1, 1,
0.6796071, -0.769707, 1.761189, 0.4941176, 0, 1, 1,
0.6798866, 1.480966, 0.4409708, 0.5019608, 0, 1, 1,
0.6838902, 0.5230399, 1.16579, 0.5058824, 0, 1, 1,
0.6899284, 2.512963, -0.7209808, 0.5137255, 0, 1, 1,
0.6903379, 1.63138, -0.2473074, 0.5176471, 0, 1, 1,
0.7084566, 0.04756679, 2.771617, 0.5254902, 0, 1, 1,
0.7096185, -0.9042765, 4.2562, 0.5294118, 0, 1, 1,
0.7111004, -0.01723231, 1.057471, 0.5372549, 0, 1, 1,
0.713118, 0.7982624, -0.7164315, 0.5411765, 0, 1, 1,
0.723492, -1.099654, 4.390722, 0.5490196, 0, 1, 1,
0.7257407, 0.05451787, 2.887574, 0.5529412, 0, 1, 1,
0.7284017, 1.041039, 1.558726, 0.5607843, 0, 1, 1,
0.7315785, 0.09626748, 1.587385, 0.5647059, 0, 1, 1,
0.7331071, -1.94313, 2.533795, 0.572549, 0, 1, 1,
0.7336721, -1.336715, 2.972694, 0.5764706, 0, 1, 1,
0.7378147, 0.5360104, 1.758969, 0.5843138, 0, 1, 1,
0.7444422, -0.8371077, 1.01783, 0.5882353, 0, 1, 1,
0.7508618, 1.167725, 0.2728189, 0.5960785, 0, 1, 1,
0.7610686, -0.2654261, 1.433756, 0.6039216, 0, 1, 1,
0.7635498, -0.6318931, 1.715714, 0.6078432, 0, 1, 1,
0.7669857, 0.1123902, 1.827711, 0.6156863, 0, 1, 1,
0.7685688, -0.04851521, 3.16478, 0.6196079, 0, 1, 1,
0.7715086, 0.03463241, 1.46359, 0.627451, 0, 1, 1,
0.7759316, 1.093554, 0.00967648, 0.6313726, 0, 1, 1,
0.7844687, 1.11378, -0.4335944, 0.6392157, 0, 1, 1,
0.7865648, -0.4256719, 2.957916, 0.6431373, 0, 1, 1,
0.7894565, -0.9448183, 3.201869, 0.6509804, 0, 1, 1,
0.794632, -0.0384453, 1.944948, 0.654902, 0, 1, 1,
0.7968548, 1.092367, 2.449949, 0.6627451, 0, 1, 1,
0.7994148, 0.5829349, 0.8765261, 0.6666667, 0, 1, 1,
0.8011737, -0.6436133, 3.402857, 0.6745098, 0, 1, 1,
0.8046698, 0.2042758, -0.8206126, 0.6784314, 0, 1, 1,
0.8052828, 0.06941982, 1.875034, 0.6862745, 0, 1, 1,
0.8071036, 0.1422134, 0.2751262, 0.6901961, 0, 1, 1,
0.8072861, -0.3486329, 3.467866, 0.6980392, 0, 1, 1,
0.8091673, 1.366777, 1.450715, 0.7058824, 0, 1, 1,
0.8137435, 0.3385946, 2.793323, 0.7098039, 0, 1, 1,
0.8141206, -0.7935127, 4.559198, 0.7176471, 0, 1, 1,
0.8161316, -1.41104, 2.04198, 0.7215686, 0, 1, 1,
0.8244103, 1.142767, 1.498723, 0.7294118, 0, 1, 1,
0.8298128, -0.8904567, 1.917702, 0.7333333, 0, 1, 1,
0.830254, -0.2682819, 2.020417, 0.7411765, 0, 1, 1,
0.8322338, -0.3765283, 2.465502, 0.7450981, 0, 1, 1,
0.8357222, -0.1566519, 0.3034349, 0.7529412, 0, 1, 1,
0.839106, -0.3466674, 0.7779158, 0.7568628, 0, 1, 1,
0.8392406, 1.089802, 0.4230994, 0.7647059, 0, 1, 1,
0.8425003, 0.2660694, 0.9988319, 0.7686275, 0, 1, 1,
0.8440174, -0.1493947, 2.340451, 0.7764706, 0, 1, 1,
0.8451451, 0.613054, -1.184955, 0.7803922, 0, 1, 1,
0.8461012, -0.4891219, 1.816075, 0.7882353, 0, 1, 1,
0.8525615, 0.6872039, 0.6132505, 0.7921569, 0, 1, 1,
0.8549844, 1.369806, -1.27101, 0.8, 0, 1, 1,
0.8561214, -0.5284877, 0.6316482, 0.8078431, 0, 1, 1,
0.8566101, -0.7093062, 2.21695, 0.8117647, 0, 1, 1,
0.8583581, -0.220054, 0.623713, 0.8196079, 0, 1, 1,
0.8600884, -0.7478588, 3.390638, 0.8235294, 0, 1, 1,
0.8601941, 1.738279, 2.019019, 0.8313726, 0, 1, 1,
0.863443, 0.2330957, 0.002670366, 0.8352941, 0, 1, 1,
0.8643121, 0.7679752, 2.13358, 0.8431373, 0, 1, 1,
0.8645177, -1.116707, 2.197965, 0.8470588, 0, 1, 1,
0.8670505, -1.565432, 2.066069, 0.854902, 0, 1, 1,
0.86987, -1.244561, 1.653528, 0.8588235, 0, 1, 1,
0.8707015, 1.585093, 0.6666927, 0.8666667, 0, 1, 1,
0.8763442, -0.6067494, 3.309583, 0.8705882, 0, 1, 1,
0.8785248, 0.2288185, 3.48776, 0.8784314, 0, 1, 1,
0.8789432, -1.222645, 3.700385, 0.8823529, 0, 1, 1,
0.8808041, 0.07846665, 1.007588, 0.8901961, 0, 1, 1,
0.8813622, -1.192817, 4.453435, 0.8941177, 0, 1, 1,
0.8863953, -1.175035, 3.040088, 0.9019608, 0, 1, 1,
0.8895805, 0.5517084, 2.34945, 0.9098039, 0, 1, 1,
0.8901703, 0.6128889, 2.068019, 0.9137255, 0, 1, 1,
0.8939741, -0.8741547, 2.283748, 0.9215686, 0, 1, 1,
0.8945812, 0.2212911, 1.446037, 0.9254902, 0, 1, 1,
0.9107818, 0.6877038, 0.2273949, 0.9333333, 0, 1, 1,
0.9158388, -1.383978, 2.294305, 0.9372549, 0, 1, 1,
0.9172726, 1.056755, 0.4121504, 0.945098, 0, 1, 1,
0.9373918, 1.492329, 0.5937744, 0.9490196, 0, 1, 1,
0.9433619, 1.460463, -0.9002174, 0.9568627, 0, 1, 1,
0.9442579, -1.266933, 0.8419002, 0.9607843, 0, 1, 1,
0.9568037, 0.7400167, 1.238817, 0.9686275, 0, 1, 1,
0.9595306, 0.5387058, 0.5595662, 0.972549, 0, 1, 1,
0.9623474, -0.96611, 1.442626, 0.9803922, 0, 1, 1,
0.9631874, -0.3903096, 1.474281, 0.9843137, 0, 1, 1,
0.9704319, 0.6284781, 0.4007401, 0.9921569, 0, 1, 1,
0.9716843, -0.6505723, 2.677619, 0.9960784, 0, 1, 1,
0.9727602, 0.1365743, 0.1125756, 1, 0, 0.9960784, 1,
0.9798383, -0.2381624, 1.89425, 1, 0, 0.9882353, 1,
0.9809424, -0.08767118, 3.220794, 1, 0, 0.9843137, 1,
0.9809471, -1.128832, 2.555503, 1, 0, 0.9764706, 1,
0.982693, -0.529927, 1.832844, 1, 0, 0.972549, 1,
0.9917191, -1.187355, 3.399786, 1, 0, 0.9647059, 1,
0.9923454, -0.5596105, 1.51267, 1, 0, 0.9607843, 1,
0.9950764, -1.266807, 1.652772, 1, 0, 0.9529412, 1,
1.013718, 0.9490797, -0.1463441, 1, 0, 0.9490196, 1,
1.014743, -0.1711267, 2.165969, 1, 0, 0.9411765, 1,
1.016352, -1.000297, 3.024178, 1, 0, 0.9372549, 1,
1.018785, 1.310086, 0.1619785, 1, 0, 0.9294118, 1,
1.019629, 0.2785476, 2.653119, 1, 0, 0.9254902, 1,
1.026895, -0.05575597, 1.626087, 1, 0, 0.9176471, 1,
1.032856, 0.1454246, -0.1970811, 1, 0, 0.9137255, 1,
1.03599, 0.6148143, -0.119744, 1, 0, 0.9058824, 1,
1.060365, 2.23893, -0.1208113, 1, 0, 0.9019608, 1,
1.064182, 0.902673, 0.6165423, 1, 0, 0.8941177, 1,
1.076518, 0.8204268, 2.448214, 1, 0, 0.8862745, 1,
1.076649, 0.230352, 2.618659, 1, 0, 0.8823529, 1,
1.076685, -1.427391, 2.597063, 1, 0, 0.8745098, 1,
1.080015, -0.4417844, 3.383491, 1, 0, 0.8705882, 1,
1.083972, -0.08586909, 2.834284, 1, 0, 0.8627451, 1,
1.094344, 1.040896, 2.123763, 1, 0, 0.8588235, 1,
1.115929, -1.322822, 1.813251, 1, 0, 0.8509804, 1,
1.116493, 1.107604, 0.8690797, 1, 0, 0.8470588, 1,
1.123405, -0.04250636, 1.54611, 1, 0, 0.8392157, 1,
1.124146, -0.5283697, 3.187712, 1, 0, 0.8352941, 1,
1.1251, 0.0890548, 3.049613, 1, 0, 0.827451, 1,
1.126248, 0.06478309, 1.582936, 1, 0, 0.8235294, 1,
1.129361, 1.240462, 2.601481, 1, 0, 0.8156863, 1,
1.131824, 1.324379, 0.3303879, 1, 0, 0.8117647, 1,
1.134477, -0.05036513, 0.5956078, 1, 0, 0.8039216, 1,
1.136741, 0.9029731, 4.43371, 1, 0, 0.7960784, 1,
1.136798, -1.210043, 2.596488, 1, 0, 0.7921569, 1,
1.141937, -0.2312236, 2.180303, 1, 0, 0.7843137, 1,
1.141979, -0.8458114, 3.81005, 1, 0, 0.7803922, 1,
1.146712, -0.0636403, 2.783526, 1, 0, 0.772549, 1,
1.149984, 0.4059061, 2.543574, 1, 0, 0.7686275, 1,
1.173097, -1.500969, 2.484856, 1, 0, 0.7607843, 1,
1.176742, -0.087449, 0.3013411, 1, 0, 0.7568628, 1,
1.183431, 0.1671998, 0.7826284, 1, 0, 0.7490196, 1,
1.191832, -0.1123937, 0.8326382, 1, 0, 0.7450981, 1,
1.19783, -1.083724, 0.9987408, 1, 0, 0.7372549, 1,
1.21178, -0.2014723, 2.201252, 1, 0, 0.7333333, 1,
1.218578, 0.8625111, 0.2293759, 1, 0, 0.7254902, 1,
1.222052, -0.1948123, 1.574818, 1, 0, 0.7215686, 1,
1.228602, -0.8019735, 1.501714, 1, 0, 0.7137255, 1,
1.246782, -0.4906371, 3.208353, 1, 0, 0.7098039, 1,
1.246782, 1.354378, 1.69228, 1, 0, 0.7019608, 1,
1.258596, 1.235545, 0.5115979, 1, 0, 0.6941177, 1,
1.26233, -1.043665, 2.002307, 1, 0, 0.6901961, 1,
1.264538, -0.1666391, 1.15718, 1, 0, 0.682353, 1,
1.264722, 0.9295971, 0.9960623, 1, 0, 0.6784314, 1,
1.267212, -0.5666971, 2.082594, 1, 0, 0.6705883, 1,
1.267388, -0.2341116, 1.550633, 1, 0, 0.6666667, 1,
1.276696, -1.086902, 1.658463, 1, 0, 0.6588235, 1,
1.27693, -0.8836643, 1.73432, 1, 0, 0.654902, 1,
1.282065, 0.3183458, 1.270035, 1, 0, 0.6470588, 1,
1.286677, -1.020282, 4.562808, 1, 0, 0.6431373, 1,
1.290352, 0.1831646, -0.02693091, 1, 0, 0.6352941, 1,
1.293685, 1.468498, 0.1806082, 1, 0, 0.6313726, 1,
1.302709, 0.9407115, 0.8424437, 1, 0, 0.6235294, 1,
1.313061, 0.781786, 0.7498983, 1, 0, 0.6196079, 1,
1.324327, -1.342126, 1.904297, 1, 0, 0.6117647, 1,
1.337402, -0.7571928, 0.4560614, 1, 0, 0.6078432, 1,
1.343492, -0.7281231, 3.354445, 1, 0, 0.6, 1,
1.347681, 0.6756323, 1.23215, 1, 0, 0.5921569, 1,
1.356951, -0.4525556, 2.014128, 1, 0, 0.5882353, 1,
1.361443, 1.544692, 0.3600263, 1, 0, 0.5803922, 1,
1.368593, -0.9939597, 2.361226, 1, 0, 0.5764706, 1,
1.369155, 0.5004383, 2.07648, 1, 0, 0.5686275, 1,
1.370126, -1.068794, 3.174481, 1, 0, 0.5647059, 1,
1.379666, -1.429165, 2.237624, 1, 0, 0.5568628, 1,
1.401791, -0.3731278, 3.720547, 1, 0, 0.5529412, 1,
1.408992, -0.6077873, 1.534171, 1, 0, 0.5450981, 1,
1.409204, 2.024859, 1.300538, 1, 0, 0.5411765, 1,
1.423665, 0.6034352, 1.085989, 1, 0, 0.5333334, 1,
1.426268, -1.373277, 3.606527, 1, 0, 0.5294118, 1,
1.434008, -0.6660908, 0.9358032, 1, 0, 0.5215687, 1,
1.442891, -0.07093789, 2.391201, 1, 0, 0.5176471, 1,
1.448913, -0.5007135, 1.721515, 1, 0, 0.509804, 1,
1.454487, 1.494692, -1.153637, 1, 0, 0.5058824, 1,
1.456234, 0.3815005, 2.220952, 1, 0, 0.4980392, 1,
1.459981, 0.7684847, -1.521597, 1, 0, 0.4901961, 1,
1.476593, 0.2806517, -0.5160168, 1, 0, 0.4862745, 1,
1.478479, 1.664603, 1.151798, 1, 0, 0.4784314, 1,
1.479497, -0.127469, 1.428725, 1, 0, 0.4745098, 1,
1.480289, -0.05791944, 2.580481, 1, 0, 0.4666667, 1,
1.482811, 0.4965448, 2.776218, 1, 0, 0.4627451, 1,
1.484779, -0.232796, 0.5848228, 1, 0, 0.454902, 1,
1.49374, 0.6942084, 2.079998, 1, 0, 0.4509804, 1,
1.496037, -2.55022, 2.21014, 1, 0, 0.4431373, 1,
1.502125, -0.4531748, 1.719608, 1, 0, 0.4392157, 1,
1.502876, -1.507852, 4.677958, 1, 0, 0.4313726, 1,
1.508608, -0.1001386, 1.870808, 1, 0, 0.427451, 1,
1.523223, 0.7108281, 0.7667735, 1, 0, 0.4196078, 1,
1.53394, -1.31006, 2.082425, 1, 0, 0.4156863, 1,
1.545913, -0.1944413, 1.062416, 1, 0, 0.4078431, 1,
1.547599, 0.5234202, 0.6785343, 1, 0, 0.4039216, 1,
1.564165, -2.957258, 2.974144, 1, 0, 0.3960784, 1,
1.565102, -0.1935739, 0.9137798, 1, 0, 0.3882353, 1,
1.565356, 1.069329, 1.876023, 1, 0, 0.3843137, 1,
1.572572, -0.8266515, 2.935746, 1, 0, 0.3764706, 1,
1.590678, -0.3946522, 1.064403, 1, 0, 0.372549, 1,
1.60693, -1.209396, 1.395719, 1, 0, 0.3647059, 1,
1.607822, 0.05419143, 2.139693, 1, 0, 0.3607843, 1,
1.614076, -0.0512071, 3.058345, 1, 0, 0.3529412, 1,
1.619234, -1.781533, 3.687575, 1, 0, 0.3490196, 1,
1.632524, 0.09942677, 0.8569439, 1, 0, 0.3411765, 1,
1.637788, -0.1432156, 0.6342589, 1, 0, 0.3372549, 1,
1.655316, 1.473198, -0.2900492, 1, 0, 0.3294118, 1,
1.659311, 0.5350404, 2.20083, 1, 0, 0.3254902, 1,
1.670281, 1.15596, 1.197846, 1, 0, 0.3176471, 1,
1.671081, -0.529018, 2.346215, 1, 0, 0.3137255, 1,
1.678607, -1.628836, 3.643509, 1, 0, 0.3058824, 1,
1.678623, -0.2077875, 3.162492, 1, 0, 0.2980392, 1,
1.695631, 0.9462267, -1.219288, 1, 0, 0.2941177, 1,
1.704053, -0.1002107, 0.8460795, 1, 0, 0.2862745, 1,
1.710238, -1.498468, 3.482273, 1, 0, 0.282353, 1,
1.739314, -2.150862, 1.223156, 1, 0, 0.2745098, 1,
1.749625, 1.056807, -0.1889581, 1, 0, 0.2705882, 1,
1.767254, -1.926591, 3.642827, 1, 0, 0.2627451, 1,
1.777274, 0.5905893, 1.606622, 1, 0, 0.2588235, 1,
1.790752, -1.232401, 0.4245017, 1, 0, 0.2509804, 1,
1.797891, -0.3272379, 2.181705, 1, 0, 0.2470588, 1,
1.800969, 0.7175024, 1.451764, 1, 0, 0.2392157, 1,
1.82504, -0.622609, 1.365393, 1, 0, 0.2352941, 1,
1.852809, 1.485222, -1.128415, 1, 0, 0.227451, 1,
1.8827, 2.313155, 0.7897159, 1, 0, 0.2235294, 1,
1.888056, -2.088257, 2.571688, 1, 0, 0.2156863, 1,
1.896393, -0.2660791, 1.696237, 1, 0, 0.2117647, 1,
1.901247, 1.150974, 0.0397649, 1, 0, 0.2039216, 1,
1.922137, -1.079509, 2.105745, 1, 0, 0.1960784, 1,
1.933056, -0.3539358, 1.236737, 1, 0, 0.1921569, 1,
1.935545, -0.09479964, 1.034462, 1, 0, 0.1843137, 1,
1.936156, 0.9449588, 2.23065, 1, 0, 0.1803922, 1,
1.957357, -1.330142, 2.356066, 1, 0, 0.172549, 1,
1.976076, -0.802521, 2.121442, 1, 0, 0.1686275, 1,
1.993532, -1.427753, 2.659089, 1, 0, 0.1607843, 1,
2.038123, -0.1230185, 2.245164, 1, 0, 0.1568628, 1,
2.03819, -0.3092774, 1.264132, 1, 0, 0.1490196, 1,
2.041094, 1.487689, 1.80515, 1, 0, 0.145098, 1,
2.045976, 0.3720069, 1.19851, 1, 0, 0.1372549, 1,
2.053423, 0.5013149, 0.3250358, 1, 0, 0.1333333, 1,
2.061389, 0.05963331, 1.510943, 1, 0, 0.1254902, 1,
2.103207, -0.1907783, 3.314949, 1, 0, 0.1215686, 1,
2.108618, 0.9582161, 0.513535, 1, 0, 0.1137255, 1,
2.113911, -0.1816384, 1.443769, 1, 0, 0.1098039, 1,
2.175447, 0.7816613, 0.1073872, 1, 0, 0.1019608, 1,
2.217656, 0.3435438, 2.302386, 1, 0, 0.09411765, 1,
2.230577, 0.9569213, 2.369804, 1, 0, 0.09019608, 1,
2.23173, -1.492537, 2.928955, 1, 0, 0.08235294, 1,
2.253058, -0.5771827, 0.4061328, 1, 0, 0.07843138, 1,
2.331094, 0.6067901, 2.679636, 1, 0, 0.07058824, 1,
2.354236, 0.84523, 0.8313043, 1, 0, 0.06666667, 1,
2.415207, -0.3157348, 3.418007, 1, 0, 0.05882353, 1,
2.441652, -2.626657, 3.164628, 1, 0, 0.05490196, 1,
2.459505, -0.1262411, 1.412963, 1, 0, 0.04705882, 1,
2.488338, 0.6993498, 2.007154, 1, 0, 0.04313726, 1,
2.607485, 1.376906, 0.4580477, 1, 0, 0.03529412, 1,
2.634424, 0.7188355, 1.09066, 1, 0, 0.03137255, 1,
2.778283, 0.1336929, 1.078124, 1, 0, 0.02352941, 1,
2.813884, 0.551748, -0.5514884, 1, 0, 0.01960784, 1,
3.090539, -1.262487, 2.732091, 1, 0, 0.01176471, 1,
3.149629, -1.434518, 3.006056, 1, 0, 0.007843138, 1
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
0.09234071, -4.16861, -7.189225, 0, -0.5, 0.5, 0.5,
0.09234071, -4.16861, -7.189225, 1, -0.5, 0.5, 0.5,
0.09234071, -4.16861, -7.189225, 1, 1.5, 0.5, 0.5,
0.09234071, -4.16861, -7.189225, 0, 1.5, 0.5, 0.5
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
-4.001368, 0.1606138, -7.189225, 0, -0.5, 0.5, 0.5,
-4.001368, 0.1606138, -7.189225, 1, -0.5, 0.5, 0.5,
-4.001368, 0.1606138, -7.189225, 1, 1.5, 0.5, 0.5,
-4.001368, 0.1606138, -7.189225, 0, 1.5, 0.5, 0.5
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
-4.001368, -4.16861, -0.2079024, 0, -0.5, 0.5, 0.5,
-4.001368, -4.16861, -0.2079024, 1, -0.5, 0.5, 0.5,
-4.001368, -4.16861, -0.2079024, 1, 1.5, 0.5, 0.5,
-4.001368, -4.16861, -0.2079024, 0, 1.5, 0.5, 0.5
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
-2, -3.169558, -5.57815,
3, -3.169558, -5.57815,
-2, -3.169558, -5.57815,
-2, -3.336066, -5.846663,
-1, -3.169558, -5.57815,
-1, -3.336066, -5.846663,
0, -3.169558, -5.57815,
0, -3.336066, -5.846663,
1, -3.169558, -5.57815,
1, -3.336066, -5.846663,
2, -3.169558, -5.57815,
2, -3.336066, -5.846663,
3, -3.169558, -5.57815,
3, -3.336066, -5.846663
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
-2, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
-2, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
-2, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
-2, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5,
-1, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
-1, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
-1, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
-1, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5,
0, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
0, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
0, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
0, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5,
1, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
1, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
1, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
1, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5,
2, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
2, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
2, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
2, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5,
3, -3.669084, -6.383687, 0, -0.5, 0.5, 0.5,
3, -3.669084, -6.383687, 1, -0.5, 0.5, 0.5,
3, -3.669084, -6.383687, 1, 1.5, 0.5, 0.5,
3, -3.669084, -6.383687, 0, 1.5, 0.5, 0.5
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
-3.056666, -3, -5.57815,
-3.056666, 3, -5.57815,
-3.056666, -3, -5.57815,
-3.214116, -3, -5.846663,
-3.056666, -2, -5.57815,
-3.214116, -2, -5.846663,
-3.056666, -1, -5.57815,
-3.214116, -1, -5.846663,
-3.056666, 0, -5.57815,
-3.214116, 0, -5.846663,
-3.056666, 1, -5.57815,
-3.214116, 1, -5.846663,
-3.056666, 2, -5.57815,
-3.214116, 2, -5.846663,
-3.056666, 3, -5.57815,
-3.214116, 3, -5.846663
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
-3.529017, -3, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, -3, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, -3, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, -3, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, -2, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, -2, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, -2, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, -2, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, -1, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, -1, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, -1, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, -1, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, 0, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, 0, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, 0, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, 0, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, 1, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, 1, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, 1, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, 1, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, 2, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, 2, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, 2, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, 2, -6.383687, 0, 1.5, 0.5, 0.5,
-3.529017, 3, -6.383687, 0, -0.5, 0.5, 0.5,
-3.529017, 3, -6.383687, 1, -0.5, 0.5, 0.5,
-3.529017, 3, -6.383687, 1, 1.5, 0.5, 0.5,
-3.529017, 3, -6.383687, 0, 1.5, 0.5, 0.5
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
-3.056666, -3.169558, -4,
-3.056666, -3.169558, 4,
-3.056666, -3.169558, -4,
-3.214116, -3.336066, -4,
-3.056666, -3.169558, -2,
-3.214116, -3.336066, -2,
-3.056666, -3.169558, 0,
-3.214116, -3.336066, 0,
-3.056666, -3.169558, 2,
-3.214116, -3.336066, 2,
-3.056666, -3.169558, 4,
-3.214116, -3.336066, 4
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
-3.529017, -3.669084, -4, 0, -0.5, 0.5, 0.5,
-3.529017, -3.669084, -4, 1, -0.5, 0.5, 0.5,
-3.529017, -3.669084, -4, 1, 1.5, 0.5, 0.5,
-3.529017, -3.669084, -4, 0, 1.5, 0.5, 0.5,
-3.529017, -3.669084, -2, 0, -0.5, 0.5, 0.5,
-3.529017, -3.669084, -2, 1, -0.5, 0.5, 0.5,
-3.529017, -3.669084, -2, 1, 1.5, 0.5, 0.5,
-3.529017, -3.669084, -2, 0, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 0, 0, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 0, 1, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 0, 1, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 0, 0, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 2, 0, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 2, 1, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 2, 1, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 2, 0, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 4, 0, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 4, 1, -0.5, 0.5, 0.5,
-3.529017, -3.669084, 4, 1, 1.5, 0.5, 0.5,
-3.529017, -3.669084, 4, 0, 1.5, 0.5, 0.5
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
-3.056666, -3.169558, -5.57815,
-3.056666, 3.490786, -5.57815,
-3.056666, -3.169558, 5.162345,
-3.056666, 3.490786, 5.162345,
-3.056666, -3.169558, -5.57815,
-3.056666, -3.169558, 5.162345,
-3.056666, 3.490786, -5.57815,
-3.056666, 3.490786, 5.162345,
-3.056666, -3.169558, -5.57815,
3.241347, -3.169558, -5.57815,
-3.056666, -3.169558, 5.162345,
3.241347, -3.169558, 5.162345,
-3.056666, 3.490786, -5.57815,
3.241347, 3.490786, -5.57815,
-3.056666, 3.490786, 5.162345,
3.241347, 3.490786, 5.162345,
3.241347, -3.169558, -5.57815,
3.241347, 3.490786, -5.57815,
3.241347, -3.169558, 5.162345,
3.241347, 3.490786, 5.162345,
3.241347, -3.169558, -5.57815,
3.241347, -3.169558, 5.162345,
3.241347, 3.490786, -5.57815,
3.241347, 3.490786, 5.162345
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
var radius = 7.539976;
var distance = 33.54621;
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
mvMatrix.translate( -0.09234071, -0.1606138, 0.2079024 );
mvMatrix.scale( 1.294435, 1.224016, 0.7590311 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54621);
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
Ansar<-read.table("Ansar.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-2.964947, -0.9384111, -2.467625, 0, 0, 1, 1, 1,
-2.66529, -1.488715, -1.974398, 1, 0, 0, 1, 1,
-2.64777, -0.3975494, -2.764534, 1, 0, 0, 1, 1,
-2.585211, 0.758637, -1.520047, 1, 0, 0, 1, 1,
-2.572244, 0.5047551, -2.063303, 1, 0, 0, 1, 1,
-2.566509, 1.512928, -1.471395, 1, 0, 0, 1, 1,
-2.554891, 1.600996, -0.9748901, 0, 0, 0, 1, 1,
-2.553176, -1.592576, -2.729599, 0, 0, 0, 1, 1,
-2.543821, 0.5565634, -1.091634, 0, 0, 0, 1, 1,
-2.420095, -0.4572815, -3.355753, 0, 0, 0, 1, 1,
-2.371835, 0.2035924, -1.864635, 0, 0, 0, 1, 1,
-2.344048, -0.2991399, -1.378353, 0, 0, 0, 1, 1,
-2.317183, -0.1814435, -1.347569, 0, 0, 0, 1, 1,
-2.29385, 0.5862851, -2.806768, 1, 1, 1, 1, 1,
-2.260131, 0.3605041, -2.176909, 1, 1, 1, 1, 1,
-2.213997, 0.8601333, 0.268608, 1, 1, 1, 1, 1,
-2.133754, -1.281749, 0.04772304, 1, 1, 1, 1, 1,
-2.121058, -0.6097305, -1.424613, 1, 1, 1, 1, 1,
-2.089129, -1.070895, 0.1932324, 1, 1, 1, 1, 1,
-2.071829, -2.458255, -1.989458, 1, 1, 1, 1, 1,
-2.056723, 0.3315829, -1.478135, 1, 1, 1, 1, 1,
-2.055984, 3.39379, -0.08505931, 1, 1, 1, 1, 1,
-2.049973, -0.6731105, -3.540498, 1, 1, 1, 1, 1,
-2.042227, 0.7626259, -0.2852729, 1, 1, 1, 1, 1,
-2.018182, -0.2836239, -2.611704, 1, 1, 1, 1, 1,
-2.015127, -0.6850752, -3.199542, 1, 1, 1, 1, 1,
-2.003768, -1.664472, -2.223686, 1, 1, 1, 1, 1,
-1.99213, -0.01643668, -2.647579, 1, 1, 1, 1, 1,
-1.97529, 1.506202, 0.5755019, 0, 0, 1, 1, 1,
-1.966756, -0.1114662, -3.352107, 1, 0, 0, 1, 1,
-1.95889, 1.02946, -0.1822351, 1, 0, 0, 1, 1,
-1.957308, -1.050106, -0.9571705, 1, 0, 0, 1, 1,
-1.938919, 0.988851, -1.643052, 1, 0, 0, 1, 1,
-1.905272, -0.8269697, -2.760721, 1, 0, 0, 1, 1,
-1.889976, 1.436661, -3.38043, 0, 0, 0, 1, 1,
-1.88613, -1.751, -1.479823, 0, 0, 0, 1, 1,
-1.884724, 2.28317, 0.2971985, 0, 0, 0, 1, 1,
-1.874688, -0.5434653, -3.140913, 0, 0, 0, 1, 1,
-1.858229, 0.9450169, 1.249292, 0, 0, 0, 1, 1,
-1.849369, -1.030817, -5.334693, 0, 0, 0, 1, 1,
-1.840668, 0.7045721, -1.131106, 0, 0, 0, 1, 1,
-1.822841, 0.2687768, -1.978094, 1, 1, 1, 1, 1,
-1.822177, 1.357134, -1.454814, 1, 1, 1, 1, 1,
-1.81807, -2.035471, -2.135046, 1, 1, 1, 1, 1,
-1.813405, 1.750418, -1.382504, 1, 1, 1, 1, 1,
-1.809602, 0.3541376, -1.938053, 1, 1, 1, 1, 1,
-1.805241, -0.2074887, -0.5974976, 1, 1, 1, 1, 1,
-1.802278, -0.6611183, -2.380835, 1, 1, 1, 1, 1,
-1.798462, -0.2854078, -2.367999, 1, 1, 1, 1, 1,
-1.788614, -0.5575168, -2.203771, 1, 1, 1, 1, 1,
-1.772817, -0.4998221, 0.5889845, 1, 1, 1, 1, 1,
-1.754724, 0.0505033, -2.696827, 1, 1, 1, 1, 1,
-1.749156, -1.192858, -2.752582, 1, 1, 1, 1, 1,
-1.733, -0.5337884, -1.340315, 1, 1, 1, 1, 1,
-1.726598, 0.1801838, -1.620834, 1, 1, 1, 1, 1,
-1.716753, 0.2319084, -1.621629, 1, 1, 1, 1, 1,
-1.685087, 0.2492553, -3.680885, 0, 0, 1, 1, 1,
-1.679782, -0.9792932, -0.9188927, 1, 0, 0, 1, 1,
-1.677481, -0.1281878, -2.291509, 1, 0, 0, 1, 1,
-1.650672, -0.741325, -2.389858, 1, 0, 0, 1, 1,
-1.647182, -0.276749, -1.031312, 1, 0, 0, 1, 1,
-1.640916, 0.7362887, -0.1134223, 1, 0, 0, 1, 1,
-1.629331, -1.138864, -0.9226635, 0, 0, 0, 1, 1,
-1.60749, 0.4360876, -0.4633908, 0, 0, 0, 1, 1,
-1.597696, 1.452344, -2.992236, 0, 0, 0, 1, 1,
-1.597558, 0.357421, -2.494662, 0, 0, 0, 1, 1,
-1.591917, 0.6931366, -1.746438, 0, 0, 0, 1, 1,
-1.58128, -0.3221093, -0.5853775, 0, 0, 0, 1, 1,
-1.566589, -0.8304672, -1.385415, 0, 0, 0, 1, 1,
-1.562459, 1.194176, -2.708502, 1, 1, 1, 1, 1,
-1.558212, 0.4519447, -0.5328199, 1, 1, 1, 1, 1,
-1.551466, -1.686062, -3.008717, 1, 1, 1, 1, 1,
-1.549199, -0.02424283, -1.165816, 1, 1, 1, 1, 1,
-1.547845, 1.844569, -0.8551947, 1, 1, 1, 1, 1,
-1.535689, -1.537317, -3.994507, 1, 1, 1, 1, 1,
-1.525688, 0.9211555, -1.953744, 1, 1, 1, 1, 1,
-1.507899, -0.7089666, -1.289059, 1, 1, 1, 1, 1,
-1.505675, -1.268672, -2.747107, 1, 1, 1, 1, 1,
-1.503408, -1.082606, -2.190174, 1, 1, 1, 1, 1,
-1.49969, -0.8816987, -1.869969, 1, 1, 1, 1, 1,
-1.498493, 0.388126, -0.6725174, 1, 1, 1, 1, 1,
-1.497629, 0.04638955, -0.6119569, 1, 1, 1, 1, 1,
-1.488512, -1.205911, -2.642249, 1, 1, 1, 1, 1,
-1.48512, 0.4290945, -0.4280179, 1, 1, 1, 1, 1,
-1.471647, -0.7425126, -0.2751273, 0, 0, 1, 1, 1,
-1.464166, 1.063616, -1.585014, 1, 0, 0, 1, 1,
-1.453087, -0.2306281, -1.846623, 1, 0, 0, 1, 1,
-1.435777, -1.068725, -2.48469, 1, 0, 0, 1, 1,
-1.433226, 0.2172696, -0.1258049, 1, 0, 0, 1, 1,
-1.430183, -0.1885109, -0.9676584, 1, 0, 0, 1, 1,
-1.415772, 0.721919, -0.001025822, 0, 0, 0, 1, 1,
-1.415694, 0.3856312, -1.032762, 0, 0, 0, 1, 1,
-1.415691, 1.299331, -0.7875548, 0, 0, 0, 1, 1,
-1.410718, 0.6728866, 0.4591861, 0, 0, 0, 1, 1,
-1.405559, -2.084269, -1.756026, 0, 0, 0, 1, 1,
-1.398426, -1.114691, -2.730921, 0, 0, 0, 1, 1,
-1.392423, 0.3384981, -0.2282146, 0, 0, 0, 1, 1,
-1.391756, 2.444921, -0.1213362, 1, 1, 1, 1, 1,
-1.37919, 0.4567417, -3.158136, 1, 1, 1, 1, 1,
-1.377828, 0.7997638, -1.713925, 1, 1, 1, 1, 1,
-1.37756, 1.3811, -1.979108, 1, 1, 1, 1, 1,
-1.368313, 0.3799632, -2.123863, 1, 1, 1, 1, 1,
-1.357685, 0.706914, -1.209523, 1, 1, 1, 1, 1,
-1.350169, -0.1014625, -2.802131, 1, 1, 1, 1, 1,
-1.330102, 0.2823653, -1.746952, 1, 1, 1, 1, 1,
-1.329939, -2.504369, -3.147248, 1, 1, 1, 1, 1,
-1.317244, -0.02740052, -2.684192, 1, 1, 1, 1, 1,
-1.317107, 1.023168, -2.317967, 1, 1, 1, 1, 1,
-1.310664, -2.54494, -0.5834308, 1, 1, 1, 1, 1,
-1.287235, -1.749817, -2.557507, 1, 1, 1, 1, 1,
-1.282101, -2.392635, -3.75741, 1, 1, 1, 1, 1,
-1.273909, 0.32022, -0.398903, 1, 1, 1, 1, 1,
-1.269277, 1.307024, -0.7479025, 0, 0, 1, 1, 1,
-1.264241, -0.6197363, -0.3049647, 1, 0, 0, 1, 1,
-1.26197, -0.3495923, -2.661835, 1, 0, 0, 1, 1,
-1.255394, -0.6824242, -4.364404, 1, 0, 0, 1, 1,
-1.250966, 0.4462529, -1.345075, 1, 0, 0, 1, 1,
-1.245922, -0.5686582, -2.040797, 1, 0, 0, 1, 1,
-1.243433, -0.7956802, -2.46062, 0, 0, 0, 1, 1,
-1.225305, -1.390532, -2.623369, 0, 0, 0, 1, 1,
-1.222413, -1.015867, -1.616678, 0, 0, 0, 1, 1,
-1.200786, 0.5228897, -3.07007, 0, 0, 0, 1, 1,
-1.195768, 0.7809836, -1.946593, 0, 0, 0, 1, 1,
-1.195382, 0.1618336, -2.36346, 0, 0, 0, 1, 1,
-1.193427, -0.9870492, -1.617471, 0, 0, 0, 1, 1,
-1.188913, 0.7132322, -1.019635, 1, 1, 1, 1, 1,
-1.187972, 1.671578, -0.9464137, 1, 1, 1, 1, 1,
-1.184332, -0.5456412, -2.625091, 1, 1, 1, 1, 1,
-1.180789, 0.7708262, -2.466014, 1, 1, 1, 1, 1,
-1.175276, -0.6030247, -0.8659487, 1, 1, 1, 1, 1,
-1.172402, -0.837223, -1.792181, 1, 1, 1, 1, 1,
-1.159018, -0.1417666, -2.152425, 1, 1, 1, 1, 1,
-1.157833, -0.2355301, -2.089754, 1, 1, 1, 1, 1,
-1.149568, -0.09940185, -1.228701, 1, 1, 1, 1, 1,
-1.149137, -0.2406588, -2.809531, 1, 1, 1, 1, 1,
-1.148398, 0.6274649, -0.1262955, 1, 1, 1, 1, 1,
-1.140089, -1.12732, -2.881413, 1, 1, 1, 1, 1,
-1.13925, 1.04416, -2.727169, 1, 1, 1, 1, 1,
-1.135535, 0.006193244, -1.397719, 1, 1, 1, 1, 1,
-1.129138, 1.082785, -0.5299031, 1, 1, 1, 1, 1,
-1.126305, 0.4351605, -1.099841, 0, 0, 1, 1, 1,
-1.122975, 0.4254388, -1.276611, 1, 0, 0, 1, 1,
-1.1198, 0.6480829, -1.217054, 1, 0, 0, 1, 1,
-1.118631, 0.1031832, -1.502893, 1, 0, 0, 1, 1,
-1.112623, -0.09895279, -1.603052, 1, 0, 0, 1, 1,
-1.106355, 0.3871476, 1.347624, 1, 0, 0, 1, 1,
-1.100732, 1.072254, -1.590534, 0, 0, 0, 1, 1,
-1.097058, 0.8156196, -1.796877, 0, 0, 0, 1, 1,
-1.09647, 0.8304868, 0.08965702, 0, 0, 0, 1, 1,
-1.095675, 0.4116746, -1.243688, 0, 0, 0, 1, 1,
-1.090726, 1.449004, 1.0253, 0, 0, 0, 1, 1,
-1.088433, -1.091682, -1.747102, 0, 0, 0, 1, 1,
-1.08533, 1.937846, -0.05126987, 0, 0, 0, 1, 1,
-1.070301, 0.8400923, 0.2704146, 1, 1, 1, 1, 1,
-1.067505, 0.189459, -1.665873, 1, 1, 1, 1, 1,
-1.065504, -0.5669876, -2.304478, 1, 1, 1, 1, 1,
-1.059472, 0.2255509, -0.9415218, 1, 1, 1, 1, 1,
-1.05479, -0.7539451, -0.8598328, 1, 1, 1, 1, 1,
-1.054042, 0.6321542, -1.844989, 1, 1, 1, 1, 1,
-1.052599, 0.8052106, -1.589841, 1, 1, 1, 1, 1,
-1.04819, -0.2727815, -1.580409, 1, 1, 1, 1, 1,
-1.04134, 0.8357747, 0.6901122, 1, 1, 1, 1, 1,
-1.038224, -0.6583735, -2.040717, 1, 1, 1, 1, 1,
-1.031039, 0.4326587, -1.353186, 1, 1, 1, 1, 1,
-1.02625, -2.452295, -3.301055, 1, 1, 1, 1, 1,
-1.023732, 0.07149341, -2.023621, 1, 1, 1, 1, 1,
-1.02319, 1.232424, 0.6805432, 1, 1, 1, 1, 1,
-1.019787, 1.159886, -1.325328, 1, 1, 1, 1, 1,
-1.01937, 1.334902, -0.459041, 0, 0, 1, 1, 1,
-1.006968, 0.2961406, -2.069221, 1, 0, 0, 1, 1,
-1.006691, -0.4493428, -2.860933, 1, 0, 0, 1, 1,
-1.002518, -1.084102, -2.74013, 1, 0, 0, 1, 1,
-1.001407, -0.2836225, -1.81206, 1, 0, 0, 1, 1,
-0.9975827, 0.9449965, -0.05648394, 1, 0, 0, 1, 1,
-0.9940177, 1.787983, -2.04944, 0, 0, 0, 1, 1,
-0.9930872, 0.2611328, 0.493554, 0, 0, 0, 1, 1,
-0.9927675, 0.3645723, -1.046058, 0, 0, 0, 1, 1,
-0.9911374, -0.839784, -2.548833, 0, 0, 0, 1, 1,
-0.9805203, 0.6510434, -2.63119, 0, 0, 0, 1, 1,
-0.9798292, -0.1027665, -1.877512, 0, 0, 0, 1, 1,
-0.9685289, -0.4992176, -1.130215, 0, 0, 0, 1, 1,
-0.9672078, 0.4252429, -1.779698, 1, 1, 1, 1, 1,
-0.9667678, -1.069735, -2.507495, 1, 1, 1, 1, 1,
-0.9620742, 0.3964764, -1.649794, 1, 1, 1, 1, 1,
-0.9566172, -1.962275, -3.158745, 1, 1, 1, 1, 1,
-0.9516783, 0.1164354, -1.443055, 1, 1, 1, 1, 1,
-0.9504231, 1.039395, -2.056963, 1, 1, 1, 1, 1,
-0.941641, -1.264256, -2.398087, 1, 1, 1, 1, 1,
-0.9409279, 1.0571, -0.4777427, 1, 1, 1, 1, 1,
-0.9387105, 1.320907, -0.3108871, 1, 1, 1, 1, 1,
-0.9377595, 0.7947691, -1.389973, 1, 1, 1, 1, 1,
-0.9252396, -0.183146, -1.663562, 1, 1, 1, 1, 1,
-0.9210302, 0.07028027, -0.3131908, 1, 1, 1, 1, 1,
-0.9197568, -1.556548, -4.510332, 1, 1, 1, 1, 1,
-0.919217, 0.7255437, -0.6489161, 1, 1, 1, 1, 1,
-0.9155437, 0.07934494, -1.111382, 1, 1, 1, 1, 1,
-0.915436, 0.5863295, -2.305704, 0, 0, 1, 1, 1,
-0.9072479, -0.3598239, -0.04711039, 1, 0, 0, 1, 1,
-0.902073, 0.5678306, -1.054596, 1, 0, 0, 1, 1,
-0.8936272, -0.8346716, -1.075333, 1, 0, 0, 1, 1,
-0.8927574, 0.3892869, -1.014712, 1, 0, 0, 1, 1,
-0.8898295, 0.9276349, -1.26096, 1, 0, 0, 1, 1,
-0.8867598, 1.579389, -0.1651665, 0, 0, 0, 1, 1,
-0.8784491, 1.255464, -0.04491763, 0, 0, 0, 1, 1,
-0.8714046, -0.5179071, -2.524269, 0, 0, 0, 1, 1,
-0.8599491, -0.2311365, -1.345288, 0, 0, 0, 1, 1,
-0.8597925, -0.8187437, -1.888239, 0, 0, 0, 1, 1,
-0.8590524, -1.487235, -4.33037, 0, 0, 0, 1, 1,
-0.8530689, 0.7912875, 0.544414, 0, 0, 0, 1, 1,
-0.8504487, 1.748478, 0.2084668, 1, 1, 1, 1, 1,
-0.8498356, -0.6588668, -2.784671, 1, 1, 1, 1, 1,
-0.8487323, 0.2110062, 0.09625469, 1, 1, 1, 1, 1,
-0.8484888, -0.9705084, -2.343157, 1, 1, 1, 1, 1,
-0.8464331, -0.191177, -0.4474966, 1, 1, 1, 1, 1,
-0.8453848, -0.6464381, -0.7160592, 1, 1, 1, 1, 1,
-0.8445058, 0.3646763, -1.238466, 1, 1, 1, 1, 1,
-0.8443041, -0.5871039, -2.390691, 1, 1, 1, 1, 1,
-0.8419479, 0.9777682, -1.536074, 1, 1, 1, 1, 1,
-0.8365547, -2.052398, -4.525016, 1, 1, 1, 1, 1,
-0.8349048, 1.232223, -0.3432916, 1, 1, 1, 1, 1,
-0.8325439, -0.7875199, -2.79007, 1, 1, 1, 1, 1,
-0.827147, -0.02919944, -1.140366, 1, 1, 1, 1, 1,
-0.822331, -0.07407071, -1.032298, 1, 1, 1, 1, 1,
-0.8215575, 0.2969614, -0.7372928, 1, 1, 1, 1, 1,
-0.818031, -0.8835059, -2.260609, 0, 0, 1, 1, 1,
-0.8160562, -1.023428, -1.576929, 1, 0, 0, 1, 1,
-0.8143952, 0.170737, -1.861454, 1, 0, 0, 1, 1,
-0.8051766, -0.8881589, -2.418817, 1, 0, 0, 1, 1,
-0.8029881, 0.08840232, -2.716516, 1, 0, 0, 1, 1,
-0.8027327, -0.9345341, -2.295333, 1, 0, 0, 1, 1,
-0.7959675, 0.4922404, -0.5743085, 0, 0, 0, 1, 1,
-0.7936183, -0.09836025, -2.268349, 0, 0, 0, 1, 1,
-0.790551, -1.585364, -1.634374, 0, 0, 0, 1, 1,
-0.7883638, 0.5935401, -1.121643, 0, 0, 0, 1, 1,
-0.7859852, 0.2311032, -1.035373, 0, 0, 0, 1, 1,
-0.7824217, -1.204485, -1.807436, 0, 0, 0, 1, 1,
-0.7817258, 1.770734, -0.9748418, 0, 0, 0, 1, 1,
-0.7780355, 0.3722737, -0.3180234, 1, 1, 1, 1, 1,
-0.7696695, -0.1572088, -1.243367, 1, 1, 1, 1, 1,
-0.7662353, -0.9151776, -1.34919, 1, 1, 1, 1, 1,
-0.7661036, 0.3151931, 0.3228289, 1, 1, 1, 1, 1,
-0.7609511, 0.02187846, 0.04134168, 1, 1, 1, 1, 1,
-0.7604133, -0.8534836, -1.335903, 1, 1, 1, 1, 1,
-0.7563828, 0.702462, 0.7527757, 1, 1, 1, 1, 1,
-0.7496179, 0.5294448, -3.796656, 1, 1, 1, 1, 1,
-0.7472055, -0.9908093, -2.026409, 1, 1, 1, 1, 1,
-0.7399206, -0.9482775, -2.402352, 1, 1, 1, 1, 1,
-0.7369236, -0.2456463, -2.724425, 1, 1, 1, 1, 1,
-0.7361161, -1.335592, -1.954692, 1, 1, 1, 1, 1,
-0.7347865, -1.750649, -2.261791, 1, 1, 1, 1, 1,
-0.731311, 0.03896302, -2.074968, 1, 1, 1, 1, 1,
-0.7289221, -0.5088912, -3.567158, 1, 1, 1, 1, 1,
-0.7289128, -0.9865706, -4.00063, 0, 0, 1, 1, 1,
-0.7255546, -0.2900232, -2.840681, 1, 0, 0, 1, 1,
-0.7194268, -0.9702743, -3.159013, 1, 0, 0, 1, 1,
-0.7150155, -0.9975766, -1.067826, 1, 0, 0, 1, 1,
-0.7109756, 0.8601674, -1.299973, 1, 0, 0, 1, 1,
-0.7098304, -0.8006449, -3.820308, 1, 0, 0, 1, 1,
-0.707316, -0.4310374, -1.33602, 0, 0, 0, 1, 1,
-0.7071553, 0.5789808, 0.4522069, 0, 0, 0, 1, 1,
-0.7048264, 0.7592152, -1.075601, 0, 0, 0, 1, 1,
-0.703901, -0.5368134, -2.739952, 0, 0, 0, 1, 1,
-0.7031719, -1.862246, -2.096264, 0, 0, 0, 1, 1,
-0.6983005, -2.005053, -4.68778, 0, 0, 0, 1, 1,
-0.6950456, -1.779602, -1.793126, 0, 0, 0, 1, 1,
-0.6871101, -1.612291, -2.397131, 1, 1, 1, 1, 1,
-0.6857229, 0.4920197, -1.452063, 1, 1, 1, 1, 1,
-0.6734521, -0.8935104, -2.327161, 1, 1, 1, 1, 1,
-0.6716768, 0.436072, -0.4233709, 1, 1, 1, 1, 1,
-0.6707561, 0.7835015, -0.07098629, 1, 1, 1, 1, 1,
-0.66927, 1.76168, -0.9782993, 1, 1, 1, 1, 1,
-0.6664785, -0.109714, -3.055701, 1, 1, 1, 1, 1,
-0.6634255, -1.212658, -2.044398, 1, 1, 1, 1, 1,
-0.6573335, -0.9680892, -0.2844099, 1, 1, 1, 1, 1,
-0.6549183, -0.5869181, -1.871005, 1, 1, 1, 1, 1,
-0.6529428, 1.1931, 0.4144377, 1, 1, 1, 1, 1,
-0.6490635, 0.4350215, -0.3568548, 1, 1, 1, 1, 1,
-0.6474667, -0.0014643, -2.413443, 1, 1, 1, 1, 1,
-0.6462976, -0.6952457, -0.7818288, 1, 1, 1, 1, 1,
-0.6461123, 1.85932, -0.08342514, 1, 1, 1, 1, 1,
-0.6426959, 0.2729104, -0.9522118, 0, 0, 1, 1, 1,
-0.6423079, 0.4153199, -3.136219, 1, 0, 0, 1, 1,
-0.6422154, -2.121213, -1.963096, 1, 0, 0, 1, 1,
-0.637827, 1.041085, -1.240078, 1, 0, 0, 1, 1,
-0.6202471, -1.719002, -3.300749, 1, 0, 0, 1, 1,
-0.615407, -0.300785, -1.183864, 1, 0, 0, 1, 1,
-0.6143902, -0.864696, -0.969372, 0, 0, 0, 1, 1,
-0.6123744, 0.2026793, -1.096085, 0, 0, 0, 1, 1,
-0.6096223, 2.383085, -0.04543659, 0, 0, 0, 1, 1,
-0.6036056, 0.232964, -1.134532, 0, 0, 0, 1, 1,
-0.6023886, -0.4779649, -2.191259, 0, 0, 0, 1, 1,
-0.5983685, 0.3525508, -2.757479, 0, 0, 0, 1, 1,
-0.5980245, -0.1263978, -1.64337, 0, 0, 0, 1, 1,
-0.5978008, -1.480716, -2.848879, 1, 1, 1, 1, 1,
-0.5976018, 1.306782, -0.3647913, 1, 1, 1, 1, 1,
-0.5925096, -1.168665, -2.780332, 1, 1, 1, 1, 1,
-0.5919144, -1.144071, -1.847569, 1, 1, 1, 1, 1,
-0.5913897, 1.572919, 1.725337, 1, 1, 1, 1, 1,
-0.5898614, -0.8493548, -2.653261, 1, 1, 1, 1, 1,
-0.5854007, 0.4119204, -1.063569, 1, 1, 1, 1, 1,
-0.5847551, -0.3519337, -1.981982, 1, 1, 1, 1, 1,
-0.582745, -0.732527, -2.253264, 1, 1, 1, 1, 1,
-0.5802871, 1.072708, 1.066527, 1, 1, 1, 1, 1,
-0.5798462, -0.118094, -1.748424, 1, 1, 1, 1, 1,
-0.5795082, 1.283647, 0.009922382, 1, 1, 1, 1, 1,
-0.5733299, -0.8539644, -3.407291, 1, 1, 1, 1, 1,
-0.5720944, -0.9203558, -2.873194, 1, 1, 1, 1, 1,
-0.5709876, 1.335882, 0.1923964, 1, 1, 1, 1, 1,
-0.5647345, 1.088647, -1.174816, 0, 0, 1, 1, 1,
-0.555722, 0.01040567, -1.913693, 1, 0, 0, 1, 1,
-0.5537754, 0.9101936, -2.42834, 1, 0, 0, 1, 1,
-0.5477882, -1.928176, -3.661906, 1, 0, 0, 1, 1,
-0.5472554, 0.7649298, -1.32947, 1, 0, 0, 1, 1,
-0.5437601, -0.9275736, -4.331011, 1, 0, 0, 1, 1,
-0.5390692, 0.1338013, -2.65275, 0, 0, 0, 1, 1,
-0.5348758, -0.2896773, -1.030717, 0, 0, 0, 1, 1,
-0.5315735, 1.823074, 0.5540288, 0, 0, 0, 1, 1,
-0.5232682, 1.828997, -0.6004198, 0, 0, 0, 1, 1,
-0.5047802, 0.7167344, 0.5389071, 0, 0, 0, 1, 1,
-0.5041758, 0.6254291, -0.04253379, 0, 0, 0, 1, 1,
-0.5021972, 0.5830472, 0.4294764, 0, 0, 0, 1, 1,
-0.5007853, -0.1126717, -3.263793, 1, 1, 1, 1, 1,
-0.4976224, 1.048178, -1.019513, 1, 1, 1, 1, 1,
-0.4964173, -1.333214, -2.493644, 1, 1, 1, 1, 1,
-0.4906033, -0.4553775, -3.00089, 1, 1, 1, 1, 1,
-0.4866486, -0.7759367, -2.375, 1, 1, 1, 1, 1,
-0.4813033, 0.6578046, -0.8338155, 1, 1, 1, 1, 1,
-0.4784328, -1.540682, -2.447267, 1, 1, 1, 1, 1,
-0.4774826, -0.8988752, -3.116065, 1, 1, 1, 1, 1,
-0.477236, 0.5708513, 0.5057886, 1, 1, 1, 1, 1,
-0.4744709, -0.01063707, -3.07362, 1, 1, 1, 1, 1,
-0.4735905, -0.6807232, -3.612583, 1, 1, 1, 1, 1,
-0.4710915, 1.219764, -0.6199223, 1, 1, 1, 1, 1,
-0.470378, -1.792381, -3.820015, 1, 1, 1, 1, 1,
-0.4701987, -0.277359, -3.338852, 1, 1, 1, 1, 1,
-0.4679328, 0.6430896, -0.1177764, 1, 1, 1, 1, 1,
-0.4676301, -0.5021517, -2.12601, 0, 0, 1, 1, 1,
-0.4639693, -1.904737, -3.844393, 1, 0, 0, 1, 1,
-0.4634461, -3.00649, -2.404358, 1, 0, 0, 1, 1,
-0.4626588, 0.8253852, -1.417693, 1, 0, 0, 1, 1,
-0.4622575, -0.6804783, -2.33132, 1, 0, 0, 1, 1,
-0.4601699, 0.2955308, -1.923718, 1, 0, 0, 1, 1,
-0.4552122, -1.169992, -1.663488, 0, 0, 0, 1, 1,
-0.4537836, -0.5168421, -2.600314, 0, 0, 0, 1, 1,
-0.4526579, 1.357537, 1.291287, 0, 0, 0, 1, 1,
-0.4492934, 0.3218035, 0.6247615, 0, 0, 0, 1, 1,
-0.4485598, -1.131092, -1.778466, 0, 0, 0, 1, 1,
-0.4477111, 0.2684567, -1.280974, 0, 0, 0, 1, 1,
-0.4319767, -0.4840778, -2.867215, 0, 0, 0, 1, 1,
-0.4296876, 0.061666, -4.598893, 1, 1, 1, 1, 1,
-0.427749, 1.586248, 0.8989848, 1, 1, 1, 1, 1,
-0.4193385, -0.6567082, -3.842655, 1, 1, 1, 1, 1,
-0.4124072, 0.2181755, -0.01417598, 1, 1, 1, 1, 1,
-0.4108397, 1.720979, 2.3066, 1, 1, 1, 1, 1,
-0.4089147, 2.183119, 3.50128, 1, 1, 1, 1, 1,
-0.4075017, -0.191534, -2.162321, 1, 1, 1, 1, 1,
-0.407136, -0.945162, -3.004917, 1, 1, 1, 1, 1,
-0.4014491, -0.6128401, -1.311695, 1, 1, 1, 1, 1,
-0.394809, 0.1973743, 0.07107037, 1, 1, 1, 1, 1,
-0.3911664, 0.5095132, -0.9435523, 1, 1, 1, 1, 1,
-0.3899593, 1.918418, -0.6549678, 1, 1, 1, 1, 1,
-0.3889225, 0.4396459, 1.099368, 1, 1, 1, 1, 1,
-0.3887729, -1.132134, -3.166353, 1, 1, 1, 1, 1,
-0.3881787, -1.181527, -2.432684, 1, 1, 1, 1, 1,
-0.3773938, 0.5248646, -1.808717, 0, 0, 1, 1, 1,
-0.3764244, 0.005219633, -3.351044, 1, 0, 0, 1, 1,
-0.3763123, 0.5204845, -1.892737, 1, 0, 0, 1, 1,
-0.3761849, -1.103021, -3.645342, 1, 0, 0, 1, 1,
-0.3756823, 0.2809675, -2.818124, 1, 0, 0, 1, 1,
-0.3713481, -1.740726, -3.815519, 1, 0, 0, 1, 1,
-0.3708561, 0.3002777, 0.2666441, 0, 0, 0, 1, 1,
-0.3631911, -1.268546, -2.280672, 0, 0, 0, 1, 1,
-0.3608685, 0.7179192, -1.105676, 0, 0, 0, 1, 1,
-0.359203, 0.2366188, -0.3475077, 0, 0, 0, 1, 1,
-0.3541137, -2.080341, -1.5575, 0, 0, 0, 1, 1,
-0.3536963, -1.376419, -3.943086, 0, 0, 0, 1, 1,
-0.3530369, -0.2186545, -1.092213, 0, 0, 0, 1, 1,
-0.3529893, -0.01559978, -0.2510532, 1, 1, 1, 1, 1,
-0.3352229, 0.6133462, -1.019165, 1, 1, 1, 1, 1,
-0.3297046, 1.376393, -1.550352, 1, 1, 1, 1, 1,
-0.3250691, -0.4553522, -1.924447, 1, 1, 1, 1, 1,
-0.3170314, -0.03118176, -0.1315092, 1, 1, 1, 1, 1,
-0.3156856, 0.3518868, -1.339518, 1, 1, 1, 1, 1,
-0.3143652, -1.087443, -1.884216, 1, 1, 1, 1, 1,
-0.3118595, 0.3146196, -0.3577507, 1, 1, 1, 1, 1,
-0.3080033, -2.549635, -3.373899, 1, 1, 1, 1, 1,
-0.3013781, 0.07713389, -0.8585774, 1, 1, 1, 1, 1,
-0.3009385, 1.51873, -0.1098779, 1, 1, 1, 1, 1,
-0.3008847, -1.264655, -2.196189, 1, 1, 1, 1, 1,
-0.3008282, 0.7642215, 0.0241865, 1, 1, 1, 1, 1,
-0.300622, -0.6109173, -1.18805, 1, 1, 1, 1, 1,
-0.292109, -0.0008546369, -1.42628, 1, 1, 1, 1, 1,
-0.2867705, -0.5655091, -1.608409, 0, 0, 1, 1, 1,
-0.2845201, -0.5834693, -3.070772, 1, 0, 0, 1, 1,
-0.2838441, -2.039606, -3.855239, 1, 0, 0, 1, 1,
-0.2804247, -1.636361, -2.146496, 1, 0, 0, 1, 1,
-0.2770192, -0.2384653, -4.431547, 1, 0, 0, 1, 1,
-0.2753252, -1.534648, -5.421735, 1, 0, 0, 1, 1,
-0.2702079, 0.07496139, -1.285692, 0, 0, 0, 1, 1,
-0.2640137, 0.8548435, 0.6330557, 0, 0, 0, 1, 1,
-0.2484324, 0.8269842, -0.4335878, 0, 0, 0, 1, 1,
-0.2454071, -1.197955, -1.08143, 0, 0, 0, 1, 1,
-0.2430049, -1.512417, -2.15316, 0, 0, 0, 1, 1,
-0.2409124, 0.3215437, -0.2100951, 0, 0, 0, 1, 1,
-0.2363515, -0.004347499, -2.435177, 0, 0, 0, 1, 1,
-0.2282789, -0.2820213, -2.934011, 1, 1, 1, 1, 1,
-0.2225786, 0.1973754, -1.994721, 1, 1, 1, 1, 1,
-0.2177165, 2.297331, -0.4867787, 1, 1, 1, 1, 1,
-0.2102142, -1.000111, -2.158284, 1, 1, 1, 1, 1,
-0.2100049, -0.08272567, -2.803799, 1, 1, 1, 1, 1,
-0.209743, 0.9711787, 0.787046, 1, 1, 1, 1, 1,
-0.2071671, 2.646964, 1.897023, 1, 1, 1, 1, 1,
-0.2068012, -1.117201, -3.646954, 1, 1, 1, 1, 1,
-0.2060901, 0.05272751, -1.455416, 1, 1, 1, 1, 1,
-0.2040092, 1.451662, -0.7220909, 1, 1, 1, 1, 1,
-0.2025208, -2.636335, -2.279533, 1, 1, 1, 1, 1,
-0.201888, -1.461438, -1.535034, 1, 1, 1, 1, 1,
-0.1992656, 0.4873769, 1.516272, 1, 1, 1, 1, 1,
-0.1975804, -2.738986, -1.527137, 1, 1, 1, 1, 1,
-0.1971323, -0.141608, -2.290461, 1, 1, 1, 1, 1,
-0.1965515, 0.1102136, -1.393314, 0, 0, 1, 1, 1,
-0.1959233, 3.010878, 1.813149, 1, 0, 0, 1, 1,
-0.1925272, -0.2605497, -2.354091, 1, 0, 0, 1, 1,
-0.1906484, -0.2149474, -1.293138, 1, 0, 0, 1, 1,
-0.1861088, -1.321623, -2.71351, 1, 0, 0, 1, 1,
-0.1858633, -0.2873476, -2.374568, 1, 0, 0, 1, 1,
-0.1829968, 1.446765, 0.02945723, 0, 0, 0, 1, 1,
-0.1759437, -1.517857, -2.886059, 0, 0, 0, 1, 1,
-0.1747471, -1.813286, -1.143361, 0, 0, 0, 1, 1,
-0.1709925, 0.640808, -1.651873, 0, 0, 0, 1, 1,
-0.1693777, -0.2342133, -2.755664, 0, 0, 0, 1, 1,
-0.1614308, 0.8156473, 0.5700882, 0, 0, 0, 1, 1,
-0.1611139, -0.2109703, -3.928468, 0, 0, 0, 1, 1,
-0.1578862, -1.564713, -2.000068, 1, 1, 1, 1, 1,
-0.1569925, -0.2260276, -2.44862, 1, 1, 1, 1, 1,
-0.1551391, 0.2855001, 0.3224672, 1, 1, 1, 1, 1,
-0.1465841, -1.174908, -3.569016, 1, 1, 1, 1, 1,
-0.145886, -1.133635, -3.39446, 1, 1, 1, 1, 1,
-0.1458349, -0.5758345, -3.900184, 1, 1, 1, 1, 1,
-0.1403166, -0.7153376, -4.077916, 1, 1, 1, 1, 1,
-0.1356052, 0.07185316, -0.563298, 1, 1, 1, 1, 1,
-0.1233669, -0.8842803, -3.221657, 1, 1, 1, 1, 1,
-0.119984, -0.5586994, -1.672286, 1, 1, 1, 1, 1,
-0.1190296, -0.4497947, -3.434555, 1, 1, 1, 1, 1,
-0.1093458, -1.020986, -2.479756, 1, 1, 1, 1, 1,
-0.108954, 0.4508731, -0.876987, 1, 1, 1, 1, 1,
-0.1069181, -0.2156899, -1.702725, 1, 1, 1, 1, 1,
-0.106469, 1.074585, 1.061006, 1, 1, 1, 1, 1,
-0.1064569, 0.7066217, 0.5657195, 0, 0, 1, 1, 1,
-0.1038906, 1.095807, 0.5640231, 1, 0, 0, 1, 1,
-0.1031147, 0.177071, 0.1792939, 1, 0, 0, 1, 1,
-0.09982909, 1.420141, -1.601153, 1, 0, 0, 1, 1,
-0.09952123, -0.2533428, -3.365878, 1, 0, 0, 1, 1,
-0.08665107, -0.5126618, -4.724193, 1, 0, 0, 1, 1,
-0.08469612, 0.5787669, -0.8342103, 0, 0, 0, 1, 1,
-0.08315954, 0.5800518, -1.191447, 0, 0, 0, 1, 1,
-0.08263914, 2.214939, -1.876717, 0, 0, 0, 1, 1,
-0.08130453, -0.2525448, -3.890887, 0, 0, 0, 1, 1,
-0.07823539, -0.5326137, -3.345493, 0, 0, 0, 1, 1,
-0.0757763, -1.157172, -2.420016, 0, 0, 0, 1, 1,
-0.07166021, 1.747754, -0.356025, 0, 0, 0, 1, 1,
-0.06687327, 0.2982155, -0.3867963, 1, 1, 1, 1, 1,
-0.06395282, 0.2077019, -0.3569128, 1, 1, 1, 1, 1,
-0.06011081, -0.5342498, -2.793531, 1, 1, 1, 1, 1,
-0.05929376, 0.05704009, -1.274145, 1, 1, 1, 1, 1,
-0.05897876, -0.0243917, -2.467708, 1, 1, 1, 1, 1,
-0.05740778, 0.9949174, 1.623884, 1, 1, 1, 1, 1,
-0.0569378, -1.411448, -2.15982, 1, 1, 1, 1, 1,
-0.05658668, 0.1722307, 1.26376, 1, 1, 1, 1, 1,
-0.0542403, -0.1739891, -3.902373, 1, 1, 1, 1, 1,
-0.05115329, 0.7971373, -0.7006571, 1, 1, 1, 1, 1,
-0.05068457, 0.4211338, -0.3365681, 1, 1, 1, 1, 1,
-0.04102518, -2.081143, -4.492701, 1, 1, 1, 1, 1,
-0.03891365, 0.699261, 0.2614555, 1, 1, 1, 1, 1,
-0.038772, -2.213566, -1.716391, 1, 1, 1, 1, 1,
-0.0376538, 0.194621, -0.8251289, 1, 1, 1, 1, 1,
-0.03751679, -0.2572958, -2.596079, 0, 0, 1, 1, 1,
-0.0335629, 2.213798, 0.4813657, 1, 0, 0, 1, 1,
-0.03355982, -1.31431, -4.088295, 1, 0, 0, 1, 1,
-0.03225594, -0.747416, -2.418449, 1, 0, 0, 1, 1,
-0.03118735, -0.2353749, -4.230262, 1, 0, 0, 1, 1,
-0.02900684, -0.5181133, -2.943289, 1, 0, 0, 1, 1,
-0.01967947, 0.311024, -1.372942, 0, 0, 0, 1, 1,
-0.008675615, -0.1207559, -4.573799, 0, 0, 0, 1, 1,
-0.008140371, 0.2893459, 1.089582, 0, 0, 0, 1, 1,
-0.005849746, 0.5523004, -2.191778, 0, 0, 0, 1, 1,
-0.005741782, 1.382439, -1.281001, 0, 0, 0, 1, 1,
-0.00481532, -0.7689773, -2.53329, 0, 0, 0, 1, 1,
-0.0002538963, 1.22021, -0.1080102, 0, 0, 0, 1, 1,
0.000372433, -0.6442834, 4.270851, 1, 1, 1, 1, 1,
0.001837558, -0.5697819, 4.640768, 1, 1, 1, 1, 1,
0.001889569, -1.369822, 2.735382, 1, 1, 1, 1, 1,
0.005067656, -1.285745, 4.110296, 1, 1, 1, 1, 1,
0.01619247, -2.13459, 3.415444, 1, 1, 1, 1, 1,
0.02392351, -0.2423519, 4.334974, 1, 1, 1, 1, 1,
0.02462109, 0.3096515, 0.8908088, 1, 1, 1, 1, 1,
0.02624569, -1.096901, 4.888141, 1, 1, 1, 1, 1,
0.03408155, -0.4755067, 3.681715, 1, 1, 1, 1, 1,
0.0365976, 0.4304633, -1.829769, 1, 1, 1, 1, 1,
0.03990072, 2.177908, 0.878072, 1, 1, 1, 1, 1,
0.04112041, 0.7515239, -1.433643, 1, 1, 1, 1, 1,
0.04575014, -0.6407201, 3.858185, 1, 1, 1, 1, 1,
0.04649054, -0.3468756, 1.938374, 1, 1, 1, 1, 1,
0.06001822, 0.3283363, -1.353714, 1, 1, 1, 1, 1,
0.06144751, 0.8865876, -0.05159343, 0, 0, 1, 1, 1,
0.0665549, -2.155263, 3.0103, 1, 0, 0, 1, 1,
0.06835102, -0.9288394, 4.667625, 1, 0, 0, 1, 1,
0.07111403, -1.069509, 2.694913, 1, 0, 0, 1, 1,
0.07233838, 0.1737614, -0.5330672, 1, 0, 0, 1, 1,
0.07234675, -0.5025429, 3.350468, 1, 0, 0, 1, 1,
0.07409962, 0.8157884, 0.7582739, 0, 0, 0, 1, 1,
0.07595671, -1.104396, 1.396981, 0, 0, 0, 1, 1,
0.07821018, -1.591638, 2.450105, 0, 0, 0, 1, 1,
0.07898123, 0.8639388, -1.251767, 0, 0, 0, 1, 1,
0.07948226, 0.3358157, -1.78038, 0, 0, 0, 1, 1,
0.08288974, 0.8030943, 2.320898, 0, 0, 0, 1, 1,
0.08301783, -1.684731, 3.230114, 0, 0, 0, 1, 1,
0.08422606, 0.6182515, 0.5302831, 1, 1, 1, 1, 1,
0.08476567, 0.4654358, 0.01848146, 1, 1, 1, 1, 1,
0.08503564, -0.3915238, 1.980716, 1, 1, 1, 1, 1,
0.08568674, 0.5376614, 1.874066, 1, 1, 1, 1, 1,
0.08592685, 0.2508008, 0.8981466, 1, 1, 1, 1, 1,
0.08610331, -0.4582033, 5.00593, 1, 1, 1, 1, 1,
0.0867306, -1.159309, 2.961339, 1, 1, 1, 1, 1,
0.08831839, 0.3210795, 0.09427582, 1, 1, 1, 1, 1,
0.09260456, -0.2965292, 2.437586, 1, 1, 1, 1, 1,
0.09928552, -1.163145, 2.777908, 1, 1, 1, 1, 1,
0.1013673, 0.7929587, -0.1321575, 1, 1, 1, 1, 1,
0.1020972, -0.6705398, 1.511843, 1, 1, 1, 1, 1,
0.1022871, -0.5985152, 3.446685, 1, 1, 1, 1, 1,
0.1027052, 1.445049, 0.3751847, 1, 1, 1, 1, 1,
0.1043648, 0.2441728, 1.059462, 1, 1, 1, 1, 1,
0.1051456, 0.5377916, 0.4223474, 0, 0, 1, 1, 1,
0.1075847, -0.5720121, 3.205597, 1, 0, 0, 1, 1,
0.1086808, 0.2036158, -0.4851196, 1, 0, 0, 1, 1,
0.1109135, -0.3868169, 2.589804, 1, 0, 0, 1, 1,
0.1140164, -0.5307609, 3.157309, 1, 0, 0, 1, 1,
0.1154854, -1.849197, 2.840248, 1, 0, 0, 1, 1,
0.1155534, 0.1082911, 2.454444, 0, 0, 0, 1, 1,
0.1158301, 0.9492486, 0.908879, 0, 0, 0, 1, 1,
0.1159735, 1.403382, 1.359914, 0, 0, 0, 1, 1,
0.1173883, 0.6324821, -0.4577416, 0, 0, 0, 1, 1,
0.1180588, 0.2479532, 0.8688089, 0, 0, 0, 1, 1,
0.1192593, 1.549661, -0.2257966, 0, 0, 0, 1, 1,
0.1240125, -0.9682818, 1.959822, 0, 0, 0, 1, 1,
0.1256791, 0.3080973, 0.0986324, 1, 1, 1, 1, 1,
0.1265457, 0.9075392, -1.005568, 1, 1, 1, 1, 1,
0.1271529, -0.05451438, 2.551388, 1, 1, 1, 1, 1,
0.1324791, -1.513989, 2.282526, 1, 1, 1, 1, 1,
0.1328609, -0.5029753, 4.726965, 1, 1, 1, 1, 1,
0.1353491, 1.958632, -0.7167414, 1, 1, 1, 1, 1,
0.136395, -0.1678104, 4.22015, 1, 1, 1, 1, 1,
0.1366616, -0.4568393, 2.98034, 1, 1, 1, 1, 1,
0.1383086, 0.2772561, 2.250099, 1, 1, 1, 1, 1,
0.1420985, -0.1297233, 3.252649, 1, 1, 1, 1, 1,
0.1428813, -0.3745741, 2.827711, 1, 1, 1, 1, 1,
0.144061, 0.2923229, 1.20915, 1, 1, 1, 1, 1,
0.1472576, -1.139388, 1.921023, 1, 1, 1, 1, 1,
0.1584469, -1.524365, 2.56425, 1, 1, 1, 1, 1,
0.1589174, -1.284512, 4.132535, 1, 1, 1, 1, 1,
0.1605961, -1.110877, 4.642348, 0, 0, 1, 1, 1,
0.1630398, 0.6793427, 0.3665139, 1, 0, 0, 1, 1,
0.1635163, 0.02573792, 1.752037, 1, 0, 0, 1, 1,
0.1643835, -0.04253361, 1.28424, 1, 0, 0, 1, 1,
0.1645577, -1.538952, 2.682798, 1, 0, 0, 1, 1,
0.1669265, 0.8053669, 0.04085846, 1, 0, 0, 1, 1,
0.167641, 0.6516623, 0.8206244, 0, 0, 0, 1, 1,
0.1712564, -1.370468, 3.757608, 0, 0, 0, 1, 1,
0.1756139, -0.2817805, 2.745745, 0, 0, 0, 1, 1,
0.1761655, -1.02142, 3.021471, 0, 0, 0, 1, 1,
0.1768512, 0.1925916, 0.8255597, 0, 0, 0, 1, 1,
0.1770472, 0.3381055, 1.278961, 0, 0, 0, 1, 1,
0.1774249, -0.00974412, 0.7226617, 0, 0, 0, 1, 1,
0.1800568, 0.6725362, 0.337848, 1, 1, 1, 1, 1,
0.1845119, 0.5085171, -0.1513748, 1, 1, 1, 1, 1,
0.1860927, -0.9929771, 2.889376, 1, 1, 1, 1, 1,
0.1899403, 0.08577049, 1.157166, 1, 1, 1, 1, 1,
0.1919663, -1.197356, 2.458917, 1, 1, 1, 1, 1,
0.1979566, 1.458844, -0.6650509, 1, 1, 1, 1, 1,
0.198725, -2.140074, 2.974225, 1, 1, 1, 1, 1,
0.1990724, 0.5895392, -0.7811496, 1, 1, 1, 1, 1,
0.2024039, -0.318519, -0.5212494, 1, 1, 1, 1, 1,
0.2033364, 0.3691518, -0.5367518, 1, 1, 1, 1, 1,
0.2043994, 1.321641, 0.5031434, 1, 1, 1, 1, 1,
0.2056601, -0.7444908, 3.068674, 1, 1, 1, 1, 1,
0.2071085, 0.837448, 0.2858846, 1, 1, 1, 1, 1,
0.2078621, -1.594312, 1.370323, 1, 1, 1, 1, 1,
0.2138993, 0.1957443, 0.01470921, 1, 1, 1, 1, 1,
0.216269, 0.2283717, 0.2842973, 0, 0, 1, 1, 1,
0.2167661, -0.2733195, 2.301872, 1, 0, 0, 1, 1,
0.2178427, -0.5915447, 2.737266, 1, 0, 0, 1, 1,
0.2213607, -0.5417683, 3.338216, 1, 0, 0, 1, 1,
0.2222219, -0.5762896, 2.088939, 1, 0, 0, 1, 1,
0.2236354, -0.9553656, 2.903259, 1, 0, 0, 1, 1,
0.2270081, -0.5388529, 3.433753, 0, 0, 0, 1, 1,
0.227649, 0.7735636, 0.3942702, 0, 0, 0, 1, 1,
0.234116, 0.8643453, 0.8171306, 0, 0, 0, 1, 1,
0.2351772, -0.3140681, 1.071049, 0, 0, 0, 1, 1,
0.2384209, -1.167151, 3.527513, 0, 0, 0, 1, 1,
0.2396758, 1.310623, 0.6793882, 0, 0, 0, 1, 1,
0.2418228, -0.7485039, 2.158993, 0, 0, 0, 1, 1,
0.2461543, -0.4287347, 2.56238, 1, 1, 1, 1, 1,
0.2463182, -0.639044, 1.7622, 1, 1, 1, 1, 1,
0.2505756, 0.1362871, 2.057271, 1, 1, 1, 1, 1,
0.2512543, -0.6309594, 1.041723, 1, 1, 1, 1, 1,
0.2512917, -0.5218281, 2.820082, 1, 1, 1, 1, 1,
0.2529041, 3.307691, 0.7850336, 1, 1, 1, 1, 1,
0.256209, 0.52622, 0.1095765, 1, 1, 1, 1, 1,
0.2564153, 0.2857757, 1.766365, 1, 1, 1, 1, 1,
0.2575638, 0.5459917, -0.1624325, 1, 1, 1, 1, 1,
0.2674877, 0.5321599, -0.7112966, 1, 1, 1, 1, 1,
0.2681385, 0.6156241, -0.4360659, 1, 1, 1, 1, 1,
0.2799083, 1.113062, 0.2638859, 1, 1, 1, 1, 1,
0.2820848, 0.09186928, 0.2973752, 1, 1, 1, 1, 1,
0.2829575, -0.6818903, 2.258958, 1, 1, 1, 1, 1,
0.2878434, -1.428532, 2.55759, 1, 1, 1, 1, 1,
0.2906451, -0.02805781, 0.8687044, 0, 0, 1, 1, 1,
0.2911446, 0.1439049, 0.7434641, 1, 0, 0, 1, 1,
0.2917755, 0.7513056, 0.6369202, 1, 0, 0, 1, 1,
0.2941062, 0.4744435, -0.314166, 1, 0, 0, 1, 1,
0.2945618, -0.1211674, 0.8199754, 1, 0, 0, 1, 1,
0.2976699, -0.2787447, 2.708183, 1, 0, 0, 1, 1,
0.2978732, 0.3596824, 0.300595, 0, 0, 0, 1, 1,
0.2983129, 1.849035, -0.7911136, 0, 0, 0, 1, 1,
0.2997568, -0.2915892, 2.388123, 0, 0, 0, 1, 1,
0.3006911, 1.23551, -1.244828, 0, 0, 0, 1, 1,
0.3009248, -1.045233, 3.169556, 0, 0, 0, 1, 1,
0.307032, -0.260026, 3.177269, 0, 0, 0, 1, 1,
0.3175247, -0.04041567, 1.033779, 0, 0, 0, 1, 1,
0.3234889, 0.01986438, 2.24636, 1, 1, 1, 1, 1,
0.3243838, 1.384724, -0.4727911, 1, 1, 1, 1, 1,
0.3293933, -0.3985033, 3.630887, 1, 1, 1, 1, 1,
0.3302484, -1.43952, 1.297427, 1, 1, 1, 1, 1,
0.3317756, -0.3709504, 2.969723, 1, 1, 1, 1, 1,
0.3326037, 1.496611, -0.2444011, 1, 1, 1, 1, 1,
0.3339458, 0.4106368, -2.47432, 1, 1, 1, 1, 1,
0.3422309, -0.754573, 2.491916, 1, 1, 1, 1, 1,
0.3439007, -1.89545, 2.869188, 1, 1, 1, 1, 1,
0.3469509, -0.9396594, 3.09407, 1, 1, 1, 1, 1,
0.3499683, 0.4513841, 1.11863, 1, 1, 1, 1, 1,
0.3537468, 2.865596, 0.3154246, 1, 1, 1, 1, 1,
0.3547598, -1.790612, 3.872591, 1, 1, 1, 1, 1,
0.3610153, -0.2130623, 2.236497, 1, 1, 1, 1, 1,
0.3617274, -0.2294165, 2.495491, 1, 1, 1, 1, 1,
0.3648109, 0.402315, 0.6477866, 0, 0, 1, 1, 1,
0.3651741, 1.307431, 0.7794599, 1, 0, 0, 1, 1,
0.3652277, 1.782351, -1.622294, 1, 0, 0, 1, 1,
0.3727085, -1.216766, 3.074405, 1, 0, 0, 1, 1,
0.3739513, -1.182799, 4.547006, 1, 0, 0, 1, 1,
0.375063, -0.910652, 3.393799, 1, 0, 0, 1, 1,
0.3759356, 0.0057677, 0.9707858, 0, 0, 0, 1, 1,
0.3761366, 1.347535, 0.734923, 0, 0, 0, 1, 1,
0.3799492, -0.2973296, 1.083157, 0, 0, 0, 1, 1,
0.3865249, -0.8345615, 1.558778, 0, 0, 0, 1, 1,
0.3894082, 0.8468153, 1.513851, 0, 0, 0, 1, 1,
0.3897039, -0.01671596, 1.26833, 0, 0, 0, 1, 1,
0.3924287, 0.2884626, -0.6086317, 0, 0, 0, 1, 1,
0.3968729, 0.5252563, 1.110445, 1, 1, 1, 1, 1,
0.4116749, 1.526652, 1.020818, 1, 1, 1, 1, 1,
0.4151683, -1.258089, 2.57028, 1, 1, 1, 1, 1,
0.4154535, 1.70507, 0.06016586, 1, 1, 1, 1, 1,
0.4187862, -0.3433422, 4.033691, 1, 1, 1, 1, 1,
0.41988, 0.7972794, -0.6065336, 1, 1, 1, 1, 1,
0.4205362, -0.3777141, 2.355914, 1, 1, 1, 1, 1,
0.4231353, -0.2149448, 4.424529, 1, 1, 1, 1, 1,
0.4258563, 1.859068, -1.06153, 1, 1, 1, 1, 1,
0.4279789, 0.6373988, 1.033946, 1, 1, 1, 1, 1,
0.4311283, 1.027612, 1.628755, 1, 1, 1, 1, 1,
0.4322836, 0.64977, -0.1050017, 1, 1, 1, 1, 1,
0.4375708, -0.2661965, 3.106505, 1, 1, 1, 1, 1,
0.4421688, 0.6000931, 1.984187, 1, 1, 1, 1, 1,
0.4428775, -0.1786225, 3.784567, 1, 1, 1, 1, 1,
0.4460404, -0.1992107, 3.315149, 0, 0, 1, 1, 1,
0.449031, -1.107477, 3.011342, 1, 0, 0, 1, 1,
0.4501781, 0.3733218, 0.008969487, 1, 0, 0, 1, 1,
0.4522296, 1.132529, 0.9034762, 1, 0, 0, 1, 1,
0.4532893, 2.89784, 0.5343797, 1, 0, 0, 1, 1,
0.4563285, 0.3479382, 0.5428895, 1, 0, 0, 1, 1,
0.4592691, 0.04428542, -0.4219628, 0, 0, 0, 1, 1,
0.4605135, -0.1357116, 1.642992, 0, 0, 0, 1, 1,
0.4608535, 1.664593, -0.4513611, 0, 0, 0, 1, 1,
0.46213, -1.182894, 2.033105, 0, 0, 0, 1, 1,
0.4622321, -0.620308, 4.816045, 0, 0, 0, 1, 1,
0.4633887, 1.11847, 0.113508, 0, 0, 0, 1, 1,
0.4682119, 0.7887455, -0.3233652, 0, 0, 0, 1, 1,
0.4797597, 0.2294211, 2.41364, 1, 1, 1, 1, 1,
0.4816738, -0.3719158, 2.540994, 1, 1, 1, 1, 1,
0.4861659, -2.332675, 1.537274, 1, 1, 1, 1, 1,
0.497143, -0.9378198, 2.659917, 1, 1, 1, 1, 1,
0.4984609, 0.3502564, 1.351974, 1, 1, 1, 1, 1,
0.5005202, 0.9894017, 1.614828, 1, 1, 1, 1, 1,
0.50107, -3.072563, 2.525265, 1, 1, 1, 1, 1,
0.507718, -0.2954526, 2.552899, 1, 1, 1, 1, 1,
0.5127417, 0.4815335, 1.647047, 1, 1, 1, 1, 1,
0.5134179, 0.4007808, 1.562538, 1, 1, 1, 1, 1,
0.5172476, 0.3377359, 2.229697, 1, 1, 1, 1, 1,
0.5188617, 0.01194093, -0.4467282, 1, 1, 1, 1, 1,
0.5226021, 1.13273, -0.7741873, 1, 1, 1, 1, 1,
0.5269148, 0.05136873, 1.790371, 1, 1, 1, 1, 1,
0.5299884, -0.3521881, 3.373676, 1, 1, 1, 1, 1,
0.5361407, -0.6118077, 0.388445, 0, 0, 1, 1, 1,
0.5468143, -0.3081757, 1.848762, 1, 0, 0, 1, 1,
0.5492877, 1.445554, 0.02704499, 1, 0, 0, 1, 1,
0.5520074, -0.1870909, 3.431194, 1, 0, 0, 1, 1,
0.5539171, -1.238521, 3.598204, 1, 0, 0, 1, 1,
0.5586374, 1.045735, 1.206256, 1, 0, 0, 1, 1,
0.5591145, 0.8657984, 0.5950108, 0, 0, 0, 1, 1,
0.5593657, -0.2646868, 2.697751, 0, 0, 0, 1, 1,
0.5600846, 0.9354929, -0.2648661, 0, 0, 0, 1, 1,
0.5609788, 0.2607659, 1.113744, 0, 0, 0, 1, 1,
0.5627678, 1.228033, 1.46231, 0, 0, 0, 1, 1,
0.5654336, -1.574359, 2.920034, 0, 0, 0, 1, 1,
0.5665482, -1.393092, 2.709324, 0, 0, 0, 1, 1,
0.5678295, 2.027276, -0.704309, 1, 1, 1, 1, 1,
0.5715664, 1.116541, 1.585874, 1, 1, 1, 1, 1,
0.5736667, 0.4687857, 0.1383108, 1, 1, 1, 1, 1,
0.5743039, 0.2725946, 0.7762504, 1, 1, 1, 1, 1,
0.5854659, -1.026894, 4.137938, 1, 1, 1, 1, 1,
0.5856604, -1.858715, 2.428023, 1, 1, 1, 1, 1,
0.5871709, 1.673224, 0.9964026, 1, 1, 1, 1, 1,
0.5889093, 0.830143, 1.620192, 1, 1, 1, 1, 1,
0.5902542, 0.3811093, 0.5109383, 1, 1, 1, 1, 1,
0.5944921, -2.532618, 4.207463, 1, 1, 1, 1, 1,
0.5964974, 0.752783, -0.1330899, 1, 1, 1, 1, 1,
0.5984185, 0.2975792, 2.516506, 1, 1, 1, 1, 1,
0.5995204, -1.488985, 4.686287, 1, 1, 1, 1, 1,
0.6013904, -1.223913, 2.951106, 1, 1, 1, 1, 1,
0.6029643, 1.416045, -1.519657, 1, 1, 1, 1, 1,
0.6070213, 0.1087896, 2.062809, 0, 0, 1, 1, 1,
0.6092477, -0.1447686, 2.897277, 1, 0, 0, 1, 1,
0.619938, -0.2120571, 1.816284, 1, 0, 0, 1, 1,
0.6216917, -0.5058066, 1.809262, 1, 0, 0, 1, 1,
0.6282495, 0.5826337, 0.380646, 1, 0, 0, 1, 1,
0.631805, -0.1379012, 2.510661, 1, 0, 0, 1, 1,
0.6407396, 1.222607, 2.184862, 0, 0, 0, 1, 1,
0.6516484, 0.3467781, -0.4759773, 0, 0, 0, 1, 1,
0.6543309, 0.04158021, 2.211567, 0, 0, 0, 1, 1,
0.6555069, -0.5614068, 0.4166267, 0, 0, 0, 1, 1,
0.6608332, 0.03584987, 3.251685, 0, 0, 0, 1, 1,
0.6615313, -0.1798702, 0.1812769, 0, 0, 0, 1, 1,
0.6656565, 1.191357, 1.120759, 0, 0, 0, 1, 1,
0.6688027, 0.9600014, -0.1022529, 1, 1, 1, 1, 1,
0.6693302, -0.6602079, 1.941601, 1, 1, 1, 1, 1,
0.6720278, -0.4390979, 0.4614951, 1, 1, 1, 1, 1,
0.672471, -2.035269, 1.938969, 1, 1, 1, 1, 1,
0.67265, 0.3158029, -0.04333436, 1, 1, 1, 1, 1,
0.6737834, 0.2755302, 0.130093, 1, 1, 1, 1, 1,
0.6738884, 0.2464719, 0.8491331, 1, 1, 1, 1, 1,
0.6746373, -0.9336618, 3.550023, 1, 1, 1, 1, 1,
0.6796071, -0.769707, 1.761189, 1, 1, 1, 1, 1,
0.6798866, 1.480966, 0.4409708, 1, 1, 1, 1, 1,
0.6838902, 0.5230399, 1.16579, 1, 1, 1, 1, 1,
0.6899284, 2.512963, -0.7209808, 1, 1, 1, 1, 1,
0.6903379, 1.63138, -0.2473074, 1, 1, 1, 1, 1,
0.7084566, 0.04756679, 2.771617, 1, 1, 1, 1, 1,
0.7096185, -0.9042765, 4.2562, 1, 1, 1, 1, 1,
0.7111004, -0.01723231, 1.057471, 0, 0, 1, 1, 1,
0.713118, 0.7982624, -0.7164315, 1, 0, 0, 1, 1,
0.723492, -1.099654, 4.390722, 1, 0, 0, 1, 1,
0.7257407, 0.05451787, 2.887574, 1, 0, 0, 1, 1,
0.7284017, 1.041039, 1.558726, 1, 0, 0, 1, 1,
0.7315785, 0.09626748, 1.587385, 1, 0, 0, 1, 1,
0.7331071, -1.94313, 2.533795, 0, 0, 0, 1, 1,
0.7336721, -1.336715, 2.972694, 0, 0, 0, 1, 1,
0.7378147, 0.5360104, 1.758969, 0, 0, 0, 1, 1,
0.7444422, -0.8371077, 1.01783, 0, 0, 0, 1, 1,
0.7508618, 1.167725, 0.2728189, 0, 0, 0, 1, 1,
0.7610686, -0.2654261, 1.433756, 0, 0, 0, 1, 1,
0.7635498, -0.6318931, 1.715714, 0, 0, 0, 1, 1,
0.7669857, 0.1123902, 1.827711, 1, 1, 1, 1, 1,
0.7685688, -0.04851521, 3.16478, 1, 1, 1, 1, 1,
0.7715086, 0.03463241, 1.46359, 1, 1, 1, 1, 1,
0.7759316, 1.093554, 0.00967648, 1, 1, 1, 1, 1,
0.7844687, 1.11378, -0.4335944, 1, 1, 1, 1, 1,
0.7865648, -0.4256719, 2.957916, 1, 1, 1, 1, 1,
0.7894565, -0.9448183, 3.201869, 1, 1, 1, 1, 1,
0.794632, -0.0384453, 1.944948, 1, 1, 1, 1, 1,
0.7968548, 1.092367, 2.449949, 1, 1, 1, 1, 1,
0.7994148, 0.5829349, 0.8765261, 1, 1, 1, 1, 1,
0.8011737, -0.6436133, 3.402857, 1, 1, 1, 1, 1,
0.8046698, 0.2042758, -0.8206126, 1, 1, 1, 1, 1,
0.8052828, 0.06941982, 1.875034, 1, 1, 1, 1, 1,
0.8071036, 0.1422134, 0.2751262, 1, 1, 1, 1, 1,
0.8072861, -0.3486329, 3.467866, 1, 1, 1, 1, 1,
0.8091673, 1.366777, 1.450715, 0, 0, 1, 1, 1,
0.8137435, 0.3385946, 2.793323, 1, 0, 0, 1, 1,
0.8141206, -0.7935127, 4.559198, 1, 0, 0, 1, 1,
0.8161316, -1.41104, 2.04198, 1, 0, 0, 1, 1,
0.8244103, 1.142767, 1.498723, 1, 0, 0, 1, 1,
0.8298128, -0.8904567, 1.917702, 1, 0, 0, 1, 1,
0.830254, -0.2682819, 2.020417, 0, 0, 0, 1, 1,
0.8322338, -0.3765283, 2.465502, 0, 0, 0, 1, 1,
0.8357222, -0.1566519, 0.3034349, 0, 0, 0, 1, 1,
0.839106, -0.3466674, 0.7779158, 0, 0, 0, 1, 1,
0.8392406, 1.089802, 0.4230994, 0, 0, 0, 1, 1,
0.8425003, 0.2660694, 0.9988319, 0, 0, 0, 1, 1,
0.8440174, -0.1493947, 2.340451, 0, 0, 0, 1, 1,
0.8451451, 0.613054, -1.184955, 1, 1, 1, 1, 1,
0.8461012, -0.4891219, 1.816075, 1, 1, 1, 1, 1,
0.8525615, 0.6872039, 0.6132505, 1, 1, 1, 1, 1,
0.8549844, 1.369806, -1.27101, 1, 1, 1, 1, 1,
0.8561214, -0.5284877, 0.6316482, 1, 1, 1, 1, 1,
0.8566101, -0.7093062, 2.21695, 1, 1, 1, 1, 1,
0.8583581, -0.220054, 0.623713, 1, 1, 1, 1, 1,
0.8600884, -0.7478588, 3.390638, 1, 1, 1, 1, 1,
0.8601941, 1.738279, 2.019019, 1, 1, 1, 1, 1,
0.863443, 0.2330957, 0.002670366, 1, 1, 1, 1, 1,
0.8643121, 0.7679752, 2.13358, 1, 1, 1, 1, 1,
0.8645177, -1.116707, 2.197965, 1, 1, 1, 1, 1,
0.8670505, -1.565432, 2.066069, 1, 1, 1, 1, 1,
0.86987, -1.244561, 1.653528, 1, 1, 1, 1, 1,
0.8707015, 1.585093, 0.6666927, 1, 1, 1, 1, 1,
0.8763442, -0.6067494, 3.309583, 0, 0, 1, 1, 1,
0.8785248, 0.2288185, 3.48776, 1, 0, 0, 1, 1,
0.8789432, -1.222645, 3.700385, 1, 0, 0, 1, 1,
0.8808041, 0.07846665, 1.007588, 1, 0, 0, 1, 1,
0.8813622, -1.192817, 4.453435, 1, 0, 0, 1, 1,
0.8863953, -1.175035, 3.040088, 1, 0, 0, 1, 1,
0.8895805, 0.5517084, 2.34945, 0, 0, 0, 1, 1,
0.8901703, 0.6128889, 2.068019, 0, 0, 0, 1, 1,
0.8939741, -0.8741547, 2.283748, 0, 0, 0, 1, 1,
0.8945812, 0.2212911, 1.446037, 0, 0, 0, 1, 1,
0.9107818, 0.6877038, 0.2273949, 0, 0, 0, 1, 1,
0.9158388, -1.383978, 2.294305, 0, 0, 0, 1, 1,
0.9172726, 1.056755, 0.4121504, 0, 0, 0, 1, 1,
0.9373918, 1.492329, 0.5937744, 1, 1, 1, 1, 1,
0.9433619, 1.460463, -0.9002174, 1, 1, 1, 1, 1,
0.9442579, -1.266933, 0.8419002, 1, 1, 1, 1, 1,
0.9568037, 0.7400167, 1.238817, 1, 1, 1, 1, 1,
0.9595306, 0.5387058, 0.5595662, 1, 1, 1, 1, 1,
0.9623474, -0.96611, 1.442626, 1, 1, 1, 1, 1,
0.9631874, -0.3903096, 1.474281, 1, 1, 1, 1, 1,
0.9704319, 0.6284781, 0.4007401, 1, 1, 1, 1, 1,
0.9716843, -0.6505723, 2.677619, 1, 1, 1, 1, 1,
0.9727602, 0.1365743, 0.1125756, 1, 1, 1, 1, 1,
0.9798383, -0.2381624, 1.89425, 1, 1, 1, 1, 1,
0.9809424, -0.08767118, 3.220794, 1, 1, 1, 1, 1,
0.9809471, -1.128832, 2.555503, 1, 1, 1, 1, 1,
0.982693, -0.529927, 1.832844, 1, 1, 1, 1, 1,
0.9917191, -1.187355, 3.399786, 1, 1, 1, 1, 1,
0.9923454, -0.5596105, 1.51267, 0, 0, 1, 1, 1,
0.9950764, -1.266807, 1.652772, 1, 0, 0, 1, 1,
1.013718, 0.9490797, -0.1463441, 1, 0, 0, 1, 1,
1.014743, -0.1711267, 2.165969, 1, 0, 0, 1, 1,
1.016352, -1.000297, 3.024178, 1, 0, 0, 1, 1,
1.018785, 1.310086, 0.1619785, 1, 0, 0, 1, 1,
1.019629, 0.2785476, 2.653119, 0, 0, 0, 1, 1,
1.026895, -0.05575597, 1.626087, 0, 0, 0, 1, 1,
1.032856, 0.1454246, -0.1970811, 0, 0, 0, 1, 1,
1.03599, 0.6148143, -0.119744, 0, 0, 0, 1, 1,
1.060365, 2.23893, -0.1208113, 0, 0, 0, 1, 1,
1.064182, 0.902673, 0.6165423, 0, 0, 0, 1, 1,
1.076518, 0.8204268, 2.448214, 0, 0, 0, 1, 1,
1.076649, 0.230352, 2.618659, 1, 1, 1, 1, 1,
1.076685, -1.427391, 2.597063, 1, 1, 1, 1, 1,
1.080015, -0.4417844, 3.383491, 1, 1, 1, 1, 1,
1.083972, -0.08586909, 2.834284, 1, 1, 1, 1, 1,
1.094344, 1.040896, 2.123763, 1, 1, 1, 1, 1,
1.115929, -1.322822, 1.813251, 1, 1, 1, 1, 1,
1.116493, 1.107604, 0.8690797, 1, 1, 1, 1, 1,
1.123405, -0.04250636, 1.54611, 1, 1, 1, 1, 1,
1.124146, -0.5283697, 3.187712, 1, 1, 1, 1, 1,
1.1251, 0.0890548, 3.049613, 1, 1, 1, 1, 1,
1.126248, 0.06478309, 1.582936, 1, 1, 1, 1, 1,
1.129361, 1.240462, 2.601481, 1, 1, 1, 1, 1,
1.131824, 1.324379, 0.3303879, 1, 1, 1, 1, 1,
1.134477, -0.05036513, 0.5956078, 1, 1, 1, 1, 1,
1.136741, 0.9029731, 4.43371, 1, 1, 1, 1, 1,
1.136798, -1.210043, 2.596488, 0, 0, 1, 1, 1,
1.141937, -0.2312236, 2.180303, 1, 0, 0, 1, 1,
1.141979, -0.8458114, 3.81005, 1, 0, 0, 1, 1,
1.146712, -0.0636403, 2.783526, 1, 0, 0, 1, 1,
1.149984, 0.4059061, 2.543574, 1, 0, 0, 1, 1,
1.173097, -1.500969, 2.484856, 1, 0, 0, 1, 1,
1.176742, -0.087449, 0.3013411, 0, 0, 0, 1, 1,
1.183431, 0.1671998, 0.7826284, 0, 0, 0, 1, 1,
1.191832, -0.1123937, 0.8326382, 0, 0, 0, 1, 1,
1.19783, -1.083724, 0.9987408, 0, 0, 0, 1, 1,
1.21178, -0.2014723, 2.201252, 0, 0, 0, 1, 1,
1.218578, 0.8625111, 0.2293759, 0, 0, 0, 1, 1,
1.222052, -0.1948123, 1.574818, 0, 0, 0, 1, 1,
1.228602, -0.8019735, 1.501714, 1, 1, 1, 1, 1,
1.246782, -0.4906371, 3.208353, 1, 1, 1, 1, 1,
1.246782, 1.354378, 1.69228, 1, 1, 1, 1, 1,
1.258596, 1.235545, 0.5115979, 1, 1, 1, 1, 1,
1.26233, -1.043665, 2.002307, 1, 1, 1, 1, 1,
1.264538, -0.1666391, 1.15718, 1, 1, 1, 1, 1,
1.264722, 0.9295971, 0.9960623, 1, 1, 1, 1, 1,
1.267212, -0.5666971, 2.082594, 1, 1, 1, 1, 1,
1.267388, -0.2341116, 1.550633, 1, 1, 1, 1, 1,
1.276696, -1.086902, 1.658463, 1, 1, 1, 1, 1,
1.27693, -0.8836643, 1.73432, 1, 1, 1, 1, 1,
1.282065, 0.3183458, 1.270035, 1, 1, 1, 1, 1,
1.286677, -1.020282, 4.562808, 1, 1, 1, 1, 1,
1.290352, 0.1831646, -0.02693091, 1, 1, 1, 1, 1,
1.293685, 1.468498, 0.1806082, 1, 1, 1, 1, 1,
1.302709, 0.9407115, 0.8424437, 0, 0, 1, 1, 1,
1.313061, 0.781786, 0.7498983, 1, 0, 0, 1, 1,
1.324327, -1.342126, 1.904297, 1, 0, 0, 1, 1,
1.337402, -0.7571928, 0.4560614, 1, 0, 0, 1, 1,
1.343492, -0.7281231, 3.354445, 1, 0, 0, 1, 1,
1.347681, 0.6756323, 1.23215, 1, 0, 0, 1, 1,
1.356951, -0.4525556, 2.014128, 0, 0, 0, 1, 1,
1.361443, 1.544692, 0.3600263, 0, 0, 0, 1, 1,
1.368593, -0.9939597, 2.361226, 0, 0, 0, 1, 1,
1.369155, 0.5004383, 2.07648, 0, 0, 0, 1, 1,
1.370126, -1.068794, 3.174481, 0, 0, 0, 1, 1,
1.379666, -1.429165, 2.237624, 0, 0, 0, 1, 1,
1.401791, -0.3731278, 3.720547, 0, 0, 0, 1, 1,
1.408992, -0.6077873, 1.534171, 1, 1, 1, 1, 1,
1.409204, 2.024859, 1.300538, 1, 1, 1, 1, 1,
1.423665, 0.6034352, 1.085989, 1, 1, 1, 1, 1,
1.426268, -1.373277, 3.606527, 1, 1, 1, 1, 1,
1.434008, -0.6660908, 0.9358032, 1, 1, 1, 1, 1,
1.442891, -0.07093789, 2.391201, 1, 1, 1, 1, 1,
1.448913, -0.5007135, 1.721515, 1, 1, 1, 1, 1,
1.454487, 1.494692, -1.153637, 1, 1, 1, 1, 1,
1.456234, 0.3815005, 2.220952, 1, 1, 1, 1, 1,
1.459981, 0.7684847, -1.521597, 1, 1, 1, 1, 1,
1.476593, 0.2806517, -0.5160168, 1, 1, 1, 1, 1,
1.478479, 1.664603, 1.151798, 1, 1, 1, 1, 1,
1.479497, -0.127469, 1.428725, 1, 1, 1, 1, 1,
1.480289, -0.05791944, 2.580481, 1, 1, 1, 1, 1,
1.482811, 0.4965448, 2.776218, 1, 1, 1, 1, 1,
1.484779, -0.232796, 0.5848228, 0, 0, 1, 1, 1,
1.49374, 0.6942084, 2.079998, 1, 0, 0, 1, 1,
1.496037, -2.55022, 2.21014, 1, 0, 0, 1, 1,
1.502125, -0.4531748, 1.719608, 1, 0, 0, 1, 1,
1.502876, -1.507852, 4.677958, 1, 0, 0, 1, 1,
1.508608, -0.1001386, 1.870808, 1, 0, 0, 1, 1,
1.523223, 0.7108281, 0.7667735, 0, 0, 0, 1, 1,
1.53394, -1.31006, 2.082425, 0, 0, 0, 1, 1,
1.545913, -0.1944413, 1.062416, 0, 0, 0, 1, 1,
1.547599, 0.5234202, 0.6785343, 0, 0, 0, 1, 1,
1.564165, -2.957258, 2.974144, 0, 0, 0, 1, 1,
1.565102, -0.1935739, 0.9137798, 0, 0, 0, 1, 1,
1.565356, 1.069329, 1.876023, 0, 0, 0, 1, 1,
1.572572, -0.8266515, 2.935746, 1, 1, 1, 1, 1,
1.590678, -0.3946522, 1.064403, 1, 1, 1, 1, 1,
1.60693, -1.209396, 1.395719, 1, 1, 1, 1, 1,
1.607822, 0.05419143, 2.139693, 1, 1, 1, 1, 1,
1.614076, -0.0512071, 3.058345, 1, 1, 1, 1, 1,
1.619234, -1.781533, 3.687575, 1, 1, 1, 1, 1,
1.632524, 0.09942677, 0.8569439, 1, 1, 1, 1, 1,
1.637788, -0.1432156, 0.6342589, 1, 1, 1, 1, 1,
1.655316, 1.473198, -0.2900492, 1, 1, 1, 1, 1,
1.659311, 0.5350404, 2.20083, 1, 1, 1, 1, 1,
1.670281, 1.15596, 1.197846, 1, 1, 1, 1, 1,
1.671081, -0.529018, 2.346215, 1, 1, 1, 1, 1,
1.678607, -1.628836, 3.643509, 1, 1, 1, 1, 1,
1.678623, -0.2077875, 3.162492, 1, 1, 1, 1, 1,
1.695631, 0.9462267, -1.219288, 1, 1, 1, 1, 1,
1.704053, -0.1002107, 0.8460795, 0, 0, 1, 1, 1,
1.710238, -1.498468, 3.482273, 1, 0, 0, 1, 1,
1.739314, -2.150862, 1.223156, 1, 0, 0, 1, 1,
1.749625, 1.056807, -0.1889581, 1, 0, 0, 1, 1,
1.767254, -1.926591, 3.642827, 1, 0, 0, 1, 1,
1.777274, 0.5905893, 1.606622, 1, 0, 0, 1, 1,
1.790752, -1.232401, 0.4245017, 0, 0, 0, 1, 1,
1.797891, -0.3272379, 2.181705, 0, 0, 0, 1, 1,
1.800969, 0.7175024, 1.451764, 0, 0, 0, 1, 1,
1.82504, -0.622609, 1.365393, 0, 0, 0, 1, 1,
1.852809, 1.485222, -1.128415, 0, 0, 0, 1, 1,
1.8827, 2.313155, 0.7897159, 0, 0, 0, 1, 1,
1.888056, -2.088257, 2.571688, 0, 0, 0, 1, 1,
1.896393, -0.2660791, 1.696237, 1, 1, 1, 1, 1,
1.901247, 1.150974, 0.0397649, 1, 1, 1, 1, 1,
1.922137, -1.079509, 2.105745, 1, 1, 1, 1, 1,
1.933056, -0.3539358, 1.236737, 1, 1, 1, 1, 1,
1.935545, -0.09479964, 1.034462, 1, 1, 1, 1, 1,
1.936156, 0.9449588, 2.23065, 1, 1, 1, 1, 1,
1.957357, -1.330142, 2.356066, 1, 1, 1, 1, 1,
1.976076, -0.802521, 2.121442, 1, 1, 1, 1, 1,
1.993532, -1.427753, 2.659089, 1, 1, 1, 1, 1,
2.038123, -0.1230185, 2.245164, 1, 1, 1, 1, 1,
2.03819, -0.3092774, 1.264132, 1, 1, 1, 1, 1,
2.041094, 1.487689, 1.80515, 1, 1, 1, 1, 1,
2.045976, 0.3720069, 1.19851, 1, 1, 1, 1, 1,
2.053423, 0.5013149, 0.3250358, 1, 1, 1, 1, 1,
2.061389, 0.05963331, 1.510943, 1, 1, 1, 1, 1,
2.103207, -0.1907783, 3.314949, 0, 0, 1, 1, 1,
2.108618, 0.9582161, 0.513535, 1, 0, 0, 1, 1,
2.113911, -0.1816384, 1.443769, 1, 0, 0, 1, 1,
2.175447, 0.7816613, 0.1073872, 1, 0, 0, 1, 1,
2.217656, 0.3435438, 2.302386, 1, 0, 0, 1, 1,
2.230577, 0.9569213, 2.369804, 1, 0, 0, 1, 1,
2.23173, -1.492537, 2.928955, 0, 0, 0, 1, 1,
2.253058, -0.5771827, 0.4061328, 0, 0, 0, 1, 1,
2.331094, 0.6067901, 2.679636, 0, 0, 0, 1, 1,
2.354236, 0.84523, 0.8313043, 0, 0, 0, 1, 1,
2.415207, -0.3157348, 3.418007, 0, 0, 0, 1, 1,
2.441652, -2.626657, 3.164628, 0, 0, 0, 1, 1,
2.459505, -0.1262411, 1.412963, 0, 0, 0, 1, 1,
2.488338, 0.6993498, 2.007154, 1, 1, 1, 1, 1,
2.607485, 1.376906, 0.4580477, 1, 1, 1, 1, 1,
2.634424, 0.7188355, 1.09066, 1, 1, 1, 1, 1,
2.778283, 0.1336929, 1.078124, 1, 1, 1, 1, 1,
2.813884, 0.551748, -0.5514884, 1, 1, 1, 1, 1,
3.090539, -1.262487, 2.732091, 1, 1, 1, 1, 1,
3.149629, -1.434518, 3.006056, 1, 1, 1, 1, 1
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
var radius = 9.397959;
var distance = 33.00993;
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
mvMatrix.translate( -0.09234071, -0.1606138, 0.2079024 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.00993);
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
