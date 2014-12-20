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
-3.411102, 0.7571518, -0.1402025, 1, 0, 0, 1,
-3.102135, -0.4252385, -0.7856653, 1, 0.007843138, 0, 1,
-3.060584, -0.4616848, -1.251739, 1, 0.01176471, 0, 1,
-2.635886, -0.8045996, -1.859441, 1, 0.01960784, 0, 1,
-2.592615, 0.2453805, -2.95455, 1, 0.02352941, 0, 1,
-2.561007, -1.245288, -3.207037, 1, 0.03137255, 0, 1,
-2.560075, -0.221513, -3.317817, 1, 0.03529412, 0, 1,
-2.481069, -0.6618306, -1.987089, 1, 0.04313726, 0, 1,
-2.473206, 0.5605153, -1.83224, 1, 0.04705882, 0, 1,
-2.414111, -1.095814, -2.3221, 1, 0.05490196, 0, 1,
-2.40686, 0.03914524, -0.5475749, 1, 0.05882353, 0, 1,
-2.287874, -0.2160349, 0.005221803, 1, 0.06666667, 0, 1,
-2.224307, 2.149086, -0.3081617, 1, 0.07058824, 0, 1,
-2.182018, 1.488988, 0.7810882, 1, 0.07843138, 0, 1,
-2.128214, -0.915177, -1.691227, 1, 0.08235294, 0, 1,
-2.126514, -0.2883641, -0.6611658, 1, 0.09019608, 0, 1,
-2.106466, -1.535549, -2.934383, 1, 0.09411765, 0, 1,
-2.078695, -0.8807938, -1.168281, 1, 0.1019608, 0, 1,
-2.034779, -0.3459119, -1.021302, 1, 0.1098039, 0, 1,
-2.034014, 0.3655277, -1.895133, 1, 0.1137255, 0, 1,
-2.031137, 0.8829567, -1.52553, 1, 0.1215686, 0, 1,
-1.987313, -0.6537931, -1.726109, 1, 0.1254902, 0, 1,
-1.971968, -0.7245559, -4.018915, 1, 0.1333333, 0, 1,
-1.940537, -1.924801, -1.836382, 1, 0.1372549, 0, 1,
-1.935871, -0.05744246, -0.3928779, 1, 0.145098, 0, 1,
-1.874243, -0.7702449, -2.618144, 1, 0.1490196, 0, 1,
-1.870423, 1.703686, -0.6452069, 1, 0.1568628, 0, 1,
-1.858844, -0.9174547, -3.177541, 1, 0.1607843, 0, 1,
-1.844804, -0.5428289, -1.148189, 1, 0.1686275, 0, 1,
-1.841076, 1.230449, -0.9540755, 1, 0.172549, 0, 1,
-1.809536, 0.1956625, -1.185168, 1, 0.1803922, 0, 1,
-1.807507, -0.2739861, -1.164801, 1, 0.1843137, 0, 1,
-1.806097, 0.2489621, -1.307972, 1, 0.1921569, 0, 1,
-1.803057, 0.9470502, 1.031954, 1, 0.1960784, 0, 1,
-1.791421, 1.764081, 0.6500102, 1, 0.2039216, 0, 1,
-1.790831, 0.1510373, -1.758397, 1, 0.2117647, 0, 1,
-1.786735, 0.08193912, -1.786596, 1, 0.2156863, 0, 1,
-1.768864, -0.3917377, -0.9471498, 1, 0.2235294, 0, 1,
-1.76714, 0.5960656, -1.323083, 1, 0.227451, 0, 1,
-1.765242, -0.6348042, -0.6826711, 1, 0.2352941, 0, 1,
-1.753116, 0.01854064, -1.834419, 1, 0.2392157, 0, 1,
-1.75303, 0.3053971, -0.7736366, 1, 0.2470588, 0, 1,
-1.744938, -0.355339, 1.062526, 1, 0.2509804, 0, 1,
-1.722687, -0.5031162, -1.581774, 1, 0.2588235, 0, 1,
-1.68556, -0.4732198, -2.756853, 1, 0.2627451, 0, 1,
-1.680536, -0.2505722, -3.868208, 1, 0.2705882, 0, 1,
-1.668247, 0.2573274, -2.958861, 1, 0.2745098, 0, 1,
-1.665256, 1.209763, -1.297084, 1, 0.282353, 0, 1,
-1.65784, 0.7057711, -2.605563, 1, 0.2862745, 0, 1,
-1.656347, 0.9963264, 0.07290872, 1, 0.2941177, 0, 1,
-1.649542, -1.040456, -2.255968, 1, 0.3019608, 0, 1,
-1.642105, -0.1019581, -2.902397, 1, 0.3058824, 0, 1,
-1.640126, -1.782445, -3.525262, 1, 0.3137255, 0, 1,
-1.632914, 0.2447615, -0.9007639, 1, 0.3176471, 0, 1,
-1.628096, 0.6404563, -1.879931, 1, 0.3254902, 0, 1,
-1.62533, -0.7760762, -4.575668, 1, 0.3294118, 0, 1,
-1.622892, -1.168982, -3.828785, 1, 0.3372549, 0, 1,
-1.595636, -0.1306033, -1.971876, 1, 0.3411765, 0, 1,
-1.584957, -0.8037662, -2.535208, 1, 0.3490196, 0, 1,
-1.582273, -1.377347, -1.991823, 1, 0.3529412, 0, 1,
-1.579646, 0.1119998, -2.686597, 1, 0.3607843, 0, 1,
-1.568637, -0.06289478, -1.99694, 1, 0.3647059, 0, 1,
-1.562308, -1.28129, -0.8079793, 1, 0.372549, 0, 1,
-1.559811, -0.01797946, -2.058703, 1, 0.3764706, 0, 1,
-1.555381, -1.818987, -3.64432, 1, 0.3843137, 0, 1,
-1.55307, -0.1795601, -0.4977617, 1, 0.3882353, 0, 1,
-1.548774, 0.6450701, -0.9461572, 1, 0.3960784, 0, 1,
-1.536792, 1.01779, -2.210528, 1, 0.4039216, 0, 1,
-1.534123, -0.61914, -0.910487, 1, 0.4078431, 0, 1,
-1.524782, 0.09166183, -2.66676, 1, 0.4156863, 0, 1,
-1.509417, -0.7226322, -0.08475731, 1, 0.4196078, 0, 1,
-1.504643, 0.1184336, -2.271895, 1, 0.427451, 0, 1,
-1.497531, 1.245275, -0.2709057, 1, 0.4313726, 0, 1,
-1.483379, 0.7668352, -0.03329098, 1, 0.4392157, 0, 1,
-1.466186, -1.275163, -4.231768, 1, 0.4431373, 0, 1,
-1.465037, 1.646829, -2.512635, 1, 0.4509804, 0, 1,
-1.459536, -0.7250494, -4.042511, 1, 0.454902, 0, 1,
-1.445328, 0.347121, -0.3639576, 1, 0.4627451, 0, 1,
-1.444352, -0.4505207, -1.502739, 1, 0.4666667, 0, 1,
-1.436454, -0.1308465, -2.274263, 1, 0.4745098, 0, 1,
-1.433702, 0.1868056, -1.85051, 1, 0.4784314, 0, 1,
-1.429716, -0.2091053, -0.2719289, 1, 0.4862745, 0, 1,
-1.424073, -0.03442411, -0.1145879, 1, 0.4901961, 0, 1,
-1.4199, -0.3695274, -1.015777, 1, 0.4980392, 0, 1,
-1.413583, 1.019836, -2.028275, 1, 0.5058824, 0, 1,
-1.411137, 0.2742796, -1.021753, 1, 0.509804, 0, 1,
-1.408357, -1.215626, -3.420399, 1, 0.5176471, 0, 1,
-1.404273, -0.8800517, -2.332388, 1, 0.5215687, 0, 1,
-1.401634, -0.366328, -1.723684, 1, 0.5294118, 0, 1,
-1.397883, -1.624258, -1.414497, 1, 0.5333334, 0, 1,
-1.39212, 0.2133522, -0.381619, 1, 0.5411765, 0, 1,
-1.388535, -0.2538444, -2.199923, 1, 0.5450981, 0, 1,
-1.382529, 0.6860269, -1.313688, 1, 0.5529412, 0, 1,
-1.372154, -0.8558705, -2.396172, 1, 0.5568628, 0, 1,
-1.370851, 0.09529384, -0.6632165, 1, 0.5647059, 0, 1,
-1.365542, -0.5280959, -1.983161, 1, 0.5686275, 0, 1,
-1.346402, 1.281201, -2.139066, 1, 0.5764706, 0, 1,
-1.340294, -0.2345541, -3.286013, 1, 0.5803922, 0, 1,
-1.338129, -0.755695, -2.013983, 1, 0.5882353, 0, 1,
-1.327594, 1.098982, -0.1786304, 1, 0.5921569, 0, 1,
-1.322343, 0.1965506, -3.415634, 1, 0.6, 0, 1,
-1.318438, -0.4731659, -3.084615, 1, 0.6078432, 0, 1,
-1.308672, 0.7989841, -1.81435, 1, 0.6117647, 0, 1,
-1.306176, -0.2953577, -2.021462, 1, 0.6196079, 0, 1,
-1.303226, 0.2451546, -2.488026, 1, 0.6235294, 0, 1,
-1.300492, -2.192661, -3.269344, 1, 0.6313726, 0, 1,
-1.292604, 0.1716323, -0.4496564, 1, 0.6352941, 0, 1,
-1.287192, -1.673144, -3.013485, 1, 0.6431373, 0, 1,
-1.284489, -1.034396, -1.390479, 1, 0.6470588, 0, 1,
-1.277761, 0.1209821, -2.145102, 1, 0.654902, 0, 1,
-1.276499, 1.369685, -0.4312101, 1, 0.6588235, 0, 1,
-1.271151, -0.3380903, -1.922017, 1, 0.6666667, 0, 1,
-1.26079, 1.367292, -0.5100787, 1, 0.6705883, 0, 1,
-1.252816, 0.7237067, -0.05354038, 1, 0.6784314, 0, 1,
-1.250454, 1.050348, 0.2783239, 1, 0.682353, 0, 1,
-1.250404, 0.1277977, -1.883514, 1, 0.6901961, 0, 1,
-1.245027, -0.2745898, -3.127984, 1, 0.6941177, 0, 1,
-1.236952, -0.6876968, -0.9052015, 1, 0.7019608, 0, 1,
-1.236466, -0.4979771, -0.8946942, 1, 0.7098039, 0, 1,
-1.230513, 1.916833, -2.218061, 1, 0.7137255, 0, 1,
-1.219911, 0.8266589, -1.240359, 1, 0.7215686, 0, 1,
-1.199492, 0.8338466, -1.59759, 1, 0.7254902, 0, 1,
-1.196443, 1.868839, 1.034372, 1, 0.7333333, 0, 1,
-1.194484, -0.238729, -3.740214, 1, 0.7372549, 0, 1,
-1.189328, 0.7917268, -2.456567, 1, 0.7450981, 0, 1,
-1.185799, -0.3950972, -4.749136, 1, 0.7490196, 0, 1,
-1.183941, 1.499742, -0.5439609, 1, 0.7568628, 0, 1,
-1.18357, -0.2396417, -0.9557271, 1, 0.7607843, 0, 1,
-1.172038, -1.562435, -4.348568, 1, 0.7686275, 0, 1,
-1.168554, 0.8538703, -1.223467, 1, 0.772549, 0, 1,
-1.161673, -0.11894, -0.7762163, 1, 0.7803922, 0, 1,
-1.152537, 0.7205467, -1.676226, 1, 0.7843137, 0, 1,
-1.147773, 0.1902823, -2.164891, 1, 0.7921569, 0, 1,
-1.14321, 0.8019461, -1.613721, 1, 0.7960784, 0, 1,
-1.137951, -0.6423483, -0.2470782, 1, 0.8039216, 0, 1,
-1.134673, 0.004277751, -2.281603, 1, 0.8117647, 0, 1,
-1.132478, -1.857758, -2.752379, 1, 0.8156863, 0, 1,
-1.119538, 0.02078235, -0.1879559, 1, 0.8235294, 0, 1,
-1.118577, -1.480195, -3.719029, 1, 0.827451, 0, 1,
-1.098105, 0.9617229, -2.511096, 1, 0.8352941, 0, 1,
-1.087284, -0.1235946, -2.166565, 1, 0.8392157, 0, 1,
-1.081904, 1.262078, 1.020489, 1, 0.8470588, 0, 1,
-1.08076, -0.03240089, -1.029926, 1, 0.8509804, 0, 1,
-1.076382, 0.115041, -0.249209, 1, 0.8588235, 0, 1,
-1.072837, -0.9359335, -2.416438, 1, 0.8627451, 0, 1,
-1.05788, 1.124977, -1.795971, 1, 0.8705882, 0, 1,
-1.057605, -1.215838, -2.87858, 1, 0.8745098, 0, 1,
-1.056401, 0.09987692, -1.753807, 1, 0.8823529, 0, 1,
-1.054524, -0.2340823, -2.901749, 1, 0.8862745, 0, 1,
-1.049375, -2.217512, -2.764805, 1, 0.8941177, 0, 1,
-1.048938, -0.772522, -3.252532, 1, 0.8980392, 0, 1,
-1.048361, 0.6135375, 0.8018907, 1, 0.9058824, 0, 1,
-1.047456, -1.200142, -2.150204, 1, 0.9137255, 0, 1,
-1.042518, -0.4443397, -2.189897, 1, 0.9176471, 0, 1,
-1.038329, 1.414087, -0.9148487, 1, 0.9254902, 0, 1,
-1.03828, 1.48061, -1.83803, 1, 0.9294118, 0, 1,
-1.037439, 0.003296125, -0.3809945, 1, 0.9372549, 0, 1,
-1.035743, -1.252284, -2.092656, 1, 0.9411765, 0, 1,
-1.028548, -0.6659281, -1.689231, 1, 0.9490196, 0, 1,
-1.024258, -0.02877954, 0.6841289, 1, 0.9529412, 0, 1,
-1.016215, 0.03064838, -2.553961, 1, 0.9607843, 0, 1,
-1.01318, 2.12893, 0.03905879, 1, 0.9647059, 0, 1,
-1.005806, 0.2044129, -0.2414721, 1, 0.972549, 0, 1,
-0.9995739, -0.03092284, -1.431201, 1, 0.9764706, 0, 1,
-0.995123, -0.5566995, -3.301116, 1, 0.9843137, 0, 1,
-0.983425, 1.753921, 0.6543058, 1, 0.9882353, 0, 1,
-0.9751968, -1.023958, -2.937932, 1, 0.9960784, 0, 1,
-0.9742933, 0.04551606, 0.2147696, 0.9960784, 1, 0, 1,
-0.9691093, 0.9296754, -0.4647984, 0.9921569, 1, 0, 1,
-0.9684868, 0.3391895, -0.7079704, 0.9843137, 1, 0, 1,
-0.9628857, 0.3065462, -0.7177092, 0.9803922, 1, 0, 1,
-0.9579796, -1.626481, -1.499537, 0.972549, 1, 0, 1,
-0.9527481, 1.04507, -1.541798, 0.9686275, 1, 0, 1,
-0.9519994, 0.01650129, -3.587413, 0.9607843, 1, 0, 1,
-0.9491236, 0.2735869, -0.5694389, 0.9568627, 1, 0, 1,
-0.9488177, 1.505014, -0.8040116, 0.9490196, 1, 0, 1,
-0.9440431, 0.1340444, -1.317541, 0.945098, 1, 0, 1,
-0.9401128, -0.4311796, -2.619375, 0.9372549, 1, 0, 1,
-0.9383121, 0.6700743, 0.570241, 0.9333333, 1, 0, 1,
-0.9372961, 1.590296, -2.932831, 0.9254902, 1, 0, 1,
-0.9363298, 0.524192, -1.969117, 0.9215686, 1, 0, 1,
-0.924424, -0.6502426, -2.9702, 0.9137255, 1, 0, 1,
-0.9231719, 0.9781217, -0.4138499, 0.9098039, 1, 0, 1,
-0.9169952, -2.608724, -2.537084, 0.9019608, 1, 0, 1,
-0.91689, 1.171961, -0.9412152, 0.8941177, 1, 0, 1,
-0.9167606, -0.6877047, -2.115543, 0.8901961, 1, 0, 1,
-0.9159716, 2.31529, 0.8545513, 0.8823529, 1, 0, 1,
-0.9100098, 1.097368, -0.2307551, 0.8784314, 1, 0, 1,
-0.8966677, 0.3397114, 0.5001984, 0.8705882, 1, 0, 1,
-0.8879403, 2.166883, -0.6445405, 0.8666667, 1, 0, 1,
-0.8830853, -0.192966, -0.366194, 0.8588235, 1, 0, 1,
-0.8786344, -0.2515841, -1.981745, 0.854902, 1, 0, 1,
-0.8765476, -0.5521778, -1.844714, 0.8470588, 1, 0, 1,
-0.8738028, 0.0007845133, -1.35729, 0.8431373, 1, 0, 1,
-0.8637319, -1.640542, -4.640271, 0.8352941, 1, 0, 1,
-0.8608272, 0.3962989, 0.1625927, 0.8313726, 1, 0, 1,
-0.8557571, -0.3320906, -0.9178085, 0.8235294, 1, 0, 1,
-0.8396876, -0.09299953, -1.352577, 0.8196079, 1, 0, 1,
-0.8325878, -0.3040305, -2.330895, 0.8117647, 1, 0, 1,
-0.8298979, -0.004400623, -1.855291, 0.8078431, 1, 0, 1,
-0.8269768, -0.3536123, -2.465205, 0.8, 1, 0, 1,
-0.8262197, -1.380365, -2.640322, 0.7921569, 1, 0, 1,
-0.8210589, -0.5922353, -2.183889, 0.7882353, 1, 0, 1,
-0.8210469, 1.559255, 0.03799024, 0.7803922, 1, 0, 1,
-0.8198414, 0.3003097, -0.1876753, 0.7764706, 1, 0, 1,
-0.8144779, 0.9492175, -0.1788269, 0.7686275, 1, 0, 1,
-0.8019232, 0.3913282, -0.8222244, 0.7647059, 1, 0, 1,
-0.8005018, -0.7658882, -1.752184, 0.7568628, 1, 0, 1,
-0.7997337, 0.8151069, 0.003399484, 0.7529412, 1, 0, 1,
-0.7989504, -0.4585722, -1.360157, 0.7450981, 1, 0, 1,
-0.7969383, 0.9282209, 0.5535495, 0.7411765, 1, 0, 1,
-0.7929573, -1.654081, -4.063073, 0.7333333, 1, 0, 1,
-0.7881628, 0.9054777, -0.129577, 0.7294118, 1, 0, 1,
-0.7868714, -0.3777754, -2.447214, 0.7215686, 1, 0, 1,
-0.7859294, 0.5419881, -1.270041, 0.7176471, 1, 0, 1,
-0.7834865, -1.731771, -3.087102, 0.7098039, 1, 0, 1,
-0.7786036, 0.3304445, -2.043533, 0.7058824, 1, 0, 1,
-0.7732784, -0.04277034, -1.074377, 0.6980392, 1, 0, 1,
-0.7706657, 1.001179, -2.289145, 0.6901961, 1, 0, 1,
-0.7674878, 0.3608488, -1.385133, 0.6862745, 1, 0, 1,
-0.762973, -1.242276, -1.984371, 0.6784314, 1, 0, 1,
-0.7580445, -1.22561, -3.914208, 0.6745098, 1, 0, 1,
-0.7552426, -0.02462347, 0.4448013, 0.6666667, 1, 0, 1,
-0.7521499, -0.3551955, -2.587296, 0.6627451, 1, 0, 1,
-0.7312655, 0.2552513, -0.277023, 0.654902, 1, 0, 1,
-0.728911, 0.5366288, -0.6123575, 0.6509804, 1, 0, 1,
-0.7234234, -2.358548, -4.048126, 0.6431373, 1, 0, 1,
-0.714733, 1.20946, -0.2614766, 0.6392157, 1, 0, 1,
-0.7140327, 0.4075841, -3.042701, 0.6313726, 1, 0, 1,
-0.708443, -0.5417343, -2.993192, 0.627451, 1, 0, 1,
-0.7049787, 1.361383, 0.08121016, 0.6196079, 1, 0, 1,
-0.7032656, -2.152247, -1.504324, 0.6156863, 1, 0, 1,
-0.7030513, 0.3887666, -4.236815, 0.6078432, 1, 0, 1,
-0.6991586, 0.2762711, 0.4961641, 0.6039216, 1, 0, 1,
-0.6972682, 1.259797, -0.4496581, 0.5960785, 1, 0, 1,
-0.6746629, 1.093141, -2.581789, 0.5882353, 1, 0, 1,
-0.6716487, -2.087093, -2.551406, 0.5843138, 1, 0, 1,
-0.6676592, -1.87159, -3.398161, 0.5764706, 1, 0, 1,
-0.6655609, 0.5788583, -0.8532223, 0.572549, 1, 0, 1,
-0.6645496, -0.02733285, -2.11443, 0.5647059, 1, 0, 1,
-0.6631555, -1.028394, -2.656509, 0.5607843, 1, 0, 1,
-0.6621352, -0.7352923, -3.029958, 0.5529412, 1, 0, 1,
-0.6612434, -1.296081, -3.029475, 0.5490196, 1, 0, 1,
-0.6569982, -0.1586542, -2.505394, 0.5411765, 1, 0, 1,
-0.6493743, 0.05630475, 1.04469, 0.5372549, 1, 0, 1,
-0.647795, -1.092853, -3.798439, 0.5294118, 1, 0, 1,
-0.6470122, -2.385596, -3.095163, 0.5254902, 1, 0, 1,
-0.6455219, -0.329422, -2.589191, 0.5176471, 1, 0, 1,
-0.6450944, -0.1803855, -1.456563, 0.5137255, 1, 0, 1,
-0.6426113, -0.680329, -3.313148, 0.5058824, 1, 0, 1,
-0.6414858, -0.1979716, -1.3606, 0.5019608, 1, 0, 1,
-0.6404328, 0.4010638, 0.877923, 0.4941176, 1, 0, 1,
-0.6386216, 0.85238, -1.558986, 0.4862745, 1, 0, 1,
-0.633859, -0.2444488, -2.12983, 0.4823529, 1, 0, 1,
-0.6310664, 1.335736, -0.8452964, 0.4745098, 1, 0, 1,
-0.6297273, -0.8369026, -3.715431, 0.4705882, 1, 0, 1,
-0.6286554, -0.1722123, 0.02992751, 0.4627451, 1, 0, 1,
-0.6266395, -2.707469, -3.226779, 0.4588235, 1, 0, 1,
-0.6262235, -1.520154, -1.647152, 0.4509804, 1, 0, 1,
-0.6235552, -1.015481, -4.775032, 0.4470588, 1, 0, 1,
-0.6144505, 1.053206, -1.031261, 0.4392157, 1, 0, 1,
-0.611403, -1.171784, -3.028434, 0.4352941, 1, 0, 1,
-0.6108195, 1.522099, -0.2818038, 0.427451, 1, 0, 1,
-0.5990286, -0.6053134, -3.538083, 0.4235294, 1, 0, 1,
-0.5972255, -1.765732, -5.37289, 0.4156863, 1, 0, 1,
-0.5967759, 1.394603, 0.3906777, 0.4117647, 1, 0, 1,
-0.5964124, -0.7850477, -3.887183, 0.4039216, 1, 0, 1,
-0.5943696, 0.6042179, 0.971413, 0.3960784, 1, 0, 1,
-0.5942915, 0.1217337, -0.3204219, 0.3921569, 1, 0, 1,
-0.5931931, 0.2496086, -1.491197, 0.3843137, 1, 0, 1,
-0.5918631, -0.9349351, -2.813334, 0.3803922, 1, 0, 1,
-0.582553, 0.1592631, -1.906772, 0.372549, 1, 0, 1,
-0.5794444, 0.06794982, 0.7842965, 0.3686275, 1, 0, 1,
-0.5786557, -1.374992, -2.722079, 0.3607843, 1, 0, 1,
-0.5707304, -1.594721, -2.962407, 0.3568628, 1, 0, 1,
-0.5613211, 0.800647, -0.518855, 0.3490196, 1, 0, 1,
-0.5584568, -1.340141, -0.530543, 0.345098, 1, 0, 1,
-0.555681, -0.05568957, -2.437008, 0.3372549, 1, 0, 1,
-0.5521624, -1.265692, -3.413669, 0.3333333, 1, 0, 1,
-0.5518743, 1.190229, -0.1044164, 0.3254902, 1, 0, 1,
-0.5493792, -0.4850251, -3.036177, 0.3215686, 1, 0, 1,
-0.5404438, -0.2748817, 0.1138232, 0.3137255, 1, 0, 1,
-0.5374094, -1.277239, -3.674489, 0.3098039, 1, 0, 1,
-0.5360599, -0.3258725, -0.4390663, 0.3019608, 1, 0, 1,
-0.535822, 1.516127, 0.566411, 0.2941177, 1, 0, 1,
-0.5311369, 0.1602516, -3.344602, 0.2901961, 1, 0, 1,
-0.5299979, 0.7726664, -1.04436, 0.282353, 1, 0, 1,
-0.5293714, -0.09940398, -1.869897, 0.2784314, 1, 0, 1,
-0.5286605, -0.4230177, -2.709818, 0.2705882, 1, 0, 1,
-0.5283442, 1.835599, -0.7497302, 0.2666667, 1, 0, 1,
-0.527236, 0.6899789, -0.07876661, 0.2588235, 1, 0, 1,
-0.5244208, -0.9972378, -3.106201, 0.254902, 1, 0, 1,
-0.5231032, 0.4401024, -1.302046, 0.2470588, 1, 0, 1,
-0.5217933, 0.4704337, -2.308215, 0.2431373, 1, 0, 1,
-0.5182503, 0.003474651, -1.364258, 0.2352941, 1, 0, 1,
-0.5173385, -1.64251, -2.916658, 0.2313726, 1, 0, 1,
-0.5159987, -0.6216236, -3.481019, 0.2235294, 1, 0, 1,
-0.5149567, 0.6049054, 0.8783312, 0.2196078, 1, 0, 1,
-0.5121278, 1.280798, -1.019341, 0.2117647, 1, 0, 1,
-0.5106266, -1.249846, -2.336577, 0.2078431, 1, 0, 1,
-0.5100693, -0.136083, -0.4235663, 0.2, 1, 0, 1,
-0.5096779, -0.3924581, -2.184831, 0.1921569, 1, 0, 1,
-0.5067422, -1.698334, -2.875053, 0.1882353, 1, 0, 1,
-0.5063709, -0.3302268, -0.8358563, 0.1803922, 1, 0, 1,
-0.5033288, 1.527042, 0.06664634, 0.1764706, 1, 0, 1,
-0.4968651, 0.6702791, 1.117287, 0.1686275, 1, 0, 1,
-0.4899721, -0.163872, -0.1912289, 0.1647059, 1, 0, 1,
-0.4820778, -0.09138428, -0.4403384, 0.1568628, 1, 0, 1,
-0.4808717, -2.070668, -2.388126, 0.1529412, 1, 0, 1,
-0.4778195, -0.2813474, -3.345279, 0.145098, 1, 0, 1,
-0.4758242, -0.0403069, -2.334225, 0.1411765, 1, 0, 1,
-0.4737341, 0.7048206, -0.5136262, 0.1333333, 1, 0, 1,
-0.4735729, -0.6572984, -2.062353, 0.1294118, 1, 0, 1,
-0.4724427, 0.09354084, -0.4915255, 0.1215686, 1, 0, 1,
-0.4667406, 0.4021206, -1.437188, 0.1176471, 1, 0, 1,
-0.4582986, 0.8539584, -1.460995, 0.1098039, 1, 0, 1,
-0.4530563, -0.655139, -1.914867, 0.1058824, 1, 0, 1,
-0.4509856, -0.7820216, -3.107539, 0.09803922, 1, 0, 1,
-0.4463834, -0.3591914, -3.120598, 0.09019608, 1, 0, 1,
-0.4445775, -1.073304, -1.471222, 0.08627451, 1, 0, 1,
-0.4424126, 1.00667, 1.260885, 0.07843138, 1, 0, 1,
-0.4423606, 2.034306, 0.5219669, 0.07450981, 1, 0, 1,
-0.4381992, 1.672558, 0.1542759, 0.06666667, 1, 0, 1,
-0.4309891, 0.2028318, -2.095117, 0.0627451, 1, 0, 1,
-0.4224342, 0.04424673, -1.250399, 0.05490196, 1, 0, 1,
-0.4216337, -0.0108137, -1.115137, 0.05098039, 1, 0, 1,
-0.4166382, 0.4525263, -0.7623816, 0.04313726, 1, 0, 1,
-0.4149855, -1.358483, -1.757385, 0.03921569, 1, 0, 1,
-0.4131737, -0.5774406, -1.049588, 0.03137255, 1, 0, 1,
-0.4072636, -0.3893446, -5.120511, 0.02745098, 1, 0, 1,
-0.406595, 0.2547103, -1.223441, 0.01960784, 1, 0, 1,
-0.4045549, 1.682183, 0.4060961, 0.01568628, 1, 0, 1,
-0.403834, 1.198542, 1.207066, 0.007843138, 1, 0, 1,
-0.3983039, 0.3100848, 0.7897289, 0.003921569, 1, 0, 1,
-0.3942208, -0.02222487, -0.6800436, 0, 1, 0.003921569, 1,
-0.3936508, -2.642634, -3.647463, 0, 1, 0.01176471, 1,
-0.3865849, 0.8004666, -0.3153782, 0, 1, 0.01568628, 1,
-0.3836286, 0.522911, -1.369776, 0, 1, 0.02352941, 1,
-0.3824855, 0.1803219, -2.974417, 0, 1, 0.02745098, 1,
-0.3802217, -1.131849, -3.688042, 0, 1, 0.03529412, 1,
-0.3722764, 0.771346, 0.5506436, 0, 1, 0.03921569, 1,
-0.3712045, -1.458306, -4.688012, 0, 1, 0.04705882, 1,
-0.3676128, 0.02109746, -1.770424, 0, 1, 0.05098039, 1,
-0.3671284, 0.2582474, -1.754611, 0, 1, 0.05882353, 1,
-0.3591259, 0.8192618, -1.030462, 0, 1, 0.0627451, 1,
-0.3571273, -0.3592979, -2.245371, 0, 1, 0.07058824, 1,
-0.3560248, 1.965052, 0.1875199, 0, 1, 0.07450981, 1,
-0.3559333, -0.4490751, -2.712574, 0, 1, 0.08235294, 1,
-0.3550944, 2.257353, 0.9864733, 0, 1, 0.08627451, 1,
-0.3542894, 0.7374821, -0.3183409, 0, 1, 0.09411765, 1,
-0.3516535, -1.803419, -4.787721, 0, 1, 0.1019608, 1,
-0.3509211, -0.5692611, -2.783508, 0, 1, 0.1058824, 1,
-0.3475662, -0.03957944, -1.114947, 0, 1, 0.1137255, 1,
-0.3465776, 0.6686286, -0.1071617, 0, 1, 0.1176471, 1,
-0.3459699, 0.05533757, -1.538681, 0, 1, 0.1254902, 1,
-0.3451103, 1.459223, 0.314209, 0, 1, 0.1294118, 1,
-0.3421493, -1.720983, -2.621992, 0, 1, 0.1372549, 1,
-0.3417171, -0.07698844, -3.027331, 0, 1, 0.1411765, 1,
-0.34083, -0.01748143, -1.866882, 0, 1, 0.1490196, 1,
-0.3393152, -0.3102604, -1.074994, 0, 1, 0.1529412, 1,
-0.3344402, -0.5663085, -3.87554, 0, 1, 0.1607843, 1,
-0.3230627, -0.1331225, -2.047323, 0, 1, 0.1647059, 1,
-0.3228814, 0.8360646, -0.7221611, 0, 1, 0.172549, 1,
-0.3192637, 0.6096205, -1.449805, 0, 1, 0.1764706, 1,
-0.3169124, 0.29967, -0.7831036, 0, 1, 0.1843137, 1,
-0.3137096, 0.8339026, -0.05442316, 0, 1, 0.1882353, 1,
-0.3101971, -1.545668, -3.479074, 0, 1, 0.1960784, 1,
-0.3091365, -1.183918, -2.202088, 0, 1, 0.2039216, 1,
-0.3073269, 0.9099927, 0.1740086, 0, 1, 0.2078431, 1,
-0.3041733, 0.8323374, -0.4977538, 0, 1, 0.2156863, 1,
-0.3019342, 0.820052, 0.3206636, 0, 1, 0.2196078, 1,
-0.3013929, 0.04163215, -0.6200502, 0, 1, 0.227451, 1,
-0.3012741, -0.216791, -2.583962, 0, 1, 0.2313726, 1,
-0.3003408, -0.1857088, -2.366418, 0, 1, 0.2392157, 1,
-0.2987514, -0.2596926, -1.253018, 0, 1, 0.2431373, 1,
-0.2976414, 1.573963, 0.605474, 0, 1, 0.2509804, 1,
-0.2971928, -0.3821216, -2.053502, 0, 1, 0.254902, 1,
-0.2942731, -0.5112197, 0.1862612, 0, 1, 0.2627451, 1,
-0.2920464, 0.2462876, -0.9749083, 0, 1, 0.2666667, 1,
-0.2900512, 0.04880694, -0.7645373, 0, 1, 0.2745098, 1,
-0.289393, -0.7464761, -0.8870526, 0, 1, 0.2784314, 1,
-0.2893687, 0.1843124, -0.5412731, 0, 1, 0.2862745, 1,
-0.2884074, -1.04763, -3.536949, 0, 1, 0.2901961, 1,
-0.2876564, 0.3460492, -1.068025, 0, 1, 0.2980392, 1,
-0.2865447, -0.4926663, -4.281098, 0, 1, 0.3058824, 1,
-0.2859658, 0.5863891, -0.03962397, 0, 1, 0.3098039, 1,
-0.2840789, -0.9591453, -4.064336, 0, 1, 0.3176471, 1,
-0.2806671, -0.8421445, -3.235852, 0, 1, 0.3215686, 1,
-0.2777678, -0.9177508, -3.132291, 0, 1, 0.3294118, 1,
-0.2774083, 0.9842316, -0.6385372, 0, 1, 0.3333333, 1,
-0.2760903, -1.178855, -4.405061, 0, 1, 0.3411765, 1,
-0.2739803, -1.54673, -4.405305, 0, 1, 0.345098, 1,
-0.2712821, 0.6404601, -0.05839438, 0, 1, 0.3529412, 1,
-0.2705787, 0.3405392, -0.8761038, 0, 1, 0.3568628, 1,
-0.2656603, -1.006081, -2.447915, 0, 1, 0.3647059, 1,
-0.2634363, 0.002729836, -2.450218, 0, 1, 0.3686275, 1,
-0.2626638, -0.9005274, -4.221799, 0, 1, 0.3764706, 1,
-0.2616319, -1.261384, -3.281106, 0, 1, 0.3803922, 1,
-0.2604291, 0.6982582, -0.7939053, 0, 1, 0.3882353, 1,
-0.2541499, -0.7256574, -4.694946, 0, 1, 0.3921569, 1,
-0.253747, 1.62033, -0.6556334, 0, 1, 0.4, 1,
-0.2521552, -0.7824783, -3.942131, 0, 1, 0.4078431, 1,
-0.2520825, 1.14994, -0.9923611, 0, 1, 0.4117647, 1,
-0.2466426, -0.5940213, -3.305367, 0, 1, 0.4196078, 1,
-0.2440079, -0.6271816, -1.303509, 0, 1, 0.4235294, 1,
-0.2375886, 1.105631, -1.614851, 0, 1, 0.4313726, 1,
-0.2364694, -0.4337332, -0.8475485, 0, 1, 0.4352941, 1,
-0.2324473, 0.4718306, -0.1620827, 0, 1, 0.4431373, 1,
-0.230529, -2.271304, -3.219449, 0, 1, 0.4470588, 1,
-0.2288064, -0.562692, -2.2269, 0, 1, 0.454902, 1,
-0.2244689, -0.6195447, -1.967965, 0, 1, 0.4588235, 1,
-0.218593, 0.01069592, -2.165946, 0, 1, 0.4666667, 1,
-0.2166271, 0.3835097, -1.187144, 0, 1, 0.4705882, 1,
-0.2142075, 0.1076348, -0.4611911, 0, 1, 0.4784314, 1,
-0.2108068, -0.6814694, -3.306886, 0, 1, 0.4823529, 1,
-0.2093299, -0.5759798, -2.937179, 0, 1, 0.4901961, 1,
-0.1926596, 0.02321934, -0.2043766, 0, 1, 0.4941176, 1,
-0.190278, 0.05587511, -1.355101, 0, 1, 0.5019608, 1,
-0.1882862, 1.00291, 0.6898358, 0, 1, 0.509804, 1,
-0.1881514, -0.8352411, -4.129406, 0, 1, 0.5137255, 1,
-0.1875739, -1.31822, -2.616079, 0, 1, 0.5215687, 1,
-0.1839803, -1.098515, -2.679951, 0, 1, 0.5254902, 1,
-0.183791, -0.216004, -3.121316, 0, 1, 0.5333334, 1,
-0.1785996, 0.06266173, -0.6940663, 0, 1, 0.5372549, 1,
-0.1747679, 0.1263893, -1.215623, 0, 1, 0.5450981, 1,
-0.1743371, -1.305138, -2.497248, 0, 1, 0.5490196, 1,
-0.1731423, -1.051367, -2.702613, 0, 1, 0.5568628, 1,
-0.1696995, 1.094412, -1.044583, 0, 1, 0.5607843, 1,
-0.1692592, 1.492315, -1.13622, 0, 1, 0.5686275, 1,
-0.1639819, -0.119511, -3.644148, 0, 1, 0.572549, 1,
-0.1634571, 0.8603571, 0.5263528, 0, 1, 0.5803922, 1,
-0.1631988, -1.109503, -3.842107, 0, 1, 0.5843138, 1,
-0.1619609, -0.7674134, -4.865854, 0, 1, 0.5921569, 1,
-0.1593346, 0.09332979, -1.257377, 0, 1, 0.5960785, 1,
-0.1581119, 0.9734267, 0.5833647, 0, 1, 0.6039216, 1,
-0.1558297, -0.8004897, -4.146433, 0, 1, 0.6117647, 1,
-0.1546843, -0.3060486, -2.562307, 0, 1, 0.6156863, 1,
-0.1496814, -1.213243, -3.449239, 0, 1, 0.6235294, 1,
-0.1474717, 0.9450362, -0.1208052, 0, 1, 0.627451, 1,
-0.1450747, -0.225835, -3.171188, 0, 1, 0.6352941, 1,
-0.1439784, 0.9518917, -0.2626678, 0, 1, 0.6392157, 1,
-0.1433422, -0.1136164, -1.979217, 0, 1, 0.6470588, 1,
-0.1427932, 0.7829815, 0.8078568, 0, 1, 0.6509804, 1,
-0.1419289, -1.024034, -3.863072, 0, 1, 0.6588235, 1,
-0.1409407, 0.06429289, 0.2482915, 0, 1, 0.6627451, 1,
-0.140226, 2.428658, -1.206392, 0, 1, 0.6705883, 1,
-0.1351727, 1.617824, -1.283781, 0, 1, 0.6745098, 1,
-0.134432, 1.270734, 0.1076728, 0, 1, 0.682353, 1,
-0.1323502, -0.3694819, -4.14696, 0, 1, 0.6862745, 1,
-0.1289798, -3.015619, -4.795334, 0, 1, 0.6941177, 1,
-0.1236857, -0.9247848, -3.120293, 0, 1, 0.7019608, 1,
-0.1231496, -0.8589342, -3.045572, 0, 1, 0.7058824, 1,
-0.1223167, -0.2276409, -1.711347, 0, 1, 0.7137255, 1,
-0.1177198, 0.7361439, -1.040359, 0, 1, 0.7176471, 1,
-0.114424, -2.425924, -3.426118, 0, 1, 0.7254902, 1,
-0.1087554, -1.121086, -3.459466, 0, 1, 0.7294118, 1,
-0.1016398, -0.5890934, -3.883174, 0, 1, 0.7372549, 1,
-0.0979665, -1.32126, -3.221489, 0, 1, 0.7411765, 1,
-0.09794997, -2.738889, -3.634389, 0, 1, 0.7490196, 1,
-0.09628254, 1.508609, -0.1450251, 0, 1, 0.7529412, 1,
-0.09555922, 1.681647, -0.7493253, 0, 1, 0.7607843, 1,
-0.0904451, 1.343275, 0.3852674, 0, 1, 0.7647059, 1,
-0.08135083, -1.339619, -2.706625, 0, 1, 0.772549, 1,
-0.07752772, -0.06117551, -2.506139, 0, 1, 0.7764706, 1,
-0.07614147, 0.5008664, -0.2130241, 0, 1, 0.7843137, 1,
-0.07110938, -0.4514465, -1.057016, 0, 1, 0.7882353, 1,
-0.06969817, 0.9447898, -1.968507, 0, 1, 0.7960784, 1,
-0.06671792, -0.5454458, -3.871826, 0, 1, 0.8039216, 1,
-0.06446968, 0.5152643, -0.09078947, 0, 1, 0.8078431, 1,
-0.06150671, -0.4341407, -4.080312, 0, 1, 0.8156863, 1,
-0.05695074, -1.072478, -2.564997, 0, 1, 0.8196079, 1,
-0.03956033, -1.391786, -1.036462, 0, 1, 0.827451, 1,
-0.03938086, -1.24689, -0.9118295, 0, 1, 0.8313726, 1,
-0.03850614, -1.401099, -3.037895, 0, 1, 0.8392157, 1,
-0.03357283, -0.4131573, -3.071721, 0, 1, 0.8431373, 1,
-0.03218832, -0.1012296, -2.535897, 0, 1, 0.8509804, 1,
-0.03191644, 0.03716188, -0.04828798, 0, 1, 0.854902, 1,
-0.03142905, 0.426139, 0.6186103, 0, 1, 0.8627451, 1,
-0.03014542, 0.937452, -0.5328834, 0, 1, 0.8666667, 1,
-0.02528731, 1.573873, 1.215811, 0, 1, 0.8745098, 1,
-0.02133081, 1.712059, 1.404088, 0, 1, 0.8784314, 1,
-0.01723741, 0.003924652, 0.2274429, 0, 1, 0.8862745, 1,
-0.01718752, -0.2687399, -3.675433, 0, 1, 0.8901961, 1,
-0.01715656, -1.558449, -5.468059, 0, 1, 0.8980392, 1,
-0.01672739, -0.7344804, -3.288017, 0, 1, 0.9058824, 1,
-0.01574984, 0.6039342, 0.4875026, 0, 1, 0.9098039, 1,
-0.01275295, -1.108406, -3.150182, 0, 1, 0.9176471, 1,
-0.01269535, -0.1523178, -3.194931, 0, 1, 0.9215686, 1,
-0.01204618, 1.543495, 0.1633659, 0, 1, 0.9294118, 1,
-0.01032456, 0.1335403, 1.343217, 0, 1, 0.9333333, 1,
-0.008499952, 1.079714, 0.4456505, 0, 1, 0.9411765, 1,
-0.007747261, -0.9702661, -3.303536, 0, 1, 0.945098, 1,
-0.005922388, -1.328631, -3.657703, 0, 1, 0.9529412, 1,
-0.005847359, 0.3277774, -0.9760175, 0, 1, 0.9568627, 1,
-0.001595861, -0.5647027, -2.280878, 0, 1, 0.9647059, 1,
-0.001331216, 0.709817, -0.9775354, 0, 1, 0.9686275, 1,
0.005295994, -1.582391, 3.330208, 0, 1, 0.9764706, 1,
0.01088274, 1.276758, -3.055787, 0, 1, 0.9803922, 1,
0.01795066, 0.2822561, -0.09081983, 0, 1, 0.9882353, 1,
0.0218228, 0.8773216, 1.142326, 0, 1, 0.9921569, 1,
0.02725565, 0.6395035, 0.7793963, 0, 1, 1, 1,
0.05024783, -1.002572, 4.018958, 0, 0.9921569, 1, 1,
0.05510145, 0.2313519, -0.1797671, 0, 0.9882353, 1, 1,
0.05658586, -1.399091, 2.254135, 0, 0.9803922, 1, 1,
0.0579274, 0.4755311, -0.1662331, 0, 0.9764706, 1, 1,
0.05931704, 1.853408, 2.962366, 0, 0.9686275, 1, 1,
0.06308232, -0.1252998, 3.301817, 0, 0.9647059, 1, 1,
0.06427426, -0.03112371, 2.41767, 0, 0.9568627, 1, 1,
0.0644979, -0.3141607, 5.03873, 0, 0.9529412, 1, 1,
0.06619357, -1.428472, 2.994059, 0, 0.945098, 1, 1,
0.06929502, 0.6120402, -1.08855, 0, 0.9411765, 1, 1,
0.07515907, 0.8292019, -0.3625997, 0, 0.9333333, 1, 1,
0.07592283, 0.4281491, -0.01624051, 0, 0.9294118, 1, 1,
0.0781633, -1.453156, 2.217806, 0, 0.9215686, 1, 1,
0.07850153, 0.9904965, 1.121299, 0, 0.9176471, 1, 1,
0.07997877, 0.505316, 0.5126661, 0, 0.9098039, 1, 1,
0.08170521, 0.9339765, -0.429894, 0, 0.9058824, 1, 1,
0.08323862, 0.9363839, 1.259556, 0, 0.8980392, 1, 1,
0.08365044, -0.283668, 2.900681, 0, 0.8901961, 1, 1,
0.09118597, 0.727601, 0.6072975, 0, 0.8862745, 1, 1,
0.09557519, -1.049852, 2.482871, 0, 0.8784314, 1, 1,
0.09852795, 0.4057249, 1.120644, 0, 0.8745098, 1, 1,
0.09982096, 0.991794, -0.7708097, 0, 0.8666667, 1, 1,
0.1015546, 0.8102837, 0.9766836, 0, 0.8627451, 1, 1,
0.1042624, -0.1748175, 1.353048, 0, 0.854902, 1, 1,
0.1068586, 0.1858817, 2.651865, 0, 0.8509804, 1, 1,
0.1087804, -0.8371556, 3.517263, 0, 0.8431373, 1, 1,
0.1121909, -0.01581893, 0.3855328, 0, 0.8392157, 1, 1,
0.1152088, -1.324041, 2.560973, 0, 0.8313726, 1, 1,
0.1155333, -1.190645, 2.459108, 0, 0.827451, 1, 1,
0.1172174, -0.1403455, 1.975473, 0, 0.8196079, 1, 1,
0.1191726, 0.3023495, 1.429921, 0, 0.8156863, 1, 1,
0.1219415, 1.317867, -0.4729783, 0, 0.8078431, 1, 1,
0.1235336, -0.089756, 2.3543, 0, 0.8039216, 1, 1,
0.1248244, -0.09488006, 2.093233, 0, 0.7960784, 1, 1,
0.1294295, 0.1417315, 0.4160927, 0, 0.7882353, 1, 1,
0.1310603, 1.728851, -0.8631366, 0, 0.7843137, 1, 1,
0.1311359, 0.01623756, -0.2208663, 0, 0.7764706, 1, 1,
0.135061, 0.03161629, 0.5912217, 0, 0.772549, 1, 1,
0.1367, 0.03518439, 1.461621, 0, 0.7647059, 1, 1,
0.1377406, 1.416783, 1.225642, 0, 0.7607843, 1, 1,
0.1413386, 0.2456541, 0.9339785, 0, 0.7529412, 1, 1,
0.1456548, -0.5085949, 3.276572, 0, 0.7490196, 1, 1,
0.1465197, 1.109741, 1.575754, 0, 0.7411765, 1, 1,
0.1485483, 0.01521457, 2.152609, 0, 0.7372549, 1, 1,
0.1497618, -0.6243191, -0.2600989, 0, 0.7294118, 1, 1,
0.152057, -0.3624848, 2.07507, 0, 0.7254902, 1, 1,
0.1588421, 1.225436, -0.3528298, 0, 0.7176471, 1, 1,
0.1596828, -0.1046608, 3.369953, 0, 0.7137255, 1, 1,
0.1643105, 0.4779082, 0.7137549, 0, 0.7058824, 1, 1,
0.166489, 0.863448, -0.8813582, 0, 0.6980392, 1, 1,
0.1681291, -0.5388872, 2.239266, 0, 0.6941177, 1, 1,
0.1687457, 0.7732404, 0.612016, 0, 0.6862745, 1, 1,
0.1694847, 1.332726, -0.8677472, 0, 0.682353, 1, 1,
0.1703443, 1.376724, 0.001322049, 0, 0.6745098, 1, 1,
0.1736792, 1.059691, -0.6948012, 0, 0.6705883, 1, 1,
0.1775848, -0.1532521, 3.383449, 0, 0.6627451, 1, 1,
0.187366, -0.6075394, 3.314379, 0, 0.6588235, 1, 1,
0.1925324, -0.5919862, 2.706815, 0, 0.6509804, 1, 1,
0.1959599, -1.521958, 4.034766, 0, 0.6470588, 1, 1,
0.199057, 0.3272913, -0.5708435, 0, 0.6392157, 1, 1,
0.1990857, 0.1567876, 2.411596, 0, 0.6352941, 1, 1,
0.2009993, 0.8885759, -0.676157, 0, 0.627451, 1, 1,
0.2018219, 1.112405, -0.5606, 0, 0.6235294, 1, 1,
0.2031712, 1.135021, 1.351525, 0, 0.6156863, 1, 1,
0.2046384, 1.093482, 0.7689251, 0, 0.6117647, 1, 1,
0.2118373, -0.6730191, 2.924253, 0, 0.6039216, 1, 1,
0.2174034, -1.074996, 3.817866, 0, 0.5960785, 1, 1,
0.2274227, 0.900005, -0.3384248, 0, 0.5921569, 1, 1,
0.228167, 0.08984859, -0.3836256, 0, 0.5843138, 1, 1,
0.2317319, -1.492066, 3.189109, 0, 0.5803922, 1, 1,
0.2418802, 0.2220759, 1.161338, 0, 0.572549, 1, 1,
0.2441137, 0.2717843, 0.6924194, 0, 0.5686275, 1, 1,
0.2445192, -2.375725, 2.380066, 0, 0.5607843, 1, 1,
0.2489728, 1.37601, -0.3955538, 0, 0.5568628, 1, 1,
0.2527735, 0.9303917, -2.532571, 0, 0.5490196, 1, 1,
0.2660715, 1.02867, -0.9265754, 0, 0.5450981, 1, 1,
0.2705539, -1.546847, 3.766767, 0, 0.5372549, 1, 1,
0.2720039, -0.2359541, 2.973834, 0, 0.5333334, 1, 1,
0.2781067, -0.5598128, 1.857957, 0, 0.5254902, 1, 1,
0.2797964, 2.031955, 1.899955, 0, 0.5215687, 1, 1,
0.2824686, 0.7767685, -0.4638555, 0, 0.5137255, 1, 1,
0.2827184, 0.1975044, -0.3122141, 0, 0.509804, 1, 1,
0.2854433, 1.804109, 0.4151369, 0, 0.5019608, 1, 1,
0.2858197, 1.095898, -1.513327, 0, 0.4941176, 1, 1,
0.2869341, 0.914663, -0.1895835, 0, 0.4901961, 1, 1,
0.2881702, 0.5619983, 1.177631, 0, 0.4823529, 1, 1,
0.2905911, 0.3542149, -0.559257, 0, 0.4784314, 1, 1,
0.2921952, 0.2086151, 0.4379119, 0, 0.4705882, 1, 1,
0.2933624, -0.4614496, 2.865636, 0, 0.4666667, 1, 1,
0.2946917, 0.7735901, -0.5543382, 0, 0.4588235, 1, 1,
0.2986337, -1.063675, 3.570635, 0, 0.454902, 1, 1,
0.30147, -1.162075, 4.368638, 0, 0.4470588, 1, 1,
0.3028421, -0.943853, 3.352288, 0, 0.4431373, 1, 1,
0.3028486, -2.55215, 4.498578, 0, 0.4352941, 1, 1,
0.3049269, -0.702363, 3.256225, 0, 0.4313726, 1, 1,
0.3082729, 0.3406294, 1.015333, 0, 0.4235294, 1, 1,
0.3102693, -0.8527004, 3.872937, 0, 0.4196078, 1, 1,
0.3189011, 0.4566402, -0.4570625, 0, 0.4117647, 1, 1,
0.3206522, -1.504507, 2.103593, 0, 0.4078431, 1, 1,
0.321384, -0.9600661, 3.121222, 0, 0.4, 1, 1,
0.3227057, 0.5267058, 1.146979, 0, 0.3921569, 1, 1,
0.3228919, -1.573178, 5.129948, 0, 0.3882353, 1, 1,
0.3302907, 0.3998882, 0.6297081, 0, 0.3803922, 1, 1,
0.3335346, 0.3013334, 0.5656837, 0, 0.3764706, 1, 1,
0.3384163, 0.9672626, 0.08152684, 0, 0.3686275, 1, 1,
0.3418543, 0.2217746, 2.83876, 0, 0.3647059, 1, 1,
0.344528, 1.139595, -0.03091808, 0, 0.3568628, 1, 1,
0.3545935, -0.5551082, 1.321455, 0, 0.3529412, 1, 1,
0.3552868, 0.07036158, 2.733855, 0, 0.345098, 1, 1,
0.3564164, 0.9827924, 0.6792055, 0, 0.3411765, 1, 1,
0.3569291, -0.9632823, 2.182682, 0, 0.3333333, 1, 1,
0.3603303, -1.509766, 3.612375, 0, 0.3294118, 1, 1,
0.3603928, -0.3942798, 3.975105, 0, 0.3215686, 1, 1,
0.3637009, -0.9967326, 2.301532, 0, 0.3176471, 1, 1,
0.3688146, 1.638045, 0.1966421, 0, 0.3098039, 1, 1,
0.3691549, -1.14321, 2.401961, 0, 0.3058824, 1, 1,
0.3692527, -0.3146214, 2.435189, 0, 0.2980392, 1, 1,
0.3710823, -0.04842292, 1.388333, 0, 0.2901961, 1, 1,
0.3728577, -0.2517933, 0.6822672, 0, 0.2862745, 1, 1,
0.3740459, 0.05784541, 0.7777201, 0, 0.2784314, 1, 1,
0.3747101, 0.2352292, -0.3499939, 0, 0.2745098, 1, 1,
0.3785618, 0.3448144, -0.4480622, 0, 0.2666667, 1, 1,
0.3852064, 0.5280952, 2.94548, 0, 0.2627451, 1, 1,
0.3876007, -0.8173621, 2.51678, 0, 0.254902, 1, 1,
0.3900447, 0.2809898, 0.9139605, 0, 0.2509804, 1, 1,
0.3930555, 1.350529, -0.2970143, 0, 0.2431373, 1, 1,
0.3940191, 0.5914975, 0.4103249, 0, 0.2392157, 1, 1,
0.400176, -0.4392912, 2.976342, 0, 0.2313726, 1, 1,
0.4021693, 0.365216, 1.383412, 0, 0.227451, 1, 1,
0.4058028, -1.024505, 4.379106, 0, 0.2196078, 1, 1,
0.4068427, 0.2328005, 0.8826951, 0, 0.2156863, 1, 1,
0.4078936, 1.151748, 0.8725437, 0, 0.2078431, 1, 1,
0.4081058, 1.246355, -1.739985, 0, 0.2039216, 1, 1,
0.4089455, -1.582164, 3.798015, 0, 0.1960784, 1, 1,
0.4098798, 0.1959829, 0.2446877, 0, 0.1882353, 1, 1,
0.4127614, -0.3041966, 2.814193, 0, 0.1843137, 1, 1,
0.4169528, -0.1845659, 0.2932762, 0, 0.1764706, 1, 1,
0.4176067, 0.6749392, 0.06362647, 0, 0.172549, 1, 1,
0.419014, -0.5249352, 2.031122, 0, 0.1647059, 1, 1,
0.4198946, 0.8556067, 0.8479599, 0, 0.1607843, 1, 1,
0.4241942, 1.022346, 0.6921247, 0, 0.1529412, 1, 1,
0.4250015, -0.797847, 3.391864, 0, 0.1490196, 1, 1,
0.4275172, 0.3413885, 0.5244709, 0, 0.1411765, 1, 1,
0.4275787, 0.6788903, 0.7708983, 0, 0.1372549, 1, 1,
0.4300129, 0.2458952, 2.140552, 0, 0.1294118, 1, 1,
0.4371642, -1.092176, 1.111119, 0, 0.1254902, 1, 1,
0.4383651, -0.07489063, 2.842005, 0, 0.1176471, 1, 1,
0.4396794, 0.03453143, 1.509314, 0, 0.1137255, 1, 1,
0.4417093, -0.9563631, 3.365801, 0, 0.1058824, 1, 1,
0.4436498, 0.4617065, 0.7189944, 0, 0.09803922, 1, 1,
0.4457631, -0.6453637, 3.432046, 0, 0.09411765, 1, 1,
0.446511, 0.9206456, -1.48216, 0, 0.08627451, 1, 1,
0.4465684, -0.00145629, 1.280785, 0, 0.08235294, 1, 1,
0.4488823, -0.294631, 3.144293, 0, 0.07450981, 1, 1,
0.4557837, 0.7355229, 0.5389709, 0, 0.07058824, 1, 1,
0.4567916, 0.05952592, -0.7982664, 0, 0.0627451, 1, 1,
0.4595292, 1.984086, -1.438136, 0, 0.05882353, 1, 1,
0.4627819, -0.2692434, 0.3053955, 0, 0.05098039, 1, 1,
0.4766465, -0.444214, 1.821954, 0, 0.04705882, 1, 1,
0.4785331, -0.5242934, 2.683983, 0, 0.03921569, 1, 1,
0.4796036, 0.669462, 0.8582854, 0, 0.03529412, 1, 1,
0.4797585, 0.2828118, 2.450772, 0, 0.02745098, 1, 1,
0.4883177, -0.4054497, 2.929259, 0, 0.02352941, 1, 1,
0.4885113, 2.109798, -0.002212671, 0, 0.01568628, 1, 1,
0.4885787, -0.6062725, 2.054868, 0, 0.01176471, 1, 1,
0.5042677, 0.3912082, 1.901284, 0, 0.003921569, 1, 1,
0.5048065, 0.05995823, 1.458244, 0.003921569, 0, 1, 1,
0.5053785, 1.039262, -0.07734215, 0.007843138, 0, 1, 1,
0.5058797, 0.2136958, 0.6865853, 0.01568628, 0, 1, 1,
0.5069005, -0.04393239, 2.201832, 0.01960784, 0, 1, 1,
0.5073683, 0.2814574, 0.5582948, 0.02745098, 0, 1, 1,
0.5083539, -1.596237, 4.468571, 0.03137255, 0, 1, 1,
0.5102264, -2.333626, 1.875619, 0.03921569, 0, 1, 1,
0.5132722, -1.224655, 4.571034, 0.04313726, 0, 1, 1,
0.5165086, 1.015868, -1.004853, 0.05098039, 0, 1, 1,
0.5180103, 0.3964822, -1.789026, 0.05490196, 0, 1, 1,
0.5194068, 0.7221428, 0.854543, 0.0627451, 0, 1, 1,
0.5195919, -0.3131432, 1.805646, 0.06666667, 0, 1, 1,
0.521234, 0.2813667, 0.02360875, 0.07450981, 0, 1, 1,
0.522396, -0.3495981, 1.422328, 0.07843138, 0, 1, 1,
0.5260934, -2.013161, 2.799089, 0.08627451, 0, 1, 1,
0.5293347, 0.1454624, 1.66396, 0.09019608, 0, 1, 1,
0.5319799, -0.3307095, 3.612956, 0.09803922, 0, 1, 1,
0.5335336, 0.7797215, 1.16897, 0.1058824, 0, 1, 1,
0.5344895, 0.2659549, 2.648519, 0.1098039, 0, 1, 1,
0.5366532, 1.764019, 0.2366143, 0.1176471, 0, 1, 1,
0.540602, -1.02601, 2.075537, 0.1215686, 0, 1, 1,
0.5412796, 0.0130856, 2.709882, 0.1294118, 0, 1, 1,
0.5433173, 0.04702049, -0.5831549, 0.1333333, 0, 1, 1,
0.5436499, -0.9363288, 1.884135, 0.1411765, 0, 1, 1,
0.5484442, -2.014844, 3.566725, 0.145098, 0, 1, 1,
0.549405, 0.2802151, 0.05282542, 0.1529412, 0, 1, 1,
0.5505959, -0.35246, 3.283023, 0.1568628, 0, 1, 1,
0.5514514, -0.245108, 2.638625, 0.1647059, 0, 1, 1,
0.5538778, 0.5050723, 2.166458, 0.1686275, 0, 1, 1,
0.5544005, 0.45689, 0.5758299, 0.1764706, 0, 1, 1,
0.5584207, 0.003894927, 1.166954, 0.1803922, 0, 1, 1,
0.5595955, -0.7025772, 3.098443, 0.1882353, 0, 1, 1,
0.5599962, -1.086484, 4.906902, 0.1921569, 0, 1, 1,
0.5655146, -0.4819486, 3.866657, 0.2, 0, 1, 1,
0.5744337, -0.2399776, 1.802292, 0.2078431, 0, 1, 1,
0.5744409, 0.4546239, 0.08331387, 0.2117647, 0, 1, 1,
0.5780098, -0.3202906, 3.936452, 0.2196078, 0, 1, 1,
0.5810296, -1.777141, 2.975589, 0.2235294, 0, 1, 1,
0.5858786, 0.1880936, 1.224478, 0.2313726, 0, 1, 1,
0.5863876, 0.362178, 2.972576, 0.2352941, 0, 1, 1,
0.5916801, 1.800357, 0.5825331, 0.2431373, 0, 1, 1,
0.5957201, 0.74736, 1.282332, 0.2470588, 0, 1, 1,
0.6000589, -0.7104178, 1.176218, 0.254902, 0, 1, 1,
0.6006815, -1.455678, 0.6479236, 0.2588235, 0, 1, 1,
0.6012133, -0.9767693, 3.338131, 0.2666667, 0, 1, 1,
0.6021546, -0.07454836, 1.737938, 0.2705882, 0, 1, 1,
0.6069996, -1.021957, 2.167543, 0.2784314, 0, 1, 1,
0.6070105, -0.02568633, 2.527052, 0.282353, 0, 1, 1,
0.6083664, 1.430035, 0.2459915, 0.2901961, 0, 1, 1,
0.6124966, 0.01053254, 0.2677702, 0.2941177, 0, 1, 1,
0.6167312, -1.005857, 3.035568, 0.3019608, 0, 1, 1,
0.6175224, 1.479809, -0.6549066, 0.3098039, 0, 1, 1,
0.6195703, 1.39872, 1.139604, 0.3137255, 0, 1, 1,
0.6260888, -1.937719, 0.9562628, 0.3215686, 0, 1, 1,
0.6276441, 0.5862237, -0.03709263, 0.3254902, 0, 1, 1,
0.6295473, 1.519868, -0.7758151, 0.3333333, 0, 1, 1,
0.6345427, -0.5984859, 3.127293, 0.3372549, 0, 1, 1,
0.6353902, -1.501645, 1.997185, 0.345098, 0, 1, 1,
0.6420998, 0.5768146, 0.2815768, 0.3490196, 0, 1, 1,
0.6422415, -0.9848954, 3.541534, 0.3568628, 0, 1, 1,
0.6427536, -1.028439, 3.939391, 0.3607843, 0, 1, 1,
0.6454467, -0.7040296, 3.374831, 0.3686275, 0, 1, 1,
0.6464124, -1.222509, 1.709651, 0.372549, 0, 1, 1,
0.6469429, 1.389572, 0.7312706, 0.3803922, 0, 1, 1,
0.6529043, 0.5002098, 0.986964, 0.3843137, 0, 1, 1,
0.6648185, -0.3196596, 0.6901237, 0.3921569, 0, 1, 1,
0.6680574, -0.7040831, 2.516061, 0.3960784, 0, 1, 1,
0.6775522, 1.219838, 1.546124, 0.4039216, 0, 1, 1,
0.6800326, -0.3545382, 1.867302, 0.4117647, 0, 1, 1,
0.685078, 1.297092, 1.635714, 0.4156863, 0, 1, 1,
0.6884919, 0.46106, 0.8604936, 0.4235294, 0, 1, 1,
0.6888006, 1.046272, 0.4698592, 0.427451, 0, 1, 1,
0.6909347, -0.06659859, -0.08654069, 0.4352941, 0, 1, 1,
0.6938785, 0.2860076, 3.378539, 0.4392157, 0, 1, 1,
0.7036873, -1.160428, 2.131116, 0.4470588, 0, 1, 1,
0.7081983, 0.5195882, 1.301591, 0.4509804, 0, 1, 1,
0.7090784, -0.6679803, 2.459377, 0.4588235, 0, 1, 1,
0.7092416, 0.3162386, 2.142653, 0.4627451, 0, 1, 1,
0.7118606, 0.6655675, -0.8908914, 0.4705882, 0, 1, 1,
0.7175061, 0.7504593, 0.9791702, 0.4745098, 0, 1, 1,
0.7194688, 1.591976, 1.430762, 0.4823529, 0, 1, 1,
0.7261531, -1.090044, 1.160908, 0.4862745, 0, 1, 1,
0.7274768, 1.448241, 1.226476, 0.4941176, 0, 1, 1,
0.727906, -0.3540795, 3.456012, 0.5019608, 0, 1, 1,
0.7280452, -0.2420465, 3.384263, 0.5058824, 0, 1, 1,
0.7343375, -0.4746591, 1.160757, 0.5137255, 0, 1, 1,
0.7382263, -1.931032, 3.434693, 0.5176471, 0, 1, 1,
0.7409015, 1.111195, 0.6845718, 0.5254902, 0, 1, 1,
0.7434066, -0.9269673, 2.591857, 0.5294118, 0, 1, 1,
0.7451849, 0.9796095, 0.8203832, 0.5372549, 0, 1, 1,
0.7460851, 1.391578, 1.935181, 0.5411765, 0, 1, 1,
0.7483059, 1.130292, -0.461577, 0.5490196, 0, 1, 1,
0.755697, -1.885126, 3.147892, 0.5529412, 0, 1, 1,
0.757412, 0.2369984, 2.477306, 0.5607843, 0, 1, 1,
0.7576071, -0.5356203, 1.687654, 0.5647059, 0, 1, 1,
0.7599289, -0.2947853, 0.7181789, 0.572549, 0, 1, 1,
0.7609152, -0.5727394, 3.201451, 0.5764706, 0, 1, 1,
0.7732388, 0.6643873, -0.4190136, 0.5843138, 0, 1, 1,
0.778702, 0.6646987, 0.8507231, 0.5882353, 0, 1, 1,
0.7812708, -0.19284, 1.790582, 0.5960785, 0, 1, 1,
0.7892043, 0.1133631, 1.160463, 0.6039216, 0, 1, 1,
0.7951115, 1.464782, -0.3534422, 0.6078432, 0, 1, 1,
0.7998398, -0.436895, 0.8507065, 0.6156863, 0, 1, 1,
0.8038591, -0.9558016, 2.732864, 0.6196079, 0, 1, 1,
0.8104752, -1.02932, 1.869085, 0.627451, 0, 1, 1,
0.8165857, -0.8132966, 1.105157, 0.6313726, 0, 1, 1,
0.8194605, 0.2189613, 1.0445, 0.6392157, 0, 1, 1,
0.8194982, -0.8005728, 0.6187376, 0.6431373, 0, 1, 1,
0.8219365, 1.386087, -0.1623928, 0.6509804, 0, 1, 1,
0.8221146, -0.4895892, 2.266261, 0.654902, 0, 1, 1,
0.8258298, -1.028954, 2.503582, 0.6627451, 0, 1, 1,
0.8268201, -0.3019016, 0.720181, 0.6666667, 0, 1, 1,
0.829381, -1.976251, 3.839802, 0.6745098, 0, 1, 1,
0.8329006, -0.3919019, 2.197647, 0.6784314, 0, 1, 1,
0.8406551, -0.9421523, 3.473118, 0.6862745, 0, 1, 1,
0.8445188, -0.5076162, 2.74057, 0.6901961, 0, 1, 1,
0.8451077, 0.7283054, 2.048677, 0.6980392, 0, 1, 1,
0.8455706, 0.9965366, 0.8628395, 0.7058824, 0, 1, 1,
0.8462354, 0.580448, 2.443968, 0.7098039, 0, 1, 1,
0.8467044, 0.8954068, 0.06309208, 0.7176471, 0, 1, 1,
0.8470196, -1.600269, 2.024526, 0.7215686, 0, 1, 1,
0.8546104, 1.060288, -0.7252583, 0.7294118, 0, 1, 1,
0.8573805, -0.1284213, 2.355841, 0.7333333, 0, 1, 1,
0.8576914, -0.1815082, -0.6555474, 0.7411765, 0, 1, 1,
0.862043, -0.05736782, 0.9106036, 0.7450981, 0, 1, 1,
0.8634366, -0.849301, 0.4591111, 0.7529412, 0, 1, 1,
0.8639231, -0.5839331, 1.558451, 0.7568628, 0, 1, 1,
0.8663557, 0.8391232, 0.1159091, 0.7647059, 0, 1, 1,
0.8682294, 0.651521, -0.4068211, 0.7686275, 0, 1, 1,
0.874628, -0.2805219, 3.242656, 0.7764706, 0, 1, 1,
0.8798297, 0.2550458, 1.824305, 0.7803922, 0, 1, 1,
0.8865226, -0.6827139, 0.7848892, 0.7882353, 0, 1, 1,
0.889577, 0.544634, 2.118233, 0.7921569, 0, 1, 1,
0.8902693, -0.7916213, 2.061333, 0.8, 0, 1, 1,
0.8908594, -0.2073969, 0.2489524, 0.8078431, 0, 1, 1,
0.8990365, 1.063043, -0.6544048, 0.8117647, 0, 1, 1,
0.9003635, -0.4194892, 3.180852, 0.8196079, 0, 1, 1,
0.9014109, -1.038251, 2.617777, 0.8235294, 0, 1, 1,
0.9017076, -0.1983551, 2.291133, 0.8313726, 0, 1, 1,
0.9029963, 1.209155, 0.02673359, 0.8352941, 0, 1, 1,
0.9033155, 0.07827643, 1.570178, 0.8431373, 0, 1, 1,
0.9083138, -0.8891716, 1.831565, 0.8470588, 0, 1, 1,
0.9096692, -1.154696, 3.141771, 0.854902, 0, 1, 1,
0.9209759, -0.8634391, 0.4236102, 0.8588235, 0, 1, 1,
0.9230562, -1.837014, 1.39501, 0.8666667, 0, 1, 1,
0.9248753, -0.40132, 2.261918, 0.8705882, 0, 1, 1,
0.9255292, 0.5685588, 0.5386707, 0.8784314, 0, 1, 1,
0.9263712, -0.1096531, 2.704963, 0.8823529, 0, 1, 1,
0.9309748, 1.370995, 0.3152402, 0.8901961, 0, 1, 1,
0.9335834, 1.426121, -0.4924983, 0.8941177, 0, 1, 1,
0.9345899, -0.5496191, 2.408771, 0.9019608, 0, 1, 1,
0.943398, -1.10063, 2.741714, 0.9098039, 0, 1, 1,
0.9467689, -0.175484, 1.018789, 0.9137255, 0, 1, 1,
0.9471353, 1.460322, -0.4095134, 0.9215686, 0, 1, 1,
0.9490582, -0.7267702, 2.464393, 0.9254902, 0, 1, 1,
0.9505965, 0.6245574, -0.3166083, 0.9333333, 0, 1, 1,
0.9514037, 0.3069179, 2.227783, 0.9372549, 0, 1, 1,
0.9535892, 0.484193, -0.2089583, 0.945098, 0, 1, 1,
0.9556114, -0.6005303, 3.909851, 0.9490196, 0, 1, 1,
0.9670303, -0.2038955, 1.754651, 0.9568627, 0, 1, 1,
0.9684226, -1.13175, 1.598147, 0.9607843, 0, 1, 1,
0.969273, 0.0152552, 1.918244, 0.9686275, 0, 1, 1,
0.9706253, 0.5692955, 0.993214, 0.972549, 0, 1, 1,
0.9917067, -0.5174113, 2.145546, 0.9803922, 0, 1, 1,
0.9956832, 0.8008372, 0.8224247, 0.9843137, 0, 1, 1,
1.000125, -1.239062, 1.795338, 0.9921569, 0, 1, 1,
1.008998, -1.294997, 3.321434, 0.9960784, 0, 1, 1,
1.011103, -1.146096, 1.173681, 1, 0, 0.9960784, 1,
1.019803, -1.510462, 2.307604, 1, 0, 0.9882353, 1,
1.020187, 1.114547, 1.225789, 1, 0, 0.9843137, 1,
1.031063, -1.820915, 0.556637, 1, 0, 0.9764706, 1,
1.033718, 0.7546431, -0.01423536, 1, 0, 0.972549, 1,
1.0445, -0.02164939, 1.243038, 1, 0, 0.9647059, 1,
1.049305, 0.09891942, 1.830968, 1, 0, 0.9607843, 1,
1.056662, -0.06400163, 0.8016237, 1, 0, 0.9529412, 1,
1.059495, -0.5048094, 1.154351, 1, 0, 0.9490196, 1,
1.062253, 0.2422266, 0.2530568, 1, 0, 0.9411765, 1,
1.067362, -0.3171816, 1.183179, 1, 0, 0.9372549, 1,
1.072462, 0.6126739, 0.755451, 1, 0, 0.9294118, 1,
1.075183, 0.3868507, 1.790004, 1, 0, 0.9254902, 1,
1.07737, -2.578099, 4.303198, 1, 0, 0.9176471, 1,
1.078337, 0.7485176, 3.034576, 1, 0, 0.9137255, 1,
1.080555, 0.6076245, 2.998658, 1, 0, 0.9058824, 1,
1.083724, 0.2650737, 1.525995, 1, 0, 0.9019608, 1,
1.089114, 1.060112, 1.422349, 1, 0, 0.8941177, 1,
1.100974, 1.136217, 1.431734, 1, 0, 0.8862745, 1,
1.105316, 0.5731624, 2.367365, 1, 0, 0.8823529, 1,
1.109484, -0.7379887, 2.117489, 1, 0, 0.8745098, 1,
1.122833, -0.7902451, 1.278165, 1, 0, 0.8705882, 1,
1.131909, -0.5230258, 1.946999, 1, 0, 0.8627451, 1,
1.132046, -1.556219, 1.999896, 1, 0, 0.8588235, 1,
1.146185, -0.5277624, 2.274974, 1, 0, 0.8509804, 1,
1.151229, 2.04348, 0.5181279, 1, 0, 0.8470588, 1,
1.157419, -0.001620918, 0.8479487, 1, 0, 0.8392157, 1,
1.160386, 0.9918182, 1.846156, 1, 0, 0.8352941, 1,
1.175837, -0.6897035, 2.100199, 1, 0, 0.827451, 1,
1.178323, -1.010478, 4.236458, 1, 0, 0.8235294, 1,
1.188344, -0.08919765, 2.148095, 1, 0, 0.8156863, 1,
1.188755, 0.4707979, 1.171089, 1, 0, 0.8117647, 1,
1.19266, -0.03976784, 2.400993, 1, 0, 0.8039216, 1,
1.2054, -0.5808394, -0.0987312, 1, 0, 0.7960784, 1,
1.208456, -1.061776, 2.129364, 1, 0, 0.7921569, 1,
1.209202, -0.5607988, 1.712196, 1, 0, 0.7843137, 1,
1.222525, -2.670425, 1.737424, 1, 0, 0.7803922, 1,
1.224123, 1.163197, -0.5059161, 1, 0, 0.772549, 1,
1.229354, 0.9790621, 0.572973, 1, 0, 0.7686275, 1,
1.231163, 1.489556, 0.6000788, 1, 0, 0.7607843, 1,
1.236926, 0.2767728, 1.197493, 1, 0, 0.7568628, 1,
1.242285, -0.9606247, 3.231059, 1, 0, 0.7490196, 1,
1.269019, -0.2394798, 4.16718, 1, 0, 0.7450981, 1,
1.276085, 0.6260526, 2.540192, 1, 0, 0.7372549, 1,
1.276698, 0.9107469, 1.623992, 1, 0, 0.7333333, 1,
1.280377, 0.2564712, 1.325879, 1, 0, 0.7254902, 1,
1.285156, -0.8133155, 0.6396465, 1, 0, 0.7215686, 1,
1.286976, -0.1502991, 1.220439, 1, 0, 0.7137255, 1,
1.299982, 0.5993519, 0.9032569, 1, 0, 0.7098039, 1,
1.3007, -2.827004, 5.552119, 1, 0, 0.7019608, 1,
1.323435, -0.241998, 2.575767, 1, 0, 0.6941177, 1,
1.330388, -1.169843, 2.677443, 1, 0, 0.6901961, 1,
1.335097, 0.3581904, 0.8420833, 1, 0, 0.682353, 1,
1.339734, 0.3897522, 0.6018882, 1, 0, 0.6784314, 1,
1.354102, -2.058362, 3.062195, 1, 0, 0.6705883, 1,
1.368335, 0.2392002, 0.1757627, 1, 0, 0.6666667, 1,
1.371377, -0.4527216, 0.3222913, 1, 0, 0.6588235, 1,
1.375488, 0.7005301, 1.323265, 1, 0, 0.654902, 1,
1.376057, -1.347737, 2.311202, 1, 0, 0.6470588, 1,
1.380117, -1.433146, 2.210367, 1, 0, 0.6431373, 1,
1.390165, 1.58216, 0.8662176, 1, 0, 0.6352941, 1,
1.391033, -2.037022, 2.98823, 1, 0, 0.6313726, 1,
1.391964, 1.952694, -0.5529736, 1, 0, 0.6235294, 1,
1.394118, 0.5357753, -0.3712678, 1, 0, 0.6196079, 1,
1.395228, 0.4486232, 0.7472923, 1, 0, 0.6117647, 1,
1.400118, 0.1195816, 2.152051, 1, 0, 0.6078432, 1,
1.400456, 0.5022812, 1.797725, 1, 0, 0.6, 1,
1.413637, 0.767394, 0.2620532, 1, 0, 0.5921569, 1,
1.418603, -1.07158, 2.836109, 1, 0, 0.5882353, 1,
1.423387, -2.566422, 1.062438, 1, 0, 0.5803922, 1,
1.427086, -0.7090808, 0.9949262, 1, 0, 0.5764706, 1,
1.43946, 1.905327, 0.1036712, 1, 0, 0.5686275, 1,
1.446253, -0.4825868, 2.474784, 1, 0, 0.5647059, 1,
1.462681, 0.09654898, 1.696474, 1, 0, 0.5568628, 1,
1.468511, -0.6120679, 2.33935, 1, 0, 0.5529412, 1,
1.470962, 0.400503, 1.454048, 1, 0, 0.5450981, 1,
1.478599, -1.089002, 3.945498, 1, 0, 0.5411765, 1,
1.481715, 0.4084652, 0.5405948, 1, 0, 0.5333334, 1,
1.485507, 0.004693611, -1.078942, 1, 0, 0.5294118, 1,
1.49164, -0.587441, 0.3986024, 1, 0, 0.5215687, 1,
1.492574, 1.582071, 0.7551755, 1, 0, 0.5176471, 1,
1.496037, -1.717473, 4.067348, 1, 0, 0.509804, 1,
1.49694, -2.340451, 1.637971, 1, 0, 0.5058824, 1,
1.502883, -0.834186, 0.8492591, 1, 0, 0.4980392, 1,
1.503651, 0.1266323, 2.27809, 1, 0, 0.4901961, 1,
1.527637, 0.931796, 1.398439, 1, 0, 0.4862745, 1,
1.563403, 1.704575, 1.177024, 1, 0, 0.4784314, 1,
1.565154, 0.05766147, 2.003526, 1, 0, 0.4745098, 1,
1.570034, 0.4696622, 1.62157, 1, 0, 0.4666667, 1,
1.575269, 1.520294, 1.018628, 1, 0, 0.4627451, 1,
1.584387, -0.7668504, 1.811074, 1, 0, 0.454902, 1,
1.616227, 0.3985597, 0.9622687, 1, 0, 0.4509804, 1,
1.617093, 1.208623, 1.221652, 1, 0, 0.4431373, 1,
1.6242, -0.05021179, 2.149234, 1, 0, 0.4392157, 1,
1.629277, -0.7120288, -0.9026009, 1, 0, 0.4313726, 1,
1.630788, 1.060079, 0.9408389, 1, 0, 0.427451, 1,
1.63427, -0.9032631, 1.848156, 1, 0, 0.4196078, 1,
1.646347, 0.611343, 1.169347, 1, 0, 0.4156863, 1,
1.649337, -2.165857, 3.157019, 1, 0, 0.4078431, 1,
1.651269, -0.6887084, 1.22153, 1, 0, 0.4039216, 1,
1.653313, -1.698537, 2.140565, 1, 0, 0.3960784, 1,
1.656219, 0.4082957, 1.281864, 1, 0, 0.3882353, 1,
1.677877, -0.4420497, 2.006702, 1, 0, 0.3843137, 1,
1.679519, -0.01637617, 1.473969, 1, 0, 0.3764706, 1,
1.692309, 2.186954, 0.7512915, 1, 0, 0.372549, 1,
1.698647, -0.7527758, 1.133711, 1, 0, 0.3647059, 1,
1.699861, -1.122419, 1.491054, 1, 0, 0.3607843, 1,
1.699966, 0.7644637, 0.5861048, 1, 0, 0.3529412, 1,
1.703238, 1.200542, 0.8161818, 1, 0, 0.3490196, 1,
1.709274, -0.7224354, 2.19804, 1, 0, 0.3411765, 1,
1.746359, 0.6869035, 0.3443619, 1, 0, 0.3372549, 1,
1.75078, 0.5486624, 2.881546, 1, 0, 0.3294118, 1,
1.758584, -0.0217692, 2.034606, 1, 0, 0.3254902, 1,
1.762989, 0.1670135, 1.654514, 1, 0, 0.3176471, 1,
1.769178, -0.0522214, 1.308057, 1, 0, 0.3137255, 1,
1.782569, 0.9450912, 0.334621, 1, 0, 0.3058824, 1,
1.797214, -2.757699, 2.208431, 1, 0, 0.2980392, 1,
1.801202, -1.390679, 2.352246, 1, 0, 0.2941177, 1,
1.827928, -0.566639, 3.238607, 1, 0, 0.2862745, 1,
1.829893, -0.3250275, 1.551924, 1, 0, 0.282353, 1,
1.850826, 0.6366788, 0.9160168, 1, 0, 0.2745098, 1,
1.868714, 1.224323, 1.564152, 1, 0, 0.2705882, 1,
1.887837, 0.6183074, 2.172705, 1, 0, 0.2627451, 1,
1.895539, -0.3397087, 1.783188, 1, 0, 0.2588235, 1,
1.896415, -1.090571, 0.9612219, 1, 0, 0.2509804, 1,
1.900773, 0.06355959, 1.556049, 1, 0, 0.2470588, 1,
1.918645, -0.1265012, 2.584556, 1, 0, 0.2392157, 1,
1.943617, -0.1576929, 1.818798, 1, 0, 0.2352941, 1,
1.946894, 2.039716, 0.4667884, 1, 0, 0.227451, 1,
1.953739, -0.5136678, 3.162954, 1, 0, 0.2235294, 1,
1.956852, -1.337817, 2.580533, 1, 0, 0.2156863, 1,
1.96078, 0.01173298, 1.571759, 1, 0, 0.2117647, 1,
1.969243, -1.158322, 1.683466, 1, 0, 0.2039216, 1,
1.976051, -0.3501492, 3.529908, 1, 0, 0.1960784, 1,
2.011447, -0.7535226, 0.88072, 1, 0, 0.1921569, 1,
2.050038, -0.03490074, 3.190899, 1, 0, 0.1843137, 1,
2.063327, -0.2350727, 0.740853, 1, 0, 0.1803922, 1,
2.119433, -0.8558626, 1.598406, 1, 0, 0.172549, 1,
2.138699, -0.9105073, 2.732589, 1, 0, 0.1686275, 1,
2.145016, -0.6375571, 0.8676996, 1, 0, 0.1607843, 1,
2.147524, -1.229216, 2.79607, 1, 0, 0.1568628, 1,
2.150815, 0.9634551, 1.806843, 1, 0, 0.1490196, 1,
2.157388, 0.2732397, 2.528033, 1, 0, 0.145098, 1,
2.161825, 0.2265057, 0.7570832, 1, 0, 0.1372549, 1,
2.191653, 0.8717828, -0.02311844, 1, 0, 0.1333333, 1,
2.212873, 0.7025567, 1.543631, 1, 0, 0.1254902, 1,
2.221758, 0.3490454, 1.223385, 1, 0, 0.1215686, 1,
2.23532, -0.2214557, 3.688748, 1, 0, 0.1137255, 1,
2.238525, -1.238648, 0.4903219, 1, 0, 0.1098039, 1,
2.271375, -0.3456625, 1.778269, 1, 0, 0.1019608, 1,
2.330779, 0.9150165, 3.277805, 1, 0, 0.09411765, 1,
2.337739, 0.31123, 0.9438677, 1, 0, 0.09019608, 1,
2.364984, 0.3333879, 0.4527553, 1, 0, 0.08235294, 1,
2.380599, 0.9698997, 1.512162, 1, 0, 0.07843138, 1,
2.416207, 1.669386, 2.095406, 1, 0, 0.07058824, 1,
2.482171, -0.778501, 1.415028, 1, 0, 0.06666667, 1,
2.49615, 1.106469, 1.215538, 1, 0, 0.05882353, 1,
2.539429, 0.452235, 0.4141777, 1, 0, 0.05490196, 1,
2.633618, -0.6763526, 0.9943887, 1, 0, 0.04705882, 1,
2.739547, 1.266486, -0.277281, 1, 0, 0.04313726, 1,
2.743493, 0.5924388, 1.796679, 1, 0, 0.03529412, 1,
2.767963, -2.395639, 3.020246, 1, 0, 0.03137255, 1,
2.783634, 1.357519, 0.981878, 1, 0, 0.02352941, 1,
2.838247, 0.4097477, 0.9289974, 1, 0, 0.01960784, 1,
2.912803, 0.3446958, 1.224698, 1, 0, 0.01176471, 1,
3.264856, -0.2326802, 0.9650564, 1, 0, 0.007843138, 1
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
-0.0731231, -3.938424, -7.335979, 0, -0.5, 0.5, 0.5,
-0.0731231, -3.938424, -7.335979, 1, -0.5, 0.5, 0.5,
-0.0731231, -3.938424, -7.335979, 1, 1.5, 0.5, 0.5,
-0.0731231, -3.938424, -7.335979, 0, 1.5, 0.5, 0.5
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
-4.542677, -0.2934805, -7.335979, 0, -0.5, 0.5, 0.5,
-4.542677, -0.2934805, -7.335979, 1, -0.5, 0.5, 0.5,
-4.542677, -0.2934805, -7.335979, 1, 1.5, 0.5, 0.5,
-4.542677, -0.2934805, -7.335979, 0, 1.5, 0.5, 0.5
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
-4.542677, -3.938424, 0.0420301, 0, -0.5, 0.5, 0.5,
-4.542677, -3.938424, 0.0420301, 1, -0.5, 0.5, 0.5,
-4.542677, -3.938424, 0.0420301, 1, 1.5, 0.5, 0.5,
-4.542677, -3.938424, 0.0420301, 0, 1.5, 0.5, 0.5
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
-3, -3.097283, -5.633362,
3, -3.097283, -5.633362,
-3, -3.097283, -5.633362,
-3, -3.237473, -5.917131,
-2, -3.097283, -5.633362,
-2, -3.237473, -5.917131,
-1, -3.097283, -5.633362,
-1, -3.237473, -5.917131,
0, -3.097283, -5.633362,
0, -3.237473, -5.917131,
1, -3.097283, -5.633362,
1, -3.237473, -5.917131,
2, -3.097283, -5.633362,
2, -3.237473, -5.917131,
3, -3.097283, -5.633362,
3, -3.237473, -5.917131
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
-3, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
-3, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
-3, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
-3, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
-2, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
-2, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
-2, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
-2, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
-1, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
-1, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
-1, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
-1, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
0, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
0, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
0, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
0, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
1, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
1, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
1, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
1, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
2, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
2, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
2, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
2, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5,
3, -3.517853, -6.484671, 0, -0.5, 0.5, 0.5,
3, -3.517853, -6.484671, 1, -0.5, 0.5, 0.5,
3, -3.517853, -6.484671, 1, 1.5, 0.5, 0.5,
3, -3.517853, -6.484671, 0, 1.5, 0.5, 0.5
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
-3.511241, -3, -5.633362,
-3.511241, 2, -5.633362,
-3.511241, -3, -5.633362,
-3.683147, -3, -5.917131,
-3.511241, -2, -5.633362,
-3.683147, -2, -5.917131,
-3.511241, -1, -5.633362,
-3.683147, -1, -5.917131,
-3.511241, 0, -5.633362,
-3.683147, 0, -5.917131,
-3.511241, 1, -5.633362,
-3.683147, 1, -5.917131,
-3.511241, 2, -5.633362,
-3.683147, 2, -5.917131
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
-4.026959, -3, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, -3, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, -3, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, -3, -6.484671, 0, 1.5, 0.5, 0.5,
-4.026959, -2, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, -2, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, -2, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, -2, -6.484671, 0, 1.5, 0.5, 0.5,
-4.026959, -1, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, -1, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, -1, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, -1, -6.484671, 0, 1.5, 0.5, 0.5,
-4.026959, 0, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, 0, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, 0, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, 0, -6.484671, 0, 1.5, 0.5, 0.5,
-4.026959, 1, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, 1, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, 1, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, 1, -6.484671, 0, 1.5, 0.5, 0.5,
-4.026959, 2, -6.484671, 0, -0.5, 0.5, 0.5,
-4.026959, 2, -6.484671, 1, -0.5, 0.5, 0.5,
-4.026959, 2, -6.484671, 1, 1.5, 0.5, 0.5,
-4.026959, 2, -6.484671, 0, 1.5, 0.5, 0.5
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
-3.511241, -3.097283, -4,
-3.511241, -3.097283, 4,
-3.511241, -3.097283, -4,
-3.683147, -3.237473, -4,
-3.511241, -3.097283, -2,
-3.683147, -3.237473, -2,
-3.511241, -3.097283, 0,
-3.683147, -3.237473, 0,
-3.511241, -3.097283, 2,
-3.683147, -3.237473, 2,
-3.511241, -3.097283, 4,
-3.683147, -3.237473, 4
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
-4.026959, -3.517853, -4, 0, -0.5, 0.5, 0.5,
-4.026959, -3.517853, -4, 1, -0.5, 0.5, 0.5,
-4.026959, -3.517853, -4, 1, 1.5, 0.5, 0.5,
-4.026959, -3.517853, -4, 0, 1.5, 0.5, 0.5,
-4.026959, -3.517853, -2, 0, -0.5, 0.5, 0.5,
-4.026959, -3.517853, -2, 1, -0.5, 0.5, 0.5,
-4.026959, -3.517853, -2, 1, 1.5, 0.5, 0.5,
-4.026959, -3.517853, -2, 0, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 0, 0, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 0, 1, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 0, 1, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 0, 0, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 2, 0, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 2, 1, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 2, 1, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 2, 0, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 4, 0, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 4, 1, -0.5, 0.5, 0.5,
-4.026959, -3.517853, 4, 1, 1.5, 0.5, 0.5,
-4.026959, -3.517853, 4, 0, 1.5, 0.5, 0.5
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
-3.511241, -3.097283, -5.633362,
-3.511241, 2.510322, -5.633362,
-3.511241, -3.097283, 5.717422,
-3.511241, 2.510322, 5.717422,
-3.511241, -3.097283, -5.633362,
-3.511241, -3.097283, 5.717422,
-3.511241, 2.510322, -5.633362,
-3.511241, 2.510322, 5.717422,
-3.511241, -3.097283, -5.633362,
3.364995, -3.097283, -5.633362,
-3.511241, -3.097283, 5.717422,
3.364995, -3.097283, 5.717422,
-3.511241, 2.510322, -5.633362,
3.364995, 2.510322, -5.633362,
-3.511241, 2.510322, 5.717422,
3.364995, 2.510322, 5.717422,
3.364995, -3.097283, -5.633362,
3.364995, 2.510322, -5.633362,
3.364995, -3.097283, 5.717422,
3.364995, 2.510322, 5.717422,
3.364995, -3.097283, -5.633362,
3.364995, -3.097283, 5.717422,
3.364995, 2.510322, -5.633362,
3.364995, 2.510322, 5.717422
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
var radius = 7.693179;
var distance = 34.22782;
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
mvMatrix.translate( 0.0731231, 0.2934805, -0.0420301 );
mvMatrix.scale( 1.209676, 1.483346, 0.7328142 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22782);
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
Antimony_Potassium_T<-read.table("Antimony_Potassium_T.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
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
-3.411102, 0.7571518, -0.1402025, 0, 0, 1, 1, 1,
-3.102135, -0.4252385, -0.7856653, 1, 0, 0, 1, 1,
-3.060584, -0.4616848, -1.251739, 1, 0, 0, 1, 1,
-2.635886, -0.8045996, -1.859441, 1, 0, 0, 1, 1,
-2.592615, 0.2453805, -2.95455, 1, 0, 0, 1, 1,
-2.561007, -1.245288, -3.207037, 1, 0, 0, 1, 1,
-2.560075, -0.221513, -3.317817, 0, 0, 0, 1, 1,
-2.481069, -0.6618306, -1.987089, 0, 0, 0, 1, 1,
-2.473206, 0.5605153, -1.83224, 0, 0, 0, 1, 1,
-2.414111, -1.095814, -2.3221, 0, 0, 0, 1, 1,
-2.40686, 0.03914524, -0.5475749, 0, 0, 0, 1, 1,
-2.287874, -0.2160349, 0.005221803, 0, 0, 0, 1, 1,
-2.224307, 2.149086, -0.3081617, 0, 0, 0, 1, 1,
-2.182018, 1.488988, 0.7810882, 1, 1, 1, 1, 1,
-2.128214, -0.915177, -1.691227, 1, 1, 1, 1, 1,
-2.126514, -0.2883641, -0.6611658, 1, 1, 1, 1, 1,
-2.106466, -1.535549, -2.934383, 1, 1, 1, 1, 1,
-2.078695, -0.8807938, -1.168281, 1, 1, 1, 1, 1,
-2.034779, -0.3459119, -1.021302, 1, 1, 1, 1, 1,
-2.034014, 0.3655277, -1.895133, 1, 1, 1, 1, 1,
-2.031137, 0.8829567, -1.52553, 1, 1, 1, 1, 1,
-1.987313, -0.6537931, -1.726109, 1, 1, 1, 1, 1,
-1.971968, -0.7245559, -4.018915, 1, 1, 1, 1, 1,
-1.940537, -1.924801, -1.836382, 1, 1, 1, 1, 1,
-1.935871, -0.05744246, -0.3928779, 1, 1, 1, 1, 1,
-1.874243, -0.7702449, -2.618144, 1, 1, 1, 1, 1,
-1.870423, 1.703686, -0.6452069, 1, 1, 1, 1, 1,
-1.858844, -0.9174547, -3.177541, 1, 1, 1, 1, 1,
-1.844804, -0.5428289, -1.148189, 0, 0, 1, 1, 1,
-1.841076, 1.230449, -0.9540755, 1, 0, 0, 1, 1,
-1.809536, 0.1956625, -1.185168, 1, 0, 0, 1, 1,
-1.807507, -0.2739861, -1.164801, 1, 0, 0, 1, 1,
-1.806097, 0.2489621, -1.307972, 1, 0, 0, 1, 1,
-1.803057, 0.9470502, 1.031954, 1, 0, 0, 1, 1,
-1.791421, 1.764081, 0.6500102, 0, 0, 0, 1, 1,
-1.790831, 0.1510373, -1.758397, 0, 0, 0, 1, 1,
-1.786735, 0.08193912, -1.786596, 0, 0, 0, 1, 1,
-1.768864, -0.3917377, -0.9471498, 0, 0, 0, 1, 1,
-1.76714, 0.5960656, -1.323083, 0, 0, 0, 1, 1,
-1.765242, -0.6348042, -0.6826711, 0, 0, 0, 1, 1,
-1.753116, 0.01854064, -1.834419, 0, 0, 0, 1, 1,
-1.75303, 0.3053971, -0.7736366, 1, 1, 1, 1, 1,
-1.744938, -0.355339, 1.062526, 1, 1, 1, 1, 1,
-1.722687, -0.5031162, -1.581774, 1, 1, 1, 1, 1,
-1.68556, -0.4732198, -2.756853, 1, 1, 1, 1, 1,
-1.680536, -0.2505722, -3.868208, 1, 1, 1, 1, 1,
-1.668247, 0.2573274, -2.958861, 1, 1, 1, 1, 1,
-1.665256, 1.209763, -1.297084, 1, 1, 1, 1, 1,
-1.65784, 0.7057711, -2.605563, 1, 1, 1, 1, 1,
-1.656347, 0.9963264, 0.07290872, 1, 1, 1, 1, 1,
-1.649542, -1.040456, -2.255968, 1, 1, 1, 1, 1,
-1.642105, -0.1019581, -2.902397, 1, 1, 1, 1, 1,
-1.640126, -1.782445, -3.525262, 1, 1, 1, 1, 1,
-1.632914, 0.2447615, -0.9007639, 1, 1, 1, 1, 1,
-1.628096, 0.6404563, -1.879931, 1, 1, 1, 1, 1,
-1.62533, -0.7760762, -4.575668, 1, 1, 1, 1, 1,
-1.622892, -1.168982, -3.828785, 0, 0, 1, 1, 1,
-1.595636, -0.1306033, -1.971876, 1, 0, 0, 1, 1,
-1.584957, -0.8037662, -2.535208, 1, 0, 0, 1, 1,
-1.582273, -1.377347, -1.991823, 1, 0, 0, 1, 1,
-1.579646, 0.1119998, -2.686597, 1, 0, 0, 1, 1,
-1.568637, -0.06289478, -1.99694, 1, 0, 0, 1, 1,
-1.562308, -1.28129, -0.8079793, 0, 0, 0, 1, 1,
-1.559811, -0.01797946, -2.058703, 0, 0, 0, 1, 1,
-1.555381, -1.818987, -3.64432, 0, 0, 0, 1, 1,
-1.55307, -0.1795601, -0.4977617, 0, 0, 0, 1, 1,
-1.548774, 0.6450701, -0.9461572, 0, 0, 0, 1, 1,
-1.536792, 1.01779, -2.210528, 0, 0, 0, 1, 1,
-1.534123, -0.61914, -0.910487, 0, 0, 0, 1, 1,
-1.524782, 0.09166183, -2.66676, 1, 1, 1, 1, 1,
-1.509417, -0.7226322, -0.08475731, 1, 1, 1, 1, 1,
-1.504643, 0.1184336, -2.271895, 1, 1, 1, 1, 1,
-1.497531, 1.245275, -0.2709057, 1, 1, 1, 1, 1,
-1.483379, 0.7668352, -0.03329098, 1, 1, 1, 1, 1,
-1.466186, -1.275163, -4.231768, 1, 1, 1, 1, 1,
-1.465037, 1.646829, -2.512635, 1, 1, 1, 1, 1,
-1.459536, -0.7250494, -4.042511, 1, 1, 1, 1, 1,
-1.445328, 0.347121, -0.3639576, 1, 1, 1, 1, 1,
-1.444352, -0.4505207, -1.502739, 1, 1, 1, 1, 1,
-1.436454, -0.1308465, -2.274263, 1, 1, 1, 1, 1,
-1.433702, 0.1868056, -1.85051, 1, 1, 1, 1, 1,
-1.429716, -0.2091053, -0.2719289, 1, 1, 1, 1, 1,
-1.424073, -0.03442411, -0.1145879, 1, 1, 1, 1, 1,
-1.4199, -0.3695274, -1.015777, 1, 1, 1, 1, 1,
-1.413583, 1.019836, -2.028275, 0, 0, 1, 1, 1,
-1.411137, 0.2742796, -1.021753, 1, 0, 0, 1, 1,
-1.408357, -1.215626, -3.420399, 1, 0, 0, 1, 1,
-1.404273, -0.8800517, -2.332388, 1, 0, 0, 1, 1,
-1.401634, -0.366328, -1.723684, 1, 0, 0, 1, 1,
-1.397883, -1.624258, -1.414497, 1, 0, 0, 1, 1,
-1.39212, 0.2133522, -0.381619, 0, 0, 0, 1, 1,
-1.388535, -0.2538444, -2.199923, 0, 0, 0, 1, 1,
-1.382529, 0.6860269, -1.313688, 0, 0, 0, 1, 1,
-1.372154, -0.8558705, -2.396172, 0, 0, 0, 1, 1,
-1.370851, 0.09529384, -0.6632165, 0, 0, 0, 1, 1,
-1.365542, -0.5280959, -1.983161, 0, 0, 0, 1, 1,
-1.346402, 1.281201, -2.139066, 0, 0, 0, 1, 1,
-1.340294, -0.2345541, -3.286013, 1, 1, 1, 1, 1,
-1.338129, -0.755695, -2.013983, 1, 1, 1, 1, 1,
-1.327594, 1.098982, -0.1786304, 1, 1, 1, 1, 1,
-1.322343, 0.1965506, -3.415634, 1, 1, 1, 1, 1,
-1.318438, -0.4731659, -3.084615, 1, 1, 1, 1, 1,
-1.308672, 0.7989841, -1.81435, 1, 1, 1, 1, 1,
-1.306176, -0.2953577, -2.021462, 1, 1, 1, 1, 1,
-1.303226, 0.2451546, -2.488026, 1, 1, 1, 1, 1,
-1.300492, -2.192661, -3.269344, 1, 1, 1, 1, 1,
-1.292604, 0.1716323, -0.4496564, 1, 1, 1, 1, 1,
-1.287192, -1.673144, -3.013485, 1, 1, 1, 1, 1,
-1.284489, -1.034396, -1.390479, 1, 1, 1, 1, 1,
-1.277761, 0.1209821, -2.145102, 1, 1, 1, 1, 1,
-1.276499, 1.369685, -0.4312101, 1, 1, 1, 1, 1,
-1.271151, -0.3380903, -1.922017, 1, 1, 1, 1, 1,
-1.26079, 1.367292, -0.5100787, 0, 0, 1, 1, 1,
-1.252816, 0.7237067, -0.05354038, 1, 0, 0, 1, 1,
-1.250454, 1.050348, 0.2783239, 1, 0, 0, 1, 1,
-1.250404, 0.1277977, -1.883514, 1, 0, 0, 1, 1,
-1.245027, -0.2745898, -3.127984, 1, 0, 0, 1, 1,
-1.236952, -0.6876968, -0.9052015, 1, 0, 0, 1, 1,
-1.236466, -0.4979771, -0.8946942, 0, 0, 0, 1, 1,
-1.230513, 1.916833, -2.218061, 0, 0, 0, 1, 1,
-1.219911, 0.8266589, -1.240359, 0, 0, 0, 1, 1,
-1.199492, 0.8338466, -1.59759, 0, 0, 0, 1, 1,
-1.196443, 1.868839, 1.034372, 0, 0, 0, 1, 1,
-1.194484, -0.238729, -3.740214, 0, 0, 0, 1, 1,
-1.189328, 0.7917268, -2.456567, 0, 0, 0, 1, 1,
-1.185799, -0.3950972, -4.749136, 1, 1, 1, 1, 1,
-1.183941, 1.499742, -0.5439609, 1, 1, 1, 1, 1,
-1.18357, -0.2396417, -0.9557271, 1, 1, 1, 1, 1,
-1.172038, -1.562435, -4.348568, 1, 1, 1, 1, 1,
-1.168554, 0.8538703, -1.223467, 1, 1, 1, 1, 1,
-1.161673, -0.11894, -0.7762163, 1, 1, 1, 1, 1,
-1.152537, 0.7205467, -1.676226, 1, 1, 1, 1, 1,
-1.147773, 0.1902823, -2.164891, 1, 1, 1, 1, 1,
-1.14321, 0.8019461, -1.613721, 1, 1, 1, 1, 1,
-1.137951, -0.6423483, -0.2470782, 1, 1, 1, 1, 1,
-1.134673, 0.004277751, -2.281603, 1, 1, 1, 1, 1,
-1.132478, -1.857758, -2.752379, 1, 1, 1, 1, 1,
-1.119538, 0.02078235, -0.1879559, 1, 1, 1, 1, 1,
-1.118577, -1.480195, -3.719029, 1, 1, 1, 1, 1,
-1.098105, 0.9617229, -2.511096, 1, 1, 1, 1, 1,
-1.087284, -0.1235946, -2.166565, 0, 0, 1, 1, 1,
-1.081904, 1.262078, 1.020489, 1, 0, 0, 1, 1,
-1.08076, -0.03240089, -1.029926, 1, 0, 0, 1, 1,
-1.076382, 0.115041, -0.249209, 1, 0, 0, 1, 1,
-1.072837, -0.9359335, -2.416438, 1, 0, 0, 1, 1,
-1.05788, 1.124977, -1.795971, 1, 0, 0, 1, 1,
-1.057605, -1.215838, -2.87858, 0, 0, 0, 1, 1,
-1.056401, 0.09987692, -1.753807, 0, 0, 0, 1, 1,
-1.054524, -0.2340823, -2.901749, 0, 0, 0, 1, 1,
-1.049375, -2.217512, -2.764805, 0, 0, 0, 1, 1,
-1.048938, -0.772522, -3.252532, 0, 0, 0, 1, 1,
-1.048361, 0.6135375, 0.8018907, 0, 0, 0, 1, 1,
-1.047456, -1.200142, -2.150204, 0, 0, 0, 1, 1,
-1.042518, -0.4443397, -2.189897, 1, 1, 1, 1, 1,
-1.038329, 1.414087, -0.9148487, 1, 1, 1, 1, 1,
-1.03828, 1.48061, -1.83803, 1, 1, 1, 1, 1,
-1.037439, 0.003296125, -0.3809945, 1, 1, 1, 1, 1,
-1.035743, -1.252284, -2.092656, 1, 1, 1, 1, 1,
-1.028548, -0.6659281, -1.689231, 1, 1, 1, 1, 1,
-1.024258, -0.02877954, 0.6841289, 1, 1, 1, 1, 1,
-1.016215, 0.03064838, -2.553961, 1, 1, 1, 1, 1,
-1.01318, 2.12893, 0.03905879, 1, 1, 1, 1, 1,
-1.005806, 0.2044129, -0.2414721, 1, 1, 1, 1, 1,
-0.9995739, -0.03092284, -1.431201, 1, 1, 1, 1, 1,
-0.995123, -0.5566995, -3.301116, 1, 1, 1, 1, 1,
-0.983425, 1.753921, 0.6543058, 1, 1, 1, 1, 1,
-0.9751968, -1.023958, -2.937932, 1, 1, 1, 1, 1,
-0.9742933, 0.04551606, 0.2147696, 1, 1, 1, 1, 1,
-0.9691093, 0.9296754, -0.4647984, 0, 0, 1, 1, 1,
-0.9684868, 0.3391895, -0.7079704, 1, 0, 0, 1, 1,
-0.9628857, 0.3065462, -0.7177092, 1, 0, 0, 1, 1,
-0.9579796, -1.626481, -1.499537, 1, 0, 0, 1, 1,
-0.9527481, 1.04507, -1.541798, 1, 0, 0, 1, 1,
-0.9519994, 0.01650129, -3.587413, 1, 0, 0, 1, 1,
-0.9491236, 0.2735869, -0.5694389, 0, 0, 0, 1, 1,
-0.9488177, 1.505014, -0.8040116, 0, 0, 0, 1, 1,
-0.9440431, 0.1340444, -1.317541, 0, 0, 0, 1, 1,
-0.9401128, -0.4311796, -2.619375, 0, 0, 0, 1, 1,
-0.9383121, 0.6700743, 0.570241, 0, 0, 0, 1, 1,
-0.9372961, 1.590296, -2.932831, 0, 0, 0, 1, 1,
-0.9363298, 0.524192, -1.969117, 0, 0, 0, 1, 1,
-0.924424, -0.6502426, -2.9702, 1, 1, 1, 1, 1,
-0.9231719, 0.9781217, -0.4138499, 1, 1, 1, 1, 1,
-0.9169952, -2.608724, -2.537084, 1, 1, 1, 1, 1,
-0.91689, 1.171961, -0.9412152, 1, 1, 1, 1, 1,
-0.9167606, -0.6877047, -2.115543, 1, 1, 1, 1, 1,
-0.9159716, 2.31529, 0.8545513, 1, 1, 1, 1, 1,
-0.9100098, 1.097368, -0.2307551, 1, 1, 1, 1, 1,
-0.8966677, 0.3397114, 0.5001984, 1, 1, 1, 1, 1,
-0.8879403, 2.166883, -0.6445405, 1, 1, 1, 1, 1,
-0.8830853, -0.192966, -0.366194, 1, 1, 1, 1, 1,
-0.8786344, -0.2515841, -1.981745, 1, 1, 1, 1, 1,
-0.8765476, -0.5521778, -1.844714, 1, 1, 1, 1, 1,
-0.8738028, 0.0007845133, -1.35729, 1, 1, 1, 1, 1,
-0.8637319, -1.640542, -4.640271, 1, 1, 1, 1, 1,
-0.8608272, 0.3962989, 0.1625927, 1, 1, 1, 1, 1,
-0.8557571, -0.3320906, -0.9178085, 0, 0, 1, 1, 1,
-0.8396876, -0.09299953, -1.352577, 1, 0, 0, 1, 1,
-0.8325878, -0.3040305, -2.330895, 1, 0, 0, 1, 1,
-0.8298979, -0.004400623, -1.855291, 1, 0, 0, 1, 1,
-0.8269768, -0.3536123, -2.465205, 1, 0, 0, 1, 1,
-0.8262197, -1.380365, -2.640322, 1, 0, 0, 1, 1,
-0.8210589, -0.5922353, -2.183889, 0, 0, 0, 1, 1,
-0.8210469, 1.559255, 0.03799024, 0, 0, 0, 1, 1,
-0.8198414, 0.3003097, -0.1876753, 0, 0, 0, 1, 1,
-0.8144779, 0.9492175, -0.1788269, 0, 0, 0, 1, 1,
-0.8019232, 0.3913282, -0.8222244, 0, 0, 0, 1, 1,
-0.8005018, -0.7658882, -1.752184, 0, 0, 0, 1, 1,
-0.7997337, 0.8151069, 0.003399484, 0, 0, 0, 1, 1,
-0.7989504, -0.4585722, -1.360157, 1, 1, 1, 1, 1,
-0.7969383, 0.9282209, 0.5535495, 1, 1, 1, 1, 1,
-0.7929573, -1.654081, -4.063073, 1, 1, 1, 1, 1,
-0.7881628, 0.9054777, -0.129577, 1, 1, 1, 1, 1,
-0.7868714, -0.3777754, -2.447214, 1, 1, 1, 1, 1,
-0.7859294, 0.5419881, -1.270041, 1, 1, 1, 1, 1,
-0.7834865, -1.731771, -3.087102, 1, 1, 1, 1, 1,
-0.7786036, 0.3304445, -2.043533, 1, 1, 1, 1, 1,
-0.7732784, -0.04277034, -1.074377, 1, 1, 1, 1, 1,
-0.7706657, 1.001179, -2.289145, 1, 1, 1, 1, 1,
-0.7674878, 0.3608488, -1.385133, 1, 1, 1, 1, 1,
-0.762973, -1.242276, -1.984371, 1, 1, 1, 1, 1,
-0.7580445, -1.22561, -3.914208, 1, 1, 1, 1, 1,
-0.7552426, -0.02462347, 0.4448013, 1, 1, 1, 1, 1,
-0.7521499, -0.3551955, -2.587296, 1, 1, 1, 1, 1,
-0.7312655, 0.2552513, -0.277023, 0, 0, 1, 1, 1,
-0.728911, 0.5366288, -0.6123575, 1, 0, 0, 1, 1,
-0.7234234, -2.358548, -4.048126, 1, 0, 0, 1, 1,
-0.714733, 1.20946, -0.2614766, 1, 0, 0, 1, 1,
-0.7140327, 0.4075841, -3.042701, 1, 0, 0, 1, 1,
-0.708443, -0.5417343, -2.993192, 1, 0, 0, 1, 1,
-0.7049787, 1.361383, 0.08121016, 0, 0, 0, 1, 1,
-0.7032656, -2.152247, -1.504324, 0, 0, 0, 1, 1,
-0.7030513, 0.3887666, -4.236815, 0, 0, 0, 1, 1,
-0.6991586, 0.2762711, 0.4961641, 0, 0, 0, 1, 1,
-0.6972682, 1.259797, -0.4496581, 0, 0, 0, 1, 1,
-0.6746629, 1.093141, -2.581789, 0, 0, 0, 1, 1,
-0.6716487, -2.087093, -2.551406, 0, 0, 0, 1, 1,
-0.6676592, -1.87159, -3.398161, 1, 1, 1, 1, 1,
-0.6655609, 0.5788583, -0.8532223, 1, 1, 1, 1, 1,
-0.6645496, -0.02733285, -2.11443, 1, 1, 1, 1, 1,
-0.6631555, -1.028394, -2.656509, 1, 1, 1, 1, 1,
-0.6621352, -0.7352923, -3.029958, 1, 1, 1, 1, 1,
-0.6612434, -1.296081, -3.029475, 1, 1, 1, 1, 1,
-0.6569982, -0.1586542, -2.505394, 1, 1, 1, 1, 1,
-0.6493743, 0.05630475, 1.04469, 1, 1, 1, 1, 1,
-0.647795, -1.092853, -3.798439, 1, 1, 1, 1, 1,
-0.6470122, -2.385596, -3.095163, 1, 1, 1, 1, 1,
-0.6455219, -0.329422, -2.589191, 1, 1, 1, 1, 1,
-0.6450944, -0.1803855, -1.456563, 1, 1, 1, 1, 1,
-0.6426113, -0.680329, -3.313148, 1, 1, 1, 1, 1,
-0.6414858, -0.1979716, -1.3606, 1, 1, 1, 1, 1,
-0.6404328, 0.4010638, 0.877923, 1, 1, 1, 1, 1,
-0.6386216, 0.85238, -1.558986, 0, 0, 1, 1, 1,
-0.633859, -0.2444488, -2.12983, 1, 0, 0, 1, 1,
-0.6310664, 1.335736, -0.8452964, 1, 0, 0, 1, 1,
-0.6297273, -0.8369026, -3.715431, 1, 0, 0, 1, 1,
-0.6286554, -0.1722123, 0.02992751, 1, 0, 0, 1, 1,
-0.6266395, -2.707469, -3.226779, 1, 0, 0, 1, 1,
-0.6262235, -1.520154, -1.647152, 0, 0, 0, 1, 1,
-0.6235552, -1.015481, -4.775032, 0, 0, 0, 1, 1,
-0.6144505, 1.053206, -1.031261, 0, 0, 0, 1, 1,
-0.611403, -1.171784, -3.028434, 0, 0, 0, 1, 1,
-0.6108195, 1.522099, -0.2818038, 0, 0, 0, 1, 1,
-0.5990286, -0.6053134, -3.538083, 0, 0, 0, 1, 1,
-0.5972255, -1.765732, -5.37289, 0, 0, 0, 1, 1,
-0.5967759, 1.394603, 0.3906777, 1, 1, 1, 1, 1,
-0.5964124, -0.7850477, -3.887183, 1, 1, 1, 1, 1,
-0.5943696, 0.6042179, 0.971413, 1, 1, 1, 1, 1,
-0.5942915, 0.1217337, -0.3204219, 1, 1, 1, 1, 1,
-0.5931931, 0.2496086, -1.491197, 1, 1, 1, 1, 1,
-0.5918631, -0.9349351, -2.813334, 1, 1, 1, 1, 1,
-0.582553, 0.1592631, -1.906772, 1, 1, 1, 1, 1,
-0.5794444, 0.06794982, 0.7842965, 1, 1, 1, 1, 1,
-0.5786557, -1.374992, -2.722079, 1, 1, 1, 1, 1,
-0.5707304, -1.594721, -2.962407, 1, 1, 1, 1, 1,
-0.5613211, 0.800647, -0.518855, 1, 1, 1, 1, 1,
-0.5584568, -1.340141, -0.530543, 1, 1, 1, 1, 1,
-0.555681, -0.05568957, -2.437008, 1, 1, 1, 1, 1,
-0.5521624, -1.265692, -3.413669, 1, 1, 1, 1, 1,
-0.5518743, 1.190229, -0.1044164, 1, 1, 1, 1, 1,
-0.5493792, -0.4850251, -3.036177, 0, 0, 1, 1, 1,
-0.5404438, -0.2748817, 0.1138232, 1, 0, 0, 1, 1,
-0.5374094, -1.277239, -3.674489, 1, 0, 0, 1, 1,
-0.5360599, -0.3258725, -0.4390663, 1, 0, 0, 1, 1,
-0.535822, 1.516127, 0.566411, 1, 0, 0, 1, 1,
-0.5311369, 0.1602516, -3.344602, 1, 0, 0, 1, 1,
-0.5299979, 0.7726664, -1.04436, 0, 0, 0, 1, 1,
-0.5293714, -0.09940398, -1.869897, 0, 0, 0, 1, 1,
-0.5286605, -0.4230177, -2.709818, 0, 0, 0, 1, 1,
-0.5283442, 1.835599, -0.7497302, 0, 0, 0, 1, 1,
-0.527236, 0.6899789, -0.07876661, 0, 0, 0, 1, 1,
-0.5244208, -0.9972378, -3.106201, 0, 0, 0, 1, 1,
-0.5231032, 0.4401024, -1.302046, 0, 0, 0, 1, 1,
-0.5217933, 0.4704337, -2.308215, 1, 1, 1, 1, 1,
-0.5182503, 0.003474651, -1.364258, 1, 1, 1, 1, 1,
-0.5173385, -1.64251, -2.916658, 1, 1, 1, 1, 1,
-0.5159987, -0.6216236, -3.481019, 1, 1, 1, 1, 1,
-0.5149567, 0.6049054, 0.8783312, 1, 1, 1, 1, 1,
-0.5121278, 1.280798, -1.019341, 1, 1, 1, 1, 1,
-0.5106266, -1.249846, -2.336577, 1, 1, 1, 1, 1,
-0.5100693, -0.136083, -0.4235663, 1, 1, 1, 1, 1,
-0.5096779, -0.3924581, -2.184831, 1, 1, 1, 1, 1,
-0.5067422, -1.698334, -2.875053, 1, 1, 1, 1, 1,
-0.5063709, -0.3302268, -0.8358563, 1, 1, 1, 1, 1,
-0.5033288, 1.527042, 0.06664634, 1, 1, 1, 1, 1,
-0.4968651, 0.6702791, 1.117287, 1, 1, 1, 1, 1,
-0.4899721, -0.163872, -0.1912289, 1, 1, 1, 1, 1,
-0.4820778, -0.09138428, -0.4403384, 1, 1, 1, 1, 1,
-0.4808717, -2.070668, -2.388126, 0, 0, 1, 1, 1,
-0.4778195, -0.2813474, -3.345279, 1, 0, 0, 1, 1,
-0.4758242, -0.0403069, -2.334225, 1, 0, 0, 1, 1,
-0.4737341, 0.7048206, -0.5136262, 1, 0, 0, 1, 1,
-0.4735729, -0.6572984, -2.062353, 1, 0, 0, 1, 1,
-0.4724427, 0.09354084, -0.4915255, 1, 0, 0, 1, 1,
-0.4667406, 0.4021206, -1.437188, 0, 0, 0, 1, 1,
-0.4582986, 0.8539584, -1.460995, 0, 0, 0, 1, 1,
-0.4530563, -0.655139, -1.914867, 0, 0, 0, 1, 1,
-0.4509856, -0.7820216, -3.107539, 0, 0, 0, 1, 1,
-0.4463834, -0.3591914, -3.120598, 0, 0, 0, 1, 1,
-0.4445775, -1.073304, -1.471222, 0, 0, 0, 1, 1,
-0.4424126, 1.00667, 1.260885, 0, 0, 0, 1, 1,
-0.4423606, 2.034306, 0.5219669, 1, 1, 1, 1, 1,
-0.4381992, 1.672558, 0.1542759, 1, 1, 1, 1, 1,
-0.4309891, 0.2028318, -2.095117, 1, 1, 1, 1, 1,
-0.4224342, 0.04424673, -1.250399, 1, 1, 1, 1, 1,
-0.4216337, -0.0108137, -1.115137, 1, 1, 1, 1, 1,
-0.4166382, 0.4525263, -0.7623816, 1, 1, 1, 1, 1,
-0.4149855, -1.358483, -1.757385, 1, 1, 1, 1, 1,
-0.4131737, -0.5774406, -1.049588, 1, 1, 1, 1, 1,
-0.4072636, -0.3893446, -5.120511, 1, 1, 1, 1, 1,
-0.406595, 0.2547103, -1.223441, 1, 1, 1, 1, 1,
-0.4045549, 1.682183, 0.4060961, 1, 1, 1, 1, 1,
-0.403834, 1.198542, 1.207066, 1, 1, 1, 1, 1,
-0.3983039, 0.3100848, 0.7897289, 1, 1, 1, 1, 1,
-0.3942208, -0.02222487, -0.6800436, 1, 1, 1, 1, 1,
-0.3936508, -2.642634, -3.647463, 1, 1, 1, 1, 1,
-0.3865849, 0.8004666, -0.3153782, 0, 0, 1, 1, 1,
-0.3836286, 0.522911, -1.369776, 1, 0, 0, 1, 1,
-0.3824855, 0.1803219, -2.974417, 1, 0, 0, 1, 1,
-0.3802217, -1.131849, -3.688042, 1, 0, 0, 1, 1,
-0.3722764, 0.771346, 0.5506436, 1, 0, 0, 1, 1,
-0.3712045, -1.458306, -4.688012, 1, 0, 0, 1, 1,
-0.3676128, 0.02109746, -1.770424, 0, 0, 0, 1, 1,
-0.3671284, 0.2582474, -1.754611, 0, 0, 0, 1, 1,
-0.3591259, 0.8192618, -1.030462, 0, 0, 0, 1, 1,
-0.3571273, -0.3592979, -2.245371, 0, 0, 0, 1, 1,
-0.3560248, 1.965052, 0.1875199, 0, 0, 0, 1, 1,
-0.3559333, -0.4490751, -2.712574, 0, 0, 0, 1, 1,
-0.3550944, 2.257353, 0.9864733, 0, 0, 0, 1, 1,
-0.3542894, 0.7374821, -0.3183409, 1, 1, 1, 1, 1,
-0.3516535, -1.803419, -4.787721, 1, 1, 1, 1, 1,
-0.3509211, -0.5692611, -2.783508, 1, 1, 1, 1, 1,
-0.3475662, -0.03957944, -1.114947, 1, 1, 1, 1, 1,
-0.3465776, 0.6686286, -0.1071617, 1, 1, 1, 1, 1,
-0.3459699, 0.05533757, -1.538681, 1, 1, 1, 1, 1,
-0.3451103, 1.459223, 0.314209, 1, 1, 1, 1, 1,
-0.3421493, -1.720983, -2.621992, 1, 1, 1, 1, 1,
-0.3417171, -0.07698844, -3.027331, 1, 1, 1, 1, 1,
-0.34083, -0.01748143, -1.866882, 1, 1, 1, 1, 1,
-0.3393152, -0.3102604, -1.074994, 1, 1, 1, 1, 1,
-0.3344402, -0.5663085, -3.87554, 1, 1, 1, 1, 1,
-0.3230627, -0.1331225, -2.047323, 1, 1, 1, 1, 1,
-0.3228814, 0.8360646, -0.7221611, 1, 1, 1, 1, 1,
-0.3192637, 0.6096205, -1.449805, 1, 1, 1, 1, 1,
-0.3169124, 0.29967, -0.7831036, 0, 0, 1, 1, 1,
-0.3137096, 0.8339026, -0.05442316, 1, 0, 0, 1, 1,
-0.3101971, -1.545668, -3.479074, 1, 0, 0, 1, 1,
-0.3091365, -1.183918, -2.202088, 1, 0, 0, 1, 1,
-0.3073269, 0.9099927, 0.1740086, 1, 0, 0, 1, 1,
-0.3041733, 0.8323374, -0.4977538, 1, 0, 0, 1, 1,
-0.3019342, 0.820052, 0.3206636, 0, 0, 0, 1, 1,
-0.3013929, 0.04163215, -0.6200502, 0, 0, 0, 1, 1,
-0.3012741, -0.216791, -2.583962, 0, 0, 0, 1, 1,
-0.3003408, -0.1857088, -2.366418, 0, 0, 0, 1, 1,
-0.2987514, -0.2596926, -1.253018, 0, 0, 0, 1, 1,
-0.2976414, 1.573963, 0.605474, 0, 0, 0, 1, 1,
-0.2971928, -0.3821216, -2.053502, 0, 0, 0, 1, 1,
-0.2942731, -0.5112197, 0.1862612, 1, 1, 1, 1, 1,
-0.2920464, 0.2462876, -0.9749083, 1, 1, 1, 1, 1,
-0.2900512, 0.04880694, -0.7645373, 1, 1, 1, 1, 1,
-0.289393, -0.7464761, -0.8870526, 1, 1, 1, 1, 1,
-0.2893687, 0.1843124, -0.5412731, 1, 1, 1, 1, 1,
-0.2884074, -1.04763, -3.536949, 1, 1, 1, 1, 1,
-0.2876564, 0.3460492, -1.068025, 1, 1, 1, 1, 1,
-0.2865447, -0.4926663, -4.281098, 1, 1, 1, 1, 1,
-0.2859658, 0.5863891, -0.03962397, 1, 1, 1, 1, 1,
-0.2840789, -0.9591453, -4.064336, 1, 1, 1, 1, 1,
-0.2806671, -0.8421445, -3.235852, 1, 1, 1, 1, 1,
-0.2777678, -0.9177508, -3.132291, 1, 1, 1, 1, 1,
-0.2774083, 0.9842316, -0.6385372, 1, 1, 1, 1, 1,
-0.2760903, -1.178855, -4.405061, 1, 1, 1, 1, 1,
-0.2739803, -1.54673, -4.405305, 1, 1, 1, 1, 1,
-0.2712821, 0.6404601, -0.05839438, 0, 0, 1, 1, 1,
-0.2705787, 0.3405392, -0.8761038, 1, 0, 0, 1, 1,
-0.2656603, -1.006081, -2.447915, 1, 0, 0, 1, 1,
-0.2634363, 0.002729836, -2.450218, 1, 0, 0, 1, 1,
-0.2626638, -0.9005274, -4.221799, 1, 0, 0, 1, 1,
-0.2616319, -1.261384, -3.281106, 1, 0, 0, 1, 1,
-0.2604291, 0.6982582, -0.7939053, 0, 0, 0, 1, 1,
-0.2541499, -0.7256574, -4.694946, 0, 0, 0, 1, 1,
-0.253747, 1.62033, -0.6556334, 0, 0, 0, 1, 1,
-0.2521552, -0.7824783, -3.942131, 0, 0, 0, 1, 1,
-0.2520825, 1.14994, -0.9923611, 0, 0, 0, 1, 1,
-0.2466426, -0.5940213, -3.305367, 0, 0, 0, 1, 1,
-0.2440079, -0.6271816, -1.303509, 0, 0, 0, 1, 1,
-0.2375886, 1.105631, -1.614851, 1, 1, 1, 1, 1,
-0.2364694, -0.4337332, -0.8475485, 1, 1, 1, 1, 1,
-0.2324473, 0.4718306, -0.1620827, 1, 1, 1, 1, 1,
-0.230529, -2.271304, -3.219449, 1, 1, 1, 1, 1,
-0.2288064, -0.562692, -2.2269, 1, 1, 1, 1, 1,
-0.2244689, -0.6195447, -1.967965, 1, 1, 1, 1, 1,
-0.218593, 0.01069592, -2.165946, 1, 1, 1, 1, 1,
-0.2166271, 0.3835097, -1.187144, 1, 1, 1, 1, 1,
-0.2142075, 0.1076348, -0.4611911, 1, 1, 1, 1, 1,
-0.2108068, -0.6814694, -3.306886, 1, 1, 1, 1, 1,
-0.2093299, -0.5759798, -2.937179, 1, 1, 1, 1, 1,
-0.1926596, 0.02321934, -0.2043766, 1, 1, 1, 1, 1,
-0.190278, 0.05587511, -1.355101, 1, 1, 1, 1, 1,
-0.1882862, 1.00291, 0.6898358, 1, 1, 1, 1, 1,
-0.1881514, -0.8352411, -4.129406, 1, 1, 1, 1, 1,
-0.1875739, -1.31822, -2.616079, 0, 0, 1, 1, 1,
-0.1839803, -1.098515, -2.679951, 1, 0, 0, 1, 1,
-0.183791, -0.216004, -3.121316, 1, 0, 0, 1, 1,
-0.1785996, 0.06266173, -0.6940663, 1, 0, 0, 1, 1,
-0.1747679, 0.1263893, -1.215623, 1, 0, 0, 1, 1,
-0.1743371, -1.305138, -2.497248, 1, 0, 0, 1, 1,
-0.1731423, -1.051367, -2.702613, 0, 0, 0, 1, 1,
-0.1696995, 1.094412, -1.044583, 0, 0, 0, 1, 1,
-0.1692592, 1.492315, -1.13622, 0, 0, 0, 1, 1,
-0.1639819, -0.119511, -3.644148, 0, 0, 0, 1, 1,
-0.1634571, 0.8603571, 0.5263528, 0, 0, 0, 1, 1,
-0.1631988, -1.109503, -3.842107, 0, 0, 0, 1, 1,
-0.1619609, -0.7674134, -4.865854, 0, 0, 0, 1, 1,
-0.1593346, 0.09332979, -1.257377, 1, 1, 1, 1, 1,
-0.1581119, 0.9734267, 0.5833647, 1, 1, 1, 1, 1,
-0.1558297, -0.8004897, -4.146433, 1, 1, 1, 1, 1,
-0.1546843, -0.3060486, -2.562307, 1, 1, 1, 1, 1,
-0.1496814, -1.213243, -3.449239, 1, 1, 1, 1, 1,
-0.1474717, 0.9450362, -0.1208052, 1, 1, 1, 1, 1,
-0.1450747, -0.225835, -3.171188, 1, 1, 1, 1, 1,
-0.1439784, 0.9518917, -0.2626678, 1, 1, 1, 1, 1,
-0.1433422, -0.1136164, -1.979217, 1, 1, 1, 1, 1,
-0.1427932, 0.7829815, 0.8078568, 1, 1, 1, 1, 1,
-0.1419289, -1.024034, -3.863072, 1, 1, 1, 1, 1,
-0.1409407, 0.06429289, 0.2482915, 1, 1, 1, 1, 1,
-0.140226, 2.428658, -1.206392, 1, 1, 1, 1, 1,
-0.1351727, 1.617824, -1.283781, 1, 1, 1, 1, 1,
-0.134432, 1.270734, 0.1076728, 1, 1, 1, 1, 1,
-0.1323502, -0.3694819, -4.14696, 0, 0, 1, 1, 1,
-0.1289798, -3.015619, -4.795334, 1, 0, 0, 1, 1,
-0.1236857, -0.9247848, -3.120293, 1, 0, 0, 1, 1,
-0.1231496, -0.8589342, -3.045572, 1, 0, 0, 1, 1,
-0.1223167, -0.2276409, -1.711347, 1, 0, 0, 1, 1,
-0.1177198, 0.7361439, -1.040359, 1, 0, 0, 1, 1,
-0.114424, -2.425924, -3.426118, 0, 0, 0, 1, 1,
-0.1087554, -1.121086, -3.459466, 0, 0, 0, 1, 1,
-0.1016398, -0.5890934, -3.883174, 0, 0, 0, 1, 1,
-0.0979665, -1.32126, -3.221489, 0, 0, 0, 1, 1,
-0.09794997, -2.738889, -3.634389, 0, 0, 0, 1, 1,
-0.09628254, 1.508609, -0.1450251, 0, 0, 0, 1, 1,
-0.09555922, 1.681647, -0.7493253, 0, 0, 0, 1, 1,
-0.0904451, 1.343275, 0.3852674, 1, 1, 1, 1, 1,
-0.08135083, -1.339619, -2.706625, 1, 1, 1, 1, 1,
-0.07752772, -0.06117551, -2.506139, 1, 1, 1, 1, 1,
-0.07614147, 0.5008664, -0.2130241, 1, 1, 1, 1, 1,
-0.07110938, -0.4514465, -1.057016, 1, 1, 1, 1, 1,
-0.06969817, 0.9447898, -1.968507, 1, 1, 1, 1, 1,
-0.06671792, -0.5454458, -3.871826, 1, 1, 1, 1, 1,
-0.06446968, 0.5152643, -0.09078947, 1, 1, 1, 1, 1,
-0.06150671, -0.4341407, -4.080312, 1, 1, 1, 1, 1,
-0.05695074, -1.072478, -2.564997, 1, 1, 1, 1, 1,
-0.03956033, -1.391786, -1.036462, 1, 1, 1, 1, 1,
-0.03938086, -1.24689, -0.9118295, 1, 1, 1, 1, 1,
-0.03850614, -1.401099, -3.037895, 1, 1, 1, 1, 1,
-0.03357283, -0.4131573, -3.071721, 1, 1, 1, 1, 1,
-0.03218832, -0.1012296, -2.535897, 1, 1, 1, 1, 1,
-0.03191644, 0.03716188, -0.04828798, 0, 0, 1, 1, 1,
-0.03142905, 0.426139, 0.6186103, 1, 0, 0, 1, 1,
-0.03014542, 0.937452, -0.5328834, 1, 0, 0, 1, 1,
-0.02528731, 1.573873, 1.215811, 1, 0, 0, 1, 1,
-0.02133081, 1.712059, 1.404088, 1, 0, 0, 1, 1,
-0.01723741, 0.003924652, 0.2274429, 1, 0, 0, 1, 1,
-0.01718752, -0.2687399, -3.675433, 0, 0, 0, 1, 1,
-0.01715656, -1.558449, -5.468059, 0, 0, 0, 1, 1,
-0.01672739, -0.7344804, -3.288017, 0, 0, 0, 1, 1,
-0.01574984, 0.6039342, 0.4875026, 0, 0, 0, 1, 1,
-0.01275295, -1.108406, -3.150182, 0, 0, 0, 1, 1,
-0.01269535, -0.1523178, -3.194931, 0, 0, 0, 1, 1,
-0.01204618, 1.543495, 0.1633659, 0, 0, 0, 1, 1,
-0.01032456, 0.1335403, 1.343217, 1, 1, 1, 1, 1,
-0.008499952, 1.079714, 0.4456505, 1, 1, 1, 1, 1,
-0.007747261, -0.9702661, -3.303536, 1, 1, 1, 1, 1,
-0.005922388, -1.328631, -3.657703, 1, 1, 1, 1, 1,
-0.005847359, 0.3277774, -0.9760175, 1, 1, 1, 1, 1,
-0.001595861, -0.5647027, -2.280878, 1, 1, 1, 1, 1,
-0.001331216, 0.709817, -0.9775354, 1, 1, 1, 1, 1,
0.005295994, -1.582391, 3.330208, 1, 1, 1, 1, 1,
0.01088274, 1.276758, -3.055787, 1, 1, 1, 1, 1,
0.01795066, 0.2822561, -0.09081983, 1, 1, 1, 1, 1,
0.0218228, 0.8773216, 1.142326, 1, 1, 1, 1, 1,
0.02725565, 0.6395035, 0.7793963, 1, 1, 1, 1, 1,
0.05024783, -1.002572, 4.018958, 1, 1, 1, 1, 1,
0.05510145, 0.2313519, -0.1797671, 1, 1, 1, 1, 1,
0.05658586, -1.399091, 2.254135, 1, 1, 1, 1, 1,
0.0579274, 0.4755311, -0.1662331, 0, 0, 1, 1, 1,
0.05931704, 1.853408, 2.962366, 1, 0, 0, 1, 1,
0.06308232, -0.1252998, 3.301817, 1, 0, 0, 1, 1,
0.06427426, -0.03112371, 2.41767, 1, 0, 0, 1, 1,
0.0644979, -0.3141607, 5.03873, 1, 0, 0, 1, 1,
0.06619357, -1.428472, 2.994059, 1, 0, 0, 1, 1,
0.06929502, 0.6120402, -1.08855, 0, 0, 0, 1, 1,
0.07515907, 0.8292019, -0.3625997, 0, 0, 0, 1, 1,
0.07592283, 0.4281491, -0.01624051, 0, 0, 0, 1, 1,
0.0781633, -1.453156, 2.217806, 0, 0, 0, 1, 1,
0.07850153, 0.9904965, 1.121299, 0, 0, 0, 1, 1,
0.07997877, 0.505316, 0.5126661, 0, 0, 0, 1, 1,
0.08170521, 0.9339765, -0.429894, 0, 0, 0, 1, 1,
0.08323862, 0.9363839, 1.259556, 1, 1, 1, 1, 1,
0.08365044, -0.283668, 2.900681, 1, 1, 1, 1, 1,
0.09118597, 0.727601, 0.6072975, 1, 1, 1, 1, 1,
0.09557519, -1.049852, 2.482871, 1, 1, 1, 1, 1,
0.09852795, 0.4057249, 1.120644, 1, 1, 1, 1, 1,
0.09982096, 0.991794, -0.7708097, 1, 1, 1, 1, 1,
0.1015546, 0.8102837, 0.9766836, 1, 1, 1, 1, 1,
0.1042624, -0.1748175, 1.353048, 1, 1, 1, 1, 1,
0.1068586, 0.1858817, 2.651865, 1, 1, 1, 1, 1,
0.1087804, -0.8371556, 3.517263, 1, 1, 1, 1, 1,
0.1121909, -0.01581893, 0.3855328, 1, 1, 1, 1, 1,
0.1152088, -1.324041, 2.560973, 1, 1, 1, 1, 1,
0.1155333, -1.190645, 2.459108, 1, 1, 1, 1, 1,
0.1172174, -0.1403455, 1.975473, 1, 1, 1, 1, 1,
0.1191726, 0.3023495, 1.429921, 1, 1, 1, 1, 1,
0.1219415, 1.317867, -0.4729783, 0, 0, 1, 1, 1,
0.1235336, -0.089756, 2.3543, 1, 0, 0, 1, 1,
0.1248244, -0.09488006, 2.093233, 1, 0, 0, 1, 1,
0.1294295, 0.1417315, 0.4160927, 1, 0, 0, 1, 1,
0.1310603, 1.728851, -0.8631366, 1, 0, 0, 1, 1,
0.1311359, 0.01623756, -0.2208663, 1, 0, 0, 1, 1,
0.135061, 0.03161629, 0.5912217, 0, 0, 0, 1, 1,
0.1367, 0.03518439, 1.461621, 0, 0, 0, 1, 1,
0.1377406, 1.416783, 1.225642, 0, 0, 0, 1, 1,
0.1413386, 0.2456541, 0.9339785, 0, 0, 0, 1, 1,
0.1456548, -0.5085949, 3.276572, 0, 0, 0, 1, 1,
0.1465197, 1.109741, 1.575754, 0, 0, 0, 1, 1,
0.1485483, 0.01521457, 2.152609, 0, 0, 0, 1, 1,
0.1497618, -0.6243191, -0.2600989, 1, 1, 1, 1, 1,
0.152057, -0.3624848, 2.07507, 1, 1, 1, 1, 1,
0.1588421, 1.225436, -0.3528298, 1, 1, 1, 1, 1,
0.1596828, -0.1046608, 3.369953, 1, 1, 1, 1, 1,
0.1643105, 0.4779082, 0.7137549, 1, 1, 1, 1, 1,
0.166489, 0.863448, -0.8813582, 1, 1, 1, 1, 1,
0.1681291, -0.5388872, 2.239266, 1, 1, 1, 1, 1,
0.1687457, 0.7732404, 0.612016, 1, 1, 1, 1, 1,
0.1694847, 1.332726, -0.8677472, 1, 1, 1, 1, 1,
0.1703443, 1.376724, 0.001322049, 1, 1, 1, 1, 1,
0.1736792, 1.059691, -0.6948012, 1, 1, 1, 1, 1,
0.1775848, -0.1532521, 3.383449, 1, 1, 1, 1, 1,
0.187366, -0.6075394, 3.314379, 1, 1, 1, 1, 1,
0.1925324, -0.5919862, 2.706815, 1, 1, 1, 1, 1,
0.1959599, -1.521958, 4.034766, 1, 1, 1, 1, 1,
0.199057, 0.3272913, -0.5708435, 0, 0, 1, 1, 1,
0.1990857, 0.1567876, 2.411596, 1, 0, 0, 1, 1,
0.2009993, 0.8885759, -0.676157, 1, 0, 0, 1, 1,
0.2018219, 1.112405, -0.5606, 1, 0, 0, 1, 1,
0.2031712, 1.135021, 1.351525, 1, 0, 0, 1, 1,
0.2046384, 1.093482, 0.7689251, 1, 0, 0, 1, 1,
0.2118373, -0.6730191, 2.924253, 0, 0, 0, 1, 1,
0.2174034, -1.074996, 3.817866, 0, 0, 0, 1, 1,
0.2274227, 0.900005, -0.3384248, 0, 0, 0, 1, 1,
0.228167, 0.08984859, -0.3836256, 0, 0, 0, 1, 1,
0.2317319, -1.492066, 3.189109, 0, 0, 0, 1, 1,
0.2418802, 0.2220759, 1.161338, 0, 0, 0, 1, 1,
0.2441137, 0.2717843, 0.6924194, 0, 0, 0, 1, 1,
0.2445192, -2.375725, 2.380066, 1, 1, 1, 1, 1,
0.2489728, 1.37601, -0.3955538, 1, 1, 1, 1, 1,
0.2527735, 0.9303917, -2.532571, 1, 1, 1, 1, 1,
0.2660715, 1.02867, -0.9265754, 1, 1, 1, 1, 1,
0.2705539, -1.546847, 3.766767, 1, 1, 1, 1, 1,
0.2720039, -0.2359541, 2.973834, 1, 1, 1, 1, 1,
0.2781067, -0.5598128, 1.857957, 1, 1, 1, 1, 1,
0.2797964, 2.031955, 1.899955, 1, 1, 1, 1, 1,
0.2824686, 0.7767685, -0.4638555, 1, 1, 1, 1, 1,
0.2827184, 0.1975044, -0.3122141, 1, 1, 1, 1, 1,
0.2854433, 1.804109, 0.4151369, 1, 1, 1, 1, 1,
0.2858197, 1.095898, -1.513327, 1, 1, 1, 1, 1,
0.2869341, 0.914663, -0.1895835, 1, 1, 1, 1, 1,
0.2881702, 0.5619983, 1.177631, 1, 1, 1, 1, 1,
0.2905911, 0.3542149, -0.559257, 1, 1, 1, 1, 1,
0.2921952, 0.2086151, 0.4379119, 0, 0, 1, 1, 1,
0.2933624, -0.4614496, 2.865636, 1, 0, 0, 1, 1,
0.2946917, 0.7735901, -0.5543382, 1, 0, 0, 1, 1,
0.2986337, -1.063675, 3.570635, 1, 0, 0, 1, 1,
0.30147, -1.162075, 4.368638, 1, 0, 0, 1, 1,
0.3028421, -0.943853, 3.352288, 1, 0, 0, 1, 1,
0.3028486, -2.55215, 4.498578, 0, 0, 0, 1, 1,
0.3049269, -0.702363, 3.256225, 0, 0, 0, 1, 1,
0.3082729, 0.3406294, 1.015333, 0, 0, 0, 1, 1,
0.3102693, -0.8527004, 3.872937, 0, 0, 0, 1, 1,
0.3189011, 0.4566402, -0.4570625, 0, 0, 0, 1, 1,
0.3206522, -1.504507, 2.103593, 0, 0, 0, 1, 1,
0.321384, -0.9600661, 3.121222, 0, 0, 0, 1, 1,
0.3227057, 0.5267058, 1.146979, 1, 1, 1, 1, 1,
0.3228919, -1.573178, 5.129948, 1, 1, 1, 1, 1,
0.3302907, 0.3998882, 0.6297081, 1, 1, 1, 1, 1,
0.3335346, 0.3013334, 0.5656837, 1, 1, 1, 1, 1,
0.3384163, 0.9672626, 0.08152684, 1, 1, 1, 1, 1,
0.3418543, 0.2217746, 2.83876, 1, 1, 1, 1, 1,
0.344528, 1.139595, -0.03091808, 1, 1, 1, 1, 1,
0.3545935, -0.5551082, 1.321455, 1, 1, 1, 1, 1,
0.3552868, 0.07036158, 2.733855, 1, 1, 1, 1, 1,
0.3564164, 0.9827924, 0.6792055, 1, 1, 1, 1, 1,
0.3569291, -0.9632823, 2.182682, 1, 1, 1, 1, 1,
0.3603303, -1.509766, 3.612375, 1, 1, 1, 1, 1,
0.3603928, -0.3942798, 3.975105, 1, 1, 1, 1, 1,
0.3637009, -0.9967326, 2.301532, 1, 1, 1, 1, 1,
0.3688146, 1.638045, 0.1966421, 1, 1, 1, 1, 1,
0.3691549, -1.14321, 2.401961, 0, 0, 1, 1, 1,
0.3692527, -0.3146214, 2.435189, 1, 0, 0, 1, 1,
0.3710823, -0.04842292, 1.388333, 1, 0, 0, 1, 1,
0.3728577, -0.2517933, 0.6822672, 1, 0, 0, 1, 1,
0.3740459, 0.05784541, 0.7777201, 1, 0, 0, 1, 1,
0.3747101, 0.2352292, -0.3499939, 1, 0, 0, 1, 1,
0.3785618, 0.3448144, -0.4480622, 0, 0, 0, 1, 1,
0.3852064, 0.5280952, 2.94548, 0, 0, 0, 1, 1,
0.3876007, -0.8173621, 2.51678, 0, 0, 0, 1, 1,
0.3900447, 0.2809898, 0.9139605, 0, 0, 0, 1, 1,
0.3930555, 1.350529, -0.2970143, 0, 0, 0, 1, 1,
0.3940191, 0.5914975, 0.4103249, 0, 0, 0, 1, 1,
0.400176, -0.4392912, 2.976342, 0, 0, 0, 1, 1,
0.4021693, 0.365216, 1.383412, 1, 1, 1, 1, 1,
0.4058028, -1.024505, 4.379106, 1, 1, 1, 1, 1,
0.4068427, 0.2328005, 0.8826951, 1, 1, 1, 1, 1,
0.4078936, 1.151748, 0.8725437, 1, 1, 1, 1, 1,
0.4081058, 1.246355, -1.739985, 1, 1, 1, 1, 1,
0.4089455, -1.582164, 3.798015, 1, 1, 1, 1, 1,
0.4098798, 0.1959829, 0.2446877, 1, 1, 1, 1, 1,
0.4127614, -0.3041966, 2.814193, 1, 1, 1, 1, 1,
0.4169528, -0.1845659, 0.2932762, 1, 1, 1, 1, 1,
0.4176067, 0.6749392, 0.06362647, 1, 1, 1, 1, 1,
0.419014, -0.5249352, 2.031122, 1, 1, 1, 1, 1,
0.4198946, 0.8556067, 0.8479599, 1, 1, 1, 1, 1,
0.4241942, 1.022346, 0.6921247, 1, 1, 1, 1, 1,
0.4250015, -0.797847, 3.391864, 1, 1, 1, 1, 1,
0.4275172, 0.3413885, 0.5244709, 1, 1, 1, 1, 1,
0.4275787, 0.6788903, 0.7708983, 0, 0, 1, 1, 1,
0.4300129, 0.2458952, 2.140552, 1, 0, 0, 1, 1,
0.4371642, -1.092176, 1.111119, 1, 0, 0, 1, 1,
0.4383651, -0.07489063, 2.842005, 1, 0, 0, 1, 1,
0.4396794, 0.03453143, 1.509314, 1, 0, 0, 1, 1,
0.4417093, -0.9563631, 3.365801, 1, 0, 0, 1, 1,
0.4436498, 0.4617065, 0.7189944, 0, 0, 0, 1, 1,
0.4457631, -0.6453637, 3.432046, 0, 0, 0, 1, 1,
0.446511, 0.9206456, -1.48216, 0, 0, 0, 1, 1,
0.4465684, -0.00145629, 1.280785, 0, 0, 0, 1, 1,
0.4488823, -0.294631, 3.144293, 0, 0, 0, 1, 1,
0.4557837, 0.7355229, 0.5389709, 0, 0, 0, 1, 1,
0.4567916, 0.05952592, -0.7982664, 0, 0, 0, 1, 1,
0.4595292, 1.984086, -1.438136, 1, 1, 1, 1, 1,
0.4627819, -0.2692434, 0.3053955, 1, 1, 1, 1, 1,
0.4766465, -0.444214, 1.821954, 1, 1, 1, 1, 1,
0.4785331, -0.5242934, 2.683983, 1, 1, 1, 1, 1,
0.4796036, 0.669462, 0.8582854, 1, 1, 1, 1, 1,
0.4797585, 0.2828118, 2.450772, 1, 1, 1, 1, 1,
0.4883177, -0.4054497, 2.929259, 1, 1, 1, 1, 1,
0.4885113, 2.109798, -0.002212671, 1, 1, 1, 1, 1,
0.4885787, -0.6062725, 2.054868, 1, 1, 1, 1, 1,
0.5042677, 0.3912082, 1.901284, 1, 1, 1, 1, 1,
0.5048065, 0.05995823, 1.458244, 1, 1, 1, 1, 1,
0.5053785, 1.039262, -0.07734215, 1, 1, 1, 1, 1,
0.5058797, 0.2136958, 0.6865853, 1, 1, 1, 1, 1,
0.5069005, -0.04393239, 2.201832, 1, 1, 1, 1, 1,
0.5073683, 0.2814574, 0.5582948, 1, 1, 1, 1, 1,
0.5083539, -1.596237, 4.468571, 0, 0, 1, 1, 1,
0.5102264, -2.333626, 1.875619, 1, 0, 0, 1, 1,
0.5132722, -1.224655, 4.571034, 1, 0, 0, 1, 1,
0.5165086, 1.015868, -1.004853, 1, 0, 0, 1, 1,
0.5180103, 0.3964822, -1.789026, 1, 0, 0, 1, 1,
0.5194068, 0.7221428, 0.854543, 1, 0, 0, 1, 1,
0.5195919, -0.3131432, 1.805646, 0, 0, 0, 1, 1,
0.521234, 0.2813667, 0.02360875, 0, 0, 0, 1, 1,
0.522396, -0.3495981, 1.422328, 0, 0, 0, 1, 1,
0.5260934, -2.013161, 2.799089, 0, 0, 0, 1, 1,
0.5293347, 0.1454624, 1.66396, 0, 0, 0, 1, 1,
0.5319799, -0.3307095, 3.612956, 0, 0, 0, 1, 1,
0.5335336, 0.7797215, 1.16897, 0, 0, 0, 1, 1,
0.5344895, 0.2659549, 2.648519, 1, 1, 1, 1, 1,
0.5366532, 1.764019, 0.2366143, 1, 1, 1, 1, 1,
0.540602, -1.02601, 2.075537, 1, 1, 1, 1, 1,
0.5412796, 0.0130856, 2.709882, 1, 1, 1, 1, 1,
0.5433173, 0.04702049, -0.5831549, 1, 1, 1, 1, 1,
0.5436499, -0.9363288, 1.884135, 1, 1, 1, 1, 1,
0.5484442, -2.014844, 3.566725, 1, 1, 1, 1, 1,
0.549405, 0.2802151, 0.05282542, 1, 1, 1, 1, 1,
0.5505959, -0.35246, 3.283023, 1, 1, 1, 1, 1,
0.5514514, -0.245108, 2.638625, 1, 1, 1, 1, 1,
0.5538778, 0.5050723, 2.166458, 1, 1, 1, 1, 1,
0.5544005, 0.45689, 0.5758299, 1, 1, 1, 1, 1,
0.5584207, 0.003894927, 1.166954, 1, 1, 1, 1, 1,
0.5595955, -0.7025772, 3.098443, 1, 1, 1, 1, 1,
0.5599962, -1.086484, 4.906902, 1, 1, 1, 1, 1,
0.5655146, -0.4819486, 3.866657, 0, 0, 1, 1, 1,
0.5744337, -0.2399776, 1.802292, 1, 0, 0, 1, 1,
0.5744409, 0.4546239, 0.08331387, 1, 0, 0, 1, 1,
0.5780098, -0.3202906, 3.936452, 1, 0, 0, 1, 1,
0.5810296, -1.777141, 2.975589, 1, 0, 0, 1, 1,
0.5858786, 0.1880936, 1.224478, 1, 0, 0, 1, 1,
0.5863876, 0.362178, 2.972576, 0, 0, 0, 1, 1,
0.5916801, 1.800357, 0.5825331, 0, 0, 0, 1, 1,
0.5957201, 0.74736, 1.282332, 0, 0, 0, 1, 1,
0.6000589, -0.7104178, 1.176218, 0, 0, 0, 1, 1,
0.6006815, -1.455678, 0.6479236, 0, 0, 0, 1, 1,
0.6012133, -0.9767693, 3.338131, 0, 0, 0, 1, 1,
0.6021546, -0.07454836, 1.737938, 0, 0, 0, 1, 1,
0.6069996, -1.021957, 2.167543, 1, 1, 1, 1, 1,
0.6070105, -0.02568633, 2.527052, 1, 1, 1, 1, 1,
0.6083664, 1.430035, 0.2459915, 1, 1, 1, 1, 1,
0.6124966, 0.01053254, 0.2677702, 1, 1, 1, 1, 1,
0.6167312, -1.005857, 3.035568, 1, 1, 1, 1, 1,
0.6175224, 1.479809, -0.6549066, 1, 1, 1, 1, 1,
0.6195703, 1.39872, 1.139604, 1, 1, 1, 1, 1,
0.6260888, -1.937719, 0.9562628, 1, 1, 1, 1, 1,
0.6276441, 0.5862237, -0.03709263, 1, 1, 1, 1, 1,
0.6295473, 1.519868, -0.7758151, 1, 1, 1, 1, 1,
0.6345427, -0.5984859, 3.127293, 1, 1, 1, 1, 1,
0.6353902, -1.501645, 1.997185, 1, 1, 1, 1, 1,
0.6420998, 0.5768146, 0.2815768, 1, 1, 1, 1, 1,
0.6422415, -0.9848954, 3.541534, 1, 1, 1, 1, 1,
0.6427536, -1.028439, 3.939391, 1, 1, 1, 1, 1,
0.6454467, -0.7040296, 3.374831, 0, 0, 1, 1, 1,
0.6464124, -1.222509, 1.709651, 1, 0, 0, 1, 1,
0.6469429, 1.389572, 0.7312706, 1, 0, 0, 1, 1,
0.6529043, 0.5002098, 0.986964, 1, 0, 0, 1, 1,
0.6648185, -0.3196596, 0.6901237, 1, 0, 0, 1, 1,
0.6680574, -0.7040831, 2.516061, 1, 0, 0, 1, 1,
0.6775522, 1.219838, 1.546124, 0, 0, 0, 1, 1,
0.6800326, -0.3545382, 1.867302, 0, 0, 0, 1, 1,
0.685078, 1.297092, 1.635714, 0, 0, 0, 1, 1,
0.6884919, 0.46106, 0.8604936, 0, 0, 0, 1, 1,
0.6888006, 1.046272, 0.4698592, 0, 0, 0, 1, 1,
0.6909347, -0.06659859, -0.08654069, 0, 0, 0, 1, 1,
0.6938785, 0.2860076, 3.378539, 0, 0, 0, 1, 1,
0.7036873, -1.160428, 2.131116, 1, 1, 1, 1, 1,
0.7081983, 0.5195882, 1.301591, 1, 1, 1, 1, 1,
0.7090784, -0.6679803, 2.459377, 1, 1, 1, 1, 1,
0.7092416, 0.3162386, 2.142653, 1, 1, 1, 1, 1,
0.7118606, 0.6655675, -0.8908914, 1, 1, 1, 1, 1,
0.7175061, 0.7504593, 0.9791702, 1, 1, 1, 1, 1,
0.7194688, 1.591976, 1.430762, 1, 1, 1, 1, 1,
0.7261531, -1.090044, 1.160908, 1, 1, 1, 1, 1,
0.7274768, 1.448241, 1.226476, 1, 1, 1, 1, 1,
0.727906, -0.3540795, 3.456012, 1, 1, 1, 1, 1,
0.7280452, -0.2420465, 3.384263, 1, 1, 1, 1, 1,
0.7343375, -0.4746591, 1.160757, 1, 1, 1, 1, 1,
0.7382263, -1.931032, 3.434693, 1, 1, 1, 1, 1,
0.7409015, 1.111195, 0.6845718, 1, 1, 1, 1, 1,
0.7434066, -0.9269673, 2.591857, 1, 1, 1, 1, 1,
0.7451849, 0.9796095, 0.8203832, 0, 0, 1, 1, 1,
0.7460851, 1.391578, 1.935181, 1, 0, 0, 1, 1,
0.7483059, 1.130292, -0.461577, 1, 0, 0, 1, 1,
0.755697, -1.885126, 3.147892, 1, 0, 0, 1, 1,
0.757412, 0.2369984, 2.477306, 1, 0, 0, 1, 1,
0.7576071, -0.5356203, 1.687654, 1, 0, 0, 1, 1,
0.7599289, -0.2947853, 0.7181789, 0, 0, 0, 1, 1,
0.7609152, -0.5727394, 3.201451, 0, 0, 0, 1, 1,
0.7732388, 0.6643873, -0.4190136, 0, 0, 0, 1, 1,
0.778702, 0.6646987, 0.8507231, 0, 0, 0, 1, 1,
0.7812708, -0.19284, 1.790582, 0, 0, 0, 1, 1,
0.7892043, 0.1133631, 1.160463, 0, 0, 0, 1, 1,
0.7951115, 1.464782, -0.3534422, 0, 0, 0, 1, 1,
0.7998398, -0.436895, 0.8507065, 1, 1, 1, 1, 1,
0.8038591, -0.9558016, 2.732864, 1, 1, 1, 1, 1,
0.8104752, -1.02932, 1.869085, 1, 1, 1, 1, 1,
0.8165857, -0.8132966, 1.105157, 1, 1, 1, 1, 1,
0.8194605, 0.2189613, 1.0445, 1, 1, 1, 1, 1,
0.8194982, -0.8005728, 0.6187376, 1, 1, 1, 1, 1,
0.8219365, 1.386087, -0.1623928, 1, 1, 1, 1, 1,
0.8221146, -0.4895892, 2.266261, 1, 1, 1, 1, 1,
0.8258298, -1.028954, 2.503582, 1, 1, 1, 1, 1,
0.8268201, -0.3019016, 0.720181, 1, 1, 1, 1, 1,
0.829381, -1.976251, 3.839802, 1, 1, 1, 1, 1,
0.8329006, -0.3919019, 2.197647, 1, 1, 1, 1, 1,
0.8406551, -0.9421523, 3.473118, 1, 1, 1, 1, 1,
0.8445188, -0.5076162, 2.74057, 1, 1, 1, 1, 1,
0.8451077, 0.7283054, 2.048677, 1, 1, 1, 1, 1,
0.8455706, 0.9965366, 0.8628395, 0, 0, 1, 1, 1,
0.8462354, 0.580448, 2.443968, 1, 0, 0, 1, 1,
0.8467044, 0.8954068, 0.06309208, 1, 0, 0, 1, 1,
0.8470196, -1.600269, 2.024526, 1, 0, 0, 1, 1,
0.8546104, 1.060288, -0.7252583, 1, 0, 0, 1, 1,
0.8573805, -0.1284213, 2.355841, 1, 0, 0, 1, 1,
0.8576914, -0.1815082, -0.6555474, 0, 0, 0, 1, 1,
0.862043, -0.05736782, 0.9106036, 0, 0, 0, 1, 1,
0.8634366, -0.849301, 0.4591111, 0, 0, 0, 1, 1,
0.8639231, -0.5839331, 1.558451, 0, 0, 0, 1, 1,
0.8663557, 0.8391232, 0.1159091, 0, 0, 0, 1, 1,
0.8682294, 0.651521, -0.4068211, 0, 0, 0, 1, 1,
0.874628, -0.2805219, 3.242656, 0, 0, 0, 1, 1,
0.8798297, 0.2550458, 1.824305, 1, 1, 1, 1, 1,
0.8865226, -0.6827139, 0.7848892, 1, 1, 1, 1, 1,
0.889577, 0.544634, 2.118233, 1, 1, 1, 1, 1,
0.8902693, -0.7916213, 2.061333, 1, 1, 1, 1, 1,
0.8908594, -0.2073969, 0.2489524, 1, 1, 1, 1, 1,
0.8990365, 1.063043, -0.6544048, 1, 1, 1, 1, 1,
0.9003635, -0.4194892, 3.180852, 1, 1, 1, 1, 1,
0.9014109, -1.038251, 2.617777, 1, 1, 1, 1, 1,
0.9017076, -0.1983551, 2.291133, 1, 1, 1, 1, 1,
0.9029963, 1.209155, 0.02673359, 1, 1, 1, 1, 1,
0.9033155, 0.07827643, 1.570178, 1, 1, 1, 1, 1,
0.9083138, -0.8891716, 1.831565, 1, 1, 1, 1, 1,
0.9096692, -1.154696, 3.141771, 1, 1, 1, 1, 1,
0.9209759, -0.8634391, 0.4236102, 1, 1, 1, 1, 1,
0.9230562, -1.837014, 1.39501, 1, 1, 1, 1, 1,
0.9248753, -0.40132, 2.261918, 0, 0, 1, 1, 1,
0.9255292, 0.5685588, 0.5386707, 1, 0, 0, 1, 1,
0.9263712, -0.1096531, 2.704963, 1, 0, 0, 1, 1,
0.9309748, 1.370995, 0.3152402, 1, 0, 0, 1, 1,
0.9335834, 1.426121, -0.4924983, 1, 0, 0, 1, 1,
0.9345899, -0.5496191, 2.408771, 1, 0, 0, 1, 1,
0.943398, -1.10063, 2.741714, 0, 0, 0, 1, 1,
0.9467689, -0.175484, 1.018789, 0, 0, 0, 1, 1,
0.9471353, 1.460322, -0.4095134, 0, 0, 0, 1, 1,
0.9490582, -0.7267702, 2.464393, 0, 0, 0, 1, 1,
0.9505965, 0.6245574, -0.3166083, 0, 0, 0, 1, 1,
0.9514037, 0.3069179, 2.227783, 0, 0, 0, 1, 1,
0.9535892, 0.484193, -0.2089583, 0, 0, 0, 1, 1,
0.9556114, -0.6005303, 3.909851, 1, 1, 1, 1, 1,
0.9670303, -0.2038955, 1.754651, 1, 1, 1, 1, 1,
0.9684226, -1.13175, 1.598147, 1, 1, 1, 1, 1,
0.969273, 0.0152552, 1.918244, 1, 1, 1, 1, 1,
0.9706253, 0.5692955, 0.993214, 1, 1, 1, 1, 1,
0.9917067, -0.5174113, 2.145546, 1, 1, 1, 1, 1,
0.9956832, 0.8008372, 0.8224247, 1, 1, 1, 1, 1,
1.000125, -1.239062, 1.795338, 1, 1, 1, 1, 1,
1.008998, -1.294997, 3.321434, 1, 1, 1, 1, 1,
1.011103, -1.146096, 1.173681, 1, 1, 1, 1, 1,
1.019803, -1.510462, 2.307604, 1, 1, 1, 1, 1,
1.020187, 1.114547, 1.225789, 1, 1, 1, 1, 1,
1.031063, -1.820915, 0.556637, 1, 1, 1, 1, 1,
1.033718, 0.7546431, -0.01423536, 1, 1, 1, 1, 1,
1.0445, -0.02164939, 1.243038, 1, 1, 1, 1, 1,
1.049305, 0.09891942, 1.830968, 0, 0, 1, 1, 1,
1.056662, -0.06400163, 0.8016237, 1, 0, 0, 1, 1,
1.059495, -0.5048094, 1.154351, 1, 0, 0, 1, 1,
1.062253, 0.2422266, 0.2530568, 1, 0, 0, 1, 1,
1.067362, -0.3171816, 1.183179, 1, 0, 0, 1, 1,
1.072462, 0.6126739, 0.755451, 1, 0, 0, 1, 1,
1.075183, 0.3868507, 1.790004, 0, 0, 0, 1, 1,
1.07737, -2.578099, 4.303198, 0, 0, 0, 1, 1,
1.078337, 0.7485176, 3.034576, 0, 0, 0, 1, 1,
1.080555, 0.6076245, 2.998658, 0, 0, 0, 1, 1,
1.083724, 0.2650737, 1.525995, 0, 0, 0, 1, 1,
1.089114, 1.060112, 1.422349, 0, 0, 0, 1, 1,
1.100974, 1.136217, 1.431734, 0, 0, 0, 1, 1,
1.105316, 0.5731624, 2.367365, 1, 1, 1, 1, 1,
1.109484, -0.7379887, 2.117489, 1, 1, 1, 1, 1,
1.122833, -0.7902451, 1.278165, 1, 1, 1, 1, 1,
1.131909, -0.5230258, 1.946999, 1, 1, 1, 1, 1,
1.132046, -1.556219, 1.999896, 1, 1, 1, 1, 1,
1.146185, -0.5277624, 2.274974, 1, 1, 1, 1, 1,
1.151229, 2.04348, 0.5181279, 1, 1, 1, 1, 1,
1.157419, -0.001620918, 0.8479487, 1, 1, 1, 1, 1,
1.160386, 0.9918182, 1.846156, 1, 1, 1, 1, 1,
1.175837, -0.6897035, 2.100199, 1, 1, 1, 1, 1,
1.178323, -1.010478, 4.236458, 1, 1, 1, 1, 1,
1.188344, -0.08919765, 2.148095, 1, 1, 1, 1, 1,
1.188755, 0.4707979, 1.171089, 1, 1, 1, 1, 1,
1.19266, -0.03976784, 2.400993, 1, 1, 1, 1, 1,
1.2054, -0.5808394, -0.0987312, 1, 1, 1, 1, 1,
1.208456, -1.061776, 2.129364, 0, 0, 1, 1, 1,
1.209202, -0.5607988, 1.712196, 1, 0, 0, 1, 1,
1.222525, -2.670425, 1.737424, 1, 0, 0, 1, 1,
1.224123, 1.163197, -0.5059161, 1, 0, 0, 1, 1,
1.229354, 0.9790621, 0.572973, 1, 0, 0, 1, 1,
1.231163, 1.489556, 0.6000788, 1, 0, 0, 1, 1,
1.236926, 0.2767728, 1.197493, 0, 0, 0, 1, 1,
1.242285, -0.9606247, 3.231059, 0, 0, 0, 1, 1,
1.269019, -0.2394798, 4.16718, 0, 0, 0, 1, 1,
1.276085, 0.6260526, 2.540192, 0, 0, 0, 1, 1,
1.276698, 0.9107469, 1.623992, 0, 0, 0, 1, 1,
1.280377, 0.2564712, 1.325879, 0, 0, 0, 1, 1,
1.285156, -0.8133155, 0.6396465, 0, 0, 0, 1, 1,
1.286976, -0.1502991, 1.220439, 1, 1, 1, 1, 1,
1.299982, 0.5993519, 0.9032569, 1, 1, 1, 1, 1,
1.3007, -2.827004, 5.552119, 1, 1, 1, 1, 1,
1.323435, -0.241998, 2.575767, 1, 1, 1, 1, 1,
1.330388, -1.169843, 2.677443, 1, 1, 1, 1, 1,
1.335097, 0.3581904, 0.8420833, 1, 1, 1, 1, 1,
1.339734, 0.3897522, 0.6018882, 1, 1, 1, 1, 1,
1.354102, -2.058362, 3.062195, 1, 1, 1, 1, 1,
1.368335, 0.2392002, 0.1757627, 1, 1, 1, 1, 1,
1.371377, -0.4527216, 0.3222913, 1, 1, 1, 1, 1,
1.375488, 0.7005301, 1.323265, 1, 1, 1, 1, 1,
1.376057, -1.347737, 2.311202, 1, 1, 1, 1, 1,
1.380117, -1.433146, 2.210367, 1, 1, 1, 1, 1,
1.390165, 1.58216, 0.8662176, 1, 1, 1, 1, 1,
1.391033, -2.037022, 2.98823, 1, 1, 1, 1, 1,
1.391964, 1.952694, -0.5529736, 0, 0, 1, 1, 1,
1.394118, 0.5357753, -0.3712678, 1, 0, 0, 1, 1,
1.395228, 0.4486232, 0.7472923, 1, 0, 0, 1, 1,
1.400118, 0.1195816, 2.152051, 1, 0, 0, 1, 1,
1.400456, 0.5022812, 1.797725, 1, 0, 0, 1, 1,
1.413637, 0.767394, 0.2620532, 1, 0, 0, 1, 1,
1.418603, -1.07158, 2.836109, 0, 0, 0, 1, 1,
1.423387, -2.566422, 1.062438, 0, 0, 0, 1, 1,
1.427086, -0.7090808, 0.9949262, 0, 0, 0, 1, 1,
1.43946, 1.905327, 0.1036712, 0, 0, 0, 1, 1,
1.446253, -0.4825868, 2.474784, 0, 0, 0, 1, 1,
1.462681, 0.09654898, 1.696474, 0, 0, 0, 1, 1,
1.468511, -0.6120679, 2.33935, 0, 0, 0, 1, 1,
1.470962, 0.400503, 1.454048, 1, 1, 1, 1, 1,
1.478599, -1.089002, 3.945498, 1, 1, 1, 1, 1,
1.481715, 0.4084652, 0.5405948, 1, 1, 1, 1, 1,
1.485507, 0.004693611, -1.078942, 1, 1, 1, 1, 1,
1.49164, -0.587441, 0.3986024, 1, 1, 1, 1, 1,
1.492574, 1.582071, 0.7551755, 1, 1, 1, 1, 1,
1.496037, -1.717473, 4.067348, 1, 1, 1, 1, 1,
1.49694, -2.340451, 1.637971, 1, 1, 1, 1, 1,
1.502883, -0.834186, 0.8492591, 1, 1, 1, 1, 1,
1.503651, 0.1266323, 2.27809, 1, 1, 1, 1, 1,
1.527637, 0.931796, 1.398439, 1, 1, 1, 1, 1,
1.563403, 1.704575, 1.177024, 1, 1, 1, 1, 1,
1.565154, 0.05766147, 2.003526, 1, 1, 1, 1, 1,
1.570034, 0.4696622, 1.62157, 1, 1, 1, 1, 1,
1.575269, 1.520294, 1.018628, 1, 1, 1, 1, 1,
1.584387, -0.7668504, 1.811074, 0, 0, 1, 1, 1,
1.616227, 0.3985597, 0.9622687, 1, 0, 0, 1, 1,
1.617093, 1.208623, 1.221652, 1, 0, 0, 1, 1,
1.6242, -0.05021179, 2.149234, 1, 0, 0, 1, 1,
1.629277, -0.7120288, -0.9026009, 1, 0, 0, 1, 1,
1.630788, 1.060079, 0.9408389, 1, 0, 0, 1, 1,
1.63427, -0.9032631, 1.848156, 0, 0, 0, 1, 1,
1.646347, 0.611343, 1.169347, 0, 0, 0, 1, 1,
1.649337, -2.165857, 3.157019, 0, 0, 0, 1, 1,
1.651269, -0.6887084, 1.22153, 0, 0, 0, 1, 1,
1.653313, -1.698537, 2.140565, 0, 0, 0, 1, 1,
1.656219, 0.4082957, 1.281864, 0, 0, 0, 1, 1,
1.677877, -0.4420497, 2.006702, 0, 0, 0, 1, 1,
1.679519, -0.01637617, 1.473969, 1, 1, 1, 1, 1,
1.692309, 2.186954, 0.7512915, 1, 1, 1, 1, 1,
1.698647, -0.7527758, 1.133711, 1, 1, 1, 1, 1,
1.699861, -1.122419, 1.491054, 1, 1, 1, 1, 1,
1.699966, 0.7644637, 0.5861048, 1, 1, 1, 1, 1,
1.703238, 1.200542, 0.8161818, 1, 1, 1, 1, 1,
1.709274, -0.7224354, 2.19804, 1, 1, 1, 1, 1,
1.746359, 0.6869035, 0.3443619, 1, 1, 1, 1, 1,
1.75078, 0.5486624, 2.881546, 1, 1, 1, 1, 1,
1.758584, -0.0217692, 2.034606, 1, 1, 1, 1, 1,
1.762989, 0.1670135, 1.654514, 1, 1, 1, 1, 1,
1.769178, -0.0522214, 1.308057, 1, 1, 1, 1, 1,
1.782569, 0.9450912, 0.334621, 1, 1, 1, 1, 1,
1.797214, -2.757699, 2.208431, 1, 1, 1, 1, 1,
1.801202, -1.390679, 2.352246, 1, 1, 1, 1, 1,
1.827928, -0.566639, 3.238607, 0, 0, 1, 1, 1,
1.829893, -0.3250275, 1.551924, 1, 0, 0, 1, 1,
1.850826, 0.6366788, 0.9160168, 1, 0, 0, 1, 1,
1.868714, 1.224323, 1.564152, 1, 0, 0, 1, 1,
1.887837, 0.6183074, 2.172705, 1, 0, 0, 1, 1,
1.895539, -0.3397087, 1.783188, 1, 0, 0, 1, 1,
1.896415, -1.090571, 0.9612219, 0, 0, 0, 1, 1,
1.900773, 0.06355959, 1.556049, 0, 0, 0, 1, 1,
1.918645, -0.1265012, 2.584556, 0, 0, 0, 1, 1,
1.943617, -0.1576929, 1.818798, 0, 0, 0, 1, 1,
1.946894, 2.039716, 0.4667884, 0, 0, 0, 1, 1,
1.953739, -0.5136678, 3.162954, 0, 0, 0, 1, 1,
1.956852, -1.337817, 2.580533, 0, 0, 0, 1, 1,
1.96078, 0.01173298, 1.571759, 1, 1, 1, 1, 1,
1.969243, -1.158322, 1.683466, 1, 1, 1, 1, 1,
1.976051, -0.3501492, 3.529908, 1, 1, 1, 1, 1,
2.011447, -0.7535226, 0.88072, 1, 1, 1, 1, 1,
2.050038, -0.03490074, 3.190899, 1, 1, 1, 1, 1,
2.063327, -0.2350727, 0.740853, 1, 1, 1, 1, 1,
2.119433, -0.8558626, 1.598406, 1, 1, 1, 1, 1,
2.138699, -0.9105073, 2.732589, 1, 1, 1, 1, 1,
2.145016, -0.6375571, 0.8676996, 1, 1, 1, 1, 1,
2.147524, -1.229216, 2.79607, 1, 1, 1, 1, 1,
2.150815, 0.9634551, 1.806843, 1, 1, 1, 1, 1,
2.157388, 0.2732397, 2.528033, 1, 1, 1, 1, 1,
2.161825, 0.2265057, 0.7570832, 1, 1, 1, 1, 1,
2.191653, 0.8717828, -0.02311844, 1, 1, 1, 1, 1,
2.212873, 0.7025567, 1.543631, 1, 1, 1, 1, 1,
2.221758, 0.3490454, 1.223385, 0, 0, 1, 1, 1,
2.23532, -0.2214557, 3.688748, 1, 0, 0, 1, 1,
2.238525, -1.238648, 0.4903219, 1, 0, 0, 1, 1,
2.271375, -0.3456625, 1.778269, 1, 0, 0, 1, 1,
2.330779, 0.9150165, 3.277805, 1, 0, 0, 1, 1,
2.337739, 0.31123, 0.9438677, 1, 0, 0, 1, 1,
2.364984, 0.3333879, 0.4527553, 0, 0, 0, 1, 1,
2.380599, 0.9698997, 1.512162, 0, 0, 0, 1, 1,
2.416207, 1.669386, 2.095406, 0, 0, 0, 1, 1,
2.482171, -0.778501, 1.415028, 0, 0, 0, 1, 1,
2.49615, 1.106469, 1.215538, 0, 0, 0, 1, 1,
2.539429, 0.452235, 0.4141777, 0, 0, 0, 1, 1,
2.633618, -0.6763526, 0.9943887, 0, 0, 0, 1, 1,
2.739547, 1.266486, -0.277281, 1, 1, 1, 1, 1,
2.743493, 0.5924388, 1.796679, 1, 1, 1, 1, 1,
2.767963, -2.395639, 3.020246, 1, 1, 1, 1, 1,
2.783634, 1.357519, 0.981878, 1, 1, 1, 1, 1,
2.838247, 0.4097477, 0.9289974, 1, 1, 1, 1, 1,
2.912803, 0.3446958, 1.224698, 1, 1, 1, 1, 1,
3.264856, -0.2326802, 0.9650564, 1, 1, 1, 1, 1
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
var radius = 9.529685;
var distance = 33.47261;
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
mvMatrix.translate( 0.07312322, 0.2934805, -0.0420301 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47261);
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
