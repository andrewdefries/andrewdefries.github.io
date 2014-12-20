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
-2.997161, 0.2583916, -3.312338, 1, 0, 0, 1,
-2.961255, 0.9433397, -0.7369208, 1, 0.007843138, 0, 1,
-2.721773, 1.389953, -0.2419637, 1, 0.01176471, 0, 1,
-2.687951, 0.452804, -2.177544, 1, 0.01960784, 0, 1,
-2.579287, 0.2640948, -3.782381, 1, 0.02352941, 0, 1,
-2.444774, 0.2793894, -0.5159458, 1, 0.03137255, 0, 1,
-2.393138, 1.245478, -0.2952636, 1, 0.03529412, 0, 1,
-2.195502, -1.350617, -3.226137, 1, 0.04313726, 0, 1,
-2.119061, -0.6410818, -0.8852103, 1, 0.04705882, 0, 1,
-2.09357, -0.8858404, -1.796644, 1, 0.05490196, 0, 1,
-2.084229, 0.2235855, -1.316944, 1, 0.05882353, 0, 1,
-2.079042, 0.6598705, 0.1227426, 1, 0.06666667, 0, 1,
-2.077986, 0.5392507, -1.455189, 1, 0.07058824, 0, 1,
-2.077886, -0.4292249, -1.34587, 1, 0.07843138, 0, 1,
-2.074874, 0.4116396, -2.760156, 1, 0.08235294, 0, 1,
-2.032154, 2.297903, -1.291263, 1, 0.09019608, 0, 1,
-2.027541, -1.900358, -2.820392, 1, 0.09411765, 0, 1,
-1.955021, -0.1717306, -0.8872633, 1, 0.1019608, 0, 1,
-1.951989, 0.3854806, -2.352075, 1, 0.1098039, 0, 1,
-1.948044, 0.05674081, -1.030315, 1, 0.1137255, 0, 1,
-1.940921, 1.20111, -0.3690691, 1, 0.1215686, 0, 1,
-1.938052, -0.5287389, -2.717859, 1, 0.1254902, 0, 1,
-1.911983, 0.3959382, -1.179061, 1, 0.1333333, 0, 1,
-1.865554, -0.005481714, -0.9656526, 1, 0.1372549, 0, 1,
-1.830342, 0.5833124, -0.3071536, 1, 0.145098, 0, 1,
-1.828795, -0.2916449, -2.240787, 1, 0.1490196, 0, 1,
-1.824013, -1.099463, -0.7895011, 1, 0.1568628, 0, 1,
-1.815778, -0.5514056, -1.289668, 1, 0.1607843, 0, 1,
-1.813673, 0.06808631, -1.914597, 1, 0.1686275, 0, 1,
-1.809458, -0.4757921, -1.02084, 1, 0.172549, 0, 1,
-1.777897, 1.023843, -1.330772, 1, 0.1803922, 0, 1,
-1.771608, 0.296736, -1.435112, 1, 0.1843137, 0, 1,
-1.753605, -0.9318617, -3.758988, 1, 0.1921569, 0, 1,
-1.733495, -0.1972122, -2.615993, 1, 0.1960784, 0, 1,
-1.73341, -0.8098477, -0.5400951, 1, 0.2039216, 0, 1,
-1.729878, 1.324214, 0.8673323, 1, 0.2117647, 0, 1,
-1.722188, -0.6727943, -2.386089, 1, 0.2156863, 0, 1,
-1.703494, 0.1574636, -1.665557, 1, 0.2235294, 0, 1,
-1.700891, 0.06422178, -1.71237, 1, 0.227451, 0, 1,
-1.696811, -2.158719, -2.687026, 1, 0.2352941, 0, 1,
-1.691522, 0.3661932, -1.495829, 1, 0.2392157, 0, 1,
-1.676106, 1.588821, 2.126105, 1, 0.2470588, 0, 1,
-1.674827, 0.1923108, -3.75078, 1, 0.2509804, 0, 1,
-1.668007, -1.421985, -2.580965, 1, 0.2588235, 0, 1,
-1.65227, 1.486757, -1.06541, 1, 0.2627451, 0, 1,
-1.64752, -1.901247, -2.867516, 1, 0.2705882, 0, 1,
-1.642224, 0.1942346, -2.18258, 1, 0.2745098, 0, 1,
-1.620049, -0.7136619, -1.469204, 1, 0.282353, 0, 1,
-1.596595, 0.0857328, -1.585619, 1, 0.2862745, 0, 1,
-1.59173, -0.8724822, -1.902874, 1, 0.2941177, 0, 1,
-1.580562, 0.3679835, -1.480112, 1, 0.3019608, 0, 1,
-1.574822, 0.151372, -1.063707, 1, 0.3058824, 0, 1,
-1.566936, -0.4917014, -2.842399, 1, 0.3137255, 0, 1,
-1.552068, 0.459896, -2.394423, 1, 0.3176471, 0, 1,
-1.549968, -0.7456756, -1.294906, 1, 0.3254902, 0, 1,
-1.548776, -0.3475338, -1.20027, 1, 0.3294118, 0, 1,
-1.518924, 0.4532899, -2.754594, 1, 0.3372549, 0, 1,
-1.518882, 0.8195064, -1.215255, 1, 0.3411765, 0, 1,
-1.505595, 1.475838, 0.8038422, 1, 0.3490196, 0, 1,
-1.497702, -0.4274586, -1.741423, 1, 0.3529412, 0, 1,
-1.48064, -1.447648, 0.01768662, 1, 0.3607843, 0, 1,
-1.462756, -0.3681677, -3.154898, 1, 0.3647059, 0, 1,
-1.461192, 1.54141, -0.4373006, 1, 0.372549, 0, 1,
-1.460312, 0.2360962, -0.8339548, 1, 0.3764706, 0, 1,
-1.455559, -0.5809253, -1.391971, 1, 0.3843137, 0, 1,
-1.453413, -0.4189143, -0.7363729, 1, 0.3882353, 0, 1,
-1.429808, 0.1695262, -0.340098, 1, 0.3960784, 0, 1,
-1.425747, -1.822432, -2.05819, 1, 0.4039216, 0, 1,
-1.424858, -0.6539273, -2.871345, 1, 0.4078431, 0, 1,
-1.424099, -0.1291966, -1.999906, 1, 0.4156863, 0, 1,
-1.420248, 0.8045552, 0.2477125, 1, 0.4196078, 0, 1,
-1.417569, -0.6612853, -1.701444, 1, 0.427451, 0, 1,
-1.414993, -1.748117, -3.9643, 1, 0.4313726, 0, 1,
-1.40546, 1.008019, 0.7385647, 1, 0.4392157, 0, 1,
-1.384895, 0.9659119, -2.837703, 1, 0.4431373, 0, 1,
-1.375728, 0.1117491, -1.843002, 1, 0.4509804, 0, 1,
-1.374098, -1.138953, -1.259463, 1, 0.454902, 0, 1,
-1.370693, 1.185527, -2.408788, 1, 0.4627451, 0, 1,
-1.368184, 0.1585013, -0.227605, 1, 0.4666667, 0, 1,
-1.361503, -1.276033, -3.136947, 1, 0.4745098, 0, 1,
-1.355931, -0.718822, -3.669389, 1, 0.4784314, 0, 1,
-1.348746, -0.6610639, -1.775711, 1, 0.4862745, 0, 1,
-1.345076, 1.939213, -0.7254605, 1, 0.4901961, 0, 1,
-1.337901, 0.7031693, -0.192596, 1, 0.4980392, 0, 1,
-1.337334, -0.4793432, -0.7909791, 1, 0.5058824, 0, 1,
-1.332651, -0.4137331, -1.225214, 1, 0.509804, 0, 1,
-1.33054, -0.5195681, -1.804568, 1, 0.5176471, 0, 1,
-1.320436, 0.4763263, -0.2610992, 1, 0.5215687, 0, 1,
-1.316741, 0.03668046, -1.563018, 1, 0.5294118, 0, 1,
-1.309477, 0.5332707, -2.24409, 1, 0.5333334, 0, 1,
-1.306639, -0.9002979, -4.215423, 1, 0.5411765, 0, 1,
-1.304921, 0.4328808, -1.739804, 1, 0.5450981, 0, 1,
-1.301317, -1.864681, -4.124713, 1, 0.5529412, 0, 1,
-1.29849, -1.73381, -0.4555101, 1, 0.5568628, 0, 1,
-1.296445, -1.868666, -3.190238, 1, 0.5647059, 0, 1,
-1.285176, -0.5790542, 0.04276964, 1, 0.5686275, 0, 1,
-1.284025, 0.1060783, -1.120734, 1, 0.5764706, 0, 1,
-1.28176, 1.058152, -3.267568, 1, 0.5803922, 0, 1,
-1.278086, 0.6441088, -1.271645, 1, 0.5882353, 0, 1,
-1.25591, -1.155115, -1.671218, 1, 0.5921569, 0, 1,
-1.254938, -1.146457, -2.457344, 1, 0.6, 0, 1,
-1.242412, -1.913326, -2.435223, 1, 0.6078432, 0, 1,
-1.233526, 1.596202, -2.101865, 1, 0.6117647, 0, 1,
-1.191019, -0.1437719, -1.034906, 1, 0.6196079, 0, 1,
-1.188367, 0.7722656, -1.529856, 1, 0.6235294, 0, 1,
-1.186827, -1.347796, -3.828891, 1, 0.6313726, 0, 1,
-1.172977, 0.7020951, -1.619614, 1, 0.6352941, 0, 1,
-1.168755, -1.721402, -3.368224, 1, 0.6431373, 0, 1,
-1.16811, 0.2977469, -1.743137, 1, 0.6470588, 0, 1,
-1.16666, 0.9953845, -0.5374545, 1, 0.654902, 0, 1,
-1.162871, 0.6679012, -0.7342532, 1, 0.6588235, 0, 1,
-1.161723, 1.512069, -1.95511, 1, 0.6666667, 0, 1,
-1.149684, -1.11699, -1.903268, 1, 0.6705883, 0, 1,
-1.142271, -0.5935518, -2.140856, 1, 0.6784314, 0, 1,
-1.140034, 0.8595065, -0.5617821, 1, 0.682353, 0, 1,
-1.139651, 0.100093, -1.387295, 1, 0.6901961, 0, 1,
-1.137668, -1.686307, -2.065435, 1, 0.6941177, 0, 1,
-1.125772, 0.3047197, -2.668255, 1, 0.7019608, 0, 1,
-1.115512, -0.7130252, -1.624491, 1, 0.7098039, 0, 1,
-1.10227, -0.9119691, -2.201163, 1, 0.7137255, 0, 1,
-1.098959, -1.372025, -3.54553, 1, 0.7215686, 0, 1,
-1.094344, 0.5190593, -0.7978222, 1, 0.7254902, 0, 1,
-1.09386, 0.1618497, -1.723791, 1, 0.7333333, 0, 1,
-1.087003, 1.905976, 0.1139367, 1, 0.7372549, 0, 1,
-1.085568, -0.7677494, -6.081382, 1, 0.7450981, 0, 1,
-1.081531, -0.8722218, -3.738504, 1, 0.7490196, 0, 1,
-1.081126, -0.009907259, -4.273098, 1, 0.7568628, 0, 1,
-1.072238, 0.1555839, -3.078265, 1, 0.7607843, 0, 1,
-1.070474, 1.882757, -0.01116539, 1, 0.7686275, 0, 1,
-1.067571, -1.2734, -2.182038, 1, 0.772549, 0, 1,
-1.066509, -0.03418393, -2.031607, 1, 0.7803922, 0, 1,
-1.053432, -1.640164, -1.923892, 1, 0.7843137, 0, 1,
-1.051759, 0.7392619, 0.09609691, 1, 0.7921569, 0, 1,
-1.0439, 1.087193, -1.669581, 1, 0.7960784, 0, 1,
-1.029023, 1.351853, -0.5085166, 1, 0.8039216, 0, 1,
-1.028733, -0.3384227, -2.786157, 1, 0.8117647, 0, 1,
-1.023202, 0.6669742, -3.266505, 1, 0.8156863, 0, 1,
-1.018509, -1.924305, -2.067034, 1, 0.8235294, 0, 1,
-1.015022, -0.4087559, -1.794326, 1, 0.827451, 0, 1,
-1.012128, -0.2325147, -3.606075, 1, 0.8352941, 0, 1,
-1.001248, -1.431007, -3.67784, 1, 0.8392157, 0, 1,
-0.9986276, -0.02862998, -0.0749945, 1, 0.8470588, 0, 1,
-0.9974188, -0.6583552, -2.045636, 1, 0.8509804, 0, 1,
-0.9918318, 0.3137598, -2.547957, 1, 0.8588235, 0, 1,
-0.9872696, -0.5599338, -3.843809, 1, 0.8627451, 0, 1,
-0.9826702, 0.2039222, 0.507161, 1, 0.8705882, 0, 1,
-0.9803557, 0.4274034, -0.8218532, 1, 0.8745098, 0, 1,
-0.9788969, -0.9327952, -0.7002207, 1, 0.8823529, 0, 1,
-0.9748444, 0.2232957, -1.893358, 1, 0.8862745, 0, 1,
-0.9597324, 0.2473586, -1.719545, 1, 0.8941177, 0, 1,
-0.9563375, 0.4813882, -1.242733, 1, 0.8980392, 0, 1,
-0.9525859, -1.132437, -3.339821, 1, 0.9058824, 0, 1,
-0.944661, 1.373793, 0.4734213, 1, 0.9137255, 0, 1,
-0.9437113, 0.428214, -2.247722, 1, 0.9176471, 0, 1,
-0.9434438, -0.5473549, 1.051111, 1, 0.9254902, 0, 1,
-0.9422154, 1.069677, -1.992294, 1, 0.9294118, 0, 1,
-0.9389528, -1.01599, -2.143028, 1, 0.9372549, 0, 1,
-0.9384062, -0.7505789, -2.596656, 1, 0.9411765, 0, 1,
-0.9325386, 0.6870517, 0.1640529, 1, 0.9490196, 0, 1,
-0.932398, -0.96595, -2.138399, 1, 0.9529412, 0, 1,
-0.9263044, 1.274729, -1.475366, 1, 0.9607843, 0, 1,
-0.9151713, 1.019446, -0.5178149, 1, 0.9647059, 0, 1,
-0.9134694, 0.3909172, -0.4372323, 1, 0.972549, 0, 1,
-0.9074706, 1.622653, 1.868843, 1, 0.9764706, 0, 1,
-0.9040244, 1.036237, -1.209367, 1, 0.9843137, 0, 1,
-0.9000985, -0.470063, -3.668979, 1, 0.9882353, 0, 1,
-0.8988971, 0.2676052, -1.204552, 1, 0.9960784, 0, 1,
-0.8959519, -0.5661312, -2.669101, 0.9960784, 1, 0, 1,
-0.8953363, 0.9076028, -0.3023583, 0.9921569, 1, 0, 1,
-0.8929158, 2.40373, -0.5176638, 0.9843137, 1, 0, 1,
-0.8920547, -0.02464204, -0.9647999, 0.9803922, 1, 0, 1,
-0.8893042, -0.9110278, -2.414375, 0.972549, 1, 0, 1,
-0.8839083, 0.5857293, -0.4719749, 0.9686275, 1, 0, 1,
-0.8837321, 0.6938521, -0.738709, 0.9607843, 1, 0, 1,
-0.8816354, 0.5397127, -0.849243, 0.9568627, 1, 0, 1,
-0.8735599, 0.527526, -0.09570078, 0.9490196, 1, 0, 1,
-0.8715739, -0.7712138, -2.484001, 0.945098, 1, 0, 1,
-0.871538, 0.3543237, -0.2690562, 0.9372549, 1, 0, 1,
-0.8684728, -0.3745456, -1.942387, 0.9333333, 1, 0, 1,
-0.865898, 1.620845, -1.105567, 0.9254902, 1, 0, 1,
-0.8656032, 0.6042796, -1.623377, 0.9215686, 1, 0, 1,
-0.8629699, 0.4756421, -0.8418333, 0.9137255, 1, 0, 1,
-0.8611926, 0.7549379, -1.688988, 0.9098039, 1, 0, 1,
-0.8590245, 1.099531, -1.320126, 0.9019608, 1, 0, 1,
-0.8586664, 1.454755, 0.098571, 0.8941177, 1, 0, 1,
-0.8573312, -0.2031689, -1.541553, 0.8901961, 1, 0, 1,
-0.8536198, -0.3352094, -2.715105, 0.8823529, 1, 0, 1,
-0.8468656, -0.2599008, -2.056848, 0.8784314, 1, 0, 1,
-0.8409811, 0.3957836, -1.392734, 0.8705882, 1, 0, 1,
-0.8358402, 0.2900533, -0.8360579, 0.8666667, 1, 0, 1,
-0.8336843, -0.2879256, -2.134976, 0.8588235, 1, 0, 1,
-0.8252182, 0.2847176, -1.728006, 0.854902, 1, 0, 1,
-0.8233798, 2.156029, -1.378405, 0.8470588, 1, 0, 1,
-0.8200761, 0.5392007, -0.990279, 0.8431373, 1, 0, 1,
-0.8159975, -0.657373, -1.789775, 0.8352941, 1, 0, 1,
-0.8156374, -0.6935428, -2.675505, 0.8313726, 1, 0, 1,
-0.8124905, 0.3522634, -0.2149477, 0.8235294, 1, 0, 1,
-0.8052048, -0.5285766, -1.606752, 0.8196079, 1, 0, 1,
-0.7962844, -2.324465, -3.350994, 0.8117647, 1, 0, 1,
-0.7942221, -0.8960513, -1.562736, 0.8078431, 1, 0, 1,
-0.7793809, -0.1251093, -1.470575, 0.8, 1, 0, 1,
-0.7792367, -1.468916, -2.132916, 0.7921569, 1, 0, 1,
-0.7784177, 0.3273948, 0.8050934, 0.7882353, 1, 0, 1,
-0.7774923, 0.03494726, -2.526691, 0.7803922, 1, 0, 1,
-0.7757159, 0.4493704, -2.231495, 0.7764706, 1, 0, 1,
-0.7756684, 0.9902565, -1.495197, 0.7686275, 1, 0, 1,
-0.7732783, -0.9306067, -3.445848, 0.7647059, 1, 0, 1,
-0.7711168, 0.3055812, -2.518677, 0.7568628, 1, 0, 1,
-0.7698608, 0.626913, -2.298456, 0.7529412, 1, 0, 1,
-0.7631234, 0.3401587, -1.719168, 0.7450981, 1, 0, 1,
-0.7570541, 0.734871, -2.082127, 0.7411765, 1, 0, 1,
-0.7536538, 1.083112, -0.5471741, 0.7333333, 1, 0, 1,
-0.7525892, 1.080394, -1.267576, 0.7294118, 1, 0, 1,
-0.7462103, 0.220637, -1.665329, 0.7215686, 1, 0, 1,
-0.7456545, 0.3367129, 0.4068824, 0.7176471, 1, 0, 1,
-0.7417459, 0.3485569, 0.2028174, 0.7098039, 1, 0, 1,
-0.7399774, -0.443546, -0.4173928, 0.7058824, 1, 0, 1,
-0.7396023, -1.473026, -1.100272, 0.6980392, 1, 0, 1,
-0.7383021, 0.03654551, -0.8681986, 0.6901961, 1, 0, 1,
-0.7337704, 1.899943, 0.1647863, 0.6862745, 1, 0, 1,
-0.7268126, 0.7066246, -0.8136275, 0.6784314, 1, 0, 1,
-0.7261427, -1.098254, -4.217077, 0.6745098, 1, 0, 1,
-0.720842, -0.1821331, -1.554272, 0.6666667, 1, 0, 1,
-0.7135264, -1.184194, -3.077457, 0.6627451, 1, 0, 1,
-0.7070599, 0.8572136, -2.290506, 0.654902, 1, 0, 1,
-0.7069601, 0.9861851, -1.658421, 0.6509804, 1, 0, 1,
-0.7068378, 1.061872, -1.967943, 0.6431373, 1, 0, 1,
-0.704075, 0.1605921, -1.859533, 0.6392157, 1, 0, 1,
-0.7034953, 0.8928532, -0.9200183, 0.6313726, 1, 0, 1,
-0.7027551, -0.117043, -2.309837, 0.627451, 1, 0, 1,
-0.702062, -2.046739, -1.874903, 0.6196079, 1, 0, 1,
-0.6975486, 1.469565, 0.4303019, 0.6156863, 1, 0, 1,
-0.6968513, 1.519343, -1.945658, 0.6078432, 1, 0, 1,
-0.6966513, 0.6498939, -0.296324, 0.6039216, 1, 0, 1,
-0.6915551, 0.3626776, -0.2573836, 0.5960785, 1, 0, 1,
-0.6858623, -1.893763, -0.8181968, 0.5882353, 1, 0, 1,
-0.6851761, 0.4391003, -0.4762561, 0.5843138, 1, 0, 1,
-0.6838114, -1.562431, -2.141381, 0.5764706, 1, 0, 1,
-0.6820953, 0.3151538, -2.204293, 0.572549, 1, 0, 1,
-0.6795983, -1.900007, -2.159416, 0.5647059, 1, 0, 1,
-0.6791614, -1.973318, -2.556194, 0.5607843, 1, 0, 1,
-0.6758643, -0.3132229, -3.371075, 0.5529412, 1, 0, 1,
-0.6706426, -0.3924976, -1.432705, 0.5490196, 1, 0, 1,
-0.6698361, 0.8438314, 0.2727133, 0.5411765, 1, 0, 1,
-0.6635112, -0.07971372, -3.168607, 0.5372549, 1, 0, 1,
-0.661808, 0.0388091, -1.269741, 0.5294118, 1, 0, 1,
-0.6615292, 0.863562, -0.7551655, 0.5254902, 1, 0, 1,
-0.657505, 1.115309, -0.7586772, 0.5176471, 1, 0, 1,
-0.657297, -1.847595, -2.768236, 0.5137255, 1, 0, 1,
-0.6554874, 1.072995, 0.4453787, 0.5058824, 1, 0, 1,
-0.6510383, -0.8606041, -4.086487, 0.5019608, 1, 0, 1,
-0.6482693, -2.548457, -3.85174, 0.4941176, 1, 0, 1,
-0.6462711, -1.436812, -0.9386898, 0.4862745, 1, 0, 1,
-0.6452126, -0.7383868, -3.307924, 0.4823529, 1, 0, 1,
-0.643886, 0.6584647, -0.7949324, 0.4745098, 1, 0, 1,
-0.643353, 0.4605637, -0.3717343, 0.4705882, 1, 0, 1,
-0.6420542, -0.5025051, -1.559509, 0.4627451, 1, 0, 1,
-0.6283409, -0.5385838, -2.065725, 0.4588235, 1, 0, 1,
-0.6198038, 1.044513, 1.012144, 0.4509804, 1, 0, 1,
-0.6115524, -0.3350776, -2.592306, 0.4470588, 1, 0, 1,
-0.6089119, 0.2159329, -1.876579, 0.4392157, 1, 0, 1,
-0.6022655, 0.6991413, -0.4617337, 0.4352941, 1, 0, 1,
-0.5980662, 0.466688, -1.773344, 0.427451, 1, 0, 1,
-0.5951402, 0.03984819, -1.458041, 0.4235294, 1, 0, 1,
-0.5900303, -0.4773006, -2.153172, 0.4156863, 1, 0, 1,
-0.5853457, -0.7030869, -1.010523, 0.4117647, 1, 0, 1,
-0.5847209, -0.8607553, -4.367159, 0.4039216, 1, 0, 1,
-0.5814847, 0.5178285, -1.708502, 0.3960784, 1, 0, 1,
-0.5802925, 0.7135552, -2.027637, 0.3921569, 1, 0, 1,
-0.5765883, -1.426485, -3.243433, 0.3843137, 1, 0, 1,
-0.5746248, -0.8272269, -0.5352655, 0.3803922, 1, 0, 1,
-0.5641873, 0.2964058, -2.500412, 0.372549, 1, 0, 1,
-0.5640111, -0.8362092, -1.218806, 0.3686275, 1, 0, 1,
-0.5629835, 1.176939, -1.395024, 0.3607843, 1, 0, 1,
-0.5618902, 0.09836596, -1.948039, 0.3568628, 1, 0, 1,
-0.5605271, -0.7601879, -1.093067, 0.3490196, 1, 0, 1,
-0.5591565, -1.218582, -2.555271, 0.345098, 1, 0, 1,
-0.5494798, -0.5809324, -0.3785309, 0.3372549, 1, 0, 1,
-0.5435779, -1.203579, -1.536986, 0.3333333, 1, 0, 1,
-0.5433244, 0.02404881, -2.04092, 0.3254902, 1, 0, 1,
-0.5419211, 0.5295489, -2.651454, 0.3215686, 1, 0, 1,
-0.5378937, -0.3108339, -1.963641, 0.3137255, 1, 0, 1,
-0.5344117, 1.460772, -1.035964, 0.3098039, 1, 0, 1,
-0.5323217, 0.2392222, -2.662172, 0.3019608, 1, 0, 1,
-0.5303461, 0.8435245, -0.6860415, 0.2941177, 1, 0, 1,
-0.5288115, 0.2918545, -1.079495, 0.2901961, 1, 0, 1,
-0.5280729, 0.5992656, -1.679493, 0.282353, 1, 0, 1,
-0.5273077, 0.4201487, -0.6893903, 0.2784314, 1, 0, 1,
-0.5221339, 1.207965, -1.048909, 0.2705882, 1, 0, 1,
-0.5190792, -0.8230838, -1.977664, 0.2666667, 1, 0, 1,
-0.5144767, 0.9087577, -1.024769, 0.2588235, 1, 0, 1,
-0.5117404, -1.976122, -3.865654, 0.254902, 1, 0, 1,
-0.5089168, -0.3099794, -2.044563, 0.2470588, 1, 0, 1,
-0.5027127, -1.247444, -3.382202, 0.2431373, 1, 0, 1,
-0.5022197, 1.034831, -0.6971403, 0.2352941, 1, 0, 1,
-0.4989299, -0.4440462, -1.956907, 0.2313726, 1, 0, 1,
-0.4930474, 1.320671, -1.36725, 0.2235294, 1, 0, 1,
-0.4904293, -0.06528571, -0.5090518, 0.2196078, 1, 0, 1,
-0.4882048, 0.1791372, 1.77738, 0.2117647, 1, 0, 1,
-0.4849156, 1.990277, -0.3439869, 0.2078431, 1, 0, 1,
-0.4835559, -1.725865, -3.780135, 0.2, 1, 0, 1,
-0.4819592, -1.058533, -2.116517, 0.1921569, 1, 0, 1,
-0.4796625, -0.3508762, -2.016409, 0.1882353, 1, 0, 1,
-0.4773563, -1.0758, -1.938003, 0.1803922, 1, 0, 1,
-0.4718932, -0.5234787, -1.270408, 0.1764706, 1, 0, 1,
-0.4710509, 0.3327486, -0.4903375, 0.1686275, 1, 0, 1,
-0.4705608, 0.9620197, 1.132652, 0.1647059, 1, 0, 1,
-0.4637313, -0.1232522, -2.840356, 0.1568628, 1, 0, 1,
-0.4604958, 0.2039817, -0.7922655, 0.1529412, 1, 0, 1,
-0.4563299, -0.8399729, -1.50223, 0.145098, 1, 0, 1,
-0.4556512, 1.07855, -1.00916, 0.1411765, 1, 0, 1,
-0.4533516, -0.7749602, -2.645134, 0.1333333, 1, 0, 1,
-0.4528053, 1.117071, -1.599922, 0.1294118, 1, 0, 1,
-0.4504209, 0.05743909, -0.9702023, 0.1215686, 1, 0, 1,
-0.4487446, 0.3805679, -1.079365, 0.1176471, 1, 0, 1,
-0.4469556, 0.4188396, -1.145709, 0.1098039, 1, 0, 1,
-0.4445921, -0.5904863, -3.014273, 0.1058824, 1, 0, 1,
-0.444456, 0.7542906, -0.4599226, 0.09803922, 1, 0, 1,
-0.4435357, 0.3953967, -0.3260888, 0.09019608, 1, 0, 1,
-0.4433742, -1.433887, -3.986488, 0.08627451, 1, 0, 1,
-0.4430243, -0.7195773, -3.472513, 0.07843138, 1, 0, 1,
-0.4425222, 0.0403682, -0.1125846, 0.07450981, 1, 0, 1,
-0.4415495, 0.77652, -0.8516025, 0.06666667, 1, 0, 1,
-0.4404556, -0.1105808, -1.040181, 0.0627451, 1, 0, 1,
-0.4387746, -1.470081, -2.227793, 0.05490196, 1, 0, 1,
-0.4377773, 0.3024761, -0.6348549, 0.05098039, 1, 0, 1,
-0.4268061, -0.08796116, -1.675867, 0.04313726, 1, 0, 1,
-0.42603, 0.7979102, -1.789056, 0.03921569, 1, 0, 1,
-0.4250793, -0.5775913, -3.022671, 0.03137255, 1, 0, 1,
-0.4217244, -0.8482229, -3.004824, 0.02745098, 1, 0, 1,
-0.4210566, -0.5218536, -2.212717, 0.01960784, 1, 0, 1,
-0.4202814, 0.3568065, -1.030913, 0.01568628, 1, 0, 1,
-0.4199168, 1.417735, 0.04122236, 0.007843138, 1, 0, 1,
-0.4197775, 1.99869, -0.21858, 0.003921569, 1, 0, 1,
-0.4178433, 1.125891, 0.3189389, 0, 1, 0.003921569, 1,
-0.4150357, -1.057842, -2.63907, 0, 1, 0.01176471, 1,
-0.4146498, -0.8202603, -1.279962, 0, 1, 0.01568628, 1,
-0.4137151, -1.739105, -4.534458, 0, 1, 0.02352941, 1,
-0.4101728, 2.318637, -1.733953, 0, 1, 0.02745098, 1,
-0.4084598, 0.9494621, -1.511876, 0, 1, 0.03529412, 1,
-0.4078234, 2.191979, -0.2478739, 0, 1, 0.03921569, 1,
-0.4074997, -0.8677269, -2.825462, 0, 1, 0.04705882, 1,
-0.4059562, 0.7146124, 0.8149229, 0, 1, 0.05098039, 1,
-0.4045832, 1.115759, -0.8377327, 0, 1, 0.05882353, 1,
-0.4029749, -0.9116392, -2.081818, 0, 1, 0.0627451, 1,
-0.4016017, 1.74526, -2.096452, 0, 1, 0.07058824, 1,
-0.4014727, 1.389672, 1.229765, 0, 1, 0.07450981, 1,
-0.4011092, -1.223063, -2.2409, 0, 1, 0.08235294, 1,
-0.3988982, 1.039938, 0.2178168, 0, 1, 0.08627451, 1,
-0.3974494, -0.09020365, -0.6277802, 0, 1, 0.09411765, 1,
-0.3947561, -0.9130753, -2.295841, 0, 1, 0.1019608, 1,
-0.379234, -0.3026001, -2.830871, 0, 1, 0.1058824, 1,
-0.3770652, 0.8972809, -0.4885643, 0, 1, 0.1137255, 1,
-0.3759702, -0.5222779, -1.221367, 0, 1, 0.1176471, 1,
-0.3758931, -0.3355396, -2.374978, 0, 1, 0.1254902, 1,
-0.3729517, -0.8531614, -1.76433, 0, 1, 0.1294118, 1,
-0.3708695, 0.7692261, 0.1174378, 0, 1, 0.1372549, 1,
-0.3703251, 0.01159901, -1.139753, 0, 1, 0.1411765, 1,
-0.3660573, 0.5297399, 0.382648, 0, 1, 0.1490196, 1,
-0.3625212, 0.8916065, 0.8017631, 0, 1, 0.1529412, 1,
-0.3609617, -0.1686905, -0.7441146, 0, 1, 0.1607843, 1,
-0.3600566, -0.4520051, -1.081357, 0, 1, 0.1647059, 1,
-0.3571424, 0.7587086, 0.5262011, 0, 1, 0.172549, 1,
-0.3571337, 0.4934658, -0.9847707, 0, 1, 0.1764706, 1,
-0.3536217, 0.8858501, 0.8390711, 0, 1, 0.1843137, 1,
-0.3527273, -1.376897, -3.649265, 0, 1, 0.1882353, 1,
-0.3498263, 0.6580026, -0.7237495, 0, 1, 0.1960784, 1,
-0.3483175, 0.125414, -0.9824338, 0, 1, 0.2039216, 1,
-0.3473205, -0.5318807, -2.863704, 0, 1, 0.2078431, 1,
-0.3431023, 0.5541925, -0.8139488, 0, 1, 0.2156863, 1,
-0.3414505, 0.9404743, 1.089166, 0, 1, 0.2196078, 1,
-0.3392804, 1.45233, -0.07734825, 0, 1, 0.227451, 1,
-0.338717, -0.2045948, -1.607654, 0, 1, 0.2313726, 1,
-0.3324958, 0.4337522, -1.27911, 0, 1, 0.2392157, 1,
-0.3321961, 0.07086956, -1.539085, 0, 1, 0.2431373, 1,
-0.3317192, -0.9377515, -0.9908563, 0, 1, 0.2509804, 1,
-0.3298106, -0.7523903, -5.325126, 0, 1, 0.254902, 1,
-0.3287608, -1.117509, -1.235394, 0, 1, 0.2627451, 1,
-0.3241954, 0.3631063, -0.1456992, 0, 1, 0.2666667, 1,
-0.3173523, -0.06192864, -0.4981155, 0, 1, 0.2745098, 1,
-0.3171092, 0.2969759, -0.7674893, 0, 1, 0.2784314, 1,
-0.3139679, 0.4457648, -2.207004, 0, 1, 0.2862745, 1,
-0.3081676, 1.207819, -0.5812011, 0, 1, 0.2901961, 1,
-0.304778, -2.127235, -4.030305, 0, 1, 0.2980392, 1,
-0.3026218, 0.4429035, 0.891391, 0, 1, 0.3058824, 1,
-0.3015344, 1.770328, -0.4286252, 0, 1, 0.3098039, 1,
-0.3008435, 0.9492334, 1.260164, 0, 1, 0.3176471, 1,
-0.2990598, 0.9464625, -0.9479595, 0, 1, 0.3215686, 1,
-0.2964747, -0.5008975, -1.179885, 0, 1, 0.3294118, 1,
-0.2958218, -0.6257275, -3.085531, 0, 1, 0.3333333, 1,
-0.2958012, -0.9297222, -2.309904, 0, 1, 0.3411765, 1,
-0.2954284, 0.5651298, -2.504528, 0, 1, 0.345098, 1,
-0.294385, -0.4828544, -1.173901, 0, 1, 0.3529412, 1,
-0.2933157, 0.1885837, -1.139286, 0, 1, 0.3568628, 1,
-0.2926095, 0.4194362, -1.028985, 0, 1, 0.3647059, 1,
-0.2818665, -1.052878, -3.069311, 0, 1, 0.3686275, 1,
-0.281645, -1.097044, -2.995125, 0, 1, 0.3764706, 1,
-0.2808908, 0.1900599, -1.108446, 0, 1, 0.3803922, 1,
-0.280295, 1.884495, 0.7597009, 0, 1, 0.3882353, 1,
-0.2755374, 0.09375107, 0.273021, 0, 1, 0.3921569, 1,
-0.2725821, 0.3664854, -1.481277, 0, 1, 0.4, 1,
-0.2699604, 1.097245, -1.081696, 0, 1, 0.4078431, 1,
-0.2572772, -0.5427951, -1.795498, 0, 1, 0.4117647, 1,
-0.2561916, -1.900845, -4.167479, 0, 1, 0.4196078, 1,
-0.2532943, 1.923981, 0.07472399, 0, 1, 0.4235294, 1,
-0.2520769, 0.3814096, 0.6315042, 0, 1, 0.4313726, 1,
-0.2515339, -0.7689005, -3.566909, 0, 1, 0.4352941, 1,
-0.2501252, -0.7282139, -1.517255, 0, 1, 0.4431373, 1,
-0.2486748, 1.271616, -0.8876756, 0, 1, 0.4470588, 1,
-0.2433709, 0.2189632, 0.3513129, 0, 1, 0.454902, 1,
-0.2417707, -0.3955758, -3.471519, 0, 1, 0.4588235, 1,
-0.2393378, 0.7798056, 0.721127, 0, 1, 0.4666667, 1,
-0.2301681, -1.664149, -2.482178, 0, 1, 0.4705882, 1,
-0.2256186, -0.3584148, -3.170819, 0, 1, 0.4784314, 1,
-0.2247216, 0.9064708, 0.5382106, 0, 1, 0.4823529, 1,
-0.2230625, 2.260071, 0.3242721, 0, 1, 0.4901961, 1,
-0.2226713, -0.2000903, -3.013431, 0, 1, 0.4941176, 1,
-0.2195711, -0.07051791, -0.7715715, 0, 1, 0.5019608, 1,
-0.2098337, 0.8480535, -0.446285, 0, 1, 0.509804, 1,
-0.2046061, 1.905988, -0.2926121, 0, 1, 0.5137255, 1,
-0.2025312, -0.8884639, -3.85505, 0, 1, 0.5215687, 1,
-0.1950016, -0.4796026, -1.921226, 0, 1, 0.5254902, 1,
-0.1936295, -0.5037701, -1.314558, 0, 1, 0.5333334, 1,
-0.190193, 0.08073026, -1.665668, 0, 1, 0.5372549, 1,
-0.1822726, -0.8520874, -1.883357, 0, 1, 0.5450981, 1,
-0.1787859, 0.4787681, -0.4624009, 0, 1, 0.5490196, 1,
-0.1770729, -0.5876875, -3.082232, 0, 1, 0.5568628, 1,
-0.1703385, -0.1509431, -0.959612, 0, 1, 0.5607843, 1,
-0.1645222, 0.5438085, -0.743381, 0, 1, 0.5686275, 1,
-0.1589555, -0.034298, -2.089634, 0, 1, 0.572549, 1,
-0.1586431, -0.4027552, -5.178948, 0, 1, 0.5803922, 1,
-0.1585416, 0.8419112, -0.2015857, 0, 1, 0.5843138, 1,
-0.1565417, -1.590891, -2.977955, 0, 1, 0.5921569, 1,
-0.1538184, 1.401896, 0.5800669, 0, 1, 0.5960785, 1,
-0.1531581, -0.4441576, -2.933513, 0, 1, 0.6039216, 1,
-0.1521201, 1.178154, 0.2098893, 0, 1, 0.6117647, 1,
-0.1436138, 0.3855101, -0.7259571, 0, 1, 0.6156863, 1,
-0.1426416, -1.374124, -2.095866, 0, 1, 0.6235294, 1,
-0.138922, 0.4910129, -0.9587564, 0, 1, 0.627451, 1,
-0.1366213, 0.4545074, 0.4579395, 0, 1, 0.6352941, 1,
-0.1355719, -1.234546, -2.297623, 0, 1, 0.6392157, 1,
-0.1354018, 0.1091837, -0.5751425, 0, 1, 0.6470588, 1,
-0.1346489, 0.4127313, 0.04470192, 0, 1, 0.6509804, 1,
-0.1340482, 0.0639727, -2.816299, 0, 1, 0.6588235, 1,
-0.1340331, 0.0553307, -0.9754277, 0, 1, 0.6627451, 1,
-0.1287822, 0.8181859, -1.944385, 0, 1, 0.6705883, 1,
-0.1249546, -0.5634822, -0.3572741, 0, 1, 0.6745098, 1,
-0.1175578, -1.809584, -2.042408, 0, 1, 0.682353, 1,
-0.1168891, 2.25576, 0.05490892, 0, 1, 0.6862745, 1,
-0.1118051, 0.2326736, -0.838083, 0, 1, 0.6941177, 1,
-0.1108774, 0.03877337, -1.616632, 0, 1, 0.7019608, 1,
-0.1075481, 1.031419, -0.6676672, 0, 1, 0.7058824, 1,
-0.1057453, -0.6132327, -3.39257, 0, 1, 0.7137255, 1,
-0.1034589, -1.609176, -4.445636, 0, 1, 0.7176471, 1,
-0.1025589, -0.365564, -2.642579, 0, 1, 0.7254902, 1,
-0.1001249, 0.1149613, 0.179443, 0, 1, 0.7294118, 1,
-0.1000662, -0.8925458, -3.263087, 0, 1, 0.7372549, 1,
-0.09928555, -1.73738, -3.139411, 0, 1, 0.7411765, 1,
-0.09894869, 0.01581219, -1.101897, 0, 1, 0.7490196, 1,
-0.09522146, 0.8004818, 0.7472918, 0, 1, 0.7529412, 1,
-0.09325259, 0.9286441, -0.9201702, 0, 1, 0.7607843, 1,
-0.09159209, -1.616073, -2.587343, 0, 1, 0.7647059, 1,
-0.08671079, 0.5003487, -0.1480737, 0, 1, 0.772549, 1,
-0.08531331, 1.12492, -1.607469, 0, 1, 0.7764706, 1,
-0.08115198, -0.9296354, -2.366051, 0, 1, 0.7843137, 1,
-0.08111587, 0.3730372, 0.6123762, 0, 1, 0.7882353, 1,
-0.0796811, -1.241613, -3.036622, 0, 1, 0.7960784, 1,
-0.0773463, -0.3799395, -3.185195, 0, 1, 0.8039216, 1,
-0.07614122, -0.8026679, -3.54023, 0, 1, 0.8078431, 1,
-0.07025539, -1.544091, -2.960557, 0, 1, 0.8156863, 1,
-0.06984849, -0.7902153, -4.192899, 0, 1, 0.8196079, 1,
-0.0688612, -0.4304492, -3.29206, 0, 1, 0.827451, 1,
-0.06770387, 1.582111, -0.1743425, 0, 1, 0.8313726, 1,
-0.06730378, 1.486449, -0.1073987, 0, 1, 0.8392157, 1,
-0.06636453, -0.08343563, -2.593795, 0, 1, 0.8431373, 1,
-0.06617701, 1.248236, -1.046835, 0, 1, 0.8509804, 1,
-0.06471815, 1.595523, 0.703866, 0, 1, 0.854902, 1,
-0.06455408, 0.6493705, -1.238641, 0, 1, 0.8627451, 1,
-0.06040121, 0.3636931, -0.4344259, 0, 1, 0.8666667, 1,
-0.0598173, 0.835828, -2.998032, 0, 1, 0.8745098, 1,
-0.05855357, -0.07136237, -4.555309, 0, 1, 0.8784314, 1,
-0.0575407, -0.3154152, -3.218402, 0, 1, 0.8862745, 1,
-0.05602934, 2.064327, 0.6202264, 0, 1, 0.8901961, 1,
-0.05299938, 0.6421811, -0.3369402, 0, 1, 0.8980392, 1,
-0.05296047, 0.7135313, -0.9131428, 0, 1, 0.9058824, 1,
-0.05264928, 0.8909669, -0.2368773, 0, 1, 0.9098039, 1,
-0.05238942, -0.9086394, -3.398308, 0, 1, 0.9176471, 1,
-0.05177929, 0.7104703, -0.1240492, 0, 1, 0.9215686, 1,
-0.04953688, 0.4109461, -2.918617, 0, 1, 0.9294118, 1,
-0.04861686, 2.09985, 1.474816, 0, 1, 0.9333333, 1,
-0.04719854, -0.5964529, -3.540089, 0, 1, 0.9411765, 1,
-0.0469407, -0.06679133, -3.015262, 0, 1, 0.945098, 1,
-0.04557806, 0.3742081, 0.1013301, 0, 1, 0.9529412, 1,
-0.04400385, 0.01933609, -2.834569, 0, 1, 0.9568627, 1,
-0.0439067, 0.1336941, 0.4110699, 0, 1, 0.9647059, 1,
-0.04092345, -0.35397, -2.119723, 0, 1, 0.9686275, 1,
-0.03986892, -0.5489336, -2.646694, 0, 1, 0.9764706, 1,
-0.03964315, -0.9644459, -3.802727, 0, 1, 0.9803922, 1,
-0.03440626, 1.267906, 0.8833114, 0, 1, 0.9882353, 1,
-0.03256036, 1.689707, 0.2856836, 0, 1, 0.9921569, 1,
-0.02847425, 0.08601914, 1.049238, 0, 1, 1, 1,
-0.02026499, -0.08231223, -3.215623, 0, 0.9921569, 1, 1,
-0.01915265, 0.2983218, -0.859015, 0, 0.9882353, 1, 1,
-0.01887351, 1.687488, 0.1245364, 0, 0.9803922, 1, 1,
-0.01140174, 1.388709, 0.2393253, 0, 0.9764706, 1, 1,
-0.008277515, 0.5830067, 1.235429, 0, 0.9686275, 1, 1,
-0.007864163, 1.350126, -0.1275539, 0, 0.9647059, 1, 1,
-0.0071753, 0.0769475, -0.3343766, 0, 0.9568627, 1, 1,
-0.001609569, 1.977414, 0.4813604, 0, 0.9529412, 1, 1,
0.008325759, -0.8994811, 3.597288, 0, 0.945098, 1, 1,
0.008327362, -0.6185632, 2.962339, 0, 0.9411765, 1, 1,
0.01025035, -0.2490858, 1.971903, 0, 0.9333333, 1, 1,
0.01130261, -0.3215691, 3.201419, 0, 0.9294118, 1, 1,
0.01307201, -1.9895, 3.489542, 0, 0.9215686, 1, 1,
0.01367621, 0.2106778, 0.4545749, 0, 0.9176471, 1, 1,
0.01470958, 2.695431, -0.5460137, 0, 0.9098039, 1, 1,
0.01611388, -0.537676, 3.36779, 0, 0.9058824, 1, 1,
0.0169975, -2.444661, 2.699421, 0, 0.8980392, 1, 1,
0.02163084, -1.379458, 3.611037, 0, 0.8901961, 1, 1,
0.02316276, 0.342936, 0.3687543, 0, 0.8862745, 1, 1,
0.02395438, 1.833849, 0.2376449, 0, 0.8784314, 1, 1,
0.02684226, 1.202489, 2.519402, 0, 0.8745098, 1, 1,
0.02888267, 1.636198, -0.5117885, 0, 0.8666667, 1, 1,
0.03065702, -1.475348, 2.13168, 0, 0.8627451, 1, 1,
0.03237735, -1.291652, 3.004234, 0, 0.854902, 1, 1,
0.03306754, -0.5540073, 3.528821, 0, 0.8509804, 1, 1,
0.033577, -1.135435, 2.851013, 0, 0.8431373, 1, 1,
0.03567446, 0.1051659, 1.630736, 0, 0.8392157, 1, 1,
0.04253756, -0.7372152, 4.31572, 0, 0.8313726, 1, 1,
0.04817156, 0.7146791, -0.2647417, 0, 0.827451, 1, 1,
0.04997142, 0.7146827, -0.7775803, 0, 0.8196079, 1, 1,
0.05586644, 1.144431, 0.7917504, 0, 0.8156863, 1, 1,
0.05772396, -1.311915, 2.068799, 0, 0.8078431, 1, 1,
0.05864583, -0.4459375, 3.893947, 0, 0.8039216, 1, 1,
0.06224664, -0.69929, 3.897387, 0, 0.7960784, 1, 1,
0.06260482, 2.27503, 0.8365435, 0, 0.7882353, 1, 1,
0.06412315, -1.54506, 3.294207, 0, 0.7843137, 1, 1,
0.06858324, -1.161593, 4.064128, 0, 0.7764706, 1, 1,
0.06888052, -0.7071645, 3.97128, 0, 0.772549, 1, 1,
0.07580604, 0.2511031, 1.61593, 0, 0.7647059, 1, 1,
0.07771911, -1.239667, 3.892403, 0, 0.7607843, 1, 1,
0.08388425, -1.755208, 1.680731, 0, 0.7529412, 1, 1,
0.08758267, 0.9620188, 0.2382588, 0, 0.7490196, 1, 1,
0.08869319, -2.182809, 4.211829, 0, 0.7411765, 1, 1,
0.08930001, 0.6597683, -0.1952828, 0, 0.7372549, 1, 1,
0.09090141, -0.670891, 2.682138, 0, 0.7294118, 1, 1,
0.09331947, -0.05450515, 2.086023, 0, 0.7254902, 1, 1,
0.09647789, 1.230057, -0.7581004, 0, 0.7176471, 1, 1,
0.0990822, -0.06797407, 0.3940382, 0, 0.7137255, 1, 1,
0.1022287, -0.4343534, 4.205464, 0, 0.7058824, 1, 1,
0.1031529, -1.852558, 2.566363, 0, 0.6980392, 1, 1,
0.1048616, 1.247938, 0.4776425, 0, 0.6941177, 1, 1,
0.1069442, 0.4144409, 2.351654, 0, 0.6862745, 1, 1,
0.1073859, -0.7535037, 3.603644, 0, 0.682353, 1, 1,
0.1150934, 0.07725984, 0.8313898, 0, 0.6745098, 1, 1,
0.1158073, -0.5550255, 4.115145, 0, 0.6705883, 1, 1,
0.1189155, -0.9737234, 3.453585, 0, 0.6627451, 1, 1,
0.1227984, -1.544538, 1.981099, 0, 0.6588235, 1, 1,
0.1264355, -1.924012, 3.849994, 0, 0.6509804, 1, 1,
0.1264491, -0.2274175, 1.770749, 0, 0.6470588, 1, 1,
0.1270245, 0.3230734, -0.7235029, 0, 0.6392157, 1, 1,
0.1325089, 0.1821375, 1.891442, 0, 0.6352941, 1, 1,
0.1328866, -0.5794401, 3.539191, 0, 0.627451, 1, 1,
0.1365297, -1.035876, 0.9518758, 0, 0.6235294, 1, 1,
0.1385544, 0.7225861, 1.045945, 0, 0.6156863, 1, 1,
0.1401961, -1.62353, 2.780198, 0, 0.6117647, 1, 1,
0.140979, -0.5750483, 1.853116, 0, 0.6039216, 1, 1,
0.1428209, -0.8347812, 1.692789, 0, 0.5960785, 1, 1,
0.143062, 0.6369641, 1.747299, 0, 0.5921569, 1, 1,
0.1458988, 2.287824, 1.404958, 0, 0.5843138, 1, 1,
0.146973, -0.1981723, 2.375511, 0, 0.5803922, 1, 1,
0.1497788, 1.745492, -0.7955175, 0, 0.572549, 1, 1,
0.150635, -0.040087, 0.927112, 0, 0.5686275, 1, 1,
0.1517806, 0.4343935, -0.5815173, 0, 0.5607843, 1, 1,
0.1519947, -1.258422, 3.41826, 0, 0.5568628, 1, 1,
0.1584994, -1.206122, 2.995234, 0, 0.5490196, 1, 1,
0.166696, 1.212196, -0.4246616, 0, 0.5450981, 1, 1,
0.1715877, 1.609654, 0.9889959, 0, 0.5372549, 1, 1,
0.1727275, 0.3322018, 0.048653, 0, 0.5333334, 1, 1,
0.174512, -1.060171, 3.339896, 0, 0.5254902, 1, 1,
0.1753969, 0.1126829, 0.07998624, 0, 0.5215687, 1, 1,
0.1771936, 1.448411, -0.7813993, 0, 0.5137255, 1, 1,
0.1815643, 0.6913494, -0.2723759, 0, 0.509804, 1, 1,
0.1846767, 1.036794, -0.377383, 0, 0.5019608, 1, 1,
0.1883995, -1.327153, 3.379639, 0, 0.4941176, 1, 1,
0.1953013, -0.195061, 1.138363, 0, 0.4901961, 1, 1,
0.1963146, -0.1061596, 1.600693, 0, 0.4823529, 1, 1,
0.2030914, 0.2088191, -1.209605, 0, 0.4784314, 1, 1,
0.2031591, 1.447113, 0.1058304, 0, 0.4705882, 1, 1,
0.2037261, 0.6167404, -0.6959979, 0, 0.4666667, 1, 1,
0.2060401, 0.03106797, 1.153479, 0, 0.4588235, 1, 1,
0.206295, -0.8335686, 1.029065, 0, 0.454902, 1, 1,
0.2066269, 0.983614, -2.410697, 0, 0.4470588, 1, 1,
0.2088164, 0.9608388, -0.5937719, 0, 0.4431373, 1, 1,
0.2108355, -0.1739272, 2.133773, 0, 0.4352941, 1, 1,
0.2133614, -1.072321, 2.326091, 0, 0.4313726, 1, 1,
0.2144907, -0.4896542, 3.408221, 0, 0.4235294, 1, 1,
0.2147178, 0.06118324, 1.686773, 0, 0.4196078, 1, 1,
0.2185982, -1.067468, 2.275562, 0, 0.4117647, 1, 1,
0.2210052, 1.16639, 0.3381464, 0, 0.4078431, 1, 1,
0.2330332, 0.8234127, 0.5864361, 0, 0.4, 1, 1,
0.2364444, -0.728882, 4.212866, 0, 0.3921569, 1, 1,
0.2394608, -1.503914, 1.958682, 0, 0.3882353, 1, 1,
0.2414104, -0.7854797, 2.786332, 0, 0.3803922, 1, 1,
0.2416799, -1.035174, 3.660934, 0, 0.3764706, 1, 1,
0.2429812, 1.673128, 0.3396514, 0, 0.3686275, 1, 1,
0.2436235, -1.247371, 2.301667, 0, 0.3647059, 1, 1,
0.2501854, 0.3071434, -0.619606, 0, 0.3568628, 1, 1,
0.2550351, -0.1525612, 1.80249, 0, 0.3529412, 1, 1,
0.2559107, 0.5693821, 2.038724, 0, 0.345098, 1, 1,
0.2566674, -1.312268, 2.127475, 0, 0.3411765, 1, 1,
0.2570348, 0.9978817, 1.415941, 0, 0.3333333, 1, 1,
0.2613325, -0.1888573, 2.593417, 0, 0.3294118, 1, 1,
0.2626409, 0.7790422, -0.626982, 0, 0.3215686, 1, 1,
0.2663091, 0.1000686, 0.6342174, 0, 0.3176471, 1, 1,
0.2663473, 0.5089425, 0.9948308, 0, 0.3098039, 1, 1,
0.266701, -0.004323322, 2.260914, 0, 0.3058824, 1, 1,
0.2671821, -0.1554131, 3.854602, 0, 0.2980392, 1, 1,
0.2673169, -0.6481215, 3.090233, 0, 0.2901961, 1, 1,
0.268471, 0.4634221, 0.8347979, 0, 0.2862745, 1, 1,
0.2706595, -0.8471213, 2.67198, 0, 0.2784314, 1, 1,
0.2757415, 0.7641446, 2.071733, 0, 0.2745098, 1, 1,
0.2758119, -0.6800184, 2.187149, 0, 0.2666667, 1, 1,
0.2760708, 0.04333692, 2.338774, 0, 0.2627451, 1, 1,
0.2795525, -0.8985423, 2.083833, 0, 0.254902, 1, 1,
0.2846915, -1.390232, 3.801621, 0, 0.2509804, 1, 1,
0.2855799, 0.3840187, -0.251963, 0, 0.2431373, 1, 1,
0.2902973, 0.1981942, 0.5920916, 0, 0.2392157, 1, 1,
0.2963757, -1.667567, 0.8045706, 0, 0.2313726, 1, 1,
0.3005138, -0.20882, 0.2221727, 0, 0.227451, 1, 1,
0.3025323, 0.9087155, -0.8727665, 0, 0.2196078, 1, 1,
0.3080114, -0.6717894, 2.256817, 0, 0.2156863, 1, 1,
0.3158829, -0.6395901, 1.961467, 0, 0.2078431, 1, 1,
0.3179996, 0.2146521, 1.214809, 0, 0.2039216, 1, 1,
0.3235987, 0.8748742, -0.2396771, 0, 0.1960784, 1, 1,
0.3379788, 0.4392293, 1.003164, 0, 0.1882353, 1, 1,
0.3391192, -1.35582, 2.674423, 0, 0.1843137, 1, 1,
0.3398089, 0.1762057, 3.102328, 0, 0.1764706, 1, 1,
0.3455032, -0.3115974, 3.226608, 0, 0.172549, 1, 1,
0.3477775, -0.004611152, 2.151639, 0, 0.1647059, 1, 1,
0.3507253, 1.787364, -0.07049399, 0, 0.1607843, 1, 1,
0.3507787, 1.513174, 1.3917, 0, 0.1529412, 1, 1,
0.3518728, -0.8584827, 4.878157, 0, 0.1490196, 1, 1,
0.3537292, 0.1157691, 3.244381, 0, 0.1411765, 1, 1,
0.3576461, -0.4051405, 2.161831, 0, 0.1372549, 1, 1,
0.3692541, 1.209626, -0.5889685, 0, 0.1294118, 1, 1,
0.3708582, -2.074357, 2.767548, 0, 0.1254902, 1, 1,
0.3710436, -0.7122834, 3.428037, 0, 0.1176471, 1, 1,
0.3739353, -0.6225443, 4.015353, 0, 0.1137255, 1, 1,
0.3776545, 0.4182034, 1.165695, 0, 0.1058824, 1, 1,
0.3785959, 0.2484894, 0.9374599, 0, 0.09803922, 1, 1,
0.3814129, -0.1692537, 2.131011, 0, 0.09411765, 1, 1,
0.3821084, -0.3039935, 3.108056, 0, 0.08627451, 1, 1,
0.3830577, -1.303631, 3.311377, 0, 0.08235294, 1, 1,
0.3886306, -1.514156, 2.876496, 0, 0.07450981, 1, 1,
0.389127, 0.7741286, -1.508434, 0, 0.07058824, 1, 1,
0.3941312, -1.127433, 1.820572, 0, 0.0627451, 1, 1,
0.3978416, -2.199649, 1.699156, 0, 0.05882353, 1, 1,
0.4015086, 1.244776, 0.2529166, 0, 0.05098039, 1, 1,
0.4084202, -2.504905, 4.217031, 0, 0.04705882, 1, 1,
0.4180292, 0.5162086, 1.458179, 0, 0.03921569, 1, 1,
0.4187477, 0.4548711, 0.7883247, 0, 0.03529412, 1, 1,
0.418783, 0.9522607, -0.6530212, 0, 0.02745098, 1, 1,
0.4198993, -2.035909, 2.26137, 0, 0.02352941, 1, 1,
0.4225292, 2.109392, -0.2878517, 0, 0.01568628, 1, 1,
0.4266434, 0.7317492, 0.2908868, 0, 0.01176471, 1, 1,
0.4277471, -0.117154, 1.634313, 0, 0.003921569, 1, 1,
0.427752, 0.8181577, 0.9231929, 0.003921569, 0, 1, 1,
0.4332059, -0.6659447, 2.439014, 0.007843138, 0, 1, 1,
0.4362038, -0.9171285, 2.899033, 0.01568628, 0, 1, 1,
0.4397118, 1.916801, 0.922362, 0.01960784, 0, 1, 1,
0.4410645, 0.396989, 0.09958992, 0.02745098, 0, 1, 1,
0.4425436, -0.4951771, 4.525338, 0.03137255, 0, 1, 1,
0.4495122, -1.136648, 2.041598, 0.03921569, 0, 1, 1,
0.4534151, 0.109421, 3.018531, 0.04313726, 0, 1, 1,
0.4543504, -0.4914522, 3.045782, 0.05098039, 0, 1, 1,
0.4554815, 0.5569783, 0.9262968, 0.05490196, 0, 1, 1,
0.4564963, -0.3892945, 3.165125, 0.0627451, 0, 1, 1,
0.461845, 0.7955555, 0.1424101, 0.06666667, 0, 1, 1,
0.4637907, -0.1296375, 2.071079, 0.07450981, 0, 1, 1,
0.4647829, 0.5618213, 0.2404986, 0.07843138, 0, 1, 1,
0.4659033, -2.500109, 4.03049, 0.08627451, 0, 1, 1,
0.468043, -1.455144, 1.118641, 0.09019608, 0, 1, 1,
0.470234, -0.7285622, 2.416145, 0.09803922, 0, 1, 1,
0.4720139, 1.971369, -1.176583, 0.1058824, 0, 1, 1,
0.4721701, 0.1016339, -0.1524041, 0.1098039, 0, 1, 1,
0.4827708, -1.53615, 4.533775, 0.1176471, 0, 1, 1,
0.4829365, 0.6554148, -0.8078347, 0.1215686, 0, 1, 1,
0.4832443, 1.494683, 1.244564, 0.1294118, 0, 1, 1,
0.485204, 0.2532401, 0.2547466, 0.1333333, 0, 1, 1,
0.4866646, -0.8822033, 2.691761, 0.1411765, 0, 1, 1,
0.4900034, 0.03987714, 1.538131, 0.145098, 0, 1, 1,
0.4943808, -0.421961, 2.262522, 0.1529412, 0, 1, 1,
0.5061274, -0.5057172, 1.540345, 0.1568628, 0, 1, 1,
0.5077707, -0.6153265, 3.679391, 0.1647059, 0, 1, 1,
0.509365, -1.441233, 2.401702, 0.1686275, 0, 1, 1,
0.5104687, 0.3132597, 1.610989, 0.1764706, 0, 1, 1,
0.5115638, -2.722576, 0.9190848, 0.1803922, 0, 1, 1,
0.5126415, 0.7019225, 1.232639, 0.1882353, 0, 1, 1,
0.5204668, -1.149196, 1.841137, 0.1921569, 0, 1, 1,
0.5209031, 1.010025, -0.575724, 0.2, 0, 1, 1,
0.5211775, -0.008064438, 2.430226, 0.2078431, 0, 1, 1,
0.5226768, 1.586884, -0.3085557, 0.2117647, 0, 1, 1,
0.5228181, 1.142321, -1.3268, 0.2196078, 0, 1, 1,
0.5259837, 0.5902508, 1.006023, 0.2235294, 0, 1, 1,
0.5269266, 0.4350272, 0.1944129, 0.2313726, 0, 1, 1,
0.5309227, -0.7708347, 3.059158, 0.2352941, 0, 1, 1,
0.5355895, 0.3568138, 0.9794683, 0.2431373, 0, 1, 1,
0.541159, -0.6550941, -0.1863486, 0.2470588, 0, 1, 1,
0.5462641, -0.9124115, 0.7029322, 0.254902, 0, 1, 1,
0.5486965, -0.8733137, 3.266364, 0.2588235, 0, 1, 1,
0.5582765, -0.5166721, 1.953628, 0.2666667, 0, 1, 1,
0.5583822, -0.4410751, 3.00931, 0.2705882, 0, 1, 1,
0.5605399, 0.1774331, 0.6178524, 0.2784314, 0, 1, 1,
0.563293, -1.442589, 3.552431, 0.282353, 0, 1, 1,
0.5696201, 0.4813992, -0.2411066, 0.2901961, 0, 1, 1,
0.5696747, -0.07301555, 0.5517271, 0.2941177, 0, 1, 1,
0.5820675, 0.5965623, 0.8846501, 0.3019608, 0, 1, 1,
0.5828549, 0.5427536, 0.9595749, 0.3098039, 0, 1, 1,
0.582865, -0.1327016, 1.298122, 0.3137255, 0, 1, 1,
0.5847587, -1.043464, 3.012232, 0.3215686, 0, 1, 1,
0.5877251, -1.862878, 3.473223, 0.3254902, 0, 1, 1,
0.5895196, -1.745498, 3.25105, 0.3333333, 0, 1, 1,
0.5898887, -1.935813, 1.985653, 0.3372549, 0, 1, 1,
0.590931, -0.09408052, 1.739529, 0.345098, 0, 1, 1,
0.5931372, 0.01432183, 0.2273097, 0.3490196, 0, 1, 1,
0.6009325, 1.108367, 1.071625, 0.3568628, 0, 1, 1,
0.6024086, 0.4549137, 0.00294603, 0.3607843, 0, 1, 1,
0.6045268, 0.5914006, 2.578025, 0.3686275, 0, 1, 1,
0.6136981, 0.001160304, 1.476687, 0.372549, 0, 1, 1,
0.6193515, 0.05554174, 2.350585, 0.3803922, 0, 1, 1,
0.6198712, -0.007250756, 2.2956, 0.3843137, 0, 1, 1,
0.6295037, 0.4609826, -1.033873, 0.3921569, 0, 1, 1,
0.6311201, 0.23696, -0.06877335, 0.3960784, 0, 1, 1,
0.6318051, -0.3946866, 2.702178, 0.4039216, 0, 1, 1,
0.6345258, -0.8187671, 1.952999, 0.4117647, 0, 1, 1,
0.6400225, -1.289032, 0.7643737, 0.4156863, 0, 1, 1,
0.6411895, -0.8356744, 2.131664, 0.4235294, 0, 1, 1,
0.6413179, 0.2020002, 0.8908862, 0.427451, 0, 1, 1,
0.6519246, -1.066411, 1.602919, 0.4352941, 0, 1, 1,
0.6524348, 0.2679095, 0.7949526, 0.4392157, 0, 1, 1,
0.6539786, -0.317009, 2.797193, 0.4470588, 0, 1, 1,
0.6568522, -1.030816, 4.408841, 0.4509804, 0, 1, 1,
0.6570947, 1.546347, 0.08045463, 0.4588235, 0, 1, 1,
0.6573411, 0.3147737, 1.232165, 0.4627451, 0, 1, 1,
0.6636913, 0.7126487, 1.571528, 0.4705882, 0, 1, 1,
0.6749714, 0.8705062, 0.7947505, 0.4745098, 0, 1, 1,
0.6751968, 2.744182, 1.142121, 0.4823529, 0, 1, 1,
0.6754705, 0.9049849, 1.686615, 0.4862745, 0, 1, 1,
0.6831723, -1.053653, 2.661456, 0.4941176, 0, 1, 1,
0.6900469, 0.006439993, 1.57318, 0.5019608, 0, 1, 1,
0.6919592, 0.4222335, 0.6777273, 0.5058824, 0, 1, 1,
0.6919712, -1.679046, 1.581875, 0.5137255, 0, 1, 1,
0.6958504, -0.0802291, 0.6575747, 0.5176471, 0, 1, 1,
0.6964102, -0.4391588, 3.089071, 0.5254902, 0, 1, 1,
0.698298, 1.49611, 0.9010017, 0.5294118, 0, 1, 1,
0.699598, -0.06204772, 3.706117, 0.5372549, 0, 1, 1,
0.7017249, -0.1848268, -0.06910935, 0.5411765, 0, 1, 1,
0.7030157, 1.255214, -0.08128314, 0.5490196, 0, 1, 1,
0.7036925, -0.06548341, 0.4262047, 0.5529412, 0, 1, 1,
0.7061624, -1.320752, 4.522314, 0.5607843, 0, 1, 1,
0.7068574, -0.5405837, 2.249038, 0.5647059, 0, 1, 1,
0.7097686, -0.8397098, 2.352278, 0.572549, 0, 1, 1,
0.7101906, 1.480853, 1.212591, 0.5764706, 0, 1, 1,
0.7116078, 2.574735, -0.2234461, 0.5843138, 0, 1, 1,
0.7136542, -0.4827228, 3.470296, 0.5882353, 0, 1, 1,
0.7171717, -0.08005781, 2.511819, 0.5960785, 0, 1, 1,
0.7183567, -0.2318684, 3.350485, 0.6039216, 0, 1, 1,
0.7283503, 0.2107305, 1.294875, 0.6078432, 0, 1, 1,
0.7291269, 0.338205, 2.204711, 0.6156863, 0, 1, 1,
0.7306166, 0.6525278, 0.6325461, 0.6196079, 0, 1, 1,
0.7369601, 0.2944264, 0.6576315, 0.627451, 0, 1, 1,
0.7371049, 0.5750228, 0.8693005, 0.6313726, 0, 1, 1,
0.7373313, 0.09870835, 1.750798, 0.6392157, 0, 1, 1,
0.7433792, 0.4470773, 0.06664953, 0.6431373, 0, 1, 1,
0.7436436, -0.1020098, 1.826734, 0.6509804, 0, 1, 1,
0.7535406, 0.283853, 1.880799, 0.654902, 0, 1, 1,
0.7547224, -0.9218173, 3.838144, 0.6627451, 0, 1, 1,
0.7578027, 1.144246, -0.2275261, 0.6666667, 0, 1, 1,
0.7679877, 0.4679838, 1.31049, 0.6745098, 0, 1, 1,
0.7681332, -0.7355446, 4.186261, 0.6784314, 0, 1, 1,
0.7694551, 0.4000234, 0.2901886, 0.6862745, 0, 1, 1,
0.770991, -1.19605, 2.742361, 0.6901961, 0, 1, 1,
0.7714545, -1.482651, 1.974548, 0.6980392, 0, 1, 1,
0.7733828, -0.3822651, 2.648299, 0.7058824, 0, 1, 1,
0.7836561, -0.06774774, 1.323132, 0.7098039, 0, 1, 1,
0.7848542, 1.369584, -0.8433462, 0.7176471, 0, 1, 1,
0.7849492, -0.6633169, 2.837106, 0.7215686, 0, 1, 1,
0.7858345, 0.5543873, -0.5376714, 0.7294118, 0, 1, 1,
0.7937114, -0.8311564, 3.363748, 0.7333333, 0, 1, 1,
0.79573, 2.409909, 0.2162879, 0.7411765, 0, 1, 1,
0.7991613, -0.2367741, 2.011437, 0.7450981, 0, 1, 1,
0.7995628, -1.496078, 2.64656, 0.7529412, 0, 1, 1,
0.8072092, -1.01247, 1.820145, 0.7568628, 0, 1, 1,
0.8111136, 1.278538, 2.837446, 0.7647059, 0, 1, 1,
0.8136858, -1.245927, 2.421978, 0.7686275, 0, 1, 1,
0.8202436, 0.6429726, 0.7486028, 0.7764706, 0, 1, 1,
0.8457298, -0.6780211, 1.91544, 0.7803922, 0, 1, 1,
0.8462545, 0.3089073, -0.1920386, 0.7882353, 0, 1, 1,
0.8519523, -0.2670295, 2.15015, 0.7921569, 0, 1, 1,
0.8532955, 0.3905126, -1.523747, 0.8, 0, 1, 1,
0.8583195, 2.095549, -0.6586682, 0.8078431, 0, 1, 1,
0.8673829, -0.6255067, 2.537062, 0.8117647, 0, 1, 1,
0.8754928, 0.7527223, -0.06478636, 0.8196079, 0, 1, 1,
0.8756387, -0.01749376, 1.295737, 0.8235294, 0, 1, 1,
0.8762997, 0.4646744, 2.647749, 0.8313726, 0, 1, 1,
0.8798178, 2.732618, -0.4213942, 0.8352941, 0, 1, 1,
0.8800408, 1.134458, 0.03386464, 0.8431373, 0, 1, 1,
0.8820267, 0.9633173, 1.044954, 0.8470588, 0, 1, 1,
0.8855971, -1.684651, 2.008299, 0.854902, 0, 1, 1,
0.8875259, -1.203695, 2.834998, 0.8588235, 0, 1, 1,
0.8901312, -0.4261844, 0.5507522, 0.8666667, 0, 1, 1,
0.8967734, -1.304206, 4.438565, 0.8705882, 0, 1, 1,
0.8973402, -0.440177, 1.695216, 0.8784314, 0, 1, 1,
0.8982838, -1.135161, 3.597416, 0.8823529, 0, 1, 1,
0.900157, 0.8521677, 3.232009, 0.8901961, 0, 1, 1,
0.9044614, 0.4050451, 0.7105684, 0.8941177, 0, 1, 1,
0.9072092, 0.3602673, 0.580219, 0.9019608, 0, 1, 1,
0.9076443, -0.1857593, 2.085054, 0.9098039, 0, 1, 1,
0.9112235, 1.763623, 1.501177, 0.9137255, 0, 1, 1,
0.9146498, 0.5994869, 0.5828738, 0.9215686, 0, 1, 1,
0.9186672, -1.170686, 2.035882, 0.9254902, 0, 1, 1,
0.9196217, -0.05819476, 1.87761, 0.9333333, 0, 1, 1,
0.9241692, 0.1543558, 1.088308, 0.9372549, 0, 1, 1,
0.9279721, 0.6146003, 1.056373, 0.945098, 0, 1, 1,
0.9337727, 1.447162, -0.2093574, 0.9490196, 0, 1, 1,
0.9357476, -1.24981, 3.125492, 0.9568627, 0, 1, 1,
0.9411697, 0.2281398, 1.006126, 0.9607843, 0, 1, 1,
0.943011, 0.3363133, 0.7865925, 0.9686275, 0, 1, 1,
0.9454616, -2.019753, 2.624743, 0.972549, 0, 1, 1,
0.9487331, -0.6684113, 2.147172, 0.9803922, 0, 1, 1,
0.9506029, 1.483452, 0.9185991, 0.9843137, 0, 1, 1,
0.9565592, 0.03143714, 2.826773, 0.9921569, 0, 1, 1,
0.9649122, -1.012622, 2.485605, 0.9960784, 0, 1, 1,
0.9712573, -0.7864857, 1.80473, 1, 0, 0.9960784, 1,
0.9735225, 0.3414611, 1.298214, 1, 0, 0.9882353, 1,
0.9933839, -1.228096, 0.8357319, 1, 0, 0.9843137, 1,
0.993752, -0.5313376, 1.377358, 1, 0, 0.9764706, 1,
0.9965054, -2.10921, 2.938322, 1, 0, 0.972549, 1,
1.003796, -0.4244174, 1.134227, 1, 0, 0.9647059, 1,
1.014993, 0.9823385, 0.7353227, 1, 0, 0.9607843, 1,
1.019104, -1.619954, 2.772173, 1, 0, 0.9529412, 1,
1.021686, 0.007580783, 1.143774, 1, 0, 0.9490196, 1,
1.031265, 1.209098, 2.180779, 1, 0, 0.9411765, 1,
1.039201, 0.4557798, 1.522902, 1, 0, 0.9372549, 1,
1.046758, -0.7757927, 1.922292, 1, 0, 0.9294118, 1,
1.053356, 0.4708672, 1.427215, 1, 0, 0.9254902, 1,
1.053367, 1.426963, 1.570104, 1, 0, 0.9176471, 1,
1.054021, -0.967146, 3.31407, 1, 0, 0.9137255, 1,
1.061126, -1.878883, 3.120498, 1, 0, 0.9058824, 1,
1.06377, -0.8688599, 0.3765166, 1, 0, 0.9019608, 1,
1.065999, 1.450631, 2.084564, 1, 0, 0.8941177, 1,
1.071769, -0.1817951, 0.6874167, 1, 0, 0.8862745, 1,
1.074588, 1.476564, 0.4403062, 1, 0, 0.8823529, 1,
1.077365, 2.374075, 1.476312, 1, 0, 0.8745098, 1,
1.083023, -1.196528, 1.530088, 1, 0, 0.8705882, 1,
1.085638, 1.695707, -0.8741487, 1, 0, 0.8627451, 1,
1.087615, -0.7789118, 1.796228, 1, 0, 0.8588235, 1,
1.091233, -0.2358586, 1.462009, 1, 0, 0.8509804, 1,
1.10245, -0.1859304, 1.241417, 1, 0, 0.8470588, 1,
1.110408, 0.5240927, 0.4954168, 1, 0, 0.8392157, 1,
1.11074, -1.679271, 3.616883, 1, 0, 0.8352941, 1,
1.117285, 1.32037, 0.9725206, 1, 0, 0.827451, 1,
1.118055, 0.493257, 1.70663, 1, 0, 0.8235294, 1,
1.119037, -0.01907112, 2.412221, 1, 0, 0.8156863, 1,
1.121161, 0.9359189, 0.7771581, 1, 0, 0.8117647, 1,
1.125084, 0.2513601, 1.050133, 1, 0, 0.8039216, 1,
1.129394, -0.5937424, 2.908562, 1, 0, 0.7960784, 1,
1.129909, 1.241027, -0.09238489, 1, 0, 0.7921569, 1,
1.130553, 1.032477, 0.9411485, 1, 0, 0.7843137, 1,
1.142009, -0.7356675, 1.847918, 1, 0, 0.7803922, 1,
1.142165, 0.02565898, 0.4188524, 1, 0, 0.772549, 1,
1.142632, 0.6764451, 2.061924, 1, 0, 0.7686275, 1,
1.148448, -0.2012534, 1.318378, 1, 0, 0.7607843, 1,
1.148829, -1.723872, 2.744372, 1, 0, 0.7568628, 1,
1.148882, -0.01881928, 2.186276, 1, 0, 0.7490196, 1,
1.148993, -0.1095487, 1.652515, 1, 0, 0.7450981, 1,
1.149853, -1.308103, 1.168924, 1, 0, 0.7372549, 1,
1.151433, -0.6392483, 1.300023, 1, 0, 0.7333333, 1,
1.152685, 0.4559057, 2.16889, 1, 0, 0.7254902, 1,
1.154102, 1.371839, -1.528817, 1, 0, 0.7215686, 1,
1.154356, -1.568734, 2.323101, 1, 0, 0.7137255, 1,
1.164081, -1.367489, 2.223424, 1, 0, 0.7098039, 1,
1.168032, -0.963517, 1.457816, 1, 0, 0.7019608, 1,
1.168127, -1.534352, 1.443185, 1, 0, 0.6941177, 1,
1.18686, -1.11899, 2.834929, 1, 0, 0.6901961, 1,
1.19041, -0.9632635, 3.015308, 1, 0, 0.682353, 1,
1.19706, -0.3048514, 0.6052642, 1, 0, 0.6784314, 1,
1.198944, -0.3642117, 0.9101516, 1, 0, 0.6705883, 1,
1.202581, 0.8598944, 0.3473145, 1, 0, 0.6666667, 1,
1.203469, -0.6922225, 3.580838, 1, 0, 0.6588235, 1,
1.222372, -0.1108262, 3.442168, 1, 0, 0.654902, 1,
1.229827, -0.8574074, 2.461233, 1, 0, 0.6470588, 1,
1.238508, -2.375986, 2.292406, 1, 0, 0.6431373, 1,
1.241322, 0.6916201, 1.157404, 1, 0, 0.6352941, 1,
1.247955, -1.469655, 1.935449, 1, 0, 0.6313726, 1,
1.252655, -0.921316, 2.427966, 1, 0, 0.6235294, 1,
1.256084, -0.5329627, 2.827011, 1, 0, 0.6196079, 1,
1.259949, 0.1565429, 0.2604582, 1, 0, 0.6117647, 1,
1.263132, -1.201434, 1.798751, 1, 0, 0.6078432, 1,
1.278192, -1.269649, 0.6841745, 1, 0, 0.6, 1,
1.283153, 2.045767, -0.2748195, 1, 0, 0.5921569, 1,
1.290118, 0.8258752, -0.1278903, 1, 0, 0.5882353, 1,
1.301344, 0.09887245, 1.650637, 1, 0, 0.5803922, 1,
1.313472, -1.292156, 2.854368, 1, 0, 0.5764706, 1,
1.315453, -0.7282462, 1.638211, 1, 0, 0.5686275, 1,
1.318619, -0.6571212, 1.90224, 1, 0, 0.5647059, 1,
1.32112, 0.09352243, 1.029342, 1, 0, 0.5568628, 1,
1.321736, -0.9288126, 3.000814, 1, 0, 0.5529412, 1,
1.328647, 2.401006, -0.776359, 1, 0, 0.5450981, 1,
1.331653, -0.9747137, 2.667586, 1, 0, 0.5411765, 1,
1.334336, 0.2533001, -0.2439318, 1, 0, 0.5333334, 1,
1.339487, -0.7534406, 1.675798, 1, 0, 0.5294118, 1,
1.339614, -0.4709859, 4.201685, 1, 0, 0.5215687, 1,
1.368682, 1.455464, 0.3795992, 1, 0, 0.5176471, 1,
1.37101, 0.5543748, -0.1670816, 1, 0, 0.509804, 1,
1.373731, -0.5143836, 2.271172, 1, 0, 0.5058824, 1,
1.378886, 0.7270452, 0.2687891, 1, 0, 0.4980392, 1,
1.379795, 0.5333934, 0.03125959, 1, 0, 0.4901961, 1,
1.380208, 0.5135228, -1.028051, 1, 0, 0.4862745, 1,
1.387053, 1.100347, 2.085197, 1, 0, 0.4784314, 1,
1.388207, -0.8425073, 0.5028725, 1, 0, 0.4745098, 1,
1.397412, -0.1952982, -0.4501858, 1, 0, 0.4666667, 1,
1.408716, 0.5521033, -0.3100134, 1, 0, 0.4627451, 1,
1.410634, -0.1078114, 3.339018, 1, 0, 0.454902, 1,
1.411364, -0.3392979, 0.9412602, 1, 0, 0.4509804, 1,
1.419549, 0.2008429, 0.6484641, 1, 0, 0.4431373, 1,
1.436143, -1.086764, 2.925446, 1, 0, 0.4392157, 1,
1.467691, 0.2160958, 1.44249, 1, 0, 0.4313726, 1,
1.468827, 0.2368755, 1.323005, 1, 0, 0.427451, 1,
1.47346, -0.05831756, 2.705976, 1, 0, 0.4196078, 1,
1.480781, -1.47679, 3.888142, 1, 0, 0.4156863, 1,
1.497863, -0.8203657, 3.94943, 1, 0, 0.4078431, 1,
1.508621, 0.2094439, 0.1575946, 1, 0, 0.4039216, 1,
1.514011, 1.924382, 1.394576, 1, 0, 0.3960784, 1,
1.533317, -1.007779, 1.254853, 1, 0, 0.3882353, 1,
1.549146, 0.06980602, 1.450889, 1, 0, 0.3843137, 1,
1.553544, 0.6618327, 2.087462, 1, 0, 0.3764706, 1,
1.564083, -1.623399, 1.550421, 1, 0, 0.372549, 1,
1.576563, 0.9971325, 0.08034679, 1, 0, 0.3647059, 1,
1.589959, -0.5439281, 1.925319, 1, 0, 0.3607843, 1,
1.590249, 1.547751, 1.608181, 1, 0, 0.3529412, 1,
1.594487, 0.3957945, 2.819872, 1, 0, 0.3490196, 1,
1.596008, -0.988147, 2.452051, 1, 0, 0.3411765, 1,
1.602765, 0.2505553, 1.10845, 1, 0, 0.3372549, 1,
1.6163, -1.779071, 3.003294, 1, 0, 0.3294118, 1,
1.618541, -1.776062, 2.577126, 1, 0, 0.3254902, 1,
1.65507, 0.1880423, 2.910813, 1, 0, 0.3176471, 1,
1.661728, -1.261253, 1.83232, 1, 0, 0.3137255, 1,
1.662392, 1.795682, 1.18357, 1, 0, 0.3058824, 1,
1.666373, -0.4405779, 3.014237, 1, 0, 0.2980392, 1,
1.672739, -1.652656, -0.04618784, 1, 0, 0.2941177, 1,
1.694077, -1.593634, 2.592247, 1, 0, 0.2862745, 1,
1.758267, 0.1911172, 1.756614, 1, 0, 0.282353, 1,
1.762955, 0.9079178, -0.1987979, 1, 0, 0.2745098, 1,
1.784749, 0.7991953, 0.8173849, 1, 0, 0.2705882, 1,
1.790964, -0.9356645, 2.07795, 1, 0, 0.2627451, 1,
1.813835, 2.094529, 2.014823, 1, 0, 0.2588235, 1,
1.83305, 0.2902697, 0.670582, 1, 0, 0.2509804, 1,
1.833237, 1.36091, -0.1427928, 1, 0, 0.2470588, 1,
1.864572, -1.689286, 3.10579, 1, 0, 0.2392157, 1,
1.87117, -1.452256, 3.411462, 1, 0, 0.2352941, 1,
1.87249, -0.8068116, 0.461355, 1, 0, 0.227451, 1,
1.878888, 0.8112683, 3.670826, 1, 0, 0.2235294, 1,
1.88306, 1.144256, 0.2465267, 1, 0, 0.2156863, 1,
1.891131, 1.052199, 0.859826, 1, 0, 0.2117647, 1,
1.939875, -0.6902165, 3.822505, 1, 0, 0.2039216, 1,
1.942129, 0.1160057, 1.483767, 1, 0, 0.1960784, 1,
1.956908, -1.70964, 3.206336, 1, 0, 0.1921569, 1,
1.97632, 0.1385498, 0.4686783, 1, 0, 0.1843137, 1,
1.979991, 0.1573128, 2.49539, 1, 0, 0.1803922, 1,
1.995275, 1.051509, 1.921364, 1, 0, 0.172549, 1,
2.005564, 0.5054232, 3.286711, 1, 0, 0.1686275, 1,
2.014722, -1.807676, 2.258905, 1, 0, 0.1607843, 1,
2.015449, 0.04128319, 2.785333, 1, 0, 0.1568628, 1,
2.06876, 0.4004103, 2.577195, 1, 0, 0.1490196, 1,
2.100014, -0.0001781028, 0.9470261, 1, 0, 0.145098, 1,
2.124185, -0.7552167, 0.6111186, 1, 0, 0.1372549, 1,
2.157948, 0.1957881, 1.453556, 1, 0, 0.1333333, 1,
2.176768, 1.632399, 0.1672284, 1, 0, 0.1254902, 1,
2.182064, -1.654039, 0.5083181, 1, 0, 0.1215686, 1,
2.183003, 0.8537019, 0.4179996, 1, 0, 0.1137255, 1,
2.185783, -0.04851618, 0.541688, 1, 0, 0.1098039, 1,
2.226753, -0.5033072, 1.779262, 1, 0, 0.1019608, 1,
2.253479, 1.24895, 1.10865, 1, 0, 0.09411765, 1,
2.267276, -0.6972477, 3.961692, 1, 0, 0.09019608, 1,
2.28611, 1.317096, 0.1979876, 1, 0, 0.08235294, 1,
2.355796, -2.032341, 3.272447, 1, 0, 0.07843138, 1,
2.362581, -1.061711, 2.975916, 1, 0, 0.07058824, 1,
2.396075, -0.8723372, 1.185216, 1, 0, 0.06666667, 1,
2.421583, -0.7881777, 3.183548, 1, 0, 0.05882353, 1,
2.46244, 0.3667973, 1.425029, 1, 0, 0.05490196, 1,
2.470066, 0.2245331, 2.562974, 1, 0, 0.04705882, 1,
2.604598, 0.03614022, 1.405522, 1, 0, 0.04313726, 1,
2.632883, -0.4340703, 1.168107, 1, 0, 0.03529412, 1,
2.721642, 0.09028972, 0.6016437, 1, 0, 0.03137255, 1,
2.722674, 0.6383059, 0.00795066, 1, 0, 0.02352941, 1,
2.833526, 0.8265915, 2.249385, 1, 0, 0.01960784, 1,
2.905208, 1.066307, 1.187884, 1, 0, 0.01176471, 1,
3.276153, -0.2909633, 0.6579356, 1, 0, 0.007843138, 1
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
0.1394961, -3.649192, -7.939024, 0, -0.5, 0.5, 0.5,
0.1394961, -3.649192, -7.939024, 1, -0.5, 0.5, 0.5,
0.1394961, -3.649192, -7.939024, 1, 1.5, 0.5, 0.5,
0.1394961, -3.649192, -7.939024, 0, 1.5, 0.5, 0.5
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
-4.060488, 0.01080298, -7.939024, 0, -0.5, 0.5, 0.5,
-4.060488, 0.01080298, -7.939024, 1, -0.5, 0.5, 0.5,
-4.060488, 0.01080298, -7.939024, 1, 1.5, 0.5, 0.5,
-4.060488, 0.01080298, -7.939024, 0, 1.5, 0.5, 0.5
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
-4.060488, -3.649192, -0.6016128, 0, -0.5, 0.5, 0.5,
-4.060488, -3.649192, -0.6016128, 1, -0.5, 0.5, 0.5,
-4.060488, -3.649192, -0.6016128, 1, 1.5, 0.5, 0.5,
-4.060488, -3.649192, -0.6016128, 0, 1.5, 0.5, 0.5
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
-2, -2.804578, -6.245775,
3, -2.804578, -6.245775,
-2, -2.804578, -6.245775,
-2, -2.945347, -6.527984,
-1, -2.804578, -6.245775,
-1, -2.945347, -6.527984,
0, -2.804578, -6.245775,
0, -2.945347, -6.527984,
1, -2.804578, -6.245775,
1, -2.945347, -6.527984,
2, -2.804578, -6.245775,
2, -2.945347, -6.527984,
3, -2.804578, -6.245775,
3, -2.945347, -6.527984
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
-2, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
-2, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
-2, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
-2, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5,
-1, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
-1, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
-1, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
-1, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5,
0, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
0, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
0, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
0, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5,
1, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
1, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
1, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
1, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5,
2, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
2, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
2, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
2, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5,
3, -3.226885, -7.0924, 0, -0.5, 0.5, 0.5,
3, -3.226885, -7.0924, 1, -0.5, 0.5, 0.5,
3, -3.226885, -7.0924, 1, 1.5, 0.5, 0.5,
3, -3.226885, -7.0924, 0, 1.5, 0.5, 0.5
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
-3.091261, -2, -6.245775,
-3.091261, 2, -6.245775,
-3.091261, -2, -6.245775,
-3.252799, -2, -6.527984,
-3.091261, -1, -6.245775,
-3.252799, -1, -6.527984,
-3.091261, 0, -6.245775,
-3.252799, 0, -6.527984,
-3.091261, 1, -6.245775,
-3.252799, 1, -6.527984,
-3.091261, 2, -6.245775,
-3.252799, 2, -6.527984
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
-3.575874, -2, -7.0924, 0, -0.5, 0.5, 0.5,
-3.575874, -2, -7.0924, 1, -0.5, 0.5, 0.5,
-3.575874, -2, -7.0924, 1, 1.5, 0.5, 0.5,
-3.575874, -2, -7.0924, 0, 1.5, 0.5, 0.5,
-3.575874, -1, -7.0924, 0, -0.5, 0.5, 0.5,
-3.575874, -1, -7.0924, 1, -0.5, 0.5, 0.5,
-3.575874, -1, -7.0924, 1, 1.5, 0.5, 0.5,
-3.575874, -1, -7.0924, 0, 1.5, 0.5, 0.5,
-3.575874, 0, -7.0924, 0, -0.5, 0.5, 0.5,
-3.575874, 0, -7.0924, 1, -0.5, 0.5, 0.5,
-3.575874, 0, -7.0924, 1, 1.5, 0.5, 0.5,
-3.575874, 0, -7.0924, 0, 1.5, 0.5, 0.5,
-3.575874, 1, -7.0924, 0, -0.5, 0.5, 0.5,
-3.575874, 1, -7.0924, 1, -0.5, 0.5, 0.5,
-3.575874, 1, -7.0924, 1, 1.5, 0.5, 0.5,
-3.575874, 1, -7.0924, 0, 1.5, 0.5, 0.5,
-3.575874, 2, -7.0924, 0, -0.5, 0.5, 0.5,
-3.575874, 2, -7.0924, 1, -0.5, 0.5, 0.5,
-3.575874, 2, -7.0924, 1, 1.5, 0.5, 0.5,
-3.575874, 2, -7.0924, 0, 1.5, 0.5, 0.5
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
-3.091261, -2.804578, -6,
-3.091261, -2.804578, 4,
-3.091261, -2.804578, -6,
-3.252799, -2.945347, -6,
-3.091261, -2.804578, -4,
-3.252799, -2.945347, -4,
-3.091261, -2.804578, -2,
-3.252799, -2.945347, -2,
-3.091261, -2.804578, 0,
-3.252799, -2.945347, 0,
-3.091261, -2.804578, 2,
-3.252799, -2.945347, 2,
-3.091261, -2.804578, 4,
-3.252799, -2.945347, 4
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
"-6",
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
-3.575874, -3.226885, -6, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -6, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -6, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, -6, 0, 1.5, 0.5, 0.5,
-3.575874, -3.226885, -4, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -4, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -4, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, -4, 0, 1.5, 0.5, 0.5,
-3.575874, -3.226885, -2, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -2, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, -2, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, -2, 0, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 0, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 0, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 0, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 0, 0, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 2, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 2, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 2, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 2, 0, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 4, 0, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 4, 1, -0.5, 0.5, 0.5,
-3.575874, -3.226885, 4, 1, 1.5, 0.5, 0.5,
-3.575874, -3.226885, 4, 0, 1.5, 0.5, 0.5
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
-3.091261, -2.804578, -6.245775,
-3.091261, 2.826184, -6.245775,
-3.091261, -2.804578, 5.04255,
-3.091261, 2.826184, 5.04255,
-3.091261, -2.804578, -6.245775,
-3.091261, -2.804578, 5.04255,
-3.091261, 2.826184, -6.245775,
-3.091261, 2.826184, 5.04255,
-3.091261, -2.804578, -6.245775,
3.370253, -2.804578, -6.245775,
-3.091261, -2.804578, 5.04255,
3.370253, -2.804578, 5.04255,
-3.091261, 2.826184, -6.245775,
3.370253, 2.826184, -6.245775,
-3.091261, 2.826184, 5.04255,
3.370253, 2.826184, 5.04255,
3.370253, -2.804578, -6.245775,
3.370253, 2.826184, -6.245775,
3.370253, -2.804578, 5.04255,
3.370253, 2.826184, 5.04255,
3.370253, -2.804578, -6.245775,
3.370253, -2.804578, 5.04255,
3.370253, 2.826184, -6.245775,
3.370253, 2.826184, 5.04255
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
var radius = 7.568276;
var distance = 33.67211;
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
mvMatrix.translate( -0.1394961, -0.01080298, 0.6016128 );
mvMatrix.scale( 1.266417, 1.453261, 0.7249054 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.67211);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Antimony_Potassium_T<-read.table("Antimony_Potassium_T.xyz")
```

```
## Error in read.table("Antimony_Potassium_T.xyz"): no lines available in input
```

```r
x<-Antimony_Potassium_T$V2
```

```
## Error in eval(expr, envir, enclos): object 'Antimony_Potassium_T' not found
```

```r
y<-Antimony_Potassium_T$V3
```

```
## Error in eval(expr, envir, enclos): object 'Antimony_Potassium_T' not found
```

```r
z<-Antimony_Potassium_T$V4
```

```
## Error in eval(expr, envir, enclos): object 'Antimony_Potassium_T' not found
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
-2.997161, 0.2583916, -3.312338, 0, 0, 1, 1, 1,
-2.961255, 0.9433397, -0.7369208, 1, 0, 0, 1, 1,
-2.721773, 1.389953, -0.2419637, 1, 0, 0, 1, 1,
-2.687951, 0.452804, -2.177544, 1, 0, 0, 1, 1,
-2.579287, 0.2640948, -3.782381, 1, 0, 0, 1, 1,
-2.444774, 0.2793894, -0.5159458, 1, 0, 0, 1, 1,
-2.393138, 1.245478, -0.2952636, 0, 0, 0, 1, 1,
-2.195502, -1.350617, -3.226137, 0, 0, 0, 1, 1,
-2.119061, -0.6410818, -0.8852103, 0, 0, 0, 1, 1,
-2.09357, -0.8858404, -1.796644, 0, 0, 0, 1, 1,
-2.084229, 0.2235855, -1.316944, 0, 0, 0, 1, 1,
-2.079042, 0.6598705, 0.1227426, 0, 0, 0, 1, 1,
-2.077986, 0.5392507, -1.455189, 0, 0, 0, 1, 1,
-2.077886, -0.4292249, -1.34587, 1, 1, 1, 1, 1,
-2.074874, 0.4116396, -2.760156, 1, 1, 1, 1, 1,
-2.032154, 2.297903, -1.291263, 1, 1, 1, 1, 1,
-2.027541, -1.900358, -2.820392, 1, 1, 1, 1, 1,
-1.955021, -0.1717306, -0.8872633, 1, 1, 1, 1, 1,
-1.951989, 0.3854806, -2.352075, 1, 1, 1, 1, 1,
-1.948044, 0.05674081, -1.030315, 1, 1, 1, 1, 1,
-1.940921, 1.20111, -0.3690691, 1, 1, 1, 1, 1,
-1.938052, -0.5287389, -2.717859, 1, 1, 1, 1, 1,
-1.911983, 0.3959382, -1.179061, 1, 1, 1, 1, 1,
-1.865554, -0.005481714, -0.9656526, 1, 1, 1, 1, 1,
-1.830342, 0.5833124, -0.3071536, 1, 1, 1, 1, 1,
-1.828795, -0.2916449, -2.240787, 1, 1, 1, 1, 1,
-1.824013, -1.099463, -0.7895011, 1, 1, 1, 1, 1,
-1.815778, -0.5514056, -1.289668, 1, 1, 1, 1, 1,
-1.813673, 0.06808631, -1.914597, 0, 0, 1, 1, 1,
-1.809458, -0.4757921, -1.02084, 1, 0, 0, 1, 1,
-1.777897, 1.023843, -1.330772, 1, 0, 0, 1, 1,
-1.771608, 0.296736, -1.435112, 1, 0, 0, 1, 1,
-1.753605, -0.9318617, -3.758988, 1, 0, 0, 1, 1,
-1.733495, -0.1972122, -2.615993, 1, 0, 0, 1, 1,
-1.73341, -0.8098477, -0.5400951, 0, 0, 0, 1, 1,
-1.729878, 1.324214, 0.8673323, 0, 0, 0, 1, 1,
-1.722188, -0.6727943, -2.386089, 0, 0, 0, 1, 1,
-1.703494, 0.1574636, -1.665557, 0, 0, 0, 1, 1,
-1.700891, 0.06422178, -1.71237, 0, 0, 0, 1, 1,
-1.696811, -2.158719, -2.687026, 0, 0, 0, 1, 1,
-1.691522, 0.3661932, -1.495829, 0, 0, 0, 1, 1,
-1.676106, 1.588821, 2.126105, 1, 1, 1, 1, 1,
-1.674827, 0.1923108, -3.75078, 1, 1, 1, 1, 1,
-1.668007, -1.421985, -2.580965, 1, 1, 1, 1, 1,
-1.65227, 1.486757, -1.06541, 1, 1, 1, 1, 1,
-1.64752, -1.901247, -2.867516, 1, 1, 1, 1, 1,
-1.642224, 0.1942346, -2.18258, 1, 1, 1, 1, 1,
-1.620049, -0.7136619, -1.469204, 1, 1, 1, 1, 1,
-1.596595, 0.0857328, -1.585619, 1, 1, 1, 1, 1,
-1.59173, -0.8724822, -1.902874, 1, 1, 1, 1, 1,
-1.580562, 0.3679835, -1.480112, 1, 1, 1, 1, 1,
-1.574822, 0.151372, -1.063707, 1, 1, 1, 1, 1,
-1.566936, -0.4917014, -2.842399, 1, 1, 1, 1, 1,
-1.552068, 0.459896, -2.394423, 1, 1, 1, 1, 1,
-1.549968, -0.7456756, -1.294906, 1, 1, 1, 1, 1,
-1.548776, -0.3475338, -1.20027, 1, 1, 1, 1, 1,
-1.518924, 0.4532899, -2.754594, 0, 0, 1, 1, 1,
-1.518882, 0.8195064, -1.215255, 1, 0, 0, 1, 1,
-1.505595, 1.475838, 0.8038422, 1, 0, 0, 1, 1,
-1.497702, -0.4274586, -1.741423, 1, 0, 0, 1, 1,
-1.48064, -1.447648, 0.01768662, 1, 0, 0, 1, 1,
-1.462756, -0.3681677, -3.154898, 1, 0, 0, 1, 1,
-1.461192, 1.54141, -0.4373006, 0, 0, 0, 1, 1,
-1.460312, 0.2360962, -0.8339548, 0, 0, 0, 1, 1,
-1.455559, -0.5809253, -1.391971, 0, 0, 0, 1, 1,
-1.453413, -0.4189143, -0.7363729, 0, 0, 0, 1, 1,
-1.429808, 0.1695262, -0.340098, 0, 0, 0, 1, 1,
-1.425747, -1.822432, -2.05819, 0, 0, 0, 1, 1,
-1.424858, -0.6539273, -2.871345, 0, 0, 0, 1, 1,
-1.424099, -0.1291966, -1.999906, 1, 1, 1, 1, 1,
-1.420248, 0.8045552, 0.2477125, 1, 1, 1, 1, 1,
-1.417569, -0.6612853, -1.701444, 1, 1, 1, 1, 1,
-1.414993, -1.748117, -3.9643, 1, 1, 1, 1, 1,
-1.40546, 1.008019, 0.7385647, 1, 1, 1, 1, 1,
-1.384895, 0.9659119, -2.837703, 1, 1, 1, 1, 1,
-1.375728, 0.1117491, -1.843002, 1, 1, 1, 1, 1,
-1.374098, -1.138953, -1.259463, 1, 1, 1, 1, 1,
-1.370693, 1.185527, -2.408788, 1, 1, 1, 1, 1,
-1.368184, 0.1585013, -0.227605, 1, 1, 1, 1, 1,
-1.361503, -1.276033, -3.136947, 1, 1, 1, 1, 1,
-1.355931, -0.718822, -3.669389, 1, 1, 1, 1, 1,
-1.348746, -0.6610639, -1.775711, 1, 1, 1, 1, 1,
-1.345076, 1.939213, -0.7254605, 1, 1, 1, 1, 1,
-1.337901, 0.7031693, -0.192596, 1, 1, 1, 1, 1,
-1.337334, -0.4793432, -0.7909791, 0, 0, 1, 1, 1,
-1.332651, -0.4137331, -1.225214, 1, 0, 0, 1, 1,
-1.33054, -0.5195681, -1.804568, 1, 0, 0, 1, 1,
-1.320436, 0.4763263, -0.2610992, 1, 0, 0, 1, 1,
-1.316741, 0.03668046, -1.563018, 1, 0, 0, 1, 1,
-1.309477, 0.5332707, -2.24409, 1, 0, 0, 1, 1,
-1.306639, -0.9002979, -4.215423, 0, 0, 0, 1, 1,
-1.304921, 0.4328808, -1.739804, 0, 0, 0, 1, 1,
-1.301317, -1.864681, -4.124713, 0, 0, 0, 1, 1,
-1.29849, -1.73381, -0.4555101, 0, 0, 0, 1, 1,
-1.296445, -1.868666, -3.190238, 0, 0, 0, 1, 1,
-1.285176, -0.5790542, 0.04276964, 0, 0, 0, 1, 1,
-1.284025, 0.1060783, -1.120734, 0, 0, 0, 1, 1,
-1.28176, 1.058152, -3.267568, 1, 1, 1, 1, 1,
-1.278086, 0.6441088, -1.271645, 1, 1, 1, 1, 1,
-1.25591, -1.155115, -1.671218, 1, 1, 1, 1, 1,
-1.254938, -1.146457, -2.457344, 1, 1, 1, 1, 1,
-1.242412, -1.913326, -2.435223, 1, 1, 1, 1, 1,
-1.233526, 1.596202, -2.101865, 1, 1, 1, 1, 1,
-1.191019, -0.1437719, -1.034906, 1, 1, 1, 1, 1,
-1.188367, 0.7722656, -1.529856, 1, 1, 1, 1, 1,
-1.186827, -1.347796, -3.828891, 1, 1, 1, 1, 1,
-1.172977, 0.7020951, -1.619614, 1, 1, 1, 1, 1,
-1.168755, -1.721402, -3.368224, 1, 1, 1, 1, 1,
-1.16811, 0.2977469, -1.743137, 1, 1, 1, 1, 1,
-1.16666, 0.9953845, -0.5374545, 1, 1, 1, 1, 1,
-1.162871, 0.6679012, -0.7342532, 1, 1, 1, 1, 1,
-1.161723, 1.512069, -1.95511, 1, 1, 1, 1, 1,
-1.149684, -1.11699, -1.903268, 0, 0, 1, 1, 1,
-1.142271, -0.5935518, -2.140856, 1, 0, 0, 1, 1,
-1.140034, 0.8595065, -0.5617821, 1, 0, 0, 1, 1,
-1.139651, 0.100093, -1.387295, 1, 0, 0, 1, 1,
-1.137668, -1.686307, -2.065435, 1, 0, 0, 1, 1,
-1.125772, 0.3047197, -2.668255, 1, 0, 0, 1, 1,
-1.115512, -0.7130252, -1.624491, 0, 0, 0, 1, 1,
-1.10227, -0.9119691, -2.201163, 0, 0, 0, 1, 1,
-1.098959, -1.372025, -3.54553, 0, 0, 0, 1, 1,
-1.094344, 0.5190593, -0.7978222, 0, 0, 0, 1, 1,
-1.09386, 0.1618497, -1.723791, 0, 0, 0, 1, 1,
-1.087003, 1.905976, 0.1139367, 0, 0, 0, 1, 1,
-1.085568, -0.7677494, -6.081382, 0, 0, 0, 1, 1,
-1.081531, -0.8722218, -3.738504, 1, 1, 1, 1, 1,
-1.081126, -0.009907259, -4.273098, 1, 1, 1, 1, 1,
-1.072238, 0.1555839, -3.078265, 1, 1, 1, 1, 1,
-1.070474, 1.882757, -0.01116539, 1, 1, 1, 1, 1,
-1.067571, -1.2734, -2.182038, 1, 1, 1, 1, 1,
-1.066509, -0.03418393, -2.031607, 1, 1, 1, 1, 1,
-1.053432, -1.640164, -1.923892, 1, 1, 1, 1, 1,
-1.051759, 0.7392619, 0.09609691, 1, 1, 1, 1, 1,
-1.0439, 1.087193, -1.669581, 1, 1, 1, 1, 1,
-1.029023, 1.351853, -0.5085166, 1, 1, 1, 1, 1,
-1.028733, -0.3384227, -2.786157, 1, 1, 1, 1, 1,
-1.023202, 0.6669742, -3.266505, 1, 1, 1, 1, 1,
-1.018509, -1.924305, -2.067034, 1, 1, 1, 1, 1,
-1.015022, -0.4087559, -1.794326, 1, 1, 1, 1, 1,
-1.012128, -0.2325147, -3.606075, 1, 1, 1, 1, 1,
-1.001248, -1.431007, -3.67784, 0, 0, 1, 1, 1,
-0.9986276, -0.02862998, -0.0749945, 1, 0, 0, 1, 1,
-0.9974188, -0.6583552, -2.045636, 1, 0, 0, 1, 1,
-0.9918318, 0.3137598, -2.547957, 1, 0, 0, 1, 1,
-0.9872696, -0.5599338, -3.843809, 1, 0, 0, 1, 1,
-0.9826702, 0.2039222, 0.507161, 1, 0, 0, 1, 1,
-0.9803557, 0.4274034, -0.8218532, 0, 0, 0, 1, 1,
-0.9788969, -0.9327952, -0.7002207, 0, 0, 0, 1, 1,
-0.9748444, 0.2232957, -1.893358, 0, 0, 0, 1, 1,
-0.9597324, 0.2473586, -1.719545, 0, 0, 0, 1, 1,
-0.9563375, 0.4813882, -1.242733, 0, 0, 0, 1, 1,
-0.9525859, -1.132437, -3.339821, 0, 0, 0, 1, 1,
-0.944661, 1.373793, 0.4734213, 0, 0, 0, 1, 1,
-0.9437113, 0.428214, -2.247722, 1, 1, 1, 1, 1,
-0.9434438, -0.5473549, 1.051111, 1, 1, 1, 1, 1,
-0.9422154, 1.069677, -1.992294, 1, 1, 1, 1, 1,
-0.9389528, -1.01599, -2.143028, 1, 1, 1, 1, 1,
-0.9384062, -0.7505789, -2.596656, 1, 1, 1, 1, 1,
-0.9325386, 0.6870517, 0.1640529, 1, 1, 1, 1, 1,
-0.932398, -0.96595, -2.138399, 1, 1, 1, 1, 1,
-0.9263044, 1.274729, -1.475366, 1, 1, 1, 1, 1,
-0.9151713, 1.019446, -0.5178149, 1, 1, 1, 1, 1,
-0.9134694, 0.3909172, -0.4372323, 1, 1, 1, 1, 1,
-0.9074706, 1.622653, 1.868843, 1, 1, 1, 1, 1,
-0.9040244, 1.036237, -1.209367, 1, 1, 1, 1, 1,
-0.9000985, -0.470063, -3.668979, 1, 1, 1, 1, 1,
-0.8988971, 0.2676052, -1.204552, 1, 1, 1, 1, 1,
-0.8959519, -0.5661312, -2.669101, 1, 1, 1, 1, 1,
-0.8953363, 0.9076028, -0.3023583, 0, 0, 1, 1, 1,
-0.8929158, 2.40373, -0.5176638, 1, 0, 0, 1, 1,
-0.8920547, -0.02464204, -0.9647999, 1, 0, 0, 1, 1,
-0.8893042, -0.9110278, -2.414375, 1, 0, 0, 1, 1,
-0.8839083, 0.5857293, -0.4719749, 1, 0, 0, 1, 1,
-0.8837321, 0.6938521, -0.738709, 1, 0, 0, 1, 1,
-0.8816354, 0.5397127, -0.849243, 0, 0, 0, 1, 1,
-0.8735599, 0.527526, -0.09570078, 0, 0, 0, 1, 1,
-0.8715739, -0.7712138, -2.484001, 0, 0, 0, 1, 1,
-0.871538, 0.3543237, -0.2690562, 0, 0, 0, 1, 1,
-0.8684728, -0.3745456, -1.942387, 0, 0, 0, 1, 1,
-0.865898, 1.620845, -1.105567, 0, 0, 0, 1, 1,
-0.8656032, 0.6042796, -1.623377, 0, 0, 0, 1, 1,
-0.8629699, 0.4756421, -0.8418333, 1, 1, 1, 1, 1,
-0.8611926, 0.7549379, -1.688988, 1, 1, 1, 1, 1,
-0.8590245, 1.099531, -1.320126, 1, 1, 1, 1, 1,
-0.8586664, 1.454755, 0.098571, 1, 1, 1, 1, 1,
-0.8573312, -0.2031689, -1.541553, 1, 1, 1, 1, 1,
-0.8536198, -0.3352094, -2.715105, 1, 1, 1, 1, 1,
-0.8468656, -0.2599008, -2.056848, 1, 1, 1, 1, 1,
-0.8409811, 0.3957836, -1.392734, 1, 1, 1, 1, 1,
-0.8358402, 0.2900533, -0.8360579, 1, 1, 1, 1, 1,
-0.8336843, -0.2879256, -2.134976, 1, 1, 1, 1, 1,
-0.8252182, 0.2847176, -1.728006, 1, 1, 1, 1, 1,
-0.8233798, 2.156029, -1.378405, 1, 1, 1, 1, 1,
-0.8200761, 0.5392007, -0.990279, 1, 1, 1, 1, 1,
-0.8159975, -0.657373, -1.789775, 1, 1, 1, 1, 1,
-0.8156374, -0.6935428, -2.675505, 1, 1, 1, 1, 1,
-0.8124905, 0.3522634, -0.2149477, 0, 0, 1, 1, 1,
-0.8052048, -0.5285766, -1.606752, 1, 0, 0, 1, 1,
-0.7962844, -2.324465, -3.350994, 1, 0, 0, 1, 1,
-0.7942221, -0.8960513, -1.562736, 1, 0, 0, 1, 1,
-0.7793809, -0.1251093, -1.470575, 1, 0, 0, 1, 1,
-0.7792367, -1.468916, -2.132916, 1, 0, 0, 1, 1,
-0.7784177, 0.3273948, 0.8050934, 0, 0, 0, 1, 1,
-0.7774923, 0.03494726, -2.526691, 0, 0, 0, 1, 1,
-0.7757159, 0.4493704, -2.231495, 0, 0, 0, 1, 1,
-0.7756684, 0.9902565, -1.495197, 0, 0, 0, 1, 1,
-0.7732783, -0.9306067, -3.445848, 0, 0, 0, 1, 1,
-0.7711168, 0.3055812, -2.518677, 0, 0, 0, 1, 1,
-0.7698608, 0.626913, -2.298456, 0, 0, 0, 1, 1,
-0.7631234, 0.3401587, -1.719168, 1, 1, 1, 1, 1,
-0.7570541, 0.734871, -2.082127, 1, 1, 1, 1, 1,
-0.7536538, 1.083112, -0.5471741, 1, 1, 1, 1, 1,
-0.7525892, 1.080394, -1.267576, 1, 1, 1, 1, 1,
-0.7462103, 0.220637, -1.665329, 1, 1, 1, 1, 1,
-0.7456545, 0.3367129, 0.4068824, 1, 1, 1, 1, 1,
-0.7417459, 0.3485569, 0.2028174, 1, 1, 1, 1, 1,
-0.7399774, -0.443546, -0.4173928, 1, 1, 1, 1, 1,
-0.7396023, -1.473026, -1.100272, 1, 1, 1, 1, 1,
-0.7383021, 0.03654551, -0.8681986, 1, 1, 1, 1, 1,
-0.7337704, 1.899943, 0.1647863, 1, 1, 1, 1, 1,
-0.7268126, 0.7066246, -0.8136275, 1, 1, 1, 1, 1,
-0.7261427, -1.098254, -4.217077, 1, 1, 1, 1, 1,
-0.720842, -0.1821331, -1.554272, 1, 1, 1, 1, 1,
-0.7135264, -1.184194, -3.077457, 1, 1, 1, 1, 1,
-0.7070599, 0.8572136, -2.290506, 0, 0, 1, 1, 1,
-0.7069601, 0.9861851, -1.658421, 1, 0, 0, 1, 1,
-0.7068378, 1.061872, -1.967943, 1, 0, 0, 1, 1,
-0.704075, 0.1605921, -1.859533, 1, 0, 0, 1, 1,
-0.7034953, 0.8928532, -0.9200183, 1, 0, 0, 1, 1,
-0.7027551, -0.117043, -2.309837, 1, 0, 0, 1, 1,
-0.702062, -2.046739, -1.874903, 0, 0, 0, 1, 1,
-0.6975486, 1.469565, 0.4303019, 0, 0, 0, 1, 1,
-0.6968513, 1.519343, -1.945658, 0, 0, 0, 1, 1,
-0.6966513, 0.6498939, -0.296324, 0, 0, 0, 1, 1,
-0.6915551, 0.3626776, -0.2573836, 0, 0, 0, 1, 1,
-0.6858623, -1.893763, -0.8181968, 0, 0, 0, 1, 1,
-0.6851761, 0.4391003, -0.4762561, 0, 0, 0, 1, 1,
-0.6838114, -1.562431, -2.141381, 1, 1, 1, 1, 1,
-0.6820953, 0.3151538, -2.204293, 1, 1, 1, 1, 1,
-0.6795983, -1.900007, -2.159416, 1, 1, 1, 1, 1,
-0.6791614, -1.973318, -2.556194, 1, 1, 1, 1, 1,
-0.6758643, -0.3132229, -3.371075, 1, 1, 1, 1, 1,
-0.6706426, -0.3924976, -1.432705, 1, 1, 1, 1, 1,
-0.6698361, 0.8438314, 0.2727133, 1, 1, 1, 1, 1,
-0.6635112, -0.07971372, -3.168607, 1, 1, 1, 1, 1,
-0.661808, 0.0388091, -1.269741, 1, 1, 1, 1, 1,
-0.6615292, 0.863562, -0.7551655, 1, 1, 1, 1, 1,
-0.657505, 1.115309, -0.7586772, 1, 1, 1, 1, 1,
-0.657297, -1.847595, -2.768236, 1, 1, 1, 1, 1,
-0.6554874, 1.072995, 0.4453787, 1, 1, 1, 1, 1,
-0.6510383, -0.8606041, -4.086487, 1, 1, 1, 1, 1,
-0.6482693, -2.548457, -3.85174, 1, 1, 1, 1, 1,
-0.6462711, -1.436812, -0.9386898, 0, 0, 1, 1, 1,
-0.6452126, -0.7383868, -3.307924, 1, 0, 0, 1, 1,
-0.643886, 0.6584647, -0.7949324, 1, 0, 0, 1, 1,
-0.643353, 0.4605637, -0.3717343, 1, 0, 0, 1, 1,
-0.6420542, -0.5025051, -1.559509, 1, 0, 0, 1, 1,
-0.6283409, -0.5385838, -2.065725, 1, 0, 0, 1, 1,
-0.6198038, 1.044513, 1.012144, 0, 0, 0, 1, 1,
-0.6115524, -0.3350776, -2.592306, 0, 0, 0, 1, 1,
-0.6089119, 0.2159329, -1.876579, 0, 0, 0, 1, 1,
-0.6022655, 0.6991413, -0.4617337, 0, 0, 0, 1, 1,
-0.5980662, 0.466688, -1.773344, 0, 0, 0, 1, 1,
-0.5951402, 0.03984819, -1.458041, 0, 0, 0, 1, 1,
-0.5900303, -0.4773006, -2.153172, 0, 0, 0, 1, 1,
-0.5853457, -0.7030869, -1.010523, 1, 1, 1, 1, 1,
-0.5847209, -0.8607553, -4.367159, 1, 1, 1, 1, 1,
-0.5814847, 0.5178285, -1.708502, 1, 1, 1, 1, 1,
-0.5802925, 0.7135552, -2.027637, 1, 1, 1, 1, 1,
-0.5765883, -1.426485, -3.243433, 1, 1, 1, 1, 1,
-0.5746248, -0.8272269, -0.5352655, 1, 1, 1, 1, 1,
-0.5641873, 0.2964058, -2.500412, 1, 1, 1, 1, 1,
-0.5640111, -0.8362092, -1.218806, 1, 1, 1, 1, 1,
-0.5629835, 1.176939, -1.395024, 1, 1, 1, 1, 1,
-0.5618902, 0.09836596, -1.948039, 1, 1, 1, 1, 1,
-0.5605271, -0.7601879, -1.093067, 1, 1, 1, 1, 1,
-0.5591565, -1.218582, -2.555271, 1, 1, 1, 1, 1,
-0.5494798, -0.5809324, -0.3785309, 1, 1, 1, 1, 1,
-0.5435779, -1.203579, -1.536986, 1, 1, 1, 1, 1,
-0.5433244, 0.02404881, -2.04092, 1, 1, 1, 1, 1,
-0.5419211, 0.5295489, -2.651454, 0, 0, 1, 1, 1,
-0.5378937, -0.3108339, -1.963641, 1, 0, 0, 1, 1,
-0.5344117, 1.460772, -1.035964, 1, 0, 0, 1, 1,
-0.5323217, 0.2392222, -2.662172, 1, 0, 0, 1, 1,
-0.5303461, 0.8435245, -0.6860415, 1, 0, 0, 1, 1,
-0.5288115, 0.2918545, -1.079495, 1, 0, 0, 1, 1,
-0.5280729, 0.5992656, -1.679493, 0, 0, 0, 1, 1,
-0.5273077, 0.4201487, -0.6893903, 0, 0, 0, 1, 1,
-0.5221339, 1.207965, -1.048909, 0, 0, 0, 1, 1,
-0.5190792, -0.8230838, -1.977664, 0, 0, 0, 1, 1,
-0.5144767, 0.9087577, -1.024769, 0, 0, 0, 1, 1,
-0.5117404, -1.976122, -3.865654, 0, 0, 0, 1, 1,
-0.5089168, -0.3099794, -2.044563, 0, 0, 0, 1, 1,
-0.5027127, -1.247444, -3.382202, 1, 1, 1, 1, 1,
-0.5022197, 1.034831, -0.6971403, 1, 1, 1, 1, 1,
-0.4989299, -0.4440462, -1.956907, 1, 1, 1, 1, 1,
-0.4930474, 1.320671, -1.36725, 1, 1, 1, 1, 1,
-0.4904293, -0.06528571, -0.5090518, 1, 1, 1, 1, 1,
-0.4882048, 0.1791372, 1.77738, 1, 1, 1, 1, 1,
-0.4849156, 1.990277, -0.3439869, 1, 1, 1, 1, 1,
-0.4835559, -1.725865, -3.780135, 1, 1, 1, 1, 1,
-0.4819592, -1.058533, -2.116517, 1, 1, 1, 1, 1,
-0.4796625, -0.3508762, -2.016409, 1, 1, 1, 1, 1,
-0.4773563, -1.0758, -1.938003, 1, 1, 1, 1, 1,
-0.4718932, -0.5234787, -1.270408, 1, 1, 1, 1, 1,
-0.4710509, 0.3327486, -0.4903375, 1, 1, 1, 1, 1,
-0.4705608, 0.9620197, 1.132652, 1, 1, 1, 1, 1,
-0.4637313, -0.1232522, -2.840356, 1, 1, 1, 1, 1,
-0.4604958, 0.2039817, -0.7922655, 0, 0, 1, 1, 1,
-0.4563299, -0.8399729, -1.50223, 1, 0, 0, 1, 1,
-0.4556512, 1.07855, -1.00916, 1, 0, 0, 1, 1,
-0.4533516, -0.7749602, -2.645134, 1, 0, 0, 1, 1,
-0.4528053, 1.117071, -1.599922, 1, 0, 0, 1, 1,
-0.4504209, 0.05743909, -0.9702023, 1, 0, 0, 1, 1,
-0.4487446, 0.3805679, -1.079365, 0, 0, 0, 1, 1,
-0.4469556, 0.4188396, -1.145709, 0, 0, 0, 1, 1,
-0.4445921, -0.5904863, -3.014273, 0, 0, 0, 1, 1,
-0.444456, 0.7542906, -0.4599226, 0, 0, 0, 1, 1,
-0.4435357, 0.3953967, -0.3260888, 0, 0, 0, 1, 1,
-0.4433742, -1.433887, -3.986488, 0, 0, 0, 1, 1,
-0.4430243, -0.7195773, -3.472513, 0, 0, 0, 1, 1,
-0.4425222, 0.0403682, -0.1125846, 1, 1, 1, 1, 1,
-0.4415495, 0.77652, -0.8516025, 1, 1, 1, 1, 1,
-0.4404556, -0.1105808, -1.040181, 1, 1, 1, 1, 1,
-0.4387746, -1.470081, -2.227793, 1, 1, 1, 1, 1,
-0.4377773, 0.3024761, -0.6348549, 1, 1, 1, 1, 1,
-0.4268061, -0.08796116, -1.675867, 1, 1, 1, 1, 1,
-0.42603, 0.7979102, -1.789056, 1, 1, 1, 1, 1,
-0.4250793, -0.5775913, -3.022671, 1, 1, 1, 1, 1,
-0.4217244, -0.8482229, -3.004824, 1, 1, 1, 1, 1,
-0.4210566, -0.5218536, -2.212717, 1, 1, 1, 1, 1,
-0.4202814, 0.3568065, -1.030913, 1, 1, 1, 1, 1,
-0.4199168, 1.417735, 0.04122236, 1, 1, 1, 1, 1,
-0.4197775, 1.99869, -0.21858, 1, 1, 1, 1, 1,
-0.4178433, 1.125891, 0.3189389, 1, 1, 1, 1, 1,
-0.4150357, -1.057842, -2.63907, 1, 1, 1, 1, 1,
-0.4146498, -0.8202603, -1.279962, 0, 0, 1, 1, 1,
-0.4137151, -1.739105, -4.534458, 1, 0, 0, 1, 1,
-0.4101728, 2.318637, -1.733953, 1, 0, 0, 1, 1,
-0.4084598, 0.9494621, -1.511876, 1, 0, 0, 1, 1,
-0.4078234, 2.191979, -0.2478739, 1, 0, 0, 1, 1,
-0.4074997, -0.8677269, -2.825462, 1, 0, 0, 1, 1,
-0.4059562, 0.7146124, 0.8149229, 0, 0, 0, 1, 1,
-0.4045832, 1.115759, -0.8377327, 0, 0, 0, 1, 1,
-0.4029749, -0.9116392, -2.081818, 0, 0, 0, 1, 1,
-0.4016017, 1.74526, -2.096452, 0, 0, 0, 1, 1,
-0.4014727, 1.389672, 1.229765, 0, 0, 0, 1, 1,
-0.4011092, -1.223063, -2.2409, 0, 0, 0, 1, 1,
-0.3988982, 1.039938, 0.2178168, 0, 0, 0, 1, 1,
-0.3974494, -0.09020365, -0.6277802, 1, 1, 1, 1, 1,
-0.3947561, -0.9130753, -2.295841, 1, 1, 1, 1, 1,
-0.379234, -0.3026001, -2.830871, 1, 1, 1, 1, 1,
-0.3770652, 0.8972809, -0.4885643, 1, 1, 1, 1, 1,
-0.3759702, -0.5222779, -1.221367, 1, 1, 1, 1, 1,
-0.3758931, -0.3355396, -2.374978, 1, 1, 1, 1, 1,
-0.3729517, -0.8531614, -1.76433, 1, 1, 1, 1, 1,
-0.3708695, 0.7692261, 0.1174378, 1, 1, 1, 1, 1,
-0.3703251, 0.01159901, -1.139753, 1, 1, 1, 1, 1,
-0.3660573, 0.5297399, 0.382648, 1, 1, 1, 1, 1,
-0.3625212, 0.8916065, 0.8017631, 1, 1, 1, 1, 1,
-0.3609617, -0.1686905, -0.7441146, 1, 1, 1, 1, 1,
-0.3600566, -0.4520051, -1.081357, 1, 1, 1, 1, 1,
-0.3571424, 0.7587086, 0.5262011, 1, 1, 1, 1, 1,
-0.3571337, 0.4934658, -0.9847707, 1, 1, 1, 1, 1,
-0.3536217, 0.8858501, 0.8390711, 0, 0, 1, 1, 1,
-0.3527273, -1.376897, -3.649265, 1, 0, 0, 1, 1,
-0.3498263, 0.6580026, -0.7237495, 1, 0, 0, 1, 1,
-0.3483175, 0.125414, -0.9824338, 1, 0, 0, 1, 1,
-0.3473205, -0.5318807, -2.863704, 1, 0, 0, 1, 1,
-0.3431023, 0.5541925, -0.8139488, 1, 0, 0, 1, 1,
-0.3414505, 0.9404743, 1.089166, 0, 0, 0, 1, 1,
-0.3392804, 1.45233, -0.07734825, 0, 0, 0, 1, 1,
-0.338717, -0.2045948, -1.607654, 0, 0, 0, 1, 1,
-0.3324958, 0.4337522, -1.27911, 0, 0, 0, 1, 1,
-0.3321961, 0.07086956, -1.539085, 0, 0, 0, 1, 1,
-0.3317192, -0.9377515, -0.9908563, 0, 0, 0, 1, 1,
-0.3298106, -0.7523903, -5.325126, 0, 0, 0, 1, 1,
-0.3287608, -1.117509, -1.235394, 1, 1, 1, 1, 1,
-0.3241954, 0.3631063, -0.1456992, 1, 1, 1, 1, 1,
-0.3173523, -0.06192864, -0.4981155, 1, 1, 1, 1, 1,
-0.3171092, 0.2969759, -0.7674893, 1, 1, 1, 1, 1,
-0.3139679, 0.4457648, -2.207004, 1, 1, 1, 1, 1,
-0.3081676, 1.207819, -0.5812011, 1, 1, 1, 1, 1,
-0.304778, -2.127235, -4.030305, 1, 1, 1, 1, 1,
-0.3026218, 0.4429035, 0.891391, 1, 1, 1, 1, 1,
-0.3015344, 1.770328, -0.4286252, 1, 1, 1, 1, 1,
-0.3008435, 0.9492334, 1.260164, 1, 1, 1, 1, 1,
-0.2990598, 0.9464625, -0.9479595, 1, 1, 1, 1, 1,
-0.2964747, -0.5008975, -1.179885, 1, 1, 1, 1, 1,
-0.2958218, -0.6257275, -3.085531, 1, 1, 1, 1, 1,
-0.2958012, -0.9297222, -2.309904, 1, 1, 1, 1, 1,
-0.2954284, 0.5651298, -2.504528, 1, 1, 1, 1, 1,
-0.294385, -0.4828544, -1.173901, 0, 0, 1, 1, 1,
-0.2933157, 0.1885837, -1.139286, 1, 0, 0, 1, 1,
-0.2926095, 0.4194362, -1.028985, 1, 0, 0, 1, 1,
-0.2818665, -1.052878, -3.069311, 1, 0, 0, 1, 1,
-0.281645, -1.097044, -2.995125, 1, 0, 0, 1, 1,
-0.2808908, 0.1900599, -1.108446, 1, 0, 0, 1, 1,
-0.280295, 1.884495, 0.7597009, 0, 0, 0, 1, 1,
-0.2755374, 0.09375107, 0.273021, 0, 0, 0, 1, 1,
-0.2725821, 0.3664854, -1.481277, 0, 0, 0, 1, 1,
-0.2699604, 1.097245, -1.081696, 0, 0, 0, 1, 1,
-0.2572772, -0.5427951, -1.795498, 0, 0, 0, 1, 1,
-0.2561916, -1.900845, -4.167479, 0, 0, 0, 1, 1,
-0.2532943, 1.923981, 0.07472399, 0, 0, 0, 1, 1,
-0.2520769, 0.3814096, 0.6315042, 1, 1, 1, 1, 1,
-0.2515339, -0.7689005, -3.566909, 1, 1, 1, 1, 1,
-0.2501252, -0.7282139, -1.517255, 1, 1, 1, 1, 1,
-0.2486748, 1.271616, -0.8876756, 1, 1, 1, 1, 1,
-0.2433709, 0.2189632, 0.3513129, 1, 1, 1, 1, 1,
-0.2417707, -0.3955758, -3.471519, 1, 1, 1, 1, 1,
-0.2393378, 0.7798056, 0.721127, 1, 1, 1, 1, 1,
-0.2301681, -1.664149, -2.482178, 1, 1, 1, 1, 1,
-0.2256186, -0.3584148, -3.170819, 1, 1, 1, 1, 1,
-0.2247216, 0.9064708, 0.5382106, 1, 1, 1, 1, 1,
-0.2230625, 2.260071, 0.3242721, 1, 1, 1, 1, 1,
-0.2226713, -0.2000903, -3.013431, 1, 1, 1, 1, 1,
-0.2195711, -0.07051791, -0.7715715, 1, 1, 1, 1, 1,
-0.2098337, 0.8480535, -0.446285, 1, 1, 1, 1, 1,
-0.2046061, 1.905988, -0.2926121, 1, 1, 1, 1, 1,
-0.2025312, -0.8884639, -3.85505, 0, 0, 1, 1, 1,
-0.1950016, -0.4796026, -1.921226, 1, 0, 0, 1, 1,
-0.1936295, -0.5037701, -1.314558, 1, 0, 0, 1, 1,
-0.190193, 0.08073026, -1.665668, 1, 0, 0, 1, 1,
-0.1822726, -0.8520874, -1.883357, 1, 0, 0, 1, 1,
-0.1787859, 0.4787681, -0.4624009, 1, 0, 0, 1, 1,
-0.1770729, -0.5876875, -3.082232, 0, 0, 0, 1, 1,
-0.1703385, -0.1509431, -0.959612, 0, 0, 0, 1, 1,
-0.1645222, 0.5438085, -0.743381, 0, 0, 0, 1, 1,
-0.1589555, -0.034298, -2.089634, 0, 0, 0, 1, 1,
-0.1586431, -0.4027552, -5.178948, 0, 0, 0, 1, 1,
-0.1585416, 0.8419112, -0.2015857, 0, 0, 0, 1, 1,
-0.1565417, -1.590891, -2.977955, 0, 0, 0, 1, 1,
-0.1538184, 1.401896, 0.5800669, 1, 1, 1, 1, 1,
-0.1531581, -0.4441576, -2.933513, 1, 1, 1, 1, 1,
-0.1521201, 1.178154, 0.2098893, 1, 1, 1, 1, 1,
-0.1436138, 0.3855101, -0.7259571, 1, 1, 1, 1, 1,
-0.1426416, -1.374124, -2.095866, 1, 1, 1, 1, 1,
-0.138922, 0.4910129, -0.9587564, 1, 1, 1, 1, 1,
-0.1366213, 0.4545074, 0.4579395, 1, 1, 1, 1, 1,
-0.1355719, -1.234546, -2.297623, 1, 1, 1, 1, 1,
-0.1354018, 0.1091837, -0.5751425, 1, 1, 1, 1, 1,
-0.1346489, 0.4127313, 0.04470192, 1, 1, 1, 1, 1,
-0.1340482, 0.0639727, -2.816299, 1, 1, 1, 1, 1,
-0.1340331, 0.0553307, -0.9754277, 1, 1, 1, 1, 1,
-0.1287822, 0.8181859, -1.944385, 1, 1, 1, 1, 1,
-0.1249546, -0.5634822, -0.3572741, 1, 1, 1, 1, 1,
-0.1175578, -1.809584, -2.042408, 1, 1, 1, 1, 1,
-0.1168891, 2.25576, 0.05490892, 0, 0, 1, 1, 1,
-0.1118051, 0.2326736, -0.838083, 1, 0, 0, 1, 1,
-0.1108774, 0.03877337, -1.616632, 1, 0, 0, 1, 1,
-0.1075481, 1.031419, -0.6676672, 1, 0, 0, 1, 1,
-0.1057453, -0.6132327, -3.39257, 1, 0, 0, 1, 1,
-0.1034589, -1.609176, -4.445636, 1, 0, 0, 1, 1,
-0.1025589, -0.365564, -2.642579, 0, 0, 0, 1, 1,
-0.1001249, 0.1149613, 0.179443, 0, 0, 0, 1, 1,
-0.1000662, -0.8925458, -3.263087, 0, 0, 0, 1, 1,
-0.09928555, -1.73738, -3.139411, 0, 0, 0, 1, 1,
-0.09894869, 0.01581219, -1.101897, 0, 0, 0, 1, 1,
-0.09522146, 0.8004818, 0.7472918, 0, 0, 0, 1, 1,
-0.09325259, 0.9286441, -0.9201702, 0, 0, 0, 1, 1,
-0.09159209, -1.616073, -2.587343, 1, 1, 1, 1, 1,
-0.08671079, 0.5003487, -0.1480737, 1, 1, 1, 1, 1,
-0.08531331, 1.12492, -1.607469, 1, 1, 1, 1, 1,
-0.08115198, -0.9296354, -2.366051, 1, 1, 1, 1, 1,
-0.08111587, 0.3730372, 0.6123762, 1, 1, 1, 1, 1,
-0.0796811, -1.241613, -3.036622, 1, 1, 1, 1, 1,
-0.0773463, -0.3799395, -3.185195, 1, 1, 1, 1, 1,
-0.07614122, -0.8026679, -3.54023, 1, 1, 1, 1, 1,
-0.07025539, -1.544091, -2.960557, 1, 1, 1, 1, 1,
-0.06984849, -0.7902153, -4.192899, 1, 1, 1, 1, 1,
-0.0688612, -0.4304492, -3.29206, 1, 1, 1, 1, 1,
-0.06770387, 1.582111, -0.1743425, 1, 1, 1, 1, 1,
-0.06730378, 1.486449, -0.1073987, 1, 1, 1, 1, 1,
-0.06636453, -0.08343563, -2.593795, 1, 1, 1, 1, 1,
-0.06617701, 1.248236, -1.046835, 1, 1, 1, 1, 1,
-0.06471815, 1.595523, 0.703866, 0, 0, 1, 1, 1,
-0.06455408, 0.6493705, -1.238641, 1, 0, 0, 1, 1,
-0.06040121, 0.3636931, -0.4344259, 1, 0, 0, 1, 1,
-0.0598173, 0.835828, -2.998032, 1, 0, 0, 1, 1,
-0.05855357, -0.07136237, -4.555309, 1, 0, 0, 1, 1,
-0.0575407, -0.3154152, -3.218402, 1, 0, 0, 1, 1,
-0.05602934, 2.064327, 0.6202264, 0, 0, 0, 1, 1,
-0.05299938, 0.6421811, -0.3369402, 0, 0, 0, 1, 1,
-0.05296047, 0.7135313, -0.9131428, 0, 0, 0, 1, 1,
-0.05264928, 0.8909669, -0.2368773, 0, 0, 0, 1, 1,
-0.05238942, -0.9086394, -3.398308, 0, 0, 0, 1, 1,
-0.05177929, 0.7104703, -0.1240492, 0, 0, 0, 1, 1,
-0.04953688, 0.4109461, -2.918617, 0, 0, 0, 1, 1,
-0.04861686, 2.09985, 1.474816, 1, 1, 1, 1, 1,
-0.04719854, -0.5964529, -3.540089, 1, 1, 1, 1, 1,
-0.0469407, -0.06679133, -3.015262, 1, 1, 1, 1, 1,
-0.04557806, 0.3742081, 0.1013301, 1, 1, 1, 1, 1,
-0.04400385, 0.01933609, -2.834569, 1, 1, 1, 1, 1,
-0.0439067, 0.1336941, 0.4110699, 1, 1, 1, 1, 1,
-0.04092345, -0.35397, -2.119723, 1, 1, 1, 1, 1,
-0.03986892, -0.5489336, -2.646694, 1, 1, 1, 1, 1,
-0.03964315, -0.9644459, -3.802727, 1, 1, 1, 1, 1,
-0.03440626, 1.267906, 0.8833114, 1, 1, 1, 1, 1,
-0.03256036, 1.689707, 0.2856836, 1, 1, 1, 1, 1,
-0.02847425, 0.08601914, 1.049238, 1, 1, 1, 1, 1,
-0.02026499, -0.08231223, -3.215623, 1, 1, 1, 1, 1,
-0.01915265, 0.2983218, -0.859015, 1, 1, 1, 1, 1,
-0.01887351, 1.687488, 0.1245364, 1, 1, 1, 1, 1,
-0.01140174, 1.388709, 0.2393253, 0, 0, 1, 1, 1,
-0.008277515, 0.5830067, 1.235429, 1, 0, 0, 1, 1,
-0.007864163, 1.350126, -0.1275539, 1, 0, 0, 1, 1,
-0.0071753, 0.0769475, -0.3343766, 1, 0, 0, 1, 1,
-0.001609569, 1.977414, 0.4813604, 1, 0, 0, 1, 1,
0.008325759, -0.8994811, 3.597288, 1, 0, 0, 1, 1,
0.008327362, -0.6185632, 2.962339, 0, 0, 0, 1, 1,
0.01025035, -0.2490858, 1.971903, 0, 0, 0, 1, 1,
0.01130261, -0.3215691, 3.201419, 0, 0, 0, 1, 1,
0.01307201, -1.9895, 3.489542, 0, 0, 0, 1, 1,
0.01367621, 0.2106778, 0.4545749, 0, 0, 0, 1, 1,
0.01470958, 2.695431, -0.5460137, 0, 0, 0, 1, 1,
0.01611388, -0.537676, 3.36779, 0, 0, 0, 1, 1,
0.0169975, -2.444661, 2.699421, 1, 1, 1, 1, 1,
0.02163084, -1.379458, 3.611037, 1, 1, 1, 1, 1,
0.02316276, 0.342936, 0.3687543, 1, 1, 1, 1, 1,
0.02395438, 1.833849, 0.2376449, 1, 1, 1, 1, 1,
0.02684226, 1.202489, 2.519402, 1, 1, 1, 1, 1,
0.02888267, 1.636198, -0.5117885, 1, 1, 1, 1, 1,
0.03065702, -1.475348, 2.13168, 1, 1, 1, 1, 1,
0.03237735, -1.291652, 3.004234, 1, 1, 1, 1, 1,
0.03306754, -0.5540073, 3.528821, 1, 1, 1, 1, 1,
0.033577, -1.135435, 2.851013, 1, 1, 1, 1, 1,
0.03567446, 0.1051659, 1.630736, 1, 1, 1, 1, 1,
0.04253756, -0.7372152, 4.31572, 1, 1, 1, 1, 1,
0.04817156, 0.7146791, -0.2647417, 1, 1, 1, 1, 1,
0.04997142, 0.7146827, -0.7775803, 1, 1, 1, 1, 1,
0.05586644, 1.144431, 0.7917504, 1, 1, 1, 1, 1,
0.05772396, -1.311915, 2.068799, 0, 0, 1, 1, 1,
0.05864583, -0.4459375, 3.893947, 1, 0, 0, 1, 1,
0.06224664, -0.69929, 3.897387, 1, 0, 0, 1, 1,
0.06260482, 2.27503, 0.8365435, 1, 0, 0, 1, 1,
0.06412315, -1.54506, 3.294207, 1, 0, 0, 1, 1,
0.06858324, -1.161593, 4.064128, 1, 0, 0, 1, 1,
0.06888052, -0.7071645, 3.97128, 0, 0, 0, 1, 1,
0.07580604, 0.2511031, 1.61593, 0, 0, 0, 1, 1,
0.07771911, -1.239667, 3.892403, 0, 0, 0, 1, 1,
0.08388425, -1.755208, 1.680731, 0, 0, 0, 1, 1,
0.08758267, 0.9620188, 0.2382588, 0, 0, 0, 1, 1,
0.08869319, -2.182809, 4.211829, 0, 0, 0, 1, 1,
0.08930001, 0.6597683, -0.1952828, 0, 0, 0, 1, 1,
0.09090141, -0.670891, 2.682138, 1, 1, 1, 1, 1,
0.09331947, -0.05450515, 2.086023, 1, 1, 1, 1, 1,
0.09647789, 1.230057, -0.7581004, 1, 1, 1, 1, 1,
0.0990822, -0.06797407, 0.3940382, 1, 1, 1, 1, 1,
0.1022287, -0.4343534, 4.205464, 1, 1, 1, 1, 1,
0.1031529, -1.852558, 2.566363, 1, 1, 1, 1, 1,
0.1048616, 1.247938, 0.4776425, 1, 1, 1, 1, 1,
0.1069442, 0.4144409, 2.351654, 1, 1, 1, 1, 1,
0.1073859, -0.7535037, 3.603644, 1, 1, 1, 1, 1,
0.1150934, 0.07725984, 0.8313898, 1, 1, 1, 1, 1,
0.1158073, -0.5550255, 4.115145, 1, 1, 1, 1, 1,
0.1189155, -0.9737234, 3.453585, 1, 1, 1, 1, 1,
0.1227984, -1.544538, 1.981099, 1, 1, 1, 1, 1,
0.1264355, -1.924012, 3.849994, 1, 1, 1, 1, 1,
0.1264491, -0.2274175, 1.770749, 1, 1, 1, 1, 1,
0.1270245, 0.3230734, -0.7235029, 0, 0, 1, 1, 1,
0.1325089, 0.1821375, 1.891442, 1, 0, 0, 1, 1,
0.1328866, -0.5794401, 3.539191, 1, 0, 0, 1, 1,
0.1365297, -1.035876, 0.9518758, 1, 0, 0, 1, 1,
0.1385544, 0.7225861, 1.045945, 1, 0, 0, 1, 1,
0.1401961, -1.62353, 2.780198, 1, 0, 0, 1, 1,
0.140979, -0.5750483, 1.853116, 0, 0, 0, 1, 1,
0.1428209, -0.8347812, 1.692789, 0, 0, 0, 1, 1,
0.143062, 0.6369641, 1.747299, 0, 0, 0, 1, 1,
0.1458988, 2.287824, 1.404958, 0, 0, 0, 1, 1,
0.146973, -0.1981723, 2.375511, 0, 0, 0, 1, 1,
0.1497788, 1.745492, -0.7955175, 0, 0, 0, 1, 1,
0.150635, -0.040087, 0.927112, 0, 0, 0, 1, 1,
0.1517806, 0.4343935, -0.5815173, 1, 1, 1, 1, 1,
0.1519947, -1.258422, 3.41826, 1, 1, 1, 1, 1,
0.1584994, -1.206122, 2.995234, 1, 1, 1, 1, 1,
0.166696, 1.212196, -0.4246616, 1, 1, 1, 1, 1,
0.1715877, 1.609654, 0.9889959, 1, 1, 1, 1, 1,
0.1727275, 0.3322018, 0.048653, 1, 1, 1, 1, 1,
0.174512, -1.060171, 3.339896, 1, 1, 1, 1, 1,
0.1753969, 0.1126829, 0.07998624, 1, 1, 1, 1, 1,
0.1771936, 1.448411, -0.7813993, 1, 1, 1, 1, 1,
0.1815643, 0.6913494, -0.2723759, 1, 1, 1, 1, 1,
0.1846767, 1.036794, -0.377383, 1, 1, 1, 1, 1,
0.1883995, -1.327153, 3.379639, 1, 1, 1, 1, 1,
0.1953013, -0.195061, 1.138363, 1, 1, 1, 1, 1,
0.1963146, -0.1061596, 1.600693, 1, 1, 1, 1, 1,
0.2030914, 0.2088191, -1.209605, 1, 1, 1, 1, 1,
0.2031591, 1.447113, 0.1058304, 0, 0, 1, 1, 1,
0.2037261, 0.6167404, -0.6959979, 1, 0, 0, 1, 1,
0.2060401, 0.03106797, 1.153479, 1, 0, 0, 1, 1,
0.206295, -0.8335686, 1.029065, 1, 0, 0, 1, 1,
0.2066269, 0.983614, -2.410697, 1, 0, 0, 1, 1,
0.2088164, 0.9608388, -0.5937719, 1, 0, 0, 1, 1,
0.2108355, -0.1739272, 2.133773, 0, 0, 0, 1, 1,
0.2133614, -1.072321, 2.326091, 0, 0, 0, 1, 1,
0.2144907, -0.4896542, 3.408221, 0, 0, 0, 1, 1,
0.2147178, 0.06118324, 1.686773, 0, 0, 0, 1, 1,
0.2185982, -1.067468, 2.275562, 0, 0, 0, 1, 1,
0.2210052, 1.16639, 0.3381464, 0, 0, 0, 1, 1,
0.2330332, 0.8234127, 0.5864361, 0, 0, 0, 1, 1,
0.2364444, -0.728882, 4.212866, 1, 1, 1, 1, 1,
0.2394608, -1.503914, 1.958682, 1, 1, 1, 1, 1,
0.2414104, -0.7854797, 2.786332, 1, 1, 1, 1, 1,
0.2416799, -1.035174, 3.660934, 1, 1, 1, 1, 1,
0.2429812, 1.673128, 0.3396514, 1, 1, 1, 1, 1,
0.2436235, -1.247371, 2.301667, 1, 1, 1, 1, 1,
0.2501854, 0.3071434, -0.619606, 1, 1, 1, 1, 1,
0.2550351, -0.1525612, 1.80249, 1, 1, 1, 1, 1,
0.2559107, 0.5693821, 2.038724, 1, 1, 1, 1, 1,
0.2566674, -1.312268, 2.127475, 1, 1, 1, 1, 1,
0.2570348, 0.9978817, 1.415941, 1, 1, 1, 1, 1,
0.2613325, -0.1888573, 2.593417, 1, 1, 1, 1, 1,
0.2626409, 0.7790422, -0.626982, 1, 1, 1, 1, 1,
0.2663091, 0.1000686, 0.6342174, 1, 1, 1, 1, 1,
0.2663473, 0.5089425, 0.9948308, 1, 1, 1, 1, 1,
0.266701, -0.004323322, 2.260914, 0, 0, 1, 1, 1,
0.2671821, -0.1554131, 3.854602, 1, 0, 0, 1, 1,
0.2673169, -0.6481215, 3.090233, 1, 0, 0, 1, 1,
0.268471, 0.4634221, 0.8347979, 1, 0, 0, 1, 1,
0.2706595, -0.8471213, 2.67198, 1, 0, 0, 1, 1,
0.2757415, 0.7641446, 2.071733, 1, 0, 0, 1, 1,
0.2758119, -0.6800184, 2.187149, 0, 0, 0, 1, 1,
0.2760708, 0.04333692, 2.338774, 0, 0, 0, 1, 1,
0.2795525, -0.8985423, 2.083833, 0, 0, 0, 1, 1,
0.2846915, -1.390232, 3.801621, 0, 0, 0, 1, 1,
0.2855799, 0.3840187, -0.251963, 0, 0, 0, 1, 1,
0.2902973, 0.1981942, 0.5920916, 0, 0, 0, 1, 1,
0.2963757, -1.667567, 0.8045706, 0, 0, 0, 1, 1,
0.3005138, -0.20882, 0.2221727, 1, 1, 1, 1, 1,
0.3025323, 0.9087155, -0.8727665, 1, 1, 1, 1, 1,
0.3080114, -0.6717894, 2.256817, 1, 1, 1, 1, 1,
0.3158829, -0.6395901, 1.961467, 1, 1, 1, 1, 1,
0.3179996, 0.2146521, 1.214809, 1, 1, 1, 1, 1,
0.3235987, 0.8748742, -0.2396771, 1, 1, 1, 1, 1,
0.3379788, 0.4392293, 1.003164, 1, 1, 1, 1, 1,
0.3391192, -1.35582, 2.674423, 1, 1, 1, 1, 1,
0.3398089, 0.1762057, 3.102328, 1, 1, 1, 1, 1,
0.3455032, -0.3115974, 3.226608, 1, 1, 1, 1, 1,
0.3477775, -0.004611152, 2.151639, 1, 1, 1, 1, 1,
0.3507253, 1.787364, -0.07049399, 1, 1, 1, 1, 1,
0.3507787, 1.513174, 1.3917, 1, 1, 1, 1, 1,
0.3518728, -0.8584827, 4.878157, 1, 1, 1, 1, 1,
0.3537292, 0.1157691, 3.244381, 1, 1, 1, 1, 1,
0.3576461, -0.4051405, 2.161831, 0, 0, 1, 1, 1,
0.3692541, 1.209626, -0.5889685, 1, 0, 0, 1, 1,
0.3708582, -2.074357, 2.767548, 1, 0, 0, 1, 1,
0.3710436, -0.7122834, 3.428037, 1, 0, 0, 1, 1,
0.3739353, -0.6225443, 4.015353, 1, 0, 0, 1, 1,
0.3776545, 0.4182034, 1.165695, 1, 0, 0, 1, 1,
0.3785959, 0.2484894, 0.9374599, 0, 0, 0, 1, 1,
0.3814129, -0.1692537, 2.131011, 0, 0, 0, 1, 1,
0.3821084, -0.3039935, 3.108056, 0, 0, 0, 1, 1,
0.3830577, -1.303631, 3.311377, 0, 0, 0, 1, 1,
0.3886306, -1.514156, 2.876496, 0, 0, 0, 1, 1,
0.389127, 0.7741286, -1.508434, 0, 0, 0, 1, 1,
0.3941312, -1.127433, 1.820572, 0, 0, 0, 1, 1,
0.3978416, -2.199649, 1.699156, 1, 1, 1, 1, 1,
0.4015086, 1.244776, 0.2529166, 1, 1, 1, 1, 1,
0.4084202, -2.504905, 4.217031, 1, 1, 1, 1, 1,
0.4180292, 0.5162086, 1.458179, 1, 1, 1, 1, 1,
0.4187477, 0.4548711, 0.7883247, 1, 1, 1, 1, 1,
0.418783, 0.9522607, -0.6530212, 1, 1, 1, 1, 1,
0.4198993, -2.035909, 2.26137, 1, 1, 1, 1, 1,
0.4225292, 2.109392, -0.2878517, 1, 1, 1, 1, 1,
0.4266434, 0.7317492, 0.2908868, 1, 1, 1, 1, 1,
0.4277471, -0.117154, 1.634313, 1, 1, 1, 1, 1,
0.427752, 0.8181577, 0.9231929, 1, 1, 1, 1, 1,
0.4332059, -0.6659447, 2.439014, 1, 1, 1, 1, 1,
0.4362038, -0.9171285, 2.899033, 1, 1, 1, 1, 1,
0.4397118, 1.916801, 0.922362, 1, 1, 1, 1, 1,
0.4410645, 0.396989, 0.09958992, 1, 1, 1, 1, 1,
0.4425436, -0.4951771, 4.525338, 0, 0, 1, 1, 1,
0.4495122, -1.136648, 2.041598, 1, 0, 0, 1, 1,
0.4534151, 0.109421, 3.018531, 1, 0, 0, 1, 1,
0.4543504, -0.4914522, 3.045782, 1, 0, 0, 1, 1,
0.4554815, 0.5569783, 0.9262968, 1, 0, 0, 1, 1,
0.4564963, -0.3892945, 3.165125, 1, 0, 0, 1, 1,
0.461845, 0.7955555, 0.1424101, 0, 0, 0, 1, 1,
0.4637907, -0.1296375, 2.071079, 0, 0, 0, 1, 1,
0.4647829, 0.5618213, 0.2404986, 0, 0, 0, 1, 1,
0.4659033, -2.500109, 4.03049, 0, 0, 0, 1, 1,
0.468043, -1.455144, 1.118641, 0, 0, 0, 1, 1,
0.470234, -0.7285622, 2.416145, 0, 0, 0, 1, 1,
0.4720139, 1.971369, -1.176583, 0, 0, 0, 1, 1,
0.4721701, 0.1016339, -0.1524041, 1, 1, 1, 1, 1,
0.4827708, -1.53615, 4.533775, 1, 1, 1, 1, 1,
0.4829365, 0.6554148, -0.8078347, 1, 1, 1, 1, 1,
0.4832443, 1.494683, 1.244564, 1, 1, 1, 1, 1,
0.485204, 0.2532401, 0.2547466, 1, 1, 1, 1, 1,
0.4866646, -0.8822033, 2.691761, 1, 1, 1, 1, 1,
0.4900034, 0.03987714, 1.538131, 1, 1, 1, 1, 1,
0.4943808, -0.421961, 2.262522, 1, 1, 1, 1, 1,
0.5061274, -0.5057172, 1.540345, 1, 1, 1, 1, 1,
0.5077707, -0.6153265, 3.679391, 1, 1, 1, 1, 1,
0.509365, -1.441233, 2.401702, 1, 1, 1, 1, 1,
0.5104687, 0.3132597, 1.610989, 1, 1, 1, 1, 1,
0.5115638, -2.722576, 0.9190848, 1, 1, 1, 1, 1,
0.5126415, 0.7019225, 1.232639, 1, 1, 1, 1, 1,
0.5204668, -1.149196, 1.841137, 1, 1, 1, 1, 1,
0.5209031, 1.010025, -0.575724, 0, 0, 1, 1, 1,
0.5211775, -0.008064438, 2.430226, 1, 0, 0, 1, 1,
0.5226768, 1.586884, -0.3085557, 1, 0, 0, 1, 1,
0.5228181, 1.142321, -1.3268, 1, 0, 0, 1, 1,
0.5259837, 0.5902508, 1.006023, 1, 0, 0, 1, 1,
0.5269266, 0.4350272, 0.1944129, 1, 0, 0, 1, 1,
0.5309227, -0.7708347, 3.059158, 0, 0, 0, 1, 1,
0.5355895, 0.3568138, 0.9794683, 0, 0, 0, 1, 1,
0.541159, -0.6550941, -0.1863486, 0, 0, 0, 1, 1,
0.5462641, -0.9124115, 0.7029322, 0, 0, 0, 1, 1,
0.5486965, -0.8733137, 3.266364, 0, 0, 0, 1, 1,
0.5582765, -0.5166721, 1.953628, 0, 0, 0, 1, 1,
0.5583822, -0.4410751, 3.00931, 0, 0, 0, 1, 1,
0.5605399, 0.1774331, 0.6178524, 1, 1, 1, 1, 1,
0.563293, -1.442589, 3.552431, 1, 1, 1, 1, 1,
0.5696201, 0.4813992, -0.2411066, 1, 1, 1, 1, 1,
0.5696747, -0.07301555, 0.5517271, 1, 1, 1, 1, 1,
0.5820675, 0.5965623, 0.8846501, 1, 1, 1, 1, 1,
0.5828549, 0.5427536, 0.9595749, 1, 1, 1, 1, 1,
0.582865, -0.1327016, 1.298122, 1, 1, 1, 1, 1,
0.5847587, -1.043464, 3.012232, 1, 1, 1, 1, 1,
0.5877251, -1.862878, 3.473223, 1, 1, 1, 1, 1,
0.5895196, -1.745498, 3.25105, 1, 1, 1, 1, 1,
0.5898887, -1.935813, 1.985653, 1, 1, 1, 1, 1,
0.590931, -0.09408052, 1.739529, 1, 1, 1, 1, 1,
0.5931372, 0.01432183, 0.2273097, 1, 1, 1, 1, 1,
0.6009325, 1.108367, 1.071625, 1, 1, 1, 1, 1,
0.6024086, 0.4549137, 0.00294603, 1, 1, 1, 1, 1,
0.6045268, 0.5914006, 2.578025, 0, 0, 1, 1, 1,
0.6136981, 0.001160304, 1.476687, 1, 0, 0, 1, 1,
0.6193515, 0.05554174, 2.350585, 1, 0, 0, 1, 1,
0.6198712, -0.007250756, 2.2956, 1, 0, 0, 1, 1,
0.6295037, 0.4609826, -1.033873, 1, 0, 0, 1, 1,
0.6311201, 0.23696, -0.06877335, 1, 0, 0, 1, 1,
0.6318051, -0.3946866, 2.702178, 0, 0, 0, 1, 1,
0.6345258, -0.8187671, 1.952999, 0, 0, 0, 1, 1,
0.6400225, -1.289032, 0.7643737, 0, 0, 0, 1, 1,
0.6411895, -0.8356744, 2.131664, 0, 0, 0, 1, 1,
0.6413179, 0.2020002, 0.8908862, 0, 0, 0, 1, 1,
0.6519246, -1.066411, 1.602919, 0, 0, 0, 1, 1,
0.6524348, 0.2679095, 0.7949526, 0, 0, 0, 1, 1,
0.6539786, -0.317009, 2.797193, 1, 1, 1, 1, 1,
0.6568522, -1.030816, 4.408841, 1, 1, 1, 1, 1,
0.6570947, 1.546347, 0.08045463, 1, 1, 1, 1, 1,
0.6573411, 0.3147737, 1.232165, 1, 1, 1, 1, 1,
0.6636913, 0.7126487, 1.571528, 1, 1, 1, 1, 1,
0.6749714, 0.8705062, 0.7947505, 1, 1, 1, 1, 1,
0.6751968, 2.744182, 1.142121, 1, 1, 1, 1, 1,
0.6754705, 0.9049849, 1.686615, 1, 1, 1, 1, 1,
0.6831723, -1.053653, 2.661456, 1, 1, 1, 1, 1,
0.6900469, 0.006439993, 1.57318, 1, 1, 1, 1, 1,
0.6919592, 0.4222335, 0.6777273, 1, 1, 1, 1, 1,
0.6919712, -1.679046, 1.581875, 1, 1, 1, 1, 1,
0.6958504, -0.0802291, 0.6575747, 1, 1, 1, 1, 1,
0.6964102, -0.4391588, 3.089071, 1, 1, 1, 1, 1,
0.698298, 1.49611, 0.9010017, 1, 1, 1, 1, 1,
0.699598, -0.06204772, 3.706117, 0, 0, 1, 1, 1,
0.7017249, -0.1848268, -0.06910935, 1, 0, 0, 1, 1,
0.7030157, 1.255214, -0.08128314, 1, 0, 0, 1, 1,
0.7036925, -0.06548341, 0.4262047, 1, 0, 0, 1, 1,
0.7061624, -1.320752, 4.522314, 1, 0, 0, 1, 1,
0.7068574, -0.5405837, 2.249038, 1, 0, 0, 1, 1,
0.7097686, -0.8397098, 2.352278, 0, 0, 0, 1, 1,
0.7101906, 1.480853, 1.212591, 0, 0, 0, 1, 1,
0.7116078, 2.574735, -0.2234461, 0, 0, 0, 1, 1,
0.7136542, -0.4827228, 3.470296, 0, 0, 0, 1, 1,
0.7171717, -0.08005781, 2.511819, 0, 0, 0, 1, 1,
0.7183567, -0.2318684, 3.350485, 0, 0, 0, 1, 1,
0.7283503, 0.2107305, 1.294875, 0, 0, 0, 1, 1,
0.7291269, 0.338205, 2.204711, 1, 1, 1, 1, 1,
0.7306166, 0.6525278, 0.6325461, 1, 1, 1, 1, 1,
0.7369601, 0.2944264, 0.6576315, 1, 1, 1, 1, 1,
0.7371049, 0.5750228, 0.8693005, 1, 1, 1, 1, 1,
0.7373313, 0.09870835, 1.750798, 1, 1, 1, 1, 1,
0.7433792, 0.4470773, 0.06664953, 1, 1, 1, 1, 1,
0.7436436, -0.1020098, 1.826734, 1, 1, 1, 1, 1,
0.7535406, 0.283853, 1.880799, 1, 1, 1, 1, 1,
0.7547224, -0.9218173, 3.838144, 1, 1, 1, 1, 1,
0.7578027, 1.144246, -0.2275261, 1, 1, 1, 1, 1,
0.7679877, 0.4679838, 1.31049, 1, 1, 1, 1, 1,
0.7681332, -0.7355446, 4.186261, 1, 1, 1, 1, 1,
0.7694551, 0.4000234, 0.2901886, 1, 1, 1, 1, 1,
0.770991, -1.19605, 2.742361, 1, 1, 1, 1, 1,
0.7714545, -1.482651, 1.974548, 1, 1, 1, 1, 1,
0.7733828, -0.3822651, 2.648299, 0, 0, 1, 1, 1,
0.7836561, -0.06774774, 1.323132, 1, 0, 0, 1, 1,
0.7848542, 1.369584, -0.8433462, 1, 0, 0, 1, 1,
0.7849492, -0.6633169, 2.837106, 1, 0, 0, 1, 1,
0.7858345, 0.5543873, -0.5376714, 1, 0, 0, 1, 1,
0.7937114, -0.8311564, 3.363748, 1, 0, 0, 1, 1,
0.79573, 2.409909, 0.2162879, 0, 0, 0, 1, 1,
0.7991613, -0.2367741, 2.011437, 0, 0, 0, 1, 1,
0.7995628, -1.496078, 2.64656, 0, 0, 0, 1, 1,
0.8072092, -1.01247, 1.820145, 0, 0, 0, 1, 1,
0.8111136, 1.278538, 2.837446, 0, 0, 0, 1, 1,
0.8136858, -1.245927, 2.421978, 0, 0, 0, 1, 1,
0.8202436, 0.6429726, 0.7486028, 0, 0, 0, 1, 1,
0.8457298, -0.6780211, 1.91544, 1, 1, 1, 1, 1,
0.8462545, 0.3089073, -0.1920386, 1, 1, 1, 1, 1,
0.8519523, -0.2670295, 2.15015, 1, 1, 1, 1, 1,
0.8532955, 0.3905126, -1.523747, 1, 1, 1, 1, 1,
0.8583195, 2.095549, -0.6586682, 1, 1, 1, 1, 1,
0.8673829, -0.6255067, 2.537062, 1, 1, 1, 1, 1,
0.8754928, 0.7527223, -0.06478636, 1, 1, 1, 1, 1,
0.8756387, -0.01749376, 1.295737, 1, 1, 1, 1, 1,
0.8762997, 0.4646744, 2.647749, 1, 1, 1, 1, 1,
0.8798178, 2.732618, -0.4213942, 1, 1, 1, 1, 1,
0.8800408, 1.134458, 0.03386464, 1, 1, 1, 1, 1,
0.8820267, 0.9633173, 1.044954, 1, 1, 1, 1, 1,
0.8855971, -1.684651, 2.008299, 1, 1, 1, 1, 1,
0.8875259, -1.203695, 2.834998, 1, 1, 1, 1, 1,
0.8901312, -0.4261844, 0.5507522, 1, 1, 1, 1, 1,
0.8967734, -1.304206, 4.438565, 0, 0, 1, 1, 1,
0.8973402, -0.440177, 1.695216, 1, 0, 0, 1, 1,
0.8982838, -1.135161, 3.597416, 1, 0, 0, 1, 1,
0.900157, 0.8521677, 3.232009, 1, 0, 0, 1, 1,
0.9044614, 0.4050451, 0.7105684, 1, 0, 0, 1, 1,
0.9072092, 0.3602673, 0.580219, 1, 0, 0, 1, 1,
0.9076443, -0.1857593, 2.085054, 0, 0, 0, 1, 1,
0.9112235, 1.763623, 1.501177, 0, 0, 0, 1, 1,
0.9146498, 0.5994869, 0.5828738, 0, 0, 0, 1, 1,
0.9186672, -1.170686, 2.035882, 0, 0, 0, 1, 1,
0.9196217, -0.05819476, 1.87761, 0, 0, 0, 1, 1,
0.9241692, 0.1543558, 1.088308, 0, 0, 0, 1, 1,
0.9279721, 0.6146003, 1.056373, 0, 0, 0, 1, 1,
0.9337727, 1.447162, -0.2093574, 1, 1, 1, 1, 1,
0.9357476, -1.24981, 3.125492, 1, 1, 1, 1, 1,
0.9411697, 0.2281398, 1.006126, 1, 1, 1, 1, 1,
0.943011, 0.3363133, 0.7865925, 1, 1, 1, 1, 1,
0.9454616, -2.019753, 2.624743, 1, 1, 1, 1, 1,
0.9487331, -0.6684113, 2.147172, 1, 1, 1, 1, 1,
0.9506029, 1.483452, 0.9185991, 1, 1, 1, 1, 1,
0.9565592, 0.03143714, 2.826773, 1, 1, 1, 1, 1,
0.9649122, -1.012622, 2.485605, 1, 1, 1, 1, 1,
0.9712573, -0.7864857, 1.80473, 1, 1, 1, 1, 1,
0.9735225, 0.3414611, 1.298214, 1, 1, 1, 1, 1,
0.9933839, -1.228096, 0.8357319, 1, 1, 1, 1, 1,
0.993752, -0.5313376, 1.377358, 1, 1, 1, 1, 1,
0.9965054, -2.10921, 2.938322, 1, 1, 1, 1, 1,
1.003796, -0.4244174, 1.134227, 1, 1, 1, 1, 1,
1.014993, 0.9823385, 0.7353227, 0, 0, 1, 1, 1,
1.019104, -1.619954, 2.772173, 1, 0, 0, 1, 1,
1.021686, 0.007580783, 1.143774, 1, 0, 0, 1, 1,
1.031265, 1.209098, 2.180779, 1, 0, 0, 1, 1,
1.039201, 0.4557798, 1.522902, 1, 0, 0, 1, 1,
1.046758, -0.7757927, 1.922292, 1, 0, 0, 1, 1,
1.053356, 0.4708672, 1.427215, 0, 0, 0, 1, 1,
1.053367, 1.426963, 1.570104, 0, 0, 0, 1, 1,
1.054021, -0.967146, 3.31407, 0, 0, 0, 1, 1,
1.061126, -1.878883, 3.120498, 0, 0, 0, 1, 1,
1.06377, -0.8688599, 0.3765166, 0, 0, 0, 1, 1,
1.065999, 1.450631, 2.084564, 0, 0, 0, 1, 1,
1.071769, -0.1817951, 0.6874167, 0, 0, 0, 1, 1,
1.074588, 1.476564, 0.4403062, 1, 1, 1, 1, 1,
1.077365, 2.374075, 1.476312, 1, 1, 1, 1, 1,
1.083023, -1.196528, 1.530088, 1, 1, 1, 1, 1,
1.085638, 1.695707, -0.8741487, 1, 1, 1, 1, 1,
1.087615, -0.7789118, 1.796228, 1, 1, 1, 1, 1,
1.091233, -0.2358586, 1.462009, 1, 1, 1, 1, 1,
1.10245, -0.1859304, 1.241417, 1, 1, 1, 1, 1,
1.110408, 0.5240927, 0.4954168, 1, 1, 1, 1, 1,
1.11074, -1.679271, 3.616883, 1, 1, 1, 1, 1,
1.117285, 1.32037, 0.9725206, 1, 1, 1, 1, 1,
1.118055, 0.493257, 1.70663, 1, 1, 1, 1, 1,
1.119037, -0.01907112, 2.412221, 1, 1, 1, 1, 1,
1.121161, 0.9359189, 0.7771581, 1, 1, 1, 1, 1,
1.125084, 0.2513601, 1.050133, 1, 1, 1, 1, 1,
1.129394, -0.5937424, 2.908562, 1, 1, 1, 1, 1,
1.129909, 1.241027, -0.09238489, 0, 0, 1, 1, 1,
1.130553, 1.032477, 0.9411485, 1, 0, 0, 1, 1,
1.142009, -0.7356675, 1.847918, 1, 0, 0, 1, 1,
1.142165, 0.02565898, 0.4188524, 1, 0, 0, 1, 1,
1.142632, 0.6764451, 2.061924, 1, 0, 0, 1, 1,
1.148448, -0.2012534, 1.318378, 1, 0, 0, 1, 1,
1.148829, -1.723872, 2.744372, 0, 0, 0, 1, 1,
1.148882, -0.01881928, 2.186276, 0, 0, 0, 1, 1,
1.148993, -0.1095487, 1.652515, 0, 0, 0, 1, 1,
1.149853, -1.308103, 1.168924, 0, 0, 0, 1, 1,
1.151433, -0.6392483, 1.300023, 0, 0, 0, 1, 1,
1.152685, 0.4559057, 2.16889, 0, 0, 0, 1, 1,
1.154102, 1.371839, -1.528817, 0, 0, 0, 1, 1,
1.154356, -1.568734, 2.323101, 1, 1, 1, 1, 1,
1.164081, -1.367489, 2.223424, 1, 1, 1, 1, 1,
1.168032, -0.963517, 1.457816, 1, 1, 1, 1, 1,
1.168127, -1.534352, 1.443185, 1, 1, 1, 1, 1,
1.18686, -1.11899, 2.834929, 1, 1, 1, 1, 1,
1.19041, -0.9632635, 3.015308, 1, 1, 1, 1, 1,
1.19706, -0.3048514, 0.6052642, 1, 1, 1, 1, 1,
1.198944, -0.3642117, 0.9101516, 1, 1, 1, 1, 1,
1.202581, 0.8598944, 0.3473145, 1, 1, 1, 1, 1,
1.203469, -0.6922225, 3.580838, 1, 1, 1, 1, 1,
1.222372, -0.1108262, 3.442168, 1, 1, 1, 1, 1,
1.229827, -0.8574074, 2.461233, 1, 1, 1, 1, 1,
1.238508, -2.375986, 2.292406, 1, 1, 1, 1, 1,
1.241322, 0.6916201, 1.157404, 1, 1, 1, 1, 1,
1.247955, -1.469655, 1.935449, 1, 1, 1, 1, 1,
1.252655, -0.921316, 2.427966, 0, 0, 1, 1, 1,
1.256084, -0.5329627, 2.827011, 1, 0, 0, 1, 1,
1.259949, 0.1565429, 0.2604582, 1, 0, 0, 1, 1,
1.263132, -1.201434, 1.798751, 1, 0, 0, 1, 1,
1.278192, -1.269649, 0.6841745, 1, 0, 0, 1, 1,
1.283153, 2.045767, -0.2748195, 1, 0, 0, 1, 1,
1.290118, 0.8258752, -0.1278903, 0, 0, 0, 1, 1,
1.301344, 0.09887245, 1.650637, 0, 0, 0, 1, 1,
1.313472, -1.292156, 2.854368, 0, 0, 0, 1, 1,
1.315453, -0.7282462, 1.638211, 0, 0, 0, 1, 1,
1.318619, -0.6571212, 1.90224, 0, 0, 0, 1, 1,
1.32112, 0.09352243, 1.029342, 0, 0, 0, 1, 1,
1.321736, -0.9288126, 3.000814, 0, 0, 0, 1, 1,
1.328647, 2.401006, -0.776359, 1, 1, 1, 1, 1,
1.331653, -0.9747137, 2.667586, 1, 1, 1, 1, 1,
1.334336, 0.2533001, -0.2439318, 1, 1, 1, 1, 1,
1.339487, -0.7534406, 1.675798, 1, 1, 1, 1, 1,
1.339614, -0.4709859, 4.201685, 1, 1, 1, 1, 1,
1.368682, 1.455464, 0.3795992, 1, 1, 1, 1, 1,
1.37101, 0.5543748, -0.1670816, 1, 1, 1, 1, 1,
1.373731, -0.5143836, 2.271172, 1, 1, 1, 1, 1,
1.378886, 0.7270452, 0.2687891, 1, 1, 1, 1, 1,
1.379795, 0.5333934, 0.03125959, 1, 1, 1, 1, 1,
1.380208, 0.5135228, -1.028051, 1, 1, 1, 1, 1,
1.387053, 1.100347, 2.085197, 1, 1, 1, 1, 1,
1.388207, -0.8425073, 0.5028725, 1, 1, 1, 1, 1,
1.397412, -0.1952982, -0.4501858, 1, 1, 1, 1, 1,
1.408716, 0.5521033, -0.3100134, 1, 1, 1, 1, 1,
1.410634, -0.1078114, 3.339018, 0, 0, 1, 1, 1,
1.411364, -0.3392979, 0.9412602, 1, 0, 0, 1, 1,
1.419549, 0.2008429, 0.6484641, 1, 0, 0, 1, 1,
1.436143, -1.086764, 2.925446, 1, 0, 0, 1, 1,
1.467691, 0.2160958, 1.44249, 1, 0, 0, 1, 1,
1.468827, 0.2368755, 1.323005, 1, 0, 0, 1, 1,
1.47346, -0.05831756, 2.705976, 0, 0, 0, 1, 1,
1.480781, -1.47679, 3.888142, 0, 0, 0, 1, 1,
1.497863, -0.8203657, 3.94943, 0, 0, 0, 1, 1,
1.508621, 0.2094439, 0.1575946, 0, 0, 0, 1, 1,
1.514011, 1.924382, 1.394576, 0, 0, 0, 1, 1,
1.533317, -1.007779, 1.254853, 0, 0, 0, 1, 1,
1.549146, 0.06980602, 1.450889, 0, 0, 0, 1, 1,
1.553544, 0.6618327, 2.087462, 1, 1, 1, 1, 1,
1.564083, -1.623399, 1.550421, 1, 1, 1, 1, 1,
1.576563, 0.9971325, 0.08034679, 1, 1, 1, 1, 1,
1.589959, -0.5439281, 1.925319, 1, 1, 1, 1, 1,
1.590249, 1.547751, 1.608181, 1, 1, 1, 1, 1,
1.594487, 0.3957945, 2.819872, 1, 1, 1, 1, 1,
1.596008, -0.988147, 2.452051, 1, 1, 1, 1, 1,
1.602765, 0.2505553, 1.10845, 1, 1, 1, 1, 1,
1.6163, -1.779071, 3.003294, 1, 1, 1, 1, 1,
1.618541, -1.776062, 2.577126, 1, 1, 1, 1, 1,
1.65507, 0.1880423, 2.910813, 1, 1, 1, 1, 1,
1.661728, -1.261253, 1.83232, 1, 1, 1, 1, 1,
1.662392, 1.795682, 1.18357, 1, 1, 1, 1, 1,
1.666373, -0.4405779, 3.014237, 1, 1, 1, 1, 1,
1.672739, -1.652656, -0.04618784, 1, 1, 1, 1, 1,
1.694077, -1.593634, 2.592247, 0, 0, 1, 1, 1,
1.758267, 0.1911172, 1.756614, 1, 0, 0, 1, 1,
1.762955, 0.9079178, -0.1987979, 1, 0, 0, 1, 1,
1.784749, 0.7991953, 0.8173849, 1, 0, 0, 1, 1,
1.790964, -0.9356645, 2.07795, 1, 0, 0, 1, 1,
1.813835, 2.094529, 2.014823, 1, 0, 0, 1, 1,
1.83305, 0.2902697, 0.670582, 0, 0, 0, 1, 1,
1.833237, 1.36091, -0.1427928, 0, 0, 0, 1, 1,
1.864572, -1.689286, 3.10579, 0, 0, 0, 1, 1,
1.87117, -1.452256, 3.411462, 0, 0, 0, 1, 1,
1.87249, -0.8068116, 0.461355, 0, 0, 0, 1, 1,
1.878888, 0.8112683, 3.670826, 0, 0, 0, 1, 1,
1.88306, 1.144256, 0.2465267, 0, 0, 0, 1, 1,
1.891131, 1.052199, 0.859826, 1, 1, 1, 1, 1,
1.939875, -0.6902165, 3.822505, 1, 1, 1, 1, 1,
1.942129, 0.1160057, 1.483767, 1, 1, 1, 1, 1,
1.956908, -1.70964, 3.206336, 1, 1, 1, 1, 1,
1.97632, 0.1385498, 0.4686783, 1, 1, 1, 1, 1,
1.979991, 0.1573128, 2.49539, 1, 1, 1, 1, 1,
1.995275, 1.051509, 1.921364, 1, 1, 1, 1, 1,
2.005564, 0.5054232, 3.286711, 1, 1, 1, 1, 1,
2.014722, -1.807676, 2.258905, 1, 1, 1, 1, 1,
2.015449, 0.04128319, 2.785333, 1, 1, 1, 1, 1,
2.06876, 0.4004103, 2.577195, 1, 1, 1, 1, 1,
2.100014, -0.0001781028, 0.9470261, 1, 1, 1, 1, 1,
2.124185, -0.7552167, 0.6111186, 1, 1, 1, 1, 1,
2.157948, 0.1957881, 1.453556, 1, 1, 1, 1, 1,
2.176768, 1.632399, 0.1672284, 1, 1, 1, 1, 1,
2.182064, -1.654039, 0.5083181, 0, 0, 1, 1, 1,
2.183003, 0.8537019, 0.4179996, 1, 0, 0, 1, 1,
2.185783, -0.04851618, 0.541688, 1, 0, 0, 1, 1,
2.226753, -0.5033072, 1.779262, 1, 0, 0, 1, 1,
2.253479, 1.24895, 1.10865, 1, 0, 0, 1, 1,
2.267276, -0.6972477, 3.961692, 1, 0, 0, 1, 1,
2.28611, 1.317096, 0.1979876, 0, 0, 0, 1, 1,
2.355796, -2.032341, 3.272447, 0, 0, 0, 1, 1,
2.362581, -1.061711, 2.975916, 0, 0, 0, 1, 1,
2.396075, -0.8723372, 1.185216, 0, 0, 0, 1, 1,
2.421583, -0.7881777, 3.183548, 0, 0, 0, 1, 1,
2.46244, 0.3667973, 1.425029, 0, 0, 0, 1, 1,
2.470066, 0.2245331, 2.562974, 0, 0, 0, 1, 1,
2.604598, 0.03614022, 1.405522, 1, 1, 1, 1, 1,
2.632883, -0.4340703, 1.168107, 1, 1, 1, 1, 1,
2.721642, 0.09028972, 0.6016437, 1, 1, 1, 1, 1,
2.722674, 0.6383059, 0.00795066, 1, 1, 1, 1, 1,
2.833526, 0.8265915, 2.249385, 1, 1, 1, 1, 1,
2.905208, 1.066307, 1.187884, 1, 1, 1, 1, 1,
3.276153, -0.2909633, 0.6579356, 1, 1, 1, 1, 1
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
var radius = 9.400816;
var distance = 33.01997;
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
mvMatrix.translate( -0.1394962, -0.01080298, 0.6016128 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.01997);
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
