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
-3.214674, -0.3734882, -2.115048, 1, 0, 0, 1,
-3.031332, -1.042918, -0.7114115, 1, 0.007843138, 0, 1,
-2.871647, -0.2668131, -2.223531, 1, 0.01176471, 0, 1,
-2.865076, 1.37985, -0.7708306, 1, 0.01960784, 0, 1,
-2.817236, 0.1664217, -1.569507, 1, 0.02352941, 0, 1,
-2.772163, 0.1782408, -1.888226, 1, 0.03137255, 0, 1,
-2.761037, 0.3522305, -1.468091, 1, 0.03529412, 0, 1,
-2.759768, -1.603516, -0.9649637, 1, 0.04313726, 0, 1,
-2.673774, -0.424699, -3.173155, 1, 0.04705882, 0, 1,
-2.579172, -0.363224, -1.301178, 1, 0.05490196, 0, 1,
-2.54249, 0.3373715, 0.7499188, 1, 0.05882353, 0, 1,
-2.451033, 0.5433662, -0.2530622, 1, 0.06666667, 0, 1,
-2.389303, 0.4007619, 0.3744947, 1, 0.07058824, 0, 1,
-2.379777, -0.1028554, -2.560485, 1, 0.07843138, 0, 1,
-2.3579, -0.2494343, -1.339561, 1, 0.08235294, 0, 1,
-2.235531, 2.768422, 0.902625, 1, 0.09019608, 0, 1,
-2.223806, -0.2900147, -2.843107, 1, 0.09411765, 0, 1,
-2.184889, 0.6954949, -1.149282, 1, 0.1019608, 0, 1,
-2.169745, 0.7870131, -0.7270971, 1, 0.1098039, 0, 1,
-2.166999, -0.7422788, -1.471691, 1, 0.1137255, 0, 1,
-2.104156, 0.5879923, -0.6172267, 1, 0.1215686, 0, 1,
-2.099929, -1.106957, -2.008969, 1, 0.1254902, 0, 1,
-2.085094, -0.6784896, -0.855132, 1, 0.1333333, 0, 1,
-2.007049, 0.04188798, -1.046607, 1, 0.1372549, 0, 1,
-1.961511, 0.5693834, -1.747602, 1, 0.145098, 0, 1,
-1.952265, -1.398845, -1.484751, 1, 0.1490196, 0, 1,
-1.919109, 1.809836, -1.104585, 1, 0.1568628, 0, 1,
-1.903573, -0.3943132, -1.951407, 1, 0.1607843, 0, 1,
-1.889145, -0.5462798, -3.167439, 1, 0.1686275, 0, 1,
-1.875092, 0.1063478, -2.726015, 1, 0.172549, 0, 1,
-1.848017, 2.072801, 0.3673603, 1, 0.1803922, 0, 1,
-1.841317, 2.327879, -1.078834, 1, 0.1843137, 0, 1,
-1.838695, 0.711025, -2.830637, 1, 0.1921569, 0, 1,
-1.816503, 1.132416, -2.103833, 1, 0.1960784, 0, 1,
-1.810264, 1.47226, -1.155432, 1, 0.2039216, 0, 1,
-1.796321, -0.3978871, -2.378016, 1, 0.2117647, 0, 1,
-1.787911, 0.9206033, 0.6046489, 1, 0.2156863, 0, 1,
-1.786944, 0.4378649, -1.302174, 1, 0.2235294, 0, 1,
-1.784283, -0.4016297, -0.7715541, 1, 0.227451, 0, 1,
-1.783696, -0.3987793, -1.59732, 1, 0.2352941, 0, 1,
-1.769469, 1.603163, -0.6592845, 1, 0.2392157, 0, 1,
-1.76671, 0.3529565, -0.2205456, 1, 0.2470588, 0, 1,
-1.756749, 0.1924761, -2.329803, 1, 0.2509804, 0, 1,
-1.75552, -0.4852931, -0.4920833, 1, 0.2588235, 0, 1,
-1.754987, -0.4773847, 0.3754039, 1, 0.2627451, 0, 1,
-1.754134, -0.3561471, -1.408785, 1, 0.2705882, 0, 1,
-1.749519, 1.576166, -0.5306371, 1, 0.2745098, 0, 1,
-1.747762, 1.456708, -0.2941175, 1, 0.282353, 0, 1,
-1.747709, -0.3196966, -1.798112, 1, 0.2862745, 0, 1,
-1.720631, 0.4982568, -1.219258, 1, 0.2941177, 0, 1,
-1.702762, 0.02872855, -2.056021, 1, 0.3019608, 0, 1,
-1.699087, 0.8741965, -1.518541, 1, 0.3058824, 0, 1,
-1.698168, 0.6428277, -0.1945858, 1, 0.3137255, 0, 1,
-1.689768, -1.167111, -1.954443, 1, 0.3176471, 0, 1,
-1.684306, 0.4432229, -1.481421, 1, 0.3254902, 0, 1,
-1.659265, 1.617706, -0.5516006, 1, 0.3294118, 0, 1,
-1.648293, -1.392863, -1.355123, 1, 0.3372549, 0, 1,
-1.642869, 1.421959, -1.82973, 1, 0.3411765, 0, 1,
-1.642851, -0.1147519, -0.8670298, 1, 0.3490196, 0, 1,
-1.632224, 1.893757, -2.096917, 1, 0.3529412, 0, 1,
-1.628366, 1.031621, 0.293423, 1, 0.3607843, 0, 1,
-1.606289, 1.260914, -1.059239, 1, 0.3647059, 0, 1,
-1.606245, -1.10724, -2.333445, 1, 0.372549, 0, 1,
-1.600986, 0.2755177, -0.9430837, 1, 0.3764706, 0, 1,
-1.599303, -0.2228865, -2.787715, 1, 0.3843137, 0, 1,
-1.598733, 0.8458681, 0.638752, 1, 0.3882353, 0, 1,
-1.585655, -0.08115816, -0.4135529, 1, 0.3960784, 0, 1,
-1.582504, 0.2073469, -1.578517, 1, 0.4039216, 0, 1,
-1.564274, -0.8908762, -3.696238, 1, 0.4078431, 0, 1,
-1.540151, -0.23816, -1.791484, 1, 0.4156863, 0, 1,
-1.537516, 1.123647, -1.204072, 1, 0.4196078, 0, 1,
-1.531117, -0.7386357, -4.007258, 1, 0.427451, 0, 1,
-1.52599, 0.5298429, -2.814493, 1, 0.4313726, 0, 1,
-1.521118, 0.5378892, -2.063288, 1, 0.4392157, 0, 1,
-1.519687, -0.03522765, -0.6714331, 1, 0.4431373, 0, 1,
-1.516391, 0.2937531, 0.5844011, 1, 0.4509804, 0, 1,
-1.513898, 0.1687588, -0.3975406, 1, 0.454902, 0, 1,
-1.509384, -1.075816, -5.134685, 1, 0.4627451, 0, 1,
-1.502067, 2.340427, -0.2205066, 1, 0.4666667, 0, 1,
-1.49458, 0.2570449, 1.721592, 1, 0.4745098, 0, 1,
-1.491391, -0.3566891, -1.851542, 1, 0.4784314, 0, 1,
-1.488042, 0.02379333, -2.237827, 1, 0.4862745, 0, 1,
-1.477652, 0.3939797, -1.964825, 1, 0.4901961, 0, 1,
-1.460806, 0.796893, -0.4556837, 1, 0.4980392, 0, 1,
-1.455734, 0.02432878, -1.697877, 1, 0.5058824, 0, 1,
-1.450443, -1.753565, -3.747057, 1, 0.509804, 0, 1,
-1.449345, 0.4658603, -2.020239, 1, 0.5176471, 0, 1,
-1.42178, 0.6707522, -1.813812, 1, 0.5215687, 0, 1,
-1.395505, 1.759197, -1.848393, 1, 0.5294118, 0, 1,
-1.392774, 0.02333547, -4.068998, 1, 0.5333334, 0, 1,
-1.385899, 0.8380079, -1.035795, 1, 0.5411765, 0, 1,
-1.375754, 0.2455292, -0.8895814, 1, 0.5450981, 0, 1,
-1.369377, -0.3944672, -2.13441, 1, 0.5529412, 0, 1,
-1.36666, 0.01371554, -1.956212, 1, 0.5568628, 0, 1,
-1.360482, -1.045563, -1.821281, 1, 0.5647059, 0, 1,
-1.360336, 1.945096, -0.8819773, 1, 0.5686275, 0, 1,
-1.354691, -1.76136, -2.234588, 1, 0.5764706, 0, 1,
-1.353826, -1.999271, -1.38424, 1, 0.5803922, 0, 1,
-1.348901, 1.097942, -1.756927, 1, 0.5882353, 0, 1,
-1.346988, -0.325703, -2.026071, 1, 0.5921569, 0, 1,
-1.345765, -0.5285883, -3.573045, 1, 0.6, 0, 1,
-1.341307, 1.356441, -1.835054, 1, 0.6078432, 0, 1,
-1.338116, 1.924983, 0.1375567, 1, 0.6117647, 0, 1,
-1.336795, -2.095913, -1.20472, 1, 0.6196079, 0, 1,
-1.335257, 0.7573804, -1.154522, 1, 0.6235294, 0, 1,
-1.312554, -1.386898, -2.012421, 1, 0.6313726, 0, 1,
-1.305255, -1.445175, -2.942401, 1, 0.6352941, 0, 1,
-1.304897, -0.9187369, -3.195026, 1, 0.6431373, 0, 1,
-1.298224, 0.7977352, -1.105803, 1, 0.6470588, 0, 1,
-1.290228, -1.10795, -0.7605429, 1, 0.654902, 0, 1,
-1.284027, 0.1151123, -2.64607, 1, 0.6588235, 0, 1,
-1.281442, -1.536622, -2.187349, 1, 0.6666667, 0, 1,
-1.279952, 0.9865985, -1.408718, 1, 0.6705883, 0, 1,
-1.276704, 0.3403444, -1.026238, 1, 0.6784314, 0, 1,
-1.276438, 0.4754033, -0.8517294, 1, 0.682353, 0, 1,
-1.273925, 0.8057234, -0.148801, 1, 0.6901961, 0, 1,
-1.264117, 0.4083697, -2.670871, 1, 0.6941177, 0, 1,
-1.253756, 0.328231, -2.771725, 1, 0.7019608, 0, 1,
-1.252119, 1.112347, -0.5009489, 1, 0.7098039, 0, 1,
-1.246586, 0.06208124, -1.524607, 1, 0.7137255, 0, 1,
-1.24612, -0.4552372, -0.2233003, 1, 0.7215686, 0, 1,
-1.242943, -1.031416, -1.766864, 1, 0.7254902, 0, 1,
-1.227427, 0.4441726, -0.6346857, 1, 0.7333333, 0, 1,
-1.217436, 0.5592811, 0.664446, 1, 0.7372549, 0, 1,
-1.215704, 0.4926445, -1.871266, 1, 0.7450981, 0, 1,
-1.215642, -1.418078, -1.195028, 1, 0.7490196, 0, 1,
-1.198064, -1.990337, -2.611645, 1, 0.7568628, 0, 1,
-1.192827, 1.007534, -0.6303513, 1, 0.7607843, 0, 1,
-1.192017, 0.9319788, -3.159183, 1, 0.7686275, 0, 1,
-1.191939, 0.4093292, -0.3361564, 1, 0.772549, 0, 1,
-1.190436, 0.5306698, -0.5164654, 1, 0.7803922, 0, 1,
-1.185969, -0.2129295, -2.395601, 1, 0.7843137, 0, 1,
-1.180405, -1.925793, -1.933119, 1, 0.7921569, 0, 1,
-1.177336, -0.07808015, -1.193684, 1, 0.7960784, 0, 1,
-1.152096, 1.342509, -0.995451, 1, 0.8039216, 0, 1,
-1.141928, 0.3178299, -1.291223, 1, 0.8117647, 0, 1,
-1.141079, -1.311555, -2.203719, 1, 0.8156863, 0, 1,
-1.140079, -1.099922, -2.265798, 1, 0.8235294, 0, 1,
-1.139402, -0.9663067, -2.620731, 1, 0.827451, 0, 1,
-1.129777, 0.03969623, -0.1993587, 1, 0.8352941, 0, 1,
-1.110524, -0.0597161, -1.610321, 1, 0.8392157, 0, 1,
-1.10611, 0.1130633, -2.284626, 1, 0.8470588, 0, 1,
-1.10019, 0.9327895, -0.8638857, 1, 0.8509804, 0, 1,
-1.09803, -2.11527, -4.881969, 1, 0.8588235, 0, 1,
-1.092546, -0.5533576, -2.378192, 1, 0.8627451, 0, 1,
-1.086566, 1.684874, -0.6675137, 1, 0.8705882, 0, 1,
-1.08537, -1.357564, -2.647309, 1, 0.8745098, 0, 1,
-1.078259, 0.6149333, -1.525501, 1, 0.8823529, 0, 1,
-1.074009, 1.041829, -2.380764, 1, 0.8862745, 0, 1,
-1.073357, -1.055702, 0.8173426, 1, 0.8941177, 0, 1,
-1.0722, 1.744036, -1.740886, 1, 0.8980392, 0, 1,
-1.064607, 0.8706029, -1.370448, 1, 0.9058824, 0, 1,
-1.063282, -1.690878, -3.599145, 1, 0.9137255, 0, 1,
-1.059713, -0.9685725, -1.201562, 1, 0.9176471, 0, 1,
-1.050565, -1.057557, -3.323657, 1, 0.9254902, 0, 1,
-1.049528, -0.8972107, -2.872177, 1, 0.9294118, 0, 1,
-1.03857, 1.246996, -2.257185, 1, 0.9372549, 0, 1,
-1.030729, 0.5465521, 0.588958, 1, 0.9411765, 0, 1,
-1.027631, 1.281151, -0.6661032, 1, 0.9490196, 0, 1,
-1.02306, 0.4332887, -2.402742, 1, 0.9529412, 0, 1,
-1.021867, 0.7720001, -0.8880841, 1, 0.9607843, 0, 1,
-1.019719, -0.06866781, -0.6871194, 1, 0.9647059, 0, 1,
-1.012717, -0.607682, -1.505316, 1, 0.972549, 0, 1,
-1.010288, 0.4201345, 0.5387783, 1, 0.9764706, 0, 1,
-0.9993098, -0.6014699, -0.5068768, 1, 0.9843137, 0, 1,
-0.9982364, 0.08580425, -0.9543903, 1, 0.9882353, 0, 1,
-0.9885837, -0.6654656, -3.112031, 1, 0.9960784, 0, 1,
-0.9873385, 1.008592, -2.577389, 0.9960784, 1, 0, 1,
-0.9849806, -0.0129568, -0.8512286, 0.9921569, 1, 0, 1,
-0.9748997, 1.056556, -0.7754962, 0.9843137, 1, 0, 1,
-0.9742759, 1.614221, -0.5772021, 0.9803922, 1, 0, 1,
-0.9732475, 0.2823363, -0.9979577, 0.972549, 1, 0, 1,
-0.972448, -0.3756779, -3.77176, 0.9686275, 1, 0, 1,
-0.9669113, -0.9609777, -2.839916, 0.9607843, 1, 0, 1,
-0.9642496, 0.02380721, -1.509885, 0.9568627, 1, 0, 1,
-0.9640468, -0.6234044, -3.854719, 0.9490196, 1, 0, 1,
-0.9578435, -0.6952205, -2.382722, 0.945098, 1, 0, 1,
-0.9557347, -0.2761736, -3.327274, 0.9372549, 1, 0, 1,
-0.9505332, 0.07356539, -0.3834086, 0.9333333, 1, 0, 1,
-0.9375826, 2.047444, 0.634095, 0.9254902, 1, 0, 1,
-0.9362227, -0.1216322, -2.283651, 0.9215686, 1, 0, 1,
-0.9350237, 1.124174, -1.287979, 0.9137255, 1, 0, 1,
-0.9334087, 0.9446983, -0.2431887, 0.9098039, 1, 0, 1,
-0.92889, -1.556908, -4.133137, 0.9019608, 1, 0, 1,
-0.9209088, 2.000898, 1.08113, 0.8941177, 1, 0, 1,
-0.9130594, -1.271656, -0.922628, 0.8901961, 1, 0, 1,
-0.9109339, 0.3219447, -2.631368, 0.8823529, 1, 0, 1,
-0.9107078, -1.008853, -4.37432, 0.8784314, 1, 0, 1,
-0.9092861, -0.3416012, -4.673584, 0.8705882, 1, 0, 1,
-0.9029363, -1.149638, -2.351643, 0.8666667, 1, 0, 1,
-0.891546, 0.1343909, -1.473731, 0.8588235, 1, 0, 1,
-0.8909933, -0.119751, -3.035854, 0.854902, 1, 0, 1,
-0.8869441, -1.067826, -2.646296, 0.8470588, 1, 0, 1,
-0.886235, 0.6282129, -0.1610808, 0.8431373, 1, 0, 1,
-0.8848221, 0.2318514, -2.181767, 0.8352941, 1, 0, 1,
-0.867547, -0.4096088, -2.443299, 0.8313726, 1, 0, 1,
-0.8655566, 1.044551, -0.07097694, 0.8235294, 1, 0, 1,
-0.8625685, -1.757631, -1.932032, 0.8196079, 1, 0, 1,
-0.8589391, 0.4470385, -0.01771257, 0.8117647, 1, 0, 1,
-0.8531966, 1.825245, -0.7784666, 0.8078431, 1, 0, 1,
-0.8505446, -0.1584571, -1.212821, 0.8, 1, 0, 1,
-0.8477398, -0.5051458, -3.050699, 0.7921569, 1, 0, 1,
-0.8453668, 0.1417491, -1.209503, 0.7882353, 1, 0, 1,
-0.8418722, 0.360125, -1.692932, 0.7803922, 1, 0, 1,
-0.8414556, 0.1403556, 0.08325338, 0.7764706, 1, 0, 1,
-0.8332376, -0.9942678, -2.350057, 0.7686275, 1, 0, 1,
-0.8317019, 1.372317, -1.529362, 0.7647059, 1, 0, 1,
-0.8301072, 1.45749, -0.2141618, 0.7568628, 1, 0, 1,
-0.8252281, -2.581468, -1.135638, 0.7529412, 1, 0, 1,
-0.8200439, 0.2873374, -0.316157, 0.7450981, 1, 0, 1,
-0.8135287, 0.2624127, -0.1671867, 0.7411765, 1, 0, 1,
-0.8115093, 0.4370051, -1.504674, 0.7333333, 1, 0, 1,
-0.8039695, -1.116336, -2.116487, 0.7294118, 1, 0, 1,
-0.8038336, -0.468292, -2.537394, 0.7215686, 1, 0, 1,
-0.8024843, -0.3304867, -2.080626, 0.7176471, 1, 0, 1,
-0.8012323, 0.767632, -1.150799, 0.7098039, 1, 0, 1,
-0.8003007, 2.510676, 0.0397266, 0.7058824, 1, 0, 1,
-0.7979687, 0.6676806, -2.032066, 0.6980392, 1, 0, 1,
-0.791052, -1.902573, -1.535724, 0.6901961, 1, 0, 1,
-0.7909635, 0.4409784, -0.6935776, 0.6862745, 1, 0, 1,
-0.7882707, -0.3856571, -3.218722, 0.6784314, 1, 0, 1,
-0.7860309, -0.7266869, -3.66572, 0.6745098, 1, 0, 1,
-0.7858403, -0.9066446, -2.835634, 0.6666667, 1, 0, 1,
-0.7852885, -1.534856, -1.57642, 0.6627451, 1, 0, 1,
-0.7851725, 0.004456019, -1.861186, 0.654902, 1, 0, 1,
-0.782421, -0.6585845, -1.563201, 0.6509804, 1, 0, 1,
-0.7765157, -0.2856809, -0.9912589, 0.6431373, 1, 0, 1,
-0.7695546, -1.730819, -1.719245, 0.6392157, 1, 0, 1,
-0.7682229, -0.4331684, -1.992334, 0.6313726, 1, 0, 1,
-0.7679514, -0.9058595, -0.7191931, 0.627451, 1, 0, 1,
-0.7671098, 1.007829, -1.969132, 0.6196079, 1, 0, 1,
-0.7653975, 1.120827, -1.561016, 0.6156863, 1, 0, 1,
-0.7653702, -1.313491, -1.57954, 0.6078432, 1, 0, 1,
-0.7611238, 0.7977736, -0.1120841, 0.6039216, 1, 0, 1,
-0.7577784, 2.455696, 0.6638535, 0.5960785, 1, 0, 1,
-0.7570295, -0.964912, -0.9366938, 0.5882353, 1, 0, 1,
-0.7369053, -0.3721929, -2.146097, 0.5843138, 1, 0, 1,
-0.7361427, -0.5071097, -1.600772, 0.5764706, 1, 0, 1,
-0.7357045, -0.4951693, -3.904793, 0.572549, 1, 0, 1,
-0.7348888, -1.231651, -2.401943, 0.5647059, 1, 0, 1,
-0.7323754, -0.387354, -2.433368, 0.5607843, 1, 0, 1,
-0.7239106, 1.645976, -0.4272064, 0.5529412, 1, 0, 1,
-0.716357, -1.706267, -1.554986, 0.5490196, 1, 0, 1,
-0.7151178, -0.02635678, -1.590182, 0.5411765, 1, 0, 1,
-0.7138123, 0.1923611, -1.315563, 0.5372549, 1, 0, 1,
-0.713474, 1.153437, 0.604462, 0.5294118, 1, 0, 1,
-0.7109514, -1.371686, -1.992914, 0.5254902, 1, 0, 1,
-0.709433, -0.2788514, -3.238255, 0.5176471, 1, 0, 1,
-0.7079732, 2.509404, -0.2727516, 0.5137255, 1, 0, 1,
-0.7023098, -1.712933, -2.973661, 0.5058824, 1, 0, 1,
-0.6994557, -1.590351, -2.869485, 0.5019608, 1, 0, 1,
-0.6949813, -1.54563, -3.183439, 0.4941176, 1, 0, 1,
-0.6927186, 0.4472358, -2.236171, 0.4862745, 1, 0, 1,
-0.6911253, 2.497049, -0.5200566, 0.4823529, 1, 0, 1,
-0.6907574, 0.3124396, -0.7524155, 0.4745098, 1, 0, 1,
-0.6892735, -1.204605, -1.000406, 0.4705882, 1, 0, 1,
-0.688723, -2.805628, -2.736764, 0.4627451, 1, 0, 1,
-0.6885993, -0.2717001, -2.808725, 0.4588235, 1, 0, 1,
-0.6865401, 1.160193, -1.23871, 0.4509804, 1, 0, 1,
-0.6786444, -1.051525, -3.293224, 0.4470588, 1, 0, 1,
-0.6753481, 1.894544, -1.749568, 0.4392157, 1, 0, 1,
-0.673843, -0.477811, -3.245272, 0.4352941, 1, 0, 1,
-0.6729116, 0.9032691, 0.2810451, 0.427451, 1, 0, 1,
-0.6689705, -0.9286258, -3.131518, 0.4235294, 1, 0, 1,
-0.6608818, 0.8366042, -0.9611683, 0.4156863, 1, 0, 1,
-0.6577612, -2.473112, -2.650228, 0.4117647, 1, 0, 1,
-0.6557831, -1.237836, -0.9429532, 0.4039216, 1, 0, 1,
-0.6466312, -0.01425565, -1.83756, 0.3960784, 1, 0, 1,
-0.6448858, 1.267932, 0.3182082, 0.3921569, 1, 0, 1,
-0.6428782, -0.02017323, -2.090871, 0.3843137, 1, 0, 1,
-0.6428776, 1.389042, 0.1636499, 0.3803922, 1, 0, 1,
-0.6413153, 0.236641, -2.788035, 0.372549, 1, 0, 1,
-0.6398913, -0.4046244, -0.747761, 0.3686275, 1, 0, 1,
-0.6390259, -1.064468, -2.194461, 0.3607843, 1, 0, 1,
-0.6371724, 0.3691094, -1.773917, 0.3568628, 1, 0, 1,
-0.6365802, 0.0796302, 0.06312369, 0.3490196, 1, 0, 1,
-0.6223301, -1.009324, -2.840015, 0.345098, 1, 0, 1,
-0.6203585, -0.1083879, -4.212978, 0.3372549, 1, 0, 1,
-0.6150806, -2.409744, -1.968701, 0.3333333, 1, 0, 1,
-0.6126928, 1.812778, -1.601345, 0.3254902, 1, 0, 1,
-0.6108263, -0.3555224, -3.828776, 0.3215686, 1, 0, 1,
-0.6089186, -0.714815, -1.953626, 0.3137255, 1, 0, 1,
-0.603268, 1.515793, -2.847387, 0.3098039, 1, 0, 1,
-0.6015476, -1.879256, -0.7719734, 0.3019608, 1, 0, 1,
-0.5959107, -1.091178, -4.453994, 0.2941177, 1, 0, 1,
-0.5898206, -0.7874795, -2.386465, 0.2901961, 1, 0, 1,
-0.5894588, -0.541879, -3.534032, 0.282353, 1, 0, 1,
-0.5866446, 0.1670202, -0.8980378, 0.2784314, 1, 0, 1,
-0.5835702, -1.069652, -1.988342, 0.2705882, 1, 0, 1,
-0.5817744, 1.267962, -0.6324607, 0.2666667, 1, 0, 1,
-0.5807211, -0.6009833, -1.450997, 0.2588235, 1, 0, 1,
-0.5787237, 1.116022, -0.06811795, 0.254902, 1, 0, 1,
-0.5729593, -1.555637, -3.645729, 0.2470588, 1, 0, 1,
-0.5711936, -1.569911, -2.831253, 0.2431373, 1, 0, 1,
-0.5582348, -0.8472137, -2.124807, 0.2352941, 1, 0, 1,
-0.5572456, -1.624409, -3.971952, 0.2313726, 1, 0, 1,
-0.5517303, -1.663116, -1.92159, 0.2235294, 1, 0, 1,
-0.5453764, -0.6377189, -2.774304, 0.2196078, 1, 0, 1,
-0.5447123, 1.055412, -1.099822, 0.2117647, 1, 0, 1,
-0.5443758, 0.1265235, -1.502084, 0.2078431, 1, 0, 1,
-0.5402322, 1.335609, 1.087004, 0.2, 1, 0, 1,
-0.5306411, 0.07611118, -0.9037893, 0.1921569, 1, 0, 1,
-0.5237605, -0.447181, -2.934202, 0.1882353, 1, 0, 1,
-0.5234579, -0.9899556, -2.035616, 0.1803922, 1, 0, 1,
-0.5222837, 0.5184778, -1.236563, 0.1764706, 1, 0, 1,
-0.5206776, -1.250592, -4.510198, 0.1686275, 1, 0, 1,
-0.5189111, -2.310813, -2.713424, 0.1647059, 1, 0, 1,
-0.5181075, -0.9154718, -3.17095, 0.1568628, 1, 0, 1,
-0.5165328, -0.7024691, -3.622503, 0.1529412, 1, 0, 1,
-0.5159119, 0.3325706, -0.6686049, 0.145098, 1, 0, 1,
-0.5095884, -2.039041, -2.348981, 0.1411765, 1, 0, 1,
-0.5090498, -0.06607822, -2.740057, 0.1333333, 1, 0, 1,
-0.5078813, -1.221755, -3.087879, 0.1294118, 1, 0, 1,
-0.4963004, 2.068512, 1.050953, 0.1215686, 1, 0, 1,
-0.4878599, 0.1758937, -0.390249, 0.1176471, 1, 0, 1,
-0.4850576, 0.3695073, -0.7858823, 0.1098039, 1, 0, 1,
-0.48022, 1.143914, -0.2318426, 0.1058824, 1, 0, 1,
-0.4752938, 0.9459222, -0.5569261, 0.09803922, 1, 0, 1,
-0.472374, 0.341351, -2.254221, 0.09019608, 1, 0, 1,
-0.4719057, -0.2070027, -1.986314, 0.08627451, 1, 0, 1,
-0.4665182, 1.291489, 0.2644937, 0.07843138, 1, 0, 1,
-0.4645599, 0.4606699, 0.4510562, 0.07450981, 1, 0, 1,
-0.4539758, 0.475791, -1.457845, 0.06666667, 1, 0, 1,
-0.4518077, 0.1918946, -0.4401736, 0.0627451, 1, 0, 1,
-0.4470851, -1.775994, -3.097533, 0.05490196, 1, 0, 1,
-0.4415164, -0.9842788, -2.148145, 0.05098039, 1, 0, 1,
-0.4367788, -0.3895915, -2.129627, 0.04313726, 1, 0, 1,
-0.4317665, -0.5261385, -2.010784, 0.03921569, 1, 0, 1,
-0.4311784, -0.8711641, -3.75488, 0.03137255, 1, 0, 1,
-0.4292075, -0.4614408, -0.4033484, 0.02745098, 1, 0, 1,
-0.4229412, -0.6752485, -4.610126, 0.01960784, 1, 0, 1,
-0.4217233, -0.358369, -0.6197185, 0.01568628, 1, 0, 1,
-0.4195347, 0.08509849, -0.4943424, 0.007843138, 1, 0, 1,
-0.4156776, 0.4106731, -0.241476, 0.003921569, 1, 0, 1,
-0.414434, -0.1445761, -1.064423, 0, 1, 0.003921569, 1,
-0.4139421, -1.393919, -3.796518, 0, 1, 0.01176471, 1,
-0.408444, -1.426419, -4.726969, 0, 1, 0.01568628, 1,
-0.4046173, 1.664674, -0.1132087, 0, 1, 0.02352941, 1,
-0.4017604, -0.1526856, -1.937935, 0, 1, 0.02745098, 1,
-0.4014485, 0.9870445, -0.2557191, 0, 1, 0.03529412, 1,
-0.4006199, 0.8904998, 0.4920252, 0, 1, 0.03921569, 1,
-0.3998519, 0.01662392, -0.9590746, 0, 1, 0.04705882, 1,
-0.3891333, -0.4503101, -1.842972, 0, 1, 0.05098039, 1,
-0.3888572, 0.1694165, -0.2284658, 0, 1, 0.05882353, 1,
-0.3851063, -0.3844221, -2.192525, 0, 1, 0.0627451, 1,
-0.3825091, 1.351116, -1.890384, 0, 1, 0.07058824, 1,
-0.3820216, 0.8615802, 1.181182, 0, 1, 0.07450981, 1,
-0.3815319, 0.2815469, -1.297, 0, 1, 0.08235294, 1,
-0.3807358, 1.099913, -0.9881938, 0, 1, 0.08627451, 1,
-0.3805284, 2.492918, 1.717581, 0, 1, 0.09411765, 1,
-0.3747803, -1.850206, -2.16453, 0, 1, 0.1019608, 1,
-0.3733258, 0.03160651, -2.736723, 0, 1, 0.1058824, 1,
-0.3703835, 0.9381903, -1.751815, 0, 1, 0.1137255, 1,
-0.3579193, -0.1959786, 0.3537219, 0, 1, 0.1176471, 1,
-0.3574846, 0.3217757, -1.055802, 0, 1, 0.1254902, 1,
-0.3548512, -0.4805069, -3.371203, 0, 1, 0.1294118, 1,
-0.3530487, -0.1058236, -0.763076, 0, 1, 0.1372549, 1,
-0.3489688, 0.5867475, -0.6012883, 0, 1, 0.1411765, 1,
-0.3474659, 1.129778, -1.075153, 0, 1, 0.1490196, 1,
-0.3465564, -0.1459564, -2.350656, 0, 1, 0.1529412, 1,
-0.3464907, -0.8194708, -3.145705, 0, 1, 0.1607843, 1,
-0.342261, 2.327572, -0.7918184, 0, 1, 0.1647059, 1,
-0.3390505, -1.153835, -3.520983, 0, 1, 0.172549, 1,
-0.3359343, 1.486525, 0.5603372, 0, 1, 0.1764706, 1,
-0.3343333, -1.270883, -3.312289, 0, 1, 0.1843137, 1,
-0.3338171, -0.06802089, -3.480075, 0, 1, 0.1882353, 1,
-0.3315965, 1.914396, -0.9099757, 0, 1, 0.1960784, 1,
-0.3289953, 0.6201338, -2.458862, 0, 1, 0.2039216, 1,
-0.3277515, -1.782653, -2.306166, 0, 1, 0.2078431, 1,
-0.3258373, 1.231971, -1.643043, 0, 1, 0.2156863, 1,
-0.3213151, -0.3163362, -3.594704, 0, 1, 0.2196078, 1,
-0.3190052, -0.5290444, -2.633028, 0, 1, 0.227451, 1,
-0.3175397, 1.155902, -1.075338, 0, 1, 0.2313726, 1,
-0.3153146, -0.9562345, -2.723025, 0, 1, 0.2392157, 1,
-0.3133248, -2.59926, -3.411575, 0, 1, 0.2431373, 1,
-0.3129147, -1.166307, -2.122972, 0, 1, 0.2509804, 1,
-0.3120869, -0.6181625, -2.599057, 0, 1, 0.254902, 1,
-0.3092492, 1.909131, 0.7805205, 0, 1, 0.2627451, 1,
-0.3058317, -0.9555404, -1.52595, 0, 1, 0.2666667, 1,
-0.303717, 0.5079284, -1.94932, 0, 1, 0.2745098, 1,
-0.3001733, 1.766699, 1.095414, 0, 1, 0.2784314, 1,
-0.2977622, 1.834969, -0.4722216, 0, 1, 0.2862745, 1,
-0.2975044, -0.2270764, -2.746643, 0, 1, 0.2901961, 1,
-0.2959798, 1.068371, 1.091917, 0, 1, 0.2980392, 1,
-0.2949903, 0.1967497, -0.3224987, 0, 1, 0.3058824, 1,
-0.2867684, -0.4679979, -1.848093, 0, 1, 0.3098039, 1,
-0.2844126, 0.09621213, -1.752011, 0, 1, 0.3176471, 1,
-0.283389, -0.3158394, -2.432399, 0, 1, 0.3215686, 1,
-0.2821319, -0.5066006, -1.281818, 0, 1, 0.3294118, 1,
-0.2816144, -0.8838444, -3.316609, 0, 1, 0.3333333, 1,
-0.2743205, 0.2605006, 0.2470173, 0, 1, 0.3411765, 1,
-0.2741798, -0.5173766, -2.069621, 0, 1, 0.345098, 1,
-0.2720058, -0.2352705, -1.734622, 0, 1, 0.3529412, 1,
-0.2640269, -1.545114, -1.789215, 0, 1, 0.3568628, 1,
-0.2604153, -3.896445, -2.869009, 0, 1, 0.3647059, 1,
-0.2578856, -0.3937086, -2.193701, 0, 1, 0.3686275, 1,
-0.2536369, -1.483598, -3.704546, 0, 1, 0.3764706, 1,
-0.2517673, -0.7721298, -3.492887, 0, 1, 0.3803922, 1,
-0.2507598, 0.3492632, -1.918811, 0, 1, 0.3882353, 1,
-0.2458241, 0.6579093, -0.824466, 0, 1, 0.3921569, 1,
-0.2426211, 0.2131654, -1.028381, 0, 1, 0.4, 1,
-0.2396128, -0.07393263, -1.150846, 0, 1, 0.4078431, 1,
-0.2362208, -0.1782215, -1.353035, 0, 1, 0.4117647, 1,
-0.2361636, 1.457116, 0.650516, 0, 1, 0.4196078, 1,
-0.2359714, 0.5184571, -2.316308, 0, 1, 0.4235294, 1,
-0.2352345, -0.2191114, -1.533048, 0, 1, 0.4313726, 1,
-0.2326988, 1.337367, -1.467662, 0, 1, 0.4352941, 1,
-0.2306939, 1.025811, -1.154808, 0, 1, 0.4431373, 1,
-0.2301259, 1.027193, 2.024534, 0, 1, 0.4470588, 1,
-0.2229049, -1.306721, -3.219435, 0, 1, 0.454902, 1,
-0.2210506, 0.1795739, -1.239209, 0, 1, 0.4588235, 1,
-0.2185129, 0.439281, -0.4361359, 0, 1, 0.4666667, 1,
-0.2101302, 0.02775142, -0.5226786, 0, 1, 0.4705882, 1,
-0.2098901, -0.5991781, -2.830379, 0, 1, 0.4784314, 1,
-0.2087273, -0.8848109, -1.170892, 0, 1, 0.4823529, 1,
-0.2078904, 0.2879541, -0.108594, 0, 1, 0.4901961, 1,
-0.2071461, 1.834054, 0.1578295, 0, 1, 0.4941176, 1,
-0.2063078, -0.4461074, -2.508763, 0, 1, 0.5019608, 1,
-0.2057311, -0.7479994, -4.873135, 0, 1, 0.509804, 1,
-0.2054987, 2.192505, -0.2515183, 0, 1, 0.5137255, 1,
-0.2011155, -0.4309149, -2.854663, 0, 1, 0.5215687, 1,
-0.2007355, 1.68111, 0.2394162, 0, 1, 0.5254902, 1,
-0.1973866, -0.792208, -1.525752, 0, 1, 0.5333334, 1,
-0.1913645, -1.416389, -3.058134, 0, 1, 0.5372549, 1,
-0.185658, -0.6571535, -3.865804, 0, 1, 0.5450981, 1,
-0.1763518, -0.8336657, -0.07076776, 0, 1, 0.5490196, 1,
-0.1755678, 1.54398, 0.8670807, 0, 1, 0.5568628, 1,
-0.1752101, 0.7297963, 1.338051, 0, 1, 0.5607843, 1,
-0.1704125, 0.2838366, -0.577578, 0, 1, 0.5686275, 1,
-0.1672296, 1.554092, 0.7844738, 0, 1, 0.572549, 1,
-0.1622304, 1.57558, 0.1179211, 0, 1, 0.5803922, 1,
-0.1538619, 2.747855, 0.5687487, 0, 1, 0.5843138, 1,
-0.1530876, -2.101499, -4.192812, 0, 1, 0.5921569, 1,
-0.1486898, -0.5463601, -4.018745, 0, 1, 0.5960785, 1,
-0.1471452, -0.009601533, -3.387916, 0, 1, 0.6039216, 1,
-0.1404527, -0.269065, -2.142355, 0, 1, 0.6117647, 1,
-0.1386959, 1.319224, 1.117291, 0, 1, 0.6156863, 1,
-0.1385384, -0.7308134, -2.778836, 0, 1, 0.6235294, 1,
-0.1371699, 2.313051, -1.140137, 0, 1, 0.627451, 1,
-0.1357772, 2.744226, -0.6959733, 0, 1, 0.6352941, 1,
-0.1355481, 0.6061516, -0.3390233, 0, 1, 0.6392157, 1,
-0.1316135, -1.729785, -4.246236, 0, 1, 0.6470588, 1,
-0.1310334, 0.7010678, 2.010297, 0, 1, 0.6509804, 1,
-0.130489, 0.2730146, -2.657753, 0, 1, 0.6588235, 1,
-0.1292458, -0.4863422, -3.883958, 0, 1, 0.6627451, 1,
-0.1259217, -0.5592933, -3.804265, 0, 1, 0.6705883, 1,
-0.1257479, -0.4489309, -2.397207, 0, 1, 0.6745098, 1,
-0.1207344, -0.2202793, -2.14808, 0, 1, 0.682353, 1,
-0.1201814, 1.279786, 2.248694, 0, 1, 0.6862745, 1,
-0.11807, -0.1485589, -1.886086, 0, 1, 0.6941177, 1,
-0.1167141, 0.1287983, -3.00089, 0, 1, 0.7019608, 1,
-0.1145876, 0.4672041, 0.255894, 0, 1, 0.7058824, 1,
-0.110317, 0.2380399, -0.5056424, 0, 1, 0.7137255, 1,
-0.1094133, 0.801967, 0.2436179, 0, 1, 0.7176471, 1,
-0.1091787, 0.8380171, 1.737039, 0, 1, 0.7254902, 1,
-0.1074381, 0.4342817, -2.132727, 0, 1, 0.7294118, 1,
-0.1047, -1.47313, -2.738476, 0, 1, 0.7372549, 1,
-0.1026381, 0.5722932, 1.239297, 0, 1, 0.7411765, 1,
-0.09913315, -0.4567869, -2.561853, 0, 1, 0.7490196, 1,
-0.09635042, -1.859295, -3.713398, 0, 1, 0.7529412, 1,
-0.09508169, 0.4499658, -1.934646, 0, 1, 0.7607843, 1,
-0.093577, -0.2050197, -1.857162, 0, 1, 0.7647059, 1,
-0.09325778, -1.229975, -3.434377, 0, 1, 0.772549, 1,
-0.08827738, 0.5278823, -0.2568944, 0, 1, 0.7764706, 1,
-0.08681457, -0.8174817, -4.116268, 0, 1, 0.7843137, 1,
-0.08585662, 1.514308, 1.136466, 0, 1, 0.7882353, 1,
-0.0838019, -0.6253008, -4.523732, 0, 1, 0.7960784, 1,
-0.08055729, -0.1988306, -2.407339, 0, 1, 0.8039216, 1,
-0.07842871, -0.6815513, -2.544326, 0, 1, 0.8078431, 1,
-0.07643022, 0.2734125, -1.007359, 0, 1, 0.8156863, 1,
-0.07131039, 0.9302492, -0.1715565, 0, 1, 0.8196079, 1,
-0.06877442, -0.6230457, -2.099793, 0, 1, 0.827451, 1,
-0.06856952, 0.2845673, -1.711002, 0, 1, 0.8313726, 1,
-0.06837673, -0.08263437, -2.499872, 0, 1, 0.8392157, 1,
-0.06788334, 0.1138752, 0.7800373, 0, 1, 0.8431373, 1,
-0.06722943, -1.052622, -4.349411, 0, 1, 0.8509804, 1,
-0.0654928, 2.116522, -0.6545078, 0, 1, 0.854902, 1,
-0.06509451, 0.656428, 0.2144693, 0, 1, 0.8627451, 1,
-0.0641828, 0.7177384, 0.03354855, 0, 1, 0.8666667, 1,
-0.05241996, -1.744003, -4.642319, 0, 1, 0.8745098, 1,
-0.05232787, 0.4002049, -1.548717, 0, 1, 0.8784314, 1,
-0.05198033, -0.2625219, -4.946152, 0, 1, 0.8862745, 1,
-0.04588391, -0.8312367, -3.095789, 0, 1, 0.8901961, 1,
-0.04366081, -1.629831, -2.123429, 0, 1, 0.8980392, 1,
-0.03683196, -1.085873, -4.733255, 0, 1, 0.9058824, 1,
-0.03282439, -1.146284, -2.021528, 0, 1, 0.9098039, 1,
-0.0320741, -0.4229511, -3.328414, 0, 1, 0.9176471, 1,
-0.02809199, -0.1138574, -3.089505, 0, 1, 0.9215686, 1,
-0.02077163, -0.6359, -1.579057, 0, 1, 0.9294118, 1,
-0.02023527, -2.709378, -1.680335, 0, 1, 0.9333333, 1,
-0.01720726, 1.222726, -0.09509147, 0, 1, 0.9411765, 1,
-0.01401489, -0.3790674, -2.059438, 0, 1, 0.945098, 1,
-0.01052308, 2.860853, -0.2656068, 0, 1, 0.9529412, 1,
-0.0100626, 0.1681315, 1.902531, 0, 1, 0.9568627, 1,
-0.01001847, -0.4611111, -1.14293, 0, 1, 0.9647059, 1,
-0.003668365, -1.007171, -3.206506, 0, 1, 0.9686275, 1,
-0.00122627, -1.297099, -3.240743, 0, 1, 0.9764706, 1,
-0.0001684601, 2.601779, -0.9080443, 0, 1, 0.9803922, 1,
0.0005490035, -0.1331222, 3.942179, 0, 1, 0.9882353, 1,
0.003710898, 0.9438134, 0.3475319, 0, 1, 0.9921569, 1,
0.01151516, 0.168265, 0.6595445, 0, 1, 1, 1,
0.01407414, -1.084451, 4.080147, 0, 0.9921569, 1, 1,
0.01486818, 1.688772, -0.008801278, 0, 0.9882353, 1, 1,
0.0184436, 1.154881, 0.3653013, 0, 0.9803922, 1, 1,
0.01978297, -0.4149874, 4.147268, 0, 0.9764706, 1, 1,
0.02177291, -0.3321446, 2.278809, 0, 0.9686275, 1, 1,
0.02266181, -0.2839575, 2.822273, 0, 0.9647059, 1, 1,
0.02648504, 1.125964, 0.1669002, 0, 0.9568627, 1, 1,
0.03041332, 0.5719859, -0.8167621, 0, 0.9529412, 1, 1,
0.03093084, -0.2544601, 4.485596, 0, 0.945098, 1, 1,
0.0323485, 0.1782219, 1.841582, 0, 0.9411765, 1, 1,
0.03246991, -0.05364161, 1.437519, 0, 0.9333333, 1, 1,
0.03746163, 0.2652922, 0.01710589, 0, 0.9294118, 1, 1,
0.03951386, -0.5345911, 5.133986, 0, 0.9215686, 1, 1,
0.04135888, -0.35694, 3.452541, 0, 0.9176471, 1, 1,
0.04276007, -0.8785373, 4.483137, 0, 0.9098039, 1, 1,
0.04526798, 1.610299, 0.1852811, 0, 0.9058824, 1, 1,
0.04771857, 0.02811636, 1.640684, 0, 0.8980392, 1, 1,
0.04780072, -0.5297467, 4.118171, 0, 0.8901961, 1, 1,
0.05154496, 1.616853, 0.3522142, 0, 0.8862745, 1, 1,
0.05273097, -0.894539, 3.606352, 0, 0.8784314, 1, 1,
0.05505, 1.526207, -0.6340863, 0, 0.8745098, 1, 1,
0.05684086, -0.2417638, 1.143168, 0, 0.8666667, 1, 1,
0.05815267, -0.8032082, 4.071501, 0, 0.8627451, 1, 1,
0.05886637, -0.1509619, 2.967502, 0, 0.854902, 1, 1,
0.06161515, 1.669076, 0.006570051, 0, 0.8509804, 1, 1,
0.06608135, -0.7517209, 5.780648, 0, 0.8431373, 1, 1,
0.0713024, 1.005077, 2.435314, 0, 0.8392157, 1, 1,
0.07226511, -0.4987912, 2.409093, 0, 0.8313726, 1, 1,
0.07782455, 0.5016894, 0.6646109, 0, 0.827451, 1, 1,
0.07787634, 1.669949, 1.89536, 0, 0.8196079, 1, 1,
0.07913204, -0.5111988, 4.738355, 0, 0.8156863, 1, 1,
0.08015173, 0.8602877, 0.467626, 0, 0.8078431, 1, 1,
0.08698881, 0.5611943, 1.28056, 0, 0.8039216, 1, 1,
0.09034318, -0.7230586, 3.223267, 0, 0.7960784, 1, 1,
0.09382141, 0.8003156, -0.08495063, 0, 0.7882353, 1, 1,
0.09413175, 0.470155, 0.4140952, 0, 0.7843137, 1, 1,
0.09471059, -0.780987, 0.7238706, 0, 0.7764706, 1, 1,
0.09504155, 0.5924172, 0.2546741, 0, 0.772549, 1, 1,
0.09787486, -0.5776972, 2.117643, 0, 0.7647059, 1, 1,
0.0979025, 0.9493209, -0.2843822, 0, 0.7607843, 1, 1,
0.09794549, -0.04439246, 0.461816, 0, 0.7529412, 1, 1,
0.09868047, -0.4979897, 3.0351, 0, 0.7490196, 1, 1,
0.09889857, 0.5177062, 0.1481088, 0, 0.7411765, 1, 1,
0.100586, 0.6595869, 0.08024834, 0, 0.7372549, 1, 1,
0.1010253, 1.546605, 0.1559498, 0, 0.7294118, 1, 1,
0.1034466, 0.8744148, 0.002180137, 0, 0.7254902, 1, 1,
0.1087118, 0.6257509, 1.329685, 0, 0.7176471, 1, 1,
0.1104247, -0.01040017, 2.019747, 0, 0.7137255, 1, 1,
0.1116785, -0.3697087, 3.338331, 0, 0.7058824, 1, 1,
0.1143461, 0.7379529, 0.4242466, 0, 0.6980392, 1, 1,
0.1210364, -1.167251, 4.24599, 0, 0.6941177, 1, 1,
0.1225642, -1.89799, 4.763572, 0, 0.6862745, 1, 1,
0.131022, 0.7980113, -0.4541, 0, 0.682353, 1, 1,
0.134214, 0.1491366, 3.146107, 0, 0.6745098, 1, 1,
0.1380295, -1.736024, 1.802846, 0, 0.6705883, 1, 1,
0.1408705, -0.3690939, 3.438643, 0, 0.6627451, 1, 1,
0.1411891, 0.26176, 0.381802, 0, 0.6588235, 1, 1,
0.1460842, 0.1029548, 0.488162, 0, 0.6509804, 1, 1,
0.1466192, -0.6635051, 3.274025, 0, 0.6470588, 1, 1,
0.1527738, -1.201441, 2.968803, 0, 0.6392157, 1, 1,
0.1573931, -0.420466, 3.564205, 0, 0.6352941, 1, 1,
0.1583132, -0.001695853, 3.356183, 0, 0.627451, 1, 1,
0.1589733, 0.6532994, 0.1200721, 0, 0.6235294, 1, 1,
0.1660502, 0.3687821, 0.01616946, 0, 0.6156863, 1, 1,
0.1688844, 1.885408, -0.710754, 0, 0.6117647, 1, 1,
0.1696645, -0.6931801, 4.099011, 0, 0.6039216, 1, 1,
0.1700175, 0.9091139, 1.181379, 0, 0.5960785, 1, 1,
0.1800878, 1.077844, 0.9421472, 0, 0.5921569, 1, 1,
0.1817745, -0.3565999, 2.303019, 0, 0.5843138, 1, 1,
0.183017, 0.06759034, 1.434682, 0, 0.5803922, 1, 1,
0.1921197, 0.2641512, -1.624874, 0, 0.572549, 1, 1,
0.1921816, 0.04166564, -0.3328074, 0, 0.5686275, 1, 1,
0.1924528, 1.172744, 0.7520617, 0, 0.5607843, 1, 1,
0.195859, 2.017194, 0.1142201, 0, 0.5568628, 1, 1,
0.1967019, 2.437881, -0.4670984, 0, 0.5490196, 1, 1,
0.1989725, 0.7444189, 1.814176, 0, 0.5450981, 1, 1,
0.2042549, 0.6766809, 1.212945, 0, 0.5372549, 1, 1,
0.2046689, -0.3536185, 2.159708, 0, 0.5333334, 1, 1,
0.2064698, -2.201877, 3.853309, 0, 0.5254902, 1, 1,
0.2068363, -2.022145, 2.609723, 0, 0.5215687, 1, 1,
0.2096746, 0.4612148, 1.447521, 0, 0.5137255, 1, 1,
0.2112093, -0.3334332, 0.1784726, 0, 0.509804, 1, 1,
0.2149867, -0.7454937, 2.90696, 0, 0.5019608, 1, 1,
0.2158595, 0.2476075, 2.429663, 0, 0.4941176, 1, 1,
0.21601, 0.08536617, 1.07572, 0, 0.4901961, 1, 1,
0.2187254, -0.5909579, 2.740089, 0, 0.4823529, 1, 1,
0.2204432, 0.6484089, 0.7348927, 0, 0.4784314, 1, 1,
0.2220684, -0.3415379, 0.87342, 0, 0.4705882, 1, 1,
0.2236024, 1.046684, -0.4353963, 0, 0.4666667, 1, 1,
0.2240402, -0.381542, 1.788122, 0, 0.4588235, 1, 1,
0.2243778, -0.1714493, 2.83204, 0, 0.454902, 1, 1,
0.2280293, 1.353372, 1.243964, 0, 0.4470588, 1, 1,
0.2284756, -0.7455284, 2.279642, 0, 0.4431373, 1, 1,
0.2292995, -0.2641896, 2.552963, 0, 0.4352941, 1, 1,
0.23356, -1.352173, 2.792266, 0, 0.4313726, 1, 1,
0.2349243, -0.3920344, 1.918893, 0, 0.4235294, 1, 1,
0.2350468, 0.710865, 0.361483, 0, 0.4196078, 1, 1,
0.2353222, 0.5074204, -0.2099606, 0, 0.4117647, 1, 1,
0.2380879, 1.852627, 0.6634933, 0, 0.4078431, 1, 1,
0.2436864, -0.5508765, 1.74725, 0, 0.4, 1, 1,
0.2459633, 0.3551038, 0.8463354, 0, 0.3921569, 1, 1,
0.2467566, -0.7836947, 2.165973, 0, 0.3882353, 1, 1,
0.2488818, -0.7075832, 2.055775, 0, 0.3803922, 1, 1,
0.250914, 0.6805977, 1.142778, 0, 0.3764706, 1, 1,
0.2509367, 1.310077, 0.1017326, 0, 0.3686275, 1, 1,
0.2520019, -0.8131984, 2.491974, 0, 0.3647059, 1, 1,
0.2572859, 0.3494055, -1.598325, 0, 0.3568628, 1, 1,
0.2618958, -0.03363455, 1.75131, 0, 0.3529412, 1, 1,
0.2695059, -0.3665926, 1.099472, 0, 0.345098, 1, 1,
0.2696616, 1.38524, -0.8176283, 0, 0.3411765, 1, 1,
0.2747194, 0.6423017, 0.267338, 0, 0.3333333, 1, 1,
0.2760691, 0.6962281, -1.354411, 0, 0.3294118, 1, 1,
0.2776656, -0.9988086, 3.368218, 0, 0.3215686, 1, 1,
0.2842443, -0.1632566, 1.790174, 0, 0.3176471, 1, 1,
0.2910595, -0.5831605, 1.768483, 0, 0.3098039, 1, 1,
0.2913026, -1.17917, 3.168064, 0, 0.3058824, 1, 1,
0.2928201, -0.196339, 2.719492, 0, 0.2980392, 1, 1,
0.2949844, -1.186652, 3.965239, 0, 0.2901961, 1, 1,
0.2951961, -1.165998, 2.315063, 0, 0.2862745, 1, 1,
0.295685, -0.5486922, 3.159679, 0, 0.2784314, 1, 1,
0.29754, 0.1942721, 0.4431505, 0, 0.2745098, 1, 1,
0.3007125, -2.123472, 3.832895, 0, 0.2666667, 1, 1,
0.3025162, -1.19245, 3.064777, 0, 0.2627451, 1, 1,
0.3025894, 0.1646236, 1.2619, 0, 0.254902, 1, 1,
0.3026934, 2.139016, -1.98587, 0, 0.2509804, 1, 1,
0.3049237, 0.03588694, 1.412918, 0, 0.2431373, 1, 1,
0.3063841, -0.9012005, 2.209641, 0, 0.2392157, 1, 1,
0.3068414, -2.003902, 3.118581, 0, 0.2313726, 1, 1,
0.3144957, -1.571085, 2.637231, 0, 0.227451, 1, 1,
0.3210308, -0.9595134, 1.778333, 0, 0.2196078, 1, 1,
0.3230483, 1.030512, 0.01851427, 0, 0.2156863, 1, 1,
0.3313962, 0.5821397, 0.886201, 0, 0.2078431, 1, 1,
0.3317775, -0.4172296, 2.107592, 0, 0.2039216, 1, 1,
0.332675, 0.9991367, -1.062167, 0, 0.1960784, 1, 1,
0.3348306, -2.153159, 4.909517, 0, 0.1882353, 1, 1,
0.3352742, 0.954416, 1.06036, 0, 0.1843137, 1, 1,
0.3402249, -0.5639288, 1.835365, 0, 0.1764706, 1, 1,
0.3456666, -2.146837, 3.612126, 0, 0.172549, 1, 1,
0.3524021, 2.259079, 0.6229573, 0, 0.1647059, 1, 1,
0.3546868, -0.8981032, 2.666751, 0, 0.1607843, 1, 1,
0.3632592, -0.6317295, 5.250835, 0, 0.1529412, 1, 1,
0.3674289, -0.6811819, 3.019812, 0, 0.1490196, 1, 1,
0.3725858, -0.9590043, 3.800292, 0, 0.1411765, 1, 1,
0.3729925, 0.3211228, 1.358568, 0, 0.1372549, 1, 1,
0.37758, -0.1064744, 0.9333395, 0, 0.1294118, 1, 1,
0.3789423, 1.477039, 1.106089, 0, 0.1254902, 1, 1,
0.3796286, 1.081667, 1.7314, 0, 0.1176471, 1, 1,
0.3826982, 0.2569749, 0.4166268, 0, 0.1137255, 1, 1,
0.3853216, 1.335279, -0.02119066, 0, 0.1058824, 1, 1,
0.385788, -0.03103129, 1.348251, 0, 0.09803922, 1, 1,
0.389518, 0.7201463, 0.2714718, 0, 0.09411765, 1, 1,
0.3923963, -0.2261332, 1.384518, 0, 0.08627451, 1, 1,
0.3982357, -0.9504657, 2.377952, 0, 0.08235294, 1, 1,
0.4029669, 0.8591921, -0.4328374, 0, 0.07450981, 1, 1,
0.4087181, -0.4098067, 1.214931, 0, 0.07058824, 1, 1,
0.4120541, -2.181093, 3.178109, 0, 0.0627451, 1, 1,
0.4131656, 0.0254846, 0.8051628, 0, 0.05882353, 1, 1,
0.4165201, -1.175026, 3.689461, 0, 0.05098039, 1, 1,
0.4218723, 0.8160319, 1.287519, 0, 0.04705882, 1, 1,
0.4227711, 1.08468, 0.03822533, 0, 0.03921569, 1, 1,
0.4291616, 0.2478264, 1.423387, 0, 0.03529412, 1, 1,
0.4300606, -1.385363, 4.121942, 0, 0.02745098, 1, 1,
0.4318253, 0.563671, 0.812092, 0, 0.02352941, 1, 1,
0.4330721, 0.02593343, 1.173842, 0, 0.01568628, 1, 1,
0.4382704, -1.414238, 2.675527, 0, 0.01176471, 1, 1,
0.4396739, -1.282375, 3.529202, 0, 0.003921569, 1, 1,
0.4466358, 0.01352677, 1.849723, 0.003921569, 0, 1, 1,
0.4472479, -1.824077, 1.782088, 0.007843138, 0, 1, 1,
0.4486205, -0.2782178, 0.1288708, 0.01568628, 0, 1, 1,
0.449892, 0.1659927, 1.240955, 0.01960784, 0, 1, 1,
0.4542305, -0.7355272, 2.775007, 0.02745098, 0, 1, 1,
0.4550181, -0.6771435, 2.526, 0.03137255, 0, 1, 1,
0.4611884, -0.650906, 2.699443, 0.03921569, 0, 1, 1,
0.4627653, 1.282555, 0.6986246, 0.04313726, 0, 1, 1,
0.463837, 1.25659, -1.401396, 0.05098039, 0, 1, 1,
0.4657333, 0.8212326, 3.075286, 0.05490196, 0, 1, 1,
0.4678905, -0.3559911, 3.167327, 0.0627451, 0, 1, 1,
0.4822296, 2.48865, 0.2545605, 0.06666667, 0, 1, 1,
0.4838751, 0.7487589, -1.114915, 0.07450981, 0, 1, 1,
0.4908518, -0.4930194, 2.361098, 0.07843138, 0, 1, 1,
0.494453, 0.1751239, 1.500338, 0.08627451, 0, 1, 1,
0.5002381, 0.7838244, 0.2156706, 0.09019608, 0, 1, 1,
0.5010914, 0.5002409, 1.913245, 0.09803922, 0, 1, 1,
0.5044125, 0.1805395, -0.04989463, 0.1058824, 0, 1, 1,
0.5084675, 0.5067545, -1.124832, 0.1098039, 0, 1, 1,
0.5108602, 0.8712461, 0.8689148, 0.1176471, 0, 1, 1,
0.511216, -0.9311063, 3.353212, 0.1215686, 0, 1, 1,
0.5114589, 0.4122485, 1.000878, 0.1294118, 0, 1, 1,
0.5142668, 0.3173819, 0.4073582, 0.1333333, 0, 1, 1,
0.5153254, 0.4790952, 1.826588, 0.1411765, 0, 1, 1,
0.5215483, -0.8402386, 3.553367, 0.145098, 0, 1, 1,
0.5221717, 0.405267, -0.1297397, 0.1529412, 0, 1, 1,
0.5226534, 0.3481278, 1.38054, 0.1568628, 0, 1, 1,
0.5233453, 0.3250615, 1.510124, 0.1647059, 0, 1, 1,
0.5257298, -0.02589258, 0.3680226, 0.1686275, 0, 1, 1,
0.5270545, -0.5924507, 4.621903, 0.1764706, 0, 1, 1,
0.5274224, 0.3311975, -0.2367948, 0.1803922, 0, 1, 1,
0.5285327, -0.4662109, 3.880304, 0.1882353, 0, 1, 1,
0.528534, -2.470248, 4.112364, 0.1921569, 0, 1, 1,
0.5334464, -0.5017261, 2.647381, 0.2, 0, 1, 1,
0.5366526, 1.689635, 0.1260373, 0.2078431, 0, 1, 1,
0.5368931, 0.1043345, 1.208711, 0.2117647, 0, 1, 1,
0.5397031, -1.260228, 3.415092, 0.2196078, 0, 1, 1,
0.5428624, 0.500635, -0.2055493, 0.2235294, 0, 1, 1,
0.5485949, -0.3853441, 1.59809, 0.2313726, 0, 1, 1,
0.5512729, 0.1155819, 1.412477, 0.2352941, 0, 1, 1,
0.5515574, -1.023986, 2.523931, 0.2431373, 0, 1, 1,
0.5575167, -2.199416, 3.447335, 0.2470588, 0, 1, 1,
0.5584227, 0.8372908, 0.4582647, 0.254902, 0, 1, 1,
0.5603283, -0.2703717, 1.321009, 0.2588235, 0, 1, 1,
0.5604053, 1.5118, -0.01446379, 0.2666667, 0, 1, 1,
0.5604144, -0.2165405, 2.161226, 0.2705882, 0, 1, 1,
0.5667331, -1.533756, 1.977845, 0.2784314, 0, 1, 1,
0.5692807, 0.006137011, 3.151932, 0.282353, 0, 1, 1,
0.5779051, -0.178744, 2.111754, 0.2901961, 0, 1, 1,
0.5831843, -0.8519459, 1.979777, 0.2941177, 0, 1, 1,
0.5832227, 0.8998733, -1.201067, 0.3019608, 0, 1, 1,
0.5853471, 0.8290433, -0.2692114, 0.3098039, 0, 1, 1,
0.5867419, 0.8478737, 1.440986, 0.3137255, 0, 1, 1,
0.5867509, 1.035286, 1.067611, 0.3215686, 0, 1, 1,
0.587962, 1.986642, -0.2623269, 0.3254902, 0, 1, 1,
0.5945216, 0.7921719, 1.2939, 0.3333333, 0, 1, 1,
0.5947402, -0.02779064, 0.3900394, 0.3372549, 0, 1, 1,
0.5972162, 1.005112, -0.2107491, 0.345098, 0, 1, 1,
0.5977823, 0.1258642, 1.136799, 0.3490196, 0, 1, 1,
0.5979427, 0.001594652, 2.436079, 0.3568628, 0, 1, 1,
0.5994236, 0.4049257, 0.2613492, 0.3607843, 0, 1, 1,
0.6003383, 1.425054, 0.124758, 0.3686275, 0, 1, 1,
0.6006669, 0.3244858, 0.9578454, 0.372549, 0, 1, 1,
0.6029598, -0.530967, 1.06762, 0.3803922, 0, 1, 1,
0.6052186, -0.4297971, 2.295026, 0.3843137, 0, 1, 1,
0.6059468, -0.3981862, 2.413849, 0.3921569, 0, 1, 1,
0.6098719, 0.07005807, 1.184045, 0.3960784, 0, 1, 1,
0.6100127, 1.838362, 1.071189, 0.4039216, 0, 1, 1,
0.6130746, -0.6538985, 2.400314, 0.4117647, 0, 1, 1,
0.624549, 0.08237776, 3.170058, 0.4156863, 0, 1, 1,
0.6281003, 0.4101893, -0.4100583, 0.4235294, 0, 1, 1,
0.6386226, -0.7291229, 1.740555, 0.427451, 0, 1, 1,
0.6389095, -0.311769, 1.671467, 0.4352941, 0, 1, 1,
0.6412991, 1.391352, 1.299372, 0.4392157, 0, 1, 1,
0.6414873, -0.8189572, 1.074014, 0.4470588, 0, 1, 1,
0.6427069, 2.775797, 0.6163303, 0.4509804, 0, 1, 1,
0.642715, -1.41295, 2.828822, 0.4588235, 0, 1, 1,
0.6525422, -0.4817313, 0.3052878, 0.4627451, 0, 1, 1,
0.6532464, 0.1426545, 1.921253, 0.4705882, 0, 1, 1,
0.6591578, -1.130741, 2.133269, 0.4745098, 0, 1, 1,
0.6666167, -0.4255234, 1.022902, 0.4823529, 0, 1, 1,
0.6700808, 1.184428, -0.3488437, 0.4862745, 0, 1, 1,
0.6717451, 0.9130937, 0.7537619, 0.4941176, 0, 1, 1,
0.6766039, 0.759172, 1.950041, 0.5019608, 0, 1, 1,
0.6771563, -0.1616103, 1.141882, 0.5058824, 0, 1, 1,
0.6802349, -0.02248742, 2.029366, 0.5137255, 0, 1, 1,
0.6806222, -0.181051, -0.01185614, 0.5176471, 0, 1, 1,
0.6824818, -0.5297795, 0.9350989, 0.5254902, 0, 1, 1,
0.6827533, -1.911497, 3.747185, 0.5294118, 0, 1, 1,
0.6870422, -0.1607328, -0.01088269, 0.5372549, 0, 1, 1,
0.6896442, 0.7605969, 0.1942664, 0.5411765, 0, 1, 1,
0.6921834, 0.7009919, 0.3691295, 0.5490196, 0, 1, 1,
0.699764, -0.1030605, 2.166943, 0.5529412, 0, 1, 1,
0.7039642, -1.857563, 3.69267, 0.5607843, 0, 1, 1,
0.7103493, 0.7725297, 0.1342894, 0.5647059, 0, 1, 1,
0.7109662, -0.6157628, 0.7969159, 0.572549, 0, 1, 1,
0.7115495, -0.572043, 1.900973, 0.5764706, 0, 1, 1,
0.7124431, 0.9918801, 2.197509, 0.5843138, 0, 1, 1,
0.7145692, 1.173995, 0.2032448, 0.5882353, 0, 1, 1,
0.7183295, 0.750828, -0.8714674, 0.5960785, 0, 1, 1,
0.7185397, -0.4529994, 2.610375, 0.6039216, 0, 1, 1,
0.7250593, 0.06069428, 3.241029, 0.6078432, 0, 1, 1,
0.7306452, 0.196771, 2.198152, 0.6156863, 0, 1, 1,
0.7310191, -0.8109993, 2.900065, 0.6196079, 0, 1, 1,
0.7374526, -1.067587, 2.91996, 0.627451, 0, 1, 1,
0.7402569, 0.1841432, 1.807034, 0.6313726, 0, 1, 1,
0.7467541, 0.8785511, 0.01812058, 0.6392157, 0, 1, 1,
0.7481609, 0.4086701, -0.1569693, 0.6431373, 0, 1, 1,
0.7502552, -0.2608641, 4.194619, 0.6509804, 0, 1, 1,
0.7511199, 1.64478, 0.7412273, 0.654902, 0, 1, 1,
0.7563104, 0.1691778, 3.362411, 0.6627451, 0, 1, 1,
0.762121, -0.366095, 3.43602, 0.6666667, 0, 1, 1,
0.7635899, -0.4082103, 2.782135, 0.6745098, 0, 1, 1,
0.7638444, -0.8312361, 1.383981, 0.6784314, 0, 1, 1,
0.7732833, 1.390174, 0.5265595, 0.6862745, 0, 1, 1,
0.7805369, 0.1202566, 2.258126, 0.6901961, 0, 1, 1,
0.7858368, 0.8549581, -0.7742443, 0.6980392, 0, 1, 1,
0.7859338, 2.278468, 1.311842, 0.7058824, 0, 1, 1,
0.7898888, 0.6171117, 0.9057825, 0.7098039, 0, 1, 1,
0.7967256, -0.2356588, -0.4101818, 0.7176471, 0, 1, 1,
0.7993401, -1.037524, 0.7335644, 0.7215686, 0, 1, 1,
0.8015474, -1.17238, 2.940864, 0.7294118, 0, 1, 1,
0.8020037, -0.07637589, 2.309029, 0.7333333, 0, 1, 1,
0.805879, 0.7130191, 2.082555, 0.7411765, 0, 1, 1,
0.8100165, -2.745279, 4.636614, 0.7450981, 0, 1, 1,
0.8160456, 0.1243989, 1.252215, 0.7529412, 0, 1, 1,
0.8173002, -1.839789, 2.251975, 0.7568628, 0, 1, 1,
0.8244072, 2.14475, -0.7280181, 0.7647059, 0, 1, 1,
0.8250595, -0.2870192, 2.088609, 0.7686275, 0, 1, 1,
0.8285891, -1.852449, 3.116737, 0.7764706, 0, 1, 1,
0.8311618, 1.076684, -0.9136636, 0.7803922, 0, 1, 1,
0.8352256, -0.1741561, 1.089634, 0.7882353, 0, 1, 1,
0.8407331, 0.147494, 3.947145, 0.7921569, 0, 1, 1,
0.8423927, -0.003113402, 3.206374, 0.8, 0, 1, 1,
0.8426831, 0.3098742, 1.619455, 0.8078431, 0, 1, 1,
0.8441623, 0.5358216, 0.8730201, 0.8117647, 0, 1, 1,
0.8447199, -1.399606, 2.539143, 0.8196079, 0, 1, 1,
0.8459947, -0.2197501, 4.673168, 0.8235294, 0, 1, 1,
0.8473974, -1.022038, 3.361445, 0.8313726, 0, 1, 1,
0.8551039, -0.5070287, 3.406601, 0.8352941, 0, 1, 1,
0.855749, 1.042088, 0.2383379, 0.8431373, 0, 1, 1,
0.8593498, -1.497859, 2.036103, 0.8470588, 0, 1, 1,
0.8664501, -0.5287103, 0.5352187, 0.854902, 0, 1, 1,
0.8701554, 0.1424798, 0.8825468, 0.8588235, 0, 1, 1,
0.8752423, -0.7832048, 1.958777, 0.8666667, 0, 1, 1,
0.8766709, -0.4837517, 2.157867, 0.8705882, 0, 1, 1,
0.879011, 0.2178459, 2.50613, 0.8784314, 0, 1, 1,
0.8843023, -1.955301, 2.809404, 0.8823529, 0, 1, 1,
0.8849148, 0.3278008, -0.07475223, 0.8901961, 0, 1, 1,
0.8913034, -0.3675939, 1.773862, 0.8941177, 0, 1, 1,
0.8931342, -0.9418676, 3.013163, 0.9019608, 0, 1, 1,
0.9044924, -2.649484, 1.883879, 0.9098039, 0, 1, 1,
0.9093755, 0.9548622, 1.215852, 0.9137255, 0, 1, 1,
0.9134994, 0.2595304, 1.420844, 0.9215686, 0, 1, 1,
0.9223331, 1.020174, 0.3215131, 0.9254902, 0, 1, 1,
0.9265209, 0.3986228, 1.251802, 0.9333333, 0, 1, 1,
0.9341342, 0.621855, 0.7792082, 0.9372549, 0, 1, 1,
0.9345872, -0.2924534, 2.971751, 0.945098, 0, 1, 1,
0.9356647, 0.2875511, 2.190942, 0.9490196, 0, 1, 1,
0.9364511, 0.1789597, 2.074588, 0.9568627, 0, 1, 1,
0.9373175, -0.4652262, 1.874041, 0.9607843, 0, 1, 1,
0.9423323, -1.753847, 2.086329, 0.9686275, 0, 1, 1,
0.9460861, 0.5750862, -0.05218609, 0.972549, 0, 1, 1,
0.9495415, 0.4810174, 1.101698, 0.9803922, 0, 1, 1,
0.954989, -0.5147378, 2.300814, 0.9843137, 0, 1, 1,
0.9576384, 0.8811277, -0.2400872, 0.9921569, 0, 1, 1,
0.9610931, -1.182422, 3.880925, 0.9960784, 0, 1, 1,
0.9655952, 0.4463171, 1.826907, 1, 0, 0.9960784, 1,
0.9754527, 0.9424822, 1.420484, 1, 0, 0.9882353, 1,
0.9790837, -0.09099621, 2.56474, 1, 0, 0.9843137, 1,
0.9796854, -0.7981638, 2.282898, 1, 0, 0.9764706, 1,
0.9797716, 0.01890112, 1.24655, 1, 0, 0.972549, 1,
1.001925, 0.7023857, 0.518786, 1, 0, 0.9647059, 1,
1.005111, -1.050207, 2.714256, 1, 0, 0.9607843, 1,
1.026079, -0.3897879, 3.23586, 1, 0, 0.9529412, 1,
1.027695, 1.569497, 1.584148, 1, 0, 0.9490196, 1,
1.028585, -2.303542, 2.883038, 1, 0, 0.9411765, 1,
1.031244, 1.277105, 0.1990867, 1, 0, 0.9372549, 1,
1.033753, 0.4785263, 0.8324468, 1, 0, 0.9294118, 1,
1.033999, -0.7366458, 3.764285, 1, 0, 0.9254902, 1,
1.035445, -0.5839566, 0.1663817, 1, 0, 0.9176471, 1,
1.036386, 0.5201578, 0.4959311, 1, 0, 0.9137255, 1,
1.044423, 0.5799214, 1.740183, 1, 0, 0.9058824, 1,
1.048392, -0.8846824, 1.879301, 1, 0, 0.9019608, 1,
1.04906, -0.2270831, -0.3588266, 1, 0, 0.8941177, 1,
1.050165, 0.8572552, 1.073116, 1, 0, 0.8862745, 1,
1.05097, 0.4127669, 1.959921, 1, 0, 0.8823529, 1,
1.05444, 0.2590328, 1.703386, 1, 0, 0.8745098, 1,
1.054668, -1.201726, 3.178991, 1, 0, 0.8705882, 1,
1.05581, -0.02220341, 4.938631, 1, 0, 0.8627451, 1,
1.061087, 0.1748694, 0.7293432, 1, 0, 0.8588235, 1,
1.067091, -0.6924601, 2.105285, 1, 0, 0.8509804, 1,
1.081046, 0.2375818, 0.4617928, 1, 0, 0.8470588, 1,
1.082883, 0.4660987, 1.096444, 1, 0, 0.8392157, 1,
1.091784, -0.1356423, 1.06541, 1, 0, 0.8352941, 1,
1.097578, -0.9134164, 2.321988, 1, 0, 0.827451, 1,
1.098242, 1.17193, 1.944499, 1, 0, 0.8235294, 1,
1.118501, 0.09686199, 0.7391865, 1, 0, 0.8156863, 1,
1.121271, 1.012561, 0.5326892, 1, 0, 0.8117647, 1,
1.122639, 0.2385946, -0.07461788, 1, 0, 0.8039216, 1,
1.125772, -0.03090376, 2.512357, 1, 0, 0.7960784, 1,
1.129618, -0.5317535, 1.525339, 1, 0, 0.7921569, 1,
1.1298, 0.2148355, 2.039911, 1, 0, 0.7843137, 1,
1.130611, 0.1281856, 3.664572, 1, 0, 0.7803922, 1,
1.136372, -2.37265, 4.20496, 1, 0, 0.772549, 1,
1.141514, -1.217664, 1.392391, 1, 0, 0.7686275, 1,
1.14579, 0.02488787, 1.73686, 1, 0, 0.7607843, 1,
1.147288, -1.099028, 1.825964, 1, 0, 0.7568628, 1,
1.153819, 1.319271, -1.840096, 1, 0, 0.7490196, 1,
1.155422, 0.150189, 2.01957, 1, 0, 0.7450981, 1,
1.190634, -1.757366, 2.289361, 1, 0, 0.7372549, 1,
1.193325, 0.9513208, 1.464562, 1, 0, 0.7333333, 1,
1.218699, -1.818148, 5.004774, 1, 0, 0.7254902, 1,
1.22736, 1.278337, 0.1037742, 1, 0, 0.7215686, 1,
1.227497, 1.427224, 0.974691, 1, 0, 0.7137255, 1,
1.235334, 0.01203153, 0.8953822, 1, 0, 0.7098039, 1,
1.246238, 0.4517983, 1.370689, 1, 0, 0.7019608, 1,
1.249316, 0.6262004, 0.4377053, 1, 0, 0.6941177, 1,
1.250708, 0.1001377, 2.312854, 1, 0, 0.6901961, 1,
1.254507, 0.5319072, 0.7067125, 1, 0, 0.682353, 1,
1.263077, -0.3223369, 0.8818734, 1, 0, 0.6784314, 1,
1.265725, -0.09613251, 1.835064, 1, 0, 0.6705883, 1,
1.268614, 1.162165, 1.99129, 1, 0, 0.6666667, 1,
1.272005, -0.3033698, 1.132669, 1, 0, 0.6588235, 1,
1.27817, 0.09251862, 2.520549, 1, 0, 0.654902, 1,
1.27947, 2.375288, 1.432396, 1, 0, 0.6470588, 1,
1.281218, 0.0584784, 1.269224, 1, 0, 0.6431373, 1,
1.282001, 0.1197458, 0.6160107, 1, 0, 0.6352941, 1,
1.287506, -0.08314356, -1.710006, 1, 0, 0.6313726, 1,
1.288082, 0.4787744, 2.237042, 1, 0, 0.6235294, 1,
1.294068, 0.3224207, 0.1127872, 1, 0, 0.6196079, 1,
1.295406, -0.05495696, 1.29432, 1, 0, 0.6117647, 1,
1.295533, -0.6602468, 1.704105, 1, 0, 0.6078432, 1,
1.299373, -0.283252, 0.966476, 1, 0, 0.6, 1,
1.312843, 0.4118144, 1.907851, 1, 0, 0.5921569, 1,
1.313183, -0.3915884, 2.184165, 1, 0, 0.5882353, 1,
1.315482, 0.1776436, 1.403745, 1, 0, 0.5803922, 1,
1.317839, 0.4395905, 2.464031, 1, 0, 0.5764706, 1,
1.322878, -0.2843762, 2.641668, 1, 0, 0.5686275, 1,
1.328096, 0.05886237, 2.716405, 1, 0, 0.5647059, 1,
1.328718, 0.4982773, 2.421402, 1, 0, 0.5568628, 1,
1.364742, 0.6757029, 1.084078, 1, 0, 0.5529412, 1,
1.36526, 0.3163374, 1.937698, 1, 0, 0.5450981, 1,
1.375276, -0.3878399, 1.728003, 1, 0, 0.5411765, 1,
1.379277, -0.2697605, 1.843368, 1, 0, 0.5333334, 1,
1.393358, 0.3814429, 0.1050795, 1, 0, 0.5294118, 1,
1.395741, -0.1440117, -0.1449827, 1, 0, 0.5215687, 1,
1.40389, 0.9871714, 1.351609, 1, 0, 0.5176471, 1,
1.423374, -0.5282955, 2.096117, 1, 0, 0.509804, 1,
1.424772, -0.2029481, 0.07264621, 1, 0, 0.5058824, 1,
1.432088, -1.441847, 3.867321, 1, 0, 0.4980392, 1,
1.432695, -0.8876504, 1.866249, 1, 0, 0.4901961, 1,
1.433704, -0.6880426, 0.9545837, 1, 0, 0.4862745, 1,
1.434676, -0.7866381, 2.101916, 1, 0, 0.4784314, 1,
1.440426, 0.3438667, 2.843611, 1, 0, 0.4745098, 1,
1.441125, 0.2568366, 1.614725, 1, 0, 0.4666667, 1,
1.441993, -1.551119, 1.097568, 1, 0, 0.4627451, 1,
1.454217, 0.8680571, 0.3353143, 1, 0, 0.454902, 1,
1.460268, 0.02011571, 1.332516, 1, 0, 0.4509804, 1,
1.467884, -0.387732, 2.477366, 1, 0, 0.4431373, 1,
1.481253, 1.069093, 0.06653782, 1, 0, 0.4392157, 1,
1.485817, 0.8959274, 1.51112, 1, 0, 0.4313726, 1,
1.502357, 1.83511, -0.4066892, 1, 0, 0.427451, 1,
1.51202, 1.530744, 0.9350528, 1, 0, 0.4196078, 1,
1.525841, 0.02502182, 2.507806, 1, 0, 0.4156863, 1,
1.527061, -0.445378, 1.720809, 1, 0, 0.4078431, 1,
1.536779, -0.1474393, 2.408285, 1, 0, 0.4039216, 1,
1.545511, -0.5685809, 1.146642, 1, 0, 0.3960784, 1,
1.546434, 0.7935473, 1.795539, 1, 0, 0.3882353, 1,
1.549193, -0.7158488, 1.971997, 1, 0, 0.3843137, 1,
1.551174, -0.4465601, 2.170154, 1, 0, 0.3764706, 1,
1.56027, 0.29875, 0.8871238, 1, 0, 0.372549, 1,
1.563887, 0.9158227, 1.624652, 1, 0, 0.3647059, 1,
1.564511, 0.4553481, 0.8260748, 1, 0, 0.3607843, 1,
1.580225, 2.776482, 1.174277, 1, 0, 0.3529412, 1,
1.589015, -0.9050394, 2.499685, 1, 0, 0.3490196, 1,
1.594403, -0.8231809, 2.905221, 1, 0, 0.3411765, 1,
1.602165, 0.2074019, 1.761654, 1, 0, 0.3372549, 1,
1.606722, -1.480034, 3.591813, 1, 0, 0.3294118, 1,
1.609985, -1.752037, 2.804383, 1, 0, 0.3254902, 1,
1.622996, 0.5897557, 0.7670476, 1, 0, 0.3176471, 1,
1.623386, -0.07566038, 1.710444, 1, 0, 0.3137255, 1,
1.637624, 0.3621009, 1.119586, 1, 0, 0.3058824, 1,
1.644365, -0.7387556, 2.142129, 1, 0, 0.2980392, 1,
1.647952, 1.0301, 1.02827, 1, 0, 0.2941177, 1,
1.652202, 2.578233, 1.502876, 1, 0, 0.2862745, 1,
1.656822, -0.1454291, 0.4129895, 1, 0, 0.282353, 1,
1.668188, 0.9408524, 0.03464582, 1, 0, 0.2745098, 1,
1.676699, 1.527955, 0.4456844, 1, 0, 0.2705882, 1,
1.680761, 0.1113712, 3.149603, 1, 0, 0.2627451, 1,
1.685896, -0.705206, 3.702207, 1, 0, 0.2588235, 1,
1.706207, -0.5607696, 2.888694, 1, 0, 0.2509804, 1,
1.712375, 0.08741275, 2.769596, 1, 0, 0.2470588, 1,
1.718856, -0.2650769, 0.9921159, 1, 0, 0.2392157, 1,
1.722622, 1.841652, 0.7541323, 1, 0, 0.2352941, 1,
1.732219, 1.773912, 0.7726774, 1, 0, 0.227451, 1,
1.732868, 0.7545972, 1.426358, 1, 0, 0.2235294, 1,
1.766523, 0.6097485, 1.506793, 1, 0, 0.2156863, 1,
1.782017, -0.02197181, 1.919906, 1, 0, 0.2117647, 1,
1.817156, 1.787022, 0.3835112, 1, 0, 0.2039216, 1,
1.821499, 0.5887772, 1.454641, 1, 0, 0.1960784, 1,
1.835109, 0.07121421, 1.955311, 1, 0, 0.1921569, 1,
1.844789, -0.5984831, 2.567465, 1, 0, 0.1843137, 1,
1.864549, 0.6857574, 2.089824, 1, 0, 0.1803922, 1,
1.891502, 1.774811, -0.7442252, 1, 0, 0.172549, 1,
1.92843, -0.4871356, 1.593392, 1, 0, 0.1686275, 1,
1.929665, 0.7296575, 1.015052, 1, 0, 0.1607843, 1,
1.938576, 0.2866198, 2.032957, 1, 0, 0.1568628, 1,
1.979765, -0.6179493, 1.048854, 1, 0, 0.1490196, 1,
1.991885, -0.5192422, 2.147572, 1, 0, 0.145098, 1,
1.992525, 1.186867, 0.4603481, 1, 0, 0.1372549, 1,
1.995785, -0.004118999, 1.475598, 1, 0, 0.1333333, 1,
2.05437, 0.1480098, 1.944255, 1, 0, 0.1254902, 1,
2.093566, 1.130398, 0.08596269, 1, 0, 0.1215686, 1,
2.128326, -1.825228, 1.608106, 1, 0, 0.1137255, 1,
2.131833, -1.452657, 3.059535, 1, 0, 0.1098039, 1,
2.144092, 1.306755, 0.8622547, 1, 0, 0.1019608, 1,
2.22565, -0.09242332, 0.9075581, 1, 0, 0.09411765, 1,
2.261992, -0.8987099, 2.426435, 1, 0, 0.09019608, 1,
2.265037, 0.5450343, 1.038038, 1, 0, 0.08235294, 1,
2.269215, 0.5116357, 1.92739, 1, 0, 0.07843138, 1,
2.323384, -0.2813983, 2.406381, 1, 0, 0.07058824, 1,
2.329307, -0.7040483, 1.387871, 1, 0, 0.06666667, 1,
2.34098, -0.2613521, 3.661163, 1, 0, 0.05882353, 1,
2.407935, -0.6982206, 2.382217, 1, 0, 0.05490196, 1,
2.597316, -1.628157, 2.036568, 1, 0, 0.04705882, 1,
2.602174, -0.01921223, 2.834675, 1, 0, 0.04313726, 1,
2.702517, 1.390111, 1.466372, 1, 0, 0.03529412, 1,
2.785029, 0.5096856, -0.8407753, 1, 0, 0.03137255, 1,
2.82496, -0.9838631, 1.46478, 1, 0, 0.02352941, 1,
2.844321, 0.05645197, 0.7732897, 1, 0, 0.01960784, 1,
3.123064, 1.073499, 2.143936, 1, 0, 0.01176471, 1,
3.178975, -0.469702, 2.902717, 1, 0, 0.007843138, 1
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
-0.01784909, -5.041806, -6.984833, 0, -0.5, 0.5, 0.5,
-0.01784909, -5.041806, -6.984833, 1, -0.5, 0.5, 0.5,
-0.01784909, -5.041806, -6.984833, 1, 1.5, 0.5, 0.5,
-0.01784909, -5.041806, -6.984833, 0, 1.5, 0.5, 0.5
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
-4.298397, -0.5177959, -6.984833, 0, -0.5, 0.5, 0.5,
-4.298397, -0.5177959, -6.984833, 1, -0.5, 0.5, 0.5,
-4.298397, -0.5177959, -6.984833, 1, 1.5, 0.5, 0.5,
-4.298397, -0.5177959, -6.984833, 0, 1.5, 0.5, 0.5
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
-4.298397, -5.041806, 0.3229816, 0, -0.5, 0.5, 0.5,
-4.298397, -5.041806, 0.3229816, 1, -0.5, 0.5, 0.5,
-4.298397, -5.041806, 0.3229816, 1, 1.5, 0.5, 0.5,
-4.298397, -5.041806, 0.3229816, 0, 1.5, 0.5, 0.5
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
-3, -3.997804, -5.298415,
3, -3.997804, -5.298415,
-3, -3.997804, -5.298415,
-3, -4.171804, -5.579484,
-2, -3.997804, -5.298415,
-2, -4.171804, -5.579484,
-1, -3.997804, -5.298415,
-1, -4.171804, -5.579484,
0, -3.997804, -5.298415,
0, -4.171804, -5.579484,
1, -3.997804, -5.298415,
1, -4.171804, -5.579484,
2, -3.997804, -5.298415,
2, -4.171804, -5.579484,
3, -3.997804, -5.298415,
3, -4.171804, -5.579484
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
-3, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
-3, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
-3, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
-3, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
-2, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
-2, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
-2, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
-2, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
-1, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
-1, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
-1, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
-1, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
0, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
0, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
0, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
0, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
1, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
1, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
1, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
1, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
2, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
2, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
2, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
2, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5,
3, -4.519805, -6.141624, 0, -0.5, 0.5, 0.5,
3, -4.519805, -6.141624, 1, -0.5, 0.5, 0.5,
3, -4.519805, -6.141624, 1, 1.5, 0.5, 0.5,
3, -4.519805, -6.141624, 0, 1.5, 0.5, 0.5
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
-3.310578, -3, -5.298415,
-3.310578, 2, -5.298415,
-3.310578, -3, -5.298415,
-3.475215, -3, -5.579484,
-3.310578, -2, -5.298415,
-3.475215, -2, -5.579484,
-3.310578, -1, -5.298415,
-3.475215, -1, -5.579484,
-3.310578, 0, -5.298415,
-3.475215, 0, -5.579484,
-3.310578, 1, -5.298415,
-3.475215, 1, -5.579484,
-3.310578, 2, -5.298415,
-3.475215, 2, -5.579484
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
-3.804488, -3, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, -3, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, -3, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, -3, -6.141624, 0, 1.5, 0.5, 0.5,
-3.804488, -2, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, -2, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, -2, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, -2, -6.141624, 0, 1.5, 0.5, 0.5,
-3.804488, -1, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, -1, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, -1, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, -1, -6.141624, 0, 1.5, 0.5, 0.5,
-3.804488, 0, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, 0, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, 0, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, 0, -6.141624, 0, 1.5, 0.5, 0.5,
-3.804488, 1, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, 1, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, 1, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, 1, -6.141624, 0, 1.5, 0.5, 0.5,
-3.804488, 2, -6.141624, 0, -0.5, 0.5, 0.5,
-3.804488, 2, -6.141624, 1, -0.5, 0.5, 0.5,
-3.804488, 2, -6.141624, 1, 1.5, 0.5, 0.5,
-3.804488, 2, -6.141624, 0, 1.5, 0.5, 0.5
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
-3.310578, -3.997804, -4,
-3.310578, -3.997804, 4,
-3.310578, -3.997804, -4,
-3.475215, -4.171804, -4,
-3.310578, -3.997804, -2,
-3.475215, -4.171804, -2,
-3.310578, -3.997804, 0,
-3.475215, -4.171804, 0,
-3.310578, -3.997804, 2,
-3.475215, -4.171804, 2,
-3.310578, -3.997804, 4,
-3.475215, -4.171804, 4
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
-3.804488, -4.519805, -4, 0, -0.5, 0.5, 0.5,
-3.804488, -4.519805, -4, 1, -0.5, 0.5, 0.5,
-3.804488, -4.519805, -4, 1, 1.5, 0.5, 0.5,
-3.804488, -4.519805, -4, 0, 1.5, 0.5, 0.5,
-3.804488, -4.519805, -2, 0, -0.5, 0.5, 0.5,
-3.804488, -4.519805, -2, 1, -0.5, 0.5, 0.5,
-3.804488, -4.519805, -2, 1, 1.5, 0.5, 0.5,
-3.804488, -4.519805, -2, 0, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 0, 0, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 0, 1, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 0, 1, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 0, 0, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 2, 0, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 2, 1, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 2, 1, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 2, 0, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 4, 0, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 4, 1, -0.5, 0.5, 0.5,
-3.804488, -4.519805, 4, 1, 1.5, 0.5, 0.5,
-3.804488, -4.519805, 4, 0, 1.5, 0.5, 0.5
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
-3.310578, -3.997804, -5.298415,
-3.310578, 2.962212, -5.298415,
-3.310578, -3.997804, 5.944378,
-3.310578, 2.962212, 5.944378,
-3.310578, -3.997804, -5.298415,
-3.310578, -3.997804, 5.944378,
-3.310578, 2.962212, -5.298415,
-3.310578, 2.962212, 5.944378,
-3.310578, -3.997804, -5.298415,
3.27488, -3.997804, -5.298415,
-3.310578, -3.997804, 5.944378,
3.27488, -3.997804, 5.944378,
-3.310578, 2.962212, -5.298415,
3.27488, 2.962212, -5.298415,
-3.310578, 2.962212, 5.944378,
3.27488, 2.962212, 5.944378,
3.27488, -3.997804, -5.298415,
3.27488, 2.962212, -5.298415,
3.27488, -3.997804, 5.944378,
3.27488, 2.962212, 5.944378,
3.27488, -3.997804, -5.298415,
3.27488, -3.997804, 5.944378,
3.27488, 2.962212, -5.298415,
3.27488, 2.962212, 5.944378
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
var radius = 7.887934;
var distance = 35.09431;
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
mvMatrix.translate( 0.01784909, 0.5177959, -0.3229816 );
mvMatrix.scale( 1.295064, 1.225369, 0.7585828 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09431);
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
Azimsulfuron<-read.table("Azimsulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Azimsulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'Azimsulfuron' not found
```

```r
y<-Azimsulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'Azimsulfuron' not found
```

```r
z<-Azimsulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'Azimsulfuron' not found
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
-3.214674, -0.3734882, -2.115048, 0, 0, 1, 1, 1,
-3.031332, -1.042918, -0.7114115, 1, 0, 0, 1, 1,
-2.871647, -0.2668131, -2.223531, 1, 0, 0, 1, 1,
-2.865076, 1.37985, -0.7708306, 1, 0, 0, 1, 1,
-2.817236, 0.1664217, -1.569507, 1, 0, 0, 1, 1,
-2.772163, 0.1782408, -1.888226, 1, 0, 0, 1, 1,
-2.761037, 0.3522305, -1.468091, 0, 0, 0, 1, 1,
-2.759768, -1.603516, -0.9649637, 0, 0, 0, 1, 1,
-2.673774, -0.424699, -3.173155, 0, 0, 0, 1, 1,
-2.579172, -0.363224, -1.301178, 0, 0, 0, 1, 1,
-2.54249, 0.3373715, 0.7499188, 0, 0, 0, 1, 1,
-2.451033, 0.5433662, -0.2530622, 0, 0, 0, 1, 1,
-2.389303, 0.4007619, 0.3744947, 0, 0, 0, 1, 1,
-2.379777, -0.1028554, -2.560485, 1, 1, 1, 1, 1,
-2.3579, -0.2494343, -1.339561, 1, 1, 1, 1, 1,
-2.235531, 2.768422, 0.902625, 1, 1, 1, 1, 1,
-2.223806, -0.2900147, -2.843107, 1, 1, 1, 1, 1,
-2.184889, 0.6954949, -1.149282, 1, 1, 1, 1, 1,
-2.169745, 0.7870131, -0.7270971, 1, 1, 1, 1, 1,
-2.166999, -0.7422788, -1.471691, 1, 1, 1, 1, 1,
-2.104156, 0.5879923, -0.6172267, 1, 1, 1, 1, 1,
-2.099929, -1.106957, -2.008969, 1, 1, 1, 1, 1,
-2.085094, -0.6784896, -0.855132, 1, 1, 1, 1, 1,
-2.007049, 0.04188798, -1.046607, 1, 1, 1, 1, 1,
-1.961511, 0.5693834, -1.747602, 1, 1, 1, 1, 1,
-1.952265, -1.398845, -1.484751, 1, 1, 1, 1, 1,
-1.919109, 1.809836, -1.104585, 1, 1, 1, 1, 1,
-1.903573, -0.3943132, -1.951407, 1, 1, 1, 1, 1,
-1.889145, -0.5462798, -3.167439, 0, 0, 1, 1, 1,
-1.875092, 0.1063478, -2.726015, 1, 0, 0, 1, 1,
-1.848017, 2.072801, 0.3673603, 1, 0, 0, 1, 1,
-1.841317, 2.327879, -1.078834, 1, 0, 0, 1, 1,
-1.838695, 0.711025, -2.830637, 1, 0, 0, 1, 1,
-1.816503, 1.132416, -2.103833, 1, 0, 0, 1, 1,
-1.810264, 1.47226, -1.155432, 0, 0, 0, 1, 1,
-1.796321, -0.3978871, -2.378016, 0, 0, 0, 1, 1,
-1.787911, 0.9206033, 0.6046489, 0, 0, 0, 1, 1,
-1.786944, 0.4378649, -1.302174, 0, 0, 0, 1, 1,
-1.784283, -0.4016297, -0.7715541, 0, 0, 0, 1, 1,
-1.783696, -0.3987793, -1.59732, 0, 0, 0, 1, 1,
-1.769469, 1.603163, -0.6592845, 0, 0, 0, 1, 1,
-1.76671, 0.3529565, -0.2205456, 1, 1, 1, 1, 1,
-1.756749, 0.1924761, -2.329803, 1, 1, 1, 1, 1,
-1.75552, -0.4852931, -0.4920833, 1, 1, 1, 1, 1,
-1.754987, -0.4773847, 0.3754039, 1, 1, 1, 1, 1,
-1.754134, -0.3561471, -1.408785, 1, 1, 1, 1, 1,
-1.749519, 1.576166, -0.5306371, 1, 1, 1, 1, 1,
-1.747762, 1.456708, -0.2941175, 1, 1, 1, 1, 1,
-1.747709, -0.3196966, -1.798112, 1, 1, 1, 1, 1,
-1.720631, 0.4982568, -1.219258, 1, 1, 1, 1, 1,
-1.702762, 0.02872855, -2.056021, 1, 1, 1, 1, 1,
-1.699087, 0.8741965, -1.518541, 1, 1, 1, 1, 1,
-1.698168, 0.6428277, -0.1945858, 1, 1, 1, 1, 1,
-1.689768, -1.167111, -1.954443, 1, 1, 1, 1, 1,
-1.684306, 0.4432229, -1.481421, 1, 1, 1, 1, 1,
-1.659265, 1.617706, -0.5516006, 1, 1, 1, 1, 1,
-1.648293, -1.392863, -1.355123, 0, 0, 1, 1, 1,
-1.642869, 1.421959, -1.82973, 1, 0, 0, 1, 1,
-1.642851, -0.1147519, -0.8670298, 1, 0, 0, 1, 1,
-1.632224, 1.893757, -2.096917, 1, 0, 0, 1, 1,
-1.628366, 1.031621, 0.293423, 1, 0, 0, 1, 1,
-1.606289, 1.260914, -1.059239, 1, 0, 0, 1, 1,
-1.606245, -1.10724, -2.333445, 0, 0, 0, 1, 1,
-1.600986, 0.2755177, -0.9430837, 0, 0, 0, 1, 1,
-1.599303, -0.2228865, -2.787715, 0, 0, 0, 1, 1,
-1.598733, 0.8458681, 0.638752, 0, 0, 0, 1, 1,
-1.585655, -0.08115816, -0.4135529, 0, 0, 0, 1, 1,
-1.582504, 0.2073469, -1.578517, 0, 0, 0, 1, 1,
-1.564274, -0.8908762, -3.696238, 0, 0, 0, 1, 1,
-1.540151, -0.23816, -1.791484, 1, 1, 1, 1, 1,
-1.537516, 1.123647, -1.204072, 1, 1, 1, 1, 1,
-1.531117, -0.7386357, -4.007258, 1, 1, 1, 1, 1,
-1.52599, 0.5298429, -2.814493, 1, 1, 1, 1, 1,
-1.521118, 0.5378892, -2.063288, 1, 1, 1, 1, 1,
-1.519687, -0.03522765, -0.6714331, 1, 1, 1, 1, 1,
-1.516391, 0.2937531, 0.5844011, 1, 1, 1, 1, 1,
-1.513898, 0.1687588, -0.3975406, 1, 1, 1, 1, 1,
-1.509384, -1.075816, -5.134685, 1, 1, 1, 1, 1,
-1.502067, 2.340427, -0.2205066, 1, 1, 1, 1, 1,
-1.49458, 0.2570449, 1.721592, 1, 1, 1, 1, 1,
-1.491391, -0.3566891, -1.851542, 1, 1, 1, 1, 1,
-1.488042, 0.02379333, -2.237827, 1, 1, 1, 1, 1,
-1.477652, 0.3939797, -1.964825, 1, 1, 1, 1, 1,
-1.460806, 0.796893, -0.4556837, 1, 1, 1, 1, 1,
-1.455734, 0.02432878, -1.697877, 0, 0, 1, 1, 1,
-1.450443, -1.753565, -3.747057, 1, 0, 0, 1, 1,
-1.449345, 0.4658603, -2.020239, 1, 0, 0, 1, 1,
-1.42178, 0.6707522, -1.813812, 1, 0, 0, 1, 1,
-1.395505, 1.759197, -1.848393, 1, 0, 0, 1, 1,
-1.392774, 0.02333547, -4.068998, 1, 0, 0, 1, 1,
-1.385899, 0.8380079, -1.035795, 0, 0, 0, 1, 1,
-1.375754, 0.2455292, -0.8895814, 0, 0, 0, 1, 1,
-1.369377, -0.3944672, -2.13441, 0, 0, 0, 1, 1,
-1.36666, 0.01371554, -1.956212, 0, 0, 0, 1, 1,
-1.360482, -1.045563, -1.821281, 0, 0, 0, 1, 1,
-1.360336, 1.945096, -0.8819773, 0, 0, 0, 1, 1,
-1.354691, -1.76136, -2.234588, 0, 0, 0, 1, 1,
-1.353826, -1.999271, -1.38424, 1, 1, 1, 1, 1,
-1.348901, 1.097942, -1.756927, 1, 1, 1, 1, 1,
-1.346988, -0.325703, -2.026071, 1, 1, 1, 1, 1,
-1.345765, -0.5285883, -3.573045, 1, 1, 1, 1, 1,
-1.341307, 1.356441, -1.835054, 1, 1, 1, 1, 1,
-1.338116, 1.924983, 0.1375567, 1, 1, 1, 1, 1,
-1.336795, -2.095913, -1.20472, 1, 1, 1, 1, 1,
-1.335257, 0.7573804, -1.154522, 1, 1, 1, 1, 1,
-1.312554, -1.386898, -2.012421, 1, 1, 1, 1, 1,
-1.305255, -1.445175, -2.942401, 1, 1, 1, 1, 1,
-1.304897, -0.9187369, -3.195026, 1, 1, 1, 1, 1,
-1.298224, 0.7977352, -1.105803, 1, 1, 1, 1, 1,
-1.290228, -1.10795, -0.7605429, 1, 1, 1, 1, 1,
-1.284027, 0.1151123, -2.64607, 1, 1, 1, 1, 1,
-1.281442, -1.536622, -2.187349, 1, 1, 1, 1, 1,
-1.279952, 0.9865985, -1.408718, 0, 0, 1, 1, 1,
-1.276704, 0.3403444, -1.026238, 1, 0, 0, 1, 1,
-1.276438, 0.4754033, -0.8517294, 1, 0, 0, 1, 1,
-1.273925, 0.8057234, -0.148801, 1, 0, 0, 1, 1,
-1.264117, 0.4083697, -2.670871, 1, 0, 0, 1, 1,
-1.253756, 0.328231, -2.771725, 1, 0, 0, 1, 1,
-1.252119, 1.112347, -0.5009489, 0, 0, 0, 1, 1,
-1.246586, 0.06208124, -1.524607, 0, 0, 0, 1, 1,
-1.24612, -0.4552372, -0.2233003, 0, 0, 0, 1, 1,
-1.242943, -1.031416, -1.766864, 0, 0, 0, 1, 1,
-1.227427, 0.4441726, -0.6346857, 0, 0, 0, 1, 1,
-1.217436, 0.5592811, 0.664446, 0, 0, 0, 1, 1,
-1.215704, 0.4926445, -1.871266, 0, 0, 0, 1, 1,
-1.215642, -1.418078, -1.195028, 1, 1, 1, 1, 1,
-1.198064, -1.990337, -2.611645, 1, 1, 1, 1, 1,
-1.192827, 1.007534, -0.6303513, 1, 1, 1, 1, 1,
-1.192017, 0.9319788, -3.159183, 1, 1, 1, 1, 1,
-1.191939, 0.4093292, -0.3361564, 1, 1, 1, 1, 1,
-1.190436, 0.5306698, -0.5164654, 1, 1, 1, 1, 1,
-1.185969, -0.2129295, -2.395601, 1, 1, 1, 1, 1,
-1.180405, -1.925793, -1.933119, 1, 1, 1, 1, 1,
-1.177336, -0.07808015, -1.193684, 1, 1, 1, 1, 1,
-1.152096, 1.342509, -0.995451, 1, 1, 1, 1, 1,
-1.141928, 0.3178299, -1.291223, 1, 1, 1, 1, 1,
-1.141079, -1.311555, -2.203719, 1, 1, 1, 1, 1,
-1.140079, -1.099922, -2.265798, 1, 1, 1, 1, 1,
-1.139402, -0.9663067, -2.620731, 1, 1, 1, 1, 1,
-1.129777, 0.03969623, -0.1993587, 1, 1, 1, 1, 1,
-1.110524, -0.0597161, -1.610321, 0, 0, 1, 1, 1,
-1.10611, 0.1130633, -2.284626, 1, 0, 0, 1, 1,
-1.10019, 0.9327895, -0.8638857, 1, 0, 0, 1, 1,
-1.09803, -2.11527, -4.881969, 1, 0, 0, 1, 1,
-1.092546, -0.5533576, -2.378192, 1, 0, 0, 1, 1,
-1.086566, 1.684874, -0.6675137, 1, 0, 0, 1, 1,
-1.08537, -1.357564, -2.647309, 0, 0, 0, 1, 1,
-1.078259, 0.6149333, -1.525501, 0, 0, 0, 1, 1,
-1.074009, 1.041829, -2.380764, 0, 0, 0, 1, 1,
-1.073357, -1.055702, 0.8173426, 0, 0, 0, 1, 1,
-1.0722, 1.744036, -1.740886, 0, 0, 0, 1, 1,
-1.064607, 0.8706029, -1.370448, 0, 0, 0, 1, 1,
-1.063282, -1.690878, -3.599145, 0, 0, 0, 1, 1,
-1.059713, -0.9685725, -1.201562, 1, 1, 1, 1, 1,
-1.050565, -1.057557, -3.323657, 1, 1, 1, 1, 1,
-1.049528, -0.8972107, -2.872177, 1, 1, 1, 1, 1,
-1.03857, 1.246996, -2.257185, 1, 1, 1, 1, 1,
-1.030729, 0.5465521, 0.588958, 1, 1, 1, 1, 1,
-1.027631, 1.281151, -0.6661032, 1, 1, 1, 1, 1,
-1.02306, 0.4332887, -2.402742, 1, 1, 1, 1, 1,
-1.021867, 0.7720001, -0.8880841, 1, 1, 1, 1, 1,
-1.019719, -0.06866781, -0.6871194, 1, 1, 1, 1, 1,
-1.012717, -0.607682, -1.505316, 1, 1, 1, 1, 1,
-1.010288, 0.4201345, 0.5387783, 1, 1, 1, 1, 1,
-0.9993098, -0.6014699, -0.5068768, 1, 1, 1, 1, 1,
-0.9982364, 0.08580425, -0.9543903, 1, 1, 1, 1, 1,
-0.9885837, -0.6654656, -3.112031, 1, 1, 1, 1, 1,
-0.9873385, 1.008592, -2.577389, 1, 1, 1, 1, 1,
-0.9849806, -0.0129568, -0.8512286, 0, 0, 1, 1, 1,
-0.9748997, 1.056556, -0.7754962, 1, 0, 0, 1, 1,
-0.9742759, 1.614221, -0.5772021, 1, 0, 0, 1, 1,
-0.9732475, 0.2823363, -0.9979577, 1, 0, 0, 1, 1,
-0.972448, -0.3756779, -3.77176, 1, 0, 0, 1, 1,
-0.9669113, -0.9609777, -2.839916, 1, 0, 0, 1, 1,
-0.9642496, 0.02380721, -1.509885, 0, 0, 0, 1, 1,
-0.9640468, -0.6234044, -3.854719, 0, 0, 0, 1, 1,
-0.9578435, -0.6952205, -2.382722, 0, 0, 0, 1, 1,
-0.9557347, -0.2761736, -3.327274, 0, 0, 0, 1, 1,
-0.9505332, 0.07356539, -0.3834086, 0, 0, 0, 1, 1,
-0.9375826, 2.047444, 0.634095, 0, 0, 0, 1, 1,
-0.9362227, -0.1216322, -2.283651, 0, 0, 0, 1, 1,
-0.9350237, 1.124174, -1.287979, 1, 1, 1, 1, 1,
-0.9334087, 0.9446983, -0.2431887, 1, 1, 1, 1, 1,
-0.92889, -1.556908, -4.133137, 1, 1, 1, 1, 1,
-0.9209088, 2.000898, 1.08113, 1, 1, 1, 1, 1,
-0.9130594, -1.271656, -0.922628, 1, 1, 1, 1, 1,
-0.9109339, 0.3219447, -2.631368, 1, 1, 1, 1, 1,
-0.9107078, -1.008853, -4.37432, 1, 1, 1, 1, 1,
-0.9092861, -0.3416012, -4.673584, 1, 1, 1, 1, 1,
-0.9029363, -1.149638, -2.351643, 1, 1, 1, 1, 1,
-0.891546, 0.1343909, -1.473731, 1, 1, 1, 1, 1,
-0.8909933, -0.119751, -3.035854, 1, 1, 1, 1, 1,
-0.8869441, -1.067826, -2.646296, 1, 1, 1, 1, 1,
-0.886235, 0.6282129, -0.1610808, 1, 1, 1, 1, 1,
-0.8848221, 0.2318514, -2.181767, 1, 1, 1, 1, 1,
-0.867547, -0.4096088, -2.443299, 1, 1, 1, 1, 1,
-0.8655566, 1.044551, -0.07097694, 0, 0, 1, 1, 1,
-0.8625685, -1.757631, -1.932032, 1, 0, 0, 1, 1,
-0.8589391, 0.4470385, -0.01771257, 1, 0, 0, 1, 1,
-0.8531966, 1.825245, -0.7784666, 1, 0, 0, 1, 1,
-0.8505446, -0.1584571, -1.212821, 1, 0, 0, 1, 1,
-0.8477398, -0.5051458, -3.050699, 1, 0, 0, 1, 1,
-0.8453668, 0.1417491, -1.209503, 0, 0, 0, 1, 1,
-0.8418722, 0.360125, -1.692932, 0, 0, 0, 1, 1,
-0.8414556, 0.1403556, 0.08325338, 0, 0, 0, 1, 1,
-0.8332376, -0.9942678, -2.350057, 0, 0, 0, 1, 1,
-0.8317019, 1.372317, -1.529362, 0, 0, 0, 1, 1,
-0.8301072, 1.45749, -0.2141618, 0, 0, 0, 1, 1,
-0.8252281, -2.581468, -1.135638, 0, 0, 0, 1, 1,
-0.8200439, 0.2873374, -0.316157, 1, 1, 1, 1, 1,
-0.8135287, 0.2624127, -0.1671867, 1, 1, 1, 1, 1,
-0.8115093, 0.4370051, -1.504674, 1, 1, 1, 1, 1,
-0.8039695, -1.116336, -2.116487, 1, 1, 1, 1, 1,
-0.8038336, -0.468292, -2.537394, 1, 1, 1, 1, 1,
-0.8024843, -0.3304867, -2.080626, 1, 1, 1, 1, 1,
-0.8012323, 0.767632, -1.150799, 1, 1, 1, 1, 1,
-0.8003007, 2.510676, 0.0397266, 1, 1, 1, 1, 1,
-0.7979687, 0.6676806, -2.032066, 1, 1, 1, 1, 1,
-0.791052, -1.902573, -1.535724, 1, 1, 1, 1, 1,
-0.7909635, 0.4409784, -0.6935776, 1, 1, 1, 1, 1,
-0.7882707, -0.3856571, -3.218722, 1, 1, 1, 1, 1,
-0.7860309, -0.7266869, -3.66572, 1, 1, 1, 1, 1,
-0.7858403, -0.9066446, -2.835634, 1, 1, 1, 1, 1,
-0.7852885, -1.534856, -1.57642, 1, 1, 1, 1, 1,
-0.7851725, 0.004456019, -1.861186, 0, 0, 1, 1, 1,
-0.782421, -0.6585845, -1.563201, 1, 0, 0, 1, 1,
-0.7765157, -0.2856809, -0.9912589, 1, 0, 0, 1, 1,
-0.7695546, -1.730819, -1.719245, 1, 0, 0, 1, 1,
-0.7682229, -0.4331684, -1.992334, 1, 0, 0, 1, 1,
-0.7679514, -0.9058595, -0.7191931, 1, 0, 0, 1, 1,
-0.7671098, 1.007829, -1.969132, 0, 0, 0, 1, 1,
-0.7653975, 1.120827, -1.561016, 0, 0, 0, 1, 1,
-0.7653702, -1.313491, -1.57954, 0, 0, 0, 1, 1,
-0.7611238, 0.7977736, -0.1120841, 0, 0, 0, 1, 1,
-0.7577784, 2.455696, 0.6638535, 0, 0, 0, 1, 1,
-0.7570295, -0.964912, -0.9366938, 0, 0, 0, 1, 1,
-0.7369053, -0.3721929, -2.146097, 0, 0, 0, 1, 1,
-0.7361427, -0.5071097, -1.600772, 1, 1, 1, 1, 1,
-0.7357045, -0.4951693, -3.904793, 1, 1, 1, 1, 1,
-0.7348888, -1.231651, -2.401943, 1, 1, 1, 1, 1,
-0.7323754, -0.387354, -2.433368, 1, 1, 1, 1, 1,
-0.7239106, 1.645976, -0.4272064, 1, 1, 1, 1, 1,
-0.716357, -1.706267, -1.554986, 1, 1, 1, 1, 1,
-0.7151178, -0.02635678, -1.590182, 1, 1, 1, 1, 1,
-0.7138123, 0.1923611, -1.315563, 1, 1, 1, 1, 1,
-0.713474, 1.153437, 0.604462, 1, 1, 1, 1, 1,
-0.7109514, -1.371686, -1.992914, 1, 1, 1, 1, 1,
-0.709433, -0.2788514, -3.238255, 1, 1, 1, 1, 1,
-0.7079732, 2.509404, -0.2727516, 1, 1, 1, 1, 1,
-0.7023098, -1.712933, -2.973661, 1, 1, 1, 1, 1,
-0.6994557, -1.590351, -2.869485, 1, 1, 1, 1, 1,
-0.6949813, -1.54563, -3.183439, 1, 1, 1, 1, 1,
-0.6927186, 0.4472358, -2.236171, 0, 0, 1, 1, 1,
-0.6911253, 2.497049, -0.5200566, 1, 0, 0, 1, 1,
-0.6907574, 0.3124396, -0.7524155, 1, 0, 0, 1, 1,
-0.6892735, -1.204605, -1.000406, 1, 0, 0, 1, 1,
-0.688723, -2.805628, -2.736764, 1, 0, 0, 1, 1,
-0.6885993, -0.2717001, -2.808725, 1, 0, 0, 1, 1,
-0.6865401, 1.160193, -1.23871, 0, 0, 0, 1, 1,
-0.6786444, -1.051525, -3.293224, 0, 0, 0, 1, 1,
-0.6753481, 1.894544, -1.749568, 0, 0, 0, 1, 1,
-0.673843, -0.477811, -3.245272, 0, 0, 0, 1, 1,
-0.6729116, 0.9032691, 0.2810451, 0, 0, 0, 1, 1,
-0.6689705, -0.9286258, -3.131518, 0, 0, 0, 1, 1,
-0.6608818, 0.8366042, -0.9611683, 0, 0, 0, 1, 1,
-0.6577612, -2.473112, -2.650228, 1, 1, 1, 1, 1,
-0.6557831, -1.237836, -0.9429532, 1, 1, 1, 1, 1,
-0.6466312, -0.01425565, -1.83756, 1, 1, 1, 1, 1,
-0.6448858, 1.267932, 0.3182082, 1, 1, 1, 1, 1,
-0.6428782, -0.02017323, -2.090871, 1, 1, 1, 1, 1,
-0.6428776, 1.389042, 0.1636499, 1, 1, 1, 1, 1,
-0.6413153, 0.236641, -2.788035, 1, 1, 1, 1, 1,
-0.6398913, -0.4046244, -0.747761, 1, 1, 1, 1, 1,
-0.6390259, -1.064468, -2.194461, 1, 1, 1, 1, 1,
-0.6371724, 0.3691094, -1.773917, 1, 1, 1, 1, 1,
-0.6365802, 0.0796302, 0.06312369, 1, 1, 1, 1, 1,
-0.6223301, -1.009324, -2.840015, 1, 1, 1, 1, 1,
-0.6203585, -0.1083879, -4.212978, 1, 1, 1, 1, 1,
-0.6150806, -2.409744, -1.968701, 1, 1, 1, 1, 1,
-0.6126928, 1.812778, -1.601345, 1, 1, 1, 1, 1,
-0.6108263, -0.3555224, -3.828776, 0, 0, 1, 1, 1,
-0.6089186, -0.714815, -1.953626, 1, 0, 0, 1, 1,
-0.603268, 1.515793, -2.847387, 1, 0, 0, 1, 1,
-0.6015476, -1.879256, -0.7719734, 1, 0, 0, 1, 1,
-0.5959107, -1.091178, -4.453994, 1, 0, 0, 1, 1,
-0.5898206, -0.7874795, -2.386465, 1, 0, 0, 1, 1,
-0.5894588, -0.541879, -3.534032, 0, 0, 0, 1, 1,
-0.5866446, 0.1670202, -0.8980378, 0, 0, 0, 1, 1,
-0.5835702, -1.069652, -1.988342, 0, 0, 0, 1, 1,
-0.5817744, 1.267962, -0.6324607, 0, 0, 0, 1, 1,
-0.5807211, -0.6009833, -1.450997, 0, 0, 0, 1, 1,
-0.5787237, 1.116022, -0.06811795, 0, 0, 0, 1, 1,
-0.5729593, -1.555637, -3.645729, 0, 0, 0, 1, 1,
-0.5711936, -1.569911, -2.831253, 1, 1, 1, 1, 1,
-0.5582348, -0.8472137, -2.124807, 1, 1, 1, 1, 1,
-0.5572456, -1.624409, -3.971952, 1, 1, 1, 1, 1,
-0.5517303, -1.663116, -1.92159, 1, 1, 1, 1, 1,
-0.5453764, -0.6377189, -2.774304, 1, 1, 1, 1, 1,
-0.5447123, 1.055412, -1.099822, 1, 1, 1, 1, 1,
-0.5443758, 0.1265235, -1.502084, 1, 1, 1, 1, 1,
-0.5402322, 1.335609, 1.087004, 1, 1, 1, 1, 1,
-0.5306411, 0.07611118, -0.9037893, 1, 1, 1, 1, 1,
-0.5237605, -0.447181, -2.934202, 1, 1, 1, 1, 1,
-0.5234579, -0.9899556, -2.035616, 1, 1, 1, 1, 1,
-0.5222837, 0.5184778, -1.236563, 1, 1, 1, 1, 1,
-0.5206776, -1.250592, -4.510198, 1, 1, 1, 1, 1,
-0.5189111, -2.310813, -2.713424, 1, 1, 1, 1, 1,
-0.5181075, -0.9154718, -3.17095, 1, 1, 1, 1, 1,
-0.5165328, -0.7024691, -3.622503, 0, 0, 1, 1, 1,
-0.5159119, 0.3325706, -0.6686049, 1, 0, 0, 1, 1,
-0.5095884, -2.039041, -2.348981, 1, 0, 0, 1, 1,
-0.5090498, -0.06607822, -2.740057, 1, 0, 0, 1, 1,
-0.5078813, -1.221755, -3.087879, 1, 0, 0, 1, 1,
-0.4963004, 2.068512, 1.050953, 1, 0, 0, 1, 1,
-0.4878599, 0.1758937, -0.390249, 0, 0, 0, 1, 1,
-0.4850576, 0.3695073, -0.7858823, 0, 0, 0, 1, 1,
-0.48022, 1.143914, -0.2318426, 0, 0, 0, 1, 1,
-0.4752938, 0.9459222, -0.5569261, 0, 0, 0, 1, 1,
-0.472374, 0.341351, -2.254221, 0, 0, 0, 1, 1,
-0.4719057, -0.2070027, -1.986314, 0, 0, 0, 1, 1,
-0.4665182, 1.291489, 0.2644937, 0, 0, 0, 1, 1,
-0.4645599, 0.4606699, 0.4510562, 1, 1, 1, 1, 1,
-0.4539758, 0.475791, -1.457845, 1, 1, 1, 1, 1,
-0.4518077, 0.1918946, -0.4401736, 1, 1, 1, 1, 1,
-0.4470851, -1.775994, -3.097533, 1, 1, 1, 1, 1,
-0.4415164, -0.9842788, -2.148145, 1, 1, 1, 1, 1,
-0.4367788, -0.3895915, -2.129627, 1, 1, 1, 1, 1,
-0.4317665, -0.5261385, -2.010784, 1, 1, 1, 1, 1,
-0.4311784, -0.8711641, -3.75488, 1, 1, 1, 1, 1,
-0.4292075, -0.4614408, -0.4033484, 1, 1, 1, 1, 1,
-0.4229412, -0.6752485, -4.610126, 1, 1, 1, 1, 1,
-0.4217233, -0.358369, -0.6197185, 1, 1, 1, 1, 1,
-0.4195347, 0.08509849, -0.4943424, 1, 1, 1, 1, 1,
-0.4156776, 0.4106731, -0.241476, 1, 1, 1, 1, 1,
-0.414434, -0.1445761, -1.064423, 1, 1, 1, 1, 1,
-0.4139421, -1.393919, -3.796518, 1, 1, 1, 1, 1,
-0.408444, -1.426419, -4.726969, 0, 0, 1, 1, 1,
-0.4046173, 1.664674, -0.1132087, 1, 0, 0, 1, 1,
-0.4017604, -0.1526856, -1.937935, 1, 0, 0, 1, 1,
-0.4014485, 0.9870445, -0.2557191, 1, 0, 0, 1, 1,
-0.4006199, 0.8904998, 0.4920252, 1, 0, 0, 1, 1,
-0.3998519, 0.01662392, -0.9590746, 1, 0, 0, 1, 1,
-0.3891333, -0.4503101, -1.842972, 0, 0, 0, 1, 1,
-0.3888572, 0.1694165, -0.2284658, 0, 0, 0, 1, 1,
-0.3851063, -0.3844221, -2.192525, 0, 0, 0, 1, 1,
-0.3825091, 1.351116, -1.890384, 0, 0, 0, 1, 1,
-0.3820216, 0.8615802, 1.181182, 0, 0, 0, 1, 1,
-0.3815319, 0.2815469, -1.297, 0, 0, 0, 1, 1,
-0.3807358, 1.099913, -0.9881938, 0, 0, 0, 1, 1,
-0.3805284, 2.492918, 1.717581, 1, 1, 1, 1, 1,
-0.3747803, -1.850206, -2.16453, 1, 1, 1, 1, 1,
-0.3733258, 0.03160651, -2.736723, 1, 1, 1, 1, 1,
-0.3703835, 0.9381903, -1.751815, 1, 1, 1, 1, 1,
-0.3579193, -0.1959786, 0.3537219, 1, 1, 1, 1, 1,
-0.3574846, 0.3217757, -1.055802, 1, 1, 1, 1, 1,
-0.3548512, -0.4805069, -3.371203, 1, 1, 1, 1, 1,
-0.3530487, -0.1058236, -0.763076, 1, 1, 1, 1, 1,
-0.3489688, 0.5867475, -0.6012883, 1, 1, 1, 1, 1,
-0.3474659, 1.129778, -1.075153, 1, 1, 1, 1, 1,
-0.3465564, -0.1459564, -2.350656, 1, 1, 1, 1, 1,
-0.3464907, -0.8194708, -3.145705, 1, 1, 1, 1, 1,
-0.342261, 2.327572, -0.7918184, 1, 1, 1, 1, 1,
-0.3390505, -1.153835, -3.520983, 1, 1, 1, 1, 1,
-0.3359343, 1.486525, 0.5603372, 1, 1, 1, 1, 1,
-0.3343333, -1.270883, -3.312289, 0, 0, 1, 1, 1,
-0.3338171, -0.06802089, -3.480075, 1, 0, 0, 1, 1,
-0.3315965, 1.914396, -0.9099757, 1, 0, 0, 1, 1,
-0.3289953, 0.6201338, -2.458862, 1, 0, 0, 1, 1,
-0.3277515, -1.782653, -2.306166, 1, 0, 0, 1, 1,
-0.3258373, 1.231971, -1.643043, 1, 0, 0, 1, 1,
-0.3213151, -0.3163362, -3.594704, 0, 0, 0, 1, 1,
-0.3190052, -0.5290444, -2.633028, 0, 0, 0, 1, 1,
-0.3175397, 1.155902, -1.075338, 0, 0, 0, 1, 1,
-0.3153146, -0.9562345, -2.723025, 0, 0, 0, 1, 1,
-0.3133248, -2.59926, -3.411575, 0, 0, 0, 1, 1,
-0.3129147, -1.166307, -2.122972, 0, 0, 0, 1, 1,
-0.3120869, -0.6181625, -2.599057, 0, 0, 0, 1, 1,
-0.3092492, 1.909131, 0.7805205, 1, 1, 1, 1, 1,
-0.3058317, -0.9555404, -1.52595, 1, 1, 1, 1, 1,
-0.303717, 0.5079284, -1.94932, 1, 1, 1, 1, 1,
-0.3001733, 1.766699, 1.095414, 1, 1, 1, 1, 1,
-0.2977622, 1.834969, -0.4722216, 1, 1, 1, 1, 1,
-0.2975044, -0.2270764, -2.746643, 1, 1, 1, 1, 1,
-0.2959798, 1.068371, 1.091917, 1, 1, 1, 1, 1,
-0.2949903, 0.1967497, -0.3224987, 1, 1, 1, 1, 1,
-0.2867684, -0.4679979, -1.848093, 1, 1, 1, 1, 1,
-0.2844126, 0.09621213, -1.752011, 1, 1, 1, 1, 1,
-0.283389, -0.3158394, -2.432399, 1, 1, 1, 1, 1,
-0.2821319, -0.5066006, -1.281818, 1, 1, 1, 1, 1,
-0.2816144, -0.8838444, -3.316609, 1, 1, 1, 1, 1,
-0.2743205, 0.2605006, 0.2470173, 1, 1, 1, 1, 1,
-0.2741798, -0.5173766, -2.069621, 1, 1, 1, 1, 1,
-0.2720058, -0.2352705, -1.734622, 0, 0, 1, 1, 1,
-0.2640269, -1.545114, -1.789215, 1, 0, 0, 1, 1,
-0.2604153, -3.896445, -2.869009, 1, 0, 0, 1, 1,
-0.2578856, -0.3937086, -2.193701, 1, 0, 0, 1, 1,
-0.2536369, -1.483598, -3.704546, 1, 0, 0, 1, 1,
-0.2517673, -0.7721298, -3.492887, 1, 0, 0, 1, 1,
-0.2507598, 0.3492632, -1.918811, 0, 0, 0, 1, 1,
-0.2458241, 0.6579093, -0.824466, 0, 0, 0, 1, 1,
-0.2426211, 0.2131654, -1.028381, 0, 0, 0, 1, 1,
-0.2396128, -0.07393263, -1.150846, 0, 0, 0, 1, 1,
-0.2362208, -0.1782215, -1.353035, 0, 0, 0, 1, 1,
-0.2361636, 1.457116, 0.650516, 0, 0, 0, 1, 1,
-0.2359714, 0.5184571, -2.316308, 0, 0, 0, 1, 1,
-0.2352345, -0.2191114, -1.533048, 1, 1, 1, 1, 1,
-0.2326988, 1.337367, -1.467662, 1, 1, 1, 1, 1,
-0.2306939, 1.025811, -1.154808, 1, 1, 1, 1, 1,
-0.2301259, 1.027193, 2.024534, 1, 1, 1, 1, 1,
-0.2229049, -1.306721, -3.219435, 1, 1, 1, 1, 1,
-0.2210506, 0.1795739, -1.239209, 1, 1, 1, 1, 1,
-0.2185129, 0.439281, -0.4361359, 1, 1, 1, 1, 1,
-0.2101302, 0.02775142, -0.5226786, 1, 1, 1, 1, 1,
-0.2098901, -0.5991781, -2.830379, 1, 1, 1, 1, 1,
-0.2087273, -0.8848109, -1.170892, 1, 1, 1, 1, 1,
-0.2078904, 0.2879541, -0.108594, 1, 1, 1, 1, 1,
-0.2071461, 1.834054, 0.1578295, 1, 1, 1, 1, 1,
-0.2063078, -0.4461074, -2.508763, 1, 1, 1, 1, 1,
-0.2057311, -0.7479994, -4.873135, 1, 1, 1, 1, 1,
-0.2054987, 2.192505, -0.2515183, 1, 1, 1, 1, 1,
-0.2011155, -0.4309149, -2.854663, 0, 0, 1, 1, 1,
-0.2007355, 1.68111, 0.2394162, 1, 0, 0, 1, 1,
-0.1973866, -0.792208, -1.525752, 1, 0, 0, 1, 1,
-0.1913645, -1.416389, -3.058134, 1, 0, 0, 1, 1,
-0.185658, -0.6571535, -3.865804, 1, 0, 0, 1, 1,
-0.1763518, -0.8336657, -0.07076776, 1, 0, 0, 1, 1,
-0.1755678, 1.54398, 0.8670807, 0, 0, 0, 1, 1,
-0.1752101, 0.7297963, 1.338051, 0, 0, 0, 1, 1,
-0.1704125, 0.2838366, -0.577578, 0, 0, 0, 1, 1,
-0.1672296, 1.554092, 0.7844738, 0, 0, 0, 1, 1,
-0.1622304, 1.57558, 0.1179211, 0, 0, 0, 1, 1,
-0.1538619, 2.747855, 0.5687487, 0, 0, 0, 1, 1,
-0.1530876, -2.101499, -4.192812, 0, 0, 0, 1, 1,
-0.1486898, -0.5463601, -4.018745, 1, 1, 1, 1, 1,
-0.1471452, -0.009601533, -3.387916, 1, 1, 1, 1, 1,
-0.1404527, -0.269065, -2.142355, 1, 1, 1, 1, 1,
-0.1386959, 1.319224, 1.117291, 1, 1, 1, 1, 1,
-0.1385384, -0.7308134, -2.778836, 1, 1, 1, 1, 1,
-0.1371699, 2.313051, -1.140137, 1, 1, 1, 1, 1,
-0.1357772, 2.744226, -0.6959733, 1, 1, 1, 1, 1,
-0.1355481, 0.6061516, -0.3390233, 1, 1, 1, 1, 1,
-0.1316135, -1.729785, -4.246236, 1, 1, 1, 1, 1,
-0.1310334, 0.7010678, 2.010297, 1, 1, 1, 1, 1,
-0.130489, 0.2730146, -2.657753, 1, 1, 1, 1, 1,
-0.1292458, -0.4863422, -3.883958, 1, 1, 1, 1, 1,
-0.1259217, -0.5592933, -3.804265, 1, 1, 1, 1, 1,
-0.1257479, -0.4489309, -2.397207, 1, 1, 1, 1, 1,
-0.1207344, -0.2202793, -2.14808, 1, 1, 1, 1, 1,
-0.1201814, 1.279786, 2.248694, 0, 0, 1, 1, 1,
-0.11807, -0.1485589, -1.886086, 1, 0, 0, 1, 1,
-0.1167141, 0.1287983, -3.00089, 1, 0, 0, 1, 1,
-0.1145876, 0.4672041, 0.255894, 1, 0, 0, 1, 1,
-0.110317, 0.2380399, -0.5056424, 1, 0, 0, 1, 1,
-0.1094133, 0.801967, 0.2436179, 1, 0, 0, 1, 1,
-0.1091787, 0.8380171, 1.737039, 0, 0, 0, 1, 1,
-0.1074381, 0.4342817, -2.132727, 0, 0, 0, 1, 1,
-0.1047, -1.47313, -2.738476, 0, 0, 0, 1, 1,
-0.1026381, 0.5722932, 1.239297, 0, 0, 0, 1, 1,
-0.09913315, -0.4567869, -2.561853, 0, 0, 0, 1, 1,
-0.09635042, -1.859295, -3.713398, 0, 0, 0, 1, 1,
-0.09508169, 0.4499658, -1.934646, 0, 0, 0, 1, 1,
-0.093577, -0.2050197, -1.857162, 1, 1, 1, 1, 1,
-0.09325778, -1.229975, -3.434377, 1, 1, 1, 1, 1,
-0.08827738, 0.5278823, -0.2568944, 1, 1, 1, 1, 1,
-0.08681457, -0.8174817, -4.116268, 1, 1, 1, 1, 1,
-0.08585662, 1.514308, 1.136466, 1, 1, 1, 1, 1,
-0.0838019, -0.6253008, -4.523732, 1, 1, 1, 1, 1,
-0.08055729, -0.1988306, -2.407339, 1, 1, 1, 1, 1,
-0.07842871, -0.6815513, -2.544326, 1, 1, 1, 1, 1,
-0.07643022, 0.2734125, -1.007359, 1, 1, 1, 1, 1,
-0.07131039, 0.9302492, -0.1715565, 1, 1, 1, 1, 1,
-0.06877442, -0.6230457, -2.099793, 1, 1, 1, 1, 1,
-0.06856952, 0.2845673, -1.711002, 1, 1, 1, 1, 1,
-0.06837673, -0.08263437, -2.499872, 1, 1, 1, 1, 1,
-0.06788334, 0.1138752, 0.7800373, 1, 1, 1, 1, 1,
-0.06722943, -1.052622, -4.349411, 1, 1, 1, 1, 1,
-0.0654928, 2.116522, -0.6545078, 0, 0, 1, 1, 1,
-0.06509451, 0.656428, 0.2144693, 1, 0, 0, 1, 1,
-0.0641828, 0.7177384, 0.03354855, 1, 0, 0, 1, 1,
-0.05241996, -1.744003, -4.642319, 1, 0, 0, 1, 1,
-0.05232787, 0.4002049, -1.548717, 1, 0, 0, 1, 1,
-0.05198033, -0.2625219, -4.946152, 1, 0, 0, 1, 1,
-0.04588391, -0.8312367, -3.095789, 0, 0, 0, 1, 1,
-0.04366081, -1.629831, -2.123429, 0, 0, 0, 1, 1,
-0.03683196, -1.085873, -4.733255, 0, 0, 0, 1, 1,
-0.03282439, -1.146284, -2.021528, 0, 0, 0, 1, 1,
-0.0320741, -0.4229511, -3.328414, 0, 0, 0, 1, 1,
-0.02809199, -0.1138574, -3.089505, 0, 0, 0, 1, 1,
-0.02077163, -0.6359, -1.579057, 0, 0, 0, 1, 1,
-0.02023527, -2.709378, -1.680335, 1, 1, 1, 1, 1,
-0.01720726, 1.222726, -0.09509147, 1, 1, 1, 1, 1,
-0.01401489, -0.3790674, -2.059438, 1, 1, 1, 1, 1,
-0.01052308, 2.860853, -0.2656068, 1, 1, 1, 1, 1,
-0.0100626, 0.1681315, 1.902531, 1, 1, 1, 1, 1,
-0.01001847, -0.4611111, -1.14293, 1, 1, 1, 1, 1,
-0.003668365, -1.007171, -3.206506, 1, 1, 1, 1, 1,
-0.00122627, -1.297099, -3.240743, 1, 1, 1, 1, 1,
-0.0001684601, 2.601779, -0.9080443, 1, 1, 1, 1, 1,
0.0005490035, -0.1331222, 3.942179, 1, 1, 1, 1, 1,
0.003710898, 0.9438134, 0.3475319, 1, 1, 1, 1, 1,
0.01151516, 0.168265, 0.6595445, 1, 1, 1, 1, 1,
0.01407414, -1.084451, 4.080147, 1, 1, 1, 1, 1,
0.01486818, 1.688772, -0.008801278, 1, 1, 1, 1, 1,
0.0184436, 1.154881, 0.3653013, 1, 1, 1, 1, 1,
0.01978297, -0.4149874, 4.147268, 0, 0, 1, 1, 1,
0.02177291, -0.3321446, 2.278809, 1, 0, 0, 1, 1,
0.02266181, -0.2839575, 2.822273, 1, 0, 0, 1, 1,
0.02648504, 1.125964, 0.1669002, 1, 0, 0, 1, 1,
0.03041332, 0.5719859, -0.8167621, 1, 0, 0, 1, 1,
0.03093084, -0.2544601, 4.485596, 1, 0, 0, 1, 1,
0.0323485, 0.1782219, 1.841582, 0, 0, 0, 1, 1,
0.03246991, -0.05364161, 1.437519, 0, 0, 0, 1, 1,
0.03746163, 0.2652922, 0.01710589, 0, 0, 0, 1, 1,
0.03951386, -0.5345911, 5.133986, 0, 0, 0, 1, 1,
0.04135888, -0.35694, 3.452541, 0, 0, 0, 1, 1,
0.04276007, -0.8785373, 4.483137, 0, 0, 0, 1, 1,
0.04526798, 1.610299, 0.1852811, 0, 0, 0, 1, 1,
0.04771857, 0.02811636, 1.640684, 1, 1, 1, 1, 1,
0.04780072, -0.5297467, 4.118171, 1, 1, 1, 1, 1,
0.05154496, 1.616853, 0.3522142, 1, 1, 1, 1, 1,
0.05273097, -0.894539, 3.606352, 1, 1, 1, 1, 1,
0.05505, 1.526207, -0.6340863, 1, 1, 1, 1, 1,
0.05684086, -0.2417638, 1.143168, 1, 1, 1, 1, 1,
0.05815267, -0.8032082, 4.071501, 1, 1, 1, 1, 1,
0.05886637, -0.1509619, 2.967502, 1, 1, 1, 1, 1,
0.06161515, 1.669076, 0.006570051, 1, 1, 1, 1, 1,
0.06608135, -0.7517209, 5.780648, 1, 1, 1, 1, 1,
0.0713024, 1.005077, 2.435314, 1, 1, 1, 1, 1,
0.07226511, -0.4987912, 2.409093, 1, 1, 1, 1, 1,
0.07782455, 0.5016894, 0.6646109, 1, 1, 1, 1, 1,
0.07787634, 1.669949, 1.89536, 1, 1, 1, 1, 1,
0.07913204, -0.5111988, 4.738355, 1, 1, 1, 1, 1,
0.08015173, 0.8602877, 0.467626, 0, 0, 1, 1, 1,
0.08698881, 0.5611943, 1.28056, 1, 0, 0, 1, 1,
0.09034318, -0.7230586, 3.223267, 1, 0, 0, 1, 1,
0.09382141, 0.8003156, -0.08495063, 1, 0, 0, 1, 1,
0.09413175, 0.470155, 0.4140952, 1, 0, 0, 1, 1,
0.09471059, -0.780987, 0.7238706, 1, 0, 0, 1, 1,
0.09504155, 0.5924172, 0.2546741, 0, 0, 0, 1, 1,
0.09787486, -0.5776972, 2.117643, 0, 0, 0, 1, 1,
0.0979025, 0.9493209, -0.2843822, 0, 0, 0, 1, 1,
0.09794549, -0.04439246, 0.461816, 0, 0, 0, 1, 1,
0.09868047, -0.4979897, 3.0351, 0, 0, 0, 1, 1,
0.09889857, 0.5177062, 0.1481088, 0, 0, 0, 1, 1,
0.100586, 0.6595869, 0.08024834, 0, 0, 0, 1, 1,
0.1010253, 1.546605, 0.1559498, 1, 1, 1, 1, 1,
0.1034466, 0.8744148, 0.002180137, 1, 1, 1, 1, 1,
0.1087118, 0.6257509, 1.329685, 1, 1, 1, 1, 1,
0.1104247, -0.01040017, 2.019747, 1, 1, 1, 1, 1,
0.1116785, -0.3697087, 3.338331, 1, 1, 1, 1, 1,
0.1143461, 0.7379529, 0.4242466, 1, 1, 1, 1, 1,
0.1210364, -1.167251, 4.24599, 1, 1, 1, 1, 1,
0.1225642, -1.89799, 4.763572, 1, 1, 1, 1, 1,
0.131022, 0.7980113, -0.4541, 1, 1, 1, 1, 1,
0.134214, 0.1491366, 3.146107, 1, 1, 1, 1, 1,
0.1380295, -1.736024, 1.802846, 1, 1, 1, 1, 1,
0.1408705, -0.3690939, 3.438643, 1, 1, 1, 1, 1,
0.1411891, 0.26176, 0.381802, 1, 1, 1, 1, 1,
0.1460842, 0.1029548, 0.488162, 1, 1, 1, 1, 1,
0.1466192, -0.6635051, 3.274025, 1, 1, 1, 1, 1,
0.1527738, -1.201441, 2.968803, 0, 0, 1, 1, 1,
0.1573931, -0.420466, 3.564205, 1, 0, 0, 1, 1,
0.1583132, -0.001695853, 3.356183, 1, 0, 0, 1, 1,
0.1589733, 0.6532994, 0.1200721, 1, 0, 0, 1, 1,
0.1660502, 0.3687821, 0.01616946, 1, 0, 0, 1, 1,
0.1688844, 1.885408, -0.710754, 1, 0, 0, 1, 1,
0.1696645, -0.6931801, 4.099011, 0, 0, 0, 1, 1,
0.1700175, 0.9091139, 1.181379, 0, 0, 0, 1, 1,
0.1800878, 1.077844, 0.9421472, 0, 0, 0, 1, 1,
0.1817745, -0.3565999, 2.303019, 0, 0, 0, 1, 1,
0.183017, 0.06759034, 1.434682, 0, 0, 0, 1, 1,
0.1921197, 0.2641512, -1.624874, 0, 0, 0, 1, 1,
0.1921816, 0.04166564, -0.3328074, 0, 0, 0, 1, 1,
0.1924528, 1.172744, 0.7520617, 1, 1, 1, 1, 1,
0.195859, 2.017194, 0.1142201, 1, 1, 1, 1, 1,
0.1967019, 2.437881, -0.4670984, 1, 1, 1, 1, 1,
0.1989725, 0.7444189, 1.814176, 1, 1, 1, 1, 1,
0.2042549, 0.6766809, 1.212945, 1, 1, 1, 1, 1,
0.2046689, -0.3536185, 2.159708, 1, 1, 1, 1, 1,
0.2064698, -2.201877, 3.853309, 1, 1, 1, 1, 1,
0.2068363, -2.022145, 2.609723, 1, 1, 1, 1, 1,
0.2096746, 0.4612148, 1.447521, 1, 1, 1, 1, 1,
0.2112093, -0.3334332, 0.1784726, 1, 1, 1, 1, 1,
0.2149867, -0.7454937, 2.90696, 1, 1, 1, 1, 1,
0.2158595, 0.2476075, 2.429663, 1, 1, 1, 1, 1,
0.21601, 0.08536617, 1.07572, 1, 1, 1, 1, 1,
0.2187254, -0.5909579, 2.740089, 1, 1, 1, 1, 1,
0.2204432, 0.6484089, 0.7348927, 1, 1, 1, 1, 1,
0.2220684, -0.3415379, 0.87342, 0, 0, 1, 1, 1,
0.2236024, 1.046684, -0.4353963, 1, 0, 0, 1, 1,
0.2240402, -0.381542, 1.788122, 1, 0, 0, 1, 1,
0.2243778, -0.1714493, 2.83204, 1, 0, 0, 1, 1,
0.2280293, 1.353372, 1.243964, 1, 0, 0, 1, 1,
0.2284756, -0.7455284, 2.279642, 1, 0, 0, 1, 1,
0.2292995, -0.2641896, 2.552963, 0, 0, 0, 1, 1,
0.23356, -1.352173, 2.792266, 0, 0, 0, 1, 1,
0.2349243, -0.3920344, 1.918893, 0, 0, 0, 1, 1,
0.2350468, 0.710865, 0.361483, 0, 0, 0, 1, 1,
0.2353222, 0.5074204, -0.2099606, 0, 0, 0, 1, 1,
0.2380879, 1.852627, 0.6634933, 0, 0, 0, 1, 1,
0.2436864, -0.5508765, 1.74725, 0, 0, 0, 1, 1,
0.2459633, 0.3551038, 0.8463354, 1, 1, 1, 1, 1,
0.2467566, -0.7836947, 2.165973, 1, 1, 1, 1, 1,
0.2488818, -0.7075832, 2.055775, 1, 1, 1, 1, 1,
0.250914, 0.6805977, 1.142778, 1, 1, 1, 1, 1,
0.2509367, 1.310077, 0.1017326, 1, 1, 1, 1, 1,
0.2520019, -0.8131984, 2.491974, 1, 1, 1, 1, 1,
0.2572859, 0.3494055, -1.598325, 1, 1, 1, 1, 1,
0.2618958, -0.03363455, 1.75131, 1, 1, 1, 1, 1,
0.2695059, -0.3665926, 1.099472, 1, 1, 1, 1, 1,
0.2696616, 1.38524, -0.8176283, 1, 1, 1, 1, 1,
0.2747194, 0.6423017, 0.267338, 1, 1, 1, 1, 1,
0.2760691, 0.6962281, -1.354411, 1, 1, 1, 1, 1,
0.2776656, -0.9988086, 3.368218, 1, 1, 1, 1, 1,
0.2842443, -0.1632566, 1.790174, 1, 1, 1, 1, 1,
0.2910595, -0.5831605, 1.768483, 1, 1, 1, 1, 1,
0.2913026, -1.17917, 3.168064, 0, 0, 1, 1, 1,
0.2928201, -0.196339, 2.719492, 1, 0, 0, 1, 1,
0.2949844, -1.186652, 3.965239, 1, 0, 0, 1, 1,
0.2951961, -1.165998, 2.315063, 1, 0, 0, 1, 1,
0.295685, -0.5486922, 3.159679, 1, 0, 0, 1, 1,
0.29754, 0.1942721, 0.4431505, 1, 0, 0, 1, 1,
0.3007125, -2.123472, 3.832895, 0, 0, 0, 1, 1,
0.3025162, -1.19245, 3.064777, 0, 0, 0, 1, 1,
0.3025894, 0.1646236, 1.2619, 0, 0, 0, 1, 1,
0.3026934, 2.139016, -1.98587, 0, 0, 0, 1, 1,
0.3049237, 0.03588694, 1.412918, 0, 0, 0, 1, 1,
0.3063841, -0.9012005, 2.209641, 0, 0, 0, 1, 1,
0.3068414, -2.003902, 3.118581, 0, 0, 0, 1, 1,
0.3144957, -1.571085, 2.637231, 1, 1, 1, 1, 1,
0.3210308, -0.9595134, 1.778333, 1, 1, 1, 1, 1,
0.3230483, 1.030512, 0.01851427, 1, 1, 1, 1, 1,
0.3313962, 0.5821397, 0.886201, 1, 1, 1, 1, 1,
0.3317775, -0.4172296, 2.107592, 1, 1, 1, 1, 1,
0.332675, 0.9991367, -1.062167, 1, 1, 1, 1, 1,
0.3348306, -2.153159, 4.909517, 1, 1, 1, 1, 1,
0.3352742, 0.954416, 1.06036, 1, 1, 1, 1, 1,
0.3402249, -0.5639288, 1.835365, 1, 1, 1, 1, 1,
0.3456666, -2.146837, 3.612126, 1, 1, 1, 1, 1,
0.3524021, 2.259079, 0.6229573, 1, 1, 1, 1, 1,
0.3546868, -0.8981032, 2.666751, 1, 1, 1, 1, 1,
0.3632592, -0.6317295, 5.250835, 1, 1, 1, 1, 1,
0.3674289, -0.6811819, 3.019812, 1, 1, 1, 1, 1,
0.3725858, -0.9590043, 3.800292, 1, 1, 1, 1, 1,
0.3729925, 0.3211228, 1.358568, 0, 0, 1, 1, 1,
0.37758, -0.1064744, 0.9333395, 1, 0, 0, 1, 1,
0.3789423, 1.477039, 1.106089, 1, 0, 0, 1, 1,
0.3796286, 1.081667, 1.7314, 1, 0, 0, 1, 1,
0.3826982, 0.2569749, 0.4166268, 1, 0, 0, 1, 1,
0.3853216, 1.335279, -0.02119066, 1, 0, 0, 1, 1,
0.385788, -0.03103129, 1.348251, 0, 0, 0, 1, 1,
0.389518, 0.7201463, 0.2714718, 0, 0, 0, 1, 1,
0.3923963, -0.2261332, 1.384518, 0, 0, 0, 1, 1,
0.3982357, -0.9504657, 2.377952, 0, 0, 0, 1, 1,
0.4029669, 0.8591921, -0.4328374, 0, 0, 0, 1, 1,
0.4087181, -0.4098067, 1.214931, 0, 0, 0, 1, 1,
0.4120541, -2.181093, 3.178109, 0, 0, 0, 1, 1,
0.4131656, 0.0254846, 0.8051628, 1, 1, 1, 1, 1,
0.4165201, -1.175026, 3.689461, 1, 1, 1, 1, 1,
0.4218723, 0.8160319, 1.287519, 1, 1, 1, 1, 1,
0.4227711, 1.08468, 0.03822533, 1, 1, 1, 1, 1,
0.4291616, 0.2478264, 1.423387, 1, 1, 1, 1, 1,
0.4300606, -1.385363, 4.121942, 1, 1, 1, 1, 1,
0.4318253, 0.563671, 0.812092, 1, 1, 1, 1, 1,
0.4330721, 0.02593343, 1.173842, 1, 1, 1, 1, 1,
0.4382704, -1.414238, 2.675527, 1, 1, 1, 1, 1,
0.4396739, -1.282375, 3.529202, 1, 1, 1, 1, 1,
0.4466358, 0.01352677, 1.849723, 1, 1, 1, 1, 1,
0.4472479, -1.824077, 1.782088, 1, 1, 1, 1, 1,
0.4486205, -0.2782178, 0.1288708, 1, 1, 1, 1, 1,
0.449892, 0.1659927, 1.240955, 1, 1, 1, 1, 1,
0.4542305, -0.7355272, 2.775007, 1, 1, 1, 1, 1,
0.4550181, -0.6771435, 2.526, 0, 0, 1, 1, 1,
0.4611884, -0.650906, 2.699443, 1, 0, 0, 1, 1,
0.4627653, 1.282555, 0.6986246, 1, 0, 0, 1, 1,
0.463837, 1.25659, -1.401396, 1, 0, 0, 1, 1,
0.4657333, 0.8212326, 3.075286, 1, 0, 0, 1, 1,
0.4678905, -0.3559911, 3.167327, 1, 0, 0, 1, 1,
0.4822296, 2.48865, 0.2545605, 0, 0, 0, 1, 1,
0.4838751, 0.7487589, -1.114915, 0, 0, 0, 1, 1,
0.4908518, -0.4930194, 2.361098, 0, 0, 0, 1, 1,
0.494453, 0.1751239, 1.500338, 0, 0, 0, 1, 1,
0.5002381, 0.7838244, 0.2156706, 0, 0, 0, 1, 1,
0.5010914, 0.5002409, 1.913245, 0, 0, 0, 1, 1,
0.5044125, 0.1805395, -0.04989463, 0, 0, 0, 1, 1,
0.5084675, 0.5067545, -1.124832, 1, 1, 1, 1, 1,
0.5108602, 0.8712461, 0.8689148, 1, 1, 1, 1, 1,
0.511216, -0.9311063, 3.353212, 1, 1, 1, 1, 1,
0.5114589, 0.4122485, 1.000878, 1, 1, 1, 1, 1,
0.5142668, 0.3173819, 0.4073582, 1, 1, 1, 1, 1,
0.5153254, 0.4790952, 1.826588, 1, 1, 1, 1, 1,
0.5215483, -0.8402386, 3.553367, 1, 1, 1, 1, 1,
0.5221717, 0.405267, -0.1297397, 1, 1, 1, 1, 1,
0.5226534, 0.3481278, 1.38054, 1, 1, 1, 1, 1,
0.5233453, 0.3250615, 1.510124, 1, 1, 1, 1, 1,
0.5257298, -0.02589258, 0.3680226, 1, 1, 1, 1, 1,
0.5270545, -0.5924507, 4.621903, 1, 1, 1, 1, 1,
0.5274224, 0.3311975, -0.2367948, 1, 1, 1, 1, 1,
0.5285327, -0.4662109, 3.880304, 1, 1, 1, 1, 1,
0.528534, -2.470248, 4.112364, 1, 1, 1, 1, 1,
0.5334464, -0.5017261, 2.647381, 0, 0, 1, 1, 1,
0.5366526, 1.689635, 0.1260373, 1, 0, 0, 1, 1,
0.5368931, 0.1043345, 1.208711, 1, 0, 0, 1, 1,
0.5397031, -1.260228, 3.415092, 1, 0, 0, 1, 1,
0.5428624, 0.500635, -0.2055493, 1, 0, 0, 1, 1,
0.5485949, -0.3853441, 1.59809, 1, 0, 0, 1, 1,
0.5512729, 0.1155819, 1.412477, 0, 0, 0, 1, 1,
0.5515574, -1.023986, 2.523931, 0, 0, 0, 1, 1,
0.5575167, -2.199416, 3.447335, 0, 0, 0, 1, 1,
0.5584227, 0.8372908, 0.4582647, 0, 0, 0, 1, 1,
0.5603283, -0.2703717, 1.321009, 0, 0, 0, 1, 1,
0.5604053, 1.5118, -0.01446379, 0, 0, 0, 1, 1,
0.5604144, -0.2165405, 2.161226, 0, 0, 0, 1, 1,
0.5667331, -1.533756, 1.977845, 1, 1, 1, 1, 1,
0.5692807, 0.006137011, 3.151932, 1, 1, 1, 1, 1,
0.5779051, -0.178744, 2.111754, 1, 1, 1, 1, 1,
0.5831843, -0.8519459, 1.979777, 1, 1, 1, 1, 1,
0.5832227, 0.8998733, -1.201067, 1, 1, 1, 1, 1,
0.5853471, 0.8290433, -0.2692114, 1, 1, 1, 1, 1,
0.5867419, 0.8478737, 1.440986, 1, 1, 1, 1, 1,
0.5867509, 1.035286, 1.067611, 1, 1, 1, 1, 1,
0.587962, 1.986642, -0.2623269, 1, 1, 1, 1, 1,
0.5945216, 0.7921719, 1.2939, 1, 1, 1, 1, 1,
0.5947402, -0.02779064, 0.3900394, 1, 1, 1, 1, 1,
0.5972162, 1.005112, -0.2107491, 1, 1, 1, 1, 1,
0.5977823, 0.1258642, 1.136799, 1, 1, 1, 1, 1,
0.5979427, 0.001594652, 2.436079, 1, 1, 1, 1, 1,
0.5994236, 0.4049257, 0.2613492, 1, 1, 1, 1, 1,
0.6003383, 1.425054, 0.124758, 0, 0, 1, 1, 1,
0.6006669, 0.3244858, 0.9578454, 1, 0, 0, 1, 1,
0.6029598, -0.530967, 1.06762, 1, 0, 0, 1, 1,
0.6052186, -0.4297971, 2.295026, 1, 0, 0, 1, 1,
0.6059468, -0.3981862, 2.413849, 1, 0, 0, 1, 1,
0.6098719, 0.07005807, 1.184045, 1, 0, 0, 1, 1,
0.6100127, 1.838362, 1.071189, 0, 0, 0, 1, 1,
0.6130746, -0.6538985, 2.400314, 0, 0, 0, 1, 1,
0.624549, 0.08237776, 3.170058, 0, 0, 0, 1, 1,
0.6281003, 0.4101893, -0.4100583, 0, 0, 0, 1, 1,
0.6386226, -0.7291229, 1.740555, 0, 0, 0, 1, 1,
0.6389095, -0.311769, 1.671467, 0, 0, 0, 1, 1,
0.6412991, 1.391352, 1.299372, 0, 0, 0, 1, 1,
0.6414873, -0.8189572, 1.074014, 1, 1, 1, 1, 1,
0.6427069, 2.775797, 0.6163303, 1, 1, 1, 1, 1,
0.642715, -1.41295, 2.828822, 1, 1, 1, 1, 1,
0.6525422, -0.4817313, 0.3052878, 1, 1, 1, 1, 1,
0.6532464, 0.1426545, 1.921253, 1, 1, 1, 1, 1,
0.6591578, -1.130741, 2.133269, 1, 1, 1, 1, 1,
0.6666167, -0.4255234, 1.022902, 1, 1, 1, 1, 1,
0.6700808, 1.184428, -0.3488437, 1, 1, 1, 1, 1,
0.6717451, 0.9130937, 0.7537619, 1, 1, 1, 1, 1,
0.6766039, 0.759172, 1.950041, 1, 1, 1, 1, 1,
0.6771563, -0.1616103, 1.141882, 1, 1, 1, 1, 1,
0.6802349, -0.02248742, 2.029366, 1, 1, 1, 1, 1,
0.6806222, -0.181051, -0.01185614, 1, 1, 1, 1, 1,
0.6824818, -0.5297795, 0.9350989, 1, 1, 1, 1, 1,
0.6827533, -1.911497, 3.747185, 1, 1, 1, 1, 1,
0.6870422, -0.1607328, -0.01088269, 0, 0, 1, 1, 1,
0.6896442, 0.7605969, 0.1942664, 1, 0, 0, 1, 1,
0.6921834, 0.7009919, 0.3691295, 1, 0, 0, 1, 1,
0.699764, -0.1030605, 2.166943, 1, 0, 0, 1, 1,
0.7039642, -1.857563, 3.69267, 1, 0, 0, 1, 1,
0.7103493, 0.7725297, 0.1342894, 1, 0, 0, 1, 1,
0.7109662, -0.6157628, 0.7969159, 0, 0, 0, 1, 1,
0.7115495, -0.572043, 1.900973, 0, 0, 0, 1, 1,
0.7124431, 0.9918801, 2.197509, 0, 0, 0, 1, 1,
0.7145692, 1.173995, 0.2032448, 0, 0, 0, 1, 1,
0.7183295, 0.750828, -0.8714674, 0, 0, 0, 1, 1,
0.7185397, -0.4529994, 2.610375, 0, 0, 0, 1, 1,
0.7250593, 0.06069428, 3.241029, 0, 0, 0, 1, 1,
0.7306452, 0.196771, 2.198152, 1, 1, 1, 1, 1,
0.7310191, -0.8109993, 2.900065, 1, 1, 1, 1, 1,
0.7374526, -1.067587, 2.91996, 1, 1, 1, 1, 1,
0.7402569, 0.1841432, 1.807034, 1, 1, 1, 1, 1,
0.7467541, 0.8785511, 0.01812058, 1, 1, 1, 1, 1,
0.7481609, 0.4086701, -0.1569693, 1, 1, 1, 1, 1,
0.7502552, -0.2608641, 4.194619, 1, 1, 1, 1, 1,
0.7511199, 1.64478, 0.7412273, 1, 1, 1, 1, 1,
0.7563104, 0.1691778, 3.362411, 1, 1, 1, 1, 1,
0.762121, -0.366095, 3.43602, 1, 1, 1, 1, 1,
0.7635899, -0.4082103, 2.782135, 1, 1, 1, 1, 1,
0.7638444, -0.8312361, 1.383981, 1, 1, 1, 1, 1,
0.7732833, 1.390174, 0.5265595, 1, 1, 1, 1, 1,
0.7805369, 0.1202566, 2.258126, 1, 1, 1, 1, 1,
0.7858368, 0.8549581, -0.7742443, 1, 1, 1, 1, 1,
0.7859338, 2.278468, 1.311842, 0, 0, 1, 1, 1,
0.7898888, 0.6171117, 0.9057825, 1, 0, 0, 1, 1,
0.7967256, -0.2356588, -0.4101818, 1, 0, 0, 1, 1,
0.7993401, -1.037524, 0.7335644, 1, 0, 0, 1, 1,
0.8015474, -1.17238, 2.940864, 1, 0, 0, 1, 1,
0.8020037, -0.07637589, 2.309029, 1, 0, 0, 1, 1,
0.805879, 0.7130191, 2.082555, 0, 0, 0, 1, 1,
0.8100165, -2.745279, 4.636614, 0, 0, 0, 1, 1,
0.8160456, 0.1243989, 1.252215, 0, 0, 0, 1, 1,
0.8173002, -1.839789, 2.251975, 0, 0, 0, 1, 1,
0.8244072, 2.14475, -0.7280181, 0, 0, 0, 1, 1,
0.8250595, -0.2870192, 2.088609, 0, 0, 0, 1, 1,
0.8285891, -1.852449, 3.116737, 0, 0, 0, 1, 1,
0.8311618, 1.076684, -0.9136636, 1, 1, 1, 1, 1,
0.8352256, -0.1741561, 1.089634, 1, 1, 1, 1, 1,
0.8407331, 0.147494, 3.947145, 1, 1, 1, 1, 1,
0.8423927, -0.003113402, 3.206374, 1, 1, 1, 1, 1,
0.8426831, 0.3098742, 1.619455, 1, 1, 1, 1, 1,
0.8441623, 0.5358216, 0.8730201, 1, 1, 1, 1, 1,
0.8447199, -1.399606, 2.539143, 1, 1, 1, 1, 1,
0.8459947, -0.2197501, 4.673168, 1, 1, 1, 1, 1,
0.8473974, -1.022038, 3.361445, 1, 1, 1, 1, 1,
0.8551039, -0.5070287, 3.406601, 1, 1, 1, 1, 1,
0.855749, 1.042088, 0.2383379, 1, 1, 1, 1, 1,
0.8593498, -1.497859, 2.036103, 1, 1, 1, 1, 1,
0.8664501, -0.5287103, 0.5352187, 1, 1, 1, 1, 1,
0.8701554, 0.1424798, 0.8825468, 1, 1, 1, 1, 1,
0.8752423, -0.7832048, 1.958777, 1, 1, 1, 1, 1,
0.8766709, -0.4837517, 2.157867, 0, 0, 1, 1, 1,
0.879011, 0.2178459, 2.50613, 1, 0, 0, 1, 1,
0.8843023, -1.955301, 2.809404, 1, 0, 0, 1, 1,
0.8849148, 0.3278008, -0.07475223, 1, 0, 0, 1, 1,
0.8913034, -0.3675939, 1.773862, 1, 0, 0, 1, 1,
0.8931342, -0.9418676, 3.013163, 1, 0, 0, 1, 1,
0.9044924, -2.649484, 1.883879, 0, 0, 0, 1, 1,
0.9093755, 0.9548622, 1.215852, 0, 0, 0, 1, 1,
0.9134994, 0.2595304, 1.420844, 0, 0, 0, 1, 1,
0.9223331, 1.020174, 0.3215131, 0, 0, 0, 1, 1,
0.9265209, 0.3986228, 1.251802, 0, 0, 0, 1, 1,
0.9341342, 0.621855, 0.7792082, 0, 0, 0, 1, 1,
0.9345872, -0.2924534, 2.971751, 0, 0, 0, 1, 1,
0.9356647, 0.2875511, 2.190942, 1, 1, 1, 1, 1,
0.9364511, 0.1789597, 2.074588, 1, 1, 1, 1, 1,
0.9373175, -0.4652262, 1.874041, 1, 1, 1, 1, 1,
0.9423323, -1.753847, 2.086329, 1, 1, 1, 1, 1,
0.9460861, 0.5750862, -0.05218609, 1, 1, 1, 1, 1,
0.9495415, 0.4810174, 1.101698, 1, 1, 1, 1, 1,
0.954989, -0.5147378, 2.300814, 1, 1, 1, 1, 1,
0.9576384, 0.8811277, -0.2400872, 1, 1, 1, 1, 1,
0.9610931, -1.182422, 3.880925, 1, 1, 1, 1, 1,
0.9655952, 0.4463171, 1.826907, 1, 1, 1, 1, 1,
0.9754527, 0.9424822, 1.420484, 1, 1, 1, 1, 1,
0.9790837, -0.09099621, 2.56474, 1, 1, 1, 1, 1,
0.9796854, -0.7981638, 2.282898, 1, 1, 1, 1, 1,
0.9797716, 0.01890112, 1.24655, 1, 1, 1, 1, 1,
1.001925, 0.7023857, 0.518786, 1, 1, 1, 1, 1,
1.005111, -1.050207, 2.714256, 0, 0, 1, 1, 1,
1.026079, -0.3897879, 3.23586, 1, 0, 0, 1, 1,
1.027695, 1.569497, 1.584148, 1, 0, 0, 1, 1,
1.028585, -2.303542, 2.883038, 1, 0, 0, 1, 1,
1.031244, 1.277105, 0.1990867, 1, 0, 0, 1, 1,
1.033753, 0.4785263, 0.8324468, 1, 0, 0, 1, 1,
1.033999, -0.7366458, 3.764285, 0, 0, 0, 1, 1,
1.035445, -0.5839566, 0.1663817, 0, 0, 0, 1, 1,
1.036386, 0.5201578, 0.4959311, 0, 0, 0, 1, 1,
1.044423, 0.5799214, 1.740183, 0, 0, 0, 1, 1,
1.048392, -0.8846824, 1.879301, 0, 0, 0, 1, 1,
1.04906, -0.2270831, -0.3588266, 0, 0, 0, 1, 1,
1.050165, 0.8572552, 1.073116, 0, 0, 0, 1, 1,
1.05097, 0.4127669, 1.959921, 1, 1, 1, 1, 1,
1.05444, 0.2590328, 1.703386, 1, 1, 1, 1, 1,
1.054668, -1.201726, 3.178991, 1, 1, 1, 1, 1,
1.05581, -0.02220341, 4.938631, 1, 1, 1, 1, 1,
1.061087, 0.1748694, 0.7293432, 1, 1, 1, 1, 1,
1.067091, -0.6924601, 2.105285, 1, 1, 1, 1, 1,
1.081046, 0.2375818, 0.4617928, 1, 1, 1, 1, 1,
1.082883, 0.4660987, 1.096444, 1, 1, 1, 1, 1,
1.091784, -0.1356423, 1.06541, 1, 1, 1, 1, 1,
1.097578, -0.9134164, 2.321988, 1, 1, 1, 1, 1,
1.098242, 1.17193, 1.944499, 1, 1, 1, 1, 1,
1.118501, 0.09686199, 0.7391865, 1, 1, 1, 1, 1,
1.121271, 1.012561, 0.5326892, 1, 1, 1, 1, 1,
1.122639, 0.2385946, -0.07461788, 1, 1, 1, 1, 1,
1.125772, -0.03090376, 2.512357, 1, 1, 1, 1, 1,
1.129618, -0.5317535, 1.525339, 0, 0, 1, 1, 1,
1.1298, 0.2148355, 2.039911, 1, 0, 0, 1, 1,
1.130611, 0.1281856, 3.664572, 1, 0, 0, 1, 1,
1.136372, -2.37265, 4.20496, 1, 0, 0, 1, 1,
1.141514, -1.217664, 1.392391, 1, 0, 0, 1, 1,
1.14579, 0.02488787, 1.73686, 1, 0, 0, 1, 1,
1.147288, -1.099028, 1.825964, 0, 0, 0, 1, 1,
1.153819, 1.319271, -1.840096, 0, 0, 0, 1, 1,
1.155422, 0.150189, 2.01957, 0, 0, 0, 1, 1,
1.190634, -1.757366, 2.289361, 0, 0, 0, 1, 1,
1.193325, 0.9513208, 1.464562, 0, 0, 0, 1, 1,
1.218699, -1.818148, 5.004774, 0, 0, 0, 1, 1,
1.22736, 1.278337, 0.1037742, 0, 0, 0, 1, 1,
1.227497, 1.427224, 0.974691, 1, 1, 1, 1, 1,
1.235334, 0.01203153, 0.8953822, 1, 1, 1, 1, 1,
1.246238, 0.4517983, 1.370689, 1, 1, 1, 1, 1,
1.249316, 0.6262004, 0.4377053, 1, 1, 1, 1, 1,
1.250708, 0.1001377, 2.312854, 1, 1, 1, 1, 1,
1.254507, 0.5319072, 0.7067125, 1, 1, 1, 1, 1,
1.263077, -0.3223369, 0.8818734, 1, 1, 1, 1, 1,
1.265725, -0.09613251, 1.835064, 1, 1, 1, 1, 1,
1.268614, 1.162165, 1.99129, 1, 1, 1, 1, 1,
1.272005, -0.3033698, 1.132669, 1, 1, 1, 1, 1,
1.27817, 0.09251862, 2.520549, 1, 1, 1, 1, 1,
1.27947, 2.375288, 1.432396, 1, 1, 1, 1, 1,
1.281218, 0.0584784, 1.269224, 1, 1, 1, 1, 1,
1.282001, 0.1197458, 0.6160107, 1, 1, 1, 1, 1,
1.287506, -0.08314356, -1.710006, 1, 1, 1, 1, 1,
1.288082, 0.4787744, 2.237042, 0, 0, 1, 1, 1,
1.294068, 0.3224207, 0.1127872, 1, 0, 0, 1, 1,
1.295406, -0.05495696, 1.29432, 1, 0, 0, 1, 1,
1.295533, -0.6602468, 1.704105, 1, 0, 0, 1, 1,
1.299373, -0.283252, 0.966476, 1, 0, 0, 1, 1,
1.312843, 0.4118144, 1.907851, 1, 0, 0, 1, 1,
1.313183, -0.3915884, 2.184165, 0, 0, 0, 1, 1,
1.315482, 0.1776436, 1.403745, 0, 0, 0, 1, 1,
1.317839, 0.4395905, 2.464031, 0, 0, 0, 1, 1,
1.322878, -0.2843762, 2.641668, 0, 0, 0, 1, 1,
1.328096, 0.05886237, 2.716405, 0, 0, 0, 1, 1,
1.328718, 0.4982773, 2.421402, 0, 0, 0, 1, 1,
1.364742, 0.6757029, 1.084078, 0, 0, 0, 1, 1,
1.36526, 0.3163374, 1.937698, 1, 1, 1, 1, 1,
1.375276, -0.3878399, 1.728003, 1, 1, 1, 1, 1,
1.379277, -0.2697605, 1.843368, 1, 1, 1, 1, 1,
1.393358, 0.3814429, 0.1050795, 1, 1, 1, 1, 1,
1.395741, -0.1440117, -0.1449827, 1, 1, 1, 1, 1,
1.40389, 0.9871714, 1.351609, 1, 1, 1, 1, 1,
1.423374, -0.5282955, 2.096117, 1, 1, 1, 1, 1,
1.424772, -0.2029481, 0.07264621, 1, 1, 1, 1, 1,
1.432088, -1.441847, 3.867321, 1, 1, 1, 1, 1,
1.432695, -0.8876504, 1.866249, 1, 1, 1, 1, 1,
1.433704, -0.6880426, 0.9545837, 1, 1, 1, 1, 1,
1.434676, -0.7866381, 2.101916, 1, 1, 1, 1, 1,
1.440426, 0.3438667, 2.843611, 1, 1, 1, 1, 1,
1.441125, 0.2568366, 1.614725, 1, 1, 1, 1, 1,
1.441993, -1.551119, 1.097568, 1, 1, 1, 1, 1,
1.454217, 0.8680571, 0.3353143, 0, 0, 1, 1, 1,
1.460268, 0.02011571, 1.332516, 1, 0, 0, 1, 1,
1.467884, -0.387732, 2.477366, 1, 0, 0, 1, 1,
1.481253, 1.069093, 0.06653782, 1, 0, 0, 1, 1,
1.485817, 0.8959274, 1.51112, 1, 0, 0, 1, 1,
1.502357, 1.83511, -0.4066892, 1, 0, 0, 1, 1,
1.51202, 1.530744, 0.9350528, 0, 0, 0, 1, 1,
1.525841, 0.02502182, 2.507806, 0, 0, 0, 1, 1,
1.527061, -0.445378, 1.720809, 0, 0, 0, 1, 1,
1.536779, -0.1474393, 2.408285, 0, 0, 0, 1, 1,
1.545511, -0.5685809, 1.146642, 0, 0, 0, 1, 1,
1.546434, 0.7935473, 1.795539, 0, 0, 0, 1, 1,
1.549193, -0.7158488, 1.971997, 0, 0, 0, 1, 1,
1.551174, -0.4465601, 2.170154, 1, 1, 1, 1, 1,
1.56027, 0.29875, 0.8871238, 1, 1, 1, 1, 1,
1.563887, 0.9158227, 1.624652, 1, 1, 1, 1, 1,
1.564511, 0.4553481, 0.8260748, 1, 1, 1, 1, 1,
1.580225, 2.776482, 1.174277, 1, 1, 1, 1, 1,
1.589015, -0.9050394, 2.499685, 1, 1, 1, 1, 1,
1.594403, -0.8231809, 2.905221, 1, 1, 1, 1, 1,
1.602165, 0.2074019, 1.761654, 1, 1, 1, 1, 1,
1.606722, -1.480034, 3.591813, 1, 1, 1, 1, 1,
1.609985, -1.752037, 2.804383, 1, 1, 1, 1, 1,
1.622996, 0.5897557, 0.7670476, 1, 1, 1, 1, 1,
1.623386, -0.07566038, 1.710444, 1, 1, 1, 1, 1,
1.637624, 0.3621009, 1.119586, 1, 1, 1, 1, 1,
1.644365, -0.7387556, 2.142129, 1, 1, 1, 1, 1,
1.647952, 1.0301, 1.02827, 1, 1, 1, 1, 1,
1.652202, 2.578233, 1.502876, 0, 0, 1, 1, 1,
1.656822, -0.1454291, 0.4129895, 1, 0, 0, 1, 1,
1.668188, 0.9408524, 0.03464582, 1, 0, 0, 1, 1,
1.676699, 1.527955, 0.4456844, 1, 0, 0, 1, 1,
1.680761, 0.1113712, 3.149603, 1, 0, 0, 1, 1,
1.685896, -0.705206, 3.702207, 1, 0, 0, 1, 1,
1.706207, -0.5607696, 2.888694, 0, 0, 0, 1, 1,
1.712375, 0.08741275, 2.769596, 0, 0, 0, 1, 1,
1.718856, -0.2650769, 0.9921159, 0, 0, 0, 1, 1,
1.722622, 1.841652, 0.7541323, 0, 0, 0, 1, 1,
1.732219, 1.773912, 0.7726774, 0, 0, 0, 1, 1,
1.732868, 0.7545972, 1.426358, 0, 0, 0, 1, 1,
1.766523, 0.6097485, 1.506793, 0, 0, 0, 1, 1,
1.782017, -0.02197181, 1.919906, 1, 1, 1, 1, 1,
1.817156, 1.787022, 0.3835112, 1, 1, 1, 1, 1,
1.821499, 0.5887772, 1.454641, 1, 1, 1, 1, 1,
1.835109, 0.07121421, 1.955311, 1, 1, 1, 1, 1,
1.844789, -0.5984831, 2.567465, 1, 1, 1, 1, 1,
1.864549, 0.6857574, 2.089824, 1, 1, 1, 1, 1,
1.891502, 1.774811, -0.7442252, 1, 1, 1, 1, 1,
1.92843, -0.4871356, 1.593392, 1, 1, 1, 1, 1,
1.929665, 0.7296575, 1.015052, 1, 1, 1, 1, 1,
1.938576, 0.2866198, 2.032957, 1, 1, 1, 1, 1,
1.979765, -0.6179493, 1.048854, 1, 1, 1, 1, 1,
1.991885, -0.5192422, 2.147572, 1, 1, 1, 1, 1,
1.992525, 1.186867, 0.4603481, 1, 1, 1, 1, 1,
1.995785, -0.004118999, 1.475598, 1, 1, 1, 1, 1,
2.05437, 0.1480098, 1.944255, 1, 1, 1, 1, 1,
2.093566, 1.130398, 0.08596269, 0, 0, 1, 1, 1,
2.128326, -1.825228, 1.608106, 1, 0, 0, 1, 1,
2.131833, -1.452657, 3.059535, 1, 0, 0, 1, 1,
2.144092, 1.306755, 0.8622547, 1, 0, 0, 1, 1,
2.22565, -0.09242332, 0.9075581, 1, 0, 0, 1, 1,
2.261992, -0.8987099, 2.426435, 1, 0, 0, 1, 1,
2.265037, 0.5450343, 1.038038, 0, 0, 0, 1, 1,
2.269215, 0.5116357, 1.92739, 0, 0, 0, 1, 1,
2.323384, -0.2813983, 2.406381, 0, 0, 0, 1, 1,
2.329307, -0.7040483, 1.387871, 0, 0, 0, 1, 1,
2.34098, -0.2613521, 3.661163, 0, 0, 0, 1, 1,
2.407935, -0.6982206, 2.382217, 0, 0, 0, 1, 1,
2.597316, -1.628157, 2.036568, 0, 0, 0, 1, 1,
2.602174, -0.01921223, 2.834675, 1, 1, 1, 1, 1,
2.702517, 1.390111, 1.466372, 1, 1, 1, 1, 1,
2.785029, 0.5096856, -0.8407753, 1, 1, 1, 1, 1,
2.82496, -0.9838631, 1.46478, 1, 1, 1, 1, 1,
2.844321, 0.05645197, 0.7732897, 1, 1, 1, 1, 1,
3.123064, 1.073499, 2.143936, 1, 1, 1, 1, 1,
3.178975, -0.469702, 2.902717, 1, 1, 1, 1, 1
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
var radius = 9.745239;
var distance = 34.22974;
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
mvMatrix.translate( 0.01784921, 0.5177958, -0.3229816 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.22974);
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
