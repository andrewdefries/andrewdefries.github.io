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
-3.465808, -0.1773458, -1.337387, 1, 0, 0, 1,
-3.290074, 0.04783537, -1.866416, 1, 0.007843138, 0, 1,
-3.188926, -1.152425, -2.532004, 1, 0.01176471, 0, 1,
-3.052828, 2.277503, -0.4787416, 1, 0.01960784, 0, 1,
-2.938711, 0.7642174, -1.450482, 1, 0.02352941, 0, 1,
-2.927218, 1.513172, 1.140511, 1, 0.03137255, 0, 1,
-2.897914, 1.397925, -1.430593, 1, 0.03529412, 0, 1,
-2.581045, -0.2943931, -1.37372, 1, 0.04313726, 0, 1,
-2.549241, -0.8019823, -1.722091, 1, 0.04705882, 0, 1,
-2.532893, 1.547854, 0.2111889, 1, 0.05490196, 0, 1,
-2.532224, 1.127885, -1.276111, 1, 0.05882353, 0, 1,
-2.520881, 0.2431898, -0.9041553, 1, 0.06666667, 0, 1,
-2.221727, 0.04945437, -1.855045, 1, 0.07058824, 0, 1,
-2.219989, -0.8494663, -2.896039, 1, 0.07843138, 0, 1,
-2.210675, -0.1516381, -1.909925, 1, 0.08235294, 0, 1,
-2.209491, 1.367062, -0.7955697, 1, 0.09019608, 0, 1,
-2.192977, 0.8258049, -0.1378113, 1, 0.09411765, 0, 1,
-2.192325, 0.4283868, -2.636671, 1, 0.1019608, 0, 1,
-2.158608, 0.8620943, -0.8311796, 1, 0.1098039, 0, 1,
-2.152998, 1.653281, -1.305606, 1, 0.1137255, 0, 1,
-2.147408, 0.3219667, -0.7990116, 1, 0.1215686, 0, 1,
-2.104944, 0.9015189, -0.6050782, 1, 0.1254902, 0, 1,
-2.096784, -2.020434, -1.714774, 1, 0.1333333, 0, 1,
-2.095966, 0.8715183, -1.059361, 1, 0.1372549, 0, 1,
-2.050405, -0.8706106, -0.6990056, 1, 0.145098, 0, 1,
-2.045422, 0.3210035, -1.705162, 1, 0.1490196, 0, 1,
-2.014918, -1.264288, -2.132834, 1, 0.1568628, 0, 1,
-1.987777, 0.05917519, -1.941814, 1, 0.1607843, 0, 1,
-1.976034, 0.36312, -1.188639, 1, 0.1686275, 0, 1,
-1.969961, -0.4911595, -1.859756, 1, 0.172549, 0, 1,
-1.969713, -0.2528334, -1.530634, 1, 0.1803922, 0, 1,
-1.95012, 1.379184, 1.037827, 1, 0.1843137, 0, 1,
-1.916974, -0.6927673, -3.059342, 1, 0.1921569, 0, 1,
-1.877866, -0.2394275, -3.041978, 1, 0.1960784, 0, 1,
-1.869743, 2.251271, -0.7748881, 1, 0.2039216, 0, 1,
-1.852333, 1.268236, -1.586765, 1, 0.2117647, 0, 1,
-1.842614, -0.1410893, -2.518469, 1, 0.2156863, 0, 1,
-1.834561, -0.5908006, -0.7739987, 1, 0.2235294, 0, 1,
-1.818119, 1.2754, -1.648821, 1, 0.227451, 0, 1,
-1.795017, -0.0772984, -1.82041, 1, 0.2352941, 0, 1,
-1.781327, 0.211557, -3.768203, 1, 0.2392157, 0, 1,
-1.765861, 0.25368, -0.1995397, 1, 0.2470588, 0, 1,
-1.765378, 0.9427118, -1.698187, 1, 0.2509804, 0, 1,
-1.760339, -0.5316935, -2.673632, 1, 0.2588235, 0, 1,
-1.758401, -0.4791422, -0.7864364, 1, 0.2627451, 0, 1,
-1.734834, -0.4992175, -3.851454, 1, 0.2705882, 0, 1,
-1.725543, 1.563341, -0.9995741, 1, 0.2745098, 0, 1,
-1.715553, 1.24825, -0.8874086, 1, 0.282353, 0, 1,
-1.705874, 1.145914, -1.025968, 1, 0.2862745, 0, 1,
-1.694465, 0.3658483, -0.5773125, 1, 0.2941177, 0, 1,
-1.676224, -1.399873, -2.038427, 1, 0.3019608, 0, 1,
-1.666184, -1.125703, -2.294291, 1, 0.3058824, 0, 1,
-1.656911, 0.4680397, -2.054486, 1, 0.3137255, 0, 1,
-1.650061, 0.4766752, -2.30412, 1, 0.3176471, 0, 1,
-1.639952, -0.2452911, -1.440874, 1, 0.3254902, 0, 1,
-1.635252, -0.9592979, -2.938655, 1, 0.3294118, 0, 1,
-1.630526, 1.293598, -1.554881, 1, 0.3372549, 0, 1,
-1.615894, 0.74344, -1.78738, 1, 0.3411765, 0, 1,
-1.602314, -0.2808954, -2.616965, 1, 0.3490196, 0, 1,
-1.585021, 0.08088548, -2.793324, 1, 0.3529412, 0, 1,
-1.576046, 0.3389973, -1.109148, 1, 0.3607843, 0, 1,
-1.566208, 0.3336476, -1.658578, 1, 0.3647059, 0, 1,
-1.558253, -0.4764384, -1.549155, 1, 0.372549, 0, 1,
-1.548566, -0.1071575, -1.758877, 1, 0.3764706, 0, 1,
-1.498991, 0.728617, -0.2230184, 1, 0.3843137, 0, 1,
-1.484194, 1.33124, 0.1462638, 1, 0.3882353, 0, 1,
-1.470634, -1.263797, -2.058172, 1, 0.3960784, 0, 1,
-1.466871, -1.134416, -2.657983, 1, 0.4039216, 0, 1,
-1.463123, -0.5574337, -1.877522, 1, 0.4078431, 0, 1,
-1.457958, 0.2603655, -1.390106, 1, 0.4156863, 0, 1,
-1.448535, 0.2441406, -0.7502776, 1, 0.4196078, 0, 1,
-1.446591, -0.8989387, -1.423863, 1, 0.427451, 0, 1,
-1.443857, 1.79074, -2.973253, 1, 0.4313726, 0, 1,
-1.43893, 1.448128, -0.1649748, 1, 0.4392157, 0, 1,
-1.421661, 1.500483, 0.1938332, 1, 0.4431373, 0, 1,
-1.381811, -0.2193664, -2.925028, 1, 0.4509804, 0, 1,
-1.375497, -0.3636624, -5.364484, 1, 0.454902, 0, 1,
-1.370481, -1.132876, -1.115268, 1, 0.4627451, 0, 1,
-1.363464, 0.0337996, -0.8361557, 1, 0.4666667, 0, 1,
-1.361733, -2.545944, -2.966955, 1, 0.4745098, 0, 1,
-1.360073, -0.7764742, -3.411947, 1, 0.4784314, 0, 1,
-1.359206, 1.058109, -0.7703214, 1, 0.4862745, 0, 1,
-1.358503, 0.4603795, -0.6940119, 1, 0.4901961, 0, 1,
-1.347514, 0.7557998, -2.734471, 1, 0.4980392, 0, 1,
-1.345594, -2.133248, -4.398409, 1, 0.5058824, 0, 1,
-1.339167, -0.953213, -3.687882, 1, 0.509804, 0, 1,
-1.322863, 0.2403676, -2.476011, 1, 0.5176471, 0, 1,
-1.32266, 1.390798, 0.9071816, 1, 0.5215687, 0, 1,
-1.320803, 1.357298, -1.616131, 1, 0.5294118, 0, 1,
-1.319167, 0.3014466, -1.296069, 1, 0.5333334, 0, 1,
-1.317999, -0.0205685, -0.6643115, 1, 0.5411765, 0, 1,
-1.312365, 0.5516533, -0.744883, 1, 0.5450981, 0, 1,
-1.310558, -0.4833673, -3.868756, 1, 0.5529412, 0, 1,
-1.310459, 1.177243, -0.747471, 1, 0.5568628, 0, 1,
-1.305869, 0.4973954, -2.958216, 1, 0.5647059, 0, 1,
-1.300344, 0.4866279, 0.2494543, 1, 0.5686275, 0, 1,
-1.292118, -0.0268425, -1.00115, 1, 0.5764706, 0, 1,
-1.290919, -0.5218827, -1.070875, 1, 0.5803922, 0, 1,
-1.285094, -0.216461, -0.1981585, 1, 0.5882353, 0, 1,
-1.282739, 1.601822, -1.749219, 1, 0.5921569, 0, 1,
-1.282619, -0.2462171, -4.406903, 1, 0.6, 0, 1,
-1.276193, -0.1656711, -1.785053, 1, 0.6078432, 0, 1,
-1.272539, 1.595948, -2.78972, 1, 0.6117647, 0, 1,
-1.261252, 0.1045992, -1.577872, 1, 0.6196079, 0, 1,
-1.261122, -2.333837, -3.947637, 1, 0.6235294, 0, 1,
-1.25336, 0.3612278, -1.9075, 1, 0.6313726, 0, 1,
-1.252046, -0.8632552, -0.5504649, 1, 0.6352941, 0, 1,
-1.249677, 1.301229, -2.520245, 1, 0.6431373, 0, 1,
-1.249413, 1.12543, 0.6750937, 1, 0.6470588, 0, 1,
-1.247866, 0.03902563, -0.535129, 1, 0.654902, 0, 1,
-1.24639, 0.3345734, -1.341713, 1, 0.6588235, 0, 1,
-1.239405, -0.2196618, -0.7075256, 1, 0.6666667, 0, 1,
-1.235165, -0.03388297, -0.05972916, 1, 0.6705883, 0, 1,
-1.23366, 0.7901204, -2.140722, 1, 0.6784314, 0, 1,
-1.231382, 0.1199872, -0.3826277, 1, 0.682353, 0, 1,
-1.228953, -0.1092134, 1.902956, 1, 0.6901961, 0, 1,
-1.22216, 1.471295, 2.13369, 1, 0.6941177, 0, 1,
-1.217745, -0.03057965, 0.2270291, 1, 0.7019608, 0, 1,
-1.209065, 0.08448315, 0.02009038, 1, 0.7098039, 0, 1,
-1.20559, -1.68882, -2.240919, 1, 0.7137255, 0, 1,
-1.198564, -0.2598535, -1.205342, 1, 0.7215686, 0, 1,
-1.195994, 0.363529, -0.1283399, 1, 0.7254902, 0, 1,
-1.195226, 0.05029838, -2.003507, 1, 0.7333333, 0, 1,
-1.187679, -1.04023, -1.053735, 1, 0.7372549, 0, 1,
-1.184682, -0.7022568, -1.250905, 1, 0.7450981, 0, 1,
-1.183923, -0.6127959, -3.822192, 1, 0.7490196, 0, 1,
-1.181818, -0.4463304, -1.531279, 1, 0.7568628, 0, 1,
-1.173751, -1.893621, -2.677255, 1, 0.7607843, 0, 1,
-1.172179, 0.3685296, -1.806282, 1, 0.7686275, 0, 1,
-1.166958, -0.9399133, -0.37933, 1, 0.772549, 0, 1,
-1.163388, -1.279432, -0.6216153, 1, 0.7803922, 0, 1,
-1.162789, -1.677166, -0.5576297, 1, 0.7843137, 0, 1,
-1.161781, -0.3981709, -1.540958, 1, 0.7921569, 0, 1,
-1.155292, 0.2081395, -0.955848, 1, 0.7960784, 0, 1,
-1.143159, 0.65942, -1.143175, 1, 0.8039216, 0, 1,
-1.142231, -0.5104898, -1.284567, 1, 0.8117647, 0, 1,
-1.139567, 1.154918, -1.029058, 1, 0.8156863, 0, 1,
-1.135233, 0.2239148, 0.8795782, 1, 0.8235294, 0, 1,
-1.129141, -0.492241, -1.902255, 1, 0.827451, 0, 1,
-1.122307, 1.045331, -1.228471, 1, 0.8352941, 0, 1,
-1.111253, 1.549845, -0.5182075, 1, 0.8392157, 0, 1,
-1.109984, -2.12901, -1.734414, 1, 0.8470588, 0, 1,
-1.107412, -1.172439, -3.23049, 1, 0.8509804, 0, 1,
-1.105449, -0.7389974, -2.935293, 1, 0.8588235, 0, 1,
-1.101866, -0.1300399, -2.19293, 1, 0.8627451, 0, 1,
-1.097283, 1.466777, -0.3447514, 1, 0.8705882, 0, 1,
-1.096885, 0.8962411, 0.4991773, 1, 0.8745098, 0, 1,
-1.092257, 0.4278068, -0.3856201, 1, 0.8823529, 0, 1,
-1.085331, -1.0156, -1.332091, 1, 0.8862745, 0, 1,
-1.080071, -0.8647045, -2.982754, 1, 0.8941177, 0, 1,
-1.074688, -1.812893, -1.216704, 1, 0.8980392, 0, 1,
-1.073552, -1.70578, -3.914871, 1, 0.9058824, 0, 1,
-1.069835, -2.168277, -2.774391, 1, 0.9137255, 0, 1,
-1.067564, 1.803229, 0.03272614, 1, 0.9176471, 0, 1,
-1.064968, 0.7729223, -0.3603748, 1, 0.9254902, 0, 1,
-1.064488, -0.7109613, -1.050395, 1, 0.9294118, 0, 1,
-1.062768, -0.2624616, -2.083625, 1, 0.9372549, 0, 1,
-1.053988, -0.6806355, -1.732597, 1, 0.9411765, 0, 1,
-1.050601, 1.953985, -0.8737721, 1, 0.9490196, 0, 1,
-1.04641, 0.7582083, -0.7334631, 1, 0.9529412, 0, 1,
-1.037975, 0.2158049, -4.075157, 1, 0.9607843, 0, 1,
-1.037489, 1.117726, -0.5402166, 1, 0.9647059, 0, 1,
-1.036106, 0.643256, -0.8415344, 1, 0.972549, 0, 1,
-1.026589, 0.4264743, -1.219763, 1, 0.9764706, 0, 1,
-1.025046, -2.01782, -4.96897, 1, 0.9843137, 0, 1,
-1.021327, -0.4438041, -3.274611, 1, 0.9882353, 0, 1,
-1.01322, 0.4057822, -2.317208, 1, 0.9960784, 0, 1,
-1.005313, 0.4845129, -0.3268368, 0.9960784, 1, 0, 1,
-1.003497, 0.3119159, -1.918449, 0.9921569, 1, 0, 1,
-1.001899, 0.3626646, -1.905822, 0.9843137, 1, 0, 1,
-1.001613, -0.256855, -1.948843, 0.9803922, 1, 0, 1,
-1.000932, -0.4210185, -3.066728, 0.972549, 1, 0, 1,
-1.000154, -0.03597983, -3.083953, 0.9686275, 1, 0, 1,
-0.9984128, 0.5700117, -3.36157, 0.9607843, 1, 0, 1,
-0.9983389, -0.03161298, -0.6406657, 0.9568627, 1, 0, 1,
-0.992285, -0.1491453, -2.135898, 0.9490196, 1, 0, 1,
-0.9896271, 0.2091267, -2.642559, 0.945098, 1, 0, 1,
-0.9895925, -1.448619, -2.778831, 0.9372549, 1, 0, 1,
-0.9893144, -0.3246465, -0.06629119, 0.9333333, 1, 0, 1,
-0.985692, 0.5871314, 2.252358, 0.9254902, 1, 0, 1,
-0.9856148, -1.656934, -1.047386, 0.9215686, 1, 0, 1,
-0.9850475, -0.3186241, -1.306004, 0.9137255, 1, 0, 1,
-0.981366, -0.03594952, -1.65173, 0.9098039, 1, 0, 1,
-0.979425, 0.8654737, 0.451851, 0.9019608, 1, 0, 1,
-0.9790859, -0.1527881, -0.3266031, 0.8941177, 1, 0, 1,
-0.9775162, -1.492319, -2.500072, 0.8901961, 1, 0, 1,
-0.9758886, 0.5509881, -0.4062361, 0.8823529, 1, 0, 1,
-0.9742814, -0.5758607, -1.589142, 0.8784314, 1, 0, 1,
-0.971611, 0.2585585, 0.306535, 0.8705882, 1, 0, 1,
-0.9714703, 0.3783666, -2.996171, 0.8666667, 1, 0, 1,
-0.9649017, 2.298119, -2.02894, 0.8588235, 1, 0, 1,
-0.964766, 0.472701, 1.219643, 0.854902, 1, 0, 1,
-0.961679, -0.1976204, -1.858529, 0.8470588, 1, 0, 1,
-0.9604083, -0.549022, -1.938877, 0.8431373, 1, 0, 1,
-0.9603029, -0.9926826, -4.769751, 0.8352941, 1, 0, 1,
-0.955475, 0.3020337, -0.5489185, 0.8313726, 1, 0, 1,
-0.9503199, -1.076258, -3.825613, 0.8235294, 1, 0, 1,
-0.9470373, -0.1958549, -2.764909, 0.8196079, 1, 0, 1,
-0.9421658, 0.1866617, 0.3091832, 0.8117647, 1, 0, 1,
-0.9319258, 0.4216927, -0.8865428, 0.8078431, 1, 0, 1,
-0.9239256, -0.5788816, -2.231004, 0.8, 1, 0, 1,
-0.9226493, 1.532794, -0.1818075, 0.7921569, 1, 0, 1,
-0.9220879, 2.457277, -0.3283838, 0.7882353, 1, 0, 1,
-0.9193917, 0.01581673, -0.9325949, 0.7803922, 1, 0, 1,
-0.9062579, -0.6655354, -1.891323, 0.7764706, 1, 0, 1,
-0.9052365, 0.08712862, -2.281074, 0.7686275, 1, 0, 1,
-0.904686, -1.238256, -2.888032, 0.7647059, 1, 0, 1,
-0.8920686, -0.9396011, -2.10862, 0.7568628, 1, 0, 1,
-0.8906716, -0.3760845, -0.1878558, 0.7529412, 1, 0, 1,
-0.8866628, 0.5373163, -1.659191, 0.7450981, 1, 0, 1,
-0.8858353, 1.645087, 1.416954, 0.7411765, 1, 0, 1,
-0.8793547, 0.3776847, -1.746695, 0.7333333, 1, 0, 1,
-0.8770416, -1.690459, -0.908232, 0.7294118, 1, 0, 1,
-0.8768176, 0.6907679, 0.1574543, 0.7215686, 1, 0, 1,
-0.8739531, 0.6163355, -1.597196, 0.7176471, 1, 0, 1,
-0.8673551, 1.138038, -0.9103453, 0.7098039, 1, 0, 1,
-0.8597084, -0.6774174, -2.771757, 0.7058824, 1, 0, 1,
-0.8540464, 1.510169, -1.011746, 0.6980392, 1, 0, 1,
-0.8484049, -0.741115, -2.348371, 0.6901961, 1, 0, 1,
-0.8467703, 1.295771, -0.3727057, 0.6862745, 1, 0, 1,
-0.8462632, 0.3735895, -0.8571668, 0.6784314, 1, 0, 1,
-0.8450395, -0.970947, -1.137326, 0.6745098, 1, 0, 1,
-0.8449928, 0.7565431, 1.215082, 0.6666667, 1, 0, 1,
-0.8397588, 0.4818635, -0.04627477, 0.6627451, 1, 0, 1,
-0.8372542, -0.1958796, -2.122405, 0.654902, 1, 0, 1,
-0.8256393, 0.1395192, -2.267751, 0.6509804, 1, 0, 1,
-0.822041, 0.7587666, 0.2460252, 0.6431373, 1, 0, 1,
-0.8132131, -0.7389816, -1.761234, 0.6392157, 1, 0, 1,
-0.8093258, 0.1098727, -0.05289005, 0.6313726, 1, 0, 1,
-0.8058025, -0.7280315, -1.861686, 0.627451, 1, 0, 1,
-0.8052071, 0.7269643, 0.7349635, 0.6196079, 1, 0, 1,
-0.8049015, 0.6315649, -1.33398, 0.6156863, 1, 0, 1,
-0.8015959, 0.6784888, -1.667329, 0.6078432, 1, 0, 1,
-0.8009133, -0.3021003, -1.089532, 0.6039216, 1, 0, 1,
-0.8004744, 1.891279, -0.1954678, 0.5960785, 1, 0, 1,
-0.7973651, 0.6402239, -0.342456, 0.5882353, 1, 0, 1,
-0.7966882, 0.4585005, -0.9679253, 0.5843138, 1, 0, 1,
-0.7949389, 0.2774057, -0.9683981, 0.5764706, 1, 0, 1,
-0.7935387, -0.8091379, -2.767484, 0.572549, 1, 0, 1,
-0.7928379, 1.21273, -0.677286, 0.5647059, 1, 0, 1,
-0.7917005, -0.5564017, -2.679637, 0.5607843, 1, 0, 1,
-0.7888991, -0.1897759, -1.288636, 0.5529412, 1, 0, 1,
-0.7856711, -0.00319648, -1.775959, 0.5490196, 1, 0, 1,
-0.7801265, 0.9990135, -0.09161004, 0.5411765, 1, 0, 1,
-0.7793222, 0.167502, 0.2783976, 0.5372549, 1, 0, 1,
-0.7780748, -0.1449514, -1.758741, 0.5294118, 1, 0, 1,
-0.7743026, -0.4210216, -2.571309, 0.5254902, 1, 0, 1,
-0.7665994, 1.335224, -0.6652625, 0.5176471, 1, 0, 1,
-0.7585499, -1.667413, -2.466186, 0.5137255, 1, 0, 1,
-0.7530324, -0.03823867, -2.117536, 0.5058824, 1, 0, 1,
-0.7529845, 0.7161981, -0.9688494, 0.5019608, 1, 0, 1,
-0.7478566, 0.2767604, 0.4669705, 0.4941176, 1, 0, 1,
-0.740267, -0.790924, -2.895773, 0.4862745, 1, 0, 1,
-0.7372299, -0.6857934, -0.3736309, 0.4823529, 1, 0, 1,
-0.7354686, -0.2014757, -0.4591618, 0.4745098, 1, 0, 1,
-0.7326375, -1.137241, -2.0851, 0.4705882, 1, 0, 1,
-0.7325959, -0.52681, -1.87592, 0.4627451, 1, 0, 1,
-0.7310374, -1.874864, -3.723584, 0.4588235, 1, 0, 1,
-0.7259861, 1.224632, 1.313357, 0.4509804, 1, 0, 1,
-0.7222596, -0.8373057, -2.751518, 0.4470588, 1, 0, 1,
-0.7193114, -0.6096828, -1.948498, 0.4392157, 1, 0, 1,
-0.7183182, -0.4122096, -1.612957, 0.4352941, 1, 0, 1,
-0.7157854, -0.3940944, -4.529315, 0.427451, 1, 0, 1,
-0.713632, -0.2120082, -1.568553, 0.4235294, 1, 0, 1,
-0.7122135, 0.6802158, -0.7120873, 0.4156863, 1, 0, 1,
-0.7043122, -0.2929834, -2.910741, 0.4117647, 1, 0, 1,
-0.7019463, -0.7926213, -1.666459, 0.4039216, 1, 0, 1,
-0.7012258, -0.3592029, -2.021491, 0.3960784, 1, 0, 1,
-0.6881399, -1.314412, -4.149109, 0.3921569, 1, 0, 1,
-0.6847088, -0.1495479, -3.746676, 0.3843137, 1, 0, 1,
-0.6773615, -0.1854218, -1.237745, 0.3803922, 1, 0, 1,
-0.6764246, 0.2654955, -1.438982, 0.372549, 1, 0, 1,
-0.6753016, -0.2345974, -2.688559, 0.3686275, 1, 0, 1,
-0.6749984, 0.3816452, 0.1460908, 0.3607843, 1, 0, 1,
-0.6633024, 0.0631085, -1.160653, 0.3568628, 1, 0, 1,
-0.6579303, 0.1934304, -2.464657, 0.3490196, 1, 0, 1,
-0.6568998, -0.4649611, -0.1886284, 0.345098, 1, 0, 1,
-0.6463466, -0.1385567, -2.166464, 0.3372549, 1, 0, 1,
-0.641112, 1.835228, -1.153115, 0.3333333, 1, 0, 1,
-0.6403571, 2.112349, -0.8724873, 0.3254902, 1, 0, 1,
-0.6379505, -1.732841, -4.41206, 0.3215686, 1, 0, 1,
-0.6302822, 0.07201203, 0.3124325, 0.3137255, 1, 0, 1,
-0.6263797, -0.4567232, -1.293621, 0.3098039, 1, 0, 1,
-0.6241131, 0.03425207, -2.014579, 0.3019608, 1, 0, 1,
-0.6092045, 0.2380686, -1.300909, 0.2941177, 1, 0, 1,
-0.6087937, 0.9051404, -1.687273, 0.2901961, 1, 0, 1,
-0.6062848, -0.5930023, -2.944113, 0.282353, 1, 0, 1,
-0.605715, -0.7847429, -1.566109, 0.2784314, 1, 0, 1,
-0.6046356, 1.150411, 0.6204692, 0.2705882, 1, 0, 1,
-0.5977818, -1.071093, -1.781636, 0.2666667, 1, 0, 1,
-0.5940282, 0.2065662, -1.1962, 0.2588235, 1, 0, 1,
-0.5931834, 0.2446771, -1.824564, 0.254902, 1, 0, 1,
-0.5873531, -0.225522, -3.382037, 0.2470588, 1, 0, 1,
-0.5866341, -0.6510827, -2.94191, 0.2431373, 1, 0, 1,
-0.5859838, 0.08266946, -1.361208, 0.2352941, 1, 0, 1,
-0.5857655, 0.3733636, -1.690961, 0.2313726, 1, 0, 1,
-0.5815635, -0.43724, -2.603151, 0.2235294, 1, 0, 1,
-0.5809443, 1.040388, -1.837217, 0.2196078, 1, 0, 1,
-0.5758294, 0.2033483, -1.153734, 0.2117647, 1, 0, 1,
-0.5722779, -0.3583786, -1.522408, 0.2078431, 1, 0, 1,
-0.5713403, -0.405441, -1.566719, 0.2, 1, 0, 1,
-0.5680608, 0.5205063, 0.6474819, 0.1921569, 1, 0, 1,
-0.5666024, -0.09954578, -4.2138, 0.1882353, 1, 0, 1,
-0.5665464, -0.9824703, -0.436513, 0.1803922, 1, 0, 1,
-0.5613837, 0.1391109, -1.846548, 0.1764706, 1, 0, 1,
-0.5592943, -1.588595, -3.835004, 0.1686275, 1, 0, 1,
-0.5543538, 0.9730217, -1.044223, 0.1647059, 1, 0, 1,
-0.550777, 1.304156, 2.292611, 0.1568628, 1, 0, 1,
-0.549788, 1.135509, -2.42711, 0.1529412, 1, 0, 1,
-0.5496503, 1.166465, 1.182608, 0.145098, 1, 0, 1,
-0.5463942, 1.754237, 0.7460636, 0.1411765, 1, 0, 1,
-0.5389691, 0.2867777, -0.3846589, 0.1333333, 1, 0, 1,
-0.5373544, -0.5720521, -1.335212, 0.1294118, 1, 0, 1,
-0.5371448, 1.274929, 2.604132, 0.1215686, 1, 0, 1,
-0.537083, 0.9558451, 1.053264, 0.1176471, 1, 0, 1,
-0.5366393, 1.370797, -0.371151, 0.1098039, 1, 0, 1,
-0.5361571, -0.5115726, -3.490888, 0.1058824, 1, 0, 1,
-0.536033, -0.4331826, -1.815429, 0.09803922, 1, 0, 1,
-0.5353777, -1.221371, -3.887011, 0.09019608, 1, 0, 1,
-0.5342826, -0.8338677, -2.699486, 0.08627451, 1, 0, 1,
-0.5339754, -0.1849799, -3.380497, 0.07843138, 1, 0, 1,
-0.5280636, 0.8604265, -0.2784991, 0.07450981, 1, 0, 1,
-0.5205513, -0.1622805, -2.403413, 0.06666667, 1, 0, 1,
-0.5173264, 0.8103226, -0.1739471, 0.0627451, 1, 0, 1,
-0.5170438, 0.2005413, -2.031829, 0.05490196, 1, 0, 1,
-0.512616, -0.3847225, -3.810455, 0.05098039, 1, 0, 1,
-0.5125205, -0.7520255, -1.00555, 0.04313726, 1, 0, 1,
-0.5121561, -0.8246837, -1.374979, 0.03921569, 1, 0, 1,
-0.5033625, 0.04928389, -1.201882, 0.03137255, 1, 0, 1,
-0.4976218, -0.9939732, -2.382706, 0.02745098, 1, 0, 1,
-0.4948226, 0.5640784, -0.6607591, 0.01960784, 1, 0, 1,
-0.4924366, 0.5806506, 0.3214373, 0.01568628, 1, 0, 1,
-0.4923936, 1.459245, 0.3461994, 0.007843138, 1, 0, 1,
-0.4898948, 1.321411, -1.717472, 0.003921569, 1, 0, 1,
-0.48751, 0.1856959, -1.909011, 0, 1, 0.003921569, 1,
-0.4840291, 1.390081, 0.09524422, 0, 1, 0.01176471, 1,
-0.4832593, -1.133474, -2.713455, 0, 1, 0.01568628, 1,
-0.4737931, 1.376673, -0.07953452, 0, 1, 0.02352941, 1,
-0.4694929, 1.338084, -1.064501, 0, 1, 0.02745098, 1,
-0.4690469, -0.3859038, -2.637568, 0, 1, 0.03529412, 1,
-0.4670444, -0.9654381, -1.744972, 0, 1, 0.03921569, 1,
-0.4651425, -0.6981995, -2.911808, 0, 1, 0.04705882, 1,
-0.4626128, 0.4351051, 0.01389793, 0, 1, 0.05098039, 1,
-0.4553929, -0.7292811, -4.360236, 0, 1, 0.05882353, 1,
-0.4534471, 0.547208, 0.1079712, 0, 1, 0.0627451, 1,
-0.4526296, 0.5291526, -0.526332, 0, 1, 0.07058824, 1,
-0.4461026, 0.5894681, -0.1313688, 0, 1, 0.07450981, 1,
-0.4429219, -0.184577, -1.597686, 0, 1, 0.08235294, 1,
-0.4392822, 0.7382811, 0.355735, 0, 1, 0.08627451, 1,
-0.4366928, 0.2363363, -2.026077, 0, 1, 0.09411765, 1,
-0.4334385, 0.9310457, -0.7210394, 0, 1, 0.1019608, 1,
-0.4304886, 0.7887267, -1.408824, 0, 1, 0.1058824, 1,
-0.4300366, 0.7930396, -1.141695, 0, 1, 0.1137255, 1,
-0.4277156, -0.329042, -2.618896, 0, 1, 0.1176471, 1,
-0.4232648, 2.152266, 0.2641088, 0, 1, 0.1254902, 1,
-0.4199112, -1.22162, -3.413031, 0, 1, 0.1294118, 1,
-0.4170666, -0.04005553, -2.413136, 0, 1, 0.1372549, 1,
-0.4112583, 0.7666146, -0.9391538, 0, 1, 0.1411765, 1,
-0.4101029, 1.287995, -1.989536, 0, 1, 0.1490196, 1,
-0.4094616, 1.327012, -0.6418679, 0, 1, 0.1529412, 1,
-0.4092117, 1.193909, -1.441513, 0, 1, 0.1607843, 1,
-0.4060583, 0.7935937, 0.3751981, 0, 1, 0.1647059, 1,
-0.4026253, -0.2967957, -2.039575, 0, 1, 0.172549, 1,
-0.3990533, -0.5984344, -0.6621941, 0, 1, 0.1764706, 1,
-0.3980261, -1.676818, -2.508827, 0, 1, 0.1843137, 1,
-0.3966353, 0.5176969, -0.3619976, 0, 1, 0.1882353, 1,
-0.3962753, -0.8728233, -1.209145, 0, 1, 0.1960784, 1,
-0.3955451, 1.388494, -2.218582, 0, 1, 0.2039216, 1,
-0.3863913, 0.2246774, -1.368059, 0, 1, 0.2078431, 1,
-0.3863746, 1.326745, 0.6027681, 0, 1, 0.2156863, 1,
-0.375349, 0.3729773, -0.5298811, 0, 1, 0.2196078, 1,
-0.3707932, 0.1369336, -1.203276, 0, 1, 0.227451, 1,
-0.3698678, 0.2122212, -2.100523, 0, 1, 0.2313726, 1,
-0.3677159, -1.648324, -1.551904, 0, 1, 0.2392157, 1,
-0.3676035, -0.500826, -2.825973, 0, 1, 0.2431373, 1,
-0.3674964, 0.02680496, 0.2085258, 0, 1, 0.2509804, 1,
-0.3653582, -1.34321, -2.490806, 0, 1, 0.254902, 1,
-0.3650867, 0.5947565, -0.2657968, 0, 1, 0.2627451, 1,
-0.3628163, -0.2482961, -3.632094, 0, 1, 0.2666667, 1,
-0.3627687, -0.07783962, -0.4651874, 0, 1, 0.2745098, 1,
-0.3592114, 1.589674, 0.2334194, 0, 1, 0.2784314, 1,
-0.3526191, -0.2996006, -1.325319, 0, 1, 0.2862745, 1,
-0.3485954, -1.193556, -2.370392, 0, 1, 0.2901961, 1,
-0.3463268, -0.6028756, -2.487064, 0, 1, 0.2980392, 1,
-0.3443828, 0.2396981, -1.103295, 0, 1, 0.3058824, 1,
-0.3387972, 1.228301, 0.5033273, 0, 1, 0.3098039, 1,
-0.3385637, 1.413786, 1.366464, 0, 1, 0.3176471, 1,
-0.3381414, -1.073678, -3.535427, 0, 1, 0.3215686, 1,
-0.3362071, 1.233343, 1.443151, 0, 1, 0.3294118, 1,
-0.3337922, 0.8071935, -0.8229072, 0, 1, 0.3333333, 1,
-0.3322136, 0.04659231, -0.9955516, 0, 1, 0.3411765, 1,
-0.3320503, -1.071481, -1.960259, 0, 1, 0.345098, 1,
-0.3310867, -0.2364203, -2.446884, 0, 1, 0.3529412, 1,
-0.3293171, 1.08352, 0.2022857, 0, 1, 0.3568628, 1,
-0.3291537, 0.9090431, -0.4495056, 0, 1, 0.3647059, 1,
-0.3290718, -1.353177, -1.757591, 0, 1, 0.3686275, 1,
-0.3206495, -0.7307325, -4.374005, 0, 1, 0.3764706, 1,
-0.3185768, -1.525692, -2.51655, 0, 1, 0.3803922, 1,
-0.3120587, 0.03586774, -4.240183, 0, 1, 0.3882353, 1,
-0.3084259, 1.137177, -0.01431832, 0, 1, 0.3921569, 1,
-0.3054043, -1.1312, -2.070188, 0, 1, 0.4, 1,
-0.3035923, 0.08247844, -0.3153442, 0, 1, 0.4078431, 1,
-0.3031457, 1.010495, -0.6192911, 0, 1, 0.4117647, 1,
-0.2978741, 0.9293619, -2.044661, 0, 1, 0.4196078, 1,
-0.2957623, -0.226875, -3.581242, 0, 1, 0.4235294, 1,
-0.2941926, -0.1183819, -0.1568165, 0, 1, 0.4313726, 1,
-0.2930836, 0.1658131, 0.417483, 0, 1, 0.4352941, 1,
-0.2921948, 0.5037001, -0.394137, 0, 1, 0.4431373, 1,
-0.2912775, 0.1875295, -1.180138, 0, 1, 0.4470588, 1,
-0.2904128, -0.5842804, -3.863451, 0, 1, 0.454902, 1,
-0.2823118, -0.1303346, -2.85295, 0, 1, 0.4588235, 1,
-0.2779964, -1.225621, -1.454494, 0, 1, 0.4666667, 1,
-0.2777846, -0.07671656, -2.155389, 0, 1, 0.4705882, 1,
-0.2758549, 1.043502, -0.7253703, 0, 1, 0.4784314, 1,
-0.2750471, -0.932557, -2.88976, 0, 1, 0.4823529, 1,
-0.271339, -1.33604, -3.837217, 0, 1, 0.4901961, 1,
-0.2704692, 0.7147203, 0.8741124, 0, 1, 0.4941176, 1,
-0.2693574, 0.7009063, 0.9058051, 0, 1, 0.5019608, 1,
-0.2692323, -0.2045601, -2.164556, 0, 1, 0.509804, 1,
-0.2689301, 0.8065081, 0.1222606, 0, 1, 0.5137255, 1,
-0.2682967, -2.336671, -3.212657, 0, 1, 0.5215687, 1,
-0.2666305, -0.1472969, -2.583061, 0, 1, 0.5254902, 1,
-0.2649184, -1.014262, -2.968846, 0, 1, 0.5333334, 1,
-0.2605867, 0.1192836, -2.324265, 0, 1, 0.5372549, 1,
-0.259434, -1.021734, -3.691739, 0, 1, 0.5450981, 1,
-0.2591822, 0.9565602, -0.4096105, 0, 1, 0.5490196, 1,
-0.2559803, 1.408901, 0.6314739, 0, 1, 0.5568628, 1,
-0.2553525, 0.8650657, -0.8319512, 0, 1, 0.5607843, 1,
-0.2551301, 0.9747998, -0.2963567, 0, 1, 0.5686275, 1,
-0.250338, -1.331059, -2.875233, 0, 1, 0.572549, 1,
-0.2460789, 1.084312, -2.23434, 0, 1, 0.5803922, 1,
-0.2441845, -1.343636, -2.202637, 0, 1, 0.5843138, 1,
-0.2430962, -0.2732041, -3.212298, 0, 1, 0.5921569, 1,
-0.2374039, -0.6062512, -3.656067, 0, 1, 0.5960785, 1,
-0.2364559, -0.1578882, -2.042712, 0, 1, 0.6039216, 1,
-0.2342325, 0.9265165, -0.6741982, 0, 1, 0.6117647, 1,
-0.2226006, -2.114056, -3.672319, 0, 1, 0.6156863, 1,
-0.2222625, 1.887141, -1.157096, 0, 1, 0.6235294, 1,
-0.2191654, 0.7151961, -0.9171987, 0, 1, 0.627451, 1,
-0.2160257, -0.1298656, -4.012952, 0, 1, 0.6352941, 1,
-0.2137599, 0.9390047, -0.5017707, 0, 1, 0.6392157, 1,
-0.208117, 0.06465684, -1.849783, 0, 1, 0.6470588, 1,
-0.2078587, -0.603572, -2.788924, 0, 1, 0.6509804, 1,
-0.2049134, 1.841992, 1.485011, 0, 1, 0.6588235, 1,
-0.1982364, -0.08815975, -0.6112453, 0, 1, 0.6627451, 1,
-0.198072, -0.7458042, -2.354092, 0, 1, 0.6705883, 1,
-0.1966844, 1.138509, -0.2157421, 0, 1, 0.6745098, 1,
-0.1960958, -0.2037664, -2.801809, 0, 1, 0.682353, 1,
-0.1952961, -1.508548, -2.882736, 0, 1, 0.6862745, 1,
-0.1938124, -1.112602, -3.524258, 0, 1, 0.6941177, 1,
-0.188485, -0.7753341, -2.498547, 0, 1, 0.7019608, 1,
-0.1875647, 1.024755, -0.5327668, 0, 1, 0.7058824, 1,
-0.1874442, 0.4548313, -0.9523751, 0, 1, 0.7137255, 1,
-0.186478, 0.8290645, 0.5430297, 0, 1, 0.7176471, 1,
-0.1830131, -2.092603, -4.358418, 0, 1, 0.7254902, 1,
-0.1823088, -0.08325766, -0.5537193, 0, 1, 0.7294118, 1,
-0.1803175, -3.061183, -1.466671, 0, 1, 0.7372549, 1,
-0.176143, 1.528821, 0.1504502, 0, 1, 0.7411765, 1,
-0.1754897, 0.2770989, -1.534594, 0, 1, 0.7490196, 1,
-0.1752715, 1.50855, -0.1303712, 0, 1, 0.7529412, 1,
-0.1723996, 0.9495559, 2.048408, 0, 1, 0.7607843, 1,
-0.1718137, -1.428583, -2.113337, 0, 1, 0.7647059, 1,
-0.1630547, 0.6289443, -1.377321, 0, 1, 0.772549, 1,
-0.1589789, -1.224352, -2.449413, 0, 1, 0.7764706, 1,
-0.1583389, 1.2196, -0.07397613, 0, 1, 0.7843137, 1,
-0.1582552, -0.5297025, -2.533864, 0, 1, 0.7882353, 1,
-0.1575184, 0.8945604, 0.2772715, 0, 1, 0.7960784, 1,
-0.1525645, 0.08512037, -1.594026, 0, 1, 0.8039216, 1,
-0.152557, -0.3563894, -3.487827, 0, 1, 0.8078431, 1,
-0.1510098, 0.2670644, -0.4927353, 0, 1, 0.8156863, 1,
-0.1479075, -0.6783265, -2.442969, 0, 1, 0.8196079, 1,
-0.1464011, -0.3235715, -2.644905, 0, 1, 0.827451, 1,
-0.1445067, -1.533996, -2.966057, 0, 1, 0.8313726, 1,
-0.1443548, -1.636165, -3.872358, 0, 1, 0.8392157, 1,
-0.1436399, -2.007894, -3.260875, 0, 1, 0.8431373, 1,
-0.1331918, 0.8131519, -0.1861457, 0, 1, 0.8509804, 1,
-0.1329634, -0.1931693, -3.916582, 0, 1, 0.854902, 1,
-0.1326651, 0.1764137, 0.9990433, 0, 1, 0.8627451, 1,
-0.1294939, 0.4099482, -0.2039046, 0, 1, 0.8666667, 1,
-0.1255641, 0.09686594, 0.8644969, 0, 1, 0.8745098, 1,
-0.1236658, 1.476918, 0.2712876, 0, 1, 0.8784314, 1,
-0.1126593, -0.3425518, -1.353602, 0, 1, 0.8862745, 1,
-0.1104971, -0.9175859, -4.185146, 0, 1, 0.8901961, 1,
-0.1090146, 1.074677, -0.2894713, 0, 1, 0.8980392, 1,
-0.1080163, 1.482378, 1.690961, 0, 1, 0.9058824, 1,
-0.1053052, -1.510453, -4.038527, 0, 1, 0.9098039, 1,
-0.1051145, -0.671758, -2.380122, 0, 1, 0.9176471, 1,
-0.1035376, -0.6317229, -1.100974, 0, 1, 0.9215686, 1,
-0.103348, -0.5487317, -2.054725, 0, 1, 0.9294118, 1,
-0.1027547, 1.403934, 1.131389, 0, 1, 0.9333333, 1,
-0.09797607, 0.7724856, 0.07669814, 0, 1, 0.9411765, 1,
-0.09547541, -1.114434, -4.464734, 0, 1, 0.945098, 1,
-0.09143118, 1.09431, 0.9356106, 0, 1, 0.9529412, 1,
-0.08940692, -0.1820549, -3.32708, 0, 1, 0.9568627, 1,
-0.08038876, 0.9365065, -0.6513388, 0, 1, 0.9647059, 1,
-0.07589006, 0.3705311, -0.3697487, 0, 1, 0.9686275, 1,
-0.06733346, -0.5366312, -2.360504, 0, 1, 0.9764706, 1,
-0.06695367, 0.08629827, -1.567536, 0, 1, 0.9803922, 1,
-0.06367328, -0.302981, -3.158836, 0, 1, 0.9882353, 1,
-0.06333071, 1.127956, -0.6297193, 0, 1, 0.9921569, 1,
-0.06190149, 0.2081876, 0.5576512, 0, 1, 1, 1,
-0.06136432, 1.4167, 1.498569, 0, 0.9921569, 1, 1,
-0.05970532, 0.9984176, -0.2567562, 0, 0.9882353, 1, 1,
-0.05547659, 0.7686853, -0.3670732, 0, 0.9803922, 1, 1,
-0.05444893, -0.6830271, -1.116798, 0, 0.9764706, 1, 1,
-0.05262644, -0.0617156, -2.732097, 0, 0.9686275, 1, 1,
-0.05246468, 0.4945717, -0.3759794, 0, 0.9647059, 1, 1,
-0.04811167, -0.1619841, -2.091999, 0, 0.9568627, 1, 1,
-0.04678961, 1.815519, -0.5817924, 0, 0.9529412, 1, 1,
-0.04419643, -0.9232948, -3.279631, 0, 0.945098, 1, 1,
-0.04190495, 0.9555516, -1.139442, 0, 0.9411765, 1, 1,
-0.04076904, -0.9478512, -3.919352, 0, 0.9333333, 1, 1,
-0.03932144, 0.8709424, -1.041042, 0, 0.9294118, 1, 1,
-0.03166391, -0.8592032, -2.82802, 0, 0.9215686, 1, 1,
-0.03056498, -0.9618407, -4.346821, 0, 0.9176471, 1, 1,
-0.02745488, 1.842236, 0.001407161, 0, 0.9098039, 1, 1,
-0.02292529, 0.9653385, 0.1046185, 0, 0.9058824, 1, 1,
-0.02196541, -0.6470268, -2.347698, 0, 0.8980392, 1, 1,
-0.02093452, -1.287627, -4.486178, 0, 0.8901961, 1, 1,
-0.02043212, 0.3677245, -0.2251274, 0, 0.8862745, 1, 1,
-0.01722091, -0.6327553, -2.297131, 0, 0.8784314, 1, 1,
-0.01585792, -2.296864, -3.69137, 0, 0.8745098, 1, 1,
-0.01292138, 1.232627, 0.2978415, 0, 0.8666667, 1, 1,
-0.01220788, -1.164831, -2.74682, 0, 0.8627451, 1, 1,
-0.01061691, -0.8663814, -3.18209, 0, 0.854902, 1, 1,
-0.009006793, -0.276612, -3.540776, 0, 0.8509804, 1, 1,
-0.008938515, -0.6686518, -3.713996, 0, 0.8431373, 1, 1,
-0.00188747, 0.1527116, -0.1514386, 0, 0.8392157, 1, 1,
5.752617e-05, -1.746246, 2.312901, 0, 0.8313726, 1, 1,
0.007839398, -0.3448019, 3.845326, 0, 0.827451, 1, 1,
0.008366302, -0.5583502, 4.109792, 0, 0.8196079, 1, 1,
0.01069961, 0.6288688, -0.04335408, 0, 0.8156863, 1, 1,
0.01795908, -1.16578, 4.576532, 0, 0.8078431, 1, 1,
0.02230316, 0.695243, 1.181602, 0, 0.8039216, 1, 1,
0.03220768, -0.5801961, 3.492852, 0, 0.7960784, 1, 1,
0.03316629, 0.08013099, 1.040207, 0, 0.7882353, 1, 1,
0.03727457, 0.6412726, 0.636772, 0, 0.7843137, 1, 1,
0.04013535, -1.088842, 2.682624, 0, 0.7764706, 1, 1,
0.04408603, -0.2848055, 2.796824, 0, 0.772549, 1, 1,
0.05047607, -0.1369479, 1.377303, 0, 0.7647059, 1, 1,
0.05234641, -0.7289299, 1.930503, 0, 0.7607843, 1, 1,
0.05280766, 0.6047238, 0.3776091, 0, 0.7529412, 1, 1,
0.0605063, -1.288896, 4.177431, 0, 0.7490196, 1, 1,
0.061049, 0.4612036, -0.768831, 0, 0.7411765, 1, 1,
0.06504153, -0.03912444, 2.239216, 0, 0.7372549, 1, 1,
0.06636719, -0.6601798, 4.322359, 0, 0.7294118, 1, 1,
0.06690457, -0.4853643, 1.859661, 0, 0.7254902, 1, 1,
0.0694247, -0.6745928, 5.026129, 0, 0.7176471, 1, 1,
0.07415492, 1.158053, 0.7315459, 0, 0.7137255, 1, 1,
0.07461638, -0.9271299, 2.615256, 0, 0.7058824, 1, 1,
0.08261612, 2.278073, -1.282279, 0, 0.6980392, 1, 1,
0.08540184, -0.5986079, 3.041096, 0, 0.6941177, 1, 1,
0.08926631, 1.57872, -0.03181683, 0, 0.6862745, 1, 1,
0.0939291, -0.3677349, 2.770156, 0, 0.682353, 1, 1,
0.09499384, -0.5964916, 2.522558, 0, 0.6745098, 1, 1,
0.09596257, -0.04495928, 1.951213, 0, 0.6705883, 1, 1,
0.1012994, -1.246455, 4.37985, 0, 0.6627451, 1, 1,
0.1036353, -1.004115, 3.811559, 0, 0.6588235, 1, 1,
0.1038315, 0.5966233, 0.9359846, 0, 0.6509804, 1, 1,
0.1077776, -1.571105, 2.104388, 0, 0.6470588, 1, 1,
0.113298, 0.255936, 0.4727932, 0, 0.6392157, 1, 1,
0.11482, -0.5812599, 5.007273, 0, 0.6352941, 1, 1,
0.1167925, -1.173515, 2.906802, 0, 0.627451, 1, 1,
0.1194283, -0.6420826, 2.690043, 0, 0.6235294, 1, 1,
0.1228244, 1.102973, -0.3911384, 0, 0.6156863, 1, 1,
0.1247597, -1.521415, 2.96585, 0, 0.6117647, 1, 1,
0.1270293, 0.4318143, 1.145437, 0, 0.6039216, 1, 1,
0.128935, -0.1989102, 0.7093787, 0, 0.5960785, 1, 1,
0.1295873, 0.9423378, -0.5032288, 0, 0.5921569, 1, 1,
0.1336555, 0.3181762, 0.6365904, 0, 0.5843138, 1, 1,
0.1347956, -0.3902152, 3.451769, 0, 0.5803922, 1, 1,
0.1377798, -0.5444843, 3.009767, 0, 0.572549, 1, 1,
0.1395947, 0.693274, -1.461748, 0, 0.5686275, 1, 1,
0.1404082, 1.031983, 0.9209902, 0, 0.5607843, 1, 1,
0.1426005, 0.5476659, -0.3206291, 0, 0.5568628, 1, 1,
0.1444076, -0.4104032, 4.755628, 0, 0.5490196, 1, 1,
0.145279, -0.4090019, 3.080188, 0, 0.5450981, 1, 1,
0.1458072, -0.5359933, 3.711891, 0, 0.5372549, 1, 1,
0.1481511, 0.3656491, 0.0004699053, 0, 0.5333334, 1, 1,
0.1513585, -0.4441194, 2.963865, 0, 0.5254902, 1, 1,
0.158115, 0.1604519, 2.068287, 0, 0.5215687, 1, 1,
0.1595327, 1.487953, 0.03226726, 0, 0.5137255, 1, 1,
0.1613043, -0.4639531, 2.791086, 0, 0.509804, 1, 1,
0.1623775, 0.3413878, 0.2262255, 0, 0.5019608, 1, 1,
0.1640612, -0.8750107, 2.620672, 0, 0.4941176, 1, 1,
0.1648526, 1.220247, 1.639144, 0, 0.4901961, 1, 1,
0.1675176, 0.3456629, -0.04860413, 0, 0.4823529, 1, 1,
0.1675456, 2.715617, -0.1917712, 0, 0.4784314, 1, 1,
0.1708415, -1.786315, 3.263103, 0, 0.4705882, 1, 1,
0.1741003, -0.5394178, 3.435071, 0, 0.4666667, 1, 1,
0.1745363, 0.7762865, -0.5581564, 0, 0.4588235, 1, 1,
0.1747417, -2.232495, 2.860288, 0, 0.454902, 1, 1,
0.1782515, -1.500624, 3.433646, 0, 0.4470588, 1, 1,
0.1813979, -1.514063, 1.108644, 0, 0.4431373, 1, 1,
0.1874708, 0.00769515, 1.889471, 0, 0.4352941, 1, 1,
0.1880342, 0.6952457, -0.2286983, 0, 0.4313726, 1, 1,
0.18934, 0.3822958, 1.760433, 0, 0.4235294, 1, 1,
0.1914742, 0.2813835, 2.254545, 0, 0.4196078, 1, 1,
0.1922315, 0.5148456, 1.360292, 0, 0.4117647, 1, 1,
0.1960226, -0.598296, 3.503443, 0, 0.4078431, 1, 1,
0.1990972, 0.2659574, -0.2038814, 0, 0.4, 1, 1,
0.1990988, -0.1281823, 2.275585, 0, 0.3921569, 1, 1,
0.2035691, 1.655109, -0.1513015, 0, 0.3882353, 1, 1,
0.2071251, 1.097705, -0.3590348, 0, 0.3803922, 1, 1,
0.2095361, 1.097336, 1.190701, 0, 0.3764706, 1, 1,
0.2112783, 0.8190206, 0.2548826, 0, 0.3686275, 1, 1,
0.2122511, -2.935781, 1.437083, 0, 0.3647059, 1, 1,
0.2140881, -0.1619705, 3.291196, 0, 0.3568628, 1, 1,
0.2195541, -0.09611482, 2.536259, 0, 0.3529412, 1, 1,
0.2199762, 1.199202, -0.5386332, 0, 0.345098, 1, 1,
0.2202027, 0.7001054, 0.8917718, 0, 0.3411765, 1, 1,
0.220608, 0.6809523, 0.2373807, 0, 0.3333333, 1, 1,
0.2209714, 1.904867, -1.283836, 0, 0.3294118, 1, 1,
0.2238501, -1.328351, 2.745103, 0, 0.3215686, 1, 1,
0.2267047, -1.354137, 3.300807, 0, 0.3176471, 1, 1,
0.226989, -0.8503445, 1.503402, 0, 0.3098039, 1, 1,
0.2287092, 1.183176, 0.00896569, 0, 0.3058824, 1, 1,
0.229811, 0.3193547, 2.866058, 0, 0.2980392, 1, 1,
0.2299153, 0.449269, 0.1348151, 0, 0.2901961, 1, 1,
0.2329386, -0.3430127, 1.646118, 0, 0.2862745, 1, 1,
0.2356337, 2.072901, 0.5221216, 0, 0.2784314, 1, 1,
0.2364531, -0.214185, 3.035197, 0, 0.2745098, 1, 1,
0.2384565, 0.658617, -1.056742, 0, 0.2666667, 1, 1,
0.2390117, 1.227687, 1.775782, 0, 0.2627451, 1, 1,
0.2408779, -0.2161935, 3.822375, 0, 0.254902, 1, 1,
0.2452177, 0.1997745, 1.52865, 0, 0.2509804, 1, 1,
0.2498362, -1.867298, 2.881821, 0, 0.2431373, 1, 1,
0.2581332, -0.7624167, 1.44512, 0, 0.2392157, 1, 1,
0.2592369, 1.004541, 1.146262, 0, 0.2313726, 1, 1,
0.2609847, 1.564308, 2.542899, 0, 0.227451, 1, 1,
0.2611202, -0.1077443, 1.622247, 0, 0.2196078, 1, 1,
0.263519, -0.3575835, 2.937987, 0, 0.2156863, 1, 1,
0.2698072, 1.205005, 1.637722, 0, 0.2078431, 1, 1,
0.2720849, 1.071923, 0.6463345, 0, 0.2039216, 1, 1,
0.2736762, 0.5704532, -0.1798412, 0, 0.1960784, 1, 1,
0.2745707, 0.5901546, 0.5075051, 0, 0.1882353, 1, 1,
0.2762514, -0.1006875, 3.587977, 0, 0.1843137, 1, 1,
0.2805062, -0.393517, 2.36577, 0, 0.1764706, 1, 1,
0.2813021, 0.2015553, -0.5913533, 0, 0.172549, 1, 1,
0.2835895, -0.910382, 1.684677, 0, 0.1647059, 1, 1,
0.2837014, -0.3917733, 2.508798, 0, 0.1607843, 1, 1,
0.2906214, -0.5699456, 3.498516, 0, 0.1529412, 1, 1,
0.2957397, 0.6676328, 0.6352694, 0, 0.1490196, 1, 1,
0.2984939, -0.7379921, 4.09025, 0, 0.1411765, 1, 1,
0.2988074, 1.16763, -0.4799958, 0, 0.1372549, 1, 1,
0.2998754, 1.093212, 0.1157243, 0, 0.1294118, 1, 1,
0.3011329, -0.721361, 1.54062, 0, 0.1254902, 1, 1,
0.3020496, -0.8213447, 4.658198, 0, 0.1176471, 1, 1,
0.3025163, -0.2866492, 3.885004, 0, 0.1137255, 1, 1,
0.3045721, -1.754401, 1.462642, 0, 0.1058824, 1, 1,
0.3114102, -0.6492568, 3.0512, 0, 0.09803922, 1, 1,
0.3120374, -0.7434683, 2.841159, 0, 0.09411765, 1, 1,
0.3134727, -1.51737, 2.225971, 0, 0.08627451, 1, 1,
0.3159165, -0.2776031, 1.531379, 0, 0.08235294, 1, 1,
0.3184146, 0.2679617, 1.704221, 0, 0.07450981, 1, 1,
0.3192229, -0.4360578, 3.300404, 0, 0.07058824, 1, 1,
0.3208919, -0.5040772, 1.479851, 0, 0.0627451, 1, 1,
0.332384, 0.04321499, 1.306229, 0, 0.05882353, 1, 1,
0.3371503, -0.4198446, 3.100102, 0, 0.05098039, 1, 1,
0.3403255, -0.2460038, 1.175474, 0, 0.04705882, 1, 1,
0.3422465, 0.5210008, 0.4846555, 0, 0.03921569, 1, 1,
0.3433663, 0.4004951, 0.3262487, 0, 0.03529412, 1, 1,
0.3436658, 0.8019775, 1.354283, 0, 0.02745098, 1, 1,
0.3482227, 0.7830014, 0.23424, 0, 0.02352941, 1, 1,
0.3603188, 1.239394, -0.4464502, 0, 0.01568628, 1, 1,
0.3701037, 1.155282, 0.2022751, 0, 0.01176471, 1, 1,
0.3724878, 0.2622586, 0.04784565, 0, 0.003921569, 1, 1,
0.3726902, 1.777539, -0.05355249, 0.003921569, 0, 1, 1,
0.3776957, 0.1462679, 3.089476, 0.007843138, 0, 1, 1,
0.3787833, 0.1427623, 1.399473, 0.01568628, 0, 1, 1,
0.3797462, -1.222173, 3.029861, 0.01960784, 0, 1, 1,
0.3806417, 0.4802664, 1.11271, 0.02745098, 0, 1, 1,
0.3835216, -2.145772, 0.9147936, 0.03137255, 0, 1, 1,
0.3857625, -0.7895711, 2.753708, 0.03921569, 0, 1, 1,
0.388717, 0.7596146, 0.8349991, 0.04313726, 0, 1, 1,
0.3901783, -0.662059, 0.6719828, 0.05098039, 0, 1, 1,
0.3925502, 0.7321686, 1.421029, 0.05490196, 0, 1, 1,
0.3968295, -0.2319272, 2.37694, 0.0627451, 0, 1, 1,
0.3995428, -1.008629, 3.4625, 0.06666667, 0, 1, 1,
0.4081472, -0.1602132, 2.610276, 0.07450981, 0, 1, 1,
0.4132048, 0.4508094, -0.8283458, 0.07843138, 0, 1, 1,
0.4144488, -0.3400383, 1.858335, 0.08627451, 0, 1, 1,
0.415612, -1.027878, 2.691773, 0.09019608, 0, 1, 1,
0.421273, 0.07996843, 1.692565, 0.09803922, 0, 1, 1,
0.4213746, -0.7450353, 5.05929, 0.1058824, 0, 1, 1,
0.4288216, 0.4988798, 1.650103, 0.1098039, 0, 1, 1,
0.4301995, 0.1801316, -0.367709, 0.1176471, 0, 1, 1,
0.4321054, 0.8599395, 0.5897818, 0.1215686, 0, 1, 1,
0.4357956, 0.8700742, -0.3769342, 0.1294118, 0, 1, 1,
0.439632, 1.638546, 2.232028, 0.1333333, 0, 1, 1,
0.4461135, -1.697852, 3.369521, 0.1411765, 0, 1, 1,
0.4467881, -0.2696981, 1.756232, 0.145098, 0, 1, 1,
0.4470894, -0.1164803, 3.378196, 0.1529412, 0, 1, 1,
0.4524741, -0.0502324, 2.272186, 0.1568628, 0, 1, 1,
0.4538475, -0.874357, 2.457675, 0.1647059, 0, 1, 1,
0.4600905, 1.436209, -1.398267, 0.1686275, 0, 1, 1,
0.4621705, 0.6193579, 0.7845892, 0.1764706, 0, 1, 1,
0.4631943, 0.04862889, 0.767214, 0.1803922, 0, 1, 1,
0.4644526, 0.5637257, 2.148784, 0.1882353, 0, 1, 1,
0.4701628, 0.5396042, 0.8598157, 0.1921569, 0, 1, 1,
0.471928, -0.8833894, 1.541901, 0.2, 0, 1, 1,
0.4776727, 0.2279945, 0.987536, 0.2078431, 0, 1, 1,
0.4820348, 0.4100778, -0.8389534, 0.2117647, 0, 1, 1,
0.4852166, 0.3069544, 1.84923, 0.2196078, 0, 1, 1,
0.4904406, -0.9629552, 2.965843, 0.2235294, 0, 1, 1,
0.4935573, -0.2157807, 2.252388, 0.2313726, 0, 1, 1,
0.4998761, -0.7708753, 2.047365, 0.2352941, 0, 1, 1,
0.5006002, -1.074564, 1.649013, 0.2431373, 0, 1, 1,
0.5021331, -0.01808403, 2.460679, 0.2470588, 0, 1, 1,
0.5080482, -0.4711108, 3.57938, 0.254902, 0, 1, 1,
0.5097122, -1.894849, 1.975654, 0.2588235, 0, 1, 1,
0.5107395, 0.7993423, 1.128335, 0.2666667, 0, 1, 1,
0.5140189, 1.798529, -0.3338423, 0.2705882, 0, 1, 1,
0.5142691, 1.410451, 0.4573247, 0.2784314, 0, 1, 1,
0.5145658, -0.5075828, 2.950332, 0.282353, 0, 1, 1,
0.5209841, -0.2921454, 1.442785, 0.2901961, 0, 1, 1,
0.5223578, 0.4330437, 0.6459751, 0.2941177, 0, 1, 1,
0.5229006, 0.9630364, 0.8480769, 0.3019608, 0, 1, 1,
0.5279073, 1.415854, 0.5040994, 0.3098039, 0, 1, 1,
0.5325138, 0.9195997, -0.2816383, 0.3137255, 0, 1, 1,
0.5330348, 0.9309241, 0.879364, 0.3215686, 0, 1, 1,
0.5355588, -0.1677019, 1.528306, 0.3254902, 0, 1, 1,
0.5364015, -0.5057113, 1.763933, 0.3333333, 0, 1, 1,
0.5367182, -0.339229, 2.994951, 0.3372549, 0, 1, 1,
0.5405708, -1.46496, 2.822, 0.345098, 0, 1, 1,
0.5412111, 1.87114, -2.212461, 0.3490196, 0, 1, 1,
0.5423077, 0.1563084, 1.736814, 0.3568628, 0, 1, 1,
0.542343, 0.3351027, -0.1398183, 0.3607843, 0, 1, 1,
0.543089, -0.9691462, 1.17874, 0.3686275, 0, 1, 1,
0.5445578, 1.158727, -0.08029731, 0.372549, 0, 1, 1,
0.5461427, -0.3323621, 1.827536, 0.3803922, 0, 1, 1,
0.546945, -0.3901685, 2.094074, 0.3843137, 0, 1, 1,
0.550322, -1.809952, 4.098626, 0.3921569, 0, 1, 1,
0.5552272, -0.2529353, 1.013891, 0.3960784, 0, 1, 1,
0.555924, -0.2750418, 3.3975, 0.4039216, 0, 1, 1,
0.5584353, -0.5423895, 2.428209, 0.4117647, 0, 1, 1,
0.5592357, -0.4079919, 1.018392, 0.4156863, 0, 1, 1,
0.5706891, 1.923533, 0.6596879, 0.4235294, 0, 1, 1,
0.5724704, 0.373767, 0.8612725, 0.427451, 0, 1, 1,
0.5734884, -0.312968, 2.716582, 0.4352941, 0, 1, 1,
0.5741362, 0.1727956, 0.05013339, 0.4392157, 0, 1, 1,
0.5760926, 1.300273, -0.5551208, 0.4470588, 0, 1, 1,
0.5823182, -0.6188973, 2.175455, 0.4509804, 0, 1, 1,
0.5829315, 2.387604, -0.9543352, 0.4588235, 0, 1, 1,
0.5831081, -0.7368321, 1.558329, 0.4627451, 0, 1, 1,
0.5914969, 0.70783, 0.1459762, 0.4705882, 0, 1, 1,
0.5943229, 0.6037347, 1.229244, 0.4745098, 0, 1, 1,
0.5954503, -0.8812708, 2.212225, 0.4823529, 0, 1, 1,
0.596521, 0.1469354, 0.8915957, 0.4862745, 0, 1, 1,
0.6024092, -0.4328229, 0.6315475, 0.4941176, 0, 1, 1,
0.6025416, 1.676958, 0.5453387, 0.5019608, 0, 1, 1,
0.6061394, 0.04655258, 1.48998, 0.5058824, 0, 1, 1,
0.6068758, 0.3173154, 3.522277, 0.5137255, 0, 1, 1,
0.6122474, 1.595861, -0.103711, 0.5176471, 0, 1, 1,
0.6125051, -0.1083568, 4.599624, 0.5254902, 0, 1, 1,
0.6175091, -1.184478, 2.677976, 0.5294118, 0, 1, 1,
0.6180026, 0.8162323, 1.611713, 0.5372549, 0, 1, 1,
0.6250134, -0.9393513, 3.080044, 0.5411765, 0, 1, 1,
0.6260601, -1.383976, 3.898978, 0.5490196, 0, 1, 1,
0.6340951, -0.6789503, 3.525267, 0.5529412, 0, 1, 1,
0.6347884, 0.4500361, 1.0585, 0.5607843, 0, 1, 1,
0.638338, -1.74494, 2.816487, 0.5647059, 0, 1, 1,
0.6389251, 0.4158336, 0.1650093, 0.572549, 0, 1, 1,
0.640701, 0.6453751, -0.427139, 0.5764706, 0, 1, 1,
0.6422772, 0.9876009, -0.196589, 0.5843138, 0, 1, 1,
0.6428109, -1.475302, 3.472269, 0.5882353, 0, 1, 1,
0.6458997, 0.3862208, 0.536967, 0.5960785, 0, 1, 1,
0.649185, -0.5254059, 0.3732992, 0.6039216, 0, 1, 1,
0.6523642, -0.5868794, 2.153204, 0.6078432, 0, 1, 1,
0.6560377, -0.7660633, 2.894533, 0.6156863, 0, 1, 1,
0.6584087, -0.7274917, 1.392605, 0.6196079, 0, 1, 1,
0.671398, 0.7103494, 1.81568, 0.627451, 0, 1, 1,
0.6741048, 2.242647, 0.8485669, 0.6313726, 0, 1, 1,
0.6761549, 1.375075, 0.9943336, 0.6392157, 0, 1, 1,
0.6768328, -0.20254, 1.747693, 0.6431373, 0, 1, 1,
0.6809222, 0.1750731, 2.203431, 0.6509804, 0, 1, 1,
0.684984, -0.743875, 0.981921, 0.654902, 0, 1, 1,
0.6851944, -0.6216135, 1.185599, 0.6627451, 0, 1, 1,
0.6863215, -0.222476, 1.779571, 0.6666667, 0, 1, 1,
0.6882606, 0.5765505, 0.8799348, 0.6745098, 0, 1, 1,
0.6893744, -0.8963717, 0.427884, 0.6784314, 0, 1, 1,
0.6924435, -0.6371061, 3.300611, 0.6862745, 0, 1, 1,
0.6951355, -1.342237, 2.304519, 0.6901961, 0, 1, 1,
0.6962074, 0.1727284, 1.298314, 0.6980392, 0, 1, 1,
0.7114565, 0.2555955, -0.3434097, 0.7058824, 0, 1, 1,
0.7119, 1.509772, -0.5381771, 0.7098039, 0, 1, 1,
0.724876, -0.08620171, 2.798084, 0.7176471, 0, 1, 1,
0.7253311, -1.440631, 1.79121, 0.7215686, 0, 1, 1,
0.7324908, -0.6001789, 1.812367, 0.7294118, 0, 1, 1,
0.7345612, 0.6524337, 0.2259782, 0.7333333, 0, 1, 1,
0.7423593, -0.5201798, 1.513147, 0.7411765, 0, 1, 1,
0.7468136, -0.8658275, 3.087792, 0.7450981, 0, 1, 1,
0.7471552, -0.3989377, 1.673974, 0.7529412, 0, 1, 1,
0.7548851, -0.7092083, -0.4708142, 0.7568628, 0, 1, 1,
0.7584595, 2.578631, -0.40198, 0.7647059, 0, 1, 1,
0.7606609, 0.661594, 1.840305, 0.7686275, 0, 1, 1,
0.7638158, -1.56582, 2.918272, 0.7764706, 0, 1, 1,
0.7639537, 0.1686724, 1.967958, 0.7803922, 0, 1, 1,
0.7775341, 0.002641523, 0.7527386, 0.7882353, 0, 1, 1,
0.791096, -0.3280188, 2.090718, 0.7921569, 0, 1, 1,
0.7997876, -2.073748, 3.758407, 0.8, 0, 1, 1,
0.8026222, -0.7624057, 3.290761, 0.8078431, 0, 1, 1,
0.8056247, -0.6483715, 1.726975, 0.8117647, 0, 1, 1,
0.8056809, 0.7464952, 0.2790706, 0.8196079, 0, 1, 1,
0.8104009, 0.3155327, 0.5227286, 0.8235294, 0, 1, 1,
0.8147559, 0.9953132, 0.003127826, 0.8313726, 0, 1, 1,
0.8153484, 0.8887531, -1.346713, 0.8352941, 0, 1, 1,
0.816329, 0.3069173, 1.508325, 0.8431373, 0, 1, 1,
0.8168754, -0.04693589, 1.47423, 0.8470588, 0, 1, 1,
0.8173102, -1.473663, 3.295403, 0.854902, 0, 1, 1,
0.8208095, 0.7302901, 0.7781905, 0.8588235, 0, 1, 1,
0.8231847, -0.2563576, 1.714556, 0.8666667, 0, 1, 1,
0.8235177, -1.285248, 2.432998, 0.8705882, 0, 1, 1,
0.8243562, -0.07411176, 2.794265, 0.8784314, 0, 1, 1,
0.8250616, 0.4691116, -0.3860399, 0.8823529, 0, 1, 1,
0.829402, -1.680116, 2.290907, 0.8901961, 0, 1, 1,
0.8357484, -1.838522, 3.303076, 0.8941177, 0, 1, 1,
0.8381568, -0.5211109, 2.154278, 0.9019608, 0, 1, 1,
0.8470798, -1.509255, 2.942536, 0.9098039, 0, 1, 1,
0.8482153, 1.192633, 2.918828, 0.9137255, 0, 1, 1,
0.8487069, 1.663869, 1.970738, 0.9215686, 0, 1, 1,
0.8492754, 0.5846138, -0.1151352, 0.9254902, 0, 1, 1,
0.8536481, 0.434357, 1.480879, 0.9333333, 0, 1, 1,
0.8678747, -0.3351561, 1.058142, 0.9372549, 0, 1, 1,
0.8692947, -0.8771021, 2.982426, 0.945098, 0, 1, 1,
0.8745252, 0.8652313, 1.48771, 0.9490196, 0, 1, 1,
0.8822554, -0.156156, 1.226171, 0.9568627, 0, 1, 1,
0.8858989, 1.555, 0.77542, 0.9607843, 0, 1, 1,
0.8859267, 0.3937067, 0.2733433, 0.9686275, 0, 1, 1,
0.8937157, 0.2664359, -0.1395531, 0.972549, 0, 1, 1,
0.8955507, 1.057663, -0.4394254, 0.9803922, 0, 1, 1,
0.8961914, -0.8966191, 2.670566, 0.9843137, 0, 1, 1,
0.8981705, -0.6677713, 3.733449, 0.9921569, 0, 1, 1,
0.8990443, 1.669667, 1.819732, 0.9960784, 0, 1, 1,
0.9032611, -0.1197041, 3.414982, 1, 0, 0.9960784, 1,
0.9038066, -1.777585, 2.087886, 1, 0, 0.9882353, 1,
0.9093014, -0.2175427, 0.9792925, 1, 0, 0.9843137, 1,
0.9178534, -0.2787926, 2.620019, 1, 0, 0.9764706, 1,
0.9188429, 1.29032, -0.5540633, 1, 0, 0.972549, 1,
0.922492, 1.174063, 0.8679246, 1, 0, 0.9647059, 1,
0.9245226, -0.185408, 1.568017, 1, 0, 0.9607843, 1,
0.9347295, -0.2885859, 1.43966, 1, 0, 0.9529412, 1,
0.9428006, 1.585164, 1.796111, 1, 0, 0.9490196, 1,
0.9445708, 0.3397039, 0.1405692, 1, 0, 0.9411765, 1,
0.948116, -0.4125477, 1.103637, 1, 0, 0.9372549, 1,
0.9520478, -1.939543, 2.531667, 1, 0, 0.9294118, 1,
0.9523023, 0.5057136, 1.108409, 1, 0, 0.9254902, 1,
0.9612124, 0.2133142, 1.180321, 1, 0, 0.9176471, 1,
0.9625552, -0.8837751, 3.630312, 1, 0, 0.9137255, 1,
0.9648896, 0.879544, 0.07448806, 1, 0, 0.9058824, 1,
0.9651123, 0.2983001, 1.622367, 1, 0, 0.9019608, 1,
0.9652032, 0.01761527, 2.058477, 1, 0, 0.8941177, 1,
0.9652581, -1.39291, 1.427974, 1, 0, 0.8862745, 1,
0.969602, 0.9133275, 0.3402645, 1, 0, 0.8823529, 1,
0.9715757, 1.233957, 3.196991, 1, 0, 0.8745098, 1,
0.9722942, 1.403972, 0.1365606, 1, 0, 0.8705882, 1,
0.9758414, -1.205924, 2.092087, 1, 0, 0.8627451, 1,
0.9768898, -0.4698578, 1.016788, 1, 0, 0.8588235, 1,
0.9927796, -1.782362, 3.749057, 1, 0, 0.8509804, 1,
0.9950806, 0.7063382, 0.1916574, 1, 0, 0.8470588, 1,
0.9954147, 0.6849956, -0.1258568, 1, 0, 0.8392157, 1,
0.9955118, -0.7589546, 2.540467, 1, 0, 0.8352941, 1,
0.995738, 1.345286, 0.4285563, 1, 0, 0.827451, 1,
0.9970224, -2.554456, 3.262508, 1, 0, 0.8235294, 1,
1.005507, -0.146656, 1.459553, 1, 0, 0.8156863, 1,
1.015328, -2.021763, 2.709494, 1, 0, 0.8117647, 1,
1.022418, 0.04732337, 0.7979042, 1, 0, 0.8039216, 1,
1.028039, 0.8829006, -0.7281705, 1, 0, 0.7960784, 1,
1.030268, -0.9938185, 3.150268, 1, 0, 0.7921569, 1,
1.042255, -0.01112166, 1.933246, 1, 0, 0.7843137, 1,
1.04438, 0.9046932, 0.3289113, 1, 0, 0.7803922, 1,
1.047, 0.2839414, 1.354738, 1, 0, 0.772549, 1,
1.062953, -0.08401228, 1.659796, 1, 0, 0.7686275, 1,
1.063749, 0.5508341, 0.3759798, 1, 0, 0.7607843, 1,
1.064997, -0.9759507, 3.253406, 1, 0, 0.7568628, 1,
1.065281, -1.011823, 0.7457374, 1, 0, 0.7490196, 1,
1.066349, 1.160166, -0.9001027, 1, 0, 0.7450981, 1,
1.074971, -0.7201074, 2.702844, 1, 0, 0.7372549, 1,
1.077356, 0.0137167, 3.067262, 1, 0, 0.7333333, 1,
1.080541, -1.01597, 2.709342, 1, 0, 0.7254902, 1,
1.081766, 1.880921, 0.2593668, 1, 0, 0.7215686, 1,
1.082578, 0.8114685, 1.138581, 1, 0, 0.7137255, 1,
1.084266, 0.5144217, 1.977215, 1, 0, 0.7098039, 1,
1.088914, 1.957736, 0.7894564, 1, 0, 0.7019608, 1,
1.089417, -0.4271284, 2.386729, 1, 0, 0.6941177, 1,
1.089644, 0.3611856, 2.005603, 1, 0, 0.6901961, 1,
1.102546, -2.257833, 2.744713, 1, 0, 0.682353, 1,
1.105708, 1.880796, 0.07303297, 1, 0, 0.6784314, 1,
1.107055, -0.05534958, 0.3232766, 1, 0, 0.6705883, 1,
1.109917, -1.343457, 2.072075, 1, 0, 0.6666667, 1,
1.114992, 2.021457, -2.131065, 1, 0, 0.6588235, 1,
1.117732, -1.271857, 1.566423, 1, 0, 0.654902, 1,
1.122912, 0.6231585, -0.3794249, 1, 0, 0.6470588, 1,
1.137279, 0.9889573, 1.503878, 1, 0, 0.6431373, 1,
1.141401, 0.6786624, 0.8655248, 1, 0, 0.6352941, 1,
1.14615, -0.7830097, 2.044725, 1, 0, 0.6313726, 1,
1.155247, -0.2221764, 2.096353, 1, 0, 0.6235294, 1,
1.164492, 0.3412269, 2.476817, 1, 0, 0.6196079, 1,
1.173148, 0.4285745, -0.6794905, 1, 0, 0.6117647, 1,
1.189311, 1.899135, -0.4716237, 1, 0, 0.6078432, 1,
1.19233, -0.9352099, 3.125458, 1, 0, 0.6, 1,
1.192755, -0.1408984, 1.689369, 1, 0, 0.5921569, 1,
1.195839, -0.7469155, 3.125039, 1, 0, 0.5882353, 1,
1.198362, 0.3021376, 1.837539, 1, 0, 0.5803922, 1,
1.205348, 0.3313947, 1.309783, 1, 0, 0.5764706, 1,
1.215612, 1.032271, -0.0636254, 1, 0, 0.5686275, 1,
1.266557, 1.986923, -0.02206917, 1, 0, 0.5647059, 1,
1.276126, 0.8960442, -1.505835, 1, 0, 0.5568628, 1,
1.277526, 0.5922483, 1.244353, 1, 0, 0.5529412, 1,
1.285508, 0.1359467, 0.7190877, 1, 0, 0.5450981, 1,
1.28942, -0.245656, 2.404272, 1, 0, 0.5411765, 1,
1.293444, -0.1651528, 2.698152, 1, 0, 0.5333334, 1,
1.304519, 0.3496451, 1.262262, 1, 0, 0.5294118, 1,
1.315251, -0.3855629, -0.2116229, 1, 0, 0.5215687, 1,
1.316648, -0.1961015, 2.463546, 1, 0, 0.5176471, 1,
1.328185, 0.4196684, 0.9993826, 1, 0, 0.509804, 1,
1.340509, 0.8986875, 1.796634, 1, 0, 0.5058824, 1,
1.347426, -2.353119, 3.200628, 1, 0, 0.4980392, 1,
1.351369, -1.319347, 2.738368, 1, 0, 0.4901961, 1,
1.357735, 0.864847, 1.403136, 1, 0, 0.4862745, 1,
1.365703, 1.034574, 0.6404769, 1, 0, 0.4784314, 1,
1.380624, -0.7182687, 1.540589, 1, 0, 0.4745098, 1,
1.383191, 1.507598, -2.100573, 1, 0, 0.4666667, 1,
1.390739, -0.8155423, 1.909171, 1, 0, 0.4627451, 1,
1.396906, 0.2380163, -0.9114243, 1, 0, 0.454902, 1,
1.397058, -0.02776581, 0.802205, 1, 0, 0.4509804, 1,
1.404188, 0.6040168, 2.195401, 1, 0, 0.4431373, 1,
1.404942, 0.06787726, 0.313515, 1, 0, 0.4392157, 1,
1.412928, 0.05209921, 2.532084, 1, 0, 0.4313726, 1,
1.417832, -1.414206, 0.77567, 1, 0, 0.427451, 1,
1.422267, -0.2527385, 2.322549, 1, 0, 0.4196078, 1,
1.431089, -0.6951798, 1.906858, 1, 0, 0.4156863, 1,
1.441167, 0.2286104, 2.049173, 1, 0, 0.4078431, 1,
1.444172, 0.9881808, 0.3636511, 1, 0, 0.4039216, 1,
1.444491, 2.513207, 1.234317, 1, 0, 0.3960784, 1,
1.456466, -0.191611, 1.726756, 1, 0, 0.3882353, 1,
1.456929, -0.7373317, 2.424865, 1, 0, 0.3843137, 1,
1.458344, 1.586153, 0.4964291, 1, 0, 0.3764706, 1,
1.467723, 0.5186659, 2.630019, 1, 0, 0.372549, 1,
1.477859, 0.2059962, 0.4835446, 1, 0, 0.3647059, 1,
1.481129, -0.4607763, 1.339469, 1, 0, 0.3607843, 1,
1.499861, -0.06200018, 1.825846, 1, 0, 0.3529412, 1,
1.515617, -0.2234687, 1.970889, 1, 0, 0.3490196, 1,
1.526647, -1.29786, 1.80058, 1, 0, 0.3411765, 1,
1.530643, 2.081706, 1.098676, 1, 0, 0.3372549, 1,
1.532863, -0.8492056, 0.358006, 1, 0, 0.3294118, 1,
1.535832, 1.596297, 0.6576388, 1, 0, 0.3254902, 1,
1.540029, 0.3138212, 2.390705, 1, 0, 0.3176471, 1,
1.549744, -0.1039388, 1.876203, 1, 0, 0.3137255, 1,
1.55016, -1.141647, 3.468567, 1, 0, 0.3058824, 1,
1.553294, 0.501745, 2.499567, 1, 0, 0.2980392, 1,
1.562243, 0.4988386, 0.5118137, 1, 0, 0.2941177, 1,
1.569563, 1.746749, 0.4246627, 1, 0, 0.2862745, 1,
1.586971, 1.131121, 0.4495804, 1, 0, 0.282353, 1,
1.588448, -0.6692503, 2.641477, 1, 0, 0.2745098, 1,
1.59587, -0.2886391, 0.2657927, 1, 0, 0.2705882, 1,
1.604934, 1.438095, 0.3414593, 1, 0, 0.2627451, 1,
1.610108, -1.07129, 1.715202, 1, 0, 0.2588235, 1,
1.61424, 0.5071036, 0.3710033, 1, 0, 0.2509804, 1,
1.617471, 0.06834126, 2.385085, 1, 0, 0.2470588, 1,
1.620845, 0.9063306, 1.875937, 1, 0, 0.2392157, 1,
1.637373, -1.027325, -0.0425064, 1, 0, 0.2352941, 1,
1.651103, -0.2459139, 1.386482, 1, 0, 0.227451, 1,
1.655618, -1.150314, -0.4251022, 1, 0, 0.2235294, 1,
1.656078, -0.76335, 2.274375, 1, 0, 0.2156863, 1,
1.66165, -0.3557453, 2.533762, 1, 0, 0.2117647, 1,
1.664775, -0.7048622, 1.638726, 1, 0, 0.2039216, 1,
1.671281, 0.3325534, 1.888353, 1, 0, 0.1960784, 1,
1.673235, 0.3827202, 0.3889162, 1, 0, 0.1921569, 1,
1.678961, -0.619752, 2.501391, 1, 0, 0.1843137, 1,
1.693911, 0.552683, 0.4953882, 1, 0, 0.1803922, 1,
1.730788, 0.9913594, 2.479659, 1, 0, 0.172549, 1,
1.751885, 0.3474363, 2.236552, 1, 0, 0.1686275, 1,
1.764463, -1.976081, 4.626, 1, 0, 0.1607843, 1,
1.788179, 2.059968, -0.3685192, 1, 0, 0.1568628, 1,
1.791889, 0.5282371, 0.2327729, 1, 0, 0.1490196, 1,
1.798352, -0.2472533, 1.65513, 1, 0, 0.145098, 1,
1.853974, 0.9100659, 2.321513, 1, 0, 0.1372549, 1,
1.859097, -0.6511731, 2.165748, 1, 0, 0.1333333, 1,
1.911051, -0.8718039, 0.9676278, 1, 0, 0.1254902, 1,
1.953523, -1.045608, 1.217692, 1, 0, 0.1215686, 1,
2.003267, 0.07018412, 3.044944, 1, 0, 0.1137255, 1,
2.004437, 0.5217572, 1.463965, 1, 0, 0.1098039, 1,
2.090848, -1.761474, 2.695636, 1, 0, 0.1019608, 1,
2.135386, -0.4773661, 2.797062, 1, 0, 0.09411765, 1,
2.159732, -1.63081, 3.348604, 1, 0, 0.09019608, 1,
2.179191, -1.640716, 1.530624, 1, 0, 0.08235294, 1,
2.273875, -1.165587, 3.058456, 1, 0, 0.07843138, 1,
2.275213, -1.894476, 3.026282, 1, 0, 0.07058824, 1,
2.356652, 0.8543857, 0.3927302, 1, 0, 0.06666667, 1,
2.379145, -0.1842127, 0.556958, 1, 0, 0.05882353, 1,
2.380629, 1.161411, 1.493315, 1, 0, 0.05490196, 1,
2.507976, -0.2090815, 2.602007, 1, 0, 0.04705882, 1,
2.707307, -2.814378, 0.7364964, 1, 0, 0.04313726, 1,
2.770564, 0.9900712, 2.719636, 1, 0, 0.03529412, 1,
2.775327, -0.6221815, 2.052011, 1, 0, 0.03137255, 1,
2.942437, 0.06719932, 1.668526, 1, 0, 0.02352941, 1,
3.038108, 0.6014006, 1.936827, 1, 0, 0.01960784, 1,
3.226272, -0.9110184, 0.08847243, 1, 0, 0.01176471, 1,
3.448386, -0.5370823, 1.754487, 1, 0, 0.007843138, 1
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
-0.0087111, -4.040351, -7.131314, 0, -0.5, 0.5, 0.5,
-0.0087111, -4.040351, -7.131314, 1, -0.5, 0.5, 0.5,
-0.0087111, -4.040351, -7.131314, 1, 1.5, 0.5, 0.5,
-0.0087111, -4.040351, -7.131314, 0, 1.5, 0.5, 0.5
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
-4.637764, -0.172783, -7.131314, 0, -0.5, 0.5, 0.5,
-4.637764, -0.172783, -7.131314, 1, -0.5, 0.5, 0.5,
-4.637764, -0.172783, -7.131314, 1, 1.5, 0.5, 0.5,
-4.637764, -0.172783, -7.131314, 0, 1.5, 0.5, 0.5
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
-4.637764, -4.040351, -0.1525972, 0, -0.5, 0.5, 0.5,
-4.637764, -4.040351, -0.1525972, 1, -0.5, 0.5, 0.5,
-4.637764, -4.040351, -0.1525972, 1, 1.5, 0.5, 0.5,
-4.637764, -4.040351, -0.1525972, 0, 1.5, 0.5, 0.5
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
-3, -3.147835, -5.520841,
3, -3.147835, -5.520841,
-3, -3.147835, -5.520841,
-3, -3.296588, -5.789253,
-2, -3.147835, -5.520841,
-2, -3.296588, -5.789253,
-1, -3.147835, -5.520841,
-1, -3.296588, -5.789253,
0, -3.147835, -5.520841,
0, -3.296588, -5.789253,
1, -3.147835, -5.520841,
1, -3.296588, -5.789253,
2, -3.147835, -5.520841,
2, -3.296588, -5.789253,
3, -3.147835, -5.520841,
3, -3.296588, -5.789253
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
-3, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
-3, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
-3, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
-3, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
-2, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
-2, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
-2, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
-2, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
-1, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
-1, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
-1, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
-1, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
0, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
0, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
0, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
0, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
1, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
1, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
1, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
1, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
2, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
2, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
2, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
2, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5,
3, -3.594093, -6.326077, 0, -0.5, 0.5, 0.5,
3, -3.594093, -6.326077, 1, -0.5, 0.5, 0.5,
3, -3.594093, -6.326077, 1, 1.5, 0.5, 0.5,
3, -3.594093, -6.326077, 0, 1.5, 0.5, 0.5
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
-3.569521, -3, -5.520841,
-3.569521, 2, -5.520841,
-3.569521, -3, -5.520841,
-3.747562, -3, -5.789253,
-3.569521, -2, -5.520841,
-3.747562, -2, -5.789253,
-3.569521, -1, -5.520841,
-3.747562, -1, -5.789253,
-3.569521, 0, -5.520841,
-3.747562, 0, -5.789253,
-3.569521, 1, -5.520841,
-3.747562, 1, -5.789253,
-3.569521, 2, -5.520841,
-3.747562, 2, -5.789253
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
-4.103643, -3, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, -3, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, -3, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, -3, -6.326077, 0, 1.5, 0.5, 0.5,
-4.103643, -2, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, -2, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, -2, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, -2, -6.326077, 0, 1.5, 0.5, 0.5,
-4.103643, -1, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, -1, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, -1, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, -1, -6.326077, 0, 1.5, 0.5, 0.5,
-4.103643, 0, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, 0, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, 0, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, 0, -6.326077, 0, 1.5, 0.5, 0.5,
-4.103643, 1, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, 1, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, 1, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, 1, -6.326077, 0, 1.5, 0.5, 0.5,
-4.103643, 2, -6.326077, 0, -0.5, 0.5, 0.5,
-4.103643, 2, -6.326077, 1, -0.5, 0.5, 0.5,
-4.103643, 2, -6.326077, 1, 1.5, 0.5, 0.5,
-4.103643, 2, -6.326077, 0, 1.5, 0.5, 0.5
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
-3.569521, -3.147835, -4,
-3.569521, -3.147835, 4,
-3.569521, -3.147835, -4,
-3.747562, -3.296588, -4,
-3.569521, -3.147835, -2,
-3.747562, -3.296588, -2,
-3.569521, -3.147835, 0,
-3.747562, -3.296588, 0,
-3.569521, -3.147835, 2,
-3.747562, -3.296588, 2,
-3.569521, -3.147835, 4,
-3.747562, -3.296588, 4
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
-4.103643, -3.594093, -4, 0, -0.5, 0.5, 0.5,
-4.103643, -3.594093, -4, 1, -0.5, 0.5, 0.5,
-4.103643, -3.594093, -4, 1, 1.5, 0.5, 0.5,
-4.103643, -3.594093, -4, 0, 1.5, 0.5, 0.5,
-4.103643, -3.594093, -2, 0, -0.5, 0.5, 0.5,
-4.103643, -3.594093, -2, 1, -0.5, 0.5, 0.5,
-4.103643, -3.594093, -2, 1, 1.5, 0.5, 0.5,
-4.103643, -3.594093, -2, 0, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 0, 0, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 0, 1, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 0, 1, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 0, 0, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 2, 0, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 2, 1, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 2, 1, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 2, 0, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 4, 0, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 4, 1, -0.5, 0.5, 0.5,
-4.103643, -3.594093, 4, 1, 1.5, 0.5, 0.5,
-4.103643, -3.594093, 4, 0, 1.5, 0.5, 0.5
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
-3.569521, -3.147835, -5.520841,
-3.569521, 2.802269, -5.520841,
-3.569521, -3.147835, 5.215647,
-3.569521, 2.802269, 5.215647,
-3.569521, -3.147835, -5.520841,
-3.569521, -3.147835, 5.215647,
-3.569521, 2.802269, -5.520841,
-3.569521, 2.802269, 5.215647,
-3.569521, -3.147835, -5.520841,
3.552099, -3.147835, -5.520841,
-3.569521, -3.147835, 5.215647,
3.552099, -3.147835, 5.215647,
-3.569521, 2.802269, -5.520841,
3.552099, 2.802269, -5.520841,
-3.569521, 2.802269, 5.215647,
3.552099, 2.802269, 5.215647,
3.552099, -3.147835, -5.520841,
3.552099, 2.802269, -5.520841,
3.552099, -3.147835, 5.215647,
3.552099, 2.802269, 5.215647,
3.552099, -3.147835, -5.520841,
3.552099, -3.147835, 5.215647,
3.552099, 2.802269, -5.520841,
3.552099, 2.802269, 5.215647
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
var radius = 7.577886;
var distance = 33.71487;
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
mvMatrix.translate( 0.0087111, 0.172783, 0.1525972 );
mvMatrix.scale( 1.150491, 1.377011, 0.7631322 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.71487);
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
Azinphosmethyl<-read.table("Azinphosmethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Azinphosmethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Azinphosmethyl' not found
```

```r
y<-Azinphosmethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Azinphosmethyl' not found
```

```r
z<-Azinphosmethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Azinphosmethyl' not found
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
-3.465808, -0.1773458, -1.337387, 0, 0, 1, 1, 1,
-3.290074, 0.04783537, -1.866416, 1, 0, 0, 1, 1,
-3.188926, -1.152425, -2.532004, 1, 0, 0, 1, 1,
-3.052828, 2.277503, -0.4787416, 1, 0, 0, 1, 1,
-2.938711, 0.7642174, -1.450482, 1, 0, 0, 1, 1,
-2.927218, 1.513172, 1.140511, 1, 0, 0, 1, 1,
-2.897914, 1.397925, -1.430593, 0, 0, 0, 1, 1,
-2.581045, -0.2943931, -1.37372, 0, 0, 0, 1, 1,
-2.549241, -0.8019823, -1.722091, 0, 0, 0, 1, 1,
-2.532893, 1.547854, 0.2111889, 0, 0, 0, 1, 1,
-2.532224, 1.127885, -1.276111, 0, 0, 0, 1, 1,
-2.520881, 0.2431898, -0.9041553, 0, 0, 0, 1, 1,
-2.221727, 0.04945437, -1.855045, 0, 0, 0, 1, 1,
-2.219989, -0.8494663, -2.896039, 1, 1, 1, 1, 1,
-2.210675, -0.1516381, -1.909925, 1, 1, 1, 1, 1,
-2.209491, 1.367062, -0.7955697, 1, 1, 1, 1, 1,
-2.192977, 0.8258049, -0.1378113, 1, 1, 1, 1, 1,
-2.192325, 0.4283868, -2.636671, 1, 1, 1, 1, 1,
-2.158608, 0.8620943, -0.8311796, 1, 1, 1, 1, 1,
-2.152998, 1.653281, -1.305606, 1, 1, 1, 1, 1,
-2.147408, 0.3219667, -0.7990116, 1, 1, 1, 1, 1,
-2.104944, 0.9015189, -0.6050782, 1, 1, 1, 1, 1,
-2.096784, -2.020434, -1.714774, 1, 1, 1, 1, 1,
-2.095966, 0.8715183, -1.059361, 1, 1, 1, 1, 1,
-2.050405, -0.8706106, -0.6990056, 1, 1, 1, 1, 1,
-2.045422, 0.3210035, -1.705162, 1, 1, 1, 1, 1,
-2.014918, -1.264288, -2.132834, 1, 1, 1, 1, 1,
-1.987777, 0.05917519, -1.941814, 1, 1, 1, 1, 1,
-1.976034, 0.36312, -1.188639, 0, 0, 1, 1, 1,
-1.969961, -0.4911595, -1.859756, 1, 0, 0, 1, 1,
-1.969713, -0.2528334, -1.530634, 1, 0, 0, 1, 1,
-1.95012, 1.379184, 1.037827, 1, 0, 0, 1, 1,
-1.916974, -0.6927673, -3.059342, 1, 0, 0, 1, 1,
-1.877866, -0.2394275, -3.041978, 1, 0, 0, 1, 1,
-1.869743, 2.251271, -0.7748881, 0, 0, 0, 1, 1,
-1.852333, 1.268236, -1.586765, 0, 0, 0, 1, 1,
-1.842614, -0.1410893, -2.518469, 0, 0, 0, 1, 1,
-1.834561, -0.5908006, -0.7739987, 0, 0, 0, 1, 1,
-1.818119, 1.2754, -1.648821, 0, 0, 0, 1, 1,
-1.795017, -0.0772984, -1.82041, 0, 0, 0, 1, 1,
-1.781327, 0.211557, -3.768203, 0, 0, 0, 1, 1,
-1.765861, 0.25368, -0.1995397, 1, 1, 1, 1, 1,
-1.765378, 0.9427118, -1.698187, 1, 1, 1, 1, 1,
-1.760339, -0.5316935, -2.673632, 1, 1, 1, 1, 1,
-1.758401, -0.4791422, -0.7864364, 1, 1, 1, 1, 1,
-1.734834, -0.4992175, -3.851454, 1, 1, 1, 1, 1,
-1.725543, 1.563341, -0.9995741, 1, 1, 1, 1, 1,
-1.715553, 1.24825, -0.8874086, 1, 1, 1, 1, 1,
-1.705874, 1.145914, -1.025968, 1, 1, 1, 1, 1,
-1.694465, 0.3658483, -0.5773125, 1, 1, 1, 1, 1,
-1.676224, -1.399873, -2.038427, 1, 1, 1, 1, 1,
-1.666184, -1.125703, -2.294291, 1, 1, 1, 1, 1,
-1.656911, 0.4680397, -2.054486, 1, 1, 1, 1, 1,
-1.650061, 0.4766752, -2.30412, 1, 1, 1, 1, 1,
-1.639952, -0.2452911, -1.440874, 1, 1, 1, 1, 1,
-1.635252, -0.9592979, -2.938655, 1, 1, 1, 1, 1,
-1.630526, 1.293598, -1.554881, 0, 0, 1, 1, 1,
-1.615894, 0.74344, -1.78738, 1, 0, 0, 1, 1,
-1.602314, -0.2808954, -2.616965, 1, 0, 0, 1, 1,
-1.585021, 0.08088548, -2.793324, 1, 0, 0, 1, 1,
-1.576046, 0.3389973, -1.109148, 1, 0, 0, 1, 1,
-1.566208, 0.3336476, -1.658578, 1, 0, 0, 1, 1,
-1.558253, -0.4764384, -1.549155, 0, 0, 0, 1, 1,
-1.548566, -0.1071575, -1.758877, 0, 0, 0, 1, 1,
-1.498991, 0.728617, -0.2230184, 0, 0, 0, 1, 1,
-1.484194, 1.33124, 0.1462638, 0, 0, 0, 1, 1,
-1.470634, -1.263797, -2.058172, 0, 0, 0, 1, 1,
-1.466871, -1.134416, -2.657983, 0, 0, 0, 1, 1,
-1.463123, -0.5574337, -1.877522, 0, 0, 0, 1, 1,
-1.457958, 0.2603655, -1.390106, 1, 1, 1, 1, 1,
-1.448535, 0.2441406, -0.7502776, 1, 1, 1, 1, 1,
-1.446591, -0.8989387, -1.423863, 1, 1, 1, 1, 1,
-1.443857, 1.79074, -2.973253, 1, 1, 1, 1, 1,
-1.43893, 1.448128, -0.1649748, 1, 1, 1, 1, 1,
-1.421661, 1.500483, 0.1938332, 1, 1, 1, 1, 1,
-1.381811, -0.2193664, -2.925028, 1, 1, 1, 1, 1,
-1.375497, -0.3636624, -5.364484, 1, 1, 1, 1, 1,
-1.370481, -1.132876, -1.115268, 1, 1, 1, 1, 1,
-1.363464, 0.0337996, -0.8361557, 1, 1, 1, 1, 1,
-1.361733, -2.545944, -2.966955, 1, 1, 1, 1, 1,
-1.360073, -0.7764742, -3.411947, 1, 1, 1, 1, 1,
-1.359206, 1.058109, -0.7703214, 1, 1, 1, 1, 1,
-1.358503, 0.4603795, -0.6940119, 1, 1, 1, 1, 1,
-1.347514, 0.7557998, -2.734471, 1, 1, 1, 1, 1,
-1.345594, -2.133248, -4.398409, 0, 0, 1, 1, 1,
-1.339167, -0.953213, -3.687882, 1, 0, 0, 1, 1,
-1.322863, 0.2403676, -2.476011, 1, 0, 0, 1, 1,
-1.32266, 1.390798, 0.9071816, 1, 0, 0, 1, 1,
-1.320803, 1.357298, -1.616131, 1, 0, 0, 1, 1,
-1.319167, 0.3014466, -1.296069, 1, 0, 0, 1, 1,
-1.317999, -0.0205685, -0.6643115, 0, 0, 0, 1, 1,
-1.312365, 0.5516533, -0.744883, 0, 0, 0, 1, 1,
-1.310558, -0.4833673, -3.868756, 0, 0, 0, 1, 1,
-1.310459, 1.177243, -0.747471, 0, 0, 0, 1, 1,
-1.305869, 0.4973954, -2.958216, 0, 0, 0, 1, 1,
-1.300344, 0.4866279, 0.2494543, 0, 0, 0, 1, 1,
-1.292118, -0.0268425, -1.00115, 0, 0, 0, 1, 1,
-1.290919, -0.5218827, -1.070875, 1, 1, 1, 1, 1,
-1.285094, -0.216461, -0.1981585, 1, 1, 1, 1, 1,
-1.282739, 1.601822, -1.749219, 1, 1, 1, 1, 1,
-1.282619, -0.2462171, -4.406903, 1, 1, 1, 1, 1,
-1.276193, -0.1656711, -1.785053, 1, 1, 1, 1, 1,
-1.272539, 1.595948, -2.78972, 1, 1, 1, 1, 1,
-1.261252, 0.1045992, -1.577872, 1, 1, 1, 1, 1,
-1.261122, -2.333837, -3.947637, 1, 1, 1, 1, 1,
-1.25336, 0.3612278, -1.9075, 1, 1, 1, 1, 1,
-1.252046, -0.8632552, -0.5504649, 1, 1, 1, 1, 1,
-1.249677, 1.301229, -2.520245, 1, 1, 1, 1, 1,
-1.249413, 1.12543, 0.6750937, 1, 1, 1, 1, 1,
-1.247866, 0.03902563, -0.535129, 1, 1, 1, 1, 1,
-1.24639, 0.3345734, -1.341713, 1, 1, 1, 1, 1,
-1.239405, -0.2196618, -0.7075256, 1, 1, 1, 1, 1,
-1.235165, -0.03388297, -0.05972916, 0, 0, 1, 1, 1,
-1.23366, 0.7901204, -2.140722, 1, 0, 0, 1, 1,
-1.231382, 0.1199872, -0.3826277, 1, 0, 0, 1, 1,
-1.228953, -0.1092134, 1.902956, 1, 0, 0, 1, 1,
-1.22216, 1.471295, 2.13369, 1, 0, 0, 1, 1,
-1.217745, -0.03057965, 0.2270291, 1, 0, 0, 1, 1,
-1.209065, 0.08448315, 0.02009038, 0, 0, 0, 1, 1,
-1.20559, -1.68882, -2.240919, 0, 0, 0, 1, 1,
-1.198564, -0.2598535, -1.205342, 0, 0, 0, 1, 1,
-1.195994, 0.363529, -0.1283399, 0, 0, 0, 1, 1,
-1.195226, 0.05029838, -2.003507, 0, 0, 0, 1, 1,
-1.187679, -1.04023, -1.053735, 0, 0, 0, 1, 1,
-1.184682, -0.7022568, -1.250905, 0, 0, 0, 1, 1,
-1.183923, -0.6127959, -3.822192, 1, 1, 1, 1, 1,
-1.181818, -0.4463304, -1.531279, 1, 1, 1, 1, 1,
-1.173751, -1.893621, -2.677255, 1, 1, 1, 1, 1,
-1.172179, 0.3685296, -1.806282, 1, 1, 1, 1, 1,
-1.166958, -0.9399133, -0.37933, 1, 1, 1, 1, 1,
-1.163388, -1.279432, -0.6216153, 1, 1, 1, 1, 1,
-1.162789, -1.677166, -0.5576297, 1, 1, 1, 1, 1,
-1.161781, -0.3981709, -1.540958, 1, 1, 1, 1, 1,
-1.155292, 0.2081395, -0.955848, 1, 1, 1, 1, 1,
-1.143159, 0.65942, -1.143175, 1, 1, 1, 1, 1,
-1.142231, -0.5104898, -1.284567, 1, 1, 1, 1, 1,
-1.139567, 1.154918, -1.029058, 1, 1, 1, 1, 1,
-1.135233, 0.2239148, 0.8795782, 1, 1, 1, 1, 1,
-1.129141, -0.492241, -1.902255, 1, 1, 1, 1, 1,
-1.122307, 1.045331, -1.228471, 1, 1, 1, 1, 1,
-1.111253, 1.549845, -0.5182075, 0, 0, 1, 1, 1,
-1.109984, -2.12901, -1.734414, 1, 0, 0, 1, 1,
-1.107412, -1.172439, -3.23049, 1, 0, 0, 1, 1,
-1.105449, -0.7389974, -2.935293, 1, 0, 0, 1, 1,
-1.101866, -0.1300399, -2.19293, 1, 0, 0, 1, 1,
-1.097283, 1.466777, -0.3447514, 1, 0, 0, 1, 1,
-1.096885, 0.8962411, 0.4991773, 0, 0, 0, 1, 1,
-1.092257, 0.4278068, -0.3856201, 0, 0, 0, 1, 1,
-1.085331, -1.0156, -1.332091, 0, 0, 0, 1, 1,
-1.080071, -0.8647045, -2.982754, 0, 0, 0, 1, 1,
-1.074688, -1.812893, -1.216704, 0, 0, 0, 1, 1,
-1.073552, -1.70578, -3.914871, 0, 0, 0, 1, 1,
-1.069835, -2.168277, -2.774391, 0, 0, 0, 1, 1,
-1.067564, 1.803229, 0.03272614, 1, 1, 1, 1, 1,
-1.064968, 0.7729223, -0.3603748, 1, 1, 1, 1, 1,
-1.064488, -0.7109613, -1.050395, 1, 1, 1, 1, 1,
-1.062768, -0.2624616, -2.083625, 1, 1, 1, 1, 1,
-1.053988, -0.6806355, -1.732597, 1, 1, 1, 1, 1,
-1.050601, 1.953985, -0.8737721, 1, 1, 1, 1, 1,
-1.04641, 0.7582083, -0.7334631, 1, 1, 1, 1, 1,
-1.037975, 0.2158049, -4.075157, 1, 1, 1, 1, 1,
-1.037489, 1.117726, -0.5402166, 1, 1, 1, 1, 1,
-1.036106, 0.643256, -0.8415344, 1, 1, 1, 1, 1,
-1.026589, 0.4264743, -1.219763, 1, 1, 1, 1, 1,
-1.025046, -2.01782, -4.96897, 1, 1, 1, 1, 1,
-1.021327, -0.4438041, -3.274611, 1, 1, 1, 1, 1,
-1.01322, 0.4057822, -2.317208, 1, 1, 1, 1, 1,
-1.005313, 0.4845129, -0.3268368, 1, 1, 1, 1, 1,
-1.003497, 0.3119159, -1.918449, 0, 0, 1, 1, 1,
-1.001899, 0.3626646, -1.905822, 1, 0, 0, 1, 1,
-1.001613, -0.256855, -1.948843, 1, 0, 0, 1, 1,
-1.000932, -0.4210185, -3.066728, 1, 0, 0, 1, 1,
-1.000154, -0.03597983, -3.083953, 1, 0, 0, 1, 1,
-0.9984128, 0.5700117, -3.36157, 1, 0, 0, 1, 1,
-0.9983389, -0.03161298, -0.6406657, 0, 0, 0, 1, 1,
-0.992285, -0.1491453, -2.135898, 0, 0, 0, 1, 1,
-0.9896271, 0.2091267, -2.642559, 0, 0, 0, 1, 1,
-0.9895925, -1.448619, -2.778831, 0, 0, 0, 1, 1,
-0.9893144, -0.3246465, -0.06629119, 0, 0, 0, 1, 1,
-0.985692, 0.5871314, 2.252358, 0, 0, 0, 1, 1,
-0.9856148, -1.656934, -1.047386, 0, 0, 0, 1, 1,
-0.9850475, -0.3186241, -1.306004, 1, 1, 1, 1, 1,
-0.981366, -0.03594952, -1.65173, 1, 1, 1, 1, 1,
-0.979425, 0.8654737, 0.451851, 1, 1, 1, 1, 1,
-0.9790859, -0.1527881, -0.3266031, 1, 1, 1, 1, 1,
-0.9775162, -1.492319, -2.500072, 1, 1, 1, 1, 1,
-0.9758886, 0.5509881, -0.4062361, 1, 1, 1, 1, 1,
-0.9742814, -0.5758607, -1.589142, 1, 1, 1, 1, 1,
-0.971611, 0.2585585, 0.306535, 1, 1, 1, 1, 1,
-0.9714703, 0.3783666, -2.996171, 1, 1, 1, 1, 1,
-0.9649017, 2.298119, -2.02894, 1, 1, 1, 1, 1,
-0.964766, 0.472701, 1.219643, 1, 1, 1, 1, 1,
-0.961679, -0.1976204, -1.858529, 1, 1, 1, 1, 1,
-0.9604083, -0.549022, -1.938877, 1, 1, 1, 1, 1,
-0.9603029, -0.9926826, -4.769751, 1, 1, 1, 1, 1,
-0.955475, 0.3020337, -0.5489185, 1, 1, 1, 1, 1,
-0.9503199, -1.076258, -3.825613, 0, 0, 1, 1, 1,
-0.9470373, -0.1958549, -2.764909, 1, 0, 0, 1, 1,
-0.9421658, 0.1866617, 0.3091832, 1, 0, 0, 1, 1,
-0.9319258, 0.4216927, -0.8865428, 1, 0, 0, 1, 1,
-0.9239256, -0.5788816, -2.231004, 1, 0, 0, 1, 1,
-0.9226493, 1.532794, -0.1818075, 1, 0, 0, 1, 1,
-0.9220879, 2.457277, -0.3283838, 0, 0, 0, 1, 1,
-0.9193917, 0.01581673, -0.9325949, 0, 0, 0, 1, 1,
-0.9062579, -0.6655354, -1.891323, 0, 0, 0, 1, 1,
-0.9052365, 0.08712862, -2.281074, 0, 0, 0, 1, 1,
-0.904686, -1.238256, -2.888032, 0, 0, 0, 1, 1,
-0.8920686, -0.9396011, -2.10862, 0, 0, 0, 1, 1,
-0.8906716, -0.3760845, -0.1878558, 0, 0, 0, 1, 1,
-0.8866628, 0.5373163, -1.659191, 1, 1, 1, 1, 1,
-0.8858353, 1.645087, 1.416954, 1, 1, 1, 1, 1,
-0.8793547, 0.3776847, -1.746695, 1, 1, 1, 1, 1,
-0.8770416, -1.690459, -0.908232, 1, 1, 1, 1, 1,
-0.8768176, 0.6907679, 0.1574543, 1, 1, 1, 1, 1,
-0.8739531, 0.6163355, -1.597196, 1, 1, 1, 1, 1,
-0.8673551, 1.138038, -0.9103453, 1, 1, 1, 1, 1,
-0.8597084, -0.6774174, -2.771757, 1, 1, 1, 1, 1,
-0.8540464, 1.510169, -1.011746, 1, 1, 1, 1, 1,
-0.8484049, -0.741115, -2.348371, 1, 1, 1, 1, 1,
-0.8467703, 1.295771, -0.3727057, 1, 1, 1, 1, 1,
-0.8462632, 0.3735895, -0.8571668, 1, 1, 1, 1, 1,
-0.8450395, -0.970947, -1.137326, 1, 1, 1, 1, 1,
-0.8449928, 0.7565431, 1.215082, 1, 1, 1, 1, 1,
-0.8397588, 0.4818635, -0.04627477, 1, 1, 1, 1, 1,
-0.8372542, -0.1958796, -2.122405, 0, 0, 1, 1, 1,
-0.8256393, 0.1395192, -2.267751, 1, 0, 0, 1, 1,
-0.822041, 0.7587666, 0.2460252, 1, 0, 0, 1, 1,
-0.8132131, -0.7389816, -1.761234, 1, 0, 0, 1, 1,
-0.8093258, 0.1098727, -0.05289005, 1, 0, 0, 1, 1,
-0.8058025, -0.7280315, -1.861686, 1, 0, 0, 1, 1,
-0.8052071, 0.7269643, 0.7349635, 0, 0, 0, 1, 1,
-0.8049015, 0.6315649, -1.33398, 0, 0, 0, 1, 1,
-0.8015959, 0.6784888, -1.667329, 0, 0, 0, 1, 1,
-0.8009133, -0.3021003, -1.089532, 0, 0, 0, 1, 1,
-0.8004744, 1.891279, -0.1954678, 0, 0, 0, 1, 1,
-0.7973651, 0.6402239, -0.342456, 0, 0, 0, 1, 1,
-0.7966882, 0.4585005, -0.9679253, 0, 0, 0, 1, 1,
-0.7949389, 0.2774057, -0.9683981, 1, 1, 1, 1, 1,
-0.7935387, -0.8091379, -2.767484, 1, 1, 1, 1, 1,
-0.7928379, 1.21273, -0.677286, 1, 1, 1, 1, 1,
-0.7917005, -0.5564017, -2.679637, 1, 1, 1, 1, 1,
-0.7888991, -0.1897759, -1.288636, 1, 1, 1, 1, 1,
-0.7856711, -0.00319648, -1.775959, 1, 1, 1, 1, 1,
-0.7801265, 0.9990135, -0.09161004, 1, 1, 1, 1, 1,
-0.7793222, 0.167502, 0.2783976, 1, 1, 1, 1, 1,
-0.7780748, -0.1449514, -1.758741, 1, 1, 1, 1, 1,
-0.7743026, -0.4210216, -2.571309, 1, 1, 1, 1, 1,
-0.7665994, 1.335224, -0.6652625, 1, 1, 1, 1, 1,
-0.7585499, -1.667413, -2.466186, 1, 1, 1, 1, 1,
-0.7530324, -0.03823867, -2.117536, 1, 1, 1, 1, 1,
-0.7529845, 0.7161981, -0.9688494, 1, 1, 1, 1, 1,
-0.7478566, 0.2767604, 0.4669705, 1, 1, 1, 1, 1,
-0.740267, -0.790924, -2.895773, 0, 0, 1, 1, 1,
-0.7372299, -0.6857934, -0.3736309, 1, 0, 0, 1, 1,
-0.7354686, -0.2014757, -0.4591618, 1, 0, 0, 1, 1,
-0.7326375, -1.137241, -2.0851, 1, 0, 0, 1, 1,
-0.7325959, -0.52681, -1.87592, 1, 0, 0, 1, 1,
-0.7310374, -1.874864, -3.723584, 1, 0, 0, 1, 1,
-0.7259861, 1.224632, 1.313357, 0, 0, 0, 1, 1,
-0.7222596, -0.8373057, -2.751518, 0, 0, 0, 1, 1,
-0.7193114, -0.6096828, -1.948498, 0, 0, 0, 1, 1,
-0.7183182, -0.4122096, -1.612957, 0, 0, 0, 1, 1,
-0.7157854, -0.3940944, -4.529315, 0, 0, 0, 1, 1,
-0.713632, -0.2120082, -1.568553, 0, 0, 0, 1, 1,
-0.7122135, 0.6802158, -0.7120873, 0, 0, 0, 1, 1,
-0.7043122, -0.2929834, -2.910741, 1, 1, 1, 1, 1,
-0.7019463, -0.7926213, -1.666459, 1, 1, 1, 1, 1,
-0.7012258, -0.3592029, -2.021491, 1, 1, 1, 1, 1,
-0.6881399, -1.314412, -4.149109, 1, 1, 1, 1, 1,
-0.6847088, -0.1495479, -3.746676, 1, 1, 1, 1, 1,
-0.6773615, -0.1854218, -1.237745, 1, 1, 1, 1, 1,
-0.6764246, 0.2654955, -1.438982, 1, 1, 1, 1, 1,
-0.6753016, -0.2345974, -2.688559, 1, 1, 1, 1, 1,
-0.6749984, 0.3816452, 0.1460908, 1, 1, 1, 1, 1,
-0.6633024, 0.0631085, -1.160653, 1, 1, 1, 1, 1,
-0.6579303, 0.1934304, -2.464657, 1, 1, 1, 1, 1,
-0.6568998, -0.4649611, -0.1886284, 1, 1, 1, 1, 1,
-0.6463466, -0.1385567, -2.166464, 1, 1, 1, 1, 1,
-0.641112, 1.835228, -1.153115, 1, 1, 1, 1, 1,
-0.6403571, 2.112349, -0.8724873, 1, 1, 1, 1, 1,
-0.6379505, -1.732841, -4.41206, 0, 0, 1, 1, 1,
-0.6302822, 0.07201203, 0.3124325, 1, 0, 0, 1, 1,
-0.6263797, -0.4567232, -1.293621, 1, 0, 0, 1, 1,
-0.6241131, 0.03425207, -2.014579, 1, 0, 0, 1, 1,
-0.6092045, 0.2380686, -1.300909, 1, 0, 0, 1, 1,
-0.6087937, 0.9051404, -1.687273, 1, 0, 0, 1, 1,
-0.6062848, -0.5930023, -2.944113, 0, 0, 0, 1, 1,
-0.605715, -0.7847429, -1.566109, 0, 0, 0, 1, 1,
-0.6046356, 1.150411, 0.6204692, 0, 0, 0, 1, 1,
-0.5977818, -1.071093, -1.781636, 0, 0, 0, 1, 1,
-0.5940282, 0.2065662, -1.1962, 0, 0, 0, 1, 1,
-0.5931834, 0.2446771, -1.824564, 0, 0, 0, 1, 1,
-0.5873531, -0.225522, -3.382037, 0, 0, 0, 1, 1,
-0.5866341, -0.6510827, -2.94191, 1, 1, 1, 1, 1,
-0.5859838, 0.08266946, -1.361208, 1, 1, 1, 1, 1,
-0.5857655, 0.3733636, -1.690961, 1, 1, 1, 1, 1,
-0.5815635, -0.43724, -2.603151, 1, 1, 1, 1, 1,
-0.5809443, 1.040388, -1.837217, 1, 1, 1, 1, 1,
-0.5758294, 0.2033483, -1.153734, 1, 1, 1, 1, 1,
-0.5722779, -0.3583786, -1.522408, 1, 1, 1, 1, 1,
-0.5713403, -0.405441, -1.566719, 1, 1, 1, 1, 1,
-0.5680608, 0.5205063, 0.6474819, 1, 1, 1, 1, 1,
-0.5666024, -0.09954578, -4.2138, 1, 1, 1, 1, 1,
-0.5665464, -0.9824703, -0.436513, 1, 1, 1, 1, 1,
-0.5613837, 0.1391109, -1.846548, 1, 1, 1, 1, 1,
-0.5592943, -1.588595, -3.835004, 1, 1, 1, 1, 1,
-0.5543538, 0.9730217, -1.044223, 1, 1, 1, 1, 1,
-0.550777, 1.304156, 2.292611, 1, 1, 1, 1, 1,
-0.549788, 1.135509, -2.42711, 0, 0, 1, 1, 1,
-0.5496503, 1.166465, 1.182608, 1, 0, 0, 1, 1,
-0.5463942, 1.754237, 0.7460636, 1, 0, 0, 1, 1,
-0.5389691, 0.2867777, -0.3846589, 1, 0, 0, 1, 1,
-0.5373544, -0.5720521, -1.335212, 1, 0, 0, 1, 1,
-0.5371448, 1.274929, 2.604132, 1, 0, 0, 1, 1,
-0.537083, 0.9558451, 1.053264, 0, 0, 0, 1, 1,
-0.5366393, 1.370797, -0.371151, 0, 0, 0, 1, 1,
-0.5361571, -0.5115726, -3.490888, 0, 0, 0, 1, 1,
-0.536033, -0.4331826, -1.815429, 0, 0, 0, 1, 1,
-0.5353777, -1.221371, -3.887011, 0, 0, 0, 1, 1,
-0.5342826, -0.8338677, -2.699486, 0, 0, 0, 1, 1,
-0.5339754, -0.1849799, -3.380497, 0, 0, 0, 1, 1,
-0.5280636, 0.8604265, -0.2784991, 1, 1, 1, 1, 1,
-0.5205513, -0.1622805, -2.403413, 1, 1, 1, 1, 1,
-0.5173264, 0.8103226, -0.1739471, 1, 1, 1, 1, 1,
-0.5170438, 0.2005413, -2.031829, 1, 1, 1, 1, 1,
-0.512616, -0.3847225, -3.810455, 1, 1, 1, 1, 1,
-0.5125205, -0.7520255, -1.00555, 1, 1, 1, 1, 1,
-0.5121561, -0.8246837, -1.374979, 1, 1, 1, 1, 1,
-0.5033625, 0.04928389, -1.201882, 1, 1, 1, 1, 1,
-0.4976218, -0.9939732, -2.382706, 1, 1, 1, 1, 1,
-0.4948226, 0.5640784, -0.6607591, 1, 1, 1, 1, 1,
-0.4924366, 0.5806506, 0.3214373, 1, 1, 1, 1, 1,
-0.4923936, 1.459245, 0.3461994, 1, 1, 1, 1, 1,
-0.4898948, 1.321411, -1.717472, 1, 1, 1, 1, 1,
-0.48751, 0.1856959, -1.909011, 1, 1, 1, 1, 1,
-0.4840291, 1.390081, 0.09524422, 1, 1, 1, 1, 1,
-0.4832593, -1.133474, -2.713455, 0, 0, 1, 1, 1,
-0.4737931, 1.376673, -0.07953452, 1, 0, 0, 1, 1,
-0.4694929, 1.338084, -1.064501, 1, 0, 0, 1, 1,
-0.4690469, -0.3859038, -2.637568, 1, 0, 0, 1, 1,
-0.4670444, -0.9654381, -1.744972, 1, 0, 0, 1, 1,
-0.4651425, -0.6981995, -2.911808, 1, 0, 0, 1, 1,
-0.4626128, 0.4351051, 0.01389793, 0, 0, 0, 1, 1,
-0.4553929, -0.7292811, -4.360236, 0, 0, 0, 1, 1,
-0.4534471, 0.547208, 0.1079712, 0, 0, 0, 1, 1,
-0.4526296, 0.5291526, -0.526332, 0, 0, 0, 1, 1,
-0.4461026, 0.5894681, -0.1313688, 0, 0, 0, 1, 1,
-0.4429219, -0.184577, -1.597686, 0, 0, 0, 1, 1,
-0.4392822, 0.7382811, 0.355735, 0, 0, 0, 1, 1,
-0.4366928, 0.2363363, -2.026077, 1, 1, 1, 1, 1,
-0.4334385, 0.9310457, -0.7210394, 1, 1, 1, 1, 1,
-0.4304886, 0.7887267, -1.408824, 1, 1, 1, 1, 1,
-0.4300366, 0.7930396, -1.141695, 1, 1, 1, 1, 1,
-0.4277156, -0.329042, -2.618896, 1, 1, 1, 1, 1,
-0.4232648, 2.152266, 0.2641088, 1, 1, 1, 1, 1,
-0.4199112, -1.22162, -3.413031, 1, 1, 1, 1, 1,
-0.4170666, -0.04005553, -2.413136, 1, 1, 1, 1, 1,
-0.4112583, 0.7666146, -0.9391538, 1, 1, 1, 1, 1,
-0.4101029, 1.287995, -1.989536, 1, 1, 1, 1, 1,
-0.4094616, 1.327012, -0.6418679, 1, 1, 1, 1, 1,
-0.4092117, 1.193909, -1.441513, 1, 1, 1, 1, 1,
-0.4060583, 0.7935937, 0.3751981, 1, 1, 1, 1, 1,
-0.4026253, -0.2967957, -2.039575, 1, 1, 1, 1, 1,
-0.3990533, -0.5984344, -0.6621941, 1, 1, 1, 1, 1,
-0.3980261, -1.676818, -2.508827, 0, 0, 1, 1, 1,
-0.3966353, 0.5176969, -0.3619976, 1, 0, 0, 1, 1,
-0.3962753, -0.8728233, -1.209145, 1, 0, 0, 1, 1,
-0.3955451, 1.388494, -2.218582, 1, 0, 0, 1, 1,
-0.3863913, 0.2246774, -1.368059, 1, 0, 0, 1, 1,
-0.3863746, 1.326745, 0.6027681, 1, 0, 0, 1, 1,
-0.375349, 0.3729773, -0.5298811, 0, 0, 0, 1, 1,
-0.3707932, 0.1369336, -1.203276, 0, 0, 0, 1, 1,
-0.3698678, 0.2122212, -2.100523, 0, 0, 0, 1, 1,
-0.3677159, -1.648324, -1.551904, 0, 0, 0, 1, 1,
-0.3676035, -0.500826, -2.825973, 0, 0, 0, 1, 1,
-0.3674964, 0.02680496, 0.2085258, 0, 0, 0, 1, 1,
-0.3653582, -1.34321, -2.490806, 0, 0, 0, 1, 1,
-0.3650867, 0.5947565, -0.2657968, 1, 1, 1, 1, 1,
-0.3628163, -0.2482961, -3.632094, 1, 1, 1, 1, 1,
-0.3627687, -0.07783962, -0.4651874, 1, 1, 1, 1, 1,
-0.3592114, 1.589674, 0.2334194, 1, 1, 1, 1, 1,
-0.3526191, -0.2996006, -1.325319, 1, 1, 1, 1, 1,
-0.3485954, -1.193556, -2.370392, 1, 1, 1, 1, 1,
-0.3463268, -0.6028756, -2.487064, 1, 1, 1, 1, 1,
-0.3443828, 0.2396981, -1.103295, 1, 1, 1, 1, 1,
-0.3387972, 1.228301, 0.5033273, 1, 1, 1, 1, 1,
-0.3385637, 1.413786, 1.366464, 1, 1, 1, 1, 1,
-0.3381414, -1.073678, -3.535427, 1, 1, 1, 1, 1,
-0.3362071, 1.233343, 1.443151, 1, 1, 1, 1, 1,
-0.3337922, 0.8071935, -0.8229072, 1, 1, 1, 1, 1,
-0.3322136, 0.04659231, -0.9955516, 1, 1, 1, 1, 1,
-0.3320503, -1.071481, -1.960259, 1, 1, 1, 1, 1,
-0.3310867, -0.2364203, -2.446884, 0, 0, 1, 1, 1,
-0.3293171, 1.08352, 0.2022857, 1, 0, 0, 1, 1,
-0.3291537, 0.9090431, -0.4495056, 1, 0, 0, 1, 1,
-0.3290718, -1.353177, -1.757591, 1, 0, 0, 1, 1,
-0.3206495, -0.7307325, -4.374005, 1, 0, 0, 1, 1,
-0.3185768, -1.525692, -2.51655, 1, 0, 0, 1, 1,
-0.3120587, 0.03586774, -4.240183, 0, 0, 0, 1, 1,
-0.3084259, 1.137177, -0.01431832, 0, 0, 0, 1, 1,
-0.3054043, -1.1312, -2.070188, 0, 0, 0, 1, 1,
-0.3035923, 0.08247844, -0.3153442, 0, 0, 0, 1, 1,
-0.3031457, 1.010495, -0.6192911, 0, 0, 0, 1, 1,
-0.2978741, 0.9293619, -2.044661, 0, 0, 0, 1, 1,
-0.2957623, -0.226875, -3.581242, 0, 0, 0, 1, 1,
-0.2941926, -0.1183819, -0.1568165, 1, 1, 1, 1, 1,
-0.2930836, 0.1658131, 0.417483, 1, 1, 1, 1, 1,
-0.2921948, 0.5037001, -0.394137, 1, 1, 1, 1, 1,
-0.2912775, 0.1875295, -1.180138, 1, 1, 1, 1, 1,
-0.2904128, -0.5842804, -3.863451, 1, 1, 1, 1, 1,
-0.2823118, -0.1303346, -2.85295, 1, 1, 1, 1, 1,
-0.2779964, -1.225621, -1.454494, 1, 1, 1, 1, 1,
-0.2777846, -0.07671656, -2.155389, 1, 1, 1, 1, 1,
-0.2758549, 1.043502, -0.7253703, 1, 1, 1, 1, 1,
-0.2750471, -0.932557, -2.88976, 1, 1, 1, 1, 1,
-0.271339, -1.33604, -3.837217, 1, 1, 1, 1, 1,
-0.2704692, 0.7147203, 0.8741124, 1, 1, 1, 1, 1,
-0.2693574, 0.7009063, 0.9058051, 1, 1, 1, 1, 1,
-0.2692323, -0.2045601, -2.164556, 1, 1, 1, 1, 1,
-0.2689301, 0.8065081, 0.1222606, 1, 1, 1, 1, 1,
-0.2682967, -2.336671, -3.212657, 0, 0, 1, 1, 1,
-0.2666305, -0.1472969, -2.583061, 1, 0, 0, 1, 1,
-0.2649184, -1.014262, -2.968846, 1, 0, 0, 1, 1,
-0.2605867, 0.1192836, -2.324265, 1, 0, 0, 1, 1,
-0.259434, -1.021734, -3.691739, 1, 0, 0, 1, 1,
-0.2591822, 0.9565602, -0.4096105, 1, 0, 0, 1, 1,
-0.2559803, 1.408901, 0.6314739, 0, 0, 0, 1, 1,
-0.2553525, 0.8650657, -0.8319512, 0, 0, 0, 1, 1,
-0.2551301, 0.9747998, -0.2963567, 0, 0, 0, 1, 1,
-0.250338, -1.331059, -2.875233, 0, 0, 0, 1, 1,
-0.2460789, 1.084312, -2.23434, 0, 0, 0, 1, 1,
-0.2441845, -1.343636, -2.202637, 0, 0, 0, 1, 1,
-0.2430962, -0.2732041, -3.212298, 0, 0, 0, 1, 1,
-0.2374039, -0.6062512, -3.656067, 1, 1, 1, 1, 1,
-0.2364559, -0.1578882, -2.042712, 1, 1, 1, 1, 1,
-0.2342325, 0.9265165, -0.6741982, 1, 1, 1, 1, 1,
-0.2226006, -2.114056, -3.672319, 1, 1, 1, 1, 1,
-0.2222625, 1.887141, -1.157096, 1, 1, 1, 1, 1,
-0.2191654, 0.7151961, -0.9171987, 1, 1, 1, 1, 1,
-0.2160257, -0.1298656, -4.012952, 1, 1, 1, 1, 1,
-0.2137599, 0.9390047, -0.5017707, 1, 1, 1, 1, 1,
-0.208117, 0.06465684, -1.849783, 1, 1, 1, 1, 1,
-0.2078587, -0.603572, -2.788924, 1, 1, 1, 1, 1,
-0.2049134, 1.841992, 1.485011, 1, 1, 1, 1, 1,
-0.1982364, -0.08815975, -0.6112453, 1, 1, 1, 1, 1,
-0.198072, -0.7458042, -2.354092, 1, 1, 1, 1, 1,
-0.1966844, 1.138509, -0.2157421, 1, 1, 1, 1, 1,
-0.1960958, -0.2037664, -2.801809, 1, 1, 1, 1, 1,
-0.1952961, -1.508548, -2.882736, 0, 0, 1, 1, 1,
-0.1938124, -1.112602, -3.524258, 1, 0, 0, 1, 1,
-0.188485, -0.7753341, -2.498547, 1, 0, 0, 1, 1,
-0.1875647, 1.024755, -0.5327668, 1, 0, 0, 1, 1,
-0.1874442, 0.4548313, -0.9523751, 1, 0, 0, 1, 1,
-0.186478, 0.8290645, 0.5430297, 1, 0, 0, 1, 1,
-0.1830131, -2.092603, -4.358418, 0, 0, 0, 1, 1,
-0.1823088, -0.08325766, -0.5537193, 0, 0, 0, 1, 1,
-0.1803175, -3.061183, -1.466671, 0, 0, 0, 1, 1,
-0.176143, 1.528821, 0.1504502, 0, 0, 0, 1, 1,
-0.1754897, 0.2770989, -1.534594, 0, 0, 0, 1, 1,
-0.1752715, 1.50855, -0.1303712, 0, 0, 0, 1, 1,
-0.1723996, 0.9495559, 2.048408, 0, 0, 0, 1, 1,
-0.1718137, -1.428583, -2.113337, 1, 1, 1, 1, 1,
-0.1630547, 0.6289443, -1.377321, 1, 1, 1, 1, 1,
-0.1589789, -1.224352, -2.449413, 1, 1, 1, 1, 1,
-0.1583389, 1.2196, -0.07397613, 1, 1, 1, 1, 1,
-0.1582552, -0.5297025, -2.533864, 1, 1, 1, 1, 1,
-0.1575184, 0.8945604, 0.2772715, 1, 1, 1, 1, 1,
-0.1525645, 0.08512037, -1.594026, 1, 1, 1, 1, 1,
-0.152557, -0.3563894, -3.487827, 1, 1, 1, 1, 1,
-0.1510098, 0.2670644, -0.4927353, 1, 1, 1, 1, 1,
-0.1479075, -0.6783265, -2.442969, 1, 1, 1, 1, 1,
-0.1464011, -0.3235715, -2.644905, 1, 1, 1, 1, 1,
-0.1445067, -1.533996, -2.966057, 1, 1, 1, 1, 1,
-0.1443548, -1.636165, -3.872358, 1, 1, 1, 1, 1,
-0.1436399, -2.007894, -3.260875, 1, 1, 1, 1, 1,
-0.1331918, 0.8131519, -0.1861457, 1, 1, 1, 1, 1,
-0.1329634, -0.1931693, -3.916582, 0, 0, 1, 1, 1,
-0.1326651, 0.1764137, 0.9990433, 1, 0, 0, 1, 1,
-0.1294939, 0.4099482, -0.2039046, 1, 0, 0, 1, 1,
-0.1255641, 0.09686594, 0.8644969, 1, 0, 0, 1, 1,
-0.1236658, 1.476918, 0.2712876, 1, 0, 0, 1, 1,
-0.1126593, -0.3425518, -1.353602, 1, 0, 0, 1, 1,
-0.1104971, -0.9175859, -4.185146, 0, 0, 0, 1, 1,
-0.1090146, 1.074677, -0.2894713, 0, 0, 0, 1, 1,
-0.1080163, 1.482378, 1.690961, 0, 0, 0, 1, 1,
-0.1053052, -1.510453, -4.038527, 0, 0, 0, 1, 1,
-0.1051145, -0.671758, -2.380122, 0, 0, 0, 1, 1,
-0.1035376, -0.6317229, -1.100974, 0, 0, 0, 1, 1,
-0.103348, -0.5487317, -2.054725, 0, 0, 0, 1, 1,
-0.1027547, 1.403934, 1.131389, 1, 1, 1, 1, 1,
-0.09797607, 0.7724856, 0.07669814, 1, 1, 1, 1, 1,
-0.09547541, -1.114434, -4.464734, 1, 1, 1, 1, 1,
-0.09143118, 1.09431, 0.9356106, 1, 1, 1, 1, 1,
-0.08940692, -0.1820549, -3.32708, 1, 1, 1, 1, 1,
-0.08038876, 0.9365065, -0.6513388, 1, 1, 1, 1, 1,
-0.07589006, 0.3705311, -0.3697487, 1, 1, 1, 1, 1,
-0.06733346, -0.5366312, -2.360504, 1, 1, 1, 1, 1,
-0.06695367, 0.08629827, -1.567536, 1, 1, 1, 1, 1,
-0.06367328, -0.302981, -3.158836, 1, 1, 1, 1, 1,
-0.06333071, 1.127956, -0.6297193, 1, 1, 1, 1, 1,
-0.06190149, 0.2081876, 0.5576512, 1, 1, 1, 1, 1,
-0.06136432, 1.4167, 1.498569, 1, 1, 1, 1, 1,
-0.05970532, 0.9984176, -0.2567562, 1, 1, 1, 1, 1,
-0.05547659, 0.7686853, -0.3670732, 1, 1, 1, 1, 1,
-0.05444893, -0.6830271, -1.116798, 0, 0, 1, 1, 1,
-0.05262644, -0.0617156, -2.732097, 1, 0, 0, 1, 1,
-0.05246468, 0.4945717, -0.3759794, 1, 0, 0, 1, 1,
-0.04811167, -0.1619841, -2.091999, 1, 0, 0, 1, 1,
-0.04678961, 1.815519, -0.5817924, 1, 0, 0, 1, 1,
-0.04419643, -0.9232948, -3.279631, 1, 0, 0, 1, 1,
-0.04190495, 0.9555516, -1.139442, 0, 0, 0, 1, 1,
-0.04076904, -0.9478512, -3.919352, 0, 0, 0, 1, 1,
-0.03932144, 0.8709424, -1.041042, 0, 0, 0, 1, 1,
-0.03166391, -0.8592032, -2.82802, 0, 0, 0, 1, 1,
-0.03056498, -0.9618407, -4.346821, 0, 0, 0, 1, 1,
-0.02745488, 1.842236, 0.001407161, 0, 0, 0, 1, 1,
-0.02292529, 0.9653385, 0.1046185, 0, 0, 0, 1, 1,
-0.02196541, -0.6470268, -2.347698, 1, 1, 1, 1, 1,
-0.02093452, -1.287627, -4.486178, 1, 1, 1, 1, 1,
-0.02043212, 0.3677245, -0.2251274, 1, 1, 1, 1, 1,
-0.01722091, -0.6327553, -2.297131, 1, 1, 1, 1, 1,
-0.01585792, -2.296864, -3.69137, 1, 1, 1, 1, 1,
-0.01292138, 1.232627, 0.2978415, 1, 1, 1, 1, 1,
-0.01220788, -1.164831, -2.74682, 1, 1, 1, 1, 1,
-0.01061691, -0.8663814, -3.18209, 1, 1, 1, 1, 1,
-0.009006793, -0.276612, -3.540776, 1, 1, 1, 1, 1,
-0.008938515, -0.6686518, -3.713996, 1, 1, 1, 1, 1,
-0.00188747, 0.1527116, -0.1514386, 1, 1, 1, 1, 1,
5.752617e-05, -1.746246, 2.312901, 1, 1, 1, 1, 1,
0.007839398, -0.3448019, 3.845326, 1, 1, 1, 1, 1,
0.008366302, -0.5583502, 4.109792, 1, 1, 1, 1, 1,
0.01069961, 0.6288688, -0.04335408, 1, 1, 1, 1, 1,
0.01795908, -1.16578, 4.576532, 0, 0, 1, 1, 1,
0.02230316, 0.695243, 1.181602, 1, 0, 0, 1, 1,
0.03220768, -0.5801961, 3.492852, 1, 0, 0, 1, 1,
0.03316629, 0.08013099, 1.040207, 1, 0, 0, 1, 1,
0.03727457, 0.6412726, 0.636772, 1, 0, 0, 1, 1,
0.04013535, -1.088842, 2.682624, 1, 0, 0, 1, 1,
0.04408603, -0.2848055, 2.796824, 0, 0, 0, 1, 1,
0.05047607, -0.1369479, 1.377303, 0, 0, 0, 1, 1,
0.05234641, -0.7289299, 1.930503, 0, 0, 0, 1, 1,
0.05280766, 0.6047238, 0.3776091, 0, 0, 0, 1, 1,
0.0605063, -1.288896, 4.177431, 0, 0, 0, 1, 1,
0.061049, 0.4612036, -0.768831, 0, 0, 0, 1, 1,
0.06504153, -0.03912444, 2.239216, 0, 0, 0, 1, 1,
0.06636719, -0.6601798, 4.322359, 1, 1, 1, 1, 1,
0.06690457, -0.4853643, 1.859661, 1, 1, 1, 1, 1,
0.0694247, -0.6745928, 5.026129, 1, 1, 1, 1, 1,
0.07415492, 1.158053, 0.7315459, 1, 1, 1, 1, 1,
0.07461638, -0.9271299, 2.615256, 1, 1, 1, 1, 1,
0.08261612, 2.278073, -1.282279, 1, 1, 1, 1, 1,
0.08540184, -0.5986079, 3.041096, 1, 1, 1, 1, 1,
0.08926631, 1.57872, -0.03181683, 1, 1, 1, 1, 1,
0.0939291, -0.3677349, 2.770156, 1, 1, 1, 1, 1,
0.09499384, -0.5964916, 2.522558, 1, 1, 1, 1, 1,
0.09596257, -0.04495928, 1.951213, 1, 1, 1, 1, 1,
0.1012994, -1.246455, 4.37985, 1, 1, 1, 1, 1,
0.1036353, -1.004115, 3.811559, 1, 1, 1, 1, 1,
0.1038315, 0.5966233, 0.9359846, 1, 1, 1, 1, 1,
0.1077776, -1.571105, 2.104388, 1, 1, 1, 1, 1,
0.113298, 0.255936, 0.4727932, 0, 0, 1, 1, 1,
0.11482, -0.5812599, 5.007273, 1, 0, 0, 1, 1,
0.1167925, -1.173515, 2.906802, 1, 0, 0, 1, 1,
0.1194283, -0.6420826, 2.690043, 1, 0, 0, 1, 1,
0.1228244, 1.102973, -0.3911384, 1, 0, 0, 1, 1,
0.1247597, -1.521415, 2.96585, 1, 0, 0, 1, 1,
0.1270293, 0.4318143, 1.145437, 0, 0, 0, 1, 1,
0.128935, -0.1989102, 0.7093787, 0, 0, 0, 1, 1,
0.1295873, 0.9423378, -0.5032288, 0, 0, 0, 1, 1,
0.1336555, 0.3181762, 0.6365904, 0, 0, 0, 1, 1,
0.1347956, -0.3902152, 3.451769, 0, 0, 0, 1, 1,
0.1377798, -0.5444843, 3.009767, 0, 0, 0, 1, 1,
0.1395947, 0.693274, -1.461748, 0, 0, 0, 1, 1,
0.1404082, 1.031983, 0.9209902, 1, 1, 1, 1, 1,
0.1426005, 0.5476659, -0.3206291, 1, 1, 1, 1, 1,
0.1444076, -0.4104032, 4.755628, 1, 1, 1, 1, 1,
0.145279, -0.4090019, 3.080188, 1, 1, 1, 1, 1,
0.1458072, -0.5359933, 3.711891, 1, 1, 1, 1, 1,
0.1481511, 0.3656491, 0.0004699053, 1, 1, 1, 1, 1,
0.1513585, -0.4441194, 2.963865, 1, 1, 1, 1, 1,
0.158115, 0.1604519, 2.068287, 1, 1, 1, 1, 1,
0.1595327, 1.487953, 0.03226726, 1, 1, 1, 1, 1,
0.1613043, -0.4639531, 2.791086, 1, 1, 1, 1, 1,
0.1623775, 0.3413878, 0.2262255, 1, 1, 1, 1, 1,
0.1640612, -0.8750107, 2.620672, 1, 1, 1, 1, 1,
0.1648526, 1.220247, 1.639144, 1, 1, 1, 1, 1,
0.1675176, 0.3456629, -0.04860413, 1, 1, 1, 1, 1,
0.1675456, 2.715617, -0.1917712, 1, 1, 1, 1, 1,
0.1708415, -1.786315, 3.263103, 0, 0, 1, 1, 1,
0.1741003, -0.5394178, 3.435071, 1, 0, 0, 1, 1,
0.1745363, 0.7762865, -0.5581564, 1, 0, 0, 1, 1,
0.1747417, -2.232495, 2.860288, 1, 0, 0, 1, 1,
0.1782515, -1.500624, 3.433646, 1, 0, 0, 1, 1,
0.1813979, -1.514063, 1.108644, 1, 0, 0, 1, 1,
0.1874708, 0.00769515, 1.889471, 0, 0, 0, 1, 1,
0.1880342, 0.6952457, -0.2286983, 0, 0, 0, 1, 1,
0.18934, 0.3822958, 1.760433, 0, 0, 0, 1, 1,
0.1914742, 0.2813835, 2.254545, 0, 0, 0, 1, 1,
0.1922315, 0.5148456, 1.360292, 0, 0, 0, 1, 1,
0.1960226, -0.598296, 3.503443, 0, 0, 0, 1, 1,
0.1990972, 0.2659574, -0.2038814, 0, 0, 0, 1, 1,
0.1990988, -0.1281823, 2.275585, 1, 1, 1, 1, 1,
0.2035691, 1.655109, -0.1513015, 1, 1, 1, 1, 1,
0.2071251, 1.097705, -0.3590348, 1, 1, 1, 1, 1,
0.2095361, 1.097336, 1.190701, 1, 1, 1, 1, 1,
0.2112783, 0.8190206, 0.2548826, 1, 1, 1, 1, 1,
0.2122511, -2.935781, 1.437083, 1, 1, 1, 1, 1,
0.2140881, -0.1619705, 3.291196, 1, 1, 1, 1, 1,
0.2195541, -0.09611482, 2.536259, 1, 1, 1, 1, 1,
0.2199762, 1.199202, -0.5386332, 1, 1, 1, 1, 1,
0.2202027, 0.7001054, 0.8917718, 1, 1, 1, 1, 1,
0.220608, 0.6809523, 0.2373807, 1, 1, 1, 1, 1,
0.2209714, 1.904867, -1.283836, 1, 1, 1, 1, 1,
0.2238501, -1.328351, 2.745103, 1, 1, 1, 1, 1,
0.2267047, -1.354137, 3.300807, 1, 1, 1, 1, 1,
0.226989, -0.8503445, 1.503402, 1, 1, 1, 1, 1,
0.2287092, 1.183176, 0.00896569, 0, 0, 1, 1, 1,
0.229811, 0.3193547, 2.866058, 1, 0, 0, 1, 1,
0.2299153, 0.449269, 0.1348151, 1, 0, 0, 1, 1,
0.2329386, -0.3430127, 1.646118, 1, 0, 0, 1, 1,
0.2356337, 2.072901, 0.5221216, 1, 0, 0, 1, 1,
0.2364531, -0.214185, 3.035197, 1, 0, 0, 1, 1,
0.2384565, 0.658617, -1.056742, 0, 0, 0, 1, 1,
0.2390117, 1.227687, 1.775782, 0, 0, 0, 1, 1,
0.2408779, -0.2161935, 3.822375, 0, 0, 0, 1, 1,
0.2452177, 0.1997745, 1.52865, 0, 0, 0, 1, 1,
0.2498362, -1.867298, 2.881821, 0, 0, 0, 1, 1,
0.2581332, -0.7624167, 1.44512, 0, 0, 0, 1, 1,
0.2592369, 1.004541, 1.146262, 0, 0, 0, 1, 1,
0.2609847, 1.564308, 2.542899, 1, 1, 1, 1, 1,
0.2611202, -0.1077443, 1.622247, 1, 1, 1, 1, 1,
0.263519, -0.3575835, 2.937987, 1, 1, 1, 1, 1,
0.2698072, 1.205005, 1.637722, 1, 1, 1, 1, 1,
0.2720849, 1.071923, 0.6463345, 1, 1, 1, 1, 1,
0.2736762, 0.5704532, -0.1798412, 1, 1, 1, 1, 1,
0.2745707, 0.5901546, 0.5075051, 1, 1, 1, 1, 1,
0.2762514, -0.1006875, 3.587977, 1, 1, 1, 1, 1,
0.2805062, -0.393517, 2.36577, 1, 1, 1, 1, 1,
0.2813021, 0.2015553, -0.5913533, 1, 1, 1, 1, 1,
0.2835895, -0.910382, 1.684677, 1, 1, 1, 1, 1,
0.2837014, -0.3917733, 2.508798, 1, 1, 1, 1, 1,
0.2906214, -0.5699456, 3.498516, 1, 1, 1, 1, 1,
0.2957397, 0.6676328, 0.6352694, 1, 1, 1, 1, 1,
0.2984939, -0.7379921, 4.09025, 1, 1, 1, 1, 1,
0.2988074, 1.16763, -0.4799958, 0, 0, 1, 1, 1,
0.2998754, 1.093212, 0.1157243, 1, 0, 0, 1, 1,
0.3011329, -0.721361, 1.54062, 1, 0, 0, 1, 1,
0.3020496, -0.8213447, 4.658198, 1, 0, 0, 1, 1,
0.3025163, -0.2866492, 3.885004, 1, 0, 0, 1, 1,
0.3045721, -1.754401, 1.462642, 1, 0, 0, 1, 1,
0.3114102, -0.6492568, 3.0512, 0, 0, 0, 1, 1,
0.3120374, -0.7434683, 2.841159, 0, 0, 0, 1, 1,
0.3134727, -1.51737, 2.225971, 0, 0, 0, 1, 1,
0.3159165, -0.2776031, 1.531379, 0, 0, 0, 1, 1,
0.3184146, 0.2679617, 1.704221, 0, 0, 0, 1, 1,
0.3192229, -0.4360578, 3.300404, 0, 0, 0, 1, 1,
0.3208919, -0.5040772, 1.479851, 0, 0, 0, 1, 1,
0.332384, 0.04321499, 1.306229, 1, 1, 1, 1, 1,
0.3371503, -0.4198446, 3.100102, 1, 1, 1, 1, 1,
0.3403255, -0.2460038, 1.175474, 1, 1, 1, 1, 1,
0.3422465, 0.5210008, 0.4846555, 1, 1, 1, 1, 1,
0.3433663, 0.4004951, 0.3262487, 1, 1, 1, 1, 1,
0.3436658, 0.8019775, 1.354283, 1, 1, 1, 1, 1,
0.3482227, 0.7830014, 0.23424, 1, 1, 1, 1, 1,
0.3603188, 1.239394, -0.4464502, 1, 1, 1, 1, 1,
0.3701037, 1.155282, 0.2022751, 1, 1, 1, 1, 1,
0.3724878, 0.2622586, 0.04784565, 1, 1, 1, 1, 1,
0.3726902, 1.777539, -0.05355249, 1, 1, 1, 1, 1,
0.3776957, 0.1462679, 3.089476, 1, 1, 1, 1, 1,
0.3787833, 0.1427623, 1.399473, 1, 1, 1, 1, 1,
0.3797462, -1.222173, 3.029861, 1, 1, 1, 1, 1,
0.3806417, 0.4802664, 1.11271, 1, 1, 1, 1, 1,
0.3835216, -2.145772, 0.9147936, 0, 0, 1, 1, 1,
0.3857625, -0.7895711, 2.753708, 1, 0, 0, 1, 1,
0.388717, 0.7596146, 0.8349991, 1, 0, 0, 1, 1,
0.3901783, -0.662059, 0.6719828, 1, 0, 0, 1, 1,
0.3925502, 0.7321686, 1.421029, 1, 0, 0, 1, 1,
0.3968295, -0.2319272, 2.37694, 1, 0, 0, 1, 1,
0.3995428, -1.008629, 3.4625, 0, 0, 0, 1, 1,
0.4081472, -0.1602132, 2.610276, 0, 0, 0, 1, 1,
0.4132048, 0.4508094, -0.8283458, 0, 0, 0, 1, 1,
0.4144488, -0.3400383, 1.858335, 0, 0, 0, 1, 1,
0.415612, -1.027878, 2.691773, 0, 0, 0, 1, 1,
0.421273, 0.07996843, 1.692565, 0, 0, 0, 1, 1,
0.4213746, -0.7450353, 5.05929, 0, 0, 0, 1, 1,
0.4288216, 0.4988798, 1.650103, 1, 1, 1, 1, 1,
0.4301995, 0.1801316, -0.367709, 1, 1, 1, 1, 1,
0.4321054, 0.8599395, 0.5897818, 1, 1, 1, 1, 1,
0.4357956, 0.8700742, -0.3769342, 1, 1, 1, 1, 1,
0.439632, 1.638546, 2.232028, 1, 1, 1, 1, 1,
0.4461135, -1.697852, 3.369521, 1, 1, 1, 1, 1,
0.4467881, -0.2696981, 1.756232, 1, 1, 1, 1, 1,
0.4470894, -0.1164803, 3.378196, 1, 1, 1, 1, 1,
0.4524741, -0.0502324, 2.272186, 1, 1, 1, 1, 1,
0.4538475, -0.874357, 2.457675, 1, 1, 1, 1, 1,
0.4600905, 1.436209, -1.398267, 1, 1, 1, 1, 1,
0.4621705, 0.6193579, 0.7845892, 1, 1, 1, 1, 1,
0.4631943, 0.04862889, 0.767214, 1, 1, 1, 1, 1,
0.4644526, 0.5637257, 2.148784, 1, 1, 1, 1, 1,
0.4701628, 0.5396042, 0.8598157, 1, 1, 1, 1, 1,
0.471928, -0.8833894, 1.541901, 0, 0, 1, 1, 1,
0.4776727, 0.2279945, 0.987536, 1, 0, 0, 1, 1,
0.4820348, 0.4100778, -0.8389534, 1, 0, 0, 1, 1,
0.4852166, 0.3069544, 1.84923, 1, 0, 0, 1, 1,
0.4904406, -0.9629552, 2.965843, 1, 0, 0, 1, 1,
0.4935573, -0.2157807, 2.252388, 1, 0, 0, 1, 1,
0.4998761, -0.7708753, 2.047365, 0, 0, 0, 1, 1,
0.5006002, -1.074564, 1.649013, 0, 0, 0, 1, 1,
0.5021331, -0.01808403, 2.460679, 0, 0, 0, 1, 1,
0.5080482, -0.4711108, 3.57938, 0, 0, 0, 1, 1,
0.5097122, -1.894849, 1.975654, 0, 0, 0, 1, 1,
0.5107395, 0.7993423, 1.128335, 0, 0, 0, 1, 1,
0.5140189, 1.798529, -0.3338423, 0, 0, 0, 1, 1,
0.5142691, 1.410451, 0.4573247, 1, 1, 1, 1, 1,
0.5145658, -0.5075828, 2.950332, 1, 1, 1, 1, 1,
0.5209841, -0.2921454, 1.442785, 1, 1, 1, 1, 1,
0.5223578, 0.4330437, 0.6459751, 1, 1, 1, 1, 1,
0.5229006, 0.9630364, 0.8480769, 1, 1, 1, 1, 1,
0.5279073, 1.415854, 0.5040994, 1, 1, 1, 1, 1,
0.5325138, 0.9195997, -0.2816383, 1, 1, 1, 1, 1,
0.5330348, 0.9309241, 0.879364, 1, 1, 1, 1, 1,
0.5355588, -0.1677019, 1.528306, 1, 1, 1, 1, 1,
0.5364015, -0.5057113, 1.763933, 1, 1, 1, 1, 1,
0.5367182, -0.339229, 2.994951, 1, 1, 1, 1, 1,
0.5405708, -1.46496, 2.822, 1, 1, 1, 1, 1,
0.5412111, 1.87114, -2.212461, 1, 1, 1, 1, 1,
0.5423077, 0.1563084, 1.736814, 1, 1, 1, 1, 1,
0.542343, 0.3351027, -0.1398183, 1, 1, 1, 1, 1,
0.543089, -0.9691462, 1.17874, 0, 0, 1, 1, 1,
0.5445578, 1.158727, -0.08029731, 1, 0, 0, 1, 1,
0.5461427, -0.3323621, 1.827536, 1, 0, 0, 1, 1,
0.546945, -0.3901685, 2.094074, 1, 0, 0, 1, 1,
0.550322, -1.809952, 4.098626, 1, 0, 0, 1, 1,
0.5552272, -0.2529353, 1.013891, 1, 0, 0, 1, 1,
0.555924, -0.2750418, 3.3975, 0, 0, 0, 1, 1,
0.5584353, -0.5423895, 2.428209, 0, 0, 0, 1, 1,
0.5592357, -0.4079919, 1.018392, 0, 0, 0, 1, 1,
0.5706891, 1.923533, 0.6596879, 0, 0, 0, 1, 1,
0.5724704, 0.373767, 0.8612725, 0, 0, 0, 1, 1,
0.5734884, -0.312968, 2.716582, 0, 0, 0, 1, 1,
0.5741362, 0.1727956, 0.05013339, 0, 0, 0, 1, 1,
0.5760926, 1.300273, -0.5551208, 1, 1, 1, 1, 1,
0.5823182, -0.6188973, 2.175455, 1, 1, 1, 1, 1,
0.5829315, 2.387604, -0.9543352, 1, 1, 1, 1, 1,
0.5831081, -0.7368321, 1.558329, 1, 1, 1, 1, 1,
0.5914969, 0.70783, 0.1459762, 1, 1, 1, 1, 1,
0.5943229, 0.6037347, 1.229244, 1, 1, 1, 1, 1,
0.5954503, -0.8812708, 2.212225, 1, 1, 1, 1, 1,
0.596521, 0.1469354, 0.8915957, 1, 1, 1, 1, 1,
0.6024092, -0.4328229, 0.6315475, 1, 1, 1, 1, 1,
0.6025416, 1.676958, 0.5453387, 1, 1, 1, 1, 1,
0.6061394, 0.04655258, 1.48998, 1, 1, 1, 1, 1,
0.6068758, 0.3173154, 3.522277, 1, 1, 1, 1, 1,
0.6122474, 1.595861, -0.103711, 1, 1, 1, 1, 1,
0.6125051, -0.1083568, 4.599624, 1, 1, 1, 1, 1,
0.6175091, -1.184478, 2.677976, 1, 1, 1, 1, 1,
0.6180026, 0.8162323, 1.611713, 0, 0, 1, 1, 1,
0.6250134, -0.9393513, 3.080044, 1, 0, 0, 1, 1,
0.6260601, -1.383976, 3.898978, 1, 0, 0, 1, 1,
0.6340951, -0.6789503, 3.525267, 1, 0, 0, 1, 1,
0.6347884, 0.4500361, 1.0585, 1, 0, 0, 1, 1,
0.638338, -1.74494, 2.816487, 1, 0, 0, 1, 1,
0.6389251, 0.4158336, 0.1650093, 0, 0, 0, 1, 1,
0.640701, 0.6453751, -0.427139, 0, 0, 0, 1, 1,
0.6422772, 0.9876009, -0.196589, 0, 0, 0, 1, 1,
0.6428109, -1.475302, 3.472269, 0, 0, 0, 1, 1,
0.6458997, 0.3862208, 0.536967, 0, 0, 0, 1, 1,
0.649185, -0.5254059, 0.3732992, 0, 0, 0, 1, 1,
0.6523642, -0.5868794, 2.153204, 0, 0, 0, 1, 1,
0.6560377, -0.7660633, 2.894533, 1, 1, 1, 1, 1,
0.6584087, -0.7274917, 1.392605, 1, 1, 1, 1, 1,
0.671398, 0.7103494, 1.81568, 1, 1, 1, 1, 1,
0.6741048, 2.242647, 0.8485669, 1, 1, 1, 1, 1,
0.6761549, 1.375075, 0.9943336, 1, 1, 1, 1, 1,
0.6768328, -0.20254, 1.747693, 1, 1, 1, 1, 1,
0.6809222, 0.1750731, 2.203431, 1, 1, 1, 1, 1,
0.684984, -0.743875, 0.981921, 1, 1, 1, 1, 1,
0.6851944, -0.6216135, 1.185599, 1, 1, 1, 1, 1,
0.6863215, -0.222476, 1.779571, 1, 1, 1, 1, 1,
0.6882606, 0.5765505, 0.8799348, 1, 1, 1, 1, 1,
0.6893744, -0.8963717, 0.427884, 1, 1, 1, 1, 1,
0.6924435, -0.6371061, 3.300611, 1, 1, 1, 1, 1,
0.6951355, -1.342237, 2.304519, 1, 1, 1, 1, 1,
0.6962074, 0.1727284, 1.298314, 1, 1, 1, 1, 1,
0.7114565, 0.2555955, -0.3434097, 0, 0, 1, 1, 1,
0.7119, 1.509772, -0.5381771, 1, 0, 0, 1, 1,
0.724876, -0.08620171, 2.798084, 1, 0, 0, 1, 1,
0.7253311, -1.440631, 1.79121, 1, 0, 0, 1, 1,
0.7324908, -0.6001789, 1.812367, 1, 0, 0, 1, 1,
0.7345612, 0.6524337, 0.2259782, 1, 0, 0, 1, 1,
0.7423593, -0.5201798, 1.513147, 0, 0, 0, 1, 1,
0.7468136, -0.8658275, 3.087792, 0, 0, 0, 1, 1,
0.7471552, -0.3989377, 1.673974, 0, 0, 0, 1, 1,
0.7548851, -0.7092083, -0.4708142, 0, 0, 0, 1, 1,
0.7584595, 2.578631, -0.40198, 0, 0, 0, 1, 1,
0.7606609, 0.661594, 1.840305, 0, 0, 0, 1, 1,
0.7638158, -1.56582, 2.918272, 0, 0, 0, 1, 1,
0.7639537, 0.1686724, 1.967958, 1, 1, 1, 1, 1,
0.7775341, 0.002641523, 0.7527386, 1, 1, 1, 1, 1,
0.791096, -0.3280188, 2.090718, 1, 1, 1, 1, 1,
0.7997876, -2.073748, 3.758407, 1, 1, 1, 1, 1,
0.8026222, -0.7624057, 3.290761, 1, 1, 1, 1, 1,
0.8056247, -0.6483715, 1.726975, 1, 1, 1, 1, 1,
0.8056809, 0.7464952, 0.2790706, 1, 1, 1, 1, 1,
0.8104009, 0.3155327, 0.5227286, 1, 1, 1, 1, 1,
0.8147559, 0.9953132, 0.003127826, 1, 1, 1, 1, 1,
0.8153484, 0.8887531, -1.346713, 1, 1, 1, 1, 1,
0.816329, 0.3069173, 1.508325, 1, 1, 1, 1, 1,
0.8168754, -0.04693589, 1.47423, 1, 1, 1, 1, 1,
0.8173102, -1.473663, 3.295403, 1, 1, 1, 1, 1,
0.8208095, 0.7302901, 0.7781905, 1, 1, 1, 1, 1,
0.8231847, -0.2563576, 1.714556, 1, 1, 1, 1, 1,
0.8235177, -1.285248, 2.432998, 0, 0, 1, 1, 1,
0.8243562, -0.07411176, 2.794265, 1, 0, 0, 1, 1,
0.8250616, 0.4691116, -0.3860399, 1, 0, 0, 1, 1,
0.829402, -1.680116, 2.290907, 1, 0, 0, 1, 1,
0.8357484, -1.838522, 3.303076, 1, 0, 0, 1, 1,
0.8381568, -0.5211109, 2.154278, 1, 0, 0, 1, 1,
0.8470798, -1.509255, 2.942536, 0, 0, 0, 1, 1,
0.8482153, 1.192633, 2.918828, 0, 0, 0, 1, 1,
0.8487069, 1.663869, 1.970738, 0, 0, 0, 1, 1,
0.8492754, 0.5846138, -0.1151352, 0, 0, 0, 1, 1,
0.8536481, 0.434357, 1.480879, 0, 0, 0, 1, 1,
0.8678747, -0.3351561, 1.058142, 0, 0, 0, 1, 1,
0.8692947, -0.8771021, 2.982426, 0, 0, 0, 1, 1,
0.8745252, 0.8652313, 1.48771, 1, 1, 1, 1, 1,
0.8822554, -0.156156, 1.226171, 1, 1, 1, 1, 1,
0.8858989, 1.555, 0.77542, 1, 1, 1, 1, 1,
0.8859267, 0.3937067, 0.2733433, 1, 1, 1, 1, 1,
0.8937157, 0.2664359, -0.1395531, 1, 1, 1, 1, 1,
0.8955507, 1.057663, -0.4394254, 1, 1, 1, 1, 1,
0.8961914, -0.8966191, 2.670566, 1, 1, 1, 1, 1,
0.8981705, -0.6677713, 3.733449, 1, 1, 1, 1, 1,
0.8990443, 1.669667, 1.819732, 1, 1, 1, 1, 1,
0.9032611, -0.1197041, 3.414982, 1, 1, 1, 1, 1,
0.9038066, -1.777585, 2.087886, 1, 1, 1, 1, 1,
0.9093014, -0.2175427, 0.9792925, 1, 1, 1, 1, 1,
0.9178534, -0.2787926, 2.620019, 1, 1, 1, 1, 1,
0.9188429, 1.29032, -0.5540633, 1, 1, 1, 1, 1,
0.922492, 1.174063, 0.8679246, 1, 1, 1, 1, 1,
0.9245226, -0.185408, 1.568017, 0, 0, 1, 1, 1,
0.9347295, -0.2885859, 1.43966, 1, 0, 0, 1, 1,
0.9428006, 1.585164, 1.796111, 1, 0, 0, 1, 1,
0.9445708, 0.3397039, 0.1405692, 1, 0, 0, 1, 1,
0.948116, -0.4125477, 1.103637, 1, 0, 0, 1, 1,
0.9520478, -1.939543, 2.531667, 1, 0, 0, 1, 1,
0.9523023, 0.5057136, 1.108409, 0, 0, 0, 1, 1,
0.9612124, 0.2133142, 1.180321, 0, 0, 0, 1, 1,
0.9625552, -0.8837751, 3.630312, 0, 0, 0, 1, 1,
0.9648896, 0.879544, 0.07448806, 0, 0, 0, 1, 1,
0.9651123, 0.2983001, 1.622367, 0, 0, 0, 1, 1,
0.9652032, 0.01761527, 2.058477, 0, 0, 0, 1, 1,
0.9652581, -1.39291, 1.427974, 0, 0, 0, 1, 1,
0.969602, 0.9133275, 0.3402645, 1, 1, 1, 1, 1,
0.9715757, 1.233957, 3.196991, 1, 1, 1, 1, 1,
0.9722942, 1.403972, 0.1365606, 1, 1, 1, 1, 1,
0.9758414, -1.205924, 2.092087, 1, 1, 1, 1, 1,
0.9768898, -0.4698578, 1.016788, 1, 1, 1, 1, 1,
0.9927796, -1.782362, 3.749057, 1, 1, 1, 1, 1,
0.9950806, 0.7063382, 0.1916574, 1, 1, 1, 1, 1,
0.9954147, 0.6849956, -0.1258568, 1, 1, 1, 1, 1,
0.9955118, -0.7589546, 2.540467, 1, 1, 1, 1, 1,
0.995738, 1.345286, 0.4285563, 1, 1, 1, 1, 1,
0.9970224, -2.554456, 3.262508, 1, 1, 1, 1, 1,
1.005507, -0.146656, 1.459553, 1, 1, 1, 1, 1,
1.015328, -2.021763, 2.709494, 1, 1, 1, 1, 1,
1.022418, 0.04732337, 0.7979042, 1, 1, 1, 1, 1,
1.028039, 0.8829006, -0.7281705, 1, 1, 1, 1, 1,
1.030268, -0.9938185, 3.150268, 0, 0, 1, 1, 1,
1.042255, -0.01112166, 1.933246, 1, 0, 0, 1, 1,
1.04438, 0.9046932, 0.3289113, 1, 0, 0, 1, 1,
1.047, 0.2839414, 1.354738, 1, 0, 0, 1, 1,
1.062953, -0.08401228, 1.659796, 1, 0, 0, 1, 1,
1.063749, 0.5508341, 0.3759798, 1, 0, 0, 1, 1,
1.064997, -0.9759507, 3.253406, 0, 0, 0, 1, 1,
1.065281, -1.011823, 0.7457374, 0, 0, 0, 1, 1,
1.066349, 1.160166, -0.9001027, 0, 0, 0, 1, 1,
1.074971, -0.7201074, 2.702844, 0, 0, 0, 1, 1,
1.077356, 0.0137167, 3.067262, 0, 0, 0, 1, 1,
1.080541, -1.01597, 2.709342, 0, 0, 0, 1, 1,
1.081766, 1.880921, 0.2593668, 0, 0, 0, 1, 1,
1.082578, 0.8114685, 1.138581, 1, 1, 1, 1, 1,
1.084266, 0.5144217, 1.977215, 1, 1, 1, 1, 1,
1.088914, 1.957736, 0.7894564, 1, 1, 1, 1, 1,
1.089417, -0.4271284, 2.386729, 1, 1, 1, 1, 1,
1.089644, 0.3611856, 2.005603, 1, 1, 1, 1, 1,
1.102546, -2.257833, 2.744713, 1, 1, 1, 1, 1,
1.105708, 1.880796, 0.07303297, 1, 1, 1, 1, 1,
1.107055, -0.05534958, 0.3232766, 1, 1, 1, 1, 1,
1.109917, -1.343457, 2.072075, 1, 1, 1, 1, 1,
1.114992, 2.021457, -2.131065, 1, 1, 1, 1, 1,
1.117732, -1.271857, 1.566423, 1, 1, 1, 1, 1,
1.122912, 0.6231585, -0.3794249, 1, 1, 1, 1, 1,
1.137279, 0.9889573, 1.503878, 1, 1, 1, 1, 1,
1.141401, 0.6786624, 0.8655248, 1, 1, 1, 1, 1,
1.14615, -0.7830097, 2.044725, 1, 1, 1, 1, 1,
1.155247, -0.2221764, 2.096353, 0, 0, 1, 1, 1,
1.164492, 0.3412269, 2.476817, 1, 0, 0, 1, 1,
1.173148, 0.4285745, -0.6794905, 1, 0, 0, 1, 1,
1.189311, 1.899135, -0.4716237, 1, 0, 0, 1, 1,
1.19233, -0.9352099, 3.125458, 1, 0, 0, 1, 1,
1.192755, -0.1408984, 1.689369, 1, 0, 0, 1, 1,
1.195839, -0.7469155, 3.125039, 0, 0, 0, 1, 1,
1.198362, 0.3021376, 1.837539, 0, 0, 0, 1, 1,
1.205348, 0.3313947, 1.309783, 0, 0, 0, 1, 1,
1.215612, 1.032271, -0.0636254, 0, 0, 0, 1, 1,
1.266557, 1.986923, -0.02206917, 0, 0, 0, 1, 1,
1.276126, 0.8960442, -1.505835, 0, 0, 0, 1, 1,
1.277526, 0.5922483, 1.244353, 0, 0, 0, 1, 1,
1.285508, 0.1359467, 0.7190877, 1, 1, 1, 1, 1,
1.28942, -0.245656, 2.404272, 1, 1, 1, 1, 1,
1.293444, -0.1651528, 2.698152, 1, 1, 1, 1, 1,
1.304519, 0.3496451, 1.262262, 1, 1, 1, 1, 1,
1.315251, -0.3855629, -0.2116229, 1, 1, 1, 1, 1,
1.316648, -0.1961015, 2.463546, 1, 1, 1, 1, 1,
1.328185, 0.4196684, 0.9993826, 1, 1, 1, 1, 1,
1.340509, 0.8986875, 1.796634, 1, 1, 1, 1, 1,
1.347426, -2.353119, 3.200628, 1, 1, 1, 1, 1,
1.351369, -1.319347, 2.738368, 1, 1, 1, 1, 1,
1.357735, 0.864847, 1.403136, 1, 1, 1, 1, 1,
1.365703, 1.034574, 0.6404769, 1, 1, 1, 1, 1,
1.380624, -0.7182687, 1.540589, 1, 1, 1, 1, 1,
1.383191, 1.507598, -2.100573, 1, 1, 1, 1, 1,
1.390739, -0.8155423, 1.909171, 1, 1, 1, 1, 1,
1.396906, 0.2380163, -0.9114243, 0, 0, 1, 1, 1,
1.397058, -0.02776581, 0.802205, 1, 0, 0, 1, 1,
1.404188, 0.6040168, 2.195401, 1, 0, 0, 1, 1,
1.404942, 0.06787726, 0.313515, 1, 0, 0, 1, 1,
1.412928, 0.05209921, 2.532084, 1, 0, 0, 1, 1,
1.417832, -1.414206, 0.77567, 1, 0, 0, 1, 1,
1.422267, -0.2527385, 2.322549, 0, 0, 0, 1, 1,
1.431089, -0.6951798, 1.906858, 0, 0, 0, 1, 1,
1.441167, 0.2286104, 2.049173, 0, 0, 0, 1, 1,
1.444172, 0.9881808, 0.3636511, 0, 0, 0, 1, 1,
1.444491, 2.513207, 1.234317, 0, 0, 0, 1, 1,
1.456466, -0.191611, 1.726756, 0, 0, 0, 1, 1,
1.456929, -0.7373317, 2.424865, 0, 0, 0, 1, 1,
1.458344, 1.586153, 0.4964291, 1, 1, 1, 1, 1,
1.467723, 0.5186659, 2.630019, 1, 1, 1, 1, 1,
1.477859, 0.2059962, 0.4835446, 1, 1, 1, 1, 1,
1.481129, -0.4607763, 1.339469, 1, 1, 1, 1, 1,
1.499861, -0.06200018, 1.825846, 1, 1, 1, 1, 1,
1.515617, -0.2234687, 1.970889, 1, 1, 1, 1, 1,
1.526647, -1.29786, 1.80058, 1, 1, 1, 1, 1,
1.530643, 2.081706, 1.098676, 1, 1, 1, 1, 1,
1.532863, -0.8492056, 0.358006, 1, 1, 1, 1, 1,
1.535832, 1.596297, 0.6576388, 1, 1, 1, 1, 1,
1.540029, 0.3138212, 2.390705, 1, 1, 1, 1, 1,
1.549744, -0.1039388, 1.876203, 1, 1, 1, 1, 1,
1.55016, -1.141647, 3.468567, 1, 1, 1, 1, 1,
1.553294, 0.501745, 2.499567, 1, 1, 1, 1, 1,
1.562243, 0.4988386, 0.5118137, 1, 1, 1, 1, 1,
1.569563, 1.746749, 0.4246627, 0, 0, 1, 1, 1,
1.586971, 1.131121, 0.4495804, 1, 0, 0, 1, 1,
1.588448, -0.6692503, 2.641477, 1, 0, 0, 1, 1,
1.59587, -0.2886391, 0.2657927, 1, 0, 0, 1, 1,
1.604934, 1.438095, 0.3414593, 1, 0, 0, 1, 1,
1.610108, -1.07129, 1.715202, 1, 0, 0, 1, 1,
1.61424, 0.5071036, 0.3710033, 0, 0, 0, 1, 1,
1.617471, 0.06834126, 2.385085, 0, 0, 0, 1, 1,
1.620845, 0.9063306, 1.875937, 0, 0, 0, 1, 1,
1.637373, -1.027325, -0.0425064, 0, 0, 0, 1, 1,
1.651103, -0.2459139, 1.386482, 0, 0, 0, 1, 1,
1.655618, -1.150314, -0.4251022, 0, 0, 0, 1, 1,
1.656078, -0.76335, 2.274375, 0, 0, 0, 1, 1,
1.66165, -0.3557453, 2.533762, 1, 1, 1, 1, 1,
1.664775, -0.7048622, 1.638726, 1, 1, 1, 1, 1,
1.671281, 0.3325534, 1.888353, 1, 1, 1, 1, 1,
1.673235, 0.3827202, 0.3889162, 1, 1, 1, 1, 1,
1.678961, -0.619752, 2.501391, 1, 1, 1, 1, 1,
1.693911, 0.552683, 0.4953882, 1, 1, 1, 1, 1,
1.730788, 0.9913594, 2.479659, 1, 1, 1, 1, 1,
1.751885, 0.3474363, 2.236552, 1, 1, 1, 1, 1,
1.764463, -1.976081, 4.626, 1, 1, 1, 1, 1,
1.788179, 2.059968, -0.3685192, 1, 1, 1, 1, 1,
1.791889, 0.5282371, 0.2327729, 1, 1, 1, 1, 1,
1.798352, -0.2472533, 1.65513, 1, 1, 1, 1, 1,
1.853974, 0.9100659, 2.321513, 1, 1, 1, 1, 1,
1.859097, -0.6511731, 2.165748, 1, 1, 1, 1, 1,
1.911051, -0.8718039, 0.9676278, 1, 1, 1, 1, 1,
1.953523, -1.045608, 1.217692, 0, 0, 1, 1, 1,
2.003267, 0.07018412, 3.044944, 1, 0, 0, 1, 1,
2.004437, 0.5217572, 1.463965, 1, 0, 0, 1, 1,
2.090848, -1.761474, 2.695636, 1, 0, 0, 1, 1,
2.135386, -0.4773661, 2.797062, 1, 0, 0, 1, 1,
2.159732, -1.63081, 3.348604, 1, 0, 0, 1, 1,
2.179191, -1.640716, 1.530624, 0, 0, 0, 1, 1,
2.273875, -1.165587, 3.058456, 0, 0, 0, 1, 1,
2.275213, -1.894476, 3.026282, 0, 0, 0, 1, 1,
2.356652, 0.8543857, 0.3927302, 0, 0, 0, 1, 1,
2.379145, -0.1842127, 0.556958, 0, 0, 0, 1, 1,
2.380629, 1.161411, 1.493315, 0, 0, 0, 1, 1,
2.507976, -0.2090815, 2.602007, 0, 0, 0, 1, 1,
2.707307, -2.814378, 0.7364964, 1, 1, 1, 1, 1,
2.770564, 0.9900712, 2.719636, 1, 1, 1, 1, 1,
2.775327, -0.6221815, 2.052011, 1, 1, 1, 1, 1,
2.942437, 0.06719932, 1.668526, 1, 1, 1, 1, 1,
3.038108, 0.6014006, 1.936827, 1, 1, 1, 1, 1,
3.226272, -0.9110184, 0.08847243, 1, 1, 1, 1, 1,
3.448386, -0.5370823, 1.754487, 1, 1, 1, 1, 1
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
var radius = 9.435212;
var distance = 33.14078;
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
mvMatrix.translate( 0.0087111, 0.1727829, 0.1525972 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14078);
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
