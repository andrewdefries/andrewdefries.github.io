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
-3.407568, -0.06088674, -0.5750549, 1, 0, 0, 1,
-3.204462, 0.4933656, -0.6350417, 1, 0.007843138, 0, 1,
-2.653371, -0.7517981, -1.586158, 1, 0.01176471, 0, 1,
-2.585185, -0.508236, 0.06994054, 1, 0.01960784, 0, 1,
-2.384583, -1.962409, -1.587408, 1, 0.02352941, 0, 1,
-2.382372, -1.698973, -3.221075, 1, 0.03137255, 0, 1,
-2.355124, 0.04333772, -2.251033, 1, 0.03529412, 0, 1,
-2.28303, 0.1645114, -3.454101, 1, 0.04313726, 0, 1,
-2.257028, -0.4181766, -1.225949, 1, 0.04705882, 0, 1,
-2.251657, -0.9193018, -4.465279, 1, 0.05490196, 0, 1,
-2.240299, 0.6088862, -1.884202, 1, 0.05882353, 0, 1,
-2.230281, -1.165177, -2.52967, 1, 0.06666667, 0, 1,
-2.210909, 1.390878, -1.870918, 1, 0.07058824, 0, 1,
-2.168648, -1.013219, -2.563167, 1, 0.07843138, 0, 1,
-2.158484, -0.483361, -3.039844, 1, 0.08235294, 0, 1,
-2.133686, -0.5238048, -0.9192232, 1, 0.09019608, 0, 1,
-2.103539, -0.2364966, -2.827052, 1, 0.09411765, 0, 1,
-2.093211, -0.5507683, -1.458216, 1, 0.1019608, 0, 1,
-2.080738, 0.10572, -1.731403, 1, 0.1098039, 0, 1,
-2.0603, -1.795599, -1.243292, 1, 0.1137255, 0, 1,
-2.056016, -0.3050658, -2.302646, 1, 0.1215686, 0, 1,
-2.041893, -0.6725699, -1.939908, 1, 0.1254902, 0, 1,
-2.021513, -0.1532562, -2.690758, 1, 0.1333333, 0, 1,
-1.982992, 0.7087426, -0.1998119, 1, 0.1372549, 0, 1,
-1.980265, -1.262522, -0.9267806, 1, 0.145098, 0, 1,
-1.9767, 0.5986909, -1.560591, 1, 0.1490196, 0, 1,
-1.940211, -0.3083871, -1.011912, 1, 0.1568628, 0, 1,
-1.938073, -0.6911437, -3.141346, 1, 0.1607843, 0, 1,
-1.919336, -0.3792062, -1.699254, 1, 0.1686275, 0, 1,
-1.910728, 0.135533, -2.326916, 1, 0.172549, 0, 1,
-1.889922, 1.025574, -2.538197, 1, 0.1803922, 0, 1,
-1.8684, 1.234496, 0.2277394, 1, 0.1843137, 0, 1,
-1.855699, 1.789603, -2.727516, 1, 0.1921569, 0, 1,
-1.844754, 0.3529513, -1.055837, 1, 0.1960784, 0, 1,
-1.807731, 0.8173831, -1.908462, 1, 0.2039216, 0, 1,
-1.773275, 1.927482, -0.6262454, 1, 0.2117647, 0, 1,
-1.770187, -0.6745102, -4.15977, 1, 0.2156863, 0, 1,
-1.724091, -0.6792945, -0.1827163, 1, 0.2235294, 0, 1,
-1.720771, 0.6691839, -0.7289562, 1, 0.227451, 0, 1,
-1.718268, -1.514078, -2.643085, 1, 0.2352941, 0, 1,
-1.692888, -0.8729423, -1.929021, 1, 0.2392157, 0, 1,
-1.686056, 0.07306778, -1.53598, 1, 0.2470588, 0, 1,
-1.683718, -2.03566, -1.678749, 1, 0.2509804, 0, 1,
-1.682545, -1.385869, 0.280953, 1, 0.2588235, 0, 1,
-1.681431, 2.154317, -1.166264, 1, 0.2627451, 0, 1,
-1.654127, -0.05472436, -1.66648, 1, 0.2705882, 0, 1,
-1.653947, 0.8954971, 1.513295, 1, 0.2745098, 0, 1,
-1.650284, 0.3536613, -1.380919, 1, 0.282353, 0, 1,
-1.644406, -1.918706, -2.323573, 1, 0.2862745, 0, 1,
-1.642035, -0.05572965, -2.544887, 1, 0.2941177, 0, 1,
-1.638807, 0.4849397, -1.867685, 1, 0.3019608, 0, 1,
-1.627101, 0.5013044, -1.58116, 1, 0.3058824, 0, 1,
-1.613375, 0.1184175, -1.263054, 1, 0.3137255, 0, 1,
-1.612001, -0.4341946, -3.277971, 1, 0.3176471, 0, 1,
-1.577161, -0.988206, -2.221884, 1, 0.3254902, 0, 1,
-1.561848, 0.4084765, -0.8331257, 1, 0.3294118, 0, 1,
-1.550836, -0.5893543, -3.270142, 1, 0.3372549, 0, 1,
-1.548689, -0.4825872, -3.342865, 1, 0.3411765, 0, 1,
-1.545833, 0.2827467, -1.875589, 1, 0.3490196, 0, 1,
-1.540864, 0.2327472, -3.224843, 1, 0.3529412, 0, 1,
-1.540452, -1.138877, -2.713583, 1, 0.3607843, 0, 1,
-1.525294, -0.868038, -3.534402, 1, 0.3647059, 0, 1,
-1.502582, 1.077848, -2.092694, 1, 0.372549, 0, 1,
-1.502227, -0.9732288, -4.043281, 1, 0.3764706, 0, 1,
-1.498523, -0.3092916, -2.232052, 1, 0.3843137, 0, 1,
-1.497546, -1.619552, -3.051725, 1, 0.3882353, 0, 1,
-1.494238, -0.1285842, -0.9551208, 1, 0.3960784, 0, 1,
-1.493891, -0.4473278, -2.700555, 1, 0.4039216, 0, 1,
-1.484234, -0.2663346, -2.528432, 1, 0.4078431, 0, 1,
-1.478319, -0.3451538, -1.699724, 1, 0.4156863, 0, 1,
-1.460562, -0.4406329, -2.993358, 1, 0.4196078, 0, 1,
-1.460095, -0.6652611, -0.9123521, 1, 0.427451, 0, 1,
-1.45088, -0.7076299, -2.783861, 1, 0.4313726, 0, 1,
-1.441908, -0.63977, -2.111079, 1, 0.4392157, 0, 1,
-1.439173, 1.761377, 0.1717334, 1, 0.4431373, 0, 1,
-1.435791, 0.8053033, -0.06509333, 1, 0.4509804, 0, 1,
-1.434936, 0.4201697, -1.306773, 1, 0.454902, 0, 1,
-1.434321, -1.042371, -2.761193, 1, 0.4627451, 0, 1,
-1.433013, -1.21765, -2.140883, 1, 0.4666667, 0, 1,
-1.419391, 0.575548, -1.878365, 1, 0.4745098, 0, 1,
-1.416931, 0.8959662, -1.301463, 1, 0.4784314, 0, 1,
-1.41097, -0.9043709, -2.046305, 1, 0.4862745, 0, 1,
-1.395925, -0.3386704, -0.4020091, 1, 0.4901961, 0, 1,
-1.390366, 0.8011389, -2.413856, 1, 0.4980392, 0, 1,
-1.378936, -2.419818, -3.333568, 1, 0.5058824, 0, 1,
-1.378136, 0.8567632, -1.09226, 1, 0.509804, 0, 1,
-1.377603, -1.203488, -1.392966, 1, 0.5176471, 0, 1,
-1.372222, 0.7466159, -2.346305, 1, 0.5215687, 0, 1,
-1.369595, -2.008636, -2.0265, 1, 0.5294118, 0, 1,
-1.363974, 0.267553, -1.44401, 1, 0.5333334, 0, 1,
-1.359891, 0.298458, -1.453258, 1, 0.5411765, 0, 1,
-1.355784, 0.2837327, -2.320802, 1, 0.5450981, 0, 1,
-1.354428, 1.328236, -1.533828, 1, 0.5529412, 0, 1,
-1.350651, 0.6371786, -0.4997683, 1, 0.5568628, 0, 1,
-1.350595, 0.1933185, -1.374948, 1, 0.5647059, 0, 1,
-1.349889, -0.8265643, -1.903455, 1, 0.5686275, 0, 1,
-1.34712, -1.573149, -1.128834, 1, 0.5764706, 0, 1,
-1.332738, 0.2121607, -2.391431, 1, 0.5803922, 0, 1,
-1.328575, -0.09183066, -3.195919, 1, 0.5882353, 0, 1,
-1.320243, -2.054476, -3.419807, 1, 0.5921569, 0, 1,
-1.318553, 0.474657, -0.922506, 1, 0.6, 0, 1,
-1.317959, -0.4137453, -2.403453, 1, 0.6078432, 0, 1,
-1.304472, -1.55316, -1.745232, 1, 0.6117647, 0, 1,
-1.302054, -0.2798957, -0.6507891, 1, 0.6196079, 0, 1,
-1.30023, 1.06952, 0.6938585, 1, 0.6235294, 0, 1,
-1.294118, -1.928241, -3.153722, 1, 0.6313726, 0, 1,
-1.29249, 0.9480399, -1.490499, 1, 0.6352941, 0, 1,
-1.280375, 0.844461, -1.729079, 1, 0.6431373, 0, 1,
-1.275924, -0.01062318, -1.669395, 1, 0.6470588, 0, 1,
-1.269644, 0.303577, -0.7745699, 1, 0.654902, 0, 1,
-1.257929, -1.168304, -1.86404, 1, 0.6588235, 0, 1,
-1.256367, 1.180697, 0.2055508, 1, 0.6666667, 0, 1,
-1.254739, 0.8851379, -1.558375, 1, 0.6705883, 0, 1,
-1.252709, -0.2980156, -1.010637, 1, 0.6784314, 0, 1,
-1.236961, -0.00288279, -1.498115, 1, 0.682353, 0, 1,
-1.223851, -0.02996502, -2.177522, 1, 0.6901961, 0, 1,
-1.22286, -1.147894, -3.759519, 1, 0.6941177, 0, 1,
-1.212772, 0.07033008, -0.7264441, 1, 0.7019608, 0, 1,
-1.21187, 0.3386858, -2.519375, 1, 0.7098039, 0, 1,
-1.208223, -0.4804882, -1.490102, 1, 0.7137255, 0, 1,
-1.198571, 0.2583956, -1.231584, 1, 0.7215686, 0, 1,
-1.195996, -1.860649, -1.746273, 1, 0.7254902, 0, 1,
-1.195447, 0.8438929, -0.4784658, 1, 0.7333333, 0, 1,
-1.19225, 0.1011884, -1.118384, 1, 0.7372549, 0, 1,
-1.180838, -0.4138477, -1.263885, 1, 0.7450981, 0, 1,
-1.180225, 1.093521, -1.816002, 1, 0.7490196, 0, 1,
-1.176896, -0.9126723, -1.053809, 1, 0.7568628, 0, 1,
-1.175797, -1.230519, -3.259593, 1, 0.7607843, 0, 1,
-1.174813, 0.664255, -1.792864, 1, 0.7686275, 0, 1,
-1.171296, -0.3985478, -1.96011, 1, 0.772549, 0, 1,
-1.170056, 1.312272, -2.002912, 1, 0.7803922, 0, 1,
-1.160034, 1.010594, 0.8312553, 1, 0.7843137, 0, 1,
-1.158098, -0.5137288, -1.183246, 1, 0.7921569, 0, 1,
-1.155316, 0.1926779, -1.461531, 1, 0.7960784, 0, 1,
-1.1396, -1.594864, -3.80298, 1, 0.8039216, 0, 1,
-1.136099, 0.3055654, -0.7790501, 1, 0.8117647, 0, 1,
-1.128624, 0.760369, -1.344313, 1, 0.8156863, 0, 1,
-1.124421, -0.1981505, -1.366308, 1, 0.8235294, 0, 1,
-1.114417, -0.2057301, -0.9156708, 1, 0.827451, 0, 1,
-1.101426, 0.601849, -1.145458, 1, 0.8352941, 0, 1,
-1.094009, -1.114149, -3.056202, 1, 0.8392157, 0, 1,
-1.093101, -0.5164475, -0.5695672, 1, 0.8470588, 0, 1,
-1.092049, -0.7436481, -3.001812, 1, 0.8509804, 0, 1,
-1.074889, -0.05640415, -2.15783, 1, 0.8588235, 0, 1,
-1.07172, 0.2979349, -1.187936, 1, 0.8627451, 0, 1,
-1.069747, 1.228648, -0.804821, 1, 0.8705882, 0, 1,
-1.069282, 1.230184, -2.033449, 1, 0.8745098, 0, 1,
-1.065508, -0.08830407, -0.2566733, 1, 0.8823529, 0, 1,
-1.062064, 0.473908, -0.4834656, 1, 0.8862745, 0, 1,
-1.056542, -0.342955, -3.26767, 1, 0.8941177, 0, 1,
-1.030522, -0.9386147, -1.961529, 1, 0.8980392, 0, 1,
-1.018522, -1.312286, -1.523483, 1, 0.9058824, 0, 1,
-1.016196, 1.084419, -1.95614, 1, 0.9137255, 0, 1,
-1.007499, 0.720188, -3.165696, 1, 0.9176471, 0, 1,
-1.005512, -1.973608, -3.388483, 1, 0.9254902, 0, 1,
-1.003435, 0.4285045, -1.702512, 1, 0.9294118, 0, 1,
-0.9946492, 0.1829342, -1.194025, 1, 0.9372549, 0, 1,
-0.9923042, -1.168443, -2.303154, 1, 0.9411765, 0, 1,
-0.9883062, 0.3355437, -2.301926, 1, 0.9490196, 0, 1,
-0.9873706, -0.4899359, -2.136111, 1, 0.9529412, 0, 1,
-0.9859532, -0.148823, -2.935904, 1, 0.9607843, 0, 1,
-0.9843011, 1.480942, -1.485722, 1, 0.9647059, 0, 1,
-0.9755974, -0.5097916, -1.016619, 1, 0.972549, 0, 1,
-0.9739286, 0.4717112, -0.3830691, 1, 0.9764706, 0, 1,
-0.9719268, 0.3134751, -1.332482, 1, 0.9843137, 0, 1,
-0.9675908, 1.154719, 0.8532842, 1, 0.9882353, 0, 1,
-0.9538699, -1.066385, -1.914851, 1, 0.9960784, 0, 1,
-0.9366294, -1.616726, -2.879995, 0.9960784, 1, 0, 1,
-0.9335197, 0.297094, -1.043888, 0.9921569, 1, 0, 1,
-0.9334638, -0.332126, -1.116032, 0.9843137, 1, 0, 1,
-0.9313245, -1.172738, -1.397713, 0.9803922, 1, 0, 1,
-0.9295275, -0.4643219, -2.626589, 0.972549, 1, 0, 1,
-0.9281703, -0.2598892, -1.726749, 0.9686275, 1, 0, 1,
-0.9232258, -0.5186153, -2.511696, 0.9607843, 1, 0, 1,
-0.9141623, 0.108854, -1.441608, 0.9568627, 1, 0, 1,
-0.90982, -1.208664, -2.829467, 0.9490196, 1, 0, 1,
-0.9002321, -1.104834, -2.682112, 0.945098, 1, 0, 1,
-0.8941057, 0.5474133, -0.9869412, 0.9372549, 1, 0, 1,
-0.8931631, -0.4598854, -3.353696, 0.9333333, 1, 0, 1,
-0.8914794, 0.5433962, -1.827007, 0.9254902, 1, 0, 1,
-0.8894354, -0.8730788, -4.177278, 0.9215686, 1, 0, 1,
-0.8879054, -0.4673734, -1.29398, 0.9137255, 1, 0, 1,
-0.8809528, 0.6864914, -1.132857, 0.9098039, 1, 0, 1,
-0.8753602, 0.6011049, -0.7549015, 0.9019608, 1, 0, 1,
-0.873061, -0.4454626, -1.69552, 0.8941177, 1, 0, 1,
-0.869248, 0.2858054, -1.672627, 0.8901961, 1, 0, 1,
-0.8534167, 0.2764161, -2.37072, 0.8823529, 1, 0, 1,
-0.8514381, 0.4501862, 0.1013292, 0.8784314, 1, 0, 1,
-0.8455694, 0.4817186, -1.045156, 0.8705882, 1, 0, 1,
-0.8446189, 1.161393, 0.8877446, 0.8666667, 1, 0, 1,
-0.8407161, -0.2620026, 0.4979722, 0.8588235, 1, 0, 1,
-0.8347616, -0.8185036, -4.393433, 0.854902, 1, 0, 1,
-0.8339462, 0.721888, -1.217653, 0.8470588, 1, 0, 1,
-0.8327935, 0.2158861, -1.420039, 0.8431373, 1, 0, 1,
-0.8233498, 0.2924727, -3.18543, 0.8352941, 1, 0, 1,
-0.8201102, 0.7548768, -1.994327, 0.8313726, 1, 0, 1,
-0.8194914, -2.698452, -3.104624, 0.8235294, 1, 0, 1,
-0.8047025, 0.3040298, -0.6014361, 0.8196079, 1, 0, 1,
-0.8019791, -0.4838319, -3.120158, 0.8117647, 1, 0, 1,
-0.8007774, -0.2888354, -2.737299, 0.8078431, 1, 0, 1,
-0.7962902, 0.9527875, -1.426581, 0.8, 1, 0, 1,
-0.7955256, -0.6283863, -0.9752578, 0.7921569, 1, 0, 1,
-0.7887239, -1.434625, -1.320444, 0.7882353, 1, 0, 1,
-0.7851954, 0.03129565, -2.315163, 0.7803922, 1, 0, 1,
-0.7835347, -0.1491371, -2.888172, 0.7764706, 1, 0, 1,
-0.7806485, -0.7045782, -1.430377, 0.7686275, 1, 0, 1,
-0.7805012, -0.6230198, -1.423687, 0.7647059, 1, 0, 1,
-0.761332, 0.8246117, 0.07385454, 0.7568628, 1, 0, 1,
-0.7550054, -0.2884413, -3.247236, 0.7529412, 1, 0, 1,
-0.7407123, -1.531963, -3.402141, 0.7450981, 1, 0, 1,
-0.731504, -1.791783, -4.15285, 0.7411765, 1, 0, 1,
-0.7313577, 1.645051, 0.6543778, 0.7333333, 1, 0, 1,
-0.7291283, -1.130389, -2.708409, 0.7294118, 1, 0, 1,
-0.7253008, 1.085976, -0.07213319, 0.7215686, 1, 0, 1,
-0.723346, -0.3642158, -0.7713855, 0.7176471, 1, 0, 1,
-0.7225003, 0.04471606, -2.229115, 0.7098039, 1, 0, 1,
-0.7102785, 1.192947, 0.2607224, 0.7058824, 1, 0, 1,
-0.7040756, 1.579147, -1.012187, 0.6980392, 1, 0, 1,
-0.7024296, -1.569273, -2.197444, 0.6901961, 1, 0, 1,
-0.6983631, -0.7313608, -3.960381, 0.6862745, 1, 0, 1,
-0.6961918, 0.1880689, -0.9807186, 0.6784314, 1, 0, 1,
-0.690452, 0.7668712, -0.04020949, 0.6745098, 1, 0, 1,
-0.6876078, 1.27618, -0.581772, 0.6666667, 1, 0, 1,
-0.6856784, -0.08442947, -1.066908, 0.6627451, 1, 0, 1,
-0.6808285, -0.3446737, -2.733482, 0.654902, 1, 0, 1,
-0.674366, 0.672992, -0.3810941, 0.6509804, 1, 0, 1,
-0.6719981, 1.101608, -1.03282, 0.6431373, 1, 0, 1,
-0.6699227, -0.9482818, -2.413243, 0.6392157, 1, 0, 1,
-0.6612608, 0.5395025, -0.07068481, 0.6313726, 1, 0, 1,
-0.6608065, -0.5961848, -3.726331, 0.627451, 1, 0, 1,
-0.6567362, -0.3700933, -1.346932, 0.6196079, 1, 0, 1,
-0.6557806, -0.3495441, -2.776626, 0.6156863, 1, 0, 1,
-0.6517338, 1.864533, -0.7619503, 0.6078432, 1, 0, 1,
-0.6503754, -0.2794946, -3.149821, 0.6039216, 1, 0, 1,
-0.647391, 0.9549804, -0.9899689, 0.5960785, 1, 0, 1,
-0.6423516, -0.601828, -3.058315, 0.5882353, 1, 0, 1,
-0.639401, 0.9763258, -0.3048971, 0.5843138, 1, 0, 1,
-0.6392567, 1.054519, -1.065941, 0.5764706, 1, 0, 1,
-0.6387304, -0.4858814, -1.800735, 0.572549, 1, 0, 1,
-0.6352165, -2.391087, -3.712848, 0.5647059, 1, 0, 1,
-0.6347271, -0.4667066, -1.478652, 0.5607843, 1, 0, 1,
-0.6287327, 0.6608308, -1.317573, 0.5529412, 1, 0, 1,
-0.6274356, 0.005362769, 0.2205663, 0.5490196, 1, 0, 1,
-0.6260716, 0.6149987, -2.171358, 0.5411765, 1, 0, 1,
-0.6249319, 1.030238, -0.4423676, 0.5372549, 1, 0, 1,
-0.6248377, -1.065595, -2.600844, 0.5294118, 1, 0, 1,
-0.6223384, -0.8388109, -2.318185, 0.5254902, 1, 0, 1,
-0.6134802, 0.2564237, -2.193651, 0.5176471, 1, 0, 1,
-0.612909, -0.6680863, -2.001939, 0.5137255, 1, 0, 1,
-0.6124173, 0.2969319, -0.968553, 0.5058824, 1, 0, 1,
-0.611632, -0.3859712, -3.610788, 0.5019608, 1, 0, 1,
-0.6116261, 0.03512238, 0.3518769, 0.4941176, 1, 0, 1,
-0.6087484, -0.6259798, -2.069563, 0.4862745, 1, 0, 1,
-0.6072988, 0.1291523, -0.97317, 0.4823529, 1, 0, 1,
-0.6065766, 0.0322267, -1.097877, 0.4745098, 1, 0, 1,
-0.6057722, -0.4484084, -1.692277, 0.4705882, 1, 0, 1,
-0.605637, 0.1918614, -1.846439, 0.4627451, 1, 0, 1,
-0.6005613, -0.1434837, -1.56382, 0.4588235, 1, 0, 1,
-0.6000521, -1.826364, -3.809642, 0.4509804, 1, 0, 1,
-0.5990238, -0.02944596, -2.544311, 0.4470588, 1, 0, 1,
-0.5972653, 0.5419683, 0.2166592, 0.4392157, 1, 0, 1,
-0.5909089, -1.376566, -2.806659, 0.4352941, 1, 0, 1,
-0.5882074, 0.2997517, -2.652653, 0.427451, 1, 0, 1,
-0.5849839, 1.252086, 0.9353647, 0.4235294, 1, 0, 1,
-0.5775226, 0.342059, -0.8252693, 0.4156863, 1, 0, 1,
-0.5768064, -0.09681817, -1.257596, 0.4117647, 1, 0, 1,
-0.5695597, 1.29505, -0.007952468, 0.4039216, 1, 0, 1,
-0.5683832, -1.478164, -2.380315, 0.3960784, 1, 0, 1,
-0.567145, -1.095619, -3.895346, 0.3921569, 1, 0, 1,
-0.5620835, -0.02401887, -2.592876, 0.3843137, 1, 0, 1,
-0.5585802, 1.766774, -0.09500485, 0.3803922, 1, 0, 1,
-0.5566024, -0.3401112, -2.607596, 0.372549, 1, 0, 1,
-0.5492362, 1.082931, -0.5463598, 0.3686275, 1, 0, 1,
-0.5489523, 1.25524, -1.217739, 0.3607843, 1, 0, 1,
-0.5476876, 0.02313861, -2.318721, 0.3568628, 1, 0, 1,
-0.5468194, 0.1623622, -0.7538235, 0.3490196, 1, 0, 1,
-0.5467579, -0.2868507, -2.228221, 0.345098, 1, 0, 1,
-0.5418201, -1.1996, -1.830135, 0.3372549, 1, 0, 1,
-0.5405021, 1.724827, -0.7896789, 0.3333333, 1, 0, 1,
-0.53979, -0.2247891, -1.722482, 0.3254902, 1, 0, 1,
-0.5383378, -1.554754, -2.565041, 0.3215686, 1, 0, 1,
-0.5355982, 1.415067, 0.456502, 0.3137255, 1, 0, 1,
-0.5314975, -2.214731, -2.961802, 0.3098039, 1, 0, 1,
-0.528712, 0.3055978, -1.019239, 0.3019608, 1, 0, 1,
-0.5247267, -1.575737, -1.956274, 0.2941177, 1, 0, 1,
-0.5246096, -2.19504, -4.121621, 0.2901961, 1, 0, 1,
-0.5198617, -0.2616325, -3.042833, 0.282353, 1, 0, 1,
-0.515968, -0.92861, -1.566003, 0.2784314, 1, 0, 1,
-0.5153829, -0.5022177, -3.144268, 0.2705882, 1, 0, 1,
-0.514232, 0.1346225, 0.3301282, 0.2666667, 1, 0, 1,
-0.5138177, -0.6813805, -1.581423, 0.2588235, 1, 0, 1,
-0.5103562, -0.09379517, -2.089145, 0.254902, 1, 0, 1,
-0.5059244, 0.2907121, -1.340236, 0.2470588, 1, 0, 1,
-0.5058924, -0.2960349, -1.551555, 0.2431373, 1, 0, 1,
-0.5005872, 0.5092444, -2.582523, 0.2352941, 1, 0, 1,
-0.4972147, -0.4617064, -1.544197, 0.2313726, 1, 0, 1,
-0.4952425, -0.457399, -2.526146, 0.2235294, 1, 0, 1,
-0.4941868, 1.019585, -1.101262, 0.2196078, 1, 0, 1,
-0.4895965, 0.6471532, -0.8477803, 0.2117647, 1, 0, 1,
-0.488433, -0.80369, -4.082467, 0.2078431, 1, 0, 1,
-0.487639, -0.7881819, -2.848119, 0.2, 1, 0, 1,
-0.4860282, 1.429529, -0.747023, 0.1921569, 1, 0, 1,
-0.4853928, -1.119872, -1.959605, 0.1882353, 1, 0, 1,
-0.4842063, -0.5784464, -4.169981, 0.1803922, 1, 0, 1,
-0.4841621, 0.1383305, -2.030699, 0.1764706, 1, 0, 1,
-0.4790002, 0.1340963, -1.183884, 0.1686275, 1, 0, 1,
-0.4778816, -0.6687667, -3.416335, 0.1647059, 1, 0, 1,
-0.4761827, 0.2204521, -1.928155, 0.1568628, 1, 0, 1,
-0.4757158, 0.541303, -0.06551103, 0.1529412, 1, 0, 1,
-0.4729084, -0.06150362, -1.457781, 0.145098, 1, 0, 1,
-0.4725281, 0.331139, -2.393082, 0.1411765, 1, 0, 1,
-0.4704721, 0.0886329, -0.2274647, 0.1333333, 1, 0, 1,
-0.4700906, -0.857632, -2.641044, 0.1294118, 1, 0, 1,
-0.4688053, 1.875662, 0.4745795, 0.1215686, 1, 0, 1,
-0.4677972, 0.4484981, -0.9246078, 0.1176471, 1, 0, 1,
-0.4655722, 0.8932946, -3.019886, 0.1098039, 1, 0, 1,
-0.4650604, -0.8214782, -0.3900288, 0.1058824, 1, 0, 1,
-0.4582407, -0.9852206, -3.250403, 0.09803922, 1, 0, 1,
-0.4548527, -0.1047331, -1.617848, 0.09019608, 1, 0, 1,
-0.4448453, 0.4052407, -1.300471, 0.08627451, 1, 0, 1,
-0.439129, 0.2229052, -2.018727, 0.07843138, 1, 0, 1,
-0.4390849, 0.8097267, -1.796541, 0.07450981, 1, 0, 1,
-0.4383819, 0.2223811, 0.5330876, 0.06666667, 1, 0, 1,
-0.4370479, 0.5102418, -1.88643, 0.0627451, 1, 0, 1,
-0.4369426, 0.7769479, 0.0327662, 0.05490196, 1, 0, 1,
-0.4166159, 1.024704, -0.3565773, 0.05098039, 1, 0, 1,
-0.4162368, 1.802498, -2.022581, 0.04313726, 1, 0, 1,
-0.4157824, -0.7269964, -4.148749, 0.03921569, 1, 0, 1,
-0.4151416, 0.7100896, -1.298515, 0.03137255, 1, 0, 1,
-0.4149024, 0.8180242, -1.027007, 0.02745098, 1, 0, 1,
-0.414654, -1.623058, -3.022809, 0.01960784, 1, 0, 1,
-0.4120678, -1.41202, -3.747183, 0.01568628, 1, 0, 1,
-0.4004797, 0.9263996, -2.233919, 0.007843138, 1, 0, 1,
-0.3985784, -1.598228, -5.043062, 0.003921569, 1, 0, 1,
-0.3968456, -0.7083397, -3.886972, 0, 1, 0.003921569, 1,
-0.3943664, -0.3584775, -1.795961, 0, 1, 0.01176471, 1,
-0.3927699, -0.6241133, -1.91909, 0, 1, 0.01568628, 1,
-0.3871776, -1.865637, -3.218757, 0, 1, 0.02352941, 1,
-0.3797323, -0.899771, -3.613643, 0, 1, 0.02745098, 1,
-0.3742498, 0.2332999, 0.8637924, 0, 1, 0.03529412, 1,
-0.3710174, 1.095655, -1.382818, 0, 1, 0.03921569, 1,
-0.3661132, 0.1912943, -1.230132, 0, 1, 0.04705882, 1,
-0.3611123, -0.7144381, -2.941724, 0, 1, 0.05098039, 1,
-0.3560168, -0.8892274, -1.631485, 0, 1, 0.05882353, 1,
-0.3558172, -1.605084, -2.897315, 0, 1, 0.0627451, 1,
-0.3418933, -0.8881795, -2.578038, 0, 1, 0.07058824, 1,
-0.3405367, 0.03686053, -1.329844, 0, 1, 0.07450981, 1,
-0.339828, -0.2781809, -1.401053, 0, 1, 0.08235294, 1,
-0.3364697, 0.3157565, -2.179088, 0, 1, 0.08627451, 1,
-0.3292037, 0.1919836, -2.975088, 0, 1, 0.09411765, 1,
-0.3288457, -1.183963, -2.322328, 0, 1, 0.1019608, 1,
-0.3259646, -0.2468868, -1.235079, 0, 1, 0.1058824, 1,
-0.3241141, -0.9786659, -3.587395, 0, 1, 0.1137255, 1,
-0.3188681, -0.9469776, -3.208441, 0, 1, 0.1176471, 1,
-0.3182904, 1.886443, 1.188303, 0, 1, 0.1254902, 1,
-0.3170934, -2.225961, -1.251092, 0, 1, 0.1294118, 1,
-0.3155511, 0.07777181, 0.7438409, 0, 1, 0.1372549, 1,
-0.3150449, 0.602044, -0.5340265, 0, 1, 0.1411765, 1,
-0.3120269, 0.538184, -1.986571, 0, 1, 0.1490196, 1,
-0.2897209, 1.242461, 0.5091482, 0, 1, 0.1529412, 1,
-0.2883485, 1.02087, 0.8860949, 0, 1, 0.1607843, 1,
-0.286469, 1.740562, -1.449566, 0, 1, 0.1647059, 1,
-0.286332, 1.018008, 0.4837423, 0, 1, 0.172549, 1,
-0.2841216, 0.1582714, -0.4369541, 0, 1, 0.1764706, 1,
-0.282509, -0.591528, -3.510967, 0, 1, 0.1843137, 1,
-0.2788097, -0.6645402, -1.995099, 0, 1, 0.1882353, 1,
-0.2754759, -0.0640825, -2.630213, 0, 1, 0.1960784, 1,
-0.2727919, -1.153119, -1.092057, 0, 1, 0.2039216, 1,
-0.2722219, -0.1169696, -0.9771847, 0, 1, 0.2078431, 1,
-0.270791, -0.5920773, -1.067272, 0, 1, 0.2156863, 1,
-0.2689977, -0.4407573, -1.698226, 0, 1, 0.2196078, 1,
-0.2644825, -1.696961, -2.737462, 0, 1, 0.227451, 1,
-0.2633678, 0.5322956, -0.6180085, 0, 1, 0.2313726, 1,
-0.2546689, -0.4419653, -3.187676, 0, 1, 0.2392157, 1,
-0.2536999, -1.754424, -4.10302, 0, 1, 0.2431373, 1,
-0.2525449, -0.9544206, -4.540075, 0, 1, 0.2509804, 1,
-0.2505757, -0.04814741, -1.153462, 0, 1, 0.254902, 1,
-0.2468683, -0.2094849, -2.338997, 0, 1, 0.2627451, 1,
-0.244548, 0.881097, 0.1856782, 0, 1, 0.2666667, 1,
-0.2419766, -2.175106, -2.271943, 0, 1, 0.2745098, 1,
-0.2415524, -0.2646366, -2.953547, 0, 1, 0.2784314, 1,
-0.2317759, -0.9648764, -2.672515, 0, 1, 0.2862745, 1,
-0.2288679, 0.8105954, 1.064388, 0, 1, 0.2901961, 1,
-0.2269144, -0.1133665, -3.469754, 0, 1, 0.2980392, 1,
-0.2242517, -0.778173, -2.276673, 0, 1, 0.3058824, 1,
-0.2172129, 0.2582677, -0.5897365, 0, 1, 0.3098039, 1,
-0.2167158, 0.5166927, -1.216774, 0, 1, 0.3176471, 1,
-0.2158218, -0.5171134, -2.973784, 0, 1, 0.3215686, 1,
-0.2101225, -1.157274, -3.385995, 0, 1, 0.3294118, 1,
-0.209905, 0.8541605, -1.838686, 0, 1, 0.3333333, 1,
-0.20396, -1.232299, -3.794952, 0, 1, 0.3411765, 1,
-0.1975212, -1.119998, -4.065533, 0, 1, 0.345098, 1,
-0.195905, -0.6040703, -1.638507, 0, 1, 0.3529412, 1,
-0.1898145, 0.08877408, -0.6025304, 0, 1, 0.3568628, 1,
-0.1813331, 0.8403926, 0.1422167, 0, 1, 0.3647059, 1,
-0.1712358, 1.187892, -1.055763, 0, 1, 0.3686275, 1,
-0.1690418, 0.8453809, -1.867988, 0, 1, 0.3764706, 1,
-0.1627713, -0.05514392, -2.99203, 0, 1, 0.3803922, 1,
-0.1563004, -0.3929508, -2.246973, 0, 1, 0.3882353, 1,
-0.1562192, 2.071412, -0.07621914, 0, 1, 0.3921569, 1,
-0.1553402, 0.1722151, -2.001467, 0, 1, 0.4, 1,
-0.1542366, 0.5470223, 1.436055, 0, 1, 0.4078431, 1,
-0.1531291, -1.945097, -2.946414, 0, 1, 0.4117647, 1,
-0.1525079, -0.9157872, -2.458905, 0, 1, 0.4196078, 1,
-0.1518892, 0.4182094, 0.9524562, 0, 1, 0.4235294, 1,
-0.1495941, 1.968348, -0.8700318, 0, 1, 0.4313726, 1,
-0.1492156, 0.3108731, -1.020983, 0, 1, 0.4352941, 1,
-0.1490061, -2.10358, -3.147143, 0, 1, 0.4431373, 1,
-0.1480524, -0.3154749, -3.476871, 0, 1, 0.4470588, 1,
-0.1430652, -0.5280252, -2.282154, 0, 1, 0.454902, 1,
-0.1351831, 0.2057479, -1.382334, 0, 1, 0.4588235, 1,
-0.1310205, -0.6324124, -4.837898, 0, 1, 0.4666667, 1,
-0.1307271, 0.3294806, -1.438216, 0, 1, 0.4705882, 1,
-0.1283107, -0.121435, -1.84923, 0, 1, 0.4784314, 1,
-0.127839, -0.2555242, -2.269594, 0, 1, 0.4823529, 1,
-0.126093, 0.5122945, -0.9869333, 0, 1, 0.4901961, 1,
-0.1253481, 0.6428846, -0.6374555, 0, 1, 0.4941176, 1,
-0.1232915, 1.21352, -0.9694564, 0, 1, 0.5019608, 1,
-0.1220656, 0.9642809, 1.450347, 0, 1, 0.509804, 1,
-0.1206362, -1.340445, -3.456465, 0, 1, 0.5137255, 1,
-0.116407, 0.8511625, -1.075157, 0, 1, 0.5215687, 1,
-0.1124279, 0.7918252, -0.7608999, 0, 1, 0.5254902, 1,
-0.1090718, 0.6918848, -0.7834676, 0, 1, 0.5333334, 1,
-0.1079759, 0.3881747, 0.2735351, 0, 1, 0.5372549, 1,
-0.1051375, -0.7213712, -3.489423, 0, 1, 0.5450981, 1,
-0.1042542, 0.64978, 0.766188, 0, 1, 0.5490196, 1,
-0.1039861, -0.05417879, -2.863324, 0, 1, 0.5568628, 1,
-0.103543, 1.08265, -1.409293, 0, 1, 0.5607843, 1,
-0.1008559, 0.5824627, -0.1067, 0, 1, 0.5686275, 1,
-0.09673437, -0.3552961, -4.598412, 0, 1, 0.572549, 1,
-0.09468999, 0.6979257, 0.5548405, 0, 1, 0.5803922, 1,
-0.09399135, 1.880866, -1.391386, 0, 1, 0.5843138, 1,
-0.08913092, -0.2257392, -1.769901, 0, 1, 0.5921569, 1,
-0.08550194, -0.2846264, -4.294336, 0, 1, 0.5960785, 1,
-0.08376393, -1.190004, -4.753011, 0, 1, 0.6039216, 1,
-0.08268779, -0.4813294, -3.269851, 0, 1, 0.6117647, 1,
-0.0803683, 0.6839157, -1.352678, 0, 1, 0.6156863, 1,
-0.06855077, 0.955171, 0.3264538, 0, 1, 0.6235294, 1,
-0.05996837, -0.593649, -3.86203, 0, 1, 0.627451, 1,
-0.05951859, -0.9034481, -2.197167, 0, 1, 0.6352941, 1,
-0.05861046, -0.02451007, -2.600701, 0, 1, 0.6392157, 1,
-0.05723223, 1.591893, -0.2098234, 0, 1, 0.6470588, 1,
-0.05524856, -0.6835607, -3.533763, 0, 1, 0.6509804, 1,
-0.04865883, 0.618473, -0.04044256, 0, 1, 0.6588235, 1,
-0.04775002, -0.5408863, -1.757495, 0, 1, 0.6627451, 1,
-0.04748109, -0.2780372, -1.690946, 0, 1, 0.6705883, 1,
-0.04597764, -0.9770638, -2.311834, 0, 1, 0.6745098, 1,
-0.04535035, -0.08412063, -2.587979, 0, 1, 0.682353, 1,
-0.04303694, 1.379763, -0.3613223, 0, 1, 0.6862745, 1,
-0.04286286, 0.8420025, -0.7448013, 0, 1, 0.6941177, 1,
-0.04205425, -0.5874619, -1.99156, 0, 1, 0.7019608, 1,
-0.04181307, -0.6256288, -3.310813, 0, 1, 0.7058824, 1,
-0.04006061, 1.523401, -0.7278652, 0, 1, 0.7137255, 1,
-0.03903829, 1.162674, 0.183061, 0, 1, 0.7176471, 1,
-0.03302602, -0.4474202, -3.529546, 0, 1, 0.7254902, 1,
-0.03090996, -0.8081952, -3.148326, 0, 1, 0.7294118, 1,
-0.02427855, -0.7742742, -4.469325, 0, 1, 0.7372549, 1,
-0.01804634, -0.972799, -3.130485, 0, 1, 0.7411765, 1,
-0.01737512, -0.3142792, -4.205922, 0, 1, 0.7490196, 1,
-0.01622871, 0.7343076, 0.8512785, 0, 1, 0.7529412, 1,
-0.01617978, -0.2734251, -4.590402, 0, 1, 0.7607843, 1,
-0.01466051, 0.1220108, 0.9566416, 0, 1, 0.7647059, 1,
-0.011672, 1.090498, -1.572608, 0, 1, 0.772549, 1,
-0.01119313, -1.184479, -4.144578, 0, 1, 0.7764706, 1,
-0.01084109, -0.8418455, -3.256424, 0, 1, 0.7843137, 1,
-0.006520285, 1.031074, -2.42327, 0, 1, 0.7882353, 1,
-0.003628407, -1.501758, -1.807005, 0, 1, 0.7960784, 1,
-0.0005650405, -1.818969, -4.037872, 0, 1, 0.8039216, 1,
0.001684529, -0.2932715, 3.334223, 0, 1, 0.8078431, 1,
0.002683416, -0.5220288, 3.174885, 0, 1, 0.8156863, 1,
0.003659703, -0.4994879, 3.533324, 0, 1, 0.8196079, 1,
0.008457885, -0.7555966, 3.326656, 0, 1, 0.827451, 1,
0.01084794, 0.6888863, -0.4334628, 0, 1, 0.8313726, 1,
0.0138775, 0.7490163, -0.05539444, 0, 1, 0.8392157, 1,
0.01861252, -0.5047405, 2.85789, 0, 1, 0.8431373, 1,
0.01912697, 1.69158, 1.229399, 0, 1, 0.8509804, 1,
0.02053323, 1.151366, -0.5687402, 0, 1, 0.854902, 1,
0.02062454, 0.8553683, -0.8417549, 0, 1, 0.8627451, 1,
0.02106786, -1.223206, 3.099688, 0, 1, 0.8666667, 1,
0.0213887, 0.9612049, 0.0436504, 0, 1, 0.8745098, 1,
0.02189747, -1.619735, 2.970881, 0, 1, 0.8784314, 1,
0.02276206, 0.5187598, 1.082686, 0, 1, 0.8862745, 1,
0.02790535, -0.5762777, 3.262067, 0, 1, 0.8901961, 1,
0.02872222, -0.2002368, 3.545422, 0, 1, 0.8980392, 1,
0.03394093, -0.4689129, 2.612566, 0, 1, 0.9058824, 1,
0.03458649, -0.6186543, 2.19238, 0, 1, 0.9098039, 1,
0.03478614, -0.3763508, 3.210802, 0, 1, 0.9176471, 1,
0.0380665, 0.4315475, -0.744869, 0, 1, 0.9215686, 1,
0.04013016, -1.596124, 3.174514, 0, 1, 0.9294118, 1,
0.0404536, 1.252785, -1.662107, 0, 1, 0.9333333, 1,
0.04280761, 0.2187123, 0.4970536, 0, 1, 0.9411765, 1,
0.0438486, 1.505923, 0.7288201, 0, 1, 0.945098, 1,
0.04569898, 0.4607751, -0.6427318, 0, 1, 0.9529412, 1,
0.04650508, -2.532797, 3.870954, 0, 1, 0.9568627, 1,
0.0466446, 0.08251283, 0.2753403, 0, 1, 0.9647059, 1,
0.04679471, -1.890092, 2.619854, 0, 1, 0.9686275, 1,
0.04899095, 0.8929265, 0.4675333, 0, 1, 0.9764706, 1,
0.0497388, -0.7809675, 4.320597, 0, 1, 0.9803922, 1,
0.05292581, 0.9085417, 0.289108, 0, 1, 0.9882353, 1,
0.05398503, 0.7854027, 0.853314, 0, 1, 0.9921569, 1,
0.06348928, 2.831594, 0.2007567, 0, 1, 1, 1,
0.06431919, 0.4523531, 1.216676, 0, 0.9921569, 1, 1,
0.06617687, -1.259728, 2.577502, 0, 0.9882353, 1, 1,
0.06636578, -1.929662, 2.849077, 0, 0.9803922, 1, 1,
0.06819733, -0.2358537, 3.651181, 0, 0.9764706, 1, 1,
0.07358821, 1.75582, -0.07835945, 0, 0.9686275, 1, 1,
0.08373762, -0.6054293, 2.065247, 0, 0.9647059, 1, 1,
0.0861041, -0.2221992, 1.70057, 0, 0.9568627, 1, 1,
0.09113007, -0.7090803, 3.455924, 0, 0.9529412, 1, 1,
0.09145267, -2.341032, 5.149089, 0, 0.945098, 1, 1,
0.09223228, -0.368212, 2.249642, 0, 0.9411765, 1, 1,
0.09579479, 0.7423778, -1.102369, 0, 0.9333333, 1, 1,
0.09790191, -0.08902307, 2.469098, 0, 0.9294118, 1, 1,
0.10087, 0.1728929, 0.5571569, 0, 0.9215686, 1, 1,
0.1058241, -0.1882952, 2.764775, 0, 0.9176471, 1, 1,
0.1061877, -0.3983437, 2.452445, 0, 0.9098039, 1, 1,
0.1087172, -1.306948, 2.39692, 0, 0.9058824, 1, 1,
0.1089645, 0.5382017, 1.533022, 0, 0.8980392, 1, 1,
0.1194922, 1.189451, -0.3723344, 0, 0.8901961, 1, 1,
0.120167, -0.241735, 1.732813, 0, 0.8862745, 1, 1,
0.1226755, -0.1604065, 2.881468, 0, 0.8784314, 1, 1,
0.1289453, -1.329981, 3.663501, 0, 0.8745098, 1, 1,
0.1291265, 0.6867959, -0.4991508, 0, 0.8666667, 1, 1,
0.1304307, -1.321577, 4.014986, 0, 0.8627451, 1, 1,
0.1314161, 0.7204664, 1.986809, 0, 0.854902, 1, 1,
0.1337644, 0.5702682, -1.883884, 0, 0.8509804, 1, 1,
0.1359985, 0.04745828, 0.05752052, 0, 0.8431373, 1, 1,
0.139693, -0.1825052, 2.9353, 0, 0.8392157, 1, 1,
0.1413419, -1.911463, 3.664714, 0, 0.8313726, 1, 1,
0.141733, 0.08729991, 1.448459, 0, 0.827451, 1, 1,
0.1513334, -0.2508374, 4.723699, 0, 0.8196079, 1, 1,
0.1517318, 0.8211343, 1.507609, 0, 0.8156863, 1, 1,
0.1517754, -0.08119709, 1.368837, 0, 0.8078431, 1, 1,
0.1583899, -0.9397715, 3.949731, 0, 0.8039216, 1, 1,
0.1596567, -0.2055601, 2.120348, 0, 0.7960784, 1, 1,
0.1662038, 0.9870291, -0.6129527, 0, 0.7882353, 1, 1,
0.1717431, 0.1467694, 2.07216, 0, 0.7843137, 1, 1,
0.1720335, 1.861077, 0.9198642, 0, 0.7764706, 1, 1,
0.173971, 0.3943566, 0.7398091, 0, 0.772549, 1, 1,
0.1758358, -0.7647371, 3.748216, 0, 0.7647059, 1, 1,
0.1802343, 0.05340104, 0.5118527, 0, 0.7607843, 1, 1,
0.182003, -0.4200793, 3.904604, 0, 0.7529412, 1, 1,
0.1823203, -0.5198787, 2.766103, 0, 0.7490196, 1, 1,
0.1838164, -0.5049915, 4.114952, 0, 0.7411765, 1, 1,
0.1857819, -0.9232038, 2.694764, 0, 0.7372549, 1, 1,
0.1867988, -0.3046767, 2.092067, 0, 0.7294118, 1, 1,
0.1873561, -1.406468, 1.823326, 0, 0.7254902, 1, 1,
0.187689, 1.121676, 1.174158, 0, 0.7176471, 1, 1,
0.1899774, -0.1286028, 0.3281741, 0, 0.7137255, 1, 1,
0.1919728, -0.5002955, 2.207661, 0, 0.7058824, 1, 1,
0.1943929, 0.9021091, -0.9469123, 0, 0.6980392, 1, 1,
0.1960962, -0.6617929, 1.779224, 0, 0.6941177, 1, 1,
0.1985831, -1.602241, 3.503715, 0, 0.6862745, 1, 1,
0.1990426, -1.84934, 3.946516, 0, 0.682353, 1, 1,
0.2020502, -1.51944, 3.577522, 0, 0.6745098, 1, 1,
0.2036972, 1.048385, 0.5892065, 0, 0.6705883, 1, 1,
0.2058047, -1.281981, 1.668367, 0, 0.6627451, 1, 1,
0.2101228, 0.7952106, -0.1495798, 0, 0.6588235, 1, 1,
0.2107773, 0.1431975, 1.434873, 0, 0.6509804, 1, 1,
0.2123154, -1.477699, 2.83764, 0, 0.6470588, 1, 1,
0.2130219, -0.03661435, 1.018066, 0, 0.6392157, 1, 1,
0.2157592, 0.3436314, 2.111577, 0, 0.6352941, 1, 1,
0.2168631, -2.611426, 2.196994, 0, 0.627451, 1, 1,
0.2184516, 1.38135, 0.1849567, 0, 0.6235294, 1, 1,
0.220595, -2.755765, 2.25116, 0, 0.6156863, 1, 1,
0.2214015, 0.09287988, 0.8617359, 0, 0.6117647, 1, 1,
0.2217909, 0.8039702, -0.5722609, 0, 0.6039216, 1, 1,
0.2224363, -0.5218012, 2.81386, 0, 0.5960785, 1, 1,
0.2229216, -2.061548, 4.93794, 0, 0.5921569, 1, 1,
0.2230111, 0.6921824, 1.428512, 0, 0.5843138, 1, 1,
0.2246236, 0.8565343, 1.251516, 0, 0.5803922, 1, 1,
0.2280045, 1.110108, 0.3341188, 0, 0.572549, 1, 1,
0.2281742, 0.4494196, 0.9655543, 0, 0.5686275, 1, 1,
0.2287313, -0.7653109, 2.79264, 0, 0.5607843, 1, 1,
0.2297479, -1.108776, 2.540772, 0, 0.5568628, 1, 1,
0.2327549, 0.1055093, 1.268961, 0, 0.5490196, 1, 1,
0.2344355, -0.9179797, 2.369417, 0, 0.5450981, 1, 1,
0.2358505, 1.446034, -0.8488818, 0, 0.5372549, 1, 1,
0.2364516, -1.282769, 3.637988, 0, 0.5333334, 1, 1,
0.2369572, 0.3568561, 0.1226091, 0, 0.5254902, 1, 1,
0.2380753, -0.8808178, 4.972559, 0, 0.5215687, 1, 1,
0.2467246, -0.02154219, 0.6286191, 0, 0.5137255, 1, 1,
0.2476275, 1.119247, 0.6159282, 0, 0.509804, 1, 1,
0.2481661, 0.2046516, -0.1462825, 0, 0.5019608, 1, 1,
0.2626193, -0.2892516, 1.001688, 0, 0.4941176, 1, 1,
0.2631044, -0.345888, 2.871751, 0, 0.4901961, 1, 1,
0.2633453, 1.680515, 1.062305, 0, 0.4823529, 1, 1,
0.2639829, 0.1128116, 2.919743, 0, 0.4784314, 1, 1,
0.2681073, 1.367865, 1.581298, 0, 0.4705882, 1, 1,
0.2695064, -1.691479, 2.883824, 0, 0.4666667, 1, 1,
0.2732284, -0.7366285, 1.313269, 0, 0.4588235, 1, 1,
0.2777518, -2.050054, 3.549756, 0, 0.454902, 1, 1,
0.2838186, 1.130917, -0.1099117, 0, 0.4470588, 1, 1,
0.2839051, -0.0550867, 2.618643, 0, 0.4431373, 1, 1,
0.2881184, 1.319957, 1.252169, 0, 0.4352941, 1, 1,
0.2884623, 1.206126, 0.2339906, 0, 0.4313726, 1, 1,
0.2886168, 1.209445, -0.132698, 0, 0.4235294, 1, 1,
0.2890806, -0.143994, 2.516945, 0, 0.4196078, 1, 1,
0.2891732, -0.5189875, 1.874887, 0, 0.4117647, 1, 1,
0.2915875, 1.064261, 2.185357, 0, 0.4078431, 1, 1,
0.2923885, 1.013738, -0.9406374, 0, 0.4, 1, 1,
0.2938476, -0.7088457, 1.777366, 0, 0.3921569, 1, 1,
0.2945645, 0.1005055, 0.7602357, 0, 0.3882353, 1, 1,
0.3017206, -1.010044, 2.763703, 0, 0.3803922, 1, 1,
0.302391, -0.05018944, 2.174743, 0, 0.3764706, 1, 1,
0.3037069, 1.563468, 1.185892, 0, 0.3686275, 1, 1,
0.3045323, -0.9522813, 3.583194, 0, 0.3647059, 1, 1,
0.3073757, -1.593506, 3.01649, 0, 0.3568628, 1, 1,
0.3077379, -1.841375, 3.517444, 0, 0.3529412, 1, 1,
0.3100963, -0.1655867, 1.808828, 0, 0.345098, 1, 1,
0.312902, -1.104128, 2.94681, 0, 0.3411765, 1, 1,
0.3130278, -1.197676, 3.627583, 0, 0.3333333, 1, 1,
0.3265592, 0.02212636, 1.950688, 0, 0.3294118, 1, 1,
0.3276598, -0.3807393, 3.829051, 0, 0.3215686, 1, 1,
0.3320559, 0.391685, -1.089807, 0, 0.3176471, 1, 1,
0.3327668, 0.901875, -0.007532845, 0, 0.3098039, 1, 1,
0.3331163, -1.103683, 3.191581, 0, 0.3058824, 1, 1,
0.3343895, 0.01408178, 1.588253, 0, 0.2980392, 1, 1,
0.3352523, 1.977597, -0.03758644, 0, 0.2901961, 1, 1,
0.3443912, 0.7563015, -0.4131033, 0, 0.2862745, 1, 1,
0.3456452, -1.680876, 2.759444, 0, 0.2784314, 1, 1,
0.3468716, -0.5411842, 3.136876, 0, 0.2745098, 1, 1,
0.3479555, -0.3046758, 0.3985628, 0, 0.2666667, 1, 1,
0.3535439, -0.4670807, 4.076719, 0, 0.2627451, 1, 1,
0.3580573, -0.982986, 4.615121, 0, 0.254902, 1, 1,
0.3582169, 1.882992, 0.1150819, 0, 0.2509804, 1, 1,
0.3593094, -2.410959, 2.905663, 0, 0.2431373, 1, 1,
0.3596779, 0.7024487, 1.575573, 0, 0.2392157, 1, 1,
0.3603938, -0.423868, 3.579785, 0, 0.2313726, 1, 1,
0.3604791, 0.7737223, 0.9010919, 0, 0.227451, 1, 1,
0.3678752, -1.016218, 3.120274, 0, 0.2196078, 1, 1,
0.3684388, -0.2113943, 2.85464, 0, 0.2156863, 1, 1,
0.369908, -0.3414845, 0.433024, 0, 0.2078431, 1, 1,
0.3701651, 1.45683, 0.03385762, 0, 0.2039216, 1, 1,
0.3723094, 0.3458897, 1.136702, 0, 0.1960784, 1, 1,
0.3808556, -0.8500146, 3.722465, 0, 0.1882353, 1, 1,
0.3827348, 0.5942024, 2.423461, 0, 0.1843137, 1, 1,
0.3862396, -0.4712006, 2.77347, 0, 0.1764706, 1, 1,
0.3865991, -1.067464, 3.312912, 0, 0.172549, 1, 1,
0.3886754, -1.031554, 1.553536, 0, 0.1647059, 1, 1,
0.3941187, -0.08276462, 1.947956, 0, 0.1607843, 1, 1,
0.396798, 1.703866, 0.3241209, 0, 0.1529412, 1, 1,
0.3999928, -0.4766192, 2.333529, 0, 0.1490196, 1, 1,
0.4030327, 0.3724044, -0.8616594, 0, 0.1411765, 1, 1,
0.4092427, -1.478658, 2.029361, 0, 0.1372549, 1, 1,
0.4147462, -1.516181, 2.625708, 0, 0.1294118, 1, 1,
0.4230981, 2.164979, -0.8822465, 0, 0.1254902, 1, 1,
0.4257164, 0.9411919, -0.0480624, 0, 0.1176471, 1, 1,
0.4257975, 0.4342822, -0.3200708, 0, 0.1137255, 1, 1,
0.4311199, 0.5532322, 0.1479749, 0, 0.1058824, 1, 1,
0.4314004, 0.7708091, -1.082195, 0, 0.09803922, 1, 1,
0.4335026, 1.222739, -0.1004181, 0, 0.09411765, 1, 1,
0.433517, -0.05179436, 3.830885, 0, 0.08627451, 1, 1,
0.4338185, 0.07483173, 1.365915, 0, 0.08235294, 1, 1,
0.4341077, 0.04590693, 2.199932, 0, 0.07450981, 1, 1,
0.4345042, -0.639293, 3.710786, 0, 0.07058824, 1, 1,
0.4393104, 1.953714, -0.09672931, 0, 0.0627451, 1, 1,
0.4428174, -1.301965, 3.381565, 0, 0.05882353, 1, 1,
0.4467186, -1.221703, 3.959075, 0, 0.05098039, 1, 1,
0.453853, 2.263054, -1.261356, 0, 0.04705882, 1, 1,
0.4559419, -1.054848, 2.471909, 0, 0.03921569, 1, 1,
0.4593665, -1.242743, 3.872616, 0, 0.03529412, 1, 1,
0.4598516, -0.4624752, 0.8433034, 0, 0.02745098, 1, 1,
0.4620619, 0.5192302, -0.7944434, 0, 0.02352941, 1, 1,
0.4655347, -0.09532031, 0.4802338, 0, 0.01568628, 1, 1,
0.4700686, -0.7456896, 1.617923, 0, 0.01176471, 1, 1,
0.4711007, -0.3600534, 2.366783, 0, 0.003921569, 1, 1,
0.4760389, 0.6549444, 0.7576489, 0.003921569, 0, 1, 1,
0.4771002, 0.9825149, 1.05893, 0.007843138, 0, 1, 1,
0.4786251, -1.22451, 2.008937, 0.01568628, 0, 1, 1,
0.481697, -0.8022452, 2.985653, 0.01960784, 0, 1, 1,
0.4823909, 0.3131356, 0.951636, 0.02745098, 0, 1, 1,
0.4831184, 0.3789826, 0.0987011, 0.03137255, 0, 1, 1,
0.4845296, -1.196861, 2.960577, 0.03921569, 0, 1, 1,
0.4853593, -0.9420985, 3.268641, 0.04313726, 0, 1, 1,
0.4855683, -1.395762, 2.436331, 0.05098039, 0, 1, 1,
0.487325, 2.647117, 0.8476521, 0.05490196, 0, 1, 1,
0.4898515, -0.3626351, 2.14504, 0.0627451, 0, 1, 1,
0.4916576, 1.877427, -0.7788784, 0.06666667, 0, 1, 1,
0.4928197, -0.2412267, 3.114341, 0.07450981, 0, 1, 1,
0.4959691, 0.339625, 0.0357412, 0.07843138, 0, 1, 1,
0.4969726, 0.6544773, -0.03883998, 0.08627451, 0, 1, 1,
0.5135485, -0.3120516, 2.109715, 0.09019608, 0, 1, 1,
0.5160816, 1.437939, 0.692138, 0.09803922, 0, 1, 1,
0.5181461, 0.3808216, 0.6381896, 0.1058824, 0, 1, 1,
0.5191811, 0.3451509, 2.09798, 0.1098039, 0, 1, 1,
0.5235741, -0.2728955, 2.516876, 0.1176471, 0, 1, 1,
0.525179, -1.303029, 2.49725, 0.1215686, 0, 1, 1,
0.5291911, 1.005008, 1.148674, 0.1294118, 0, 1, 1,
0.530854, 2.423544, 0.07431233, 0.1333333, 0, 1, 1,
0.5312434, 0.2098067, 0.6128276, 0.1411765, 0, 1, 1,
0.5313518, 0.5217006, -0.3560081, 0.145098, 0, 1, 1,
0.5342587, -1.821528, 2.51137, 0.1529412, 0, 1, 1,
0.5419394, -1.177303, 2.922217, 0.1568628, 0, 1, 1,
0.5449882, 0.1028674, 1.637373, 0.1647059, 0, 1, 1,
0.5468885, 0.07163818, 1.053033, 0.1686275, 0, 1, 1,
0.5475889, 0.934614, -0.3807361, 0.1764706, 0, 1, 1,
0.54816, 0.4234925, -0.2358577, 0.1803922, 0, 1, 1,
0.5511878, 0.202393, -0.3974706, 0.1882353, 0, 1, 1,
0.5516912, -0.2371201, -0.5402277, 0.1921569, 0, 1, 1,
0.5559796, 1.208521, 1.105049, 0.2, 0, 1, 1,
0.5603644, 0.7727078, 0.3346575, 0.2078431, 0, 1, 1,
0.5610895, 1.071887, 1.634169, 0.2117647, 0, 1, 1,
0.5622935, -0.2556547, 3.335839, 0.2196078, 0, 1, 1,
0.5699478, -0.01259632, 1.372145, 0.2235294, 0, 1, 1,
0.5732686, 0.6329395, -0.0828075, 0.2313726, 0, 1, 1,
0.5739763, 0.7822617, 0.1191772, 0.2352941, 0, 1, 1,
0.5773221, 0.9748201, 1.406353, 0.2431373, 0, 1, 1,
0.5835837, 0.7245036, 1.038991, 0.2470588, 0, 1, 1,
0.5882003, 0.6601157, 1.885787, 0.254902, 0, 1, 1,
0.5894748, 1.065026, -0.1696978, 0.2588235, 0, 1, 1,
0.5967086, -0.3420799, 2.490918, 0.2666667, 0, 1, 1,
0.6017271, 1.074463, 1.163984, 0.2705882, 0, 1, 1,
0.6038471, 0.1074348, 2.085958, 0.2784314, 0, 1, 1,
0.6040723, 0.9629281, -0.4119153, 0.282353, 0, 1, 1,
0.6059924, 1.34679, 0.9247875, 0.2901961, 0, 1, 1,
0.6103905, -0.003850306, 2.204317, 0.2941177, 0, 1, 1,
0.6131333, 0.2431551, 1.786937, 0.3019608, 0, 1, 1,
0.613722, 1.113231, 0.1197781, 0.3098039, 0, 1, 1,
0.6145383, 0.212313, 1.276323, 0.3137255, 0, 1, 1,
0.6202182, -1.399237, 2.785116, 0.3215686, 0, 1, 1,
0.6208106, -0.8470829, 2.72756, 0.3254902, 0, 1, 1,
0.6231186, 0.5523928, 1.57073, 0.3333333, 0, 1, 1,
0.6240431, -1.679679, 2.828913, 0.3372549, 0, 1, 1,
0.6249596, -1.423285, 3.090479, 0.345098, 0, 1, 1,
0.6250347, 0.5937114, 1.558277, 0.3490196, 0, 1, 1,
0.6261557, -0.02870631, 1.728877, 0.3568628, 0, 1, 1,
0.630653, 0.07968108, 1.327631, 0.3607843, 0, 1, 1,
0.6313995, -0.3995926, 1.907172, 0.3686275, 0, 1, 1,
0.6335858, 1.080955, 1.287329, 0.372549, 0, 1, 1,
0.6337418, 0.716022, 1.440376, 0.3803922, 0, 1, 1,
0.6352754, 2.150755, 0.6433449, 0.3843137, 0, 1, 1,
0.6410184, 0.6880122, -0.5348601, 0.3921569, 0, 1, 1,
0.6413395, -2.123362, 3.018425, 0.3960784, 0, 1, 1,
0.6437558, -0.8640356, 0.3443973, 0.4039216, 0, 1, 1,
0.6438535, 0.5308762, 2.007243, 0.4117647, 0, 1, 1,
0.6454007, -0.4285112, 2.584687, 0.4156863, 0, 1, 1,
0.6480054, 0.8219652, 0.438785, 0.4235294, 0, 1, 1,
0.6486602, -0.2919619, 2.747375, 0.427451, 0, 1, 1,
0.6526422, -1.193884, 1.874182, 0.4352941, 0, 1, 1,
0.6530859, -0.0758476, 1.06452, 0.4392157, 0, 1, 1,
0.6546115, 0.261052, 1.893494, 0.4470588, 0, 1, 1,
0.6583896, -1.113114, 1.295956, 0.4509804, 0, 1, 1,
0.6583943, 0.4060303, 0.6259863, 0.4588235, 0, 1, 1,
0.6588872, -0.7653356, 2.493101, 0.4627451, 0, 1, 1,
0.6663482, -0.6210458, 1.823395, 0.4705882, 0, 1, 1,
0.67087, -0.02104511, 1.95939, 0.4745098, 0, 1, 1,
0.6709791, -0.6543705, 2.142406, 0.4823529, 0, 1, 1,
0.6713552, 0.6250879, 0.2596318, 0.4862745, 0, 1, 1,
0.6760945, -1.555411, 1.999048, 0.4941176, 0, 1, 1,
0.6772786, 0.8711714, -0.4998273, 0.5019608, 0, 1, 1,
0.6789449, -0.1706725, 2.557355, 0.5058824, 0, 1, 1,
0.6797802, -0.6338809, 2.39302, 0.5137255, 0, 1, 1,
0.6823587, -1.528923, 1.93272, 0.5176471, 0, 1, 1,
0.6824126, 0.167838, 1.818356, 0.5254902, 0, 1, 1,
0.6831153, -1.54661, 3.929179, 0.5294118, 0, 1, 1,
0.6889412, 1.419145, -1.413492, 0.5372549, 0, 1, 1,
0.6934419, -1.04454, 1.947381, 0.5411765, 0, 1, 1,
0.6979071, 0.1384855, 0.2148425, 0.5490196, 0, 1, 1,
0.6986371, -0.7273103, 2.940032, 0.5529412, 0, 1, 1,
0.6995358, 0.4370672, 0.4925958, 0.5607843, 0, 1, 1,
0.699957, 0.4245149, 0.7287127, 0.5647059, 0, 1, 1,
0.7051232, -1.301568, 3.390947, 0.572549, 0, 1, 1,
0.7067336, -0.8475441, 0.6223459, 0.5764706, 0, 1, 1,
0.709619, 0.02877009, 2.430518, 0.5843138, 0, 1, 1,
0.7099416, 1.095712, 0.8164878, 0.5882353, 0, 1, 1,
0.7122576, 1.275906, 0.2552833, 0.5960785, 0, 1, 1,
0.7216392, -0.3366889, 2.20669, 0.6039216, 0, 1, 1,
0.7226099, -0.7862985, 1.237741, 0.6078432, 0, 1, 1,
0.7333692, 0.731939, -0.1922841, 0.6156863, 0, 1, 1,
0.7346458, -0.135756, 2.301979, 0.6196079, 0, 1, 1,
0.7385015, 0.6481272, -0.3973538, 0.627451, 0, 1, 1,
0.7395862, -1.131582, 4.903811, 0.6313726, 0, 1, 1,
0.7587602, 0.07065868, 2.228924, 0.6392157, 0, 1, 1,
0.7600671, 0.1003909, 2.870247, 0.6431373, 0, 1, 1,
0.7618033, -0.5725741, 2.451839, 0.6509804, 0, 1, 1,
0.7621323, 0.08149669, 0.1365588, 0.654902, 0, 1, 1,
0.7652418, 0.4691769, 0.1587715, 0.6627451, 0, 1, 1,
0.7679894, -0.592624, 2.090713, 0.6666667, 0, 1, 1,
0.772901, -0.1110706, 3.973683, 0.6745098, 0, 1, 1,
0.7730633, -1.19691, 2.54127, 0.6784314, 0, 1, 1,
0.7753989, -0.6275178, 2.402454, 0.6862745, 0, 1, 1,
0.7778654, -1.229174, 1.499071, 0.6901961, 0, 1, 1,
0.7784926, 0.541675, 1.832712, 0.6980392, 0, 1, 1,
0.7853007, -0.6463886, 2.710683, 0.7058824, 0, 1, 1,
0.7864741, 0.8619774, 2.198106, 0.7098039, 0, 1, 1,
0.7867532, -0.2446002, 2.72453, 0.7176471, 0, 1, 1,
0.788461, -0.2079308, 2.303754, 0.7215686, 0, 1, 1,
0.7888039, -0.6238527, 1.168375, 0.7294118, 0, 1, 1,
0.7920118, 0.4879751, 1.46808, 0.7333333, 0, 1, 1,
0.793825, -0.7139133, 3.463683, 0.7411765, 0, 1, 1,
0.796862, 0.1539083, 0.2524303, 0.7450981, 0, 1, 1,
0.7971563, -1.823432, 2.636318, 0.7529412, 0, 1, 1,
0.7977523, 0.2815569, 2.026956, 0.7568628, 0, 1, 1,
0.8011847, -0.1178579, 2.917125, 0.7647059, 0, 1, 1,
0.8029839, -0.9478132, 1.519891, 0.7686275, 0, 1, 1,
0.8031722, 0.8852999, 0.6950222, 0.7764706, 0, 1, 1,
0.8037634, 0.7889548, 1.287598, 0.7803922, 0, 1, 1,
0.8039411, -0.100243, 2.113609, 0.7882353, 0, 1, 1,
0.8086702, 0.2519743, 0.8391742, 0.7921569, 0, 1, 1,
0.8113216, -0.68641, 2.486293, 0.8, 0, 1, 1,
0.8167657, 1.159616, 2.369068, 0.8078431, 0, 1, 1,
0.8212245, 0.4461122, 1.16073, 0.8117647, 0, 1, 1,
0.8222821, -1.757501, 3.799379, 0.8196079, 0, 1, 1,
0.8421863, -2.426751, 2.225457, 0.8235294, 0, 1, 1,
0.8618397, 1.064711, -1.150318, 0.8313726, 0, 1, 1,
0.8716407, 0.5386583, 2.15509, 0.8352941, 0, 1, 1,
0.8720715, 1.2025, 0.5226394, 0.8431373, 0, 1, 1,
0.874481, -0.9671292, 3.563397, 0.8470588, 0, 1, 1,
0.8751384, -0.3553225, 3.396805, 0.854902, 0, 1, 1,
0.8754545, -0.743293, 3.098997, 0.8588235, 0, 1, 1,
0.8789448, -0.5278382, 3.031086, 0.8666667, 0, 1, 1,
0.8814588, 0.8729613, -0.9123974, 0.8705882, 0, 1, 1,
0.8847895, 0.1934376, 2.292972, 0.8784314, 0, 1, 1,
0.8897957, 0.1442525, 1.77986, 0.8823529, 0, 1, 1,
0.8941421, -1.534473, 4.616883, 0.8901961, 0, 1, 1,
0.8944277, 1.484295, 0.3472482, 0.8941177, 0, 1, 1,
0.8946404, 1.357921, 0.7661586, 0.9019608, 0, 1, 1,
0.9006952, -0.1601763, 0.9517592, 0.9098039, 0, 1, 1,
0.9027935, 1.859261, 0.5022652, 0.9137255, 0, 1, 1,
0.9046398, 0.03498654, 2.290366, 0.9215686, 0, 1, 1,
0.9063869, 1.787382, 1.356196, 0.9254902, 0, 1, 1,
0.9126504, 1.17546, 0.8653522, 0.9333333, 0, 1, 1,
0.9146081, 0.1432303, 2.009715, 0.9372549, 0, 1, 1,
0.9147642, -0.9836317, 2.34993, 0.945098, 0, 1, 1,
0.9161505, 0.8607965, 1.630301, 0.9490196, 0, 1, 1,
0.9261147, 0.1397912, 1.866279, 0.9568627, 0, 1, 1,
0.9275935, 1.054341, 1.252619, 0.9607843, 0, 1, 1,
0.9280101, 0.4450983, 3.483701, 0.9686275, 0, 1, 1,
0.9295335, -1.142511, 2.346012, 0.972549, 0, 1, 1,
0.9390647, 0.1657971, 3.4055, 0.9803922, 0, 1, 1,
0.942361, 0.1543828, 2.195894, 0.9843137, 0, 1, 1,
0.9475054, 0.09059176, 4.394011, 0.9921569, 0, 1, 1,
0.9567248, 0.3327531, 1.251483, 0.9960784, 0, 1, 1,
0.9642601, 1.326894, -1.441849, 1, 0, 0.9960784, 1,
0.9668233, -0.1423429, 2.741006, 1, 0, 0.9882353, 1,
0.9695183, -0.781798, 1.587911, 1, 0, 0.9843137, 1,
0.9699864, 0.6591051, 2.273181, 1, 0, 0.9764706, 1,
0.9734067, -1.254329, 1.94795, 1, 0, 0.972549, 1,
0.9835002, -0.9950609, 1.253386, 1, 0, 0.9647059, 1,
0.9857521, -1.062291, 2.583998, 1, 0, 0.9607843, 1,
0.9867042, -0.9690311, 2.486118, 1, 0, 0.9529412, 1,
0.9879813, 0.2115549, 0.9453946, 1, 0, 0.9490196, 1,
0.9965696, 0.5279052, 3.035111, 1, 0, 0.9411765, 1,
0.9972423, -0.4966619, 0.5628846, 1, 0, 0.9372549, 1,
1.001493, 1.266976, -1.645551, 1, 0, 0.9294118, 1,
1.005546, 0.5365668, 1.943203, 1, 0, 0.9254902, 1,
1.006964, 1.029271, 1.522216, 1, 0, 0.9176471, 1,
1.009765, -2.225652, 1.997898, 1, 0, 0.9137255, 1,
1.018097, 0.2921932, 0.2236331, 1, 0, 0.9058824, 1,
1.024455, -1.584867, 3.12614, 1, 0, 0.9019608, 1,
1.031441, -0.2483571, 2.094489, 1, 0, 0.8941177, 1,
1.032685, -0.3657066, 0.7645052, 1, 0, 0.8862745, 1,
1.039631, -1.044409, 2.069834, 1, 0, 0.8823529, 1,
1.044065, 0.331634, -0.62551, 1, 0, 0.8745098, 1,
1.050311, 2.807095, -0.4881175, 1, 0, 0.8705882, 1,
1.050847, -1.97217, 1.936849, 1, 0, 0.8627451, 1,
1.051974, -0.6247355, 0.6812187, 1, 0, 0.8588235, 1,
1.054425, -0.1999617, 0.4741296, 1, 0, 0.8509804, 1,
1.058483, -0.3375757, 3.192362, 1, 0, 0.8470588, 1,
1.061448, -0.2904758, 2.934617, 1, 0, 0.8392157, 1,
1.06216, 1.416201, 1.464492, 1, 0, 0.8352941, 1,
1.065243, 1.665062, -0.07343502, 1, 0, 0.827451, 1,
1.069409, -0.446651, 2.791489, 1, 0, 0.8235294, 1,
1.078012, 0.2198272, 0.9491408, 1, 0, 0.8156863, 1,
1.078175, -0.7801331, 3.261639, 1, 0, 0.8117647, 1,
1.07877, -0.5739157, 2.619129, 1, 0, 0.8039216, 1,
1.084234, -0.03727589, 1.632414, 1, 0, 0.7960784, 1,
1.097255, -0.2832182, 1.992183, 1, 0, 0.7921569, 1,
1.100889, 0.01383648, -0.324216, 1, 0, 0.7843137, 1,
1.107209, -0.7651488, 3.784944, 1, 0, 0.7803922, 1,
1.108146, -0.186856, 2.605709, 1, 0, 0.772549, 1,
1.109697, -1.870218, 2.199243, 1, 0, 0.7686275, 1,
1.111605, 1.404045, 1.380706, 1, 0, 0.7607843, 1,
1.112778, 2.875776, 0.2728834, 1, 0, 0.7568628, 1,
1.134179, 0.2405046, 0.9473244, 1, 0, 0.7490196, 1,
1.141711, -0.7797986, 0.5236754, 1, 0, 0.7450981, 1,
1.144018, 0.289486, 0.6288542, 1, 0, 0.7372549, 1,
1.14626, 0.2827044, 3.159869, 1, 0, 0.7333333, 1,
1.151178, 0.8581238, 1.938224, 1, 0, 0.7254902, 1,
1.151781, -0.7356351, 2.614802, 1, 0, 0.7215686, 1,
1.157464, 0.2125855, 2.364152, 1, 0, 0.7137255, 1,
1.15914, 2.00872, 1.222803, 1, 0, 0.7098039, 1,
1.160002, 1.628178, 1.736912, 1, 0, 0.7019608, 1,
1.161729, 1.180262, -0.2255005, 1, 0, 0.6941177, 1,
1.165529, -2.209818, 1.640773, 1, 0, 0.6901961, 1,
1.166171, -0.6608803, 3.92232, 1, 0, 0.682353, 1,
1.170697, -0.6089947, 0.1336198, 1, 0, 0.6784314, 1,
1.176293, 0.6184626, 1.974487, 1, 0, 0.6705883, 1,
1.176368, -3.443664, 3.265236, 1, 0, 0.6666667, 1,
1.190569, -0.4362702, 0.3613454, 1, 0, 0.6588235, 1,
1.196761, -0.07557588, 2.306242, 1, 0, 0.654902, 1,
1.201499, 1.111831, -0.9406567, 1, 0, 0.6470588, 1,
1.20498, 0.539197, 2.183891, 1, 0, 0.6431373, 1,
1.206849, 1.066986, 0.9947172, 1, 0, 0.6352941, 1,
1.209497, 0.7429317, 2.649586, 1, 0, 0.6313726, 1,
1.2133, 0.583145, 2.61912, 1, 0, 0.6235294, 1,
1.227279, -2.087266, 2.708846, 1, 0, 0.6196079, 1,
1.239912, 1.138497, 2.008904, 1, 0, 0.6117647, 1,
1.250028, 1.239053, 0.7820122, 1, 0, 0.6078432, 1,
1.250492, -0.7827361, 1.479969, 1, 0, 0.6, 1,
1.256009, -1.533972, 3.695604, 1, 0, 0.5921569, 1,
1.25774, 0.7167396, 0.9810383, 1, 0, 0.5882353, 1,
1.259635, -0.6329014, 1.138572, 1, 0, 0.5803922, 1,
1.26524, 0.4597626, 1.500732, 1, 0, 0.5764706, 1,
1.269513, -0.02754581, -0.06921517, 1, 0, 0.5686275, 1,
1.270913, -1.050219, 1.921662, 1, 0, 0.5647059, 1,
1.277442, -1.002337, 3.114669, 1, 0, 0.5568628, 1,
1.281539, 1.149186, 0.5997652, 1, 0, 0.5529412, 1,
1.283731, 0.8375337, 1.431892, 1, 0, 0.5450981, 1,
1.290108, 0.4120292, 0.1255008, 1, 0, 0.5411765, 1,
1.298936, -0.2426287, 0.8376117, 1, 0, 0.5333334, 1,
1.299396, -0.1294954, 1.092279, 1, 0, 0.5294118, 1,
1.302404, 0.8130069, 1.830318, 1, 0, 0.5215687, 1,
1.304128, 2.313581, 1.611244, 1, 0, 0.5176471, 1,
1.305987, -0.2332479, 1.687294, 1, 0, 0.509804, 1,
1.318406, -0.4963292, 0.3114692, 1, 0, 0.5058824, 1,
1.326524, 0.3125944, 1.75728, 1, 0, 0.4980392, 1,
1.32813, -1.188172, 2.216175, 1, 0, 0.4901961, 1,
1.335621, 0.06099013, 1.136673, 1, 0, 0.4862745, 1,
1.337909, 1.167313, 1.633457, 1, 0, 0.4784314, 1,
1.342895, 0.446828, 2.274228, 1, 0, 0.4745098, 1,
1.35067, 0.0648715, 1.862879, 1, 0, 0.4666667, 1,
1.36405, 0.7470769, 0.5883327, 1, 0, 0.4627451, 1,
1.364051, 0.4752982, 0.7092302, 1, 0, 0.454902, 1,
1.367797, 1.200783, -0.4568829, 1, 0, 0.4509804, 1,
1.371144, 0.3963247, 0.1072287, 1, 0, 0.4431373, 1,
1.377378, -0.4333623, 1.722806, 1, 0, 0.4392157, 1,
1.384878, -1.464023, 2.745863, 1, 0, 0.4313726, 1,
1.38711, -1.60908, 1.804116, 1, 0, 0.427451, 1,
1.389991, -0.4813491, 1.705169, 1, 0, 0.4196078, 1,
1.396666, -0.300751, -0.07521238, 1, 0, 0.4156863, 1,
1.399813, 1.491932, -0.7868962, 1, 0, 0.4078431, 1,
1.416014, 1.492994, 0.1697114, 1, 0, 0.4039216, 1,
1.418728, -0.6606901, 1.335848, 1, 0, 0.3960784, 1,
1.430676, -0.3577344, 0.5448225, 1, 0, 0.3882353, 1,
1.467462, 0.3924245, 1.309537, 1, 0, 0.3843137, 1,
1.471692, -0.8177409, 2.141416, 1, 0, 0.3764706, 1,
1.473789, 0.4932344, 0.59732, 1, 0, 0.372549, 1,
1.491086, -1.558347, 2.655801, 1, 0, 0.3647059, 1,
1.495958, -1.488969, 2.00328, 1, 0, 0.3607843, 1,
1.496265, 0.6882817, 1.034781, 1, 0, 0.3529412, 1,
1.502798, 1.399251, -0.7705042, 1, 0, 0.3490196, 1,
1.509219, 0.1810682, 0.9424351, 1, 0, 0.3411765, 1,
1.537786, -1.059215, 2.49872, 1, 0, 0.3372549, 1,
1.559184, -0.4264221, 0.5205204, 1, 0, 0.3294118, 1,
1.58373, 0.3288572, 0.9712641, 1, 0, 0.3254902, 1,
1.58851, 0.9697759, 0.05645094, 1, 0, 0.3176471, 1,
1.590807, 0.3367743, 2.722136, 1, 0, 0.3137255, 1,
1.593214, -2.065732, 0.8829844, 1, 0, 0.3058824, 1,
1.603063, 0.8332229, 0.4626012, 1, 0, 0.2980392, 1,
1.613049, -2.569594, 2.414503, 1, 0, 0.2941177, 1,
1.627752, -1.507476, 1.882859, 1, 0, 0.2862745, 1,
1.637862, 1.094086, 0.5375293, 1, 0, 0.282353, 1,
1.638122, 0.6821783, 1.823856, 1, 0, 0.2745098, 1,
1.642272, 0.3365835, 1.866513, 1, 0, 0.2705882, 1,
1.64748, -2.021645, 3.233359, 1, 0, 0.2627451, 1,
1.657088, -0.2446236, -0.1105918, 1, 0, 0.2588235, 1,
1.676373, 1.849301, -0.7104245, 1, 0, 0.2509804, 1,
1.678887, 0.9231077, 0.5253724, 1, 0, 0.2470588, 1,
1.687731, -0.3289499, 0.7662221, 1, 0, 0.2392157, 1,
1.704087, 0.6122373, 0.717437, 1, 0, 0.2352941, 1,
1.706892, 0.6097196, 1.272833, 1, 0, 0.227451, 1,
1.71149, 0.2771433, 1.132654, 1, 0, 0.2235294, 1,
1.719861, -0.8393713, 3.090155, 1, 0, 0.2156863, 1,
1.724343, -1.006513, 2.18139, 1, 0, 0.2117647, 1,
1.768341, 0.1603609, 3.385399, 1, 0, 0.2039216, 1,
1.800108, 1.10278, 1.671641, 1, 0, 0.1960784, 1,
1.832713, -1.11144, 3.587289, 1, 0, 0.1921569, 1,
1.856512, -0.8043607, 2.388968, 1, 0, 0.1843137, 1,
1.86259, 1.496471, 0.2442296, 1, 0, 0.1803922, 1,
1.878824, 1.175614, -0.6329644, 1, 0, 0.172549, 1,
1.900182, -2.186947, 2.797301, 1, 0, 0.1686275, 1,
1.904082, -0.07529232, -0.06794565, 1, 0, 0.1607843, 1,
1.938285, -0.2702146, 1.909033, 1, 0, 0.1568628, 1,
1.950961, 0.8213653, 0.5180957, 1, 0, 0.1490196, 1,
1.964481, 0.4876973, 1.523645, 1, 0, 0.145098, 1,
2.040146, -0.5842763, 0.3568311, 1, 0, 0.1372549, 1,
2.067059, 0.03877885, 2.71471, 1, 0, 0.1333333, 1,
2.087548, 0.1255183, 2.000026, 1, 0, 0.1254902, 1,
2.094668, -0.6075589, 2.913916, 1, 0, 0.1215686, 1,
2.095668, -1.065365, 1.168499, 1, 0, 0.1137255, 1,
2.106513, -0.03137398, 0.4895741, 1, 0, 0.1098039, 1,
2.121734, -1.043627, 0.9106472, 1, 0, 0.1019608, 1,
2.130603, 3.011669, 1.617997, 1, 0, 0.09411765, 1,
2.14342, -1.326438, 4.34303, 1, 0, 0.09019608, 1,
2.178709, -1.431391, 2.126504, 1, 0, 0.08235294, 1,
2.183787, 0.6868083, 2.785559, 1, 0, 0.07843138, 1,
2.338984, 1.779571, 0.0999313, 1, 0, 0.07058824, 1,
2.352232, 1.190665, 0.9902104, 1, 0, 0.06666667, 1,
2.371668, 0.581941, 1.522006, 1, 0, 0.05882353, 1,
2.386196, -0.4626702, -0.343045, 1, 0, 0.05490196, 1,
2.451329, -1.422449, 1.32606, 1, 0, 0.04705882, 1,
2.5088, -0.8985714, 1.894239, 1, 0, 0.04313726, 1,
2.5502, 1.129509, 1.03678, 1, 0, 0.03529412, 1,
2.623921, -0.6247496, 1.356436, 1, 0, 0.03137255, 1,
2.863084, 0.6851135, 2.335803, 1, 0, 0.02352941, 1,
2.873487, 0.4722378, 0.2283661, 1, 0, 0.01960784, 1,
2.946838, -0.9409798, 2.257787, 1, 0, 0.01176471, 1,
3.100341, -1.583801, 4.074197, 1, 0, 0.007843138, 1
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
-0.1536136, -4.537843, -6.770631, 0, -0.5, 0.5, 0.5,
-0.1536136, -4.537843, -6.770631, 1, -0.5, 0.5, 0.5,
-0.1536136, -4.537843, -6.770631, 1, 1.5, 0.5, 0.5,
-0.1536136, -4.537843, -6.770631, 0, 1.5, 0.5, 0.5
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
-4.510659, -0.2159978, -6.770631, 0, -0.5, 0.5, 0.5,
-4.510659, -0.2159978, -6.770631, 1, -0.5, 0.5, 0.5,
-4.510659, -0.2159978, -6.770631, 1, 1.5, 0.5, 0.5,
-4.510659, -0.2159978, -6.770631, 0, 1.5, 0.5, 0.5
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
-4.510659, -4.537843, 0.0530138, 0, -0.5, 0.5, 0.5,
-4.510659, -4.537843, 0.0530138, 1, -0.5, 0.5, 0.5,
-4.510659, -4.537843, 0.0530138, 1, 1.5, 0.5, 0.5,
-4.510659, -4.537843, 0.0530138, 0, 1.5, 0.5, 0.5
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
-3, -3.540494, -5.195944,
3, -3.540494, -5.195944,
-3, -3.540494, -5.195944,
-3, -3.706719, -5.458392,
-2, -3.540494, -5.195944,
-2, -3.706719, -5.458392,
-1, -3.540494, -5.195944,
-1, -3.706719, -5.458392,
0, -3.540494, -5.195944,
0, -3.706719, -5.458392,
1, -3.540494, -5.195944,
1, -3.706719, -5.458392,
2, -3.540494, -5.195944,
2, -3.706719, -5.458392,
3, -3.540494, -5.195944,
3, -3.706719, -5.458392
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
-3, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
-3, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
-3, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
-3, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
-2, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
-2, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
-2, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
-2, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
-1, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
-1, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
-1, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
-1, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
0, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
0, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
0, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
0, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
1, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
1, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
1, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
1, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
2, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
2, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
2, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
2, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5,
3, -4.039169, -5.983288, 0, -0.5, 0.5, 0.5,
3, -4.039169, -5.983288, 1, -0.5, 0.5, 0.5,
3, -4.039169, -5.983288, 1, 1.5, 0.5, 0.5,
3, -4.039169, -5.983288, 0, 1.5, 0.5, 0.5
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
-3.505187, -3, -5.195944,
-3.505187, 3, -5.195944,
-3.505187, -3, -5.195944,
-3.672765, -3, -5.458392,
-3.505187, -2, -5.195944,
-3.672765, -2, -5.458392,
-3.505187, -1, -5.195944,
-3.672765, -1, -5.458392,
-3.505187, 0, -5.195944,
-3.672765, 0, -5.458392,
-3.505187, 1, -5.195944,
-3.672765, 1, -5.458392,
-3.505187, 2, -5.195944,
-3.672765, 2, -5.458392,
-3.505187, 3, -5.195944,
-3.672765, 3, -5.458392
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
-4.007923, -3, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, -3, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, -3, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, -3, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, -2, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, -2, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, -2, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, -2, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, -1, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, -1, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, -1, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, -1, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, 0, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, 0, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, 0, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, 0, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, 1, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, 1, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, 1, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, 1, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, 2, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, 2, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, 2, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, 2, -5.983288, 0, 1.5, 0.5, 0.5,
-4.007923, 3, -5.983288, 0, -0.5, 0.5, 0.5,
-4.007923, 3, -5.983288, 1, -0.5, 0.5, 0.5,
-4.007923, 3, -5.983288, 1, 1.5, 0.5, 0.5,
-4.007923, 3, -5.983288, 0, 1.5, 0.5, 0.5
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
-3.505187, -3.540494, -4,
-3.505187, -3.540494, 4,
-3.505187, -3.540494, -4,
-3.672765, -3.706719, -4,
-3.505187, -3.540494, -2,
-3.672765, -3.706719, -2,
-3.505187, -3.540494, 0,
-3.672765, -3.706719, 0,
-3.505187, -3.540494, 2,
-3.672765, -3.706719, 2,
-3.505187, -3.540494, 4,
-3.672765, -3.706719, 4
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
-4.007923, -4.039169, -4, 0, -0.5, 0.5, 0.5,
-4.007923, -4.039169, -4, 1, -0.5, 0.5, 0.5,
-4.007923, -4.039169, -4, 1, 1.5, 0.5, 0.5,
-4.007923, -4.039169, -4, 0, 1.5, 0.5, 0.5,
-4.007923, -4.039169, -2, 0, -0.5, 0.5, 0.5,
-4.007923, -4.039169, -2, 1, -0.5, 0.5, 0.5,
-4.007923, -4.039169, -2, 1, 1.5, 0.5, 0.5,
-4.007923, -4.039169, -2, 0, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 0, 0, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 0, 1, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 0, 1, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 0, 0, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 2, 0, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 2, 1, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 2, 1, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 2, 0, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 4, 0, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 4, 1, -0.5, 0.5, 0.5,
-4.007923, -4.039169, 4, 1, 1.5, 0.5, 0.5,
-4.007923, -4.039169, 4, 0, 1.5, 0.5, 0.5
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
-3.505187, -3.540494, -5.195944,
-3.505187, 3.108499, -5.195944,
-3.505187, -3.540494, 5.301971,
-3.505187, 3.108499, 5.301971,
-3.505187, -3.540494, -5.195944,
-3.505187, -3.540494, 5.301971,
-3.505187, 3.108499, -5.195944,
-3.505187, 3.108499, 5.301971,
-3.505187, -3.540494, -5.195944,
3.19796, -3.540494, -5.195944,
-3.505187, -3.540494, 5.301971,
3.19796, -3.540494, 5.301971,
-3.505187, 3.108499, -5.195944,
3.19796, 3.108499, -5.195944,
-3.505187, 3.108499, 5.301971,
3.19796, 3.108499, 5.301971,
3.19796, -3.540494, -5.195944,
3.19796, 3.108499, -5.195944,
3.19796, -3.540494, 5.301971,
3.19796, 3.108499, 5.301971,
3.19796, -3.540494, -5.195944,
3.19796, -3.540494, 5.301971,
3.19796, 3.108499, -5.195944,
3.19796, 3.108499, 5.301971
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
var radius = 7.539297;
var distance = 33.54319;
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
mvMatrix.translate( 0.1536136, 0.2159978, -0.0530138 );
mvMatrix.scale( 1.216091, 1.225996, 0.7765005 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.54319);
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
Asulam<-read.table("Asulam.xyz")
```

```
## Error in read.table("Asulam.xyz"): no lines available in input
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
-3.407568, -0.06088674, -0.5750549, 0, 0, 1, 1, 1,
-3.204462, 0.4933656, -0.6350417, 1, 0, 0, 1, 1,
-2.653371, -0.7517981, -1.586158, 1, 0, 0, 1, 1,
-2.585185, -0.508236, 0.06994054, 1, 0, 0, 1, 1,
-2.384583, -1.962409, -1.587408, 1, 0, 0, 1, 1,
-2.382372, -1.698973, -3.221075, 1, 0, 0, 1, 1,
-2.355124, 0.04333772, -2.251033, 0, 0, 0, 1, 1,
-2.28303, 0.1645114, -3.454101, 0, 0, 0, 1, 1,
-2.257028, -0.4181766, -1.225949, 0, 0, 0, 1, 1,
-2.251657, -0.9193018, -4.465279, 0, 0, 0, 1, 1,
-2.240299, 0.6088862, -1.884202, 0, 0, 0, 1, 1,
-2.230281, -1.165177, -2.52967, 0, 0, 0, 1, 1,
-2.210909, 1.390878, -1.870918, 0, 0, 0, 1, 1,
-2.168648, -1.013219, -2.563167, 1, 1, 1, 1, 1,
-2.158484, -0.483361, -3.039844, 1, 1, 1, 1, 1,
-2.133686, -0.5238048, -0.9192232, 1, 1, 1, 1, 1,
-2.103539, -0.2364966, -2.827052, 1, 1, 1, 1, 1,
-2.093211, -0.5507683, -1.458216, 1, 1, 1, 1, 1,
-2.080738, 0.10572, -1.731403, 1, 1, 1, 1, 1,
-2.0603, -1.795599, -1.243292, 1, 1, 1, 1, 1,
-2.056016, -0.3050658, -2.302646, 1, 1, 1, 1, 1,
-2.041893, -0.6725699, -1.939908, 1, 1, 1, 1, 1,
-2.021513, -0.1532562, -2.690758, 1, 1, 1, 1, 1,
-1.982992, 0.7087426, -0.1998119, 1, 1, 1, 1, 1,
-1.980265, -1.262522, -0.9267806, 1, 1, 1, 1, 1,
-1.9767, 0.5986909, -1.560591, 1, 1, 1, 1, 1,
-1.940211, -0.3083871, -1.011912, 1, 1, 1, 1, 1,
-1.938073, -0.6911437, -3.141346, 1, 1, 1, 1, 1,
-1.919336, -0.3792062, -1.699254, 0, 0, 1, 1, 1,
-1.910728, 0.135533, -2.326916, 1, 0, 0, 1, 1,
-1.889922, 1.025574, -2.538197, 1, 0, 0, 1, 1,
-1.8684, 1.234496, 0.2277394, 1, 0, 0, 1, 1,
-1.855699, 1.789603, -2.727516, 1, 0, 0, 1, 1,
-1.844754, 0.3529513, -1.055837, 1, 0, 0, 1, 1,
-1.807731, 0.8173831, -1.908462, 0, 0, 0, 1, 1,
-1.773275, 1.927482, -0.6262454, 0, 0, 0, 1, 1,
-1.770187, -0.6745102, -4.15977, 0, 0, 0, 1, 1,
-1.724091, -0.6792945, -0.1827163, 0, 0, 0, 1, 1,
-1.720771, 0.6691839, -0.7289562, 0, 0, 0, 1, 1,
-1.718268, -1.514078, -2.643085, 0, 0, 0, 1, 1,
-1.692888, -0.8729423, -1.929021, 0, 0, 0, 1, 1,
-1.686056, 0.07306778, -1.53598, 1, 1, 1, 1, 1,
-1.683718, -2.03566, -1.678749, 1, 1, 1, 1, 1,
-1.682545, -1.385869, 0.280953, 1, 1, 1, 1, 1,
-1.681431, 2.154317, -1.166264, 1, 1, 1, 1, 1,
-1.654127, -0.05472436, -1.66648, 1, 1, 1, 1, 1,
-1.653947, 0.8954971, 1.513295, 1, 1, 1, 1, 1,
-1.650284, 0.3536613, -1.380919, 1, 1, 1, 1, 1,
-1.644406, -1.918706, -2.323573, 1, 1, 1, 1, 1,
-1.642035, -0.05572965, -2.544887, 1, 1, 1, 1, 1,
-1.638807, 0.4849397, -1.867685, 1, 1, 1, 1, 1,
-1.627101, 0.5013044, -1.58116, 1, 1, 1, 1, 1,
-1.613375, 0.1184175, -1.263054, 1, 1, 1, 1, 1,
-1.612001, -0.4341946, -3.277971, 1, 1, 1, 1, 1,
-1.577161, -0.988206, -2.221884, 1, 1, 1, 1, 1,
-1.561848, 0.4084765, -0.8331257, 1, 1, 1, 1, 1,
-1.550836, -0.5893543, -3.270142, 0, 0, 1, 1, 1,
-1.548689, -0.4825872, -3.342865, 1, 0, 0, 1, 1,
-1.545833, 0.2827467, -1.875589, 1, 0, 0, 1, 1,
-1.540864, 0.2327472, -3.224843, 1, 0, 0, 1, 1,
-1.540452, -1.138877, -2.713583, 1, 0, 0, 1, 1,
-1.525294, -0.868038, -3.534402, 1, 0, 0, 1, 1,
-1.502582, 1.077848, -2.092694, 0, 0, 0, 1, 1,
-1.502227, -0.9732288, -4.043281, 0, 0, 0, 1, 1,
-1.498523, -0.3092916, -2.232052, 0, 0, 0, 1, 1,
-1.497546, -1.619552, -3.051725, 0, 0, 0, 1, 1,
-1.494238, -0.1285842, -0.9551208, 0, 0, 0, 1, 1,
-1.493891, -0.4473278, -2.700555, 0, 0, 0, 1, 1,
-1.484234, -0.2663346, -2.528432, 0, 0, 0, 1, 1,
-1.478319, -0.3451538, -1.699724, 1, 1, 1, 1, 1,
-1.460562, -0.4406329, -2.993358, 1, 1, 1, 1, 1,
-1.460095, -0.6652611, -0.9123521, 1, 1, 1, 1, 1,
-1.45088, -0.7076299, -2.783861, 1, 1, 1, 1, 1,
-1.441908, -0.63977, -2.111079, 1, 1, 1, 1, 1,
-1.439173, 1.761377, 0.1717334, 1, 1, 1, 1, 1,
-1.435791, 0.8053033, -0.06509333, 1, 1, 1, 1, 1,
-1.434936, 0.4201697, -1.306773, 1, 1, 1, 1, 1,
-1.434321, -1.042371, -2.761193, 1, 1, 1, 1, 1,
-1.433013, -1.21765, -2.140883, 1, 1, 1, 1, 1,
-1.419391, 0.575548, -1.878365, 1, 1, 1, 1, 1,
-1.416931, 0.8959662, -1.301463, 1, 1, 1, 1, 1,
-1.41097, -0.9043709, -2.046305, 1, 1, 1, 1, 1,
-1.395925, -0.3386704, -0.4020091, 1, 1, 1, 1, 1,
-1.390366, 0.8011389, -2.413856, 1, 1, 1, 1, 1,
-1.378936, -2.419818, -3.333568, 0, 0, 1, 1, 1,
-1.378136, 0.8567632, -1.09226, 1, 0, 0, 1, 1,
-1.377603, -1.203488, -1.392966, 1, 0, 0, 1, 1,
-1.372222, 0.7466159, -2.346305, 1, 0, 0, 1, 1,
-1.369595, -2.008636, -2.0265, 1, 0, 0, 1, 1,
-1.363974, 0.267553, -1.44401, 1, 0, 0, 1, 1,
-1.359891, 0.298458, -1.453258, 0, 0, 0, 1, 1,
-1.355784, 0.2837327, -2.320802, 0, 0, 0, 1, 1,
-1.354428, 1.328236, -1.533828, 0, 0, 0, 1, 1,
-1.350651, 0.6371786, -0.4997683, 0, 0, 0, 1, 1,
-1.350595, 0.1933185, -1.374948, 0, 0, 0, 1, 1,
-1.349889, -0.8265643, -1.903455, 0, 0, 0, 1, 1,
-1.34712, -1.573149, -1.128834, 0, 0, 0, 1, 1,
-1.332738, 0.2121607, -2.391431, 1, 1, 1, 1, 1,
-1.328575, -0.09183066, -3.195919, 1, 1, 1, 1, 1,
-1.320243, -2.054476, -3.419807, 1, 1, 1, 1, 1,
-1.318553, 0.474657, -0.922506, 1, 1, 1, 1, 1,
-1.317959, -0.4137453, -2.403453, 1, 1, 1, 1, 1,
-1.304472, -1.55316, -1.745232, 1, 1, 1, 1, 1,
-1.302054, -0.2798957, -0.6507891, 1, 1, 1, 1, 1,
-1.30023, 1.06952, 0.6938585, 1, 1, 1, 1, 1,
-1.294118, -1.928241, -3.153722, 1, 1, 1, 1, 1,
-1.29249, 0.9480399, -1.490499, 1, 1, 1, 1, 1,
-1.280375, 0.844461, -1.729079, 1, 1, 1, 1, 1,
-1.275924, -0.01062318, -1.669395, 1, 1, 1, 1, 1,
-1.269644, 0.303577, -0.7745699, 1, 1, 1, 1, 1,
-1.257929, -1.168304, -1.86404, 1, 1, 1, 1, 1,
-1.256367, 1.180697, 0.2055508, 1, 1, 1, 1, 1,
-1.254739, 0.8851379, -1.558375, 0, 0, 1, 1, 1,
-1.252709, -0.2980156, -1.010637, 1, 0, 0, 1, 1,
-1.236961, -0.00288279, -1.498115, 1, 0, 0, 1, 1,
-1.223851, -0.02996502, -2.177522, 1, 0, 0, 1, 1,
-1.22286, -1.147894, -3.759519, 1, 0, 0, 1, 1,
-1.212772, 0.07033008, -0.7264441, 1, 0, 0, 1, 1,
-1.21187, 0.3386858, -2.519375, 0, 0, 0, 1, 1,
-1.208223, -0.4804882, -1.490102, 0, 0, 0, 1, 1,
-1.198571, 0.2583956, -1.231584, 0, 0, 0, 1, 1,
-1.195996, -1.860649, -1.746273, 0, 0, 0, 1, 1,
-1.195447, 0.8438929, -0.4784658, 0, 0, 0, 1, 1,
-1.19225, 0.1011884, -1.118384, 0, 0, 0, 1, 1,
-1.180838, -0.4138477, -1.263885, 0, 0, 0, 1, 1,
-1.180225, 1.093521, -1.816002, 1, 1, 1, 1, 1,
-1.176896, -0.9126723, -1.053809, 1, 1, 1, 1, 1,
-1.175797, -1.230519, -3.259593, 1, 1, 1, 1, 1,
-1.174813, 0.664255, -1.792864, 1, 1, 1, 1, 1,
-1.171296, -0.3985478, -1.96011, 1, 1, 1, 1, 1,
-1.170056, 1.312272, -2.002912, 1, 1, 1, 1, 1,
-1.160034, 1.010594, 0.8312553, 1, 1, 1, 1, 1,
-1.158098, -0.5137288, -1.183246, 1, 1, 1, 1, 1,
-1.155316, 0.1926779, -1.461531, 1, 1, 1, 1, 1,
-1.1396, -1.594864, -3.80298, 1, 1, 1, 1, 1,
-1.136099, 0.3055654, -0.7790501, 1, 1, 1, 1, 1,
-1.128624, 0.760369, -1.344313, 1, 1, 1, 1, 1,
-1.124421, -0.1981505, -1.366308, 1, 1, 1, 1, 1,
-1.114417, -0.2057301, -0.9156708, 1, 1, 1, 1, 1,
-1.101426, 0.601849, -1.145458, 1, 1, 1, 1, 1,
-1.094009, -1.114149, -3.056202, 0, 0, 1, 1, 1,
-1.093101, -0.5164475, -0.5695672, 1, 0, 0, 1, 1,
-1.092049, -0.7436481, -3.001812, 1, 0, 0, 1, 1,
-1.074889, -0.05640415, -2.15783, 1, 0, 0, 1, 1,
-1.07172, 0.2979349, -1.187936, 1, 0, 0, 1, 1,
-1.069747, 1.228648, -0.804821, 1, 0, 0, 1, 1,
-1.069282, 1.230184, -2.033449, 0, 0, 0, 1, 1,
-1.065508, -0.08830407, -0.2566733, 0, 0, 0, 1, 1,
-1.062064, 0.473908, -0.4834656, 0, 0, 0, 1, 1,
-1.056542, -0.342955, -3.26767, 0, 0, 0, 1, 1,
-1.030522, -0.9386147, -1.961529, 0, 0, 0, 1, 1,
-1.018522, -1.312286, -1.523483, 0, 0, 0, 1, 1,
-1.016196, 1.084419, -1.95614, 0, 0, 0, 1, 1,
-1.007499, 0.720188, -3.165696, 1, 1, 1, 1, 1,
-1.005512, -1.973608, -3.388483, 1, 1, 1, 1, 1,
-1.003435, 0.4285045, -1.702512, 1, 1, 1, 1, 1,
-0.9946492, 0.1829342, -1.194025, 1, 1, 1, 1, 1,
-0.9923042, -1.168443, -2.303154, 1, 1, 1, 1, 1,
-0.9883062, 0.3355437, -2.301926, 1, 1, 1, 1, 1,
-0.9873706, -0.4899359, -2.136111, 1, 1, 1, 1, 1,
-0.9859532, -0.148823, -2.935904, 1, 1, 1, 1, 1,
-0.9843011, 1.480942, -1.485722, 1, 1, 1, 1, 1,
-0.9755974, -0.5097916, -1.016619, 1, 1, 1, 1, 1,
-0.9739286, 0.4717112, -0.3830691, 1, 1, 1, 1, 1,
-0.9719268, 0.3134751, -1.332482, 1, 1, 1, 1, 1,
-0.9675908, 1.154719, 0.8532842, 1, 1, 1, 1, 1,
-0.9538699, -1.066385, -1.914851, 1, 1, 1, 1, 1,
-0.9366294, -1.616726, -2.879995, 1, 1, 1, 1, 1,
-0.9335197, 0.297094, -1.043888, 0, 0, 1, 1, 1,
-0.9334638, -0.332126, -1.116032, 1, 0, 0, 1, 1,
-0.9313245, -1.172738, -1.397713, 1, 0, 0, 1, 1,
-0.9295275, -0.4643219, -2.626589, 1, 0, 0, 1, 1,
-0.9281703, -0.2598892, -1.726749, 1, 0, 0, 1, 1,
-0.9232258, -0.5186153, -2.511696, 1, 0, 0, 1, 1,
-0.9141623, 0.108854, -1.441608, 0, 0, 0, 1, 1,
-0.90982, -1.208664, -2.829467, 0, 0, 0, 1, 1,
-0.9002321, -1.104834, -2.682112, 0, 0, 0, 1, 1,
-0.8941057, 0.5474133, -0.9869412, 0, 0, 0, 1, 1,
-0.8931631, -0.4598854, -3.353696, 0, 0, 0, 1, 1,
-0.8914794, 0.5433962, -1.827007, 0, 0, 0, 1, 1,
-0.8894354, -0.8730788, -4.177278, 0, 0, 0, 1, 1,
-0.8879054, -0.4673734, -1.29398, 1, 1, 1, 1, 1,
-0.8809528, 0.6864914, -1.132857, 1, 1, 1, 1, 1,
-0.8753602, 0.6011049, -0.7549015, 1, 1, 1, 1, 1,
-0.873061, -0.4454626, -1.69552, 1, 1, 1, 1, 1,
-0.869248, 0.2858054, -1.672627, 1, 1, 1, 1, 1,
-0.8534167, 0.2764161, -2.37072, 1, 1, 1, 1, 1,
-0.8514381, 0.4501862, 0.1013292, 1, 1, 1, 1, 1,
-0.8455694, 0.4817186, -1.045156, 1, 1, 1, 1, 1,
-0.8446189, 1.161393, 0.8877446, 1, 1, 1, 1, 1,
-0.8407161, -0.2620026, 0.4979722, 1, 1, 1, 1, 1,
-0.8347616, -0.8185036, -4.393433, 1, 1, 1, 1, 1,
-0.8339462, 0.721888, -1.217653, 1, 1, 1, 1, 1,
-0.8327935, 0.2158861, -1.420039, 1, 1, 1, 1, 1,
-0.8233498, 0.2924727, -3.18543, 1, 1, 1, 1, 1,
-0.8201102, 0.7548768, -1.994327, 1, 1, 1, 1, 1,
-0.8194914, -2.698452, -3.104624, 0, 0, 1, 1, 1,
-0.8047025, 0.3040298, -0.6014361, 1, 0, 0, 1, 1,
-0.8019791, -0.4838319, -3.120158, 1, 0, 0, 1, 1,
-0.8007774, -0.2888354, -2.737299, 1, 0, 0, 1, 1,
-0.7962902, 0.9527875, -1.426581, 1, 0, 0, 1, 1,
-0.7955256, -0.6283863, -0.9752578, 1, 0, 0, 1, 1,
-0.7887239, -1.434625, -1.320444, 0, 0, 0, 1, 1,
-0.7851954, 0.03129565, -2.315163, 0, 0, 0, 1, 1,
-0.7835347, -0.1491371, -2.888172, 0, 0, 0, 1, 1,
-0.7806485, -0.7045782, -1.430377, 0, 0, 0, 1, 1,
-0.7805012, -0.6230198, -1.423687, 0, 0, 0, 1, 1,
-0.761332, 0.8246117, 0.07385454, 0, 0, 0, 1, 1,
-0.7550054, -0.2884413, -3.247236, 0, 0, 0, 1, 1,
-0.7407123, -1.531963, -3.402141, 1, 1, 1, 1, 1,
-0.731504, -1.791783, -4.15285, 1, 1, 1, 1, 1,
-0.7313577, 1.645051, 0.6543778, 1, 1, 1, 1, 1,
-0.7291283, -1.130389, -2.708409, 1, 1, 1, 1, 1,
-0.7253008, 1.085976, -0.07213319, 1, 1, 1, 1, 1,
-0.723346, -0.3642158, -0.7713855, 1, 1, 1, 1, 1,
-0.7225003, 0.04471606, -2.229115, 1, 1, 1, 1, 1,
-0.7102785, 1.192947, 0.2607224, 1, 1, 1, 1, 1,
-0.7040756, 1.579147, -1.012187, 1, 1, 1, 1, 1,
-0.7024296, -1.569273, -2.197444, 1, 1, 1, 1, 1,
-0.6983631, -0.7313608, -3.960381, 1, 1, 1, 1, 1,
-0.6961918, 0.1880689, -0.9807186, 1, 1, 1, 1, 1,
-0.690452, 0.7668712, -0.04020949, 1, 1, 1, 1, 1,
-0.6876078, 1.27618, -0.581772, 1, 1, 1, 1, 1,
-0.6856784, -0.08442947, -1.066908, 1, 1, 1, 1, 1,
-0.6808285, -0.3446737, -2.733482, 0, 0, 1, 1, 1,
-0.674366, 0.672992, -0.3810941, 1, 0, 0, 1, 1,
-0.6719981, 1.101608, -1.03282, 1, 0, 0, 1, 1,
-0.6699227, -0.9482818, -2.413243, 1, 0, 0, 1, 1,
-0.6612608, 0.5395025, -0.07068481, 1, 0, 0, 1, 1,
-0.6608065, -0.5961848, -3.726331, 1, 0, 0, 1, 1,
-0.6567362, -0.3700933, -1.346932, 0, 0, 0, 1, 1,
-0.6557806, -0.3495441, -2.776626, 0, 0, 0, 1, 1,
-0.6517338, 1.864533, -0.7619503, 0, 0, 0, 1, 1,
-0.6503754, -0.2794946, -3.149821, 0, 0, 0, 1, 1,
-0.647391, 0.9549804, -0.9899689, 0, 0, 0, 1, 1,
-0.6423516, -0.601828, -3.058315, 0, 0, 0, 1, 1,
-0.639401, 0.9763258, -0.3048971, 0, 0, 0, 1, 1,
-0.6392567, 1.054519, -1.065941, 1, 1, 1, 1, 1,
-0.6387304, -0.4858814, -1.800735, 1, 1, 1, 1, 1,
-0.6352165, -2.391087, -3.712848, 1, 1, 1, 1, 1,
-0.6347271, -0.4667066, -1.478652, 1, 1, 1, 1, 1,
-0.6287327, 0.6608308, -1.317573, 1, 1, 1, 1, 1,
-0.6274356, 0.005362769, 0.2205663, 1, 1, 1, 1, 1,
-0.6260716, 0.6149987, -2.171358, 1, 1, 1, 1, 1,
-0.6249319, 1.030238, -0.4423676, 1, 1, 1, 1, 1,
-0.6248377, -1.065595, -2.600844, 1, 1, 1, 1, 1,
-0.6223384, -0.8388109, -2.318185, 1, 1, 1, 1, 1,
-0.6134802, 0.2564237, -2.193651, 1, 1, 1, 1, 1,
-0.612909, -0.6680863, -2.001939, 1, 1, 1, 1, 1,
-0.6124173, 0.2969319, -0.968553, 1, 1, 1, 1, 1,
-0.611632, -0.3859712, -3.610788, 1, 1, 1, 1, 1,
-0.6116261, 0.03512238, 0.3518769, 1, 1, 1, 1, 1,
-0.6087484, -0.6259798, -2.069563, 0, 0, 1, 1, 1,
-0.6072988, 0.1291523, -0.97317, 1, 0, 0, 1, 1,
-0.6065766, 0.0322267, -1.097877, 1, 0, 0, 1, 1,
-0.6057722, -0.4484084, -1.692277, 1, 0, 0, 1, 1,
-0.605637, 0.1918614, -1.846439, 1, 0, 0, 1, 1,
-0.6005613, -0.1434837, -1.56382, 1, 0, 0, 1, 1,
-0.6000521, -1.826364, -3.809642, 0, 0, 0, 1, 1,
-0.5990238, -0.02944596, -2.544311, 0, 0, 0, 1, 1,
-0.5972653, 0.5419683, 0.2166592, 0, 0, 0, 1, 1,
-0.5909089, -1.376566, -2.806659, 0, 0, 0, 1, 1,
-0.5882074, 0.2997517, -2.652653, 0, 0, 0, 1, 1,
-0.5849839, 1.252086, 0.9353647, 0, 0, 0, 1, 1,
-0.5775226, 0.342059, -0.8252693, 0, 0, 0, 1, 1,
-0.5768064, -0.09681817, -1.257596, 1, 1, 1, 1, 1,
-0.5695597, 1.29505, -0.007952468, 1, 1, 1, 1, 1,
-0.5683832, -1.478164, -2.380315, 1, 1, 1, 1, 1,
-0.567145, -1.095619, -3.895346, 1, 1, 1, 1, 1,
-0.5620835, -0.02401887, -2.592876, 1, 1, 1, 1, 1,
-0.5585802, 1.766774, -0.09500485, 1, 1, 1, 1, 1,
-0.5566024, -0.3401112, -2.607596, 1, 1, 1, 1, 1,
-0.5492362, 1.082931, -0.5463598, 1, 1, 1, 1, 1,
-0.5489523, 1.25524, -1.217739, 1, 1, 1, 1, 1,
-0.5476876, 0.02313861, -2.318721, 1, 1, 1, 1, 1,
-0.5468194, 0.1623622, -0.7538235, 1, 1, 1, 1, 1,
-0.5467579, -0.2868507, -2.228221, 1, 1, 1, 1, 1,
-0.5418201, -1.1996, -1.830135, 1, 1, 1, 1, 1,
-0.5405021, 1.724827, -0.7896789, 1, 1, 1, 1, 1,
-0.53979, -0.2247891, -1.722482, 1, 1, 1, 1, 1,
-0.5383378, -1.554754, -2.565041, 0, 0, 1, 1, 1,
-0.5355982, 1.415067, 0.456502, 1, 0, 0, 1, 1,
-0.5314975, -2.214731, -2.961802, 1, 0, 0, 1, 1,
-0.528712, 0.3055978, -1.019239, 1, 0, 0, 1, 1,
-0.5247267, -1.575737, -1.956274, 1, 0, 0, 1, 1,
-0.5246096, -2.19504, -4.121621, 1, 0, 0, 1, 1,
-0.5198617, -0.2616325, -3.042833, 0, 0, 0, 1, 1,
-0.515968, -0.92861, -1.566003, 0, 0, 0, 1, 1,
-0.5153829, -0.5022177, -3.144268, 0, 0, 0, 1, 1,
-0.514232, 0.1346225, 0.3301282, 0, 0, 0, 1, 1,
-0.5138177, -0.6813805, -1.581423, 0, 0, 0, 1, 1,
-0.5103562, -0.09379517, -2.089145, 0, 0, 0, 1, 1,
-0.5059244, 0.2907121, -1.340236, 0, 0, 0, 1, 1,
-0.5058924, -0.2960349, -1.551555, 1, 1, 1, 1, 1,
-0.5005872, 0.5092444, -2.582523, 1, 1, 1, 1, 1,
-0.4972147, -0.4617064, -1.544197, 1, 1, 1, 1, 1,
-0.4952425, -0.457399, -2.526146, 1, 1, 1, 1, 1,
-0.4941868, 1.019585, -1.101262, 1, 1, 1, 1, 1,
-0.4895965, 0.6471532, -0.8477803, 1, 1, 1, 1, 1,
-0.488433, -0.80369, -4.082467, 1, 1, 1, 1, 1,
-0.487639, -0.7881819, -2.848119, 1, 1, 1, 1, 1,
-0.4860282, 1.429529, -0.747023, 1, 1, 1, 1, 1,
-0.4853928, -1.119872, -1.959605, 1, 1, 1, 1, 1,
-0.4842063, -0.5784464, -4.169981, 1, 1, 1, 1, 1,
-0.4841621, 0.1383305, -2.030699, 1, 1, 1, 1, 1,
-0.4790002, 0.1340963, -1.183884, 1, 1, 1, 1, 1,
-0.4778816, -0.6687667, -3.416335, 1, 1, 1, 1, 1,
-0.4761827, 0.2204521, -1.928155, 1, 1, 1, 1, 1,
-0.4757158, 0.541303, -0.06551103, 0, 0, 1, 1, 1,
-0.4729084, -0.06150362, -1.457781, 1, 0, 0, 1, 1,
-0.4725281, 0.331139, -2.393082, 1, 0, 0, 1, 1,
-0.4704721, 0.0886329, -0.2274647, 1, 0, 0, 1, 1,
-0.4700906, -0.857632, -2.641044, 1, 0, 0, 1, 1,
-0.4688053, 1.875662, 0.4745795, 1, 0, 0, 1, 1,
-0.4677972, 0.4484981, -0.9246078, 0, 0, 0, 1, 1,
-0.4655722, 0.8932946, -3.019886, 0, 0, 0, 1, 1,
-0.4650604, -0.8214782, -0.3900288, 0, 0, 0, 1, 1,
-0.4582407, -0.9852206, -3.250403, 0, 0, 0, 1, 1,
-0.4548527, -0.1047331, -1.617848, 0, 0, 0, 1, 1,
-0.4448453, 0.4052407, -1.300471, 0, 0, 0, 1, 1,
-0.439129, 0.2229052, -2.018727, 0, 0, 0, 1, 1,
-0.4390849, 0.8097267, -1.796541, 1, 1, 1, 1, 1,
-0.4383819, 0.2223811, 0.5330876, 1, 1, 1, 1, 1,
-0.4370479, 0.5102418, -1.88643, 1, 1, 1, 1, 1,
-0.4369426, 0.7769479, 0.0327662, 1, 1, 1, 1, 1,
-0.4166159, 1.024704, -0.3565773, 1, 1, 1, 1, 1,
-0.4162368, 1.802498, -2.022581, 1, 1, 1, 1, 1,
-0.4157824, -0.7269964, -4.148749, 1, 1, 1, 1, 1,
-0.4151416, 0.7100896, -1.298515, 1, 1, 1, 1, 1,
-0.4149024, 0.8180242, -1.027007, 1, 1, 1, 1, 1,
-0.414654, -1.623058, -3.022809, 1, 1, 1, 1, 1,
-0.4120678, -1.41202, -3.747183, 1, 1, 1, 1, 1,
-0.4004797, 0.9263996, -2.233919, 1, 1, 1, 1, 1,
-0.3985784, -1.598228, -5.043062, 1, 1, 1, 1, 1,
-0.3968456, -0.7083397, -3.886972, 1, 1, 1, 1, 1,
-0.3943664, -0.3584775, -1.795961, 1, 1, 1, 1, 1,
-0.3927699, -0.6241133, -1.91909, 0, 0, 1, 1, 1,
-0.3871776, -1.865637, -3.218757, 1, 0, 0, 1, 1,
-0.3797323, -0.899771, -3.613643, 1, 0, 0, 1, 1,
-0.3742498, 0.2332999, 0.8637924, 1, 0, 0, 1, 1,
-0.3710174, 1.095655, -1.382818, 1, 0, 0, 1, 1,
-0.3661132, 0.1912943, -1.230132, 1, 0, 0, 1, 1,
-0.3611123, -0.7144381, -2.941724, 0, 0, 0, 1, 1,
-0.3560168, -0.8892274, -1.631485, 0, 0, 0, 1, 1,
-0.3558172, -1.605084, -2.897315, 0, 0, 0, 1, 1,
-0.3418933, -0.8881795, -2.578038, 0, 0, 0, 1, 1,
-0.3405367, 0.03686053, -1.329844, 0, 0, 0, 1, 1,
-0.339828, -0.2781809, -1.401053, 0, 0, 0, 1, 1,
-0.3364697, 0.3157565, -2.179088, 0, 0, 0, 1, 1,
-0.3292037, 0.1919836, -2.975088, 1, 1, 1, 1, 1,
-0.3288457, -1.183963, -2.322328, 1, 1, 1, 1, 1,
-0.3259646, -0.2468868, -1.235079, 1, 1, 1, 1, 1,
-0.3241141, -0.9786659, -3.587395, 1, 1, 1, 1, 1,
-0.3188681, -0.9469776, -3.208441, 1, 1, 1, 1, 1,
-0.3182904, 1.886443, 1.188303, 1, 1, 1, 1, 1,
-0.3170934, -2.225961, -1.251092, 1, 1, 1, 1, 1,
-0.3155511, 0.07777181, 0.7438409, 1, 1, 1, 1, 1,
-0.3150449, 0.602044, -0.5340265, 1, 1, 1, 1, 1,
-0.3120269, 0.538184, -1.986571, 1, 1, 1, 1, 1,
-0.2897209, 1.242461, 0.5091482, 1, 1, 1, 1, 1,
-0.2883485, 1.02087, 0.8860949, 1, 1, 1, 1, 1,
-0.286469, 1.740562, -1.449566, 1, 1, 1, 1, 1,
-0.286332, 1.018008, 0.4837423, 1, 1, 1, 1, 1,
-0.2841216, 0.1582714, -0.4369541, 1, 1, 1, 1, 1,
-0.282509, -0.591528, -3.510967, 0, 0, 1, 1, 1,
-0.2788097, -0.6645402, -1.995099, 1, 0, 0, 1, 1,
-0.2754759, -0.0640825, -2.630213, 1, 0, 0, 1, 1,
-0.2727919, -1.153119, -1.092057, 1, 0, 0, 1, 1,
-0.2722219, -0.1169696, -0.9771847, 1, 0, 0, 1, 1,
-0.270791, -0.5920773, -1.067272, 1, 0, 0, 1, 1,
-0.2689977, -0.4407573, -1.698226, 0, 0, 0, 1, 1,
-0.2644825, -1.696961, -2.737462, 0, 0, 0, 1, 1,
-0.2633678, 0.5322956, -0.6180085, 0, 0, 0, 1, 1,
-0.2546689, -0.4419653, -3.187676, 0, 0, 0, 1, 1,
-0.2536999, -1.754424, -4.10302, 0, 0, 0, 1, 1,
-0.2525449, -0.9544206, -4.540075, 0, 0, 0, 1, 1,
-0.2505757, -0.04814741, -1.153462, 0, 0, 0, 1, 1,
-0.2468683, -0.2094849, -2.338997, 1, 1, 1, 1, 1,
-0.244548, 0.881097, 0.1856782, 1, 1, 1, 1, 1,
-0.2419766, -2.175106, -2.271943, 1, 1, 1, 1, 1,
-0.2415524, -0.2646366, -2.953547, 1, 1, 1, 1, 1,
-0.2317759, -0.9648764, -2.672515, 1, 1, 1, 1, 1,
-0.2288679, 0.8105954, 1.064388, 1, 1, 1, 1, 1,
-0.2269144, -0.1133665, -3.469754, 1, 1, 1, 1, 1,
-0.2242517, -0.778173, -2.276673, 1, 1, 1, 1, 1,
-0.2172129, 0.2582677, -0.5897365, 1, 1, 1, 1, 1,
-0.2167158, 0.5166927, -1.216774, 1, 1, 1, 1, 1,
-0.2158218, -0.5171134, -2.973784, 1, 1, 1, 1, 1,
-0.2101225, -1.157274, -3.385995, 1, 1, 1, 1, 1,
-0.209905, 0.8541605, -1.838686, 1, 1, 1, 1, 1,
-0.20396, -1.232299, -3.794952, 1, 1, 1, 1, 1,
-0.1975212, -1.119998, -4.065533, 1, 1, 1, 1, 1,
-0.195905, -0.6040703, -1.638507, 0, 0, 1, 1, 1,
-0.1898145, 0.08877408, -0.6025304, 1, 0, 0, 1, 1,
-0.1813331, 0.8403926, 0.1422167, 1, 0, 0, 1, 1,
-0.1712358, 1.187892, -1.055763, 1, 0, 0, 1, 1,
-0.1690418, 0.8453809, -1.867988, 1, 0, 0, 1, 1,
-0.1627713, -0.05514392, -2.99203, 1, 0, 0, 1, 1,
-0.1563004, -0.3929508, -2.246973, 0, 0, 0, 1, 1,
-0.1562192, 2.071412, -0.07621914, 0, 0, 0, 1, 1,
-0.1553402, 0.1722151, -2.001467, 0, 0, 0, 1, 1,
-0.1542366, 0.5470223, 1.436055, 0, 0, 0, 1, 1,
-0.1531291, -1.945097, -2.946414, 0, 0, 0, 1, 1,
-0.1525079, -0.9157872, -2.458905, 0, 0, 0, 1, 1,
-0.1518892, 0.4182094, 0.9524562, 0, 0, 0, 1, 1,
-0.1495941, 1.968348, -0.8700318, 1, 1, 1, 1, 1,
-0.1492156, 0.3108731, -1.020983, 1, 1, 1, 1, 1,
-0.1490061, -2.10358, -3.147143, 1, 1, 1, 1, 1,
-0.1480524, -0.3154749, -3.476871, 1, 1, 1, 1, 1,
-0.1430652, -0.5280252, -2.282154, 1, 1, 1, 1, 1,
-0.1351831, 0.2057479, -1.382334, 1, 1, 1, 1, 1,
-0.1310205, -0.6324124, -4.837898, 1, 1, 1, 1, 1,
-0.1307271, 0.3294806, -1.438216, 1, 1, 1, 1, 1,
-0.1283107, -0.121435, -1.84923, 1, 1, 1, 1, 1,
-0.127839, -0.2555242, -2.269594, 1, 1, 1, 1, 1,
-0.126093, 0.5122945, -0.9869333, 1, 1, 1, 1, 1,
-0.1253481, 0.6428846, -0.6374555, 1, 1, 1, 1, 1,
-0.1232915, 1.21352, -0.9694564, 1, 1, 1, 1, 1,
-0.1220656, 0.9642809, 1.450347, 1, 1, 1, 1, 1,
-0.1206362, -1.340445, -3.456465, 1, 1, 1, 1, 1,
-0.116407, 0.8511625, -1.075157, 0, 0, 1, 1, 1,
-0.1124279, 0.7918252, -0.7608999, 1, 0, 0, 1, 1,
-0.1090718, 0.6918848, -0.7834676, 1, 0, 0, 1, 1,
-0.1079759, 0.3881747, 0.2735351, 1, 0, 0, 1, 1,
-0.1051375, -0.7213712, -3.489423, 1, 0, 0, 1, 1,
-0.1042542, 0.64978, 0.766188, 1, 0, 0, 1, 1,
-0.1039861, -0.05417879, -2.863324, 0, 0, 0, 1, 1,
-0.103543, 1.08265, -1.409293, 0, 0, 0, 1, 1,
-0.1008559, 0.5824627, -0.1067, 0, 0, 0, 1, 1,
-0.09673437, -0.3552961, -4.598412, 0, 0, 0, 1, 1,
-0.09468999, 0.6979257, 0.5548405, 0, 0, 0, 1, 1,
-0.09399135, 1.880866, -1.391386, 0, 0, 0, 1, 1,
-0.08913092, -0.2257392, -1.769901, 0, 0, 0, 1, 1,
-0.08550194, -0.2846264, -4.294336, 1, 1, 1, 1, 1,
-0.08376393, -1.190004, -4.753011, 1, 1, 1, 1, 1,
-0.08268779, -0.4813294, -3.269851, 1, 1, 1, 1, 1,
-0.0803683, 0.6839157, -1.352678, 1, 1, 1, 1, 1,
-0.06855077, 0.955171, 0.3264538, 1, 1, 1, 1, 1,
-0.05996837, -0.593649, -3.86203, 1, 1, 1, 1, 1,
-0.05951859, -0.9034481, -2.197167, 1, 1, 1, 1, 1,
-0.05861046, -0.02451007, -2.600701, 1, 1, 1, 1, 1,
-0.05723223, 1.591893, -0.2098234, 1, 1, 1, 1, 1,
-0.05524856, -0.6835607, -3.533763, 1, 1, 1, 1, 1,
-0.04865883, 0.618473, -0.04044256, 1, 1, 1, 1, 1,
-0.04775002, -0.5408863, -1.757495, 1, 1, 1, 1, 1,
-0.04748109, -0.2780372, -1.690946, 1, 1, 1, 1, 1,
-0.04597764, -0.9770638, -2.311834, 1, 1, 1, 1, 1,
-0.04535035, -0.08412063, -2.587979, 1, 1, 1, 1, 1,
-0.04303694, 1.379763, -0.3613223, 0, 0, 1, 1, 1,
-0.04286286, 0.8420025, -0.7448013, 1, 0, 0, 1, 1,
-0.04205425, -0.5874619, -1.99156, 1, 0, 0, 1, 1,
-0.04181307, -0.6256288, -3.310813, 1, 0, 0, 1, 1,
-0.04006061, 1.523401, -0.7278652, 1, 0, 0, 1, 1,
-0.03903829, 1.162674, 0.183061, 1, 0, 0, 1, 1,
-0.03302602, -0.4474202, -3.529546, 0, 0, 0, 1, 1,
-0.03090996, -0.8081952, -3.148326, 0, 0, 0, 1, 1,
-0.02427855, -0.7742742, -4.469325, 0, 0, 0, 1, 1,
-0.01804634, -0.972799, -3.130485, 0, 0, 0, 1, 1,
-0.01737512, -0.3142792, -4.205922, 0, 0, 0, 1, 1,
-0.01622871, 0.7343076, 0.8512785, 0, 0, 0, 1, 1,
-0.01617978, -0.2734251, -4.590402, 0, 0, 0, 1, 1,
-0.01466051, 0.1220108, 0.9566416, 1, 1, 1, 1, 1,
-0.011672, 1.090498, -1.572608, 1, 1, 1, 1, 1,
-0.01119313, -1.184479, -4.144578, 1, 1, 1, 1, 1,
-0.01084109, -0.8418455, -3.256424, 1, 1, 1, 1, 1,
-0.006520285, 1.031074, -2.42327, 1, 1, 1, 1, 1,
-0.003628407, -1.501758, -1.807005, 1, 1, 1, 1, 1,
-0.0005650405, -1.818969, -4.037872, 1, 1, 1, 1, 1,
0.001684529, -0.2932715, 3.334223, 1, 1, 1, 1, 1,
0.002683416, -0.5220288, 3.174885, 1, 1, 1, 1, 1,
0.003659703, -0.4994879, 3.533324, 1, 1, 1, 1, 1,
0.008457885, -0.7555966, 3.326656, 1, 1, 1, 1, 1,
0.01084794, 0.6888863, -0.4334628, 1, 1, 1, 1, 1,
0.0138775, 0.7490163, -0.05539444, 1, 1, 1, 1, 1,
0.01861252, -0.5047405, 2.85789, 1, 1, 1, 1, 1,
0.01912697, 1.69158, 1.229399, 1, 1, 1, 1, 1,
0.02053323, 1.151366, -0.5687402, 0, 0, 1, 1, 1,
0.02062454, 0.8553683, -0.8417549, 1, 0, 0, 1, 1,
0.02106786, -1.223206, 3.099688, 1, 0, 0, 1, 1,
0.0213887, 0.9612049, 0.0436504, 1, 0, 0, 1, 1,
0.02189747, -1.619735, 2.970881, 1, 0, 0, 1, 1,
0.02276206, 0.5187598, 1.082686, 1, 0, 0, 1, 1,
0.02790535, -0.5762777, 3.262067, 0, 0, 0, 1, 1,
0.02872222, -0.2002368, 3.545422, 0, 0, 0, 1, 1,
0.03394093, -0.4689129, 2.612566, 0, 0, 0, 1, 1,
0.03458649, -0.6186543, 2.19238, 0, 0, 0, 1, 1,
0.03478614, -0.3763508, 3.210802, 0, 0, 0, 1, 1,
0.0380665, 0.4315475, -0.744869, 0, 0, 0, 1, 1,
0.04013016, -1.596124, 3.174514, 0, 0, 0, 1, 1,
0.0404536, 1.252785, -1.662107, 1, 1, 1, 1, 1,
0.04280761, 0.2187123, 0.4970536, 1, 1, 1, 1, 1,
0.0438486, 1.505923, 0.7288201, 1, 1, 1, 1, 1,
0.04569898, 0.4607751, -0.6427318, 1, 1, 1, 1, 1,
0.04650508, -2.532797, 3.870954, 1, 1, 1, 1, 1,
0.0466446, 0.08251283, 0.2753403, 1, 1, 1, 1, 1,
0.04679471, -1.890092, 2.619854, 1, 1, 1, 1, 1,
0.04899095, 0.8929265, 0.4675333, 1, 1, 1, 1, 1,
0.0497388, -0.7809675, 4.320597, 1, 1, 1, 1, 1,
0.05292581, 0.9085417, 0.289108, 1, 1, 1, 1, 1,
0.05398503, 0.7854027, 0.853314, 1, 1, 1, 1, 1,
0.06348928, 2.831594, 0.2007567, 1, 1, 1, 1, 1,
0.06431919, 0.4523531, 1.216676, 1, 1, 1, 1, 1,
0.06617687, -1.259728, 2.577502, 1, 1, 1, 1, 1,
0.06636578, -1.929662, 2.849077, 1, 1, 1, 1, 1,
0.06819733, -0.2358537, 3.651181, 0, 0, 1, 1, 1,
0.07358821, 1.75582, -0.07835945, 1, 0, 0, 1, 1,
0.08373762, -0.6054293, 2.065247, 1, 0, 0, 1, 1,
0.0861041, -0.2221992, 1.70057, 1, 0, 0, 1, 1,
0.09113007, -0.7090803, 3.455924, 1, 0, 0, 1, 1,
0.09145267, -2.341032, 5.149089, 1, 0, 0, 1, 1,
0.09223228, -0.368212, 2.249642, 0, 0, 0, 1, 1,
0.09579479, 0.7423778, -1.102369, 0, 0, 0, 1, 1,
0.09790191, -0.08902307, 2.469098, 0, 0, 0, 1, 1,
0.10087, 0.1728929, 0.5571569, 0, 0, 0, 1, 1,
0.1058241, -0.1882952, 2.764775, 0, 0, 0, 1, 1,
0.1061877, -0.3983437, 2.452445, 0, 0, 0, 1, 1,
0.1087172, -1.306948, 2.39692, 0, 0, 0, 1, 1,
0.1089645, 0.5382017, 1.533022, 1, 1, 1, 1, 1,
0.1194922, 1.189451, -0.3723344, 1, 1, 1, 1, 1,
0.120167, -0.241735, 1.732813, 1, 1, 1, 1, 1,
0.1226755, -0.1604065, 2.881468, 1, 1, 1, 1, 1,
0.1289453, -1.329981, 3.663501, 1, 1, 1, 1, 1,
0.1291265, 0.6867959, -0.4991508, 1, 1, 1, 1, 1,
0.1304307, -1.321577, 4.014986, 1, 1, 1, 1, 1,
0.1314161, 0.7204664, 1.986809, 1, 1, 1, 1, 1,
0.1337644, 0.5702682, -1.883884, 1, 1, 1, 1, 1,
0.1359985, 0.04745828, 0.05752052, 1, 1, 1, 1, 1,
0.139693, -0.1825052, 2.9353, 1, 1, 1, 1, 1,
0.1413419, -1.911463, 3.664714, 1, 1, 1, 1, 1,
0.141733, 0.08729991, 1.448459, 1, 1, 1, 1, 1,
0.1513334, -0.2508374, 4.723699, 1, 1, 1, 1, 1,
0.1517318, 0.8211343, 1.507609, 1, 1, 1, 1, 1,
0.1517754, -0.08119709, 1.368837, 0, 0, 1, 1, 1,
0.1583899, -0.9397715, 3.949731, 1, 0, 0, 1, 1,
0.1596567, -0.2055601, 2.120348, 1, 0, 0, 1, 1,
0.1662038, 0.9870291, -0.6129527, 1, 0, 0, 1, 1,
0.1717431, 0.1467694, 2.07216, 1, 0, 0, 1, 1,
0.1720335, 1.861077, 0.9198642, 1, 0, 0, 1, 1,
0.173971, 0.3943566, 0.7398091, 0, 0, 0, 1, 1,
0.1758358, -0.7647371, 3.748216, 0, 0, 0, 1, 1,
0.1802343, 0.05340104, 0.5118527, 0, 0, 0, 1, 1,
0.182003, -0.4200793, 3.904604, 0, 0, 0, 1, 1,
0.1823203, -0.5198787, 2.766103, 0, 0, 0, 1, 1,
0.1838164, -0.5049915, 4.114952, 0, 0, 0, 1, 1,
0.1857819, -0.9232038, 2.694764, 0, 0, 0, 1, 1,
0.1867988, -0.3046767, 2.092067, 1, 1, 1, 1, 1,
0.1873561, -1.406468, 1.823326, 1, 1, 1, 1, 1,
0.187689, 1.121676, 1.174158, 1, 1, 1, 1, 1,
0.1899774, -0.1286028, 0.3281741, 1, 1, 1, 1, 1,
0.1919728, -0.5002955, 2.207661, 1, 1, 1, 1, 1,
0.1943929, 0.9021091, -0.9469123, 1, 1, 1, 1, 1,
0.1960962, -0.6617929, 1.779224, 1, 1, 1, 1, 1,
0.1985831, -1.602241, 3.503715, 1, 1, 1, 1, 1,
0.1990426, -1.84934, 3.946516, 1, 1, 1, 1, 1,
0.2020502, -1.51944, 3.577522, 1, 1, 1, 1, 1,
0.2036972, 1.048385, 0.5892065, 1, 1, 1, 1, 1,
0.2058047, -1.281981, 1.668367, 1, 1, 1, 1, 1,
0.2101228, 0.7952106, -0.1495798, 1, 1, 1, 1, 1,
0.2107773, 0.1431975, 1.434873, 1, 1, 1, 1, 1,
0.2123154, -1.477699, 2.83764, 1, 1, 1, 1, 1,
0.2130219, -0.03661435, 1.018066, 0, 0, 1, 1, 1,
0.2157592, 0.3436314, 2.111577, 1, 0, 0, 1, 1,
0.2168631, -2.611426, 2.196994, 1, 0, 0, 1, 1,
0.2184516, 1.38135, 0.1849567, 1, 0, 0, 1, 1,
0.220595, -2.755765, 2.25116, 1, 0, 0, 1, 1,
0.2214015, 0.09287988, 0.8617359, 1, 0, 0, 1, 1,
0.2217909, 0.8039702, -0.5722609, 0, 0, 0, 1, 1,
0.2224363, -0.5218012, 2.81386, 0, 0, 0, 1, 1,
0.2229216, -2.061548, 4.93794, 0, 0, 0, 1, 1,
0.2230111, 0.6921824, 1.428512, 0, 0, 0, 1, 1,
0.2246236, 0.8565343, 1.251516, 0, 0, 0, 1, 1,
0.2280045, 1.110108, 0.3341188, 0, 0, 0, 1, 1,
0.2281742, 0.4494196, 0.9655543, 0, 0, 0, 1, 1,
0.2287313, -0.7653109, 2.79264, 1, 1, 1, 1, 1,
0.2297479, -1.108776, 2.540772, 1, 1, 1, 1, 1,
0.2327549, 0.1055093, 1.268961, 1, 1, 1, 1, 1,
0.2344355, -0.9179797, 2.369417, 1, 1, 1, 1, 1,
0.2358505, 1.446034, -0.8488818, 1, 1, 1, 1, 1,
0.2364516, -1.282769, 3.637988, 1, 1, 1, 1, 1,
0.2369572, 0.3568561, 0.1226091, 1, 1, 1, 1, 1,
0.2380753, -0.8808178, 4.972559, 1, 1, 1, 1, 1,
0.2467246, -0.02154219, 0.6286191, 1, 1, 1, 1, 1,
0.2476275, 1.119247, 0.6159282, 1, 1, 1, 1, 1,
0.2481661, 0.2046516, -0.1462825, 1, 1, 1, 1, 1,
0.2626193, -0.2892516, 1.001688, 1, 1, 1, 1, 1,
0.2631044, -0.345888, 2.871751, 1, 1, 1, 1, 1,
0.2633453, 1.680515, 1.062305, 1, 1, 1, 1, 1,
0.2639829, 0.1128116, 2.919743, 1, 1, 1, 1, 1,
0.2681073, 1.367865, 1.581298, 0, 0, 1, 1, 1,
0.2695064, -1.691479, 2.883824, 1, 0, 0, 1, 1,
0.2732284, -0.7366285, 1.313269, 1, 0, 0, 1, 1,
0.2777518, -2.050054, 3.549756, 1, 0, 0, 1, 1,
0.2838186, 1.130917, -0.1099117, 1, 0, 0, 1, 1,
0.2839051, -0.0550867, 2.618643, 1, 0, 0, 1, 1,
0.2881184, 1.319957, 1.252169, 0, 0, 0, 1, 1,
0.2884623, 1.206126, 0.2339906, 0, 0, 0, 1, 1,
0.2886168, 1.209445, -0.132698, 0, 0, 0, 1, 1,
0.2890806, -0.143994, 2.516945, 0, 0, 0, 1, 1,
0.2891732, -0.5189875, 1.874887, 0, 0, 0, 1, 1,
0.2915875, 1.064261, 2.185357, 0, 0, 0, 1, 1,
0.2923885, 1.013738, -0.9406374, 0, 0, 0, 1, 1,
0.2938476, -0.7088457, 1.777366, 1, 1, 1, 1, 1,
0.2945645, 0.1005055, 0.7602357, 1, 1, 1, 1, 1,
0.3017206, -1.010044, 2.763703, 1, 1, 1, 1, 1,
0.302391, -0.05018944, 2.174743, 1, 1, 1, 1, 1,
0.3037069, 1.563468, 1.185892, 1, 1, 1, 1, 1,
0.3045323, -0.9522813, 3.583194, 1, 1, 1, 1, 1,
0.3073757, -1.593506, 3.01649, 1, 1, 1, 1, 1,
0.3077379, -1.841375, 3.517444, 1, 1, 1, 1, 1,
0.3100963, -0.1655867, 1.808828, 1, 1, 1, 1, 1,
0.312902, -1.104128, 2.94681, 1, 1, 1, 1, 1,
0.3130278, -1.197676, 3.627583, 1, 1, 1, 1, 1,
0.3265592, 0.02212636, 1.950688, 1, 1, 1, 1, 1,
0.3276598, -0.3807393, 3.829051, 1, 1, 1, 1, 1,
0.3320559, 0.391685, -1.089807, 1, 1, 1, 1, 1,
0.3327668, 0.901875, -0.007532845, 1, 1, 1, 1, 1,
0.3331163, -1.103683, 3.191581, 0, 0, 1, 1, 1,
0.3343895, 0.01408178, 1.588253, 1, 0, 0, 1, 1,
0.3352523, 1.977597, -0.03758644, 1, 0, 0, 1, 1,
0.3443912, 0.7563015, -0.4131033, 1, 0, 0, 1, 1,
0.3456452, -1.680876, 2.759444, 1, 0, 0, 1, 1,
0.3468716, -0.5411842, 3.136876, 1, 0, 0, 1, 1,
0.3479555, -0.3046758, 0.3985628, 0, 0, 0, 1, 1,
0.3535439, -0.4670807, 4.076719, 0, 0, 0, 1, 1,
0.3580573, -0.982986, 4.615121, 0, 0, 0, 1, 1,
0.3582169, 1.882992, 0.1150819, 0, 0, 0, 1, 1,
0.3593094, -2.410959, 2.905663, 0, 0, 0, 1, 1,
0.3596779, 0.7024487, 1.575573, 0, 0, 0, 1, 1,
0.3603938, -0.423868, 3.579785, 0, 0, 0, 1, 1,
0.3604791, 0.7737223, 0.9010919, 1, 1, 1, 1, 1,
0.3678752, -1.016218, 3.120274, 1, 1, 1, 1, 1,
0.3684388, -0.2113943, 2.85464, 1, 1, 1, 1, 1,
0.369908, -0.3414845, 0.433024, 1, 1, 1, 1, 1,
0.3701651, 1.45683, 0.03385762, 1, 1, 1, 1, 1,
0.3723094, 0.3458897, 1.136702, 1, 1, 1, 1, 1,
0.3808556, -0.8500146, 3.722465, 1, 1, 1, 1, 1,
0.3827348, 0.5942024, 2.423461, 1, 1, 1, 1, 1,
0.3862396, -0.4712006, 2.77347, 1, 1, 1, 1, 1,
0.3865991, -1.067464, 3.312912, 1, 1, 1, 1, 1,
0.3886754, -1.031554, 1.553536, 1, 1, 1, 1, 1,
0.3941187, -0.08276462, 1.947956, 1, 1, 1, 1, 1,
0.396798, 1.703866, 0.3241209, 1, 1, 1, 1, 1,
0.3999928, -0.4766192, 2.333529, 1, 1, 1, 1, 1,
0.4030327, 0.3724044, -0.8616594, 1, 1, 1, 1, 1,
0.4092427, -1.478658, 2.029361, 0, 0, 1, 1, 1,
0.4147462, -1.516181, 2.625708, 1, 0, 0, 1, 1,
0.4230981, 2.164979, -0.8822465, 1, 0, 0, 1, 1,
0.4257164, 0.9411919, -0.0480624, 1, 0, 0, 1, 1,
0.4257975, 0.4342822, -0.3200708, 1, 0, 0, 1, 1,
0.4311199, 0.5532322, 0.1479749, 1, 0, 0, 1, 1,
0.4314004, 0.7708091, -1.082195, 0, 0, 0, 1, 1,
0.4335026, 1.222739, -0.1004181, 0, 0, 0, 1, 1,
0.433517, -0.05179436, 3.830885, 0, 0, 0, 1, 1,
0.4338185, 0.07483173, 1.365915, 0, 0, 0, 1, 1,
0.4341077, 0.04590693, 2.199932, 0, 0, 0, 1, 1,
0.4345042, -0.639293, 3.710786, 0, 0, 0, 1, 1,
0.4393104, 1.953714, -0.09672931, 0, 0, 0, 1, 1,
0.4428174, -1.301965, 3.381565, 1, 1, 1, 1, 1,
0.4467186, -1.221703, 3.959075, 1, 1, 1, 1, 1,
0.453853, 2.263054, -1.261356, 1, 1, 1, 1, 1,
0.4559419, -1.054848, 2.471909, 1, 1, 1, 1, 1,
0.4593665, -1.242743, 3.872616, 1, 1, 1, 1, 1,
0.4598516, -0.4624752, 0.8433034, 1, 1, 1, 1, 1,
0.4620619, 0.5192302, -0.7944434, 1, 1, 1, 1, 1,
0.4655347, -0.09532031, 0.4802338, 1, 1, 1, 1, 1,
0.4700686, -0.7456896, 1.617923, 1, 1, 1, 1, 1,
0.4711007, -0.3600534, 2.366783, 1, 1, 1, 1, 1,
0.4760389, 0.6549444, 0.7576489, 1, 1, 1, 1, 1,
0.4771002, 0.9825149, 1.05893, 1, 1, 1, 1, 1,
0.4786251, -1.22451, 2.008937, 1, 1, 1, 1, 1,
0.481697, -0.8022452, 2.985653, 1, 1, 1, 1, 1,
0.4823909, 0.3131356, 0.951636, 1, 1, 1, 1, 1,
0.4831184, 0.3789826, 0.0987011, 0, 0, 1, 1, 1,
0.4845296, -1.196861, 2.960577, 1, 0, 0, 1, 1,
0.4853593, -0.9420985, 3.268641, 1, 0, 0, 1, 1,
0.4855683, -1.395762, 2.436331, 1, 0, 0, 1, 1,
0.487325, 2.647117, 0.8476521, 1, 0, 0, 1, 1,
0.4898515, -0.3626351, 2.14504, 1, 0, 0, 1, 1,
0.4916576, 1.877427, -0.7788784, 0, 0, 0, 1, 1,
0.4928197, -0.2412267, 3.114341, 0, 0, 0, 1, 1,
0.4959691, 0.339625, 0.0357412, 0, 0, 0, 1, 1,
0.4969726, 0.6544773, -0.03883998, 0, 0, 0, 1, 1,
0.5135485, -0.3120516, 2.109715, 0, 0, 0, 1, 1,
0.5160816, 1.437939, 0.692138, 0, 0, 0, 1, 1,
0.5181461, 0.3808216, 0.6381896, 0, 0, 0, 1, 1,
0.5191811, 0.3451509, 2.09798, 1, 1, 1, 1, 1,
0.5235741, -0.2728955, 2.516876, 1, 1, 1, 1, 1,
0.525179, -1.303029, 2.49725, 1, 1, 1, 1, 1,
0.5291911, 1.005008, 1.148674, 1, 1, 1, 1, 1,
0.530854, 2.423544, 0.07431233, 1, 1, 1, 1, 1,
0.5312434, 0.2098067, 0.6128276, 1, 1, 1, 1, 1,
0.5313518, 0.5217006, -0.3560081, 1, 1, 1, 1, 1,
0.5342587, -1.821528, 2.51137, 1, 1, 1, 1, 1,
0.5419394, -1.177303, 2.922217, 1, 1, 1, 1, 1,
0.5449882, 0.1028674, 1.637373, 1, 1, 1, 1, 1,
0.5468885, 0.07163818, 1.053033, 1, 1, 1, 1, 1,
0.5475889, 0.934614, -0.3807361, 1, 1, 1, 1, 1,
0.54816, 0.4234925, -0.2358577, 1, 1, 1, 1, 1,
0.5511878, 0.202393, -0.3974706, 1, 1, 1, 1, 1,
0.5516912, -0.2371201, -0.5402277, 1, 1, 1, 1, 1,
0.5559796, 1.208521, 1.105049, 0, 0, 1, 1, 1,
0.5603644, 0.7727078, 0.3346575, 1, 0, 0, 1, 1,
0.5610895, 1.071887, 1.634169, 1, 0, 0, 1, 1,
0.5622935, -0.2556547, 3.335839, 1, 0, 0, 1, 1,
0.5699478, -0.01259632, 1.372145, 1, 0, 0, 1, 1,
0.5732686, 0.6329395, -0.0828075, 1, 0, 0, 1, 1,
0.5739763, 0.7822617, 0.1191772, 0, 0, 0, 1, 1,
0.5773221, 0.9748201, 1.406353, 0, 0, 0, 1, 1,
0.5835837, 0.7245036, 1.038991, 0, 0, 0, 1, 1,
0.5882003, 0.6601157, 1.885787, 0, 0, 0, 1, 1,
0.5894748, 1.065026, -0.1696978, 0, 0, 0, 1, 1,
0.5967086, -0.3420799, 2.490918, 0, 0, 0, 1, 1,
0.6017271, 1.074463, 1.163984, 0, 0, 0, 1, 1,
0.6038471, 0.1074348, 2.085958, 1, 1, 1, 1, 1,
0.6040723, 0.9629281, -0.4119153, 1, 1, 1, 1, 1,
0.6059924, 1.34679, 0.9247875, 1, 1, 1, 1, 1,
0.6103905, -0.003850306, 2.204317, 1, 1, 1, 1, 1,
0.6131333, 0.2431551, 1.786937, 1, 1, 1, 1, 1,
0.613722, 1.113231, 0.1197781, 1, 1, 1, 1, 1,
0.6145383, 0.212313, 1.276323, 1, 1, 1, 1, 1,
0.6202182, -1.399237, 2.785116, 1, 1, 1, 1, 1,
0.6208106, -0.8470829, 2.72756, 1, 1, 1, 1, 1,
0.6231186, 0.5523928, 1.57073, 1, 1, 1, 1, 1,
0.6240431, -1.679679, 2.828913, 1, 1, 1, 1, 1,
0.6249596, -1.423285, 3.090479, 1, 1, 1, 1, 1,
0.6250347, 0.5937114, 1.558277, 1, 1, 1, 1, 1,
0.6261557, -0.02870631, 1.728877, 1, 1, 1, 1, 1,
0.630653, 0.07968108, 1.327631, 1, 1, 1, 1, 1,
0.6313995, -0.3995926, 1.907172, 0, 0, 1, 1, 1,
0.6335858, 1.080955, 1.287329, 1, 0, 0, 1, 1,
0.6337418, 0.716022, 1.440376, 1, 0, 0, 1, 1,
0.6352754, 2.150755, 0.6433449, 1, 0, 0, 1, 1,
0.6410184, 0.6880122, -0.5348601, 1, 0, 0, 1, 1,
0.6413395, -2.123362, 3.018425, 1, 0, 0, 1, 1,
0.6437558, -0.8640356, 0.3443973, 0, 0, 0, 1, 1,
0.6438535, 0.5308762, 2.007243, 0, 0, 0, 1, 1,
0.6454007, -0.4285112, 2.584687, 0, 0, 0, 1, 1,
0.6480054, 0.8219652, 0.438785, 0, 0, 0, 1, 1,
0.6486602, -0.2919619, 2.747375, 0, 0, 0, 1, 1,
0.6526422, -1.193884, 1.874182, 0, 0, 0, 1, 1,
0.6530859, -0.0758476, 1.06452, 0, 0, 0, 1, 1,
0.6546115, 0.261052, 1.893494, 1, 1, 1, 1, 1,
0.6583896, -1.113114, 1.295956, 1, 1, 1, 1, 1,
0.6583943, 0.4060303, 0.6259863, 1, 1, 1, 1, 1,
0.6588872, -0.7653356, 2.493101, 1, 1, 1, 1, 1,
0.6663482, -0.6210458, 1.823395, 1, 1, 1, 1, 1,
0.67087, -0.02104511, 1.95939, 1, 1, 1, 1, 1,
0.6709791, -0.6543705, 2.142406, 1, 1, 1, 1, 1,
0.6713552, 0.6250879, 0.2596318, 1, 1, 1, 1, 1,
0.6760945, -1.555411, 1.999048, 1, 1, 1, 1, 1,
0.6772786, 0.8711714, -0.4998273, 1, 1, 1, 1, 1,
0.6789449, -0.1706725, 2.557355, 1, 1, 1, 1, 1,
0.6797802, -0.6338809, 2.39302, 1, 1, 1, 1, 1,
0.6823587, -1.528923, 1.93272, 1, 1, 1, 1, 1,
0.6824126, 0.167838, 1.818356, 1, 1, 1, 1, 1,
0.6831153, -1.54661, 3.929179, 1, 1, 1, 1, 1,
0.6889412, 1.419145, -1.413492, 0, 0, 1, 1, 1,
0.6934419, -1.04454, 1.947381, 1, 0, 0, 1, 1,
0.6979071, 0.1384855, 0.2148425, 1, 0, 0, 1, 1,
0.6986371, -0.7273103, 2.940032, 1, 0, 0, 1, 1,
0.6995358, 0.4370672, 0.4925958, 1, 0, 0, 1, 1,
0.699957, 0.4245149, 0.7287127, 1, 0, 0, 1, 1,
0.7051232, -1.301568, 3.390947, 0, 0, 0, 1, 1,
0.7067336, -0.8475441, 0.6223459, 0, 0, 0, 1, 1,
0.709619, 0.02877009, 2.430518, 0, 0, 0, 1, 1,
0.7099416, 1.095712, 0.8164878, 0, 0, 0, 1, 1,
0.7122576, 1.275906, 0.2552833, 0, 0, 0, 1, 1,
0.7216392, -0.3366889, 2.20669, 0, 0, 0, 1, 1,
0.7226099, -0.7862985, 1.237741, 0, 0, 0, 1, 1,
0.7333692, 0.731939, -0.1922841, 1, 1, 1, 1, 1,
0.7346458, -0.135756, 2.301979, 1, 1, 1, 1, 1,
0.7385015, 0.6481272, -0.3973538, 1, 1, 1, 1, 1,
0.7395862, -1.131582, 4.903811, 1, 1, 1, 1, 1,
0.7587602, 0.07065868, 2.228924, 1, 1, 1, 1, 1,
0.7600671, 0.1003909, 2.870247, 1, 1, 1, 1, 1,
0.7618033, -0.5725741, 2.451839, 1, 1, 1, 1, 1,
0.7621323, 0.08149669, 0.1365588, 1, 1, 1, 1, 1,
0.7652418, 0.4691769, 0.1587715, 1, 1, 1, 1, 1,
0.7679894, -0.592624, 2.090713, 1, 1, 1, 1, 1,
0.772901, -0.1110706, 3.973683, 1, 1, 1, 1, 1,
0.7730633, -1.19691, 2.54127, 1, 1, 1, 1, 1,
0.7753989, -0.6275178, 2.402454, 1, 1, 1, 1, 1,
0.7778654, -1.229174, 1.499071, 1, 1, 1, 1, 1,
0.7784926, 0.541675, 1.832712, 1, 1, 1, 1, 1,
0.7853007, -0.6463886, 2.710683, 0, 0, 1, 1, 1,
0.7864741, 0.8619774, 2.198106, 1, 0, 0, 1, 1,
0.7867532, -0.2446002, 2.72453, 1, 0, 0, 1, 1,
0.788461, -0.2079308, 2.303754, 1, 0, 0, 1, 1,
0.7888039, -0.6238527, 1.168375, 1, 0, 0, 1, 1,
0.7920118, 0.4879751, 1.46808, 1, 0, 0, 1, 1,
0.793825, -0.7139133, 3.463683, 0, 0, 0, 1, 1,
0.796862, 0.1539083, 0.2524303, 0, 0, 0, 1, 1,
0.7971563, -1.823432, 2.636318, 0, 0, 0, 1, 1,
0.7977523, 0.2815569, 2.026956, 0, 0, 0, 1, 1,
0.8011847, -0.1178579, 2.917125, 0, 0, 0, 1, 1,
0.8029839, -0.9478132, 1.519891, 0, 0, 0, 1, 1,
0.8031722, 0.8852999, 0.6950222, 0, 0, 0, 1, 1,
0.8037634, 0.7889548, 1.287598, 1, 1, 1, 1, 1,
0.8039411, -0.100243, 2.113609, 1, 1, 1, 1, 1,
0.8086702, 0.2519743, 0.8391742, 1, 1, 1, 1, 1,
0.8113216, -0.68641, 2.486293, 1, 1, 1, 1, 1,
0.8167657, 1.159616, 2.369068, 1, 1, 1, 1, 1,
0.8212245, 0.4461122, 1.16073, 1, 1, 1, 1, 1,
0.8222821, -1.757501, 3.799379, 1, 1, 1, 1, 1,
0.8421863, -2.426751, 2.225457, 1, 1, 1, 1, 1,
0.8618397, 1.064711, -1.150318, 1, 1, 1, 1, 1,
0.8716407, 0.5386583, 2.15509, 1, 1, 1, 1, 1,
0.8720715, 1.2025, 0.5226394, 1, 1, 1, 1, 1,
0.874481, -0.9671292, 3.563397, 1, 1, 1, 1, 1,
0.8751384, -0.3553225, 3.396805, 1, 1, 1, 1, 1,
0.8754545, -0.743293, 3.098997, 1, 1, 1, 1, 1,
0.8789448, -0.5278382, 3.031086, 1, 1, 1, 1, 1,
0.8814588, 0.8729613, -0.9123974, 0, 0, 1, 1, 1,
0.8847895, 0.1934376, 2.292972, 1, 0, 0, 1, 1,
0.8897957, 0.1442525, 1.77986, 1, 0, 0, 1, 1,
0.8941421, -1.534473, 4.616883, 1, 0, 0, 1, 1,
0.8944277, 1.484295, 0.3472482, 1, 0, 0, 1, 1,
0.8946404, 1.357921, 0.7661586, 1, 0, 0, 1, 1,
0.9006952, -0.1601763, 0.9517592, 0, 0, 0, 1, 1,
0.9027935, 1.859261, 0.5022652, 0, 0, 0, 1, 1,
0.9046398, 0.03498654, 2.290366, 0, 0, 0, 1, 1,
0.9063869, 1.787382, 1.356196, 0, 0, 0, 1, 1,
0.9126504, 1.17546, 0.8653522, 0, 0, 0, 1, 1,
0.9146081, 0.1432303, 2.009715, 0, 0, 0, 1, 1,
0.9147642, -0.9836317, 2.34993, 0, 0, 0, 1, 1,
0.9161505, 0.8607965, 1.630301, 1, 1, 1, 1, 1,
0.9261147, 0.1397912, 1.866279, 1, 1, 1, 1, 1,
0.9275935, 1.054341, 1.252619, 1, 1, 1, 1, 1,
0.9280101, 0.4450983, 3.483701, 1, 1, 1, 1, 1,
0.9295335, -1.142511, 2.346012, 1, 1, 1, 1, 1,
0.9390647, 0.1657971, 3.4055, 1, 1, 1, 1, 1,
0.942361, 0.1543828, 2.195894, 1, 1, 1, 1, 1,
0.9475054, 0.09059176, 4.394011, 1, 1, 1, 1, 1,
0.9567248, 0.3327531, 1.251483, 1, 1, 1, 1, 1,
0.9642601, 1.326894, -1.441849, 1, 1, 1, 1, 1,
0.9668233, -0.1423429, 2.741006, 1, 1, 1, 1, 1,
0.9695183, -0.781798, 1.587911, 1, 1, 1, 1, 1,
0.9699864, 0.6591051, 2.273181, 1, 1, 1, 1, 1,
0.9734067, -1.254329, 1.94795, 1, 1, 1, 1, 1,
0.9835002, -0.9950609, 1.253386, 1, 1, 1, 1, 1,
0.9857521, -1.062291, 2.583998, 0, 0, 1, 1, 1,
0.9867042, -0.9690311, 2.486118, 1, 0, 0, 1, 1,
0.9879813, 0.2115549, 0.9453946, 1, 0, 0, 1, 1,
0.9965696, 0.5279052, 3.035111, 1, 0, 0, 1, 1,
0.9972423, -0.4966619, 0.5628846, 1, 0, 0, 1, 1,
1.001493, 1.266976, -1.645551, 1, 0, 0, 1, 1,
1.005546, 0.5365668, 1.943203, 0, 0, 0, 1, 1,
1.006964, 1.029271, 1.522216, 0, 0, 0, 1, 1,
1.009765, -2.225652, 1.997898, 0, 0, 0, 1, 1,
1.018097, 0.2921932, 0.2236331, 0, 0, 0, 1, 1,
1.024455, -1.584867, 3.12614, 0, 0, 0, 1, 1,
1.031441, -0.2483571, 2.094489, 0, 0, 0, 1, 1,
1.032685, -0.3657066, 0.7645052, 0, 0, 0, 1, 1,
1.039631, -1.044409, 2.069834, 1, 1, 1, 1, 1,
1.044065, 0.331634, -0.62551, 1, 1, 1, 1, 1,
1.050311, 2.807095, -0.4881175, 1, 1, 1, 1, 1,
1.050847, -1.97217, 1.936849, 1, 1, 1, 1, 1,
1.051974, -0.6247355, 0.6812187, 1, 1, 1, 1, 1,
1.054425, -0.1999617, 0.4741296, 1, 1, 1, 1, 1,
1.058483, -0.3375757, 3.192362, 1, 1, 1, 1, 1,
1.061448, -0.2904758, 2.934617, 1, 1, 1, 1, 1,
1.06216, 1.416201, 1.464492, 1, 1, 1, 1, 1,
1.065243, 1.665062, -0.07343502, 1, 1, 1, 1, 1,
1.069409, -0.446651, 2.791489, 1, 1, 1, 1, 1,
1.078012, 0.2198272, 0.9491408, 1, 1, 1, 1, 1,
1.078175, -0.7801331, 3.261639, 1, 1, 1, 1, 1,
1.07877, -0.5739157, 2.619129, 1, 1, 1, 1, 1,
1.084234, -0.03727589, 1.632414, 1, 1, 1, 1, 1,
1.097255, -0.2832182, 1.992183, 0, 0, 1, 1, 1,
1.100889, 0.01383648, -0.324216, 1, 0, 0, 1, 1,
1.107209, -0.7651488, 3.784944, 1, 0, 0, 1, 1,
1.108146, -0.186856, 2.605709, 1, 0, 0, 1, 1,
1.109697, -1.870218, 2.199243, 1, 0, 0, 1, 1,
1.111605, 1.404045, 1.380706, 1, 0, 0, 1, 1,
1.112778, 2.875776, 0.2728834, 0, 0, 0, 1, 1,
1.134179, 0.2405046, 0.9473244, 0, 0, 0, 1, 1,
1.141711, -0.7797986, 0.5236754, 0, 0, 0, 1, 1,
1.144018, 0.289486, 0.6288542, 0, 0, 0, 1, 1,
1.14626, 0.2827044, 3.159869, 0, 0, 0, 1, 1,
1.151178, 0.8581238, 1.938224, 0, 0, 0, 1, 1,
1.151781, -0.7356351, 2.614802, 0, 0, 0, 1, 1,
1.157464, 0.2125855, 2.364152, 1, 1, 1, 1, 1,
1.15914, 2.00872, 1.222803, 1, 1, 1, 1, 1,
1.160002, 1.628178, 1.736912, 1, 1, 1, 1, 1,
1.161729, 1.180262, -0.2255005, 1, 1, 1, 1, 1,
1.165529, -2.209818, 1.640773, 1, 1, 1, 1, 1,
1.166171, -0.6608803, 3.92232, 1, 1, 1, 1, 1,
1.170697, -0.6089947, 0.1336198, 1, 1, 1, 1, 1,
1.176293, 0.6184626, 1.974487, 1, 1, 1, 1, 1,
1.176368, -3.443664, 3.265236, 1, 1, 1, 1, 1,
1.190569, -0.4362702, 0.3613454, 1, 1, 1, 1, 1,
1.196761, -0.07557588, 2.306242, 1, 1, 1, 1, 1,
1.201499, 1.111831, -0.9406567, 1, 1, 1, 1, 1,
1.20498, 0.539197, 2.183891, 1, 1, 1, 1, 1,
1.206849, 1.066986, 0.9947172, 1, 1, 1, 1, 1,
1.209497, 0.7429317, 2.649586, 1, 1, 1, 1, 1,
1.2133, 0.583145, 2.61912, 0, 0, 1, 1, 1,
1.227279, -2.087266, 2.708846, 1, 0, 0, 1, 1,
1.239912, 1.138497, 2.008904, 1, 0, 0, 1, 1,
1.250028, 1.239053, 0.7820122, 1, 0, 0, 1, 1,
1.250492, -0.7827361, 1.479969, 1, 0, 0, 1, 1,
1.256009, -1.533972, 3.695604, 1, 0, 0, 1, 1,
1.25774, 0.7167396, 0.9810383, 0, 0, 0, 1, 1,
1.259635, -0.6329014, 1.138572, 0, 0, 0, 1, 1,
1.26524, 0.4597626, 1.500732, 0, 0, 0, 1, 1,
1.269513, -0.02754581, -0.06921517, 0, 0, 0, 1, 1,
1.270913, -1.050219, 1.921662, 0, 0, 0, 1, 1,
1.277442, -1.002337, 3.114669, 0, 0, 0, 1, 1,
1.281539, 1.149186, 0.5997652, 0, 0, 0, 1, 1,
1.283731, 0.8375337, 1.431892, 1, 1, 1, 1, 1,
1.290108, 0.4120292, 0.1255008, 1, 1, 1, 1, 1,
1.298936, -0.2426287, 0.8376117, 1, 1, 1, 1, 1,
1.299396, -0.1294954, 1.092279, 1, 1, 1, 1, 1,
1.302404, 0.8130069, 1.830318, 1, 1, 1, 1, 1,
1.304128, 2.313581, 1.611244, 1, 1, 1, 1, 1,
1.305987, -0.2332479, 1.687294, 1, 1, 1, 1, 1,
1.318406, -0.4963292, 0.3114692, 1, 1, 1, 1, 1,
1.326524, 0.3125944, 1.75728, 1, 1, 1, 1, 1,
1.32813, -1.188172, 2.216175, 1, 1, 1, 1, 1,
1.335621, 0.06099013, 1.136673, 1, 1, 1, 1, 1,
1.337909, 1.167313, 1.633457, 1, 1, 1, 1, 1,
1.342895, 0.446828, 2.274228, 1, 1, 1, 1, 1,
1.35067, 0.0648715, 1.862879, 1, 1, 1, 1, 1,
1.36405, 0.7470769, 0.5883327, 1, 1, 1, 1, 1,
1.364051, 0.4752982, 0.7092302, 0, 0, 1, 1, 1,
1.367797, 1.200783, -0.4568829, 1, 0, 0, 1, 1,
1.371144, 0.3963247, 0.1072287, 1, 0, 0, 1, 1,
1.377378, -0.4333623, 1.722806, 1, 0, 0, 1, 1,
1.384878, -1.464023, 2.745863, 1, 0, 0, 1, 1,
1.38711, -1.60908, 1.804116, 1, 0, 0, 1, 1,
1.389991, -0.4813491, 1.705169, 0, 0, 0, 1, 1,
1.396666, -0.300751, -0.07521238, 0, 0, 0, 1, 1,
1.399813, 1.491932, -0.7868962, 0, 0, 0, 1, 1,
1.416014, 1.492994, 0.1697114, 0, 0, 0, 1, 1,
1.418728, -0.6606901, 1.335848, 0, 0, 0, 1, 1,
1.430676, -0.3577344, 0.5448225, 0, 0, 0, 1, 1,
1.467462, 0.3924245, 1.309537, 0, 0, 0, 1, 1,
1.471692, -0.8177409, 2.141416, 1, 1, 1, 1, 1,
1.473789, 0.4932344, 0.59732, 1, 1, 1, 1, 1,
1.491086, -1.558347, 2.655801, 1, 1, 1, 1, 1,
1.495958, -1.488969, 2.00328, 1, 1, 1, 1, 1,
1.496265, 0.6882817, 1.034781, 1, 1, 1, 1, 1,
1.502798, 1.399251, -0.7705042, 1, 1, 1, 1, 1,
1.509219, 0.1810682, 0.9424351, 1, 1, 1, 1, 1,
1.537786, -1.059215, 2.49872, 1, 1, 1, 1, 1,
1.559184, -0.4264221, 0.5205204, 1, 1, 1, 1, 1,
1.58373, 0.3288572, 0.9712641, 1, 1, 1, 1, 1,
1.58851, 0.9697759, 0.05645094, 1, 1, 1, 1, 1,
1.590807, 0.3367743, 2.722136, 1, 1, 1, 1, 1,
1.593214, -2.065732, 0.8829844, 1, 1, 1, 1, 1,
1.603063, 0.8332229, 0.4626012, 1, 1, 1, 1, 1,
1.613049, -2.569594, 2.414503, 1, 1, 1, 1, 1,
1.627752, -1.507476, 1.882859, 0, 0, 1, 1, 1,
1.637862, 1.094086, 0.5375293, 1, 0, 0, 1, 1,
1.638122, 0.6821783, 1.823856, 1, 0, 0, 1, 1,
1.642272, 0.3365835, 1.866513, 1, 0, 0, 1, 1,
1.64748, -2.021645, 3.233359, 1, 0, 0, 1, 1,
1.657088, -0.2446236, -0.1105918, 1, 0, 0, 1, 1,
1.676373, 1.849301, -0.7104245, 0, 0, 0, 1, 1,
1.678887, 0.9231077, 0.5253724, 0, 0, 0, 1, 1,
1.687731, -0.3289499, 0.7662221, 0, 0, 0, 1, 1,
1.704087, 0.6122373, 0.717437, 0, 0, 0, 1, 1,
1.706892, 0.6097196, 1.272833, 0, 0, 0, 1, 1,
1.71149, 0.2771433, 1.132654, 0, 0, 0, 1, 1,
1.719861, -0.8393713, 3.090155, 0, 0, 0, 1, 1,
1.724343, -1.006513, 2.18139, 1, 1, 1, 1, 1,
1.768341, 0.1603609, 3.385399, 1, 1, 1, 1, 1,
1.800108, 1.10278, 1.671641, 1, 1, 1, 1, 1,
1.832713, -1.11144, 3.587289, 1, 1, 1, 1, 1,
1.856512, -0.8043607, 2.388968, 1, 1, 1, 1, 1,
1.86259, 1.496471, 0.2442296, 1, 1, 1, 1, 1,
1.878824, 1.175614, -0.6329644, 1, 1, 1, 1, 1,
1.900182, -2.186947, 2.797301, 1, 1, 1, 1, 1,
1.904082, -0.07529232, -0.06794565, 1, 1, 1, 1, 1,
1.938285, -0.2702146, 1.909033, 1, 1, 1, 1, 1,
1.950961, 0.8213653, 0.5180957, 1, 1, 1, 1, 1,
1.964481, 0.4876973, 1.523645, 1, 1, 1, 1, 1,
2.040146, -0.5842763, 0.3568311, 1, 1, 1, 1, 1,
2.067059, 0.03877885, 2.71471, 1, 1, 1, 1, 1,
2.087548, 0.1255183, 2.000026, 1, 1, 1, 1, 1,
2.094668, -0.6075589, 2.913916, 0, 0, 1, 1, 1,
2.095668, -1.065365, 1.168499, 1, 0, 0, 1, 1,
2.106513, -0.03137398, 0.4895741, 1, 0, 0, 1, 1,
2.121734, -1.043627, 0.9106472, 1, 0, 0, 1, 1,
2.130603, 3.011669, 1.617997, 1, 0, 0, 1, 1,
2.14342, -1.326438, 4.34303, 1, 0, 0, 1, 1,
2.178709, -1.431391, 2.126504, 0, 0, 0, 1, 1,
2.183787, 0.6868083, 2.785559, 0, 0, 0, 1, 1,
2.338984, 1.779571, 0.0999313, 0, 0, 0, 1, 1,
2.352232, 1.190665, 0.9902104, 0, 0, 0, 1, 1,
2.371668, 0.581941, 1.522006, 0, 0, 0, 1, 1,
2.386196, -0.4626702, -0.343045, 0, 0, 0, 1, 1,
2.451329, -1.422449, 1.32606, 0, 0, 0, 1, 1,
2.5088, -0.8985714, 1.894239, 1, 1, 1, 1, 1,
2.5502, 1.129509, 1.03678, 1, 1, 1, 1, 1,
2.623921, -0.6247496, 1.356436, 1, 1, 1, 1, 1,
2.863084, 0.6851135, 2.335803, 1, 1, 1, 1, 1,
2.873487, 0.4722378, 0.2283661, 1, 1, 1, 1, 1,
2.946838, -0.9409798, 2.257787, 1, 1, 1, 1, 1,
3.100341, -1.583801, 4.074197, 1, 1, 1, 1, 1
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
var radius = 9.406861;
var distance = 33.0412;
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
mvMatrix.translate( 0.1536136, 0.2159979, -0.0530138 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0412);
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
