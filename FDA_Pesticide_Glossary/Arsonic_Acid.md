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
-4.001313, -0.1943975, -2.524597, 1, 0, 0, 1,
-3.28382, -2.132811, -3.804854, 1, 0.007843138, 0, 1,
-3.188434, 1.57936, -0.7030947, 1, 0.01176471, 0, 1,
-2.982521, 1.011011, -0.8606133, 1, 0.01960784, 0, 1,
-2.926529, -1.828453, -0.9980393, 1, 0.02352941, 0, 1,
-2.88781, 2.920524, -1.257903, 1, 0.03137255, 0, 1,
-2.697846, -3.051225, -1.97818, 1, 0.03529412, 0, 1,
-2.657813, 1.172172, -0.8682348, 1, 0.04313726, 0, 1,
-2.618345, -0.8219637, -1.377766, 1, 0.04705882, 0, 1,
-2.536468, 0.5318241, -2.338874, 1, 0.05490196, 0, 1,
-2.498126, 1.474093, -1.476176, 1, 0.05882353, 0, 1,
-2.477117, -1.87979, -2.865968, 1, 0.06666667, 0, 1,
-2.42308, -0.6375149, -1.189039, 1, 0.07058824, 0, 1,
-2.398266, -0.09132739, -2.166906, 1, 0.07843138, 0, 1,
-2.269261, -1.648852, -2.01795, 1, 0.08235294, 0, 1,
-2.234085, -0.4816058, -2.746197, 1, 0.09019608, 0, 1,
-2.220693, -0.2320404, -3.741467, 1, 0.09411765, 0, 1,
-2.212204, 0.08850868, -3.028423, 1, 0.1019608, 0, 1,
-2.203375, -1.554539, -4.172559, 1, 0.1098039, 0, 1,
-2.179141, -0.5467915, -0.7665873, 1, 0.1137255, 0, 1,
-2.163263, -0.975853, -1.459274, 1, 0.1215686, 0, 1,
-2.141716, 1.142059, -0.8203558, 1, 0.1254902, 0, 1,
-2.138983, 0.0867902, -2.854332, 1, 0.1333333, 0, 1,
-2.132434, -0.7104305, -1.314566, 1, 0.1372549, 0, 1,
-2.063596, -0.04331342, -3.393952, 1, 0.145098, 0, 1,
-2.039104, -0.3786505, -1.213963, 1, 0.1490196, 0, 1,
-2.029171, -1.178249, -1.765935, 1, 0.1568628, 0, 1,
-1.995078, -0.6770261, -0.5493848, 1, 0.1607843, 0, 1,
-1.985044, 1.739752, 0.3711522, 1, 0.1686275, 0, 1,
-1.97809, 1.086625, -0.0009165111, 1, 0.172549, 0, 1,
-1.940942, -0.521854, -1.096771, 1, 0.1803922, 0, 1,
-1.916856, -0.2405776, -1.539212, 1, 0.1843137, 0, 1,
-1.852381, 3.936819, -1.880622, 1, 0.1921569, 0, 1,
-1.839109, 0.4927955, -2.10184, 1, 0.1960784, 0, 1,
-1.822868, -0.4229982, -2.218591, 1, 0.2039216, 0, 1,
-1.815955, -0.00421904, -3.704837, 1, 0.2117647, 0, 1,
-1.814004, 1.401962, -0.637481, 1, 0.2156863, 0, 1,
-1.805068, 0.6597916, -2.287762, 1, 0.2235294, 0, 1,
-1.795192, -1.681944, -2.972602, 1, 0.227451, 0, 1,
-1.786853, -0.8103576, -1.820648, 1, 0.2352941, 0, 1,
-1.773332, -1.159467, -3.022797, 1, 0.2392157, 0, 1,
-1.770667, -0.9559912, -2.953426, 1, 0.2470588, 0, 1,
-1.743139, 0.1912457, -1.569897, 1, 0.2509804, 0, 1,
-1.710106, 1.7991, -1.19033, 1, 0.2588235, 0, 1,
-1.694204, 1.092688, -1.017064, 1, 0.2627451, 0, 1,
-1.677775, -0.9967642, 0.8883656, 1, 0.2705882, 0, 1,
-1.675235, 0.3683523, -2.471612, 1, 0.2745098, 0, 1,
-1.675213, -1.432611, -3.168128, 1, 0.282353, 0, 1,
-1.673221, -0.132245, -1.22545, 1, 0.2862745, 0, 1,
-1.664311, -0.9083661, -2.048605, 1, 0.2941177, 0, 1,
-1.660763, -2.311797, -2.196286, 1, 0.3019608, 0, 1,
-1.658023, 1.539974, -1.691951, 1, 0.3058824, 0, 1,
-1.647084, -0.2827872, -2.503562, 1, 0.3137255, 0, 1,
-1.642599, -1.634135, -1.680069, 1, 0.3176471, 0, 1,
-1.640477, -2.903318, -1.847956, 1, 0.3254902, 0, 1,
-1.617637, 0.1998965, -3.315752, 1, 0.3294118, 0, 1,
-1.591923, -0.2646897, -0.6738648, 1, 0.3372549, 0, 1,
-1.587684, -1.502489, -3.534417, 1, 0.3411765, 0, 1,
-1.55723, -0.6595529, -3.516176, 1, 0.3490196, 0, 1,
-1.545571, -1.255809, -2.519449, 1, 0.3529412, 0, 1,
-1.541299, 1.249584, -0.2447976, 1, 0.3607843, 0, 1,
-1.531588, 1.2609, -0.4016067, 1, 0.3647059, 0, 1,
-1.529883, 1.515944, -0.9741966, 1, 0.372549, 0, 1,
-1.519197, -0.161155, -1.511088, 1, 0.3764706, 0, 1,
-1.506573, 0.2161927, -3.037116, 1, 0.3843137, 0, 1,
-1.49659, 1.513614, -2.229676, 1, 0.3882353, 0, 1,
-1.49623, 0.2345322, -1.622419, 1, 0.3960784, 0, 1,
-1.468108, 0.1914591, -1.741808, 1, 0.4039216, 0, 1,
-1.461826, -0.2770434, -2.415642, 1, 0.4078431, 0, 1,
-1.457552, -0.2056775, -1.396045, 1, 0.4156863, 0, 1,
-1.455692, 0.221358, -0.05091854, 1, 0.4196078, 0, 1,
-1.453941, 1.46806, -2.929541, 1, 0.427451, 0, 1,
-1.452333, 0.4634804, -1.457242, 1, 0.4313726, 0, 1,
-1.444369, 1.078238, -0.9748161, 1, 0.4392157, 0, 1,
-1.44283, 0.5488277, -2.416851, 1, 0.4431373, 0, 1,
-1.435118, 0.1513157, -1.844691, 1, 0.4509804, 0, 1,
-1.42861, 2.233522, -0.8830094, 1, 0.454902, 0, 1,
-1.428075, 1.714882, -0.1725041, 1, 0.4627451, 0, 1,
-1.410224, 1.812919, 0.01348424, 1, 0.4666667, 0, 1,
-1.408835, -0.7385927, -1.861538, 1, 0.4745098, 0, 1,
-1.407451, 0.2023839, -2.694721, 1, 0.4784314, 0, 1,
-1.404748, -0.1805511, -2.777531, 1, 0.4862745, 0, 1,
-1.393774, 1.0427, -1.165288, 1, 0.4901961, 0, 1,
-1.38653, 1.190943, -1.118743, 1, 0.4980392, 0, 1,
-1.369093, 1.399768, 0.09342434, 1, 0.5058824, 0, 1,
-1.368571, 1.058701, -0.5836917, 1, 0.509804, 0, 1,
-1.364546, -0.01465354, -2.85693, 1, 0.5176471, 0, 1,
-1.36048, -0.6189322, -2.544586, 1, 0.5215687, 0, 1,
-1.353055, -0.2854138, -0.9320292, 1, 0.5294118, 0, 1,
-1.351207, 0.7051296, -1.381058, 1, 0.5333334, 0, 1,
-1.343993, -0.311475, -1.949257, 1, 0.5411765, 0, 1,
-1.327213, -1.394483, -1.779166, 1, 0.5450981, 0, 1,
-1.319445, -0.2832864, -0.7656773, 1, 0.5529412, 0, 1,
-1.308404, -1.795403, -6.140988, 1, 0.5568628, 0, 1,
-1.304053, -0.944219, -1.919975, 1, 0.5647059, 0, 1,
-1.278738, -0.4518522, -1.374295, 1, 0.5686275, 0, 1,
-1.277641, 1.034442, -1.036937, 1, 0.5764706, 0, 1,
-1.276577, -0.6789873, -0.4792097, 1, 0.5803922, 0, 1,
-1.269928, -1.672922, -2.114586, 1, 0.5882353, 0, 1,
-1.243958, -0.8295007, -3.835259, 1, 0.5921569, 0, 1,
-1.242803, -0.4768473, -2.050157, 1, 0.6, 0, 1,
-1.227961, -0.07287215, -1.058787, 1, 0.6078432, 0, 1,
-1.227002, -0.3291861, -2.779522, 1, 0.6117647, 0, 1,
-1.221836, -1.233595, -3.133406, 1, 0.6196079, 0, 1,
-1.221524, -0.2937965, -2.122542, 1, 0.6235294, 0, 1,
-1.21989, -0.244415, -1.870158, 1, 0.6313726, 0, 1,
-1.219734, -1.055455, -2.624668, 1, 0.6352941, 0, 1,
-1.219332, -0.6219223, -1.927472, 1, 0.6431373, 0, 1,
-1.215481, 0.4386033, -2.606026, 1, 0.6470588, 0, 1,
-1.208421, -0.8789365, -2.100837, 1, 0.654902, 0, 1,
-1.203048, 0.7197859, -1.833377, 1, 0.6588235, 0, 1,
-1.200179, 0.1510865, -1.0278, 1, 0.6666667, 0, 1,
-1.199807, 1.823182, -0.2167658, 1, 0.6705883, 0, 1,
-1.199798, 0.9501286, -2.167872, 1, 0.6784314, 0, 1,
-1.193691, 0.582123, 1.005795, 1, 0.682353, 0, 1,
-1.192549, -0.2419621, -1.809195, 1, 0.6901961, 0, 1,
-1.186701, 0.6334512, -2.216459, 1, 0.6941177, 0, 1,
-1.184865, 1.30645, -1.431026, 1, 0.7019608, 0, 1,
-1.18217, 0.1071416, -2.272184, 1, 0.7098039, 0, 1,
-1.176089, -0.7992105, -1.751477, 1, 0.7137255, 0, 1,
-1.172968, -1.176708, -2.618428, 1, 0.7215686, 0, 1,
-1.17164, -1.385589, -4.648299, 1, 0.7254902, 0, 1,
-1.160814, 0.6015736, -2.254859, 1, 0.7333333, 0, 1,
-1.157517, -0.5087054, -0.7542792, 1, 0.7372549, 0, 1,
-1.155264, -0.1650085, -1.295764, 1, 0.7450981, 0, 1,
-1.141557, 0.5471158, 0.9994552, 1, 0.7490196, 0, 1,
-1.139091, 2.026004, 0.5972108, 1, 0.7568628, 0, 1,
-1.135256, -0.195674, -1.035163, 1, 0.7607843, 0, 1,
-1.129491, 0.9283994, -0.5650278, 1, 0.7686275, 0, 1,
-1.127661, 0.6326545, -0.4728634, 1, 0.772549, 0, 1,
-1.118576, 1.428072, 0.1748158, 1, 0.7803922, 0, 1,
-1.110297, -2.278741, -1.902836, 1, 0.7843137, 0, 1,
-1.108902, -0.2754737, -2.10668, 1, 0.7921569, 0, 1,
-1.100906, 0.180918, -0.2121436, 1, 0.7960784, 0, 1,
-1.089324, 0.09696559, -0.496089, 1, 0.8039216, 0, 1,
-1.084679, 0.3650177, -1.551954, 1, 0.8117647, 0, 1,
-1.082858, 0.5435654, -2.325946, 1, 0.8156863, 0, 1,
-1.077735, 0.4179855, -0.07180464, 1, 0.8235294, 0, 1,
-1.074314, -0.4247158, -2.218886, 1, 0.827451, 0, 1,
-1.060034, 0.829008, -0.6440539, 1, 0.8352941, 0, 1,
-1.050685, -0.9427744, -4.676184, 1, 0.8392157, 0, 1,
-1.050612, -1.970146, -1.873303, 1, 0.8470588, 0, 1,
-1.044902, 0.2681241, -1.056558, 1, 0.8509804, 0, 1,
-1.038014, 0.406384, -0.9069113, 1, 0.8588235, 0, 1,
-1.035068, -0.4141338, -1.565343, 1, 0.8627451, 0, 1,
-1.034686, -0.1570136, -2.305761, 1, 0.8705882, 0, 1,
-1.034122, 0.3420644, -2.194322, 1, 0.8745098, 0, 1,
-1.031811, -0.130679, -2.106418, 1, 0.8823529, 0, 1,
-1.029827, -2.38669, -2.037635, 1, 0.8862745, 0, 1,
-1.023977, 0.9950209, -0.05080703, 1, 0.8941177, 0, 1,
-1.014716, 2.101259, -0.3804547, 1, 0.8980392, 0, 1,
-1.007345, -0.6081724, -2.090803, 1, 0.9058824, 0, 1,
-1.005669, -0.8263941, -0.4171691, 1, 0.9137255, 0, 1,
-1.000556, 1.447225, -1.188742, 1, 0.9176471, 0, 1,
-0.9962612, 0.9697143, -0.08711198, 1, 0.9254902, 0, 1,
-0.9946981, -0.4512346, -1.617413, 1, 0.9294118, 0, 1,
-0.9892269, 0.8986324, -1.95426, 1, 0.9372549, 0, 1,
-0.9863523, 0.7164907, -1.32398, 1, 0.9411765, 0, 1,
-0.9852494, -0.2296232, -2.183802, 1, 0.9490196, 0, 1,
-0.9814512, 0.6040855, 0.7948023, 1, 0.9529412, 0, 1,
-0.9808151, -0.04091757, 0.5022827, 1, 0.9607843, 0, 1,
-0.9772406, 0.2598305, -1.606847, 1, 0.9647059, 0, 1,
-0.9671019, -0.3686855, -2.861021, 1, 0.972549, 0, 1,
-0.9652519, -0.06054292, 0.1821305, 1, 0.9764706, 0, 1,
-0.9648267, 0.7562612, -0.07396649, 1, 0.9843137, 0, 1,
-0.9607343, 0.0575332, -1.232288, 1, 0.9882353, 0, 1,
-0.9570679, 0.004057385, -2.740193, 1, 0.9960784, 0, 1,
-0.9517533, -0.3757258, -1.806556, 0.9960784, 1, 0, 1,
-0.9503931, -0.1246115, -1.166922, 0.9921569, 1, 0, 1,
-0.9481548, -0.2757313, -2.541002, 0.9843137, 1, 0, 1,
-0.9454604, -1.808128, -2.331776, 0.9803922, 1, 0, 1,
-0.9428383, 0.4504496, -0.4517254, 0.972549, 1, 0, 1,
-0.9414612, -0.2116545, -1.349464, 0.9686275, 1, 0, 1,
-0.9362344, -0.4610709, 0.2004586, 0.9607843, 1, 0, 1,
-0.9295196, 0.7813912, 1.129636, 0.9568627, 1, 0, 1,
-0.9083584, -0.3172125, -2.649756, 0.9490196, 1, 0, 1,
-0.9038719, -0.3565094, -2.748049, 0.945098, 1, 0, 1,
-0.902159, 0.5377142, 1.595337, 0.9372549, 1, 0, 1,
-0.8992907, 0.6077075, -1.787775, 0.9333333, 1, 0, 1,
-0.8984953, -0.4398354, -2.338242, 0.9254902, 1, 0, 1,
-0.8977432, 0.1267265, -1.669178, 0.9215686, 1, 0, 1,
-0.8891615, -2.125479, -2.147494, 0.9137255, 1, 0, 1,
-0.8847092, 0.1824175, 0.6489939, 0.9098039, 1, 0, 1,
-0.8827543, -1.331594, -5.542475, 0.9019608, 1, 0, 1,
-0.8761811, -0.5114941, -2.16966, 0.8941177, 1, 0, 1,
-0.8691655, 0.538823, -2.127903, 0.8901961, 1, 0, 1,
-0.8651727, 0.03186286, -1.256613, 0.8823529, 1, 0, 1,
-0.8651494, -0.1073592, -1.642504, 0.8784314, 1, 0, 1,
-0.8640249, -1.527729, -1.068894, 0.8705882, 1, 0, 1,
-0.8592983, -1.209882, -1.766774, 0.8666667, 1, 0, 1,
-0.8580213, 0.7494471, -1.857807, 0.8588235, 1, 0, 1,
-0.8516213, 0.8538407, -0.2181958, 0.854902, 1, 0, 1,
-0.8490326, 1.01357, -1.454114, 0.8470588, 1, 0, 1,
-0.8462072, 2.253429, -2.086575, 0.8431373, 1, 0, 1,
-0.8446609, -0.6701733, -3.193285, 0.8352941, 1, 0, 1,
-0.8240142, 0.7519637, -0.7774497, 0.8313726, 1, 0, 1,
-0.8227039, -0.2509678, -1.728167, 0.8235294, 1, 0, 1,
-0.821059, 1.991653, -0.5966317, 0.8196079, 1, 0, 1,
-0.8201365, 1.33883, -1.050613, 0.8117647, 1, 0, 1,
-0.8060623, 0.2051681, -0.8726473, 0.8078431, 1, 0, 1,
-0.8033723, 0.9387323, -0.8693491, 0.8, 1, 0, 1,
-0.8033145, -0.9432874, -2.755151, 0.7921569, 1, 0, 1,
-0.8015396, -1.586588, -3.471677, 0.7882353, 1, 0, 1,
-0.7968019, -0.5277241, -2.678117, 0.7803922, 1, 0, 1,
-0.7947446, -0.6223845, -1.425145, 0.7764706, 1, 0, 1,
-0.7844321, -0.6698005, -2.281847, 0.7686275, 1, 0, 1,
-0.779318, -0.6742133, -3.64118, 0.7647059, 1, 0, 1,
-0.7759691, -2.157332, -2.867486, 0.7568628, 1, 0, 1,
-0.7747029, 0.444579, -1.26056, 0.7529412, 1, 0, 1,
-0.7707535, -0.7324005, -4.330209, 0.7450981, 1, 0, 1,
-0.769946, -0.1560192, -1.921252, 0.7411765, 1, 0, 1,
-0.7599447, -0.923574, -4.064603, 0.7333333, 1, 0, 1,
-0.7514473, 1.441777, 0.5008426, 0.7294118, 1, 0, 1,
-0.7478082, -0.5050942, -1.676934, 0.7215686, 1, 0, 1,
-0.7465423, -1.113384, -2.820238, 0.7176471, 1, 0, 1,
-0.7403756, -0.09520067, -3.802109, 0.7098039, 1, 0, 1,
-0.7343911, 0.5286091, -2.08491, 0.7058824, 1, 0, 1,
-0.7335626, 0.5936168, -2.995858, 0.6980392, 1, 0, 1,
-0.7200506, -0.6395835, -2.471049, 0.6901961, 1, 0, 1,
-0.7142503, -2.313915, -3.62645, 0.6862745, 1, 0, 1,
-0.7076564, 0.4252237, -0.378976, 0.6784314, 1, 0, 1,
-0.7063559, 0.02120343, -1.481069, 0.6745098, 1, 0, 1,
-0.7023094, -0.2423324, -2.163583, 0.6666667, 1, 0, 1,
-0.6972841, 0.5956979, -0.6218997, 0.6627451, 1, 0, 1,
-0.6958699, -0.06950037, -2.986328, 0.654902, 1, 0, 1,
-0.6917853, -0.3522856, -0.6482658, 0.6509804, 1, 0, 1,
-0.6841928, -0.7696074, -2.325536, 0.6431373, 1, 0, 1,
-0.6833577, 1.203187, -2.274844, 0.6392157, 1, 0, 1,
-0.6808711, 0.6903039, -1.579117, 0.6313726, 1, 0, 1,
-0.6790584, 1.257234, -2.565038, 0.627451, 1, 0, 1,
-0.677669, 0.2227702, -1.153081, 0.6196079, 1, 0, 1,
-0.6763099, 1.275664, 0.9933299, 0.6156863, 1, 0, 1,
-0.6714038, -0.9600033, -1.682483, 0.6078432, 1, 0, 1,
-0.6695701, -1.077756, -1.31249, 0.6039216, 1, 0, 1,
-0.6680403, 0.5262333, -0.1993375, 0.5960785, 1, 0, 1,
-0.6679971, 0.5899439, 0.2162258, 0.5882353, 1, 0, 1,
-0.665868, -0.6785269, -1.989596, 0.5843138, 1, 0, 1,
-0.6648641, 0.095, -1.63549, 0.5764706, 1, 0, 1,
-0.6645332, 0.8491122, 0.4930956, 0.572549, 1, 0, 1,
-0.6625412, -1.094343, -2.577075, 0.5647059, 1, 0, 1,
-0.6588566, -0.7857903, -2.470171, 0.5607843, 1, 0, 1,
-0.6525271, 0.3850945, 0.7065477, 0.5529412, 1, 0, 1,
-0.6519989, 1.236798, -0.9429317, 0.5490196, 1, 0, 1,
-0.6466705, 0.4110533, 1.374128, 0.5411765, 1, 0, 1,
-0.6459094, 0.04350912, -1.842576, 0.5372549, 1, 0, 1,
-0.6448559, 0.6997184, -0.349669, 0.5294118, 1, 0, 1,
-0.6430039, -0.8023124, -3.353681, 0.5254902, 1, 0, 1,
-0.6368487, 0.6525729, -1.716068, 0.5176471, 1, 0, 1,
-0.6342404, -1.068314, -2.349501, 0.5137255, 1, 0, 1,
-0.630726, -0.356502, -2.198148, 0.5058824, 1, 0, 1,
-0.6272829, -0.1362598, -0.7971842, 0.5019608, 1, 0, 1,
-0.6269844, -0.411851, -1.496872, 0.4941176, 1, 0, 1,
-0.6198703, -1.477939, -3.415922, 0.4862745, 1, 0, 1,
-0.6196523, 1.422717, -1.937628, 0.4823529, 1, 0, 1,
-0.6129161, 1.526792, -0.2586927, 0.4745098, 1, 0, 1,
-0.6125331, -0.4427676, -2.875737, 0.4705882, 1, 0, 1,
-0.6068795, -0.6117685, -0.5903915, 0.4627451, 1, 0, 1,
-0.6045014, -0.5562613, -2.499225, 0.4588235, 1, 0, 1,
-0.6030576, -1.306339, -3.343144, 0.4509804, 1, 0, 1,
-0.6020042, 1.489032, -1.215039, 0.4470588, 1, 0, 1,
-0.6013222, -0.9107185, -1.074345, 0.4392157, 1, 0, 1,
-0.600191, -0.8071759, -1.561797, 0.4352941, 1, 0, 1,
-0.5977915, -1.206416, -2.503314, 0.427451, 1, 0, 1,
-0.5945795, -0.8245515, -1.998957, 0.4235294, 1, 0, 1,
-0.5945649, -1.238057, -2.7705, 0.4156863, 1, 0, 1,
-0.5884175, 0.9095116, -1.981479, 0.4117647, 1, 0, 1,
-0.5849305, 0.8760833, 0.952565, 0.4039216, 1, 0, 1,
-0.584168, 0.6741739, -0.4333681, 0.3960784, 1, 0, 1,
-0.5836303, 0.4719902, -0.7244247, 0.3921569, 1, 0, 1,
-0.5824713, -1.053296, -2.619734, 0.3843137, 1, 0, 1,
-0.5811397, 0.4457498, 0.1031699, 0.3803922, 1, 0, 1,
-0.5767263, 1.190001, 0.1976555, 0.372549, 1, 0, 1,
-0.5760351, 0.6528758, -1.399823, 0.3686275, 1, 0, 1,
-0.574488, -0.4780574, -1.803836, 0.3607843, 1, 0, 1,
-0.5704053, 0.3658436, -1.509049, 0.3568628, 1, 0, 1,
-0.5697426, -0.911341, -3.667021, 0.3490196, 1, 0, 1,
-0.5692709, 1.624655, -1.637697, 0.345098, 1, 0, 1,
-0.5641246, 1.392162, -1.951603, 0.3372549, 1, 0, 1,
-0.5638272, 1.044797, 0.2681355, 0.3333333, 1, 0, 1,
-0.5631903, -0.090953, -4.07173, 0.3254902, 1, 0, 1,
-0.5543084, -1.368776, -0.1252853, 0.3215686, 1, 0, 1,
-0.5534565, -1.565556, -3.78817, 0.3137255, 1, 0, 1,
-0.5531028, 1.7995, 0.1454746, 0.3098039, 1, 0, 1,
-0.5507774, -2.202263, -2.59865, 0.3019608, 1, 0, 1,
-0.5487065, -0.6865964, -2.890937, 0.2941177, 1, 0, 1,
-0.5471103, -0.6540856, -4.32791, 0.2901961, 1, 0, 1,
-0.5396124, 0.03986987, -2.0709, 0.282353, 1, 0, 1,
-0.5384558, 1.698039, 2.108864, 0.2784314, 1, 0, 1,
-0.5291142, 0.5898971, -0.3465848, 0.2705882, 1, 0, 1,
-0.5267276, -1.441059, -2.40726, 0.2666667, 1, 0, 1,
-0.5265078, -0.9663687, -4.725457, 0.2588235, 1, 0, 1,
-0.5250255, 0.777563, -0.4319395, 0.254902, 1, 0, 1,
-0.5223594, 0.6598535, -0.2958309, 0.2470588, 1, 0, 1,
-0.5220312, 0.1717742, -1.336096, 0.2431373, 1, 0, 1,
-0.5219944, -0.18965, 0.1809737, 0.2352941, 1, 0, 1,
-0.5214414, 0.2937414, -0.6622968, 0.2313726, 1, 0, 1,
-0.5210865, -2.539013, -3.045096, 0.2235294, 1, 0, 1,
-0.5192148, 0.6982711, 0.3411875, 0.2196078, 1, 0, 1,
-0.5190997, 1.30576, 0.1548768, 0.2117647, 1, 0, 1,
-0.5175732, 0.08115119, -2.589985, 0.2078431, 1, 0, 1,
-0.515925, -0.940457, -2.279507, 0.2, 1, 0, 1,
-0.5155814, 0.5745839, -1.011884, 0.1921569, 1, 0, 1,
-0.5137897, -0.3296315, -3.156275, 0.1882353, 1, 0, 1,
-0.5101607, -0.1742433, 0.05749638, 0.1803922, 1, 0, 1,
-0.5082121, 0.2684962, -2.02405, 0.1764706, 1, 0, 1,
-0.4917022, -0.8805004, -1.487535, 0.1686275, 1, 0, 1,
-0.4891461, -1.138939, -1.543688, 0.1647059, 1, 0, 1,
-0.4881354, 0.1593283, -1.597784, 0.1568628, 1, 0, 1,
-0.4873259, -1.051385, -4.917098, 0.1529412, 1, 0, 1,
-0.4865472, 0.0001142175, -2.117375, 0.145098, 1, 0, 1,
-0.4841777, 0.09461329, -0.9253416, 0.1411765, 1, 0, 1,
-0.4803688, -1.516386, -3.503549, 0.1333333, 1, 0, 1,
-0.4720144, -0.8244998, -3.351077, 0.1294118, 1, 0, 1,
-0.4690487, 0.1652405, -0.2397911, 0.1215686, 1, 0, 1,
-0.468854, 1.140044, -1.168797, 0.1176471, 1, 0, 1,
-0.4671399, 0.2775314, -1.186315, 0.1098039, 1, 0, 1,
-0.4623549, 0.4736271, -1.189046, 0.1058824, 1, 0, 1,
-0.461123, 0.00968278, -1.007378, 0.09803922, 1, 0, 1,
-0.4592075, 0.5149417, -1.29348, 0.09019608, 1, 0, 1,
-0.4570342, -0.05336533, -2.40047, 0.08627451, 1, 0, 1,
-0.451514, -0.2541131, -1.274798, 0.07843138, 1, 0, 1,
-0.4502465, -1.448226, -4.192603, 0.07450981, 1, 0, 1,
-0.444647, -0.2080914, -3.595977, 0.06666667, 1, 0, 1,
-0.4424326, 0.274082, -1.810796, 0.0627451, 1, 0, 1,
-0.4414483, -1.191581, -1.204249, 0.05490196, 1, 0, 1,
-0.4389154, 0.3353335, 0.4634433, 0.05098039, 1, 0, 1,
-0.4381765, -0.1101869, -1.707446, 0.04313726, 1, 0, 1,
-0.4380847, 0.7625673, -0.8901088, 0.03921569, 1, 0, 1,
-0.4338851, 0.07258801, -1.268977, 0.03137255, 1, 0, 1,
-0.4306313, -0.3538222, -2.330403, 0.02745098, 1, 0, 1,
-0.4298073, -0.2077151, -2.027619, 0.01960784, 1, 0, 1,
-0.4293664, -0.003214574, 0.5674924, 0.01568628, 1, 0, 1,
-0.4271589, -0.2404064, -3.097336, 0.007843138, 1, 0, 1,
-0.4261262, 0.7500746, -0.6863047, 0.003921569, 1, 0, 1,
-0.4222378, 0.292628, -1.200219, 0, 1, 0.003921569, 1,
-0.4200612, -0.6010855, -3.354928, 0, 1, 0.01176471, 1,
-0.4138164, 1.200686, 0.29033, 0, 1, 0.01568628, 1,
-0.4134333, -0.6328302, -4.363657, 0, 1, 0.02352941, 1,
-0.4077479, -1.838358, -2.883828, 0, 1, 0.02745098, 1,
-0.4055428, 0.9558664, -1.164925, 0, 1, 0.03529412, 1,
-0.4009476, -1.411451, -4.222202, 0, 1, 0.03921569, 1,
-0.4001914, 1.801606, -0.3766882, 0, 1, 0.04705882, 1,
-0.3938514, -0.113642, -1.768688, 0, 1, 0.05098039, 1,
-0.3898428, -0.7000468, -2.345654, 0, 1, 0.05882353, 1,
-0.3812813, 0.6212216, -0.2265376, 0, 1, 0.0627451, 1,
-0.380235, 0.3206136, -1.061806, 0, 1, 0.07058824, 1,
-0.3761984, 0.1515677, -1.548269, 0, 1, 0.07450981, 1,
-0.3758647, 1.027421, 0.4188877, 0, 1, 0.08235294, 1,
-0.3757974, 0.1718601, -2.59337, 0, 1, 0.08627451, 1,
-0.3657464, 1.154894, 0.5624467, 0, 1, 0.09411765, 1,
-0.3656335, 0.8855031, -0.8916756, 0, 1, 0.1019608, 1,
-0.3637387, -1.514576, -2.458715, 0, 1, 0.1058824, 1,
-0.3632708, 0.09828975, -2.838305, 0, 1, 0.1137255, 1,
-0.362177, -1.220557, -2.881933, 0, 1, 0.1176471, 1,
-0.3604571, -0.1797154, -1.699402, 0, 1, 0.1254902, 1,
-0.360108, 2.527968, -1.696347, 0, 1, 0.1294118, 1,
-0.3578821, -1.544246, -3.956219, 0, 1, 0.1372549, 1,
-0.3568898, -0.01367338, -2.021317, 0, 1, 0.1411765, 1,
-0.355926, 0.7109588, -0.1795193, 0, 1, 0.1490196, 1,
-0.3544511, -0.4888337, -1.181195, 0, 1, 0.1529412, 1,
-0.3533665, -0.4499587, -0.1276603, 0, 1, 0.1607843, 1,
-0.3523083, -0.2116748, -0.8684533, 0, 1, 0.1647059, 1,
-0.3470078, 0.4876754, -0.1967999, 0, 1, 0.172549, 1,
-0.3452887, -0.3671916, -0.4848258, 0, 1, 0.1764706, 1,
-0.3441705, -1.515308, -2.601437, 0, 1, 0.1843137, 1,
-0.3418428, 1.23292, -0.3967963, 0, 1, 0.1882353, 1,
-0.3356963, -0.3621012, -2.565547, 0, 1, 0.1960784, 1,
-0.3304969, -0.3283176, -3.910701, 0, 1, 0.2039216, 1,
-0.3192593, 0.5069302, -0.4006863, 0, 1, 0.2078431, 1,
-0.314048, -2.423573, -4.288775, 0, 1, 0.2156863, 1,
-0.3121424, -0.7818315, -1.917435, 0, 1, 0.2196078, 1,
-0.3085346, 0.1315605, -1.192685, 0, 1, 0.227451, 1,
-0.3068779, -0.1678808, -0.8122339, 0, 1, 0.2313726, 1,
-0.3058965, 0.6436169, 0.6782686, 0, 1, 0.2392157, 1,
-0.3032963, 0.7001076, 0.02580018, 0, 1, 0.2431373, 1,
-0.3028862, 1.122781, 0.3644145, 0, 1, 0.2509804, 1,
-0.3000025, -0.1763369, -1.504053, 0, 1, 0.254902, 1,
-0.2985356, -0.2147679, -0.9606492, 0, 1, 0.2627451, 1,
-0.2980562, 0.5294113, -0.1780409, 0, 1, 0.2666667, 1,
-0.292866, 0.7178487, 0.8515524, 0, 1, 0.2745098, 1,
-0.2914276, 0.8365877, -1.473609, 0, 1, 0.2784314, 1,
-0.2893718, 0.6222645, -1.88492, 0, 1, 0.2862745, 1,
-0.2861835, 1.883559, 0.5077116, 0, 1, 0.2901961, 1,
-0.2843193, 0.3966185, 0.4442488, 0, 1, 0.2980392, 1,
-0.2807101, 0.9577537, -0.5034869, 0, 1, 0.3058824, 1,
-0.2785408, 0.0479317, -1.678562, 0, 1, 0.3098039, 1,
-0.2708523, -1.934199, -2.086346, 0, 1, 0.3176471, 1,
-0.268333, -0.234009, -2.346464, 0, 1, 0.3215686, 1,
-0.2672403, 0.4527493, 0.1129707, 0, 1, 0.3294118, 1,
-0.2599744, 0.5363755, -1.560366, 0, 1, 0.3333333, 1,
-0.2595269, 0.5029882, 0.7656174, 0, 1, 0.3411765, 1,
-0.2551524, 0.589371, -0.01405981, 0, 1, 0.345098, 1,
-0.2551258, -0.7186343, -3.63288, 0, 1, 0.3529412, 1,
-0.2548464, -1.647534, -3.562943, 0, 1, 0.3568628, 1,
-0.2548368, 2.261633, 2.142527, 0, 1, 0.3647059, 1,
-0.2507593, 2.001225, -0.1120006, 0, 1, 0.3686275, 1,
-0.24955, -0.3613793, -1.328191, 0, 1, 0.3764706, 1,
-0.2466508, -0.4092972, -1.343591, 0, 1, 0.3803922, 1,
-0.2442635, -0.5514767, -2.044875, 0, 1, 0.3882353, 1,
-0.2423636, 0.2890799, -1.145402, 0, 1, 0.3921569, 1,
-0.2328425, -1.18963, -2.393768, 0, 1, 0.4, 1,
-0.2313485, -1.798061, -0.5771502, 0, 1, 0.4078431, 1,
-0.2202337, -0.002470411, -0.564516, 0, 1, 0.4117647, 1,
-0.2172939, -1.919738, -2.355853, 0, 1, 0.4196078, 1,
-0.2168494, 0.7619986, -1.209644, 0, 1, 0.4235294, 1,
-0.2142682, -0.1223835, -1.675843, 0, 1, 0.4313726, 1,
-0.209996, 1.229145, -2.04233, 0, 1, 0.4352941, 1,
-0.2074225, 0.1332557, -0.7239942, 0, 1, 0.4431373, 1,
-0.2062115, -0.5501223, -2.968344, 0, 1, 0.4470588, 1,
-0.205267, -1.146047, -2.304922, 0, 1, 0.454902, 1,
-0.1935448, 0.9506996, -2.121767, 0, 1, 0.4588235, 1,
-0.1934865, -1.233063, -0.6169614, 0, 1, 0.4666667, 1,
-0.1913284, 0.824001, -0.629679, 0, 1, 0.4705882, 1,
-0.1902346, 0.6113002, 0.04826331, 0, 1, 0.4784314, 1,
-0.1886461, -1.521478, -2.665983, 0, 1, 0.4823529, 1,
-0.1882966, -1.995423, -4.18552, 0, 1, 0.4901961, 1,
-0.1880153, 0.9495289, 0.4254809, 0, 1, 0.4941176, 1,
-0.1877265, -0.6781321, -3.266472, 0, 1, 0.5019608, 1,
-0.1818147, -0.235653, -2.759904, 0, 1, 0.509804, 1,
-0.1799725, 1.613723, -1.494355, 0, 1, 0.5137255, 1,
-0.1788947, 0.8206993, -0.02388853, 0, 1, 0.5215687, 1,
-0.1741683, 0.6513714, 0.4719495, 0, 1, 0.5254902, 1,
-0.1721692, -0.1134026, -3.485033, 0, 1, 0.5333334, 1,
-0.1707085, 0.6599756, -1.423262, 0, 1, 0.5372549, 1,
-0.1697443, -0.839572, -2.022005, 0, 1, 0.5450981, 1,
-0.167364, 1.28382, -1.757777, 0, 1, 0.5490196, 1,
-0.1665226, 1.458351, 0.8512118, 0, 1, 0.5568628, 1,
-0.1652059, 0.5296103, 0.5682852, 0, 1, 0.5607843, 1,
-0.1639312, 0.3449188, -1.542756, 0, 1, 0.5686275, 1,
-0.1618285, 1.119582, 0.8159633, 0, 1, 0.572549, 1,
-0.1595218, 0.1739004, -1.284487, 0, 1, 0.5803922, 1,
-0.1542372, 0.4073911, 0.1464143, 0, 1, 0.5843138, 1,
-0.1454942, 0.6485564, 0.1099883, 0, 1, 0.5921569, 1,
-0.1431504, 0.2300585, -0.6440105, 0, 1, 0.5960785, 1,
-0.1370095, -0.3660148, -2.831055, 0, 1, 0.6039216, 1,
-0.1298928, 0.07206362, -0.3862984, 0, 1, 0.6117647, 1,
-0.1273388, -0.3207797, -1.286298, 0, 1, 0.6156863, 1,
-0.1260145, 0.9369395, -1.297011, 0, 1, 0.6235294, 1,
-0.1165571, -0.7041166, -2.274148, 0, 1, 0.627451, 1,
-0.1118693, -0.6397017, -4.583127, 0, 1, 0.6352941, 1,
-0.1114412, 0.4997605, 0.4897075, 0, 1, 0.6392157, 1,
-0.1105282, 0.429875, -0.4185938, 0, 1, 0.6470588, 1,
-0.1092052, -0.6386565, -1.90008, 0, 1, 0.6509804, 1,
-0.1091184, -0.3633858, -4.160109, 0, 1, 0.6588235, 1,
-0.1069243, -0.2764666, -2.199704, 0, 1, 0.6627451, 1,
-0.1047427, -1.698135, -3.092726, 0, 1, 0.6705883, 1,
-0.1025274, -0.9646479, -2.800905, 0, 1, 0.6745098, 1,
-0.09900983, 1.664674, -1.118777, 0, 1, 0.682353, 1,
-0.09743135, 0.8477716, -0.3612716, 0, 1, 0.6862745, 1,
-0.09727991, 0.693562, -0.8749168, 0, 1, 0.6941177, 1,
-0.09691941, -0.1663637, -1.276611, 0, 1, 0.7019608, 1,
-0.0960348, -0.8253074, -2.372832, 0, 1, 0.7058824, 1,
-0.09584112, 1.180407, -1.645261, 0, 1, 0.7137255, 1,
-0.09435578, -0.2705271, -1.557078, 0, 1, 0.7176471, 1,
-0.09304184, -2.349274, -3.24238, 0, 1, 0.7254902, 1,
-0.08879425, -0.7352789, -3.003536, 0, 1, 0.7294118, 1,
-0.08810911, -0.01809416, -1.29639, 0, 1, 0.7372549, 1,
-0.08768954, 0.3213432, 0.8480322, 0, 1, 0.7411765, 1,
-0.08570171, 0.4347766, 0.621657, 0, 1, 0.7490196, 1,
-0.0839173, 1.490727, -0.6084352, 0, 1, 0.7529412, 1,
-0.08195968, 0.2181268, 0.4894384, 0, 1, 0.7607843, 1,
-0.0803571, -0.8535525, -3.420641, 0, 1, 0.7647059, 1,
-0.07976952, -0.1355494, -4.430128, 0, 1, 0.772549, 1,
-0.07965171, -0.700982, -3.922201, 0, 1, 0.7764706, 1,
-0.07297195, -1.555717, -3.423404, 0, 1, 0.7843137, 1,
-0.06904243, -0.2902534, -2.875423, 0, 1, 0.7882353, 1,
-0.06610347, 1.098001, -0.2193812, 0, 1, 0.7960784, 1,
-0.06207896, -0.8962914, -2.068959, 0, 1, 0.8039216, 1,
-0.06077035, -0.2645117, -4.273775, 0, 1, 0.8078431, 1,
-0.0554605, -1.225011, -2.657206, 0, 1, 0.8156863, 1,
-0.04864339, 0.6038792, -2.421427, 0, 1, 0.8196079, 1,
-0.04864289, -0.2126599, -2.469194, 0, 1, 0.827451, 1,
-0.04792647, -0.211686, -4.13454, 0, 1, 0.8313726, 1,
-0.04758171, -0.6115688, -3.424707, 0, 1, 0.8392157, 1,
-0.0420445, 1.077136, 0.3733345, 0, 1, 0.8431373, 1,
-0.04120823, 2.054349, 1.334584, 0, 1, 0.8509804, 1,
-0.04098044, -0.7597066, -3.156062, 0, 1, 0.854902, 1,
-0.03447938, -1.469724, -3.002881, 0, 1, 0.8627451, 1,
-0.03181257, 2.077718, 0.2069003, 0, 1, 0.8666667, 1,
-0.02927699, -0.004020243, -3.604151, 0, 1, 0.8745098, 1,
-0.02819877, 0.3312235, 0.1507874, 0, 1, 0.8784314, 1,
-0.02760504, 0.1000809, -0.4849702, 0, 1, 0.8862745, 1,
-0.02588451, -1.729777, -4.958318, 0, 1, 0.8901961, 1,
-0.02538528, -0.9144247, -4.023313, 0, 1, 0.8980392, 1,
-0.02309772, 0.7938262, 0.3563366, 0, 1, 0.9058824, 1,
-0.01734472, 1.172282, -0.2412009, 0, 1, 0.9098039, 1,
-0.01244458, 0.9928803, 1.977768, 0, 1, 0.9176471, 1,
-0.004875648, 0.4871682, -2.513133, 0, 1, 0.9215686, 1,
-0.004344502, -0.7324648, -5.676253, 0, 1, 0.9294118, 1,
-0.0004443794, 0.2719759, -0.901007, 0, 1, 0.9333333, 1,
0.002000025, -0.1574833, 3.247478, 0, 1, 0.9411765, 1,
0.002673152, -1.333305, 4.567516, 0, 1, 0.945098, 1,
0.002775558, -0.2064964, 3.927315, 0, 1, 0.9529412, 1,
0.004597154, -0.581726, 2.883763, 0, 1, 0.9568627, 1,
0.004900363, -0.7492204, 3.922707, 0, 1, 0.9647059, 1,
0.005384055, -0.4507222, 3.278317, 0, 1, 0.9686275, 1,
0.01112943, 0.770385, 0.3540129, 0, 1, 0.9764706, 1,
0.02154211, 1.520708, -1.742927, 0, 1, 0.9803922, 1,
0.02241232, -0.212067, 4.003258, 0, 1, 0.9882353, 1,
0.02762023, 1.370813, 1.285049, 0, 1, 0.9921569, 1,
0.03079268, 0.7759038, 1.065298, 0, 1, 1, 1,
0.03599459, 0.98209, -0.1737528, 0, 0.9921569, 1, 1,
0.03838799, 0.1161609, -0.4983833, 0, 0.9882353, 1, 1,
0.04063407, -0.1008552, 3.109277, 0, 0.9803922, 1, 1,
0.04178798, 0.3228527, 2.232183, 0, 0.9764706, 1, 1,
0.04279442, -0.7707507, 4.187383, 0, 0.9686275, 1, 1,
0.04495315, -0.1789358, 1.933618, 0, 0.9647059, 1, 1,
0.04573806, 1.150446, -0.0322312, 0, 0.9568627, 1, 1,
0.04672207, -1.042794, 3.611994, 0, 0.9529412, 1, 1,
0.04704776, 0.4035297, 1.305516, 0, 0.945098, 1, 1,
0.05058053, 1.102181, -0.3598177, 0, 0.9411765, 1, 1,
0.05221559, 0.677541, 1.485267, 0, 0.9333333, 1, 1,
0.05463881, 0.2609252, 2.316781, 0, 0.9294118, 1, 1,
0.06024667, -0.2856047, 2.151722, 0, 0.9215686, 1, 1,
0.06028201, -0.1095017, 2.845155, 0, 0.9176471, 1, 1,
0.06225957, 0.6718026, -0.8181139, 0, 0.9098039, 1, 1,
0.06761133, 0.611226, -3.035529, 0, 0.9058824, 1, 1,
0.06879526, 0.002595912, 1.75186, 0, 0.8980392, 1, 1,
0.07357755, 0.7980341, -0.820015, 0, 0.8901961, 1, 1,
0.07684541, -0.3853955, 1.749415, 0, 0.8862745, 1, 1,
0.07797334, 0.8656688, 0.975593, 0, 0.8784314, 1, 1,
0.07824726, 0.2430712, -0.001130594, 0, 0.8745098, 1, 1,
0.08135272, 0.5736151, 1.313113, 0, 0.8666667, 1, 1,
0.0921323, -0.2090952, 2.289608, 0, 0.8627451, 1, 1,
0.09408021, -0.045775, 2.824732, 0, 0.854902, 1, 1,
0.09636413, 0.1729818, 0.002652851, 0, 0.8509804, 1, 1,
0.09747714, -0.1904702, 3.650742, 0, 0.8431373, 1, 1,
0.108752, -0.5904503, 2.746522, 0, 0.8392157, 1, 1,
0.1115135, 1.513098, 0.7869374, 0, 0.8313726, 1, 1,
0.1200444, 0.4753122, 2.605271, 0, 0.827451, 1, 1,
0.1243832, 0.2884555, 1.454164, 0, 0.8196079, 1, 1,
0.1310171, -0.1056378, 1.444662, 0, 0.8156863, 1, 1,
0.1310739, 0.6499803, -0.1443373, 0, 0.8078431, 1, 1,
0.1326002, 0.9816699, 0.1956302, 0, 0.8039216, 1, 1,
0.1328165, -0.2572112, 0.2390654, 0, 0.7960784, 1, 1,
0.1329824, -0.4961369, 2.589455, 0, 0.7882353, 1, 1,
0.1371524, -0.5501505, 3.769871, 0, 0.7843137, 1, 1,
0.1396585, -0.206625, 3.183486, 0, 0.7764706, 1, 1,
0.14251, -0.8184024, 5.266945, 0, 0.772549, 1, 1,
0.1466735, 0.5720536, 0.7733106, 0, 0.7647059, 1, 1,
0.1481156, -0.6730065, 2.40483, 0, 0.7607843, 1, 1,
0.1493197, 0.5747167, 0.6527548, 0, 0.7529412, 1, 1,
0.1493363, 0.8064002, 1.965932, 0, 0.7490196, 1, 1,
0.1503002, 0.1495095, 0.3488797, 0, 0.7411765, 1, 1,
0.1504236, 0.6015186, -0.03133693, 0, 0.7372549, 1, 1,
0.1513121, -2.710713, 1.920062, 0, 0.7294118, 1, 1,
0.152307, -0.8954144, 2.299605, 0, 0.7254902, 1, 1,
0.1529991, -1.139268, 2.757649, 0, 0.7176471, 1, 1,
0.1548378, -0.6273361, 4.634068, 0, 0.7137255, 1, 1,
0.1590583, -1.070773, 1.984062, 0, 0.7058824, 1, 1,
0.1614118, 1.631898, -0.9812049, 0, 0.6980392, 1, 1,
0.1626848, 2.799284, -0.05604729, 0, 0.6941177, 1, 1,
0.1629881, 0.1007791, 0.9342611, 0, 0.6862745, 1, 1,
0.1647931, -0.5791546, 3.707923, 0, 0.682353, 1, 1,
0.1693849, -0.8806638, 2.873744, 0, 0.6745098, 1, 1,
0.1717412, -0.2427782, 3.352274, 0, 0.6705883, 1, 1,
0.1735628, 0.04024115, 2.868052, 0, 0.6627451, 1, 1,
0.174202, -0.6931722, 3.245197, 0, 0.6588235, 1, 1,
0.174576, 0.5896294, -0.6854161, 0, 0.6509804, 1, 1,
0.1800425, -0.9302032, 1.63655, 0, 0.6470588, 1, 1,
0.1806361, 0.8714907, 1.181651, 0, 0.6392157, 1, 1,
0.1815973, 1.097588, 1.289519, 0, 0.6352941, 1, 1,
0.1817227, -1.237414, 0.9458607, 0, 0.627451, 1, 1,
0.1841678, -0.3164232, 1.034258, 0, 0.6235294, 1, 1,
0.1850595, 0.8354198, 0.7042133, 0, 0.6156863, 1, 1,
0.1867636, 1.444862, 0.89785, 0, 0.6117647, 1, 1,
0.1881444, 1.38177, -0.1355872, 0, 0.6039216, 1, 1,
0.1916195, 1.207551, -0.734163, 0, 0.5960785, 1, 1,
0.1920615, 0.1310553, 3.053746, 0, 0.5921569, 1, 1,
0.1981873, 1.816539, -0.9439474, 0, 0.5843138, 1, 1,
0.20038, -0.1781957, 1.468444, 0, 0.5803922, 1, 1,
0.2023184, -0.6432148, 4.654491, 0, 0.572549, 1, 1,
0.2040586, 0.4429085, 0.6426625, 0, 0.5686275, 1, 1,
0.204291, -1.268393, 3.090696, 0, 0.5607843, 1, 1,
0.2047262, 1.66215, -1.670427, 0, 0.5568628, 1, 1,
0.2049427, 0.3475424, -1.819202, 0, 0.5490196, 1, 1,
0.2057354, -0.5881334, 5.200245, 0, 0.5450981, 1, 1,
0.2116915, 1.071459, 0.44283, 0, 0.5372549, 1, 1,
0.2148185, -1.28264, 5.207569, 0, 0.5333334, 1, 1,
0.2149312, 1.597057, 1.482643, 0, 0.5254902, 1, 1,
0.2150394, 0.3885246, 0.8034267, 0, 0.5215687, 1, 1,
0.2180583, 0.1432828, 2.163557, 0, 0.5137255, 1, 1,
0.2181119, -0.3251139, 2.656647, 0, 0.509804, 1, 1,
0.2193662, 0.570485, 0.5016916, 0, 0.5019608, 1, 1,
0.2224317, -0.1071491, 0.7385583, 0, 0.4941176, 1, 1,
0.2236906, 1.382006, -0.1173722, 0, 0.4901961, 1, 1,
0.2251158, 0.9451076, -0.4048424, 0, 0.4823529, 1, 1,
0.2253137, -0.1415152, 2.508595, 0, 0.4784314, 1, 1,
0.237671, -0.5437232, 1.48981, 0, 0.4705882, 1, 1,
0.2379165, -1.301082, 3.873513, 0, 0.4666667, 1, 1,
0.2436069, -0.3615361, 2.515677, 0, 0.4588235, 1, 1,
0.2451219, -0.1300168, -0.3180047, 0, 0.454902, 1, 1,
0.246693, -0.2520842, 1.856869, 0, 0.4470588, 1, 1,
0.2482731, -0.5959505, 4.240875, 0, 0.4431373, 1, 1,
0.2505341, -0.5574336, 0.5535436, 0, 0.4352941, 1, 1,
0.2541304, -1.417431, 2.043324, 0, 0.4313726, 1, 1,
0.2581758, 0.1473425, 0.6317233, 0, 0.4235294, 1, 1,
0.2610517, -0.1108114, 0.5513178, 0, 0.4196078, 1, 1,
0.2622706, -0.5582958, 2.510249, 0, 0.4117647, 1, 1,
0.2635876, 0.1579739, 1.31587, 0, 0.4078431, 1, 1,
0.2637255, 0.2044497, 1.111488, 0, 0.4, 1, 1,
0.2694182, 1.772686, 1.089959, 0, 0.3921569, 1, 1,
0.2710817, -0.9593088, 2.05548, 0, 0.3882353, 1, 1,
0.2784264, 1.015038, 1.532094, 0, 0.3803922, 1, 1,
0.2904629, 2.202024, -0.3325064, 0, 0.3764706, 1, 1,
0.2917183, 1.338481, -0.7676562, 0, 0.3686275, 1, 1,
0.2921299, 0.627184, -0.006655896, 0, 0.3647059, 1, 1,
0.2949487, 1.260098, -2.103062, 0, 0.3568628, 1, 1,
0.2972445, 1.502882, 1.044544, 0, 0.3529412, 1, 1,
0.3091327, 2.244298, -0.7397937, 0, 0.345098, 1, 1,
0.3092502, -1.379539, 1.096393, 0, 0.3411765, 1, 1,
0.3097312, 0.3646794, 1.624264, 0, 0.3333333, 1, 1,
0.3115512, -0.6188883, 3.590614, 0, 0.3294118, 1, 1,
0.3124304, -1.363919, 1.505093, 0, 0.3215686, 1, 1,
0.3124454, -0.5876865, 3.59306, 0, 0.3176471, 1, 1,
0.3146616, 0.9413866, 0.6550173, 0, 0.3098039, 1, 1,
0.3154399, 0.09902574, 1.632047, 0, 0.3058824, 1, 1,
0.3168745, 0.3645251, 1.3683, 0, 0.2980392, 1, 1,
0.3227076, 0.4113727, 0.7795852, 0, 0.2901961, 1, 1,
0.3281694, -0.2897292, 5.140635, 0, 0.2862745, 1, 1,
0.3308218, -0.6003325, 3.720373, 0, 0.2784314, 1, 1,
0.3380805, 0.5573682, -0.1281498, 0, 0.2745098, 1, 1,
0.3439806, 0.01285876, 0.2431545, 0, 0.2666667, 1, 1,
0.3441984, -0.1498649, 0.9002294, 0, 0.2627451, 1, 1,
0.3445064, 0.5132109, -0.01193742, 0, 0.254902, 1, 1,
0.3542556, 0.1212077, -0.2561125, 0, 0.2509804, 1, 1,
0.3548651, -1.521966, 1.823947, 0, 0.2431373, 1, 1,
0.357945, 1.556155, 0.2018334, 0, 0.2392157, 1, 1,
0.3646265, 0.1890784, 1.801171, 0, 0.2313726, 1, 1,
0.3670134, 0.7015041, -0.1456009, 0, 0.227451, 1, 1,
0.3701276, 0.9161752, 0.2804354, 0, 0.2196078, 1, 1,
0.3705733, -2.303601, 2.117965, 0, 0.2156863, 1, 1,
0.3724885, 1.790388, 1.607623, 0, 0.2078431, 1, 1,
0.3736587, 0.515222, -0.4677634, 0, 0.2039216, 1, 1,
0.3790009, 0.2381798, 2.570719, 0, 0.1960784, 1, 1,
0.3790574, -0.5461267, 4.636907, 0, 0.1882353, 1, 1,
0.3793364, 1.897534, -0.1176157, 0, 0.1843137, 1, 1,
0.3813634, -1.676288, 2.527489, 0, 0.1764706, 1, 1,
0.3824264, 1.08321, -0.1611667, 0, 0.172549, 1, 1,
0.3907516, 0.3143685, 1.064307, 0, 0.1647059, 1, 1,
0.391692, -1.914715, 3.140677, 0, 0.1607843, 1, 1,
0.3931316, 0.0392523, 2.001823, 0, 0.1529412, 1, 1,
0.3945819, 0.4154176, 0.9521388, 0, 0.1490196, 1, 1,
0.4016052, 0.09599119, 1.674005, 0, 0.1411765, 1, 1,
0.4043384, -1.895688, 2.552402, 0, 0.1372549, 1, 1,
0.4051757, 0.7097264, 2.063967, 0, 0.1294118, 1, 1,
0.413691, -2.160297, 3.64464, 0, 0.1254902, 1, 1,
0.4244112, 0.3865373, 0.7166043, 0, 0.1176471, 1, 1,
0.4251809, -0.4296275, 2.539445, 0, 0.1137255, 1, 1,
0.4254863, -3.016335, 0.5587051, 0, 0.1058824, 1, 1,
0.4259898, 0.275269, 2.168887, 0, 0.09803922, 1, 1,
0.4286794, -1.325927, 2.690692, 0, 0.09411765, 1, 1,
0.4316993, 1.09292, -0.05939314, 0, 0.08627451, 1, 1,
0.4334277, -0.4987449, 2.107249, 0, 0.08235294, 1, 1,
0.4337575, -0.5526549, 1.7478, 0, 0.07450981, 1, 1,
0.4390292, 0.8715144, 0.2004978, 0, 0.07058824, 1, 1,
0.4484507, 0.6851177, 0.4297008, 0, 0.0627451, 1, 1,
0.451987, -0.3346755, 3.954718, 0, 0.05882353, 1, 1,
0.4527318, 1.033397, 1.11445, 0, 0.05098039, 1, 1,
0.4538064, -0.323462, 4.582727, 0, 0.04705882, 1, 1,
0.4569009, -0.5233648, 0.7359132, 0, 0.03921569, 1, 1,
0.4603245, -1.661073, 2.507746, 0, 0.03529412, 1, 1,
0.4666094, -0.1447068, 2.379904, 0, 0.02745098, 1, 1,
0.4705805, 0.3950274, 1.774902, 0, 0.02352941, 1, 1,
0.4727243, -0.2925374, 3.25535, 0, 0.01568628, 1, 1,
0.4730944, -0.9901998, 3.605233, 0, 0.01176471, 1, 1,
0.4735356, 1.61645, -1.080909, 0, 0.003921569, 1, 1,
0.4772449, -0.06973398, 1.974549, 0.003921569, 0, 1, 1,
0.4779589, -0.4050928, 1.717453, 0.007843138, 0, 1, 1,
0.4829004, 0.3244029, 1.460344, 0.01568628, 0, 1, 1,
0.4909681, -1.458853, 1.486042, 0.01960784, 0, 1, 1,
0.4929154, -0.5568242, 2.556557, 0.02745098, 0, 1, 1,
0.4979727, 0.585459, -0.2971292, 0.03137255, 0, 1, 1,
0.4986185, -1.483573, 3.063541, 0.03921569, 0, 1, 1,
0.5000063, -0.6469353, 3.126914, 0.04313726, 0, 1, 1,
0.5006481, -0.7084683, 5.841499, 0.05098039, 0, 1, 1,
0.5076997, -0.06157226, 1.093956, 0.05490196, 0, 1, 1,
0.5115772, 0.3761013, 0.08434276, 0.0627451, 0, 1, 1,
0.5117218, -1.03458, 2.611009, 0.06666667, 0, 1, 1,
0.5153293, 0.5698251, -0.7944919, 0.07450981, 0, 1, 1,
0.5154704, -0.3858397, 1.305456, 0.07843138, 0, 1, 1,
0.5159863, 0.64498, -0.9465141, 0.08627451, 0, 1, 1,
0.5166191, 0.2603357, 0.4875395, 0.09019608, 0, 1, 1,
0.5242912, -0.3824359, 2.02494, 0.09803922, 0, 1, 1,
0.5242925, 0.6671412, -0.3445463, 0.1058824, 0, 1, 1,
0.5285778, -0.2860721, 1.978272, 0.1098039, 0, 1, 1,
0.5308889, -1.005875, 1.099895, 0.1176471, 0, 1, 1,
0.532519, -1.208915, 2.600312, 0.1215686, 0, 1, 1,
0.5365031, -0.4667321, 2.568748, 0.1294118, 0, 1, 1,
0.5378294, 1.309194, -1.055203, 0.1333333, 0, 1, 1,
0.540673, -0.8982007, 1.126596, 0.1411765, 0, 1, 1,
0.5417284, -0.977558, 2.732913, 0.145098, 0, 1, 1,
0.5419853, 0.8993517, -1.366788, 0.1529412, 0, 1, 1,
0.5428054, -0.04135231, 1.887549, 0.1568628, 0, 1, 1,
0.5515178, -0.5840194, 3.093159, 0.1647059, 0, 1, 1,
0.5538979, 0.8054958, 0.4400424, 0.1686275, 0, 1, 1,
0.5655376, -0.3182738, 2.513818, 0.1764706, 0, 1, 1,
0.5694851, 1.492326, 0.623324, 0.1803922, 0, 1, 1,
0.5740893, -0.4072613, 1.902937, 0.1882353, 0, 1, 1,
0.5800865, -1.585203, 4.22969, 0.1921569, 0, 1, 1,
0.5806061, -0.731439, 1.31853, 0.2, 0, 1, 1,
0.582095, 1.755424, 0.1337628, 0.2078431, 0, 1, 1,
0.5831145, -0.3192482, 0.812986, 0.2117647, 0, 1, 1,
0.588761, 1.822237, 1.81609, 0.2196078, 0, 1, 1,
0.5890654, -1.239198, 1.652131, 0.2235294, 0, 1, 1,
0.5953064, 1.197931, 0.7048319, 0.2313726, 0, 1, 1,
0.6091289, -0.5035136, 1.744121, 0.2352941, 0, 1, 1,
0.6118849, -1.013964, 2.103146, 0.2431373, 0, 1, 1,
0.6120414, 0.6184136, -0.7447847, 0.2470588, 0, 1, 1,
0.6127453, 0.7512388, 0.837453, 0.254902, 0, 1, 1,
0.6131278, -1.507118, 3.190447, 0.2588235, 0, 1, 1,
0.6151423, -0.09676285, 2.033279, 0.2666667, 0, 1, 1,
0.618373, 0.84957, 2.183314, 0.2705882, 0, 1, 1,
0.6199627, 0.5819662, 0.03896672, 0.2784314, 0, 1, 1,
0.6252571, -1.233373, 1.018572, 0.282353, 0, 1, 1,
0.6277067, 0.23133, 1.384015, 0.2901961, 0, 1, 1,
0.6282857, -0.9316272, 1.849534, 0.2941177, 0, 1, 1,
0.6347156, 0.2715064, 1.826867, 0.3019608, 0, 1, 1,
0.6352902, -0.5205671, 1.283163, 0.3098039, 0, 1, 1,
0.6353289, 0.6938418, 1.307288, 0.3137255, 0, 1, 1,
0.636169, 0.297277, 1.409803, 0.3215686, 0, 1, 1,
0.6376931, 0.4230545, 0.7910582, 0.3254902, 0, 1, 1,
0.6403706, 0.816255, 0.5909373, 0.3333333, 0, 1, 1,
0.6414582, 1.329481, 0.2666452, 0.3372549, 0, 1, 1,
0.6452397, -0.7304481, 2.479215, 0.345098, 0, 1, 1,
0.6466215, -0.8695352, 2.604041, 0.3490196, 0, 1, 1,
0.6496343, 0.5470492, 1.64339, 0.3568628, 0, 1, 1,
0.649635, -1.164833, 4.317758, 0.3607843, 0, 1, 1,
0.6519305, 1.206659, 0.1332911, 0.3686275, 0, 1, 1,
0.6625764, 0.9089059, 0.3507488, 0.372549, 0, 1, 1,
0.6643482, 0.003625856, 2.034982, 0.3803922, 0, 1, 1,
0.6675747, 1.425751, -0.2921244, 0.3843137, 0, 1, 1,
0.6710979, -0.7990745, 1.478211, 0.3921569, 0, 1, 1,
0.6716121, 0.5242306, 1.41361, 0.3960784, 0, 1, 1,
0.6754768, -0.2606005, 3.808639, 0.4039216, 0, 1, 1,
0.6810669, 0.1541104, 1.02082, 0.4117647, 0, 1, 1,
0.6816772, -1.000146, 3.671926, 0.4156863, 0, 1, 1,
0.6932642, 1.550965, 0.5542588, 0.4235294, 0, 1, 1,
0.6942261, -1.730534, 2.877263, 0.427451, 0, 1, 1,
0.6954061, -1.357571, 1.745748, 0.4352941, 0, 1, 1,
0.6955348, 0.6213974, 0.7451875, 0.4392157, 0, 1, 1,
0.6959566, -0.4740243, 2.863691, 0.4470588, 0, 1, 1,
0.6992958, 2.052008, 1.530288, 0.4509804, 0, 1, 1,
0.7002662, 0.3590594, 0.1802953, 0.4588235, 0, 1, 1,
0.7071936, 0.4514958, 0.2884753, 0.4627451, 0, 1, 1,
0.7098284, 1.457078, -1.402487, 0.4705882, 0, 1, 1,
0.7182711, -0.9759762, 2.500264, 0.4745098, 0, 1, 1,
0.7198343, 0.5463543, 1.231001, 0.4823529, 0, 1, 1,
0.7251832, -1.082803, 3.929746, 0.4862745, 0, 1, 1,
0.7312633, 0.6985224, 0.1646752, 0.4941176, 0, 1, 1,
0.7366164, 0.9569679, -1.261923, 0.5019608, 0, 1, 1,
0.739414, 0.5980352, 0.7594852, 0.5058824, 0, 1, 1,
0.749838, -0.2558069, 1.368978, 0.5137255, 0, 1, 1,
0.7507282, -0.7874737, 1.152402, 0.5176471, 0, 1, 1,
0.7541947, 1.461479, 1.968666, 0.5254902, 0, 1, 1,
0.7786399, -0.8731973, 3.528644, 0.5294118, 0, 1, 1,
0.7831992, 1.382833, -0.1150616, 0.5372549, 0, 1, 1,
0.7859923, 1.489047, 1.692581, 0.5411765, 0, 1, 1,
0.7888774, -1.552159, 2.617791, 0.5490196, 0, 1, 1,
0.7907316, -0.7112519, 1.507066, 0.5529412, 0, 1, 1,
0.7945345, 1.410916, 0.3027651, 0.5607843, 0, 1, 1,
0.7959445, 0.2001911, 1.183719, 0.5647059, 0, 1, 1,
0.797294, 0.6617075, -0.7702378, 0.572549, 0, 1, 1,
0.7988763, -0.621195, 4.150459, 0.5764706, 0, 1, 1,
0.800029, 1.370514, -0.4111513, 0.5843138, 0, 1, 1,
0.8040606, 0.7012585, 1.84817, 0.5882353, 0, 1, 1,
0.805543, -0.1548449, 3.727423, 0.5960785, 0, 1, 1,
0.8059368, 0.07411851, 1.305483, 0.6039216, 0, 1, 1,
0.8100438, -0.3186558, 2.601155, 0.6078432, 0, 1, 1,
0.8150046, -0.1734091, 0.02988741, 0.6156863, 0, 1, 1,
0.8276844, -0.9407799, 1.445231, 0.6196079, 0, 1, 1,
0.8300483, -2.00736, 5.442193, 0.627451, 0, 1, 1,
0.8308307, -0.03542761, 1.563924, 0.6313726, 0, 1, 1,
0.830854, 0.3488138, 2.964086, 0.6392157, 0, 1, 1,
0.8319796, -1.063192, 1.233416, 0.6431373, 0, 1, 1,
0.8343751, -0.0934833, 0.5915606, 0.6509804, 0, 1, 1,
0.835603, 1.599603, -2.012683, 0.654902, 0, 1, 1,
0.8358376, -0.9554582, 2.364581, 0.6627451, 0, 1, 1,
0.8370472, -1.233706, 2.224985, 0.6666667, 0, 1, 1,
0.8398754, -0.3019669, 1.167392, 0.6745098, 0, 1, 1,
0.8424823, 0.9311304, 0.9543259, 0.6784314, 0, 1, 1,
0.8426452, 2.029446, 2.318533, 0.6862745, 0, 1, 1,
0.8477526, -0.5829135, 2.337482, 0.6901961, 0, 1, 1,
0.8532349, 0.1846402, 2.230925, 0.6980392, 0, 1, 1,
0.8562928, 0.8166273, -1.054378, 0.7058824, 0, 1, 1,
0.8583468, -1.139257, 2.817485, 0.7098039, 0, 1, 1,
0.8644712, 0.2564241, 1.697773, 0.7176471, 0, 1, 1,
0.8684943, 0.616204, -0.5784028, 0.7215686, 0, 1, 1,
0.871837, -0.2017753, 2.489717, 0.7294118, 0, 1, 1,
0.8770673, 1.23927, 0.875693, 0.7333333, 0, 1, 1,
0.8782663, 1.001732, 0.6779558, 0.7411765, 0, 1, 1,
0.8849807, 2.088234, -0.6334165, 0.7450981, 0, 1, 1,
0.8852634, 2.306852, -0.4158903, 0.7529412, 0, 1, 1,
0.886655, 0.1913569, 2.046069, 0.7568628, 0, 1, 1,
0.8884803, -0.8022903, 3.120862, 0.7647059, 0, 1, 1,
0.8905131, -1.279817, 2.470468, 0.7686275, 0, 1, 1,
0.8948169, -0.006342943, 1.654138, 0.7764706, 0, 1, 1,
0.8966707, -2.523328, 3.443668, 0.7803922, 0, 1, 1,
0.8982145, -0.1598996, 0.4918838, 0.7882353, 0, 1, 1,
0.9017989, -1.018361, 2.296226, 0.7921569, 0, 1, 1,
0.905472, -2.195227, 1.213885, 0.8, 0, 1, 1,
0.9060335, 0.2542295, -1.469838, 0.8078431, 0, 1, 1,
0.9062967, 1.150583, -0.9290197, 0.8117647, 0, 1, 1,
0.9068747, 0.06348345, 0.4006939, 0.8196079, 0, 1, 1,
0.9076511, -0.6716748, 2.966483, 0.8235294, 0, 1, 1,
0.9083835, -1.635116, 0.7020127, 0.8313726, 0, 1, 1,
0.9168286, -0.1971236, 0.2122221, 0.8352941, 0, 1, 1,
0.9201728, 1.129276, -0.9259476, 0.8431373, 0, 1, 1,
0.9204378, 1.496301, 0.2312152, 0.8470588, 0, 1, 1,
0.9276193, -1.011348, 3.076431, 0.854902, 0, 1, 1,
0.9464139, 0.03423229, 2.003659, 0.8588235, 0, 1, 1,
0.9491946, -0.2154686, 1.018139, 0.8666667, 0, 1, 1,
0.9527402, 0.5881534, 2.003132, 0.8705882, 0, 1, 1,
0.9539812, -0.6635578, 2.666947, 0.8784314, 0, 1, 1,
0.958351, 0.8766208, 0.4993445, 0.8823529, 0, 1, 1,
0.9605513, 0.4985791, 2.076672, 0.8901961, 0, 1, 1,
0.9683313, -0.08377648, 0.9026579, 0.8941177, 0, 1, 1,
0.9698849, 2.13761, 1.069889, 0.9019608, 0, 1, 1,
0.9728305, -1.898289, 4.388162, 0.9098039, 0, 1, 1,
0.9885502, 0.9121224, -0.5119694, 0.9137255, 0, 1, 1,
0.9917296, 0.04767772, 1.432058, 0.9215686, 0, 1, 1,
0.9923049, -0.08201429, 0.5844914, 0.9254902, 0, 1, 1,
1.010405, -0.3433384, 0.3944219, 0.9333333, 0, 1, 1,
1.014508, 0.06533172, -0.7511318, 0.9372549, 0, 1, 1,
1.015124, -0.09403998, 1.226311, 0.945098, 0, 1, 1,
1.018176, -0.180784, 0.8927092, 0.9490196, 0, 1, 1,
1.024278, 0.02439195, 2.621686, 0.9568627, 0, 1, 1,
1.024934, 0.8922576, 1.985064, 0.9607843, 0, 1, 1,
1.029292, -0.3236647, 4.001475, 0.9686275, 0, 1, 1,
1.034148, 0.2060894, 1.292692, 0.972549, 0, 1, 1,
1.034614, -0.3609095, 3.014071, 0.9803922, 0, 1, 1,
1.036174, 0.4911352, 1.261005, 0.9843137, 0, 1, 1,
1.037317, -1.753104, 4.628351, 0.9921569, 0, 1, 1,
1.040049, -0.01912944, 0.5946594, 0.9960784, 0, 1, 1,
1.052121, 0.7400074, -1.334173, 1, 0, 0.9960784, 1,
1.071457, -0.683549, 3.454373, 1, 0, 0.9882353, 1,
1.077112, -0.6452463, 3.061398, 1, 0, 0.9843137, 1,
1.077743, -1.194465, 1.487493, 1, 0, 0.9764706, 1,
1.078005, 0.329708, 0.8568309, 1, 0, 0.972549, 1,
1.092724, 0.6362208, 1.628763, 1, 0, 0.9647059, 1,
1.09706, -0.8229257, 2.025286, 1, 0, 0.9607843, 1,
1.100404, 0.8737431, -0.2832195, 1, 0, 0.9529412, 1,
1.100644, -0.5411735, 1.867979, 1, 0, 0.9490196, 1,
1.100666, 1.659235, 2.138842, 1, 0, 0.9411765, 1,
1.107155, 0.2724608, 2.253568, 1, 0, 0.9372549, 1,
1.115123, 1.109784, 0.1883212, 1, 0, 0.9294118, 1,
1.115447, 0.5974386, 1.938438, 1, 0, 0.9254902, 1,
1.115852, 0.6878999, 1.118998, 1, 0, 0.9176471, 1,
1.122003, -0.9161856, 2.917163, 1, 0, 0.9137255, 1,
1.130028, -1.414039, 2.010087, 1, 0, 0.9058824, 1,
1.168188, 0.9179447, 2.033147, 1, 0, 0.9019608, 1,
1.17356, -1.099795, 2.082892, 1, 0, 0.8941177, 1,
1.175138, -0.5953222, 1.046801, 1, 0, 0.8862745, 1,
1.177609, -2.150929, 4.073585, 1, 0, 0.8823529, 1,
1.18221, 0.5150053, 1.53742, 1, 0, 0.8745098, 1,
1.187642, -0.2750115, 3.580527, 1, 0, 0.8705882, 1,
1.187706, -1.115591, 3.456042, 1, 0, 0.8627451, 1,
1.188607, -2.484601, 2.601855, 1, 0, 0.8588235, 1,
1.193158, 0.131253, 0.9071707, 1, 0, 0.8509804, 1,
1.194374, -0.04063228, 2.175987, 1, 0, 0.8470588, 1,
1.203902, -0.4611323, 1.979551, 1, 0, 0.8392157, 1,
1.205292, 1.462623, 0.4168343, 1, 0, 0.8352941, 1,
1.208764, 1.706788, 1.550595, 1, 0, 0.827451, 1,
1.212451, 0.963495, 1.656596, 1, 0, 0.8235294, 1,
1.212458, 0.3836158, 1.010735, 1, 0, 0.8156863, 1,
1.213418, -0.9757515, 1.904894, 1, 0, 0.8117647, 1,
1.213672, -0.5810288, 2.808994, 1, 0, 0.8039216, 1,
1.215847, 1.40498, -1.355917, 1, 0, 0.7960784, 1,
1.226025, -1.509381, 2.63964, 1, 0, 0.7921569, 1,
1.23327, 0.1622651, 0.7382042, 1, 0, 0.7843137, 1,
1.234816, 0.2485179, 1.643386, 1, 0, 0.7803922, 1,
1.254995, -1.111681, 5.050232, 1, 0, 0.772549, 1,
1.259921, -0.04019748, 2.968229, 1, 0, 0.7686275, 1,
1.262388, 1.438822, 2.214018, 1, 0, 0.7607843, 1,
1.263446, 0.943202, 1.209323, 1, 0, 0.7568628, 1,
1.263596, -0.08160846, 0.6851906, 1, 0, 0.7490196, 1,
1.264364, 1.3972, -1.221761, 1, 0, 0.7450981, 1,
1.269356, -0.3905704, 3.083083, 1, 0, 0.7372549, 1,
1.271964, 2.201544, 0.5446806, 1, 0, 0.7333333, 1,
1.273972, 1.116794, 0.6765249, 1, 0, 0.7254902, 1,
1.278157, -1.75223, 2.885635, 1, 0, 0.7215686, 1,
1.286364, 0.4427433, 1.339375, 1, 0, 0.7137255, 1,
1.290264, 1.194447, -0.6796978, 1, 0, 0.7098039, 1,
1.290722, 0.8933699, 1.216758, 1, 0, 0.7019608, 1,
1.295153, -1.168849, 0.7150367, 1, 0, 0.6941177, 1,
1.29736, 0.7179062, 1.198572, 1, 0, 0.6901961, 1,
1.297622, 0.006156588, -0.8310908, 1, 0, 0.682353, 1,
1.301896, -1.318091, 3.351857, 1, 0, 0.6784314, 1,
1.30428, -0.4363137, 2.663381, 1, 0, 0.6705883, 1,
1.306166, -0.1372657, -0.1844328, 1, 0, 0.6666667, 1,
1.313004, 1.437869, 0.4652767, 1, 0, 0.6588235, 1,
1.314111, 1.37948, 0.171534, 1, 0, 0.654902, 1,
1.318276, -2.25602, 2.695916, 1, 0, 0.6470588, 1,
1.332877, 1.595757, 0.2307695, 1, 0, 0.6431373, 1,
1.33938, 0.2709228, 1.94767, 1, 0, 0.6352941, 1,
1.346892, 0.1361405, 1.30544, 1, 0, 0.6313726, 1,
1.34874, 0.863225, 0.7853895, 1, 0, 0.6235294, 1,
1.349564, 0.3938661, 4.104818, 1, 0, 0.6196079, 1,
1.353061, -1.759475, 1.716677, 1, 0, 0.6117647, 1,
1.356783, -0.8318267, -0.05388822, 1, 0, 0.6078432, 1,
1.357558, 0.6190075, 0.4407577, 1, 0, 0.6, 1,
1.357706, 1.034413, 1.621526, 1, 0, 0.5921569, 1,
1.360298, -0.6796795, 2.684592, 1, 0, 0.5882353, 1,
1.363877, 0.7363705, -0.5840311, 1, 0, 0.5803922, 1,
1.372494, 0.4678812, 2.092659, 1, 0, 0.5764706, 1,
1.375502, -0.5531698, 3.025077, 1, 0, 0.5686275, 1,
1.377936, -2.342521, 3.394493, 1, 0, 0.5647059, 1,
1.386429, 0.5764042, 2.849735, 1, 0, 0.5568628, 1,
1.405368, -0.6450672, 3.090558, 1, 0, 0.5529412, 1,
1.411301, 0.2157927, 3.061272, 1, 0, 0.5450981, 1,
1.41188, -1.163859, 1.893546, 1, 0, 0.5411765, 1,
1.414086, -1.008959, 2.349697, 1, 0, 0.5333334, 1,
1.436913, 0.3657306, 0.3155746, 1, 0, 0.5294118, 1,
1.439569, -1.78108, 2.409817, 1, 0, 0.5215687, 1,
1.444391, -0.9838374, 1.001552, 1, 0, 0.5176471, 1,
1.44548, 2.132, 1.694643, 1, 0, 0.509804, 1,
1.448911, -1.749283, 1.11107, 1, 0, 0.5058824, 1,
1.449003, -0.2145548, 1.816275, 1, 0, 0.4980392, 1,
1.460442, -0.7036033, 1.624127, 1, 0, 0.4901961, 1,
1.460538, -0.4308324, 2.367689, 1, 0, 0.4862745, 1,
1.469689, 0.6026344, 0.8054341, 1, 0, 0.4784314, 1,
1.493485, -0.5902737, 3.107816, 1, 0, 0.4745098, 1,
1.49619, 0.08743838, 0.268872, 1, 0, 0.4666667, 1,
1.50284, -0.2714292, -1.005978, 1, 0, 0.4627451, 1,
1.512198, 0.5044603, 0.9153528, 1, 0, 0.454902, 1,
1.51411, 0.1012331, 3.027708, 1, 0, 0.4509804, 1,
1.515577, 0.8998634, -0.1646535, 1, 0, 0.4431373, 1,
1.522087, 1.42763, 0.8567175, 1, 0, 0.4392157, 1,
1.530993, 0.09879638, 0.05598694, 1, 0, 0.4313726, 1,
1.538223, 0.8329987, -1.582037, 1, 0, 0.427451, 1,
1.543664, 0.4547796, 0.1521762, 1, 0, 0.4196078, 1,
1.549229, 0.05145046, 0.7271402, 1, 0, 0.4156863, 1,
1.553381, -1.641583, 0.7619033, 1, 0, 0.4078431, 1,
1.559173, -0.6863397, 3.155153, 1, 0, 0.4039216, 1,
1.563803, 1.016058, 2.200249, 1, 0, 0.3960784, 1,
1.577699, 0.04260461, 1.400043, 1, 0, 0.3882353, 1,
1.585421, 1.621175, 1.544474, 1, 0, 0.3843137, 1,
1.585841, -0.6031533, -0.4036689, 1, 0, 0.3764706, 1,
1.594306, 0.8683438, 1.240233, 1, 0, 0.372549, 1,
1.598186, -0.598758, 3.579941, 1, 0, 0.3647059, 1,
1.608697, -0.8353325, 1.218406, 1, 0, 0.3607843, 1,
1.609779, 0.03127408, 2.277994, 1, 0, 0.3529412, 1,
1.619111, 0.4092026, 1.4462, 1, 0, 0.3490196, 1,
1.63165, 0.6790591, 2.985555, 1, 0, 0.3411765, 1,
1.63343, -0.0415029, 1.95276, 1, 0, 0.3372549, 1,
1.634199, -0.6920544, 3.05313, 1, 0, 0.3294118, 1,
1.642178, 1.30593, -0.003393022, 1, 0, 0.3254902, 1,
1.647135, -0.7449136, 2.587882, 1, 0, 0.3176471, 1,
1.656404, 0.1682089, 1.335958, 1, 0, 0.3137255, 1,
1.658002, 1.312154, -0.2036963, 1, 0, 0.3058824, 1,
1.677033, 1.073093, 0.7492127, 1, 0, 0.2980392, 1,
1.678025, 0.3339696, 0.966368, 1, 0, 0.2941177, 1,
1.714615, 0.159638, 1.628505, 1, 0, 0.2862745, 1,
1.720152, 0.1598245, 0.6006538, 1, 0, 0.282353, 1,
1.724537, 1.218606, 0.5497969, 1, 0, 0.2745098, 1,
1.729559, -2.372044, 3.850846, 1, 0, 0.2705882, 1,
1.761266, -2.008325, 1.44514, 1, 0, 0.2627451, 1,
1.764929, 0.3491322, 0.9155913, 1, 0, 0.2588235, 1,
1.765695, 0.2464202, 0.5640619, 1, 0, 0.2509804, 1,
1.770923, -0.05255637, 2.261589, 1, 0, 0.2470588, 1,
1.77567, -0.4059499, 1.891806, 1, 0, 0.2392157, 1,
1.813442, 1.124374, 1.266716, 1, 0, 0.2352941, 1,
1.828519, 1.063111, 1.683526, 1, 0, 0.227451, 1,
1.831302, 0.1128403, 1.124088, 1, 0, 0.2235294, 1,
1.84113, 1.405101, 0.4226061, 1, 0, 0.2156863, 1,
1.846112, 0.4241301, 0.9069519, 1, 0, 0.2117647, 1,
1.863987, 1.196928, 1.071301, 1, 0, 0.2039216, 1,
1.871761, 0.1058211, 2.268687, 1, 0, 0.1960784, 1,
1.87357, 1.22262, 0.1925139, 1, 0, 0.1921569, 1,
1.874437, 1.008256, 1.485747, 1, 0, 0.1843137, 1,
1.909122, 0.7927002, 0.9710987, 1, 0, 0.1803922, 1,
1.968884, 0.4298, 1.516974, 1, 0, 0.172549, 1,
1.975851, 0.858155, 1.56522, 1, 0, 0.1686275, 1,
1.9967, -1.274068, 3.804622, 1, 0, 0.1607843, 1,
2.01727, -2.138175, 3.433048, 1, 0, 0.1568628, 1,
2.037156, 0.929531, 2.936011, 1, 0, 0.1490196, 1,
2.048134, 0.1821366, 1.338246, 1, 0, 0.145098, 1,
2.054222, -0.3440581, 1.775683, 1, 0, 0.1372549, 1,
2.084012, 0.8018987, 0.8609985, 1, 0, 0.1333333, 1,
2.084799, -0.3461989, 2.080269, 1, 0, 0.1254902, 1,
2.092763, -0.3287437, 1.67742, 1, 0, 0.1215686, 1,
2.110655, -1.388312, 2.397732, 1, 0, 0.1137255, 1,
2.120954, -1.617066, 1.033412, 1, 0, 0.1098039, 1,
2.181696, 1.402212, 0.8887487, 1, 0, 0.1019608, 1,
2.192402, 1.018114, 0.9641464, 1, 0, 0.09411765, 1,
2.228804, 1.833589, 0.9119239, 1, 0, 0.09019608, 1,
2.265538, -0.02394002, 2.664194, 1, 0, 0.08235294, 1,
2.351061, 0.2751238, 1.16818, 1, 0, 0.07843138, 1,
2.424621, 1.649842, -0.04790018, 1, 0, 0.07058824, 1,
2.455821, -0.219899, 1.464746, 1, 0, 0.06666667, 1,
2.53684, 0.2724486, 0.3603776, 1, 0, 0.05882353, 1,
2.569558, -0.411036, 3.680949, 1, 0, 0.05490196, 1,
2.610398, 0.8757533, 0.02135079, 1, 0, 0.04705882, 1,
2.617254, -0.1999355, 2.231697, 1, 0, 0.04313726, 1,
2.696577, -0.0716797, 1.475401, 1, 0, 0.03529412, 1,
2.717165, -0.06329211, 1.738268, 1, 0, 0.03137255, 1,
2.756629, 0.9980348, 3.272038, 1, 0, 0.02352941, 1,
2.800321, -0.9971324, 1.116186, 1, 0, 0.01960784, 1,
2.842948, 1.141386, 1.252158, 1, 0, 0.01176471, 1,
2.92697, 0.9149202, -0.3913514, 1, 0, 0.007843138, 1
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
-0.5371714, -4.235698, -8.17202, 0, -0.5, 0.5, 0.5,
-0.5371714, -4.235698, -8.17202, 1, -0.5, 0.5, 0.5,
-0.5371714, -4.235698, -8.17202, 1, 1.5, 0.5, 0.5,
-0.5371714, -4.235698, -8.17202, 0, 1.5, 0.5, 0.5
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
-5.175657, 0.4427969, -8.17202, 0, -0.5, 0.5, 0.5,
-5.175657, 0.4427969, -8.17202, 1, -0.5, 0.5, 0.5,
-5.175657, 0.4427969, -8.17202, 1, 1.5, 0.5, 0.5,
-5.175657, 0.4427969, -8.17202, 0, 1.5, 0.5, 0.5
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
-5.175657, -4.235698, -0.1497445, 0, -0.5, 0.5, 0.5,
-5.175657, -4.235698, -0.1497445, 1, -0.5, 0.5, 0.5,
-5.175657, -4.235698, -0.1497445, 1, 1.5, 0.5, 0.5,
-5.175657, -4.235698, -0.1497445, 0, 1.5, 0.5, 0.5
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
-4, -3.156045, -6.320725,
2, -3.156045, -6.320725,
-4, -3.156045, -6.320725,
-4, -3.335988, -6.629275,
-3, -3.156045, -6.320725,
-3, -3.335988, -6.629275,
-2, -3.156045, -6.320725,
-2, -3.335988, -6.629275,
-1, -3.156045, -6.320725,
-1, -3.335988, -6.629275,
0, -3.156045, -6.320725,
0, -3.335988, -6.629275,
1, -3.156045, -6.320725,
1, -3.335988, -6.629275,
2, -3.156045, -6.320725,
2, -3.335988, -6.629275
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
"-4",
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
-4, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
-4, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
-4, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
-4, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
-3, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
-3, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
-3, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
-3, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
-2, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
-2, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
-2, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
-2, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
-1, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
-1, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
-1, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
-1, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
0, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
0, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
0, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
0, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
1, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
1, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
1, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
1, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5,
2, -3.695872, -7.246373, 0, -0.5, 0.5, 0.5,
2, -3.695872, -7.246373, 1, -0.5, 0.5, 0.5,
2, -3.695872, -7.246373, 1, 1.5, 0.5, 0.5,
2, -3.695872, -7.246373, 0, 1.5, 0.5, 0.5
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
-4.105237, -3, -6.320725,
-4.105237, 3, -6.320725,
-4.105237, -3, -6.320725,
-4.283641, -3, -6.629275,
-4.105237, -2, -6.320725,
-4.283641, -2, -6.629275,
-4.105237, -1, -6.320725,
-4.283641, -1, -6.629275,
-4.105237, 0, -6.320725,
-4.283641, 0, -6.629275,
-4.105237, 1, -6.320725,
-4.283641, 1, -6.629275,
-4.105237, 2, -6.320725,
-4.283641, 2, -6.629275,
-4.105237, 3, -6.320725,
-4.283641, 3, -6.629275
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
-4.640448, -3, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, -3, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, -3, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, -3, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, -2, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, -2, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, -2, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, -2, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, -1, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, -1, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, -1, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, -1, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, 0, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, 0, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, 0, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, 0, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, 1, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, 1, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, 1, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, 1, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, 2, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, 2, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, 2, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, 2, -7.246373, 0, 1.5, 0.5, 0.5,
-4.640448, 3, -7.246373, 0, -0.5, 0.5, 0.5,
-4.640448, 3, -7.246373, 1, -0.5, 0.5, 0.5,
-4.640448, 3, -7.246373, 1, 1.5, 0.5, 0.5,
-4.640448, 3, -7.246373, 0, 1.5, 0.5, 0.5
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
-4.105237, -3.156045, -6,
-4.105237, -3.156045, 4,
-4.105237, -3.156045, -6,
-4.283641, -3.335988, -6,
-4.105237, -3.156045, -4,
-4.283641, -3.335988, -4,
-4.105237, -3.156045, -2,
-4.283641, -3.335988, -2,
-4.105237, -3.156045, 0,
-4.283641, -3.335988, 0,
-4.105237, -3.156045, 2,
-4.283641, -3.335988, 2,
-4.105237, -3.156045, 4,
-4.283641, -3.335988, 4
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
-4.640448, -3.695872, -6, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -6, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -6, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, -6, 0, 1.5, 0.5, 0.5,
-4.640448, -3.695872, -4, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -4, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -4, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, -4, 0, 1.5, 0.5, 0.5,
-4.640448, -3.695872, -2, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -2, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, -2, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, -2, 0, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 0, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 0, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 0, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 0, 0, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 2, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 2, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 2, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 2, 0, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 4, 0, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 4, 1, -0.5, 0.5, 0.5,
-4.640448, -3.695872, 4, 1, 1.5, 0.5, 0.5,
-4.640448, -3.695872, 4, 0, 1.5, 0.5, 0.5
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
-4.105237, -3.156045, -6.320725,
-4.105237, 4.041639, -6.320725,
-4.105237, -3.156045, 6.021236,
-4.105237, 4.041639, 6.021236,
-4.105237, -3.156045, -6.320725,
-4.105237, -3.156045, 6.021236,
-4.105237, 4.041639, -6.320725,
-4.105237, 4.041639, 6.021236,
-4.105237, -3.156045, -6.320725,
3.030895, -3.156045, -6.320725,
-4.105237, -3.156045, 6.021236,
3.030895, -3.156045, 6.021236,
-4.105237, 4.041639, -6.320725,
3.030895, 4.041639, -6.320725,
-4.105237, 4.041639, 6.021236,
3.030895, 4.041639, 6.021236,
3.030895, -3.156045, -6.320725,
3.030895, 4.041639, -6.320725,
3.030895, -3.156045, 6.021236,
3.030895, 4.041639, 6.021236,
3.030895, -3.156045, -6.320725,
3.030895, -3.156045, 6.021236,
3.030895, 4.041639, -6.320725,
3.030895, 4.041639, 6.021236
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
var radius = 8.527907;
var distance = 37.94162;
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
mvMatrix.translate( 0.5371714, -0.4427969, 0.1497445 );
mvMatrix.scale( 1.292092, 1.281043, 0.7470887 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.94162);
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
Arsonic_Acid<-read.table("Arsonic_Acid.xyz")
```

```
## Error in read.table("Arsonic_Acid.xyz"): no lines available in input
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
-4.001313, -0.1943975, -2.524597, 0, 0, 1, 1, 1,
-3.28382, -2.132811, -3.804854, 1, 0, 0, 1, 1,
-3.188434, 1.57936, -0.7030947, 1, 0, 0, 1, 1,
-2.982521, 1.011011, -0.8606133, 1, 0, 0, 1, 1,
-2.926529, -1.828453, -0.9980393, 1, 0, 0, 1, 1,
-2.88781, 2.920524, -1.257903, 1, 0, 0, 1, 1,
-2.697846, -3.051225, -1.97818, 0, 0, 0, 1, 1,
-2.657813, 1.172172, -0.8682348, 0, 0, 0, 1, 1,
-2.618345, -0.8219637, -1.377766, 0, 0, 0, 1, 1,
-2.536468, 0.5318241, -2.338874, 0, 0, 0, 1, 1,
-2.498126, 1.474093, -1.476176, 0, 0, 0, 1, 1,
-2.477117, -1.87979, -2.865968, 0, 0, 0, 1, 1,
-2.42308, -0.6375149, -1.189039, 0, 0, 0, 1, 1,
-2.398266, -0.09132739, -2.166906, 1, 1, 1, 1, 1,
-2.269261, -1.648852, -2.01795, 1, 1, 1, 1, 1,
-2.234085, -0.4816058, -2.746197, 1, 1, 1, 1, 1,
-2.220693, -0.2320404, -3.741467, 1, 1, 1, 1, 1,
-2.212204, 0.08850868, -3.028423, 1, 1, 1, 1, 1,
-2.203375, -1.554539, -4.172559, 1, 1, 1, 1, 1,
-2.179141, -0.5467915, -0.7665873, 1, 1, 1, 1, 1,
-2.163263, -0.975853, -1.459274, 1, 1, 1, 1, 1,
-2.141716, 1.142059, -0.8203558, 1, 1, 1, 1, 1,
-2.138983, 0.0867902, -2.854332, 1, 1, 1, 1, 1,
-2.132434, -0.7104305, -1.314566, 1, 1, 1, 1, 1,
-2.063596, -0.04331342, -3.393952, 1, 1, 1, 1, 1,
-2.039104, -0.3786505, -1.213963, 1, 1, 1, 1, 1,
-2.029171, -1.178249, -1.765935, 1, 1, 1, 1, 1,
-1.995078, -0.6770261, -0.5493848, 1, 1, 1, 1, 1,
-1.985044, 1.739752, 0.3711522, 0, 0, 1, 1, 1,
-1.97809, 1.086625, -0.0009165111, 1, 0, 0, 1, 1,
-1.940942, -0.521854, -1.096771, 1, 0, 0, 1, 1,
-1.916856, -0.2405776, -1.539212, 1, 0, 0, 1, 1,
-1.852381, 3.936819, -1.880622, 1, 0, 0, 1, 1,
-1.839109, 0.4927955, -2.10184, 1, 0, 0, 1, 1,
-1.822868, -0.4229982, -2.218591, 0, 0, 0, 1, 1,
-1.815955, -0.00421904, -3.704837, 0, 0, 0, 1, 1,
-1.814004, 1.401962, -0.637481, 0, 0, 0, 1, 1,
-1.805068, 0.6597916, -2.287762, 0, 0, 0, 1, 1,
-1.795192, -1.681944, -2.972602, 0, 0, 0, 1, 1,
-1.786853, -0.8103576, -1.820648, 0, 0, 0, 1, 1,
-1.773332, -1.159467, -3.022797, 0, 0, 0, 1, 1,
-1.770667, -0.9559912, -2.953426, 1, 1, 1, 1, 1,
-1.743139, 0.1912457, -1.569897, 1, 1, 1, 1, 1,
-1.710106, 1.7991, -1.19033, 1, 1, 1, 1, 1,
-1.694204, 1.092688, -1.017064, 1, 1, 1, 1, 1,
-1.677775, -0.9967642, 0.8883656, 1, 1, 1, 1, 1,
-1.675235, 0.3683523, -2.471612, 1, 1, 1, 1, 1,
-1.675213, -1.432611, -3.168128, 1, 1, 1, 1, 1,
-1.673221, -0.132245, -1.22545, 1, 1, 1, 1, 1,
-1.664311, -0.9083661, -2.048605, 1, 1, 1, 1, 1,
-1.660763, -2.311797, -2.196286, 1, 1, 1, 1, 1,
-1.658023, 1.539974, -1.691951, 1, 1, 1, 1, 1,
-1.647084, -0.2827872, -2.503562, 1, 1, 1, 1, 1,
-1.642599, -1.634135, -1.680069, 1, 1, 1, 1, 1,
-1.640477, -2.903318, -1.847956, 1, 1, 1, 1, 1,
-1.617637, 0.1998965, -3.315752, 1, 1, 1, 1, 1,
-1.591923, -0.2646897, -0.6738648, 0, 0, 1, 1, 1,
-1.587684, -1.502489, -3.534417, 1, 0, 0, 1, 1,
-1.55723, -0.6595529, -3.516176, 1, 0, 0, 1, 1,
-1.545571, -1.255809, -2.519449, 1, 0, 0, 1, 1,
-1.541299, 1.249584, -0.2447976, 1, 0, 0, 1, 1,
-1.531588, 1.2609, -0.4016067, 1, 0, 0, 1, 1,
-1.529883, 1.515944, -0.9741966, 0, 0, 0, 1, 1,
-1.519197, -0.161155, -1.511088, 0, 0, 0, 1, 1,
-1.506573, 0.2161927, -3.037116, 0, 0, 0, 1, 1,
-1.49659, 1.513614, -2.229676, 0, 0, 0, 1, 1,
-1.49623, 0.2345322, -1.622419, 0, 0, 0, 1, 1,
-1.468108, 0.1914591, -1.741808, 0, 0, 0, 1, 1,
-1.461826, -0.2770434, -2.415642, 0, 0, 0, 1, 1,
-1.457552, -0.2056775, -1.396045, 1, 1, 1, 1, 1,
-1.455692, 0.221358, -0.05091854, 1, 1, 1, 1, 1,
-1.453941, 1.46806, -2.929541, 1, 1, 1, 1, 1,
-1.452333, 0.4634804, -1.457242, 1, 1, 1, 1, 1,
-1.444369, 1.078238, -0.9748161, 1, 1, 1, 1, 1,
-1.44283, 0.5488277, -2.416851, 1, 1, 1, 1, 1,
-1.435118, 0.1513157, -1.844691, 1, 1, 1, 1, 1,
-1.42861, 2.233522, -0.8830094, 1, 1, 1, 1, 1,
-1.428075, 1.714882, -0.1725041, 1, 1, 1, 1, 1,
-1.410224, 1.812919, 0.01348424, 1, 1, 1, 1, 1,
-1.408835, -0.7385927, -1.861538, 1, 1, 1, 1, 1,
-1.407451, 0.2023839, -2.694721, 1, 1, 1, 1, 1,
-1.404748, -0.1805511, -2.777531, 1, 1, 1, 1, 1,
-1.393774, 1.0427, -1.165288, 1, 1, 1, 1, 1,
-1.38653, 1.190943, -1.118743, 1, 1, 1, 1, 1,
-1.369093, 1.399768, 0.09342434, 0, 0, 1, 1, 1,
-1.368571, 1.058701, -0.5836917, 1, 0, 0, 1, 1,
-1.364546, -0.01465354, -2.85693, 1, 0, 0, 1, 1,
-1.36048, -0.6189322, -2.544586, 1, 0, 0, 1, 1,
-1.353055, -0.2854138, -0.9320292, 1, 0, 0, 1, 1,
-1.351207, 0.7051296, -1.381058, 1, 0, 0, 1, 1,
-1.343993, -0.311475, -1.949257, 0, 0, 0, 1, 1,
-1.327213, -1.394483, -1.779166, 0, 0, 0, 1, 1,
-1.319445, -0.2832864, -0.7656773, 0, 0, 0, 1, 1,
-1.308404, -1.795403, -6.140988, 0, 0, 0, 1, 1,
-1.304053, -0.944219, -1.919975, 0, 0, 0, 1, 1,
-1.278738, -0.4518522, -1.374295, 0, 0, 0, 1, 1,
-1.277641, 1.034442, -1.036937, 0, 0, 0, 1, 1,
-1.276577, -0.6789873, -0.4792097, 1, 1, 1, 1, 1,
-1.269928, -1.672922, -2.114586, 1, 1, 1, 1, 1,
-1.243958, -0.8295007, -3.835259, 1, 1, 1, 1, 1,
-1.242803, -0.4768473, -2.050157, 1, 1, 1, 1, 1,
-1.227961, -0.07287215, -1.058787, 1, 1, 1, 1, 1,
-1.227002, -0.3291861, -2.779522, 1, 1, 1, 1, 1,
-1.221836, -1.233595, -3.133406, 1, 1, 1, 1, 1,
-1.221524, -0.2937965, -2.122542, 1, 1, 1, 1, 1,
-1.21989, -0.244415, -1.870158, 1, 1, 1, 1, 1,
-1.219734, -1.055455, -2.624668, 1, 1, 1, 1, 1,
-1.219332, -0.6219223, -1.927472, 1, 1, 1, 1, 1,
-1.215481, 0.4386033, -2.606026, 1, 1, 1, 1, 1,
-1.208421, -0.8789365, -2.100837, 1, 1, 1, 1, 1,
-1.203048, 0.7197859, -1.833377, 1, 1, 1, 1, 1,
-1.200179, 0.1510865, -1.0278, 1, 1, 1, 1, 1,
-1.199807, 1.823182, -0.2167658, 0, 0, 1, 1, 1,
-1.199798, 0.9501286, -2.167872, 1, 0, 0, 1, 1,
-1.193691, 0.582123, 1.005795, 1, 0, 0, 1, 1,
-1.192549, -0.2419621, -1.809195, 1, 0, 0, 1, 1,
-1.186701, 0.6334512, -2.216459, 1, 0, 0, 1, 1,
-1.184865, 1.30645, -1.431026, 1, 0, 0, 1, 1,
-1.18217, 0.1071416, -2.272184, 0, 0, 0, 1, 1,
-1.176089, -0.7992105, -1.751477, 0, 0, 0, 1, 1,
-1.172968, -1.176708, -2.618428, 0, 0, 0, 1, 1,
-1.17164, -1.385589, -4.648299, 0, 0, 0, 1, 1,
-1.160814, 0.6015736, -2.254859, 0, 0, 0, 1, 1,
-1.157517, -0.5087054, -0.7542792, 0, 0, 0, 1, 1,
-1.155264, -0.1650085, -1.295764, 0, 0, 0, 1, 1,
-1.141557, 0.5471158, 0.9994552, 1, 1, 1, 1, 1,
-1.139091, 2.026004, 0.5972108, 1, 1, 1, 1, 1,
-1.135256, -0.195674, -1.035163, 1, 1, 1, 1, 1,
-1.129491, 0.9283994, -0.5650278, 1, 1, 1, 1, 1,
-1.127661, 0.6326545, -0.4728634, 1, 1, 1, 1, 1,
-1.118576, 1.428072, 0.1748158, 1, 1, 1, 1, 1,
-1.110297, -2.278741, -1.902836, 1, 1, 1, 1, 1,
-1.108902, -0.2754737, -2.10668, 1, 1, 1, 1, 1,
-1.100906, 0.180918, -0.2121436, 1, 1, 1, 1, 1,
-1.089324, 0.09696559, -0.496089, 1, 1, 1, 1, 1,
-1.084679, 0.3650177, -1.551954, 1, 1, 1, 1, 1,
-1.082858, 0.5435654, -2.325946, 1, 1, 1, 1, 1,
-1.077735, 0.4179855, -0.07180464, 1, 1, 1, 1, 1,
-1.074314, -0.4247158, -2.218886, 1, 1, 1, 1, 1,
-1.060034, 0.829008, -0.6440539, 1, 1, 1, 1, 1,
-1.050685, -0.9427744, -4.676184, 0, 0, 1, 1, 1,
-1.050612, -1.970146, -1.873303, 1, 0, 0, 1, 1,
-1.044902, 0.2681241, -1.056558, 1, 0, 0, 1, 1,
-1.038014, 0.406384, -0.9069113, 1, 0, 0, 1, 1,
-1.035068, -0.4141338, -1.565343, 1, 0, 0, 1, 1,
-1.034686, -0.1570136, -2.305761, 1, 0, 0, 1, 1,
-1.034122, 0.3420644, -2.194322, 0, 0, 0, 1, 1,
-1.031811, -0.130679, -2.106418, 0, 0, 0, 1, 1,
-1.029827, -2.38669, -2.037635, 0, 0, 0, 1, 1,
-1.023977, 0.9950209, -0.05080703, 0, 0, 0, 1, 1,
-1.014716, 2.101259, -0.3804547, 0, 0, 0, 1, 1,
-1.007345, -0.6081724, -2.090803, 0, 0, 0, 1, 1,
-1.005669, -0.8263941, -0.4171691, 0, 0, 0, 1, 1,
-1.000556, 1.447225, -1.188742, 1, 1, 1, 1, 1,
-0.9962612, 0.9697143, -0.08711198, 1, 1, 1, 1, 1,
-0.9946981, -0.4512346, -1.617413, 1, 1, 1, 1, 1,
-0.9892269, 0.8986324, -1.95426, 1, 1, 1, 1, 1,
-0.9863523, 0.7164907, -1.32398, 1, 1, 1, 1, 1,
-0.9852494, -0.2296232, -2.183802, 1, 1, 1, 1, 1,
-0.9814512, 0.6040855, 0.7948023, 1, 1, 1, 1, 1,
-0.9808151, -0.04091757, 0.5022827, 1, 1, 1, 1, 1,
-0.9772406, 0.2598305, -1.606847, 1, 1, 1, 1, 1,
-0.9671019, -0.3686855, -2.861021, 1, 1, 1, 1, 1,
-0.9652519, -0.06054292, 0.1821305, 1, 1, 1, 1, 1,
-0.9648267, 0.7562612, -0.07396649, 1, 1, 1, 1, 1,
-0.9607343, 0.0575332, -1.232288, 1, 1, 1, 1, 1,
-0.9570679, 0.004057385, -2.740193, 1, 1, 1, 1, 1,
-0.9517533, -0.3757258, -1.806556, 1, 1, 1, 1, 1,
-0.9503931, -0.1246115, -1.166922, 0, 0, 1, 1, 1,
-0.9481548, -0.2757313, -2.541002, 1, 0, 0, 1, 1,
-0.9454604, -1.808128, -2.331776, 1, 0, 0, 1, 1,
-0.9428383, 0.4504496, -0.4517254, 1, 0, 0, 1, 1,
-0.9414612, -0.2116545, -1.349464, 1, 0, 0, 1, 1,
-0.9362344, -0.4610709, 0.2004586, 1, 0, 0, 1, 1,
-0.9295196, 0.7813912, 1.129636, 0, 0, 0, 1, 1,
-0.9083584, -0.3172125, -2.649756, 0, 0, 0, 1, 1,
-0.9038719, -0.3565094, -2.748049, 0, 0, 0, 1, 1,
-0.902159, 0.5377142, 1.595337, 0, 0, 0, 1, 1,
-0.8992907, 0.6077075, -1.787775, 0, 0, 0, 1, 1,
-0.8984953, -0.4398354, -2.338242, 0, 0, 0, 1, 1,
-0.8977432, 0.1267265, -1.669178, 0, 0, 0, 1, 1,
-0.8891615, -2.125479, -2.147494, 1, 1, 1, 1, 1,
-0.8847092, 0.1824175, 0.6489939, 1, 1, 1, 1, 1,
-0.8827543, -1.331594, -5.542475, 1, 1, 1, 1, 1,
-0.8761811, -0.5114941, -2.16966, 1, 1, 1, 1, 1,
-0.8691655, 0.538823, -2.127903, 1, 1, 1, 1, 1,
-0.8651727, 0.03186286, -1.256613, 1, 1, 1, 1, 1,
-0.8651494, -0.1073592, -1.642504, 1, 1, 1, 1, 1,
-0.8640249, -1.527729, -1.068894, 1, 1, 1, 1, 1,
-0.8592983, -1.209882, -1.766774, 1, 1, 1, 1, 1,
-0.8580213, 0.7494471, -1.857807, 1, 1, 1, 1, 1,
-0.8516213, 0.8538407, -0.2181958, 1, 1, 1, 1, 1,
-0.8490326, 1.01357, -1.454114, 1, 1, 1, 1, 1,
-0.8462072, 2.253429, -2.086575, 1, 1, 1, 1, 1,
-0.8446609, -0.6701733, -3.193285, 1, 1, 1, 1, 1,
-0.8240142, 0.7519637, -0.7774497, 1, 1, 1, 1, 1,
-0.8227039, -0.2509678, -1.728167, 0, 0, 1, 1, 1,
-0.821059, 1.991653, -0.5966317, 1, 0, 0, 1, 1,
-0.8201365, 1.33883, -1.050613, 1, 0, 0, 1, 1,
-0.8060623, 0.2051681, -0.8726473, 1, 0, 0, 1, 1,
-0.8033723, 0.9387323, -0.8693491, 1, 0, 0, 1, 1,
-0.8033145, -0.9432874, -2.755151, 1, 0, 0, 1, 1,
-0.8015396, -1.586588, -3.471677, 0, 0, 0, 1, 1,
-0.7968019, -0.5277241, -2.678117, 0, 0, 0, 1, 1,
-0.7947446, -0.6223845, -1.425145, 0, 0, 0, 1, 1,
-0.7844321, -0.6698005, -2.281847, 0, 0, 0, 1, 1,
-0.779318, -0.6742133, -3.64118, 0, 0, 0, 1, 1,
-0.7759691, -2.157332, -2.867486, 0, 0, 0, 1, 1,
-0.7747029, 0.444579, -1.26056, 0, 0, 0, 1, 1,
-0.7707535, -0.7324005, -4.330209, 1, 1, 1, 1, 1,
-0.769946, -0.1560192, -1.921252, 1, 1, 1, 1, 1,
-0.7599447, -0.923574, -4.064603, 1, 1, 1, 1, 1,
-0.7514473, 1.441777, 0.5008426, 1, 1, 1, 1, 1,
-0.7478082, -0.5050942, -1.676934, 1, 1, 1, 1, 1,
-0.7465423, -1.113384, -2.820238, 1, 1, 1, 1, 1,
-0.7403756, -0.09520067, -3.802109, 1, 1, 1, 1, 1,
-0.7343911, 0.5286091, -2.08491, 1, 1, 1, 1, 1,
-0.7335626, 0.5936168, -2.995858, 1, 1, 1, 1, 1,
-0.7200506, -0.6395835, -2.471049, 1, 1, 1, 1, 1,
-0.7142503, -2.313915, -3.62645, 1, 1, 1, 1, 1,
-0.7076564, 0.4252237, -0.378976, 1, 1, 1, 1, 1,
-0.7063559, 0.02120343, -1.481069, 1, 1, 1, 1, 1,
-0.7023094, -0.2423324, -2.163583, 1, 1, 1, 1, 1,
-0.6972841, 0.5956979, -0.6218997, 1, 1, 1, 1, 1,
-0.6958699, -0.06950037, -2.986328, 0, 0, 1, 1, 1,
-0.6917853, -0.3522856, -0.6482658, 1, 0, 0, 1, 1,
-0.6841928, -0.7696074, -2.325536, 1, 0, 0, 1, 1,
-0.6833577, 1.203187, -2.274844, 1, 0, 0, 1, 1,
-0.6808711, 0.6903039, -1.579117, 1, 0, 0, 1, 1,
-0.6790584, 1.257234, -2.565038, 1, 0, 0, 1, 1,
-0.677669, 0.2227702, -1.153081, 0, 0, 0, 1, 1,
-0.6763099, 1.275664, 0.9933299, 0, 0, 0, 1, 1,
-0.6714038, -0.9600033, -1.682483, 0, 0, 0, 1, 1,
-0.6695701, -1.077756, -1.31249, 0, 0, 0, 1, 1,
-0.6680403, 0.5262333, -0.1993375, 0, 0, 0, 1, 1,
-0.6679971, 0.5899439, 0.2162258, 0, 0, 0, 1, 1,
-0.665868, -0.6785269, -1.989596, 0, 0, 0, 1, 1,
-0.6648641, 0.095, -1.63549, 1, 1, 1, 1, 1,
-0.6645332, 0.8491122, 0.4930956, 1, 1, 1, 1, 1,
-0.6625412, -1.094343, -2.577075, 1, 1, 1, 1, 1,
-0.6588566, -0.7857903, -2.470171, 1, 1, 1, 1, 1,
-0.6525271, 0.3850945, 0.7065477, 1, 1, 1, 1, 1,
-0.6519989, 1.236798, -0.9429317, 1, 1, 1, 1, 1,
-0.6466705, 0.4110533, 1.374128, 1, 1, 1, 1, 1,
-0.6459094, 0.04350912, -1.842576, 1, 1, 1, 1, 1,
-0.6448559, 0.6997184, -0.349669, 1, 1, 1, 1, 1,
-0.6430039, -0.8023124, -3.353681, 1, 1, 1, 1, 1,
-0.6368487, 0.6525729, -1.716068, 1, 1, 1, 1, 1,
-0.6342404, -1.068314, -2.349501, 1, 1, 1, 1, 1,
-0.630726, -0.356502, -2.198148, 1, 1, 1, 1, 1,
-0.6272829, -0.1362598, -0.7971842, 1, 1, 1, 1, 1,
-0.6269844, -0.411851, -1.496872, 1, 1, 1, 1, 1,
-0.6198703, -1.477939, -3.415922, 0, 0, 1, 1, 1,
-0.6196523, 1.422717, -1.937628, 1, 0, 0, 1, 1,
-0.6129161, 1.526792, -0.2586927, 1, 0, 0, 1, 1,
-0.6125331, -0.4427676, -2.875737, 1, 0, 0, 1, 1,
-0.6068795, -0.6117685, -0.5903915, 1, 0, 0, 1, 1,
-0.6045014, -0.5562613, -2.499225, 1, 0, 0, 1, 1,
-0.6030576, -1.306339, -3.343144, 0, 0, 0, 1, 1,
-0.6020042, 1.489032, -1.215039, 0, 0, 0, 1, 1,
-0.6013222, -0.9107185, -1.074345, 0, 0, 0, 1, 1,
-0.600191, -0.8071759, -1.561797, 0, 0, 0, 1, 1,
-0.5977915, -1.206416, -2.503314, 0, 0, 0, 1, 1,
-0.5945795, -0.8245515, -1.998957, 0, 0, 0, 1, 1,
-0.5945649, -1.238057, -2.7705, 0, 0, 0, 1, 1,
-0.5884175, 0.9095116, -1.981479, 1, 1, 1, 1, 1,
-0.5849305, 0.8760833, 0.952565, 1, 1, 1, 1, 1,
-0.584168, 0.6741739, -0.4333681, 1, 1, 1, 1, 1,
-0.5836303, 0.4719902, -0.7244247, 1, 1, 1, 1, 1,
-0.5824713, -1.053296, -2.619734, 1, 1, 1, 1, 1,
-0.5811397, 0.4457498, 0.1031699, 1, 1, 1, 1, 1,
-0.5767263, 1.190001, 0.1976555, 1, 1, 1, 1, 1,
-0.5760351, 0.6528758, -1.399823, 1, 1, 1, 1, 1,
-0.574488, -0.4780574, -1.803836, 1, 1, 1, 1, 1,
-0.5704053, 0.3658436, -1.509049, 1, 1, 1, 1, 1,
-0.5697426, -0.911341, -3.667021, 1, 1, 1, 1, 1,
-0.5692709, 1.624655, -1.637697, 1, 1, 1, 1, 1,
-0.5641246, 1.392162, -1.951603, 1, 1, 1, 1, 1,
-0.5638272, 1.044797, 0.2681355, 1, 1, 1, 1, 1,
-0.5631903, -0.090953, -4.07173, 1, 1, 1, 1, 1,
-0.5543084, -1.368776, -0.1252853, 0, 0, 1, 1, 1,
-0.5534565, -1.565556, -3.78817, 1, 0, 0, 1, 1,
-0.5531028, 1.7995, 0.1454746, 1, 0, 0, 1, 1,
-0.5507774, -2.202263, -2.59865, 1, 0, 0, 1, 1,
-0.5487065, -0.6865964, -2.890937, 1, 0, 0, 1, 1,
-0.5471103, -0.6540856, -4.32791, 1, 0, 0, 1, 1,
-0.5396124, 0.03986987, -2.0709, 0, 0, 0, 1, 1,
-0.5384558, 1.698039, 2.108864, 0, 0, 0, 1, 1,
-0.5291142, 0.5898971, -0.3465848, 0, 0, 0, 1, 1,
-0.5267276, -1.441059, -2.40726, 0, 0, 0, 1, 1,
-0.5265078, -0.9663687, -4.725457, 0, 0, 0, 1, 1,
-0.5250255, 0.777563, -0.4319395, 0, 0, 0, 1, 1,
-0.5223594, 0.6598535, -0.2958309, 0, 0, 0, 1, 1,
-0.5220312, 0.1717742, -1.336096, 1, 1, 1, 1, 1,
-0.5219944, -0.18965, 0.1809737, 1, 1, 1, 1, 1,
-0.5214414, 0.2937414, -0.6622968, 1, 1, 1, 1, 1,
-0.5210865, -2.539013, -3.045096, 1, 1, 1, 1, 1,
-0.5192148, 0.6982711, 0.3411875, 1, 1, 1, 1, 1,
-0.5190997, 1.30576, 0.1548768, 1, 1, 1, 1, 1,
-0.5175732, 0.08115119, -2.589985, 1, 1, 1, 1, 1,
-0.515925, -0.940457, -2.279507, 1, 1, 1, 1, 1,
-0.5155814, 0.5745839, -1.011884, 1, 1, 1, 1, 1,
-0.5137897, -0.3296315, -3.156275, 1, 1, 1, 1, 1,
-0.5101607, -0.1742433, 0.05749638, 1, 1, 1, 1, 1,
-0.5082121, 0.2684962, -2.02405, 1, 1, 1, 1, 1,
-0.4917022, -0.8805004, -1.487535, 1, 1, 1, 1, 1,
-0.4891461, -1.138939, -1.543688, 1, 1, 1, 1, 1,
-0.4881354, 0.1593283, -1.597784, 1, 1, 1, 1, 1,
-0.4873259, -1.051385, -4.917098, 0, 0, 1, 1, 1,
-0.4865472, 0.0001142175, -2.117375, 1, 0, 0, 1, 1,
-0.4841777, 0.09461329, -0.9253416, 1, 0, 0, 1, 1,
-0.4803688, -1.516386, -3.503549, 1, 0, 0, 1, 1,
-0.4720144, -0.8244998, -3.351077, 1, 0, 0, 1, 1,
-0.4690487, 0.1652405, -0.2397911, 1, 0, 0, 1, 1,
-0.468854, 1.140044, -1.168797, 0, 0, 0, 1, 1,
-0.4671399, 0.2775314, -1.186315, 0, 0, 0, 1, 1,
-0.4623549, 0.4736271, -1.189046, 0, 0, 0, 1, 1,
-0.461123, 0.00968278, -1.007378, 0, 0, 0, 1, 1,
-0.4592075, 0.5149417, -1.29348, 0, 0, 0, 1, 1,
-0.4570342, -0.05336533, -2.40047, 0, 0, 0, 1, 1,
-0.451514, -0.2541131, -1.274798, 0, 0, 0, 1, 1,
-0.4502465, -1.448226, -4.192603, 1, 1, 1, 1, 1,
-0.444647, -0.2080914, -3.595977, 1, 1, 1, 1, 1,
-0.4424326, 0.274082, -1.810796, 1, 1, 1, 1, 1,
-0.4414483, -1.191581, -1.204249, 1, 1, 1, 1, 1,
-0.4389154, 0.3353335, 0.4634433, 1, 1, 1, 1, 1,
-0.4381765, -0.1101869, -1.707446, 1, 1, 1, 1, 1,
-0.4380847, 0.7625673, -0.8901088, 1, 1, 1, 1, 1,
-0.4338851, 0.07258801, -1.268977, 1, 1, 1, 1, 1,
-0.4306313, -0.3538222, -2.330403, 1, 1, 1, 1, 1,
-0.4298073, -0.2077151, -2.027619, 1, 1, 1, 1, 1,
-0.4293664, -0.003214574, 0.5674924, 1, 1, 1, 1, 1,
-0.4271589, -0.2404064, -3.097336, 1, 1, 1, 1, 1,
-0.4261262, 0.7500746, -0.6863047, 1, 1, 1, 1, 1,
-0.4222378, 0.292628, -1.200219, 1, 1, 1, 1, 1,
-0.4200612, -0.6010855, -3.354928, 1, 1, 1, 1, 1,
-0.4138164, 1.200686, 0.29033, 0, 0, 1, 1, 1,
-0.4134333, -0.6328302, -4.363657, 1, 0, 0, 1, 1,
-0.4077479, -1.838358, -2.883828, 1, 0, 0, 1, 1,
-0.4055428, 0.9558664, -1.164925, 1, 0, 0, 1, 1,
-0.4009476, -1.411451, -4.222202, 1, 0, 0, 1, 1,
-0.4001914, 1.801606, -0.3766882, 1, 0, 0, 1, 1,
-0.3938514, -0.113642, -1.768688, 0, 0, 0, 1, 1,
-0.3898428, -0.7000468, -2.345654, 0, 0, 0, 1, 1,
-0.3812813, 0.6212216, -0.2265376, 0, 0, 0, 1, 1,
-0.380235, 0.3206136, -1.061806, 0, 0, 0, 1, 1,
-0.3761984, 0.1515677, -1.548269, 0, 0, 0, 1, 1,
-0.3758647, 1.027421, 0.4188877, 0, 0, 0, 1, 1,
-0.3757974, 0.1718601, -2.59337, 0, 0, 0, 1, 1,
-0.3657464, 1.154894, 0.5624467, 1, 1, 1, 1, 1,
-0.3656335, 0.8855031, -0.8916756, 1, 1, 1, 1, 1,
-0.3637387, -1.514576, -2.458715, 1, 1, 1, 1, 1,
-0.3632708, 0.09828975, -2.838305, 1, 1, 1, 1, 1,
-0.362177, -1.220557, -2.881933, 1, 1, 1, 1, 1,
-0.3604571, -0.1797154, -1.699402, 1, 1, 1, 1, 1,
-0.360108, 2.527968, -1.696347, 1, 1, 1, 1, 1,
-0.3578821, -1.544246, -3.956219, 1, 1, 1, 1, 1,
-0.3568898, -0.01367338, -2.021317, 1, 1, 1, 1, 1,
-0.355926, 0.7109588, -0.1795193, 1, 1, 1, 1, 1,
-0.3544511, -0.4888337, -1.181195, 1, 1, 1, 1, 1,
-0.3533665, -0.4499587, -0.1276603, 1, 1, 1, 1, 1,
-0.3523083, -0.2116748, -0.8684533, 1, 1, 1, 1, 1,
-0.3470078, 0.4876754, -0.1967999, 1, 1, 1, 1, 1,
-0.3452887, -0.3671916, -0.4848258, 1, 1, 1, 1, 1,
-0.3441705, -1.515308, -2.601437, 0, 0, 1, 1, 1,
-0.3418428, 1.23292, -0.3967963, 1, 0, 0, 1, 1,
-0.3356963, -0.3621012, -2.565547, 1, 0, 0, 1, 1,
-0.3304969, -0.3283176, -3.910701, 1, 0, 0, 1, 1,
-0.3192593, 0.5069302, -0.4006863, 1, 0, 0, 1, 1,
-0.314048, -2.423573, -4.288775, 1, 0, 0, 1, 1,
-0.3121424, -0.7818315, -1.917435, 0, 0, 0, 1, 1,
-0.3085346, 0.1315605, -1.192685, 0, 0, 0, 1, 1,
-0.3068779, -0.1678808, -0.8122339, 0, 0, 0, 1, 1,
-0.3058965, 0.6436169, 0.6782686, 0, 0, 0, 1, 1,
-0.3032963, 0.7001076, 0.02580018, 0, 0, 0, 1, 1,
-0.3028862, 1.122781, 0.3644145, 0, 0, 0, 1, 1,
-0.3000025, -0.1763369, -1.504053, 0, 0, 0, 1, 1,
-0.2985356, -0.2147679, -0.9606492, 1, 1, 1, 1, 1,
-0.2980562, 0.5294113, -0.1780409, 1, 1, 1, 1, 1,
-0.292866, 0.7178487, 0.8515524, 1, 1, 1, 1, 1,
-0.2914276, 0.8365877, -1.473609, 1, 1, 1, 1, 1,
-0.2893718, 0.6222645, -1.88492, 1, 1, 1, 1, 1,
-0.2861835, 1.883559, 0.5077116, 1, 1, 1, 1, 1,
-0.2843193, 0.3966185, 0.4442488, 1, 1, 1, 1, 1,
-0.2807101, 0.9577537, -0.5034869, 1, 1, 1, 1, 1,
-0.2785408, 0.0479317, -1.678562, 1, 1, 1, 1, 1,
-0.2708523, -1.934199, -2.086346, 1, 1, 1, 1, 1,
-0.268333, -0.234009, -2.346464, 1, 1, 1, 1, 1,
-0.2672403, 0.4527493, 0.1129707, 1, 1, 1, 1, 1,
-0.2599744, 0.5363755, -1.560366, 1, 1, 1, 1, 1,
-0.2595269, 0.5029882, 0.7656174, 1, 1, 1, 1, 1,
-0.2551524, 0.589371, -0.01405981, 1, 1, 1, 1, 1,
-0.2551258, -0.7186343, -3.63288, 0, 0, 1, 1, 1,
-0.2548464, -1.647534, -3.562943, 1, 0, 0, 1, 1,
-0.2548368, 2.261633, 2.142527, 1, 0, 0, 1, 1,
-0.2507593, 2.001225, -0.1120006, 1, 0, 0, 1, 1,
-0.24955, -0.3613793, -1.328191, 1, 0, 0, 1, 1,
-0.2466508, -0.4092972, -1.343591, 1, 0, 0, 1, 1,
-0.2442635, -0.5514767, -2.044875, 0, 0, 0, 1, 1,
-0.2423636, 0.2890799, -1.145402, 0, 0, 0, 1, 1,
-0.2328425, -1.18963, -2.393768, 0, 0, 0, 1, 1,
-0.2313485, -1.798061, -0.5771502, 0, 0, 0, 1, 1,
-0.2202337, -0.002470411, -0.564516, 0, 0, 0, 1, 1,
-0.2172939, -1.919738, -2.355853, 0, 0, 0, 1, 1,
-0.2168494, 0.7619986, -1.209644, 0, 0, 0, 1, 1,
-0.2142682, -0.1223835, -1.675843, 1, 1, 1, 1, 1,
-0.209996, 1.229145, -2.04233, 1, 1, 1, 1, 1,
-0.2074225, 0.1332557, -0.7239942, 1, 1, 1, 1, 1,
-0.2062115, -0.5501223, -2.968344, 1, 1, 1, 1, 1,
-0.205267, -1.146047, -2.304922, 1, 1, 1, 1, 1,
-0.1935448, 0.9506996, -2.121767, 1, 1, 1, 1, 1,
-0.1934865, -1.233063, -0.6169614, 1, 1, 1, 1, 1,
-0.1913284, 0.824001, -0.629679, 1, 1, 1, 1, 1,
-0.1902346, 0.6113002, 0.04826331, 1, 1, 1, 1, 1,
-0.1886461, -1.521478, -2.665983, 1, 1, 1, 1, 1,
-0.1882966, -1.995423, -4.18552, 1, 1, 1, 1, 1,
-0.1880153, 0.9495289, 0.4254809, 1, 1, 1, 1, 1,
-0.1877265, -0.6781321, -3.266472, 1, 1, 1, 1, 1,
-0.1818147, -0.235653, -2.759904, 1, 1, 1, 1, 1,
-0.1799725, 1.613723, -1.494355, 1, 1, 1, 1, 1,
-0.1788947, 0.8206993, -0.02388853, 0, 0, 1, 1, 1,
-0.1741683, 0.6513714, 0.4719495, 1, 0, 0, 1, 1,
-0.1721692, -0.1134026, -3.485033, 1, 0, 0, 1, 1,
-0.1707085, 0.6599756, -1.423262, 1, 0, 0, 1, 1,
-0.1697443, -0.839572, -2.022005, 1, 0, 0, 1, 1,
-0.167364, 1.28382, -1.757777, 1, 0, 0, 1, 1,
-0.1665226, 1.458351, 0.8512118, 0, 0, 0, 1, 1,
-0.1652059, 0.5296103, 0.5682852, 0, 0, 0, 1, 1,
-0.1639312, 0.3449188, -1.542756, 0, 0, 0, 1, 1,
-0.1618285, 1.119582, 0.8159633, 0, 0, 0, 1, 1,
-0.1595218, 0.1739004, -1.284487, 0, 0, 0, 1, 1,
-0.1542372, 0.4073911, 0.1464143, 0, 0, 0, 1, 1,
-0.1454942, 0.6485564, 0.1099883, 0, 0, 0, 1, 1,
-0.1431504, 0.2300585, -0.6440105, 1, 1, 1, 1, 1,
-0.1370095, -0.3660148, -2.831055, 1, 1, 1, 1, 1,
-0.1298928, 0.07206362, -0.3862984, 1, 1, 1, 1, 1,
-0.1273388, -0.3207797, -1.286298, 1, 1, 1, 1, 1,
-0.1260145, 0.9369395, -1.297011, 1, 1, 1, 1, 1,
-0.1165571, -0.7041166, -2.274148, 1, 1, 1, 1, 1,
-0.1118693, -0.6397017, -4.583127, 1, 1, 1, 1, 1,
-0.1114412, 0.4997605, 0.4897075, 1, 1, 1, 1, 1,
-0.1105282, 0.429875, -0.4185938, 1, 1, 1, 1, 1,
-0.1092052, -0.6386565, -1.90008, 1, 1, 1, 1, 1,
-0.1091184, -0.3633858, -4.160109, 1, 1, 1, 1, 1,
-0.1069243, -0.2764666, -2.199704, 1, 1, 1, 1, 1,
-0.1047427, -1.698135, -3.092726, 1, 1, 1, 1, 1,
-0.1025274, -0.9646479, -2.800905, 1, 1, 1, 1, 1,
-0.09900983, 1.664674, -1.118777, 1, 1, 1, 1, 1,
-0.09743135, 0.8477716, -0.3612716, 0, 0, 1, 1, 1,
-0.09727991, 0.693562, -0.8749168, 1, 0, 0, 1, 1,
-0.09691941, -0.1663637, -1.276611, 1, 0, 0, 1, 1,
-0.0960348, -0.8253074, -2.372832, 1, 0, 0, 1, 1,
-0.09584112, 1.180407, -1.645261, 1, 0, 0, 1, 1,
-0.09435578, -0.2705271, -1.557078, 1, 0, 0, 1, 1,
-0.09304184, -2.349274, -3.24238, 0, 0, 0, 1, 1,
-0.08879425, -0.7352789, -3.003536, 0, 0, 0, 1, 1,
-0.08810911, -0.01809416, -1.29639, 0, 0, 0, 1, 1,
-0.08768954, 0.3213432, 0.8480322, 0, 0, 0, 1, 1,
-0.08570171, 0.4347766, 0.621657, 0, 0, 0, 1, 1,
-0.0839173, 1.490727, -0.6084352, 0, 0, 0, 1, 1,
-0.08195968, 0.2181268, 0.4894384, 0, 0, 0, 1, 1,
-0.0803571, -0.8535525, -3.420641, 1, 1, 1, 1, 1,
-0.07976952, -0.1355494, -4.430128, 1, 1, 1, 1, 1,
-0.07965171, -0.700982, -3.922201, 1, 1, 1, 1, 1,
-0.07297195, -1.555717, -3.423404, 1, 1, 1, 1, 1,
-0.06904243, -0.2902534, -2.875423, 1, 1, 1, 1, 1,
-0.06610347, 1.098001, -0.2193812, 1, 1, 1, 1, 1,
-0.06207896, -0.8962914, -2.068959, 1, 1, 1, 1, 1,
-0.06077035, -0.2645117, -4.273775, 1, 1, 1, 1, 1,
-0.0554605, -1.225011, -2.657206, 1, 1, 1, 1, 1,
-0.04864339, 0.6038792, -2.421427, 1, 1, 1, 1, 1,
-0.04864289, -0.2126599, -2.469194, 1, 1, 1, 1, 1,
-0.04792647, -0.211686, -4.13454, 1, 1, 1, 1, 1,
-0.04758171, -0.6115688, -3.424707, 1, 1, 1, 1, 1,
-0.0420445, 1.077136, 0.3733345, 1, 1, 1, 1, 1,
-0.04120823, 2.054349, 1.334584, 1, 1, 1, 1, 1,
-0.04098044, -0.7597066, -3.156062, 0, 0, 1, 1, 1,
-0.03447938, -1.469724, -3.002881, 1, 0, 0, 1, 1,
-0.03181257, 2.077718, 0.2069003, 1, 0, 0, 1, 1,
-0.02927699, -0.004020243, -3.604151, 1, 0, 0, 1, 1,
-0.02819877, 0.3312235, 0.1507874, 1, 0, 0, 1, 1,
-0.02760504, 0.1000809, -0.4849702, 1, 0, 0, 1, 1,
-0.02588451, -1.729777, -4.958318, 0, 0, 0, 1, 1,
-0.02538528, -0.9144247, -4.023313, 0, 0, 0, 1, 1,
-0.02309772, 0.7938262, 0.3563366, 0, 0, 0, 1, 1,
-0.01734472, 1.172282, -0.2412009, 0, 0, 0, 1, 1,
-0.01244458, 0.9928803, 1.977768, 0, 0, 0, 1, 1,
-0.004875648, 0.4871682, -2.513133, 0, 0, 0, 1, 1,
-0.004344502, -0.7324648, -5.676253, 0, 0, 0, 1, 1,
-0.0004443794, 0.2719759, -0.901007, 1, 1, 1, 1, 1,
0.002000025, -0.1574833, 3.247478, 1, 1, 1, 1, 1,
0.002673152, -1.333305, 4.567516, 1, 1, 1, 1, 1,
0.002775558, -0.2064964, 3.927315, 1, 1, 1, 1, 1,
0.004597154, -0.581726, 2.883763, 1, 1, 1, 1, 1,
0.004900363, -0.7492204, 3.922707, 1, 1, 1, 1, 1,
0.005384055, -0.4507222, 3.278317, 1, 1, 1, 1, 1,
0.01112943, 0.770385, 0.3540129, 1, 1, 1, 1, 1,
0.02154211, 1.520708, -1.742927, 1, 1, 1, 1, 1,
0.02241232, -0.212067, 4.003258, 1, 1, 1, 1, 1,
0.02762023, 1.370813, 1.285049, 1, 1, 1, 1, 1,
0.03079268, 0.7759038, 1.065298, 1, 1, 1, 1, 1,
0.03599459, 0.98209, -0.1737528, 1, 1, 1, 1, 1,
0.03838799, 0.1161609, -0.4983833, 1, 1, 1, 1, 1,
0.04063407, -0.1008552, 3.109277, 1, 1, 1, 1, 1,
0.04178798, 0.3228527, 2.232183, 0, 0, 1, 1, 1,
0.04279442, -0.7707507, 4.187383, 1, 0, 0, 1, 1,
0.04495315, -0.1789358, 1.933618, 1, 0, 0, 1, 1,
0.04573806, 1.150446, -0.0322312, 1, 0, 0, 1, 1,
0.04672207, -1.042794, 3.611994, 1, 0, 0, 1, 1,
0.04704776, 0.4035297, 1.305516, 1, 0, 0, 1, 1,
0.05058053, 1.102181, -0.3598177, 0, 0, 0, 1, 1,
0.05221559, 0.677541, 1.485267, 0, 0, 0, 1, 1,
0.05463881, 0.2609252, 2.316781, 0, 0, 0, 1, 1,
0.06024667, -0.2856047, 2.151722, 0, 0, 0, 1, 1,
0.06028201, -0.1095017, 2.845155, 0, 0, 0, 1, 1,
0.06225957, 0.6718026, -0.8181139, 0, 0, 0, 1, 1,
0.06761133, 0.611226, -3.035529, 0, 0, 0, 1, 1,
0.06879526, 0.002595912, 1.75186, 1, 1, 1, 1, 1,
0.07357755, 0.7980341, -0.820015, 1, 1, 1, 1, 1,
0.07684541, -0.3853955, 1.749415, 1, 1, 1, 1, 1,
0.07797334, 0.8656688, 0.975593, 1, 1, 1, 1, 1,
0.07824726, 0.2430712, -0.001130594, 1, 1, 1, 1, 1,
0.08135272, 0.5736151, 1.313113, 1, 1, 1, 1, 1,
0.0921323, -0.2090952, 2.289608, 1, 1, 1, 1, 1,
0.09408021, -0.045775, 2.824732, 1, 1, 1, 1, 1,
0.09636413, 0.1729818, 0.002652851, 1, 1, 1, 1, 1,
0.09747714, -0.1904702, 3.650742, 1, 1, 1, 1, 1,
0.108752, -0.5904503, 2.746522, 1, 1, 1, 1, 1,
0.1115135, 1.513098, 0.7869374, 1, 1, 1, 1, 1,
0.1200444, 0.4753122, 2.605271, 1, 1, 1, 1, 1,
0.1243832, 0.2884555, 1.454164, 1, 1, 1, 1, 1,
0.1310171, -0.1056378, 1.444662, 1, 1, 1, 1, 1,
0.1310739, 0.6499803, -0.1443373, 0, 0, 1, 1, 1,
0.1326002, 0.9816699, 0.1956302, 1, 0, 0, 1, 1,
0.1328165, -0.2572112, 0.2390654, 1, 0, 0, 1, 1,
0.1329824, -0.4961369, 2.589455, 1, 0, 0, 1, 1,
0.1371524, -0.5501505, 3.769871, 1, 0, 0, 1, 1,
0.1396585, -0.206625, 3.183486, 1, 0, 0, 1, 1,
0.14251, -0.8184024, 5.266945, 0, 0, 0, 1, 1,
0.1466735, 0.5720536, 0.7733106, 0, 0, 0, 1, 1,
0.1481156, -0.6730065, 2.40483, 0, 0, 0, 1, 1,
0.1493197, 0.5747167, 0.6527548, 0, 0, 0, 1, 1,
0.1493363, 0.8064002, 1.965932, 0, 0, 0, 1, 1,
0.1503002, 0.1495095, 0.3488797, 0, 0, 0, 1, 1,
0.1504236, 0.6015186, -0.03133693, 0, 0, 0, 1, 1,
0.1513121, -2.710713, 1.920062, 1, 1, 1, 1, 1,
0.152307, -0.8954144, 2.299605, 1, 1, 1, 1, 1,
0.1529991, -1.139268, 2.757649, 1, 1, 1, 1, 1,
0.1548378, -0.6273361, 4.634068, 1, 1, 1, 1, 1,
0.1590583, -1.070773, 1.984062, 1, 1, 1, 1, 1,
0.1614118, 1.631898, -0.9812049, 1, 1, 1, 1, 1,
0.1626848, 2.799284, -0.05604729, 1, 1, 1, 1, 1,
0.1629881, 0.1007791, 0.9342611, 1, 1, 1, 1, 1,
0.1647931, -0.5791546, 3.707923, 1, 1, 1, 1, 1,
0.1693849, -0.8806638, 2.873744, 1, 1, 1, 1, 1,
0.1717412, -0.2427782, 3.352274, 1, 1, 1, 1, 1,
0.1735628, 0.04024115, 2.868052, 1, 1, 1, 1, 1,
0.174202, -0.6931722, 3.245197, 1, 1, 1, 1, 1,
0.174576, 0.5896294, -0.6854161, 1, 1, 1, 1, 1,
0.1800425, -0.9302032, 1.63655, 1, 1, 1, 1, 1,
0.1806361, 0.8714907, 1.181651, 0, 0, 1, 1, 1,
0.1815973, 1.097588, 1.289519, 1, 0, 0, 1, 1,
0.1817227, -1.237414, 0.9458607, 1, 0, 0, 1, 1,
0.1841678, -0.3164232, 1.034258, 1, 0, 0, 1, 1,
0.1850595, 0.8354198, 0.7042133, 1, 0, 0, 1, 1,
0.1867636, 1.444862, 0.89785, 1, 0, 0, 1, 1,
0.1881444, 1.38177, -0.1355872, 0, 0, 0, 1, 1,
0.1916195, 1.207551, -0.734163, 0, 0, 0, 1, 1,
0.1920615, 0.1310553, 3.053746, 0, 0, 0, 1, 1,
0.1981873, 1.816539, -0.9439474, 0, 0, 0, 1, 1,
0.20038, -0.1781957, 1.468444, 0, 0, 0, 1, 1,
0.2023184, -0.6432148, 4.654491, 0, 0, 0, 1, 1,
0.2040586, 0.4429085, 0.6426625, 0, 0, 0, 1, 1,
0.204291, -1.268393, 3.090696, 1, 1, 1, 1, 1,
0.2047262, 1.66215, -1.670427, 1, 1, 1, 1, 1,
0.2049427, 0.3475424, -1.819202, 1, 1, 1, 1, 1,
0.2057354, -0.5881334, 5.200245, 1, 1, 1, 1, 1,
0.2116915, 1.071459, 0.44283, 1, 1, 1, 1, 1,
0.2148185, -1.28264, 5.207569, 1, 1, 1, 1, 1,
0.2149312, 1.597057, 1.482643, 1, 1, 1, 1, 1,
0.2150394, 0.3885246, 0.8034267, 1, 1, 1, 1, 1,
0.2180583, 0.1432828, 2.163557, 1, 1, 1, 1, 1,
0.2181119, -0.3251139, 2.656647, 1, 1, 1, 1, 1,
0.2193662, 0.570485, 0.5016916, 1, 1, 1, 1, 1,
0.2224317, -0.1071491, 0.7385583, 1, 1, 1, 1, 1,
0.2236906, 1.382006, -0.1173722, 1, 1, 1, 1, 1,
0.2251158, 0.9451076, -0.4048424, 1, 1, 1, 1, 1,
0.2253137, -0.1415152, 2.508595, 1, 1, 1, 1, 1,
0.237671, -0.5437232, 1.48981, 0, 0, 1, 1, 1,
0.2379165, -1.301082, 3.873513, 1, 0, 0, 1, 1,
0.2436069, -0.3615361, 2.515677, 1, 0, 0, 1, 1,
0.2451219, -0.1300168, -0.3180047, 1, 0, 0, 1, 1,
0.246693, -0.2520842, 1.856869, 1, 0, 0, 1, 1,
0.2482731, -0.5959505, 4.240875, 1, 0, 0, 1, 1,
0.2505341, -0.5574336, 0.5535436, 0, 0, 0, 1, 1,
0.2541304, -1.417431, 2.043324, 0, 0, 0, 1, 1,
0.2581758, 0.1473425, 0.6317233, 0, 0, 0, 1, 1,
0.2610517, -0.1108114, 0.5513178, 0, 0, 0, 1, 1,
0.2622706, -0.5582958, 2.510249, 0, 0, 0, 1, 1,
0.2635876, 0.1579739, 1.31587, 0, 0, 0, 1, 1,
0.2637255, 0.2044497, 1.111488, 0, 0, 0, 1, 1,
0.2694182, 1.772686, 1.089959, 1, 1, 1, 1, 1,
0.2710817, -0.9593088, 2.05548, 1, 1, 1, 1, 1,
0.2784264, 1.015038, 1.532094, 1, 1, 1, 1, 1,
0.2904629, 2.202024, -0.3325064, 1, 1, 1, 1, 1,
0.2917183, 1.338481, -0.7676562, 1, 1, 1, 1, 1,
0.2921299, 0.627184, -0.006655896, 1, 1, 1, 1, 1,
0.2949487, 1.260098, -2.103062, 1, 1, 1, 1, 1,
0.2972445, 1.502882, 1.044544, 1, 1, 1, 1, 1,
0.3091327, 2.244298, -0.7397937, 1, 1, 1, 1, 1,
0.3092502, -1.379539, 1.096393, 1, 1, 1, 1, 1,
0.3097312, 0.3646794, 1.624264, 1, 1, 1, 1, 1,
0.3115512, -0.6188883, 3.590614, 1, 1, 1, 1, 1,
0.3124304, -1.363919, 1.505093, 1, 1, 1, 1, 1,
0.3124454, -0.5876865, 3.59306, 1, 1, 1, 1, 1,
0.3146616, 0.9413866, 0.6550173, 1, 1, 1, 1, 1,
0.3154399, 0.09902574, 1.632047, 0, 0, 1, 1, 1,
0.3168745, 0.3645251, 1.3683, 1, 0, 0, 1, 1,
0.3227076, 0.4113727, 0.7795852, 1, 0, 0, 1, 1,
0.3281694, -0.2897292, 5.140635, 1, 0, 0, 1, 1,
0.3308218, -0.6003325, 3.720373, 1, 0, 0, 1, 1,
0.3380805, 0.5573682, -0.1281498, 1, 0, 0, 1, 1,
0.3439806, 0.01285876, 0.2431545, 0, 0, 0, 1, 1,
0.3441984, -0.1498649, 0.9002294, 0, 0, 0, 1, 1,
0.3445064, 0.5132109, -0.01193742, 0, 0, 0, 1, 1,
0.3542556, 0.1212077, -0.2561125, 0, 0, 0, 1, 1,
0.3548651, -1.521966, 1.823947, 0, 0, 0, 1, 1,
0.357945, 1.556155, 0.2018334, 0, 0, 0, 1, 1,
0.3646265, 0.1890784, 1.801171, 0, 0, 0, 1, 1,
0.3670134, 0.7015041, -0.1456009, 1, 1, 1, 1, 1,
0.3701276, 0.9161752, 0.2804354, 1, 1, 1, 1, 1,
0.3705733, -2.303601, 2.117965, 1, 1, 1, 1, 1,
0.3724885, 1.790388, 1.607623, 1, 1, 1, 1, 1,
0.3736587, 0.515222, -0.4677634, 1, 1, 1, 1, 1,
0.3790009, 0.2381798, 2.570719, 1, 1, 1, 1, 1,
0.3790574, -0.5461267, 4.636907, 1, 1, 1, 1, 1,
0.3793364, 1.897534, -0.1176157, 1, 1, 1, 1, 1,
0.3813634, -1.676288, 2.527489, 1, 1, 1, 1, 1,
0.3824264, 1.08321, -0.1611667, 1, 1, 1, 1, 1,
0.3907516, 0.3143685, 1.064307, 1, 1, 1, 1, 1,
0.391692, -1.914715, 3.140677, 1, 1, 1, 1, 1,
0.3931316, 0.0392523, 2.001823, 1, 1, 1, 1, 1,
0.3945819, 0.4154176, 0.9521388, 1, 1, 1, 1, 1,
0.4016052, 0.09599119, 1.674005, 1, 1, 1, 1, 1,
0.4043384, -1.895688, 2.552402, 0, 0, 1, 1, 1,
0.4051757, 0.7097264, 2.063967, 1, 0, 0, 1, 1,
0.413691, -2.160297, 3.64464, 1, 0, 0, 1, 1,
0.4244112, 0.3865373, 0.7166043, 1, 0, 0, 1, 1,
0.4251809, -0.4296275, 2.539445, 1, 0, 0, 1, 1,
0.4254863, -3.016335, 0.5587051, 1, 0, 0, 1, 1,
0.4259898, 0.275269, 2.168887, 0, 0, 0, 1, 1,
0.4286794, -1.325927, 2.690692, 0, 0, 0, 1, 1,
0.4316993, 1.09292, -0.05939314, 0, 0, 0, 1, 1,
0.4334277, -0.4987449, 2.107249, 0, 0, 0, 1, 1,
0.4337575, -0.5526549, 1.7478, 0, 0, 0, 1, 1,
0.4390292, 0.8715144, 0.2004978, 0, 0, 0, 1, 1,
0.4484507, 0.6851177, 0.4297008, 0, 0, 0, 1, 1,
0.451987, -0.3346755, 3.954718, 1, 1, 1, 1, 1,
0.4527318, 1.033397, 1.11445, 1, 1, 1, 1, 1,
0.4538064, -0.323462, 4.582727, 1, 1, 1, 1, 1,
0.4569009, -0.5233648, 0.7359132, 1, 1, 1, 1, 1,
0.4603245, -1.661073, 2.507746, 1, 1, 1, 1, 1,
0.4666094, -0.1447068, 2.379904, 1, 1, 1, 1, 1,
0.4705805, 0.3950274, 1.774902, 1, 1, 1, 1, 1,
0.4727243, -0.2925374, 3.25535, 1, 1, 1, 1, 1,
0.4730944, -0.9901998, 3.605233, 1, 1, 1, 1, 1,
0.4735356, 1.61645, -1.080909, 1, 1, 1, 1, 1,
0.4772449, -0.06973398, 1.974549, 1, 1, 1, 1, 1,
0.4779589, -0.4050928, 1.717453, 1, 1, 1, 1, 1,
0.4829004, 0.3244029, 1.460344, 1, 1, 1, 1, 1,
0.4909681, -1.458853, 1.486042, 1, 1, 1, 1, 1,
0.4929154, -0.5568242, 2.556557, 1, 1, 1, 1, 1,
0.4979727, 0.585459, -0.2971292, 0, 0, 1, 1, 1,
0.4986185, -1.483573, 3.063541, 1, 0, 0, 1, 1,
0.5000063, -0.6469353, 3.126914, 1, 0, 0, 1, 1,
0.5006481, -0.7084683, 5.841499, 1, 0, 0, 1, 1,
0.5076997, -0.06157226, 1.093956, 1, 0, 0, 1, 1,
0.5115772, 0.3761013, 0.08434276, 1, 0, 0, 1, 1,
0.5117218, -1.03458, 2.611009, 0, 0, 0, 1, 1,
0.5153293, 0.5698251, -0.7944919, 0, 0, 0, 1, 1,
0.5154704, -0.3858397, 1.305456, 0, 0, 0, 1, 1,
0.5159863, 0.64498, -0.9465141, 0, 0, 0, 1, 1,
0.5166191, 0.2603357, 0.4875395, 0, 0, 0, 1, 1,
0.5242912, -0.3824359, 2.02494, 0, 0, 0, 1, 1,
0.5242925, 0.6671412, -0.3445463, 0, 0, 0, 1, 1,
0.5285778, -0.2860721, 1.978272, 1, 1, 1, 1, 1,
0.5308889, -1.005875, 1.099895, 1, 1, 1, 1, 1,
0.532519, -1.208915, 2.600312, 1, 1, 1, 1, 1,
0.5365031, -0.4667321, 2.568748, 1, 1, 1, 1, 1,
0.5378294, 1.309194, -1.055203, 1, 1, 1, 1, 1,
0.540673, -0.8982007, 1.126596, 1, 1, 1, 1, 1,
0.5417284, -0.977558, 2.732913, 1, 1, 1, 1, 1,
0.5419853, 0.8993517, -1.366788, 1, 1, 1, 1, 1,
0.5428054, -0.04135231, 1.887549, 1, 1, 1, 1, 1,
0.5515178, -0.5840194, 3.093159, 1, 1, 1, 1, 1,
0.5538979, 0.8054958, 0.4400424, 1, 1, 1, 1, 1,
0.5655376, -0.3182738, 2.513818, 1, 1, 1, 1, 1,
0.5694851, 1.492326, 0.623324, 1, 1, 1, 1, 1,
0.5740893, -0.4072613, 1.902937, 1, 1, 1, 1, 1,
0.5800865, -1.585203, 4.22969, 1, 1, 1, 1, 1,
0.5806061, -0.731439, 1.31853, 0, 0, 1, 1, 1,
0.582095, 1.755424, 0.1337628, 1, 0, 0, 1, 1,
0.5831145, -0.3192482, 0.812986, 1, 0, 0, 1, 1,
0.588761, 1.822237, 1.81609, 1, 0, 0, 1, 1,
0.5890654, -1.239198, 1.652131, 1, 0, 0, 1, 1,
0.5953064, 1.197931, 0.7048319, 1, 0, 0, 1, 1,
0.6091289, -0.5035136, 1.744121, 0, 0, 0, 1, 1,
0.6118849, -1.013964, 2.103146, 0, 0, 0, 1, 1,
0.6120414, 0.6184136, -0.7447847, 0, 0, 0, 1, 1,
0.6127453, 0.7512388, 0.837453, 0, 0, 0, 1, 1,
0.6131278, -1.507118, 3.190447, 0, 0, 0, 1, 1,
0.6151423, -0.09676285, 2.033279, 0, 0, 0, 1, 1,
0.618373, 0.84957, 2.183314, 0, 0, 0, 1, 1,
0.6199627, 0.5819662, 0.03896672, 1, 1, 1, 1, 1,
0.6252571, -1.233373, 1.018572, 1, 1, 1, 1, 1,
0.6277067, 0.23133, 1.384015, 1, 1, 1, 1, 1,
0.6282857, -0.9316272, 1.849534, 1, 1, 1, 1, 1,
0.6347156, 0.2715064, 1.826867, 1, 1, 1, 1, 1,
0.6352902, -0.5205671, 1.283163, 1, 1, 1, 1, 1,
0.6353289, 0.6938418, 1.307288, 1, 1, 1, 1, 1,
0.636169, 0.297277, 1.409803, 1, 1, 1, 1, 1,
0.6376931, 0.4230545, 0.7910582, 1, 1, 1, 1, 1,
0.6403706, 0.816255, 0.5909373, 1, 1, 1, 1, 1,
0.6414582, 1.329481, 0.2666452, 1, 1, 1, 1, 1,
0.6452397, -0.7304481, 2.479215, 1, 1, 1, 1, 1,
0.6466215, -0.8695352, 2.604041, 1, 1, 1, 1, 1,
0.6496343, 0.5470492, 1.64339, 1, 1, 1, 1, 1,
0.649635, -1.164833, 4.317758, 1, 1, 1, 1, 1,
0.6519305, 1.206659, 0.1332911, 0, 0, 1, 1, 1,
0.6625764, 0.9089059, 0.3507488, 1, 0, 0, 1, 1,
0.6643482, 0.003625856, 2.034982, 1, 0, 0, 1, 1,
0.6675747, 1.425751, -0.2921244, 1, 0, 0, 1, 1,
0.6710979, -0.7990745, 1.478211, 1, 0, 0, 1, 1,
0.6716121, 0.5242306, 1.41361, 1, 0, 0, 1, 1,
0.6754768, -0.2606005, 3.808639, 0, 0, 0, 1, 1,
0.6810669, 0.1541104, 1.02082, 0, 0, 0, 1, 1,
0.6816772, -1.000146, 3.671926, 0, 0, 0, 1, 1,
0.6932642, 1.550965, 0.5542588, 0, 0, 0, 1, 1,
0.6942261, -1.730534, 2.877263, 0, 0, 0, 1, 1,
0.6954061, -1.357571, 1.745748, 0, 0, 0, 1, 1,
0.6955348, 0.6213974, 0.7451875, 0, 0, 0, 1, 1,
0.6959566, -0.4740243, 2.863691, 1, 1, 1, 1, 1,
0.6992958, 2.052008, 1.530288, 1, 1, 1, 1, 1,
0.7002662, 0.3590594, 0.1802953, 1, 1, 1, 1, 1,
0.7071936, 0.4514958, 0.2884753, 1, 1, 1, 1, 1,
0.7098284, 1.457078, -1.402487, 1, 1, 1, 1, 1,
0.7182711, -0.9759762, 2.500264, 1, 1, 1, 1, 1,
0.7198343, 0.5463543, 1.231001, 1, 1, 1, 1, 1,
0.7251832, -1.082803, 3.929746, 1, 1, 1, 1, 1,
0.7312633, 0.6985224, 0.1646752, 1, 1, 1, 1, 1,
0.7366164, 0.9569679, -1.261923, 1, 1, 1, 1, 1,
0.739414, 0.5980352, 0.7594852, 1, 1, 1, 1, 1,
0.749838, -0.2558069, 1.368978, 1, 1, 1, 1, 1,
0.7507282, -0.7874737, 1.152402, 1, 1, 1, 1, 1,
0.7541947, 1.461479, 1.968666, 1, 1, 1, 1, 1,
0.7786399, -0.8731973, 3.528644, 1, 1, 1, 1, 1,
0.7831992, 1.382833, -0.1150616, 0, 0, 1, 1, 1,
0.7859923, 1.489047, 1.692581, 1, 0, 0, 1, 1,
0.7888774, -1.552159, 2.617791, 1, 0, 0, 1, 1,
0.7907316, -0.7112519, 1.507066, 1, 0, 0, 1, 1,
0.7945345, 1.410916, 0.3027651, 1, 0, 0, 1, 1,
0.7959445, 0.2001911, 1.183719, 1, 0, 0, 1, 1,
0.797294, 0.6617075, -0.7702378, 0, 0, 0, 1, 1,
0.7988763, -0.621195, 4.150459, 0, 0, 0, 1, 1,
0.800029, 1.370514, -0.4111513, 0, 0, 0, 1, 1,
0.8040606, 0.7012585, 1.84817, 0, 0, 0, 1, 1,
0.805543, -0.1548449, 3.727423, 0, 0, 0, 1, 1,
0.8059368, 0.07411851, 1.305483, 0, 0, 0, 1, 1,
0.8100438, -0.3186558, 2.601155, 0, 0, 0, 1, 1,
0.8150046, -0.1734091, 0.02988741, 1, 1, 1, 1, 1,
0.8276844, -0.9407799, 1.445231, 1, 1, 1, 1, 1,
0.8300483, -2.00736, 5.442193, 1, 1, 1, 1, 1,
0.8308307, -0.03542761, 1.563924, 1, 1, 1, 1, 1,
0.830854, 0.3488138, 2.964086, 1, 1, 1, 1, 1,
0.8319796, -1.063192, 1.233416, 1, 1, 1, 1, 1,
0.8343751, -0.0934833, 0.5915606, 1, 1, 1, 1, 1,
0.835603, 1.599603, -2.012683, 1, 1, 1, 1, 1,
0.8358376, -0.9554582, 2.364581, 1, 1, 1, 1, 1,
0.8370472, -1.233706, 2.224985, 1, 1, 1, 1, 1,
0.8398754, -0.3019669, 1.167392, 1, 1, 1, 1, 1,
0.8424823, 0.9311304, 0.9543259, 1, 1, 1, 1, 1,
0.8426452, 2.029446, 2.318533, 1, 1, 1, 1, 1,
0.8477526, -0.5829135, 2.337482, 1, 1, 1, 1, 1,
0.8532349, 0.1846402, 2.230925, 1, 1, 1, 1, 1,
0.8562928, 0.8166273, -1.054378, 0, 0, 1, 1, 1,
0.8583468, -1.139257, 2.817485, 1, 0, 0, 1, 1,
0.8644712, 0.2564241, 1.697773, 1, 0, 0, 1, 1,
0.8684943, 0.616204, -0.5784028, 1, 0, 0, 1, 1,
0.871837, -0.2017753, 2.489717, 1, 0, 0, 1, 1,
0.8770673, 1.23927, 0.875693, 1, 0, 0, 1, 1,
0.8782663, 1.001732, 0.6779558, 0, 0, 0, 1, 1,
0.8849807, 2.088234, -0.6334165, 0, 0, 0, 1, 1,
0.8852634, 2.306852, -0.4158903, 0, 0, 0, 1, 1,
0.886655, 0.1913569, 2.046069, 0, 0, 0, 1, 1,
0.8884803, -0.8022903, 3.120862, 0, 0, 0, 1, 1,
0.8905131, -1.279817, 2.470468, 0, 0, 0, 1, 1,
0.8948169, -0.006342943, 1.654138, 0, 0, 0, 1, 1,
0.8966707, -2.523328, 3.443668, 1, 1, 1, 1, 1,
0.8982145, -0.1598996, 0.4918838, 1, 1, 1, 1, 1,
0.9017989, -1.018361, 2.296226, 1, 1, 1, 1, 1,
0.905472, -2.195227, 1.213885, 1, 1, 1, 1, 1,
0.9060335, 0.2542295, -1.469838, 1, 1, 1, 1, 1,
0.9062967, 1.150583, -0.9290197, 1, 1, 1, 1, 1,
0.9068747, 0.06348345, 0.4006939, 1, 1, 1, 1, 1,
0.9076511, -0.6716748, 2.966483, 1, 1, 1, 1, 1,
0.9083835, -1.635116, 0.7020127, 1, 1, 1, 1, 1,
0.9168286, -0.1971236, 0.2122221, 1, 1, 1, 1, 1,
0.9201728, 1.129276, -0.9259476, 1, 1, 1, 1, 1,
0.9204378, 1.496301, 0.2312152, 1, 1, 1, 1, 1,
0.9276193, -1.011348, 3.076431, 1, 1, 1, 1, 1,
0.9464139, 0.03423229, 2.003659, 1, 1, 1, 1, 1,
0.9491946, -0.2154686, 1.018139, 1, 1, 1, 1, 1,
0.9527402, 0.5881534, 2.003132, 0, 0, 1, 1, 1,
0.9539812, -0.6635578, 2.666947, 1, 0, 0, 1, 1,
0.958351, 0.8766208, 0.4993445, 1, 0, 0, 1, 1,
0.9605513, 0.4985791, 2.076672, 1, 0, 0, 1, 1,
0.9683313, -0.08377648, 0.9026579, 1, 0, 0, 1, 1,
0.9698849, 2.13761, 1.069889, 1, 0, 0, 1, 1,
0.9728305, -1.898289, 4.388162, 0, 0, 0, 1, 1,
0.9885502, 0.9121224, -0.5119694, 0, 0, 0, 1, 1,
0.9917296, 0.04767772, 1.432058, 0, 0, 0, 1, 1,
0.9923049, -0.08201429, 0.5844914, 0, 0, 0, 1, 1,
1.010405, -0.3433384, 0.3944219, 0, 0, 0, 1, 1,
1.014508, 0.06533172, -0.7511318, 0, 0, 0, 1, 1,
1.015124, -0.09403998, 1.226311, 0, 0, 0, 1, 1,
1.018176, -0.180784, 0.8927092, 1, 1, 1, 1, 1,
1.024278, 0.02439195, 2.621686, 1, 1, 1, 1, 1,
1.024934, 0.8922576, 1.985064, 1, 1, 1, 1, 1,
1.029292, -0.3236647, 4.001475, 1, 1, 1, 1, 1,
1.034148, 0.2060894, 1.292692, 1, 1, 1, 1, 1,
1.034614, -0.3609095, 3.014071, 1, 1, 1, 1, 1,
1.036174, 0.4911352, 1.261005, 1, 1, 1, 1, 1,
1.037317, -1.753104, 4.628351, 1, 1, 1, 1, 1,
1.040049, -0.01912944, 0.5946594, 1, 1, 1, 1, 1,
1.052121, 0.7400074, -1.334173, 1, 1, 1, 1, 1,
1.071457, -0.683549, 3.454373, 1, 1, 1, 1, 1,
1.077112, -0.6452463, 3.061398, 1, 1, 1, 1, 1,
1.077743, -1.194465, 1.487493, 1, 1, 1, 1, 1,
1.078005, 0.329708, 0.8568309, 1, 1, 1, 1, 1,
1.092724, 0.6362208, 1.628763, 1, 1, 1, 1, 1,
1.09706, -0.8229257, 2.025286, 0, 0, 1, 1, 1,
1.100404, 0.8737431, -0.2832195, 1, 0, 0, 1, 1,
1.100644, -0.5411735, 1.867979, 1, 0, 0, 1, 1,
1.100666, 1.659235, 2.138842, 1, 0, 0, 1, 1,
1.107155, 0.2724608, 2.253568, 1, 0, 0, 1, 1,
1.115123, 1.109784, 0.1883212, 1, 0, 0, 1, 1,
1.115447, 0.5974386, 1.938438, 0, 0, 0, 1, 1,
1.115852, 0.6878999, 1.118998, 0, 0, 0, 1, 1,
1.122003, -0.9161856, 2.917163, 0, 0, 0, 1, 1,
1.130028, -1.414039, 2.010087, 0, 0, 0, 1, 1,
1.168188, 0.9179447, 2.033147, 0, 0, 0, 1, 1,
1.17356, -1.099795, 2.082892, 0, 0, 0, 1, 1,
1.175138, -0.5953222, 1.046801, 0, 0, 0, 1, 1,
1.177609, -2.150929, 4.073585, 1, 1, 1, 1, 1,
1.18221, 0.5150053, 1.53742, 1, 1, 1, 1, 1,
1.187642, -0.2750115, 3.580527, 1, 1, 1, 1, 1,
1.187706, -1.115591, 3.456042, 1, 1, 1, 1, 1,
1.188607, -2.484601, 2.601855, 1, 1, 1, 1, 1,
1.193158, 0.131253, 0.9071707, 1, 1, 1, 1, 1,
1.194374, -0.04063228, 2.175987, 1, 1, 1, 1, 1,
1.203902, -0.4611323, 1.979551, 1, 1, 1, 1, 1,
1.205292, 1.462623, 0.4168343, 1, 1, 1, 1, 1,
1.208764, 1.706788, 1.550595, 1, 1, 1, 1, 1,
1.212451, 0.963495, 1.656596, 1, 1, 1, 1, 1,
1.212458, 0.3836158, 1.010735, 1, 1, 1, 1, 1,
1.213418, -0.9757515, 1.904894, 1, 1, 1, 1, 1,
1.213672, -0.5810288, 2.808994, 1, 1, 1, 1, 1,
1.215847, 1.40498, -1.355917, 1, 1, 1, 1, 1,
1.226025, -1.509381, 2.63964, 0, 0, 1, 1, 1,
1.23327, 0.1622651, 0.7382042, 1, 0, 0, 1, 1,
1.234816, 0.2485179, 1.643386, 1, 0, 0, 1, 1,
1.254995, -1.111681, 5.050232, 1, 0, 0, 1, 1,
1.259921, -0.04019748, 2.968229, 1, 0, 0, 1, 1,
1.262388, 1.438822, 2.214018, 1, 0, 0, 1, 1,
1.263446, 0.943202, 1.209323, 0, 0, 0, 1, 1,
1.263596, -0.08160846, 0.6851906, 0, 0, 0, 1, 1,
1.264364, 1.3972, -1.221761, 0, 0, 0, 1, 1,
1.269356, -0.3905704, 3.083083, 0, 0, 0, 1, 1,
1.271964, 2.201544, 0.5446806, 0, 0, 0, 1, 1,
1.273972, 1.116794, 0.6765249, 0, 0, 0, 1, 1,
1.278157, -1.75223, 2.885635, 0, 0, 0, 1, 1,
1.286364, 0.4427433, 1.339375, 1, 1, 1, 1, 1,
1.290264, 1.194447, -0.6796978, 1, 1, 1, 1, 1,
1.290722, 0.8933699, 1.216758, 1, 1, 1, 1, 1,
1.295153, -1.168849, 0.7150367, 1, 1, 1, 1, 1,
1.29736, 0.7179062, 1.198572, 1, 1, 1, 1, 1,
1.297622, 0.006156588, -0.8310908, 1, 1, 1, 1, 1,
1.301896, -1.318091, 3.351857, 1, 1, 1, 1, 1,
1.30428, -0.4363137, 2.663381, 1, 1, 1, 1, 1,
1.306166, -0.1372657, -0.1844328, 1, 1, 1, 1, 1,
1.313004, 1.437869, 0.4652767, 1, 1, 1, 1, 1,
1.314111, 1.37948, 0.171534, 1, 1, 1, 1, 1,
1.318276, -2.25602, 2.695916, 1, 1, 1, 1, 1,
1.332877, 1.595757, 0.2307695, 1, 1, 1, 1, 1,
1.33938, 0.2709228, 1.94767, 1, 1, 1, 1, 1,
1.346892, 0.1361405, 1.30544, 1, 1, 1, 1, 1,
1.34874, 0.863225, 0.7853895, 0, 0, 1, 1, 1,
1.349564, 0.3938661, 4.104818, 1, 0, 0, 1, 1,
1.353061, -1.759475, 1.716677, 1, 0, 0, 1, 1,
1.356783, -0.8318267, -0.05388822, 1, 0, 0, 1, 1,
1.357558, 0.6190075, 0.4407577, 1, 0, 0, 1, 1,
1.357706, 1.034413, 1.621526, 1, 0, 0, 1, 1,
1.360298, -0.6796795, 2.684592, 0, 0, 0, 1, 1,
1.363877, 0.7363705, -0.5840311, 0, 0, 0, 1, 1,
1.372494, 0.4678812, 2.092659, 0, 0, 0, 1, 1,
1.375502, -0.5531698, 3.025077, 0, 0, 0, 1, 1,
1.377936, -2.342521, 3.394493, 0, 0, 0, 1, 1,
1.386429, 0.5764042, 2.849735, 0, 0, 0, 1, 1,
1.405368, -0.6450672, 3.090558, 0, 0, 0, 1, 1,
1.411301, 0.2157927, 3.061272, 1, 1, 1, 1, 1,
1.41188, -1.163859, 1.893546, 1, 1, 1, 1, 1,
1.414086, -1.008959, 2.349697, 1, 1, 1, 1, 1,
1.436913, 0.3657306, 0.3155746, 1, 1, 1, 1, 1,
1.439569, -1.78108, 2.409817, 1, 1, 1, 1, 1,
1.444391, -0.9838374, 1.001552, 1, 1, 1, 1, 1,
1.44548, 2.132, 1.694643, 1, 1, 1, 1, 1,
1.448911, -1.749283, 1.11107, 1, 1, 1, 1, 1,
1.449003, -0.2145548, 1.816275, 1, 1, 1, 1, 1,
1.460442, -0.7036033, 1.624127, 1, 1, 1, 1, 1,
1.460538, -0.4308324, 2.367689, 1, 1, 1, 1, 1,
1.469689, 0.6026344, 0.8054341, 1, 1, 1, 1, 1,
1.493485, -0.5902737, 3.107816, 1, 1, 1, 1, 1,
1.49619, 0.08743838, 0.268872, 1, 1, 1, 1, 1,
1.50284, -0.2714292, -1.005978, 1, 1, 1, 1, 1,
1.512198, 0.5044603, 0.9153528, 0, 0, 1, 1, 1,
1.51411, 0.1012331, 3.027708, 1, 0, 0, 1, 1,
1.515577, 0.8998634, -0.1646535, 1, 0, 0, 1, 1,
1.522087, 1.42763, 0.8567175, 1, 0, 0, 1, 1,
1.530993, 0.09879638, 0.05598694, 1, 0, 0, 1, 1,
1.538223, 0.8329987, -1.582037, 1, 0, 0, 1, 1,
1.543664, 0.4547796, 0.1521762, 0, 0, 0, 1, 1,
1.549229, 0.05145046, 0.7271402, 0, 0, 0, 1, 1,
1.553381, -1.641583, 0.7619033, 0, 0, 0, 1, 1,
1.559173, -0.6863397, 3.155153, 0, 0, 0, 1, 1,
1.563803, 1.016058, 2.200249, 0, 0, 0, 1, 1,
1.577699, 0.04260461, 1.400043, 0, 0, 0, 1, 1,
1.585421, 1.621175, 1.544474, 0, 0, 0, 1, 1,
1.585841, -0.6031533, -0.4036689, 1, 1, 1, 1, 1,
1.594306, 0.8683438, 1.240233, 1, 1, 1, 1, 1,
1.598186, -0.598758, 3.579941, 1, 1, 1, 1, 1,
1.608697, -0.8353325, 1.218406, 1, 1, 1, 1, 1,
1.609779, 0.03127408, 2.277994, 1, 1, 1, 1, 1,
1.619111, 0.4092026, 1.4462, 1, 1, 1, 1, 1,
1.63165, 0.6790591, 2.985555, 1, 1, 1, 1, 1,
1.63343, -0.0415029, 1.95276, 1, 1, 1, 1, 1,
1.634199, -0.6920544, 3.05313, 1, 1, 1, 1, 1,
1.642178, 1.30593, -0.003393022, 1, 1, 1, 1, 1,
1.647135, -0.7449136, 2.587882, 1, 1, 1, 1, 1,
1.656404, 0.1682089, 1.335958, 1, 1, 1, 1, 1,
1.658002, 1.312154, -0.2036963, 1, 1, 1, 1, 1,
1.677033, 1.073093, 0.7492127, 1, 1, 1, 1, 1,
1.678025, 0.3339696, 0.966368, 1, 1, 1, 1, 1,
1.714615, 0.159638, 1.628505, 0, 0, 1, 1, 1,
1.720152, 0.1598245, 0.6006538, 1, 0, 0, 1, 1,
1.724537, 1.218606, 0.5497969, 1, 0, 0, 1, 1,
1.729559, -2.372044, 3.850846, 1, 0, 0, 1, 1,
1.761266, -2.008325, 1.44514, 1, 0, 0, 1, 1,
1.764929, 0.3491322, 0.9155913, 1, 0, 0, 1, 1,
1.765695, 0.2464202, 0.5640619, 0, 0, 0, 1, 1,
1.770923, -0.05255637, 2.261589, 0, 0, 0, 1, 1,
1.77567, -0.4059499, 1.891806, 0, 0, 0, 1, 1,
1.813442, 1.124374, 1.266716, 0, 0, 0, 1, 1,
1.828519, 1.063111, 1.683526, 0, 0, 0, 1, 1,
1.831302, 0.1128403, 1.124088, 0, 0, 0, 1, 1,
1.84113, 1.405101, 0.4226061, 0, 0, 0, 1, 1,
1.846112, 0.4241301, 0.9069519, 1, 1, 1, 1, 1,
1.863987, 1.196928, 1.071301, 1, 1, 1, 1, 1,
1.871761, 0.1058211, 2.268687, 1, 1, 1, 1, 1,
1.87357, 1.22262, 0.1925139, 1, 1, 1, 1, 1,
1.874437, 1.008256, 1.485747, 1, 1, 1, 1, 1,
1.909122, 0.7927002, 0.9710987, 1, 1, 1, 1, 1,
1.968884, 0.4298, 1.516974, 1, 1, 1, 1, 1,
1.975851, 0.858155, 1.56522, 1, 1, 1, 1, 1,
1.9967, -1.274068, 3.804622, 1, 1, 1, 1, 1,
2.01727, -2.138175, 3.433048, 1, 1, 1, 1, 1,
2.037156, 0.929531, 2.936011, 1, 1, 1, 1, 1,
2.048134, 0.1821366, 1.338246, 1, 1, 1, 1, 1,
2.054222, -0.3440581, 1.775683, 1, 1, 1, 1, 1,
2.084012, 0.8018987, 0.8609985, 1, 1, 1, 1, 1,
2.084799, -0.3461989, 2.080269, 1, 1, 1, 1, 1,
2.092763, -0.3287437, 1.67742, 0, 0, 1, 1, 1,
2.110655, -1.388312, 2.397732, 1, 0, 0, 1, 1,
2.120954, -1.617066, 1.033412, 1, 0, 0, 1, 1,
2.181696, 1.402212, 0.8887487, 1, 0, 0, 1, 1,
2.192402, 1.018114, 0.9641464, 1, 0, 0, 1, 1,
2.228804, 1.833589, 0.9119239, 1, 0, 0, 1, 1,
2.265538, -0.02394002, 2.664194, 0, 0, 0, 1, 1,
2.351061, 0.2751238, 1.16818, 0, 0, 0, 1, 1,
2.424621, 1.649842, -0.04790018, 0, 0, 0, 1, 1,
2.455821, -0.219899, 1.464746, 0, 0, 0, 1, 1,
2.53684, 0.2724486, 0.3603776, 0, 0, 0, 1, 1,
2.569558, -0.411036, 3.680949, 0, 0, 0, 1, 1,
2.610398, 0.8757533, 0.02135079, 0, 0, 0, 1, 1,
2.617254, -0.1999355, 2.231697, 1, 1, 1, 1, 1,
2.696577, -0.0716797, 1.475401, 1, 1, 1, 1, 1,
2.717165, -0.06329211, 1.738268, 1, 1, 1, 1, 1,
2.756629, 0.9980348, 3.272038, 1, 1, 1, 1, 1,
2.800321, -0.9971324, 1.116186, 1, 1, 1, 1, 1,
2.842948, 1.141386, 1.252158, 1, 1, 1, 1, 1,
2.92697, 0.9149202, -0.3913514, 1, 1, 1, 1, 1
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
var radius = 10.37751;
var distance = 36.45057;
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
mvMatrix.translate( 0.5371714, -0.4427969, 0.1497445 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.45057);
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
