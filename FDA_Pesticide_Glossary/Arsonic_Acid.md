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
-3.65953, -0.07316121, -1.311614, 1, 0, 0, 1,
-2.838765, 0.09134244, -1.149229, 1, 0.007843138, 0, 1,
-2.697263, 0.171354, -2.660644, 1, 0.01176471, 0, 1,
-2.691333, -0.9921327, -2.791007, 1, 0.01960784, 0, 1,
-2.460918, -0.2808695, -2.034225, 1, 0.02352941, 0, 1,
-2.420052, 0.499715, -0.7601705, 1, 0.03137255, 0, 1,
-2.385211, 0.02009075, -2.111652, 1, 0.03529412, 0, 1,
-2.317293, 0.6144541, -2.095632, 1, 0.04313726, 0, 1,
-2.315711, 0.6326078, -1.483144, 1, 0.04705882, 0, 1,
-2.30793, -1.114554, -1.881491, 1, 0.05490196, 0, 1,
-2.226666, -1.733128, -3.156084, 1, 0.05882353, 0, 1,
-2.221243, -0.9234871, -1.973701, 1, 0.06666667, 0, 1,
-2.207217, 0.4595549, -2.174606, 1, 0.07058824, 0, 1,
-2.206802, 0.9021294, -2.125986, 1, 0.07843138, 0, 1,
-2.178543, 0.3773881, -1.413356, 1, 0.08235294, 0, 1,
-2.15271, 0.5723248, -0.8819856, 1, 0.09019608, 0, 1,
-2.112864, 1.038025, -1.835225, 1, 0.09411765, 0, 1,
-2.091696, 0.9970573, -0.409673, 1, 0.1019608, 0, 1,
-2.088476, 0.2251597, -1.35362, 1, 0.1098039, 0, 1,
-2.081901, 0.4186805, -1.609355, 1, 0.1137255, 0, 1,
-2.077755, -0.4198419, -1.657568, 1, 0.1215686, 0, 1,
-2.031035, 0.0149804, -0.7386751, 1, 0.1254902, 0, 1,
-1.990449, -0.2158131, -0.6158774, 1, 0.1333333, 0, 1,
-1.968673, 1.267829, -0.9970249, 1, 0.1372549, 0, 1,
-1.964364, 1.101652, -1.590818, 1, 0.145098, 0, 1,
-1.957809, -0.5990728, -0.1302489, 1, 0.1490196, 0, 1,
-1.947459, 1.028307, 0.4644624, 1, 0.1568628, 0, 1,
-1.935382, -1.220264, -1.953607, 1, 0.1607843, 0, 1,
-1.907851, -0.8207096, -2.305356, 1, 0.1686275, 0, 1,
-1.886407, 1.140957, -1.116923, 1, 0.172549, 0, 1,
-1.873209, -0.4601324, -2.344551, 1, 0.1803922, 0, 1,
-1.866035, -0.2164477, -2.522917, 1, 0.1843137, 0, 1,
-1.802578, -0.2901413, -0.5883731, 1, 0.1921569, 0, 1,
-1.795137, -1.407817, -0.3195296, 1, 0.1960784, 0, 1,
-1.784208, 1.387858, 0.9571297, 1, 0.2039216, 0, 1,
-1.77337, 1.759579, -0.1177597, 1, 0.2117647, 0, 1,
-1.757055, 0.09639387, -2.126745, 1, 0.2156863, 0, 1,
-1.753247, 1.19793, 0.6266208, 1, 0.2235294, 0, 1,
-1.747823, 1.514616, -0.5015721, 1, 0.227451, 0, 1,
-1.743107, 1.51118, -1.345379, 1, 0.2352941, 0, 1,
-1.739413, -1.604899, -3.256077, 1, 0.2392157, 0, 1,
-1.730569, 0.3495476, -0.1305374, 1, 0.2470588, 0, 1,
-1.727579, 0.2647086, -3.070286, 1, 0.2509804, 0, 1,
-1.711919, 0.3638583, -1.943757, 1, 0.2588235, 0, 1,
-1.710767, 0.1058145, -3.268107, 1, 0.2627451, 0, 1,
-1.699752, 2.292572, -0.6990598, 1, 0.2705882, 0, 1,
-1.694678, 0.6271994, -0.4611681, 1, 0.2745098, 0, 1,
-1.692964, 1.124133, -2.72096, 1, 0.282353, 0, 1,
-1.673648, 1.381383, -1.687727, 1, 0.2862745, 0, 1,
-1.657839, 0.4540029, -2.067852, 1, 0.2941177, 0, 1,
-1.657657, -0.3906267, -0.7103699, 1, 0.3019608, 0, 1,
-1.638976, 2.51986, 0.8064162, 1, 0.3058824, 0, 1,
-1.620428, -0.01557915, -3.105131, 1, 0.3137255, 0, 1,
-1.606132, -0.2694119, -0.2632273, 1, 0.3176471, 0, 1,
-1.601365, 0.8430177, -0.5849563, 1, 0.3254902, 0, 1,
-1.581103, 1.529007, -1.151461, 1, 0.3294118, 0, 1,
-1.580902, -0.2247346, -2.689052, 1, 0.3372549, 0, 1,
-1.575371, -1.508271, -2.450463, 1, 0.3411765, 0, 1,
-1.568557, 0.3911938, -1.020241, 1, 0.3490196, 0, 1,
-1.561286, 0.8854698, -0.6051116, 1, 0.3529412, 0, 1,
-1.551185, -0.8164693, -1.210935, 1, 0.3607843, 0, 1,
-1.548503, -0.1742997, -3.651397, 1, 0.3647059, 0, 1,
-1.543971, 0.6180602, -2.135031, 1, 0.372549, 0, 1,
-1.54161, -0.4139909, -2.73353, 1, 0.3764706, 0, 1,
-1.53486, 0.5114636, -2.020042, 1, 0.3843137, 0, 1,
-1.524923, 1.809456, -1.473616, 1, 0.3882353, 0, 1,
-1.518186, 1.730772, -0.6966247, 1, 0.3960784, 0, 1,
-1.497318, -1.231559, -1.888257, 1, 0.4039216, 0, 1,
-1.497104, -1.050831, -2.672139, 1, 0.4078431, 0, 1,
-1.491117, -1.784387, -2.327137, 1, 0.4156863, 0, 1,
-1.48423, -0.5787256, -0.5205694, 1, 0.4196078, 0, 1,
-1.480016, 1.376097, -0.8041834, 1, 0.427451, 0, 1,
-1.459099, 0.602816, -0.7701988, 1, 0.4313726, 0, 1,
-1.458386, 1.818234, -0.3701918, 1, 0.4392157, 0, 1,
-1.426287, 0.3592865, -0.915818, 1, 0.4431373, 0, 1,
-1.423104, 0.1120779, -2.640928, 1, 0.4509804, 0, 1,
-1.422735, 0.8517202, 0.590423, 1, 0.454902, 0, 1,
-1.412176, 1.307075, -2.089186, 1, 0.4627451, 0, 1,
-1.411047, 0.1451985, -2.099492, 1, 0.4666667, 0, 1,
-1.387416, -1.285852, -1.305017, 1, 0.4745098, 0, 1,
-1.386536, 0.6777401, 0.309514, 1, 0.4784314, 0, 1,
-1.382831, -0.03112772, -2.627344, 1, 0.4862745, 0, 1,
-1.348917, -2.205625, 0.3575743, 1, 0.4901961, 0, 1,
-1.340601, 0.3227672, -2.638638, 1, 0.4980392, 0, 1,
-1.336435, -0.5830423, -1.067794, 1, 0.5058824, 0, 1,
-1.334486, -0.1310325, -1.507077, 1, 0.509804, 0, 1,
-1.326963, 1.052771, -1.629256, 1, 0.5176471, 0, 1,
-1.321414, 1.536143, -0.5777653, 1, 0.5215687, 0, 1,
-1.303681, -1.043569, 0.3760705, 1, 0.5294118, 0, 1,
-1.295966, 0.6394313, 0.6158224, 1, 0.5333334, 0, 1,
-1.284408, -1.49352, -0.7194701, 1, 0.5411765, 0, 1,
-1.284164, 2.203772, -1.550288, 1, 0.5450981, 0, 1,
-1.280844, -0.8953934, -2.161968, 1, 0.5529412, 0, 1,
-1.27727, 0.5904144, -0.9932347, 1, 0.5568628, 0, 1,
-1.275139, 0.2952324, -3.433883, 1, 0.5647059, 0, 1,
-1.272617, -0.3258509, -0.3881396, 1, 0.5686275, 0, 1,
-1.269986, -0.3656328, -2.065982, 1, 0.5764706, 0, 1,
-1.268905, 0.01975468, -1.939767, 1, 0.5803922, 0, 1,
-1.267042, 1.173985, -1.053867, 1, 0.5882353, 0, 1,
-1.256869, -0.2058781, -0.9844856, 1, 0.5921569, 0, 1,
-1.256193, -0.3599124, -1.90293, 1, 0.6, 0, 1,
-1.252752, -1.113853, -1.393899, 1, 0.6078432, 0, 1,
-1.239103, 2.283807, -1.873038, 1, 0.6117647, 0, 1,
-1.236176, 0.8791137, -0.6270555, 1, 0.6196079, 0, 1,
-1.226983, 0.01367707, -1.49953, 1, 0.6235294, 0, 1,
-1.225492, 0.2565676, -0.7721552, 1, 0.6313726, 0, 1,
-1.217992, 0.7660307, -1.768, 1, 0.6352941, 0, 1,
-1.215075, -1.561511, -3.40847, 1, 0.6431373, 0, 1,
-1.214394, -0.8174156, -2.206491, 1, 0.6470588, 0, 1,
-1.213112, -0.6731801, -3.177029, 1, 0.654902, 0, 1,
-1.209846, 0.1384152, -0.9130685, 1, 0.6588235, 0, 1,
-1.207797, 0.6959812, -1.190218, 1, 0.6666667, 0, 1,
-1.20531, -0.5649475, -3.927288, 1, 0.6705883, 0, 1,
-1.203416, 0.8659887, -0.1840707, 1, 0.6784314, 0, 1,
-1.188677, 0.6071345, -1.676616, 1, 0.682353, 0, 1,
-1.181448, 0.4358215, -0.1770918, 1, 0.6901961, 0, 1,
-1.178861, 1.15707, -0.9944627, 1, 0.6941177, 0, 1,
-1.178128, -0.1422128, -1.657205, 1, 0.7019608, 0, 1,
-1.17327, -1.693906, -2.258812, 1, 0.7098039, 0, 1,
-1.171358, -0.7669522, -1.925232, 1, 0.7137255, 0, 1,
-1.166313, 0.4265405, -0.4996501, 1, 0.7215686, 0, 1,
-1.162027, -1.100192, -2.315151, 1, 0.7254902, 0, 1,
-1.158939, -0.3911582, -1.840998, 1, 0.7333333, 0, 1,
-1.153766, 0.32827, -0.6651812, 1, 0.7372549, 0, 1,
-1.147297, -0.1906887, -2.220372, 1, 0.7450981, 0, 1,
-1.146362, 0.7863396, -1.290668, 1, 0.7490196, 0, 1,
-1.146337, 1.301303, -0.2629618, 1, 0.7568628, 0, 1,
-1.143643, 0.5141302, -2.241954, 1, 0.7607843, 0, 1,
-1.143448, 0.4013449, -1.607097, 1, 0.7686275, 0, 1,
-1.137736, 1.109363, -1.049473, 1, 0.772549, 0, 1,
-1.132491, 1.114894, -0.8114795, 1, 0.7803922, 0, 1,
-1.130175, 0.07048801, -0.8831817, 1, 0.7843137, 0, 1,
-1.129264, 1.309633, -1.965582, 1, 0.7921569, 0, 1,
-1.122049, -0.4195765, -1.66516, 1, 0.7960784, 0, 1,
-1.118383, -0.5942141, -3.377602, 1, 0.8039216, 0, 1,
-1.118138, 0.1478666, -0.7163162, 1, 0.8117647, 0, 1,
-1.113107, -0.5899011, -3.660901, 1, 0.8156863, 0, 1,
-1.109895, -1.15411, -1.642449, 1, 0.8235294, 0, 1,
-1.109404, 0.3958631, -0.2152948, 1, 0.827451, 0, 1,
-1.108503, 0.02137528, -0.9328408, 1, 0.8352941, 0, 1,
-1.099884, 0.0231353, -1.119398, 1, 0.8392157, 0, 1,
-1.096604, 0.7197183, -1.180397, 1, 0.8470588, 0, 1,
-1.091942, 0.1961281, -0.4077486, 1, 0.8509804, 0, 1,
-1.085966, -0.326963, -2.158655, 1, 0.8588235, 0, 1,
-1.083997, 1.820624, -0.5910159, 1, 0.8627451, 0, 1,
-1.080903, 2.027642, -1.263266, 1, 0.8705882, 0, 1,
-1.079245, 0.4027018, -1.386952, 1, 0.8745098, 0, 1,
-1.078843, -1.004937, -1.535434, 1, 0.8823529, 0, 1,
-1.066413, 0.6984524, -2.656307, 1, 0.8862745, 0, 1,
-1.062474, 0.7357835, -1.350245, 1, 0.8941177, 0, 1,
-1.062447, 2.437137, 1.311794, 1, 0.8980392, 0, 1,
-1.061989, 0.3695015, -2.430536, 1, 0.9058824, 0, 1,
-1.059011, 0.08137915, -3.652656, 1, 0.9137255, 0, 1,
-1.055943, -0.0297635, -1.527436, 1, 0.9176471, 0, 1,
-1.054901, -0.05482969, -1.737578, 1, 0.9254902, 0, 1,
-1.053638, 0.5282301, -1.171374, 1, 0.9294118, 0, 1,
-1.051848, 0.8794475, -0.7542608, 1, 0.9372549, 0, 1,
-1.050783, -0.6097606, -3.516556, 1, 0.9411765, 0, 1,
-1.049632, 0.9688015, -2.375822, 1, 0.9490196, 0, 1,
-1.041689, -0.9027867, -2.076309, 1, 0.9529412, 0, 1,
-1.040743, -0.2605489, -3.086026, 1, 0.9607843, 0, 1,
-1.039153, 0.7381208, -0.6683954, 1, 0.9647059, 0, 1,
-1.029725, 0.2005987, -1.589568, 1, 0.972549, 0, 1,
-1.025816, -0.6703444, -1.861158, 1, 0.9764706, 0, 1,
-1.023988, 1.061702, -0.6126108, 1, 0.9843137, 0, 1,
-1.011989, -0.6235068, -1.897082, 1, 0.9882353, 0, 1,
-1.011716, -0.3862143, -2.778393, 1, 0.9960784, 0, 1,
-1.010489, 0.9024741, -1.492238, 0.9960784, 1, 0, 1,
-1.004493, -0.5731906, -3.174145, 0.9921569, 1, 0, 1,
-0.9968209, 1.805358, 0.3865817, 0.9843137, 1, 0, 1,
-0.9958154, -0.3829657, -1.616135, 0.9803922, 1, 0, 1,
-0.9905567, -0.9494865, -2.07721, 0.972549, 1, 0, 1,
-0.9886877, 0.5921808, -0.5093521, 0.9686275, 1, 0, 1,
-0.9846579, 0.673841, -3.223201, 0.9607843, 1, 0, 1,
-0.9774756, -0.07886182, -1.708548, 0.9568627, 1, 0, 1,
-0.969119, 0.6854218, -2.493843, 0.9490196, 1, 0, 1,
-0.9622334, 0.5968989, -0.1434956, 0.945098, 1, 0, 1,
-0.9573386, 0.8586915, 0.1019434, 0.9372549, 1, 0, 1,
-0.954787, -0.4407898, -2.715679, 0.9333333, 1, 0, 1,
-0.9541887, 0.5676748, -2.005295, 0.9254902, 1, 0, 1,
-0.9471288, -0.8970583, -2.118691, 0.9215686, 1, 0, 1,
-0.9459144, 0.3036411, -0.6821916, 0.9137255, 1, 0, 1,
-0.942642, -0.5177782, -2.560239, 0.9098039, 1, 0, 1,
-0.9366621, -0.74366, -1.56426, 0.9019608, 1, 0, 1,
-0.931242, 0.5490599, -1.601116, 0.8941177, 1, 0, 1,
-0.9296182, -1.783459, -1.349475, 0.8901961, 1, 0, 1,
-0.9287127, 0.1127173, -2.462967, 0.8823529, 1, 0, 1,
-0.9283707, 0.4428942, -1.253379, 0.8784314, 1, 0, 1,
-0.9259836, -1.528621, -2.527851, 0.8705882, 1, 0, 1,
-0.9244445, -0.7336552, -3.391933, 0.8666667, 1, 0, 1,
-0.9243326, -0.8049551, -1.751601, 0.8588235, 1, 0, 1,
-0.9155833, -0.1995514, -2.725783, 0.854902, 1, 0, 1,
-0.9064223, 0.3681638, -2.081507, 0.8470588, 1, 0, 1,
-0.9062412, 2.116756, 0.6684868, 0.8431373, 1, 0, 1,
-0.9047222, 0.8188707, 0.5899843, 0.8352941, 1, 0, 1,
-0.8945681, 1.34255, 0.9732687, 0.8313726, 1, 0, 1,
-0.8941434, -0.7623405, -1.93099, 0.8235294, 1, 0, 1,
-0.8883596, -0.03987957, -0.09606768, 0.8196079, 1, 0, 1,
-0.8859833, -0.4347468, -2.740979, 0.8117647, 1, 0, 1,
-0.8824833, -0.7484088, -2.241374, 0.8078431, 1, 0, 1,
-0.8820831, 0.550445, -0.7060679, 0.8, 1, 0, 1,
-0.8782949, -0.1851859, -0.6600947, 0.7921569, 1, 0, 1,
-0.8749686, -0.4369724, -3.044531, 0.7882353, 1, 0, 1,
-0.8704899, 1.420587, -1.346243, 0.7803922, 1, 0, 1,
-0.8653506, -1.128808, -1.646143, 0.7764706, 1, 0, 1,
-0.8651257, 0.3292996, -2.027736, 0.7686275, 1, 0, 1,
-0.8639381, 0.8446051, -0.6497784, 0.7647059, 1, 0, 1,
-0.8617163, 1.741102, 0.3739232, 0.7568628, 1, 0, 1,
-0.8585997, 0.1398446, -2.075472, 0.7529412, 1, 0, 1,
-0.8568512, 0.9435382, -0.4133824, 0.7450981, 1, 0, 1,
-0.8506362, 0.7332646, -1.066889, 0.7411765, 1, 0, 1,
-0.8465769, -0.9986633, -0.9785494, 0.7333333, 1, 0, 1,
-0.8439512, 0.4267071, 0.1745905, 0.7294118, 1, 0, 1,
-0.8395594, -1.50967, -4.323035, 0.7215686, 1, 0, 1,
-0.8385669, 0.624108, -1.182463, 0.7176471, 1, 0, 1,
-0.83802, 1.475076, -0.086203, 0.7098039, 1, 0, 1,
-0.8313925, -1.258493, -3.016296, 0.7058824, 1, 0, 1,
-0.8304152, -0.2662235, -0.07172293, 0.6980392, 1, 0, 1,
-0.8128976, 2.333437, -0.2290758, 0.6901961, 1, 0, 1,
-0.8117352, -1.15061, -2.88538, 0.6862745, 1, 0, 1,
-0.8114712, 1.532161, -0.1851974, 0.6784314, 1, 0, 1,
-0.8056536, -0.34316, -1.455772, 0.6745098, 1, 0, 1,
-0.804487, -1.239397, -4.081428, 0.6666667, 1, 0, 1,
-0.7994107, -0.6617231, -1.342628, 0.6627451, 1, 0, 1,
-0.7959626, -1.370948, -1.255159, 0.654902, 1, 0, 1,
-0.7926312, -0.1148671, -1.904809, 0.6509804, 1, 0, 1,
-0.7901632, 0.3532546, -0.9037073, 0.6431373, 1, 0, 1,
-0.7890726, -0.5921153, -2.382416, 0.6392157, 1, 0, 1,
-0.7873202, -1.047734, -1.804982, 0.6313726, 1, 0, 1,
-0.7859858, -0.3620623, -2.326166, 0.627451, 1, 0, 1,
-0.7817884, -1.989971, -3.863959, 0.6196079, 1, 0, 1,
-0.7725551, 0.2132121, -0.7749984, 0.6156863, 1, 0, 1,
-0.7633258, 0.4734259, -1.971463, 0.6078432, 1, 0, 1,
-0.7631326, -1.601311, -2.339391, 0.6039216, 1, 0, 1,
-0.7608735, 2.010962, -1.527753, 0.5960785, 1, 0, 1,
-0.7549126, -1.411772, -2.119621, 0.5882353, 1, 0, 1,
-0.7522636, 0.7205678, -1.273107, 0.5843138, 1, 0, 1,
-0.7472243, -1.321767, -3.436849, 0.5764706, 1, 0, 1,
-0.7444252, -0.8482344, -1.531586, 0.572549, 1, 0, 1,
-0.7420456, -0.9503182, -2.287608, 0.5647059, 1, 0, 1,
-0.7401198, 0.1714219, -1.338219, 0.5607843, 1, 0, 1,
-0.7349538, -0.09141033, 0.03994516, 0.5529412, 1, 0, 1,
-0.7345231, 0.5382659, -0.4976173, 0.5490196, 1, 0, 1,
-0.7297541, -1.366264, -2.241601, 0.5411765, 1, 0, 1,
-0.7282667, 0.4233809, -0.4502387, 0.5372549, 1, 0, 1,
-0.7277485, 0.4439887, -0.3559819, 0.5294118, 1, 0, 1,
-0.7262585, 0.2829118, -1.574371, 0.5254902, 1, 0, 1,
-0.7251707, -2.255888, -2.164448, 0.5176471, 1, 0, 1,
-0.7242392, -1.48599, -1.523256, 0.5137255, 1, 0, 1,
-0.7241504, -0.3105998, -0.3452643, 0.5058824, 1, 0, 1,
-0.7207354, 0.6337478, -0.3057817, 0.5019608, 1, 0, 1,
-0.7181651, -0.4766873, -4.099746, 0.4941176, 1, 0, 1,
-0.7165374, -0.3770223, -3.67864, 0.4862745, 1, 0, 1,
-0.7063158, 0.3795927, -0.5179187, 0.4823529, 1, 0, 1,
-0.7041883, 1.454477, -0.8720909, 0.4745098, 1, 0, 1,
-0.7020586, -1.278473, -3.783853, 0.4705882, 1, 0, 1,
-0.7014299, -1.059509, -3.131082, 0.4627451, 1, 0, 1,
-0.6967278, 1.260898, -0.4386167, 0.4588235, 1, 0, 1,
-0.6951932, -0.7782549, -1.633646, 0.4509804, 1, 0, 1,
-0.6943459, 0.5876409, -1.182572, 0.4470588, 1, 0, 1,
-0.6939668, 1.527628, -2.189352, 0.4392157, 1, 0, 1,
-0.6770746, -0.5081121, -1.231415, 0.4352941, 1, 0, 1,
-0.6691982, 1.078542, -0.02455801, 0.427451, 1, 0, 1,
-0.6691529, -0.2295083, -1.254781, 0.4235294, 1, 0, 1,
-0.6684305, 2.579983, 1.733226, 0.4156863, 1, 0, 1,
-0.6678278, -0.1840858, -2.625952, 0.4117647, 1, 0, 1,
-0.6645079, -0.6749394, -1.898481, 0.4039216, 1, 0, 1,
-0.6568542, 0.9867321, -1.388943, 0.3960784, 1, 0, 1,
-0.6502208, 1.798467, -0.7624385, 0.3921569, 1, 0, 1,
-0.6496509, -0.5439354, -2.408577, 0.3843137, 1, 0, 1,
-0.6484149, 0.6063584, -1.24123, 0.3803922, 1, 0, 1,
-0.6476532, -0.03273657, -1.593911, 0.372549, 1, 0, 1,
-0.6473047, 0.122295, -1.501631, 0.3686275, 1, 0, 1,
-0.6459342, -0.03763826, -2.154067, 0.3607843, 1, 0, 1,
-0.6450437, 0.1550924, -2.168141, 0.3568628, 1, 0, 1,
-0.642619, 0.9897897, 1.132466, 0.3490196, 1, 0, 1,
-0.6402802, 0.01076584, -2.298455, 0.345098, 1, 0, 1,
-0.6376709, 0.4542439, -1.831396, 0.3372549, 1, 0, 1,
-0.6363127, -0.3027222, -2.679707, 0.3333333, 1, 0, 1,
-0.6311515, 0.8179018, 0.2926229, 0.3254902, 1, 0, 1,
-0.6290097, 0.8590529, -1.175855, 0.3215686, 1, 0, 1,
-0.6267698, -0.3403865, -2.314384, 0.3137255, 1, 0, 1,
-0.6227476, 0.9372504, -1.484846, 0.3098039, 1, 0, 1,
-0.6181459, 0.7556858, -0.4628867, 0.3019608, 1, 0, 1,
-0.6041128, -0.01190941, 0.7313693, 0.2941177, 1, 0, 1,
-0.5988892, 2.075436, 0.1889167, 0.2901961, 1, 0, 1,
-0.5921604, 1.201792, -2.370948, 0.282353, 1, 0, 1,
-0.5865848, -0.4155238, -0.9656712, 0.2784314, 1, 0, 1,
-0.5855134, 0.9434168, -0.2827581, 0.2705882, 1, 0, 1,
-0.5854251, -0.4782495, -3.500743, 0.2666667, 1, 0, 1,
-0.5829183, 1.53417, 0.01458643, 0.2588235, 1, 0, 1,
-0.5827568, -0.0186307, -1.42762, 0.254902, 1, 0, 1,
-0.5784478, -0.6574869, -3.003594, 0.2470588, 1, 0, 1,
-0.5770005, -1.210039, -3.980992, 0.2431373, 1, 0, 1,
-0.5769425, 0.7858512, -1.686305, 0.2352941, 1, 0, 1,
-0.5759227, 0.1728818, -1.114266, 0.2313726, 1, 0, 1,
-0.5726569, 0.4435964, -1.039074, 0.2235294, 1, 0, 1,
-0.5707611, 0.3177584, -1.288786, 0.2196078, 1, 0, 1,
-0.5707496, 0.6804596, -0.8526353, 0.2117647, 1, 0, 1,
-0.5674039, -0.4188271, -2.584568, 0.2078431, 1, 0, 1,
-0.5624585, 2.41987, 1.658589, 0.2, 1, 0, 1,
-0.5606467, -1.053573, -0.8866155, 0.1921569, 1, 0, 1,
-0.5563576, 0.6623054, -0.8886471, 0.1882353, 1, 0, 1,
-0.5554413, -0.5449938, -2.087307, 0.1803922, 1, 0, 1,
-0.5525008, -0.4997073, -3.26172, 0.1764706, 1, 0, 1,
-0.5443817, 1.983037, -0.3785598, 0.1686275, 1, 0, 1,
-0.5438364, -0.1929601, -2.397281, 0.1647059, 1, 0, 1,
-0.5256361, -0.8308739, -1.269437, 0.1568628, 1, 0, 1,
-0.5227208, -0.6170846, -2.108175, 0.1529412, 1, 0, 1,
-0.5224282, -0.7295237, -3.459393, 0.145098, 1, 0, 1,
-0.5133039, 1.099353, -1.420683, 0.1411765, 1, 0, 1,
-0.5106202, 0.9271129, -0.6764984, 0.1333333, 1, 0, 1,
-0.5090935, 0.7297975, -1.644281, 0.1294118, 1, 0, 1,
-0.5025904, -1.513289, -2.506466, 0.1215686, 1, 0, 1,
-0.5000815, 0.614458, 0.4607534, 0.1176471, 1, 0, 1,
-0.4983965, 0.6368668, -0.8897616, 0.1098039, 1, 0, 1,
-0.4981215, 1.596987, -0.002511049, 0.1058824, 1, 0, 1,
-0.4901412, 1.607136, -0.9629905, 0.09803922, 1, 0, 1,
-0.4898537, 0.7871113, -0.5643645, 0.09019608, 1, 0, 1,
-0.4897193, -0.626876, -2.813015, 0.08627451, 1, 0, 1,
-0.4875033, 1.065239, -0.3727425, 0.07843138, 1, 0, 1,
-0.4846239, 0.3402897, -0.719453, 0.07450981, 1, 0, 1,
-0.4845195, -0.4775749, -1.527057, 0.06666667, 1, 0, 1,
-0.4838211, -1.870464, -2.854039, 0.0627451, 1, 0, 1,
-0.4826427, -0.9951982, -1.93853, 0.05490196, 1, 0, 1,
-0.4735015, 0.6036662, -1.466449, 0.05098039, 1, 0, 1,
-0.4723114, -1.631395, -2.728141, 0.04313726, 1, 0, 1,
-0.4722476, 0.4739944, 0.6127107, 0.03921569, 1, 0, 1,
-0.4685667, -1.469741, -3.542056, 0.03137255, 1, 0, 1,
-0.468504, 0.03077627, -2.464953, 0.02745098, 1, 0, 1,
-0.4654165, -0.7981121, -2.046854, 0.01960784, 1, 0, 1,
-0.4618801, 1.084144, 1.530409, 0.01568628, 1, 0, 1,
-0.4591813, -0.4819658, -4.492207, 0.007843138, 1, 0, 1,
-0.4528136, -1.078985, -4.586198, 0.003921569, 1, 0, 1,
-0.4514171, 0.1627768, -2.280751, 0, 1, 0.003921569, 1,
-0.4482981, 0.158824, -1.266261, 0, 1, 0.01176471, 1,
-0.4474963, -1.478932, -2.968266, 0, 1, 0.01568628, 1,
-0.4470347, 1.557353, -1.27397, 0, 1, 0.02352941, 1,
-0.4467039, 0.1222619, -1.03391, 0, 1, 0.02745098, 1,
-0.4461462, -0.74445, -3.180173, 0, 1, 0.03529412, 1,
-0.4450217, 0.5360824, -0.9725478, 0, 1, 0.03921569, 1,
-0.442185, 2.080772, -0.97925, 0, 1, 0.04705882, 1,
-0.4411303, 0.239697, -2.323195, 0, 1, 0.05098039, 1,
-0.4343433, 0.8048131, -0.4083264, 0, 1, 0.05882353, 1,
-0.4280118, -0.3765843, -1.920714, 0, 1, 0.0627451, 1,
-0.426034, -0.6347646, -1.686748, 0, 1, 0.07058824, 1,
-0.4235574, -0.6724979, -1.686543, 0, 1, 0.07450981, 1,
-0.4234425, 0.9210492, -2.477693, 0, 1, 0.08235294, 1,
-0.4220644, 1.012694, -0.8573527, 0, 1, 0.08627451, 1,
-0.4208252, -0.08481133, -2.731167, 0, 1, 0.09411765, 1,
-0.4196423, -1.219161, -1.68382, 0, 1, 0.1019608, 1,
-0.4180994, -1.496862, -2.847658, 0, 1, 0.1058824, 1,
-0.4123985, -0.558533, -1.850141, 0, 1, 0.1137255, 1,
-0.405924, -1.241418, -1.619887, 0, 1, 0.1176471, 1,
-0.4055898, -1.198793, -2.983248, 0, 1, 0.1254902, 1,
-0.3998958, 0.9365435, -1.988384, 0, 1, 0.1294118, 1,
-0.3978422, 0.6726278, -0.2623318, 0, 1, 0.1372549, 1,
-0.3955154, 0.7744607, 0.6607877, 0, 1, 0.1411765, 1,
-0.3941737, 0.5989498, -1.42791, 0, 1, 0.1490196, 1,
-0.3933773, 0.6356838, -1.528661, 0, 1, 0.1529412, 1,
-0.3840258, 0.4958423, -0.6703651, 0, 1, 0.1607843, 1,
-0.3808822, -2.74509, -3.695501, 0, 1, 0.1647059, 1,
-0.3804837, -1.317588, -1.699635, 0, 1, 0.172549, 1,
-0.3722647, 0.8516123, 1.314104, 0, 1, 0.1764706, 1,
-0.3665265, -1.502704, -2.420787, 0, 1, 0.1843137, 1,
-0.3638863, 1.492392, -0.4898293, 0, 1, 0.1882353, 1,
-0.3618986, -0.5497549, -1.578158, 0, 1, 0.1960784, 1,
-0.3617126, 0.8755516, 0.9227406, 0, 1, 0.2039216, 1,
-0.3613967, 0.8952999, -0.9176897, 0, 1, 0.2078431, 1,
-0.3612606, 1.101068, 1.184589, 0, 1, 0.2156863, 1,
-0.3604077, 0.4285798, 0.9415885, 0, 1, 0.2196078, 1,
-0.3594416, 0.1295864, -0.621882, 0, 1, 0.227451, 1,
-0.3588842, -0.4415937, -4.279162, 0, 1, 0.2313726, 1,
-0.357546, 1.489415, -0.8267846, 0, 1, 0.2392157, 1,
-0.3555883, -2.606448, -3.779628, 0, 1, 0.2431373, 1,
-0.3530833, 1.023586, 0.4866961, 0, 1, 0.2509804, 1,
-0.352273, -0.6970184, -1.947587, 0, 1, 0.254902, 1,
-0.3517887, -0.3194961, -1.469427, 0, 1, 0.2627451, 1,
-0.3470735, 1.044361, -0.4996629, 0, 1, 0.2666667, 1,
-0.344341, -1.528088, -3.228924, 0, 1, 0.2745098, 1,
-0.343979, 0.9747759, -0.1345119, 0, 1, 0.2784314, 1,
-0.3436111, 0.4887585, 0.6843162, 0, 1, 0.2862745, 1,
-0.3403438, 0.626633, 0.2570638, 0, 1, 0.2901961, 1,
-0.335969, -0.377055, -3.276508, 0, 1, 0.2980392, 1,
-0.3323796, -1.687693, -1.623977, 0, 1, 0.3058824, 1,
-0.3272985, 0.4285994, -1.604901, 0, 1, 0.3098039, 1,
-0.3245376, 0.59662, 0.5006353, 0, 1, 0.3176471, 1,
-0.3147095, 1.734408, -2.541475, 0, 1, 0.3215686, 1,
-0.3139766, 1.251982, 0.4436406, 0, 1, 0.3294118, 1,
-0.313114, -0.4004278, -1.286954, 0, 1, 0.3333333, 1,
-0.3080875, 0.5967391, -0.1602046, 0, 1, 0.3411765, 1,
-0.3063281, -0.794242, -3.878583, 0, 1, 0.345098, 1,
-0.3026018, 1.818052, 1.187808, 0, 1, 0.3529412, 1,
-0.2971671, 0.5016981, -2.618437, 0, 1, 0.3568628, 1,
-0.296976, -0.6111797, -3.611588, 0, 1, 0.3647059, 1,
-0.2966839, 0.0172016, -1.491374, 0, 1, 0.3686275, 1,
-0.2962784, 0.1445942, -0.6694526, 0, 1, 0.3764706, 1,
-0.2959003, 1.292569, 1.375918, 0, 1, 0.3803922, 1,
-0.2892121, 1.305663, 0.8763167, 0, 1, 0.3882353, 1,
-0.2866487, 0.5886741, -1.93823, 0, 1, 0.3921569, 1,
-0.2814446, 0.5951599, 1.131539, 0, 1, 0.4, 1,
-0.2808372, -0.000216512, -1.438676, 0, 1, 0.4078431, 1,
-0.2774827, 1.818149, -1.300574, 0, 1, 0.4117647, 1,
-0.2773166, -0.9759403, -2.854964, 0, 1, 0.4196078, 1,
-0.2754709, 0.7396382, 0.6957721, 0, 1, 0.4235294, 1,
-0.2749669, -1.059006, -4.303946, 0, 1, 0.4313726, 1,
-0.2741207, 1.03111, -0.2931357, 0, 1, 0.4352941, 1,
-0.2740935, 1.326009, -0.704673, 0, 1, 0.4431373, 1,
-0.2718236, -0.4054668, -3.264672, 0, 1, 0.4470588, 1,
-0.2705153, -0.9978005, -1.202713, 0, 1, 0.454902, 1,
-0.2702045, -0.7995905, -2.202561, 0, 1, 0.4588235, 1,
-0.2699932, -0.5220473, -1.992691, 0, 1, 0.4666667, 1,
-0.2697952, 0.4615881, -0.0555986, 0, 1, 0.4705882, 1,
-0.265274, -0.3433748, -0.8878856, 0, 1, 0.4784314, 1,
-0.2622429, 0.5445755, -0.2329905, 0, 1, 0.4823529, 1,
-0.2539668, -1.070298, -0.4704169, 0, 1, 0.4901961, 1,
-0.2524898, 1.327455, -1.16627, 0, 1, 0.4941176, 1,
-0.2511139, 0.7181845, -1.372535, 0, 1, 0.5019608, 1,
-0.2500355, -1.238782, -3.316411, 0, 1, 0.509804, 1,
-0.2495393, -0.5316795, -4.105227, 0, 1, 0.5137255, 1,
-0.2485441, -0.6554233, -2.636554, 0, 1, 0.5215687, 1,
-0.2466026, -0.3389021, -3.247678, 0, 1, 0.5254902, 1,
-0.2454373, -0.5695866, -2.479695, 0, 1, 0.5333334, 1,
-0.2453311, 1.991819, -0.5261565, 0, 1, 0.5372549, 1,
-0.2430916, -0.8455957, -2.348315, 0, 1, 0.5450981, 1,
-0.2429853, -0.423042, -1.485327, 0, 1, 0.5490196, 1,
-0.2424727, -1.955574, -2.851465, 0, 1, 0.5568628, 1,
-0.2347114, -0.1051066, -0.7758371, 0, 1, 0.5607843, 1,
-0.2342379, 0.01763248, -1.42067, 0, 1, 0.5686275, 1,
-0.2339451, 1.028675, -0.4470466, 0, 1, 0.572549, 1,
-0.2332449, 2.525895, 0.9747735, 0, 1, 0.5803922, 1,
-0.2296335, 0.3628827, -1.038938, 0, 1, 0.5843138, 1,
-0.2267158, -1.580024, -3.937411, 0, 1, 0.5921569, 1,
-0.226258, 1.680703, -1.808202, 0, 1, 0.5960785, 1,
-0.2226736, 0.2369769, 0.6674789, 0, 1, 0.6039216, 1,
-0.2216771, 1.191116, 0.1591628, 0, 1, 0.6117647, 1,
-0.2189827, -0.728802, -2.335722, 0, 1, 0.6156863, 1,
-0.218166, 0.6479398, 0.5942346, 0, 1, 0.6235294, 1,
-0.2163226, -0.7734371, -2.598387, 0, 1, 0.627451, 1,
-0.211997, -0.001243325, -3.372685, 0, 1, 0.6352941, 1,
-0.2050727, -0.2492746, -4.451928, 0, 1, 0.6392157, 1,
-0.20371, -1.065783, -2.347885, 0, 1, 0.6470588, 1,
-0.2010054, -0.1779291, -2.184832, 0, 1, 0.6509804, 1,
-0.1991452, 0.2877184, -0.507834, 0, 1, 0.6588235, 1,
-0.1952791, 0.008289889, -1.140766, 0, 1, 0.6627451, 1,
-0.193064, 0.1260921, 0.3925769, 0, 1, 0.6705883, 1,
-0.1920442, -2.375475, -2.655787, 0, 1, 0.6745098, 1,
-0.1897009, -0.4880387, -2.963941, 0, 1, 0.682353, 1,
-0.1884686, 1.186814, 1.564433, 0, 1, 0.6862745, 1,
-0.1875431, -0.2309648, -1.7385, 0, 1, 0.6941177, 1,
-0.1868226, 0.5037194, -0.2851519, 0, 1, 0.7019608, 1,
-0.1852516, -0.4462719, -3.549129, 0, 1, 0.7058824, 1,
-0.1838834, 1.563243, -1.170959, 0, 1, 0.7137255, 1,
-0.1819609, -0.5636842, -3.180659, 0, 1, 0.7176471, 1,
-0.1801122, 0.4973947, -1.404015, 0, 1, 0.7254902, 1,
-0.1734707, -0.5382931, -4.150645, 0, 1, 0.7294118, 1,
-0.1717549, -0.1405959, -0.02416197, 0, 1, 0.7372549, 1,
-0.1685616, -0.6020294, -1.271027, 0, 1, 0.7411765, 1,
-0.1650018, -1.93469, -2.909535, 0, 1, 0.7490196, 1,
-0.1634797, -0.657222, -2.903758, 0, 1, 0.7529412, 1,
-0.1624536, -0.5463978, -3.398062, 0, 1, 0.7607843, 1,
-0.1501566, -0.2981269, -1.689632, 0, 1, 0.7647059, 1,
-0.1420055, 1.311376, -0.4308674, 0, 1, 0.772549, 1,
-0.1417351, -0.07180553, -3.492394, 0, 1, 0.7764706, 1,
-0.1413664, -0.4818361, -3.808388, 0, 1, 0.7843137, 1,
-0.1397835, -0.05941185, -1.668143, 0, 1, 0.7882353, 1,
-0.135557, 0.6565709, -0.8143137, 0, 1, 0.7960784, 1,
-0.1287151, -1.791314, -5.239576, 0, 1, 0.8039216, 1,
-0.1258894, 1.205479, 1.110331, 0, 1, 0.8078431, 1,
-0.1192606, 0.3772779, 0.3228429, 0, 1, 0.8156863, 1,
-0.1165102, 2.225513, -0.398024, 0, 1, 0.8196079, 1,
-0.1159549, 1.269348, 2.218261, 0, 1, 0.827451, 1,
-0.1150151, 0.7063143, 0.8057495, 0, 1, 0.8313726, 1,
-0.1145081, 1.807471, 0.5552357, 0, 1, 0.8392157, 1,
-0.1076324, 0.8970872, -1.666677, 0, 1, 0.8431373, 1,
-0.1063358, -0.2417988, -1.475194, 0, 1, 0.8509804, 1,
-0.09985184, -2.348357, -1.364424, 0, 1, 0.854902, 1,
-0.09620752, -0.1704858, -2.813213, 0, 1, 0.8627451, 1,
-0.09540568, 0.01807116, -2.90148, 0, 1, 0.8666667, 1,
-0.09112501, 0.1194287, 0.2791414, 0, 1, 0.8745098, 1,
-0.08755415, 1.560441, 0.9897271, 0, 1, 0.8784314, 1,
-0.08708309, 0.9342859, 0.8025448, 0, 1, 0.8862745, 1,
-0.08610819, -0.4483616, -2.118757, 0, 1, 0.8901961, 1,
-0.08531617, -0.03027784, -1.63676, 0, 1, 0.8980392, 1,
-0.08179826, 0.3057127, -0.8953481, 0, 1, 0.9058824, 1,
-0.08080948, -1.2191, -1.817349, 0, 1, 0.9098039, 1,
-0.08008659, 1.117196, -2.079326, 0, 1, 0.9176471, 1,
-0.07456399, 0.8597248, -1.138106, 0, 1, 0.9215686, 1,
-0.07341921, 0.6970645, -0.7351781, 0, 1, 0.9294118, 1,
-0.06670974, 1.764962, 0.7153089, 0, 1, 0.9333333, 1,
-0.06635597, -1.347553, -2.717581, 0, 1, 0.9411765, 1,
-0.06230606, 0.3502438, -0.2846902, 0, 1, 0.945098, 1,
-0.06230149, 0.3264329, -0.01853562, 0, 1, 0.9529412, 1,
-0.05773006, -1.104727, -2.531489, 0, 1, 0.9568627, 1,
-0.0574451, -0.3764348, -2.237417, 0, 1, 0.9647059, 1,
-0.05461124, -0.907273, -3.359342, 0, 1, 0.9686275, 1,
-0.05374782, 0.3574525, -0.532062, 0, 1, 0.9764706, 1,
-0.05132976, 1.012467, -1.473742, 0, 1, 0.9803922, 1,
-0.05110131, -0.02999103, -1.4423, 0, 1, 0.9882353, 1,
-0.04695659, -0.7814914, -4.041111, 0, 1, 0.9921569, 1,
-0.04581895, -0.9734703, -3.123276, 0, 1, 1, 1,
-0.04546562, 1.37233, 1.021901, 0, 0.9921569, 1, 1,
-0.04541283, 1.293503, -1.028422, 0, 0.9882353, 1, 1,
-0.04498868, 0.1854088, 0.1639754, 0, 0.9803922, 1, 1,
-0.04240736, 0.5807564, 0.367803, 0, 0.9764706, 1, 1,
-0.04227162, -0.9094929, -2.382187, 0, 0.9686275, 1, 1,
-0.04017949, 0.04516358, -1.268186, 0, 0.9647059, 1, 1,
-0.0387134, 0.7370815, 0.4906291, 0, 0.9568627, 1, 1,
-0.03786158, -1.724929, -1.703328, 0, 0.9529412, 1, 1,
-0.03663263, 0.4498425, -1.301806, 0, 0.945098, 1, 1,
-0.03595448, -0.2918191, -3.320637, 0, 0.9411765, 1, 1,
-0.03477626, 0.9565992, -1.00374, 0, 0.9333333, 1, 1,
-0.03138907, -1.275246, -2.698498, 0, 0.9294118, 1, 1,
-0.02924449, 0.5554339, -0.2976453, 0, 0.9215686, 1, 1,
-0.02774626, 0.147676, 0.3856219, 0, 0.9176471, 1, 1,
-0.02705381, -1.515204, -4.471918, 0, 0.9098039, 1, 1,
-0.02556171, -0.5564328, -5.491827, 0, 0.9058824, 1, 1,
-0.02437594, 1.127855, 0.2039152, 0, 0.8980392, 1, 1,
-0.02239036, -1.083958, -2.139941, 0, 0.8901961, 1, 1,
-0.02211414, 1.439082, -0.5211481, 0, 0.8862745, 1, 1,
-0.01930261, -0.3703458, -0.8448608, 0, 0.8784314, 1, 1,
-0.01458817, -0.923492, -1.156136, 0, 0.8745098, 1, 1,
-0.01418777, -1.05639, -2.324312, 0, 0.8666667, 1, 1,
-0.0137945, 1.615554, 0.293672, 0, 0.8627451, 1, 1,
-0.01322485, 1.072126, -1.509862, 0, 0.854902, 1, 1,
-0.007775412, 0.4635072, -0.9077155, 0, 0.8509804, 1, 1,
-0.007143525, 0.3017431, 0.452606, 0, 0.8431373, 1, 1,
-0.004575101, 0.01532781, -0.08470314, 0, 0.8392157, 1, 1,
-0.001908194, 2.116474, -0.1465963, 0, 0.8313726, 1, 1,
0.001444127, -0.2497611, 4.108117, 0, 0.827451, 1, 1,
0.003486726, -0.5377658, 3.923558, 0, 0.8196079, 1, 1,
0.01067596, -0.6506994, 3.604101, 0, 0.8156863, 1, 1,
0.01235543, 0.5021166, -0.4781087, 0, 0.8078431, 1, 1,
0.01992982, -0.6963324, 3.927954, 0, 0.8039216, 1, 1,
0.02460414, 1.536139, 0.04204226, 0, 0.7960784, 1, 1,
0.02558485, 1.093109, -0.5097463, 0, 0.7882353, 1, 1,
0.02656705, 0.1500694, -1.216562, 0, 0.7843137, 1, 1,
0.03595856, 1.233206, -1.458291, 0, 0.7764706, 1, 1,
0.0399703, 0.2595489, 2.364503, 0, 0.772549, 1, 1,
0.04065665, 0.4482483, 0.6289226, 0, 0.7647059, 1, 1,
0.04310219, -1.723986, 3.759678, 0, 0.7607843, 1, 1,
0.04574636, 0.6609148, 0.8132377, 0, 0.7529412, 1, 1,
0.04955954, -1.776562, 2.405289, 0, 0.7490196, 1, 1,
0.05129663, -0.4318906, 3.651788, 0, 0.7411765, 1, 1,
0.05328497, -1.531709, 2.743106, 0, 0.7372549, 1, 1,
0.05685442, -0.4696947, 3.778459, 0, 0.7294118, 1, 1,
0.05771697, -0.5058168, 3.232648, 0, 0.7254902, 1, 1,
0.05848698, 0.09237536, 2.138556, 0, 0.7176471, 1, 1,
0.0617579, -0.5030555, 1.600462, 0, 0.7137255, 1, 1,
0.06408093, -0.7148668, 1.056635, 0, 0.7058824, 1, 1,
0.07889054, 1.714164, -0.6321931, 0, 0.6980392, 1, 1,
0.08343721, -0.9659085, 2.585022, 0, 0.6941177, 1, 1,
0.08547167, 1.094941, 0.1371614, 0, 0.6862745, 1, 1,
0.08982319, 0.2989733, 1.485443, 0, 0.682353, 1, 1,
0.09499019, -1.705139, 4.325308, 0, 0.6745098, 1, 1,
0.09690946, -1.276884, 3.667577, 0, 0.6705883, 1, 1,
0.1056458, 0.3636049, -0.8170453, 0, 0.6627451, 1, 1,
0.1075676, 1.252403, 0.5513124, 0, 0.6588235, 1, 1,
0.1088868, -0.6830946, 2.159085, 0, 0.6509804, 1, 1,
0.1123313, -1.159122, 1.229366, 0, 0.6470588, 1, 1,
0.1159034, 0.5278203, -1.789662, 0, 0.6392157, 1, 1,
0.1177419, -2.071758, 4.524319, 0, 0.6352941, 1, 1,
0.1189297, 0.5802726, 1.016688, 0, 0.627451, 1, 1,
0.1215911, 1.213199, -0.4545397, 0, 0.6235294, 1, 1,
0.1249087, 0.5900769, -0.2028636, 0, 0.6156863, 1, 1,
0.1255106, -0.8893271, 1.635659, 0, 0.6117647, 1, 1,
0.1370461, 0.4847984, 1.684004, 0, 0.6039216, 1, 1,
0.1388685, -0.6515601, 3.082554, 0, 0.5960785, 1, 1,
0.1405464, -0.3247321, 1.498245, 0, 0.5921569, 1, 1,
0.1418837, 1.785837, 1.511333, 0, 0.5843138, 1, 1,
0.1455777, 0.2211526, 0.3108309, 0, 0.5803922, 1, 1,
0.1496202, 1.745725, 1.382457, 0, 0.572549, 1, 1,
0.1502807, -0.4133596, 2.366586, 0, 0.5686275, 1, 1,
0.1527447, -1.358529, 1.889824, 0, 0.5607843, 1, 1,
0.1536832, -1.344517, 1.997231, 0, 0.5568628, 1, 1,
0.1537327, -1.791135, 3.45456, 0, 0.5490196, 1, 1,
0.1559156, -1.361107, 3.15477, 0, 0.5450981, 1, 1,
0.1585953, 0.8080696, 0.1259455, 0, 0.5372549, 1, 1,
0.1613064, -1.055833, 3.881101, 0, 0.5333334, 1, 1,
0.1638257, -1.541729, 3.116398, 0, 0.5254902, 1, 1,
0.1644347, -0.1403174, 2.827124, 0, 0.5215687, 1, 1,
0.1664114, -0.3500649, 3.44489, 0, 0.5137255, 1, 1,
0.1674115, 0.1295637, 0.9921854, 0, 0.509804, 1, 1,
0.169329, 0.4342313, 0.2548842, 0, 0.5019608, 1, 1,
0.1711051, -1.398611, 3.306004, 0, 0.4941176, 1, 1,
0.1750378, -1.479161, 3.876841, 0, 0.4901961, 1, 1,
0.1751826, -0.6476151, 3.224862, 0, 0.4823529, 1, 1,
0.1834989, -1.084228, 2.240788, 0, 0.4784314, 1, 1,
0.1864713, -0.2498581, 1.939088, 0, 0.4705882, 1, 1,
0.18871, -0.487189, 2.779263, 0, 0.4666667, 1, 1,
0.193107, 0.06315815, 0.9401804, 0, 0.4588235, 1, 1,
0.1968739, -0.7183887, 2.288096, 0, 0.454902, 1, 1,
0.1969359, 0.04450589, 1.892847, 0, 0.4470588, 1, 1,
0.198337, 0.5923147, 0.744538, 0, 0.4431373, 1, 1,
0.1996988, 0.9481096, 1.536752, 0, 0.4352941, 1, 1,
0.201248, -1.843289, 0.9371985, 0, 0.4313726, 1, 1,
0.2015718, 0.5240548, 0.5760399, 0, 0.4235294, 1, 1,
0.2016385, -0.339843, 3.464148, 0, 0.4196078, 1, 1,
0.2038813, -0.4691268, 3.29115, 0, 0.4117647, 1, 1,
0.2068549, 0.4967456, 0.5814779, 0, 0.4078431, 1, 1,
0.2083585, 0.1789831, 3.160145, 0, 0.4, 1, 1,
0.209963, -0.3120778, 2.067799, 0, 0.3921569, 1, 1,
0.2150417, 1.158275, -0.8665096, 0, 0.3882353, 1, 1,
0.215733, 0.7192072, 0.1092182, 0, 0.3803922, 1, 1,
0.2201198, 0.7205228, -0.7399586, 0, 0.3764706, 1, 1,
0.2218791, 0.2339931, 1.618556, 0, 0.3686275, 1, 1,
0.2319681, -0.2539438, 2.423423, 0, 0.3647059, 1, 1,
0.2357455, -1.76178, 2.527076, 0, 0.3568628, 1, 1,
0.2387343, -2.962265, 2.41495, 0, 0.3529412, 1, 1,
0.240382, -1.357171, 2.411406, 0, 0.345098, 1, 1,
0.2420552, 1.402896, -0.6071146, 0, 0.3411765, 1, 1,
0.2443309, 0.4141158, 0.3896765, 0, 0.3333333, 1, 1,
0.2448282, -0.6470701, 3.454403, 0, 0.3294118, 1, 1,
0.2461057, 1.357149, 0.1735753, 0, 0.3215686, 1, 1,
0.2465338, -0.8941988, 4.210382, 0, 0.3176471, 1, 1,
0.2485948, -0.3718236, 3.376275, 0, 0.3098039, 1, 1,
0.2509497, 0.4034289, 0.8711292, 0, 0.3058824, 1, 1,
0.2530626, -0.3613554, 2.800237, 0, 0.2980392, 1, 1,
0.265013, -0.04224927, 1.355993, 0, 0.2901961, 1, 1,
0.2681006, 0.4218428, 0.1813195, 0, 0.2862745, 1, 1,
0.2696598, 0.09344608, 0.3875901, 0, 0.2784314, 1, 1,
0.2703999, 0.01204704, 2.43366, 0, 0.2745098, 1, 1,
0.2726312, 2.058745, -0.4913439, 0, 0.2666667, 1, 1,
0.282253, 0.4318079, -1.749866, 0, 0.2627451, 1, 1,
0.2896244, -1.340272, 2.264131, 0, 0.254902, 1, 1,
0.2916435, -0.4970457, 3.548656, 0, 0.2509804, 1, 1,
0.3042993, 0.8978265, 0.3698655, 0, 0.2431373, 1, 1,
0.3056356, -2.070062, 0.6171693, 0, 0.2392157, 1, 1,
0.3057892, 0.202782, 0.7704965, 0, 0.2313726, 1, 1,
0.3070265, 1.416456, -0.504616, 0, 0.227451, 1, 1,
0.307245, 0.8859729, 0.8602474, 0, 0.2196078, 1, 1,
0.3080801, -0.8692082, 1.7458, 0, 0.2156863, 1, 1,
0.3109097, 0.4525466, 1.894856, 0, 0.2078431, 1, 1,
0.3133217, 0.601283, 1.267025, 0, 0.2039216, 1, 1,
0.3152639, 0.6581271, 0.7733363, 0, 0.1960784, 1, 1,
0.3205006, 1.338209, -1.387175, 0, 0.1882353, 1, 1,
0.3230352, -0.5202434, 2.892484, 0, 0.1843137, 1, 1,
0.3236502, -0.09728108, 0.6854646, 0, 0.1764706, 1, 1,
0.3261357, -0.958923, 2.510667, 0, 0.172549, 1, 1,
0.3262558, -0.1501203, 4.719301, 0, 0.1647059, 1, 1,
0.3293768, 0.8213401, 0.1263158, 0, 0.1607843, 1, 1,
0.3298928, -0.3469745, 2.859621, 0, 0.1529412, 1, 1,
0.3339171, 0.9217265, -0.1913402, 0, 0.1490196, 1, 1,
0.3392811, -0.07835354, 1.723907, 0, 0.1411765, 1, 1,
0.3402106, -0.289019, 4.100004, 0, 0.1372549, 1, 1,
0.342462, -0.4375879, 3.074497, 0, 0.1294118, 1, 1,
0.3437933, 0.7074836, -0.3124711, 0, 0.1254902, 1, 1,
0.3472382, -0.6272559, 3.40687, 0, 0.1176471, 1, 1,
0.3473997, -0.02520083, 1.677622, 0, 0.1137255, 1, 1,
0.3544611, -0.2800491, 1.68474, 0, 0.1058824, 1, 1,
0.3576131, -0.5728348, 4.153625, 0, 0.09803922, 1, 1,
0.360473, 1.761194, 0.03346607, 0, 0.09411765, 1, 1,
0.3613365, -0.0775624, 2.901573, 0, 0.08627451, 1, 1,
0.3670985, 2.336392, 1.452374, 0, 0.08235294, 1, 1,
0.3686278, -1.72114, 3.07528, 0, 0.07450981, 1, 1,
0.3823846, -0.05738079, 2.201434, 0, 0.07058824, 1, 1,
0.3828083, 1.200437, 1.321084, 0, 0.0627451, 1, 1,
0.3834429, 0.6466129, -0.713933, 0, 0.05882353, 1, 1,
0.3878801, 0.4024018, 0.06169569, 0, 0.05098039, 1, 1,
0.3899238, -0.9468079, 2.696186, 0, 0.04705882, 1, 1,
0.3900025, -1.092326, 3.451071, 0, 0.03921569, 1, 1,
0.3936565, 0.383032, 0.06968009, 0, 0.03529412, 1, 1,
0.3946573, -0.3551886, 0.8544526, 0, 0.02745098, 1, 1,
0.3956586, -0.1362838, 2.419883, 0, 0.02352941, 1, 1,
0.3958801, 1.595753, 0.8345134, 0, 0.01568628, 1, 1,
0.3983245, 0.4958058, 0.8710247, 0, 0.01176471, 1, 1,
0.4015266, -0.7968005, 3.421566, 0, 0.003921569, 1, 1,
0.4032605, -0.5326883, 1.960786, 0.003921569, 0, 1, 1,
0.4093424, 0.3300119, 1.594507, 0.007843138, 0, 1, 1,
0.4096894, 2.744049, 2.215496, 0.01568628, 0, 1, 1,
0.4099446, -1.30959, 2.349124, 0.01960784, 0, 1, 1,
0.4116349, -2.166492, 2.539788, 0.02745098, 0, 1, 1,
0.4155394, 0.2357664, 0.0570248, 0.03137255, 0, 1, 1,
0.4185038, 0.5206702, 0.3976586, 0.03921569, 0, 1, 1,
0.4204609, -0.9473765, 1.881813, 0.04313726, 0, 1, 1,
0.4283411, 1.003343, -0.1041827, 0.05098039, 0, 1, 1,
0.4302733, -0.05134351, 2.654385, 0.05490196, 0, 1, 1,
0.434172, 0.9127313, 0.4953864, 0.0627451, 0, 1, 1,
0.434916, 0.003536057, 2.413227, 0.06666667, 0, 1, 1,
0.4387482, 1.363609, 1.486602, 0.07450981, 0, 1, 1,
0.4424948, -0.08059421, 0.8883722, 0.07843138, 0, 1, 1,
0.452678, 0.6204056, -0.2161333, 0.08627451, 0, 1, 1,
0.4548932, -0.552295, 2.970265, 0.09019608, 0, 1, 1,
0.4552233, 0.7134425, 0.01172581, 0.09803922, 0, 1, 1,
0.4586072, 0.3037426, 1.851177, 0.1058824, 0, 1, 1,
0.4588549, 0.7431339, 0.1736747, 0.1098039, 0, 1, 1,
0.4599877, -1.842362, 2.042402, 0.1176471, 0, 1, 1,
0.4604191, -0.6102179, 2.477564, 0.1215686, 0, 1, 1,
0.461726, -1.62463, 4.215234, 0.1294118, 0, 1, 1,
0.4680134, 1.256841, 1.120471, 0.1333333, 0, 1, 1,
0.4682824, -1.082888, 0.5434588, 0.1411765, 0, 1, 1,
0.4714922, 0.1833282, 0.8662639, 0.145098, 0, 1, 1,
0.4740281, 0.3025182, 2.499431, 0.1529412, 0, 1, 1,
0.4744017, 1.595965, 1.037259, 0.1568628, 0, 1, 1,
0.4782142, 0.192341, 0.7601797, 0.1647059, 0, 1, 1,
0.4822227, -0.1103012, 2.485069, 0.1686275, 0, 1, 1,
0.4857655, -0.6262743, 2.547216, 0.1764706, 0, 1, 1,
0.4869373, 0.137301, 1.307296, 0.1803922, 0, 1, 1,
0.4877941, -0.4173184, 2.154062, 0.1882353, 0, 1, 1,
0.4900493, -0.9866408, 2.600972, 0.1921569, 0, 1, 1,
0.4905873, -0.3774014, 2.038147, 0.2, 0, 1, 1,
0.4962673, 0.7475671, 0.899483, 0.2078431, 0, 1, 1,
0.5007412, -0.04914235, 2.933395, 0.2117647, 0, 1, 1,
0.5042176, 1.615359, -0.5079057, 0.2196078, 0, 1, 1,
0.5121081, 0.4787701, 1.645251, 0.2235294, 0, 1, 1,
0.5197261, 0.04037141, 1.145052, 0.2313726, 0, 1, 1,
0.5212758, 0.8458996, 0.06739543, 0.2352941, 0, 1, 1,
0.5242919, 0.8830764, -1.318894, 0.2431373, 0, 1, 1,
0.5275816, -1.277414, 4.261951, 0.2470588, 0, 1, 1,
0.5288081, -0.3993208, 1.749785, 0.254902, 0, 1, 1,
0.5295208, 0.3615545, 1.34757, 0.2588235, 0, 1, 1,
0.5331142, -0.08722907, 1.544241, 0.2666667, 0, 1, 1,
0.5457305, -0.5562721, 1.787552, 0.2705882, 0, 1, 1,
0.5493987, -0.1661683, 1.193589, 0.2784314, 0, 1, 1,
0.5526026, 0.2320334, 0.97518, 0.282353, 0, 1, 1,
0.5527113, -0.3841313, 2.218604, 0.2901961, 0, 1, 1,
0.5533647, 1.41653, 1.504259, 0.2941177, 0, 1, 1,
0.5541026, 0.4299456, 0.777651, 0.3019608, 0, 1, 1,
0.5552781, -1.490179, 1.339788, 0.3098039, 0, 1, 1,
0.5557568, -0.7309783, 2.742753, 0.3137255, 0, 1, 1,
0.5596623, -0.5387915, 1.152486, 0.3215686, 0, 1, 1,
0.5597137, 0.7798973, 2.428455, 0.3254902, 0, 1, 1,
0.5685879, 2.177119, -1.005471, 0.3333333, 0, 1, 1,
0.5712967, 1.170904, 0.03119582, 0.3372549, 0, 1, 1,
0.5715746, 1.202177, 0.2351229, 0.345098, 0, 1, 1,
0.571782, -0.4444923, 2.236357, 0.3490196, 0, 1, 1,
0.5748953, -0.2387742, 1.741042, 0.3568628, 0, 1, 1,
0.57542, 0.1989871, 2.083588, 0.3607843, 0, 1, 1,
0.5755894, -2.081025, 2.278967, 0.3686275, 0, 1, 1,
0.5765817, -0.2762712, 2.032866, 0.372549, 0, 1, 1,
0.5780572, 0.8823547, -1.38674, 0.3803922, 0, 1, 1,
0.5820108, -0.6724513, 2.431697, 0.3843137, 0, 1, 1,
0.5926543, -0.5695729, 1.616321, 0.3921569, 0, 1, 1,
0.5940133, -0.5403, 2.02467, 0.3960784, 0, 1, 1,
0.5944316, 0.5899702, 0.8919067, 0.4039216, 0, 1, 1,
0.5983421, -0.1418967, 1.079997, 0.4117647, 0, 1, 1,
0.6048338, -1.983125, 1.991381, 0.4156863, 0, 1, 1,
0.6061863, 0.7474138, -0.4149274, 0.4235294, 0, 1, 1,
0.6074933, -0.7038712, 3.255563, 0.427451, 0, 1, 1,
0.6081171, -1.825409, 3.063118, 0.4352941, 0, 1, 1,
0.6108246, 0.4368071, -0.7998071, 0.4392157, 0, 1, 1,
0.6110396, 0.9908655, 1.04059, 0.4470588, 0, 1, 1,
0.6115381, 1.344724, -2.19606, 0.4509804, 0, 1, 1,
0.6232041, 0.7629008, 2.113536, 0.4588235, 0, 1, 1,
0.6281506, 0.1246422, -0.1376954, 0.4627451, 0, 1, 1,
0.636007, 1.436958, -0.3400162, 0.4705882, 0, 1, 1,
0.6401328, 0.4933331, -1.2212, 0.4745098, 0, 1, 1,
0.6419594, -0.2710014, 2.532414, 0.4823529, 0, 1, 1,
0.6421512, 1.412596, 0.8340541, 0.4862745, 0, 1, 1,
0.6433249, -0.9099727, 3.095584, 0.4941176, 0, 1, 1,
0.645835, -1.923715, 2.587862, 0.5019608, 0, 1, 1,
0.6464326, -0.1622294, 2.51033, 0.5058824, 0, 1, 1,
0.6465613, -0.3852426, 1.212372, 0.5137255, 0, 1, 1,
0.6620252, -0.7088427, 2.033435, 0.5176471, 0, 1, 1,
0.6630551, 0.02928946, 2.691724, 0.5254902, 0, 1, 1,
0.6635546, 0.1981836, 1.120187, 0.5294118, 0, 1, 1,
0.6639935, -1.254469, 1.567183, 0.5372549, 0, 1, 1,
0.6803383, 0.706328, -0.563203, 0.5411765, 0, 1, 1,
0.6824407, -0.6986461, 2.842623, 0.5490196, 0, 1, 1,
0.6869924, 2.286799, 0.1157307, 0.5529412, 0, 1, 1,
0.6927861, 1.810309, -0.1940623, 0.5607843, 0, 1, 1,
0.698171, -0.4195224, 1.402686, 0.5647059, 0, 1, 1,
0.7006101, 0.2207062, 1.430682, 0.572549, 0, 1, 1,
0.7047136, -0.5811463, 2.054004, 0.5764706, 0, 1, 1,
0.7058132, -0.3943182, 1.511269, 0.5843138, 0, 1, 1,
0.7058954, -0.09430945, 1.326823, 0.5882353, 0, 1, 1,
0.7062145, -0.9312872, 3.495403, 0.5960785, 0, 1, 1,
0.7111331, -1.17373, 1.976789, 0.6039216, 0, 1, 1,
0.711706, 0.5828569, 1.378872, 0.6078432, 0, 1, 1,
0.7141973, 0.1374971, 1.994557, 0.6156863, 0, 1, 1,
0.7189453, 0.4405298, 2.236641, 0.6196079, 0, 1, 1,
0.7212319, 0.53588, 2.459409, 0.627451, 0, 1, 1,
0.7213033, -1.504268, 0.9437315, 0.6313726, 0, 1, 1,
0.721332, 0.04363679, 2.988855, 0.6392157, 0, 1, 1,
0.7225228, 0.3528845, 0.506236, 0.6431373, 0, 1, 1,
0.7285573, 0.4801388, 0.9058314, 0.6509804, 0, 1, 1,
0.7373729, -1.905289, 2.280116, 0.654902, 0, 1, 1,
0.7414798, -0.3400228, 1.63828, 0.6627451, 0, 1, 1,
0.7497825, -0.633285, 3.509574, 0.6666667, 0, 1, 1,
0.7511464, -1.062107, 2.203223, 0.6745098, 0, 1, 1,
0.7513789, 0.3879917, 0.9050421, 0.6784314, 0, 1, 1,
0.7524797, -0.1596467, 1.468765, 0.6862745, 0, 1, 1,
0.7533988, 0.9117982, 1.679285, 0.6901961, 0, 1, 1,
0.754088, 1.811275, -0.5946545, 0.6980392, 0, 1, 1,
0.7558094, -0.5047237, 2.659343, 0.7058824, 0, 1, 1,
0.7565358, -1.913853, 3.218199, 0.7098039, 0, 1, 1,
0.7580298, -0.8763522, 3.478102, 0.7176471, 0, 1, 1,
0.7598224, 1.792582, 0.750493, 0.7215686, 0, 1, 1,
0.7634506, 1.078784, -0.6787269, 0.7294118, 0, 1, 1,
0.7637547, -0.9431222, 2.238827, 0.7333333, 0, 1, 1,
0.7640635, 0.3011474, -0.8916772, 0.7411765, 0, 1, 1,
0.7689274, 0.9169372, 0.5173093, 0.7450981, 0, 1, 1,
0.7695463, 0.2920714, 0.3410676, 0.7529412, 0, 1, 1,
0.7734143, 0.7678627, -0.5397223, 0.7568628, 0, 1, 1,
0.7747204, 1.189007, 0.3761256, 0.7647059, 0, 1, 1,
0.7756993, 0.8372537, 0.8234439, 0.7686275, 0, 1, 1,
0.7776503, 0.5726902, 0.8155503, 0.7764706, 0, 1, 1,
0.7865724, -0.7194564, 3.012466, 0.7803922, 0, 1, 1,
0.7923719, 0.804114, 0.3528389, 0.7882353, 0, 1, 1,
0.7975361, -0.4572562, 3.292437, 0.7921569, 0, 1, 1,
0.7976035, -0.04554146, -0.6212324, 0.8, 0, 1, 1,
0.8094661, 0.6747863, 1.183511, 0.8078431, 0, 1, 1,
0.8119369, 0.5494189, 2.957304, 0.8117647, 0, 1, 1,
0.8174741, 0.7423859, 2.146347, 0.8196079, 0, 1, 1,
0.8198273, -0.1823135, 1.156879, 0.8235294, 0, 1, 1,
0.8227061, 2.351428, -0.3849528, 0.8313726, 0, 1, 1,
0.8233938, -0.07375208, 1.661805, 0.8352941, 0, 1, 1,
0.8245888, 0.7490556, -0.2891101, 0.8431373, 0, 1, 1,
0.8257792, -0.9022886, 2.393199, 0.8470588, 0, 1, 1,
0.8363249, 0.03673733, 1.65567, 0.854902, 0, 1, 1,
0.8403977, 0.4441006, 0.5690722, 0.8588235, 0, 1, 1,
0.8473428, 0.6371092, -0.08059368, 0.8666667, 0, 1, 1,
0.8502933, 0.467419, -0.8466902, 0.8705882, 0, 1, 1,
0.8559088, 0.1908648, 2.347199, 0.8784314, 0, 1, 1,
0.8587257, 0.08411162, 1.446494, 0.8823529, 0, 1, 1,
0.8600353, -1.67202, 2.303607, 0.8901961, 0, 1, 1,
0.8634495, 0.7547371, 0.5657852, 0.8941177, 0, 1, 1,
0.8672203, -0.3635765, 1.966614, 0.9019608, 0, 1, 1,
0.8692055, -0.9344577, 3.365811, 0.9098039, 0, 1, 1,
0.8697106, -0.3689811, 3.591856, 0.9137255, 0, 1, 1,
0.8700802, -1.473143, 1.977746, 0.9215686, 0, 1, 1,
0.8735144, -1.626965, 1.995251, 0.9254902, 0, 1, 1,
0.8782257, 0.2600146, 0.1412872, 0.9333333, 0, 1, 1,
0.8822919, 1.010463, 0.5313048, 0.9372549, 0, 1, 1,
0.88605, 1.701401, -1.542934, 0.945098, 0, 1, 1,
0.8887404, -1.315198, 3.800622, 0.9490196, 0, 1, 1,
0.9001965, 0.8527452, 2.610057, 0.9568627, 0, 1, 1,
0.9005735, -0.2892528, 2.917826, 0.9607843, 0, 1, 1,
0.9031925, -0.1191989, 1.040691, 0.9686275, 0, 1, 1,
0.9143, 0.3878772, 2.49749, 0.972549, 0, 1, 1,
0.9200054, -1.43383, 0.4453937, 0.9803922, 0, 1, 1,
0.9226331, -0.3936116, 2.611658, 0.9843137, 0, 1, 1,
0.9288993, 0.8493159, 2.075347, 0.9921569, 0, 1, 1,
0.9301617, -0.7593249, 3.868178, 0.9960784, 0, 1, 1,
0.9306563, 0.1538325, 0.4700523, 1, 0, 0.9960784, 1,
0.9355145, -0.545603, 3.780658, 1, 0, 0.9882353, 1,
0.9424614, 0.7782916, 0.9185914, 1, 0, 0.9843137, 1,
0.9458256, -1.15047, 3.135062, 1, 0, 0.9764706, 1,
0.9459006, -0.3236298, 2.083414, 1, 0, 0.972549, 1,
0.9499903, 0.9374584, 0.4302699, 1, 0, 0.9647059, 1,
0.9504601, 0.3578829, 0.2880767, 1, 0, 0.9607843, 1,
0.9544331, 0.3970367, 1.798041, 1, 0, 0.9529412, 1,
0.9555282, 3.330969, -1.701014, 1, 0, 0.9490196, 1,
0.9555615, -0.6217747, 1.236153, 1, 0, 0.9411765, 1,
0.9566268, -1.09983, 1.89288, 1, 0, 0.9372549, 1,
0.9575135, -0.6291011, 1.977884, 1, 0, 0.9294118, 1,
0.9608292, 0.7046429, 0.1119629, 1, 0, 0.9254902, 1,
0.9622851, 1.062969, 0.7188748, 1, 0, 0.9176471, 1,
0.9648582, 1.207098, 1.042022, 1, 0, 0.9137255, 1,
0.9739295, -0.349398, 1.100893, 1, 0, 0.9058824, 1,
0.9880112, -1.166993, 2.583171, 1, 0, 0.9019608, 1,
0.9979181, 0.9182706, 2.037332, 1, 0, 0.8941177, 1,
0.9991615, 0.01549452, 0.8042914, 1, 0, 0.8862745, 1,
1.004025, 0.4080326, 1.614237, 1, 0, 0.8823529, 1,
1.00848, -0.7779181, 3.285397, 1, 0, 0.8745098, 1,
1.009195, 1.042457, 0.8982074, 1, 0, 0.8705882, 1,
1.018197, -0.08939321, 1.534452, 1, 0, 0.8627451, 1,
1.023975, 1.135321, 0.245172, 1, 0, 0.8588235, 1,
1.026138, 0.2637494, 1.810689, 1, 0, 0.8509804, 1,
1.027707, 0.444809, 1.193206, 1, 0, 0.8470588, 1,
1.028359, 0.4079857, 0.6772649, 1, 0, 0.8392157, 1,
1.045566, 1.409855, 2.525873, 1, 0, 0.8352941, 1,
1.04569, -0.4343677, 2.290361, 1, 0, 0.827451, 1,
1.046383, 0.7709338, -0.1615662, 1, 0, 0.8235294, 1,
1.049505, 0.2158894, 0.6420497, 1, 0, 0.8156863, 1,
1.049728, -0.9158998, 1.927422, 1, 0, 0.8117647, 1,
1.054648, 0.4148759, 0.2489959, 1, 0, 0.8039216, 1,
1.06319, 1.033375, -0.4495593, 1, 0, 0.7960784, 1,
1.070205, -2.103178, 2.650042, 1, 0, 0.7921569, 1,
1.070886, 0.002153553, 0.08039222, 1, 0, 0.7843137, 1,
1.074683, 1.92299, 1.202484, 1, 0, 0.7803922, 1,
1.075727, -0.4034325, 2.572548, 1, 0, 0.772549, 1,
1.077654, 0.6049137, 0.9764245, 1, 0, 0.7686275, 1,
1.086242, -1.333634, 2.385687, 1, 0, 0.7607843, 1,
1.089198, -0.1016699, 0.9442752, 1, 0, 0.7568628, 1,
1.08984, 0.4755473, 1.978887, 1, 0, 0.7490196, 1,
1.092682, -0.8823668, 2.644343, 1, 0, 0.7450981, 1,
1.100763, -0.474685, 2.129086, 1, 0, 0.7372549, 1,
1.106236, -0.6027842, 2.556908, 1, 0, 0.7333333, 1,
1.113099, 0.5502003, -0.2694921, 1, 0, 0.7254902, 1,
1.113455, 0.5030658, 1.80316, 1, 0, 0.7215686, 1,
1.116046, -1.647071, 1.193233, 1, 0, 0.7137255, 1,
1.132962, -0.6764024, 1.889974, 1, 0, 0.7098039, 1,
1.134383, -0.05519153, 0.8190106, 1, 0, 0.7019608, 1,
1.141104, -0.6983916, 2.083273, 1, 0, 0.6941177, 1,
1.146884, 1.198224, 1.185173, 1, 0, 0.6901961, 1,
1.148265, 0.2944275, 1.093785, 1, 0, 0.682353, 1,
1.152391, 0.1969686, 1.4429, 1, 0, 0.6784314, 1,
1.156626, 0.2536141, 1.679904, 1, 0, 0.6705883, 1,
1.160462, 0.1045307, 0.1987188, 1, 0, 0.6666667, 1,
1.166817, -0.9443054, 2.038835, 1, 0, 0.6588235, 1,
1.172105, 0.1087482, 2.83919, 1, 0, 0.654902, 1,
1.175209, 0.1136468, 1.562084, 1, 0, 0.6470588, 1,
1.176297, 0.1077844, 1.772891, 1, 0, 0.6431373, 1,
1.180086, -0.6927493, 1.734118, 1, 0, 0.6352941, 1,
1.181993, 1.16839, -0.3987451, 1, 0, 0.6313726, 1,
1.182296, -0.2666132, 2.214018, 1, 0, 0.6235294, 1,
1.183164, 1.042218, 1.100037, 1, 0, 0.6196079, 1,
1.199716, -1.27953, 2.268847, 1, 0, 0.6117647, 1,
1.21419, -0.9363475, 0.6945397, 1, 0, 0.6078432, 1,
1.217613, 0.3476698, 0.2865827, 1, 0, 0.6, 1,
1.229478, -0.5104336, 1.003758, 1, 0, 0.5921569, 1,
1.236499, -0.5091817, 1.617383, 1, 0, 0.5882353, 1,
1.242711, 0.6566054, 0.7022338, 1, 0, 0.5803922, 1,
1.243604, -1.660282, 2.740569, 1, 0, 0.5764706, 1,
1.251449, 0.3350675, 0.3721949, 1, 0, 0.5686275, 1,
1.253915, 0.8682277, 0.4634015, 1, 0, 0.5647059, 1,
1.261933, 1.760131, 1.26301, 1, 0, 0.5568628, 1,
1.263577, -0.8810704, 2.337278, 1, 0, 0.5529412, 1,
1.273128, -0.08340666, 2.34639, 1, 0, 0.5450981, 1,
1.274065, -0.5408003, 2.39606, 1, 0, 0.5411765, 1,
1.286127, 1.392476, 0.7257063, 1, 0, 0.5333334, 1,
1.294036, -0.1328185, 1.652313, 1, 0, 0.5294118, 1,
1.307256, -0.08249814, 1.07773, 1, 0, 0.5215687, 1,
1.312346, -2.927994, 5.905782, 1, 0, 0.5176471, 1,
1.320245, -1.510685, 2.650555, 1, 0, 0.509804, 1,
1.323342, -0.3630386, 1.285197, 1, 0, 0.5058824, 1,
1.323724, 2.34134, 0.422497, 1, 0, 0.4980392, 1,
1.354398, 1.391543, 1.639895, 1, 0, 0.4901961, 1,
1.386503, -0.4032152, -0.1565426, 1, 0, 0.4862745, 1,
1.393761, 2.10706, -0.3322067, 1, 0, 0.4784314, 1,
1.394161, 0.7553766, -0.3259502, 1, 0, 0.4745098, 1,
1.39537, 0.7444636, 1.327165, 1, 0, 0.4666667, 1,
1.395594, 0.7600611, 2.625576, 1, 0, 0.4627451, 1,
1.402235, 1.965671, 2.591104, 1, 0, 0.454902, 1,
1.418714, 0.6540985, 1.936591, 1, 0, 0.4509804, 1,
1.426826, 1.775935, 2.070262, 1, 0, 0.4431373, 1,
1.430975, -1.525027, 3.347488, 1, 0, 0.4392157, 1,
1.432092, 0.3754008, 0.6390376, 1, 0, 0.4313726, 1,
1.442216, -1.680443, 3.003485, 1, 0, 0.427451, 1,
1.444435, -1.900737, 1.248162, 1, 0, 0.4196078, 1,
1.450317, 0.2850338, 1.796401, 1, 0, 0.4156863, 1,
1.457754, 0.8097234, 1.034033, 1, 0, 0.4078431, 1,
1.46506, 0.1826631, 1.736577, 1, 0, 0.4039216, 1,
1.467452, -0.98647, 2.228886, 1, 0, 0.3960784, 1,
1.47566, 0.458872, 0.428412, 1, 0, 0.3882353, 1,
1.479631, -1.566223, 3.494744, 1, 0, 0.3843137, 1,
1.48796, -1.795867, 2.372164, 1, 0, 0.3764706, 1,
1.488176, 0.2988538, 2.070166, 1, 0, 0.372549, 1,
1.498079, 0.9793918, 1.342865, 1, 0, 0.3647059, 1,
1.507014, 0.01173366, 0.4964158, 1, 0, 0.3607843, 1,
1.514073, 0.1366149, 2.23329, 1, 0, 0.3529412, 1,
1.514456, -1.967774, 1.801269, 1, 0, 0.3490196, 1,
1.519225, -1.534504, 1.878784, 1, 0, 0.3411765, 1,
1.538667, 0.28031, 1.452142, 1, 0, 0.3372549, 1,
1.571854, 0.6274058, -0.7808622, 1, 0, 0.3294118, 1,
1.585245, 0.01010738, 0.2612626, 1, 0, 0.3254902, 1,
1.599626, 0.7649385, -0.7243485, 1, 0, 0.3176471, 1,
1.610452, -1.293102, 3.921206, 1, 0, 0.3137255, 1,
1.620619, -0.8471482, 2.324401, 1, 0, 0.3058824, 1,
1.633227, 0.04779785, -0.06163883, 1, 0, 0.2980392, 1,
1.668577, -0.09875873, 3.275965, 1, 0, 0.2941177, 1,
1.676742, 0.756772, -1.219859, 1, 0, 0.2862745, 1,
1.683363, -0.2762055, 1.746596, 1, 0, 0.282353, 1,
1.707501, 1.098294, 0.8762209, 1, 0, 0.2745098, 1,
1.726201, -0.2301347, 3.551753, 1, 0, 0.2705882, 1,
1.729873, 0.2145391, 1.591927, 1, 0, 0.2627451, 1,
1.740779, -2.198592, 2.11219, 1, 0, 0.2588235, 1,
1.755963, 0.5394308, 0.5544587, 1, 0, 0.2509804, 1,
1.756588, 1.639288, 1.313618, 1, 0, 0.2470588, 1,
1.770118, 0.783918, 1.676086, 1, 0, 0.2392157, 1,
1.773925, 1.005461, -0.2887698, 1, 0, 0.2352941, 1,
1.792423, 1.088564, 0.8768066, 1, 0, 0.227451, 1,
1.815211, -0.4403272, 2.810207, 1, 0, 0.2235294, 1,
1.816427, -0.5117412, 1.800633, 1, 0, 0.2156863, 1,
1.82069, 1.519615, 0.3828587, 1, 0, 0.2117647, 1,
1.821418, 0.4525883, 0.6548469, 1, 0, 0.2039216, 1,
1.848233, -0.2209295, 2.333773, 1, 0, 0.1960784, 1,
1.855731, 0.9084228, 1.285096, 1, 0, 0.1921569, 1,
1.856103, 0.6068401, -0.1950054, 1, 0, 0.1843137, 1,
1.878935, -0.5064301, 0.9923491, 1, 0, 0.1803922, 1,
1.92898, -0.9026319, 1.254103, 1, 0, 0.172549, 1,
1.944071, 2.055527, 1.728491, 1, 0, 0.1686275, 1,
1.95119, 0.7751081, 0.5266994, 1, 0, 0.1607843, 1,
1.961156, 1.567653, -0.3772359, 1, 0, 0.1568628, 1,
1.962432, -0.1781836, 1.439511, 1, 0, 0.1490196, 1,
1.97733, -0.6380377, 1.833061, 1, 0, 0.145098, 1,
1.983398, -0.08140656, 1.236093, 1, 0, 0.1372549, 1,
1.984499, 0.1783042, 0.3618765, 1, 0, 0.1333333, 1,
1.998687, -0.4008828, 1.281047, 1, 0, 0.1254902, 1,
2.052035, 1.957885, -0.4121701, 1, 0, 0.1215686, 1,
2.065232, -0.3317081, 2.098746, 1, 0, 0.1137255, 1,
2.082774, -1.283869, 1.438088, 1, 0, 0.1098039, 1,
2.101041, 1.939679, 0.824334, 1, 0, 0.1019608, 1,
2.107353, 0.0515312, 1.60078, 1, 0, 0.09411765, 1,
2.125036, -0.3517499, 1.92804, 1, 0, 0.09019608, 1,
2.135863, 0.6549436, 2.002075, 1, 0, 0.08235294, 1,
2.151329, -0.1649845, 1.973091, 1, 0, 0.07843138, 1,
2.170229, -1.604769, 1.323721, 1, 0, 0.07058824, 1,
2.290891, 0.7205909, -0.3642753, 1, 0, 0.06666667, 1,
2.370143, -1.043983, 2.231056, 1, 0, 0.05882353, 1,
2.573481, -0.7958405, 1.937606, 1, 0, 0.05490196, 1,
2.603547, -2.234864, 2.369307, 1, 0, 0.04705882, 1,
2.679289, 1.359023, 1.144953, 1, 0, 0.04313726, 1,
2.719303, -0.09684677, 2.345026, 1, 0, 0.03529412, 1,
2.855017, -1.335518, 2.22613, 1, 0, 0.03137255, 1,
2.966663, 0.5787935, 1.107033, 1, 0, 0.02352941, 1,
3.080004, -0.5782495, 1.05435, 1, 0, 0.01960784, 1,
3.130064, -1.96507, 2.138453, 1, 0, 0.01176471, 1,
3.377578, -0.1001093, 1.16939, 1, 0, 0.007843138, 1
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
-0.1409762, -4.028968, -7.423721, 0, -0.5, 0.5, 0.5,
-0.1409762, -4.028968, -7.423721, 1, -0.5, 0.5, 0.5,
-0.1409762, -4.028968, -7.423721, 1, 1.5, 0.5, 0.5,
-0.1409762, -4.028968, -7.423721, 0, 1.5, 0.5, 0.5
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
-4.85232, 0.184352, -7.423721, 0, -0.5, 0.5, 0.5,
-4.85232, 0.184352, -7.423721, 1, -0.5, 0.5, 0.5,
-4.85232, 0.184352, -7.423721, 1, 1.5, 0.5, 0.5,
-4.85232, 0.184352, -7.423721, 0, 1.5, 0.5, 0.5
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
-4.85232, -4.028968, 0.2069778, 0, -0.5, 0.5, 0.5,
-4.85232, -4.028968, 0.2069778, 1, -0.5, 0.5, 0.5,
-4.85232, -4.028968, 0.2069778, 1, 1.5, 0.5, 0.5,
-4.85232, -4.028968, 0.2069778, 0, 1.5, 0.5, 0.5
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
-2, -3.056663, -5.662791,
2, -3.056663, -5.662791,
-2, -3.056663, -5.662791,
-2, -3.218714, -5.956279,
0, -3.056663, -5.662791,
0, -3.218714, -5.956279,
2, -3.056663, -5.662791,
2, -3.218714, -5.956279
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
"0",
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
-2, -3.542816, -6.543256, 0, -0.5, 0.5, 0.5,
-2, -3.542816, -6.543256, 1, -0.5, 0.5, 0.5,
-2, -3.542816, -6.543256, 1, 1.5, 0.5, 0.5,
-2, -3.542816, -6.543256, 0, 1.5, 0.5, 0.5,
0, -3.542816, -6.543256, 0, -0.5, 0.5, 0.5,
0, -3.542816, -6.543256, 1, -0.5, 0.5, 0.5,
0, -3.542816, -6.543256, 1, 1.5, 0.5, 0.5,
0, -3.542816, -6.543256, 0, 1.5, 0.5, 0.5,
2, -3.542816, -6.543256, 0, -0.5, 0.5, 0.5,
2, -3.542816, -6.543256, 1, -0.5, 0.5, 0.5,
2, -3.542816, -6.543256, 1, 1.5, 0.5, 0.5,
2, -3.542816, -6.543256, 0, 1.5, 0.5, 0.5
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
-3.765087, -2, -5.662791,
-3.765087, 3, -5.662791,
-3.765087, -2, -5.662791,
-3.946292, -2, -5.956279,
-3.765087, -1, -5.662791,
-3.946292, -1, -5.956279,
-3.765087, 0, -5.662791,
-3.946292, 0, -5.956279,
-3.765087, 1, -5.662791,
-3.946292, 1, -5.956279,
-3.765087, 2, -5.662791,
-3.946292, 2, -5.956279,
-3.765087, 3, -5.662791,
-3.946292, 3, -5.956279
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
-4.308703, -2, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, -2, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, -2, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, -2, -6.543256, 0, 1.5, 0.5, 0.5,
-4.308703, -1, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, -1, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, -1, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, -1, -6.543256, 0, 1.5, 0.5, 0.5,
-4.308703, 0, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, 0, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, 0, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, 0, -6.543256, 0, 1.5, 0.5, 0.5,
-4.308703, 1, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, 1, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, 1, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, 1, -6.543256, 0, 1.5, 0.5, 0.5,
-4.308703, 2, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, 2, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, 2, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, 2, -6.543256, 0, 1.5, 0.5, 0.5,
-4.308703, 3, -6.543256, 0, -0.5, 0.5, 0.5,
-4.308703, 3, -6.543256, 1, -0.5, 0.5, 0.5,
-4.308703, 3, -6.543256, 1, 1.5, 0.5, 0.5,
-4.308703, 3, -6.543256, 0, 1.5, 0.5, 0.5
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
-3.765087, -3.056663, -4,
-3.765087, -3.056663, 4,
-3.765087, -3.056663, -4,
-3.946292, -3.218714, -4,
-3.765087, -3.056663, -2,
-3.946292, -3.218714, -2,
-3.765087, -3.056663, 0,
-3.946292, -3.218714, 0,
-3.765087, -3.056663, 2,
-3.946292, -3.218714, 2,
-3.765087, -3.056663, 4,
-3.946292, -3.218714, 4
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
-4.308703, -3.542816, -4, 0, -0.5, 0.5, 0.5,
-4.308703, -3.542816, -4, 1, -0.5, 0.5, 0.5,
-4.308703, -3.542816, -4, 1, 1.5, 0.5, 0.5,
-4.308703, -3.542816, -4, 0, 1.5, 0.5, 0.5,
-4.308703, -3.542816, -2, 0, -0.5, 0.5, 0.5,
-4.308703, -3.542816, -2, 1, -0.5, 0.5, 0.5,
-4.308703, -3.542816, -2, 1, 1.5, 0.5, 0.5,
-4.308703, -3.542816, -2, 0, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 0, 0, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 0, 1, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 0, 1, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 0, 0, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 2, 0, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 2, 1, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 2, 1, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 2, 0, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 4, 0, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 4, 1, -0.5, 0.5, 0.5,
-4.308703, -3.542816, 4, 1, 1.5, 0.5, 0.5,
-4.308703, -3.542816, 4, 0, 1.5, 0.5, 0.5
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
-3.765087, -3.056663, -5.662791,
-3.765087, 3.425367, -5.662791,
-3.765087, -3.056663, 6.076746,
-3.765087, 3.425367, 6.076746,
-3.765087, -3.056663, -5.662791,
-3.765087, -3.056663, 6.076746,
-3.765087, 3.425367, -5.662791,
-3.765087, 3.425367, 6.076746,
-3.765087, -3.056663, -5.662791,
3.483135, -3.056663, -5.662791,
-3.765087, -3.056663, 6.076746,
3.483135, -3.056663, 6.076746,
-3.765087, 3.425367, -5.662791,
3.483135, 3.425367, -5.662791,
-3.765087, 3.425367, 6.076746,
3.483135, 3.425367, 6.076746,
3.483135, -3.056663, -5.662791,
3.483135, 3.425367, -5.662791,
3.483135, -3.056663, 6.076746,
3.483135, 3.425367, 6.076746,
3.483135, -3.056663, -5.662791,
3.483135, -3.056663, 6.076746,
3.483135, 3.425367, -5.662791,
3.483135, 3.425367, 6.076746
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
var radius = 8.139836;
var distance = 36.21505;
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
mvMatrix.translate( 0.1409762, -0.184352, -0.2069778 );
mvMatrix.scale( 1.214222, 1.357746, 0.7496846 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.21505);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Arsonic_Acid<-read.table("Arsonic_Acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Arsonic_Acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'Arsonic_Acid' not found
```

```r
y<-Arsonic_Acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'Arsonic_Acid' not found
```

```r
z<-Arsonic_Acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'Arsonic_Acid' not found
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
-3.65953, -0.07316121, -1.311614, 0, 0, 1, 1, 1,
-2.838765, 0.09134244, -1.149229, 1, 0, 0, 1, 1,
-2.697263, 0.171354, -2.660644, 1, 0, 0, 1, 1,
-2.691333, -0.9921327, -2.791007, 1, 0, 0, 1, 1,
-2.460918, -0.2808695, -2.034225, 1, 0, 0, 1, 1,
-2.420052, 0.499715, -0.7601705, 1, 0, 0, 1, 1,
-2.385211, 0.02009075, -2.111652, 0, 0, 0, 1, 1,
-2.317293, 0.6144541, -2.095632, 0, 0, 0, 1, 1,
-2.315711, 0.6326078, -1.483144, 0, 0, 0, 1, 1,
-2.30793, -1.114554, -1.881491, 0, 0, 0, 1, 1,
-2.226666, -1.733128, -3.156084, 0, 0, 0, 1, 1,
-2.221243, -0.9234871, -1.973701, 0, 0, 0, 1, 1,
-2.207217, 0.4595549, -2.174606, 0, 0, 0, 1, 1,
-2.206802, 0.9021294, -2.125986, 1, 1, 1, 1, 1,
-2.178543, 0.3773881, -1.413356, 1, 1, 1, 1, 1,
-2.15271, 0.5723248, -0.8819856, 1, 1, 1, 1, 1,
-2.112864, 1.038025, -1.835225, 1, 1, 1, 1, 1,
-2.091696, 0.9970573, -0.409673, 1, 1, 1, 1, 1,
-2.088476, 0.2251597, -1.35362, 1, 1, 1, 1, 1,
-2.081901, 0.4186805, -1.609355, 1, 1, 1, 1, 1,
-2.077755, -0.4198419, -1.657568, 1, 1, 1, 1, 1,
-2.031035, 0.0149804, -0.7386751, 1, 1, 1, 1, 1,
-1.990449, -0.2158131, -0.6158774, 1, 1, 1, 1, 1,
-1.968673, 1.267829, -0.9970249, 1, 1, 1, 1, 1,
-1.964364, 1.101652, -1.590818, 1, 1, 1, 1, 1,
-1.957809, -0.5990728, -0.1302489, 1, 1, 1, 1, 1,
-1.947459, 1.028307, 0.4644624, 1, 1, 1, 1, 1,
-1.935382, -1.220264, -1.953607, 1, 1, 1, 1, 1,
-1.907851, -0.8207096, -2.305356, 0, 0, 1, 1, 1,
-1.886407, 1.140957, -1.116923, 1, 0, 0, 1, 1,
-1.873209, -0.4601324, -2.344551, 1, 0, 0, 1, 1,
-1.866035, -0.2164477, -2.522917, 1, 0, 0, 1, 1,
-1.802578, -0.2901413, -0.5883731, 1, 0, 0, 1, 1,
-1.795137, -1.407817, -0.3195296, 1, 0, 0, 1, 1,
-1.784208, 1.387858, 0.9571297, 0, 0, 0, 1, 1,
-1.77337, 1.759579, -0.1177597, 0, 0, 0, 1, 1,
-1.757055, 0.09639387, -2.126745, 0, 0, 0, 1, 1,
-1.753247, 1.19793, 0.6266208, 0, 0, 0, 1, 1,
-1.747823, 1.514616, -0.5015721, 0, 0, 0, 1, 1,
-1.743107, 1.51118, -1.345379, 0, 0, 0, 1, 1,
-1.739413, -1.604899, -3.256077, 0, 0, 0, 1, 1,
-1.730569, 0.3495476, -0.1305374, 1, 1, 1, 1, 1,
-1.727579, 0.2647086, -3.070286, 1, 1, 1, 1, 1,
-1.711919, 0.3638583, -1.943757, 1, 1, 1, 1, 1,
-1.710767, 0.1058145, -3.268107, 1, 1, 1, 1, 1,
-1.699752, 2.292572, -0.6990598, 1, 1, 1, 1, 1,
-1.694678, 0.6271994, -0.4611681, 1, 1, 1, 1, 1,
-1.692964, 1.124133, -2.72096, 1, 1, 1, 1, 1,
-1.673648, 1.381383, -1.687727, 1, 1, 1, 1, 1,
-1.657839, 0.4540029, -2.067852, 1, 1, 1, 1, 1,
-1.657657, -0.3906267, -0.7103699, 1, 1, 1, 1, 1,
-1.638976, 2.51986, 0.8064162, 1, 1, 1, 1, 1,
-1.620428, -0.01557915, -3.105131, 1, 1, 1, 1, 1,
-1.606132, -0.2694119, -0.2632273, 1, 1, 1, 1, 1,
-1.601365, 0.8430177, -0.5849563, 1, 1, 1, 1, 1,
-1.581103, 1.529007, -1.151461, 1, 1, 1, 1, 1,
-1.580902, -0.2247346, -2.689052, 0, 0, 1, 1, 1,
-1.575371, -1.508271, -2.450463, 1, 0, 0, 1, 1,
-1.568557, 0.3911938, -1.020241, 1, 0, 0, 1, 1,
-1.561286, 0.8854698, -0.6051116, 1, 0, 0, 1, 1,
-1.551185, -0.8164693, -1.210935, 1, 0, 0, 1, 1,
-1.548503, -0.1742997, -3.651397, 1, 0, 0, 1, 1,
-1.543971, 0.6180602, -2.135031, 0, 0, 0, 1, 1,
-1.54161, -0.4139909, -2.73353, 0, 0, 0, 1, 1,
-1.53486, 0.5114636, -2.020042, 0, 0, 0, 1, 1,
-1.524923, 1.809456, -1.473616, 0, 0, 0, 1, 1,
-1.518186, 1.730772, -0.6966247, 0, 0, 0, 1, 1,
-1.497318, -1.231559, -1.888257, 0, 0, 0, 1, 1,
-1.497104, -1.050831, -2.672139, 0, 0, 0, 1, 1,
-1.491117, -1.784387, -2.327137, 1, 1, 1, 1, 1,
-1.48423, -0.5787256, -0.5205694, 1, 1, 1, 1, 1,
-1.480016, 1.376097, -0.8041834, 1, 1, 1, 1, 1,
-1.459099, 0.602816, -0.7701988, 1, 1, 1, 1, 1,
-1.458386, 1.818234, -0.3701918, 1, 1, 1, 1, 1,
-1.426287, 0.3592865, -0.915818, 1, 1, 1, 1, 1,
-1.423104, 0.1120779, -2.640928, 1, 1, 1, 1, 1,
-1.422735, 0.8517202, 0.590423, 1, 1, 1, 1, 1,
-1.412176, 1.307075, -2.089186, 1, 1, 1, 1, 1,
-1.411047, 0.1451985, -2.099492, 1, 1, 1, 1, 1,
-1.387416, -1.285852, -1.305017, 1, 1, 1, 1, 1,
-1.386536, 0.6777401, 0.309514, 1, 1, 1, 1, 1,
-1.382831, -0.03112772, -2.627344, 1, 1, 1, 1, 1,
-1.348917, -2.205625, 0.3575743, 1, 1, 1, 1, 1,
-1.340601, 0.3227672, -2.638638, 1, 1, 1, 1, 1,
-1.336435, -0.5830423, -1.067794, 0, 0, 1, 1, 1,
-1.334486, -0.1310325, -1.507077, 1, 0, 0, 1, 1,
-1.326963, 1.052771, -1.629256, 1, 0, 0, 1, 1,
-1.321414, 1.536143, -0.5777653, 1, 0, 0, 1, 1,
-1.303681, -1.043569, 0.3760705, 1, 0, 0, 1, 1,
-1.295966, 0.6394313, 0.6158224, 1, 0, 0, 1, 1,
-1.284408, -1.49352, -0.7194701, 0, 0, 0, 1, 1,
-1.284164, 2.203772, -1.550288, 0, 0, 0, 1, 1,
-1.280844, -0.8953934, -2.161968, 0, 0, 0, 1, 1,
-1.27727, 0.5904144, -0.9932347, 0, 0, 0, 1, 1,
-1.275139, 0.2952324, -3.433883, 0, 0, 0, 1, 1,
-1.272617, -0.3258509, -0.3881396, 0, 0, 0, 1, 1,
-1.269986, -0.3656328, -2.065982, 0, 0, 0, 1, 1,
-1.268905, 0.01975468, -1.939767, 1, 1, 1, 1, 1,
-1.267042, 1.173985, -1.053867, 1, 1, 1, 1, 1,
-1.256869, -0.2058781, -0.9844856, 1, 1, 1, 1, 1,
-1.256193, -0.3599124, -1.90293, 1, 1, 1, 1, 1,
-1.252752, -1.113853, -1.393899, 1, 1, 1, 1, 1,
-1.239103, 2.283807, -1.873038, 1, 1, 1, 1, 1,
-1.236176, 0.8791137, -0.6270555, 1, 1, 1, 1, 1,
-1.226983, 0.01367707, -1.49953, 1, 1, 1, 1, 1,
-1.225492, 0.2565676, -0.7721552, 1, 1, 1, 1, 1,
-1.217992, 0.7660307, -1.768, 1, 1, 1, 1, 1,
-1.215075, -1.561511, -3.40847, 1, 1, 1, 1, 1,
-1.214394, -0.8174156, -2.206491, 1, 1, 1, 1, 1,
-1.213112, -0.6731801, -3.177029, 1, 1, 1, 1, 1,
-1.209846, 0.1384152, -0.9130685, 1, 1, 1, 1, 1,
-1.207797, 0.6959812, -1.190218, 1, 1, 1, 1, 1,
-1.20531, -0.5649475, -3.927288, 0, 0, 1, 1, 1,
-1.203416, 0.8659887, -0.1840707, 1, 0, 0, 1, 1,
-1.188677, 0.6071345, -1.676616, 1, 0, 0, 1, 1,
-1.181448, 0.4358215, -0.1770918, 1, 0, 0, 1, 1,
-1.178861, 1.15707, -0.9944627, 1, 0, 0, 1, 1,
-1.178128, -0.1422128, -1.657205, 1, 0, 0, 1, 1,
-1.17327, -1.693906, -2.258812, 0, 0, 0, 1, 1,
-1.171358, -0.7669522, -1.925232, 0, 0, 0, 1, 1,
-1.166313, 0.4265405, -0.4996501, 0, 0, 0, 1, 1,
-1.162027, -1.100192, -2.315151, 0, 0, 0, 1, 1,
-1.158939, -0.3911582, -1.840998, 0, 0, 0, 1, 1,
-1.153766, 0.32827, -0.6651812, 0, 0, 0, 1, 1,
-1.147297, -0.1906887, -2.220372, 0, 0, 0, 1, 1,
-1.146362, 0.7863396, -1.290668, 1, 1, 1, 1, 1,
-1.146337, 1.301303, -0.2629618, 1, 1, 1, 1, 1,
-1.143643, 0.5141302, -2.241954, 1, 1, 1, 1, 1,
-1.143448, 0.4013449, -1.607097, 1, 1, 1, 1, 1,
-1.137736, 1.109363, -1.049473, 1, 1, 1, 1, 1,
-1.132491, 1.114894, -0.8114795, 1, 1, 1, 1, 1,
-1.130175, 0.07048801, -0.8831817, 1, 1, 1, 1, 1,
-1.129264, 1.309633, -1.965582, 1, 1, 1, 1, 1,
-1.122049, -0.4195765, -1.66516, 1, 1, 1, 1, 1,
-1.118383, -0.5942141, -3.377602, 1, 1, 1, 1, 1,
-1.118138, 0.1478666, -0.7163162, 1, 1, 1, 1, 1,
-1.113107, -0.5899011, -3.660901, 1, 1, 1, 1, 1,
-1.109895, -1.15411, -1.642449, 1, 1, 1, 1, 1,
-1.109404, 0.3958631, -0.2152948, 1, 1, 1, 1, 1,
-1.108503, 0.02137528, -0.9328408, 1, 1, 1, 1, 1,
-1.099884, 0.0231353, -1.119398, 0, 0, 1, 1, 1,
-1.096604, 0.7197183, -1.180397, 1, 0, 0, 1, 1,
-1.091942, 0.1961281, -0.4077486, 1, 0, 0, 1, 1,
-1.085966, -0.326963, -2.158655, 1, 0, 0, 1, 1,
-1.083997, 1.820624, -0.5910159, 1, 0, 0, 1, 1,
-1.080903, 2.027642, -1.263266, 1, 0, 0, 1, 1,
-1.079245, 0.4027018, -1.386952, 0, 0, 0, 1, 1,
-1.078843, -1.004937, -1.535434, 0, 0, 0, 1, 1,
-1.066413, 0.6984524, -2.656307, 0, 0, 0, 1, 1,
-1.062474, 0.7357835, -1.350245, 0, 0, 0, 1, 1,
-1.062447, 2.437137, 1.311794, 0, 0, 0, 1, 1,
-1.061989, 0.3695015, -2.430536, 0, 0, 0, 1, 1,
-1.059011, 0.08137915, -3.652656, 0, 0, 0, 1, 1,
-1.055943, -0.0297635, -1.527436, 1, 1, 1, 1, 1,
-1.054901, -0.05482969, -1.737578, 1, 1, 1, 1, 1,
-1.053638, 0.5282301, -1.171374, 1, 1, 1, 1, 1,
-1.051848, 0.8794475, -0.7542608, 1, 1, 1, 1, 1,
-1.050783, -0.6097606, -3.516556, 1, 1, 1, 1, 1,
-1.049632, 0.9688015, -2.375822, 1, 1, 1, 1, 1,
-1.041689, -0.9027867, -2.076309, 1, 1, 1, 1, 1,
-1.040743, -0.2605489, -3.086026, 1, 1, 1, 1, 1,
-1.039153, 0.7381208, -0.6683954, 1, 1, 1, 1, 1,
-1.029725, 0.2005987, -1.589568, 1, 1, 1, 1, 1,
-1.025816, -0.6703444, -1.861158, 1, 1, 1, 1, 1,
-1.023988, 1.061702, -0.6126108, 1, 1, 1, 1, 1,
-1.011989, -0.6235068, -1.897082, 1, 1, 1, 1, 1,
-1.011716, -0.3862143, -2.778393, 1, 1, 1, 1, 1,
-1.010489, 0.9024741, -1.492238, 1, 1, 1, 1, 1,
-1.004493, -0.5731906, -3.174145, 0, 0, 1, 1, 1,
-0.9968209, 1.805358, 0.3865817, 1, 0, 0, 1, 1,
-0.9958154, -0.3829657, -1.616135, 1, 0, 0, 1, 1,
-0.9905567, -0.9494865, -2.07721, 1, 0, 0, 1, 1,
-0.9886877, 0.5921808, -0.5093521, 1, 0, 0, 1, 1,
-0.9846579, 0.673841, -3.223201, 1, 0, 0, 1, 1,
-0.9774756, -0.07886182, -1.708548, 0, 0, 0, 1, 1,
-0.969119, 0.6854218, -2.493843, 0, 0, 0, 1, 1,
-0.9622334, 0.5968989, -0.1434956, 0, 0, 0, 1, 1,
-0.9573386, 0.8586915, 0.1019434, 0, 0, 0, 1, 1,
-0.954787, -0.4407898, -2.715679, 0, 0, 0, 1, 1,
-0.9541887, 0.5676748, -2.005295, 0, 0, 0, 1, 1,
-0.9471288, -0.8970583, -2.118691, 0, 0, 0, 1, 1,
-0.9459144, 0.3036411, -0.6821916, 1, 1, 1, 1, 1,
-0.942642, -0.5177782, -2.560239, 1, 1, 1, 1, 1,
-0.9366621, -0.74366, -1.56426, 1, 1, 1, 1, 1,
-0.931242, 0.5490599, -1.601116, 1, 1, 1, 1, 1,
-0.9296182, -1.783459, -1.349475, 1, 1, 1, 1, 1,
-0.9287127, 0.1127173, -2.462967, 1, 1, 1, 1, 1,
-0.9283707, 0.4428942, -1.253379, 1, 1, 1, 1, 1,
-0.9259836, -1.528621, -2.527851, 1, 1, 1, 1, 1,
-0.9244445, -0.7336552, -3.391933, 1, 1, 1, 1, 1,
-0.9243326, -0.8049551, -1.751601, 1, 1, 1, 1, 1,
-0.9155833, -0.1995514, -2.725783, 1, 1, 1, 1, 1,
-0.9064223, 0.3681638, -2.081507, 1, 1, 1, 1, 1,
-0.9062412, 2.116756, 0.6684868, 1, 1, 1, 1, 1,
-0.9047222, 0.8188707, 0.5899843, 1, 1, 1, 1, 1,
-0.8945681, 1.34255, 0.9732687, 1, 1, 1, 1, 1,
-0.8941434, -0.7623405, -1.93099, 0, 0, 1, 1, 1,
-0.8883596, -0.03987957, -0.09606768, 1, 0, 0, 1, 1,
-0.8859833, -0.4347468, -2.740979, 1, 0, 0, 1, 1,
-0.8824833, -0.7484088, -2.241374, 1, 0, 0, 1, 1,
-0.8820831, 0.550445, -0.7060679, 1, 0, 0, 1, 1,
-0.8782949, -0.1851859, -0.6600947, 1, 0, 0, 1, 1,
-0.8749686, -0.4369724, -3.044531, 0, 0, 0, 1, 1,
-0.8704899, 1.420587, -1.346243, 0, 0, 0, 1, 1,
-0.8653506, -1.128808, -1.646143, 0, 0, 0, 1, 1,
-0.8651257, 0.3292996, -2.027736, 0, 0, 0, 1, 1,
-0.8639381, 0.8446051, -0.6497784, 0, 0, 0, 1, 1,
-0.8617163, 1.741102, 0.3739232, 0, 0, 0, 1, 1,
-0.8585997, 0.1398446, -2.075472, 0, 0, 0, 1, 1,
-0.8568512, 0.9435382, -0.4133824, 1, 1, 1, 1, 1,
-0.8506362, 0.7332646, -1.066889, 1, 1, 1, 1, 1,
-0.8465769, -0.9986633, -0.9785494, 1, 1, 1, 1, 1,
-0.8439512, 0.4267071, 0.1745905, 1, 1, 1, 1, 1,
-0.8395594, -1.50967, -4.323035, 1, 1, 1, 1, 1,
-0.8385669, 0.624108, -1.182463, 1, 1, 1, 1, 1,
-0.83802, 1.475076, -0.086203, 1, 1, 1, 1, 1,
-0.8313925, -1.258493, -3.016296, 1, 1, 1, 1, 1,
-0.8304152, -0.2662235, -0.07172293, 1, 1, 1, 1, 1,
-0.8128976, 2.333437, -0.2290758, 1, 1, 1, 1, 1,
-0.8117352, -1.15061, -2.88538, 1, 1, 1, 1, 1,
-0.8114712, 1.532161, -0.1851974, 1, 1, 1, 1, 1,
-0.8056536, -0.34316, -1.455772, 1, 1, 1, 1, 1,
-0.804487, -1.239397, -4.081428, 1, 1, 1, 1, 1,
-0.7994107, -0.6617231, -1.342628, 1, 1, 1, 1, 1,
-0.7959626, -1.370948, -1.255159, 0, 0, 1, 1, 1,
-0.7926312, -0.1148671, -1.904809, 1, 0, 0, 1, 1,
-0.7901632, 0.3532546, -0.9037073, 1, 0, 0, 1, 1,
-0.7890726, -0.5921153, -2.382416, 1, 0, 0, 1, 1,
-0.7873202, -1.047734, -1.804982, 1, 0, 0, 1, 1,
-0.7859858, -0.3620623, -2.326166, 1, 0, 0, 1, 1,
-0.7817884, -1.989971, -3.863959, 0, 0, 0, 1, 1,
-0.7725551, 0.2132121, -0.7749984, 0, 0, 0, 1, 1,
-0.7633258, 0.4734259, -1.971463, 0, 0, 0, 1, 1,
-0.7631326, -1.601311, -2.339391, 0, 0, 0, 1, 1,
-0.7608735, 2.010962, -1.527753, 0, 0, 0, 1, 1,
-0.7549126, -1.411772, -2.119621, 0, 0, 0, 1, 1,
-0.7522636, 0.7205678, -1.273107, 0, 0, 0, 1, 1,
-0.7472243, -1.321767, -3.436849, 1, 1, 1, 1, 1,
-0.7444252, -0.8482344, -1.531586, 1, 1, 1, 1, 1,
-0.7420456, -0.9503182, -2.287608, 1, 1, 1, 1, 1,
-0.7401198, 0.1714219, -1.338219, 1, 1, 1, 1, 1,
-0.7349538, -0.09141033, 0.03994516, 1, 1, 1, 1, 1,
-0.7345231, 0.5382659, -0.4976173, 1, 1, 1, 1, 1,
-0.7297541, -1.366264, -2.241601, 1, 1, 1, 1, 1,
-0.7282667, 0.4233809, -0.4502387, 1, 1, 1, 1, 1,
-0.7277485, 0.4439887, -0.3559819, 1, 1, 1, 1, 1,
-0.7262585, 0.2829118, -1.574371, 1, 1, 1, 1, 1,
-0.7251707, -2.255888, -2.164448, 1, 1, 1, 1, 1,
-0.7242392, -1.48599, -1.523256, 1, 1, 1, 1, 1,
-0.7241504, -0.3105998, -0.3452643, 1, 1, 1, 1, 1,
-0.7207354, 0.6337478, -0.3057817, 1, 1, 1, 1, 1,
-0.7181651, -0.4766873, -4.099746, 1, 1, 1, 1, 1,
-0.7165374, -0.3770223, -3.67864, 0, 0, 1, 1, 1,
-0.7063158, 0.3795927, -0.5179187, 1, 0, 0, 1, 1,
-0.7041883, 1.454477, -0.8720909, 1, 0, 0, 1, 1,
-0.7020586, -1.278473, -3.783853, 1, 0, 0, 1, 1,
-0.7014299, -1.059509, -3.131082, 1, 0, 0, 1, 1,
-0.6967278, 1.260898, -0.4386167, 1, 0, 0, 1, 1,
-0.6951932, -0.7782549, -1.633646, 0, 0, 0, 1, 1,
-0.6943459, 0.5876409, -1.182572, 0, 0, 0, 1, 1,
-0.6939668, 1.527628, -2.189352, 0, 0, 0, 1, 1,
-0.6770746, -0.5081121, -1.231415, 0, 0, 0, 1, 1,
-0.6691982, 1.078542, -0.02455801, 0, 0, 0, 1, 1,
-0.6691529, -0.2295083, -1.254781, 0, 0, 0, 1, 1,
-0.6684305, 2.579983, 1.733226, 0, 0, 0, 1, 1,
-0.6678278, -0.1840858, -2.625952, 1, 1, 1, 1, 1,
-0.6645079, -0.6749394, -1.898481, 1, 1, 1, 1, 1,
-0.6568542, 0.9867321, -1.388943, 1, 1, 1, 1, 1,
-0.6502208, 1.798467, -0.7624385, 1, 1, 1, 1, 1,
-0.6496509, -0.5439354, -2.408577, 1, 1, 1, 1, 1,
-0.6484149, 0.6063584, -1.24123, 1, 1, 1, 1, 1,
-0.6476532, -0.03273657, -1.593911, 1, 1, 1, 1, 1,
-0.6473047, 0.122295, -1.501631, 1, 1, 1, 1, 1,
-0.6459342, -0.03763826, -2.154067, 1, 1, 1, 1, 1,
-0.6450437, 0.1550924, -2.168141, 1, 1, 1, 1, 1,
-0.642619, 0.9897897, 1.132466, 1, 1, 1, 1, 1,
-0.6402802, 0.01076584, -2.298455, 1, 1, 1, 1, 1,
-0.6376709, 0.4542439, -1.831396, 1, 1, 1, 1, 1,
-0.6363127, -0.3027222, -2.679707, 1, 1, 1, 1, 1,
-0.6311515, 0.8179018, 0.2926229, 1, 1, 1, 1, 1,
-0.6290097, 0.8590529, -1.175855, 0, 0, 1, 1, 1,
-0.6267698, -0.3403865, -2.314384, 1, 0, 0, 1, 1,
-0.6227476, 0.9372504, -1.484846, 1, 0, 0, 1, 1,
-0.6181459, 0.7556858, -0.4628867, 1, 0, 0, 1, 1,
-0.6041128, -0.01190941, 0.7313693, 1, 0, 0, 1, 1,
-0.5988892, 2.075436, 0.1889167, 1, 0, 0, 1, 1,
-0.5921604, 1.201792, -2.370948, 0, 0, 0, 1, 1,
-0.5865848, -0.4155238, -0.9656712, 0, 0, 0, 1, 1,
-0.5855134, 0.9434168, -0.2827581, 0, 0, 0, 1, 1,
-0.5854251, -0.4782495, -3.500743, 0, 0, 0, 1, 1,
-0.5829183, 1.53417, 0.01458643, 0, 0, 0, 1, 1,
-0.5827568, -0.0186307, -1.42762, 0, 0, 0, 1, 1,
-0.5784478, -0.6574869, -3.003594, 0, 0, 0, 1, 1,
-0.5770005, -1.210039, -3.980992, 1, 1, 1, 1, 1,
-0.5769425, 0.7858512, -1.686305, 1, 1, 1, 1, 1,
-0.5759227, 0.1728818, -1.114266, 1, 1, 1, 1, 1,
-0.5726569, 0.4435964, -1.039074, 1, 1, 1, 1, 1,
-0.5707611, 0.3177584, -1.288786, 1, 1, 1, 1, 1,
-0.5707496, 0.6804596, -0.8526353, 1, 1, 1, 1, 1,
-0.5674039, -0.4188271, -2.584568, 1, 1, 1, 1, 1,
-0.5624585, 2.41987, 1.658589, 1, 1, 1, 1, 1,
-0.5606467, -1.053573, -0.8866155, 1, 1, 1, 1, 1,
-0.5563576, 0.6623054, -0.8886471, 1, 1, 1, 1, 1,
-0.5554413, -0.5449938, -2.087307, 1, 1, 1, 1, 1,
-0.5525008, -0.4997073, -3.26172, 1, 1, 1, 1, 1,
-0.5443817, 1.983037, -0.3785598, 1, 1, 1, 1, 1,
-0.5438364, -0.1929601, -2.397281, 1, 1, 1, 1, 1,
-0.5256361, -0.8308739, -1.269437, 1, 1, 1, 1, 1,
-0.5227208, -0.6170846, -2.108175, 0, 0, 1, 1, 1,
-0.5224282, -0.7295237, -3.459393, 1, 0, 0, 1, 1,
-0.5133039, 1.099353, -1.420683, 1, 0, 0, 1, 1,
-0.5106202, 0.9271129, -0.6764984, 1, 0, 0, 1, 1,
-0.5090935, 0.7297975, -1.644281, 1, 0, 0, 1, 1,
-0.5025904, -1.513289, -2.506466, 1, 0, 0, 1, 1,
-0.5000815, 0.614458, 0.4607534, 0, 0, 0, 1, 1,
-0.4983965, 0.6368668, -0.8897616, 0, 0, 0, 1, 1,
-0.4981215, 1.596987, -0.002511049, 0, 0, 0, 1, 1,
-0.4901412, 1.607136, -0.9629905, 0, 0, 0, 1, 1,
-0.4898537, 0.7871113, -0.5643645, 0, 0, 0, 1, 1,
-0.4897193, -0.626876, -2.813015, 0, 0, 0, 1, 1,
-0.4875033, 1.065239, -0.3727425, 0, 0, 0, 1, 1,
-0.4846239, 0.3402897, -0.719453, 1, 1, 1, 1, 1,
-0.4845195, -0.4775749, -1.527057, 1, 1, 1, 1, 1,
-0.4838211, -1.870464, -2.854039, 1, 1, 1, 1, 1,
-0.4826427, -0.9951982, -1.93853, 1, 1, 1, 1, 1,
-0.4735015, 0.6036662, -1.466449, 1, 1, 1, 1, 1,
-0.4723114, -1.631395, -2.728141, 1, 1, 1, 1, 1,
-0.4722476, 0.4739944, 0.6127107, 1, 1, 1, 1, 1,
-0.4685667, -1.469741, -3.542056, 1, 1, 1, 1, 1,
-0.468504, 0.03077627, -2.464953, 1, 1, 1, 1, 1,
-0.4654165, -0.7981121, -2.046854, 1, 1, 1, 1, 1,
-0.4618801, 1.084144, 1.530409, 1, 1, 1, 1, 1,
-0.4591813, -0.4819658, -4.492207, 1, 1, 1, 1, 1,
-0.4528136, -1.078985, -4.586198, 1, 1, 1, 1, 1,
-0.4514171, 0.1627768, -2.280751, 1, 1, 1, 1, 1,
-0.4482981, 0.158824, -1.266261, 1, 1, 1, 1, 1,
-0.4474963, -1.478932, -2.968266, 0, 0, 1, 1, 1,
-0.4470347, 1.557353, -1.27397, 1, 0, 0, 1, 1,
-0.4467039, 0.1222619, -1.03391, 1, 0, 0, 1, 1,
-0.4461462, -0.74445, -3.180173, 1, 0, 0, 1, 1,
-0.4450217, 0.5360824, -0.9725478, 1, 0, 0, 1, 1,
-0.442185, 2.080772, -0.97925, 1, 0, 0, 1, 1,
-0.4411303, 0.239697, -2.323195, 0, 0, 0, 1, 1,
-0.4343433, 0.8048131, -0.4083264, 0, 0, 0, 1, 1,
-0.4280118, -0.3765843, -1.920714, 0, 0, 0, 1, 1,
-0.426034, -0.6347646, -1.686748, 0, 0, 0, 1, 1,
-0.4235574, -0.6724979, -1.686543, 0, 0, 0, 1, 1,
-0.4234425, 0.9210492, -2.477693, 0, 0, 0, 1, 1,
-0.4220644, 1.012694, -0.8573527, 0, 0, 0, 1, 1,
-0.4208252, -0.08481133, -2.731167, 1, 1, 1, 1, 1,
-0.4196423, -1.219161, -1.68382, 1, 1, 1, 1, 1,
-0.4180994, -1.496862, -2.847658, 1, 1, 1, 1, 1,
-0.4123985, -0.558533, -1.850141, 1, 1, 1, 1, 1,
-0.405924, -1.241418, -1.619887, 1, 1, 1, 1, 1,
-0.4055898, -1.198793, -2.983248, 1, 1, 1, 1, 1,
-0.3998958, 0.9365435, -1.988384, 1, 1, 1, 1, 1,
-0.3978422, 0.6726278, -0.2623318, 1, 1, 1, 1, 1,
-0.3955154, 0.7744607, 0.6607877, 1, 1, 1, 1, 1,
-0.3941737, 0.5989498, -1.42791, 1, 1, 1, 1, 1,
-0.3933773, 0.6356838, -1.528661, 1, 1, 1, 1, 1,
-0.3840258, 0.4958423, -0.6703651, 1, 1, 1, 1, 1,
-0.3808822, -2.74509, -3.695501, 1, 1, 1, 1, 1,
-0.3804837, -1.317588, -1.699635, 1, 1, 1, 1, 1,
-0.3722647, 0.8516123, 1.314104, 1, 1, 1, 1, 1,
-0.3665265, -1.502704, -2.420787, 0, 0, 1, 1, 1,
-0.3638863, 1.492392, -0.4898293, 1, 0, 0, 1, 1,
-0.3618986, -0.5497549, -1.578158, 1, 0, 0, 1, 1,
-0.3617126, 0.8755516, 0.9227406, 1, 0, 0, 1, 1,
-0.3613967, 0.8952999, -0.9176897, 1, 0, 0, 1, 1,
-0.3612606, 1.101068, 1.184589, 1, 0, 0, 1, 1,
-0.3604077, 0.4285798, 0.9415885, 0, 0, 0, 1, 1,
-0.3594416, 0.1295864, -0.621882, 0, 0, 0, 1, 1,
-0.3588842, -0.4415937, -4.279162, 0, 0, 0, 1, 1,
-0.357546, 1.489415, -0.8267846, 0, 0, 0, 1, 1,
-0.3555883, -2.606448, -3.779628, 0, 0, 0, 1, 1,
-0.3530833, 1.023586, 0.4866961, 0, 0, 0, 1, 1,
-0.352273, -0.6970184, -1.947587, 0, 0, 0, 1, 1,
-0.3517887, -0.3194961, -1.469427, 1, 1, 1, 1, 1,
-0.3470735, 1.044361, -0.4996629, 1, 1, 1, 1, 1,
-0.344341, -1.528088, -3.228924, 1, 1, 1, 1, 1,
-0.343979, 0.9747759, -0.1345119, 1, 1, 1, 1, 1,
-0.3436111, 0.4887585, 0.6843162, 1, 1, 1, 1, 1,
-0.3403438, 0.626633, 0.2570638, 1, 1, 1, 1, 1,
-0.335969, -0.377055, -3.276508, 1, 1, 1, 1, 1,
-0.3323796, -1.687693, -1.623977, 1, 1, 1, 1, 1,
-0.3272985, 0.4285994, -1.604901, 1, 1, 1, 1, 1,
-0.3245376, 0.59662, 0.5006353, 1, 1, 1, 1, 1,
-0.3147095, 1.734408, -2.541475, 1, 1, 1, 1, 1,
-0.3139766, 1.251982, 0.4436406, 1, 1, 1, 1, 1,
-0.313114, -0.4004278, -1.286954, 1, 1, 1, 1, 1,
-0.3080875, 0.5967391, -0.1602046, 1, 1, 1, 1, 1,
-0.3063281, -0.794242, -3.878583, 1, 1, 1, 1, 1,
-0.3026018, 1.818052, 1.187808, 0, 0, 1, 1, 1,
-0.2971671, 0.5016981, -2.618437, 1, 0, 0, 1, 1,
-0.296976, -0.6111797, -3.611588, 1, 0, 0, 1, 1,
-0.2966839, 0.0172016, -1.491374, 1, 0, 0, 1, 1,
-0.2962784, 0.1445942, -0.6694526, 1, 0, 0, 1, 1,
-0.2959003, 1.292569, 1.375918, 1, 0, 0, 1, 1,
-0.2892121, 1.305663, 0.8763167, 0, 0, 0, 1, 1,
-0.2866487, 0.5886741, -1.93823, 0, 0, 0, 1, 1,
-0.2814446, 0.5951599, 1.131539, 0, 0, 0, 1, 1,
-0.2808372, -0.000216512, -1.438676, 0, 0, 0, 1, 1,
-0.2774827, 1.818149, -1.300574, 0, 0, 0, 1, 1,
-0.2773166, -0.9759403, -2.854964, 0, 0, 0, 1, 1,
-0.2754709, 0.7396382, 0.6957721, 0, 0, 0, 1, 1,
-0.2749669, -1.059006, -4.303946, 1, 1, 1, 1, 1,
-0.2741207, 1.03111, -0.2931357, 1, 1, 1, 1, 1,
-0.2740935, 1.326009, -0.704673, 1, 1, 1, 1, 1,
-0.2718236, -0.4054668, -3.264672, 1, 1, 1, 1, 1,
-0.2705153, -0.9978005, -1.202713, 1, 1, 1, 1, 1,
-0.2702045, -0.7995905, -2.202561, 1, 1, 1, 1, 1,
-0.2699932, -0.5220473, -1.992691, 1, 1, 1, 1, 1,
-0.2697952, 0.4615881, -0.0555986, 1, 1, 1, 1, 1,
-0.265274, -0.3433748, -0.8878856, 1, 1, 1, 1, 1,
-0.2622429, 0.5445755, -0.2329905, 1, 1, 1, 1, 1,
-0.2539668, -1.070298, -0.4704169, 1, 1, 1, 1, 1,
-0.2524898, 1.327455, -1.16627, 1, 1, 1, 1, 1,
-0.2511139, 0.7181845, -1.372535, 1, 1, 1, 1, 1,
-0.2500355, -1.238782, -3.316411, 1, 1, 1, 1, 1,
-0.2495393, -0.5316795, -4.105227, 1, 1, 1, 1, 1,
-0.2485441, -0.6554233, -2.636554, 0, 0, 1, 1, 1,
-0.2466026, -0.3389021, -3.247678, 1, 0, 0, 1, 1,
-0.2454373, -0.5695866, -2.479695, 1, 0, 0, 1, 1,
-0.2453311, 1.991819, -0.5261565, 1, 0, 0, 1, 1,
-0.2430916, -0.8455957, -2.348315, 1, 0, 0, 1, 1,
-0.2429853, -0.423042, -1.485327, 1, 0, 0, 1, 1,
-0.2424727, -1.955574, -2.851465, 0, 0, 0, 1, 1,
-0.2347114, -0.1051066, -0.7758371, 0, 0, 0, 1, 1,
-0.2342379, 0.01763248, -1.42067, 0, 0, 0, 1, 1,
-0.2339451, 1.028675, -0.4470466, 0, 0, 0, 1, 1,
-0.2332449, 2.525895, 0.9747735, 0, 0, 0, 1, 1,
-0.2296335, 0.3628827, -1.038938, 0, 0, 0, 1, 1,
-0.2267158, -1.580024, -3.937411, 0, 0, 0, 1, 1,
-0.226258, 1.680703, -1.808202, 1, 1, 1, 1, 1,
-0.2226736, 0.2369769, 0.6674789, 1, 1, 1, 1, 1,
-0.2216771, 1.191116, 0.1591628, 1, 1, 1, 1, 1,
-0.2189827, -0.728802, -2.335722, 1, 1, 1, 1, 1,
-0.218166, 0.6479398, 0.5942346, 1, 1, 1, 1, 1,
-0.2163226, -0.7734371, -2.598387, 1, 1, 1, 1, 1,
-0.211997, -0.001243325, -3.372685, 1, 1, 1, 1, 1,
-0.2050727, -0.2492746, -4.451928, 1, 1, 1, 1, 1,
-0.20371, -1.065783, -2.347885, 1, 1, 1, 1, 1,
-0.2010054, -0.1779291, -2.184832, 1, 1, 1, 1, 1,
-0.1991452, 0.2877184, -0.507834, 1, 1, 1, 1, 1,
-0.1952791, 0.008289889, -1.140766, 1, 1, 1, 1, 1,
-0.193064, 0.1260921, 0.3925769, 1, 1, 1, 1, 1,
-0.1920442, -2.375475, -2.655787, 1, 1, 1, 1, 1,
-0.1897009, -0.4880387, -2.963941, 1, 1, 1, 1, 1,
-0.1884686, 1.186814, 1.564433, 0, 0, 1, 1, 1,
-0.1875431, -0.2309648, -1.7385, 1, 0, 0, 1, 1,
-0.1868226, 0.5037194, -0.2851519, 1, 0, 0, 1, 1,
-0.1852516, -0.4462719, -3.549129, 1, 0, 0, 1, 1,
-0.1838834, 1.563243, -1.170959, 1, 0, 0, 1, 1,
-0.1819609, -0.5636842, -3.180659, 1, 0, 0, 1, 1,
-0.1801122, 0.4973947, -1.404015, 0, 0, 0, 1, 1,
-0.1734707, -0.5382931, -4.150645, 0, 0, 0, 1, 1,
-0.1717549, -0.1405959, -0.02416197, 0, 0, 0, 1, 1,
-0.1685616, -0.6020294, -1.271027, 0, 0, 0, 1, 1,
-0.1650018, -1.93469, -2.909535, 0, 0, 0, 1, 1,
-0.1634797, -0.657222, -2.903758, 0, 0, 0, 1, 1,
-0.1624536, -0.5463978, -3.398062, 0, 0, 0, 1, 1,
-0.1501566, -0.2981269, -1.689632, 1, 1, 1, 1, 1,
-0.1420055, 1.311376, -0.4308674, 1, 1, 1, 1, 1,
-0.1417351, -0.07180553, -3.492394, 1, 1, 1, 1, 1,
-0.1413664, -0.4818361, -3.808388, 1, 1, 1, 1, 1,
-0.1397835, -0.05941185, -1.668143, 1, 1, 1, 1, 1,
-0.135557, 0.6565709, -0.8143137, 1, 1, 1, 1, 1,
-0.1287151, -1.791314, -5.239576, 1, 1, 1, 1, 1,
-0.1258894, 1.205479, 1.110331, 1, 1, 1, 1, 1,
-0.1192606, 0.3772779, 0.3228429, 1, 1, 1, 1, 1,
-0.1165102, 2.225513, -0.398024, 1, 1, 1, 1, 1,
-0.1159549, 1.269348, 2.218261, 1, 1, 1, 1, 1,
-0.1150151, 0.7063143, 0.8057495, 1, 1, 1, 1, 1,
-0.1145081, 1.807471, 0.5552357, 1, 1, 1, 1, 1,
-0.1076324, 0.8970872, -1.666677, 1, 1, 1, 1, 1,
-0.1063358, -0.2417988, -1.475194, 1, 1, 1, 1, 1,
-0.09985184, -2.348357, -1.364424, 0, 0, 1, 1, 1,
-0.09620752, -0.1704858, -2.813213, 1, 0, 0, 1, 1,
-0.09540568, 0.01807116, -2.90148, 1, 0, 0, 1, 1,
-0.09112501, 0.1194287, 0.2791414, 1, 0, 0, 1, 1,
-0.08755415, 1.560441, 0.9897271, 1, 0, 0, 1, 1,
-0.08708309, 0.9342859, 0.8025448, 1, 0, 0, 1, 1,
-0.08610819, -0.4483616, -2.118757, 0, 0, 0, 1, 1,
-0.08531617, -0.03027784, -1.63676, 0, 0, 0, 1, 1,
-0.08179826, 0.3057127, -0.8953481, 0, 0, 0, 1, 1,
-0.08080948, -1.2191, -1.817349, 0, 0, 0, 1, 1,
-0.08008659, 1.117196, -2.079326, 0, 0, 0, 1, 1,
-0.07456399, 0.8597248, -1.138106, 0, 0, 0, 1, 1,
-0.07341921, 0.6970645, -0.7351781, 0, 0, 0, 1, 1,
-0.06670974, 1.764962, 0.7153089, 1, 1, 1, 1, 1,
-0.06635597, -1.347553, -2.717581, 1, 1, 1, 1, 1,
-0.06230606, 0.3502438, -0.2846902, 1, 1, 1, 1, 1,
-0.06230149, 0.3264329, -0.01853562, 1, 1, 1, 1, 1,
-0.05773006, -1.104727, -2.531489, 1, 1, 1, 1, 1,
-0.0574451, -0.3764348, -2.237417, 1, 1, 1, 1, 1,
-0.05461124, -0.907273, -3.359342, 1, 1, 1, 1, 1,
-0.05374782, 0.3574525, -0.532062, 1, 1, 1, 1, 1,
-0.05132976, 1.012467, -1.473742, 1, 1, 1, 1, 1,
-0.05110131, -0.02999103, -1.4423, 1, 1, 1, 1, 1,
-0.04695659, -0.7814914, -4.041111, 1, 1, 1, 1, 1,
-0.04581895, -0.9734703, -3.123276, 1, 1, 1, 1, 1,
-0.04546562, 1.37233, 1.021901, 1, 1, 1, 1, 1,
-0.04541283, 1.293503, -1.028422, 1, 1, 1, 1, 1,
-0.04498868, 0.1854088, 0.1639754, 1, 1, 1, 1, 1,
-0.04240736, 0.5807564, 0.367803, 0, 0, 1, 1, 1,
-0.04227162, -0.9094929, -2.382187, 1, 0, 0, 1, 1,
-0.04017949, 0.04516358, -1.268186, 1, 0, 0, 1, 1,
-0.0387134, 0.7370815, 0.4906291, 1, 0, 0, 1, 1,
-0.03786158, -1.724929, -1.703328, 1, 0, 0, 1, 1,
-0.03663263, 0.4498425, -1.301806, 1, 0, 0, 1, 1,
-0.03595448, -0.2918191, -3.320637, 0, 0, 0, 1, 1,
-0.03477626, 0.9565992, -1.00374, 0, 0, 0, 1, 1,
-0.03138907, -1.275246, -2.698498, 0, 0, 0, 1, 1,
-0.02924449, 0.5554339, -0.2976453, 0, 0, 0, 1, 1,
-0.02774626, 0.147676, 0.3856219, 0, 0, 0, 1, 1,
-0.02705381, -1.515204, -4.471918, 0, 0, 0, 1, 1,
-0.02556171, -0.5564328, -5.491827, 0, 0, 0, 1, 1,
-0.02437594, 1.127855, 0.2039152, 1, 1, 1, 1, 1,
-0.02239036, -1.083958, -2.139941, 1, 1, 1, 1, 1,
-0.02211414, 1.439082, -0.5211481, 1, 1, 1, 1, 1,
-0.01930261, -0.3703458, -0.8448608, 1, 1, 1, 1, 1,
-0.01458817, -0.923492, -1.156136, 1, 1, 1, 1, 1,
-0.01418777, -1.05639, -2.324312, 1, 1, 1, 1, 1,
-0.0137945, 1.615554, 0.293672, 1, 1, 1, 1, 1,
-0.01322485, 1.072126, -1.509862, 1, 1, 1, 1, 1,
-0.007775412, 0.4635072, -0.9077155, 1, 1, 1, 1, 1,
-0.007143525, 0.3017431, 0.452606, 1, 1, 1, 1, 1,
-0.004575101, 0.01532781, -0.08470314, 1, 1, 1, 1, 1,
-0.001908194, 2.116474, -0.1465963, 1, 1, 1, 1, 1,
0.001444127, -0.2497611, 4.108117, 1, 1, 1, 1, 1,
0.003486726, -0.5377658, 3.923558, 1, 1, 1, 1, 1,
0.01067596, -0.6506994, 3.604101, 1, 1, 1, 1, 1,
0.01235543, 0.5021166, -0.4781087, 0, 0, 1, 1, 1,
0.01992982, -0.6963324, 3.927954, 1, 0, 0, 1, 1,
0.02460414, 1.536139, 0.04204226, 1, 0, 0, 1, 1,
0.02558485, 1.093109, -0.5097463, 1, 0, 0, 1, 1,
0.02656705, 0.1500694, -1.216562, 1, 0, 0, 1, 1,
0.03595856, 1.233206, -1.458291, 1, 0, 0, 1, 1,
0.0399703, 0.2595489, 2.364503, 0, 0, 0, 1, 1,
0.04065665, 0.4482483, 0.6289226, 0, 0, 0, 1, 1,
0.04310219, -1.723986, 3.759678, 0, 0, 0, 1, 1,
0.04574636, 0.6609148, 0.8132377, 0, 0, 0, 1, 1,
0.04955954, -1.776562, 2.405289, 0, 0, 0, 1, 1,
0.05129663, -0.4318906, 3.651788, 0, 0, 0, 1, 1,
0.05328497, -1.531709, 2.743106, 0, 0, 0, 1, 1,
0.05685442, -0.4696947, 3.778459, 1, 1, 1, 1, 1,
0.05771697, -0.5058168, 3.232648, 1, 1, 1, 1, 1,
0.05848698, 0.09237536, 2.138556, 1, 1, 1, 1, 1,
0.0617579, -0.5030555, 1.600462, 1, 1, 1, 1, 1,
0.06408093, -0.7148668, 1.056635, 1, 1, 1, 1, 1,
0.07889054, 1.714164, -0.6321931, 1, 1, 1, 1, 1,
0.08343721, -0.9659085, 2.585022, 1, 1, 1, 1, 1,
0.08547167, 1.094941, 0.1371614, 1, 1, 1, 1, 1,
0.08982319, 0.2989733, 1.485443, 1, 1, 1, 1, 1,
0.09499019, -1.705139, 4.325308, 1, 1, 1, 1, 1,
0.09690946, -1.276884, 3.667577, 1, 1, 1, 1, 1,
0.1056458, 0.3636049, -0.8170453, 1, 1, 1, 1, 1,
0.1075676, 1.252403, 0.5513124, 1, 1, 1, 1, 1,
0.1088868, -0.6830946, 2.159085, 1, 1, 1, 1, 1,
0.1123313, -1.159122, 1.229366, 1, 1, 1, 1, 1,
0.1159034, 0.5278203, -1.789662, 0, 0, 1, 1, 1,
0.1177419, -2.071758, 4.524319, 1, 0, 0, 1, 1,
0.1189297, 0.5802726, 1.016688, 1, 0, 0, 1, 1,
0.1215911, 1.213199, -0.4545397, 1, 0, 0, 1, 1,
0.1249087, 0.5900769, -0.2028636, 1, 0, 0, 1, 1,
0.1255106, -0.8893271, 1.635659, 1, 0, 0, 1, 1,
0.1370461, 0.4847984, 1.684004, 0, 0, 0, 1, 1,
0.1388685, -0.6515601, 3.082554, 0, 0, 0, 1, 1,
0.1405464, -0.3247321, 1.498245, 0, 0, 0, 1, 1,
0.1418837, 1.785837, 1.511333, 0, 0, 0, 1, 1,
0.1455777, 0.2211526, 0.3108309, 0, 0, 0, 1, 1,
0.1496202, 1.745725, 1.382457, 0, 0, 0, 1, 1,
0.1502807, -0.4133596, 2.366586, 0, 0, 0, 1, 1,
0.1527447, -1.358529, 1.889824, 1, 1, 1, 1, 1,
0.1536832, -1.344517, 1.997231, 1, 1, 1, 1, 1,
0.1537327, -1.791135, 3.45456, 1, 1, 1, 1, 1,
0.1559156, -1.361107, 3.15477, 1, 1, 1, 1, 1,
0.1585953, 0.8080696, 0.1259455, 1, 1, 1, 1, 1,
0.1613064, -1.055833, 3.881101, 1, 1, 1, 1, 1,
0.1638257, -1.541729, 3.116398, 1, 1, 1, 1, 1,
0.1644347, -0.1403174, 2.827124, 1, 1, 1, 1, 1,
0.1664114, -0.3500649, 3.44489, 1, 1, 1, 1, 1,
0.1674115, 0.1295637, 0.9921854, 1, 1, 1, 1, 1,
0.169329, 0.4342313, 0.2548842, 1, 1, 1, 1, 1,
0.1711051, -1.398611, 3.306004, 1, 1, 1, 1, 1,
0.1750378, -1.479161, 3.876841, 1, 1, 1, 1, 1,
0.1751826, -0.6476151, 3.224862, 1, 1, 1, 1, 1,
0.1834989, -1.084228, 2.240788, 1, 1, 1, 1, 1,
0.1864713, -0.2498581, 1.939088, 0, 0, 1, 1, 1,
0.18871, -0.487189, 2.779263, 1, 0, 0, 1, 1,
0.193107, 0.06315815, 0.9401804, 1, 0, 0, 1, 1,
0.1968739, -0.7183887, 2.288096, 1, 0, 0, 1, 1,
0.1969359, 0.04450589, 1.892847, 1, 0, 0, 1, 1,
0.198337, 0.5923147, 0.744538, 1, 0, 0, 1, 1,
0.1996988, 0.9481096, 1.536752, 0, 0, 0, 1, 1,
0.201248, -1.843289, 0.9371985, 0, 0, 0, 1, 1,
0.2015718, 0.5240548, 0.5760399, 0, 0, 0, 1, 1,
0.2016385, -0.339843, 3.464148, 0, 0, 0, 1, 1,
0.2038813, -0.4691268, 3.29115, 0, 0, 0, 1, 1,
0.2068549, 0.4967456, 0.5814779, 0, 0, 0, 1, 1,
0.2083585, 0.1789831, 3.160145, 0, 0, 0, 1, 1,
0.209963, -0.3120778, 2.067799, 1, 1, 1, 1, 1,
0.2150417, 1.158275, -0.8665096, 1, 1, 1, 1, 1,
0.215733, 0.7192072, 0.1092182, 1, 1, 1, 1, 1,
0.2201198, 0.7205228, -0.7399586, 1, 1, 1, 1, 1,
0.2218791, 0.2339931, 1.618556, 1, 1, 1, 1, 1,
0.2319681, -0.2539438, 2.423423, 1, 1, 1, 1, 1,
0.2357455, -1.76178, 2.527076, 1, 1, 1, 1, 1,
0.2387343, -2.962265, 2.41495, 1, 1, 1, 1, 1,
0.240382, -1.357171, 2.411406, 1, 1, 1, 1, 1,
0.2420552, 1.402896, -0.6071146, 1, 1, 1, 1, 1,
0.2443309, 0.4141158, 0.3896765, 1, 1, 1, 1, 1,
0.2448282, -0.6470701, 3.454403, 1, 1, 1, 1, 1,
0.2461057, 1.357149, 0.1735753, 1, 1, 1, 1, 1,
0.2465338, -0.8941988, 4.210382, 1, 1, 1, 1, 1,
0.2485948, -0.3718236, 3.376275, 1, 1, 1, 1, 1,
0.2509497, 0.4034289, 0.8711292, 0, 0, 1, 1, 1,
0.2530626, -0.3613554, 2.800237, 1, 0, 0, 1, 1,
0.265013, -0.04224927, 1.355993, 1, 0, 0, 1, 1,
0.2681006, 0.4218428, 0.1813195, 1, 0, 0, 1, 1,
0.2696598, 0.09344608, 0.3875901, 1, 0, 0, 1, 1,
0.2703999, 0.01204704, 2.43366, 1, 0, 0, 1, 1,
0.2726312, 2.058745, -0.4913439, 0, 0, 0, 1, 1,
0.282253, 0.4318079, -1.749866, 0, 0, 0, 1, 1,
0.2896244, -1.340272, 2.264131, 0, 0, 0, 1, 1,
0.2916435, -0.4970457, 3.548656, 0, 0, 0, 1, 1,
0.3042993, 0.8978265, 0.3698655, 0, 0, 0, 1, 1,
0.3056356, -2.070062, 0.6171693, 0, 0, 0, 1, 1,
0.3057892, 0.202782, 0.7704965, 0, 0, 0, 1, 1,
0.3070265, 1.416456, -0.504616, 1, 1, 1, 1, 1,
0.307245, 0.8859729, 0.8602474, 1, 1, 1, 1, 1,
0.3080801, -0.8692082, 1.7458, 1, 1, 1, 1, 1,
0.3109097, 0.4525466, 1.894856, 1, 1, 1, 1, 1,
0.3133217, 0.601283, 1.267025, 1, 1, 1, 1, 1,
0.3152639, 0.6581271, 0.7733363, 1, 1, 1, 1, 1,
0.3205006, 1.338209, -1.387175, 1, 1, 1, 1, 1,
0.3230352, -0.5202434, 2.892484, 1, 1, 1, 1, 1,
0.3236502, -0.09728108, 0.6854646, 1, 1, 1, 1, 1,
0.3261357, -0.958923, 2.510667, 1, 1, 1, 1, 1,
0.3262558, -0.1501203, 4.719301, 1, 1, 1, 1, 1,
0.3293768, 0.8213401, 0.1263158, 1, 1, 1, 1, 1,
0.3298928, -0.3469745, 2.859621, 1, 1, 1, 1, 1,
0.3339171, 0.9217265, -0.1913402, 1, 1, 1, 1, 1,
0.3392811, -0.07835354, 1.723907, 1, 1, 1, 1, 1,
0.3402106, -0.289019, 4.100004, 0, 0, 1, 1, 1,
0.342462, -0.4375879, 3.074497, 1, 0, 0, 1, 1,
0.3437933, 0.7074836, -0.3124711, 1, 0, 0, 1, 1,
0.3472382, -0.6272559, 3.40687, 1, 0, 0, 1, 1,
0.3473997, -0.02520083, 1.677622, 1, 0, 0, 1, 1,
0.3544611, -0.2800491, 1.68474, 1, 0, 0, 1, 1,
0.3576131, -0.5728348, 4.153625, 0, 0, 0, 1, 1,
0.360473, 1.761194, 0.03346607, 0, 0, 0, 1, 1,
0.3613365, -0.0775624, 2.901573, 0, 0, 0, 1, 1,
0.3670985, 2.336392, 1.452374, 0, 0, 0, 1, 1,
0.3686278, -1.72114, 3.07528, 0, 0, 0, 1, 1,
0.3823846, -0.05738079, 2.201434, 0, 0, 0, 1, 1,
0.3828083, 1.200437, 1.321084, 0, 0, 0, 1, 1,
0.3834429, 0.6466129, -0.713933, 1, 1, 1, 1, 1,
0.3878801, 0.4024018, 0.06169569, 1, 1, 1, 1, 1,
0.3899238, -0.9468079, 2.696186, 1, 1, 1, 1, 1,
0.3900025, -1.092326, 3.451071, 1, 1, 1, 1, 1,
0.3936565, 0.383032, 0.06968009, 1, 1, 1, 1, 1,
0.3946573, -0.3551886, 0.8544526, 1, 1, 1, 1, 1,
0.3956586, -0.1362838, 2.419883, 1, 1, 1, 1, 1,
0.3958801, 1.595753, 0.8345134, 1, 1, 1, 1, 1,
0.3983245, 0.4958058, 0.8710247, 1, 1, 1, 1, 1,
0.4015266, -0.7968005, 3.421566, 1, 1, 1, 1, 1,
0.4032605, -0.5326883, 1.960786, 1, 1, 1, 1, 1,
0.4093424, 0.3300119, 1.594507, 1, 1, 1, 1, 1,
0.4096894, 2.744049, 2.215496, 1, 1, 1, 1, 1,
0.4099446, -1.30959, 2.349124, 1, 1, 1, 1, 1,
0.4116349, -2.166492, 2.539788, 1, 1, 1, 1, 1,
0.4155394, 0.2357664, 0.0570248, 0, 0, 1, 1, 1,
0.4185038, 0.5206702, 0.3976586, 1, 0, 0, 1, 1,
0.4204609, -0.9473765, 1.881813, 1, 0, 0, 1, 1,
0.4283411, 1.003343, -0.1041827, 1, 0, 0, 1, 1,
0.4302733, -0.05134351, 2.654385, 1, 0, 0, 1, 1,
0.434172, 0.9127313, 0.4953864, 1, 0, 0, 1, 1,
0.434916, 0.003536057, 2.413227, 0, 0, 0, 1, 1,
0.4387482, 1.363609, 1.486602, 0, 0, 0, 1, 1,
0.4424948, -0.08059421, 0.8883722, 0, 0, 0, 1, 1,
0.452678, 0.6204056, -0.2161333, 0, 0, 0, 1, 1,
0.4548932, -0.552295, 2.970265, 0, 0, 0, 1, 1,
0.4552233, 0.7134425, 0.01172581, 0, 0, 0, 1, 1,
0.4586072, 0.3037426, 1.851177, 0, 0, 0, 1, 1,
0.4588549, 0.7431339, 0.1736747, 1, 1, 1, 1, 1,
0.4599877, -1.842362, 2.042402, 1, 1, 1, 1, 1,
0.4604191, -0.6102179, 2.477564, 1, 1, 1, 1, 1,
0.461726, -1.62463, 4.215234, 1, 1, 1, 1, 1,
0.4680134, 1.256841, 1.120471, 1, 1, 1, 1, 1,
0.4682824, -1.082888, 0.5434588, 1, 1, 1, 1, 1,
0.4714922, 0.1833282, 0.8662639, 1, 1, 1, 1, 1,
0.4740281, 0.3025182, 2.499431, 1, 1, 1, 1, 1,
0.4744017, 1.595965, 1.037259, 1, 1, 1, 1, 1,
0.4782142, 0.192341, 0.7601797, 1, 1, 1, 1, 1,
0.4822227, -0.1103012, 2.485069, 1, 1, 1, 1, 1,
0.4857655, -0.6262743, 2.547216, 1, 1, 1, 1, 1,
0.4869373, 0.137301, 1.307296, 1, 1, 1, 1, 1,
0.4877941, -0.4173184, 2.154062, 1, 1, 1, 1, 1,
0.4900493, -0.9866408, 2.600972, 1, 1, 1, 1, 1,
0.4905873, -0.3774014, 2.038147, 0, 0, 1, 1, 1,
0.4962673, 0.7475671, 0.899483, 1, 0, 0, 1, 1,
0.5007412, -0.04914235, 2.933395, 1, 0, 0, 1, 1,
0.5042176, 1.615359, -0.5079057, 1, 0, 0, 1, 1,
0.5121081, 0.4787701, 1.645251, 1, 0, 0, 1, 1,
0.5197261, 0.04037141, 1.145052, 1, 0, 0, 1, 1,
0.5212758, 0.8458996, 0.06739543, 0, 0, 0, 1, 1,
0.5242919, 0.8830764, -1.318894, 0, 0, 0, 1, 1,
0.5275816, -1.277414, 4.261951, 0, 0, 0, 1, 1,
0.5288081, -0.3993208, 1.749785, 0, 0, 0, 1, 1,
0.5295208, 0.3615545, 1.34757, 0, 0, 0, 1, 1,
0.5331142, -0.08722907, 1.544241, 0, 0, 0, 1, 1,
0.5457305, -0.5562721, 1.787552, 0, 0, 0, 1, 1,
0.5493987, -0.1661683, 1.193589, 1, 1, 1, 1, 1,
0.5526026, 0.2320334, 0.97518, 1, 1, 1, 1, 1,
0.5527113, -0.3841313, 2.218604, 1, 1, 1, 1, 1,
0.5533647, 1.41653, 1.504259, 1, 1, 1, 1, 1,
0.5541026, 0.4299456, 0.777651, 1, 1, 1, 1, 1,
0.5552781, -1.490179, 1.339788, 1, 1, 1, 1, 1,
0.5557568, -0.7309783, 2.742753, 1, 1, 1, 1, 1,
0.5596623, -0.5387915, 1.152486, 1, 1, 1, 1, 1,
0.5597137, 0.7798973, 2.428455, 1, 1, 1, 1, 1,
0.5685879, 2.177119, -1.005471, 1, 1, 1, 1, 1,
0.5712967, 1.170904, 0.03119582, 1, 1, 1, 1, 1,
0.5715746, 1.202177, 0.2351229, 1, 1, 1, 1, 1,
0.571782, -0.4444923, 2.236357, 1, 1, 1, 1, 1,
0.5748953, -0.2387742, 1.741042, 1, 1, 1, 1, 1,
0.57542, 0.1989871, 2.083588, 1, 1, 1, 1, 1,
0.5755894, -2.081025, 2.278967, 0, 0, 1, 1, 1,
0.5765817, -0.2762712, 2.032866, 1, 0, 0, 1, 1,
0.5780572, 0.8823547, -1.38674, 1, 0, 0, 1, 1,
0.5820108, -0.6724513, 2.431697, 1, 0, 0, 1, 1,
0.5926543, -0.5695729, 1.616321, 1, 0, 0, 1, 1,
0.5940133, -0.5403, 2.02467, 1, 0, 0, 1, 1,
0.5944316, 0.5899702, 0.8919067, 0, 0, 0, 1, 1,
0.5983421, -0.1418967, 1.079997, 0, 0, 0, 1, 1,
0.6048338, -1.983125, 1.991381, 0, 0, 0, 1, 1,
0.6061863, 0.7474138, -0.4149274, 0, 0, 0, 1, 1,
0.6074933, -0.7038712, 3.255563, 0, 0, 0, 1, 1,
0.6081171, -1.825409, 3.063118, 0, 0, 0, 1, 1,
0.6108246, 0.4368071, -0.7998071, 0, 0, 0, 1, 1,
0.6110396, 0.9908655, 1.04059, 1, 1, 1, 1, 1,
0.6115381, 1.344724, -2.19606, 1, 1, 1, 1, 1,
0.6232041, 0.7629008, 2.113536, 1, 1, 1, 1, 1,
0.6281506, 0.1246422, -0.1376954, 1, 1, 1, 1, 1,
0.636007, 1.436958, -0.3400162, 1, 1, 1, 1, 1,
0.6401328, 0.4933331, -1.2212, 1, 1, 1, 1, 1,
0.6419594, -0.2710014, 2.532414, 1, 1, 1, 1, 1,
0.6421512, 1.412596, 0.8340541, 1, 1, 1, 1, 1,
0.6433249, -0.9099727, 3.095584, 1, 1, 1, 1, 1,
0.645835, -1.923715, 2.587862, 1, 1, 1, 1, 1,
0.6464326, -0.1622294, 2.51033, 1, 1, 1, 1, 1,
0.6465613, -0.3852426, 1.212372, 1, 1, 1, 1, 1,
0.6620252, -0.7088427, 2.033435, 1, 1, 1, 1, 1,
0.6630551, 0.02928946, 2.691724, 1, 1, 1, 1, 1,
0.6635546, 0.1981836, 1.120187, 1, 1, 1, 1, 1,
0.6639935, -1.254469, 1.567183, 0, 0, 1, 1, 1,
0.6803383, 0.706328, -0.563203, 1, 0, 0, 1, 1,
0.6824407, -0.6986461, 2.842623, 1, 0, 0, 1, 1,
0.6869924, 2.286799, 0.1157307, 1, 0, 0, 1, 1,
0.6927861, 1.810309, -0.1940623, 1, 0, 0, 1, 1,
0.698171, -0.4195224, 1.402686, 1, 0, 0, 1, 1,
0.7006101, 0.2207062, 1.430682, 0, 0, 0, 1, 1,
0.7047136, -0.5811463, 2.054004, 0, 0, 0, 1, 1,
0.7058132, -0.3943182, 1.511269, 0, 0, 0, 1, 1,
0.7058954, -0.09430945, 1.326823, 0, 0, 0, 1, 1,
0.7062145, -0.9312872, 3.495403, 0, 0, 0, 1, 1,
0.7111331, -1.17373, 1.976789, 0, 0, 0, 1, 1,
0.711706, 0.5828569, 1.378872, 0, 0, 0, 1, 1,
0.7141973, 0.1374971, 1.994557, 1, 1, 1, 1, 1,
0.7189453, 0.4405298, 2.236641, 1, 1, 1, 1, 1,
0.7212319, 0.53588, 2.459409, 1, 1, 1, 1, 1,
0.7213033, -1.504268, 0.9437315, 1, 1, 1, 1, 1,
0.721332, 0.04363679, 2.988855, 1, 1, 1, 1, 1,
0.7225228, 0.3528845, 0.506236, 1, 1, 1, 1, 1,
0.7285573, 0.4801388, 0.9058314, 1, 1, 1, 1, 1,
0.7373729, -1.905289, 2.280116, 1, 1, 1, 1, 1,
0.7414798, -0.3400228, 1.63828, 1, 1, 1, 1, 1,
0.7497825, -0.633285, 3.509574, 1, 1, 1, 1, 1,
0.7511464, -1.062107, 2.203223, 1, 1, 1, 1, 1,
0.7513789, 0.3879917, 0.9050421, 1, 1, 1, 1, 1,
0.7524797, -0.1596467, 1.468765, 1, 1, 1, 1, 1,
0.7533988, 0.9117982, 1.679285, 1, 1, 1, 1, 1,
0.754088, 1.811275, -0.5946545, 1, 1, 1, 1, 1,
0.7558094, -0.5047237, 2.659343, 0, 0, 1, 1, 1,
0.7565358, -1.913853, 3.218199, 1, 0, 0, 1, 1,
0.7580298, -0.8763522, 3.478102, 1, 0, 0, 1, 1,
0.7598224, 1.792582, 0.750493, 1, 0, 0, 1, 1,
0.7634506, 1.078784, -0.6787269, 1, 0, 0, 1, 1,
0.7637547, -0.9431222, 2.238827, 1, 0, 0, 1, 1,
0.7640635, 0.3011474, -0.8916772, 0, 0, 0, 1, 1,
0.7689274, 0.9169372, 0.5173093, 0, 0, 0, 1, 1,
0.7695463, 0.2920714, 0.3410676, 0, 0, 0, 1, 1,
0.7734143, 0.7678627, -0.5397223, 0, 0, 0, 1, 1,
0.7747204, 1.189007, 0.3761256, 0, 0, 0, 1, 1,
0.7756993, 0.8372537, 0.8234439, 0, 0, 0, 1, 1,
0.7776503, 0.5726902, 0.8155503, 0, 0, 0, 1, 1,
0.7865724, -0.7194564, 3.012466, 1, 1, 1, 1, 1,
0.7923719, 0.804114, 0.3528389, 1, 1, 1, 1, 1,
0.7975361, -0.4572562, 3.292437, 1, 1, 1, 1, 1,
0.7976035, -0.04554146, -0.6212324, 1, 1, 1, 1, 1,
0.8094661, 0.6747863, 1.183511, 1, 1, 1, 1, 1,
0.8119369, 0.5494189, 2.957304, 1, 1, 1, 1, 1,
0.8174741, 0.7423859, 2.146347, 1, 1, 1, 1, 1,
0.8198273, -0.1823135, 1.156879, 1, 1, 1, 1, 1,
0.8227061, 2.351428, -0.3849528, 1, 1, 1, 1, 1,
0.8233938, -0.07375208, 1.661805, 1, 1, 1, 1, 1,
0.8245888, 0.7490556, -0.2891101, 1, 1, 1, 1, 1,
0.8257792, -0.9022886, 2.393199, 1, 1, 1, 1, 1,
0.8363249, 0.03673733, 1.65567, 1, 1, 1, 1, 1,
0.8403977, 0.4441006, 0.5690722, 1, 1, 1, 1, 1,
0.8473428, 0.6371092, -0.08059368, 1, 1, 1, 1, 1,
0.8502933, 0.467419, -0.8466902, 0, 0, 1, 1, 1,
0.8559088, 0.1908648, 2.347199, 1, 0, 0, 1, 1,
0.8587257, 0.08411162, 1.446494, 1, 0, 0, 1, 1,
0.8600353, -1.67202, 2.303607, 1, 0, 0, 1, 1,
0.8634495, 0.7547371, 0.5657852, 1, 0, 0, 1, 1,
0.8672203, -0.3635765, 1.966614, 1, 0, 0, 1, 1,
0.8692055, -0.9344577, 3.365811, 0, 0, 0, 1, 1,
0.8697106, -0.3689811, 3.591856, 0, 0, 0, 1, 1,
0.8700802, -1.473143, 1.977746, 0, 0, 0, 1, 1,
0.8735144, -1.626965, 1.995251, 0, 0, 0, 1, 1,
0.8782257, 0.2600146, 0.1412872, 0, 0, 0, 1, 1,
0.8822919, 1.010463, 0.5313048, 0, 0, 0, 1, 1,
0.88605, 1.701401, -1.542934, 0, 0, 0, 1, 1,
0.8887404, -1.315198, 3.800622, 1, 1, 1, 1, 1,
0.9001965, 0.8527452, 2.610057, 1, 1, 1, 1, 1,
0.9005735, -0.2892528, 2.917826, 1, 1, 1, 1, 1,
0.9031925, -0.1191989, 1.040691, 1, 1, 1, 1, 1,
0.9143, 0.3878772, 2.49749, 1, 1, 1, 1, 1,
0.9200054, -1.43383, 0.4453937, 1, 1, 1, 1, 1,
0.9226331, -0.3936116, 2.611658, 1, 1, 1, 1, 1,
0.9288993, 0.8493159, 2.075347, 1, 1, 1, 1, 1,
0.9301617, -0.7593249, 3.868178, 1, 1, 1, 1, 1,
0.9306563, 0.1538325, 0.4700523, 1, 1, 1, 1, 1,
0.9355145, -0.545603, 3.780658, 1, 1, 1, 1, 1,
0.9424614, 0.7782916, 0.9185914, 1, 1, 1, 1, 1,
0.9458256, -1.15047, 3.135062, 1, 1, 1, 1, 1,
0.9459006, -0.3236298, 2.083414, 1, 1, 1, 1, 1,
0.9499903, 0.9374584, 0.4302699, 1, 1, 1, 1, 1,
0.9504601, 0.3578829, 0.2880767, 0, 0, 1, 1, 1,
0.9544331, 0.3970367, 1.798041, 1, 0, 0, 1, 1,
0.9555282, 3.330969, -1.701014, 1, 0, 0, 1, 1,
0.9555615, -0.6217747, 1.236153, 1, 0, 0, 1, 1,
0.9566268, -1.09983, 1.89288, 1, 0, 0, 1, 1,
0.9575135, -0.6291011, 1.977884, 1, 0, 0, 1, 1,
0.9608292, 0.7046429, 0.1119629, 0, 0, 0, 1, 1,
0.9622851, 1.062969, 0.7188748, 0, 0, 0, 1, 1,
0.9648582, 1.207098, 1.042022, 0, 0, 0, 1, 1,
0.9739295, -0.349398, 1.100893, 0, 0, 0, 1, 1,
0.9880112, -1.166993, 2.583171, 0, 0, 0, 1, 1,
0.9979181, 0.9182706, 2.037332, 0, 0, 0, 1, 1,
0.9991615, 0.01549452, 0.8042914, 0, 0, 0, 1, 1,
1.004025, 0.4080326, 1.614237, 1, 1, 1, 1, 1,
1.00848, -0.7779181, 3.285397, 1, 1, 1, 1, 1,
1.009195, 1.042457, 0.8982074, 1, 1, 1, 1, 1,
1.018197, -0.08939321, 1.534452, 1, 1, 1, 1, 1,
1.023975, 1.135321, 0.245172, 1, 1, 1, 1, 1,
1.026138, 0.2637494, 1.810689, 1, 1, 1, 1, 1,
1.027707, 0.444809, 1.193206, 1, 1, 1, 1, 1,
1.028359, 0.4079857, 0.6772649, 1, 1, 1, 1, 1,
1.045566, 1.409855, 2.525873, 1, 1, 1, 1, 1,
1.04569, -0.4343677, 2.290361, 1, 1, 1, 1, 1,
1.046383, 0.7709338, -0.1615662, 1, 1, 1, 1, 1,
1.049505, 0.2158894, 0.6420497, 1, 1, 1, 1, 1,
1.049728, -0.9158998, 1.927422, 1, 1, 1, 1, 1,
1.054648, 0.4148759, 0.2489959, 1, 1, 1, 1, 1,
1.06319, 1.033375, -0.4495593, 1, 1, 1, 1, 1,
1.070205, -2.103178, 2.650042, 0, 0, 1, 1, 1,
1.070886, 0.002153553, 0.08039222, 1, 0, 0, 1, 1,
1.074683, 1.92299, 1.202484, 1, 0, 0, 1, 1,
1.075727, -0.4034325, 2.572548, 1, 0, 0, 1, 1,
1.077654, 0.6049137, 0.9764245, 1, 0, 0, 1, 1,
1.086242, -1.333634, 2.385687, 1, 0, 0, 1, 1,
1.089198, -0.1016699, 0.9442752, 0, 0, 0, 1, 1,
1.08984, 0.4755473, 1.978887, 0, 0, 0, 1, 1,
1.092682, -0.8823668, 2.644343, 0, 0, 0, 1, 1,
1.100763, -0.474685, 2.129086, 0, 0, 0, 1, 1,
1.106236, -0.6027842, 2.556908, 0, 0, 0, 1, 1,
1.113099, 0.5502003, -0.2694921, 0, 0, 0, 1, 1,
1.113455, 0.5030658, 1.80316, 0, 0, 0, 1, 1,
1.116046, -1.647071, 1.193233, 1, 1, 1, 1, 1,
1.132962, -0.6764024, 1.889974, 1, 1, 1, 1, 1,
1.134383, -0.05519153, 0.8190106, 1, 1, 1, 1, 1,
1.141104, -0.6983916, 2.083273, 1, 1, 1, 1, 1,
1.146884, 1.198224, 1.185173, 1, 1, 1, 1, 1,
1.148265, 0.2944275, 1.093785, 1, 1, 1, 1, 1,
1.152391, 0.1969686, 1.4429, 1, 1, 1, 1, 1,
1.156626, 0.2536141, 1.679904, 1, 1, 1, 1, 1,
1.160462, 0.1045307, 0.1987188, 1, 1, 1, 1, 1,
1.166817, -0.9443054, 2.038835, 1, 1, 1, 1, 1,
1.172105, 0.1087482, 2.83919, 1, 1, 1, 1, 1,
1.175209, 0.1136468, 1.562084, 1, 1, 1, 1, 1,
1.176297, 0.1077844, 1.772891, 1, 1, 1, 1, 1,
1.180086, -0.6927493, 1.734118, 1, 1, 1, 1, 1,
1.181993, 1.16839, -0.3987451, 1, 1, 1, 1, 1,
1.182296, -0.2666132, 2.214018, 0, 0, 1, 1, 1,
1.183164, 1.042218, 1.100037, 1, 0, 0, 1, 1,
1.199716, -1.27953, 2.268847, 1, 0, 0, 1, 1,
1.21419, -0.9363475, 0.6945397, 1, 0, 0, 1, 1,
1.217613, 0.3476698, 0.2865827, 1, 0, 0, 1, 1,
1.229478, -0.5104336, 1.003758, 1, 0, 0, 1, 1,
1.236499, -0.5091817, 1.617383, 0, 0, 0, 1, 1,
1.242711, 0.6566054, 0.7022338, 0, 0, 0, 1, 1,
1.243604, -1.660282, 2.740569, 0, 0, 0, 1, 1,
1.251449, 0.3350675, 0.3721949, 0, 0, 0, 1, 1,
1.253915, 0.8682277, 0.4634015, 0, 0, 0, 1, 1,
1.261933, 1.760131, 1.26301, 0, 0, 0, 1, 1,
1.263577, -0.8810704, 2.337278, 0, 0, 0, 1, 1,
1.273128, -0.08340666, 2.34639, 1, 1, 1, 1, 1,
1.274065, -0.5408003, 2.39606, 1, 1, 1, 1, 1,
1.286127, 1.392476, 0.7257063, 1, 1, 1, 1, 1,
1.294036, -0.1328185, 1.652313, 1, 1, 1, 1, 1,
1.307256, -0.08249814, 1.07773, 1, 1, 1, 1, 1,
1.312346, -2.927994, 5.905782, 1, 1, 1, 1, 1,
1.320245, -1.510685, 2.650555, 1, 1, 1, 1, 1,
1.323342, -0.3630386, 1.285197, 1, 1, 1, 1, 1,
1.323724, 2.34134, 0.422497, 1, 1, 1, 1, 1,
1.354398, 1.391543, 1.639895, 1, 1, 1, 1, 1,
1.386503, -0.4032152, -0.1565426, 1, 1, 1, 1, 1,
1.393761, 2.10706, -0.3322067, 1, 1, 1, 1, 1,
1.394161, 0.7553766, -0.3259502, 1, 1, 1, 1, 1,
1.39537, 0.7444636, 1.327165, 1, 1, 1, 1, 1,
1.395594, 0.7600611, 2.625576, 1, 1, 1, 1, 1,
1.402235, 1.965671, 2.591104, 0, 0, 1, 1, 1,
1.418714, 0.6540985, 1.936591, 1, 0, 0, 1, 1,
1.426826, 1.775935, 2.070262, 1, 0, 0, 1, 1,
1.430975, -1.525027, 3.347488, 1, 0, 0, 1, 1,
1.432092, 0.3754008, 0.6390376, 1, 0, 0, 1, 1,
1.442216, -1.680443, 3.003485, 1, 0, 0, 1, 1,
1.444435, -1.900737, 1.248162, 0, 0, 0, 1, 1,
1.450317, 0.2850338, 1.796401, 0, 0, 0, 1, 1,
1.457754, 0.8097234, 1.034033, 0, 0, 0, 1, 1,
1.46506, 0.1826631, 1.736577, 0, 0, 0, 1, 1,
1.467452, -0.98647, 2.228886, 0, 0, 0, 1, 1,
1.47566, 0.458872, 0.428412, 0, 0, 0, 1, 1,
1.479631, -1.566223, 3.494744, 0, 0, 0, 1, 1,
1.48796, -1.795867, 2.372164, 1, 1, 1, 1, 1,
1.488176, 0.2988538, 2.070166, 1, 1, 1, 1, 1,
1.498079, 0.9793918, 1.342865, 1, 1, 1, 1, 1,
1.507014, 0.01173366, 0.4964158, 1, 1, 1, 1, 1,
1.514073, 0.1366149, 2.23329, 1, 1, 1, 1, 1,
1.514456, -1.967774, 1.801269, 1, 1, 1, 1, 1,
1.519225, -1.534504, 1.878784, 1, 1, 1, 1, 1,
1.538667, 0.28031, 1.452142, 1, 1, 1, 1, 1,
1.571854, 0.6274058, -0.7808622, 1, 1, 1, 1, 1,
1.585245, 0.01010738, 0.2612626, 1, 1, 1, 1, 1,
1.599626, 0.7649385, -0.7243485, 1, 1, 1, 1, 1,
1.610452, -1.293102, 3.921206, 1, 1, 1, 1, 1,
1.620619, -0.8471482, 2.324401, 1, 1, 1, 1, 1,
1.633227, 0.04779785, -0.06163883, 1, 1, 1, 1, 1,
1.668577, -0.09875873, 3.275965, 1, 1, 1, 1, 1,
1.676742, 0.756772, -1.219859, 0, 0, 1, 1, 1,
1.683363, -0.2762055, 1.746596, 1, 0, 0, 1, 1,
1.707501, 1.098294, 0.8762209, 1, 0, 0, 1, 1,
1.726201, -0.2301347, 3.551753, 1, 0, 0, 1, 1,
1.729873, 0.2145391, 1.591927, 1, 0, 0, 1, 1,
1.740779, -2.198592, 2.11219, 1, 0, 0, 1, 1,
1.755963, 0.5394308, 0.5544587, 0, 0, 0, 1, 1,
1.756588, 1.639288, 1.313618, 0, 0, 0, 1, 1,
1.770118, 0.783918, 1.676086, 0, 0, 0, 1, 1,
1.773925, 1.005461, -0.2887698, 0, 0, 0, 1, 1,
1.792423, 1.088564, 0.8768066, 0, 0, 0, 1, 1,
1.815211, -0.4403272, 2.810207, 0, 0, 0, 1, 1,
1.816427, -0.5117412, 1.800633, 0, 0, 0, 1, 1,
1.82069, 1.519615, 0.3828587, 1, 1, 1, 1, 1,
1.821418, 0.4525883, 0.6548469, 1, 1, 1, 1, 1,
1.848233, -0.2209295, 2.333773, 1, 1, 1, 1, 1,
1.855731, 0.9084228, 1.285096, 1, 1, 1, 1, 1,
1.856103, 0.6068401, -0.1950054, 1, 1, 1, 1, 1,
1.878935, -0.5064301, 0.9923491, 1, 1, 1, 1, 1,
1.92898, -0.9026319, 1.254103, 1, 1, 1, 1, 1,
1.944071, 2.055527, 1.728491, 1, 1, 1, 1, 1,
1.95119, 0.7751081, 0.5266994, 1, 1, 1, 1, 1,
1.961156, 1.567653, -0.3772359, 1, 1, 1, 1, 1,
1.962432, -0.1781836, 1.439511, 1, 1, 1, 1, 1,
1.97733, -0.6380377, 1.833061, 1, 1, 1, 1, 1,
1.983398, -0.08140656, 1.236093, 1, 1, 1, 1, 1,
1.984499, 0.1783042, 0.3618765, 1, 1, 1, 1, 1,
1.998687, -0.4008828, 1.281047, 1, 1, 1, 1, 1,
2.052035, 1.957885, -0.4121701, 0, 0, 1, 1, 1,
2.065232, -0.3317081, 2.098746, 1, 0, 0, 1, 1,
2.082774, -1.283869, 1.438088, 1, 0, 0, 1, 1,
2.101041, 1.939679, 0.824334, 1, 0, 0, 1, 1,
2.107353, 0.0515312, 1.60078, 1, 0, 0, 1, 1,
2.125036, -0.3517499, 1.92804, 1, 0, 0, 1, 1,
2.135863, 0.6549436, 2.002075, 0, 0, 0, 1, 1,
2.151329, -0.1649845, 1.973091, 0, 0, 0, 1, 1,
2.170229, -1.604769, 1.323721, 0, 0, 0, 1, 1,
2.290891, 0.7205909, -0.3642753, 0, 0, 0, 1, 1,
2.370143, -1.043983, 2.231056, 0, 0, 0, 1, 1,
2.573481, -0.7958405, 1.937606, 0, 0, 0, 1, 1,
2.603547, -2.234864, 2.369307, 0, 0, 0, 1, 1,
2.679289, 1.359023, 1.144953, 1, 1, 1, 1, 1,
2.719303, -0.09684677, 2.345026, 1, 1, 1, 1, 1,
2.855017, -1.335518, 2.22613, 1, 1, 1, 1, 1,
2.966663, 0.5787935, 1.107033, 1, 1, 1, 1, 1,
3.080004, -0.5782495, 1.05435, 1, 1, 1, 1, 1,
3.130064, -1.96507, 2.138453, 1, 1, 1, 1, 1,
3.377578, -0.1001093, 1.16939, 1, 1, 1, 1, 1
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
var radius = 9.990383;
var distance = 35.09079;
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
mvMatrix.translate( 0.1409762, -0.184352, -0.2069778 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.09079);
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
