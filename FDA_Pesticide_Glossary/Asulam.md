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
-2.932601, -1.01497, -1.690137, 1, 0, 0, 1,
-2.924796, -1.075038, -0.491872, 1, 0.007843138, 0, 1,
-2.564663, 0.4593084, -0.03587849, 1, 0.01176471, 0, 1,
-2.461342, -1.068631, -2.181786, 1, 0.01960784, 0, 1,
-2.454123, 2.599413, -1.289151, 1, 0.02352941, 0, 1,
-2.400271, 0.05118584, -0.3061435, 1, 0.03137255, 0, 1,
-2.372968, -0.7979487, -0.601249, 1, 0.03529412, 0, 1,
-2.319787, -0.2562151, -0.8570076, 1, 0.04313726, 0, 1,
-2.184249, 1.662396, -0.2505608, 1, 0.04705882, 0, 1,
-2.15961, 2.406604, 0.1763512, 1, 0.05490196, 0, 1,
-2.152118, -1.751823, -2.134047, 1, 0.05882353, 0, 1,
-2.13508, 0.6424037, -3.105788, 1, 0.06666667, 0, 1,
-2.122104, -0.1000571, -1.23644, 1, 0.07058824, 0, 1,
-2.110724, -0.8322815, -3.322016, 1, 0.07843138, 0, 1,
-2.110286, 1.550514, -0.03623642, 1, 0.08235294, 0, 1,
-2.049771, 0.05933483, -0.3481782, 1, 0.09019608, 0, 1,
-2.005676, -0.08433728, -1.15018, 1, 0.09411765, 0, 1,
-1.998056, 0.2414651, -2.021097, 1, 0.1019608, 0, 1,
-1.990521, 1.11732, -2.030538, 1, 0.1098039, 0, 1,
-1.981298, -0.7099481, -2.168996, 1, 0.1137255, 0, 1,
-1.941173, -0.6284141, -1.458671, 1, 0.1215686, 0, 1,
-1.939162, -0.9988327, -3.256419, 1, 0.1254902, 0, 1,
-1.933308, 1.134329, -1.804058, 1, 0.1333333, 0, 1,
-1.922472, 1.13276, -3.082728, 1, 0.1372549, 0, 1,
-1.90535, 0.9003865, -0.1544124, 1, 0.145098, 0, 1,
-1.892163, 0.00604453, -2.805808, 1, 0.1490196, 0, 1,
-1.888042, -0.06683835, -2.323641, 1, 0.1568628, 0, 1,
-1.883991, -0.641839, -1.988424, 1, 0.1607843, 0, 1,
-1.838881, 0.2813903, -2.333192, 1, 0.1686275, 0, 1,
-1.819811, -1.020287, -2.99389, 1, 0.172549, 0, 1,
-1.817899, 0.9367603, -1.109328, 1, 0.1803922, 0, 1,
-1.811422, -0.218796, -0.3284744, 1, 0.1843137, 0, 1,
-1.787405, 1.427802, -0.631761, 1, 0.1921569, 0, 1,
-1.769332, 0.6953309, -0.1452464, 1, 0.1960784, 0, 1,
-1.765807, 1.088463, 2.261062, 1, 0.2039216, 0, 1,
-1.752736, -0.6144103, -2.879676, 1, 0.2117647, 0, 1,
-1.752608, 0.7203752, -0.6085597, 1, 0.2156863, 0, 1,
-1.748912, -1.187209, -2.092346, 1, 0.2235294, 0, 1,
-1.745921, 1.04057, -1.748912, 1, 0.227451, 0, 1,
-1.731591, -3.280067, -1.792304, 1, 0.2352941, 0, 1,
-1.712568, 0.7845747, -0.3345423, 1, 0.2392157, 0, 1,
-1.699599, 0.7631878, -1.745649, 1, 0.2470588, 0, 1,
-1.685704, 2.042177, -1.12885, 1, 0.2509804, 0, 1,
-1.674942, 0.2543029, -0.2509746, 1, 0.2588235, 0, 1,
-1.673395, -0.0268246, -0.7779069, 1, 0.2627451, 0, 1,
-1.649496, 0.4144181, -1.759221, 1, 0.2705882, 0, 1,
-1.642391, -1.074345, -1.971094, 1, 0.2745098, 0, 1,
-1.638008, -0.9981236, -1.274628, 1, 0.282353, 0, 1,
-1.617056, -0.4367325, -1.591285, 1, 0.2862745, 0, 1,
-1.607868, 1.252863, 0.02221195, 1, 0.2941177, 0, 1,
-1.594823, -0.05625117, -2.015574, 1, 0.3019608, 0, 1,
-1.579516, -0.5555323, -2.442744, 1, 0.3058824, 0, 1,
-1.54742, -0.7845966, -2.207892, 1, 0.3137255, 0, 1,
-1.54621, 0.7495014, -0.3619571, 1, 0.3176471, 0, 1,
-1.534482, -0.1076926, -1.484205, 1, 0.3254902, 0, 1,
-1.527139, 0.3812803, -2.62813, 1, 0.3294118, 0, 1,
-1.523287, 0.9850791, -1.58476, 1, 0.3372549, 0, 1,
-1.521901, -0.3583201, -1.46471, 1, 0.3411765, 0, 1,
-1.508554, -0.127241, -0.6945112, 1, 0.3490196, 0, 1,
-1.506844, 0.9430739, -3.035072, 1, 0.3529412, 0, 1,
-1.503449, -1.430815, -1.726156, 1, 0.3607843, 0, 1,
-1.492362, 0.2429587, -1.312661, 1, 0.3647059, 0, 1,
-1.47901, 1.154358, -1.125627, 1, 0.372549, 0, 1,
-1.472788, 0.8801919, -1.479143, 1, 0.3764706, 0, 1,
-1.470989, 0.4782773, -0.6379281, 1, 0.3843137, 0, 1,
-1.46518, -1.384123, -1.02713, 1, 0.3882353, 0, 1,
-1.459205, 0.5796857, -1.341064, 1, 0.3960784, 0, 1,
-1.458547, 1.272393, -1.970528, 1, 0.4039216, 0, 1,
-1.45557, -0.2398685, -2.641191, 1, 0.4078431, 0, 1,
-1.433487, 1.275196, -1.137537, 1, 0.4156863, 0, 1,
-1.432243, -0.03259403, -1.245149, 1, 0.4196078, 0, 1,
-1.430794, 0.497748, -2.02737, 1, 0.427451, 0, 1,
-1.427689, 0.7254635, -1.817052, 1, 0.4313726, 0, 1,
-1.410513, -2.598915, -3.44571, 1, 0.4392157, 0, 1,
-1.403868, -0.6444475, -1.210644, 1, 0.4431373, 0, 1,
-1.403032, -0.4305151, -2.921757, 1, 0.4509804, 0, 1,
-1.400241, -0.30481, -2.181723, 1, 0.454902, 0, 1,
-1.400176, -0.347337, -1.410284, 1, 0.4627451, 0, 1,
-1.399465, -1.26245, -3.71245, 1, 0.4666667, 0, 1,
-1.394543, 0.2540439, -1.160307, 1, 0.4745098, 0, 1,
-1.38652, 0.3392809, -2.289134, 1, 0.4784314, 0, 1,
-1.367648, -1.520338, -3.304939, 1, 0.4862745, 0, 1,
-1.344728, -0.4315268, -2.415303, 1, 0.4901961, 0, 1,
-1.342926, 0.8790779, -1.684474, 1, 0.4980392, 0, 1,
-1.34218, 0.466104, -2.677746, 1, 0.5058824, 0, 1,
-1.342168, 0.6600158, -0.1476132, 1, 0.509804, 0, 1,
-1.341642, -2.047289, -1.531317, 1, 0.5176471, 0, 1,
-1.331006, 0.6028044, -1.482306, 1, 0.5215687, 0, 1,
-1.322646, -1.180508, -2.073467, 1, 0.5294118, 0, 1,
-1.320764, -0.2025409, -3.456564, 1, 0.5333334, 0, 1,
-1.318594, -1.520194, -1.894563, 1, 0.5411765, 0, 1,
-1.315197, 1.839532, 1.563564, 1, 0.5450981, 0, 1,
-1.307287, -0.2385483, -2.370304, 1, 0.5529412, 0, 1,
-1.292886, 0.4813038, -1.400845, 1, 0.5568628, 0, 1,
-1.292185, -1.262748, -2.070958, 1, 0.5647059, 0, 1,
-1.27077, 0.9846203, -1.289292, 1, 0.5686275, 0, 1,
-1.269191, -0.7965199, -1.385402, 1, 0.5764706, 0, 1,
-1.268897, -1.296625, -2.287409, 1, 0.5803922, 0, 1,
-1.266165, 1.344954, -0.6122435, 1, 0.5882353, 0, 1,
-1.259943, 0.2433199, -1.41188, 1, 0.5921569, 0, 1,
-1.255856, -1.351648, -1.754582, 1, 0.6, 0, 1,
-1.252363, 0.6644919, -1.046321, 1, 0.6078432, 0, 1,
-1.247382, 0.0035963, -1.761629, 1, 0.6117647, 0, 1,
-1.245912, 1.077791, 0.01833446, 1, 0.6196079, 0, 1,
-1.245645, 0.5702036, -0.4860512, 1, 0.6235294, 0, 1,
-1.237791, -0.5335701, -2.243136, 1, 0.6313726, 0, 1,
-1.236767, 2.276239, 0.05974016, 1, 0.6352941, 0, 1,
-1.23355, -0.03067271, -0.7951629, 1, 0.6431373, 0, 1,
-1.228059, 0.6887086, -1.047915, 1, 0.6470588, 0, 1,
-1.221641, 1.362018, -1.437066, 1, 0.654902, 0, 1,
-1.213226, -0.8183333, -1.607615, 1, 0.6588235, 0, 1,
-1.21269, 1.399027, 0.135427, 1, 0.6666667, 0, 1,
-1.210543, -1.234392, -2.095926, 1, 0.6705883, 0, 1,
-1.201934, -1.405658, -2.910075, 1, 0.6784314, 0, 1,
-1.199237, 1.360014, -0.9666251, 1, 0.682353, 0, 1,
-1.177789, 0.3260911, -2.038926, 1, 0.6901961, 0, 1,
-1.171809, 0.5885478, -1.332278, 1, 0.6941177, 0, 1,
-1.160301, -0.7030152, -2.703469, 1, 0.7019608, 0, 1,
-1.159176, 1.440001, -0.3792291, 1, 0.7098039, 0, 1,
-1.152095, 1.462212, 0.1206924, 1, 0.7137255, 0, 1,
-1.150563, -0.3678506, -2.346123, 1, 0.7215686, 0, 1,
-1.145736, 1.321073, -0.7357961, 1, 0.7254902, 0, 1,
-1.140452, -0.03954002, -2.519539, 1, 0.7333333, 0, 1,
-1.136191, 0.2144624, -1.429559, 1, 0.7372549, 0, 1,
-1.134443, -0.2135859, -1.357823, 1, 0.7450981, 0, 1,
-1.125623, 0.2849678, -0.1533275, 1, 0.7490196, 0, 1,
-1.121532, 0.3461791, -1.028309, 1, 0.7568628, 0, 1,
-1.112526, 1.884164, -0.002983103, 1, 0.7607843, 0, 1,
-1.100603, -0.4815296, 0.02177364, 1, 0.7686275, 0, 1,
-1.096579, -0.819643, -3.648382, 1, 0.772549, 0, 1,
-1.093663, -2.470623, -4.743379, 1, 0.7803922, 0, 1,
-1.088363, 0.6950813, 0.4415135, 1, 0.7843137, 0, 1,
-1.087294, 1.166771, -0.6671153, 1, 0.7921569, 0, 1,
-1.086212, 0.03238957, -0.519823, 1, 0.7960784, 0, 1,
-1.081983, -1.041195, -0.4051034, 1, 0.8039216, 0, 1,
-1.080215, 0.1756571, -1.486205, 1, 0.8117647, 0, 1,
-1.075669, 0.2040041, -1.848422, 1, 0.8156863, 0, 1,
-1.074461, 0.3292186, -1.761599, 1, 0.8235294, 0, 1,
-1.073217, 1.153887, -0.1710656, 1, 0.827451, 0, 1,
-1.070744, 0.8827389, -0.217514, 1, 0.8352941, 0, 1,
-1.069379, 0.8243761, -1.525164, 1, 0.8392157, 0, 1,
-1.066875, -0.4127854, -1.356426, 1, 0.8470588, 0, 1,
-1.057616, -0.243766, -3.579526, 1, 0.8509804, 0, 1,
-1.053589, 0.6516407, 0.1547118, 1, 0.8588235, 0, 1,
-1.051068, 0.05798038, -1.438673, 1, 0.8627451, 0, 1,
-1.050574, -2.054617, -3.534574, 1, 0.8705882, 0, 1,
-1.050204, -1.390187, -2.500442, 1, 0.8745098, 0, 1,
-1.049168, 0.3458574, -3.557988, 1, 0.8823529, 0, 1,
-1.047942, 0.7958316, -0.3506377, 1, 0.8862745, 0, 1,
-1.046534, 0.2924016, -0.6213683, 1, 0.8941177, 0, 1,
-1.03713, -0.986664, -2.256683, 1, 0.8980392, 0, 1,
-1.036926, -0.3771859, -2.375782, 1, 0.9058824, 0, 1,
-1.031593, 0.8514506, 0.3984648, 1, 0.9137255, 0, 1,
-1.00813, 0.2404429, 1.245588, 1, 0.9176471, 0, 1,
-1.005124, 2.602626, 1.709937, 1, 0.9254902, 0, 1,
-0.9963184, 0.4519404, -3.440738, 1, 0.9294118, 0, 1,
-0.9938436, 1.336784, -1.182789, 1, 0.9372549, 0, 1,
-0.9908917, 0.3832663, -1.648452, 1, 0.9411765, 0, 1,
-0.9893138, -1.12444, -0.9884419, 1, 0.9490196, 0, 1,
-0.9720284, 1.212327, 0.1070218, 1, 0.9529412, 0, 1,
-0.9673499, -1.657237, -4.116108, 1, 0.9607843, 0, 1,
-0.960946, 0.4869529, 0.6196593, 1, 0.9647059, 0, 1,
-0.9557937, 0.3113084, -2.673956, 1, 0.972549, 0, 1,
-0.9557475, -1.765938, -2.175358, 1, 0.9764706, 0, 1,
-0.9535904, -0.5514523, -1.341422, 1, 0.9843137, 0, 1,
-0.9514305, 0.4607703, -1.218723, 1, 0.9882353, 0, 1,
-0.9488954, -1.30189, -2.9872, 1, 0.9960784, 0, 1,
-0.946752, -1.531184, -4.059195, 0.9960784, 1, 0, 1,
-0.9421136, 0.5641212, -0.8345385, 0.9921569, 1, 0, 1,
-0.9237631, 0.4490827, -2.346326, 0.9843137, 1, 0, 1,
-0.9209638, -0.2241368, -1.91596, 0.9803922, 1, 0, 1,
-0.918525, 1.022237, -1.955495, 0.972549, 1, 0, 1,
-0.9179397, -1.661605, -2.600188, 0.9686275, 1, 0, 1,
-0.9107084, 1.621459, 0.6490084, 0.9607843, 1, 0, 1,
-0.9077715, 0.6504733, -0.150575, 0.9568627, 1, 0, 1,
-0.9072412, -0.07343075, -1.492948, 0.9490196, 1, 0, 1,
-0.8985959, -0.8640661, -2.394805, 0.945098, 1, 0, 1,
-0.8972262, -1.138468, -1.701536, 0.9372549, 1, 0, 1,
-0.8954037, 0.8154026, -1.357361, 0.9333333, 1, 0, 1,
-0.871601, -1.893978, -2.304771, 0.9254902, 1, 0, 1,
-0.8685024, 0.04190674, -1.453784, 0.9215686, 1, 0, 1,
-0.8674741, 0.990123, -1.742186, 0.9137255, 1, 0, 1,
-0.8609709, -0.2408085, -4.350718, 0.9098039, 1, 0, 1,
-0.8545871, -0.4225586, -0.1946332, 0.9019608, 1, 0, 1,
-0.8525491, -0.4511068, -0.4646653, 0.8941177, 1, 0, 1,
-0.8474798, -2.737642, -1.34597, 0.8901961, 1, 0, 1,
-0.8423818, -1.156216, -2.153367, 0.8823529, 1, 0, 1,
-0.841849, -0.648589, -2.304384, 0.8784314, 1, 0, 1,
-0.8402599, 0.4211188, -1.413237, 0.8705882, 1, 0, 1,
-0.8372465, 1.307876, 1.415829, 0.8666667, 1, 0, 1,
-0.8359041, 0.08865567, -2.35717, 0.8588235, 1, 0, 1,
-0.8339427, 1.000269, 0.9348519, 0.854902, 1, 0, 1,
-0.8337498, -1.897597, -1.798442, 0.8470588, 1, 0, 1,
-0.8331642, 1.182329, -1.519443, 0.8431373, 1, 0, 1,
-0.8317107, 0.3830033, -2.627254, 0.8352941, 1, 0, 1,
-0.8277894, -1.037745, -1.980359, 0.8313726, 1, 0, 1,
-0.8259975, 1.035274, -1.625357, 0.8235294, 1, 0, 1,
-0.8256021, -0.6790175, -2.22673, 0.8196079, 1, 0, 1,
-0.8247221, 0.2687021, -0.4526554, 0.8117647, 1, 0, 1,
-0.8239538, 1.296421, -2.608068, 0.8078431, 1, 0, 1,
-0.8229068, -0.8107819, -2.910407, 0.8, 1, 0, 1,
-0.8200595, -0.9607899, -3.326383, 0.7921569, 1, 0, 1,
-0.8171247, 0.6691756, -1.160856, 0.7882353, 1, 0, 1,
-0.7934136, 0.8584078, -2.206891, 0.7803922, 1, 0, 1,
-0.7916716, -0.03651283, -1.870362, 0.7764706, 1, 0, 1,
-0.7913176, -0.3797992, -1.637381, 0.7686275, 1, 0, 1,
-0.7873206, -0.2674599, -1.215339, 0.7647059, 1, 0, 1,
-0.7870977, -1.763129, -2.409041, 0.7568628, 1, 0, 1,
-0.7860507, 1.603129, -0.8673528, 0.7529412, 1, 0, 1,
-0.7783746, -0.5311319, -1.975419, 0.7450981, 1, 0, 1,
-0.7736043, -0.296124, -1.896428, 0.7411765, 1, 0, 1,
-0.7733243, -0.3099875, -3.145687, 0.7333333, 1, 0, 1,
-0.7731033, -0.710177, -2.253741, 0.7294118, 1, 0, 1,
-0.7712457, 0.2711733, -1.64418, 0.7215686, 1, 0, 1,
-0.7711833, -0.04033885, -3.040474, 0.7176471, 1, 0, 1,
-0.7681601, -1.416543, -2.63152, 0.7098039, 1, 0, 1,
-0.7670157, 1.42932, 0.877555, 0.7058824, 1, 0, 1,
-0.7513276, -1.501061, -4.043862, 0.6980392, 1, 0, 1,
-0.735368, -0.2605655, -0.9904347, 0.6901961, 1, 0, 1,
-0.7257482, 1.300327, 1.225622, 0.6862745, 1, 0, 1,
-0.7256951, 0.3466848, -1.304634, 0.6784314, 1, 0, 1,
-0.7209929, 0.9949639, -2.120699, 0.6745098, 1, 0, 1,
-0.7179921, -0.15695, -1.352614, 0.6666667, 1, 0, 1,
-0.7159501, -0.1954965, -1.410333, 0.6627451, 1, 0, 1,
-0.7037155, -0.440785, -0.8252743, 0.654902, 1, 0, 1,
-0.7019423, -1.246239, -1.790101, 0.6509804, 1, 0, 1,
-0.6964217, -1.139899, -3.305765, 0.6431373, 1, 0, 1,
-0.695082, -1.213731, -1.572077, 0.6392157, 1, 0, 1,
-0.6931657, 0.802734, -1.255567, 0.6313726, 1, 0, 1,
-0.6895944, 0.6641002, 0.4444889, 0.627451, 1, 0, 1,
-0.6861436, 1.060616, 1.525205, 0.6196079, 1, 0, 1,
-0.6779213, -0.5972101, -2.896082, 0.6156863, 1, 0, 1,
-0.6697648, -1.738878, -4.455636, 0.6078432, 1, 0, 1,
-0.6657727, -0.7383392, -2.527676, 0.6039216, 1, 0, 1,
-0.6629273, -0.1815168, -0.5436635, 0.5960785, 1, 0, 1,
-0.6576971, -0.5188749, -3.316796, 0.5882353, 1, 0, 1,
-0.6565415, -0.6958491, -1.087636, 0.5843138, 1, 0, 1,
-0.6550542, -0.3687817, -1.500977, 0.5764706, 1, 0, 1,
-0.6517373, 0.2459795, 0.3819953, 0.572549, 1, 0, 1,
-0.6493109, 0.03565891, -1.113596, 0.5647059, 1, 0, 1,
-0.6468126, 0.1855047, -1.3568, 0.5607843, 1, 0, 1,
-0.6465997, 0.4364983, 1.173239, 0.5529412, 1, 0, 1,
-0.6463315, 0.7683166, -0.7599996, 0.5490196, 1, 0, 1,
-0.6377333, 0.09755187, -2.756037, 0.5411765, 1, 0, 1,
-0.6367892, -0.1636184, -2.612517, 0.5372549, 1, 0, 1,
-0.6345818, 1.284598, -1.924055, 0.5294118, 1, 0, 1,
-0.632926, -0.04286931, -0.1665461, 0.5254902, 1, 0, 1,
-0.6307769, 1.448191, -1.423339, 0.5176471, 1, 0, 1,
-0.6288437, 0.9160044, -0.01668865, 0.5137255, 1, 0, 1,
-0.6263008, -1.14071, -1.818654, 0.5058824, 1, 0, 1,
-0.6250186, 0.7608023, -0.06466825, 0.5019608, 1, 0, 1,
-0.6147002, 1.553733, -0.06724302, 0.4941176, 1, 0, 1,
-0.6038153, 0.1480632, -1.359077, 0.4862745, 1, 0, 1,
-0.5996078, -0.01834787, -1.920732, 0.4823529, 1, 0, 1,
-0.5919683, 1.357349, -0.4550876, 0.4745098, 1, 0, 1,
-0.5869901, -1.379115, -1.845596, 0.4705882, 1, 0, 1,
-0.5859963, -0.9331461, -1.265964, 0.4627451, 1, 0, 1,
-0.5828646, -0.8785186, -2.59874, 0.4588235, 1, 0, 1,
-0.5782719, 1.481737, -0.8442783, 0.4509804, 1, 0, 1,
-0.5768625, -1.249531, -2.739011, 0.4470588, 1, 0, 1,
-0.5683742, 0.1768981, -1.071845, 0.4392157, 1, 0, 1,
-0.564629, -2.303928, -2.253228, 0.4352941, 1, 0, 1,
-0.5639635, -1.214416, -3.428197, 0.427451, 1, 0, 1,
-0.5635781, -0.3114814, -0.9884683, 0.4235294, 1, 0, 1,
-0.5633639, 0.1537821, -1.710022, 0.4156863, 1, 0, 1,
-0.5545083, -0.3450097, -2.571473, 0.4117647, 1, 0, 1,
-0.5540496, -0.453203, -1.278794, 0.4039216, 1, 0, 1,
-0.5524576, 0.6845616, 0.5985067, 0.3960784, 1, 0, 1,
-0.5476545, -0.06044749, -0.9434169, 0.3921569, 1, 0, 1,
-0.5463198, 0.8611931, -1.229324, 0.3843137, 1, 0, 1,
-0.5450763, 0.8987439, -1.235839, 0.3803922, 1, 0, 1,
-0.5446678, -0.1774122, -1.910399, 0.372549, 1, 0, 1,
-0.5381463, -0.8752928, -1.333606, 0.3686275, 1, 0, 1,
-0.5329732, 0.3444998, -1.523735, 0.3607843, 1, 0, 1,
-0.5308496, -1.242162, -2.071635, 0.3568628, 1, 0, 1,
-0.5277557, 0.3932452, 0.4571995, 0.3490196, 1, 0, 1,
-0.5258791, -2.318578, -2.271159, 0.345098, 1, 0, 1,
-0.5156655, -1.084075, -3.219393, 0.3372549, 1, 0, 1,
-0.513759, -0.05084692, -2.118554, 0.3333333, 1, 0, 1,
-0.5105395, 0.03149738, -0.4836109, 0.3254902, 1, 0, 1,
-0.5096917, 0.2017714, -2.105098, 0.3215686, 1, 0, 1,
-0.4973088, -0.6571159, -1.508496, 0.3137255, 1, 0, 1,
-0.4959221, 0.4033116, -0.7319478, 0.3098039, 1, 0, 1,
-0.4949144, 0.1120401, -1.902663, 0.3019608, 1, 0, 1,
-0.4935271, 0.3823235, -1.129911, 0.2941177, 1, 0, 1,
-0.488532, -0.08894002, -0.4729605, 0.2901961, 1, 0, 1,
-0.4844744, 0.5448853, -1.61618, 0.282353, 1, 0, 1,
-0.4836287, 0.1885851, -0.2568633, 0.2784314, 1, 0, 1,
-0.4822507, 1.106216, 1.020979, 0.2705882, 1, 0, 1,
-0.4785508, 2.12172, -1.848187, 0.2666667, 1, 0, 1,
-0.4748852, 1.110176, -0.5356919, 0.2588235, 1, 0, 1,
-0.4734883, -1.069774, -0.705658, 0.254902, 1, 0, 1,
-0.4731811, 0.7179928, -0.4250314, 0.2470588, 1, 0, 1,
-0.461722, 1.222789, 0.2745742, 0.2431373, 1, 0, 1,
-0.4613981, 0.6129591, 0.4663394, 0.2352941, 1, 0, 1,
-0.4594334, -0.1253909, -2.875784, 0.2313726, 1, 0, 1,
-0.4569926, -0.07692639, -1.835955, 0.2235294, 1, 0, 1,
-0.4552739, -0.2694222, -2.466341, 0.2196078, 1, 0, 1,
-0.4517532, 1.252293, -1.999051, 0.2117647, 1, 0, 1,
-0.4514485, -0.460574, -1.623511, 0.2078431, 1, 0, 1,
-0.4480921, 1.386173, -0.4968351, 0.2, 1, 0, 1,
-0.4456955, -0.2544844, -3.077745, 0.1921569, 1, 0, 1,
-0.4450023, -0.1577314, -3.050312, 0.1882353, 1, 0, 1,
-0.4343388, -1.340689, -2.672396, 0.1803922, 1, 0, 1,
-0.4331044, 0.1324462, -2.054234, 0.1764706, 1, 0, 1,
-0.431955, -0.6604786, -3.23616, 0.1686275, 1, 0, 1,
-0.429751, -0.2290828, -1.523557, 0.1647059, 1, 0, 1,
-0.4284589, 0.3061541, -1.904572, 0.1568628, 1, 0, 1,
-0.4279559, -2.917383, -4.326077, 0.1529412, 1, 0, 1,
-0.4275123, -0.5284729, -1.971242, 0.145098, 1, 0, 1,
-0.4272658, -0.4305776, -4.178745, 0.1411765, 1, 0, 1,
-0.4269872, 0.2772879, -1.681537, 0.1333333, 1, 0, 1,
-0.4269586, 0.6608232, -0.519016, 0.1294118, 1, 0, 1,
-0.4247075, -0.01436437, -1.733089, 0.1215686, 1, 0, 1,
-0.4228612, -0.3060351, -4.874702, 0.1176471, 1, 0, 1,
-0.4208623, -0.2333304, -3.775514, 0.1098039, 1, 0, 1,
-0.4202754, -1.089275, -2.760092, 0.1058824, 1, 0, 1,
-0.4183176, 0.5456136, -1.422815, 0.09803922, 1, 0, 1,
-0.4179727, -0.5312924, -0.3716144, 0.09019608, 1, 0, 1,
-0.4081136, 0.7590863, -0.6591269, 0.08627451, 1, 0, 1,
-0.4039856, 1.663386, 0.8377741, 0.07843138, 1, 0, 1,
-0.4018169, -0.4439036, -0.3026803, 0.07450981, 1, 0, 1,
-0.4001835, 0.2938782, -1.487817, 0.06666667, 1, 0, 1,
-0.3963974, 0.8377924, 1.144759, 0.0627451, 1, 0, 1,
-0.3948068, 0.3559191, -0.8272678, 0.05490196, 1, 0, 1,
-0.3941958, 0.9437092, -0.6682662, 0.05098039, 1, 0, 1,
-0.3873437, -0.7056291, -3.167018, 0.04313726, 1, 0, 1,
-0.3870441, 0.02642186, -1.989679, 0.03921569, 1, 0, 1,
-0.3860475, -0.778624, -1.687235, 0.03137255, 1, 0, 1,
-0.3852135, -2.923699, -3.533541, 0.02745098, 1, 0, 1,
-0.3839826, -0.8131833, -2.560715, 0.01960784, 1, 0, 1,
-0.3791515, -0.7321386, -2.52243, 0.01568628, 1, 0, 1,
-0.3720956, 0.4180816, 0.02650382, 0.007843138, 1, 0, 1,
-0.3720022, -0.6853175, -3.230923, 0.003921569, 1, 0, 1,
-0.3718278, 0.001439629, -1.514953, 0, 1, 0.003921569, 1,
-0.3685712, -0.8388345, -2.250405, 0, 1, 0.01176471, 1,
-0.366434, 0.5173861, -1.908875, 0, 1, 0.01568628, 1,
-0.3656813, -0.5824353, -1.086447, 0, 1, 0.02352941, 1,
-0.3623769, -1.333678, -1.582082, 0, 1, 0.02745098, 1,
-0.3605147, -0.2076913, -2.170292, 0, 1, 0.03529412, 1,
-0.3578142, 1.617545, -0.1346692, 0, 1, 0.03921569, 1,
-0.3555463, -1.203496, -3.900197, 0, 1, 0.04705882, 1,
-0.3539861, 2.883573, -2.433054, 0, 1, 0.05098039, 1,
-0.3483085, -0.09693245, -2.013728, 0, 1, 0.05882353, 1,
-0.342391, -0.359538, -2.781988, 0, 1, 0.0627451, 1,
-0.3408299, 0.7764193, 0.05078874, 0, 1, 0.07058824, 1,
-0.3401009, -0.03410161, -2.136467, 0, 1, 0.07450981, 1,
-0.3386969, 0.8828753, -0.2550834, 0, 1, 0.08235294, 1,
-0.3350299, -0.003008622, -2.181343, 0, 1, 0.08627451, 1,
-0.3333161, 0.4739598, -0.5912611, 0, 1, 0.09411765, 1,
-0.3310398, 0.3153412, -1.33533, 0, 1, 0.1019608, 1,
-0.330686, -0.1352514, -1.984939, 0, 1, 0.1058824, 1,
-0.3249229, -0.5157933, -2.633115, 0, 1, 0.1137255, 1,
-0.3236316, -1.883127, -2.67889, 0, 1, 0.1176471, 1,
-0.3222121, -1.756673, -3.082484, 0, 1, 0.1254902, 1,
-0.3160321, -1.507395, -3.761757, 0, 1, 0.1294118, 1,
-0.3101746, 0.7661708, -1.093836, 0, 1, 0.1372549, 1,
-0.3079184, -0.4374585, -2.135313, 0, 1, 0.1411765, 1,
-0.3069133, 1.042283, -1.393459, 0, 1, 0.1490196, 1,
-0.3022967, -0.0296861, -3.652804, 0, 1, 0.1529412, 1,
-0.3015363, 0.8220783, -1.443438, 0, 1, 0.1607843, 1,
-0.2931162, -1.011503, -3.421285, 0, 1, 0.1647059, 1,
-0.2923491, -0.1871068, -0.876238, 0, 1, 0.172549, 1,
-0.2916287, -1.393489, -2.607896, 0, 1, 0.1764706, 1,
-0.2911265, -0.2883335, -1.194028, 0, 1, 0.1843137, 1,
-0.2884942, -0.6697769, -3.163081, 0, 1, 0.1882353, 1,
-0.2775132, 1.267907, 0.2925394, 0, 1, 0.1960784, 1,
-0.2771073, -0.07844392, -3.107788, 0, 1, 0.2039216, 1,
-0.2766449, 0.01114675, -0.4848987, 0, 1, 0.2078431, 1,
-0.274595, -0.4112396, -0.3691719, 0, 1, 0.2156863, 1,
-0.2729284, -0.9766986, -3.020175, 0, 1, 0.2196078, 1,
-0.2704748, -0.7950644, -3.880093, 0, 1, 0.227451, 1,
-0.2657207, -0.07068203, -1.454425, 0, 1, 0.2313726, 1,
-0.2652244, 0.3470184, -0.4722714, 0, 1, 0.2392157, 1,
-0.2557478, -1.269135, -3.695581, 0, 1, 0.2431373, 1,
-0.253865, 0.872902, 1.871464, 0, 1, 0.2509804, 1,
-0.2530488, 0.3951832, -1.142487, 0, 1, 0.254902, 1,
-0.2511309, 0.1827025, -2.877316, 0, 1, 0.2627451, 1,
-0.2469262, 0.8208176, -1.017988, 0, 1, 0.2666667, 1,
-0.24195, 0.5305488, 0.4449018, 0, 1, 0.2745098, 1,
-0.241079, 0.2261975, -0.8130811, 0, 1, 0.2784314, 1,
-0.238259, -0.3164479, -4.315403, 0, 1, 0.2862745, 1,
-0.2335641, -1.113736, -0.9126888, 0, 1, 0.2901961, 1,
-0.2316905, -0.8427337, -2.378327, 0, 1, 0.2980392, 1,
-0.2230652, -1.903311, -3.328017, 0, 1, 0.3058824, 1,
-0.2223723, 0.4375723, 0.7987277, 0, 1, 0.3098039, 1,
-0.2215988, -1.793779, -3.464854, 0, 1, 0.3176471, 1,
-0.2215951, -0.3140395, -1.114472, 0, 1, 0.3215686, 1,
-0.2181701, 1.28041, -0.2783877, 0, 1, 0.3294118, 1,
-0.2154959, -0.07556349, -1.502652, 0, 1, 0.3333333, 1,
-0.2114043, 0.4511677, -0.7731844, 0, 1, 0.3411765, 1,
-0.2100055, -0.2460072, -3.604281, 0, 1, 0.345098, 1,
-0.2085309, 0.03633764, -2.160885, 0, 1, 0.3529412, 1,
-0.2075653, -0.1354175, -2.904483, 0, 1, 0.3568628, 1,
-0.203767, -2.030136, -2.149189, 0, 1, 0.3647059, 1,
-0.1998369, -0.9570369, -2.689974, 0, 1, 0.3686275, 1,
-0.1976661, -1.178224, -3.344401, 0, 1, 0.3764706, 1,
-0.1950964, -1.025488, -1.866522, 0, 1, 0.3803922, 1,
-0.1876417, -1.01703, -4.03914, 0, 1, 0.3882353, 1,
-0.186584, 1.900982, 0.1391253, 0, 1, 0.3921569, 1,
-0.1831691, -2.60568, -4.030755, 0, 1, 0.4, 1,
-0.1793246, 2.120341, 0.1582953, 0, 1, 0.4078431, 1,
-0.1701221, -0.490594, -2.414084, 0, 1, 0.4117647, 1,
-0.1682828, -0.2495276, -1.030713, 0, 1, 0.4196078, 1,
-0.1664304, -1.856538, -2.638652, 0, 1, 0.4235294, 1,
-0.1637058, -0.1679227, -2.967885, 0, 1, 0.4313726, 1,
-0.1607069, -0.5172583, -1.119299, 0, 1, 0.4352941, 1,
-0.1601378, 0.9965879, 1.751131, 0, 1, 0.4431373, 1,
-0.1486509, 0.8925768, -0.1361171, 0, 1, 0.4470588, 1,
-0.1475466, -0.06765029, -1.738729, 0, 1, 0.454902, 1,
-0.146476, 0.671071, -1.24245, 0, 1, 0.4588235, 1,
-0.1441001, -2.702964, -0.4405293, 0, 1, 0.4666667, 1,
-0.1440094, 2.125804, 1.048513, 0, 1, 0.4705882, 1,
-0.1421447, -0.6448225, -2.350489, 0, 1, 0.4784314, 1,
-0.1412966, 1.937894, -0.9752671, 0, 1, 0.4823529, 1,
-0.1387153, 0.2822012, -0.8105388, 0, 1, 0.4901961, 1,
-0.1344391, -0.381654, -3.655072, 0, 1, 0.4941176, 1,
-0.1330917, -2.101994, -4.056589, 0, 1, 0.5019608, 1,
-0.1326586, 2.17621, 1.231297, 0, 1, 0.509804, 1,
-0.1308305, -1.423053, -2.605994, 0, 1, 0.5137255, 1,
-0.1283255, -1.661557, -4.094459, 0, 1, 0.5215687, 1,
-0.1278842, -1.386883, -3.79559, 0, 1, 0.5254902, 1,
-0.1229805, -0.2740406, -2.430454, 0, 1, 0.5333334, 1,
-0.1228947, 0.8261492, -1.31988, 0, 1, 0.5372549, 1,
-0.1195616, -0.9202283, -3.192221, 0, 1, 0.5450981, 1,
-0.1193707, -0.1178086, -3.293469, 0, 1, 0.5490196, 1,
-0.1128944, -0.06722897, -2.261519, 0, 1, 0.5568628, 1,
-0.111774, -0.03437953, -1.714028, 0, 1, 0.5607843, 1,
-0.1093608, -1.053272, -3.553953, 0, 1, 0.5686275, 1,
-0.1070839, -1.002703, -4.039187, 0, 1, 0.572549, 1,
-0.1057712, -0.382567, -1.87076, 0, 1, 0.5803922, 1,
-0.09946401, -0.06088199, -1.96841, 0, 1, 0.5843138, 1,
-0.09782468, -1.782078, -3.643065, 0, 1, 0.5921569, 1,
-0.09705132, 0.08091564, -0.6344574, 0, 1, 0.5960785, 1,
-0.0960268, 1.928239, 0.5637717, 0, 1, 0.6039216, 1,
-0.09588262, -0.7761394, -3.32752, 0, 1, 0.6117647, 1,
-0.09540041, -1.347905, -2.281991, 0, 1, 0.6156863, 1,
-0.09335203, -0.09800178, -2.574773, 0, 1, 0.6235294, 1,
-0.0923005, 0.5760971, 0.6917801, 0, 1, 0.627451, 1,
-0.09045151, 0.5568219, -0.06666984, 0, 1, 0.6352941, 1,
-0.08720401, -0.2511053, -2.99079, 0, 1, 0.6392157, 1,
-0.08638209, 0.3005266, -0.3825693, 0, 1, 0.6470588, 1,
-0.07783534, 1.316275, -0.2510612, 0, 1, 0.6509804, 1,
-0.07611761, 1.384136, -0.8861201, 0, 1, 0.6588235, 1,
-0.0739361, 0.9633367, -0.6039067, 0, 1, 0.6627451, 1,
-0.0710592, -0.2068379, -4.875336, 0, 1, 0.6705883, 1,
-0.06937052, 2.457664, 0.2028747, 0, 1, 0.6745098, 1,
-0.06835514, 0.02418817, -1.887342, 0, 1, 0.682353, 1,
-0.06173734, -0.7967001, -3.163893, 0, 1, 0.6862745, 1,
-0.05542955, 0.003685331, -1.294248, 0, 1, 0.6941177, 1,
-0.05285692, 1.277048, 0.879728, 0, 1, 0.7019608, 1,
-0.04890244, -0.9507493, -4.180783, 0, 1, 0.7058824, 1,
-0.04764666, -0.6098144, -3.781887, 0, 1, 0.7137255, 1,
-0.0466844, 1.42789, 1.964659, 0, 1, 0.7176471, 1,
-0.04340686, -1.131642, -2.164553, 0, 1, 0.7254902, 1,
-0.04046999, -0.1993435, -2.47739, 0, 1, 0.7294118, 1,
-0.03987283, -0.4465764, -2.848713, 0, 1, 0.7372549, 1,
-0.03865931, -0.1416042, -1.161964, 0, 1, 0.7411765, 1,
-0.03852666, -0.6386212, -3.233636, 0, 1, 0.7490196, 1,
-0.03776779, -0.217814, -2.215717, 0, 1, 0.7529412, 1,
-0.03080517, 0.001359915, 0.8678382, 0, 1, 0.7607843, 1,
-0.02875139, 0.179662, -0.2977769, 0, 1, 0.7647059, 1,
-0.02864091, -0.8008034, -2.162716, 0, 1, 0.772549, 1,
-0.0269883, 1.55393, 0.9252938, 0, 1, 0.7764706, 1,
-0.02631416, -0.01365286, -2.579258, 0, 1, 0.7843137, 1,
-0.02443088, 0.5384025, -2.097137, 0, 1, 0.7882353, 1,
-0.02026962, -0.3424592, -2.982107, 0, 1, 0.7960784, 1,
-0.01954411, -0.7819441, -2.738214, 0, 1, 0.8039216, 1,
-0.0155105, 1.337087, -0.1090067, 0, 1, 0.8078431, 1,
-0.009846037, 0.6503912, -0.2222175, 0, 1, 0.8156863, 1,
-0.008155681, -0.1765773, -1.939367, 0, 1, 0.8196079, 1,
-0.005619609, -0.04589471, -3.438001, 0, 1, 0.827451, 1,
-0.003123813, -0.3334259, -2.923344, 0, 1, 0.8313726, 1,
0.005113249, 0.1231964, -0.4622103, 0, 1, 0.8392157, 1,
0.005511692, -0.06020553, 7.169348, 0, 1, 0.8431373, 1,
0.009448326, 1.126676, -0.7145516, 0, 1, 0.8509804, 1,
0.01001196, 0.6428295, -0.4200261, 0, 1, 0.854902, 1,
0.01484323, -0.1090828, 4.202368, 0, 1, 0.8627451, 1,
0.01526918, -1.534598, 3.147582, 0, 1, 0.8666667, 1,
0.01956507, -1.561196, 2.678293, 0, 1, 0.8745098, 1,
0.02247029, 1.432794, -0.3321141, 0, 1, 0.8784314, 1,
0.03009636, 0.8530726, 0.3138111, 0, 1, 0.8862745, 1,
0.03278976, -0.4287385, 3.11236, 0, 1, 0.8901961, 1,
0.03335352, 0.9139221, 0.9537417, 0, 1, 0.8980392, 1,
0.03487071, -0.6764024, 2.730303, 0, 1, 0.9058824, 1,
0.03899323, -0.1452591, 3.078627, 0, 1, 0.9098039, 1,
0.0403325, -0.9661441, 3.220441, 0, 1, 0.9176471, 1,
0.04193077, 0.9821391, 0.4535106, 0, 1, 0.9215686, 1,
0.04876263, -0.3648544, 3.115587, 0, 1, 0.9294118, 1,
0.04893967, -0.7882228, 5.572237, 0, 1, 0.9333333, 1,
0.05065485, 2.294504, 0.3581944, 0, 1, 0.9411765, 1,
0.0506613, 0.1555826, 1.144083, 0, 1, 0.945098, 1,
0.0544092, 1.154348, 1.445457, 0, 1, 0.9529412, 1,
0.06063386, -1.625326, 3.790584, 0, 1, 0.9568627, 1,
0.06267411, -1.670856, 2.420831, 0, 1, 0.9647059, 1,
0.06898296, 0.06435999, 0.3111683, 0, 1, 0.9686275, 1,
0.06984545, 0.02298234, 0.2235069, 0, 1, 0.9764706, 1,
0.07049367, 0.3713344, 1.249975, 0, 1, 0.9803922, 1,
0.07148442, -0.1781361, 3.621251, 0, 1, 0.9882353, 1,
0.07265666, 0.3928528, 0.7677355, 0, 1, 0.9921569, 1,
0.07538754, -0.4599062, 4.365773, 0, 1, 1, 1,
0.07598725, 1.131076, 0.09062777, 0, 0.9921569, 1, 1,
0.07602154, 1.934791, -0.76876, 0, 0.9882353, 1, 1,
0.07710654, -1.613282, 3.169744, 0, 0.9803922, 1, 1,
0.07814442, -0.2530743, 0.9654181, 0, 0.9764706, 1, 1,
0.08338747, -0.5495636, 2.543963, 0, 0.9686275, 1, 1,
0.08396209, 0.3537322, 1.032559, 0, 0.9647059, 1, 1,
0.08538415, -0.06412192, 2.05449, 0, 0.9568627, 1, 1,
0.08580986, -0.390897, 2.990986, 0, 0.9529412, 1, 1,
0.09135014, -1.492269, 2.886782, 0, 0.945098, 1, 1,
0.09168322, 0.2719978, 0.662026, 0, 0.9411765, 1, 1,
0.09488151, -0.4685699, 4.260323, 0, 0.9333333, 1, 1,
0.09678237, -2.014226, 2.913159, 0, 0.9294118, 1, 1,
0.1010593, 1.083787, -0.2044177, 0, 0.9215686, 1, 1,
0.1055245, 0.4107338, -0.6021051, 0, 0.9176471, 1, 1,
0.1057161, 1.192798, 0.3297034, 0, 0.9098039, 1, 1,
0.1064689, 0.291085, 2.023045, 0, 0.9058824, 1, 1,
0.110115, -0.04167217, -0.250826, 0, 0.8980392, 1, 1,
0.1106695, -1.111949, 1.613276, 0, 0.8901961, 1, 1,
0.1135446, 0.00950196, 4.141019, 0, 0.8862745, 1, 1,
0.1186604, -1.044213, 2.624899, 0, 0.8784314, 1, 1,
0.1202291, 0.03280145, 0.8821281, 0, 0.8745098, 1, 1,
0.1216209, 0.3294045, 0.03634562, 0, 0.8666667, 1, 1,
0.1235402, -0.4407224, 3.132303, 0, 0.8627451, 1, 1,
0.1307249, -0.7402003, 3.433295, 0, 0.854902, 1, 1,
0.1308722, -0.8029501, 1.814199, 0, 0.8509804, 1, 1,
0.1334318, 0.7688167, -0.4392869, 0, 0.8431373, 1, 1,
0.1334881, -0.8336605, 3.350927, 0, 0.8392157, 1, 1,
0.1337058, 1.576828, -0.6251541, 0, 0.8313726, 1, 1,
0.1348941, -0.7662918, 4.14418, 0, 0.827451, 1, 1,
0.1359551, 1.566521, -1.359066, 0, 0.8196079, 1, 1,
0.1369279, -0.400262, 2.408811, 0, 0.8156863, 1, 1,
0.1409974, 0.01293426, 1.509589, 0, 0.8078431, 1, 1,
0.1420944, -0.7905065, 3.599667, 0, 0.8039216, 1, 1,
0.1443757, -1.078328, 3.582663, 0, 0.7960784, 1, 1,
0.1475078, 0.6262912, 0.4107858, 0, 0.7882353, 1, 1,
0.1544988, 1.011542, 0.5950908, 0, 0.7843137, 1, 1,
0.1595594, 1.353138, -0.8058664, 0, 0.7764706, 1, 1,
0.163328, 1.691153, 0.6258766, 0, 0.772549, 1, 1,
0.166706, 0.3790258, 2.535521, 0, 0.7647059, 1, 1,
0.1714006, -2.857989, 3.939003, 0, 0.7607843, 1, 1,
0.172419, -0.6926028, 2.924933, 0, 0.7529412, 1, 1,
0.1732898, -0.789723, 1.842402, 0, 0.7490196, 1, 1,
0.1734123, 0.1039311, 1.42525, 0, 0.7411765, 1, 1,
0.1751776, 0.03669375, 0.3293751, 0, 0.7372549, 1, 1,
0.177476, -0.3984195, 4.686031, 0, 0.7294118, 1, 1,
0.1787406, 0.07996116, 2.080446, 0, 0.7254902, 1, 1,
0.1814993, -0.959271, 2.017031, 0, 0.7176471, 1, 1,
0.1864203, -0.970246, 2.6361, 0, 0.7137255, 1, 1,
0.1869166, -0.7925574, 1.834429, 0, 0.7058824, 1, 1,
0.1962089, -0.4208856, 1.768353, 0, 0.6980392, 1, 1,
0.1970855, 0.2993739, 0.2515394, 0, 0.6941177, 1, 1,
0.1990106, -1.226817, 1.972119, 0, 0.6862745, 1, 1,
0.2010167, -0.8470488, 3.727153, 0, 0.682353, 1, 1,
0.2029898, -0.4804158, 2.014894, 0, 0.6745098, 1, 1,
0.2036134, 0.6009827, 0.08450416, 0, 0.6705883, 1, 1,
0.2041945, 0.9251758, 0.2232136, 0, 0.6627451, 1, 1,
0.2063023, 0.02516441, 1.893079, 0, 0.6588235, 1, 1,
0.2085557, -0.1217698, 2.269338, 0, 0.6509804, 1, 1,
0.2117264, 2.276416, -1.89238, 0, 0.6470588, 1, 1,
0.2148359, 1.682951, -2.301423, 0, 0.6392157, 1, 1,
0.2154712, 0.8726162, 0.2351239, 0, 0.6352941, 1, 1,
0.2164676, 1.351277, 0.6238352, 0, 0.627451, 1, 1,
0.2171052, -0.1784436, 0.6691025, 0, 0.6235294, 1, 1,
0.2210678, 0.7696249, 1.297795, 0, 0.6156863, 1, 1,
0.2229669, -0.8491845, 1.542145, 0, 0.6117647, 1, 1,
0.2246802, -1.111411, 1.927824, 0, 0.6039216, 1, 1,
0.2247511, 2.446241, 1.672654, 0, 0.5960785, 1, 1,
0.2254405, 1.684321, -2.221705, 0, 0.5921569, 1, 1,
0.2254576, 0.7978427, -1.452657, 0, 0.5843138, 1, 1,
0.2264494, -0.5863436, 1.61836, 0, 0.5803922, 1, 1,
0.227756, -0.2663853, 1.661749, 0, 0.572549, 1, 1,
0.2281227, 0.5914072, 1.121809, 0, 0.5686275, 1, 1,
0.2286925, -0.2118205, 3.245651, 0, 0.5607843, 1, 1,
0.2320978, -0.5562326, 4.00023, 0, 0.5568628, 1, 1,
0.2344968, 1.274766, 0.6206293, 0, 0.5490196, 1, 1,
0.2346601, -1.079905, 3.08425, 0, 0.5450981, 1, 1,
0.2352954, 1.085658, -0.1494714, 0, 0.5372549, 1, 1,
0.2360538, -0.2728346, 3.484439, 0, 0.5333334, 1, 1,
0.2414433, -0.8271652, 2.732019, 0, 0.5254902, 1, 1,
0.2427242, -1.517953, 2.316967, 0, 0.5215687, 1, 1,
0.2432938, -0.833919, 2.481513, 0, 0.5137255, 1, 1,
0.2440403, -1.464889, 1.597322, 0, 0.509804, 1, 1,
0.2447593, -0.05257559, 3.504528, 0, 0.5019608, 1, 1,
0.2455954, -0.2817653, 1.049909, 0, 0.4941176, 1, 1,
0.2554919, -1.171425, 3.558044, 0, 0.4901961, 1, 1,
0.2578398, -1.079997, 3.271873, 0, 0.4823529, 1, 1,
0.2604269, 0.1951691, -0.5233223, 0, 0.4784314, 1, 1,
0.2617093, -1.35841, 3.024171, 0, 0.4705882, 1, 1,
0.2619694, 0.2853267, 0.5172278, 0, 0.4666667, 1, 1,
0.2622076, 1.913322, 0.3669461, 0, 0.4588235, 1, 1,
0.2645178, 1.291317, 1.17587, 0, 0.454902, 1, 1,
0.2660995, 0.6127172, 1.5497, 0, 0.4470588, 1, 1,
0.2672375, -0.8102634, 2.955131, 0, 0.4431373, 1, 1,
0.2677057, -0.492414, 3.651644, 0, 0.4352941, 1, 1,
0.2741708, 1.058114, 0.1907204, 0, 0.4313726, 1, 1,
0.2762681, 1.215949, 0.5336021, 0, 0.4235294, 1, 1,
0.2800742, 0.6032552, 0.965793, 0, 0.4196078, 1, 1,
0.2806708, 0.9398243, -0.05595964, 0, 0.4117647, 1, 1,
0.2816891, -1.068642, 1.729172, 0, 0.4078431, 1, 1,
0.2834199, -0.175648, 1.854419, 0, 0.4, 1, 1,
0.2875335, -1.450756, 3.47543, 0, 0.3921569, 1, 1,
0.2897539, -0.8184616, 1.177261, 0, 0.3882353, 1, 1,
0.29603, -0.2637804, 3.07884, 0, 0.3803922, 1, 1,
0.2972701, -1.647792, 3.930691, 0, 0.3764706, 1, 1,
0.3003096, 0.4691712, 0.8192506, 0, 0.3686275, 1, 1,
0.3027018, 0.5114137, 0.04051732, 0, 0.3647059, 1, 1,
0.30289, -0.7486771, 3.13944, 0, 0.3568628, 1, 1,
0.3140073, -1.130865, 2.839143, 0, 0.3529412, 1, 1,
0.3155253, -1.284567, 0.8940614, 0, 0.345098, 1, 1,
0.3162842, -1.042089, 1.003119, 0, 0.3411765, 1, 1,
0.3213978, -0.6201025, 2.031811, 0, 0.3333333, 1, 1,
0.3221347, -0.8213723, 2.160197, 0, 0.3294118, 1, 1,
0.3247827, -0.97403, 3.344326, 0, 0.3215686, 1, 1,
0.325826, 1.305408, 0.1709693, 0, 0.3176471, 1, 1,
0.3259018, 0.7329982, 0.6705198, 0, 0.3098039, 1, 1,
0.3265725, 0.4215143, -0.3558537, 0, 0.3058824, 1, 1,
0.3267057, -0.7724194, 1.463616, 0, 0.2980392, 1, 1,
0.3307209, -1.142943, 2.375341, 0, 0.2901961, 1, 1,
0.3332755, 0.6350539, 1.910226, 0, 0.2862745, 1, 1,
0.3362175, 0.3960833, 0.1377572, 0, 0.2784314, 1, 1,
0.3389688, -0.251728, 2.437065, 0, 0.2745098, 1, 1,
0.3436619, -0.1642859, 2.327349, 0, 0.2666667, 1, 1,
0.3441761, -0.3001044, 2.277205, 0, 0.2627451, 1, 1,
0.3483546, -2.284556, 2.971718, 0, 0.254902, 1, 1,
0.3503644, 0.7105128, -1.309512, 0, 0.2509804, 1, 1,
0.3505204, 0.6077493, 0.8056812, 0, 0.2431373, 1, 1,
0.354509, -1.139228, 0.1776713, 0, 0.2392157, 1, 1,
0.3548961, -1.305408, 1.407783, 0, 0.2313726, 1, 1,
0.3571819, 0.100714, 2.323678, 0, 0.227451, 1, 1,
0.3574101, -1.419068, 3.438803, 0, 0.2196078, 1, 1,
0.3585453, 1.395654, -0.6264828, 0, 0.2156863, 1, 1,
0.3598969, 0.251006, 0.8941694, 0, 0.2078431, 1, 1,
0.3602309, -2.009883, 1.590582, 0, 0.2039216, 1, 1,
0.362431, 0.3889566, 0.8811545, 0, 0.1960784, 1, 1,
0.3656862, 1.099571, 0.9056476, 0, 0.1882353, 1, 1,
0.3697515, 0.6103156, 0.7072356, 0, 0.1843137, 1, 1,
0.3701336, 0.7452651, 0.699193, 0, 0.1764706, 1, 1,
0.3750526, -0.5766484, 1.994995, 0, 0.172549, 1, 1,
0.3753785, -0.986931, 1.529342, 0, 0.1647059, 1, 1,
0.3761503, 1.21815, -0.161054, 0, 0.1607843, 1, 1,
0.3801692, -0.5541858, 3.378299, 0, 0.1529412, 1, 1,
0.3851094, -0.03167143, 0.3665799, 0, 0.1490196, 1, 1,
0.3881583, 0.6289222, 1.326599, 0, 0.1411765, 1, 1,
0.389415, -1.736507, 3.161603, 0, 0.1372549, 1, 1,
0.3907973, 1.920851, -0.4176854, 0, 0.1294118, 1, 1,
0.4004749, -1.868971, 3.729001, 0, 0.1254902, 1, 1,
0.4043216, -0.07949647, 2.542667, 0, 0.1176471, 1, 1,
0.4065849, -0.1666099, 0.6180863, 0, 0.1137255, 1, 1,
0.407235, 1.529554, -0.00072895, 0, 0.1058824, 1, 1,
0.4119979, 0.01172675, 0.2813475, 0, 0.09803922, 1, 1,
0.4127248, -0.2400311, 1.894577, 0, 0.09411765, 1, 1,
0.4139827, 0.8811707, 0.8955771, 0, 0.08627451, 1, 1,
0.4254214, -0.4211735, 2.213882, 0, 0.08235294, 1, 1,
0.4256256, 0.1178109, 0.4284395, 0, 0.07450981, 1, 1,
0.4270998, -1.349091, 3.614483, 0, 0.07058824, 1, 1,
0.4277317, 0.8335305, 0.3641554, 0, 0.0627451, 1, 1,
0.4279739, 0.07001343, -0.0969666, 0, 0.05882353, 1, 1,
0.4280279, 0.06562791, 2.631712, 0, 0.05098039, 1, 1,
0.4287126, 0.3218494, 0.5826059, 0, 0.04705882, 1, 1,
0.4287426, 0.1981801, 1.774755, 0, 0.03921569, 1, 1,
0.4305117, 1.482795, 1.408004, 0, 0.03529412, 1, 1,
0.4389837, -0.0401639, 0.7250999, 0, 0.02745098, 1, 1,
0.444207, -1.178233, 3.838214, 0, 0.02352941, 1, 1,
0.4467, 0.524011, 2.507672, 0, 0.01568628, 1, 1,
0.4477093, 1.292729, -2.103772, 0, 0.01176471, 1, 1,
0.4511688, -0.8349958, 2.49571, 0, 0.003921569, 1, 1,
0.4534994, -2.248107, 2.665153, 0.003921569, 0, 1, 1,
0.4541173, -1.01862, 2.660982, 0.007843138, 0, 1, 1,
0.4543166, -1.136684, 1.596722, 0.01568628, 0, 1, 1,
0.458599, 1.493483, 0.4608242, 0.01960784, 0, 1, 1,
0.4586741, -0.1121006, 1.887137, 0.02745098, 0, 1, 1,
0.4628804, 0.4935102, -0.9690462, 0.03137255, 0, 1, 1,
0.4712238, -0.09945097, 1.894855, 0.03921569, 0, 1, 1,
0.4770244, -0.9160184, 3.188669, 0.04313726, 0, 1, 1,
0.4780281, 0.2137055, 1.810924, 0.05098039, 0, 1, 1,
0.4813898, 1.378135, 2.121381, 0.05490196, 0, 1, 1,
0.482178, -0.9174359, 2.866495, 0.0627451, 0, 1, 1,
0.483335, -1.035521, 1.656124, 0.06666667, 0, 1, 1,
0.4834729, 0.544205, 1.807469, 0.07450981, 0, 1, 1,
0.4923299, -0.8183501, 0.05229552, 0.07843138, 0, 1, 1,
0.4988055, -0.4436169, 2.774688, 0.08627451, 0, 1, 1,
0.5000064, -1.408446, 2.534605, 0.09019608, 0, 1, 1,
0.5035636, -1.367122, 2.165186, 0.09803922, 0, 1, 1,
0.5080817, 0.8463009, 1.585536, 0.1058824, 0, 1, 1,
0.5096209, 0.2301464, 1.292144, 0.1098039, 0, 1, 1,
0.5128847, -0.579025, 2.475882, 0.1176471, 0, 1, 1,
0.5143769, -1.608075, 3.217918, 0.1215686, 0, 1, 1,
0.5143778, 0.4486057, 1.144869, 0.1294118, 0, 1, 1,
0.5181921, -0.1995582, 0.9450076, 0.1333333, 0, 1, 1,
0.523417, 0.1410784, 0.488018, 0.1411765, 0, 1, 1,
0.5237345, -0.1477516, 1.872469, 0.145098, 0, 1, 1,
0.524301, 0.8042558, 0.7129529, 0.1529412, 0, 1, 1,
0.5252262, -0.9989092, 2.718357, 0.1568628, 0, 1, 1,
0.5412484, 0.8934218, 1.782653, 0.1647059, 0, 1, 1,
0.542779, 1.500598, 0.9798949, 0.1686275, 0, 1, 1,
0.5453259, -0.5192571, 2.849847, 0.1764706, 0, 1, 1,
0.5500759, -0.7465143, 0.5861489, 0.1803922, 0, 1, 1,
0.5533996, 0.2076685, 1.840181, 0.1882353, 0, 1, 1,
0.5590476, 0.1144999, 1.442734, 0.1921569, 0, 1, 1,
0.5613683, 0.5925736, 0.9735816, 0.2, 0, 1, 1,
0.5662019, 0.1139013, 2.900902, 0.2078431, 0, 1, 1,
0.5704585, -0.1750571, 0.6218441, 0.2117647, 0, 1, 1,
0.5766514, 0.4339396, 1.03896, 0.2196078, 0, 1, 1,
0.5808292, -0.2783406, 1.431925, 0.2235294, 0, 1, 1,
0.5838211, 0.5649771, 0.1953672, 0.2313726, 0, 1, 1,
0.5920054, 2.709048, 0.1335299, 0.2352941, 0, 1, 1,
0.6013466, -0.6080627, -0.2395242, 0.2431373, 0, 1, 1,
0.6066196, 1.245044, 0.001642953, 0.2470588, 0, 1, 1,
0.607069, 0.4060833, -0.1070321, 0.254902, 0, 1, 1,
0.6074401, 0.9172024, 1.963011, 0.2588235, 0, 1, 1,
0.6107326, 1.682694, -1.073646, 0.2666667, 0, 1, 1,
0.6135093, 0.5651672, 1.29192, 0.2705882, 0, 1, 1,
0.6149402, 0.2979192, -0.006639495, 0.2784314, 0, 1, 1,
0.6184559, 1.129812, 0.5886282, 0.282353, 0, 1, 1,
0.622372, 0.3562161, -0.8286952, 0.2901961, 0, 1, 1,
0.6228125, -0.7960988, 3.357531, 0.2941177, 0, 1, 1,
0.6254553, -1.160826, 3.016187, 0.3019608, 0, 1, 1,
0.6302328, 0.8832273, 0.7094807, 0.3098039, 0, 1, 1,
0.632486, -0.8719287, 0.3585901, 0.3137255, 0, 1, 1,
0.6339828, 1.793303, 0.5691832, 0.3215686, 0, 1, 1,
0.6412197, 1.620635, -0.4613701, 0.3254902, 0, 1, 1,
0.6441477, -0.5757545, 0.5142737, 0.3333333, 0, 1, 1,
0.6452079, 0.388761, 1.391621, 0.3372549, 0, 1, 1,
0.6452881, -0.08158327, 1.032772, 0.345098, 0, 1, 1,
0.6456726, -1.10965, 1.206078, 0.3490196, 0, 1, 1,
0.6458486, 0.9909306, 1.328231, 0.3568628, 0, 1, 1,
0.6458923, -0.6057698, 2.856825, 0.3607843, 0, 1, 1,
0.6538844, 1.417226, 0.482282, 0.3686275, 0, 1, 1,
0.6547131, 0.2805794, 1.757216, 0.372549, 0, 1, 1,
0.6547254, -1.424244, 2.671927, 0.3803922, 0, 1, 1,
0.6599885, -0.7295345, 3.32839, 0.3843137, 0, 1, 1,
0.6609861, -1.578583, 2.013777, 0.3921569, 0, 1, 1,
0.6611424, -0.2905311, 0.9772999, 0.3960784, 0, 1, 1,
0.6649696, 1.137196, 0.2472077, 0.4039216, 0, 1, 1,
0.6688946, -1.034458, 1.888275, 0.4117647, 0, 1, 1,
0.6727083, -1.839267, 2.429233, 0.4156863, 0, 1, 1,
0.6732584, -0.7226339, 2.349146, 0.4235294, 0, 1, 1,
0.674655, -0.3577891, 0.2783977, 0.427451, 0, 1, 1,
0.6787171, 0.9758192, 0.0218954, 0.4352941, 0, 1, 1,
0.6805271, -0.1538667, 2.688797, 0.4392157, 0, 1, 1,
0.6860626, -1.017512, 3.669215, 0.4470588, 0, 1, 1,
0.6900493, -0.8001948, 1.074863, 0.4509804, 0, 1, 1,
0.6929001, 1.107726, 1.240004, 0.4588235, 0, 1, 1,
0.6937456, -0.7831146, 0.5738702, 0.4627451, 0, 1, 1,
0.7024707, 0.1394916, 2.238075, 0.4705882, 0, 1, 1,
0.7052673, 1.690833, 0.3207599, 0.4745098, 0, 1, 1,
0.7146096, -0.7438481, 2.856788, 0.4823529, 0, 1, 1,
0.7154624, -1.139503, 3.472465, 0.4862745, 0, 1, 1,
0.7155195, 0.3338408, 2.737312, 0.4941176, 0, 1, 1,
0.7211131, 0.3175799, 1.8136, 0.5019608, 0, 1, 1,
0.721963, 0.8504897, 2.076607, 0.5058824, 0, 1, 1,
0.7231278, -0.6928873, 1.298627, 0.5137255, 0, 1, 1,
0.7312858, 0.06869023, 1.577447, 0.5176471, 0, 1, 1,
0.7364001, 1.347612, -0.005220085, 0.5254902, 0, 1, 1,
0.7390905, -0.4519301, 1.854443, 0.5294118, 0, 1, 1,
0.739295, 0.5669622, 2.117953, 0.5372549, 0, 1, 1,
0.7421182, -1.44419, 3.413015, 0.5411765, 0, 1, 1,
0.7424242, -0.7416531, 2.335129, 0.5490196, 0, 1, 1,
0.7550304, -0.4335074, 1.822736, 0.5529412, 0, 1, 1,
0.7552944, 0.09766831, 0.8355817, 0.5607843, 0, 1, 1,
0.7560054, 1.666834, -0.2930551, 0.5647059, 0, 1, 1,
0.7573875, 0.2027854, 3.525821, 0.572549, 0, 1, 1,
0.7608836, -1.611543, 2.212317, 0.5764706, 0, 1, 1,
0.7617728, -0.1972357, 1.510006, 0.5843138, 0, 1, 1,
0.7771001, -0.5414268, 3.11904, 0.5882353, 0, 1, 1,
0.7783443, -1.455591, 1.358092, 0.5960785, 0, 1, 1,
0.7796456, 0.9136818, -0.0467705, 0.6039216, 0, 1, 1,
0.7828416, 1.998086, -1.644408, 0.6078432, 0, 1, 1,
0.7831741, -1.083424, 3.061691, 0.6156863, 0, 1, 1,
0.7835165, -0.8854563, 3.157815, 0.6196079, 0, 1, 1,
0.783796, -1.268951, 3.183323, 0.627451, 0, 1, 1,
0.7919298, -0.1997937, 2.260784, 0.6313726, 0, 1, 1,
0.7931917, -0.08425287, 1.338121, 0.6392157, 0, 1, 1,
0.796738, 1.469692, 1.286159, 0.6431373, 0, 1, 1,
0.7967913, 1.096578, -0.1922271, 0.6509804, 0, 1, 1,
0.7987891, 0.142223, 1.801911, 0.654902, 0, 1, 1,
0.8021692, 1.852486, 1.006413, 0.6627451, 0, 1, 1,
0.8077198, -0.6336751, 3.938205, 0.6666667, 0, 1, 1,
0.8104247, 0.5508453, 0.8428324, 0.6745098, 0, 1, 1,
0.820924, 1.401994, 0.3177656, 0.6784314, 0, 1, 1,
0.8227974, 0.1802802, -0.1111062, 0.6862745, 0, 1, 1,
0.8273423, -0.420889, 3.277241, 0.6901961, 0, 1, 1,
0.8278135, 0.120313, 0.9848259, 0.6980392, 0, 1, 1,
0.8321326, -0.6112652, 0.9927757, 0.7058824, 0, 1, 1,
0.8347108, 0.9364074, 0.7565402, 0.7098039, 0, 1, 1,
0.8359552, -0.3525873, 2.931965, 0.7176471, 0, 1, 1,
0.8366042, 1.328834, -0.4354479, 0.7215686, 0, 1, 1,
0.842883, -0.6356036, 1.902266, 0.7294118, 0, 1, 1,
0.8459613, 1.308752, -0.6806584, 0.7333333, 0, 1, 1,
0.8461859, 0.2900804, 0.5457258, 0.7411765, 0, 1, 1,
0.847066, 0.426008, 2.479846, 0.7450981, 0, 1, 1,
0.8480036, 0.03883925, 1.994755, 0.7529412, 0, 1, 1,
0.8529245, 0.3828351, 1.502608, 0.7568628, 0, 1, 1,
0.8555126, 0.6718138, 1.802126, 0.7647059, 0, 1, 1,
0.8589432, 1.808213, 1.412745, 0.7686275, 0, 1, 1,
0.8599347, -1.474719, 3.931626, 0.7764706, 0, 1, 1,
0.8621699, 0.01945663, 0.7770993, 0.7803922, 0, 1, 1,
0.8621935, 0.9416339, 1.476972, 0.7882353, 0, 1, 1,
0.863234, -0.3528217, 3.377681, 0.7921569, 0, 1, 1,
0.8635638, 0.3459829, 0.1208696, 0.8, 0, 1, 1,
0.8638304, -0.4569715, 3.106769, 0.8078431, 0, 1, 1,
0.8733797, -0.9235829, 3.647011, 0.8117647, 0, 1, 1,
0.8811632, -1.035083, 2.038343, 0.8196079, 0, 1, 1,
0.8935238, 0.2863227, -0.2617255, 0.8235294, 0, 1, 1,
0.8965614, -1.830498, 1.476895, 0.8313726, 0, 1, 1,
0.9109898, 0.1513386, 0.03760742, 0.8352941, 0, 1, 1,
0.9154231, 0.7104484, 0.4329337, 0.8431373, 0, 1, 1,
0.9172742, -1.015606, 1.980453, 0.8470588, 0, 1, 1,
0.9263784, -0.2395677, 2.612786, 0.854902, 0, 1, 1,
0.9268166, 1.66013, 3.126817, 0.8588235, 0, 1, 1,
0.9288447, 0.5436194, 0.4402606, 0.8666667, 0, 1, 1,
0.9299091, 1.325405, 1.156667, 0.8705882, 0, 1, 1,
0.9317998, 0.598691, 1.412964, 0.8784314, 0, 1, 1,
0.9328035, -1.377347, 3.078032, 0.8823529, 0, 1, 1,
0.9340971, 1.604185, 2.068367, 0.8901961, 0, 1, 1,
0.9393363, -0.449325, 0.9442872, 0.8941177, 0, 1, 1,
0.9402702, -1.247406, 1.228664, 0.9019608, 0, 1, 1,
0.9486792, 0.1765114, 0.1159525, 0.9098039, 0, 1, 1,
0.9534333, 0.1675567, 2.605705, 0.9137255, 0, 1, 1,
0.9536128, 0.05778999, 1.361889, 0.9215686, 0, 1, 1,
0.9569659, 0.1069517, 3.521466, 0.9254902, 0, 1, 1,
0.9649971, 0.3801608, 1.096246, 0.9333333, 0, 1, 1,
0.9722016, 0.2311027, 0.3184074, 0.9372549, 0, 1, 1,
0.9725968, -2.227224, 4.36063, 0.945098, 0, 1, 1,
0.9741529, 0.1378511, 3.473684, 0.9490196, 0, 1, 1,
0.9822918, 0.3372248, -1.928534, 0.9568627, 0, 1, 1,
0.9892122, -1.69735, 2.814501, 0.9607843, 0, 1, 1,
0.9956545, -0.1951264, 1.139606, 0.9686275, 0, 1, 1,
1.001754, -0.6264493, 0.656734, 0.972549, 0, 1, 1,
1.004865, -0.7319454, 3.065964, 0.9803922, 0, 1, 1,
1.008455, 0.3324759, 2.174129, 0.9843137, 0, 1, 1,
1.01135, -1.131559, 2.427695, 0.9921569, 0, 1, 1,
1.01563, -1.878409, 4.669981, 0.9960784, 0, 1, 1,
1.021841, 1.445197, -0.9292378, 1, 0, 0.9960784, 1,
1.040781, -0.9915829, 1.740524, 1, 0, 0.9882353, 1,
1.055416, 0.8058771, 1.03158, 1, 0, 0.9843137, 1,
1.062775, 0.3056445, 0.182268, 1, 0, 0.9764706, 1,
1.065433, -1.450705, 2.128131, 1, 0, 0.972549, 1,
1.067579, -0.9104528, 2.402402, 1, 0, 0.9647059, 1,
1.076712, -0.4446592, 2.404055, 1, 0, 0.9607843, 1,
1.078102, -1.073027, 3.141826, 1, 0, 0.9529412, 1,
1.081915, 0.4494041, 0.3630051, 1, 0, 0.9490196, 1,
1.084433, -0.8795909, 2.950544, 1, 0, 0.9411765, 1,
1.100349, 0.5597538, 0.3390952, 1, 0, 0.9372549, 1,
1.113368, -0.1009734, 3.33166, 1, 0, 0.9294118, 1,
1.116401, -1.080044, 1.056135, 1, 0, 0.9254902, 1,
1.120436, 1.165287, 1.671343, 1, 0, 0.9176471, 1,
1.128497, -1.227577, 2.259526, 1, 0, 0.9137255, 1,
1.133355, 0.2900348, 2.222015, 1, 0, 0.9058824, 1,
1.142091, -0.1847953, 3.696639, 1, 0, 0.9019608, 1,
1.143865, -0.02934268, 1.662856, 1, 0, 0.8941177, 1,
1.147151, 0.02781487, 4.45584, 1, 0, 0.8862745, 1,
1.147447, 0.5195047, 1.852475, 1, 0, 0.8823529, 1,
1.152313, -0.7468044, 2.813313, 1, 0, 0.8745098, 1,
1.156661, -0.6278327, 3.632392, 1, 0, 0.8705882, 1,
1.163938, 0.5507507, -0.1984502, 1, 0, 0.8627451, 1,
1.175127, -0.6606269, 2.596504, 1, 0, 0.8588235, 1,
1.175705, 1.732288, -0.04839348, 1, 0, 0.8509804, 1,
1.176259, -0.7447966, 0.7165271, 1, 0, 0.8470588, 1,
1.181013, -0.1403588, 2.723366, 1, 0, 0.8392157, 1,
1.185394, 0.6356183, -0.612092, 1, 0, 0.8352941, 1,
1.186088, 2.163705, -0.07295232, 1, 0, 0.827451, 1,
1.187065, 2.084988, 0.3832322, 1, 0, 0.8235294, 1,
1.189713, 1.325904, 1.777393, 1, 0, 0.8156863, 1,
1.19082, 0.3551553, 2.827984, 1, 0, 0.8117647, 1,
1.195006, 1.705486, 1.497638, 1, 0, 0.8039216, 1,
1.210581, -0.5642491, 2.190953, 1, 0, 0.7960784, 1,
1.21222, 1.681668, -1.306597, 1, 0, 0.7921569, 1,
1.217183, -0.494888, 2.833221, 1, 0, 0.7843137, 1,
1.21996, 0.1832203, 2.370311, 1, 0, 0.7803922, 1,
1.232248, -1.218756, 1.592795, 1, 0, 0.772549, 1,
1.232645, 0.355598, -0.03677574, 1, 0, 0.7686275, 1,
1.238541, -0.4350576, 1.888718, 1, 0, 0.7607843, 1,
1.238558, -1.111092, 1.914198, 1, 0, 0.7568628, 1,
1.239511, 0.05156907, 2.445072, 1, 0, 0.7490196, 1,
1.24383, -0.5358039, -0.00661094, 1, 0, 0.7450981, 1,
1.257292, -0.01010761, 0.811568, 1, 0, 0.7372549, 1,
1.257874, -1.770764, 4.386377, 1, 0, 0.7333333, 1,
1.258737, -0.325753, 3.439187, 1, 0, 0.7254902, 1,
1.269887, 1.085667, 1.132458, 1, 0, 0.7215686, 1,
1.278371, -0.2568791, 0.5870395, 1, 0, 0.7137255, 1,
1.280887, 0.4361493, 1.262866, 1, 0, 0.7098039, 1,
1.282189, -1.38773, 1.36124, 1, 0, 0.7019608, 1,
1.287323, 1.319666, 1.602197, 1, 0, 0.6941177, 1,
1.289486, -0.8187985, 1.426474, 1, 0, 0.6901961, 1,
1.294777, 1.181289, 0.36145, 1, 0, 0.682353, 1,
1.29996, -0.2374412, 1.126728, 1, 0, 0.6784314, 1,
1.313549, -0.3826724, 2.69705, 1, 0, 0.6705883, 1,
1.317768, -1.680641, 0.8273752, 1, 0, 0.6666667, 1,
1.318408, -0.1607091, 1.08219, 1, 0, 0.6588235, 1,
1.324078, 0.1696839, 2.191276, 1, 0, 0.654902, 1,
1.325419, -1.616343, 1.749106, 1, 0, 0.6470588, 1,
1.325702, 0.6096689, 0.5391273, 1, 0, 0.6431373, 1,
1.334482, 0.232872, 0.895689, 1, 0, 0.6352941, 1,
1.334583, 0.2349981, 1.167427, 1, 0, 0.6313726, 1,
1.339175, 0.06280884, 2.303676, 1, 0, 0.6235294, 1,
1.344828, 0.4629037, 0.006238777, 1, 0, 0.6196079, 1,
1.371831, 0.9036428, 2.491179, 1, 0, 0.6117647, 1,
1.386202, 0.1864881, 0.954453, 1, 0, 0.6078432, 1,
1.387699, 0.2098505, 1.129204, 1, 0, 0.6, 1,
1.397257, -0.2263825, 2.752319, 1, 0, 0.5921569, 1,
1.400906, -1.887867, 1.798662, 1, 0, 0.5882353, 1,
1.402174, -1.356687, 1.202494, 1, 0, 0.5803922, 1,
1.402999, 1.416309, 0.2315404, 1, 0, 0.5764706, 1,
1.411214, 0.4378994, 2.014081, 1, 0, 0.5686275, 1,
1.41365, -1.460049, 3.679598, 1, 0, 0.5647059, 1,
1.416505, -0.8674937, 2.460869, 1, 0, 0.5568628, 1,
1.421439, -0.01439555, 1.180721, 1, 0, 0.5529412, 1,
1.437092, -0.2851986, 1.334476, 1, 0, 0.5450981, 1,
1.438945, -0.3023044, 2.706745, 1, 0, 0.5411765, 1,
1.440394, -0.461592, 2.216006, 1, 0, 0.5333334, 1,
1.440582, -2.11946, 1.871282, 1, 0, 0.5294118, 1,
1.445759, 0.2452499, 2.189833, 1, 0, 0.5215687, 1,
1.448563, 0.4860035, 1.72986, 1, 0, 0.5176471, 1,
1.449726, -1.055094, 0.3811628, 1, 0, 0.509804, 1,
1.453535, 0.1473731, 1.541192, 1, 0, 0.5058824, 1,
1.458371, 1.367279, 0.3033891, 1, 0, 0.4980392, 1,
1.478595, -0.8314007, 2.885749, 1, 0, 0.4901961, 1,
1.487708, 0.6880769, 1.520605, 1, 0, 0.4862745, 1,
1.489613, 1.935843, -1.744503, 1, 0, 0.4784314, 1,
1.49312, 0.3963419, 2.22628, 1, 0, 0.4745098, 1,
1.496338, 1.887274, -0.6362882, 1, 0, 0.4666667, 1,
1.501332, -1.000209, 3.02669, 1, 0, 0.4627451, 1,
1.525805, -1.017951, 2.737723, 1, 0, 0.454902, 1,
1.52738, -2.906316, 2.701311, 1, 0, 0.4509804, 1,
1.529459, -0.2428203, 3.032052, 1, 0, 0.4431373, 1,
1.539022, -1.385437, 2.964899, 1, 0, 0.4392157, 1,
1.562119, -0.4528421, 3.096329, 1, 0, 0.4313726, 1,
1.572693, 0.1455173, 0.9832418, 1, 0, 0.427451, 1,
1.573475, -1.362902, 2.818172, 1, 0, 0.4196078, 1,
1.579437, -0.7520995, 2.03254, 1, 0, 0.4156863, 1,
1.591265, 0.9278225, 1.152318, 1, 0, 0.4078431, 1,
1.59422, 0.7852963, 1.375549, 1, 0, 0.4039216, 1,
1.601945, -2.175303, 2.799805, 1, 0, 0.3960784, 1,
1.613376, -0.7996338, 2.353725, 1, 0, 0.3882353, 1,
1.6176, 0.9829764, 2.316238, 1, 0, 0.3843137, 1,
1.6255, -1.318846, 1.467874, 1, 0, 0.3764706, 1,
1.643229, 1.369543, 1.583093, 1, 0, 0.372549, 1,
1.653473, 0.2397922, 1.379509, 1, 0, 0.3647059, 1,
1.666075, -0.4016302, 2.131078, 1, 0, 0.3607843, 1,
1.669383, 0.2343764, 3.499875, 1, 0, 0.3529412, 1,
1.674497, 0.7586597, 1.156673, 1, 0, 0.3490196, 1,
1.696446, -0.483484, 2.139571, 1, 0, 0.3411765, 1,
1.731553, -0.6620526, 2.096077, 1, 0, 0.3372549, 1,
1.747333, -0.6304778, 3.131169, 1, 0, 0.3294118, 1,
1.747384, -0.3384138, 1.31341, 1, 0, 0.3254902, 1,
1.759327, 0.5584615, 2.200059, 1, 0, 0.3176471, 1,
1.761624, -0.7672918, 2.643134, 1, 0, 0.3137255, 1,
1.763108, 1.84399, 1.034185, 1, 0, 0.3058824, 1,
1.775442, -2.134521, 2.532104, 1, 0, 0.2980392, 1,
1.775445, 0.09692875, 0.1007464, 1, 0, 0.2941177, 1,
1.783582, 0.9461748, 1.153901, 1, 0, 0.2862745, 1,
1.792223, 0.7504144, 1.201753, 1, 0, 0.282353, 1,
1.79917, -0.4271811, 1.520115, 1, 0, 0.2745098, 1,
1.800806, -0.8551801, 3.190638, 1, 0, 0.2705882, 1,
1.806186, -0.4515439, 0.865727, 1, 0, 0.2627451, 1,
1.808179, 1.137438, 0.807798, 1, 0, 0.2588235, 1,
1.843702, 0.139128, 3.23221, 1, 0, 0.2509804, 1,
1.876286, 1.453823, -0.1737202, 1, 0, 0.2470588, 1,
1.878102, -0.1622356, 0.4791343, 1, 0, 0.2392157, 1,
1.893279, 1.907434, -0.7084982, 1, 0, 0.2352941, 1,
1.912433, 0.7273202, 1.256192, 1, 0, 0.227451, 1,
1.912695, -1.533551, 1.879419, 1, 0, 0.2235294, 1,
1.915835, -0.3845764, 2.55679, 1, 0, 0.2156863, 1,
1.938886, 1.10744, 2.168942, 1, 0, 0.2117647, 1,
1.939749, 0.03325877, 2.803854, 1, 0, 0.2039216, 1,
1.957586, 0.7921163, 0.3058528, 1, 0, 0.1960784, 1,
1.957751, 0.2823585, -0.3232512, 1, 0, 0.1921569, 1,
1.979035, 1.610756, -0.3676077, 1, 0, 0.1843137, 1,
1.988426, -0.674763, 1.632046, 1, 0, 0.1803922, 1,
2.010689, -0.8701404, -0.2376826, 1, 0, 0.172549, 1,
2.016645, -0.2626188, 1.713778, 1, 0, 0.1686275, 1,
2.024534, 0.2828832, 1.87205, 1, 0, 0.1607843, 1,
2.033133, 1.064838, -0.9323135, 1, 0, 0.1568628, 1,
2.055772, -1.549925, 1.878953, 1, 0, 0.1490196, 1,
2.092145, 0.5400686, 0.4119495, 1, 0, 0.145098, 1,
2.09789, 0.6731369, 0.5407565, 1, 0, 0.1372549, 1,
2.112103, -0.7004333, 0.4576085, 1, 0, 0.1333333, 1,
2.129905, 1.285543, -0.04425625, 1, 0, 0.1254902, 1,
2.234684, -0.6212602, 2.536311, 1, 0, 0.1215686, 1,
2.247089, -0.2361502, 0.5488929, 1, 0, 0.1137255, 1,
2.25724, -0.434216, 1.972636, 1, 0, 0.1098039, 1,
2.260605, 0.997361, 1.751503, 1, 0, 0.1019608, 1,
2.291266, -0.2591347, 0.4044895, 1, 0, 0.09411765, 1,
2.322492, 0.334195, 3.457818, 1, 0, 0.09019608, 1,
2.33766, -0.1657267, 1.954883, 1, 0, 0.08235294, 1,
2.43896, -1.201461, 2.791759, 1, 0, 0.07843138, 1,
2.449726, -1.410118, 3.394178, 1, 0, 0.07058824, 1,
2.473861, 1.688487, 2.065005, 1, 0, 0.06666667, 1,
2.499953, 0.4914084, 0.2636842, 1, 0, 0.05882353, 1,
2.542298, 0.6528639, -0.1000832, 1, 0, 0.05490196, 1,
2.65344, 2.252252, 3.422101, 1, 0, 0.04705882, 1,
2.776848, -0.5381935, 1.222216, 1, 0, 0.04313726, 1,
2.862282, -2.419541, 2.826316, 1, 0, 0.03529412, 1,
2.888592, 0.6620281, 0.1701329, 1, 0, 0.03137255, 1,
2.961052, -0.2295315, 2.38046, 1, 0, 0.02352941, 1,
3.258602, -0.1405954, -0.1303215, 1, 0, 0.01960784, 1,
3.420484, 1.152282, 0.1315828, 1, 0, 0.01176471, 1,
3.578821, 0.7676275, 1.651603, 1, 0, 0.007843138, 1
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
0.3231099, -4.324804, -6.91691, 0, -0.5, 0.5, 0.5,
0.3231099, -4.324804, -6.91691, 1, -0.5, 0.5, 0.5,
0.3231099, -4.324804, -6.91691, 1, 1.5, 0.5, 0.5,
0.3231099, -4.324804, -6.91691, 0, 1.5, 0.5, 0.5
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
-4.036287, -0.1982471, -6.91691, 0, -0.5, 0.5, 0.5,
-4.036287, -0.1982471, -6.91691, 1, -0.5, 0.5, 0.5,
-4.036287, -0.1982471, -6.91691, 1, 1.5, 0.5, 0.5,
-4.036287, -0.1982471, -6.91691, 0, 1.5, 0.5, 0.5
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
-4.036287, -4.324804, 1.147006, 0, -0.5, 0.5, 0.5,
-4.036287, -4.324804, 1.147006, 1, -0.5, 0.5, 0.5,
-4.036287, -4.324804, 1.147006, 1, 1.5, 0.5, 0.5,
-4.036287, -4.324804, 1.147006, 0, 1.5, 0.5, 0.5
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
-2, -3.372522, -5.056006,
3, -3.372522, -5.056006,
-2, -3.372522, -5.056006,
-2, -3.531235, -5.366157,
-1, -3.372522, -5.056006,
-1, -3.531235, -5.366157,
0, -3.372522, -5.056006,
0, -3.531235, -5.366157,
1, -3.372522, -5.056006,
1, -3.531235, -5.366157,
2, -3.372522, -5.056006,
2, -3.531235, -5.366157,
3, -3.372522, -5.056006,
3, -3.531235, -5.366157
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
-2, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
-2, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
-2, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
-2, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5,
-1, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
-1, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
-1, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
-1, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5,
0, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
0, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
0, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
0, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5,
1, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
1, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
1, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
1, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5,
2, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
2, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
2, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
2, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5,
3, -3.848663, -5.986458, 0, -0.5, 0.5, 0.5,
3, -3.848663, -5.986458, 1, -0.5, 0.5, 0.5,
3, -3.848663, -5.986458, 1, 1.5, 0.5, 0.5,
3, -3.848663, -5.986458, 0, 1.5, 0.5, 0.5
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
-3.030272, -3, -5.056006,
-3.030272, 2, -5.056006,
-3.030272, -3, -5.056006,
-3.197941, -3, -5.366157,
-3.030272, -2, -5.056006,
-3.197941, -2, -5.366157,
-3.030272, -1, -5.056006,
-3.197941, -1, -5.366157,
-3.030272, 0, -5.056006,
-3.197941, 0, -5.366157,
-3.030272, 1, -5.056006,
-3.197941, 1, -5.366157,
-3.030272, 2, -5.056006,
-3.197941, 2, -5.366157
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
-3.53328, -3, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, -3, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, -3, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, -3, -5.986458, 0, 1.5, 0.5, 0.5,
-3.53328, -2, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, -2, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, -2, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, -2, -5.986458, 0, 1.5, 0.5, 0.5,
-3.53328, -1, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, -1, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, -1, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, -1, -5.986458, 0, 1.5, 0.5, 0.5,
-3.53328, 0, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, 0, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, 0, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, 0, -5.986458, 0, 1.5, 0.5, 0.5,
-3.53328, 1, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, 1, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, 1, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, 1, -5.986458, 0, 1.5, 0.5, 0.5,
-3.53328, 2, -5.986458, 0, -0.5, 0.5, 0.5,
-3.53328, 2, -5.986458, 1, -0.5, 0.5, 0.5,
-3.53328, 2, -5.986458, 1, 1.5, 0.5, 0.5,
-3.53328, 2, -5.986458, 0, 1.5, 0.5, 0.5
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
-3.030272, -3.372522, -4,
-3.030272, -3.372522, 6,
-3.030272, -3.372522, -4,
-3.197941, -3.531235, -4,
-3.030272, -3.372522, -2,
-3.197941, -3.531235, -2,
-3.030272, -3.372522, 0,
-3.197941, -3.531235, 0,
-3.030272, -3.372522, 2,
-3.197941, -3.531235, 2,
-3.030272, -3.372522, 4,
-3.197941, -3.531235, 4,
-3.030272, -3.372522, 6,
-3.197941, -3.531235, 6
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
"4",
"6"
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
-3.53328, -3.848663, -4, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, -4, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, -4, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, -4, 0, 1.5, 0.5, 0.5,
-3.53328, -3.848663, -2, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, -2, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, -2, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, -2, 0, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 0, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 0, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 0, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 0, 0, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 2, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 2, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 2, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 2, 0, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 4, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 4, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 4, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 4, 0, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 6, 0, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 6, 1, -0.5, 0.5, 0.5,
-3.53328, -3.848663, 6, 1, 1.5, 0.5, 0.5,
-3.53328, -3.848663, 6, 0, 1.5, 0.5, 0.5
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
-3.030272, -3.372522, -5.056006,
-3.030272, 2.976027, -5.056006,
-3.030272, -3.372522, 7.350019,
-3.030272, 2.976027, 7.350019,
-3.030272, -3.372522, -5.056006,
-3.030272, -3.372522, 7.350019,
-3.030272, 2.976027, -5.056006,
-3.030272, 2.976027, 7.350019,
-3.030272, -3.372522, -5.056006,
3.676492, -3.372522, -5.056006,
-3.030272, -3.372522, 7.350019,
3.676492, -3.372522, 7.350019,
-3.030272, 2.976027, -5.056006,
3.676492, 2.976027, -5.056006,
-3.030272, 2.976027, 7.350019,
3.676492, 2.976027, 7.350019,
3.676492, -3.372522, -5.056006,
3.676492, 2.976027, -5.056006,
3.676492, -3.372522, 7.350019,
3.676492, 2.976027, 7.350019,
3.676492, -3.372522, -5.056006,
3.676492, -3.372522, 7.350019,
3.676492, 2.976027, -5.056006,
3.676492, 2.976027, 7.350019
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
var radius = 8.258493;
var distance = 36.74297;
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
mvMatrix.translate( -0.3231099, 0.1982471, -1.147006 );
mvMatrix.scale( 1.331379, 1.406502, 0.7197506 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.74297);
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
Asulam<-read.table("Asulam.xyz", skip=1)
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
-2.932601, -1.01497, -1.690137, 0, 0, 1, 1, 1,
-2.924796, -1.075038, -0.491872, 1, 0, 0, 1, 1,
-2.564663, 0.4593084, -0.03587849, 1, 0, 0, 1, 1,
-2.461342, -1.068631, -2.181786, 1, 0, 0, 1, 1,
-2.454123, 2.599413, -1.289151, 1, 0, 0, 1, 1,
-2.400271, 0.05118584, -0.3061435, 1, 0, 0, 1, 1,
-2.372968, -0.7979487, -0.601249, 0, 0, 0, 1, 1,
-2.319787, -0.2562151, -0.8570076, 0, 0, 0, 1, 1,
-2.184249, 1.662396, -0.2505608, 0, 0, 0, 1, 1,
-2.15961, 2.406604, 0.1763512, 0, 0, 0, 1, 1,
-2.152118, -1.751823, -2.134047, 0, 0, 0, 1, 1,
-2.13508, 0.6424037, -3.105788, 0, 0, 0, 1, 1,
-2.122104, -0.1000571, -1.23644, 0, 0, 0, 1, 1,
-2.110724, -0.8322815, -3.322016, 1, 1, 1, 1, 1,
-2.110286, 1.550514, -0.03623642, 1, 1, 1, 1, 1,
-2.049771, 0.05933483, -0.3481782, 1, 1, 1, 1, 1,
-2.005676, -0.08433728, -1.15018, 1, 1, 1, 1, 1,
-1.998056, 0.2414651, -2.021097, 1, 1, 1, 1, 1,
-1.990521, 1.11732, -2.030538, 1, 1, 1, 1, 1,
-1.981298, -0.7099481, -2.168996, 1, 1, 1, 1, 1,
-1.941173, -0.6284141, -1.458671, 1, 1, 1, 1, 1,
-1.939162, -0.9988327, -3.256419, 1, 1, 1, 1, 1,
-1.933308, 1.134329, -1.804058, 1, 1, 1, 1, 1,
-1.922472, 1.13276, -3.082728, 1, 1, 1, 1, 1,
-1.90535, 0.9003865, -0.1544124, 1, 1, 1, 1, 1,
-1.892163, 0.00604453, -2.805808, 1, 1, 1, 1, 1,
-1.888042, -0.06683835, -2.323641, 1, 1, 1, 1, 1,
-1.883991, -0.641839, -1.988424, 1, 1, 1, 1, 1,
-1.838881, 0.2813903, -2.333192, 0, 0, 1, 1, 1,
-1.819811, -1.020287, -2.99389, 1, 0, 0, 1, 1,
-1.817899, 0.9367603, -1.109328, 1, 0, 0, 1, 1,
-1.811422, -0.218796, -0.3284744, 1, 0, 0, 1, 1,
-1.787405, 1.427802, -0.631761, 1, 0, 0, 1, 1,
-1.769332, 0.6953309, -0.1452464, 1, 0, 0, 1, 1,
-1.765807, 1.088463, 2.261062, 0, 0, 0, 1, 1,
-1.752736, -0.6144103, -2.879676, 0, 0, 0, 1, 1,
-1.752608, 0.7203752, -0.6085597, 0, 0, 0, 1, 1,
-1.748912, -1.187209, -2.092346, 0, 0, 0, 1, 1,
-1.745921, 1.04057, -1.748912, 0, 0, 0, 1, 1,
-1.731591, -3.280067, -1.792304, 0, 0, 0, 1, 1,
-1.712568, 0.7845747, -0.3345423, 0, 0, 0, 1, 1,
-1.699599, 0.7631878, -1.745649, 1, 1, 1, 1, 1,
-1.685704, 2.042177, -1.12885, 1, 1, 1, 1, 1,
-1.674942, 0.2543029, -0.2509746, 1, 1, 1, 1, 1,
-1.673395, -0.0268246, -0.7779069, 1, 1, 1, 1, 1,
-1.649496, 0.4144181, -1.759221, 1, 1, 1, 1, 1,
-1.642391, -1.074345, -1.971094, 1, 1, 1, 1, 1,
-1.638008, -0.9981236, -1.274628, 1, 1, 1, 1, 1,
-1.617056, -0.4367325, -1.591285, 1, 1, 1, 1, 1,
-1.607868, 1.252863, 0.02221195, 1, 1, 1, 1, 1,
-1.594823, -0.05625117, -2.015574, 1, 1, 1, 1, 1,
-1.579516, -0.5555323, -2.442744, 1, 1, 1, 1, 1,
-1.54742, -0.7845966, -2.207892, 1, 1, 1, 1, 1,
-1.54621, 0.7495014, -0.3619571, 1, 1, 1, 1, 1,
-1.534482, -0.1076926, -1.484205, 1, 1, 1, 1, 1,
-1.527139, 0.3812803, -2.62813, 1, 1, 1, 1, 1,
-1.523287, 0.9850791, -1.58476, 0, 0, 1, 1, 1,
-1.521901, -0.3583201, -1.46471, 1, 0, 0, 1, 1,
-1.508554, -0.127241, -0.6945112, 1, 0, 0, 1, 1,
-1.506844, 0.9430739, -3.035072, 1, 0, 0, 1, 1,
-1.503449, -1.430815, -1.726156, 1, 0, 0, 1, 1,
-1.492362, 0.2429587, -1.312661, 1, 0, 0, 1, 1,
-1.47901, 1.154358, -1.125627, 0, 0, 0, 1, 1,
-1.472788, 0.8801919, -1.479143, 0, 0, 0, 1, 1,
-1.470989, 0.4782773, -0.6379281, 0, 0, 0, 1, 1,
-1.46518, -1.384123, -1.02713, 0, 0, 0, 1, 1,
-1.459205, 0.5796857, -1.341064, 0, 0, 0, 1, 1,
-1.458547, 1.272393, -1.970528, 0, 0, 0, 1, 1,
-1.45557, -0.2398685, -2.641191, 0, 0, 0, 1, 1,
-1.433487, 1.275196, -1.137537, 1, 1, 1, 1, 1,
-1.432243, -0.03259403, -1.245149, 1, 1, 1, 1, 1,
-1.430794, 0.497748, -2.02737, 1, 1, 1, 1, 1,
-1.427689, 0.7254635, -1.817052, 1, 1, 1, 1, 1,
-1.410513, -2.598915, -3.44571, 1, 1, 1, 1, 1,
-1.403868, -0.6444475, -1.210644, 1, 1, 1, 1, 1,
-1.403032, -0.4305151, -2.921757, 1, 1, 1, 1, 1,
-1.400241, -0.30481, -2.181723, 1, 1, 1, 1, 1,
-1.400176, -0.347337, -1.410284, 1, 1, 1, 1, 1,
-1.399465, -1.26245, -3.71245, 1, 1, 1, 1, 1,
-1.394543, 0.2540439, -1.160307, 1, 1, 1, 1, 1,
-1.38652, 0.3392809, -2.289134, 1, 1, 1, 1, 1,
-1.367648, -1.520338, -3.304939, 1, 1, 1, 1, 1,
-1.344728, -0.4315268, -2.415303, 1, 1, 1, 1, 1,
-1.342926, 0.8790779, -1.684474, 1, 1, 1, 1, 1,
-1.34218, 0.466104, -2.677746, 0, 0, 1, 1, 1,
-1.342168, 0.6600158, -0.1476132, 1, 0, 0, 1, 1,
-1.341642, -2.047289, -1.531317, 1, 0, 0, 1, 1,
-1.331006, 0.6028044, -1.482306, 1, 0, 0, 1, 1,
-1.322646, -1.180508, -2.073467, 1, 0, 0, 1, 1,
-1.320764, -0.2025409, -3.456564, 1, 0, 0, 1, 1,
-1.318594, -1.520194, -1.894563, 0, 0, 0, 1, 1,
-1.315197, 1.839532, 1.563564, 0, 0, 0, 1, 1,
-1.307287, -0.2385483, -2.370304, 0, 0, 0, 1, 1,
-1.292886, 0.4813038, -1.400845, 0, 0, 0, 1, 1,
-1.292185, -1.262748, -2.070958, 0, 0, 0, 1, 1,
-1.27077, 0.9846203, -1.289292, 0, 0, 0, 1, 1,
-1.269191, -0.7965199, -1.385402, 0, 0, 0, 1, 1,
-1.268897, -1.296625, -2.287409, 1, 1, 1, 1, 1,
-1.266165, 1.344954, -0.6122435, 1, 1, 1, 1, 1,
-1.259943, 0.2433199, -1.41188, 1, 1, 1, 1, 1,
-1.255856, -1.351648, -1.754582, 1, 1, 1, 1, 1,
-1.252363, 0.6644919, -1.046321, 1, 1, 1, 1, 1,
-1.247382, 0.0035963, -1.761629, 1, 1, 1, 1, 1,
-1.245912, 1.077791, 0.01833446, 1, 1, 1, 1, 1,
-1.245645, 0.5702036, -0.4860512, 1, 1, 1, 1, 1,
-1.237791, -0.5335701, -2.243136, 1, 1, 1, 1, 1,
-1.236767, 2.276239, 0.05974016, 1, 1, 1, 1, 1,
-1.23355, -0.03067271, -0.7951629, 1, 1, 1, 1, 1,
-1.228059, 0.6887086, -1.047915, 1, 1, 1, 1, 1,
-1.221641, 1.362018, -1.437066, 1, 1, 1, 1, 1,
-1.213226, -0.8183333, -1.607615, 1, 1, 1, 1, 1,
-1.21269, 1.399027, 0.135427, 1, 1, 1, 1, 1,
-1.210543, -1.234392, -2.095926, 0, 0, 1, 1, 1,
-1.201934, -1.405658, -2.910075, 1, 0, 0, 1, 1,
-1.199237, 1.360014, -0.9666251, 1, 0, 0, 1, 1,
-1.177789, 0.3260911, -2.038926, 1, 0, 0, 1, 1,
-1.171809, 0.5885478, -1.332278, 1, 0, 0, 1, 1,
-1.160301, -0.7030152, -2.703469, 1, 0, 0, 1, 1,
-1.159176, 1.440001, -0.3792291, 0, 0, 0, 1, 1,
-1.152095, 1.462212, 0.1206924, 0, 0, 0, 1, 1,
-1.150563, -0.3678506, -2.346123, 0, 0, 0, 1, 1,
-1.145736, 1.321073, -0.7357961, 0, 0, 0, 1, 1,
-1.140452, -0.03954002, -2.519539, 0, 0, 0, 1, 1,
-1.136191, 0.2144624, -1.429559, 0, 0, 0, 1, 1,
-1.134443, -0.2135859, -1.357823, 0, 0, 0, 1, 1,
-1.125623, 0.2849678, -0.1533275, 1, 1, 1, 1, 1,
-1.121532, 0.3461791, -1.028309, 1, 1, 1, 1, 1,
-1.112526, 1.884164, -0.002983103, 1, 1, 1, 1, 1,
-1.100603, -0.4815296, 0.02177364, 1, 1, 1, 1, 1,
-1.096579, -0.819643, -3.648382, 1, 1, 1, 1, 1,
-1.093663, -2.470623, -4.743379, 1, 1, 1, 1, 1,
-1.088363, 0.6950813, 0.4415135, 1, 1, 1, 1, 1,
-1.087294, 1.166771, -0.6671153, 1, 1, 1, 1, 1,
-1.086212, 0.03238957, -0.519823, 1, 1, 1, 1, 1,
-1.081983, -1.041195, -0.4051034, 1, 1, 1, 1, 1,
-1.080215, 0.1756571, -1.486205, 1, 1, 1, 1, 1,
-1.075669, 0.2040041, -1.848422, 1, 1, 1, 1, 1,
-1.074461, 0.3292186, -1.761599, 1, 1, 1, 1, 1,
-1.073217, 1.153887, -0.1710656, 1, 1, 1, 1, 1,
-1.070744, 0.8827389, -0.217514, 1, 1, 1, 1, 1,
-1.069379, 0.8243761, -1.525164, 0, 0, 1, 1, 1,
-1.066875, -0.4127854, -1.356426, 1, 0, 0, 1, 1,
-1.057616, -0.243766, -3.579526, 1, 0, 0, 1, 1,
-1.053589, 0.6516407, 0.1547118, 1, 0, 0, 1, 1,
-1.051068, 0.05798038, -1.438673, 1, 0, 0, 1, 1,
-1.050574, -2.054617, -3.534574, 1, 0, 0, 1, 1,
-1.050204, -1.390187, -2.500442, 0, 0, 0, 1, 1,
-1.049168, 0.3458574, -3.557988, 0, 0, 0, 1, 1,
-1.047942, 0.7958316, -0.3506377, 0, 0, 0, 1, 1,
-1.046534, 0.2924016, -0.6213683, 0, 0, 0, 1, 1,
-1.03713, -0.986664, -2.256683, 0, 0, 0, 1, 1,
-1.036926, -0.3771859, -2.375782, 0, 0, 0, 1, 1,
-1.031593, 0.8514506, 0.3984648, 0, 0, 0, 1, 1,
-1.00813, 0.2404429, 1.245588, 1, 1, 1, 1, 1,
-1.005124, 2.602626, 1.709937, 1, 1, 1, 1, 1,
-0.9963184, 0.4519404, -3.440738, 1, 1, 1, 1, 1,
-0.9938436, 1.336784, -1.182789, 1, 1, 1, 1, 1,
-0.9908917, 0.3832663, -1.648452, 1, 1, 1, 1, 1,
-0.9893138, -1.12444, -0.9884419, 1, 1, 1, 1, 1,
-0.9720284, 1.212327, 0.1070218, 1, 1, 1, 1, 1,
-0.9673499, -1.657237, -4.116108, 1, 1, 1, 1, 1,
-0.960946, 0.4869529, 0.6196593, 1, 1, 1, 1, 1,
-0.9557937, 0.3113084, -2.673956, 1, 1, 1, 1, 1,
-0.9557475, -1.765938, -2.175358, 1, 1, 1, 1, 1,
-0.9535904, -0.5514523, -1.341422, 1, 1, 1, 1, 1,
-0.9514305, 0.4607703, -1.218723, 1, 1, 1, 1, 1,
-0.9488954, -1.30189, -2.9872, 1, 1, 1, 1, 1,
-0.946752, -1.531184, -4.059195, 1, 1, 1, 1, 1,
-0.9421136, 0.5641212, -0.8345385, 0, 0, 1, 1, 1,
-0.9237631, 0.4490827, -2.346326, 1, 0, 0, 1, 1,
-0.9209638, -0.2241368, -1.91596, 1, 0, 0, 1, 1,
-0.918525, 1.022237, -1.955495, 1, 0, 0, 1, 1,
-0.9179397, -1.661605, -2.600188, 1, 0, 0, 1, 1,
-0.9107084, 1.621459, 0.6490084, 1, 0, 0, 1, 1,
-0.9077715, 0.6504733, -0.150575, 0, 0, 0, 1, 1,
-0.9072412, -0.07343075, -1.492948, 0, 0, 0, 1, 1,
-0.8985959, -0.8640661, -2.394805, 0, 0, 0, 1, 1,
-0.8972262, -1.138468, -1.701536, 0, 0, 0, 1, 1,
-0.8954037, 0.8154026, -1.357361, 0, 0, 0, 1, 1,
-0.871601, -1.893978, -2.304771, 0, 0, 0, 1, 1,
-0.8685024, 0.04190674, -1.453784, 0, 0, 0, 1, 1,
-0.8674741, 0.990123, -1.742186, 1, 1, 1, 1, 1,
-0.8609709, -0.2408085, -4.350718, 1, 1, 1, 1, 1,
-0.8545871, -0.4225586, -0.1946332, 1, 1, 1, 1, 1,
-0.8525491, -0.4511068, -0.4646653, 1, 1, 1, 1, 1,
-0.8474798, -2.737642, -1.34597, 1, 1, 1, 1, 1,
-0.8423818, -1.156216, -2.153367, 1, 1, 1, 1, 1,
-0.841849, -0.648589, -2.304384, 1, 1, 1, 1, 1,
-0.8402599, 0.4211188, -1.413237, 1, 1, 1, 1, 1,
-0.8372465, 1.307876, 1.415829, 1, 1, 1, 1, 1,
-0.8359041, 0.08865567, -2.35717, 1, 1, 1, 1, 1,
-0.8339427, 1.000269, 0.9348519, 1, 1, 1, 1, 1,
-0.8337498, -1.897597, -1.798442, 1, 1, 1, 1, 1,
-0.8331642, 1.182329, -1.519443, 1, 1, 1, 1, 1,
-0.8317107, 0.3830033, -2.627254, 1, 1, 1, 1, 1,
-0.8277894, -1.037745, -1.980359, 1, 1, 1, 1, 1,
-0.8259975, 1.035274, -1.625357, 0, 0, 1, 1, 1,
-0.8256021, -0.6790175, -2.22673, 1, 0, 0, 1, 1,
-0.8247221, 0.2687021, -0.4526554, 1, 0, 0, 1, 1,
-0.8239538, 1.296421, -2.608068, 1, 0, 0, 1, 1,
-0.8229068, -0.8107819, -2.910407, 1, 0, 0, 1, 1,
-0.8200595, -0.9607899, -3.326383, 1, 0, 0, 1, 1,
-0.8171247, 0.6691756, -1.160856, 0, 0, 0, 1, 1,
-0.7934136, 0.8584078, -2.206891, 0, 0, 0, 1, 1,
-0.7916716, -0.03651283, -1.870362, 0, 0, 0, 1, 1,
-0.7913176, -0.3797992, -1.637381, 0, 0, 0, 1, 1,
-0.7873206, -0.2674599, -1.215339, 0, 0, 0, 1, 1,
-0.7870977, -1.763129, -2.409041, 0, 0, 0, 1, 1,
-0.7860507, 1.603129, -0.8673528, 0, 0, 0, 1, 1,
-0.7783746, -0.5311319, -1.975419, 1, 1, 1, 1, 1,
-0.7736043, -0.296124, -1.896428, 1, 1, 1, 1, 1,
-0.7733243, -0.3099875, -3.145687, 1, 1, 1, 1, 1,
-0.7731033, -0.710177, -2.253741, 1, 1, 1, 1, 1,
-0.7712457, 0.2711733, -1.64418, 1, 1, 1, 1, 1,
-0.7711833, -0.04033885, -3.040474, 1, 1, 1, 1, 1,
-0.7681601, -1.416543, -2.63152, 1, 1, 1, 1, 1,
-0.7670157, 1.42932, 0.877555, 1, 1, 1, 1, 1,
-0.7513276, -1.501061, -4.043862, 1, 1, 1, 1, 1,
-0.735368, -0.2605655, -0.9904347, 1, 1, 1, 1, 1,
-0.7257482, 1.300327, 1.225622, 1, 1, 1, 1, 1,
-0.7256951, 0.3466848, -1.304634, 1, 1, 1, 1, 1,
-0.7209929, 0.9949639, -2.120699, 1, 1, 1, 1, 1,
-0.7179921, -0.15695, -1.352614, 1, 1, 1, 1, 1,
-0.7159501, -0.1954965, -1.410333, 1, 1, 1, 1, 1,
-0.7037155, -0.440785, -0.8252743, 0, 0, 1, 1, 1,
-0.7019423, -1.246239, -1.790101, 1, 0, 0, 1, 1,
-0.6964217, -1.139899, -3.305765, 1, 0, 0, 1, 1,
-0.695082, -1.213731, -1.572077, 1, 0, 0, 1, 1,
-0.6931657, 0.802734, -1.255567, 1, 0, 0, 1, 1,
-0.6895944, 0.6641002, 0.4444889, 1, 0, 0, 1, 1,
-0.6861436, 1.060616, 1.525205, 0, 0, 0, 1, 1,
-0.6779213, -0.5972101, -2.896082, 0, 0, 0, 1, 1,
-0.6697648, -1.738878, -4.455636, 0, 0, 0, 1, 1,
-0.6657727, -0.7383392, -2.527676, 0, 0, 0, 1, 1,
-0.6629273, -0.1815168, -0.5436635, 0, 0, 0, 1, 1,
-0.6576971, -0.5188749, -3.316796, 0, 0, 0, 1, 1,
-0.6565415, -0.6958491, -1.087636, 0, 0, 0, 1, 1,
-0.6550542, -0.3687817, -1.500977, 1, 1, 1, 1, 1,
-0.6517373, 0.2459795, 0.3819953, 1, 1, 1, 1, 1,
-0.6493109, 0.03565891, -1.113596, 1, 1, 1, 1, 1,
-0.6468126, 0.1855047, -1.3568, 1, 1, 1, 1, 1,
-0.6465997, 0.4364983, 1.173239, 1, 1, 1, 1, 1,
-0.6463315, 0.7683166, -0.7599996, 1, 1, 1, 1, 1,
-0.6377333, 0.09755187, -2.756037, 1, 1, 1, 1, 1,
-0.6367892, -0.1636184, -2.612517, 1, 1, 1, 1, 1,
-0.6345818, 1.284598, -1.924055, 1, 1, 1, 1, 1,
-0.632926, -0.04286931, -0.1665461, 1, 1, 1, 1, 1,
-0.6307769, 1.448191, -1.423339, 1, 1, 1, 1, 1,
-0.6288437, 0.9160044, -0.01668865, 1, 1, 1, 1, 1,
-0.6263008, -1.14071, -1.818654, 1, 1, 1, 1, 1,
-0.6250186, 0.7608023, -0.06466825, 1, 1, 1, 1, 1,
-0.6147002, 1.553733, -0.06724302, 1, 1, 1, 1, 1,
-0.6038153, 0.1480632, -1.359077, 0, 0, 1, 1, 1,
-0.5996078, -0.01834787, -1.920732, 1, 0, 0, 1, 1,
-0.5919683, 1.357349, -0.4550876, 1, 0, 0, 1, 1,
-0.5869901, -1.379115, -1.845596, 1, 0, 0, 1, 1,
-0.5859963, -0.9331461, -1.265964, 1, 0, 0, 1, 1,
-0.5828646, -0.8785186, -2.59874, 1, 0, 0, 1, 1,
-0.5782719, 1.481737, -0.8442783, 0, 0, 0, 1, 1,
-0.5768625, -1.249531, -2.739011, 0, 0, 0, 1, 1,
-0.5683742, 0.1768981, -1.071845, 0, 0, 0, 1, 1,
-0.564629, -2.303928, -2.253228, 0, 0, 0, 1, 1,
-0.5639635, -1.214416, -3.428197, 0, 0, 0, 1, 1,
-0.5635781, -0.3114814, -0.9884683, 0, 0, 0, 1, 1,
-0.5633639, 0.1537821, -1.710022, 0, 0, 0, 1, 1,
-0.5545083, -0.3450097, -2.571473, 1, 1, 1, 1, 1,
-0.5540496, -0.453203, -1.278794, 1, 1, 1, 1, 1,
-0.5524576, 0.6845616, 0.5985067, 1, 1, 1, 1, 1,
-0.5476545, -0.06044749, -0.9434169, 1, 1, 1, 1, 1,
-0.5463198, 0.8611931, -1.229324, 1, 1, 1, 1, 1,
-0.5450763, 0.8987439, -1.235839, 1, 1, 1, 1, 1,
-0.5446678, -0.1774122, -1.910399, 1, 1, 1, 1, 1,
-0.5381463, -0.8752928, -1.333606, 1, 1, 1, 1, 1,
-0.5329732, 0.3444998, -1.523735, 1, 1, 1, 1, 1,
-0.5308496, -1.242162, -2.071635, 1, 1, 1, 1, 1,
-0.5277557, 0.3932452, 0.4571995, 1, 1, 1, 1, 1,
-0.5258791, -2.318578, -2.271159, 1, 1, 1, 1, 1,
-0.5156655, -1.084075, -3.219393, 1, 1, 1, 1, 1,
-0.513759, -0.05084692, -2.118554, 1, 1, 1, 1, 1,
-0.5105395, 0.03149738, -0.4836109, 1, 1, 1, 1, 1,
-0.5096917, 0.2017714, -2.105098, 0, 0, 1, 1, 1,
-0.4973088, -0.6571159, -1.508496, 1, 0, 0, 1, 1,
-0.4959221, 0.4033116, -0.7319478, 1, 0, 0, 1, 1,
-0.4949144, 0.1120401, -1.902663, 1, 0, 0, 1, 1,
-0.4935271, 0.3823235, -1.129911, 1, 0, 0, 1, 1,
-0.488532, -0.08894002, -0.4729605, 1, 0, 0, 1, 1,
-0.4844744, 0.5448853, -1.61618, 0, 0, 0, 1, 1,
-0.4836287, 0.1885851, -0.2568633, 0, 0, 0, 1, 1,
-0.4822507, 1.106216, 1.020979, 0, 0, 0, 1, 1,
-0.4785508, 2.12172, -1.848187, 0, 0, 0, 1, 1,
-0.4748852, 1.110176, -0.5356919, 0, 0, 0, 1, 1,
-0.4734883, -1.069774, -0.705658, 0, 0, 0, 1, 1,
-0.4731811, 0.7179928, -0.4250314, 0, 0, 0, 1, 1,
-0.461722, 1.222789, 0.2745742, 1, 1, 1, 1, 1,
-0.4613981, 0.6129591, 0.4663394, 1, 1, 1, 1, 1,
-0.4594334, -0.1253909, -2.875784, 1, 1, 1, 1, 1,
-0.4569926, -0.07692639, -1.835955, 1, 1, 1, 1, 1,
-0.4552739, -0.2694222, -2.466341, 1, 1, 1, 1, 1,
-0.4517532, 1.252293, -1.999051, 1, 1, 1, 1, 1,
-0.4514485, -0.460574, -1.623511, 1, 1, 1, 1, 1,
-0.4480921, 1.386173, -0.4968351, 1, 1, 1, 1, 1,
-0.4456955, -0.2544844, -3.077745, 1, 1, 1, 1, 1,
-0.4450023, -0.1577314, -3.050312, 1, 1, 1, 1, 1,
-0.4343388, -1.340689, -2.672396, 1, 1, 1, 1, 1,
-0.4331044, 0.1324462, -2.054234, 1, 1, 1, 1, 1,
-0.431955, -0.6604786, -3.23616, 1, 1, 1, 1, 1,
-0.429751, -0.2290828, -1.523557, 1, 1, 1, 1, 1,
-0.4284589, 0.3061541, -1.904572, 1, 1, 1, 1, 1,
-0.4279559, -2.917383, -4.326077, 0, 0, 1, 1, 1,
-0.4275123, -0.5284729, -1.971242, 1, 0, 0, 1, 1,
-0.4272658, -0.4305776, -4.178745, 1, 0, 0, 1, 1,
-0.4269872, 0.2772879, -1.681537, 1, 0, 0, 1, 1,
-0.4269586, 0.6608232, -0.519016, 1, 0, 0, 1, 1,
-0.4247075, -0.01436437, -1.733089, 1, 0, 0, 1, 1,
-0.4228612, -0.3060351, -4.874702, 0, 0, 0, 1, 1,
-0.4208623, -0.2333304, -3.775514, 0, 0, 0, 1, 1,
-0.4202754, -1.089275, -2.760092, 0, 0, 0, 1, 1,
-0.4183176, 0.5456136, -1.422815, 0, 0, 0, 1, 1,
-0.4179727, -0.5312924, -0.3716144, 0, 0, 0, 1, 1,
-0.4081136, 0.7590863, -0.6591269, 0, 0, 0, 1, 1,
-0.4039856, 1.663386, 0.8377741, 0, 0, 0, 1, 1,
-0.4018169, -0.4439036, -0.3026803, 1, 1, 1, 1, 1,
-0.4001835, 0.2938782, -1.487817, 1, 1, 1, 1, 1,
-0.3963974, 0.8377924, 1.144759, 1, 1, 1, 1, 1,
-0.3948068, 0.3559191, -0.8272678, 1, 1, 1, 1, 1,
-0.3941958, 0.9437092, -0.6682662, 1, 1, 1, 1, 1,
-0.3873437, -0.7056291, -3.167018, 1, 1, 1, 1, 1,
-0.3870441, 0.02642186, -1.989679, 1, 1, 1, 1, 1,
-0.3860475, -0.778624, -1.687235, 1, 1, 1, 1, 1,
-0.3852135, -2.923699, -3.533541, 1, 1, 1, 1, 1,
-0.3839826, -0.8131833, -2.560715, 1, 1, 1, 1, 1,
-0.3791515, -0.7321386, -2.52243, 1, 1, 1, 1, 1,
-0.3720956, 0.4180816, 0.02650382, 1, 1, 1, 1, 1,
-0.3720022, -0.6853175, -3.230923, 1, 1, 1, 1, 1,
-0.3718278, 0.001439629, -1.514953, 1, 1, 1, 1, 1,
-0.3685712, -0.8388345, -2.250405, 1, 1, 1, 1, 1,
-0.366434, 0.5173861, -1.908875, 0, 0, 1, 1, 1,
-0.3656813, -0.5824353, -1.086447, 1, 0, 0, 1, 1,
-0.3623769, -1.333678, -1.582082, 1, 0, 0, 1, 1,
-0.3605147, -0.2076913, -2.170292, 1, 0, 0, 1, 1,
-0.3578142, 1.617545, -0.1346692, 1, 0, 0, 1, 1,
-0.3555463, -1.203496, -3.900197, 1, 0, 0, 1, 1,
-0.3539861, 2.883573, -2.433054, 0, 0, 0, 1, 1,
-0.3483085, -0.09693245, -2.013728, 0, 0, 0, 1, 1,
-0.342391, -0.359538, -2.781988, 0, 0, 0, 1, 1,
-0.3408299, 0.7764193, 0.05078874, 0, 0, 0, 1, 1,
-0.3401009, -0.03410161, -2.136467, 0, 0, 0, 1, 1,
-0.3386969, 0.8828753, -0.2550834, 0, 0, 0, 1, 1,
-0.3350299, -0.003008622, -2.181343, 0, 0, 0, 1, 1,
-0.3333161, 0.4739598, -0.5912611, 1, 1, 1, 1, 1,
-0.3310398, 0.3153412, -1.33533, 1, 1, 1, 1, 1,
-0.330686, -0.1352514, -1.984939, 1, 1, 1, 1, 1,
-0.3249229, -0.5157933, -2.633115, 1, 1, 1, 1, 1,
-0.3236316, -1.883127, -2.67889, 1, 1, 1, 1, 1,
-0.3222121, -1.756673, -3.082484, 1, 1, 1, 1, 1,
-0.3160321, -1.507395, -3.761757, 1, 1, 1, 1, 1,
-0.3101746, 0.7661708, -1.093836, 1, 1, 1, 1, 1,
-0.3079184, -0.4374585, -2.135313, 1, 1, 1, 1, 1,
-0.3069133, 1.042283, -1.393459, 1, 1, 1, 1, 1,
-0.3022967, -0.0296861, -3.652804, 1, 1, 1, 1, 1,
-0.3015363, 0.8220783, -1.443438, 1, 1, 1, 1, 1,
-0.2931162, -1.011503, -3.421285, 1, 1, 1, 1, 1,
-0.2923491, -0.1871068, -0.876238, 1, 1, 1, 1, 1,
-0.2916287, -1.393489, -2.607896, 1, 1, 1, 1, 1,
-0.2911265, -0.2883335, -1.194028, 0, 0, 1, 1, 1,
-0.2884942, -0.6697769, -3.163081, 1, 0, 0, 1, 1,
-0.2775132, 1.267907, 0.2925394, 1, 0, 0, 1, 1,
-0.2771073, -0.07844392, -3.107788, 1, 0, 0, 1, 1,
-0.2766449, 0.01114675, -0.4848987, 1, 0, 0, 1, 1,
-0.274595, -0.4112396, -0.3691719, 1, 0, 0, 1, 1,
-0.2729284, -0.9766986, -3.020175, 0, 0, 0, 1, 1,
-0.2704748, -0.7950644, -3.880093, 0, 0, 0, 1, 1,
-0.2657207, -0.07068203, -1.454425, 0, 0, 0, 1, 1,
-0.2652244, 0.3470184, -0.4722714, 0, 0, 0, 1, 1,
-0.2557478, -1.269135, -3.695581, 0, 0, 0, 1, 1,
-0.253865, 0.872902, 1.871464, 0, 0, 0, 1, 1,
-0.2530488, 0.3951832, -1.142487, 0, 0, 0, 1, 1,
-0.2511309, 0.1827025, -2.877316, 1, 1, 1, 1, 1,
-0.2469262, 0.8208176, -1.017988, 1, 1, 1, 1, 1,
-0.24195, 0.5305488, 0.4449018, 1, 1, 1, 1, 1,
-0.241079, 0.2261975, -0.8130811, 1, 1, 1, 1, 1,
-0.238259, -0.3164479, -4.315403, 1, 1, 1, 1, 1,
-0.2335641, -1.113736, -0.9126888, 1, 1, 1, 1, 1,
-0.2316905, -0.8427337, -2.378327, 1, 1, 1, 1, 1,
-0.2230652, -1.903311, -3.328017, 1, 1, 1, 1, 1,
-0.2223723, 0.4375723, 0.7987277, 1, 1, 1, 1, 1,
-0.2215988, -1.793779, -3.464854, 1, 1, 1, 1, 1,
-0.2215951, -0.3140395, -1.114472, 1, 1, 1, 1, 1,
-0.2181701, 1.28041, -0.2783877, 1, 1, 1, 1, 1,
-0.2154959, -0.07556349, -1.502652, 1, 1, 1, 1, 1,
-0.2114043, 0.4511677, -0.7731844, 1, 1, 1, 1, 1,
-0.2100055, -0.2460072, -3.604281, 1, 1, 1, 1, 1,
-0.2085309, 0.03633764, -2.160885, 0, 0, 1, 1, 1,
-0.2075653, -0.1354175, -2.904483, 1, 0, 0, 1, 1,
-0.203767, -2.030136, -2.149189, 1, 0, 0, 1, 1,
-0.1998369, -0.9570369, -2.689974, 1, 0, 0, 1, 1,
-0.1976661, -1.178224, -3.344401, 1, 0, 0, 1, 1,
-0.1950964, -1.025488, -1.866522, 1, 0, 0, 1, 1,
-0.1876417, -1.01703, -4.03914, 0, 0, 0, 1, 1,
-0.186584, 1.900982, 0.1391253, 0, 0, 0, 1, 1,
-0.1831691, -2.60568, -4.030755, 0, 0, 0, 1, 1,
-0.1793246, 2.120341, 0.1582953, 0, 0, 0, 1, 1,
-0.1701221, -0.490594, -2.414084, 0, 0, 0, 1, 1,
-0.1682828, -0.2495276, -1.030713, 0, 0, 0, 1, 1,
-0.1664304, -1.856538, -2.638652, 0, 0, 0, 1, 1,
-0.1637058, -0.1679227, -2.967885, 1, 1, 1, 1, 1,
-0.1607069, -0.5172583, -1.119299, 1, 1, 1, 1, 1,
-0.1601378, 0.9965879, 1.751131, 1, 1, 1, 1, 1,
-0.1486509, 0.8925768, -0.1361171, 1, 1, 1, 1, 1,
-0.1475466, -0.06765029, -1.738729, 1, 1, 1, 1, 1,
-0.146476, 0.671071, -1.24245, 1, 1, 1, 1, 1,
-0.1441001, -2.702964, -0.4405293, 1, 1, 1, 1, 1,
-0.1440094, 2.125804, 1.048513, 1, 1, 1, 1, 1,
-0.1421447, -0.6448225, -2.350489, 1, 1, 1, 1, 1,
-0.1412966, 1.937894, -0.9752671, 1, 1, 1, 1, 1,
-0.1387153, 0.2822012, -0.8105388, 1, 1, 1, 1, 1,
-0.1344391, -0.381654, -3.655072, 1, 1, 1, 1, 1,
-0.1330917, -2.101994, -4.056589, 1, 1, 1, 1, 1,
-0.1326586, 2.17621, 1.231297, 1, 1, 1, 1, 1,
-0.1308305, -1.423053, -2.605994, 1, 1, 1, 1, 1,
-0.1283255, -1.661557, -4.094459, 0, 0, 1, 1, 1,
-0.1278842, -1.386883, -3.79559, 1, 0, 0, 1, 1,
-0.1229805, -0.2740406, -2.430454, 1, 0, 0, 1, 1,
-0.1228947, 0.8261492, -1.31988, 1, 0, 0, 1, 1,
-0.1195616, -0.9202283, -3.192221, 1, 0, 0, 1, 1,
-0.1193707, -0.1178086, -3.293469, 1, 0, 0, 1, 1,
-0.1128944, -0.06722897, -2.261519, 0, 0, 0, 1, 1,
-0.111774, -0.03437953, -1.714028, 0, 0, 0, 1, 1,
-0.1093608, -1.053272, -3.553953, 0, 0, 0, 1, 1,
-0.1070839, -1.002703, -4.039187, 0, 0, 0, 1, 1,
-0.1057712, -0.382567, -1.87076, 0, 0, 0, 1, 1,
-0.09946401, -0.06088199, -1.96841, 0, 0, 0, 1, 1,
-0.09782468, -1.782078, -3.643065, 0, 0, 0, 1, 1,
-0.09705132, 0.08091564, -0.6344574, 1, 1, 1, 1, 1,
-0.0960268, 1.928239, 0.5637717, 1, 1, 1, 1, 1,
-0.09588262, -0.7761394, -3.32752, 1, 1, 1, 1, 1,
-0.09540041, -1.347905, -2.281991, 1, 1, 1, 1, 1,
-0.09335203, -0.09800178, -2.574773, 1, 1, 1, 1, 1,
-0.0923005, 0.5760971, 0.6917801, 1, 1, 1, 1, 1,
-0.09045151, 0.5568219, -0.06666984, 1, 1, 1, 1, 1,
-0.08720401, -0.2511053, -2.99079, 1, 1, 1, 1, 1,
-0.08638209, 0.3005266, -0.3825693, 1, 1, 1, 1, 1,
-0.07783534, 1.316275, -0.2510612, 1, 1, 1, 1, 1,
-0.07611761, 1.384136, -0.8861201, 1, 1, 1, 1, 1,
-0.0739361, 0.9633367, -0.6039067, 1, 1, 1, 1, 1,
-0.0710592, -0.2068379, -4.875336, 1, 1, 1, 1, 1,
-0.06937052, 2.457664, 0.2028747, 1, 1, 1, 1, 1,
-0.06835514, 0.02418817, -1.887342, 1, 1, 1, 1, 1,
-0.06173734, -0.7967001, -3.163893, 0, 0, 1, 1, 1,
-0.05542955, 0.003685331, -1.294248, 1, 0, 0, 1, 1,
-0.05285692, 1.277048, 0.879728, 1, 0, 0, 1, 1,
-0.04890244, -0.9507493, -4.180783, 1, 0, 0, 1, 1,
-0.04764666, -0.6098144, -3.781887, 1, 0, 0, 1, 1,
-0.0466844, 1.42789, 1.964659, 1, 0, 0, 1, 1,
-0.04340686, -1.131642, -2.164553, 0, 0, 0, 1, 1,
-0.04046999, -0.1993435, -2.47739, 0, 0, 0, 1, 1,
-0.03987283, -0.4465764, -2.848713, 0, 0, 0, 1, 1,
-0.03865931, -0.1416042, -1.161964, 0, 0, 0, 1, 1,
-0.03852666, -0.6386212, -3.233636, 0, 0, 0, 1, 1,
-0.03776779, -0.217814, -2.215717, 0, 0, 0, 1, 1,
-0.03080517, 0.001359915, 0.8678382, 0, 0, 0, 1, 1,
-0.02875139, 0.179662, -0.2977769, 1, 1, 1, 1, 1,
-0.02864091, -0.8008034, -2.162716, 1, 1, 1, 1, 1,
-0.0269883, 1.55393, 0.9252938, 1, 1, 1, 1, 1,
-0.02631416, -0.01365286, -2.579258, 1, 1, 1, 1, 1,
-0.02443088, 0.5384025, -2.097137, 1, 1, 1, 1, 1,
-0.02026962, -0.3424592, -2.982107, 1, 1, 1, 1, 1,
-0.01954411, -0.7819441, -2.738214, 1, 1, 1, 1, 1,
-0.0155105, 1.337087, -0.1090067, 1, 1, 1, 1, 1,
-0.009846037, 0.6503912, -0.2222175, 1, 1, 1, 1, 1,
-0.008155681, -0.1765773, -1.939367, 1, 1, 1, 1, 1,
-0.005619609, -0.04589471, -3.438001, 1, 1, 1, 1, 1,
-0.003123813, -0.3334259, -2.923344, 1, 1, 1, 1, 1,
0.005113249, 0.1231964, -0.4622103, 1, 1, 1, 1, 1,
0.005511692, -0.06020553, 7.169348, 1, 1, 1, 1, 1,
0.009448326, 1.126676, -0.7145516, 1, 1, 1, 1, 1,
0.01001196, 0.6428295, -0.4200261, 0, 0, 1, 1, 1,
0.01484323, -0.1090828, 4.202368, 1, 0, 0, 1, 1,
0.01526918, -1.534598, 3.147582, 1, 0, 0, 1, 1,
0.01956507, -1.561196, 2.678293, 1, 0, 0, 1, 1,
0.02247029, 1.432794, -0.3321141, 1, 0, 0, 1, 1,
0.03009636, 0.8530726, 0.3138111, 1, 0, 0, 1, 1,
0.03278976, -0.4287385, 3.11236, 0, 0, 0, 1, 1,
0.03335352, 0.9139221, 0.9537417, 0, 0, 0, 1, 1,
0.03487071, -0.6764024, 2.730303, 0, 0, 0, 1, 1,
0.03899323, -0.1452591, 3.078627, 0, 0, 0, 1, 1,
0.0403325, -0.9661441, 3.220441, 0, 0, 0, 1, 1,
0.04193077, 0.9821391, 0.4535106, 0, 0, 0, 1, 1,
0.04876263, -0.3648544, 3.115587, 0, 0, 0, 1, 1,
0.04893967, -0.7882228, 5.572237, 1, 1, 1, 1, 1,
0.05065485, 2.294504, 0.3581944, 1, 1, 1, 1, 1,
0.0506613, 0.1555826, 1.144083, 1, 1, 1, 1, 1,
0.0544092, 1.154348, 1.445457, 1, 1, 1, 1, 1,
0.06063386, -1.625326, 3.790584, 1, 1, 1, 1, 1,
0.06267411, -1.670856, 2.420831, 1, 1, 1, 1, 1,
0.06898296, 0.06435999, 0.3111683, 1, 1, 1, 1, 1,
0.06984545, 0.02298234, 0.2235069, 1, 1, 1, 1, 1,
0.07049367, 0.3713344, 1.249975, 1, 1, 1, 1, 1,
0.07148442, -0.1781361, 3.621251, 1, 1, 1, 1, 1,
0.07265666, 0.3928528, 0.7677355, 1, 1, 1, 1, 1,
0.07538754, -0.4599062, 4.365773, 1, 1, 1, 1, 1,
0.07598725, 1.131076, 0.09062777, 1, 1, 1, 1, 1,
0.07602154, 1.934791, -0.76876, 1, 1, 1, 1, 1,
0.07710654, -1.613282, 3.169744, 1, 1, 1, 1, 1,
0.07814442, -0.2530743, 0.9654181, 0, 0, 1, 1, 1,
0.08338747, -0.5495636, 2.543963, 1, 0, 0, 1, 1,
0.08396209, 0.3537322, 1.032559, 1, 0, 0, 1, 1,
0.08538415, -0.06412192, 2.05449, 1, 0, 0, 1, 1,
0.08580986, -0.390897, 2.990986, 1, 0, 0, 1, 1,
0.09135014, -1.492269, 2.886782, 1, 0, 0, 1, 1,
0.09168322, 0.2719978, 0.662026, 0, 0, 0, 1, 1,
0.09488151, -0.4685699, 4.260323, 0, 0, 0, 1, 1,
0.09678237, -2.014226, 2.913159, 0, 0, 0, 1, 1,
0.1010593, 1.083787, -0.2044177, 0, 0, 0, 1, 1,
0.1055245, 0.4107338, -0.6021051, 0, 0, 0, 1, 1,
0.1057161, 1.192798, 0.3297034, 0, 0, 0, 1, 1,
0.1064689, 0.291085, 2.023045, 0, 0, 0, 1, 1,
0.110115, -0.04167217, -0.250826, 1, 1, 1, 1, 1,
0.1106695, -1.111949, 1.613276, 1, 1, 1, 1, 1,
0.1135446, 0.00950196, 4.141019, 1, 1, 1, 1, 1,
0.1186604, -1.044213, 2.624899, 1, 1, 1, 1, 1,
0.1202291, 0.03280145, 0.8821281, 1, 1, 1, 1, 1,
0.1216209, 0.3294045, 0.03634562, 1, 1, 1, 1, 1,
0.1235402, -0.4407224, 3.132303, 1, 1, 1, 1, 1,
0.1307249, -0.7402003, 3.433295, 1, 1, 1, 1, 1,
0.1308722, -0.8029501, 1.814199, 1, 1, 1, 1, 1,
0.1334318, 0.7688167, -0.4392869, 1, 1, 1, 1, 1,
0.1334881, -0.8336605, 3.350927, 1, 1, 1, 1, 1,
0.1337058, 1.576828, -0.6251541, 1, 1, 1, 1, 1,
0.1348941, -0.7662918, 4.14418, 1, 1, 1, 1, 1,
0.1359551, 1.566521, -1.359066, 1, 1, 1, 1, 1,
0.1369279, -0.400262, 2.408811, 1, 1, 1, 1, 1,
0.1409974, 0.01293426, 1.509589, 0, 0, 1, 1, 1,
0.1420944, -0.7905065, 3.599667, 1, 0, 0, 1, 1,
0.1443757, -1.078328, 3.582663, 1, 0, 0, 1, 1,
0.1475078, 0.6262912, 0.4107858, 1, 0, 0, 1, 1,
0.1544988, 1.011542, 0.5950908, 1, 0, 0, 1, 1,
0.1595594, 1.353138, -0.8058664, 1, 0, 0, 1, 1,
0.163328, 1.691153, 0.6258766, 0, 0, 0, 1, 1,
0.166706, 0.3790258, 2.535521, 0, 0, 0, 1, 1,
0.1714006, -2.857989, 3.939003, 0, 0, 0, 1, 1,
0.172419, -0.6926028, 2.924933, 0, 0, 0, 1, 1,
0.1732898, -0.789723, 1.842402, 0, 0, 0, 1, 1,
0.1734123, 0.1039311, 1.42525, 0, 0, 0, 1, 1,
0.1751776, 0.03669375, 0.3293751, 0, 0, 0, 1, 1,
0.177476, -0.3984195, 4.686031, 1, 1, 1, 1, 1,
0.1787406, 0.07996116, 2.080446, 1, 1, 1, 1, 1,
0.1814993, -0.959271, 2.017031, 1, 1, 1, 1, 1,
0.1864203, -0.970246, 2.6361, 1, 1, 1, 1, 1,
0.1869166, -0.7925574, 1.834429, 1, 1, 1, 1, 1,
0.1962089, -0.4208856, 1.768353, 1, 1, 1, 1, 1,
0.1970855, 0.2993739, 0.2515394, 1, 1, 1, 1, 1,
0.1990106, -1.226817, 1.972119, 1, 1, 1, 1, 1,
0.2010167, -0.8470488, 3.727153, 1, 1, 1, 1, 1,
0.2029898, -0.4804158, 2.014894, 1, 1, 1, 1, 1,
0.2036134, 0.6009827, 0.08450416, 1, 1, 1, 1, 1,
0.2041945, 0.9251758, 0.2232136, 1, 1, 1, 1, 1,
0.2063023, 0.02516441, 1.893079, 1, 1, 1, 1, 1,
0.2085557, -0.1217698, 2.269338, 1, 1, 1, 1, 1,
0.2117264, 2.276416, -1.89238, 1, 1, 1, 1, 1,
0.2148359, 1.682951, -2.301423, 0, 0, 1, 1, 1,
0.2154712, 0.8726162, 0.2351239, 1, 0, 0, 1, 1,
0.2164676, 1.351277, 0.6238352, 1, 0, 0, 1, 1,
0.2171052, -0.1784436, 0.6691025, 1, 0, 0, 1, 1,
0.2210678, 0.7696249, 1.297795, 1, 0, 0, 1, 1,
0.2229669, -0.8491845, 1.542145, 1, 0, 0, 1, 1,
0.2246802, -1.111411, 1.927824, 0, 0, 0, 1, 1,
0.2247511, 2.446241, 1.672654, 0, 0, 0, 1, 1,
0.2254405, 1.684321, -2.221705, 0, 0, 0, 1, 1,
0.2254576, 0.7978427, -1.452657, 0, 0, 0, 1, 1,
0.2264494, -0.5863436, 1.61836, 0, 0, 0, 1, 1,
0.227756, -0.2663853, 1.661749, 0, 0, 0, 1, 1,
0.2281227, 0.5914072, 1.121809, 0, 0, 0, 1, 1,
0.2286925, -0.2118205, 3.245651, 1, 1, 1, 1, 1,
0.2320978, -0.5562326, 4.00023, 1, 1, 1, 1, 1,
0.2344968, 1.274766, 0.6206293, 1, 1, 1, 1, 1,
0.2346601, -1.079905, 3.08425, 1, 1, 1, 1, 1,
0.2352954, 1.085658, -0.1494714, 1, 1, 1, 1, 1,
0.2360538, -0.2728346, 3.484439, 1, 1, 1, 1, 1,
0.2414433, -0.8271652, 2.732019, 1, 1, 1, 1, 1,
0.2427242, -1.517953, 2.316967, 1, 1, 1, 1, 1,
0.2432938, -0.833919, 2.481513, 1, 1, 1, 1, 1,
0.2440403, -1.464889, 1.597322, 1, 1, 1, 1, 1,
0.2447593, -0.05257559, 3.504528, 1, 1, 1, 1, 1,
0.2455954, -0.2817653, 1.049909, 1, 1, 1, 1, 1,
0.2554919, -1.171425, 3.558044, 1, 1, 1, 1, 1,
0.2578398, -1.079997, 3.271873, 1, 1, 1, 1, 1,
0.2604269, 0.1951691, -0.5233223, 1, 1, 1, 1, 1,
0.2617093, -1.35841, 3.024171, 0, 0, 1, 1, 1,
0.2619694, 0.2853267, 0.5172278, 1, 0, 0, 1, 1,
0.2622076, 1.913322, 0.3669461, 1, 0, 0, 1, 1,
0.2645178, 1.291317, 1.17587, 1, 0, 0, 1, 1,
0.2660995, 0.6127172, 1.5497, 1, 0, 0, 1, 1,
0.2672375, -0.8102634, 2.955131, 1, 0, 0, 1, 1,
0.2677057, -0.492414, 3.651644, 0, 0, 0, 1, 1,
0.2741708, 1.058114, 0.1907204, 0, 0, 0, 1, 1,
0.2762681, 1.215949, 0.5336021, 0, 0, 0, 1, 1,
0.2800742, 0.6032552, 0.965793, 0, 0, 0, 1, 1,
0.2806708, 0.9398243, -0.05595964, 0, 0, 0, 1, 1,
0.2816891, -1.068642, 1.729172, 0, 0, 0, 1, 1,
0.2834199, -0.175648, 1.854419, 0, 0, 0, 1, 1,
0.2875335, -1.450756, 3.47543, 1, 1, 1, 1, 1,
0.2897539, -0.8184616, 1.177261, 1, 1, 1, 1, 1,
0.29603, -0.2637804, 3.07884, 1, 1, 1, 1, 1,
0.2972701, -1.647792, 3.930691, 1, 1, 1, 1, 1,
0.3003096, 0.4691712, 0.8192506, 1, 1, 1, 1, 1,
0.3027018, 0.5114137, 0.04051732, 1, 1, 1, 1, 1,
0.30289, -0.7486771, 3.13944, 1, 1, 1, 1, 1,
0.3140073, -1.130865, 2.839143, 1, 1, 1, 1, 1,
0.3155253, -1.284567, 0.8940614, 1, 1, 1, 1, 1,
0.3162842, -1.042089, 1.003119, 1, 1, 1, 1, 1,
0.3213978, -0.6201025, 2.031811, 1, 1, 1, 1, 1,
0.3221347, -0.8213723, 2.160197, 1, 1, 1, 1, 1,
0.3247827, -0.97403, 3.344326, 1, 1, 1, 1, 1,
0.325826, 1.305408, 0.1709693, 1, 1, 1, 1, 1,
0.3259018, 0.7329982, 0.6705198, 1, 1, 1, 1, 1,
0.3265725, 0.4215143, -0.3558537, 0, 0, 1, 1, 1,
0.3267057, -0.7724194, 1.463616, 1, 0, 0, 1, 1,
0.3307209, -1.142943, 2.375341, 1, 0, 0, 1, 1,
0.3332755, 0.6350539, 1.910226, 1, 0, 0, 1, 1,
0.3362175, 0.3960833, 0.1377572, 1, 0, 0, 1, 1,
0.3389688, -0.251728, 2.437065, 1, 0, 0, 1, 1,
0.3436619, -0.1642859, 2.327349, 0, 0, 0, 1, 1,
0.3441761, -0.3001044, 2.277205, 0, 0, 0, 1, 1,
0.3483546, -2.284556, 2.971718, 0, 0, 0, 1, 1,
0.3503644, 0.7105128, -1.309512, 0, 0, 0, 1, 1,
0.3505204, 0.6077493, 0.8056812, 0, 0, 0, 1, 1,
0.354509, -1.139228, 0.1776713, 0, 0, 0, 1, 1,
0.3548961, -1.305408, 1.407783, 0, 0, 0, 1, 1,
0.3571819, 0.100714, 2.323678, 1, 1, 1, 1, 1,
0.3574101, -1.419068, 3.438803, 1, 1, 1, 1, 1,
0.3585453, 1.395654, -0.6264828, 1, 1, 1, 1, 1,
0.3598969, 0.251006, 0.8941694, 1, 1, 1, 1, 1,
0.3602309, -2.009883, 1.590582, 1, 1, 1, 1, 1,
0.362431, 0.3889566, 0.8811545, 1, 1, 1, 1, 1,
0.3656862, 1.099571, 0.9056476, 1, 1, 1, 1, 1,
0.3697515, 0.6103156, 0.7072356, 1, 1, 1, 1, 1,
0.3701336, 0.7452651, 0.699193, 1, 1, 1, 1, 1,
0.3750526, -0.5766484, 1.994995, 1, 1, 1, 1, 1,
0.3753785, -0.986931, 1.529342, 1, 1, 1, 1, 1,
0.3761503, 1.21815, -0.161054, 1, 1, 1, 1, 1,
0.3801692, -0.5541858, 3.378299, 1, 1, 1, 1, 1,
0.3851094, -0.03167143, 0.3665799, 1, 1, 1, 1, 1,
0.3881583, 0.6289222, 1.326599, 1, 1, 1, 1, 1,
0.389415, -1.736507, 3.161603, 0, 0, 1, 1, 1,
0.3907973, 1.920851, -0.4176854, 1, 0, 0, 1, 1,
0.4004749, -1.868971, 3.729001, 1, 0, 0, 1, 1,
0.4043216, -0.07949647, 2.542667, 1, 0, 0, 1, 1,
0.4065849, -0.1666099, 0.6180863, 1, 0, 0, 1, 1,
0.407235, 1.529554, -0.00072895, 1, 0, 0, 1, 1,
0.4119979, 0.01172675, 0.2813475, 0, 0, 0, 1, 1,
0.4127248, -0.2400311, 1.894577, 0, 0, 0, 1, 1,
0.4139827, 0.8811707, 0.8955771, 0, 0, 0, 1, 1,
0.4254214, -0.4211735, 2.213882, 0, 0, 0, 1, 1,
0.4256256, 0.1178109, 0.4284395, 0, 0, 0, 1, 1,
0.4270998, -1.349091, 3.614483, 0, 0, 0, 1, 1,
0.4277317, 0.8335305, 0.3641554, 0, 0, 0, 1, 1,
0.4279739, 0.07001343, -0.0969666, 1, 1, 1, 1, 1,
0.4280279, 0.06562791, 2.631712, 1, 1, 1, 1, 1,
0.4287126, 0.3218494, 0.5826059, 1, 1, 1, 1, 1,
0.4287426, 0.1981801, 1.774755, 1, 1, 1, 1, 1,
0.4305117, 1.482795, 1.408004, 1, 1, 1, 1, 1,
0.4389837, -0.0401639, 0.7250999, 1, 1, 1, 1, 1,
0.444207, -1.178233, 3.838214, 1, 1, 1, 1, 1,
0.4467, 0.524011, 2.507672, 1, 1, 1, 1, 1,
0.4477093, 1.292729, -2.103772, 1, 1, 1, 1, 1,
0.4511688, -0.8349958, 2.49571, 1, 1, 1, 1, 1,
0.4534994, -2.248107, 2.665153, 1, 1, 1, 1, 1,
0.4541173, -1.01862, 2.660982, 1, 1, 1, 1, 1,
0.4543166, -1.136684, 1.596722, 1, 1, 1, 1, 1,
0.458599, 1.493483, 0.4608242, 1, 1, 1, 1, 1,
0.4586741, -0.1121006, 1.887137, 1, 1, 1, 1, 1,
0.4628804, 0.4935102, -0.9690462, 0, 0, 1, 1, 1,
0.4712238, -0.09945097, 1.894855, 1, 0, 0, 1, 1,
0.4770244, -0.9160184, 3.188669, 1, 0, 0, 1, 1,
0.4780281, 0.2137055, 1.810924, 1, 0, 0, 1, 1,
0.4813898, 1.378135, 2.121381, 1, 0, 0, 1, 1,
0.482178, -0.9174359, 2.866495, 1, 0, 0, 1, 1,
0.483335, -1.035521, 1.656124, 0, 0, 0, 1, 1,
0.4834729, 0.544205, 1.807469, 0, 0, 0, 1, 1,
0.4923299, -0.8183501, 0.05229552, 0, 0, 0, 1, 1,
0.4988055, -0.4436169, 2.774688, 0, 0, 0, 1, 1,
0.5000064, -1.408446, 2.534605, 0, 0, 0, 1, 1,
0.5035636, -1.367122, 2.165186, 0, 0, 0, 1, 1,
0.5080817, 0.8463009, 1.585536, 0, 0, 0, 1, 1,
0.5096209, 0.2301464, 1.292144, 1, 1, 1, 1, 1,
0.5128847, -0.579025, 2.475882, 1, 1, 1, 1, 1,
0.5143769, -1.608075, 3.217918, 1, 1, 1, 1, 1,
0.5143778, 0.4486057, 1.144869, 1, 1, 1, 1, 1,
0.5181921, -0.1995582, 0.9450076, 1, 1, 1, 1, 1,
0.523417, 0.1410784, 0.488018, 1, 1, 1, 1, 1,
0.5237345, -0.1477516, 1.872469, 1, 1, 1, 1, 1,
0.524301, 0.8042558, 0.7129529, 1, 1, 1, 1, 1,
0.5252262, -0.9989092, 2.718357, 1, 1, 1, 1, 1,
0.5412484, 0.8934218, 1.782653, 1, 1, 1, 1, 1,
0.542779, 1.500598, 0.9798949, 1, 1, 1, 1, 1,
0.5453259, -0.5192571, 2.849847, 1, 1, 1, 1, 1,
0.5500759, -0.7465143, 0.5861489, 1, 1, 1, 1, 1,
0.5533996, 0.2076685, 1.840181, 1, 1, 1, 1, 1,
0.5590476, 0.1144999, 1.442734, 1, 1, 1, 1, 1,
0.5613683, 0.5925736, 0.9735816, 0, 0, 1, 1, 1,
0.5662019, 0.1139013, 2.900902, 1, 0, 0, 1, 1,
0.5704585, -0.1750571, 0.6218441, 1, 0, 0, 1, 1,
0.5766514, 0.4339396, 1.03896, 1, 0, 0, 1, 1,
0.5808292, -0.2783406, 1.431925, 1, 0, 0, 1, 1,
0.5838211, 0.5649771, 0.1953672, 1, 0, 0, 1, 1,
0.5920054, 2.709048, 0.1335299, 0, 0, 0, 1, 1,
0.6013466, -0.6080627, -0.2395242, 0, 0, 0, 1, 1,
0.6066196, 1.245044, 0.001642953, 0, 0, 0, 1, 1,
0.607069, 0.4060833, -0.1070321, 0, 0, 0, 1, 1,
0.6074401, 0.9172024, 1.963011, 0, 0, 0, 1, 1,
0.6107326, 1.682694, -1.073646, 0, 0, 0, 1, 1,
0.6135093, 0.5651672, 1.29192, 0, 0, 0, 1, 1,
0.6149402, 0.2979192, -0.006639495, 1, 1, 1, 1, 1,
0.6184559, 1.129812, 0.5886282, 1, 1, 1, 1, 1,
0.622372, 0.3562161, -0.8286952, 1, 1, 1, 1, 1,
0.6228125, -0.7960988, 3.357531, 1, 1, 1, 1, 1,
0.6254553, -1.160826, 3.016187, 1, 1, 1, 1, 1,
0.6302328, 0.8832273, 0.7094807, 1, 1, 1, 1, 1,
0.632486, -0.8719287, 0.3585901, 1, 1, 1, 1, 1,
0.6339828, 1.793303, 0.5691832, 1, 1, 1, 1, 1,
0.6412197, 1.620635, -0.4613701, 1, 1, 1, 1, 1,
0.6441477, -0.5757545, 0.5142737, 1, 1, 1, 1, 1,
0.6452079, 0.388761, 1.391621, 1, 1, 1, 1, 1,
0.6452881, -0.08158327, 1.032772, 1, 1, 1, 1, 1,
0.6456726, -1.10965, 1.206078, 1, 1, 1, 1, 1,
0.6458486, 0.9909306, 1.328231, 1, 1, 1, 1, 1,
0.6458923, -0.6057698, 2.856825, 1, 1, 1, 1, 1,
0.6538844, 1.417226, 0.482282, 0, 0, 1, 1, 1,
0.6547131, 0.2805794, 1.757216, 1, 0, 0, 1, 1,
0.6547254, -1.424244, 2.671927, 1, 0, 0, 1, 1,
0.6599885, -0.7295345, 3.32839, 1, 0, 0, 1, 1,
0.6609861, -1.578583, 2.013777, 1, 0, 0, 1, 1,
0.6611424, -0.2905311, 0.9772999, 1, 0, 0, 1, 1,
0.6649696, 1.137196, 0.2472077, 0, 0, 0, 1, 1,
0.6688946, -1.034458, 1.888275, 0, 0, 0, 1, 1,
0.6727083, -1.839267, 2.429233, 0, 0, 0, 1, 1,
0.6732584, -0.7226339, 2.349146, 0, 0, 0, 1, 1,
0.674655, -0.3577891, 0.2783977, 0, 0, 0, 1, 1,
0.6787171, 0.9758192, 0.0218954, 0, 0, 0, 1, 1,
0.6805271, -0.1538667, 2.688797, 0, 0, 0, 1, 1,
0.6860626, -1.017512, 3.669215, 1, 1, 1, 1, 1,
0.6900493, -0.8001948, 1.074863, 1, 1, 1, 1, 1,
0.6929001, 1.107726, 1.240004, 1, 1, 1, 1, 1,
0.6937456, -0.7831146, 0.5738702, 1, 1, 1, 1, 1,
0.7024707, 0.1394916, 2.238075, 1, 1, 1, 1, 1,
0.7052673, 1.690833, 0.3207599, 1, 1, 1, 1, 1,
0.7146096, -0.7438481, 2.856788, 1, 1, 1, 1, 1,
0.7154624, -1.139503, 3.472465, 1, 1, 1, 1, 1,
0.7155195, 0.3338408, 2.737312, 1, 1, 1, 1, 1,
0.7211131, 0.3175799, 1.8136, 1, 1, 1, 1, 1,
0.721963, 0.8504897, 2.076607, 1, 1, 1, 1, 1,
0.7231278, -0.6928873, 1.298627, 1, 1, 1, 1, 1,
0.7312858, 0.06869023, 1.577447, 1, 1, 1, 1, 1,
0.7364001, 1.347612, -0.005220085, 1, 1, 1, 1, 1,
0.7390905, -0.4519301, 1.854443, 1, 1, 1, 1, 1,
0.739295, 0.5669622, 2.117953, 0, 0, 1, 1, 1,
0.7421182, -1.44419, 3.413015, 1, 0, 0, 1, 1,
0.7424242, -0.7416531, 2.335129, 1, 0, 0, 1, 1,
0.7550304, -0.4335074, 1.822736, 1, 0, 0, 1, 1,
0.7552944, 0.09766831, 0.8355817, 1, 0, 0, 1, 1,
0.7560054, 1.666834, -0.2930551, 1, 0, 0, 1, 1,
0.7573875, 0.2027854, 3.525821, 0, 0, 0, 1, 1,
0.7608836, -1.611543, 2.212317, 0, 0, 0, 1, 1,
0.7617728, -0.1972357, 1.510006, 0, 0, 0, 1, 1,
0.7771001, -0.5414268, 3.11904, 0, 0, 0, 1, 1,
0.7783443, -1.455591, 1.358092, 0, 0, 0, 1, 1,
0.7796456, 0.9136818, -0.0467705, 0, 0, 0, 1, 1,
0.7828416, 1.998086, -1.644408, 0, 0, 0, 1, 1,
0.7831741, -1.083424, 3.061691, 1, 1, 1, 1, 1,
0.7835165, -0.8854563, 3.157815, 1, 1, 1, 1, 1,
0.783796, -1.268951, 3.183323, 1, 1, 1, 1, 1,
0.7919298, -0.1997937, 2.260784, 1, 1, 1, 1, 1,
0.7931917, -0.08425287, 1.338121, 1, 1, 1, 1, 1,
0.796738, 1.469692, 1.286159, 1, 1, 1, 1, 1,
0.7967913, 1.096578, -0.1922271, 1, 1, 1, 1, 1,
0.7987891, 0.142223, 1.801911, 1, 1, 1, 1, 1,
0.8021692, 1.852486, 1.006413, 1, 1, 1, 1, 1,
0.8077198, -0.6336751, 3.938205, 1, 1, 1, 1, 1,
0.8104247, 0.5508453, 0.8428324, 1, 1, 1, 1, 1,
0.820924, 1.401994, 0.3177656, 1, 1, 1, 1, 1,
0.8227974, 0.1802802, -0.1111062, 1, 1, 1, 1, 1,
0.8273423, -0.420889, 3.277241, 1, 1, 1, 1, 1,
0.8278135, 0.120313, 0.9848259, 1, 1, 1, 1, 1,
0.8321326, -0.6112652, 0.9927757, 0, 0, 1, 1, 1,
0.8347108, 0.9364074, 0.7565402, 1, 0, 0, 1, 1,
0.8359552, -0.3525873, 2.931965, 1, 0, 0, 1, 1,
0.8366042, 1.328834, -0.4354479, 1, 0, 0, 1, 1,
0.842883, -0.6356036, 1.902266, 1, 0, 0, 1, 1,
0.8459613, 1.308752, -0.6806584, 1, 0, 0, 1, 1,
0.8461859, 0.2900804, 0.5457258, 0, 0, 0, 1, 1,
0.847066, 0.426008, 2.479846, 0, 0, 0, 1, 1,
0.8480036, 0.03883925, 1.994755, 0, 0, 0, 1, 1,
0.8529245, 0.3828351, 1.502608, 0, 0, 0, 1, 1,
0.8555126, 0.6718138, 1.802126, 0, 0, 0, 1, 1,
0.8589432, 1.808213, 1.412745, 0, 0, 0, 1, 1,
0.8599347, -1.474719, 3.931626, 0, 0, 0, 1, 1,
0.8621699, 0.01945663, 0.7770993, 1, 1, 1, 1, 1,
0.8621935, 0.9416339, 1.476972, 1, 1, 1, 1, 1,
0.863234, -0.3528217, 3.377681, 1, 1, 1, 1, 1,
0.8635638, 0.3459829, 0.1208696, 1, 1, 1, 1, 1,
0.8638304, -0.4569715, 3.106769, 1, 1, 1, 1, 1,
0.8733797, -0.9235829, 3.647011, 1, 1, 1, 1, 1,
0.8811632, -1.035083, 2.038343, 1, 1, 1, 1, 1,
0.8935238, 0.2863227, -0.2617255, 1, 1, 1, 1, 1,
0.8965614, -1.830498, 1.476895, 1, 1, 1, 1, 1,
0.9109898, 0.1513386, 0.03760742, 1, 1, 1, 1, 1,
0.9154231, 0.7104484, 0.4329337, 1, 1, 1, 1, 1,
0.9172742, -1.015606, 1.980453, 1, 1, 1, 1, 1,
0.9263784, -0.2395677, 2.612786, 1, 1, 1, 1, 1,
0.9268166, 1.66013, 3.126817, 1, 1, 1, 1, 1,
0.9288447, 0.5436194, 0.4402606, 1, 1, 1, 1, 1,
0.9299091, 1.325405, 1.156667, 0, 0, 1, 1, 1,
0.9317998, 0.598691, 1.412964, 1, 0, 0, 1, 1,
0.9328035, -1.377347, 3.078032, 1, 0, 0, 1, 1,
0.9340971, 1.604185, 2.068367, 1, 0, 0, 1, 1,
0.9393363, -0.449325, 0.9442872, 1, 0, 0, 1, 1,
0.9402702, -1.247406, 1.228664, 1, 0, 0, 1, 1,
0.9486792, 0.1765114, 0.1159525, 0, 0, 0, 1, 1,
0.9534333, 0.1675567, 2.605705, 0, 0, 0, 1, 1,
0.9536128, 0.05778999, 1.361889, 0, 0, 0, 1, 1,
0.9569659, 0.1069517, 3.521466, 0, 0, 0, 1, 1,
0.9649971, 0.3801608, 1.096246, 0, 0, 0, 1, 1,
0.9722016, 0.2311027, 0.3184074, 0, 0, 0, 1, 1,
0.9725968, -2.227224, 4.36063, 0, 0, 0, 1, 1,
0.9741529, 0.1378511, 3.473684, 1, 1, 1, 1, 1,
0.9822918, 0.3372248, -1.928534, 1, 1, 1, 1, 1,
0.9892122, -1.69735, 2.814501, 1, 1, 1, 1, 1,
0.9956545, -0.1951264, 1.139606, 1, 1, 1, 1, 1,
1.001754, -0.6264493, 0.656734, 1, 1, 1, 1, 1,
1.004865, -0.7319454, 3.065964, 1, 1, 1, 1, 1,
1.008455, 0.3324759, 2.174129, 1, 1, 1, 1, 1,
1.01135, -1.131559, 2.427695, 1, 1, 1, 1, 1,
1.01563, -1.878409, 4.669981, 1, 1, 1, 1, 1,
1.021841, 1.445197, -0.9292378, 1, 1, 1, 1, 1,
1.040781, -0.9915829, 1.740524, 1, 1, 1, 1, 1,
1.055416, 0.8058771, 1.03158, 1, 1, 1, 1, 1,
1.062775, 0.3056445, 0.182268, 1, 1, 1, 1, 1,
1.065433, -1.450705, 2.128131, 1, 1, 1, 1, 1,
1.067579, -0.9104528, 2.402402, 1, 1, 1, 1, 1,
1.076712, -0.4446592, 2.404055, 0, 0, 1, 1, 1,
1.078102, -1.073027, 3.141826, 1, 0, 0, 1, 1,
1.081915, 0.4494041, 0.3630051, 1, 0, 0, 1, 1,
1.084433, -0.8795909, 2.950544, 1, 0, 0, 1, 1,
1.100349, 0.5597538, 0.3390952, 1, 0, 0, 1, 1,
1.113368, -0.1009734, 3.33166, 1, 0, 0, 1, 1,
1.116401, -1.080044, 1.056135, 0, 0, 0, 1, 1,
1.120436, 1.165287, 1.671343, 0, 0, 0, 1, 1,
1.128497, -1.227577, 2.259526, 0, 0, 0, 1, 1,
1.133355, 0.2900348, 2.222015, 0, 0, 0, 1, 1,
1.142091, -0.1847953, 3.696639, 0, 0, 0, 1, 1,
1.143865, -0.02934268, 1.662856, 0, 0, 0, 1, 1,
1.147151, 0.02781487, 4.45584, 0, 0, 0, 1, 1,
1.147447, 0.5195047, 1.852475, 1, 1, 1, 1, 1,
1.152313, -0.7468044, 2.813313, 1, 1, 1, 1, 1,
1.156661, -0.6278327, 3.632392, 1, 1, 1, 1, 1,
1.163938, 0.5507507, -0.1984502, 1, 1, 1, 1, 1,
1.175127, -0.6606269, 2.596504, 1, 1, 1, 1, 1,
1.175705, 1.732288, -0.04839348, 1, 1, 1, 1, 1,
1.176259, -0.7447966, 0.7165271, 1, 1, 1, 1, 1,
1.181013, -0.1403588, 2.723366, 1, 1, 1, 1, 1,
1.185394, 0.6356183, -0.612092, 1, 1, 1, 1, 1,
1.186088, 2.163705, -0.07295232, 1, 1, 1, 1, 1,
1.187065, 2.084988, 0.3832322, 1, 1, 1, 1, 1,
1.189713, 1.325904, 1.777393, 1, 1, 1, 1, 1,
1.19082, 0.3551553, 2.827984, 1, 1, 1, 1, 1,
1.195006, 1.705486, 1.497638, 1, 1, 1, 1, 1,
1.210581, -0.5642491, 2.190953, 1, 1, 1, 1, 1,
1.21222, 1.681668, -1.306597, 0, 0, 1, 1, 1,
1.217183, -0.494888, 2.833221, 1, 0, 0, 1, 1,
1.21996, 0.1832203, 2.370311, 1, 0, 0, 1, 1,
1.232248, -1.218756, 1.592795, 1, 0, 0, 1, 1,
1.232645, 0.355598, -0.03677574, 1, 0, 0, 1, 1,
1.238541, -0.4350576, 1.888718, 1, 0, 0, 1, 1,
1.238558, -1.111092, 1.914198, 0, 0, 0, 1, 1,
1.239511, 0.05156907, 2.445072, 0, 0, 0, 1, 1,
1.24383, -0.5358039, -0.00661094, 0, 0, 0, 1, 1,
1.257292, -0.01010761, 0.811568, 0, 0, 0, 1, 1,
1.257874, -1.770764, 4.386377, 0, 0, 0, 1, 1,
1.258737, -0.325753, 3.439187, 0, 0, 0, 1, 1,
1.269887, 1.085667, 1.132458, 0, 0, 0, 1, 1,
1.278371, -0.2568791, 0.5870395, 1, 1, 1, 1, 1,
1.280887, 0.4361493, 1.262866, 1, 1, 1, 1, 1,
1.282189, -1.38773, 1.36124, 1, 1, 1, 1, 1,
1.287323, 1.319666, 1.602197, 1, 1, 1, 1, 1,
1.289486, -0.8187985, 1.426474, 1, 1, 1, 1, 1,
1.294777, 1.181289, 0.36145, 1, 1, 1, 1, 1,
1.29996, -0.2374412, 1.126728, 1, 1, 1, 1, 1,
1.313549, -0.3826724, 2.69705, 1, 1, 1, 1, 1,
1.317768, -1.680641, 0.8273752, 1, 1, 1, 1, 1,
1.318408, -0.1607091, 1.08219, 1, 1, 1, 1, 1,
1.324078, 0.1696839, 2.191276, 1, 1, 1, 1, 1,
1.325419, -1.616343, 1.749106, 1, 1, 1, 1, 1,
1.325702, 0.6096689, 0.5391273, 1, 1, 1, 1, 1,
1.334482, 0.232872, 0.895689, 1, 1, 1, 1, 1,
1.334583, 0.2349981, 1.167427, 1, 1, 1, 1, 1,
1.339175, 0.06280884, 2.303676, 0, 0, 1, 1, 1,
1.344828, 0.4629037, 0.006238777, 1, 0, 0, 1, 1,
1.371831, 0.9036428, 2.491179, 1, 0, 0, 1, 1,
1.386202, 0.1864881, 0.954453, 1, 0, 0, 1, 1,
1.387699, 0.2098505, 1.129204, 1, 0, 0, 1, 1,
1.397257, -0.2263825, 2.752319, 1, 0, 0, 1, 1,
1.400906, -1.887867, 1.798662, 0, 0, 0, 1, 1,
1.402174, -1.356687, 1.202494, 0, 0, 0, 1, 1,
1.402999, 1.416309, 0.2315404, 0, 0, 0, 1, 1,
1.411214, 0.4378994, 2.014081, 0, 0, 0, 1, 1,
1.41365, -1.460049, 3.679598, 0, 0, 0, 1, 1,
1.416505, -0.8674937, 2.460869, 0, 0, 0, 1, 1,
1.421439, -0.01439555, 1.180721, 0, 0, 0, 1, 1,
1.437092, -0.2851986, 1.334476, 1, 1, 1, 1, 1,
1.438945, -0.3023044, 2.706745, 1, 1, 1, 1, 1,
1.440394, -0.461592, 2.216006, 1, 1, 1, 1, 1,
1.440582, -2.11946, 1.871282, 1, 1, 1, 1, 1,
1.445759, 0.2452499, 2.189833, 1, 1, 1, 1, 1,
1.448563, 0.4860035, 1.72986, 1, 1, 1, 1, 1,
1.449726, -1.055094, 0.3811628, 1, 1, 1, 1, 1,
1.453535, 0.1473731, 1.541192, 1, 1, 1, 1, 1,
1.458371, 1.367279, 0.3033891, 1, 1, 1, 1, 1,
1.478595, -0.8314007, 2.885749, 1, 1, 1, 1, 1,
1.487708, 0.6880769, 1.520605, 1, 1, 1, 1, 1,
1.489613, 1.935843, -1.744503, 1, 1, 1, 1, 1,
1.49312, 0.3963419, 2.22628, 1, 1, 1, 1, 1,
1.496338, 1.887274, -0.6362882, 1, 1, 1, 1, 1,
1.501332, -1.000209, 3.02669, 1, 1, 1, 1, 1,
1.525805, -1.017951, 2.737723, 0, 0, 1, 1, 1,
1.52738, -2.906316, 2.701311, 1, 0, 0, 1, 1,
1.529459, -0.2428203, 3.032052, 1, 0, 0, 1, 1,
1.539022, -1.385437, 2.964899, 1, 0, 0, 1, 1,
1.562119, -0.4528421, 3.096329, 1, 0, 0, 1, 1,
1.572693, 0.1455173, 0.9832418, 1, 0, 0, 1, 1,
1.573475, -1.362902, 2.818172, 0, 0, 0, 1, 1,
1.579437, -0.7520995, 2.03254, 0, 0, 0, 1, 1,
1.591265, 0.9278225, 1.152318, 0, 0, 0, 1, 1,
1.59422, 0.7852963, 1.375549, 0, 0, 0, 1, 1,
1.601945, -2.175303, 2.799805, 0, 0, 0, 1, 1,
1.613376, -0.7996338, 2.353725, 0, 0, 0, 1, 1,
1.6176, 0.9829764, 2.316238, 0, 0, 0, 1, 1,
1.6255, -1.318846, 1.467874, 1, 1, 1, 1, 1,
1.643229, 1.369543, 1.583093, 1, 1, 1, 1, 1,
1.653473, 0.2397922, 1.379509, 1, 1, 1, 1, 1,
1.666075, -0.4016302, 2.131078, 1, 1, 1, 1, 1,
1.669383, 0.2343764, 3.499875, 1, 1, 1, 1, 1,
1.674497, 0.7586597, 1.156673, 1, 1, 1, 1, 1,
1.696446, -0.483484, 2.139571, 1, 1, 1, 1, 1,
1.731553, -0.6620526, 2.096077, 1, 1, 1, 1, 1,
1.747333, -0.6304778, 3.131169, 1, 1, 1, 1, 1,
1.747384, -0.3384138, 1.31341, 1, 1, 1, 1, 1,
1.759327, 0.5584615, 2.200059, 1, 1, 1, 1, 1,
1.761624, -0.7672918, 2.643134, 1, 1, 1, 1, 1,
1.763108, 1.84399, 1.034185, 1, 1, 1, 1, 1,
1.775442, -2.134521, 2.532104, 1, 1, 1, 1, 1,
1.775445, 0.09692875, 0.1007464, 1, 1, 1, 1, 1,
1.783582, 0.9461748, 1.153901, 0, 0, 1, 1, 1,
1.792223, 0.7504144, 1.201753, 1, 0, 0, 1, 1,
1.79917, -0.4271811, 1.520115, 1, 0, 0, 1, 1,
1.800806, -0.8551801, 3.190638, 1, 0, 0, 1, 1,
1.806186, -0.4515439, 0.865727, 1, 0, 0, 1, 1,
1.808179, 1.137438, 0.807798, 1, 0, 0, 1, 1,
1.843702, 0.139128, 3.23221, 0, 0, 0, 1, 1,
1.876286, 1.453823, -0.1737202, 0, 0, 0, 1, 1,
1.878102, -0.1622356, 0.4791343, 0, 0, 0, 1, 1,
1.893279, 1.907434, -0.7084982, 0, 0, 0, 1, 1,
1.912433, 0.7273202, 1.256192, 0, 0, 0, 1, 1,
1.912695, -1.533551, 1.879419, 0, 0, 0, 1, 1,
1.915835, -0.3845764, 2.55679, 0, 0, 0, 1, 1,
1.938886, 1.10744, 2.168942, 1, 1, 1, 1, 1,
1.939749, 0.03325877, 2.803854, 1, 1, 1, 1, 1,
1.957586, 0.7921163, 0.3058528, 1, 1, 1, 1, 1,
1.957751, 0.2823585, -0.3232512, 1, 1, 1, 1, 1,
1.979035, 1.610756, -0.3676077, 1, 1, 1, 1, 1,
1.988426, -0.674763, 1.632046, 1, 1, 1, 1, 1,
2.010689, -0.8701404, -0.2376826, 1, 1, 1, 1, 1,
2.016645, -0.2626188, 1.713778, 1, 1, 1, 1, 1,
2.024534, 0.2828832, 1.87205, 1, 1, 1, 1, 1,
2.033133, 1.064838, -0.9323135, 1, 1, 1, 1, 1,
2.055772, -1.549925, 1.878953, 1, 1, 1, 1, 1,
2.092145, 0.5400686, 0.4119495, 1, 1, 1, 1, 1,
2.09789, 0.6731369, 0.5407565, 1, 1, 1, 1, 1,
2.112103, -0.7004333, 0.4576085, 1, 1, 1, 1, 1,
2.129905, 1.285543, -0.04425625, 1, 1, 1, 1, 1,
2.234684, -0.6212602, 2.536311, 0, 0, 1, 1, 1,
2.247089, -0.2361502, 0.5488929, 1, 0, 0, 1, 1,
2.25724, -0.434216, 1.972636, 1, 0, 0, 1, 1,
2.260605, 0.997361, 1.751503, 1, 0, 0, 1, 1,
2.291266, -0.2591347, 0.4044895, 1, 0, 0, 1, 1,
2.322492, 0.334195, 3.457818, 1, 0, 0, 1, 1,
2.33766, -0.1657267, 1.954883, 0, 0, 0, 1, 1,
2.43896, -1.201461, 2.791759, 0, 0, 0, 1, 1,
2.449726, -1.410118, 3.394178, 0, 0, 0, 1, 1,
2.473861, 1.688487, 2.065005, 0, 0, 0, 1, 1,
2.499953, 0.4914084, 0.2636842, 0, 0, 0, 1, 1,
2.542298, 0.6528639, -0.1000832, 0, 0, 0, 1, 1,
2.65344, 2.252252, 3.422101, 0, 0, 0, 1, 1,
2.776848, -0.5381935, 1.222216, 1, 1, 1, 1, 1,
2.862282, -2.419541, 2.826316, 1, 1, 1, 1, 1,
2.888592, 0.6620281, 0.1701329, 1, 1, 1, 1, 1,
2.961052, -0.2295315, 2.38046, 1, 1, 1, 1, 1,
3.258602, -0.1405954, -0.1303215, 1, 1, 1, 1, 1,
3.420484, 1.152282, 0.1315828, 1, 1, 1, 1, 1,
3.578821, 0.7676275, 1.651603, 1, 1, 1, 1, 1
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
var radius = 10.0868;
var distance = 35.42947;
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
mvMatrix.translate( -0.3231099, 0.1982471, -1.147006 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.42947);
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
