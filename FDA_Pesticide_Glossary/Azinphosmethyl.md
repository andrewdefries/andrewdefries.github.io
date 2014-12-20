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
-3.191114, 0.2607395, -1.343275, 1, 0, 0, 1,
-2.779879, -0.7307692, -1.582631, 1, 0.007843138, 0, 1,
-2.766186, -1.089492, -2.839296, 1, 0.01176471, 0, 1,
-2.765217, -0.7110623, -3.016877, 1, 0.01960784, 0, 1,
-2.727489, -1.357073, -2.824815, 1, 0.02352941, 0, 1,
-2.646645, -0.2241611, -2.851881, 1, 0.03137255, 0, 1,
-2.517999, -0.777556, -0.8801027, 1, 0.03529412, 0, 1,
-2.471052, -0.4217792, -0.1603932, 1, 0.04313726, 0, 1,
-2.469986, 0.8295716, 0.5267866, 1, 0.04705882, 0, 1,
-2.450682, 1.817431, -0.6132644, 1, 0.05490196, 0, 1,
-2.430086, -0.05454443, -0.295967, 1, 0.05882353, 0, 1,
-2.351386, 0.1726247, -1.533395, 1, 0.06666667, 0, 1,
-2.33598, -0.2281554, -1.945364, 1, 0.07058824, 0, 1,
-2.32785, -1.818795, -3.053336, 1, 0.07843138, 0, 1,
-2.311675, -1.113058, -0.6792936, 1, 0.08235294, 0, 1,
-2.178597, 0.910341, -0.3198354, 1, 0.09019608, 0, 1,
-2.150755, 0.9342912, -2.013554, 1, 0.09411765, 0, 1,
-2.150564, -1.211102, -2.635214, 1, 0.1019608, 0, 1,
-2.112525, -0.3551059, -1.715055, 1, 0.1098039, 0, 1,
-2.089632, -0.7829018, -2.25996, 1, 0.1137255, 0, 1,
-2.081631, 0.3618613, -1.413663, 1, 0.1215686, 0, 1,
-2.059867, -0.6535873, -1.461463, 1, 0.1254902, 0, 1,
-2.056605, -0.6943322, -1.31387, 1, 0.1333333, 0, 1,
-2.040604, 0.6724082, -1.095164, 1, 0.1372549, 0, 1,
-2.037016, -0.4062906, -4.07703, 1, 0.145098, 0, 1,
-2.026133, 1.821311, -0.7790243, 1, 0.1490196, 0, 1,
-2.013933, 1.169889, -1.402888, 1, 0.1568628, 0, 1,
-1.932021, -1.684998, -2.718144, 1, 0.1607843, 0, 1,
-1.930675, -1.589622, -1.506622, 1, 0.1686275, 0, 1,
-1.92956, -0.6568789, -2.37206, 1, 0.172549, 0, 1,
-1.878678, 0.1016265, 0.01238371, 1, 0.1803922, 0, 1,
-1.865881, -0.5135348, -1.815579, 1, 0.1843137, 0, 1,
-1.857285, 1.607345, -2.103689, 1, 0.1921569, 0, 1,
-1.83954, -0.6576176, 0.1835505, 1, 0.1960784, 0, 1,
-1.808594, 0.1017012, 0.5912968, 1, 0.2039216, 0, 1,
-1.803473, -0.5031255, -2.685854, 1, 0.2117647, 0, 1,
-1.78781, -1.896021, -1.884027, 1, 0.2156863, 0, 1,
-1.780946, -0.8438914, -3.952857, 1, 0.2235294, 0, 1,
-1.778466, -0.329873, 0.8459681, 1, 0.227451, 0, 1,
-1.776708, 1.082505, -1.191183, 1, 0.2352941, 0, 1,
-1.770163, 0.8539756, 0.6865301, 1, 0.2392157, 0, 1,
-1.743062, -1.111263, -0.9068744, 1, 0.2470588, 0, 1,
-1.731424, 0.2823298, -0.9365164, 1, 0.2509804, 0, 1,
-1.725463, 0.93966, -0.1856077, 1, 0.2588235, 0, 1,
-1.711499, 0.3900028, -1.497966, 1, 0.2627451, 0, 1,
-1.709525, 0.03697409, -1.237377, 1, 0.2705882, 0, 1,
-1.709013, -0.9046892, -2.132776, 1, 0.2745098, 0, 1,
-1.693721, 0.5500441, -0.5748928, 1, 0.282353, 0, 1,
-1.682839, -1.197883, -3.735262, 1, 0.2862745, 0, 1,
-1.677616, 1.184083, -0.1786167, 1, 0.2941177, 0, 1,
-1.672712, -1.661183, -3.759044, 1, 0.3019608, 0, 1,
-1.66078, -0.06631386, -3.403544, 1, 0.3058824, 0, 1,
-1.639379, -1.136027, -1.988622, 1, 0.3137255, 0, 1,
-1.636109, -0.3063667, -1.268341, 1, 0.3176471, 0, 1,
-1.62471, 0.3825846, -1.127624, 1, 0.3254902, 0, 1,
-1.606348, 0.5842257, -1.01533, 1, 0.3294118, 0, 1,
-1.604743, -1.481845, -1.17591, 1, 0.3372549, 0, 1,
-1.602684, -0.3725954, -1.014669, 1, 0.3411765, 0, 1,
-1.589972, 1.712674, -0.6137093, 1, 0.3490196, 0, 1,
-1.572364, 1.561186, -1.326114, 1, 0.3529412, 0, 1,
-1.559363, 1.192693, -2.824791, 1, 0.3607843, 0, 1,
-1.55456, 0.03778433, -1.64875, 1, 0.3647059, 0, 1,
-1.549983, 0.5023936, -2.97372, 1, 0.372549, 0, 1,
-1.543009, -1.300593, -2.167046, 1, 0.3764706, 0, 1,
-1.527939, -0.01521015, -1.810583, 1, 0.3843137, 0, 1,
-1.527491, -0.3789974, -3.572235, 1, 0.3882353, 0, 1,
-1.521708, -0.5995294, -0.6600066, 1, 0.3960784, 0, 1,
-1.521471, 0.8308716, -2.298014, 1, 0.4039216, 0, 1,
-1.516033, 0.6185679, -0.5694719, 1, 0.4078431, 0, 1,
-1.514094, 0.4532542, -1.620923, 1, 0.4156863, 0, 1,
-1.506357, 0.09537942, -1.420828, 1, 0.4196078, 0, 1,
-1.493771, -0.2484824, -1.435939, 1, 0.427451, 0, 1,
-1.486685, 1.257882, 0.614942, 1, 0.4313726, 0, 1,
-1.48114, 0.2370303, -0.7491055, 1, 0.4392157, 0, 1,
-1.477623, 0.4394983, -0.7920452, 1, 0.4431373, 0, 1,
-1.477206, 0.5414535, -1.750483, 1, 0.4509804, 0, 1,
-1.46998, 0.08781591, -3.681805, 1, 0.454902, 0, 1,
-1.459507, 0.4011473, -1.214609, 1, 0.4627451, 0, 1,
-1.459103, -1.793832, -3.239474, 1, 0.4666667, 0, 1,
-1.458753, -1.350945, -2.827498, 1, 0.4745098, 0, 1,
-1.458369, -0.1438675, -0.02308249, 1, 0.4784314, 0, 1,
-1.457868, 0.5956821, 0.9165915, 1, 0.4862745, 0, 1,
-1.451657, 0.02425396, 0.1798362, 1, 0.4901961, 0, 1,
-1.441304, -0.377097, -2.561115, 1, 0.4980392, 0, 1,
-1.432012, 0.8930941, -1.806471, 1, 0.5058824, 0, 1,
-1.426612, 1.889519, -1.333654, 1, 0.509804, 0, 1,
-1.426459, -0.6634617, -2.0749, 1, 0.5176471, 0, 1,
-1.425635, 0.5606723, -0.9294081, 1, 0.5215687, 0, 1,
-1.400238, -1.017646, -1.711289, 1, 0.5294118, 0, 1,
-1.374163, 0.6227087, -0.2239217, 1, 0.5333334, 0, 1,
-1.357375, -1.53196, -0.09659568, 1, 0.5411765, 0, 1,
-1.351722, -0.9586024, -0.4104803, 1, 0.5450981, 0, 1,
-1.348333, 0.1174733, -2.172639, 1, 0.5529412, 0, 1,
-1.346982, -0.360334, -1.464832, 1, 0.5568628, 0, 1,
-1.346016, -0.824121, -1.889283, 1, 0.5647059, 0, 1,
-1.328266, -1.400973, -1.774721, 1, 0.5686275, 0, 1,
-1.323592, -2.321706, -2.538659, 1, 0.5764706, 0, 1,
-1.309155, 0.8432673, -0.7243023, 1, 0.5803922, 0, 1,
-1.306979, 0.6801847, -1.122135, 1, 0.5882353, 0, 1,
-1.306546, 1.090581, -0.09951583, 1, 0.5921569, 0, 1,
-1.305066, -1.17324, -1.140872, 1, 0.6, 0, 1,
-1.304707, -0.2972486, -1.238042, 1, 0.6078432, 0, 1,
-1.300196, 0.5311885, -0.110627, 1, 0.6117647, 0, 1,
-1.284448, -0.1305156, -1.49092, 1, 0.6196079, 0, 1,
-1.279131, -1.341864, -1.713671, 1, 0.6235294, 0, 1,
-1.276652, 0.36111, -0.2531895, 1, 0.6313726, 0, 1,
-1.275727, -0.6758456, -2.847643, 1, 0.6352941, 0, 1,
-1.274558, 0.401309, -2.775508, 1, 0.6431373, 0, 1,
-1.262303, -2.918221, -2.901768, 1, 0.6470588, 0, 1,
-1.261566, 1.023246, -2.159071, 1, 0.654902, 0, 1,
-1.255828, 0.1727789, -3.309465, 1, 0.6588235, 0, 1,
-1.25415, 0.6745719, -1.771832, 1, 0.6666667, 0, 1,
-1.253719, 1.960585, -0.421488, 1, 0.6705883, 0, 1,
-1.248924, 1.525241, -0.380742, 1, 0.6784314, 0, 1,
-1.228803, -0.2064826, -3.167189, 1, 0.682353, 0, 1,
-1.220139, -0.5550755, -0.2945356, 1, 0.6901961, 0, 1,
-1.210814, 1.906789, -0.4040154, 1, 0.6941177, 0, 1,
-1.204391, -0.1173925, -1.906467, 1, 0.7019608, 0, 1,
-1.195692, 1.080302, -1.091315, 1, 0.7098039, 0, 1,
-1.195199, -0.4785687, -2.499911, 1, 0.7137255, 0, 1,
-1.192893, -1.589573, -1.01382, 1, 0.7215686, 0, 1,
-1.191916, -0.5292071, -1.501472, 1, 0.7254902, 0, 1,
-1.186065, 0.8267841, 1.351179, 1, 0.7333333, 0, 1,
-1.17907, -1.684349, -3.955527, 1, 0.7372549, 0, 1,
-1.173457, 0.2360831, -2.097069, 1, 0.7450981, 0, 1,
-1.151669, -0.8730962, -3.045499, 1, 0.7490196, 0, 1,
-1.150214, 0.03867429, -1.803093, 1, 0.7568628, 0, 1,
-1.14462, 0.7619138, -1.174119, 1, 0.7607843, 0, 1,
-1.135282, -0.7912436, -2.516114, 1, 0.7686275, 0, 1,
-1.13496, 1.709237, 0.5697799, 1, 0.772549, 0, 1,
-1.134531, -0.02573538, -2.06873, 1, 0.7803922, 0, 1,
-1.131539, 0.5648519, -2.178334, 1, 0.7843137, 0, 1,
-1.128799, 0.1270273, -3.428802, 1, 0.7921569, 0, 1,
-1.128437, 0.9361745, -1.284334, 1, 0.7960784, 0, 1,
-1.124621, -0.1386391, -0.6656068, 1, 0.8039216, 0, 1,
-1.120457, -1.045963, -2.664945, 1, 0.8117647, 0, 1,
-1.094757, -1.030243, -2.508955, 1, 0.8156863, 0, 1,
-1.088587, -0.1208791, -1.101688, 1, 0.8235294, 0, 1,
-1.086638, -0.3847852, -2.689666, 1, 0.827451, 0, 1,
-1.080625, 0.9978173, -1.348529, 1, 0.8352941, 0, 1,
-1.077637, -0.7860801, -1.492865, 1, 0.8392157, 0, 1,
-1.075029, -1.210598, -3.254405, 1, 0.8470588, 0, 1,
-1.074797, 1.020244, -1.109111, 1, 0.8509804, 0, 1,
-1.066134, 0.2450529, 0.3955135, 1, 0.8588235, 0, 1,
-1.06519, 1.386696, -0.7523231, 1, 0.8627451, 0, 1,
-1.060355, 0.3679459, -1.51281, 1, 0.8705882, 0, 1,
-1.055498, 1.563318, -1.829446, 1, 0.8745098, 0, 1,
-1.04669, 1.273369, 0.648728, 1, 0.8823529, 0, 1,
-1.045262, 0.07848366, -2.137065, 1, 0.8862745, 0, 1,
-1.041161, 0.5572346, -0.07009186, 1, 0.8941177, 0, 1,
-1.03565, 1.494238, 0.6278883, 1, 0.8980392, 0, 1,
-1.035525, 1.358618, -1.692539, 1, 0.9058824, 0, 1,
-1.035267, -0.5243444, -1.039312, 1, 0.9137255, 0, 1,
-1.032191, -0.3327672, -0.4479764, 1, 0.9176471, 0, 1,
-1.020236, -0.5261544, -2.695954, 1, 0.9254902, 0, 1,
-1.013138, 0.6539351, -1.297944, 1, 0.9294118, 0, 1,
-1.012394, -0.592378, -2.406984, 1, 0.9372549, 0, 1,
-1.010303, 1.419256, -1.281644, 1, 0.9411765, 0, 1,
-1.008887, -0.9923078, -1.606694, 1, 0.9490196, 0, 1,
-1.006064, -2.801636, -3.738572, 1, 0.9529412, 0, 1,
-1.001787, -1.418308, -2.273094, 1, 0.9607843, 0, 1,
-0.9954965, 0.1021957, -2.694615, 1, 0.9647059, 0, 1,
-0.9889691, 1.739211, 1.05599, 1, 0.972549, 0, 1,
-0.9880674, -0.867564, -1.804197, 1, 0.9764706, 0, 1,
-0.9848659, -1.197188, -0.7690159, 1, 0.9843137, 0, 1,
-0.9812371, 1.200439, -0.01898279, 1, 0.9882353, 0, 1,
-0.9791164, 2.394635, -0.3470438, 1, 0.9960784, 0, 1,
-0.9755217, -0.0745104, -0.3265025, 0.9960784, 1, 0, 1,
-0.9638104, 1.967338, -0.9121414, 0.9921569, 1, 0, 1,
-0.9627405, 1.828506, -1.515351, 0.9843137, 1, 0, 1,
-0.9552577, 0.5326691, -1.667575, 0.9803922, 1, 0, 1,
-0.9532003, -0.2195299, -1.37556, 0.972549, 1, 0, 1,
-0.9384336, 0.4289321, 0.08257415, 0.9686275, 1, 0, 1,
-0.9363571, 0.3176818, -0.2649536, 0.9607843, 1, 0, 1,
-0.9338775, -0.5360337, -2.189946, 0.9568627, 1, 0, 1,
-0.9218585, -1.520193, -2.083181, 0.9490196, 1, 0, 1,
-0.9146916, -1.062446, -4.62532, 0.945098, 1, 0, 1,
-0.9126812, 0.1613301, -1.230739, 0.9372549, 1, 0, 1,
-0.9088495, -0.1201692, -1.604159, 0.9333333, 1, 0, 1,
-0.9018003, 0.8013215, 0.0672395, 0.9254902, 1, 0, 1,
-0.8959212, -1.404197, -2.624629, 0.9215686, 1, 0, 1,
-0.8886819, -0.2802842, -1.780923, 0.9137255, 1, 0, 1,
-0.8854495, 0.8724955, -0.5002273, 0.9098039, 1, 0, 1,
-0.8837878, 0.264375, -1.429698, 0.9019608, 1, 0, 1,
-0.8818555, -0.7520113, -2.416881, 0.8941177, 1, 0, 1,
-0.8781666, 0.0822003, -1.817414, 0.8901961, 1, 0, 1,
-0.8781139, 0.17036, -0.6570308, 0.8823529, 1, 0, 1,
-0.8775072, 0.1095899, -0.652168, 0.8784314, 1, 0, 1,
-0.8755586, 0.3984846, 0.05359118, 0.8705882, 1, 0, 1,
-0.8745686, 1.34626, -1.151183, 0.8666667, 1, 0, 1,
-0.8732641, -1.391696, -1.754176, 0.8588235, 1, 0, 1,
-0.8674573, -1.601514, -3.163389, 0.854902, 1, 0, 1,
-0.8562475, 0.4049235, -2.337747, 0.8470588, 1, 0, 1,
-0.8487692, -1.357921, -3.861592, 0.8431373, 1, 0, 1,
-0.8483279, -1.114372, -3.254987, 0.8352941, 1, 0, 1,
-0.846401, -0.9743679, -2.919874, 0.8313726, 1, 0, 1,
-0.8428085, -0.5469769, -2.887497, 0.8235294, 1, 0, 1,
-0.842451, 0.6513555, -2.16968, 0.8196079, 1, 0, 1,
-0.8417091, 1.169934, -0.7184024, 0.8117647, 1, 0, 1,
-0.8408833, 0.7659482, -0.8430715, 0.8078431, 1, 0, 1,
-0.8379636, 0.6175866, -0.202543, 0.8, 1, 0, 1,
-0.8377247, 1.117331, -0.2198066, 0.7921569, 1, 0, 1,
-0.8363634, 0.004399889, -2.662395, 0.7882353, 1, 0, 1,
-0.8343111, 1.526608, 0.2685312, 0.7803922, 1, 0, 1,
-0.8269972, -1.132047, -1.14458, 0.7764706, 1, 0, 1,
-0.8251449, -0.7029781, -1.66103, 0.7686275, 1, 0, 1,
-0.7975025, -0.6228108, -1.595349, 0.7647059, 1, 0, 1,
-0.7951347, 0.3806894, -2.14648, 0.7568628, 1, 0, 1,
-0.7910043, -0.4309013, -0.4226261, 0.7529412, 1, 0, 1,
-0.7873875, 0.9803587, -0.3468275, 0.7450981, 1, 0, 1,
-0.7701164, 0.2975461, -1.279438, 0.7411765, 1, 0, 1,
-0.7694879, 2.413691, 0.4699551, 0.7333333, 1, 0, 1,
-0.7669523, 0.8136982, -0.630756, 0.7294118, 1, 0, 1,
-0.761768, 0.2914065, -3.547511, 0.7215686, 1, 0, 1,
-0.7562363, -0.6121311, -2.989491, 0.7176471, 1, 0, 1,
-0.7534458, 0.8450196, -1.253005, 0.7098039, 1, 0, 1,
-0.7475796, -0.2587847, -0.9318569, 0.7058824, 1, 0, 1,
-0.7470128, 1.335285, -1.028913, 0.6980392, 1, 0, 1,
-0.7457877, -1.729054, -3.155359, 0.6901961, 1, 0, 1,
-0.744203, -0.5799156, -3.391857, 0.6862745, 1, 0, 1,
-0.7439491, -0.56726, -2.950608, 0.6784314, 1, 0, 1,
-0.7346989, 1.613854, -1.118318, 0.6745098, 1, 0, 1,
-0.7318469, 1.364361, -0.27204, 0.6666667, 1, 0, 1,
-0.7316774, -1.485584, -3.002519, 0.6627451, 1, 0, 1,
-0.7287511, 2.065041, 0.3581379, 0.654902, 1, 0, 1,
-0.7271841, -0.2505004, -1.715272, 0.6509804, 1, 0, 1,
-0.724674, 1.465853, -0.9995776, 0.6431373, 1, 0, 1,
-0.7217556, 1.605518, -0.08708212, 0.6392157, 1, 0, 1,
-0.7145745, 0.9377158, 0.2846626, 0.6313726, 1, 0, 1,
-0.7129689, -1.793889, -2.70673, 0.627451, 1, 0, 1,
-0.7077777, 0.9631667, -0.897205, 0.6196079, 1, 0, 1,
-0.7037987, -0.1229815, -1.314063, 0.6156863, 1, 0, 1,
-0.7012144, 0.1890943, -0.3876415, 0.6078432, 1, 0, 1,
-0.6989992, -1.16582, -3.236582, 0.6039216, 1, 0, 1,
-0.6916932, 0.2155718, -1.349147, 0.5960785, 1, 0, 1,
-0.6880181, -0.2200437, -2.325383, 0.5882353, 1, 0, 1,
-0.6796211, -0.1990942, 0.1696384, 0.5843138, 1, 0, 1,
-0.679553, -0.1381049, -1.366884, 0.5764706, 1, 0, 1,
-0.676522, -1.358546, -3.804199, 0.572549, 1, 0, 1,
-0.6754757, -1.191035, -3.902066, 0.5647059, 1, 0, 1,
-0.6670935, 0.6043237, -0.4348852, 0.5607843, 1, 0, 1,
-0.6653536, 0.7582538, -1.345644, 0.5529412, 1, 0, 1,
-0.6649357, -0.05177095, 0.7382603, 0.5490196, 1, 0, 1,
-0.6648814, 1.713562, 0.07418281, 0.5411765, 1, 0, 1,
-0.6591344, -0.4050444, -3.293772, 0.5372549, 1, 0, 1,
-0.6541294, 0.07302395, -0.4605122, 0.5294118, 1, 0, 1,
-0.6540202, 1.946329, -0.2377917, 0.5254902, 1, 0, 1,
-0.6526728, 0.5073667, -1.090096, 0.5176471, 1, 0, 1,
-0.6506531, -0.5124521, -2.353098, 0.5137255, 1, 0, 1,
-0.647078, 0.7869176, -1.282175, 0.5058824, 1, 0, 1,
-0.6468195, 0.8879225, 0.8440914, 0.5019608, 1, 0, 1,
-0.6460078, 0.08616781, -0.6767005, 0.4941176, 1, 0, 1,
-0.6422497, -1.999592, -5.388235, 0.4862745, 1, 0, 1,
-0.6422268, 0.146402, -0.8209293, 0.4823529, 1, 0, 1,
-0.6416333, 0.1365691, -0.5289697, 0.4745098, 1, 0, 1,
-0.6412115, -0.1859324, -1.569104, 0.4705882, 1, 0, 1,
-0.638778, 0.1288693, -2.53184, 0.4627451, 1, 0, 1,
-0.6330017, -0.02947462, -1.77838, 0.4588235, 1, 0, 1,
-0.6313565, 0.623654, -0.2091272, 0.4509804, 1, 0, 1,
-0.6301326, -1.82662, -1.125794, 0.4470588, 1, 0, 1,
-0.6257836, -2.586778, -1.260956, 0.4392157, 1, 0, 1,
-0.6188193, 0.03314698, -3.030048, 0.4352941, 1, 0, 1,
-0.616675, -0.03615946, -2.917552, 0.427451, 1, 0, 1,
-0.6150709, 0.2764074, -2.448684, 0.4235294, 1, 0, 1,
-0.6147595, -1.663632, -2.899978, 0.4156863, 1, 0, 1,
-0.6103917, -0.8786853, -3.588698, 0.4117647, 1, 0, 1,
-0.6103371, -0.4148068, -1.375251, 0.4039216, 1, 0, 1,
-0.6085681, -0.3643932, -3.164046, 0.3960784, 1, 0, 1,
-0.6060529, -1.579918, -4.135108, 0.3921569, 1, 0, 1,
-0.6054489, 0.0002445797, -0.6997024, 0.3843137, 1, 0, 1,
-0.6014568, 0.8423322, -0.4099943, 0.3803922, 1, 0, 1,
-0.5998721, -0.9814293, -3.226529, 0.372549, 1, 0, 1,
-0.5963054, -0.01221802, -0.9718627, 0.3686275, 1, 0, 1,
-0.5848125, 1.666009, -1.104658, 0.3607843, 1, 0, 1,
-0.5826172, 0.2702906, -1.130574, 0.3568628, 1, 0, 1,
-0.5803076, -0.5489111, -3.69395, 0.3490196, 1, 0, 1,
-0.5747163, -1.256605, -3.589043, 0.345098, 1, 0, 1,
-0.5722651, -0.980005, -3.171748, 0.3372549, 1, 0, 1,
-0.5720233, 1.176133, -0.09915411, 0.3333333, 1, 0, 1,
-0.5705562, 0.3190309, -0.4974294, 0.3254902, 1, 0, 1,
-0.5689719, 1.366173, -0.7680726, 0.3215686, 1, 0, 1,
-0.5672189, 0.8826661, -0.5991296, 0.3137255, 1, 0, 1,
-0.5641405, 0.367687, 1.164214, 0.3098039, 1, 0, 1,
-0.5639322, -0.126732, -1.892236, 0.3019608, 1, 0, 1,
-0.5577278, 0.6453565, -0.7174789, 0.2941177, 1, 0, 1,
-0.5561302, -1.918676, -1.307926, 0.2901961, 1, 0, 1,
-0.5493463, 0.8116325, -0.2964225, 0.282353, 1, 0, 1,
-0.548525, -0.09073285, -3.949065, 0.2784314, 1, 0, 1,
-0.5478337, -0.8364177, -1.241697, 0.2705882, 1, 0, 1,
-0.5365239, 0.55863, -1.690393, 0.2666667, 1, 0, 1,
-0.5247179, 1.050559, 0.07983691, 0.2588235, 1, 0, 1,
-0.5212294, -0.01474695, 0.03757408, 0.254902, 1, 0, 1,
-0.5202503, 0.2982072, -0.771651, 0.2470588, 1, 0, 1,
-0.5189382, -0.4536521, -3.255866, 0.2431373, 1, 0, 1,
-0.5176025, -1.470243, -2.817412, 0.2352941, 1, 0, 1,
-0.5174791, -1.097541, -2.658976, 0.2313726, 1, 0, 1,
-0.5164115, 0.2783383, -1.121051, 0.2235294, 1, 0, 1,
-0.5116395, 1.715334, -1.216771, 0.2196078, 1, 0, 1,
-0.5108572, 0.1820493, -1.633042, 0.2117647, 1, 0, 1,
-0.5103008, -1.00198, -3.406712, 0.2078431, 1, 0, 1,
-0.5101821, 0.3501573, -0.1175082, 0.2, 1, 0, 1,
-0.5088674, 0.2592736, -0.5078239, 0.1921569, 1, 0, 1,
-0.5076325, 1.653543, -1.024237, 0.1882353, 1, 0, 1,
-0.5008227, -1.008694, -1.775551, 0.1803922, 1, 0, 1,
-0.4917752, 0.845351, 2.208276, 0.1764706, 1, 0, 1,
-0.4911864, -0.5100661, -2.554961, 0.1686275, 1, 0, 1,
-0.4910977, 0.8712379, 0.6280505, 0.1647059, 1, 0, 1,
-0.4887733, -0.5172395, -2.869832, 0.1568628, 1, 0, 1,
-0.4881503, -0.07978816, -2.449488, 0.1529412, 1, 0, 1,
-0.4861628, -1.488568, -3.452716, 0.145098, 1, 0, 1,
-0.4830366, 0.6131984, -0.1710082, 0.1411765, 1, 0, 1,
-0.482045, -0.290396, -0.2894969, 0.1333333, 1, 0, 1,
-0.4787488, 0.4856201, 0.637912, 0.1294118, 1, 0, 1,
-0.4771649, -0.04133097, -2.859855, 0.1215686, 1, 0, 1,
-0.471828, 0.917285, 0.1383348, 0.1176471, 1, 0, 1,
-0.4714926, -0.1840947, -4.398851, 0.1098039, 1, 0, 1,
-0.4710073, -1.411841, -2.954554, 0.1058824, 1, 0, 1,
-0.4676706, 1.196538, -0.0750912, 0.09803922, 1, 0, 1,
-0.4661667, -0.2924384, -2.981035, 0.09019608, 1, 0, 1,
-0.4613774, -0.753912, -1.556976, 0.08627451, 1, 0, 1,
-0.4585996, 1.073498, 0.6629087, 0.07843138, 1, 0, 1,
-0.4582451, -0.5492129, -3.595681, 0.07450981, 1, 0, 1,
-0.4580287, -0.1909254, -1.563637, 0.06666667, 1, 0, 1,
-0.4535178, 0.8763521, -0.713606, 0.0627451, 1, 0, 1,
-0.4512488, -0.2185185, -3.125646, 0.05490196, 1, 0, 1,
-0.4508629, 0.9528639, -0.7714272, 0.05098039, 1, 0, 1,
-0.4478534, -0.6780564, -2.633645, 0.04313726, 1, 0, 1,
-0.4352655, 0.00118298, -2.506859, 0.03921569, 1, 0, 1,
-0.4303388, -0.6765848, -1.977066, 0.03137255, 1, 0, 1,
-0.4298312, -0.6623948, -3.177042, 0.02745098, 1, 0, 1,
-0.4297251, -0.8513829, -3.480458, 0.01960784, 1, 0, 1,
-0.4294452, 1.615051, 1.639562, 0.01568628, 1, 0, 1,
-0.4293392, -1.380473, -3.392701, 0.007843138, 1, 0, 1,
-0.4289614, 0.4171621, -1.743564, 0.003921569, 1, 0, 1,
-0.4286406, -1.013599, -3.071086, 0, 1, 0.003921569, 1,
-0.425331, 1.809981, -0.7793617, 0, 1, 0.01176471, 1,
-0.4247289, 0.2994551, -1.46799, 0, 1, 0.01568628, 1,
-0.4247177, 0.08360588, -1.81785, 0, 1, 0.02352941, 1,
-0.4224808, 0.8931908, -1.440298, 0, 1, 0.02745098, 1,
-0.4208158, -0.1923946, -3.940221, 0, 1, 0.03529412, 1,
-0.4204523, -0.2508336, -2.656408, 0, 1, 0.03921569, 1,
-0.4195864, -2.287903, -2.188593, 0, 1, 0.04705882, 1,
-0.4189043, 0.6184329, -0.3816482, 0, 1, 0.05098039, 1,
-0.4182379, 0.9602661, -0.3865964, 0, 1, 0.05882353, 1,
-0.4181267, 0.5890592, -0.5847867, 0, 1, 0.0627451, 1,
-0.417037, 0.8788011, -1.176573, 0, 1, 0.07058824, 1,
-0.4161861, -1.124297, -3.4447, 0, 1, 0.07450981, 1,
-0.413232, -1.692704, -2.466708, 0, 1, 0.08235294, 1,
-0.4124911, -1.75721, -3.138694, 0, 1, 0.08627451, 1,
-0.4093523, -0.7192619, -3.504444, 0, 1, 0.09411765, 1,
-0.3976887, -0.5101422, -0.8118088, 0, 1, 0.1019608, 1,
-0.393519, 0.5218975, -0.6165148, 0, 1, 0.1058824, 1,
-0.3925123, -0.5296028, -3.840455, 0, 1, 0.1137255, 1,
-0.3862663, 0.5369684, -1.942876, 0, 1, 0.1176471, 1,
-0.3856558, -1.094389, -2.347039, 0, 1, 0.1254902, 1,
-0.3856372, -1.238524, -3.690284, 0, 1, 0.1294118, 1,
-0.3812243, -0.3209429, -0.1406044, 0, 1, 0.1372549, 1,
-0.3791571, -1.462895, -2.427871, 0, 1, 0.1411765, 1,
-0.3784082, -0.4592097, -3.807604, 0, 1, 0.1490196, 1,
-0.3766236, -1.229752, -3.563172, 0, 1, 0.1529412, 1,
-0.3742988, -2.082866, -1.989691, 0, 1, 0.1607843, 1,
-0.3715361, -0.3410719, -0.7883404, 0, 1, 0.1647059, 1,
-0.3638674, 0.9616103, -0.527038, 0, 1, 0.172549, 1,
-0.3560444, 1.040461, -1.319031, 0, 1, 0.1764706, 1,
-0.3557356, 0.1157993, 1.175182, 0, 1, 0.1843137, 1,
-0.354331, -0.9450856, -4.338142, 0, 1, 0.1882353, 1,
-0.3533659, 0.05909994, -1.206598, 0, 1, 0.1960784, 1,
-0.3523887, 0.934395, -0.4637558, 0, 1, 0.2039216, 1,
-0.3520305, -0.1976344, -3.117407, 0, 1, 0.2078431, 1,
-0.3519302, -0.3466207, -4.166903, 0, 1, 0.2156863, 1,
-0.3508285, 1.025195, -0.679692, 0, 1, 0.2196078, 1,
-0.3488698, -0.5256051, -2.85611, 0, 1, 0.227451, 1,
-0.3419389, 2.062995, -0.8720458, 0, 1, 0.2313726, 1,
-0.3412777, 1.269576, -0.7067651, 0, 1, 0.2392157, 1,
-0.3393392, -0.8644637, -2.376366, 0, 1, 0.2431373, 1,
-0.3327488, -0.4189211, -3.16538, 0, 1, 0.2509804, 1,
-0.3279593, -1.034298, -2.440854, 0, 1, 0.254902, 1,
-0.3271697, -0.6987776, -2.955419, 0, 1, 0.2627451, 1,
-0.3256726, -0.9397845, -1.81533, 0, 1, 0.2666667, 1,
-0.3252246, -0.7602307, -2.057116, 0, 1, 0.2745098, 1,
-0.323256, 1.131474, 1.377559, 0, 1, 0.2784314, 1,
-0.3212398, -0.760639, -2.447201, 0, 1, 0.2862745, 1,
-0.3199588, -0.1100071, 0.2215556, 0, 1, 0.2901961, 1,
-0.3185577, 1.278214, -1.363519, 0, 1, 0.2980392, 1,
-0.3182664, 0.6985788, -0.2924018, 0, 1, 0.3058824, 1,
-0.3152482, 0.2850129, -1.714788, 0, 1, 0.3098039, 1,
-0.3127831, 0.55489, 0.08871727, 0, 1, 0.3176471, 1,
-0.3108064, -2.328888, -3.101723, 0, 1, 0.3215686, 1,
-0.3095762, -1.667635, -3.512964, 0, 1, 0.3294118, 1,
-0.3064289, -1.262175, -1.147008, 0, 1, 0.3333333, 1,
-0.3003855, 1.506493, -0.7887477, 0, 1, 0.3411765, 1,
-0.2995929, 2.152237, -0.6109368, 0, 1, 0.345098, 1,
-0.2963953, -0.6697866, -3.332298, 0, 1, 0.3529412, 1,
-0.2928957, 1.185083, 0.4769606, 0, 1, 0.3568628, 1,
-0.2918926, -0.7637488, -1.401057, 0, 1, 0.3647059, 1,
-0.2851461, -0.5104024, -3.484075, 0, 1, 0.3686275, 1,
-0.2840899, 0.6619014, 0.4073227, 0, 1, 0.3764706, 1,
-0.2803381, -0.1236998, -0.4721482, 0, 1, 0.3803922, 1,
-0.2764594, -1.467255, -4.206516, 0, 1, 0.3882353, 1,
-0.2755733, 0.9720467, -1.771328, 0, 1, 0.3921569, 1,
-0.273925, 0.8327755, 0.8959033, 0, 1, 0.4, 1,
-0.2637047, 1.225844, 0.04054819, 0, 1, 0.4078431, 1,
-0.2587366, 0.796452, -0.3079848, 0, 1, 0.4117647, 1,
-0.2561391, 2.00564, -0.3523569, 0, 1, 0.4196078, 1,
-0.2559902, -0.1691152, -3.544657, 0, 1, 0.4235294, 1,
-0.2530081, 0.4112751, 0.1749908, 0, 1, 0.4313726, 1,
-0.2528312, 0.7583539, -1.339133, 0, 1, 0.4352941, 1,
-0.2515214, -0.7812247, -3.80658, 0, 1, 0.4431373, 1,
-0.2465179, -0.2308897, -3.374462, 0, 1, 0.4470588, 1,
-0.2454012, -1.833229, -1.252262, 0, 1, 0.454902, 1,
-0.2431733, -0.7907124, -3.104, 0, 1, 0.4588235, 1,
-0.2419454, 0.8415162, -0.1993973, 0, 1, 0.4666667, 1,
-0.2401392, 0.4154579, -2.341681, 0, 1, 0.4705882, 1,
-0.2382611, 0.07657571, -0.8696835, 0, 1, 0.4784314, 1,
-0.2366652, 1.283526, -1.469597, 0, 1, 0.4823529, 1,
-0.2333325, 0.05993674, -1.731041, 0, 1, 0.4901961, 1,
-0.2314097, -0.8106544, -1.837104, 0, 1, 0.4941176, 1,
-0.2264848, -1.242839, -2.56472, 0, 1, 0.5019608, 1,
-0.2256257, 1.843874, -1.234082, 0, 1, 0.509804, 1,
-0.2234788, 0.6109468, -1.066873, 0, 1, 0.5137255, 1,
-0.2193324, -0.9610292, -2.615187, 0, 1, 0.5215687, 1,
-0.2179488, -0.3141977, -3.396579, 0, 1, 0.5254902, 1,
-0.2163431, 2.416377, -0.5164464, 0, 1, 0.5333334, 1,
-0.2138879, -0.6789557, -2.03379, 0, 1, 0.5372549, 1,
-0.2103493, -0.3481591, -2.768243, 0, 1, 0.5450981, 1,
-0.2072616, 1.038235, -1.018746, 0, 1, 0.5490196, 1,
-0.2049502, 1.223286, 0.6500325, 0, 1, 0.5568628, 1,
-0.2042253, 1.013653, -2.146517, 0, 1, 0.5607843, 1,
-0.2039558, 1.636449, -1.352117, 0, 1, 0.5686275, 1,
-0.2027743, -0.8338663, -1.871708, 0, 1, 0.572549, 1,
-0.1997261, 1.662813, -0.647851, 0, 1, 0.5803922, 1,
-0.1989452, 0.9721728, -1.206368, 0, 1, 0.5843138, 1,
-0.1921143, 1.143414, -0.4526236, 0, 1, 0.5921569, 1,
-0.1821075, -0.6989599, -2.546507, 0, 1, 0.5960785, 1,
-0.1735784, -1.641216, -3.345471, 0, 1, 0.6039216, 1,
-0.1725191, 0.2650036, -1.230663, 0, 1, 0.6117647, 1,
-0.1723412, 1.43601, 0.1079583, 0, 1, 0.6156863, 1,
-0.1692528, -0.6052467, -1.653224, 0, 1, 0.6235294, 1,
-0.168698, -0.0332375, -1.595487, 0, 1, 0.627451, 1,
-0.1640491, -1.459148, -1.158699, 0, 1, 0.6352941, 1,
-0.1631521, 1.881689, -0.6873441, 0, 1, 0.6392157, 1,
-0.1620526, -0.8654767, -2.445251, 0, 1, 0.6470588, 1,
-0.1595089, 0.9308473, -1.395056, 0, 1, 0.6509804, 1,
-0.1591164, 0.6828184, 0.7114581, 0, 1, 0.6588235, 1,
-0.1588806, -0.2125981, -1.689162, 0, 1, 0.6627451, 1,
-0.1568439, -0.7095985, -2.021248, 0, 1, 0.6705883, 1,
-0.1561328, 0.697708, 1.156567, 0, 1, 0.6745098, 1,
-0.1560058, 0.8768405, 0.1900595, 0, 1, 0.682353, 1,
-0.1559563, 0.1599597, -0.8770633, 0, 1, 0.6862745, 1,
-0.1463776, 1.596526, 2.197428, 0, 1, 0.6941177, 1,
-0.1422604, 2.152273, -1.093558, 0, 1, 0.7019608, 1,
-0.1415419, -2.016615, -3.652072, 0, 1, 0.7058824, 1,
-0.1375801, -0.6490061, -5.034532, 0, 1, 0.7137255, 1,
-0.1366766, -2.406188, -3.307529, 0, 1, 0.7176471, 1,
-0.1362617, 0.3541848, 0.8250311, 0, 1, 0.7254902, 1,
-0.1351247, -0.2487185, -3.607899, 0, 1, 0.7294118, 1,
-0.1351097, 0.1856903, -0.6293072, 0, 1, 0.7372549, 1,
-0.1312742, 0.257406, -0.8500282, 0, 1, 0.7411765, 1,
-0.1278942, 1.375829, 0.3214576, 0, 1, 0.7490196, 1,
-0.1225373, -0.7432494, -2.932339, 0, 1, 0.7529412, 1,
-0.1213996, 0.1784918, -0.3345235, 0, 1, 0.7607843, 1,
-0.12131, -1.254704, -4.078882, 0, 1, 0.7647059, 1,
-0.1188716, -2.410962, -3.251068, 0, 1, 0.772549, 1,
-0.1163562, -0.4431613, -5.384403, 0, 1, 0.7764706, 1,
-0.1159845, -0.2839577, -2.548528, 0, 1, 0.7843137, 1,
-0.1123655, -1.052277, -4.450956, 0, 1, 0.7882353, 1,
-0.1073666, 0.4441835, 0.9341566, 0, 1, 0.7960784, 1,
-0.1004004, -1.062335, -1.784245, 0, 1, 0.8039216, 1,
-0.09573165, -0.4052377, -2.484475, 0, 1, 0.8078431, 1,
-0.09369972, 0.2184628, -1.231267, 0, 1, 0.8156863, 1,
-0.08990375, 0.02675571, -0.5409987, 0, 1, 0.8196079, 1,
-0.08973923, -0.4118748, -2.759801, 0, 1, 0.827451, 1,
-0.08557519, 1.463583, -0.3930738, 0, 1, 0.8313726, 1,
-0.08510939, 1.061148, -2.053489, 0, 1, 0.8392157, 1,
-0.08435053, 0.1019195, -0.9266643, 0, 1, 0.8431373, 1,
-0.08011182, -0.2386578, -4.933512, 0, 1, 0.8509804, 1,
-0.07963585, 0.1573812, 0.2478327, 0, 1, 0.854902, 1,
-0.07901227, -0.319428, -3.368574, 0, 1, 0.8627451, 1,
-0.07444804, -2.15291, -4.552577, 0, 1, 0.8666667, 1,
-0.07442988, 0.6744837, 1.026782, 0, 1, 0.8745098, 1,
-0.06970703, 0.4464575, 1.21804, 0, 1, 0.8784314, 1,
-0.06931806, -0.8336328, -1.664944, 0, 1, 0.8862745, 1,
-0.06920337, -1.061576, -2.406369, 0, 1, 0.8901961, 1,
-0.06636654, -0.5101195, -3.829654, 0, 1, 0.8980392, 1,
-0.06373914, -0.1242696, -2.416529, 0, 1, 0.9058824, 1,
-0.06178189, -1.185448, -3.775988, 0, 1, 0.9098039, 1,
-0.05969568, 1.831232, -0.2406477, 0, 1, 0.9176471, 1,
-0.05929769, 0.07802083, -1.295782, 0, 1, 0.9215686, 1,
-0.05738856, -1.101307, -2.284206, 0, 1, 0.9294118, 1,
-0.05594149, 0.7676926, -0.1878299, 0, 1, 0.9333333, 1,
-0.05339661, -0.1822026, -2.008231, 0, 1, 0.9411765, 1,
-0.05273315, -1.573757, -2.995053, 0, 1, 0.945098, 1,
-0.04835608, 1.050138, -0.5790302, 0, 1, 0.9529412, 1,
-0.04465809, 0.2402238, -0.7861592, 0, 1, 0.9568627, 1,
-0.04388444, 0.8907897, -0.2397298, 0, 1, 0.9647059, 1,
-0.04334917, -1.275413, -4.051286, 0, 1, 0.9686275, 1,
-0.0368793, -1.561116, -5.014445, 0, 1, 0.9764706, 1,
-0.03411322, 0.6513885, 0.3997895, 0, 1, 0.9803922, 1,
-0.02922926, 1.099831, 0.3317168, 0, 1, 0.9882353, 1,
-0.0290603, -0.7733309, -4.299725, 0, 1, 0.9921569, 1,
-0.02578451, 0.7298365, -0.3191988, 0, 1, 1, 1,
-0.02133384, -0.8953383, -1.463726, 0, 0.9921569, 1, 1,
-0.0137836, 1.267776, -0.8665943, 0, 0.9882353, 1, 1,
-0.009588217, -0.4108638, -2.785896, 0, 0.9803922, 1, 1,
-0.007851394, -0.1224219, -4.086292, 0, 0.9764706, 1, 1,
-0.006246012, 1.086965, 0.6190391, 0, 0.9686275, 1, 1,
-0.005744296, -0.6228352, -1.08126, 0, 0.9647059, 1, 1,
-0.005308036, 0.2492111, -0.1444216, 0, 0.9568627, 1, 1,
0.0001868362, 1.38797, 0.3945749, 0, 0.9529412, 1, 1,
0.002890898, -1.083816, 2.093733, 0, 0.945098, 1, 1,
0.007237496, -2.001042, 1.238326, 0, 0.9411765, 1, 1,
0.009114334, 0.9786392, 0.5804968, 0, 0.9333333, 1, 1,
0.01292543, 0.2808808, 0.5320785, 0, 0.9294118, 1, 1,
0.01464396, 0.3373323, -0.8238723, 0, 0.9215686, 1, 1,
0.0229118, -0.3730891, 4.181461, 0, 0.9176471, 1, 1,
0.02413629, -0.7890078, 5.746915, 0, 0.9098039, 1, 1,
0.02602654, 0.1764938, 0.6397877, 0, 0.9058824, 1, 1,
0.02612567, -1.18478, 1.436956, 0, 0.8980392, 1, 1,
0.02860363, 0.8568331, -0.3735989, 0, 0.8901961, 1, 1,
0.03289756, 1.005478, 0.3013724, 0, 0.8862745, 1, 1,
0.03320504, -1.440536, 3.109249, 0, 0.8784314, 1, 1,
0.03423715, -1.137257, 2.59221, 0, 0.8745098, 1, 1,
0.0358083, -1.850989, 3.175127, 0, 0.8666667, 1, 1,
0.03689853, 0.9340347, -0.3206021, 0, 0.8627451, 1, 1,
0.04049765, 0.5857006, -0.8589126, 0, 0.854902, 1, 1,
0.04167263, 1.347295, -0.06651562, 0, 0.8509804, 1, 1,
0.0460365, 0.2076243, 0.7854754, 0, 0.8431373, 1, 1,
0.05171826, 0.1646563, 0.2775428, 0, 0.8392157, 1, 1,
0.05290303, 0.3769323, -0.6472597, 0, 0.8313726, 1, 1,
0.05525759, 0.6312034, 0.5514749, 0, 0.827451, 1, 1,
0.05949456, 0.8253203, -2.127722, 0, 0.8196079, 1, 1,
0.06065587, 0.4971574, -1.169228, 0, 0.8156863, 1, 1,
0.07742757, 1.518304, 1.004245, 0, 0.8078431, 1, 1,
0.07863118, -0.2792101, 2.880605, 0, 0.8039216, 1, 1,
0.08350889, -0.3891295, 2.285082, 0, 0.7960784, 1, 1,
0.0854805, -0.2637599, 2.703737, 0, 0.7882353, 1, 1,
0.08721558, 0.8838865, -0.8124862, 0, 0.7843137, 1, 1,
0.09100357, 0.6650951, 1.245177, 0, 0.7764706, 1, 1,
0.09138231, -0.7562951, 2.292833, 0, 0.772549, 1, 1,
0.09421614, 1.770939, 0.4447329, 0, 0.7647059, 1, 1,
0.09695937, -1.146142, 3.348449, 0, 0.7607843, 1, 1,
0.09819338, -1.580211, 3.789672, 0, 0.7529412, 1, 1,
0.1002683, 0.4335796, 1.040858, 0, 0.7490196, 1, 1,
0.1012406, 0.2206181, 0.7258474, 0, 0.7411765, 1, 1,
0.1022558, -1.100117, 2.921686, 0, 0.7372549, 1, 1,
0.1025496, -0.6151266, 4.479777, 0, 0.7294118, 1, 1,
0.1054223, 0.140959, 0.8792323, 0, 0.7254902, 1, 1,
0.1055874, 0.2803717, -0.07286356, 0, 0.7176471, 1, 1,
0.1057136, 1.626131, 2.344208, 0, 0.7137255, 1, 1,
0.1058205, 0.4337308, 1.329387, 0, 0.7058824, 1, 1,
0.1066201, -0.894096, 2.471046, 0, 0.6980392, 1, 1,
0.1119047, 0.356145, -0.1794116, 0, 0.6941177, 1, 1,
0.1120365, -0.8727506, 4.016557, 0, 0.6862745, 1, 1,
0.1155255, 0.3561805, 1.506811, 0, 0.682353, 1, 1,
0.117854, -0.1905694, 2.719438, 0, 0.6745098, 1, 1,
0.1268775, 2.39188, -0.6354593, 0, 0.6705883, 1, 1,
0.1313966, 0.01935909, 1.737186, 0, 0.6627451, 1, 1,
0.1327516, -0.7150736, 2.187911, 0, 0.6588235, 1, 1,
0.1357621, 1.497193, 0.3554586, 0, 0.6509804, 1, 1,
0.1387286, -0.0488596, 0.6718653, 0, 0.6470588, 1, 1,
0.1390718, 0.2397644, -0.01739543, 0, 0.6392157, 1, 1,
0.1396666, 0.04905189, 0.6160037, 0, 0.6352941, 1, 1,
0.1398159, 0.4961651, 1.33348, 0, 0.627451, 1, 1,
0.1470787, 0.8644027, -0.4969284, 0, 0.6235294, 1, 1,
0.1474636, -0.6250272, 6.516097, 0, 0.6156863, 1, 1,
0.1551745, -2.233482, 1.569526, 0, 0.6117647, 1, 1,
0.1561716, -0.5439006, 3.060439, 0, 0.6039216, 1, 1,
0.1567122, 0.01681259, 2.301982, 0, 0.5960785, 1, 1,
0.1568975, 0.3360651, 0.3846724, 0, 0.5921569, 1, 1,
0.1590548, -0.5749177, 0.685127, 0, 0.5843138, 1, 1,
0.1682248, 1.370828, 0.06202475, 0, 0.5803922, 1, 1,
0.1718059, 0.2969638, -0.7805628, 0, 0.572549, 1, 1,
0.1753992, -0.733714, 2.68109, 0, 0.5686275, 1, 1,
0.1766714, 1.914827, 1.085432, 0, 0.5607843, 1, 1,
0.1779072, 0.009372183, -0.1309869, 0, 0.5568628, 1, 1,
0.1793485, -0.2468611, 3.189142, 0, 0.5490196, 1, 1,
0.1810796, -0.4252184, 3.588594, 0, 0.5450981, 1, 1,
0.1812927, -0.2849703, 2.163515, 0, 0.5372549, 1, 1,
0.1864181, -0.1972605, 3.439036, 0, 0.5333334, 1, 1,
0.1875008, -1.764126, 3.302567, 0, 0.5254902, 1, 1,
0.19696, 0.4161355, 0.7237651, 0, 0.5215687, 1, 1,
0.1970774, -0.8667122, 2.386185, 0, 0.5137255, 1, 1,
0.2012546, 0.4828875, 0.1983215, 0, 0.509804, 1, 1,
0.2017063, -1.430183, 4.608631, 0, 0.5019608, 1, 1,
0.2035731, 1.257302, 1.199195, 0, 0.4941176, 1, 1,
0.2073393, 0.8869765, -0.9066381, 0, 0.4901961, 1, 1,
0.2089155, 0.2693113, -0.3093037, 0, 0.4823529, 1, 1,
0.2109947, -0.7375261, 2.956557, 0, 0.4784314, 1, 1,
0.2138002, -0.3560564, 2.951625, 0, 0.4705882, 1, 1,
0.2160302, 1.899011, 1.932596, 0, 0.4666667, 1, 1,
0.2181585, -1.279696, 2.581222, 0, 0.4588235, 1, 1,
0.2184308, -0.2395098, 2.57019, 0, 0.454902, 1, 1,
0.2263846, -0.5201551, 1.313212, 0, 0.4470588, 1, 1,
0.2292604, -0.02601157, 1.169971, 0, 0.4431373, 1, 1,
0.2326026, 1.344424, 0.763653, 0, 0.4352941, 1, 1,
0.2338109, 0.2141976, 1.419495, 0, 0.4313726, 1, 1,
0.2341897, -2.588178, 2.762994, 0, 0.4235294, 1, 1,
0.2371641, 1.815946, -0.8002668, 0, 0.4196078, 1, 1,
0.2372155, -0.9038204, 3.0905, 0, 0.4117647, 1, 1,
0.2372653, -0.3174932, 3.405069, 0, 0.4078431, 1, 1,
0.2391817, -0.2071774, 3.654612, 0, 0.4, 1, 1,
0.2392281, -2.875778, 2.178002, 0, 0.3921569, 1, 1,
0.2401707, 0.5757527, 1.498641, 0, 0.3882353, 1, 1,
0.2429111, -0.04726673, 1.341748, 0, 0.3803922, 1, 1,
0.2448288, -0.2989623, 1.12359, 0, 0.3764706, 1, 1,
0.2498045, -0.1961072, 3.744094, 0, 0.3686275, 1, 1,
0.2507627, 0.1869258, -0.125654, 0, 0.3647059, 1, 1,
0.2510412, 0.171818, 1.698578, 0, 0.3568628, 1, 1,
0.2516063, -0.4308644, 4.648774, 0, 0.3529412, 1, 1,
0.256932, -1.176444, 1.47365, 0, 0.345098, 1, 1,
0.2581222, 1.916317, -0.5275046, 0, 0.3411765, 1, 1,
0.2611551, -2.128611, 2.919812, 0, 0.3333333, 1, 1,
0.2666838, 0.7277393, 0.6498779, 0, 0.3294118, 1, 1,
0.2668553, 0.08253808, 0.1747305, 0, 0.3215686, 1, 1,
0.2669308, 1.32531, 0.6594519, 0, 0.3176471, 1, 1,
0.2669357, 0.02135889, 1.319667, 0, 0.3098039, 1, 1,
0.2674024, 0.3146883, 1.349794, 0, 0.3058824, 1, 1,
0.2736476, -0.1809523, 3.023188, 0, 0.2980392, 1, 1,
0.2743198, -0.4448694, 2.113678, 0, 0.2901961, 1, 1,
0.279708, 0.5988266, 1.722107, 0, 0.2862745, 1, 1,
0.2806074, 1.629821, 0.5745091, 0, 0.2784314, 1, 1,
0.2825391, 0.1169077, 0.04208346, 0, 0.2745098, 1, 1,
0.2834697, -0.9060532, 2.707778, 0, 0.2666667, 1, 1,
0.2834772, -0.8182005, 3.552389, 0, 0.2627451, 1, 1,
0.2862722, 0.02531816, 0.9940049, 0, 0.254902, 1, 1,
0.2891051, 0.3016968, -1.342512, 0, 0.2509804, 1, 1,
0.2903557, -1.833015, 3.732265, 0, 0.2431373, 1, 1,
0.2912439, 2.086734, 0.7716913, 0, 0.2392157, 1, 1,
0.2986639, -1.0655, 2.537028, 0, 0.2313726, 1, 1,
0.2997876, -1.243538, 3.475828, 0, 0.227451, 1, 1,
0.3009554, -0.4330618, 3.534801, 0, 0.2196078, 1, 1,
0.3049604, -0.5674415, 3.353408, 0, 0.2156863, 1, 1,
0.3070815, 0.4950547, -1.578015, 0, 0.2078431, 1, 1,
0.3074224, -0.3492821, 2.075995, 0, 0.2039216, 1, 1,
0.3075027, -0.6738545, 2.475679, 0, 0.1960784, 1, 1,
0.3095349, -0.2272787, 2.282503, 0, 0.1882353, 1, 1,
0.3112473, -0.2292591, 3.598737, 0, 0.1843137, 1, 1,
0.3128888, 1.783603, -0.3524971, 0, 0.1764706, 1, 1,
0.3196544, -0.5299065, 2.050908, 0, 0.172549, 1, 1,
0.3234772, 0.986568, 1.138885, 0, 0.1647059, 1, 1,
0.3352205, 0.5201358, -1.418784, 0, 0.1607843, 1, 1,
0.3366569, 0.6191962, -0.8113697, 0, 0.1529412, 1, 1,
0.339433, -0.5397227, 3.267883, 0, 0.1490196, 1, 1,
0.3458403, -1.535708, 2.500333, 0, 0.1411765, 1, 1,
0.3464808, -0.7083291, 3.096498, 0, 0.1372549, 1, 1,
0.3599219, 0.5201883, 1.957275, 0, 0.1294118, 1, 1,
0.3609419, -0.8154007, 3.39362, 0, 0.1254902, 1, 1,
0.3701701, 0.01723829, 1.327187, 0, 0.1176471, 1, 1,
0.3707822, 0.7340342, 1.090347, 0, 0.1137255, 1, 1,
0.3725363, 0.2265212, 1.166357, 0, 0.1058824, 1, 1,
0.372843, 1.088693, 0.1249754, 0, 0.09803922, 1, 1,
0.3731514, 1.028821, 0.2355645, 0, 0.09411765, 1, 1,
0.375732, -0.8667206, 1.869081, 0, 0.08627451, 1, 1,
0.3758969, -0.1886381, 2.755133, 0, 0.08235294, 1, 1,
0.3760384, -1.140815, 2.967445, 0, 0.07450981, 1, 1,
0.3829858, -0.8251557, 3.858418, 0, 0.07058824, 1, 1,
0.3836214, -0.7862111, 4.201535, 0, 0.0627451, 1, 1,
0.383668, -0.2910869, 1.40397, 0, 0.05882353, 1, 1,
0.3852411, 0.209964, 2.204244, 0, 0.05098039, 1, 1,
0.3853261, -1.260587, 2.892149, 0, 0.04705882, 1, 1,
0.3886982, 0.950865, 0.3207758, 0, 0.03921569, 1, 1,
0.3921642, 0.4470087, 1.333062, 0, 0.03529412, 1, 1,
0.3931552, -1.595743, 4.805762, 0, 0.02745098, 1, 1,
0.3946055, -0.5149614, 2.046668, 0, 0.02352941, 1, 1,
0.4016447, 1.241946, 0.6930558, 0, 0.01568628, 1, 1,
0.4078631, 0.5396985, 1.25848, 0, 0.01176471, 1, 1,
0.4101135, 0.03386983, 1.512859, 0, 0.003921569, 1, 1,
0.4106253, -0.8487134, 2.784585, 0.003921569, 0, 1, 1,
0.4134458, 0.6259267, 3.156933, 0.007843138, 0, 1, 1,
0.4153486, 1.083404, 0.9675441, 0.01568628, 0, 1, 1,
0.4173284, 0.4866059, -0.2166643, 0.01960784, 0, 1, 1,
0.4225464, -1.667789, 4.244572, 0.02745098, 0, 1, 1,
0.4226617, -0.4654584, 2.911052, 0.03137255, 0, 1, 1,
0.4356125, 1.111811, 1.840872, 0.03921569, 0, 1, 1,
0.4385388, -1.091887, 2.141938, 0.04313726, 0, 1, 1,
0.4394698, 1.609611, -0.2652913, 0.05098039, 0, 1, 1,
0.4428101, 1.013947, -0.1104025, 0.05490196, 0, 1, 1,
0.4476448, -1.963038, 2.459105, 0.0627451, 0, 1, 1,
0.4492633, -0.1603039, 1.025993, 0.06666667, 0, 1, 1,
0.4530911, 0.002286563, 1.682164, 0.07450981, 0, 1, 1,
0.4540853, -0.564364, 2.708357, 0.07843138, 0, 1, 1,
0.4620509, -1.500718, 2.354331, 0.08627451, 0, 1, 1,
0.4655066, 1.078909, -1.183235, 0.09019608, 0, 1, 1,
0.4660087, 1.825746, 0.4323108, 0.09803922, 0, 1, 1,
0.4667201, -0.05218986, 2.583933, 0.1058824, 0, 1, 1,
0.4693505, 1.295702, 1.317956, 0.1098039, 0, 1, 1,
0.4694195, -0.7728026, 3.203834, 0.1176471, 0, 1, 1,
0.4697576, -0.6592181, 2.060396, 0.1215686, 0, 1, 1,
0.4697777, -0.9531339, 3.580961, 0.1294118, 0, 1, 1,
0.4714846, 0.222734, 0.7189666, 0.1333333, 0, 1, 1,
0.4717437, 0.6982487, 2.883873, 0.1411765, 0, 1, 1,
0.4726893, -0.5546515, 2.401183, 0.145098, 0, 1, 1,
0.474286, -0.2687595, 2.847314, 0.1529412, 0, 1, 1,
0.4747471, -1.129791, 3.783295, 0.1568628, 0, 1, 1,
0.4843826, 1.693154, 3.009271, 0.1647059, 0, 1, 1,
0.4849287, -2.003958, 2.665782, 0.1686275, 0, 1, 1,
0.492065, -0.01479131, 1.291604, 0.1764706, 0, 1, 1,
0.4932841, -0.09286401, 1.722841, 0.1803922, 0, 1, 1,
0.4992978, -0.05902153, 1.880651, 0.1882353, 0, 1, 1,
0.501728, -0.1214709, 1.575938, 0.1921569, 0, 1, 1,
0.5081822, -0.06987766, 1.744856, 0.2, 0, 1, 1,
0.5082408, -0.841561, 1.504302, 0.2078431, 0, 1, 1,
0.5114646, 0.0782142, 2.354436, 0.2117647, 0, 1, 1,
0.5115348, -1.455908, 3.529862, 0.2196078, 0, 1, 1,
0.5157285, 0.6887408, 0.5432154, 0.2235294, 0, 1, 1,
0.5187026, -0.4527535, 0.9070727, 0.2313726, 0, 1, 1,
0.5229277, -0.5016147, 2.935841, 0.2352941, 0, 1, 1,
0.5237795, -1.247764, 3.324479, 0.2431373, 0, 1, 1,
0.5297416, -0.3165388, 0.869382, 0.2470588, 0, 1, 1,
0.5313328, -1.730391, 2.516719, 0.254902, 0, 1, 1,
0.5346617, -0.7113243, 2.148774, 0.2588235, 0, 1, 1,
0.5376068, -1.810225, 1.69487, 0.2666667, 0, 1, 1,
0.5376623, 1.132228, -0.3638736, 0.2705882, 0, 1, 1,
0.5420966, -0.7389358, 1.796503, 0.2784314, 0, 1, 1,
0.5431182, -0.9242237, 1.872893, 0.282353, 0, 1, 1,
0.547346, 1.230603, 2.076473, 0.2901961, 0, 1, 1,
0.5493883, 0.2153014, 0.1130226, 0.2941177, 0, 1, 1,
0.5510725, 0.01286488, 1.135426, 0.3019608, 0, 1, 1,
0.5523186, 0.7275209, 0.779137, 0.3098039, 0, 1, 1,
0.555917, -1.316617, 2.658645, 0.3137255, 0, 1, 1,
0.5560427, -0.3456641, 2.673707, 0.3215686, 0, 1, 1,
0.5600699, -0.6169307, -0.538448, 0.3254902, 0, 1, 1,
0.5603864, -0.4950418, 2.672979, 0.3333333, 0, 1, 1,
0.5622212, 0.3136574, 1.216021, 0.3372549, 0, 1, 1,
0.563715, 0.05504437, 1.642109, 0.345098, 0, 1, 1,
0.5654813, -0.3435332, 1.572054, 0.3490196, 0, 1, 1,
0.5656169, -0.1941141, 1.981265, 0.3568628, 0, 1, 1,
0.5670725, -0.01649976, 1.400827, 0.3607843, 0, 1, 1,
0.568977, 0.6938685, -0.0418088, 0.3686275, 0, 1, 1,
0.5691062, -1.348855, 4.230399, 0.372549, 0, 1, 1,
0.5716161, -1.011971, 3.930139, 0.3803922, 0, 1, 1,
0.5738612, 1.71299, 0.5706766, 0.3843137, 0, 1, 1,
0.5744119, 0.266672, 0.2542048, 0.3921569, 0, 1, 1,
0.5770072, -0.2496373, 1.270249, 0.3960784, 0, 1, 1,
0.5770547, -0.6076918, 0.8648391, 0.4039216, 0, 1, 1,
0.5830409, -0.8575184, 2.478149, 0.4117647, 0, 1, 1,
0.584859, -1.372545, 2.31533, 0.4156863, 0, 1, 1,
0.585566, 0.1390589, 1.924374, 0.4235294, 0, 1, 1,
0.5903745, -0.4165158, 2.509671, 0.427451, 0, 1, 1,
0.5934283, 1.232327, 1.782839, 0.4352941, 0, 1, 1,
0.5986356, 1.087241, 0.4642824, 0.4392157, 0, 1, 1,
0.6042168, 2.405921, -0.8628915, 0.4470588, 0, 1, 1,
0.6047433, 0.3878998, 0.1830559, 0.4509804, 0, 1, 1,
0.6057522, 0.4734, 1.926396, 0.4588235, 0, 1, 1,
0.6059478, -0.4789873, 3.251882, 0.4627451, 0, 1, 1,
0.6129558, -0.2401316, 2.526691, 0.4705882, 0, 1, 1,
0.6136181, -2.255693, 3.872805, 0.4745098, 0, 1, 1,
0.6140831, -0.4368322, 2.039577, 0.4823529, 0, 1, 1,
0.6193335, -0.3043494, 2.536057, 0.4862745, 0, 1, 1,
0.6250593, -0.5608336, 2.465507, 0.4941176, 0, 1, 1,
0.6326826, 0.5538491, 0.2182663, 0.5019608, 0, 1, 1,
0.637558, 0.7955015, 0.03662731, 0.5058824, 0, 1, 1,
0.6400915, -0.829372, 3.541874, 0.5137255, 0, 1, 1,
0.6404282, 0.9501616, -0.06521396, 0.5176471, 0, 1, 1,
0.6428382, -1.145077, 2.515329, 0.5254902, 0, 1, 1,
0.6436004, 0.6231883, 0.01506976, 0.5294118, 0, 1, 1,
0.6481147, 0.3365964, 1.363738, 0.5372549, 0, 1, 1,
0.6498249, -0.1646359, 0.6630057, 0.5411765, 0, 1, 1,
0.6529587, 0.8136016, 0.7877043, 0.5490196, 0, 1, 1,
0.6569378, 0.5218017, 0.6939784, 0.5529412, 0, 1, 1,
0.6575385, 0.795955, -0.1353019, 0.5607843, 0, 1, 1,
0.6589723, 0.8065387, -0.2329079, 0.5647059, 0, 1, 1,
0.6600886, 1.146491, 0.8444886, 0.572549, 0, 1, 1,
0.6607852, -0.6713006, 2.009569, 0.5764706, 0, 1, 1,
0.6638869, 0.3159218, 0.09831797, 0.5843138, 0, 1, 1,
0.6680642, -0.2956532, 2.077758, 0.5882353, 0, 1, 1,
0.6693135, 0.5331774, 0.4831949, 0.5960785, 0, 1, 1,
0.6708636, 0.8950085, -0.6626301, 0.6039216, 0, 1, 1,
0.6820488, 0.7743607, 1.578413, 0.6078432, 0, 1, 1,
0.6834414, 1.356687, 0.1133325, 0.6156863, 0, 1, 1,
0.6851416, -1.913328, 2.040983, 0.6196079, 0, 1, 1,
0.689888, 1.146086, 0.7144653, 0.627451, 0, 1, 1,
0.7041417, -1.419397, 1.957311, 0.6313726, 0, 1, 1,
0.7074149, 0.5215554, 2.039265, 0.6392157, 0, 1, 1,
0.7078962, 1.598068, 0.4627349, 0.6431373, 0, 1, 1,
0.7080088, -1.649793, 2.49409, 0.6509804, 0, 1, 1,
0.708926, 1.31636, -0.7461622, 0.654902, 0, 1, 1,
0.7098542, 0.6251487, 0.2978601, 0.6627451, 0, 1, 1,
0.7100622, -0.5662184, 2.552982, 0.6666667, 0, 1, 1,
0.712577, -0.2970994, 1.659561, 0.6745098, 0, 1, 1,
0.7143929, 0.750955, 1.789578, 0.6784314, 0, 1, 1,
0.7173483, 0.8367856, -1.282245, 0.6862745, 0, 1, 1,
0.7238739, 1.34729, 2.45642, 0.6901961, 0, 1, 1,
0.7270004, 0.2191873, 2.928457, 0.6980392, 0, 1, 1,
0.7297648, -0.2467955, 2.300047, 0.7058824, 0, 1, 1,
0.7301289, -1.319728, 4.049157, 0.7098039, 0, 1, 1,
0.730723, -0.4377772, 0.8850552, 0.7176471, 0, 1, 1,
0.7318051, 0.8785831, 0.6681993, 0.7215686, 0, 1, 1,
0.7346944, 1.691041, -0.1617197, 0.7294118, 0, 1, 1,
0.7348166, 0.2333281, 1.586836, 0.7333333, 0, 1, 1,
0.7409143, -1.6539, 3.392918, 0.7411765, 0, 1, 1,
0.7470782, 1.096699, 1.240086, 0.7450981, 0, 1, 1,
0.7485263, -0.116569, 1.904919, 0.7529412, 0, 1, 1,
0.7497796, 0.2502536, -0.7924564, 0.7568628, 0, 1, 1,
0.7614852, -0.2520795, 2.85139, 0.7647059, 0, 1, 1,
0.7628423, -2.047469, 2.836821, 0.7686275, 0, 1, 1,
0.7671928, -1.245959, 2.965777, 0.7764706, 0, 1, 1,
0.7708314, -0.8857321, 3.759171, 0.7803922, 0, 1, 1,
0.7719169, 0.03122029, 1.778871, 0.7882353, 0, 1, 1,
0.7725568, -1.844065, 1.885622, 0.7921569, 0, 1, 1,
0.7847895, 0.875221, 0.4101484, 0.8, 0, 1, 1,
0.7919012, -1.281746, 5.006135, 0.8078431, 0, 1, 1,
0.792608, 1.904575, 0.3447651, 0.8117647, 0, 1, 1,
0.7960793, -1.229181, 3.268749, 0.8196079, 0, 1, 1,
0.798866, 0.5105216, 1.443041, 0.8235294, 0, 1, 1,
0.7996262, 0.8300035, 0.220671, 0.8313726, 0, 1, 1,
0.8034725, -0.7012287, 0.6681535, 0.8352941, 0, 1, 1,
0.8043451, -0.4208284, 1.767946, 0.8431373, 0, 1, 1,
0.804378, 0.7425033, 0.5827494, 0.8470588, 0, 1, 1,
0.8047413, -0.5448151, 1.522844, 0.854902, 0, 1, 1,
0.8054791, -0.6409929, 2.755925, 0.8588235, 0, 1, 1,
0.8068045, -0.4509274, 2.486741, 0.8666667, 0, 1, 1,
0.809917, 1.669828, 1.069502, 0.8705882, 0, 1, 1,
0.8147447, -0.09241265, 0.3528213, 0.8784314, 0, 1, 1,
0.817808, -0.1335242, 0.2902385, 0.8823529, 0, 1, 1,
0.8197992, 0.6526122, 0.8040514, 0.8901961, 0, 1, 1,
0.8210201, 0.5747795, -1.131658, 0.8941177, 0, 1, 1,
0.8243721, -0.9767439, 3.409028, 0.9019608, 0, 1, 1,
0.8250003, -0.9813088, 0.9753431, 0.9098039, 0, 1, 1,
0.8254491, 2.00021, 1.356061, 0.9137255, 0, 1, 1,
0.834221, -0.1537068, 1.65528, 0.9215686, 0, 1, 1,
0.8393981, 1.064851, 1.654351, 0.9254902, 0, 1, 1,
0.8400906, -1.198137, 2.413032, 0.9333333, 0, 1, 1,
0.8417299, 0.7681851, 1.997352, 0.9372549, 0, 1, 1,
0.8479178, 0.319325, 1.047141, 0.945098, 0, 1, 1,
0.8567406, 0.9419535, 0.8244948, 0.9490196, 0, 1, 1,
0.8661451, 0.7487231, 2.411507, 0.9568627, 0, 1, 1,
0.8704838, 0.9447531, 0.07665838, 0.9607843, 0, 1, 1,
0.8748155, 0.3531058, 1.969496, 0.9686275, 0, 1, 1,
0.8778481, -0.4063489, 2.98772, 0.972549, 0, 1, 1,
0.8865691, 1.667498, 1.476729, 0.9803922, 0, 1, 1,
0.8878499, 0.569305, 3.108055, 0.9843137, 0, 1, 1,
0.8896501, 1.610658, 1.500688, 0.9921569, 0, 1, 1,
0.8909887, 0.262733, 2.08624, 0.9960784, 0, 1, 1,
0.8934312, -0.8720302, 0.6818863, 1, 0, 0.9960784, 1,
0.8976882, -1.159531, 3.34504, 1, 0, 0.9882353, 1,
0.8977603, -1.022749, 5.825371, 1, 0, 0.9843137, 1,
0.8980917, 1.132655, -0.836193, 1, 0, 0.9764706, 1,
0.9007282, 0.6560379, -0.2497753, 1, 0, 0.972549, 1,
0.9036268, 0.6926017, 2.824183, 1, 0, 0.9647059, 1,
0.9126388, 0.7508541, 1.020228, 1, 0, 0.9607843, 1,
0.9127625, 0.3726505, 0.3923288, 1, 0, 0.9529412, 1,
0.9179409, 1.546335, 1.22324, 1, 0, 0.9490196, 1,
0.9203385, -0.1546423, 0.9416974, 1, 0, 0.9411765, 1,
0.934074, -0.6073436, 3.516251, 1, 0, 0.9372549, 1,
0.9382879, -1.010615, 1.957523, 1, 0, 0.9294118, 1,
0.9384671, -0.1004382, 2.946856, 1, 0, 0.9254902, 1,
0.9412125, -0.9053595, 0.8218647, 1, 0, 0.9176471, 1,
0.945366, 2.326665, -0.1913608, 1, 0, 0.9137255, 1,
0.9469774, 0.4491932, 2.807211, 1, 0, 0.9058824, 1,
0.9481363, 0.7038686, 2.100635, 1, 0, 0.9019608, 1,
0.9484439, 0.1840685, 3.81316, 1, 0, 0.8941177, 1,
0.9485898, -0.6617094, 2.416961, 1, 0, 0.8862745, 1,
0.9530042, 0.977137, 0.1210475, 1, 0, 0.8823529, 1,
0.9580361, -0.8910847, 2.442009, 1, 0, 0.8745098, 1,
0.9587961, 0.2318818, 0.8105989, 1, 0, 0.8705882, 1,
0.9632151, 0.06286172, 1.921142, 1, 0, 0.8627451, 1,
0.968023, -0.4951388, 3.697675, 1, 0, 0.8588235, 1,
0.9681059, -1.259796, 1.667279, 1, 0, 0.8509804, 1,
0.9701486, 0.4634705, 0.3185727, 1, 0, 0.8470588, 1,
0.9725834, 1.866288, 1.264604, 1, 0, 0.8392157, 1,
0.9745919, 1.589273, 2.502095, 1, 0, 0.8352941, 1,
0.9777586, 0.855864, 1.215781, 1, 0, 0.827451, 1,
0.9812216, -0.5563985, 1.734257, 1, 0, 0.8235294, 1,
0.9880474, 1.260853, 0.3058975, 1, 0, 0.8156863, 1,
0.9889466, -0.2176327, 1.287572, 1, 0, 0.8117647, 1,
0.9898649, -0.3073021, 2.612637, 1, 0, 0.8039216, 1,
0.9992052, 0.2854925, 1.908243, 1, 0, 0.7960784, 1,
1.015552, 2.844285, 0.07931317, 1, 0, 0.7921569, 1,
1.016555, 0.9811434, -0.005687264, 1, 0, 0.7843137, 1,
1.017659, -0.6431638, 3.690701, 1, 0, 0.7803922, 1,
1.018943, -0.2142484, 1.15595, 1, 0, 0.772549, 1,
1.024604, -1.493069, 0.7632545, 1, 0, 0.7686275, 1,
1.027077, -2.325859, 3.833456, 1, 0, 0.7607843, 1,
1.027994, -1.129141, 3.465766, 1, 0, 0.7568628, 1,
1.031299, 0.3162172, 0.5748124, 1, 0, 0.7490196, 1,
1.053861, -0.1450921, 2.104195, 1, 0, 0.7450981, 1,
1.055799, -1.736538, 3.132002, 1, 0, 0.7372549, 1,
1.060621, 0.06405759, 2.049769, 1, 0, 0.7333333, 1,
1.060906, 2.102999, 0.07133442, 1, 0, 0.7254902, 1,
1.061799, 0.1391095, 2.628416, 1, 0, 0.7215686, 1,
1.089193, -1.035739, 1.254318, 1, 0, 0.7137255, 1,
1.089697, 1.126787, -0.1508919, 1, 0, 0.7098039, 1,
1.095408, 0.04288128, 1.133538, 1, 0, 0.7019608, 1,
1.095811, 1.476226, 0.558408, 1, 0, 0.6941177, 1,
1.096906, 0.3548819, 1.727901, 1, 0, 0.6901961, 1,
1.099391, -1.111613, 4.427624, 1, 0, 0.682353, 1,
1.110934, -0.1136201, -0.04548692, 1, 0, 0.6784314, 1,
1.119173, 0.5916502, 1.822326, 1, 0, 0.6705883, 1,
1.131932, 0.6000468, 0.1168052, 1, 0, 0.6666667, 1,
1.133992, -0.1967577, 1.435724, 1, 0, 0.6588235, 1,
1.138327, 0.2602457, 0.8445969, 1, 0, 0.654902, 1,
1.164478, -1.065625, 3.113575, 1, 0, 0.6470588, 1,
1.168872, -0.7413864, 3.431025, 1, 0, 0.6431373, 1,
1.180329, 2.190788, 2.139929, 1, 0, 0.6352941, 1,
1.196856, 1.166227, 2.146243, 1, 0, 0.6313726, 1,
1.198216, 0.00813183, 3.266054, 1, 0, 0.6235294, 1,
1.204223, 0.5010489, 1.24828, 1, 0, 0.6196079, 1,
1.217274, 0.1138399, 1.891932, 1, 0, 0.6117647, 1,
1.221082, -0.6667526, 0.3621691, 1, 0, 0.6078432, 1,
1.227522, -0.2494601, 1.934686, 1, 0, 0.6, 1,
1.231049, 0.3428712, 1.241561, 1, 0, 0.5921569, 1,
1.235086, 1.300784, 0.5829926, 1, 0, 0.5882353, 1,
1.242619, -0.876793, 1.94095, 1, 0, 0.5803922, 1,
1.25646, 0.7173844, 0.9082899, 1, 0, 0.5764706, 1,
1.264231, 1.771023, 0.331947, 1, 0, 0.5686275, 1,
1.264494, 1.441427, 2.172381, 1, 0, 0.5647059, 1,
1.271087, 0.5042267, 1.790079, 1, 0, 0.5568628, 1,
1.272194, -0.4641305, 0.3028581, 1, 0, 0.5529412, 1,
1.274008, -0.4744414, 0.9218959, 1, 0, 0.5450981, 1,
1.277871, -1.127695, 2.803568, 1, 0, 0.5411765, 1,
1.292896, -1.625296, 3.3449, 1, 0, 0.5333334, 1,
1.294501, 0.6369866, 1.960126, 1, 0, 0.5294118, 1,
1.295207, -1.229106, 3.70331, 1, 0, 0.5215687, 1,
1.307143, 0.4069857, 1.005981, 1, 0, 0.5176471, 1,
1.312545, 1.634186, 0.7627134, 1, 0, 0.509804, 1,
1.316412, 0.6709844, -0.4346419, 1, 0, 0.5058824, 1,
1.330371, -0.5929469, 1.424783, 1, 0, 0.4980392, 1,
1.331974, 0.988484, 0.6892946, 1, 0, 0.4901961, 1,
1.332465, 1.6374, -0.1816925, 1, 0, 0.4862745, 1,
1.335352, 1.48287, -0.3117646, 1, 0, 0.4784314, 1,
1.339369, 0.2517473, 1.767517, 1, 0, 0.4745098, 1,
1.350546, -3.16518, 3.097905, 1, 0, 0.4666667, 1,
1.351716, 1.078039, 0.3073403, 1, 0, 0.4627451, 1,
1.355661, 0.3355287, 2.721835, 1, 0, 0.454902, 1,
1.367688, 1.018483, 1.078735, 1, 0, 0.4509804, 1,
1.367785, -0.2631823, 2.813791, 1, 0, 0.4431373, 1,
1.371913, -0.5799122, 2.567063, 1, 0, 0.4392157, 1,
1.380155, -0.8289611, 2.202124, 1, 0, 0.4313726, 1,
1.381507, -1.754507, 2.481025, 1, 0, 0.427451, 1,
1.385376, -1.88399, 2.385225, 1, 0, 0.4196078, 1,
1.389414, 0.2356724, 0.8517735, 1, 0, 0.4156863, 1,
1.392572, 0.7992086, 1.433786, 1, 0, 0.4078431, 1,
1.393906, -0.9045351, 2.170302, 1, 0, 0.4039216, 1,
1.416067, -0.5378342, 2.217857, 1, 0, 0.3960784, 1,
1.41613, 0.1001281, 2.413715, 1, 0, 0.3882353, 1,
1.418777, 0.03422048, 1.353225, 1, 0, 0.3843137, 1,
1.439347, -1.449223, 3.338154, 1, 0, 0.3764706, 1,
1.447076, -1.765221, 2.111095, 1, 0, 0.372549, 1,
1.449021, 0.2805237, 1.687438, 1, 0, 0.3647059, 1,
1.452312, -0.2423394, 0.8971729, 1, 0, 0.3607843, 1,
1.455153, 1.415951, 0.4168348, 1, 0, 0.3529412, 1,
1.468186, -0.6475519, 3.216228, 1, 0, 0.3490196, 1,
1.483606, 0.4457067, 1.399409, 1, 0, 0.3411765, 1,
1.490436, 0.6159452, 2.669527, 1, 0, 0.3372549, 1,
1.503349, 1.623987, 1.108259, 1, 0, 0.3294118, 1,
1.506814, 0.1230903, 3.019245, 1, 0, 0.3254902, 1,
1.524781, -0.2352977, 0.796176, 1, 0, 0.3176471, 1,
1.54982, 0.01744033, 2.069461, 1, 0, 0.3137255, 1,
1.583255, -1.911102, 1.217813, 1, 0, 0.3058824, 1,
1.591498, 0.5413811, 0.6920515, 1, 0, 0.2980392, 1,
1.631288, -0.2239145, 0.9250173, 1, 0, 0.2941177, 1,
1.645279, -1.135801, 2.210169, 1, 0, 0.2862745, 1,
1.660206, 1.564584, 1.001258, 1, 0, 0.282353, 1,
1.702884, 0.2282872, 0.5246197, 1, 0, 0.2745098, 1,
1.734071, -0.2277841, 1.503189, 1, 0, 0.2705882, 1,
1.769524, -0.5519312, 0.03336639, 1, 0, 0.2627451, 1,
1.771757, 0.7953086, -0.3696757, 1, 0, 0.2588235, 1,
1.781307, 2.241071, 0.4783265, 1, 0, 0.2509804, 1,
1.788141, 0.1487211, 2.7544, 1, 0, 0.2470588, 1,
1.792644, 2.164358, -0.8291981, 1, 0, 0.2392157, 1,
1.806675, 1.363022, 1.829556, 1, 0, 0.2352941, 1,
1.814065, -0.3904781, -0.2473777, 1, 0, 0.227451, 1,
1.817562, 0.4285372, 1.188389, 1, 0, 0.2235294, 1,
1.836249, 0.4578942, 1.783897, 1, 0, 0.2156863, 1,
1.871354, 0.6523558, 1.658064, 1, 0, 0.2117647, 1,
1.898554, -0.5822822, 2.979754, 1, 0, 0.2039216, 1,
1.903646, -1.642903, 1.884947, 1, 0, 0.1960784, 1,
1.922038, -0.9401488, 2.613104, 1, 0, 0.1921569, 1,
1.946733, 1.755759, 0.1536262, 1, 0, 0.1843137, 1,
1.955974, -0.3243315, 0.5819227, 1, 0, 0.1803922, 1,
1.956271, 0.852812, 3.06418, 1, 0, 0.172549, 1,
1.968938, 0.427004, 1.648747, 1, 0, 0.1686275, 1,
2.018728, -0.09373961, 3.257616, 1, 0, 0.1607843, 1,
2.043691, 0.7053242, 2.54812, 1, 0, 0.1568628, 1,
2.070584, -0.8475766, 3.272455, 1, 0, 0.1490196, 1,
2.08124, 0.4414556, 1.55134, 1, 0, 0.145098, 1,
2.125546, -0.5658606, 2.030092, 1, 0, 0.1372549, 1,
2.146603, -0.475149, 2.592581, 1, 0, 0.1333333, 1,
2.191499, -0.3207138, 2.63184, 1, 0, 0.1254902, 1,
2.193073, 0.1906522, 0.1527879, 1, 0, 0.1215686, 1,
2.223325, 0.7653801, 0.9179455, 1, 0, 0.1137255, 1,
2.227628, -0.3048163, 1.820499, 1, 0, 0.1098039, 1,
2.294045, -0.9352095, 1.913125, 1, 0, 0.1019608, 1,
2.297894, -0.7162819, 0.6771833, 1, 0, 0.09411765, 1,
2.301013, 0.9832998, -0.5584759, 1, 0, 0.09019608, 1,
2.365422, 0.1566199, 2.146965, 1, 0, 0.08235294, 1,
2.372914, 0.4704235, 1.158814, 1, 0, 0.07843138, 1,
2.388596, 0.160512, 1.332114, 1, 0, 0.07058824, 1,
2.396407, -0.7002416, 2.014257, 1, 0, 0.06666667, 1,
2.44933, -0.3094473, 2.292665, 1, 0, 0.05882353, 1,
2.465396, -1.33394, 1.557255, 1, 0, 0.05490196, 1,
2.473808, 0.007957539, -0.6787057, 1, 0, 0.04705882, 1,
2.528426, -0.4953634, 1.960575, 1, 0, 0.04313726, 1,
2.534793, -0.0163607, 1.450164, 1, 0, 0.03529412, 1,
2.551893, 0.3143605, 2.359034, 1, 0, 0.03137255, 1,
2.68498, 0.5456507, 1.395828, 1, 0, 0.02352941, 1,
2.719542, -0.6400762, 3.276307, 1, 0, 0.01960784, 1,
2.75743, 1.506993, 0.8713409, 1, 0, 0.01176471, 1,
2.910959, -2.429657, 3.512493, 1, 0, 0.007843138, 1
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
-0.1400776, -4.183784, -7.406019, 0, -0.5, 0.5, 0.5,
-0.1400776, -4.183784, -7.406019, 1, -0.5, 0.5, 0.5,
-0.1400776, -4.183784, -7.406019, 1, 1.5, 0.5, 0.5,
-0.1400776, -4.183784, -7.406019, 0, 1.5, 0.5, 0.5
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
-4.225415, -0.1604472, -7.406019, 0, -0.5, 0.5, 0.5,
-4.225415, -0.1604472, -7.406019, 1, -0.5, 0.5, 0.5,
-4.225415, -0.1604472, -7.406019, 1, 1.5, 0.5, 0.5,
-4.225415, -0.1604472, -7.406019, 0, 1.5, 0.5, 0.5
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
-4.225415, -4.183784, 0.5639307, 0, -0.5, 0.5, 0.5,
-4.225415, -4.183784, 0.5639307, 1, -0.5, 0.5, 0.5,
-4.225415, -4.183784, 0.5639307, 1, 1.5, 0.5, 0.5,
-4.225415, -4.183784, 0.5639307, 0, 1.5, 0.5, 0.5
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
-3, -3.255322, -5.5668,
2, -3.255322, -5.5668,
-3, -3.255322, -5.5668,
-3, -3.410065, -5.873337,
-2, -3.255322, -5.5668,
-2, -3.410065, -5.873337,
-1, -3.255322, -5.5668,
-1, -3.410065, -5.873337,
0, -3.255322, -5.5668,
0, -3.410065, -5.873337,
1, -3.255322, -5.5668,
1, -3.410065, -5.873337,
2, -3.255322, -5.5668,
2, -3.410065, -5.873337
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
-3, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
-3, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
-3, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
-3, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5,
-2, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
-2, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
-2, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
-2, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5,
-1, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
-1, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
-1, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
-1, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5,
0, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
0, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
0, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
0, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5,
1, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
1, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
1, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
1, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5,
2, -3.719553, -6.48641, 0, -0.5, 0.5, 0.5,
2, -3.719553, -6.48641, 1, -0.5, 0.5, 0.5,
2, -3.719553, -6.48641, 1, 1.5, 0.5, 0.5,
2, -3.719553, -6.48641, 0, 1.5, 0.5, 0.5
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
-3.282645, -3, -5.5668,
-3.282645, 2, -5.5668,
-3.282645, -3, -5.5668,
-3.439773, -3, -5.873337,
-3.282645, -2, -5.5668,
-3.439773, -2, -5.873337,
-3.282645, -1, -5.5668,
-3.439773, -1, -5.873337,
-3.282645, 0, -5.5668,
-3.439773, 0, -5.873337,
-3.282645, 1, -5.5668,
-3.439773, 1, -5.873337,
-3.282645, 2, -5.5668,
-3.439773, 2, -5.873337
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
-3.75403, -3, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, -3, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, -3, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, -3, -6.48641, 0, 1.5, 0.5, 0.5,
-3.75403, -2, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, -2, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, -2, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, -2, -6.48641, 0, 1.5, 0.5, 0.5,
-3.75403, -1, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, -1, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, -1, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, -1, -6.48641, 0, 1.5, 0.5, 0.5,
-3.75403, 0, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, 0, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, 0, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, 0, -6.48641, 0, 1.5, 0.5, 0.5,
-3.75403, 1, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, 1, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, 1, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, 1, -6.48641, 0, 1.5, 0.5, 0.5,
-3.75403, 2, -6.48641, 0, -0.5, 0.5, 0.5,
-3.75403, 2, -6.48641, 1, -0.5, 0.5, 0.5,
-3.75403, 2, -6.48641, 1, 1.5, 0.5, 0.5,
-3.75403, 2, -6.48641, 0, 1.5, 0.5, 0.5
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
-3.282645, -3.255322, -4,
-3.282645, -3.255322, 6,
-3.282645, -3.255322, -4,
-3.439773, -3.410065, -4,
-3.282645, -3.255322, -2,
-3.439773, -3.410065, -2,
-3.282645, -3.255322, 0,
-3.439773, -3.410065, 0,
-3.282645, -3.255322, 2,
-3.439773, -3.410065, 2,
-3.282645, -3.255322, 4,
-3.439773, -3.410065, 4,
-3.282645, -3.255322, 6,
-3.439773, -3.410065, 6
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
-3.75403, -3.719553, -4, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, -4, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, -4, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, -4, 0, 1.5, 0.5, 0.5,
-3.75403, -3.719553, -2, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, -2, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, -2, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, -2, 0, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 0, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 0, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 0, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 0, 0, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 2, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 2, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 2, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 2, 0, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 4, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 4, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 4, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 4, 0, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 6, 0, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 6, 1, -0.5, 0.5, 0.5,
-3.75403, -3.719553, 6, 1, 1.5, 0.5, 0.5,
-3.75403, -3.719553, 6, 0, 1.5, 0.5, 0.5
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
-3.282645, -3.255322, -5.5668,
-3.282645, 2.934427, -5.5668,
-3.282645, -3.255322, 6.694662,
-3.282645, 2.934427, 6.694662,
-3.282645, -3.255322, -5.5668,
-3.282645, -3.255322, 6.694662,
-3.282645, 2.934427, -5.5668,
-3.282645, 2.934427, 6.694662,
-3.282645, -3.255322, -5.5668,
3.00249, -3.255322, -5.5668,
-3.282645, -3.255322, 6.694662,
3.00249, -3.255322, 6.694662,
-3.282645, 2.934427, -5.5668,
3.00249, 2.934427, -5.5668,
-3.282645, 2.934427, 6.694662,
3.00249, 2.934427, 6.694662,
3.00249, -3.255322, -5.5668,
3.00249, 2.934427, -5.5668,
3.00249, -3.255322, 6.694662,
3.00249, 2.934427, 6.694662,
3.00249, -3.255322, -5.5668,
3.00249, -3.255322, 6.694662,
3.00249, 2.934427, -5.5668,
3.00249, 2.934427, 6.694662
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
var radius = 8.065747;
var distance = 35.88542;
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
mvMatrix.translate( 0.1400776, 0.1604472, -0.5639307 );
mvMatrix.scale( 1.387535, 1.408917, 0.7112402 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.88542);
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
Azinphosmethyl<-read.table("Azinphosmethyl.xyz")
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
-3.191114, 0.2607395, -1.343275, 0, 0, 1, 1, 1,
-2.779879, -0.7307692, -1.582631, 1, 0, 0, 1, 1,
-2.766186, -1.089492, -2.839296, 1, 0, 0, 1, 1,
-2.765217, -0.7110623, -3.016877, 1, 0, 0, 1, 1,
-2.727489, -1.357073, -2.824815, 1, 0, 0, 1, 1,
-2.646645, -0.2241611, -2.851881, 1, 0, 0, 1, 1,
-2.517999, -0.777556, -0.8801027, 0, 0, 0, 1, 1,
-2.471052, -0.4217792, -0.1603932, 0, 0, 0, 1, 1,
-2.469986, 0.8295716, 0.5267866, 0, 0, 0, 1, 1,
-2.450682, 1.817431, -0.6132644, 0, 0, 0, 1, 1,
-2.430086, -0.05454443, -0.295967, 0, 0, 0, 1, 1,
-2.351386, 0.1726247, -1.533395, 0, 0, 0, 1, 1,
-2.33598, -0.2281554, -1.945364, 0, 0, 0, 1, 1,
-2.32785, -1.818795, -3.053336, 1, 1, 1, 1, 1,
-2.311675, -1.113058, -0.6792936, 1, 1, 1, 1, 1,
-2.178597, 0.910341, -0.3198354, 1, 1, 1, 1, 1,
-2.150755, 0.9342912, -2.013554, 1, 1, 1, 1, 1,
-2.150564, -1.211102, -2.635214, 1, 1, 1, 1, 1,
-2.112525, -0.3551059, -1.715055, 1, 1, 1, 1, 1,
-2.089632, -0.7829018, -2.25996, 1, 1, 1, 1, 1,
-2.081631, 0.3618613, -1.413663, 1, 1, 1, 1, 1,
-2.059867, -0.6535873, -1.461463, 1, 1, 1, 1, 1,
-2.056605, -0.6943322, -1.31387, 1, 1, 1, 1, 1,
-2.040604, 0.6724082, -1.095164, 1, 1, 1, 1, 1,
-2.037016, -0.4062906, -4.07703, 1, 1, 1, 1, 1,
-2.026133, 1.821311, -0.7790243, 1, 1, 1, 1, 1,
-2.013933, 1.169889, -1.402888, 1, 1, 1, 1, 1,
-1.932021, -1.684998, -2.718144, 1, 1, 1, 1, 1,
-1.930675, -1.589622, -1.506622, 0, 0, 1, 1, 1,
-1.92956, -0.6568789, -2.37206, 1, 0, 0, 1, 1,
-1.878678, 0.1016265, 0.01238371, 1, 0, 0, 1, 1,
-1.865881, -0.5135348, -1.815579, 1, 0, 0, 1, 1,
-1.857285, 1.607345, -2.103689, 1, 0, 0, 1, 1,
-1.83954, -0.6576176, 0.1835505, 1, 0, 0, 1, 1,
-1.808594, 0.1017012, 0.5912968, 0, 0, 0, 1, 1,
-1.803473, -0.5031255, -2.685854, 0, 0, 0, 1, 1,
-1.78781, -1.896021, -1.884027, 0, 0, 0, 1, 1,
-1.780946, -0.8438914, -3.952857, 0, 0, 0, 1, 1,
-1.778466, -0.329873, 0.8459681, 0, 0, 0, 1, 1,
-1.776708, 1.082505, -1.191183, 0, 0, 0, 1, 1,
-1.770163, 0.8539756, 0.6865301, 0, 0, 0, 1, 1,
-1.743062, -1.111263, -0.9068744, 1, 1, 1, 1, 1,
-1.731424, 0.2823298, -0.9365164, 1, 1, 1, 1, 1,
-1.725463, 0.93966, -0.1856077, 1, 1, 1, 1, 1,
-1.711499, 0.3900028, -1.497966, 1, 1, 1, 1, 1,
-1.709525, 0.03697409, -1.237377, 1, 1, 1, 1, 1,
-1.709013, -0.9046892, -2.132776, 1, 1, 1, 1, 1,
-1.693721, 0.5500441, -0.5748928, 1, 1, 1, 1, 1,
-1.682839, -1.197883, -3.735262, 1, 1, 1, 1, 1,
-1.677616, 1.184083, -0.1786167, 1, 1, 1, 1, 1,
-1.672712, -1.661183, -3.759044, 1, 1, 1, 1, 1,
-1.66078, -0.06631386, -3.403544, 1, 1, 1, 1, 1,
-1.639379, -1.136027, -1.988622, 1, 1, 1, 1, 1,
-1.636109, -0.3063667, -1.268341, 1, 1, 1, 1, 1,
-1.62471, 0.3825846, -1.127624, 1, 1, 1, 1, 1,
-1.606348, 0.5842257, -1.01533, 1, 1, 1, 1, 1,
-1.604743, -1.481845, -1.17591, 0, 0, 1, 1, 1,
-1.602684, -0.3725954, -1.014669, 1, 0, 0, 1, 1,
-1.589972, 1.712674, -0.6137093, 1, 0, 0, 1, 1,
-1.572364, 1.561186, -1.326114, 1, 0, 0, 1, 1,
-1.559363, 1.192693, -2.824791, 1, 0, 0, 1, 1,
-1.55456, 0.03778433, -1.64875, 1, 0, 0, 1, 1,
-1.549983, 0.5023936, -2.97372, 0, 0, 0, 1, 1,
-1.543009, -1.300593, -2.167046, 0, 0, 0, 1, 1,
-1.527939, -0.01521015, -1.810583, 0, 0, 0, 1, 1,
-1.527491, -0.3789974, -3.572235, 0, 0, 0, 1, 1,
-1.521708, -0.5995294, -0.6600066, 0, 0, 0, 1, 1,
-1.521471, 0.8308716, -2.298014, 0, 0, 0, 1, 1,
-1.516033, 0.6185679, -0.5694719, 0, 0, 0, 1, 1,
-1.514094, 0.4532542, -1.620923, 1, 1, 1, 1, 1,
-1.506357, 0.09537942, -1.420828, 1, 1, 1, 1, 1,
-1.493771, -0.2484824, -1.435939, 1, 1, 1, 1, 1,
-1.486685, 1.257882, 0.614942, 1, 1, 1, 1, 1,
-1.48114, 0.2370303, -0.7491055, 1, 1, 1, 1, 1,
-1.477623, 0.4394983, -0.7920452, 1, 1, 1, 1, 1,
-1.477206, 0.5414535, -1.750483, 1, 1, 1, 1, 1,
-1.46998, 0.08781591, -3.681805, 1, 1, 1, 1, 1,
-1.459507, 0.4011473, -1.214609, 1, 1, 1, 1, 1,
-1.459103, -1.793832, -3.239474, 1, 1, 1, 1, 1,
-1.458753, -1.350945, -2.827498, 1, 1, 1, 1, 1,
-1.458369, -0.1438675, -0.02308249, 1, 1, 1, 1, 1,
-1.457868, 0.5956821, 0.9165915, 1, 1, 1, 1, 1,
-1.451657, 0.02425396, 0.1798362, 1, 1, 1, 1, 1,
-1.441304, -0.377097, -2.561115, 1, 1, 1, 1, 1,
-1.432012, 0.8930941, -1.806471, 0, 0, 1, 1, 1,
-1.426612, 1.889519, -1.333654, 1, 0, 0, 1, 1,
-1.426459, -0.6634617, -2.0749, 1, 0, 0, 1, 1,
-1.425635, 0.5606723, -0.9294081, 1, 0, 0, 1, 1,
-1.400238, -1.017646, -1.711289, 1, 0, 0, 1, 1,
-1.374163, 0.6227087, -0.2239217, 1, 0, 0, 1, 1,
-1.357375, -1.53196, -0.09659568, 0, 0, 0, 1, 1,
-1.351722, -0.9586024, -0.4104803, 0, 0, 0, 1, 1,
-1.348333, 0.1174733, -2.172639, 0, 0, 0, 1, 1,
-1.346982, -0.360334, -1.464832, 0, 0, 0, 1, 1,
-1.346016, -0.824121, -1.889283, 0, 0, 0, 1, 1,
-1.328266, -1.400973, -1.774721, 0, 0, 0, 1, 1,
-1.323592, -2.321706, -2.538659, 0, 0, 0, 1, 1,
-1.309155, 0.8432673, -0.7243023, 1, 1, 1, 1, 1,
-1.306979, 0.6801847, -1.122135, 1, 1, 1, 1, 1,
-1.306546, 1.090581, -0.09951583, 1, 1, 1, 1, 1,
-1.305066, -1.17324, -1.140872, 1, 1, 1, 1, 1,
-1.304707, -0.2972486, -1.238042, 1, 1, 1, 1, 1,
-1.300196, 0.5311885, -0.110627, 1, 1, 1, 1, 1,
-1.284448, -0.1305156, -1.49092, 1, 1, 1, 1, 1,
-1.279131, -1.341864, -1.713671, 1, 1, 1, 1, 1,
-1.276652, 0.36111, -0.2531895, 1, 1, 1, 1, 1,
-1.275727, -0.6758456, -2.847643, 1, 1, 1, 1, 1,
-1.274558, 0.401309, -2.775508, 1, 1, 1, 1, 1,
-1.262303, -2.918221, -2.901768, 1, 1, 1, 1, 1,
-1.261566, 1.023246, -2.159071, 1, 1, 1, 1, 1,
-1.255828, 0.1727789, -3.309465, 1, 1, 1, 1, 1,
-1.25415, 0.6745719, -1.771832, 1, 1, 1, 1, 1,
-1.253719, 1.960585, -0.421488, 0, 0, 1, 1, 1,
-1.248924, 1.525241, -0.380742, 1, 0, 0, 1, 1,
-1.228803, -0.2064826, -3.167189, 1, 0, 0, 1, 1,
-1.220139, -0.5550755, -0.2945356, 1, 0, 0, 1, 1,
-1.210814, 1.906789, -0.4040154, 1, 0, 0, 1, 1,
-1.204391, -0.1173925, -1.906467, 1, 0, 0, 1, 1,
-1.195692, 1.080302, -1.091315, 0, 0, 0, 1, 1,
-1.195199, -0.4785687, -2.499911, 0, 0, 0, 1, 1,
-1.192893, -1.589573, -1.01382, 0, 0, 0, 1, 1,
-1.191916, -0.5292071, -1.501472, 0, 0, 0, 1, 1,
-1.186065, 0.8267841, 1.351179, 0, 0, 0, 1, 1,
-1.17907, -1.684349, -3.955527, 0, 0, 0, 1, 1,
-1.173457, 0.2360831, -2.097069, 0, 0, 0, 1, 1,
-1.151669, -0.8730962, -3.045499, 1, 1, 1, 1, 1,
-1.150214, 0.03867429, -1.803093, 1, 1, 1, 1, 1,
-1.14462, 0.7619138, -1.174119, 1, 1, 1, 1, 1,
-1.135282, -0.7912436, -2.516114, 1, 1, 1, 1, 1,
-1.13496, 1.709237, 0.5697799, 1, 1, 1, 1, 1,
-1.134531, -0.02573538, -2.06873, 1, 1, 1, 1, 1,
-1.131539, 0.5648519, -2.178334, 1, 1, 1, 1, 1,
-1.128799, 0.1270273, -3.428802, 1, 1, 1, 1, 1,
-1.128437, 0.9361745, -1.284334, 1, 1, 1, 1, 1,
-1.124621, -0.1386391, -0.6656068, 1, 1, 1, 1, 1,
-1.120457, -1.045963, -2.664945, 1, 1, 1, 1, 1,
-1.094757, -1.030243, -2.508955, 1, 1, 1, 1, 1,
-1.088587, -0.1208791, -1.101688, 1, 1, 1, 1, 1,
-1.086638, -0.3847852, -2.689666, 1, 1, 1, 1, 1,
-1.080625, 0.9978173, -1.348529, 1, 1, 1, 1, 1,
-1.077637, -0.7860801, -1.492865, 0, 0, 1, 1, 1,
-1.075029, -1.210598, -3.254405, 1, 0, 0, 1, 1,
-1.074797, 1.020244, -1.109111, 1, 0, 0, 1, 1,
-1.066134, 0.2450529, 0.3955135, 1, 0, 0, 1, 1,
-1.06519, 1.386696, -0.7523231, 1, 0, 0, 1, 1,
-1.060355, 0.3679459, -1.51281, 1, 0, 0, 1, 1,
-1.055498, 1.563318, -1.829446, 0, 0, 0, 1, 1,
-1.04669, 1.273369, 0.648728, 0, 0, 0, 1, 1,
-1.045262, 0.07848366, -2.137065, 0, 0, 0, 1, 1,
-1.041161, 0.5572346, -0.07009186, 0, 0, 0, 1, 1,
-1.03565, 1.494238, 0.6278883, 0, 0, 0, 1, 1,
-1.035525, 1.358618, -1.692539, 0, 0, 0, 1, 1,
-1.035267, -0.5243444, -1.039312, 0, 0, 0, 1, 1,
-1.032191, -0.3327672, -0.4479764, 1, 1, 1, 1, 1,
-1.020236, -0.5261544, -2.695954, 1, 1, 1, 1, 1,
-1.013138, 0.6539351, -1.297944, 1, 1, 1, 1, 1,
-1.012394, -0.592378, -2.406984, 1, 1, 1, 1, 1,
-1.010303, 1.419256, -1.281644, 1, 1, 1, 1, 1,
-1.008887, -0.9923078, -1.606694, 1, 1, 1, 1, 1,
-1.006064, -2.801636, -3.738572, 1, 1, 1, 1, 1,
-1.001787, -1.418308, -2.273094, 1, 1, 1, 1, 1,
-0.9954965, 0.1021957, -2.694615, 1, 1, 1, 1, 1,
-0.9889691, 1.739211, 1.05599, 1, 1, 1, 1, 1,
-0.9880674, -0.867564, -1.804197, 1, 1, 1, 1, 1,
-0.9848659, -1.197188, -0.7690159, 1, 1, 1, 1, 1,
-0.9812371, 1.200439, -0.01898279, 1, 1, 1, 1, 1,
-0.9791164, 2.394635, -0.3470438, 1, 1, 1, 1, 1,
-0.9755217, -0.0745104, -0.3265025, 1, 1, 1, 1, 1,
-0.9638104, 1.967338, -0.9121414, 0, 0, 1, 1, 1,
-0.9627405, 1.828506, -1.515351, 1, 0, 0, 1, 1,
-0.9552577, 0.5326691, -1.667575, 1, 0, 0, 1, 1,
-0.9532003, -0.2195299, -1.37556, 1, 0, 0, 1, 1,
-0.9384336, 0.4289321, 0.08257415, 1, 0, 0, 1, 1,
-0.9363571, 0.3176818, -0.2649536, 1, 0, 0, 1, 1,
-0.9338775, -0.5360337, -2.189946, 0, 0, 0, 1, 1,
-0.9218585, -1.520193, -2.083181, 0, 0, 0, 1, 1,
-0.9146916, -1.062446, -4.62532, 0, 0, 0, 1, 1,
-0.9126812, 0.1613301, -1.230739, 0, 0, 0, 1, 1,
-0.9088495, -0.1201692, -1.604159, 0, 0, 0, 1, 1,
-0.9018003, 0.8013215, 0.0672395, 0, 0, 0, 1, 1,
-0.8959212, -1.404197, -2.624629, 0, 0, 0, 1, 1,
-0.8886819, -0.2802842, -1.780923, 1, 1, 1, 1, 1,
-0.8854495, 0.8724955, -0.5002273, 1, 1, 1, 1, 1,
-0.8837878, 0.264375, -1.429698, 1, 1, 1, 1, 1,
-0.8818555, -0.7520113, -2.416881, 1, 1, 1, 1, 1,
-0.8781666, 0.0822003, -1.817414, 1, 1, 1, 1, 1,
-0.8781139, 0.17036, -0.6570308, 1, 1, 1, 1, 1,
-0.8775072, 0.1095899, -0.652168, 1, 1, 1, 1, 1,
-0.8755586, 0.3984846, 0.05359118, 1, 1, 1, 1, 1,
-0.8745686, 1.34626, -1.151183, 1, 1, 1, 1, 1,
-0.8732641, -1.391696, -1.754176, 1, 1, 1, 1, 1,
-0.8674573, -1.601514, -3.163389, 1, 1, 1, 1, 1,
-0.8562475, 0.4049235, -2.337747, 1, 1, 1, 1, 1,
-0.8487692, -1.357921, -3.861592, 1, 1, 1, 1, 1,
-0.8483279, -1.114372, -3.254987, 1, 1, 1, 1, 1,
-0.846401, -0.9743679, -2.919874, 1, 1, 1, 1, 1,
-0.8428085, -0.5469769, -2.887497, 0, 0, 1, 1, 1,
-0.842451, 0.6513555, -2.16968, 1, 0, 0, 1, 1,
-0.8417091, 1.169934, -0.7184024, 1, 0, 0, 1, 1,
-0.8408833, 0.7659482, -0.8430715, 1, 0, 0, 1, 1,
-0.8379636, 0.6175866, -0.202543, 1, 0, 0, 1, 1,
-0.8377247, 1.117331, -0.2198066, 1, 0, 0, 1, 1,
-0.8363634, 0.004399889, -2.662395, 0, 0, 0, 1, 1,
-0.8343111, 1.526608, 0.2685312, 0, 0, 0, 1, 1,
-0.8269972, -1.132047, -1.14458, 0, 0, 0, 1, 1,
-0.8251449, -0.7029781, -1.66103, 0, 0, 0, 1, 1,
-0.7975025, -0.6228108, -1.595349, 0, 0, 0, 1, 1,
-0.7951347, 0.3806894, -2.14648, 0, 0, 0, 1, 1,
-0.7910043, -0.4309013, -0.4226261, 0, 0, 0, 1, 1,
-0.7873875, 0.9803587, -0.3468275, 1, 1, 1, 1, 1,
-0.7701164, 0.2975461, -1.279438, 1, 1, 1, 1, 1,
-0.7694879, 2.413691, 0.4699551, 1, 1, 1, 1, 1,
-0.7669523, 0.8136982, -0.630756, 1, 1, 1, 1, 1,
-0.761768, 0.2914065, -3.547511, 1, 1, 1, 1, 1,
-0.7562363, -0.6121311, -2.989491, 1, 1, 1, 1, 1,
-0.7534458, 0.8450196, -1.253005, 1, 1, 1, 1, 1,
-0.7475796, -0.2587847, -0.9318569, 1, 1, 1, 1, 1,
-0.7470128, 1.335285, -1.028913, 1, 1, 1, 1, 1,
-0.7457877, -1.729054, -3.155359, 1, 1, 1, 1, 1,
-0.744203, -0.5799156, -3.391857, 1, 1, 1, 1, 1,
-0.7439491, -0.56726, -2.950608, 1, 1, 1, 1, 1,
-0.7346989, 1.613854, -1.118318, 1, 1, 1, 1, 1,
-0.7318469, 1.364361, -0.27204, 1, 1, 1, 1, 1,
-0.7316774, -1.485584, -3.002519, 1, 1, 1, 1, 1,
-0.7287511, 2.065041, 0.3581379, 0, 0, 1, 1, 1,
-0.7271841, -0.2505004, -1.715272, 1, 0, 0, 1, 1,
-0.724674, 1.465853, -0.9995776, 1, 0, 0, 1, 1,
-0.7217556, 1.605518, -0.08708212, 1, 0, 0, 1, 1,
-0.7145745, 0.9377158, 0.2846626, 1, 0, 0, 1, 1,
-0.7129689, -1.793889, -2.70673, 1, 0, 0, 1, 1,
-0.7077777, 0.9631667, -0.897205, 0, 0, 0, 1, 1,
-0.7037987, -0.1229815, -1.314063, 0, 0, 0, 1, 1,
-0.7012144, 0.1890943, -0.3876415, 0, 0, 0, 1, 1,
-0.6989992, -1.16582, -3.236582, 0, 0, 0, 1, 1,
-0.6916932, 0.2155718, -1.349147, 0, 0, 0, 1, 1,
-0.6880181, -0.2200437, -2.325383, 0, 0, 0, 1, 1,
-0.6796211, -0.1990942, 0.1696384, 0, 0, 0, 1, 1,
-0.679553, -0.1381049, -1.366884, 1, 1, 1, 1, 1,
-0.676522, -1.358546, -3.804199, 1, 1, 1, 1, 1,
-0.6754757, -1.191035, -3.902066, 1, 1, 1, 1, 1,
-0.6670935, 0.6043237, -0.4348852, 1, 1, 1, 1, 1,
-0.6653536, 0.7582538, -1.345644, 1, 1, 1, 1, 1,
-0.6649357, -0.05177095, 0.7382603, 1, 1, 1, 1, 1,
-0.6648814, 1.713562, 0.07418281, 1, 1, 1, 1, 1,
-0.6591344, -0.4050444, -3.293772, 1, 1, 1, 1, 1,
-0.6541294, 0.07302395, -0.4605122, 1, 1, 1, 1, 1,
-0.6540202, 1.946329, -0.2377917, 1, 1, 1, 1, 1,
-0.6526728, 0.5073667, -1.090096, 1, 1, 1, 1, 1,
-0.6506531, -0.5124521, -2.353098, 1, 1, 1, 1, 1,
-0.647078, 0.7869176, -1.282175, 1, 1, 1, 1, 1,
-0.6468195, 0.8879225, 0.8440914, 1, 1, 1, 1, 1,
-0.6460078, 0.08616781, -0.6767005, 1, 1, 1, 1, 1,
-0.6422497, -1.999592, -5.388235, 0, 0, 1, 1, 1,
-0.6422268, 0.146402, -0.8209293, 1, 0, 0, 1, 1,
-0.6416333, 0.1365691, -0.5289697, 1, 0, 0, 1, 1,
-0.6412115, -0.1859324, -1.569104, 1, 0, 0, 1, 1,
-0.638778, 0.1288693, -2.53184, 1, 0, 0, 1, 1,
-0.6330017, -0.02947462, -1.77838, 1, 0, 0, 1, 1,
-0.6313565, 0.623654, -0.2091272, 0, 0, 0, 1, 1,
-0.6301326, -1.82662, -1.125794, 0, 0, 0, 1, 1,
-0.6257836, -2.586778, -1.260956, 0, 0, 0, 1, 1,
-0.6188193, 0.03314698, -3.030048, 0, 0, 0, 1, 1,
-0.616675, -0.03615946, -2.917552, 0, 0, 0, 1, 1,
-0.6150709, 0.2764074, -2.448684, 0, 0, 0, 1, 1,
-0.6147595, -1.663632, -2.899978, 0, 0, 0, 1, 1,
-0.6103917, -0.8786853, -3.588698, 1, 1, 1, 1, 1,
-0.6103371, -0.4148068, -1.375251, 1, 1, 1, 1, 1,
-0.6085681, -0.3643932, -3.164046, 1, 1, 1, 1, 1,
-0.6060529, -1.579918, -4.135108, 1, 1, 1, 1, 1,
-0.6054489, 0.0002445797, -0.6997024, 1, 1, 1, 1, 1,
-0.6014568, 0.8423322, -0.4099943, 1, 1, 1, 1, 1,
-0.5998721, -0.9814293, -3.226529, 1, 1, 1, 1, 1,
-0.5963054, -0.01221802, -0.9718627, 1, 1, 1, 1, 1,
-0.5848125, 1.666009, -1.104658, 1, 1, 1, 1, 1,
-0.5826172, 0.2702906, -1.130574, 1, 1, 1, 1, 1,
-0.5803076, -0.5489111, -3.69395, 1, 1, 1, 1, 1,
-0.5747163, -1.256605, -3.589043, 1, 1, 1, 1, 1,
-0.5722651, -0.980005, -3.171748, 1, 1, 1, 1, 1,
-0.5720233, 1.176133, -0.09915411, 1, 1, 1, 1, 1,
-0.5705562, 0.3190309, -0.4974294, 1, 1, 1, 1, 1,
-0.5689719, 1.366173, -0.7680726, 0, 0, 1, 1, 1,
-0.5672189, 0.8826661, -0.5991296, 1, 0, 0, 1, 1,
-0.5641405, 0.367687, 1.164214, 1, 0, 0, 1, 1,
-0.5639322, -0.126732, -1.892236, 1, 0, 0, 1, 1,
-0.5577278, 0.6453565, -0.7174789, 1, 0, 0, 1, 1,
-0.5561302, -1.918676, -1.307926, 1, 0, 0, 1, 1,
-0.5493463, 0.8116325, -0.2964225, 0, 0, 0, 1, 1,
-0.548525, -0.09073285, -3.949065, 0, 0, 0, 1, 1,
-0.5478337, -0.8364177, -1.241697, 0, 0, 0, 1, 1,
-0.5365239, 0.55863, -1.690393, 0, 0, 0, 1, 1,
-0.5247179, 1.050559, 0.07983691, 0, 0, 0, 1, 1,
-0.5212294, -0.01474695, 0.03757408, 0, 0, 0, 1, 1,
-0.5202503, 0.2982072, -0.771651, 0, 0, 0, 1, 1,
-0.5189382, -0.4536521, -3.255866, 1, 1, 1, 1, 1,
-0.5176025, -1.470243, -2.817412, 1, 1, 1, 1, 1,
-0.5174791, -1.097541, -2.658976, 1, 1, 1, 1, 1,
-0.5164115, 0.2783383, -1.121051, 1, 1, 1, 1, 1,
-0.5116395, 1.715334, -1.216771, 1, 1, 1, 1, 1,
-0.5108572, 0.1820493, -1.633042, 1, 1, 1, 1, 1,
-0.5103008, -1.00198, -3.406712, 1, 1, 1, 1, 1,
-0.5101821, 0.3501573, -0.1175082, 1, 1, 1, 1, 1,
-0.5088674, 0.2592736, -0.5078239, 1, 1, 1, 1, 1,
-0.5076325, 1.653543, -1.024237, 1, 1, 1, 1, 1,
-0.5008227, -1.008694, -1.775551, 1, 1, 1, 1, 1,
-0.4917752, 0.845351, 2.208276, 1, 1, 1, 1, 1,
-0.4911864, -0.5100661, -2.554961, 1, 1, 1, 1, 1,
-0.4910977, 0.8712379, 0.6280505, 1, 1, 1, 1, 1,
-0.4887733, -0.5172395, -2.869832, 1, 1, 1, 1, 1,
-0.4881503, -0.07978816, -2.449488, 0, 0, 1, 1, 1,
-0.4861628, -1.488568, -3.452716, 1, 0, 0, 1, 1,
-0.4830366, 0.6131984, -0.1710082, 1, 0, 0, 1, 1,
-0.482045, -0.290396, -0.2894969, 1, 0, 0, 1, 1,
-0.4787488, 0.4856201, 0.637912, 1, 0, 0, 1, 1,
-0.4771649, -0.04133097, -2.859855, 1, 0, 0, 1, 1,
-0.471828, 0.917285, 0.1383348, 0, 0, 0, 1, 1,
-0.4714926, -0.1840947, -4.398851, 0, 0, 0, 1, 1,
-0.4710073, -1.411841, -2.954554, 0, 0, 0, 1, 1,
-0.4676706, 1.196538, -0.0750912, 0, 0, 0, 1, 1,
-0.4661667, -0.2924384, -2.981035, 0, 0, 0, 1, 1,
-0.4613774, -0.753912, -1.556976, 0, 0, 0, 1, 1,
-0.4585996, 1.073498, 0.6629087, 0, 0, 0, 1, 1,
-0.4582451, -0.5492129, -3.595681, 1, 1, 1, 1, 1,
-0.4580287, -0.1909254, -1.563637, 1, 1, 1, 1, 1,
-0.4535178, 0.8763521, -0.713606, 1, 1, 1, 1, 1,
-0.4512488, -0.2185185, -3.125646, 1, 1, 1, 1, 1,
-0.4508629, 0.9528639, -0.7714272, 1, 1, 1, 1, 1,
-0.4478534, -0.6780564, -2.633645, 1, 1, 1, 1, 1,
-0.4352655, 0.00118298, -2.506859, 1, 1, 1, 1, 1,
-0.4303388, -0.6765848, -1.977066, 1, 1, 1, 1, 1,
-0.4298312, -0.6623948, -3.177042, 1, 1, 1, 1, 1,
-0.4297251, -0.8513829, -3.480458, 1, 1, 1, 1, 1,
-0.4294452, 1.615051, 1.639562, 1, 1, 1, 1, 1,
-0.4293392, -1.380473, -3.392701, 1, 1, 1, 1, 1,
-0.4289614, 0.4171621, -1.743564, 1, 1, 1, 1, 1,
-0.4286406, -1.013599, -3.071086, 1, 1, 1, 1, 1,
-0.425331, 1.809981, -0.7793617, 1, 1, 1, 1, 1,
-0.4247289, 0.2994551, -1.46799, 0, 0, 1, 1, 1,
-0.4247177, 0.08360588, -1.81785, 1, 0, 0, 1, 1,
-0.4224808, 0.8931908, -1.440298, 1, 0, 0, 1, 1,
-0.4208158, -0.1923946, -3.940221, 1, 0, 0, 1, 1,
-0.4204523, -0.2508336, -2.656408, 1, 0, 0, 1, 1,
-0.4195864, -2.287903, -2.188593, 1, 0, 0, 1, 1,
-0.4189043, 0.6184329, -0.3816482, 0, 0, 0, 1, 1,
-0.4182379, 0.9602661, -0.3865964, 0, 0, 0, 1, 1,
-0.4181267, 0.5890592, -0.5847867, 0, 0, 0, 1, 1,
-0.417037, 0.8788011, -1.176573, 0, 0, 0, 1, 1,
-0.4161861, -1.124297, -3.4447, 0, 0, 0, 1, 1,
-0.413232, -1.692704, -2.466708, 0, 0, 0, 1, 1,
-0.4124911, -1.75721, -3.138694, 0, 0, 0, 1, 1,
-0.4093523, -0.7192619, -3.504444, 1, 1, 1, 1, 1,
-0.3976887, -0.5101422, -0.8118088, 1, 1, 1, 1, 1,
-0.393519, 0.5218975, -0.6165148, 1, 1, 1, 1, 1,
-0.3925123, -0.5296028, -3.840455, 1, 1, 1, 1, 1,
-0.3862663, 0.5369684, -1.942876, 1, 1, 1, 1, 1,
-0.3856558, -1.094389, -2.347039, 1, 1, 1, 1, 1,
-0.3856372, -1.238524, -3.690284, 1, 1, 1, 1, 1,
-0.3812243, -0.3209429, -0.1406044, 1, 1, 1, 1, 1,
-0.3791571, -1.462895, -2.427871, 1, 1, 1, 1, 1,
-0.3784082, -0.4592097, -3.807604, 1, 1, 1, 1, 1,
-0.3766236, -1.229752, -3.563172, 1, 1, 1, 1, 1,
-0.3742988, -2.082866, -1.989691, 1, 1, 1, 1, 1,
-0.3715361, -0.3410719, -0.7883404, 1, 1, 1, 1, 1,
-0.3638674, 0.9616103, -0.527038, 1, 1, 1, 1, 1,
-0.3560444, 1.040461, -1.319031, 1, 1, 1, 1, 1,
-0.3557356, 0.1157993, 1.175182, 0, 0, 1, 1, 1,
-0.354331, -0.9450856, -4.338142, 1, 0, 0, 1, 1,
-0.3533659, 0.05909994, -1.206598, 1, 0, 0, 1, 1,
-0.3523887, 0.934395, -0.4637558, 1, 0, 0, 1, 1,
-0.3520305, -0.1976344, -3.117407, 1, 0, 0, 1, 1,
-0.3519302, -0.3466207, -4.166903, 1, 0, 0, 1, 1,
-0.3508285, 1.025195, -0.679692, 0, 0, 0, 1, 1,
-0.3488698, -0.5256051, -2.85611, 0, 0, 0, 1, 1,
-0.3419389, 2.062995, -0.8720458, 0, 0, 0, 1, 1,
-0.3412777, 1.269576, -0.7067651, 0, 0, 0, 1, 1,
-0.3393392, -0.8644637, -2.376366, 0, 0, 0, 1, 1,
-0.3327488, -0.4189211, -3.16538, 0, 0, 0, 1, 1,
-0.3279593, -1.034298, -2.440854, 0, 0, 0, 1, 1,
-0.3271697, -0.6987776, -2.955419, 1, 1, 1, 1, 1,
-0.3256726, -0.9397845, -1.81533, 1, 1, 1, 1, 1,
-0.3252246, -0.7602307, -2.057116, 1, 1, 1, 1, 1,
-0.323256, 1.131474, 1.377559, 1, 1, 1, 1, 1,
-0.3212398, -0.760639, -2.447201, 1, 1, 1, 1, 1,
-0.3199588, -0.1100071, 0.2215556, 1, 1, 1, 1, 1,
-0.3185577, 1.278214, -1.363519, 1, 1, 1, 1, 1,
-0.3182664, 0.6985788, -0.2924018, 1, 1, 1, 1, 1,
-0.3152482, 0.2850129, -1.714788, 1, 1, 1, 1, 1,
-0.3127831, 0.55489, 0.08871727, 1, 1, 1, 1, 1,
-0.3108064, -2.328888, -3.101723, 1, 1, 1, 1, 1,
-0.3095762, -1.667635, -3.512964, 1, 1, 1, 1, 1,
-0.3064289, -1.262175, -1.147008, 1, 1, 1, 1, 1,
-0.3003855, 1.506493, -0.7887477, 1, 1, 1, 1, 1,
-0.2995929, 2.152237, -0.6109368, 1, 1, 1, 1, 1,
-0.2963953, -0.6697866, -3.332298, 0, 0, 1, 1, 1,
-0.2928957, 1.185083, 0.4769606, 1, 0, 0, 1, 1,
-0.2918926, -0.7637488, -1.401057, 1, 0, 0, 1, 1,
-0.2851461, -0.5104024, -3.484075, 1, 0, 0, 1, 1,
-0.2840899, 0.6619014, 0.4073227, 1, 0, 0, 1, 1,
-0.2803381, -0.1236998, -0.4721482, 1, 0, 0, 1, 1,
-0.2764594, -1.467255, -4.206516, 0, 0, 0, 1, 1,
-0.2755733, 0.9720467, -1.771328, 0, 0, 0, 1, 1,
-0.273925, 0.8327755, 0.8959033, 0, 0, 0, 1, 1,
-0.2637047, 1.225844, 0.04054819, 0, 0, 0, 1, 1,
-0.2587366, 0.796452, -0.3079848, 0, 0, 0, 1, 1,
-0.2561391, 2.00564, -0.3523569, 0, 0, 0, 1, 1,
-0.2559902, -0.1691152, -3.544657, 0, 0, 0, 1, 1,
-0.2530081, 0.4112751, 0.1749908, 1, 1, 1, 1, 1,
-0.2528312, 0.7583539, -1.339133, 1, 1, 1, 1, 1,
-0.2515214, -0.7812247, -3.80658, 1, 1, 1, 1, 1,
-0.2465179, -0.2308897, -3.374462, 1, 1, 1, 1, 1,
-0.2454012, -1.833229, -1.252262, 1, 1, 1, 1, 1,
-0.2431733, -0.7907124, -3.104, 1, 1, 1, 1, 1,
-0.2419454, 0.8415162, -0.1993973, 1, 1, 1, 1, 1,
-0.2401392, 0.4154579, -2.341681, 1, 1, 1, 1, 1,
-0.2382611, 0.07657571, -0.8696835, 1, 1, 1, 1, 1,
-0.2366652, 1.283526, -1.469597, 1, 1, 1, 1, 1,
-0.2333325, 0.05993674, -1.731041, 1, 1, 1, 1, 1,
-0.2314097, -0.8106544, -1.837104, 1, 1, 1, 1, 1,
-0.2264848, -1.242839, -2.56472, 1, 1, 1, 1, 1,
-0.2256257, 1.843874, -1.234082, 1, 1, 1, 1, 1,
-0.2234788, 0.6109468, -1.066873, 1, 1, 1, 1, 1,
-0.2193324, -0.9610292, -2.615187, 0, 0, 1, 1, 1,
-0.2179488, -0.3141977, -3.396579, 1, 0, 0, 1, 1,
-0.2163431, 2.416377, -0.5164464, 1, 0, 0, 1, 1,
-0.2138879, -0.6789557, -2.03379, 1, 0, 0, 1, 1,
-0.2103493, -0.3481591, -2.768243, 1, 0, 0, 1, 1,
-0.2072616, 1.038235, -1.018746, 1, 0, 0, 1, 1,
-0.2049502, 1.223286, 0.6500325, 0, 0, 0, 1, 1,
-0.2042253, 1.013653, -2.146517, 0, 0, 0, 1, 1,
-0.2039558, 1.636449, -1.352117, 0, 0, 0, 1, 1,
-0.2027743, -0.8338663, -1.871708, 0, 0, 0, 1, 1,
-0.1997261, 1.662813, -0.647851, 0, 0, 0, 1, 1,
-0.1989452, 0.9721728, -1.206368, 0, 0, 0, 1, 1,
-0.1921143, 1.143414, -0.4526236, 0, 0, 0, 1, 1,
-0.1821075, -0.6989599, -2.546507, 1, 1, 1, 1, 1,
-0.1735784, -1.641216, -3.345471, 1, 1, 1, 1, 1,
-0.1725191, 0.2650036, -1.230663, 1, 1, 1, 1, 1,
-0.1723412, 1.43601, 0.1079583, 1, 1, 1, 1, 1,
-0.1692528, -0.6052467, -1.653224, 1, 1, 1, 1, 1,
-0.168698, -0.0332375, -1.595487, 1, 1, 1, 1, 1,
-0.1640491, -1.459148, -1.158699, 1, 1, 1, 1, 1,
-0.1631521, 1.881689, -0.6873441, 1, 1, 1, 1, 1,
-0.1620526, -0.8654767, -2.445251, 1, 1, 1, 1, 1,
-0.1595089, 0.9308473, -1.395056, 1, 1, 1, 1, 1,
-0.1591164, 0.6828184, 0.7114581, 1, 1, 1, 1, 1,
-0.1588806, -0.2125981, -1.689162, 1, 1, 1, 1, 1,
-0.1568439, -0.7095985, -2.021248, 1, 1, 1, 1, 1,
-0.1561328, 0.697708, 1.156567, 1, 1, 1, 1, 1,
-0.1560058, 0.8768405, 0.1900595, 1, 1, 1, 1, 1,
-0.1559563, 0.1599597, -0.8770633, 0, 0, 1, 1, 1,
-0.1463776, 1.596526, 2.197428, 1, 0, 0, 1, 1,
-0.1422604, 2.152273, -1.093558, 1, 0, 0, 1, 1,
-0.1415419, -2.016615, -3.652072, 1, 0, 0, 1, 1,
-0.1375801, -0.6490061, -5.034532, 1, 0, 0, 1, 1,
-0.1366766, -2.406188, -3.307529, 1, 0, 0, 1, 1,
-0.1362617, 0.3541848, 0.8250311, 0, 0, 0, 1, 1,
-0.1351247, -0.2487185, -3.607899, 0, 0, 0, 1, 1,
-0.1351097, 0.1856903, -0.6293072, 0, 0, 0, 1, 1,
-0.1312742, 0.257406, -0.8500282, 0, 0, 0, 1, 1,
-0.1278942, 1.375829, 0.3214576, 0, 0, 0, 1, 1,
-0.1225373, -0.7432494, -2.932339, 0, 0, 0, 1, 1,
-0.1213996, 0.1784918, -0.3345235, 0, 0, 0, 1, 1,
-0.12131, -1.254704, -4.078882, 1, 1, 1, 1, 1,
-0.1188716, -2.410962, -3.251068, 1, 1, 1, 1, 1,
-0.1163562, -0.4431613, -5.384403, 1, 1, 1, 1, 1,
-0.1159845, -0.2839577, -2.548528, 1, 1, 1, 1, 1,
-0.1123655, -1.052277, -4.450956, 1, 1, 1, 1, 1,
-0.1073666, 0.4441835, 0.9341566, 1, 1, 1, 1, 1,
-0.1004004, -1.062335, -1.784245, 1, 1, 1, 1, 1,
-0.09573165, -0.4052377, -2.484475, 1, 1, 1, 1, 1,
-0.09369972, 0.2184628, -1.231267, 1, 1, 1, 1, 1,
-0.08990375, 0.02675571, -0.5409987, 1, 1, 1, 1, 1,
-0.08973923, -0.4118748, -2.759801, 1, 1, 1, 1, 1,
-0.08557519, 1.463583, -0.3930738, 1, 1, 1, 1, 1,
-0.08510939, 1.061148, -2.053489, 1, 1, 1, 1, 1,
-0.08435053, 0.1019195, -0.9266643, 1, 1, 1, 1, 1,
-0.08011182, -0.2386578, -4.933512, 1, 1, 1, 1, 1,
-0.07963585, 0.1573812, 0.2478327, 0, 0, 1, 1, 1,
-0.07901227, -0.319428, -3.368574, 1, 0, 0, 1, 1,
-0.07444804, -2.15291, -4.552577, 1, 0, 0, 1, 1,
-0.07442988, 0.6744837, 1.026782, 1, 0, 0, 1, 1,
-0.06970703, 0.4464575, 1.21804, 1, 0, 0, 1, 1,
-0.06931806, -0.8336328, -1.664944, 1, 0, 0, 1, 1,
-0.06920337, -1.061576, -2.406369, 0, 0, 0, 1, 1,
-0.06636654, -0.5101195, -3.829654, 0, 0, 0, 1, 1,
-0.06373914, -0.1242696, -2.416529, 0, 0, 0, 1, 1,
-0.06178189, -1.185448, -3.775988, 0, 0, 0, 1, 1,
-0.05969568, 1.831232, -0.2406477, 0, 0, 0, 1, 1,
-0.05929769, 0.07802083, -1.295782, 0, 0, 0, 1, 1,
-0.05738856, -1.101307, -2.284206, 0, 0, 0, 1, 1,
-0.05594149, 0.7676926, -0.1878299, 1, 1, 1, 1, 1,
-0.05339661, -0.1822026, -2.008231, 1, 1, 1, 1, 1,
-0.05273315, -1.573757, -2.995053, 1, 1, 1, 1, 1,
-0.04835608, 1.050138, -0.5790302, 1, 1, 1, 1, 1,
-0.04465809, 0.2402238, -0.7861592, 1, 1, 1, 1, 1,
-0.04388444, 0.8907897, -0.2397298, 1, 1, 1, 1, 1,
-0.04334917, -1.275413, -4.051286, 1, 1, 1, 1, 1,
-0.0368793, -1.561116, -5.014445, 1, 1, 1, 1, 1,
-0.03411322, 0.6513885, 0.3997895, 1, 1, 1, 1, 1,
-0.02922926, 1.099831, 0.3317168, 1, 1, 1, 1, 1,
-0.0290603, -0.7733309, -4.299725, 1, 1, 1, 1, 1,
-0.02578451, 0.7298365, -0.3191988, 1, 1, 1, 1, 1,
-0.02133384, -0.8953383, -1.463726, 1, 1, 1, 1, 1,
-0.0137836, 1.267776, -0.8665943, 1, 1, 1, 1, 1,
-0.009588217, -0.4108638, -2.785896, 1, 1, 1, 1, 1,
-0.007851394, -0.1224219, -4.086292, 0, 0, 1, 1, 1,
-0.006246012, 1.086965, 0.6190391, 1, 0, 0, 1, 1,
-0.005744296, -0.6228352, -1.08126, 1, 0, 0, 1, 1,
-0.005308036, 0.2492111, -0.1444216, 1, 0, 0, 1, 1,
0.0001868362, 1.38797, 0.3945749, 1, 0, 0, 1, 1,
0.002890898, -1.083816, 2.093733, 1, 0, 0, 1, 1,
0.007237496, -2.001042, 1.238326, 0, 0, 0, 1, 1,
0.009114334, 0.9786392, 0.5804968, 0, 0, 0, 1, 1,
0.01292543, 0.2808808, 0.5320785, 0, 0, 0, 1, 1,
0.01464396, 0.3373323, -0.8238723, 0, 0, 0, 1, 1,
0.0229118, -0.3730891, 4.181461, 0, 0, 0, 1, 1,
0.02413629, -0.7890078, 5.746915, 0, 0, 0, 1, 1,
0.02602654, 0.1764938, 0.6397877, 0, 0, 0, 1, 1,
0.02612567, -1.18478, 1.436956, 1, 1, 1, 1, 1,
0.02860363, 0.8568331, -0.3735989, 1, 1, 1, 1, 1,
0.03289756, 1.005478, 0.3013724, 1, 1, 1, 1, 1,
0.03320504, -1.440536, 3.109249, 1, 1, 1, 1, 1,
0.03423715, -1.137257, 2.59221, 1, 1, 1, 1, 1,
0.0358083, -1.850989, 3.175127, 1, 1, 1, 1, 1,
0.03689853, 0.9340347, -0.3206021, 1, 1, 1, 1, 1,
0.04049765, 0.5857006, -0.8589126, 1, 1, 1, 1, 1,
0.04167263, 1.347295, -0.06651562, 1, 1, 1, 1, 1,
0.0460365, 0.2076243, 0.7854754, 1, 1, 1, 1, 1,
0.05171826, 0.1646563, 0.2775428, 1, 1, 1, 1, 1,
0.05290303, 0.3769323, -0.6472597, 1, 1, 1, 1, 1,
0.05525759, 0.6312034, 0.5514749, 1, 1, 1, 1, 1,
0.05949456, 0.8253203, -2.127722, 1, 1, 1, 1, 1,
0.06065587, 0.4971574, -1.169228, 1, 1, 1, 1, 1,
0.07742757, 1.518304, 1.004245, 0, 0, 1, 1, 1,
0.07863118, -0.2792101, 2.880605, 1, 0, 0, 1, 1,
0.08350889, -0.3891295, 2.285082, 1, 0, 0, 1, 1,
0.0854805, -0.2637599, 2.703737, 1, 0, 0, 1, 1,
0.08721558, 0.8838865, -0.8124862, 1, 0, 0, 1, 1,
0.09100357, 0.6650951, 1.245177, 1, 0, 0, 1, 1,
0.09138231, -0.7562951, 2.292833, 0, 0, 0, 1, 1,
0.09421614, 1.770939, 0.4447329, 0, 0, 0, 1, 1,
0.09695937, -1.146142, 3.348449, 0, 0, 0, 1, 1,
0.09819338, -1.580211, 3.789672, 0, 0, 0, 1, 1,
0.1002683, 0.4335796, 1.040858, 0, 0, 0, 1, 1,
0.1012406, 0.2206181, 0.7258474, 0, 0, 0, 1, 1,
0.1022558, -1.100117, 2.921686, 0, 0, 0, 1, 1,
0.1025496, -0.6151266, 4.479777, 1, 1, 1, 1, 1,
0.1054223, 0.140959, 0.8792323, 1, 1, 1, 1, 1,
0.1055874, 0.2803717, -0.07286356, 1, 1, 1, 1, 1,
0.1057136, 1.626131, 2.344208, 1, 1, 1, 1, 1,
0.1058205, 0.4337308, 1.329387, 1, 1, 1, 1, 1,
0.1066201, -0.894096, 2.471046, 1, 1, 1, 1, 1,
0.1119047, 0.356145, -0.1794116, 1, 1, 1, 1, 1,
0.1120365, -0.8727506, 4.016557, 1, 1, 1, 1, 1,
0.1155255, 0.3561805, 1.506811, 1, 1, 1, 1, 1,
0.117854, -0.1905694, 2.719438, 1, 1, 1, 1, 1,
0.1268775, 2.39188, -0.6354593, 1, 1, 1, 1, 1,
0.1313966, 0.01935909, 1.737186, 1, 1, 1, 1, 1,
0.1327516, -0.7150736, 2.187911, 1, 1, 1, 1, 1,
0.1357621, 1.497193, 0.3554586, 1, 1, 1, 1, 1,
0.1387286, -0.0488596, 0.6718653, 1, 1, 1, 1, 1,
0.1390718, 0.2397644, -0.01739543, 0, 0, 1, 1, 1,
0.1396666, 0.04905189, 0.6160037, 1, 0, 0, 1, 1,
0.1398159, 0.4961651, 1.33348, 1, 0, 0, 1, 1,
0.1470787, 0.8644027, -0.4969284, 1, 0, 0, 1, 1,
0.1474636, -0.6250272, 6.516097, 1, 0, 0, 1, 1,
0.1551745, -2.233482, 1.569526, 1, 0, 0, 1, 1,
0.1561716, -0.5439006, 3.060439, 0, 0, 0, 1, 1,
0.1567122, 0.01681259, 2.301982, 0, 0, 0, 1, 1,
0.1568975, 0.3360651, 0.3846724, 0, 0, 0, 1, 1,
0.1590548, -0.5749177, 0.685127, 0, 0, 0, 1, 1,
0.1682248, 1.370828, 0.06202475, 0, 0, 0, 1, 1,
0.1718059, 0.2969638, -0.7805628, 0, 0, 0, 1, 1,
0.1753992, -0.733714, 2.68109, 0, 0, 0, 1, 1,
0.1766714, 1.914827, 1.085432, 1, 1, 1, 1, 1,
0.1779072, 0.009372183, -0.1309869, 1, 1, 1, 1, 1,
0.1793485, -0.2468611, 3.189142, 1, 1, 1, 1, 1,
0.1810796, -0.4252184, 3.588594, 1, 1, 1, 1, 1,
0.1812927, -0.2849703, 2.163515, 1, 1, 1, 1, 1,
0.1864181, -0.1972605, 3.439036, 1, 1, 1, 1, 1,
0.1875008, -1.764126, 3.302567, 1, 1, 1, 1, 1,
0.19696, 0.4161355, 0.7237651, 1, 1, 1, 1, 1,
0.1970774, -0.8667122, 2.386185, 1, 1, 1, 1, 1,
0.2012546, 0.4828875, 0.1983215, 1, 1, 1, 1, 1,
0.2017063, -1.430183, 4.608631, 1, 1, 1, 1, 1,
0.2035731, 1.257302, 1.199195, 1, 1, 1, 1, 1,
0.2073393, 0.8869765, -0.9066381, 1, 1, 1, 1, 1,
0.2089155, 0.2693113, -0.3093037, 1, 1, 1, 1, 1,
0.2109947, -0.7375261, 2.956557, 1, 1, 1, 1, 1,
0.2138002, -0.3560564, 2.951625, 0, 0, 1, 1, 1,
0.2160302, 1.899011, 1.932596, 1, 0, 0, 1, 1,
0.2181585, -1.279696, 2.581222, 1, 0, 0, 1, 1,
0.2184308, -0.2395098, 2.57019, 1, 0, 0, 1, 1,
0.2263846, -0.5201551, 1.313212, 1, 0, 0, 1, 1,
0.2292604, -0.02601157, 1.169971, 1, 0, 0, 1, 1,
0.2326026, 1.344424, 0.763653, 0, 0, 0, 1, 1,
0.2338109, 0.2141976, 1.419495, 0, 0, 0, 1, 1,
0.2341897, -2.588178, 2.762994, 0, 0, 0, 1, 1,
0.2371641, 1.815946, -0.8002668, 0, 0, 0, 1, 1,
0.2372155, -0.9038204, 3.0905, 0, 0, 0, 1, 1,
0.2372653, -0.3174932, 3.405069, 0, 0, 0, 1, 1,
0.2391817, -0.2071774, 3.654612, 0, 0, 0, 1, 1,
0.2392281, -2.875778, 2.178002, 1, 1, 1, 1, 1,
0.2401707, 0.5757527, 1.498641, 1, 1, 1, 1, 1,
0.2429111, -0.04726673, 1.341748, 1, 1, 1, 1, 1,
0.2448288, -0.2989623, 1.12359, 1, 1, 1, 1, 1,
0.2498045, -0.1961072, 3.744094, 1, 1, 1, 1, 1,
0.2507627, 0.1869258, -0.125654, 1, 1, 1, 1, 1,
0.2510412, 0.171818, 1.698578, 1, 1, 1, 1, 1,
0.2516063, -0.4308644, 4.648774, 1, 1, 1, 1, 1,
0.256932, -1.176444, 1.47365, 1, 1, 1, 1, 1,
0.2581222, 1.916317, -0.5275046, 1, 1, 1, 1, 1,
0.2611551, -2.128611, 2.919812, 1, 1, 1, 1, 1,
0.2666838, 0.7277393, 0.6498779, 1, 1, 1, 1, 1,
0.2668553, 0.08253808, 0.1747305, 1, 1, 1, 1, 1,
0.2669308, 1.32531, 0.6594519, 1, 1, 1, 1, 1,
0.2669357, 0.02135889, 1.319667, 1, 1, 1, 1, 1,
0.2674024, 0.3146883, 1.349794, 0, 0, 1, 1, 1,
0.2736476, -0.1809523, 3.023188, 1, 0, 0, 1, 1,
0.2743198, -0.4448694, 2.113678, 1, 0, 0, 1, 1,
0.279708, 0.5988266, 1.722107, 1, 0, 0, 1, 1,
0.2806074, 1.629821, 0.5745091, 1, 0, 0, 1, 1,
0.2825391, 0.1169077, 0.04208346, 1, 0, 0, 1, 1,
0.2834697, -0.9060532, 2.707778, 0, 0, 0, 1, 1,
0.2834772, -0.8182005, 3.552389, 0, 0, 0, 1, 1,
0.2862722, 0.02531816, 0.9940049, 0, 0, 0, 1, 1,
0.2891051, 0.3016968, -1.342512, 0, 0, 0, 1, 1,
0.2903557, -1.833015, 3.732265, 0, 0, 0, 1, 1,
0.2912439, 2.086734, 0.7716913, 0, 0, 0, 1, 1,
0.2986639, -1.0655, 2.537028, 0, 0, 0, 1, 1,
0.2997876, -1.243538, 3.475828, 1, 1, 1, 1, 1,
0.3009554, -0.4330618, 3.534801, 1, 1, 1, 1, 1,
0.3049604, -0.5674415, 3.353408, 1, 1, 1, 1, 1,
0.3070815, 0.4950547, -1.578015, 1, 1, 1, 1, 1,
0.3074224, -0.3492821, 2.075995, 1, 1, 1, 1, 1,
0.3075027, -0.6738545, 2.475679, 1, 1, 1, 1, 1,
0.3095349, -0.2272787, 2.282503, 1, 1, 1, 1, 1,
0.3112473, -0.2292591, 3.598737, 1, 1, 1, 1, 1,
0.3128888, 1.783603, -0.3524971, 1, 1, 1, 1, 1,
0.3196544, -0.5299065, 2.050908, 1, 1, 1, 1, 1,
0.3234772, 0.986568, 1.138885, 1, 1, 1, 1, 1,
0.3352205, 0.5201358, -1.418784, 1, 1, 1, 1, 1,
0.3366569, 0.6191962, -0.8113697, 1, 1, 1, 1, 1,
0.339433, -0.5397227, 3.267883, 1, 1, 1, 1, 1,
0.3458403, -1.535708, 2.500333, 1, 1, 1, 1, 1,
0.3464808, -0.7083291, 3.096498, 0, 0, 1, 1, 1,
0.3599219, 0.5201883, 1.957275, 1, 0, 0, 1, 1,
0.3609419, -0.8154007, 3.39362, 1, 0, 0, 1, 1,
0.3701701, 0.01723829, 1.327187, 1, 0, 0, 1, 1,
0.3707822, 0.7340342, 1.090347, 1, 0, 0, 1, 1,
0.3725363, 0.2265212, 1.166357, 1, 0, 0, 1, 1,
0.372843, 1.088693, 0.1249754, 0, 0, 0, 1, 1,
0.3731514, 1.028821, 0.2355645, 0, 0, 0, 1, 1,
0.375732, -0.8667206, 1.869081, 0, 0, 0, 1, 1,
0.3758969, -0.1886381, 2.755133, 0, 0, 0, 1, 1,
0.3760384, -1.140815, 2.967445, 0, 0, 0, 1, 1,
0.3829858, -0.8251557, 3.858418, 0, 0, 0, 1, 1,
0.3836214, -0.7862111, 4.201535, 0, 0, 0, 1, 1,
0.383668, -0.2910869, 1.40397, 1, 1, 1, 1, 1,
0.3852411, 0.209964, 2.204244, 1, 1, 1, 1, 1,
0.3853261, -1.260587, 2.892149, 1, 1, 1, 1, 1,
0.3886982, 0.950865, 0.3207758, 1, 1, 1, 1, 1,
0.3921642, 0.4470087, 1.333062, 1, 1, 1, 1, 1,
0.3931552, -1.595743, 4.805762, 1, 1, 1, 1, 1,
0.3946055, -0.5149614, 2.046668, 1, 1, 1, 1, 1,
0.4016447, 1.241946, 0.6930558, 1, 1, 1, 1, 1,
0.4078631, 0.5396985, 1.25848, 1, 1, 1, 1, 1,
0.4101135, 0.03386983, 1.512859, 1, 1, 1, 1, 1,
0.4106253, -0.8487134, 2.784585, 1, 1, 1, 1, 1,
0.4134458, 0.6259267, 3.156933, 1, 1, 1, 1, 1,
0.4153486, 1.083404, 0.9675441, 1, 1, 1, 1, 1,
0.4173284, 0.4866059, -0.2166643, 1, 1, 1, 1, 1,
0.4225464, -1.667789, 4.244572, 1, 1, 1, 1, 1,
0.4226617, -0.4654584, 2.911052, 0, 0, 1, 1, 1,
0.4356125, 1.111811, 1.840872, 1, 0, 0, 1, 1,
0.4385388, -1.091887, 2.141938, 1, 0, 0, 1, 1,
0.4394698, 1.609611, -0.2652913, 1, 0, 0, 1, 1,
0.4428101, 1.013947, -0.1104025, 1, 0, 0, 1, 1,
0.4476448, -1.963038, 2.459105, 1, 0, 0, 1, 1,
0.4492633, -0.1603039, 1.025993, 0, 0, 0, 1, 1,
0.4530911, 0.002286563, 1.682164, 0, 0, 0, 1, 1,
0.4540853, -0.564364, 2.708357, 0, 0, 0, 1, 1,
0.4620509, -1.500718, 2.354331, 0, 0, 0, 1, 1,
0.4655066, 1.078909, -1.183235, 0, 0, 0, 1, 1,
0.4660087, 1.825746, 0.4323108, 0, 0, 0, 1, 1,
0.4667201, -0.05218986, 2.583933, 0, 0, 0, 1, 1,
0.4693505, 1.295702, 1.317956, 1, 1, 1, 1, 1,
0.4694195, -0.7728026, 3.203834, 1, 1, 1, 1, 1,
0.4697576, -0.6592181, 2.060396, 1, 1, 1, 1, 1,
0.4697777, -0.9531339, 3.580961, 1, 1, 1, 1, 1,
0.4714846, 0.222734, 0.7189666, 1, 1, 1, 1, 1,
0.4717437, 0.6982487, 2.883873, 1, 1, 1, 1, 1,
0.4726893, -0.5546515, 2.401183, 1, 1, 1, 1, 1,
0.474286, -0.2687595, 2.847314, 1, 1, 1, 1, 1,
0.4747471, -1.129791, 3.783295, 1, 1, 1, 1, 1,
0.4843826, 1.693154, 3.009271, 1, 1, 1, 1, 1,
0.4849287, -2.003958, 2.665782, 1, 1, 1, 1, 1,
0.492065, -0.01479131, 1.291604, 1, 1, 1, 1, 1,
0.4932841, -0.09286401, 1.722841, 1, 1, 1, 1, 1,
0.4992978, -0.05902153, 1.880651, 1, 1, 1, 1, 1,
0.501728, -0.1214709, 1.575938, 1, 1, 1, 1, 1,
0.5081822, -0.06987766, 1.744856, 0, 0, 1, 1, 1,
0.5082408, -0.841561, 1.504302, 1, 0, 0, 1, 1,
0.5114646, 0.0782142, 2.354436, 1, 0, 0, 1, 1,
0.5115348, -1.455908, 3.529862, 1, 0, 0, 1, 1,
0.5157285, 0.6887408, 0.5432154, 1, 0, 0, 1, 1,
0.5187026, -0.4527535, 0.9070727, 1, 0, 0, 1, 1,
0.5229277, -0.5016147, 2.935841, 0, 0, 0, 1, 1,
0.5237795, -1.247764, 3.324479, 0, 0, 0, 1, 1,
0.5297416, -0.3165388, 0.869382, 0, 0, 0, 1, 1,
0.5313328, -1.730391, 2.516719, 0, 0, 0, 1, 1,
0.5346617, -0.7113243, 2.148774, 0, 0, 0, 1, 1,
0.5376068, -1.810225, 1.69487, 0, 0, 0, 1, 1,
0.5376623, 1.132228, -0.3638736, 0, 0, 0, 1, 1,
0.5420966, -0.7389358, 1.796503, 1, 1, 1, 1, 1,
0.5431182, -0.9242237, 1.872893, 1, 1, 1, 1, 1,
0.547346, 1.230603, 2.076473, 1, 1, 1, 1, 1,
0.5493883, 0.2153014, 0.1130226, 1, 1, 1, 1, 1,
0.5510725, 0.01286488, 1.135426, 1, 1, 1, 1, 1,
0.5523186, 0.7275209, 0.779137, 1, 1, 1, 1, 1,
0.555917, -1.316617, 2.658645, 1, 1, 1, 1, 1,
0.5560427, -0.3456641, 2.673707, 1, 1, 1, 1, 1,
0.5600699, -0.6169307, -0.538448, 1, 1, 1, 1, 1,
0.5603864, -0.4950418, 2.672979, 1, 1, 1, 1, 1,
0.5622212, 0.3136574, 1.216021, 1, 1, 1, 1, 1,
0.563715, 0.05504437, 1.642109, 1, 1, 1, 1, 1,
0.5654813, -0.3435332, 1.572054, 1, 1, 1, 1, 1,
0.5656169, -0.1941141, 1.981265, 1, 1, 1, 1, 1,
0.5670725, -0.01649976, 1.400827, 1, 1, 1, 1, 1,
0.568977, 0.6938685, -0.0418088, 0, 0, 1, 1, 1,
0.5691062, -1.348855, 4.230399, 1, 0, 0, 1, 1,
0.5716161, -1.011971, 3.930139, 1, 0, 0, 1, 1,
0.5738612, 1.71299, 0.5706766, 1, 0, 0, 1, 1,
0.5744119, 0.266672, 0.2542048, 1, 0, 0, 1, 1,
0.5770072, -0.2496373, 1.270249, 1, 0, 0, 1, 1,
0.5770547, -0.6076918, 0.8648391, 0, 0, 0, 1, 1,
0.5830409, -0.8575184, 2.478149, 0, 0, 0, 1, 1,
0.584859, -1.372545, 2.31533, 0, 0, 0, 1, 1,
0.585566, 0.1390589, 1.924374, 0, 0, 0, 1, 1,
0.5903745, -0.4165158, 2.509671, 0, 0, 0, 1, 1,
0.5934283, 1.232327, 1.782839, 0, 0, 0, 1, 1,
0.5986356, 1.087241, 0.4642824, 0, 0, 0, 1, 1,
0.6042168, 2.405921, -0.8628915, 1, 1, 1, 1, 1,
0.6047433, 0.3878998, 0.1830559, 1, 1, 1, 1, 1,
0.6057522, 0.4734, 1.926396, 1, 1, 1, 1, 1,
0.6059478, -0.4789873, 3.251882, 1, 1, 1, 1, 1,
0.6129558, -0.2401316, 2.526691, 1, 1, 1, 1, 1,
0.6136181, -2.255693, 3.872805, 1, 1, 1, 1, 1,
0.6140831, -0.4368322, 2.039577, 1, 1, 1, 1, 1,
0.6193335, -0.3043494, 2.536057, 1, 1, 1, 1, 1,
0.6250593, -0.5608336, 2.465507, 1, 1, 1, 1, 1,
0.6326826, 0.5538491, 0.2182663, 1, 1, 1, 1, 1,
0.637558, 0.7955015, 0.03662731, 1, 1, 1, 1, 1,
0.6400915, -0.829372, 3.541874, 1, 1, 1, 1, 1,
0.6404282, 0.9501616, -0.06521396, 1, 1, 1, 1, 1,
0.6428382, -1.145077, 2.515329, 1, 1, 1, 1, 1,
0.6436004, 0.6231883, 0.01506976, 1, 1, 1, 1, 1,
0.6481147, 0.3365964, 1.363738, 0, 0, 1, 1, 1,
0.6498249, -0.1646359, 0.6630057, 1, 0, 0, 1, 1,
0.6529587, 0.8136016, 0.7877043, 1, 0, 0, 1, 1,
0.6569378, 0.5218017, 0.6939784, 1, 0, 0, 1, 1,
0.6575385, 0.795955, -0.1353019, 1, 0, 0, 1, 1,
0.6589723, 0.8065387, -0.2329079, 1, 0, 0, 1, 1,
0.6600886, 1.146491, 0.8444886, 0, 0, 0, 1, 1,
0.6607852, -0.6713006, 2.009569, 0, 0, 0, 1, 1,
0.6638869, 0.3159218, 0.09831797, 0, 0, 0, 1, 1,
0.6680642, -0.2956532, 2.077758, 0, 0, 0, 1, 1,
0.6693135, 0.5331774, 0.4831949, 0, 0, 0, 1, 1,
0.6708636, 0.8950085, -0.6626301, 0, 0, 0, 1, 1,
0.6820488, 0.7743607, 1.578413, 0, 0, 0, 1, 1,
0.6834414, 1.356687, 0.1133325, 1, 1, 1, 1, 1,
0.6851416, -1.913328, 2.040983, 1, 1, 1, 1, 1,
0.689888, 1.146086, 0.7144653, 1, 1, 1, 1, 1,
0.7041417, -1.419397, 1.957311, 1, 1, 1, 1, 1,
0.7074149, 0.5215554, 2.039265, 1, 1, 1, 1, 1,
0.7078962, 1.598068, 0.4627349, 1, 1, 1, 1, 1,
0.7080088, -1.649793, 2.49409, 1, 1, 1, 1, 1,
0.708926, 1.31636, -0.7461622, 1, 1, 1, 1, 1,
0.7098542, 0.6251487, 0.2978601, 1, 1, 1, 1, 1,
0.7100622, -0.5662184, 2.552982, 1, 1, 1, 1, 1,
0.712577, -0.2970994, 1.659561, 1, 1, 1, 1, 1,
0.7143929, 0.750955, 1.789578, 1, 1, 1, 1, 1,
0.7173483, 0.8367856, -1.282245, 1, 1, 1, 1, 1,
0.7238739, 1.34729, 2.45642, 1, 1, 1, 1, 1,
0.7270004, 0.2191873, 2.928457, 1, 1, 1, 1, 1,
0.7297648, -0.2467955, 2.300047, 0, 0, 1, 1, 1,
0.7301289, -1.319728, 4.049157, 1, 0, 0, 1, 1,
0.730723, -0.4377772, 0.8850552, 1, 0, 0, 1, 1,
0.7318051, 0.8785831, 0.6681993, 1, 0, 0, 1, 1,
0.7346944, 1.691041, -0.1617197, 1, 0, 0, 1, 1,
0.7348166, 0.2333281, 1.586836, 1, 0, 0, 1, 1,
0.7409143, -1.6539, 3.392918, 0, 0, 0, 1, 1,
0.7470782, 1.096699, 1.240086, 0, 0, 0, 1, 1,
0.7485263, -0.116569, 1.904919, 0, 0, 0, 1, 1,
0.7497796, 0.2502536, -0.7924564, 0, 0, 0, 1, 1,
0.7614852, -0.2520795, 2.85139, 0, 0, 0, 1, 1,
0.7628423, -2.047469, 2.836821, 0, 0, 0, 1, 1,
0.7671928, -1.245959, 2.965777, 0, 0, 0, 1, 1,
0.7708314, -0.8857321, 3.759171, 1, 1, 1, 1, 1,
0.7719169, 0.03122029, 1.778871, 1, 1, 1, 1, 1,
0.7725568, -1.844065, 1.885622, 1, 1, 1, 1, 1,
0.7847895, 0.875221, 0.4101484, 1, 1, 1, 1, 1,
0.7919012, -1.281746, 5.006135, 1, 1, 1, 1, 1,
0.792608, 1.904575, 0.3447651, 1, 1, 1, 1, 1,
0.7960793, -1.229181, 3.268749, 1, 1, 1, 1, 1,
0.798866, 0.5105216, 1.443041, 1, 1, 1, 1, 1,
0.7996262, 0.8300035, 0.220671, 1, 1, 1, 1, 1,
0.8034725, -0.7012287, 0.6681535, 1, 1, 1, 1, 1,
0.8043451, -0.4208284, 1.767946, 1, 1, 1, 1, 1,
0.804378, 0.7425033, 0.5827494, 1, 1, 1, 1, 1,
0.8047413, -0.5448151, 1.522844, 1, 1, 1, 1, 1,
0.8054791, -0.6409929, 2.755925, 1, 1, 1, 1, 1,
0.8068045, -0.4509274, 2.486741, 1, 1, 1, 1, 1,
0.809917, 1.669828, 1.069502, 0, 0, 1, 1, 1,
0.8147447, -0.09241265, 0.3528213, 1, 0, 0, 1, 1,
0.817808, -0.1335242, 0.2902385, 1, 0, 0, 1, 1,
0.8197992, 0.6526122, 0.8040514, 1, 0, 0, 1, 1,
0.8210201, 0.5747795, -1.131658, 1, 0, 0, 1, 1,
0.8243721, -0.9767439, 3.409028, 1, 0, 0, 1, 1,
0.8250003, -0.9813088, 0.9753431, 0, 0, 0, 1, 1,
0.8254491, 2.00021, 1.356061, 0, 0, 0, 1, 1,
0.834221, -0.1537068, 1.65528, 0, 0, 0, 1, 1,
0.8393981, 1.064851, 1.654351, 0, 0, 0, 1, 1,
0.8400906, -1.198137, 2.413032, 0, 0, 0, 1, 1,
0.8417299, 0.7681851, 1.997352, 0, 0, 0, 1, 1,
0.8479178, 0.319325, 1.047141, 0, 0, 0, 1, 1,
0.8567406, 0.9419535, 0.8244948, 1, 1, 1, 1, 1,
0.8661451, 0.7487231, 2.411507, 1, 1, 1, 1, 1,
0.8704838, 0.9447531, 0.07665838, 1, 1, 1, 1, 1,
0.8748155, 0.3531058, 1.969496, 1, 1, 1, 1, 1,
0.8778481, -0.4063489, 2.98772, 1, 1, 1, 1, 1,
0.8865691, 1.667498, 1.476729, 1, 1, 1, 1, 1,
0.8878499, 0.569305, 3.108055, 1, 1, 1, 1, 1,
0.8896501, 1.610658, 1.500688, 1, 1, 1, 1, 1,
0.8909887, 0.262733, 2.08624, 1, 1, 1, 1, 1,
0.8934312, -0.8720302, 0.6818863, 1, 1, 1, 1, 1,
0.8976882, -1.159531, 3.34504, 1, 1, 1, 1, 1,
0.8977603, -1.022749, 5.825371, 1, 1, 1, 1, 1,
0.8980917, 1.132655, -0.836193, 1, 1, 1, 1, 1,
0.9007282, 0.6560379, -0.2497753, 1, 1, 1, 1, 1,
0.9036268, 0.6926017, 2.824183, 1, 1, 1, 1, 1,
0.9126388, 0.7508541, 1.020228, 0, 0, 1, 1, 1,
0.9127625, 0.3726505, 0.3923288, 1, 0, 0, 1, 1,
0.9179409, 1.546335, 1.22324, 1, 0, 0, 1, 1,
0.9203385, -0.1546423, 0.9416974, 1, 0, 0, 1, 1,
0.934074, -0.6073436, 3.516251, 1, 0, 0, 1, 1,
0.9382879, -1.010615, 1.957523, 1, 0, 0, 1, 1,
0.9384671, -0.1004382, 2.946856, 0, 0, 0, 1, 1,
0.9412125, -0.9053595, 0.8218647, 0, 0, 0, 1, 1,
0.945366, 2.326665, -0.1913608, 0, 0, 0, 1, 1,
0.9469774, 0.4491932, 2.807211, 0, 0, 0, 1, 1,
0.9481363, 0.7038686, 2.100635, 0, 0, 0, 1, 1,
0.9484439, 0.1840685, 3.81316, 0, 0, 0, 1, 1,
0.9485898, -0.6617094, 2.416961, 0, 0, 0, 1, 1,
0.9530042, 0.977137, 0.1210475, 1, 1, 1, 1, 1,
0.9580361, -0.8910847, 2.442009, 1, 1, 1, 1, 1,
0.9587961, 0.2318818, 0.8105989, 1, 1, 1, 1, 1,
0.9632151, 0.06286172, 1.921142, 1, 1, 1, 1, 1,
0.968023, -0.4951388, 3.697675, 1, 1, 1, 1, 1,
0.9681059, -1.259796, 1.667279, 1, 1, 1, 1, 1,
0.9701486, 0.4634705, 0.3185727, 1, 1, 1, 1, 1,
0.9725834, 1.866288, 1.264604, 1, 1, 1, 1, 1,
0.9745919, 1.589273, 2.502095, 1, 1, 1, 1, 1,
0.9777586, 0.855864, 1.215781, 1, 1, 1, 1, 1,
0.9812216, -0.5563985, 1.734257, 1, 1, 1, 1, 1,
0.9880474, 1.260853, 0.3058975, 1, 1, 1, 1, 1,
0.9889466, -0.2176327, 1.287572, 1, 1, 1, 1, 1,
0.9898649, -0.3073021, 2.612637, 1, 1, 1, 1, 1,
0.9992052, 0.2854925, 1.908243, 1, 1, 1, 1, 1,
1.015552, 2.844285, 0.07931317, 0, 0, 1, 1, 1,
1.016555, 0.9811434, -0.005687264, 1, 0, 0, 1, 1,
1.017659, -0.6431638, 3.690701, 1, 0, 0, 1, 1,
1.018943, -0.2142484, 1.15595, 1, 0, 0, 1, 1,
1.024604, -1.493069, 0.7632545, 1, 0, 0, 1, 1,
1.027077, -2.325859, 3.833456, 1, 0, 0, 1, 1,
1.027994, -1.129141, 3.465766, 0, 0, 0, 1, 1,
1.031299, 0.3162172, 0.5748124, 0, 0, 0, 1, 1,
1.053861, -0.1450921, 2.104195, 0, 0, 0, 1, 1,
1.055799, -1.736538, 3.132002, 0, 0, 0, 1, 1,
1.060621, 0.06405759, 2.049769, 0, 0, 0, 1, 1,
1.060906, 2.102999, 0.07133442, 0, 0, 0, 1, 1,
1.061799, 0.1391095, 2.628416, 0, 0, 0, 1, 1,
1.089193, -1.035739, 1.254318, 1, 1, 1, 1, 1,
1.089697, 1.126787, -0.1508919, 1, 1, 1, 1, 1,
1.095408, 0.04288128, 1.133538, 1, 1, 1, 1, 1,
1.095811, 1.476226, 0.558408, 1, 1, 1, 1, 1,
1.096906, 0.3548819, 1.727901, 1, 1, 1, 1, 1,
1.099391, -1.111613, 4.427624, 1, 1, 1, 1, 1,
1.110934, -0.1136201, -0.04548692, 1, 1, 1, 1, 1,
1.119173, 0.5916502, 1.822326, 1, 1, 1, 1, 1,
1.131932, 0.6000468, 0.1168052, 1, 1, 1, 1, 1,
1.133992, -0.1967577, 1.435724, 1, 1, 1, 1, 1,
1.138327, 0.2602457, 0.8445969, 1, 1, 1, 1, 1,
1.164478, -1.065625, 3.113575, 1, 1, 1, 1, 1,
1.168872, -0.7413864, 3.431025, 1, 1, 1, 1, 1,
1.180329, 2.190788, 2.139929, 1, 1, 1, 1, 1,
1.196856, 1.166227, 2.146243, 1, 1, 1, 1, 1,
1.198216, 0.00813183, 3.266054, 0, 0, 1, 1, 1,
1.204223, 0.5010489, 1.24828, 1, 0, 0, 1, 1,
1.217274, 0.1138399, 1.891932, 1, 0, 0, 1, 1,
1.221082, -0.6667526, 0.3621691, 1, 0, 0, 1, 1,
1.227522, -0.2494601, 1.934686, 1, 0, 0, 1, 1,
1.231049, 0.3428712, 1.241561, 1, 0, 0, 1, 1,
1.235086, 1.300784, 0.5829926, 0, 0, 0, 1, 1,
1.242619, -0.876793, 1.94095, 0, 0, 0, 1, 1,
1.25646, 0.7173844, 0.9082899, 0, 0, 0, 1, 1,
1.264231, 1.771023, 0.331947, 0, 0, 0, 1, 1,
1.264494, 1.441427, 2.172381, 0, 0, 0, 1, 1,
1.271087, 0.5042267, 1.790079, 0, 0, 0, 1, 1,
1.272194, -0.4641305, 0.3028581, 0, 0, 0, 1, 1,
1.274008, -0.4744414, 0.9218959, 1, 1, 1, 1, 1,
1.277871, -1.127695, 2.803568, 1, 1, 1, 1, 1,
1.292896, -1.625296, 3.3449, 1, 1, 1, 1, 1,
1.294501, 0.6369866, 1.960126, 1, 1, 1, 1, 1,
1.295207, -1.229106, 3.70331, 1, 1, 1, 1, 1,
1.307143, 0.4069857, 1.005981, 1, 1, 1, 1, 1,
1.312545, 1.634186, 0.7627134, 1, 1, 1, 1, 1,
1.316412, 0.6709844, -0.4346419, 1, 1, 1, 1, 1,
1.330371, -0.5929469, 1.424783, 1, 1, 1, 1, 1,
1.331974, 0.988484, 0.6892946, 1, 1, 1, 1, 1,
1.332465, 1.6374, -0.1816925, 1, 1, 1, 1, 1,
1.335352, 1.48287, -0.3117646, 1, 1, 1, 1, 1,
1.339369, 0.2517473, 1.767517, 1, 1, 1, 1, 1,
1.350546, -3.16518, 3.097905, 1, 1, 1, 1, 1,
1.351716, 1.078039, 0.3073403, 1, 1, 1, 1, 1,
1.355661, 0.3355287, 2.721835, 0, 0, 1, 1, 1,
1.367688, 1.018483, 1.078735, 1, 0, 0, 1, 1,
1.367785, -0.2631823, 2.813791, 1, 0, 0, 1, 1,
1.371913, -0.5799122, 2.567063, 1, 0, 0, 1, 1,
1.380155, -0.8289611, 2.202124, 1, 0, 0, 1, 1,
1.381507, -1.754507, 2.481025, 1, 0, 0, 1, 1,
1.385376, -1.88399, 2.385225, 0, 0, 0, 1, 1,
1.389414, 0.2356724, 0.8517735, 0, 0, 0, 1, 1,
1.392572, 0.7992086, 1.433786, 0, 0, 0, 1, 1,
1.393906, -0.9045351, 2.170302, 0, 0, 0, 1, 1,
1.416067, -0.5378342, 2.217857, 0, 0, 0, 1, 1,
1.41613, 0.1001281, 2.413715, 0, 0, 0, 1, 1,
1.418777, 0.03422048, 1.353225, 0, 0, 0, 1, 1,
1.439347, -1.449223, 3.338154, 1, 1, 1, 1, 1,
1.447076, -1.765221, 2.111095, 1, 1, 1, 1, 1,
1.449021, 0.2805237, 1.687438, 1, 1, 1, 1, 1,
1.452312, -0.2423394, 0.8971729, 1, 1, 1, 1, 1,
1.455153, 1.415951, 0.4168348, 1, 1, 1, 1, 1,
1.468186, -0.6475519, 3.216228, 1, 1, 1, 1, 1,
1.483606, 0.4457067, 1.399409, 1, 1, 1, 1, 1,
1.490436, 0.6159452, 2.669527, 1, 1, 1, 1, 1,
1.503349, 1.623987, 1.108259, 1, 1, 1, 1, 1,
1.506814, 0.1230903, 3.019245, 1, 1, 1, 1, 1,
1.524781, -0.2352977, 0.796176, 1, 1, 1, 1, 1,
1.54982, 0.01744033, 2.069461, 1, 1, 1, 1, 1,
1.583255, -1.911102, 1.217813, 1, 1, 1, 1, 1,
1.591498, 0.5413811, 0.6920515, 1, 1, 1, 1, 1,
1.631288, -0.2239145, 0.9250173, 1, 1, 1, 1, 1,
1.645279, -1.135801, 2.210169, 0, 0, 1, 1, 1,
1.660206, 1.564584, 1.001258, 1, 0, 0, 1, 1,
1.702884, 0.2282872, 0.5246197, 1, 0, 0, 1, 1,
1.734071, -0.2277841, 1.503189, 1, 0, 0, 1, 1,
1.769524, -0.5519312, 0.03336639, 1, 0, 0, 1, 1,
1.771757, 0.7953086, -0.3696757, 1, 0, 0, 1, 1,
1.781307, 2.241071, 0.4783265, 0, 0, 0, 1, 1,
1.788141, 0.1487211, 2.7544, 0, 0, 0, 1, 1,
1.792644, 2.164358, -0.8291981, 0, 0, 0, 1, 1,
1.806675, 1.363022, 1.829556, 0, 0, 0, 1, 1,
1.814065, -0.3904781, -0.2473777, 0, 0, 0, 1, 1,
1.817562, 0.4285372, 1.188389, 0, 0, 0, 1, 1,
1.836249, 0.4578942, 1.783897, 0, 0, 0, 1, 1,
1.871354, 0.6523558, 1.658064, 1, 1, 1, 1, 1,
1.898554, -0.5822822, 2.979754, 1, 1, 1, 1, 1,
1.903646, -1.642903, 1.884947, 1, 1, 1, 1, 1,
1.922038, -0.9401488, 2.613104, 1, 1, 1, 1, 1,
1.946733, 1.755759, 0.1536262, 1, 1, 1, 1, 1,
1.955974, -0.3243315, 0.5819227, 1, 1, 1, 1, 1,
1.956271, 0.852812, 3.06418, 1, 1, 1, 1, 1,
1.968938, 0.427004, 1.648747, 1, 1, 1, 1, 1,
2.018728, -0.09373961, 3.257616, 1, 1, 1, 1, 1,
2.043691, 0.7053242, 2.54812, 1, 1, 1, 1, 1,
2.070584, -0.8475766, 3.272455, 1, 1, 1, 1, 1,
2.08124, 0.4414556, 1.55134, 1, 1, 1, 1, 1,
2.125546, -0.5658606, 2.030092, 1, 1, 1, 1, 1,
2.146603, -0.475149, 2.592581, 1, 1, 1, 1, 1,
2.191499, -0.3207138, 2.63184, 1, 1, 1, 1, 1,
2.193073, 0.1906522, 0.1527879, 0, 0, 1, 1, 1,
2.223325, 0.7653801, 0.9179455, 1, 0, 0, 1, 1,
2.227628, -0.3048163, 1.820499, 1, 0, 0, 1, 1,
2.294045, -0.9352095, 1.913125, 1, 0, 0, 1, 1,
2.297894, -0.7162819, 0.6771833, 1, 0, 0, 1, 1,
2.301013, 0.9832998, -0.5584759, 1, 0, 0, 1, 1,
2.365422, 0.1566199, 2.146965, 0, 0, 0, 1, 1,
2.372914, 0.4704235, 1.158814, 0, 0, 0, 1, 1,
2.388596, 0.160512, 1.332114, 0, 0, 0, 1, 1,
2.396407, -0.7002416, 2.014257, 0, 0, 0, 1, 1,
2.44933, -0.3094473, 2.292665, 0, 0, 0, 1, 1,
2.465396, -1.33394, 1.557255, 0, 0, 0, 1, 1,
2.473808, 0.007957539, -0.6787057, 0, 0, 0, 1, 1,
2.528426, -0.4953634, 1.960575, 1, 1, 1, 1, 1,
2.534793, -0.0163607, 1.450164, 1, 1, 1, 1, 1,
2.551893, 0.3143605, 2.359034, 1, 1, 1, 1, 1,
2.68498, 0.5456507, 1.395828, 1, 1, 1, 1, 1,
2.719542, -0.6400762, 3.276307, 1, 1, 1, 1, 1,
2.75743, 1.506993, 0.8713409, 1, 1, 1, 1, 1,
2.910959, -2.429657, 3.512493, 1, 1, 1, 1, 1
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
var radius = 9.886631;
var distance = 34.72637;
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
mvMatrix.translate( 0.1400775, 0.1604472, -0.5639307 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72637);
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
