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
-2.928006, 0.01220203, -1.14819, 1, 0, 0, 1,
-2.664066, -0.01341365, -3.171083, 1, 0.007843138, 0, 1,
-2.613368, -1.156002, 0.02436932, 1, 0.01176471, 0, 1,
-2.441432, 0.8631986, -2.007407, 1, 0.01960784, 0, 1,
-2.423303, -0.4329224, -1.92764, 1, 0.02352941, 0, 1,
-2.305165, 0.1811977, -0.5171642, 1, 0.03137255, 0, 1,
-2.271775, -1.477999, -2.303028, 1, 0.03529412, 0, 1,
-2.220338, -0.5314627, 0.5636992, 1, 0.04313726, 0, 1,
-2.177989, 0.8350574, -1.333745, 1, 0.04705882, 0, 1,
-2.16844, 1.855688, 0.6639366, 1, 0.05490196, 0, 1,
-2.152662, -0.7278726, -2.613216, 1, 0.05882353, 0, 1,
-2.148051, 1.313071, -0.1096917, 1, 0.06666667, 0, 1,
-2.115343, 0.2718973, -1.447068, 1, 0.07058824, 0, 1,
-2.109275, 0.4708668, -4.986807, 1, 0.07843138, 0, 1,
-2.093115, 0.8302337, 0.1193244, 1, 0.08235294, 0, 1,
-2.073829, 0.6815134, -2.484397, 1, 0.09019608, 0, 1,
-2.059266, -0.9470723, -1.496258, 1, 0.09411765, 0, 1,
-1.991333, 0.8437856, -2.103238, 1, 0.1019608, 0, 1,
-1.951434, 0.570094, -0.1113925, 1, 0.1098039, 0, 1,
-1.912024, 0.8182144, -1.248864, 1, 0.1137255, 0, 1,
-1.890117, -0.133564, -2.069975, 1, 0.1215686, 0, 1,
-1.869749, 1.77887, -0.5240714, 1, 0.1254902, 0, 1,
-1.863415, 0.219831, -2.867955, 1, 0.1333333, 0, 1,
-1.853102, -1.010034, -3.278102, 1, 0.1372549, 0, 1,
-1.851597, -0.1755306, -1.767839, 1, 0.145098, 0, 1,
-1.842182, 1.488399, 0.2250589, 1, 0.1490196, 0, 1,
-1.837106, -1.202482, -0.7869824, 1, 0.1568628, 0, 1,
-1.828747, 0.5772405, -4.372954, 1, 0.1607843, 0, 1,
-1.827595, 0.3912857, -1.491477, 1, 0.1686275, 0, 1,
-1.81731, 0.07054897, -2.795513, 1, 0.172549, 0, 1,
-1.808928, 0.3386191, -3.499486, 1, 0.1803922, 0, 1,
-1.762875, -1.591716, -3.6117, 1, 0.1843137, 0, 1,
-1.751252, -0.9564644, -1.54585, 1, 0.1921569, 0, 1,
-1.742506, -0.5065611, -2.976851, 1, 0.1960784, 0, 1,
-1.73661, -1.096521, -2.521194, 1, 0.2039216, 0, 1,
-1.704799, -0.4172627, -3.288951, 1, 0.2117647, 0, 1,
-1.667954, 0.6760169, -1.328428, 1, 0.2156863, 0, 1,
-1.663718, 0.1802623, -2.849328, 1, 0.2235294, 0, 1,
-1.660982, -0.8867705, -1.949552, 1, 0.227451, 0, 1,
-1.660482, -0.09777251, -3.307418, 1, 0.2352941, 0, 1,
-1.658465, 0.9380254, -0.5412799, 1, 0.2392157, 0, 1,
-1.636609, 0.8892384, -0.5785365, 1, 0.2470588, 0, 1,
-1.621426, 0.422428, -0.8783488, 1, 0.2509804, 0, 1,
-1.621094, -0.1306083, -2.670053, 1, 0.2588235, 0, 1,
-1.610733, -1.48255, -2.018436, 1, 0.2627451, 0, 1,
-1.603981, -0.0843923, -2.574872, 1, 0.2705882, 0, 1,
-1.602242, 2.155502, -0.2857148, 1, 0.2745098, 0, 1,
-1.597862, -0.43598, -2.512777, 1, 0.282353, 0, 1,
-1.590317, 0.5609233, -1.103367, 1, 0.2862745, 0, 1,
-1.583176, -0.5983511, -3.812423, 1, 0.2941177, 0, 1,
-1.570453, -1.426626, -2.664686, 1, 0.3019608, 0, 1,
-1.568131, -0.9356967, -0.1310312, 1, 0.3058824, 0, 1,
-1.563778, -0.7862082, -2.122106, 1, 0.3137255, 0, 1,
-1.536571, -0.4552646, -1.787325, 1, 0.3176471, 0, 1,
-1.531858, -0.5098982, -3.296531, 1, 0.3254902, 0, 1,
-1.522902, 0.9385323, -0.6308277, 1, 0.3294118, 0, 1,
-1.519618, 0.2733921, 0.1700726, 1, 0.3372549, 0, 1,
-1.519344, -1.385627, -3.124818, 1, 0.3411765, 0, 1,
-1.510262, 1.70488, -1.718886, 1, 0.3490196, 0, 1,
-1.507423, 1.152631, -1.648324, 1, 0.3529412, 0, 1,
-1.494599, -0.4443121, -1.96928, 1, 0.3607843, 0, 1,
-1.476269, 0.3300409, -1.194728, 1, 0.3647059, 0, 1,
-1.473717, -0.2186927, -1.920941, 1, 0.372549, 0, 1,
-1.447454, 0.4880012, -0.3699262, 1, 0.3764706, 0, 1,
-1.439998, -0.9039304, -3.11201, 1, 0.3843137, 0, 1,
-1.426231, -0.4386613, -2.082626, 1, 0.3882353, 0, 1,
-1.425589, 0.7459418, -1.872479, 1, 0.3960784, 0, 1,
-1.407234, 0.3120982, -0.2776546, 1, 0.4039216, 0, 1,
-1.405669, 0.415695, -3.64943, 1, 0.4078431, 0, 1,
-1.404341, 0.5530494, -1.157158, 1, 0.4156863, 0, 1,
-1.392765, 0.5345269, -0.2794373, 1, 0.4196078, 0, 1,
-1.388484, -0.4363655, 0.9734025, 1, 0.427451, 0, 1,
-1.383868, -0.6368649, -2.525633, 1, 0.4313726, 0, 1,
-1.382977, 0.5957003, -3.310203, 1, 0.4392157, 0, 1,
-1.382802, 0.4999641, 0.9626564, 1, 0.4431373, 0, 1,
-1.380312, -0.1451849, -1.041315, 1, 0.4509804, 0, 1,
-1.378999, -0.821703, -4.230009, 1, 0.454902, 0, 1,
-1.357306, 0.1599246, -0.8419234, 1, 0.4627451, 0, 1,
-1.353102, 1.94569, -0.9479515, 1, 0.4666667, 0, 1,
-1.342192, 0.6318977, -0.4679923, 1, 0.4745098, 0, 1,
-1.340936, 0.3651637, -1.514591, 1, 0.4784314, 0, 1,
-1.335352, -0.3914088, -1.326793, 1, 0.4862745, 0, 1,
-1.33458, -0.1497681, -1.900071, 1, 0.4901961, 0, 1,
-1.330019, -0.4548229, -3.858417, 1, 0.4980392, 0, 1,
-1.31089, 0.6546099, -0.712057, 1, 0.5058824, 0, 1,
-1.30383, -1.195531, -3.551731, 1, 0.509804, 0, 1,
-1.301743, -0.122856, -1.284063, 1, 0.5176471, 0, 1,
-1.297496, 0.2463177, 0.01119943, 1, 0.5215687, 0, 1,
-1.28819, -0.1905864, -0.6970837, 1, 0.5294118, 0, 1,
-1.26912, -0.3038314, -3.740523, 1, 0.5333334, 0, 1,
-1.267488, -0.9608781, -2.701953, 1, 0.5411765, 0, 1,
-1.263027, -0.05363525, -0.247399, 1, 0.5450981, 0, 1,
-1.259883, 0.7239711, -1.066703, 1, 0.5529412, 0, 1,
-1.251579, -1.973462, -3.674222, 1, 0.5568628, 0, 1,
-1.236774, -0.5769526, -0.6278244, 1, 0.5647059, 0, 1,
-1.227628, 0.4627564, -1.625104, 1, 0.5686275, 0, 1,
-1.224649, -0.7365993, 0.5259427, 1, 0.5764706, 0, 1,
-1.224479, 0.5119054, 0.3397507, 1, 0.5803922, 0, 1,
-1.21053, -0.3329706, -0.8805674, 1, 0.5882353, 0, 1,
-1.204838, 0.8564078, -0.6559277, 1, 0.5921569, 0, 1,
-1.198877, 1.806023, -1.100545, 1, 0.6, 0, 1,
-1.192799, -1.637188, -1.560559, 1, 0.6078432, 0, 1,
-1.183352, -0.4670718, 0.2988486, 1, 0.6117647, 0, 1,
-1.182924, -0.05690285, -1.57853, 1, 0.6196079, 0, 1,
-1.182532, 0.231535, -1.2472, 1, 0.6235294, 0, 1,
-1.17845, -1.427907, -1.097452, 1, 0.6313726, 0, 1,
-1.170465, 0.604647, 0.1660809, 1, 0.6352941, 0, 1,
-1.169759, -0.4161709, -0.9144678, 1, 0.6431373, 0, 1,
-1.167539, 1.884644, -1.165573, 1, 0.6470588, 0, 1,
-1.166955, 1.859819, 0.3583651, 1, 0.654902, 0, 1,
-1.164942, -0.5860711, -1.978363, 1, 0.6588235, 0, 1,
-1.164454, -0.3836207, -2.3246, 1, 0.6666667, 0, 1,
-1.157794, 0.8853518, -0.7568519, 1, 0.6705883, 0, 1,
-1.146844, 0.08816937, 0.7942113, 1, 0.6784314, 0, 1,
-1.144544, -0.6353427, -0.9395238, 1, 0.682353, 0, 1,
-1.140508, 0.6457735, 0.4249538, 1, 0.6901961, 0, 1,
-1.139657, -0.4062286, -1.539705, 1, 0.6941177, 0, 1,
-1.136521, 0.266228, -3.348883, 1, 0.7019608, 0, 1,
-1.136233, 0.3534452, -1.458071, 1, 0.7098039, 0, 1,
-1.135789, -0.7797437, -1.762153, 1, 0.7137255, 0, 1,
-1.132563, -1.363006, -4.055328, 1, 0.7215686, 0, 1,
-1.128154, 0.4026589, -2.124499, 1, 0.7254902, 0, 1,
-1.124315, 1.496851, 0.08118729, 1, 0.7333333, 0, 1,
-1.122603, -0.451646, -0.6322994, 1, 0.7372549, 0, 1,
-1.117323, 1.309701, -1.05692, 1, 0.7450981, 0, 1,
-1.108714, -0.6359471, -1.94452, 1, 0.7490196, 0, 1,
-1.105632, -0.142793, -1.298947, 1, 0.7568628, 0, 1,
-1.098479, 1.162925, -1.232213, 1, 0.7607843, 0, 1,
-1.093304, -1.123971, -1.999595, 1, 0.7686275, 0, 1,
-1.088224, -1.475505, -3.742681, 1, 0.772549, 0, 1,
-1.07833, -0.7950571, -1.455673, 1, 0.7803922, 0, 1,
-1.07354, -1.383532, -1.352175, 1, 0.7843137, 0, 1,
-1.065339, -0.1740104, -0.6528035, 1, 0.7921569, 0, 1,
-1.063662, 0.8472249, -0.196394, 1, 0.7960784, 0, 1,
-1.060512, -0.07416093, -2.070299, 1, 0.8039216, 0, 1,
-1.05996, 0.4040402, -1.133365, 1, 0.8117647, 0, 1,
-1.059539, -0.1734507, -2.606661, 1, 0.8156863, 0, 1,
-1.057148, 1.200314, -1.486843, 1, 0.8235294, 0, 1,
-1.048721, -0.1939475, -2.769834, 1, 0.827451, 0, 1,
-1.044974, 0.8713155, -0.5508763, 1, 0.8352941, 0, 1,
-1.036082, 0.8555688, -2.336174, 1, 0.8392157, 0, 1,
-1.035322, -1.899813, -4.534386, 1, 0.8470588, 0, 1,
-1.033022, -0.9926909, -1.690825, 1, 0.8509804, 0, 1,
-1.021834, -0.9730597, -2.341388, 1, 0.8588235, 0, 1,
-1.007185, 1.370784, -0.5918782, 1, 0.8627451, 0, 1,
-1.003494, -1.29051, -2.800757, 1, 0.8705882, 0, 1,
-0.9909226, -0.07345251, -0.8862831, 1, 0.8745098, 0, 1,
-0.9879268, 2.019124, -0.4543851, 1, 0.8823529, 0, 1,
-0.9878308, 3.988917, -1.256779, 1, 0.8862745, 0, 1,
-0.9837849, 0.8949609, -1.398839, 1, 0.8941177, 0, 1,
-0.9764913, 1.004731, -0.9322444, 1, 0.8980392, 0, 1,
-0.9763945, 0.6586407, -3.190977, 1, 0.9058824, 0, 1,
-0.9763124, -0.01718488, -2.244989, 1, 0.9137255, 0, 1,
-0.9747933, -1.309512, -2.796645, 1, 0.9176471, 0, 1,
-0.971318, -0.8973384, -3.054285, 1, 0.9254902, 0, 1,
-0.9712887, 1.128354, -0.4580364, 1, 0.9294118, 0, 1,
-0.9654793, -1.137679, -2.160582, 1, 0.9372549, 0, 1,
-0.9583443, 0.7465906, -0.6167855, 1, 0.9411765, 0, 1,
-0.9538158, 0.9754021, -0.5033334, 1, 0.9490196, 0, 1,
-0.9491887, 0.7737007, -1.363022, 1, 0.9529412, 0, 1,
-0.9478034, 0.008013245, -1.369632, 1, 0.9607843, 0, 1,
-0.9466226, 1.460427, -0.1617527, 1, 0.9647059, 0, 1,
-0.9464049, -0.6643572, -0.8758634, 1, 0.972549, 0, 1,
-0.9444283, 0.06400524, -1.122441, 1, 0.9764706, 0, 1,
-0.9416794, -0.4038482, -3.537224, 1, 0.9843137, 0, 1,
-0.9394953, -1.455582, -1.761985, 1, 0.9882353, 0, 1,
-0.9388402, -1.242925, -4.030423, 1, 0.9960784, 0, 1,
-0.9384119, 0.9194326, 0.7499023, 0.9960784, 1, 0, 1,
-0.9219104, 0.4819509, -0.9992122, 0.9921569, 1, 0, 1,
-0.9195477, 0.5133302, -0.659885, 0.9843137, 1, 0, 1,
-0.9154274, -0.02782597, -2.753553, 0.9803922, 1, 0, 1,
-0.9150862, -0.6405318, -2.752744, 0.972549, 1, 0, 1,
-0.9072859, 0.88932, -0.194454, 0.9686275, 1, 0, 1,
-0.902053, 2.124321, 0.1861995, 0.9607843, 1, 0, 1,
-0.8999036, 2.938692, -1.562193, 0.9568627, 1, 0, 1,
-0.8993404, -1.061806, -1.880309, 0.9490196, 1, 0, 1,
-0.8949915, -0.2970776, -0.9267567, 0.945098, 1, 0, 1,
-0.892118, -1.296714, -0.7959182, 0.9372549, 1, 0, 1,
-0.8920965, 1.617011, -2.315269, 0.9333333, 1, 0, 1,
-0.8808259, 0.02498512, -2.715881, 0.9254902, 1, 0, 1,
-0.8770364, 0.4012906, -1.953802, 0.9215686, 1, 0, 1,
-0.8761953, -1.540866, -4.071727, 0.9137255, 1, 0, 1,
-0.8639185, 0.8687709, -2.6827, 0.9098039, 1, 0, 1,
-0.863175, 0.8281288, -2.46707, 0.9019608, 1, 0, 1,
-0.8629882, -0.261467, -1.708245, 0.8941177, 1, 0, 1,
-0.8595953, 1.130909, -0.4660845, 0.8901961, 1, 0, 1,
-0.8418658, 0.163272, -3.117762, 0.8823529, 1, 0, 1,
-0.8343309, -1.755359, -0.8964651, 0.8784314, 1, 0, 1,
-0.8322179, -0.8492414, -2.450047, 0.8705882, 1, 0, 1,
-0.8284233, -1.89907, -3.573377, 0.8666667, 1, 0, 1,
-0.8252312, -0.5813254, -3.03536, 0.8588235, 1, 0, 1,
-0.8211837, 0.5491229, 0.8900499, 0.854902, 1, 0, 1,
-0.8170431, 1.421207, 0.1742698, 0.8470588, 1, 0, 1,
-0.813912, -0.1019383, -3.442031, 0.8431373, 1, 0, 1,
-0.8101225, -1.115804, -2.521549, 0.8352941, 1, 0, 1,
-0.8056093, -1.629834, -2.319566, 0.8313726, 1, 0, 1,
-0.8026565, -0.8411154, -2.073385, 0.8235294, 1, 0, 1,
-0.800109, -0.4333041, -3.12394, 0.8196079, 1, 0, 1,
-0.7989323, -0.5599639, -3.113855, 0.8117647, 1, 0, 1,
-0.7955054, -0.7785423, -3.784003, 0.8078431, 1, 0, 1,
-0.7946715, 1.519081, -0.3869131, 0.8, 1, 0, 1,
-0.7866242, -1.901393, -2.26516, 0.7921569, 1, 0, 1,
-0.7807214, 1.136029, -0.5339433, 0.7882353, 1, 0, 1,
-0.7747538, -0.5237003, -1.091766, 0.7803922, 1, 0, 1,
-0.7696992, -2.05765, -2.383502, 0.7764706, 1, 0, 1,
-0.7675724, 1.032246, -0.4085634, 0.7686275, 1, 0, 1,
-0.763077, 1.696299, -0.1903472, 0.7647059, 1, 0, 1,
-0.7618046, -0.7405958, -2.804063, 0.7568628, 1, 0, 1,
-0.7603213, -0.4759616, -2.597814, 0.7529412, 1, 0, 1,
-0.7533302, 0.1094372, -3.432648, 0.7450981, 1, 0, 1,
-0.7472588, -1.132876, -3.32963, 0.7411765, 1, 0, 1,
-0.7426376, -0.9784386, -3.728353, 0.7333333, 1, 0, 1,
-0.7403752, -1.391628, -4.686853, 0.7294118, 1, 0, 1,
-0.7369946, -0.001344751, -1.678071, 0.7215686, 1, 0, 1,
-0.7337258, 0.8162215, -1.255761, 0.7176471, 1, 0, 1,
-0.7324237, 0.4236321, -0.5406858, 0.7098039, 1, 0, 1,
-0.7285738, -0.9774475, -3.312143, 0.7058824, 1, 0, 1,
-0.724936, 0.4774079, -2.571873, 0.6980392, 1, 0, 1,
-0.7166536, 0.7604936, -1.513641, 0.6901961, 1, 0, 1,
-0.7127156, -0.8749636, -3.062762, 0.6862745, 1, 0, 1,
-0.7119573, 1.391236, 0.8707053, 0.6784314, 1, 0, 1,
-0.7104433, 1.669054, -1.9483, 0.6745098, 1, 0, 1,
-0.7072399, 1.11023, -0.3318328, 0.6666667, 1, 0, 1,
-0.7068844, 1.60253, 1.779083, 0.6627451, 1, 0, 1,
-0.7027722, -1.624688, -3.392422, 0.654902, 1, 0, 1,
-0.6992479, -0.04243886, -1.450189, 0.6509804, 1, 0, 1,
-0.696345, -0.5473071, -1.633528, 0.6431373, 1, 0, 1,
-0.6914458, -0.2516942, -0.6457973, 0.6392157, 1, 0, 1,
-0.6905565, 0.7100914, -0.5566534, 0.6313726, 1, 0, 1,
-0.6871091, 0.6379375, -2.505724, 0.627451, 1, 0, 1,
-0.6787868, -0.05587464, -1.082631, 0.6196079, 1, 0, 1,
-0.6784148, -0.5506049, -3.450606, 0.6156863, 1, 0, 1,
-0.677805, 0.4752562, -2.195465, 0.6078432, 1, 0, 1,
-0.6723039, 1.156127, 0.7387133, 0.6039216, 1, 0, 1,
-0.6671486, 1.149738, 0.05190277, 0.5960785, 1, 0, 1,
-0.6611522, -0.5825141, -2.11711, 0.5882353, 1, 0, 1,
-0.6587875, 0.9617444, -2.447968, 0.5843138, 1, 0, 1,
-0.657158, -0.1712868, -3.385522, 0.5764706, 1, 0, 1,
-0.6541863, -0.8872391, -2.413501, 0.572549, 1, 0, 1,
-0.6490168, 0.4728204, -1.297157, 0.5647059, 1, 0, 1,
-0.645438, -0.3284054, -2.507344, 0.5607843, 1, 0, 1,
-0.6433393, -0.3424795, -1.861298, 0.5529412, 1, 0, 1,
-0.6422292, 0.4362134, -0.2941036, 0.5490196, 1, 0, 1,
-0.641858, 0.4711909, 0.8787857, 0.5411765, 1, 0, 1,
-0.6410477, -0.2586326, -2.463547, 0.5372549, 1, 0, 1,
-0.6374953, 0.03725471, -2.171301, 0.5294118, 1, 0, 1,
-0.635563, 0.2235669, -0.9644527, 0.5254902, 1, 0, 1,
-0.6330571, -0.9581949, -0.3715182, 0.5176471, 1, 0, 1,
-0.6272336, -1.190495, -4.391381, 0.5137255, 1, 0, 1,
-0.6232055, 0.4222316, -0.8632025, 0.5058824, 1, 0, 1,
-0.622627, -1.466125, -3.27741, 0.5019608, 1, 0, 1,
-0.6208363, -0.5666025, -3.284631, 0.4941176, 1, 0, 1,
-0.6180847, 0.6421515, -0.1798466, 0.4862745, 1, 0, 1,
-0.6119202, -1.819354, -4.100678, 0.4823529, 1, 0, 1,
-0.6095888, 1.426814, -0.3517954, 0.4745098, 1, 0, 1,
-0.6085215, 0.2473457, 0.2975498, 0.4705882, 1, 0, 1,
-0.604561, -0.1959413, -1.367694, 0.4627451, 1, 0, 1,
-0.6025172, 0.3428596, -1.409026, 0.4588235, 1, 0, 1,
-0.6021494, 0.4269489, -0.9258619, 0.4509804, 1, 0, 1,
-0.6017362, -1.100631, -3.587128, 0.4470588, 1, 0, 1,
-0.5919344, 0.8012663, -0.8834452, 0.4392157, 1, 0, 1,
-0.5891474, 0.2801387, -1.891442, 0.4352941, 1, 0, 1,
-0.5849234, -0.7918668, -2.987404, 0.427451, 1, 0, 1,
-0.5834337, 1.738814, -0.6529127, 0.4235294, 1, 0, 1,
-0.5781726, -0.9493575, -3.714777, 0.4156863, 1, 0, 1,
-0.5774366, 0.9570418, -0.9056624, 0.4117647, 1, 0, 1,
-0.5686772, -0.6373842, -2.724612, 0.4039216, 1, 0, 1,
-0.5664164, 0.3248602, -2.164741, 0.3960784, 1, 0, 1,
-0.5636901, 1.23404, 0.04178791, 0.3921569, 1, 0, 1,
-0.5580514, -0.5105237, -2.075442, 0.3843137, 1, 0, 1,
-0.5580385, 2.18505, -0.4177741, 0.3803922, 1, 0, 1,
-0.557091, 0.912506, 0.1935147, 0.372549, 1, 0, 1,
-0.551725, 1.665487, -1.028919, 0.3686275, 1, 0, 1,
-0.5496337, -0.9612169, -1.648599, 0.3607843, 1, 0, 1,
-0.5491079, 2.35598, 0.06022563, 0.3568628, 1, 0, 1,
-0.5423508, -1.504082, -2.102601, 0.3490196, 1, 0, 1,
-0.5394561, 0.2078709, -2.092048, 0.345098, 1, 0, 1,
-0.5392827, 0.9981069, 0.1829765, 0.3372549, 1, 0, 1,
-0.5390252, 0.3151323, 0.3457806, 0.3333333, 1, 0, 1,
-0.5361127, 0.253155, -1.102205, 0.3254902, 1, 0, 1,
-0.5355217, -0.739969, -2.544021, 0.3215686, 1, 0, 1,
-0.5333388, -0.1352534, -4.122731, 0.3137255, 1, 0, 1,
-0.5332503, 0.528144, 0.2877638, 0.3098039, 1, 0, 1,
-0.5298024, -0.3669469, -2.185356, 0.3019608, 1, 0, 1,
-0.5282841, 0.1554302, -0.9646655, 0.2941177, 1, 0, 1,
-0.5253116, 0.5140499, -1.385769, 0.2901961, 1, 0, 1,
-0.5244299, 0.372532, -0.5861332, 0.282353, 1, 0, 1,
-0.5235844, -1.644935, -3.015201, 0.2784314, 1, 0, 1,
-0.5227411, 1.786307, -2.070298, 0.2705882, 1, 0, 1,
-0.5215355, 0.3804972, -1.195266, 0.2666667, 1, 0, 1,
-0.5169058, -0.1896722, -2.081714, 0.2588235, 1, 0, 1,
-0.5143413, -0.4023855, -3.266495, 0.254902, 1, 0, 1,
-0.5119495, 0.7016435, -1.973062, 0.2470588, 1, 0, 1,
-0.5106031, -1.826144, -2.340626, 0.2431373, 1, 0, 1,
-0.509198, -0.2192782, -0.04439786, 0.2352941, 1, 0, 1,
-0.5088735, 1.036528, -0.3092827, 0.2313726, 1, 0, 1,
-0.5012202, 0.1888912, -3.414682, 0.2235294, 1, 0, 1,
-0.4923466, 1.160051, -1.628903, 0.2196078, 1, 0, 1,
-0.4919754, 0.2725375, -1.917156, 0.2117647, 1, 0, 1,
-0.4916569, 0.3486981, -2.319556, 0.2078431, 1, 0, 1,
-0.4915015, -0.2695903, -0.2279155, 0.2, 1, 0, 1,
-0.4864066, -0.5540707, -2.961786, 0.1921569, 1, 0, 1,
-0.4846644, -0.2994308, -2.931604, 0.1882353, 1, 0, 1,
-0.4837877, -1.24391, -4.48129, 0.1803922, 1, 0, 1,
-0.4831866, -0.6918983, -1.707278, 0.1764706, 1, 0, 1,
-0.4809941, -0.2789871, -1.785418, 0.1686275, 1, 0, 1,
-0.4803138, 0.6460803, 1.154916, 0.1647059, 1, 0, 1,
-0.4784524, -0.6398304, -2.540478, 0.1568628, 1, 0, 1,
-0.4753717, -1.681711, -3.108855, 0.1529412, 1, 0, 1,
-0.4709141, -0.5195798, -3.401617, 0.145098, 1, 0, 1,
-0.4701046, -0.3180699, -2.295576, 0.1411765, 1, 0, 1,
-0.4687733, -1.943546, -2.649873, 0.1333333, 1, 0, 1,
-0.4664467, 0.2971064, 0.6606896, 0.1294118, 1, 0, 1,
-0.4645897, -0.2304931, -0.9333969, 0.1215686, 1, 0, 1,
-0.4640603, -0.9623796, -1.979867, 0.1176471, 1, 0, 1,
-0.4615995, 0.009220858, -1.539645, 0.1098039, 1, 0, 1,
-0.4509792, -0.03637442, -2.439798, 0.1058824, 1, 0, 1,
-0.4486743, -0.1195668, -1.22199, 0.09803922, 1, 0, 1,
-0.4396473, 0.3622854, -1.691685, 0.09019608, 1, 0, 1,
-0.4383925, 0.8183023, 0.7186298, 0.08627451, 1, 0, 1,
-0.432019, -0.5227978, -1.918234, 0.07843138, 1, 0, 1,
-0.4302495, 0.1079721, -1.139394, 0.07450981, 1, 0, 1,
-0.429684, 0.9066194, -0.3953297, 0.06666667, 1, 0, 1,
-0.4209782, 0.7601962, -0.3479069, 0.0627451, 1, 0, 1,
-0.4156228, -2.566517, -2.839582, 0.05490196, 1, 0, 1,
-0.4142657, 0.5988495, -0.02985932, 0.05098039, 1, 0, 1,
-0.4074368, -0.4294364, -2.123207, 0.04313726, 1, 0, 1,
-0.4030609, -0.6392195, -3.389754, 0.03921569, 1, 0, 1,
-0.3898096, 0.6717548, -0.3551468, 0.03137255, 1, 0, 1,
-0.3848698, 1.069834, -0.04116072, 0.02745098, 1, 0, 1,
-0.3801039, -2.326495, -4.067687, 0.01960784, 1, 0, 1,
-0.3772065, 0.6895029, -0.730435, 0.01568628, 1, 0, 1,
-0.3755941, 0.8037632, -2.038145, 0.007843138, 1, 0, 1,
-0.3618506, -0.2415488, -3.212831, 0.003921569, 1, 0, 1,
-0.3608334, 0.4662386, -0.180442, 0, 1, 0.003921569, 1,
-0.3557853, 0.3930061, 0.04048542, 0, 1, 0.01176471, 1,
-0.3530489, -0.004737543, -1.505253, 0, 1, 0.01568628, 1,
-0.3529113, -0.2085217, -1.702843, 0, 1, 0.02352941, 1,
-0.3525216, -0.5227761, -2.0999, 0, 1, 0.02745098, 1,
-0.351216, -0.3373971, -2.044193, 0, 1, 0.03529412, 1,
-0.3462623, 0.3777799, -0.9146146, 0, 1, 0.03921569, 1,
-0.3437778, 1.687979, -0.6534421, 0, 1, 0.04705882, 1,
-0.34342, -1.36045, -2.343198, 0, 1, 0.05098039, 1,
-0.3423034, -0.358047, -1.727778, 0, 1, 0.05882353, 1,
-0.3421267, -0.6260799, -2.835759, 0, 1, 0.0627451, 1,
-0.3409018, 1.132146, -0.852742, 0, 1, 0.07058824, 1,
-0.3400101, -1.478777, -3.916518, 0, 1, 0.07450981, 1,
-0.339501, 0.8669001, -0.6874654, 0, 1, 0.08235294, 1,
-0.3377815, -0.8735107, -2.67768, 0, 1, 0.08627451, 1,
-0.3331442, 0.9560285, -1.388052, 0, 1, 0.09411765, 1,
-0.3316927, -0.2806445, -2.900537, 0, 1, 0.1019608, 1,
-0.3269157, 0.08993147, -0.007672195, 0, 1, 0.1058824, 1,
-0.3267272, 0.6881607, -0.2860053, 0, 1, 0.1137255, 1,
-0.3258208, 0.1050539, 0.1713619, 0, 1, 0.1176471, 1,
-0.3202482, -0.3664049, -2.355719, 0, 1, 0.1254902, 1,
-0.3199674, 0.3795677, 0.5568988, 0, 1, 0.1294118, 1,
-0.3176269, -0.3556199, -1.556388, 0, 1, 0.1372549, 1,
-0.3173335, 0.9947928, -0.8041599, 0, 1, 0.1411765, 1,
-0.3127246, -0.1728114, -1.665321, 0, 1, 0.1490196, 1,
-0.3126053, -0.2286244, -1.993051, 0, 1, 0.1529412, 1,
-0.3109038, -0.1122493, -2.108473, 0, 1, 0.1607843, 1,
-0.3107331, 1.944441, -1.968024, 0, 1, 0.1647059, 1,
-0.3089568, -1.178804, -1.57902, 0, 1, 0.172549, 1,
-0.3071871, -1.868852, -2.418307, 0, 1, 0.1764706, 1,
-0.3026947, -0.4444916, -2.356191, 0, 1, 0.1843137, 1,
-0.2980134, -2.401403, -3.259515, 0, 1, 0.1882353, 1,
-0.2904404, 0.2170792, -0.1658064, 0, 1, 0.1960784, 1,
-0.2855309, 0.4871987, 0.4412863, 0, 1, 0.2039216, 1,
-0.2839872, 0.9939639, 0.2833137, 0, 1, 0.2078431, 1,
-0.2778273, -1.438412, -3.721716, 0, 1, 0.2156863, 1,
-0.2769156, -0.7151062, -3.721352, 0, 1, 0.2196078, 1,
-0.2757854, 1.5701, -0.4530233, 0, 1, 0.227451, 1,
-0.2755282, -0.2294966, -3.471517, 0, 1, 0.2313726, 1,
-0.2711519, 0.01259297, -1.735936, 0, 1, 0.2392157, 1,
-0.2703276, -0.4321687, -1.352544, 0, 1, 0.2431373, 1,
-0.2615134, -1.335872, -1.747596, 0, 1, 0.2509804, 1,
-0.2612668, -0.438322, -1.80739, 0, 1, 0.254902, 1,
-0.2583214, 1.57829, 0.129949, 0, 1, 0.2627451, 1,
-0.2569466, -0.5011653, -2.126156, 0, 1, 0.2666667, 1,
-0.2547588, 0.6439664, -2.122394, 0, 1, 0.2745098, 1,
-0.2518044, 0.8137499, -0.312246, 0, 1, 0.2784314, 1,
-0.2485645, -1.794137, -1.99774, 0, 1, 0.2862745, 1,
-0.2483138, -1.332833, -2.553905, 0, 1, 0.2901961, 1,
-0.2459145, -0.9898034, -3.784057, 0, 1, 0.2980392, 1,
-0.2439271, 1.462912, -1.062048, 0, 1, 0.3058824, 1,
-0.24187, 0.276594, 0.7501466, 0, 1, 0.3098039, 1,
-0.2391565, -0.8471043, -3.757645, 0, 1, 0.3176471, 1,
-0.2374201, -0.04147439, -1.109921, 0, 1, 0.3215686, 1,
-0.2327001, -1.318201, -5.331005, 0, 1, 0.3294118, 1,
-0.232065, 1.023009, -0.1977582, 0, 1, 0.3333333, 1,
-0.2305127, -0.7927758, -3.446175, 0, 1, 0.3411765, 1,
-0.2290188, 1.16286, 0.6240047, 0, 1, 0.345098, 1,
-0.2220922, -1.337531, -3.445654, 0, 1, 0.3529412, 1,
-0.2140822, 2.158134, -0.7237623, 0, 1, 0.3568628, 1,
-0.2138377, -0.2856381, -2.83725, 0, 1, 0.3647059, 1,
-0.2113519, 1.192225, 1.618985, 0, 1, 0.3686275, 1,
-0.2098975, 0.1888452, -2.223727, 0, 1, 0.3764706, 1,
-0.2086435, -1.584561, -3.876827, 0, 1, 0.3803922, 1,
-0.2052361, 1.111375, 0.1343112, 0, 1, 0.3882353, 1,
-0.2050251, 1.14584, -1.55767, 0, 1, 0.3921569, 1,
-0.2047448, -1.946616, -2.163035, 0, 1, 0.4, 1,
-0.2039222, 0.8733349, -1.480872, 0, 1, 0.4078431, 1,
-0.1998557, -1.591991, -2.08391, 0, 1, 0.4117647, 1,
-0.1942625, -0.8324166, -2.467707, 0, 1, 0.4196078, 1,
-0.1910155, -0.1798873, -1.663313, 0, 1, 0.4235294, 1,
-0.1845152, 0.8112361, -0.4382931, 0, 1, 0.4313726, 1,
-0.180253, -0.4002203, -0.8119996, 0, 1, 0.4352941, 1,
-0.1765196, 0.01513043, -3.027553, 0, 1, 0.4431373, 1,
-0.1752775, 0.6631185, -1.057658, 0, 1, 0.4470588, 1,
-0.1704227, -1.012866, -2.076719, 0, 1, 0.454902, 1,
-0.169123, -0.2767688, -2.671675, 0, 1, 0.4588235, 1,
-0.1658459, -0.1061887, -1.133944, 0, 1, 0.4666667, 1,
-0.1647794, 0.3910713, -0.809233, 0, 1, 0.4705882, 1,
-0.1640716, 0.6867619, -0.08066938, 0, 1, 0.4784314, 1,
-0.1631226, -0.02758115, -2.12279, 0, 1, 0.4823529, 1,
-0.1574799, -0.1516332, -0.9125296, 0, 1, 0.4901961, 1,
-0.1570287, 0.01978752, -1.448339, 0, 1, 0.4941176, 1,
-0.1559777, -0.9423337, -1.673497, 0, 1, 0.5019608, 1,
-0.1551989, -0.4793641, -1.991617, 0, 1, 0.509804, 1,
-0.152437, 1.735095, 0.5325158, 0, 1, 0.5137255, 1,
-0.1502347, -1.043921, -3.329484, 0, 1, 0.5215687, 1,
-0.1499352, -1.655882, -2.177919, 0, 1, 0.5254902, 1,
-0.1498692, 1.045849, -0.5039263, 0, 1, 0.5333334, 1,
-0.1487296, 1.069206, -0.7674374, 0, 1, 0.5372549, 1,
-0.1478903, 1.046111, 2.019934, 0, 1, 0.5450981, 1,
-0.1469494, -1.36107, -5.926574, 0, 1, 0.5490196, 1,
-0.1412239, -0.004518302, -0.5725662, 0, 1, 0.5568628, 1,
-0.1388304, 0.6350047, 1.849828, 0, 1, 0.5607843, 1,
-0.1354585, 0.1689584, -0.4129107, 0, 1, 0.5686275, 1,
-0.1341895, -0.4629469, -2.15791, 0, 1, 0.572549, 1,
-0.1329419, -0.5162784, -3.001126, 0, 1, 0.5803922, 1,
-0.1328226, 0.7809778, -0.5525473, 0, 1, 0.5843138, 1,
-0.1309994, -0.727142, -2.177031, 0, 1, 0.5921569, 1,
-0.129818, -2.068676, -3.093446, 0, 1, 0.5960785, 1,
-0.1272268, -0.1698442, -2.993012, 0, 1, 0.6039216, 1,
-0.1245333, 0.3017926, -1.034888, 0, 1, 0.6117647, 1,
-0.1237885, -1.488438, -3.13104, 0, 1, 0.6156863, 1,
-0.1231832, 0.9687627, -1.788007, 0, 1, 0.6235294, 1,
-0.119374, 0.1332335, -1.138591, 0, 1, 0.627451, 1,
-0.1182643, 1.41014, -1.304003, 0, 1, 0.6352941, 1,
-0.1161847, 1.739912, 1.022609, 0, 1, 0.6392157, 1,
-0.1144239, 0.09975363, 0.8891413, 0, 1, 0.6470588, 1,
-0.1122253, -0.5142047, -2.982528, 0, 1, 0.6509804, 1,
-0.1112089, 1.313478, 1.906173, 0, 1, 0.6588235, 1,
-0.1110149, -0.6509347, -2.837293, 0, 1, 0.6627451, 1,
-0.1105049, 0.1260473, -0.8983536, 0, 1, 0.6705883, 1,
-0.1100161, -1.283622, -3.220303, 0, 1, 0.6745098, 1,
-0.1087221, 0.3517724, 0.6188042, 0, 1, 0.682353, 1,
-0.108475, -0.2111529, -3.88933, 0, 1, 0.6862745, 1,
-0.106611, -1.151492, -5.430211, 0, 1, 0.6941177, 1,
-0.1046046, -1.332224, -1.811241, 0, 1, 0.7019608, 1,
-0.104248, -0.5271177, -1.434321, 0, 1, 0.7058824, 1,
-0.1026485, -0.9091328, -4.427918, 0, 1, 0.7137255, 1,
-0.1007001, 0.792372, 0.8628381, 0, 1, 0.7176471, 1,
-0.1003292, -1.39941, -3.082678, 0, 1, 0.7254902, 1,
-0.09764179, -2.189279, -3.131471, 0, 1, 0.7294118, 1,
-0.09309185, -1.094857, -4.303757, 0, 1, 0.7372549, 1,
-0.08133405, 0.0973675, 0.6071262, 0, 1, 0.7411765, 1,
-0.08016186, 0.2393525, 0.7571018, 0, 1, 0.7490196, 1,
-0.0766995, -2.31186, -3.173915, 0, 1, 0.7529412, 1,
-0.07644799, -0.5789124, -1.08856, 0, 1, 0.7607843, 1,
-0.07554311, -1.446369, -2.493912, 0, 1, 0.7647059, 1,
-0.0750227, 0.9416387, -1.758007, 0, 1, 0.772549, 1,
-0.07388624, -0.5025896, -3.474945, 0, 1, 0.7764706, 1,
-0.07381912, 1.038761, -0.5985662, 0, 1, 0.7843137, 1,
-0.07358115, -0.04021305, -2.594294, 0, 1, 0.7882353, 1,
-0.07069714, 1.278609, 0.06547476, 0, 1, 0.7960784, 1,
-0.06665955, -0.7706199, -4.049016, 0, 1, 0.8039216, 1,
-0.06579528, 0.4468265, -1.356115, 0, 1, 0.8078431, 1,
-0.06294692, -1.114581, -1.471334, 0, 1, 0.8156863, 1,
-0.06082578, 0.7438617, -1.302078, 0, 1, 0.8196079, 1,
-0.06079914, -0.897996, -3.125068, 0, 1, 0.827451, 1,
-0.05934381, 1.173668, -1.106097, 0, 1, 0.8313726, 1,
-0.05510323, -1.178892, -4.044215, 0, 1, 0.8392157, 1,
-0.05208457, 0.5854343, -0.4506956, 0, 1, 0.8431373, 1,
-0.04971898, 1.125429, -1.121696, 0, 1, 0.8509804, 1,
-0.04485071, -0.2140902, -2.242975, 0, 1, 0.854902, 1,
-0.04448342, 0.08867416, -1.038217, 0, 1, 0.8627451, 1,
-0.03659828, -1.352206, -3.512961, 0, 1, 0.8666667, 1,
-0.02627007, 1.626338, 1.607141, 0, 1, 0.8745098, 1,
-0.02481959, 0.8374443, 0.122507, 0, 1, 0.8784314, 1,
-0.02117595, -0.5917573, -3.243718, 0, 1, 0.8862745, 1,
-0.01933729, 1.885283, -0.4151758, 0, 1, 0.8901961, 1,
-0.01256186, 0.3052081, 0.6391049, 0, 1, 0.8980392, 1,
-0.008648525, -0.1564357, -0.4895285, 0, 1, 0.9058824, 1,
-0.008334861, 0.3443176, -1.301148, 0, 1, 0.9098039, 1,
-0.008252523, -1.15436, -2.000888, 0, 1, 0.9176471, 1,
-0.005413362, -0.6184979, -4.178756, 0, 1, 0.9215686, 1,
-0.004884433, -0.6015568, -3.273791, 0, 1, 0.9294118, 1,
-0.00338254, 1.191091, -1.211629, 0, 1, 0.9333333, 1,
-0.0009568405, -0.2969045, -1.877073, 0, 1, 0.9411765, 1,
-0.0005340396, -1.491685, -2.334839, 0, 1, 0.945098, 1,
0.0003333292, 0.3555028, 0.1402571, 0, 1, 0.9529412, 1,
0.0009610078, -0.1027226, 4.005747, 0, 1, 0.9568627, 1,
0.001220917, 0.3847232, 0.5540457, 0, 1, 0.9647059, 1,
0.003964824, 0.3838829, 0.7038463, 0, 1, 0.9686275, 1,
0.006161856, 0.9876406, -0.8823116, 0, 1, 0.9764706, 1,
0.006342078, 0.9823714, 0.170542, 0, 1, 0.9803922, 1,
0.006978421, 0.007374885, 1.88831, 0, 1, 0.9882353, 1,
0.01470512, 0.2837104, 0.2244107, 0, 1, 0.9921569, 1,
0.01736935, 1.205161, -0.80883, 0, 1, 1, 1,
0.01899429, 0.3123386, 0.7278044, 0, 0.9921569, 1, 1,
0.02063576, 1.168923, -0.8686935, 0, 0.9882353, 1, 1,
0.02690089, -0.2138111, 1.726944, 0, 0.9803922, 1, 1,
0.03195997, -0.6630879, 2.94432, 0, 0.9764706, 1, 1,
0.03405964, -0.2681666, 5.250059, 0, 0.9686275, 1, 1,
0.03629366, -0.4316511, 2.993075, 0, 0.9647059, 1, 1,
0.03774138, 0.6225666, 0.9327403, 0, 0.9568627, 1, 1,
0.03997761, -1.821916, 3.952932, 0, 0.9529412, 1, 1,
0.04002978, -0.2513259, 2.717903, 0, 0.945098, 1, 1,
0.04016132, 1.539065, 1.887074, 0, 0.9411765, 1, 1,
0.04405829, 0.9490166, -0.7038947, 0, 0.9333333, 1, 1,
0.04841612, 0.9182763, 0.61791, 0, 0.9294118, 1, 1,
0.05113265, 0.6204185, 1.488283, 0, 0.9215686, 1, 1,
0.05122392, 1.757334, -1.698308, 0, 0.9176471, 1, 1,
0.05485398, 0.8435119, -0.1076443, 0, 0.9098039, 1, 1,
0.05847914, 1.87441, 2.33904, 0, 0.9058824, 1, 1,
0.05945561, -1.145926, 3.393253, 0, 0.8980392, 1, 1,
0.06256389, -0.02768715, 2.228595, 0, 0.8901961, 1, 1,
0.06710614, 0.5163017, -0.8517137, 0, 0.8862745, 1, 1,
0.0706007, 1.355531, 0.4251213, 0, 0.8784314, 1, 1,
0.07199431, -1.243297, 2.774549, 0, 0.8745098, 1, 1,
0.07799412, 0.5876536, -1.454638, 0, 0.8666667, 1, 1,
0.08088771, -1.620689, 4.683486, 0, 0.8627451, 1, 1,
0.08240084, -0.1017351, 1.237389, 0, 0.854902, 1, 1,
0.08425067, 0.1453168, 1.024051, 0, 0.8509804, 1, 1,
0.08852732, 0.06606662, 1.427853, 0, 0.8431373, 1, 1,
0.09217457, 0.2725076, 1.566139, 0, 0.8392157, 1, 1,
0.09320784, 1.941338, 0.1683338, 0, 0.8313726, 1, 1,
0.09399074, 0.8849582, -0.5128831, 0, 0.827451, 1, 1,
0.09660831, -1.329845, 2.350029, 0, 0.8196079, 1, 1,
0.1005685, 0.06954349, 0.9990481, 0, 0.8156863, 1, 1,
0.1027599, 0.772344, -2.463053, 0, 0.8078431, 1, 1,
0.1031644, 1.23308, 0.6126952, 0, 0.8039216, 1, 1,
0.1054745, 0.4477385, -0.4305435, 0, 0.7960784, 1, 1,
0.1076626, -0.0886135, 2.231311, 0, 0.7882353, 1, 1,
0.1081995, -0.3238193, 1.930012, 0, 0.7843137, 1, 1,
0.1101183, 0.2221773, 1.560528, 0, 0.7764706, 1, 1,
0.1105314, -0.1197868, 2.296637, 0, 0.772549, 1, 1,
0.1133736, -0.5493113, 3.077421, 0, 0.7647059, 1, 1,
0.1203267, -0.3218478, 3.035092, 0, 0.7607843, 1, 1,
0.1270299, -1.284078, 3.132782, 0, 0.7529412, 1, 1,
0.1280748, -0.4210829, 3.808037, 0, 0.7490196, 1, 1,
0.129676, 1.191689, 0.3859002, 0, 0.7411765, 1, 1,
0.131306, -0.4108659, 4.35445, 0, 0.7372549, 1, 1,
0.1352878, 0.6463249, -1.236735, 0, 0.7294118, 1, 1,
0.1355687, -1.524698, 3.345135, 0, 0.7254902, 1, 1,
0.1359893, -0.3307858, 1.601366, 0, 0.7176471, 1, 1,
0.1360541, -1.475424, 2.807639, 0, 0.7137255, 1, 1,
0.1414048, 0.6001605, 1.033765, 0, 0.7058824, 1, 1,
0.1434797, 0.3339523, 0.4397262, 0, 0.6980392, 1, 1,
0.1459231, 0.4414813, 0.1913017, 0, 0.6941177, 1, 1,
0.1470479, -0.6898745, 2.726997, 0, 0.6862745, 1, 1,
0.148074, 0.03383449, 2.690182, 0, 0.682353, 1, 1,
0.1482073, -1.132562, 2.635282, 0, 0.6745098, 1, 1,
0.1482872, 2.43064, 2.073638, 0, 0.6705883, 1, 1,
0.1522139, 1.169674, -1.371443, 0, 0.6627451, 1, 1,
0.1566944, -1.204782, 5.137386, 0, 0.6588235, 1, 1,
0.1579947, 0.8042245, -1.432741, 0, 0.6509804, 1, 1,
0.1581818, 0.1907492, -0.1646125, 0, 0.6470588, 1, 1,
0.1701999, 0.7497909, -0.565502, 0, 0.6392157, 1, 1,
0.1742489, -1.032555, 3.373108, 0, 0.6352941, 1, 1,
0.1745653, -0.3939868, 2.353543, 0, 0.627451, 1, 1,
0.1746403, -0.1927169, 3.249132, 0, 0.6235294, 1, 1,
0.1768182, -0.8453464, 2.872276, 0, 0.6156863, 1, 1,
0.1787318, -0.8008052, 2.841633, 0, 0.6117647, 1, 1,
0.1790589, 0.6817816, -0.03016275, 0, 0.6039216, 1, 1,
0.1799096, -0.415172, 2.492948, 0, 0.5960785, 1, 1,
0.1806334, -0.4506031, 1.212903, 0, 0.5921569, 1, 1,
0.1824135, -1.558711, 3.272426, 0, 0.5843138, 1, 1,
0.1839627, -0.130328, 1.309708, 0, 0.5803922, 1, 1,
0.1915815, 2.073589, -0.7187082, 0, 0.572549, 1, 1,
0.192033, -0.2342416, 1.466424, 0, 0.5686275, 1, 1,
0.1954839, -0.2594481, 0.6289338, 0, 0.5607843, 1, 1,
0.1995378, -0.1298182, 2.056322, 0, 0.5568628, 1, 1,
0.1995952, -0.3071376, 4.17147, 0, 0.5490196, 1, 1,
0.2007432, -1.012067, 3.123285, 0, 0.5450981, 1, 1,
0.2056375, 0.2358056, -0.1212194, 0, 0.5372549, 1, 1,
0.2063351, -0.1988257, 2.688638, 0, 0.5333334, 1, 1,
0.2090675, -1.027704, 3.536908, 0, 0.5254902, 1, 1,
0.2104792, 0.09959314, 2.348992, 0, 0.5215687, 1, 1,
0.2108605, -0.1974003, 2.278951, 0, 0.5137255, 1, 1,
0.2122049, 0.6582038, 0.9719282, 0, 0.509804, 1, 1,
0.2142592, -0.01146552, 3.358721, 0, 0.5019608, 1, 1,
0.2190893, 1.463825, 0.1002126, 0, 0.4941176, 1, 1,
0.2193448, 1.388131, 2.053547, 0, 0.4901961, 1, 1,
0.2207482, -0.6963773, 3.062086, 0, 0.4823529, 1, 1,
0.2254902, 0.7983668, 0.2374347, 0, 0.4784314, 1, 1,
0.2259118, 1.515517, 0.630136, 0, 0.4705882, 1, 1,
0.2269197, -0.05830304, 2.001564, 0, 0.4666667, 1, 1,
0.2373734, 0.833026, 2.489144, 0, 0.4588235, 1, 1,
0.2466587, 0.9744554, 0.996992, 0, 0.454902, 1, 1,
0.2498697, 1.353055, 2.127807, 0, 0.4470588, 1, 1,
0.2502309, 0.4094069, -0.2625504, 0, 0.4431373, 1, 1,
0.2546904, -0.5268286, 0.923637, 0, 0.4352941, 1, 1,
0.2568177, -0.06846016, 4.161102, 0, 0.4313726, 1, 1,
0.2615511, -1.021871, 2.718548, 0, 0.4235294, 1, 1,
0.2675352, 0.3105314, 0.9213372, 0, 0.4196078, 1, 1,
0.2682999, 0.4595798, 1.310114, 0, 0.4117647, 1, 1,
0.2702093, 1.086207, 0.345601, 0, 0.4078431, 1, 1,
0.2729844, 1.163371, -0.1814182, 0, 0.4, 1, 1,
0.2742383, 0.5002332, 0.7548721, 0, 0.3921569, 1, 1,
0.2742971, 0.7365155, 1.566999, 0, 0.3882353, 1, 1,
0.2746221, 0.4351903, 0.4699399, 0, 0.3803922, 1, 1,
0.2788916, -0.5424964, 1.085538, 0, 0.3764706, 1, 1,
0.2804932, -0.3151742, 2.135168, 0, 0.3686275, 1, 1,
0.2828387, -0.4124444, 3.156397, 0, 0.3647059, 1, 1,
0.2830557, -0.4531244, 2.50438, 0, 0.3568628, 1, 1,
0.2839969, -1.114489, 2.870677, 0, 0.3529412, 1, 1,
0.2843738, 2.281076, 0.4652806, 0, 0.345098, 1, 1,
0.2849224, -0.2507997, 2.576497, 0, 0.3411765, 1, 1,
0.2945946, -0.05834507, 3.464297, 0, 0.3333333, 1, 1,
0.2984527, -1.078439, 3.649573, 0, 0.3294118, 1, 1,
0.3043839, -0.3260882, 1.925476, 0, 0.3215686, 1, 1,
0.3091457, -0.1223924, 0.8464106, 0, 0.3176471, 1, 1,
0.3189576, -0.1977534, 3.142111, 0, 0.3098039, 1, 1,
0.3189799, -0.1520821, 2.539378, 0, 0.3058824, 1, 1,
0.3192217, -0.7894321, 3.290468, 0, 0.2980392, 1, 1,
0.3212368, 0.7624596, -1.0072, 0, 0.2901961, 1, 1,
0.3235831, -0.8594128, 1.54265, 0, 0.2862745, 1, 1,
0.3251684, -1.320215, 4.566724, 0, 0.2784314, 1, 1,
0.3256992, 0.07323574, 3.628291, 0, 0.2745098, 1, 1,
0.3259535, -1.86197, 4.569996, 0, 0.2666667, 1, 1,
0.3274109, -1.440813, 2.78232, 0, 0.2627451, 1, 1,
0.3284198, -1.847347, 3.58161, 0, 0.254902, 1, 1,
0.3292555, -0.6115943, 2.899151, 0, 0.2509804, 1, 1,
0.3314695, -0.4620451, 2.342519, 0, 0.2431373, 1, 1,
0.3336754, -1.363784, 4.696104, 0, 0.2392157, 1, 1,
0.333719, -0.3744653, 3.128886, 0, 0.2313726, 1, 1,
0.3348343, -1.864529, 2.64234, 0, 0.227451, 1, 1,
0.3417336, -0.4563413, 1.85705, 0, 0.2196078, 1, 1,
0.3463384, 0.3828222, 1.27883, 0, 0.2156863, 1, 1,
0.346587, -1.590679, 2.994291, 0, 0.2078431, 1, 1,
0.3482889, 0.2080462, 0.3509282, 0, 0.2039216, 1, 1,
0.3488123, 1.305725, 0.05000285, 0, 0.1960784, 1, 1,
0.3498025, 0.0702918, 2.297604, 0, 0.1882353, 1, 1,
0.349958, -1.78215, 3.16276, 0, 0.1843137, 1, 1,
0.3508765, -0.9181728, 2.477637, 0, 0.1764706, 1, 1,
0.352002, -1.688129, 2.769731, 0, 0.172549, 1, 1,
0.3556403, -0.6344777, 3.838554, 0, 0.1647059, 1, 1,
0.3568129, 1.845785, 1.209119, 0, 0.1607843, 1, 1,
0.3592961, 0.9300256, 1.952684, 0, 0.1529412, 1, 1,
0.3598562, 0.3942119, 2.645898, 0, 0.1490196, 1, 1,
0.3643027, -1.113373, 1.672494, 0, 0.1411765, 1, 1,
0.3672255, 1.67181, 1.783658, 0, 0.1372549, 1, 1,
0.3704334, 0.907104, -0.4548212, 0, 0.1294118, 1, 1,
0.3728101, 1.234502, -0.7925808, 0, 0.1254902, 1, 1,
0.3743106, -0.291364, 2.447961, 0, 0.1176471, 1, 1,
0.3749678, -0.2533081, 3.303697, 0, 0.1137255, 1, 1,
0.3773648, 0.2820037, 1.063417, 0, 0.1058824, 1, 1,
0.3795707, -0.5185807, 2.736764, 0, 0.09803922, 1, 1,
0.3802519, 0.6968032, -0.688634, 0, 0.09411765, 1, 1,
0.3860271, -0.1491903, 3.245954, 0, 0.08627451, 1, 1,
0.3870995, 0.5960559, 0.3634565, 0, 0.08235294, 1, 1,
0.3930427, -0.8247573, 4.287821, 0, 0.07450981, 1, 1,
0.394186, 0.720621, 1.130412, 0, 0.07058824, 1, 1,
0.4037491, -0.5076296, 3.450739, 0, 0.0627451, 1, 1,
0.4065374, 0.4813918, 2.442483, 0, 0.05882353, 1, 1,
0.4179991, 1.346878, 1.157499, 0, 0.05098039, 1, 1,
0.4214712, 0.7469596, 0.2597615, 0, 0.04705882, 1, 1,
0.4219252, 0.8752481, -0.2147046, 0, 0.03921569, 1, 1,
0.4248079, 0.2255794, 1.110077, 0, 0.03529412, 1, 1,
0.42481, -0.08392116, 2.175814, 0, 0.02745098, 1, 1,
0.4255768, -1.087179, 1.550185, 0, 0.02352941, 1, 1,
0.4264087, 1.04457, -0.9347282, 0, 0.01568628, 1, 1,
0.4329115, 1.782858, -1.549958, 0, 0.01176471, 1, 1,
0.4336878, 1.26098, -0.1049968, 0, 0.003921569, 1, 1,
0.433693, 1.678159, -0.0704058, 0.003921569, 0, 1, 1,
0.4385476, 1.110104, -1.051558, 0.007843138, 0, 1, 1,
0.4391404, 1.626726, 1.061536, 0.01568628, 0, 1, 1,
0.4405062, 1.338449, -0.4444132, 0.01960784, 0, 1, 1,
0.443662, 2.34143, 0.6473698, 0.02745098, 0, 1, 1,
0.4450129, -2.353333, 2.762127, 0.03137255, 0, 1, 1,
0.4477318, 0.1549931, 1.441532, 0.03921569, 0, 1, 1,
0.4491559, -1.484274, 2.587193, 0.04313726, 0, 1, 1,
0.4496427, -0.1658852, 2.33612, 0.05098039, 0, 1, 1,
0.4532542, 0.5611044, 0.9781439, 0.05490196, 0, 1, 1,
0.4550775, 0.3851646, 0.7214923, 0.0627451, 0, 1, 1,
0.4557356, 0.1595444, 0.1125124, 0.06666667, 0, 1, 1,
0.4559904, 0.762036, 2.569263, 0.07450981, 0, 1, 1,
0.4579014, 0.937952, -0.474174, 0.07843138, 0, 1, 1,
0.4594217, -0.9457723, 0.6023703, 0.08627451, 0, 1, 1,
0.4611661, 0.880569, 1.094149, 0.09019608, 0, 1, 1,
0.465433, -0.1556527, 2.747295, 0.09803922, 0, 1, 1,
0.465578, -1.49047, 3.463865, 0.1058824, 0, 1, 1,
0.4708557, 1.037183, 1.675542, 0.1098039, 0, 1, 1,
0.4723435, 0.2575213, 0.4663843, 0.1176471, 0, 1, 1,
0.4753068, 0.1410157, 0.6221462, 0.1215686, 0, 1, 1,
0.4753812, -0.4522467, 0.3563822, 0.1294118, 0, 1, 1,
0.4767228, 1.752059, 0.5275101, 0.1333333, 0, 1, 1,
0.4815557, 0.9738455, -0.4418907, 0.1411765, 0, 1, 1,
0.4840651, -1.446361, 3.132195, 0.145098, 0, 1, 1,
0.4852627, 3.268412, -0.02835067, 0.1529412, 0, 1, 1,
0.4873303, -0.01045832, 2.052741, 0.1568628, 0, 1, 1,
0.489824, 1.736126, -0.6120763, 0.1647059, 0, 1, 1,
0.4908633, 1.330481, 0.2738697, 0.1686275, 0, 1, 1,
0.4951832, 1.097769, 0.6443713, 0.1764706, 0, 1, 1,
0.4954225, 0.9422688, 0.909256, 0.1803922, 0, 1, 1,
0.495867, -1.671653, 3.841485, 0.1882353, 0, 1, 1,
0.4979268, 0.208462, 1.719337, 0.1921569, 0, 1, 1,
0.5013927, -0.9428718, 3.86147, 0.2, 0, 1, 1,
0.5083242, -1.584905, 2.158726, 0.2078431, 0, 1, 1,
0.5096396, -0.3189495, 2.03453, 0.2117647, 0, 1, 1,
0.510833, -1.335548, 2.671587, 0.2196078, 0, 1, 1,
0.5137689, 0.2341642, 0.7158638, 0.2235294, 0, 1, 1,
0.5164334, -1.018023, 3.3273, 0.2313726, 0, 1, 1,
0.5217558, -1.496793, 3.994692, 0.2352941, 0, 1, 1,
0.5235485, 1.355974, -1.840214, 0.2431373, 0, 1, 1,
0.5236926, 0.4719863, 0.8121403, 0.2470588, 0, 1, 1,
0.5275969, -1.204484, 2.641833, 0.254902, 0, 1, 1,
0.5448599, 0.005309075, 0.7208877, 0.2588235, 0, 1, 1,
0.5475495, -0.7590743, 0.571018, 0.2666667, 0, 1, 1,
0.5496683, -0.8950453, 2.954681, 0.2705882, 0, 1, 1,
0.5527036, 0.3789451, 1.262558, 0.2784314, 0, 1, 1,
0.5545822, -1.253067, 1.325229, 0.282353, 0, 1, 1,
0.5610901, -0.04160059, 2.178272, 0.2901961, 0, 1, 1,
0.5742273, -0.9103066, 2.435636, 0.2941177, 0, 1, 1,
0.5744236, 1.206428, 1.175893, 0.3019608, 0, 1, 1,
0.5755612, -1.067472, 0.9219272, 0.3098039, 0, 1, 1,
0.579386, 0.9637596, 1.26793, 0.3137255, 0, 1, 1,
0.5832943, -0.362104, 3.530136, 0.3215686, 0, 1, 1,
0.5859885, -1.455667, 2.980163, 0.3254902, 0, 1, 1,
0.586227, -1.133536, 1.162495, 0.3333333, 0, 1, 1,
0.5865155, 0.8545462, 0.6452633, 0.3372549, 0, 1, 1,
0.5874347, -0.5240619, 2.033248, 0.345098, 0, 1, 1,
0.5886931, 2.536188, 0.303584, 0.3490196, 0, 1, 1,
0.5964823, 1.266112, 2.069811, 0.3568628, 0, 1, 1,
0.5971709, -0.8829395, 2.600139, 0.3607843, 0, 1, 1,
0.5994514, 0.02276795, 2.067976, 0.3686275, 0, 1, 1,
0.6005614, 0.2471323, -0.2548559, 0.372549, 0, 1, 1,
0.6013949, 1.427189, 0.2113577, 0.3803922, 0, 1, 1,
0.6018165, -1.129521, 3.374312, 0.3843137, 0, 1, 1,
0.6090333, 2.046835, -1.180072, 0.3921569, 0, 1, 1,
0.6094502, -0.04121641, 2.607987, 0.3960784, 0, 1, 1,
0.6134214, 1.287499, 1.602717, 0.4039216, 0, 1, 1,
0.6152816, -0.4766016, 2.742601, 0.4117647, 0, 1, 1,
0.6191878, -0.3726353, 3.346509, 0.4156863, 0, 1, 1,
0.6192102, -0.1275803, 2.933249, 0.4235294, 0, 1, 1,
0.6201105, -0.8341499, 3.049818, 0.427451, 0, 1, 1,
0.621896, 0.02028713, 2.454107, 0.4352941, 0, 1, 1,
0.6231878, 0.09590919, 0.2588638, 0.4392157, 0, 1, 1,
0.6237682, 0.6263399, -0.2185463, 0.4470588, 0, 1, 1,
0.6298214, -0.4490597, 3.999599, 0.4509804, 0, 1, 1,
0.6325087, -0.5129932, 2.889412, 0.4588235, 0, 1, 1,
0.6327531, -1.306637, 2.220147, 0.4627451, 0, 1, 1,
0.64451, -0.6199335, 0.8134937, 0.4705882, 0, 1, 1,
0.6463646, -0.05629699, 0.7196031, 0.4745098, 0, 1, 1,
0.6513513, 0.536096, -0.2776206, 0.4823529, 0, 1, 1,
0.6558113, 0.4816557, 1.451138, 0.4862745, 0, 1, 1,
0.6574665, -0.1759145, 2.544733, 0.4941176, 0, 1, 1,
0.6574866, 0.5729834, 2.057745, 0.5019608, 0, 1, 1,
0.6650042, 0.4923388, -0.8728302, 0.5058824, 0, 1, 1,
0.6694786, -0.2845233, 2.561928, 0.5137255, 0, 1, 1,
0.6722057, 0.4164152, 1.720022, 0.5176471, 0, 1, 1,
0.6740996, 0.5056725, 2.954463, 0.5254902, 0, 1, 1,
0.6746298, -1.109163, 3.066668, 0.5294118, 0, 1, 1,
0.6753668, 1.961275, 0.729755, 0.5372549, 0, 1, 1,
0.694115, -1.126581, 0.9001824, 0.5411765, 0, 1, 1,
0.6948461, 0.05521108, 1.103502, 0.5490196, 0, 1, 1,
0.7032201, 1.746522, 0.5464936, 0.5529412, 0, 1, 1,
0.7037169, -0.2955485, 2.665768, 0.5607843, 0, 1, 1,
0.7083374, 0.4684135, 2.68589, 0.5647059, 0, 1, 1,
0.7097976, -1.75551, 4.047745, 0.572549, 0, 1, 1,
0.7141766, 0.89303, -1.066736, 0.5764706, 0, 1, 1,
0.7156771, -0.002739462, 2.047515, 0.5843138, 0, 1, 1,
0.7202296, -0.4792042, 2.397335, 0.5882353, 0, 1, 1,
0.720741, 0.3276023, 2.207767, 0.5960785, 0, 1, 1,
0.7243283, 0.6654095, 0.233882, 0.6039216, 0, 1, 1,
0.7267871, -1.070274, 2.676813, 0.6078432, 0, 1, 1,
0.7284344, 0.3321676, 1.735769, 0.6156863, 0, 1, 1,
0.7287149, 1.492522, 0.4366921, 0.6196079, 0, 1, 1,
0.7295932, -0.8827639, 3.163836, 0.627451, 0, 1, 1,
0.7333721, -1.325147, 4.031251, 0.6313726, 0, 1, 1,
0.737944, -1.592394, 1.486939, 0.6392157, 0, 1, 1,
0.7410895, -2.075167, 3.123986, 0.6431373, 0, 1, 1,
0.7416501, -0.9955254, 1.970059, 0.6509804, 0, 1, 1,
0.7427829, -0.6522147, 2.98579, 0.654902, 0, 1, 1,
0.7453701, -0.3321634, 1.340359, 0.6627451, 0, 1, 1,
0.7476539, 0.953949, 1.197617, 0.6666667, 0, 1, 1,
0.7525148, -0.4552622, 2.257565, 0.6745098, 0, 1, 1,
0.7530984, 0.07816032, 0.821828, 0.6784314, 0, 1, 1,
0.7535125, 0.2853895, 0.04768544, 0.6862745, 0, 1, 1,
0.7556408, -0.4840419, 1.641688, 0.6901961, 0, 1, 1,
0.7578354, 0.7265784, -0.4307693, 0.6980392, 0, 1, 1,
0.7629052, 0.3452762, 0.7464418, 0.7058824, 0, 1, 1,
0.7646563, -0.3866023, 0.3215363, 0.7098039, 0, 1, 1,
0.7680423, -0.03400005, 2.074436, 0.7176471, 0, 1, 1,
0.7716117, -1.861781, 3.495544, 0.7215686, 0, 1, 1,
0.7725643, 0.9801168, -0.09912577, 0.7294118, 0, 1, 1,
0.7737274, 0.5570435, 1.303222, 0.7333333, 0, 1, 1,
0.7771716, -0.3239096, 3.36184, 0.7411765, 0, 1, 1,
0.7776721, 0.08961226, 2.090088, 0.7450981, 0, 1, 1,
0.7778117, 0.8313699, 0.6827514, 0.7529412, 0, 1, 1,
0.779221, 0.4566676, 0.9982657, 0.7568628, 0, 1, 1,
0.7877352, -0.5086589, 1.160852, 0.7647059, 0, 1, 1,
0.7884374, 0.5790861, 1.033351, 0.7686275, 0, 1, 1,
0.7915284, -0.7697718, 2.349899, 0.7764706, 0, 1, 1,
0.7917477, -1.275667, 2.317664, 0.7803922, 0, 1, 1,
0.7932659, -0.1560944, 0.9547563, 0.7882353, 0, 1, 1,
0.7955954, -0.5381356, 1.809185, 0.7921569, 0, 1, 1,
0.7960981, 0.11893, 0.1084685, 0.8, 0, 1, 1,
0.7992168, -0.8020445, 4.069209, 0.8078431, 0, 1, 1,
0.8006257, 1.452268, 2.796436, 0.8117647, 0, 1, 1,
0.8033156, 0.6605681, 0.1458012, 0.8196079, 0, 1, 1,
0.8090512, -1.100709, 2.613839, 0.8235294, 0, 1, 1,
0.8313478, 1.24396, 0.2033319, 0.8313726, 0, 1, 1,
0.8319051, 0.495855, 0.4935234, 0.8352941, 0, 1, 1,
0.8330064, 0.5340425, 3.22975, 0.8431373, 0, 1, 1,
0.8335912, 0.1934974, 1.799743, 0.8470588, 0, 1, 1,
0.8411103, 0.553171, 0.2943047, 0.854902, 0, 1, 1,
0.8440502, 0.3460583, 0.6781392, 0.8588235, 0, 1, 1,
0.8491496, 0.4625428, 2.470606, 0.8666667, 0, 1, 1,
0.8509318, 0.05793604, 0.1425807, 0.8705882, 0, 1, 1,
0.851042, 1.564221, 1.557105, 0.8784314, 0, 1, 1,
0.8519453, 0.4000731, -0.1172919, 0.8823529, 0, 1, 1,
0.8531739, -0.2724394, 4.34678, 0.8901961, 0, 1, 1,
0.8560017, -0.7789567, 1.700422, 0.8941177, 0, 1, 1,
0.8785306, 0.5266225, 0.9045616, 0.9019608, 0, 1, 1,
0.88533, 0.1085975, 2.039887, 0.9098039, 0, 1, 1,
0.8926445, 2.627735, -0.071761, 0.9137255, 0, 1, 1,
0.8948897, -0.8996555, 2.564126, 0.9215686, 0, 1, 1,
0.8969967, -0.5183305, 1.228409, 0.9254902, 0, 1, 1,
0.9007529, 2.116227, -1.377011, 0.9333333, 0, 1, 1,
0.906233, -0.08340646, 0.7362286, 0.9372549, 0, 1, 1,
0.9082401, -0.3907133, 1.276343, 0.945098, 0, 1, 1,
0.9087806, -0.9323788, 2.592329, 0.9490196, 0, 1, 1,
0.9125496, 0.80633, 0.2173468, 0.9568627, 0, 1, 1,
0.9195707, -0.1407401, 0.3379813, 0.9607843, 0, 1, 1,
0.9241862, 1.155278, 0.1452793, 0.9686275, 0, 1, 1,
0.9372994, -0.9240789, 3.136413, 0.972549, 0, 1, 1,
0.9408914, 0.5982924, 0.5153981, 0.9803922, 0, 1, 1,
0.9451814, -0.8197228, 2.956014, 0.9843137, 0, 1, 1,
0.9469322, 0.1597777, 1.158597, 0.9921569, 0, 1, 1,
0.9470892, -2.120126, 3.205711, 0.9960784, 0, 1, 1,
0.9533886, -0.3323432, 1.063031, 1, 0, 0.9960784, 1,
0.9563389, -0.4378504, 0.9863305, 1, 0, 0.9882353, 1,
0.9585536, -0.6192386, 2.976638, 1, 0, 0.9843137, 1,
0.964523, 0.3528101, 1.239789, 1, 0, 0.9764706, 1,
0.9647648, 0.8612407, -1.005962, 1, 0, 0.972549, 1,
0.9686015, 0.3864164, -0.4792423, 1, 0, 0.9647059, 1,
0.975323, 0.04210766, 3.263446, 1, 0, 0.9607843, 1,
0.9804002, 1.510537, 1.489925, 1, 0, 0.9529412, 1,
0.9815307, 2.041306, 1.408227, 1, 0, 0.9490196, 1,
0.9815753, -1.314998, 2.449535, 1, 0, 0.9411765, 1,
0.9857779, -0.634105, 4.026933, 1, 0, 0.9372549, 1,
0.9887166, 0.9612644, 0.7323302, 1, 0, 0.9294118, 1,
0.9904491, 0.05475412, 4.273318, 1, 0, 0.9254902, 1,
0.9907347, -3.212945, 1.843662, 1, 0, 0.9176471, 1,
0.990845, 0.0840205, 1.552834, 1, 0, 0.9137255, 1,
1.003918, 0.2540027, 1.381736, 1, 0, 0.9058824, 1,
1.016374, -0.7413832, 3.465141, 1, 0, 0.9019608, 1,
1.01752, 0.8627924, 1.802365, 1, 0, 0.8941177, 1,
1.024062, -0.02104237, 3.148527, 1, 0, 0.8862745, 1,
1.029903, -0.0553431, 1.345859, 1, 0, 0.8823529, 1,
1.033021, -0.5926962, 1.517002, 1, 0, 0.8745098, 1,
1.033361, -1.312655, 2.622946, 1, 0, 0.8705882, 1,
1.033993, -0.5847363, 1.924744, 1, 0, 0.8627451, 1,
1.044019, -0.237054, 2.16993, 1, 0, 0.8588235, 1,
1.045968, 0.3627723, 0.6337304, 1, 0, 0.8509804, 1,
1.04909, -1.536941, 3.215727, 1, 0, 0.8470588, 1,
1.053423, -0.4572348, 2.689586, 1, 0, 0.8392157, 1,
1.062646, 0.1674994, 2.609056, 1, 0, 0.8352941, 1,
1.081928, -0.2846852, 0.8912308, 1, 0, 0.827451, 1,
1.082212, 1.589787, 1.080842, 1, 0, 0.8235294, 1,
1.096825, -0.1537106, 1.461938, 1, 0, 0.8156863, 1,
1.098751, -0.3859623, 2.442593, 1, 0, 0.8117647, 1,
1.100755, 0.9855661, -0.08137834, 1, 0, 0.8039216, 1,
1.101133, 0.5708156, 1.3638, 1, 0, 0.7960784, 1,
1.102049, 0.6497672, -0.08173113, 1, 0, 0.7921569, 1,
1.102746, 1.439417, 0.5532132, 1, 0, 0.7843137, 1,
1.116611, 0.08190896, 1.818552, 1, 0, 0.7803922, 1,
1.119094, 0.05191998, 0.4689053, 1, 0, 0.772549, 1,
1.11917, 0.6778203, 1.754064, 1, 0, 0.7686275, 1,
1.120204, -0.1853104, 2.854413, 1, 0, 0.7607843, 1,
1.122054, -0.381623, 2.655806, 1, 0, 0.7568628, 1,
1.126549, 0.5600403, 1.640674, 1, 0, 0.7490196, 1,
1.129418, -0.3583826, 0.4184992, 1, 0, 0.7450981, 1,
1.134297, -1.039021, 0.3656846, 1, 0, 0.7372549, 1,
1.134382, -0.6165236, 2.876336, 1, 0, 0.7333333, 1,
1.141054, -0.2865687, 1.105881, 1, 0, 0.7254902, 1,
1.142665, -1.658816, 2.385341, 1, 0, 0.7215686, 1,
1.146481, 0.2414368, 1.66919, 1, 0, 0.7137255, 1,
1.155212, 0.7200133, 1.073381, 1, 0, 0.7098039, 1,
1.161836, 0.6459661, 1.744217, 1, 0, 0.7019608, 1,
1.163574, -1.130481, 3.680704, 1, 0, 0.6941177, 1,
1.170159, 0.4484754, 0.3990719, 1, 0, 0.6901961, 1,
1.183169, -0.2594041, 0.2793029, 1, 0, 0.682353, 1,
1.196237, -0.04220262, 1.114369, 1, 0, 0.6784314, 1,
1.199625, 0.7591962, 1.06215, 1, 0, 0.6705883, 1,
1.200047, 0.400501, 0.9200661, 1, 0, 0.6666667, 1,
1.20357, -0.0245477, 1.288011, 1, 0, 0.6588235, 1,
1.20785, -0.3509792, 1.839582, 1, 0, 0.654902, 1,
1.209154, 0.8311952, -0.2589751, 1, 0, 0.6470588, 1,
1.212694, 0.3191926, 2.612682, 1, 0, 0.6431373, 1,
1.21427, 0.8065538, 0.1639046, 1, 0, 0.6352941, 1,
1.215969, 0.6736107, 0.09151132, 1, 0, 0.6313726, 1,
1.224421, -1.602387, 2.423964, 1, 0, 0.6235294, 1,
1.225459, 0.6221076, 1.453966, 1, 0, 0.6196079, 1,
1.227561, -0.01929567, 1.030435, 1, 0, 0.6117647, 1,
1.227583, -0.2967417, 2.696377, 1, 0, 0.6078432, 1,
1.231495, -0.1092227, 3.325082, 1, 0, 0.6, 1,
1.231535, 1.384708, 0.8211595, 1, 0, 0.5921569, 1,
1.235201, -0.9119785, 0.9880471, 1, 0, 0.5882353, 1,
1.236558, -0.008289428, 2.05219, 1, 0, 0.5803922, 1,
1.247206, -0.7385954, 3.035856, 1, 0, 0.5764706, 1,
1.266574, 1.648861, 2.011627, 1, 0, 0.5686275, 1,
1.267509, 0.2582408, 1.171743, 1, 0, 0.5647059, 1,
1.280242, -1.207929, 2.707849, 1, 0, 0.5568628, 1,
1.28069, -0.4560744, 1.917238, 1, 0, 0.5529412, 1,
1.290541, -1.194649, 1.49402, 1, 0, 0.5450981, 1,
1.291675, -0.5782724, 1.534912, 1, 0, 0.5411765, 1,
1.29372, 0.05457571, 1.340776, 1, 0, 0.5333334, 1,
1.294092, -0.3868811, 1.945017, 1, 0, 0.5294118, 1,
1.298377, -0.5694691, 0.8632568, 1, 0, 0.5215687, 1,
1.299001, 1.757015, 1.558103, 1, 0, 0.5176471, 1,
1.300582, -1.351575, 4.89087, 1, 0, 0.509804, 1,
1.302335, -3.072344, 0.5182931, 1, 0, 0.5058824, 1,
1.312854, 0.1235891, 1.378225, 1, 0, 0.4980392, 1,
1.328886, 0.404184, 2.772867, 1, 0, 0.4901961, 1,
1.331056, 0.3449798, 1.973424, 1, 0, 0.4862745, 1,
1.33729, 2.327205, 0.9412268, 1, 0, 0.4784314, 1,
1.344501, -0.333043, 1.721248, 1, 0, 0.4745098, 1,
1.350827, -1.248464, 2.231342, 1, 0, 0.4666667, 1,
1.376231, 0.4163034, 0.7696329, 1, 0, 0.4627451, 1,
1.384572, -0.9811357, 3.127579, 1, 0, 0.454902, 1,
1.391166, -0.8122784, 2.493098, 1, 0, 0.4509804, 1,
1.416605, -1.017843, 2.974925, 1, 0, 0.4431373, 1,
1.419657, -0.2593956, 1.864735, 1, 0, 0.4392157, 1,
1.419808, 0.1845104, -0.03395659, 1, 0, 0.4313726, 1,
1.42716, 2.402799, 1.081448, 1, 0, 0.427451, 1,
1.430382, 1.516885, 1.926111, 1, 0, 0.4196078, 1,
1.442287, 1.855396, 2.110902, 1, 0, 0.4156863, 1,
1.445518, 0.3745598, 1.319853, 1, 0, 0.4078431, 1,
1.450712, 0.5847133, 1.604242, 1, 0, 0.4039216, 1,
1.454219, 0.7487752, 1.709797, 1, 0, 0.3960784, 1,
1.45982, 0.671053, 2.381137, 1, 0, 0.3882353, 1,
1.465488, -0.5699641, 1.639906, 1, 0, 0.3843137, 1,
1.466528, 1.322198, 1.154116, 1, 0, 0.3764706, 1,
1.470848, -0.7281969, 1.556179, 1, 0, 0.372549, 1,
1.485126, -0.3150133, 2.086452, 1, 0, 0.3647059, 1,
1.48852, -0.05110133, 0.1226716, 1, 0, 0.3607843, 1,
1.49876, 0.2197676, 1.302349, 1, 0, 0.3529412, 1,
1.507127, 1.795267, 0.541934, 1, 0, 0.3490196, 1,
1.532792, 0.1451929, 1.515147, 1, 0, 0.3411765, 1,
1.535636, 0.3289483, 1.682497, 1, 0, 0.3372549, 1,
1.546261, -0.2196117, 1.295608, 1, 0, 0.3294118, 1,
1.554168, -0.2713979, 2.150918, 1, 0, 0.3254902, 1,
1.559962, 1.045479, 1.04567, 1, 0, 0.3176471, 1,
1.563164, 0.455757, -0.3782693, 1, 0, 0.3137255, 1,
1.569132, 1.368391, -0.3025973, 1, 0, 0.3058824, 1,
1.572932, 1.199875, 1.361518, 1, 0, 0.2980392, 1,
1.576614, 1.395537, -1.703399, 1, 0, 0.2941177, 1,
1.578092, 2.140095, -0.678476, 1, 0, 0.2862745, 1,
1.579829, -0.3923728, 3.083447, 1, 0, 0.282353, 1,
1.609815, 0.2787128, 1.078316, 1, 0, 0.2745098, 1,
1.610558, -1.519996, 1.481802, 1, 0, 0.2705882, 1,
1.627948, -1.625845, 3.08542, 1, 0, 0.2627451, 1,
1.660311, -2.467067, 1.694205, 1, 0, 0.2588235, 1,
1.667735, 0.2453955, 2.411896, 1, 0, 0.2509804, 1,
1.669706, -0.3503202, -1.257626, 1, 0, 0.2470588, 1,
1.671921, 0.7688181, 1.504346, 1, 0, 0.2392157, 1,
1.676072, 0.5000783, 1.58023, 1, 0, 0.2352941, 1,
1.680658, -0.9770734, 2.00966, 1, 0, 0.227451, 1,
1.689066, 1.579531, 1.330365, 1, 0, 0.2235294, 1,
1.714508, 0.5259151, 2.346933, 1, 0, 0.2156863, 1,
1.733185, -1.512401, -0.4498389, 1, 0, 0.2117647, 1,
1.734336, 0.177017, 0.2536485, 1, 0, 0.2039216, 1,
1.744056, 0.1030979, 4.264689, 1, 0, 0.1960784, 1,
1.74493, 0.125499, 2.242894, 1, 0, 0.1921569, 1,
1.747392, 0.8578785, 2.958952, 1, 0, 0.1843137, 1,
1.766382, 1.15119, 0.9958198, 1, 0, 0.1803922, 1,
1.812891, 0.626178, 1.803367, 1, 0, 0.172549, 1,
1.829683, 0.4998863, 1.340194, 1, 0, 0.1686275, 1,
1.833266, -0.8637576, 0.9167073, 1, 0, 0.1607843, 1,
1.845313, 0.9535233, -2.452653, 1, 0, 0.1568628, 1,
1.853795, 0.278834, 0.2538177, 1, 0, 0.1490196, 1,
1.890092, -0.4134348, 1.81383, 1, 0, 0.145098, 1,
1.898915, 0.7356505, 1.267332, 1, 0, 0.1372549, 1,
1.901891, -0.6226345, 2.004055, 1, 0, 0.1333333, 1,
1.905006, 1.272623, 1.120203, 1, 0, 0.1254902, 1,
1.915696, 0.5816163, 2.620976, 1, 0, 0.1215686, 1,
1.937634, 0.5881888, 1.263495, 1, 0, 0.1137255, 1,
1.977551, -0.4167842, 1.576497, 1, 0, 0.1098039, 1,
2.007087, 0.6172647, 1.456147, 1, 0, 0.1019608, 1,
2.012163, -1.670341, 2.754501, 1, 0, 0.09411765, 1,
2.045166, -1.563579, 3.407669, 1, 0, 0.09019608, 1,
2.0617, -1.80647, 2.364708, 1, 0, 0.08235294, 1,
2.137873, -1.071611, 3.390332, 1, 0, 0.07843138, 1,
2.16551, -1.203518, 0.2599822, 1, 0, 0.07058824, 1,
2.22551, -0.3705941, 0.06292474, 1, 0, 0.06666667, 1,
2.276718, 0.927558, 1.947335, 1, 0, 0.05882353, 1,
2.322668, 1.443832, -0.0402937, 1, 0, 0.05490196, 1,
2.327545, 0.7054554, -0.7294954, 1, 0, 0.04705882, 1,
2.332944, 1.544037, -0.05582844, 1, 0, 0.04313726, 1,
2.372504, -1.123639, 1.955404, 1, 0, 0.03529412, 1,
2.381299, -0.115796, 1.892138, 1, 0, 0.03137255, 1,
2.428481, 1.329483, 1.065671, 1, 0, 0.02352941, 1,
2.843498, -0.8534417, 2.349804, 1, 0, 0.01960784, 1,
2.844126, 0.2823469, 3.11145, 1, 0, 0.01176471, 1,
2.885509, 0.5746734, 1.650674, 1, 0, 0.007843138, 1
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
-0.0212481, -4.43366, -7.821013, 0, -0.5, 0.5, 0.5,
-0.0212481, -4.43366, -7.821013, 1, -0.5, 0.5, 0.5,
-0.0212481, -4.43366, -7.821013, 1, 1.5, 0.5, 0.5,
-0.0212481, -4.43366, -7.821013, 0, 1.5, 0.5, 0.5
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
-3.913397, 0.3879859, -7.821013, 0, -0.5, 0.5, 0.5,
-3.913397, 0.3879859, -7.821013, 1, -0.5, 0.5, 0.5,
-3.913397, 0.3879859, -7.821013, 1, 1.5, 0.5, 0.5,
-3.913397, 0.3879859, -7.821013, 0, 1.5, 0.5, 0.5
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
-3.913397, -4.43366, -0.3382578, 0, -0.5, 0.5, 0.5,
-3.913397, -4.43366, -0.3382578, 1, -0.5, 0.5, 0.5,
-3.913397, -4.43366, -0.3382578, 1, 1.5, 0.5, 0.5,
-3.913397, -4.43366, -0.3382578, 0, 1.5, 0.5, 0.5
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
-2, -3.320973, -6.094223,
2, -3.320973, -6.094223,
-2, -3.320973, -6.094223,
-2, -3.506421, -6.382022,
-1, -3.320973, -6.094223,
-1, -3.506421, -6.382022,
0, -3.320973, -6.094223,
0, -3.506421, -6.382022,
1, -3.320973, -6.094223,
1, -3.506421, -6.382022,
2, -3.320973, -6.094223,
2, -3.506421, -6.382022
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
-2, -3.877316, -6.957619, 0, -0.5, 0.5, 0.5,
-2, -3.877316, -6.957619, 1, -0.5, 0.5, 0.5,
-2, -3.877316, -6.957619, 1, 1.5, 0.5, 0.5,
-2, -3.877316, -6.957619, 0, 1.5, 0.5, 0.5,
-1, -3.877316, -6.957619, 0, -0.5, 0.5, 0.5,
-1, -3.877316, -6.957619, 1, -0.5, 0.5, 0.5,
-1, -3.877316, -6.957619, 1, 1.5, 0.5, 0.5,
-1, -3.877316, -6.957619, 0, 1.5, 0.5, 0.5,
0, -3.877316, -6.957619, 0, -0.5, 0.5, 0.5,
0, -3.877316, -6.957619, 1, -0.5, 0.5, 0.5,
0, -3.877316, -6.957619, 1, 1.5, 0.5, 0.5,
0, -3.877316, -6.957619, 0, 1.5, 0.5, 0.5,
1, -3.877316, -6.957619, 0, -0.5, 0.5, 0.5,
1, -3.877316, -6.957619, 1, -0.5, 0.5, 0.5,
1, -3.877316, -6.957619, 1, 1.5, 0.5, 0.5,
1, -3.877316, -6.957619, 0, 1.5, 0.5, 0.5,
2, -3.877316, -6.957619, 0, -0.5, 0.5, 0.5,
2, -3.877316, -6.957619, 1, -0.5, 0.5, 0.5,
2, -3.877316, -6.957619, 1, 1.5, 0.5, 0.5,
2, -3.877316, -6.957619, 0, 1.5, 0.5, 0.5
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
-3.015208, -2, -6.094223,
-3.015208, 2, -6.094223,
-3.015208, -2, -6.094223,
-3.164907, -2, -6.382022,
-3.015208, 0, -6.094223,
-3.164907, 0, -6.382022,
-3.015208, 2, -6.094223,
-3.164907, 2, -6.382022
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
-3.464303, -2, -6.957619, 0, -0.5, 0.5, 0.5,
-3.464303, -2, -6.957619, 1, -0.5, 0.5, 0.5,
-3.464303, -2, -6.957619, 1, 1.5, 0.5, 0.5,
-3.464303, -2, -6.957619, 0, 1.5, 0.5, 0.5,
-3.464303, 0, -6.957619, 0, -0.5, 0.5, 0.5,
-3.464303, 0, -6.957619, 1, -0.5, 0.5, 0.5,
-3.464303, 0, -6.957619, 1, 1.5, 0.5, 0.5,
-3.464303, 0, -6.957619, 0, 1.5, 0.5, 0.5,
-3.464303, 2, -6.957619, 0, -0.5, 0.5, 0.5,
-3.464303, 2, -6.957619, 1, -0.5, 0.5, 0.5,
-3.464303, 2, -6.957619, 1, 1.5, 0.5, 0.5,
-3.464303, 2, -6.957619, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.015208, -3.320973, -4,
-3.015208, -3.320973, 4,
-3.015208, -3.320973, -4,
-3.164907, -3.506421, -4,
-3.015208, -3.320973, -2,
-3.164907, -3.506421, -2,
-3.015208, -3.320973, 0,
-3.164907, -3.506421, 0,
-3.015208, -3.320973, 2,
-3.164907, -3.506421, 2,
-3.015208, -3.320973, 4,
-3.164907, -3.506421, 4
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
-3.464303, -3.877316, -4, 0, -0.5, 0.5, 0.5,
-3.464303, -3.877316, -4, 1, -0.5, 0.5, 0.5,
-3.464303, -3.877316, -4, 1, 1.5, 0.5, 0.5,
-3.464303, -3.877316, -4, 0, 1.5, 0.5, 0.5,
-3.464303, -3.877316, -2, 0, -0.5, 0.5, 0.5,
-3.464303, -3.877316, -2, 1, -0.5, 0.5, 0.5,
-3.464303, -3.877316, -2, 1, 1.5, 0.5, 0.5,
-3.464303, -3.877316, -2, 0, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 0, 0, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 0, 1, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 0, 1, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 0, 0, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 2, 0, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 2, 1, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 2, 1, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 2, 0, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 4, 0, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 4, 1, -0.5, 0.5, 0.5,
-3.464303, -3.877316, 4, 1, 1.5, 0.5, 0.5,
-3.464303, -3.877316, 4, 0, 1.5, 0.5, 0.5
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
-3.015208, -3.320973, -6.094223,
-3.015208, 4.096944, -6.094223,
-3.015208, -3.320973, 5.417708,
-3.015208, 4.096944, 5.417708,
-3.015208, -3.320973, -6.094223,
-3.015208, -3.320973, 5.417708,
-3.015208, 4.096944, -6.094223,
-3.015208, 4.096944, 5.417708,
-3.015208, -3.320973, -6.094223,
2.972712, -3.320973, -6.094223,
-3.015208, -3.320973, 5.417708,
2.972712, -3.320973, 5.417708,
-3.015208, 4.096944, -6.094223,
2.972712, 4.096944, -6.094223,
-3.015208, 4.096944, 5.417708,
2.972712, 4.096944, 5.417708,
2.972712, -3.320973, -6.094223,
2.972712, 4.096944, -6.094223,
2.972712, -3.320973, 5.417708,
2.972712, 4.096944, 5.417708,
2.972712, -3.320973, -6.094223,
2.972712, -3.320973, 5.417708,
2.972712, 4.096944, -6.094223,
2.972712, 4.096944, 5.417708
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
var radius = 7.981273;
var distance = 35.50959;
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
mvMatrix.translate( 0.0212481, -0.3879859, 0.3382578 );
mvMatrix.scale( 1.441153, 1.163333, 0.7496143 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.50959);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Antor<-read.table("Antor.xyz")
```

```
## Error in read.table("Antor.xyz"): no lines available in input
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
-2.928006, 0.01220203, -1.14819, 0, 0, 1, 1, 1,
-2.664066, -0.01341365, -3.171083, 1, 0, 0, 1, 1,
-2.613368, -1.156002, 0.02436932, 1, 0, 0, 1, 1,
-2.441432, 0.8631986, -2.007407, 1, 0, 0, 1, 1,
-2.423303, -0.4329224, -1.92764, 1, 0, 0, 1, 1,
-2.305165, 0.1811977, -0.5171642, 1, 0, 0, 1, 1,
-2.271775, -1.477999, -2.303028, 0, 0, 0, 1, 1,
-2.220338, -0.5314627, 0.5636992, 0, 0, 0, 1, 1,
-2.177989, 0.8350574, -1.333745, 0, 0, 0, 1, 1,
-2.16844, 1.855688, 0.6639366, 0, 0, 0, 1, 1,
-2.152662, -0.7278726, -2.613216, 0, 0, 0, 1, 1,
-2.148051, 1.313071, -0.1096917, 0, 0, 0, 1, 1,
-2.115343, 0.2718973, -1.447068, 0, 0, 0, 1, 1,
-2.109275, 0.4708668, -4.986807, 1, 1, 1, 1, 1,
-2.093115, 0.8302337, 0.1193244, 1, 1, 1, 1, 1,
-2.073829, 0.6815134, -2.484397, 1, 1, 1, 1, 1,
-2.059266, -0.9470723, -1.496258, 1, 1, 1, 1, 1,
-1.991333, 0.8437856, -2.103238, 1, 1, 1, 1, 1,
-1.951434, 0.570094, -0.1113925, 1, 1, 1, 1, 1,
-1.912024, 0.8182144, -1.248864, 1, 1, 1, 1, 1,
-1.890117, -0.133564, -2.069975, 1, 1, 1, 1, 1,
-1.869749, 1.77887, -0.5240714, 1, 1, 1, 1, 1,
-1.863415, 0.219831, -2.867955, 1, 1, 1, 1, 1,
-1.853102, -1.010034, -3.278102, 1, 1, 1, 1, 1,
-1.851597, -0.1755306, -1.767839, 1, 1, 1, 1, 1,
-1.842182, 1.488399, 0.2250589, 1, 1, 1, 1, 1,
-1.837106, -1.202482, -0.7869824, 1, 1, 1, 1, 1,
-1.828747, 0.5772405, -4.372954, 1, 1, 1, 1, 1,
-1.827595, 0.3912857, -1.491477, 0, 0, 1, 1, 1,
-1.81731, 0.07054897, -2.795513, 1, 0, 0, 1, 1,
-1.808928, 0.3386191, -3.499486, 1, 0, 0, 1, 1,
-1.762875, -1.591716, -3.6117, 1, 0, 0, 1, 1,
-1.751252, -0.9564644, -1.54585, 1, 0, 0, 1, 1,
-1.742506, -0.5065611, -2.976851, 1, 0, 0, 1, 1,
-1.73661, -1.096521, -2.521194, 0, 0, 0, 1, 1,
-1.704799, -0.4172627, -3.288951, 0, 0, 0, 1, 1,
-1.667954, 0.6760169, -1.328428, 0, 0, 0, 1, 1,
-1.663718, 0.1802623, -2.849328, 0, 0, 0, 1, 1,
-1.660982, -0.8867705, -1.949552, 0, 0, 0, 1, 1,
-1.660482, -0.09777251, -3.307418, 0, 0, 0, 1, 1,
-1.658465, 0.9380254, -0.5412799, 0, 0, 0, 1, 1,
-1.636609, 0.8892384, -0.5785365, 1, 1, 1, 1, 1,
-1.621426, 0.422428, -0.8783488, 1, 1, 1, 1, 1,
-1.621094, -0.1306083, -2.670053, 1, 1, 1, 1, 1,
-1.610733, -1.48255, -2.018436, 1, 1, 1, 1, 1,
-1.603981, -0.0843923, -2.574872, 1, 1, 1, 1, 1,
-1.602242, 2.155502, -0.2857148, 1, 1, 1, 1, 1,
-1.597862, -0.43598, -2.512777, 1, 1, 1, 1, 1,
-1.590317, 0.5609233, -1.103367, 1, 1, 1, 1, 1,
-1.583176, -0.5983511, -3.812423, 1, 1, 1, 1, 1,
-1.570453, -1.426626, -2.664686, 1, 1, 1, 1, 1,
-1.568131, -0.9356967, -0.1310312, 1, 1, 1, 1, 1,
-1.563778, -0.7862082, -2.122106, 1, 1, 1, 1, 1,
-1.536571, -0.4552646, -1.787325, 1, 1, 1, 1, 1,
-1.531858, -0.5098982, -3.296531, 1, 1, 1, 1, 1,
-1.522902, 0.9385323, -0.6308277, 1, 1, 1, 1, 1,
-1.519618, 0.2733921, 0.1700726, 0, 0, 1, 1, 1,
-1.519344, -1.385627, -3.124818, 1, 0, 0, 1, 1,
-1.510262, 1.70488, -1.718886, 1, 0, 0, 1, 1,
-1.507423, 1.152631, -1.648324, 1, 0, 0, 1, 1,
-1.494599, -0.4443121, -1.96928, 1, 0, 0, 1, 1,
-1.476269, 0.3300409, -1.194728, 1, 0, 0, 1, 1,
-1.473717, -0.2186927, -1.920941, 0, 0, 0, 1, 1,
-1.447454, 0.4880012, -0.3699262, 0, 0, 0, 1, 1,
-1.439998, -0.9039304, -3.11201, 0, 0, 0, 1, 1,
-1.426231, -0.4386613, -2.082626, 0, 0, 0, 1, 1,
-1.425589, 0.7459418, -1.872479, 0, 0, 0, 1, 1,
-1.407234, 0.3120982, -0.2776546, 0, 0, 0, 1, 1,
-1.405669, 0.415695, -3.64943, 0, 0, 0, 1, 1,
-1.404341, 0.5530494, -1.157158, 1, 1, 1, 1, 1,
-1.392765, 0.5345269, -0.2794373, 1, 1, 1, 1, 1,
-1.388484, -0.4363655, 0.9734025, 1, 1, 1, 1, 1,
-1.383868, -0.6368649, -2.525633, 1, 1, 1, 1, 1,
-1.382977, 0.5957003, -3.310203, 1, 1, 1, 1, 1,
-1.382802, 0.4999641, 0.9626564, 1, 1, 1, 1, 1,
-1.380312, -0.1451849, -1.041315, 1, 1, 1, 1, 1,
-1.378999, -0.821703, -4.230009, 1, 1, 1, 1, 1,
-1.357306, 0.1599246, -0.8419234, 1, 1, 1, 1, 1,
-1.353102, 1.94569, -0.9479515, 1, 1, 1, 1, 1,
-1.342192, 0.6318977, -0.4679923, 1, 1, 1, 1, 1,
-1.340936, 0.3651637, -1.514591, 1, 1, 1, 1, 1,
-1.335352, -0.3914088, -1.326793, 1, 1, 1, 1, 1,
-1.33458, -0.1497681, -1.900071, 1, 1, 1, 1, 1,
-1.330019, -0.4548229, -3.858417, 1, 1, 1, 1, 1,
-1.31089, 0.6546099, -0.712057, 0, 0, 1, 1, 1,
-1.30383, -1.195531, -3.551731, 1, 0, 0, 1, 1,
-1.301743, -0.122856, -1.284063, 1, 0, 0, 1, 1,
-1.297496, 0.2463177, 0.01119943, 1, 0, 0, 1, 1,
-1.28819, -0.1905864, -0.6970837, 1, 0, 0, 1, 1,
-1.26912, -0.3038314, -3.740523, 1, 0, 0, 1, 1,
-1.267488, -0.9608781, -2.701953, 0, 0, 0, 1, 1,
-1.263027, -0.05363525, -0.247399, 0, 0, 0, 1, 1,
-1.259883, 0.7239711, -1.066703, 0, 0, 0, 1, 1,
-1.251579, -1.973462, -3.674222, 0, 0, 0, 1, 1,
-1.236774, -0.5769526, -0.6278244, 0, 0, 0, 1, 1,
-1.227628, 0.4627564, -1.625104, 0, 0, 0, 1, 1,
-1.224649, -0.7365993, 0.5259427, 0, 0, 0, 1, 1,
-1.224479, 0.5119054, 0.3397507, 1, 1, 1, 1, 1,
-1.21053, -0.3329706, -0.8805674, 1, 1, 1, 1, 1,
-1.204838, 0.8564078, -0.6559277, 1, 1, 1, 1, 1,
-1.198877, 1.806023, -1.100545, 1, 1, 1, 1, 1,
-1.192799, -1.637188, -1.560559, 1, 1, 1, 1, 1,
-1.183352, -0.4670718, 0.2988486, 1, 1, 1, 1, 1,
-1.182924, -0.05690285, -1.57853, 1, 1, 1, 1, 1,
-1.182532, 0.231535, -1.2472, 1, 1, 1, 1, 1,
-1.17845, -1.427907, -1.097452, 1, 1, 1, 1, 1,
-1.170465, 0.604647, 0.1660809, 1, 1, 1, 1, 1,
-1.169759, -0.4161709, -0.9144678, 1, 1, 1, 1, 1,
-1.167539, 1.884644, -1.165573, 1, 1, 1, 1, 1,
-1.166955, 1.859819, 0.3583651, 1, 1, 1, 1, 1,
-1.164942, -0.5860711, -1.978363, 1, 1, 1, 1, 1,
-1.164454, -0.3836207, -2.3246, 1, 1, 1, 1, 1,
-1.157794, 0.8853518, -0.7568519, 0, 0, 1, 1, 1,
-1.146844, 0.08816937, 0.7942113, 1, 0, 0, 1, 1,
-1.144544, -0.6353427, -0.9395238, 1, 0, 0, 1, 1,
-1.140508, 0.6457735, 0.4249538, 1, 0, 0, 1, 1,
-1.139657, -0.4062286, -1.539705, 1, 0, 0, 1, 1,
-1.136521, 0.266228, -3.348883, 1, 0, 0, 1, 1,
-1.136233, 0.3534452, -1.458071, 0, 0, 0, 1, 1,
-1.135789, -0.7797437, -1.762153, 0, 0, 0, 1, 1,
-1.132563, -1.363006, -4.055328, 0, 0, 0, 1, 1,
-1.128154, 0.4026589, -2.124499, 0, 0, 0, 1, 1,
-1.124315, 1.496851, 0.08118729, 0, 0, 0, 1, 1,
-1.122603, -0.451646, -0.6322994, 0, 0, 0, 1, 1,
-1.117323, 1.309701, -1.05692, 0, 0, 0, 1, 1,
-1.108714, -0.6359471, -1.94452, 1, 1, 1, 1, 1,
-1.105632, -0.142793, -1.298947, 1, 1, 1, 1, 1,
-1.098479, 1.162925, -1.232213, 1, 1, 1, 1, 1,
-1.093304, -1.123971, -1.999595, 1, 1, 1, 1, 1,
-1.088224, -1.475505, -3.742681, 1, 1, 1, 1, 1,
-1.07833, -0.7950571, -1.455673, 1, 1, 1, 1, 1,
-1.07354, -1.383532, -1.352175, 1, 1, 1, 1, 1,
-1.065339, -0.1740104, -0.6528035, 1, 1, 1, 1, 1,
-1.063662, 0.8472249, -0.196394, 1, 1, 1, 1, 1,
-1.060512, -0.07416093, -2.070299, 1, 1, 1, 1, 1,
-1.05996, 0.4040402, -1.133365, 1, 1, 1, 1, 1,
-1.059539, -0.1734507, -2.606661, 1, 1, 1, 1, 1,
-1.057148, 1.200314, -1.486843, 1, 1, 1, 1, 1,
-1.048721, -0.1939475, -2.769834, 1, 1, 1, 1, 1,
-1.044974, 0.8713155, -0.5508763, 1, 1, 1, 1, 1,
-1.036082, 0.8555688, -2.336174, 0, 0, 1, 1, 1,
-1.035322, -1.899813, -4.534386, 1, 0, 0, 1, 1,
-1.033022, -0.9926909, -1.690825, 1, 0, 0, 1, 1,
-1.021834, -0.9730597, -2.341388, 1, 0, 0, 1, 1,
-1.007185, 1.370784, -0.5918782, 1, 0, 0, 1, 1,
-1.003494, -1.29051, -2.800757, 1, 0, 0, 1, 1,
-0.9909226, -0.07345251, -0.8862831, 0, 0, 0, 1, 1,
-0.9879268, 2.019124, -0.4543851, 0, 0, 0, 1, 1,
-0.9878308, 3.988917, -1.256779, 0, 0, 0, 1, 1,
-0.9837849, 0.8949609, -1.398839, 0, 0, 0, 1, 1,
-0.9764913, 1.004731, -0.9322444, 0, 0, 0, 1, 1,
-0.9763945, 0.6586407, -3.190977, 0, 0, 0, 1, 1,
-0.9763124, -0.01718488, -2.244989, 0, 0, 0, 1, 1,
-0.9747933, -1.309512, -2.796645, 1, 1, 1, 1, 1,
-0.971318, -0.8973384, -3.054285, 1, 1, 1, 1, 1,
-0.9712887, 1.128354, -0.4580364, 1, 1, 1, 1, 1,
-0.9654793, -1.137679, -2.160582, 1, 1, 1, 1, 1,
-0.9583443, 0.7465906, -0.6167855, 1, 1, 1, 1, 1,
-0.9538158, 0.9754021, -0.5033334, 1, 1, 1, 1, 1,
-0.9491887, 0.7737007, -1.363022, 1, 1, 1, 1, 1,
-0.9478034, 0.008013245, -1.369632, 1, 1, 1, 1, 1,
-0.9466226, 1.460427, -0.1617527, 1, 1, 1, 1, 1,
-0.9464049, -0.6643572, -0.8758634, 1, 1, 1, 1, 1,
-0.9444283, 0.06400524, -1.122441, 1, 1, 1, 1, 1,
-0.9416794, -0.4038482, -3.537224, 1, 1, 1, 1, 1,
-0.9394953, -1.455582, -1.761985, 1, 1, 1, 1, 1,
-0.9388402, -1.242925, -4.030423, 1, 1, 1, 1, 1,
-0.9384119, 0.9194326, 0.7499023, 1, 1, 1, 1, 1,
-0.9219104, 0.4819509, -0.9992122, 0, 0, 1, 1, 1,
-0.9195477, 0.5133302, -0.659885, 1, 0, 0, 1, 1,
-0.9154274, -0.02782597, -2.753553, 1, 0, 0, 1, 1,
-0.9150862, -0.6405318, -2.752744, 1, 0, 0, 1, 1,
-0.9072859, 0.88932, -0.194454, 1, 0, 0, 1, 1,
-0.902053, 2.124321, 0.1861995, 1, 0, 0, 1, 1,
-0.8999036, 2.938692, -1.562193, 0, 0, 0, 1, 1,
-0.8993404, -1.061806, -1.880309, 0, 0, 0, 1, 1,
-0.8949915, -0.2970776, -0.9267567, 0, 0, 0, 1, 1,
-0.892118, -1.296714, -0.7959182, 0, 0, 0, 1, 1,
-0.8920965, 1.617011, -2.315269, 0, 0, 0, 1, 1,
-0.8808259, 0.02498512, -2.715881, 0, 0, 0, 1, 1,
-0.8770364, 0.4012906, -1.953802, 0, 0, 0, 1, 1,
-0.8761953, -1.540866, -4.071727, 1, 1, 1, 1, 1,
-0.8639185, 0.8687709, -2.6827, 1, 1, 1, 1, 1,
-0.863175, 0.8281288, -2.46707, 1, 1, 1, 1, 1,
-0.8629882, -0.261467, -1.708245, 1, 1, 1, 1, 1,
-0.8595953, 1.130909, -0.4660845, 1, 1, 1, 1, 1,
-0.8418658, 0.163272, -3.117762, 1, 1, 1, 1, 1,
-0.8343309, -1.755359, -0.8964651, 1, 1, 1, 1, 1,
-0.8322179, -0.8492414, -2.450047, 1, 1, 1, 1, 1,
-0.8284233, -1.89907, -3.573377, 1, 1, 1, 1, 1,
-0.8252312, -0.5813254, -3.03536, 1, 1, 1, 1, 1,
-0.8211837, 0.5491229, 0.8900499, 1, 1, 1, 1, 1,
-0.8170431, 1.421207, 0.1742698, 1, 1, 1, 1, 1,
-0.813912, -0.1019383, -3.442031, 1, 1, 1, 1, 1,
-0.8101225, -1.115804, -2.521549, 1, 1, 1, 1, 1,
-0.8056093, -1.629834, -2.319566, 1, 1, 1, 1, 1,
-0.8026565, -0.8411154, -2.073385, 0, 0, 1, 1, 1,
-0.800109, -0.4333041, -3.12394, 1, 0, 0, 1, 1,
-0.7989323, -0.5599639, -3.113855, 1, 0, 0, 1, 1,
-0.7955054, -0.7785423, -3.784003, 1, 0, 0, 1, 1,
-0.7946715, 1.519081, -0.3869131, 1, 0, 0, 1, 1,
-0.7866242, -1.901393, -2.26516, 1, 0, 0, 1, 1,
-0.7807214, 1.136029, -0.5339433, 0, 0, 0, 1, 1,
-0.7747538, -0.5237003, -1.091766, 0, 0, 0, 1, 1,
-0.7696992, -2.05765, -2.383502, 0, 0, 0, 1, 1,
-0.7675724, 1.032246, -0.4085634, 0, 0, 0, 1, 1,
-0.763077, 1.696299, -0.1903472, 0, 0, 0, 1, 1,
-0.7618046, -0.7405958, -2.804063, 0, 0, 0, 1, 1,
-0.7603213, -0.4759616, -2.597814, 0, 0, 0, 1, 1,
-0.7533302, 0.1094372, -3.432648, 1, 1, 1, 1, 1,
-0.7472588, -1.132876, -3.32963, 1, 1, 1, 1, 1,
-0.7426376, -0.9784386, -3.728353, 1, 1, 1, 1, 1,
-0.7403752, -1.391628, -4.686853, 1, 1, 1, 1, 1,
-0.7369946, -0.001344751, -1.678071, 1, 1, 1, 1, 1,
-0.7337258, 0.8162215, -1.255761, 1, 1, 1, 1, 1,
-0.7324237, 0.4236321, -0.5406858, 1, 1, 1, 1, 1,
-0.7285738, -0.9774475, -3.312143, 1, 1, 1, 1, 1,
-0.724936, 0.4774079, -2.571873, 1, 1, 1, 1, 1,
-0.7166536, 0.7604936, -1.513641, 1, 1, 1, 1, 1,
-0.7127156, -0.8749636, -3.062762, 1, 1, 1, 1, 1,
-0.7119573, 1.391236, 0.8707053, 1, 1, 1, 1, 1,
-0.7104433, 1.669054, -1.9483, 1, 1, 1, 1, 1,
-0.7072399, 1.11023, -0.3318328, 1, 1, 1, 1, 1,
-0.7068844, 1.60253, 1.779083, 1, 1, 1, 1, 1,
-0.7027722, -1.624688, -3.392422, 0, 0, 1, 1, 1,
-0.6992479, -0.04243886, -1.450189, 1, 0, 0, 1, 1,
-0.696345, -0.5473071, -1.633528, 1, 0, 0, 1, 1,
-0.6914458, -0.2516942, -0.6457973, 1, 0, 0, 1, 1,
-0.6905565, 0.7100914, -0.5566534, 1, 0, 0, 1, 1,
-0.6871091, 0.6379375, -2.505724, 1, 0, 0, 1, 1,
-0.6787868, -0.05587464, -1.082631, 0, 0, 0, 1, 1,
-0.6784148, -0.5506049, -3.450606, 0, 0, 0, 1, 1,
-0.677805, 0.4752562, -2.195465, 0, 0, 0, 1, 1,
-0.6723039, 1.156127, 0.7387133, 0, 0, 0, 1, 1,
-0.6671486, 1.149738, 0.05190277, 0, 0, 0, 1, 1,
-0.6611522, -0.5825141, -2.11711, 0, 0, 0, 1, 1,
-0.6587875, 0.9617444, -2.447968, 0, 0, 0, 1, 1,
-0.657158, -0.1712868, -3.385522, 1, 1, 1, 1, 1,
-0.6541863, -0.8872391, -2.413501, 1, 1, 1, 1, 1,
-0.6490168, 0.4728204, -1.297157, 1, 1, 1, 1, 1,
-0.645438, -0.3284054, -2.507344, 1, 1, 1, 1, 1,
-0.6433393, -0.3424795, -1.861298, 1, 1, 1, 1, 1,
-0.6422292, 0.4362134, -0.2941036, 1, 1, 1, 1, 1,
-0.641858, 0.4711909, 0.8787857, 1, 1, 1, 1, 1,
-0.6410477, -0.2586326, -2.463547, 1, 1, 1, 1, 1,
-0.6374953, 0.03725471, -2.171301, 1, 1, 1, 1, 1,
-0.635563, 0.2235669, -0.9644527, 1, 1, 1, 1, 1,
-0.6330571, -0.9581949, -0.3715182, 1, 1, 1, 1, 1,
-0.6272336, -1.190495, -4.391381, 1, 1, 1, 1, 1,
-0.6232055, 0.4222316, -0.8632025, 1, 1, 1, 1, 1,
-0.622627, -1.466125, -3.27741, 1, 1, 1, 1, 1,
-0.6208363, -0.5666025, -3.284631, 1, 1, 1, 1, 1,
-0.6180847, 0.6421515, -0.1798466, 0, 0, 1, 1, 1,
-0.6119202, -1.819354, -4.100678, 1, 0, 0, 1, 1,
-0.6095888, 1.426814, -0.3517954, 1, 0, 0, 1, 1,
-0.6085215, 0.2473457, 0.2975498, 1, 0, 0, 1, 1,
-0.604561, -0.1959413, -1.367694, 1, 0, 0, 1, 1,
-0.6025172, 0.3428596, -1.409026, 1, 0, 0, 1, 1,
-0.6021494, 0.4269489, -0.9258619, 0, 0, 0, 1, 1,
-0.6017362, -1.100631, -3.587128, 0, 0, 0, 1, 1,
-0.5919344, 0.8012663, -0.8834452, 0, 0, 0, 1, 1,
-0.5891474, 0.2801387, -1.891442, 0, 0, 0, 1, 1,
-0.5849234, -0.7918668, -2.987404, 0, 0, 0, 1, 1,
-0.5834337, 1.738814, -0.6529127, 0, 0, 0, 1, 1,
-0.5781726, -0.9493575, -3.714777, 0, 0, 0, 1, 1,
-0.5774366, 0.9570418, -0.9056624, 1, 1, 1, 1, 1,
-0.5686772, -0.6373842, -2.724612, 1, 1, 1, 1, 1,
-0.5664164, 0.3248602, -2.164741, 1, 1, 1, 1, 1,
-0.5636901, 1.23404, 0.04178791, 1, 1, 1, 1, 1,
-0.5580514, -0.5105237, -2.075442, 1, 1, 1, 1, 1,
-0.5580385, 2.18505, -0.4177741, 1, 1, 1, 1, 1,
-0.557091, 0.912506, 0.1935147, 1, 1, 1, 1, 1,
-0.551725, 1.665487, -1.028919, 1, 1, 1, 1, 1,
-0.5496337, -0.9612169, -1.648599, 1, 1, 1, 1, 1,
-0.5491079, 2.35598, 0.06022563, 1, 1, 1, 1, 1,
-0.5423508, -1.504082, -2.102601, 1, 1, 1, 1, 1,
-0.5394561, 0.2078709, -2.092048, 1, 1, 1, 1, 1,
-0.5392827, 0.9981069, 0.1829765, 1, 1, 1, 1, 1,
-0.5390252, 0.3151323, 0.3457806, 1, 1, 1, 1, 1,
-0.5361127, 0.253155, -1.102205, 1, 1, 1, 1, 1,
-0.5355217, -0.739969, -2.544021, 0, 0, 1, 1, 1,
-0.5333388, -0.1352534, -4.122731, 1, 0, 0, 1, 1,
-0.5332503, 0.528144, 0.2877638, 1, 0, 0, 1, 1,
-0.5298024, -0.3669469, -2.185356, 1, 0, 0, 1, 1,
-0.5282841, 0.1554302, -0.9646655, 1, 0, 0, 1, 1,
-0.5253116, 0.5140499, -1.385769, 1, 0, 0, 1, 1,
-0.5244299, 0.372532, -0.5861332, 0, 0, 0, 1, 1,
-0.5235844, -1.644935, -3.015201, 0, 0, 0, 1, 1,
-0.5227411, 1.786307, -2.070298, 0, 0, 0, 1, 1,
-0.5215355, 0.3804972, -1.195266, 0, 0, 0, 1, 1,
-0.5169058, -0.1896722, -2.081714, 0, 0, 0, 1, 1,
-0.5143413, -0.4023855, -3.266495, 0, 0, 0, 1, 1,
-0.5119495, 0.7016435, -1.973062, 0, 0, 0, 1, 1,
-0.5106031, -1.826144, -2.340626, 1, 1, 1, 1, 1,
-0.509198, -0.2192782, -0.04439786, 1, 1, 1, 1, 1,
-0.5088735, 1.036528, -0.3092827, 1, 1, 1, 1, 1,
-0.5012202, 0.1888912, -3.414682, 1, 1, 1, 1, 1,
-0.4923466, 1.160051, -1.628903, 1, 1, 1, 1, 1,
-0.4919754, 0.2725375, -1.917156, 1, 1, 1, 1, 1,
-0.4916569, 0.3486981, -2.319556, 1, 1, 1, 1, 1,
-0.4915015, -0.2695903, -0.2279155, 1, 1, 1, 1, 1,
-0.4864066, -0.5540707, -2.961786, 1, 1, 1, 1, 1,
-0.4846644, -0.2994308, -2.931604, 1, 1, 1, 1, 1,
-0.4837877, -1.24391, -4.48129, 1, 1, 1, 1, 1,
-0.4831866, -0.6918983, -1.707278, 1, 1, 1, 1, 1,
-0.4809941, -0.2789871, -1.785418, 1, 1, 1, 1, 1,
-0.4803138, 0.6460803, 1.154916, 1, 1, 1, 1, 1,
-0.4784524, -0.6398304, -2.540478, 1, 1, 1, 1, 1,
-0.4753717, -1.681711, -3.108855, 0, 0, 1, 1, 1,
-0.4709141, -0.5195798, -3.401617, 1, 0, 0, 1, 1,
-0.4701046, -0.3180699, -2.295576, 1, 0, 0, 1, 1,
-0.4687733, -1.943546, -2.649873, 1, 0, 0, 1, 1,
-0.4664467, 0.2971064, 0.6606896, 1, 0, 0, 1, 1,
-0.4645897, -0.2304931, -0.9333969, 1, 0, 0, 1, 1,
-0.4640603, -0.9623796, -1.979867, 0, 0, 0, 1, 1,
-0.4615995, 0.009220858, -1.539645, 0, 0, 0, 1, 1,
-0.4509792, -0.03637442, -2.439798, 0, 0, 0, 1, 1,
-0.4486743, -0.1195668, -1.22199, 0, 0, 0, 1, 1,
-0.4396473, 0.3622854, -1.691685, 0, 0, 0, 1, 1,
-0.4383925, 0.8183023, 0.7186298, 0, 0, 0, 1, 1,
-0.432019, -0.5227978, -1.918234, 0, 0, 0, 1, 1,
-0.4302495, 0.1079721, -1.139394, 1, 1, 1, 1, 1,
-0.429684, 0.9066194, -0.3953297, 1, 1, 1, 1, 1,
-0.4209782, 0.7601962, -0.3479069, 1, 1, 1, 1, 1,
-0.4156228, -2.566517, -2.839582, 1, 1, 1, 1, 1,
-0.4142657, 0.5988495, -0.02985932, 1, 1, 1, 1, 1,
-0.4074368, -0.4294364, -2.123207, 1, 1, 1, 1, 1,
-0.4030609, -0.6392195, -3.389754, 1, 1, 1, 1, 1,
-0.3898096, 0.6717548, -0.3551468, 1, 1, 1, 1, 1,
-0.3848698, 1.069834, -0.04116072, 1, 1, 1, 1, 1,
-0.3801039, -2.326495, -4.067687, 1, 1, 1, 1, 1,
-0.3772065, 0.6895029, -0.730435, 1, 1, 1, 1, 1,
-0.3755941, 0.8037632, -2.038145, 1, 1, 1, 1, 1,
-0.3618506, -0.2415488, -3.212831, 1, 1, 1, 1, 1,
-0.3608334, 0.4662386, -0.180442, 1, 1, 1, 1, 1,
-0.3557853, 0.3930061, 0.04048542, 1, 1, 1, 1, 1,
-0.3530489, -0.004737543, -1.505253, 0, 0, 1, 1, 1,
-0.3529113, -0.2085217, -1.702843, 1, 0, 0, 1, 1,
-0.3525216, -0.5227761, -2.0999, 1, 0, 0, 1, 1,
-0.351216, -0.3373971, -2.044193, 1, 0, 0, 1, 1,
-0.3462623, 0.3777799, -0.9146146, 1, 0, 0, 1, 1,
-0.3437778, 1.687979, -0.6534421, 1, 0, 0, 1, 1,
-0.34342, -1.36045, -2.343198, 0, 0, 0, 1, 1,
-0.3423034, -0.358047, -1.727778, 0, 0, 0, 1, 1,
-0.3421267, -0.6260799, -2.835759, 0, 0, 0, 1, 1,
-0.3409018, 1.132146, -0.852742, 0, 0, 0, 1, 1,
-0.3400101, -1.478777, -3.916518, 0, 0, 0, 1, 1,
-0.339501, 0.8669001, -0.6874654, 0, 0, 0, 1, 1,
-0.3377815, -0.8735107, -2.67768, 0, 0, 0, 1, 1,
-0.3331442, 0.9560285, -1.388052, 1, 1, 1, 1, 1,
-0.3316927, -0.2806445, -2.900537, 1, 1, 1, 1, 1,
-0.3269157, 0.08993147, -0.007672195, 1, 1, 1, 1, 1,
-0.3267272, 0.6881607, -0.2860053, 1, 1, 1, 1, 1,
-0.3258208, 0.1050539, 0.1713619, 1, 1, 1, 1, 1,
-0.3202482, -0.3664049, -2.355719, 1, 1, 1, 1, 1,
-0.3199674, 0.3795677, 0.5568988, 1, 1, 1, 1, 1,
-0.3176269, -0.3556199, -1.556388, 1, 1, 1, 1, 1,
-0.3173335, 0.9947928, -0.8041599, 1, 1, 1, 1, 1,
-0.3127246, -0.1728114, -1.665321, 1, 1, 1, 1, 1,
-0.3126053, -0.2286244, -1.993051, 1, 1, 1, 1, 1,
-0.3109038, -0.1122493, -2.108473, 1, 1, 1, 1, 1,
-0.3107331, 1.944441, -1.968024, 1, 1, 1, 1, 1,
-0.3089568, -1.178804, -1.57902, 1, 1, 1, 1, 1,
-0.3071871, -1.868852, -2.418307, 1, 1, 1, 1, 1,
-0.3026947, -0.4444916, -2.356191, 0, 0, 1, 1, 1,
-0.2980134, -2.401403, -3.259515, 1, 0, 0, 1, 1,
-0.2904404, 0.2170792, -0.1658064, 1, 0, 0, 1, 1,
-0.2855309, 0.4871987, 0.4412863, 1, 0, 0, 1, 1,
-0.2839872, 0.9939639, 0.2833137, 1, 0, 0, 1, 1,
-0.2778273, -1.438412, -3.721716, 1, 0, 0, 1, 1,
-0.2769156, -0.7151062, -3.721352, 0, 0, 0, 1, 1,
-0.2757854, 1.5701, -0.4530233, 0, 0, 0, 1, 1,
-0.2755282, -0.2294966, -3.471517, 0, 0, 0, 1, 1,
-0.2711519, 0.01259297, -1.735936, 0, 0, 0, 1, 1,
-0.2703276, -0.4321687, -1.352544, 0, 0, 0, 1, 1,
-0.2615134, -1.335872, -1.747596, 0, 0, 0, 1, 1,
-0.2612668, -0.438322, -1.80739, 0, 0, 0, 1, 1,
-0.2583214, 1.57829, 0.129949, 1, 1, 1, 1, 1,
-0.2569466, -0.5011653, -2.126156, 1, 1, 1, 1, 1,
-0.2547588, 0.6439664, -2.122394, 1, 1, 1, 1, 1,
-0.2518044, 0.8137499, -0.312246, 1, 1, 1, 1, 1,
-0.2485645, -1.794137, -1.99774, 1, 1, 1, 1, 1,
-0.2483138, -1.332833, -2.553905, 1, 1, 1, 1, 1,
-0.2459145, -0.9898034, -3.784057, 1, 1, 1, 1, 1,
-0.2439271, 1.462912, -1.062048, 1, 1, 1, 1, 1,
-0.24187, 0.276594, 0.7501466, 1, 1, 1, 1, 1,
-0.2391565, -0.8471043, -3.757645, 1, 1, 1, 1, 1,
-0.2374201, -0.04147439, -1.109921, 1, 1, 1, 1, 1,
-0.2327001, -1.318201, -5.331005, 1, 1, 1, 1, 1,
-0.232065, 1.023009, -0.1977582, 1, 1, 1, 1, 1,
-0.2305127, -0.7927758, -3.446175, 1, 1, 1, 1, 1,
-0.2290188, 1.16286, 0.6240047, 1, 1, 1, 1, 1,
-0.2220922, -1.337531, -3.445654, 0, 0, 1, 1, 1,
-0.2140822, 2.158134, -0.7237623, 1, 0, 0, 1, 1,
-0.2138377, -0.2856381, -2.83725, 1, 0, 0, 1, 1,
-0.2113519, 1.192225, 1.618985, 1, 0, 0, 1, 1,
-0.2098975, 0.1888452, -2.223727, 1, 0, 0, 1, 1,
-0.2086435, -1.584561, -3.876827, 1, 0, 0, 1, 1,
-0.2052361, 1.111375, 0.1343112, 0, 0, 0, 1, 1,
-0.2050251, 1.14584, -1.55767, 0, 0, 0, 1, 1,
-0.2047448, -1.946616, -2.163035, 0, 0, 0, 1, 1,
-0.2039222, 0.8733349, -1.480872, 0, 0, 0, 1, 1,
-0.1998557, -1.591991, -2.08391, 0, 0, 0, 1, 1,
-0.1942625, -0.8324166, -2.467707, 0, 0, 0, 1, 1,
-0.1910155, -0.1798873, -1.663313, 0, 0, 0, 1, 1,
-0.1845152, 0.8112361, -0.4382931, 1, 1, 1, 1, 1,
-0.180253, -0.4002203, -0.8119996, 1, 1, 1, 1, 1,
-0.1765196, 0.01513043, -3.027553, 1, 1, 1, 1, 1,
-0.1752775, 0.6631185, -1.057658, 1, 1, 1, 1, 1,
-0.1704227, -1.012866, -2.076719, 1, 1, 1, 1, 1,
-0.169123, -0.2767688, -2.671675, 1, 1, 1, 1, 1,
-0.1658459, -0.1061887, -1.133944, 1, 1, 1, 1, 1,
-0.1647794, 0.3910713, -0.809233, 1, 1, 1, 1, 1,
-0.1640716, 0.6867619, -0.08066938, 1, 1, 1, 1, 1,
-0.1631226, -0.02758115, -2.12279, 1, 1, 1, 1, 1,
-0.1574799, -0.1516332, -0.9125296, 1, 1, 1, 1, 1,
-0.1570287, 0.01978752, -1.448339, 1, 1, 1, 1, 1,
-0.1559777, -0.9423337, -1.673497, 1, 1, 1, 1, 1,
-0.1551989, -0.4793641, -1.991617, 1, 1, 1, 1, 1,
-0.152437, 1.735095, 0.5325158, 1, 1, 1, 1, 1,
-0.1502347, -1.043921, -3.329484, 0, 0, 1, 1, 1,
-0.1499352, -1.655882, -2.177919, 1, 0, 0, 1, 1,
-0.1498692, 1.045849, -0.5039263, 1, 0, 0, 1, 1,
-0.1487296, 1.069206, -0.7674374, 1, 0, 0, 1, 1,
-0.1478903, 1.046111, 2.019934, 1, 0, 0, 1, 1,
-0.1469494, -1.36107, -5.926574, 1, 0, 0, 1, 1,
-0.1412239, -0.004518302, -0.5725662, 0, 0, 0, 1, 1,
-0.1388304, 0.6350047, 1.849828, 0, 0, 0, 1, 1,
-0.1354585, 0.1689584, -0.4129107, 0, 0, 0, 1, 1,
-0.1341895, -0.4629469, -2.15791, 0, 0, 0, 1, 1,
-0.1329419, -0.5162784, -3.001126, 0, 0, 0, 1, 1,
-0.1328226, 0.7809778, -0.5525473, 0, 0, 0, 1, 1,
-0.1309994, -0.727142, -2.177031, 0, 0, 0, 1, 1,
-0.129818, -2.068676, -3.093446, 1, 1, 1, 1, 1,
-0.1272268, -0.1698442, -2.993012, 1, 1, 1, 1, 1,
-0.1245333, 0.3017926, -1.034888, 1, 1, 1, 1, 1,
-0.1237885, -1.488438, -3.13104, 1, 1, 1, 1, 1,
-0.1231832, 0.9687627, -1.788007, 1, 1, 1, 1, 1,
-0.119374, 0.1332335, -1.138591, 1, 1, 1, 1, 1,
-0.1182643, 1.41014, -1.304003, 1, 1, 1, 1, 1,
-0.1161847, 1.739912, 1.022609, 1, 1, 1, 1, 1,
-0.1144239, 0.09975363, 0.8891413, 1, 1, 1, 1, 1,
-0.1122253, -0.5142047, -2.982528, 1, 1, 1, 1, 1,
-0.1112089, 1.313478, 1.906173, 1, 1, 1, 1, 1,
-0.1110149, -0.6509347, -2.837293, 1, 1, 1, 1, 1,
-0.1105049, 0.1260473, -0.8983536, 1, 1, 1, 1, 1,
-0.1100161, -1.283622, -3.220303, 1, 1, 1, 1, 1,
-0.1087221, 0.3517724, 0.6188042, 1, 1, 1, 1, 1,
-0.108475, -0.2111529, -3.88933, 0, 0, 1, 1, 1,
-0.106611, -1.151492, -5.430211, 1, 0, 0, 1, 1,
-0.1046046, -1.332224, -1.811241, 1, 0, 0, 1, 1,
-0.104248, -0.5271177, -1.434321, 1, 0, 0, 1, 1,
-0.1026485, -0.9091328, -4.427918, 1, 0, 0, 1, 1,
-0.1007001, 0.792372, 0.8628381, 1, 0, 0, 1, 1,
-0.1003292, -1.39941, -3.082678, 0, 0, 0, 1, 1,
-0.09764179, -2.189279, -3.131471, 0, 0, 0, 1, 1,
-0.09309185, -1.094857, -4.303757, 0, 0, 0, 1, 1,
-0.08133405, 0.0973675, 0.6071262, 0, 0, 0, 1, 1,
-0.08016186, 0.2393525, 0.7571018, 0, 0, 0, 1, 1,
-0.0766995, -2.31186, -3.173915, 0, 0, 0, 1, 1,
-0.07644799, -0.5789124, -1.08856, 0, 0, 0, 1, 1,
-0.07554311, -1.446369, -2.493912, 1, 1, 1, 1, 1,
-0.0750227, 0.9416387, -1.758007, 1, 1, 1, 1, 1,
-0.07388624, -0.5025896, -3.474945, 1, 1, 1, 1, 1,
-0.07381912, 1.038761, -0.5985662, 1, 1, 1, 1, 1,
-0.07358115, -0.04021305, -2.594294, 1, 1, 1, 1, 1,
-0.07069714, 1.278609, 0.06547476, 1, 1, 1, 1, 1,
-0.06665955, -0.7706199, -4.049016, 1, 1, 1, 1, 1,
-0.06579528, 0.4468265, -1.356115, 1, 1, 1, 1, 1,
-0.06294692, -1.114581, -1.471334, 1, 1, 1, 1, 1,
-0.06082578, 0.7438617, -1.302078, 1, 1, 1, 1, 1,
-0.06079914, -0.897996, -3.125068, 1, 1, 1, 1, 1,
-0.05934381, 1.173668, -1.106097, 1, 1, 1, 1, 1,
-0.05510323, -1.178892, -4.044215, 1, 1, 1, 1, 1,
-0.05208457, 0.5854343, -0.4506956, 1, 1, 1, 1, 1,
-0.04971898, 1.125429, -1.121696, 1, 1, 1, 1, 1,
-0.04485071, -0.2140902, -2.242975, 0, 0, 1, 1, 1,
-0.04448342, 0.08867416, -1.038217, 1, 0, 0, 1, 1,
-0.03659828, -1.352206, -3.512961, 1, 0, 0, 1, 1,
-0.02627007, 1.626338, 1.607141, 1, 0, 0, 1, 1,
-0.02481959, 0.8374443, 0.122507, 1, 0, 0, 1, 1,
-0.02117595, -0.5917573, -3.243718, 1, 0, 0, 1, 1,
-0.01933729, 1.885283, -0.4151758, 0, 0, 0, 1, 1,
-0.01256186, 0.3052081, 0.6391049, 0, 0, 0, 1, 1,
-0.008648525, -0.1564357, -0.4895285, 0, 0, 0, 1, 1,
-0.008334861, 0.3443176, -1.301148, 0, 0, 0, 1, 1,
-0.008252523, -1.15436, -2.000888, 0, 0, 0, 1, 1,
-0.005413362, -0.6184979, -4.178756, 0, 0, 0, 1, 1,
-0.004884433, -0.6015568, -3.273791, 0, 0, 0, 1, 1,
-0.00338254, 1.191091, -1.211629, 1, 1, 1, 1, 1,
-0.0009568405, -0.2969045, -1.877073, 1, 1, 1, 1, 1,
-0.0005340396, -1.491685, -2.334839, 1, 1, 1, 1, 1,
0.0003333292, 0.3555028, 0.1402571, 1, 1, 1, 1, 1,
0.0009610078, -0.1027226, 4.005747, 1, 1, 1, 1, 1,
0.001220917, 0.3847232, 0.5540457, 1, 1, 1, 1, 1,
0.003964824, 0.3838829, 0.7038463, 1, 1, 1, 1, 1,
0.006161856, 0.9876406, -0.8823116, 1, 1, 1, 1, 1,
0.006342078, 0.9823714, 0.170542, 1, 1, 1, 1, 1,
0.006978421, 0.007374885, 1.88831, 1, 1, 1, 1, 1,
0.01470512, 0.2837104, 0.2244107, 1, 1, 1, 1, 1,
0.01736935, 1.205161, -0.80883, 1, 1, 1, 1, 1,
0.01899429, 0.3123386, 0.7278044, 1, 1, 1, 1, 1,
0.02063576, 1.168923, -0.8686935, 1, 1, 1, 1, 1,
0.02690089, -0.2138111, 1.726944, 1, 1, 1, 1, 1,
0.03195997, -0.6630879, 2.94432, 0, 0, 1, 1, 1,
0.03405964, -0.2681666, 5.250059, 1, 0, 0, 1, 1,
0.03629366, -0.4316511, 2.993075, 1, 0, 0, 1, 1,
0.03774138, 0.6225666, 0.9327403, 1, 0, 0, 1, 1,
0.03997761, -1.821916, 3.952932, 1, 0, 0, 1, 1,
0.04002978, -0.2513259, 2.717903, 1, 0, 0, 1, 1,
0.04016132, 1.539065, 1.887074, 0, 0, 0, 1, 1,
0.04405829, 0.9490166, -0.7038947, 0, 0, 0, 1, 1,
0.04841612, 0.9182763, 0.61791, 0, 0, 0, 1, 1,
0.05113265, 0.6204185, 1.488283, 0, 0, 0, 1, 1,
0.05122392, 1.757334, -1.698308, 0, 0, 0, 1, 1,
0.05485398, 0.8435119, -0.1076443, 0, 0, 0, 1, 1,
0.05847914, 1.87441, 2.33904, 0, 0, 0, 1, 1,
0.05945561, -1.145926, 3.393253, 1, 1, 1, 1, 1,
0.06256389, -0.02768715, 2.228595, 1, 1, 1, 1, 1,
0.06710614, 0.5163017, -0.8517137, 1, 1, 1, 1, 1,
0.0706007, 1.355531, 0.4251213, 1, 1, 1, 1, 1,
0.07199431, -1.243297, 2.774549, 1, 1, 1, 1, 1,
0.07799412, 0.5876536, -1.454638, 1, 1, 1, 1, 1,
0.08088771, -1.620689, 4.683486, 1, 1, 1, 1, 1,
0.08240084, -0.1017351, 1.237389, 1, 1, 1, 1, 1,
0.08425067, 0.1453168, 1.024051, 1, 1, 1, 1, 1,
0.08852732, 0.06606662, 1.427853, 1, 1, 1, 1, 1,
0.09217457, 0.2725076, 1.566139, 1, 1, 1, 1, 1,
0.09320784, 1.941338, 0.1683338, 1, 1, 1, 1, 1,
0.09399074, 0.8849582, -0.5128831, 1, 1, 1, 1, 1,
0.09660831, -1.329845, 2.350029, 1, 1, 1, 1, 1,
0.1005685, 0.06954349, 0.9990481, 1, 1, 1, 1, 1,
0.1027599, 0.772344, -2.463053, 0, 0, 1, 1, 1,
0.1031644, 1.23308, 0.6126952, 1, 0, 0, 1, 1,
0.1054745, 0.4477385, -0.4305435, 1, 0, 0, 1, 1,
0.1076626, -0.0886135, 2.231311, 1, 0, 0, 1, 1,
0.1081995, -0.3238193, 1.930012, 1, 0, 0, 1, 1,
0.1101183, 0.2221773, 1.560528, 1, 0, 0, 1, 1,
0.1105314, -0.1197868, 2.296637, 0, 0, 0, 1, 1,
0.1133736, -0.5493113, 3.077421, 0, 0, 0, 1, 1,
0.1203267, -0.3218478, 3.035092, 0, 0, 0, 1, 1,
0.1270299, -1.284078, 3.132782, 0, 0, 0, 1, 1,
0.1280748, -0.4210829, 3.808037, 0, 0, 0, 1, 1,
0.129676, 1.191689, 0.3859002, 0, 0, 0, 1, 1,
0.131306, -0.4108659, 4.35445, 0, 0, 0, 1, 1,
0.1352878, 0.6463249, -1.236735, 1, 1, 1, 1, 1,
0.1355687, -1.524698, 3.345135, 1, 1, 1, 1, 1,
0.1359893, -0.3307858, 1.601366, 1, 1, 1, 1, 1,
0.1360541, -1.475424, 2.807639, 1, 1, 1, 1, 1,
0.1414048, 0.6001605, 1.033765, 1, 1, 1, 1, 1,
0.1434797, 0.3339523, 0.4397262, 1, 1, 1, 1, 1,
0.1459231, 0.4414813, 0.1913017, 1, 1, 1, 1, 1,
0.1470479, -0.6898745, 2.726997, 1, 1, 1, 1, 1,
0.148074, 0.03383449, 2.690182, 1, 1, 1, 1, 1,
0.1482073, -1.132562, 2.635282, 1, 1, 1, 1, 1,
0.1482872, 2.43064, 2.073638, 1, 1, 1, 1, 1,
0.1522139, 1.169674, -1.371443, 1, 1, 1, 1, 1,
0.1566944, -1.204782, 5.137386, 1, 1, 1, 1, 1,
0.1579947, 0.8042245, -1.432741, 1, 1, 1, 1, 1,
0.1581818, 0.1907492, -0.1646125, 1, 1, 1, 1, 1,
0.1701999, 0.7497909, -0.565502, 0, 0, 1, 1, 1,
0.1742489, -1.032555, 3.373108, 1, 0, 0, 1, 1,
0.1745653, -0.3939868, 2.353543, 1, 0, 0, 1, 1,
0.1746403, -0.1927169, 3.249132, 1, 0, 0, 1, 1,
0.1768182, -0.8453464, 2.872276, 1, 0, 0, 1, 1,
0.1787318, -0.8008052, 2.841633, 1, 0, 0, 1, 1,
0.1790589, 0.6817816, -0.03016275, 0, 0, 0, 1, 1,
0.1799096, -0.415172, 2.492948, 0, 0, 0, 1, 1,
0.1806334, -0.4506031, 1.212903, 0, 0, 0, 1, 1,
0.1824135, -1.558711, 3.272426, 0, 0, 0, 1, 1,
0.1839627, -0.130328, 1.309708, 0, 0, 0, 1, 1,
0.1915815, 2.073589, -0.7187082, 0, 0, 0, 1, 1,
0.192033, -0.2342416, 1.466424, 0, 0, 0, 1, 1,
0.1954839, -0.2594481, 0.6289338, 1, 1, 1, 1, 1,
0.1995378, -0.1298182, 2.056322, 1, 1, 1, 1, 1,
0.1995952, -0.3071376, 4.17147, 1, 1, 1, 1, 1,
0.2007432, -1.012067, 3.123285, 1, 1, 1, 1, 1,
0.2056375, 0.2358056, -0.1212194, 1, 1, 1, 1, 1,
0.2063351, -0.1988257, 2.688638, 1, 1, 1, 1, 1,
0.2090675, -1.027704, 3.536908, 1, 1, 1, 1, 1,
0.2104792, 0.09959314, 2.348992, 1, 1, 1, 1, 1,
0.2108605, -0.1974003, 2.278951, 1, 1, 1, 1, 1,
0.2122049, 0.6582038, 0.9719282, 1, 1, 1, 1, 1,
0.2142592, -0.01146552, 3.358721, 1, 1, 1, 1, 1,
0.2190893, 1.463825, 0.1002126, 1, 1, 1, 1, 1,
0.2193448, 1.388131, 2.053547, 1, 1, 1, 1, 1,
0.2207482, -0.6963773, 3.062086, 1, 1, 1, 1, 1,
0.2254902, 0.7983668, 0.2374347, 1, 1, 1, 1, 1,
0.2259118, 1.515517, 0.630136, 0, 0, 1, 1, 1,
0.2269197, -0.05830304, 2.001564, 1, 0, 0, 1, 1,
0.2373734, 0.833026, 2.489144, 1, 0, 0, 1, 1,
0.2466587, 0.9744554, 0.996992, 1, 0, 0, 1, 1,
0.2498697, 1.353055, 2.127807, 1, 0, 0, 1, 1,
0.2502309, 0.4094069, -0.2625504, 1, 0, 0, 1, 1,
0.2546904, -0.5268286, 0.923637, 0, 0, 0, 1, 1,
0.2568177, -0.06846016, 4.161102, 0, 0, 0, 1, 1,
0.2615511, -1.021871, 2.718548, 0, 0, 0, 1, 1,
0.2675352, 0.3105314, 0.9213372, 0, 0, 0, 1, 1,
0.2682999, 0.4595798, 1.310114, 0, 0, 0, 1, 1,
0.2702093, 1.086207, 0.345601, 0, 0, 0, 1, 1,
0.2729844, 1.163371, -0.1814182, 0, 0, 0, 1, 1,
0.2742383, 0.5002332, 0.7548721, 1, 1, 1, 1, 1,
0.2742971, 0.7365155, 1.566999, 1, 1, 1, 1, 1,
0.2746221, 0.4351903, 0.4699399, 1, 1, 1, 1, 1,
0.2788916, -0.5424964, 1.085538, 1, 1, 1, 1, 1,
0.2804932, -0.3151742, 2.135168, 1, 1, 1, 1, 1,
0.2828387, -0.4124444, 3.156397, 1, 1, 1, 1, 1,
0.2830557, -0.4531244, 2.50438, 1, 1, 1, 1, 1,
0.2839969, -1.114489, 2.870677, 1, 1, 1, 1, 1,
0.2843738, 2.281076, 0.4652806, 1, 1, 1, 1, 1,
0.2849224, -0.2507997, 2.576497, 1, 1, 1, 1, 1,
0.2945946, -0.05834507, 3.464297, 1, 1, 1, 1, 1,
0.2984527, -1.078439, 3.649573, 1, 1, 1, 1, 1,
0.3043839, -0.3260882, 1.925476, 1, 1, 1, 1, 1,
0.3091457, -0.1223924, 0.8464106, 1, 1, 1, 1, 1,
0.3189576, -0.1977534, 3.142111, 1, 1, 1, 1, 1,
0.3189799, -0.1520821, 2.539378, 0, 0, 1, 1, 1,
0.3192217, -0.7894321, 3.290468, 1, 0, 0, 1, 1,
0.3212368, 0.7624596, -1.0072, 1, 0, 0, 1, 1,
0.3235831, -0.8594128, 1.54265, 1, 0, 0, 1, 1,
0.3251684, -1.320215, 4.566724, 1, 0, 0, 1, 1,
0.3256992, 0.07323574, 3.628291, 1, 0, 0, 1, 1,
0.3259535, -1.86197, 4.569996, 0, 0, 0, 1, 1,
0.3274109, -1.440813, 2.78232, 0, 0, 0, 1, 1,
0.3284198, -1.847347, 3.58161, 0, 0, 0, 1, 1,
0.3292555, -0.6115943, 2.899151, 0, 0, 0, 1, 1,
0.3314695, -0.4620451, 2.342519, 0, 0, 0, 1, 1,
0.3336754, -1.363784, 4.696104, 0, 0, 0, 1, 1,
0.333719, -0.3744653, 3.128886, 0, 0, 0, 1, 1,
0.3348343, -1.864529, 2.64234, 1, 1, 1, 1, 1,
0.3417336, -0.4563413, 1.85705, 1, 1, 1, 1, 1,
0.3463384, 0.3828222, 1.27883, 1, 1, 1, 1, 1,
0.346587, -1.590679, 2.994291, 1, 1, 1, 1, 1,
0.3482889, 0.2080462, 0.3509282, 1, 1, 1, 1, 1,
0.3488123, 1.305725, 0.05000285, 1, 1, 1, 1, 1,
0.3498025, 0.0702918, 2.297604, 1, 1, 1, 1, 1,
0.349958, -1.78215, 3.16276, 1, 1, 1, 1, 1,
0.3508765, -0.9181728, 2.477637, 1, 1, 1, 1, 1,
0.352002, -1.688129, 2.769731, 1, 1, 1, 1, 1,
0.3556403, -0.6344777, 3.838554, 1, 1, 1, 1, 1,
0.3568129, 1.845785, 1.209119, 1, 1, 1, 1, 1,
0.3592961, 0.9300256, 1.952684, 1, 1, 1, 1, 1,
0.3598562, 0.3942119, 2.645898, 1, 1, 1, 1, 1,
0.3643027, -1.113373, 1.672494, 1, 1, 1, 1, 1,
0.3672255, 1.67181, 1.783658, 0, 0, 1, 1, 1,
0.3704334, 0.907104, -0.4548212, 1, 0, 0, 1, 1,
0.3728101, 1.234502, -0.7925808, 1, 0, 0, 1, 1,
0.3743106, -0.291364, 2.447961, 1, 0, 0, 1, 1,
0.3749678, -0.2533081, 3.303697, 1, 0, 0, 1, 1,
0.3773648, 0.2820037, 1.063417, 1, 0, 0, 1, 1,
0.3795707, -0.5185807, 2.736764, 0, 0, 0, 1, 1,
0.3802519, 0.6968032, -0.688634, 0, 0, 0, 1, 1,
0.3860271, -0.1491903, 3.245954, 0, 0, 0, 1, 1,
0.3870995, 0.5960559, 0.3634565, 0, 0, 0, 1, 1,
0.3930427, -0.8247573, 4.287821, 0, 0, 0, 1, 1,
0.394186, 0.720621, 1.130412, 0, 0, 0, 1, 1,
0.4037491, -0.5076296, 3.450739, 0, 0, 0, 1, 1,
0.4065374, 0.4813918, 2.442483, 1, 1, 1, 1, 1,
0.4179991, 1.346878, 1.157499, 1, 1, 1, 1, 1,
0.4214712, 0.7469596, 0.2597615, 1, 1, 1, 1, 1,
0.4219252, 0.8752481, -0.2147046, 1, 1, 1, 1, 1,
0.4248079, 0.2255794, 1.110077, 1, 1, 1, 1, 1,
0.42481, -0.08392116, 2.175814, 1, 1, 1, 1, 1,
0.4255768, -1.087179, 1.550185, 1, 1, 1, 1, 1,
0.4264087, 1.04457, -0.9347282, 1, 1, 1, 1, 1,
0.4329115, 1.782858, -1.549958, 1, 1, 1, 1, 1,
0.4336878, 1.26098, -0.1049968, 1, 1, 1, 1, 1,
0.433693, 1.678159, -0.0704058, 1, 1, 1, 1, 1,
0.4385476, 1.110104, -1.051558, 1, 1, 1, 1, 1,
0.4391404, 1.626726, 1.061536, 1, 1, 1, 1, 1,
0.4405062, 1.338449, -0.4444132, 1, 1, 1, 1, 1,
0.443662, 2.34143, 0.6473698, 1, 1, 1, 1, 1,
0.4450129, -2.353333, 2.762127, 0, 0, 1, 1, 1,
0.4477318, 0.1549931, 1.441532, 1, 0, 0, 1, 1,
0.4491559, -1.484274, 2.587193, 1, 0, 0, 1, 1,
0.4496427, -0.1658852, 2.33612, 1, 0, 0, 1, 1,
0.4532542, 0.5611044, 0.9781439, 1, 0, 0, 1, 1,
0.4550775, 0.3851646, 0.7214923, 1, 0, 0, 1, 1,
0.4557356, 0.1595444, 0.1125124, 0, 0, 0, 1, 1,
0.4559904, 0.762036, 2.569263, 0, 0, 0, 1, 1,
0.4579014, 0.937952, -0.474174, 0, 0, 0, 1, 1,
0.4594217, -0.9457723, 0.6023703, 0, 0, 0, 1, 1,
0.4611661, 0.880569, 1.094149, 0, 0, 0, 1, 1,
0.465433, -0.1556527, 2.747295, 0, 0, 0, 1, 1,
0.465578, -1.49047, 3.463865, 0, 0, 0, 1, 1,
0.4708557, 1.037183, 1.675542, 1, 1, 1, 1, 1,
0.4723435, 0.2575213, 0.4663843, 1, 1, 1, 1, 1,
0.4753068, 0.1410157, 0.6221462, 1, 1, 1, 1, 1,
0.4753812, -0.4522467, 0.3563822, 1, 1, 1, 1, 1,
0.4767228, 1.752059, 0.5275101, 1, 1, 1, 1, 1,
0.4815557, 0.9738455, -0.4418907, 1, 1, 1, 1, 1,
0.4840651, -1.446361, 3.132195, 1, 1, 1, 1, 1,
0.4852627, 3.268412, -0.02835067, 1, 1, 1, 1, 1,
0.4873303, -0.01045832, 2.052741, 1, 1, 1, 1, 1,
0.489824, 1.736126, -0.6120763, 1, 1, 1, 1, 1,
0.4908633, 1.330481, 0.2738697, 1, 1, 1, 1, 1,
0.4951832, 1.097769, 0.6443713, 1, 1, 1, 1, 1,
0.4954225, 0.9422688, 0.909256, 1, 1, 1, 1, 1,
0.495867, -1.671653, 3.841485, 1, 1, 1, 1, 1,
0.4979268, 0.208462, 1.719337, 1, 1, 1, 1, 1,
0.5013927, -0.9428718, 3.86147, 0, 0, 1, 1, 1,
0.5083242, -1.584905, 2.158726, 1, 0, 0, 1, 1,
0.5096396, -0.3189495, 2.03453, 1, 0, 0, 1, 1,
0.510833, -1.335548, 2.671587, 1, 0, 0, 1, 1,
0.5137689, 0.2341642, 0.7158638, 1, 0, 0, 1, 1,
0.5164334, -1.018023, 3.3273, 1, 0, 0, 1, 1,
0.5217558, -1.496793, 3.994692, 0, 0, 0, 1, 1,
0.5235485, 1.355974, -1.840214, 0, 0, 0, 1, 1,
0.5236926, 0.4719863, 0.8121403, 0, 0, 0, 1, 1,
0.5275969, -1.204484, 2.641833, 0, 0, 0, 1, 1,
0.5448599, 0.005309075, 0.7208877, 0, 0, 0, 1, 1,
0.5475495, -0.7590743, 0.571018, 0, 0, 0, 1, 1,
0.5496683, -0.8950453, 2.954681, 0, 0, 0, 1, 1,
0.5527036, 0.3789451, 1.262558, 1, 1, 1, 1, 1,
0.5545822, -1.253067, 1.325229, 1, 1, 1, 1, 1,
0.5610901, -0.04160059, 2.178272, 1, 1, 1, 1, 1,
0.5742273, -0.9103066, 2.435636, 1, 1, 1, 1, 1,
0.5744236, 1.206428, 1.175893, 1, 1, 1, 1, 1,
0.5755612, -1.067472, 0.9219272, 1, 1, 1, 1, 1,
0.579386, 0.9637596, 1.26793, 1, 1, 1, 1, 1,
0.5832943, -0.362104, 3.530136, 1, 1, 1, 1, 1,
0.5859885, -1.455667, 2.980163, 1, 1, 1, 1, 1,
0.586227, -1.133536, 1.162495, 1, 1, 1, 1, 1,
0.5865155, 0.8545462, 0.6452633, 1, 1, 1, 1, 1,
0.5874347, -0.5240619, 2.033248, 1, 1, 1, 1, 1,
0.5886931, 2.536188, 0.303584, 1, 1, 1, 1, 1,
0.5964823, 1.266112, 2.069811, 1, 1, 1, 1, 1,
0.5971709, -0.8829395, 2.600139, 1, 1, 1, 1, 1,
0.5994514, 0.02276795, 2.067976, 0, 0, 1, 1, 1,
0.6005614, 0.2471323, -0.2548559, 1, 0, 0, 1, 1,
0.6013949, 1.427189, 0.2113577, 1, 0, 0, 1, 1,
0.6018165, -1.129521, 3.374312, 1, 0, 0, 1, 1,
0.6090333, 2.046835, -1.180072, 1, 0, 0, 1, 1,
0.6094502, -0.04121641, 2.607987, 1, 0, 0, 1, 1,
0.6134214, 1.287499, 1.602717, 0, 0, 0, 1, 1,
0.6152816, -0.4766016, 2.742601, 0, 0, 0, 1, 1,
0.6191878, -0.3726353, 3.346509, 0, 0, 0, 1, 1,
0.6192102, -0.1275803, 2.933249, 0, 0, 0, 1, 1,
0.6201105, -0.8341499, 3.049818, 0, 0, 0, 1, 1,
0.621896, 0.02028713, 2.454107, 0, 0, 0, 1, 1,
0.6231878, 0.09590919, 0.2588638, 0, 0, 0, 1, 1,
0.6237682, 0.6263399, -0.2185463, 1, 1, 1, 1, 1,
0.6298214, -0.4490597, 3.999599, 1, 1, 1, 1, 1,
0.6325087, -0.5129932, 2.889412, 1, 1, 1, 1, 1,
0.6327531, -1.306637, 2.220147, 1, 1, 1, 1, 1,
0.64451, -0.6199335, 0.8134937, 1, 1, 1, 1, 1,
0.6463646, -0.05629699, 0.7196031, 1, 1, 1, 1, 1,
0.6513513, 0.536096, -0.2776206, 1, 1, 1, 1, 1,
0.6558113, 0.4816557, 1.451138, 1, 1, 1, 1, 1,
0.6574665, -0.1759145, 2.544733, 1, 1, 1, 1, 1,
0.6574866, 0.5729834, 2.057745, 1, 1, 1, 1, 1,
0.6650042, 0.4923388, -0.8728302, 1, 1, 1, 1, 1,
0.6694786, -0.2845233, 2.561928, 1, 1, 1, 1, 1,
0.6722057, 0.4164152, 1.720022, 1, 1, 1, 1, 1,
0.6740996, 0.5056725, 2.954463, 1, 1, 1, 1, 1,
0.6746298, -1.109163, 3.066668, 1, 1, 1, 1, 1,
0.6753668, 1.961275, 0.729755, 0, 0, 1, 1, 1,
0.694115, -1.126581, 0.9001824, 1, 0, 0, 1, 1,
0.6948461, 0.05521108, 1.103502, 1, 0, 0, 1, 1,
0.7032201, 1.746522, 0.5464936, 1, 0, 0, 1, 1,
0.7037169, -0.2955485, 2.665768, 1, 0, 0, 1, 1,
0.7083374, 0.4684135, 2.68589, 1, 0, 0, 1, 1,
0.7097976, -1.75551, 4.047745, 0, 0, 0, 1, 1,
0.7141766, 0.89303, -1.066736, 0, 0, 0, 1, 1,
0.7156771, -0.002739462, 2.047515, 0, 0, 0, 1, 1,
0.7202296, -0.4792042, 2.397335, 0, 0, 0, 1, 1,
0.720741, 0.3276023, 2.207767, 0, 0, 0, 1, 1,
0.7243283, 0.6654095, 0.233882, 0, 0, 0, 1, 1,
0.7267871, -1.070274, 2.676813, 0, 0, 0, 1, 1,
0.7284344, 0.3321676, 1.735769, 1, 1, 1, 1, 1,
0.7287149, 1.492522, 0.4366921, 1, 1, 1, 1, 1,
0.7295932, -0.8827639, 3.163836, 1, 1, 1, 1, 1,
0.7333721, -1.325147, 4.031251, 1, 1, 1, 1, 1,
0.737944, -1.592394, 1.486939, 1, 1, 1, 1, 1,
0.7410895, -2.075167, 3.123986, 1, 1, 1, 1, 1,
0.7416501, -0.9955254, 1.970059, 1, 1, 1, 1, 1,
0.7427829, -0.6522147, 2.98579, 1, 1, 1, 1, 1,
0.7453701, -0.3321634, 1.340359, 1, 1, 1, 1, 1,
0.7476539, 0.953949, 1.197617, 1, 1, 1, 1, 1,
0.7525148, -0.4552622, 2.257565, 1, 1, 1, 1, 1,
0.7530984, 0.07816032, 0.821828, 1, 1, 1, 1, 1,
0.7535125, 0.2853895, 0.04768544, 1, 1, 1, 1, 1,
0.7556408, -0.4840419, 1.641688, 1, 1, 1, 1, 1,
0.7578354, 0.7265784, -0.4307693, 1, 1, 1, 1, 1,
0.7629052, 0.3452762, 0.7464418, 0, 0, 1, 1, 1,
0.7646563, -0.3866023, 0.3215363, 1, 0, 0, 1, 1,
0.7680423, -0.03400005, 2.074436, 1, 0, 0, 1, 1,
0.7716117, -1.861781, 3.495544, 1, 0, 0, 1, 1,
0.7725643, 0.9801168, -0.09912577, 1, 0, 0, 1, 1,
0.7737274, 0.5570435, 1.303222, 1, 0, 0, 1, 1,
0.7771716, -0.3239096, 3.36184, 0, 0, 0, 1, 1,
0.7776721, 0.08961226, 2.090088, 0, 0, 0, 1, 1,
0.7778117, 0.8313699, 0.6827514, 0, 0, 0, 1, 1,
0.779221, 0.4566676, 0.9982657, 0, 0, 0, 1, 1,
0.7877352, -0.5086589, 1.160852, 0, 0, 0, 1, 1,
0.7884374, 0.5790861, 1.033351, 0, 0, 0, 1, 1,
0.7915284, -0.7697718, 2.349899, 0, 0, 0, 1, 1,
0.7917477, -1.275667, 2.317664, 1, 1, 1, 1, 1,
0.7932659, -0.1560944, 0.9547563, 1, 1, 1, 1, 1,
0.7955954, -0.5381356, 1.809185, 1, 1, 1, 1, 1,
0.7960981, 0.11893, 0.1084685, 1, 1, 1, 1, 1,
0.7992168, -0.8020445, 4.069209, 1, 1, 1, 1, 1,
0.8006257, 1.452268, 2.796436, 1, 1, 1, 1, 1,
0.8033156, 0.6605681, 0.1458012, 1, 1, 1, 1, 1,
0.8090512, -1.100709, 2.613839, 1, 1, 1, 1, 1,
0.8313478, 1.24396, 0.2033319, 1, 1, 1, 1, 1,
0.8319051, 0.495855, 0.4935234, 1, 1, 1, 1, 1,
0.8330064, 0.5340425, 3.22975, 1, 1, 1, 1, 1,
0.8335912, 0.1934974, 1.799743, 1, 1, 1, 1, 1,
0.8411103, 0.553171, 0.2943047, 1, 1, 1, 1, 1,
0.8440502, 0.3460583, 0.6781392, 1, 1, 1, 1, 1,
0.8491496, 0.4625428, 2.470606, 1, 1, 1, 1, 1,
0.8509318, 0.05793604, 0.1425807, 0, 0, 1, 1, 1,
0.851042, 1.564221, 1.557105, 1, 0, 0, 1, 1,
0.8519453, 0.4000731, -0.1172919, 1, 0, 0, 1, 1,
0.8531739, -0.2724394, 4.34678, 1, 0, 0, 1, 1,
0.8560017, -0.7789567, 1.700422, 1, 0, 0, 1, 1,
0.8785306, 0.5266225, 0.9045616, 1, 0, 0, 1, 1,
0.88533, 0.1085975, 2.039887, 0, 0, 0, 1, 1,
0.8926445, 2.627735, -0.071761, 0, 0, 0, 1, 1,
0.8948897, -0.8996555, 2.564126, 0, 0, 0, 1, 1,
0.8969967, -0.5183305, 1.228409, 0, 0, 0, 1, 1,
0.9007529, 2.116227, -1.377011, 0, 0, 0, 1, 1,
0.906233, -0.08340646, 0.7362286, 0, 0, 0, 1, 1,
0.9082401, -0.3907133, 1.276343, 0, 0, 0, 1, 1,
0.9087806, -0.9323788, 2.592329, 1, 1, 1, 1, 1,
0.9125496, 0.80633, 0.2173468, 1, 1, 1, 1, 1,
0.9195707, -0.1407401, 0.3379813, 1, 1, 1, 1, 1,
0.9241862, 1.155278, 0.1452793, 1, 1, 1, 1, 1,
0.9372994, -0.9240789, 3.136413, 1, 1, 1, 1, 1,
0.9408914, 0.5982924, 0.5153981, 1, 1, 1, 1, 1,
0.9451814, -0.8197228, 2.956014, 1, 1, 1, 1, 1,
0.9469322, 0.1597777, 1.158597, 1, 1, 1, 1, 1,
0.9470892, -2.120126, 3.205711, 1, 1, 1, 1, 1,
0.9533886, -0.3323432, 1.063031, 1, 1, 1, 1, 1,
0.9563389, -0.4378504, 0.9863305, 1, 1, 1, 1, 1,
0.9585536, -0.6192386, 2.976638, 1, 1, 1, 1, 1,
0.964523, 0.3528101, 1.239789, 1, 1, 1, 1, 1,
0.9647648, 0.8612407, -1.005962, 1, 1, 1, 1, 1,
0.9686015, 0.3864164, -0.4792423, 1, 1, 1, 1, 1,
0.975323, 0.04210766, 3.263446, 0, 0, 1, 1, 1,
0.9804002, 1.510537, 1.489925, 1, 0, 0, 1, 1,
0.9815307, 2.041306, 1.408227, 1, 0, 0, 1, 1,
0.9815753, -1.314998, 2.449535, 1, 0, 0, 1, 1,
0.9857779, -0.634105, 4.026933, 1, 0, 0, 1, 1,
0.9887166, 0.9612644, 0.7323302, 1, 0, 0, 1, 1,
0.9904491, 0.05475412, 4.273318, 0, 0, 0, 1, 1,
0.9907347, -3.212945, 1.843662, 0, 0, 0, 1, 1,
0.990845, 0.0840205, 1.552834, 0, 0, 0, 1, 1,
1.003918, 0.2540027, 1.381736, 0, 0, 0, 1, 1,
1.016374, -0.7413832, 3.465141, 0, 0, 0, 1, 1,
1.01752, 0.8627924, 1.802365, 0, 0, 0, 1, 1,
1.024062, -0.02104237, 3.148527, 0, 0, 0, 1, 1,
1.029903, -0.0553431, 1.345859, 1, 1, 1, 1, 1,
1.033021, -0.5926962, 1.517002, 1, 1, 1, 1, 1,
1.033361, -1.312655, 2.622946, 1, 1, 1, 1, 1,
1.033993, -0.5847363, 1.924744, 1, 1, 1, 1, 1,
1.044019, -0.237054, 2.16993, 1, 1, 1, 1, 1,
1.045968, 0.3627723, 0.6337304, 1, 1, 1, 1, 1,
1.04909, -1.536941, 3.215727, 1, 1, 1, 1, 1,
1.053423, -0.4572348, 2.689586, 1, 1, 1, 1, 1,
1.062646, 0.1674994, 2.609056, 1, 1, 1, 1, 1,
1.081928, -0.2846852, 0.8912308, 1, 1, 1, 1, 1,
1.082212, 1.589787, 1.080842, 1, 1, 1, 1, 1,
1.096825, -0.1537106, 1.461938, 1, 1, 1, 1, 1,
1.098751, -0.3859623, 2.442593, 1, 1, 1, 1, 1,
1.100755, 0.9855661, -0.08137834, 1, 1, 1, 1, 1,
1.101133, 0.5708156, 1.3638, 1, 1, 1, 1, 1,
1.102049, 0.6497672, -0.08173113, 0, 0, 1, 1, 1,
1.102746, 1.439417, 0.5532132, 1, 0, 0, 1, 1,
1.116611, 0.08190896, 1.818552, 1, 0, 0, 1, 1,
1.119094, 0.05191998, 0.4689053, 1, 0, 0, 1, 1,
1.11917, 0.6778203, 1.754064, 1, 0, 0, 1, 1,
1.120204, -0.1853104, 2.854413, 1, 0, 0, 1, 1,
1.122054, -0.381623, 2.655806, 0, 0, 0, 1, 1,
1.126549, 0.5600403, 1.640674, 0, 0, 0, 1, 1,
1.129418, -0.3583826, 0.4184992, 0, 0, 0, 1, 1,
1.134297, -1.039021, 0.3656846, 0, 0, 0, 1, 1,
1.134382, -0.6165236, 2.876336, 0, 0, 0, 1, 1,
1.141054, -0.2865687, 1.105881, 0, 0, 0, 1, 1,
1.142665, -1.658816, 2.385341, 0, 0, 0, 1, 1,
1.146481, 0.2414368, 1.66919, 1, 1, 1, 1, 1,
1.155212, 0.7200133, 1.073381, 1, 1, 1, 1, 1,
1.161836, 0.6459661, 1.744217, 1, 1, 1, 1, 1,
1.163574, -1.130481, 3.680704, 1, 1, 1, 1, 1,
1.170159, 0.4484754, 0.3990719, 1, 1, 1, 1, 1,
1.183169, -0.2594041, 0.2793029, 1, 1, 1, 1, 1,
1.196237, -0.04220262, 1.114369, 1, 1, 1, 1, 1,
1.199625, 0.7591962, 1.06215, 1, 1, 1, 1, 1,
1.200047, 0.400501, 0.9200661, 1, 1, 1, 1, 1,
1.20357, -0.0245477, 1.288011, 1, 1, 1, 1, 1,
1.20785, -0.3509792, 1.839582, 1, 1, 1, 1, 1,
1.209154, 0.8311952, -0.2589751, 1, 1, 1, 1, 1,
1.212694, 0.3191926, 2.612682, 1, 1, 1, 1, 1,
1.21427, 0.8065538, 0.1639046, 1, 1, 1, 1, 1,
1.215969, 0.6736107, 0.09151132, 1, 1, 1, 1, 1,
1.224421, -1.602387, 2.423964, 0, 0, 1, 1, 1,
1.225459, 0.6221076, 1.453966, 1, 0, 0, 1, 1,
1.227561, -0.01929567, 1.030435, 1, 0, 0, 1, 1,
1.227583, -0.2967417, 2.696377, 1, 0, 0, 1, 1,
1.231495, -0.1092227, 3.325082, 1, 0, 0, 1, 1,
1.231535, 1.384708, 0.8211595, 1, 0, 0, 1, 1,
1.235201, -0.9119785, 0.9880471, 0, 0, 0, 1, 1,
1.236558, -0.008289428, 2.05219, 0, 0, 0, 1, 1,
1.247206, -0.7385954, 3.035856, 0, 0, 0, 1, 1,
1.266574, 1.648861, 2.011627, 0, 0, 0, 1, 1,
1.267509, 0.2582408, 1.171743, 0, 0, 0, 1, 1,
1.280242, -1.207929, 2.707849, 0, 0, 0, 1, 1,
1.28069, -0.4560744, 1.917238, 0, 0, 0, 1, 1,
1.290541, -1.194649, 1.49402, 1, 1, 1, 1, 1,
1.291675, -0.5782724, 1.534912, 1, 1, 1, 1, 1,
1.29372, 0.05457571, 1.340776, 1, 1, 1, 1, 1,
1.294092, -0.3868811, 1.945017, 1, 1, 1, 1, 1,
1.298377, -0.5694691, 0.8632568, 1, 1, 1, 1, 1,
1.299001, 1.757015, 1.558103, 1, 1, 1, 1, 1,
1.300582, -1.351575, 4.89087, 1, 1, 1, 1, 1,
1.302335, -3.072344, 0.5182931, 1, 1, 1, 1, 1,
1.312854, 0.1235891, 1.378225, 1, 1, 1, 1, 1,
1.328886, 0.404184, 2.772867, 1, 1, 1, 1, 1,
1.331056, 0.3449798, 1.973424, 1, 1, 1, 1, 1,
1.33729, 2.327205, 0.9412268, 1, 1, 1, 1, 1,
1.344501, -0.333043, 1.721248, 1, 1, 1, 1, 1,
1.350827, -1.248464, 2.231342, 1, 1, 1, 1, 1,
1.376231, 0.4163034, 0.7696329, 1, 1, 1, 1, 1,
1.384572, -0.9811357, 3.127579, 0, 0, 1, 1, 1,
1.391166, -0.8122784, 2.493098, 1, 0, 0, 1, 1,
1.416605, -1.017843, 2.974925, 1, 0, 0, 1, 1,
1.419657, -0.2593956, 1.864735, 1, 0, 0, 1, 1,
1.419808, 0.1845104, -0.03395659, 1, 0, 0, 1, 1,
1.42716, 2.402799, 1.081448, 1, 0, 0, 1, 1,
1.430382, 1.516885, 1.926111, 0, 0, 0, 1, 1,
1.442287, 1.855396, 2.110902, 0, 0, 0, 1, 1,
1.445518, 0.3745598, 1.319853, 0, 0, 0, 1, 1,
1.450712, 0.5847133, 1.604242, 0, 0, 0, 1, 1,
1.454219, 0.7487752, 1.709797, 0, 0, 0, 1, 1,
1.45982, 0.671053, 2.381137, 0, 0, 0, 1, 1,
1.465488, -0.5699641, 1.639906, 0, 0, 0, 1, 1,
1.466528, 1.322198, 1.154116, 1, 1, 1, 1, 1,
1.470848, -0.7281969, 1.556179, 1, 1, 1, 1, 1,
1.485126, -0.3150133, 2.086452, 1, 1, 1, 1, 1,
1.48852, -0.05110133, 0.1226716, 1, 1, 1, 1, 1,
1.49876, 0.2197676, 1.302349, 1, 1, 1, 1, 1,
1.507127, 1.795267, 0.541934, 1, 1, 1, 1, 1,
1.532792, 0.1451929, 1.515147, 1, 1, 1, 1, 1,
1.535636, 0.3289483, 1.682497, 1, 1, 1, 1, 1,
1.546261, -0.2196117, 1.295608, 1, 1, 1, 1, 1,
1.554168, -0.2713979, 2.150918, 1, 1, 1, 1, 1,
1.559962, 1.045479, 1.04567, 1, 1, 1, 1, 1,
1.563164, 0.455757, -0.3782693, 1, 1, 1, 1, 1,
1.569132, 1.368391, -0.3025973, 1, 1, 1, 1, 1,
1.572932, 1.199875, 1.361518, 1, 1, 1, 1, 1,
1.576614, 1.395537, -1.703399, 1, 1, 1, 1, 1,
1.578092, 2.140095, -0.678476, 0, 0, 1, 1, 1,
1.579829, -0.3923728, 3.083447, 1, 0, 0, 1, 1,
1.609815, 0.2787128, 1.078316, 1, 0, 0, 1, 1,
1.610558, -1.519996, 1.481802, 1, 0, 0, 1, 1,
1.627948, -1.625845, 3.08542, 1, 0, 0, 1, 1,
1.660311, -2.467067, 1.694205, 1, 0, 0, 1, 1,
1.667735, 0.2453955, 2.411896, 0, 0, 0, 1, 1,
1.669706, -0.3503202, -1.257626, 0, 0, 0, 1, 1,
1.671921, 0.7688181, 1.504346, 0, 0, 0, 1, 1,
1.676072, 0.5000783, 1.58023, 0, 0, 0, 1, 1,
1.680658, -0.9770734, 2.00966, 0, 0, 0, 1, 1,
1.689066, 1.579531, 1.330365, 0, 0, 0, 1, 1,
1.714508, 0.5259151, 2.346933, 0, 0, 0, 1, 1,
1.733185, -1.512401, -0.4498389, 1, 1, 1, 1, 1,
1.734336, 0.177017, 0.2536485, 1, 1, 1, 1, 1,
1.744056, 0.1030979, 4.264689, 1, 1, 1, 1, 1,
1.74493, 0.125499, 2.242894, 1, 1, 1, 1, 1,
1.747392, 0.8578785, 2.958952, 1, 1, 1, 1, 1,
1.766382, 1.15119, 0.9958198, 1, 1, 1, 1, 1,
1.812891, 0.626178, 1.803367, 1, 1, 1, 1, 1,
1.829683, 0.4998863, 1.340194, 1, 1, 1, 1, 1,
1.833266, -0.8637576, 0.9167073, 1, 1, 1, 1, 1,
1.845313, 0.9535233, -2.452653, 1, 1, 1, 1, 1,
1.853795, 0.278834, 0.2538177, 1, 1, 1, 1, 1,
1.890092, -0.4134348, 1.81383, 1, 1, 1, 1, 1,
1.898915, 0.7356505, 1.267332, 1, 1, 1, 1, 1,
1.901891, -0.6226345, 2.004055, 1, 1, 1, 1, 1,
1.905006, 1.272623, 1.120203, 1, 1, 1, 1, 1,
1.915696, 0.5816163, 2.620976, 0, 0, 1, 1, 1,
1.937634, 0.5881888, 1.263495, 1, 0, 0, 1, 1,
1.977551, -0.4167842, 1.576497, 1, 0, 0, 1, 1,
2.007087, 0.6172647, 1.456147, 1, 0, 0, 1, 1,
2.012163, -1.670341, 2.754501, 1, 0, 0, 1, 1,
2.045166, -1.563579, 3.407669, 1, 0, 0, 1, 1,
2.0617, -1.80647, 2.364708, 0, 0, 0, 1, 1,
2.137873, -1.071611, 3.390332, 0, 0, 0, 1, 1,
2.16551, -1.203518, 0.2599822, 0, 0, 0, 1, 1,
2.22551, -0.3705941, 0.06292474, 0, 0, 0, 1, 1,
2.276718, 0.927558, 1.947335, 0, 0, 0, 1, 1,
2.322668, 1.443832, -0.0402937, 0, 0, 0, 1, 1,
2.327545, 0.7054554, -0.7294954, 0, 0, 0, 1, 1,
2.332944, 1.544037, -0.05582844, 1, 1, 1, 1, 1,
2.372504, -1.123639, 1.955404, 1, 1, 1, 1, 1,
2.381299, -0.115796, 1.892138, 1, 1, 1, 1, 1,
2.428481, 1.329483, 1.065671, 1, 1, 1, 1, 1,
2.843498, -0.8534417, 2.349804, 1, 1, 1, 1, 1,
2.844126, 0.2823469, 3.11145, 1, 1, 1, 1, 1,
2.885509, 0.5746734, 1.650674, 1, 1, 1, 1, 1
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
var radius = 9.828685;
var distance = 34.52284;
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
mvMatrix.translate( 0.0212481, -0.3879857, 0.3382578 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.52284);
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
