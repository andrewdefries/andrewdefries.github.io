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
-3.368024, -0.3195334, -0.7491025, 1, 0, 0, 1,
-2.903879, -0.4383689, -1.80414, 1, 0.007843138, 0, 1,
-2.902137, 0.7887222, -1.301648, 1, 0.01176471, 0, 1,
-2.662313, 1.58106, -0.3135474, 1, 0.01960784, 0, 1,
-2.547262, -1.85779, -3.036751, 1, 0.02352941, 0, 1,
-2.527753, 0.6513381, -2.497517, 1, 0.03137255, 0, 1,
-2.430201, -0.3182243, -2.483555, 1, 0.03529412, 0, 1,
-2.422092, -1.725155, -1.224288, 1, 0.04313726, 0, 1,
-2.402401, 1.934647, -0.6662073, 1, 0.04705882, 0, 1,
-2.271055, -0.1468307, -1.164412, 1, 0.05490196, 0, 1,
-2.258028, 0.6808752, -1.273865, 1, 0.05882353, 0, 1,
-2.231939, -0.8636454, -2.780827, 1, 0.06666667, 0, 1,
-2.199841, 1.818793, -1.489152, 1, 0.07058824, 0, 1,
-2.065577, 0.7937233, 0.2193223, 1, 0.07843138, 0, 1,
-2.029062, 0.4325443, -0.3584338, 1, 0.08235294, 0, 1,
-2.027293, 0.5472901, -1.525247, 1, 0.09019608, 0, 1,
-2.014391, 0.791386, -3.535471, 1, 0.09411765, 0, 1,
-1.9979, 0.7771324, -1.092793, 1, 0.1019608, 0, 1,
-1.931703, -0.5761151, -0.9881008, 1, 0.1098039, 0, 1,
-1.919803, 0.8225714, -2.115108, 1, 0.1137255, 0, 1,
-1.903931, 0.5171151, -2.251992, 1, 0.1215686, 0, 1,
-1.902352, 0.8536021, -2.348202, 1, 0.1254902, 0, 1,
-1.895005, -0.394715, -2.107176, 1, 0.1333333, 0, 1,
-1.892406, -1.134651, -0.3444451, 1, 0.1372549, 0, 1,
-1.882583, -0.1323562, -0.3671896, 1, 0.145098, 0, 1,
-1.8691, -0.2126034, -1.978601, 1, 0.1490196, 0, 1,
-1.864298, -0.3419888, -1.831952, 1, 0.1568628, 0, 1,
-1.784021, 0.593059, -1.066813, 1, 0.1607843, 0, 1,
-1.775874, 0.2690737, -1.095345, 1, 0.1686275, 0, 1,
-1.772797, -0.05367819, -1.826782, 1, 0.172549, 0, 1,
-1.76135, 1.826471, -1.413627, 1, 0.1803922, 0, 1,
-1.705203, -0.2060637, -1.713672, 1, 0.1843137, 0, 1,
-1.703635, -0.04271042, -2.93017, 1, 0.1921569, 0, 1,
-1.700411, 0.4670229, -0.9531201, 1, 0.1960784, 0, 1,
-1.697904, -0.05570034, -1.791057, 1, 0.2039216, 0, 1,
-1.695149, 0.5387386, -1.297341, 1, 0.2117647, 0, 1,
-1.693213, 0.1520702, -1.251932, 1, 0.2156863, 0, 1,
-1.692789, 0.1275881, -2.095372, 1, 0.2235294, 0, 1,
-1.671226, -0.3623981, -1.746532, 1, 0.227451, 0, 1,
-1.669194, 0.3001189, -1.270913, 1, 0.2352941, 0, 1,
-1.662384, 0.2387598, -1.812542, 1, 0.2392157, 0, 1,
-1.642032, -0.2708729, -2.373838, 1, 0.2470588, 0, 1,
-1.634555, -1.154164, -1.891495, 1, 0.2509804, 0, 1,
-1.629293, 1.240996, -1.525985, 1, 0.2588235, 0, 1,
-1.628842, 1.409941, -1.954113, 1, 0.2627451, 0, 1,
-1.616035, -0.9155865, -0.7029343, 1, 0.2705882, 0, 1,
-1.601326, 0.8330527, -2.108299, 1, 0.2745098, 0, 1,
-1.599183, 1.819047, 0.01451225, 1, 0.282353, 0, 1,
-1.597043, -0.9143155, -1.421482, 1, 0.2862745, 0, 1,
-1.596637, 0.5739886, -1.233442, 1, 0.2941177, 0, 1,
-1.573138, -0.344056, -1.680497, 1, 0.3019608, 0, 1,
-1.571289, -0.9341857, -3.26895, 1, 0.3058824, 0, 1,
-1.54942, 1.320795, -1.394837, 1, 0.3137255, 0, 1,
-1.545874, 0.7336991, -1.828973, 1, 0.3176471, 0, 1,
-1.543096, -0.6897056, -4.09017, 1, 0.3254902, 0, 1,
-1.540872, -0.3238999, -1.954287, 1, 0.3294118, 0, 1,
-1.539606, 1.889324, -0.08927725, 1, 0.3372549, 0, 1,
-1.526801, -0.9841473, -0.5424783, 1, 0.3411765, 0, 1,
-1.526384, 0.03215399, -1.649898, 1, 0.3490196, 0, 1,
-1.497211, 0.2209127, -1.800876, 1, 0.3529412, 0, 1,
-1.496713, -0.0839067, -2.059341, 1, 0.3607843, 0, 1,
-1.495074, 0.1038197, -1.428839, 1, 0.3647059, 0, 1,
-1.494871, -1.94539, -1.374345, 1, 0.372549, 0, 1,
-1.48285, 0.3157065, -0.9727779, 1, 0.3764706, 0, 1,
-1.478213, -0.9631459, -0.877624, 1, 0.3843137, 0, 1,
-1.473718, -0.03636258, -2.562934, 1, 0.3882353, 0, 1,
-1.469776, 0.7530822, 0.6992947, 1, 0.3960784, 0, 1,
-1.466833, 0.4006101, -1.614408, 1, 0.4039216, 0, 1,
-1.46607, 0.6000612, 0.2413737, 1, 0.4078431, 0, 1,
-1.459618, 0.4611165, -1.726345, 1, 0.4156863, 0, 1,
-1.456347, 2.120435, -1.272149, 1, 0.4196078, 0, 1,
-1.448547, -0.7215186, -3.075339, 1, 0.427451, 0, 1,
-1.448035, -0.7734968, -1.102109, 1, 0.4313726, 0, 1,
-1.445816, -0.7101975, -1.283122, 1, 0.4392157, 0, 1,
-1.443947, 1.442599, -0.9226031, 1, 0.4431373, 0, 1,
-1.433573, 0.7620385, -0.7825143, 1, 0.4509804, 0, 1,
-1.431317, 0.2502673, -1.199016, 1, 0.454902, 0, 1,
-1.418042, -1.989288, -3.71464, 1, 0.4627451, 0, 1,
-1.412866, -0.9896362, -2.968952, 1, 0.4666667, 0, 1,
-1.399556, -0.0006063714, -2.404777, 1, 0.4745098, 0, 1,
-1.396183, 0.6884264, -0.7692239, 1, 0.4784314, 0, 1,
-1.395231, 2.041456, -1.757836, 1, 0.4862745, 0, 1,
-1.394064, 0.04560553, -1.575872, 1, 0.4901961, 0, 1,
-1.390965, -1.392895, -2.631879, 1, 0.4980392, 0, 1,
-1.376525, -0.6814945, -2.620287, 1, 0.5058824, 0, 1,
-1.37086, 0.9727346, -1.390426, 1, 0.509804, 0, 1,
-1.369477, -0.2340806, -1.994065, 1, 0.5176471, 0, 1,
-1.358381, 0.03655523, 0.2976251, 1, 0.5215687, 0, 1,
-1.357642, -0.0006865533, 0.9877126, 1, 0.5294118, 0, 1,
-1.355669, 1.473084, -0.5649613, 1, 0.5333334, 0, 1,
-1.344721, 2.615096, -0.4128288, 1, 0.5411765, 0, 1,
-1.337053, -2.56193, -3.418233, 1, 0.5450981, 0, 1,
-1.328034, 2.509084, 0.8303435, 1, 0.5529412, 0, 1,
-1.325789, -2.631324, -3.518348, 1, 0.5568628, 0, 1,
-1.323868, -0.5161647, -2.148398, 1, 0.5647059, 0, 1,
-1.317371, 0.8982508, -1.142826, 1, 0.5686275, 0, 1,
-1.310543, 0.3966934, -2.163281, 1, 0.5764706, 0, 1,
-1.303745, 0.1573034, -0.4948088, 1, 0.5803922, 0, 1,
-1.303035, -0.8569255, -3.296995, 1, 0.5882353, 0, 1,
-1.297694, -0.2279948, -0.7958317, 1, 0.5921569, 0, 1,
-1.291571, 0.4901576, -0.240757, 1, 0.6, 0, 1,
-1.28929, 0.2059293, -2.33133, 1, 0.6078432, 0, 1,
-1.286676, 0.493986, -1.042416, 1, 0.6117647, 0, 1,
-1.285738, -1.077123, -2.479996, 1, 0.6196079, 0, 1,
-1.280989, -1.605526, -2.56915, 1, 0.6235294, 0, 1,
-1.275767, 0.2987045, 0.2649179, 1, 0.6313726, 0, 1,
-1.271936, 0.110834, -1.222147, 1, 0.6352941, 0, 1,
-1.267425, -1.458103, -1.108688, 1, 0.6431373, 0, 1,
-1.267081, 1.11047, -0.6067718, 1, 0.6470588, 0, 1,
-1.264094, 2.019879, 0.9363159, 1, 0.654902, 0, 1,
-1.258108, 1.211085, -1.325619, 1, 0.6588235, 0, 1,
-1.257776, 0.5483413, -1.103707, 1, 0.6666667, 0, 1,
-1.247664, 0.9685866, 0.4451616, 1, 0.6705883, 0, 1,
-1.237808, -0.4479311, -2.074717, 1, 0.6784314, 0, 1,
-1.23243, -1.433892, -3.340131, 1, 0.682353, 0, 1,
-1.231608, 0.646376, -2.750789, 1, 0.6901961, 0, 1,
-1.226578, 0.652051, -1.008617, 1, 0.6941177, 0, 1,
-1.224767, 0.391251, 0.4344867, 1, 0.7019608, 0, 1,
-1.206514, -2.357717, -1.749323, 1, 0.7098039, 0, 1,
-1.188253, -1.147307, -2.749878, 1, 0.7137255, 0, 1,
-1.187489, 1.507059, -1.214022, 1, 0.7215686, 0, 1,
-1.176699, 2.310081, 0.08061543, 1, 0.7254902, 0, 1,
-1.165544, -1.3917, -1.980941, 1, 0.7333333, 0, 1,
-1.158267, 0.4449531, -1.527622, 1, 0.7372549, 0, 1,
-1.156179, 0.05569451, -3.223552, 1, 0.7450981, 0, 1,
-1.15081, -0.7074447, -3.839004, 1, 0.7490196, 0, 1,
-1.142397, 1.68794, 0.344246, 1, 0.7568628, 0, 1,
-1.139663, 0.7044201, 0.3697994, 1, 0.7607843, 0, 1,
-1.132912, -0.6933492, -1.901073, 1, 0.7686275, 0, 1,
-1.12948, 0.9597831, -2.502052, 1, 0.772549, 0, 1,
-1.126596, 0.3926156, -0.4364871, 1, 0.7803922, 0, 1,
-1.123573, 0.02109973, -2.02896, 1, 0.7843137, 0, 1,
-1.119808, 0.688916, 1.006611, 1, 0.7921569, 0, 1,
-1.109896, -0.3549623, -5.120216, 1, 0.7960784, 0, 1,
-1.099493, -1.89639, -1.313196, 1, 0.8039216, 0, 1,
-1.097686, -0.2438138, -1.929288, 1, 0.8117647, 0, 1,
-1.092507, 1.994998, 2.092788, 1, 0.8156863, 0, 1,
-1.090124, 0.05583781, -1.096223, 1, 0.8235294, 0, 1,
-1.086966, -1.402864, -4.188742, 1, 0.827451, 0, 1,
-1.085958, 2.58241, -0.8865742, 1, 0.8352941, 0, 1,
-1.084294, -1.334378, -1.099479, 1, 0.8392157, 0, 1,
-1.081876, 2.039245, -1.111993, 1, 0.8470588, 0, 1,
-1.080511, 0.08962715, -1.953801, 1, 0.8509804, 0, 1,
-1.076127, 0.3309276, 1.071246, 1, 0.8588235, 0, 1,
-1.075961, -1.988615, -3.428358, 1, 0.8627451, 0, 1,
-1.06951, 0.960587, -3.611155, 1, 0.8705882, 0, 1,
-1.06492, -1.117362, -2.392212, 1, 0.8745098, 0, 1,
-1.05671, 0.966557, -1.126772, 1, 0.8823529, 0, 1,
-1.054427, -0.6033327, -1.705258, 1, 0.8862745, 0, 1,
-1.048533, 0.933228, 0.3950364, 1, 0.8941177, 0, 1,
-1.045651, 0.4011727, -0.9026191, 1, 0.8980392, 0, 1,
-1.04533, -0.4418147, -2.236547, 1, 0.9058824, 0, 1,
-1.044995, -0.5811048, -3.046039, 1, 0.9137255, 0, 1,
-1.044192, -0.2184703, -1.99237, 1, 0.9176471, 0, 1,
-1.04319, -0.4350465, -1.418237, 1, 0.9254902, 0, 1,
-1.04172, -0.8991084, -0.5727623, 1, 0.9294118, 0, 1,
-1.040458, 1.057958, -0.9161577, 1, 0.9372549, 0, 1,
-1.033022, 1.437618, -3.136428, 1, 0.9411765, 0, 1,
-1.030789, -0.4436017, -2.816718, 1, 0.9490196, 0, 1,
-1.030364, 1.602592, -0.8519115, 1, 0.9529412, 0, 1,
-1.02123, -1.05616, -2.89115, 1, 0.9607843, 0, 1,
-1.018447, 0.1044973, -0.7793269, 1, 0.9647059, 0, 1,
-1.017797, 0.5511709, 0.4214712, 1, 0.972549, 0, 1,
-1.012336, 0.6854033, -1.472887, 1, 0.9764706, 0, 1,
-1.011633, 0.3739115, -3.20449, 1, 0.9843137, 0, 1,
-1.000023, -2.176224, -1.721751, 1, 0.9882353, 0, 1,
-0.9964589, 0.6187775, -1.406322, 1, 0.9960784, 0, 1,
-0.9893224, 2.691022, -1.496415, 0.9960784, 1, 0, 1,
-0.9844378, -1.45255, -2.125077, 0.9921569, 1, 0, 1,
-0.9830672, 0.04288277, -3.075347, 0.9843137, 1, 0, 1,
-0.9803362, -1.166234, -2.922182, 0.9803922, 1, 0, 1,
-0.9797282, 0.1377129, 0.4720365, 0.972549, 1, 0, 1,
-0.9788745, 0.7173544, -0.9301032, 0.9686275, 1, 0, 1,
-0.9753071, 0.365749, -1.500153, 0.9607843, 1, 0, 1,
-0.9678273, 1.203355, -2.158486, 0.9568627, 1, 0, 1,
-0.9634976, 0.8143221, 0.07352459, 0.9490196, 1, 0, 1,
-0.9620341, -0.1821942, -1.928292, 0.945098, 1, 0, 1,
-0.95973, 0.6948652, -1.126301, 0.9372549, 1, 0, 1,
-0.9459741, 0.905323, -1.290989, 0.9333333, 1, 0, 1,
-0.9443566, 0.2006845, -2.880623, 0.9254902, 1, 0, 1,
-0.9384821, -0.6509902, -1.31714, 0.9215686, 1, 0, 1,
-0.9270582, -1.703266, -2.453318, 0.9137255, 1, 0, 1,
-0.9257897, -0.5932499, -3.384509, 0.9098039, 1, 0, 1,
-0.9240493, 0.9451094, -0.7149963, 0.9019608, 1, 0, 1,
-0.9222166, -1.129756, -3.74983, 0.8941177, 1, 0, 1,
-0.9173726, -0.200766, -2.236325, 0.8901961, 1, 0, 1,
-0.9111884, 0.7058113, 0.04475107, 0.8823529, 1, 0, 1,
-0.9111243, 0.1003659, -2.040712, 0.8784314, 1, 0, 1,
-0.9036739, -0.1358395, -2.1482, 0.8705882, 1, 0, 1,
-0.9030539, -0.466005, -1.096855, 0.8666667, 1, 0, 1,
-0.9014698, -0.456737, -2.978479, 0.8588235, 1, 0, 1,
-0.9013973, 1.368555, -0.2560415, 0.854902, 1, 0, 1,
-0.9006363, -0.1888293, -3.2871, 0.8470588, 1, 0, 1,
-0.8968245, -0.4278697, -2.403471, 0.8431373, 1, 0, 1,
-0.8954831, 0.2472801, -2.438785, 0.8352941, 1, 0, 1,
-0.8807851, 0.1772864, -1.81231, 0.8313726, 1, 0, 1,
-0.8781792, 0.5929543, -0.8640026, 0.8235294, 1, 0, 1,
-0.8698146, -1.196511, -1.767672, 0.8196079, 1, 0, 1,
-0.8670967, -0.1113246, -2.661698, 0.8117647, 1, 0, 1,
-0.8524551, 1.640315, 0.3591119, 0.8078431, 1, 0, 1,
-0.8449925, -0.01508444, -1.617591, 0.8, 1, 0, 1,
-0.8321723, -1.609548, -3.79612, 0.7921569, 1, 0, 1,
-0.8294045, -0.6363044, -2.277727, 0.7882353, 1, 0, 1,
-0.825224, 0.4798076, -1.019172, 0.7803922, 1, 0, 1,
-0.8220988, -0.2890856, -2.927527, 0.7764706, 1, 0, 1,
-0.8180181, -1.641602, -2.530175, 0.7686275, 1, 0, 1,
-0.8177903, -0.347555, -4.191874, 0.7647059, 1, 0, 1,
-0.8099201, -0.3023553, -3.699021, 0.7568628, 1, 0, 1,
-0.8073474, 0.8071344, -1.65843, 0.7529412, 1, 0, 1,
-0.8049662, -0.3265915, -3.215718, 0.7450981, 1, 0, 1,
-0.7972524, 1.08623, -1.121932, 0.7411765, 1, 0, 1,
-0.7941067, 0.5410308, -0.4164348, 0.7333333, 1, 0, 1,
-0.7853448, 0.5342685, -0.8186405, 0.7294118, 1, 0, 1,
-0.7852196, -1.90711, -2.370087, 0.7215686, 1, 0, 1,
-0.785072, 0.1955135, -1.581674, 0.7176471, 1, 0, 1,
-0.7847865, 1.159452, -0.6924945, 0.7098039, 1, 0, 1,
-0.783848, 1.240994, -0.5986208, 0.7058824, 1, 0, 1,
-0.7790845, 0.4781601, -1.251241, 0.6980392, 1, 0, 1,
-0.7666832, -0.4238907, -2.045195, 0.6901961, 1, 0, 1,
-0.7663972, -0.6649641, -1.85095, 0.6862745, 1, 0, 1,
-0.7651621, -1.920581, -1.667918, 0.6784314, 1, 0, 1,
-0.7571327, -0.5357874, -1.807133, 0.6745098, 1, 0, 1,
-0.7544938, -0.4644328, -3.224066, 0.6666667, 1, 0, 1,
-0.7513469, -1.807223, -3.396022, 0.6627451, 1, 0, 1,
-0.7447541, -0.6717626, -2.128567, 0.654902, 1, 0, 1,
-0.7418383, 0.7184771, -0.1027733, 0.6509804, 1, 0, 1,
-0.7405652, -0.08385561, -2.447718, 0.6431373, 1, 0, 1,
-0.734936, 0.0422415, -1.48708, 0.6392157, 1, 0, 1,
-0.7343279, -0.8627362, -2.304569, 0.6313726, 1, 0, 1,
-0.7210147, -0.8688037, -2.49926, 0.627451, 1, 0, 1,
-0.7202222, -0.05037299, -0.8134402, 0.6196079, 1, 0, 1,
-0.717824, 0.7692655, 0.1067197, 0.6156863, 1, 0, 1,
-0.7172394, -0.2686227, -3.254562, 0.6078432, 1, 0, 1,
-0.7130286, -0.3343446, -2.419682, 0.6039216, 1, 0, 1,
-0.7115127, 0.2133078, -1.603551, 0.5960785, 1, 0, 1,
-0.7097225, 1.310377, -0.4101514, 0.5882353, 1, 0, 1,
-0.6965013, 0.7097119, -1.283095, 0.5843138, 1, 0, 1,
-0.6939991, -0.1889259, -3.443955, 0.5764706, 1, 0, 1,
-0.6885772, -1.148876, -2.252202, 0.572549, 1, 0, 1,
-0.6855913, -0.1792441, -1.12897, 0.5647059, 1, 0, 1,
-0.6810848, 0.3498565, -0.3000356, 0.5607843, 1, 0, 1,
-0.6681291, 0.4049439, -0.6325727, 0.5529412, 1, 0, 1,
-0.6668417, 0.1186104, -1.198185, 0.5490196, 1, 0, 1,
-0.6646684, 1.233095, 0.9531192, 0.5411765, 1, 0, 1,
-0.6631663, 1.039692, -0.9174006, 0.5372549, 1, 0, 1,
-0.653164, 0.5992981, -0.3472949, 0.5294118, 1, 0, 1,
-0.6463372, -0.3101895, -2.570504, 0.5254902, 1, 0, 1,
-0.6376624, -0.5332095, -1.432558, 0.5176471, 1, 0, 1,
-0.6352088, -0.9639015, -2.902108, 0.5137255, 1, 0, 1,
-0.6351871, 0.4066685, -1.692947, 0.5058824, 1, 0, 1,
-0.6348821, -1.051998, -1.491941, 0.5019608, 1, 0, 1,
-0.6344198, 0.177829, -2.143329, 0.4941176, 1, 0, 1,
-0.6330559, 0.8848704, -0.9543682, 0.4862745, 1, 0, 1,
-0.6329585, -1.527025, -2.758116, 0.4823529, 1, 0, 1,
-0.6284686, -0.5604234, -2.392257, 0.4745098, 1, 0, 1,
-0.625264, -0.3463544, -0.8317862, 0.4705882, 1, 0, 1,
-0.6196246, 0.9563564, -0.5090342, 0.4627451, 1, 0, 1,
-0.612415, 1.661863, 0.5549926, 0.4588235, 1, 0, 1,
-0.6103289, -0.9357556, -2.173261, 0.4509804, 1, 0, 1,
-0.6084787, -0.5062712, -2.660433, 0.4470588, 1, 0, 1,
-0.6066785, -0.1807571, -2.321507, 0.4392157, 1, 0, 1,
-0.6008461, -1.087954, -3.258326, 0.4352941, 1, 0, 1,
-0.5975065, 1.496042, 0.6575263, 0.427451, 1, 0, 1,
-0.5836632, 0.5456401, -0.1493428, 0.4235294, 1, 0, 1,
-0.5781823, 0.8335257, -1.479883, 0.4156863, 1, 0, 1,
-0.5772882, 0.3635793, -1.642766, 0.4117647, 1, 0, 1,
-0.5697845, 1.53481, -1.313337, 0.4039216, 1, 0, 1,
-0.5678642, 1.134122, -2.603679, 0.3960784, 1, 0, 1,
-0.5663198, 0.9950787, 0.07144659, 0.3921569, 1, 0, 1,
-0.564436, 1.485179, -0.04612938, 0.3843137, 1, 0, 1,
-0.5619872, -1.542683, -1.552109, 0.3803922, 1, 0, 1,
-0.5566627, 0.2062346, -0.5925556, 0.372549, 1, 0, 1,
-0.5552662, 0.2122412, -0.9654413, 0.3686275, 1, 0, 1,
-0.5543179, 0.004523295, -1.044542, 0.3607843, 1, 0, 1,
-0.5511807, 0.06440592, -0.5695597, 0.3568628, 1, 0, 1,
-0.5487491, -1.27013, -3.534331, 0.3490196, 1, 0, 1,
-0.5413432, 1.19226, -0.2667473, 0.345098, 1, 0, 1,
-0.5369592, 0.6773348, -0.3200211, 0.3372549, 1, 0, 1,
-0.5368124, -0.3557795, -1.636194, 0.3333333, 1, 0, 1,
-0.5306057, -1.570106, -4.897445, 0.3254902, 1, 0, 1,
-0.5304062, -0.2862884, -2.947659, 0.3215686, 1, 0, 1,
-0.5282082, 0.3768983, -1.615525, 0.3137255, 1, 0, 1,
-0.525326, -1.11623, -1.975324, 0.3098039, 1, 0, 1,
-0.523865, -0.4271885, -1.060595, 0.3019608, 1, 0, 1,
-0.5221466, -0.4558461, -0.7641534, 0.2941177, 1, 0, 1,
-0.5183438, -0.5948709, -4.324792, 0.2901961, 1, 0, 1,
-0.5158544, -1.164834, -2.323274, 0.282353, 1, 0, 1,
-0.5140198, 0.5741228, 0.05503003, 0.2784314, 1, 0, 1,
-0.513733, 0.7063906, 0.4104293, 0.2705882, 1, 0, 1,
-0.5096261, 0.007424159, -1.579608, 0.2666667, 1, 0, 1,
-0.5058457, -1.206253, -3.578135, 0.2588235, 1, 0, 1,
-0.504479, 0.105741, -2.721948, 0.254902, 1, 0, 1,
-0.5028931, -0.1516336, -1.231898, 0.2470588, 1, 0, 1,
-0.4989594, -1.518777, -4.313055, 0.2431373, 1, 0, 1,
-0.498087, -1.177371, -2.618731, 0.2352941, 1, 0, 1,
-0.4817144, 0.5485561, 0.7705212, 0.2313726, 1, 0, 1,
-0.4804868, -0.7393708, -2.48555, 0.2235294, 1, 0, 1,
-0.4759869, -0.0896902, -0.05274413, 0.2196078, 1, 0, 1,
-0.4742605, 1.348632, -0.2713497, 0.2117647, 1, 0, 1,
-0.4735397, 0.4520758, -1.08756, 0.2078431, 1, 0, 1,
-0.4672158, -0.2740906, -2.329713, 0.2, 1, 0, 1,
-0.4644878, -0.5586853, -2.4111, 0.1921569, 1, 0, 1,
-0.4642458, -1.679739, -3.803046, 0.1882353, 1, 0, 1,
-0.4641984, -1.030565, -3.611521, 0.1803922, 1, 0, 1,
-0.4630084, 0.3495276, -1.461199, 0.1764706, 1, 0, 1,
-0.4625056, -0.8740255, -2.816632, 0.1686275, 1, 0, 1,
-0.4611693, 1.324283, -0.84875, 0.1647059, 1, 0, 1,
-0.4589767, -0.6169218, -1.930205, 0.1568628, 1, 0, 1,
-0.4580342, 0.2507892, -1.620178, 0.1529412, 1, 0, 1,
-0.4577222, 2.109278, 1.342548, 0.145098, 1, 0, 1,
-0.4463025, -0.1878538, -2.875226, 0.1411765, 1, 0, 1,
-0.4432485, 0.009655011, -1.192695, 0.1333333, 1, 0, 1,
-0.442594, -0.0946713, -2.579133, 0.1294118, 1, 0, 1,
-0.4416761, -1.022261, -2.428235, 0.1215686, 1, 0, 1,
-0.4401924, -1.201294, -3.322509, 0.1176471, 1, 0, 1,
-0.4384041, 0.02986003, -0.6095906, 0.1098039, 1, 0, 1,
-0.4383765, 1.199956, -0.09303556, 0.1058824, 1, 0, 1,
-0.4379947, 0.0517455, -2.226446, 0.09803922, 1, 0, 1,
-0.4379401, -0.3556447, -1.101917, 0.09019608, 1, 0, 1,
-0.4360697, 0.6431616, -0.8323751, 0.08627451, 1, 0, 1,
-0.4349412, -0.1050386, -2.229631, 0.07843138, 1, 0, 1,
-0.4229313, -0.8311824, -2.313648, 0.07450981, 1, 0, 1,
-0.4227751, -0.6851589, -4.726654, 0.06666667, 1, 0, 1,
-0.4196393, 0.6335353, -0.01860749, 0.0627451, 1, 0, 1,
-0.4165958, -0.4492108, -3.468746, 0.05490196, 1, 0, 1,
-0.4146179, 0.3021334, -1.060031, 0.05098039, 1, 0, 1,
-0.4136676, 0.1612109, -0.4475465, 0.04313726, 1, 0, 1,
-0.413089, 1.84851, -1.777713, 0.03921569, 1, 0, 1,
-0.4107486, -1.006416, -3.716756, 0.03137255, 1, 0, 1,
-0.4078167, -1.014982, -3.137293, 0.02745098, 1, 0, 1,
-0.406187, -0.2529646, -2.619287, 0.01960784, 1, 0, 1,
-0.4038778, -2.050904, -2.62132, 0.01568628, 1, 0, 1,
-0.4024849, 0.3886921, -0.8125345, 0.007843138, 1, 0, 1,
-0.401756, -0.7598754, -2.992552, 0.003921569, 1, 0, 1,
-0.4001583, 1.515127, -0.6423931, 0, 1, 0.003921569, 1,
-0.3991737, -0.4371577, -1.769951, 0, 1, 0.01176471, 1,
-0.3960625, 0.3739608, -1.018919, 0, 1, 0.01568628, 1,
-0.3948905, 0.6461833, 0.1762623, 0, 1, 0.02352941, 1,
-0.3941822, -0.7748471, -2.470399, 0, 1, 0.02745098, 1,
-0.391096, 1.131034, 0.5087028, 0, 1, 0.03529412, 1,
-0.3878658, 0.5156195, -2.236968, 0, 1, 0.03921569, 1,
-0.3846003, -1.913471, -1.973199, 0, 1, 0.04705882, 1,
-0.3821896, 1.046392, -0.06767989, 0, 1, 0.05098039, 1,
-0.3791959, -0.4349826, -1.341831, 0, 1, 0.05882353, 1,
-0.3773338, 0.5500017, -1.034634, 0, 1, 0.0627451, 1,
-0.3769838, 0.7754911, -1.479557, 0, 1, 0.07058824, 1,
-0.3710802, 0.286458, -1.677818, 0, 1, 0.07450981, 1,
-0.3667668, -1.340605, -3.280624, 0, 1, 0.08235294, 1,
-0.3629798, -1.697091, -3.379298, 0, 1, 0.08627451, 1,
-0.3596938, 1.345935, 1.1195, 0, 1, 0.09411765, 1,
-0.3524661, 0.665854, 1.491249, 0, 1, 0.1019608, 1,
-0.3520451, -0.6851415, -2.957361, 0, 1, 0.1058824, 1,
-0.3506631, -0.207135, -0.3346405, 0, 1, 0.1137255, 1,
-0.3479369, 0.1898837, -0.3061922, 0, 1, 0.1176471, 1,
-0.3478279, 0.1256213, -2.554979, 0, 1, 0.1254902, 1,
-0.3473611, 0.5778627, -1.843807, 0, 1, 0.1294118, 1,
-0.3464444, -1.575166, -2.097429, 0, 1, 0.1372549, 1,
-0.3459733, 0.5147402, 0.9796421, 0, 1, 0.1411765, 1,
-0.3452909, -1.334535, -1.235889, 0, 1, 0.1490196, 1,
-0.3440138, 1.178682, 1.103811, 0, 1, 0.1529412, 1,
-0.3410576, 0.9201054, -0.4938162, 0, 1, 0.1607843, 1,
-0.3388142, 0.3303769, -1.057326, 0, 1, 0.1647059, 1,
-0.3367562, 0.2750781, -2.225232, 0, 1, 0.172549, 1,
-0.3344843, 1.75217, 1.454136, 0, 1, 0.1764706, 1,
-0.3341394, -0.1516003, -2.697322, 0, 1, 0.1843137, 1,
-0.3337608, -0.6308737, -1.815626, 0, 1, 0.1882353, 1,
-0.3333832, -1.67913, -0.6593441, 0, 1, 0.1960784, 1,
-0.3330186, -2.040514, -1.39033, 0, 1, 0.2039216, 1,
-0.3321995, -0.4751413, -2.414679, 0, 1, 0.2078431, 1,
-0.3318734, -0.5251682, -1.911527, 0, 1, 0.2156863, 1,
-0.3292256, 0.6256588, -0.8459243, 0, 1, 0.2196078, 1,
-0.326573, -0.2178113, 0.1492141, 0, 1, 0.227451, 1,
-0.3265317, 1.654155, 0.1536919, 0, 1, 0.2313726, 1,
-0.3237403, 1.093508, 1.196326, 0, 1, 0.2392157, 1,
-0.3194407, 1.802661, 1.042762, 0, 1, 0.2431373, 1,
-0.3190063, -0.6008016, -3.191061, 0, 1, 0.2509804, 1,
-0.3163788, 0.0523905, -2.615448, 0, 1, 0.254902, 1,
-0.3145367, 0.7792911, -2.320039, 0, 1, 0.2627451, 1,
-0.3144972, -0.9053982, -3.1877, 0, 1, 0.2666667, 1,
-0.3144369, 0.5731809, -0.2823063, 0, 1, 0.2745098, 1,
-0.3136874, -0.5462081, -1.003893, 0, 1, 0.2784314, 1,
-0.312623, 1.721812, -0.7160639, 0, 1, 0.2862745, 1,
-0.31214, 1.932338, -0.5962034, 0, 1, 0.2901961, 1,
-0.309664, -0.1085536, -2.791041, 0, 1, 0.2980392, 1,
-0.3094609, -0.7080933, -1.564849, 0, 1, 0.3058824, 1,
-0.305612, 1.528151, 0.1714581, 0, 1, 0.3098039, 1,
-0.3014388, -0.4303789, -1.505456, 0, 1, 0.3176471, 1,
-0.3008159, 0.0174444, -1.303207, 0, 1, 0.3215686, 1,
-0.2959571, 0.6664469, -0.3166657, 0, 1, 0.3294118, 1,
-0.2932322, 1.421438, 0.1893478, 0, 1, 0.3333333, 1,
-0.2925188, 1.15242, 0.2538857, 0, 1, 0.3411765, 1,
-0.2908286, 0.6917006, -0.3171305, 0, 1, 0.345098, 1,
-0.2866061, 1.543797, 1.308278, 0, 1, 0.3529412, 1,
-0.2863792, 0.9291618, 0.8614279, 0, 1, 0.3568628, 1,
-0.28616, -0.4902992, -0.8171688, 0, 1, 0.3647059, 1,
-0.2815782, 2.299242, 0.4817269, 0, 1, 0.3686275, 1,
-0.2725069, -0.1445248, -2.098845, 0, 1, 0.3764706, 1,
-0.2707275, 0.3757226, -2.641508, 0, 1, 0.3803922, 1,
-0.2677962, -0.8861773, -1.678184, 0, 1, 0.3882353, 1,
-0.2625573, 1.132704, -1.577671, 0, 1, 0.3921569, 1,
-0.2591398, -0.7476428, -2.923098, 0, 1, 0.4, 1,
-0.2473168, -0.4552718, -2.452256, 0, 1, 0.4078431, 1,
-0.2471767, 1.791396, 0.2907425, 0, 1, 0.4117647, 1,
-0.2445106, -0.9903432, -3.123748, 0, 1, 0.4196078, 1,
-0.2440421, 0.3052586, 0.1020839, 0, 1, 0.4235294, 1,
-0.2411628, -0.9274505, -1.661693, 0, 1, 0.4313726, 1,
-0.2403215, 0.79342, -0.8860853, 0, 1, 0.4352941, 1,
-0.2353545, 0.5279732, -0.0286266, 0, 1, 0.4431373, 1,
-0.235093, 0.2710164, 0.7467233, 0, 1, 0.4470588, 1,
-0.2338075, -0.8888101, -3.167819, 0, 1, 0.454902, 1,
-0.233029, 1.194702, -0.747305, 0, 1, 0.4588235, 1,
-0.2299926, -1.055495, -3.080686, 0, 1, 0.4666667, 1,
-0.2260119, 0.05260356, -0.1838465, 0, 1, 0.4705882, 1,
-0.22341, 0.1641252, -0.4811713, 0, 1, 0.4784314, 1,
-0.2233858, -0.5124097, -2.544262, 0, 1, 0.4823529, 1,
-0.2233168, -0.7508099, -2.730946, 0, 1, 0.4901961, 1,
-0.2200646, -0.251655, -3.171237, 0, 1, 0.4941176, 1,
-0.216894, -0.4387553, -0.5104285, 0, 1, 0.5019608, 1,
-0.2143749, 0.5246107, -0.9836214, 0, 1, 0.509804, 1,
-0.2118976, -0.4144816, -3.385199, 0, 1, 0.5137255, 1,
-0.2100648, -0.7305818, -4.392264, 0, 1, 0.5215687, 1,
-0.2061685, -0.1646874, -2.89418, 0, 1, 0.5254902, 1,
-0.2042892, 0.004106265, -2.957836, 0, 1, 0.5333334, 1,
-0.2042612, -0.6652312, -5.030813, 0, 1, 0.5372549, 1,
-0.2028567, -2.18623, -3.030627, 0, 1, 0.5450981, 1,
-0.2002044, 0.9958367, -1.48396, 0, 1, 0.5490196, 1,
-0.1947823, 1.434533, 1.405424, 0, 1, 0.5568628, 1,
-0.1931676, -0.0313695, -1.949117, 0, 1, 0.5607843, 1,
-0.1917585, 1.731893, 0.493613, 0, 1, 0.5686275, 1,
-0.190582, -0.2668267, -2.3361, 0, 1, 0.572549, 1,
-0.1899322, 0.3964572, 0.150112, 0, 1, 0.5803922, 1,
-0.1881972, 0.076414, -2.550684, 0, 1, 0.5843138, 1,
-0.1850033, -2.83451, -2.307104, 0, 1, 0.5921569, 1,
-0.1834321, -0.1928134, -2.689681, 0, 1, 0.5960785, 1,
-0.1731372, 0.0416215, -1.347001, 0, 1, 0.6039216, 1,
-0.1713868, 1.272193, -1.602991, 0, 1, 0.6117647, 1,
-0.1705258, 0.4528435, -0.164068, 0, 1, 0.6156863, 1,
-0.1658773, 0.2344591, -1.001338, 0, 1, 0.6235294, 1,
-0.1602987, 0.1983472, -1.962409, 0, 1, 0.627451, 1,
-0.1553098, 0.4782577, -0.3760322, 0, 1, 0.6352941, 1,
-0.1546439, -0.1440171, -1.832084, 0, 1, 0.6392157, 1,
-0.145587, -1.656194, -4.941815, 0, 1, 0.6470588, 1,
-0.141553, 1.174564, 0.02397922, 0, 1, 0.6509804, 1,
-0.1340457, 0.3407931, -0.588762, 0, 1, 0.6588235, 1,
-0.1339046, -0.7211291, -0.6653808, 0, 1, 0.6627451, 1,
-0.1315936, 1.647629, -0.1994632, 0, 1, 0.6705883, 1,
-0.1292623, 0.2120637, -1.172244, 0, 1, 0.6745098, 1,
-0.1259993, -0.572009, -2.842885, 0, 1, 0.682353, 1,
-0.1239327, 0.5134022, -0.9473234, 0, 1, 0.6862745, 1,
-0.1230737, -0.06299605, -1.666788, 0, 1, 0.6941177, 1,
-0.1158876, 1.423354, -0.5069377, 0, 1, 0.7019608, 1,
-0.1151281, -1.555867, -4.338851, 0, 1, 0.7058824, 1,
-0.1147718, -1.150861, -3.514479, 0, 1, 0.7137255, 1,
-0.1141079, 0.4161615, -0.7312232, 0, 1, 0.7176471, 1,
-0.1133565, -1.746152, -1.855205, 0, 1, 0.7254902, 1,
-0.1126762, -0.2317686, -1.250606, 0, 1, 0.7294118, 1,
-0.1113451, 1.118301, 0.8513947, 0, 1, 0.7372549, 1,
-0.1005924, 1.564355, 1.741701, 0, 1, 0.7411765, 1,
-0.09895366, 0.2853503, -1.060133, 0, 1, 0.7490196, 1,
-0.09892973, -0.06260453, -3.394282, 0, 1, 0.7529412, 1,
-0.09683938, -0.00909581, -1.033893, 0, 1, 0.7607843, 1,
-0.09583002, -0.09558089, -1.937242, 0, 1, 0.7647059, 1,
-0.09148818, 0.8893225, 0.421086, 0, 1, 0.772549, 1,
-0.09088496, -0.09804855, -3.373878, 0, 1, 0.7764706, 1,
-0.08748407, -0.8465193, -2.231356, 0, 1, 0.7843137, 1,
-0.06919832, 1.925745, -0.3869204, 0, 1, 0.7882353, 1,
-0.06919368, -1.239767, -4.558916, 0, 1, 0.7960784, 1,
-0.06865922, 1.449367, -0.9663501, 0, 1, 0.8039216, 1,
-0.05870284, -0.7807723, -4.697825, 0, 1, 0.8078431, 1,
-0.05427687, 0.3051773, 0.7439922, 0, 1, 0.8156863, 1,
-0.04961238, -0.2578747, -4.009274, 0, 1, 0.8196079, 1,
-0.0459258, 1.588142, -1.737981, 0, 1, 0.827451, 1,
-0.04518676, 0.3005524, -1.158111, 0, 1, 0.8313726, 1,
-0.04515107, 1.176984, -0.1407101, 0, 1, 0.8392157, 1,
-0.04411749, -1.123713, -3.753377, 0, 1, 0.8431373, 1,
-0.04258381, -0.4915816, -1.620557, 0, 1, 0.8509804, 1,
-0.04196479, -0.5727533, -4.871948, 0, 1, 0.854902, 1,
-0.04181616, -0.5241647, -3.32731, 0, 1, 0.8627451, 1,
-0.03769642, 0.2006298, 0.6989846, 0, 1, 0.8666667, 1,
-0.03627773, -0.7510135, -4.513186, 0, 1, 0.8745098, 1,
-0.03617991, -0.8840408, -4.865653, 0, 1, 0.8784314, 1,
-0.03537892, -1.527389, -4.469788, 0, 1, 0.8862745, 1,
-0.02775887, -0.4607375, -3.374935, 0, 1, 0.8901961, 1,
-0.02699272, -0.5058233, -2.180594, 0, 1, 0.8980392, 1,
-0.0257281, -0.7997686, -3.809183, 0, 1, 0.9058824, 1,
-0.02343059, -0.09629692, -1.264374, 0, 1, 0.9098039, 1,
-0.02197851, 0.847977, 0.752343, 0, 1, 0.9176471, 1,
-0.01850911, -0.8513911, -3.377522, 0, 1, 0.9215686, 1,
-0.01640401, 1.020168, -1.170963, 0, 1, 0.9294118, 1,
-0.01354075, 0.9808313, -1.100336, 0, 1, 0.9333333, 1,
-0.01091039, -1.477417, -4.282236, 0, 1, 0.9411765, 1,
-0.00327901, -0.565991, -1.570736, 0, 1, 0.945098, 1,
-0.002634106, -0.3528871, -3.643406, 0, 1, 0.9529412, 1,
-0.002111922, -2.023489, -3.931747, 0, 1, 0.9568627, 1,
-0.001684474, 1.869593, 0.5270389, 0, 1, 0.9647059, 1,
0.0005927006, -1.786909, 1.812088, 0, 1, 0.9686275, 1,
0.003018127, -1.246367, 3.436609, 0, 1, 0.9764706, 1,
0.004240779, -1.175157, 3.308854, 0, 1, 0.9803922, 1,
0.006807359, -0.9936197, 4.98981, 0, 1, 0.9882353, 1,
0.008336878, 0.07564053, -0.7985714, 0, 1, 0.9921569, 1,
0.00900849, 0.6260275, 1.087714, 0, 1, 1, 1,
0.01231223, -1.222918, 3.431955, 0, 0.9921569, 1, 1,
0.01316557, -1.06534, 1.994484, 0, 0.9882353, 1, 1,
0.01456456, 0.8177095, 0.3401414, 0, 0.9803922, 1, 1,
0.01486042, -1.018106, 4.48103, 0, 0.9764706, 1, 1,
0.01499211, -0.7165591, 2.019031, 0, 0.9686275, 1, 1,
0.01668437, 0.4729835, 0.2067521, 0, 0.9647059, 1, 1,
0.01703541, -0.2066112, 5.079997, 0, 0.9568627, 1, 1,
0.01836686, -0.2985989, 3.389541, 0, 0.9529412, 1, 1,
0.01953151, 0.1934478, -0.05777474, 0, 0.945098, 1, 1,
0.02181832, -1.119639, 4.325024, 0, 0.9411765, 1, 1,
0.02242841, 1.445368, 0.1214218, 0, 0.9333333, 1, 1,
0.02397594, 0.2548139, 2.247396, 0, 0.9294118, 1, 1,
0.02711889, 0.7794582, 1.882727, 0, 0.9215686, 1, 1,
0.02777394, 1.217726, -0.3564286, 0, 0.9176471, 1, 1,
0.02833376, -0.04432351, 4.427857, 0, 0.9098039, 1, 1,
0.0350136, 0.3810258, 1.753128, 0, 0.9058824, 1, 1,
0.03534569, -0.5106562, 1.337428, 0, 0.8980392, 1, 1,
0.03810536, 0.4758607, -0.0791169, 0, 0.8901961, 1, 1,
0.0404483, 0.6073058, 1.831633, 0, 0.8862745, 1, 1,
0.04117892, -0.006096954, 1.395353, 0, 0.8784314, 1, 1,
0.0417176, -1.006294, 1.990797, 0, 0.8745098, 1, 1,
0.04333217, -1.574387, 3.915505, 0, 0.8666667, 1, 1,
0.04433856, -0.6779979, 3.298354, 0, 0.8627451, 1, 1,
0.04883814, -1.246098, 1.733958, 0, 0.854902, 1, 1,
0.0536018, 2.055558, 1.472152, 0, 0.8509804, 1, 1,
0.05589916, -2.128982, 3.544718, 0, 0.8431373, 1, 1,
0.05682926, -0.4085605, 3.587913, 0, 0.8392157, 1, 1,
0.05731241, -1.704282, 1.924266, 0, 0.8313726, 1, 1,
0.05999827, 2.216334, -1.680293, 0, 0.827451, 1, 1,
0.06384968, -0.4822136, 3.448285, 0, 0.8196079, 1, 1,
0.0660592, -0.7994419, 4.107011, 0, 0.8156863, 1, 1,
0.06883411, 1.49443, -0.06706914, 0, 0.8078431, 1, 1,
0.07021694, -0.21089, 2.586275, 0, 0.8039216, 1, 1,
0.07194902, -0.8867898, 3.463982, 0, 0.7960784, 1, 1,
0.07882218, -1.538847, 2.812164, 0, 0.7882353, 1, 1,
0.0816135, -0.2114631, 2.698559, 0, 0.7843137, 1, 1,
0.08307659, 1.557642, -0.4223018, 0, 0.7764706, 1, 1,
0.08466636, 2.618728, 0.7164233, 0, 0.772549, 1, 1,
0.09514636, 0.5160259, 1.153439, 0, 0.7647059, 1, 1,
0.09532894, 0.8170587, -0.9087256, 0, 0.7607843, 1, 1,
0.09759271, 1.507503, -2.251651, 0, 0.7529412, 1, 1,
0.09936963, 0.08824272, 0.9844376, 0, 0.7490196, 1, 1,
0.09956477, -0.04761296, 3.270295, 0, 0.7411765, 1, 1,
0.1009792, 1.651603, 1.220946, 0, 0.7372549, 1, 1,
0.1127787, -0.4395365, 2.125906, 0, 0.7294118, 1, 1,
0.1170861, -1.180431, 3.304451, 0, 0.7254902, 1, 1,
0.1198099, -1.284914, 3.550063, 0, 0.7176471, 1, 1,
0.1217455, -0.6372671, 5.804628, 0, 0.7137255, 1, 1,
0.1240064, 1.44681, -0.381843, 0, 0.7058824, 1, 1,
0.1261953, -0.1544132, 3.49714, 0, 0.6980392, 1, 1,
0.1268561, 0.6290829, 0.09031282, 0, 0.6941177, 1, 1,
0.127296, 1.02653, -1.372952, 0, 0.6862745, 1, 1,
0.1311409, -1.146484, 1.502436, 0, 0.682353, 1, 1,
0.1312995, 0.6999757, 0.173156, 0, 0.6745098, 1, 1,
0.1362704, -0.3525564, 3.868037, 0, 0.6705883, 1, 1,
0.1397124, 0.3124628, 1.800807, 0, 0.6627451, 1, 1,
0.1405643, 1.398289, -1.310226, 0, 0.6588235, 1, 1,
0.1429103, -1.427369, 3.984914, 0, 0.6509804, 1, 1,
0.1436712, -1.054361, 1.139187, 0, 0.6470588, 1, 1,
0.1450635, 0.04384609, 1.389799, 0, 0.6392157, 1, 1,
0.1456133, 2.331978, 0.9397354, 0, 0.6352941, 1, 1,
0.1468277, -2.785684, 4.47915, 0, 0.627451, 1, 1,
0.1531746, -0.7748566, 5.39415, 0, 0.6235294, 1, 1,
0.1533946, -0.0317492, 0.9790886, 0, 0.6156863, 1, 1,
0.1561035, -0.3831588, 1.335136, 0, 0.6117647, 1, 1,
0.1590959, 0.250911, 1.11196, 0, 0.6039216, 1, 1,
0.1613087, 1.05216, 0.6416107, 0, 0.5960785, 1, 1,
0.1622217, 0.0338721, 2.761127, 0, 0.5921569, 1, 1,
0.1626, 0.3073494, -1.217263, 0, 0.5843138, 1, 1,
0.1661138, -0.4055059, 1.221249, 0, 0.5803922, 1, 1,
0.1664765, -1.326741, 1.7053, 0, 0.572549, 1, 1,
0.166518, 2.147187, 0.3326823, 0, 0.5686275, 1, 1,
0.1700007, 0.927295, 0.7602031, 0, 0.5607843, 1, 1,
0.1770966, -0.1764996, 1.30036, 0, 0.5568628, 1, 1,
0.1787613, -0.778758, 3.097501, 0, 0.5490196, 1, 1,
0.1812468, 2.494492, -0.2260606, 0, 0.5450981, 1, 1,
0.1871591, 0.9192024, 1.481302, 0, 0.5372549, 1, 1,
0.1905924, -0.2908515, 3.864043, 0, 0.5333334, 1, 1,
0.1959005, 1.436596, -0.1137211, 0, 0.5254902, 1, 1,
0.1971445, -0.4100425, 2.068483, 0, 0.5215687, 1, 1,
0.1974719, -0.04414991, 2.681283, 0, 0.5137255, 1, 1,
0.1978156, 1.894761, -0.9928249, 0, 0.509804, 1, 1,
0.198285, 2.208125, 2.557978, 0, 0.5019608, 1, 1,
0.1985001, 0.6416318, -0.3248703, 0, 0.4941176, 1, 1,
0.1990913, 0.5990082, 0.7764484, 0, 0.4901961, 1, 1,
0.199233, 0.2519174, -0.1159309, 0, 0.4823529, 1, 1,
0.2050702, 0.1875841, 2.107982, 0, 0.4784314, 1, 1,
0.2057474, 0.1804586, 1.172606, 0, 0.4705882, 1, 1,
0.2064861, 1.602206, 0.5919938, 0, 0.4666667, 1, 1,
0.2089816, 1.416102, 0.562468, 0, 0.4588235, 1, 1,
0.2101469, 0.08481424, 0.6504381, 0, 0.454902, 1, 1,
0.213091, 0.6775225, -0.8523348, 0, 0.4470588, 1, 1,
0.2134834, -1.469911, 4.773612, 0, 0.4431373, 1, 1,
0.222051, 0.3222213, -0.001674205, 0, 0.4352941, 1, 1,
0.2239856, -0.495948, 3.885976, 0, 0.4313726, 1, 1,
0.2241628, 0.5527215, 1.122006, 0, 0.4235294, 1, 1,
0.2243219, -0.189637, 2.762452, 0, 0.4196078, 1, 1,
0.2246212, 1.165736, 0.2810075, 0, 0.4117647, 1, 1,
0.2285767, 0.9060736, -0.4770975, 0, 0.4078431, 1, 1,
0.2315177, -1.163246, 2.871588, 0, 0.4, 1, 1,
0.2320264, -0.373451, 2.533294, 0, 0.3921569, 1, 1,
0.232104, -0.9756219, 1.899459, 0, 0.3882353, 1, 1,
0.2325059, -0.03234806, 2.30919, 0, 0.3803922, 1, 1,
0.232941, 0.5404242, -0.4436708, 0, 0.3764706, 1, 1,
0.2333966, 0.1711645, 1.534034, 0, 0.3686275, 1, 1,
0.2340941, 0.2707428, 0.9661395, 0, 0.3647059, 1, 1,
0.2351265, -0.2410102, 3.38164, 0, 0.3568628, 1, 1,
0.2351514, -2.1159, 3.276827, 0, 0.3529412, 1, 1,
0.2378151, -0.2205561, 3.061368, 0, 0.345098, 1, 1,
0.2392018, -1.055324, 1.916074, 0, 0.3411765, 1, 1,
0.2434101, 0.6459692, 0.9270124, 0, 0.3333333, 1, 1,
0.2445448, -1.74368, 5.275947, 0, 0.3294118, 1, 1,
0.2562445, -0.6769202, 3.328374, 0, 0.3215686, 1, 1,
0.2576518, 0.1716788, 1.534485, 0, 0.3176471, 1, 1,
0.2584626, -0.1426571, 3.075397, 0, 0.3098039, 1, 1,
0.261679, -0.9406661, 2.322155, 0, 0.3058824, 1, 1,
0.2648113, 0.6862022, 0.7834362, 0, 0.2980392, 1, 1,
0.2675065, 0.7275041, -0.03434229, 0, 0.2901961, 1, 1,
0.2678131, -0.5775306, 3.191827, 0, 0.2862745, 1, 1,
0.2680338, -0.0108683, 2.299223, 0, 0.2784314, 1, 1,
0.2686406, -1.548354, 2.040608, 0, 0.2745098, 1, 1,
0.2708705, -0.7557426, 1.076496, 0, 0.2666667, 1, 1,
0.2721951, -1.161057, 3.344149, 0, 0.2627451, 1, 1,
0.2790684, 0.1120252, 1.322755, 0, 0.254902, 1, 1,
0.2794383, 0.3940627, 1.504829, 0, 0.2509804, 1, 1,
0.2809792, -0.1710333, 1.243131, 0, 0.2431373, 1, 1,
0.2830724, 0.9820428, -0.02952136, 0, 0.2392157, 1, 1,
0.2835249, -0.6027425, 1.331077, 0, 0.2313726, 1, 1,
0.2844244, 0.5910538, 1.071077, 0, 0.227451, 1, 1,
0.2886818, 0.1248517, 2.868146, 0, 0.2196078, 1, 1,
0.2888155, 0.1970451, 1.642307, 0, 0.2156863, 1, 1,
0.2914317, 0.2049452, 2.068849, 0, 0.2078431, 1, 1,
0.2917769, -1.190658, 2.667448, 0, 0.2039216, 1, 1,
0.2983688, 0.09811804, 2.538595, 0, 0.1960784, 1, 1,
0.2999074, 0.1833329, 2.057956, 0, 0.1882353, 1, 1,
0.2999083, 0.8340806, 0.29163, 0, 0.1843137, 1, 1,
0.3007851, -0.116906, 1.490463, 0, 0.1764706, 1, 1,
0.3016078, 0.3050275, 2.042212, 0, 0.172549, 1, 1,
0.309253, -0.3634194, 1.517521, 0, 0.1647059, 1, 1,
0.3109019, -0.203405, 2.25583, 0, 0.1607843, 1, 1,
0.3147636, -1.403871, 3.791794, 0, 0.1529412, 1, 1,
0.317495, -1.517755, 2.943173, 0, 0.1490196, 1, 1,
0.3208611, -1.950189, 2.046349, 0, 0.1411765, 1, 1,
0.3256359, -0.3728446, 2.109726, 0, 0.1372549, 1, 1,
0.3259399, -2.10835, 4.016846, 0, 0.1294118, 1, 1,
0.3281073, 0.2548364, 2.853997, 0, 0.1254902, 1, 1,
0.3312205, -1.230274, 2.575397, 0, 0.1176471, 1, 1,
0.3344159, -1.106339, 1.196854, 0, 0.1137255, 1, 1,
0.3354693, 0.2151394, 0.5941429, 0, 0.1058824, 1, 1,
0.3383328, 0.8538583, -0.454356, 0, 0.09803922, 1, 1,
0.3389199, -0.8719811, 2.261603, 0, 0.09411765, 1, 1,
0.3400163, 0.3442249, -0.3133908, 0, 0.08627451, 1, 1,
0.3420848, -0.2641249, 0.1066225, 0, 0.08235294, 1, 1,
0.344148, 0.501525, -0.4837291, 0, 0.07450981, 1, 1,
0.3485844, -1.035975, 1.881219, 0, 0.07058824, 1, 1,
0.3491199, 0.4957466, 2.038047, 0, 0.0627451, 1, 1,
0.3543188, 2.021694, -0.7716464, 0, 0.05882353, 1, 1,
0.3546167, 0.9029104, 0.3010626, 0, 0.05098039, 1, 1,
0.3593847, 0.3124373, -0.2935449, 0, 0.04705882, 1, 1,
0.3630404, 0.9810277, -0.6622456, 0, 0.03921569, 1, 1,
0.3642547, 0.3250037, 0.905874, 0, 0.03529412, 1, 1,
0.3664727, -0.7565789, 3.647265, 0, 0.02745098, 1, 1,
0.36724, 2.520045, 1.076423, 0, 0.02352941, 1, 1,
0.3689147, 0.3629591, 0.9369984, 0, 0.01568628, 1, 1,
0.3708589, 0.6536886, 1.540642, 0, 0.01176471, 1, 1,
0.3714976, 0.1847118, 1.186301, 0, 0.003921569, 1, 1,
0.3721104, 1.011952, 0.6760989, 0.003921569, 0, 1, 1,
0.3728595, 1.667548, -0.07991024, 0.007843138, 0, 1, 1,
0.379191, -0.0841185, -0.2246503, 0.01568628, 0, 1, 1,
0.3927387, -1.646391, 3.105583, 0.01960784, 0, 1, 1,
0.397764, -0.7601721, 2.102159, 0.02745098, 0, 1, 1,
0.3998902, 0.7566884, -0.2542207, 0.03137255, 0, 1, 1,
0.4046786, 0.8843041, -1.647983, 0.03921569, 0, 1, 1,
0.4275574, -1.415851, 3.023036, 0.04313726, 0, 1, 1,
0.4290119, -0.7600592, 2.042856, 0.05098039, 0, 1, 1,
0.4324834, -0.8966213, 2.259727, 0.05490196, 0, 1, 1,
0.4331224, -0.2218022, 1.992218, 0.0627451, 0, 1, 1,
0.435848, 0.6514179, 0.5483376, 0.06666667, 0, 1, 1,
0.4375484, -1.416081, 3.786346, 0.07450981, 0, 1, 1,
0.4389726, -0.3330711, 3.305043, 0.07843138, 0, 1, 1,
0.4421461, -0.3017892, 1.452494, 0.08627451, 0, 1, 1,
0.4423855, -0.5263019, 3.892658, 0.09019608, 0, 1, 1,
0.4510553, 0.4234102, 2.288843, 0.09803922, 0, 1, 1,
0.4544811, -0.9300413, 2.444991, 0.1058824, 0, 1, 1,
0.4575335, 0.5559909, -1.246222, 0.1098039, 0, 1, 1,
0.461147, 0.3944528, 0.6090631, 0.1176471, 0, 1, 1,
0.4632025, -0.404945, 2.79114, 0.1215686, 0, 1, 1,
0.4641589, 1.87758, -0.887449, 0.1294118, 0, 1, 1,
0.4650247, -0.5579068, 1.641432, 0.1333333, 0, 1, 1,
0.4655075, -0.9158269, 4.150689, 0.1411765, 0, 1, 1,
0.4700511, -0.1638307, 3.023537, 0.145098, 0, 1, 1,
0.4713059, -0.02434642, 2.865097, 0.1529412, 0, 1, 1,
0.4781096, 0.921204, 1.730745, 0.1568628, 0, 1, 1,
0.4793523, 1.238272, 0.7632341, 0.1647059, 0, 1, 1,
0.4820215, 0.6386878, 1.145709, 0.1686275, 0, 1, 1,
0.4830861, -0.9672316, 3.603471, 0.1764706, 0, 1, 1,
0.4844747, 0.6254002, -0.3530229, 0.1803922, 0, 1, 1,
0.4847467, 0.01108824, 0.938517, 0.1882353, 0, 1, 1,
0.4862713, -0.7541246, 1.135485, 0.1921569, 0, 1, 1,
0.4876331, -0.4650383, 3.257465, 0.2, 0, 1, 1,
0.4886194, -0.9344795, 3.34321, 0.2078431, 0, 1, 1,
0.4889954, -2.358253, 2.484883, 0.2117647, 0, 1, 1,
0.4896705, 1.541842, -0.1010549, 0.2196078, 0, 1, 1,
0.4948862, 0.8485284, 0.2019453, 0.2235294, 0, 1, 1,
0.4986326, -0.6579866, 3.566263, 0.2313726, 0, 1, 1,
0.4993244, -0.3156276, 2.095397, 0.2352941, 0, 1, 1,
0.5028731, 0.04100276, 0.6666844, 0.2431373, 0, 1, 1,
0.5033979, -0.5558239, 3.591291, 0.2470588, 0, 1, 1,
0.5105264, 0.5770879, 0.5773523, 0.254902, 0, 1, 1,
0.5113806, 0.515215, 0.8243607, 0.2588235, 0, 1, 1,
0.5223399, -1.148235, 3.03955, 0.2666667, 0, 1, 1,
0.524219, 0.1203087, 0.2067627, 0.2705882, 0, 1, 1,
0.5259637, -1.22215, 2.486471, 0.2784314, 0, 1, 1,
0.5286545, 0.8863115, 1.13102, 0.282353, 0, 1, 1,
0.5326178, -1.504641, 4.690881, 0.2901961, 0, 1, 1,
0.5380158, -0.2406178, 1.91651, 0.2941177, 0, 1, 1,
0.5420887, -0.2193785, 3.59765, 0.3019608, 0, 1, 1,
0.5512743, 0.3569231, 1.10657, 0.3098039, 0, 1, 1,
0.5561677, 0.0006767471, 1.943447, 0.3137255, 0, 1, 1,
0.5575674, -0.1325355, 1.771734, 0.3215686, 0, 1, 1,
0.5608559, 0.2190844, 0.329197, 0.3254902, 0, 1, 1,
0.5623254, -1.056077, 1.67226, 0.3333333, 0, 1, 1,
0.5674196, 1.9787, -0.473633, 0.3372549, 0, 1, 1,
0.5681273, -0.5447387, 0.4512563, 0.345098, 0, 1, 1,
0.5681612, 0.8365844, -0.263866, 0.3490196, 0, 1, 1,
0.5711156, -0.4418595, 2.872693, 0.3568628, 0, 1, 1,
0.5733309, 0.3852585, 0.3670133, 0.3607843, 0, 1, 1,
0.5733766, -0.8245847, 2.571864, 0.3686275, 0, 1, 1,
0.5736139, -0.9011848, 3.272408, 0.372549, 0, 1, 1,
0.5748033, -0.5424045, 1.362556, 0.3803922, 0, 1, 1,
0.5752578, -1.09409, 2.843088, 0.3843137, 0, 1, 1,
0.5775332, 0.5254487, 0.5328624, 0.3921569, 0, 1, 1,
0.5780618, 0.06237954, 0.8568065, 0.3960784, 0, 1, 1,
0.5787907, -1.735859, 2.552661, 0.4039216, 0, 1, 1,
0.5810955, 0.5669501, 0.267717, 0.4117647, 0, 1, 1,
0.5846967, 1.55143, -0.1437944, 0.4156863, 0, 1, 1,
0.5866311, -0.1874811, 2.749873, 0.4235294, 0, 1, 1,
0.592944, -0.001679588, 2.247185, 0.427451, 0, 1, 1,
0.5990585, -0.8517566, 3.427418, 0.4352941, 0, 1, 1,
0.5994577, 2.064135, 1.547601, 0.4392157, 0, 1, 1,
0.6035551, 2.974337, 0.7343673, 0.4470588, 0, 1, 1,
0.6039374, 0.2376734, 1.472599, 0.4509804, 0, 1, 1,
0.6065618, 1.374592, -0.09581976, 0.4588235, 0, 1, 1,
0.6068851, -1.534842, 3.193246, 0.4627451, 0, 1, 1,
0.6080081, 1.404519, 1.27961, 0.4705882, 0, 1, 1,
0.6084275, -1.068105, 3.482518, 0.4745098, 0, 1, 1,
0.6194115, 0.4093287, 0.7823432, 0.4823529, 0, 1, 1,
0.6240817, -1.464256, 1.165391, 0.4862745, 0, 1, 1,
0.6256338, -0.2657712, 1.782643, 0.4941176, 0, 1, 1,
0.6296926, 1.513662, 1.863573, 0.5019608, 0, 1, 1,
0.6336501, 1.909127, -0.181441, 0.5058824, 0, 1, 1,
0.6449347, -0.1989791, 1.024891, 0.5137255, 0, 1, 1,
0.6460842, 1.604811, 0.4143654, 0.5176471, 0, 1, 1,
0.6471403, 0.7213382, 0.499027, 0.5254902, 0, 1, 1,
0.649216, 0.141668, 1.62545, 0.5294118, 0, 1, 1,
0.6531985, 0.7379637, 0.1383994, 0.5372549, 0, 1, 1,
0.6551204, -0.0863283, 2.888051, 0.5411765, 0, 1, 1,
0.662441, -1.705893, 2.856649, 0.5490196, 0, 1, 1,
0.6648656, -1.239686, 3.606448, 0.5529412, 0, 1, 1,
0.6673181, -0.1332267, 0.6938756, 0.5607843, 0, 1, 1,
0.6713032, -0.6410194, 1.238282, 0.5647059, 0, 1, 1,
0.6734307, 1.030898, -0.6296565, 0.572549, 0, 1, 1,
0.6799417, 0.1739992, 1.994322, 0.5764706, 0, 1, 1,
0.6844859, 0.1016602, 0.7700489, 0.5843138, 0, 1, 1,
0.6850296, -0.1662437, 2.149613, 0.5882353, 0, 1, 1,
0.6867268, 0.6932172, -0.2872384, 0.5960785, 0, 1, 1,
0.6882749, 2.496989, 0.4591778, 0.6039216, 0, 1, 1,
0.6900694, 0.7096173, 1.080707, 0.6078432, 0, 1, 1,
0.7013204, 0.7961859, 2.460111, 0.6156863, 0, 1, 1,
0.7014724, -0.1143356, 0.7890902, 0.6196079, 0, 1, 1,
0.7066053, 0.9203134, 1.560268, 0.627451, 0, 1, 1,
0.7151412, -1.372153, 1.023709, 0.6313726, 0, 1, 1,
0.723324, -1.366651, 2.250859, 0.6392157, 0, 1, 1,
0.724444, -0.4462076, 1.139126, 0.6431373, 0, 1, 1,
0.7284412, -1.814462, 4.1084, 0.6509804, 0, 1, 1,
0.73234, 2.149405, 0.3297503, 0.654902, 0, 1, 1,
0.7360445, -0.02480024, 2.614317, 0.6627451, 0, 1, 1,
0.743423, -0.5482221, 2.365387, 0.6666667, 0, 1, 1,
0.7434487, -0.6026038, 0.5069834, 0.6745098, 0, 1, 1,
0.744525, 0.6633747, -0.01311094, 0.6784314, 0, 1, 1,
0.7465081, -0.8666263, 3.193036, 0.6862745, 0, 1, 1,
0.7488681, -1.065107, 2.18166, 0.6901961, 0, 1, 1,
0.7490771, -1.126677, 4.071203, 0.6980392, 0, 1, 1,
0.7490849, -1.500265, 1.429527, 0.7058824, 0, 1, 1,
0.757713, 0.8622977, 0.08860568, 0.7098039, 0, 1, 1,
0.7610793, 0.1306199, 0.2426089, 0.7176471, 0, 1, 1,
0.7611412, 1.254769, -0.1290114, 0.7215686, 0, 1, 1,
0.7638743, 0.4232674, 2.998662, 0.7294118, 0, 1, 1,
0.7718062, -0.538937, 2.971337, 0.7333333, 0, 1, 1,
0.7768291, 1.932066, -1.435067, 0.7411765, 0, 1, 1,
0.7779406, -0.07450045, 2.627608, 0.7450981, 0, 1, 1,
0.7799888, 0.1154061, 0.2466528, 0.7529412, 0, 1, 1,
0.7807363, -2.604896, 2.781371, 0.7568628, 0, 1, 1,
0.7813782, 1.129619, 1.440519, 0.7647059, 0, 1, 1,
0.7839311, -0.2514495, 2.999842, 0.7686275, 0, 1, 1,
0.7897301, 2.613714, 1.066005, 0.7764706, 0, 1, 1,
0.7898685, 0.3167379, -0.9342542, 0.7803922, 0, 1, 1,
0.7993463, 1.05376, 0.6562123, 0.7882353, 0, 1, 1,
0.8141167, 2.932616, 0.2070187, 0.7921569, 0, 1, 1,
0.8188524, 0.3965284, 1.714493, 0.8, 0, 1, 1,
0.8218962, 1.469004, 2.558135, 0.8078431, 0, 1, 1,
0.8290852, 1.052487, -0.389718, 0.8117647, 0, 1, 1,
0.8295314, 0.4374421, 2.535328, 0.8196079, 0, 1, 1,
0.8382883, -0.2035982, 1.776247, 0.8235294, 0, 1, 1,
0.8430384, -0.2463933, 2.874036, 0.8313726, 0, 1, 1,
0.8442044, 0.09260856, 2.006269, 0.8352941, 0, 1, 1,
0.8451833, -1.129802, 2.623732, 0.8431373, 0, 1, 1,
0.8489818, -0.2638613, 0.4005736, 0.8470588, 0, 1, 1,
0.8622499, 0.2693498, 0.9049319, 0.854902, 0, 1, 1,
0.870754, -0.2183189, 0.4248089, 0.8588235, 0, 1, 1,
0.8713973, -1.276293, 1.88563, 0.8666667, 0, 1, 1,
0.873117, -0.8495317, 2.09901, 0.8705882, 0, 1, 1,
0.8745649, -0.4921402, 2.942745, 0.8784314, 0, 1, 1,
0.8750283, -1.257801, 3.723723, 0.8823529, 0, 1, 1,
0.8752912, -1.072101, 3.730068, 0.8901961, 0, 1, 1,
0.8754806, 1.194643, 2.195864, 0.8941177, 0, 1, 1,
0.8797463, 0.4700992, 1.632314, 0.9019608, 0, 1, 1,
0.880466, 0.6163739, 0.12987, 0.9098039, 0, 1, 1,
0.8859113, 0.3449094, 1.702964, 0.9137255, 0, 1, 1,
0.8874958, 0.1158785, 2.090755, 0.9215686, 0, 1, 1,
0.9044554, -0.1320796, 1.444277, 0.9254902, 0, 1, 1,
0.9050376, 0.1852782, 0.5993252, 0.9333333, 0, 1, 1,
0.9075249, -1.701775, 1.90141, 0.9372549, 0, 1, 1,
0.9082547, 0.200087, 0.3088617, 0.945098, 0, 1, 1,
0.9095998, 1.469225, 0.4982188, 0.9490196, 0, 1, 1,
0.9196084, -0.127012, 2.288683, 0.9568627, 0, 1, 1,
0.9210079, 0.828856, -1.133009, 0.9607843, 0, 1, 1,
0.9236668, -0.5863335, 3.469556, 0.9686275, 0, 1, 1,
0.9318637, -0.03895491, 1.683764, 0.972549, 0, 1, 1,
0.9346622, 0.513131, 1.941726, 0.9803922, 0, 1, 1,
0.9453501, -0.1631112, 1.892814, 0.9843137, 0, 1, 1,
0.948487, -0.5141343, 2.263901, 0.9921569, 0, 1, 1,
0.9509989, -1.315818, 2.074969, 0.9960784, 0, 1, 1,
0.9550492, -0.06745455, 1.61218, 1, 0, 0.9960784, 1,
0.9565119, 1.608125, 0.2731316, 1, 0, 0.9882353, 1,
0.9590032, -0.5586697, 2.529125, 1, 0, 0.9843137, 1,
0.9605157, -0.8096837, 0.8955165, 1, 0, 0.9764706, 1,
0.967351, 0.01721267, 0.4590631, 1, 0, 0.972549, 1,
0.978987, -0.1140421, 2.535932, 1, 0, 0.9647059, 1,
0.9829233, -0.7667179, 1.911583, 1, 0, 0.9607843, 1,
0.9896122, -0.05574745, 0.7555046, 1, 0, 0.9529412, 1,
0.9970475, 1.144069, 0.2078429, 1, 0, 0.9490196, 1,
1.005062, 0.434922, -0.8427969, 1, 0, 0.9411765, 1,
1.006381, 0.871407, -0.8437853, 1, 0, 0.9372549, 1,
1.017586, 0.52013, 0.2075501, 1, 0, 0.9294118, 1,
1.026786, -1.367124, 1.753467, 1, 0, 0.9254902, 1,
1.027729, 0.9425122, 0.8488752, 1, 0, 0.9176471, 1,
1.028529, 1.250671, -0.7398013, 1, 0, 0.9137255, 1,
1.038342, -0.2003112, 2.222263, 1, 0, 0.9058824, 1,
1.047178, -1.124623, 2.153873, 1, 0, 0.9019608, 1,
1.052298, -0.1958907, 2.342276, 1, 0, 0.8941177, 1,
1.054878, 0.5378627, 0.5360793, 1, 0, 0.8862745, 1,
1.065345, -0.06361473, 2.78084, 1, 0, 0.8823529, 1,
1.071174, 0.9474593, 2.060889, 1, 0, 0.8745098, 1,
1.071613, 1.106203, 0.624117, 1, 0, 0.8705882, 1,
1.075829, -1.495601, 0.002918898, 1, 0, 0.8627451, 1,
1.086721, 0.0491185, 0.8048391, 1, 0, 0.8588235, 1,
1.089863, 0.7839614, 2.66854, 1, 0, 0.8509804, 1,
1.090442, 0.06646555, 1.802009, 1, 0, 0.8470588, 1,
1.092765, 1.368299, 0.925773, 1, 0, 0.8392157, 1,
1.093863, -2.219751, 0.450531, 1, 0, 0.8352941, 1,
1.094386, -0.5606726, 0.54232, 1, 0, 0.827451, 1,
1.09668, 0.5945797, 1.237495, 1, 0, 0.8235294, 1,
1.098527, 0.3251547, 1.955835, 1, 0, 0.8156863, 1,
1.11198, 0.5136462, 0.2177427, 1, 0, 0.8117647, 1,
1.112313, -0.3411211, 0.7862769, 1, 0, 0.8039216, 1,
1.117404, 2.389238, 0.8870556, 1, 0, 0.7960784, 1,
1.119148, -0.629473, 1.426329, 1, 0, 0.7921569, 1,
1.119904, 0.2740708, 1.497231, 1, 0, 0.7843137, 1,
1.123144, 1.895003, 0.09804075, 1, 0, 0.7803922, 1,
1.123358, 0.2073956, 1.089951, 1, 0, 0.772549, 1,
1.123608, 0.281473, 0.6843171, 1, 0, 0.7686275, 1,
1.128912, 0.3810041, 1.137852, 1, 0, 0.7607843, 1,
1.132576, 0.9709758, 0.3362055, 1, 0, 0.7568628, 1,
1.134713, 0.8863708, 1.097909, 1, 0, 0.7490196, 1,
1.160661, -0.5046856, 2.208204, 1, 0, 0.7450981, 1,
1.16124, 0.4156094, 2.79667, 1, 0, 0.7372549, 1,
1.170603, 0.7604353, 0.7299445, 1, 0, 0.7333333, 1,
1.171413, -0.5040008, 1.685772, 1, 0, 0.7254902, 1,
1.173131, -0.4974867, 1.006703, 1, 0, 0.7215686, 1,
1.175124, -0.003156134, 2.809209, 1, 0, 0.7137255, 1,
1.177444, 1.024007, -0.6881876, 1, 0, 0.7098039, 1,
1.180175, -1.953979, 1.254035, 1, 0, 0.7019608, 1,
1.193746, -0.2651277, 1.382107, 1, 0, 0.6941177, 1,
1.194809, 1.72443, 1.44511, 1, 0, 0.6901961, 1,
1.1965, -0.7197801, 2.707099, 1, 0, 0.682353, 1,
1.197839, -0.554176, 2.522096, 1, 0, 0.6784314, 1,
1.198087, -0.1860614, 2.525185, 1, 0, 0.6705883, 1,
1.198463, 1.233348, -0.2164996, 1, 0, 0.6666667, 1,
1.200461, 1.560208, 1.170029, 1, 0, 0.6588235, 1,
1.200613, 1.025917, 1.558131, 1, 0, 0.654902, 1,
1.209449, 0.03345113, 2.110706, 1, 0, 0.6470588, 1,
1.215429, 0.1847213, 0.5727603, 1, 0, 0.6431373, 1,
1.215738, -1.389929, 2.1881, 1, 0, 0.6352941, 1,
1.219984, 1.461172, -0.6684132, 1, 0, 0.6313726, 1,
1.221322, -0.1763881, 2.106835, 1, 0, 0.6235294, 1,
1.239135, 0.9236472, 0.938628, 1, 0, 0.6196079, 1,
1.241986, -0.3053913, 1.595531, 1, 0, 0.6117647, 1,
1.244257, 0.1628629, 1.890345, 1, 0, 0.6078432, 1,
1.256599, 0.1854533, 1.082222, 1, 0, 0.6, 1,
1.2586, -1.041339, 0.8084851, 1, 0, 0.5921569, 1,
1.258764, 0.7283086, 1.434516, 1, 0, 0.5882353, 1,
1.260966, 0.08870195, 3.135777, 1, 0, 0.5803922, 1,
1.261912, -0.2186828, 2.605461, 1, 0, 0.5764706, 1,
1.262524, 0.523231, 0.9847919, 1, 0, 0.5686275, 1,
1.266256, 2.557399, -1.438007, 1, 0, 0.5647059, 1,
1.266544, -0.6122751, 3.814965, 1, 0, 0.5568628, 1,
1.272154, 0.0419341, 2.251366, 1, 0, 0.5529412, 1,
1.28177, -0.4039935, 1.877596, 1, 0, 0.5450981, 1,
1.285394, 0.6417675, 1.483696, 1, 0, 0.5411765, 1,
1.29514, 1.151273, 1.052604, 1, 0, 0.5333334, 1,
1.298186, 0.09248696, 2.580239, 1, 0, 0.5294118, 1,
1.313774, 1.4828, 0.5186265, 1, 0, 0.5215687, 1,
1.321162, -0.8429655, 1.894674, 1, 0, 0.5176471, 1,
1.336239, 0.1424471, 2.419693, 1, 0, 0.509804, 1,
1.336286, -1.103749, 3.147053, 1, 0, 0.5058824, 1,
1.339776, 0.5714788, 0.1870977, 1, 0, 0.4980392, 1,
1.345836, 0.9480132, 0.7817675, 1, 0, 0.4901961, 1,
1.349807, -0.6209702, 1.834109, 1, 0, 0.4862745, 1,
1.350867, 1.176741, 0.2368497, 1, 0, 0.4784314, 1,
1.356814, 0.6206476, -0.01296531, 1, 0, 0.4745098, 1,
1.358073, -0.8648869, 1.690147, 1, 0, 0.4666667, 1,
1.36004, 1.91248, 0.1804314, 1, 0, 0.4627451, 1,
1.361793, -0.4138205, 2.612534, 1, 0, 0.454902, 1,
1.36315, 0.6421416, 0.5987103, 1, 0, 0.4509804, 1,
1.363861, -1.029229, 4.42817, 1, 0, 0.4431373, 1,
1.380916, -0.530093, 1.189054, 1, 0, 0.4392157, 1,
1.382071, -0.4776417, 0.0869214, 1, 0, 0.4313726, 1,
1.382918, 0.448887, 1.934093, 1, 0, 0.427451, 1,
1.393355, 0.583985, -0.06023094, 1, 0, 0.4196078, 1,
1.400223, 0.5430712, 2.860839, 1, 0, 0.4156863, 1,
1.404159, -0.03954236, 3.228738, 1, 0, 0.4078431, 1,
1.404386, -0.2329897, -0.2151663, 1, 0, 0.4039216, 1,
1.413711, 0.4449441, 2.132464, 1, 0, 0.3960784, 1,
1.420414, -0.7124717, 0.9482374, 1, 0, 0.3882353, 1,
1.429937, 1.729492, 0.6913012, 1, 0, 0.3843137, 1,
1.437216, -0.6707526, 1.422299, 1, 0, 0.3764706, 1,
1.466724, 0.301947, 2.069767, 1, 0, 0.372549, 1,
1.468516, 0.2747491, 2.009852, 1, 0, 0.3647059, 1,
1.482522, 0.4829426, 1.730319, 1, 0, 0.3607843, 1,
1.486124, 0.1336406, 1.796384, 1, 0, 0.3529412, 1,
1.501036, -0.02124981, 2.214041, 1, 0, 0.3490196, 1,
1.514126, 1.168622, 1.366361, 1, 0, 0.3411765, 1,
1.522202, -1.621007, 3.349755, 1, 0, 0.3372549, 1,
1.523634, -1.1121, 1.745778, 1, 0, 0.3294118, 1,
1.524187, -1.509047, 3.469204, 1, 0, 0.3254902, 1,
1.531664, 0.7380286, 2.792137, 1, 0, 0.3176471, 1,
1.533703, -0.5556391, 3.562361, 1, 0, 0.3137255, 1,
1.549128, -1.239124, 1.257008, 1, 0, 0.3058824, 1,
1.555468, 0.2037304, 0.6095411, 1, 0, 0.2980392, 1,
1.55627, -1.003449, 2.74914, 1, 0, 0.2941177, 1,
1.556401, 0.8002887, 1.26875, 1, 0, 0.2862745, 1,
1.558356, 0.6686111, 0.7975004, 1, 0, 0.282353, 1,
1.568644, 0.6391401, 1.736774, 1, 0, 0.2745098, 1,
1.575114, -0.6944066, 2.237904, 1, 0, 0.2705882, 1,
1.608099, 0.9393697, 1.687891, 1, 0, 0.2627451, 1,
1.61142, 1.549763, -0.7714624, 1, 0, 0.2588235, 1,
1.630279, 1.140661, 1.558183, 1, 0, 0.2509804, 1,
1.678555, -0.1465771, 0.3953268, 1, 0, 0.2470588, 1,
1.703094, 0.9882803, 1.59418, 1, 0, 0.2392157, 1,
1.706219, 0.6597697, 1.724062, 1, 0, 0.2352941, 1,
1.712506, -0.5219839, 2.152537, 1, 0, 0.227451, 1,
1.714718, 0.5797096, 2.052729, 1, 0, 0.2235294, 1,
1.718623, 0.1324973, -0.4795043, 1, 0, 0.2156863, 1,
1.723313, -0.4220825, 1.780636, 1, 0, 0.2117647, 1,
1.73674, 2.283984, 0.2490794, 1, 0, 0.2039216, 1,
1.748033, 0.5422396, 0.1623208, 1, 0, 0.1960784, 1,
1.752176, 2.004025, -1.768913, 1, 0, 0.1921569, 1,
1.780856, -0.5219008, 4.0899, 1, 0, 0.1843137, 1,
1.781786, 0.3788717, 1.982575, 1, 0, 0.1803922, 1,
1.83361, -0.5935377, 1.967452, 1, 0, 0.172549, 1,
1.853811, -0.5230997, 1.746977, 1, 0, 0.1686275, 1,
1.872449, 1.623267, 0.3130227, 1, 0, 0.1607843, 1,
1.910075, -0.1310689, -0.9080326, 1, 0, 0.1568628, 1,
1.913154, 0.1640783, 1.982676, 1, 0, 0.1490196, 1,
1.930669, 0.463778, 1.593621, 1, 0, 0.145098, 1,
1.944445, 0.05662327, 2.967941, 1, 0, 0.1372549, 1,
1.964903, 1.230235, 1.02298, 1, 0, 0.1333333, 1,
1.983937, 1.541059, 1.277792, 1, 0, 0.1254902, 1,
2.054131, -1.984583, 1.342905, 1, 0, 0.1215686, 1,
2.058963, -0.6678385, 2.10509, 1, 0, 0.1137255, 1,
2.066073, 0.05174858, 3.882204, 1, 0, 0.1098039, 1,
2.123744, 0.4246643, 1.789061, 1, 0, 0.1019608, 1,
2.134317, 0.9319223, -1.058478, 1, 0, 0.09411765, 1,
2.144928, -1.424952, 2.134984, 1, 0, 0.09019608, 1,
2.156628, 1.214767, 0.2763439, 1, 0, 0.08235294, 1,
2.167769, 1.012084, -0.2246632, 1, 0, 0.07843138, 1,
2.18772, -2.580557, 1.985299, 1, 0, 0.07058824, 1,
2.202086, -0.3402501, 2.533706, 1, 0, 0.06666667, 1,
2.219805, 0.218844, 1.970743, 1, 0, 0.05882353, 1,
2.242602, 0.3464338, 2.377481, 1, 0, 0.05490196, 1,
2.250259, 0.8929471, 1.68595, 1, 0, 0.04705882, 1,
2.312308, -0.1704223, 1.80114, 1, 0, 0.04313726, 1,
2.368086, 2.063127, -0.1832876, 1, 0, 0.03529412, 1,
2.435187, 0.5567246, 1.603816, 1, 0, 0.03137255, 1,
2.501202, 0.6068299, 2.360319, 1, 0, 0.02352941, 1,
2.528769, 0.4635124, 1.902917, 1, 0, 0.01960784, 1,
3.561911, -1.241089, 2.393348, 1, 0, 0.01176471, 1,
3.596618, -1.089859, 2.582132, 1, 0, 0.007843138, 1
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
0.114297, -3.81911, -6.971977, 0, -0.5, 0.5, 0.5,
0.114297, -3.81911, -6.971977, 1, -0.5, 0.5, 0.5,
0.114297, -3.81911, -6.971977, 1, 1.5, 0.5, 0.5,
0.114297, -3.81911, -6.971977, 0, 1.5, 0.5, 0.5
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
-4.548532, 0.06991327, -6.971977, 0, -0.5, 0.5, 0.5,
-4.548532, 0.06991327, -6.971977, 1, -0.5, 0.5, 0.5,
-4.548532, 0.06991327, -6.971977, 1, 1.5, 0.5, 0.5,
-4.548532, 0.06991327, -6.971977, 0, 1.5, 0.5, 0.5
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
-4.548532, -3.81911, 0.342206, 0, -0.5, 0.5, 0.5,
-4.548532, -3.81911, 0.342206, 1, -0.5, 0.5, 0.5,
-4.548532, -3.81911, 0.342206, 1, 1.5, 0.5, 0.5,
-4.548532, -3.81911, 0.342206, 0, 1.5, 0.5, 0.5
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
-3, -2.921643, -5.284089,
3, -2.921643, -5.284089,
-3, -2.921643, -5.284089,
-3, -3.071221, -5.565403,
-2, -2.921643, -5.284089,
-2, -3.071221, -5.565403,
-1, -2.921643, -5.284089,
-1, -3.071221, -5.565403,
0, -2.921643, -5.284089,
0, -3.071221, -5.565403,
1, -2.921643, -5.284089,
1, -3.071221, -5.565403,
2, -2.921643, -5.284089,
2, -3.071221, -5.565403,
3, -2.921643, -5.284089,
3, -3.071221, -5.565403
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
-3, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
-3, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
-3, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
-3, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
-2, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
-2, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
-2, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
-2, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
-1, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
-1, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
-1, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
-1, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
0, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
0, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
0, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
0, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
1, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
1, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
1, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
1, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
2, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
2, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
2, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
2, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5,
3, -3.370376, -6.128033, 0, -0.5, 0.5, 0.5,
3, -3.370376, -6.128033, 1, -0.5, 0.5, 0.5,
3, -3.370376, -6.128033, 1, 1.5, 0.5, 0.5,
3, -3.370376, -6.128033, 0, 1.5, 0.5, 0.5
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
-3.472494, -2, -5.284089,
-3.472494, 2, -5.284089,
-3.472494, -2, -5.284089,
-3.651834, -2, -5.565403,
-3.472494, -1, -5.284089,
-3.651834, -1, -5.565403,
-3.472494, 0, -5.284089,
-3.651834, 0, -5.565403,
-3.472494, 1, -5.284089,
-3.651834, 1, -5.565403,
-3.472494, 2, -5.284089,
-3.651834, 2, -5.565403
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
-4.010513, -2, -6.128033, 0, -0.5, 0.5, 0.5,
-4.010513, -2, -6.128033, 1, -0.5, 0.5, 0.5,
-4.010513, -2, -6.128033, 1, 1.5, 0.5, 0.5,
-4.010513, -2, -6.128033, 0, 1.5, 0.5, 0.5,
-4.010513, -1, -6.128033, 0, -0.5, 0.5, 0.5,
-4.010513, -1, -6.128033, 1, -0.5, 0.5, 0.5,
-4.010513, -1, -6.128033, 1, 1.5, 0.5, 0.5,
-4.010513, -1, -6.128033, 0, 1.5, 0.5, 0.5,
-4.010513, 0, -6.128033, 0, -0.5, 0.5, 0.5,
-4.010513, 0, -6.128033, 1, -0.5, 0.5, 0.5,
-4.010513, 0, -6.128033, 1, 1.5, 0.5, 0.5,
-4.010513, 0, -6.128033, 0, 1.5, 0.5, 0.5,
-4.010513, 1, -6.128033, 0, -0.5, 0.5, 0.5,
-4.010513, 1, -6.128033, 1, -0.5, 0.5, 0.5,
-4.010513, 1, -6.128033, 1, 1.5, 0.5, 0.5,
-4.010513, 1, -6.128033, 0, 1.5, 0.5, 0.5,
-4.010513, 2, -6.128033, 0, -0.5, 0.5, 0.5,
-4.010513, 2, -6.128033, 1, -0.5, 0.5, 0.5,
-4.010513, 2, -6.128033, 1, 1.5, 0.5, 0.5,
-4.010513, 2, -6.128033, 0, 1.5, 0.5, 0.5
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
-3.472494, -2.921643, -4,
-3.472494, -2.921643, 4,
-3.472494, -2.921643, -4,
-3.651834, -3.071221, -4,
-3.472494, -2.921643, -2,
-3.651834, -3.071221, -2,
-3.472494, -2.921643, 0,
-3.651834, -3.071221, 0,
-3.472494, -2.921643, 2,
-3.651834, -3.071221, 2,
-3.472494, -2.921643, 4,
-3.651834, -3.071221, 4
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
-4.010513, -3.370376, -4, 0, -0.5, 0.5, 0.5,
-4.010513, -3.370376, -4, 1, -0.5, 0.5, 0.5,
-4.010513, -3.370376, -4, 1, 1.5, 0.5, 0.5,
-4.010513, -3.370376, -4, 0, 1.5, 0.5, 0.5,
-4.010513, -3.370376, -2, 0, -0.5, 0.5, 0.5,
-4.010513, -3.370376, -2, 1, -0.5, 0.5, 0.5,
-4.010513, -3.370376, -2, 1, 1.5, 0.5, 0.5,
-4.010513, -3.370376, -2, 0, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 0, 0, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 0, 1, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 0, 1, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 0, 0, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 2, 0, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 2, 1, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 2, 1, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 2, 0, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 4, 0, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 4, 1, -0.5, 0.5, 0.5,
-4.010513, -3.370376, 4, 1, 1.5, 0.5, 0.5,
-4.010513, -3.370376, 4, 0, 1.5, 0.5, 0.5
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
-3.472494, -2.921643, -5.284089,
-3.472494, 3.061469, -5.284089,
-3.472494, -2.921643, 5.968501,
-3.472494, 3.061469, 5.968501,
-3.472494, -2.921643, -5.284089,
-3.472494, -2.921643, 5.968501,
-3.472494, 3.061469, -5.284089,
-3.472494, 3.061469, 5.968501,
-3.472494, -2.921643, -5.284089,
3.701088, -2.921643, -5.284089,
-3.472494, -2.921643, 5.968501,
3.701088, -2.921643, 5.968501,
-3.472494, 3.061469, -5.284089,
3.701088, 3.061469, -5.284089,
-3.472494, 3.061469, 5.968501,
3.701088, 3.061469, 5.968501,
3.701088, -2.921643, -5.284089,
3.701088, 3.061469, -5.284089,
3.701088, -2.921643, 5.968501,
3.701088, 3.061469, 5.968501,
3.701088, -2.921643, -5.284089,
3.701088, -2.921643, 5.968501,
3.701088, 3.061469, -5.284089,
3.701088, 3.061469, 5.968501
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
var radius = 7.809248;
var distance = 34.74422;
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
mvMatrix.translate( -0.114297, -0.06991327, -0.342206 );
mvMatrix.scale( 1.177029, 1.411224, 0.7503617 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.74422);
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
Apollo<-read.table("Apollo.xyz")
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
-3.368024, -0.3195334, -0.7491025, 0, 0, 1, 1, 1,
-2.903879, -0.4383689, -1.80414, 1, 0, 0, 1, 1,
-2.902137, 0.7887222, -1.301648, 1, 0, 0, 1, 1,
-2.662313, 1.58106, -0.3135474, 1, 0, 0, 1, 1,
-2.547262, -1.85779, -3.036751, 1, 0, 0, 1, 1,
-2.527753, 0.6513381, -2.497517, 1, 0, 0, 1, 1,
-2.430201, -0.3182243, -2.483555, 0, 0, 0, 1, 1,
-2.422092, -1.725155, -1.224288, 0, 0, 0, 1, 1,
-2.402401, 1.934647, -0.6662073, 0, 0, 0, 1, 1,
-2.271055, -0.1468307, -1.164412, 0, 0, 0, 1, 1,
-2.258028, 0.6808752, -1.273865, 0, 0, 0, 1, 1,
-2.231939, -0.8636454, -2.780827, 0, 0, 0, 1, 1,
-2.199841, 1.818793, -1.489152, 0, 0, 0, 1, 1,
-2.065577, 0.7937233, 0.2193223, 1, 1, 1, 1, 1,
-2.029062, 0.4325443, -0.3584338, 1, 1, 1, 1, 1,
-2.027293, 0.5472901, -1.525247, 1, 1, 1, 1, 1,
-2.014391, 0.791386, -3.535471, 1, 1, 1, 1, 1,
-1.9979, 0.7771324, -1.092793, 1, 1, 1, 1, 1,
-1.931703, -0.5761151, -0.9881008, 1, 1, 1, 1, 1,
-1.919803, 0.8225714, -2.115108, 1, 1, 1, 1, 1,
-1.903931, 0.5171151, -2.251992, 1, 1, 1, 1, 1,
-1.902352, 0.8536021, -2.348202, 1, 1, 1, 1, 1,
-1.895005, -0.394715, -2.107176, 1, 1, 1, 1, 1,
-1.892406, -1.134651, -0.3444451, 1, 1, 1, 1, 1,
-1.882583, -0.1323562, -0.3671896, 1, 1, 1, 1, 1,
-1.8691, -0.2126034, -1.978601, 1, 1, 1, 1, 1,
-1.864298, -0.3419888, -1.831952, 1, 1, 1, 1, 1,
-1.784021, 0.593059, -1.066813, 1, 1, 1, 1, 1,
-1.775874, 0.2690737, -1.095345, 0, 0, 1, 1, 1,
-1.772797, -0.05367819, -1.826782, 1, 0, 0, 1, 1,
-1.76135, 1.826471, -1.413627, 1, 0, 0, 1, 1,
-1.705203, -0.2060637, -1.713672, 1, 0, 0, 1, 1,
-1.703635, -0.04271042, -2.93017, 1, 0, 0, 1, 1,
-1.700411, 0.4670229, -0.9531201, 1, 0, 0, 1, 1,
-1.697904, -0.05570034, -1.791057, 0, 0, 0, 1, 1,
-1.695149, 0.5387386, -1.297341, 0, 0, 0, 1, 1,
-1.693213, 0.1520702, -1.251932, 0, 0, 0, 1, 1,
-1.692789, 0.1275881, -2.095372, 0, 0, 0, 1, 1,
-1.671226, -0.3623981, -1.746532, 0, 0, 0, 1, 1,
-1.669194, 0.3001189, -1.270913, 0, 0, 0, 1, 1,
-1.662384, 0.2387598, -1.812542, 0, 0, 0, 1, 1,
-1.642032, -0.2708729, -2.373838, 1, 1, 1, 1, 1,
-1.634555, -1.154164, -1.891495, 1, 1, 1, 1, 1,
-1.629293, 1.240996, -1.525985, 1, 1, 1, 1, 1,
-1.628842, 1.409941, -1.954113, 1, 1, 1, 1, 1,
-1.616035, -0.9155865, -0.7029343, 1, 1, 1, 1, 1,
-1.601326, 0.8330527, -2.108299, 1, 1, 1, 1, 1,
-1.599183, 1.819047, 0.01451225, 1, 1, 1, 1, 1,
-1.597043, -0.9143155, -1.421482, 1, 1, 1, 1, 1,
-1.596637, 0.5739886, -1.233442, 1, 1, 1, 1, 1,
-1.573138, -0.344056, -1.680497, 1, 1, 1, 1, 1,
-1.571289, -0.9341857, -3.26895, 1, 1, 1, 1, 1,
-1.54942, 1.320795, -1.394837, 1, 1, 1, 1, 1,
-1.545874, 0.7336991, -1.828973, 1, 1, 1, 1, 1,
-1.543096, -0.6897056, -4.09017, 1, 1, 1, 1, 1,
-1.540872, -0.3238999, -1.954287, 1, 1, 1, 1, 1,
-1.539606, 1.889324, -0.08927725, 0, 0, 1, 1, 1,
-1.526801, -0.9841473, -0.5424783, 1, 0, 0, 1, 1,
-1.526384, 0.03215399, -1.649898, 1, 0, 0, 1, 1,
-1.497211, 0.2209127, -1.800876, 1, 0, 0, 1, 1,
-1.496713, -0.0839067, -2.059341, 1, 0, 0, 1, 1,
-1.495074, 0.1038197, -1.428839, 1, 0, 0, 1, 1,
-1.494871, -1.94539, -1.374345, 0, 0, 0, 1, 1,
-1.48285, 0.3157065, -0.9727779, 0, 0, 0, 1, 1,
-1.478213, -0.9631459, -0.877624, 0, 0, 0, 1, 1,
-1.473718, -0.03636258, -2.562934, 0, 0, 0, 1, 1,
-1.469776, 0.7530822, 0.6992947, 0, 0, 0, 1, 1,
-1.466833, 0.4006101, -1.614408, 0, 0, 0, 1, 1,
-1.46607, 0.6000612, 0.2413737, 0, 0, 0, 1, 1,
-1.459618, 0.4611165, -1.726345, 1, 1, 1, 1, 1,
-1.456347, 2.120435, -1.272149, 1, 1, 1, 1, 1,
-1.448547, -0.7215186, -3.075339, 1, 1, 1, 1, 1,
-1.448035, -0.7734968, -1.102109, 1, 1, 1, 1, 1,
-1.445816, -0.7101975, -1.283122, 1, 1, 1, 1, 1,
-1.443947, 1.442599, -0.9226031, 1, 1, 1, 1, 1,
-1.433573, 0.7620385, -0.7825143, 1, 1, 1, 1, 1,
-1.431317, 0.2502673, -1.199016, 1, 1, 1, 1, 1,
-1.418042, -1.989288, -3.71464, 1, 1, 1, 1, 1,
-1.412866, -0.9896362, -2.968952, 1, 1, 1, 1, 1,
-1.399556, -0.0006063714, -2.404777, 1, 1, 1, 1, 1,
-1.396183, 0.6884264, -0.7692239, 1, 1, 1, 1, 1,
-1.395231, 2.041456, -1.757836, 1, 1, 1, 1, 1,
-1.394064, 0.04560553, -1.575872, 1, 1, 1, 1, 1,
-1.390965, -1.392895, -2.631879, 1, 1, 1, 1, 1,
-1.376525, -0.6814945, -2.620287, 0, 0, 1, 1, 1,
-1.37086, 0.9727346, -1.390426, 1, 0, 0, 1, 1,
-1.369477, -0.2340806, -1.994065, 1, 0, 0, 1, 1,
-1.358381, 0.03655523, 0.2976251, 1, 0, 0, 1, 1,
-1.357642, -0.0006865533, 0.9877126, 1, 0, 0, 1, 1,
-1.355669, 1.473084, -0.5649613, 1, 0, 0, 1, 1,
-1.344721, 2.615096, -0.4128288, 0, 0, 0, 1, 1,
-1.337053, -2.56193, -3.418233, 0, 0, 0, 1, 1,
-1.328034, 2.509084, 0.8303435, 0, 0, 0, 1, 1,
-1.325789, -2.631324, -3.518348, 0, 0, 0, 1, 1,
-1.323868, -0.5161647, -2.148398, 0, 0, 0, 1, 1,
-1.317371, 0.8982508, -1.142826, 0, 0, 0, 1, 1,
-1.310543, 0.3966934, -2.163281, 0, 0, 0, 1, 1,
-1.303745, 0.1573034, -0.4948088, 1, 1, 1, 1, 1,
-1.303035, -0.8569255, -3.296995, 1, 1, 1, 1, 1,
-1.297694, -0.2279948, -0.7958317, 1, 1, 1, 1, 1,
-1.291571, 0.4901576, -0.240757, 1, 1, 1, 1, 1,
-1.28929, 0.2059293, -2.33133, 1, 1, 1, 1, 1,
-1.286676, 0.493986, -1.042416, 1, 1, 1, 1, 1,
-1.285738, -1.077123, -2.479996, 1, 1, 1, 1, 1,
-1.280989, -1.605526, -2.56915, 1, 1, 1, 1, 1,
-1.275767, 0.2987045, 0.2649179, 1, 1, 1, 1, 1,
-1.271936, 0.110834, -1.222147, 1, 1, 1, 1, 1,
-1.267425, -1.458103, -1.108688, 1, 1, 1, 1, 1,
-1.267081, 1.11047, -0.6067718, 1, 1, 1, 1, 1,
-1.264094, 2.019879, 0.9363159, 1, 1, 1, 1, 1,
-1.258108, 1.211085, -1.325619, 1, 1, 1, 1, 1,
-1.257776, 0.5483413, -1.103707, 1, 1, 1, 1, 1,
-1.247664, 0.9685866, 0.4451616, 0, 0, 1, 1, 1,
-1.237808, -0.4479311, -2.074717, 1, 0, 0, 1, 1,
-1.23243, -1.433892, -3.340131, 1, 0, 0, 1, 1,
-1.231608, 0.646376, -2.750789, 1, 0, 0, 1, 1,
-1.226578, 0.652051, -1.008617, 1, 0, 0, 1, 1,
-1.224767, 0.391251, 0.4344867, 1, 0, 0, 1, 1,
-1.206514, -2.357717, -1.749323, 0, 0, 0, 1, 1,
-1.188253, -1.147307, -2.749878, 0, 0, 0, 1, 1,
-1.187489, 1.507059, -1.214022, 0, 0, 0, 1, 1,
-1.176699, 2.310081, 0.08061543, 0, 0, 0, 1, 1,
-1.165544, -1.3917, -1.980941, 0, 0, 0, 1, 1,
-1.158267, 0.4449531, -1.527622, 0, 0, 0, 1, 1,
-1.156179, 0.05569451, -3.223552, 0, 0, 0, 1, 1,
-1.15081, -0.7074447, -3.839004, 1, 1, 1, 1, 1,
-1.142397, 1.68794, 0.344246, 1, 1, 1, 1, 1,
-1.139663, 0.7044201, 0.3697994, 1, 1, 1, 1, 1,
-1.132912, -0.6933492, -1.901073, 1, 1, 1, 1, 1,
-1.12948, 0.9597831, -2.502052, 1, 1, 1, 1, 1,
-1.126596, 0.3926156, -0.4364871, 1, 1, 1, 1, 1,
-1.123573, 0.02109973, -2.02896, 1, 1, 1, 1, 1,
-1.119808, 0.688916, 1.006611, 1, 1, 1, 1, 1,
-1.109896, -0.3549623, -5.120216, 1, 1, 1, 1, 1,
-1.099493, -1.89639, -1.313196, 1, 1, 1, 1, 1,
-1.097686, -0.2438138, -1.929288, 1, 1, 1, 1, 1,
-1.092507, 1.994998, 2.092788, 1, 1, 1, 1, 1,
-1.090124, 0.05583781, -1.096223, 1, 1, 1, 1, 1,
-1.086966, -1.402864, -4.188742, 1, 1, 1, 1, 1,
-1.085958, 2.58241, -0.8865742, 1, 1, 1, 1, 1,
-1.084294, -1.334378, -1.099479, 0, 0, 1, 1, 1,
-1.081876, 2.039245, -1.111993, 1, 0, 0, 1, 1,
-1.080511, 0.08962715, -1.953801, 1, 0, 0, 1, 1,
-1.076127, 0.3309276, 1.071246, 1, 0, 0, 1, 1,
-1.075961, -1.988615, -3.428358, 1, 0, 0, 1, 1,
-1.06951, 0.960587, -3.611155, 1, 0, 0, 1, 1,
-1.06492, -1.117362, -2.392212, 0, 0, 0, 1, 1,
-1.05671, 0.966557, -1.126772, 0, 0, 0, 1, 1,
-1.054427, -0.6033327, -1.705258, 0, 0, 0, 1, 1,
-1.048533, 0.933228, 0.3950364, 0, 0, 0, 1, 1,
-1.045651, 0.4011727, -0.9026191, 0, 0, 0, 1, 1,
-1.04533, -0.4418147, -2.236547, 0, 0, 0, 1, 1,
-1.044995, -0.5811048, -3.046039, 0, 0, 0, 1, 1,
-1.044192, -0.2184703, -1.99237, 1, 1, 1, 1, 1,
-1.04319, -0.4350465, -1.418237, 1, 1, 1, 1, 1,
-1.04172, -0.8991084, -0.5727623, 1, 1, 1, 1, 1,
-1.040458, 1.057958, -0.9161577, 1, 1, 1, 1, 1,
-1.033022, 1.437618, -3.136428, 1, 1, 1, 1, 1,
-1.030789, -0.4436017, -2.816718, 1, 1, 1, 1, 1,
-1.030364, 1.602592, -0.8519115, 1, 1, 1, 1, 1,
-1.02123, -1.05616, -2.89115, 1, 1, 1, 1, 1,
-1.018447, 0.1044973, -0.7793269, 1, 1, 1, 1, 1,
-1.017797, 0.5511709, 0.4214712, 1, 1, 1, 1, 1,
-1.012336, 0.6854033, -1.472887, 1, 1, 1, 1, 1,
-1.011633, 0.3739115, -3.20449, 1, 1, 1, 1, 1,
-1.000023, -2.176224, -1.721751, 1, 1, 1, 1, 1,
-0.9964589, 0.6187775, -1.406322, 1, 1, 1, 1, 1,
-0.9893224, 2.691022, -1.496415, 1, 1, 1, 1, 1,
-0.9844378, -1.45255, -2.125077, 0, 0, 1, 1, 1,
-0.9830672, 0.04288277, -3.075347, 1, 0, 0, 1, 1,
-0.9803362, -1.166234, -2.922182, 1, 0, 0, 1, 1,
-0.9797282, 0.1377129, 0.4720365, 1, 0, 0, 1, 1,
-0.9788745, 0.7173544, -0.9301032, 1, 0, 0, 1, 1,
-0.9753071, 0.365749, -1.500153, 1, 0, 0, 1, 1,
-0.9678273, 1.203355, -2.158486, 0, 0, 0, 1, 1,
-0.9634976, 0.8143221, 0.07352459, 0, 0, 0, 1, 1,
-0.9620341, -0.1821942, -1.928292, 0, 0, 0, 1, 1,
-0.95973, 0.6948652, -1.126301, 0, 0, 0, 1, 1,
-0.9459741, 0.905323, -1.290989, 0, 0, 0, 1, 1,
-0.9443566, 0.2006845, -2.880623, 0, 0, 0, 1, 1,
-0.9384821, -0.6509902, -1.31714, 0, 0, 0, 1, 1,
-0.9270582, -1.703266, -2.453318, 1, 1, 1, 1, 1,
-0.9257897, -0.5932499, -3.384509, 1, 1, 1, 1, 1,
-0.9240493, 0.9451094, -0.7149963, 1, 1, 1, 1, 1,
-0.9222166, -1.129756, -3.74983, 1, 1, 1, 1, 1,
-0.9173726, -0.200766, -2.236325, 1, 1, 1, 1, 1,
-0.9111884, 0.7058113, 0.04475107, 1, 1, 1, 1, 1,
-0.9111243, 0.1003659, -2.040712, 1, 1, 1, 1, 1,
-0.9036739, -0.1358395, -2.1482, 1, 1, 1, 1, 1,
-0.9030539, -0.466005, -1.096855, 1, 1, 1, 1, 1,
-0.9014698, -0.456737, -2.978479, 1, 1, 1, 1, 1,
-0.9013973, 1.368555, -0.2560415, 1, 1, 1, 1, 1,
-0.9006363, -0.1888293, -3.2871, 1, 1, 1, 1, 1,
-0.8968245, -0.4278697, -2.403471, 1, 1, 1, 1, 1,
-0.8954831, 0.2472801, -2.438785, 1, 1, 1, 1, 1,
-0.8807851, 0.1772864, -1.81231, 1, 1, 1, 1, 1,
-0.8781792, 0.5929543, -0.8640026, 0, 0, 1, 1, 1,
-0.8698146, -1.196511, -1.767672, 1, 0, 0, 1, 1,
-0.8670967, -0.1113246, -2.661698, 1, 0, 0, 1, 1,
-0.8524551, 1.640315, 0.3591119, 1, 0, 0, 1, 1,
-0.8449925, -0.01508444, -1.617591, 1, 0, 0, 1, 1,
-0.8321723, -1.609548, -3.79612, 1, 0, 0, 1, 1,
-0.8294045, -0.6363044, -2.277727, 0, 0, 0, 1, 1,
-0.825224, 0.4798076, -1.019172, 0, 0, 0, 1, 1,
-0.8220988, -0.2890856, -2.927527, 0, 0, 0, 1, 1,
-0.8180181, -1.641602, -2.530175, 0, 0, 0, 1, 1,
-0.8177903, -0.347555, -4.191874, 0, 0, 0, 1, 1,
-0.8099201, -0.3023553, -3.699021, 0, 0, 0, 1, 1,
-0.8073474, 0.8071344, -1.65843, 0, 0, 0, 1, 1,
-0.8049662, -0.3265915, -3.215718, 1, 1, 1, 1, 1,
-0.7972524, 1.08623, -1.121932, 1, 1, 1, 1, 1,
-0.7941067, 0.5410308, -0.4164348, 1, 1, 1, 1, 1,
-0.7853448, 0.5342685, -0.8186405, 1, 1, 1, 1, 1,
-0.7852196, -1.90711, -2.370087, 1, 1, 1, 1, 1,
-0.785072, 0.1955135, -1.581674, 1, 1, 1, 1, 1,
-0.7847865, 1.159452, -0.6924945, 1, 1, 1, 1, 1,
-0.783848, 1.240994, -0.5986208, 1, 1, 1, 1, 1,
-0.7790845, 0.4781601, -1.251241, 1, 1, 1, 1, 1,
-0.7666832, -0.4238907, -2.045195, 1, 1, 1, 1, 1,
-0.7663972, -0.6649641, -1.85095, 1, 1, 1, 1, 1,
-0.7651621, -1.920581, -1.667918, 1, 1, 1, 1, 1,
-0.7571327, -0.5357874, -1.807133, 1, 1, 1, 1, 1,
-0.7544938, -0.4644328, -3.224066, 1, 1, 1, 1, 1,
-0.7513469, -1.807223, -3.396022, 1, 1, 1, 1, 1,
-0.7447541, -0.6717626, -2.128567, 0, 0, 1, 1, 1,
-0.7418383, 0.7184771, -0.1027733, 1, 0, 0, 1, 1,
-0.7405652, -0.08385561, -2.447718, 1, 0, 0, 1, 1,
-0.734936, 0.0422415, -1.48708, 1, 0, 0, 1, 1,
-0.7343279, -0.8627362, -2.304569, 1, 0, 0, 1, 1,
-0.7210147, -0.8688037, -2.49926, 1, 0, 0, 1, 1,
-0.7202222, -0.05037299, -0.8134402, 0, 0, 0, 1, 1,
-0.717824, 0.7692655, 0.1067197, 0, 0, 0, 1, 1,
-0.7172394, -0.2686227, -3.254562, 0, 0, 0, 1, 1,
-0.7130286, -0.3343446, -2.419682, 0, 0, 0, 1, 1,
-0.7115127, 0.2133078, -1.603551, 0, 0, 0, 1, 1,
-0.7097225, 1.310377, -0.4101514, 0, 0, 0, 1, 1,
-0.6965013, 0.7097119, -1.283095, 0, 0, 0, 1, 1,
-0.6939991, -0.1889259, -3.443955, 1, 1, 1, 1, 1,
-0.6885772, -1.148876, -2.252202, 1, 1, 1, 1, 1,
-0.6855913, -0.1792441, -1.12897, 1, 1, 1, 1, 1,
-0.6810848, 0.3498565, -0.3000356, 1, 1, 1, 1, 1,
-0.6681291, 0.4049439, -0.6325727, 1, 1, 1, 1, 1,
-0.6668417, 0.1186104, -1.198185, 1, 1, 1, 1, 1,
-0.6646684, 1.233095, 0.9531192, 1, 1, 1, 1, 1,
-0.6631663, 1.039692, -0.9174006, 1, 1, 1, 1, 1,
-0.653164, 0.5992981, -0.3472949, 1, 1, 1, 1, 1,
-0.6463372, -0.3101895, -2.570504, 1, 1, 1, 1, 1,
-0.6376624, -0.5332095, -1.432558, 1, 1, 1, 1, 1,
-0.6352088, -0.9639015, -2.902108, 1, 1, 1, 1, 1,
-0.6351871, 0.4066685, -1.692947, 1, 1, 1, 1, 1,
-0.6348821, -1.051998, -1.491941, 1, 1, 1, 1, 1,
-0.6344198, 0.177829, -2.143329, 1, 1, 1, 1, 1,
-0.6330559, 0.8848704, -0.9543682, 0, 0, 1, 1, 1,
-0.6329585, -1.527025, -2.758116, 1, 0, 0, 1, 1,
-0.6284686, -0.5604234, -2.392257, 1, 0, 0, 1, 1,
-0.625264, -0.3463544, -0.8317862, 1, 0, 0, 1, 1,
-0.6196246, 0.9563564, -0.5090342, 1, 0, 0, 1, 1,
-0.612415, 1.661863, 0.5549926, 1, 0, 0, 1, 1,
-0.6103289, -0.9357556, -2.173261, 0, 0, 0, 1, 1,
-0.6084787, -0.5062712, -2.660433, 0, 0, 0, 1, 1,
-0.6066785, -0.1807571, -2.321507, 0, 0, 0, 1, 1,
-0.6008461, -1.087954, -3.258326, 0, 0, 0, 1, 1,
-0.5975065, 1.496042, 0.6575263, 0, 0, 0, 1, 1,
-0.5836632, 0.5456401, -0.1493428, 0, 0, 0, 1, 1,
-0.5781823, 0.8335257, -1.479883, 0, 0, 0, 1, 1,
-0.5772882, 0.3635793, -1.642766, 1, 1, 1, 1, 1,
-0.5697845, 1.53481, -1.313337, 1, 1, 1, 1, 1,
-0.5678642, 1.134122, -2.603679, 1, 1, 1, 1, 1,
-0.5663198, 0.9950787, 0.07144659, 1, 1, 1, 1, 1,
-0.564436, 1.485179, -0.04612938, 1, 1, 1, 1, 1,
-0.5619872, -1.542683, -1.552109, 1, 1, 1, 1, 1,
-0.5566627, 0.2062346, -0.5925556, 1, 1, 1, 1, 1,
-0.5552662, 0.2122412, -0.9654413, 1, 1, 1, 1, 1,
-0.5543179, 0.004523295, -1.044542, 1, 1, 1, 1, 1,
-0.5511807, 0.06440592, -0.5695597, 1, 1, 1, 1, 1,
-0.5487491, -1.27013, -3.534331, 1, 1, 1, 1, 1,
-0.5413432, 1.19226, -0.2667473, 1, 1, 1, 1, 1,
-0.5369592, 0.6773348, -0.3200211, 1, 1, 1, 1, 1,
-0.5368124, -0.3557795, -1.636194, 1, 1, 1, 1, 1,
-0.5306057, -1.570106, -4.897445, 1, 1, 1, 1, 1,
-0.5304062, -0.2862884, -2.947659, 0, 0, 1, 1, 1,
-0.5282082, 0.3768983, -1.615525, 1, 0, 0, 1, 1,
-0.525326, -1.11623, -1.975324, 1, 0, 0, 1, 1,
-0.523865, -0.4271885, -1.060595, 1, 0, 0, 1, 1,
-0.5221466, -0.4558461, -0.7641534, 1, 0, 0, 1, 1,
-0.5183438, -0.5948709, -4.324792, 1, 0, 0, 1, 1,
-0.5158544, -1.164834, -2.323274, 0, 0, 0, 1, 1,
-0.5140198, 0.5741228, 0.05503003, 0, 0, 0, 1, 1,
-0.513733, 0.7063906, 0.4104293, 0, 0, 0, 1, 1,
-0.5096261, 0.007424159, -1.579608, 0, 0, 0, 1, 1,
-0.5058457, -1.206253, -3.578135, 0, 0, 0, 1, 1,
-0.504479, 0.105741, -2.721948, 0, 0, 0, 1, 1,
-0.5028931, -0.1516336, -1.231898, 0, 0, 0, 1, 1,
-0.4989594, -1.518777, -4.313055, 1, 1, 1, 1, 1,
-0.498087, -1.177371, -2.618731, 1, 1, 1, 1, 1,
-0.4817144, 0.5485561, 0.7705212, 1, 1, 1, 1, 1,
-0.4804868, -0.7393708, -2.48555, 1, 1, 1, 1, 1,
-0.4759869, -0.0896902, -0.05274413, 1, 1, 1, 1, 1,
-0.4742605, 1.348632, -0.2713497, 1, 1, 1, 1, 1,
-0.4735397, 0.4520758, -1.08756, 1, 1, 1, 1, 1,
-0.4672158, -0.2740906, -2.329713, 1, 1, 1, 1, 1,
-0.4644878, -0.5586853, -2.4111, 1, 1, 1, 1, 1,
-0.4642458, -1.679739, -3.803046, 1, 1, 1, 1, 1,
-0.4641984, -1.030565, -3.611521, 1, 1, 1, 1, 1,
-0.4630084, 0.3495276, -1.461199, 1, 1, 1, 1, 1,
-0.4625056, -0.8740255, -2.816632, 1, 1, 1, 1, 1,
-0.4611693, 1.324283, -0.84875, 1, 1, 1, 1, 1,
-0.4589767, -0.6169218, -1.930205, 1, 1, 1, 1, 1,
-0.4580342, 0.2507892, -1.620178, 0, 0, 1, 1, 1,
-0.4577222, 2.109278, 1.342548, 1, 0, 0, 1, 1,
-0.4463025, -0.1878538, -2.875226, 1, 0, 0, 1, 1,
-0.4432485, 0.009655011, -1.192695, 1, 0, 0, 1, 1,
-0.442594, -0.0946713, -2.579133, 1, 0, 0, 1, 1,
-0.4416761, -1.022261, -2.428235, 1, 0, 0, 1, 1,
-0.4401924, -1.201294, -3.322509, 0, 0, 0, 1, 1,
-0.4384041, 0.02986003, -0.6095906, 0, 0, 0, 1, 1,
-0.4383765, 1.199956, -0.09303556, 0, 0, 0, 1, 1,
-0.4379947, 0.0517455, -2.226446, 0, 0, 0, 1, 1,
-0.4379401, -0.3556447, -1.101917, 0, 0, 0, 1, 1,
-0.4360697, 0.6431616, -0.8323751, 0, 0, 0, 1, 1,
-0.4349412, -0.1050386, -2.229631, 0, 0, 0, 1, 1,
-0.4229313, -0.8311824, -2.313648, 1, 1, 1, 1, 1,
-0.4227751, -0.6851589, -4.726654, 1, 1, 1, 1, 1,
-0.4196393, 0.6335353, -0.01860749, 1, 1, 1, 1, 1,
-0.4165958, -0.4492108, -3.468746, 1, 1, 1, 1, 1,
-0.4146179, 0.3021334, -1.060031, 1, 1, 1, 1, 1,
-0.4136676, 0.1612109, -0.4475465, 1, 1, 1, 1, 1,
-0.413089, 1.84851, -1.777713, 1, 1, 1, 1, 1,
-0.4107486, -1.006416, -3.716756, 1, 1, 1, 1, 1,
-0.4078167, -1.014982, -3.137293, 1, 1, 1, 1, 1,
-0.406187, -0.2529646, -2.619287, 1, 1, 1, 1, 1,
-0.4038778, -2.050904, -2.62132, 1, 1, 1, 1, 1,
-0.4024849, 0.3886921, -0.8125345, 1, 1, 1, 1, 1,
-0.401756, -0.7598754, -2.992552, 1, 1, 1, 1, 1,
-0.4001583, 1.515127, -0.6423931, 1, 1, 1, 1, 1,
-0.3991737, -0.4371577, -1.769951, 1, 1, 1, 1, 1,
-0.3960625, 0.3739608, -1.018919, 0, 0, 1, 1, 1,
-0.3948905, 0.6461833, 0.1762623, 1, 0, 0, 1, 1,
-0.3941822, -0.7748471, -2.470399, 1, 0, 0, 1, 1,
-0.391096, 1.131034, 0.5087028, 1, 0, 0, 1, 1,
-0.3878658, 0.5156195, -2.236968, 1, 0, 0, 1, 1,
-0.3846003, -1.913471, -1.973199, 1, 0, 0, 1, 1,
-0.3821896, 1.046392, -0.06767989, 0, 0, 0, 1, 1,
-0.3791959, -0.4349826, -1.341831, 0, 0, 0, 1, 1,
-0.3773338, 0.5500017, -1.034634, 0, 0, 0, 1, 1,
-0.3769838, 0.7754911, -1.479557, 0, 0, 0, 1, 1,
-0.3710802, 0.286458, -1.677818, 0, 0, 0, 1, 1,
-0.3667668, -1.340605, -3.280624, 0, 0, 0, 1, 1,
-0.3629798, -1.697091, -3.379298, 0, 0, 0, 1, 1,
-0.3596938, 1.345935, 1.1195, 1, 1, 1, 1, 1,
-0.3524661, 0.665854, 1.491249, 1, 1, 1, 1, 1,
-0.3520451, -0.6851415, -2.957361, 1, 1, 1, 1, 1,
-0.3506631, -0.207135, -0.3346405, 1, 1, 1, 1, 1,
-0.3479369, 0.1898837, -0.3061922, 1, 1, 1, 1, 1,
-0.3478279, 0.1256213, -2.554979, 1, 1, 1, 1, 1,
-0.3473611, 0.5778627, -1.843807, 1, 1, 1, 1, 1,
-0.3464444, -1.575166, -2.097429, 1, 1, 1, 1, 1,
-0.3459733, 0.5147402, 0.9796421, 1, 1, 1, 1, 1,
-0.3452909, -1.334535, -1.235889, 1, 1, 1, 1, 1,
-0.3440138, 1.178682, 1.103811, 1, 1, 1, 1, 1,
-0.3410576, 0.9201054, -0.4938162, 1, 1, 1, 1, 1,
-0.3388142, 0.3303769, -1.057326, 1, 1, 1, 1, 1,
-0.3367562, 0.2750781, -2.225232, 1, 1, 1, 1, 1,
-0.3344843, 1.75217, 1.454136, 1, 1, 1, 1, 1,
-0.3341394, -0.1516003, -2.697322, 0, 0, 1, 1, 1,
-0.3337608, -0.6308737, -1.815626, 1, 0, 0, 1, 1,
-0.3333832, -1.67913, -0.6593441, 1, 0, 0, 1, 1,
-0.3330186, -2.040514, -1.39033, 1, 0, 0, 1, 1,
-0.3321995, -0.4751413, -2.414679, 1, 0, 0, 1, 1,
-0.3318734, -0.5251682, -1.911527, 1, 0, 0, 1, 1,
-0.3292256, 0.6256588, -0.8459243, 0, 0, 0, 1, 1,
-0.326573, -0.2178113, 0.1492141, 0, 0, 0, 1, 1,
-0.3265317, 1.654155, 0.1536919, 0, 0, 0, 1, 1,
-0.3237403, 1.093508, 1.196326, 0, 0, 0, 1, 1,
-0.3194407, 1.802661, 1.042762, 0, 0, 0, 1, 1,
-0.3190063, -0.6008016, -3.191061, 0, 0, 0, 1, 1,
-0.3163788, 0.0523905, -2.615448, 0, 0, 0, 1, 1,
-0.3145367, 0.7792911, -2.320039, 1, 1, 1, 1, 1,
-0.3144972, -0.9053982, -3.1877, 1, 1, 1, 1, 1,
-0.3144369, 0.5731809, -0.2823063, 1, 1, 1, 1, 1,
-0.3136874, -0.5462081, -1.003893, 1, 1, 1, 1, 1,
-0.312623, 1.721812, -0.7160639, 1, 1, 1, 1, 1,
-0.31214, 1.932338, -0.5962034, 1, 1, 1, 1, 1,
-0.309664, -0.1085536, -2.791041, 1, 1, 1, 1, 1,
-0.3094609, -0.7080933, -1.564849, 1, 1, 1, 1, 1,
-0.305612, 1.528151, 0.1714581, 1, 1, 1, 1, 1,
-0.3014388, -0.4303789, -1.505456, 1, 1, 1, 1, 1,
-0.3008159, 0.0174444, -1.303207, 1, 1, 1, 1, 1,
-0.2959571, 0.6664469, -0.3166657, 1, 1, 1, 1, 1,
-0.2932322, 1.421438, 0.1893478, 1, 1, 1, 1, 1,
-0.2925188, 1.15242, 0.2538857, 1, 1, 1, 1, 1,
-0.2908286, 0.6917006, -0.3171305, 1, 1, 1, 1, 1,
-0.2866061, 1.543797, 1.308278, 0, 0, 1, 1, 1,
-0.2863792, 0.9291618, 0.8614279, 1, 0, 0, 1, 1,
-0.28616, -0.4902992, -0.8171688, 1, 0, 0, 1, 1,
-0.2815782, 2.299242, 0.4817269, 1, 0, 0, 1, 1,
-0.2725069, -0.1445248, -2.098845, 1, 0, 0, 1, 1,
-0.2707275, 0.3757226, -2.641508, 1, 0, 0, 1, 1,
-0.2677962, -0.8861773, -1.678184, 0, 0, 0, 1, 1,
-0.2625573, 1.132704, -1.577671, 0, 0, 0, 1, 1,
-0.2591398, -0.7476428, -2.923098, 0, 0, 0, 1, 1,
-0.2473168, -0.4552718, -2.452256, 0, 0, 0, 1, 1,
-0.2471767, 1.791396, 0.2907425, 0, 0, 0, 1, 1,
-0.2445106, -0.9903432, -3.123748, 0, 0, 0, 1, 1,
-0.2440421, 0.3052586, 0.1020839, 0, 0, 0, 1, 1,
-0.2411628, -0.9274505, -1.661693, 1, 1, 1, 1, 1,
-0.2403215, 0.79342, -0.8860853, 1, 1, 1, 1, 1,
-0.2353545, 0.5279732, -0.0286266, 1, 1, 1, 1, 1,
-0.235093, 0.2710164, 0.7467233, 1, 1, 1, 1, 1,
-0.2338075, -0.8888101, -3.167819, 1, 1, 1, 1, 1,
-0.233029, 1.194702, -0.747305, 1, 1, 1, 1, 1,
-0.2299926, -1.055495, -3.080686, 1, 1, 1, 1, 1,
-0.2260119, 0.05260356, -0.1838465, 1, 1, 1, 1, 1,
-0.22341, 0.1641252, -0.4811713, 1, 1, 1, 1, 1,
-0.2233858, -0.5124097, -2.544262, 1, 1, 1, 1, 1,
-0.2233168, -0.7508099, -2.730946, 1, 1, 1, 1, 1,
-0.2200646, -0.251655, -3.171237, 1, 1, 1, 1, 1,
-0.216894, -0.4387553, -0.5104285, 1, 1, 1, 1, 1,
-0.2143749, 0.5246107, -0.9836214, 1, 1, 1, 1, 1,
-0.2118976, -0.4144816, -3.385199, 1, 1, 1, 1, 1,
-0.2100648, -0.7305818, -4.392264, 0, 0, 1, 1, 1,
-0.2061685, -0.1646874, -2.89418, 1, 0, 0, 1, 1,
-0.2042892, 0.004106265, -2.957836, 1, 0, 0, 1, 1,
-0.2042612, -0.6652312, -5.030813, 1, 0, 0, 1, 1,
-0.2028567, -2.18623, -3.030627, 1, 0, 0, 1, 1,
-0.2002044, 0.9958367, -1.48396, 1, 0, 0, 1, 1,
-0.1947823, 1.434533, 1.405424, 0, 0, 0, 1, 1,
-0.1931676, -0.0313695, -1.949117, 0, 0, 0, 1, 1,
-0.1917585, 1.731893, 0.493613, 0, 0, 0, 1, 1,
-0.190582, -0.2668267, -2.3361, 0, 0, 0, 1, 1,
-0.1899322, 0.3964572, 0.150112, 0, 0, 0, 1, 1,
-0.1881972, 0.076414, -2.550684, 0, 0, 0, 1, 1,
-0.1850033, -2.83451, -2.307104, 0, 0, 0, 1, 1,
-0.1834321, -0.1928134, -2.689681, 1, 1, 1, 1, 1,
-0.1731372, 0.0416215, -1.347001, 1, 1, 1, 1, 1,
-0.1713868, 1.272193, -1.602991, 1, 1, 1, 1, 1,
-0.1705258, 0.4528435, -0.164068, 1, 1, 1, 1, 1,
-0.1658773, 0.2344591, -1.001338, 1, 1, 1, 1, 1,
-0.1602987, 0.1983472, -1.962409, 1, 1, 1, 1, 1,
-0.1553098, 0.4782577, -0.3760322, 1, 1, 1, 1, 1,
-0.1546439, -0.1440171, -1.832084, 1, 1, 1, 1, 1,
-0.145587, -1.656194, -4.941815, 1, 1, 1, 1, 1,
-0.141553, 1.174564, 0.02397922, 1, 1, 1, 1, 1,
-0.1340457, 0.3407931, -0.588762, 1, 1, 1, 1, 1,
-0.1339046, -0.7211291, -0.6653808, 1, 1, 1, 1, 1,
-0.1315936, 1.647629, -0.1994632, 1, 1, 1, 1, 1,
-0.1292623, 0.2120637, -1.172244, 1, 1, 1, 1, 1,
-0.1259993, -0.572009, -2.842885, 1, 1, 1, 1, 1,
-0.1239327, 0.5134022, -0.9473234, 0, 0, 1, 1, 1,
-0.1230737, -0.06299605, -1.666788, 1, 0, 0, 1, 1,
-0.1158876, 1.423354, -0.5069377, 1, 0, 0, 1, 1,
-0.1151281, -1.555867, -4.338851, 1, 0, 0, 1, 1,
-0.1147718, -1.150861, -3.514479, 1, 0, 0, 1, 1,
-0.1141079, 0.4161615, -0.7312232, 1, 0, 0, 1, 1,
-0.1133565, -1.746152, -1.855205, 0, 0, 0, 1, 1,
-0.1126762, -0.2317686, -1.250606, 0, 0, 0, 1, 1,
-0.1113451, 1.118301, 0.8513947, 0, 0, 0, 1, 1,
-0.1005924, 1.564355, 1.741701, 0, 0, 0, 1, 1,
-0.09895366, 0.2853503, -1.060133, 0, 0, 0, 1, 1,
-0.09892973, -0.06260453, -3.394282, 0, 0, 0, 1, 1,
-0.09683938, -0.00909581, -1.033893, 0, 0, 0, 1, 1,
-0.09583002, -0.09558089, -1.937242, 1, 1, 1, 1, 1,
-0.09148818, 0.8893225, 0.421086, 1, 1, 1, 1, 1,
-0.09088496, -0.09804855, -3.373878, 1, 1, 1, 1, 1,
-0.08748407, -0.8465193, -2.231356, 1, 1, 1, 1, 1,
-0.06919832, 1.925745, -0.3869204, 1, 1, 1, 1, 1,
-0.06919368, -1.239767, -4.558916, 1, 1, 1, 1, 1,
-0.06865922, 1.449367, -0.9663501, 1, 1, 1, 1, 1,
-0.05870284, -0.7807723, -4.697825, 1, 1, 1, 1, 1,
-0.05427687, 0.3051773, 0.7439922, 1, 1, 1, 1, 1,
-0.04961238, -0.2578747, -4.009274, 1, 1, 1, 1, 1,
-0.0459258, 1.588142, -1.737981, 1, 1, 1, 1, 1,
-0.04518676, 0.3005524, -1.158111, 1, 1, 1, 1, 1,
-0.04515107, 1.176984, -0.1407101, 1, 1, 1, 1, 1,
-0.04411749, -1.123713, -3.753377, 1, 1, 1, 1, 1,
-0.04258381, -0.4915816, -1.620557, 1, 1, 1, 1, 1,
-0.04196479, -0.5727533, -4.871948, 0, 0, 1, 1, 1,
-0.04181616, -0.5241647, -3.32731, 1, 0, 0, 1, 1,
-0.03769642, 0.2006298, 0.6989846, 1, 0, 0, 1, 1,
-0.03627773, -0.7510135, -4.513186, 1, 0, 0, 1, 1,
-0.03617991, -0.8840408, -4.865653, 1, 0, 0, 1, 1,
-0.03537892, -1.527389, -4.469788, 1, 0, 0, 1, 1,
-0.02775887, -0.4607375, -3.374935, 0, 0, 0, 1, 1,
-0.02699272, -0.5058233, -2.180594, 0, 0, 0, 1, 1,
-0.0257281, -0.7997686, -3.809183, 0, 0, 0, 1, 1,
-0.02343059, -0.09629692, -1.264374, 0, 0, 0, 1, 1,
-0.02197851, 0.847977, 0.752343, 0, 0, 0, 1, 1,
-0.01850911, -0.8513911, -3.377522, 0, 0, 0, 1, 1,
-0.01640401, 1.020168, -1.170963, 0, 0, 0, 1, 1,
-0.01354075, 0.9808313, -1.100336, 1, 1, 1, 1, 1,
-0.01091039, -1.477417, -4.282236, 1, 1, 1, 1, 1,
-0.00327901, -0.565991, -1.570736, 1, 1, 1, 1, 1,
-0.002634106, -0.3528871, -3.643406, 1, 1, 1, 1, 1,
-0.002111922, -2.023489, -3.931747, 1, 1, 1, 1, 1,
-0.001684474, 1.869593, 0.5270389, 1, 1, 1, 1, 1,
0.0005927006, -1.786909, 1.812088, 1, 1, 1, 1, 1,
0.003018127, -1.246367, 3.436609, 1, 1, 1, 1, 1,
0.004240779, -1.175157, 3.308854, 1, 1, 1, 1, 1,
0.006807359, -0.9936197, 4.98981, 1, 1, 1, 1, 1,
0.008336878, 0.07564053, -0.7985714, 1, 1, 1, 1, 1,
0.00900849, 0.6260275, 1.087714, 1, 1, 1, 1, 1,
0.01231223, -1.222918, 3.431955, 1, 1, 1, 1, 1,
0.01316557, -1.06534, 1.994484, 1, 1, 1, 1, 1,
0.01456456, 0.8177095, 0.3401414, 1, 1, 1, 1, 1,
0.01486042, -1.018106, 4.48103, 0, 0, 1, 1, 1,
0.01499211, -0.7165591, 2.019031, 1, 0, 0, 1, 1,
0.01668437, 0.4729835, 0.2067521, 1, 0, 0, 1, 1,
0.01703541, -0.2066112, 5.079997, 1, 0, 0, 1, 1,
0.01836686, -0.2985989, 3.389541, 1, 0, 0, 1, 1,
0.01953151, 0.1934478, -0.05777474, 1, 0, 0, 1, 1,
0.02181832, -1.119639, 4.325024, 0, 0, 0, 1, 1,
0.02242841, 1.445368, 0.1214218, 0, 0, 0, 1, 1,
0.02397594, 0.2548139, 2.247396, 0, 0, 0, 1, 1,
0.02711889, 0.7794582, 1.882727, 0, 0, 0, 1, 1,
0.02777394, 1.217726, -0.3564286, 0, 0, 0, 1, 1,
0.02833376, -0.04432351, 4.427857, 0, 0, 0, 1, 1,
0.0350136, 0.3810258, 1.753128, 0, 0, 0, 1, 1,
0.03534569, -0.5106562, 1.337428, 1, 1, 1, 1, 1,
0.03810536, 0.4758607, -0.0791169, 1, 1, 1, 1, 1,
0.0404483, 0.6073058, 1.831633, 1, 1, 1, 1, 1,
0.04117892, -0.006096954, 1.395353, 1, 1, 1, 1, 1,
0.0417176, -1.006294, 1.990797, 1, 1, 1, 1, 1,
0.04333217, -1.574387, 3.915505, 1, 1, 1, 1, 1,
0.04433856, -0.6779979, 3.298354, 1, 1, 1, 1, 1,
0.04883814, -1.246098, 1.733958, 1, 1, 1, 1, 1,
0.0536018, 2.055558, 1.472152, 1, 1, 1, 1, 1,
0.05589916, -2.128982, 3.544718, 1, 1, 1, 1, 1,
0.05682926, -0.4085605, 3.587913, 1, 1, 1, 1, 1,
0.05731241, -1.704282, 1.924266, 1, 1, 1, 1, 1,
0.05999827, 2.216334, -1.680293, 1, 1, 1, 1, 1,
0.06384968, -0.4822136, 3.448285, 1, 1, 1, 1, 1,
0.0660592, -0.7994419, 4.107011, 1, 1, 1, 1, 1,
0.06883411, 1.49443, -0.06706914, 0, 0, 1, 1, 1,
0.07021694, -0.21089, 2.586275, 1, 0, 0, 1, 1,
0.07194902, -0.8867898, 3.463982, 1, 0, 0, 1, 1,
0.07882218, -1.538847, 2.812164, 1, 0, 0, 1, 1,
0.0816135, -0.2114631, 2.698559, 1, 0, 0, 1, 1,
0.08307659, 1.557642, -0.4223018, 1, 0, 0, 1, 1,
0.08466636, 2.618728, 0.7164233, 0, 0, 0, 1, 1,
0.09514636, 0.5160259, 1.153439, 0, 0, 0, 1, 1,
0.09532894, 0.8170587, -0.9087256, 0, 0, 0, 1, 1,
0.09759271, 1.507503, -2.251651, 0, 0, 0, 1, 1,
0.09936963, 0.08824272, 0.9844376, 0, 0, 0, 1, 1,
0.09956477, -0.04761296, 3.270295, 0, 0, 0, 1, 1,
0.1009792, 1.651603, 1.220946, 0, 0, 0, 1, 1,
0.1127787, -0.4395365, 2.125906, 1, 1, 1, 1, 1,
0.1170861, -1.180431, 3.304451, 1, 1, 1, 1, 1,
0.1198099, -1.284914, 3.550063, 1, 1, 1, 1, 1,
0.1217455, -0.6372671, 5.804628, 1, 1, 1, 1, 1,
0.1240064, 1.44681, -0.381843, 1, 1, 1, 1, 1,
0.1261953, -0.1544132, 3.49714, 1, 1, 1, 1, 1,
0.1268561, 0.6290829, 0.09031282, 1, 1, 1, 1, 1,
0.127296, 1.02653, -1.372952, 1, 1, 1, 1, 1,
0.1311409, -1.146484, 1.502436, 1, 1, 1, 1, 1,
0.1312995, 0.6999757, 0.173156, 1, 1, 1, 1, 1,
0.1362704, -0.3525564, 3.868037, 1, 1, 1, 1, 1,
0.1397124, 0.3124628, 1.800807, 1, 1, 1, 1, 1,
0.1405643, 1.398289, -1.310226, 1, 1, 1, 1, 1,
0.1429103, -1.427369, 3.984914, 1, 1, 1, 1, 1,
0.1436712, -1.054361, 1.139187, 1, 1, 1, 1, 1,
0.1450635, 0.04384609, 1.389799, 0, 0, 1, 1, 1,
0.1456133, 2.331978, 0.9397354, 1, 0, 0, 1, 1,
0.1468277, -2.785684, 4.47915, 1, 0, 0, 1, 1,
0.1531746, -0.7748566, 5.39415, 1, 0, 0, 1, 1,
0.1533946, -0.0317492, 0.9790886, 1, 0, 0, 1, 1,
0.1561035, -0.3831588, 1.335136, 1, 0, 0, 1, 1,
0.1590959, 0.250911, 1.11196, 0, 0, 0, 1, 1,
0.1613087, 1.05216, 0.6416107, 0, 0, 0, 1, 1,
0.1622217, 0.0338721, 2.761127, 0, 0, 0, 1, 1,
0.1626, 0.3073494, -1.217263, 0, 0, 0, 1, 1,
0.1661138, -0.4055059, 1.221249, 0, 0, 0, 1, 1,
0.1664765, -1.326741, 1.7053, 0, 0, 0, 1, 1,
0.166518, 2.147187, 0.3326823, 0, 0, 0, 1, 1,
0.1700007, 0.927295, 0.7602031, 1, 1, 1, 1, 1,
0.1770966, -0.1764996, 1.30036, 1, 1, 1, 1, 1,
0.1787613, -0.778758, 3.097501, 1, 1, 1, 1, 1,
0.1812468, 2.494492, -0.2260606, 1, 1, 1, 1, 1,
0.1871591, 0.9192024, 1.481302, 1, 1, 1, 1, 1,
0.1905924, -0.2908515, 3.864043, 1, 1, 1, 1, 1,
0.1959005, 1.436596, -0.1137211, 1, 1, 1, 1, 1,
0.1971445, -0.4100425, 2.068483, 1, 1, 1, 1, 1,
0.1974719, -0.04414991, 2.681283, 1, 1, 1, 1, 1,
0.1978156, 1.894761, -0.9928249, 1, 1, 1, 1, 1,
0.198285, 2.208125, 2.557978, 1, 1, 1, 1, 1,
0.1985001, 0.6416318, -0.3248703, 1, 1, 1, 1, 1,
0.1990913, 0.5990082, 0.7764484, 1, 1, 1, 1, 1,
0.199233, 0.2519174, -0.1159309, 1, 1, 1, 1, 1,
0.2050702, 0.1875841, 2.107982, 1, 1, 1, 1, 1,
0.2057474, 0.1804586, 1.172606, 0, 0, 1, 1, 1,
0.2064861, 1.602206, 0.5919938, 1, 0, 0, 1, 1,
0.2089816, 1.416102, 0.562468, 1, 0, 0, 1, 1,
0.2101469, 0.08481424, 0.6504381, 1, 0, 0, 1, 1,
0.213091, 0.6775225, -0.8523348, 1, 0, 0, 1, 1,
0.2134834, -1.469911, 4.773612, 1, 0, 0, 1, 1,
0.222051, 0.3222213, -0.001674205, 0, 0, 0, 1, 1,
0.2239856, -0.495948, 3.885976, 0, 0, 0, 1, 1,
0.2241628, 0.5527215, 1.122006, 0, 0, 0, 1, 1,
0.2243219, -0.189637, 2.762452, 0, 0, 0, 1, 1,
0.2246212, 1.165736, 0.2810075, 0, 0, 0, 1, 1,
0.2285767, 0.9060736, -0.4770975, 0, 0, 0, 1, 1,
0.2315177, -1.163246, 2.871588, 0, 0, 0, 1, 1,
0.2320264, -0.373451, 2.533294, 1, 1, 1, 1, 1,
0.232104, -0.9756219, 1.899459, 1, 1, 1, 1, 1,
0.2325059, -0.03234806, 2.30919, 1, 1, 1, 1, 1,
0.232941, 0.5404242, -0.4436708, 1, 1, 1, 1, 1,
0.2333966, 0.1711645, 1.534034, 1, 1, 1, 1, 1,
0.2340941, 0.2707428, 0.9661395, 1, 1, 1, 1, 1,
0.2351265, -0.2410102, 3.38164, 1, 1, 1, 1, 1,
0.2351514, -2.1159, 3.276827, 1, 1, 1, 1, 1,
0.2378151, -0.2205561, 3.061368, 1, 1, 1, 1, 1,
0.2392018, -1.055324, 1.916074, 1, 1, 1, 1, 1,
0.2434101, 0.6459692, 0.9270124, 1, 1, 1, 1, 1,
0.2445448, -1.74368, 5.275947, 1, 1, 1, 1, 1,
0.2562445, -0.6769202, 3.328374, 1, 1, 1, 1, 1,
0.2576518, 0.1716788, 1.534485, 1, 1, 1, 1, 1,
0.2584626, -0.1426571, 3.075397, 1, 1, 1, 1, 1,
0.261679, -0.9406661, 2.322155, 0, 0, 1, 1, 1,
0.2648113, 0.6862022, 0.7834362, 1, 0, 0, 1, 1,
0.2675065, 0.7275041, -0.03434229, 1, 0, 0, 1, 1,
0.2678131, -0.5775306, 3.191827, 1, 0, 0, 1, 1,
0.2680338, -0.0108683, 2.299223, 1, 0, 0, 1, 1,
0.2686406, -1.548354, 2.040608, 1, 0, 0, 1, 1,
0.2708705, -0.7557426, 1.076496, 0, 0, 0, 1, 1,
0.2721951, -1.161057, 3.344149, 0, 0, 0, 1, 1,
0.2790684, 0.1120252, 1.322755, 0, 0, 0, 1, 1,
0.2794383, 0.3940627, 1.504829, 0, 0, 0, 1, 1,
0.2809792, -0.1710333, 1.243131, 0, 0, 0, 1, 1,
0.2830724, 0.9820428, -0.02952136, 0, 0, 0, 1, 1,
0.2835249, -0.6027425, 1.331077, 0, 0, 0, 1, 1,
0.2844244, 0.5910538, 1.071077, 1, 1, 1, 1, 1,
0.2886818, 0.1248517, 2.868146, 1, 1, 1, 1, 1,
0.2888155, 0.1970451, 1.642307, 1, 1, 1, 1, 1,
0.2914317, 0.2049452, 2.068849, 1, 1, 1, 1, 1,
0.2917769, -1.190658, 2.667448, 1, 1, 1, 1, 1,
0.2983688, 0.09811804, 2.538595, 1, 1, 1, 1, 1,
0.2999074, 0.1833329, 2.057956, 1, 1, 1, 1, 1,
0.2999083, 0.8340806, 0.29163, 1, 1, 1, 1, 1,
0.3007851, -0.116906, 1.490463, 1, 1, 1, 1, 1,
0.3016078, 0.3050275, 2.042212, 1, 1, 1, 1, 1,
0.309253, -0.3634194, 1.517521, 1, 1, 1, 1, 1,
0.3109019, -0.203405, 2.25583, 1, 1, 1, 1, 1,
0.3147636, -1.403871, 3.791794, 1, 1, 1, 1, 1,
0.317495, -1.517755, 2.943173, 1, 1, 1, 1, 1,
0.3208611, -1.950189, 2.046349, 1, 1, 1, 1, 1,
0.3256359, -0.3728446, 2.109726, 0, 0, 1, 1, 1,
0.3259399, -2.10835, 4.016846, 1, 0, 0, 1, 1,
0.3281073, 0.2548364, 2.853997, 1, 0, 0, 1, 1,
0.3312205, -1.230274, 2.575397, 1, 0, 0, 1, 1,
0.3344159, -1.106339, 1.196854, 1, 0, 0, 1, 1,
0.3354693, 0.2151394, 0.5941429, 1, 0, 0, 1, 1,
0.3383328, 0.8538583, -0.454356, 0, 0, 0, 1, 1,
0.3389199, -0.8719811, 2.261603, 0, 0, 0, 1, 1,
0.3400163, 0.3442249, -0.3133908, 0, 0, 0, 1, 1,
0.3420848, -0.2641249, 0.1066225, 0, 0, 0, 1, 1,
0.344148, 0.501525, -0.4837291, 0, 0, 0, 1, 1,
0.3485844, -1.035975, 1.881219, 0, 0, 0, 1, 1,
0.3491199, 0.4957466, 2.038047, 0, 0, 0, 1, 1,
0.3543188, 2.021694, -0.7716464, 1, 1, 1, 1, 1,
0.3546167, 0.9029104, 0.3010626, 1, 1, 1, 1, 1,
0.3593847, 0.3124373, -0.2935449, 1, 1, 1, 1, 1,
0.3630404, 0.9810277, -0.6622456, 1, 1, 1, 1, 1,
0.3642547, 0.3250037, 0.905874, 1, 1, 1, 1, 1,
0.3664727, -0.7565789, 3.647265, 1, 1, 1, 1, 1,
0.36724, 2.520045, 1.076423, 1, 1, 1, 1, 1,
0.3689147, 0.3629591, 0.9369984, 1, 1, 1, 1, 1,
0.3708589, 0.6536886, 1.540642, 1, 1, 1, 1, 1,
0.3714976, 0.1847118, 1.186301, 1, 1, 1, 1, 1,
0.3721104, 1.011952, 0.6760989, 1, 1, 1, 1, 1,
0.3728595, 1.667548, -0.07991024, 1, 1, 1, 1, 1,
0.379191, -0.0841185, -0.2246503, 1, 1, 1, 1, 1,
0.3927387, -1.646391, 3.105583, 1, 1, 1, 1, 1,
0.397764, -0.7601721, 2.102159, 1, 1, 1, 1, 1,
0.3998902, 0.7566884, -0.2542207, 0, 0, 1, 1, 1,
0.4046786, 0.8843041, -1.647983, 1, 0, 0, 1, 1,
0.4275574, -1.415851, 3.023036, 1, 0, 0, 1, 1,
0.4290119, -0.7600592, 2.042856, 1, 0, 0, 1, 1,
0.4324834, -0.8966213, 2.259727, 1, 0, 0, 1, 1,
0.4331224, -0.2218022, 1.992218, 1, 0, 0, 1, 1,
0.435848, 0.6514179, 0.5483376, 0, 0, 0, 1, 1,
0.4375484, -1.416081, 3.786346, 0, 0, 0, 1, 1,
0.4389726, -0.3330711, 3.305043, 0, 0, 0, 1, 1,
0.4421461, -0.3017892, 1.452494, 0, 0, 0, 1, 1,
0.4423855, -0.5263019, 3.892658, 0, 0, 0, 1, 1,
0.4510553, 0.4234102, 2.288843, 0, 0, 0, 1, 1,
0.4544811, -0.9300413, 2.444991, 0, 0, 0, 1, 1,
0.4575335, 0.5559909, -1.246222, 1, 1, 1, 1, 1,
0.461147, 0.3944528, 0.6090631, 1, 1, 1, 1, 1,
0.4632025, -0.404945, 2.79114, 1, 1, 1, 1, 1,
0.4641589, 1.87758, -0.887449, 1, 1, 1, 1, 1,
0.4650247, -0.5579068, 1.641432, 1, 1, 1, 1, 1,
0.4655075, -0.9158269, 4.150689, 1, 1, 1, 1, 1,
0.4700511, -0.1638307, 3.023537, 1, 1, 1, 1, 1,
0.4713059, -0.02434642, 2.865097, 1, 1, 1, 1, 1,
0.4781096, 0.921204, 1.730745, 1, 1, 1, 1, 1,
0.4793523, 1.238272, 0.7632341, 1, 1, 1, 1, 1,
0.4820215, 0.6386878, 1.145709, 1, 1, 1, 1, 1,
0.4830861, -0.9672316, 3.603471, 1, 1, 1, 1, 1,
0.4844747, 0.6254002, -0.3530229, 1, 1, 1, 1, 1,
0.4847467, 0.01108824, 0.938517, 1, 1, 1, 1, 1,
0.4862713, -0.7541246, 1.135485, 1, 1, 1, 1, 1,
0.4876331, -0.4650383, 3.257465, 0, 0, 1, 1, 1,
0.4886194, -0.9344795, 3.34321, 1, 0, 0, 1, 1,
0.4889954, -2.358253, 2.484883, 1, 0, 0, 1, 1,
0.4896705, 1.541842, -0.1010549, 1, 0, 0, 1, 1,
0.4948862, 0.8485284, 0.2019453, 1, 0, 0, 1, 1,
0.4986326, -0.6579866, 3.566263, 1, 0, 0, 1, 1,
0.4993244, -0.3156276, 2.095397, 0, 0, 0, 1, 1,
0.5028731, 0.04100276, 0.6666844, 0, 0, 0, 1, 1,
0.5033979, -0.5558239, 3.591291, 0, 0, 0, 1, 1,
0.5105264, 0.5770879, 0.5773523, 0, 0, 0, 1, 1,
0.5113806, 0.515215, 0.8243607, 0, 0, 0, 1, 1,
0.5223399, -1.148235, 3.03955, 0, 0, 0, 1, 1,
0.524219, 0.1203087, 0.2067627, 0, 0, 0, 1, 1,
0.5259637, -1.22215, 2.486471, 1, 1, 1, 1, 1,
0.5286545, 0.8863115, 1.13102, 1, 1, 1, 1, 1,
0.5326178, -1.504641, 4.690881, 1, 1, 1, 1, 1,
0.5380158, -0.2406178, 1.91651, 1, 1, 1, 1, 1,
0.5420887, -0.2193785, 3.59765, 1, 1, 1, 1, 1,
0.5512743, 0.3569231, 1.10657, 1, 1, 1, 1, 1,
0.5561677, 0.0006767471, 1.943447, 1, 1, 1, 1, 1,
0.5575674, -0.1325355, 1.771734, 1, 1, 1, 1, 1,
0.5608559, 0.2190844, 0.329197, 1, 1, 1, 1, 1,
0.5623254, -1.056077, 1.67226, 1, 1, 1, 1, 1,
0.5674196, 1.9787, -0.473633, 1, 1, 1, 1, 1,
0.5681273, -0.5447387, 0.4512563, 1, 1, 1, 1, 1,
0.5681612, 0.8365844, -0.263866, 1, 1, 1, 1, 1,
0.5711156, -0.4418595, 2.872693, 1, 1, 1, 1, 1,
0.5733309, 0.3852585, 0.3670133, 1, 1, 1, 1, 1,
0.5733766, -0.8245847, 2.571864, 0, 0, 1, 1, 1,
0.5736139, -0.9011848, 3.272408, 1, 0, 0, 1, 1,
0.5748033, -0.5424045, 1.362556, 1, 0, 0, 1, 1,
0.5752578, -1.09409, 2.843088, 1, 0, 0, 1, 1,
0.5775332, 0.5254487, 0.5328624, 1, 0, 0, 1, 1,
0.5780618, 0.06237954, 0.8568065, 1, 0, 0, 1, 1,
0.5787907, -1.735859, 2.552661, 0, 0, 0, 1, 1,
0.5810955, 0.5669501, 0.267717, 0, 0, 0, 1, 1,
0.5846967, 1.55143, -0.1437944, 0, 0, 0, 1, 1,
0.5866311, -0.1874811, 2.749873, 0, 0, 0, 1, 1,
0.592944, -0.001679588, 2.247185, 0, 0, 0, 1, 1,
0.5990585, -0.8517566, 3.427418, 0, 0, 0, 1, 1,
0.5994577, 2.064135, 1.547601, 0, 0, 0, 1, 1,
0.6035551, 2.974337, 0.7343673, 1, 1, 1, 1, 1,
0.6039374, 0.2376734, 1.472599, 1, 1, 1, 1, 1,
0.6065618, 1.374592, -0.09581976, 1, 1, 1, 1, 1,
0.6068851, -1.534842, 3.193246, 1, 1, 1, 1, 1,
0.6080081, 1.404519, 1.27961, 1, 1, 1, 1, 1,
0.6084275, -1.068105, 3.482518, 1, 1, 1, 1, 1,
0.6194115, 0.4093287, 0.7823432, 1, 1, 1, 1, 1,
0.6240817, -1.464256, 1.165391, 1, 1, 1, 1, 1,
0.6256338, -0.2657712, 1.782643, 1, 1, 1, 1, 1,
0.6296926, 1.513662, 1.863573, 1, 1, 1, 1, 1,
0.6336501, 1.909127, -0.181441, 1, 1, 1, 1, 1,
0.6449347, -0.1989791, 1.024891, 1, 1, 1, 1, 1,
0.6460842, 1.604811, 0.4143654, 1, 1, 1, 1, 1,
0.6471403, 0.7213382, 0.499027, 1, 1, 1, 1, 1,
0.649216, 0.141668, 1.62545, 1, 1, 1, 1, 1,
0.6531985, 0.7379637, 0.1383994, 0, 0, 1, 1, 1,
0.6551204, -0.0863283, 2.888051, 1, 0, 0, 1, 1,
0.662441, -1.705893, 2.856649, 1, 0, 0, 1, 1,
0.6648656, -1.239686, 3.606448, 1, 0, 0, 1, 1,
0.6673181, -0.1332267, 0.6938756, 1, 0, 0, 1, 1,
0.6713032, -0.6410194, 1.238282, 1, 0, 0, 1, 1,
0.6734307, 1.030898, -0.6296565, 0, 0, 0, 1, 1,
0.6799417, 0.1739992, 1.994322, 0, 0, 0, 1, 1,
0.6844859, 0.1016602, 0.7700489, 0, 0, 0, 1, 1,
0.6850296, -0.1662437, 2.149613, 0, 0, 0, 1, 1,
0.6867268, 0.6932172, -0.2872384, 0, 0, 0, 1, 1,
0.6882749, 2.496989, 0.4591778, 0, 0, 0, 1, 1,
0.6900694, 0.7096173, 1.080707, 0, 0, 0, 1, 1,
0.7013204, 0.7961859, 2.460111, 1, 1, 1, 1, 1,
0.7014724, -0.1143356, 0.7890902, 1, 1, 1, 1, 1,
0.7066053, 0.9203134, 1.560268, 1, 1, 1, 1, 1,
0.7151412, -1.372153, 1.023709, 1, 1, 1, 1, 1,
0.723324, -1.366651, 2.250859, 1, 1, 1, 1, 1,
0.724444, -0.4462076, 1.139126, 1, 1, 1, 1, 1,
0.7284412, -1.814462, 4.1084, 1, 1, 1, 1, 1,
0.73234, 2.149405, 0.3297503, 1, 1, 1, 1, 1,
0.7360445, -0.02480024, 2.614317, 1, 1, 1, 1, 1,
0.743423, -0.5482221, 2.365387, 1, 1, 1, 1, 1,
0.7434487, -0.6026038, 0.5069834, 1, 1, 1, 1, 1,
0.744525, 0.6633747, -0.01311094, 1, 1, 1, 1, 1,
0.7465081, -0.8666263, 3.193036, 1, 1, 1, 1, 1,
0.7488681, -1.065107, 2.18166, 1, 1, 1, 1, 1,
0.7490771, -1.126677, 4.071203, 1, 1, 1, 1, 1,
0.7490849, -1.500265, 1.429527, 0, 0, 1, 1, 1,
0.757713, 0.8622977, 0.08860568, 1, 0, 0, 1, 1,
0.7610793, 0.1306199, 0.2426089, 1, 0, 0, 1, 1,
0.7611412, 1.254769, -0.1290114, 1, 0, 0, 1, 1,
0.7638743, 0.4232674, 2.998662, 1, 0, 0, 1, 1,
0.7718062, -0.538937, 2.971337, 1, 0, 0, 1, 1,
0.7768291, 1.932066, -1.435067, 0, 0, 0, 1, 1,
0.7779406, -0.07450045, 2.627608, 0, 0, 0, 1, 1,
0.7799888, 0.1154061, 0.2466528, 0, 0, 0, 1, 1,
0.7807363, -2.604896, 2.781371, 0, 0, 0, 1, 1,
0.7813782, 1.129619, 1.440519, 0, 0, 0, 1, 1,
0.7839311, -0.2514495, 2.999842, 0, 0, 0, 1, 1,
0.7897301, 2.613714, 1.066005, 0, 0, 0, 1, 1,
0.7898685, 0.3167379, -0.9342542, 1, 1, 1, 1, 1,
0.7993463, 1.05376, 0.6562123, 1, 1, 1, 1, 1,
0.8141167, 2.932616, 0.2070187, 1, 1, 1, 1, 1,
0.8188524, 0.3965284, 1.714493, 1, 1, 1, 1, 1,
0.8218962, 1.469004, 2.558135, 1, 1, 1, 1, 1,
0.8290852, 1.052487, -0.389718, 1, 1, 1, 1, 1,
0.8295314, 0.4374421, 2.535328, 1, 1, 1, 1, 1,
0.8382883, -0.2035982, 1.776247, 1, 1, 1, 1, 1,
0.8430384, -0.2463933, 2.874036, 1, 1, 1, 1, 1,
0.8442044, 0.09260856, 2.006269, 1, 1, 1, 1, 1,
0.8451833, -1.129802, 2.623732, 1, 1, 1, 1, 1,
0.8489818, -0.2638613, 0.4005736, 1, 1, 1, 1, 1,
0.8622499, 0.2693498, 0.9049319, 1, 1, 1, 1, 1,
0.870754, -0.2183189, 0.4248089, 1, 1, 1, 1, 1,
0.8713973, -1.276293, 1.88563, 1, 1, 1, 1, 1,
0.873117, -0.8495317, 2.09901, 0, 0, 1, 1, 1,
0.8745649, -0.4921402, 2.942745, 1, 0, 0, 1, 1,
0.8750283, -1.257801, 3.723723, 1, 0, 0, 1, 1,
0.8752912, -1.072101, 3.730068, 1, 0, 0, 1, 1,
0.8754806, 1.194643, 2.195864, 1, 0, 0, 1, 1,
0.8797463, 0.4700992, 1.632314, 1, 0, 0, 1, 1,
0.880466, 0.6163739, 0.12987, 0, 0, 0, 1, 1,
0.8859113, 0.3449094, 1.702964, 0, 0, 0, 1, 1,
0.8874958, 0.1158785, 2.090755, 0, 0, 0, 1, 1,
0.9044554, -0.1320796, 1.444277, 0, 0, 0, 1, 1,
0.9050376, 0.1852782, 0.5993252, 0, 0, 0, 1, 1,
0.9075249, -1.701775, 1.90141, 0, 0, 0, 1, 1,
0.9082547, 0.200087, 0.3088617, 0, 0, 0, 1, 1,
0.9095998, 1.469225, 0.4982188, 1, 1, 1, 1, 1,
0.9196084, -0.127012, 2.288683, 1, 1, 1, 1, 1,
0.9210079, 0.828856, -1.133009, 1, 1, 1, 1, 1,
0.9236668, -0.5863335, 3.469556, 1, 1, 1, 1, 1,
0.9318637, -0.03895491, 1.683764, 1, 1, 1, 1, 1,
0.9346622, 0.513131, 1.941726, 1, 1, 1, 1, 1,
0.9453501, -0.1631112, 1.892814, 1, 1, 1, 1, 1,
0.948487, -0.5141343, 2.263901, 1, 1, 1, 1, 1,
0.9509989, -1.315818, 2.074969, 1, 1, 1, 1, 1,
0.9550492, -0.06745455, 1.61218, 1, 1, 1, 1, 1,
0.9565119, 1.608125, 0.2731316, 1, 1, 1, 1, 1,
0.9590032, -0.5586697, 2.529125, 1, 1, 1, 1, 1,
0.9605157, -0.8096837, 0.8955165, 1, 1, 1, 1, 1,
0.967351, 0.01721267, 0.4590631, 1, 1, 1, 1, 1,
0.978987, -0.1140421, 2.535932, 1, 1, 1, 1, 1,
0.9829233, -0.7667179, 1.911583, 0, 0, 1, 1, 1,
0.9896122, -0.05574745, 0.7555046, 1, 0, 0, 1, 1,
0.9970475, 1.144069, 0.2078429, 1, 0, 0, 1, 1,
1.005062, 0.434922, -0.8427969, 1, 0, 0, 1, 1,
1.006381, 0.871407, -0.8437853, 1, 0, 0, 1, 1,
1.017586, 0.52013, 0.2075501, 1, 0, 0, 1, 1,
1.026786, -1.367124, 1.753467, 0, 0, 0, 1, 1,
1.027729, 0.9425122, 0.8488752, 0, 0, 0, 1, 1,
1.028529, 1.250671, -0.7398013, 0, 0, 0, 1, 1,
1.038342, -0.2003112, 2.222263, 0, 0, 0, 1, 1,
1.047178, -1.124623, 2.153873, 0, 0, 0, 1, 1,
1.052298, -0.1958907, 2.342276, 0, 0, 0, 1, 1,
1.054878, 0.5378627, 0.5360793, 0, 0, 0, 1, 1,
1.065345, -0.06361473, 2.78084, 1, 1, 1, 1, 1,
1.071174, 0.9474593, 2.060889, 1, 1, 1, 1, 1,
1.071613, 1.106203, 0.624117, 1, 1, 1, 1, 1,
1.075829, -1.495601, 0.002918898, 1, 1, 1, 1, 1,
1.086721, 0.0491185, 0.8048391, 1, 1, 1, 1, 1,
1.089863, 0.7839614, 2.66854, 1, 1, 1, 1, 1,
1.090442, 0.06646555, 1.802009, 1, 1, 1, 1, 1,
1.092765, 1.368299, 0.925773, 1, 1, 1, 1, 1,
1.093863, -2.219751, 0.450531, 1, 1, 1, 1, 1,
1.094386, -0.5606726, 0.54232, 1, 1, 1, 1, 1,
1.09668, 0.5945797, 1.237495, 1, 1, 1, 1, 1,
1.098527, 0.3251547, 1.955835, 1, 1, 1, 1, 1,
1.11198, 0.5136462, 0.2177427, 1, 1, 1, 1, 1,
1.112313, -0.3411211, 0.7862769, 1, 1, 1, 1, 1,
1.117404, 2.389238, 0.8870556, 1, 1, 1, 1, 1,
1.119148, -0.629473, 1.426329, 0, 0, 1, 1, 1,
1.119904, 0.2740708, 1.497231, 1, 0, 0, 1, 1,
1.123144, 1.895003, 0.09804075, 1, 0, 0, 1, 1,
1.123358, 0.2073956, 1.089951, 1, 0, 0, 1, 1,
1.123608, 0.281473, 0.6843171, 1, 0, 0, 1, 1,
1.128912, 0.3810041, 1.137852, 1, 0, 0, 1, 1,
1.132576, 0.9709758, 0.3362055, 0, 0, 0, 1, 1,
1.134713, 0.8863708, 1.097909, 0, 0, 0, 1, 1,
1.160661, -0.5046856, 2.208204, 0, 0, 0, 1, 1,
1.16124, 0.4156094, 2.79667, 0, 0, 0, 1, 1,
1.170603, 0.7604353, 0.7299445, 0, 0, 0, 1, 1,
1.171413, -0.5040008, 1.685772, 0, 0, 0, 1, 1,
1.173131, -0.4974867, 1.006703, 0, 0, 0, 1, 1,
1.175124, -0.003156134, 2.809209, 1, 1, 1, 1, 1,
1.177444, 1.024007, -0.6881876, 1, 1, 1, 1, 1,
1.180175, -1.953979, 1.254035, 1, 1, 1, 1, 1,
1.193746, -0.2651277, 1.382107, 1, 1, 1, 1, 1,
1.194809, 1.72443, 1.44511, 1, 1, 1, 1, 1,
1.1965, -0.7197801, 2.707099, 1, 1, 1, 1, 1,
1.197839, -0.554176, 2.522096, 1, 1, 1, 1, 1,
1.198087, -0.1860614, 2.525185, 1, 1, 1, 1, 1,
1.198463, 1.233348, -0.2164996, 1, 1, 1, 1, 1,
1.200461, 1.560208, 1.170029, 1, 1, 1, 1, 1,
1.200613, 1.025917, 1.558131, 1, 1, 1, 1, 1,
1.209449, 0.03345113, 2.110706, 1, 1, 1, 1, 1,
1.215429, 0.1847213, 0.5727603, 1, 1, 1, 1, 1,
1.215738, -1.389929, 2.1881, 1, 1, 1, 1, 1,
1.219984, 1.461172, -0.6684132, 1, 1, 1, 1, 1,
1.221322, -0.1763881, 2.106835, 0, 0, 1, 1, 1,
1.239135, 0.9236472, 0.938628, 1, 0, 0, 1, 1,
1.241986, -0.3053913, 1.595531, 1, 0, 0, 1, 1,
1.244257, 0.1628629, 1.890345, 1, 0, 0, 1, 1,
1.256599, 0.1854533, 1.082222, 1, 0, 0, 1, 1,
1.2586, -1.041339, 0.8084851, 1, 0, 0, 1, 1,
1.258764, 0.7283086, 1.434516, 0, 0, 0, 1, 1,
1.260966, 0.08870195, 3.135777, 0, 0, 0, 1, 1,
1.261912, -0.2186828, 2.605461, 0, 0, 0, 1, 1,
1.262524, 0.523231, 0.9847919, 0, 0, 0, 1, 1,
1.266256, 2.557399, -1.438007, 0, 0, 0, 1, 1,
1.266544, -0.6122751, 3.814965, 0, 0, 0, 1, 1,
1.272154, 0.0419341, 2.251366, 0, 0, 0, 1, 1,
1.28177, -0.4039935, 1.877596, 1, 1, 1, 1, 1,
1.285394, 0.6417675, 1.483696, 1, 1, 1, 1, 1,
1.29514, 1.151273, 1.052604, 1, 1, 1, 1, 1,
1.298186, 0.09248696, 2.580239, 1, 1, 1, 1, 1,
1.313774, 1.4828, 0.5186265, 1, 1, 1, 1, 1,
1.321162, -0.8429655, 1.894674, 1, 1, 1, 1, 1,
1.336239, 0.1424471, 2.419693, 1, 1, 1, 1, 1,
1.336286, -1.103749, 3.147053, 1, 1, 1, 1, 1,
1.339776, 0.5714788, 0.1870977, 1, 1, 1, 1, 1,
1.345836, 0.9480132, 0.7817675, 1, 1, 1, 1, 1,
1.349807, -0.6209702, 1.834109, 1, 1, 1, 1, 1,
1.350867, 1.176741, 0.2368497, 1, 1, 1, 1, 1,
1.356814, 0.6206476, -0.01296531, 1, 1, 1, 1, 1,
1.358073, -0.8648869, 1.690147, 1, 1, 1, 1, 1,
1.36004, 1.91248, 0.1804314, 1, 1, 1, 1, 1,
1.361793, -0.4138205, 2.612534, 0, 0, 1, 1, 1,
1.36315, 0.6421416, 0.5987103, 1, 0, 0, 1, 1,
1.363861, -1.029229, 4.42817, 1, 0, 0, 1, 1,
1.380916, -0.530093, 1.189054, 1, 0, 0, 1, 1,
1.382071, -0.4776417, 0.0869214, 1, 0, 0, 1, 1,
1.382918, 0.448887, 1.934093, 1, 0, 0, 1, 1,
1.393355, 0.583985, -0.06023094, 0, 0, 0, 1, 1,
1.400223, 0.5430712, 2.860839, 0, 0, 0, 1, 1,
1.404159, -0.03954236, 3.228738, 0, 0, 0, 1, 1,
1.404386, -0.2329897, -0.2151663, 0, 0, 0, 1, 1,
1.413711, 0.4449441, 2.132464, 0, 0, 0, 1, 1,
1.420414, -0.7124717, 0.9482374, 0, 0, 0, 1, 1,
1.429937, 1.729492, 0.6913012, 0, 0, 0, 1, 1,
1.437216, -0.6707526, 1.422299, 1, 1, 1, 1, 1,
1.466724, 0.301947, 2.069767, 1, 1, 1, 1, 1,
1.468516, 0.2747491, 2.009852, 1, 1, 1, 1, 1,
1.482522, 0.4829426, 1.730319, 1, 1, 1, 1, 1,
1.486124, 0.1336406, 1.796384, 1, 1, 1, 1, 1,
1.501036, -0.02124981, 2.214041, 1, 1, 1, 1, 1,
1.514126, 1.168622, 1.366361, 1, 1, 1, 1, 1,
1.522202, -1.621007, 3.349755, 1, 1, 1, 1, 1,
1.523634, -1.1121, 1.745778, 1, 1, 1, 1, 1,
1.524187, -1.509047, 3.469204, 1, 1, 1, 1, 1,
1.531664, 0.7380286, 2.792137, 1, 1, 1, 1, 1,
1.533703, -0.5556391, 3.562361, 1, 1, 1, 1, 1,
1.549128, -1.239124, 1.257008, 1, 1, 1, 1, 1,
1.555468, 0.2037304, 0.6095411, 1, 1, 1, 1, 1,
1.55627, -1.003449, 2.74914, 1, 1, 1, 1, 1,
1.556401, 0.8002887, 1.26875, 0, 0, 1, 1, 1,
1.558356, 0.6686111, 0.7975004, 1, 0, 0, 1, 1,
1.568644, 0.6391401, 1.736774, 1, 0, 0, 1, 1,
1.575114, -0.6944066, 2.237904, 1, 0, 0, 1, 1,
1.608099, 0.9393697, 1.687891, 1, 0, 0, 1, 1,
1.61142, 1.549763, -0.7714624, 1, 0, 0, 1, 1,
1.630279, 1.140661, 1.558183, 0, 0, 0, 1, 1,
1.678555, -0.1465771, 0.3953268, 0, 0, 0, 1, 1,
1.703094, 0.9882803, 1.59418, 0, 0, 0, 1, 1,
1.706219, 0.6597697, 1.724062, 0, 0, 0, 1, 1,
1.712506, -0.5219839, 2.152537, 0, 0, 0, 1, 1,
1.714718, 0.5797096, 2.052729, 0, 0, 0, 1, 1,
1.718623, 0.1324973, -0.4795043, 0, 0, 0, 1, 1,
1.723313, -0.4220825, 1.780636, 1, 1, 1, 1, 1,
1.73674, 2.283984, 0.2490794, 1, 1, 1, 1, 1,
1.748033, 0.5422396, 0.1623208, 1, 1, 1, 1, 1,
1.752176, 2.004025, -1.768913, 1, 1, 1, 1, 1,
1.780856, -0.5219008, 4.0899, 1, 1, 1, 1, 1,
1.781786, 0.3788717, 1.982575, 1, 1, 1, 1, 1,
1.83361, -0.5935377, 1.967452, 1, 1, 1, 1, 1,
1.853811, -0.5230997, 1.746977, 1, 1, 1, 1, 1,
1.872449, 1.623267, 0.3130227, 1, 1, 1, 1, 1,
1.910075, -0.1310689, -0.9080326, 1, 1, 1, 1, 1,
1.913154, 0.1640783, 1.982676, 1, 1, 1, 1, 1,
1.930669, 0.463778, 1.593621, 1, 1, 1, 1, 1,
1.944445, 0.05662327, 2.967941, 1, 1, 1, 1, 1,
1.964903, 1.230235, 1.02298, 1, 1, 1, 1, 1,
1.983937, 1.541059, 1.277792, 1, 1, 1, 1, 1,
2.054131, -1.984583, 1.342905, 0, 0, 1, 1, 1,
2.058963, -0.6678385, 2.10509, 1, 0, 0, 1, 1,
2.066073, 0.05174858, 3.882204, 1, 0, 0, 1, 1,
2.123744, 0.4246643, 1.789061, 1, 0, 0, 1, 1,
2.134317, 0.9319223, -1.058478, 1, 0, 0, 1, 1,
2.144928, -1.424952, 2.134984, 1, 0, 0, 1, 1,
2.156628, 1.214767, 0.2763439, 0, 0, 0, 1, 1,
2.167769, 1.012084, -0.2246632, 0, 0, 0, 1, 1,
2.18772, -2.580557, 1.985299, 0, 0, 0, 1, 1,
2.202086, -0.3402501, 2.533706, 0, 0, 0, 1, 1,
2.219805, 0.218844, 1.970743, 0, 0, 0, 1, 1,
2.242602, 0.3464338, 2.377481, 0, 0, 0, 1, 1,
2.250259, 0.8929471, 1.68595, 0, 0, 0, 1, 1,
2.312308, -0.1704223, 1.80114, 1, 1, 1, 1, 1,
2.368086, 2.063127, -0.1832876, 1, 1, 1, 1, 1,
2.435187, 0.5567246, 1.603816, 1, 1, 1, 1, 1,
2.501202, 0.6068299, 2.360319, 1, 1, 1, 1, 1,
2.528769, 0.4635124, 1.902917, 1, 1, 1, 1, 1,
3.561911, -1.241089, 2.393348, 1, 1, 1, 1, 1,
3.596618, -1.089859, 2.582132, 1, 1, 1, 1, 1
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
var radius = 9.65864;
var distance = 33.92556;
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
mvMatrix.translate( -0.1142972, -0.06991327, -0.342206 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92556);
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
