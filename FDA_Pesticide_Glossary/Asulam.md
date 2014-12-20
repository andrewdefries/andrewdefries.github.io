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
-3.873487, 0.3629505, -1.976492, 1, 0, 0, 1,
-3.013448, 0.6541579, 0.3314914, 1, 0.007843138, 0, 1,
-2.933215, -0.6846226, -1.35878, 1, 0.01176471, 0, 1,
-2.852106, -0.5200624, -1.257796, 1, 0.01960784, 0, 1,
-2.792296, -0.6003081, -2.119283, 1, 0.02352941, 0, 1,
-2.777014, -0.8062817, -4.2766, 1, 0.03137255, 0, 1,
-2.598475, -2.303689, -1.90587, 1, 0.03529412, 0, 1,
-2.465274, 0.9350966, -1.447956, 1, 0.04313726, 0, 1,
-2.280409, -0.02304684, -1.124178, 1, 0.04705882, 0, 1,
-2.254067, -0.3768543, -2.023729, 1, 0.05490196, 0, 1,
-2.184968, -0.9546382, -0.5280755, 1, 0.05882353, 0, 1,
-2.12231, 0.3414123, -1.78024, 1, 0.06666667, 0, 1,
-2.116588, -2.085221, -2.18507, 1, 0.07058824, 0, 1,
-2.107644, 0.3448303, -1.314636, 1, 0.07843138, 0, 1,
-2.081836, 0.1209229, -1.526792, 1, 0.08235294, 0, 1,
-2.022876, 0.0962673, -1.486094, 1, 0.09019608, 0, 1,
-2.016407, -0.4766047, -2.145843, 1, 0.09411765, 0, 1,
-2.007765, 0.5136558, -0.6353184, 1, 0.1019608, 0, 1,
-1.993938, 0.2467755, -2.259592, 1, 0.1098039, 0, 1,
-1.993117, 1.643483, -1.1725, 1, 0.1137255, 0, 1,
-1.962127, -0.2806709, -0.7674936, 1, 0.1215686, 0, 1,
-1.956397, -0.5586556, -3.932806, 1, 0.1254902, 0, 1,
-1.954279, -1.530947, -4.07955, 1, 0.1333333, 0, 1,
-1.948362, -0.6561468, -1.205016, 1, 0.1372549, 0, 1,
-1.928922, 1.681632, -0.6018478, 1, 0.145098, 0, 1,
-1.918396, -1.46732, -2.961467, 1, 0.1490196, 0, 1,
-1.914015, -0.291022, -0.3887449, 1, 0.1568628, 0, 1,
-1.900623, -0.4964168, -0.9826328, 1, 0.1607843, 0, 1,
-1.894368, -0.01301979, -1.876223, 1, 0.1686275, 0, 1,
-1.871408, -0.6878695, -1.609209, 1, 0.172549, 0, 1,
-1.870243, 0.1994802, -0.9417493, 1, 0.1803922, 0, 1,
-1.850045, 0.4984426, -2.856579, 1, 0.1843137, 0, 1,
-1.843933, 0.7856175, -1.824883, 1, 0.1921569, 0, 1,
-1.83923, -0.394433, -2.718961, 1, 0.1960784, 0, 1,
-1.836579, 0.5578104, -0.4263722, 1, 0.2039216, 0, 1,
-1.822449, -0.6974156, -2.956322, 1, 0.2117647, 0, 1,
-1.781401, 1.389425, -1.451648, 1, 0.2156863, 0, 1,
-1.752151, 0.3868835, -1.575786, 1, 0.2235294, 0, 1,
-1.737169, 0.2028522, -2.532072, 1, 0.227451, 0, 1,
-1.721083, -0.9232427, -1.402942, 1, 0.2352941, 0, 1,
-1.718656, 1.160519, -1.252331, 1, 0.2392157, 0, 1,
-1.715897, 1.06992, -0.7864683, 1, 0.2470588, 0, 1,
-1.708107, -0.4043957, -2.024994, 1, 0.2509804, 0, 1,
-1.707555, -1.787478, -2.633513, 1, 0.2588235, 0, 1,
-1.688481, 0.4299793, -0.05179898, 1, 0.2627451, 0, 1,
-1.682278, 0.7041615, 0.6916777, 1, 0.2705882, 0, 1,
-1.645968, -0.865895, -1.193735, 1, 0.2745098, 0, 1,
-1.64045, -0.1448196, -1.81328, 1, 0.282353, 0, 1,
-1.615465, 0.6834579, -1.305007, 1, 0.2862745, 0, 1,
-1.59832, 1.849426, -0.2536601, 1, 0.2941177, 0, 1,
-1.580623, -0.2057944, -2.149786, 1, 0.3019608, 0, 1,
-1.572398, 1.001736, -0.9915138, 1, 0.3058824, 0, 1,
-1.570726, 1.187986, -1.557659, 1, 0.3137255, 0, 1,
-1.553353, 1.458658, -1.242829, 1, 0.3176471, 0, 1,
-1.544491, -0.2615488, -0.5395959, 1, 0.3254902, 0, 1,
-1.54139, -0.1406597, -1.583427, 1, 0.3294118, 0, 1,
-1.534118, -0.09794907, -2.30702, 1, 0.3372549, 0, 1,
-1.532014, 1.755413, 0.4274752, 1, 0.3411765, 0, 1,
-1.531692, 0.8062047, -1.688439, 1, 0.3490196, 0, 1,
-1.530171, -1.200795, -2.920245, 1, 0.3529412, 0, 1,
-1.523647, 1.149142, 0.5370172, 1, 0.3607843, 0, 1,
-1.522312, 0.5781693, -0.7043135, 1, 0.3647059, 0, 1,
-1.518875, 0.6112968, 0.2085411, 1, 0.372549, 0, 1,
-1.495908, 0.8170223, -0.4763659, 1, 0.3764706, 0, 1,
-1.487584, -0.780288, -2.266419, 1, 0.3843137, 0, 1,
-1.485293, 1.215883, -1.460152, 1, 0.3882353, 0, 1,
-1.480565, -1.396232, -2.824147, 1, 0.3960784, 0, 1,
-1.473066, -0.4241718, -2.967101, 1, 0.4039216, 0, 1,
-1.47121, 0.4692726, -2.066049, 1, 0.4078431, 0, 1,
-1.46198, 1.500106, -2.559262, 1, 0.4156863, 0, 1,
-1.458411, -0.07634435, -3.294197, 1, 0.4196078, 0, 1,
-1.455825, -1.134051, -0.8955195, 1, 0.427451, 0, 1,
-1.433661, -0.4532218, -1.17066, 1, 0.4313726, 0, 1,
-1.432939, 1.521329, -2.408858, 1, 0.4392157, 0, 1,
-1.432452, -1.249891, -4.305876, 1, 0.4431373, 0, 1,
-1.409709, -0.2979483, -0.192108, 1, 0.4509804, 0, 1,
-1.400347, -0.4163944, -0.9900296, 1, 0.454902, 0, 1,
-1.39821, -0.1955017, -1.038161, 1, 0.4627451, 0, 1,
-1.391053, -0.1304671, -3.414078, 1, 0.4666667, 0, 1,
-1.385748, -0.2540424, -2.652395, 1, 0.4745098, 0, 1,
-1.380862, -1.696512, -3.958924, 1, 0.4784314, 0, 1,
-1.369032, 0.127363, -1.625697, 1, 0.4862745, 0, 1,
-1.367503, -1.147601, -2.189831, 1, 0.4901961, 0, 1,
-1.365728, 1.055268, -0.08284982, 1, 0.4980392, 0, 1,
-1.358643, 0.3704327, -1.049583, 1, 0.5058824, 0, 1,
-1.343522, 1.025944, -0.1257761, 1, 0.509804, 0, 1,
-1.322942, -0.7919888, -2.896703, 1, 0.5176471, 0, 1,
-1.320781, -1.75176, -0.7206562, 1, 0.5215687, 0, 1,
-1.31845, 0.3879367, 0.01949892, 1, 0.5294118, 0, 1,
-1.313479, -0.6021576, -4.287472, 1, 0.5333334, 0, 1,
-1.305286, -0.3974873, -1.390052, 1, 0.5411765, 0, 1,
-1.304616, 1.012249, -2.943426, 1, 0.5450981, 0, 1,
-1.288341, -2.595109, -2.4076, 1, 0.5529412, 0, 1,
-1.280689, 0.9203524, -0.7266297, 1, 0.5568628, 0, 1,
-1.280447, -1.44621, -2.602546, 1, 0.5647059, 0, 1,
-1.276612, 0.1412649, -3.798144, 1, 0.5686275, 0, 1,
-1.270579, 0.05565678, -1.270382, 1, 0.5764706, 0, 1,
-1.268532, -0.230554, -4.152737, 1, 0.5803922, 0, 1,
-1.266833, -0.1776095, -2.069038, 1, 0.5882353, 0, 1,
-1.25978, 0.6632569, -2.999179, 1, 0.5921569, 0, 1,
-1.255365, -0.1431187, -3.3358, 1, 0.6, 0, 1,
-1.235988, -0.8109564, -0.101759, 1, 0.6078432, 0, 1,
-1.23218, 0.2396401, -1.162041, 1, 0.6117647, 0, 1,
-1.230519, -0.4382352, -1.735722, 1, 0.6196079, 0, 1,
-1.225834, 0.5361221, 0.126599, 1, 0.6235294, 0, 1,
-1.2235, -0.2747326, -1.68261, 1, 0.6313726, 0, 1,
-1.21425, -0.9543378, -3.748245, 1, 0.6352941, 0, 1,
-1.204242, -0.2846127, -0.7088799, 1, 0.6431373, 0, 1,
-1.201439, -0.3188516, -1.39159, 1, 0.6470588, 0, 1,
-1.199625, -0.9806435, -2.680607, 1, 0.654902, 0, 1,
-1.198326, -0.4650667, -1.499458, 1, 0.6588235, 0, 1,
-1.195683, -0.6093956, -2.320234, 1, 0.6666667, 0, 1,
-1.194414, -1.072607, -2.476734, 1, 0.6705883, 0, 1,
-1.192224, -0.08183336, -1.234746, 1, 0.6784314, 0, 1,
-1.18988, 0.9006397, 0.05033589, 1, 0.682353, 0, 1,
-1.181205, 1.12334, -1.110884, 1, 0.6901961, 0, 1,
-1.162688, -0.7404389, -1.047395, 1, 0.6941177, 0, 1,
-1.162449, -0.4181689, -1.237549, 1, 0.7019608, 0, 1,
-1.158344, -1.336884, -4.0773, 1, 0.7098039, 0, 1,
-1.150992, 0.6634616, -1.366826, 1, 0.7137255, 0, 1,
-1.148427, -0.6174744, -3.426012, 1, 0.7215686, 0, 1,
-1.146739, 0.7076284, -0.7516503, 1, 0.7254902, 0, 1,
-1.141301, -1.895755, -3.304193, 1, 0.7333333, 0, 1,
-1.139677, -1.028427, -2.636769, 1, 0.7372549, 0, 1,
-1.136805, -0.6688217, 0.3496468, 1, 0.7450981, 0, 1,
-1.13079, 2.63927, -0.3785547, 1, 0.7490196, 0, 1,
-1.122153, 1.754132, -1.125918, 1, 0.7568628, 0, 1,
-1.118659, 0.5540118, 1.148342, 1, 0.7607843, 0, 1,
-1.114946, 0.6041441, -0.9374648, 1, 0.7686275, 0, 1,
-1.11152, 0.07086376, -2.128707, 1, 0.772549, 0, 1,
-1.104003, -0.004042816, -1.583755, 1, 0.7803922, 0, 1,
-1.099593, -0.1992074, -1.649656, 1, 0.7843137, 0, 1,
-1.088167, 1.895667, 0.5352361, 1, 0.7921569, 0, 1,
-1.086984, 1.761705, 0.3005844, 1, 0.7960784, 0, 1,
-1.085353, -0.3699317, -1.345219, 1, 0.8039216, 0, 1,
-1.082517, -1.620247, -3.863221, 1, 0.8117647, 0, 1,
-1.078684, -1.002367, -0.8931829, 1, 0.8156863, 0, 1,
-1.078118, 0.3733926, -2.069096, 1, 0.8235294, 0, 1,
-1.076658, -0.6084426, -1.772929, 1, 0.827451, 0, 1,
-1.076551, -0.09290718, -2.07522, 1, 0.8352941, 0, 1,
-1.072039, 1.081969, -1.013725, 1, 0.8392157, 0, 1,
-1.067638, 0.4610903, -0.8629987, 1, 0.8470588, 0, 1,
-1.066588, 2.257791, 0.8131343, 1, 0.8509804, 0, 1,
-1.061938, 1.632334, -0.3173631, 1, 0.8588235, 0, 1,
-1.058953, 1.240224, -1.136735, 1, 0.8627451, 0, 1,
-1.057448, -0.7864189, -3.450382, 1, 0.8705882, 0, 1,
-1.057102, 0.7144892, 1.0504, 1, 0.8745098, 0, 1,
-1.054355, -1.749853, -3.095744, 1, 0.8823529, 0, 1,
-1.052909, -0.7077094, -3.401725, 1, 0.8862745, 0, 1,
-1.047463, -1.167361, -2.570995, 1, 0.8941177, 0, 1,
-1.043927, -0.1721059, -0.7646766, 1, 0.8980392, 0, 1,
-1.036508, -0.5092268, -3.719646, 1, 0.9058824, 0, 1,
-1.034799, 0.00714383, -3.034039, 1, 0.9137255, 0, 1,
-1.027654, 0.1683358, -0.8484992, 1, 0.9176471, 0, 1,
-1.022993, -0.2918214, -0.9237059, 1, 0.9254902, 0, 1,
-1.022681, -0.1766083, -2.4224, 1, 0.9294118, 0, 1,
-1.020386, 0.5289685, 0.0790341, 1, 0.9372549, 0, 1,
-1.015665, -0.3871775, -3.87585, 1, 0.9411765, 0, 1,
-1.008943, -0.3590823, -0.5727006, 1, 0.9490196, 0, 1,
-1.004895, 0.1974336, -2.911804, 1, 0.9529412, 0, 1,
-1.004653, -0.01885144, -0.8036311, 1, 0.9607843, 0, 1,
-1.000896, 0.4016712, -1.763004, 1, 0.9647059, 0, 1,
-0.9966326, -0.7713076, -1.559089, 1, 0.972549, 0, 1,
-0.9916926, 0.09226002, -1.116329, 1, 0.9764706, 0, 1,
-0.9865775, 0.1968853, -0.4289605, 1, 0.9843137, 0, 1,
-0.9808264, 1.860683, 0.07608715, 1, 0.9882353, 0, 1,
-0.9779609, -1.823142, -1.965491, 1, 0.9960784, 0, 1,
-0.9757305, 1.169858, -0.834497, 0.9960784, 1, 0, 1,
-0.9717129, 1.897002, -0.7076171, 0.9921569, 1, 0, 1,
-0.9706665, -1.400689, -4.345596, 0.9843137, 1, 0, 1,
-0.9637544, -0.1442518, -1.591149, 0.9803922, 1, 0, 1,
-0.9610205, 1.432114, 0.8942099, 0.972549, 1, 0, 1,
-0.9584154, -0.1995085, -2.55212, 0.9686275, 1, 0, 1,
-0.9538705, 1.133575, 0.5559064, 0.9607843, 1, 0, 1,
-0.9511502, 0.8745031, -0.9218932, 0.9568627, 1, 0, 1,
-0.9440946, 0.993739, -0.2704629, 0.9490196, 1, 0, 1,
-0.9386469, -0.04387712, -1.229775, 0.945098, 1, 0, 1,
-0.9373335, -0.2827044, -0.8698367, 0.9372549, 1, 0, 1,
-0.9310855, -0.05845348, -2.961076, 0.9333333, 1, 0, 1,
-0.9281681, -0.3190075, -2.161491, 0.9254902, 1, 0, 1,
-0.9258109, 0.2224689, -4.049631, 0.9215686, 1, 0, 1,
-0.9253849, 0.47047, -1.799419, 0.9137255, 1, 0, 1,
-0.9206445, 0.2722791, -1.853927, 0.9098039, 1, 0, 1,
-0.919204, 1.180404, -0.5054502, 0.9019608, 1, 0, 1,
-0.9189992, 0.1589444, -1.619703, 0.8941177, 1, 0, 1,
-0.9081733, -0.3153243, -3.443803, 0.8901961, 1, 0, 1,
-0.9062082, -1.028878, -1.481907, 0.8823529, 1, 0, 1,
-0.8944901, -0.1899395, -1.876233, 0.8784314, 1, 0, 1,
-0.8943326, -0.2160675, -0.8323763, 0.8705882, 1, 0, 1,
-0.8869346, 1.686261, -2.944916, 0.8666667, 1, 0, 1,
-0.8854325, -0.8939415, -2.985635, 0.8588235, 1, 0, 1,
-0.8849897, -1.768023, -2.231596, 0.854902, 1, 0, 1,
-0.8778274, 0.7357152, -0.6725072, 0.8470588, 1, 0, 1,
-0.87634, -0.4966389, -1.973745, 0.8431373, 1, 0, 1,
-0.8660767, 0.3616214, -1.267514, 0.8352941, 1, 0, 1,
-0.863603, -0.1024921, -1.864761, 0.8313726, 1, 0, 1,
-0.8622158, 1.222494, -1.968406, 0.8235294, 1, 0, 1,
-0.857233, 0.7623705, -1.804087, 0.8196079, 1, 0, 1,
-0.8567979, 0.02862014, 0.9329203, 0.8117647, 1, 0, 1,
-0.8414419, 0.8969652, -1.70696, 0.8078431, 1, 0, 1,
-0.8407019, -1.360949, -0.3614522, 0.8, 1, 0, 1,
-0.8397367, 0.0009101156, -0.4099287, 0.7921569, 1, 0, 1,
-0.8387582, -0.05613989, -1.43909, 0.7882353, 1, 0, 1,
-0.8370762, -0.9997836, -2.619846, 0.7803922, 1, 0, 1,
-0.8216427, 0.8428813, -0.4604453, 0.7764706, 1, 0, 1,
-0.8193913, 1.712954, -1.699597, 0.7686275, 1, 0, 1,
-0.8186374, -0.4450305, -2.826053, 0.7647059, 1, 0, 1,
-0.8093317, 0.09383409, -0.2161679, 0.7568628, 1, 0, 1,
-0.8081964, -0.02463104, -1.985682, 0.7529412, 1, 0, 1,
-0.8063166, -0.6193284, -1.213678, 0.7450981, 1, 0, 1,
-0.8026351, -1.421238, -3.132323, 0.7411765, 1, 0, 1,
-0.8007705, 0.08035783, -2.093419, 0.7333333, 1, 0, 1,
-0.7997807, 0.9692848, -3.240421, 0.7294118, 1, 0, 1,
-0.7844229, -2.249439, -2.879327, 0.7215686, 1, 0, 1,
-0.783057, -0.5464399, -1.997086, 0.7176471, 1, 0, 1,
-0.7798361, 0.4104825, -2.382574, 0.7098039, 1, 0, 1,
-0.775371, 0.02301347, -2.355368, 0.7058824, 1, 0, 1,
-0.7747386, -0.9654401, -2.85706, 0.6980392, 1, 0, 1,
-0.7739897, -2.032641, -0.7579171, 0.6901961, 1, 0, 1,
-0.7720802, 0.2195249, -0.817766, 0.6862745, 1, 0, 1,
-0.7691522, 0.2076696, -2.708652, 0.6784314, 1, 0, 1,
-0.7682977, 0.03489021, -1.119468, 0.6745098, 1, 0, 1,
-0.7670385, -0.09284418, -2.063138, 0.6666667, 1, 0, 1,
-0.7624769, 0.3146676, 0.5081878, 0.6627451, 1, 0, 1,
-0.761184, -1.008584, -2.118567, 0.654902, 1, 0, 1,
-0.7523762, -0.1741172, -2.060515, 0.6509804, 1, 0, 1,
-0.7492561, 1.917964, 0.5091637, 0.6431373, 1, 0, 1,
-0.7474769, -1.987402, -3.324942, 0.6392157, 1, 0, 1,
-0.7444518, -0.2363856, -2.613121, 0.6313726, 1, 0, 1,
-0.743327, -0.01850181, -1.854464, 0.627451, 1, 0, 1,
-0.7425333, -0.1499529, -1.976612, 0.6196079, 1, 0, 1,
-0.7399247, 1.35633, -0.611604, 0.6156863, 1, 0, 1,
-0.738051, 0.1541473, -2.020437, 0.6078432, 1, 0, 1,
-0.7367895, -0.924344, -2.723182, 0.6039216, 1, 0, 1,
-0.7361006, 0.1996778, -3.058639, 0.5960785, 1, 0, 1,
-0.7299969, -0.4963511, -2.187642, 0.5882353, 1, 0, 1,
-0.7281059, -0.6049303, -3.185492, 0.5843138, 1, 0, 1,
-0.7248348, 0.6632203, -1.652881, 0.5764706, 1, 0, 1,
-0.7177836, -1.976921, -3.485339, 0.572549, 1, 0, 1,
-0.7175239, -0.2944203, -2.201414, 0.5647059, 1, 0, 1,
-0.7173089, 0.455528, -0.5360215, 0.5607843, 1, 0, 1,
-0.7164797, -0.005904331, -2.065328, 0.5529412, 1, 0, 1,
-0.7143748, -1.188924, -3.244404, 0.5490196, 1, 0, 1,
-0.7142572, -2.097232, -2.870907, 0.5411765, 1, 0, 1,
-0.711789, -1.131417, -3.309512, 0.5372549, 1, 0, 1,
-0.7062864, -0.5414017, -3.096597, 0.5294118, 1, 0, 1,
-0.6978534, 1.613761, 0.8006793, 0.5254902, 1, 0, 1,
-0.690025, 0.4305974, 0.5285703, 0.5176471, 1, 0, 1,
-0.6889248, 1.349727, -1.036748, 0.5137255, 1, 0, 1,
-0.6803913, 3.882516, 0.7224216, 0.5058824, 1, 0, 1,
-0.6803322, -0.3919923, -2.853208, 0.5019608, 1, 0, 1,
-0.6792661, 2.190062, 0.7719362, 0.4941176, 1, 0, 1,
-0.6783621, -0.3846679, -3.145956, 0.4862745, 1, 0, 1,
-0.6780691, 0.3753892, -1.05884, 0.4823529, 1, 0, 1,
-0.6779906, -1.123597, -4.829939, 0.4745098, 1, 0, 1,
-0.6723382, -0.02421466, -1.223918, 0.4705882, 1, 0, 1,
-0.6715685, 2.264516, 1.192224, 0.4627451, 1, 0, 1,
-0.6682132, 0.07230181, -0.9011595, 0.4588235, 1, 0, 1,
-0.6669257, -0.3938372, -2.5097, 0.4509804, 1, 0, 1,
-0.6663943, 0.9630852, 1.346439, 0.4470588, 1, 0, 1,
-0.6657329, 0.3589146, -2.487887, 0.4392157, 1, 0, 1,
-0.6503498, 0.3581078, -0.9512848, 0.4352941, 1, 0, 1,
-0.645772, 0.1556412, -2.235496, 0.427451, 1, 0, 1,
-0.641843, 0.2386877, -1.228403, 0.4235294, 1, 0, 1,
-0.6374481, 0.9026131, 1.323687, 0.4156863, 1, 0, 1,
-0.6369664, -0.9927608, -2.326143, 0.4117647, 1, 0, 1,
-0.6314791, 1.644719, -1.6479, 0.4039216, 1, 0, 1,
-0.6312008, 1.016137, -1.022335, 0.3960784, 1, 0, 1,
-0.6310973, -0.7956139, -1.902041, 0.3921569, 1, 0, 1,
-0.6308719, 0.1950705, -1.830001, 0.3843137, 1, 0, 1,
-0.6283583, 0.5253556, -0.3840149, 0.3803922, 1, 0, 1,
-0.6187661, 0.1873267, -2.021107, 0.372549, 1, 0, 1,
-0.614026, -1.86263, -1.238438, 0.3686275, 1, 0, 1,
-0.6113063, 1.317627, -0.06138131, 0.3607843, 1, 0, 1,
-0.6004311, 0.0164999, -1.475695, 0.3568628, 1, 0, 1,
-0.5959751, -0.8914573, -3.222227, 0.3490196, 1, 0, 1,
-0.5903895, 0.4371852, 0.3969708, 0.345098, 1, 0, 1,
-0.5890785, -0.4513035, -2.051145, 0.3372549, 1, 0, 1,
-0.5825795, 0.1250392, -2.479616, 0.3333333, 1, 0, 1,
-0.5825424, -0.491595, -1.279899, 0.3254902, 1, 0, 1,
-0.5819017, -0.2318136, -1.973876, 0.3215686, 1, 0, 1,
-0.5804314, -0.7911952, -1.65925, 0.3137255, 1, 0, 1,
-0.5802393, -0.5396546, -0.6507545, 0.3098039, 1, 0, 1,
-0.5792373, -1.053677, -3.414392, 0.3019608, 1, 0, 1,
-0.5661451, 0.5859197, -1.913154, 0.2941177, 1, 0, 1,
-0.5655037, 0.0606103, -0.4307578, 0.2901961, 1, 0, 1,
-0.5637198, -1.50276, -2.99366, 0.282353, 1, 0, 1,
-0.5632715, -0.957723, -3.068157, 0.2784314, 1, 0, 1,
-0.5612403, -1.631709, -1.53926, 0.2705882, 1, 0, 1,
-0.5584236, 0.4018704, -0.07737193, 0.2666667, 1, 0, 1,
-0.5578994, -1.972505, -3.155108, 0.2588235, 1, 0, 1,
-0.5554438, -0.8967915, -2.399532, 0.254902, 1, 0, 1,
-0.5519252, -0.6581749, -1.636939, 0.2470588, 1, 0, 1,
-0.5481656, 0.5261443, -1.487596, 0.2431373, 1, 0, 1,
-0.5469097, -0.3507149, -2.431746, 0.2352941, 1, 0, 1,
-0.5467119, -1.678225, -3.445514, 0.2313726, 1, 0, 1,
-0.5448375, -0.4036145, -2.296521, 0.2235294, 1, 0, 1,
-0.5439889, -0.3076335, -0.8021719, 0.2196078, 1, 0, 1,
-0.5391296, -0.3993368, -1.011793, 0.2117647, 1, 0, 1,
-0.5368062, -1.656661, -3.721792, 0.2078431, 1, 0, 1,
-0.5366877, -0.2207857, -0.5352449, 0.2, 1, 0, 1,
-0.5333053, -0.82255, -1.840491, 0.1921569, 1, 0, 1,
-0.5179214, -0.8561816, -1.971705, 0.1882353, 1, 0, 1,
-0.5079295, 0.6375623, -1.3248, 0.1803922, 1, 0, 1,
-0.5073298, -0.7019527, -1.165421, 0.1764706, 1, 0, 1,
-0.5072846, -0.8145226, -2.148727, 0.1686275, 1, 0, 1,
-0.4960915, -0.5416343, -2.448547, 0.1647059, 1, 0, 1,
-0.4870741, 1.16517, -0.6478254, 0.1568628, 1, 0, 1,
-0.4869387, -1.244428, -2.080296, 0.1529412, 1, 0, 1,
-0.4855238, 0.1754077, -0.6766021, 0.145098, 1, 0, 1,
-0.4844656, 0.06332894, -1.423479, 0.1411765, 1, 0, 1,
-0.4829623, 0.6645553, 0.9567981, 0.1333333, 1, 0, 1,
-0.4819535, 0.03528136, -0.3292536, 0.1294118, 1, 0, 1,
-0.471372, -0.8068386, -3.351406, 0.1215686, 1, 0, 1,
-0.4708993, -0.3267751, -2.749795, 0.1176471, 1, 0, 1,
-0.468748, 0.5084668, -1.233981, 0.1098039, 1, 0, 1,
-0.4676468, -0.7402142, -2.959255, 0.1058824, 1, 0, 1,
-0.4626524, -0.2009544, -2.711984, 0.09803922, 1, 0, 1,
-0.4623439, 1.474794, 0.6370556, 0.09019608, 1, 0, 1,
-0.4615937, -0.8477048, -2.432962, 0.08627451, 1, 0, 1,
-0.4596983, 0.4693182, 0.1007698, 0.07843138, 1, 0, 1,
-0.4546828, -0.2422933, -0.3852508, 0.07450981, 1, 0, 1,
-0.4485928, 0.32127, -1.953489, 0.06666667, 1, 0, 1,
-0.4484018, -1.460001, -2.004224, 0.0627451, 1, 0, 1,
-0.4430179, 1.195821, -0.5276853, 0.05490196, 1, 0, 1,
-0.4420533, -0.9481128, -1.605075, 0.05098039, 1, 0, 1,
-0.437195, 1.138666, -0.9072768, 0.04313726, 1, 0, 1,
-0.4367417, 0.07404788, -2.219364, 0.03921569, 1, 0, 1,
-0.4291719, 1.340207, -0.9408388, 0.03137255, 1, 0, 1,
-0.4287925, -0.2251705, -0.7841077, 0.02745098, 1, 0, 1,
-0.4274856, -0.5760899, -2.037488, 0.01960784, 1, 0, 1,
-0.4236253, 0.06815574, 0.5694997, 0.01568628, 1, 0, 1,
-0.4226749, 0.02187194, -2.24969, 0.007843138, 1, 0, 1,
-0.4185859, 1.95732, -0.3958776, 0.003921569, 1, 0, 1,
-0.4173473, -0.2398895, -1.598036, 0, 1, 0.003921569, 1,
-0.4071101, 0.7923202, 1.313286, 0, 1, 0.01176471, 1,
-0.4055345, -0.2453022, -2.876195, 0, 1, 0.01568628, 1,
-0.4039916, -2.560819, -2.149824, 0, 1, 0.02352941, 1,
-0.4012211, -0.7102869, -3.629207, 0, 1, 0.02745098, 1,
-0.3962395, -0.5251502, -1.631911, 0, 1, 0.03529412, 1,
-0.3960688, -2.385797, -2.260737, 0, 1, 0.03921569, 1,
-0.3948349, 0.5827315, -0.07225597, 0, 1, 0.04705882, 1,
-0.3938324, 1.252566, 0.2150448, 0, 1, 0.05098039, 1,
-0.393831, -1.362275, -2.41005, 0, 1, 0.05882353, 1,
-0.3929189, -0.4064775, -3.730022, 0, 1, 0.0627451, 1,
-0.3876306, -1.347684, -3.229791, 0, 1, 0.07058824, 1,
-0.3825285, -1.92983, -1.778018, 0, 1, 0.07450981, 1,
-0.3815196, -1.18193, -2.888964, 0, 1, 0.08235294, 1,
-0.3804491, 1.457247, -1.35992, 0, 1, 0.08627451, 1,
-0.3797642, -1.948983, -2.668809, 0, 1, 0.09411765, 1,
-0.3791097, -0.824854, -2.487051, 0, 1, 0.1019608, 1,
-0.3746743, -0.7255258, -2.890379, 0, 1, 0.1058824, 1,
-0.3658181, 2.193624, -0.5555117, 0, 1, 0.1137255, 1,
-0.3649282, -0.1839732, -1.628356, 0, 1, 0.1176471, 1,
-0.3624972, -0.06859097, -3.004385, 0, 1, 0.1254902, 1,
-0.3596081, 0.2084392, -2.500548, 0, 1, 0.1294118, 1,
-0.3551027, 0.05845352, -1.32309, 0, 1, 0.1372549, 1,
-0.3439423, 0.7953286, -1.888646, 0, 1, 0.1411765, 1,
-0.3401308, 1.35412, -0.5247598, 0, 1, 0.1490196, 1,
-0.3363598, 0.046755, -1.265325, 0, 1, 0.1529412, 1,
-0.3347253, 0.3639896, -0.1501237, 0, 1, 0.1607843, 1,
-0.3344731, 0.4042581, -1.285245, 0, 1, 0.1647059, 1,
-0.333252, 0.6407178, -2.293088, 0, 1, 0.172549, 1,
-0.3324486, 0.1334749, -2.983877, 0, 1, 0.1764706, 1,
-0.3317783, -0.6731367, -3.069387, 0, 1, 0.1843137, 1,
-0.3251039, -0.0448511, -2.352041, 0, 1, 0.1882353, 1,
-0.3238262, -0.3363112, -2.21342, 0, 1, 0.1960784, 1,
-0.3230421, -0.3071204, -2.020934, 0, 1, 0.2039216, 1,
-0.3224596, -1.785949, -1.531564, 0, 1, 0.2078431, 1,
-0.319673, 0.417768, 0.07159078, 0, 1, 0.2156863, 1,
-0.319114, 1.23407, 0.453342, 0, 1, 0.2196078, 1,
-0.3136148, 1.529222, 1.363918, 0, 1, 0.227451, 1,
-0.3071166, -0.2355752, -1.812785, 0, 1, 0.2313726, 1,
-0.3059455, 0.7881137, -0.712774, 0, 1, 0.2392157, 1,
-0.3032063, -0.9017864, -2.823446, 0, 1, 0.2431373, 1,
-0.3018454, 0.4262878, -0.6152604, 0, 1, 0.2509804, 1,
-0.300268, 0.5522782, -2.60549, 0, 1, 0.254902, 1,
-0.2997296, -1.30734, -4.640801, 0, 1, 0.2627451, 1,
-0.2896302, -0.6519949, -5.21937, 0, 1, 0.2666667, 1,
-0.2889604, 0.3717211, -2.173399, 0, 1, 0.2745098, 1,
-0.2826719, -1.239511, -3.664662, 0, 1, 0.2784314, 1,
-0.2821429, 0.1917825, -1.694755, 0, 1, 0.2862745, 1,
-0.2799415, -0.7040734, -2.34879, 0, 1, 0.2901961, 1,
-0.2787514, 2.739228, -0.48372, 0, 1, 0.2980392, 1,
-0.2744775, 1.083256, -0.6416686, 0, 1, 0.3058824, 1,
-0.2709974, 1.741556, 0.2073742, 0, 1, 0.3098039, 1,
-0.2672528, 0.3181413, 1.458816, 0, 1, 0.3176471, 1,
-0.2663983, -0.9951091, -2.720167, 0, 1, 0.3215686, 1,
-0.2638464, 0.5430854, 1.011437, 0, 1, 0.3294118, 1,
-0.2638442, -0.4523493, -2.585554, 0, 1, 0.3333333, 1,
-0.2628238, -0.2881718, -2.426466, 0, 1, 0.3411765, 1,
-0.2625365, -0.3302284, -0.9492496, 0, 1, 0.345098, 1,
-0.2605348, -2.290498, -2.016644, 0, 1, 0.3529412, 1,
-0.2597884, -1.377737, -2.366721, 0, 1, 0.3568628, 1,
-0.2586554, -0.7497665, -2.05225, 0, 1, 0.3647059, 1,
-0.2483241, -0.00435548, -1.053306, 0, 1, 0.3686275, 1,
-0.2341924, -2.028929, -3.824058, 0, 1, 0.3764706, 1,
-0.2273342, 0.8941797, 0.08954996, 0, 1, 0.3803922, 1,
-0.2235198, 2.052346, -0.06081885, 0, 1, 0.3882353, 1,
-0.2153874, 1.017637, -0.5427085, 0, 1, 0.3921569, 1,
-0.2134693, -2.494162, -1.60623, 0, 1, 0.4, 1,
-0.2028639, -0.8000239, -2.753749, 0, 1, 0.4078431, 1,
-0.1970604, -0.1714811, -2.67658, 0, 1, 0.4117647, 1,
-0.1944776, -0.6547951, -3.250432, 0, 1, 0.4196078, 1,
-0.1866077, -0.7973638, -3.240468, 0, 1, 0.4235294, 1,
-0.1833729, -0.3342833, -3.676231, 0, 1, 0.4313726, 1,
-0.1795503, 0.7484284, -1.490406, 0, 1, 0.4352941, 1,
-0.1710398, -0.8253443, -3.077319, 0, 1, 0.4431373, 1,
-0.1630122, 0.4189208, -0.1672642, 0, 1, 0.4470588, 1,
-0.156759, -0.739265, -2.775892, 0, 1, 0.454902, 1,
-0.1555664, 0.9591913, -0.557649, 0, 1, 0.4588235, 1,
-0.1534471, 0.813596, -0.7362315, 0, 1, 0.4666667, 1,
-0.1510659, 0.7170197, 0.3686207, 0, 1, 0.4705882, 1,
-0.1492541, 1.336571, 1.493469, 0, 1, 0.4784314, 1,
-0.1481961, 0.5348178, -1.465133, 0, 1, 0.4823529, 1,
-0.1374509, 0.8956005, 0.7222957, 0, 1, 0.4901961, 1,
-0.1362099, 0.4282182, 0.3890258, 0, 1, 0.4941176, 1,
-0.1356575, -0.2027114, -4.020092, 0, 1, 0.5019608, 1,
-0.1294338, -0.4599859, -2.174637, 0, 1, 0.509804, 1,
-0.129388, -2.446919, -0.8623145, 0, 1, 0.5137255, 1,
-0.1232815, -1.097948, -2.965552, 0, 1, 0.5215687, 1,
-0.1216175, -1.325694, -3.150914, 0, 1, 0.5254902, 1,
-0.1205491, -1.6988, -3.695071, 0, 1, 0.5333334, 1,
-0.119614, 0.08480179, -2.252452, 0, 1, 0.5372549, 1,
-0.1178716, -1.07478, -3.374685, 0, 1, 0.5450981, 1,
-0.0973403, -0.7849102, -3.478613, 0, 1, 0.5490196, 1,
-0.09686847, 1.283164, -0.909191, 0, 1, 0.5568628, 1,
-0.0934847, -0.7769795, -2.393583, 0, 1, 0.5607843, 1,
-0.09181812, 0.1232546, -0.3406096, 0, 1, 0.5686275, 1,
-0.08770973, 1.206693, 2.993188, 0, 1, 0.572549, 1,
-0.08754186, -1.179894, -2.390693, 0, 1, 0.5803922, 1,
-0.08329321, -1.857106, -3.970252, 0, 1, 0.5843138, 1,
-0.07977514, 0.141438, -0.4276955, 0, 1, 0.5921569, 1,
-0.07953946, -0.1838513, -3.61147, 0, 1, 0.5960785, 1,
-0.07933626, 0.09897092, -0.5665665, 0, 1, 0.6039216, 1,
-0.0721885, 0.1160169, -2.855203, 0, 1, 0.6117647, 1,
-0.07150403, 0.5238988, 0.6584361, 0, 1, 0.6156863, 1,
-0.07051191, 0.6995319, 0.1112012, 0, 1, 0.6235294, 1,
-0.07030197, -0.4123871, -3.428226, 0, 1, 0.627451, 1,
-0.06954315, 2.047414, -0.9396936, 0, 1, 0.6352941, 1,
-0.065565, 0.4532505, 0.8210789, 0, 1, 0.6392157, 1,
-0.06375042, -0.6355271, -2.022729, 0, 1, 0.6470588, 1,
-0.06115216, -1.213451, -2.858132, 0, 1, 0.6509804, 1,
-0.05438329, 0.1665387, -0.7009546, 0, 1, 0.6588235, 1,
-0.05385931, -1.020311, -3.480259, 0, 1, 0.6627451, 1,
-0.05316106, 0.7038164, -0.3058632, 0, 1, 0.6705883, 1,
-0.04914759, 0.7404951, -2.296781, 0, 1, 0.6745098, 1,
-0.04597636, -1.396632, -3.154602, 0, 1, 0.682353, 1,
-0.0439652, 2.144946, -0.6702696, 0, 1, 0.6862745, 1,
-0.04371583, 0.4464788, 0.3617435, 0, 1, 0.6941177, 1,
-0.04336951, 0.7254408, -0.4202172, 0, 1, 0.7019608, 1,
-0.04293682, -0.6312246, -1.896765, 0, 1, 0.7058824, 1,
-0.04247848, -0.5171565, -3.016325, 0, 1, 0.7137255, 1,
-0.04211545, -0.8251536, -3.916957, 0, 1, 0.7176471, 1,
-0.04094777, 1.130322, -1.623247, 0, 1, 0.7254902, 1,
-0.03885433, -0.5469587, -4.084529, 0, 1, 0.7294118, 1,
-0.03831024, -0.3596292, -3.507626, 0, 1, 0.7372549, 1,
-0.03793301, -0.3634546, -3.851567, 0, 1, 0.7411765, 1,
-0.03632723, 0.6165789, -1.477499, 0, 1, 0.7490196, 1,
-0.03192401, -2.483356, -3.913255, 0, 1, 0.7529412, 1,
-0.02816223, -0.2408009, -2.03983, 0, 1, 0.7607843, 1,
-0.0257008, 1.079584, 1.520617, 0, 1, 0.7647059, 1,
-0.0232235, -0.001099689, -1.289817, 0, 1, 0.772549, 1,
-0.01853132, 0.6635533, -1.584304, 0, 1, 0.7764706, 1,
-0.01668021, 1.189263, 0.9799605, 0, 1, 0.7843137, 1,
-0.01425613, -0.3191695, -1.764216, 0, 1, 0.7882353, 1,
-0.0133767, -2.788947, -3.693544, 0, 1, 0.7960784, 1,
-0.01330394, -2.237902, -2.930148, 0, 1, 0.8039216, 1,
-0.01102016, -0.2897895, -2.912215, 0, 1, 0.8078431, 1,
-0.009582701, -1.538246, -1.337976, 0, 1, 0.8156863, 1,
-0.008798796, 0.6855638, 0.4199194, 0, 1, 0.8196079, 1,
-0.005985993, 0.9555737, -0.7424731, 0, 1, 0.827451, 1,
-0.005598309, -0.477545, -2.66308, 0, 1, 0.8313726, 1,
-0.004851076, 0.8027809, 0.002105423, 0, 1, 0.8392157, 1,
-0.00150187, 0.285697, 1.291763, 0, 1, 0.8431373, 1,
0.00143579, -0.08214385, 4.499485, 0, 1, 0.8509804, 1,
0.00254233, 0.3896052, 0.07449234, 0, 1, 0.854902, 1,
0.006167399, -0.425312, 3.975414, 0, 1, 0.8627451, 1,
0.01087642, 0.375736, -0.3263207, 0, 1, 0.8666667, 1,
0.01380895, 1.404739, -0.008427125, 0, 1, 0.8745098, 1,
0.01838106, -1.230593, 2.705678, 0, 1, 0.8784314, 1,
0.01865106, -2.239601, 2.5903, 0, 1, 0.8862745, 1,
0.01911546, -1.248721, 4.675913, 0, 1, 0.8901961, 1,
0.02050645, -0.4568878, 3.08838, 0, 1, 0.8980392, 1,
0.02244363, 0.08279798, 1.246024, 0, 1, 0.9058824, 1,
0.02245458, -0.8603742, 3.393059, 0, 1, 0.9098039, 1,
0.02270007, 1.347367, 0.8310195, 0, 1, 0.9176471, 1,
0.02510419, 0.3521871, -0.6457343, 0, 1, 0.9215686, 1,
0.0296577, -0.302395, 3.796541, 0, 1, 0.9294118, 1,
0.03544428, -1.756871, 3.581756, 0, 1, 0.9333333, 1,
0.03636367, -1.202488, 1.710989, 0, 1, 0.9411765, 1,
0.03705713, -1.602048, 5.030499, 0, 1, 0.945098, 1,
0.03735295, -1.059813, 3.591092, 0, 1, 0.9529412, 1,
0.03792943, -0.6450548, 1.511731, 0, 1, 0.9568627, 1,
0.04586818, 0.8994402, -0.9581916, 0, 1, 0.9647059, 1,
0.0486451, -0.3962401, 2.198856, 0, 1, 0.9686275, 1,
0.05109747, 0.7464411, 0.612321, 0, 1, 0.9764706, 1,
0.05294035, -1.718841, 2.722477, 0, 1, 0.9803922, 1,
0.05354726, -0.2282383, 2.31456, 0, 1, 0.9882353, 1,
0.05971854, 0.6197615, -1.764995, 0, 1, 0.9921569, 1,
0.06079516, -1.116752, 3.383168, 0, 1, 1, 1,
0.06338681, -2.266479, 2.100037, 0, 0.9921569, 1, 1,
0.06418876, 0.9479134, 0.4028562, 0, 0.9882353, 1, 1,
0.07082394, -0.8740374, 1.839858, 0, 0.9803922, 1, 1,
0.07089245, -1.341057, 4.002123, 0, 0.9764706, 1, 1,
0.07281116, -1.092599, 4.661649, 0, 0.9686275, 1, 1,
0.07323102, -0.6286318, 3.597358, 0, 0.9647059, 1, 1,
0.07377101, -0.4373668, 4.242532, 0, 0.9568627, 1, 1,
0.07915504, -1.035783, 2.972409, 0, 0.9529412, 1, 1,
0.08040147, 0.4820249, 0.09960802, 0, 0.945098, 1, 1,
0.08203961, 0.5129299, -0.3121968, 0, 0.9411765, 1, 1,
0.08357687, -0.278943, 2.570117, 0, 0.9333333, 1, 1,
0.08641133, 2.001584, -0.3315681, 0, 0.9294118, 1, 1,
0.0868458, 0.6256773, 0.6606369, 0, 0.9215686, 1, 1,
0.08747574, -0.3529625, 4.293903, 0, 0.9176471, 1, 1,
0.08753979, 1.743099, -0.6246223, 0, 0.9098039, 1, 1,
0.08842101, 2.58623, 1.616621, 0, 0.9058824, 1, 1,
0.08940397, -0.01403641, 2.951714, 0, 0.8980392, 1, 1,
0.09140698, -1.474911, 1.396879, 0, 0.8901961, 1, 1,
0.09671356, -0.7820398, 2.447831, 0, 0.8862745, 1, 1,
0.09944019, 0.1450851, 0.6694118, 0, 0.8784314, 1, 1,
0.1019628, 0.08373784, -0.8393242, 0, 0.8745098, 1, 1,
0.1033075, -0.3834832, 5.772782, 0, 0.8666667, 1, 1,
0.1034834, 0.09038541, 0.5538276, 0, 0.8627451, 1, 1,
0.1061386, 1.565414, -0.4308514, 0, 0.854902, 1, 1,
0.1073396, 0.5912463, 1.585313, 0, 0.8509804, 1, 1,
0.1111785, 0.8508075, -0.91553, 0, 0.8431373, 1, 1,
0.1136221, 0.4791944, 0.1261475, 0, 0.8392157, 1, 1,
0.1145533, -0.1947018, 3.738163, 0, 0.8313726, 1, 1,
0.1145639, -0.6601572, 3.216875, 0, 0.827451, 1, 1,
0.1213608, -0.4241674, 3.30684, 0, 0.8196079, 1, 1,
0.1238567, 1.255516, -0.5092409, 0, 0.8156863, 1, 1,
0.1306058, 0.2877034, 2.18056, 0, 0.8078431, 1, 1,
0.1308917, 0.461868, 0.0531492, 0, 0.8039216, 1, 1,
0.1365505, 0.06120858, 2.043654, 0, 0.7960784, 1, 1,
0.1369631, 0.02498944, 3.463675, 0, 0.7882353, 1, 1,
0.1390236, -0.5320332, 2.480688, 0, 0.7843137, 1, 1,
0.1428775, -0.6996105, 2.330565, 0, 0.7764706, 1, 1,
0.1451911, -0.4494443, 2.716916, 0, 0.772549, 1, 1,
0.1504263, -1.182899, 3.077894, 0, 0.7647059, 1, 1,
0.1523588, 0.1884255, 0.8744354, 0, 0.7607843, 1, 1,
0.1536536, 0.5853851, 0.4026376, 0, 0.7529412, 1, 1,
0.1542742, -0.2562445, 1.92655, 0, 0.7490196, 1, 1,
0.1545218, -0.5575355, 2.078371, 0, 0.7411765, 1, 1,
0.1601152, 0.7897638, -0.2021624, 0, 0.7372549, 1, 1,
0.1606244, 1.50886, 1.358661, 0, 0.7294118, 1, 1,
0.1606736, -2.557814, 2.712636, 0, 0.7254902, 1, 1,
0.1637751, 0.7841749, 1.316429, 0, 0.7176471, 1, 1,
0.1664886, -1.24902, 0.268907, 0, 0.7137255, 1, 1,
0.1669551, -2.409472, 0.828718, 0, 0.7058824, 1, 1,
0.1682105, 1.612232, 0.3470658, 0, 0.6980392, 1, 1,
0.172941, -0.05995688, 2.18482, 0, 0.6941177, 1, 1,
0.1819055, -0.7085213, 1.261981, 0, 0.6862745, 1, 1,
0.1855998, 2.153508, -1.471915, 0, 0.682353, 1, 1,
0.1868006, -0.5034481, 2.716169, 0, 0.6745098, 1, 1,
0.1872287, 0.5874785, -0.08794715, 0, 0.6705883, 1, 1,
0.188589, -1.605632, 3.671664, 0, 0.6627451, 1, 1,
0.1930278, -0.05223433, -0.5203837, 0, 0.6588235, 1, 1,
0.1960252, 0.2713925, 1.209593, 0, 0.6509804, 1, 1,
0.196587, -1.590211, 2.864872, 0, 0.6470588, 1, 1,
0.1977805, 0.9298492, 0.640257, 0, 0.6392157, 1, 1,
0.2010544, -0.5484521, 1.910444, 0, 0.6352941, 1, 1,
0.2029373, -1.459718, 3.154467, 0, 0.627451, 1, 1,
0.2052144, 0.222036, 1.033563, 0, 0.6235294, 1, 1,
0.2063834, 1.604304, -0.1480128, 0, 0.6156863, 1, 1,
0.2064553, -0.7738149, 3.113646, 0, 0.6117647, 1, 1,
0.2094878, -1.6702, 3.874496, 0, 0.6039216, 1, 1,
0.2098481, 0.5579877, -1.459057, 0, 0.5960785, 1, 1,
0.2108422, 1.52783, 1.001035, 0, 0.5921569, 1, 1,
0.2109254, 0.7777673, -0.8632903, 0, 0.5843138, 1, 1,
0.2122802, 0.4414603, -1.497553, 0, 0.5803922, 1, 1,
0.2123068, 2.667652, 1.237454, 0, 0.572549, 1, 1,
0.2248256, -0.6727435, 2.084977, 0, 0.5686275, 1, 1,
0.2287786, 1.475675, 0.8032528, 0, 0.5607843, 1, 1,
0.2300438, -1.677872, 5.063231, 0, 0.5568628, 1, 1,
0.2310686, -2.597758, 2.251722, 0, 0.5490196, 1, 1,
0.2324508, 1.523621, -1.325987, 0, 0.5450981, 1, 1,
0.2353426, 0.0391304, 1.634672, 0, 0.5372549, 1, 1,
0.2357381, 0.5624837, 0.1500077, 0, 0.5333334, 1, 1,
0.2452815, 0.3694443, 1.217814, 0, 0.5254902, 1, 1,
0.2477556, -0.1270379, 3.514119, 0, 0.5215687, 1, 1,
0.2491381, -0.3873346, 3.009818, 0, 0.5137255, 1, 1,
0.2513237, -0.2931168, 0.9369646, 0, 0.509804, 1, 1,
0.2530144, 0.629872, 0.2941822, 0, 0.5019608, 1, 1,
0.254108, 0.039332, 2.346781, 0, 0.4941176, 1, 1,
0.2550442, -0.3920244, 3.295869, 0, 0.4901961, 1, 1,
0.2592169, 0.2765193, 0.203052, 0, 0.4823529, 1, 1,
0.2600104, -0.1478845, 3.224882, 0, 0.4784314, 1, 1,
0.2655732, -1.622373, 4.349267, 0, 0.4705882, 1, 1,
0.2664497, -0.6611688, 2.312969, 0, 0.4666667, 1, 1,
0.2691441, -1.287036, 1.641623, 0, 0.4588235, 1, 1,
0.2699038, -1.008375, 3.771294, 0, 0.454902, 1, 1,
0.2780916, -0.357243, 3.40573, 0, 0.4470588, 1, 1,
0.2794474, -0.7333055, 2.1125, 0, 0.4431373, 1, 1,
0.2829815, 0.5187224, -0.1117194, 0, 0.4352941, 1, 1,
0.2887424, -0.01526004, 2.736836, 0, 0.4313726, 1, 1,
0.289618, 1.39065, 0.4196074, 0, 0.4235294, 1, 1,
0.3002897, -0.04641599, -0.9119548, 0, 0.4196078, 1, 1,
0.3003058, -1.177166, 2.936658, 0, 0.4117647, 1, 1,
0.3037317, 0.2653554, 1.000202, 0, 0.4078431, 1, 1,
0.3047356, 1.336024, -0.7098946, 0, 0.4, 1, 1,
0.3052047, -1.144518, 1.576692, 0, 0.3921569, 1, 1,
0.3072133, -0.2792991, 3.980628, 0, 0.3882353, 1, 1,
0.3086745, 1.643244, 0.343688, 0, 0.3803922, 1, 1,
0.3102813, 2.492402, 0.3266205, 0, 0.3764706, 1, 1,
0.315983, -1.382958, 2.92715, 0, 0.3686275, 1, 1,
0.3187233, -1.427855, 3.747684, 0, 0.3647059, 1, 1,
0.3233208, -0.03624868, 2.092258, 0, 0.3568628, 1, 1,
0.3234011, -0.1479079, 2.188997, 0, 0.3529412, 1, 1,
0.3272829, 0.5135321, 0.5189254, 0, 0.345098, 1, 1,
0.3303467, -0.1185047, 1.864311, 0, 0.3411765, 1, 1,
0.3321386, 0.07175466, 0.7403634, 0, 0.3333333, 1, 1,
0.3358083, -1.614843, 4.339521, 0, 0.3294118, 1, 1,
0.3370805, 0.4738739, -0.2145479, 0, 0.3215686, 1, 1,
0.3387798, 1.143096, -0.4375475, 0, 0.3176471, 1, 1,
0.3395981, -0.1648678, 2.246354, 0, 0.3098039, 1, 1,
0.3417484, -0.02997524, 3.790411, 0, 0.3058824, 1, 1,
0.3428937, 0.2121587, -0.5594928, 0, 0.2980392, 1, 1,
0.3432436, 0.4832084, 1.624664, 0, 0.2901961, 1, 1,
0.3446561, 0.9057945, 0.8547894, 0, 0.2862745, 1, 1,
0.3450153, 1.387596, 1.70547, 0, 0.2784314, 1, 1,
0.3484935, -0.2683369, 1.953851, 0, 0.2745098, 1, 1,
0.3489119, 0.7595448, -0.00188316, 0, 0.2666667, 1, 1,
0.352743, -0.1629281, 1.831101, 0, 0.2627451, 1, 1,
0.3540633, -0.1885701, 1.281465, 0, 0.254902, 1, 1,
0.3651709, 1.018544, -1.581166, 0, 0.2509804, 1, 1,
0.3661161, -0.06775035, 3.46454, 0, 0.2431373, 1, 1,
0.3670252, 1.607857, -0.2024451, 0, 0.2392157, 1, 1,
0.3696392, 0.09533897, 1.286487, 0, 0.2313726, 1, 1,
0.3698813, 0.843634, 1.598177, 0, 0.227451, 1, 1,
0.3704649, 0.3903145, 0.8264502, 0, 0.2196078, 1, 1,
0.3706971, 0.8697163, 0.2519018, 0, 0.2156863, 1, 1,
0.3738686, -0.09909445, 1.851482, 0, 0.2078431, 1, 1,
0.3783941, 1.225306, -0.05387646, 0, 0.2039216, 1, 1,
0.3817483, -1.400787, 2.654693, 0, 0.1960784, 1, 1,
0.3827691, -0.4114475, 1.689377, 0, 0.1882353, 1, 1,
0.385315, 0.482477, 2.104885, 0, 0.1843137, 1, 1,
0.3857201, -0.3672155, 3.357717, 0, 0.1764706, 1, 1,
0.3861342, -1.183872, 2.190609, 0, 0.172549, 1, 1,
0.3868411, 0.4975972, 1.140967, 0, 0.1647059, 1, 1,
0.3876119, 0.5576856, -0.670099, 0, 0.1607843, 1, 1,
0.3922725, 1.247337, 0.4559334, 0, 0.1529412, 1, 1,
0.392602, 1.11276, 1.181651, 0, 0.1490196, 1, 1,
0.3929559, -0.422145, 2.593925, 0, 0.1411765, 1, 1,
0.3961557, -0.2314081, 3.139697, 0, 0.1372549, 1, 1,
0.3979892, 0.753862, -0.9533439, 0, 0.1294118, 1, 1,
0.400754, 1.886412, 1.022743, 0, 0.1254902, 1, 1,
0.4055637, 0.9169462, 0.1590589, 0, 0.1176471, 1, 1,
0.4110482, 1.718773, 0.4357137, 0, 0.1137255, 1, 1,
0.4114432, -0.07965698, 3.778346, 0, 0.1058824, 1, 1,
0.4142158, -0.8745959, 2.254386, 0, 0.09803922, 1, 1,
0.4148714, 0.131378, -0.7712774, 0, 0.09411765, 1, 1,
0.4174007, 1.528284, 1.195847, 0, 0.08627451, 1, 1,
0.4259338, 0.2451423, 1.076692, 0, 0.08235294, 1, 1,
0.4330394, 1.085835, 0.5529094, 0, 0.07450981, 1, 1,
0.4357545, -0.3795881, 2.812328, 0, 0.07058824, 1, 1,
0.4362856, -0.5116923, 2.676835, 0, 0.0627451, 1, 1,
0.4399137, 1.60859, 0.6527109, 0, 0.05882353, 1, 1,
0.4404044, -0.07340438, 1.634337, 0, 0.05098039, 1, 1,
0.4410997, 0.02493969, 0.7237579, 0, 0.04705882, 1, 1,
0.4427108, 0.2303558, 0.772551, 0, 0.03921569, 1, 1,
0.4450952, -1.785339, 3.620668, 0, 0.03529412, 1, 1,
0.4507471, -1.098315, 2.210622, 0, 0.02745098, 1, 1,
0.452943, -0.3783751, 2.583011, 0, 0.02352941, 1, 1,
0.4533553, 0.06866311, 0.3916419, 0, 0.01568628, 1, 1,
0.4544105, -0.9761811, 4.225409, 0, 0.01176471, 1, 1,
0.4611145, -0.2642227, 4.390917, 0, 0.003921569, 1, 1,
0.4643456, -0.6741464, 0.9900924, 0.003921569, 0, 1, 1,
0.4645365, 0.9775084, -0.6437833, 0.007843138, 0, 1, 1,
0.4646714, -0.03430784, 1.142409, 0.01568628, 0, 1, 1,
0.4714301, 0.3325078, 3.192136, 0.01960784, 0, 1, 1,
0.4727221, 1.0335, 1.532636, 0.02745098, 0, 1, 1,
0.4786164, -0.7231537, 0.3249951, 0.03137255, 0, 1, 1,
0.4845136, -1.33138, 3.313792, 0.03921569, 0, 1, 1,
0.4850519, 0.6587639, 0.2993999, 0.04313726, 0, 1, 1,
0.4852588, 0.7326308, 0.2518982, 0.05098039, 0, 1, 1,
0.4870723, -0.8999802, 2.307066, 0.05490196, 0, 1, 1,
0.4894103, -0.2941626, 0.6585694, 0.0627451, 0, 1, 1,
0.50119, 0.0441955, 2.491248, 0.06666667, 0, 1, 1,
0.5036179, -0.8818036, 3.224396, 0.07450981, 0, 1, 1,
0.5048681, 0.1042372, 2.214894, 0.07843138, 0, 1, 1,
0.5087336, -0.6756151, 2.517955, 0.08627451, 0, 1, 1,
0.5254927, 0.2626217, -0.08089491, 0.09019608, 0, 1, 1,
0.5330745, -1.052384, 2.351942, 0.09803922, 0, 1, 1,
0.5336709, -0.8932599, 4.057289, 0.1058824, 0, 1, 1,
0.5338936, 1.009532, -1.012825, 0.1098039, 0, 1, 1,
0.5349758, -1.12138, 4.175375, 0.1176471, 0, 1, 1,
0.5357202, 0.1583365, 0.2382115, 0.1215686, 0, 1, 1,
0.5357471, -0.2566519, 3.433437, 0.1294118, 0, 1, 1,
0.5359579, -0.1326663, 1.702294, 0.1333333, 0, 1, 1,
0.5404925, -0.565348, 1.599542, 0.1411765, 0, 1, 1,
0.5407631, 0.1514469, 1.045154, 0.145098, 0, 1, 1,
0.5475729, 0.7158428, 0.9196677, 0.1529412, 0, 1, 1,
0.5496194, 1.432608, 2.241943, 0.1568628, 0, 1, 1,
0.5511574, -2.020614, 2.698942, 0.1647059, 0, 1, 1,
0.5519299, 0.3328345, -0.1227417, 0.1686275, 0, 1, 1,
0.5571247, -0.08849075, 1.446637, 0.1764706, 0, 1, 1,
0.5572333, 0.01868757, 2.535534, 0.1803922, 0, 1, 1,
0.5598885, 0.07630518, 1.818547, 0.1882353, 0, 1, 1,
0.5671659, 1.302074, 0.4795431, 0.1921569, 0, 1, 1,
0.574625, 1.018557, 0.6445754, 0.2, 0, 1, 1,
0.5755805, -1.494415, 2.504919, 0.2078431, 0, 1, 1,
0.5768462, 1.494182, 1.286612, 0.2117647, 0, 1, 1,
0.5799959, 0.06299064, 1.67134, 0.2196078, 0, 1, 1,
0.5807413, -0.7222075, 2.340723, 0.2235294, 0, 1, 1,
0.5812351, 0.601721, 1.601651, 0.2313726, 0, 1, 1,
0.5834192, 1.161166, 0.7653855, 0.2352941, 0, 1, 1,
0.5875222, -0.1414515, 1.994174, 0.2431373, 0, 1, 1,
0.5886624, 0.3275932, 2.217846, 0.2470588, 0, 1, 1,
0.5909508, -1.139004, 2.362481, 0.254902, 0, 1, 1,
0.5921956, -1.076655, 2.481829, 0.2588235, 0, 1, 1,
0.5954959, -0.7658101, 4.020304, 0.2666667, 0, 1, 1,
0.5999097, 1.621555, -0.3737191, 0.2705882, 0, 1, 1,
0.6072556, 2.040954, -0.2040807, 0.2784314, 0, 1, 1,
0.6072679, 0.510958, 2.206239, 0.282353, 0, 1, 1,
0.6105186, 0.7036695, 2.458143, 0.2901961, 0, 1, 1,
0.6111857, -0.9927362, 2.792732, 0.2941177, 0, 1, 1,
0.6143727, 0.4986828, 1.497683, 0.3019608, 0, 1, 1,
0.6146101, 0.8459615, 0.279471, 0.3098039, 0, 1, 1,
0.6229912, -2.867349, 3.784651, 0.3137255, 0, 1, 1,
0.6236731, 0.1915216, 0.2660252, 0.3215686, 0, 1, 1,
0.6312102, -0.3043693, 2.611356, 0.3254902, 0, 1, 1,
0.6436288, -0.7274222, 4.165918, 0.3333333, 0, 1, 1,
0.6462983, 0.08279718, 2.482233, 0.3372549, 0, 1, 1,
0.6505081, -0.8919728, 2.825554, 0.345098, 0, 1, 1,
0.6509973, 0.769334, 0.9697464, 0.3490196, 0, 1, 1,
0.651574, 0.6142278, 1.197047, 0.3568628, 0, 1, 1,
0.6578749, -0.632112, 2.933907, 0.3607843, 0, 1, 1,
0.6636384, 0.7587851, -0.1337117, 0.3686275, 0, 1, 1,
0.6787337, -0.2445738, 2.317373, 0.372549, 0, 1, 1,
0.6856719, 1.432415, 0.6781715, 0.3803922, 0, 1, 1,
0.6897064, -0.4690144, 3.988999, 0.3843137, 0, 1, 1,
0.6924456, 0.6056339, 0.57803, 0.3921569, 0, 1, 1,
0.6943452, -0.217369, -0.4070528, 0.3960784, 0, 1, 1,
0.6959884, -0.2905758, 0.3711684, 0.4039216, 0, 1, 1,
0.6969684, 0.8097056, 3.277582, 0.4117647, 0, 1, 1,
0.6994393, 0.642428, 1.656358, 0.4156863, 0, 1, 1,
0.7010798, 1.374686, 1.491452, 0.4235294, 0, 1, 1,
0.7014611, 0.1075649, 1.684578, 0.427451, 0, 1, 1,
0.7020285, -0.09693982, 2.785271, 0.4352941, 0, 1, 1,
0.7039542, 0.4458876, 1.133326, 0.4392157, 0, 1, 1,
0.7076975, 0.4601851, 0.4286582, 0.4470588, 0, 1, 1,
0.7141715, -0.3604314, 1.864209, 0.4509804, 0, 1, 1,
0.7189746, -0.4236147, 1.988976, 0.4588235, 0, 1, 1,
0.7226171, -0.4595297, 3.402133, 0.4627451, 0, 1, 1,
0.7252722, -1.09354, 3.386628, 0.4705882, 0, 1, 1,
0.7285515, 1.147639, 0.1999197, 0.4745098, 0, 1, 1,
0.7336874, -0.7206646, 1.980195, 0.4823529, 0, 1, 1,
0.7353989, -0.09410438, 2.043525, 0.4862745, 0, 1, 1,
0.7399153, -0.09802067, 2.738117, 0.4941176, 0, 1, 1,
0.7399979, -0.02201636, 1.576412, 0.5019608, 0, 1, 1,
0.7410017, 1.619295, 0.3981972, 0.5058824, 0, 1, 1,
0.7446471, 0.7628764, -0.2492925, 0.5137255, 0, 1, 1,
0.7484313, -0.4238583, 2.68263, 0.5176471, 0, 1, 1,
0.7575941, 2.481735, -1.300576, 0.5254902, 0, 1, 1,
0.7610003, -1.127634, 3.625388, 0.5294118, 0, 1, 1,
0.761151, 0.2070186, 0.700403, 0.5372549, 0, 1, 1,
0.7648433, 0.5540364, 0.7803093, 0.5411765, 0, 1, 1,
0.7702692, -0.5731165, 2.224728, 0.5490196, 0, 1, 1,
0.7712439, 0.1232418, -1.15934, 0.5529412, 0, 1, 1,
0.7758104, 0.1102623, 1.798983, 0.5607843, 0, 1, 1,
0.7813601, 1.562323, 0.2608411, 0.5647059, 0, 1, 1,
0.7829373, -1.139307, 2.665393, 0.572549, 0, 1, 1,
0.7915161, 2.796532, 0.883604, 0.5764706, 0, 1, 1,
0.793011, 0.267963, 2.97463, 0.5843138, 0, 1, 1,
0.7939567, -1.000097, 1.404885, 0.5882353, 0, 1, 1,
0.7976661, 0.9522054, 2.497236, 0.5960785, 0, 1, 1,
0.806327, 0.336568, 2.988671, 0.6039216, 0, 1, 1,
0.8096956, 1.189722, 0.7213904, 0.6078432, 0, 1, 1,
0.8266458, -0.07980385, 1.361887, 0.6156863, 0, 1, 1,
0.8308985, 0.388679, 2.355646, 0.6196079, 0, 1, 1,
0.8337371, 1.349711, 0.1143222, 0.627451, 0, 1, 1,
0.8351358, 1.567121, 0.2970462, 0.6313726, 0, 1, 1,
0.847107, 0.006667949, 2.026242, 0.6392157, 0, 1, 1,
0.8483336, -0.1445495, 1.177189, 0.6431373, 0, 1, 1,
0.8557717, 0.7617443, 1.221241, 0.6509804, 0, 1, 1,
0.8577994, 2.732606, -0.4007872, 0.654902, 0, 1, 1,
0.8598043, 0.9662862, 0.1695733, 0.6627451, 0, 1, 1,
0.8646431, 0.3878981, 1.75843, 0.6666667, 0, 1, 1,
0.8668272, -0.3090176, 2.770497, 0.6745098, 0, 1, 1,
0.866843, 0.9297448, 0.08473277, 0.6784314, 0, 1, 1,
0.8678076, 2.450719, -0.347565, 0.6862745, 0, 1, 1,
0.8745839, 1.890248, -0.6291208, 0.6901961, 0, 1, 1,
0.8801265, -0.4464854, 2.269038, 0.6980392, 0, 1, 1,
0.8801735, 0.1653553, 0.3819384, 0.7058824, 0, 1, 1,
0.8804317, 0.3398461, 1.393799, 0.7098039, 0, 1, 1,
0.882071, -1.38951, 2.366057, 0.7176471, 0, 1, 1,
0.8825871, 1.036827, 0.4514261, 0.7215686, 0, 1, 1,
0.8827135, -0.6750371, 0.6865309, 0.7294118, 0, 1, 1,
0.8834135, 0.300807, -0.3456575, 0.7333333, 0, 1, 1,
0.8850347, -0.8668802, 4.309432, 0.7411765, 0, 1, 1,
0.8879268, -1.033797, 2.479272, 0.7450981, 0, 1, 1,
0.8890461, 0.03445742, 2.955208, 0.7529412, 0, 1, 1,
0.894107, -0.9627569, 3.116816, 0.7568628, 0, 1, 1,
0.8943324, 0.4811422, 0.6032593, 0.7647059, 0, 1, 1,
0.8948721, -0.7522086, 2.750095, 0.7686275, 0, 1, 1,
0.8952603, 0.02448773, -0.5442646, 0.7764706, 0, 1, 1,
0.8958362, 0.9777821, 0.4046963, 0.7803922, 0, 1, 1,
0.898867, 0.697056, 0.8392824, 0.7882353, 0, 1, 1,
0.8997234, -0.0755097, 0.945695, 0.7921569, 0, 1, 1,
0.9028812, -0.9428422, 1.648244, 0.8, 0, 1, 1,
0.9055557, 1.887493, 0.404705, 0.8078431, 0, 1, 1,
0.9122645, 0.04750077, 0.728589, 0.8117647, 0, 1, 1,
0.92977, 0.8664608, 0.4488764, 0.8196079, 0, 1, 1,
0.9308307, -0.4499499, 4.526354, 0.8235294, 0, 1, 1,
0.936784, -0.5752588, 1.944986, 0.8313726, 0, 1, 1,
0.9576777, -1.727056, 2.688184, 0.8352941, 0, 1, 1,
0.958191, 1.276003, 1.419868, 0.8431373, 0, 1, 1,
0.9618778, -0.7505618, 3.645447, 0.8470588, 0, 1, 1,
0.9684355, 0.08571125, 0.5491757, 0.854902, 0, 1, 1,
0.9738796, -0.04377186, 1.418753, 0.8588235, 0, 1, 1,
0.9748558, 0.7207746, -0.1373069, 0.8666667, 0, 1, 1,
0.9784938, -0.8449625, 1.330217, 0.8705882, 0, 1, 1,
0.9809023, -0.1811127, 1.619395, 0.8784314, 0, 1, 1,
0.982951, -0.6143998, 1.83798, 0.8823529, 0, 1, 1,
0.9848446, 0.1441082, 2.708452, 0.8901961, 0, 1, 1,
0.9968199, -0.5300614, 1.948767, 0.8941177, 0, 1, 1,
0.9994134, -1.052313, 0.3013834, 0.9019608, 0, 1, 1,
1.001909, -0.6188107, 1.312391, 0.9098039, 0, 1, 1,
1.009082, 1.476105, -0.2418194, 0.9137255, 0, 1, 1,
1.014585, 0.262787, 0.5511492, 0.9215686, 0, 1, 1,
1.014678, 2.273948, 0.6925758, 0.9254902, 0, 1, 1,
1.020965, -0.9604877, 3.429411, 0.9333333, 0, 1, 1,
1.023224, 0.2060921, 2.230017, 0.9372549, 0, 1, 1,
1.028498, 0.197894, 0.899482, 0.945098, 0, 1, 1,
1.028676, 0.299554, 1.497955, 0.9490196, 0, 1, 1,
1.040034, 0.3657223, 1.461476, 0.9568627, 0, 1, 1,
1.050881, -0.5840914, 1.585931, 0.9607843, 0, 1, 1,
1.052135, 1.954099, 0.459237, 0.9686275, 0, 1, 1,
1.052234, -1.766476, 3.082288, 0.972549, 0, 1, 1,
1.054709, 0.2298194, 1.335055, 0.9803922, 0, 1, 1,
1.056791, 1.083567, -1.270764, 0.9843137, 0, 1, 1,
1.059034, 0.2170452, 2.443197, 0.9921569, 0, 1, 1,
1.062098, 0.633412, 2.372638, 0.9960784, 0, 1, 1,
1.066404, 0.9347686, 2.657127, 1, 0, 0.9960784, 1,
1.067039, -0.5796734, 0.7473921, 1, 0, 0.9882353, 1,
1.067626, 0.06611692, 0.9450976, 1, 0, 0.9843137, 1,
1.072611, 1.975011, 1.624869, 1, 0, 0.9764706, 1,
1.07635, 1.594213, -0.1638579, 1, 0, 0.972549, 1,
1.077849, 0.1198648, 1.245552, 1, 0, 0.9647059, 1,
1.090075, 0.11509, 1.274998, 1, 0, 0.9607843, 1,
1.091557, 0.1640015, 1.225719, 1, 0, 0.9529412, 1,
1.094674, -0.2746987, 1.795232, 1, 0, 0.9490196, 1,
1.099284, 0.4553249, 1.029077, 1, 0, 0.9411765, 1,
1.100524, 0.5266222, 1.246022, 1, 0, 0.9372549, 1,
1.104131, 3.373884, 1.450979, 1, 0, 0.9294118, 1,
1.108642, -0.2466712, 2.50499, 1, 0, 0.9254902, 1,
1.108778, 0.2590288, 1.182823, 1, 0, 0.9176471, 1,
1.113076, 0.1854431, 1.749522, 1, 0, 0.9137255, 1,
1.114092, -0.745617, 2.734182, 1, 0, 0.9058824, 1,
1.124589, 0.1340561, 2.728978, 1, 0, 0.9019608, 1,
1.126914, 0.2846306, 2.636891, 1, 0, 0.8941177, 1,
1.131863, -2.48392, 2.878751, 1, 0, 0.8862745, 1,
1.138924, -0.3032511, 1.800115, 1, 0, 0.8823529, 1,
1.150396, 0.06888549, 1.871182, 1, 0, 0.8745098, 1,
1.166596, -0.3523196, 1.014813, 1, 0, 0.8705882, 1,
1.167415, 0.3427891, 1.406845, 1, 0, 0.8627451, 1,
1.168188, -0.8956844, 1.884321, 1, 0, 0.8588235, 1,
1.170473, -0.1121604, 0.8971491, 1, 0, 0.8509804, 1,
1.171176, -0.2212889, 1.696211, 1, 0, 0.8470588, 1,
1.17578, -0.2344286, 0.6750987, 1, 0, 0.8392157, 1,
1.193318, -0.26846, 1.149902, 1, 0, 0.8352941, 1,
1.193628, 0.6192163, 2.387151, 1, 0, 0.827451, 1,
1.193833, -0.6934976, 2.052117, 1, 0, 0.8235294, 1,
1.197983, -0.07186323, 0.4682584, 1, 0, 0.8156863, 1,
1.202016, -0.1215654, 0.6422858, 1, 0, 0.8117647, 1,
1.205372, 0.003896257, 0.5997601, 1, 0, 0.8039216, 1,
1.226385, 0.1279299, 1.974257, 1, 0, 0.7960784, 1,
1.228717, -1.033107, 2.810691, 1, 0, 0.7921569, 1,
1.231958, -1.412419, 2.926782, 1, 0, 0.7843137, 1,
1.232292, -0.4766893, 1.08216, 1, 0, 0.7803922, 1,
1.23278, 0.4414836, 1.134042, 1, 0, 0.772549, 1,
1.242938, 1.041642, -0.9150226, 1, 0, 0.7686275, 1,
1.247608, -1.264146, 3.553181, 1, 0, 0.7607843, 1,
1.247709, -0.3622527, -0.1856739, 1, 0, 0.7568628, 1,
1.251215, 0.7682354, 2.314941, 1, 0, 0.7490196, 1,
1.255137, -0.005278504, 2.01342, 1, 0, 0.7450981, 1,
1.255787, 0.2850099, 1.461685, 1, 0, 0.7372549, 1,
1.256619, -1.155848, 3.626981, 1, 0, 0.7333333, 1,
1.257219, -0.403677, 3.255835, 1, 0, 0.7254902, 1,
1.261065, 0.915877, -1.194505, 1, 0, 0.7215686, 1,
1.27917, -0.8146667, 1.221976, 1, 0, 0.7137255, 1,
1.28409, -1.244913, 3.165206, 1, 0, 0.7098039, 1,
1.284285, -0.6885294, 1.5311, 1, 0, 0.7019608, 1,
1.293173, 0.6106071, 0.7381049, 1, 0, 0.6941177, 1,
1.29328, 0.1943226, 1.333108, 1, 0, 0.6901961, 1,
1.300245, -0.4582742, 2.80789, 1, 0, 0.682353, 1,
1.302477, 1.015018, 1.392153, 1, 0, 0.6784314, 1,
1.30307, -0.8572428, 0.6266818, 1, 0, 0.6705883, 1,
1.310637, 1.227457, 3.245847, 1, 0, 0.6666667, 1,
1.312266, -0.6487637, 2.227952, 1, 0, 0.6588235, 1,
1.315792, -0.218993, 2.131838, 1, 0, 0.654902, 1,
1.324442, 0.2496344, 0.3994035, 1, 0, 0.6470588, 1,
1.334494, -1.525797, 2.927106, 1, 0, 0.6431373, 1,
1.336753, 0.1122583, 0.3376564, 1, 0, 0.6352941, 1,
1.342991, -1.452488, 3.095597, 1, 0, 0.6313726, 1,
1.362177, 1.174317, 0.8977159, 1, 0, 0.6235294, 1,
1.367032, 0.7482913, 1.769215, 1, 0, 0.6196079, 1,
1.370823, 0.9324129, 1.926414, 1, 0, 0.6117647, 1,
1.372701, -0.4398265, -0.1337554, 1, 0, 0.6078432, 1,
1.387977, -1.214671, 0.7297854, 1, 0, 0.6, 1,
1.392467, -0.01495375, 3.220499, 1, 0, 0.5921569, 1,
1.394538, 0.1221521, -0.7949495, 1, 0, 0.5882353, 1,
1.411602, -0.5972008, 2.487202, 1, 0, 0.5803922, 1,
1.417795, 0.6417328, 1.658042, 1, 0, 0.5764706, 1,
1.43472, 1.682658, 0.08676108, 1, 0, 0.5686275, 1,
1.449111, -0.6284978, 2.092982, 1, 0, 0.5647059, 1,
1.456432, 0.2045993, 0.725934, 1, 0, 0.5568628, 1,
1.456457, -0.7745628, 0.7430091, 1, 0, 0.5529412, 1,
1.465214, -0.4753131, 2.234691, 1, 0, 0.5450981, 1,
1.467603, -1.331768, 1.588528, 1, 0, 0.5411765, 1,
1.475256, 1.420517, 1.454982, 1, 0, 0.5333334, 1,
1.476077, -0.970489, 1.632609, 1, 0, 0.5294118, 1,
1.480232, -1.812034, 1.663629, 1, 0, 0.5215687, 1,
1.48311, -0.5813102, 2.005719, 1, 0, 0.5176471, 1,
1.496726, 1.749891, 0.9463732, 1, 0, 0.509804, 1,
1.500959, 0.3290709, 0.6619392, 1, 0, 0.5058824, 1,
1.516939, 0.005472454, 0.2868983, 1, 0, 0.4980392, 1,
1.518812, 0.3084666, -0.1260598, 1, 0, 0.4901961, 1,
1.524574, 1.766117, 1.411799, 1, 0, 0.4862745, 1,
1.526058, 0.8097081, 1.354597, 1, 0, 0.4784314, 1,
1.526079, -1.036567, 2.700751, 1, 0, 0.4745098, 1,
1.544163, 0.9676309, 2.302469, 1, 0, 0.4666667, 1,
1.556935, -0.1495061, 0.3566074, 1, 0, 0.4627451, 1,
1.567904, 1.082943, 2.041619, 1, 0, 0.454902, 1,
1.585698, -0.3049556, -0.655074, 1, 0, 0.4509804, 1,
1.587798, -1.282434, 2.193704, 1, 0, 0.4431373, 1,
1.58816, 1.976557, 0.3351591, 1, 0, 0.4392157, 1,
1.591732, -0.475301, 2.638937, 1, 0, 0.4313726, 1,
1.595439, 2.741203, -0.1806753, 1, 0, 0.427451, 1,
1.605206, -0.01803707, 2.131896, 1, 0, 0.4196078, 1,
1.615816, 0.8190972, 1.681587, 1, 0, 0.4156863, 1,
1.623816, -1.577205, 2.340584, 1, 0, 0.4078431, 1,
1.625688, 0.7005766, 0.9781557, 1, 0, 0.4039216, 1,
1.646286, 1.119524, -0.2782274, 1, 0, 0.3960784, 1,
1.651094, 0.01054482, 2.313142, 1, 0, 0.3882353, 1,
1.654703, 0.07034121, 1.144591, 1, 0, 0.3843137, 1,
1.658494, 2.312816, 0.9149315, 1, 0, 0.3764706, 1,
1.660178, 1.048584, 1.313919, 1, 0, 0.372549, 1,
1.66735, -1.289664, 1.879104, 1, 0, 0.3647059, 1,
1.67231, -0.04283021, 0.9876308, 1, 0, 0.3607843, 1,
1.672426, 0.01224604, 1.045474, 1, 0, 0.3529412, 1,
1.67532, -0.2311491, 1.565163, 1, 0, 0.3490196, 1,
1.682232, -1.800868, 3.224214, 1, 0, 0.3411765, 1,
1.688875, -0.7469448, 1.466016, 1, 0, 0.3372549, 1,
1.701903, -0.6670454, 1.950243, 1, 0, 0.3294118, 1,
1.703251, 1.138499, 0.4415155, 1, 0, 0.3254902, 1,
1.715797, -0.8816829, 1.820106, 1, 0, 0.3176471, 1,
1.723297, -1.493462, 0.5427856, 1, 0, 0.3137255, 1,
1.731084, -0.1058475, 2.463116, 1, 0, 0.3058824, 1,
1.759221, -0.3722169, 2.097274, 1, 0, 0.2980392, 1,
1.770678, 0.9843987, 0.1524871, 1, 0, 0.2941177, 1,
1.773702, 0.4419257, 2.418214, 1, 0, 0.2862745, 1,
1.776034, -0.3945786, 3.014549, 1, 0, 0.282353, 1,
1.77834, -1.266646, 0.8875643, 1, 0, 0.2745098, 1,
1.781756, -0.7702799, 1.253225, 1, 0, 0.2705882, 1,
1.787163, -0.2575003, 1.475501, 1, 0, 0.2627451, 1,
1.833762, 1.326219, 0.03469002, 1, 0, 0.2588235, 1,
1.834888, -0.9039513, 3.527771, 1, 0, 0.2509804, 1,
1.868941, -0.2988265, 1.849265, 1, 0, 0.2470588, 1,
1.871743, 1.390295, 0.2430761, 1, 0, 0.2392157, 1,
1.876872, -0.1091172, 2.102068, 1, 0, 0.2352941, 1,
1.907248, 0.1975684, 0.9091713, 1, 0, 0.227451, 1,
1.917194, -0.9884238, 0.7712157, 1, 0, 0.2235294, 1,
1.93514, 1.603759, 0.6251157, 1, 0, 0.2156863, 1,
1.938725, 0.119219, 1.015352, 1, 0, 0.2117647, 1,
1.956081, 0.2452933, 1.438824, 1, 0, 0.2039216, 1,
1.969133, 0.9229763, 2.542077, 1, 0, 0.1960784, 1,
2.013945, 0.493669, 1.211188, 1, 0, 0.1921569, 1,
2.014875, 0.2213937, 2.704137, 1, 0, 0.1843137, 1,
2.017082, -0.9386159, 2.855128, 1, 0, 0.1803922, 1,
2.024002, 2.300675, 1.102168, 1, 0, 0.172549, 1,
2.107009, 1.010872, 1.427233, 1, 0, 0.1686275, 1,
2.132037, 1.178985, -0.1017031, 1, 0, 0.1607843, 1,
2.147633, -1.952816, 3.545389, 1, 0, 0.1568628, 1,
2.153171, 0.859054, 0.3655978, 1, 0, 0.1490196, 1,
2.160563, 0.5742373, 3.930803, 1, 0, 0.145098, 1,
2.182564, -0.4881429, 0.6359279, 1, 0, 0.1372549, 1,
2.202483, -2.29669, 2.326475, 1, 0, 0.1333333, 1,
2.217898, -0.04504975, 0.3378802, 1, 0, 0.1254902, 1,
2.22116, 0.0354358, 0.5782481, 1, 0, 0.1215686, 1,
2.277654, -0.04646467, -0.9295471, 1, 0, 0.1137255, 1,
2.341262, 1.168832, -1.398381, 1, 0, 0.1098039, 1,
2.361092, -0.374584, 2.26136, 1, 0, 0.1019608, 1,
2.399726, 0.8148964, 1.536318, 1, 0, 0.09411765, 1,
2.476438, 0.8354971, 1.155544, 1, 0, 0.09019608, 1,
2.476784, -1.280829, 2.500825, 1, 0, 0.08235294, 1,
2.484844, 0.1189241, 1.282573, 1, 0, 0.07843138, 1,
2.48638, -0.7120197, 3.539205, 1, 0, 0.07058824, 1,
2.493105, 0.06451603, 1.829998, 1, 0, 0.06666667, 1,
2.508064, 0.02142452, 2.619638, 1, 0, 0.05882353, 1,
2.531867, -1.002992, 3.389845, 1, 0, 0.05490196, 1,
2.581318, -0.8854555, 3.012027, 1, 0, 0.04705882, 1,
2.706873, -0.5563142, 1.714656, 1, 0, 0.04313726, 1,
2.760143, 0.4150876, 1.890904, 1, 0, 0.03529412, 1,
2.768785, 0.5632328, -0.2703164, 1, 0, 0.03137255, 1,
2.833063, -0.3102541, 3.103018, 1, 0, 0.02352941, 1,
3.144875, 1.667478, 2.242654, 1, 0, 0.01960784, 1,
3.536811, 1.272631, -0.7389388, 1, 0, 0.01176471, 1,
3.588777, 0.3046858, 1.112325, 1, 0, 0.007843138, 1
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
-0.1423547, -4.011451, -7.08254, 0, -0.5, 0.5, 0.5,
-0.1423547, -4.011451, -7.08254, 1, -0.5, 0.5, 0.5,
-0.1423547, -4.011451, -7.08254, 1, 1.5, 0.5, 0.5,
-0.1423547, -4.011451, -7.08254, 0, 1.5, 0.5, 0.5
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
-5.13834, 0.5075839, -7.08254, 0, -0.5, 0.5, 0.5,
-5.13834, 0.5075839, -7.08254, 1, -0.5, 0.5, 0.5,
-5.13834, 0.5075839, -7.08254, 1, 1.5, 0.5, 0.5,
-5.13834, 0.5075839, -7.08254, 0, 1.5, 0.5, 0.5
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
-5.13834, -4.011451, 0.276706, 0, -0.5, 0.5, 0.5,
-5.13834, -4.011451, 0.276706, 1, -0.5, 0.5, 0.5,
-5.13834, -4.011451, 0.276706, 1, 1.5, 0.5, 0.5,
-5.13834, -4.011451, 0.276706, 0, 1.5, 0.5, 0.5
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
-2, -2.968597, -5.384252,
2, -2.968597, -5.384252,
-2, -2.968597, -5.384252,
-2, -3.142406, -5.6673,
0, -2.968597, -5.384252,
0, -3.142406, -5.6673,
2, -2.968597, -5.384252,
2, -3.142406, -5.6673
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
-2, -3.490024, -6.233396, 0, -0.5, 0.5, 0.5,
-2, -3.490024, -6.233396, 1, -0.5, 0.5, 0.5,
-2, -3.490024, -6.233396, 1, 1.5, 0.5, 0.5,
-2, -3.490024, -6.233396, 0, 1.5, 0.5, 0.5,
0, -3.490024, -6.233396, 0, -0.5, 0.5, 0.5,
0, -3.490024, -6.233396, 1, -0.5, 0.5, 0.5,
0, -3.490024, -6.233396, 1, 1.5, 0.5, 0.5,
0, -3.490024, -6.233396, 0, 1.5, 0.5, 0.5,
2, -3.490024, -6.233396, 0, -0.5, 0.5, 0.5,
2, -3.490024, -6.233396, 1, -0.5, 0.5, 0.5,
2, -3.490024, -6.233396, 1, 1.5, 0.5, 0.5,
2, -3.490024, -6.233396, 0, 1.5, 0.5, 0.5
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
-3.98542, -2, -5.384252,
-3.98542, 3, -5.384252,
-3.98542, -2, -5.384252,
-4.177574, -2, -5.6673,
-3.98542, -1, -5.384252,
-4.177574, -1, -5.6673,
-3.98542, 0, -5.384252,
-4.177574, 0, -5.6673,
-3.98542, 1, -5.384252,
-4.177574, 1, -5.6673,
-3.98542, 2, -5.384252,
-4.177574, 2, -5.6673,
-3.98542, 3, -5.384252,
-4.177574, 3, -5.6673
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
-4.56188, -2, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, -2, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, -2, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, -2, -6.233396, 0, 1.5, 0.5, 0.5,
-4.56188, -1, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, -1, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, -1, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, -1, -6.233396, 0, 1.5, 0.5, 0.5,
-4.56188, 0, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, 0, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, 0, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, 0, -6.233396, 0, 1.5, 0.5, 0.5,
-4.56188, 1, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, 1, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, 1, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, 1, -6.233396, 0, 1.5, 0.5, 0.5,
-4.56188, 2, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, 2, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, 2, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, 2, -6.233396, 0, 1.5, 0.5, 0.5,
-4.56188, 3, -6.233396, 0, -0.5, 0.5, 0.5,
-4.56188, 3, -6.233396, 1, -0.5, 0.5, 0.5,
-4.56188, 3, -6.233396, 1, 1.5, 0.5, 0.5,
-4.56188, 3, -6.233396, 0, 1.5, 0.5, 0.5
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
-3.98542, -2.968597, -4,
-3.98542, -2.968597, 4,
-3.98542, -2.968597, -4,
-4.177574, -3.142406, -4,
-3.98542, -2.968597, -2,
-4.177574, -3.142406, -2,
-3.98542, -2.968597, 0,
-4.177574, -3.142406, 0,
-3.98542, -2.968597, 2,
-4.177574, -3.142406, 2,
-3.98542, -2.968597, 4,
-4.177574, -3.142406, 4
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
-4.56188, -3.490024, -4, 0, -0.5, 0.5, 0.5,
-4.56188, -3.490024, -4, 1, -0.5, 0.5, 0.5,
-4.56188, -3.490024, -4, 1, 1.5, 0.5, 0.5,
-4.56188, -3.490024, -4, 0, 1.5, 0.5, 0.5,
-4.56188, -3.490024, -2, 0, -0.5, 0.5, 0.5,
-4.56188, -3.490024, -2, 1, -0.5, 0.5, 0.5,
-4.56188, -3.490024, -2, 1, 1.5, 0.5, 0.5,
-4.56188, -3.490024, -2, 0, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 0, 0, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 0, 1, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 0, 1, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 0, 0, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 2, 0, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 2, 1, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 2, 1, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 2, 0, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 4, 0, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 4, 1, -0.5, 0.5, 0.5,
-4.56188, -3.490024, 4, 1, 1.5, 0.5, 0.5,
-4.56188, -3.490024, 4, 0, 1.5, 0.5, 0.5
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
-3.98542, -2.968597, -5.384252,
-3.98542, 3.983764, -5.384252,
-3.98542, -2.968597, 5.937664,
-3.98542, 3.983764, 5.937664,
-3.98542, -2.968597, -5.384252,
-3.98542, -2.968597, 5.937664,
-3.98542, 3.983764, -5.384252,
-3.98542, 3.983764, 5.937664,
-3.98542, -2.968597, -5.384252,
3.700711, -2.968597, -5.384252,
-3.98542, -2.968597, 5.937664,
3.700711, -2.968597, 5.937664,
-3.98542, 3.983764, -5.384252,
3.700711, 3.983764, -5.384252,
-3.98542, 3.983764, 5.937664,
3.700711, 3.983764, 5.937664,
3.700711, -2.968597, -5.384252,
3.700711, 3.983764, -5.384252,
3.700711, -2.968597, 5.937664,
3.700711, 3.983764, 5.937664,
3.700711, -2.968597, -5.384252,
3.700711, -2.968597, 5.937664,
3.700711, 3.983764, -5.384252,
3.700711, 3.983764, 5.937664
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
var radius = 8.196171;
var distance = 36.46569;
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
mvMatrix.translate( 0.1423547, -0.5075839, -0.276706 );
mvMatrix.scale( 1.152968, 1.274655, 0.7827174 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.46569);
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
Asulam<-read.table("Asulam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Asulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'Asulam' not found
```

```r
y<-Asulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'Asulam' not found
```

```r
z<-Asulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'Asulam' not found
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
-3.873487, 0.3629505, -1.976492, 0, 0, 1, 1, 1,
-3.013448, 0.6541579, 0.3314914, 1, 0, 0, 1, 1,
-2.933215, -0.6846226, -1.35878, 1, 0, 0, 1, 1,
-2.852106, -0.5200624, -1.257796, 1, 0, 0, 1, 1,
-2.792296, -0.6003081, -2.119283, 1, 0, 0, 1, 1,
-2.777014, -0.8062817, -4.2766, 1, 0, 0, 1, 1,
-2.598475, -2.303689, -1.90587, 0, 0, 0, 1, 1,
-2.465274, 0.9350966, -1.447956, 0, 0, 0, 1, 1,
-2.280409, -0.02304684, -1.124178, 0, 0, 0, 1, 1,
-2.254067, -0.3768543, -2.023729, 0, 0, 0, 1, 1,
-2.184968, -0.9546382, -0.5280755, 0, 0, 0, 1, 1,
-2.12231, 0.3414123, -1.78024, 0, 0, 0, 1, 1,
-2.116588, -2.085221, -2.18507, 0, 0, 0, 1, 1,
-2.107644, 0.3448303, -1.314636, 1, 1, 1, 1, 1,
-2.081836, 0.1209229, -1.526792, 1, 1, 1, 1, 1,
-2.022876, 0.0962673, -1.486094, 1, 1, 1, 1, 1,
-2.016407, -0.4766047, -2.145843, 1, 1, 1, 1, 1,
-2.007765, 0.5136558, -0.6353184, 1, 1, 1, 1, 1,
-1.993938, 0.2467755, -2.259592, 1, 1, 1, 1, 1,
-1.993117, 1.643483, -1.1725, 1, 1, 1, 1, 1,
-1.962127, -0.2806709, -0.7674936, 1, 1, 1, 1, 1,
-1.956397, -0.5586556, -3.932806, 1, 1, 1, 1, 1,
-1.954279, -1.530947, -4.07955, 1, 1, 1, 1, 1,
-1.948362, -0.6561468, -1.205016, 1, 1, 1, 1, 1,
-1.928922, 1.681632, -0.6018478, 1, 1, 1, 1, 1,
-1.918396, -1.46732, -2.961467, 1, 1, 1, 1, 1,
-1.914015, -0.291022, -0.3887449, 1, 1, 1, 1, 1,
-1.900623, -0.4964168, -0.9826328, 1, 1, 1, 1, 1,
-1.894368, -0.01301979, -1.876223, 0, 0, 1, 1, 1,
-1.871408, -0.6878695, -1.609209, 1, 0, 0, 1, 1,
-1.870243, 0.1994802, -0.9417493, 1, 0, 0, 1, 1,
-1.850045, 0.4984426, -2.856579, 1, 0, 0, 1, 1,
-1.843933, 0.7856175, -1.824883, 1, 0, 0, 1, 1,
-1.83923, -0.394433, -2.718961, 1, 0, 0, 1, 1,
-1.836579, 0.5578104, -0.4263722, 0, 0, 0, 1, 1,
-1.822449, -0.6974156, -2.956322, 0, 0, 0, 1, 1,
-1.781401, 1.389425, -1.451648, 0, 0, 0, 1, 1,
-1.752151, 0.3868835, -1.575786, 0, 0, 0, 1, 1,
-1.737169, 0.2028522, -2.532072, 0, 0, 0, 1, 1,
-1.721083, -0.9232427, -1.402942, 0, 0, 0, 1, 1,
-1.718656, 1.160519, -1.252331, 0, 0, 0, 1, 1,
-1.715897, 1.06992, -0.7864683, 1, 1, 1, 1, 1,
-1.708107, -0.4043957, -2.024994, 1, 1, 1, 1, 1,
-1.707555, -1.787478, -2.633513, 1, 1, 1, 1, 1,
-1.688481, 0.4299793, -0.05179898, 1, 1, 1, 1, 1,
-1.682278, 0.7041615, 0.6916777, 1, 1, 1, 1, 1,
-1.645968, -0.865895, -1.193735, 1, 1, 1, 1, 1,
-1.64045, -0.1448196, -1.81328, 1, 1, 1, 1, 1,
-1.615465, 0.6834579, -1.305007, 1, 1, 1, 1, 1,
-1.59832, 1.849426, -0.2536601, 1, 1, 1, 1, 1,
-1.580623, -0.2057944, -2.149786, 1, 1, 1, 1, 1,
-1.572398, 1.001736, -0.9915138, 1, 1, 1, 1, 1,
-1.570726, 1.187986, -1.557659, 1, 1, 1, 1, 1,
-1.553353, 1.458658, -1.242829, 1, 1, 1, 1, 1,
-1.544491, -0.2615488, -0.5395959, 1, 1, 1, 1, 1,
-1.54139, -0.1406597, -1.583427, 1, 1, 1, 1, 1,
-1.534118, -0.09794907, -2.30702, 0, 0, 1, 1, 1,
-1.532014, 1.755413, 0.4274752, 1, 0, 0, 1, 1,
-1.531692, 0.8062047, -1.688439, 1, 0, 0, 1, 1,
-1.530171, -1.200795, -2.920245, 1, 0, 0, 1, 1,
-1.523647, 1.149142, 0.5370172, 1, 0, 0, 1, 1,
-1.522312, 0.5781693, -0.7043135, 1, 0, 0, 1, 1,
-1.518875, 0.6112968, 0.2085411, 0, 0, 0, 1, 1,
-1.495908, 0.8170223, -0.4763659, 0, 0, 0, 1, 1,
-1.487584, -0.780288, -2.266419, 0, 0, 0, 1, 1,
-1.485293, 1.215883, -1.460152, 0, 0, 0, 1, 1,
-1.480565, -1.396232, -2.824147, 0, 0, 0, 1, 1,
-1.473066, -0.4241718, -2.967101, 0, 0, 0, 1, 1,
-1.47121, 0.4692726, -2.066049, 0, 0, 0, 1, 1,
-1.46198, 1.500106, -2.559262, 1, 1, 1, 1, 1,
-1.458411, -0.07634435, -3.294197, 1, 1, 1, 1, 1,
-1.455825, -1.134051, -0.8955195, 1, 1, 1, 1, 1,
-1.433661, -0.4532218, -1.17066, 1, 1, 1, 1, 1,
-1.432939, 1.521329, -2.408858, 1, 1, 1, 1, 1,
-1.432452, -1.249891, -4.305876, 1, 1, 1, 1, 1,
-1.409709, -0.2979483, -0.192108, 1, 1, 1, 1, 1,
-1.400347, -0.4163944, -0.9900296, 1, 1, 1, 1, 1,
-1.39821, -0.1955017, -1.038161, 1, 1, 1, 1, 1,
-1.391053, -0.1304671, -3.414078, 1, 1, 1, 1, 1,
-1.385748, -0.2540424, -2.652395, 1, 1, 1, 1, 1,
-1.380862, -1.696512, -3.958924, 1, 1, 1, 1, 1,
-1.369032, 0.127363, -1.625697, 1, 1, 1, 1, 1,
-1.367503, -1.147601, -2.189831, 1, 1, 1, 1, 1,
-1.365728, 1.055268, -0.08284982, 1, 1, 1, 1, 1,
-1.358643, 0.3704327, -1.049583, 0, 0, 1, 1, 1,
-1.343522, 1.025944, -0.1257761, 1, 0, 0, 1, 1,
-1.322942, -0.7919888, -2.896703, 1, 0, 0, 1, 1,
-1.320781, -1.75176, -0.7206562, 1, 0, 0, 1, 1,
-1.31845, 0.3879367, 0.01949892, 1, 0, 0, 1, 1,
-1.313479, -0.6021576, -4.287472, 1, 0, 0, 1, 1,
-1.305286, -0.3974873, -1.390052, 0, 0, 0, 1, 1,
-1.304616, 1.012249, -2.943426, 0, 0, 0, 1, 1,
-1.288341, -2.595109, -2.4076, 0, 0, 0, 1, 1,
-1.280689, 0.9203524, -0.7266297, 0, 0, 0, 1, 1,
-1.280447, -1.44621, -2.602546, 0, 0, 0, 1, 1,
-1.276612, 0.1412649, -3.798144, 0, 0, 0, 1, 1,
-1.270579, 0.05565678, -1.270382, 0, 0, 0, 1, 1,
-1.268532, -0.230554, -4.152737, 1, 1, 1, 1, 1,
-1.266833, -0.1776095, -2.069038, 1, 1, 1, 1, 1,
-1.25978, 0.6632569, -2.999179, 1, 1, 1, 1, 1,
-1.255365, -0.1431187, -3.3358, 1, 1, 1, 1, 1,
-1.235988, -0.8109564, -0.101759, 1, 1, 1, 1, 1,
-1.23218, 0.2396401, -1.162041, 1, 1, 1, 1, 1,
-1.230519, -0.4382352, -1.735722, 1, 1, 1, 1, 1,
-1.225834, 0.5361221, 0.126599, 1, 1, 1, 1, 1,
-1.2235, -0.2747326, -1.68261, 1, 1, 1, 1, 1,
-1.21425, -0.9543378, -3.748245, 1, 1, 1, 1, 1,
-1.204242, -0.2846127, -0.7088799, 1, 1, 1, 1, 1,
-1.201439, -0.3188516, -1.39159, 1, 1, 1, 1, 1,
-1.199625, -0.9806435, -2.680607, 1, 1, 1, 1, 1,
-1.198326, -0.4650667, -1.499458, 1, 1, 1, 1, 1,
-1.195683, -0.6093956, -2.320234, 1, 1, 1, 1, 1,
-1.194414, -1.072607, -2.476734, 0, 0, 1, 1, 1,
-1.192224, -0.08183336, -1.234746, 1, 0, 0, 1, 1,
-1.18988, 0.9006397, 0.05033589, 1, 0, 0, 1, 1,
-1.181205, 1.12334, -1.110884, 1, 0, 0, 1, 1,
-1.162688, -0.7404389, -1.047395, 1, 0, 0, 1, 1,
-1.162449, -0.4181689, -1.237549, 1, 0, 0, 1, 1,
-1.158344, -1.336884, -4.0773, 0, 0, 0, 1, 1,
-1.150992, 0.6634616, -1.366826, 0, 0, 0, 1, 1,
-1.148427, -0.6174744, -3.426012, 0, 0, 0, 1, 1,
-1.146739, 0.7076284, -0.7516503, 0, 0, 0, 1, 1,
-1.141301, -1.895755, -3.304193, 0, 0, 0, 1, 1,
-1.139677, -1.028427, -2.636769, 0, 0, 0, 1, 1,
-1.136805, -0.6688217, 0.3496468, 0, 0, 0, 1, 1,
-1.13079, 2.63927, -0.3785547, 1, 1, 1, 1, 1,
-1.122153, 1.754132, -1.125918, 1, 1, 1, 1, 1,
-1.118659, 0.5540118, 1.148342, 1, 1, 1, 1, 1,
-1.114946, 0.6041441, -0.9374648, 1, 1, 1, 1, 1,
-1.11152, 0.07086376, -2.128707, 1, 1, 1, 1, 1,
-1.104003, -0.004042816, -1.583755, 1, 1, 1, 1, 1,
-1.099593, -0.1992074, -1.649656, 1, 1, 1, 1, 1,
-1.088167, 1.895667, 0.5352361, 1, 1, 1, 1, 1,
-1.086984, 1.761705, 0.3005844, 1, 1, 1, 1, 1,
-1.085353, -0.3699317, -1.345219, 1, 1, 1, 1, 1,
-1.082517, -1.620247, -3.863221, 1, 1, 1, 1, 1,
-1.078684, -1.002367, -0.8931829, 1, 1, 1, 1, 1,
-1.078118, 0.3733926, -2.069096, 1, 1, 1, 1, 1,
-1.076658, -0.6084426, -1.772929, 1, 1, 1, 1, 1,
-1.076551, -0.09290718, -2.07522, 1, 1, 1, 1, 1,
-1.072039, 1.081969, -1.013725, 0, 0, 1, 1, 1,
-1.067638, 0.4610903, -0.8629987, 1, 0, 0, 1, 1,
-1.066588, 2.257791, 0.8131343, 1, 0, 0, 1, 1,
-1.061938, 1.632334, -0.3173631, 1, 0, 0, 1, 1,
-1.058953, 1.240224, -1.136735, 1, 0, 0, 1, 1,
-1.057448, -0.7864189, -3.450382, 1, 0, 0, 1, 1,
-1.057102, 0.7144892, 1.0504, 0, 0, 0, 1, 1,
-1.054355, -1.749853, -3.095744, 0, 0, 0, 1, 1,
-1.052909, -0.7077094, -3.401725, 0, 0, 0, 1, 1,
-1.047463, -1.167361, -2.570995, 0, 0, 0, 1, 1,
-1.043927, -0.1721059, -0.7646766, 0, 0, 0, 1, 1,
-1.036508, -0.5092268, -3.719646, 0, 0, 0, 1, 1,
-1.034799, 0.00714383, -3.034039, 0, 0, 0, 1, 1,
-1.027654, 0.1683358, -0.8484992, 1, 1, 1, 1, 1,
-1.022993, -0.2918214, -0.9237059, 1, 1, 1, 1, 1,
-1.022681, -0.1766083, -2.4224, 1, 1, 1, 1, 1,
-1.020386, 0.5289685, 0.0790341, 1, 1, 1, 1, 1,
-1.015665, -0.3871775, -3.87585, 1, 1, 1, 1, 1,
-1.008943, -0.3590823, -0.5727006, 1, 1, 1, 1, 1,
-1.004895, 0.1974336, -2.911804, 1, 1, 1, 1, 1,
-1.004653, -0.01885144, -0.8036311, 1, 1, 1, 1, 1,
-1.000896, 0.4016712, -1.763004, 1, 1, 1, 1, 1,
-0.9966326, -0.7713076, -1.559089, 1, 1, 1, 1, 1,
-0.9916926, 0.09226002, -1.116329, 1, 1, 1, 1, 1,
-0.9865775, 0.1968853, -0.4289605, 1, 1, 1, 1, 1,
-0.9808264, 1.860683, 0.07608715, 1, 1, 1, 1, 1,
-0.9779609, -1.823142, -1.965491, 1, 1, 1, 1, 1,
-0.9757305, 1.169858, -0.834497, 1, 1, 1, 1, 1,
-0.9717129, 1.897002, -0.7076171, 0, 0, 1, 1, 1,
-0.9706665, -1.400689, -4.345596, 1, 0, 0, 1, 1,
-0.9637544, -0.1442518, -1.591149, 1, 0, 0, 1, 1,
-0.9610205, 1.432114, 0.8942099, 1, 0, 0, 1, 1,
-0.9584154, -0.1995085, -2.55212, 1, 0, 0, 1, 1,
-0.9538705, 1.133575, 0.5559064, 1, 0, 0, 1, 1,
-0.9511502, 0.8745031, -0.9218932, 0, 0, 0, 1, 1,
-0.9440946, 0.993739, -0.2704629, 0, 0, 0, 1, 1,
-0.9386469, -0.04387712, -1.229775, 0, 0, 0, 1, 1,
-0.9373335, -0.2827044, -0.8698367, 0, 0, 0, 1, 1,
-0.9310855, -0.05845348, -2.961076, 0, 0, 0, 1, 1,
-0.9281681, -0.3190075, -2.161491, 0, 0, 0, 1, 1,
-0.9258109, 0.2224689, -4.049631, 0, 0, 0, 1, 1,
-0.9253849, 0.47047, -1.799419, 1, 1, 1, 1, 1,
-0.9206445, 0.2722791, -1.853927, 1, 1, 1, 1, 1,
-0.919204, 1.180404, -0.5054502, 1, 1, 1, 1, 1,
-0.9189992, 0.1589444, -1.619703, 1, 1, 1, 1, 1,
-0.9081733, -0.3153243, -3.443803, 1, 1, 1, 1, 1,
-0.9062082, -1.028878, -1.481907, 1, 1, 1, 1, 1,
-0.8944901, -0.1899395, -1.876233, 1, 1, 1, 1, 1,
-0.8943326, -0.2160675, -0.8323763, 1, 1, 1, 1, 1,
-0.8869346, 1.686261, -2.944916, 1, 1, 1, 1, 1,
-0.8854325, -0.8939415, -2.985635, 1, 1, 1, 1, 1,
-0.8849897, -1.768023, -2.231596, 1, 1, 1, 1, 1,
-0.8778274, 0.7357152, -0.6725072, 1, 1, 1, 1, 1,
-0.87634, -0.4966389, -1.973745, 1, 1, 1, 1, 1,
-0.8660767, 0.3616214, -1.267514, 1, 1, 1, 1, 1,
-0.863603, -0.1024921, -1.864761, 1, 1, 1, 1, 1,
-0.8622158, 1.222494, -1.968406, 0, 0, 1, 1, 1,
-0.857233, 0.7623705, -1.804087, 1, 0, 0, 1, 1,
-0.8567979, 0.02862014, 0.9329203, 1, 0, 0, 1, 1,
-0.8414419, 0.8969652, -1.70696, 1, 0, 0, 1, 1,
-0.8407019, -1.360949, -0.3614522, 1, 0, 0, 1, 1,
-0.8397367, 0.0009101156, -0.4099287, 1, 0, 0, 1, 1,
-0.8387582, -0.05613989, -1.43909, 0, 0, 0, 1, 1,
-0.8370762, -0.9997836, -2.619846, 0, 0, 0, 1, 1,
-0.8216427, 0.8428813, -0.4604453, 0, 0, 0, 1, 1,
-0.8193913, 1.712954, -1.699597, 0, 0, 0, 1, 1,
-0.8186374, -0.4450305, -2.826053, 0, 0, 0, 1, 1,
-0.8093317, 0.09383409, -0.2161679, 0, 0, 0, 1, 1,
-0.8081964, -0.02463104, -1.985682, 0, 0, 0, 1, 1,
-0.8063166, -0.6193284, -1.213678, 1, 1, 1, 1, 1,
-0.8026351, -1.421238, -3.132323, 1, 1, 1, 1, 1,
-0.8007705, 0.08035783, -2.093419, 1, 1, 1, 1, 1,
-0.7997807, 0.9692848, -3.240421, 1, 1, 1, 1, 1,
-0.7844229, -2.249439, -2.879327, 1, 1, 1, 1, 1,
-0.783057, -0.5464399, -1.997086, 1, 1, 1, 1, 1,
-0.7798361, 0.4104825, -2.382574, 1, 1, 1, 1, 1,
-0.775371, 0.02301347, -2.355368, 1, 1, 1, 1, 1,
-0.7747386, -0.9654401, -2.85706, 1, 1, 1, 1, 1,
-0.7739897, -2.032641, -0.7579171, 1, 1, 1, 1, 1,
-0.7720802, 0.2195249, -0.817766, 1, 1, 1, 1, 1,
-0.7691522, 0.2076696, -2.708652, 1, 1, 1, 1, 1,
-0.7682977, 0.03489021, -1.119468, 1, 1, 1, 1, 1,
-0.7670385, -0.09284418, -2.063138, 1, 1, 1, 1, 1,
-0.7624769, 0.3146676, 0.5081878, 1, 1, 1, 1, 1,
-0.761184, -1.008584, -2.118567, 0, 0, 1, 1, 1,
-0.7523762, -0.1741172, -2.060515, 1, 0, 0, 1, 1,
-0.7492561, 1.917964, 0.5091637, 1, 0, 0, 1, 1,
-0.7474769, -1.987402, -3.324942, 1, 0, 0, 1, 1,
-0.7444518, -0.2363856, -2.613121, 1, 0, 0, 1, 1,
-0.743327, -0.01850181, -1.854464, 1, 0, 0, 1, 1,
-0.7425333, -0.1499529, -1.976612, 0, 0, 0, 1, 1,
-0.7399247, 1.35633, -0.611604, 0, 0, 0, 1, 1,
-0.738051, 0.1541473, -2.020437, 0, 0, 0, 1, 1,
-0.7367895, -0.924344, -2.723182, 0, 0, 0, 1, 1,
-0.7361006, 0.1996778, -3.058639, 0, 0, 0, 1, 1,
-0.7299969, -0.4963511, -2.187642, 0, 0, 0, 1, 1,
-0.7281059, -0.6049303, -3.185492, 0, 0, 0, 1, 1,
-0.7248348, 0.6632203, -1.652881, 1, 1, 1, 1, 1,
-0.7177836, -1.976921, -3.485339, 1, 1, 1, 1, 1,
-0.7175239, -0.2944203, -2.201414, 1, 1, 1, 1, 1,
-0.7173089, 0.455528, -0.5360215, 1, 1, 1, 1, 1,
-0.7164797, -0.005904331, -2.065328, 1, 1, 1, 1, 1,
-0.7143748, -1.188924, -3.244404, 1, 1, 1, 1, 1,
-0.7142572, -2.097232, -2.870907, 1, 1, 1, 1, 1,
-0.711789, -1.131417, -3.309512, 1, 1, 1, 1, 1,
-0.7062864, -0.5414017, -3.096597, 1, 1, 1, 1, 1,
-0.6978534, 1.613761, 0.8006793, 1, 1, 1, 1, 1,
-0.690025, 0.4305974, 0.5285703, 1, 1, 1, 1, 1,
-0.6889248, 1.349727, -1.036748, 1, 1, 1, 1, 1,
-0.6803913, 3.882516, 0.7224216, 1, 1, 1, 1, 1,
-0.6803322, -0.3919923, -2.853208, 1, 1, 1, 1, 1,
-0.6792661, 2.190062, 0.7719362, 1, 1, 1, 1, 1,
-0.6783621, -0.3846679, -3.145956, 0, 0, 1, 1, 1,
-0.6780691, 0.3753892, -1.05884, 1, 0, 0, 1, 1,
-0.6779906, -1.123597, -4.829939, 1, 0, 0, 1, 1,
-0.6723382, -0.02421466, -1.223918, 1, 0, 0, 1, 1,
-0.6715685, 2.264516, 1.192224, 1, 0, 0, 1, 1,
-0.6682132, 0.07230181, -0.9011595, 1, 0, 0, 1, 1,
-0.6669257, -0.3938372, -2.5097, 0, 0, 0, 1, 1,
-0.6663943, 0.9630852, 1.346439, 0, 0, 0, 1, 1,
-0.6657329, 0.3589146, -2.487887, 0, 0, 0, 1, 1,
-0.6503498, 0.3581078, -0.9512848, 0, 0, 0, 1, 1,
-0.645772, 0.1556412, -2.235496, 0, 0, 0, 1, 1,
-0.641843, 0.2386877, -1.228403, 0, 0, 0, 1, 1,
-0.6374481, 0.9026131, 1.323687, 0, 0, 0, 1, 1,
-0.6369664, -0.9927608, -2.326143, 1, 1, 1, 1, 1,
-0.6314791, 1.644719, -1.6479, 1, 1, 1, 1, 1,
-0.6312008, 1.016137, -1.022335, 1, 1, 1, 1, 1,
-0.6310973, -0.7956139, -1.902041, 1, 1, 1, 1, 1,
-0.6308719, 0.1950705, -1.830001, 1, 1, 1, 1, 1,
-0.6283583, 0.5253556, -0.3840149, 1, 1, 1, 1, 1,
-0.6187661, 0.1873267, -2.021107, 1, 1, 1, 1, 1,
-0.614026, -1.86263, -1.238438, 1, 1, 1, 1, 1,
-0.6113063, 1.317627, -0.06138131, 1, 1, 1, 1, 1,
-0.6004311, 0.0164999, -1.475695, 1, 1, 1, 1, 1,
-0.5959751, -0.8914573, -3.222227, 1, 1, 1, 1, 1,
-0.5903895, 0.4371852, 0.3969708, 1, 1, 1, 1, 1,
-0.5890785, -0.4513035, -2.051145, 1, 1, 1, 1, 1,
-0.5825795, 0.1250392, -2.479616, 1, 1, 1, 1, 1,
-0.5825424, -0.491595, -1.279899, 1, 1, 1, 1, 1,
-0.5819017, -0.2318136, -1.973876, 0, 0, 1, 1, 1,
-0.5804314, -0.7911952, -1.65925, 1, 0, 0, 1, 1,
-0.5802393, -0.5396546, -0.6507545, 1, 0, 0, 1, 1,
-0.5792373, -1.053677, -3.414392, 1, 0, 0, 1, 1,
-0.5661451, 0.5859197, -1.913154, 1, 0, 0, 1, 1,
-0.5655037, 0.0606103, -0.4307578, 1, 0, 0, 1, 1,
-0.5637198, -1.50276, -2.99366, 0, 0, 0, 1, 1,
-0.5632715, -0.957723, -3.068157, 0, 0, 0, 1, 1,
-0.5612403, -1.631709, -1.53926, 0, 0, 0, 1, 1,
-0.5584236, 0.4018704, -0.07737193, 0, 0, 0, 1, 1,
-0.5578994, -1.972505, -3.155108, 0, 0, 0, 1, 1,
-0.5554438, -0.8967915, -2.399532, 0, 0, 0, 1, 1,
-0.5519252, -0.6581749, -1.636939, 0, 0, 0, 1, 1,
-0.5481656, 0.5261443, -1.487596, 1, 1, 1, 1, 1,
-0.5469097, -0.3507149, -2.431746, 1, 1, 1, 1, 1,
-0.5467119, -1.678225, -3.445514, 1, 1, 1, 1, 1,
-0.5448375, -0.4036145, -2.296521, 1, 1, 1, 1, 1,
-0.5439889, -0.3076335, -0.8021719, 1, 1, 1, 1, 1,
-0.5391296, -0.3993368, -1.011793, 1, 1, 1, 1, 1,
-0.5368062, -1.656661, -3.721792, 1, 1, 1, 1, 1,
-0.5366877, -0.2207857, -0.5352449, 1, 1, 1, 1, 1,
-0.5333053, -0.82255, -1.840491, 1, 1, 1, 1, 1,
-0.5179214, -0.8561816, -1.971705, 1, 1, 1, 1, 1,
-0.5079295, 0.6375623, -1.3248, 1, 1, 1, 1, 1,
-0.5073298, -0.7019527, -1.165421, 1, 1, 1, 1, 1,
-0.5072846, -0.8145226, -2.148727, 1, 1, 1, 1, 1,
-0.4960915, -0.5416343, -2.448547, 1, 1, 1, 1, 1,
-0.4870741, 1.16517, -0.6478254, 1, 1, 1, 1, 1,
-0.4869387, -1.244428, -2.080296, 0, 0, 1, 1, 1,
-0.4855238, 0.1754077, -0.6766021, 1, 0, 0, 1, 1,
-0.4844656, 0.06332894, -1.423479, 1, 0, 0, 1, 1,
-0.4829623, 0.6645553, 0.9567981, 1, 0, 0, 1, 1,
-0.4819535, 0.03528136, -0.3292536, 1, 0, 0, 1, 1,
-0.471372, -0.8068386, -3.351406, 1, 0, 0, 1, 1,
-0.4708993, -0.3267751, -2.749795, 0, 0, 0, 1, 1,
-0.468748, 0.5084668, -1.233981, 0, 0, 0, 1, 1,
-0.4676468, -0.7402142, -2.959255, 0, 0, 0, 1, 1,
-0.4626524, -0.2009544, -2.711984, 0, 0, 0, 1, 1,
-0.4623439, 1.474794, 0.6370556, 0, 0, 0, 1, 1,
-0.4615937, -0.8477048, -2.432962, 0, 0, 0, 1, 1,
-0.4596983, 0.4693182, 0.1007698, 0, 0, 0, 1, 1,
-0.4546828, -0.2422933, -0.3852508, 1, 1, 1, 1, 1,
-0.4485928, 0.32127, -1.953489, 1, 1, 1, 1, 1,
-0.4484018, -1.460001, -2.004224, 1, 1, 1, 1, 1,
-0.4430179, 1.195821, -0.5276853, 1, 1, 1, 1, 1,
-0.4420533, -0.9481128, -1.605075, 1, 1, 1, 1, 1,
-0.437195, 1.138666, -0.9072768, 1, 1, 1, 1, 1,
-0.4367417, 0.07404788, -2.219364, 1, 1, 1, 1, 1,
-0.4291719, 1.340207, -0.9408388, 1, 1, 1, 1, 1,
-0.4287925, -0.2251705, -0.7841077, 1, 1, 1, 1, 1,
-0.4274856, -0.5760899, -2.037488, 1, 1, 1, 1, 1,
-0.4236253, 0.06815574, 0.5694997, 1, 1, 1, 1, 1,
-0.4226749, 0.02187194, -2.24969, 1, 1, 1, 1, 1,
-0.4185859, 1.95732, -0.3958776, 1, 1, 1, 1, 1,
-0.4173473, -0.2398895, -1.598036, 1, 1, 1, 1, 1,
-0.4071101, 0.7923202, 1.313286, 1, 1, 1, 1, 1,
-0.4055345, -0.2453022, -2.876195, 0, 0, 1, 1, 1,
-0.4039916, -2.560819, -2.149824, 1, 0, 0, 1, 1,
-0.4012211, -0.7102869, -3.629207, 1, 0, 0, 1, 1,
-0.3962395, -0.5251502, -1.631911, 1, 0, 0, 1, 1,
-0.3960688, -2.385797, -2.260737, 1, 0, 0, 1, 1,
-0.3948349, 0.5827315, -0.07225597, 1, 0, 0, 1, 1,
-0.3938324, 1.252566, 0.2150448, 0, 0, 0, 1, 1,
-0.393831, -1.362275, -2.41005, 0, 0, 0, 1, 1,
-0.3929189, -0.4064775, -3.730022, 0, 0, 0, 1, 1,
-0.3876306, -1.347684, -3.229791, 0, 0, 0, 1, 1,
-0.3825285, -1.92983, -1.778018, 0, 0, 0, 1, 1,
-0.3815196, -1.18193, -2.888964, 0, 0, 0, 1, 1,
-0.3804491, 1.457247, -1.35992, 0, 0, 0, 1, 1,
-0.3797642, -1.948983, -2.668809, 1, 1, 1, 1, 1,
-0.3791097, -0.824854, -2.487051, 1, 1, 1, 1, 1,
-0.3746743, -0.7255258, -2.890379, 1, 1, 1, 1, 1,
-0.3658181, 2.193624, -0.5555117, 1, 1, 1, 1, 1,
-0.3649282, -0.1839732, -1.628356, 1, 1, 1, 1, 1,
-0.3624972, -0.06859097, -3.004385, 1, 1, 1, 1, 1,
-0.3596081, 0.2084392, -2.500548, 1, 1, 1, 1, 1,
-0.3551027, 0.05845352, -1.32309, 1, 1, 1, 1, 1,
-0.3439423, 0.7953286, -1.888646, 1, 1, 1, 1, 1,
-0.3401308, 1.35412, -0.5247598, 1, 1, 1, 1, 1,
-0.3363598, 0.046755, -1.265325, 1, 1, 1, 1, 1,
-0.3347253, 0.3639896, -0.1501237, 1, 1, 1, 1, 1,
-0.3344731, 0.4042581, -1.285245, 1, 1, 1, 1, 1,
-0.333252, 0.6407178, -2.293088, 1, 1, 1, 1, 1,
-0.3324486, 0.1334749, -2.983877, 1, 1, 1, 1, 1,
-0.3317783, -0.6731367, -3.069387, 0, 0, 1, 1, 1,
-0.3251039, -0.0448511, -2.352041, 1, 0, 0, 1, 1,
-0.3238262, -0.3363112, -2.21342, 1, 0, 0, 1, 1,
-0.3230421, -0.3071204, -2.020934, 1, 0, 0, 1, 1,
-0.3224596, -1.785949, -1.531564, 1, 0, 0, 1, 1,
-0.319673, 0.417768, 0.07159078, 1, 0, 0, 1, 1,
-0.319114, 1.23407, 0.453342, 0, 0, 0, 1, 1,
-0.3136148, 1.529222, 1.363918, 0, 0, 0, 1, 1,
-0.3071166, -0.2355752, -1.812785, 0, 0, 0, 1, 1,
-0.3059455, 0.7881137, -0.712774, 0, 0, 0, 1, 1,
-0.3032063, -0.9017864, -2.823446, 0, 0, 0, 1, 1,
-0.3018454, 0.4262878, -0.6152604, 0, 0, 0, 1, 1,
-0.300268, 0.5522782, -2.60549, 0, 0, 0, 1, 1,
-0.2997296, -1.30734, -4.640801, 1, 1, 1, 1, 1,
-0.2896302, -0.6519949, -5.21937, 1, 1, 1, 1, 1,
-0.2889604, 0.3717211, -2.173399, 1, 1, 1, 1, 1,
-0.2826719, -1.239511, -3.664662, 1, 1, 1, 1, 1,
-0.2821429, 0.1917825, -1.694755, 1, 1, 1, 1, 1,
-0.2799415, -0.7040734, -2.34879, 1, 1, 1, 1, 1,
-0.2787514, 2.739228, -0.48372, 1, 1, 1, 1, 1,
-0.2744775, 1.083256, -0.6416686, 1, 1, 1, 1, 1,
-0.2709974, 1.741556, 0.2073742, 1, 1, 1, 1, 1,
-0.2672528, 0.3181413, 1.458816, 1, 1, 1, 1, 1,
-0.2663983, -0.9951091, -2.720167, 1, 1, 1, 1, 1,
-0.2638464, 0.5430854, 1.011437, 1, 1, 1, 1, 1,
-0.2638442, -0.4523493, -2.585554, 1, 1, 1, 1, 1,
-0.2628238, -0.2881718, -2.426466, 1, 1, 1, 1, 1,
-0.2625365, -0.3302284, -0.9492496, 1, 1, 1, 1, 1,
-0.2605348, -2.290498, -2.016644, 0, 0, 1, 1, 1,
-0.2597884, -1.377737, -2.366721, 1, 0, 0, 1, 1,
-0.2586554, -0.7497665, -2.05225, 1, 0, 0, 1, 1,
-0.2483241, -0.00435548, -1.053306, 1, 0, 0, 1, 1,
-0.2341924, -2.028929, -3.824058, 1, 0, 0, 1, 1,
-0.2273342, 0.8941797, 0.08954996, 1, 0, 0, 1, 1,
-0.2235198, 2.052346, -0.06081885, 0, 0, 0, 1, 1,
-0.2153874, 1.017637, -0.5427085, 0, 0, 0, 1, 1,
-0.2134693, -2.494162, -1.60623, 0, 0, 0, 1, 1,
-0.2028639, -0.8000239, -2.753749, 0, 0, 0, 1, 1,
-0.1970604, -0.1714811, -2.67658, 0, 0, 0, 1, 1,
-0.1944776, -0.6547951, -3.250432, 0, 0, 0, 1, 1,
-0.1866077, -0.7973638, -3.240468, 0, 0, 0, 1, 1,
-0.1833729, -0.3342833, -3.676231, 1, 1, 1, 1, 1,
-0.1795503, 0.7484284, -1.490406, 1, 1, 1, 1, 1,
-0.1710398, -0.8253443, -3.077319, 1, 1, 1, 1, 1,
-0.1630122, 0.4189208, -0.1672642, 1, 1, 1, 1, 1,
-0.156759, -0.739265, -2.775892, 1, 1, 1, 1, 1,
-0.1555664, 0.9591913, -0.557649, 1, 1, 1, 1, 1,
-0.1534471, 0.813596, -0.7362315, 1, 1, 1, 1, 1,
-0.1510659, 0.7170197, 0.3686207, 1, 1, 1, 1, 1,
-0.1492541, 1.336571, 1.493469, 1, 1, 1, 1, 1,
-0.1481961, 0.5348178, -1.465133, 1, 1, 1, 1, 1,
-0.1374509, 0.8956005, 0.7222957, 1, 1, 1, 1, 1,
-0.1362099, 0.4282182, 0.3890258, 1, 1, 1, 1, 1,
-0.1356575, -0.2027114, -4.020092, 1, 1, 1, 1, 1,
-0.1294338, -0.4599859, -2.174637, 1, 1, 1, 1, 1,
-0.129388, -2.446919, -0.8623145, 1, 1, 1, 1, 1,
-0.1232815, -1.097948, -2.965552, 0, 0, 1, 1, 1,
-0.1216175, -1.325694, -3.150914, 1, 0, 0, 1, 1,
-0.1205491, -1.6988, -3.695071, 1, 0, 0, 1, 1,
-0.119614, 0.08480179, -2.252452, 1, 0, 0, 1, 1,
-0.1178716, -1.07478, -3.374685, 1, 0, 0, 1, 1,
-0.0973403, -0.7849102, -3.478613, 1, 0, 0, 1, 1,
-0.09686847, 1.283164, -0.909191, 0, 0, 0, 1, 1,
-0.0934847, -0.7769795, -2.393583, 0, 0, 0, 1, 1,
-0.09181812, 0.1232546, -0.3406096, 0, 0, 0, 1, 1,
-0.08770973, 1.206693, 2.993188, 0, 0, 0, 1, 1,
-0.08754186, -1.179894, -2.390693, 0, 0, 0, 1, 1,
-0.08329321, -1.857106, -3.970252, 0, 0, 0, 1, 1,
-0.07977514, 0.141438, -0.4276955, 0, 0, 0, 1, 1,
-0.07953946, -0.1838513, -3.61147, 1, 1, 1, 1, 1,
-0.07933626, 0.09897092, -0.5665665, 1, 1, 1, 1, 1,
-0.0721885, 0.1160169, -2.855203, 1, 1, 1, 1, 1,
-0.07150403, 0.5238988, 0.6584361, 1, 1, 1, 1, 1,
-0.07051191, 0.6995319, 0.1112012, 1, 1, 1, 1, 1,
-0.07030197, -0.4123871, -3.428226, 1, 1, 1, 1, 1,
-0.06954315, 2.047414, -0.9396936, 1, 1, 1, 1, 1,
-0.065565, 0.4532505, 0.8210789, 1, 1, 1, 1, 1,
-0.06375042, -0.6355271, -2.022729, 1, 1, 1, 1, 1,
-0.06115216, -1.213451, -2.858132, 1, 1, 1, 1, 1,
-0.05438329, 0.1665387, -0.7009546, 1, 1, 1, 1, 1,
-0.05385931, -1.020311, -3.480259, 1, 1, 1, 1, 1,
-0.05316106, 0.7038164, -0.3058632, 1, 1, 1, 1, 1,
-0.04914759, 0.7404951, -2.296781, 1, 1, 1, 1, 1,
-0.04597636, -1.396632, -3.154602, 1, 1, 1, 1, 1,
-0.0439652, 2.144946, -0.6702696, 0, 0, 1, 1, 1,
-0.04371583, 0.4464788, 0.3617435, 1, 0, 0, 1, 1,
-0.04336951, 0.7254408, -0.4202172, 1, 0, 0, 1, 1,
-0.04293682, -0.6312246, -1.896765, 1, 0, 0, 1, 1,
-0.04247848, -0.5171565, -3.016325, 1, 0, 0, 1, 1,
-0.04211545, -0.8251536, -3.916957, 1, 0, 0, 1, 1,
-0.04094777, 1.130322, -1.623247, 0, 0, 0, 1, 1,
-0.03885433, -0.5469587, -4.084529, 0, 0, 0, 1, 1,
-0.03831024, -0.3596292, -3.507626, 0, 0, 0, 1, 1,
-0.03793301, -0.3634546, -3.851567, 0, 0, 0, 1, 1,
-0.03632723, 0.6165789, -1.477499, 0, 0, 0, 1, 1,
-0.03192401, -2.483356, -3.913255, 0, 0, 0, 1, 1,
-0.02816223, -0.2408009, -2.03983, 0, 0, 0, 1, 1,
-0.0257008, 1.079584, 1.520617, 1, 1, 1, 1, 1,
-0.0232235, -0.001099689, -1.289817, 1, 1, 1, 1, 1,
-0.01853132, 0.6635533, -1.584304, 1, 1, 1, 1, 1,
-0.01668021, 1.189263, 0.9799605, 1, 1, 1, 1, 1,
-0.01425613, -0.3191695, -1.764216, 1, 1, 1, 1, 1,
-0.0133767, -2.788947, -3.693544, 1, 1, 1, 1, 1,
-0.01330394, -2.237902, -2.930148, 1, 1, 1, 1, 1,
-0.01102016, -0.2897895, -2.912215, 1, 1, 1, 1, 1,
-0.009582701, -1.538246, -1.337976, 1, 1, 1, 1, 1,
-0.008798796, 0.6855638, 0.4199194, 1, 1, 1, 1, 1,
-0.005985993, 0.9555737, -0.7424731, 1, 1, 1, 1, 1,
-0.005598309, -0.477545, -2.66308, 1, 1, 1, 1, 1,
-0.004851076, 0.8027809, 0.002105423, 1, 1, 1, 1, 1,
-0.00150187, 0.285697, 1.291763, 1, 1, 1, 1, 1,
0.00143579, -0.08214385, 4.499485, 1, 1, 1, 1, 1,
0.00254233, 0.3896052, 0.07449234, 0, 0, 1, 1, 1,
0.006167399, -0.425312, 3.975414, 1, 0, 0, 1, 1,
0.01087642, 0.375736, -0.3263207, 1, 0, 0, 1, 1,
0.01380895, 1.404739, -0.008427125, 1, 0, 0, 1, 1,
0.01838106, -1.230593, 2.705678, 1, 0, 0, 1, 1,
0.01865106, -2.239601, 2.5903, 1, 0, 0, 1, 1,
0.01911546, -1.248721, 4.675913, 0, 0, 0, 1, 1,
0.02050645, -0.4568878, 3.08838, 0, 0, 0, 1, 1,
0.02244363, 0.08279798, 1.246024, 0, 0, 0, 1, 1,
0.02245458, -0.8603742, 3.393059, 0, 0, 0, 1, 1,
0.02270007, 1.347367, 0.8310195, 0, 0, 0, 1, 1,
0.02510419, 0.3521871, -0.6457343, 0, 0, 0, 1, 1,
0.0296577, -0.302395, 3.796541, 0, 0, 0, 1, 1,
0.03544428, -1.756871, 3.581756, 1, 1, 1, 1, 1,
0.03636367, -1.202488, 1.710989, 1, 1, 1, 1, 1,
0.03705713, -1.602048, 5.030499, 1, 1, 1, 1, 1,
0.03735295, -1.059813, 3.591092, 1, 1, 1, 1, 1,
0.03792943, -0.6450548, 1.511731, 1, 1, 1, 1, 1,
0.04586818, 0.8994402, -0.9581916, 1, 1, 1, 1, 1,
0.0486451, -0.3962401, 2.198856, 1, 1, 1, 1, 1,
0.05109747, 0.7464411, 0.612321, 1, 1, 1, 1, 1,
0.05294035, -1.718841, 2.722477, 1, 1, 1, 1, 1,
0.05354726, -0.2282383, 2.31456, 1, 1, 1, 1, 1,
0.05971854, 0.6197615, -1.764995, 1, 1, 1, 1, 1,
0.06079516, -1.116752, 3.383168, 1, 1, 1, 1, 1,
0.06338681, -2.266479, 2.100037, 1, 1, 1, 1, 1,
0.06418876, 0.9479134, 0.4028562, 1, 1, 1, 1, 1,
0.07082394, -0.8740374, 1.839858, 1, 1, 1, 1, 1,
0.07089245, -1.341057, 4.002123, 0, 0, 1, 1, 1,
0.07281116, -1.092599, 4.661649, 1, 0, 0, 1, 1,
0.07323102, -0.6286318, 3.597358, 1, 0, 0, 1, 1,
0.07377101, -0.4373668, 4.242532, 1, 0, 0, 1, 1,
0.07915504, -1.035783, 2.972409, 1, 0, 0, 1, 1,
0.08040147, 0.4820249, 0.09960802, 1, 0, 0, 1, 1,
0.08203961, 0.5129299, -0.3121968, 0, 0, 0, 1, 1,
0.08357687, -0.278943, 2.570117, 0, 0, 0, 1, 1,
0.08641133, 2.001584, -0.3315681, 0, 0, 0, 1, 1,
0.0868458, 0.6256773, 0.6606369, 0, 0, 0, 1, 1,
0.08747574, -0.3529625, 4.293903, 0, 0, 0, 1, 1,
0.08753979, 1.743099, -0.6246223, 0, 0, 0, 1, 1,
0.08842101, 2.58623, 1.616621, 0, 0, 0, 1, 1,
0.08940397, -0.01403641, 2.951714, 1, 1, 1, 1, 1,
0.09140698, -1.474911, 1.396879, 1, 1, 1, 1, 1,
0.09671356, -0.7820398, 2.447831, 1, 1, 1, 1, 1,
0.09944019, 0.1450851, 0.6694118, 1, 1, 1, 1, 1,
0.1019628, 0.08373784, -0.8393242, 1, 1, 1, 1, 1,
0.1033075, -0.3834832, 5.772782, 1, 1, 1, 1, 1,
0.1034834, 0.09038541, 0.5538276, 1, 1, 1, 1, 1,
0.1061386, 1.565414, -0.4308514, 1, 1, 1, 1, 1,
0.1073396, 0.5912463, 1.585313, 1, 1, 1, 1, 1,
0.1111785, 0.8508075, -0.91553, 1, 1, 1, 1, 1,
0.1136221, 0.4791944, 0.1261475, 1, 1, 1, 1, 1,
0.1145533, -0.1947018, 3.738163, 1, 1, 1, 1, 1,
0.1145639, -0.6601572, 3.216875, 1, 1, 1, 1, 1,
0.1213608, -0.4241674, 3.30684, 1, 1, 1, 1, 1,
0.1238567, 1.255516, -0.5092409, 1, 1, 1, 1, 1,
0.1306058, 0.2877034, 2.18056, 0, 0, 1, 1, 1,
0.1308917, 0.461868, 0.0531492, 1, 0, 0, 1, 1,
0.1365505, 0.06120858, 2.043654, 1, 0, 0, 1, 1,
0.1369631, 0.02498944, 3.463675, 1, 0, 0, 1, 1,
0.1390236, -0.5320332, 2.480688, 1, 0, 0, 1, 1,
0.1428775, -0.6996105, 2.330565, 1, 0, 0, 1, 1,
0.1451911, -0.4494443, 2.716916, 0, 0, 0, 1, 1,
0.1504263, -1.182899, 3.077894, 0, 0, 0, 1, 1,
0.1523588, 0.1884255, 0.8744354, 0, 0, 0, 1, 1,
0.1536536, 0.5853851, 0.4026376, 0, 0, 0, 1, 1,
0.1542742, -0.2562445, 1.92655, 0, 0, 0, 1, 1,
0.1545218, -0.5575355, 2.078371, 0, 0, 0, 1, 1,
0.1601152, 0.7897638, -0.2021624, 0, 0, 0, 1, 1,
0.1606244, 1.50886, 1.358661, 1, 1, 1, 1, 1,
0.1606736, -2.557814, 2.712636, 1, 1, 1, 1, 1,
0.1637751, 0.7841749, 1.316429, 1, 1, 1, 1, 1,
0.1664886, -1.24902, 0.268907, 1, 1, 1, 1, 1,
0.1669551, -2.409472, 0.828718, 1, 1, 1, 1, 1,
0.1682105, 1.612232, 0.3470658, 1, 1, 1, 1, 1,
0.172941, -0.05995688, 2.18482, 1, 1, 1, 1, 1,
0.1819055, -0.7085213, 1.261981, 1, 1, 1, 1, 1,
0.1855998, 2.153508, -1.471915, 1, 1, 1, 1, 1,
0.1868006, -0.5034481, 2.716169, 1, 1, 1, 1, 1,
0.1872287, 0.5874785, -0.08794715, 1, 1, 1, 1, 1,
0.188589, -1.605632, 3.671664, 1, 1, 1, 1, 1,
0.1930278, -0.05223433, -0.5203837, 1, 1, 1, 1, 1,
0.1960252, 0.2713925, 1.209593, 1, 1, 1, 1, 1,
0.196587, -1.590211, 2.864872, 1, 1, 1, 1, 1,
0.1977805, 0.9298492, 0.640257, 0, 0, 1, 1, 1,
0.2010544, -0.5484521, 1.910444, 1, 0, 0, 1, 1,
0.2029373, -1.459718, 3.154467, 1, 0, 0, 1, 1,
0.2052144, 0.222036, 1.033563, 1, 0, 0, 1, 1,
0.2063834, 1.604304, -0.1480128, 1, 0, 0, 1, 1,
0.2064553, -0.7738149, 3.113646, 1, 0, 0, 1, 1,
0.2094878, -1.6702, 3.874496, 0, 0, 0, 1, 1,
0.2098481, 0.5579877, -1.459057, 0, 0, 0, 1, 1,
0.2108422, 1.52783, 1.001035, 0, 0, 0, 1, 1,
0.2109254, 0.7777673, -0.8632903, 0, 0, 0, 1, 1,
0.2122802, 0.4414603, -1.497553, 0, 0, 0, 1, 1,
0.2123068, 2.667652, 1.237454, 0, 0, 0, 1, 1,
0.2248256, -0.6727435, 2.084977, 0, 0, 0, 1, 1,
0.2287786, 1.475675, 0.8032528, 1, 1, 1, 1, 1,
0.2300438, -1.677872, 5.063231, 1, 1, 1, 1, 1,
0.2310686, -2.597758, 2.251722, 1, 1, 1, 1, 1,
0.2324508, 1.523621, -1.325987, 1, 1, 1, 1, 1,
0.2353426, 0.0391304, 1.634672, 1, 1, 1, 1, 1,
0.2357381, 0.5624837, 0.1500077, 1, 1, 1, 1, 1,
0.2452815, 0.3694443, 1.217814, 1, 1, 1, 1, 1,
0.2477556, -0.1270379, 3.514119, 1, 1, 1, 1, 1,
0.2491381, -0.3873346, 3.009818, 1, 1, 1, 1, 1,
0.2513237, -0.2931168, 0.9369646, 1, 1, 1, 1, 1,
0.2530144, 0.629872, 0.2941822, 1, 1, 1, 1, 1,
0.254108, 0.039332, 2.346781, 1, 1, 1, 1, 1,
0.2550442, -0.3920244, 3.295869, 1, 1, 1, 1, 1,
0.2592169, 0.2765193, 0.203052, 1, 1, 1, 1, 1,
0.2600104, -0.1478845, 3.224882, 1, 1, 1, 1, 1,
0.2655732, -1.622373, 4.349267, 0, 0, 1, 1, 1,
0.2664497, -0.6611688, 2.312969, 1, 0, 0, 1, 1,
0.2691441, -1.287036, 1.641623, 1, 0, 0, 1, 1,
0.2699038, -1.008375, 3.771294, 1, 0, 0, 1, 1,
0.2780916, -0.357243, 3.40573, 1, 0, 0, 1, 1,
0.2794474, -0.7333055, 2.1125, 1, 0, 0, 1, 1,
0.2829815, 0.5187224, -0.1117194, 0, 0, 0, 1, 1,
0.2887424, -0.01526004, 2.736836, 0, 0, 0, 1, 1,
0.289618, 1.39065, 0.4196074, 0, 0, 0, 1, 1,
0.3002897, -0.04641599, -0.9119548, 0, 0, 0, 1, 1,
0.3003058, -1.177166, 2.936658, 0, 0, 0, 1, 1,
0.3037317, 0.2653554, 1.000202, 0, 0, 0, 1, 1,
0.3047356, 1.336024, -0.7098946, 0, 0, 0, 1, 1,
0.3052047, -1.144518, 1.576692, 1, 1, 1, 1, 1,
0.3072133, -0.2792991, 3.980628, 1, 1, 1, 1, 1,
0.3086745, 1.643244, 0.343688, 1, 1, 1, 1, 1,
0.3102813, 2.492402, 0.3266205, 1, 1, 1, 1, 1,
0.315983, -1.382958, 2.92715, 1, 1, 1, 1, 1,
0.3187233, -1.427855, 3.747684, 1, 1, 1, 1, 1,
0.3233208, -0.03624868, 2.092258, 1, 1, 1, 1, 1,
0.3234011, -0.1479079, 2.188997, 1, 1, 1, 1, 1,
0.3272829, 0.5135321, 0.5189254, 1, 1, 1, 1, 1,
0.3303467, -0.1185047, 1.864311, 1, 1, 1, 1, 1,
0.3321386, 0.07175466, 0.7403634, 1, 1, 1, 1, 1,
0.3358083, -1.614843, 4.339521, 1, 1, 1, 1, 1,
0.3370805, 0.4738739, -0.2145479, 1, 1, 1, 1, 1,
0.3387798, 1.143096, -0.4375475, 1, 1, 1, 1, 1,
0.3395981, -0.1648678, 2.246354, 1, 1, 1, 1, 1,
0.3417484, -0.02997524, 3.790411, 0, 0, 1, 1, 1,
0.3428937, 0.2121587, -0.5594928, 1, 0, 0, 1, 1,
0.3432436, 0.4832084, 1.624664, 1, 0, 0, 1, 1,
0.3446561, 0.9057945, 0.8547894, 1, 0, 0, 1, 1,
0.3450153, 1.387596, 1.70547, 1, 0, 0, 1, 1,
0.3484935, -0.2683369, 1.953851, 1, 0, 0, 1, 1,
0.3489119, 0.7595448, -0.00188316, 0, 0, 0, 1, 1,
0.352743, -0.1629281, 1.831101, 0, 0, 0, 1, 1,
0.3540633, -0.1885701, 1.281465, 0, 0, 0, 1, 1,
0.3651709, 1.018544, -1.581166, 0, 0, 0, 1, 1,
0.3661161, -0.06775035, 3.46454, 0, 0, 0, 1, 1,
0.3670252, 1.607857, -0.2024451, 0, 0, 0, 1, 1,
0.3696392, 0.09533897, 1.286487, 0, 0, 0, 1, 1,
0.3698813, 0.843634, 1.598177, 1, 1, 1, 1, 1,
0.3704649, 0.3903145, 0.8264502, 1, 1, 1, 1, 1,
0.3706971, 0.8697163, 0.2519018, 1, 1, 1, 1, 1,
0.3738686, -0.09909445, 1.851482, 1, 1, 1, 1, 1,
0.3783941, 1.225306, -0.05387646, 1, 1, 1, 1, 1,
0.3817483, -1.400787, 2.654693, 1, 1, 1, 1, 1,
0.3827691, -0.4114475, 1.689377, 1, 1, 1, 1, 1,
0.385315, 0.482477, 2.104885, 1, 1, 1, 1, 1,
0.3857201, -0.3672155, 3.357717, 1, 1, 1, 1, 1,
0.3861342, -1.183872, 2.190609, 1, 1, 1, 1, 1,
0.3868411, 0.4975972, 1.140967, 1, 1, 1, 1, 1,
0.3876119, 0.5576856, -0.670099, 1, 1, 1, 1, 1,
0.3922725, 1.247337, 0.4559334, 1, 1, 1, 1, 1,
0.392602, 1.11276, 1.181651, 1, 1, 1, 1, 1,
0.3929559, -0.422145, 2.593925, 1, 1, 1, 1, 1,
0.3961557, -0.2314081, 3.139697, 0, 0, 1, 1, 1,
0.3979892, 0.753862, -0.9533439, 1, 0, 0, 1, 1,
0.400754, 1.886412, 1.022743, 1, 0, 0, 1, 1,
0.4055637, 0.9169462, 0.1590589, 1, 0, 0, 1, 1,
0.4110482, 1.718773, 0.4357137, 1, 0, 0, 1, 1,
0.4114432, -0.07965698, 3.778346, 1, 0, 0, 1, 1,
0.4142158, -0.8745959, 2.254386, 0, 0, 0, 1, 1,
0.4148714, 0.131378, -0.7712774, 0, 0, 0, 1, 1,
0.4174007, 1.528284, 1.195847, 0, 0, 0, 1, 1,
0.4259338, 0.2451423, 1.076692, 0, 0, 0, 1, 1,
0.4330394, 1.085835, 0.5529094, 0, 0, 0, 1, 1,
0.4357545, -0.3795881, 2.812328, 0, 0, 0, 1, 1,
0.4362856, -0.5116923, 2.676835, 0, 0, 0, 1, 1,
0.4399137, 1.60859, 0.6527109, 1, 1, 1, 1, 1,
0.4404044, -0.07340438, 1.634337, 1, 1, 1, 1, 1,
0.4410997, 0.02493969, 0.7237579, 1, 1, 1, 1, 1,
0.4427108, 0.2303558, 0.772551, 1, 1, 1, 1, 1,
0.4450952, -1.785339, 3.620668, 1, 1, 1, 1, 1,
0.4507471, -1.098315, 2.210622, 1, 1, 1, 1, 1,
0.452943, -0.3783751, 2.583011, 1, 1, 1, 1, 1,
0.4533553, 0.06866311, 0.3916419, 1, 1, 1, 1, 1,
0.4544105, -0.9761811, 4.225409, 1, 1, 1, 1, 1,
0.4611145, -0.2642227, 4.390917, 1, 1, 1, 1, 1,
0.4643456, -0.6741464, 0.9900924, 1, 1, 1, 1, 1,
0.4645365, 0.9775084, -0.6437833, 1, 1, 1, 1, 1,
0.4646714, -0.03430784, 1.142409, 1, 1, 1, 1, 1,
0.4714301, 0.3325078, 3.192136, 1, 1, 1, 1, 1,
0.4727221, 1.0335, 1.532636, 1, 1, 1, 1, 1,
0.4786164, -0.7231537, 0.3249951, 0, 0, 1, 1, 1,
0.4845136, -1.33138, 3.313792, 1, 0, 0, 1, 1,
0.4850519, 0.6587639, 0.2993999, 1, 0, 0, 1, 1,
0.4852588, 0.7326308, 0.2518982, 1, 0, 0, 1, 1,
0.4870723, -0.8999802, 2.307066, 1, 0, 0, 1, 1,
0.4894103, -0.2941626, 0.6585694, 1, 0, 0, 1, 1,
0.50119, 0.0441955, 2.491248, 0, 0, 0, 1, 1,
0.5036179, -0.8818036, 3.224396, 0, 0, 0, 1, 1,
0.5048681, 0.1042372, 2.214894, 0, 0, 0, 1, 1,
0.5087336, -0.6756151, 2.517955, 0, 0, 0, 1, 1,
0.5254927, 0.2626217, -0.08089491, 0, 0, 0, 1, 1,
0.5330745, -1.052384, 2.351942, 0, 0, 0, 1, 1,
0.5336709, -0.8932599, 4.057289, 0, 0, 0, 1, 1,
0.5338936, 1.009532, -1.012825, 1, 1, 1, 1, 1,
0.5349758, -1.12138, 4.175375, 1, 1, 1, 1, 1,
0.5357202, 0.1583365, 0.2382115, 1, 1, 1, 1, 1,
0.5357471, -0.2566519, 3.433437, 1, 1, 1, 1, 1,
0.5359579, -0.1326663, 1.702294, 1, 1, 1, 1, 1,
0.5404925, -0.565348, 1.599542, 1, 1, 1, 1, 1,
0.5407631, 0.1514469, 1.045154, 1, 1, 1, 1, 1,
0.5475729, 0.7158428, 0.9196677, 1, 1, 1, 1, 1,
0.5496194, 1.432608, 2.241943, 1, 1, 1, 1, 1,
0.5511574, -2.020614, 2.698942, 1, 1, 1, 1, 1,
0.5519299, 0.3328345, -0.1227417, 1, 1, 1, 1, 1,
0.5571247, -0.08849075, 1.446637, 1, 1, 1, 1, 1,
0.5572333, 0.01868757, 2.535534, 1, 1, 1, 1, 1,
0.5598885, 0.07630518, 1.818547, 1, 1, 1, 1, 1,
0.5671659, 1.302074, 0.4795431, 1, 1, 1, 1, 1,
0.574625, 1.018557, 0.6445754, 0, 0, 1, 1, 1,
0.5755805, -1.494415, 2.504919, 1, 0, 0, 1, 1,
0.5768462, 1.494182, 1.286612, 1, 0, 0, 1, 1,
0.5799959, 0.06299064, 1.67134, 1, 0, 0, 1, 1,
0.5807413, -0.7222075, 2.340723, 1, 0, 0, 1, 1,
0.5812351, 0.601721, 1.601651, 1, 0, 0, 1, 1,
0.5834192, 1.161166, 0.7653855, 0, 0, 0, 1, 1,
0.5875222, -0.1414515, 1.994174, 0, 0, 0, 1, 1,
0.5886624, 0.3275932, 2.217846, 0, 0, 0, 1, 1,
0.5909508, -1.139004, 2.362481, 0, 0, 0, 1, 1,
0.5921956, -1.076655, 2.481829, 0, 0, 0, 1, 1,
0.5954959, -0.7658101, 4.020304, 0, 0, 0, 1, 1,
0.5999097, 1.621555, -0.3737191, 0, 0, 0, 1, 1,
0.6072556, 2.040954, -0.2040807, 1, 1, 1, 1, 1,
0.6072679, 0.510958, 2.206239, 1, 1, 1, 1, 1,
0.6105186, 0.7036695, 2.458143, 1, 1, 1, 1, 1,
0.6111857, -0.9927362, 2.792732, 1, 1, 1, 1, 1,
0.6143727, 0.4986828, 1.497683, 1, 1, 1, 1, 1,
0.6146101, 0.8459615, 0.279471, 1, 1, 1, 1, 1,
0.6229912, -2.867349, 3.784651, 1, 1, 1, 1, 1,
0.6236731, 0.1915216, 0.2660252, 1, 1, 1, 1, 1,
0.6312102, -0.3043693, 2.611356, 1, 1, 1, 1, 1,
0.6436288, -0.7274222, 4.165918, 1, 1, 1, 1, 1,
0.6462983, 0.08279718, 2.482233, 1, 1, 1, 1, 1,
0.6505081, -0.8919728, 2.825554, 1, 1, 1, 1, 1,
0.6509973, 0.769334, 0.9697464, 1, 1, 1, 1, 1,
0.651574, 0.6142278, 1.197047, 1, 1, 1, 1, 1,
0.6578749, -0.632112, 2.933907, 1, 1, 1, 1, 1,
0.6636384, 0.7587851, -0.1337117, 0, 0, 1, 1, 1,
0.6787337, -0.2445738, 2.317373, 1, 0, 0, 1, 1,
0.6856719, 1.432415, 0.6781715, 1, 0, 0, 1, 1,
0.6897064, -0.4690144, 3.988999, 1, 0, 0, 1, 1,
0.6924456, 0.6056339, 0.57803, 1, 0, 0, 1, 1,
0.6943452, -0.217369, -0.4070528, 1, 0, 0, 1, 1,
0.6959884, -0.2905758, 0.3711684, 0, 0, 0, 1, 1,
0.6969684, 0.8097056, 3.277582, 0, 0, 0, 1, 1,
0.6994393, 0.642428, 1.656358, 0, 0, 0, 1, 1,
0.7010798, 1.374686, 1.491452, 0, 0, 0, 1, 1,
0.7014611, 0.1075649, 1.684578, 0, 0, 0, 1, 1,
0.7020285, -0.09693982, 2.785271, 0, 0, 0, 1, 1,
0.7039542, 0.4458876, 1.133326, 0, 0, 0, 1, 1,
0.7076975, 0.4601851, 0.4286582, 1, 1, 1, 1, 1,
0.7141715, -0.3604314, 1.864209, 1, 1, 1, 1, 1,
0.7189746, -0.4236147, 1.988976, 1, 1, 1, 1, 1,
0.7226171, -0.4595297, 3.402133, 1, 1, 1, 1, 1,
0.7252722, -1.09354, 3.386628, 1, 1, 1, 1, 1,
0.7285515, 1.147639, 0.1999197, 1, 1, 1, 1, 1,
0.7336874, -0.7206646, 1.980195, 1, 1, 1, 1, 1,
0.7353989, -0.09410438, 2.043525, 1, 1, 1, 1, 1,
0.7399153, -0.09802067, 2.738117, 1, 1, 1, 1, 1,
0.7399979, -0.02201636, 1.576412, 1, 1, 1, 1, 1,
0.7410017, 1.619295, 0.3981972, 1, 1, 1, 1, 1,
0.7446471, 0.7628764, -0.2492925, 1, 1, 1, 1, 1,
0.7484313, -0.4238583, 2.68263, 1, 1, 1, 1, 1,
0.7575941, 2.481735, -1.300576, 1, 1, 1, 1, 1,
0.7610003, -1.127634, 3.625388, 1, 1, 1, 1, 1,
0.761151, 0.2070186, 0.700403, 0, 0, 1, 1, 1,
0.7648433, 0.5540364, 0.7803093, 1, 0, 0, 1, 1,
0.7702692, -0.5731165, 2.224728, 1, 0, 0, 1, 1,
0.7712439, 0.1232418, -1.15934, 1, 0, 0, 1, 1,
0.7758104, 0.1102623, 1.798983, 1, 0, 0, 1, 1,
0.7813601, 1.562323, 0.2608411, 1, 0, 0, 1, 1,
0.7829373, -1.139307, 2.665393, 0, 0, 0, 1, 1,
0.7915161, 2.796532, 0.883604, 0, 0, 0, 1, 1,
0.793011, 0.267963, 2.97463, 0, 0, 0, 1, 1,
0.7939567, -1.000097, 1.404885, 0, 0, 0, 1, 1,
0.7976661, 0.9522054, 2.497236, 0, 0, 0, 1, 1,
0.806327, 0.336568, 2.988671, 0, 0, 0, 1, 1,
0.8096956, 1.189722, 0.7213904, 0, 0, 0, 1, 1,
0.8266458, -0.07980385, 1.361887, 1, 1, 1, 1, 1,
0.8308985, 0.388679, 2.355646, 1, 1, 1, 1, 1,
0.8337371, 1.349711, 0.1143222, 1, 1, 1, 1, 1,
0.8351358, 1.567121, 0.2970462, 1, 1, 1, 1, 1,
0.847107, 0.006667949, 2.026242, 1, 1, 1, 1, 1,
0.8483336, -0.1445495, 1.177189, 1, 1, 1, 1, 1,
0.8557717, 0.7617443, 1.221241, 1, 1, 1, 1, 1,
0.8577994, 2.732606, -0.4007872, 1, 1, 1, 1, 1,
0.8598043, 0.9662862, 0.1695733, 1, 1, 1, 1, 1,
0.8646431, 0.3878981, 1.75843, 1, 1, 1, 1, 1,
0.8668272, -0.3090176, 2.770497, 1, 1, 1, 1, 1,
0.866843, 0.9297448, 0.08473277, 1, 1, 1, 1, 1,
0.8678076, 2.450719, -0.347565, 1, 1, 1, 1, 1,
0.8745839, 1.890248, -0.6291208, 1, 1, 1, 1, 1,
0.8801265, -0.4464854, 2.269038, 1, 1, 1, 1, 1,
0.8801735, 0.1653553, 0.3819384, 0, 0, 1, 1, 1,
0.8804317, 0.3398461, 1.393799, 1, 0, 0, 1, 1,
0.882071, -1.38951, 2.366057, 1, 0, 0, 1, 1,
0.8825871, 1.036827, 0.4514261, 1, 0, 0, 1, 1,
0.8827135, -0.6750371, 0.6865309, 1, 0, 0, 1, 1,
0.8834135, 0.300807, -0.3456575, 1, 0, 0, 1, 1,
0.8850347, -0.8668802, 4.309432, 0, 0, 0, 1, 1,
0.8879268, -1.033797, 2.479272, 0, 0, 0, 1, 1,
0.8890461, 0.03445742, 2.955208, 0, 0, 0, 1, 1,
0.894107, -0.9627569, 3.116816, 0, 0, 0, 1, 1,
0.8943324, 0.4811422, 0.6032593, 0, 0, 0, 1, 1,
0.8948721, -0.7522086, 2.750095, 0, 0, 0, 1, 1,
0.8952603, 0.02448773, -0.5442646, 0, 0, 0, 1, 1,
0.8958362, 0.9777821, 0.4046963, 1, 1, 1, 1, 1,
0.898867, 0.697056, 0.8392824, 1, 1, 1, 1, 1,
0.8997234, -0.0755097, 0.945695, 1, 1, 1, 1, 1,
0.9028812, -0.9428422, 1.648244, 1, 1, 1, 1, 1,
0.9055557, 1.887493, 0.404705, 1, 1, 1, 1, 1,
0.9122645, 0.04750077, 0.728589, 1, 1, 1, 1, 1,
0.92977, 0.8664608, 0.4488764, 1, 1, 1, 1, 1,
0.9308307, -0.4499499, 4.526354, 1, 1, 1, 1, 1,
0.936784, -0.5752588, 1.944986, 1, 1, 1, 1, 1,
0.9576777, -1.727056, 2.688184, 1, 1, 1, 1, 1,
0.958191, 1.276003, 1.419868, 1, 1, 1, 1, 1,
0.9618778, -0.7505618, 3.645447, 1, 1, 1, 1, 1,
0.9684355, 0.08571125, 0.5491757, 1, 1, 1, 1, 1,
0.9738796, -0.04377186, 1.418753, 1, 1, 1, 1, 1,
0.9748558, 0.7207746, -0.1373069, 1, 1, 1, 1, 1,
0.9784938, -0.8449625, 1.330217, 0, 0, 1, 1, 1,
0.9809023, -0.1811127, 1.619395, 1, 0, 0, 1, 1,
0.982951, -0.6143998, 1.83798, 1, 0, 0, 1, 1,
0.9848446, 0.1441082, 2.708452, 1, 0, 0, 1, 1,
0.9968199, -0.5300614, 1.948767, 1, 0, 0, 1, 1,
0.9994134, -1.052313, 0.3013834, 1, 0, 0, 1, 1,
1.001909, -0.6188107, 1.312391, 0, 0, 0, 1, 1,
1.009082, 1.476105, -0.2418194, 0, 0, 0, 1, 1,
1.014585, 0.262787, 0.5511492, 0, 0, 0, 1, 1,
1.014678, 2.273948, 0.6925758, 0, 0, 0, 1, 1,
1.020965, -0.9604877, 3.429411, 0, 0, 0, 1, 1,
1.023224, 0.2060921, 2.230017, 0, 0, 0, 1, 1,
1.028498, 0.197894, 0.899482, 0, 0, 0, 1, 1,
1.028676, 0.299554, 1.497955, 1, 1, 1, 1, 1,
1.040034, 0.3657223, 1.461476, 1, 1, 1, 1, 1,
1.050881, -0.5840914, 1.585931, 1, 1, 1, 1, 1,
1.052135, 1.954099, 0.459237, 1, 1, 1, 1, 1,
1.052234, -1.766476, 3.082288, 1, 1, 1, 1, 1,
1.054709, 0.2298194, 1.335055, 1, 1, 1, 1, 1,
1.056791, 1.083567, -1.270764, 1, 1, 1, 1, 1,
1.059034, 0.2170452, 2.443197, 1, 1, 1, 1, 1,
1.062098, 0.633412, 2.372638, 1, 1, 1, 1, 1,
1.066404, 0.9347686, 2.657127, 1, 1, 1, 1, 1,
1.067039, -0.5796734, 0.7473921, 1, 1, 1, 1, 1,
1.067626, 0.06611692, 0.9450976, 1, 1, 1, 1, 1,
1.072611, 1.975011, 1.624869, 1, 1, 1, 1, 1,
1.07635, 1.594213, -0.1638579, 1, 1, 1, 1, 1,
1.077849, 0.1198648, 1.245552, 1, 1, 1, 1, 1,
1.090075, 0.11509, 1.274998, 0, 0, 1, 1, 1,
1.091557, 0.1640015, 1.225719, 1, 0, 0, 1, 1,
1.094674, -0.2746987, 1.795232, 1, 0, 0, 1, 1,
1.099284, 0.4553249, 1.029077, 1, 0, 0, 1, 1,
1.100524, 0.5266222, 1.246022, 1, 0, 0, 1, 1,
1.104131, 3.373884, 1.450979, 1, 0, 0, 1, 1,
1.108642, -0.2466712, 2.50499, 0, 0, 0, 1, 1,
1.108778, 0.2590288, 1.182823, 0, 0, 0, 1, 1,
1.113076, 0.1854431, 1.749522, 0, 0, 0, 1, 1,
1.114092, -0.745617, 2.734182, 0, 0, 0, 1, 1,
1.124589, 0.1340561, 2.728978, 0, 0, 0, 1, 1,
1.126914, 0.2846306, 2.636891, 0, 0, 0, 1, 1,
1.131863, -2.48392, 2.878751, 0, 0, 0, 1, 1,
1.138924, -0.3032511, 1.800115, 1, 1, 1, 1, 1,
1.150396, 0.06888549, 1.871182, 1, 1, 1, 1, 1,
1.166596, -0.3523196, 1.014813, 1, 1, 1, 1, 1,
1.167415, 0.3427891, 1.406845, 1, 1, 1, 1, 1,
1.168188, -0.8956844, 1.884321, 1, 1, 1, 1, 1,
1.170473, -0.1121604, 0.8971491, 1, 1, 1, 1, 1,
1.171176, -0.2212889, 1.696211, 1, 1, 1, 1, 1,
1.17578, -0.2344286, 0.6750987, 1, 1, 1, 1, 1,
1.193318, -0.26846, 1.149902, 1, 1, 1, 1, 1,
1.193628, 0.6192163, 2.387151, 1, 1, 1, 1, 1,
1.193833, -0.6934976, 2.052117, 1, 1, 1, 1, 1,
1.197983, -0.07186323, 0.4682584, 1, 1, 1, 1, 1,
1.202016, -0.1215654, 0.6422858, 1, 1, 1, 1, 1,
1.205372, 0.003896257, 0.5997601, 1, 1, 1, 1, 1,
1.226385, 0.1279299, 1.974257, 1, 1, 1, 1, 1,
1.228717, -1.033107, 2.810691, 0, 0, 1, 1, 1,
1.231958, -1.412419, 2.926782, 1, 0, 0, 1, 1,
1.232292, -0.4766893, 1.08216, 1, 0, 0, 1, 1,
1.23278, 0.4414836, 1.134042, 1, 0, 0, 1, 1,
1.242938, 1.041642, -0.9150226, 1, 0, 0, 1, 1,
1.247608, -1.264146, 3.553181, 1, 0, 0, 1, 1,
1.247709, -0.3622527, -0.1856739, 0, 0, 0, 1, 1,
1.251215, 0.7682354, 2.314941, 0, 0, 0, 1, 1,
1.255137, -0.005278504, 2.01342, 0, 0, 0, 1, 1,
1.255787, 0.2850099, 1.461685, 0, 0, 0, 1, 1,
1.256619, -1.155848, 3.626981, 0, 0, 0, 1, 1,
1.257219, -0.403677, 3.255835, 0, 0, 0, 1, 1,
1.261065, 0.915877, -1.194505, 0, 0, 0, 1, 1,
1.27917, -0.8146667, 1.221976, 1, 1, 1, 1, 1,
1.28409, -1.244913, 3.165206, 1, 1, 1, 1, 1,
1.284285, -0.6885294, 1.5311, 1, 1, 1, 1, 1,
1.293173, 0.6106071, 0.7381049, 1, 1, 1, 1, 1,
1.29328, 0.1943226, 1.333108, 1, 1, 1, 1, 1,
1.300245, -0.4582742, 2.80789, 1, 1, 1, 1, 1,
1.302477, 1.015018, 1.392153, 1, 1, 1, 1, 1,
1.30307, -0.8572428, 0.6266818, 1, 1, 1, 1, 1,
1.310637, 1.227457, 3.245847, 1, 1, 1, 1, 1,
1.312266, -0.6487637, 2.227952, 1, 1, 1, 1, 1,
1.315792, -0.218993, 2.131838, 1, 1, 1, 1, 1,
1.324442, 0.2496344, 0.3994035, 1, 1, 1, 1, 1,
1.334494, -1.525797, 2.927106, 1, 1, 1, 1, 1,
1.336753, 0.1122583, 0.3376564, 1, 1, 1, 1, 1,
1.342991, -1.452488, 3.095597, 1, 1, 1, 1, 1,
1.362177, 1.174317, 0.8977159, 0, 0, 1, 1, 1,
1.367032, 0.7482913, 1.769215, 1, 0, 0, 1, 1,
1.370823, 0.9324129, 1.926414, 1, 0, 0, 1, 1,
1.372701, -0.4398265, -0.1337554, 1, 0, 0, 1, 1,
1.387977, -1.214671, 0.7297854, 1, 0, 0, 1, 1,
1.392467, -0.01495375, 3.220499, 1, 0, 0, 1, 1,
1.394538, 0.1221521, -0.7949495, 0, 0, 0, 1, 1,
1.411602, -0.5972008, 2.487202, 0, 0, 0, 1, 1,
1.417795, 0.6417328, 1.658042, 0, 0, 0, 1, 1,
1.43472, 1.682658, 0.08676108, 0, 0, 0, 1, 1,
1.449111, -0.6284978, 2.092982, 0, 0, 0, 1, 1,
1.456432, 0.2045993, 0.725934, 0, 0, 0, 1, 1,
1.456457, -0.7745628, 0.7430091, 0, 0, 0, 1, 1,
1.465214, -0.4753131, 2.234691, 1, 1, 1, 1, 1,
1.467603, -1.331768, 1.588528, 1, 1, 1, 1, 1,
1.475256, 1.420517, 1.454982, 1, 1, 1, 1, 1,
1.476077, -0.970489, 1.632609, 1, 1, 1, 1, 1,
1.480232, -1.812034, 1.663629, 1, 1, 1, 1, 1,
1.48311, -0.5813102, 2.005719, 1, 1, 1, 1, 1,
1.496726, 1.749891, 0.9463732, 1, 1, 1, 1, 1,
1.500959, 0.3290709, 0.6619392, 1, 1, 1, 1, 1,
1.516939, 0.005472454, 0.2868983, 1, 1, 1, 1, 1,
1.518812, 0.3084666, -0.1260598, 1, 1, 1, 1, 1,
1.524574, 1.766117, 1.411799, 1, 1, 1, 1, 1,
1.526058, 0.8097081, 1.354597, 1, 1, 1, 1, 1,
1.526079, -1.036567, 2.700751, 1, 1, 1, 1, 1,
1.544163, 0.9676309, 2.302469, 1, 1, 1, 1, 1,
1.556935, -0.1495061, 0.3566074, 1, 1, 1, 1, 1,
1.567904, 1.082943, 2.041619, 0, 0, 1, 1, 1,
1.585698, -0.3049556, -0.655074, 1, 0, 0, 1, 1,
1.587798, -1.282434, 2.193704, 1, 0, 0, 1, 1,
1.58816, 1.976557, 0.3351591, 1, 0, 0, 1, 1,
1.591732, -0.475301, 2.638937, 1, 0, 0, 1, 1,
1.595439, 2.741203, -0.1806753, 1, 0, 0, 1, 1,
1.605206, -0.01803707, 2.131896, 0, 0, 0, 1, 1,
1.615816, 0.8190972, 1.681587, 0, 0, 0, 1, 1,
1.623816, -1.577205, 2.340584, 0, 0, 0, 1, 1,
1.625688, 0.7005766, 0.9781557, 0, 0, 0, 1, 1,
1.646286, 1.119524, -0.2782274, 0, 0, 0, 1, 1,
1.651094, 0.01054482, 2.313142, 0, 0, 0, 1, 1,
1.654703, 0.07034121, 1.144591, 0, 0, 0, 1, 1,
1.658494, 2.312816, 0.9149315, 1, 1, 1, 1, 1,
1.660178, 1.048584, 1.313919, 1, 1, 1, 1, 1,
1.66735, -1.289664, 1.879104, 1, 1, 1, 1, 1,
1.67231, -0.04283021, 0.9876308, 1, 1, 1, 1, 1,
1.672426, 0.01224604, 1.045474, 1, 1, 1, 1, 1,
1.67532, -0.2311491, 1.565163, 1, 1, 1, 1, 1,
1.682232, -1.800868, 3.224214, 1, 1, 1, 1, 1,
1.688875, -0.7469448, 1.466016, 1, 1, 1, 1, 1,
1.701903, -0.6670454, 1.950243, 1, 1, 1, 1, 1,
1.703251, 1.138499, 0.4415155, 1, 1, 1, 1, 1,
1.715797, -0.8816829, 1.820106, 1, 1, 1, 1, 1,
1.723297, -1.493462, 0.5427856, 1, 1, 1, 1, 1,
1.731084, -0.1058475, 2.463116, 1, 1, 1, 1, 1,
1.759221, -0.3722169, 2.097274, 1, 1, 1, 1, 1,
1.770678, 0.9843987, 0.1524871, 1, 1, 1, 1, 1,
1.773702, 0.4419257, 2.418214, 0, 0, 1, 1, 1,
1.776034, -0.3945786, 3.014549, 1, 0, 0, 1, 1,
1.77834, -1.266646, 0.8875643, 1, 0, 0, 1, 1,
1.781756, -0.7702799, 1.253225, 1, 0, 0, 1, 1,
1.787163, -0.2575003, 1.475501, 1, 0, 0, 1, 1,
1.833762, 1.326219, 0.03469002, 1, 0, 0, 1, 1,
1.834888, -0.9039513, 3.527771, 0, 0, 0, 1, 1,
1.868941, -0.2988265, 1.849265, 0, 0, 0, 1, 1,
1.871743, 1.390295, 0.2430761, 0, 0, 0, 1, 1,
1.876872, -0.1091172, 2.102068, 0, 0, 0, 1, 1,
1.907248, 0.1975684, 0.9091713, 0, 0, 0, 1, 1,
1.917194, -0.9884238, 0.7712157, 0, 0, 0, 1, 1,
1.93514, 1.603759, 0.6251157, 0, 0, 0, 1, 1,
1.938725, 0.119219, 1.015352, 1, 1, 1, 1, 1,
1.956081, 0.2452933, 1.438824, 1, 1, 1, 1, 1,
1.969133, 0.9229763, 2.542077, 1, 1, 1, 1, 1,
2.013945, 0.493669, 1.211188, 1, 1, 1, 1, 1,
2.014875, 0.2213937, 2.704137, 1, 1, 1, 1, 1,
2.017082, -0.9386159, 2.855128, 1, 1, 1, 1, 1,
2.024002, 2.300675, 1.102168, 1, 1, 1, 1, 1,
2.107009, 1.010872, 1.427233, 1, 1, 1, 1, 1,
2.132037, 1.178985, -0.1017031, 1, 1, 1, 1, 1,
2.147633, -1.952816, 3.545389, 1, 1, 1, 1, 1,
2.153171, 0.859054, 0.3655978, 1, 1, 1, 1, 1,
2.160563, 0.5742373, 3.930803, 1, 1, 1, 1, 1,
2.182564, -0.4881429, 0.6359279, 1, 1, 1, 1, 1,
2.202483, -2.29669, 2.326475, 1, 1, 1, 1, 1,
2.217898, -0.04504975, 0.3378802, 1, 1, 1, 1, 1,
2.22116, 0.0354358, 0.5782481, 0, 0, 1, 1, 1,
2.277654, -0.04646467, -0.9295471, 1, 0, 0, 1, 1,
2.341262, 1.168832, -1.398381, 1, 0, 0, 1, 1,
2.361092, -0.374584, 2.26136, 1, 0, 0, 1, 1,
2.399726, 0.8148964, 1.536318, 1, 0, 0, 1, 1,
2.476438, 0.8354971, 1.155544, 1, 0, 0, 1, 1,
2.476784, -1.280829, 2.500825, 0, 0, 0, 1, 1,
2.484844, 0.1189241, 1.282573, 0, 0, 0, 1, 1,
2.48638, -0.7120197, 3.539205, 0, 0, 0, 1, 1,
2.493105, 0.06451603, 1.829998, 0, 0, 0, 1, 1,
2.508064, 0.02142452, 2.619638, 0, 0, 0, 1, 1,
2.531867, -1.002992, 3.389845, 0, 0, 0, 1, 1,
2.581318, -0.8854555, 3.012027, 0, 0, 0, 1, 1,
2.706873, -0.5563142, 1.714656, 1, 1, 1, 1, 1,
2.760143, 0.4150876, 1.890904, 1, 1, 1, 1, 1,
2.768785, 0.5632328, -0.2703164, 1, 1, 1, 1, 1,
2.833063, -0.3102541, 3.103018, 1, 1, 1, 1, 1,
3.144875, 1.667478, 2.242654, 1, 1, 1, 1, 1,
3.536811, 1.272631, -0.7389388, 1, 1, 1, 1, 1,
3.588777, 0.3046858, 1.112325, 1, 1, 1, 1, 1
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
var radius = 10.06501;
var distance = 35.35291;
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
mvMatrix.translate( 0.1423547, -0.5075839, -0.276706 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.35291);
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
