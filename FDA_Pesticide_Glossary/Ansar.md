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
-3.359318, 0.08464015, -4.527599, 1, 0, 0, 1,
-2.825754, -3.298139, -3.162719, 1, 0.007843138, 0, 1,
-2.765323, 2.196726, 1.177036, 1, 0.01176471, 0, 1,
-2.709584, 0.7532198, -1.022565, 1, 0.01960784, 0, 1,
-2.657364, 0.2101869, 0.1310734, 1, 0.02352941, 0, 1,
-2.656775, -0.7129586, -0.04892912, 1, 0.03137255, 0, 1,
-2.595574, 2.071757, 0.7366005, 1, 0.03529412, 0, 1,
-2.580723, 0.6771294, -1.36208, 1, 0.04313726, 0, 1,
-2.56007, 0.07061227, -0.7857966, 1, 0.04705882, 0, 1,
-2.506716, 0.1133591, -1.313529, 1, 0.05490196, 0, 1,
-2.477898, -0.6379641, -2.295857, 1, 0.05882353, 0, 1,
-2.403844, 0.4384795, -0.2050181, 1, 0.06666667, 0, 1,
-2.390507, -0.4285334, -1.913431, 1, 0.07058824, 0, 1,
-2.341352, -0.1853242, -2.213506, 1, 0.07843138, 0, 1,
-2.314864, -0.9933923, -1.503636, 1, 0.08235294, 0, 1,
-2.27741, 0.7116306, -1.531092, 1, 0.09019608, 0, 1,
-2.246869, -1.176321, -0.5019202, 1, 0.09411765, 0, 1,
-2.186574, 1.546097, -2.049001, 1, 0.1019608, 0, 1,
-2.167996, 0.2644663, -0.8607413, 1, 0.1098039, 0, 1,
-2.162741, -0.4853246, -1.397485, 1, 0.1137255, 0, 1,
-2.146693, -0.613641, 0.4019476, 1, 0.1215686, 0, 1,
-2.106986, -0.5890697, -2.311705, 1, 0.1254902, 0, 1,
-2.097763, 0.07571458, -0.1731759, 1, 0.1333333, 0, 1,
-2.095057, 1.536202, -0.3081733, 1, 0.1372549, 0, 1,
-2.073915, -1.473126, -3.050335, 1, 0.145098, 0, 1,
-2.048877, 0.08210377, -1.319632, 1, 0.1490196, 0, 1,
-2.02342, -0.5441613, -1.107285, 1, 0.1568628, 0, 1,
-2.019181, -2.106159, -0.7368527, 1, 0.1607843, 0, 1,
-1.996097, 0.725067, -0.8358075, 1, 0.1686275, 0, 1,
-1.968244, -0.9367827, -1.113783, 1, 0.172549, 0, 1,
-1.945363, -0.1298585, -1.834254, 1, 0.1803922, 0, 1,
-1.943393, 0.008940291, -2.548143, 1, 0.1843137, 0, 1,
-1.936703, 0.3036849, -1.045348, 1, 0.1921569, 0, 1,
-1.931242, 0.7792248, -2.73147, 1, 0.1960784, 0, 1,
-1.913171, 1.405736, -1.210522, 1, 0.2039216, 0, 1,
-1.908315, 0.594471, -2.003389, 1, 0.2117647, 0, 1,
-1.90418, 1.374073, -2.512283, 1, 0.2156863, 0, 1,
-1.891528, 0.30044, -2.731351, 1, 0.2235294, 0, 1,
-1.88843, -1.310735, -0.5495619, 1, 0.227451, 0, 1,
-1.881109, -0.4346747, -1.285923, 1, 0.2352941, 0, 1,
-1.859888, -0.4884378, -1.3601, 1, 0.2392157, 0, 1,
-1.847707, -0.250154, -0.9515749, 1, 0.2470588, 0, 1,
-1.846941, 0.8325095, -0.2240375, 1, 0.2509804, 0, 1,
-1.796822, -0.124969, -0.1914085, 1, 0.2588235, 0, 1,
-1.789011, 0.113833, -0.9567216, 1, 0.2627451, 0, 1,
-1.787857, 0.3040947, -1.338155, 1, 0.2705882, 0, 1,
-1.777401, -0.8505339, -0.9449611, 1, 0.2745098, 0, 1,
-1.772182, -0.7558802, -1.803544, 1, 0.282353, 0, 1,
-1.7558, -1.062511, -2.254328, 1, 0.2862745, 0, 1,
-1.754894, -0.113779, -1.963295, 1, 0.2941177, 0, 1,
-1.743185, 0.154022, -2.926479, 1, 0.3019608, 0, 1,
-1.719192, -0.3092951, -0.5294312, 1, 0.3058824, 0, 1,
-1.681308, 0.6329376, -0.9697501, 1, 0.3137255, 0, 1,
-1.681218, -1.306233, -1.863918, 1, 0.3176471, 0, 1,
-1.66903, -0.8421627, -3.677982, 1, 0.3254902, 0, 1,
-1.659399, 1.986215, -0.6523944, 1, 0.3294118, 0, 1,
-1.658247, 1.7112, -0.9440029, 1, 0.3372549, 0, 1,
-1.657866, 2.074726, 0.4725387, 1, 0.3411765, 0, 1,
-1.584192, -1.354806, -2.558737, 1, 0.3490196, 0, 1,
-1.569236, 0.3934102, -2.49345, 1, 0.3529412, 0, 1,
-1.566056, 0.5346438, -1.7281, 1, 0.3607843, 0, 1,
-1.561123, -1.719135, -3.15872, 1, 0.3647059, 0, 1,
-1.546261, -0.4723918, -0.7832617, 1, 0.372549, 0, 1,
-1.544589, 0.276107, -0.0344407, 1, 0.3764706, 0, 1,
-1.54314, -0.678066, -1.62846, 1, 0.3843137, 0, 1,
-1.542407, -1.606158, -2.94241, 1, 0.3882353, 0, 1,
-1.531561, -1.206082, -1.527739, 1, 0.3960784, 0, 1,
-1.529776, -0.367553, -2.266608, 1, 0.4039216, 0, 1,
-1.515567, -1.09808, 1.116727, 1, 0.4078431, 0, 1,
-1.490265, 1.46698, -0.2654939, 1, 0.4156863, 0, 1,
-1.459373, -0.3312008, -0.723739, 1, 0.4196078, 0, 1,
-1.45298, -1.578556, -1.629976, 1, 0.427451, 0, 1,
-1.448241, 0.4046616, -0.8529701, 1, 0.4313726, 0, 1,
-1.444906, 0.1975434, -0.5842922, 1, 0.4392157, 0, 1,
-1.434074, -0.2912117, -1.937087, 1, 0.4431373, 0, 1,
-1.432439, 1.092151, -0.4087698, 1, 0.4509804, 0, 1,
-1.431136, -0.6991376, -3.074035, 1, 0.454902, 0, 1,
-1.427125, -1.020251, -1.151813, 1, 0.4627451, 0, 1,
-1.406789, -0.1831057, -2.018, 1, 0.4666667, 0, 1,
-1.400349, 1.205542, -2.829702, 1, 0.4745098, 0, 1,
-1.394374, -0.6802602, -0.3253166, 1, 0.4784314, 0, 1,
-1.388032, 0.7285755, -0.8841398, 1, 0.4862745, 0, 1,
-1.364978, -1.762793, -1.347254, 1, 0.4901961, 0, 1,
-1.354664, -3.28721, -2.805188, 1, 0.4980392, 0, 1,
-1.353183, 0.4909313, -0.8557866, 1, 0.5058824, 0, 1,
-1.351125, 1.793215, -0.5707322, 1, 0.509804, 0, 1,
-1.342146, 0.1193084, -1.986974, 1, 0.5176471, 0, 1,
-1.340028, -0.06156514, -3.689884, 1, 0.5215687, 0, 1,
-1.338525, -1.876325, -3.159792, 1, 0.5294118, 0, 1,
-1.33564, 1.261702, -0.8242063, 1, 0.5333334, 0, 1,
-1.309738, -0.5158986, -2.12187, 1, 0.5411765, 0, 1,
-1.306773, -0.6153328, -0.4088361, 1, 0.5450981, 0, 1,
-1.306337, 0.4272812, -1.343506, 1, 0.5529412, 0, 1,
-1.305547, 0.4724269, -2.063542, 1, 0.5568628, 0, 1,
-1.301189, -0.4322324, -0.6503676, 1, 0.5647059, 0, 1,
-1.294049, 0.3929583, 0.3206062, 1, 0.5686275, 0, 1,
-1.292489, 0.5382433, -0.3723806, 1, 0.5764706, 0, 1,
-1.290481, -0.5308541, -3.806142, 1, 0.5803922, 0, 1,
-1.285144, 0.02776361, -2.367915, 1, 0.5882353, 0, 1,
-1.282853, -0.2242094, 0.6570769, 1, 0.5921569, 0, 1,
-1.282779, 0.5410982, -0.8253922, 1, 0.6, 0, 1,
-1.269818, 1.376734, 0.1738517, 1, 0.6078432, 0, 1,
-1.269354, 0.7337649, -0.6882043, 1, 0.6117647, 0, 1,
-1.265632, 0.2021577, -2.121907, 1, 0.6196079, 0, 1,
-1.252325, -0.2458259, -0.9751725, 1, 0.6235294, 0, 1,
-1.247473, -0.270931, -1.342794, 1, 0.6313726, 0, 1,
-1.244934, -0.2170866, 0.06424785, 1, 0.6352941, 0, 1,
-1.2403, -1.321384, -0.367974, 1, 0.6431373, 0, 1,
-1.237115, -0.3800976, -1.723359, 1, 0.6470588, 0, 1,
-1.233927, 0.0582089, -1.985286, 1, 0.654902, 0, 1,
-1.224668, -0.4789447, -2.593097, 1, 0.6588235, 0, 1,
-1.223455, 0.4935724, -1.4692, 1, 0.6666667, 0, 1,
-1.221949, -2.010947, -2.528043, 1, 0.6705883, 0, 1,
-1.213375, 0.4395715, -1.798377, 1, 0.6784314, 0, 1,
-1.209247, 0.8554273, -1.536232, 1, 0.682353, 0, 1,
-1.207412, 0.5385448, -2.227609, 1, 0.6901961, 0, 1,
-1.207256, 0.8130001, 1.052706, 1, 0.6941177, 0, 1,
-1.206058, 0.7283005, -2.785563, 1, 0.7019608, 0, 1,
-1.195715, 1.217885, -0.6752793, 1, 0.7098039, 0, 1,
-1.194765, -0.6360623, -1.725963, 1, 0.7137255, 0, 1,
-1.192346, 0.6957092, -1.29408, 1, 0.7215686, 0, 1,
-1.190391, -1.044194, -2.514966, 1, 0.7254902, 0, 1,
-1.185593, -1.328397, -2.932402, 1, 0.7333333, 0, 1,
-1.185275, -1.40622, -3.797465, 1, 0.7372549, 0, 1,
-1.183974, -0.812122, -1.353528, 1, 0.7450981, 0, 1,
-1.179402, -0.9774342, -2.918572, 1, 0.7490196, 0, 1,
-1.178956, 0.3042046, -0.8896582, 1, 0.7568628, 0, 1,
-1.174727, -2.331563, -2.283698, 1, 0.7607843, 0, 1,
-1.167046, 0.6545694, -1.416328, 1, 0.7686275, 0, 1,
-1.16482, -0.1992195, -2.147983, 1, 0.772549, 0, 1,
-1.164564, -1.036023, -2.770164, 1, 0.7803922, 0, 1,
-1.161176, -0.2619757, -2.356952, 1, 0.7843137, 0, 1,
-1.158348, -0.3415614, -0.5304039, 1, 0.7921569, 0, 1,
-1.157319, 0.347267, -0.525406, 1, 0.7960784, 0, 1,
-1.156858, 1.288578, -1.147861, 1, 0.8039216, 0, 1,
-1.156279, -0.8716312, -2.002761, 1, 0.8117647, 0, 1,
-1.152884, -2.178988, -2.280956, 1, 0.8156863, 0, 1,
-1.140594, -1.595466, -2.923132, 1, 0.8235294, 0, 1,
-1.13907, -1.693984, -2.634624, 1, 0.827451, 0, 1,
-1.136402, -0.7699081, -3.864568, 1, 0.8352941, 0, 1,
-1.115864, 0.766239, -1.475262, 1, 0.8392157, 0, 1,
-1.113179, 0.5833794, 0.286553, 1, 0.8470588, 0, 1,
-1.113128, -0.9691766, -1.107474, 1, 0.8509804, 0, 1,
-1.109477, -1.035949, -1.650981, 1, 0.8588235, 0, 1,
-1.102188, 0.7040561, -0.6989875, 1, 0.8627451, 0, 1,
-1.09518, -1.011321, -1.010167, 1, 0.8705882, 0, 1,
-1.09139, -1.764101, -2.455855, 1, 0.8745098, 0, 1,
-1.090702, -0.7616392, -1.308541, 1, 0.8823529, 0, 1,
-1.084382, 0.2582323, -0.7782937, 1, 0.8862745, 0, 1,
-1.074788, 0.02865524, 0.2151474, 1, 0.8941177, 0, 1,
-1.074391, 0.1848419, -1.306568, 1, 0.8980392, 0, 1,
-1.073276, -1.100725, -2.113529, 1, 0.9058824, 0, 1,
-1.073137, 1.187687, -0.6744721, 1, 0.9137255, 0, 1,
-1.070986, 0.4593182, -1.512838, 1, 0.9176471, 0, 1,
-1.069559, 1.694021, -0.2451344, 1, 0.9254902, 0, 1,
-1.067169, -1.495167, -1.931745, 1, 0.9294118, 0, 1,
-1.063868, -2.119937, -2.034203, 1, 0.9372549, 0, 1,
-1.06352, -1.921252, -2.053304, 1, 0.9411765, 0, 1,
-1.062152, 1.777278, 0.1734895, 1, 0.9490196, 0, 1,
-1.057357, 1.938686, -2.000471, 1, 0.9529412, 0, 1,
-1.038651, -0.1716807, -0.745177, 1, 0.9607843, 0, 1,
-1.031808, -0.4878386, -0.1892253, 1, 0.9647059, 0, 1,
-1.02308, -0.0997813, -2.350484, 1, 0.972549, 0, 1,
-1.01918, 0.9418655, -1.497675, 1, 0.9764706, 0, 1,
-1.013399, -0.5502295, -1.486449, 1, 0.9843137, 0, 1,
-1.011099, -0.1192185, -0.901719, 1, 0.9882353, 0, 1,
-1.007009, -1.002481, -1.577454, 1, 0.9960784, 0, 1,
-0.9945687, -1.15141, 0.9191109, 0.9960784, 1, 0, 1,
-0.9916269, -2.23983, -3.885895, 0.9921569, 1, 0, 1,
-0.990456, 0.5845678, 0.4632086, 0.9843137, 1, 0, 1,
-0.9902339, -0.168183, -0.2452562, 0.9803922, 1, 0, 1,
-0.9896699, -0.7182839, -0.786137, 0.972549, 1, 0, 1,
-0.979763, -0.8163376, -1.848127, 0.9686275, 1, 0, 1,
-0.9788315, 0.08356092, -3.099183, 0.9607843, 1, 0, 1,
-0.9788182, 1.300211, -0.5972256, 0.9568627, 1, 0, 1,
-0.9775691, -0.9113037, -2.367668, 0.9490196, 1, 0, 1,
-0.973651, -1.907457, -1.202664, 0.945098, 1, 0, 1,
-0.9719825, -0.4330519, -2.533129, 0.9372549, 1, 0, 1,
-0.9718395, 0.2485715, -2.911211, 0.9333333, 1, 0, 1,
-0.9712428, 1.576804, 0.2267427, 0.9254902, 1, 0, 1,
-0.9700735, -1.44392, -3.157824, 0.9215686, 1, 0, 1,
-0.9571245, 1.638088, -2.205853, 0.9137255, 1, 0, 1,
-0.9567754, 0.4017311, -1.62281, 0.9098039, 1, 0, 1,
-0.9556653, -0.6773295, -2.954979, 0.9019608, 1, 0, 1,
-0.9534839, 0.1309029, -1.27642, 0.8941177, 1, 0, 1,
-0.9481875, -1.592852, -2.395875, 0.8901961, 1, 0, 1,
-0.946496, -0.7734268, -3.298366, 0.8823529, 1, 0, 1,
-0.9435859, -0.005519571, -0.8333981, 0.8784314, 1, 0, 1,
-0.9365966, -0.145647, -1.154231, 0.8705882, 1, 0, 1,
-0.9341002, 0.4747275, -1.772947, 0.8666667, 1, 0, 1,
-0.9287125, -0.5280047, -2.142706, 0.8588235, 1, 0, 1,
-0.9251267, 0.6419333, -1.04628, 0.854902, 1, 0, 1,
-0.9170327, -0.3324114, -1.755405, 0.8470588, 1, 0, 1,
-0.9169257, 1.010086, -0.7416108, 0.8431373, 1, 0, 1,
-0.9133283, 0.3252924, -2.734423, 0.8352941, 1, 0, 1,
-0.9115683, 0.6008765, -1.143731, 0.8313726, 1, 0, 1,
-0.9098071, 0.6132049, -0.1725883, 0.8235294, 1, 0, 1,
-0.9030445, 0.1074292, -2.428977, 0.8196079, 1, 0, 1,
-0.9027855, -0.8250181, -1.230234, 0.8117647, 1, 0, 1,
-0.9007472, 1.011116, 0.07104848, 0.8078431, 1, 0, 1,
-0.8990373, -1.396619, -3.955984, 0.8, 1, 0, 1,
-0.8964101, 0.880689, -0.8011628, 0.7921569, 1, 0, 1,
-0.8941141, 2.653235, -0.03544915, 0.7882353, 1, 0, 1,
-0.8875695, -0.4593618, -1.345616, 0.7803922, 1, 0, 1,
-0.8865818, -0.3882803, -3.40837, 0.7764706, 1, 0, 1,
-0.8791884, -0.5522145, -2.897789, 0.7686275, 1, 0, 1,
-0.8696144, 0.4740025, 0.549664, 0.7647059, 1, 0, 1,
-0.8691282, -0.2365064, -2.483404, 0.7568628, 1, 0, 1,
-0.8685168, -0.819347, -3.97721, 0.7529412, 1, 0, 1,
-0.8675692, -0.5102924, -1.976649, 0.7450981, 1, 0, 1,
-0.8662034, -1.128373, -1.733478, 0.7411765, 1, 0, 1,
-0.864284, 1.366854, -0.612734, 0.7333333, 1, 0, 1,
-0.85653, 0.8932158, -0.5009942, 0.7294118, 1, 0, 1,
-0.8556039, -0.3757598, -2.601699, 0.7215686, 1, 0, 1,
-0.8532879, -0.5850028, -0.6929155, 0.7176471, 1, 0, 1,
-0.8456522, -0.4283421, -2.489278, 0.7098039, 1, 0, 1,
-0.8407445, 2.357097, -0.0831589, 0.7058824, 1, 0, 1,
-0.8376063, 0.06230922, -3.067914, 0.6980392, 1, 0, 1,
-0.8345811, -1.381262, -1.095893, 0.6901961, 1, 0, 1,
-0.8327578, -0.4274851, -1.420569, 0.6862745, 1, 0, 1,
-0.8325235, 0.06432305, -1.75493, 0.6784314, 1, 0, 1,
-0.8306262, 2.249804, 1.247443, 0.6745098, 1, 0, 1,
-0.8299611, -0.8633996, -3.103537, 0.6666667, 1, 0, 1,
-0.8247795, 1.098839, -0.1586502, 0.6627451, 1, 0, 1,
-0.8198238, -0.2704762, -1.694986, 0.654902, 1, 0, 1,
-0.8128417, -0.574688, -3.095209, 0.6509804, 1, 0, 1,
-0.8056248, -1.175649, -2.548536, 0.6431373, 1, 0, 1,
-0.7992657, 1.097105, 0.4582304, 0.6392157, 1, 0, 1,
-0.7957354, 0.430638, -1.477672, 0.6313726, 1, 0, 1,
-0.7943684, -0.7553034, -2.913487, 0.627451, 1, 0, 1,
-0.7921723, -1.257992, -1.622112, 0.6196079, 1, 0, 1,
-0.7920405, -0.4692135, -0.3200099, 0.6156863, 1, 0, 1,
-0.7880312, -0.8681315, -2.980747, 0.6078432, 1, 0, 1,
-0.7815377, 1.508717, 2.09297, 0.6039216, 1, 0, 1,
-0.781057, -0.9941124, -2.929852, 0.5960785, 1, 0, 1,
-0.7696198, 0.9535878, -0.02213745, 0.5882353, 1, 0, 1,
-0.7687865, 0.4665618, 1.157519, 0.5843138, 1, 0, 1,
-0.7683895, -1.398346, -3.289735, 0.5764706, 1, 0, 1,
-0.7637877, -0.2768208, -1.990965, 0.572549, 1, 0, 1,
-0.7631773, -0.7780346, -2.25482, 0.5647059, 1, 0, 1,
-0.760002, 0.7732684, -0.1931734, 0.5607843, 1, 0, 1,
-0.7572604, -1.843279, -2.798178, 0.5529412, 1, 0, 1,
-0.7562877, 0.6353365, -1.816962, 0.5490196, 1, 0, 1,
-0.7520122, -0.0177764, -0.807812, 0.5411765, 1, 0, 1,
-0.7483934, 0.6361267, -3.307312, 0.5372549, 1, 0, 1,
-0.7483211, -1.37038, -4.005852, 0.5294118, 1, 0, 1,
-0.7477619, -0.08001729, -3.314065, 0.5254902, 1, 0, 1,
-0.7461155, 0.5697038, -3.346925, 0.5176471, 1, 0, 1,
-0.7449784, -0.4065952, -0.8800887, 0.5137255, 1, 0, 1,
-0.7419943, -0.7097203, -2.990639, 0.5058824, 1, 0, 1,
-0.7370129, -0.08284897, -1.068667, 0.5019608, 1, 0, 1,
-0.7344268, 0.6819851, -1.342728, 0.4941176, 1, 0, 1,
-0.7342854, -0.7787348, -1.404214, 0.4862745, 1, 0, 1,
-0.7281054, 0.2130812, -2.057927, 0.4823529, 1, 0, 1,
-0.7268175, -0.3062489, -0.6174508, 0.4745098, 1, 0, 1,
-0.7243432, 1.593469, 0.2534616, 0.4705882, 1, 0, 1,
-0.7222099, -0.7423159, -3.662105, 0.4627451, 1, 0, 1,
-0.7139454, -1.721628, -3.774185, 0.4588235, 1, 0, 1,
-0.7121646, 0.4846063, -0.6201286, 0.4509804, 1, 0, 1,
-0.7092991, -1.262232, -0.5476269, 0.4470588, 1, 0, 1,
-0.7078562, 0.6970765, -0.4478146, 0.4392157, 1, 0, 1,
-0.7042763, -0.2917467, -1.472509, 0.4352941, 1, 0, 1,
-0.693923, 0.3762846, 0.1675578, 0.427451, 1, 0, 1,
-0.6900879, -1.44317, -2.649068, 0.4235294, 1, 0, 1,
-0.6897668, -0.545076, -1.629536, 0.4156863, 1, 0, 1,
-0.6877566, -0.4833801, -1.401557, 0.4117647, 1, 0, 1,
-0.6847146, -1.529779, -3.590938, 0.4039216, 1, 0, 1,
-0.6830883, -0.8764813, -2.113251, 0.3960784, 1, 0, 1,
-0.6828113, -0.8225736, -2.430344, 0.3921569, 1, 0, 1,
-0.6827653, -1.177909, -2.392755, 0.3843137, 1, 0, 1,
-0.6788964, -1.257498, -3.450432, 0.3803922, 1, 0, 1,
-0.6767018, -0.3232414, -3.501957, 0.372549, 1, 0, 1,
-0.6656076, 0.5077794, 0.06710394, 0.3686275, 1, 0, 1,
-0.6627331, -0.4861878, -3.254803, 0.3607843, 1, 0, 1,
-0.6625891, -0.03723054, -1.985159, 0.3568628, 1, 0, 1,
-0.6530674, -0.8814438, -2.535652, 0.3490196, 1, 0, 1,
-0.6494872, -1.935799, -1.232099, 0.345098, 1, 0, 1,
-0.6472684, 0.3951701, -0.6345099, 0.3372549, 1, 0, 1,
-0.6471432, -0.2904625, -0.642953, 0.3333333, 1, 0, 1,
-0.6467029, -0.332643, -1.886316, 0.3254902, 1, 0, 1,
-0.6461759, 0.5591194, -0.8156385, 0.3215686, 1, 0, 1,
-0.6408796, -0.3610553, -1.78317, 0.3137255, 1, 0, 1,
-0.6321609, 1.074787, -2.157137, 0.3098039, 1, 0, 1,
-0.6292629, 0.8536578, -3.069022, 0.3019608, 1, 0, 1,
-0.6264713, 0.5322484, -1.203908, 0.2941177, 1, 0, 1,
-0.6256367, -0.2179878, -1.51092, 0.2901961, 1, 0, 1,
-0.6241677, 0.3550006, -3.418475, 0.282353, 1, 0, 1,
-0.6153532, 1.177375, -0.5866967, 0.2784314, 1, 0, 1,
-0.6134074, -1.034826, -2.81753, 0.2705882, 1, 0, 1,
-0.6089633, -0.1698702, -2.883745, 0.2666667, 1, 0, 1,
-0.6078828, 1.0237, -1.124559, 0.2588235, 1, 0, 1,
-0.607881, -0.3273949, -2.92276, 0.254902, 1, 0, 1,
-0.602248, 0.6237023, -2.629578, 0.2470588, 1, 0, 1,
-0.6010625, -1.434532, -3.759478, 0.2431373, 1, 0, 1,
-0.5942488, 0.1685878, -1.18277, 0.2352941, 1, 0, 1,
-0.5931458, -0.3691207, -1.096461, 0.2313726, 1, 0, 1,
-0.5923769, 1.475226, -0.6075376, 0.2235294, 1, 0, 1,
-0.5914986, 0.1732214, 1.389403, 0.2196078, 1, 0, 1,
-0.5898946, 0.9289359, 0.6997715, 0.2117647, 1, 0, 1,
-0.5886971, -0.001519079, -0.9792269, 0.2078431, 1, 0, 1,
-0.5866522, -0.2385615, -3.156828, 0.2, 1, 0, 1,
-0.57753, -0.2488179, -2.417096, 0.1921569, 1, 0, 1,
-0.5703002, -1.643061, -2.556897, 0.1882353, 1, 0, 1,
-0.5671219, -0.1775112, -2.703364, 0.1803922, 1, 0, 1,
-0.5658439, 0.6439935, -0.8639778, 0.1764706, 1, 0, 1,
-0.562107, -0.001601422, -1.424253, 0.1686275, 1, 0, 1,
-0.5603676, 0.2187086, -1.258018, 0.1647059, 1, 0, 1,
-0.5595415, 0.4495783, -1.082648, 0.1568628, 1, 0, 1,
-0.5573819, 0.3732807, -0.2830555, 0.1529412, 1, 0, 1,
-0.5545039, -0.1229797, -3.600426, 0.145098, 1, 0, 1,
-0.5528113, 0.4708165, -2.49661, 0.1411765, 1, 0, 1,
-0.5524615, 0.848186, 1.547332, 0.1333333, 1, 0, 1,
-0.5483844, -0.3540973, -1.322744, 0.1294118, 1, 0, 1,
-0.5441284, -0.5296794, -0.3586319, 0.1215686, 1, 0, 1,
-0.5426891, -0.6321006, -2.096892, 0.1176471, 1, 0, 1,
-0.5347568, -1.156739, -3.487851, 0.1098039, 1, 0, 1,
-0.5347048, -0.05061713, -0.8521832, 0.1058824, 1, 0, 1,
-0.5332462, -0.2627552, -3.140884, 0.09803922, 1, 0, 1,
-0.5325738, 0.9232143, -0.35669, 0.09019608, 1, 0, 1,
-0.5230702, -1.843479, -1.963841, 0.08627451, 1, 0, 1,
-0.5217443, 1.176878, -0.6962129, 0.07843138, 1, 0, 1,
-0.5137343, 1.219637, -0.4385223, 0.07450981, 1, 0, 1,
-0.5085483, 0.665691, -1.069127, 0.06666667, 1, 0, 1,
-0.5074915, -1.754398, -1.94653, 0.0627451, 1, 0, 1,
-0.5049152, -1.802891, -2.226568, 0.05490196, 1, 0, 1,
-0.5040973, 1.697204, -2.130256, 0.05098039, 1, 0, 1,
-0.5036935, 0.5705836, -0.3380426, 0.04313726, 1, 0, 1,
-0.5027702, -2.264437, -4.391957, 0.03921569, 1, 0, 1,
-0.4990412, 1.852107, 1.895401, 0.03137255, 1, 0, 1,
-0.4863195, 0.4454773, 1.279956, 0.02745098, 1, 0, 1,
-0.4847579, 0.5633258, -2.195961, 0.01960784, 1, 0, 1,
-0.4756133, 0.5916339, 0.7898198, 0.01568628, 1, 0, 1,
-0.4711683, -0.4456619, -3.858838, 0.007843138, 1, 0, 1,
-0.47067, -1.395463, -3.562206, 0.003921569, 1, 0, 1,
-0.4669878, 0.02209689, 0.1664135, 0, 1, 0.003921569, 1,
-0.4647211, 0.2615442, -1.203048, 0, 1, 0.01176471, 1,
-0.4643286, -2.123697, -1.690382, 0, 1, 0.01568628, 1,
-0.4631609, 0.8863662, -1.017829, 0, 1, 0.02352941, 1,
-0.4626903, -1.543515, -1.134662, 0, 1, 0.02745098, 1,
-0.4622954, 1.580878, -1.115246, 0, 1, 0.03529412, 1,
-0.4526894, -0.2704718, -2.810856, 0, 1, 0.03921569, 1,
-0.4513686, -1.304286, -2.949702, 0, 1, 0.04705882, 1,
-0.4490523, -1.713049, -3.132281, 0, 1, 0.05098039, 1,
-0.4482252, 1.13007, -0.1653766, 0, 1, 0.05882353, 1,
-0.4463894, 1.842095, -1.213982, 0, 1, 0.0627451, 1,
-0.439162, -0.6475532, -3.109469, 0, 1, 0.07058824, 1,
-0.4343459, -0.7576567, -0.6302835, 0, 1, 0.07450981, 1,
-0.4329899, -1.1035, -1.99338, 0, 1, 0.08235294, 1,
-0.4304889, 1.294654, -0.1212481, 0, 1, 0.08627451, 1,
-0.4297194, 0.8034361, -1.361422, 0, 1, 0.09411765, 1,
-0.4274786, -1.431184, -1.904274, 0, 1, 0.1019608, 1,
-0.4243096, 0.3686446, -0.7574838, 0, 1, 0.1058824, 1,
-0.421337, 0.7077904, -2.109592, 0, 1, 0.1137255, 1,
-0.4203986, -0.03717278, -4.905949, 0, 1, 0.1176471, 1,
-0.4172319, 0.7452154, -1.970337, 0, 1, 0.1254902, 1,
-0.4149818, -1.016637, -2.755521, 0, 1, 0.1294118, 1,
-0.413365, 0.2256487, -2.595405, 0, 1, 0.1372549, 1,
-0.4118709, 0.6411182, -0.8513982, 0, 1, 0.1411765, 1,
-0.4087621, 0.6202214, -0.1098987, 0, 1, 0.1490196, 1,
-0.4059296, 1.773552, -0.2907434, 0, 1, 0.1529412, 1,
-0.4039653, -0.343066, -1.665614, 0, 1, 0.1607843, 1,
-0.4019102, -1.67685, -2.775455, 0, 1, 0.1647059, 1,
-0.4017984, 0.9836161, 0.518538, 0, 1, 0.172549, 1,
-0.4017957, -2.105601, -2.361979, 0, 1, 0.1764706, 1,
-0.3927555, -0.2536441, -2.27966, 0, 1, 0.1843137, 1,
-0.3882101, -1.214933, -2.284009, 0, 1, 0.1882353, 1,
-0.3852732, 0.8377334, -0.1435507, 0, 1, 0.1960784, 1,
-0.384162, 0.1005094, -1.269282, 0, 1, 0.2039216, 1,
-0.3839356, -0.9222676, -3.079456, 0, 1, 0.2078431, 1,
-0.3821168, 0.2830479, 0.8621987, 0, 1, 0.2156863, 1,
-0.3817216, 1.000026, 0.118196, 0, 1, 0.2196078, 1,
-0.3810833, -0.6967425, -1.484218, 0, 1, 0.227451, 1,
-0.3782905, -0.5670467, -0.6687555, 0, 1, 0.2313726, 1,
-0.3766719, 1.42418, -0.1506831, 0, 1, 0.2392157, 1,
-0.3741364, -0.6479691, -2.847401, 0, 1, 0.2431373, 1,
-0.3739446, 0.8280556, 0.6571587, 0, 1, 0.2509804, 1,
-0.3715968, 0.3280236, -0.2400543, 0, 1, 0.254902, 1,
-0.3668065, -0.3013679, -3.31592, 0, 1, 0.2627451, 1,
-0.3661501, 2.093987, 0.4698288, 0, 1, 0.2666667, 1,
-0.3660607, 2.662762, -0.2507841, 0, 1, 0.2745098, 1,
-0.3634154, 0.1838486, -0.7669285, 0, 1, 0.2784314, 1,
-0.3569305, -0.5229574, -2.238616, 0, 1, 0.2862745, 1,
-0.3556647, 0.1763867, -1.931234, 0, 1, 0.2901961, 1,
-0.3548367, -0.02703148, 0.6751513, 0, 1, 0.2980392, 1,
-0.3529758, -0.5358038, -3.664631, 0, 1, 0.3058824, 1,
-0.3508931, 0.2253446, -2.001135, 0, 1, 0.3098039, 1,
-0.3489991, -1.817205, -2.572565, 0, 1, 0.3176471, 1,
-0.3443497, -0.3814349, -1.809088, 0, 1, 0.3215686, 1,
-0.3442693, -0.791182, -4.74912, 0, 1, 0.3294118, 1,
-0.3412462, -0.3532403, -3.728498, 0, 1, 0.3333333, 1,
-0.3374383, -0.4413986, -2.069798, 0, 1, 0.3411765, 1,
-0.3356052, 0.6703131, -0.853215, 0, 1, 0.345098, 1,
-0.3279539, 2.064878, 0.8516791, 0, 1, 0.3529412, 1,
-0.3275464, 0.7955841, 0.2064877, 0, 1, 0.3568628, 1,
-0.3271678, 0.4033338, -0.0540404, 0, 1, 0.3647059, 1,
-0.3234068, -0.7891238, -0.7851446, 0, 1, 0.3686275, 1,
-0.3226608, -0.6921027, -2.074037, 0, 1, 0.3764706, 1,
-0.3217959, -1.357839, -4.074164, 0, 1, 0.3803922, 1,
-0.321784, 1.18197, -0.1000535, 0, 1, 0.3882353, 1,
-0.3211648, -0.4970027, -2.895472, 0, 1, 0.3921569, 1,
-0.3197455, 1.779707, -1.200386, 0, 1, 0.4, 1,
-0.3126993, -0.3174644, -1.787531, 0, 1, 0.4078431, 1,
-0.3125812, 0.1993869, 0.06252128, 0, 1, 0.4117647, 1,
-0.3047908, 1.224186, 1.521954, 0, 1, 0.4196078, 1,
-0.2933197, -0.02884162, 0.01306967, 0, 1, 0.4235294, 1,
-0.2907245, 1.37218, 0.2392536, 0, 1, 0.4313726, 1,
-0.2903194, 0.8539887, -0.5028567, 0, 1, 0.4352941, 1,
-0.2896268, -0.4450016, -2.732257, 0, 1, 0.4431373, 1,
-0.2880712, 0.1849233, -0.004265069, 0, 1, 0.4470588, 1,
-0.2864462, 0.7070476, 0.5273873, 0, 1, 0.454902, 1,
-0.2830384, -1.215798, -4.752496, 0, 1, 0.4588235, 1,
-0.2781183, 0.8479242, 0.06117881, 0, 1, 0.4666667, 1,
-0.2767116, -1.037822, -2.884475, 0, 1, 0.4705882, 1,
-0.270382, -1.036662, -3.285005, 0, 1, 0.4784314, 1,
-0.2662271, 1.084565, -0.01101991, 0, 1, 0.4823529, 1,
-0.2627898, 0.2297927, -0.8349981, 0, 1, 0.4901961, 1,
-0.2620539, 1.148217, -0.6102218, 0, 1, 0.4941176, 1,
-0.2611234, -0.3167135, -2.012981, 0, 1, 0.5019608, 1,
-0.2560012, 0.348809, -1.086296, 0, 1, 0.509804, 1,
-0.2554857, -1.074976, -2.125399, 0, 1, 0.5137255, 1,
-0.2539774, -0.3052815, -0.5749623, 0, 1, 0.5215687, 1,
-0.2533141, -0.8092832, -2.52167, 0, 1, 0.5254902, 1,
-0.2515208, -0.5574394, -4.271993, 0, 1, 0.5333334, 1,
-0.2505421, 1.381953, -0.9019664, 0, 1, 0.5372549, 1,
-0.2502314, -0.280666, -3.603332, 0, 1, 0.5450981, 1,
-0.2459386, 1.700482, -1.772702, 0, 1, 0.5490196, 1,
-0.2416975, 0.9149782, -0.6764078, 0, 1, 0.5568628, 1,
-0.2390628, -0.4590763, -2.167975, 0, 1, 0.5607843, 1,
-0.2375531, -0.8306728, -5.352921, 0, 1, 0.5686275, 1,
-0.2357009, 2.09835, -0.1062805, 0, 1, 0.572549, 1,
-0.2349357, -0.9376205, -3.414004, 0, 1, 0.5803922, 1,
-0.2258719, 1.383068, -1.29139, 0, 1, 0.5843138, 1,
-0.2205273, 0.9267586, -1.779889, 0, 1, 0.5921569, 1,
-0.2190982, -0.8427577, -3.516552, 0, 1, 0.5960785, 1,
-0.2185118, -0.4438958, -2.24362, 0, 1, 0.6039216, 1,
-0.2182755, -0.2400776, -2.861949, 0, 1, 0.6117647, 1,
-0.2151255, -0.6608771, -2.082027, 0, 1, 0.6156863, 1,
-0.2137748, -0.7755811, -3.408477, 0, 1, 0.6235294, 1,
-0.2121166, -1.142369, -2.420276, 0, 1, 0.627451, 1,
-0.2110889, 0.4980762, 1.372849, 0, 1, 0.6352941, 1,
-0.2068489, 0.1916159, -0.6630893, 0, 1, 0.6392157, 1,
-0.20474, 0.3003722, 1.174093, 0, 1, 0.6470588, 1,
-0.2019311, -0.7301093, -1.6936, 0, 1, 0.6509804, 1,
-0.2019239, -0.3104399, -2.338915, 0, 1, 0.6588235, 1,
-0.1997879, -0.521731, -3.469539, 0, 1, 0.6627451, 1,
-0.1993281, 0.8471429, 1.052836, 0, 1, 0.6705883, 1,
-0.1984384, -0.5226805, -3.473255, 0, 1, 0.6745098, 1,
-0.1969816, 0.1148332, -1.202642, 0, 1, 0.682353, 1,
-0.1955549, -0.8565718, -2.170209, 0, 1, 0.6862745, 1,
-0.193175, -0.1896304, 0.5131075, 0, 1, 0.6941177, 1,
-0.1919506, -0.2106534, -1.548485, 0, 1, 0.7019608, 1,
-0.1881215, 1.033245, 0.8794311, 0, 1, 0.7058824, 1,
-0.183427, 1.249063, -0.1134591, 0, 1, 0.7137255, 1,
-0.1808778, 1.838447, -0.4833325, 0, 1, 0.7176471, 1,
-0.1802204, -0.7153273, -2.797107, 0, 1, 0.7254902, 1,
-0.1793157, -0.1572986, -1.575721, 0, 1, 0.7294118, 1,
-0.1774409, -1.155102, -2.406379, 0, 1, 0.7372549, 1,
-0.1751695, 0.004840983, -0.7985031, 0, 1, 0.7411765, 1,
-0.1748579, 1.359887, -0.02695536, 0, 1, 0.7490196, 1,
-0.1731814, 0.3765517, -2.618701, 0, 1, 0.7529412, 1,
-0.1705853, -0.09529144, -1.633284, 0, 1, 0.7607843, 1,
-0.1627659, -1.602983, -4.059011, 0, 1, 0.7647059, 1,
-0.1613208, 0.589751, -1.530744, 0, 1, 0.772549, 1,
-0.1563182, 0.1327221, -0.06027518, 0, 1, 0.7764706, 1,
-0.1549655, 0.4920911, -0.9317623, 0, 1, 0.7843137, 1,
-0.1487931, 0.26934, 0.9742858, 0, 1, 0.7882353, 1,
-0.1453664, -0.004600069, -1.260995, 0, 1, 0.7960784, 1,
-0.1441003, -0.7869797, -2.62373, 0, 1, 0.8039216, 1,
-0.138701, 1.123468, -0.3462469, 0, 1, 0.8078431, 1,
-0.1328378, -0.07520491, -0.3397703, 0, 1, 0.8156863, 1,
-0.1295536, 0.5719905, 1.896894, 0, 1, 0.8196079, 1,
-0.1286307, -1.371034, -1.38692, 0, 1, 0.827451, 1,
-0.1286275, -0.5413494, -3.981667, 0, 1, 0.8313726, 1,
-0.1218669, -1.899652, -5.42811, 0, 1, 0.8392157, 1,
-0.1071842, 0.8652551, -2.579933, 0, 1, 0.8431373, 1,
-0.1039019, 1.89963, -0.9743969, 0, 1, 0.8509804, 1,
-0.1022298, -0.3717542, -2.580401, 0, 1, 0.854902, 1,
-0.09830502, 0.2754137, 0.05433826, 0, 1, 0.8627451, 1,
-0.08310201, 0.1497841, 0.02602086, 0, 1, 0.8666667, 1,
-0.07884201, 0.127431, -2.288538, 0, 1, 0.8745098, 1,
-0.07570036, -1.213418, -4.296587, 0, 1, 0.8784314, 1,
-0.07328925, -0.3741857, -1.618882, 0, 1, 0.8862745, 1,
-0.07303461, -1.226166, -3.007106, 0, 1, 0.8901961, 1,
-0.07257231, 1.021302, 0.9219308, 0, 1, 0.8980392, 1,
-0.06864899, 1.692395, -0.3271611, 0, 1, 0.9058824, 1,
-0.06255114, 0.6379522, -1.194504, 0, 1, 0.9098039, 1,
-0.05576828, 0.2561716, 0.7799692, 0, 1, 0.9176471, 1,
-0.05135986, 1.419818, -0.6610021, 0, 1, 0.9215686, 1,
-0.04846724, 0.4068425, -0.5221887, 0, 1, 0.9294118, 1,
-0.04806713, -0.7465796, -0.9594997, 0, 1, 0.9333333, 1,
-0.04490134, -0.9271845, -2.609449, 0, 1, 0.9411765, 1,
-0.04466499, -1.401277, -3.215091, 0, 1, 0.945098, 1,
-0.04366114, 0.08179703, -2.457196, 0, 1, 0.9529412, 1,
-0.04244165, 1.584857, -1.041602, 0, 1, 0.9568627, 1,
-0.04196469, 0.0471713, 0.3113049, 0, 1, 0.9647059, 1,
-0.0412951, 0.6603995, -1.452913, 0, 1, 0.9686275, 1,
-0.04000521, 1.955527, 1.462396, 0, 1, 0.9764706, 1,
-0.03501141, -0.1248528, -2.504131, 0, 1, 0.9803922, 1,
-0.02718432, -1.163774, -2.69378, 0, 1, 0.9882353, 1,
-0.02496449, 1.833532, 0.3903446, 0, 1, 0.9921569, 1,
-0.02467304, -0.3425912, -3.639518, 0, 1, 1, 1,
-0.0147815, -0.9532178, -3.541431, 0, 0.9921569, 1, 1,
-0.01313644, -0.8203267, -3.07512, 0, 0.9882353, 1, 1,
-0.009511662, 0.4728355, 0.1715154, 0, 0.9803922, 1, 1,
-0.008186259, -0.5250971, -4.121808, 0, 0.9764706, 1, 1,
-0.007563208, -1.997369, -3.021448, 0, 0.9686275, 1, 1,
-0.005531068, -0.5024452, -4.73123, 0, 0.9647059, 1, 1,
-0.004911201, 0.2612039, -0.4951571, 0, 0.9568627, 1, 1,
-0.003449806, -0.9964229, -3.341382, 0, 0.9529412, 1, 1,
-0.0007267643, -1.031152, -4.389912, 0, 0.945098, 1, 1,
-0.0003090383, 0.3400431, 2.333978, 0, 0.9411765, 1, 1,
0.0002209492, -1.373769, 2.291987, 0, 0.9333333, 1, 1,
0.0008494773, 0.2412296, 0.01161133, 0, 0.9294118, 1, 1,
0.003160816, 1.675636, 1.485688, 0, 0.9215686, 1, 1,
0.0107146, -0.5445409, 3.868398, 0, 0.9176471, 1, 1,
0.02390856, -0.1326011, 3.77665, 0, 0.9098039, 1, 1,
0.03236204, -0.08648963, 4.292878, 0, 0.9058824, 1, 1,
0.03966201, 0.1221945, 1.038722, 0, 0.8980392, 1, 1,
0.04175355, -0.08864497, 4.281494, 0, 0.8901961, 1, 1,
0.04801366, -0.1585992, 0.349526, 0, 0.8862745, 1, 1,
0.05100188, 0.5135767, 0.03721512, 0, 0.8784314, 1, 1,
0.05447025, 0.1229386, -0.950545, 0, 0.8745098, 1, 1,
0.05500408, 0.8800339, 2.630858, 0, 0.8666667, 1, 1,
0.06186348, -0.3229032, 3.532404, 0, 0.8627451, 1, 1,
0.06199994, -0.2157035, 4.643003, 0, 0.854902, 1, 1,
0.06264471, 0.03852028, 2.117738, 0, 0.8509804, 1, 1,
0.06283639, 0.1113321, 0.9322057, 0, 0.8431373, 1, 1,
0.07106268, -0.1619552, 1.71087, 0, 0.8392157, 1, 1,
0.07284469, -0.7456666, 5.567461, 0, 0.8313726, 1, 1,
0.07645959, -1.555934, 3.150984, 0, 0.827451, 1, 1,
0.07847475, 1.942091, 0.4513471, 0, 0.8196079, 1, 1,
0.08250362, -0.8773013, 2.365644, 0, 0.8156863, 1, 1,
0.08458906, 0.5096791, 0.2650572, 0, 0.8078431, 1, 1,
0.08512001, -0.5211458, 2.493298, 0, 0.8039216, 1, 1,
0.08617366, -0.6641861, 2.015199, 0, 0.7960784, 1, 1,
0.08989353, -0.3870195, 2.662357, 0, 0.7882353, 1, 1,
0.09251725, 0.03486393, 1.220364, 0, 0.7843137, 1, 1,
0.09767499, -0.3384678, 2.838504, 0, 0.7764706, 1, 1,
0.1042872, -0.4000408, 4.317217, 0, 0.772549, 1, 1,
0.1043195, -1.311685, 4.63211, 0, 0.7647059, 1, 1,
0.1055457, 0.3607571, -1.333259, 0, 0.7607843, 1, 1,
0.1060502, -0.6873381, 3.542623, 0, 0.7529412, 1, 1,
0.108435, -0.9263435, 1.618447, 0, 0.7490196, 1, 1,
0.1096819, 0.4345771, 0.39479, 0, 0.7411765, 1, 1,
0.111864, 0.579476, -0.2453122, 0, 0.7372549, 1, 1,
0.1154294, 0.03856048, 1.778109, 0, 0.7294118, 1, 1,
0.1162746, 1.309959, -1.031697, 0, 0.7254902, 1, 1,
0.1163388, 1.307448, -2.112866, 0, 0.7176471, 1, 1,
0.1182222, -1.096024, 3.265529, 0, 0.7137255, 1, 1,
0.1195215, -0.3871863, 3.698915, 0, 0.7058824, 1, 1,
0.1199285, 1.142976, -2.416056, 0, 0.6980392, 1, 1,
0.1212754, 0.9929836, 0.5504953, 0, 0.6941177, 1, 1,
0.1218165, 0.2233391, 0.1687112, 0, 0.6862745, 1, 1,
0.133017, -0.8477185, 2.089154, 0, 0.682353, 1, 1,
0.1334166, 0.5460215, -0.5787201, 0, 0.6745098, 1, 1,
0.1335612, -0.3044539, 3.145863, 0, 0.6705883, 1, 1,
0.1346756, 1.511814, 0.7430698, 0, 0.6627451, 1, 1,
0.1361886, 0.3048066, 1.736656, 0, 0.6588235, 1, 1,
0.137773, 0.5357525, -0.02644914, 0, 0.6509804, 1, 1,
0.1378634, -1.210046, 3.540941, 0, 0.6470588, 1, 1,
0.1387719, -0.05759123, 1.978301, 0, 0.6392157, 1, 1,
0.1414168, -0.4447676, 2.437512, 0, 0.6352941, 1, 1,
0.1438098, -1.417825, 2.674692, 0, 0.627451, 1, 1,
0.1446559, -0.2697383, 2.799503, 0, 0.6235294, 1, 1,
0.1460749, 1.049715, -0.813725, 0, 0.6156863, 1, 1,
0.1508348, -0.3375576, 3.513246, 0, 0.6117647, 1, 1,
0.1521611, -0.1508263, 2.322152, 0, 0.6039216, 1, 1,
0.1536664, 0.04621078, -0.09846666, 0, 0.5960785, 1, 1,
0.1559073, -0.3170038, 1.719835, 0, 0.5921569, 1, 1,
0.1579807, 3.029201, 1.620524, 0, 0.5843138, 1, 1,
0.1589293, 0.1987634, 1.883752, 0, 0.5803922, 1, 1,
0.1618809, -2.75932, 2.49916, 0, 0.572549, 1, 1,
0.1626725, 0.05503613, 0.8011376, 0, 0.5686275, 1, 1,
0.1645726, 0.5183491, -0.8453099, 0, 0.5607843, 1, 1,
0.1709971, 2.044017, 0.3386005, 0, 0.5568628, 1, 1,
0.1745862, -1.58542, 2.576264, 0, 0.5490196, 1, 1,
0.1779968, 1.122591, 0.710165, 0, 0.5450981, 1, 1,
0.1782906, -0.1083684, 4.091665, 0, 0.5372549, 1, 1,
0.1809741, -0.6014074, 2.476708, 0, 0.5333334, 1, 1,
0.181886, 1.876014, 1.404133, 0, 0.5254902, 1, 1,
0.1835518, 0.1174545, 0.9973407, 0, 0.5215687, 1, 1,
0.1926983, -0.8680395, 4.644667, 0, 0.5137255, 1, 1,
0.1931333, 0.2576519, 0.9906671, 0, 0.509804, 1, 1,
0.1938556, 0.2378971, 1.13689, 0, 0.5019608, 1, 1,
0.1969898, 1.133217, -1.227153, 0, 0.4941176, 1, 1,
0.2014092, 0.900706, 2.014635, 0, 0.4901961, 1, 1,
0.2015452, -1.024938, 1.13983, 0, 0.4823529, 1, 1,
0.2035188, -1.187654, 3.082793, 0, 0.4784314, 1, 1,
0.2038194, 0.09514572, 0.2788603, 0, 0.4705882, 1, 1,
0.2054067, -1.053439, 1.193628, 0, 0.4666667, 1, 1,
0.2066478, 0.7928771, 0.5069448, 0, 0.4588235, 1, 1,
0.2123628, 0.04273421, 3.543761, 0, 0.454902, 1, 1,
0.2147408, 0.8560149, -2.03632, 0, 0.4470588, 1, 1,
0.21506, -1.130927, 4.112327, 0, 0.4431373, 1, 1,
0.2194382, 0.7321802, 0.1646224, 0, 0.4352941, 1, 1,
0.2218685, -0.52142, 2.758571, 0, 0.4313726, 1, 1,
0.2240383, -0.2359598, 1.496444, 0, 0.4235294, 1, 1,
0.228638, -0.8793404, 2.119279, 0, 0.4196078, 1, 1,
0.2318978, -0.2375685, 0.715494, 0, 0.4117647, 1, 1,
0.2358501, 0.1188507, 0.6370274, 0, 0.4078431, 1, 1,
0.2367177, -0.3878724, 3.633743, 0, 0.4, 1, 1,
0.2430076, 2.991579, -0.5684685, 0, 0.3921569, 1, 1,
0.2474586, -0.4184968, 1.916759, 0, 0.3882353, 1, 1,
0.2525616, 0.4100295, 1.084796, 0, 0.3803922, 1, 1,
0.2543758, 0.443996, -0.3180365, 0, 0.3764706, 1, 1,
0.255401, -0.4666295, 2.609894, 0, 0.3686275, 1, 1,
0.2566431, 0.9137985, 0.1762643, 0, 0.3647059, 1, 1,
0.2631506, -0.7952864, 2.36571, 0, 0.3568628, 1, 1,
0.2650498, 1.990118, -1.255381, 0, 0.3529412, 1, 1,
0.2667359, 0.2607524, -0.005289327, 0, 0.345098, 1, 1,
0.2677279, 0.03234734, 0.9884626, 0, 0.3411765, 1, 1,
0.2751701, 0.2458293, 1.444153, 0, 0.3333333, 1, 1,
0.2764531, -0.783255, 2.528858, 0, 0.3294118, 1, 1,
0.2774545, 0.7724184, 0.2788238, 0, 0.3215686, 1, 1,
0.2869511, -1.106621, 4.40256, 0, 0.3176471, 1, 1,
0.2875633, -1.349321, 2.997561, 0, 0.3098039, 1, 1,
0.2881051, -1.187554, 4.199852, 0, 0.3058824, 1, 1,
0.2889162, -0.06187885, 2.705891, 0, 0.2980392, 1, 1,
0.2890114, 0.7886829, -0.2097577, 0, 0.2901961, 1, 1,
0.2890899, 0.8278055, -1.052272, 0, 0.2862745, 1, 1,
0.289955, -0.8774168, 4.005318, 0, 0.2784314, 1, 1,
0.2974741, 0.9800093, 0.9277301, 0, 0.2745098, 1, 1,
0.2983834, -0.8727992, 3.729254, 0, 0.2666667, 1, 1,
0.2993248, 1.11503, -0.7207186, 0, 0.2627451, 1, 1,
0.2995096, 0.05132748, 0.5769527, 0, 0.254902, 1, 1,
0.3013529, 0.6144872, 1.423033, 0, 0.2509804, 1, 1,
0.3128504, -0.5926971, 0.8209025, 0, 0.2431373, 1, 1,
0.314401, 0.1062162, 0.7609226, 0, 0.2392157, 1, 1,
0.3147259, -0.06038569, 2.317113, 0, 0.2313726, 1, 1,
0.3163027, -0.2885955, 1.206338, 0, 0.227451, 1, 1,
0.3199337, 0.234159, -0.3460688, 0, 0.2196078, 1, 1,
0.3278737, 0.7007873, 1.056134, 0, 0.2156863, 1, 1,
0.3293234, -0.03720454, 0.2581353, 0, 0.2078431, 1, 1,
0.3304474, -0.3830902, -0.2237724, 0, 0.2039216, 1, 1,
0.3311841, -0.02768734, 2.645592, 0, 0.1960784, 1, 1,
0.3380167, -0.2711898, 2.955211, 0, 0.1882353, 1, 1,
0.3403428, 0.7586836, 0.3864369, 0, 0.1843137, 1, 1,
0.3427015, -2.390237, 1.501491, 0, 0.1764706, 1, 1,
0.3431066, -0.9390159, 3.170086, 0, 0.172549, 1, 1,
0.3477158, 0.9125406, -1.659895, 0, 0.1647059, 1, 1,
0.3482357, 0.2882187, 0.7088965, 0, 0.1607843, 1, 1,
0.3503088, 0.7224793, -1.519554, 0, 0.1529412, 1, 1,
0.3534316, -2.249107, 3.432475, 0, 0.1490196, 1, 1,
0.3550361, -0.8980286, 2.783812, 0, 0.1411765, 1, 1,
0.3555241, 0.3523163, 0.9737852, 0, 0.1372549, 1, 1,
0.359135, -0.551877, 2.474647, 0, 0.1294118, 1, 1,
0.3596293, -0.2866756, 1.314859, 0, 0.1254902, 1, 1,
0.362377, -1.525986, 3.217503, 0, 0.1176471, 1, 1,
0.3637641, 1.532434, -0.2955907, 0, 0.1137255, 1, 1,
0.3650775, -0.4688462, 2.158079, 0, 0.1058824, 1, 1,
0.3698081, -0.6220877, 2.038896, 0, 0.09803922, 1, 1,
0.3725145, 0.9661109, 0.4580234, 0, 0.09411765, 1, 1,
0.372618, -0.4859224, 1.816496, 0, 0.08627451, 1, 1,
0.3779444, -0.006754065, 1.226233, 0, 0.08235294, 1, 1,
0.3780075, -0.5970933, 1.702425, 0, 0.07450981, 1, 1,
0.3798925, 0.5489169, -0.06993101, 0, 0.07058824, 1, 1,
0.3837061, 0.09369962, 2.701728, 0, 0.0627451, 1, 1,
0.3872029, 1.623093, 0.9419366, 0, 0.05882353, 1, 1,
0.3872347, -1.347268, 2.381617, 0, 0.05098039, 1, 1,
0.394142, -1.064902, 1.972436, 0, 0.04705882, 1, 1,
0.3947827, 1.586159, 1.121029, 0, 0.03921569, 1, 1,
0.4041103, 0.6845839, 2.238014, 0, 0.03529412, 1, 1,
0.4043876, -0.3245242, 2.410326, 0, 0.02745098, 1, 1,
0.4054593, 0.9582067, 1.633184, 0, 0.02352941, 1, 1,
0.4080985, 0.667098, -0.770279, 0, 0.01568628, 1, 1,
0.4108571, -1.023792, 3.630314, 0, 0.01176471, 1, 1,
0.4124483, -0.3384714, 1.323203, 0, 0.003921569, 1, 1,
0.4207653, 0.7690445, -0.2907196, 0.003921569, 0, 1, 1,
0.4309814, 0.302638, -0.003229144, 0.007843138, 0, 1, 1,
0.4315883, -1.494702, 2.986265, 0.01568628, 0, 1, 1,
0.4446529, 0.05090076, 1.983443, 0.01960784, 0, 1, 1,
0.4475307, -0.2660817, 0.4010745, 0.02745098, 0, 1, 1,
0.4533913, -0.5342575, 2.340143, 0.03137255, 0, 1, 1,
0.4547616, -0.05782046, 2.921733, 0.03921569, 0, 1, 1,
0.4557435, 0.3692772, 0.7919084, 0.04313726, 0, 1, 1,
0.4589731, 0.533069, 0.8975249, 0.05098039, 0, 1, 1,
0.4593975, -0.3930741, 2.004369, 0.05490196, 0, 1, 1,
0.4599046, -0.4773588, 2.863591, 0.0627451, 0, 1, 1,
0.4623934, -0.1726832, 3.226788, 0.06666667, 0, 1, 1,
0.4633225, -0.7189835, 0.5713059, 0.07450981, 0, 1, 1,
0.4636716, 0.4293623, 1.332489, 0.07843138, 0, 1, 1,
0.4680677, -0.8423765, 3.069272, 0.08627451, 0, 1, 1,
0.4758185, 0.6473405, 1.528908, 0.09019608, 0, 1, 1,
0.4796297, 0.8199199, -0.9178652, 0.09803922, 0, 1, 1,
0.4820966, 0.5206842, -0.7777058, 0.1058824, 0, 1, 1,
0.4853452, -0.4639858, 2.097769, 0.1098039, 0, 1, 1,
0.4857537, -0.544373, 1.834374, 0.1176471, 0, 1, 1,
0.4903112, 1.382069, 0.675379, 0.1215686, 0, 1, 1,
0.4903385, 0.05928788, 1.489233, 0.1294118, 0, 1, 1,
0.4925754, -0.6471106, 1.883743, 0.1333333, 0, 1, 1,
0.4939232, -0.9869353, 2.925167, 0.1411765, 0, 1, 1,
0.495706, -0.7742524, 4.513648, 0.145098, 0, 1, 1,
0.4975859, 1.046569, 1.974305, 0.1529412, 0, 1, 1,
0.502535, -1.467327, 2.458489, 0.1568628, 0, 1, 1,
0.5042927, -0.06080124, 2.295441, 0.1647059, 0, 1, 1,
0.5066996, 0.002866839, 0.8103284, 0.1686275, 0, 1, 1,
0.514273, 0.7472103, 0.5174562, 0.1764706, 0, 1, 1,
0.5143557, 0.5660512, 3.492509, 0.1803922, 0, 1, 1,
0.5143625, -0.8983009, 2.822794, 0.1882353, 0, 1, 1,
0.5166653, -0.1988567, 1.899709, 0.1921569, 0, 1, 1,
0.5179404, 0.5419256, 1.046434, 0.2, 0, 1, 1,
0.5190445, 0.1464797, 1.733128, 0.2078431, 0, 1, 1,
0.5191042, -0.4990893, 1.953059, 0.2117647, 0, 1, 1,
0.5208331, -0.7410067, 2.119514, 0.2196078, 0, 1, 1,
0.5253404, 0.7447059, 1.268346, 0.2235294, 0, 1, 1,
0.5253491, -0.07525624, 0.602715, 0.2313726, 0, 1, 1,
0.5279337, -1.338098, 1.770184, 0.2352941, 0, 1, 1,
0.5308909, -2.353973, 2.148854, 0.2431373, 0, 1, 1,
0.5319566, 1.520637, 1.965517, 0.2470588, 0, 1, 1,
0.5437486, 2.303801, 0.8394113, 0.254902, 0, 1, 1,
0.5460842, -0.9909889, 2.364943, 0.2588235, 0, 1, 1,
0.5487883, 1.227924, -0.02128055, 0.2666667, 0, 1, 1,
0.5651376, 0.4794269, 0.8867375, 0.2705882, 0, 1, 1,
0.5709689, -0.1094547, 2.324278, 0.2784314, 0, 1, 1,
0.5855041, 0.7752347, -0.421817, 0.282353, 0, 1, 1,
0.5861205, 0.904483, 2.287724, 0.2901961, 0, 1, 1,
0.5877651, 0.4785759, 1.669554, 0.2941177, 0, 1, 1,
0.5937443, 0.06568968, 2.851937, 0.3019608, 0, 1, 1,
0.5941117, -0.472173, 2.598227, 0.3098039, 0, 1, 1,
0.6043801, 2.015098, 1.125129, 0.3137255, 0, 1, 1,
0.6051899, 0.8144437, 0.3263862, 0.3215686, 0, 1, 1,
0.6057696, -0.6671222, 1.980386, 0.3254902, 0, 1, 1,
0.6073231, -1.134583, 3.698268, 0.3333333, 0, 1, 1,
0.611187, -1.563933, 1.880212, 0.3372549, 0, 1, 1,
0.6123689, 1.107425, -0.9487749, 0.345098, 0, 1, 1,
0.6179459, -0.8365144, 3.033977, 0.3490196, 0, 1, 1,
0.6224289, 0.7581688, -1.069088, 0.3568628, 0, 1, 1,
0.6275078, 0.2122816, 3.175902, 0.3607843, 0, 1, 1,
0.628158, 2.375446, 1.306167, 0.3686275, 0, 1, 1,
0.6283244, 0.2459934, 1.873432, 0.372549, 0, 1, 1,
0.6310289, 0.7919435, -0.05568479, 0.3803922, 0, 1, 1,
0.6334084, 1.046607, 0.4558558, 0.3843137, 0, 1, 1,
0.6339074, 0.1043824, 1.434897, 0.3921569, 0, 1, 1,
0.6358044, -0.1461829, 2.655754, 0.3960784, 0, 1, 1,
0.6386489, 0.9372519, 1.762042, 0.4039216, 0, 1, 1,
0.6413068, 0.2672567, 0.6683445, 0.4117647, 0, 1, 1,
0.6417067, -0.5476364, 0.8638468, 0.4156863, 0, 1, 1,
0.642495, -1.790111, 2.552301, 0.4235294, 0, 1, 1,
0.6495528, 1.008667, 0.2851468, 0.427451, 0, 1, 1,
0.6514295, 0.5022156, 0.4123761, 0.4352941, 0, 1, 1,
0.6559033, 0.3036591, 2.828995, 0.4392157, 0, 1, 1,
0.6583689, 0.1837617, 1.7347, 0.4470588, 0, 1, 1,
0.6606382, -1.669793, 2.8652, 0.4509804, 0, 1, 1,
0.6613211, 0.7074422, 1.573779, 0.4588235, 0, 1, 1,
0.6620275, -0.8226975, 2.548907, 0.4627451, 0, 1, 1,
0.6622396, 0.388938, 0.1837662, 0.4705882, 0, 1, 1,
0.663107, -0.07647055, 0.8085897, 0.4745098, 0, 1, 1,
0.6653976, 1.147538, 0.8268983, 0.4823529, 0, 1, 1,
0.6680334, 0.1748045, 0.1988803, 0.4862745, 0, 1, 1,
0.669199, 0.6943942, -0.1639553, 0.4941176, 0, 1, 1,
0.6693192, -0.1535914, 0.4574108, 0.5019608, 0, 1, 1,
0.6694373, 1.256506, -0.40895, 0.5058824, 0, 1, 1,
0.6728497, 0.3336101, 0.1892051, 0.5137255, 0, 1, 1,
0.6757914, 0.8073333, 0.5925524, 0.5176471, 0, 1, 1,
0.6759588, -1.406949, 3.590842, 0.5254902, 0, 1, 1,
0.6797149, 0.7040094, 3.000908, 0.5294118, 0, 1, 1,
0.6816167, 0.5511952, 1.414278, 0.5372549, 0, 1, 1,
0.6860825, 1.13031, -0.2101353, 0.5411765, 0, 1, 1,
0.6985136, 0.7731133, 0.2469739, 0.5490196, 0, 1, 1,
0.7008608, 0.1387352, 2.114836, 0.5529412, 0, 1, 1,
0.7057521, -0.01022907, 2.425218, 0.5607843, 0, 1, 1,
0.7058627, 0.3758165, 1.296192, 0.5647059, 0, 1, 1,
0.7104502, 1.471458, -0.004469004, 0.572549, 0, 1, 1,
0.7191694, -1.355993, 3.436443, 0.5764706, 0, 1, 1,
0.7197074, 0.07316118, 2.25129, 0.5843138, 0, 1, 1,
0.72052, 0.3809971, 0.3979645, 0.5882353, 0, 1, 1,
0.7225236, -0.1275759, 4.688449, 0.5960785, 0, 1, 1,
0.7244657, -1.170577, 4.005277, 0.6039216, 0, 1, 1,
0.7259166, -1.415362, 3.908896, 0.6078432, 0, 1, 1,
0.7301115, -0.4904348, 1.911723, 0.6156863, 0, 1, 1,
0.7338644, 0.6977693, -0.7840623, 0.6196079, 0, 1, 1,
0.7352766, 0.3583585, 1.864582, 0.627451, 0, 1, 1,
0.7364698, 1.017182, 0.3005746, 0.6313726, 0, 1, 1,
0.7383186, 0.1517626, -0.7792843, 0.6392157, 0, 1, 1,
0.7419134, -0.4398852, 1.583314, 0.6431373, 0, 1, 1,
0.7423936, -1.868155, 4.431099, 0.6509804, 0, 1, 1,
0.7469504, 0.8114558, 1.813225, 0.654902, 0, 1, 1,
0.747166, 0.2439373, -0.4501175, 0.6627451, 0, 1, 1,
0.7501916, 2.171098, 0.2820286, 0.6666667, 0, 1, 1,
0.7575444, 0.5245034, 2.121869, 0.6745098, 0, 1, 1,
0.7598671, 0.1542779, 0.8149772, 0.6784314, 0, 1, 1,
0.7650693, 1.657384, -0.8997914, 0.6862745, 0, 1, 1,
0.7689618, -0.5454963, 2.566434, 0.6901961, 0, 1, 1,
0.7691144, -0.9151925, 2.643911, 0.6980392, 0, 1, 1,
0.7703292, -0.5330062, 2.266793, 0.7058824, 0, 1, 1,
0.7708982, -1.34961, 2.637455, 0.7098039, 0, 1, 1,
0.7739561, -0.3827173, 0.9955676, 0.7176471, 0, 1, 1,
0.7762512, 0.9525849, 0.4053808, 0.7215686, 0, 1, 1,
0.7815101, -0.6307555, 3.414586, 0.7294118, 0, 1, 1,
0.7871572, 0.3228308, 3.117245, 0.7333333, 0, 1, 1,
0.789542, 0.1726372, 0.5461324, 0.7411765, 0, 1, 1,
0.798125, -0.6800849, 1.139285, 0.7450981, 0, 1, 1,
0.8010964, -0.5495639, 1.057401, 0.7529412, 0, 1, 1,
0.8012344, 0.4095367, 2.381793, 0.7568628, 0, 1, 1,
0.8070273, 1.702361, -0.4079399, 0.7647059, 0, 1, 1,
0.8076659, 1.04405, 0.6886997, 0.7686275, 0, 1, 1,
0.8086201, -0.04489795, 1.765654, 0.7764706, 0, 1, 1,
0.8092357, 0.9486338, 0.8615977, 0.7803922, 0, 1, 1,
0.8109857, -0.7440195, 0.705856, 0.7882353, 0, 1, 1,
0.8127407, 0.6068788, -0.2096968, 0.7921569, 0, 1, 1,
0.820541, -1.231035, 1.088171, 0.8, 0, 1, 1,
0.8266748, 0.7368993, 0.1643261, 0.8078431, 0, 1, 1,
0.8269033, 0.1682528, 0.5242668, 0.8117647, 0, 1, 1,
0.8315441, 1.916324, 0.254572, 0.8196079, 0, 1, 1,
0.8335832, -0.301647, 3.238777, 0.8235294, 0, 1, 1,
0.8345029, -0.8602182, 3.255639, 0.8313726, 0, 1, 1,
0.8376747, -1.688649, 1.639478, 0.8352941, 0, 1, 1,
0.8402762, 0.6560287, -0.1667595, 0.8431373, 0, 1, 1,
0.8412312, -1.324454, 2.265725, 0.8470588, 0, 1, 1,
0.8430262, -0.8059444, 2.588722, 0.854902, 0, 1, 1,
0.8499795, 0.8954411, 0.1018977, 0.8588235, 0, 1, 1,
0.8529631, -1.637227, 4.733101, 0.8666667, 0, 1, 1,
0.8573638, 0.6491971, 1.297894, 0.8705882, 0, 1, 1,
0.8575735, 2.03363, -0.2056444, 0.8784314, 0, 1, 1,
0.859445, 0.7511225, -0.4736531, 0.8823529, 0, 1, 1,
0.8659374, 1.468356, 0.4147138, 0.8901961, 0, 1, 1,
0.8700793, -0.3616101, 1.045419, 0.8941177, 0, 1, 1,
0.8704705, -1.097828, 0.7981688, 0.9019608, 0, 1, 1,
0.8724362, 0.8471418, 0.8856828, 0.9098039, 0, 1, 1,
0.8780351, -0.3297118, 1.386288, 0.9137255, 0, 1, 1,
0.8793322, -0.4355125, 1.852567, 0.9215686, 0, 1, 1,
0.8858604, 0.9566182, 0.9815222, 0.9254902, 0, 1, 1,
0.896722, 0.7281544, 2.005269, 0.9333333, 0, 1, 1,
0.8999784, 0.5737171, 0.167542, 0.9372549, 0, 1, 1,
0.9028712, 0.2396107, 0.9968684, 0.945098, 0, 1, 1,
0.9058314, 0.4975194, 1.278219, 0.9490196, 0, 1, 1,
0.9084944, 0.5815348, 1.155011, 0.9568627, 0, 1, 1,
0.9101457, 0.5816165, 0.9116367, 0.9607843, 0, 1, 1,
0.9169525, -0.1400693, 1.443151, 0.9686275, 0, 1, 1,
0.9175457, -0.8234982, 2.350184, 0.972549, 0, 1, 1,
0.9190935, -0.3504397, 2.075184, 0.9803922, 0, 1, 1,
0.9226606, 0.8419756, -0.5976576, 0.9843137, 0, 1, 1,
0.9278592, -0.5901986, 2.410707, 0.9921569, 0, 1, 1,
0.9315141, -1.070418, 1.676373, 0.9960784, 0, 1, 1,
0.9337551, -1.466153, 0.7950135, 1, 0, 0.9960784, 1,
0.9574907, -0.7511849, 2.468738, 1, 0, 0.9882353, 1,
0.9632282, 1.194161, 1.676192, 1, 0, 0.9843137, 1,
0.9648255, -0.7109124, 3.021561, 1, 0, 0.9764706, 1,
0.9658, 0.3190858, -0.2018597, 1, 0, 0.972549, 1,
0.9677918, 0.05190846, 1.385958, 1, 0, 0.9647059, 1,
0.9684118, 0.2794182, 1.796272, 1, 0, 0.9607843, 1,
0.9764326, -1.463192, 1.707228, 1, 0, 0.9529412, 1,
0.982016, 0.02498119, 1.924104, 1, 0, 0.9490196, 1,
0.9930432, 0.3201615, 3.025885, 1, 0, 0.9411765, 1,
1.001499, -0.03307539, -0.9208527, 1, 0, 0.9372549, 1,
1.002356, -0.1175336, 1.472143, 1, 0, 0.9294118, 1,
1.008847, -1.200572, 3.807226, 1, 0, 0.9254902, 1,
1.010015, -1.974305, 3.570693, 1, 0, 0.9176471, 1,
1.011297, 0.06049584, 1.645444, 1, 0, 0.9137255, 1,
1.015434, -1.198934, 1.833018, 1, 0, 0.9058824, 1,
1.039811, -0.7091066, 2.686742, 1, 0, 0.9019608, 1,
1.04015, 0.3406141, 0.6364763, 1, 0, 0.8941177, 1,
1.041237, 0.3997172, 0.2895383, 1, 0, 0.8862745, 1,
1.054329, 1.171021, -0.1999631, 1, 0, 0.8823529, 1,
1.054476, 0.1126522, 0.6536229, 1, 0, 0.8745098, 1,
1.066595, -0.005594065, 2.080127, 1, 0, 0.8705882, 1,
1.072339, 1.250716, 1.181601, 1, 0, 0.8627451, 1,
1.077829, -1.361869, 3.333777, 1, 0, 0.8588235, 1,
1.087434, -0.2868755, 2.284842, 1, 0, 0.8509804, 1,
1.087567, -0.8105381, 1.317877, 1, 0, 0.8470588, 1,
1.088292, -0.5275585, 1.396389, 1, 0, 0.8392157, 1,
1.096608, -0.8332352, 1.586157, 1, 0, 0.8352941, 1,
1.100409, -0.1230741, 1.959073, 1, 0, 0.827451, 1,
1.102767, 0.2222962, 1.686548, 1, 0, 0.8235294, 1,
1.10753, -2.641596, 3.291977, 1, 0, 0.8156863, 1,
1.112534, -0.5828409, 0.6347004, 1, 0, 0.8117647, 1,
1.11391, -1.780893, 2.824538, 1, 0, 0.8039216, 1,
1.114725, 0.03228752, 0.3279044, 1, 0, 0.7960784, 1,
1.117714, -0.9977321, 1.786384, 1, 0, 0.7921569, 1,
1.123699, 0.3678432, -0.6171699, 1, 0, 0.7843137, 1,
1.125865, 1.509615, 2.682705, 1, 0, 0.7803922, 1,
1.12805, 1.513846, 2.185474, 1, 0, 0.772549, 1,
1.129771, 0.7886632, -1.873258, 1, 0, 0.7686275, 1,
1.135221, 0.8595865, 0.8647434, 1, 0, 0.7607843, 1,
1.136952, -0.04686145, 1.360946, 1, 0, 0.7568628, 1,
1.170331, -0.9732156, 3.047846, 1, 0, 0.7490196, 1,
1.175603, -0.7145711, 1.801275, 1, 0, 0.7450981, 1,
1.17662, -0.1187723, 0.8391232, 1, 0, 0.7372549, 1,
1.181538, 1.447509, -0.07513838, 1, 0, 0.7333333, 1,
1.184492, -1.095842, 0.724486, 1, 0, 0.7254902, 1,
1.186355, -0.6431149, 2.395845, 1, 0, 0.7215686, 1,
1.188428, -0.7671276, 1.210139, 1, 0, 0.7137255, 1,
1.190426, -1.231269, 2.789567, 1, 0, 0.7098039, 1,
1.202809, -0.5685948, 0.1874333, 1, 0, 0.7019608, 1,
1.204091, 0.7687002, 1.950586, 1, 0, 0.6941177, 1,
1.220382, 0.1715956, 0.2049426, 1, 0, 0.6901961, 1,
1.224579, 0.03280816, 0.6341029, 1, 0, 0.682353, 1,
1.231194, -0.5249057, 1.040339, 1, 0, 0.6784314, 1,
1.243137, -0.7162037, 2.625225, 1, 0, 0.6705883, 1,
1.253696, -0.5954364, 2.36543, 1, 0, 0.6666667, 1,
1.261783, 0.7407513, -0.1150991, 1, 0, 0.6588235, 1,
1.265244, 0.3360097, 2.129996, 1, 0, 0.654902, 1,
1.265449, 0.3303812, 0.8234508, 1, 0, 0.6470588, 1,
1.265659, 0.9266006, -0.4845405, 1, 0, 0.6431373, 1,
1.266772, -0.5360622, 2.223154, 1, 0, 0.6352941, 1,
1.266792, -1.64939, 2.118813, 1, 0, 0.6313726, 1,
1.269466, 0.8012115, 0.329655, 1, 0, 0.6235294, 1,
1.275116, -0.7201502, 0.2163577, 1, 0, 0.6196079, 1,
1.28126, 0.3767691, 2.552958, 1, 0, 0.6117647, 1,
1.281631, -0.06811175, 1.969125, 1, 0, 0.6078432, 1,
1.283452, 0.6326728, 1.397598, 1, 0, 0.6, 1,
1.289314, 0.3409441, 1.68941, 1, 0, 0.5921569, 1,
1.290719, 0.3464971, 1.02049, 1, 0, 0.5882353, 1,
1.294981, -1.442832, 3.546428, 1, 0, 0.5803922, 1,
1.303401, 0.8131981, 1.883482, 1, 0, 0.5764706, 1,
1.344466, 2.683074, 0.4907119, 1, 0, 0.5686275, 1,
1.345144, -1.018337, 2.27454, 1, 0, 0.5647059, 1,
1.34972, -0.2619234, 1.579873, 1, 0, 0.5568628, 1,
1.35228, -0.3006658, 1.467993, 1, 0, 0.5529412, 1,
1.356351, 1.192033, 0.1104689, 1, 0, 0.5450981, 1,
1.362304, -0.2655829, 2.755112, 1, 0, 0.5411765, 1,
1.370868, -0.133579, 1.785901, 1, 0, 0.5333334, 1,
1.380602, 0.6323714, 3.144, 1, 0, 0.5294118, 1,
1.391821, 0.7598461, 2.697434, 1, 0, 0.5215687, 1,
1.399753, -0.03911607, 1.775546, 1, 0, 0.5176471, 1,
1.403125, 0.03997919, 1.611614, 1, 0, 0.509804, 1,
1.409892, 0.5626512, 2.553945, 1, 0, 0.5058824, 1,
1.421912, 1.257791, 2.207821, 1, 0, 0.4980392, 1,
1.433003, 0.01049956, 1.853483, 1, 0, 0.4901961, 1,
1.434079, -1.224318, 2.953941, 1, 0, 0.4862745, 1,
1.437672, 0.4619482, 0.777254, 1, 0, 0.4784314, 1,
1.438936, -0.8731442, 1.214891, 1, 0, 0.4745098, 1,
1.442512, 0.8839, 1.060284, 1, 0, 0.4666667, 1,
1.451029, -1.488728, 0.5928827, 1, 0, 0.4627451, 1,
1.451109, 0.9393643, -0.4315075, 1, 0, 0.454902, 1,
1.456774, 1.16743, -1.194872, 1, 0, 0.4509804, 1,
1.459702, 0.5542004, 0.9761785, 1, 0, 0.4431373, 1,
1.46093, 0.6354086, 0.7600272, 1, 0, 0.4392157, 1,
1.466441, -0.2863469, 1.369968, 1, 0, 0.4313726, 1,
1.473417, -0.9545496, 1.339664, 1, 0, 0.427451, 1,
1.475015, -1.277717, 0.8848484, 1, 0, 0.4196078, 1,
1.496675, -0.5605675, 4.282706, 1, 0, 0.4156863, 1,
1.501334, 0.5080732, 1.615131, 1, 0, 0.4078431, 1,
1.505174, 0.4994926, 1.175886, 1, 0, 0.4039216, 1,
1.507919, -0.3045038, 2.889918, 1, 0, 0.3960784, 1,
1.523064, -0.3485368, 1.00271, 1, 0, 0.3882353, 1,
1.525131, 2.043864, 1.640561, 1, 0, 0.3843137, 1,
1.52656, 1.271561, 1.356506, 1, 0, 0.3764706, 1,
1.533224, -0.2902727, 2.283314, 1, 0, 0.372549, 1,
1.545725, -0.5124608, 1.238958, 1, 0, 0.3647059, 1,
1.551252, -0.7701797, 1.53456, 1, 0, 0.3607843, 1,
1.551948, -1.002034, 0.8563337, 1, 0, 0.3529412, 1,
1.56209, -0.5694999, 0.3810857, 1, 0, 0.3490196, 1,
1.569678, -0.1243352, 1.535049, 1, 0, 0.3411765, 1,
1.570242, 1.371061, -0.5110497, 1, 0, 0.3372549, 1,
1.580584, 3.111077, 1.126241, 1, 0, 0.3294118, 1,
1.587556, -0.4524918, 0.654027, 1, 0, 0.3254902, 1,
1.589262, -0.1211629, 0.1565141, 1, 0, 0.3176471, 1,
1.596227, 0.5680484, -0.09032562, 1, 0, 0.3137255, 1,
1.598269, 0.7586285, -0.4197446, 1, 0, 0.3058824, 1,
1.620629, 2.434729, 3.265623, 1, 0, 0.2980392, 1,
1.623517, -0.4542138, 1.141552, 1, 0, 0.2941177, 1,
1.626551, 0.1112712, -0.1415239, 1, 0, 0.2862745, 1,
1.639285, -0.04709258, 1.093786, 1, 0, 0.282353, 1,
1.63969, -1.157361, 2.612556, 1, 0, 0.2745098, 1,
1.644825, -1.095237, 2.551125, 1, 0, 0.2705882, 1,
1.647213, 1.147186, 1.447007, 1, 0, 0.2627451, 1,
1.692857, 0.01834296, 1.943442, 1, 0, 0.2588235, 1,
1.709509, 0.8095257, 1.334431, 1, 0, 0.2509804, 1,
1.709684, -0.4697267, 2.81868, 1, 0, 0.2470588, 1,
1.71802, -0.4107403, 3.299078, 1, 0, 0.2392157, 1,
1.719144, 0.174886, 2.928235, 1, 0, 0.2352941, 1,
1.777402, 0.9636724, 0.5721584, 1, 0, 0.227451, 1,
1.778263, -0.6367725, 0.2046415, 1, 0, 0.2235294, 1,
1.786694, 0.3833283, 0.8292365, 1, 0, 0.2156863, 1,
1.842475, 0.5978536, 0.8637774, 1, 0, 0.2117647, 1,
1.85765, 1.405246, 1.39371, 1, 0, 0.2039216, 1,
1.892842, -0.1360936, 0.2997722, 1, 0, 0.1960784, 1,
1.923079, -1.245885, 2.441238, 1, 0, 0.1921569, 1,
1.963968, -0.07642616, 1.347924, 1, 0, 0.1843137, 1,
1.965531, 0.9009978, -0.1504828, 1, 0, 0.1803922, 1,
1.967996, -1.11262, 3.971269, 1, 0, 0.172549, 1,
1.995106, 1.102653, 0.121462, 1, 0, 0.1686275, 1,
2.002237, -0.6215995, 1.234819, 1, 0, 0.1607843, 1,
2.015107, 1.772609, 0.8453297, 1, 0, 0.1568628, 1,
2.048893, -0.8908364, 2.586467, 1, 0, 0.1490196, 1,
2.054174, -2.79589, 3.200383, 1, 0, 0.145098, 1,
2.067754, 0.1859935, -0.06761091, 1, 0, 0.1372549, 1,
2.082928, -0.1033908, 3.221098, 1, 0, 0.1333333, 1,
2.112326, 0.3454979, 0.3715322, 1, 0, 0.1254902, 1,
2.140633, 0.966437, 0.5027778, 1, 0, 0.1215686, 1,
2.155371, 1.599892, 1.185017, 1, 0, 0.1137255, 1,
2.16212, 1.203666, 0.984771, 1, 0, 0.1098039, 1,
2.16669, -0.2461573, 1.950835, 1, 0, 0.1019608, 1,
2.223981, 0.6508509, 0.8812715, 1, 0, 0.09411765, 1,
2.259325, -1.74961, 1.164341, 1, 0, 0.09019608, 1,
2.26191, -0.3319106, -0.05404987, 1, 0, 0.08235294, 1,
2.281348, 1.727689, 1.822757, 1, 0, 0.07843138, 1,
2.287764, -1.049534, 0.5952539, 1, 0, 0.07058824, 1,
2.322065, 2.057851, 1.612378, 1, 0, 0.06666667, 1,
2.33488, 0.05667954, 1.976362, 1, 0, 0.05882353, 1,
2.379691, 0.2300319, -0.12528, 1, 0, 0.05490196, 1,
2.399455, -0.5067707, 1.538148, 1, 0, 0.04705882, 1,
2.41621, 1.546268, 0.2402747, 1, 0, 0.04313726, 1,
2.54056, -0.6039367, 0.9463902, 1, 0, 0.03529412, 1,
2.619971, -0.4053821, 2.140421, 1, 0, 0.03137255, 1,
2.680126, -0.1294525, 2.288594, 1, 0, 0.02352941, 1,
2.687615, -0.05162728, 1.735955, 1, 0, 0.01960784, 1,
2.863146, 0.2803062, -0.03698689, 1, 0, 0.01176471, 1,
2.871413, 0.147405, -1.12131, 1, 0, 0.007843138, 1
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
-0.243952, -4.384501, -7.291859, 0, -0.5, 0.5, 0.5,
-0.243952, -4.384501, -7.291859, 1, -0.5, 0.5, 0.5,
-0.243952, -4.384501, -7.291859, 1, 1.5, 0.5, 0.5,
-0.243952, -4.384501, -7.291859, 0, 1.5, 0.5, 0.5
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
-4.415426, -0.09353101, -7.291859, 0, -0.5, 0.5, 0.5,
-4.415426, -0.09353101, -7.291859, 1, -0.5, 0.5, 0.5,
-4.415426, -0.09353101, -7.291859, 1, 1.5, 0.5, 0.5,
-4.415426, -0.09353101, -7.291859, 0, 1.5, 0.5, 0.5
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
-4.415426, -4.384501, 0.06967545, 0, -0.5, 0.5, 0.5,
-4.415426, -4.384501, 0.06967545, 1, -0.5, 0.5, 0.5,
-4.415426, -4.384501, 0.06967545, 1, 1.5, 0.5, 0.5,
-4.415426, -4.384501, 0.06967545, 0, 1.5, 0.5, 0.5
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
-3, -3.394278, -5.593043,
2, -3.394278, -5.593043,
-3, -3.394278, -5.593043,
-3, -3.559315, -5.876179,
-2, -3.394278, -5.593043,
-2, -3.559315, -5.876179,
-1, -3.394278, -5.593043,
-1, -3.559315, -5.876179,
0, -3.394278, -5.593043,
0, -3.559315, -5.876179,
1, -3.394278, -5.593043,
1, -3.559315, -5.876179,
2, -3.394278, -5.593043,
2, -3.559315, -5.876179
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
-3, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
-3, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
-3, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
-3, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5,
-2, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
-2, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
-2, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
-2, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5,
-1, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
-1, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
-1, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
-1, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5,
0, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
0, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
0, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
0, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5,
1, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
1, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
1, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
1, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5,
2, -3.88939, -6.442451, 0, -0.5, 0.5, 0.5,
2, -3.88939, -6.442451, 1, -0.5, 0.5, 0.5,
2, -3.88939, -6.442451, 1, 1.5, 0.5, 0.5,
2, -3.88939, -6.442451, 0, 1.5, 0.5, 0.5
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
-3.452779, -3, -5.593043,
-3.452779, 3, -5.593043,
-3.452779, -3, -5.593043,
-3.61322, -3, -5.876179,
-3.452779, -2, -5.593043,
-3.61322, -2, -5.876179,
-3.452779, -1, -5.593043,
-3.61322, -1, -5.876179,
-3.452779, 0, -5.593043,
-3.61322, 0, -5.876179,
-3.452779, 1, -5.593043,
-3.61322, 1, -5.876179,
-3.452779, 2, -5.593043,
-3.61322, 2, -5.876179,
-3.452779, 3, -5.593043,
-3.61322, 3, -5.876179
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
-3.934103, -3, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, -3, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, -3, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, -3, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, -2, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, -2, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, -2, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, -2, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, -1, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, -1, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, -1, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, -1, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, 0, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, 0, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, 0, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, 0, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, 1, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, 1, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, 1, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, 1, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, 2, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, 2, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, 2, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, 2, -6.442451, 0, 1.5, 0.5, 0.5,
-3.934103, 3, -6.442451, 0, -0.5, 0.5, 0.5,
-3.934103, 3, -6.442451, 1, -0.5, 0.5, 0.5,
-3.934103, 3, -6.442451, 1, 1.5, 0.5, 0.5,
-3.934103, 3, -6.442451, 0, 1.5, 0.5, 0.5
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
-3.452779, -3.394278, -4,
-3.452779, -3.394278, 4,
-3.452779, -3.394278, -4,
-3.61322, -3.559315, -4,
-3.452779, -3.394278, -2,
-3.61322, -3.559315, -2,
-3.452779, -3.394278, 0,
-3.61322, -3.559315, 0,
-3.452779, -3.394278, 2,
-3.61322, -3.559315, 2,
-3.452779, -3.394278, 4,
-3.61322, -3.559315, 4
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
-3.934103, -3.88939, -4, 0, -0.5, 0.5, 0.5,
-3.934103, -3.88939, -4, 1, -0.5, 0.5, 0.5,
-3.934103, -3.88939, -4, 1, 1.5, 0.5, 0.5,
-3.934103, -3.88939, -4, 0, 1.5, 0.5, 0.5,
-3.934103, -3.88939, -2, 0, -0.5, 0.5, 0.5,
-3.934103, -3.88939, -2, 1, -0.5, 0.5, 0.5,
-3.934103, -3.88939, -2, 1, 1.5, 0.5, 0.5,
-3.934103, -3.88939, -2, 0, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 0, 0, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 0, 1, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 0, 1, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 0, 0, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 2, 0, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 2, 1, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 2, 1, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 2, 0, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 4, 0, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 4, 1, -0.5, 0.5, 0.5,
-3.934103, -3.88939, 4, 1, 1.5, 0.5, 0.5,
-3.934103, -3.88939, 4, 0, 1.5, 0.5, 0.5
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
-3.452779, -3.394278, -5.593043,
-3.452779, 3.207216, -5.593043,
-3.452779, -3.394278, 5.732394,
-3.452779, 3.207216, 5.732394,
-3.452779, -3.394278, -5.593043,
-3.452779, -3.394278, 5.732394,
-3.452779, 3.207216, -5.593043,
-3.452779, 3.207216, 5.732394,
-3.452779, -3.394278, -5.593043,
2.964875, -3.394278, -5.593043,
-3.452779, -3.394278, 5.732394,
2.964875, -3.394278, 5.732394,
-3.452779, 3.207216, -5.593043,
2.964875, 3.207216, -5.593043,
-3.452779, 3.207216, 5.732394,
2.964875, 3.207216, 5.732394,
2.964875, -3.394278, -5.593043,
2.964875, 3.207216, -5.593043,
2.964875, -3.394278, 5.732394,
2.964875, 3.207216, 5.732394,
2.964875, -3.394278, -5.593043,
2.964875, -3.394278, 5.732394,
2.964875, 3.207216, -5.593043,
2.964875, 3.207216, 5.732394
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
var radius = 7.793766;
var distance = 34.67535;
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
mvMatrix.translate( 0.243952, 0.09353101, -0.06967545 );
mvMatrix.scale( 1.313061, 1.276495, 0.7440572 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.67535);
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
Ansar<-read.table("Ansar.xyz", skip=1)
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
-3.359318, 0.08464015, -4.527599, 0, 0, 1, 1, 1,
-2.825754, -3.298139, -3.162719, 1, 0, 0, 1, 1,
-2.765323, 2.196726, 1.177036, 1, 0, 0, 1, 1,
-2.709584, 0.7532198, -1.022565, 1, 0, 0, 1, 1,
-2.657364, 0.2101869, 0.1310734, 1, 0, 0, 1, 1,
-2.656775, -0.7129586, -0.04892912, 1, 0, 0, 1, 1,
-2.595574, 2.071757, 0.7366005, 0, 0, 0, 1, 1,
-2.580723, 0.6771294, -1.36208, 0, 0, 0, 1, 1,
-2.56007, 0.07061227, -0.7857966, 0, 0, 0, 1, 1,
-2.506716, 0.1133591, -1.313529, 0, 0, 0, 1, 1,
-2.477898, -0.6379641, -2.295857, 0, 0, 0, 1, 1,
-2.403844, 0.4384795, -0.2050181, 0, 0, 0, 1, 1,
-2.390507, -0.4285334, -1.913431, 0, 0, 0, 1, 1,
-2.341352, -0.1853242, -2.213506, 1, 1, 1, 1, 1,
-2.314864, -0.9933923, -1.503636, 1, 1, 1, 1, 1,
-2.27741, 0.7116306, -1.531092, 1, 1, 1, 1, 1,
-2.246869, -1.176321, -0.5019202, 1, 1, 1, 1, 1,
-2.186574, 1.546097, -2.049001, 1, 1, 1, 1, 1,
-2.167996, 0.2644663, -0.8607413, 1, 1, 1, 1, 1,
-2.162741, -0.4853246, -1.397485, 1, 1, 1, 1, 1,
-2.146693, -0.613641, 0.4019476, 1, 1, 1, 1, 1,
-2.106986, -0.5890697, -2.311705, 1, 1, 1, 1, 1,
-2.097763, 0.07571458, -0.1731759, 1, 1, 1, 1, 1,
-2.095057, 1.536202, -0.3081733, 1, 1, 1, 1, 1,
-2.073915, -1.473126, -3.050335, 1, 1, 1, 1, 1,
-2.048877, 0.08210377, -1.319632, 1, 1, 1, 1, 1,
-2.02342, -0.5441613, -1.107285, 1, 1, 1, 1, 1,
-2.019181, -2.106159, -0.7368527, 1, 1, 1, 1, 1,
-1.996097, 0.725067, -0.8358075, 0, 0, 1, 1, 1,
-1.968244, -0.9367827, -1.113783, 1, 0, 0, 1, 1,
-1.945363, -0.1298585, -1.834254, 1, 0, 0, 1, 1,
-1.943393, 0.008940291, -2.548143, 1, 0, 0, 1, 1,
-1.936703, 0.3036849, -1.045348, 1, 0, 0, 1, 1,
-1.931242, 0.7792248, -2.73147, 1, 0, 0, 1, 1,
-1.913171, 1.405736, -1.210522, 0, 0, 0, 1, 1,
-1.908315, 0.594471, -2.003389, 0, 0, 0, 1, 1,
-1.90418, 1.374073, -2.512283, 0, 0, 0, 1, 1,
-1.891528, 0.30044, -2.731351, 0, 0, 0, 1, 1,
-1.88843, -1.310735, -0.5495619, 0, 0, 0, 1, 1,
-1.881109, -0.4346747, -1.285923, 0, 0, 0, 1, 1,
-1.859888, -0.4884378, -1.3601, 0, 0, 0, 1, 1,
-1.847707, -0.250154, -0.9515749, 1, 1, 1, 1, 1,
-1.846941, 0.8325095, -0.2240375, 1, 1, 1, 1, 1,
-1.796822, -0.124969, -0.1914085, 1, 1, 1, 1, 1,
-1.789011, 0.113833, -0.9567216, 1, 1, 1, 1, 1,
-1.787857, 0.3040947, -1.338155, 1, 1, 1, 1, 1,
-1.777401, -0.8505339, -0.9449611, 1, 1, 1, 1, 1,
-1.772182, -0.7558802, -1.803544, 1, 1, 1, 1, 1,
-1.7558, -1.062511, -2.254328, 1, 1, 1, 1, 1,
-1.754894, -0.113779, -1.963295, 1, 1, 1, 1, 1,
-1.743185, 0.154022, -2.926479, 1, 1, 1, 1, 1,
-1.719192, -0.3092951, -0.5294312, 1, 1, 1, 1, 1,
-1.681308, 0.6329376, -0.9697501, 1, 1, 1, 1, 1,
-1.681218, -1.306233, -1.863918, 1, 1, 1, 1, 1,
-1.66903, -0.8421627, -3.677982, 1, 1, 1, 1, 1,
-1.659399, 1.986215, -0.6523944, 1, 1, 1, 1, 1,
-1.658247, 1.7112, -0.9440029, 0, 0, 1, 1, 1,
-1.657866, 2.074726, 0.4725387, 1, 0, 0, 1, 1,
-1.584192, -1.354806, -2.558737, 1, 0, 0, 1, 1,
-1.569236, 0.3934102, -2.49345, 1, 0, 0, 1, 1,
-1.566056, 0.5346438, -1.7281, 1, 0, 0, 1, 1,
-1.561123, -1.719135, -3.15872, 1, 0, 0, 1, 1,
-1.546261, -0.4723918, -0.7832617, 0, 0, 0, 1, 1,
-1.544589, 0.276107, -0.0344407, 0, 0, 0, 1, 1,
-1.54314, -0.678066, -1.62846, 0, 0, 0, 1, 1,
-1.542407, -1.606158, -2.94241, 0, 0, 0, 1, 1,
-1.531561, -1.206082, -1.527739, 0, 0, 0, 1, 1,
-1.529776, -0.367553, -2.266608, 0, 0, 0, 1, 1,
-1.515567, -1.09808, 1.116727, 0, 0, 0, 1, 1,
-1.490265, 1.46698, -0.2654939, 1, 1, 1, 1, 1,
-1.459373, -0.3312008, -0.723739, 1, 1, 1, 1, 1,
-1.45298, -1.578556, -1.629976, 1, 1, 1, 1, 1,
-1.448241, 0.4046616, -0.8529701, 1, 1, 1, 1, 1,
-1.444906, 0.1975434, -0.5842922, 1, 1, 1, 1, 1,
-1.434074, -0.2912117, -1.937087, 1, 1, 1, 1, 1,
-1.432439, 1.092151, -0.4087698, 1, 1, 1, 1, 1,
-1.431136, -0.6991376, -3.074035, 1, 1, 1, 1, 1,
-1.427125, -1.020251, -1.151813, 1, 1, 1, 1, 1,
-1.406789, -0.1831057, -2.018, 1, 1, 1, 1, 1,
-1.400349, 1.205542, -2.829702, 1, 1, 1, 1, 1,
-1.394374, -0.6802602, -0.3253166, 1, 1, 1, 1, 1,
-1.388032, 0.7285755, -0.8841398, 1, 1, 1, 1, 1,
-1.364978, -1.762793, -1.347254, 1, 1, 1, 1, 1,
-1.354664, -3.28721, -2.805188, 1, 1, 1, 1, 1,
-1.353183, 0.4909313, -0.8557866, 0, 0, 1, 1, 1,
-1.351125, 1.793215, -0.5707322, 1, 0, 0, 1, 1,
-1.342146, 0.1193084, -1.986974, 1, 0, 0, 1, 1,
-1.340028, -0.06156514, -3.689884, 1, 0, 0, 1, 1,
-1.338525, -1.876325, -3.159792, 1, 0, 0, 1, 1,
-1.33564, 1.261702, -0.8242063, 1, 0, 0, 1, 1,
-1.309738, -0.5158986, -2.12187, 0, 0, 0, 1, 1,
-1.306773, -0.6153328, -0.4088361, 0, 0, 0, 1, 1,
-1.306337, 0.4272812, -1.343506, 0, 0, 0, 1, 1,
-1.305547, 0.4724269, -2.063542, 0, 0, 0, 1, 1,
-1.301189, -0.4322324, -0.6503676, 0, 0, 0, 1, 1,
-1.294049, 0.3929583, 0.3206062, 0, 0, 0, 1, 1,
-1.292489, 0.5382433, -0.3723806, 0, 0, 0, 1, 1,
-1.290481, -0.5308541, -3.806142, 1, 1, 1, 1, 1,
-1.285144, 0.02776361, -2.367915, 1, 1, 1, 1, 1,
-1.282853, -0.2242094, 0.6570769, 1, 1, 1, 1, 1,
-1.282779, 0.5410982, -0.8253922, 1, 1, 1, 1, 1,
-1.269818, 1.376734, 0.1738517, 1, 1, 1, 1, 1,
-1.269354, 0.7337649, -0.6882043, 1, 1, 1, 1, 1,
-1.265632, 0.2021577, -2.121907, 1, 1, 1, 1, 1,
-1.252325, -0.2458259, -0.9751725, 1, 1, 1, 1, 1,
-1.247473, -0.270931, -1.342794, 1, 1, 1, 1, 1,
-1.244934, -0.2170866, 0.06424785, 1, 1, 1, 1, 1,
-1.2403, -1.321384, -0.367974, 1, 1, 1, 1, 1,
-1.237115, -0.3800976, -1.723359, 1, 1, 1, 1, 1,
-1.233927, 0.0582089, -1.985286, 1, 1, 1, 1, 1,
-1.224668, -0.4789447, -2.593097, 1, 1, 1, 1, 1,
-1.223455, 0.4935724, -1.4692, 1, 1, 1, 1, 1,
-1.221949, -2.010947, -2.528043, 0, 0, 1, 1, 1,
-1.213375, 0.4395715, -1.798377, 1, 0, 0, 1, 1,
-1.209247, 0.8554273, -1.536232, 1, 0, 0, 1, 1,
-1.207412, 0.5385448, -2.227609, 1, 0, 0, 1, 1,
-1.207256, 0.8130001, 1.052706, 1, 0, 0, 1, 1,
-1.206058, 0.7283005, -2.785563, 1, 0, 0, 1, 1,
-1.195715, 1.217885, -0.6752793, 0, 0, 0, 1, 1,
-1.194765, -0.6360623, -1.725963, 0, 0, 0, 1, 1,
-1.192346, 0.6957092, -1.29408, 0, 0, 0, 1, 1,
-1.190391, -1.044194, -2.514966, 0, 0, 0, 1, 1,
-1.185593, -1.328397, -2.932402, 0, 0, 0, 1, 1,
-1.185275, -1.40622, -3.797465, 0, 0, 0, 1, 1,
-1.183974, -0.812122, -1.353528, 0, 0, 0, 1, 1,
-1.179402, -0.9774342, -2.918572, 1, 1, 1, 1, 1,
-1.178956, 0.3042046, -0.8896582, 1, 1, 1, 1, 1,
-1.174727, -2.331563, -2.283698, 1, 1, 1, 1, 1,
-1.167046, 0.6545694, -1.416328, 1, 1, 1, 1, 1,
-1.16482, -0.1992195, -2.147983, 1, 1, 1, 1, 1,
-1.164564, -1.036023, -2.770164, 1, 1, 1, 1, 1,
-1.161176, -0.2619757, -2.356952, 1, 1, 1, 1, 1,
-1.158348, -0.3415614, -0.5304039, 1, 1, 1, 1, 1,
-1.157319, 0.347267, -0.525406, 1, 1, 1, 1, 1,
-1.156858, 1.288578, -1.147861, 1, 1, 1, 1, 1,
-1.156279, -0.8716312, -2.002761, 1, 1, 1, 1, 1,
-1.152884, -2.178988, -2.280956, 1, 1, 1, 1, 1,
-1.140594, -1.595466, -2.923132, 1, 1, 1, 1, 1,
-1.13907, -1.693984, -2.634624, 1, 1, 1, 1, 1,
-1.136402, -0.7699081, -3.864568, 1, 1, 1, 1, 1,
-1.115864, 0.766239, -1.475262, 0, 0, 1, 1, 1,
-1.113179, 0.5833794, 0.286553, 1, 0, 0, 1, 1,
-1.113128, -0.9691766, -1.107474, 1, 0, 0, 1, 1,
-1.109477, -1.035949, -1.650981, 1, 0, 0, 1, 1,
-1.102188, 0.7040561, -0.6989875, 1, 0, 0, 1, 1,
-1.09518, -1.011321, -1.010167, 1, 0, 0, 1, 1,
-1.09139, -1.764101, -2.455855, 0, 0, 0, 1, 1,
-1.090702, -0.7616392, -1.308541, 0, 0, 0, 1, 1,
-1.084382, 0.2582323, -0.7782937, 0, 0, 0, 1, 1,
-1.074788, 0.02865524, 0.2151474, 0, 0, 0, 1, 1,
-1.074391, 0.1848419, -1.306568, 0, 0, 0, 1, 1,
-1.073276, -1.100725, -2.113529, 0, 0, 0, 1, 1,
-1.073137, 1.187687, -0.6744721, 0, 0, 0, 1, 1,
-1.070986, 0.4593182, -1.512838, 1, 1, 1, 1, 1,
-1.069559, 1.694021, -0.2451344, 1, 1, 1, 1, 1,
-1.067169, -1.495167, -1.931745, 1, 1, 1, 1, 1,
-1.063868, -2.119937, -2.034203, 1, 1, 1, 1, 1,
-1.06352, -1.921252, -2.053304, 1, 1, 1, 1, 1,
-1.062152, 1.777278, 0.1734895, 1, 1, 1, 1, 1,
-1.057357, 1.938686, -2.000471, 1, 1, 1, 1, 1,
-1.038651, -0.1716807, -0.745177, 1, 1, 1, 1, 1,
-1.031808, -0.4878386, -0.1892253, 1, 1, 1, 1, 1,
-1.02308, -0.0997813, -2.350484, 1, 1, 1, 1, 1,
-1.01918, 0.9418655, -1.497675, 1, 1, 1, 1, 1,
-1.013399, -0.5502295, -1.486449, 1, 1, 1, 1, 1,
-1.011099, -0.1192185, -0.901719, 1, 1, 1, 1, 1,
-1.007009, -1.002481, -1.577454, 1, 1, 1, 1, 1,
-0.9945687, -1.15141, 0.9191109, 1, 1, 1, 1, 1,
-0.9916269, -2.23983, -3.885895, 0, 0, 1, 1, 1,
-0.990456, 0.5845678, 0.4632086, 1, 0, 0, 1, 1,
-0.9902339, -0.168183, -0.2452562, 1, 0, 0, 1, 1,
-0.9896699, -0.7182839, -0.786137, 1, 0, 0, 1, 1,
-0.979763, -0.8163376, -1.848127, 1, 0, 0, 1, 1,
-0.9788315, 0.08356092, -3.099183, 1, 0, 0, 1, 1,
-0.9788182, 1.300211, -0.5972256, 0, 0, 0, 1, 1,
-0.9775691, -0.9113037, -2.367668, 0, 0, 0, 1, 1,
-0.973651, -1.907457, -1.202664, 0, 0, 0, 1, 1,
-0.9719825, -0.4330519, -2.533129, 0, 0, 0, 1, 1,
-0.9718395, 0.2485715, -2.911211, 0, 0, 0, 1, 1,
-0.9712428, 1.576804, 0.2267427, 0, 0, 0, 1, 1,
-0.9700735, -1.44392, -3.157824, 0, 0, 0, 1, 1,
-0.9571245, 1.638088, -2.205853, 1, 1, 1, 1, 1,
-0.9567754, 0.4017311, -1.62281, 1, 1, 1, 1, 1,
-0.9556653, -0.6773295, -2.954979, 1, 1, 1, 1, 1,
-0.9534839, 0.1309029, -1.27642, 1, 1, 1, 1, 1,
-0.9481875, -1.592852, -2.395875, 1, 1, 1, 1, 1,
-0.946496, -0.7734268, -3.298366, 1, 1, 1, 1, 1,
-0.9435859, -0.005519571, -0.8333981, 1, 1, 1, 1, 1,
-0.9365966, -0.145647, -1.154231, 1, 1, 1, 1, 1,
-0.9341002, 0.4747275, -1.772947, 1, 1, 1, 1, 1,
-0.9287125, -0.5280047, -2.142706, 1, 1, 1, 1, 1,
-0.9251267, 0.6419333, -1.04628, 1, 1, 1, 1, 1,
-0.9170327, -0.3324114, -1.755405, 1, 1, 1, 1, 1,
-0.9169257, 1.010086, -0.7416108, 1, 1, 1, 1, 1,
-0.9133283, 0.3252924, -2.734423, 1, 1, 1, 1, 1,
-0.9115683, 0.6008765, -1.143731, 1, 1, 1, 1, 1,
-0.9098071, 0.6132049, -0.1725883, 0, 0, 1, 1, 1,
-0.9030445, 0.1074292, -2.428977, 1, 0, 0, 1, 1,
-0.9027855, -0.8250181, -1.230234, 1, 0, 0, 1, 1,
-0.9007472, 1.011116, 0.07104848, 1, 0, 0, 1, 1,
-0.8990373, -1.396619, -3.955984, 1, 0, 0, 1, 1,
-0.8964101, 0.880689, -0.8011628, 1, 0, 0, 1, 1,
-0.8941141, 2.653235, -0.03544915, 0, 0, 0, 1, 1,
-0.8875695, -0.4593618, -1.345616, 0, 0, 0, 1, 1,
-0.8865818, -0.3882803, -3.40837, 0, 0, 0, 1, 1,
-0.8791884, -0.5522145, -2.897789, 0, 0, 0, 1, 1,
-0.8696144, 0.4740025, 0.549664, 0, 0, 0, 1, 1,
-0.8691282, -0.2365064, -2.483404, 0, 0, 0, 1, 1,
-0.8685168, -0.819347, -3.97721, 0, 0, 0, 1, 1,
-0.8675692, -0.5102924, -1.976649, 1, 1, 1, 1, 1,
-0.8662034, -1.128373, -1.733478, 1, 1, 1, 1, 1,
-0.864284, 1.366854, -0.612734, 1, 1, 1, 1, 1,
-0.85653, 0.8932158, -0.5009942, 1, 1, 1, 1, 1,
-0.8556039, -0.3757598, -2.601699, 1, 1, 1, 1, 1,
-0.8532879, -0.5850028, -0.6929155, 1, 1, 1, 1, 1,
-0.8456522, -0.4283421, -2.489278, 1, 1, 1, 1, 1,
-0.8407445, 2.357097, -0.0831589, 1, 1, 1, 1, 1,
-0.8376063, 0.06230922, -3.067914, 1, 1, 1, 1, 1,
-0.8345811, -1.381262, -1.095893, 1, 1, 1, 1, 1,
-0.8327578, -0.4274851, -1.420569, 1, 1, 1, 1, 1,
-0.8325235, 0.06432305, -1.75493, 1, 1, 1, 1, 1,
-0.8306262, 2.249804, 1.247443, 1, 1, 1, 1, 1,
-0.8299611, -0.8633996, -3.103537, 1, 1, 1, 1, 1,
-0.8247795, 1.098839, -0.1586502, 1, 1, 1, 1, 1,
-0.8198238, -0.2704762, -1.694986, 0, 0, 1, 1, 1,
-0.8128417, -0.574688, -3.095209, 1, 0, 0, 1, 1,
-0.8056248, -1.175649, -2.548536, 1, 0, 0, 1, 1,
-0.7992657, 1.097105, 0.4582304, 1, 0, 0, 1, 1,
-0.7957354, 0.430638, -1.477672, 1, 0, 0, 1, 1,
-0.7943684, -0.7553034, -2.913487, 1, 0, 0, 1, 1,
-0.7921723, -1.257992, -1.622112, 0, 0, 0, 1, 1,
-0.7920405, -0.4692135, -0.3200099, 0, 0, 0, 1, 1,
-0.7880312, -0.8681315, -2.980747, 0, 0, 0, 1, 1,
-0.7815377, 1.508717, 2.09297, 0, 0, 0, 1, 1,
-0.781057, -0.9941124, -2.929852, 0, 0, 0, 1, 1,
-0.7696198, 0.9535878, -0.02213745, 0, 0, 0, 1, 1,
-0.7687865, 0.4665618, 1.157519, 0, 0, 0, 1, 1,
-0.7683895, -1.398346, -3.289735, 1, 1, 1, 1, 1,
-0.7637877, -0.2768208, -1.990965, 1, 1, 1, 1, 1,
-0.7631773, -0.7780346, -2.25482, 1, 1, 1, 1, 1,
-0.760002, 0.7732684, -0.1931734, 1, 1, 1, 1, 1,
-0.7572604, -1.843279, -2.798178, 1, 1, 1, 1, 1,
-0.7562877, 0.6353365, -1.816962, 1, 1, 1, 1, 1,
-0.7520122, -0.0177764, -0.807812, 1, 1, 1, 1, 1,
-0.7483934, 0.6361267, -3.307312, 1, 1, 1, 1, 1,
-0.7483211, -1.37038, -4.005852, 1, 1, 1, 1, 1,
-0.7477619, -0.08001729, -3.314065, 1, 1, 1, 1, 1,
-0.7461155, 0.5697038, -3.346925, 1, 1, 1, 1, 1,
-0.7449784, -0.4065952, -0.8800887, 1, 1, 1, 1, 1,
-0.7419943, -0.7097203, -2.990639, 1, 1, 1, 1, 1,
-0.7370129, -0.08284897, -1.068667, 1, 1, 1, 1, 1,
-0.7344268, 0.6819851, -1.342728, 1, 1, 1, 1, 1,
-0.7342854, -0.7787348, -1.404214, 0, 0, 1, 1, 1,
-0.7281054, 0.2130812, -2.057927, 1, 0, 0, 1, 1,
-0.7268175, -0.3062489, -0.6174508, 1, 0, 0, 1, 1,
-0.7243432, 1.593469, 0.2534616, 1, 0, 0, 1, 1,
-0.7222099, -0.7423159, -3.662105, 1, 0, 0, 1, 1,
-0.7139454, -1.721628, -3.774185, 1, 0, 0, 1, 1,
-0.7121646, 0.4846063, -0.6201286, 0, 0, 0, 1, 1,
-0.7092991, -1.262232, -0.5476269, 0, 0, 0, 1, 1,
-0.7078562, 0.6970765, -0.4478146, 0, 0, 0, 1, 1,
-0.7042763, -0.2917467, -1.472509, 0, 0, 0, 1, 1,
-0.693923, 0.3762846, 0.1675578, 0, 0, 0, 1, 1,
-0.6900879, -1.44317, -2.649068, 0, 0, 0, 1, 1,
-0.6897668, -0.545076, -1.629536, 0, 0, 0, 1, 1,
-0.6877566, -0.4833801, -1.401557, 1, 1, 1, 1, 1,
-0.6847146, -1.529779, -3.590938, 1, 1, 1, 1, 1,
-0.6830883, -0.8764813, -2.113251, 1, 1, 1, 1, 1,
-0.6828113, -0.8225736, -2.430344, 1, 1, 1, 1, 1,
-0.6827653, -1.177909, -2.392755, 1, 1, 1, 1, 1,
-0.6788964, -1.257498, -3.450432, 1, 1, 1, 1, 1,
-0.6767018, -0.3232414, -3.501957, 1, 1, 1, 1, 1,
-0.6656076, 0.5077794, 0.06710394, 1, 1, 1, 1, 1,
-0.6627331, -0.4861878, -3.254803, 1, 1, 1, 1, 1,
-0.6625891, -0.03723054, -1.985159, 1, 1, 1, 1, 1,
-0.6530674, -0.8814438, -2.535652, 1, 1, 1, 1, 1,
-0.6494872, -1.935799, -1.232099, 1, 1, 1, 1, 1,
-0.6472684, 0.3951701, -0.6345099, 1, 1, 1, 1, 1,
-0.6471432, -0.2904625, -0.642953, 1, 1, 1, 1, 1,
-0.6467029, -0.332643, -1.886316, 1, 1, 1, 1, 1,
-0.6461759, 0.5591194, -0.8156385, 0, 0, 1, 1, 1,
-0.6408796, -0.3610553, -1.78317, 1, 0, 0, 1, 1,
-0.6321609, 1.074787, -2.157137, 1, 0, 0, 1, 1,
-0.6292629, 0.8536578, -3.069022, 1, 0, 0, 1, 1,
-0.6264713, 0.5322484, -1.203908, 1, 0, 0, 1, 1,
-0.6256367, -0.2179878, -1.51092, 1, 0, 0, 1, 1,
-0.6241677, 0.3550006, -3.418475, 0, 0, 0, 1, 1,
-0.6153532, 1.177375, -0.5866967, 0, 0, 0, 1, 1,
-0.6134074, -1.034826, -2.81753, 0, 0, 0, 1, 1,
-0.6089633, -0.1698702, -2.883745, 0, 0, 0, 1, 1,
-0.6078828, 1.0237, -1.124559, 0, 0, 0, 1, 1,
-0.607881, -0.3273949, -2.92276, 0, 0, 0, 1, 1,
-0.602248, 0.6237023, -2.629578, 0, 0, 0, 1, 1,
-0.6010625, -1.434532, -3.759478, 1, 1, 1, 1, 1,
-0.5942488, 0.1685878, -1.18277, 1, 1, 1, 1, 1,
-0.5931458, -0.3691207, -1.096461, 1, 1, 1, 1, 1,
-0.5923769, 1.475226, -0.6075376, 1, 1, 1, 1, 1,
-0.5914986, 0.1732214, 1.389403, 1, 1, 1, 1, 1,
-0.5898946, 0.9289359, 0.6997715, 1, 1, 1, 1, 1,
-0.5886971, -0.001519079, -0.9792269, 1, 1, 1, 1, 1,
-0.5866522, -0.2385615, -3.156828, 1, 1, 1, 1, 1,
-0.57753, -0.2488179, -2.417096, 1, 1, 1, 1, 1,
-0.5703002, -1.643061, -2.556897, 1, 1, 1, 1, 1,
-0.5671219, -0.1775112, -2.703364, 1, 1, 1, 1, 1,
-0.5658439, 0.6439935, -0.8639778, 1, 1, 1, 1, 1,
-0.562107, -0.001601422, -1.424253, 1, 1, 1, 1, 1,
-0.5603676, 0.2187086, -1.258018, 1, 1, 1, 1, 1,
-0.5595415, 0.4495783, -1.082648, 1, 1, 1, 1, 1,
-0.5573819, 0.3732807, -0.2830555, 0, 0, 1, 1, 1,
-0.5545039, -0.1229797, -3.600426, 1, 0, 0, 1, 1,
-0.5528113, 0.4708165, -2.49661, 1, 0, 0, 1, 1,
-0.5524615, 0.848186, 1.547332, 1, 0, 0, 1, 1,
-0.5483844, -0.3540973, -1.322744, 1, 0, 0, 1, 1,
-0.5441284, -0.5296794, -0.3586319, 1, 0, 0, 1, 1,
-0.5426891, -0.6321006, -2.096892, 0, 0, 0, 1, 1,
-0.5347568, -1.156739, -3.487851, 0, 0, 0, 1, 1,
-0.5347048, -0.05061713, -0.8521832, 0, 0, 0, 1, 1,
-0.5332462, -0.2627552, -3.140884, 0, 0, 0, 1, 1,
-0.5325738, 0.9232143, -0.35669, 0, 0, 0, 1, 1,
-0.5230702, -1.843479, -1.963841, 0, 0, 0, 1, 1,
-0.5217443, 1.176878, -0.6962129, 0, 0, 0, 1, 1,
-0.5137343, 1.219637, -0.4385223, 1, 1, 1, 1, 1,
-0.5085483, 0.665691, -1.069127, 1, 1, 1, 1, 1,
-0.5074915, -1.754398, -1.94653, 1, 1, 1, 1, 1,
-0.5049152, -1.802891, -2.226568, 1, 1, 1, 1, 1,
-0.5040973, 1.697204, -2.130256, 1, 1, 1, 1, 1,
-0.5036935, 0.5705836, -0.3380426, 1, 1, 1, 1, 1,
-0.5027702, -2.264437, -4.391957, 1, 1, 1, 1, 1,
-0.4990412, 1.852107, 1.895401, 1, 1, 1, 1, 1,
-0.4863195, 0.4454773, 1.279956, 1, 1, 1, 1, 1,
-0.4847579, 0.5633258, -2.195961, 1, 1, 1, 1, 1,
-0.4756133, 0.5916339, 0.7898198, 1, 1, 1, 1, 1,
-0.4711683, -0.4456619, -3.858838, 1, 1, 1, 1, 1,
-0.47067, -1.395463, -3.562206, 1, 1, 1, 1, 1,
-0.4669878, 0.02209689, 0.1664135, 1, 1, 1, 1, 1,
-0.4647211, 0.2615442, -1.203048, 1, 1, 1, 1, 1,
-0.4643286, -2.123697, -1.690382, 0, 0, 1, 1, 1,
-0.4631609, 0.8863662, -1.017829, 1, 0, 0, 1, 1,
-0.4626903, -1.543515, -1.134662, 1, 0, 0, 1, 1,
-0.4622954, 1.580878, -1.115246, 1, 0, 0, 1, 1,
-0.4526894, -0.2704718, -2.810856, 1, 0, 0, 1, 1,
-0.4513686, -1.304286, -2.949702, 1, 0, 0, 1, 1,
-0.4490523, -1.713049, -3.132281, 0, 0, 0, 1, 1,
-0.4482252, 1.13007, -0.1653766, 0, 0, 0, 1, 1,
-0.4463894, 1.842095, -1.213982, 0, 0, 0, 1, 1,
-0.439162, -0.6475532, -3.109469, 0, 0, 0, 1, 1,
-0.4343459, -0.7576567, -0.6302835, 0, 0, 0, 1, 1,
-0.4329899, -1.1035, -1.99338, 0, 0, 0, 1, 1,
-0.4304889, 1.294654, -0.1212481, 0, 0, 0, 1, 1,
-0.4297194, 0.8034361, -1.361422, 1, 1, 1, 1, 1,
-0.4274786, -1.431184, -1.904274, 1, 1, 1, 1, 1,
-0.4243096, 0.3686446, -0.7574838, 1, 1, 1, 1, 1,
-0.421337, 0.7077904, -2.109592, 1, 1, 1, 1, 1,
-0.4203986, -0.03717278, -4.905949, 1, 1, 1, 1, 1,
-0.4172319, 0.7452154, -1.970337, 1, 1, 1, 1, 1,
-0.4149818, -1.016637, -2.755521, 1, 1, 1, 1, 1,
-0.413365, 0.2256487, -2.595405, 1, 1, 1, 1, 1,
-0.4118709, 0.6411182, -0.8513982, 1, 1, 1, 1, 1,
-0.4087621, 0.6202214, -0.1098987, 1, 1, 1, 1, 1,
-0.4059296, 1.773552, -0.2907434, 1, 1, 1, 1, 1,
-0.4039653, -0.343066, -1.665614, 1, 1, 1, 1, 1,
-0.4019102, -1.67685, -2.775455, 1, 1, 1, 1, 1,
-0.4017984, 0.9836161, 0.518538, 1, 1, 1, 1, 1,
-0.4017957, -2.105601, -2.361979, 1, 1, 1, 1, 1,
-0.3927555, -0.2536441, -2.27966, 0, 0, 1, 1, 1,
-0.3882101, -1.214933, -2.284009, 1, 0, 0, 1, 1,
-0.3852732, 0.8377334, -0.1435507, 1, 0, 0, 1, 1,
-0.384162, 0.1005094, -1.269282, 1, 0, 0, 1, 1,
-0.3839356, -0.9222676, -3.079456, 1, 0, 0, 1, 1,
-0.3821168, 0.2830479, 0.8621987, 1, 0, 0, 1, 1,
-0.3817216, 1.000026, 0.118196, 0, 0, 0, 1, 1,
-0.3810833, -0.6967425, -1.484218, 0, 0, 0, 1, 1,
-0.3782905, -0.5670467, -0.6687555, 0, 0, 0, 1, 1,
-0.3766719, 1.42418, -0.1506831, 0, 0, 0, 1, 1,
-0.3741364, -0.6479691, -2.847401, 0, 0, 0, 1, 1,
-0.3739446, 0.8280556, 0.6571587, 0, 0, 0, 1, 1,
-0.3715968, 0.3280236, -0.2400543, 0, 0, 0, 1, 1,
-0.3668065, -0.3013679, -3.31592, 1, 1, 1, 1, 1,
-0.3661501, 2.093987, 0.4698288, 1, 1, 1, 1, 1,
-0.3660607, 2.662762, -0.2507841, 1, 1, 1, 1, 1,
-0.3634154, 0.1838486, -0.7669285, 1, 1, 1, 1, 1,
-0.3569305, -0.5229574, -2.238616, 1, 1, 1, 1, 1,
-0.3556647, 0.1763867, -1.931234, 1, 1, 1, 1, 1,
-0.3548367, -0.02703148, 0.6751513, 1, 1, 1, 1, 1,
-0.3529758, -0.5358038, -3.664631, 1, 1, 1, 1, 1,
-0.3508931, 0.2253446, -2.001135, 1, 1, 1, 1, 1,
-0.3489991, -1.817205, -2.572565, 1, 1, 1, 1, 1,
-0.3443497, -0.3814349, -1.809088, 1, 1, 1, 1, 1,
-0.3442693, -0.791182, -4.74912, 1, 1, 1, 1, 1,
-0.3412462, -0.3532403, -3.728498, 1, 1, 1, 1, 1,
-0.3374383, -0.4413986, -2.069798, 1, 1, 1, 1, 1,
-0.3356052, 0.6703131, -0.853215, 1, 1, 1, 1, 1,
-0.3279539, 2.064878, 0.8516791, 0, 0, 1, 1, 1,
-0.3275464, 0.7955841, 0.2064877, 1, 0, 0, 1, 1,
-0.3271678, 0.4033338, -0.0540404, 1, 0, 0, 1, 1,
-0.3234068, -0.7891238, -0.7851446, 1, 0, 0, 1, 1,
-0.3226608, -0.6921027, -2.074037, 1, 0, 0, 1, 1,
-0.3217959, -1.357839, -4.074164, 1, 0, 0, 1, 1,
-0.321784, 1.18197, -0.1000535, 0, 0, 0, 1, 1,
-0.3211648, -0.4970027, -2.895472, 0, 0, 0, 1, 1,
-0.3197455, 1.779707, -1.200386, 0, 0, 0, 1, 1,
-0.3126993, -0.3174644, -1.787531, 0, 0, 0, 1, 1,
-0.3125812, 0.1993869, 0.06252128, 0, 0, 0, 1, 1,
-0.3047908, 1.224186, 1.521954, 0, 0, 0, 1, 1,
-0.2933197, -0.02884162, 0.01306967, 0, 0, 0, 1, 1,
-0.2907245, 1.37218, 0.2392536, 1, 1, 1, 1, 1,
-0.2903194, 0.8539887, -0.5028567, 1, 1, 1, 1, 1,
-0.2896268, -0.4450016, -2.732257, 1, 1, 1, 1, 1,
-0.2880712, 0.1849233, -0.004265069, 1, 1, 1, 1, 1,
-0.2864462, 0.7070476, 0.5273873, 1, 1, 1, 1, 1,
-0.2830384, -1.215798, -4.752496, 1, 1, 1, 1, 1,
-0.2781183, 0.8479242, 0.06117881, 1, 1, 1, 1, 1,
-0.2767116, -1.037822, -2.884475, 1, 1, 1, 1, 1,
-0.270382, -1.036662, -3.285005, 1, 1, 1, 1, 1,
-0.2662271, 1.084565, -0.01101991, 1, 1, 1, 1, 1,
-0.2627898, 0.2297927, -0.8349981, 1, 1, 1, 1, 1,
-0.2620539, 1.148217, -0.6102218, 1, 1, 1, 1, 1,
-0.2611234, -0.3167135, -2.012981, 1, 1, 1, 1, 1,
-0.2560012, 0.348809, -1.086296, 1, 1, 1, 1, 1,
-0.2554857, -1.074976, -2.125399, 1, 1, 1, 1, 1,
-0.2539774, -0.3052815, -0.5749623, 0, 0, 1, 1, 1,
-0.2533141, -0.8092832, -2.52167, 1, 0, 0, 1, 1,
-0.2515208, -0.5574394, -4.271993, 1, 0, 0, 1, 1,
-0.2505421, 1.381953, -0.9019664, 1, 0, 0, 1, 1,
-0.2502314, -0.280666, -3.603332, 1, 0, 0, 1, 1,
-0.2459386, 1.700482, -1.772702, 1, 0, 0, 1, 1,
-0.2416975, 0.9149782, -0.6764078, 0, 0, 0, 1, 1,
-0.2390628, -0.4590763, -2.167975, 0, 0, 0, 1, 1,
-0.2375531, -0.8306728, -5.352921, 0, 0, 0, 1, 1,
-0.2357009, 2.09835, -0.1062805, 0, 0, 0, 1, 1,
-0.2349357, -0.9376205, -3.414004, 0, 0, 0, 1, 1,
-0.2258719, 1.383068, -1.29139, 0, 0, 0, 1, 1,
-0.2205273, 0.9267586, -1.779889, 0, 0, 0, 1, 1,
-0.2190982, -0.8427577, -3.516552, 1, 1, 1, 1, 1,
-0.2185118, -0.4438958, -2.24362, 1, 1, 1, 1, 1,
-0.2182755, -0.2400776, -2.861949, 1, 1, 1, 1, 1,
-0.2151255, -0.6608771, -2.082027, 1, 1, 1, 1, 1,
-0.2137748, -0.7755811, -3.408477, 1, 1, 1, 1, 1,
-0.2121166, -1.142369, -2.420276, 1, 1, 1, 1, 1,
-0.2110889, 0.4980762, 1.372849, 1, 1, 1, 1, 1,
-0.2068489, 0.1916159, -0.6630893, 1, 1, 1, 1, 1,
-0.20474, 0.3003722, 1.174093, 1, 1, 1, 1, 1,
-0.2019311, -0.7301093, -1.6936, 1, 1, 1, 1, 1,
-0.2019239, -0.3104399, -2.338915, 1, 1, 1, 1, 1,
-0.1997879, -0.521731, -3.469539, 1, 1, 1, 1, 1,
-0.1993281, 0.8471429, 1.052836, 1, 1, 1, 1, 1,
-0.1984384, -0.5226805, -3.473255, 1, 1, 1, 1, 1,
-0.1969816, 0.1148332, -1.202642, 1, 1, 1, 1, 1,
-0.1955549, -0.8565718, -2.170209, 0, 0, 1, 1, 1,
-0.193175, -0.1896304, 0.5131075, 1, 0, 0, 1, 1,
-0.1919506, -0.2106534, -1.548485, 1, 0, 0, 1, 1,
-0.1881215, 1.033245, 0.8794311, 1, 0, 0, 1, 1,
-0.183427, 1.249063, -0.1134591, 1, 0, 0, 1, 1,
-0.1808778, 1.838447, -0.4833325, 1, 0, 0, 1, 1,
-0.1802204, -0.7153273, -2.797107, 0, 0, 0, 1, 1,
-0.1793157, -0.1572986, -1.575721, 0, 0, 0, 1, 1,
-0.1774409, -1.155102, -2.406379, 0, 0, 0, 1, 1,
-0.1751695, 0.004840983, -0.7985031, 0, 0, 0, 1, 1,
-0.1748579, 1.359887, -0.02695536, 0, 0, 0, 1, 1,
-0.1731814, 0.3765517, -2.618701, 0, 0, 0, 1, 1,
-0.1705853, -0.09529144, -1.633284, 0, 0, 0, 1, 1,
-0.1627659, -1.602983, -4.059011, 1, 1, 1, 1, 1,
-0.1613208, 0.589751, -1.530744, 1, 1, 1, 1, 1,
-0.1563182, 0.1327221, -0.06027518, 1, 1, 1, 1, 1,
-0.1549655, 0.4920911, -0.9317623, 1, 1, 1, 1, 1,
-0.1487931, 0.26934, 0.9742858, 1, 1, 1, 1, 1,
-0.1453664, -0.004600069, -1.260995, 1, 1, 1, 1, 1,
-0.1441003, -0.7869797, -2.62373, 1, 1, 1, 1, 1,
-0.138701, 1.123468, -0.3462469, 1, 1, 1, 1, 1,
-0.1328378, -0.07520491, -0.3397703, 1, 1, 1, 1, 1,
-0.1295536, 0.5719905, 1.896894, 1, 1, 1, 1, 1,
-0.1286307, -1.371034, -1.38692, 1, 1, 1, 1, 1,
-0.1286275, -0.5413494, -3.981667, 1, 1, 1, 1, 1,
-0.1218669, -1.899652, -5.42811, 1, 1, 1, 1, 1,
-0.1071842, 0.8652551, -2.579933, 1, 1, 1, 1, 1,
-0.1039019, 1.89963, -0.9743969, 1, 1, 1, 1, 1,
-0.1022298, -0.3717542, -2.580401, 0, 0, 1, 1, 1,
-0.09830502, 0.2754137, 0.05433826, 1, 0, 0, 1, 1,
-0.08310201, 0.1497841, 0.02602086, 1, 0, 0, 1, 1,
-0.07884201, 0.127431, -2.288538, 1, 0, 0, 1, 1,
-0.07570036, -1.213418, -4.296587, 1, 0, 0, 1, 1,
-0.07328925, -0.3741857, -1.618882, 1, 0, 0, 1, 1,
-0.07303461, -1.226166, -3.007106, 0, 0, 0, 1, 1,
-0.07257231, 1.021302, 0.9219308, 0, 0, 0, 1, 1,
-0.06864899, 1.692395, -0.3271611, 0, 0, 0, 1, 1,
-0.06255114, 0.6379522, -1.194504, 0, 0, 0, 1, 1,
-0.05576828, 0.2561716, 0.7799692, 0, 0, 0, 1, 1,
-0.05135986, 1.419818, -0.6610021, 0, 0, 0, 1, 1,
-0.04846724, 0.4068425, -0.5221887, 0, 0, 0, 1, 1,
-0.04806713, -0.7465796, -0.9594997, 1, 1, 1, 1, 1,
-0.04490134, -0.9271845, -2.609449, 1, 1, 1, 1, 1,
-0.04466499, -1.401277, -3.215091, 1, 1, 1, 1, 1,
-0.04366114, 0.08179703, -2.457196, 1, 1, 1, 1, 1,
-0.04244165, 1.584857, -1.041602, 1, 1, 1, 1, 1,
-0.04196469, 0.0471713, 0.3113049, 1, 1, 1, 1, 1,
-0.0412951, 0.6603995, -1.452913, 1, 1, 1, 1, 1,
-0.04000521, 1.955527, 1.462396, 1, 1, 1, 1, 1,
-0.03501141, -0.1248528, -2.504131, 1, 1, 1, 1, 1,
-0.02718432, -1.163774, -2.69378, 1, 1, 1, 1, 1,
-0.02496449, 1.833532, 0.3903446, 1, 1, 1, 1, 1,
-0.02467304, -0.3425912, -3.639518, 1, 1, 1, 1, 1,
-0.0147815, -0.9532178, -3.541431, 1, 1, 1, 1, 1,
-0.01313644, -0.8203267, -3.07512, 1, 1, 1, 1, 1,
-0.009511662, 0.4728355, 0.1715154, 1, 1, 1, 1, 1,
-0.008186259, -0.5250971, -4.121808, 0, 0, 1, 1, 1,
-0.007563208, -1.997369, -3.021448, 1, 0, 0, 1, 1,
-0.005531068, -0.5024452, -4.73123, 1, 0, 0, 1, 1,
-0.004911201, 0.2612039, -0.4951571, 1, 0, 0, 1, 1,
-0.003449806, -0.9964229, -3.341382, 1, 0, 0, 1, 1,
-0.0007267643, -1.031152, -4.389912, 1, 0, 0, 1, 1,
-0.0003090383, 0.3400431, 2.333978, 0, 0, 0, 1, 1,
0.0002209492, -1.373769, 2.291987, 0, 0, 0, 1, 1,
0.0008494773, 0.2412296, 0.01161133, 0, 0, 0, 1, 1,
0.003160816, 1.675636, 1.485688, 0, 0, 0, 1, 1,
0.0107146, -0.5445409, 3.868398, 0, 0, 0, 1, 1,
0.02390856, -0.1326011, 3.77665, 0, 0, 0, 1, 1,
0.03236204, -0.08648963, 4.292878, 0, 0, 0, 1, 1,
0.03966201, 0.1221945, 1.038722, 1, 1, 1, 1, 1,
0.04175355, -0.08864497, 4.281494, 1, 1, 1, 1, 1,
0.04801366, -0.1585992, 0.349526, 1, 1, 1, 1, 1,
0.05100188, 0.5135767, 0.03721512, 1, 1, 1, 1, 1,
0.05447025, 0.1229386, -0.950545, 1, 1, 1, 1, 1,
0.05500408, 0.8800339, 2.630858, 1, 1, 1, 1, 1,
0.06186348, -0.3229032, 3.532404, 1, 1, 1, 1, 1,
0.06199994, -0.2157035, 4.643003, 1, 1, 1, 1, 1,
0.06264471, 0.03852028, 2.117738, 1, 1, 1, 1, 1,
0.06283639, 0.1113321, 0.9322057, 1, 1, 1, 1, 1,
0.07106268, -0.1619552, 1.71087, 1, 1, 1, 1, 1,
0.07284469, -0.7456666, 5.567461, 1, 1, 1, 1, 1,
0.07645959, -1.555934, 3.150984, 1, 1, 1, 1, 1,
0.07847475, 1.942091, 0.4513471, 1, 1, 1, 1, 1,
0.08250362, -0.8773013, 2.365644, 1, 1, 1, 1, 1,
0.08458906, 0.5096791, 0.2650572, 0, 0, 1, 1, 1,
0.08512001, -0.5211458, 2.493298, 1, 0, 0, 1, 1,
0.08617366, -0.6641861, 2.015199, 1, 0, 0, 1, 1,
0.08989353, -0.3870195, 2.662357, 1, 0, 0, 1, 1,
0.09251725, 0.03486393, 1.220364, 1, 0, 0, 1, 1,
0.09767499, -0.3384678, 2.838504, 1, 0, 0, 1, 1,
0.1042872, -0.4000408, 4.317217, 0, 0, 0, 1, 1,
0.1043195, -1.311685, 4.63211, 0, 0, 0, 1, 1,
0.1055457, 0.3607571, -1.333259, 0, 0, 0, 1, 1,
0.1060502, -0.6873381, 3.542623, 0, 0, 0, 1, 1,
0.108435, -0.9263435, 1.618447, 0, 0, 0, 1, 1,
0.1096819, 0.4345771, 0.39479, 0, 0, 0, 1, 1,
0.111864, 0.579476, -0.2453122, 0, 0, 0, 1, 1,
0.1154294, 0.03856048, 1.778109, 1, 1, 1, 1, 1,
0.1162746, 1.309959, -1.031697, 1, 1, 1, 1, 1,
0.1163388, 1.307448, -2.112866, 1, 1, 1, 1, 1,
0.1182222, -1.096024, 3.265529, 1, 1, 1, 1, 1,
0.1195215, -0.3871863, 3.698915, 1, 1, 1, 1, 1,
0.1199285, 1.142976, -2.416056, 1, 1, 1, 1, 1,
0.1212754, 0.9929836, 0.5504953, 1, 1, 1, 1, 1,
0.1218165, 0.2233391, 0.1687112, 1, 1, 1, 1, 1,
0.133017, -0.8477185, 2.089154, 1, 1, 1, 1, 1,
0.1334166, 0.5460215, -0.5787201, 1, 1, 1, 1, 1,
0.1335612, -0.3044539, 3.145863, 1, 1, 1, 1, 1,
0.1346756, 1.511814, 0.7430698, 1, 1, 1, 1, 1,
0.1361886, 0.3048066, 1.736656, 1, 1, 1, 1, 1,
0.137773, 0.5357525, -0.02644914, 1, 1, 1, 1, 1,
0.1378634, -1.210046, 3.540941, 1, 1, 1, 1, 1,
0.1387719, -0.05759123, 1.978301, 0, 0, 1, 1, 1,
0.1414168, -0.4447676, 2.437512, 1, 0, 0, 1, 1,
0.1438098, -1.417825, 2.674692, 1, 0, 0, 1, 1,
0.1446559, -0.2697383, 2.799503, 1, 0, 0, 1, 1,
0.1460749, 1.049715, -0.813725, 1, 0, 0, 1, 1,
0.1508348, -0.3375576, 3.513246, 1, 0, 0, 1, 1,
0.1521611, -0.1508263, 2.322152, 0, 0, 0, 1, 1,
0.1536664, 0.04621078, -0.09846666, 0, 0, 0, 1, 1,
0.1559073, -0.3170038, 1.719835, 0, 0, 0, 1, 1,
0.1579807, 3.029201, 1.620524, 0, 0, 0, 1, 1,
0.1589293, 0.1987634, 1.883752, 0, 0, 0, 1, 1,
0.1618809, -2.75932, 2.49916, 0, 0, 0, 1, 1,
0.1626725, 0.05503613, 0.8011376, 0, 0, 0, 1, 1,
0.1645726, 0.5183491, -0.8453099, 1, 1, 1, 1, 1,
0.1709971, 2.044017, 0.3386005, 1, 1, 1, 1, 1,
0.1745862, -1.58542, 2.576264, 1, 1, 1, 1, 1,
0.1779968, 1.122591, 0.710165, 1, 1, 1, 1, 1,
0.1782906, -0.1083684, 4.091665, 1, 1, 1, 1, 1,
0.1809741, -0.6014074, 2.476708, 1, 1, 1, 1, 1,
0.181886, 1.876014, 1.404133, 1, 1, 1, 1, 1,
0.1835518, 0.1174545, 0.9973407, 1, 1, 1, 1, 1,
0.1926983, -0.8680395, 4.644667, 1, 1, 1, 1, 1,
0.1931333, 0.2576519, 0.9906671, 1, 1, 1, 1, 1,
0.1938556, 0.2378971, 1.13689, 1, 1, 1, 1, 1,
0.1969898, 1.133217, -1.227153, 1, 1, 1, 1, 1,
0.2014092, 0.900706, 2.014635, 1, 1, 1, 1, 1,
0.2015452, -1.024938, 1.13983, 1, 1, 1, 1, 1,
0.2035188, -1.187654, 3.082793, 1, 1, 1, 1, 1,
0.2038194, 0.09514572, 0.2788603, 0, 0, 1, 1, 1,
0.2054067, -1.053439, 1.193628, 1, 0, 0, 1, 1,
0.2066478, 0.7928771, 0.5069448, 1, 0, 0, 1, 1,
0.2123628, 0.04273421, 3.543761, 1, 0, 0, 1, 1,
0.2147408, 0.8560149, -2.03632, 1, 0, 0, 1, 1,
0.21506, -1.130927, 4.112327, 1, 0, 0, 1, 1,
0.2194382, 0.7321802, 0.1646224, 0, 0, 0, 1, 1,
0.2218685, -0.52142, 2.758571, 0, 0, 0, 1, 1,
0.2240383, -0.2359598, 1.496444, 0, 0, 0, 1, 1,
0.228638, -0.8793404, 2.119279, 0, 0, 0, 1, 1,
0.2318978, -0.2375685, 0.715494, 0, 0, 0, 1, 1,
0.2358501, 0.1188507, 0.6370274, 0, 0, 0, 1, 1,
0.2367177, -0.3878724, 3.633743, 0, 0, 0, 1, 1,
0.2430076, 2.991579, -0.5684685, 1, 1, 1, 1, 1,
0.2474586, -0.4184968, 1.916759, 1, 1, 1, 1, 1,
0.2525616, 0.4100295, 1.084796, 1, 1, 1, 1, 1,
0.2543758, 0.443996, -0.3180365, 1, 1, 1, 1, 1,
0.255401, -0.4666295, 2.609894, 1, 1, 1, 1, 1,
0.2566431, 0.9137985, 0.1762643, 1, 1, 1, 1, 1,
0.2631506, -0.7952864, 2.36571, 1, 1, 1, 1, 1,
0.2650498, 1.990118, -1.255381, 1, 1, 1, 1, 1,
0.2667359, 0.2607524, -0.005289327, 1, 1, 1, 1, 1,
0.2677279, 0.03234734, 0.9884626, 1, 1, 1, 1, 1,
0.2751701, 0.2458293, 1.444153, 1, 1, 1, 1, 1,
0.2764531, -0.783255, 2.528858, 1, 1, 1, 1, 1,
0.2774545, 0.7724184, 0.2788238, 1, 1, 1, 1, 1,
0.2869511, -1.106621, 4.40256, 1, 1, 1, 1, 1,
0.2875633, -1.349321, 2.997561, 1, 1, 1, 1, 1,
0.2881051, -1.187554, 4.199852, 0, 0, 1, 1, 1,
0.2889162, -0.06187885, 2.705891, 1, 0, 0, 1, 1,
0.2890114, 0.7886829, -0.2097577, 1, 0, 0, 1, 1,
0.2890899, 0.8278055, -1.052272, 1, 0, 0, 1, 1,
0.289955, -0.8774168, 4.005318, 1, 0, 0, 1, 1,
0.2974741, 0.9800093, 0.9277301, 1, 0, 0, 1, 1,
0.2983834, -0.8727992, 3.729254, 0, 0, 0, 1, 1,
0.2993248, 1.11503, -0.7207186, 0, 0, 0, 1, 1,
0.2995096, 0.05132748, 0.5769527, 0, 0, 0, 1, 1,
0.3013529, 0.6144872, 1.423033, 0, 0, 0, 1, 1,
0.3128504, -0.5926971, 0.8209025, 0, 0, 0, 1, 1,
0.314401, 0.1062162, 0.7609226, 0, 0, 0, 1, 1,
0.3147259, -0.06038569, 2.317113, 0, 0, 0, 1, 1,
0.3163027, -0.2885955, 1.206338, 1, 1, 1, 1, 1,
0.3199337, 0.234159, -0.3460688, 1, 1, 1, 1, 1,
0.3278737, 0.7007873, 1.056134, 1, 1, 1, 1, 1,
0.3293234, -0.03720454, 0.2581353, 1, 1, 1, 1, 1,
0.3304474, -0.3830902, -0.2237724, 1, 1, 1, 1, 1,
0.3311841, -0.02768734, 2.645592, 1, 1, 1, 1, 1,
0.3380167, -0.2711898, 2.955211, 1, 1, 1, 1, 1,
0.3403428, 0.7586836, 0.3864369, 1, 1, 1, 1, 1,
0.3427015, -2.390237, 1.501491, 1, 1, 1, 1, 1,
0.3431066, -0.9390159, 3.170086, 1, 1, 1, 1, 1,
0.3477158, 0.9125406, -1.659895, 1, 1, 1, 1, 1,
0.3482357, 0.2882187, 0.7088965, 1, 1, 1, 1, 1,
0.3503088, 0.7224793, -1.519554, 1, 1, 1, 1, 1,
0.3534316, -2.249107, 3.432475, 1, 1, 1, 1, 1,
0.3550361, -0.8980286, 2.783812, 1, 1, 1, 1, 1,
0.3555241, 0.3523163, 0.9737852, 0, 0, 1, 1, 1,
0.359135, -0.551877, 2.474647, 1, 0, 0, 1, 1,
0.3596293, -0.2866756, 1.314859, 1, 0, 0, 1, 1,
0.362377, -1.525986, 3.217503, 1, 0, 0, 1, 1,
0.3637641, 1.532434, -0.2955907, 1, 0, 0, 1, 1,
0.3650775, -0.4688462, 2.158079, 1, 0, 0, 1, 1,
0.3698081, -0.6220877, 2.038896, 0, 0, 0, 1, 1,
0.3725145, 0.9661109, 0.4580234, 0, 0, 0, 1, 1,
0.372618, -0.4859224, 1.816496, 0, 0, 0, 1, 1,
0.3779444, -0.006754065, 1.226233, 0, 0, 0, 1, 1,
0.3780075, -0.5970933, 1.702425, 0, 0, 0, 1, 1,
0.3798925, 0.5489169, -0.06993101, 0, 0, 0, 1, 1,
0.3837061, 0.09369962, 2.701728, 0, 0, 0, 1, 1,
0.3872029, 1.623093, 0.9419366, 1, 1, 1, 1, 1,
0.3872347, -1.347268, 2.381617, 1, 1, 1, 1, 1,
0.394142, -1.064902, 1.972436, 1, 1, 1, 1, 1,
0.3947827, 1.586159, 1.121029, 1, 1, 1, 1, 1,
0.4041103, 0.6845839, 2.238014, 1, 1, 1, 1, 1,
0.4043876, -0.3245242, 2.410326, 1, 1, 1, 1, 1,
0.4054593, 0.9582067, 1.633184, 1, 1, 1, 1, 1,
0.4080985, 0.667098, -0.770279, 1, 1, 1, 1, 1,
0.4108571, -1.023792, 3.630314, 1, 1, 1, 1, 1,
0.4124483, -0.3384714, 1.323203, 1, 1, 1, 1, 1,
0.4207653, 0.7690445, -0.2907196, 1, 1, 1, 1, 1,
0.4309814, 0.302638, -0.003229144, 1, 1, 1, 1, 1,
0.4315883, -1.494702, 2.986265, 1, 1, 1, 1, 1,
0.4446529, 0.05090076, 1.983443, 1, 1, 1, 1, 1,
0.4475307, -0.2660817, 0.4010745, 1, 1, 1, 1, 1,
0.4533913, -0.5342575, 2.340143, 0, 0, 1, 1, 1,
0.4547616, -0.05782046, 2.921733, 1, 0, 0, 1, 1,
0.4557435, 0.3692772, 0.7919084, 1, 0, 0, 1, 1,
0.4589731, 0.533069, 0.8975249, 1, 0, 0, 1, 1,
0.4593975, -0.3930741, 2.004369, 1, 0, 0, 1, 1,
0.4599046, -0.4773588, 2.863591, 1, 0, 0, 1, 1,
0.4623934, -0.1726832, 3.226788, 0, 0, 0, 1, 1,
0.4633225, -0.7189835, 0.5713059, 0, 0, 0, 1, 1,
0.4636716, 0.4293623, 1.332489, 0, 0, 0, 1, 1,
0.4680677, -0.8423765, 3.069272, 0, 0, 0, 1, 1,
0.4758185, 0.6473405, 1.528908, 0, 0, 0, 1, 1,
0.4796297, 0.8199199, -0.9178652, 0, 0, 0, 1, 1,
0.4820966, 0.5206842, -0.7777058, 0, 0, 0, 1, 1,
0.4853452, -0.4639858, 2.097769, 1, 1, 1, 1, 1,
0.4857537, -0.544373, 1.834374, 1, 1, 1, 1, 1,
0.4903112, 1.382069, 0.675379, 1, 1, 1, 1, 1,
0.4903385, 0.05928788, 1.489233, 1, 1, 1, 1, 1,
0.4925754, -0.6471106, 1.883743, 1, 1, 1, 1, 1,
0.4939232, -0.9869353, 2.925167, 1, 1, 1, 1, 1,
0.495706, -0.7742524, 4.513648, 1, 1, 1, 1, 1,
0.4975859, 1.046569, 1.974305, 1, 1, 1, 1, 1,
0.502535, -1.467327, 2.458489, 1, 1, 1, 1, 1,
0.5042927, -0.06080124, 2.295441, 1, 1, 1, 1, 1,
0.5066996, 0.002866839, 0.8103284, 1, 1, 1, 1, 1,
0.514273, 0.7472103, 0.5174562, 1, 1, 1, 1, 1,
0.5143557, 0.5660512, 3.492509, 1, 1, 1, 1, 1,
0.5143625, -0.8983009, 2.822794, 1, 1, 1, 1, 1,
0.5166653, -0.1988567, 1.899709, 1, 1, 1, 1, 1,
0.5179404, 0.5419256, 1.046434, 0, 0, 1, 1, 1,
0.5190445, 0.1464797, 1.733128, 1, 0, 0, 1, 1,
0.5191042, -0.4990893, 1.953059, 1, 0, 0, 1, 1,
0.5208331, -0.7410067, 2.119514, 1, 0, 0, 1, 1,
0.5253404, 0.7447059, 1.268346, 1, 0, 0, 1, 1,
0.5253491, -0.07525624, 0.602715, 1, 0, 0, 1, 1,
0.5279337, -1.338098, 1.770184, 0, 0, 0, 1, 1,
0.5308909, -2.353973, 2.148854, 0, 0, 0, 1, 1,
0.5319566, 1.520637, 1.965517, 0, 0, 0, 1, 1,
0.5437486, 2.303801, 0.8394113, 0, 0, 0, 1, 1,
0.5460842, -0.9909889, 2.364943, 0, 0, 0, 1, 1,
0.5487883, 1.227924, -0.02128055, 0, 0, 0, 1, 1,
0.5651376, 0.4794269, 0.8867375, 0, 0, 0, 1, 1,
0.5709689, -0.1094547, 2.324278, 1, 1, 1, 1, 1,
0.5855041, 0.7752347, -0.421817, 1, 1, 1, 1, 1,
0.5861205, 0.904483, 2.287724, 1, 1, 1, 1, 1,
0.5877651, 0.4785759, 1.669554, 1, 1, 1, 1, 1,
0.5937443, 0.06568968, 2.851937, 1, 1, 1, 1, 1,
0.5941117, -0.472173, 2.598227, 1, 1, 1, 1, 1,
0.6043801, 2.015098, 1.125129, 1, 1, 1, 1, 1,
0.6051899, 0.8144437, 0.3263862, 1, 1, 1, 1, 1,
0.6057696, -0.6671222, 1.980386, 1, 1, 1, 1, 1,
0.6073231, -1.134583, 3.698268, 1, 1, 1, 1, 1,
0.611187, -1.563933, 1.880212, 1, 1, 1, 1, 1,
0.6123689, 1.107425, -0.9487749, 1, 1, 1, 1, 1,
0.6179459, -0.8365144, 3.033977, 1, 1, 1, 1, 1,
0.6224289, 0.7581688, -1.069088, 1, 1, 1, 1, 1,
0.6275078, 0.2122816, 3.175902, 1, 1, 1, 1, 1,
0.628158, 2.375446, 1.306167, 0, 0, 1, 1, 1,
0.6283244, 0.2459934, 1.873432, 1, 0, 0, 1, 1,
0.6310289, 0.7919435, -0.05568479, 1, 0, 0, 1, 1,
0.6334084, 1.046607, 0.4558558, 1, 0, 0, 1, 1,
0.6339074, 0.1043824, 1.434897, 1, 0, 0, 1, 1,
0.6358044, -0.1461829, 2.655754, 1, 0, 0, 1, 1,
0.6386489, 0.9372519, 1.762042, 0, 0, 0, 1, 1,
0.6413068, 0.2672567, 0.6683445, 0, 0, 0, 1, 1,
0.6417067, -0.5476364, 0.8638468, 0, 0, 0, 1, 1,
0.642495, -1.790111, 2.552301, 0, 0, 0, 1, 1,
0.6495528, 1.008667, 0.2851468, 0, 0, 0, 1, 1,
0.6514295, 0.5022156, 0.4123761, 0, 0, 0, 1, 1,
0.6559033, 0.3036591, 2.828995, 0, 0, 0, 1, 1,
0.6583689, 0.1837617, 1.7347, 1, 1, 1, 1, 1,
0.6606382, -1.669793, 2.8652, 1, 1, 1, 1, 1,
0.6613211, 0.7074422, 1.573779, 1, 1, 1, 1, 1,
0.6620275, -0.8226975, 2.548907, 1, 1, 1, 1, 1,
0.6622396, 0.388938, 0.1837662, 1, 1, 1, 1, 1,
0.663107, -0.07647055, 0.8085897, 1, 1, 1, 1, 1,
0.6653976, 1.147538, 0.8268983, 1, 1, 1, 1, 1,
0.6680334, 0.1748045, 0.1988803, 1, 1, 1, 1, 1,
0.669199, 0.6943942, -0.1639553, 1, 1, 1, 1, 1,
0.6693192, -0.1535914, 0.4574108, 1, 1, 1, 1, 1,
0.6694373, 1.256506, -0.40895, 1, 1, 1, 1, 1,
0.6728497, 0.3336101, 0.1892051, 1, 1, 1, 1, 1,
0.6757914, 0.8073333, 0.5925524, 1, 1, 1, 1, 1,
0.6759588, -1.406949, 3.590842, 1, 1, 1, 1, 1,
0.6797149, 0.7040094, 3.000908, 1, 1, 1, 1, 1,
0.6816167, 0.5511952, 1.414278, 0, 0, 1, 1, 1,
0.6860825, 1.13031, -0.2101353, 1, 0, 0, 1, 1,
0.6985136, 0.7731133, 0.2469739, 1, 0, 0, 1, 1,
0.7008608, 0.1387352, 2.114836, 1, 0, 0, 1, 1,
0.7057521, -0.01022907, 2.425218, 1, 0, 0, 1, 1,
0.7058627, 0.3758165, 1.296192, 1, 0, 0, 1, 1,
0.7104502, 1.471458, -0.004469004, 0, 0, 0, 1, 1,
0.7191694, -1.355993, 3.436443, 0, 0, 0, 1, 1,
0.7197074, 0.07316118, 2.25129, 0, 0, 0, 1, 1,
0.72052, 0.3809971, 0.3979645, 0, 0, 0, 1, 1,
0.7225236, -0.1275759, 4.688449, 0, 0, 0, 1, 1,
0.7244657, -1.170577, 4.005277, 0, 0, 0, 1, 1,
0.7259166, -1.415362, 3.908896, 0, 0, 0, 1, 1,
0.7301115, -0.4904348, 1.911723, 1, 1, 1, 1, 1,
0.7338644, 0.6977693, -0.7840623, 1, 1, 1, 1, 1,
0.7352766, 0.3583585, 1.864582, 1, 1, 1, 1, 1,
0.7364698, 1.017182, 0.3005746, 1, 1, 1, 1, 1,
0.7383186, 0.1517626, -0.7792843, 1, 1, 1, 1, 1,
0.7419134, -0.4398852, 1.583314, 1, 1, 1, 1, 1,
0.7423936, -1.868155, 4.431099, 1, 1, 1, 1, 1,
0.7469504, 0.8114558, 1.813225, 1, 1, 1, 1, 1,
0.747166, 0.2439373, -0.4501175, 1, 1, 1, 1, 1,
0.7501916, 2.171098, 0.2820286, 1, 1, 1, 1, 1,
0.7575444, 0.5245034, 2.121869, 1, 1, 1, 1, 1,
0.7598671, 0.1542779, 0.8149772, 1, 1, 1, 1, 1,
0.7650693, 1.657384, -0.8997914, 1, 1, 1, 1, 1,
0.7689618, -0.5454963, 2.566434, 1, 1, 1, 1, 1,
0.7691144, -0.9151925, 2.643911, 1, 1, 1, 1, 1,
0.7703292, -0.5330062, 2.266793, 0, 0, 1, 1, 1,
0.7708982, -1.34961, 2.637455, 1, 0, 0, 1, 1,
0.7739561, -0.3827173, 0.9955676, 1, 0, 0, 1, 1,
0.7762512, 0.9525849, 0.4053808, 1, 0, 0, 1, 1,
0.7815101, -0.6307555, 3.414586, 1, 0, 0, 1, 1,
0.7871572, 0.3228308, 3.117245, 1, 0, 0, 1, 1,
0.789542, 0.1726372, 0.5461324, 0, 0, 0, 1, 1,
0.798125, -0.6800849, 1.139285, 0, 0, 0, 1, 1,
0.8010964, -0.5495639, 1.057401, 0, 0, 0, 1, 1,
0.8012344, 0.4095367, 2.381793, 0, 0, 0, 1, 1,
0.8070273, 1.702361, -0.4079399, 0, 0, 0, 1, 1,
0.8076659, 1.04405, 0.6886997, 0, 0, 0, 1, 1,
0.8086201, -0.04489795, 1.765654, 0, 0, 0, 1, 1,
0.8092357, 0.9486338, 0.8615977, 1, 1, 1, 1, 1,
0.8109857, -0.7440195, 0.705856, 1, 1, 1, 1, 1,
0.8127407, 0.6068788, -0.2096968, 1, 1, 1, 1, 1,
0.820541, -1.231035, 1.088171, 1, 1, 1, 1, 1,
0.8266748, 0.7368993, 0.1643261, 1, 1, 1, 1, 1,
0.8269033, 0.1682528, 0.5242668, 1, 1, 1, 1, 1,
0.8315441, 1.916324, 0.254572, 1, 1, 1, 1, 1,
0.8335832, -0.301647, 3.238777, 1, 1, 1, 1, 1,
0.8345029, -0.8602182, 3.255639, 1, 1, 1, 1, 1,
0.8376747, -1.688649, 1.639478, 1, 1, 1, 1, 1,
0.8402762, 0.6560287, -0.1667595, 1, 1, 1, 1, 1,
0.8412312, -1.324454, 2.265725, 1, 1, 1, 1, 1,
0.8430262, -0.8059444, 2.588722, 1, 1, 1, 1, 1,
0.8499795, 0.8954411, 0.1018977, 1, 1, 1, 1, 1,
0.8529631, -1.637227, 4.733101, 1, 1, 1, 1, 1,
0.8573638, 0.6491971, 1.297894, 0, 0, 1, 1, 1,
0.8575735, 2.03363, -0.2056444, 1, 0, 0, 1, 1,
0.859445, 0.7511225, -0.4736531, 1, 0, 0, 1, 1,
0.8659374, 1.468356, 0.4147138, 1, 0, 0, 1, 1,
0.8700793, -0.3616101, 1.045419, 1, 0, 0, 1, 1,
0.8704705, -1.097828, 0.7981688, 1, 0, 0, 1, 1,
0.8724362, 0.8471418, 0.8856828, 0, 0, 0, 1, 1,
0.8780351, -0.3297118, 1.386288, 0, 0, 0, 1, 1,
0.8793322, -0.4355125, 1.852567, 0, 0, 0, 1, 1,
0.8858604, 0.9566182, 0.9815222, 0, 0, 0, 1, 1,
0.896722, 0.7281544, 2.005269, 0, 0, 0, 1, 1,
0.8999784, 0.5737171, 0.167542, 0, 0, 0, 1, 1,
0.9028712, 0.2396107, 0.9968684, 0, 0, 0, 1, 1,
0.9058314, 0.4975194, 1.278219, 1, 1, 1, 1, 1,
0.9084944, 0.5815348, 1.155011, 1, 1, 1, 1, 1,
0.9101457, 0.5816165, 0.9116367, 1, 1, 1, 1, 1,
0.9169525, -0.1400693, 1.443151, 1, 1, 1, 1, 1,
0.9175457, -0.8234982, 2.350184, 1, 1, 1, 1, 1,
0.9190935, -0.3504397, 2.075184, 1, 1, 1, 1, 1,
0.9226606, 0.8419756, -0.5976576, 1, 1, 1, 1, 1,
0.9278592, -0.5901986, 2.410707, 1, 1, 1, 1, 1,
0.9315141, -1.070418, 1.676373, 1, 1, 1, 1, 1,
0.9337551, -1.466153, 0.7950135, 1, 1, 1, 1, 1,
0.9574907, -0.7511849, 2.468738, 1, 1, 1, 1, 1,
0.9632282, 1.194161, 1.676192, 1, 1, 1, 1, 1,
0.9648255, -0.7109124, 3.021561, 1, 1, 1, 1, 1,
0.9658, 0.3190858, -0.2018597, 1, 1, 1, 1, 1,
0.9677918, 0.05190846, 1.385958, 1, 1, 1, 1, 1,
0.9684118, 0.2794182, 1.796272, 0, 0, 1, 1, 1,
0.9764326, -1.463192, 1.707228, 1, 0, 0, 1, 1,
0.982016, 0.02498119, 1.924104, 1, 0, 0, 1, 1,
0.9930432, 0.3201615, 3.025885, 1, 0, 0, 1, 1,
1.001499, -0.03307539, -0.9208527, 1, 0, 0, 1, 1,
1.002356, -0.1175336, 1.472143, 1, 0, 0, 1, 1,
1.008847, -1.200572, 3.807226, 0, 0, 0, 1, 1,
1.010015, -1.974305, 3.570693, 0, 0, 0, 1, 1,
1.011297, 0.06049584, 1.645444, 0, 0, 0, 1, 1,
1.015434, -1.198934, 1.833018, 0, 0, 0, 1, 1,
1.039811, -0.7091066, 2.686742, 0, 0, 0, 1, 1,
1.04015, 0.3406141, 0.6364763, 0, 0, 0, 1, 1,
1.041237, 0.3997172, 0.2895383, 0, 0, 0, 1, 1,
1.054329, 1.171021, -0.1999631, 1, 1, 1, 1, 1,
1.054476, 0.1126522, 0.6536229, 1, 1, 1, 1, 1,
1.066595, -0.005594065, 2.080127, 1, 1, 1, 1, 1,
1.072339, 1.250716, 1.181601, 1, 1, 1, 1, 1,
1.077829, -1.361869, 3.333777, 1, 1, 1, 1, 1,
1.087434, -0.2868755, 2.284842, 1, 1, 1, 1, 1,
1.087567, -0.8105381, 1.317877, 1, 1, 1, 1, 1,
1.088292, -0.5275585, 1.396389, 1, 1, 1, 1, 1,
1.096608, -0.8332352, 1.586157, 1, 1, 1, 1, 1,
1.100409, -0.1230741, 1.959073, 1, 1, 1, 1, 1,
1.102767, 0.2222962, 1.686548, 1, 1, 1, 1, 1,
1.10753, -2.641596, 3.291977, 1, 1, 1, 1, 1,
1.112534, -0.5828409, 0.6347004, 1, 1, 1, 1, 1,
1.11391, -1.780893, 2.824538, 1, 1, 1, 1, 1,
1.114725, 0.03228752, 0.3279044, 1, 1, 1, 1, 1,
1.117714, -0.9977321, 1.786384, 0, 0, 1, 1, 1,
1.123699, 0.3678432, -0.6171699, 1, 0, 0, 1, 1,
1.125865, 1.509615, 2.682705, 1, 0, 0, 1, 1,
1.12805, 1.513846, 2.185474, 1, 0, 0, 1, 1,
1.129771, 0.7886632, -1.873258, 1, 0, 0, 1, 1,
1.135221, 0.8595865, 0.8647434, 1, 0, 0, 1, 1,
1.136952, -0.04686145, 1.360946, 0, 0, 0, 1, 1,
1.170331, -0.9732156, 3.047846, 0, 0, 0, 1, 1,
1.175603, -0.7145711, 1.801275, 0, 0, 0, 1, 1,
1.17662, -0.1187723, 0.8391232, 0, 0, 0, 1, 1,
1.181538, 1.447509, -0.07513838, 0, 0, 0, 1, 1,
1.184492, -1.095842, 0.724486, 0, 0, 0, 1, 1,
1.186355, -0.6431149, 2.395845, 0, 0, 0, 1, 1,
1.188428, -0.7671276, 1.210139, 1, 1, 1, 1, 1,
1.190426, -1.231269, 2.789567, 1, 1, 1, 1, 1,
1.202809, -0.5685948, 0.1874333, 1, 1, 1, 1, 1,
1.204091, 0.7687002, 1.950586, 1, 1, 1, 1, 1,
1.220382, 0.1715956, 0.2049426, 1, 1, 1, 1, 1,
1.224579, 0.03280816, 0.6341029, 1, 1, 1, 1, 1,
1.231194, -0.5249057, 1.040339, 1, 1, 1, 1, 1,
1.243137, -0.7162037, 2.625225, 1, 1, 1, 1, 1,
1.253696, -0.5954364, 2.36543, 1, 1, 1, 1, 1,
1.261783, 0.7407513, -0.1150991, 1, 1, 1, 1, 1,
1.265244, 0.3360097, 2.129996, 1, 1, 1, 1, 1,
1.265449, 0.3303812, 0.8234508, 1, 1, 1, 1, 1,
1.265659, 0.9266006, -0.4845405, 1, 1, 1, 1, 1,
1.266772, -0.5360622, 2.223154, 1, 1, 1, 1, 1,
1.266792, -1.64939, 2.118813, 1, 1, 1, 1, 1,
1.269466, 0.8012115, 0.329655, 0, 0, 1, 1, 1,
1.275116, -0.7201502, 0.2163577, 1, 0, 0, 1, 1,
1.28126, 0.3767691, 2.552958, 1, 0, 0, 1, 1,
1.281631, -0.06811175, 1.969125, 1, 0, 0, 1, 1,
1.283452, 0.6326728, 1.397598, 1, 0, 0, 1, 1,
1.289314, 0.3409441, 1.68941, 1, 0, 0, 1, 1,
1.290719, 0.3464971, 1.02049, 0, 0, 0, 1, 1,
1.294981, -1.442832, 3.546428, 0, 0, 0, 1, 1,
1.303401, 0.8131981, 1.883482, 0, 0, 0, 1, 1,
1.344466, 2.683074, 0.4907119, 0, 0, 0, 1, 1,
1.345144, -1.018337, 2.27454, 0, 0, 0, 1, 1,
1.34972, -0.2619234, 1.579873, 0, 0, 0, 1, 1,
1.35228, -0.3006658, 1.467993, 0, 0, 0, 1, 1,
1.356351, 1.192033, 0.1104689, 1, 1, 1, 1, 1,
1.362304, -0.2655829, 2.755112, 1, 1, 1, 1, 1,
1.370868, -0.133579, 1.785901, 1, 1, 1, 1, 1,
1.380602, 0.6323714, 3.144, 1, 1, 1, 1, 1,
1.391821, 0.7598461, 2.697434, 1, 1, 1, 1, 1,
1.399753, -0.03911607, 1.775546, 1, 1, 1, 1, 1,
1.403125, 0.03997919, 1.611614, 1, 1, 1, 1, 1,
1.409892, 0.5626512, 2.553945, 1, 1, 1, 1, 1,
1.421912, 1.257791, 2.207821, 1, 1, 1, 1, 1,
1.433003, 0.01049956, 1.853483, 1, 1, 1, 1, 1,
1.434079, -1.224318, 2.953941, 1, 1, 1, 1, 1,
1.437672, 0.4619482, 0.777254, 1, 1, 1, 1, 1,
1.438936, -0.8731442, 1.214891, 1, 1, 1, 1, 1,
1.442512, 0.8839, 1.060284, 1, 1, 1, 1, 1,
1.451029, -1.488728, 0.5928827, 1, 1, 1, 1, 1,
1.451109, 0.9393643, -0.4315075, 0, 0, 1, 1, 1,
1.456774, 1.16743, -1.194872, 1, 0, 0, 1, 1,
1.459702, 0.5542004, 0.9761785, 1, 0, 0, 1, 1,
1.46093, 0.6354086, 0.7600272, 1, 0, 0, 1, 1,
1.466441, -0.2863469, 1.369968, 1, 0, 0, 1, 1,
1.473417, -0.9545496, 1.339664, 1, 0, 0, 1, 1,
1.475015, -1.277717, 0.8848484, 0, 0, 0, 1, 1,
1.496675, -0.5605675, 4.282706, 0, 0, 0, 1, 1,
1.501334, 0.5080732, 1.615131, 0, 0, 0, 1, 1,
1.505174, 0.4994926, 1.175886, 0, 0, 0, 1, 1,
1.507919, -0.3045038, 2.889918, 0, 0, 0, 1, 1,
1.523064, -0.3485368, 1.00271, 0, 0, 0, 1, 1,
1.525131, 2.043864, 1.640561, 0, 0, 0, 1, 1,
1.52656, 1.271561, 1.356506, 1, 1, 1, 1, 1,
1.533224, -0.2902727, 2.283314, 1, 1, 1, 1, 1,
1.545725, -0.5124608, 1.238958, 1, 1, 1, 1, 1,
1.551252, -0.7701797, 1.53456, 1, 1, 1, 1, 1,
1.551948, -1.002034, 0.8563337, 1, 1, 1, 1, 1,
1.56209, -0.5694999, 0.3810857, 1, 1, 1, 1, 1,
1.569678, -0.1243352, 1.535049, 1, 1, 1, 1, 1,
1.570242, 1.371061, -0.5110497, 1, 1, 1, 1, 1,
1.580584, 3.111077, 1.126241, 1, 1, 1, 1, 1,
1.587556, -0.4524918, 0.654027, 1, 1, 1, 1, 1,
1.589262, -0.1211629, 0.1565141, 1, 1, 1, 1, 1,
1.596227, 0.5680484, -0.09032562, 1, 1, 1, 1, 1,
1.598269, 0.7586285, -0.4197446, 1, 1, 1, 1, 1,
1.620629, 2.434729, 3.265623, 1, 1, 1, 1, 1,
1.623517, -0.4542138, 1.141552, 1, 1, 1, 1, 1,
1.626551, 0.1112712, -0.1415239, 0, 0, 1, 1, 1,
1.639285, -0.04709258, 1.093786, 1, 0, 0, 1, 1,
1.63969, -1.157361, 2.612556, 1, 0, 0, 1, 1,
1.644825, -1.095237, 2.551125, 1, 0, 0, 1, 1,
1.647213, 1.147186, 1.447007, 1, 0, 0, 1, 1,
1.692857, 0.01834296, 1.943442, 1, 0, 0, 1, 1,
1.709509, 0.8095257, 1.334431, 0, 0, 0, 1, 1,
1.709684, -0.4697267, 2.81868, 0, 0, 0, 1, 1,
1.71802, -0.4107403, 3.299078, 0, 0, 0, 1, 1,
1.719144, 0.174886, 2.928235, 0, 0, 0, 1, 1,
1.777402, 0.9636724, 0.5721584, 0, 0, 0, 1, 1,
1.778263, -0.6367725, 0.2046415, 0, 0, 0, 1, 1,
1.786694, 0.3833283, 0.8292365, 0, 0, 0, 1, 1,
1.842475, 0.5978536, 0.8637774, 1, 1, 1, 1, 1,
1.85765, 1.405246, 1.39371, 1, 1, 1, 1, 1,
1.892842, -0.1360936, 0.2997722, 1, 1, 1, 1, 1,
1.923079, -1.245885, 2.441238, 1, 1, 1, 1, 1,
1.963968, -0.07642616, 1.347924, 1, 1, 1, 1, 1,
1.965531, 0.9009978, -0.1504828, 1, 1, 1, 1, 1,
1.967996, -1.11262, 3.971269, 1, 1, 1, 1, 1,
1.995106, 1.102653, 0.121462, 1, 1, 1, 1, 1,
2.002237, -0.6215995, 1.234819, 1, 1, 1, 1, 1,
2.015107, 1.772609, 0.8453297, 1, 1, 1, 1, 1,
2.048893, -0.8908364, 2.586467, 1, 1, 1, 1, 1,
2.054174, -2.79589, 3.200383, 1, 1, 1, 1, 1,
2.067754, 0.1859935, -0.06761091, 1, 1, 1, 1, 1,
2.082928, -0.1033908, 3.221098, 1, 1, 1, 1, 1,
2.112326, 0.3454979, 0.3715322, 1, 1, 1, 1, 1,
2.140633, 0.966437, 0.5027778, 0, 0, 1, 1, 1,
2.155371, 1.599892, 1.185017, 1, 0, 0, 1, 1,
2.16212, 1.203666, 0.984771, 1, 0, 0, 1, 1,
2.16669, -0.2461573, 1.950835, 1, 0, 0, 1, 1,
2.223981, 0.6508509, 0.8812715, 1, 0, 0, 1, 1,
2.259325, -1.74961, 1.164341, 1, 0, 0, 1, 1,
2.26191, -0.3319106, -0.05404987, 0, 0, 0, 1, 1,
2.281348, 1.727689, 1.822757, 0, 0, 0, 1, 1,
2.287764, -1.049534, 0.5952539, 0, 0, 0, 1, 1,
2.322065, 2.057851, 1.612378, 0, 0, 0, 1, 1,
2.33488, 0.05667954, 1.976362, 0, 0, 0, 1, 1,
2.379691, 0.2300319, -0.12528, 0, 0, 0, 1, 1,
2.399455, -0.5067707, 1.538148, 0, 0, 0, 1, 1,
2.41621, 1.546268, 0.2402747, 1, 1, 1, 1, 1,
2.54056, -0.6039367, 0.9463902, 1, 1, 1, 1, 1,
2.619971, -0.4053821, 2.140421, 1, 1, 1, 1, 1,
2.680126, -0.1294525, 2.288594, 1, 1, 1, 1, 1,
2.687615, -0.05162728, 1.735955, 1, 1, 1, 1, 1,
2.863146, 0.2803062, -0.03698689, 1, 1, 1, 1, 1,
2.871413, 0.147405, -1.12131, 1, 1, 1, 1, 1
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
var radius = 9.642187;
var distance = 33.86777;
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
mvMatrix.translate( 0.2439522, 0.09353113, -0.06967545 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.86777);
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