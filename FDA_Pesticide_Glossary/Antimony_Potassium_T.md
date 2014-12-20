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
-3.087526, -0.5723342, -3.419843, 1, 0, 0, 1,
-2.844326, -0.2320006, -2.461591, 1, 0.007843138, 0, 1,
-2.556536, 0.4426239, -1.247589, 1, 0.01176471, 0, 1,
-2.388738, 1.35202, -2.461339, 1, 0.01960784, 0, 1,
-2.354363, 0.4270537, 0.001142463, 1, 0.02352941, 0, 1,
-2.274402, 2.440597, 0.2756667, 1, 0.03137255, 0, 1,
-2.219313, 1.544152, 0.5735132, 1, 0.03529412, 0, 1,
-2.218745, -0.9387021, -3.622482, 1, 0.04313726, 0, 1,
-2.203213, -0.1410179, -1.618753, 1, 0.04705882, 0, 1,
-2.203078, 0.3961926, -1.594399, 1, 0.05490196, 0, 1,
-2.145493, -0.2439104, -2.043401, 1, 0.05882353, 0, 1,
-2.137511, -0.3166531, -2.33023, 1, 0.06666667, 0, 1,
-2.085588, 1.416128, -2.122871, 1, 0.07058824, 0, 1,
-2.026533, 1.607128, -1.411351, 1, 0.07843138, 0, 1,
-2.026135, -0.5778198, -1.460747, 1, 0.08235294, 0, 1,
-2.015936, 0.354869, -1.225178, 1, 0.09019608, 0, 1,
-2.007076, -0.1895803, -1.716978, 1, 0.09411765, 0, 1,
-1.972269, 1.198435, 1.032924, 1, 0.1019608, 0, 1,
-1.961336, 0.8401853, -1.408838, 1, 0.1098039, 0, 1,
-1.947824, 0.3662204, -0.9548389, 1, 0.1137255, 0, 1,
-1.923521, 0.2213221, -1.575794, 1, 0.1215686, 0, 1,
-1.919238, 0.2661112, -1.203328, 1, 0.1254902, 0, 1,
-1.916086, 0.3990302, -0.5487909, 1, 0.1333333, 0, 1,
-1.904634, 0.08264183, -2.532237, 1, 0.1372549, 0, 1,
-1.898502, -0.3047341, 0.4521471, 1, 0.145098, 0, 1,
-1.89702, 0.4750935, -0.5817325, 1, 0.1490196, 0, 1,
-1.889686, -0.001711782, -3.200603, 1, 0.1568628, 0, 1,
-1.862948, -0.5119912, -1.942549, 1, 0.1607843, 0, 1,
-1.860808, -0.17123, -0.5590475, 1, 0.1686275, 0, 1,
-1.858668, 1.171194, 0.08942896, 1, 0.172549, 0, 1,
-1.858276, -2.613114, -3.827862, 1, 0.1803922, 0, 1,
-1.855651, 0.04012546, -2.14447, 1, 0.1843137, 0, 1,
-1.80676, -0.3513784, -1.800063, 1, 0.1921569, 0, 1,
-1.795365, -0.4473198, -1.583885, 1, 0.1960784, 0, 1,
-1.781199, -0.1439395, -2.858808, 1, 0.2039216, 0, 1,
-1.776536, 0.5378312, -2.166855, 1, 0.2117647, 0, 1,
-1.767492, -0.2558834, -1.936117, 1, 0.2156863, 0, 1,
-1.76256, 0.09936491, -0.9971603, 1, 0.2235294, 0, 1,
-1.760535, -1.080984, -2.742033, 1, 0.227451, 0, 1,
-1.746014, -1.61107, -2.556608, 1, 0.2352941, 0, 1,
-1.69459, -1.502963, -1.158549, 1, 0.2392157, 0, 1,
-1.688857, -1.692171, -1.165085, 1, 0.2470588, 0, 1,
-1.68691, -0.1560489, -2.728839, 1, 0.2509804, 0, 1,
-1.686129, -1.322434, -2.584645, 1, 0.2588235, 0, 1,
-1.672408, -0.2009913, -1.118971, 1, 0.2627451, 0, 1,
-1.662065, -1.379341, -2.886968, 1, 0.2705882, 0, 1,
-1.649616, -1.154733, -2.705931, 1, 0.2745098, 0, 1,
-1.647866, -0.7426017, -1.272073, 1, 0.282353, 0, 1,
-1.619903, -0.9403253, -1.347249, 1, 0.2862745, 0, 1,
-1.612829, 0.06682992, -1.231463, 1, 0.2941177, 0, 1,
-1.595608, 0.4928206, -1.441407, 1, 0.3019608, 0, 1,
-1.589481, 0.05113231, -2.253711, 1, 0.3058824, 0, 1,
-1.58296, -0.4958218, -3.003746, 1, 0.3137255, 0, 1,
-1.580644, 1.039584, -0.9676413, 1, 0.3176471, 0, 1,
-1.580321, 1.023089, -0.7652128, 1, 0.3254902, 0, 1,
-1.574726, 0.3645482, -2.062556, 1, 0.3294118, 0, 1,
-1.568862, -0.01328827, -1.368926, 1, 0.3372549, 0, 1,
-1.564793, 0.102187, -0.9016372, 1, 0.3411765, 0, 1,
-1.561135, 0.1857887, -1.248203, 1, 0.3490196, 0, 1,
-1.546946, -1.013997, -1.386056, 1, 0.3529412, 0, 1,
-1.540933, 1.347286, -0.4532336, 1, 0.3607843, 0, 1,
-1.52965, -0.2568158, -0.5458468, 1, 0.3647059, 0, 1,
-1.529638, 0.4259513, -2.459208, 1, 0.372549, 0, 1,
-1.518283, 0.3035796, -1.837128, 1, 0.3764706, 0, 1,
-1.517254, 1.418685, -2.060482, 1, 0.3843137, 0, 1,
-1.50734, 1.093006, -0.8243129, 1, 0.3882353, 0, 1,
-1.491435, -0.3835866, 0.657154, 1, 0.3960784, 0, 1,
-1.489435, -0.5449733, -2.763505, 1, 0.4039216, 0, 1,
-1.48399, 0.06964665, -2.368842, 1, 0.4078431, 0, 1,
-1.478919, -0.8533595, -2.244784, 1, 0.4156863, 0, 1,
-1.477803, -0.7608605, -1.912514, 1, 0.4196078, 0, 1,
-1.472207, -0.8148401, -2.56906, 1, 0.427451, 0, 1,
-1.47066, -0.3027996, -2.918941, 1, 0.4313726, 0, 1,
-1.469045, 1.607511, -0.4691645, 1, 0.4392157, 0, 1,
-1.455841, 0.2536976, -1.080753, 1, 0.4431373, 0, 1,
-1.441197, 0.9105688, 0.01424504, 1, 0.4509804, 0, 1,
-1.437081, -0.9816351, -1.844526, 1, 0.454902, 0, 1,
-1.430656, 0.6387765, -0.8337756, 1, 0.4627451, 0, 1,
-1.428571, -0.4059158, -2.374282, 1, 0.4666667, 0, 1,
-1.425237, -0.9202702, -0.8320809, 1, 0.4745098, 0, 1,
-1.40748, -0.05091123, -1.343686, 1, 0.4784314, 0, 1,
-1.406094, -0.9185082, -3.637565, 1, 0.4862745, 0, 1,
-1.386761, -2.415025, -1.0023, 1, 0.4901961, 0, 1,
-1.378353, 1.142251, -1.365602, 1, 0.4980392, 0, 1,
-1.369444, 0.5647364, -2.461117, 1, 0.5058824, 0, 1,
-1.369205, 0.2918917, -1.329952, 1, 0.509804, 0, 1,
-1.364968, -0.9208, 1.627951, 1, 0.5176471, 0, 1,
-1.355121, -1.009462, -1.949907, 1, 0.5215687, 0, 1,
-1.351794, 0.6555392, -1.033302, 1, 0.5294118, 0, 1,
-1.347808, 0.4169633, -0.7872918, 1, 0.5333334, 0, 1,
-1.335248, -0.7034503, -1.560472, 1, 0.5411765, 0, 1,
-1.311925, 1.286104, 2.288224, 1, 0.5450981, 0, 1,
-1.30469, -0.5150834, -0.4773746, 1, 0.5529412, 0, 1,
-1.302532, -0.382864, -2.041825, 1, 0.5568628, 0, 1,
-1.298727, -0.1967636, -3.99353, 1, 0.5647059, 0, 1,
-1.298439, -0.5064231, -1.307939, 1, 0.5686275, 0, 1,
-1.294194, -1.052095, -0.9929906, 1, 0.5764706, 0, 1,
-1.289483, 1.151857, -0.986549, 1, 0.5803922, 0, 1,
-1.283596, 1.022303, -0.139981, 1, 0.5882353, 0, 1,
-1.281254, 0.6436936, -0.4140812, 1, 0.5921569, 0, 1,
-1.27647, -1.358393, -1.367384, 1, 0.6, 0, 1,
-1.274344, 0.752553, -1.55542, 1, 0.6078432, 0, 1,
-1.273655, 1.136686, -0.9273319, 1, 0.6117647, 0, 1,
-1.264178, 0.40312, -1.472839, 1, 0.6196079, 0, 1,
-1.252068, 0.5655427, -0.151007, 1, 0.6235294, 0, 1,
-1.245987, -0.1668301, -1.373019, 1, 0.6313726, 0, 1,
-1.243514, -1.562264, -2.927731, 1, 0.6352941, 0, 1,
-1.24251, -1.694352, -2.952298, 1, 0.6431373, 0, 1,
-1.239202, 1.046293, -1.901425, 1, 0.6470588, 0, 1,
-1.232218, -0.2288975, -1.111617, 1, 0.654902, 0, 1,
-1.227199, 0.7800385, -1.171021, 1, 0.6588235, 0, 1,
-1.22689, -0.05446747, -0.3614409, 1, 0.6666667, 0, 1,
-1.226403, 1.72946, -0.8023617, 1, 0.6705883, 0, 1,
-1.224569, 1.22322, -0.07985754, 1, 0.6784314, 0, 1,
-1.220112, 1.226879, -1.113599, 1, 0.682353, 0, 1,
-1.219242, 0.7181563, -2.903149, 1, 0.6901961, 0, 1,
-1.219223, -0.2413363, -1.667426, 1, 0.6941177, 0, 1,
-1.20945, 0.7160154, -0.4048941, 1, 0.7019608, 0, 1,
-1.206833, -0.3371221, -2.354854, 1, 0.7098039, 0, 1,
-1.200075, -0.1795953, -0.8465101, 1, 0.7137255, 0, 1,
-1.18602, 0.7467852, -3.627737, 1, 0.7215686, 0, 1,
-1.184848, 0.798026, -1.883673, 1, 0.7254902, 0, 1,
-1.181408, 1.517085, 0.4073585, 1, 0.7333333, 0, 1,
-1.160407, -1.218443, -3.55964, 1, 0.7372549, 0, 1,
-1.159657, 2.031969, -1.898339, 1, 0.7450981, 0, 1,
-1.15601, 2.570093, -0.1466099, 1, 0.7490196, 0, 1,
-1.148203, -0.4185647, -1.62862, 1, 0.7568628, 0, 1,
-1.14742, -1.236439, -3.499998, 1, 0.7607843, 0, 1,
-1.143623, 1.152266, -1.05397, 1, 0.7686275, 0, 1,
-1.139892, 1.662113, -1.755837, 1, 0.772549, 0, 1,
-1.13239, -2.217379, -2.519178, 1, 0.7803922, 0, 1,
-1.132353, 0.9492963, -0.9343596, 1, 0.7843137, 0, 1,
-1.132135, -0.4045342, -1.574302, 1, 0.7921569, 0, 1,
-1.130138, 0.7593397, -1.704218, 1, 0.7960784, 0, 1,
-1.108969, -0.3877884, -2.060381, 1, 0.8039216, 0, 1,
-1.099919, -1.559782, -2.470275, 1, 0.8117647, 0, 1,
-1.098411, 0.9179335, 0.7528643, 1, 0.8156863, 0, 1,
-1.097805, 0.7625163, -2.459958, 1, 0.8235294, 0, 1,
-1.096064, -0.7610235, -0.9872068, 1, 0.827451, 0, 1,
-1.085621, 0.2781901, -1.623245, 1, 0.8352941, 0, 1,
-1.071023, 1.023718, -0.2531307, 1, 0.8392157, 0, 1,
-1.070918, -0.9908506, -3.447924, 1, 0.8470588, 0, 1,
-1.069888, 0.9380428, 0.6630799, 1, 0.8509804, 0, 1,
-1.066638, -0.9870917, -2.925172, 1, 0.8588235, 0, 1,
-1.066534, -0.9482735, -2.488268, 1, 0.8627451, 0, 1,
-1.066212, -1.365771, -3.596501, 1, 0.8705882, 0, 1,
-1.054494, -0.05756279, -0.5510678, 1, 0.8745098, 0, 1,
-1.054031, 0.2554698, -2.314059, 1, 0.8823529, 0, 1,
-1.05397, 0.6920934, -0.4141341, 1, 0.8862745, 0, 1,
-1.052794, -1.448506, -2.073394, 1, 0.8941177, 0, 1,
-1.03956, -0.4346545, -1.550265, 1, 0.8980392, 0, 1,
-1.020694, 0.7160488, 0.7756714, 1, 0.9058824, 0, 1,
-1.018814, -0.4147302, -2.532053, 1, 0.9137255, 0, 1,
-1.015503, 0.5289316, -0.7104639, 1, 0.9176471, 0, 1,
-1.003488, -1.071898, -2.843109, 1, 0.9254902, 0, 1,
-1.001565, 1.750825, -0.5020647, 1, 0.9294118, 0, 1,
-0.9997729, -0.1040998, -1.280997, 1, 0.9372549, 0, 1,
-0.9972534, -1.414875, -3.763431, 1, 0.9411765, 0, 1,
-0.9946555, -0.9915472, -3.043391, 1, 0.9490196, 0, 1,
-0.9898931, 0.5513602, 0.6071877, 1, 0.9529412, 0, 1,
-0.9789808, 1.746252, -0.4582751, 1, 0.9607843, 0, 1,
-0.9778948, -0.6446383, -1.695564, 1, 0.9647059, 0, 1,
-0.9761552, 0.984458, -0.2224908, 1, 0.972549, 0, 1,
-0.9756447, -1.521154, -2.210901, 1, 0.9764706, 0, 1,
-0.9737584, -1.655905, -2.365238, 1, 0.9843137, 0, 1,
-0.9729615, -2.32628, -3.642006, 1, 0.9882353, 0, 1,
-0.9720369, 0.6203108, -2.09168, 1, 0.9960784, 0, 1,
-0.9658953, 1.178136, -2.734983, 0.9960784, 1, 0, 1,
-0.9639769, 0.9456565, -0.08427873, 0.9921569, 1, 0, 1,
-0.9570315, -0.6093609, 0.237377, 0.9843137, 1, 0, 1,
-0.9539426, -0.2088482, -1.152336, 0.9803922, 1, 0, 1,
-0.9535512, -1.246843, -2.077938, 0.972549, 1, 0, 1,
-0.9507856, 1.193315, 0.4925099, 0.9686275, 1, 0, 1,
-0.947615, 1.681235, 0.6358452, 0.9607843, 1, 0, 1,
-0.9451739, 0.98623, -0.2694187, 0.9568627, 1, 0, 1,
-0.941375, -0.8107659, -3.301022, 0.9490196, 1, 0, 1,
-0.9358913, -0.6084284, -2.640906, 0.945098, 1, 0, 1,
-0.9351488, -1.002547, -3.178626, 0.9372549, 1, 0, 1,
-0.9339653, -0.2043106, -0.6192067, 0.9333333, 1, 0, 1,
-0.9306325, 0.6935158, -0.1958918, 0.9254902, 1, 0, 1,
-0.9303232, 2.123612, 0.8151844, 0.9215686, 1, 0, 1,
-0.9280335, 0.4835818, -1.898478, 0.9137255, 1, 0, 1,
-0.923189, -0.3013711, -2.944988, 0.9098039, 1, 0, 1,
-0.9208121, 2.262479, -2.530788, 0.9019608, 1, 0, 1,
-0.9156407, 0.8845253, -2.17272, 0.8941177, 1, 0, 1,
-0.9125628, 0.02925382, -1.734116, 0.8901961, 1, 0, 1,
-0.9087715, -1.293691, -1.695655, 0.8823529, 1, 0, 1,
-0.9050648, -0.9442477, -3.32336, 0.8784314, 1, 0, 1,
-0.9017357, 0.7776667, -1.151911, 0.8705882, 1, 0, 1,
-0.8983124, -0.8473678, -1.386365, 0.8666667, 1, 0, 1,
-0.8938699, 0.3530934, -2.657391, 0.8588235, 1, 0, 1,
-0.8906487, -0.6892443, -3.977896, 0.854902, 1, 0, 1,
-0.8894597, -0.4071878, -1.478159, 0.8470588, 1, 0, 1,
-0.8856557, -0.6355364, -3.01741, 0.8431373, 1, 0, 1,
-0.8839881, -1.417164, -3.472306, 0.8352941, 1, 0, 1,
-0.8819904, 1.045954, -1.892452, 0.8313726, 1, 0, 1,
-0.8795601, 1.864249, -1.593771, 0.8235294, 1, 0, 1,
-0.8741734, -1.490515, -1.720519, 0.8196079, 1, 0, 1,
-0.8723549, 0.358123, -0.1940796, 0.8117647, 1, 0, 1,
-0.871989, 0.1878264, -2.141573, 0.8078431, 1, 0, 1,
-0.8554119, -0.05493074, -1.455679, 0.8, 1, 0, 1,
-0.8422608, 0.7406272, -0.7146607, 0.7921569, 1, 0, 1,
-0.8396365, 0.08663532, -0.511246, 0.7882353, 1, 0, 1,
-0.8304551, -0.7051093, -3.440758, 0.7803922, 1, 0, 1,
-0.8270631, 0.7427632, -0.4811126, 0.7764706, 1, 0, 1,
-0.8132619, 1.080977, -0.2713526, 0.7686275, 1, 0, 1,
-0.8041475, -1.530719, -4.133467, 0.7647059, 1, 0, 1,
-0.8028366, -0.4729446, -2.204197, 0.7568628, 1, 0, 1,
-0.7948669, 0.9752478, -0.6873955, 0.7529412, 1, 0, 1,
-0.7932611, 1.537345, -0.8651475, 0.7450981, 1, 0, 1,
-0.7881883, -2.476099, -3.917191, 0.7411765, 1, 0, 1,
-0.7839842, -1.207291, -3.776391, 0.7333333, 1, 0, 1,
-0.7832757, -0.4732329, -2.425268, 0.7294118, 1, 0, 1,
-0.7717555, -0.6595864, -1.030489, 0.7215686, 1, 0, 1,
-0.7702858, -1.049194, -3.018685, 0.7176471, 1, 0, 1,
-0.7656441, 0.5146202, -0.5082995, 0.7098039, 1, 0, 1,
-0.7582215, 0.3838414, -1.85729, 0.7058824, 1, 0, 1,
-0.7578133, -1.340474, -3.462307, 0.6980392, 1, 0, 1,
-0.7491676, 0.7109513, -0.6900803, 0.6901961, 1, 0, 1,
-0.7485834, -1.307002, -2.571671, 0.6862745, 1, 0, 1,
-0.7485315, -0.450449, -1.328202, 0.6784314, 1, 0, 1,
-0.74442, 0.9591769, -0.1116819, 0.6745098, 1, 0, 1,
-0.7435876, -1.077647, -3.751258, 0.6666667, 1, 0, 1,
-0.7387536, -1.288224, -3.153063, 0.6627451, 1, 0, 1,
-0.7367346, -1.142329, -1.96956, 0.654902, 1, 0, 1,
-0.733227, -0.2881497, -0.9246132, 0.6509804, 1, 0, 1,
-0.7301778, 0.6240914, -1.306794, 0.6431373, 1, 0, 1,
-0.7281553, -0.02065093, -0.7673206, 0.6392157, 1, 0, 1,
-0.7190703, 1.424047, 0.01268039, 0.6313726, 1, 0, 1,
-0.7187669, -0.6571496, -2.983672, 0.627451, 1, 0, 1,
-0.7169742, 0.6059552, -0.8495119, 0.6196079, 1, 0, 1,
-0.7169127, 0.1486026, -0.6329066, 0.6156863, 1, 0, 1,
-0.7126663, 1.013052, -1.196964, 0.6078432, 1, 0, 1,
-0.7123071, -0.7614433, -3.804728, 0.6039216, 1, 0, 1,
-0.7054511, 1.217419, 0.1737829, 0.5960785, 1, 0, 1,
-0.7010354, 1.428893, -1.706815, 0.5882353, 1, 0, 1,
-0.6995444, 0.6425495, -1.222792, 0.5843138, 1, 0, 1,
-0.6983513, 1.104824, -1.630263, 0.5764706, 1, 0, 1,
-0.6846078, -0.1796755, -1.423756, 0.572549, 1, 0, 1,
-0.6803631, -0.004153915, -2.685393, 0.5647059, 1, 0, 1,
-0.6800659, 0.2688969, 0.898118, 0.5607843, 1, 0, 1,
-0.678409, 1.993624, -1.017518, 0.5529412, 1, 0, 1,
-0.6744086, -0.1264768, -2.504565, 0.5490196, 1, 0, 1,
-0.6729566, 0.1219635, -1.985043, 0.5411765, 1, 0, 1,
-0.6726869, 1.685674, 1.315943, 0.5372549, 1, 0, 1,
-0.6725598, -0.3069631, -2.044933, 0.5294118, 1, 0, 1,
-0.6694382, -0.603748, -1.368899, 0.5254902, 1, 0, 1,
-0.6685372, -1.244922, -1.140471, 0.5176471, 1, 0, 1,
-0.6684471, 0.6356579, 0.0005668032, 0.5137255, 1, 0, 1,
-0.6671248, 0.01011526, -0.7388817, 0.5058824, 1, 0, 1,
-0.665427, -1.4301, -3.934907, 0.5019608, 1, 0, 1,
-0.6613034, -0.1600545, -2.42833, 0.4941176, 1, 0, 1,
-0.6528246, -0.8572454, -1.302275, 0.4862745, 1, 0, 1,
-0.6490459, -0.2432299, -2.279075, 0.4823529, 1, 0, 1,
-0.6439474, -1.128269, -3.716749, 0.4745098, 1, 0, 1,
-0.6426079, -0.1071764, -2.699279, 0.4705882, 1, 0, 1,
-0.6355291, 0.3341625, -1.306699, 0.4627451, 1, 0, 1,
-0.6333687, -1.131331, -4.987398, 0.4588235, 1, 0, 1,
-0.6207076, 0.07118281, -2.250822, 0.4509804, 1, 0, 1,
-0.6201659, 0.2382468, 0.9449, 0.4470588, 1, 0, 1,
-0.6157996, -2.835171, -4.168474, 0.4392157, 1, 0, 1,
-0.6101202, 0.574882, 1.501624, 0.4352941, 1, 0, 1,
-0.6052215, 0.5555457, -2.07128, 0.427451, 1, 0, 1,
-0.6002123, -0.5201122, -2.797613, 0.4235294, 1, 0, 1,
-0.5987649, -0.3956704, -1.462026, 0.4156863, 1, 0, 1,
-0.5985065, -0.2792937, -3.65086, 0.4117647, 1, 0, 1,
-0.5975612, 0.17114, -1.635238, 0.4039216, 1, 0, 1,
-0.5937334, 0.2436136, -2.92978, 0.3960784, 1, 0, 1,
-0.5838993, 0.9862871, -0.8565609, 0.3921569, 1, 0, 1,
-0.5785983, -0.8633561, -2.707291, 0.3843137, 1, 0, 1,
-0.5780298, -0.07726116, 0.6730696, 0.3803922, 1, 0, 1,
-0.5691415, -1.152181, -3.950065, 0.372549, 1, 0, 1,
-0.5687053, -0.7679661, -3.376765, 0.3686275, 1, 0, 1,
-0.5685487, -0.8671449, -1.403655, 0.3607843, 1, 0, 1,
-0.5684236, 0.2510142, -0.949706, 0.3568628, 1, 0, 1,
-0.564742, 0.6731005, -1.416463, 0.3490196, 1, 0, 1,
-0.5611096, 1.863339, 1.088467, 0.345098, 1, 0, 1,
-0.5539869, 0.8482708, -0.8305007, 0.3372549, 1, 0, 1,
-0.5494459, 0.2782475, -1.085481, 0.3333333, 1, 0, 1,
-0.5484456, 0.4285146, -1.209029, 0.3254902, 1, 0, 1,
-0.5478847, 1.202621, -1.520284, 0.3215686, 1, 0, 1,
-0.5471785, 0.5186465, 0.2440099, 0.3137255, 1, 0, 1,
-0.5438461, -0.5387608, -2.065988, 0.3098039, 1, 0, 1,
-0.5404905, 0.5159984, -0.4444319, 0.3019608, 1, 0, 1,
-0.540233, 2.545977, -0.0726973, 0.2941177, 1, 0, 1,
-0.5376717, -0.9454846, -2.435566, 0.2901961, 1, 0, 1,
-0.5365441, -0.5429242, -4.000931, 0.282353, 1, 0, 1,
-0.532685, 0.756206, 0.6891975, 0.2784314, 1, 0, 1,
-0.52382, 0.5881472, -0.9628733, 0.2705882, 1, 0, 1,
-0.5219575, -0.03402653, -2.361633, 0.2666667, 1, 0, 1,
-0.5205794, -1.427526, -3.771481, 0.2588235, 1, 0, 1,
-0.516481, 0.1758167, -0.02031196, 0.254902, 1, 0, 1,
-0.5158341, 0.9437702, -0.4158437, 0.2470588, 1, 0, 1,
-0.5140536, -0.4786453, -1.096464, 0.2431373, 1, 0, 1,
-0.5117948, -0.9162003, -3.294426, 0.2352941, 1, 0, 1,
-0.5104385, 0.9159482, 0.8739486, 0.2313726, 1, 0, 1,
-0.506039, 1.259601, -1.878783, 0.2235294, 1, 0, 1,
-0.5045909, 1.537219, -1.70928, 0.2196078, 1, 0, 1,
-0.5043513, 0.02324412, -3.562112, 0.2117647, 1, 0, 1,
-0.4945414, 0.02317353, -2.389861, 0.2078431, 1, 0, 1,
-0.4940001, 1.120017, -0.7382685, 0.2, 1, 0, 1,
-0.4926419, 1.178305, -1.579561, 0.1921569, 1, 0, 1,
-0.4904137, 0.9782896, -0.6522422, 0.1882353, 1, 0, 1,
-0.4780276, 1.934628, -1.588686, 0.1803922, 1, 0, 1,
-0.4660148, 1.012406, -1.754695, 0.1764706, 1, 0, 1,
-0.4654059, 0.577504, -0.408154, 0.1686275, 1, 0, 1,
-0.4647297, 1.064854, -0.1387592, 0.1647059, 1, 0, 1,
-0.4644312, 0.1487901, -2.471157, 0.1568628, 1, 0, 1,
-0.4608838, -0.3092166, -1.591851, 0.1529412, 1, 0, 1,
-0.4607481, -0.04297705, -2.696982, 0.145098, 1, 0, 1,
-0.4584071, -1.150571, -3.425133, 0.1411765, 1, 0, 1,
-0.4551564, -1.712092, -3.151479, 0.1333333, 1, 0, 1,
-0.4516838, -0.0746211, -1.059202, 0.1294118, 1, 0, 1,
-0.4515911, 0.1179567, 0.3416433, 0.1215686, 1, 0, 1,
-0.4487481, -0.6069244, -3.468266, 0.1176471, 1, 0, 1,
-0.4422936, -1.266099, -1.510451, 0.1098039, 1, 0, 1,
-0.4402819, 2.591808, -1.795063, 0.1058824, 1, 0, 1,
-0.4339615, -0.1805613, -1.908188, 0.09803922, 1, 0, 1,
-0.4338306, 2.043739, -0.7043439, 0.09019608, 1, 0, 1,
-0.4325936, -0.02320732, -1.16944, 0.08627451, 1, 0, 1,
-0.4305083, 0.6062003, -0.1579068, 0.07843138, 1, 0, 1,
-0.4277402, 0.9543154, -0.522925, 0.07450981, 1, 0, 1,
-0.4264592, 0.01755582, -2.195009, 0.06666667, 1, 0, 1,
-0.4171811, -0.05915756, -1.754235, 0.0627451, 1, 0, 1,
-0.416764, 0.4261504, -0.1446172, 0.05490196, 1, 0, 1,
-0.414676, 0.675478, -0.7265511, 0.05098039, 1, 0, 1,
-0.4077598, -0.3647015, 0.09317083, 0.04313726, 1, 0, 1,
-0.4013592, 0.7389532, -1.131259, 0.03921569, 1, 0, 1,
-0.4010636, -1.445145, -3.778748, 0.03137255, 1, 0, 1,
-0.3963133, 0.3946635, -3.859155, 0.02745098, 1, 0, 1,
-0.3955827, 1.099201, 1.037547, 0.01960784, 1, 0, 1,
-0.3944246, 2.979317, -0.4869024, 0.01568628, 1, 0, 1,
-0.3942741, -0.08767016, -2.254982, 0.007843138, 1, 0, 1,
-0.393829, 1.429216, 1.069413, 0.003921569, 1, 0, 1,
-0.3881245, -0.1058793, -0.8591444, 0, 1, 0.003921569, 1,
-0.3855936, 1.511864, -2.631766, 0, 1, 0.01176471, 1,
-0.3855565, 0.849085, 0.344289, 0, 1, 0.01568628, 1,
-0.3846252, 1.206512, 0.8132757, 0, 1, 0.02352941, 1,
-0.3827431, 1.463058, -0.932677, 0, 1, 0.02745098, 1,
-0.3827055, -0.9343812, -3.40808, 0, 1, 0.03529412, 1,
-0.3794105, -1.24354, -2.827377, 0, 1, 0.03921569, 1,
-0.377993, 0.358862, -0.5321202, 0, 1, 0.04705882, 1,
-0.3773128, 1.527009, -0.07879736, 0, 1, 0.05098039, 1,
-0.3740931, -0.1906686, -1.431278, 0, 1, 0.05882353, 1,
-0.3646224, 0.964143, 0.5727547, 0, 1, 0.0627451, 1,
-0.3644637, -0.4327899, -2.314718, 0, 1, 0.07058824, 1,
-0.3636303, -2.503302, -3.725948, 0, 1, 0.07450981, 1,
-0.3519494, 0.9074973, -0.2816377, 0, 1, 0.08235294, 1,
-0.3508953, 1.264799, -1.697202, 0, 1, 0.08627451, 1,
-0.3507556, -0.3355196, -3.245072, 0, 1, 0.09411765, 1,
-0.3503724, 1.396577, -0.1242499, 0, 1, 0.1019608, 1,
-0.3484856, -2.297637, -2.030155, 0, 1, 0.1058824, 1,
-0.3475813, -1.589513, -1.725447, 0, 1, 0.1137255, 1,
-0.3475129, -0.4535875, -3.352193, 0, 1, 0.1176471, 1,
-0.3429521, 0.06242794, -0.253902, 0, 1, 0.1254902, 1,
-0.342364, 0.7614781, -0.2636254, 0, 1, 0.1294118, 1,
-0.3410562, 1.261146, -2.135386, 0, 1, 0.1372549, 1,
-0.3295783, 0.8749032, -0.7433634, 0, 1, 0.1411765, 1,
-0.3208084, 0.04557085, -2.383107, 0, 1, 0.1490196, 1,
-0.3121439, -0.9334067, -2.874267, 0, 1, 0.1529412, 1,
-0.305931, 0.4559118, -0.2195587, 0, 1, 0.1607843, 1,
-0.3027261, -0.349017, -2.267265, 0, 1, 0.1647059, 1,
-0.2973466, 0.1785857, -0.9514943, 0, 1, 0.172549, 1,
-0.2961121, -1.416722, -2.640121, 0, 1, 0.1764706, 1,
-0.2957779, -0.8120517, -0.7352977, 0, 1, 0.1843137, 1,
-0.2861751, 0.8064699, 0.1224866, 0, 1, 0.1882353, 1,
-0.2858718, 1.033656, -0.8856609, 0, 1, 0.1960784, 1,
-0.2844871, 0.997238, -0.1170318, 0, 1, 0.2039216, 1,
-0.2844343, 1.67499, 0.8517527, 0, 1, 0.2078431, 1,
-0.2782675, 0.5302916, -0.6166828, 0, 1, 0.2156863, 1,
-0.275003, -2.153133, -4.019384, 0, 1, 0.2196078, 1,
-0.2692659, -2.022889, -4.962955, 0, 1, 0.227451, 1,
-0.2602663, 0.3106434, -0.865769, 0, 1, 0.2313726, 1,
-0.2602237, -0.3727069, -2.378143, 0, 1, 0.2392157, 1,
-0.256867, 0.04283836, -1.366341, 0, 1, 0.2431373, 1,
-0.2503042, -0.1949761, -3.234908, 0, 1, 0.2509804, 1,
-0.248574, -0.6058822, -2.994983, 0, 1, 0.254902, 1,
-0.2484126, 0.8073589, 0.3922896, 0, 1, 0.2627451, 1,
-0.2462381, 1.305248, 3.103149, 0, 1, 0.2666667, 1,
-0.245419, 1.648225, -1.2481, 0, 1, 0.2745098, 1,
-0.244701, -1.073533, -3.328082, 0, 1, 0.2784314, 1,
-0.2426345, -0.6137596, -2.649181, 0, 1, 0.2862745, 1,
-0.2382602, 0.9199387, 1.377434, 0, 1, 0.2901961, 1,
-0.233259, 1.190179, -0.8531362, 0, 1, 0.2980392, 1,
-0.2332275, 0.2178059, 0.1647552, 0, 1, 0.3058824, 1,
-0.2194436, 0.8141233, 2.339876, 0, 1, 0.3098039, 1,
-0.2158981, -2.185525, -3.355654, 0, 1, 0.3176471, 1,
-0.2095372, -1.038871, -3.927393, 0, 1, 0.3215686, 1,
-0.20907, 1.62927, 1.053039, 0, 1, 0.3294118, 1,
-0.2078471, 0.6905627, 0.04669993, 0, 1, 0.3333333, 1,
-0.2061601, 1.239312, -1.587704, 0, 1, 0.3411765, 1,
-0.20513, -1.591719, -4.734126, 0, 1, 0.345098, 1,
-0.2034534, 1.390437, -0.2982976, 0, 1, 0.3529412, 1,
-0.2021913, 1.15337, -0.7048661, 0, 1, 0.3568628, 1,
-0.1969517, -0.5278029, -2.890824, 0, 1, 0.3647059, 1,
-0.1959506, 0.004968744, -0.7639498, 0, 1, 0.3686275, 1,
-0.1942196, -0.9055104, -1.879251, 0, 1, 0.3764706, 1,
-0.1937847, -1.12057, -4.079113, 0, 1, 0.3803922, 1,
-0.1935479, -0.3861839, -1.430306, 0, 1, 0.3882353, 1,
-0.1924641, -0.02703775, -0.8566567, 0, 1, 0.3921569, 1,
-0.1916356, -0.09037275, -1.628229, 0, 1, 0.4, 1,
-0.1908641, -0.3413928, -3.324363, 0, 1, 0.4078431, 1,
-0.1868684, 0.8301554, -0.6953894, 0, 1, 0.4117647, 1,
-0.1867433, 1.122957, -0.6522301, 0, 1, 0.4196078, 1,
-0.1867419, 0.02761914, -1.999322, 0, 1, 0.4235294, 1,
-0.186634, -0.5622302, -2.022244, 0, 1, 0.4313726, 1,
-0.1842381, -2.163946, -4.199074, 0, 1, 0.4352941, 1,
-0.1780012, -1.605721, -5.330215, 0, 1, 0.4431373, 1,
-0.177994, 0.6412309, -1.031872, 0, 1, 0.4470588, 1,
-0.1777198, -1.153734, -3.157165, 0, 1, 0.454902, 1,
-0.1774679, 0.9041606, -0.3166018, 0, 1, 0.4588235, 1,
-0.1697271, 0.3888389, 0.447041, 0, 1, 0.4666667, 1,
-0.1624278, 0.1466412, -1.571503, 0, 1, 0.4705882, 1,
-0.1597474, -0.7453334, -1.480938, 0, 1, 0.4784314, 1,
-0.1596575, -0.393237, -2.980568, 0, 1, 0.4823529, 1,
-0.1561876, -0.1744452, -2.710465, 0, 1, 0.4901961, 1,
-0.1534746, 1.403969, -0.1943148, 0, 1, 0.4941176, 1,
-0.1527712, 0.1687479, -2.327415, 0, 1, 0.5019608, 1,
-0.1443982, -0.5647867, -3.062644, 0, 1, 0.509804, 1,
-0.1442935, 0.8174226, -0.06169437, 0, 1, 0.5137255, 1,
-0.1434417, -0.009210835, -1.594197, 0, 1, 0.5215687, 1,
-0.1429, -0.855313, -2.975903, 0, 1, 0.5254902, 1,
-0.1402536, -0.6697175, -2.902139, 0, 1, 0.5333334, 1,
-0.1397758, 1.381936, 0.3811595, 0, 1, 0.5372549, 1,
-0.1381348, -0.1917649, -2.921169, 0, 1, 0.5450981, 1,
-0.1361442, -0.2942365, -2.737478, 0, 1, 0.5490196, 1,
-0.1335618, -1.476149, -3.706767, 0, 1, 0.5568628, 1,
-0.1334514, -0.8145897, -2.324982, 0, 1, 0.5607843, 1,
-0.1322783, 1.181787, -0.415237, 0, 1, 0.5686275, 1,
-0.1288716, -0.1248988, -2.013436, 0, 1, 0.572549, 1,
-0.1256282, 1.414738, -0.1660162, 0, 1, 0.5803922, 1,
-0.1238687, 0.2318267, 1.399944, 0, 1, 0.5843138, 1,
-0.1227961, 1.14132, -0.1935825, 0, 1, 0.5921569, 1,
-0.1194732, -1.450271, -2.247278, 0, 1, 0.5960785, 1,
-0.1143564, 0.4039145, 1.608916, 0, 1, 0.6039216, 1,
-0.1116795, -2.484616, -2.460149, 0, 1, 0.6117647, 1,
-0.1067245, -1.401239, -5.191536, 0, 1, 0.6156863, 1,
-0.1057818, 1.049433, 0.2002381, 0, 1, 0.6235294, 1,
-0.1015982, 1.357132, 1.800187, 0, 1, 0.627451, 1,
-0.0972839, -1.458972, -3.085296, 0, 1, 0.6352941, 1,
-0.09647459, -1.088301, -2.855832, 0, 1, 0.6392157, 1,
-0.09613831, 0.7063759, 0.5022159, 0, 1, 0.6470588, 1,
-0.095247, 1.142446, -0.621551, 0, 1, 0.6509804, 1,
-0.09488447, -0.4579899, -2.307415, 0, 1, 0.6588235, 1,
-0.09391727, 0.2348744, -1.8268, 0, 1, 0.6627451, 1,
-0.09294599, -0.3975834, -3.315375, 0, 1, 0.6705883, 1,
-0.09099563, 0.2038048, -0.4541074, 0, 1, 0.6745098, 1,
-0.08939815, -0.5658789, -2.364552, 0, 1, 0.682353, 1,
-0.08762808, -1.336441, -1.774229, 0, 1, 0.6862745, 1,
-0.08262122, -0.9967211, -1.130581, 0, 1, 0.6941177, 1,
-0.07842234, 2.224406, -0.9194876, 0, 1, 0.7019608, 1,
-0.07810964, -0.5110092, -2.381179, 0, 1, 0.7058824, 1,
-0.07566708, -0.2158474, -1.64508, 0, 1, 0.7137255, 1,
-0.07519607, -1.025306, -1.411343, 0, 1, 0.7176471, 1,
-0.07509591, 0.6201591, -0.2568723, 0, 1, 0.7254902, 1,
-0.07403495, -0.05084963, -2.431676, 0, 1, 0.7294118, 1,
-0.07312945, -0.05258767, -1.456615, 0, 1, 0.7372549, 1,
-0.07091138, 0.8129308, 0.01970935, 0, 1, 0.7411765, 1,
-0.06634546, -1.22388, -3.599545, 0, 1, 0.7490196, 1,
-0.06483079, 0.357218, 1.243237, 0, 1, 0.7529412, 1,
-0.06469301, 0.2158462, 0.2758052, 0, 1, 0.7607843, 1,
-0.059464, 0.5977877, -0.4065966, 0, 1, 0.7647059, 1,
-0.05752417, -0.2672825, -3.949058, 0, 1, 0.772549, 1,
-0.05496467, -1.18411, -0.6453352, 0, 1, 0.7764706, 1,
-0.05183096, 1.268273, -1.302329, 0, 1, 0.7843137, 1,
-0.04879926, -0.2529805, -2.42622, 0, 1, 0.7882353, 1,
-0.04774746, 0.1859307, -0.3736945, 0, 1, 0.7960784, 1,
-0.04730458, -0.3473437, -3.683851, 0, 1, 0.8039216, 1,
-0.04224131, 0.5975391, -0.5902067, 0, 1, 0.8078431, 1,
-0.04189843, 0.3496124, 1.461234, 0, 1, 0.8156863, 1,
-0.04084055, -1.44925, -2.039559, 0, 1, 0.8196079, 1,
-0.04028117, -0.6548725, -4.503319, 0, 1, 0.827451, 1,
-0.03933092, 1.474886, -0.1838629, 0, 1, 0.8313726, 1,
-0.03764362, -0.6295782, -3.608844, 0, 1, 0.8392157, 1,
-0.03588, 1.018387, -0.4034862, 0, 1, 0.8431373, 1,
-0.03164906, 0.2406633, 0.3468146, 0, 1, 0.8509804, 1,
-0.02689078, 0.1610709, -1.363888, 0, 1, 0.854902, 1,
-0.02281531, -0.1413939, -4.026917, 0, 1, 0.8627451, 1,
-0.02202591, -0.890286, -4.309323, 0, 1, 0.8666667, 1,
-0.01957866, -1.093557, -1.63252, 0, 1, 0.8745098, 1,
-0.01743513, -0.1182212, -2.979637, 0, 1, 0.8784314, 1,
-0.01576973, -0.982514, -3.309373, 0, 1, 0.8862745, 1,
-0.01496487, -0.1034044, -3.339334, 0, 1, 0.8901961, 1,
-0.01399139, -0.5208557, 0.1653584, 0, 1, 0.8980392, 1,
-0.01375384, 1.949608, -0.9417819, 0, 1, 0.9058824, 1,
-0.01044982, -1.366744, -2.552452, 0, 1, 0.9098039, 1,
-0.008991863, -0.1731466, -3.943989, 0, 1, 0.9176471, 1,
-0.004759727, -0.6621373, -3.488011, 0, 1, 0.9215686, 1,
-0.000178142, -0.2225321, -2.567625, 0, 1, 0.9294118, 1,
0.005573244, 0.04598848, -0.8875029, 0, 1, 0.9333333, 1,
0.009278222, -1.514833, 2.682315, 0, 1, 0.9411765, 1,
0.01151265, -1.649545, 2.189523, 0, 1, 0.945098, 1,
0.01160552, 1.099267, -0.187004, 0, 1, 0.9529412, 1,
0.01292568, -0.5834668, 3.515192, 0, 1, 0.9568627, 1,
0.01696136, -2.111656, 1.800671, 0, 1, 0.9647059, 1,
0.01796048, -1.494533, 2.190253, 0, 1, 0.9686275, 1,
0.0184307, 0.9076676, -0.451842, 0, 1, 0.9764706, 1,
0.01850049, -0.9311011, 3.739623, 0, 1, 0.9803922, 1,
0.02127309, 0.6021588, 0.2542876, 0, 1, 0.9882353, 1,
0.02614572, -0.1492133, 1.942763, 0, 1, 0.9921569, 1,
0.03198459, -1.29569, 2.323513, 0, 1, 1, 1,
0.03220075, -1.426613, 1.113722, 0, 0.9921569, 1, 1,
0.03299255, -1.350489, 3.906823, 0, 0.9882353, 1, 1,
0.03927606, -0.4455582, 4.61801, 0, 0.9803922, 1, 1,
0.04062498, -0.5558982, 4.181615, 0, 0.9764706, 1, 1,
0.04386691, -0.09800154, 2.732557, 0, 0.9686275, 1, 1,
0.0445663, 0.6540557, 0.9274195, 0, 0.9647059, 1, 1,
0.04580536, 0.7974851, 2.120543, 0, 0.9568627, 1, 1,
0.04724077, 0.9028308, 0.9651775, 0, 0.9529412, 1, 1,
0.0483816, 2.152321, -0.3373903, 0, 0.945098, 1, 1,
0.04894409, 0.5292079, -1.583238, 0, 0.9411765, 1, 1,
0.05096209, 0.208728, 1.862586, 0, 0.9333333, 1, 1,
0.0532088, -1.002501, 2.961236, 0, 0.9294118, 1, 1,
0.05509794, -0.2254287, 3.404404, 0, 0.9215686, 1, 1,
0.05824661, 0.5379037, -0.6509468, 0, 0.9176471, 1, 1,
0.05982315, -1.095349, 2.638798, 0, 0.9098039, 1, 1,
0.06289022, 0.8821077, 0.3452569, 0, 0.9058824, 1, 1,
0.06479835, 1.589731, 1.037502, 0, 0.8980392, 1, 1,
0.06763595, -0.5718164, 1.747552, 0, 0.8901961, 1, 1,
0.06815205, -0.5232044, 2.928128, 0, 0.8862745, 1, 1,
0.06935218, -0.6275286, 2.901683, 0, 0.8784314, 1, 1,
0.06973527, -1.102224, 3.965325, 0, 0.8745098, 1, 1,
0.07322013, -0.4241258, 2.567994, 0, 0.8666667, 1, 1,
0.07425257, 0.7458467, -0.5429581, 0, 0.8627451, 1, 1,
0.07628491, -0.1499174, 1.528426, 0, 0.854902, 1, 1,
0.07686876, 0.9453673, -0.6873391, 0, 0.8509804, 1, 1,
0.07876819, -1.631909, 3.684907, 0, 0.8431373, 1, 1,
0.07945528, -2.323777, 3.058346, 0, 0.8392157, 1, 1,
0.07955756, 0.9429115, -0.5232028, 0, 0.8313726, 1, 1,
0.08097087, 1.020061, -0.6833162, 0, 0.827451, 1, 1,
0.08304597, -0.1989344, 3.831136, 0, 0.8196079, 1, 1,
0.0845091, -0.5472134, 3.700301, 0, 0.8156863, 1, 1,
0.09156227, -1.767656, 2.083143, 0, 0.8078431, 1, 1,
0.0922257, -0.1677765, 2.648364, 0, 0.8039216, 1, 1,
0.09306554, 0.6743, 0.1828906, 0, 0.7960784, 1, 1,
0.09688136, 0.4257832, -0.8461244, 0, 0.7882353, 1, 1,
0.09690619, 2.674863, -0.9867724, 0, 0.7843137, 1, 1,
0.09706755, 0.3732549, -2.151673, 0, 0.7764706, 1, 1,
0.09801903, 0.04655593, 1.530845, 0, 0.772549, 1, 1,
0.0993037, 0.3099398, 1.105655, 0, 0.7647059, 1, 1,
0.1002192, -1.267522, 4.009307, 0, 0.7607843, 1, 1,
0.1004741, 0.9456265, -0.5804959, 0, 0.7529412, 1, 1,
0.1009827, -0.9058117, 2.686637, 0, 0.7490196, 1, 1,
0.1016189, -2.077226, 1.97793, 0, 0.7411765, 1, 1,
0.1017377, -3.340881, 1.633267, 0, 0.7372549, 1, 1,
0.1035107, -1.156361, 4.198291, 0, 0.7294118, 1, 1,
0.1099314, 0.08258484, -0.2127159, 0, 0.7254902, 1, 1,
0.1099521, -0.9537586, 4.395058, 0, 0.7176471, 1, 1,
0.1131106, -0.827674, 4.848753, 0, 0.7137255, 1, 1,
0.1150554, 0.3353252, -0.9607481, 0, 0.7058824, 1, 1,
0.1155142, -0.9667912, 3.282764, 0, 0.6980392, 1, 1,
0.1158319, -1.508617, 3.404706, 0, 0.6941177, 1, 1,
0.1167602, 0.3234145, 1.47198, 0, 0.6862745, 1, 1,
0.1192907, 0.2303002, -0.1707373, 0, 0.682353, 1, 1,
0.1201004, -0.3237055, 1.589576, 0, 0.6745098, 1, 1,
0.1209257, 0.7779999, -0.09857061, 0, 0.6705883, 1, 1,
0.1232891, -0.001682041, 0.2933063, 0, 0.6627451, 1, 1,
0.1251233, -0.320614, 3.588409, 0, 0.6588235, 1, 1,
0.1267352, 0.8152547, 0.6916213, 0, 0.6509804, 1, 1,
0.1281782, 0.5342192, 1.333401, 0, 0.6470588, 1, 1,
0.1314442, 0.1358808, 0.9658906, 0, 0.6392157, 1, 1,
0.131604, -0.02158308, 1.336313, 0, 0.6352941, 1, 1,
0.1340337, -0.3185881, 2.960294, 0, 0.627451, 1, 1,
0.1365818, -0.861195, 4.764914, 0, 0.6235294, 1, 1,
0.1410641, -1.52335, 3.510218, 0, 0.6156863, 1, 1,
0.1432776, 0.7581751, -0.9605422, 0, 0.6117647, 1, 1,
0.1444526, 0.1454213, 0.7075427, 0, 0.6039216, 1, 1,
0.1467646, -0.5322962, 2.033454, 0, 0.5960785, 1, 1,
0.1522388, 0.4974283, 0.9635706, 0, 0.5921569, 1, 1,
0.1550153, 0.9663562, 0.2396636, 0, 0.5843138, 1, 1,
0.1558986, 1.595273, 0.7362456, 0, 0.5803922, 1, 1,
0.1560654, -1.15777, 2.056877, 0, 0.572549, 1, 1,
0.1600205, -1.150378, 1.731692, 0, 0.5686275, 1, 1,
0.1656519, 0.9075837, 1.949385, 0, 0.5607843, 1, 1,
0.1662704, 1.029523, 0.9652394, 0, 0.5568628, 1, 1,
0.1687336, 0.09231869, -0.250879, 0, 0.5490196, 1, 1,
0.1693828, -0.5840532, 3.593121, 0, 0.5450981, 1, 1,
0.1710209, 1.266492, -0.8339791, 0, 0.5372549, 1, 1,
0.1741503, 1.594828, 0.2790046, 0, 0.5333334, 1, 1,
0.1786489, -1.211362, 2.542489, 0, 0.5254902, 1, 1,
0.1798948, 0.2603548, -0.6197503, 0, 0.5215687, 1, 1,
0.1829294, 0.1890205, 0.7776152, 0, 0.5137255, 1, 1,
0.1860565, 0.01611028, 2.513602, 0, 0.509804, 1, 1,
0.1861171, -2.393336, 2.532935, 0, 0.5019608, 1, 1,
0.1863512, 0.7535605, 1.643529, 0, 0.4941176, 1, 1,
0.187224, 0.06878846, 1.247272, 0, 0.4901961, 1, 1,
0.1877204, -0.01792486, 1.267631, 0, 0.4823529, 1, 1,
0.1904286, -0.1282513, 1.539097, 0, 0.4784314, 1, 1,
0.1921147, 0.6135496, -0.7819981, 0, 0.4705882, 1, 1,
0.2013711, -1.358136, 2.964683, 0, 0.4666667, 1, 1,
0.2017447, 1.928594, 0.4761977, 0, 0.4588235, 1, 1,
0.2017936, -1.526581, 3.83374, 0, 0.454902, 1, 1,
0.2090762, 1.258296, 0.2409316, 0, 0.4470588, 1, 1,
0.2106498, -0.5685606, 1.611631, 0, 0.4431373, 1, 1,
0.2128705, -0.9271262, 3.23766, 0, 0.4352941, 1, 1,
0.2167854, -0.08424287, 2.501874, 0, 0.4313726, 1, 1,
0.2190075, -0.335523, 2.097593, 0, 0.4235294, 1, 1,
0.221577, -0.6310261, 4.241356, 0, 0.4196078, 1, 1,
0.2241997, -0.6389419, 2.581289, 0, 0.4117647, 1, 1,
0.2255124, 0.5168219, -0.7331607, 0, 0.4078431, 1, 1,
0.227869, 0.4626794, 0.7888781, 0, 0.4, 1, 1,
0.2329612, -0.1584001, 3.084421, 0, 0.3921569, 1, 1,
0.2389191, -1.134615, 4.643631, 0, 0.3882353, 1, 1,
0.2404833, 1.950577, -1.148274, 0, 0.3803922, 1, 1,
0.244242, 1.93137, 0.2182433, 0, 0.3764706, 1, 1,
0.2466241, -1.758873, 5.002069, 0, 0.3686275, 1, 1,
0.2486352, 0.8937641, -0.3129941, 0, 0.3647059, 1, 1,
0.2559433, 0.3395122, 1.646453, 0, 0.3568628, 1, 1,
0.256852, 0.02459057, 0.3357103, 0, 0.3529412, 1, 1,
0.2570572, 1.453035, 0.3787959, 0, 0.345098, 1, 1,
0.2571354, 0.2528461, -1.142611, 0, 0.3411765, 1, 1,
0.259358, 0.186171, 0.686746, 0, 0.3333333, 1, 1,
0.2836719, -0.2146001, 3.304752, 0, 0.3294118, 1, 1,
0.2856247, -0.7056454, 4.810375, 0, 0.3215686, 1, 1,
0.2884299, -0.543022, 2.184484, 0, 0.3176471, 1, 1,
0.2888254, -0.3180341, 2.165989, 0, 0.3098039, 1, 1,
0.2894224, -0.7125785, 2.124941, 0, 0.3058824, 1, 1,
0.2898642, 1.116516, 0.6462429, 0, 0.2980392, 1, 1,
0.2985935, -0.2586489, 2.872645, 0, 0.2901961, 1, 1,
0.3043132, -0.9123175, 2.718503, 0, 0.2862745, 1, 1,
0.3076306, 1.002454, 0.710129, 0, 0.2784314, 1, 1,
0.3079957, -1.925815, 3.519248, 0, 0.2745098, 1, 1,
0.310077, 0.8365887, 1.435733, 0, 0.2666667, 1, 1,
0.3139891, 0.08327414, 0.5172888, 0, 0.2627451, 1, 1,
0.3154913, 0.8477129, 3.212825, 0, 0.254902, 1, 1,
0.318587, -0.4057273, 1.799717, 0, 0.2509804, 1, 1,
0.3188093, -0.4713053, 3.755859, 0, 0.2431373, 1, 1,
0.3204628, -0.8168727, 1.441002, 0, 0.2392157, 1, 1,
0.3211432, 1.538868, -0.3347035, 0, 0.2313726, 1, 1,
0.3231575, -1.523991, 4.001152, 0, 0.227451, 1, 1,
0.3244205, -0.4943034, 2.803042, 0, 0.2196078, 1, 1,
0.3262385, 0.974208, 1.903392, 0, 0.2156863, 1, 1,
0.3288959, 1.242771, 0.9475146, 0, 0.2078431, 1, 1,
0.3290875, 1.518755, 1.388054, 0, 0.2039216, 1, 1,
0.335435, 0.5703507, 2.918903, 0, 0.1960784, 1, 1,
0.337468, -0.8845686, 2.924199, 0, 0.1882353, 1, 1,
0.3413997, 0.127945, 2.051525, 0, 0.1843137, 1, 1,
0.347827, 0.2760847, 0.7971949, 0, 0.1764706, 1, 1,
0.3484275, 1.133465, 0.5611928, 0, 0.172549, 1, 1,
0.3537543, -0.7805907, 1.696847, 0, 0.1647059, 1, 1,
0.3569252, -0.01385637, 1.192993, 0, 0.1607843, 1, 1,
0.360637, -0.5195177, 3.278141, 0, 0.1529412, 1, 1,
0.3623035, -0.1446919, 1.448637, 0, 0.1490196, 1, 1,
0.3630873, 0.291217, 2.911772, 0, 0.1411765, 1, 1,
0.3632582, -0.9476708, 3.756914, 0, 0.1372549, 1, 1,
0.3643288, 2.077836, -0.741842, 0, 0.1294118, 1, 1,
0.3649786, -1.113769, 1.424783, 0, 0.1254902, 1, 1,
0.3775249, 1.238542, 0.4459264, 0, 0.1176471, 1, 1,
0.3782837, 0.37481, 0.02162282, 0, 0.1137255, 1, 1,
0.3792189, -0.2104926, 1.981688, 0, 0.1058824, 1, 1,
0.3818825, -0.2166979, 3.284013, 0, 0.09803922, 1, 1,
0.3819349, 1.2195, 0.3847454, 0, 0.09411765, 1, 1,
0.3894135, -0.1619482, 2.625751, 0, 0.08627451, 1, 1,
0.3910023, 0.7605999, 0.8832681, 0, 0.08235294, 1, 1,
0.400873, 0.2875945, 0.9199612, 0, 0.07450981, 1, 1,
0.4031997, -0.2891023, 2.336126, 0, 0.07058824, 1, 1,
0.4035817, -0.9128404, 1.38341, 0, 0.0627451, 1, 1,
0.403823, -1.22523, 2.90756, 0, 0.05882353, 1, 1,
0.410325, -0.1509457, 0.6619531, 0, 0.05098039, 1, 1,
0.4185452, -0.33465, 2.308889, 0, 0.04705882, 1, 1,
0.4221822, -1.125043, 0.9648414, 0, 0.03921569, 1, 1,
0.422896, 0.9506387, 1.205018, 0, 0.03529412, 1, 1,
0.4257624, 1.516997, -0.4878792, 0, 0.02745098, 1, 1,
0.4263055, 0.2096909, 1.951002, 0, 0.02352941, 1, 1,
0.4267453, -0.4124804, 2.210521, 0, 0.01568628, 1, 1,
0.4277478, 0.375049, -0.4573671, 0, 0.01176471, 1, 1,
0.4293985, 0.6155177, 0.7527619, 0, 0.003921569, 1, 1,
0.4350567, 1.991713, -0.8436844, 0.003921569, 0, 1, 1,
0.4389772, 0.9233949, 0.2502581, 0.007843138, 0, 1, 1,
0.4404107, -0.1809673, 0.1755275, 0.01568628, 0, 1, 1,
0.4431226, -0.9615915, 2.854622, 0.01960784, 0, 1, 1,
0.4488155, -0.05867048, 1.221396, 0.02745098, 0, 1, 1,
0.4507977, 1.076829, -0.4705519, 0.03137255, 0, 1, 1,
0.453407, 0.5389723, 1.050844, 0.03921569, 0, 1, 1,
0.456205, -0.9388208, 3.436464, 0.04313726, 0, 1, 1,
0.457894, 0.036182, 0.9124604, 0.05098039, 0, 1, 1,
0.4652303, 0.3671787, -1.247744, 0.05490196, 0, 1, 1,
0.4696007, -0.3818788, 2.40624, 0.0627451, 0, 1, 1,
0.4709349, 0.6818416, -1.21208, 0.06666667, 0, 1, 1,
0.4711179, -0.4528258, 1.53422, 0.07450981, 0, 1, 1,
0.4715494, -1.221915, 2.983986, 0.07843138, 0, 1, 1,
0.4725991, -0.4537879, 1.410006, 0.08627451, 0, 1, 1,
0.4732238, -0.03835296, 1.22218, 0.09019608, 0, 1, 1,
0.4746928, 0.249257, 1.600933, 0.09803922, 0, 1, 1,
0.4786141, 0.86401, 0.06639875, 0.1058824, 0, 1, 1,
0.4808665, -1.334384, 1.756659, 0.1098039, 0, 1, 1,
0.481554, 0.7449033, 0.2764515, 0.1176471, 0, 1, 1,
0.4826115, 0.6434138, 0.8738772, 0.1215686, 0, 1, 1,
0.4898908, -0.3241692, 1.159825, 0.1294118, 0, 1, 1,
0.4962395, 1.303941, 0.589386, 0.1333333, 0, 1, 1,
0.5003412, 0.2438579, 3.366986, 0.1411765, 0, 1, 1,
0.5006098, 0.3244371, 0.4423063, 0.145098, 0, 1, 1,
0.5008913, 1.605245, 1.261585, 0.1529412, 0, 1, 1,
0.5011326, -1.790965, 1.667016, 0.1568628, 0, 1, 1,
0.5104724, -1.146299, 2.819169, 0.1647059, 0, 1, 1,
0.5139828, 1.777638, 1.289284, 0.1686275, 0, 1, 1,
0.5142292, -0.166482, 1.252178, 0.1764706, 0, 1, 1,
0.5220186, 0.1990405, -0.009257065, 0.1803922, 0, 1, 1,
0.5241493, -0.1491604, 2.299312, 0.1882353, 0, 1, 1,
0.5268686, 1.639221, -0.2334321, 0.1921569, 0, 1, 1,
0.531422, 0.6661451, 2.697263, 0.2, 0, 1, 1,
0.534946, 1.741973, -1.193573, 0.2078431, 0, 1, 1,
0.5366748, -0.9758918, 2.868202, 0.2117647, 0, 1, 1,
0.5392051, 1.753519, 1.295808, 0.2196078, 0, 1, 1,
0.5397339, -0.706005, 0.6470596, 0.2235294, 0, 1, 1,
0.5402355, -0.3833636, 3.057296, 0.2313726, 0, 1, 1,
0.5457485, -1.736809, 3.009402, 0.2352941, 0, 1, 1,
0.558648, 0.7077055, 0.5638159, 0.2431373, 0, 1, 1,
0.5602061, -0.1048776, 2.031912, 0.2470588, 0, 1, 1,
0.5672624, -0.634449, 2.342191, 0.254902, 0, 1, 1,
0.5677662, -1.258671, 2.222055, 0.2588235, 0, 1, 1,
0.5687908, 0.1454114, 1.799766, 0.2666667, 0, 1, 1,
0.5712346, -0.1558489, 1.349625, 0.2705882, 0, 1, 1,
0.5717427, 1.211893, -0.594679, 0.2784314, 0, 1, 1,
0.5734794, 0.1412915, 0.1762643, 0.282353, 0, 1, 1,
0.5778422, -0.0307575, 2.454169, 0.2901961, 0, 1, 1,
0.5781966, -0.4955391, 2.80392, 0.2941177, 0, 1, 1,
0.5876631, -0.9259846, 2.878999, 0.3019608, 0, 1, 1,
0.5878912, 0.2793027, 1.168531, 0.3098039, 0, 1, 1,
0.5926149, -1.767433, 2.287894, 0.3137255, 0, 1, 1,
0.5964511, 0.1438762, 2.144582, 0.3215686, 0, 1, 1,
0.597437, 1.050497, 1.579586, 0.3254902, 0, 1, 1,
0.6075394, -0.7970203, 1.483512, 0.3333333, 0, 1, 1,
0.6105211, -1.212984, 2.237124, 0.3372549, 0, 1, 1,
0.6118274, 2.269066, -0.1580227, 0.345098, 0, 1, 1,
0.6136536, -1.30962, 3.34024, 0.3490196, 0, 1, 1,
0.6138743, 1.918555, 0.9144011, 0.3568628, 0, 1, 1,
0.6161584, 0.1731333, 2.151982, 0.3607843, 0, 1, 1,
0.6164525, 2.375031, 0.9777832, 0.3686275, 0, 1, 1,
0.6166253, -0.2339359, 1.444171, 0.372549, 0, 1, 1,
0.6172987, -0.5118524, 2.028355, 0.3803922, 0, 1, 1,
0.6196669, 0.6845914, 2.636688, 0.3843137, 0, 1, 1,
0.6208917, 0.04877422, 1.232832, 0.3921569, 0, 1, 1,
0.6221689, -0.3856182, 2.319857, 0.3960784, 0, 1, 1,
0.6277723, 0.0239228, 2.945226, 0.4039216, 0, 1, 1,
0.6278447, 0.824849, -0.04083345, 0.4117647, 0, 1, 1,
0.6295869, 0.3140813, 0.4861339, 0.4156863, 0, 1, 1,
0.6338051, 0.4132341, 1.900146, 0.4235294, 0, 1, 1,
0.6426215, 0.2658606, 0.08035599, 0.427451, 0, 1, 1,
0.6430058, 0.2177854, 1.119572, 0.4352941, 0, 1, 1,
0.6458161, -0.9718969, 1.163941, 0.4392157, 0, 1, 1,
0.6459884, -0.6318378, 2.033223, 0.4470588, 0, 1, 1,
0.6512738, -0.2988024, 1.996111, 0.4509804, 0, 1, 1,
0.6515722, 0.07438286, 1.316721, 0.4588235, 0, 1, 1,
0.6519917, 1.513588, 0.3628025, 0.4627451, 0, 1, 1,
0.6531123, 1.074363, 1.018321, 0.4705882, 0, 1, 1,
0.653699, 0.01048795, 1.113247, 0.4745098, 0, 1, 1,
0.655167, 0.9164881, -0.6177206, 0.4823529, 0, 1, 1,
0.6563898, 0.07752076, 2.914273, 0.4862745, 0, 1, 1,
0.6578743, 0.5839357, 1.825979, 0.4941176, 0, 1, 1,
0.6591721, 0.3460993, 0.1064404, 0.5019608, 0, 1, 1,
0.6603993, -1.019484, 2.978693, 0.5058824, 0, 1, 1,
0.6612536, 1.765353, 1.769491, 0.5137255, 0, 1, 1,
0.6646204, 0.05243871, 0.824248, 0.5176471, 0, 1, 1,
0.667357, -0.1742108, 1.863604, 0.5254902, 0, 1, 1,
0.6755439, -1.26895, 4.392437, 0.5294118, 0, 1, 1,
0.6770282, 0.1984494, 1.435208, 0.5372549, 0, 1, 1,
0.6805634, 1.279379, -0.3640579, 0.5411765, 0, 1, 1,
0.6813174, 0.2694015, 0.6461326, 0.5490196, 0, 1, 1,
0.6836579, -0.865075, 3.500029, 0.5529412, 0, 1, 1,
0.6843615, -0.8062485, 3.212533, 0.5607843, 0, 1, 1,
0.6905206, -0.5356997, 2.116146, 0.5647059, 0, 1, 1,
0.6963866, -1.734794, 2.759678, 0.572549, 0, 1, 1,
0.6964262, -0.3496729, 2.033513, 0.5764706, 0, 1, 1,
0.7086185, -1.689187, 2.698984, 0.5843138, 0, 1, 1,
0.7103629, 2.176106, 0.4308586, 0.5882353, 0, 1, 1,
0.7129848, -1.337704, 0.4593348, 0.5960785, 0, 1, 1,
0.7161034, 0.7435601, 0.4495846, 0.6039216, 0, 1, 1,
0.7165726, 1.099485, -1.226254, 0.6078432, 0, 1, 1,
0.7179112, 1.105261, 1.244475, 0.6156863, 0, 1, 1,
0.7208606, -1.847406, 4.270112, 0.6196079, 0, 1, 1,
0.7247745, 0.4977788, 0.2137253, 0.627451, 0, 1, 1,
0.727398, 0.4428961, 3.227857, 0.6313726, 0, 1, 1,
0.7358304, -1.009486, 1.958145, 0.6392157, 0, 1, 1,
0.7383239, -1.631934, 2.95235, 0.6431373, 0, 1, 1,
0.7412781, -0.1169431, 0.03537413, 0.6509804, 0, 1, 1,
0.741814, 0.6126519, 2.341703, 0.654902, 0, 1, 1,
0.7447696, -1.680846, 1.254567, 0.6627451, 0, 1, 1,
0.7469042, -0.6874345, 3.109473, 0.6666667, 0, 1, 1,
0.7505379, -1.083673, 3.465846, 0.6745098, 0, 1, 1,
0.7510195, -1.402034, 0.834384, 0.6784314, 0, 1, 1,
0.7550579, 1.074638, -0.1895078, 0.6862745, 0, 1, 1,
0.758096, 0.7578431, -0.2870753, 0.6901961, 0, 1, 1,
0.7641813, 0.2885156, 0.4965949, 0.6980392, 0, 1, 1,
0.7664152, -0.4212865, 2.447113, 0.7058824, 0, 1, 1,
0.7667077, 0.6187002, -0.4015712, 0.7098039, 0, 1, 1,
0.7735446, 0.9164828, 0.1830544, 0.7176471, 0, 1, 1,
0.7740269, 0.8336798, 0.9240395, 0.7215686, 0, 1, 1,
0.7771423, -0.6237257, 2.645179, 0.7294118, 0, 1, 1,
0.7786339, -0.3649148, 2.320883, 0.7333333, 0, 1, 1,
0.77982, 2.221034, 1.062932, 0.7411765, 0, 1, 1,
0.7809229, 0.3430287, -0.2806215, 0.7450981, 0, 1, 1,
0.782581, 0.2996312, 1.516606, 0.7529412, 0, 1, 1,
0.7842622, 2.137331, 1.171069, 0.7568628, 0, 1, 1,
0.7858679, 0.9984558, 2.008997, 0.7647059, 0, 1, 1,
0.7899058, -0.2169222, 2.043196, 0.7686275, 0, 1, 1,
0.791433, 1.026839, -0.1940385, 0.7764706, 0, 1, 1,
0.7981151, -0.8118923, 1.119249, 0.7803922, 0, 1, 1,
0.8040541, -0.8572466, 3.552684, 0.7882353, 0, 1, 1,
0.8042499, -0.1673097, 1.952791, 0.7921569, 0, 1, 1,
0.8045604, 0.4082262, 2.090139, 0.8, 0, 1, 1,
0.8076237, 0.1909694, 1.442451, 0.8078431, 0, 1, 1,
0.8103007, 0.1942402, 1.232276, 0.8117647, 0, 1, 1,
0.8121375, -0.438144, 1.844578, 0.8196079, 0, 1, 1,
0.813327, -0.9265481, 3.982206, 0.8235294, 0, 1, 1,
0.814821, 0.4567364, 1.181767, 0.8313726, 0, 1, 1,
0.8154162, -0.1825402, 3.785938, 0.8352941, 0, 1, 1,
0.8162934, -0.8646931, 1.945128, 0.8431373, 0, 1, 1,
0.8165194, -0.4333144, 0.1889412, 0.8470588, 0, 1, 1,
0.822462, -1.384163, 2.62326, 0.854902, 0, 1, 1,
0.8258926, -0.2293116, 1.375808, 0.8588235, 0, 1, 1,
0.8266309, -0.3487341, 2.632769, 0.8666667, 0, 1, 1,
0.8299146, -0.9540836, 2.319246, 0.8705882, 0, 1, 1,
0.8311415, -0.688681, 2.641711, 0.8784314, 0, 1, 1,
0.8363196, 1.568639, 2.408293, 0.8823529, 0, 1, 1,
0.8398533, 2.003222, -0.1732227, 0.8901961, 0, 1, 1,
0.8541576, -0.8137084, 2.525013, 0.8941177, 0, 1, 1,
0.8627577, 0.5070032, 2.735726, 0.9019608, 0, 1, 1,
0.8659387, 0.4713476, 1.368551, 0.9098039, 0, 1, 1,
0.8724278, 0.3842252, 1.206373, 0.9137255, 0, 1, 1,
0.8757594, -0.4158091, 2.043491, 0.9215686, 0, 1, 1,
0.8857724, 0.3628988, 1.215406, 0.9254902, 0, 1, 1,
0.8882195, 1.177275, 0.02846164, 0.9333333, 0, 1, 1,
0.889724, -1.331143, 3.374535, 0.9372549, 0, 1, 1,
0.893445, 0.4901322, -1.166115, 0.945098, 0, 1, 1,
0.8942815, -0.02980523, 1.334834, 0.9490196, 0, 1, 1,
0.8956977, 1.485186, 0.6872216, 0.9568627, 0, 1, 1,
0.8969898, 0.3983883, 0.2473084, 0.9607843, 0, 1, 1,
0.9028698, 2.237435, -0.4094441, 0.9686275, 0, 1, 1,
0.9103312, 0.2752669, 1.528788, 0.972549, 0, 1, 1,
0.9109437, 1.045164, 1.455696, 0.9803922, 0, 1, 1,
0.9194269, -0.703687, 3.052049, 0.9843137, 0, 1, 1,
0.9282444, 1.797549, 0.8691352, 0.9921569, 0, 1, 1,
0.9336821, -1.622409, 3.229279, 0.9960784, 0, 1, 1,
0.9336967, 1.74178, -0.5399789, 1, 0, 0.9960784, 1,
0.9345097, 1.055841, 1.513718, 1, 0, 0.9882353, 1,
0.9486327, -0.3705653, 2.341358, 1, 0, 0.9843137, 1,
0.9493372, 0.08547775, 0.917657, 1, 0, 0.9764706, 1,
0.9521356, 0.864055, 0.9573129, 1, 0, 0.972549, 1,
0.9527459, 1.652039, 2.136889, 1, 0, 0.9647059, 1,
0.9562255, -0.7722132, 0.2541802, 1, 0, 0.9607843, 1,
0.958261, -0.725685, 3.726017, 1, 0, 0.9529412, 1,
0.961358, -1.525259, 3.257233, 1, 0, 0.9490196, 1,
0.9675904, -1.741404, 3.436461, 1, 0, 0.9411765, 1,
0.9771308, 1.097714, 0.7252372, 1, 0, 0.9372549, 1,
0.9796864, 2.723323, 0.9361513, 1, 0, 0.9294118, 1,
0.979929, -0.6974689, 1.476178, 1, 0, 0.9254902, 1,
0.9811358, 0.450837, -0.3753853, 1, 0, 0.9176471, 1,
0.9820193, -0.2411382, 1.402829, 1, 0, 0.9137255, 1,
0.9883296, -0.1606993, 1.274338, 1, 0, 0.9058824, 1,
0.9898495, 0.009357627, 0.6308901, 1, 0, 0.9019608, 1,
0.9915289, -0.9017045, 1.571874, 1, 0, 0.8941177, 1,
0.9923179, -0.6631082, 1.646007, 1, 0, 0.8862745, 1,
0.9930496, 0.6284564, 3.564937, 1, 0, 0.8823529, 1,
1.007566, -0.659876, 1.016745, 1, 0, 0.8745098, 1,
1.011872, 0.7654231, 0.4549115, 1, 0, 0.8705882, 1,
1.01284, 1.167149, 0.2889698, 1, 0, 0.8627451, 1,
1.013817, 1.206178, 1.164634, 1, 0, 0.8588235, 1,
1.019493, 1.274559, 1.219537, 1, 0, 0.8509804, 1,
1.021537, -1.687701, 1.54653, 1, 0, 0.8470588, 1,
1.022133, 0.05861274, 1.399244, 1, 0, 0.8392157, 1,
1.032259, -0.5906773, 1.98981, 1, 0, 0.8352941, 1,
1.03622, -1.51845, 2.090664, 1, 0, 0.827451, 1,
1.037267, 0.6909998, 0.8978115, 1, 0, 0.8235294, 1,
1.042732, 1.659082, -0.5706241, 1, 0, 0.8156863, 1,
1.043992, 0.5675096, 2.198926, 1, 0, 0.8117647, 1,
1.049532, -1.173104, 2.34383, 1, 0, 0.8039216, 1,
1.050395, 0.07101564, 1.915439, 1, 0, 0.7960784, 1,
1.056993, 0.4966677, 0.7082972, 1, 0, 0.7921569, 1,
1.059299, 1.03402, -0.4576593, 1, 0, 0.7843137, 1,
1.065678, -0.5619968, 0.2056509, 1, 0, 0.7803922, 1,
1.068019, -0.3739165, 1.356011, 1, 0, 0.772549, 1,
1.072603, 2.212222, 0.2107522, 1, 0, 0.7686275, 1,
1.088733, -0.109485, 0.7317072, 1, 0, 0.7607843, 1,
1.089489, 0.7500516, -0.116755, 1, 0, 0.7568628, 1,
1.089954, 0.06325005, 1.601249, 1, 0, 0.7490196, 1,
1.09366, 0.6186274, 0.706712, 1, 0, 0.7450981, 1,
1.097523, 0.4178925, 2.760182, 1, 0, 0.7372549, 1,
1.102032, -0.1527281, 3.043862, 1, 0, 0.7333333, 1,
1.103385, -0.375953, 1.009363, 1, 0, 0.7254902, 1,
1.116855, 0.003213615, 0.3184888, 1, 0, 0.7215686, 1,
1.138715, -0.5396589, 1.095834, 1, 0, 0.7137255, 1,
1.139718, -1.199792, 1.084251, 1, 0, 0.7098039, 1,
1.141666, -1.745534, 3.862679, 1, 0, 0.7019608, 1,
1.142851, 0.1765838, 2.077042, 1, 0, 0.6941177, 1,
1.144027, -0.7988411, 5.026378, 1, 0, 0.6901961, 1,
1.150732, -0.4733383, 2.322138, 1, 0, 0.682353, 1,
1.152291, -0.6895721, 1.276678, 1, 0, 0.6784314, 1,
1.152722, 0.05464469, 1.529077, 1, 0, 0.6705883, 1,
1.155283, -0.3893987, 3.600865, 1, 0, 0.6666667, 1,
1.15785, -1.04494, 2.623147, 1, 0, 0.6588235, 1,
1.159579, 0.4124715, 0.9276155, 1, 0, 0.654902, 1,
1.162394, -0.917942, 2.51541, 1, 0, 0.6470588, 1,
1.166052, 0.05984102, 1.947267, 1, 0, 0.6431373, 1,
1.166325, 1.45263, -0.1611972, 1, 0, 0.6352941, 1,
1.178312, -2.059794, 3.122572, 1, 0, 0.6313726, 1,
1.20793, 1.193364, 0.391439, 1, 0, 0.6235294, 1,
1.222494, 0.4937822, 2.345571, 1, 0, 0.6196079, 1,
1.235201, 1.666101, -0.2081552, 1, 0, 0.6117647, 1,
1.242377, 0.2372123, 1.719583, 1, 0, 0.6078432, 1,
1.244378, -1.113493, 1.328864, 1, 0, 0.6, 1,
1.244506, 0.4685012, 1.501983, 1, 0, 0.5921569, 1,
1.24613, 0.3631786, 1.308408, 1, 0, 0.5882353, 1,
1.246597, 2.553636, -1.112032, 1, 0, 0.5803922, 1,
1.259104, -0.3684247, 1.520083, 1, 0, 0.5764706, 1,
1.260371, 0.07187651, 3.574578, 1, 0, 0.5686275, 1,
1.263244, 1.350938, -0.4281936, 1, 0, 0.5647059, 1,
1.264898, 0.5619273, -0.5317245, 1, 0, 0.5568628, 1,
1.266339, -0.5520466, 1.536176, 1, 0, 0.5529412, 1,
1.273441, -0.9650241, 2.554438, 1, 0, 0.5450981, 1,
1.280203, 0.2929723, 1.778387, 1, 0, 0.5411765, 1,
1.281835, 0.06421794, 1.764518, 1, 0, 0.5333334, 1,
1.283646, 0.04617532, 1.554552, 1, 0, 0.5294118, 1,
1.292779, -2.241029, 4.233186, 1, 0, 0.5215687, 1,
1.306342, 0.09429742, 1.881662, 1, 0, 0.5176471, 1,
1.310887, 0.9906383, 0.843448, 1, 0, 0.509804, 1,
1.31372, -0.7331833, 2.403917, 1, 0, 0.5058824, 1,
1.322624, 0.6678069, 2.653822, 1, 0, 0.4980392, 1,
1.327713, -2.17714, 2.90669, 1, 0, 0.4901961, 1,
1.346543, 0.6018139, -0.01991862, 1, 0, 0.4862745, 1,
1.347729, 0.3684708, -0.8022652, 1, 0, 0.4784314, 1,
1.35526, 1.435158, -0.6879825, 1, 0, 0.4745098, 1,
1.363418, 0.0731895, 2.964705, 1, 0, 0.4666667, 1,
1.365958, 0.9242894, 1.876626, 1, 0, 0.4627451, 1,
1.370803, 0.08295437, 2.73741, 1, 0, 0.454902, 1,
1.370908, 0.7512745, -1.187775, 1, 0, 0.4509804, 1,
1.384529, 0.2427413, 2.518392, 1, 0, 0.4431373, 1,
1.391053, -0.5422984, 1.721278, 1, 0, 0.4392157, 1,
1.416907, -1.08374, 2.542109, 1, 0, 0.4313726, 1,
1.424257, 0.3862606, 2.126658, 1, 0, 0.427451, 1,
1.426256, -0.1265323, 2.16127, 1, 0, 0.4196078, 1,
1.428036, 2.210177, 0.9135696, 1, 0, 0.4156863, 1,
1.428661, -0.717054, 1.515004, 1, 0, 0.4078431, 1,
1.428664, 1.518931, 1.372959, 1, 0, 0.4039216, 1,
1.436896, -0.3922262, 0.4865076, 1, 0, 0.3960784, 1,
1.444896, -0.1157733, 1.328195, 1, 0, 0.3882353, 1,
1.463583, 0.3490021, 1.25811, 1, 0, 0.3843137, 1,
1.46365, -0.8004556, 2.247096, 1, 0, 0.3764706, 1,
1.464592, -1.846229, 2.198858, 1, 0, 0.372549, 1,
1.46636, -0.6248771, 2.74141, 1, 0, 0.3647059, 1,
1.473861, -2.054653, 1.87485, 1, 0, 0.3607843, 1,
1.479767, -0.5767307, 1.624378, 1, 0, 0.3529412, 1,
1.485684, 1.221072, 2.667707, 1, 0, 0.3490196, 1,
1.536873, -0.3825576, 2.242009, 1, 0, 0.3411765, 1,
1.55322, -0.1172825, 1.817976, 1, 0, 0.3372549, 1,
1.562935, 0.4660131, 1.400127, 1, 0, 0.3294118, 1,
1.564056, -0.7491549, 2.459691, 1, 0, 0.3254902, 1,
1.574256, 1.055159, 1.228425, 1, 0, 0.3176471, 1,
1.591846, -0.5244077, 0.6915874, 1, 0, 0.3137255, 1,
1.628628, 0.944162, 0.702378, 1, 0, 0.3058824, 1,
1.648677, -0.9418346, 4.528478, 1, 0, 0.2980392, 1,
1.657569, -1.704131, 3.878866, 1, 0, 0.2941177, 1,
1.660918, 0.6504486, 0.8878682, 1, 0, 0.2862745, 1,
1.668445, 1.555867, 0.4930043, 1, 0, 0.282353, 1,
1.669067, 0.3525137, -0.4590369, 1, 0, 0.2745098, 1,
1.68771, -1.647191, 3.510324, 1, 0, 0.2705882, 1,
1.692907, -0.03273497, 1.953555, 1, 0, 0.2627451, 1,
1.698233, -0.3229246, 0.1904588, 1, 0, 0.2588235, 1,
1.702122, 1.791863, 0.4269361, 1, 0, 0.2509804, 1,
1.702749, -0.960202, 2.259534, 1, 0, 0.2470588, 1,
1.708456, 0.5715492, 1.960669, 1, 0, 0.2392157, 1,
1.718213, 1.480171, 1.147394, 1, 0, 0.2352941, 1,
1.729103, -1.884524, 4.248068, 1, 0, 0.227451, 1,
1.754237, -0.5603275, 3.177535, 1, 0, 0.2235294, 1,
1.800761, -0.8453705, 1.089475, 1, 0, 0.2156863, 1,
1.807836, -2.008311, 1.313334, 1, 0, 0.2117647, 1,
1.816446, -0.8268173, 0.6094572, 1, 0, 0.2039216, 1,
1.816735, -0.5398287, -0.7959088, 1, 0, 0.1960784, 1,
1.827587, -0.2022147, 1.762615, 1, 0, 0.1921569, 1,
1.829558, 0.1421805, 0.7142349, 1, 0, 0.1843137, 1,
1.830276, 1.354395, 1.167889, 1, 0, 0.1803922, 1,
1.857118, 0.5675594, 1.07976, 1, 0, 0.172549, 1,
1.885866, -0.4917804, 0.489242, 1, 0, 0.1686275, 1,
1.901685, -1.101321, 0.812215, 1, 0, 0.1607843, 1,
1.937276, -0.5788547, -0.5745701, 1, 0, 0.1568628, 1,
1.937306, 0.092732, 2.181124, 1, 0, 0.1490196, 1,
1.939992, 0.3387061, 0.07454712, 1, 0, 0.145098, 1,
1.951682, 0.9395536, 1.987749, 1, 0, 0.1372549, 1,
1.982305, -0.1275994, 2.299029, 1, 0, 0.1333333, 1,
1.988105, -0.3184964, 1.158684, 1, 0, 0.1254902, 1,
2.047507, -0.7307855, 1.217434, 1, 0, 0.1215686, 1,
2.053124, 0.7047791, 1.058799, 1, 0, 0.1137255, 1,
2.081995, 1.667732, 0.9852305, 1, 0, 0.1098039, 1,
2.08923, 0.5895718, 1.18153, 1, 0, 0.1019608, 1,
2.157102, -0.2111412, 2.931301, 1, 0, 0.09411765, 1,
2.169581, 0.5642755, 2.615565, 1, 0, 0.09019608, 1,
2.185736, -0.1460332, 1.604987, 1, 0, 0.08235294, 1,
2.209524, -0.2003429, 1.706766, 1, 0, 0.07843138, 1,
2.210736, 1.39605, 1.092796, 1, 0, 0.07058824, 1,
2.252455, -1.227426, 0.6881346, 1, 0, 0.06666667, 1,
2.256701, -1.544715, 1.190811, 1, 0, 0.05882353, 1,
2.277053, -1.00844, 2.884479, 1, 0, 0.05490196, 1,
2.384748, 2.172473, 1.997812, 1, 0, 0.04705882, 1,
2.449121, 0.05203481, 3.224009, 1, 0, 0.04313726, 1,
2.451539, -1.319285, 3.750613, 1, 0, 0.03529412, 1,
2.469815, 0.002817072, 0.3682148, 1, 0, 0.03137255, 1,
2.604905, -0.7713176, 3.119538, 1, 0, 0.02352941, 1,
2.659795, 0.3340965, 3.510213, 1, 0, 0.01960784, 1,
2.792736, 0.1213599, 1.478557, 1, 0, 0.01176471, 1,
3.127269, 0.9857497, 2.51514, 1, 0, 0.007843138, 1
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
0.01987171, -4.412155, -7.085658, 0, -0.5, 0.5, 0.5,
0.01987171, -4.412155, -7.085658, 1, -0.5, 0.5, 0.5,
0.01987171, -4.412155, -7.085658, 1, 1.5, 0.5, 0.5,
0.01987171, -4.412155, -7.085658, 0, 1.5, 0.5, 0.5
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
-4.140934, -0.1807818, -7.085658, 0, -0.5, 0.5, 0.5,
-4.140934, -0.1807818, -7.085658, 1, -0.5, 0.5, 0.5,
-4.140934, -0.1807818, -7.085658, 1, 1.5, 0.5, 0.5,
-4.140934, -0.1807818, -7.085658, 0, 1.5, 0.5, 0.5
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
-4.140934, -4.412155, -0.1519184, 0, -0.5, 0.5, 0.5,
-4.140934, -4.412155, -0.1519184, 1, -0.5, 0.5, 0.5,
-4.140934, -4.412155, -0.1519184, 1, 1.5, 0.5, 0.5,
-4.140934, -4.412155, -0.1519184, 0, 1.5, 0.5, 0.5
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
-3, -3.435684, -5.485564,
3, -3.435684, -5.485564,
-3, -3.435684, -5.485564,
-3, -3.598429, -5.752246,
-2, -3.435684, -5.485564,
-2, -3.598429, -5.752246,
-1, -3.435684, -5.485564,
-1, -3.598429, -5.752246,
0, -3.435684, -5.485564,
0, -3.598429, -5.752246,
1, -3.435684, -5.485564,
1, -3.598429, -5.752246,
2, -3.435684, -5.485564,
2, -3.598429, -5.752246,
3, -3.435684, -5.485564,
3, -3.598429, -5.752246
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
-3, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
-3, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
-3, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
-3, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
-2, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
-2, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
-2, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
-2, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
-1, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
-1, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
-1, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
-1, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
0, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
0, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
0, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
0, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
1, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
1, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
1, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
1, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
2, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
2, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
2, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
2, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5,
3, -3.923919, -6.285611, 0, -0.5, 0.5, 0.5,
3, -3.923919, -6.285611, 1, -0.5, 0.5, 0.5,
3, -3.923919, -6.285611, 1, 1.5, 0.5, 0.5,
3, -3.923919, -6.285611, 0, 1.5, 0.5, 0.5
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
-3.180748, -3, -5.485564,
-3.180748, 2, -5.485564,
-3.180748, -3, -5.485564,
-3.340779, -3, -5.752246,
-3.180748, -2, -5.485564,
-3.340779, -2, -5.752246,
-3.180748, -1, -5.485564,
-3.340779, -1, -5.752246,
-3.180748, 0, -5.485564,
-3.340779, 0, -5.752246,
-3.180748, 1, -5.485564,
-3.340779, 1, -5.752246,
-3.180748, 2, -5.485564,
-3.340779, 2, -5.752246
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
-3.660841, -3, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, -3, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, -3, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, -3, -6.285611, 0, 1.5, 0.5, 0.5,
-3.660841, -2, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, -2, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, -2, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, -2, -6.285611, 0, 1.5, 0.5, 0.5,
-3.660841, -1, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, -1, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, -1, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, -1, -6.285611, 0, 1.5, 0.5, 0.5,
-3.660841, 0, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, 0, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, 0, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, 0, -6.285611, 0, 1.5, 0.5, 0.5,
-3.660841, 1, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, 1, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, 1, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, 1, -6.285611, 0, 1.5, 0.5, 0.5,
-3.660841, 2, -6.285611, 0, -0.5, 0.5, 0.5,
-3.660841, 2, -6.285611, 1, -0.5, 0.5, 0.5,
-3.660841, 2, -6.285611, 1, 1.5, 0.5, 0.5,
-3.660841, 2, -6.285611, 0, 1.5, 0.5, 0.5
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
-3.180748, -3.435684, -4,
-3.180748, -3.435684, 4,
-3.180748, -3.435684, -4,
-3.340779, -3.598429, -4,
-3.180748, -3.435684, -2,
-3.340779, -3.598429, -2,
-3.180748, -3.435684, 0,
-3.340779, -3.598429, 0,
-3.180748, -3.435684, 2,
-3.340779, -3.598429, 2,
-3.180748, -3.435684, 4,
-3.340779, -3.598429, 4
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
-3.660841, -3.923919, -4, 0, -0.5, 0.5, 0.5,
-3.660841, -3.923919, -4, 1, -0.5, 0.5, 0.5,
-3.660841, -3.923919, -4, 1, 1.5, 0.5, 0.5,
-3.660841, -3.923919, -4, 0, 1.5, 0.5, 0.5,
-3.660841, -3.923919, -2, 0, -0.5, 0.5, 0.5,
-3.660841, -3.923919, -2, 1, -0.5, 0.5, 0.5,
-3.660841, -3.923919, -2, 1, 1.5, 0.5, 0.5,
-3.660841, -3.923919, -2, 0, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 0, 0, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 0, 1, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 0, 1, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 0, 0, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 2, 0, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 2, 1, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 2, 1, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 2, 0, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 4, 0, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 4, 1, -0.5, 0.5, 0.5,
-3.660841, -3.923919, 4, 1, 1.5, 0.5, 0.5,
-3.660841, -3.923919, 4, 0, 1.5, 0.5, 0.5
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
-3.180748, -3.435684, -5.485564,
-3.180748, 3.074121, -5.485564,
-3.180748, -3.435684, 5.181727,
-3.180748, 3.074121, 5.181727,
-3.180748, -3.435684, -5.485564,
-3.180748, -3.435684, 5.181727,
-3.180748, 3.074121, -5.485564,
-3.180748, 3.074121, 5.181727,
-3.180748, -3.435684, -5.485564,
3.220491, -3.435684, -5.485564,
-3.180748, -3.435684, 5.181727,
3.220491, -3.435684, 5.181727,
-3.180748, 3.074121, -5.485564,
3.220491, 3.074121, -5.485564,
-3.180748, 3.074121, 5.181727,
3.220491, 3.074121, 5.181727,
3.220491, -3.435684, -5.485564,
3.220491, 3.074121, -5.485564,
3.220491, -3.435684, 5.181727,
3.220491, 3.074121, 5.181727,
3.220491, -3.435684, -5.485564,
3.220491, -3.435684, 5.181727,
3.220491, 3.074121, -5.485564,
3.220491, 3.074121, 5.181727
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
var radius = 7.497523;
var distance = 33.35733;
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
mvMatrix.translate( -0.01987171, 0.1807818, 0.1519184 );
mvMatrix.scale( 1.266391, 1.245271, 0.759937 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.35733);
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
Antimony_Potassium_T<-read.table("Antimony_Potassium_T.xyz", skip=1)
```

```
## Error in read.table("Antimony_Potassium_T.xyz", skip = 1): duplicate 'row.names' are not allowed
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
-3.087526, -0.5723342, -3.419843, 0, 0, 1, 1, 1,
-2.844326, -0.2320006, -2.461591, 1, 0, 0, 1, 1,
-2.556536, 0.4426239, -1.247589, 1, 0, 0, 1, 1,
-2.388738, 1.35202, -2.461339, 1, 0, 0, 1, 1,
-2.354363, 0.4270537, 0.001142463, 1, 0, 0, 1, 1,
-2.274402, 2.440597, 0.2756667, 1, 0, 0, 1, 1,
-2.219313, 1.544152, 0.5735132, 0, 0, 0, 1, 1,
-2.218745, -0.9387021, -3.622482, 0, 0, 0, 1, 1,
-2.203213, -0.1410179, -1.618753, 0, 0, 0, 1, 1,
-2.203078, 0.3961926, -1.594399, 0, 0, 0, 1, 1,
-2.145493, -0.2439104, -2.043401, 0, 0, 0, 1, 1,
-2.137511, -0.3166531, -2.33023, 0, 0, 0, 1, 1,
-2.085588, 1.416128, -2.122871, 0, 0, 0, 1, 1,
-2.026533, 1.607128, -1.411351, 1, 1, 1, 1, 1,
-2.026135, -0.5778198, -1.460747, 1, 1, 1, 1, 1,
-2.015936, 0.354869, -1.225178, 1, 1, 1, 1, 1,
-2.007076, -0.1895803, -1.716978, 1, 1, 1, 1, 1,
-1.972269, 1.198435, 1.032924, 1, 1, 1, 1, 1,
-1.961336, 0.8401853, -1.408838, 1, 1, 1, 1, 1,
-1.947824, 0.3662204, -0.9548389, 1, 1, 1, 1, 1,
-1.923521, 0.2213221, -1.575794, 1, 1, 1, 1, 1,
-1.919238, 0.2661112, -1.203328, 1, 1, 1, 1, 1,
-1.916086, 0.3990302, -0.5487909, 1, 1, 1, 1, 1,
-1.904634, 0.08264183, -2.532237, 1, 1, 1, 1, 1,
-1.898502, -0.3047341, 0.4521471, 1, 1, 1, 1, 1,
-1.89702, 0.4750935, -0.5817325, 1, 1, 1, 1, 1,
-1.889686, -0.001711782, -3.200603, 1, 1, 1, 1, 1,
-1.862948, -0.5119912, -1.942549, 1, 1, 1, 1, 1,
-1.860808, -0.17123, -0.5590475, 0, 0, 1, 1, 1,
-1.858668, 1.171194, 0.08942896, 1, 0, 0, 1, 1,
-1.858276, -2.613114, -3.827862, 1, 0, 0, 1, 1,
-1.855651, 0.04012546, -2.14447, 1, 0, 0, 1, 1,
-1.80676, -0.3513784, -1.800063, 1, 0, 0, 1, 1,
-1.795365, -0.4473198, -1.583885, 1, 0, 0, 1, 1,
-1.781199, -0.1439395, -2.858808, 0, 0, 0, 1, 1,
-1.776536, 0.5378312, -2.166855, 0, 0, 0, 1, 1,
-1.767492, -0.2558834, -1.936117, 0, 0, 0, 1, 1,
-1.76256, 0.09936491, -0.9971603, 0, 0, 0, 1, 1,
-1.760535, -1.080984, -2.742033, 0, 0, 0, 1, 1,
-1.746014, -1.61107, -2.556608, 0, 0, 0, 1, 1,
-1.69459, -1.502963, -1.158549, 0, 0, 0, 1, 1,
-1.688857, -1.692171, -1.165085, 1, 1, 1, 1, 1,
-1.68691, -0.1560489, -2.728839, 1, 1, 1, 1, 1,
-1.686129, -1.322434, -2.584645, 1, 1, 1, 1, 1,
-1.672408, -0.2009913, -1.118971, 1, 1, 1, 1, 1,
-1.662065, -1.379341, -2.886968, 1, 1, 1, 1, 1,
-1.649616, -1.154733, -2.705931, 1, 1, 1, 1, 1,
-1.647866, -0.7426017, -1.272073, 1, 1, 1, 1, 1,
-1.619903, -0.9403253, -1.347249, 1, 1, 1, 1, 1,
-1.612829, 0.06682992, -1.231463, 1, 1, 1, 1, 1,
-1.595608, 0.4928206, -1.441407, 1, 1, 1, 1, 1,
-1.589481, 0.05113231, -2.253711, 1, 1, 1, 1, 1,
-1.58296, -0.4958218, -3.003746, 1, 1, 1, 1, 1,
-1.580644, 1.039584, -0.9676413, 1, 1, 1, 1, 1,
-1.580321, 1.023089, -0.7652128, 1, 1, 1, 1, 1,
-1.574726, 0.3645482, -2.062556, 1, 1, 1, 1, 1,
-1.568862, -0.01328827, -1.368926, 0, 0, 1, 1, 1,
-1.564793, 0.102187, -0.9016372, 1, 0, 0, 1, 1,
-1.561135, 0.1857887, -1.248203, 1, 0, 0, 1, 1,
-1.546946, -1.013997, -1.386056, 1, 0, 0, 1, 1,
-1.540933, 1.347286, -0.4532336, 1, 0, 0, 1, 1,
-1.52965, -0.2568158, -0.5458468, 1, 0, 0, 1, 1,
-1.529638, 0.4259513, -2.459208, 0, 0, 0, 1, 1,
-1.518283, 0.3035796, -1.837128, 0, 0, 0, 1, 1,
-1.517254, 1.418685, -2.060482, 0, 0, 0, 1, 1,
-1.50734, 1.093006, -0.8243129, 0, 0, 0, 1, 1,
-1.491435, -0.3835866, 0.657154, 0, 0, 0, 1, 1,
-1.489435, -0.5449733, -2.763505, 0, 0, 0, 1, 1,
-1.48399, 0.06964665, -2.368842, 0, 0, 0, 1, 1,
-1.478919, -0.8533595, -2.244784, 1, 1, 1, 1, 1,
-1.477803, -0.7608605, -1.912514, 1, 1, 1, 1, 1,
-1.472207, -0.8148401, -2.56906, 1, 1, 1, 1, 1,
-1.47066, -0.3027996, -2.918941, 1, 1, 1, 1, 1,
-1.469045, 1.607511, -0.4691645, 1, 1, 1, 1, 1,
-1.455841, 0.2536976, -1.080753, 1, 1, 1, 1, 1,
-1.441197, 0.9105688, 0.01424504, 1, 1, 1, 1, 1,
-1.437081, -0.9816351, -1.844526, 1, 1, 1, 1, 1,
-1.430656, 0.6387765, -0.8337756, 1, 1, 1, 1, 1,
-1.428571, -0.4059158, -2.374282, 1, 1, 1, 1, 1,
-1.425237, -0.9202702, -0.8320809, 1, 1, 1, 1, 1,
-1.40748, -0.05091123, -1.343686, 1, 1, 1, 1, 1,
-1.406094, -0.9185082, -3.637565, 1, 1, 1, 1, 1,
-1.386761, -2.415025, -1.0023, 1, 1, 1, 1, 1,
-1.378353, 1.142251, -1.365602, 1, 1, 1, 1, 1,
-1.369444, 0.5647364, -2.461117, 0, 0, 1, 1, 1,
-1.369205, 0.2918917, -1.329952, 1, 0, 0, 1, 1,
-1.364968, -0.9208, 1.627951, 1, 0, 0, 1, 1,
-1.355121, -1.009462, -1.949907, 1, 0, 0, 1, 1,
-1.351794, 0.6555392, -1.033302, 1, 0, 0, 1, 1,
-1.347808, 0.4169633, -0.7872918, 1, 0, 0, 1, 1,
-1.335248, -0.7034503, -1.560472, 0, 0, 0, 1, 1,
-1.311925, 1.286104, 2.288224, 0, 0, 0, 1, 1,
-1.30469, -0.5150834, -0.4773746, 0, 0, 0, 1, 1,
-1.302532, -0.382864, -2.041825, 0, 0, 0, 1, 1,
-1.298727, -0.1967636, -3.99353, 0, 0, 0, 1, 1,
-1.298439, -0.5064231, -1.307939, 0, 0, 0, 1, 1,
-1.294194, -1.052095, -0.9929906, 0, 0, 0, 1, 1,
-1.289483, 1.151857, -0.986549, 1, 1, 1, 1, 1,
-1.283596, 1.022303, -0.139981, 1, 1, 1, 1, 1,
-1.281254, 0.6436936, -0.4140812, 1, 1, 1, 1, 1,
-1.27647, -1.358393, -1.367384, 1, 1, 1, 1, 1,
-1.274344, 0.752553, -1.55542, 1, 1, 1, 1, 1,
-1.273655, 1.136686, -0.9273319, 1, 1, 1, 1, 1,
-1.264178, 0.40312, -1.472839, 1, 1, 1, 1, 1,
-1.252068, 0.5655427, -0.151007, 1, 1, 1, 1, 1,
-1.245987, -0.1668301, -1.373019, 1, 1, 1, 1, 1,
-1.243514, -1.562264, -2.927731, 1, 1, 1, 1, 1,
-1.24251, -1.694352, -2.952298, 1, 1, 1, 1, 1,
-1.239202, 1.046293, -1.901425, 1, 1, 1, 1, 1,
-1.232218, -0.2288975, -1.111617, 1, 1, 1, 1, 1,
-1.227199, 0.7800385, -1.171021, 1, 1, 1, 1, 1,
-1.22689, -0.05446747, -0.3614409, 1, 1, 1, 1, 1,
-1.226403, 1.72946, -0.8023617, 0, 0, 1, 1, 1,
-1.224569, 1.22322, -0.07985754, 1, 0, 0, 1, 1,
-1.220112, 1.226879, -1.113599, 1, 0, 0, 1, 1,
-1.219242, 0.7181563, -2.903149, 1, 0, 0, 1, 1,
-1.219223, -0.2413363, -1.667426, 1, 0, 0, 1, 1,
-1.20945, 0.7160154, -0.4048941, 1, 0, 0, 1, 1,
-1.206833, -0.3371221, -2.354854, 0, 0, 0, 1, 1,
-1.200075, -0.1795953, -0.8465101, 0, 0, 0, 1, 1,
-1.18602, 0.7467852, -3.627737, 0, 0, 0, 1, 1,
-1.184848, 0.798026, -1.883673, 0, 0, 0, 1, 1,
-1.181408, 1.517085, 0.4073585, 0, 0, 0, 1, 1,
-1.160407, -1.218443, -3.55964, 0, 0, 0, 1, 1,
-1.159657, 2.031969, -1.898339, 0, 0, 0, 1, 1,
-1.15601, 2.570093, -0.1466099, 1, 1, 1, 1, 1,
-1.148203, -0.4185647, -1.62862, 1, 1, 1, 1, 1,
-1.14742, -1.236439, -3.499998, 1, 1, 1, 1, 1,
-1.143623, 1.152266, -1.05397, 1, 1, 1, 1, 1,
-1.139892, 1.662113, -1.755837, 1, 1, 1, 1, 1,
-1.13239, -2.217379, -2.519178, 1, 1, 1, 1, 1,
-1.132353, 0.9492963, -0.9343596, 1, 1, 1, 1, 1,
-1.132135, -0.4045342, -1.574302, 1, 1, 1, 1, 1,
-1.130138, 0.7593397, -1.704218, 1, 1, 1, 1, 1,
-1.108969, -0.3877884, -2.060381, 1, 1, 1, 1, 1,
-1.099919, -1.559782, -2.470275, 1, 1, 1, 1, 1,
-1.098411, 0.9179335, 0.7528643, 1, 1, 1, 1, 1,
-1.097805, 0.7625163, -2.459958, 1, 1, 1, 1, 1,
-1.096064, -0.7610235, -0.9872068, 1, 1, 1, 1, 1,
-1.085621, 0.2781901, -1.623245, 1, 1, 1, 1, 1,
-1.071023, 1.023718, -0.2531307, 0, 0, 1, 1, 1,
-1.070918, -0.9908506, -3.447924, 1, 0, 0, 1, 1,
-1.069888, 0.9380428, 0.6630799, 1, 0, 0, 1, 1,
-1.066638, -0.9870917, -2.925172, 1, 0, 0, 1, 1,
-1.066534, -0.9482735, -2.488268, 1, 0, 0, 1, 1,
-1.066212, -1.365771, -3.596501, 1, 0, 0, 1, 1,
-1.054494, -0.05756279, -0.5510678, 0, 0, 0, 1, 1,
-1.054031, 0.2554698, -2.314059, 0, 0, 0, 1, 1,
-1.05397, 0.6920934, -0.4141341, 0, 0, 0, 1, 1,
-1.052794, -1.448506, -2.073394, 0, 0, 0, 1, 1,
-1.03956, -0.4346545, -1.550265, 0, 0, 0, 1, 1,
-1.020694, 0.7160488, 0.7756714, 0, 0, 0, 1, 1,
-1.018814, -0.4147302, -2.532053, 0, 0, 0, 1, 1,
-1.015503, 0.5289316, -0.7104639, 1, 1, 1, 1, 1,
-1.003488, -1.071898, -2.843109, 1, 1, 1, 1, 1,
-1.001565, 1.750825, -0.5020647, 1, 1, 1, 1, 1,
-0.9997729, -0.1040998, -1.280997, 1, 1, 1, 1, 1,
-0.9972534, -1.414875, -3.763431, 1, 1, 1, 1, 1,
-0.9946555, -0.9915472, -3.043391, 1, 1, 1, 1, 1,
-0.9898931, 0.5513602, 0.6071877, 1, 1, 1, 1, 1,
-0.9789808, 1.746252, -0.4582751, 1, 1, 1, 1, 1,
-0.9778948, -0.6446383, -1.695564, 1, 1, 1, 1, 1,
-0.9761552, 0.984458, -0.2224908, 1, 1, 1, 1, 1,
-0.9756447, -1.521154, -2.210901, 1, 1, 1, 1, 1,
-0.9737584, -1.655905, -2.365238, 1, 1, 1, 1, 1,
-0.9729615, -2.32628, -3.642006, 1, 1, 1, 1, 1,
-0.9720369, 0.6203108, -2.09168, 1, 1, 1, 1, 1,
-0.9658953, 1.178136, -2.734983, 1, 1, 1, 1, 1,
-0.9639769, 0.9456565, -0.08427873, 0, 0, 1, 1, 1,
-0.9570315, -0.6093609, 0.237377, 1, 0, 0, 1, 1,
-0.9539426, -0.2088482, -1.152336, 1, 0, 0, 1, 1,
-0.9535512, -1.246843, -2.077938, 1, 0, 0, 1, 1,
-0.9507856, 1.193315, 0.4925099, 1, 0, 0, 1, 1,
-0.947615, 1.681235, 0.6358452, 1, 0, 0, 1, 1,
-0.9451739, 0.98623, -0.2694187, 0, 0, 0, 1, 1,
-0.941375, -0.8107659, -3.301022, 0, 0, 0, 1, 1,
-0.9358913, -0.6084284, -2.640906, 0, 0, 0, 1, 1,
-0.9351488, -1.002547, -3.178626, 0, 0, 0, 1, 1,
-0.9339653, -0.2043106, -0.6192067, 0, 0, 0, 1, 1,
-0.9306325, 0.6935158, -0.1958918, 0, 0, 0, 1, 1,
-0.9303232, 2.123612, 0.8151844, 0, 0, 0, 1, 1,
-0.9280335, 0.4835818, -1.898478, 1, 1, 1, 1, 1,
-0.923189, -0.3013711, -2.944988, 1, 1, 1, 1, 1,
-0.9208121, 2.262479, -2.530788, 1, 1, 1, 1, 1,
-0.9156407, 0.8845253, -2.17272, 1, 1, 1, 1, 1,
-0.9125628, 0.02925382, -1.734116, 1, 1, 1, 1, 1,
-0.9087715, -1.293691, -1.695655, 1, 1, 1, 1, 1,
-0.9050648, -0.9442477, -3.32336, 1, 1, 1, 1, 1,
-0.9017357, 0.7776667, -1.151911, 1, 1, 1, 1, 1,
-0.8983124, -0.8473678, -1.386365, 1, 1, 1, 1, 1,
-0.8938699, 0.3530934, -2.657391, 1, 1, 1, 1, 1,
-0.8906487, -0.6892443, -3.977896, 1, 1, 1, 1, 1,
-0.8894597, -0.4071878, -1.478159, 1, 1, 1, 1, 1,
-0.8856557, -0.6355364, -3.01741, 1, 1, 1, 1, 1,
-0.8839881, -1.417164, -3.472306, 1, 1, 1, 1, 1,
-0.8819904, 1.045954, -1.892452, 1, 1, 1, 1, 1,
-0.8795601, 1.864249, -1.593771, 0, 0, 1, 1, 1,
-0.8741734, -1.490515, -1.720519, 1, 0, 0, 1, 1,
-0.8723549, 0.358123, -0.1940796, 1, 0, 0, 1, 1,
-0.871989, 0.1878264, -2.141573, 1, 0, 0, 1, 1,
-0.8554119, -0.05493074, -1.455679, 1, 0, 0, 1, 1,
-0.8422608, 0.7406272, -0.7146607, 1, 0, 0, 1, 1,
-0.8396365, 0.08663532, -0.511246, 0, 0, 0, 1, 1,
-0.8304551, -0.7051093, -3.440758, 0, 0, 0, 1, 1,
-0.8270631, 0.7427632, -0.4811126, 0, 0, 0, 1, 1,
-0.8132619, 1.080977, -0.2713526, 0, 0, 0, 1, 1,
-0.8041475, -1.530719, -4.133467, 0, 0, 0, 1, 1,
-0.8028366, -0.4729446, -2.204197, 0, 0, 0, 1, 1,
-0.7948669, 0.9752478, -0.6873955, 0, 0, 0, 1, 1,
-0.7932611, 1.537345, -0.8651475, 1, 1, 1, 1, 1,
-0.7881883, -2.476099, -3.917191, 1, 1, 1, 1, 1,
-0.7839842, -1.207291, -3.776391, 1, 1, 1, 1, 1,
-0.7832757, -0.4732329, -2.425268, 1, 1, 1, 1, 1,
-0.7717555, -0.6595864, -1.030489, 1, 1, 1, 1, 1,
-0.7702858, -1.049194, -3.018685, 1, 1, 1, 1, 1,
-0.7656441, 0.5146202, -0.5082995, 1, 1, 1, 1, 1,
-0.7582215, 0.3838414, -1.85729, 1, 1, 1, 1, 1,
-0.7578133, -1.340474, -3.462307, 1, 1, 1, 1, 1,
-0.7491676, 0.7109513, -0.6900803, 1, 1, 1, 1, 1,
-0.7485834, -1.307002, -2.571671, 1, 1, 1, 1, 1,
-0.7485315, -0.450449, -1.328202, 1, 1, 1, 1, 1,
-0.74442, 0.9591769, -0.1116819, 1, 1, 1, 1, 1,
-0.7435876, -1.077647, -3.751258, 1, 1, 1, 1, 1,
-0.7387536, -1.288224, -3.153063, 1, 1, 1, 1, 1,
-0.7367346, -1.142329, -1.96956, 0, 0, 1, 1, 1,
-0.733227, -0.2881497, -0.9246132, 1, 0, 0, 1, 1,
-0.7301778, 0.6240914, -1.306794, 1, 0, 0, 1, 1,
-0.7281553, -0.02065093, -0.7673206, 1, 0, 0, 1, 1,
-0.7190703, 1.424047, 0.01268039, 1, 0, 0, 1, 1,
-0.7187669, -0.6571496, -2.983672, 1, 0, 0, 1, 1,
-0.7169742, 0.6059552, -0.8495119, 0, 0, 0, 1, 1,
-0.7169127, 0.1486026, -0.6329066, 0, 0, 0, 1, 1,
-0.7126663, 1.013052, -1.196964, 0, 0, 0, 1, 1,
-0.7123071, -0.7614433, -3.804728, 0, 0, 0, 1, 1,
-0.7054511, 1.217419, 0.1737829, 0, 0, 0, 1, 1,
-0.7010354, 1.428893, -1.706815, 0, 0, 0, 1, 1,
-0.6995444, 0.6425495, -1.222792, 0, 0, 0, 1, 1,
-0.6983513, 1.104824, -1.630263, 1, 1, 1, 1, 1,
-0.6846078, -0.1796755, -1.423756, 1, 1, 1, 1, 1,
-0.6803631, -0.004153915, -2.685393, 1, 1, 1, 1, 1,
-0.6800659, 0.2688969, 0.898118, 1, 1, 1, 1, 1,
-0.678409, 1.993624, -1.017518, 1, 1, 1, 1, 1,
-0.6744086, -0.1264768, -2.504565, 1, 1, 1, 1, 1,
-0.6729566, 0.1219635, -1.985043, 1, 1, 1, 1, 1,
-0.6726869, 1.685674, 1.315943, 1, 1, 1, 1, 1,
-0.6725598, -0.3069631, -2.044933, 1, 1, 1, 1, 1,
-0.6694382, -0.603748, -1.368899, 1, 1, 1, 1, 1,
-0.6685372, -1.244922, -1.140471, 1, 1, 1, 1, 1,
-0.6684471, 0.6356579, 0.0005668032, 1, 1, 1, 1, 1,
-0.6671248, 0.01011526, -0.7388817, 1, 1, 1, 1, 1,
-0.665427, -1.4301, -3.934907, 1, 1, 1, 1, 1,
-0.6613034, -0.1600545, -2.42833, 1, 1, 1, 1, 1,
-0.6528246, -0.8572454, -1.302275, 0, 0, 1, 1, 1,
-0.6490459, -0.2432299, -2.279075, 1, 0, 0, 1, 1,
-0.6439474, -1.128269, -3.716749, 1, 0, 0, 1, 1,
-0.6426079, -0.1071764, -2.699279, 1, 0, 0, 1, 1,
-0.6355291, 0.3341625, -1.306699, 1, 0, 0, 1, 1,
-0.6333687, -1.131331, -4.987398, 1, 0, 0, 1, 1,
-0.6207076, 0.07118281, -2.250822, 0, 0, 0, 1, 1,
-0.6201659, 0.2382468, 0.9449, 0, 0, 0, 1, 1,
-0.6157996, -2.835171, -4.168474, 0, 0, 0, 1, 1,
-0.6101202, 0.574882, 1.501624, 0, 0, 0, 1, 1,
-0.6052215, 0.5555457, -2.07128, 0, 0, 0, 1, 1,
-0.6002123, -0.5201122, -2.797613, 0, 0, 0, 1, 1,
-0.5987649, -0.3956704, -1.462026, 0, 0, 0, 1, 1,
-0.5985065, -0.2792937, -3.65086, 1, 1, 1, 1, 1,
-0.5975612, 0.17114, -1.635238, 1, 1, 1, 1, 1,
-0.5937334, 0.2436136, -2.92978, 1, 1, 1, 1, 1,
-0.5838993, 0.9862871, -0.8565609, 1, 1, 1, 1, 1,
-0.5785983, -0.8633561, -2.707291, 1, 1, 1, 1, 1,
-0.5780298, -0.07726116, 0.6730696, 1, 1, 1, 1, 1,
-0.5691415, -1.152181, -3.950065, 1, 1, 1, 1, 1,
-0.5687053, -0.7679661, -3.376765, 1, 1, 1, 1, 1,
-0.5685487, -0.8671449, -1.403655, 1, 1, 1, 1, 1,
-0.5684236, 0.2510142, -0.949706, 1, 1, 1, 1, 1,
-0.564742, 0.6731005, -1.416463, 1, 1, 1, 1, 1,
-0.5611096, 1.863339, 1.088467, 1, 1, 1, 1, 1,
-0.5539869, 0.8482708, -0.8305007, 1, 1, 1, 1, 1,
-0.5494459, 0.2782475, -1.085481, 1, 1, 1, 1, 1,
-0.5484456, 0.4285146, -1.209029, 1, 1, 1, 1, 1,
-0.5478847, 1.202621, -1.520284, 0, 0, 1, 1, 1,
-0.5471785, 0.5186465, 0.2440099, 1, 0, 0, 1, 1,
-0.5438461, -0.5387608, -2.065988, 1, 0, 0, 1, 1,
-0.5404905, 0.5159984, -0.4444319, 1, 0, 0, 1, 1,
-0.540233, 2.545977, -0.0726973, 1, 0, 0, 1, 1,
-0.5376717, -0.9454846, -2.435566, 1, 0, 0, 1, 1,
-0.5365441, -0.5429242, -4.000931, 0, 0, 0, 1, 1,
-0.532685, 0.756206, 0.6891975, 0, 0, 0, 1, 1,
-0.52382, 0.5881472, -0.9628733, 0, 0, 0, 1, 1,
-0.5219575, -0.03402653, -2.361633, 0, 0, 0, 1, 1,
-0.5205794, -1.427526, -3.771481, 0, 0, 0, 1, 1,
-0.516481, 0.1758167, -0.02031196, 0, 0, 0, 1, 1,
-0.5158341, 0.9437702, -0.4158437, 0, 0, 0, 1, 1,
-0.5140536, -0.4786453, -1.096464, 1, 1, 1, 1, 1,
-0.5117948, -0.9162003, -3.294426, 1, 1, 1, 1, 1,
-0.5104385, 0.9159482, 0.8739486, 1, 1, 1, 1, 1,
-0.506039, 1.259601, -1.878783, 1, 1, 1, 1, 1,
-0.5045909, 1.537219, -1.70928, 1, 1, 1, 1, 1,
-0.5043513, 0.02324412, -3.562112, 1, 1, 1, 1, 1,
-0.4945414, 0.02317353, -2.389861, 1, 1, 1, 1, 1,
-0.4940001, 1.120017, -0.7382685, 1, 1, 1, 1, 1,
-0.4926419, 1.178305, -1.579561, 1, 1, 1, 1, 1,
-0.4904137, 0.9782896, -0.6522422, 1, 1, 1, 1, 1,
-0.4780276, 1.934628, -1.588686, 1, 1, 1, 1, 1,
-0.4660148, 1.012406, -1.754695, 1, 1, 1, 1, 1,
-0.4654059, 0.577504, -0.408154, 1, 1, 1, 1, 1,
-0.4647297, 1.064854, -0.1387592, 1, 1, 1, 1, 1,
-0.4644312, 0.1487901, -2.471157, 1, 1, 1, 1, 1,
-0.4608838, -0.3092166, -1.591851, 0, 0, 1, 1, 1,
-0.4607481, -0.04297705, -2.696982, 1, 0, 0, 1, 1,
-0.4584071, -1.150571, -3.425133, 1, 0, 0, 1, 1,
-0.4551564, -1.712092, -3.151479, 1, 0, 0, 1, 1,
-0.4516838, -0.0746211, -1.059202, 1, 0, 0, 1, 1,
-0.4515911, 0.1179567, 0.3416433, 1, 0, 0, 1, 1,
-0.4487481, -0.6069244, -3.468266, 0, 0, 0, 1, 1,
-0.4422936, -1.266099, -1.510451, 0, 0, 0, 1, 1,
-0.4402819, 2.591808, -1.795063, 0, 0, 0, 1, 1,
-0.4339615, -0.1805613, -1.908188, 0, 0, 0, 1, 1,
-0.4338306, 2.043739, -0.7043439, 0, 0, 0, 1, 1,
-0.4325936, -0.02320732, -1.16944, 0, 0, 0, 1, 1,
-0.4305083, 0.6062003, -0.1579068, 0, 0, 0, 1, 1,
-0.4277402, 0.9543154, -0.522925, 1, 1, 1, 1, 1,
-0.4264592, 0.01755582, -2.195009, 1, 1, 1, 1, 1,
-0.4171811, -0.05915756, -1.754235, 1, 1, 1, 1, 1,
-0.416764, 0.4261504, -0.1446172, 1, 1, 1, 1, 1,
-0.414676, 0.675478, -0.7265511, 1, 1, 1, 1, 1,
-0.4077598, -0.3647015, 0.09317083, 1, 1, 1, 1, 1,
-0.4013592, 0.7389532, -1.131259, 1, 1, 1, 1, 1,
-0.4010636, -1.445145, -3.778748, 1, 1, 1, 1, 1,
-0.3963133, 0.3946635, -3.859155, 1, 1, 1, 1, 1,
-0.3955827, 1.099201, 1.037547, 1, 1, 1, 1, 1,
-0.3944246, 2.979317, -0.4869024, 1, 1, 1, 1, 1,
-0.3942741, -0.08767016, -2.254982, 1, 1, 1, 1, 1,
-0.393829, 1.429216, 1.069413, 1, 1, 1, 1, 1,
-0.3881245, -0.1058793, -0.8591444, 1, 1, 1, 1, 1,
-0.3855936, 1.511864, -2.631766, 1, 1, 1, 1, 1,
-0.3855565, 0.849085, 0.344289, 0, 0, 1, 1, 1,
-0.3846252, 1.206512, 0.8132757, 1, 0, 0, 1, 1,
-0.3827431, 1.463058, -0.932677, 1, 0, 0, 1, 1,
-0.3827055, -0.9343812, -3.40808, 1, 0, 0, 1, 1,
-0.3794105, -1.24354, -2.827377, 1, 0, 0, 1, 1,
-0.377993, 0.358862, -0.5321202, 1, 0, 0, 1, 1,
-0.3773128, 1.527009, -0.07879736, 0, 0, 0, 1, 1,
-0.3740931, -0.1906686, -1.431278, 0, 0, 0, 1, 1,
-0.3646224, 0.964143, 0.5727547, 0, 0, 0, 1, 1,
-0.3644637, -0.4327899, -2.314718, 0, 0, 0, 1, 1,
-0.3636303, -2.503302, -3.725948, 0, 0, 0, 1, 1,
-0.3519494, 0.9074973, -0.2816377, 0, 0, 0, 1, 1,
-0.3508953, 1.264799, -1.697202, 0, 0, 0, 1, 1,
-0.3507556, -0.3355196, -3.245072, 1, 1, 1, 1, 1,
-0.3503724, 1.396577, -0.1242499, 1, 1, 1, 1, 1,
-0.3484856, -2.297637, -2.030155, 1, 1, 1, 1, 1,
-0.3475813, -1.589513, -1.725447, 1, 1, 1, 1, 1,
-0.3475129, -0.4535875, -3.352193, 1, 1, 1, 1, 1,
-0.3429521, 0.06242794, -0.253902, 1, 1, 1, 1, 1,
-0.342364, 0.7614781, -0.2636254, 1, 1, 1, 1, 1,
-0.3410562, 1.261146, -2.135386, 1, 1, 1, 1, 1,
-0.3295783, 0.8749032, -0.7433634, 1, 1, 1, 1, 1,
-0.3208084, 0.04557085, -2.383107, 1, 1, 1, 1, 1,
-0.3121439, -0.9334067, -2.874267, 1, 1, 1, 1, 1,
-0.305931, 0.4559118, -0.2195587, 1, 1, 1, 1, 1,
-0.3027261, -0.349017, -2.267265, 1, 1, 1, 1, 1,
-0.2973466, 0.1785857, -0.9514943, 1, 1, 1, 1, 1,
-0.2961121, -1.416722, -2.640121, 1, 1, 1, 1, 1,
-0.2957779, -0.8120517, -0.7352977, 0, 0, 1, 1, 1,
-0.2861751, 0.8064699, 0.1224866, 1, 0, 0, 1, 1,
-0.2858718, 1.033656, -0.8856609, 1, 0, 0, 1, 1,
-0.2844871, 0.997238, -0.1170318, 1, 0, 0, 1, 1,
-0.2844343, 1.67499, 0.8517527, 1, 0, 0, 1, 1,
-0.2782675, 0.5302916, -0.6166828, 1, 0, 0, 1, 1,
-0.275003, -2.153133, -4.019384, 0, 0, 0, 1, 1,
-0.2692659, -2.022889, -4.962955, 0, 0, 0, 1, 1,
-0.2602663, 0.3106434, -0.865769, 0, 0, 0, 1, 1,
-0.2602237, -0.3727069, -2.378143, 0, 0, 0, 1, 1,
-0.256867, 0.04283836, -1.366341, 0, 0, 0, 1, 1,
-0.2503042, -0.1949761, -3.234908, 0, 0, 0, 1, 1,
-0.248574, -0.6058822, -2.994983, 0, 0, 0, 1, 1,
-0.2484126, 0.8073589, 0.3922896, 1, 1, 1, 1, 1,
-0.2462381, 1.305248, 3.103149, 1, 1, 1, 1, 1,
-0.245419, 1.648225, -1.2481, 1, 1, 1, 1, 1,
-0.244701, -1.073533, -3.328082, 1, 1, 1, 1, 1,
-0.2426345, -0.6137596, -2.649181, 1, 1, 1, 1, 1,
-0.2382602, 0.9199387, 1.377434, 1, 1, 1, 1, 1,
-0.233259, 1.190179, -0.8531362, 1, 1, 1, 1, 1,
-0.2332275, 0.2178059, 0.1647552, 1, 1, 1, 1, 1,
-0.2194436, 0.8141233, 2.339876, 1, 1, 1, 1, 1,
-0.2158981, -2.185525, -3.355654, 1, 1, 1, 1, 1,
-0.2095372, -1.038871, -3.927393, 1, 1, 1, 1, 1,
-0.20907, 1.62927, 1.053039, 1, 1, 1, 1, 1,
-0.2078471, 0.6905627, 0.04669993, 1, 1, 1, 1, 1,
-0.2061601, 1.239312, -1.587704, 1, 1, 1, 1, 1,
-0.20513, -1.591719, -4.734126, 1, 1, 1, 1, 1,
-0.2034534, 1.390437, -0.2982976, 0, 0, 1, 1, 1,
-0.2021913, 1.15337, -0.7048661, 1, 0, 0, 1, 1,
-0.1969517, -0.5278029, -2.890824, 1, 0, 0, 1, 1,
-0.1959506, 0.004968744, -0.7639498, 1, 0, 0, 1, 1,
-0.1942196, -0.9055104, -1.879251, 1, 0, 0, 1, 1,
-0.1937847, -1.12057, -4.079113, 1, 0, 0, 1, 1,
-0.1935479, -0.3861839, -1.430306, 0, 0, 0, 1, 1,
-0.1924641, -0.02703775, -0.8566567, 0, 0, 0, 1, 1,
-0.1916356, -0.09037275, -1.628229, 0, 0, 0, 1, 1,
-0.1908641, -0.3413928, -3.324363, 0, 0, 0, 1, 1,
-0.1868684, 0.8301554, -0.6953894, 0, 0, 0, 1, 1,
-0.1867433, 1.122957, -0.6522301, 0, 0, 0, 1, 1,
-0.1867419, 0.02761914, -1.999322, 0, 0, 0, 1, 1,
-0.186634, -0.5622302, -2.022244, 1, 1, 1, 1, 1,
-0.1842381, -2.163946, -4.199074, 1, 1, 1, 1, 1,
-0.1780012, -1.605721, -5.330215, 1, 1, 1, 1, 1,
-0.177994, 0.6412309, -1.031872, 1, 1, 1, 1, 1,
-0.1777198, -1.153734, -3.157165, 1, 1, 1, 1, 1,
-0.1774679, 0.9041606, -0.3166018, 1, 1, 1, 1, 1,
-0.1697271, 0.3888389, 0.447041, 1, 1, 1, 1, 1,
-0.1624278, 0.1466412, -1.571503, 1, 1, 1, 1, 1,
-0.1597474, -0.7453334, -1.480938, 1, 1, 1, 1, 1,
-0.1596575, -0.393237, -2.980568, 1, 1, 1, 1, 1,
-0.1561876, -0.1744452, -2.710465, 1, 1, 1, 1, 1,
-0.1534746, 1.403969, -0.1943148, 1, 1, 1, 1, 1,
-0.1527712, 0.1687479, -2.327415, 1, 1, 1, 1, 1,
-0.1443982, -0.5647867, -3.062644, 1, 1, 1, 1, 1,
-0.1442935, 0.8174226, -0.06169437, 1, 1, 1, 1, 1,
-0.1434417, -0.009210835, -1.594197, 0, 0, 1, 1, 1,
-0.1429, -0.855313, -2.975903, 1, 0, 0, 1, 1,
-0.1402536, -0.6697175, -2.902139, 1, 0, 0, 1, 1,
-0.1397758, 1.381936, 0.3811595, 1, 0, 0, 1, 1,
-0.1381348, -0.1917649, -2.921169, 1, 0, 0, 1, 1,
-0.1361442, -0.2942365, -2.737478, 1, 0, 0, 1, 1,
-0.1335618, -1.476149, -3.706767, 0, 0, 0, 1, 1,
-0.1334514, -0.8145897, -2.324982, 0, 0, 0, 1, 1,
-0.1322783, 1.181787, -0.415237, 0, 0, 0, 1, 1,
-0.1288716, -0.1248988, -2.013436, 0, 0, 0, 1, 1,
-0.1256282, 1.414738, -0.1660162, 0, 0, 0, 1, 1,
-0.1238687, 0.2318267, 1.399944, 0, 0, 0, 1, 1,
-0.1227961, 1.14132, -0.1935825, 0, 0, 0, 1, 1,
-0.1194732, -1.450271, -2.247278, 1, 1, 1, 1, 1,
-0.1143564, 0.4039145, 1.608916, 1, 1, 1, 1, 1,
-0.1116795, -2.484616, -2.460149, 1, 1, 1, 1, 1,
-0.1067245, -1.401239, -5.191536, 1, 1, 1, 1, 1,
-0.1057818, 1.049433, 0.2002381, 1, 1, 1, 1, 1,
-0.1015982, 1.357132, 1.800187, 1, 1, 1, 1, 1,
-0.0972839, -1.458972, -3.085296, 1, 1, 1, 1, 1,
-0.09647459, -1.088301, -2.855832, 1, 1, 1, 1, 1,
-0.09613831, 0.7063759, 0.5022159, 1, 1, 1, 1, 1,
-0.095247, 1.142446, -0.621551, 1, 1, 1, 1, 1,
-0.09488447, -0.4579899, -2.307415, 1, 1, 1, 1, 1,
-0.09391727, 0.2348744, -1.8268, 1, 1, 1, 1, 1,
-0.09294599, -0.3975834, -3.315375, 1, 1, 1, 1, 1,
-0.09099563, 0.2038048, -0.4541074, 1, 1, 1, 1, 1,
-0.08939815, -0.5658789, -2.364552, 1, 1, 1, 1, 1,
-0.08762808, -1.336441, -1.774229, 0, 0, 1, 1, 1,
-0.08262122, -0.9967211, -1.130581, 1, 0, 0, 1, 1,
-0.07842234, 2.224406, -0.9194876, 1, 0, 0, 1, 1,
-0.07810964, -0.5110092, -2.381179, 1, 0, 0, 1, 1,
-0.07566708, -0.2158474, -1.64508, 1, 0, 0, 1, 1,
-0.07519607, -1.025306, -1.411343, 1, 0, 0, 1, 1,
-0.07509591, 0.6201591, -0.2568723, 0, 0, 0, 1, 1,
-0.07403495, -0.05084963, -2.431676, 0, 0, 0, 1, 1,
-0.07312945, -0.05258767, -1.456615, 0, 0, 0, 1, 1,
-0.07091138, 0.8129308, 0.01970935, 0, 0, 0, 1, 1,
-0.06634546, -1.22388, -3.599545, 0, 0, 0, 1, 1,
-0.06483079, 0.357218, 1.243237, 0, 0, 0, 1, 1,
-0.06469301, 0.2158462, 0.2758052, 0, 0, 0, 1, 1,
-0.059464, 0.5977877, -0.4065966, 1, 1, 1, 1, 1,
-0.05752417, -0.2672825, -3.949058, 1, 1, 1, 1, 1,
-0.05496467, -1.18411, -0.6453352, 1, 1, 1, 1, 1,
-0.05183096, 1.268273, -1.302329, 1, 1, 1, 1, 1,
-0.04879926, -0.2529805, -2.42622, 1, 1, 1, 1, 1,
-0.04774746, 0.1859307, -0.3736945, 1, 1, 1, 1, 1,
-0.04730458, -0.3473437, -3.683851, 1, 1, 1, 1, 1,
-0.04224131, 0.5975391, -0.5902067, 1, 1, 1, 1, 1,
-0.04189843, 0.3496124, 1.461234, 1, 1, 1, 1, 1,
-0.04084055, -1.44925, -2.039559, 1, 1, 1, 1, 1,
-0.04028117, -0.6548725, -4.503319, 1, 1, 1, 1, 1,
-0.03933092, 1.474886, -0.1838629, 1, 1, 1, 1, 1,
-0.03764362, -0.6295782, -3.608844, 1, 1, 1, 1, 1,
-0.03588, 1.018387, -0.4034862, 1, 1, 1, 1, 1,
-0.03164906, 0.2406633, 0.3468146, 1, 1, 1, 1, 1,
-0.02689078, 0.1610709, -1.363888, 0, 0, 1, 1, 1,
-0.02281531, -0.1413939, -4.026917, 1, 0, 0, 1, 1,
-0.02202591, -0.890286, -4.309323, 1, 0, 0, 1, 1,
-0.01957866, -1.093557, -1.63252, 1, 0, 0, 1, 1,
-0.01743513, -0.1182212, -2.979637, 1, 0, 0, 1, 1,
-0.01576973, -0.982514, -3.309373, 1, 0, 0, 1, 1,
-0.01496487, -0.1034044, -3.339334, 0, 0, 0, 1, 1,
-0.01399139, -0.5208557, 0.1653584, 0, 0, 0, 1, 1,
-0.01375384, 1.949608, -0.9417819, 0, 0, 0, 1, 1,
-0.01044982, -1.366744, -2.552452, 0, 0, 0, 1, 1,
-0.008991863, -0.1731466, -3.943989, 0, 0, 0, 1, 1,
-0.004759727, -0.6621373, -3.488011, 0, 0, 0, 1, 1,
-0.000178142, -0.2225321, -2.567625, 0, 0, 0, 1, 1,
0.005573244, 0.04598848, -0.8875029, 1, 1, 1, 1, 1,
0.009278222, -1.514833, 2.682315, 1, 1, 1, 1, 1,
0.01151265, -1.649545, 2.189523, 1, 1, 1, 1, 1,
0.01160552, 1.099267, -0.187004, 1, 1, 1, 1, 1,
0.01292568, -0.5834668, 3.515192, 1, 1, 1, 1, 1,
0.01696136, -2.111656, 1.800671, 1, 1, 1, 1, 1,
0.01796048, -1.494533, 2.190253, 1, 1, 1, 1, 1,
0.0184307, 0.9076676, -0.451842, 1, 1, 1, 1, 1,
0.01850049, -0.9311011, 3.739623, 1, 1, 1, 1, 1,
0.02127309, 0.6021588, 0.2542876, 1, 1, 1, 1, 1,
0.02614572, -0.1492133, 1.942763, 1, 1, 1, 1, 1,
0.03198459, -1.29569, 2.323513, 1, 1, 1, 1, 1,
0.03220075, -1.426613, 1.113722, 1, 1, 1, 1, 1,
0.03299255, -1.350489, 3.906823, 1, 1, 1, 1, 1,
0.03927606, -0.4455582, 4.61801, 1, 1, 1, 1, 1,
0.04062498, -0.5558982, 4.181615, 0, 0, 1, 1, 1,
0.04386691, -0.09800154, 2.732557, 1, 0, 0, 1, 1,
0.0445663, 0.6540557, 0.9274195, 1, 0, 0, 1, 1,
0.04580536, 0.7974851, 2.120543, 1, 0, 0, 1, 1,
0.04724077, 0.9028308, 0.9651775, 1, 0, 0, 1, 1,
0.0483816, 2.152321, -0.3373903, 1, 0, 0, 1, 1,
0.04894409, 0.5292079, -1.583238, 0, 0, 0, 1, 1,
0.05096209, 0.208728, 1.862586, 0, 0, 0, 1, 1,
0.0532088, -1.002501, 2.961236, 0, 0, 0, 1, 1,
0.05509794, -0.2254287, 3.404404, 0, 0, 0, 1, 1,
0.05824661, 0.5379037, -0.6509468, 0, 0, 0, 1, 1,
0.05982315, -1.095349, 2.638798, 0, 0, 0, 1, 1,
0.06289022, 0.8821077, 0.3452569, 0, 0, 0, 1, 1,
0.06479835, 1.589731, 1.037502, 1, 1, 1, 1, 1,
0.06763595, -0.5718164, 1.747552, 1, 1, 1, 1, 1,
0.06815205, -0.5232044, 2.928128, 1, 1, 1, 1, 1,
0.06935218, -0.6275286, 2.901683, 1, 1, 1, 1, 1,
0.06973527, -1.102224, 3.965325, 1, 1, 1, 1, 1,
0.07322013, -0.4241258, 2.567994, 1, 1, 1, 1, 1,
0.07425257, 0.7458467, -0.5429581, 1, 1, 1, 1, 1,
0.07628491, -0.1499174, 1.528426, 1, 1, 1, 1, 1,
0.07686876, 0.9453673, -0.6873391, 1, 1, 1, 1, 1,
0.07876819, -1.631909, 3.684907, 1, 1, 1, 1, 1,
0.07945528, -2.323777, 3.058346, 1, 1, 1, 1, 1,
0.07955756, 0.9429115, -0.5232028, 1, 1, 1, 1, 1,
0.08097087, 1.020061, -0.6833162, 1, 1, 1, 1, 1,
0.08304597, -0.1989344, 3.831136, 1, 1, 1, 1, 1,
0.0845091, -0.5472134, 3.700301, 1, 1, 1, 1, 1,
0.09156227, -1.767656, 2.083143, 0, 0, 1, 1, 1,
0.0922257, -0.1677765, 2.648364, 1, 0, 0, 1, 1,
0.09306554, 0.6743, 0.1828906, 1, 0, 0, 1, 1,
0.09688136, 0.4257832, -0.8461244, 1, 0, 0, 1, 1,
0.09690619, 2.674863, -0.9867724, 1, 0, 0, 1, 1,
0.09706755, 0.3732549, -2.151673, 1, 0, 0, 1, 1,
0.09801903, 0.04655593, 1.530845, 0, 0, 0, 1, 1,
0.0993037, 0.3099398, 1.105655, 0, 0, 0, 1, 1,
0.1002192, -1.267522, 4.009307, 0, 0, 0, 1, 1,
0.1004741, 0.9456265, -0.5804959, 0, 0, 0, 1, 1,
0.1009827, -0.9058117, 2.686637, 0, 0, 0, 1, 1,
0.1016189, -2.077226, 1.97793, 0, 0, 0, 1, 1,
0.1017377, -3.340881, 1.633267, 0, 0, 0, 1, 1,
0.1035107, -1.156361, 4.198291, 1, 1, 1, 1, 1,
0.1099314, 0.08258484, -0.2127159, 1, 1, 1, 1, 1,
0.1099521, -0.9537586, 4.395058, 1, 1, 1, 1, 1,
0.1131106, -0.827674, 4.848753, 1, 1, 1, 1, 1,
0.1150554, 0.3353252, -0.9607481, 1, 1, 1, 1, 1,
0.1155142, -0.9667912, 3.282764, 1, 1, 1, 1, 1,
0.1158319, -1.508617, 3.404706, 1, 1, 1, 1, 1,
0.1167602, 0.3234145, 1.47198, 1, 1, 1, 1, 1,
0.1192907, 0.2303002, -0.1707373, 1, 1, 1, 1, 1,
0.1201004, -0.3237055, 1.589576, 1, 1, 1, 1, 1,
0.1209257, 0.7779999, -0.09857061, 1, 1, 1, 1, 1,
0.1232891, -0.001682041, 0.2933063, 1, 1, 1, 1, 1,
0.1251233, -0.320614, 3.588409, 1, 1, 1, 1, 1,
0.1267352, 0.8152547, 0.6916213, 1, 1, 1, 1, 1,
0.1281782, 0.5342192, 1.333401, 1, 1, 1, 1, 1,
0.1314442, 0.1358808, 0.9658906, 0, 0, 1, 1, 1,
0.131604, -0.02158308, 1.336313, 1, 0, 0, 1, 1,
0.1340337, -0.3185881, 2.960294, 1, 0, 0, 1, 1,
0.1365818, -0.861195, 4.764914, 1, 0, 0, 1, 1,
0.1410641, -1.52335, 3.510218, 1, 0, 0, 1, 1,
0.1432776, 0.7581751, -0.9605422, 1, 0, 0, 1, 1,
0.1444526, 0.1454213, 0.7075427, 0, 0, 0, 1, 1,
0.1467646, -0.5322962, 2.033454, 0, 0, 0, 1, 1,
0.1522388, 0.4974283, 0.9635706, 0, 0, 0, 1, 1,
0.1550153, 0.9663562, 0.2396636, 0, 0, 0, 1, 1,
0.1558986, 1.595273, 0.7362456, 0, 0, 0, 1, 1,
0.1560654, -1.15777, 2.056877, 0, 0, 0, 1, 1,
0.1600205, -1.150378, 1.731692, 0, 0, 0, 1, 1,
0.1656519, 0.9075837, 1.949385, 1, 1, 1, 1, 1,
0.1662704, 1.029523, 0.9652394, 1, 1, 1, 1, 1,
0.1687336, 0.09231869, -0.250879, 1, 1, 1, 1, 1,
0.1693828, -0.5840532, 3.593121, 1, 1, 1, 1, 1,
0.1710209, 1.266492, -0.8339791, 1, 1, 1, 1, 1,
0.1741503, 1.594828, 0.2790046, 1, 1, 1, 1, 1,
0.1786489, -1.211362, 2.542489, 1, 1, 1, 1, 1,
0.1798948, 0.2603548, -0.6197503, 1, 1, 1, 1, 1,
0.1829294, 0.1890205, 0.7776152, 1, 1, 1, 1, 1,
0.1860565, 0.01611028, 2.513602, 1, 1, 1, 1, 1,
0.1861171, -2.393336, 2.532935, 1, 1, 1, 1, 1,
0.1863512, 0.7535605, 1.643529, 1, 1, 1, 1, 1,
0.187224, 0.06878846, 1.247272, 1, 1, 1, 1, 1,
0.1877204, -0.01792486, 1.267631, 1, 1, 1, 1, 1,
0.1904286, -0.1282513, 1.539097, 1, 1, 1, 1, 1,
0.1921147, 0.6135496, -0.7819981, 0, 0, 1, 1, 1,
0.2013711, -1.358136, 2.964683, 1, 0, 0, 1, 1,
0.2017447, 1.928594, 0.4761977, 1, 0, 0, 1, 1,
0.2017936, -1.526581, 3.83374, 1, 0, 0, 1, 1,
0.2090762, 1.258296, 0.2409316, 1, 0, 0, 1, 1,
0.2106498, -0.5685606, 1.611631, 1, 0, 0, 1, 1,
0.2128705, -0.9271262, 3.23766, 0, 0, 0, 1, 1,
0.2167854, -0.08424287, 2.501874, 0, 0, 0, 1, 1,
0.2190075, -0.335523, 2.097593, 0, 0, 0, 1, 1,
0.221577, -0.6310261, 4.241356, 0, 0, 0, 1, 1,
0.2241997, -0.6389419, 2.581289, 0, 0, 0, 1, 1,
0.2255124, 0.5168219, -0.7331607, 0, 0, 0, 1, 1,
0.227869, 0.4626794, 0.7888781, 0, 0, 0, 1, 1,
0.2329612, -0.1584001, 3.084421, 1, 1, 1, 1, 1,
0.2389191, -1.134615, 4.643631, 1, 1, 1, 1, 1,
0.2404833, 1.950577, -1.148274, 1, 1, 1, 1, 1,
0.244242, 1.93137, 0.2182433, 1, 1, 1, 1, 1,
0.2466241, -1.758873, 5.002069, 1, 1, 1, 1, 1,
0.2486352, 0.8937641, -0.3129941, 1, 1, 1, 1, 1,
0.2559433, 0.3395122, 1.646453, 1, 1, 1, 1, 1,
0.256852, 0.02459057, 0.3357103, 1, 1, 1, 1, 1,
0.2570572, 1.453035, 0.3787959, 1, 1, 1, 1, 1,
0.2571354, 0.2528461, -1.142611, 1, 1, 1, 1, 1,
0.259358, 0.186171, 0.686746, 1, 1, 1, 1, 1,
0.2836719, -0.2146001, 3.304752, 1, 1, 1, 1, 1,
0.2856247, -0.7056454, 4.810375, 1, 1, 1, 1, 1,
0.2884299, -0.543022, 2.184484, 1, 1, 1, 1, 1,
0.2888254, -0.3180341, 2.165989, 1, 1, 1, 1, 1,
0.2894224, -0.7125785, 2.124941, 0, 0, 1, 1, 1,
0.2898642, 1.116516, 0.6462429, 1, 0, 0, 1, 1,
0.2985935, -0.2586489, 2.872645, 1, 0, 0, 1, 1,
0.3043132, -0.9123175, 2.718503, 1, 0, 0, 1, 1,
0.3076306, 1.002454, 0.710129, 1, 0, 0, 1, 1,
0.3079957, -1.925815, 3.519248, 1, 0, 0, 1, 1,
0.310077, 0.8365887, 1.435733, 0, 0, 0, 1, 1,
0.3139891, 0.08327414, 0.5172888, 0, 0, 0, 1, 1,
0.3154913, 0.8477129, 3.212825, 0, 0, 0, 1, 1,
0.318587, -0.4057273, 1.799717, 0, 0, 0, 1, 1,
0.3188093, -0.4713053, 3.755859, 0, 0, 0, 1, 1,
0.3204628, -0.8168727, 1.441002, 0, 0, 0, 1, 1,
0.3211432, 1.538868, -0.3347035, 0, 0, 0, 1, 1,
0.3231575, -1.523991, 4.001152, 1, 1, 1, 1, 1,
0.3244205, -0.4943034, 2.803042, 1, 1, 1, 1, 1,
0.3262385, 0.974208, 1.903392, 1, 1, 1, 1, 1,
0.3288959, 1.242771, 0.9475146, 1, 1, 1, 1, 1,
0.3290875, 1.518755, 1.388054, 1, 1, 1, 1, 1,
0.335435, 0.5703507, 2.918903, 1, 1, 1, 1, 1,
0.337468, -0.8845686, 2.924199, 1, 1, 1, 1, 1,
0.3413997, 0.127945, 2.051525, 1, 1, 1, 1, 1,
0.347827, 0.2760847, 0.7971949, 1, 1, 1, 1, 1,
0.3484275, 1.133465, 0.5611928, 1, 1, 1, 1, 1,
0.3537543, -0.7805907, 1.696847, 1, 1, 1, 1, 1,
0.3569252, -0.01385637, 1.192993, 1, 1, 1, 1, 1,
0.360637, -0.5195177, 3.278141, 1, 1, 1, 1, 1,
0.3623035, -0.1446919, 1.448637, 1, 1, 1, 1, 1,
0.3630873, 0.291217, 2.911772, 1, 1, 1, 1, 1,
0.3632582, -0.9476708, 3.756914, 0, 0, 1, 1, 1,
0.3643288, 2.077836, -0.741842, 1, 0, 0, 1, 1,
0.3649786, -1.113769, 1.424783, 1, 0, 0, 1, 1,
0.3775249, 1.238542, 0.4459264, 1, 0, 0, 1, 1,
0.3782837, 0.37481, 0.02162282, 1, 0, 0, 1, 1,
0.3792189, -0.2104926, 1.981688, 1, 0, 0, 1, 1,
0.3818825, -0.2166979, 3.284013, 0, 0, 0, 1, 1,
0.3819349, 1.2195, 0.3847454, 0, 0, 0, 1, 1,
0.3894135, -0.1619482, 2.625751, 0, 0, 0, 1, 1,
0.3910023, 0.7605999, 0.8832681, 0, 0, 0, 1, 1,
0.400873, 0.2875945, 0.9199612, 0, 0, 0, 1, 1,
0.4031997, -0.2891023, 2.336126, 0, 0, 0, 1, 1,
0.4035817, -0.9128404, 1.38341, 0, 0, 0, 1, 1,
0.403823, -1.22523, 2.90756, 1, 1, 1, 1, 1,
0.410325, -0.1509457, 0.6619531, 1, 1, 1, 1, 1,
0.4185452, -0.33465, 2.308889, 1, 1, 1, 1, 1,
0.4221822, -1.125043, 0.9648414, 1, 1, 1, 1, 1,
0.422896, 0.9506387, 1.205018, 1, 1, 1, 1, 1,
0.4257624, 1.516997, -0.4878792, 1, 1, 1, 1, 1,
0.4263055, 0.2096909, 1.951002, 1, 1, 1, 1, 1,
0.4267453, -0.4124804, 2.210521, 1, 1, 1, 1, 1,
0.4277478, 0.375049, -0.4573671, 1, 1, 1, 1, 1,
0.4293985, 0.6155177, 0.7527619, 1, 1, 1, 1, 1,
0.4350567, 1.991713, -0.8436844, 1, 1, 1, 1, 1,
0.4389772, 0.9233949, 0.2502581, 1, 1, 1, 1, 1,
0.4404107, -0.1809673, 0.1755275, 1, 1, 1, 1, 1,
0.4431226, -0.9615915, 2.854622, 1, 1, 1, 1, 1,
0.4488155, -0.05867048, 1.221396, 1, 1, 1, 1, 1,
0.4507977, 1.076829, -0.4705519, 0, 0, 1, 1, 1,
0.453407, 0.5389723, 1.050844, 1, 0, 0, 1, 1,
0.456205, -0.9388208, 3.436464, 1, 0, 0, 1, 1,
0.457894, 0.036182, 0.9124604, 1, 0, 0, 1, 1,
0.4652303, 0.3671787, -1.247744, 1, 0, 0, 1, 1,
0.4696007, -0.3818788, 2.40624, 1, 0, 0, 1, 1,
0.4709349, 0.6818416, -1.21208, 0, 0, 0, 1, 1,
0.4711179, -0.4528258, 1.53422, 0, 0, 0, 1, 1,
0.4715494, -1.221915, 2.983986, 0, 0, 0, 1, 1,
0.4725991, -0.4537879, 1.410006, 0, 0, 0, 1, 1,
0.4732238, -0.03835296, 1.22218, 0, 0, 0, 1, 1,
0.4746928, 0.249257, 1.600933, 0, 0, 0, 1, 1,
0.4786141, 0.86401, 0.06639875, 0, 0, 0, 1, 1,
0.4808665, -1.334384, 1.756659, 1, 1, 1, 1, 1,
0.481554, 0.7449033, 0.2764515, 1, 1, 1, 1, 1,
0.4826115, 0.6434138, 0.8738772, 1, 1, 1, 1, 1,
0.4898908, -0.3241692, 1.159825, 1, 1, 1, 1, 1,
0.4962395, 1.303941, 0.589386, 1, 1, 1, 1, 1,
0.5003412, 0.2438579, 3.366986, 1, 1, 1, 1, 1,
0.5006098, 0.3244371, 0.4423063, 1, 1, 1, 1, 1,
0.5008913, 1.605245, 1.261585, 1, 1, 1, 1, 1,
0.5011326, -1.790965, 1.667016, 1, 1, 1, 1, 1,
0.5104724, -1.146299, 2.819169, 1, 1, 1, 1, 1,
0.5139828, 1.777638, 1.289284, 1, 1, 1, 1, 1,
0.5142292, -0.166482, 1.252178, 1, 1, 1, 1, 1,
0.5220186, 0.1990405, -0.009257065, 1, 1, 1, 1, 1,
0.5241493, -0.1491604, 2.299312, 1, 1, 1, 1, 1,
0.5268686, 1.639221, -0.2334321, 1, 1, 1, 1, 1,
0.531422, 0.6661451, 2.697263, 0, 0, 1, 1, 1,
0.534946, 1.741973, -1.193573, 1, 0, 0, 1, 1,
0.5366748, -0.9758918, 2.868202, 1, 0, 0, 1, 1,
0.5392051, 1.753519, 1.295808, 1, 0, 0, 1, 1,
0.5397339, -0.706005, 0.6470596, 1, 0, 0, 1, 1,
0.5402355, -0.3833636, 3.057296, 1, 0, 0, 1, 1,
0.5457485, -1.736809, 3.009402, 0, 0, 0, 1, 1,
0.558648, 0.7077055, 0.5638159, 0, 0, 0, 1, 1,
0.5602061, -0.1048776, 2.031912, 0, 0, 0, 1, 1,
0.5672624, -0.634449, 2.342191, 0, 0, 0, 1, 1,
0.5677662, -1.258671, 2.222055, 0, 0, 0, 1, 1,
0.5687908, 0.1454114, 1.799766, 0, 0, 0, 1, 1,
0.5712346, -0.1558489, 1.349625, 0, 0, 0, 1, 1,
0.5717427, 1.211893, -0.594679, 1, 1, 1, 1, 1,
0.5734794, 0.1412915, 0.1762643, 1, 1, 1, 1, 1,
0.5778422, -0.0307575, 2.454169, 1, 1, 1, 1, 1,
0.5781966, -0.4955391, 2.80392, 1, 1, 1, 1, 1,
0.5876631, -0.9259846, 2.878999, 1, 1, 1, 1, 1,
0.5878912, 0.2793027, 1.168531, 1, 1, 1, 1, 1,
0.5926149, -1.767433, 2.287894, 1, 1, 1, 1, 1,
0.5964511, 0.1438762, 2.144582, 1, 1, 1, 1, 1,
0.597437, 1.050497, 1.579586, 1, 1, 1, 1, 1,
0.6075394, -0.7970203, 1.483512, 1, 1, 1, 1, 1,
0.6105211, -1.212984, 2.237124, 1, 1, 1, 1, 1,
0.6118274, 2.269066, -0.1580227, 1, 1, 1, 1, 1,
0.6136536, -1.30962, 3.34024, 1, 1, 1, 1, 1,
0.6138743, 1.918555, 0.9144011, 1, 1, 1, 1, 1,
0.6161584, 0.1731333, 2.151982, 1, 1, 1, 1, 1,
0.6164525, 2.375031, 0.9777832, 0, 0, 1, 1, 1,
0.6166253, -0.2339359, 1.444171, 1, 0, 0, 1, 1,
0.6172987, -0.5118524, 2.028355, 1, 0, 0, 1, 1,
0.6196669, 0.6845914, 2.636688, 1, 0, 0, 1, 1,
0.6208917, 0.04877422, 1.232832, 1, 0, 0, 1, 1,
0.6221689, -0.3856182, 2.319857, 1, 0, 0, 1, 1,
0.6277723, 0.0239228, 2.945226, 0, 0, 0, 1, 1,
0.6278447, 0.824849, -0.04083345, 0, 0, 0, 1, 1,
0.6295869, 0.3140813, 0.4861339, 0, 0, 0, 1, 1,
0.6338051, 0.4132341, 1.900146, 0, 0, 0, 1, 1,
0.6426215, 0.2658606, 0.08035599, 0, 0, 0, 1, 1,
0.6430058, 0.2177854, 1.119572, 0, 0, 0, 1, 1,
0.6458161, -0.9718969, 1.163941, 0, 0, 0, 1, 1,
0.6459884, -0.6318378, 2.033223, 1, 1, 1, 1, 1,
0.6512738, -0.2988024, 1.996111, 1, 1, 1, 1, 1,
0.6515722, 0.07438286, 1.316721, 1, 1, 1, 1, 1,
0.6519917, 1.513588, 0.3628025, 1, 1, 1, 1, 1,
0.6531123, 1.074363, 1.018321, 1, 1, 1, 1, 1,
0.653699, 0.01048795, 1.113247, 1, 1, 1, 1, 1,
0.655167, 0.9164881, -0.6177206, 1, 1, 1, 1, 1,
0.6563898, 0.07752076, 2.914273, 1, 1, 1, 1, 1,
0.6578743, 0.5839357, 1.825979, 1, 1, 1, 1, 1,
0.6591721, 0.3460993, 0.1064404, 1, 1, 1, 1, 1,
0.6603993, -1.019484, 2.978693, 1, 1, 1, 1, 1,
0.6612536, 1.765353, 1.769491, 1, 1, 1, 1, 1,
0.6646204, 0.05243871, 0.824248, 1, 1, 1, 1, 1,
0.667357, -0.1742108, 1.863604, 1, 1, 1, 1, 1,
0.6755439, -1.26895, 4.392437, 1, 1, 1, 1, 1,
0.6770282, 0.1984494, 1.435208, 0, 0, 1, 1, 1,
0.6805634, 1.279379, -0.3640579, 1, 0, 0, 1, 1,
0.6813174, 0.2694015, 0.6461326, 1, 0, 0, 1, 1,
0.6836579, -0.865075, 3.500029, 1, 0, 0, 1, 1,
0.6843615, -0.8062485, 3.212533, 1, 0, 0, 1, 1,
0.6905206, -0.5356997, 2.116146, 1, 0, 0, 1, 1,
0.6963866, -1.734794, 2.759678, 0, 0, 0, 1, 1,
0.6964262, -0.3496729, 2.033513, 0, 0, 0, 1, 1,
0.7086185, -1.689187, 2.698984, 0, 0, 0, 1, 1,
0.7103629, 2.176106, 0.4308586, 0, 0, 0, 1, 1,
0.7129848, -1.337704, 0.4593348, 0, 0, 0, 1, 1,
0.7161034, 0.7435601, 0.4495846, 0, 0, 0, 1, 1,
0.7165726, 1.099485, -1.226254, 0, 0, 0, 1, 1,
0.7179112, 1.105261, 1.244475, 1, 1, 1, 1, 1,
0.7208606, -1.847406, 4.270112, 1, 1, 1, 1, 1,
0.7247745, 0.4977788, 0.2137253, 1, 1, 1, 1, 1,
0.727398, 0.4428961, 3.227857, 1, 1, 1, 1, 1,
0.7358304, -1.009486, 1.958145, 1, 1, 1, 1, 1,
0.7383239, -1.631934, 2.95235, 1, 1, 1, 1, 1,
0.7412781, -0.1169431, 0.03537413, 1, 1, 1, 1, 1,
0.741814, 0.6126519, 2.341703, 1, 1, 1, 1, 1,
0.7447696, -1.680846, 1.254567, 1, 1, 1, 1, 1,
0.7469042, -0.6874345, 3.109473, 1, 1, 1, 1, 1,
0.7505379, -1.083673, 3.465846, 1, 1, 1, 1, 1,
0.7510195, -1.402034, 0.834384, 1, 1, 1, 1, 1,
0.7550579, 1.074638, -0.1895078, 1, 1, 1, 1, 1,
0.758096, 0.7578431, -0.2870753, 1, 1, 1, 1, 1,
0.7641813, 0.2885156, 0.4965949, 1, 1, 1, 1, 1,
0.7664152, -0.4212865, 2.447113, 0, 0, 1, 1, 1,
0.7667077, 0.6187002, -0.4015712, 1, 0, 0, 1, 1,
0.7735446, 0.9164828, 0.1830544, 1, 0, 0, 1, 1,
0.7740269, 0.8336798, 0.9240395, 1, 0, 0, 1, 1,
0.7771423, -0.6237257, 2.645179, 1, 0, 0, 1, 1,
0.7786339, -0.3649148, 2.320883, 1, 0, 0, 1, 1,
0.77982, 2.221034, 1.062932, 0, 0, 0, 1, 1,
0.7809229, 0.3430287, -0.2806215, 0, 0, 0, 1, 1,
0.782581, 0.2996312, 1.516606, 0, 0, 0, 1, 1,
0.7842622, 2.137331, 1.171069, 0, 0, 0, 1, 1,
0.7858679, 0.9984558, 2.008997, 0, 0, 0, 1, 1,
0.7899058, -0.2169222, 2.043196, 0, 0, 0, 1, 1,
0.791433, 1.026839, -0.1940385, 0, 0, 0, 1, 1,
0.7981151, -0.8118923, 1.119249, 1, 1, 1, 1, 1,
0.8040541, -0.8572466, 3.552684, 1, 1, 1, 1, 1,
0.8042499, -0.1673097, 1.952791, 1, 1, 1, 1, 1,
0.8045604, 0.4082262, 2.090139, 1, 1, 1, 1, 1,
0.8076237, 0.1909694, 1.442451, 1, 1, 1, 1, 1,
0.8103007, 0.1942402, 1.232276, 1, 1, 1, 1, 1,
0.8121375, -0.438144, 1.844578, 1, 1, 1, 1, 1,
0.813327, -0.9265481, 3.982206, 1, 1, 1, 1, 1,
0.814821, 0.4567364, 1.181767, 1, 1, 1, 1, 1,
0.8154162, -0.1825402, 3.785938, 1, 1, 1, 1, 1,
0.8162934, -0.8646931, 1.945128, 1, 1, 1, 1, 1,
0.8165194, -0.4333144, 0.1889412, 1, 1, 1, 1, 1,
0.822462, -1.384163, 2.62326, 1, 1, 1, 1, 1,
0.8258926, -0.2293116, 1.375808, 1, 1, 1, 1, 1,
0.8266309, -0.3487341, 2.632769, 1, 1, 1, 1, 1,
0.8299146, -0.9540836, 2.319246, 0, 0, 1, 1, 1,
0.8311415, -0.688681, 2.641711, 1, 0, 0, 1, 1,
0.8363196, 1.568639, 2.408293, 1, 0, 0, 1, 1,
0.8398533, 2.003222, -0.1732227, 1, 0, 0, 1, 1,
0.8541576, -0.8137084, 2.525013, 1, 0, 0, 1, 1,
0.8627577, 0.5070032, 2.735726, 1, 0, 0, 1, 1,
0.8659387, 0.4713476, 1.368551, 0, 0, 0, 1, 1,
0.8724278, 0.3842252, 1.206373, 0, 0, 0, 1, 1,
0.8757594, -0.4158091, 2.043491, 0, 0, 0, 1, 1,
0.8857724, 0.3628988, 1.215406, 0, 0, 0, 1, 1,
0.8882195, 1.177275, 0.02846164, 0, 0, 0, 1, 1,
0.889724, -1.331143, 3.374535, 0, 0, 0, 1, 1,
0.893445, 0.4901322, -1.166115, 0, 0, 0, 1, 1,
0.8942815, -0.02980523, 1.334834, 1, 1, 1, 1, 1,
0.8956977, 1.485186, 0.6872216, 1, 1, 1, 1, 1,
0.8969898, 0.3983883, 0.2473084, 1, 1, 1, 1, 1,
0.9028698, 2.237435, -0.4094441, 1, 1, 1, 1, 1,
0.9103312, 0.2752669, 1.528788, 1, 1, 1, 1, 1,
0.9109437, 1.045164, 1.455696, 1, 1, 1, 1, 1,
0.9194269, -0.703687, 3.052049, 1, 1, 1, 1, 1,
0.9282444, 1.797549, 0.8691352, 1, 1, 1, 1, 1,
0.9336821, -1.622409, 3.229279, 1, 1, 1, 1, 1,
0.9336967, 1.74178, -0.5399789, 1, 1, 1, 1, 1,
0.9345097, 1.055841, 1.513718, 1, 1, 1, 1, 1,
0.9486327, -0.3705653, 2.341358, 1, 1, 1, 1, 1,
0.9493372, 0.08547775, 0.917657, 1, 1, 1, 1, 1,
0.9521356, 0.864055, 0.9573129, 1, 1, 1, 1, 1,
0.9527459, 1.652039, 2.136889, 1, 1, 1, 1, 1,
0.9562255, -0.7722132, 0.2541802, 0, 0, 1, 1, 1,
0.958261, -0.725685, 3.726017, 1, 0, 0, 1, 1,
0.961358, -1.525259, 3.257233, 1, 0, 0, 1, 1,
0.9675904, -1.741404, 3.436461, 1, 0, 0, 1, 1,
0.9771308, 1.097714, 0.7252372, 1, 0, 0, 1, 1,
0.9796864, 2.723323, 0.9361513, 1, 0, 0, 1, 1,
0.979929, -0.6974689, 1.476178, 0, 0, 0, 1, 1,
0.9811358, 0.450837, -0.3753853, 0, 0, 0, 1, 1,
0.9820193, -0.2411382, 1.402829, 0, 0, 0, 1, 1,
0.9883296, -0.1606993, 1.274338, 0, 0, 0, 1, 1,
0.9898495, 0.009357627, 0.6308901, 0, 0, 0, 1, 1,
0.9915289, -0.9017045, 1.571874, 0, 0, 0, 1, 1,
0.9923179, -0.6631082, 1.646007, 0, 0, 0, 1, 1,
0.9930496, 0.6284564, 3.564937, 1, 1, 1, 1, 1,
1.007566, -0.659876, 1.016745, 1, 1, 1, 1, 1,
1.011872, 0.7654231, 0.4549115, 1, 1, 1, 1, 1,
1.01284, 1.167149, 0.2889698, 1, 1, 1, 1, 1,
1.013817, 1.206178, 1.164634, 1, 1, 1, 1, 1,
1.019493, 1.274559, 1.219537, 1, 1, 1, 1, 1,
1.021537, -1.687701, 1.54653, 1, 1, 1, 1, 1,
1.022133, 0.05861274, 1.399244, 1, 1, 1, 1, 1,
1.032259, -0.5906773, 1.98981, 1, 1, 1, 1, 1,
1.03622, -1.51845, 2.090664, 1, 1, 1, 1, 1,
1.037267, 0.6909998, 0.8978115, 1, 1, 1, 1, 1,
1.042732, 1.659082, -0.5706241, 1, 1, 1, 1, 1,
1.043992, 0.5675096, 2.198926, 1, 1, 1, 1, 1,
1.049532, -1.173104, 2.34383, 1, 1, 1, 1, 1,
1.050395, 0.07101564, 1.915439, 1, 1, 1, 1, 1,
1.056993, 0.4966677, 0.7082972, 0, 0, 1, 1, 1,
1.059299, 1.03402, -0.4576593, 1, 0, 0, 1, 1,
1.065678, -0.5619968, 0.2056509, 1, 0, 0, 1, 1,
1.068019, -0.3739165, 1.356011, 1, 0, 0, 1, 1,
1.072603, 2.212222, 0.2107522, 1, 0, 0, 1, 1,
1.088733, -0.109485, 0.7317072, 1, 0, 0, 1, 1,
1.089489, 0.7500516, -0.116755, 0, 0, 0, 1, 1,
1.089954, 0.06325005, 1.601249, 0, 0, 0, 1, 1,
1.09366, 0.6186274, 0.706712, 0, 0, 0, 1, 1,
1.097523, 0.4178925, 2.760182, 0, 0, 0, 1, 1,
1.102032, -0.1527281, 3.043862, 0, 0, 0, 1, 1,
1.103385, -0.375953, 1.009363, 0, 0, 0, 1, 1,
1.116855, 0.003213615, 0.3184888, 0, 0, 0, 1, 1,
1.138715, -0.5396589, 1.095834, 1, 1, 1, 1, 1,
1.139718, -1.199792, 1.084251, 1, 1, 1, 1, 1,
1.141666, -1.745534, 3.862679, 1, 1, 1, 1, 1,
1.142851, 0.1765838, 2.077042, 1, 1, 1, 1, 1,
1.144027, -0.7988411, 5.026378, 1, 1, 1, 1, 1,
1.150732, -0.4733383, 2.322138, 1, 1, 1, 1, 1,
1.152291, -0.6895721, 1.276678, 1, 1, 1, 1, 1,
1.152722, 0.05464469, 1.529077, 1, 1, 1, 1, 1,
1.155283, -0.3893987, 3.600865, 1, 1, 1, 1, 1,
1.15785, -1.04494, 2.623147, 1, 1, 1, 1, 1,
1.159579, 0.4124715, 0.9276155, 1, 1, 1, 1, 1,
1.162394, -0.917942, 2.51541, 1, 1, 1, 1, 1,
1.166052, 0.05984102, 1.947267, 1, 1, 1, 1, 1,
1.166325, 1.45263, -0.1611972, 1, 1, 1, 1, 1,
1.178312, -2.059794, 3.122572, 1, 1, 1, 1, 1,
1.20793, 1.193364, 0.391439, 0, 0, 1, 1, 1,
1.222494, 0.4937822, 2.345571, 1, 0, 0, 1, 1,
1.235201, 1.666101, -0.2081552, 1, 0, 0, 1, 1,
1.242377, 0.2372123, 1.719583, 1, 0, 0, 1, 1,
1.244378, -1.113493, 1.328864, 1, 0, 0, 1, 1,
1.244506, 0.4685012, 1.501983, 1, 0, 0, 1, 1,
1.24613, 0.3631786, 1.308408, 0, 0, 0, 1, 1,
1.246597, 2.553636, -1.112032, 0, 0, 0, 1, 1,
1.259104, -0.3684247, 1.520083, 0, 0, 0, 1, 1,
1.260371, 0.07187651, 3.574578, 0, 0, 0, 1, 1,
1.263244, 1.350938, -0.4281936, 0, 0, 0, 1, 1,
1.264898, 0.5619273, -0.5317245, 0, 0, 0, 1, 1,
1.266339, -0.5520466, 1.536176, 0, 0, 0, 1, 1,
1.273441, -0.9650241, 2.554438, 1, 1, 1, 1, 1,
1.280203, 0.2929723, 1.778387, 1, 1, 1, 1, 1,
1.281835, 0.06421794, 1.764518, 1, 1, 1, 1, 1,
1.283646, 0.04617532, 1.554552, 1, 1, 1, 1, 1,
1.292779, -2.241029, 4.233186, 1, 1, 1, 1, 1,
1.306342, 0.09429742, 1.881662, 1, 1, 1, 1, 1,
1.310887, 0.9906383, 0.843448, 1, 1, 1, 1, 1,
1.31372, -0.7331833, 2.403917, 1, 1, 1, 1, 1,
1.322624, 0.6678069, 2.653822, 1, 1, 1, 1, 1,
1.327713, -2.17714, 2.90669, 1, 1, 1, 1, 1,
1.346543, 0.6018139, -0.01991862, 1, 1, 1, 1, 1,
1.347729, 0.3684708, -0.8022652, 1, 1, 1, 1, 1,
1.35526, 1.435158, -0.6879825, 1, 1, 1, 1, 1,
1.363418, 0.0731895, 2.964705, 1, 1, 1, 1, 1,
1.365958, 0.9242894, 1.876626, 1, 1, 1, 1, 1,
1.370803, 0.08295437, 2.73741, 0, 0, 1, 1, 1,
1.370908, 0.7512745, -1.187775, 1, 0, 0, 1, 1,
1.384529, 0.2427413, 2.518392, 1, 0, 0, 1, 1,
1.391053, -0.5422984, 1.721278, 1, 0, 0, 1, 1,
1.416907, -1.08374, 2.542109, 1, 0, 0, 1, 1,
1.424257, 0.3862606, 2.126658, 1, 0, 0, 1, 1,
1.426256, -0.1265323, 2.16127, 0, 0, 0, 1, 1,
1.428036, 2.210177, 0.9135696, 0, 0, 0, 1, 1,
1.428661, -0.717054, 1.515004, 0, 0, 0, 1, 1,
1.428664, 1.518931, 1.372959, 0, 0, 0, 1, 1,
1.436896, -0.3922262, 0.4865076, 0, 0, 0, 1, 1,
1.444896, -0.1157733, 1.328195, 0, 0, 0, 1, 1,
1.463583, 0.3490021, 1.25811, 0, 0, 0, 1, 1,
1.46365, -0.8004556, 2.247096, 1, 1, 1, 1, 1,
1.464592, -1.846229, 2.198858, 1, 1, 1, 1, 1,
1.46636, -0.6248771, 2.74141, 1, 1, 1, 1, 1,
1.473861, -2.054653, 1.87485, 1, 1, 1, 1, 1,
1.479767, -0.5767307, 1.624378, 1, 1, 1, 1, 1,
1.485684, 1.221072, 2.667707, 1, 1, 1, 1, 1,
1.536873, -0.3825576, 2.242009, 1, 1, 1, 1, 1,
1.55322, -0.1172825, 1.817976, 1, 1, 1, 1, 1,
1.562935, 0.4660131, 1.400127, 1, 1, 1, 1, 1,
1.564056, -0.7491549, 2.459691, 1, 1, 1, 1, 1,
1.574256, 1.055159, 1.228425, 1, 1, 1, 1, 1,
1.591846, -0.5244077, 0.6915874, 1, 1, 1, 1, 1,
1.628628, 0.944162, 0.702378, 1, 1, 1, 1, 1,
1.648677, -0.9418346, 4.528478, 1, 1, 1, 1, 1,
1.657569, -1.704131, 3.878866, 1, 1, 1, 1, 1,
1.660918, 0.6504486, 0.8878682, 0, 0, 1, 1, 1,
1.668445, 1.555867, 0.4930043, 1, 0, 0, 1, 1,
1.669067, 0.3525137, -0.4590369, 1, 0, 0, 1, 1,
1.68771, -1.647191, 3.510324, 1, 0, 0, 1, 1,
1.692907, -0.03273497, 1.953555, 1, 0, 0, 1, 1,
1.698233, -0.3229246, 0.1904588, 1, 0, 0, 1, 1,
1.702122, 1.791863, 0.4269361, 0, 0, 0, 1, 1,
1.702749, -0.960202, 2.259534, 0, 0, 0, 1, 1,
1.708456, 0.5715492, 1.960669, 0, 0, 0, 1, 1,
1.718213, 1.480171, 1.147394, 0, 0, 0, 1, 1,
1.729103, -1.884524, 4.248068, 0, 0, 0, 1, 1,
1.754237, -0.5603275, 3.177535, 0, 0, 0, 1, 1,
1.800761, -0.8453705, 1.089475, 0, 0, 0, 1, 1,
1.807836, -2.008311, 1.313334, 1, 1, 1, 1, 1,
1.816446, -0.8268173, 0.6094572, 1, 1, 1, 1, 1,
1.816735, -0.5398287, -0.7959088, 1, 1, 1, 1, 1,
1.827587, -0.2022147, 1.762615, 1, 1, 1, 1, 1,
1.829558, 0.1421805, 0.7142349, 1, 1, 1, 1, 1,
1.830276, 1.354395, 1.167889, 1, 1, 1, 1, 1,
1.857118, 0.5675594, 1.07976, 1, 1, 1, 1, 1,
1.885866, -0.4917804, 0.489242, 1, 1, 1, 1, 1,
1.901685, -1.101321, 0.812215, 1, 1, 1, 1, 1,
1.937276, -0.5788547, -0.5745701, 1, 1, 1, 1, 1,
1.937306, 0.092732, 2.181124, 1, 1, 1, 1, 1,
1.939992, 0.3387061, 0.07454712, 1, 1, 1, 1, 1,
1.951682, 0.9395536, 1.987749, 1, 1, 1, 1, 1,
1.982305, -0.1275994, 2.299029, 1, 1, 1, 1, 1,
1.988105, -0.3184964, 1.158684, 1, 1, 1, 1, 1,
2.047507, -0.7307855, 1.217434, 0, 0, 1, 1, 1,
2.053124, 0.7047791, 1.058799, 1, 0, 0, 1, 1,
2.081995, 1.667732, 0.9852305, 1, 0, 0, 1, 1,
2.08923, 0.5895718, 1.18153, 1, 0, 0, 1, 1,
2.157102, -0.2111412, 2.931301, 1, 0, 0, 1, 1,
2.169581, 0.5642755, 2.615565, 1, 0, 0, 1, 1,
2.185736, -0.1460332, 1.604987, 0, 0, 0, 1, 1,
2.209524, -0.2003429, 1.706766, 0, 0, 0, 1, 1,
2.210736, 1.39605, 1.092796, 0, 0, 0, 1, 1,
2.252455, -1.227426, 0.6881346, 0, 0, 0, 1, 1,
2.256701, -1.544715, 1.190811, 0, 0, 0, 1, 1,
2.277053, -1.00844, 2.884479, 0, 0, 0, 1, 1,
2.384748, 2.172473, 1.997812, 0, 0, 0, 1, 1,
2.449121, 0.05203481, 3.224009, 1, 1, 1, 1, 1,
2.451539, -1.319285, 3.750613, 1, 1, 1, 1, 1,
2.469815, 0.002817072, 0.3682148, 1, 1, 1, 1, 1,
2.604905, -0.7713176, 3.119538, 1, 1, 1, 1, 1,
2.659795, 0.3340965, 3.510213, 1, 1, 1, 1, 1,
2.792736, 0.1213599, 1.478557, 1, 1, 1, 1, 1,
3.127269, 0.9857497, 2.51514, 1, 1, 1, 1, 1
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
var radius = 9.35637;
var distance = 32.86386;
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
mvMatrix.translate( -0.01987171, 0.180782, 0.1519184 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.86386);
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
