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
-3.521073, 0.6505966, -2.706494, 1, 0, 0, 1,
-3.263495, 0.2111602, -1.529522, 1, 0.007843138, 0, 1,
-2.643297, 0.6368272, -1.737753, 1, 0.01176471, 0, 1,
-2.465547, -0.6393173, -3.61375, 1, 0.01960784, 0, 1,
-2.44918, 0.2214794, -2.193489, 1, 0.02352941, 0, 1,
-2.275633, 1.569675, -1.217989, 1, 0.03137255, 0, 1,
-2.266021, -0.4603546, -1.603651, 1, 0.03529412, 0, 1,
-2.233004, 0.08075944, -1.8517, 1, 0.04313726, 0, 1,
-2.225302, -0.5238516, -1.515566, 1, 0.04705882, 0, 1,
-2.152675, 1.332357, -1.205464, 1, 0.05490196, 0, 1,
-2.133865, 0.1116506, -1.935916, 1, 0.05882353, 0, 1,
-2.105407, 0.8611177, -1.100952, 1, 0.06666667, 0, 1,
-2.074455, 0.5623391, -2.946285, 1, 0.07058824, 0, 1,
-2.072848, 1.831543, -1.035945, 1, 0.07843138, 0, 1,
-2.068854, 0.2568968, -2.528942, 1, 0.08235294, 0, 1,
-2.063757, -1.509921, -3.394953, 1, 0.09019608, 0, 1,
-2.033941, -0.9091409, -1.74018, 1, 0.09411765, 0, 1,
-2.033809, 0.3912894, -2.636887, 1, 0.1019608, 0, 1,
-2.014313, 0.1599315, -0.9865541, 1, 0.1098039, 0, 1,
-1.959883, 0.7990388, -1.76904, 1, 0.1137255, 0, 1,
-1.953213, -1.259875, -3.055365, 1, 0.1215686, 0, 1,
-1.946203, -0.8958936, -0.4897419, 1, 0.1254902, 0, 1,
-1.916724, 0.8679145, -0.2854873, 1, 0.1333333, 0, 1,
-1.898036, -0.04932891, -1.603348, 1, 0.1372549, 0, 1,
-1.882033, -0.8777834, -1.905565, 1, 0.145098, 0, 1,
-1.864711, -0.6797116, -0.7437964, 1, 0.1490196, 0, 1,
-1.850406, -0.227301, -1.669245, 1, 0.1568628, 0, 1,
-1.84113, -1.550921, -2.109174, 1, 0.1607843, 0, 1,
-1.839028, 1.617376, -0.1348064, 1, 0.1686275, 0, 1,
-1.838315, 0.09551467, -1.831928, 1, 0.172549, 0, 1,
-1.807566, -0.3414948, -2.540702, 1, 0.1803922, 0, 1,
-1.805246, 2.106299, -1.037589, 1, 0.1843137, 0, 1,
-1.76159, 0.7239838, -0.1795012, 1, 0.1921569, 0, 1,
-1.75953, 0.3032464, -1.426918, 1, 0.1960784, 0, 1,
-1.75496, 0.99936, 0.5858606, 1, 0.2039216, 0, 1,
-1.751866, 0.4609982, -2.497955, 1, 0.2117647, 0, 1,
-1.736849, -1.399408, -2.890624, 1, 0.2156863, 0, 1,
-1.719511, 0.6350233, 0.03527134, 1, 0.2235294, 0, 1,
-1.700079, 2.503445, -1.813138, 1, 0.227451, 0, 1,
-1.676037, -0.2805912, -1.847704, 1, 0.2352941, 0, 1,
-1.664827, 0.9714385, -0.6070338, 1, 0.2392157, 0, 1,
-1.651998, 0.7810329, -0.6113588, 1, 0.2470588, 0, 1,
-1.64585, -0.4294087, -2.685133, 1, 0.2509804, 0, 1,
-1.645054, -0.1576077, -1.301078, 1, 0.2588235, 0, 1,
-1.623707, 1.621505, 0.1305225, 1, 0.2627451, 0, 1,
-1.622998, 0.7131664, -0.8414744, 1, 0.2705882, 0, 1,
-1.614964, -0.2380051, -3.128567, 1, 0.2745098, 0, 1,
-1.61223, 1.273555, -1.305805, 1, 0.282353, 0, 1,
-1.588775, -1.135404, -2.390085, 1, 0.2862745, 0, 1,
-1.584618, -0.8081836, -1.365611, 1, 0.2941177, 0, 1,
-1.578533, -0.5656065, -3.625928, 1, 0.3019608, 0, 1,
-1.578267, -0.6512414, -2.024126, 1, 0.3058824, 0, 1,
-1.560782, -0.5801305, -0.1163645, 1, 0.3137255, 0, 1,
-1.552731, 3.694483, -1.179887, 1, 0.3176471, 0, 1,
-1.532538, 1.193253, -1.348032, 1, 0.3254902, 0, 1,
-1.516293, -1.131992, -3.000815, 1, 0.3294118, 0, 1,
-1.506731, -0.07435047, -0.788084, 1, 0.3372549, 0, 1,
-1.501752, 0.7219604, -1.273174, 1, 0.3411765, 0, 1,
-1.479402, 0.4385068, -0.2367252, 1, 0.3490196, 0, 1,
-1.477107, -0.220964, -1.466283, 1, 0.3529412, 0, 1,
-1.477027, 0.519431, -1.557037, 1, 0.3607843, 0, 1,
-1.455644, -0.8863323, -2.039543, 1, 0.3647059, 0, 1,
-1.45509, -0.1935214, -0.326811, 1, 0.372549, 0, 1,
-1.447819, -0.08022236, -2.467537, 1, 0.3764706, 0, 1,
-1.440467, -1.229701, -2.50486, 1, 0.3843137, 0, 1,
-1.436618, -1.600464, -1.950045, 1, 0.3882353, 0, 1,
-1.425323, -0.6598957, -3.347549, 1, 0.3960784, 0, 1,
-1.422159, 1.750881, -1.169587, 1, 0.4039216, 0, 1,
-1.412536, 1.911541, 0.08940489, 1, 0.4078431, 0, 1,
-1.400883, -0.8844837, -0.71021, 1, 0.4156863, 0, 1,
-1.390662, -0.6806338, -2.13127, 1, 0.4196078, 0, 1,
-1.380537, -1.09216, -1.860323, 1, 0.427451, 0, 1,
-1.378753, 0.736154, -1.816398, 1, 0.4313726, 0, 1,
-1.366777, 2.194777, -0.5692261, 1, 0.4392157, 0, 1,
-1.356105, -1.973376, -1.56602, 1, 0.4431373, 0, 1,
-1.355242, -0.8990633, -4.283453, 1, 0.4509804, 0, 1,
-1.354658, 1.397051, -1.220228, 1, 0.454902, 0, 1,
-1.35039, 1.352647, -1.868087, 1, 0.4627451, 0, 1,
-1.341381, 1.292157, -1.593978, 1, 0.4666667, 0, 1,
-1.328676, 0.9500064, -1.205613, 1, 0.4745098, 0, 1,
-1.324281, 0.1372204, -2.055708, 1, 0.4784314, 0, 1,
-1.316871, 0.8857107, -0.4406366, 1, 0.4862745, 0, 1,
-1.315101, 0.1118228, -1.056499, 1, 0.4901961, 0, 1,
-1.30751, 1.836994, -2.177146, 1, 0.4980392, 0, 1,
-1.307273, 0.9890749, -0.8410153, 1, 0.5058824, 0, 1,
-1.294294, 0.4827833, -3.609889, 1, 0.509804, 0, 1,
-1.291128, 2.236472, -1.221023, 1, 0.5176471, 0, 1,
-1.290979, 0.228994, -1.151806, 1, 0.5215687, 0, 1,
-1.281704, 1.382563, -0.8444044, 1, 0.5294118, 0, 1,
-1.273244, -0.8192595, -1.921128, 1, 0.5333334, 0, 1,
-1.264145, 0.2097697, -1.526408, 1, 0.5411765, 0, 1,
-1.260269, 1.74502, -1.414595, 1, 0.5450981, 0, 1,
-1.258268, -1.11716, -2.403183, 1, 0.5529412, 0, 1,
-1.250793, 0.7104293, -2.60885, 1, 0.5568628, 0, 1,
-1.250187, -0.01079217, -2.445659, 1, 0.5647059, 0, 1,
-1.24683, 0.4911478, -0.6329968, 1, 0.5686275, 0, 1,
-1.242787, 2.341828, -1.018784, 1, 0.5764706, 0, 1,
-1.213484, 0.0721911, -2.431638, 1, 0.5803922, 0, 1,
-1.198755, -0.1932549, -3.782937, 1, 0.5882353, 0, 1,
-1.196842, 0.4967041, -3.064994, 1, 0.5921569, 0, 1,
-1.195117, -1.233058, -3.451432, 1, 0.6, 0, 1,
-1.165511, 0.08897223, -1.611808, 1, 0.6078432, 0, 1,
-1.16225, -1.075699, -3.227962, 1, 0.6117647, 0, 1,
-1.161312, 0.7170004, -1.078025, 1, 0.6196079, 0, 1,
-1.148581, 1.171004, -0.07248743, 1, 0.6235294, 0, 1,
-1.147805, 0.6647331, -0.5198166, 1, 0.6313726, 0, 1,
-1.147288, -0.14079, -3.352499, 1, 0.6352941, 0, 1,
-1.147103, 1.034355, -1.731967, 1, 0.6431373, 0, 1,
-1.142686, 0.5361036, -2.613168, 1, 0.6470588, 0, 1,
-1.12863, -1.250543, -1.901139, 1, 0.654902, 0, 1,
-1.099448, -1.342145, -1.928361, 1, 0.6588235, 0, 1,
-1.086567, 0.7752087, -0.5319649, 1, 0.6666667, 0, 1,
-1.078174, 2.735004, 0.2972557, 1, 0.6705883, 0, 1,
-1.077624, -1.022088, -1.816628, 1, 0.6784314, 0, 1,
-1.075501, 1.732037, -0.4787235, 1, 0.682353, 0, 1,
-1.074057, 0.5647742, -0.3020326, 1, 0.6901961, 0, 1,
-1.072404, 0.04093944, -1.662174, 1, 0.6941177, 0, 1,
-1.069291, -0.9751955, -1.517517, 1, 0.7019608, 0, 1,
-1.063003, -0.5103643, -3.154158, 1, 0.7098039, 0, 1,
-1.0619, 0.7757719, -0.7715976, 1, 0.7137255, 0, 1,
-1.058241, 0.7779118, 1.318894, 1, 0.7215686, 0, 1,
-1.048862, 0.07259535, -1.938647, 1, 0.7254902, 0, 1,
-1.045437, 0.9283056, -0.8321242, 1, 0.7333333, 0, 1,
-1.044702, -0.2782567, -1.999593, 1, 0.7372549, 0, 1,
-1.044048, 0.5138027, -2.140878, 1, 0.7450981, 0, 1,
-1.035218, 0.8852916, -0.3108146, 1, 0.7490196, 0, 1,
-1.031865, -1.413821, -1.369054, 1, 0.7568628, 0, 1,
-1.029512, -1.205046, -0.6833224, 1, 0.7607843, 0, 1,
-1.026366, 1.759492, 0.03697814, 1, 0.7686275, 0, 1,
-1.024741, -0.04677743, -1.643844, 1, 0.772549, 0, 1,
-1.024486, -1.299437, -2.617339, 1, 0.7803922, 0, 1,
-1.017623, -0.8782908, -2.535184, 1, 0.7843137, 0, 1,
-1.012162, 1.326928, -1.719757, 1, 0.7921569, 0, 1,
-1.01123, 1.489425, -2.124931, 1, 0.7960784, 0, 1,
-0.9994432, 0.02951039, -1.856052, 1, 0.8039216, 0, 1,
-0.9962038, 0.2515521, -1.390367, 1, 0.8117647, 0, 1,
-0.993753, 0.04819331, -1.934185, 1, 0.8156863, 0, 1,
-0.9914047, 0.3117729, -1.2041, 1, 0.8235294, 0, 1,
-0.9848099, -0.9319185, -2.615399, 1, 0.827451, 0, 1,
-0.9844334, 0.124895, -3.27753, 1, 0.8352941, 0, 1,
-0.9841102, -1.370033, -3.254109, 1, 0.8392157, 0, 1,
-0.9749811, 1.248354, -0.7541438, 1, 0.8470588, 0, 1,
-0.9739812, 0.4008374, 0.2310431, 1, 0.8509804, 0, 1,
-0.966662, -0.266977, -2.13719, 1, 0.8588235, 0, 1,
-0.9642051, -1.174456, -2.379402, 1, 0.8627451, 0, 1,
-0.9625918, 0.4444121, -2.490759, 1, 0.8705882, 0, 1,
-0.9613805, -0.5257283, -1.910034, 1, 0.8745098, 0, 1,
-0.9535363, 0.1847715, -2.023747, 1, 0.8823529, 0, 1,
-0.9521078, -1.313274, -1.998608, 1, 0.8862745, 0, 1,
-0.949968, 1.837441, 0.01589276, 1, 0.8941177, 0, 1,
-0.9498988, -0.4098809, -1.373923, 1, 0.8980392, 0, 1,
-0.93938, 0.8644732, -2.339335, 1, 0.9058824, 0, 1,
-0.9376346, -0.8410175, -1.114151, 1, 0.9137255, 0, 1,
-0.9352722, -1.459011, -3.341121, 1, 0.9176471, 0, 1,
-0.932454, -0.2133805, -1.110092, 1, 0.9254902, 0, 1,
-0.9251761, -1.040755, -2.252184, 1, 0.9294118, 0, 1,
-0.9246861, -0.2040934, -0.4389942, 1, 0.9372549, 0, 1,
-0.9197234, 1.265535, -1.609077, 1, 0.9411765, 0, 1,
-0.8987194, -1.050683, -4.497001, 1, 0.9490196, 0, 1,
-0.8982117, 1.197245, -0.1343121, 1, 0.9529412, 0, 1,
-0.8871396, -0.2648611, -2.174553, 1, 0.9607843, 0, 1,
-0.874424, -0.6619051, -3.460295, 1, 0.9647059, 0, 1,
-0.8634935, 0.1591656, -0.6391509, 1, 0.972549, 0, 1,
-0.8540338, 1.469038, 0.3818093, 1, 0.9764706, 0, 1,
-0.8534003, -0.0470997, -2.880835, 1, 0.9843137, 0, 1,
-0.8482886, 0.4451124, -0.1000665, 1, 0.9882353, 0, 1,
-0.8459601, -0.8072789, -3.568057, 1, 0.9960784, 0, 1,
-0.8447061, -1.098335, -3.164675, 0.9960784, 1, 0, 1,
-0.8425694, 2.186611, 0.001050028, 0.9921569, 1, 0, 1,
-0.8409523, 0.9483067, -0.4301136, 0.9843137, 1, 0, 1,
-0.8403269, -0.6214767, -1.73822, 0.9803922, 1, 0, 1,
-0.8366135, 1.690871, -0.1213034, 0.972549, 1, 0, 1,
-0.836278, -0.7749378, -3.430341, 0.9686275, 1, 0, 1,
-0.8314972, 0.1715334, -1.380736, 0.9607843, 1, 0, 1,
-0.8288433, -1.286209, -2.900909, 0.9568627, 1, 0, 1,
-0.8251429, 0.05110354, -1.539038, 0.9490196, 1, 0, 1,
-0.8250172, -1.87264, -2.952382, 0.945098, 1, 0, 1,
-0.824858, 0.8870422, -2.034432, 0.9372549, 1, 0, 1,
-0.8171786, 0.560932, -1.113764, 0.9333333, 1, 0, 1,
-0.8129378, 0.02776138, -2.641242, 0.9254902, 1, 0, 1,
-0.8112361, 0.841122, -0.09000723, 0.9215686, 1, 0, 1,
-0.8081269, -0.2729384, -0.7532796, 0.9137255, 1, 0, 1,
-0.8076947, 0.8084697, -0.9483854, 0.9098039, 1, 0, 1,
-0.8047733, 0.6351709, -0.3253669, 0.9019608, 1, 0, 1,
-0.7983068, -0.5526776, -2.57725, 0.8941177, 1, 0, 1,
-0.7964697, -1.170779, -2.875897, 0.8901961, 1, 0, 1,
-0.7959714, 0.7887865, -1.426784, 0.8823529, 1, 0, 1,
-0.7945766, -0.5349856, -1.350673, 0.8784314, 1, 0, 1,
-0.7934948, -1.030675, -1.307149, 0.8705882, 1, 0, 1,
-0.7914839, -2.635204, -2.831207, 0.8666667, 1, 0, 1,
-0.7897425, -0.1063493, -3.380637, 0.8588235, 1, 0, 1,
-0.7896661, -0.5180387, -1.958345, 0.854902, 1, 0, 1,
-0.7891394, 1.535007, -0.7296283, 0.8470588, 1, 0, 1,
-0.7812663, 0.1061271, -1.722019, 0.8431373, 1, 0, 1,
-0.7774407, -1.580648, -1.666006, 0.8352941, 1, 0, 1,
-0.7686237, -0.4173704, -2.022559, 0.8313726, 1, 0, 1,
-0.7664637, -0.5844286, -0.3089561, 0.8235294, 1, 0, 1,
-0.7604825, 1.252718, 0.2776129, 0.8196079, 1, 0, 1,
-0.7601351, -1.081218, -2.633781, 0.8117647, 1, 0, 1,
-0.7524011, 0.1653169, -0.4499274, 0.8078431, 1, 0, 1,
-0.7478762, -1.092541, -3.847589, 0.8, 1, 0, 1,
-0.7435737, -0.2666751, -2.296407, 0.7921569, 1, 0, 1,
-0.7431158, -3.173018, -2.793194, 0.7882353, 1, 0, 1,
-0.7406814, 2.038653, -1.104686, 0.7803922, 1, 0, 1,
-0.7383198, 1.139744, -1.280043, 0.7764706, 1, 0, 1,
-0.735225, 0.5790024, -0.4798249, 0.7686275, 1, 0, 1,
-0.7343229, -0.7153638, -2.934288, 0.7647059, 1, 0, 1,
-0.733888, 1.418909, -1.704561, 0.7568628, 1, 0, 1,
-0.7228106, 0.8411697, -1.59281, 0.7529412, 1, 0, 1,
-0.7153259, 0.2294545, -3.29244, 0.7450981, 1, 0, 1,
-0.7137826, 0.445137, -0.8726492, 0.7411765, 1, 0, 1,
-0.7026918, -0.7216841, -3.200825, 0.7333333, 1, 0, 1,
-0.7019855, 0.9355009, -0.2035808, 0.7294118, 1, 0, 1,
-0.7015693, -1.210809, -3.317939, 0.7215686, 1, 0, 1,
-0.7014661, 0.3581811, -0.6789235, 0.7176471, 1, 0, 1,
-0.6981559, -0.7628489, -2.98243, 0.7098039, 1, 0, 1,
-0.6974767, 0.3667929, 0.3776555, 0.7058824, 1, 0, 1,
-0.6970122, -0.4791295, -4.034402, 0.6980392, 1, 0, 1,
-0.6964203, 0.08281059, -0.2958646, 0.6901961, 1, 0, 1,
-0.6897979, -0.984106, -3.411051, 0.6862745, 1, 0, 1,
-0.6882973, 0.9308516, -0.9805183, 0.6784314, 1, 0, 1,
-0.6876369, -0.7491049, -2.857939, 0.6745098, 1, 0, 1,
-0.6870874, -0.7479256, -2.615725, 0.6666667, 1, 0, 1,
-0.6824054, -0.8300524, -2.645804, 0.6627451, 1, 0, 1,
-0.6808091, -0.4150597, -4.247019, 0.654902, 1, 0, 1,
-0.6793589, -0.2166681, -2.365837, 0.6509804, 1, 0, 1,
-0.6780753, -0.6238917, -2.911007, 0.6431373, 1, 0, 1,
-0.6773358, 0.2443654, 0.05337949, 0.6392157, 1, 0, 1,
-0.6729848, -2.567544, -3.818505, 0.6313726, 1, 0, 1,
-0.6685128, 1.520113, -0.5607777, 0.627451, 1, 0, 1,
-0.6527935, 2.486347, -0.7224527, 0.6196079, 1, 0, 1,
-0.6500018, -1.468293, -4.092584, 0.6156863, 1, 0, 1,
-0.6491222, 1.577349, 0.5503478, 0.6078432, 1, 0, 1,
-0.6390432, 0.8108466, -0.3094838, 0.6039216, 1, 0, 1,
-0.6377113, -0.2483621, -3.283824, 0.5960785, 1, 0, 1,
-0.6368303, 0.1744778, 0.3584219, 0.5882353, 1, 0, 1,
-0.6354988, -0.7080603, -1.869807, 0.5843138, 1, 0, 1,
-0.626321, 0.5276458, -2.176572, 0.5764706, 1, 0, 1,
-0.6233122, 1.180583, 0.4332341, 0.572549, 1, 0, 1,
-0.6231813, 1.809968, -0.6377718, 0.5647059, 1, 0, 1,
-0.6195132, 0.07645329, 1.046891, 0.5607843, 1, 0, 1,
-0.6169974, 1.16828, -1.880728, 0.5529412, 1, 0, 1,
-0.6161444, -0.1684843, -1.983671, 0.5490196, 1, 0, 1,
-0.6138519, -0.001775743, -0.5368167, 0.5411765, 1, 0, 1,
-0.6070576, 0.9624387, 0.3701756, 0.5372549, 1, 0, 1,
-0.6030502, 0.4374923, -0.9729552, 0.5294118, 1, 0, 1,
-0.6003049, 0.7717427, -0.4747826, 0.5254902, 1, 0, 1,
-0.5985971, 1.733011, -0.2809047, 0.5176471, 1, 0, 1,
-0.5913919, 0.6136622, -1.249115, 0.5137255, 1, 0, 1,
-0.5910447, 0.1726752, -2.147259, 0.5058824, 1, 0, 1,
-0.5903932, -0.8171272, -0.8173407, 0.5019608, 1, 0, 1,
-0.5846567, -1.437557, -4.489474, 0.4941176, 1, 0, 1,
-0.5819083, -0.8738804, -2.763362, 0.4862745, 1, 0, 1,
-0.5698944, -0.7903324, -1.347993, 0.4823529, 1, 0, 1,
-0.5683318, -0.9217677, -2.484196, 0.4745098, 1, 0, 1,
-0.5644488, 1.915283, -0.2590958, 0.4705882, 1, 0, 1,
-0.5628099, 0.8677219, -1.523032, 0.4627451, 1, 0, 1,
-0.5543212, 1.160005, 0.5646757, 0.4588235, 1, 0, 1,
-0.5540566, -0.2232863, -1.613617, 0.4509804, 1, 0, 1,
-0.5519759, -0.8725359, -1.243618, 0.4470588, 1, 0, 1,
-0.5508862, -0.03044055, -1.876731, 0.4392157, 1, 0, 1,
-0.5500333, -0.7477746, -3.574884, 0.4352941, 1, 0, 1,
-0.5497333, -1.609613, -1.559489, 0.427451, 1, 0, 1,
-0.5486484, -1.996703, -5.038209, 0.4235294, 1, 0, 1,
-0.5476254, -1.141941, -2.586416, 0.4156863, 1, 0, 1,
-0.5448151, -0.7839758, -3.121128, 0.4117647, 1, 0, 1,
-0.5419149, 0.6994658, -1.569619, 0.4039216, 1, 0, 1,
-0.5406975, -0.2741719, -1.7934, 0.3960784, 1, 0, 1,
-0.5367282, -1.253529, -4.81848, 0.3921569, 1, 0, 1,
-0.5353574, 0.2740092, -2.244017, 0.3843137, 1, 0, 1,
-0.5286828, 1.334714, -0.2875188, 0.3803922, 1, 0, 1,
-0.5250758, -0.6278452, -2.119934, 0.372549, 1, 0, 1,
-0.5232889, 0.5253895, -0.4528861, 0.3686275, 1, 0, 1,
-0.522395, -0.01195425, -0.3743298, 0.3607843, 1, 0, 1,
-0.5113484, -1.277168, -3.37458, 0.3568628, 1, 0, 1,
-0.5090039, -0.5186164, -3.560464, 0.3490196, 1, 0, 1,
-0.508912, -0.1791562, -4.103933, 0.345098, 1, 0, 1,
-0.5021289, 0.9521254, 0.1726254, 0.3372549, 1, 0, 1,
-0.4982998, 0.324679, -0.9723105, 0.3333333, 1, 0, 1,
-0.4967158, 0.8063349, -0.9470996, 0.3254902, 1, 0, 1,
-0.4925868, -1.159365, -2.937467, 0.3215686, 1, 0, 1,
-0.488113, 0.255522, -1.655264, 0.3137255, 1, 0, 1,
-0.4841611, -0.3412846, 0.2350402, 0.3098039, 1, 0, 1,
-0.4815857, 0.1350226, -2.162256, 0.3019608, 1, 0, 1,
-0.4780779, 1.340517, -0.3061757, 0.2941177, 1, 0, 1,
-0.4770054, 0.067338, -1.496654, 0.2901961, 1, 0, 1,
-0.4741331, 0.3331964, 0.7752748, 0.282353, 1, 0, 1,
-0.471768, 0.08111704, -1.666128, 0.2784314, 1, 0, 1,
-0.4714626, -0.003601463, -2.280044, 0.2705882, 1, 0, 1,
-0.4682981, 0.7916534, -0.8338882, 0.2666667, 1, 0, 1,
-0.4643885, -0.6006154, -0.8185652, 0.2588235, 1, 0, 1,
-0.4630935, -0.8735768, -1.099046, 0.254902, 1, 0, 1,
-0.4586283, 0.4508457, 0.1190558, 0.2470588, 1, 0, 1,
-0.4573515, -2.787951, -3.966312, 0.2431373, 1, 0, 1,
-0.4547082, 0.7466509, -0.5067855, 0.2352941, 1, 0, 1,
-0.4511168, -1.791624, -0.9984072, 0.2313726, 1, 0, 1,
-0.4485413, 1.951062, -1.237403, 0.2235294, 1, 0, 1,
-0.4456766, -0.7699787, -2.480799, 0.2196078, 1, 0, 1,
-0.4441788, -0.5004358, -0.9860945, 0.2117647, 1, 0, 1,
-0.442838, -0.8795725, -3.588743, 0.2078431, 1, 0, 1,
-0.4419326, 0.2220662, -2.952512, 0.2, 1, 0, 1,
-0.441917, -0.1103987, -3.02104, 0.1921569, 1, 0, 1,
-0.4415479, 0.8218893, 0.1840882, 0.1882353, 1, 0, 1,
-0.441191, -2.039169, -3.506883, 0.1803922, 1, 0, 1,
-0.4393943, -0.3176715, -4.084977, 0.1764706, 1, 0, 1,
-0.4389865, 1.311765, 1.899576, 0.1686275, 1, 0, 1,
-0.4373312, -0.9977756, -2.605683, 0.1647059, 1, 0, 1,
-0.4289184, -0.4398734, -2.143844, 0.1568628, 1, 0, 1,
-0.4270743, 1.080349, -0.9572, 0.1529412, 1, 0, 1,
-0.4267646, -1.664027, -1.980634, 0.145098, 1, 0, 1,
-0.4267528, 0.3848077, -1.48194, 0.1411765, 1, 0, 1,
-0.4256855, -0.2648514, -1.316, 0.1333333, 1, 0, 1,
-0.4253886, -2.561319, -2.55863, 0.1294118, 1, 0, 1,
-0.4192055, -1.87377, -3.307739, 0.1215686, 1, 0, 1,
-0.4183169, 0.1975468, -1.180227, 0.1176471, 1, 0, 1,
-0.4125496, 1.324595, -0.822759, 0.1098039, 1, 0, 1,
-0.4087482, -0.1153463, -2.801212, 0.1058824, 1, 0, 1,
-0.4006943, 0.7112112, -0.5863432, 0.09803922, 1, 0, 1,
-0.4000471, -2.071675, -2.188383, 0.09019608, 1, 0, 1,
-0.3961166, 0.5096141, -2.373681, 0.08627451, 1, 0, 1,
-0.3920937, 0.398995, -1.298159, 0.07843138, 1, 0, 1,
-0.3908367, 1.630852, -1.793794, 0.07450981, 1, 0, 1,
-0.3881935, -0.2180672, -1.758897, 0.06666667, 1, 0, 1,
-0.3820038, -0.6214952, -3.530155, 0.0627451, 1, 0, 1,
-0.3789823, -1.068613, -2.424571, 0.05490196, 1, 0, 1,
-0.3749936, -0.6949268, -2.59443, 0.05098039, 1, 0, 1,
-0.3749361, -2.125765, -2.122969, 0.04313726, 1, 0, 1,
-0.37349, 1.007666, -0.1495604, 0.03921569, 1, 0, 1,
-0.3708377, 0.9585084, 0.4914065, 0.03137255, 1, 0, 1,
-0.3628959, 0.5896696, -0.8173074, 0.02745098, 1, 0, 1,
-0.3597273, -0.1797982, -0.7045708, 0.01960784, 1, 0, 1,
-0.3587316, -1.15132, -3.8488, 0.01568628, 1, 0, 1,
-0.3572733, 0.329934, 0.5637733, 0.007843138, 1, 0, 1,
-0.3511763, -0.8754244, -2.001944, 0.003921569, 1, 0, 1,
-0.3506214, 0.6735052, -1.700232, 0, 1, 0.003921569, 1,
-0.3474983, 1.156697, -0.5980645, 0, 1, 0.01176471, 1,
-0.3427459, -0.3480853, -3.312607, 0, 1, 0.01568628, 1,
-0.3414228, -0.3352322, -1.489626, 0, 1, 0.02352941, 1,
-0.3368739, -0.1912089, -3.34478, 0, 1, 0.02745098, 1,
-0.3363563, -1.001525, -2.436984, 0, 1, 0.03529412, 1,
-0.333795, -0.08703861, -1.978775, 0, 1, 0.03921569, 1,
-0.3301118, -0.1135907, -1.884113, 0, 1, 0.04705882, 1,
-0.3300797, -1.102798, -2.035659, 0, 1, 0.05098039, 1,
-0.3263164, -0.00778843, -2.521147, 0, 1, 0.05882353, 1,
-0.3254135, -0.5876901, -2.833126, 0, 1, 0.0627451, 1,
-0.3176626, 0.8803756, -1.351171, 0, 1, 0.07058824, 1,
-0.3084267, 2.069251, -0.6956804, 0, 1, 0.07450981, 1,
-0.3039983, 0.2416233, -1.337471, 0, 1, 0.08235294, 1,
-0.3017503, -0.9299925, -2.827397, 0, 1, 0.08627451, 1,
-0.2983694, 0.2899552, -0.2402708, 0, 1, 0.09411765, 1,
-0.2981348, 0.2265821, -2.102693, 0, 1, 0.1019608, 1,
-0.2940046, 0.9340889, 0.3866341, 0, 1, 0.1058824, 1,
-0.2938134, 0.1315152, -1.506533, 0, 1, 0.1137255, 1,
-0.292987, 3.108243, 0.2056635, 0, 1, 0.1176471, 1,
-0.2872976, 0.9639936, 0.7849932, 0, 1, 0.1254902, 1,
-0.2833459, 0.5745097, -1.463982, 0, 1, 0.1294118, 1,
-0.281344, 0.8728866, -2.091388, 0, 1, 0.1372549, 1,
-0.2786218, -1.187246, -2.752362, 0, 1, 0.1411765, 1,
-0.2761637, 0.01886897, -0.5385594, 0, 1, 0.1490196, 1,
-0.2746427, -0.1149297, -3.126226, 0, 1, 0.1529412, 1,
-0.2742046, 0.1092732, -0.990554, 0, 1, 0.1607843, 1,
-0.2663063, 0.6703874, -0.2558566, 0, 1, 0.1647059, 1,
-0.2661732, -0.02259939, -0.6982392, 0, 1, 0.172549, 1,
-0.26438, 1.662962, -0.4328499, 0, 1, 0.1764706, 1,
-0.2636708, -1.501211, -1.338033, 0, 1, 0.1843137, 1,
-0.248393, -2.526201, -3.0317, 0, 1, 0.1882353, 1,
-0.2455538, -1.115271, -2.240713, 0, 1, 0.1960784, 1,
-0.2412585, -0.3316434, -1.394586, 0, 1, 0.2039216, 1,
-0.23958, -0.2546557, -1.823628, 0, 1, 0.2078431, 1,
-0.2371116, -1.32885, -3.625046, 0, 1, 0.2156863, 1,
-0.2358497, 0.2005691, -0.8238494, 0, 1, 0.2196078, 1,
-0.2332069, -1.373692, -1.16896, 0, 1, 0.227451, 1,
-0.2329279, 1.608803, 0.6595685, 0, 1, 0.2313726, 1,
-0.2324537, -0.2276785, -4.623283, 0, 1, 0.2392157, 1,
-0.226888, 0.5183017, 1.235343, 0, 1, 0.2431373, 1,
-0.225856, -0.6180118, -2.795894, 0, 1, 0.2509804, 1,
-0.2186638, -1.859172, -4.408291, 0, 1, 0.254902, 1,
-0.2155475, 1.125317, 0.3099623, 0, 1, 0.2627451, 1,
-0.2141766, -0.7189537, -2.896663, 0, 1, 0.2666667, 1,
-0.2119829, 0.4579326, -0.6183333, 0, 1, 0.2745098, 1,
-0.2115638, -0.7550942, -2.769018, 0, 1, 0.2784314, 1,
-0.2074381, -0.8315151, -3.184443, 0, 1, 0.2862745, 1,
-0.2060315, 1.77166, -1.268478, 0, 1, 0.2901961, 1,
-0.2005728, -0.1406861, -3.080737, 0, 1, 0.2980392, 1,
-0.2001812, -0.9237933, -3.055798, 0, 1, 0.3058824, 1,
-0.1990765, -0.0004890205, -1.01369, 0, 1, 0.3098039, 1,
-0.194053, -0.1657422, -2.74199, 0, 1, 0.3176471, 1,
-0.1888741, -0.119085, -2.463198, 0, 1, 0.3215686, 1,
-0.1880702, -0.2767732, -2.515696, 0, 1, 0.3294118, 1,
-0.1864885, 1.205285, 0.7465951, 0, 1, 0.3333333, 1,
-0.1838232, 1.332587, 0.617345, 0, 1, 0.3411765, 1,
-0.1723459, 0.7862556, -0.3100303, 0, 1, 0.345098, 1,
-0.1700675, -0.1456156, -2.393152, 0, 1, 0.3529412, 1,
-0.163677, 0.01597283, -2.024469, 0, 1, 0.3568628, 1,
-0.1635549, 1.984778, 0.9391673, 0, 1, 0.3647059, 1,
-0.1633845, 0.8882341, -0.6109119, 0, 1, 0.3686275, 1,
-0.1592872, 0.6956339, -0.5963681, 0, 1, 0.3764706, 1,
-0.1544349, 0.673866, 0.4347292, 0, 1, 0.3803922, 1,
-0.1468553, 1.098413, 1.709178, 0, 1, 0.3882353, 1,
-0.1466824, 0.5844656, -0.7695876, 0, 1, 0.3921569, 1,
-0.1454813, -0.06935314, -1.988016, 0, 1, 0.4, 1,
-0.1451873, 0.2751429, -0.9589251, 0, 1, 0.4078431, 1,
-0.1437407, 0.4758102, 0.06959127, 0, 1, 0.4117647, 1,
-0.1374862, 1.714194, 0.3241686, 0, 1, 0.4196078, 1,
-0.1328591, -0.2402925, -1.713321, 0, 1, 0.4235294, 1,
-0.1292153, 0.9788207, -0.3570234, 0, 1, 0.4313726, 1,
-0.1263088, 0.6289217, -0.511695, 0, 1, 0.4352941, 1,
-0.1248521, 1.562075, 1.406775, 0, 1, 0.4431373, 1,
-0.1247616, 0.1755599, -1.516057, 0, 1, 0.4470588, 1,
-0.1223932, -0.3050875, -3.498393, 0, 1, 0.454902, 1,
-0.1212404, 0.7616501, -0.6475723, 0, 1, 0.4588235, 1,
-0.1207385, -0.5324481, -0.7323405, 0, 1, 0.4666667, 1,
-0.1194194, -0.7676545, -2.486164, 0, 1, 0.4705882, 1,
-0.1181842, 0.6732054, 0.5274664, 0, 1, 0.4784314, 1,
-0.1178307, 1.307967, -1.79936, 0, 1, 0.4823529, 1,
-0.1156508, -1.593684, -4.001574, 0, 1, 0.4901961, 1,
-0.1086382, -0.6051363, -1.669281, 0, 1, 0.4941176, 1,
-0.1085024, -0.758653, -4.482392, 0, 1, 0.5019608, 1,
-0.1075958, 0.8363491, 0.01294265, 0, 1, 0.509804, 1,
-0.1049129, -1.111377, -2.59474, 0, 1, 0.5137255, 1,
-0.102759, -1.175613, -5.296972, 0, 1, 0.5215687, 1,
-0.1014986, 0.325182, 0.4005845, 0, 1, 0.5254902, 1,
-0.09602975, 0.5822956, 0.4700586, 0, 1, 0.5333334, 1,
-0.09415101, -0.3460495, -2.921315, 0, 1, 0.5372549, 1,
-0.09236109, -0.7412459, -2.438922, 0, 1, 0.5450981, 1,
-0.08932155, -0.3779572, -1.953365, 0, 1, 0.5490196, 1,
-0.08727857, 1.017452, 0.7361294, 0, 1, 0.5568628, 1,
-0.08484839, 0.01359387, -1.326986, 0, 1, 0.5607843, 1,
-0.08374295, -0.3802719, -1.424682, 0, 1, 0.5686275, 1,
-0.08224013, -0.8155329, -3.360601, 0, 1, 0.572549, 1,
-0.07917857, 0.2235934, -1.644102, 0, 1, 0.5803922, 1,
-0.0782012, -1.796419, -3.225182, 0, 1, 0.5843138, 1,
-0.07793264, 1.287918, -0.1338545, 0, 1, 0.5921569, 1,
-0.07563093, -1.104195, -2.095732, 0, 1, 0.5960785, 1,
-0.07544886, -0.8346008, -2.672786, 0, 1, 0.6039216, 1,
-0.07406647, 1.154645, 0.08443049, 0, 1, 0.6117647, 1,
-0.07090589, 0.236552, 0.5418388, 0, 1, 0.6156863, 1,
-0.07074566, 0.1160668, -0.6402782, 0, 1, 0.6235294, 1,
-0.07028943, 0.8996582, -0.186893, 0, 1, 0.627451, 1,
-0.06688084, -0.5395472, -2.48935, 0, 1, 0.6352941, 1,
-0.06191529, 0.8028634, 0.3365366, 0, 1, 0.6392157, 1,
-0.05853187, 0.06325632, 0.4483374, 0, 1, 0.6470588, 1,
-0.05702048, -1.103465, -3.916213, 0, 1, 0.6509804, 1,
-0.05686327, -0.3184215, -3.103069, 0, 1, 0.6588235, 1,
-0.05495847, 2.256595, 2.016464, 0, 1, 0.6627451, 1,
-0.05440264, -0.3664387, -4.556608, 0, 1, 0.6705883, 1,
-0.05171189, -0.6823817, -4.506041, 0, 1, 0.6745098, 1,
-0.05168061, 1.32428, 1.117858, 0, 1, 0.682353, 1,
-0.04847194, -0.09462827, -3.465783, 0, 1, 0.6862745, 1,
-0.04762334, 1.849156, 1.015878, 0, 1, 0.6941177, 1,
-0.0403787, 0.6117365, 0.302137, 0, 1, 0.7019608, 1,
-0.03950515, -0.7664644, -4.438348, 0, 1, 0.7058824, 1,
-0.03892389, -0.4666806, -2.329518, 0, 1, 0.7137255, 1,
-0.03042267, -0.4323913, -1.7982, 0, 1, 0.7176471, 1,
-0.02812071, -2.048014, -2.836325, 0, 1, 0.7254902, 1,
-0.02675784, -0.793893, -3.776821, 0, 1, 0.7294118, 1,
-0.02657593, 1.286145, -0.4687605, 0, 1, 0.7372549, 1,
-0.02643795, 0.8018492, -1.107668, 0, 1, 0.7411765, 1,
-0.02592178, 0.3945679, 0.155835, 0, 1, 0.7490196, 1,
-0.0235564, 1.186111, 0.363723, 0, 1, 0.7529412, 1,
-0.01935328, 0.314484, -0.6249792, 0, 1, 0.7607843, 1,
-0.01797564, -1.001855, -3.675019, 0, 1, 0.7647059, 1,
-0.01636152, 0.1926126, 0.3707319, 0, 1, 0.772549, 1,
-0.01276366, -0.7504207, -0.8795887, 0, 1, 0.7764706, 1,
-0.01148502, -1.09594, -5.257523, 0, 1, 0.7843137, 1,
-0.01049346, 0.6338956, 0.4156364, 0, 1, 0.7882353, 1,
-0.01005333, 2.183518, 1.110122, 0, 1, 0.7960784, 1,
-0.009009488, -0.6130984, -4.485134, 0, 1, 0.8039216, 1,
-0.004565019, 1.337959, 0.7982955, 0, 1, 0.8078431, 1,
0.0002537577, -1.017801, 3.48826, 0, 1, 0.8156863, 1,
0.002010169, 0.4130054, -0.1653762, 0, 1, 0.8196079, 1,
0.003556176, 0.4768125, -1.031494, 0, 1, 0.827451, 1,
0.005746732, 0.7597265, 1.285801, 0, 1, 0.8313726, 1,
0.006923673, 1.014277, -0.3544325, 0, 1, 0.8392157, 1,
0.00715409, -0.3455408, 3.51875, 0, 1, 0.8431373, 1,
0.01094124, 0.9037051, -0.05358551, 0, 1, 0.8509804, 1,
0.011822, 0.757594, -0.6845907, 0, 1, 0.854902, 1,
0.01424875, 1.823366, 0.4259406, 0, 1, 0.8627451, 1,
0.01540589, 1.419104, -1.539055, 0, 1, 0.8666667, 1,
0.03242211, 0.6010199, -0.1500097, 0, 1, 0.8745098, 1,
0.03258603, 0.5367872, 0.3170775, 0, 1, 0.8784314, 1,
0.03542849, -1.567986, 3.015928, 0, 1, 0.8862745, 1,
0.03748356, -0.3015547, 4.367719, 0, 1, 0.8901961, 1,
0.04354814, -1.177531, 2.871877, 0, 1, 0.8980392, 1,
0.04678189, -1.030516, 1.23095, 0, 1, 0.9058824, 1,
0.04819778, 1.281483, 0.7310526, 0, 1, 0.9098039, 1,
0.05436384, -1.742801, 5.120519, 0, 1, 0.9176471, 1,
0.05498527, 0.9552715, -0.8684891, 0, 1, 0.9215686, 1,
0.05623684, 1.77263, 1.70823, 0, 1, 0.9294118, 1,
0.05741374, 0.2026896, 0.867152, 0, 1, 0.9333333, 1,
0.0593528, -0.7223613, 4.575773, 0, 1, 0.9411765, 1,
0.05938185, 0.7979224, -0.4439104, 0, 1, 0.945098, 1,
0.06249505, -0.0784884, 2.678338, 0, 1, 0.9529412, 1,
0.06423241, -0.4700455, 1.910434, 0, 1, 0.9568627, 1,
0.0655597, 1.83971, -0.3420542, 0, 1, 0.9647059, 1,
0.06583792, -0.6005867, 1.363174, 0, 1, 0.9686275, 1,
0.0662815, 0.316398, 1.075897, 0, 1, 0.9764706, 1,
0.06841499, 0.5979134, -0.9030421, 0, 1, 0.9803922, 1,
0.07164096, -1.053387, 2.435294, 0, 1, 0.9882353, 1,
0.07381156, 0.1677273, 0.5321808, 0, 1, 0.9921569, 1,
0.07685725, 0.9939706, 1.120078, 0, 1, 1, 1,
0.08177704, 0.895902, -0.1265525, 0, 0.9921569, 1, 1,
0.0895061, -1.352036, 4.875693, 0, 0.9882353, 1, 1,
0.08976106, -0.4545824, 4.944177, 0, 0.9803922, 1, 1,
0.0984391, -0.3433661, 2.738325, 0, 0.9764706, 1, 1,
0.09852435, 0.1807189, 0.4643025, 0, 0.9686275, 1, 1,
0.09887652, 1.193885, 2.213507, 0, 0.9647059, 1, 1,
0.1009754, 1.158834, 0.1809769, 0, 0.9568627, 1, 1,
0.1037112, -0.9543798, 1.996783, 0, 0.9529412, 1, 1,
0.103935, 0.03275671, 2.389007, 0, 0.945098, 1, 1,
0.1068273, 1.479833, -0.9453853, 0, 0.9411765, 1, 1,
0.1088286, -0.2384544, 2.826345, 0, 0.9333333, 1, 1,
0.1121703, -0.7200309, 1.443428, 0, 0.9294118, 1, 1,
0.1137691, 1.075851, 0.8526326, 0, 0.9215686, 1, 1,
0.1142013, 1.551951, 0.5028653, 0, 0.9176471, 1, 1,
0.1150258, -1.897518, 4.46279, 0, 0.9098039, 1, 1,
0.1232254, -0.4205574, 2.168814, 0, 0.9058824, 1, 1,
0.1238118, -0.8649983, 1.219156, 0, 0.8980392, 1, 1,
0.1238446, -0.629666, 4.148731, 0, 0.8901961, 1, 1,
0.1247865, 0.4432659, 0.9289671, 0, 0.8862745, 1, 1,
0.1258416, -0.2418843, 1.793568, 0, 0.8784314, 1, 1,
0.126015, -0.1658759, 2.50282, 0, 0.8745098, 1, 1,
0.1309677, 0.1766718, 3.465442, 0, 0.8666667, 1, 1,
0.1366123, -0.8731552, 4.063144, 0, 0.8627451, 1, 1,
0.138466, 0.8759593, -0.8640127, 0, 0.854902, 1, 1,
0.142725, 0.2332831, 2.013372, 0, 0.8509804, 1, 1,
0.1428328, -0.9584716, 5.558338, 0, 0.8431373, 1, 1,
0.1431333, 0.8209462, -0.8002492, 0, 0.8392157, 1, 1,
0.1457348, 0.3398609, 1.246339, 0, 0.8313726, 1, 1,
0.1514472, -1.621109, 2.146258, 0, 0.827451, 1, 1,
0.1612416, 0.3926728, -0.203094, 0, 0.8196079, 1, 1,
0.1612528, 0.5400404, -0.4172112, 0, 0.8156863, 1, 1,
0.1614981, -0.7824206, 2.297543, 0, 0.8078431, 1, 1,
0.163733, -3.199939, 4.960733, 0, 0.8039216, 1, 1,
0.1643293, 1.700207, 0.7777337, 0, 0.7960784, 1, 1,
0.1645722, -0.3509775, 3.053261, 0, 0.7882353, 1, 1,
0.1651514, 1.030161, 0.8620173, 0, 0.7843137, 1, 1,
0.1652971, 0.2307768, 0.3146744, 0, 0.7764706, 1, 1,
0.1660832, -0.1360232, 2.715669, 0, 0.772549, 1, 1,
0.1664019, 1.408563, -0.4504675, 0, 0.7647059, 1, 1,
0.1671172, 0.2957515, 1.689785, 0, 0.7607843, 1, 1,
0.1680946, -0.6214316, 2.351838, 0, 0.7529412, 1, 1,
0.1681458, 1.79782, -0.9025978, 0, 0.7490196, 1, 1,
0.1706582, 0.2160103, 1.723642, 0, 0.7411765, 1, 1,
0.1777957, 0.2610846, -0.05549575, 0, 0.7372549, 1, 1,
0.1792147, -0.6519253, 1.629879, 0, 0.7294118, 1, 1,
0.181222, -0.03166587, 0.8346702, 0, 0.7254902, 1, 1,
0.1817967, 2.143954, -1.233039, 0, 0.7176471, 1, 1,
0.1825164, 0.4930047, 1.430256, 0, 0.7137255, 1, 1,
0.1848245, 0.08782333, 2.610832, 0, 0.7058824, 1, 1,
0.1877253, 1.788837, 1.215234, 0, 0.6980392, 1, 1,
0.188587, -1.498236, 2.64589, 0, 0.6941177, 1, 1,
0.1922917, -1.214752, 3.187924, 0, 0.6862745, 1, 1,
0.2033899, -2.031411, 3.577943, 0, 0.682353, 1, 1,
0.2037581, 0.7312623, 0.1284618, 0, 0.6745098, 1, 1,
0.2072947, 0.9026398, -1.08031, 0, 0.6705883, 1, 1,
0.2073305, -0.7238914, 1.503676, 0, 0.6627451, 1, 1,
0.2077218, -1.325205, 3.439474, 0, 0.6588235, 1, 1,
0.2100798, -0.06866131, 2.380465, 0, 0.6509804, 1, 1,
0.2108316, 0.2824508, 1.381661, 0, 0.6470588, 1, 1,
0.212421, 0.2831689, 0.6815807, 0, 0.6392157, 1, 1,
0.2141271, -0.755626, 2.42312, 0, 0.6352941, 1, 1,
0.2148396, 0.7781295, -0.7699501, 0, 0.627451, 1, 1,
0.2168351, -0.4104939, 3.881361, 0, 0.6235294, 1, 1,
0.2184612, -0.155593, 2.727703, 0, 0.6156863, 1, 1,
0.225559, -0.7938501, 2.676721, 0, 0.6117647, 1, 1,
0.2255607, -0.2291078, 2.152147, 0, 0.6039216, 1, 1,
0.228972, 0.5151756, -1.606513, 0, 0.5960785, 1, 1,
0.2305319, 1.393815, 0.4376051, 0, 0.5921569, 1, 1,
0.2374648, 0.3061611, 1.010546, 0, 0.5843138, 1, 1,
0.2375454, 0.5722328, -0.6200546, 0, 0.5803922, 1, 1,
0.2381593, -0.1751494, 2.532027, 0, 0.572549, 1, 1,
0.2445534, -0.40387, 2.284655, 0, 0.5686275, 1, 1,
0.2473277, -0.1449129, 1.71034, 0, 0.5607843, 1, 1,
0.2477559, -0.3708671, 4.235376, 0, 0.5568628, 1, 1,
0.2482367, -1.022528, 2.868256, 0, 0.5490196, 1, 1,
0.250717, -3.207891, 3.331151, 0, 0.5450981, 1, 1,
0.2616087, 0.3009112, 0.8873695, 0, 0.5372549, 1, 1,
0.2621861, -0.284041, 3.578087, 0, 0.5333334, 1, 1,
0.2654501, 0.1837861, 1.630877, 0, 0.5254902, 1, 1,
0.2660422, -0.9492754, 3.267273, 0, 0.5215687, 1, 1,
0.2661775, 0.1268532, 2.212937, 0, 0.5137255, 1, 1,
0.2680554, -0.1863407, 1.200955, 0, 0.509804, 1, 1,
0.2704691, 0.3612739, 0.2655758, 0, 0.5019608, 1, 1,
0.2723351, 1.528254, 0.1811575, 0, 0.4941176, 1, 1,
0.2755435, -0.6313441, 3.429686, 0, 0.4901961, 1, 1,
0.27828, 0.8370928, 2.899024, 0, 0.4823529, 1, 1,
0.2801959, -0.3831388, 2.496792, 0, 0.4784314, 1, 1,
0.2854254, -0.03755785, 2.033782, 0, 0.4705882, 1, 1,
0.2912485, -0.2449241, 1.643645, 0, 0.4666667, 1, 1,
0.2913636, -0.8973973, 3.222134, 0, 0.4588235, 1, 1,
0.2926257, -0.1763442, 1.70082, 0, 0.454902, 1, 1,
0.2955629, -0.3688468, 1.451826, 0, 0.4470588, 1, 1,
0.2961578, 0.4358813, -0.008449322, 0, 0.4431373, 1, 1,
0.2977696, -1.023082, 3.771127, 0, 0.4352941, 1, 1,
0.2979834, 0.04878174, 0.6415555, 0, 0.4313726, 1, 1,
0.3003291, -0.4662105, 1.482741, 0, 0.4235294, 1, 1,
0.3023017, 0.1859784, 0.8056281, 0, 0.4196078, 1, 1,
0.3073484, 0.1953478, 0.6915646, 0, 0.4117647, 1, 1,
0.3163607, -0.3381402, 1.539797, 0, 0.4078431, 1, 1,
0.3186474, -0.9700127, 3.266233, 0, 0.4, 1, 1,
0.3216186, 1.561499, -1.393634, 0, 0.3921569, 1, 1,
0.3219715, -0.135786, 2.018514, 0, 0.3882353, 1, 1,
0.3227065, 1.068434, 1.888251, 0, 0.3803922, 1, 1,
0.3294938, 0.3160608, 3.008868, 0, 0.3764706, 1, 1,
0.3303109, -0.7906554, 3.109701, 0, 0.3686275, 1, 1,
0.3334976, -0.08391769, 3.166919, 0, 0.3647059, 1, 1,
0.334671, 1.070805, 0.8819491, 0, 0.3568628, 1, 1,
0.3356457, 0.1512082, 0.3725629, 0, 0.3529412, 1, 1,
0.3365189, 0.4824792, 0.5453848, 0, 0.345098, 1, 1,
0.3385662, 0.8123997, 0.4444583, 0, 0.3411765, 1, 1,
0.339248, -0.5893408, 3.577822, 0, 0.3333333, 1, 1,
0.3401123, 0.7269963, -0.4836479, 0, 0.3294118, 1, 1,
0.3401863, 1.639362, 0.06205952, 0, 0.3215686, 1, 1,
0.3535672, -2.445895, 2.779974, 0, 0.3176471, 1, 1,
0.3608532, 0.04213858, -0.1578704, 0, 0.3098039, 1, 1,
0.3623382, 0.07884572, 1.933793, 0, 0.3058824, 1, 1,
0.3633012, -0.0900567, 1.688215, 0, 0.2980392, 1, 1,
0.3652625, -0.0003762992, 1.51956, 0, 0.2901961, 1, 1,
0.3720622, -0.5648591, 3.740383, 0, 0.2862745, 1, 1,
0.3754728, 1.528654, -0.4957251, 0, 0.2784314, 1, 1,
0.3821788, -1.435993, 2.144219, 0, 0.2745098, 1, 1,
0.3833006, 1.729507, 0.9542969, 0, 0.2666667, 1, 1,
0.3848375, 0.4544997, 0.841473, 0, 0.2627451, 1, 1,
0.3858878, -1.26299, 3.082845, 0, 0.254902, 1, 1,
0.3869955, 0.8664849, 0.7096752, 0, 0.2509804, 1, 1,
0.3871354, -0.854948, 2.719297, 0, 0.2431373, 1, 1,
0.3876531, 0.2372405, 2.147774, 0, 0.2392157, 1, 1,
0.390744, 1.001365, -0.3286239, 0, 0.2313726, 1, 1,
0.3945678, -0.6526029, 2.425307, 0, 0.227451, 1, 1,
0.3981471, 0.3282965, 1.27344, 0, 0.2196078, 1, 1,
0.4004585, 1.436273, 0.0574184, 0, 0.2156863, 1, 1,
0.4007718, 1.704342, 0.05494972, 0, 0.2078431, 1, 1,
0.400849, 0.1495742, 1.302186, 0, 0.2039216, 1, 1,
0.4056484, -1.411156, 3.343449, 0, 0.1960784, 1, 1,
0.4073875, -1.021387, 3.209305, 0, 0.1882353, 1, 1,
0.4151871, -1.657256, 3.914006, 0, 0.1843137, 1, 1,
0.4180695, 1.692523, 1.045191, 0, 0.1764706, 1, 1,
0.4241005, 0.5126374, 1.604917, 0, 0.172549, 1, 1,
0.4272101, -0.9262289, 2.67554, 0, 0.1647059, 1, 1,
0.4304947, -0.832158, 3.076937, 0, 0.1607843, 1, 1,
0.432075, -1.143776, 2.346122, 0, 0.1529412, 1, 1,
0.4331425, -0.4048905, 3.684752, 0, 0.1490196, 1, 1,
0.4368657, 1.170505, -0.3485375, 0, 0.1411765, 1, 1,
0.4377015, -1.863257, 4.565492, 0, 0.1372549, 1, 1,
0.4395378, 0.4094324, 1.77942, 0, 0.1294118, 1, 1,
0.4400406, 0.6825436, 1.349478, 0, 0.1254902, 1, 1,
0.4432739, 0.7386505, 0.8900194, 0, 0.1176471, 1, 1,
0.4466875, -0.4343935, 4.898441, 0, 0.1137255, 1, 1,
0.4482578, -0.2022779, 2.944168, 0, 0.1058824, 1, 1,
0.4513457, 0.8691, 1.623429, 0, 0.09803922, 1, 1,
0.4536504, -0.9013884, 1.048016, 0, 0.09411765, 1, 1,
0.45905, -0.4897093, 2.521877, 0, 0.08627451, 1, 1,
0.4600222, 1.085679, 2.223195, 0, 0.08235294, 1, 1,
0.4609653, 0.03016994, 2.657678, 0, 0.07450981, 1, 1,
0.4611888, 0.59009, 1.342016, 0, 0.07058824, 1, 1,
0.4644714, -0.1928426, 2.845341, 0, 0.0627451, 1, 1,
0.4671867, -0.193527, 2.216098, 0, 0.05882353, 1, 1,
0.4689671, 1.560024, 0.3800405, 0, 0.05098039, 1, 1,
0.4701757, -1.977346, 3.783341, 0, 0.04705882, 1, 1,
0.4761367, -2.351286, 2.842675, 0, 0.03921569, 1, 1,
0.4796563, -0.113553, 2.552284, 0, 0.03529412, 1, 1,
0.4820738, -0.3825796, 2.91351, 0, 0.02745098, 1, 1,
0.4910012, 0.01968994, 1.628261, 0, 0.02352941, 1, 1,
0.4942629, -0.1235218, 1.108951, 0, 0.01568628, 1, 1,
0.5068994, 2.446535, 1.724541, 0, 0.01176471, 1, 1,
0.5069072, -1.166865, 1.54208, 0, 0.003921569, 1, 1,
0.5080687, -0.5589595, 2.888539, 0.003921569, 0, 1, 1,
0.5090492, -0.4067542, 1.930684, 0.007843138, 0, 1, 1,
0.5115728, -0.005715745, 1.730494, 0.01568628, 0, 1, 1,
0.5130309, -1.797135, 2.146667, 0.01960784, 0, 1, 1,
0.5197462, -0.320459, 3.005772, 0.02745098, 0, 1, 1,
0.5201088, -0.1987347, -0.08010656, 0.03137255, 0, 1, 1,
0.5246289, 0.9943143, -1.036685, 0.03921569, 0, 1, 1,
0.5263882, 0.8603536, -0.3700156, 0.04313726, 0, 1, 1,
0.5277568, -1.385999, 3.53421, 0.05098039, 0, 1, 1,
0.5287173, -0.3598422, 1.238259, 0.05490196, 0, 1, 1,
0.5362787, 0.319093, 1.54285, 0.0627451, 0, 1, 1,
0.5411638, -0.6920349, 2.201962, 0.06666667, 0, 1, 1,
0.5434466, 0.4161772, -0.05622331, 0.07450981, 0, 1, 1,
0.543753, 0.7104709, 1.308454, 0.07843138, 0, 1, 1,
0.5471719, -2.414214, 0.8558062, 0.08627451, 0, 1, 1,
0.5479898, 0.1406878, 0.975164, 0.09019608, 0, 1, 1,
0.5481387, -0.03221893, 1.879366, 0.09803922, 0, 1, 1,
0.5485687, 1.15127, -0.07789763, 0.1058824, 0, 1, 1,
0.5497909, -0.02878691, 3.142603, 0.1098039, 0, 1, 1,
0.5504925, 1.610923, -0.4324972, 0.1176471, 0, 1, 1,
0.551157, 0.1188696, 2.16536, 0.1215686, 0, 1, 1,
0.5519519, -2.2848, 2.229772, 0.1294118, 0, 1, 1,
0.5579297, 1.076931, -1.060834, 0.1333333, 0, 1, 1,
0.5579361, 0.8054138, -0.4052149, 0.1411765, 0, 1, 1,
0.5585239, -1.375004, 2.437428, 0.145098, 0, 1, 1,
0.5633866, -0.3144342, 3.065767, 0.1529412, 0, 1, 1,
0.5665798, 0.7013761, 3.103848, 0.1568628, 0, 1, 1,
0.5690054, -0.01389148, 3.104458, 0.1647059, 0, 1, 1,
0.5713487, -0.913498, 3.932859, 0.1686275, 0, 1, 1,
0.5741053, -0.5440605, 3.318022, 0.1764706, 0, 1, 1,
0.5767734, 1.331088, 1.131839, 0.1803922, 0, 1, 1,
0.5776581, 0.5479951, 0.3864789, 0.1882353, 0, 1, 1,
0.579763, -0.1237665, 2.552811, 0.1921569, 0, 1, 1,
0.5850102, -2.312188, 3.272511, 0.2, 0, 1, 1,
0.5872849, 0.5422477, 0.717613, 0.2078431, 0, 1, 1,
0.5877269, -0.7328713, 1.041922, 0.2117647, 0, 1, 1,
0.5886282, -0.7275002, 3.872961, 0.2196078, 0, 1, 1,
0.5889971, 0.5282298, 0.1284526, 0.2235294, 0, 1, 1,
0.5938908, 1.797166, -1.427989, 0.2313726, 0, 1, 1,
0.5945989, -0.5649992, 2.434537, 0.2352941, 0, 1, 1,
0.596162, 0.01767165, 0.7817014, 0.2431373, 0, 1, 1,
0.6006265, -0.6045411, 3.695201, 0.2470588, 0, 1, 1,
0.6007388, 0.7085864, 1.888786, 0.254902, 0, 1, 1,
0.6009969, 0.02866109, -0.0666796, 0.2588235, 0, 1, 1,
0.6021134, 0.2566212, 1.715673, 0.2666667, 0, 1, 1,
0.6113628, 0.1728708, 0.7658334, 0.2705882, 0, 1, 1,
0.6171806, 0.3050346, -0.3442323, 0.2784314, 0, 1, 1,
0.6249788, 1.650918, 0.5439866, 0.282353, 0, 1, 1,
0.6259706, -0.8597688, 3.059724, 0.2901961, 0, 1, 1,
0.6276234, 0.5422759, 2.893954, 0.2941177, 0, 1, 1,
0.6311082, -0.4929449, 0.5373667, 0.3019608, 0, 1, 1,
0.6326148, -1.894246, 2.925183, 0.3098039, 0, 1, 1,
0.6344179, -0.09391095, 2.202573, 0.3137255, 0, 1, 1,
0.6398638, 0.1488106, 0.09925077, 0.3215686, 0, 1, 1,
0.6408428, -1.173043, 2.322572, 0.3254902, 0, 1, 1,
0.6433974, 0.02637376, 1.740318, 0.3333333, 0, 1, 1,
0.6434229, -0.8842824, 1.877581, 0.3372549, 0, 1, 1,
0.6451762, -0.8867913, 3.085118, 0.345098, 0, 1, 1,
0.6464069, -1.482506, 3.002473, 0.3490196, 0, 1, 1,
0.6468119, 0.008702811, 2.644741, 0.3568628, 0, 1, 1,
0.6476653, -1.622263, 1.803398, 0.3607843, 0, 1, 1,
0.6511139, 0.4580267, 0.3680362, 0.3686275, 0, 1, 1,
0.6606746, 0.833343, 2.5012, 0.372549, 0, 1, 1,
0.6608074, 1.073328, 1.164199, 0.3803922, 0, 1, 1,
0.6699391, -1.964426, 3.39656, 0.3843137, 0, 1, 1,
0.6709509, 1.161191, -0.5347918, 0.3921569, 0, 1, 1,
0.6735496, 0.1242689, 2.372662, 0.3960784, 0, 1, 1,
0.6798402, -0.4575509, 3.656501, 0.4039216, 0, 1, 1,
0.680115, -0.6167174, 1.439376, 0.4117647, 0, 1, 1,
0.6817521, 0.5581524, 2.106178, 0.4156863, 0, 1, 1,
0.6854892, -1.264027, 2.597729, 0.4235294, 0, 1, 1,
0.6862593, -0.3753176, 2.743403, 0.427451, 0, 1, 1,
0.6875718, 1.271171, 2.297746, 0.4352941, 0, 1, 1,
0.6913493, -1.657567, 1.36847, 0.4392157, 0, 1, 1,
0.6936414, 0.4110026, 1.453874, 0.4470588, 0, 1, 1,
0.6947673, -1.838878, 4.724094, 0.4509804, 0, 1, 1,
0.6960906, 0.4246189, 1.916398, 0.4588235, 0, 1, 1,
0.7008191, 0.2633676, 1.338425, 0.4627451, 0, 1, 1,
0.7023417, -0.4370925, 2.600368, 0.4705882, 0, 1, 1,
0.7046384, -0.04507328, 3.303559, 0.4745098, 0, 1, 1,
0.70846, -0.9257135, 2.890163, 0.4823529, 0, 1, 1,
0.7144178, -0.4618413, 2.677157, 0.4862745, 0, 1, 1,
0.7209538, -0.1046838, -0.4400105, 0.4941176, 0, 1, 1,
0.7220613, -0.5745354, 3.588692, 0.5019608, 0, 1, 1,
0.7223511, -0.01820775, 0.8085505, 0.5058824, 0, 1, 1,
0.7228275, -1.101131, 3.831329, 0.5137255, 0, 1, 1,
0.7288809, -1.874395, 2.440141, 0.5176471, 0, 1, 1,
0.733923, -1.745524, 2.950417, 0.5254902, 0, 1, 1,
0.7358297, 1.701202, 0.7229322, 0.5294118, 0, 1, 1,
0.7403831, 0.8538516, 2.273036, 0.5372549, 0, 1, 1,
0.7457784, 0.766293, 0.3000818, 0.5411765, 0, 1, 1,
0.7604554, -0.3197167, 2.987185, 0.5490196, 0, 1, 1,
0.761285, -0.8440146, 2.060447, 0.5529412, 0, 1, 1,
0.7666633, 1.262784, -0.3794928, 0.5607843, 0, 1, 1,
0.7684401, -0.3946754, 2.666165, 0.5647059, 0, 1, 1,
0.7742204, -1.699125, 2.370201, 0.572549, 0, 1, 1,
0.7747664, -0.3922483, 1.358839, 0.5764706, 0, 1, 1,
0.7813565, 1.002334, 0.6643649, 0.5843138, 0, 1, 1,
0.786014, -0.03254862, 3.2473, 0.5882353, 0, 1, 1,
0.7935697, -0.4194222, 1.358018, 0.5960785, 0, 1, 1,
0.7978575, -2.523941, 2.230682, 0.6039216, 0, 1, 1,
0.7981405, -1.601005, 3.349927, 0.6078432, 0, 1, 1,
0.8014265, -1.476192, 3.75217, 0.6156863, 0, 1, 1,
0.8020166, -1.220465, 2.184362, 0.6196079, 0, 1, 1,
0.8028406, 1.448489, 1.651642, 0.627451, 0, 1, 1,
0.8046962, -0.4203876, 2.224351, 0.6313726, 0, 1, 1,
0.8064167, -1.066949, 0.8916775, 0.6392157, 0, 1, 1,
0.8064698, 0.09588914, 2.376405, 0.6431373, 0, 1, 1,
0.813511, 1.924228, 0.9921399, 0.6509804, 0, 1, 1,
0.8201511, 0.6906707, 0.1148619, 0.654902, 0, 1, 1,
0.8213335, 0.8194866, 3.400617, 0.6627451, 0, 1, 1,
0.8218287, 0.07806905, 2.473287, 0.6666667, 0, 1, 1,
0.824167, 2.450035, 1.010316, 0.6745098, 0, 1, 1,
0.8250397, 0.9072126, -0.01757934, 0.6784314, 0, 1, 1,
0.8266818, 0.1965371, 0.04220094, 0.6862745, 0, 1, 1,
0.8289289, -0.8394331, 3.891689, 0.6901961, 0, 1, 1,
0.8319297, -2.03041, 2.66269, 0.6980392, 0, 1, 1,
0.8319355, -0.0117715, 2.4215, 0.7058824, 0, 1, 1,
0.8351801, 0.08820274, 2.826885, 0.7098039, 0, 1, 1,
0.8387291, 0.2643231, -0.0172039, 0.7176471, 0, 1, 1,
0.8445914, 0.1543578, 0.6962446, 0.7215686, 0, 1, 1,
0.84631, 0.5854102, 1.696551, 0.7294118, 0, 1, 1,
0.8493979, -0.01593193, 1.698076, 0.7333333, 0, 1, 1,
0.8502352, -0.2658352, 1.113003, 0.7411765, 0, 1, 1,
0.8586662, -0.115599, 1.890414, 0.7450981, 0, 1, 1,
0.8587422, -0.7760866, 0.9481725, 0.7529412, 0, 1, 1,
0.8615115, -0.6986039, 4.070388, 0.7568628, 0, 1, 1,
0.8655689, 1.039941, -0.1907552, 0.7647059, 0, 1, 1,
0.8665191, -0.2156741, 2.614553, 0.7686275, 0, 1, 1,
0.8736995, -0.3197854, 1.246649, 0.7764706, 0, 1, 1,
0.8739311, 0.3932651, 2.260435, 0.7803922, 0, 1, 1,
0.8795161, -0.2272841, 2.384779, 0.7882353, 0, 1, 1,
0.8810301, -0.5546951, 2.093197, 0.7921569, 0, 1, 1,
0.8839097, -0.5664461, 0.9656069, 0.8, 0, 1, 1,
0.8841169, 0.4493514, 1.632433, 0.8078431, 0, 1, 1,
0.8879039, 0.4172117, 0.3220736, 0.8117647, 0, 1, 1,
0.8884525, 0.3252476, 2.105228, 0.8196079, 0, 1, 1,
0.8924181, 0.07127312, 0.6068149, 0.8235294, 0, 1, 1,
0.8993335, 0.6647896, 1.265295, 0.8313726, 0, 1, 1,
0.9041331, 0.7833794, 1.164575, 0.8352941, 0, 1, 1,
0.9064791, 0.3931442, 0.6390007, 0.8431373, 0, 1, 1,
0.9080557, 0.3544062, 0.4376452, 0.8470588, 0, 1, 1,
0.9088734, -1.194227, 3.390432, 0.854902, 0, 1, 1,
0.9145602, 0.09336577, 1.524783, 0.8588235, 0, 1, 1,
0.9162257, -0.8573341, 4.127267, 0.8666667, 0, 1, 1,
0.9206532, -0.664901, 3.042044, 0.8705882, 0, 1, 1,
0.9241356, 0.3850433, 1.281148, 0.8784314, 0, 1, 1,
0.9282305, -1.041445, 1.418593, 0.8823529, 0, 1, 1,
0.9342495, -1.033871, 1.928629, 0.8901961, 0, 1, 1,
0.9433787, -0.5970469, 3.668664, 0.8941177, 0, 1, 1,
0.9443133, 1.240267, 0.90772, 0.9019608, 0, 1, 1,
0.9529636, 1.517378, -1.202016, 0.9098039, 0, 1, 1,
0.9562343, 0.2316809, -0.05084112, 0.9137255, 0, 1, 1,
0.9633912, -1.061972, 3.257985, 0.9215686, 0, 1, 1,
0.9636702, 1.483713, 1.154179, 0.9254902, 0, 1, 1,
0.9662802, 1.004943, -0.2044641, 0.9333333, 0, 1, 1,
0.9683293, -0.9556181, 3.646513, 0.9372549, 0, 1, 1,
0.9709434, -0.2141405, 0.8019561, 0.945098, 0, 1, 1,
0.9711182, -1.146376, 3.173319, 0.9490196, 0, 1, 1,
0.9734965, -0.04895698, 2.49422, 0.9568627, 0, 1, 1,
0.9755505, 0.241059, 0.2950561, 0.9607843, 0, 1, 1,
0.9760515, -0.0234237, 1.650847, 0.9686275, 0, 1, 1,
0.9843903, 0.1219657, 1.152722, 0.972549, 0, 1, 1,
0.9886948, -0.5583492, 0.4294042, 0.9803922, 0, 1, 1,
0.9919626, -0.01245053, 0.1840161, 0.9843137, 0, 1, 1,
0.9998353, 0.1274675, 3.284243, 0.9921569, 0, 1, 1,
1.006886, 0.09655828, 2.439631, 0.9960784, 0, 1, 1,
1.007927, 0.589902, 1.928027, 1, 0, 0.9960784, 1,
1.013846, -0.08487848, 2.497732, 1, 0, 0.9882353, 1,
1.01552, 0.8191972, 1.751649, 1, 0, 0.9843137, 1,
1.020077, -2.848399, 2.024389, 1, 0, 0.9764706, 1,
1.021719, -0.2646536, 2.104426, 1, 0, 0.972549, 1,
1.030012, 0.8437076, 0.949738, 1, 0, 0.9647059, 1,
1.032313, 0.4096942, 2.135113, 1, 0, 0.9607843, 1,
1.03426, 1.973874, 0.3177397, 1, 0, 0.9529412, 1,
1.038378, -0.7131785, 1.878412, 1, 0, 0.9490196, 1,
1.042889, -1.047543, 3.019581, 1, 0, 0.9411765, 1,
1.051703, -0.3946921, 1.89003, 1, 0, 0.9372549, 1,
1.056377, -0.5385213, 2.600039, 1, 0, 0.9294118, 1,
1.063747, 0.4796673, 0.5585456, 1, 0, 0.9254902, 1,
1.066051, -0.9886681, 2.568759, 1, 0, 0.9176471, 1,
1.070764, 0.7810957, 2.514059, 1, 0, 0.9137255, 1,
1.072266, 0.02122899, 2.589062, 1, 0, 0.9058824, 1,
1.075578, -0.2547064, 1.688351, 1, 0, 0.9019608, 1,
1.080395, -0.7426938, 3.079316, 1, 0, 0.8941177, 1,
1.089042, 0.7066932, 0.4785621, 1, 0, 0.8862745, 1,
1.09522, 0.1608312, 1.746339, 1, 0, 0.8823529, 1,
1.099625, -0.6472147, 0.2790505, 1, 0, 0.8745098, 1,
1.101292, -0.2276639, 0.2965015, 1, 0, 0.8705882, 1,
1.10274, -0.679536, 2.151144, 1, 0, 0.8627451, 1,
1.103101, -0.558333, 3.537734, 1, 0, 0.8588235, 1,
1.103901, -0.1156979, 1.423277, 1, 0, 0.8509804, 1,
1.104978, -0.4569843, 1.731331, 1, 0, 0.8470588, 1,
1.107018, -0.3834003, 1.309011, 1, 0, 0.8392157, 1,
1.111392, -1.739719, 5.501985, 1, 0, 0.8352941, 1,
1.113493, 2.159725, 1.078676, 1, 0, 0.827451, 1,
1.114663, 0.5026197, 0.7114739, 1, 0, 0.8235294, 1,
1.121888, -0.4292825, 1.021202, 1, 0, 0.8156863, 1,
1.12267, -0.8925819, 0.8461528, 1, 0, 0.8117647, 1,
1.135563, 0.9896333, 0.7592559, 1, 0, 0.8039216, 1,
1.145683, 0.6605357, 1.792208, 1, 0, 0.7960784, 1,
1.154719, -0.05938646, 1.289561, 1, 0, 0.7921569, 1,
1.167404, -1.739441, 1.178355, 1, 0, 0.7843137, 1,
1.171276, -0.4036308, 2.615164, 1, 0, 0.7803922, 1,
1.185311, -3.057489, 5.13229, 1, 0, 0.772549, 1,
1.187469, -0.8540494, 2.520173, 1, 0, 0.7686275, 1,
1.188568, -0.6672254, 3.569494, 1, 0, 0.7607843, 1,
1.191437, 0.03622745, 0.2895398, 1, 0, 0.7568628, 1,
1.192453, 1.440001, 0.4482254, 1, 0, 0.7490196, 1,
1.205313, -1.864568, 2.194975, 1, 0, 0.7450981, 1,
1.212511, -0.2515039, 0.08169785, 1, 0, 0.7372549, 1,
1.220653, -2.011655, 2.519275, 1, 0, 0.7333333, 1,
1.227515, -0.4711013, 1.252586, 1, 0, 0.7254902, 1,
1.228307, 0.06307935, 2.021448, 1, 0, 0.7215686, 1,
1.229807, -0.3738008, 0.7301103, 1, 0, 0.7137255, 1,
1.237958, -1.988382, 2.076085, 1, 0, 0.7098039, 1,
1.251724, 0.1271932, 0.5931085, 1, 0, 0.7019608, 1,
1.255472, 1.043279, 0.1237756, 1, 0, 0.6941177, 1,
1.258211, 0.7263223, -0.1639044, 1, 0, 0.6901961, 1,
1.259723, -1.1078, 3.718059, 1, 0, 0.682353, 1,
1.269797, 0.2119811, 0.7024016, 1, 0, 0.6784314, 1,
1.277037, -2.677472, 2.934792, 1, 0, 0.6705883, 1,
1.303123, 0.4871704, 0.6708657, 1, 0, 0.6666667, 1,
1.305038, 0.711824, 1.191228, 1, 0, 0.6588235, 1,
1.322953, -1.4873, 1.9759, 1, 0, 0.654902, 1,
1.323832, 0.9756814, 1.196632, 1, 0, 0.6470588, 1,
1.327532, -0.528255, 3.179902, 1, 0, 0.6431373, 1,
1.32876, 0.4349799, 0.4447812, 1, 0, 0.6352941, 1,
1.337542, -0.2519094, 2.414834, 1, 0, 0.6313726, 1,
1.339539, -2.694744, 3.300659, 1, 0, 0.6235294, 1,
1.346848, -0.08701576, 0.9308172, 1, 0, 0.6196079, 1,
1.349566, 0.7094302, -2.227688, 1, 0, 0.6117647, 1,
1.351532, -0.9931118, 2.119633, 1, 0, 0.6078432, 1,
1.354824, -1.482723, 2.647523, 1, 0, 0.6, 1,
1.359191, -0.007609798, 1.305457, 1, 0, 0.5921569, 1,
1.359939, -0.4792798, 3.737172, 1, 0, 0.5882353, 1,
1.368972, -0.8554152, 2.727842, 1, 0, 0.5803922, 1,
1.369405, -0.04044431, 2.110064, 1, 0, 0.5764706, 1,
1.374239, 0.3811323, 1.588605, 1, 0, 0.5686275, 1,
1.389251, 0.3349263, -1.411842, 1, 0, 0.5647059, 1,
1.392657, 0.5967942, 1.035383, 1, 0, 0.5568628, 1,
1.40187, 1.068528, 1.241959, 1, 0, 0.5529412, 1,
1.409271, 0.3780442, 1.012341, 1, 0, 0.5450981, 1,
1.413831, 0.7332526, 0.9503073, 1, 0, 0.5411765, 1,
1.415826, 0.9699547, 1.543305, 1, 0, 0.5333334, 1,
1.422386, 2.566083, 0.2810126, 1, 0, 0.5294118, 1,
1.426788, -0.3334093, 1.300617, 1, 0, 0.5215687, 1,
1.431027, 0.8922974, 1.016942, 1, 0, 0.5176471, 1,
1.441197, 0.07517246, 1.596111, 1, 0, 0.509804, 1,
1.450255, -0.1653331, 1.315297, 1, 0, 0.5058824, 1,
1.463524, -0.1217973, -0.9203779, 1, 0, 0.4980392, 1,
1.464817, 0.002684547, 2.871444, 1, 0, 0.4901961, 1,
1.473596, -0.4994048, 1.076875, 1, 0, 0.4862745, 1,
1.474372, -1.491889, 3.325873, 1, 0, 0.4784314, 1,
1.488263, -1.152946, 3.499096, 1, 0, 0.4745098, 1,
1.488744, 1.277695, 0.2911574, 1, 0, 0.4666667, 1,
1.500363, 0.4979652, 1.712527, 1, 0, 0.4627451, 1,
1.508083, -0.5779324, 2.754957, 1, 0, 0.454902, 1,
1.51472, 0.43107, 0.7050756, 1, 0, 0.4509804, 1,
1.515412, 1.364771, 1.147103, 1, 0, 0.4431373, 1,
1.521616, 1.080113, 1.027493, 1, 0, 0.4392157, 1,
1.540538, 0.3874339, 2.764195, 1, 0, 0.4313726, 1,
1.54287, -0.6128538, 1.055679, 1, 0, 0.427451, 1,
1.561316, 1.360224, -0.8362591, 1, 0, 0.4196078, 1,
1.57639, -0.1573806, 1.432669, 1, 0, 0.4156863, 1,
1.579865, 0.1528235, 0.801645, 1, 0, 0.4078431, 1,
1.580308, 1.239854, 0.9682091, 1, 0, 0.4039216, 1,
1.589007, -0.1704686, -1.704703, 1, 0, 0.3960784, 1,
1.590732, -0.4590339, 0.851231, 1, 0, 0.3882353, 1,
1.607617, -1.48226, 3.284812, 1, 0, 0.3843137, 1,
1.615809, -0.6871113, 0.8730842, 1, 0, 0.3764706, 1,
1.616604, -0.3205231, 3.452657, 1, 0, 0.372549, 1,
1.624886, -1.153872, 4.862499, 1, 0, 0.3647059, 1,
1.625535, -0.2267873, 3.770129, 1, 0, 0.3607843, 1,
1.628536, -0.118351, 1.651555, 1, 0, 0.3529412, 1,
1.639118, -1.232234, 4.536353, 1, 0, 0.3490196, 1,
1.6728, -0.5984533, -0.2064262, 1, 0, 0.3411765, 1,
1.67893, 0.05457855, 2.405236, 1, 0, 0.3372549, 1,
1.682483, 1.416828, -0.2689637, 1, 0, 0.3294118, 1,
1.686489, 0.02379923, 2.155515, 1, 0, 0.3254902, 1,
1.691408, -0.6409264, -0.5700126, 1, 0, 0.3176471, 1,
1.701075, 0.4795077, 1.843795, 1, 0, 0.3137255, 1,
1.717375, -0.7254658, 0.6510459, 1, 0, 0.3058824, 1,
1.722706, 0.216838, 2.008104, 1, 0, 0.2980392, 1,
1.728147, -1.267481, 2.989422, 1, 0, 0.2941177, 1,
1.728324, -0.2289607, -0.03048554, 1, 0, 0.2862745, 1,
1.732274, -0.07436963, 2.306941, 1, 0, 0.282353, 1,
1.753393, 1.38271, 1.258835, 1, 0, 0.2745098, 1,
1.763723, 0.7514216, 1.555057, 1, 0, 0.2705882, 1,
1.771329, 3.116769, -0.2288519, 1, 0, 0.2627451, 1,
1.790692, 0.6053112, -0.8474312, 1, 0, 0.2588235, 1,
1.798479, 0.4624289, 2.006577, 1, 0, 0.2509804, 1,
1.800083, 0.2650791, 2.4054, 1, 0, 0.2470588, 1,
1.804732, 0.3300595, 0.7086695, 1, 0, 0.2392157, 1,
1.810357, 1.337409, 1.771069, 1, 0, 0.2352941, 1,
1.813369, -0.2127471, 1.723398, 1, 0, 0.227451, 1,
1.815331, -1.062569, 2.833534, 1, 0, 0.2235294, 1,
1.836184, 0.455327, 1.028481, 1, 0, 0.2156863, 1,
1.839851, 0.1751129, 1.956851, 1, 0, 0.2117647, 1,
1.841257, 1.754982, 0.09205397, 1, 0, 0.2039216, 1,
1.841338, -0.7874276, 1.920295, 1, 0, 0.1960784, 1,
1.857758, 0.840242, 1.276733, 1, 0, 0.1921569, 1,
1.861083, -1.296652, 1.186558, 1, 0, 0.1843137, 1,
1.874894, -1.606883, 2.796492, 1, 0, 0.1803922, 1,
1.897013, 0.8186399, 2.501968, 1, 0, 0.172549, 1,
1.899598, -0.08854232, 0.9645754, 1, 0, 0.1686275, 1,
1.942219, -0.3125553, 0.8714135, 1, 0, 0.1607843, 1,
1.942662, -0.5642697, 2.407914, 1, 0, 0.1568628, 1,
1.959964, -1.759316, 1.697282, 1, 0, 0.1490196, 1,
1.985453, 1.703961, 0.1456951, 1, 0, 0.145098, 1,
1.991244, 0.148019, 1.508783, 1, 0, 0.1372549, 1,
1.99465, -0.3987467, 1.967681, 1, 0, 0.1333333, 1,
2.057902, -1.56798, 3.43662, 1, 0, 0.1254902, 1,
2.091805, 0.4917243, 0.8423465, 1, 0, 0.1215686, 1,
2.104422, -0.7704909, 1.843137, 1, 0, 0.1137255, 1,
2.120343, 0.3484707, 0.6189062, 1, 0, 0.1098039, 1,
2.214588, -0.5836295, 4.53049, 1, 0, 0.1019608, 1,
2.245502, -1.472168, 1.836898, 1, 0, 0.09411765, 1,
2.24708, -0.6200622, 2.702741, 1, 0, 0.09019608, 1,
2.297067, -1.373125, 0.8560759, 1, 0, 0.08235294, 1,
2.297134, -0.2772683, 1.695181, 1, 0, 0.07843138, 1,
2.298632, 1.004035, -0.0598607, 1, 0, 0.07058824, 1,
2.323113, 1.476563, 1.270844, 1, 0, 0.06666667, 1,
2.325122, -1.353519, 2.05181, 1, 0, 0.05882353, 1,
2.349019, -2.376173, 1.249747, 1, 0, 0.05490196, 1,
2.4238, 0.9777894, 0.2543613, 1, 0, 0.04705882, 1,
2.449604, 1.697959, 2.040537, 1, 0, 0.04313726, 1,
2.482047, 0.06234576, 0.81197, 1, 0, 0.03529412, 1,
2.507026, 1.240947, 1.555728, 1, 0, 0.03137255, 1,
2.724656, 0.223132, 0.6934307, 1, 0, 0.02352941, 1,
2.757638, 1.764851, 2.145612, 1, 0, 0.01960784, 1,
2.774532, -0.1412145, 1.994753, 1, 0, 0.01176471, 1,
3.400781, -0.007667026, 3.016028, 1, 0, 0.007843138, 1
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
-0.06014562, -4.377843, -7.136947, 0, -0.5, 0.5, 0.5,
-0.06014562, -4.377843, -7.136947, 1, -0.5, 0.5, 0.5,
-0.06014562, -4.377843, -7.136947, 1, 1.5, 0.5, 0.5,
-0.06014562, -4.377843, -7.136947, 0, 1.5, 0.5, 0.5
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
-4.694327, 0.2432958, -7.136947, 0, -0.5, 0.5, 0.5,
-4.694327, 0.2432958, -7.136947, 1, -0.5, 0.5, 0.5,
-4.694327, 0.2432958, -7.136947, 1, 1.5, 0.5, 0.5,
-4.694327, 0.2432958, -7.136947, 0, 1.5, 0.5, 0.5
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
-4.694327, -4.377843, 0.1306829, 0, -0.5, 0.5, 0.5,
-4.694327, -4.377843, 0.1306829, 1, -0.5, 0.5, 0.5,
-4.694327, -4.377843, 0.1306829, 1, 1.5, 0.5, 0.5,
-4.694327, -4.377843, 0.1306829, 0, 1.5, 0.5, 0.5
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
-3, -3.311427, -5.459802,
3, -3.311427, -5.459802,
-3, -3.311427, -5.459802,
-3, -3.489163, -5.739326,
-2, -3.311427, -5.459802,
-2, -3.489163, -5.739326,
-1, -3.311427, -5.459802,
-1, -3.489163, -5.739326,
0, -3.311427, -5.459802,
0, -3.489163, -5.739326,
1, -3.311427, -5.459802,
1, -3.489163, -5.739326,
2, -3.311427, -5.459802,
2, -3.489163, -5.739326,
3, -3.311427, -5.459802,
3, -3.489163, -5.739326
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
-3, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
-3, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
-3, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
-3, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
-2, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
-2, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
-2, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
-2, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
-1, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
-1, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
-1, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
-1, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
0, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
0, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
0, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
0, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
1, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
1, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
1, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
1, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
2, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
2, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
2, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
2, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5,
3, -3.844635, -6.298374, 0, -0.5, 0.5, 0.5,
3, -3.844635, -6.298374, 1, -0.5, 0.5, 0.5,
3, -3.844635, -6.298374, 1, 1.5, 0.5, 0.5,
3, -3.844635, -6.298374, 0, 1.5, 0.5, 0.5
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
-3.6249, -3, -5.459802,
-3.6249, 3, -5.459802,
-3.6249, -3, -5.459802,
-3.803138, -3, -5.739326,
-3.6249, -2, -5.459802,
-3.803138, -2, -5.739326,
-3.6249, -1, -5.459802,
-3.803138, -1, -5.739326,
-3.6249, 0, -5.459802,
-3.803138, 0, -5.739326,
-3.6249, 1, -5.459802,
-3.803138, 1, -5.739326,
-3.6249, 2, -5.459802,
-3.803138, 2, -5.739326,
-3.6249, 3, -5.459802,
-3.803138, 3, -5.739326
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
-4.159614, -3, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, -3, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, -3, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, -3, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, -2, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, -2, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, -2, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, -2, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, -1, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, -1, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, -1, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, -1, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, 0, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, 0, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, 0, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, 0, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, 1, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, 1, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, 1, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, 1, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, 2, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, 2, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, 2, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, 2, -6.298374, 0, 1.5, 0.5, 0.5,
-4.159614, 3, -6.298374, 0, -0.5, 0.5, 0.5,
-4.159614, 3, -6.298374, 1, -0.5, 0.5, 0.5,
-4.159614, 3, -6.298374, 1, 1.5, 0.5, 0.5,
-4.159614, 3, -6.298374, 0, 1.5, 0.5, 0.5
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
-3.6249, -3.311427, -4,
-3.6249, -3.311427, 4,
-3.6249, -3.311427, -4,
-3.803138, -3.489163, -4,
-3.6249, -3.311427, -2,
-3.803138, -3.489163, -2,
-3.6249, -3.311427, 0,
-3.803138, -3.489163, 0,
-3.6249, -3.311427, 2,
-3.803138, -3.489163, 2,
-3.6249, -3.311427, 4,
-3.803138, -3.489163, 4
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
-4.159614, -3.844635, -4, 0, -0.5, 0.5, 0.5,
-4.159614, -3.844635, -4, 1, -0.5, 0.5, 0.5,
-4.159614, -3.844635, -4, 1, 1.5, 0.5, 0.5,
-4.159614, -3.844635, -4, 0, 1.5, 0.5, 0.5,
-4.159614, -3.844635, -2, 0, -0.5, 0.5, 0.5,
-4.159614, -3.844635, -2, 1, -0.5, 0.5, 0.5,
-4.159614, -3.844635, -2, 1, 1.5, 0.5, 0.5,
-4.159614, -3.844635, -2, 0, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 0, 0, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 0, 1, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 0, 1, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 0, 0, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 2, 0, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 2, 1, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 2, 1, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 2, 0, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 4, 0, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 4, 1, -0.5, 0.5, 0.5,
-4.159614, -3.844635, 4, 1, 1.5, 0.5, 0.5,
-4.159614, -3.844635, 4, 0, 1.5, 0.5, 0.5
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
-3.6249, -3.311427, -5.459802,
-3.6249, 3.798018, -5.459802,
-3.6249, -3.311427, 5.721168,
-3.6249, 3.798018, 5.721168,
-3.6249, -3.311427, -5.459802,
-3.6249, -3.311427, 5.721168,
-3.6249, 3.798018, -5.459802,
-3.6249, 3.798018, 5.721168,
-3.6249, -3.311427, -5.459802,
3.504609, -3.311427, -5.459802,
-3.6249, -3.311427, 5.721168,
3.504609, -3.311427, 5.721168,
-3.6249, 3.798018, -5.459802,
3.504609, 3.798018, -5.459802,
-3.6249, 3.798018, 5.721168,
3.504609, 3.798018, 5.721168,
3.504609, -3.311427, -5.459802,
3.504609, 3.798018, -5.459802,
3.504609, -3.311427, 5.721168,
3.504609, 3.798018, 5.721168,
3.504609, -3.311427, -5.459802,
3.504609, -3.311427, 5.721168,
3.504609, 3.798018, -5.459802,
3.504609, 3.798018, 5.721168
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
var radius = 8.03438;
var distance = 35.74586;
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
mvMatrix.translate( 0.06014562, -0.2432958, -0.1306829 );
mvMatrix.scale( 1.218447, 1.221886, 0.7769388 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74586);
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
Apollo<-read.table("Apollo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Apollo$V2
```

```
## Error in eval(expr, envir, enclos): object 'Apollo' not found
```

```r
y<-Apollo$V3
```

```
## Error in eval(expr, envir, enclos): object 'Apollo' not found
```

```r
z<-Apollo$V4
```

```
## Error in eval(expr, envir, enclos): object 'Apollo' not found
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
-3.521073, 0.6505966, -2.706494, 0, 0, 1, 1, 1,
-3.263495, 0.2111602, -1.529522, 1, 0, 0, 1, 1,
-2.643297, 0.6368272, -1.737753, 1, 0, 0, 1, 1,
-2.465547, -0.6393173, -3.61375, 1, 0, 0, 1, 1,
-2.44918, 0.2214794, -2.193489, 1, 0, 0, 1, 1,
-2.275633, 1.569675, -1.217989, 1, 0, 0, 1, 1,
-2.266021, -0.4603546, -1.603651, 0, 0, 0, 1, 1,
-2.233004, 0.08075944, -1.8517, 0, 0, 0, 1, 1,
-2.225302, -0.5238516, -1.515566, 0, 0, 0, 1, 1,
-2.152675, 1.332357, -1.205464, 0, 0, 0, 1, 1,
-2.133865, 0.1116506, -1.935916, 0, 0, 0, 1, 1,
-2.105407, 0.8611177, -1.100952, 0, 0, 0, 1, 1,
-2.074455, 0.5623391, -2.946285, 0, 0, 0, 1, 1,
-2.072848, 1.831543, -1.035945, 1, 1, 1, 1, 1,
-2.068854, 0.2568968, -2.528942, 1, 1, 1, 1, 1,
-2.063757, -1.509921, -3.394953, 1, 1, 1, 1, 1,
-2.033941, -0.9091409, -1.74018, 1, 1, 1, 1, 1,
-2.033809, 0.3912894, -2.636887, 1, 1, 1, 1, 1,
-2.014313, 0.1599315, -0.9865541, 1, 1, 1, 1, 1,
-1.959883, 0.7990388, -1.76904, 1, 1, 1, 1, 1,
-1.953213, -1.259875, -3.055365, 1, 1, 1, 1, 1,
-1.946203, -0.8958936, -0.4897419, 1, 1, 1, 1, 1,
-1.916724, 0.8679145, -0.2854873, 1, 1, 1, 1, 1,
-1.898036, -0.04932891, -1.603348, 1, 1, 1, 1, 1,
-1.882033, -0.8777834, -1.905565, 1, 1, 1, 1, 1,
-1.864711, -0.6797116, -0.7437964, 1, 1, 1, 1, 1,
-1.850406, -0.227301, -1.669245, 1, 1, 1, 1, 1,
-1.84113, -1.550921, -2.109174, 1, 1, 1, 1, 1,
-1.839028, 1.617376, -0.1348064, 0, 0, 1, 1, 1,
-1.838315, 0.09551467, -1.831928, 1, 0, 0, 1, 1,
-1.807566, -0.3414948, -2.540702, 1, 0, 0, 1, 1,
-1.805246, 2.106299, -1.037589, 1, 0, 0, 1, 1,
-1.76159, 0.7239838, -0.1795012, 1, 0, 0, 1, 1,
-1.75953, 0.3032464, -1.426918, 1, 0, 0, 1, 1,
-1.75496, 0.99936, 0.5858606, 0, 0, 0, 1, 1,
-1.751866, 0.4609982, -2.497955, 0, 0, 0, 1, 1,
-1.736849, -1.399408, -2.890624, 0, 0, 0, 1, 1,
-1.719511, 0.6350233, 0.03527134, 0, 0, 0, 1, 1,
-1.700079, 2.503445, -1.813138, 0, 0, 0, 1, 1,
-1.676037, -0.2805912, -1.847704, 0, 0, 0, 1, 1,
-1.664827, 0.9714385, -0.6070338, 0, 0, 0, 1, 1,
-1.651998, 0.7810329, -0.6113588, 1, 1, 1, 1, 1,
-1.64585, -0.4294087, -2.685133, 1, 1, 1, 1, 1,
-1.645054, -0.1576077, -1.301078, 1, 1, 1, 1, 1,
-1.623707, 1.621505, 0.1305225, 1, 1, 1, 1, 1,
-1.622998, 0.7131664, -0.8414744, 1, 1, 1, 1, 1,
-1.614964, -0.2380051, -3.128567, 1, 1, 1, 1, 1,
-1.61223, 1.273555, -1.305805, 1, 1, 1, 1, 1,
-1.588775, -1.135404, -2.390085, 1, 1, 1, 1, 1,
-1.584618, -0.8081836, -1.365611, 1, 1, 1, 1, 1,
-1.578533, -0.5656065, -3.625928, 1, 1, 1, 1, 1,
-1.578267, -0.6512414, -2.024126, 1, 1, 1, 1, 1,
-1.560782, -0.5801305, -0.1163645, 1, 1, 1, 1, 1,
-1.552731, 3.694483, -1.179887, 1, 1, 1, 1, 1,
-1.532538, 1.193253, -1.348032, 1, 1, 1, 1, 1,
-1.516293, -1.131992, -3.000815, 1, 1, 1, 1, 1,
-1.506731, -0.07435047, -0.788084, 0, 0, 1, 1, 1,
-1.501752, 0.7219604, -1.273174, 1, 0, 0, 1, 1,
-1.479402, 0.4385068, -0.2367252, 1, 0, 0, 1, 1,
-1.477107, -0.220964, -1.466283, 1, 0, 0, 1, 1,
-1.477027, 0.519431, -1.557037, 1, 0, 0, 1, 1,
-1.455644, -0.8863323, -2.039543, 1, 0, 0, 1, 1,
-1.45509, -0.1935214, -0.326811, 0, 0, 0, 1, 1,
-1.447819, -0.08022236, -2.467537, 0, 0, 0, 1, 1,
-1.440467, -1.229701, -2.50486, 0, 0, 0, 1, 1,
-1.436618, -1.600464, -1.950045, 0, 0, 0, 1, 1,
-1.425323, -0.6598957, -3.347549, 0, 0, 0, 1, 1,
-1.422159, 1.750881, -1.169587, 0, 0, 0, 1, 1,
-1.412536, 1.911541, 0.08940489, 0, 0, 0, 1, 1,
-1.400883, -0.8844837, -0.71021, 1, 1, 1, 1, 1,
-1.390662, -0.6806338, -2.13127, 1, 1, 1, 1, 1,
-1.380537, -1.09216, -1.860323, 1, 1, 1, 1, 1,
-1.378753, 0.736154, -1.816398, 1, 1, 1, 1, 1,
-1.366777, 2.194777, -0.5692261, 1, 1, 1, 1, 1,
-1.356105, -1.973376, -1.56602, 1, 1, 1, 1, 1,
-1.355242, -0.8990633, -4.283453, 1, 1, 1, 1, 1,
-1.354658, 1.397051, -1.220228, 1, 1, 1, 1, 1,
-1.35039, 1.352647, -1.868087, 1, 1, 1, 1, 1,
-1.341381, 1.292157, -1.593978, 1, 1, 1, 1, 1,
-1.328676, 0.9500064, -1.205613, 1, 1, 1, 1, 1,
-1.324281, 0.1372204, -2.055708, 1, 1, 1, 1, 1,
-1.316871, 0.8857107, -0.4406366, 1, 1, 1, 1, 1,
-1.315101, 0.1118228, -1.056499, 1, 1, 1, 1, 1,
-1.30751, 1.836994, -2.177146, 1, 1, 1, 1, 1,
-1.307273, 0.9890749, -0.8410153, 0, 0, 1, 1, 1,
-1.294294, 0.4827833, -3.609889, 1, 0, 0, 1, 1,
-1.291128, 2.236472, -1.221023, 1, 0, 0, 1, 1,
-1.290979, 0.228994, -1.151806, 1, 0, 0, 1, 1,
-1.281704, 1.382563, -0.8444044, 1, 0, 0, 1, 1,
-1.273244, -0.8192595, -1.921128, 1, 0, 0, 1, 1,
-1.264145, 0.2097697, -1.526408, 0, 0, 0, 1, 1,
-1.260269, 1.74502, -1.414595, 0, 0, 0, 1, 1,
-1.258268, -1.11716, -2.403183, 0, 0, 0, 1, 1,
-1.250793, 0.7104293, -2.60885, 0, 0, 0, 1, 1,
-1.250187, -0.01079217, -2.445659, 0, 0, 0, 1, 1,
-1.24683, 0.4911478, -0.6329968, 0, 0, 0, 1, 1,
-1.242787, 2.341828, -1.018784, 0, 0, 0, 1, 1,
-1.213484, 0.0721911, -2.431638, 1, 1, 1, 1, 1,
-1.198755, -0.1932549, -3.782937, 1, 1, 1, 1, 1,
-1.196842, 0.4967041, -3.064994, 1, 1, 1, 1, 1,
-1.195117, -1.233058, -3.451432, 1, 1, 1, 1, 1,
-1.165511, 0.08897223, -1.611808, 1, 1, 1, 1, 1,
-1.16225, -1.075699, -3.227962, 1, 1, 1, 1, 1,
-1.161312, 0.7170004, -1.078025, 1, 1, 1, 1, 1,
-1.148581, 1.171004, -0.07248743, 1, 1, 1, 1, 1,
-1.147805, 0.6647331, -0.5198166, 1, 1, 1, 1, 1,
-1.147288, -0.14079, -3.352499, 1, 1, 1, 1, 1,
-1.147103, 1.034355, -1.731967, 1, 1, 1, 1, 1,
-1.142686, 0.5361036, -2.613168, 1, 1, 1, 1, 1,
-1.12863, -1.250543, -1.901139, 1, 1, 1, 1, 1,
-1.099448, -1.342145, -1.928361, 1, 1, 1, 1, 1,
-1.086567, 0.7752087, -0.5319649, 1, 1, 1, 1, 1,
-1.078174, 2.735004, 0.2972557, 0, 0, 1, 1, 1,
-1.077624, -1.022088, -1.816628, 1, 0, 0, 1, 1,
-1.075501, 1.732037, -0.4787235, 1, 0, 0, 1, 1,
-1.074057, 0.5647742, -0.3020326, 1, 0, 0, 1, 1,
-1.072404, 0.04093944, -1.662174, 1, 0, 0, 1, 1,
-1.069291, -0.9751955, -1.517517, 1, 0, 0, 1, 1,
-1.063003, -0.5103643, -3.154158, 0, 0, 0, 1, 1,
-1.0619, 0.7757719, -0.7715976, 0, 0, 0, 1, 1,
-1.058241, 0.7779118, 1.318894, 0, 0, 0, 1, 1,
-1.048862, 0.07259535, -1.938647, 0, 0, 0, 1, 1,
-1.045437, 0.9283056, -0.8321242, 0, 0, 0, 1, 1,
-1.044702, -0.2782567, -1.999593, 0, 0, 0, 1, 1,
-1.044048, 0.5138027, -2.140878, 0, 0, 0, 1, 1,
-1.035218, 0.8852916, -0.3108146, 1, 1, 1, 1, 1,
-1.031865, -1.413821, -1.369054, 1, 1, 1, 1, 1,
-1.029512, -1.205046, -0.6833224, 1, 1, 1, 1, 1,
-1.026366, 1.759492, 0.03697814, 1, 1, 1, 1, 1,
-1.024741, -0.04677743, -1.643844, 1, 1, 1, 1, 1,
-1.024486, -1.299437, -2.617339, 1, 1, 1, 1, 1,
-1.017623, -0.8782908, -2.535184, 1, 1, 1, 1, 1,
-1.012162, 1.326928, -1.719757, 1, 1, 1, 1, 1,
-1.01123, 1.489425, -2.124931, 1, 1, 1, 1, 1,
-0.9994432, 0.02951039, -1.856052, 1, 1, 1, 1, 1,
-0.9962038, 0.2515521, -1.390367, 1, 1, 1, 1, 1,
-0.993753, 0.04819331, -1.934185, 1, 1, 1, 1, 1,
-0.9914047, 0.3117729, -1.2041, 1, 1, 1, 1, 1,
-0.9848099, -0.9319185, -2.615399, 1, 1, 1, 1, 1,
-0.9844334, 0.124895, -3.27753, 1, 1, 1, 1, 1,
-0.9841102, -1.370033, -3.254109, 0, 0, 1, 1, 1,
-0.9749811, 1.248354, -0.7541438, 1, 0, 0, 1, 1,
-0.9739812, 0.4008374, 0.2310431, 1, 0, 0, 1, 1,
-0.966662, -0.266977, -2.13719, 1, 0, 0, 1, 1,
-0.9642051, -1.174456, -2.379402, 1, 0, 0, 1, 1,
-0.9625918, 0.4444121, -2.490759, 1, 0, 0, 1, 1,
-0.9613805, -0.5257283, -1.910034, 0, 0, 0, 1, 1,
-0.9535363, 0.1847715, -2.023747, 0, 0, 0, 1, 1,
-0.9521078, -1.313274, -1.998608, 0, 0, 0, 1, 1,
-0.949968, 1.837441, 0.01589276, 0, 0, 0, 1, 1,
-0.9498988, -0.4098809, -1.373923, 0, 0, 0, 1, 1,
-0.93938, 0.8644732, -2.339335, 0, 0, 0, 1, 1,
-0.9376346, -0.8410175, -1.114151, 0, 0, 0, 1, 1,
-0.9352722, -1.459011, -3.341121, 1, 1, 1, 1, 1,
-0.932454, -0.2133805, -1.110092, 1, 1, 1, 1, 1,
-0.9251761, -1.040755, -2.252184, 1, 1, 1, 1, 1,
-0.9246861, -0.2040934, -0.4389942, 1, 1, 1, 1, 1,
-0.9197234, 1.265535, -1.609077, 1, 1, 1, 1, 1,
-0.8987194, -1.050683, -4.497001, 1, 1, 1, 1, 1,
-0.8982117, 1.197245, -0.1343121, 1, 1, 1, 1, 1,
-0.8871396, -0.2648611, -2.174553, 1, 1, 1, 1, 1,
-0.874424, -0.6619051, -3.460295, 1, 1, 1, 1, 1,
-0.8634935, 0.1591656, -0.6391509, 1, 1, 1, 1, 1,
-0.8540338, 1.469038, 0.3818093, 1, 1, 1, 1, 1,
-0.8534003, -0.0470997, -2.880835, 1, 1, 1, 1, 1,
-0.8482886, 0.4451124, -0.1000665, 1, 1, 1, 1, 1,
-0.8459601, -0.8072789, -3.568057, 1, 1, 1, 1, 1,
-0.8447061, -1.098335, -3.164675, 1, 1, 1, 1, 1,
-0.8425694, 2.186611, 0.001050028, 0, 0, 1, 1, 1,
-0.8409523, 0.9483067, -0.4301136, 1, 0, 0, 1, 1,
-0.8403269, -0.6214767, -1.73822, 1, 0, 0, 1, 1,
-0.8366135, 1.690871, -0.1213034, 1, 0, 0, 1, 1,
-0.836278, -0.7749378, -3.430341, 1, 0, 0, 1, 1,
-0.8314972, 0.1715334, -1.380736, 1, 0, 0, 1, 1,
-0.8288433, -1.286209, -2.900909, 0, 0, 0, 1, 1,
-0.8251429, 0.05110354, -1.539038, 0, 0, 0, 1, 1,
-0.8250172, -1.87264, -2.952382, 0, 0, 0, 1, 1,
-0.824858, 0.8870422, -2.034432, 0, 0, 0, 1, 1,
-0.8171786, 0.560932, -1.113764, 0, 0, 0, 1, 1,
-0.8129378, 0.02776138, -2.641242, 0, 0, 0, 1, 1,
-0.8112361, 0.841122, -0.09000723, 0, 0, 0, 1, 1,
-0.8081269, -0.2729384, -0.7532796, 1, 1, 1, 1, 1,
-0.8076947, 0.8084697, -0.9483854, 1, 1, 1, 1, 1,
-0.8047733, 0.6351709, -0.3253669, 1, 1, 1, 1, 1,
-0.7983068, -0.5526776, -2.57725, 1, 1, 1, 1, 1,
-0.7964697, -1.170779, -2.875897, 1, 1, 1, 1, 1,
-0.7959714, 0.7887865, -1.426784, 1, 1, 1, 1, 1,
-0.7945766, -0.5349856, -1.350673, 1, 1, 1, 1, 1,
-0.7934948, -1.030675, -1.307149, 1, 1, 1, 1, 1,
-0.7914839, -2.635204, -2.831207, 1, 1, 1, 1, 1,
-0.7897425, -0.1063493, -3.380637, 1, 1, 1, 1, 1,
-0.7896661, -0.5180387, -1.958345, 1, 1, 1, 1, 1,
-0.7891394, 1.535007, -0.7296283, 1, 1, 1, 1, 1,
-0.7812663, 0.1061271, -1.722019, 1, 1, 1, 1, 1,
-0.7774407, -1.580648, -1.666006, 1, 1, 1, 1, 1,
-0.7686237, -0.4173704, -2.022559, 1, 1, 1, 1, 1,
-0.7664637, -0.5844286, -0.3089561, 0, 0, 1, 1, 1,
-0.7604825, 1.252718, 0.2776129, 1, 0, 0, 1, 1,
-0.7601351, -1.081218, -2.633781, 1, 0, 0, 1, 1,
-0.7524011, 0.1653169, -0.4499274, 1, 0, 0, 1, 1,
-0.7478762, -1.092541, -3.847589, 1, 0, 0, 1, 1,
-0.7435737, -0.2666751, -2.296407, 1, 0, 0, 1, 1,
-0.7431158, -3.173018, -2.793194, 0, 0, 0, 1, 1,
-0.7406814, 2.038653, -1.104686, 0, 0, 0, 1, 1,
-0.7383198, 1.139744, -1.280043, 0, 0, 0, 1, 1,
-0.735225, 0.5790024, -0.4798249, 0, 0, 0, 1, 1,
-0.7343229, -0.7153638, -2.934288, 0, 0, 0, 1, 1,
-0.733888, 1.418909, -1.704561, 0, 0, 0, 1, 1,
-0.7228106, 0.8411697, -1.59281, 0, 0, 0, 1, 1,
-0.7153259, 0.2294545, -3.29244, 1, 1, 1, 1, 1,
-0.7137826, 0.445137, -0.8726492, 1, 1, 1, 1, 1,
-0.7026918, -0.7216841, -3.200825, 1, 1, 1, 1, 1,
-0.7019855, 0.9355009, -0.2035808, 1, 1, 1, 1, 1,
-0.7015693, -1.210809, -3.317939, 1, 1, 1, 1, 1,
-0.7014661, 0.3581811, -0.6789235, 1, 1, 1, 1, 1,
-0.6981559, -0.7628489, -2.98243, 1, 1, 1, 1, 1,
-0.6974767, 0.3667929, 0.3776555, 1, 1, 1, 1, 1,
-0.6970122, -0.4791295, -4.034402, 1, 1, 1, 1, 1,
-0.6964203, 0.08281059, -0.2958646, 1, 1, 1, 1, 1,
-0.6897979, -0.984106, -3.411051, 1, 1, 1, 1, 1,
-0.6882973, 0.9308516, -0.9805183, 1, 1, 1, 1, 1,
-0.6876369, -0.7491049, -2.857939, 1, 1, 1, 1, 1,
-0.6870874, -0.7479256, -2.615725, 1, 1, 1, 1, 1,
-0.6824054, -0.8300524, -2.645804, 1, 1, 1, 1, 1,
-0.6808091, -0.4150597, -4.247019, 0, 0, 1, 1, 1,
-0.6793589, -0.2166681, -2.365837, 1, 0, 0, 1, 1,
-0.6780753, -0.6238917, -2.911007, 1, 0, 0, 1, 1,
-0.6773358, 0.2443654, 0.05337949, 1, 0, 0, 1, 1,
-0.6729848, -2.567544, -3.818505, 1, 0, 0, 1, 1,
-0.6685128, 1.520113, -0.5607777, 1, 0, 0, 1, 1,
-0.6527935, 2.486347, -0.7224527, 0, 0, 0, 1, 1,
-0.6500018, -1.468293, -4.092584, 0, 0, 0, 1, 1,
-0.6491222, 1.577349, 0.5503478, 0, 0, 0, 1, 1,
-0.6390432, 0.8108466, -0.3094838, 0, 0, 0, 1, 1,
-0.6377113, -0.2483621, -3.283824, 0, 0, 0, 1, 1,
-0.6368303, 0.1744778, 0.3584219, 0, 0, 0, 1, 1,
-0.6354988, -0.7080603, -1.869807, 0, 0, 0, 1, 1,
-0.626321, 0.5276458, -2.176572, 1, 1, 1, 1, 1,
-0.6233122, 1.180583, 0.4332341, 1, 1, 1, 1, 1,
-0.6231813, 1.809968, -0.6377718, 1, 1, 1, 1, 1,
-0.6195132, 0.07645329, 1.046891, 1, 1, 1, 1, 1,
-0.6169974, 1.16828, -1.880728, 1, 1, 1, 1, 1,
-0.6161444, -0.1684843, -1.983671, 1, 1, 1, 1, 1,
-0.6138519, -0.001775743, -0.5368167, 1, 1, 1, 1, 1,
-0.6070576, 0.9624387, 0.3701756, 1, 1, 1, 1, 1,
-0.6030502, 0.4374923, -0.9729552, 1, 1, 1, 1, 1,
-0.6003049, 0.7717427, -0.4747826, 1, 1, 1, 1, 1,
-0.5985971, 1.733011, -0.2809047, 1, 1, 1, 1, 1,
-0.5913919, 0.6136622, -1.249115, 1, 1, 1, 1, 1,
-0.5910447, 0.1726752, -2.147259, 1, 1, 1, 1, 1,
-0.5903932, -0.8171272, -0.8173407, 1, 1, 1, 1, 1,
-0.5846567, -1.437557, -4.489474, 1, 1, 1, 1, 1,
-0.5819083, -0.8738804, -2.763362, 0, 0, 1, 1, 1,
-0.5698944, -0.7903324, -1.347993, 1, 0, 0, 1, 1,
-0.5683318, -0.9217677, -2.484196, 1, 0, 0, 1, 1,
-0.5644488, 1.915283, -0.2590958, 1, 0, 0, 1, 1,
-0.5628099, 0.8677219, -1.523032, 1, 0, 0, 1, 1,
-0.5543212, 1.160005, 0.5646757, 1, 0, 0, 1, 1,
-0.5540566, -0.2232863, -1.613617, 0, 0, 0, 1, 1,
-0.5519759, -0.8725359, -1.243618, 0, 0, 0, 1, 1,
-0.5508862, -0.03044055, -1.876731, 0, 0, 0, 1, 1,
-0.5500333, -0.7477746, -3.574884, 0, 0, 0, 1, 1,
-0.5497333, -1.609613, -1.559489, 0, 0, 0, 1, 1,
-0.5486484, -1.996703, -5.038209, 0, 0, 0, 1, 1,
-0.5476254, -1.141941, -2.586416, 0, 0, 0, 1, 1,
-0.5448151, -0.7839758, -3.121128, 1, 1, 1, 1, 1,
-0.5419149, 0.6994658, -1.569619, 1, 1, 1, 1, 1,
-0.5406975, -0.2741719, -1.7934, 1, 1, 1, 1, 1,
-0.5367282, -1.253529, -4.81848, 1, 1, 1, 1, 1,
-0.5353574, 0.2740092, -2.244017, 1, 1, 1, 1, 1,
-0.5286828, 1.334714, -0.2875188, 1, 1, 1, 1, 1,
-0.5250758, -0.6278452, -2.119934, 1, 1, 1, 1, 1,
-0.5232889, 0.5253895, -0.4528861, 1, 1, 1, 1, 1,
-0.522395, -0.01195425, -0.3743298, 1, 1, 1, 1, 1,
-0.5113484, -1.277168, -3.37458, 1, 1, 1, 1, 1,
-0.5090039, -0.5186164, -3.560464, 1, 1, 1, 1, 1,
-0.508912, -0.1791562, -4.103933, 1, 1, 1, 1, 1,
-0.5021289, 0.9521254, 0.1726254, 1, 1, 1, 1, 1,
-0.4982998, 0.324679, -0.9723105, 1, 1, 1, 1, 1,
-0.4967158, 0.8063349, -0.9470996, 1, 1, 1, 1, 1,
-0.4925868, -1.159365, -2.937467, 0, 0, 1, 1, 1,
-0.488113, 0.255522, -1.655264, 1, 0, 0, 1, 1,
-0.4841611, -0.3412846, 0.2350402, 1, 0, 0, 1, 1,
-0.4815857, 0.1350226, -2.162256, 1, 0, 0, 1, 1,
-0.4780779, 1.340517, -0.3061757, 1, 0, 0, 1, 1,
-0.4770054, 0.067338, -1.496654, 1, 0, 0, 1, 1,
-0.4741331, 0.3331964, 0.7752748, 0, 0, 0, 1, 1,
-0.471768, 0.08111704, -1.666128, 0, 0, 0, 1, 1,
-0.4714626, -0.003601463, -2.280044, 0, 0, 0, 1, 1,
-0.4682981, 0.7916534, -0.8338882, 0, 0, 0, 1, 1,
-0.4643885, -0.6006154, -0.8185652, 0, 0, 0, 1, 1,
-0.4630935, -0.8735768, -1.099046, 0, 0, 0, 1, 1,
-0.4586283, 0.4508457, 0.1190558, 0, 0, 0, 1, 1,
-0.4573515, -2.787951, -3.966312, 1, 1, 1, 1, 1,
-0.4547082, 0.7466509, -0.5067855, 1, 1, 1, 1, 1,
-0.4511168, -1.791624, -0.9984072, 1, 1, 1, 1, 1,
-0.4485413, 1.951062, -1.237403, 1, 1, 1, 1, 1,
-0.4456766, -0.7699787, -2.480799, 1, 1, 1, 1, 1,
-0.4441788, -0.5004358, -0.9860945, 1, 1, 1, 1, 1,
-0.442838, -0.8795725, -3.588743, 1, 1, 1, 1, 1,
-0.4419326, 0.2220662, -2.952512, 1, 1, 1, 1, 1,
-0.441917, -0.1103987, -3.02104, 1, 1, 1, 1, 1,
-0.4415479, 0.8218893, 0.1840882, 1, 1, 1, 1, 1,
-0.441191, -2.039169, -3.506883, 1, 1, 1, 1, 1,
-0.4393943, -0.3176715, -4.084977, 1, 1, 1, 1, 1,
-0.4389865, 1.311765, 1.899576, 1, 1, 1, 1, 1,
-0.4373312, -0.9977756, -2.605683, 1, 1, 1, 1, 1,
-0.4289184, -0.4398734, -2.143844, 1, 1, 1, 1, 1,
-0.4270743, 1.080349, -0.9572, 0, 0, 1, 1, 1,
-0.4267646, -1.664027, -1.980634, 1, 0, 0, 1, 1,
-0.4267528, 0.3848077, -1.48194, 1, 0, 0, 1, 1,
-0.4256855, -0.2648514, -1.316, 1, 0, 0, 1, 1,
-0.4253886, -2.561319, -2.55863, 1, 0, 0, 1, 1,
-0.4192055, -1.87377, -3.307739, 1, 0, 0, 1, 1,
-0.4183169, 0.1975468, -1.180227, 0, 0, 0, 1, 1,
-0.4125496, 1.324595, -0.822759, 0, 0, 0, 1, 1,
-0.4087482, -0.1153463, -2.801212, 0, 0, 0, 1, 1,
-0.4006943, 0.7112112, -0.5863432, 0, 0, 0, 1, 1,
-0.4000471, -2.071675, -2.188383, 0, 0, 0, 1, 1,
-0.3961166, 0.5096141, -2.373681, 0, 0, 0, 1, 1,
-0.3920937, 0.398995, -1.298159, 0, 0, 0, 1, 1,
-0.3908367, 1.630852, -1.793794, 1, 1, 1, 1, 1,
-0.3881935, -0.2180672, -1.758897, 1, 1, 1, 1, 1,
-0.3820038, -0.6214952, -3.530155, 1, 1, 1, 1, 1,
-0.3789823, -1.068613, -2.424571, 1, 1, 1, 1, 1,
-0.3749936, -0.6949268, -2.59443, 1, 1, 1, 1, 1,
-0.3749361, -2.125765, -2.122969, 1, 1, 1, 1, 1,
-0.37349, 1.007666, -0.1495604, 1, 1, 1, 1, 1,
-0.3708377, 0.9585084, 0.4914065, 1, 1, 1, 1, 1,
-0.3628959, 0.5896696, -0.8173074, 1, 1, 1, 1, 1,
-0.3597273, -0.1797982, -0.7045708, 1, 1, 1, 1, 1,
-0.3587316, -1.15132, -3.8488, 1, 1, 1, 1, 1,
-0.3572733, 0.329934, 0.5637733, 1, 1, 1, 1, 1,
-0.3511763, -0.8754244, -2.001944, 1, 1, 1, 1, 1,
-0.3506214, 0.6735052, -1.700232, 1, 1, 1, 1, 1,
-0.3474983, 1.156697, -0.5980645, 1, 1, 1, 1, 1,
-0.3427459, -0.3480853, -3.312607, 0, 0, 1, 1, 1,
-0.3414228, -0.3352322, -1.489626, 1, 0, 0, 1, 1,
-0.3368739, -0.1912089, -3.34478, 1, 0, 0, 1, 1,
-0.3363563, -1.001525, -2.436984, 1, 0, 0, 1, 1,
-0.333795, -0.08703861, -1.978775, 1, 0, 0, 1, 1,
-0.3301118, -0.1135907, -1.884113, 1, 0, 0, 1, 1,
-0.3300797, -1.102798, -2.035659, 0, 0, 0, 1, 1,
-0.3263164, -0.00778843, -2.521147, 0, 0, 0, 1, 1,
-0.3254135, -0.5876901, -2.833126, 0, 0, 0, 1, 1,
-0.3176626, 0.8803756, -1.351171, 0, 0, 0, 1, 1,
-0.3084267, 2.069251, -0.6956804, 0, 0, 0, 1, 1,
-0.3039983, 0.2416233, -1.337471, 0, 0, 0, 1, 1,
-0.3017503, -0.9299925, -2.827397, 0, 0, 0, 1, 1,
-0.2983694, 0.2899552, -0.2402708, 1, 1, 1, 1, 1,
-0.2981348, 0.2265821, -2.102693, 1, 1, 1, 1, 1,
-0.2940046, 0.9340889, 0.3866341, 1, 1, 1, 1, 1,
-0.2938134, 0.1315152, -1.506533, 1, 1, 1, 1, 1,
-0.292987, 3.108243, 0.2056635, 1, 1, 1, 1, 1,
-0.2872976, 0.9639936, 0.7849932, 1, 1, 1, 1, 1,
-0.2833459, 0.5745097, -1.463982, 1, 1, 1, 1, 1,
-0.281344, 0.8728866, -2.091388, 1, 1, 1, 1, 1,
-0.2786218, -1.187246, -2.752362, 1, 1, 1, 1, 1,
-0.2761637, 0.01886897, -0.5385594, 1, 1, 1, 1, 1,
-0.2746427, -0.1149297, -3.126226, 1, 1, 1, 1, 1,
-0.2742046, 0.1092732, -0.990554, 1, 1, 1, 1, 1,
-0.2663063, 0.6703874, -0.2558566, 1, 1, 1, 1, 1,
-0.2661732, -0.02259939, -0.6982392, 1, 1, 1, 1, 1,
-0.26438, 1.662962, -0.4328499, 1, 1, 1, 1, 1,
-0.2636708, -1.501211, -1.338033, 0, 0, 1, 1, 1,
-0.248393, -2.526201, -3.0317, 1, 0, 0, 1, 1,
-0.2455538, -1.115271, -2.240713, 1, 0, 0, 1, 1,
-0.2412585, -0.3316434, -1.394586, 1, 0, 0, 1, 1,
-0.23958, -0.2546557, -1.823628, 1, 0, 0, 1, 1,
-0.2371116, -1.32885, -3.625046, 1, 0, 0, 1, 1,
-0.2358497, 0.2005691, -0.8238494, 0, 0, 0, 1, 1,
-0.2332069, -1.373692, -1.16896, 0, 0, 0, 1, 1,
-0.2329279, 1.608803, 0.6595685, 0, 0, 0, 1, 1,
-0.2324537, -0.2276785, -4.623283, 0, 0, 0, 1, 1,
-0.226888, 0.5183017, 1.235343, 0, 0, 0, 1, 1,
-0.225856, -0.6180118, -2.795894, 0, 0, 0, 1, 1,
-0.2186638, -1.859172, -4.408291, 0, 0, 0, 1, 1,
-0.2155475, 1.125317, 0.3099623, 1, 1, 1, 1, 1,
-0.2141766, -0.7189537, -2.896663, 1, 1, 1, 1, 1,
-0.2119829, 0.4579326, -0.6183333, 1, 1, 1, 1, 1,
-0.2115638, -0.7550942, -2.769018, 1, 1, 1, 1, 1,
-0.2074381, -0.8315151, -3.184443, 1, 1, 1, 1, 1,
-0.2060315, 1.77166, -1.268478, 1, 1, 1, 1, 1,
-0.2005728, -0.1406861, -3.080737, 1, 1, 1, 1, 1,
-0.2001812, -0.9237933, -3.055798, 1, 1, 1, 1, 1,
-0.1990765, -0.0004890205, -1.01369, 1, 1, 1, 1, 1,
-0.194053, -0.1657422, -2.74199, 1, 1, 1, 1, 1,
-0.1888741, -0.119085, -2.463198, 1, 1, 1, 1, 1,
-0.1880702, -0.2767732, -2.515696, 1, 1, 1, 1, 1,
-0.1864885, 1.205285, 0.7465951, 1, 1, 1, 1, 1,
-0.1838232, 1.332587, 0.617345, 1, 1, 1, 1, 1,
-0.1723459, 0.7862556, -0.3100303, 1, 1, 1, 1, 1,
-0.1700675, -0.1456156, -2.393152, 0, 0, 1, 1, 1,
-0.163677, 0.01597283, -2.024469, 1, 0, 0, 1, 1,
-0.1635549, 1.984778, 0.9391673, 1, 0, 0, 1, 1,
-0.1633845, 0.8882341, -0.6109119, 1, 0, 0, 1, 1,
-0.1592872, 0.6956339, -0.5963681, 1, 0, 0, 1, 1,
-0.1544349, 0.673866, 0.4347292, 1, 0, 0, 1, 1,
-0.1468553, 1.098413, 1.709178, 0, 0, 0, 1, 1,
-0.1466824, 0.5844656, -0.7695876, 0, 0, 0, 1, 1,
-0.1454813, -0.06935314, -1.988016, 0, 0, 0, 1, 1,
-0.1451873, 0.2751429, -0.9589251, 0, 0, 0, 1, 1,
-0.1437407, 0.4758102, 0.06959127, 0, 0, 0, 1, 1,
-0.1374862, 1.714194, 0.3241686, 0, 0, 0, 1, 1,
-0.1328591, -0.2402925, -1.713321, 0, 0, 0, 1, 1,
-0.1292153, 0.9788207, -0.3570234, 1, 1, 1, 1, 1,
-0.1263088, 0.6289217, -0.511695, 1, 1, 1, 1, 1,
-0.1248521, 1.562075, 1.406775, 1, 1, 1, 1, 1,
-0.1247616, 0.1755599, -1.516057, 1, 1, 1, 1, 1,
-0.1223932, -0.3050875, -3.498393, 1, 1, 1, 1, 1,
-0.1212404, 0.7616501, -0.6475723, 1, 1, 1, 1, 1,
-0.1207385, -0.5324481, -0.7323405, 1, 1, 1, 1, 1,
-0.1194194, -0.7676545, -2.486164, 1, 1, 1, 1, 1,
-0.1181842, 0.6732054, 0.5274664, 1, 1, 1, 1, 1,
-0.1178307, 1.307967, -1.79936, 1, 1, 1, 1, 1,
-0.1156508, -1.593684, -4.001574, 1, 1, 1, 1, 1,
-0.1086382, -0.6051363, -1.669281, 1, 1, 1, 1, 1,
-0.1085024, -0.758653, -4.482392, 1, 1, 1, 1, 1,
-0.1075958, 0.8363491, 0.01294265, 1, 1, 1, 1, 1,
-0.1049129, -1.111377, -2.59474, 1, 1, 1, 1, 1,
-0.102759, -1.175613, -5.296972, 0, 0, 1, 1, 1,
-0.1014986, 0.325182, 0.4005845, 1, 0, 0, 1, 1,
-0.09602975, 0.5822956, 0.4700586, 1, 0, 0, 1, 1,
-0.09415101, -0.3460495, -2.921315, 1, 0, 0, 1, 1,
-0.09236109, -0.7412459, -2.438922, 1, 0, 0, 1, 1,
-0.08932155, -0.3779572, -1.953365, 1, 0, 0, 1, 1,
-0.08727857, 1.017452, 0.7361294, 0, 0, 0, 1, 1,
-0.08484839, 0.01359387, -1.326986, 0, 0, 0, 1, 1,
-0.08374295, -0.3802719, -1.424682, 0, 0, 0, 1, 1,
-0.08224013, -0.8155329, -3.360601, 0, 0, 0, 1, 1,
-0.07917857, 0.2235934, -1.644102, 0, 0, 0, 1, 1,
-0.0782012, -1.796419, -3.225182, 0, 0, 0, 1, 1,
-0.07793264, 1.287918, -0.1338545, 0, 0, 0, 1, 1,
-0.07563093, -1.104195, -2.095732, 1, 1, 1, 1, 1,
-0.07544886, -0.8346008, -2.672786, 1, 1, 1, 1, 1,
-0.07406647, 1.154645, 0.08443049, 1, 1, 1, 1, 1,
-0.07090589, 0.236552, 0.5418388, 1, 1, 1, 1, 1,
-0.07074566, 0.1160668, -0.6402782, 1, 1, 1, 1, 1,
-0.07028943, 0.8996582, -0.186893, 1, 1, 1, 1, 1,
-0.06688084, -0.5395472, -2.48935, 1, 1, 1, 1, 1,
-0.06191529, 0.8028634, 0.3365366, 1, 1, 1, 1, 1,
-0.05853187, 0.06325632, 0.4483374, 1, 1, 1, 1, 1,
-0.05702048, -1.103465, -3.916213, 1, 1, 1, 1, 1,
-0.05686327, -0.3184215, -3.103069, 1, 1, 1, 1, 1,
-0.05495847, 2.256595, 2.016464, 1, 1, 1, 1, 1,
-0.05440264, -0.3664387, -4.556608, 1, 1, 1, 1, 1,
-0.05171189, -0.6823817, -4.506041, 1, 1, 1, 1, 1,
-0.05168061, 1.32428, 1.117858, 1, 1, 1, 1, 1,
-0.04847194, -0.09462827, -3.465783, 0, 0, 1, 1, 1,
-0.04762334, 1.849156, 1.015878, 1, 0, 0, 1, 1,
-0.0403787, 0.6117365, 0.302137, 1, 0, 0, 1, 1,
-0.03950515, -0.7664644, -4.438348, 1, 0, 0, 1, 1,
-0.03892389, -0.4666806, -2.329518, 1, 0, 0, 1, 1,
-0.03042267, -0.4323913, -1.7982, 1, 0, 0, 1, 1,
-0.02812071, -2.048014, -2.836325, 0, 0, 0, 1, 1,
-0.02675784, -0.793893, -3.776821, 0, 0, 0, 1, 1,
-0.02657593, 1.286145, -0.4687605, 0, 0, 0, 1, 1,
-0.02643795, 0.8018492, -1.107668, 0, 0, 0, 1, 1,
-0.02592178, 0.3945679, 0.155835, 0, 0, 0, 1, 1,
-0.0235564, 1.186111, 0.363723, 0, 0, 0, 1, 1,
-0.01935328, 0.314484, -0.6249792, 0, 0, 0, 1, 1,
-0.01797564, -1.001855, -3.675019, 1, 1, 1, 1, 1,
-0.01636152, 0.1926126, 0.3707319, 1, 1, 1, 1, 1,
-0.01276366, -0.7504207, -0.8795887, 1, 1, 1, 1, 1,
-0.01148502, -1.09594, -5.257523, 1, 1, 1, 1, 1,
-0.01049346, 0.6338956, 0.4156364, 1, 1, 1, 1, 1,
-0.01005333, 2.183518, 1.110122, 1, 1, 1, 1, 1,
-0.009009488, -0.6130984, -4.485134, 1, 1, 1, 1, 1,
-0.004565019, 1.337959, 0.7982955, 1, 1, 1, 1, 1,
0.0002537577, -1.017801, 3.48826, 1, 1, 1, 1, 1,
0.002010169, 0.4130054, -0.1653762, 1, 1, 1, 1, 1,
0.003556176, 0.4768125, -1.031494, 1, 1, 1, 1, 1,
0.005746732, 0.7597265, 1.285801, 1, 1, 1, 1, 1,
0.006923673, 1.014277, -0.3544325, 1, 1, 1, 1, 1,
0.00715409, -0.3455408, 3.51875, 1, 1, 1, 1, 1,
0.01094124, 0.9037051, -0.05358551, 1, 1, 1, 1, 1,
0.011822, 0.757594, -0.6845907, 0, 0, 1, 1, 1,
0.01424875, 1.823366, 0.4259406, 1, 0, 0, 1, 1,
0.01540589, 1.419104, -1.539055, 1, 0, 0, 1, 1,
0.03242211, 0.6010199, -0.1500097, 1, 0, 0, 1, 1,
0.03258603, 0.5367872, 0.3170775, 1, 0, 0, 1, 1,
0.03542849, -1.567986, 3.015928, 1, 0, 0, 1, 1,
0.03748356, -0.3015547, 4.367719, 0, 0, 0, 1, 1,
0.04354814, -1.177531, 2.871877, 0, 0, 0, 1, 1,
0.04678189, -1.030516, 1.23095, 0, 0, 0, 1, 1,
0.04819778, 1.281483, 0.7310526, 0, 0, 0, 1, 1,
0.05436384, -1.742801, 5.120519, 0, 0, 0, 1, 1,
0.05498527, 0.9552715, -0.8684891, 0, 0, 0, 1, 1,
0.05623684, 1.77263, 1.70823, 0, 0, 0, 1, 1,
0.05741374, 0.2026896, 0.867152, 1, 1, 1, 1, 1,
0.0593528, -0.7223613, 4.575773, 1, 1, 1, 1, 1,
0.05938185, 0.7979224, -0.4439104, 1, 1, 1, 1, 1,
0.06249505, -0.0784884, 2.678338, 1, 1, 1, 1, 1,
0.06423241, -0.4700455, 1.910434, 1, 1, 1, 1, 1,
0.0655597, 1.83971, -0.3420542, 1, 1, 1, 1, 1,
0.06583792, -0.6005867, 1.363174, 1, 1, 1, 1, 1,
0.0662815, 0.316398, 1.075897, 1, 1, 1, 1, 1,
0.06841499, 0.5979134, -0.9030421, 1, 1, 1, 1, 1,
0.07164096, -1.053387, 2.435294, 1, 1, 1, 1, 1,
0.07381156, 0.1677273, 0.5321808, 1, 1, 1, 1, 1,
0.07685725, 0.9939706, 1.120078, 1, 1, 1, 1, 1,
0.08177704, 0.895902, -0.1265525, 1, 1, 1, 1, 1,
0.0895061, -1.352036, 4.875693, 1, 1, 1, 1, 1,
0.08976106, -0.4545824, 4.944177, 1, 1, 1, 1, 1,
0.0984391, -0.3433661, 2.738325, 0, 0, 1, 1, 1,
0.09852435, 0.1807189, 0.4643025, 1, 0, 0, 1, 1,
0.09887652, 1.193885, 2.213507, 1, 0, 0, 1, 1,
0.1009754, 1.158834, 0.1809769, 1, 0, 0, 1, 1,
0.1037112, -0.9543798, 1.996783, 1, 0, 0, 1, 1,
0.103935, 0.03275671, 2.389007, 1, 0, 0, 1, 1,
0.1068273, 1.479833, -0.9453853, 0, 0, 0, 1, 1,
0.1088286, -0.2384544, 2.826345, 0, 0, 0, 1, 1,
0.1121703, -0.7200309, 1.443428, 0, 0, 0, 1, 1,
0.1137691, 1.075851, 0.8526326, 0, 0, 0, 1, 1,
0.1142013, 1.551951, 0.5028653, 0, 0, 0, 1, 1,
0.1150258, -1.897518, 4.46279, 0, 0, 0, 1, 1,
0.1232254, -0.4205574, 2.168814, 0, 0, 0, 1, 1,
0.1238118, -0.8649983, 1.219156, 1, 1, 1, 1, 1,
0.1238446, -0.629666, 4.148731, 1, 1, 1, 1, 1,
0.1247865, 0.4432659, 0.9289671, 1, 1, 1, 1, 1,
0.1258416, -0.2418843, 1.793568, 1, 1, 1, 1, 1,
0.126015, -0.1658759, 2.50282, 1, 1, 1, 1, 1,
0.1309677, 0.1766718, 3.465442, 1, 1, 1, 1, 1,
0.1366123, -0.8731552, 4.063144, 1, 1, 1, 1, 1,
0.138466, 0.8759593, -0.8640127, 1, 1, 1, 1, 1,
0.142725, 0.2332831, 2.013372, 1, 1, 1, 1, 1,
0.1428328, -0.9584716, 5.558338, 1, 1, 1, 1, 1,
0.1431333, 0.8209462, -0.8002492, 1, 1, 1, 1, 1,
0.1457348, 0.3398609, 1.246339, 1, 1, 1, 1, 1,
0.1514472, -1.621109, 2.146258, 1, 1, 1, 1, 1,
0.1612416, 0.3926728, -0.203094, 1, 1, 1, 1, 1,
0.1612528, 0.5400404, -0.4172112, 1, 1, 1, 1, 1,
0.1614981, -0.7824206, 2.297543, 0, 0, 1, 1, 1,
0.163733, -3.199939, 4.960733, 1, 0, 0, 1, 1,
0.1643293, 1.700207, 0.7777337, 1, 0, 0, 1, 1,
0.1645722, -0.3509775, 3.053261, 1, 0, 0, 1, 1,
0.1651514, 1.030161, 0.8620173, 1, 0, 0, 1, 1,
0.1652971, 0.2307768, 0.3146744, 1, 0, 0, 1, 1,
0.1660832, -0.1360232, 2.715669, 0, 0, 0, 1, 1,
0.1664019, 1.408563, -0.4504675, 0, 0, 0, 1, 1,
0.1671172, 0.2957515, 1.689785, 0, 0, 0, 1, 1,
0.1680946, -0.6214316, 2.351838, 0, 0, 0, 1, 1,
0.1681458, 1.79782, -0.9025978, 0, 0, 0, 1, 1,
0.1706582, 0.2160103, 1.723642, 0, 0, 0, 1, 1,
0.1777957, 0.2610846, -0.05549575, 0, 0, 0, 1, 1,
0.1792147, -0.6519253, 1.629879, 1, 1, 1, 1, 1,
0.181222, -0.03166587, 0.8346702, 1, 1, 1, 1, 1,
0.1817967, 2.143954, -1.233039, 1, 1, 1, 1, 1,
0.1825164, 0.4930047, 1.430256, 1, 1, 1, 1, 1,
0.1848245, 0.08782333, 2.610832, 1, 1, 1, 1, 1,
0.1877253, 1.788837, 1.215234, 1, 1, 1, 1, 1,
0.188587, -1.498236, 2.64589, 1, 1, 1, 1, 1,
0.1922917, -1.214752, 3.187924, 1, 1, 1, 1, 1,
0.2033899, -2.031411, 3.577943, 1, 1, 1, 1, 1,
0.2037581, 0.7312623, 0.1284618, 1, 1, 1, 1, 1,
0.2072947, 0.9026398, -1.08031, 1, 1, 1, 1, 1,
0.2073305, -0.7238914, 1.503676, 1, 1, 1, 1, 1,
0.2077218, -1.325205, 3.439474, 1, 1, 1, 1, 1,
0.2100798, -0.06866131, 2.380465, 1, 1, 1, 1, 1,
0.2108316, 0.2824508, 1.381661, 1, 1, 1, 1, 1,
0.212421, 0.2831689, 0.6815807, 0, 0, 1, 1, 1,
0.2141271, -0.755626, 2.42312, 1, 0, 0, 1, 1,
0.2148396, 0.7781295, -0.7699501, 1, 0, 0, 1, 1,
0.2168351, -0.4104939, 3.881361, 1, 0, 0, 1, 1,
0.2184612, -0.155593, 2.727703, 1, 0, 0, 1, 1,
0.225559, -0.7938501, 2.676721, 1, 0, 0, 1, 1,
0.2255607, -0.2291078, 2.152147, 0, 0, 0, 1, 1,
0.228972, 0.5151756, -1.606513, 0, 0, 0, 1, 1,
0.2305319, 1.393815, 0.4376051, 0, 0, 0, 1, 1,
0.2374648, 0.3061611, 1.010546, 0, 0, 0, 1, 1,
0.2375454, 0.5722328, -0.6200546, 0, 0, 0, 1, 1,
0.2381593, -0.1751494, 2.532027, 0, 0, 0, 1, 1,
0.2445534, -0.40387, 2.284655, 0, 0, 0, 1, 1,
0.2473277, -0.1449129, 1.71034, 1, 1, 1, 1, 1,
0.2477559, -0.3708671, 4.235376, 1, 1, 1, 1, 1,
0.2482367, -1.022528, 2.868256, 1, 1, 1, 1, 1,
0.250717, -3.207891, 3.331151, 1, 1, 1, 1, 1,
0.2616087, 0.3009112, 0.8873695, 1, 1, 1, 1, 1,
0.2621861, -0.284041, 3.578087, 1, 1, 1, 1, 1,
0.2654501, 0.1837861, 1.630877, 1, 1, 1, 1, 1,
0.2660422, -0.9492754, 3.267273, 1, 1, 1, 1, 1,
0.2661775, 0.1268532, 2.212937, 1, 1, 1, 1, 1,
0.2680554, -0.1863407, 1.200955, 1, 1, 1, 1, 1,
0.2704691, 0.3612739, 0.2655758, 1, 1, 1, 1, 1,
0.2723351, 1.528254, 0.1811575, 1, 1, 1, 1, 1,
0.2755435, -0.6313441, 3.429686, 1, 1, 1, 1, 1,
0.27828, 0.8370928, 2.899024, 1, 1, 1, 1, 1,
0.2801959, -0.3831388, 2.496792, 1, 1, 1, 1, 1,
0.2854254, -0.03755785, 2.033782, 0, 0, 1, 1, 1,
0.2912485, -0.2449241, 1.643645, 1, 0, 0, 1, 1,
0.2913636, -0.8973973, 3.222134, 1, 0, 0, 1, 1,
0.2926257, -0.1763442, 1.70082, 1, 0, 0, 1, 1,
0.2955629, -0.3688468, 1.451826, 1, 0, 0, 1, 1,
0.2961578, 0.4358813, -0.008449322, 1, 0, 0, 1, 1,
0.2977696, -1.023082, 3.771127, 0, 0, 0, 1, 1,
0.2979834, 0.04878174, 0.6415555, 0, 0, 0, 1, 1,
0.3003291, -0.4662105, 1.482741, 0, 0, 0, 1, 1,
0.3023017, 0.1859784, 0.8056281, 0, 0, 0, 1, 1,
0.3073484, 0.1953478, 0.6915646, 0, 0, 0, 1, 1,
0.3163607, -0.3381402, 1.539797, 0, 0, 0, 1, 1,
0.3186474, -0.9700127, 3.266233, 0, 0, 0, 1, 1,
0.3216186, 1.561499, -1.393634, 1, 1, 1, 1, 1,
0.3219715, -0.135786, 2.018514, 1, 1, 1, 1, 1,
0.3227065, 1.068434, 1.888251, 1, 1, 1, 1, 1,
0.3294938, 0.3160608, 3.008868, 1, 1, 1, 1, 1,
0.3303109, -0.7906554, 3.109701, 1, 1, 1, 1, 1,
0.3334976, -0.08391769, 3.166919, 1, 1, 1, 1, 1,
0.334671, 1.070805, 0.8819491, 1, 1, 1, 1, 1,
0.3356457, 0.1512082, 0.3725629, 1, 1, 1, 1, 1,
0.3365189, 0.4824792, 0.5453848, 1, 1, 1, 1, 1,
0.3385662, 0.8123997, 0.4444583, 1, 1, 1, 1, 1,
0.339248, -0.5893408, 3.577822, 1, 1, 1, 1, 1,
0.3401123, 0.7269963, -0.4836479, 1, 1, 1, 1, 1,
0.3401863, 1.639362, 0.06205952, 1, 1, 1, 1, 1,
0.3535672, -2.445895, 2.779974, 1, 1, 1, 1, 1,
0.3608532, 0.04213858, -0.1578704, 1, 1, 1, 1, 1,
0.3623382, 0.07884572, 1.933793, 0, 0, 1, 1, 1,
0.3633012, -0.0900567, 1.688215, 1, 0, 0, 1, 1,
0.3652625, -0.0003762992, 1.51956, 1, 0, 0, 1, 1,
0.3720622, -0.5648591, 3.740383, 1, 0, 0, 1, 1,
0.3754728, 1.528654, -0.4957251, 1, 0, 0, 1, 1,
0.3821788, -1.435993, 2.144219, 1, 0, 0, 1, 1,
0.3833006, 1.729507, 0.9542969, 0, 0, 0, 1, 1,
0.3848375, 0.4544997, 0.841473, 0, 0, 0, 1, 1,
0.3858878, -1.26299, 3.082845, 0, 0, 0, 1, 1,
0.3869955, 0.8664849, 0.7096752, 0, 0, 0, 1, 1,
0.3871354, -0.854948, 2.719297, 0, 0, 0, 1, 1,
0.3876531, 0.2372405, 2.147774, 0, 0, 0, 1, 1,
0.390744, 1.001365, -0.3286239, 0, 0, 0, 1, 1,
0.3945678, -0.6526029, 2.425307, 1, 1, 1, 1, 1,
0.3981471, 0.3282965, 1.27344, 1, 1, 1, 1, 1,
0.4004585, 1.436273, 0.0574184, 1, 1, 1, 1, 1,
0.4007718, 1.704342, 0.05494972, 1, 1, 1, 1, 1,
0.400849, 0.1495742, 1.302186, 1, 1, 1, 1, 1,
0.4056484, -1.411156, 3.343449, 1, 1, 1, 1, 1,
0.4073875, -1.021387, 3.209305, 1, 1, 1, 1, 1,
0.4151871, -1.657256, 3.914006, 1, 1, 1, 1, 1,
0.4180695, 1.692523, 1.045191, 1, 1, 1, 1, 1,
0.4241005, 0.5126374, 1.604917, 1, 1, 1, 1, 1,
0.4272101, -0.9262289, 2.67554, 1, 1, 1, 1, 1,
0.4304947, -0.832158, 3.076937, 1, 1, 1, 1, 1,
0.432075, -1.143776, 2.346122, 1, 1, 1, 1, 1,
0.4331425, -0.4048905, 3.684752, 1, 1, 1, 1, 1,
0.4368657, 1.170505, -0.3485375, 1, 1, 1, 1, 1,
0.4377015, -1.863257, 4.565492, 0, 0, 1, 1, 1,
0.4395378, 0.4094324, 1.77942, 1, 0, 0, 1, 1,
0.4400406, 0.6825436, 1.349478, 1, 0, 0, 1, 1,
0.4432739, 0.7386505, 0.8900194, 1, 0, 0, 1, 1,
0.4466875, -0.4343935, 4.898441, 1, 0, 0, 1, 1,
0.4482578, -0.2022779, 2.944168, 1, 0, 0, 1, 1,
0.4513457, 0.8691, 1.623429, 0, 0, 0, 1, 1,
0.4536504, -0.9013884, 1.048016, 0, 0, 0, 1, 1,
0.45905, -0.4897093, 2.521877, 0, 0, 0, 1, 1,
0.4600222, 1.085679, 2.223195, 0, 0, 0, 1, 1,
0.4609653, 0.03016994, 2.657678, 0, 0, 0, 1, 1,
0.4611888, 0.59009, 1.342016, 0, 0, 0, 1, 1,
0.4644714, -0.1928426, 2.845341, 0, 0, 0, 1, 1,
0.4671867, -0.193527, 2.216098, 1, 1, 1, 1, 1,
0.4689671, 1.560024, 0.3800405, 1, 1, 1, 1, 1,
0.4701757, -1.977346, 3.783341, 1, 1, 1, 1, 1,
0.4761367, -2.351286, 2.842675, 1, 1, 1, 1, 1,
0.4796563, -0.113553, 2.552284, 1, 1, 1, 1, 1,
0.4820738, -0.3825796, 2.91351, 1, 1, 1, 1, 1,
0.4910012, 0.01968994, 1.628261, 1, 1, 1, 1, 1,
0.4942629, -0.1235218, 1.108951, 1, 1, 1, 1, 1,
0.5068994, 2.446535, 1.724541, 1, 1, 1, 1, 1,
0.5069072, -1.166865, 1.54208, 1, 1, 1, 1, 1,
0.5080687, -0.5589595, 2.888539, 1, 1, 1, 1, 1,
0.5090492, -0.4067542, 1.930684, 1, 1, 1, 1, 1,
0.5115728, -0.005715745, 1.730494, 1, 1, 1, 1, 1,
0.5130309, -1.797135, 2.146667, 1, 1, 1, 1, 1,
0.5197462, -0.320459, 3.005772, 1, 1, 1, 1, 1,
0.5201088, -0.1987347, -0.08010656, 0, 0, 1, 1, 1,
0.5246289, 0.9943143, -1.036685, 1, 0, 0, 1, 1,
0.5263882, 0.8603536, -0.3700156, 1, 0, 0, 1, 1,
0.5277568, -1.385999, 3.53421, 1, 0, 0, 1, 1,
0.5287173, -0.3598422, 1.238259, 1, 0, 0, 1, 1,
0.5362787, 0.319093, 1.54285, 1, 0, 0, 1, 1,
0.5411638, -0.6920349, 2.201962, 0, 0, 0, 1, 1,
0.5434466, 0.4161772, -0.05622331, 0, 0, 0, 1, 1,
0.543753, 0.7104709, 1.308454, 0, 0, 0, 1, 1,
0.5471719, -2.414214, 0.8558062, 0, 0, 0, 1, 1,
0.5479898, 0.1406878, 0.975164, 0, 0, 0, 1, 1,
0.5481387, -0.03221893, 1.879366, 0, 0, 0, 1, 1,
0.5485687, 1.15127, -0.07789763, 0, 0, 0, 1, 1,
0.5497909, -0.02878691, 3.142603, 1, 1, 1, 1, 1,
0.5504925, 1.610923, -0.4324972, 1, 1, 1, 1, 1,
0.551157, 0.1188696, 2.16536, 1, 1, 1, 1, 1,
0.5519519, -2.2848, 2.229772, 1, 1, 1, 1, 1,
0.5579297, 1.076931, -1.060834, 1, 1, 1, 1, 1,
0.5579361, 0.8054138, -0.4052149, 1, 1, 1, 1, 1,
0.5585239, -1.375004, 2.437428, 1, 1, 1, 1, 1,
0.5633866, -0.3144342, 3.065767, 1, 1, 1, 1, 1,
0.5665798, 0.7013761, 3.103848, 1, 1, 1, 1, 1,
0.5690054, -0.01389148, 3.104458, 1, 1, 1, 1, 1,
0.5713487, -0.913498, 3.932859, 1, 1, 1, 1, 1,
0.5741053, -0.5440605, 3.318022, 1, 1, 1, 1, 1,
0.5767734, 1.331088, 1.131839, 1, 1, 1, 1, 1,
0.5776581, 0.5479951, 0.3864789, 1, 1, 1, 1, 1,
0.579763, -0.1237665, 2.552811, 1, 1, 1, 1, 1,
0.5850102, -2.312188, 3.272511, 0, 0, 1, 1, 1,
0.5872849, 0.5422477, 0.717613, 1, 0, 0, 1, 1,
0.5877269, -0.7328713, 1.041922, 1, 0, 0, 1, 1,
0.5886282, -0.7275002, 3.872961, 1, 0, 0, 1, 1,
0.5889971, 0.5282298, 0.1284526, 1, 0, 0, 1, 1,
0.5938908, 1.797166, -1.427989, 1, 0, 0, 1, 1,
0.5945989, -0.5649992, 2.434537, 0, 0, 0, 1, 1,
0.596162, 0.01767165, 0.7817014, 0, 0, 0, 1, 1,
0.6006265, -0.6045411, 3.695201, 0, 0, 0, 1, 1,
0.6007388, 0.7085864, 1.888786, 0, 0, 0, 1, 1,
0.6009969, 0.02866109, -0.0666796, 0, 0, 0, 1, 1,
0.6021134, 0.2566212, 1.715673, 0, 0, 0, 1, 1,
0.6113628, 0.1728708, 0.7658334, 0, 0, 0, 1, 1,
0.6171806, 0.3050346, -0.3442323, 1, 1, 1, 1, 1,
0.6249788, 1.650918, 0.5439866, 1, 1, 1, 1, 1,
0.6259706, -0.8597688, 3.059724, 1, 1, 1, 1, 1,
0.6276234, 0.5422759, 2.893954, 1, 1, 1, 1, 1,
0.6311082, -0.4929449, 0.5373667, 1, 1, 1, 1, 1,
0.6326148, -1.894246, 2.925183, 1, 1, 1, 1, 1,
0.6344179, -0.09391095, 2.202573, 1, 1, 1, 1, 1,
0.6398638, 0.1488106, 0.09925077, 1, 1, 1, 1, 1,
0.6408428, -1.173043, 2.322572, 1, 1, 1, 1, 1,
0.6433974, 0.02637376, 1.740318, 1, 1, 1, 1, 1,
0.6434229, -0.8842824, 1.877581, 1, 1, 1, 1, 1,
0.6451762, -0.8867913, 3.085118, 1, 1, 1, 1, 1,
0.6464069, -1.482506, 3.002473, 1, 1, 1, 1, 1,
0.6468119, 0.008702811, 2.644741, 1, 1, 1, 1, 1,
0.6476653, -1.622263, 1.803398, 1, 1, 1, 1, 1,
0.6511139, 0.4580267, 0.3680362, 0, 0, 1, 1, 1,
0.6606746, 0.833343, 2.5012, 1, 0, 0, 1, 1,
0.6608074, 1.073328, 1.164199, 1, 0, 0, 1, 1,
0.6699391, -1.964426, 3.39656, 1, 0, 0, 1, 1,
0.6709509, 1.161191, -0.5347918, 1, 0, 0, 1, 1,
0.6735496, 0.1242689, 2.372662, 1, 0, 0, 1, 1,
0.6798402, -0.4575509, 3.656501, 0, 0, 0, 1, 1,
0.680115, -0.6167174, 1.439376, 0, 0, 0, 1, 1,
0.6817521, 0.5581524, 2.106178, 0, 0, 0, 1, 1,
0.6854892, -1.264027, 2.597729, 0, 0, 0, 1, 1,
0.6862593, -0.3753176, 2.743403, 0, 0, 0, 1, 1,
0.6875718, 1.271171, 2.297746, 0, 0, 0, 1, 1,
0.6913493, -1.657567, 1.36847, 0, 0, 0, 1, 1,
0.6936414, 0.4110026, 1.453874, 1, 1, 1, 1, 1,
0.6947673, -1.838878, 4.724094, 1, 1, 1, 1, 1,
0.6960906, 0.4246189, 1.916398, 1, 1, 1, 1, 1,
0.7008191, 0.2633676, 1.338425, 1, 1, 1, 1, 1,
0.7023417, -0.4370925, 2.600368, 1, 1, 1, 1, 1,
0.7046384, -0.04507328, 3.303559, 1, 1, 1, 1, 1,
0.70846, -0.9257135, 2.890163, 1, 1, 1, 1, 1,
0.7144178, -0.4618413, 2.677157, 1, 1, 1, 1, 1,
0.7209538, -0.1046838, -0.4400105, 1, 1, 1, 1, 1,
0.7220613, -0.5745354, 3.588692, 1, 1, 1, 1, 1,
0.7223511, -0.01820775, 0.8085505, 1, 1, 1, 1, 1,
0.7228275, -1.101131, 3.831329, 1, 1, 1, 1, 1,
0.7288809, -1.874395, 2.440141, 1, 1, 1, 1, 1,
0.733923, -1.745524, 2.950417, 1, 1, 1, 1, 1,
0.7358297, 1.701202, 0.7229322, 1, 1, 1, 1, 1,
0.7403831, 0.8538516, 2.273036, 0, 0, 1, 1, 1,
0.7457784, 0.766293, 0.3000818, 1, 0, 0, 1, 1,
0.7604554, -0.3197167, 2.987185, 1, 0, 0, 1, 1,
0.761285, -0.8440146, 2.060447, 1, 0, 0, 1, 1,
0.7666633, 1.262784, -0.3794928, 1, 0, 0, 1, 1,
0.7684401, -0.3946754, 2.666165, 1, 0, 0, 1, 1,
0.7742204, -1.699125, 2.370201, 0, 0, 0, 1, 1,
0.7747664, -0.3922483, 1.358839, 0, 0, 0, 1, 1,
0.7813565, 1.002334, 0.6643649, 0, 0, 0, 1, 1,
0.786014, -0.03254862, 3.2473, 0, 0, 0, 1, 1,
0.7935697, -0.4194222, 1.358018, 0, 0, 0, 1, 1,
0.7978575, -2.523941, 2.230682, 0, 0, 0, 1, 1,
0.7981405, -1.601005, 3.349927, 0, 0, 0, 1, 1,
0.8014265, -1.476192, 3.75217, 1, 1, 1, 1, 1,
0.8020166, -1.220465, 2.184362, 1, 1, 1, 1, 1,
0.8028406, 1.448489, 1.651642, 1, 1, 1, 1, 1,
0.8046962, -0.4203876, 2.224351, 1, 1, 1, 1, 1,
0.8064167, -1.066949, 0.8916775, 1, 1, 1, 1, 1,
0.8064698, 0.09588914, 2.376405, 1, 1, 1, 1, 1,
0.813511, 1.924228, 0.9921399, 1, 1, 1, 1, 1,
0.8201511, 0.6906707, 0.1148619, 1, 1, 1, 1, 1,
0.8213335, 0.8194866, 3.400617, 1, 1, 1, 1, 1,
0.8218287, 0.07806905, 2.473287, 1, 1, 1, 1, 1,
0.824167, 2.450035, 1.010316, 1, 1, 1, 1, 1,
0.8250397, 0.9072126, -0.01757934, 1, 1, 1, 1, 1,
0.8266818, 0.1965371, 0.04220094, 1, 1, 1, 1, 1,
0.8289289, -0.8394331, 3.891689, 1, 1, 1, 1, 1,
0.8319297, -2.03041, 2.66269, 1, 1, 1, 1, 1,
0.8319355, -0.0117715, 2.4215, 0, 0, 1, 1, 1,
0.8351801, 0.08820274, 2.826885, 1, 0, 0, 1, 1,
0.8387291, 0.2643231, -0.0172039, 1, 0, 0, 1, 1,
0.8445914, 0.1543578, 0.6962446, 1, 0, 0, 1, 1,
0.84631, 0.5854102, 1.696551, 1, 0, 0, 1, 1,
0.8493979, -0.01593193, 1.698076, 1, 0, 0, 1, 1,
0.8502352, -0.2658352, 1.113003, 0, 0, 0, 1, 1,
0.8586662, -0.115599, 1.890414, 0, 0, 0, 1, 1,
0.8587422, -0.7760866, 0.9481725, 0, 0, 0, 1, 1,
0.8615115, -0.6986039, 4.070388, 0, 0, 0, 1, 1,
0.8655689, 1.039941, -0.1907552, 0, 0, 0, 1, 1,
0.8665191, -0.2156741, 2.614553, 0, 0, 0, 1, 1,
0.8736995, -0.3197854, 1.246649, 0, 0, 0, 1, 1,
0.8739311, 0.3932651, 2.260435, 1, 1, 1, 1, 1,
0.8795161, -0.2272841, 2.384779, 1, 1, 1, 1, 1,
0.8810301, -0.5546951, 2.093197, 1, 1, 1, 1, 1,
0.8839097, -0.5664461, 0.9656069, 1, 1, 1, 1, 1,
0.8841169, 0.4493514, 1.632433, 1, 1, 1, 1, 1,
0.8879039, 0.4172117, 0.3220736, 1, 1, 1, 1, 1,
0.8884525, 0.3252476, 2.105228, 1, 1, 1, 1, 1,
0.8924181, 0.07127312, 0.6068149, 1, 1, 1, 1, 1,
0.8993335, 0.6647896, 1.265295, 1, 1, 1, 1, 1,
0.9041331, 0.7833794, 1.164575, 1, 1, 1, 1, 1,
0.9064791, 0.3931442, 0.6390007, 1, 1, 1, 1, 1,
0.9080557, 0.3544062, 0.4376452, 1, 1, 1, 1, 1,
0.9088734, -1.194227, 3.390432, 1, 1, 1, 1, 1,
0.9145602, 0.09336577, 1.524783, 1, 1, 1, 1, 1,
0.9162257, -0.8573341, 4.127267, 1, 1, 1, 1, 1,
0.9206532, -0.664901, 3.042044, 0, 0, 1, 1, 1,
0.9241356, 0.3850433, 1.281148, 1, 0, 0, 1, 1,
0.9282305, -1.041445, 1.418593, 1, 0, 0, 1, 1,
0.9342495, -1.033871, 1.928629, 1, 0, 0, 1, 1,
0.9433787, -0.5970469, 3.668664, 1, 0, 0, 1, 1,
0.9443133, 1.240267, 0.90772, 1, 0, 0, 1, 1,
0.9529636, 1.517378, -1.202016, 0, 0, 0, 1, 1,
0.9562343, 0.2316809, -0.05084112, 0, 0, 0, 1, 1,
0.9633912, -1.061972, 3.257985, 0, 0, 0, 1, 1,
0.9636702, 1.483713, 1.154179, 0, 0, 0, 1, 1,
0.9662802, 1.004943, -0.2044641, 0, 0, 0, 1, 1,
0.9683293, -0.9556181, 3.646513, 0, 0, 0, 1, 1,
0.9709434, -0.2141405, 0.8019561, 0, 0, 0, 1, 1,
0.9711182, -1.146376, 3.173319, 1, 1, 1, 1, 1,
0.9734965, -0.04895698, 2.49422, 1, 1, 1, 1, 1,
0.9755505, 0.241059, 0.2950561, 1, 1, 1, 1, 1,
0.9760515, -0.0234237, 1.650847, 1, 1, 1, 1, 1,
0.9843903, 0.1219657, 1.152722, 1, 1, 1, 1, 1,
0.9886948, -0.5583492, 0.4294042, 1, 1, 1, 1, 1,
0.9919626, -0.01245053, 0.1840161, 1, 1, 1, 1, 1,
0.9998353, 0.1274675, 3.284243, 1, 1, 1, 1, 1,
1.006886, 0.09655828, 2.439631, 1, 1, 1, 1, 1,
1.007927, 0.589902, 1.928027, 1, 1, 1, 1, 1,
1.013846, -0.08487848, 2.497732, 1, 1, 1, 1, 1,
1.01552, 0.8191972, 1.751649, 1, 1, 1, 1, 1,
1.020077, -2.848399, 2.024389, 1, 1, 1, 1, 1,
1.021719, -0.2646536, 2.104426, 1, 1, 1, 1, 1,
1.030012, 0.8437076, 0.949738, 1, 1, 1, 1, 1,
1.032313, 0.4096942, 2.135113, 0, 0, 1, 1, 1,
1.03426, 1.973874, 0.3177397, 1, 0, 0, 1, 1,
1.038378, -0.7131785, 1.878412, 1, 0, 0, 1, 1,
1.042889, -1.047543, 3.019581, 1, 0, 0, 1, 1,
1.051703, -0.3946921, 1.89003, 1, 0, 0, 1, 1,
1.056377, -0.5385213, 2.600039, 1, 0, 0, 1, 1,
1.063747, 0.4796673, 0.5585456, 0, 0, 0, 1, 1,
1.066051, -0.9886681, 2.568759, 0, 0, 0, 1, 1,
1.070764, 0.7810957, 2.514059, 0, 0, 0, 1, 1,
1.072266, 0.02122899, 2.589062, 0, 0, 0, 1, 1,
1.075578, -0.2547064, 1.688351, 0, 0, 0, 1, 1,
1.080395, -0.7426938, 3.079316, 0, 0, 0, 1, 1,
1.089042, 0.7066932, 0.4785621, 0, 0, 0, 1, 1,
1.09522, 0.1608312, 1.746339, 1, 1, 1, 1, 1,
1.099625, -0.6472147, 0.2790505, 1, 1, 1, 1, 1,
1.101292, -0.2276639, 0.2965015, 1, 1, 1, 1, 1,
1.10274, -0.679536, 2.151144, 1, 1, 1, 1, 1,
1.103101, -0.558333, 3.537734, 1, 1, 1, 1, 1,
1.103901, -0.1156979, 1.423277, 1, 1, 1, 1, 1,
1.104978, -0.4569843, 1.731331, 1, 1, 1, 1, 1,
1.107018, -0.3834003, 1.309011, 1, 1, 1, 1, 1,
1.111392, -1.739719, 5.501985, 1, 1, 1, 1, 1,
1.113493, 2.159725, 1.078676, 1, 1, 1, 1, 1,
1.114663, 0.5026197, 0.7114739, 1, 1, 1, 1, 1,
1.121888, -0.4292825, 1.021202, 1, 1, 1, 1, 1,
1.12267, -0.8925819, 0.8461528, 1, 1, 1, 1, 1,
1.135563, 0.9896333, 0.7592559, 1, 1, 1, 1, 1,
1.145683, 0.6605357, 1.792208, 1, 1, 1, 1, 1,
1.154719, -0.05938646, 1.289561, 0, 0, 1, 1, 1,
1.167404, -1.739441, 1.178355, 1, 0, 0, 1, 1,
1.171276, -0.4036308, 2.615164, 1, 0, 0, 1, 1,
1.185311, -3.057489, 5.13229, 1, 0, 0, 1, 1,
1.187469, -0.8540494, 2.520173, 1, 0, 0, 1, 1,
1.188568, -0.6672254, 3.569494, 1, 0, 0, 1, 1,
1.191437, 0.03622745, 0.2895398, 0, 0, 0, 1, 1,
1.192453, 1.440001, 0.4482254, 0, 0, 0, 1, 1,
1.205313, -1.864568, 2.194975, 0, 0, 0, 1, 1,
1.212511, -0.2515039, 0.08169785, 0, 0, 0, 1, 1,
1.220653, -2.011655, 2.519275, 0, 0, 0, 1, 1,
1.227515, -0.4711013, 1.252586, 0, 0, 0, 1, 1,
1.228307, 0.06307935, 2.021448, 0, 0, 0, 1, 1,
1.229807, -0.3738008, 0.7301103, 1, 1, 1, 1, 1,
1.237958, -1.988382, 2.076085, 1, 1, 1, 1, 1,
1.251724, 0.1271932, 0.5931085, 1, 1, 1, 1, 1,
1.255472, 1.043279, 0.1237756, 1, 1, 1, 1, 1,
1.258211, 0.7263223, -0.1639044, 1, 1, 1, 1, 1,
1.259723, -1.1078, 3.718059, 1, 1, 1, 1, 1,
1.269797, 0.2119811, 0.7024016, 1, 1, 1, 1, 1,
1.277037, -2.677472, 2.934792, 1, 1, 1, 1, 1,
1.303123, 0.4871704, 0.6708657, 1, 1, 1, 1, 1,
1.305038, 0.711824, 1.191228, 1, 1, 1, 1, 1,
1.322953, -1.4873, 1.9759, 1, 1, 1, 1, 1,
1.323832, 0.9756814, 1.196632, 1, 1, 1, 1, 1,
1.327532, -0.528255, 3.179902, 1, 1, 1, 1, 1,
1.32876, 0.4349799, 0.4447812, 1, 1, 1, 1, 1,
1.337542, -0.2519094, 2.414834, 1, 1, 1, 1, 1,
1.339539, -2.694744, 3.300659, 0, 0, 1, 1, 1,
1.346848, -0.08701576, 0.9308172, 1, 0, 0, 1, 1,
1.349566, 0.7094302, -2.227688, 1, 0, 0, 1, 1,
1.351532, -0.9931118, 2.119633, 1, 0, 0, 1, 1,
1.354824, -1.482723, 2.647523, 1, 0, 0, 1, 1,
1.359191, -0.007609798, 1.305457, 1, 0, 0, 1, 1,
1.359939, -0.4792798, 3.737172, 0, 0, 0, 1, 1,
1.368972, -0.8554152, 2.727842, 0, 0, 0, 1, 1,
1.369405, -0.04044431, 2.110064, 0, 0, 0, 1, 1,
1.374239, 0.3811323, 1.588605, 0, 0, 0, 1, 1,
1.389251, 0.3349263, -1.411842, 0, 0, 0, 1, 1,
1.392657, 0.5967942, 1.035383, 0, 0, 0, 1, 1,
1.40187, 1.068528, 1.241959, 0, 0, 0, 1, 1,
1.409271, 0.3780442, 1.012341, 1, 1, 1, 1, 1,
1.413831, 0.7332526, 0.9503073, 1, 1, 1, 1, 1,
1.415826, 0.9699547, 1.543305, 1, 1, 1, 1, 1,
1.422386, 2.566083, 0.2810126, 1, 1, 1, 1, 1,
1.426788, -0.3334093, 1.300617, 1, 1, 1, 1, 1,
1.431027, 0.8922974, 1.016942, 1, 1, 1, 1, 1,
1.441197, 0.07517246, 1.596111, 1, 1, 1, 1, 1,
1.450255, -0.1653331, 1.315297, 1, 1, 1, 1, 1,
1.463524, -0.1217973, -0.9203779, 1, 1, 1, 1, 1,
1.464817, 0.002684547, 2.871444, 1, 1, 1, 1, 1,
1.473596, -0.4994048, 1.076875, 1, 1, 1, 1, 1,
1.474372, -1.491889, 3.325873, 1, 1, 1, 1, 1,
1.488263, -1.152946, 3.499096, 1, 1, 1, 1, 1,
1.488744, 1.277695, 0.2911574, 1, 1, 1, 1, 1,
1.500363, 0.4979652, 1.712527, 1, 1, 1, 1, 1,
1.508083, -0.5779324, 2.754957, 0, 0, 1, 1, 1,
1.51472, 0.43107, 0.7050756, 1, 0, 0, 1, 1,
1.515412, 1.364771, 1.147103, 1, 0, 0, 1, 1,
1.521616, 1.080113, 1.027493, 1, 0, 0, 1, 1,
1.540538, 0.3874339, 2.764195, 1, 0, 0, 1, 1,
1.54287, -0.6128538, 1.055679, 1, 0, 0, 1, 1,
1.561316, 1.360224, -0.8362591, 0, 0, 0, 1, 1,
1.57639, -0.1573806, 1.432669, 0, 0, 0, 1, 1,
1.579865, 0.1528235, 0.801645, 0, 0, 0, 1, 1,
1.580308, 1.239854, 0.9682091, 0, 0, 0, 1, 1,
1.589007, -0.1704686, -1.704703, 0, 0, 0, 1, 1,
1.590732, -0.4590339, 0.851231, 0, 0, 0, 1, 1,
1.607617, -1.48226, 3.284812, 0, 0, 0, 1, 1,
1.615809, -0.6871113, 0.8730842, 1, 1, 1, 1, 1,
1.616604, -0.3205231, 3.452657, 1, 1, 1, 1, 1,
1.624886, -1.153872, 4.862499, 1, 1, 1, 1, 1,
1.625535, -0.2267873, 3.770129, 1, 1, 1, 1, 1,
1.628536, -0.118351, 1.651555, 1, 1, 1, 1, 1,
1.639118, -1.232234, 4.536353, 1, 1, 1, 1, 1,
1.6728, -0.5984533, -0.2064262, 1, 1, 1, 1, 1,
1.67893, 0.05457855, 2.405236, 1, 1, 1, 1, 1,
1.682483, 1.416828, -0.2689637, 1, 1, 1, 1, 1,
1.686489, 0.02379923, 2.155515, 1, 1, 1, 1, 1,
1.691408, -0.6409264, -0.5700126, 1, 1, 1, 1, 1,
1.701075, 0.4795077, 1.843795, 1, 1, 1, 1, 1,
1.717375, -0.7254658, 0.6510459, 1, 1, 1, 1, 1,
1.722706, 0.216838, 2.008104, 1, 1, 1, 1, 1,
1.728147, -1.267481, 2.989422, 1, 1, 1, 1, 1,
1.728324, -0.2289607, -0.03048554, 0, 0, 1, 1, 1,
1.732274, -0.07436963, 2.306941, 1, 0, 0, 1, 1,
1.753393, 1.38271, 1.258835, 1, 0, 0, 1, 1,
1.763723, 0.7514216, 1.555057, 1, 0, 0, 1, 1,
1.771329, 3.116769, -0.2288519, 1, 0, 0, 1, 1,
1.790692, 0.6053112, -0.8474312, 1, 0, 0, 1, 1,
1.798479, 0.4624289, 2.006577, 0, 0, 0, 1, 1,
1.800083, 0.2650791, 2.4054, 0, 0, 0, 1, 1,
1.804732, 0.3300595, 0.7086695, 0, 0, 0, 1, 1,
1.810357, 1.337409, 1.771069, 0, 0, 0, 1, 1,
1.813369, -0.2127471, 1.723398, 0, 0, 0, 1, 1,
1.815331, -1.062569, 2.833534, 0, 0, 0, 1, 1,
1.836184, 0.455327, 1.028481, 0, 0, 0, 1, 1,
1.839851, 0.1751129, 1.956851, 1, 1, 1, 1, 1,
1.841257, 1.754982, 0.09205397, 1, 1, 1, 1, 1,
1.841338, -0.7874276, 1.920295, 1, 1, 1, 1, 1,
1.857758, 0.840242, 1.276733, 1, 1, 1, 1, 1,
1.861083, -1.296652, 1.186558, 1, 1, 1, 1, 1,
1.874894, -1.606883, 2.796492, 1, 1, 1, 1, 1,
1.897013, 0.8186399, 2.501968, 1, 1, 1, 1, 1,
1.899598, -0.08854232, 0.9645754, 1, 1, 1, 1, 1,
1.942219, -0.3125553, 0.8714135, 1, 1, 1, 1, 1,
1.942662, -0.5642697, 2.407914, 1, 1, 1, 1, 1,
1.959964, -1.759316, 1.697282, 1, 1, 1, 1, 1,
1.985453, 1.703961, 0.1456951, 1, 1, 1, 1, 1,
1.991244, 0.148019, 1.508783, 1, 1, 1, 1, 1,
1.99465, -0.3987467, 1.967681, 1, 1, 1, 1, 1,
2.057902, -1.56798, 3.43662, 1, 1, 1, 1, 1,
2.091805, 0.4917243, 0.8423465, 0, 0, 1, 1, 1,
2.104422, -0.7704909, 1.843137, 1, 0, 0, 1, 1,
2.120343, 0.3484707, 0.6189062, 1, 0, 0, 1, 1,
2.214588, -0.5836295, 4.53049, 1, 0, 0, 1, 1,
2.245502, -1.472168, 1.836898, 1, 0, 0, 1, 1,
2.24708, -0.6200622, 2.702741, 1, 0, 0, 1, 1,
2.297067, -1.373125, 0.8560759, 0, 0, 0, 1, 1,
2.297134, -0.2772683, 1.695181, 0, 0, 0, 1, 1,
2.298632, 1.004035, -0.0598607, 0, 0, 0, 1, 1,
2.323113, 1.476563, 1.270844, 0, 0, 0, 1, 1,
2.325122, -1.353519, 2.05181, 0, 0, 0, 1, 1,
2.349019, -2.376173, 1.249747, 0, 0, 0, 1, 1,
2.4238, 0.9777894, 0.2543613, 0, 0, 0, 1, 1,
2.449604, 1.697959, 2.040537, 1, 1, 1, 1, 1,
2.482047, 0.06234576, 0.81197, 1, 1, 1, 1, 1,
2.507026, 1.240947, 1.555728, 1, 1, 1, 1, 1,
2.724656, 0.223132, 0.6934307, 1, 1, 1, 1, 1,
2.757638, 1.764851, 2.145612, 1, 1, 1, 1, 1,
2.774532, -0.1412145, 1.994753, 1, 1, 1, 1, 1,
3.400781, -0.007667026, 3.016028, 1, 1, 1, 1, 1
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
var radius = 9.901691;
var distance = 34.77927;
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
mvMatrix.translate( 0.06014538, -0.2432959, -0.1306829 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77927);
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
