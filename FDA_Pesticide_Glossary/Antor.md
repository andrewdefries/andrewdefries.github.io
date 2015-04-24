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
-3.213756, 0.1996185, -0.5942369, 1, 0, 0, 1,
-3.208162, -0.4627355, -0.4401529, 1, 0.007843138, 0, 1,
-2.846302, 1.51696, -0.3830597, 1, 0.01176471, 0, 1,
-2.821879, -1.223686, -1.583055, 1, 0.01960784, 0, 1,
-2.630931, 0.5265644, -1.746297, 1, 0.02352941, 0, 1,
-2.610276, 0.4018627, -1.468744, 1, 0.03137255, 0, 1,
-2.594783, -0.5022525, -3.464687, 1, 0.03529412, 0, 1,
-2.518786, 2.240589, -1.83643, 1, 0.04313726, 0, 1,
-2.483146, 0.5587154, -1.222688, 1, 0.04705882, 0, 1,
-2.479201, 0.7884049, -2.048154, 1, 0.05490196, 0, 1,
-2.429516, -0.6908905, -0.6662313, 1, 0.05882353, 0, 1,
-2.401739, -1.949365, 0.385149, 1, 0.06666667, 0, 1,
-2.38097, 1.21087, -0.8707236, 1, 0.07058824, 0, 1,
-2.373785, 0.281092, -2.258996, 1, 0.07843138, 0, 1,
-2.362711, -0.4256373, -3.32035, 1, 0.08235294, 0, 1,
-2.25538, 0.9058766, -2.266158, 1, 0.09019608, 0, 1,
-2.240749, 1.115021, -0.1043777, 1, 0.09411765, 0, 1,
-2.198784, -1.40592, -3.271085, 1, 0.1019608, 0, 1,
-2.182834, 2.557605, -0.5258964, 1, 0.1098039, 0, 1,
-2.106124, 2.270253, -0.8160012, 1, 0.1137255, 0, 1,
-2.057806, 0.3993914, 0.9377691, 1, 0.1215686, 0, 1,
-2.017969, 0.6661735, -0.177755, 1, 0.1254902, 0, 1,
-2.008422, -0.002572096, -2.369851, 1, 0.1333333, 0, 1,
-1.996702, 0.2554159, -1.088427, 1, 0.1372549, 0, 1,
-1.978294, 0.9016822, -1.813977, 1, 0.145098, 0, 1,
-1.952668, -0.7944581, -2.340305, 1, 0.1490196, 0, 1,
-1.917534, 0.2975248, -0.2596154, 1, 0.1568628, 0, 1,
-1.855942, -1.651222, -0.4280365, 1, 0.1607843, 0, 1,
-1.854615, -0.4592531, -1.482031, 1, 0.1686275, 0, 1,
-1.853482, -0.8204125, -1.833822, 1, 0.172549, 0, 1,
-1.849484, 0.5843595, -1.68676, 1, 0.1803922, 0, 1,
-1.82842, -0.8261039, -2.449796, 1, 0.1843137, 0, 1,
-1.825651, 0.3513661, -0.7699018, 1, 0.1921569, 0, 1,
-1.82542, -0.6860265, -3.076282, 1, 0.1960784, 0, 1,
-1.79912, -2.277236, -4.498002, 1, 0.2039216, 0, 1,
-1.781693, 1.179041, -0.9100495, 1, 0.2117647, 0, 1,
-1.779129, -1.253313, -2.462053, 1, 0.2156863, 0, 1,
-1.775823, -1.066, -3.10088, 1, 0.2235294, 0, 1,
-1.770014, -0.08898576, -0.8720878, 1, 0.227451, 0, 1,
-1.764117, 0.7379249, -1.076712, 1, 0.2352941, 0, 1,
-1.761909, 1.251932, 0.05019366, 1, 0.2392157, 0, 1,
-1.760158, 1.528802, -0.1576454, 1, 0.2470588, 0, 1,
-1.758351, 2.362443, 0.9835723, 1, 0.2509804, 0, 1,
-1.749684, 0.4476393, 0.8987858, 1, 0.2588235, 0, 1,
-1.713348, 1.419399, -0.8447309, 1, 0.2627451, 0, 1,
-1.71041, -0.7010927, -1.374397, 1, 0.2705882, 0, 1,
-1.697453, -0.006643097, -1.462355, 1, 0.2745098, 0, 1,
-1.692319, -0.3688517, -2.126552, 1, 0.282353, 0, 1,
-1.687013, -0.7943622, -4.056672, 1, 0.2862745, 0, 1,
-1.671815, -0.3013126, -1.742111, 1, 0.2941177, 0, 1,
-1.664895, -0.8393815, -2.07954, 1, 0.3019608, 0, 1,
-1.662013, 0.1658908, -2.132804, 1, 0.3058824, 0, 1,
-1.632983, -1.212745, -1.631065, 1, 0.3137255, 0, 1,
-1.626858, -0.8918497, -0.711532, 1, 0.3176471, 0, 1,
-1.618917, 1.054021, -0.617204, 1, 0.3254902, 0, 1,
-1.615752, -0.05424091, -1.860669, 1, 0.3294118, 0, 1,
-1.610653, 0.729915, -2.886714, 1, 0.3372549, 0, 1,
-1.602311, -0.3757766, -0.3543588, 1, 0.3411765, 0, 1,
-1.593694, -0.5060182, -2.680613, 1, 0.3490196, 0, 1,
-1.582811, -0.3733205, 0.1326906, 1, 0.3529412, 0, 1,
-1.574494, 0.6618801, -1.818437, 1, 0.3607843, 0, 1,
-1.571172, -0.3068728, -2.410275, 1, 0.3647059, 0, 1,
-1.570541, -0.2605091, -2.649584, 1, 0.372549, 0, 1,
-1.561345, -0.6464428, -1.911179, 1, 0.3764706, 0, 1,
-1.5605, -1.070186, -2.51614, 1, 0.3843137, 0, 1,
-1.558342, 0.8603296, -0.86924, 1, 0.3882353, 0, 1,
-1.554054, -1.235231, -2.325658, 1, 0.3960784, 0, 1,
-1.552744, 0.384513, -1.773656, 1, 0.4039216, 0, 1,
-1.549404, 0.7789344, -0.1169771, 1, 0.4078431, 0, 1,
-1.537584, 1.602478, -1.464673, 1, 0.4156863, 0, 1,
-1.530397, -1.350839, -1.711862, 1, 0.4196078, 0, 1,
-1.482782, -1.072748, -1.909826, 1, 0.427451, 0, 1,
-1.482658, -0.6529494, -1.203792, 1, 0.4313726, 0, 1,
-1.460567, 1.327569, -0.4636486, 1, 0.4392157, 0, 1,
-1.458712, 1.982674, -0.1728697, 1, 0.4431373, 0, 1,
-1.45699, -0.08197916, -0.6988497, 1, 0.4509804, 0, 1,
-1.456435, 0.02941984, -1.569845, 1, 0.454902, 0, 1,
-1.454454, -0.2370261, -2.149237, 1, 0.4627451, 0, 1,
-1.452102, -0.1151074, -2.64974, 1, 0.4666667, 0, 1,
-1.442405, 0.3304726, -2.294244, 1, 0.4745098, 0, 1,
-1.429072, 0.1211771, -1.439191, 1, 0.4784314, 0, 1,
-1.427459, 0.7273461, -1.197327, 1, 0.4862745, 0, 1,
-1.42689, -0.2100175, -2.897364, 1, 0.4901961, 0, 1,
-1.423657, -0.3001243, -2.807544, 1, 0.4980392, 0, 1,
-1.417138, -0.4163484, -1.613679, 1, 0.5058824, 0, 1,
-1.413312, -0.6286227, -2.454192, 1, 0.509804, 0, 1,
-1.39936, 2.237787, -1.265936, 1, 0.5176471, 0, 1,
-1.397448, 1.783848, -1.276149, 1, 0.5215687, 0, 1,
-1.384623, 1.335476, -1.951839, 1, 0.5294118, 0, 1,
-1.37622, 1.300666, 0.3916285, 1, 0.5333334, 0, 1,
-1.371464, 1.086256, 0.4090473, 1, 0.5411765, 0, 1,
-1.368405, -0.8883069, -3.809382, 1, 0.5450981, 0, 1,
-1.35851, 0.1284924, -1.238088, 1, 0.5529412, 0, 1,
-1.356276, -2.216024, -1.659961, 1, 0.5568628, 0, 1,
-1.356172, -0.680958, -2.603043, 1, 0.5647059, 0, 1,
-1.355906, -1.947227, -3.053214, 1, 0.5686275, 0, 1,
-1.352921, -1.29096, -2.120933, 1, 0.5764706, 0, 1,
-1.348261, 1.81556, 0.3246751, 1, 0.5803922, 0, 1,
-1.34774, 0.8973823, -1.09227, 1, 0.5882353, 0, 1,
-1.341982, -0.4897167, -0.4181589, 1, 0.5921569, 0, 1,
-1.341601, -2.277502, -2.507455, 1, 0.6, 0, 1,
-1.340799, 1.576096, -0.1968745, 1, 0.6078432, 0, 1,
-1.339137, 0.4148898, -4.584513, 1, 0.6117647, 0, 1,
-1.330872, 1.296835, -0.6082842, 1, 0.6196079, 0, 1,
-1.330486, -0.9356067, -2.094731, 1, 0.6235294, 0, 1,
-1.314604, 0.4037229, -3.021083, 1, 0.6313726, 0, 1,
-1.306867, -1.322767, 0.7552041, 1, 0.6352941, 0, 1,
-1.300334, -0.5995305, -1.754102, 1, 0.6431373, 0, 1,
-1.293993, 0.4045165, -2.609741, 1, 0.6470588, 0, 1,
-1.281255, 0.3339106, -1.358466, 1, 0.654902, 0, 1,
-1.277395, 0.4160347, -1.714649, 1, 0.6588235, 0, 1,
-1.275849, 1.127887, -0.4164835, 1, 0.6666667, 0, 1,
-1.266351, 0.5356385, -1.268935, 1, 0.6705883, 0, 1,
-1.26301, 0.1117411, -1.385028, 1, 0.6784314, 0, 1,
-1.252452, 2.070212, -0.8984063, 1, 0.682353, 0, 1,
-1.248899, -1.677606, -2.73912, 1, 0.6901961, 0, 1,
-1.241837, 2.423705, -0.3928947, 1, 0.6941177, 0, 1,
-1.23792, -0.3238455, -2.303382, 1, 0.7019608, 0, 1,
-1.237912, 0.08367556, -5.762248, 1, 0.7098039, 0, 1,
-1.234666, -0.9170595, -2.215238, 1, 0.7137255, 0, 1,
-1.219641, 0.678428, -1.233461, 1, 0.7215686, 0, 1,
-1.218419, -0.6419414, -3.215923, 1, 0.7254902, 0, 1,
-1.217756, 1.098134, 0.4616355, 1, 0.7333333, 0, 1,
-1.202914, 0.3323138, -2.324068, 1, 0.7372549, 0, 1,
-1.198321, -0.2059912, -2.183034, 1, 0.7450981, 0, 1,
-1.196987, -0.9496304, -4.013719, 1, 0.7490196, 0, 1,
-1.195307, 0.6075889, -1.465406, 1, 0.7568628, 0, 1,
-1.176222, 0.07221051, -2.481052, 1, 0.7607843, 0, 1,
-1.163247, 0.932924, -0.6195261, 1, 0.7686275, 0, 1,
-1.158888, 0.9221361, -0.3165398, 1, 0.772549, 0, 1,
-1.155939, 0.6842198, 0.06235405, 1, 0.7803922, 0, 1,
-1.154887, -0.5271385, -1.896684, 1, 0.7843137, 0, 1,
-1.15062, 0.08412685, -1.304069, 1, 0.7921569, 0, 1,
-1.143256, 1.048213, -1.301652, 1, 0.7960784, 0, 1,
-1.14121, -0.6987409, -0.8120119, 1, 0.8039216, 0, 1,
-1.138953, 0.1338116, 0.2323153, 1, 0.8117647, 0, 1,
-1.131498, 0.8722603, -0.2199174, 1, 0.8156863, 0, 1,
-1.130723, 0.6715391, -2.544138, 1, 0.8235294, 0, 1,
-1.126441, 0.7960704, -1.034264, 1, 0.827451, 0, 1,
-1.121881, -0.8975064, -1.689357, 1, 0.8352941, 0, 1,
-1.118915, -0.7107579, -2.247712, 1, 0.8392157, 0, 1,
-1.108345, -1.45374, -0.1399468, 1, 0.8470588, 0, 1,
-1.105987, -1.483398, -0.8846294, 1, 0.8509804, 0, 1,
-1.100997, 0.812082, -2.746809, 1, 0.8588235, 0, 1,
-1.091521, -0.2607516, 0.05109872, 1, 0.8627451, 0, 1,
-1.085836, 0.8273103, -0.879788, 1, 0.8705882, 0, 1,
-1.067322, -0.1378563, -0.8374107, 1, 0.8745098, 0, 1,
-1.063965, -0.242396, -1.447515, 1, 0.8823529, 0, 1,
-1.05803, -0.6361943, -2.621777, 1, 0.8862745, 0, 1,
-1.052964, -0.76508, -0.3171622, 1, 0.8941177, 0, 1,
-1.050589, -1.560567, -2.649434, 1, 0.8980392, 0, 1,
-1.047676, -2.244359, -2.373268, 1, 0.9058824, 0, 1,
-1.044213, 0.1423481, 0.8465695, 1, 0.9137255, 0, 1,
-1.039829, 0.488463, 0.3892252, 1, 0.9176471, 0, 1,
-1.037331, 1.063086, -2.306764, 1, 0.9254902, 0, 1,
-1.035676, 0.8459237, 0.01698638, 1, 0.9294118, 0, 1,
-1.031423, 1.178148, -0.006529035, 1, 0.9372549, 0, 1,
-1.028374, 1.504694, -0.09831929, 1, 0.9411765, 0, 1,
-1.027164, 0.8859941, 0.4789119, 1, 0.9490196, 0, 1,
-1.024818, -0.5515637, -3.017937, 1, 0.9529412, 0, 1,
-1.024736, -0.8371619, -3.866568, 1, 0.9607843, 0, 1,
-1.018168, 1.625118, -0.9114299, 1, 0.9647059, 0, 1,
-1.001536, 0.07848027, -1.387727, 1, 0.972549, 0, 1,
-0.9952434, -0.8938007, -2.959437, 1, 0.9764706, 0, 1,
-0.9879233, 0.7802181, -0.1727583, 1, 0.9843137, 0, 1,
-0.9870897, 0.1962449, -2.776402, 1, 0.9882353, 0, 1,
-0.9863114, 0.6313436, -1.04918, 1, 0.9960784, 0, 1,
-0.9858505, 0.459301, -1.681186, 0.9960784, 1, 0, 1,
-0.9685272, -0.5985326, -0.8610926, 0.9921569, 1, 0, 1,
-0.9658698, -0.2321324, -1.040396, 0.9843137, 1, 0, 1,
-0.9611182, -0.7242557, -3.729566, 0.9803922, 1, 0, 1,
-0.9593909, -0.496476, -0.9199126, 0.972549, 1, 0, 1,
-0.9589713, 0.8590229, -1.229426, 0.9686275, 1, 0, 1,
-0.950839, 1.558727, 0.3978242, 0.9607843, 1, 0, 1,
-0.9472596, 0.9393403, -1.567919, 0.9568627, 1, 0, 1,
-0.9420002, -0.6403217, -2.515096, 0.9490196, 1, 0, 1,
-0.9345154, -0.2706073, -1.240191, 0.945098, 1, 0, 1,
-0.9304398, -1.082065, -2.914045, 0.9372549, 1, 0, 1,
-0.9276746, 0.2322403, -0.438951, 0.9333333, 1, 0, 1,
-0.9215958, 0.244086, -0.3134261, 0.9254902, 1, 0, 1,
-0.9196988, 0.07916067, -1.47474, 0.9215686, 1, 0, 1,
-0.9169941, 0.4207661, -0.4490722, 0.9137255, 1, 0, 1,
-0.9099367, -0.9269859, -1.027771, 0.9098039, 1, 0, 1,
-0.9023904, 0.296727, -3.288607, 0.9019608, 1, 0, 1,
-0.9017144, 0.9279275, -2.031856, 0.8941177, 1, 0, 1,
-0.8869725, -0.149945, -1.681184, 0.8901961, 1, 0, 1,
-0.8778355, -1.857711, -2.356286, 0.8823529, 1, 0, 1,
-0.8776215, 1.096975, 1.082544, 0.8784314, 1, 0, 1,
-0.8755975, 0.8059592, 0.01619428, 0.8705882, 1, 0, 1,
-0.8744596, 1.829065, 0.1625782, 0.8666667, 1, 0, 1,
-0.8681175, 1.325436, -0.09153779, 0.8588235, 1, 0, 1,
-0.8659557, 0.4752936, -1.275692, 0.854902, 1, 0, 1,
-0.8653829, -0.5294949, -3.437319, 0.8470588, 1, 0, 1,
-0.8607101, -1.575555, -2.284284, 0.8431373, 1, 0, 1,
-0.8596461, 1.057527, -0.4523724, 0.8352941, 1, 0, 1,
-0.8584508, -1.510017, -2.139037, 0.8313726, 1, 0, 1,
-0.8555954, 1.537323, -2.281382, 0.8235294, 1, 0, 1,
-0.8528797, -0.0606647, -0.3904826, 0.8196079, 1, 0, 1,
-0.8487338, 0.3021372, -1.52421, 0.8117647, 1, 0, 1,
-0.8430729, -0.8452907, -1.51045, 0.8078431, 1, 0, 1,
-0.843049, -0.9192179, -1.565279, 0.8, 1, 0, 1,
-0.8388166, 0.5892977, -0.6385781, 0.7921569, 1, 0, 1,
-0.8271547, -0.02152878, -2.008446, 0.7882353, 1, 0, 1,
-0.8225984, 1.0776, 0.9675685, 0.7803922, 1, 0, 1,
-0.8212236, 1.820589, -0.5984397, 0.7764706, 1, 0, 1,
-0.8132535, 0.2330997, -0.5750429, 0.7686275, 1, 0, 1,
-0.8124269, -0.6037685, -2.050472, 0.7647059, 1, 0, 1,
-0.8121077, 0.4599439, -1.378384, 0.7568628, 1, 0, 1,
-0.8076531, -1.102439, -1.774858, 0.7529412, 1, 0, 1,
-0.8071027, -0.6480244, -2.604161, 0.7450981, 1, 0, 1,
-0.8070084, -1.125183, -1.748839, 0.7411765, 1, 0, 1,
-0.8052651, -0.5418503, -3.508375, 0.7333333, 1, 0, 1,
-0.8035571, 1.210083, 0.1202671, 0.7294118, 1, 0, 1,
-0.7957849, 0.2777272, 0.5613953, 0.7215686, 1, 0, 1,
-0.7900016, 0.7790209, -0.4970625, 0.7176471, 1, 0, 1,
-0.7895712, 0.02040515, -1.607059, 0.7098039, 1, 0, 1,
-0.7837366, 0.1121273, -0.7193905, 0.7058824, 1, 0, 1,
-0.7828788, -0.8717004, -3.007758, 0.6980392, 1, 0, 1,
-0.7798303, 0.3137702, -2.194653, 0.6901961, 1, 0, 1,
-0.7775712, -0.4441805, -3.350546, 0.6862745, 1, 0, 1,
-0.7742379, -1.370292, -3.471289, 0.6784314, 1, 0, 1,
-0.7734933, -2.676474, -3.609217, 0.6745098, 1, 0, 1,
-0.7692022, 0.583904, 0.3524337, 0.6666667, 1, 0, 1,
-0.7578186, 0.3193404, -0.2407615, 0.6627451, 1, 0, 1,
-0.7562993, 1.454275, -0.2576983, 0.654902, 1, 0, 1,
-0.7524897, -1.795224, -2.645741, 0.6509804, 1, 0, 1,
-0.7512255, 1.567755, -0.1908581, 0.6431373, 1, 0, 1,
-0.7506868, 2.6274, -0.3518721, 0.6392157, 1, 0, 1,
-0.734955, 0.1527144, -3.460353, 0.6313726, 1, 0, 1,
-0.7330087, -0.1780457, -4.70579, 0.627451, 1, 0, 1,
-0.7292874, 0.75075, 0.00277743, 0.6196079, 1, 0, 1,
-0.7289218, -0.3064079, -1.488195, 0.6156863, 1, 0, 1,
-0.7287019, 0.05916176, -2.705934, 0.6078432, 1, 0, 1,
-0.7252468, 0.5555238, -1.309932, 0.6039216, 1, 0, 1,
-0.7227268, -1.901219, -2.323741, 0.5960785, 1, 0, 1,
-0.7192824, 0.4140816, -1.402323, 0.5882353, 1, 0, 1,
-0.7149634, 1.436938, 1.547507, 0.5843138, 1, 0, 1,
-0.7137987, -0.3606364, -2.467838, 0.5764706, 1, 0, 1,
-0.7122423, -0.6793162, -1.003577, 0.572549, 1, 0, 1,
-0.7120512, -1.260011, -2.893428, 0.5647059, 1, 0, 1,
-0.7117497, -0.01088607, -2.501402, 0.5607843, 1, 0, 1,
-0.7094426, -0.3698636, -1.080867, 0.5529412, 1, 0, 1,
-0.7072279, -0.581326, -0.6494291, 0.5490196, 1, 0, 1,
-0.7061539, 0.8238466, 0.6077569, 0.5411765, 1, 0, 1,
-0.7051808, -0.454034, -2.562882, 0.5372549, 1, 0, 1,
-0.6959391, 1.386617, -0.9896953, 0.5294118, 1, 0, 1,
-0.6916167, -0.5964835, -2.192541, 0.5254902, 1, 0, 1,
-0.6911284, 1.150385, -0.7155936, 0.5176471, 1, 0, 1,
-0.6898811, -0.5951635, -2.626363, 0.5137255, 1, 0, 1,
-0.689751, -2.443021, -3.566846, 0.5058824, 1, 0, 1,
-0.6887246, -0.3748381, -0.4262934, 0.5019608, 1, 0, 1,
-0.6829422, -0.3194935, -1.311853, 0.4941176, 1, 0, 1,
-0.682833, -0.3230466, -2.028527, 0.4862745, 1, 0, 1,
-0.6730887, -2.087076, -4.031783, 0.4823529, 1, 0, 1,
-0.6724024, 0.5890161, -0.2658725, 0.4745098, 1, 0, 1,
-0.6718838, 0.8579101, -2.24238, 0.4705882, 1, 0, 1,
-0.663904, -0.8200323, -0.5165031, 0.4627451, 1, 0, 1,
-0.6570171, 1.345128, -0.1758072, 0.4588235, 1, 0, 1,
-0.6524317, -0.9971014, -2.970039, 0.4509804, 1, 0, 1,
-0.6483874, -1.050282, -1.56152, 0.4470588, 1, 0, 1,
-0.641797, 0.1878154, -0.3948842, 0.4392157, 1, 0, 1,
-0.6401144, -0.705853, -2.717496, 0.4352941, 1, 0, 1,
-0.6224833, 0.6137149, -1.514645, 0.427451, 1, 0, 1,
-0.6211003, -0.8175532, -1.577185, 0.4235294, 1, 0, 1,
-0.6198081, 2.502162, 0.3956585, 0.4156863, 1, 0, 1,
-0.6179625, -0.7780463, -2.789789, 0.4117647, 1, 0, 1,
-0.6165445, 0.5100767, -1.045271, 0.4039216, 1, 0, 1,
-0.6133883, 1.040361, -0.5370185, 0.3960784, 1, 0, 1,
-0.6123898, 0.5451664, -0.1929762, 0.3921569, 1, 0, 1,
-0.6090454, 0.7049401, 0.6878139, 0.3843137, 1, 0, 1,
-0.6086643, 0.03869961, -2.166555, 0.3803922, 1, 0, 1,
-0.6076308, -0.2827398, -1.967552, 0.372549, 1, 0, 1,
-0.6048261, -0.5408131, -4.500121, 0.3686275, 1, 0, 1,
-0.5991157, -0.3370731, -0.4631635, 0.3607843, 1, 0, 1,
-0.5864562, -1.247245, -3.154599, 0.3568628, 1, 0, 1,
-0.5855293, -1.087524, -0.4738616, 0.3490196, 1, 0, 1,
-0.5796205, 0.9564299, -0.8377257, 0.345098, 1, 0, 1,
-0.5696234, 0.2330354, -0.5184454, 0.3372549, 1, 0, 1,
-0.5668197, 0.5998652, -0.6978542, 0.3333333, 1, 0, 1,
-0.5667399, -1.749179, -2.788259, 0.3254902, 1, 0, 1,
-0.5618238, 0.7639138, -0.9954351, 0.3215686, 1, 0, 1,
-0.5604613, -0.7591622, -3.088258, 0.3137255, 1, 0, 1,
-0.5602419, -1.220428, -4.115911, 0.3098039, 1, 0, 1,
-0.5572407, -0.1258783, -0.7894415, 0.3019608, 1, 0, 1,
-0.5512908, 0.9765797, -0.4994229, 0.2941177, 1, 0, 1,
-0.5495431, 0.8755754, 0.04979025, 0.2901961, 1, 0, 1,
-0.5491376, 0.4591202, -0.05585199, 0.282353, 1, 0, 1,
-0.5488687, -0.3625163, -3.352816, 0.2784314, 1, 0, 1,
-0.5475243, 0.4335706, 0.02375028, 0.2705882, 1, 0, 1,
-0.5443906, -0.6922757, -2.547907, 0.2666667, 1, 0, 1,
-0.5436965, -0.004525385, -2.368012, 0.2588235, 1, 0, 1,
-0.5423706, -0.6582052, -3.346866, 0.254902, 1, 0, 1,
-0.5401619, 1.490871, -1.471843, 0.2470588, 1, 0, 1,
-0.5398735, -0.3368461, -2.49171, 0.2431373, 1, 0, 1,
-0.5368502, 0.9520974, 0.2196701, 0.2352941, 1, 0, 1,
-0.5365563, 0.3179417, -1.037981, 0.2313726, 1, 0, 1,
-0.5356859, -1.422489, -2.495016, 0.2235294, 1, 0, 1,
-0.5309847, 0.06771622, -0.6405094, 0.2196078, 1, 0, 1,
-0.5306773, -2.386745, -4.60859, 0.2117647, 1, 0, 1,
-0.526798, -0.9520615, -4.598644, 0.2078431, 1, 0, 1,
-0.5192474, 0.5288702, -1.860759, 0.2, 1, 0, 1,
-0.5131707, -0.439508, -3.149913, 0.1921569, 1, 0, 1,
-0.5129452, 0.2970975, -1.501676, 0.1882353, 1, 0, 1,
-0.5114087, 1.07072, 0.7543801, 0.1803922, 1, 0, 1,
-0.5093931, 2.900606, -1.665377, 0.1764706, 1, 0, 1,
-0.5062785, 0.990352, 0.2251464, 0.1686275, 1, 0, 1,
-0.504795, -1.645202, -3.113569, 0.1647059, 1, 0, 1,
-0.5042605, 0.465467, -0.2027364, 0.1568628, 1, 0, 1,
-0.5038384, -0.05734364, 0.05964012, 0.1529412, 1, 0, 1,
-0.5021605, 1.393187, -2.26579, 0.145098, 1, 0, 1,
-0.4951729, 0.8963919, -0.6586475, 0.1411765, 1, 0, 1,
-0.4949359, -0.4063883, -1.772936, 0.1333333, 1, 0, 1,
-0.4904238, 0.431573, -1.249726, 0.1294118, 1, 0, 1,
-0.4864563, -0.2317634, -1.671439, 0.1215686, 1, 0, 1,
-0.4828779, 0.9310365, 0.2494079, 0.1176471, 1, 0, 1,
-0.4821874, 0.1665103, -1.80416, 0.1098039, 1, 0, 1,
-0.4800442, -1.07108, -3.504581, 0.1058824, 1, 0, 1,
-0.4791418, -0.7386515, -2.967215, 0.09803922, 1, 0, 1,
-0.4784383, 1.418516, 0.4444741, 0.09019608, 1, 0, 1,
-0.4723454, -0.6597466, -4.423768, 0.08627451, 1, 0, 1,
-0.4722263, -0.1227452, -2.011181, 0.07843138, 1, 0, 1,
-0.4685317, 0.5868526, -2.559454, 0.07450981, 1, 0, 1,
-0.4616544, -0.5100941, -2.149859, 0.06666667, 1, 0, 1,
-0.4591978, -1.091572, -3.487904, 0.0627451, 1, 0, 1,
-0.4566137, 0.2568899, -1.528319, 0.05490196, 1, 0, 1,
-0.4563923, 0.06785303, -0.7922909, 0.05098039, 1, 0, 1,
-0.4553694, 1.24404, 0.241389, 0.04313726, 1, 0, 1,
-0.4523782, -0.2279715, -2.165263, 0.03921569, 1, 0, 1,
-0.45102, 0.9186824, 0.6228857, 0.03137255, 1, 0, 1,
-0.4496074, -1.401671, -2.478961, 0.02745098, 1, 0, 1,
-0.4491417, -0.6146581, -1.999863, 0.01960784, 1, 0, 1,
-0.4474785, 0.7444885, -1.228735, 0.01568628, 1, 0, 1,
-0.4470742, -0.3160768, -0.8692732, 0.007843138, 1, 0, 1,
-0.4464035, -1.39177, -2.833029, 0.003921569, 1, 0, 1,
-0.4448589, 0.5957761, 0.8814446, 0, 1, 0.003921569, 1,
-0.4433269, 1.259018, -0.5928704, 0, 1, 0.01176471, 1,
-0.4421867, -0.4223551, -3.026417, 0, 1, 0.01568628, 1,
-0.4403187, -0.1861389, -1.695596, 0, 1, 0.02352941, 1,
-0.4336061, -1.333116, -2.775808, 0, 1, 0.02745098, 1,
-0.4321264, 1.258388, 0.6140028, 0, 1, 0.03529412, 1,
-0.4317382, -0.5809059, -1.900269, 0, 1, 0.03921569, 1,
-0.4312672, -0.1484651, -2.998577, 0, 1, 0.04705882, 1,
-0.4293019, 0.3754687, -1.519333, 0, 1, 0.05098039, 1,
-0.4263959, 2.531346, -0.8875569, 0, 1, 0.05882353, 1,
-0.4164146, 0.4079859, 0.2808445, 0, 1, 0.0627451, 1,
-0.4162679, 0.7618747, 0.7934737, 0, 1, 0.07058824, 1,
-0.4147219, -0.5171868, -3.451617, 0, 1, 0.07450981, 1,
-0.4124314, -0.7704633, -4.366713, 0, 1, 0.08235294, 1,
-0.4096308, -0.8984005, -2.211859, 0, 1, 0.08627451, 1,
-0.4078356, -0.397895, -1.459604, 0, 1, 0.09411765, 1,
-0.4064811, -1.287199, -1.081489, 0, 1, 0.1019608, 1,
-0.3985168, 0.1420399, -2.043088, 0, 1, 0.1058824, 1,
-0.3968575, -0.1364721, -2.992747, 0, 1, 0.1137255, 1,
-0.3942142, -1.241829, 0.1704534, 0, 1, 0.1176471, 1,
-0.3911985, 1.121337, 0.1471826, 0, 1, 0.1254902, 1,
-0.3889487, 1.278247, -0.9486506, 0, 1, 0.1294118, 1,
-0.3862577, 1.242052, -3.07519, 0, 1, 0.1372549, 1,
-0.3809932, -0.673301, -1.522957, 0, 1, 0.1411765, 1,
-0.3782829, -1.716939, -1.981152, 0, 1, 0.1490196, 1,
-0.3739524, 0.312019, 0.3826192, 0, 1, 0.1529412, 1,
-0.3694653, 0.01507766, -1.73264, 0, 1, 0.1607843, 1,
-0.3692706, 0.9625329, -0.836976, 0, 1, 0.1647059, 1,
-0.3666706, -0.3831576, -2.399358, 0, 1, 0.172549, 1,
-0.3642682, -0.8969266, -2.968299, 0, 1, 0.1764706, 1,
-0.3602815, -0.1935906, -3.43909, 0, 1, 0.1843137, 1,
-0.3587573, -0.803446, -2.7186, 0, 1, 0.1882353, 1,
-0.3574992, -1.927078, -3.521436, 0, 1, 0.1960784, 1,
-0.3535655, 0.5076787, -0.2742875, 0, 1, 0.2039216, 1,
-0.3464857, 0.4951459, -0.8516867, 0, 1, 0.2078431, 1,
-0.34607, 0.1382683, -0.7059313, 0, 1, 0.2156863, 1,
-0.3459805, -0.7066801, -3.954416, 0, 1, 0.2196078, 1,
-0.3417763, 0.09023352, -2.266185, 0, 1, 0.227451, 1,
-0.341133, -0.1666725, -3.820466, 0, 1, 0.2313726, 1,
-0.3392627, 1.083214, -0.7585055, 0, 1, 0.2392157, 1,
-0.3360998, -0.3529727, -3.086398, 0, 1, 0.2431373, 1,
-0.3358619, -0.8910642, -2.972278, 0, 1, 0.2509804, 1,
-0.3335226, 0.5665033, 0.1461288, 0, 1, 0.254902, 1,
-0.3315066, -1.005146, -3.44313, 0, 1, 0.2627451, 1,
-0.330613, 0.8819918, 0.4435179, 0, 1, 0.2666667, 1,
-0.3294097, -0.3765837, -1.363409, 0, 1, 0.2745098, 1,
-0.3283039, -0.4995654, -3.011765, 0, 1, 0.2784314, 1,
-0.3246111, -0.7430971, -3.064931, 0, 1, 0.2862745, 1,
-0.3228597, -1.411242, -2.750118, 0, 1, 0.2901961, 1,
-0.322603, 0.8969906, -0.5965501, 0, 1, 0.2980392, 1,
-0.3186621, 0.1739462, -0.3927877, 0, 1, 0.3058824, 1,
-0.3170239, -0.4552358, -0.6506014, 0, 1, 0.3098039, 1,
-0.3166753, 0.6311098, 0.005799356, 0, 1, 0.3176471, 1,
-0.3156376, 0.2524217, -0.6631816, 0, 1, 0.3215686, 1,
-0.3144543, 1.172521, 0.4873147, 0, 1, 0.3294118, 1,
-0.3128299, -0.4441162, -1.836914, 0, 1, 0.3333333, 1,
-0.3103206, -0.9189495, -2.937387, 0, 1, 0.3411765, 1,
-0.3022931, 0.1893762, -0.6754357, 0, 1, 0.345098, 1,
-0.3004123, 0.592082, 0.3079089, 0, 1, 0.3529412, 1,
-0.3000509, 1.775856, -0.3403909, 0, 1, 0.3568628, 1,
-0.2984726, 0.7238724, 0.2131252, 0, 1, 0.3647059, 1,
-0.2975618, 1.127693, -1.548047, 0, 1, 0.3686275, 1,
-0.2915298, -0.6911984, -3.730106, 0, 1, 0.3764706, 1,
-0.2911624, -0.505063, -1.197124, 0, 1, 0.3803922, 1,
-0.2907681, 1.104304, -1.172872, 0, 1, 0.3882353, 1,
-0.2864498, -0.8994873, -2.114751, 0, 1, 0.3921569, 1,
-0.2807323, 0.06078713, -1.160686, 0, 1, 0.4, 1,
-0.276199, -1.246415, -4.022673, 0, 1, 0.4078431, 1,
-0.273725, -0.8678159, -3.722678, 0, 1, 0.4117647, 1,
-0.2724499, 1.284104, -1.174613, 0, 1, 0.4196078, 1,
-0.2710351, -0.5086714, -2.827819, 0, 1, 0.4235294, 1,
-0.2661621, -0.642092, -2.807873, 0, 1, 0.4313726, 1,
-0.2653481, 0.9351272, -0.8963695, 0, 1, 0.4352941, 1,
-0.2647895, -0.4185629, -0.64324, 0, 1, 0.4431373, 1,
-0.2617899, 0.6128266, 0.240142, 0, 1, 0.4470588, 1,
-0.2600692, 1.304861, 1.009826, 0, 1, 0.454902, 1,
-0.260049, -0.8883233, -3.821923, 0, 1, 0.4588235, 1,
-0.2586599, -0.5857539, -1.102897, 0, 1, 0.4666667, 1,
-0.2501561, -1.38739, -2.099162, 0, 1, 0.4705882, 1,
-0.2482163, 0.6197278, -1.21181, 0, 1, 0.4784314, 1,
-0.2480693, -0.2914298, -2.073677, 0, 1, 0.4823529, 1,
-0.2454579, 1.945739, -0.8196692, 0, 1, 0.4901961, 1,
-0.2434998, 0.792312, 0.8028882, 0, 1, 0.4941176, 1,
-0.2404302, 0.6326485, -0.02986668, 0, 1, 0.5019608, 1,
-0.2377126, 0.1107497, -1.29487, 0, 1, 0.509804, 1,
-0.2361435, -0.618988, -1.143727, 0, 1, 0.5137255, 1,
-0.2311891, -0.5634224, -3.2855, 0, 1, 0.5215687, 1,
-0.2287479, -0.300413, -3.403838, 0, 1, 0.5254902, 1,
-0.2268402, 1.572289, -1.544455, 0, 1, 0.5333334, 1,
-0.2217192, -1.440833, -2.573897, 0, 1, 0.5372549, 1,
-0.2217149, -1.281001, -3.16332, 0, 1, 0.5450981, 1,
-0.2209529, -0.02276001, -2.099585, 0, 1, 0.5490196, 1,
-0.2196189, 0.5874312, -1.08307, 0, 1, 0.5568628, 1,
-0.2188756, 0.680903, 0.08332062, 0, 1, 0.5607843, 1,
-0.2138701, 1.243262, 0.6456704, 0, 1, 0.5686275, 1,
-0.212907, 0.2530934, -0.07530575, 0, 1, 0.572549, 1,
-0.2102698, 1.242702, 0.6680468, 0, 1, 0.5803922, 1,
-0.2049855, -0.04968741, -0.7078918, 0, 1, 0.5843138, 1,
-0.2047519, 2.131891, -0.09758524, 0, 1, 0.5921569, 1,
-0.2018139, 0.6966948, -1.193815, 0, 1, 0.5960785, 1,
-0.1983648, -0.2837982, -4.131855, 0, 1, 0.6039216, 1,
-0.1981808, -2.431959, -2.561349, 0, 1, 0.6117647, 1,
-0.1956186, -0.3732942, -1.446823, 0, 1, 0.6156863, 1,
-0.1867659, 0.6306997, -1.099575, 0, 1, 0.6235294, 1,
-0.1836428, -1.752681, -2.669447, 0, 1, 0.627451, 1,
-0.1808592, 0.3016699, -0.8201461, 0, 1, 0.6352941, 1,
-0.1797262, 0.3160851, 0.7229515, 0, 1, 0.6392157, 1,
-0.1782034, -0.8958927, -4.363613, 0, 1, 0.6470588, 1,
-0.1663771, 1.589046, -0.7829306, 0, 1, 0.6509804, 1,
-0.1627581, 1.68651, 0.07927367, 0, 1, 0.6588235, 1,
-0.1608263, 1.014159, -1.349923, 0, 1, 0.6627451, 1,
-0.1557733, 0.5519371, 0.4285905, 0, 1, 0.6705883, 1,
-0.1526652, 0.7217908, -0.3363942, 0, 1, 0.6745098, 1,
-0.1526104, 0.5444663, -1.717666, 0, 1, 0.682353, 1,
-0.1502474, 0.4627703, 1.577862, 0, 1, 0.6862745, 1,
-0.150044, 0.2349685, 0.1364951, 0, 1, 0.6941177, 1,
-0.1497546, 0.02193479, 1.16122, 0, 1, 0.7019608, 1,
-0.1495724, -0.6283754, -2.734758, 0, 1, 0.7058824, 1,
-0.143234, -0.323467, -4.582087, 0, 1, 0.7137255, 1,
-0.1386464, 1.941055, 0.9994907, 0, 1, 0.7176471, 1,
-0.1384313, 0.3537996, -0.9578871, 0, 1, 0.7254902, 1,
-0.1349509, 0.7472669, -1.961961, 0, 1, 0.7294118, 1,
-0.1322231, 0.06355479, -1.036105, 0, 1, 0.7372549, 1,
-0.1307901, 1.771128, 1.175628, 0, 1, 0.7411765, 1,
-0.1283362, 1.236356, 1.230233, 0, 1, 0.7490196, 1,
-0.1232768, 2.214936, -0.856162, 0, 1, 0.7529412, 1,
-0.1229881, 0.5393296, -1.193815, 0, 1, 0.7607843, 1,
-0.1190949, -0.1836079, -2.141237, 0, 1, 0.7647059, 1,
-0.1184169, 0.9313869, 1.736617, 0, 1, 0.772549, 1,
-0.1168725, 0.8922427, 0.5494007, 0, 1, 0.7764706, 1,
-0.1163077, -0.2349582, -4.455003, 0, 1, 0.7843137, 1,
-0.1143481, 1.312802, 0.4685983, 0, 1, 0.7882353, 1,
-0.1139501, 0.315563, -2.472566, 0, 1, 0.7960784, 1,
-0.1122808, 0.3958363, -1.511674, 0, 1, 0.8039216, 1,
-0.1111498, 1.694879, 0.2398926, 0, 1, 0.8078431, 1,
-0.1105635, -0.3608209, -2.831432, 0, 1, 0.8156863, 1,
-0.106553, -1.994948, -2.718415, 0, 1, 0.8196079, 1,
-0.1055846, -0.2605738, -2.477592, 0, 1, 0.827451, 1,
-0.1007586, -0.3625069, -2.02193, 0, 1, 0.8313726, 1,
-0.1000545, 0.3509189, -0.4023901, 0, 1, 0.8392157, 1,
-0.09905472, -0.06535963, -3.560537, 0, 1, 0.8431373, 1,
-0.09818828, -1.780344, -5.109245, 0, 1, 0.8509804, 1,
-0.09817283, -1.40739, -3.905941, 0, 1, 0.854902, 1,
-0.0980991, 0.2365715, -1.121302, 0, 1, 0.8627451, 1,
-0.09689358, 0.6491719, -2.353169, 0, 1, 0.8666667, 1,
-0.09622843, 0.7176156, -0.6254542, 0, 1, 0.8745098, 1,
-0.09254467, 0.2566634, -2.053704, 0, 1, 0.8784314, 1,
-0.09072674, 0.6616423, 0.1032204, 0, 1, 0.8862745, 1,
-0.09068797, 0.5298147, -0.9194068, 0, 1, 0.8901961, 1,
-0.08686162, -2.471469, -2.693603, 0, 1, 0.8980392, 1,
-0.08066399, 1.753688, 0.2432317, 0, 1, 0.9058824, 1,
-0.07991359, 0.4666179, -1.749517, 0, 1, 0.9098039, 1,
-0.07952847, -0.04519978, -1.907282, 0, 1, 0.9176471, 1,
-0.07637078, 0.901614, -0.5931221, 0, 1, 0.9215686, 1,
-0.07637041, 2.018612, 1.309642, 0, 1, 0.9294118, 1,
-0.07613762, 0.1056248, 1.480125, 0, 1, 0.9333333, 1,
-0.07341769, -0.5095748, -2.096284, 0, 1, 0.9411765, 1,
-0.07084749, -0.7740334, -4.201587, 0, 1, 0.945098, 1,
-0.07078242, 0.5217657, 0.2214545, 0, 1, 0.9529412, 1,
-0.07052968, -0.1734411, -3.36502, 0, 1, 0.9568627, 1,
-0.06542312, 0.9496263, -1.286516, 0, 1, 0.9647059, 1,
-0.06479567, -0.2515652, -2.589819, 0, 1, 0.9686275, 1,
-0.06390787, -1.273177, -4.620132, 0, 1, 0.9764706, 1,
-0.06152935, 0.5029034, 1.3197, 0, 1, 0.9803922, 1,
-0.05688319, -0.2091602, -2.742786, 0, 1, 0.9882353, 1,
-0.05272373, -1.584401, -4.18455, 0, 1, 0.9921569, 1,
-0.05094068, 1.104536, -1.421221, 0, 1, 1, 1,
-0.0496681, 0.1916642, -0.8953223, 0, 0.9921569, 1, 1,
-0.04949789, -0.3286633, -1.924842, 0, 0.9882353, 1, 1,
-0.04248258, 0.8090569, -0.5017108, 0, 0.9803922, 1, 1,
-0.0422491, -0.4681783, -2.518445, 0, 0.9764706, 1, 1,
-0.0336904, -0.8292826, -1.572733, 0, 0.9686275, 1, 1,
-0.02126285, -2.111383, -1.451109, 0, 0.9647059, 1, 1,
-0.01959472, 0.5795585, 0.4869122, 0, 0.9568627, 1, 1,
-0.01918998, -0.1431623, -4.455454, 0, 0.9529412, 1, 1,
-0.01763051, 1.308496, -0.8664411, 0, 0.945098, 1, 1,
-0.008062825, -0.6772869, -2.08394, 0, 0.9411765, 1, 1,
-0.003038764, 0.2661942, 1.145224, 0, 0.9333333, 1, 1,
0.002388269, -1.335001, 3.353435, 0, 0.9294118, 1, 1,
0.005397905, 0.2953659, -1.625298, 0, 0.9215686, 1, 1,
0.006091911, -2.502919, 2.336647, 0, 0.9176471, 1, 1,
0.01046537, -1.484055, 4.139912, 0, 0.9098039, 1, 1,
0.0120953, 0.7137893, 0.7674041, 0, 0.9058824, 1, 1,
0.01599845, -0.2507515, 2.985871, 0, 0.8980392, 1, 1,
0.01921495, -0.6789212, 4.088511, 0, 0.8901961, 1, 1,
0.02043614, -0.08303446, 0.02440093, 0, 0.8862745, 1, 1,
0.02251332, 0.5268302, 1.402054, 0, 0.8784314, 1, 1,
0.02258769, 0.7425141, -0.5424753, 0, 0.8745098, 1, 1,
0.0282857, -0.72525, 4.080212, 0, 0.8666667, 1, 1,
0.02893188, -0.2550551, 2.671754, 0, 0.8627451, 1, 1,
0.03012485, 0.2349231, -1.296974, 0, 0.854902, 1, 1,
0.03043224, -0.9902545, 3.418526, 0, 0.8509804, 1, 1,
0.03086301, 0.936923, 0.01410266, 0, 0.8431373, 1, 1,
0.03110417, 1.347803, 1.939044, 0, 0.8392157, 1, 1,
0.03111753, 1.350704, -0.141268, 0, 0.8313726, 1, 1,
0.03618016, -0.7758396, 1.96725, 0, 0.827451, 1, 1,
0.04091392, -1.04067, 1.370092, 0, 0.8196079, 1, 1,
0.04112806, -1.070607, 2.857542, 0, 0.8156863, 1, 1,
0.04444447, 0.6987857, -0.1997175, 0, 0.8078431, 1, 1,
0.05239492, 0.3854547, -0.09371895, 0, 0.8039216, 1, 1,
0.05709292, 0.2765724, -0.9829976, 0, 0.7960784, 1, 1,
0.05879295, 1.994616, 1.053409, 0, 0.7882353, 1, 1,
0.06210295, 1.444939, 0.5133274, 0, 0.7843137, 1, 1,
0.0627503, -1.550581, 3.061116, 0, 0.7764706, 1, 1,
0.06321768, 0.7648487, -0.2140932, 0, 0.772549, 1, 1,
0.06345145, 0.5885211, 0.6442282, 0, 0.7647059, 1, 1,
0.06353354, -0.1354782, 4.376991, 0, 0.7607843, 1, 1,
0.06520221, 0.6899875, 0.1564288, 0, 0.7529412, 1, 1,
0.06552849, -0.001322401, 0.1918743, 0, 0.7490196, 1, 1,
0.06684682, 0.07642055, -0.03461375, 0, 0.7411765, 1, 1,
0.06888752, 0.8269303, 0.4174142, 0, 0.7372549, 1, 1,
0.07155062, -1.519951, 3.524557, 0, 0.7294118, 1, 1,
0.07444246, -1.506109, 3.372443, 0, 0.7254902, 1, 1,
0.07577012, 0.2927636, 1.976725, 0, 0.7176471, 1, 1,
0.07685146, 0.1849941, 1.193524, 0, 0.7137255, 1, 1,
0.07689629, 1.883777, 1.465696, 0, 0.7058824, 1, 1,
0.08372506, 0.9339776, 1.577345, 0, 0.6980392, 1, 1,
0.08454634, 0.5322964, 1.662894, 0, 0.6941177, 1, 1,
0.08730943, -0.5102709, 2.542552, 0, 0.6862745, 1, 1,
0.08877556, 1.056836, 0.7035944, 0, 0.682353, 1, 1,
0.09340329, -0.6753751, 4.161345, 0, 0.6745098, 1, 1,
0.09409794, -0.1601581, 2.201172, 0, 0.6705883, 1, 1,
0.09473314, -1.607209, 3.089124, 0, 0.6627451, 1, 1,
0.09524214, -0.246309, 1.665344, 0, 0.6588235, 1, 1,
0.09750919, 0.2315856, 1.331141, 0, 0.6509804, 1, 1,
0.1075566, 2.547738, -0.6081172, 0, 0.6470588, 1, 1,
0.1122284, 0.7704356, -0.4457018, 0, 0.6392157, 1, 1,
0.1208883, -0.1121839, 2.83753, 0, 0.6352941, 1, 1,
0.1223447, 1.177179, 0.176229, 0, 0.627451, 1, 1,
0.1260247, 1.348668, 1.604158, 0, 0.6235294, 1, 1,
0.1281886, 2.755671, -0.1152687, 0, 0.6156863, 1, 1,
0.1292889, -1.269897, 1.770129, 0, 0.6117647, 1, 1,
0.1300144, 0.6099311, -0.03865341, 0, 0.6039216, 1, 1,
0.1305143, -0.8918818, 4.020836, 0, 0.5960785, 1, 1,
0.1311578, -0.5191226, 3.753331, 0, 0.5921569, 1, 1,
0.1322022, -1.459349, 3.408743, 0, 0.5843138, 1, 1,
0.1439216, -0.0530348, 1.655481, 0, 0.5803922, 1, 1,
0.1470891, 0.4406782, 0.1405384, 0, 0.572549, 1, 1,
0.1488343, 0.3571541, -0.2162169, 0, 0.5686275, 1, 1,
0.1501372, -0.721443, 4.713996, 0, 0.5607843, 1, 1,
0.1517123, -0.1315132, 3.911326, 0, 0.5568628, 1, 1,
0.1522335, 1.311193, 1.190205, 0, 0.5490196, 1, 1,
0.153776, -1.05994, 3.292899, 0, 0.5450981, 1, 1,
0.1546226, 0.02809432, 3.33334, 0, 0.5372549, 1, 1,
0.1578175, 0.07261629, 1.755583, 0, 0.5333334, 1, 1,
0.1605611, 2.090657, 0.5354297, 0, 0.5254902, 1, 1,
0.1627975, -0.07076093, 3.395963, 0, 0.5215687, 1, 1,
0.1632025, 1.710022, 0.03462994, 0, 0.5137255, 1, 1,
0.1636374, -0.7464593, 4.512892, 0, 0.509804, 1, 1,
0.164451, -0.4818113, 3.964425, 0, 0.5019608, 1, 1,
0.1666412, 1.166127, 1.623597, 0, 0.4941176, 1, 1,
0.1673002, 1.709638, 1.006708, 0, 0.4901961, 1, 1,
0.1680251, -0.493658, 5.797479, 0, 0.4823529, 1, 1,
0.1685367, 1.321222, -0.7595241, 0, 0.4784314, 1, 1,
0.1707523, 0.3111174, 0.663753, 0, 0.4705882, 1, 1,
0.1723232, -0.1384727, 3.183814, 0, 0.4666667, 1, 1,
0.1756591, -0.7863838, 2.935581, 0, 0.4588235, 1, 1,
0.175674, 0.9867919, -0.242317, 0, 0.454902, 1, 1,
0.1775487, -0.02025129, 4.201173, 0, 0.4470588, 1, 1,
0.1776232, 1.258829, -0.2247685, 0, 0.4431373, 1, 1,
0.1778103, 0.02506634, 2.544101, 0, 0.4352941, 1, 1,
0.1792943, -0.08618217, 1.840629, 0, 0.4313726, 1, 1,
0.1802235, 0.9836681, -0.3281387, 0, 0.4235294, 1, 1,
0.1925784, 0.06371094, 2.91899, 0, 0.4196078, 1, 1,
0.1936687, 0.002486838, -0.08702467, 0, 0.4117647, 1, 1,
0.1958791, 0.5153152, -0.2693457, 0, 0.4078431, 1, 1,
0.2036082, -0.6239623, 2.239569, 0, 0.4, 1, 1,
0.2066743, -0.5156457, 2.710409, 0, 0.3921569, 1, 1,
0.206714, 2.149378, 0.1020724, 0, 0.3882353, 1, 1,
0.2115682, -0.1215372, 2.384839, 0, 0.3803922, 1, 1,
0.2195482, -0.2867896, 2.709565, 0, 0.3764706, 1, 1,
0.2225258, -1.328389, 1.893332, 0, 0.3686275, 1, 1,
0.2287862, -0.1500701, 3.023859, 0, 0.3647059, 1, 1,
0.2299094, -0.02859575, 0.3643282, 0, 0.3568628, 1, 1,
0.2311281, 0.7444298, -0.8548954, 0, 0.3529412, 1, 1,
0.2334738, 1.355319, -0.1439777, 0, 0.345098, 1, 1,
0.233966, 1.693438, 0.7951776, 0, 0.3411765, 1, 1,
0.2353491, 0.5557647, -1.337204, 0, 0.3333333, 1, 1,
0.2372193, 0.3234515, -0.7852936, 0, 0.3294118, 1, 1,
0.237773, 0.292744, 0.4066886, 0, 0.3215686, 1, 1,
0.2437708, -0.6222878, 3.047103, 0, 0.3176471, 1, 1,
0.244569, -0.2748003, 0.4595593, 0, 0.3098039, 1, 1,
0.2452417, 1.32966, 2.965821, 0, 0.3058824, 1, 1,
0.2458958, -1.161841, 1.692019, 0, 0.2980392, 1, 1,
0.2459317, 0.2429221, 3.107472, 0, 0.2901961, 1, 1,
0.2485035, -0.2891769, 4.013775, 0, 0.2862745, 1, 1,
0.2503288, -0.6051642, 2.751866, 0, 0.2784314, 1, 1,
0.2526288, 0.6630346, 0.2224571, 0, 0.2745098, 1, 1,
0.2527224, 0.0132347, 2.504067, 0, 0.2666667, 1, 1,
0.2543139, 0.8856275, 0.8399315, 0, 0.2627451, 1, 1,
0.2544918, 1.720193, 1.454519, 0, 0.254902, 1, 1,
0.2559505, -0.02873748, 0.4332221, 0, 0.2509804, 1, 1,
0.2619368, -0.04607293, 2.75212, 0, 0.2431373, 1, 1,
0.2632702, -1.480561, 4.730952, 0, 0.2392157, 1, 1,
0.2668045, 0.7920422, -0.8090139, 0, 0.2313726, 1, 1,
0.2685242, 0.3088068, 1.879202, 0, 0.227451, 1, 1,
0.2699872, -0.7609244, 3.459808, 0, 0.2196078, 1, 1,
0.2712814, 0.1990091, -0.7897585, 0, 0.2156863, 1, 1,
0.2773434, -1.287893, 1.660784, 0, 0.2078431, 1, 1,
0.2787834, -0.022474, 2.254019, 0, 0.2039216, 1, 1,
0.2833113, 0.7530719, 1.271995, 0, 0.1960784, 1, 1,
0.2841127, -1.556249, 4.495562, 0, 0.1882353, 1, 1,
0.2860984, -0.264789, 2.759364, 0, 0.1843137, 1, 1,
0.2906178, 1.789042, 1.707649, 0, 0.1764706, 1, 1,
0.2914196, -0.5363392, 3.393253, 0, 0.172549, 1, 1,
0.2915963, -0.2076995, 3.026265, 0, 0.1647059, 1, 1,
0.2931176, -1.825857, 0.8050562, 0, 0.1607843, 1, 1,
0.2953958, -1.901066, 2.117775, 0, 0.1529412, 1, 1,
0.2954447, 1.304531, 1.315274, 0, 0.1490196, 1, 1,
0.297205, 0.4575136, 1.381754, 0, 0.1411765, 1, 1,
0.3054688, -0.4073846, 2.850764, 0, 0.1372549, 1, 1,
0.3066315, -0.7524515, 1.515409, 0, 0.1294118, 1, 1,
0.306771, -1.053909, 2.81087, 0, 0.1254902, 1, 1,
0.3080254, -1.023957, 4.275088, 0, 0.1176471, 1, 1,
0.3080706, -0.5499586, 1.560995, 0, 0.1137255, 1, 1,
0.3090535, 1.520717, 0.3431591, 0, 0.1058824, 1, 1,
0.3126476, -0.5059875, 2.186249, 0, 0.09803922, 1, 1,
0.3144712, 0.5903856, -0.7790465, 0, 0.09411765, 1, 1,
0.319597, 1.619037, 0.1606049, 0, 0.08627451, 1, 1,
0.3217827, -0.02147195, 0.1354113, 0, 0.08235294, 1, 1,
0.3246593, -0.7853547, 3.905154, 0, 0.07450981, 1, 1,
0.3262231, 0.3047477, 0.5808971, 0, 0.07058824, 1, 1,
0.3327511, 0.08724346, 1.485305, 0, 0.0627451, 1, 1,
0.3334719, 0.8037494, -0.7169029, 0, 0.05882353, 1, 1,
0.3368689, -0.2059749, 3.052149, 0, 0.05098039, 1, 1,
0.338223, 0.7545126, 1.601546, 0, 0.04705882, 1, 1,
0.3395789, 1.386651, -1.082174, 0, 0.03921569, 1, 1,
0.3495443, -1.307883, 3.493706, 0, 0.03529412, 1, 1,
0.3538602, 2.190148, 1.302565, 0, 0.02745098, 1, 1,
0.3549953, 1.885278, -0.8357368, 0, 0.02352941, 1, 1,
0.3562568, -0.5225741, 2.907195, 0, 0.01568628, 1, 1,
0.3582631, -1.231905, 2.757352, 0, 0.01176471, 1, 1,
0.3586923, 1.813186, 0.9958867, 0, 0.003921569, 1, 1,
0.3591467, 0.3919236, 2.626895, 0.003921569, 0, 1, 1,
0.3610264, 0.3775645, 1.846069, 0.007843138, 0, 1, 1,
0.3620433, 0.8504, 1.696824, 0.01568628, 0, 1, 1,
0.3629037, -2.216339, 4.259911, 0.01960784, 0, 1, 1,
0.3635954, 1.920869, 0.09397495, 0.02745098, 0, 1, 1,
0.365858, 0.6310148, -0.4539092, 0.03137255, 0, 1, 1,
0.3679135, 0.7575693, 0.6131607, 0.03921569, 0, 1, 1,
0.3704979, -1.195876, 2.796831, 0.04313726, 0, 1, 1,
0.3828469, 2.14674, -0.3541932, 0.05098039, 0, 1, 1,
0.3851823, -1.586398, 2.809158, 0.05490196, 0, 1, 1,
0.3862077, -0.8294209, 1.081812, 0.0627451, 0, 1, 1,
0.3964174, -0.1877619, 2.578051, 0.06666667, 0, 1, 1,
0.396622, 0.08965535, 1.268153, 0.07450981, 0, 1, 1,
0.3994432, 0.6370783, 2.090901, 0.07843138, 0, 1, 1,
0.3996949, -1.149408, 5.474198, 0.08627451, 0, 1, 1,
0.3999048, 0.674414, 0.2606584, 0.09019608, 0, 1, 1,
0.401435, 1.682492, -0.2798722, 0.09803922, 0, 1, 1,
0.40343, -0.4790514, 2.80595, 0.1058824, 0, 1, 1,
0.4081256, 0.5745318, 0.7277862, 0.1098039, 0, 1, 1,
0.4113348, 0.9133041, 1.596391, 0.1176471, 0, 1, 1,
0.4114254, 0.06243192, 1.397183, 0.1215686, 0, 1, 1,
0.4126403, -1.281564, 3.680302, 0.1294118, 0, 1, 1,
0.4136237, -0.8497148, 0.9634654, 0.1333333, 0, 1, 1,
0.4294797, -0.5974599, 3.773064, 0.1411765, 0, 1, 1,
0.4356473, 1.230356, -1.079117, 0.145098, 0, 1, 1,
0.4378871, -2.068006, 2.954025, 0.1529412, 0, 1, 1,
0.4406623, 0.8349741, 1.073537, 0.1568628, 0, 1, 1,
0.44261, 1.060617, -0.6993598, 0.1647059, 0, 1, 1,
0.4457712, 1.489312, -0.2784671, 0.1686275, 0, 1, 1,
0.4459136, -1.857855, 2.381469, 0.1764706, 0, 1, 1,
0.4475195, 0.7241911, 0.3805946, 0.1803922, 0, 1, 1,
0.4505227, -1.855619, 3.919915, 0.1882353, 0, 1, 1,
0.4530824, -1.130174, 2.519389, 0.1921569, 0, 1, 1,
0.4565906, 0.5197892, 1.066791, 0.2, 0, 1, 1,
0.4572173, -1.154512, 3.716449, 0.2078431, 0, 1, 1,
0.458114, 1.449209, -0.2733967, 0.2117647, 0, 1, 1,
0.4584679, -1.045198, 2.630942, 0.2196078, 0, 1, 1,
0.4614443, 0.9449341, 0.8155613, 0.2235294, 0, 1, 1,
0.4619546, 0.4985531, -0.07917782, 0.2313726, 0, 1, 1,
0.4646918, -1.371129, 3.31033, 0.2352941, 0, 1, 1,
0.4749524, 0.5660227, 0.2906872, 0.2431373, 0, 1, 1,
0.4752751, 0.138215, 1.434818, 0.2470588, 0, 1, 1,
0.4818319, 0.2478468, -0.3051487, 0.254902, 0, 1, 1,
0.4907396, -0.3068227, 2.256581, 0.2588235, 0, 1, 1,
0.4986795, -1.20476, 2.829706, 0.2666667, 0, 1, 1,
0.4987123, -1.138723, 2.509292, 0.2705882, 0, 1, 1,
0.4989402, 0.6671867, -0.0044758, 0.2784314, 0, 1, 1,
0.4992505, 0.004271457, 1.360873, 0.282353, 0, 1, 1,
0.5022866, -2.222889, 1.915413, 0.2901961, 0, 1, 1,
0.5036191, -1.438997, 1.85381, 0.2941177, 0, 1, 1,
0.5060592, 0.7581662, 0.2165113, 0.3019608, 0, 1, 1,
0.5117113, 0.2871006, 0.02104222, 0.3098039, 0, 1, 1,
0.5136709, 0.7739971, 2.372099, 0.3137255, 0, 1, 1,
0.514904, 1.220286, 0.4121023, 0.3215686, 0, 1, 1,
0.5170161, -1.106349, 0.9029306, 0.3254902, 0, 1, 1,
0.5269412, 0.1596794, 2.174681, 0.3333333, 0, 1, 1,
0.5388613, -0.7346336, 2.023161, 0.3372549, 0, 1, 1,
0.540924, -0.03880706, 1.628026, 0.345098, 0, 1, 1,
0.5447401, -0.08332235, 1.007511, 0.3490196, 0, 1, 1,
0.5462834, -0.2165723, 2.4869, 0.3568628, 0, 1, 1,
0.5498489, -0.5754245, 1.919331, 0.3607843, 0, 1, 1,
0.550046, -1.192233, 2.454412, 0.3686275, 0, 1, 1,
0.5616406, 1.139084, 1.967313, 0.372549, 0, 1, 1,
0.5619134, -1.15913, 0.8805536, 0.3803922, 0, 1, 1,
0.5624051, 1.421729, 0.2879051, 0.3843137, 0, 1, 1,
0.5667439, -0.3798234, 2.20729, 0.3921569, 0, 1, 1,
0.578236, -1.307415, 2.846023, 0.3960784, 0, 1, 1,
0.579451, -1.78496, 3.577007, 0.4039216, 0, 1, 1,
0.5811391, -0.7005939, 1.364856, 0.4117647, 0, 1, 1,
0.5821218, 0.5896082, -0.8693927, 0.4156863, 0, 1, 1,
0.5852773, -0.8492903, 3.503707, 0.4235294, 0, 1, 1,
0.5869416, -1.110412, 2.002715, 0.427451, 0, 1, 1,
0.5879227, 0.9072781, 1.436663, 0.4352941, 0, 1, 1,
0.5894896, -0.2990412, 1.661711, 0.4392157, 0, 1, 1,
0.5971044, -1.203671, 2.034645, 0.4470588, 0, 1, 1,
0.5972566, -1.124981, 2.775899, 0.4509804, 0, 1, 1,
0.6031041, 0.407088, 0.4621695, 0.4588235, 0, 1, 1,
0.6031405, -0.8388751, 4.149441, 0.4627451, 0, 1, 1,
0.60504, 1.336437, -0.8405256, 0.4705882, 0, 1, 1,
0.6133553, 0.6355572, 1.43789, 0.4745098, 0, 1, 1,
0.61556, -0.4307949, 3.034463, 0.4823529, 0, 1, 1,
0.615768, 1.439158, 2.182846, 0.4862745, 0, 1, 1,
0.6210592, 0.705239, -0.7411147, 0.4941176, 0, 1, 1,
0.6301877, 1.156918, 0.8865647, 0.5019608, 0, 1, 1,
0.6405061, -0.424835, 1.891609, 0.5058824, 0, 1, 1,
0.6411037, -0.6180212, 2.978515, 0.5137255, 0, 1, 1,
0.6435286, -1.758956, 3.648872, 0.5176471, 0, 1, 1,
0.6469198, 0.7914631, 1.718644, 0.5254902, 0, 1, 1,
0.6514893, -0.06373093, 1.495301, 0.5294118, 0, 1, 1,
0.6515518, 1.001549, 0.4098368, 0.5372549, 0, 1, 1,
0.6544819, -1.24713, 2.593277, 0.5411765, 0, 1, 1,
0.657512, -0.2071059, 2.325412, 0.5490196, 0, 1, 1,
0.6590618, 0.3689157, 1.717485, 0.5529412, 0, 1, 1,
0.6595629, -0.7132717, 1.920358, 0.5607843, 0, 1, 1,
0.6604986, -0.5177018, 0.8791579, 0.5647059, 0, 1, 1,
0.6615008, 0.2356864, 0.4865655, 0.572549, 0, 1, 1,
0.6699622, 1.045359, -0.9753438, 0.5764706, 0, 1, 1,
0.6700048, -1.139788, 4.120475, 0.5843138, 0, 1, 1,
0.6734847, -0.28669, 2.883722, 0.5882353, 0, 1, 1,
0.6751917, -0.7206045, 1.289675, 0.5960785, 0, 1, 1,
0.6859378, 3.059432, -0.175625, 0.6039216, 0, 1, 1,
0.6895013, 0.9240605, -1.356912, 0.6078432, 0, 1, 1,
0.6895534, 0.493848, 3.044834, 0.6156863, 0, 1, 1,
0.6920289, 1.688822, 0.2788471, 0.6196079, 0, 1, 1,
0.6962006, -1.133733, 1.530727, 0.627451, 0, 1, 1,
0.6968579, 0.6606698, 1.781192, 0.6313726, 0, 1, 1,
0.7031332, -1.983599, 1.52485, 0.6392157, 0, 1, 1,
0.7060404, -0.2459177, 2.735265, 0.6431373, 0, 1, 1,
0.7074421, -1.98472, 1.909164, 0.6509804, 0, 1, 1,
0.7111733, 0.3045668, 0.08958985, 0.654902, 0, 1, 1,
0.7113796, -0.12737, 2.058791, 0.6627451, 0, 1, 1,
0.7114891, -0.2148798, 2.53919, 0.6666667, 0, 1, 1,
0.712497, -1.344131, 2.658503, 0.6745098, 0, 1, 1,
0.7164096, 0.3773252, 1.402668, 0.6784314, 0, 1, 1,
0.7165397, -0.9444521, 3.760783, 0.6862745, 0, 1, 1,
0.7169713, -0.6239378, 1.302765, 0.6901961, 0, 1, 1,
0.7174628, -0.3639712, 3.392818, 0.6980392, 0, 1, 1,
0.7218465, 0.03933077, 3.376638, 0.7058824, 0, 1, 1,
0.7273969, -1.773299, 2.719524, 0.7098039, 0, 1, 1,
0.7349941, -0.9932837, 2.000574, 0.7176471, 0, 1, 1,
0.7376149, -0.8026446, 2.791766, 0.7215686, 0, 1, 1,
0.7377917, -2.428165, 1.88271, 0.7294118, 0, 1, 1,
0.7379549, 0.2529208, 1.930391, 0.7333333, 0, 1, 1,
0.7408406, 0.7638571, -0.2174243, 0.7411765, 0, 1, 1,
0.7413278, 0.6246878, 1.052807, 0.7450981, 0, 1, 1,
0.7435224, -0.566175, 2.047831, 0.7529412, 0, 1, 1,
0.7469758, -0.7556663, 3.797018, 0.7568628, 0, 1, 1,
0.7491262, 0.1528461, 1.291503, 0.7647059, 0, 1, 1,
0.749689, 0.4630936, 0.6743888, 0.7686275, 0, 1, 1,
0.7497746, -1.04072, 2.740608, 0.7764706, 0, 1, 1,
0.7518314, -1.6393, 3.18952, 0.7803922, 0, 1, 1,
0.7530584, -1.461278, 2.993164, 0.7882353, 0, 1, 1,
0.7551069, 1.059596, 1.902244, 0.7921569, 0, 1, 1,
0.7554726, 0.2007392, 1.759028, 0.8, 0, 1, 1,
0.7594088, -0.2030287, 2.109897, 0.8078431, 0, 1, 1,
0.7649082, 1.107214, -0.6307376, 0.8117647, 0, 1, 1,
0.7703577, -0.6391361, 1.547732, 0.8196079, 0, 1, 1,
0.7727103, -0.8385905, 1.969992, 0.8235294, 0, 1, 1,
0.7755094, 0.5133238, -0.7278296, 0.8313726, 0, 1, 1,
0.7755727, 1.301483, 0.01677962, 0.8352941, 0, 1, 1,
0.7762384, 0.2056475, 0.1011136, 0.8431373, 0, 1, 1,
0.776527, 1.597474, 1.175991, 0.8470588, 0, 1, 1,
0.7831141, 1.860644, 0.8417094, 0.854902, 0, 1, 1,
0.786104, 1.551993, -0.6897738, 0.8588235, 0, 1, 1,
0.7933661, -0.8107082, 2.026996, 0.8666667, 0, 1, 1,
0.7956192, -0.6021586, 1.776141, 0.8705882, 0, 1, 1,
0.8000271, -0.4015349, 0.9388225, 0.8784314, 0, 1, 1,
0.8012419, 1.292981, 0.5998974, 0.8823529, 0, 1, 1,
0.8016784, 0.8521385, 1.826402, 0.8901961, 0, 1, 1,
0.8032913, -0.1162845, 3.654222, 0.8941177, 0, 1, 1,
0.8057571, -0.4889374, 0.8907775, 0.9019608, 0, 1, 1,
0.8070378, 0.4086648, 0.7548072, 0.9098039, 0, 1, 1,
0.8090444, 0.1520291, 0.3146526, 0.9137255, 0, 1, 1,
0.8138114, -0.9019316, 1.039158, 0.9215686, 0, 1, 1,
0.8180494, -0.3333802, 2.146553, 0.9254902, 0, 1, 1,
0.8189529, 0.6108527, 1.705985, 0.9333333, 0, 1, 1,
0.8224052, -0.3579716, 2.681887, 0.9372549, 0, 1, 1,
0.8237483, -0.400721, 3.231633, 0.945098, 0, 1, 1,
0.8246369, -0.8036396, 2.839779, 0.9490196, 0, 1, 1,
0.8381001, 0.3840748, 1.961246, 0.9568627, 0, 1, 1,
0.8407531, -1.612334, 2.341653, 0.9607843, 0, 1, 1,
0.8414617, -1.236318, 2.850314, 0.9686275, 0, 1, 1,
0.8429996, 0.831735, 0.6646805, 0.972549, 0, 1, 1,
0.8487743, 0.9878696, -0.6837385, 0.9803922, 0, 1, 1,
0.8528594, -1.256365, 3.038209, 0.9843137, 0, 1, 1,
0.8529614, 0.5254024, 1.401015, 0.9921569, 0, 1, 1,
0.8562598, -0.7110018, 1.426554, 0.9960784, 0, 1, 1,
0.8589703, -0.4403851, 3.069376, 1, 0, 0.9960784, 1,
0.8592803, 0.7599694, 0.5184331, 1, 0, 0.9882353, 1,
0.8623295, -0.6516906, 0.7142398, 1, 0, 0.9843137, 1,
0.8669696, 0.7357301, 1.976748, 1, 0, 0.9764706, 1,
0.8676586, 0.8088163, 0.9218069, 1, 0, 0.972549, 1,
0.8738115, 0.6296962, 2.403692, 1, 0, 0.9647059, 1,
0.8765592, -0.9345278, 1.344237, 1, 0, 0.9607843, 1,
0.8790775, -1.446162, 2.551528, 1, 0, 0.9529412, 1,
0.8840482, 0.544984, 2.413245, 1, 0, 0.9490196, 1,
0.8844962, 0.1784833, 0.221203, 1, 0, 0.9411765, 1,
0.8872302, -1.531356, 2.701423, 1, 0, 0.9372549, 1,
0.8920878, 0.6862079, 0.9354019, 1, 0, 0.9294118, 1,
0.8949642, 1.287626, -0.4687105, 1, 0, 0.9254902, 1,
0.8952313, -0.6134223, 2.706768, 1, 0, 0.9176471, 1,
0.9021077, 0.2482884, 1.145626, 1, 0, 0.9137255, 1,
0.9092903, 1.128489, 1.900247, 1, 0, 0.9058824, 1,
0.9293889, 0.5081951, 1.4205, 1, 0, 0.9019608, 1,
0.9327686, -0.07549262, 0.1995745, 1, 0, 0.8941177, 1,
0.9331981, 1.056895, -0.0967141, 1, 0, 0.8862745, 1,
0.9420098, -2.227131, 1.896363, 1, 0, 0.8823529, 1,
0.9423905, 0.3009208, 0.5432259, 1, 0, 0.8745098, 1,
0.9430729, -1.599686, 3.912155, 1, 0, 0.8705882, 1,
0.9540247, 1.362439, -0.1592042, 1, 0, 0.8627451, 1,
0.9601169, -0.6340925, 2.990442, 1, 0, 0.8588235, 1,
0.9645502, -0.0575599, 0.7064936, 1, 0, 0.8509804, 1,
0.9720857, -1.178233, 2.234635, 1, 0, 0.8470588, 1,
0.981251, 0.05653001, 2.496702, 1, 0, 0.8392157, 1,
1.000053, 0.4514998, 3.051239, 1, 0, 0.8352941, 1,
1.004174, -0.1407261, 0.8336933, 1, 0, 0.827451, 1,
1.004592, -0.5007798, 3.315816, 1, 0, 0.8235294, 1,
1.014152, -1.376382, 2.433906, 1, 0, 0.8156863, 1,
1.014577, -0.01895596, 1.950663, 1, 0, 0.8117647, 1,
1.020163, -0.04309375, 2.611313, 1, 0, 0.8039216, 1,
1.023004, 0.3181369, -0.4667737, 1, 0, 0.7960784, 1,
1.023738, -1.021291, 0.9848492, 1, 0, 0.7921569, 1,
1.026009, -0.006273326, 0.450931, 1, 0, 0.7843137, 1,
1.034581, 1.170235, 0.6408212, 1, 0, 0.7803922, 1,
1.035363, -0.1641197, 0.1254772, 1, 0, 0.772549, 1,
1.043381, 0.978861, 1.388217, 1, 0, 0.7686275, 1,
1.044112, -1.216652, 3.531959, 1, 0, 0.7607843, 1,
1.046977, -0.1837994, 2.369479, 1, 0, 0.7568628, 1,
1.052475, -0.2590941, 0.07488812, 1, 0, 0.7490196, 1,
1.056882, 0.3957849, -0.1454718, 1, 0, 0.7450981, 1,
1.057551, -0.4389328, 2.248006, 1, 0, 0.7372549, 1,
1.059342, -0.4045776, 1.262998, 1, 0, 0.7333333, 1,
1.061051, -0.205571, 2.279907, 1, 0, 0.7254902, 1,
1.066634, -0.07401499, 1.573603, 1, 0, 0.7215686, 1,
1.068099, 0.8581814, 1.684765, 1, 0, 0.7137255, 1,
1.072563, 0.8812822, -0.1123022, 1, 0, 0.7098039, 1,
1.090821, -1.916702, 3.681064, 1, 0, 0.7019608, 1,
1.09294, -2.753167, 3.63291, 1, 0, 0.6941177, 1,
1.11334, 0.3275352, 0.685779, 1, 0, 0.6901961, 1,
1.117416, -0.01845175, 3.700124, 1, 0, 0.682353, 1,
1.117559, -1.26738, 2.934163, 1, 0, 0.6784314, 1,
1.126834, 0.8709256, 1.312341, 1, 0, 0.6705883, 1,
1.137001, 0.3413831, 1.9132, 1, 0, 0.6666667, 1,
1.149698, 2.098025, 1.536815, 1, 0, 0.6588235, 1,
1.160493, -0.9777366, 1.934962, 1, 0, 0.654902, 1,
1.163721, 1.544972, 0.6939538, 1, 0, 0.6470588, 1,
1.164033, -0.3219551, 1.451782, 1, 0, 0.6431373, 1,
1.16623, 1.402544, 0.8919895, 1, 0, 0.6352941, 1,
1.168168, 1.384175, -0.1346831, 1, 0, 0.6313726, 1,
1.17109, -1.190679, 0.4529499, 1, 0, 0.6235294, 1,
1.175539, -1.315851, 2.55865, 1, 0, 0.6196079, 1,
1.179198, 1.293963, 1.027452, 1, 0, 0.6117647, 1,
1.183069, 1.028762, 0.3421132, 1, 0, 0.6078432, 1,
1.185116, 1.710074, 0.721499, 1, 0, 0.6, 1,
1.187442, -0.1800862, 0.87527, 1, 0, 0.5921569, 1,
1.196986, 0.9600323, -0.1819593, 1, 0, 0.5882353, 1,
1.200129, 0.5146554, 0.04576094, 1, 0, 0.5803922, 1,
1.200152, 0.2235063, 1.602539, 1, 0, 0.5764706, 1,
1.206207, 2.303065, -0.5728354, 1, 0, 0.5686275, 1,
1.209201, -0.03938745, 1.146563, 1, 0, 0.5647059, 1,
1.209986, 0.4711935, 1.038578, 1, 0, 0.5568628, 1,
1.227864, -0.5143545, 2.07376, 1, 0, 0.5529412, 1,
1.23575, 0.7237795, 0.228106, 1, 0, 0.5450981, 1,
1.254468, -0.493295, 2.984149, 1, 0, 0.5411765, 1,
1.255017, -0.02405495, 1.574687, 1, 0, 0.5333334, 1,
1.257595, 0.4818084, 2.600486, 1, 0, 0.5294118, 1,
1.258256, -0.3967172, 1.947546, 1, 0, 0.5215687, 1,
1.273011, -1.269788, 0.7660624, 1, 0, 0.5176471, 1,
1.286704, 0.6851219, 1.641218, 1, 0, 0.509804, 1,
1.295813, -0.05492293, 2.810873, 1, 0, 0.5058824, 1,
1.295973, 1.130863, 0.5591775, 1, 0, 0.4980392, 1,
1.308431, 0.329089, 4.270958, 1, 0, 0.4901961, 1,
1.309367, 0.1170316, 1.259384, 1, 0, 0.4862745, 1,
1.319432, -0.2236807, 2.654792, 1, 0, 0.4784314, 1,
1.32811, -1.269284, 2.196416, 1, 0, 0.4745098, 1,
1.336609, -0.8320246, 2.224344, 1, 0, 0.4666667, 1,
1.337382, -1.130003, 2.038845, 1, 0, 0.4627451, 1,
1.353537, 0.06193294, -0.2264971, 1, 0, 0.454902, 1,
1.359121, -0.2815529, 1.554271, 1, 0, 0.4509804, 1,
1.379509, 0.8663738, 2.114973, 1, 0, 0.4431373, 1,
1.406986, -0.335274, 4.505494, 1, 0, 0.4392157, 1,
1.426535, 1.346241, 0.8239221, 1, 0, 0.4313726, 1,
1.430541, 0.8959206, 0.3146736, 1, 0, 0.427451, 1,
1.441869, -0.74019, 1.943919, 1, 0, 0.4196078, 1,
1.444279, -1.231421, 2.69987, 1, 0, 0.4156863, 1,
1.44956, 0.4465367, 0.3699058, 1, 0, 0.4078431, 1,
1.457814, 1.735845, -0.006046813, 1, 0, 0.4039216, 1,
1.461425, 0.08858532, 1.674642, 1, 0, 0.3960784, 1,
1.468624, -0.7631654, 1.832435, 1, 0, 0.3882353, 1,
1.472479, -1.270374, 2.637087, 1, 0, 0.3843137, 1,
1.475782, 0.2089229, 3.040851, 1, 0, 0.3764706, 1,
1.478142, 0.7331274, 0.8317717, 1, 0, 0.372549, 1,
1.479169, -2.938996, 4.312815, 1, 0, 0.3647059, 1,
1.486506, -0.1434748, 1.410935, 1, 0, 0.3607843, 1,
1.499661, 0.8664382, 1.211904, 1, 0, 0.3529412, 1,
1.507275, -0.2343719, 1.285618, 1, 0, 0.3490196, 1,
1.533219, 0.2250215, 2.36733, 1, 0, 0.3411765, 1,
1.53635, 0.330783, -0.2948264, 1, 0, 0.3372549, 1,
1.543434, -0.5573716, 2.47506, 1, 0, 0.3294118, 1,
1.546106, -1.698107, 2.69491, 1, 0, 0.3254902, 1,
1.56338, 0.5768661, 0.851616, 1, 0, 0.3176471, 1,
1.564468, -0.1725959, 1.48561, 1, 0, 0.3137255, 1,
1.565619, -1.50893, 1.025904, 1, 0, 0.3058824, 1,
1.57667, 0.6118904, 0.652181, 1, 0, 0.2980392, 1,
1.585153, 0.8347359, 1.081432, 1, 0, 0.2941177, 1,
1.587723, -0.7591347, 1.853699, 1, 0, 0.2862745, 1,
1.588361, -0.1253956, 0.6320252, 1, 0, 0.282353, 1,
1.611127, -0.6807868, 1.614692, 1, 0, 0.2745098, 1,
1.656522, -0.7098759, 2.919462, 1, 0, 0.2705882, 1,
1.683699, -0.5556769, 1.634404, 1, 0, 0.2627451, 1,
1.686647, -0.5804558, 4.408682, 1, 0, 0.2588235, 1,
1.693606, 0.1599551, 1.17898, 1, 0, 0.2509804, 1,
1.698972, 0.7686412, 1.648873, 1, 0, 0.2470588, 1,
1.740596, -2.477924, 2.745081, 1, 0, 0.2392157, 1,
1.76039, -0.8450209, 0.979619, 1, 0, 0.2352941, 1,
1.764902, 0.1725296, 1.01965, 1, 0, 0.227451, 1,
1.7653, -0.6237056, 0.9586369, 1, 0, 0.2235294, 1,
1.80283, 0.2128086, 0.7345068, 1, 0, 0.2156863, 1,
1.845327, 0.3469171, -0.0288801, 1, 0, 0.2117647, 1,
1.865721, 0.8637378, 0.9067251, 1, 0, 0.2039216, 1,
1.868805, 0.05243007, 0.7044085, 1, 0, 0.1960784, 1,
1.872705, 1.854167, 3.095564, 1, 0, 0.1921569, 1,
1.874621, -1.565009, 3.228394, 1, 0, 0.1843137, 1,
1.902989, -1.55338, 3.555815, 1, 0, 0.1803922, 1,
1.913454, 0.06117974, 1.110258, 1, 0, 0.172549, 1,
1.929916, -0.3964987, 2.267875, 1, 0, 0.1686275, 1,
1.940466, 0.04525768, 2.978131, 1, 0, 0.1607843, 1,
1.952218, 1.127092, -0.003328728, 1, 0, 0.1568628, 1,
1.981106, -1.724613, 2.261251, 1, 0, 0.1490196, 1,
2.023351, 0.1656591, 2.249631, 1, 0, 0.145098, 1,
2.105826, 1.02469, 0.7438019, 1, 0, 0.1372549, 1,
2.111777, -0.2182532, 1.228867, 1, 0, 0.1333333, 1,
2.130441, -1.683633, 3.001638, 1, 0, 0.1254902, 1,
2.142028, 0.8448019, 0.8886277, 1, 0, 0.1215686, 1,
2.18856, -1.297616, 1.626492, 1, 0, 0.1137255, 1,
2.19083, -1.615543, 2.042387, 1, 0, 0.1098039, 1,
2.198557, 0.9289225, 0.7423494, 1, 0, 0.1019608, 1,
2.227128, 0.4524242, 2.256666, 1, 0, 0.09411765, 1,
2.23517, -1.011652, 3.371258, 1, 0, 0.09019608, 1,
2.261144, 0.01609075, 1.077652, 1, 0, 0.08235294, 1,
2.285619, -0.6434356, 1.287015, 1, 0, 0.07843138, 1,
2.399283, 0.8371557, 1.213702, 1, 0, 0.07058824, 1,
2.437793, -0.01044027, 1.134718, 1, 0, 0.06666667, 1,
2.47509, 1.81215, 1.292713, 1, 0, 0.05882353, 1,
2.49188, -0.28427, 1.732818, 1, 0, 0.05490196, 1,
2.497895, 0.3953543, 1.201653, 1, 0, 0.04705882, 1,
2.570413, -1.35378, 2.58388, 1, 0, 0.04313726, 1,
2.578906, 0.3093525, 0.9856319, 1, 0, 0.03529412, 1,
2.730648, -0.4018431, 1.008966, 1, 0, 0.03137255, 1,
2.776953, 1.330429, 1.483827, 1, 0, 0.02352941, 1,
2.814786, 1.285563, 0.3939225, 1, 0, 0.01960784, 1,
3.10377, 0.03500273, 0.646994, 1, 0, 0.01176471, 1,
3.318211, 0.4603589, 0.7542397, 1, 0, 0.007843138, 1
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
0.05222726, -3.95573, -7.721622, 0, -0.5, 0.5, 0.5,
0.05222726, -3.95573, -7.721622, 1, -0.5, 0.5, 0.5,
0.05222726, -3.95573, -7.721622, 1, 1.5, 0.5, 0.5,
0.05222726, -3.95573, -7.721622, 0, 1.5, 0.5, 0.5
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
-4.320925, 0.06021798, -7.721622, 0, -0.5, 0.5, 0.5,
-4.320925, 0.06021798, -7.721622, 1, -0.5, 0.5, 0.5,
-4.320925, 0.06021798, -7.721622, 1, 1.5, 0.5, 0.5,
-4.320925, 0.06021798, -7.721622, 0, 1.5, 0.5, 0.5
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
-4.320925, -3.95573, 0.01761556, 0, -0.5, 0.5, 0.5,
-4.320925, -3.95573, 0.01761556, 1, -0.5, 0.5, 0.5,
-4.320925, -3.95573, 0.01761556, 1, 1.5, 0.5, 0.5,
-4.320925, -3.95573, 0.01761556, 0, 1.5, 0.5, 0.5
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
-3, -3.028972, -5.935644,
3, -3.028972, -5.935644,
-3, -3.028972, -5.935644,
-3, -3.183432, -6.233307,
-2, -3.028972, -5.935644,
-2, -3.183432, -6.233307,
-1, -3.028972, -5.935644,
-1, -3.183432, -6.233307,
0, -3.028972, -5.935644,
0, -3.183432, -6.233307,
1, -3.028972, -5.935644,
1, -3.183432, -6.233307,
2, -3.028972, -5.935644,
2, -3.183432, -6.233307,
3, -3.028972, -5.935644,
3, -3.183432, -6.233307
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
-3, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
-3, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
-3, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
-3, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
-2, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
-2, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
-2, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
-2, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
-1, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
-1, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
-1, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
-1, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
0, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
0, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
0, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
0, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
1, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
1, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
1, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
1, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
2, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
2, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
2, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
2, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5,
3, -3.492351, -6.828633, 0, -0.5, 0.5, 0.5,
3, -3.492351, -6.828633, 1, -0.5, 0.5, 0.5,
3, -3.492351, -6.828633, 1, 1.5, 0.5, 0.5,
3, -3.492351, -6.828633, 0, 1.5, 0.5, 0.5
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
-3.311736, -2, -5.935644,
-3.311736, 3, -5.935644,
-3.311736, -2, -5.935644,
-3.479934, -2, -6.233307,
-3.311736, -1, -5.935644,
-3.479934, -1, -6.233307,
-3.311736, 0, -5.935644,
-3.479934, 0, -6.233307,
-3.311736, 1, -5.935644,
-3.479934, 1, -6.233307,
-3.311736, 2, -5.935644,
-3.479934, 2, -6.233307,
-3.311736, 3, -5.935644,
-3.479934, 3, -6.233307
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
-3.81633, -2, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, -2, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, -2, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, -2, -6.828633, 0, 1.5, 0.5, 0.5,
-3.81633, -1, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, -1, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, -1, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, -1, -6.828633, 0, 1.5, 0.5, 0.5,
-3.81633, 0, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, 0, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, 0, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, 0, -6.828633, 0, 1.5, 0.5, 0.5,
-3.81633, 1, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, 1, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, 1, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, 1, -6.828633, 0, 1.5, 0.5, 0.5,
-3.81633, 2, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, 2, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, 2, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, 2, -6.828633, 0, 1.5, 0.5, 0.5,
-3.81633, 3, -6.828633, 0, -0.5, 0.5, 0.5,
-3.81633, 3, -6.828633, 1, -0.5, 0.5, 0.5,
-3.81633, 3, -6.828633, 1, 1.5, 0.5, 0.5,
-3.81633, 3, -6.828633, 0, 1.5, 0.5, 0.5
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
-3.311736, -3.028972, -4,
-3.311736, -3.028972, 4,
-3.311736, -3.028972, -4,
-3.479934, -3.183432, -4,
-3.311736, -3.028972, -2,
-3.479934, -3.183432, -2,
-3.311736, -3.028972, 0,
-3.479934, -3.183432, 0,
-3.311736, -3.028972, 2,
-3.479934, -3.183432, 2,
-3.311736, -3.028972, 4,
-3.479934, -3.183432, 4
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
-3.81633, -3.492351, -4, 0, -0.5, 0.5, 0.5,
-3.81633, -3.492351, -4, 1, -0.5, 0.5, 0.5,
-3.81633, -3.492351, -4, 1, 1.5, 0.5, 0.5,
-3.81633, -3.492351, -4, 0, 1.5, 0.5, 0.5,
-3.81633, -3.492351, -2, 0, -0.5, 0.5, 0.5,
-3.81633, -3.492351, -2, 1, -0.5, 0.5, 0.5,
-3.81633, -3.492351, -2, 1, 1.5, 0.5, 0.5,
-3.81633, -3.492351, -2, 0, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 0, 0, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 0, 1, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 0, 1, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 0, 0, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 2, 0, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 2, 1, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 2, 1, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 2, 0, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 4, 0, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 4, 1, -0.5, 0.5, 0.5,
-3.81633, -3.492351, 4, 1, 1.5, 0.5, 0.5,
-3.81633, -3.492351, 4, 0, 1.5, 0.5, 0.5
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
-3.311736, -3.028972, -5.935644,
-3.311736, 3.149408, -5.935644,
-3.311736, -3.028972, 5.970875,
-3.311736, 3.149408, 5.970875,
-3.311736, -3.028972, -5.935644,
-3.311736, -3.028972, 5.970875,
-3.311736, 3.149408, -5.935644,
-3.311736, 3.149408, 5.970875,
-3.311736, -3.028972, -5.935644,
3.41619, -3.028972, -5.935644,
-3.311736, -3.028972, 5.970875,
3.41619, -3.028972, 5.970875,
-3.311736, 3.149408, -5.935644,
3.41619, 3.149408, -5.935644,
-3.311736, 3.149408, 5.970875,
3.41619, 3.149408, 5.970875,
3.41619, -3.028972, -5.935644,
3.41619, 3.149408, -5.935644,
3.41619, -3.028972, 5.970875,
3.41619, 3.149408, 5.970875,
3.41619, -3.028972, -5.935644,
3.41619, -3.028972, 5.970875,
3.41619, 3.149408, -5.935644,
3.41619, 3.149408, 5.970875
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
var radius = 8.013314;
var distance = 35.65214;
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
mvMatrix.translate( -0.05222726, -0.06021798, -0.01761556 );
mvMatrix.scale( 1.287789, 1.402334, 0.7276813 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65214);
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
Antor<-read.table("Antor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Antor$V2
```

```
## Error in eval(expr, envir, enclos): object 'Antor' not found
```

```r
y<-Antor$V3
```

```
## Error in eval(expr, envir, enclos): object 'Antor' not found
```

```r
z<-Antor$V4
```

```
## Error in eval(expr, envir, enclos): object 'Antor' not found
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
-3.213756, 0.1996185, -0.5942369, 0, 0, 1, 1, 1,
-3.208162, -0.4627355, -0.4401529, 1, 0, 0, 1, 1,
-2.846302, 1.51696, -0.3830597, 1, 0, 0, 1, 1,
-2.821879, -1.223686, -1.583055, 1, 0, 0, 1, 1,
-2.630931, 0.5265644, -1.746297, 1, 0, 0, 1, 1,
-2.610276, 0.4018627, -1.468744, 1, 0, 0, 1, 1,
-2.594783, -0.5022525, -3.464687, 0, 0, 0, 1, 1,
-2.518786, 2.240589, -1.83643, 0, 0, 0, 1, 1,
-2.483146, 0.5587154, -1.222688, 0, 0, 0, 1, 1,
-2.479201, 0.7884049, -2.048154, 0, 0, 0, 1, 1,
-2.429516, -0.6908905, -0.6662313, 0, 0, 0, 1, 1,
-2.401739, -1.949365, 0.385149, 0, 0, 0, 1, 1,
-2.38097, 1.21087, -0.8707236, 0, 0, 0, 1, 1,
-2.373785, 0.281092, -2.258996, 1, 1, 1, 1, 1,
-2.362711, -0.4256373, -3.32035, 1, 1, 1, 1, 1,
-2.25538, 0.9058766, -2.266158, 1, 1, 1, 1, 1,
-2.240749, 1.115021, -0.1043777, 1, 1, 1, 1, 1,
-2.198784, -1.40592, -3.271085, 1, 1, 1, 1, 1,
-2.182834, 2.557605, -0.5258964, 1, 1, 1, 1, 1,
-2.106124, 2.270253, -0.8160012, 1, 1, 1, 1, 1,
-2.057806, 0.3993914, 0.9377691, 1, 1, 1, 1, 1,
-2.017969, 0.6661735, -0.177755, 1, 1, 1, 1, 1,
-2.008422, -0.002572096, -2.369851, 1, 1, 1, 1, 1,
-1.996702, 0.2554159, -1.088427, 1, 1, 1, 1, 1,
-1.978294, 0.9016822, -1.813977, 1, 1, 1, 1, 1,
-1.952668, -0.7944581, -2.340305, 1, 1, 1, 1, 1,
-1.917534, 0.2975248, -0.2596154, 1, 1, 1, 1, 1,
-1.855942, -1.651222, -0.4280365, 1, 1, 1, 1, 1,
-1.854615, -0.4592531, -1.482031, 0, 0, 1, 1, 1,
-1.853482, -0.8204125, -1.833822, 1, 0, 0, 1, 1,
-1.849484, 0.5843595, -1.68676, 1, 0, 0, 1, 1,
-1.82842, -0.8261039, -2.449796, 1, 0, 0, 1, 1,
-1.825651, 0.3513661, -0.7699018, 1, 0, 0, 1, 1,
-1.82542, -0.6860265, -3.076282, 1, 0, 0, 1, 1,
-1.79912, -2.277236, -4.498002, 0, 0, 0, 1, 1,
-1.781693, 1.179041, -0.9100495, 0, 0, 0, 1, 1,
-1.779129, -1.253313, -2.462053, 0, 0, 0, 1, 1,
-1.775823, -1.066, -3.10088, 0, 0, 0, 1, 1,
-1.770014, -0.08898576, -0.8720878, 0, 0, 0, 1, 1,
-1.764117, 0.7379249, -1.076712, 0, 0, 0, 1, 1,
-1.761909, 1.251932, 0.05019366, 0, 0, 0, 1, 1,
-1.760158, 1.528802, -0.1576454, 1, 1, 1, 1, 1,
-1.758351, 2.362443, 0.9835723, 1, 1, 1, 1, 1,
-1.749684, 0.4476393, 0.8987858, 1, 1, 1, 1, 1,
-1.713348, 1.419399, -0.8447309, 1, 1, 1, 1, 1,
-1.71041, -0.7010927, -1.374397, 1, 1, 1, 1, 1,
-1.697453, -0.006643097, -1.462355, 1, 1, 1, 1, 1,
-1.692319, -0.3688517, -2.126552, 1, 1, 1, 1, 1,
-1.687013, -0.7943622, -4.056672, 1, 1, 1, 1, 1,
-1.671815, -0.3013126, -1.742111, 1, 1, 1, 1, 1,
-1.664895, -0.8393815, -2.07954, 1, 1, 1, 1, 1,
-1.662013, 0.1658908, -2.132804, 1, 1, 1, 1, 1,
-1.632983, -1.212745, -1.631065, 1, 1, 1, 1, 1,
-1.626858, -0.8918497, -0.711532, 1, 1, 1, 1, 1,
-1.618917, 1.054021, -0.617204, 1, 1, 1, 1, 1,
-1.615752, -0.05424091, -1.860669, 1, 1, 1, 1, 1,
-1.610653, 0.729915, -2.886714, 0, 0, 1, 1, 1,
-1.602311, -0.3757766, -0.3543588, 1, 0, 0, 1, 1,
-1.593694, -0.5060182, -2.680613, 1, 0, 0, 1, 1,
-1.582811, -0.3733205, 0.1326906, 1, 0, 0, 1, 1,
-1.574494, 0.6618801, -1.818437, 1, 0, 0, 1, 1,
-1.571172, -0.3068728, -2.410275, 1, 0, 0, 1, 1,
-1.570541, -0.2605091, -2.649584, 0, 0, 0, 1, 1,
-1.561345, -0.6464428, -1.911179, 0, 0, 0, 1, 1,
-1.5605, -1.070186, -2.51614, 0, 0, 0, 1, 1,
-1.558342, 0.8603296, -0.86924, 0, 0, 0, 1, 1,
-1.554054, -1.235231, -2.325658, 0, 0, 0, 1, 1,
-1.552744, 0.384513, -1.773656, 0, 0, 0, 1, 1,
-1.549404, 0.7789344, -0.1169771, 0, 0, 0, 1, 1,
-1.537584, 1.602478, -1.464673, 1, 1, 1, 1, 1,
-1.530397, -1.350839, -1.711862, 1, 1, 1, 1, 1,
-1.482782, -1.072748, -1.909826, 1, 1, 1, 1, 1,
-1.482658, -0.6529494, -1.203792, 1, 1, 1, 1, 1,
-1.460567, 1.327569, -0.4636486, 1, 1, 1, 1, 1,
-1.458712, 1.982674, -0.1728697, 1, 1, 1, 1, 1,
-1.45699, -0.08197916, -0.6988497, 1, 1, 1, 1, 1,
-1.456435, 0.02941984, -1.569845, 1, 1, 1, 1, 1,
-1.454454, -0.2370261, -2.149237, 1, 1, 1, 1, 1,
-1.452102, -0.1151074, -2.64974, 1, 1, 1, 1, 1,
-1.442405, 0.3304726, -2.294244, 1, 1, 1, 1, 1,
-1.429072, 0.1211771, -1.439191, 1, 1, 1, 1, 1,
-1.427459, 0.7273461, -1.197327, 1, 1, 1, 1, 1,
-1.42689, -0.2100175, -2.897364, 1, 1, 1, 1, 1,
-1.423657, -0.3001243, -2.807544, 1, 1, 1, 1, 1,
-1.417138, -0.4163484, -1.613679, 0, 0, 1, 1, 1,
-1.413312, -0.6286227, -2.454192, 1, 0, 0, 1, 1,
-1.39936, 2.237787, -1.265936, 1, 0, 0, 1, 1,
-1.397448, 1.783848, -1.276149, 1, 0, 0, 1, 1,
-1.384623, 1.335476, -1.951839, 1, 0, 0, 1, 1,
-1.37622, 1.300666, 0.3916285, 1, 0, 0, 1, 1,
-1.371464, 1.086256, 0.4090473, 0, 0, 0, 1, 1,
-1.368405, -0.8883069, -3.809382, 0, 0, 0, 1, 1,
-1.35851, 0.1284924, -1.238088, 0, 0, 0, 1, 1,
-1.356276, -2.216024, -1.659961, 0, 0, 0, 1, 1,
-1.356172, -0.680958, -2.603043, 0, 0, 0, 1, 1,
-1.355906, -1.947227, -3.053214, 0, 0, 0, 1, 1,
-1.352921, -1.29096, -2.120933, 0, 0, 0, 1, 1,
-1.348261, 1.81556, 0.3246751, 1, 1, 1, 1, 1,
-1.34774, 0.8973823, -1.09227, 1, 1, 1, 1, 1,
-1.341982, -0.4897167, -0.4181589, 1, 1, 1, 1, 1,
-1.341601, -2.277502, -2.507455, 1, 1, 1, 1, 1,
-1.340799, 1.576096, -0.1968745, 1, 1, 1, 1, 1,
-1.339137, 0.4148898, -4.584513, 1, 1, 1, 1, 1,
-1.330872, 1.296835, -0.6082842, 1, 1, 1, 1, 1,
-1.330486, -0.9356067, -2.094731, 1, 1, 1, 1, 1,
-1.314604, 0.4037229, -3.021083, 1, 1, 1, 1, 1,
-1.306867, -1.322767, 0.7552041, 1, 1, 1, 1, 1,
-1.300334, -0.5995305, -1.754102, 1, 1, 1, 1, 1,
-1.293993, 0.4045165, -2.609741, 1, 1, 1, 1, 1,
-1.281255, 0.3339106, -1.358466, 1, 1, 1, 1, 1,
-1.277395, 0.4160347, -1.714649, 1, 1, 1, 1, 1,
-1.275849, 1.127887, -0.4164835, 1, 1, 1, 1, 1,
-1.266351, 0.5356385, -1.268935, 0, 0, 1, 1, 1,
-1.26301, 0.1117411, -1.385028, 1, 0, 0, 1, 1,
-1.252452, 2.070212, -0.8984063, 1, 0, 0, 1, 1,
-1.248899, -1.677606, -2.73912, 1, 0, 0, 1, 1,
-1.241837, 2.423705, -0.3928947, 1, 0, 0, 1, 1,
-1.23792, -0.3238455, -2.303382, 1, 0, 0, 1, 1,
-1.237912, 0.08367556, -5.762248, 0, 0, 0, 1, 1,
-1.234666, -0.9170595, -2.215238, 0, 0, 0, 1, 1,
-1.219641, 0.678428, -1.233461, 0, 0, 0, 1, 1,
-1.218419, -0.6419414, -3.215923, 0, 0, 0, 1, 1,
-1.217756, 1.098134, 0.4616355, 0, 0, 0, 1, 1,
-1.202914, 0.3323138, -2.324068, 0, 0, 0, 1, 1,
-1.198321, -0.2059912, -2.183034, 0, 0, 0, 1, 1,
-1.196987, -0.9496304, -4.013719, 1, 1, 1, 1, 1,
-1.195307, 0.6075889, -1.465406, 1, 1, 1, 1, 1,
-1.176222, 0.07221051, -2.481052, 1, 1, 1, 1, 1,
-1.163247, 0.932924, -0.6195261, 1, 1, 1, 1, 1,
-1.158888, 0.9221361, -0.3165398, 1, 1, 1, 1, 1,
-1.155939, 0.6842198, 0.06235405, 1, 1, 1, 1, 1,
-1.154887, -0.5271385, -1.896684, 1, 1, 1, 1, 1,
-1.15062, 0.08412685, -1.304069, 1, 1, 1, 1, 1,
-1.143256, 1.048213, -1.301652, 1, 1, 1, 1, 1,
-1.14121, -0.6987409, -0.8120119, 1, 1, 1, 1, 1,
-1.138953, 0.1338116, 0.2323153, 1, 1, 1, 1, 1,
-1.131498, 0.8722603, -0.2199174, 1, 1, 1, 1, 1,
-1.130723, 0.6715391, -2.544138, 1, 1, 1, 1, 1,
-1.126441, 0.7960704, -1.034264, 1, 1, 1, 1, 1,
-1.121881, -0.8975064, -1.689357, 1, 1, 1, 1, 1,
-1.118915, -0.7107579, -2.247712, 0, 0, 1, 1, 1,
-1.108345, -1.45374, -0.1399468, 1, 0, 0, 1, 1,
-1.105987, -1.483398, -0.8846294, 1, 0, 0, 1, 1,
-1.100997, 0.812082, -2.746809, 1, 0, 0, 1, 1,
-1.091521, -0.2607516, 0.05109872, 1, 0, 0, 1, 1,
-1.085836, 0.8273103, -0.879788, 1, 0, 0, 1, 1,
-1.067322, -0.1378563, -0.8374107, 0, 0, 0, 1, 1,
-1.063965, -0.242396, -1.447515, 0, 0, 0, 1, 1,
-1.05803, -0.6361943, -2.621777, 0, 0, 0, 1, 1,
-1.052964, -0.76508, -0.3171622, 0, 0, 0, 1, 1,
-1.050589, -1.560567, -2.649434, 0, 0, 0, 1, 1,
-1.047676, -2.244359, -2.373268, 0, 0, 0, 1, 1,
-1.044213, 0.1423481, 0.8465695, 0, 0, 0, 1, 1,
-1.039829, 0.488463, 0.3892252, 1, 1, 1, 1, 1,
-1.037331, 1.063086, -2.306764, 1, 1, 1, 1, 1,
-1.035676, 0.8459237, 0.01698638, 1, 1, 1, 1, 1,
-1.031423, 1.178148, -0.006529035, 1, 1, 1, 1, 1,
-1.028374, 1.504694, -0.09831929, 1, 1, 1, 1, 1,
-1.027164, 0.8859941, 0.4789119, 1, 1, 1, 1, 1,
-1.024818, -0.5515637, -3.017937, 1, 1, 1, 1, 1,
-1.024736, -0.8371619, -3.866568, 1, 1, 1, 1, 1,
-1.018168, 1.625118, -0.9114299, 1, 1, 1, 1, 1,
-1.001536, 0.07848027, -1.387727, 1, 1, 1, 1, 1,
-0.9952434, -0.8938007, -2.959437, 1, 1, 1, 1, 1,
-0.9879233, 0.7802181, -0.1727583, 1, 1, 1, 1, 1,
-0.9870897, 0.1962449, -2.776402, 1, 1, 1, 1, 1,
-0.9863114, 0.6313436, -1.04918, 1, 1, 1, 1, 1,
-0.9858505, 0.459301, -1.681186, 1, 1, 1, 1, 1,
-0.9685272, -0.5985326, -0.8610926, 0, 0, 1, 1, 1,
-0.9658698, -0.2321324, -1.040396, 1, 0, 0, 1, 1,
-0.9611182, -0.7242557, -3.729566, 1, 0, 0, 1, 1,
-0.9593909, -0.496476, -0.9199126, 1, 0, 0, 1, 1,
-0.9589713, 0.8590229, -1.229426, 1, 0, 0, 1, 1,
-0.950839, 1.558727, 0.3978242, 1, 0, 0, 1, 1,
-0.9472596, 0.9393403, -1.567919, 0, 0, 0, 1, 1,
-0.9420002, -0.6403217, -2.515096, 0, 0, 0, 1, 1,
-0.9345154, -0.2706073, -1.240191, 0, 0, 0, 1, 1,
-0.9304398, -1.082065, -2.914045, 0, 0, 0, 1, 1,
-0.9276746, 0.2322403, -0.438951, 0, 0, 0, 1, 1,
-0.9215958, 0.244086, -0.3134261, 0, 0, 0, 1, 1,
-0.9196988, 0.07916067, -1.47474, 0, 0, 0, 1, 1,
-0.9169941, 0.4207661, -0.4490722, 1, 1, 1, 1, 1,
-0.9099367, -0.9269859, -1.027771, 1, 1, 1, 1, 1,
-0.9023904, 0.296727, -3.288607, 1, 1, 1, 1, 1,
-0.9017144, 0.9279275, -2.031856, 1, 1, 1, 1, 1,
-0.8869725, -0.149945, -1.681184, 1, 1, 1, 1, 1,
-0.8778355, -1.857711, -2.356286, 1, 1, 1, 1, 1,
-0.8776215, 1.096975, 1.082544, 1, 1, 1, 1, 1,
-0.8755975, 0.8059592, 0.01619428, 1, 1, 1, 1, 1,
-0.8744596, 1.829065, 0.1625782, 1, 1, 1, 1, 1,
-0.8681175, 1.325436, -0.09153779, 1, 1, 1, 1, 1,
-0.8659557, 0.4752936, -1.275692, 1, 1, 1, 1, 1,
-0.8653829, -0.5294949, -3.437319, 1, 1, 1, 1, 1,
-0.8607101, -1.575555, -2.284284, 1, 1, 1, 1, 1,
-0.8596461, 1.057527, -0.4523724, 1, 1, 1, 1, 1,
-0.8584508, -1.510017, -2.139037, 1, 1, 1, 1, 1,
-0.8555954, 1.537323, -2.281382, 0, 0, 1, 1, 1,
-0.8528797, -0.0606647, -0.3904826, 1, 0, 0, 1, 1,
-0.8487338, 0.3021372, -1.52421, 1, 0, 0, 1, 1,
-0.8430729, -0.8452907, -1.51045, 1, 0, 0, 1, 1,
-0.843049, -0.9192179, -1.565279, 1, 0, 0, 1, 1,
-0.8388166, 0.5892977, -0.6385781, 1, 0, 0, 1, 1,
-0.8271547, -0.02152878, -2.008446, 0, 0, 0, 1, 1,
-0.8225984, 1.0776, 0.9675685, 0, 0, 0, 1, 1,
-0.8212236, 1.820589, -0.5984397, 0, 0, 0, 1, 1,
-0.8132535, 0.2330997, -0.5750429, 0, 0, 0, 1, 1,
-0.8124269, -0.6037685, -2.050472, 0, 0, 0, 1, 1,
-0.8121077, 0.4599439, -1.378384, 0, 0, 0, 1, 1,
-0.8076531, -1.102439, -1.774858, 0, 0, 0, 1, 1,
-0.8071027, -0.6480244, -2.604161, 1, 1, 1, 1, 1,
-0.8070084, -1.125183, -1.748839, 1, 1, 1, 1, 1,
-0.8052651, -0.5418503, -3.508375, 1, 1, 1, 1, 1,
-0.8035571, 1.210083, 0.1202671, 1, 1, 1, 1, 1,
-0.7957849, 0.2777272, 0.5613953, 1, 1, 1, 1, 1,
-0.7900016, 0.7790209, -0.4970625, 1, 1, 1, 1, 1,
-0.7895712, 0.02040515, -1.607059, 1, 1, 1, 1, 1,
-0.7837366, 0.1121273, -0.7193905, 1, 1, 1, 1, 1,
-0.7828788, -0.8717004, -3.007758, 1, 1, 1, 1, 1,
-0.7798303, 0.3137702, -2.194653, 1, 1, 1, 1, 1,
-0.7775712, -0.4441805, -3.350546, 1, 1, 1, 1, 1,
-0.7742379, -1.370292, -3.471289, 1, 1, 1, 1, 1,
-0.7734933, -2.676474, -3.609217, 1, 1, 1, 1, 1,
-0.7692022, 0.583904, 0.3524337, 1, 1, 1, 1, 1,
-0.7578186, 0.3193404, -0.2407615, 1, 1, 1, 1, 1,
-0.7562993, 1.454275, -0.2576983, 0, 0, 1, 1, 1,
-0.7524897, -1.795224, -2.645741, 1, 0, 0, 1, 1,
-0.7512255, 1.567755, -0.1908581, 1, 0, 0, 1, 1,
-0.7506868, 2.6274, -0.3518721, 1, 0, 0, 1, 1,
-0.734955, 0.1527144, -3.460353, 1, 0, 0, 1, 1,
-0.7330087, -0.1780457, -4.70579, 1, 0, 0, 1, 1,
-0.7292874, 0.75075, 0.00277743, 0, 0, 0, 1, 1,
-0.7289218, -0.3064079, -1.488195, 0, 0, 0, 1, 1,
-0.7287019, 0.05916176, -2.705934, 0, 0, 0, 1, 1,
-0.7252468, 0.5555238, -1.309932, 0, 0, 0, 1, 1,
-0.7227268, -1.901219, -2.323741, 0, 0, 0, 1, 1,
-0.7192824, 0.4140816, -1.402323, 0, 0, 0, 1, 1,
-0.7149634, 1.436938, 1.547507, 0, 0, 0, 1, 1,
-0.7137987, -0.3606364, -2.467838, 1, 1, 1, 1, 1,
-0.7122423, -0.6793162, -1.003577, 1, 1, 1, 1, 1,
-0.7120512, -1.260011, -2.893428, 1, 1, 1, 1, 1,
-0.7117497, -0.01088607, -2.501402, 1, 1, 1, 1, 1,
-0.7094426, -0.3698636, -1.080867, 1, 1, 1, 1, 1,
-0.7072279, -0.581326, -0.6494291, 1, 1, 1, 1, 1,
-0.7061539, 0.8238466, 0.6077569, 1, 1, 1, 1, 1,
-0.7051808, -0.454034, -2.562882, 1, 1, 1, 1, 1,
-0.6959391, 1.386617, -0.9896953, 1, 1, 1, 1, 1,
-0.6916167, -0.5964835, -2.192541, 1, 1, 1, 1, 1,
-0.6911284, 1.150385, -0.7155936, 1, 1, 1, 1, 1,
-0.6898811, -0.5951635, -2.626363, 1, 1, 1, 1, 1,
-0.689751, -2.443021, -3.566846, 1, 1, 1, 1, 1,
-0.6887246, -0.3748381, -0.4262934, 1, 1, 1, 1, 1,
-0.6829422, -0.3194935, -1.311853, 1, 1, 1, 1, 1,
-0.682833, -0.3230466, -2.028527, 0, 0, 1, 1, 1,
-0.6730887, -2.087076, -4.031783, 1, 0, 0, 1, 1,
-0.6724024, 0.5890161, -0.2658725, 1, 0, 0, 1, 1,
-0.6718838, 0.8579101, -2.24238, 1, 0, 0, 1, 1,
-0.663904, -0.8200323, -0.5165031, 1, 0, 0, 1, 1,
-0.6570171, 1.345128, -0.1758072, 1, 0, 0, 1, 1,
-0.6524317, -0.9971014, -2.970039, 0, 0, 0, 1, 1,
-0.6483874, -1.050282, -1.56152, 0, 0, 0, 1, 1,
-0.641797, 0.1878154, -0.3948842, 0, 0, 0, 1, 1,
-0.6401144, -0.705853, -2.717496, 0, 0, 0, 1, 1,
-0.6224833, 0.6137149, -1.514645, 0, 0, 0, 1, 1,
-0.6211003, -0.8175532, -1.577185, 0, 0, 0, 1, 1,
-0.6198081, 2.502162, 0.3956585, 0, 0, 0, 1, 1,
-0.6179625, -0.7780463, -2.789789, 1, 1, 1, 1, 1,
-0.6165445, 0.5100767, -1.045271, 1, 1, 1, 1, 1,
-0.6133883, 1.040361, -0.5370185, 1, 1, 1, 1, 1,
-0.6123898, 0.5451664, -0.1929762, 1, 1, 1, 1, 1,
-0.6090454, 0.7049401, 0.6878139, 1, 1, 1, 1, 1,
-0.6086643, 0.03869961, -2.166555, 1, 1, 1, 1, 1,
-0.6076308, -0.2827398, -1.967552, 1, 1, 1, 1, 1,
-0.6048261, -0.5408131, -4.500121, 1, 1, 1, 1, 1,
-0.5991157, -0.3370731, -0.4631635, 1, 1, 1, 1, 1,
-0.5864562, -1.247245, -3.154599, 1, 1, 1, 1, 1,
-0.5855293, -1.087524, -0.4738616, 1, 1, 1, 1, 1,
-0.5796205, 0.9564299, -0.8377257, 1, 1, 1, 1, 1,
-0.5696234, 0.2330354, -0.5184454, 1, 1, 1, 1, 1,
-0.5668197, 0.5998652, -0.6978542, 1, 1, 1, 1, 1,
-0.5667399, -1.749179, -2.788259, 1, 1, 1, 1, 1,
-0.5618238, 0.7639138, -0.9954351, 0, 0, 1, 1, 1,
-0.5604613, -0.7591622, -3.088258, 1, 0, 0, 1, 1,
-0.5602419, -1.220428, -4.115911, 1, 0, 0, 1, 1,
-0.5572407, -0.1258783, -0.7894415, 1, 0, 0, 1, 1,
-0.5512908, 0.9765797, -0.4994229, 1, 0, 0, 1, 1,
-0.5495431, 0.8755754, 0.04979025, 1, 0, 0, 1, 1,
-0.5491376, 0.4591202, -0.05585199, 0, 0, 0, 1, 1,
-0.5488687, -0.3625163, -3.352816, 0, 0, 0, 1, 1,
-0.5475243, 0.4335706, 0.02375028, 0, 0, 0, 1, 1,
-0.5443906, -0.6922757, -2.547907, 0, 0, 0, 1, 1,
-0.5436965, -0.004525385, -2.368012, 0, 0, 0, 1, 1,
-0.5423706, -0.6582052, -3.346866, 0, 0, 0, 1, 1,
-0.5401619, 1.490871, -1.471843, 0, 0, 0, 1, 1,
-0.5398735, -0.3368461, -2.49171, 1, 1, 1, 1, 1,
-0.5368502, 0.9520974, 0.2196701, 1, 1, 1, 1, 1,
-0.5365563, 0.3179417, -1.037981, 1, 1, 1, 1, 1,
-0.5356859, -1.422489, -2.495016, 1, 1, 1, 1, 1,
-0.5309847, 0.06771622, -0.6405094, 1, 1, 1, 1, 1,
-0.5306773, -2.386745, -4.60859, 1, 1, 1, 1, 1,
-0.526798, -0.9520615, -4.598644, 1, 1, 1, 1, 1,
-0.5192474, 0.5288702, -1.860759, 1, 1, 1, 1, 1,
-0.5131707, -0.439508, -3.149913, 1, 1, 1, 1, 1,
-0.5129452, 0.2970975, -1.501676, 1, 1, 1, 1, 1,
-0.5114087, 1.07072, 0.7543801, 1, 1, 1, 1, 1,
-0.5093931, 2.900606, -1.665377, 1, 1, 1, 1, 1,
-0.5062785, 0.990352, 0.2251464, 1, 1, 1, 1, 1,
-0.504795, -1.645202, -3.113569, 1, 1, 1, 1, 1,
-0.5042605, 0.465467, -0.2027364, 1, 1, 1, 1, 1,
-0.5038384, -0.05734364, 0.05964012, 0, 0, 1, 1, 1,
-0.5021605, 1.393187, -2.26579, 1, 0, 0, 1, 1,
-0.4951729, 0.8963919, -0.6586475, 1, 0, 0, 1, 1,
-0.4949359, -0.4063883, -1.772936, 1, 0, 0, 1, 1,
-0.4904238, 0.431573, -1.249726, 1, 0, 0, 1, 1,
-0.4864563, -0.2317634, -1.671439, 1, 0, 0, 1, 1,
-0.4828779, 0.9310365, 0.2494079, 0, 0, 0, 1, 1,
-0.4821874, 0.1665103, -1.80416, 0, 0, 0, 1, 1,
-0.4800442, -1.07108, -3.504581, 0, 0, 0, 1, 1,
-0.4791418, -0.7386515, -2.967215, 0, 0, 0, 1, 1,
-0.4784383, 1.418516, 0.4444741, 0, 0, 0, 1, 1,
-0.4723454, -0.6597466, -4.423768, 0, 0, 0, 1, 1,
-0.4722263, -0.1227452, -2.011181, 0, 0, 0, 1, 1,
-0.4685317, 0.5868526, -2.559454, 1, 1, 1, 1, 1,
-0.4616544, -0.5100941, -2.149859, 1, 1, 1, 1, 1,
-0.4591978, -1.091572, -3.487904, 1, 1, 1, 1, 1,
-0.4566137, 0.2568899, -1.528319, 1, 1, 1, 1, 1,
-0.4563923, 0.06785303, -0.7922909, 1, 1, 1, 1, 1,
-0.4553694, 1.24404, 0.241389, 1, 1, 1, 1, 1,
-0.4523782, -0.2279715, -2.165263, 1, 1, 1, 1, 1,
-0.45102, 0.9186824, 0.6228857, 1, 1, 1, 1, 1,
-0.4496074, -1.401671, -2.478961, 1, 1, 1, 1, 1,
-0.4491417, -0.6146581, -1.999863, 1, 1, 1, 1, 1,
-0.4474785, 0.7444885, -1.228735, 1, 1, 1, 1, 1,
-0.4470742, -0.3160768, -0.8692732, 1, 1, 1, 1, 1,
-0.4464035, -1.39177, -2.833029, 1, 1, 1, 1, 1,
-0.4448589, 0.5957761, 0.8814446, 1, 1, 1, 1, 1,
-0.4433269, 1.259018, -0.5928704, 1, 1, 1, 1, 1,
-0.4421867, -0.4223551, -3.026417, 0, 0, 1, 1, 1,
-0.4403187, -0.1861389, -1.695596, 1, 0, 0, 1, 1,
-0.4336061, -1.333116, -2.775808, 1, 0, 0, 1, 1,
-0.4321264, 1.258388, 0.6140028, 1, 0, 0, 1, 1,
-0.4317382, -0.5809059, -1.900269, 1, 0, 0, 1, 1,
-0.4312672, -0.1484651, -2.998577, 1, 0, 0, 1, 1,
-0.4293019, 0.3754687, -1.519333, 0, 0, 0, 1, 1,
-0.4263959, 2.531346, -0.8875569, 0, 0, 0, 1, 1,
-0.4164146, 0.4079859, 0.2808445, 0, 0, 0, 1, 1,
-0.4162679, 0.7618747, 0.7934737, 0, 0, 0, 1, 1,
-0.4147219, -0.5171868, -3.451617, 0, 0, 0, 1, 1,
-0.4124314, -0.7704633, -4.366713, 0, 0, 0, 1, 1,
-0.4096308, -0.8984005, -2.211859, 0, 0, 0, 1, 1,
-0.4078356, -0.397895, -1.459604, 1, 1, 1, 1, 1,
-0.4064811, -1.287199, -1.081489, 1, 1, 1, 1, 1,
-0.3985168, 0.1420399, -2.043088, 1, 1, 1, 1, 1,
-0.3968575, -0.1364721, -2.992747, 1, 1, 1, 1, 1,
-0.3942142, -1.241829, 0.1704534, 1, 1, 1, 1, 1,
-0.3911985, 1.121337, 0.1471826, 1, 1, 1, 1, 1,
-0.3889487, 1.278247, -0.9486506, 1, 1, 1, 1, 1,
-0.3862577, 1.242052, -3.07519, 1, 1, 1, 1, 1,
-0.3809932, -0.673301, -1.522957, 1, 1, 1, 1, 1,
-0.3782829, -1.716939, -1.981152, 1, 1, 1, 1, 1,
-0.3739524, 0.312019, 0.3826192, 1, 1, 1, 1, 1,
-0.3694653, 0.01507766, -1.73264, 1, 1, 1, 1, 1,
-0.3692706, 0.9625329, -0.836976, 1, 1, 1, 1, 1,
-0.3666706, -0.3831576, -2.399358, 1, 1, 1, 1, 1,
-0.3642682, -0.8969266, -2.968299, 1, 1, 1, 1, 1,
-0.3602815, -0.1935906, -3.43909, 0, 0, 1, 1, 1,
-0.3587573, -0.803446, -2.7186, 1, 0, 0, 1, 1,
-0.3574992, -1.927078, -3.521436, 1, 0, 0, 1, 1,
-0.3535655, 0.5076787, -0.2742875, 1, 0, 0, 1, 1,
-0.3464857, 0.4951459, -0.8516867, 1, 0, 0, 1, 1,
-0.34607, 0.1382683, -0.7059313, 1, 0, 0, 1, 1,
-0.3459805, -0.7066801, -3.954416, 0, 0, 0, 1, 1,
-0.3417763, 0.09023352, -2.266185, 0, 0, 0, 1, 1,
-0.341133, -0.1666725, -3.820466, 0, 0, 0, 1, 1,
-0.3392627, 1.083214, -0.7585055, 0, 0, 0, 1, 1,
-0.3360998, -0.3529727, -3.086398, 0, 0, 0, 1, 1,
-0.3358619, -0.8910642, -2.972278, 0, 0, 0, 1, 1,
-0.3335226, 0.5665033, 0.1461288, 0, 0, 0, 1, 1,
-0.3315066, -1.005146, -3.44313, 1, 1, 1, 1, 1,
-0.330613, 0.8819918, 0.4435179, 1, 1, 1, 1, 1,
-0.3294097, -0.3765837, -1.363409, 1, 1, 1, 1, 1,
-0.3283039, -0.4995654, -3.011765, 1, 1, 1, 1, 1,
-0.3246111, -0.7430971, -3.064931, 1, 1, 1, 1, 1,
-0.3228597, -1.411242, -2.750118, 1, 1, 1, 1, 1,
-0.322603, 0.8969906, -0.5965501, 1, 1, 1, 1, 1,
-0.3186621, 0.1739462, -0.3927877, 1, 1, 1, 1, 1,
-0.3170239, -0.4552358, -0.6506014, 1, 1, 1, 1, 1,
-0.3166753, 0.6311098, 0.005799356, 1, 1, 1, 1, 1,
-0.3156376, 0.2524217, -0.6631816, 1, 1, 1, 1, 1,
-0.3144543, 1.172521, 0.4873147, 1, 1, 1, 1, 1,
-0.3128299, -0.4441162, -1.836914, 1, 1, 1, 1, 1,
-0.3103206, -0.9189495, -2.937387, 1, 1, 1, 1, 1,
-0.3022931, 0.1893762, -0.6754357, 1, 1, 1, 1, 1,
-0.3004123, 0.592082, 0.3079089, 0, 0, 1, 1, 1,
-0.3000509, 1.775856, -0.3403909, 1, 0, 0, 1, 1,
-0.2984726, 0.7238724, 0.2131252, 1, 0, 0, 1, 1,
-0.2975618, 1.127693, -1.548047, 1, 0, 0, 1, 1,
-0.2915298, -0.6911984, -3.730106, 1, 0, 0, 1, 1,
-0.2911624, -0.505063, -1.197124, 1, 0, 0, 1, 1,
-0.2907681, 1.104304, -1.172872, 0, 0, 0, 1, 1,
-0.2864498, -0.8994873, -2.114751, 0, 0, 0, 1, 1,
-0.2807323, 0.06078713, -1.160686, 0, 0, 0, 1, 1,
-0.276199, -1.246415, -4.022673, 0, 0, 0, 1, 1,
-0.273725, -0.8678159, -3.722678, 0, 0, 0, 1, 1,
-0.2724499, 1.284104, -1.174613, 0, 0, 0, 1, 1,
-0.2710351, -0.5086714, -2.827819, 0, 0, 0, 1, 1,
-0.2661621, -0.642092, -2.807873, 1, 1, 1, 1, 1,
-0.2653481, 0.9351272, -0.8963695, 1, 1, 1, 1, 1,
-0.2647895, -0.4185629, -0.64324, 1, 1, 1, 1, 1,
-0.2617899, 0.6128266, 0.240142, 1, 1, 1, 1, 1,
-0.2600692, 1.304861, 1.009826, 1, 1, 1, 1, 1,
-0.260049, -0.8883233, -3.821923, 1, 1, 1, 1, 1,
-0.2586599, -0.5857539, -1.102897, 1, 1, 1, 1, 1,
-0.2501561, -1.38739, -2.099162, 1, 1, 1, 1, 1,
-0.2482163, 0.6197278, -1.21181, 1, 1, 1, 1, 1,
-0.2480693, -0.2914298, -2.073677, 1, 1, 1, 1, 1,
-0.2454579, 1.945739, -0.8196692, 1, 1, 1, 1, 1,
-0.2434998, 0.792312, 0.8028882, 1, 1, 1, 1, 1,
-0.2404302, 0.6326485, -0.02986668, 1, 1, 1, 1, 1,
-0.2377126, 0.1107497, -1.29487, 1, 1, 1, 1, 1,
-0.2361435, -0.618988, -1.143727, 1, 1, 1, 1, 1,
-0.2311891, -0.5634224, -3.2855, 0, 0, 1, 1, 1,
-0.2287479, -0.300413, -3.403838, 1, 0, 0, 1, 1,
-0.2268402, 1.572289, -1.544455, 1, 0, 0, 1, 1,
-0.2217192, -1.440833, -2.573897, 1, 0, 0, 1, 1,
-0.2217149, -1.281001, -3.16332, 1, 0, 0, 1, 1,
-0.2209529, -0.02276001, -2.099585, 1, 0, 0, 1, 1,
-0.2196189, 0.5874312, -1.08307, 0, 0, 0, 1, 1,
-0.2188756, 0.680903, 0.08332062, 0, 0, 0, 1, 1,
-0.2138701, 1.243262, 0.6456704, 0, 0, 0, 1, 1,
-0.212907, 0.2530934, -0.07530575, 0, 0, 0, 1, 1,
-0.2102698, 1.242702, 0.6680468, 0, 0, 0, 1, 1,
-0.2049855, -0.04968741, -0.7078918, 0, 0, 0, 1, 1,
-0.2047519, 2.131891, -0.09758524, 0, 0, 0, 1, 1,
-0.2018139, 0.6966948, -1.193815, 1, 1, 1, 1, 1,
-0.1983648, -0.2837982, -4.131855, 1, 1, 1, 1, 1,
-0.1981808, -2.431959, -2.561349, 1, 1, 1, 1, 1,
-0.1956186, -0.3732942, -1.446823, 1, 1, 1, 1, 1,
-0.1867659, 0.6306997, -1.099575, 1, 1, 1, 1, 1,
-0.1836428, -1.752681, -2.669447, 1, 1, 1, 1, 1,
-0.1808592, 0.3016699, -0.8201461, 1, 1, 1, 1, 1,
-0.1797262, 0.3160851, 0.7229515, 1, 1, 1, 1, 1,
-0.1782034, -0.8958927, -4.363613, 1, 1, 1, 1, 1,
-0.1663771, 1.589046, -0.7829306, 1, 1, 1, 1, 1,
-0.1627581, 1.68651, 0.07927367, 1, 1, 1, 1, 1,
-0.1608263, 1.014159, -1.349923, 1, 1, 1, 1, 1,
-0.1557733, 0.5519371, 0.4285905, 1, 1, 1, 1, 1,
-0.1526652, 0.7217908, -0.3363942, 1, 1, 1, 1, 1,
-0.1526104, 0.5444663, -1.717666, 1, 1, 1, 1, 1,
-0.1502474, 0.4627703, 1.577862, 0, 0, 1, 1, 1,
-0.150044, 0.2349685, 0.1364951, 1, 0, 0, 1, 1,
-0.1497546, 0.02193479, 1.16122, 1, 0, 0, 1, 1,
-0.1495724, -0.6283754, -2.734758, 1, 0, 0, 1, 1,
-0.143234, -0.323467, -4.582087, 1, 0, 0, 1, 1,
-0.1386464, 1.941055, 0.9994907, 1, 0, 0, 1, 1,
-0.1384313, 0.3537996, -0.9578871, 0, 0, 0, 1, 1,
-0.1349509, 0.7472669, -1.961961, 0, 0, 0, 1, 1,
-0.1322231, 0.06355479, -1.036105, 0, 0, 0, 1, 1,
-0.1307901, 1.771128, 1.175628, 0, 0, 0, 1, 1,
-0.1283362, 1.236356, 1.230233, 0, 0, 0, 1, 1,
-0.1232768, 2.214936, -0.856162, 0, 0, 0, 1, 1,
-0.1229881, 0.5393296, -1.193815, 0, 0, 0, 1, 1,
-0.1190949, -0.1836079, -2.141237, 1, 1, 1, 1, 1,
-0.1184169, 0.9313869, 1.736617, 1, 1, 1, 1, 1,
-0.1168725, 0.8922427, 0.5494007, 1, 1, 1, 1, 1,
-0.1163077, -0.2349582, -4.455003, 1, 1, 1, 1, 1,
-0.1143481, 1.312802, 0.4685983, 1, 1, 1, 1, 1,
-0.1139501, 0.315563, -2.472566, 1, 1, 1, 1, 1,
-0.1122808, 0.3958363, -1.511674, 1, 1, 1, 1, 1,
-0.1111498, 1.694879, 0.2398926, 1, 1, 1, 1, 1,
-0.1105635, -0.3608209, -2.831432, 1, 1, 1, 1, 1,
-0.106553, -1.994948, -2.718415, 1, 1, 1, 1, 1,
-0.1055846, -0.2605738, -2.477592, 1, 1, 1, 1, 1,
-0.1007586, -0.3625069, -2.02193, 1, 1, 1, 1, 1,
-0.1000545, 0.3509189, -0.4023901, 1, 1, 1, 1, 1,
-0.09905472, -0.06535963, -3.560537, 1, 1, 1, 1, 1,
-0.09818828, -1.780344, -5.109245, 1, 1, 1, 1, 1,
-0.09817283, -1.40739, -3.905941, 0, 0, 1, 1, 1,
-0.0980991, 0.2365715, -1.121302, 1, 0, 0, 1, 1,
-0.09689358, 0.6491719, -2.353169, 1, 0, 0, 1, 1,
-0.09622843, 0.7176156, -0.6254542, 1, 0, 0, 1, 1,
-0.09254467, 0.2566634, -2.053704, 1, 0, 0, 1, 1,
-0.09072674, 0.6616423, 0.1032204, 1, 0, 0, 1, 1,
-0.09068797, 0.5298147, -0.9194068, 0, 0, 0, 1, 1,
-0.08686162, -2.471469, -2.693603, 0, 0, 0, 1, 1,
-0.08066399, 1.753688, 0.2432317, 0, 0, 0, 1, 1,
-0.07991359, 0.4666179, -1.749517, 0, 0, 0, 1, 1,
-0.07952847, -0.04519978, -1.907282, 0, 0, 0, 1, 1,
-0.07637078, 0.901614, -0.5931221, 0, 0, 0, 1, 1,
-0.07637041, 2.018612, 1.309642, 0, 0, 0, 1, 1,
-0.07613762, 0.1056248, 1.480125, 1, 1, 1, 1, 1,
-0.07341769, -0.5095748, -2.096284, 1, 1, 1, 1, 1,
-0.07084749, -0.7740334, -4.201587, 1, 1, 1, 1, 1,
-0.07078242, 0.5217657, 0.2214545, 1, 1, 1, 1, 1,
-0.07052968, -0.1734411, -3.36502, 1, 1, 1, 1, 1,
-0.06542312, 0.9496263, -1.286516, 1, 1, 1, 1, 1,
-0.06479567, -0.2515652, -2.589819, 1, 1, 1, 1, 1,
-0.06390787, -1.273177, -4.620132, 1, 1, 1, 1, 1,
-0.06152935, 0.5029034, 1.3197, 1, 1, 1, 1, 1,
-0.05688319, -0.2091602, -2.742786, 1, 1, 1, 1, 1,
-0.05272373, -1.584401, -4.18455, 1, 1, 1, 1, 1,
-0.05094068, 1.104536, -1.421221, 1, 1, 1, 1, 1,
-0.0496681, 0.1916642, -0.8953223, 1, 1, 1, 1, 1,
-0.04949789, -0.3286633, -1.924842, 1, 1, 1, 1, 1,
-0.04248258, 0.8090569, -0.5017108, 1, 1, 1, 1, 1,
-0.0422491, -0.4681783, -2.518445, 0, 0, 1, 1, 1,
-0.0336904, -0.8292826, -1.572733, 1, 0, 0, 1, 1,
-0.02126285, -2.111383, -1.451109, 1, 0, 0, 1, 1,
-0.01959472, 0.5795585, 0.4869122, 1, 0, 0, 1, 1,
-0.01918998, -0.1431623, -4.455454, 1, 0, 0, 1, 1,
-0.01763051, 1.308496, -0.8664411, 1, 0, 0, 1, 1,
-0.008062825, -0.6772869, -2.08394, 0, 0, 0, 1, 1,
-0.003038764, 0.2661942, 1.145224, 0, 0, 0, 1, 1,
0.002388269, -1.335001, 3.353435, 0, 0, 0, 1, 1,
0.005397905, 0.2953659, -1.625298, 0, 0, 0, 1, 1,
0.006091911, -2.502919, 2.336647, 0, 0, 0, 1, 1,
0.01046537, -1.484055, 4.139912, 0, 0, 0, 1, 1,
0.0120953, 0.7137893, 0.7674041, 0, 0, 0, 1, 1,
0.01599845, -0.2507515, 2.985871, 1, 1, 1, 1, 1,
0.01921495, -0.6789212, 4.088511, 1, 1, 1, 1, 1,
0.02043614, -0.08303446, 0.02440093, 1, 1, 1, 1, 1,
0.02251332, 0.5268302, 1.402054, 1, 1, 1, 1, 1,
0.02258769, 0.7425141, -0.5424753, 1, 1, 1, 1, 1,
0.0282857, -0.72525, 4.080212, 1, 1, 1, 1, 1,
0.02893188, -0.2550551, 2.671754, 1, 1, 1, 1, 1,
0.03012485, 0.2349231, -1.296974, 1, 1, 1, 1, 1,
0.03043224, -0.9902545, 3.418526, 1, 1, 1, 1, 1,
0.03086301, 0.936923, 0.01410266, 1, 1, 1, 1, 1,
0.03110417, 1.347803, 1.939044, 1, 1, 1, 1, 1,
0.03111753, 1.350704, -0.141268, 1, 1, 1, 1, 1,
0.03618016, -0.7758396, 1.96725, 1, 1, 1, 1, 1,
0.04091392, -1.04067, 1.370092, 1, 1, 1, 1, 1,
0.04112806, -1.070607, 2.857542, 1, 1, 1, 1, 1,
0.04444447, 0.6987857, -0.1997175, 0, 0, 1, 1, 1,
0.05239492, 0.3854547, -0.09371895, 1, 0, 0, 1, 1,
0.05709292, 0.2765724, -0.9829976, 1, 0, 0, 1, 1,
0.05879295, 1.994616, 1.053409, 1, 0, 0, 1, 1,
0.06210295, 1.444939, 0.5133274, 1, 0, 0, 1, 1,
0.0627503, -1.550581, 3.061116, 1, 0, 0, 1, 1,
0.06321768, 0.7648487, -0.2140932, 0, 0, 0, 1, 1,
0.06345145, 0.5885211, 0.6442282, 0, 0, 0, 1, 1,
0.06353354, -0.1354782, 4.376991, 0, 0, 0, 1, 1,
0.06520221, 0.6899875, 0.1564288, 0, 0, 0, 1, 1,
0.06552849, -0.001322401, 0.1918743, 0, 0, 0, 1, 1,
0.06684682, 0.07642055, -0.03461375, 0, 0, 0, 1, 1,
0.06888752, 0.8269303, 0.4174142, 0, 0, 0, 1, 1,
0.07155062, -1.519951, 3.524557, 1, 1, 1, 1, 1,
0.07444246, -1.506109, 3.372443, 1, 1, 1, 1, 1,
0.07577012, 0.2927636, 1.976725, 1, 1, 1, 1, 1,
0.07685146, 0.1849941, 1.193524, 1, 1, 1, 1, 1,
0.07689629, 1.883777, 1.465696, 1, 1, 1, 1, 1,
0.08372506, 0.9339776, 1.577345, 1, 1, 1, 1, 1,
0.08454634, 0.5322964, 1.662894, 1, 1, 1, 1, 1,
0.08730943, -0.5102709, 2.542552, 1, 1, 1, 1, 1,
0.08877556, 1.056836, 0.7035944, 1, 1, 1, 1, 1,
0.09340329, -0.6753751, 4.161345, 1, 1, 1, 1, 1,
0.09409794, -0.1601581, 2.201172, 1, 1, 1, 1, 1,
0.09473314, -1.607209, 3.089124, 1, 1, 1, 1, 1,
0.09524214, -0.246309, 1.665344, 1, 1, 1, 1, 1,
0.09750919, 0.2315856, 1.331141, 1, 1, 1, 1, 1,
0.1075566, 2.547738, -0.6081172, 1, 1, 1, 1, 1,
0.1122284, 0.7704356, -0.4457018, 0, 0, 1, 1, 1,
0.1208883, -0.1121839, 2.83753, 1, 0, 0, 1, 1,
0.1223447, 1.177179, 0.176229, 1, 0, 0, 1, 1,
0.1260247, 1.348668, 1.604158, 1, 0, 0, 1, 1,
0.1281886, 2.755671, -0.1152687, 1, 0, 0, 1, 1,
0.1292889, -1.269897, 1.770129, 1, 0, 0, 1, 1,
0.1300144, 0.6099311, -0.03865341, 0, 0, 0, 1, 1,
0.1305143, -0.8918818, 4.020836, 0, 0, 0, 1, 1,
0.1311578, -0.5191226, 3.753331, 0, 0, 0, 1, 1,
0.1322022, -1.459349, 3.408743, 0, 0, 0, 1, 1,
0.1439216, -0.0530348, 1.655481, 0, 0, 0, 1, 1,
0.1470891, 0.4406782, 0.1405384, 0, 0, 0, 1, 1,
0.1488343, 0.3571541, -0.2162169, 0, 0, 0, 1, 1,
0.1501372, -0.721443, 4.713996, 1, 1, 1, 1, 1,
0.1517123, -0.1315132, 3.911326, 1, 1, 1, 1, 1,
0.1522335, 1.311193, 1.190205, 1, 1, 1, 1, 1,
0.153776, -1.05994, 3.292899, 1, 1, 1, 1, 1,
0.1546226, 0.02809432, 3.33334, 1, 1, 1, 1, 1,
0.1578175, 0.07261629, 1.755583, 1, 1, 1, 1, 1,
0.1605611, 2.090657, 0.5354297, 1, 1, 1, 1, 1,
0.1627975, -0.07076093, 3.395963, 1, 1, 1, 1, 1,
0.1632025, 1.710022, 0.03462994, 1, 1, 1, 1, 1,
0.1636374, -0.7464593, 4.512892, 1, 1, 1, 1, 1,
0.164451, -0.4818113, 3.964425, 1, 1, 1, 1, 1,
0.1666412, 1.166127, 1.623597, 1, 1, 1, 1, 1,
0.1673002, 1.709638, 1.006708, 1, 1, 1, 1, 1,
0.1680251, -0.493658, 5.797479, 1, 1, 1, 1, 1,
0.1685367, 1.321222, -0.7595241, 1, 1, 1, 1, 1,
0.1707523, 0.3111174, 0.663753, 0, 0, 1, 1, 1,
0.1723232, -0.1384727, 3.183814, 1, 0, 0, 1, 1,
0.1756591, -0.7863838, 2.935581, 1, 0, 0, 1, 1,
0.175674, 0.9867919, -0.242317, 1, 0, 0, 1, 1,
0.1775487, -0.02025129, 4.201173, 1, 0, 0, 1, 1,
0.1776232, 1.258829, -0.2247685, 1, 0, 0, 1, 1,
0.1778103, 0.02506634, 2.544101, 0, 0, 0, 1, 1,
0.1792943, -0.08618217, 1.840629, 0, 0, 0, 1, 1,
0.1802235, 0.9836681, -0.3281387, 0, 0, 0, 1, 1,
0.1925784, 0.06371094, 2.91899, 0, 0, 0, 1, 1,
0.1936687, 0.002486838, -0.08702467, 0, 0, 0, 1, 1,
0.1958791, 0.5153152, -0.2693457, 0, 0, 0, 1, 1,
0.2036082, -0.6239623, 2.239569, 0, 0, 0, 1, 1,
0.2066743, -0.5156457, 2.710409, 1, 1, 1, 1, 1,
0.206714, 2.149378, 0.1020724, 1, 1, 1, 1, 1,
0.2115682, -0.1215372, 2.384839, 1, 1, 1, 1, 1,
0.2195482, -0.2867896, 2.709565, 1, 1, 1, 1, 1,
0.2225258, -1.328389, 1.893332, 1, 1, 1, 1, 1,
0.2287862, -0.1500701, 3.023859, 1, 1, 1, 1, 1,
0.2299094, -0.02859575, 0.3643282, 1, 1, 1, 1, 1,
0.2311281, 0.7444298, -0.8548954, 1, 1, 1, 1, 1,
0.2334738, 1.355319, -0.1439777, 1, 1, 1, 1, 1,
0.233966, 1.693438, 0.7951776, 1, 1, 1, 1, 1,
0.2353491, 0.5557647, -1.337204, 1, 1, 1, 1, 1,
0.2372193, 0.3234515, -0.7852936, 1, 1, 1, 1, 1,
0.237773, 0.292744, 0.4066886, 1, 1, 1, 1, 1,
0.2437708, -0.6222878, 3.047103, 1, 1, 1, 1, 1,
0.244569, -0.2748003, 0.4595593, 1, 1, 1, 1, 1,
0.2452417, 1.32966, 2.965821, 0, 0, 1, 1, 1,
0.2458958, -1.161841, 1.692019, 1, 0, 0, 1, 1,
0.2459317, 0.2429221, 3.107472, 1, 0, 0, 1, 1,
0.2485035, -0.2891769, 4.013775, 1, 0, 0, 1, 1,
0.2503288, -0.6051642, 2.751866, 1, 0, 0, 1, 1,
0.2526288, 0.6630346, 0.2224571, 1, 0, 0, 1, 1,
0.2527224, 0.0132347, 2.504067, 0, 0, 0, 1, 1,
0.2543139, 0.8856275, 0.8399315, 0, 0, 0, 1, 1,
0.2544918, 1.720193, 1.454519, 0, 0, 0, 1, 1,
0.2559505, -0.02873748, 0.4332221, 0, 0, 0, 1, 1,
0.2619368, -0.04607293, 2.75212, 0, 0, 0, 1, 1,
0.2632702, -1.480561, 4.730952, 0, 0, 0, 1, 1,
0.2668045, 0.7920422, -0.8090139, 0, 0, 0, 1, 1,
0.2685242, 0.3088068, 1.879202, 1, 1, 1, 1, 1,
0.2699872, -0.7609244, 3.459808, 1, 1, 1, 1, 1,
0.2712814, 0.1990091, -0.7897585, 1, 1, 1, 1, 1,
0.2773434, -1.287893, 1.660784, 1, 1, 1, 1, 1,
0.2787834, -0.022474, 2.254019, 1, 1, 1, 1, 1,
0.2833113, 0.7530719, 1.271995, 1, 1, 1, 1, 1,
0.2841127, -1.556249, 4.495562, 1, 1, 1, 1, 1,
0.2860984, -0.264789, 2.759364, 1, 1, 1, 1, 1,
0.2906178, 1.789042, 1.707649, 1, 1, 1, 1, 1,
0.2914196, -0.5363392, 3.393253, 1, 1, 1, 1, 1,
0.2915963, -0.2076995, 3.026265, 1, 1, 1, 1, 1,
0.2931176, -1.825857, 0.8050562, 1, 1, 1, 1, 1,
0.2953958, -1.901066, 2.117775, 1, 1, 1, 1, 1,
0.2954447, 1.304531, 1.315274, 1, 1, 1, 1, 1,
0.297205, 0.4575136, 1.381754, 1, 1, 1, 1, 1,
0.3054688, -0.4073846, 2.850764, 0, 0, 1, 1, 1,
0.3066315, -0.7524515, 1.515409, 1, 0, 0, 1, 1,
0.306771, -1.053909, 2.81087, 1, 0, 0, 1, 1,
0.3080254, -1.023957, 4.275088, 1, 0, 0, 1, 1,
0.3080706, -0.5499586, 1.560995, 1, 0, 0, 1, 1,
0.3090535, 1.520717, 0.3431591, 1, 0, 0, 1, 1,
0.3126476, -0.5059875, 2.186249, 0, 0, 0, 1, 1,
0.3144712, 0.5903856, -0.7790465, 0, 0, 0, 1, 1,
0.319597, 1.619037, 0.1606049, 0, 0, 0, 1, 1,
0.3217827, -0.02147195, 0.1354113, 0, 0, 0, 1, 1,
0.3246593, -0.7853547, 3.905154, 0, 0, 0, 1, 1,
0.3262231, 0.3047477, 0.5808971, 0, 0, 0, 1, 1,
0.3327511, 0.08724346, 1.485305, 0, 0, 0, 1, 1,
0.3334719, 0.8037494, -0.7169029, 1, 1, 1, 1, 1,
0.3368689, -0.2059749, 3.052149, 1, 1, 1, 1, 1,
0.338223, 0.7545126, 1.601546, 1, 1, 1, 1, 1,
0.3395789, 1.386651, -1.082174, 1, 1, 1, 1, 1,
0.3495443, -1.307883, 3.493706, 1, 1, 1, 1, 1,
0.3538602, 2.190148, 1.302565, 1, 1, 1, 1, 1,
0.3549953, 1.885278, -0.8357368, 1, 1, 1, 1, 1,
0.3562568, -0.5225741, 2.907195, 1, 1, 1, 1, 1,
0.3582631, -1.231905, 2.757352, 1, 1, 1, 1, 1,
0.3586923, 1.813186, 0.9958867, 1, 1, 1, 1, 1,
0.3591467, 0.3919236, 2.626895, 1, 1, 1, 1, 1,
0.3610264, 0.3775645, 1.846069, 1, 1, 1, 1, 1,
0.3620433, 0.8504, 1.696824, 1, 1, 1, 1, 1,
0.3629037, -2.216339, 4.259911, 1, 1, 1, 1, 1,
0.3635954, 1.920869, 0.09397495, 1, 1, 1, 1, 1,
0.365858, 0.6310148, -0.4539092, 0, 0, 1, 1, 1,
0.3679135, 0.7575693, 0.6131607, 1, 0, 0, 1, 1,
0.3704979, -1.195876, 2.796831, 1, 0, 0, 1, 1,
0.3828469, 2.14674, -0.3541932, 1, 0, 0, 1, 1,
0.3851823, -1.586398, 2.809158, 1, 0, 0, 1, 1,
0.3862077, -0.8294209, 1.081812, 1, 0, 0, 1, 1,
0.3964174, -0.1877619, 2.578051, 0, 0, 0, 1, 1,
0.396622, 0.08965535, 1.268153, 0, 0, 0, 1, 1,
0.3994432, 0.6370783, 2.090901, 0, 0, 0, 1, 1,
0.3996949, -1.149408, 5.474198, 0, 0, 0, 1, 1,
0.3999048, 0.674414, 0.2606584, 0, 0, 0, 1, 1,
0.401435, 1.682492, -0.2798722, 0, 0, 0, 1, 1,
0.40343, -0.4790514, 2.80595, 0, 0, 0, 1, 1,
0.4081256, 0.5745318, 0.7277862, 1, 1, 1, 1, 1,
0.4113348, 0.9133041, 1.596391, 1, 1, 1, 1, 1,
0.4114254, 0.06243192, 1.397183, 1, 1, 1, 1, 1,
0.4126403, -1.281564, 3.680302, 1, 1, 1, 1, 1,
0.4136237, -0.8497148, 0.9634654, 1, 1, 1, 1, 1,
0.4294797, -0.5974599, 3.773064, 1, 1, 1, 1, 1,
0.4356473, 1.230356, -1.079117, 1, 1, 1, 1, 1,
0.4378871, -2.068006, 2.954025, 1, 1, 1, 1, 1,
0.4406623, 0.8349741, 1.073537, 1, 1, 1, 1, 1,
0.44261, 1.060617, -0.6993598, 1, 1, 1, 1, 1,
0.4457712, 1.489312, -0.2784671, 1, 1, 1, 1, 1,
0.4459136, -1.857855, 2.381469, 1, 1, 1, 1, 1,
0.4475195, 0.7241911, 0.3805946, 1, 1, 1, 1, 1,
0.4505227, -1.855619, 3.919915, 1, 1, 1, 1, 1,
0.4530824, -1.130174, 2.519389, 1, 1, 1, 1, 1,
0.4565906, 0.5197892, 1.066791, 0, 0, 1, 1, 1,
0.4572173, -1.154512, 3.716449, 1, 0, 0, 1, 1,
0.458114, 1.449209, -0.2733967, 1, 0, 0, 1, 1,
0.4584679, -1.045198, 2.630942, 1, 0, 0, 1, 1,
0.4614443, 0.9449341, 0.8155613, 1, 0, 0, 1, 1,
0.4619546, 0.4985531, -0.07917782, 1, 0, 0, 1, 1,
0.4646918, -1.371129, 3.31033, 0, 0, 0, 1, 1,
0.4749524, 0.5660227, 0.2906872, 0, 0, 0, 1, 1,
0.4752751, 0.138215, 1.434818, 0, 0, 0, 1, 1,
0.4818319, 0.2478468, -0.3051487, 0, 0, 0, 1, 1,
0.4907396, -0.3068227, 2.256581, 0, 0, 0, 1, 1,
0.4986795, -1.20476, 2.829706, 0, 0, 0, 1, 1,
0.4987123, -1.138723, 2.509292, 0, 0, 0, 1, 1,
0.4989402, 0.6671867, -0.0044758, 1, 1, 1, 1, 1,
0.4992505, 0.004271457, 1.360873, 1, 1, 1, 1, 1,
0.5022866, -2.222889, 1.915413, 1, 1, 1, 1, 1,
0.5036191, -1.438997, 1.85381, 1, 1, 1, 1, 1,
0.5060592, 0.7581662, 0.2165113, 1, 1, 1, 1, 1,
0.5117113, 0.2871006, 0.02104222, 1, 1, 1, 1, 1,
0.5136709, 0.7739971, 2.372099, 1, 1, 1, 1, 1,
0.514904, 1.220286, 0.4121023, 1, 1, 1, 1, 1,
0.5170161, -1.106349, 0.9029306, 1, 1, 1, 1, 1,
0.5269412, 0.1596794, 2.174681, 1, 1, 1, 1, 1,
0.5388613, -0.7346336, 2.023161, 1, 1, 1, 1, 1,
0.540924, -0.03880706, 1.628026, 1, 1, 1, 1, 1,
0.5447401, -0.08332235, 1.007511, 1, 1, 1, 1, 1,
0.5462834, -0.2165723, 2.4869, 1, 1, 1, 1, 1,
0.5498489, -0.5754245, 1.919331, 1, 1, 1, 1, 1,
0.550046, -1.192233, 2.454412, 0, 0, 1, 1, 1,
0.5616406, 1.139084, 1.967313, 1, 0, 0, 1, 1,
0.5619134, -1.15913, 0.8805536, 1, 0, 0, 1, 1,
0.5624051, 1.421729, 0.2879051, 1, 0, 0, 1, 1,
0.5667439, -0.3798234, 2.20729, 1, 0, 0, 1, 1,
0.578236, -1.307415, 2.846023, 1, 0, 0, 1, 1,
0.579451, -1.78496, 3.577007, 0, 0, 0, 1, 1,
0.5811391, -0.7005939, 1.364856, 0, 0, 0, 1, 1,
0.5821218, 0.5896082, -0.8693927, 0, 0, 0, 1, 1,
0.5852773, -0.8492903, 3.503707, 0, 0, 0, 1, 1,
0.5869416, -1.110412, 2.002715, 0, 0, 0, 1, 1,
0.5879227, 0.9072781, 1.436663, 0, 0, 0, 1, 1,
0.5894896, -0.2990412, 1.661711, 0, 0, 0, 1, 1,
0.5971044, -1.203671, 2.034645, 1, 1, 1, 1, 1,
0.5972566, -1.124981, 2.775899, 1, 1, 1, 1, 1,
0.6031041, 0.407088, 0.4621695, 1, 1, 1, 1, 1,
0.6031405, -0.8388751, 4.149441, 1, 1, 1, 1, 1,
0.60504, 1.336437, -0.8405256, 1, 1, 1, 1, 1,
0.6133553, 0.6355572, 1.43789, 1, 1, 1, 1, 1,
0.61556, -0.4307949, 3.034463, 1, 1, 1, 1, 1,
0.615768, 1.439158, 2.182846, 1, 1, 1, 1, 1,
0.6210592, 0.705239, -0.7411147, 1, 1, 1, 1, 1,
0.6301877, 1.156918, 0.8865647, 1, 1, 1, 1, 1,
0.6405061, -0.424835, 1.891609, 1, 1, 1, 1, 1,
0.6411037, -0.6180212, 2.978515, 1, 1, 1, 1, 1,
0.6435286, -1.758956, 3.648872, 1, 1, 1, 1, 1,
0.6469198, 0.7914631, 1.718644, 1, 1, 1, 1, 1,
0.6514893, -0.06373093, 1.495301, 1, 1, 1, 1, 1,
0.6515518, 1.001549, 0.4098368, 0, 0, 1, 1, 1,
0.6544819, -1.24713, 2.593277, 1, 0, 0, 1, 1,
0.657512, -0.2071059, 2.325412, 1, 0, 0, 1, 1,
0.6590618, 0.3689157, 1.717485, 1, 0, 0, 1, 1,
0.6595629, -0.7132717, 1.920358, 1, 0, 0, 1, 1,
0.6604986, -0.5177018, 0.8791579, 1, 0, 0, 1, 1,
0.6615008, 0.2356864, 0.4865655, 0, 0, 0, 1, 1,
0.6699622, 1.045359, -0.9753438, 0, 0, 0, 1, 1,
0.6700048, -1.139788, 4.120475, 0, 0, 0, 1, 1,
0.6734847, -0.28669, 2.883722, 0, 0, 0, 1, 1,
0.6751917, -0.7206045, 1.289675, 0, 0, 0, 1, 1,
0.6859378, 3.059432, -0.175625, 0, 0, 0, 1, 1,
0.6895013, 0.9240605, -1.356912, 0, 0, 0, 1, 1,
0.6895534, 0.493848, 3.044834, 1, 1, 1, 1, 1,
0.6920289, 1.688822, 0.2788471, 1, 1, 1, 1, 1,
0.6962006, -1.133733, 1.530727, 1, 1, 1, 1, 1,
0.6968579, 0.6606698, 1.781192, 1, 1, 1, 1, 1,
0.7031332, -1.983599, 1.52485, 1, 1, 1, 1, 1,
0.7060404, -0.2459177, 2.735265, 1, 1, 1, 1, 1,
0.7074421, -1.98472, 1.909164, 1, 1, 1, 1, 1,
0.7111733, 0.3045668, 0.08958985, 1, 1, 1, 1, 1,
0.7113796, -0.12737, 2.058791, 1, 1, 1, 1, 1,
0.7114891, -0.2148798, 2.53919, 1, 1, 1, 1, 1,
0.712497, -1.344131, 2.658503, 1, 1, 1, 1, 1,
0.7164096, 0.3773252, 1.402668, 1, 1, 1, 1, 1,
0.7165397, -0.9444521, 3.760783, 1, 1, 1, 1, 1,
0.7169713, -0.6239378, 1.302765, 1, 1, 1, 1, 1,
0.7174628, -0.3639712, 3.392818, 1, 1, 1, 1, 1,
0.7218465, 0.03933077, 3.376638, 0, 0, 1, 1, 1,
0.7273969, -1.773299, 2.719524, 1, 0, 0, 1, 1,
0.7349941, -0.9932837, 2.000574, 1, 0, 0, 1, 1,
0.7376149, -0.8026446, 2.791766, 1, 0, 0, 1, 1,
0.7377917, -2.428165, 1.88271, 1, 0, 0, 1, 1,
0.7379549, 0.2529208, 1.930391, 1, 0, 0, 1, 1,
0.7408406, 0.7638571, -0.2174243, 0, 0, 0, 1, 1,
0.7413278, 0.6246878, 1.052807, 0, 0, 0, 1, 1,
0.7435224, -0.566175, 2.047831, 0, 0, 0, 1, 1,
0.7469758, -0.7556663, 3.797018, 0, 0, 0, 1, 1,
0.7491262, 0.1528461, 1.291503, 0, 0, 0, 1, 1,
0.749689, 0.4630936, 0.6743888, 0, 0, 0, 1, 1,
0.7497746, -1.04072, 2.740608, 0, 0, 0, 1, 1,
0.7518314, -1.6393, 3.18952, 1, 1, 1, 1, 1,
0.7530584, -1.461278, 2.993164, 1, 1, 1, 1, 1,
0.7551069, 1.059596, 1.902244, 1, 1, 1, 1, 1,
0.7554726, 0.2007392, 1.759028, 1, 1, 1, 1, 1,
0.7594088, -0.2030287, 2.109897, 1, 1, 1, 1, 1,
0.7649082, 1.107214, -0.6307376, 1, 1, 1, 1, 1,
0.7703577, -0.6391361, 1.547732, 1, 1, 1, 1, 1,
0.7727103, -0.8385905, 1.969992, 1, 1, 1, 1, 1,
0.7755094, 0.5133238, -0.7278296, 1, 1, 1, 1, 1,
0.7755727, 1.301483, 0.01677962, 1, 1, 1, 1, 1,
0.7762384, 0.2056475, 0.1011136, 1, 1, 1, 1, 1,
0.776527, 1.597474, 1.175991, 1, 1, 1, 1, 1,
0.7831141, 1.860644, 0.8417094, 1, 1, 1, 1, 1,
0.786104, 1.551993, -0.6897738, 1, 1, 1, 1, 1,
0.7933661, -0.8107082, 2.026996, 1, 1, 1, 1, 1,
0.7956192, -0.6021586, 1.776141, 0, 0, 1, 1, 1,
0.8000271, -0.4015349, 0.9388225, 1, 0, 0, 1, 1,
0.8012419, 1.292981, 0.5998974, 1, 0, 0, 1, 1,
0.8016784, 0.8521385, 1.826402, 1, 0, 0, 1, 1,
0.8032913, -0.1162845, 3.654222, 1, 0, 0, 1, 1,
0.8057571, -0.4889374, 0.8907775, 1, 0, 0, 1, 1,
0.8070378, 0.4086648, 0.7548072, 0, 0, 0, 1, 1,
0.8090444, 0.1520291, 0.3146526, 0, 0, 0, 1, 1,
0.8138114, -0.9019316, 1.039158, 0, 0, 0, 1, 1,
0.8180494, -0.3333802, 2.146553, 0, 0, 0, 1, 1,
0.8189529, 0.6108527, 1.705985, 0, 0, 0, 1, 1,
0.8224052, -0.3579716, 2.681887, 0, 0, 0, 1, 1,
0.8237483, -0.400721, 3.231633, 0, 0, 0, 1, 1,
0.8246369, -0.8036396, 2.839779, 1, 1, 1, 1, 1,
0.8381001, 0.3840748, 1.961246, 1, 1, 1, 1, 1,
0.8407531, -1.612334, 2.341653, 1, 1, 1, 1, 1,
0.8414617, -1.236318, 2.850314, 1, 1, 1, 1, 1,
0.8429996, 0.831735, 0.6646805, 1, 1, 1, 1, 1,
0.8487743, 0.9878696, -0.6837385, 1, 1, 1, 1, 1,
0.8528594, -1.256365, 3.038209, 1, 1, 1, 1, 1,
0.8529614, 0.5254024, 1.401015, 1, 1, 1, 1, 1,
0.8562598, -0.7110018, 1.426554, 1, 1, 1, 1, 1,
0.8589703, -0.4403851, 3.069376, 1, 1, 1, 1, 1,
0.8592803, 0.7599694, 0.5184331, 1, 1, 1, 1, 1,
0.8623295, -0.6516906, 0.7142398, 1, 1, 1, 1, 1,
0.8669696, 0.7357301, 1.976748, 1, 1, 1, 1, 1,
0.8676586, 0.8088163, 0.9218069, 1, 1, 1, 1, 1,
0.8738115, 0.6296962, 2.403692, 1, 1, 1, 1, 1,
0.8765592, -0.9345278, 1.344237, 0, 0, 1, 1, 1,
0.8790775, -1.446162, 2.551528, 1, 0, 0, 1, 1,
0.8840482, 0.544984, 2.413245, 1, 0, 0, 1, 1,
0.8844962, 0.1784833, 0.221203, 1, 0, 0, 1, 1,
0.8872302, -1.531356, 2.701423, 1, 0, 0, 1, 1,
0.8920878, 0.6862079, 0.9354019, 1, 0, 0, 1, 1,
0.8949642, 1.287626, -0.4687105, 0, 0, 0, 1, 1,
0.8952313, -0.6134223, 2.706768, 0, 0, 0, 1, 1,
0.9021077, 0.2482884, 1.145626, 0, 0, 0, 1, 1,
0.9092903, 1.128489, 1.900247, 0, 0, 0, 1, 1,
0.9293889, 0.5081951, 1.4205, 0, 0, 0, 1, 1,
0.9327686, -0.07549262, 0.1995745, 0, 0, 0, 1, 1,
0.9331981, 1.056895, -0.0967141, 0, 0, 0, 1, 1,
0.9420098, -2.227131, 1.896363, 1, 1, 1, 1, 1,
0.9423905, 0.3009208, 0.5432259, 1, 1, 1, 1, 1,
0.9430729, -1.599686, 3.912155, 1, 1, 1, 1, 1,
0.9540247, 1.362439, -0.1592042, 1, 1, 1, 1, 1,
0.9601169, -0.6340925, 2.990442, 1, 1, 1, 1, 1,
0.9645502, -0.0575599, 0.7064936, 1, 1, 1, 1, 1,
0.9720857, -1.178233, 2.234635, 1, 1, 1, 1, 1,
0.981251, 0.05653001, 2.496702, 1, 1, 1, 1, 1,
1.000053, 0.4514998, 3.051239, 1, 1, 1, 1, 1,
1.004174, -0.1407261, 0.8336933, 1, 1, 1, 1, 1,
1.004592, -0.5007798, 3.315816, 1, 1, 1, 1, 1,
1.014152, -1.376382, 2.433906, 1, 1, 1, 1, 1,
1.014577, -0.01895596, 1.950663, 1, 1, 1, 1, 1,
1.020163, -0.04309375, 2.611313, 1, 1, 1, 1, 1,
1.023004, 0.3181369, -0.4667737, 1, 1, 1, 1, 1,
1.023738, -1.021291, 0.9848492, 0, 0, 1, 1, 1,
1.026009, -0.006273326, 0.450931, 1, 0, 0, 1, 1,
1.034581, 1.170235, 0.6408212, 1, 0, 0, 1, 1,
1.035363, -0.1641197, 0.1254772, 1, 0, 0, 1, 1,
1.043381, 0.978861, 1.388217, 1, 0, 0, 1, 1,
1.044112, -1.216652, 3.531959, 1, 0, 0, 1, 1,
1.046977, -0.1837994, 2.369479, 0, 0, 0, 1, 1,
1.052475, -0.2590941, 0.07488812, 0, 0, 0, 1, 1,
1.056882, 0.3957849, -0.1454718, 0, 0, 0, 1, 1,
1.057551, -0.4389328, 2.248006, 0, 0, 0, 1, 1,
1.059342, -0.4045776, 1.262998, 0, 0, 0, 1, 1,
1.061051, -0.205571, 2.279907, 0, 0, 0, 1, 1,
1.066634, -0.07401499, 1.573603, 0, 0, 0, 1, 1,
1.068099, 0.8581814, 1.684765, 1, 1, 1, 1, 1,
1.072563, 0.8812822, -0.1123022, 1, 1, 1, 1, 1,
1.090821, -1.916702, 3.681064, 1, 1, 1, 1, 1,
1.09294, -2.753167, 3.63291, 1, 1, 1, 1, 1,
1.11334, 0.3275352, 0.685779, 1, 1, 1, 1, 1,
1.117416, -0.01845175, 3.700124, 1, 1, 1, 1, 1,
1.117559, -1.26738, 2.934163, 1, 1, 1, 1, 1,
1.126834, 0.8709256, 1.312341, 1, 1, 1, 1, 1,
1.137001, 0.3413831, 1.9132, 1, 1, 1, 1, 1,
1.149698, 2.098025, 1.536815, 1, 1, 1, 1, 1,
1.160493, -0.9777366, 1.934962, 1, 1, 1, 1, 1,
1.163721, 1.544972, 0.6939538, 1, 1, 1, 1, 1,
1.164033, -0.3219551, 1.451782, 1, 1, 1, 1, 1,
1.16623, 1.402544, 0.8919895, 1, 1, 1, 1, 1,
1.168168, 1.384175, -0.1346831, 1, 1, 1, 1, 1,
1.17109, -1.190679, 0.4529499, 0, 0, 1, 1, 1,
1.175539, -1.315851, 2.55865, 1, 0, 0, 1, 1,
1.179198, 1.293963, 1.027452, 1, 0, 0, 1, 1,
1.183069, 1.028762, 0.3421132, 1, 0, 0, 1, 1,
1.185116, 1.710074, 0.721499, 1, 0, 0, 1, 1,
1.187442, -0.1800862, 0.87527, 1, 0, 0, 1, 1,
1.196986, 0.9600323, -0.1819593, 0, 0, 0, 1, 1,
1.200129, 0.5146554, 0.04576094, 0, 0, 0, 1, 1,
1.200152, 0.2235063, 1.602539, 0, 0, 0, 1, 1,
1.206207, 2.303065, -0.5728354, 0, 0, 0, 1, 1,
1.209201, -0.03938745, 1.146563, 0, 0, 0, 1, 1,
1.209986, 0.4711935, 1.038578, 0, 0, 0, 1, 1,
1.227864, -0.5143545, 2.07376, 0, 0, 0, 1, 1,
1.23575, 0.7237795, 0.228106, 1, 1, 1, 1, 1,
1.254468, -0.493295, 2.984149, 1, 1, 1, 1, 1,
1.255017, -0.02405495, 1.574687, 1, 1, 1, 1, 1,
1.257595, 0.4818084, 2.600486, 1, 1, 1, 1, 1,
1.258256, -0.3967172, 1.947546, 1, 1, 1, 1, 1,
1.273011, -1.269788, 0.7660624, 1, 1, 1, 1, 1,
1.286704, 0.6851219, 1.641218, 1, 1, 1, 1, 1,
1.295813, -0.05492293, 2.810873, 1, 1, 1, 1, 1,
1.295973, 1.130863, 0.5591775, 1, 1, 1, 1, 1,
1.308431, 0.329089, 4.270958, 1, 1, 1, 1, 1,
1.309367, 0.1170316, 1.259384, 1, 1, 1, 1, 1,
1.319432, -0.2236807, 2.654792, 1, 1, 1, 1, 1,
1.32811, -1.269284, 2.196416, 1, 1, 1, 1, 1,
1.336609, -0.8320246, 2.224344, 1, 1, 1, 1, 1,
1.337382, -1.130003, 2.038845, 1, 1, 1, 1, 1,
1.353537, 0.06193294, -0.2264971, 0, 0, 1, 1, 1,
1.359121, -0.2815529, 1.554271, 1, 0, 0, 1, 1,
1.379509, 0.8663738, 2.114973, 1, 0, 0, 1, 1,
1.406986, -0.335274, 4.505494, 1, 0, 0, 1, 1,
1.426535, 1.346241, 0.8239221, 1, 0, 0, 1, 1,
1.430541, 0.8959206, 0.3146736, 1, 0, 0, 1, 1,
1.441869, -0.74019, 1.943919, 0, 0, 0, 1, 1,
1.444279, -1.231421, 2.69987, 0, 0, 0, 1, 1,
1.44956, 0.4465367, 0.3699058, 0, 0, 0, 1, 1,
1.457814, 1.735845, -0.006046813, 0, 0, 0, 1, 1,
1.461425, 0.08858532, 1.674642, 0, 0, 0, 1, 1,
1.468624, -0.7631654, 1.832435, 0, 0, 0, 1, 1,
1.472479, -1.270374, 2.637087, 0, 0, 0, 1, 1,
1.475782, 0.2089229, 3.040851, 1, 1, 1, 1, 1,
1.478142, 0.7331274, 0.8317717, 1, 1, 1, 1, 1,
1.479169, -2.938996, 4.312815, 1, 1, 1, 1, 1,
1.486506, -0.1434748, 1.410935, 1, 1, 1, 1, 1,
1.499661, 0.8664382, 1.211904, 1, 1, 1, 1, 1,
1.507275, -0.2343719, 1.285618, 1, 1, 1, 1, 1,
1.533219, 0.2250215, 2.36733, 1, 1, 1, 1, 1,
1.53635, 0.330783, -0.2948264, 1, 1, 1, 1, 1,
1.543434, -0.5573716, 2.47506, 1, 1, 1, 1, 1,
1.546106, -1.698107, 2.69491, 1, 1, 1, 1, 1,
1.56338, 0.5768661, 0.851616, 1, 1, 1, 1, 1,
1.564468, -0.1725959, 1.48561, 1, 1, 1, 1, 1,
1.565619, -1.50893, 1.025904, 1, 1, 1, 1, 1,
1.57667, 0.6118904, 0.652181, 1, 1, 1, 1, 1,
1.585153, 0.8347359, 1.081432, 1, 1, 1, 1, 1,
1.587723, -0.7591347, 1.853699, 0, 0, 1, 1, 1,
1.588361, -0.1253956, 0.6320252, 1, 0, 0, 1, 1,
1.611127, -0.6807868, 1.614692, 1, 0, 0, 1, 1,
1.656522, -0.7098759, 2.919462, 1, 0, 0, 1, 1,
1.683699, -0.5556769, 1.634404, 1, 0, 0, 1, 1,
1.686647, -0.5804558, 4.408682, 1, 0, 0, 1, 1,
1.693606, 0.1599551, 1.17898, 0, 0, 0, 1, 1,
1.698972, 0.7686412, 1.648873, 0, 0, 0, 1, 1,
1.740596, -2.477924, 2.745081, 0, 0, 0, 1, 1,
1.76039, -0.8450209, 0.979619, 0, 0, 0, 1, 1,
1.764902, 0.1725296, 1.01965, 0, 0, 0, 1, 1,
1.7653, -0.6237056, 0.9586369, 0, 0, 0, 1, 1,
1.80283, 0.2128086, 0.7345068, 0, 0, 0, 1, 1,
1.845327, 0.3469171, -0.0288801, 1, 1, 1, 1, 1,
1.865721, 0.8637378, 0.9067251, 1, 1, 1, 1, 1,
1.868805, 0.05243007, 0.7044085, 1, 1, 1, 1, 1,
1.872705, 1.854167, 3.095564, 1, 1, 1, 1, 1,
1.874621, -1.565009, 3.228394, 1, 1, 1, 1, 1,
1.902989, -1.55338, 3.555815, 1, 1, 1, 1, 1,
1.913454, 0.06117974, 1.110258, 1, 1, 1, 1, 1,
1.929916, -0.3964987, 2.267875, 1, 1, 1, 1, 1,
1.940466, 0.04525768, 2.978131, 1, 1, 1, 1, 1,
1.952218, 1.127092, -0.003328728, 1, 1, 1, 1, 1,
1.981106, -1.724613, 2.261251, 1, 1, 1, 1, 1,
2.023351, 0.1656591, 2.249631, 1, 1, 1, 1, 1,
2.105826, 1.02469, 0.7438019, 1, 1, 1, 1, 1,
2.111777, -0.2182532, 1.228867, 1, 1, 1, 1, 1,
2.130441, -1.683633, 3.001638, 1, 1, 1, 1, 1,
2.142028, 0.8448019, 0.8886277, 0, 0, 1, 1, 1,
2.18856, -1.297616, 1.626492, 1, 0, 0, 1, 1,
2.19083, -1.615543, 2.042387, 1, 0, 0, 1, 1,
2.198557, 0.9289225, 0.7423494, 1, 0, 0, 1, 1,
2.227128, 0.4524242, 2.256666, 1, 0, 0, 1, 1,
2.23517, -1.011652, 3.371258, 1, 0, 0, 1, 1,
2.261144, 0.01609075, 1.077652, 0, 0, 0, 1, 1,
2.285619, -0.6434356, 1.287015, 0, 0, 0, 1, 1,
2.399283, 0.8371557, 1.213702, 0, 0, 0, 1, 1,
2.437793, -0.01044027, 1.134718, 0, 0, 0, 1, 1,
2.47509, 1.81215, 1.292713, 0, 0, 0, 1, 1,
2.49188, -0.28427, 1.732818, 0, 0, 0, 1, 1,
2.497895, 0.3953543, 1.201653, 0, 0, 0, 1, 1,
2.570413, -1.35378, 2.58388, 1, 1, 1, 1, 1,
2.578906, 0.3093525, 0.9856319, 1, 1, 1, 1, 1,
2.730648, -0.4018431, 1.008966, 1, 1, 1, 1, 1,
2.776953, 1.330429, 1.483827, 1, 1, 1, 1, 1,
2.814786, 1.285563, 0.3939225, 1, 1, 1, 1, 1,
3.10377, 0.03500273, 0.646994, 1, 1, 1, 1, 1,
3.318211, 0.4603589, 0.7542397, 1, 1, 1, 1, 1
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
var radius = 9.848464;
var distance = 34.59231;
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
mvMatrix.translate( -0.05222702, -0.06021798, -0.01761556 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.59231);
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