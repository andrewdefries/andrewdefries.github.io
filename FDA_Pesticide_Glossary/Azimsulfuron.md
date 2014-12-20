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
-3.250512, -1.78349, -0.9708127, 1, 0, 0, 1,
-2.919072, -0.9363188, -1.274894, 1, 0.007843138, 0, 1,
-2.581928, 0.1674699, -0.6503935, 1, 0.01176471, 0, 1,
-2.523486, -1.227612, -1.629069, 1, 0.01960784, 0, 1,
-2.49214, -0.6059181, -2.078414, 1, 0.02352941, 0, 1,
-2.441058, -0.2783555, -3.210392, 1, 0.03137255, 0, 1,
-2.378224, -0.7580587, -4.103748, 1, 0.03529412, 0, 1,
-2.361527, -0.1922812, -2.806662, 1, 0.04313726, 0, 1,
-2.292412, 1.490722, 0.6590143, 1, 0.04705882, 0, 1,
-2.2867, 0.9318115, -3.393741, 1, 0.05490196, 0, 1,
-2.286294, -0.4472461, -2.533567, 1, 0.05882353, 0, 1,
-2.208364, -0.6614704, -1.901737, 1, 0.06666667, 0, 1,
-2.208325, 0.397552, -2.370478, 1, 0.07058824, 0, 1,
-2.115086, 0.3468305, -1.308945, 1, 0.07843138, 0, 1,
-2.109496, -0.005086908, -0.1926265, 1, 0.08235294, 0, 1,
-2.100316, -1.144386, -0.2150623, 1, 0.09019608, 0, 1,
-2.070844, 1.773248, -1.551327, 1, 0.09411765, 0, 1,
-2.068451, -0.04621059, -4.390795, 1, 0.1019608, 0, 1,
-2.066972, -0.6286489, -2.748566, 1, 0.1098039, 0, 1,
-2.023923, -0.1917785, -1.693339, 1, 0.1137255, 0, 1,
-2.007966, 0.2410119, -1.219466, 1, 0.1215686, 0, 1,
-2.001283, 0.5543082, -1.248221, 1, 0.1254902, 0, 1,
-1.967956, 0.803001, 0.3483848, 1, 0.1333333, 0, 1,
-1.941043, -1.642776, -1.168361, 1, 0.1372549, 0, 1,
-1.934671, 0.5070912, -1.748253, 1, 0.145098, 0, 1,
-1.925921, 0.5201766, -2.090793, 1, 0.1490196, 0, 1,
-1.923558, -1.427577, -1.602231, 1, 0.1568628, 0, 1,
-1.920738, -0.4984948, -1.520861, 1, 0.1607843, 0, 1,
-1.898402, 0.4362014, -1.624733, 1, 0.1686275, 0, 1,
-1.865477, -0.01088134, -1.490368, 1, 0.172549, 0, 1,
-1.81617, -0.957616, -3.733552, 1, 0.1803922, 0, 1,
-1.799648, -1.011195, -3.0106, 1, 0.1843137, 0, 1,
-1.798526, -0.560695, -1.757756, 1, 0.1921569, 0, 1,
-1.794842, 0.680049, -1.579477, 1, 0.1960784, 0, 1,
-1.784314, -1.931472, -1.874677, 1, 0.2039216, 0, 1,
-1.7728, -0.3693346, -2.153283, 1, 0.2117647, 0, 1,
-1.761588, 0.7536216, -0.1469561, 1, 0.2156863, 0, 1,
-1.759867, 0.09487517, -0.2734299, 1, 0.2235294, 0, 1,
-1.752283, -0.7151465, -2.703345, 1, 0.227451, 0, 1,
-1.751653, -0.5262679, -1.07098, 1, 0.2352941, 0, 1,
-1.745827, 1.27673, -2.22994, 1, 0.2392157, 0, 1,
-1.726348, 0.287788, -3.156011, 1, 0.2470588, 0, 1,
-1.72068, -0.5191157, -1.922103, 1, 0.2509804, 0, 1,
-1.720559, -0.3767267, -2.081304, 1, 0.2588235, 0, 1,
-1.715744, 0.7774507, -1.655102, 1, 0.2627451, 0, 1,
-1.713815, -1.807562, -2.312197, 1, 0.2705882, 0, 1,
-1.707663, -1.133282, -2.85265, 1, 0.2745098, 0, 1,
-1.699808, -0.7684402, -2.981617, 1, 0.282353, 0, 1,
-1.675951, 0.2031882, -0.1026088, 1, 0.2862745, 0, 1,
-1.665627, 0.5072597, -1.646906, 1, 0.2941177, 0, 1,
-1.653557, -0.6020371, -2.915045, 1, 0.3019608, 0, 1,
-1.64666, -2.198499, -3.107733, 1, 0.3058824, 0, 1,
-1.639135, -1.246624, -1.521629, 1, 0.3137255, 0, 1,
-1.608559, -0.5542594, -0.4520875, 1, 0.3176471, 0, 1,
-1.6009, 0.9033808, -0.366917, 1, 0.3254902, 0, 1,
-1.585773, -1.252952, -1.55409, 1, 0.3294118, 0, 1,
-1.585657, -2.278078, -3.3809, 1, 0.3372549, 0, 1,
-1.580713, 0.4466317, -2.176319, 1, 0.3411765, 0, 1,
-1.55688, 0.943208, -1.27931, 1, 0.3490196, 0, 1,
-1.552589, -1.941809, -3.472412, 1, 0.3529412, 0, 1,
-1.551926, 0.6077402, -1.513531, 1, 0.3607843, 0, 1,
-1.538074, -1.08581, -2.048505, 1, 0.3647059, 0, 1,
-1.52638, -0.7770014, -2.652513, 1, 0.372549, 0, 1,
-1.513576, -1.016639, -1.7681, 1, 0.3764706, 0, 1,
-1.511811, -0.9698517, -2.650402, 1, 0.3843137, 0, 1,
-1.510636, 0.7608114, -1.556212, 1, 0.3882353, 0, 1,
-1.506444, 0.6555508, -2.273082, 1, 0.3960784, 0, 1,
-1.506336, -1.106683, -2.568095, 1, 0.4039216, 0, 1,
-1.500072, 1.418548, -1.263608, 1, 0.4078431, 0, 1,
-1.496954, -1.430151, -2.311356, 1, 0.4156863, 0, 1,
-1.493027, -0.868714, -1.200721, 1, 0.4196078, 0, 1,
-1.484394, 0.1321674, -1.71227, 1, 0.427451, 0, 1,
-1.471824, -1.542899, -3.337489, 1, 0.4313726, 0, 1,
-1.464817, 1.249171, -0.3298104, 1, 0.4392157, 0, 1,
-1.424784, 0.5674457, -0.8390003, 1, 0.4431373, 0, 1,
-1.423815, 1.562963, 0.5458677, 1, 0.4509804, 0, 1,
-1.420452, 0.354966, 0.1637026, 1, 0.454902, 0, 1,
-1.414457, 0.743045, -2.002993, 1, 0.4627451, 0, 1,
-1.413761, -0.8728615, -1.177262, 1, 0.4666667, 0, 1,
-1.413039, 0.40484, -1.25149, 1, 0.4745098, 0, 1,
-1.396891, 0.4249439, -0.1744529, 1, 0.4784314, 0, 1,
-1.391791, -0.06852145, -2.504489, 1, 0.4862745, 0, 1,
-1.391087, -0.7992952, -2.982552, 1, 0.4901961, 0, 1,
-1.39051, 0.3977541, -0.4553762, 1, 0.4980392, 0, 1,
-1.380734, -1.540787, -2.357128, 1, 0.5058824, 0, 1,
-1.374973, 0.3033408, -1.527148, 1, 0.509804, 0, 1,
-1.370624, -0.1896656, -1.204287, 1, 0.5176471, 0, 1,
-1.360358, 0.3981146, -0.8070841, 1, 0.5215687, 0, 1,
-1.355284, -0.3308766, -2.398499, 1, 0.5294118, 0, 1,
-1.336871, -0.2490979, -1.7394, 1, 0.5333334, 0, 1,
-1.331114, 0.2406021, -0.8594117, 1, 0.5411765, 0, 1,
-1.320327, -0.705679, -2.060233, 1, 0.5450981, 0, 1,
-1.319542, 0.4832828, -0.1327897, 1, 0.5529412, 0, 1,
-1.316388, -1.26183, -2.388178, 1, 0.5568628, 0, 1,
-1.314261, -0.5037437, -2.477454, 1, 0.5647059, 0, 1,
-1.29982, -0.9747439, -1.804349, 1, 0.5686275, 0, 1,
-1.295965, -0.6249797, 0.2153022, 1, 0.5764706, 0, 1,
-1.294529, -0.05345413, -2.737722, 1, 0.5803922, 0, 1,
-1.293478, 0.3842794, -1.520138, 1, 0.5882353, 0, 1,
-1.292098, -1.795818, -1.364916, 1, 0.5921569, 0, 1,
-1.288535, 0.1120856, -2.287067, 1, 0.6, 0, 1,
-1.278622, 0.9469029, -2.686203, 1, 0.6078432, 0, 1,
-1.263855, 0.3835973, -0.6193336, 1, 0.6117647, 0, 1,
-1.253515, 1.52792, 0.01342078, 1, 0.6196079, 0, 1,
-1.251902, 1.141975, -1.195298, 1, 0.6235294, 0, 1,
-1.249727, -0.2218232, -2.893689, 1, 0.6313726, 0, 1,
-1.234371, 0.2854441, -1.727522, 1, 0.6352941, 0, 1,
-1.233018, -0.2336892, -1.298369, 1, 0.6431373, 0, 1,
-1.227882, -1.426255, -1.9139, 1, 0.6470588, 0, 1,
-1.221633, 1.628064, -1.615732, 1, 0.654902, 0, 1,
-1.219155, -0.9561843, -2.967085, 1, 0.6588235, 0, 1,
-1.218801, -0.3691688, -0.9064724, 1, 0.6666667, 0, 1,
-1.211749, -0.1494707, -2.089574, 1, 0.6705883, 0, 1,
-1.210046, 0.06051501, -1.726636, 1, 0.6784314, 0, 1,
-1.210029, 1.698428, 0.6396453, 1, 0.682353, 0, 1,
-1.208382, 0.4173056, -0.5925059, 1, 0.6901961, 0, 1,
-1.195702, -0.9894018, -2.587761, 1, 0.6941177, 0, 1,
-1.190992, 0.850789, -0.1867014, 1, 0.7019608, 0, 1,
-1.189319, 0.8377795, -2.04964, 1, 0.7098039, 0, 1,
-1.188844, -0.1178267, -1.835753, 1, 0.7137255, 0, 1,
-1.186843, -0.7065564, -3.110659, 1, 0.7215686, 0, 1,
-1.184184, -0.1702242, -1.680859, 1, 0.7254902, 0, 1,
-1.184175, -0.7416062, -0.7435503, 1, 0.7333333, 0, 1,
-1.178255, 1.423899, -0.5711645, 1, 0.7372549, 0, 1,
-1.175305, -0.4599622, -1.009642, 1, 0.7450981, 0, 1,
-1.172847, 1.258191, 0.03532692, 1, 0.7490196, 0, 1,
-1.170568, -2.125673, -2.319212, 1, 0.7568628, 0, 1,
-1.169438, -1.935107, -3.129597, 1, 0.7607843, 0, 1,
-1.169134, 0.5713867, -2.550388, 1, 0.7686275, 0, 1,
-1.169062, 0.1031452, -0.2968923, 1, 0.772549, 0, 1,
-1.16685, 0.7797151, 2.346749, 1, 0.7803922, 0, 1,
-1.164649, 0.1050457, -0.9688495, 1, 0.7843137, 0, 1,
-1.164107, 1.47864, -1.353023, 1, 0.7921569, 0, 1,
-1.153027, -0.5452533, -1.879922, 1, 0.7960784, 0, 1,
-1.147215, -1.370105, -1.400532, 1, 0.8039216, 0, 1,
-1.138694, 1.302608, -0.4126661, 1, 0.8117647, 0, 1,
-1.135355, -0.5218812, -4.246574, 1, 0.8156863, 0, 1,
-1.134572, -0.295102, -2.267073, 1, 0.8235294, 0, 1,
-1.113101, 0.7295756, -0.0616116, 1, 0.827451, 0, 1,
-1.110335, -0.3392147, -0.3868987, 1, 0.8352941, 0, 1,
-1.106333, -0.7889699, -1.482839, 1, 0.8392157, 0, 1,
-1.102396, -0.05691622, 0.02402136, 1, 0.8470588, 0, 1,
-1.101658, 1.03735, 0.7162872, 1, 0.8509804, 0, 1,
-1.099825, 0.0463194, -1.575528, 1, 0.8588235, 0, 1,
-1.091325, 0.8625649, -1.171393, 1, 0.8627451, 0, 1,
-1.090242, -1.631978, -2.825778, 1, 0.8705882, 0, 1,
-1.090024, -0.6752953, -1.833656, 1, 0.8745098, 0, 1,
-1.080664, -1.567133, -4.052054, 1, 0.8823529, 0, 1,
-1.077948, -0.1131019, -2.52668, 1, 0.8862745, 0, 1,
-1.071187, 0.7885186, -0.7670718, 1, 0.8941177, 0, 1,
-1.070415, 0.2159989, -0.9776373, 1, 0.8980392, 0, 1,
-1.067017, 0.3611178, -0.7741122, 1, 0.9058824, 0, 1,
-1.064032, -1.479542, -4.773336, 1, 0.9137255, 0, 1,
-1.063609, -0.07875855, -1.630951, 1, 0.9176471, 0, 1,
-1.059817, 0.1925133, -2.532181, 1, 0.9254902, 0, 1,
-1.058037, 1.443215, -0.8280097, 1, 0.9294118, 0, 1,
-1.056074, -0.3115867, -2.264646, 1, 0.9372549, 0, 1,
-1.051724, -0.5199183, -0.3516789, 1, 0.9411765, 0, 1,
-1.048974, -0.8363293, -2.932949, 1, 0.9490196, 0, 1,
-1.045156, 4.058167, 0.2065223, 1, 0.9529412, 0, 1,
-1.044738, -0.1169376, -2.032834, 1, 0.9607843, 0, 1,
-1.039539, 0.07503207, -3.310285, 1, 0.9647059, 0, 1,
-1.037702, -0.2872512, -1.506391, 1, 0.972549, 0, 1,
-1.037138, -0.02231496, -2.15924, 1, 0.9764706, 0, 1,
-1.03351, 0.7661643, -0.3328126, 1, 0.9843137, 0, 1,
-1.02822, 1.828001, -2.94292, 1, 0.9882353, 0, 1,
-1.026834, 0.6385417, -2.075154, 1, 0.9960784, 0, 1,
-1.019375, 0.8682552, -0.6341342, 0.9960784, 1, 0, 1,
-1.019353, 0.127523, -0.8152927, 0.9921569, 1, 0, 1,
-1.018638, 0.438132, -0.5158219, 0.9843137, 1, 0, 1,
-1.018398, 0.6774964, -0.1152189, 0.9803922, 1, 0, 1,
-1.009713, -1.42871, -3.219232, 0.972549, 1, 0, 1,
-1.005494, -2.777641, -1.988416, 0.9686275, 1, 0, 1,
-1.002407, -0.1105759, -0.06119304, 0.9607843, 1, 0, 1,
-0.9859663, -0.923668, -2.055408, 0.9568627, 1, 0, 1,
-0.9847929, -0.3867424, -2.413535, 0.9490196, 1, 0, 1,
-0.9838705, -0.6560215, -2.403805, 0.945098, 1, 0, 1,
-0.9785824, 0.9949715, -0.5914838, 0.9372549, 1, 0, 1,
-0.9655169, 0.1017247, -1.576787, 0.9333333, 1, 0, 1,
-0.945302, 0.3460236, -1.904114, 0.9254902, 1, 0, 1,
-0.9413085, -0.003403672, -1.804664, 0.9215686, 1, 0, 1,
-0.9410655, -0.1028408, -1.040308, 0.9137255, 1, 0, 1,
-0.9376065, -0.5481321, -1.573797, 0.9098039, 1, 0, 1,
-0.9333584, -0.4902005, -1.969362, 0.9019608, 1, 0, 1,
-0.9317849, 0.1242034, -1.616183, 0.8941177, 1, 0, 1,
-0.9317485, 2.302603, 0.7096423, 0.8901961, 1, 0, 1,
-0.9226186, -0.5615872, -2.770936, 0.8823529, 1, 0, 1,
-0.9208686, 0.6489143, -0.2767766, 0.8784314, 1, 0, 1,
-0.9168989, -2.052483, -4.51113, 0.8705882, 1, 0, 1,
-0.9149677, 1.548995, -0.7501784, 0.8666667, 1, 0, 1,
-0.9129211, 0.470686, -1.485321, 0.8588235, 1, 0, 1,
-0.9120013, 1.481328, 0.6952888, 0.854902, 1, 0, 1,
-0.9085584, 0.2688438, -1.898833, 0.8470588, 1, 0, 1,
-0.9062394, 0.1626121, -1.525434, 0.8431373, 1, 0, 1,
-0.9050766, 0.6574352, -0.0890702, 0.8352941, 1, 0, 1,
-0.9050092, -1.826659, -2.360696, 0.8313726, 1, 0, 1,
-0.9034842, 1.027817, -0.8849884, 0.8235294, 1, 0, 1,
-0.9024349, 0.02796194, -1.804862, 0.8196079, 1, 0, 1,
-0.8940538, -1.715245, -0.7974179, 0.8117647, 1, 0, 1,
-0.894039, 0.6927941, 0.6414709, 0.8078431, 1, 0, 1,
-0.8903832, 0.3171045, -2.083858, 0.8, 1, 0, 1,
-0.8897755, -0.654119, -3.155656, 0.7921569, 1, 0, 1,
-0.8841394, 0.605688, -3.451162, 0.7882353, 1, 0, 1,
-0.8697363, -0.5192301, -2.932705, 0.7803922, 1, 0, 1,
-0.8694773, -0.8969948, -1.776034, 0.7764706, 1, 0, 1,
-0.8660021, 0.8982, -0.4131816, 0.7686275, 1, 0, 1,
-0.8585359, -0.5367643, -2.581977, 0.7647059, 1, 0, 1,
-0.8562354, -0.1596368, -2.389297, 0.7568628, 1, 0, 1,
-0.8491177, -0.9479205, -2.773383, 0.7529412, 1, 0, 1,
-0.8476023, 0.832552, -1.577574, 0.7450981, 1, 0, 1,
-0.8462124, -0.4265197, -2.033708, 0.7411765, 1, 0, 1,
-0.8412923, -1.729399, -3.398444, 0.7333333, 1, 0, 1,
-0.8405595, 1.190431, -0.2382339, 0.7294118, 1, 0, 1,
-0.834133, 2.254203, -0.1807503, 0.7215686, 1, 0, 1,
-0.8294306, 0.3076977, -1.752091, 0.7176471, 1, 0, 1,
-0.8269285, 0.01149758, -1.443383, 0.7098039, 1, 0, 1,
-0.8192672, 0.7212256, -0.6877538, 0.7058824, 1, 0, 1,
-0.8150378, 0.1000284, -1.638593, 0.6980392, 1, 0, 1,
-0.8100428, 0.01822952, -1.934265, 0.6901961, 1, 0, 1,
-0.8088638, 1.033693, -1.873748, 0.6862745, 1, 0, 1,
-0.8056058, -0.5068414, -2.894881, 0.6784314, 1, 0, 1,
-0.8038799, -0.8369597, -2.273904, 0.6745098, 1, 0, 1,
-0.803342, 1.774514, -1.073377, 0.6666667, 1, 0, 1,
-0.7872975, 0.2197558, 1.837399, 0.6627451, 1, 0, 1,
-0.7856603, 0.0414015, -0.8355707, 0.654902, 1, 0, 1,
-0.7852492, -1.353367, -2.768644, 0.6509804, 1, 0, 1,
-0.7828642, 0.2803138, 1.268899, 0.6431373, 1, 0, 1,
-0.7779258, 1.262951, -1.704972, 0.6392157, 1, 0, 1,
-0.772498, 1.479597, -0.4769077, 0.6313726, 1, 0, 1,
-0.7686221, -0.5054275, -2.232663, 0.627451, 1, 0, 1,
-0.7673897, -0.2264223, -1.475373, 0.6196079, 1, 0, 1,
-0.7661883, -1.120329, -3.991376, 0.6156863, 1, 0, 1,
-0.761206, -0.1784713, -1.562412, 0.6078432, 1, 0, 1,
-0.7584, -0.8495675, -1.638297, 0.6039216, 1, 0, 1,
-0.7561221, -0.8112686, 0.2644823, 0.5960785, 1, 0, 1,
-0.752634, 0.2331104, -1.245223, 0.5882353, 1, 0, 1,
-0.7507991, 0.8568591, -0.5889235, 0.5843138, 1, 0, 1,
-0.7503954, 1.202134, -1.632832, 0.5764706, 1, 0, 1,
-0.7479653, 0.8710262, -2.501092, 0.572549, 1, 0, 1,
-0.7433903, -0.6113939, -0.9922003, 0.5647059, 1, 0, 1,
-0.7413482, -0.5285463, -1.30428, 0.5607843, 1, 0, 1,
-0.7412482, 0.2378319, 0.008281976, 0.5529412, 1, 0, 1,
-0.7358784, -0.03266663, -1.503511, 0.5490196, 1, 0, 1,
-0.7296534, -2.28862, -3.631779, 0.5411765, 1, 0, 1,
-0.7275388, -0.6869997, -1.375588, 0.5372549, 1, 0, 1,
-0.7240952, -1.185278, -3.125159, 0.5294118, 1, 0, 1,
-0.7219974, -0.249503, -0.658694, 0.5254902, 1, 0, 1,
-0.7153187, 0.2178798, -0.6972905, 0.5176471, 1, 0, 1,
-0.7077895, 0.08833423, 0.4970222, 0.5137255, 1, 0, 1,
-0.7074277, 0.00711347, -2.247262, 0.5058824, 1, 0, 1,
-0.7042922, -0.637127, -3.384895, 0.5019608, 1, 0, 1,
-0.7000856, -0.7772713, -1.359973, 0.4941176, 1, 0, 1,
-0.6926343, -0.03505779, -1.926967, 0.4862745, 1, 0, 1,
-0.6901654, -0.1685523, -0.09439614, 0.4823529, 1, 0, 1,
-0.6897865, -0.492464, -1.666835, 0.4745098, 1, 0, 1,
-0.6892556, -0.5755703, -0.8125406, 0.4705882, 1, 0, 1,
-0.6850666, 0.9548024, 0.3921995, 0.4627451, 1, 0, 1,
-0.6839158, 1.371894, 0.08285476, 0.4588235, 1, 0, 1,
-0.6836627, 0.9849021, 0.9788525, 0.4509804, 1, 0, 1,
-0.6807431, 0.1928268, -2.140083, 0.4470588, 1, 0, 1,
-0.6796559, 0.7260959, 0.638936, 0.4392157, 1, 0, 1,
-0.6771882, 0.5256919, 0.2120919, 0.4352941, 1, 0, 1,
-0.6716872, -2.124305, -4.389066, 0.427451, 1, 0, 1,
-0.6691151, 0.1823084, -2.209805, 0.4235294, 1, 0, 1,
-0.6678462, -2.210332, -3.073029, 0.4156863, 1, 0, 1,
-0.6643646, -1.260107, -3.856962, 0.4117647, 1, 0, 1,
-0.6582161, -0.8077469, -2.048955, 0.4039216, 1, 0, 1,
-0.6554272, 0.9590755, -0.44994, 0.3960784, 1, 0, 1,
-0.6541294, -1.583506, -2.763772, 0.3921569, 1, 0, 1,
-0.6535655, -0.09003429, -1.898647, 0.3843137, 1, 0, 1,
-0.6523791, 0.3263452, -1.839369, 0.3803922, 1, 0, 1,
-0.6432363, -0.9782628, -4.741742, 0.372549, 1, 0, 1,
-0.6429992, 0.6810192, -1.049855, 0.3686275, 1, 0, 1,
-0.6419466, 1.318174, -0.4689339, 0.3607843, 1, 0, 1,
-0.637726, -0.8262046, -2.234199, 0.3568628, 1, 0, 1,
-0.6333827, -1.98859, -1.733714, 0.3490196, 1, 0, 1,
-0.6329405, -2.153365, -1.262014, 0.345098, 1, 0, 1,
-0.6203527, -0.2778772, -2.768394, 0.3372549, 1, 0, 1,
-0.6173968, -0.922252, -1.155927, 0.3333333, 1, 0, 1,
-0.6135727, 0.1957879, -0.03937843, 0.3254902, 1, 0, 1,
-0.6079634, 1.229555, -0.9180523, 0.3215686, 1, 0, 1,
-0.6074095, -0.7777458, -2.318674, 0.3137255, 1, 0, 1,
-0.6067629, 0.9592876, 1.216022, 0.3098039, 1, 0, 1,
-0.6059624, 0.1851723, -0.5363027, 0.3019608, 1, 0, 1,
-0.5998284, 0.5192335, -0.8938534, 0.2941177, 1, 0, 1,
-0.5941917, 1.838701, -2.062546, 0.2901961, 1, 0, 1,
-0.593906, 1.106357, -1.432823, 0.282353, 1, 0, 1,
-0.5921641, 0.6878264, -1.363675, 0.2784314, 1, 0, 1,
-0.5891804, 0.7452629, -1.55664, 0.2705882, 1, 0, 1,
-0.5877797, -0.6335213, -1.992372, 0.2666667, 1, 0, 1,
-0.5806777, 0.5830182, -0.02746954, 0.2588235, 1, 0, 1,
-0.5800707, -0.3539005, -3.358931, 0.254902, 1, 0, 1,
-0.5614583, -2.434819, -3.604796, 0.2470588, 1, 0, 1,
-0.5606436, 0.2636516, -0.3207108, 0.2431373, 1, 0, 1,
-0.5584407, 0.2184138, -1.338902, 0.2352941, 1, 0, 1,
-0.5571595, 1.301441, 0.1630406, 0.2313726, 1, 0, 1,
-0.5546937, -1.140082, -2.336395, 0.2235294, 1, 0, 1,
-0.549455, -0.2292832, -2.415487, 0.2196078, 1, 0, 1,
-0.5431553, -1.177503, -2.257079, 0.2117647, 1, 0, 1,
-0.543122, -1.064819, -3.074578, 0.2078431, 1, 0, 1,
-0.5427216, 0.1881514, -1.597425, 0.2, 1, 0, 1,
-0.5396103, -0.2046736, -1.768069, 0.1921569, 1, 0, 1,
-0.5361397, 2.575765, 0.5963426, 0.1882353, 1, 0, 1,
-0.5349813, -0.4464536, -1.358082, 0.1803922, 1, 0, 1,
-0.5329716, 0.3423284, 1.34489, 0.1764706, 1, 0, 1,
-0.529768, 1.774041, 1.115077, 0.1686275, 1, 0, 1,
-0.5286363, -0.9801725, -2.025574, 0.1647059, 1, 0, 1,
-0.528261, 1.195227, 0.89704, 0.1568628, 1, 0, 1,
-0.5265827, 0.6253545, 0.3242917, 0.1529412, 1, 0, 1,
-0.5250246, 0.1640221, -1.760593, 0.145098, 1, 0, 1,
-0.5244444, 2.048265, 0.1958229, 0.1411765, 1, 0, 1,
-0.5227736, 0.5216176, -0.5766848, 0.1333333, 1, 0, 1,
-0.5199805, 0.4291362, -1.176848, 0.1294118, 1, 0, 1,
-0.5192229, -0.3259168, -3.97415, 0.1215686, 1, 0, 1,
-0.5186291, 0.05896569, -2.650978, 0.1176471, 1, 0, 1,
-0.5167522, -1.175035, -4.390112, 0.1098039, 1, 0, 1,
-0.5121101, -1.56427, -3.030561, 0.1058824, 1, 0, 1,
-0.5096814, -1.220716, -2.971796, 0.09803922, 1, 0, 1,
-0.5032091, -1.293388, -5.339905, 0.09019608, 1, 0, 1,
-0.4968459, -1.572933, -1.221472, 0.08627451, 1, 0, 1,
-0.4968156, -0.196927, -3.21268, 0.07843138, 1, 0, 1,
-0.4963558, -0.5450871, -3.831056, 0.07450981, 1, 0, 1,
-0.4962706, -0.6090105, -1.89586, 0.06666667, 1, 0, 1,
-0.4910029, 0.7151809, -0.3368283, 0.0627451, 1, 0, 1,
-0.4897515, 2.104315, -1.968707, 0.05490196, 1, 0, 1,
-0.4832086, -0.1085313, -1.93966, 0.05098039, 1, 0, 1,
-0.4716152, 0.3710707, -1.106757, 0.04313726, 1, 0, 1,
-0.4669516, -0.5673609, -1.46878, 0.03921569, 1, 0, 1,
-0.465637, -0.3489041, -1.84901, 0.03137255, 1, 0, 1,
-0.4645104, -0.5092806, -3.778869, 0.02745098, 1, 0, 1,
-0.4615133, -0.7849597, -3.45173, 0.01960784, 1, 0, 1,
-0.459739, 0.1524706, -2.612205, 0.01568628, 1, 0, 1,
-0.457445, 1.39291, 0.3270785, 0.007843138, 1, 0, 1,
-0.4570843, 0.2795823, 0.3695931, 0.003921569, 1, 0, 1,
-0.4556533, 0.5455089, -1.867016, 0, 1, 0.003921569, 1,
-0.4550503, -0.08165022, -1.456944, 0, 1, 0.01176471, 1,
-0.4480063, -1.631577, -3.078993, 0, 1, 0.01568628, 1,
-0.4440328, -0.7600205, -4.792939, 0, 1, 0.02352941, 1,
-0.4427167, 2.241617, 0.4083192, 0, 1, 0.02745098, 1,
-0.4416379, 0.5949363, -2.239146, 0, 1, 0.03529412, 1,
-0.4391873, -0.1486519, -2.532112, 0, 1, 0.03921569, 1,
-0.4378891, 0.09025425, -1.059124, 0, 1, 0.04705882, 1,
-0.4306141, -0.8506917, -2.433605, 0, 1, 0.05098039, 1,
-0.4288303, -1.251417, -0.7761683, 0, 1, 0.05882353, 1,
-0.42757, -0.4277669, -2.163297, 0, 1, 0.0627451, 1,
-0.4258115, -2.545678, -2.086906, 0, 1, 0.07058824, 1,
-0.4240446, -0.06101196, -4.031676, 0, 1, 0.07450981, 1,
-0.4221229, 0.2070906, -1.535582, 0, 1, 0.08235294, 1,
-0.4190764, 0.07395474, -1.983355, 0, 1, 0.08627451, 1,
-0.4152855, 1.013587, -0.1101581, 0, 1, 0.09411765, 1,
-0.4143389, -0.1698849, -3.113555, 0, 1, 0.1019608, 1,
-0.4127088, 2.129698, 0.2457745, 0, 1, 0.1058824, 1,
-0.4098943, 0.3571578, -2.595585, 0, 1, 0.1137255, 1,
-0.4055191, 0.9004052, 0.3621374, 0, 1, 0.1176471, 1,
-0.4034978, -0.6968066, -2.893231, 0, 1, 0.1254902, 1,
-0.4026313, -0.9422194, -3.150115, 0, 1, 0.1294118, 1,
-0.4011589, -0.8502285, -2.264024, 0, 1, 0.1372549, 1,
-0.3991825, -0.3159191, -1.252956, 0, 1, 0.1411765, 1,
-0.3987126, -1.003683, -2.326874, 0, 1, 0.1490196, 1,
-0.392737, 0.04116838, -3.075071, 0, 1, 0.1529412, 1,
-0.3926304, 0.02669559, -1.739411, 0, 1, 0.1607843, 1,
-0.3819016, 0.1933446, -1.236391, 0, 1, 0.1647059, 1,
-0.3806948, -1.215332, -3.551826, 0, 1, 0.172549, 1,
-0.3802867, -0.2377887, -2.547983, 0, 1, 0.1764706, 1,
-0.3783464, 1.260127, 1.163565, 0, 1, 0.1843137, 1,
-0.3753183, 0.4270853, -1.783096, 0, 1, 0.1882353, 1,
-0.3728446, -0.7140726, -2.659807, 0, 1, 0.1960784, 1,
-0.3722036, 0.4344345, 1.145739, 0, 1, 0.2039216, 1,
-0.3705983, -2.725777, -5.508088, 0, 1, 0.2078431, 1,
-0.3653184, -1.644925, -1.884429, 0, 1, 0.2156863, 1,
-0.365205, 1.544568, 0.7826254, 0, 1, 0.2196078, 1,
-0.3607709, 0.5249547, -0.0520821, 0, 1, 0.227451, 1,
-0.3594076, -1.635438, -2.265265, 0, 1, 0.2313726, 1,
-0.352492, 1.662298, -0.8959936, 0, 1, 0.2392157, 1,
-0.3459911, -0.03197184, -1.849068, 0, 1, 0.2431373, 1,
-0.3459444, 0.7909678, -0.1485521, 0, 1, 0.2509804, 1,
-0.3445717, 1.656628, 1.040071, 0, 1, 0.254902, 1,
-0.3434569, 2.618045, 0.2271148, 0, 1, 0.2627451, 1,
-0.3424308, -1.544989, -4.25681, 0, 1, 0.2666667, 1,
-0.3394365, -0.6167883, -2.221312, 0, 1, 0.2745098, 1,
-0.3377827, -0.3032451, -2.22709, 0, 1, 0.2784314, 1,
-0.3362503, 0.05185485, -0.8492881, 0, 1, 0.2862745, 1,
-0.3352117, 0.09747041, -2.670631, 0, 1, 0.2901961, 1,
-0.3296001, -1.869548, -3.329387, 0, 1, 0.2980392, 1,
-0.3288762, 1.383283, -0.3026842, 0, 1, 0.3058824, 1,
-0.3283048, -2.128959, -2.895216, 0, 1, 0.3098039, 1,
-0.3272209, 0.7484339, -0.3750484, 0, 1, 0.3176471, 1,
-0.3227296, -1.33746, -2.145344, 0, 1, 0.3215686, 1,
-0.3113623, -0.8424346, -4.648758, 0, 1, 0.3294118, 1,
-0.3073364, 0.8972832, 2.198273, 0, 1, 0.3333333, 1,
-0.2971472, 0.04063516, 0.7325204, 0, 1, 0.3411765, 1,
-0.2943712, -0.5707949, -2.484865, 0, 1, 0.345098, 1,
-0.2845999, 1.758095, -2.623027, 0, 1, 0.3529412, 1,
-0.2833748, -0.8503177, -3.162952, 0, 1, 0.3568628, 1,
-0.2767684, 1.748656, 1.64906, 0, 1, 0.3647059, 1,
-0.2721692, 1.856002, -0.7397781, 0, 1, 0.3686275, 1,
-0.2704731, 0.4038074, 0.7147053, 0, 1, 0.3764706, 1,
-0.2688129, 0.004826694, -2.129401, 0, 1, 0.3803922, 1,
-0.2609491, 0.01381633, -0.2591173, 0, 1, 0.3882353, 1,
-0.2594973, 1.580514, -0.7774848, 0, 1, 0.3921569, 1,
-0.2592414, 1.252619, -0.4344599, 0, 1, 0.4, 1,
-0.258939, 1.288853, -0.08491704, 0, 1, 0.4078431, 1,
-0.2584765, 0.5759937, 0.6223979, 0, 1, 0.4117647, 1,
-0.2464151, 0.7700883, -1.046253, 0, 1, 0.4196078, 1,
-0.2443542, -1.366224, -4.716391, 0, 1, 0.4235294, 1,
-0.2398393, 0.5060431, 2.375343, 0, 1, 0.4313726, 1,
-0.2340765, 0.2876725, -0.03222261, 0, 1, 0.4352941, 1,
-0.233276, 0.6950288, -1.489049, 0, 1, 0.4431373, 1,
-0.2331268, -0.1434896, -1.188237, 0, 1, 0.4470588, 1,
-0.2330116, 0.7342908, -1.811975, 0, 1, 0.454902, 1,
-0.2329387, -0.7481529, -2.624281, 0, 1, 0.4588235, 1,
-0.2320168, -0.5410425, -3.191764, 0, 1, 0.4666667, 1,
-0.2292269, 0.9339294, 0.2902901, 0, 1, 0.4705882, 1,
-0.2259554, -2.115873, -4.605875, 0, 1, 0.4784314, 1,
-0.2250415, 0.2250636, 0.2308036, 0, 1, 0.4823529, 1,
-0.2238586, 0.1303354, -2.315075, 0, 1, 0.4901961, 1,
-0.2175336, -0.2407975, -1.209798, 0, 1, 0.4941176, 1,
-0.2106988, -1.650533, -1.533539, 0, 1, 0.5019608, 1,
-0.2097803, -0.07421235, -3.788058, 0, 1, 0.509804, 1,
-0.2096386, 0.4908535, -0.8547067, 0, 1, 0.5137255, 1,
-0.1969863, 0.119536, -0.3819239, 0, 1, 0.5215687, 1,
-0.1941824, 0.2966881, -1.375296, 0, 1, 0.5254902, 1,
-0.1889779, -1.441865, -1.403464, 0, 1, 0.5333334, 1,
-0.185445, -0.0173904, -0.1299634, 0, 1, 0.5372549, 1,
-0.1818916, -1.432865, -1.599425, 0, 1, 0.5450981, 1,
-0.1702327, 0.1804017, -0.4972499, 0, 1, 0.5490196, 1,
-0.1686546, 0.436262, 0.6166278, 0, 1, 0.5568628, 1,
-0.1670073, -0.8457372, -2.33776, 0, 1, 0.5607843, 1,
-0.1636931, -0.3508528, -2.931155, 0, 1, 0.5686275, 1,
-0.161526, 0.06446224, -2.251654, 0, 1, 0.572549, 1,
-0.1593207, 0.2295337, -2.949728, 0, 1, 0.5803922, 1,
-0.1585461, 1.39993, -1.44732, 0, 1, 0.5843138, 1,
-0.1572813, 1.653847, 1.025359, 0, 1, 0.5921569, 1,
-0.1524342, 0.0359645, -1.382028, 0, 1, 0.5960785, 1,
-0.1519887, -0.8945673, -2.237125, 0, 1, 0.6039216, 1,
-0.1519294, 0.6209723, -0.4177332, 0, 1, 0.6117647, 1,
-0.1475105, 0.9464938, -0.7484238, 0, 1, 0.6156863, 1,
-0.1410806, 0.4896701, -0.2318748, 0, 1, 0.6235294, 1,
-0.1373905, 0.07599116, -1.704756, 0, 1, 0.627451, 1,
-0.1348836, -0.9420368, -4.008863, 0, 1, 0.6352941, 1,
-0.1334121, 0.5461323, 0.5164006, 0, 1, 0.6392157, 1,
-0.1260051, 0.7635165, -0.9014505, 0, 1, 0.6470588, 1,
-0.1252777, -0.965647, -2.797377, 0, 1, 0.6509804, 1,
-0.1218851, 0.5321029, 0.7510708, 0, 1, 0.6588235, 1,
-0.1202489, -0.6250274, -3.711411, 0, 1, 0.6627451, 1,
-0.1198104, -1.184759, -4.05337, 0, 1, 0.6705883, 1,
-0.1181985, 0.1289229, 1.158381, 0, 1, 0.6745098, 1,
-0.117589, 1.842624, 1.286922, 0, 1, 0.682353, 1,
-0.1155095, -1.964102, -1.696847, 0, 1, 0.6862745, 1,
-0.1083911, -0.7748392, -1.366293, 0, 1, 0.6941177, 1,
-0.1057471, 1.828274, -1.60208, 0, 1, 0.7019608, 1,
-0.1027885, -0.509745, -4.161641, 0, 1, 0.7058824, 1,
-0.1019491, -0.712878, -2.419483, 0, 1, 0.7137255, 1,
-0.1013328, -1.243363, -2.627728, 0, 1, 0.7176471, 1,
-0.09836658, -0.3004059, -3.226623, 0, 1, 0.7254902, 1,
-0.09721265, 0.3120779, -0.7254275, 0, 1, 0.7294118, 1,
-0.08445267, 0.4900922, 0.716233, 0, 1, 0.7372549, 1,
-0.08258138, -0.7133557, -3.479461, 0, 1, 0.7411765, 1,
-0.08065966, 0.1379226, -0.8400562, 0, 1, 0.7490196, 1,
-0.08029214, 1.101313, 0.4554871, 0, 1, 0.7529412, 1,
-0.0762685, -0.7283283, -1.650323, 0, 1, 0.7607843, 1,
-0.07067045, -0.8778122, -4.0254, 0, 1, 0.7647059, 1,
-0.07066829, 1.080716, 0.1478377, 0, 1, 0.772549, 1,
-0.06874754, 0.9851406, -0.5715792, 0, 1, 0.7764706, 1,
-0.06849916, -0.2784243, -3.820215, 0, 1, 0.7843137, 1,
-0.06383614, -0.0358155, -2.564111, 0, 1, 0.7882353, 1,
-0.06069747, -0.3614035, -2.971364, 0, 1, 0.7960784, 1,
-0.05823767, -0.1093878, -2.886329, 0, 1, 0.8039216, 1,
-0.05640647, -1.177955, -1.987273, 0, 1, 0.8078431, 1,
-0.0548731, -0.1991209, -2.619095, 0, 1, 0.8156863, 1,
-0.05205633, -0.1173866, -2.49617, 0, 1, 0.8196079, 1,
-0.04359859, -2.442196, -4.006073, 0, 1, 0.827451, 1,
-0.0399259, 0.7919148, -0.1469373, 0, 1, 0.8313726, 1,
-0.03468732, -1.686252, -3.275278, 0, 1, 0.8392157, 1,
-0.03387084, -0.7197519, -0.3076541, 0, 1, 0.8431373, 1,
-0.03343075, -0.3211788, -4.612146, 0, 1, 0.8509804, 1,
-0.03175679, -0.8081643, -4.885269, 0, 1, 0.854902, 1,
-0.02904655, 2.459451, -1.854981, 0, 1, 0.8627451, 1,
-0.02642899, -0.08251768, -3.373319, 0, 1, 0.8666667, 1,
-0.02243073, -0.7463107, -2.953149, 0, 1, 0.8745098, 1,
-0.0221683, 1.225493, 1.463645, 0, 1, 0.8784314, 1,
-0.01946442, 0.4660642, 1.208085, 0, 1, 0.8862745, 1,
-0.01937089, 0.006108257, -1.587219, 0, 1, 0.8901961, 1,
-0.01849916, -1.309019, -4.337889, 0, 1, 0.8980392, 1,
-0.01221124, -0.2055851, -4.054456, 0, 1, 0.9058824, 1,
-0.008328398, 1.220157, 0.4984172, 0, 1, 0.9098039, 1,
-0.003396939, 0.4029993, 0.1261617, 0, 1, 0.9176471, 1,
0.002933195, 0.4595878, -0.7941247, 0, 1, 0.9215686, 1,
0.01130146, -0.3598115, 2.811677, 0, 1, 0.9294118, 1,
0.01140479, 0.8313281, 1.583559, 0, 1, 0.9333333, 1,
0.01298932, -0.2156759, 3.434838, 0, 1, 0.9411765, 1,
0.01357804, 1.737297, 0.3062635, 0, 1, 0.945098, 1,
0.01550915, -0.6512405, 2.771021, 0, 1, 0.9529412, 1,
0.01932763, -0.6907468, 2.259226, 0, 1, 0.9568627, 1,
0.02774468, 0.09920777, 1.27985, 0, 1, 0.9647059, 1,
0.02856826, -0.2512146, 3.992881, 0, 1, 0.9686275, 1,
0.03160958, -0.07672724, 2.807884, 0, 1, 0.9764706, 1,
0.03319125, 0.5044661, -0.2949717, 0, 1, 0.9803922, 1,
0.0341223, -0.8687372, 4.807856, 0, 1, 0.9882353, 1,
0.03469267, 1.127737, -0.1444625, 0, 1, 0.9921569, 1,
0.03719147, 1.295307, -0.2040413, 0, 1, 1, 1,
0.03986291, -1.692081, 1.787315, 0, 0.9921569, 1, 1,
0.04197399, -0.9893515, 3.32444, 0, 0.9882353, 1, 1,
0.04412457, -0.1119637, 3.427344, 0, 0.9803922, 1, 1,
0.04415573, -0.6934044, 3.198601, 0, 0.9764706, 1, 1,
0.04683588, -0.9668737, 3.934601, 0, 0.9686275, 1, 1,
0.04807907, -1.304836, 1.775238, 0, 0.9647059, 1, 1,
0.04863406, -1.366648, 3.211503, 0, 0.9568627, 1, 1,
0.05070625, -0.05956055, 1.830483, 0, 0.9529412, 1, 1,
0.0509621, -0.2213009, 2.457994, 0, 0.945098, 1, 1,
0.05403989, -1.202877, 1.018794, 0, 0.9411765, 1, 1,
0.05603737, 0.473554, 0.2774403, 0, 0.9333333, 1, 1,
0.0568439, 1.596971, 0.4249313, 0, 0.9294118, 1, 1,
0.06211249, 0.9605682, 0.376933, 0, 0.9215686, 1, 1,
0.06327181, 0.9521811, -1.347132, 0, 0.9176471, 1, 1,
0.06342996, 2.004539, -0.9116958, 0, 0.9098039, 1, 1,
0.06499387, -0.6331564, 3.232013, 0, 0.9058824, 1, 1,
0.06814733, 0.8665934, -0.9451938, 0, 0.8980392, 1, 1,
0.0719951, -0.4812677, 4.040944, 0, 0.8901961, 1, 1,
0.08103282, -0.9465529, 4.813491, 0, 0.8862745, 1, 1,
0.08128867, 0.8003394, -0.1782076, 0, 0.8784314, 1, 1,
0.08307519, 1.061009, -1.298325, 0, 0.8745098, 1, 1,
0.08337514, -0.8392978, 4.587737, 0, 0.8666667, 1, 1,
0.08421978, -2.50609, 2.821068, 0, 0.8627451, 1, 1,
0.08483019, -0.8019297, 2.388816, 0, 0.854902, 1, 1,
0.08545356, -0.9906286, 2.275335, 0, 0.8509804, 1, 1,
0.08763552, -2.114654, 4.671809, 0, 0.8431373, 1, 1,
0.09048975, -0.8626913, 3.213034, 0, 0.8392157, 1, 1,
0.09445268, -1.208921, 2.671347, 0, 0.8313726, 1, 1,
0.09481725, -1.166625, 3.099203, 0, 0.827451, 1, 1,
0.09639454, 0.1330058, 1.104789, 0, 0.8196079, 1, 1,
0.09959474, -0.5271554, 1.413188, 0, 0.8156863, 1, 1,
0.1024164, -0.9032944, 2.572731, 0, 0.8078431, 1, 1,
0.1065415, 1.360747, 0.7361114, 0, 0.8039216, 1, 1,
0.1110005, 0.2463194, 0.6463867, 0, 0.7960784, 1, 1,
0.1151462, 1.007609, -1.124691, 0, 0.7882353, 1, 1,
0.1162281, 0.8986093, 0.5987054, 0, 0.7843137, 1, 1,
0.1177678, -0.6668525, 4.58389, 0, 0.7764706, 1, 1,
0.1217621, 0.3661063, -1.211829, 0, 0.772549, 1, 1,
0.128764, -1.35764, 2.373249, 0, 0.7647059, 1, 1,
0.1291952, -0.9686788, 1.214996, 0, 0.7607843, 1, 1,
0.1330155, -0.8258382, 1.866758, 0, 0.7529412, 1, 1,
0.1348434, -0.2063639, 2.499921, 0, 0.7490196, 1, 1,
0.144288, -0.5201646, 4.68224, 0, 0.7411765, 1, 1,
0.1564865, 0.9573588, 1.804714, 0, 0.7372549, 1, 1,
0.160713, 0.3162072, -0.59776, 0, 0.7294118, 1, 1,
0.1612479, -0.8241, 2.054604, 0, 0.7254902, 1, 1,
0.1621617, -1.492326, 2.970883, 0, 0.7176471, 1, 1,
0.1622092, 1.024799, 0.5052053, 0, 0.7137255, 1, 1,
0.1695932, 0.2290012, 0.9045897, 0, 0.7058824, 1, 1,
0.1712274, -1.30799, 2.053915, 0, 0.6980392, 1, 1,
0.1725018, 1.269453, 0.1462784, 0, 0.6941177, 1, 1,
0.1809416, -0.2097681, 1.010368, 0, 0.6862745, 1, 1,
0.1818224, -0.9740921, 0.5323357, 0, 0.682353, 1, 1,
0.1966593, 0.07969713, -0.5597166, 0, 0.6745098, 1, 1,
0.199658, -0.1369715, 2.170572, 0, 0.6705883, 1, 1,
0.2007207, -0.2334755, 3.108908, 0, 0.6627451, 1, 1,
0.2058726, 1.539182, -0.1024687, 0, 0.6588235, 1, 1,
0.2080682, -2.176956, 3.033869, 0, 0.6509804, 1, 1,
0.2083955, 0.3484551, 1.91256, 0, 0.6470588, 1, 1,
0.2105305, -0.4868484, 3.949726, 0, 0.6392157, 1, 1,
0.2123999, 0.8520726, 1.439438, 0, 0.6352941, 1, 1,
0.21584, -0.9129839, 2.223801, 0, 0.627451, 1, 1,
0.2177992, 0.8171359, 0.04608941, 0, 0.6235294, 1, 1,
0.2252336, 1.487266, 0.09181856, 0, 0.6156863, 1, 1,
0.2320564, 0.3378762, 0.4125329, 0, 0.6117647, 1, 1,
0.2329428, 0.9426294, 0.4468574, 0, 0.6039216, 1, 1,
0.2343216, 1.247421, -0.05393881, 0, 0.5960785, 1, 1,
0.2377483, 0.7737285, 0.4721028, 0, 0.5921569, 1, 1,
0.2417386, 1.348466, -0.009539384, 0, 0.5843138, 1, 1,
0.2458037, -0.02219294, 1.675227, 0, 0.5803922, 1, 1,
0.2503406, 0.5211172, -0.1506185, 0, 0.572549, 1, 1,
0.2506485, 0.189475, -0.4352558, 0, 0.5686275, 1, 1,
0.2515993, 1.101008, -0.121899, 0, 0.5607843, 1, 1,
0.2526828, 0.05964329, 0.2457251, 0, 0.5568628, 1, 1,
0.2583659, -1.836174, 3.519945, 0, 0.5490196, 1, 1,
0.2590669, -0.6366643, 0.4536732, 0, 0.5450981, 1, 1,
0.2670993, -0.3538898, 0.4965161, 0, 0.5372549, 1, 1,
0.2733946, 0.1126437, 1.468186, 0, 0.5333334, 1, 1,
0.2798628, -1.062922, 3.539611, 0, 0.5254902, 1, 1,
0.280609, -1.182238, 1.407585, 0, 0.5215687, 1, 1,
0.2807824, 1.837442, 0.5431301, 0, 0.5137255, 1, 1,
0.2809278, -0.01263653, 2.053823, 0, 0.509804, 1, 1,
0.2867364, -1.561285, 3.776382, 0, 0.5019608, 1, 1,
0.2891377, 0.3087527, -0.5645887, 0, 0.4941176, 1, 1,
0.2923956, 0.4848921, 0.9277737, 0, 0.4901961, 1, 1,
0.2950827, -0.9127466, 3.095902, 0, 0.4823529, 1, 1,
0.295691, -0.6798736, 3.407619, 0, 0.4784314, 1, 1,
0.2976381, -0.509989, 3.24977, 0, 0.4705882, 1, 1,
0.2995564, 1.219976, 0.2809109, 0, 0.4666667, 1, 1,
0.3031334, -0.6670345, 1.84929, 0, 0.4588235, 1, 1,
0.304409, 2.830158, 1.512694, 0, 0.454902, 1, 1,
0.3056268, 0.2966741, 0.4765964, 0, 0.4470588, 1, 1,
0.3100488, -1.19512, 4.67695, 0, 0.4431373, 1, 1,
0.312042, 0.1998637, 2.168876, 0, 0.4352941, 1, 1,
0.3127516, -0.9720896, 3.202549, 0, 0.4313726, 1, 1,
0.3140691, -0.6837841, 2.321363, 0, 0.4235294, 1, 1,
0.3157026, -0.2971456, 4.661311, 0, 0.4196078, 1, 1,
0.3161724, 0.6505706, 0.8210468, 0, 0.4117647, 1, 1,
0.3184913, -0.03098863, 0.5902417, 0, 0.4078431, 1, 1,
0.3187566, -0.2748432, 2.377755, 0, 0.4, 1, 1,
0.3244755, 1.118856, 0.2983522, 0, 0.3921569, 1, 1,
0.3254561, 0.1699619, 0.1308959, 0, 0.3882353, 1, 1,
0.3303079, 1.417377, -0.7035402, 0, 0.3803922, 1, 1,
0.3317649, -0.5592381, 3.221085, 0, 0.3764706, 1, 1,
0.3320898, 0.29563, 1.784746, 0, 0.3686275, 1, 1,
0.3332012, 0.2158492, 2.000568, 0, 0.3647059, 1, 1,
0.3356909, 0.6224759, -1.88394, 0, 0.3568628, 1, 1,
0.3366314, 0.9820285, -0.889183, 0, 0.3529412, 1, 1,
0.3394034, -0.2777885, 3.439475, 0, 0.345098, 1, 1,
0.3457088, 0.7629923, 0.5836133, 0, 0.3411765, 1, 1,
0.3478498, 1.271169, 0.7227765, 0, 0.3333333, 1, 1,
0.3489063, -1.098457, 4.994333, 0, 0.3294118, 1, 1,
0.3525553, 0.2094907, 2.68159, 0, 0.3215686, 1, 1,
0.352735, -0.8987113, 2.507709, 0, 0.3176471, 1, 1,
0.3542315, -0.963914, 1.161557, 0, 0.3098039, 1, 1,
0.3550426, 0.8380538, -0.08677644, 0, 0.3058824, 1, 1,
0.3569179, -0.4266141, 3.184705, 0, 0.2980392, 1, 1,
0.3580454, 0.545819, 1.459318, 0, 0.2901961, 1, 1,
0.3606704, 1.053949, 1.73827, 0, 0.2862745, 1, 1,
0.3623011, -1.050685, 2.645956, 0, 0.2784314, 1, 1,
0.3706188, 0.5790766, -0.2963284, 0, 0.2745098, 1, 1,
0.378238, -0.4157824, 2.559692, 0, 0.2666667, 1, 1,
0.3796737, -0.493991, 2.591328, 0, 0.2627451, 1, 1,
0.3826095, -0.1557135, 1.891202, 0, 0.254902, 1, 1,
0.3842548, 0.6243994, 0.6376373, 0, 0.2509804, 1, 1,
0.3852273, 0.8062229, 2.547303, 0, 0.2431373, 1, 1,
0.3857879, -1.052107, 2.978731, 0, 0.2392157, 1, 1,
0.3862155, -0.04176691, 2.6445, 0, 0.2313726, 1, 1,
0.3872171, -0.08655351, -0.306303, 0, 0.227451, 1, 1,
0.3921496, -0.5880005, 1.387354, 0, 0.2196078, 1, 1,
0.3925745, -2.517521, 2.089676, 0, 0.2156863, 1, 1,
0.395965, -0.4180374, 3.753344, 0, 0.2078431, 1, 1,
0.3983067, -2.128824, 4.813899, 0, 0.2039216, 1, 1,
0.4057341, -1.713003, 1.57873, 0, 0.1960784, 1, 1,
0.4088958, -0.6117775, 0.6752982, 0, 0.1882353, 1, 1,
0.4120665, -0.6505728, 3.728716, 0, 0.1843137, 1, 1,
0.4145674, -0.3773757, 0.6461868, 0, 0.1764706, 1, 1,
0.4277285, 0.6231526, -0.1612159, 0, 0.172549, 1, 1,
0.4283937, -1.344973, 2.521912, 0, 0.1647059, 1, 1,
0.4289835, -1.043914, 1.101806, 0, 0.1607843, 1, 1,
0.4293309, -0.5680659, 2.940614, 0, 0.1529412, 1, 1,
0.4312631, -1.222268, 2.848166, 0, 0.1490196, 1, 1,
0.43159, 0.4881721, 0.6645755, 0, 0.1411765, 1, 1,
0.4317176, -0.4219306, 1.082976, 0, 0.1372549, 1, 1,
0.4349656, -0.3626972, 2.402888, 0, 0.1294118, 1, 1,
0.4364793, 0.4024577, 0.377921, 0, 0.1254902, 1, 1,
0.4372403, -0.1710771, 1.028715, 0, 0.1176471, 1, 1,
0.4373424, -1.138751, 1.179184, 0, 0.1137255, 1, 1,
0.4430312, -0.4172933, 2.809132, 0, 0.1058824, 1, 1,
0.4436506, 0.2671078, -0.4186525, 0, 0.09803922, 1, 1,
0.4441288, -1.055582, 3.821967, 0, 0.09411765, 1, 1,
0.4500495, 0.9378129, 0.5643137, 0, 0.08627451, 1, 1,
0.4500991, 0.5422548, 0.8010405, 0, 0.08235294, 1, 1,
0.4566856, 0.1094827, 1.743849, 0, 0.07450981, 1, 1,
0.4606192, 0.2167714, -0.7972279, 0, 0.07058824, 1, 1,
0.4708044, -0.6073549, 1.140038, 0, 0.0627451, 1, 1,
0.471201, -0.2105153, 3.97824, 0, 0.05882353, 1, 1,
0.4718757, -2.261849, 4.11342, 0, 0.05098039, 1, 1,
0.4732389, -0.6241129, 3.3828, 0, 0.04705882, 1, 1,
0.4757866, -0.6287618, 4.071234, 0, 0.03921569, 1, 1,
0.4825794, 0.3235319, 1.259491, 0, 0.03529412, 1, 1,
0.483029, 0.6744896, 0.6016337, 0, 0.02745098, 1, 1,
0.4833053, 0.1188997, 2.140271, 0, 0.02352941, 1, 1,
0.4855469, 0.8767529, 0.3064948, 0, 0.01568628, 1, 1,
0.4863799, 0.2913968, 2.156146, 0, 0.01176471, 1, 1,
0.4893641, -1.253146, 3.809572, 0, 0.003921569, 1, 1,
0.4906174, 0.2896344, -0.2534954, 0.003921569, 0, 1, 1,
0.4930016, 1.091933, -0.3493078, 0.007843138, 0, 1, 1,
0.4936911, -1.165676, 2.952546, 0.01568628, 0, 1, 1,
0.4944912, 0.3745328, -0.3805034, 0.01960784, 0, 1, 1,
0.4945296, 1.83944, -0.3706525, 0.02745098, 0, 1, 1,
0.4956579, -1.022341, 4.186786, 0.03137255, 0, 1, 1,
0.4995355, 1.327322, -0.07525855, 0.03921569, 0, 1, 1,
0.5065511, -1.09433, 1.453202, 0.04313726, 0, 1, 1,
0.5116486, -1.146423, 1.929627, 0.05098039, 0, 1, 1,
0.5135935, 1.240886, 0.880622, 0.05490196, 0, 1, 1,
0.5148075, 0.159321, -0.1691816, 0.0627451, 0, 1, 1,
0.5161228, 0.9609247, -0.02332585, 0.06666667, 0, 1, 1,
0.523015, -0.1920971, 1.956708, 0.07450981, 0, 1, 1,
0.523054, 0.5186739, 1.516832, 0.07843138, 0, 1, 1,
0.5262948, 1.837842, -1.110225, 0.08627451, 0, 1, 1,
0.5308433, -0.6439635, 2.326829, 0.09019608, 0, 1, 1,
0.5440754, 0.6181884, 0.5385143, 0.09803922, 0, 1, 1,
0.5458761, 0.7506038, 1.41825, 0.1058824, 0, 1, 1,
0.5461463, -0.4706981, 2.919615, 0.1098039, 0, 1, 1,
0.5534547, 0.09729681, 2.043046, 0.1176471, 0, 1, 1,
0.5559479, -0.06321825, 2.833332, 0.1215686, 0, 1, 1,
0.5570101, -1.03226, 2.45843, 0.1294118, 0, 1, 1,
0.5579438, -0.8704434, 3.352719, 0.1333333, 0, 1, 1,
0.5613607, 0.8218106, 2.071355, 0.1411765, 0, 1, 1,
0.5653611, -0.2043149, 1.021523, 0.145098, 0, 1, 1,
0.5752904, 1.356048, 1.162612, 0.1529412, 0, 1, 1,
0.5789958, -1.830919, 3.826048, 0.1568628, 0, 1, 1,
0.5823551, 2.055721, 0.4090005, 0.1647059, 0, 1, 1,
0.58652, -1.788117, 1.621861, 0.1686275, 0, 1, 1,
0.5875043, -0.4853776, 1.918647, 0.1764706, 0, 1, 1,
0.5891321, -1.497432, 1.706876, 0.1803922, 0, 1, 1,
0.5895038, -0.7246882, 1.00834, 0.1882353, 0, 1, 1,
0.5902817, 0.003855589, 0.3706438, 0.1921569, 0, 1, 1,
0.5909364, 0.6125987, 0.3155364, 0.2, 0, 1, 1,
0.5925448, -0.7529406, 2.691257, 0.2078431, 0, 1, 1,
0.5989857, 2.411407, 1.639053, 0.2117647, 0, 1, 1,
0.6007326, 0.9196998, 0.6212822, 0.2196078, 0, 1, 1,
0.6024454, 0.7021779, 1.710098, 0.2235294, 0, 1, 1,
0.604896, -0.6918691, 2.830208, 0.2313726, 0, 1, 1,
0.608736, -1.260086, 2.921017, 0.2352941, 0, 1, 1,
0.6093251, -1.217879, 1.46935, 0.2431373, 0, 1, 1,
0.6093857, 2.197419, 0.03118456, 0.2470588, 0, 1, 1,
0.6122615, -0.02124892, 0.366775, 0.254902, 0, 1, 1,
0.6127692, 0.1210859, 0.5257558, 0.2588235, 0, 1, 1,
0.612826, 0.3608723, -0.3230205, 0.2666667, 0, 1, 1,
0.615253, 0.08143395, 2.306803, 0.2705882, 0, 1, 1,
0.6237354, -0.9284155, 3.506355, 0.2784314, 0, 1, 1,
0.6259483, -0.9697307, 2.780437, 0.282353, 0, 1, 1,
0.6263342, 0.9223154, -0.2000542, 0.2901961, 0, 1, 1,
0.62891, -0.7818356, 1.34206, 0.2941177, 0, 1, 1,
0.6319994, -0.2805786, 2.930955, 0.3019608, 0, 1, 1,
0.6339779, 0.2201169, 1.722073, 0.3098039, 0, 1, 1,
0.634398, 0.5935091, 2.067081, 0.3137255, 0, 1, 1,
0.637437, 2.347178, 0.5240994, 0.3215686, 0, 1, 1,
0.6403641, -0.829585, 2.200195, 0.3254902, 0, 1, 1,
0.6405685, 0.598442, -1.256382, 0.3333333, 0, 1, 1,
0.640853, -0.2256271, -0.2662098, 0.3372549, 0, 1, 1,
0.6432291, -0.08888274, 0.1568591, 0.345098, 0, 1, 1,
0.644583, 0.3211039, 0.01386814, 0.3490196, 0, 1, 1,
0.6458365, 0.05937009, 0.5303311, 0.3568628, 0, 1, 1,
0.651381, 0.957373, 0.6481242, 0.3607843, 0, 1, 1,
0.6554012, -0.7760909, 4.011948, 0.3686275, 0, 1, 1,
0.6627365, 0.7614365, 1.667706, 0.372549, 0, 1, 1,
0.663371, 2.228779, -0.302211, 0.3803922, 0, 1, 1,
0.6635597, -0.3593465, 1.303748, 0.3843137, 0, 1, 1,
0.6651797, 0.9123201, 0.8011783, 0.3921569, 0, 1, 1,
0.6684449, -0.1331253, 0.9209368, 0.3960784, 0, 1, 1,
0.6688436, 0.8902092, -0.3948257, 0.4039216, 0, 1, 1,
0.6716981, -0.0005984535, 1.799565, 0.4117647, 0, 1, 1,
0.6721525, 0.1384925, 1.34577, 0.4156863, 0, 1, 1,
0.6753652, -0.8136173, 4.322314, 0.4235294, 0, 1, 1,
0.68388, -1.716423, 4.997189, 0.427451, 0, 1, 1,
0.6843531, -1.226844, 4.941382, 0.4352941, 0, 1, 1,
0.6863378, 0.5568041, 0.1361563, 0.4392157, 0, 1, 1,
0.6895907, 0.175828, 0.3090394, 0.4470588, 0, 1, 1,
0.6945429, 1.239073, 1.336606, 0.4509804, 0, 1, 1,
0.6975227, 0.1282341, 1.634367, 0.4588235, 0, 1, 1,
0.7019193, -0.9500876, 1.413292, 0.4627451, 0, 1, 1,
0.7047212, 0.1339426, 0.9479612, 0.4705882, 0, 1, 1,
0.7075377, -0.1209541, 2.212363, 0.4745098, 0, 1, 1,
0.715372, 0.6206322, 1.779503, 0.4823529, 0, 1, 1,
0.7172649, 1.217079, 1.169458, 0.4862745, 0, 1, 1,
0.7220203, 0.6202137, 0.7945598, 0.4941176, 0, 1, 1,
0.7225832, 1.258198, -1.061099, 0.5019608, 0, 1, 1,
0.7283447, -0.4541278, 3.988456, 0.5058824, 0, 1, 1,
0.7307407, -0.9339973, 2.325457, 0.5137255, 0, 1, 1,
0.7320791, -0.5933546, 3.006688, 0.5176471, 0, 1, 1,
0.7353125, -1.069783, 3.133684, 0.5254902, 0, 1, 1,
0.7363746, -1.002101, 1.909762, 0.5294118, 0, 1, 1,
0.7378728, -1.208873, 1.949448, 0.5372549, 0, 1, 1,
0.7422541, 0.9794281, 2.58477, 0.5411765, 0, 1, 1,
0.7430466, -1.323751, 0.8974231, 0.5490196, 0, 1, 1,
0.7462019, -1.173991, 2.874033, 0.5529412, 0, 1, 1,
0.7486048, 1.648608, 0.6620144, 0.5607843, 0, 1, 1,
0.7486361, 0.64322, 0.4788421, 0.5647059, 0, 1, 1,
0.7499507, -1.079895, 2.186763, 0.572549, 0, 1, 1,
0.7617173, -1.813147, 2.621061, 0.5764706, 0, 1, 1,
0.7628771, -0.5433323, 0.4605986, 0.5843138, 0, 1, 1,
0.76686, -0.2447694, 1.102556, 0.5882353, 0, 1, 1,
0.7684467, 0.4938937, 0.1003851, 0.5960785, 0, 1, 1,
0.7707467, -0.3615942, 3.2515, 0.6039216, 0, 1, 1,
0.7743402, 0.1190499, 2.616426, 0.6078432, 0, 1, 1,
0.7788765, -0.5150939, 2.419776, 0.6156863, 0, 1, 1,
0.7930014, 0.231873, 1.69725, 0.6196079, 0, 1, 1,
0.7968289, 0.9636901, 0.7446903, 0.627451, 0, 1, 1,
0.8027886, -0.6206399, 1.129284, 0.6313726, 0, 1, 1,
0.8049296, -0.2145543, 3.003564, 0.6392157, 0, 1, 1,
0.8101911, -1.353543, 2.865277, 0.6431373, 0, 1, 1,
0.8102931, -1.484936, 4.225609, 0.6509804, 0, 1, 1,
0.813205, -0.06069683, 1.767851, 0.654902, 0, 1, 1,
0.8225654, 0.3954107, 1.345129, 0.6627451, 0, 1, 1,
0.8228387, 0.4932537, 1.023882, 0.6666667, 0, 1, 1,
0.8319092, 0.3021115, 0.8761441, 0.6745098, 0, 1, 1,
0.834252, -2.691575, 3.335715, 0.6784314, 0, 1, 1,
0.835372, 0.549557, 0.01126906, 0.6862745, 0, 1, 1,
0.8362177, -2.559422, 0.9787374, 0.6901961, 0, 1, 1,
0.8434483, 0.5629387, 0.9434438, 0.6980392, 0, 1, 1,
0.8490434, 0.7700173, 1.322208, 0.7058824, 0, 1, 1,
0.8498949, -1.661001, 2.320802, 0.7098039, 0, 1, 1,
0.8502013, -0.3703394, 3.269744, 0.7176471, 0, 1, 1,
0.854358, 0.1801846, 1.446226, 0.7215686, 0, 1, 1,
0.8564857, -0.8547313, 1.288825, 0.7294118, 0, 1, 1,
0.8565132, -1.537775, 3.275175, 0.7333333, 0, 1, 1,
0.8566795, 0.02416612, 1.129311, 0.7411765, 0, 1, 1,
0.8601194, 0.1320845, -0.4070398, 0.7450981, 0, 1, 1,
0.8677288, 0.245412, 1.28998, 0.7529412, 0, 1, 1,
0.8680052, 0.3791399, 1.384267, 0.7568628, 0, 1, 1,
0.873238, 0.5107578, 0.7607885, 0.7647059, 0, 1, 1,
0.8756732, 0.1775526, 1.646721, 0.7686275, 0, 1, 1,
0.8761119, -0.4031532, 0.7234306, 0.7764706, 0, 1, 1,
0.8837063, 0.1593909, 2.137112, 0.7803922, 0, 1, 1,
0.8883373, -0.127318, 1.774061, 0.7882353, 0, 1, 1,
0.8922057, 1.123266, 1.25192, 0.7921569, 0, 1, 1,
0.8931564, 0.2949315, 0.9712143, 0.8, 0, 1, 1,
0.8976474, -1.321496, 1.811687, 0.8078431, 0, 1, 1,
0.8991477, -0.4954568, 0.6813297, 0.8117647, 0, 1, 1,
0.8995484, -0.3945712, 2.348455, 0.8196079, 0, 1, 1,
0.9027222, -1.349073, 2.096489, 0.8235294, 0, 1, 1,
0.903696, -0.4112587, 2.297924, 0.8313726, 0, 1, 1,
0.9051812, -0.2293867, 2.301901, 0.8352941, 0, 1, 1,
0.9114861, 1.048659, -1.218504, 0.8431373, 0, 1, 1,
0.9140772, -0.02510298, -0.4484848, 0.8470588, 0, 1, 1,
0.9142278, -0.9377566, 2.755767, 0.854902, 0, 1, 1,
0.9143893, 0.5294255, 1.092947, 0.8588235, 0, 1, 1,
0.9160526, 0.5941404, 1.222006, 0.8666667, 0, 1, 1,
0.9182409, 2.190475, -0.5630078, 0.8705882, 0, 1, 1,
0.9194662, 0.9962929, 0.05930012, 0.8784314, 0, 1, 1,
0.9233955, 1.253041, -1.636751, 0.8823529, 0, 1, 1,
0.9257448, 0.6743824, 2.753602, 0.8901961, 0, 1, 1,
0.9257911, 0.00770832, 1.191457, 0.8941177, 0, 1, 1,
0.9387684, 1.905761, 0.6622268, 0.9019608, 0, 1, 1,
0.9434137, 0.2831522, 2.128802, 0.9098039, 0, 1, 1,
0.9436985, -0.4873345, 0.7466415, 0.9137255, 0, 1, 1,
0.9452378, -1.647715, 2.302243, 0.9215686, 0, 1, 1,
0.9495503, -0.0737408, 1.43, 0.9254902, 0, 1, 1,
0.9528146, 0.9169471, 0.3235956, 0.9333333, 0, 1, 1,
0.9551732, -0.736216, 0.8158551, 0.9372549, 0, 1, 1,
0.9562654, -0.7228262, 0.5465809, 0.945098, 0, 1, 1,
0.956674, -0.1371633, 1.06593, 0.9490196, 0, 1, 1,
0.9620415, -0.1495771, 0.7442108, 0.9568627, 0, 1, 1,
0.9620649, -0.3938284, 2.288144, 0.9607843, 0, 1, 1,
0.9636859, 0.6457841, 2.209722, 0.9686275, 0, 1, 1,
0.9675448, -0.1260614, 1.202867, 0.972549, 0, 1, 1,
0.9682211, -0.0338946, -0.6687125, 0.9803922, 0, 1, 1,
0.9690905, -0.3464617, 0.5245737, 0.9843137, 0, 1, 1,
0.9727833, -0.6413543, 1.736784, 0.9921569, 0, 1, 1,
0.9807372, -0.8221056, 2.722888, 0.9960784, 0, 1, 1,
0.9859019, -0.03464787, 1.956958, 1, 0, 0.9960784, 1,
0.9869795, -0.9326304, 1.157202, 1, 0, 0.9882353, 1,
0.9878269, -0.7927395, 3.749549, 1, 0, 0.9843137, 1,
0.9946014, -0.005576515, 2.352743, 1, 0, 0.9764706, 1,
0.9946563, -0.3068548, 1.56998, 1, 0, 0.972549, 1,
1.001599, 0.232909, 2.246454, 1, 0, 0.9647059, 1,
1.005312, -1.014473, 1.535163, 1, 0, 0.9607843, 1,
1.00603, -1.032332, 0.8265164, 1, 0, 0.9529412, 1,
1.013534, 0.3443858, 0.6705146, 1, 0, 0.9490196, 1,
1.016486, -0.7102093, 1.659827, 1, 0, 0.9411765, 1,
1.019613, 1.99191, -0.0981831, 1, 0, 0.9372549, 1,
1.02028, 0.01728623, 2.230755, 1, 0, 0.9294118, 1,
1.022506, 1.531912, 0.4511496, 1, 0, 0.9254902, 1,
1.023135, -2.971437, 1.432119, 1, 0, 0.9176471, 1,
1.024193, 0.07821143, -0.0038212, 1, 0, 0.9137255, 1,
1.030089, 1.305945, 1.042998, 1, 0, 0.9058824, 1,
1.032416, 1.150359, 0.4872801, 1, 0, 0.9019608, 1,
1.032957, -0.4879142, 2.25471, 1, 0, 0.8941177, 1,
1.043167, 0.6242105, -0.6923495, 1, 0, 0.8862745, 1,
1.052422, -0.4426573, 2.850988, 1, 0, 0.8823529, 1,
1.061489, 0.1397818, 0.779663, 1, 0, 0.8745098, 1,
1.063049, -2.598017, 2.791812, 1, 0, 0.8705882, 1,
1.078854, 1.450016, -0.7663418, 1, 0, 0.8627451, 1,
1.078928, 0.3003346, 1.50673, 1, 0, 0.8588235, 1,
1.08156, 0.6678951, 1.647291, 1, 0, 0.8509804, 1,
1.083918, 0.5224107, 1.166511, 1, 0, 0.8470588, 1,
1.084713, 1.418732, -0.537949, 1, 0, 0.8392157, 1,
1.100374, -0.3839031, 2.065744, 1, 0, 0.8352941, 1,
1.102828, 0.610199, 2.560707, 1, 0, 0.827451, 1,
1.107441, -0.6162289, 2.158352, 1, 0, 0.8235294, 1,
1.107451, 0.6423867, -1.222083, 1, 0, 0.8156863, 1,
1.108531, -0.6123742, 1.59329, 1, 0, 0.8117647, 1,
1.11071, 1.06025, 1.235654, 1, 0, 0.8039216, 1,
1.112951, -0.3904105, 1.764127, 1, 0, 0.7960784, 1,
1.114254, 0.6606559, 2.038138, 1, 0, 0.7921569, 1,
1.115149, -0.3479867, 0.9849314, 1, 0, 0.7843137, 1,
1.124176, -1.204337, 3.011501, 1, 0, 0.7803922, 1,
1.125385, -0.1123517, 1.961712, 1, 0, 0.772549, 1,
1.129283, 0.09495427, 0.5389509, 1, 0, 0.7686275, 1,
1.135967, 0.670601, 1.763992, 1, 0, 0.7607843, 1,
1.137122, 0.3807516, 1.692551, 1, 0, 0.7568628, 1,
1.14122, -0.5802527, 2.388469, 1, 0, 0.7490196, 1,
1.151088, 1.619658, 0.8946043, 1, 0, 0.7450981, 1,
1.158441, 2.95804, 1.032849, 1, 0, 0.7372549, 1,
1.159008, -1.60623, 2.864355, 1, 0, 0.7333333, 1,
1.159447, 0.7912186, -0.5930232, 1, 0, 0.7254902, 1,
1.172964, 0.4156409, 0.5479167, 1, 0, 0.7215686, 1,
1.174003, 0.310167, 1.265247, 1, 0, 0.7137255, 1,
1.183692, -1.239859, 2.858661, 1, 0, 0.7098039, 1,
1.188422, 0.2764837, 1.070001, 1, 0, 0.7019608, 1,
1.19254, -1.850543, 2.833897, 1, 0, 0.6941177, 1,
1.204346, 1.517635, -0.2315111, 1, 0, 0.6901961, 1,
1.210827, 0.03936156, 2.591253, 1, 0, 0.682353, 1,
1.220533, -0.1751379, 2.566259, 1, 0, 0.6784314, 1,
1.237568, 0.9125804, 1.684892, 1, 0, 0.6705883, 1,
1.24115, -0.1375179, 1.607866, 1, 0, 0.6666667, 1,
1.255741, 0.7683428, 2.474858, 1, 0, 0.6588235, 1,
1.258035, -1.415676, 0.6736017, 1, 0, 0.654902, 1,
1.258543, 0.1092885, -0.3077306, 1, 0, 0.6470588, 1,
1.26051, 0.9435907, -0.703063, 1, 0, 0.6431373, 1,
1.262139, 0.3257056, -0.4766424, 1, 0, 0.6352941, 1,
1.274188, 0.1234715, 2.919996, 1, 0, 0.6313726, 1,
1.27799, 2.089713, 1.833968, 1, 0, 0.6235294, 1,
1.279042, 1.099465, 0.5189611, 1, 0, 0.6196079, 1,
1.282345, 1.552974, 0.604697, 1, 0, 0.6117647, 1,
1.299901, 0.1707422, -0.9279252, 1, 0, 0.6078432, 1,
1.310039, 1.472772, -0.474007, 1, 0, 0.6, 1,
1.318727, -0.4991488, 0.6413779, 1, 0, 0.5921569, 1,
1.321196, -1.594871, 1.361629, 1, 0, 0.5882353, 1,
1.339866, -1.587641, 2.401356, 1, 0, 0.5803922, 1,
1.341164, -0.6615795, 2.114095, 1, 0, 0.5764706, 1,
1.342071, -0.3359368, 0.2567045, 1, 0, 0.5686275, 1,
1.34774, -1.48461, 1.40902, 1, 0, 0.5647059, 1,
1.348039, 0.7231494, 0.7603229, 1, 0, 0.5568628, 1,
1.348469, -0.8103751, 4.840947, 1, 0, 0.5529412, 1,
1.351411, 0.9686553, 1.383908, 1, 0, 0.5450981, 1,
1.35261, 0.5282173, 1.867105, 1, 0, 0.5411765, 1,
1.35385, 0.5538499, 2.837216, 1, 0, 0.5333334, 1,
1.356568, 0.301896, 2.901299, 1, 0, 0.5294118, 1,
1.361773, 0.939604, -0.3157814, 1, 0, 0.5215687, 1,
1.36468, -3.424352, 3.137065, 1, 0, 0.5176471, 1,
1.364989, 1.073145, -2.589705, 1, 0, 0.509804, 1,
1.369608, -0.04670646, 3.129223, 1, 0, 0.5058824, 1,
1.372608, 0.9805418, 0.6544863, 1, 0, 0.4980392, 1,
1.381879, 0.5581003, 0.8471599, 1, 0, 0.4901961, 1,
1.386945, -0.3649015, 1.808302, 1, 0, 0.4862745, 1,
1.387864, 0.5274476, -0.002097246, 1, 0, 0.4784314, 1,
1.391804, -0.9908809, 1.778462, 1, 0, 0.4745098, 1,
1.395264, -1.167108, 3.139696, 1, 0, 0.4666667, 1,
1.40341, 0.1015359, 0.674935, 1, 0, 0.4627451, 1,
1.406197, 0.9800146, -0.3311788, 1, 0, 0.454902, 1,
1.440142, -1.561319, 2.459189, 1, 0, 0.4509804, 1,
1.454649, -1.322463, 2.461028, 1, 0, 0.4431373, 1,
1.458427, -0.928816, 4.4039, 1, 0, 0.4392157, 1,
1.468377, 0.7860678, 1.376428, 1, 0, 0.4313726, 1,
1.49699, 0.3871815, 1.086754, 1, 0, 0.427451, 1,
1.524451, 1.475909, 1.891341, 1, 0, 0.4196078, 1,
1.542789, 0.2607795, 2.259063, 1, 0, 0.4156863, 1,
1.54482, -0.1076964, 1.429202, 1, 0, 0.4078431, 1,
1.54877, 0.2680994, 1.190843, 1, 0, 0.4039216, 1,
1.555031, 0.1035025, -1.341351, 1, 0, 0.3960784, 1,
1.560153, 0.8851068, 3.715585, 1, 0, 0.3882353, 1,
1.574135, -1.165195, 0.8848976, 1, 0, 0.3843137, 1,
1.586853, 0.4731126, 1.160287, 1, 0, 0.3764706, 1,
1.595444, 2.02844, 2.092693, 1, 0, 0.372549, 1,
1.599079, 0.727192, 2.661287, 1, 0, 0.3647059, 1,
1.619233, 1.078692, 0.4165241, 1, 0, 0.3607843, 1,
1.633858, -1.971644, 2.335394, 1, 0, 0.3529412, 1,
1.636048, -0.1321094, 0.399493, 1, 0, 0.3490196, 1,
1.637951, 0.7315381, 0.1467911, 1, 0, 0.3411765, 1,
1.655769, -0.3506736, 2.668245, 1, 0, 0.3372549, 1,
1.660832, -1.038628, 2.787666, 1, 0, 0.3294118, 1,
1.668451, 0.5506597, 1.15931, 1, 0, 0.3254902, 1,
1.671316, -1.411895, 0.7185368, 1, 0, 0.3176471, 1,
1.674345, -0.4282697, 1.318914, 1, 0, 0.3137255, 1,
1.674786, -0.877885, 1.71146, 1, 0, 0.3058824, 1,
1.682511, -0.4535066, 0.8599585, 1, 0, 0.2980392, 1,
1.693591, -0.988747, 3.028852, 1, 0, 0.2941177, 1,
1.705408, -1.600161, 3.186342, 1, 0, 0.2862745, 1,
1.710813, 1.242653, 0.3411857, 1, 0, 0.282353, 1,
1.710819, -0.6915652, 1.163636, 1, 0, 0.2745098, 1,
1.716745, -2.388167, 2.084794, 1, 0, 0.2705882, 1,
1.734871, 0.2702579, 1.845821, 1, 0, 0.2627451, 1,
1.739757, -0.4937377, 1.681003, 1, 0, 0.2588235, 1,
1.749979, -0.3431398, 0.805492, 1, 0, 0.2509804, 1,
1.750634, -1.785206, 3.186972, 1, 0, 0.2470588, 1,
1.797204, 0.9173017, 0.09372292, 1, 0, 0.2392157, 1,
1.811607, -1.653266, 3.518097, 1, 0, 0.2352941, 1,
1.838848, 0.9793223, 0.9840643, 1, 0, 0.227451, 1,
1.845824, 0.377135, 2.790526, 1, 0, 0.2235294, 1,
1.865692, 0.2044289, 0.9148945, 1, 0, 0.2156863, 1,
1.867995, -0.2889449, 1.42033, 1, 0, 0.2117647, 1,
1.879638, 2.403947, 1.800748, 1, 0, 0.2039216, 1,
1.892654, -1.347223, 3.122503, 1, 0, 0.1960784, 1,
1.893838, 0.525816, 0.6751803, 1, 0, 0.1921569, 1,
1.923325, -0.1507436, 1.57703, 1, 0, 0.1843137, 1,
1.926086, -0.04020752, 1.376076, 1, 0, 0.1803922, 1,
1.928408, -0.05863575, 0.9231988, 1, 0, 0.172549, 1,
1.929366, 0.6579983, 0.7403995, 1, 0, 0.1686275, 1,
1.943291, -1.632101, 2.443115, 1, 0, 0.1607843, 1,
1.945383, 0.7397051, 1.122962, 1, 0, 0.1568628, 1,
1.965455, 0.06109744, 2.301091, 1, 0, 0.1490196, 1,
1.978082, -0.2777072, 3.208593, 1, 0, 0.145098, 1,
2.032352, -2.126825, 3.025763, 1, 0, 0.1372549, 1,
2.036276, -1.198618, 2.906134, 1, 0, 0.1333333, 1,
2.056784, -0.8018449, 1.670791, 1, 0, 0.1254902, 1,
2.113847, 1.188647, -0.3145701, 1, 0, 0.1215686, 1,
2.130901, -0.03845623, 0.4334283, 1, 0, 0.1137255, 1,
2.148789, -0.2419415, 3.078134, 1, 0, 0.1098039, 1,
2.168448, 0.4162105, 1.115333, 1, 0, 0.1019608, 1,
2.184095, 0.5187337, 0.9018662, 1, 0, 0.09411765, 1,
2.221264, -0.4787163, -0.1428823, 1, 0, 0.09019608, 1,
2.222259, 0.5085069, 0.871754, 1, 0, 0.08235294, 1,
2.229942, 0.8728519, 2.727551, 1, 0, 0.07843138, 1,
2.290758, 0.3758568, 2.217387, 1, 0, 0.07058824, 1,
2.308685, 0.5768907, 3.446596, 1, 0, 0.06666667, 1,
2.335542, -0.5044876, 1.404511, 1, 0, 0.05882353, 1,
2.356961, -0.7423286, 1.466232, 1, 0, 0.05490196, 1,
2.371206, -2.400646, 3.545964, 1, 0, 0.04705882, 1,
2.393405, 0.9259831, 2.603101, 1, 0, 0.04313726, 1,
2.599573, 0.8638158, 0.3646504, 1, 0, 0.03529412, 1,
2.733954, 1.121124, 1.709636, 1, 0, 0.03137255, 1,
2.780681, 1.175318, 0.3489776, 1, 0, 0.02352941, 1,
3.020077, -0.2034453, 0.7162245, 1, 0, 0.01960784, 1,
3.733826, -0.0484406, 2.6514, 1, 0, 0.01176471, 1,
4.452504, 1.145499, 1.020535, 1, 0, 0.007843138, 1
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
0.6009959, -4.692639, -7.288733, 0, -0.5, 0.5, 0.5,
0.6009959, -4.692639, -7.288733, 1, -0.5, 0.5, 0.5,
0.6009959, -4.692639, -7.288733, 1, 1.5, 0.5, 0.5,
0.6009959, -4.692639, -7.288733, 0, 1.5, 0.5, 0.5
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
-4.556173, 0.3169073, -7.288733, 0, -0.5, 0.5, 0.5,
-4.556173, 0.3169073, -7.288733, 1, -0.5, 0.5, 0.5,
-4.556173, 0.3169073, -7.288733, 1, 1.5, 0.5, 0.5,
-4.556173, 0.3169073, -7.288733, 0, 1.5, 0.5, 0.5
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
-4.556173, -4.692639, -0.2554498, 0, -0.5, 0.5, 0.5,
-4.556173, -4.692639, -0.2554498, 1, -0.5, 0.5, 0.5,
-4.556173, -4.692639, -0.2554498, 1, 1.5, 0.5, 0.5,
-4.556173, -4.692639, -0.2554498, 0, 1.5, 0.5, 0.5
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
-2, -3.53659, -5.665667,
4, -3.53659, -5.665667,
-2, -3.53659, -5.665667,
-2, -3.729265, -5.936178,
0, -3.53659, -5.665667,
0, -3.729265, -5.936178,
2, -3.53659, -5.665667,
2, -3.729265, -5.936178,
4, -3.53659, -5.665667,
4, -3.729265, -5.936178
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
"2",
"4"
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
-2, -4.114615, -6.4772, 0, -0.5, 0.5, 0.5,
-2, -4.114615, -6.4772, 1, -0.5, 0.5, 0.5,
-2, -4.114615, -6.4772, 1, 1.5, 0.5, 0.5,
-2, -4.114615, -6.4772, 0, 1.5, 0.5, 0.5,
0, -4.114615, -6.4772, 0, -0.5, 0.5, 0.5,
0, -4.114615, -6.4772, 1, -0.5, 0.5, 0.5,
0, -4.114615, -6.4772, 1, 1.5, 0.5, 0.5,
0, -4.114615, -6.4772, 0, 1.5, 0.5, 0.5,
2, -4.114615, -6.4772, 0, -0.5, 0.5, 0.5,
2, -4.114615, -6.4772, 1, -0.5, 0.5, 0.5,
2, -4.114615, -6.4772, 1, 1.5, 0.5, 0.5,
2, -4.114615, -6.4772, 0, 1.5, 0.5, 0.5,
4, -4.114615, -6.4772, 0, -0.5, 0.5, 0.5,
4, -4.114615, -6.4772, 1, -0.5, 0.5, 0.5,
4, -4.114615, -6.4772, 1, 1.5, 0.5, 0.5,
4, -4.114615, -6.4772, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.366057, -2, -5.665667,
-3.366057, 4, -5.665667,
-3.366057, -2, -5.665667,
-3.56441, -2, -5.936178,
-3.366057, 0, -5.665667,
-3.56441, 0, -5.936178,
-3.366057, 2, -5.665667,
-3.56441, 2, -5.936178,
-3.366057, 4, -5.665667,
-3.56441, 4, -5.936178
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
"2",
"4"
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
-3.961115, -2, -6.4772, 0, -0.5, 0.5, 0.5,
-3.961115, -2, -6.4772, 1, -0.5, 0.5, 0.5,
-3.961115, -2, -6.4772, 1, 1.5, 0.5, 0.5,
-3.961115, -2, -6.4772, 0, 1.5, 0.5, 0.5,
-3.961115, 0, -6.4772, 0, -0.5, 0.5, 0.5,
-3.961115, 0, -6.4772, 1, -0.5, 0.5, 0.5,
-3.961115, 0, -6.4772, 1, 1.5, 0.5, 0.5,
-3.961115, 0, -6.4772, 0, 1.5, 0.5, 0.5,
-3.961115, 2, -6.4772, 0, -0.5, 0.5, 0.5,
-3.961115, 2, -6.4772, 1, -0.5, 0.5, 0.5,
-3.961115, 2, -6.4772, 1, 1.5, 0.5, 0.5,
-3.961115, 2, -6.4772, 0, 1.5, 0.5, 0.5,
-3.961115, 4, -6.4772, 0, -0.5, 0.5, 0.5,
-3.961115, 4, -6.4772, 1, -0.5, 0.5, 0.5,
-3.961115, 4, -6.4772, 1, 1.5, 0.5, 0.5,
-3.961115, 4, -6.4772, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.366057, -3.53659, -4,
-3.366057, -3.53659, 4,
-3.366057, -3.53659, -4,
-3.56441, -3.729265, -4,
-3.366057, -3.53659, -2,
-3.56441, -3.729265, -2,
-3.366057, -3.53659, 0,
-3.56441, -3.729265, 0,
-3.366057, -3.53659, 2,
-3.56441, -3.729265, 2,
-3.366057, -3.53659, 4,
-3.56441, -3.729265, 4
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
-3.961115, -4.114615, -4, 0, -0.5, 0.5, 0.5,
-3.961115, -4.114615, -4, 1, -0.5, 0.5, 0.5,
-3.961115, -4.114615, -4, 1, 1.5, 0.5, 0.5,
-3.961115, -4.114615, -4, 0, 1.5, 0.5, 0.5,
-3.961115, -4.114615, -2, 0, -0.5, 0.5, 0.5,
-3.961115, -4.114615, -2, 1, -0.5, 0.5, 0.5,
-3.961115, -4.114615, -2, 1, 1.5, 0.5, 0.5,
-3.961115, -4.114615, -2, 0, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 0, 0, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 0, 1, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 0, 1, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 0, 0, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 2, 0, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 2, 1, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 2, 1, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 2, 0, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 4, 0, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 4, 1, -0.5, 0.5, 0.5,
-3.961115, -4.114615, 4, 1, 1.5, 0.5, 0.5,
-3.961115, -4.114615, 4, 0, 1.5, 0.5, 0.5
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
-3.366057, -3.53659, -5.665667,
-3.366057, 4.170405, -5.665667,
-3.366057, -3.53659, 5.154768,
-3.366057, 4.170405, 5.154768,
-3.366057, -3.53659, -5.665667,
-3.366057, -3.53659, 5.154768,
-3.366057, 4.170405, -5.665667,
-3.366057, 4.170405, 5.154768,
-3.366057, -3.53659, -5.665667,
4.568049, -3.53659, -5.665667,
-3.366057, -3.53659, 5.154768,
4.568049, -3.53659, 5.154768,
-3.366057, 4.170405, -5.665667,
4.568049, 4.170405, -5.665667,
-3.366057, 4.170405, 5.154768,
4.568049, 4.170405, 5.154768,
4.568049, -3.53659, -5.665667,
4.568049, 4.170405, -5.665667,
4.568049, -3.53659, 5.154768,
4.568049, 4.170405, 5.154768,
4.568049, -3.53659, -5.665667,
4.568049, -3.53659, 5.154768,
4.568049, 4.170405, -5.665667,
4.568049, 4.170405, 5.154768
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
var radius = 8.262556;
var distance = 36.76104;
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
mvMatrix.translate( -0.6009959, -0.3169073, 0.2554498 );
mvMatrix.scale( 1.125979, 1.15916, 0.8256264 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76104);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Azimsulfuron<-read.table("Azimsulfuron.xyz")
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
-3.250512, -1.78349, -0.9708127, 0, 0, 1, 1, 1,
-2.919072, -0.9363188, -1.274894, 1, 0, 0, 1, 1,
-2.581928, 0.1674699, -0.6503935, 1, 0, 0, 1, 1,
-2.523486, -1.227612, -1.629069, 1, 0, 0, 1, 1,
-2.49214, -0.6059181, -2.078414, 1, 0, 0, 1, 1,
-2.441058, -0.2783555, -3.210392, 1, 0, 0, 1, 1,
-2.378224, -0.7580587, -4.103748, 0, 0, 0, 1, 1,
-2.361527, -0.1922812, -2.806662, 0, 0, 0, 1, 1,
-2.292412, 1.490722, 0.6590143, 0, 0, 0, 1, 1,
-2.2867, 0.9318115, -3.393741, 0, 0, 0, 1, 1,
-2.286294, -0.4472461, -2.533567, 0, 0, 0, 1, 1,
-2.208364, -0.6614704, -1.901737, 0, 0, 0, 1, 1,
-2.208325, 0.397552, -2.370478, 0, 0, 0, 1, 1,
-2.115086, 0.3468305, -1.308945, 1, 1, 1, 1, 1,
-2.109496, -0.005086908, -0.1926265, 1, 1, 1, 1, 1,
-2.100316, -1.144386, -0.2150623, 1, 1, 1, 1, 1,
-2.070844, 1.773248, -1.551327, 1, 1, 1, 1, 1,
-2.068451, -0.04621059, -4.390795, 1, 1, 1, 1, 1,
-2.066972, -0.6286489, -2.748566, 1, 1, 1, 1, 1,
-2.023923, -0.1917785, -1.693339, 1, 1, 1, 1, 1,
-2.007966, 0.2410119, -1.219466, 1, 1, 1, 1, 1,
-2.001283, 0.5543082, -1.248221, 1, 1, 1, 1, 1,
-1.967956, 0.803001, 0.3483848, 1, 1, 1, 1, 1,
-1.941043, -1.642776, -1.168361, 1, 1, 1, 1, 1,
-1.934671, 0.5070912, -1.748253, 1, 1, 1, 1, 1,
-1.925921, 0.5201766, -2.090793, 1, 1, 1, 1, 1,
-1.923558, -1.427577, -1.602231, 1, 1, 1, 1, 1,
-1.920738, -0.4984948, -1.520861, 1, 1, 1, 1, 1,
-1.898402, 0.4362014, -1.624733, 0, 0, 1, 1, 1,
-1.865477, -0.01088134, -1.490368, 1, 0, 0, 1, 1,
-1.81617, -0.957616, -3.733552, 1, 0, 0, 1, 1,
-1.799648, -1.011195, -3.0106, 1, 0, 0, 1, 1,
-1.798526, -0.560695, -1.757756, 1, 0, 0, 1, 1,
-1.794842, 0.680049, -1.579477, 1, 0, 0, 1, 1,
-1.784314, -1.931472, -1.874677, 0, 0, 0, 1, 1,
-1.7728, -0.3693346, -2.153283, 0, 0, 0, 1, 1,
-1.761588, 0.7536216, -0.1469561, 0, 0, 0, 1, 1,
-1.759867, 0.09487517, -0.2734299, 0, 0, 0, 1, 1,
-1.752283, -0.7151465, -2.703345, 0, 0, 0, 1, 1,
-1.751653, -0.5262679, -1.07098, 0, 0, 0, 1, 1,
-1.745827, 1.27673, -2.22994, 0, 0, 0, 1, 1,
-1.726348, 0.287788, -3.156011, 1, 1, 1, 1, 1,
-1.72068, -0.5191157, -1.922103, 1, 1, 1, 1, 1,
-1.720559, -0.3767267, -2.081304, 1, 1, 1, 1, 1,
-1.715744, 0.7774507, -1.655102, 1, 1, 1, 1, 1,
-1.713815, -1.807562, -2.312197, 1, 1, 1, 1, 1,
-1.707663, -1.133282, -2.85265, 1, 1, 1, 1, 1,
-1.699808, -0.7684402, -2.981617, 1, 1, 1, 1, 1,
-1.675951, 0.2031882, -0.1026088, 1, 1, 1, 1, 1,
-1.665627, 0.5072597, -1.646906, 1, 1, 1, 1, 1,
-1.653557, -0.6020371, -2.915045, 1, 1, 1, 1, 1,
-1.64666, -2.198499, -3.107733, 1, 1, 1, 1, 1,
-1.639135, -1.246624, -1.521629, 1, 1, 1, 1, 1,
-1.608559, -0.5542594, -0.4520875, 1, 1, 1, 1, 1,
-1.6009, 0.9033808, -0.366917, 1, 1, 1, 1, 1,
-1.585773, -1.252952, -1.55409, 1, 1, 1, 1, 1,
-1.585657, -2.278078, -3.3809, 0, 0, 1, 1, 1,
-1.580713, 0.4466317, -2.176319, 1, 0, 0, 1, 1,
-1.55688, 0.943208, -1.27931, 1, 0, 0, 1, 1,
-1.552589, -1.941809, -3.472412, 1, 0, 0, 1, 1,
-1.551926, 0.6077402, -1.513531, 1, 0, 0, 1, 1,
-1.538074, -1.08581, -2.048505, 1, 0, 0, 1, 1,
-1.52638, -0.7770014, -2.652513, 0, 0, 0, 1, 1,
-1.513576, -1.016639, -1.7681, 0, 0, 0, 1, 1,
-1.511811, -0.9698517, -2.650402, 0, 0, 0, 1, 1,
-1.510636, 0.7608114, -1.556212, 0, 0, 0, 1, 1,
-1.506444, 0.6555508, -2.273082, 0, 0, 0, 1, 1,
-1.506336, -1.106683, -2.568095, 0, 0, 0, 1, 1,
-1.500072, 1.418548, -1.263608, 0, 0, 0, 1, 1,
-1.496954, -1.430151, -2.311356, 1, 1, 1, 1, 1,
-1.493027, -0.868714, -1.200721, 1, 1, 1, 1, 1,
-1.484394, 0.1321674, -1.71227, 1, 1, 1, 1, 1,
-1.471824, -1.542899, -3.337489, 1, 1, 1, 1, 1,
-1.464817, 1.249171, -0.3298104, 1, 1, 1, 1, 1,
-1.424784, 0.5674457, -0.8390003, 1, 1, 1, 1, 1,
-1.423815, 1.562963, 0.5458677, 1, 1, 1, 1, 1,
-1.420452, 0.354966, 0.1637026, 1, 1, 1, 1, 1,
-1.414457, 0.743045, -2.002993, 1, 1, 1, 1, 1,
-1.413761, -0.8728615, -1.177262, 1, 1, 1, 1, 1,
-1.413039, 0.40484, -1.25149, 1, 1, 1, 1, 1,
-1.396891, 0.4249439, -0.1744529, 1, 1, 1, 1, 1,
-1.391791, -0.06852145, -2.504489, 1, 1, 1, 1, 1,
-1.391087, -0.7992952, -2.982552, 1, 1, 1, 1, 1,
-1.39051, 0.3977541, -0.4553762, 1, 1, 1, 1, 1,
-1.380734, -1.540787, -2.357128, 0, 0, 1, 1, 1,
-1.374973, 0.3033408, -1.527148, 1, 0, 0, 1, 1,
-1.370624, -0.1896656, -1.204287, 1, 0, 0, 1, 1,
-1.360358, 0.3981146, -0.8070841, 1, 0, 0, 1, 1,
-1.355284, -0.3308766, -2.398499, 1, 0, 0, 1, 1,
-1.336871, -0.2490979, -1.7394, 1, 0, 0, 1, 1,
-1.331114, 0.2406021, -0.8594117, 0, 0, 0, 1, 1,
-1.320327, -0.705679, -2.060233, 0, 0, 0, 1, 1,
-1.319542, 0.4832828, -0.1327897, 0, 0, 0, 1, 1,
-1.316388, -1.26183, -2.388178, 0, 0, 0, 1, 1,
-1.314261, -0.5037437, -2.477454, 0, 0, 0, 1, 1,
-1.29982, -0.9747439, -1.804349, 0, 0, 0, 1, 1,
-1.295965, -0.6249797, 0.2153022, 0, 0, 0, 1, 1,
-1.294529, -0.05345413, -2.737722, 1, 1, 1, 1, 1,
-1.293478, 0.3842794, -1.520138, 1, 1, 1, 1, 1,
-1.292098, -1.795818, -1.364916, 1, 1, 1, 1, 1,
-1.288535, 0.1120856, -2.287067, 1, 1, 1, 1, 1,
-1.278622, 0.9469029, -2.686203, 1, 1, 1, 1, 1,
-1.263855, 0.3835973, -0.6193336, 1, 1, 1, 1, 1,
-1.253515, 1.52792, 0.01342078, 1, 1, 1, 1, 1,
-1.251902, 1.141975, -1.195298, 1, 1, 1, 1, 1,
-1.249727, -0.2218232, -2.893689, 1, 1, 1, 1, 1,
-1.234371, 0.2854441, -1.727522, 1, 1, 1, 1, 1,
-1.233018, -0.2336892, -1.298369, 1, 1, 1, 1, 1,
-1.227882, -1.426255, -1.9139, 1, 1, 1, 1, 1,
-1.221633, 1.628064, -1.615732, 1, 1, 1, 1, 1,
-1.219155, -0.9561843, -2.967085, 1, 1, 1, 1, 1,
-1.218801, -0.3691688, -0.9064724, 1, 1, 1, 1, 1,
-1.211749, -0.1494707, -2.089574, 0, 0, 1, 1, 1,
-1.210046, 0.06051501, -1.726636, 1, 0, 0, 1, 1,
-1.210029, 1.698428, 0.6396453, 1, 0, 0, 1, 1,
-1.208382, 0.4173056, -0.5925059, 1, 0, 0, 1, 1,
-1.195702, -0.9894018, -2.587761, 1, 0, 0, 1, 1,
-1.190992, 0.850789, -0.1867014, 1, 0, 0, 1, 1,
-1.189319, 0.8377795, -2.04964, 0, 0, 0, 1, 1,
-1.188844, -0.1178267, -1.835753, 0, 0, 0, 1, 1,
-1.186843, -0.7065564, -3.110659, 0, 0, 0, 1, 1,
-1.184184, -0.1702242, -1.680859, 0, 0, 0, 1, 1,
-1.184175, -0.7416062, -0.7435503, 0, 0, 0, 1, 1,
-1.178255, 1.423899, -0.5711645, 0, 0, 0, 1, 1,
-1.175305, -0.4599622, -1.009642, 0, 0, 0, 1, 1,
-1.172847, 1.258191, 0.03532692, 1, 1, 1, 1, 1,
-1.170568, -2.125673, -2.319212, 1, 1, 1, 1, 1,
-1.169438, -1.935107, -3.129597, 1, 1, 1, 1, 1,
-1.169134, 0.5713867, -2.550388, 1, 1, 1, 1, 1,
-1.169062, 0.1031452, -0.2968923, 1, 1, 1, 1, 1,
-1.16685, 0.7797151, 2.346749, 1, 1, 1, 1, 1,
-1.164649, 0.1050457, -0.9688495, 1, 1, 1, 1, 1,
-1.164107, 1.47864, -1.353023, 1, 1, 1, 1, 1,
-1.153027, -0.5452533, -1.879922, 1, 1, 1, 1, 1,
-1.147215, -1.370105, -1.400532, 1, 1, 1, 1, 1,
-1.138694, 1.302608, -0.4126661, 1, 1, 1, 1, 1,
-1.135355, -0.5218812, -4.246574, 1, 1, 1, 1, 1,
-1.134572, -0.295102, -2.267073, 1, 1, 1, 1, 1,
-1.113101, 0.7295756, -0.0616116, 1, 1, 1, 1, 1,
-1.110335, -0.3392147, -0.3868987, 1, 1, 1, 1, 1,
-1.106333, -0.7889699, -1.482839, 0, 0, 1, 1, 1,
-1.102396, -0.05691622, 0.02402136, 1, 0, 0, 1, 1,
-1.101658, 1.03735, 0.7162872, 1, 0, 0, 1, 1,
-1.099825, 0.0463194, -1.575528, 1, 0, 0, 1, 1,
-1.091325, 0.8625649, -1.171393, 1, 0, 0, 1, 1,
-1.090242, -1.631978, -2.825778, 1, 0, 0, 1, 1,
-1.090024, -0.6752953, -1.833656, 0, 0, 0, 1, 1,
-1.080664, -1.567133, -4.052054, 0, 0, 0, 1, 1,
-1.077948, -0.1131019, -2.52668, 0, 0, 0, 1, 1,
-1.071187, 0.7885186, -0.7670718, 0, 0, 0, 1, 1,
-1.070415, 0.2159989, -0.9776373, 0, 0, 0, 1, 1,
-1.067017, 0.3611178, -0.7741122, 0, 0, 0, 1, 1,
-1.064032, -1.479542, -4.773336, 0, 0, 0, 1, 1,
-1.063609, -0.07875855, -1.630951, 1, 1, 1, 1, 1,
-1.059817, 0.1925133, -2.532181, 1, 1, 1, 1, 1,
-1.058037, 1.443215, -0.8280097, 1, 1, 1, 1, 1,
-1.056074, -0.3115867, -2.264646, 1, 1, 1, 1, 1,
-1.051724, -0.5199183, -0.3516789, 1, 1, 1, 1, 1,
-1.048974, -0.8363293, -2.932949, 1, 1, 1, 1, 1,
-1.045156, 4.058167, 0.2065223, 1, 1, 1, 1, 1,
-1.044738, -0.1169376, -2.032834, 1, 1, 1, 1, 1,
-1.039539, 0.07503207, -3.310285, 1, 1, 1, 1, 1,
-1.037702, -0.2872512, -1.506391, 1, 1, 1, 1, 1,
-1.037138, -0.02231496, -2.15924, 1, 1, 1, 1, 1,
-1.03351, 0.7661643, -0.3328126, 1, 1, 1, 1, 1,
-1.02822, 1.828001, -2.94292, 1, 1, 1, 1, 1,
-1.026834, 0.6385417, -2.075154, 1, 1, 1, 1, 1,
-1.019375, 0.8682552, -0.6341342, 1, 1, 1, 1, 1,
-1.019353, 0.127523, -0.8152927, 0, 0, 1, 1, 1,
-1.018638, 0.438132, -0.5158219, 1, 0, 0, 1, 1,
-1.018398, 0.6774964, -0.1152189, 1, 0, 0, 1, 1,
-1.009713, -1.42871, -3.219232, 1, 0, 0, 1, 1,
-1.005494, -2.777641, -1.988416, 1, 0, 0, 1, 1,
-1.002407, -0.1105759, -0.06119304, 1, 0, 0, 1, 1,
-0.9859663, -0.923668, -2.055408, 0, 0, 0, 1, 1,
-0.9847929, -0.3867424, -2.413535, 0, 0, 0, 1, 1,
-0.9838705, -0.6560215, -2.403805, 0, 0, 0, 1, 1,
-0.9785824, 0.9949715, -0.5914838, 0, 0, 0, 1, 1,
-0.9655169, 0.1017247, -1.576787, 0, 0, 0, 1, 1,
-0.945302, 0.3460236, -1.904114, 0, 0, 0, 1, 1,
-0.9413085, -0.003403672, -1.804664, 0, 0, 0, 1, 1,
-0.9410655, -0.1028408, -1.040308, 1, 1, 1, 1, 1,
-0.9376065, -0.5481321, -1.573797, 1, 1, 1, 1, 1,
-0.9333584, -0.4902005, -1.969362, 1, 1, 1, 1, 1,
-0.9317849, 0.1242034, -1.616183, 1, 1, 1, 1, 1,
-0.9317485, 2.302603, 0.7096423, 1, 1, 1, 1, 1,
-0.9226186, -0.5615872, -2.770936, 1, 1, 1, 1, 1,
-0.9208686, 0.6489143, -0.2767766, 1, 1, 1, 1, 1,
-0.9168989, -2.052483, -4.51113, 1, 1, 1, 1, 1,
-0.9149677, 1.548995, -0.7501784, 1, 1, 1, 1, 1,
-0.9129211, 0.470686, -1.485321, 1, 1, 1, 1, 1,
-0.9120013, 1.481328, 0.6952888, 1, 1, 1, 1, 1,
-0.9085584, 0.2688438, -1.898833, 1, 1, 1, 1, 1,
-0.9062394, 0.1626121, -1.525434, 1, 1, 1, 1, 1,
-0.9050766, 0.6574352, -0.0890702, 1, 1, 1, 1, 1,
-0.9050092, -1.826659, -2.360696, 1, 1, 1, 1, 1,
-0.9034842, 1.027817, -0.8849884, 0, 0, 1, 1, 1,
-0.9024349, 0.02796194, -1.804862, 1, 0, 0, 1, 1,
-0.8940538, -1.715245, -0.7974179, 1, 0, 0, 1, 1,
-0.894039, 0.6927941, 0.6414709, 1, 0, 0, 1, 1,
-0.8903832, 0.3171045, -2.083858, 1, 0, 0, 1, 1,
-0.8897755, -0.654119, -3.155656, 1, 0, 0, 1, 1,
-0.8841394, 0.605688, -3.451162, 0, 0, 0, 1, 1,
-0.8697363, -0.5192301, -2.932705, 0, 0, 0, 1, 1,
-0.8694773, -0.8969948, -1.776034, 0, 0, 0, 1, 1,
-0.8660021, 0.8982, -0.4131816, 0, 0, 0, 1, 1,
-0.8585359, -0.5367643, -2.581977, 0, 0, 0, 1, 1,
-0.8562354, -0.1596368, -2.389297, 0, 0, 0, 1, 1,
-0.8491177, -0.9479205, -2.773383, 0, 0, 0, 1, 1,
-0.8476023, 0.832552, -1.577574, 1, 1, 1, 1, 1,
-0.8462124, -0.4265197, -2.033708, 1, 1, 1, 1, 1,
-0.8412923, -1.729399, -3.398444, 1, 1, 1, 1, 1,
-0.8405595, 1.190431, -0.2382339, 1, 1, 1, 1, 1,
-0.834133, 2.254203, -0.1807503, 1, 1, 1, 1, 1,
-0.8294306, 0.3076977, -1.752091, 1, 1, 1, 1, 1,
-0.8269285, 0.01149758, -1.443383, 1, 1, 1, 1, 1,
-0.8192672, 0.7212256, -0.6877538, 1, 1, 1, 1, 1,
-0.8150378, 0.1000284, -1.638593, 1, 1, 1, 1, 1,
-0.8100428, 0.01822952, -1.934265, 1, 1, 1, 1, 1,
-0.8088638, 1.033693, -1.873748, 1, 1, 1, 1, 1,
-0.8056058, -0.5068414, -2.894881, 1, 1, 1, 1, 1,
-0.8038799, -0.8369597, -2.273904, 1, 1, 1, 1, 1,
-0.803342, 1.774514, -1.073377, 1, 1, 1, 1, 1,
-0.7872975, 0.2197558, 1.837399, 1, 1, 1, 1, 1,
-0.7856603, 0.0414015, -0.8355707, 0, 0, 1, 1, 1,
-0.7852492, -1.353367, -2.768644, 1, 0, 0, 1, 1,
-0.7828642, 0.2803138, 1.268899, 1, 0, 0, 1, 1,
-0.7779258, 1.262951, -1.704972, 1, 0, 0, 1, 1,
-0.772498, 1.479597, -0.4769077, 1, 0, 0, 1, 1,
-0.7686221, -0.5054275, -2.232663, 1, 0, 0, 1, 1,
-0.7673897, -0.2264223, -1.475373, 0, 0, 0, 1, 1,
-0.7661883, -1.120329, -3.991376, 0, 0, 0, 1, 1,
-0.761206, -0.1784713, -1.562412, 0, 0, 0, 1, 1,
-0.7584, -0.8495675, -1.638297, 0, 0, 0, 1, 1,
-0.7561221, -0.8112686, 0.2644823, 0, 0, 0, 1, 1,
-0.752634, 0.2331104, -1.245223, 0, 0, 0, 1, 1,
-0.7507991, 0.8568591, -0.5889235, 0, 0, 0, 1, 1,
-0.7503954, 1.202134, -1.632832, 1, 1, 1, 1, 1,
-0.7479653, 0.8710262, -2.501092, 1, 1, 1, 1, 1,
-0.7433903, -0.6113939, -0.9922003, 1, 1, 1, 1, 1,
-0.7413482, -0.5285463, -1.30428, 1, 1, 1, 1, 1,
-0.7412482, 0.2378319, 0.008281976, 1, 1, 1, 1, 1,
-0.7358784, -0.03266663, -1.503511, 1, 1, 1, 1, 1,
-0.7296534, -2.28862, -3.631779, 1, 1, 1, 1, 1,
-0.7275388, -0.6869997, -1.375588, 1, 1, 1, 1, 1,
-0.7240952, -1.185278, -3.125159, 1, 1, 1, 1, 1,
-0.7219974, -0.249503, -0.658694, 1, 1, 1, 1, 1,
-0.7153187, 0.2178798, -0.6972905, 1, 1, 1, 1, 1,
-0.7077895, 0.08833423, 0.4970222, 1, 1, 1, 1, 1,
-0.7074277, 0.00711347, -2.247262, 1, 1, 1, 1, 1,
-0.7042922, -0.637127, -3.384895, 1, 1, 1, 1, 1,
-0.7000856, -0.7772713, -1.359973, 1, 1, 1, 1, 1,
-0.6926343, -0.03505779, -1.926967, 0, 0, 1, 1, 1,
-0.6901654, -0.1685523, -0.09439614, 1, 0, 0, 1, 1,
-0.6897865, -0.492464, -1.666835, 1, 0, 0, 1, 1,
-0.6892556, -0.5755703, -0.8125406, 1, 0, 0, 1, 1,
-0.6850666, 0.9548024, 0.3921995, 1, 0, 0, 1, 1,
-0.6839158, 1.371894, 0.08285476, 1, 0, 0, 1, 1,
-0.6836627, 0.9849021, 0.9788525, 0, 0, 0, 1, 1,
-0.6807431, 0.1928268, -2.140083, 0, 0, 0, 1, 1,
-0.6796559, 0.7260959, 0.638936, 0, 0, 0, 1, 1,
-0.6771882, 0.5256919, 0.2120919, 0, 0, 0, 1, 1,
-0.6716872, -2.124305, -4.389066, 0, 0, 0, 1, 1,
-0.6691151, 0.1823084, -2.209805, 0, 0, 0, 1, 1,
-0.6678462, -2.210332, -3.073029, 0, 0, 0, 1, 1,
-0.6643646, -1.260107, -3.856962, 1, 1, 1, 1, 1,
-0.6582161, -0.8077469, -2.048955, 1, 1, 1, 1, 1,
-0.6554272, 0.9590755, -0.44994, 1, 1, 1, 1, 1,
-0.6541294, -1.583506, -2.763772, 1, 1, 1, 1, 1,
-0.6535655, -0.09003429, -1.898647, 1, 1, 1, 1, 1,
-0.6523791, 0.3263452, -1.839369, 1, 1, 1, 1, 1,
-0.6432363, -0.9782628, -4.741742, 1, 1, 1, 1, 1,
-0.6429992, 0.6810192, -1.049855, 1, 1, 1, 1, 1,
-0.6419466, 1.318174, -0.4689339, 1, 1, 1, 1, 1,
-0.637726, -0.8262046, -2.234199, 1, 1, 1, 1, 1,
-0.6333827, -1.98859, -1.733714, 1, 1, 1, 1, 1,
-0.6329405, -2.153365, -1.262014, 1, 1, 1, 1, 1,
-0.6203527, -0.2778772, -2.768394, 1, 1, 1, 1, 1,
-0.6173968, -0.922252, -1.155927, 1, 1, 1, 1, 1,
-0.6135727, 0.1957879, -0.03937843, 1, 1, 1, 1, 1,
-0.6079634, 1.229555, -0.9180523, 0, 0, 1, 1, 1,
-0.6074095, -0.7777458, -2.318674, 1, 0, 0, 1, 1,
-0.6067629, 0.9592876, 1.216022, 1, 0, 0, 1, 1,
-0.6059624, 0.1851723, -0.5363027, 1, 0, 0, 1, 1,
-0.5998284, 0.5192335, -0.8938534, 1, 0, 0, 1, 1,
-0.5941917, 1.838701, -2.062546, 1, 0, 0, 1, 1,
-0.593906, 1.106357, -1.432823, 0, 0, 0, 1, 1,
-0.5921641, 0.6878264, -1.363675, 0, 0, 0, 1, 1,
-0.5891804, 0.7452629, -1.55664, 0, 0, 0, 1, 1,
-0.5877797, -0.6335213, -1.992372, 0, 0, 0, 1, 1,
-0.5806777, 0.5830182, -0.02746954, 0, 0, 0, 1, 1,
-0.5800707, -0.3539005, -3.358931, 0, 0, 0, 1, 1,
-0.5614583, -2.434819, -3.604796, 0, 0, 0, 1, 1,
-0.5606436, 0.2636516, -0.3207108, 1, 1, 1, 1, 1,
-0.5584407, 0.2184138, -1.338902, 1, 1, 1, 1, 1,
-0.5571595, 1.301441, 0.1630406, 1, 1, 1, 1, 1,
-0.5546937, -1.140082, -2.336395, 1, 1, 1, 1, 1,
-0.549455, -0.2292832, -2.415487, 1, 1, 1, 1, 1,
-0.5431553, -1.177503, -2.257079, 1, 1, 1, 1, 1,
-0.543122, -1.064819, -3.074578, 1, 1, 1, 1, 1,
-0.5427216, 0.1881514, -1.597425, 1, 1, 1, 1, 1,
-0.5396103, -0.2046736, -1.768069, 1, 1, 1, 1, 1,
-0.5361397, 2.575765, 0.5963426, 1, 1, 1, 1, 1,
-0.5349813, -0.4464536, -1.358082, 1, 1, 1, 1, 1,
-0.5329716, 0.3423284, 1.34489, 1, 1, 1, 1, 1,
-0.529768, 1.774041, 1.115077, 1, 1, 1, 1, 1,
-0.5286363, -0.9801725, -2.025574, 1, 1, 1, 1, 1,
-0.528261, 1.195227, 0.89704, 1, 1, 1, 1, 1,
-0.5265827, 0.6253545, 0.3242917, 0, 0, 1, 1, 1,
-0.5250246, 0.1640221, -1.760593, 1, 0, 0, 1, 1,
-0.5244444, 2.048265, 0.1958229, 1, 0, 0, 1, 1,
-0.5227736, 0.5216176, -0.5766848, 1, 0, 0, 1, 1,
-0.5199805, 0.4291362, -1.176848, 1, 0, 0, 1, 1,
-0.5192229, -0.3259168, -3.97415, 1, 0, 0, 1, 1,
-0.5186291, 0.05896569, -2.650978, 0, 0, 0, 1, 1,
-0.5167522, -1.175035, -4.390112, 0, 0, 0, 1, 1,
-0.5121101, -1.56427, -3.030561, 0, 0, 0, 1, 1,
-0.5096814, -1.220716, -2.971796, 0, 0, 0, 1, 1,
-0.5032091, -1.293388, -5.339905, 0, 0, 0, 1, 1,
-0.4968459, -1.572933, -1.221472, 0, 0, 0, 1, 1,
-0.4968156, -0.196927, -3.21268, 0, 0, 0, 1, 1,
-0.4963558, -0.5450871, -3.831056, 1, 1, 1, 1, 1,
-0.4962706, -0.6090105, -1.89586, 1, 1, 1, 1, 1,
-0.4910029, 0.7151809, -0.3368283, 1, 1, 1, 1, 1,
-0.4897515, 2.104315, -1.968707, 1, 1, 1, 1, 1,
-0.4832086, -0.1085313, -1.93966, 1, 1, 1, 1, 1,
-0.4716152, 0.3710707, -1.106757, 1, 1, 1, 1, 1,
-0.4669516, -0.5673609, -1.46878, 1, 1, 1, 1, 1,
-0.465637, -0.3489041, -1.84901, 1, 1, 1, 1, 1,
-0.4645104, -0.5092806, -3.778869, 1, 1, 1, 1, 1,
-0.4615133, -0.7849597, -3.45173, 1, 1, 1, 1, 1,
-0.459739, 0.1524706, -2.612205, 1, 1, 1, 1, 1,
-0.457445, 1.39291, 0.3270785, 1, 1, 1, 1, 1,
-0.4570843, 0.2795823, 0.3695931, 1, 1, 1, 1, 1,
-0.4556533, 0.5455089, -1.867016, 1, 1, 1, 1, 1,
-0.4550503, -0.08165022, -1.456944, 1, 1, 1, 1, 1,
-0.4480063, -1.631577, -3.078993, 0, 0, 1, 1, 1,
-0.4440328, -0.7600205, -4.792939, 1, 0, 0, 1, 1,
-0.4427167, 2.241617, 0.4083192, 1, 0, 0, 1, 1,
-0.4416379, 0.5949363, -2.239146, 1, 0, 0, 1, 1,
-0.4391873, -0.1486519, -2.532112, 1, 0, 0, 1, 1,
-0.4378891, 0.09025425, -1.059124, 1, 0, 0, 1, 1,
-0.4306141, -0.8506917, -2.433605, 0, 0, 0, 1, 1,
-0.4288303, -1.251417, -0.7761683, 0, 0, 0, 1, 1,
-0.42757, -0.4277669, -2.163297, 0, 0, 0, 1, 1,
-0.4258115, -2.545678, -2.086906, 0, 0, 0, 1, 1,
-0.4240446, -0.06101196, -4.031676, 0, 0, 0, 1, 1,
-0.4221229, 0.2070906, -1.535582, 0, 0, 0, 1, 1,
-0.4190764, 0.07395474, -1.983355, 0, 0, 0, 1, 1,
-0.4152855, 1.013587, -0.1101581, 1, 1, 1, 1, 1,
-0.4143389, -0.1698849, -3.113555, 1, 1, 1, 1, 1,
-0.4127088, 2.129698, 0.2457745, 1, 1, 1, 1, 1,
-0.4098943, 0.3571578, -2.595585, 1, 1, 1, 1, 1,
-0.4055191, 0.9004052, 0.3621374, 1, 1, 1, 1, 1,
-0.4034978, -0.6968066, -2.893231, 1, 1, 1, 1, 1,
-0.4026313, -0.9422194, -3.150115, 1, 1, 1, 1, 1,
-0.4011589, -0.8502285, -2.264024, 1, 1, 1, 1, 1,
-0.3991825, -0.3159191, -1.252956, 1, 1, 1, 1, 1,
-0.3987126, -1.003683, -2.326874, 1, 1, 1, 1, 1,
-0.392737, 0.04116838, -3.075071, 1, 1, 1, 1, 1,
-0.3926304, 0.02669559, -1.739411, 1, 1, 1, 1, 1,
-0.3819016, 0.1933446, -1.236391, 1, 1, 1, 1, 1,
-0.3806948, -1.215332, -3.551826, 1, 1, 1, 1, 1,
-0.3802867, -0.2377887, -2.547983, 1, 1, 1, 1, 1,
-0.3783464, 1.260127, 1.163565, 0, 0, 1, 1, 1,
-0.3753183, 0.4270853, -1.783096, 1, 0, 0, 1, 1,
-0.3728446, -0.7140726, -2.659807, 1, 0, 0, 1, 1,
-0.3722036, 0.4344345, 1.145739, 1, 0, 0, 1, 1,
-0.3705983, -2.725777, -5.508088, 1, 0, 0, 1, 1,
-0.3653184, -1.644925, -1.884429, 1, 0, 0, 1, 1,
-0.365205, 1.544568, 0.7826254, 0, 0, 0, 1, 1,
-0.3607709, 0.5249547, -0.0520821, 0, 0, 0, 1, 1,
-0.3594076, -1.635438, -2.265265, 0, 0, 0, 1, 1,
-0.352492, 1.662298, -0.8959936, 0, 0, 0, 1, 1,
-0.3459911, -0.03197184, -1.849068, 0, 0, 0, 1, 1,
-0.3459444, 0.7909678, -0.1485521, 0, 0, 0, 1, 1,
-0.3445717, 1.656628, 1.040071, 0, 0, 0, 1, 1,
-0.3434569, 2.618045, 0.2271148, 1, 1, 1, 1, 1,
-0.3424308, -1.544989, -4.25681, 1, 1, 1, 1, 1,
-0.3394365, -0.6167883, -2.221312, 1, 1, 1, 1, 1,
-0.3377827, -0.3032451, -2.22709, 1, 1, 1, 1, 1,
-0.3362503, 0.05185485, -0.8492881, 1, 1, 1, 1, 1,
-0.3352117, 0.09747041, -2.670631, 1, 1, 1, 1, 1,
-0.3296001, -1.869548, -3.329387, 1, 1, 1, 1, 1,
-0.3288762, 1.383283, -0.3026842, 1, 1, 1, 1, 1,
-0.3283048, -2.128959, -2.895216, 1, 1, 1, 1, 1,
-0.3272209, 0.7484339, -0.3750484, 1, 1, 1, 1, 1,
-0.3227296, -1.33746, -2.145344, 1, 1, 1, 1, 1,
-0.3113623, -0.8424346, -4.648758, 1, 1, 1, 1, 1,
-0.3073364, 0.8972832, 2.198273, 1, 1, 1, 1, 1,
-0.2971472, 0.04063516, 0.7325204, 1, 1, 1, 1, 1,
-0.2943712, -0.5707949, -2.484865, 1, 1, 1, 1, 1,
-0.2845999, 1.758095, -2.623027, 0, 0, 1, 1, 1,
-0.2833748, -0.8503177, -3.162952, 1, 0, 0, 1, 1,
-0.2767684, 1.748656, 1.64906, 1, 0, 0, 1, 1,
-0.2721692, 1.856002, -0.7397781, 1, 0, 0, 1, 1,
-0.2704731, 0.4038074, 0.7147053, 1, 0, 0, 1, 1,
-0.2688129, 0.004826694, -2.129401, 1, 0, 0, 1, 1,
-0.2609491, 0.01381633, -0.2591173, 0, 0, 0, 1, 1,
-0.2594973, 1.580514, -0.7774848, 0, 0, 0, 1, 1,
-0.2592414, 1.252619, -0.4344599, 0, 0, 0, 1, 1,
-0.258939, 1.288853, -0.08491704, 0, 0, 0, 1, 1,
-0.2584765, 0.5759937, 0.6223979, 0, 0, 0, 1, 1,
-0.2464151, 0.7700883, -1.046253, 0, 0, 0, 1, 1,
-0.2443542, -1.366224, -4.716391, 0, 0, 0, 1, 1,
-0.2398393, 0.5060431, 2.375343, 1, 1, 1, 1, 1,
-0.2340765, 0.2876725, -0.03222261, 1, 1, 1, 1, 1,
-0.233276, 0.6950288, -1.489049, 1, 1, 1, 1, 1,
-0.2331268, -0.1434896, -1.188237, 1, 1, 1, 1, 1,
-0.2330116, 0.7342908, -1.811975, 1, 1, 1, 1, 1,
-0.2329387, -0.7481529, -2.624281, 1, 1, 1, 1, 1,
-0.2320168, -0.5410425, -3.191764, 1, 1, 1, 1, 1,
-0.2292269, 0.9339294, 0.2902901, 1, 1, 1, 1, 1,
-0.2259554, -2.115873, -4.605875, 1, 1, 1, 1, 1,
-0.2250415, 0.2250636, 0.2308036, 1, 1, 1, 1, 1,
-0.2238586, 0.1303354, -2.315075, 1, 1, 1, 1, 1,
-0.2175336, -0.2407975, -1.209798, 1, 1, 1, 1, 1,
-0.2106988, -1.650533, -1.533539, 1, 1, 1, 1, 1,
-0.2097803, -0.07421235, -3.788058, 1, 1, 1, 1, 1,
-0.2096386, 0.4908535, -0.8547067, 1, 1, 1, 1, 1,
-0.1969863, 0.119536, -0.3819239, 0, 0, 1, 1, 1,
-0.1941824, 0.2966881, -1.375296, 1, 0, 0, 1, 1,
-0.1889779, -1.441865, -1.403464, 1, 0, 0, 1, 1,
-0.185445, -0.0173904, -0.1299634, 1, 0, 0, 1, 1,
-0.1818916, -1.432865, -1.599425, 1, 0, 0, 1, 1,
-0.1702327, 0.1804017, -0.4972499, 1, 0, 0, 1, 1,
-0.1686546, 0.436262, 0.6166278, 0, 0, 0, 1, 1,
-0.1670073, -0.8457372, -2.33776, 0, 0, 0, 1, 1,
-0.1636931, -0.3508528, -2.931155, 0, 0, 0, 1, 1,
-0.161526, 0.06446224, -2.251654, 0, 0, 0, 1, 1,
-0.1593207, 0.2295337, -2.949728, 0, 0, 0, 1, 1,
-0.1585461, 1.39993, -1.44732, 0, 0, 0, 1, 1,
-0.1572813, 1.653847, 1.025359, 0, 0, 0, 1, 1,
-0.1524342, 0.0359645, -1.382028, 1, 1, 1, 1, 1,
-0.1519887, -0.8945673, -2.237125, 1, 1, 1, 1, 1,
-0.1519294, 0.6209723, -0.4177332, 1, 1, 1, 1, 1,
-0.1475105, 0.9464938, -0.7484238, 1, 1, 1, 1, 1,
-0.1410806, 0.4896701, -0.2318748, 1, 1, 1, 1, 1,
-0.1373905, 0.07599116, -1.704756, 1, 1, 1, 1, 1,
-0.1348836, -0.9420368, -4.008863, 1, 1, 1, 1, 1,
-0.1334121, 0.5461323, 0.5164006, 1, 1, 1, 1, 1,
-0.1260051, 0.7635165, -0.9014505, 1, 1, 1, 1, 1,
-0.1252777, -0.965647, -2.797377, 1, 1, 1, 1, 1,
-0.1218851, 0.5321029, 0.7510708, 1, 1, 1, 1, 1,
-0.1202489, -0.6250274, -3.711411, 1, 1, 1, 1, 1,
-0.1198104, -1.184759, -4.05337, 1, 1, 1, 1, 1,
-0.1181985, 0.1289229, 1.158381, 1, 1, 1, 1, 1,
-0.117589, 1.842624, 1.286922, 1, 1, 1, 1, 1,
-0.1155095, -1.964102, -1.696847, 0, 0, 1, 1, 1,
-0.1083911, -0.7748392, -1.366293, 1, 0, 0, 1, 1,
-0.1057471, 1.828274, -1.60208, 1, 0, 0, 1, 1,
-0.1027885, -0.509745, -4.161641, 1, 0, 0, 1, 1,
-0.1019491, -0.712878, -2.419483, 1, 0, 0, 1, 1,
-0.1013328, -1.243363, -2.627728, 1, 0, 0, 1, 1,
-0.09836658, -0.3004059, -3.226623, 0, 0, 0, 1, 1,
-0.09721265, 0.3120779, -0.7254275, 0, 0, 0, 1, 1,
-0.08445267, 0.4900922, 0.716233, 0, 0, 0, 1, 1,
-0.08258138, -0.7133557, -3.479461, 0, 0, 0, 1, 1,
-0.08065966, 0.1379226, -0.8400562, 0, 0, 0, 1, 1,
-0.08029214, 1.101313, 0.4554871, 0, 0, 0, 1, 1,
-0.0762685, -0.7283283, -1.650323, 0, 0, 0, 1, 1,
-0.07067045, -0.8778122, -4.0254, 1, 1, 1, 1, 1,
-0.07066829, 1.080716, 0.1478377, 1, 1, 1, 1, 1,
-0.06874754, 0.9851406, -0.5715792, 1, 1, 1, 1, 1,
-0.06849916, -0.2784243, -3.820215, 1, 1, 1, 1, 1,
-0.06383614, -0.0358155, -2.564111, 1, 1, 1, 1, 1,
-0.06069747, -0.3614035, -2.971364, 1, 1, 1, 1, 1,
-0.05823767, -0.1093878, -2.886329, 1, 1, 1, 1, 1,
-0.05640647, -1.177955, -1.987273, 1, 1, 1, 1, 1,
-0.0548731, -0.1991209, -2.619095, 1, 1, 1, 1, 1,
-0.05205633, -0.1173866, -2.49617, 1, 1, 1, 1, 1,
-0.04359859, -2.442196, -4.006073, 1, 1, 1, 1, 1,
-0.0399259, 0.7919148, -0.1469373, 1, 1, 1, 1, 1,
-0.03468732, -1.686252, -3.275278, 1, 1, 1, 1, 1,
-0.03387084, -0.7197519, -0.3076541, 1, 1, 1, 1, 1,
-0.03343075, -0.3211788, -4.612146, 1, 1, 1, 1, 1,
-0.03175679, -0.8081643, -4.885269, 0, 0, 1, 1, 1,
-0.02904655, 2.459451, -1.854981, 1, 0, 0, 1, 1,
-0.02642899, -0.08251768, -3.373319, 1, 0, 0, 1, 1,
-0.02243073, -0.7463107, -2.953149, 1, 0, 0, 1, 1,
-0.0221683, 1.225493, 1.463645, 1, 0, 0, 1, 1,
-0.01946442, 0.4660642, 1.208085, 1, 0, 0, 1, 1,
-0.01937089, 0.006108257, -1.587219, 0, 0, 0, 1, 1,
-0.01849916, -1.309019, -4.337889, 0, 0, 0, 1, 1,
-0.01221124, -0.2055851, -4.054456, 0, 0, 0, 1, 1,
-0.008328398, 1.220157, 0.4984172, 0, 0, 0, 1, 1,
-0.003396939, 0.4029993, 0.1261617, 0, 0, 0, 1, 1,
0.002933195, 0.4595878, -0.7941247, 0, 0, 0, 1, 1,
0.01130146, -0.3598115, 2.811677, 0, 0, 0, 1, 1,
0.01140479, 0.8313281, 1.583559, 1, 1, 1, 1, 1,
0.01298932, -0.2156759, 3.434838, 1, 1, 1, 1, 1,
0.01357804, 1.737297, 0.3062635, 1, 1, 1, 1, 1,
0.01550915, -0.6512405, 2.771021, 1, 1, 1, 1, 1,
0.01932763, -0.6907468, 2.259226, 1, 1, 1, 1, 1,
0.02774468, 0.09920777, 1.27985, 1, 1, 1, 1, 1,
0.02856826, -0.2512146, 3.992881, 1, 1, 1, 1, 1,
0.03160958, -0.07672724, 2.807884, 1, 1, 1, 1, 1,
0.03319125, 0.5044661, -0.2949717, 1, 1, 1, 1, 1,
0.0341223, -0.8687372, 4.807856, 1, 1, 1, 1, 1,
0.03469267, 1.127737, -0.1444625, 1, 1, 1, 1, 1,
0.03719147, 1.295307, -0.2040413, 1, 1, 1, 1, 1,
0.03986291, -1.692081, 1.787315, 1, 1, 1, 1, 1,
0.04197399, -0.9893515, 3.32444, 1, 1, 1, 1, 1,
0.04412457, -0.1119637, 3.427344, 1, 1, 1, 1, 1,
0.04415573, -0.6934044, 3.198601, 0, 0, 1, 1, 1,
0.04683588, -0.9668737, 3.934601, 1, 0, 0, 1, 1,
0.04807907, -1.304836, 1.775238, 1, 0, 0, 1, 1,
0.04863406, -1.366648, 3.211503, 1, 0, 0, 1, 1,
0.05070625, -0.05956055, 1.830483, 1, 0, 0, 1, 1,
0.0509621, -0.2213009, 2.457994, 1, 0, 0, 1, 1,
0.05403989, -1.202877, 1.018794, 0, 0, 0, 1, 1,
0.05603737, 0.473554, 0.2774403, 0, 0, 0, 1, 1,
0.0568439, 1.596971, 0.4249313, 0, 0, 0, 1, 1,
0.06211249, 0.9605682, 0.376933, 0, 0, 0, 1, 1,
0.06327181, 0.9521811, -1.347132, 0, 0, 0, 1, 1,
0.06342996, 2.004539, -0.9116958, 0, 0, 0, 1, 1,
0.06499387, -0.6331564, 3.232013, 0, 0, 0, 1, 1,
0.06814733, 0.8665934, -0.9451938, 1, 1, 1, 1, 1,
0.0719951, -0.4812677, 4.040944, 1, 1, 1, 1, 1,
0.08103282, -0.9465529, 4.813491, 1, 1, 1, 1, 1,
0.08128867, 0.8003394, -0.1782076, 1, 1, 1, 1, 1,
0.08307519, 1.061009, -1.298325, 1, 1, 1, 1, 1,
0.08337514, -0.8392978, 4.587737, 1, 1, 1, 1, 1,
0.08421978, -2.50609, 2.821068, 1, 1, 1, 1, 1,
0.08483019, -0.8019297, 2.388816, 1, 1, 1, 1, 1,
0.08545356, -0.9906286, 2.275335, 1, 1, 1, 1, 1,
0.08763552, -2.114654, 4.671809, 1, 1, 1, 1, 1,
0.09048975, -0.8626913, 3.213034, 1, 1, 1, 1, 1,
0.09445268, -1.208921, 2.671347, 1, 1, 1, 1, 1,
0.09481725, -1.166625, 3.099203, 1, 1, 1, 1, 1,
0.09639454, 0.1330058, 1.104789, 1, 1, 1, 1, 1,
0.09959474, -0.5271554, 1.413188, 1, 1, 1, 1, 1,
0.1024164, -0.9032944, 2.572731, 0, 0, 1, 1, 1,
0.1065415, 1.360747, 0.7361114, 1, 0, 0, 1, 1,
0.1110005, 0.2463194, 0.6463867, 1, 0, 0, 1, 1,
0.1151462, 1.007609, -1.124691, 1, 0, 0, 1, 1,
0.1162281, 0.8986093, 0.5987054, 1, 0, 0, 1, 1,
0.1177678, -0.6668525, 4.58389, 1, 0, 0, 1, 1,
0.1217621, 0.3661063, -1.211829, 0, 0, 0, 1, 1,
0.128764, -1.35764, 2.373249, 0, 0, 0, 1, 1,
0.1291952, -0.9686788, 1.214996, 0, 0, 0, 1, 1,
0.1330155, -0.8258382, 1.866758, 0, 0, 0, 1, 1,
0.1348434, -0.2063639, 2.499921, 0, 0, 0, 1, 1,
0.144288, -0.5201646, 4.68224, 0, 0, 0, 1, 1,
0.1564865, 0.9573588, 1.804714, 0, 0, 0, 1, 1,
0.160713, 0.3162072, -0.59776, 1, 1, 1, 1, 1,
0.1612479, -0.8241, 2.054604, 1, 1, 1, 1, 1,
0.1621617, -1.492326, 2.970883, 1, 1, 1, 1, 1,
0.1622092, 1.024799, 0.5052053, 1, 1, 1, 1, 1,
0.1695932, 0.2290012, 0.9045897, 1, 1, 1, 1, 1,
0.1712274, -1.30799, 2.053915, 1, 1, 1, 1, 1,
0.1725018, 1.269453, 0.1462784, 1, 1, 1, 1, 1,
0.1809416, -0.2097681, 1.010368, 1, 1, 1, 1, 1,
0.1818224, -0.9740921, 0.5323357, 1, 1, 1, 1, 1,
0.1966593, 0.07969713, -0.5597166, 1, 1, 1, 1, 1,
0.199658, -0.1369715, 2.170572, 1, 1, 1, 1, 1,
0.2007207, -0.2334755, 3.108908, 1, 1, 1, 1, 1,
0.2058726, 1.539182, -0.1024687, 1, 1, 1, 1, 1,
0.2080682, -2.176956, 3.033869, 1, 1, 1, 1, 1,
0.2083955, 0.3484551, 1.91256, 1, 1, 1, 1, 1,
0.2105305, -0.4868484, 3.949726, 0, 0, 1, 1, 1,
0.2123999, 0.8520726, 1.439438, 1, 0, 0, 1, 1,
0.21584, -0.9129839, 2.223801, 1, 0, 0, 1, 1,
0.2177992, 0.8171359, 0.04608941, 1, 0, 0, 1, 1,
0.2252336, 1.487266, 0.09181856, 1, 0, 0, 1, 1,
0.2320564, 0.3378762, 0.4125329, 1, 0, 0, 1, 1,
0.2329428, 0.9426294, 0.4468574, 0, 0, 0, 1, 1,
0.2343216, 1.247421, -0.05393881, 0, 0, 0, 1, 1,
0.2377483, 0.7737285, 0.4721028, 0, 0, 0, 1, 1,
0.2417386, 1.348466, -0.009539384, 0, 0, 0, 1, 1,
0.2458037, -0.02219294, 1.675227, 0, 0, 0, 1, 1,
0.2503406, 0.5211172, -0.1506185, 0, 0, 0, 1, 1,
0.2506485, 0.189475, -0.4352558, 0, 0, 0, 1, 1,
0.2515993, 1.101008, -0.121899, 1, 1, 1, 1, 1,
0.2526828, 0.05964329, 0.2457251, 1, 1, 1, 1, 1,
0.2583659, -1.836174, 3.519945, 1, 1, 1, 1, 1,
0.2590669, -0.6366643, 0.4536732, 1, 1, 1, 1, 1,
0.2670993, -0.3538898, 0.4965161, 1, 1, 1, 1, 1,
0.2733946, 0.1126437, 1.468186, 1, 1, 1, 1, 1,
0.2798628, -1.062922, 3.539611, 1, 1, 1, 1, 1,
0.280609, -1.182238, 1.407585, 1, 1, 1, 1, 1,
0.2807824, 1.837442, 0.5431301, 1, 1, 1, 1, 1,
0.2809278, -0.01263653, 2.053823, 1, 1, 1, 1, 1,
0.2867364, -1.561285, 3.776382, 1, 1, 1, 1, 1,
0.2891377, 0.3087527, -0.5645887, 1, 1, 1, 1, 1,
0.2923956, 0.4848921, 0.9277737, 1, 1, 1, 1, 1,
0.2950827, -0.9127466, 3.095902, 1, 1, 1, 1, 1,
0.295691, -0.6798736, 3.407619, 1, 1, 1, 1, 1,
0.2976381, -0.509989, 3.24977, 0, 0, 1, 1, 1,
0.2995564, 1.219976, 0.2809109, 1, 0, 0, 1, 1,
0.3031334, -0.6670345, 1.84929, 1, 0, 0, 1, 1,
0.304409, 2.830158, 1.512694, 1, 0, 0, 1, 1,
0.3056268, 0.2966741, 0.4765964, 1, 0, 0, 1, 1,
0.3100488, -1.19512, 4.67695, 1, 0, 0, 1, 1,
0.312042, 0.1998637, 2.168876, 0, 0, 0, 1, 1,
0.3127516, -0.9720896, 3.202549, 0, 0, 0, 1, 1,
0.3140691, -0.6837841, 2.321363, 0, 0, 0, 1, 1,
0.3157026, -0.2971456, 4.661311, 0, 0, 0, 1, 1,
0.3161724, 0.6505706, 0.8210468, 0, 0, 0, 1, 1,
0.3184913, -0.03098863, 0.5902417, 0, 0, 0, 1, 1,
0.3187566, -0.2748432, 2.377755, 0, 0, 0, 1, 1,
0.3244755, 1.118856, 0.2983522, 1, 1, 1, 1, 1,
0.3254561, 0.1699619, 0.1308959, 1, 1, 1, 1, 1,
0.3303079, 1.417377, -0.7035402, 1, 1, 1, 1, 1,
0.3317649, -0.5592381, 3.221085, 1, 1, 1, 1, 1,
0.3320898, 0.29563, 1.784746, 1, 1, 1, 1, 1,
0.3332012, 0.2158492, 2.000568, 1, 1, 1, 1, 1,
0.3356909, 0.6224759, -1.88394, 1, 1, 1, 1, 1,
0.3366314, 0.9820285, -0.889183, 1, 1, 1, 1, 1,
0.3394034, -0.2777885, 3.439475, 1, 1, 1, 1, 1,
0.3457088, 0.7629923, 0.5836133, 1, 1, 1, 1, 1,
0.3478498, 1.271169, 0.7227765, 1, 1, 1, 1, 1,
0.3489063, -1.098457, 4.994333, 1, 1, 1, 1, 1,
0.3525553, 0.2094907, 2.68159, 1, 1, 1, 1, 1,
0.352735, -0.8987113, 2.507709, 1, 1, 1, 1, 1,
0.3542315, -0.963914, 1.161557, 1, 1, 1, 1, 1,
0.3550426, 0.8380538, -0.08677644, 0, 0, 1, 1, 1,
0.3569179, -0.4266141, 3.184705, 1, 0, 0, 1, 1,
0.3580454, 0.545819, 1.459318, 1, 0, 0, 1, 1,
0.3606704, 1.053949, 1.73827, 1, 0, 0, 1, 1,
0.3623011, -1.050685, 2.645956, 1, 0, 0, 1, 1,
0.3706188, 0.5790766, -0.2963284, 1, 0, 0, 1, 1,
0.378238, -0.4157824, 2.559692, 0, 0, 0, 1, 1,
0.3796737, -0.493991, 2.591328, 0, 0, 0, 1, 1,
0.3826095, -0.1557135, 1.891202, 0, 0, 0, 1, 1,
0.3842548, 0.6243994, 0.6376373, 0, 0, 0, 1, 1,
0.3852273, 0.8062229, 2.547303, 0, 0, 0, 1, 1,
0.3857879, -1.052107, 2.978731, 0, 0, 0, 1, 1,
0.3862155, -0.04176691, 2.6445, 0, 0, 0, 1, 1,
0.3872171, -0.08655351, -0.306303, 1, 1, 1, 1, 1,
0.3921496, -0.5880005, 1.387354, 1, 1, 1, 1, 1,
0.3925745, -2.517521, 2.089676, 1, 1, 1, 1, 1,
0.395965, -0.4180374, 3.753344, 1, 1, 1, 1, 1,
0.3983067, -2.128824, 4.813899, 1, 1, 1, 1, 1,
0.4057341, -1.713003, 1.57873, 1, 1, 1, 1, 1,
0.4088958, -0.6117775, 0.6752982, 1, 1, 1, 1, 1,
0.4120665, -0.6505728, 3.728716, 1, 1, 1, 1, 1,
0.4145674, -0.3773757, 0.6461868, 1, 1, 1, 1, 1,
0.4277285, 0.6231526, -0.1612159, 1, 1, 1, 1, 1,
0.4283937, -1.344973, 2.521912, 1, 1, 1, 1, 1,
0.4289835, -1.043914, 1.101806, 1, 1, 1, 1, 1,
0.4293309, -0.5680659, 2.940614, 1, 1, 1, 1, 1,
0.4312631, -1.222268, 2.848166, 1, 1, 1, 1, 1,
0.43159, 0.4881721, 0.6645755, 1, 1, 1, 1, 1,
0.4317176, -0.4219306, 1.082976, 0, 0, 1, 1, 1,
0.4349656, -0.3626972, 2.402888, 1, 0, 0, 1, 1,
0.4364793, 0.4024577, 0.377921, 1, 0, 0, 1, 1,
0.4372403, -0.1710771, 1.028715, 1, 0, 0, 1, 1,
0.4373424, -1.138751, 1.179184, 1, 0, 0, 1, 1,
0.4430312, -0.4172933, 2.809132, 1, 0, 0, 1, 1,
0.4436506, 0.2671078, -0.4186525, 0, 0, 0, 1, 1,
0.4441288, -1.055582, 3.821967, 0, 0, 0, 1, 1,
0.4500495, 0.9378129, 0.5643137, 0, 0, 0, 1, 1,
0.4500991, 0.5422548, 0.8010405, 0, 0, 0, 1, 1,
0.4566856, 0.1094827, 1.743849, 0, 0, 0, 1, 1,
0.4606192, 0.2167714, -0.7972279, 0, 0, 0, 1, 1,
0.4708044, -0.6073549, 1.140038, 0, 0, 0, 1, 1,
0.471201, -0.2105153, 3.97824, 1, 1, 1, 1, 1,
0.4718757, -2.261849, 4.11342, 1, 1, 1, 1, 1,
0.4732389, -0.6241129, 3.3828, 1, 1, 1, 1, 1,
0.4757866, -0.6287618, 4.071234, 1, 1, 1, 1, 1,
0.4825794, 0.3235319, 1.259491, 1, 1, 1, 1, 1,
0.483029, 0.6744896, 0.6016337, 1, 1, 1, 1, 1,
0.4833053, 0.1188997, 2.140271, 1, 1, 1, 1, 1,
0.4855469, 0.8767529, 0.3064948, 1, 1, 1, 1, 1,
0.4863799, 0.2913968, 2.156146, 1, 1, 1, 1, 1,
0.4893641, -1.253146, 3.809572, 1, 1, 1, 1, 1,
0.4906174, 0.2896344, -0.2534954, 1, 1, 1, 1, 1,
0.4930016, 1.091933, -0.3493078, 1, 1, 1, 1, 1,
0.4936911, -1.165676, 2.952546, 1, 1, 1, 1, 1,
0.4944912, 0.3745328, -0.3805034, 1, 1, 1, 1, 1,
0.4945296, 1.83944, -0.3706525, 1, 1, 1, 1, 1,
0.4956579, -1.022341, 4.186786, 0, 0, 1, 1, 1,
0.4995355, 1.327322, -0.07525855, 1, 0, 0, 1, 1,
0.5065511, -1.09433, 1.453202, 1, 0, 0, 1, 1,
0.5116486, -1.146423, 1.929627, 1, 0, 0, 1, 1,
0.5135935, 1.240886, 0.880622, 1, 0, 0, 1, 1,
0.5148075, 0.159321, -0.1691816, 1, 0, 0, 1, 1,
0.5161228, 0.9609247, -0.02332585, 0, 0, 0, 1, 1,
0.523015, -0.1920971, 1.956708, 0, 0, 0, 1, 1,
0.523054, 0.5186739, 1.516832, 0, 0, 0, 1, 1,
0.5262948, 1.837842, -1.110225, 0, 0, 0, 1, 1,
0.5308433, -0.6439635, 2.326829, 0, 0, 0, 1, 1,
0.5440754, 0.6181884, 0.5385143, 0, 0, 0, 1, 1,
0.5458761, 0.7506038, 1.41825, 0, 0, 0, 1, 1,
0.5461463, -0.4706981, 2.919615, 1, 1, 1, 1, 1,
0.5534547, 0.09729681, 2.043046, 1, 1, 1, 1, 1,
0.5559479, -0.06321825, 2.833332, 1, 1, 1, 1, 1,
0.5570101, -1.03226, 2.45843, 1, 1, 1, 1, 1,
0.5579438, -0.8704434, 3.352719, 1, 1, 1, 1, 1,
0.5613607, 0.8218106, 2.071355, 1, 1, 1, 1, 1,
0.5653611, -0.2043149, 1.021523, 1, 1, 1, 1, 1,
0.5752904, 1.356048, 1.162612, 1, 1, 1, 1, 1,
0.5789958, -1.830919, 3.826048, 1, 1, 1, 1, 1,
0.5823551, 2.055721, 0.4090005, 1, 1, 1, 1, 1,
0.58652, -1.788117, 1.621861, 1, 1, 1, 1, 1,
0.5875043, -0.4853776, 1.918647, 1, 1, 1, 1, 1,
0.5891321, -1.497432, 1.706876, 1, 1, 1, 1, 1,
0.5895038, -0.7246882, 1.00834, 1, 1, 1, 1, 1,
0.5902817, 0.003855589, 0.3706438, 1, 1, 1, 1, 1,
0.5909364, 0.6125987, 0.3155364, 0, 0, 1, 1, 1,
0.5925448, -0.7529406, 2.691257, 1, 0, 0, 1, 1,
0.5989857, 2.411407, 1.639053, 1, 0, 0, 1, 1,
0.6007326, 0.9196998, 0.6212822, 1, 0, 0, 1, 1,
0.6024454, 0.7021779, 1.710098, 1, 0, 0, 1, 1,
0.604896, -0.6918691, 2.830208, 1, 0, 0, 1, 1,
0.608736, -1.260086, 2.921017, 0, 0, 0, 1, 1,
0.6093251, -1.217879, 1.46935, 0, 0, 0, 1, 1,
0.6093857, 2.197419, 0.03118456, 0, 0, 0, 1, 1,
0.6122615, -0.02124892, 0.366775, 0, 0, 0, 1, 1,
0.6127692, 0.1210859, 0.5257558, 0, 0, 0, 1, 1,
0.612826, 0.3608723, -0.3230205, 0, 0, 0, 1, 1,
0.615253, 0.08143395, 2.306803, 0, 0, 0, 1, 1,
0.6237354, -0.9284155, 3.506355, 1, 1, 1, 1, 1,
0.6259483, -0.9697307, 2.780437, 1, 1, 1, 1, 1,
0.6263342, 0.9223154, -0.2000542, 1, 1, 1, 1, 1,
0.62891, -0.7818356, 1.34206, 1, 1, 1, 1, 1,
0.6319994, -0.2805786, 2.930955, 1, 1, 1, 1, 1,
0.6339779, 0.2201169, 1.722073, 1, 1, 1, 1, 1,
0.634398, 0.5935091, 2.067081, 1, 1, 1, 1, 1,
0.637437, 2.347178, 0.5240994, 1, 1, 1, 1, 1,
0.6403641, -0.829585, 2.200195, 1, 1, 1, 1, 1,
0.6405685, 0.598442, -1.256382, 1, 1, 1, 1, 1,
0.640853, -0.2256271, -0.2662098, 1, 1, 1, 1, 1,
0.6432291, -0.08888274, 0.1568591, 1, 1, 1, 1, 1,
0.644583, 0.3211039, 0.01386814, 1, 1, 1, 1, 1,
0.6458365, 0.05937009, 0.5303311, 1, 1, 1, 1, 1,
0.651381, 0.957373, 0.6481242, 1, 1, 1, 1, 1,
0.6554012, -0.7760909, 4.011948, 0, 0, 1, 1, 1,
0.6627365, 0.7614365, 1.667706, 1, 0, 0, 1, 1,
0.663371, 2.228779, -0.302211, 1, 0, 0, 1, 1,
0.6635597, -0.3593465, 1.303748, 1, 0, 0, 1, 1,
0.6651797, 0.9123201, 0.8011783, 1, 0, 0, 1, 1,
0.6684449, -0.1331253, 0.9209368, 1, 0, 0, 1, 1,
0.6688436, 0.8902092, -0.3948257, 0, 0, 0, 1, 1,
0.6716981, -0.0005984535, 1.799565, 0, 0, 0, 1, 1,
0.6721525, 0.1384925, 1.34577, 0, 0, 0, 1, 1,
0.6753652, -0.8136173, 4.322314, 0, 0, 0, 1, 1,
0.68388, -1.716423, 4.997189, 0, 0, 0, 1, 1,
0.6843531, -1.226844, 4.941382, 0, 0, 0, 1, 1,
0.6863378, 0.5568041, 0.1361563, 0, 0, 0, 1, 1,
0.6895907, 0.175828, 0.3090394, 1, 1, 1, 1, 1,
0.6945429, 1.239073, 1.336606, 1, 1, 1, 1, 1,
0.6975227, 0.1282341, 1.634367, 1, 1, 1, 1, 1,
0.7019193, -0.9500876, 1.413292, 1, 1, 1, 1, 1,
0.7047212, 0.1339426, 0.9479612, 1, 1, 1, 1, 1,
0.7075377, -0.1209541, 2.212363, 1, 1, 1, 1, 1,
0.715372, 0.6206322, 1.779503, 1, 1, 1, 1, 1,
0.7172649, 1.217079, 1.169458, 1, 1, 1, 1, 1,
0.7220203, 0.6202137, 0.7945598, 1, 1, 1, 1, 1,
0.7225832, 1.258198, -1.061099, 1, 1, 1, 1, 1,
0.7283447, -0.4541278, 3.988456, 1, 1, 1, 1, 1,
0.7307407, -0.9339973, 2.325457, 1, 1, 1, 1, 1,
0.7320791, -0.5933546, 3.006688, 1, 1, 1, 1, 1,
0.7353125, -1.069783, 3.133684, 1, 1, 1, 1, 1,
0.7363746, -1.002101, 1.909762, 1, 1, 1, 1, 1,
0.7378728, -1.208873, 1.949448, 0, 0, 1, 1, 1,
0.7422541, 0.9794281, 2.58477, 1, 0, 0, 1, 1,
0.7430466, -1.323751, 0.8974231, 1, 0, 0, 1, 1,
0.7462019, -1.173991, 2.874033, 1, 0, 0, 1, 1,
0.7486048, 1.648608, 0.6620144, 1, 0, 0, 1, 1,
0.7486361, 0.64322, 0.4788421, 1, 0, 0, 1, 1,
0.7499507, -1.079895, 2.186763, 0, 0, 0, 1, 1,
0.7617173, -1.813147, 2.621061, 0, 0, 0, 1, 1,
0.7628771, -0.5433323, 0.4605986, 0, 0, 0, 1, 1,
0.76686, -0.2447694, 1.102556, 0, 0, 0, 1, 1,
0.7684467, 0.4938937, 0.1003851, 0, 0, 0, 1, 1,
0.7707467, -0.3615942, 3.2515, 0, 0, 0, 1, 1,
0.7743402, 0.1190499, 2.616426, 0, 0, 0, 1, 1,
0.7788765, -0.5150939, 2.419776, 1, 1, 1, 1, 1,
0.7930014, 0.231873, 1.69725, 1, 1, 1, 1, 1,
0.7968289, 0.9636901, 0.7446903, 1, 1, 1, 1, 1,
0.8027886, -0.6206399, 1.129284, 1, 1, 1, 1, 1,
0.8049296, -0.2145543, 3.003564, 1, 1, 1, 1, 1,
0.8101911, -1.353543, 2.865277, 1, 1, 1, 1, 1,
0.8102931, -1.484936, 4.225609, 1, 1, 1, 1, 1,
0.813205, -0.06069683, 1.767851, 1, 1, 1, 1, 1,
0.8225654, 0.3954107, 1.345129, 1, 1, 1, 1, 1,
0.8228387, 0.4932537, 1.023882, 1, 1, 1, 1, 1,
0.8319092, 0.3021115, 0.8761441, 1, 1, 1, 1, 1,
0.834252, -2.691575, 3.335715, 1, 1, 1, 1, 1,
0.835372, 0.549557, 0.01126906, 1, 1, 1, 1, 1,
0.8362177, -2.559422, 0.9787374, 1, 1, 1, 1, 1,
0.8434483, 0.5629387, 0.9434438, 1, 1, 1, 1, 1,
0.8490434, 0.7700173, 1.322208, 0, 0, 1, 1, 1,
0.8498949, -1.661001, 2.320802, 1, 0, 0, 1, 1,
0.8502013, -0.3703394, 3.269744, 1, 0, 0, 1, 1,
0.854358, 0.1801846, 1.446226, 1, 0, 0, 1, 1,
0.8564857, -0.8547313, 1.288825, 1, 0, 0, 1, 1,
0.8565132, -1.537775, 3.275175, 1, 0, 0, 1, 1,
0.8566795, 0.02416612, 1.129311, 0, 0, 0, 1, 1,
0.8601194, 0.1320845, -0.4070398, 0, 0, 0, 1, 1,
0.8677288, 0.245412, 1.28998, 0, 0, 0, 1, 1,
0.8680052, 0.3791399, 1.384267, 0, 0, 0, 1, 1,
0.873238, 0.5107578, 0.7607885, 0, 0, 0, 1, 1,
0.8756732, 0.1775526, 1.646721, 0, 0, 0, 1, 1,
0.8761119, -0.4031532, 0.7234306, 0, 0, 0, 1, 1,
0.8837063, 0.1593909, 2.137112, 1, 1, 1, 1, 1,
0.8883373, -0.127318, 1.774061, 1, 1, 1, 1, 1,
0.8922057, 1.123266, 1.25192, 1, 1, 1, 1, 1,
0.8931564, 0.2949315, 0.9712143, 1, 1, 1, 1, 1,
0.8976474, -1.321496, 1.811687, 1, 1, 1, 1, 1,
0.8991477, -0.4954568, 0.6813297, 1, 1, 1, 1, 1,
0.8995484, -0.3945712, 2.348455, 1, 1, 1, 1, 1,
0.9027222, -1.349073, 2.096489, 1, 1, 1, 1, 1,
0.903696, -0.4112587, 2.297924, 1, 1, 1, 1, 1,
0.9051812, -0.2293867, 2.301901, 1, 1, 1, 1, 1,
0.9114861, 1.048659, -1.218504, 1, 1, 1, 1, 1,
0.9140772, -0.02510298, -0.4484848, 1, 1, 1, 1, 1,
0.9142278, -0.9377566, 2.755767, 1, 1, 1, 1, 1,
0.9143893, 0.5294255, 1.092947, 1, 1, 1, 1, 1,
0.9160526, 0.5941404, 1.222006, 1, 1, 1, 1, 1,
0.9182409, 2.190475, -0.5630078, 0, 0, 1, 1, 1,
0.9194662, 0.9962929, 0.05930012, 1, 0, 0, 1, 1,
0.9233955, 1.253041, -1.636751, 1, 0, 0, 1, 1,
0.9257448, 0.6743824, 2.753602, 1, 0, 0, 1, 1,
0.9257911, 0.00770832, 1.191457, 1, 0, 0, 1, 1,
0.9387684, 1.905761, 0.6622268, 1, 0, 0, 1, 1,
0.9434137, 0.2831522, 2.128802, 0, 0, 0, 1, 1,
0.9436985, -0.4873345, 0.7466415, 0, 0, 0, 1, 1,
0.9452378, -1.647715, 2.302243, 0, 0, 0, 1, 1,
0.9495503, -0.0737408, 1.43, 0, 0, 0, 1, 1,
0.9528146, 0.9169471, 0.3235956, 0, 0, 0, 1, 1,
0.9551732, -0.736216, 0.8158551, 0, 0, 0, 1, 1,
0.9562654, -0.7228262, 0.5465809, 0, 0, 0, 1, 1,
0.956674, -0.1371633, 1.06593, 1, 1, 1, 1, 1,
0.9620415, -0.1495771, 0.7442108, 1, 1, 1, 1, 1,
0.9620649, -0.3938284, 2.288144, 1, 1, 1, 1, 1,
0.9636859, 0.6457841, 2.209722, 1, 1, 1, 1, 1,
0.9675448, -0.1260614, 1.202867, 1, 1, 1, 1, 1,
0.9682211, -0.0338946, -0.6687125, 1, 1, 1, 1, 1,
0.9690905, -0.3464617, 0.5245737, 1, 1, 1, 1, 1,
0.9727833, -0.6413543, 1.736784, 1, 1, 1, 1, 1,
0.9807372, -0.8221056, 2.722888, 1, 1, 1, 1, 1,
0.9859019, -0.03464787, 1.956958, 1, 1, 1, 1, 1,
0.9869795, -0.9326304, 1.157202, 1, 1, 1, 1, 1,
0.9878269, -0.7927395, 3.749549, 1, 1, 1, 1, 1,
0.9946014, -0.005576515, 2.352743, 1, 1, 1, 1, 1,
0.9946563, -0.3068548, 1.56998, 1, 1, 1, 1, 1,
1.001599, 0.232909, 2.246454, 1, 1, 1, 1, 1,
1.005312, -1.014473, 1.535163, 0, 0, 1, 1, 1,
1.00603, -1.032332, 0.8265164, 1, 0, 0, 1, 1,
1.013534, 0.3443858, 0.6705146, 1, 0, 0, 1, 1,
1.016486, -0.7102093, 1.659827, 1, 0, 0, 1, 1,
1.019613, 1.99191, -0.0981831, 1, 0, 0, 1, 1,
1.02028, 0.01728623, 2.230755, 1, 0, 0, 1, 1,
1.022506, 1.531912, 0.4511496, 0, 0, 0, 1, 1,
1.023135, -2.971437, 1.432119, 0, 0, 0, 1, 1,
1.024193, 0.07821143, -0.0038212, 0, 0, 0, 1, 1,
1.030089, 1.305945, 1.042998, 0, 0, 0, 1, 1,
1.032416, 1.150359, 0.4872801, 0, 0, 0, 1, 1,
1.032957, -0.4879142, 2.25471, 0, 0, 0, 1, 1,
1.043167, 0.6242105, -0.6923495, 0, 0, 0, 1, 1,
1.052422, -0.4426573, 2.850988, 1, 1, 1, 1, 1,
1.061489, 0.1397818, 0.779663, 1, 1, 1, 1, 1,
1.063049, -2.598017, 2.791812, 1, 1, 1, 1, 1,
1.078854, 1.450016, -0.7663418, 1, 1, 1, 1, 1,
1.078928, 0.3003346, 1.50673, 1, 1, 1, 1, 1,
1.08156, 0.6678951, 1.647291, 1, 1, 1, 1, 1,
1.083918, 0.5224107, 1.166511, 1, 1, 1, 1, 1,
1.084713, 1.418732, -0.537949, 1, 1, 1, 1, 1,
1.100374, -0.3839031, 2.065744, 1, 1, 1, 1, 1,
1.102828, 0.610199, 2.560707, 1, 1, 1, 1, 1,
1.107441, -0.6162289, 2.158352, 1, 1, 1, 1, 1,
1.107451, 0.6423867, -1.222083, 1, 1, 1, 1, 1,
1.108531, -0.6123742, 1.59329, 1, 1, 1, 1, 1,
1.11071, 1.06025, 1.235654, 1, 1, 1, 1, 1,
1.112951, -0.3904105, 1.764127, 1, 1, 1, 1, 1,
1.114254, 0.6606559, 2.038138, 0, 0, 1, 1, 1,
1.115149, -0.3479867, 0.9849314, 1, 0, 0, 1, 1,
1.124176, -1.204337, 3.011501, 1, 0, 0, 1, 1,
1.125385, -0.1123517, 1.961712, 1, 0, 0, 1, 1,
1.129283, 0.09495427, 0.5389509, 1, 0, 0, 1, 1,
1.135967, 0.670601, 1.763992, 1, 0, 0, 1, 1,
1.137122, 0.3807516, 1.692551, 0, 0, 0, 1, 1,
1.14122, -0.5802527, 2.388469, 0, 0, 0, 1, 1,
1.151088, 1.619658, 0.8946043, 0, 0, 0, 1, 1,
1.158441, 2.95804, 1.032849, 0, 0, 0, 1, 1,
1.159008, -1.60623, 2.864355, 0, 0, 0, 1, 1,
1.159447, 0.7912186, -0.5930232, 0, 0, 0, 1, 1,
1.172964, 0.4156409, 0.5479167, 0, 0, 0, 1, 1,
1.174003, 0.310167, 1.265247, 1, 1, 1, 1, 1,
1.183692, -1.239859, 2.858661, 1, 1, 1, 1, 1,
1.188422, 0.2764837, 1.070001, 1, 1, 1, 1, 1,
1.19254, -1.850543, 2.833897, 1, 1, 1, 1, 1,
1.204346, 1.517635, -0.2315111, 1, 1, 1, 1, 1,
1.210827, 0.03936156, 2.591253, 1, 1, 1, 1, 1,
1.220533, -0.1751379, 2.566259, 1, 1, 1, 1, 1,
1.237568, 0.9125804, 1.684892, 1, 1, 1, 1, 1,
1.24115, -0.1375179, 1.607866, 1, 1, 1, 1, 1,
1.255741, 0.7683428, 2.474858, 1, 1, 1, 1, 1,
1.258035, -1.415676, 0.6736017, 1, 1, 1, 1, 1,
1.258543, 0.1092885, -0.3077306, 1, 1, 1, 1, 1,
1.26051, 0.9435907, -0.703063, 1, 1, 1, 1, 1,
1.262139, 0.3257056, -0.4766424, 1, 1, 1, 1, 1,
1.274188, 0.1234715, 2.919996, 1, 1, 1, 1, 1,
1.27799, 2.089713, 1.833968, 0, 0, 1, 1, 1,
1.279042, 1.099465, 0.5189611, 1, 0, 0, 1, 1,
1.282345, 1.552974, 0.604697, 1, 0, 0, 1, 1,
1.299901, 0.1707422, -0.9279252, 1, 0, 0, 1, 1,
1.310039, 1.472772, -0.474007, 1, 0, 0, 1, 1,
1.318727, -0.4991488, 0.6413779, 1, 0, 0, 1, 1,
1.321196, -1.594871, 1.361629, 0, 0, 0, 1, 1,
1.339866, -1.587641, 2.401356, 0, 0, 0, 1, 1,
1.341164, -0.6615795, 2.114095, 0, 0, 0, 1, 1,
1.342071, -0.3359368, 0.2567045, 0, 0, 0, 1, 1,
1.34774, -1.48461, 1.40902, 0, 0, 0, 1, 1,
1.348039, 0.7231494, 0.7603229, 0, 0, 0, 1, 1,
1.348469, -0.8103751, 4.840947, 0, 0, 0, 1, 1,
1.351411, 0.9686553, 1.383908, 1, 1, 1, 1, 1,
1.35261, 0.5282173, 1.867105, 1, 1, 1, 1, 1,
1.35385, 0.5538499, 2.837216, 1, 1, 1, 1, 1,
1.356568, 0.301896, 2.901299, 1, 1, 1, 1, 1,
1.361773, 0.939604, -0.3157814, 1, 1, 1, 1, 1,
1.36468, -3.424352, 3.137065, 1, 1, 1, 1, 1,
1.364989, 1.073145, -2.589705, 1, 1, 1, 1, 1,
1.369608, -0.04670646, 3.129223, 1, 1, 1, 1, 1,
1.372608, 0.9805418, 0.6544863, 1, 1, 1, 1, 1,
1.381879, 0.5581003, 0.8471599, 1, 1, 1, 1, 1,
1.386945, -0.3649015, 1.808302, 1, 1, 1, 1, 1,
1.387864, 0.5274476, -0.002097246, 1, 1, 1, 1, 1,
1.391804, -0.9908809, 1.778462, 1, 1, 1, 1, 1,
1.395264, -1.167108, 3.139696, 1, 1, 1, 1, 1,
1.40341, 0.1015359, 0.674935, 1, 1, 1, 1, 1,
1.406197, 0.9800146, -0.3311788, 0, 0, 1, 1, 1,
1.440142, -1.561319, 2.459189, 1, 0, 0, 1, 1,
1.454649, -1.322463, 2.461028, 1, 0, 0, 1, 1,
1.458427, -0.928816, 4.4039, 1, 0, 0, 1, 1,
1.468377, 0.7860678, 1.376428, 1, 0, 0, 1, 1,
1.49699, 0.3871815, 1.086754, 1, 0, 0, 1, 1,
1.524451, 1.475909, 1.891341, 0, 0, 0, 1, 1,
1.542789, 0.2607795, 2.259063, 0, 0, 0, 1, 1,
1.54482, -0.1076964, 1.429202, 0, 0, 0, 1, 1,
1.54877, 0.2680994, 1.190843, 0, 0, 0, 1, 1,
1.555031, 0.1035025, -1.341351, 0, 0, 0, 1, 1,
1.560153, 0.8851068, 3.715585, 0, 0, 0, 1, 1,
1.574135, -1.165195, 0.8848976, 0, 0, 0, 1, 1,
1.586853, 0.4731126, 1.160287, 1, 1, 1, 1, 1,
1.595444, 2.02844, 2.092693, 1, 1, 1, 1, 1,
1.599079, 0.727192, 2.661287, 1, 1, 1, 1, 1,
1.619233, 1.078692, 0.4165241, 1, 1, 1, 1, 1,
1.633858, -1.971644, 2.335394, 1, 1, 1, 1, 1,
1.636048, -0.1321094, 0.399493, 1, 1, 1, 1, 1,
1.637951, 0.7315381, 0.1467911, 1, 1, 1, 1, 1,
1.655769, -0.3506736, 2.668245, 1, 1, 1, 1, 1,
1.660832, -1.038628, 2.787666, 1, 1, 1, 1, 1,
1.668451, 0.5506597, 1.15931, 1, 1, 1, 1, 1,
1.671316, -1.411895, 0.7185368, 1, 1, 1, 1, 1,
1.674345, -0.4282697, 1.318914, 1, 1, 1, 1, 1,
1.674786, -0.877885, 1.71146, 1, 1, 1, 1, 1,
1.682511, -0.4535066, 0.8599585, 1, 1, 1, 1, 1,
1.693591, -0.988747, 3.028852, 1, 1, 1, 1, 1,
1.705408, -1.600161, 3.186342, 0, 0, 1, 1, 1,
1.710813, 1.242653, 0.3411857, 1, 0, 0, 1, 1,
1.710819, -0.6915652, 1.163636, 1, 0, 0, 1, 1,
1.716745, -2.388167, 2.084794, 1, 0, 0, 1, 1,
1.734871, 0.2702579, 1.845821, 1, 0, 0, 1, 1,
1.739757, -0.4937377, 1.681003, 1, 0, 0, 1, 1,
1.749979, -0.3431398, 0.805492, 0, 0, 0, 1, 1,
1.750634, -1.785206, 3.186972, 0, 0, 0, 1, 1,
1.797204, 0.9173017, 0.09372292, 0, 0, 0, 1, 1,
1.811607, -1.653266, 3.518097, 0, 0, 0, 1, 1,
1.838848, 0.9793223, 0.9840643, 0, 0, 0, 1, 1,
1.845824, 0.377135, 2.790526, 0, 0, 0, 1, 1,
1.865692, 0.2044289, 0.9148945, 0, 0, 0, 1, 1,
1.867995, -0.2889449, 1.42033, 1, 1, 1, 1, 1,
1.879638, 2.403947, 1.800748, 1, 1, 1, 1, 1,
1.892654, -1.347223, 3.122503, 1, 1, 1, 1, 1,
1.893838, 0.525816, 0.6751803, 1, 1, 1, 1, 1,
1.923325, -0.1507436, 1.57703, 1, 1, 1, 1, 1,
1.926086, -0.04020752, 1.376076, 1, 1, 1, 1, 1,
1.928408, -0.05863575, 0.9231988, 1, 1, 1, 1, 1,
1.929366, 0.6579983, 0.7403995, 1, 1, 1, 1, 1,
1.943291, -1.632101, 2.443115, 1, 1, 1, 1, 1,
1.945383, 0.7397051, 1.122962, 1, 1, 1, 1, 1,
1.965455, 0.06109744, 2.301091, 1, 1, 1, 1, 1,
1.978082, -0.2777072, 3.208593, 1, 1, 1, 1, 1,
2.032352, -2.126825, 3.025763, 1, 1, 1, 1, 1,
2.036276, -1.198618, 2.906134, 1, 1, 1, 1, 1,
2.056784, -0.8018449, 1.670791, 1, 1, 1, 1, 1,
2.113847, 1.188647, -0.3145701, 0, 0, 1, 1, 1,
2.130901, -0.03845623, 0.4334283, 1, 0, 0, 1, 1,
2.148789, -0.2419415, 3.078134, 1, 0, 0, 1, 1,
2.168448, 0.4162105, 1.115333, 1, 0, 0, 1, 1,
2.184095, 0.5187337, 0.9018662, 1, 0, 0, 1, 1,
2.221264, -0.4787163, -0.1428823, 1, 0, 0, 1, 1,
2.222259, 0.5085069, 0.871754, 0, 0, 0, 1, 1,
2.229942, 0.8728519, 2.727551, 0, 0, 0, 1, 1,
2.290758, 0.3758568, 2.217387, 0, 0, 0, 1, 1,
2.308685, 0.5768907, 3.446596, 0, 0, 0, 1, 1,
2.335542, -0.5044876, 1.404511, 0, 0, 0, 1, 1,
2.356961, -0.7423286, 1.466232, 0, 0, 0, 1, 1,
2.371206, -2.400646, 3.545964, 0, 0, 0, 1, 1,
2.393405, 0.9259831, 2.603101, 1, 1, 1, 1, 1,
2.599573, 0.8638158, 0.3646504, 1, 1, 1, 1, 1,
2.733954, 1.121124, 1.709636, 1, 1, 1, 1, 1,
2.780681, 1.175318, 0.3489776, 1, 1, 1, 1, 1,
3.020077, -0.2034453, 0.7162245, 1, 1, 1, 1, 1,
3.733826, -0.0484406, 2.6514, 1, 1, 1, 1, 1,
4.452504, 1.145499, 1.020535, 1, 1, 1, 1, 1
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
var radius = 10.14819;
var distance = 35.64508;
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
mvMatrix.translate( -0.6009958, -0.3169072, 0.2554498 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.64508);
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
