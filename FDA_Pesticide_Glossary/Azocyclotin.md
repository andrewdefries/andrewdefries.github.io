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
-2.992654, -0.3436882, -1.966802, 1, 0, 0, 1,
-2.983189, -1.339895, -2.322837, 1, 0.007843138, 0, 1,
-2.889646, -1.758932, -2.508677, 1, 0.01176471, 0, 1,
-2.760848, 0.772119, -1.333493, 1, 0.01960784, 0, 1,
-2.747192, -0.1719762, 0.4631188, 1, 0.02352941, 0, 1,
-2.730195, -1.066763, -2.87097, 1, 0.03137255, 0, 1,
-2.609018, 1.694118, -0.7868921, 1, 0.03529412, 0, 1,
-2.603928, -0.7721725, -1.263506, 1, 0.04313726, 0, 1,
-2.578117, 0.2964304, -0.1283689, 1, 0.04705882, 0, 1,
-2.493928, 0.01225557, -0.8231894, 1, 0.05490196, 0, 1,
-2.444864, 1.237109, -1.231245, 1, 0.05882353, 0, 1,
-2.401353, -0.4539487, -2.317452, 1, 0.06666667, 0, 1,
-2.325023, -0.7602046, -2.523929, 1, 0.07058824, 0, 1,
-2.321487, 0.3066958, -1.66637, 1, 0.07843138, 0, 1,
-2.318463, -0.3057553, -1.046181, 1, 0.08235294, 0, 1,
-2.283064, 0.5710313, -1.502298, 1, 0.09019608, 0, 1,
-2.244347, -0.01852788, -1.816387, 1, 0.09411765, 0, 1,
-2.178814, -0.03278985, -2.194119, 1, 0.1019608, 0, 1,
-2.166137, 2.061661, -2.016363, 1, 0.1098039, 0, 1,
-2.136309, -0.8115582, -2.607249, 1, 0.1137255, 0, 1,
-2.095716, -0.3542554, -0.4599422, 1, 0.1215686, 0, 1,
-2.092288, 0.2739408, -2.325551, 1, 0.1254902, 0, 1,
-2.082103, -0.6449423, -1.374073, 1, 0.1333333, 0, 1,
-1.996327, -0.2373877, -1.854788, 1, 0.1372549, 0, 1,
-1.986815, -1.385625, -2.713702, 1, 0.145098, 0, 1,
-1.985625, 1.187197, 0.006969104, 1, 0.1490196, 0, 1,
-1.977816, -0.1178439, -2.42154, 1, 0.1568628, 0, 1,
-1.976591, 0.4666091, -3.978731, 1, 0.1607843, 0, 1,
-1.969263, -1.642266, -0.9166327, 1, 0.1686275, 0, 1,
-1.967695, 0.9585919, 0.05380591, 1, 0.172549, 0, 1,
-1.927743, -0.611775, -1.76087, 1, 0.1803922, 0, 1,
-1.90319, 0.3353359, -0.367889, 1, 0.1843137, 0, 1,
-1.831426, 0.3106205, -0.8208123, 1, 0.1921569, 0, 1,
-1.82075, -0.8757505, -0.6413746, 1, 0.1960784, 0, 1,
-1.814133, 0.5239639, -1.959054, 1, 0.2039216, 0, 1,
-1.793398, 0.2086163, -2.752347, 1, 0.2117647, 0, 1,
-1.784135, -1.412852, -3.250917, 1, 0.2156863, 0, 1,
-1.77457, -1.646342, -1.843524, 1, 0.2235294, 0, 1,
-1.759988, 1.199817, 0.4423312, 1, 0.227451, 0, 1,
-1.727158, -1.294264, -3.650043, 1, 0.2352941, 0, 1,
-1.725551, -0.865843, -1.900121, 1, 0.2392157, 0, 1,
-1.717261, 0.4456, -1.291897, 1, 0.2470588, 0, 1,
-1.708797, -1.160341, -1.678798, 1, 0.2509804, 0, 1,
-1.699032, -0.328089, -3.255304, 1, 0.2588235, 0, 1,
-1.682985, 0.3822416, -0.6675386, 1, 0.2627451, 0, 1,
-1.675309, -0.4614562, -2.572777, 1, 0.2705882, 0, 1,
-1.67189, 0.5822701, -0.3223011, 1, 0.2745098, 0, 1,
-1.667058, -1.463198, -1.297128, 1, 0.282353, 0, 1,
-1.665774, -0.4904399, -1.847824, 1, 0.2862745, 0, 1,
-1.665047, -0.9133901, -1.311267, 1, 0.2941177, 0, 1,
-1.661077, -1.380433, -1.862538, 1, 0.3019608, 0, 1,
-1.647789, 0.1519853, -2.234509, 1, 0.3058824, 0, 1,
-1.640468, -0.05342963, -0.1403373, 1, 0.3137255, 0, 1,
-1.639599, 1.949877, -2.306785, 1, 0.3176471, 0, 1,
-1.597422, -0.2432155, -0.4351548, 1, 0.3254902, 0, 1,
-1.575231, -0.6168186, -3.310412, 1, 0.3294118, 0, 1,
-1.551993, -1.074229, -3.284204, 1, 0.3372549, 0, 1,
-1.542964, 1.728833, -1.030654, 1, 0.3411765, 0, 1,
-1.541165, 1.359284, 0.7564873, 1, 0.3490196, 0, 1,
-1.527036, -1.587239, -0.6086249, 1, 0.3529412, 0, 1,
-1.507532, -1.891065, -2.335485, 1, 0.3607843, 0, 1,
-1.50423, 0.5716903, -2.829201, 1, 0.3647059, 0, 1,
-1.500055, -0.3668946, 0.8295949, 1, 0.372549, 0, 1,
-1.473538, 0.5644856, -0.2447809, 1, 0.3764706, 0, 1,
-1.472689, -0.5008006, -1.402496, 1, 0.3843137, 0, 1,
-1.469316, 0.9444354, -0.194793, 1, 0.3882353, 0, 1,
-1.460191, -0.02331066, -1.192099, 1, 0.3960784, 0, 1,
-1.451981, 1.040381, -3.00736, 1, 0.4039216, 0, 1,
-1.446054, 0.04744179, -0.5699846, 1, 0.4078431, 0, 1,
-1.429087, 0.474507, -0.9549407, 1, 0.4156863, 0, 1,
-1.417878, -0.9997457, -3.547967, 1, 0.4196078, 0, 1,
-1.416478, 0.3705965, -4.812413, 1, 0.427451, 0, 1,
-1.412409, -0.9918478, -2.229162, 1, 0.4313726, 0, 1,
-1.412099, -0.3501359, -0.9101735, 1, 0.4392157, 0, 1,
-1.395353, -1.086513, -1.373991, 1, 0.4431373, 0, 1,
-1.392007, -0.5737275, -0.3013168, 1, 0.4509804, 0, 1,
-1.381087, 1.100792, -0.4605091, 1, 0.454902, 0, 1,
-1.372209, 1.56274, -0.06841029, 1, 0.4627451, 0, 1,
-1.357724, 0.6800052, -1.510163, 1, 0.4666667, 0, 1,
-1.350151, 0.6021703, -2.095695, 1, 0.4745098, 0, 1,
-1.343188, 0.3659565, -3.505238, 1, 0.4784314, 0, 1,
-1.337837, -0.4273439, -2.44821, 1, 0.4862745, 0, 1,
-1.324829, -0.2704166, -1.909138, 1, 0.4901961, 0, 1,
-1.324107, 0.5072354, -0.6362359, 1, 0.4980392, 0, 1,
-1.319008, -0.9944069, -1.40984, 1, 0.5058824, 0, 1,
-1.311401, 0.3113077, -1.449033, 1, 0.509804, 0, 1,
-1.30837, -0.6162758, -1.570554, 1, 0.5176471, 0, 1,
-1.307394, -0.7366118, -1.572693, 1, 0.5215687, 0, 1,
-1.304141, -1.284246, -2.688924, 1, 0.5294118, 0, 1,
-1.2959, -0.5045335, -1.422541, 1, 0.5333334, 0, 1,
-1.286821, -0.2484847, -1.289147, 1, 0.5411765, 0, 1,
-1.281624, 0.2251835, -1.341657, 1, 0.5450981, 0, 1,
-1.280443, 1.296492, -1.088258, 1, 0.5529412, 0, 1,
-1.278262, 0.8207272, -0.6673805, 1, 0.5568628, 0, 1,
-1.269956, 0.4023268, -1.180967, 1, 0.5647059, 0, 1,
-1.267971, -1.092837, -2.673146, 1, 0.5686275, 0, 1,
-1.266193, 0.8317347, -0.3770534, 1, 0.5764706, 0, 1,
-1.256834, -0.610961, -2.547084, 1, 0.5803922, 0, 1,
-1.256291, 0.9279175, -0.8924644, 1, 0.5882353, 0, 1,
-1.249661, 0.6412814, -2.101973, 1, 0.5921569, 0, 1,
-1.241906, 1.024687, -0.4212869, 1, 0.6, 0, 1,
-1.239098, 2.504979, 0.173694, 1, 0.6078432, 0, 1,
-1.230971, -1.264708, -2.533631, 1, 0.6117647, 0, 1,
-1.224864, -0.2827963, -1.250769, 1, 0.6196079, 0, 1,
-1.224531, 1.871188, 0.1865017, 1, 0.6235294, 0, 1,
-1.212569, 1.384037, -0.6884821, 1, 0.6313726, 0, 1,
-1.209783, 1.417613, -0.4515308, 1, 0.6352941, 0, 1,
-1.204854, -0.9605082, -1.930528, 1, 0.6431373, 0, 1,
-1.203062, 0.1101539, -1.557034, 1, 0.6470588, 0, 1,
-1.192128, -1.083626, -0.2882272, 1, 0.654902, 0, 1,
-1.188118, -0.4866326, -0.7320078, 1, 0.6588235, 0, 1,
-1.184506, -0.6584383, -1.419485, 1, 0.6666667, 0, 1,
-1.183094, 1.179842, -2.508459, 1, 0.6705883, 0, 1,
-1.181752, -0.9687879, -2.29582, 1, 0.6784314, 0, 1,
-1.176486, 0.7498014, -1.100025, 1, 0.682353, 0, 1,
-1.173121, -0.1612068, -2.978225, 1, 0.6901961, 0, 1,
-1.171713, -0.009619597, -3.24783, 1, 0.6941177, 0, 1,
-1.165641, 0.6826857, -1.346832, 1, 0.7019608, 0, 1,
-1.152229, 0.03401179, -0.9502752, 1, 0.7098039, 0, 1,
-1.149732, -2.306577, -2.204452, 1, 0.7137255, 0, 1,
-1.13931, 0.9469465, -1.278096, 1, 0.7215686, 0, 1,
-1.13832, 0.5636238, -2.107398, 1, 0.7254902, 0, 1,
-1.13516, 0.797437, -0.9701976, 1, 0.7333333, 0, 1,
-1.131301, -1.041807, -4.02472, 1, 0.7372549, 0, 1,
-1.120137, 1.227726, -1.668224, 1, 0.7450981, 0, 1,
-1.117395, 0.6285222, 0.5362932, 1, 0.7490196, 0, 1,
-1.117044, 0.3339036, 0.1772702, 1, 0.7568628, 0, 1,
-1.105957, -1.594951, -4.335063, 1, 0.7607843, 0, 1,
-1.099463, -0.4165039, -1.198856, 1, 0.7686275, 0, 1,
-1.091216, -0.4725274, -1.951883, 1, 0.772549, 0, 1,
-1.088241, 1.136321, -0.1412544, 1, 0.7803922, 0, 1,
-1.071031, -1.198957, -3.09261, 1, 0.7843137, 0, 1,
-1.064205, 1.622372, -0.4858602, 1, 0.7921569, 0, 1,
-1.061319, -1.520625, -2.883229, 1, 0.7960784, 0, 1,
-1.05967, 0.7017136, -0.5163623, 1, 0.8039216, 0, 1,
-1.048382, -0.3909233, -2.258563, 1, 0.8117647, 0, 1,
-1.046108, -0.2181694, -2.164138, 1, 0.8156863, 0, 1,
-1.038588, 1.185343, 0.7518623, 1, 0.8235294, 0, 1,
-1.038236, 1.041371, -0.05295014, 1, 0.827451, 0, 1,
-1.03016, 0.7633267, 1.151585, 1, 0.8352941, 0, 1,
-1.028806, -0.5410361, -2.742402, 1, 0.8392157, 0, 1,
-1.028638, 0.1628525, -0.9207026, 1, 0.8470588, 0, 1,
-1.026339, -1.021061, -0.9981174, 1, 0.8509804, 0, 1,
-1.024219, -0.080735, -1.480323, 1, 0.8588235, 0, 1,
-1.023548, 0.9666317, -0.4354998, 1, 0.8627451, 0, 1,
-1.019142, 3.136932, -0.2607306, 1, 0.8705882, 0, 1,
-1.011943, -1.135567, -2.471684, 1, 0.8745098, 0, 1,
-1.011344, 1.277878, -2.262236, 1, 0.8823529, 0, 1,
-1.011103, 1.509825, -0.3569592, 1, 0.8862745, 0, 1,
-1.010584, -0.03557306, -2.524442, 1, 0.8941177, 0, 1,
-0.998262, -0.3524664, -0.4437734, 1, 0.8980392, 0, 1,
-0.9967827, 1.062268, 0.01530938, 1, 0.9058824, 0, 1,
-0.9899201, 0.5483471, 1.722501, 1, 0.9137255, 0, 1,
-0.9789895, -1.059091, -1.709984, 1, 0.9176471, 0, 1,
-0.975411, 1.971385, 0.5941833, 1, 0.9254902, 0, 1,
-0.9753156, -0.4316131, -2.499064, 1, 0.9294118, 0, 1,
-0.9748283, -1.900404, -3.42942, 1, 0.9372549, 0, 1,
-0.9736139, 1.104269, -0.6731082, 1, 0.9411765, 0, 1,
-0.9700173, -0.119618, -2.278542, 1, 0.9490196, 0, 1,
-0.9678695, -1.393105, -1.91317, 1, 0.9529412, 0, 1,
-0.9633465, -1.255238, -1.795122, 1, 0.9607843, 0, 1,
-0.9616582, -0.2077814, -2.899368, 1, 0.9647059, 0, 1,
-0.959279, 0.1382052, -1.029971, 1, 0.972549, 0, 1,
-0.9544289, 0.0161169, -2.095316, 1, 0.9764706, 0, 1,
-0.950524, -1.927944, -2.888227, 1, 0.9843137, 0, 1,
-0.9494308, -2.134889, -2.077115, 1, 0.9882353, 0, 1,
-0.9475523, -0.1729383, -3.179584, 1, 0.9960784, 0, 1,
-0.9438431, 0.04671735, 0.2630738, 0.9960784, 1, 0, 1,
-0.9405999, 0.23511, 0.9723428, 0.9921569, 1, 0, 1,
-0.9393889, -0.2782239, -0.1930906, 0.9843137, 1, 0, 1,
-0.9367726, -1.53368, -3.254831, 0.9803922, 1, 0, 1,
-0.9363206, -0.2478322, -0.5323174, 0.972549, 1, 0, 1,
-0.9310085, 1.090485, -0.08473791, 0.9686275, 1, 0, 1,
-0.9282927, -0.8681996, -2.818338, 0.9607843, 1, 0, 1,
-0.9239301, 1.575165, -0.9455449, 0.9568627, 1, 0, 1,
-0.920266, 0.6689397, -0.2977011, 0.9490196, 1, 0, 1,
-0.9163949, 0.2969074, -2.299287, 0.945098, 1, 0, 1,
-0.9068348, 0.1107206, -2.821347, 0.9372549, 1, 0, 1,
-0.9002495, -1.970884, -1.847613, 0.9333333, 1, 0, 1,
-0.8992836, 1.623229, 0.2492866, 0.9254902, 1, 0, 1,
-0.8899503, 0.4828074, -1.330492, 0.9215686, 1, 0, 1,
-0.8805048, -0.9493173, -2.953021, 0.9137255, 1, 0, 1,
-0.8802065, -0.3447373, -1.561229, 0.9098039, 1, 0, 1,
-0.878138, -0.1144156, -0.311098, 0.9019608, 1, 0, 1,
-0.8739766, -1.061043, -1.842579, 0.8941177, 1, 0, 1,
-0.8684325, -0.9595314, -2.968575, 0.8901961, 1, 0, 1,
-0.8678157, -0.3986695, 0.09778773, 0.8823529, 1, 0, 1,
-0.8677781, 0.539849, -1.200163, 0.8784314, 1, 0, 1,
-0.8666276, 1.277756, -1.724989, 0.8705882, 1, 0, 1,
-0.8665144, 1.060265, -1.838522, 0.8666667, 1, 0, 1,
-0.8635021, -0.5501742, -1.713912, 0.8588235, 1, 0, 1,
-0.8623694, 1.132818, -0.3982979, 0.854902, 1, 0, 1,
-0.8557117, -1.444511, -2.484854, 0.8470588, 1, 0, 1,
-0.8487425, 0.2685752, -0.6220281, 0.8431373, 1, 0, 1,
-0.847257, 0.3433616, -2.071873, 0.8352941, 1, 0, 1,
-0.8369161, 0.9796456, -2.620961, 0.8313726, 1, 0, 1,
-0.8353851, 2.489317, 0.428746, 0.8235294, 1, 0, 1,
-0.8326579, 1.757104, 1.157803, 0.8196079, 1, 0, 1,
-0.8312129, 0.5446719, 0.602809, 0.8117647, 1, 0, 1,
-0.8272894, -0.8904232, -3.05595, 0.8078431, 1, 0, 1,
-0.8237581, 1.725406, -0.8511819, 0.8, 1, 0, 1,
-0.8178819, -1.403674, -2.146073, 0.7921569, 1, 0, 1,
-0.8087758, 0.5365823, -0.5908245, 0.7882353, 1, 0, 1,
-0.8087463, 0.2175381, -1.330973, 0.7803922, 1, 0, 1,
-0.8051128, -0.8360077, -3.50896, 0.7764706, 1, 0, 1,
-0.8036737, 1.034985, -0.6351823, 0.7686275, 1, 0, 1,
-0.7984922, -0.4093701, -3.839093, 0.7647059, 1, 0, 1,
-0.7955054, -0.2441005, -1.759906, 0.7568628, 1, 0, 1,
-0.7896553, 0.2079911, -0.3552895, 0.7529412, 1, 0, 1,
-0.7836656, -0.4196196, -3.185038, 0.7450981, 1, 0, 1,
-0.7770203, 0.1420277, -0.301145, 0.7411765, 1, 0, 1,
-0.7764427, -2.047599, -0.9559534, 0.7333333, 1, 0, 1,
-0.7759063, -0.6786638, -1.253492, 0.7294118, 1, 0, 1,
-0.7757261, 1.182879, -1.240336, 0.7215686, 1, 0, 1,
-0.7727509, 0.1748145, -1.091634, 0.7176471, 1, 0, 1,
-0.7714756, 1.826525, -1.316647, 0.7098039, 1, 0, 1,
-0.7692829, -1.619265, -3.599867, 0.7058824, 1, 0, 1,
-0.7678782, -1.981995, -2.988428, 0.6980392, 1, 0, 1,
-0.7651605, -1.918678, -1.555946, 0.6901961, 1, 0, 1,
-0.7646863, -0.2047711, -4.420738, 0.6862745, 1, 0, 1,
-0.7628194, 0.8751073, -0.1166567, 0.6784314, 1, 0, 1,
-0.757318, -0.4220842, -1.773652, 0.6745098, 1, 0, 1,
-0.7537, 0.1217378, -1.020215, 0.6666667, 1, 0, 1,
-0.7459053, 1.058816, 0.5748205, 0.6627451, 1, 0, 1,
-0.7409094, -0.1109776, -1.990108, 0.654902, 1, 0, 1,
-0.737901, -0.7689368, -2.870567, 0.6509804, 1, 0, 1,
-0.7370655, -0.02626061, 1.236207, 0.6431373, 1, 0, 1,
-0.7339175, -0.8434012, -3.485109, 0.6392157, 1, 0, 1,
-0.7253118, -0.02781715, -2.707646, 0.6313726, 1, 0, 1,
-0.7243612, 0.5948122, -0.1181444, 0.627451, 1, 0, 1,
-0.7211159, 0.8312649, -2.872344, 0.6196079, 1, 0, 1,
-0.7193927, 0.5216807, -1.114572, 0.6156863, 1, 0, 1,
-0.7146772, -0.05521514, -1.860559, 0.6078432, 1, 0, 1,
-0.7118028, -1.5702, -4.519821, 0.6039216, 1, 0, 1,
-0.7091545, 1.324188, 0.6434925, 0.5960785, 1, 0, 1,
-0.7066496, -0.2816791, -2.790627, 0.5882353, 1, 0, 1,
-0.7052316, 0.6391371, -0.2452419, 0.5843138, 1, 0, 1,
-0.7049885, -1.887572, -2.326992, 0.5764706, 1, 0, 1,
-0.6998664, -0.3679017, -1.692333, 0.572549, 1, 0, 1,
-0.6990746, -0.4491189, -4.210204, 0.5647059, 1, 0, 1,
-0.6918642, 0.4816923, -1.013982, 0.5607843, 1, 0, 1,
-0.6859452, -0.6629982, -2.343132, 0.5529412, 1, 0, 1,
-0.685289, 0.08133844, -2.977288, 0.5490196, 1, 0, 1,
-0.6805129, 0.0209957, 0.07079775, 0.5411765, 1, 0, 1,
-0.6741921, -1.048421, -1.543146, 0.5372549, 1, 0, 1,
-0.6737462, 1.789758, -1.413575, 0.5294118, 1, 0, 1,
-0.6697239, 0.7347196, -0.9878486, 0.5254902, 1, 0, 1,
-0.6681854, -1.081688, -1.919173, 0.5176471, 1, 0, 1,
-0.6610878, -0.5799928, -0.8902872, 0.5137255, 1, 0, 1,
-0.6604185, -0.1532965, -1.283582, 0.5058824, 1, 0, 1,
-0.6590969, -0.7795461, -1.135244, 0.5019608, 1, 0, 1,
-0.6547766, 0.3671498, 0.1662468, 0.4941176, 1, 0, 1,
-0.6539592, 1.341618, -1.674453, 0.4862745, 1, 0, 1,
-0.6511185, -0.3927989, -0.8104333, 0.4823529, 1, 0, 1,
-0.6472333, -0.4048671, -1.435769, 0.4745098, 1, 0, 1,
-0.6398193, -1.072426, -1.842822, 0.4705882, 1, 0, 1,
-0.638285, -0.3818288, -2.281929, 0.4627451, 1, 0, 1,
-0.6372582, -0.8575249, -1.656623, 0.4588235, 1, 0, 1,
-0.6372094, -0.146882, 0.1721925, 0.4509804, 1, 0, 1,
-0.6339788, -1.380747, -2.379324, 0.4470588, 1, 0, 1,
-0.6281915, -0.02511066, -2.031328, 0.4392157, 1, 0, 1,
-0.6272784, -1.551331, -3.666011, 0.4352941, 1, 0, 1,
-0.6215508, -0.9808039, -1.619184, 0.427451, 1, 0, 1,
-0.6206903, -0.4144757, -0.5705004, 0.4235294, 1, 0, 1,
-0.6160895, 0.1193855, -1.999117, 0.4156863, 1, 0, 1,
-0.6140099, -1.314787, -3.50491, 0.4117647, 1, 0, 1,
-0.6127623, -1.264575, -1.857412, 0.4039216, 1, 0, 1,
-0.6103789, -1.02655, -2.003573, 0.3960784, 1, 0, 1,
-0.6056593, -1.331016, -3.230064, 0.3921569, 1, 0, 1,
-0.6043144, 0.3349265, -3.40874, 0.3843137, 1, 0, 1,
-0.5990774, 1.38379, -1.431036, 0.3803922, 1, 0, 1,
-0.5818775, 0.3255253, -2.417877, 0.372549, 1, 0, 1,
-0.5788273, 0.3249729, -0.759537, 0.3686275, 1, 0, 1,
-0.5774345, -0.7044459, -1.756322, 0.3607843, 1, 0, 1,
-0.5772154, 0.1952898, -1.420029, 0.3568628, 1, 0, 1,
-0.5667921, 0.1953129, -3.000404, 0.3490196, 1, 0, 1,
-0.5534691, 0.3434628, -2.803213, 0.345098, 1, 0, 1,
-0.551764, -1.125893, -2.477823, 0.3372549, 1, 0, 1,
-0.5503566, -0.460605, -0.7065468, 0.3333333, 1, 0, 1,
-0.5495543, -1.098743, -2.13162, 0.3254902, 1, 0, 1,
-0.5492405, -0.7881061, -2.40805, 0.3215686, 1, 0, 1,
-0.5416103, 1.228934, -0.2914644, 0.3137255, 1, 0, 1,
-0.5379831, 0.3667003, -1.331121, 0.3098039, 1, 0, 1,
-0.5337538, 0.5008639, -1.137075, 0.3019608, 1, 0, 1,
-0.526054, -0.4932169, -2.54535, 0.2941177, 1, 0, 1,
-0.5247645, -1.146182, -3.049842, 0.2901961, 1, 0, 1,
-0.5191459, 0.1343084, -1.119947, 0.282353, 1, 0, 1,
-0.5175691, -1.147834, 0.2782564, 0.2784314, 1, 0, 1,
-0.5131574, 0.06956017, -1.831789, 0.2705882, 1, 0, 1,
-0.5121364, 0.1698846, -1.187409, 0.2666667, 1, 0, 1,
-0.50801, 0.042325, -2.43061, 0.2588235, 1, 0, 1,
-0.5036346, 0.1212097, -0.23176, 0.254902, 1, 0, 1,
-0.5016637, 0.9207531, -0.2238819, 0.2470588, 1, 0, 1,
-0.4931902, -0.6120412, -1.546017, 0.2431373, 1, 0, 1,
-0.4920808, -2.720618, -1.919146, 0.2352941, 1, 0, 1,
-0.4847822, -0.2691984, -2.916, 0.2313726, 1, 0, 1,
-0.48322, -1.056311, -1.33351, 0.2235294, 1, 0, 1,
-0.4758777, 0.7535334, 0.08354943, 0.2196078, 1, 0, 1,
-0.4753395, -0.2164565, -3.034914, 0.2117647, 1, 0, 1,
-0.4739876, -0.546684, -2.102586, 0.2078431, 1, 0, 1,
-0.4718074, 1.1183, 0.07336467, 0.2, 1, 0, 1,
-0.4698768, -0.7931324, -4.282472, 0.1921569, 1, 0, 1,
-0.4685835, -1.477067, -2.665634, 0.1882353, 1, 0, 1,
-0.4635766, 0.5792948, -1.400973, 0.1803922, 1, 0, 1,
-0.4634905, -2.035097, -4.350715, 0.1764706, 1, 0, 1,
-0.4617625, -0.8675398, -3.690835, 0.1686275, 1, 0, 1,
-0.4602282, -0.8814995, -1.232427, 0.1647059, 1, 0, 1,
-0.4592769, 0.7671398, -2.303541, 0.1568628, 1, 0, 1,
-0.4543996, 1.323342, -0.992931, 0.1529412, 1, 0, 1,
-0.4524797, -0.5758468, -3.662164, 0.145098, 1, 0, 1,
-0.443415, -0.27942, -1.459612, 0.1411765, 1, 0, 1,
-0.4431464, -1.011461, -1.894982, 0.1333333, 1, 0, 1,
-0.4428213, 1.692153, 0.1779117, 0.1294118, 1, 0, 1,
-0.4418554, 0.1452839, -0.4013401, 0.1215686, 1, 0, 1,
-0.4358776, -0.6251701, -2.328855, 0.1176471, 1, 0, 1,
-0.4315265, -1.048151, -2.337908, 0.1098039, 1, 0, 1,
-0.4250361, 0.5214015, -1.141567, 0.1058824, 1, 0, 1,
-0.4214025, 0.9142394, -0.4112917, 0.09803922, 1, 0, 1,
-0.4201413, -1.010274, -4.347795, 0.09019608, 1, 0, 1,
-0.4166631, 0.9148601, -0.09862762, 0.08627451, 1, 0, 1,
-0.4136972, -0.04933752, -1.191558, 0.07843138, 1, 0, 1,
-0.4118767, -0.9284301, -2.30533, 0.07450981, 1, 0, 1,
-0.4105951, 0.7179068, -1.080135, 0.06666667, 1, 0, 1,
-0.408212, 0.5565836, 1.033598, 0.0627451, 1, 0, 1,
-0.4071118, 2.101966, -0.4266438, 0.05490196, 1, 0, 1,
-0.3986895, 0.9204218, -0.5014801, 0.05098039, 1, 0, 1,
-0.3982016, -1.571316, -4.076475, 0.04313726, 1, 0, 1,
-0.3978401, -0.2489891, -3.45077, 0.03921569, 1, 0, 1,
-0.3970197, 1.528726, -0.8944997, 0.03137255, 1, 0, 1,
-0.3964104, 0.2014546, -0.8202653, 0.02745098, 1, 0, 1,
-0.3947346, -0.853762, -3.213875, 0.01960784, 1, 0, 1,
-0.3827414, 1.102781, 0.1435388, 0.01568628, 1, 0, 1,
-0.3807693, 0.2472063, -0.3175244, 0.007843138, 1, 0, 1,
-0.3786159, -0.9139737, -0.9273635, 0.003921569, 1, 0, 1,
-0.3784945, 1.922359, -0.5278388, 0, 1, 0.003921569, 1,
-0.3754759, 1.669329, -1.078489, 0, 1, 0.01176471, 1,
-0.3745937, -0.4037226, -3.106997, 0, 1, 0.01568628, 1,
-0.3743902, -0.8411958, -3.1045, 0, 1, 0.02352941, 1,
-0.3690118, -1.056353, -2.756663, 0, 1, 0.02745098, 1,
-0.3618615, -1.857514, -2.422175, 0, 1, 0.03529412, 1,
-0.3593356, 0.917841, -0.1177105, 0, 1, 0.03921569, 1,
-0.3427734, 0.085455, -1.361404, 0, 1, 0.04705882, 1,
-0.3361962, -0.9112859, -3.70774, 0, 1, 0.05098039, 1,
-0.3336879, -1.361842, -3.396189, 0, 1, 0.05882353, 1,
-0.331008, 1.00411, -1.074386, 0, 1, 0.0627451, 1,
-0.3309621, 1.423794, 1.326297, 0, 1, 0.07058824, 1,
-0.3306418, 1.633929, 1.005128, 0, 1, 0.07450981, 1,
-0.3280533, -0.5982528, -1.593386, 0, 1, 0.08235294, 1,
-0.3280179, -0.8609117, -2.382591, 0, 1, 0.08627451, 1,
-0.3255445, 2.95101, 0.1029491, 0, 1, 0.09411765, 1,
-0.3216315, 0.3537648, 1.218127, 0, 1, 0.1019608, 1,
-0.3171017, 0.08806149, -0.03993555, 0, 1, 0.1058824, 1,
-0.3158422, -0.1413013, -1.768323, 0, 1, 0.1137255, 1,
-0.3157324, 0.571717, -0.8773841, 0, 1, 0.1176471, 1,
-0.3156857, -1.276577, -1.840726, 0, 1, 0.1254902, 1,
-0.3027436, 2.488737, -0.3535202, 0, 1, 0.1294118, 1,
-0.3006626, 2.055521, -0.03641035, 0, 1, 0.1372549, 1,
-0.2908732, 2.269399, 0.6951159, 0, 1, 0.1411765, 1,
-0.2820163, 0.2907799, -1.66153, 0, 1, 0.1490196, 1,
-0.2796435, 0.2904333, -0.2674236, 0, 1, 0.1529412, 1,
-0.2781729, -2.429049, -2.58488, 0, 1, 0.1607843, 1,
-0.2735734, -1.653852, -1.767596, 0, 1, 0.1647059, 1,
-0.2732627, 0.7646499, -0.847689, 0, 1, 0.172549, 1,
-0.2632912, 0.4937265, -1.118253, 0, 1, 0.1764706, 1,
-0.2631258, -0.5038915, -0.4998839, 0, 1, 0.1843137, 1,
-0.2573678, -0.6636609, -1.561756, 0, 1, 0.1882353, 1,
-0.255301, -1.375182, -2.359622, 0, 1, 0.1960784, 1,
-0.2537037, -0.6423244, -1.644455, 0, 1, 0.2039216, 1,
-0.2513864, 1.025066, -1.144553, 0, 1, 0.2078431, 1,
-0.2452254, 0.1712475, -0.8053184, 0, 1, 0.2156863, 1,
-0.245198, 1.36228, -1.858538, 0, 1, 0.2196078, 1,
-0.2428471, -0.4808323, -0.2202302, 0, 1, 0.227451, 1,
-0.2422004, 0.5957488, 0.6335713, 0, 1, 0.2313726, 1,
-0.2419805, 1.380894, 1.566328, 0, 1, 0.2392157, 1,
-0.2407389, 0.6966601, -1.248159, 0, 1, 0.2431373, 1,
-0.2387464, -0.941645, -0.8132059, 0, 1, 0.2509804, 1,
-0.2386796, -0.02875283, -1.940278, 0, 1, 0.254902, 1,
-0.2343275, -0.1844967, -2.24197, 0, 1, 0.2627451, 1,
-0.2341033, 0.605135, 0.4821846, 0, 1, 0.2666667, 1,
-0.2308883, 0.03484336, -1.130223, 0, 1, 0.2745098, 1,
-0.2307477, -0.4764755, -3.247868, 0, 1, 0.2784314, 1,
-0.2286682, 0.3746641, -0.3279001, 0, 1, 0.2862745, 1,
-0.2237031, -0.5362245, -0.6192123, 0, 1, 0.2901961, 1,
-0.2165678, 0.02355943, -2.787402, 0, 1, 0.2980392, 1,
-0.2159559, -1.713294, -3.199644, 0, 1, 0.3058824, 1,
-0.2158286, 0.2388379, -1.643157, 0, 1, 0.3098039, 1,
-0.2142927, 0.4694627, -3.121051, 0, 1, 0.3176471, 1,
-0.2108931, -0.3695898, -2.058183, 0, 1, 0.3215686, 1,
-0.2103691, 0.7413328, -2.534422, 0, 1, 0.3294118, 1,
-0.2064941, -1.259075, -4.046825, 0, 1, 0.3333333, 1,
-0.2049687, -0.862078, -4.235603, 0, 1, 0.3411765, 1,
-0.2029208, -0.07271449, -1.516765, 0, 1, 0.345098, 1,
-0.1994224, -0.2591286, -2.196743, 0, 1, 0.3529412, 1,
-0.1984467, 0.8661186, 0.9784434, 0, 1, 0.3568628, 1,
-0.1978593, -0.5665947, -2.600444, 0, 1, 0.3647059, 1,
-0.1971143, 0.5329705, 2.391755, 0, 1, 0.3686275, 1,
-0.1965589, -0.1649939, -3.013646, 0, 1, 0.3764706, 1,
-0.1944338, 0.2572452, -1.820706, 0, 1, 0.3803922, 1,
-0.1935127, 1.493149, -0.2631125, 0, 1, 0.3882353, 1,
-0.1927279, 0.4907445, -1.159688, 0, 1, 0.3921569, 1,
-0.1926965, -0.9625689, -2.723819, 0, 1, 0.4, 1,
-0.1895038, -0.4394588, -2.92671, 0, 1, 0.4078431, 1,
-0.1894812, -1.390761, -1.237521, 0, 1, 0.4117647, 1,
-0.1848658, -1.443843, -5.186123, 0, 1, 0.4196078, 1,
-0.184141, -0.4405446, -4.270399, 0, 1, 0.4235294, 1,
-0.1836741, -0.2914864, -1.031178, 0, 1, 0.4313726, 1,
-0.1787622, 1.41745, -0.2651884, 0, 1, 0.4352941, 1,
-0.1785555, -0.8272318, -2.54606, 0, 1, 0.4431373, 1,
-0.1763226, -0.7167222, -3.980872, 0, 1, 0.4470588, 1,
-0.176153, 0.9677343, -0.1158587, 0, 1, 0.454902, 1,
-0.1691757, -0.04526967, -1.862255, 0, 1, 0.4588235, 1,
-0.1649564, -1.677948, -3.650948, 0, 1, 0.4666667, 1,
-0.1631357, 0.108511, -0.9176036, 0, 1, 0.4705882, 1,
-0.1588265, 0.530099, -0.9002369, 0, 1, 0.4784314, 1,
-0.1566207, -0.174309, -3.292274, 0, 1, 0.4823529, 1,
-0.1530265, 0.58216, -2.474024, 0, 1, 0.4901961, 1,
-0.1472232, 0.4267195, -0.3974797, 0, 1, 0.4941176, 1,
-0.1445096, 0.6283821, -0.6373255, 0, 1, 0.5019608, 1,
-0.1388996, 1.963143, -0.4681328, 0, 1, 0.509804, 1,
-0.1360925, -1.417074, -2.14831, 0, 1, 0.5137255, 1,
-0.1350785, 1.004301, -1.909585, 0, 1, 0.5215687, 1,
-0.1296039, -0.01471788, -2.400202, 0, 1, 0.5254902, 1,
-0.1270756, -0.6357778, -3.900076, 0, 1, 0.5333334, 1,
-0.1263541, 0.153859, -0.3802379, 0, 1, 0.5372549, 1,
-0.12215, -0.996617, -2.216324, 0, 1, 0.5450981, 1,
-0.1220221, -1.458511, -1.918364, 0, 1, 0.5490196, 1,
-0.1206367, -1.391699, -2.01189, 0, 1, 0.5568628, 1,
-0.1185549, 0.4523369, 0.7942361, 0, 1, 0.5607843, 1,
-0.1154526, 0.8686891, -1.036426, 0, 1, 0.5686275, 1,
-0.1094321, 0.35271, -1.114471, 0, 1, 0.572549, 1,
-0.108608, -0.6696658, -2.135168, 0, 1, 0.5803922, 1,
-0.1015003, -0.2962058, -3.81872, 0, 1, 0.5843138, 1,
-0.1009893, -0.01238099, -1.335203, 0, 1, 0.5921569, 1,
-0.1006165, 0.5205288, -0.224742, 0, 1, 0.5960785, 1,
-0.09892382, -1.326304, -3.938499, 0, 1, 0.6039216, 1,
-0.09705151, -0.1335863, -1.813542, 0, 1, 0.6117647, 1,
-0.09621542, -0.7634038, -1.54264, 0, 1, 0.6156863, 1,
-0.09322202, 0.6528345, 0.1293775, 0, 1, 0.6235294, 1,
-0.08737336, -0.3853903, -4.210292, 0, 1, 0.627451, 1,
-0.0871326, -0.02512066, -1.93221, 0, 1, 0.6352941, 1,
-0.08653745, -1.27327, -1.527384, 0, 1, 0.6392157, 1,
-0.08270451, 0.4465115, 0.1876544, 0, 1, 0.6470588, 1,
-0.08250892, 1.032475, 0.3484863, 0, 1, 0.6509804, 1,
-0.0822438, -0.2449913, -2.476647, 0, 1, 0.6588235, 1,
-0.08001216, 0.4808483, 0.3902169, 0, 1, 0.6627451, 1,
-0.0795281, 0.06269588, 0.8579476, 0, 1, 0.6705883, 1,
-0.07750222, -2.374065, -4.084713, 0, 1, 0.6745098, 1,
-0.07414277, 0.9445781, 0.691349, 0, 1, 0.682353, 1,
-0.07210407, -0.1588659, -2.954078, 0, 1, 0.6862745, 1,
-0.07203291, -0.5592064, -3.525115, 0, 1, 0.6941177, 1,
-0.06303083, 0.5389993, -0.8304574, 0, 1, 0.7019608, 1,
-0.05690785, -0.3372459, -1.957117, 0, 1, 0.7058824, 1,
-0.05187067, -1.215624, -2.782698, 0, 1, 0.7137255, 1,
-0.05151061, -2.09502, -4.085517, 0, 1, 0.7176471, 1,
-0.05042097, -1.165551, -3.438331, 0, 1, 0.7254902, 1,
-0.04953777, 0.7254505, -0.1381203, 0, 1, 0.7294118, 1,
-0.0492276, -0.03162578, -2.160789, 0, 1, 0.7372549, 1,
-0.04916655, 0.1081345, -0.2639887, 0, 1, 0.7411765, 1,
-0.04896491, 0.7448021, -0.2296812, 0, 1, 0.7490196, 1,
-0.04785213, 0.8071593, -0.3648238, 0, 1, 0.7529412, 1,
-0.04753374, -1.772608, -3.877182, 0, 1, 0.7607843, 1,
-0.04550437, 1.85392, 1.300932, 0, 1, 0.7647059, 1,
-0.04316041, -0.9987516, -4.816352, 0, 1, 0.772549, 1,
-0.04240912, 0.6485979, -1.376473, 0, 1, 0.7764706, 1,
-0.04235895, 0.3774801, 0.4052958, 0, 1, 0.7843137, 1,
-0.03593143, -0.3276356, -2.328549, 0, 1, 0.7882353, 1,
-0.03538496, -0.9056995, -3.548287, 0, 1, 0.7960784, 1,
-0.03380161, 0.4933282, 1.557252, 0, 1, 0.8039216, 1,
-0.03285303, 0.7128981, 0.4831007, 0, 1, 0.8078431, 1,
-0.03187025, -0.1805453, -3.775987, 0, 1, 0.8156863, 1,
-0.02947406, 1.358155, 0.67916, 0, 1, 0.8196079, 1,
-0.02927582, -0.8303602, -1.742826, 0, 1, 0.827451, 1,
-0.02891826, -1.519939, -2.801226, 0, 1, 0.8313726, 1,
-0.02814701, 0.3043246, -0.2985002, 0, 1, 0.8392157, 1,
-0.02609976, 0.06297603, 0.8414196, 0, 1, 0.8431373, 1,
-0.02515739, 0.1855688, 0.3288392, 0, 1, 0.8509804, 1,
-0.02381448, -1.071048, -3.673404, 0, 1, 0.854902, 1,
-0.02061194, -0.5854081, -1.692181, 0, 1, 0.8627451, 1,
-0.02002184, -1.119823, -4.136643, 0, 1, 0.8666667, 1,
-0.01990945, -0.4401951, -3.559642, 0, 1, 0.8745098, 1,
-0.01093937, 0.6015105, 0.04139147, 0, 1, 0.8784314, 1,
-0.009863008, 1.661332, 0.4722459, 0, 1, 0.8862745, 1,
-0.002993876, 0.4697251, 0.7915503, 0, 1, 0.8901961, 1,
0.0021033, -1.105893, 2.53901, 0, 1, 0.8980392, 1,
0.002466207, 0.9387007, -0.6027114, 0, 1, 0.9058824, 1,
0.007266892, -0.1925629, 4.087394, 0, 1, 0.9098039, 1,
0.01320539, -1.583519, 3.130403, 0, 1, 0.9176471, 1,
0.01648216, 0.2231529, 0.7461091, 0, 1, 0.9215686, 1,
0.01727341, -0.8022232, 4.029335, 0, 1, 0.9294118, 1,
0.02244308, 0.7631103, -0.44632, 0, 1, 0.9333333, 1,
0.024801, 0.7416561, -2.149029, 0, 1, 0.9411765, 1,
0.02766862, 0.4618475, -1.233975, 0, 1, 0.945098, 1,
0.0280238, 0.5424033, 0.6258681, 0, 1, 0.9529412, 1,
0.03245965, 0.4244559, -1.246219, 0, 1, 0.9568627, 1,
0.03612399, -0.268501, 2.133623, 0, 1, 0.9647059, 1,
0.03678349, 0.08448783, -0.6445796, 0, 1, 0.9686275, 1,
0.03978054, -0.3007455, 1.031569, 0, 1, 0.9764706, 1,
0.04489597, -0.1463863, 2.618035, 0, 1, 0.9803922, 1,
0.04535172, -1.379135, 3.352488, 0, 1, 0.9882353, 1,
0.0465066, -0.6958521, 3.153077, 0, 1, 0.9921569, 1,
0.05203835, -0.146866, 3.092061, 0, 1, 1, 1,
0.05295982, 0.6607686, 0.2141127, 0, 0.9921569, 1, 1,
0.05713025, 0.8136045, 1.088825, 0, 0.9882353, 1, 1,
0.05939831, -1.910743, 3.630644, 0, 0.9803922, 1, 1,
0.06258589, -0.1032903, 3.564501, 0, 0.9764706, 1, 1,
0.07045947, 0.08995945, -0.1160014, 0, 0.9686275, 1, 1,
0.07152615, -0.8730153, 2.637917, 0, 0.9647059, 1, 1,
0.07255965, -0.5087308, 3.447985, 0, 0.9568627, 1, 1,
0.07480142, 1.06191, -0.2600075, 0, 0.9529412, 1, 1,
0.07604885, -0.3297114, 3.038901, 0, 0.945098, 1, 1,
0.07969102, -0.3050812, 3.522213, 0, 0.9411765, 1, 1,
0.08221538, 1.485482, -0.236748, 0, 0.9333333, 1, 1,
0.08277084, 0.787441, 0.0389954, 0, 0.9294118, 1, 1,
0.08444219, -0.8161043, 2.2222, 0, 0.9215686, 1, 1,
0.08547793, -0.7825654, 4.053856, 0, 0.9176471, 1, 1,
0.08719491, 0.8582668, 0.188181, 0, 0.9098039, 1, 1,
0.08896775, 0.01849515, 1.170403, 0, 0.9058824, 1, 1,
0.09553254, 0.03423819, 0.5878131, 0, 0.8980392, 1, 1,
0.098438, 1.298144, 0.4595584, 0, 0.8901961, 1, 1,
0.0985565, -0.778826, 3.971721, 0, 0.8862745, 1, 1,
0.100155, -0.5001645, 3.513417, 0, 0.8784314, 1, 1,
0.1011008, 0.3239605, -0.3923566, 0, 0.8745098, 1, 1,
0.1029685, -0.3761369, 3.288424, 0, 0.8666667, 1, 1,
0.1112534, 0.6094537, 1.063512, 0, 0.8627451, 1, 1,
0.114565, -0.2658512, 2.874609, 0, 0.854902, 1, 1,
0.1146784, 0.4175736, 0.8055583, 0, 0.8509804, 1, 1,
0.1183202, -0.6285543, 4.451829, 0, 0.8431373, 1, 1,
0.123871, 0.1817945, 1.583484, 0, 0.8392157, 1, 1,
0.127807, 1.66432, 1.272833, 0, 0.8313726, 1, 1,
0.1300784, 0.2977739, 1.114296, 0, 0.827451, 1, 1,
0.131328, 1.027626, 0.7303284, 0, 0.8196079, 1, 1,
0.1318174, -0.742513, 2.909415, 0, 0.8156863, 1, 1,
0.13431, 1.275198, -1.499616, 0, 0.8078431, 1, 1,
0.1356729, -0.7638962, 4.079624, 0, 0.8039216, 1, 1,
0.1394811, -1.453168, 2.939939, 0, 0.7960784, 1, 1,
0.148503, 1.459447, -0.6005595, 0, 0.7882353, 1, 1,
0.1495245, -0.1381941, 2.121121, 0, 0.7843137, 1, 1,
0.1522186, 1.730591, 1.845914, 0, 0.7764706, 1, 1,
0.1527329, -3.485194, 4.000934, 0, 0.772549, 1, 1,
0.1537645, -1.370266, 2.78088, 0, 0.7647059, 1, 1,
0.1538012, -1.331925, 5.997178, 0, 0.7607843, 1, 1,
0.1606634, 0.3207543, 0.4130009, 0, 0.7529412, 1, 1,
0.1616003, 1.389497, 1.698276, 0, 0.7490196, 1, 1,
0.1682983, 0.9059023, 1.682614, 0, 0.7411765, 1, 1,
0.17061, 1.688099, -0.8296984, 0, 0.7372549, 1, 1,
0.1729073, -1.373579, 2.146864, 0, 0.7294118, 1, 1,
0.1744201, -0.2493877, 3.086865, 0, 0.7254902, 1, 1,
0.1744924, 0.06258099, 4.130935, 0, 0.7176471, 1, 1,
0.1794229, -1.416811, 5.952076, 0, 0.7137255, 1, 1,
0.1794671, 0.4502882, -0.3162721, 0, 0.7058824, 1, 1,
0.1815284, 0.0838256, 0.3574667, 0, 0.6980392, 1, 1,
0.1832298, -0.238594, 4.667006, 0, 0.6941177, 1, 1,
0.1841114, -1.106946, 1.861343, 0, 0.6862745, 1, 1,
0.1842306, -1.940531, 2.20862, 0, 0.682353, 1, 1,
0.184732, 0.2048164, 0.5897126, 0, 0.6745098, 1, 1,
0.1859647, -1.009645, 3.443528, 0, 0.6705883, 1, 1,
0.1899904, 2.251692, 0.5635315, 0, 0.6627451, 1, 1,
0.1901484, -1.059924, 1.717692, 0, 0.6588235, 1, 1,
0.1915282, 1.819975, 1.578791, 0, 0.6509804, 1, 1,
0.1944139, -1.32575, 3.927809, 0, 0.6470588, 1, 1,
0.1980455, 0.2003218, 1.84576, 0, 0.6392157, 1, 1,
0.1983024, 0.4231218, 1.56693, 0, 0.6352941, 1, 1,
0.1988142, 1.620528, 0.7018204, 0, 0.627451, 1, 1,
0.2026979, -0.1024598, 4.30402, 0, 0.6235294, 1, 1,
0.2032841, -1.413682, 2.387897, 0, 0.6156863, 1, 1,
0.206948, 1.680665, 1.249326, 0, 0.6117647, 1, 1,
0.2087302, -0.09256341, 2.313962, 0, 0.6039216, 1, 1,
0.2096571, 1.275994, -0.007322877, 0, 0.5960785, 1, 1,
0.2131714, -0.4399576, 3.424696, 0, 0.5921569, 1, 1,
0.2138165, 0.2920705, -0.004892045, 0, 0.5843138, 1, 1,
0.2173823, -0.07857983, 1.538239, 0, 0.5803922, 1, 1,
0.2184413, 0.4040251, -0.3245577, 0, 0.572549, 1, 1,
0.2197971, -0.6362656, 2.1533, 0, 0.5686275, 1, 1,
0.2214398, -0.8738984, 2.188725, 0, 0.5607843, 1, 1,
0.2227016, 0.3200769, -0.8209284, 0, 0.5568628, 1, 1,
0.2263423, 0.4386353, 0.3016456, 0, 0.5490196, 1, 1,
0.2300162, -0.009122874, 2.156571, 0, 0.5450981, 1, 1,
0.2304531, -1.048635, 2.053267, 0, 0.5372549, 1, 1,
0.2306058, -0.9222082, 1.824497, 0, 0.5333334, 1, 1,
0.2332053, -0.7944407, 1.237079, 0, 0.5254902, 1, 1,
0.233692, -0.1515018, 3.999505, 0, 0.5215687, 1, 1,
0.2364965, 1.691333, 2.230311, 0, 0.5137255, 1, 1,
0.2411219, 1.406731, -0.2778634, 0, 0.509804, 1, 1,
0.2418812, 0.9853286, 1.8931, 0, 0.5019608, 1, 1,
0.2424244, 0.4107479, 0.06008889, 0, 0.4941176, 1, 1,
0.2444116, 0.8046386, -1.109904, 0, 0.4901961, 1, 1,
0.2447309, 2.354411, 0.3417219, 0, 0.4823529, 1, 1,
0.245424, -0.906793, 3.361923, 0, 0.4784314, 1, 1,
0.2469173, 0.9165816, 0.1435174, 0, 0.4705882, 1, 1,
0.2483833, 0.8632735, 1.219581, 0, 0.4666667, 1, 1,
0.2485514, -0.431645, 3.237637, 0, 0.4588235, 1, 1,
0.2507737, -0.6195375, 3.731287, 0, 0.454902, 1, 1,
0.2530601, -0.9344483, 3.985989, 0, 0.4470588, 1, 1,
0.2531525, 2.068902, 0.07195953, 0, 0.4431373, 1, 1,
0.2553005, 0.9919007, -0.310893, 0, 0.4352941, 1, 1,
0.2557735, 2.457077, -0.7887559, 0, 0.4313726, 1, 1,
0.2558874, -0.6929843, 2.475786, 0, 0.4235294, 1, 1,
0.2573058, 1.187505, -0.2590235, 0, 0.4196078, 1, 1,
0.2606015, 1.104956, 0.2084042, 0, 0.4117647, 1, 1,
0.2630614, 0.5905802, -0.009930025, 0, 0.4078431, 1, 1,
0.2644464, 1.034483, 0.6693802, 0, 0.4, 1, 1,
0.26679, -0.50576, 3.290789, 0, 0.3921569, 1, 1,
0.266957, 0.4551669, -1.059312, 0, 0.3882353, 1, 1,
0.2678942, -1.25641, 1.847342, 0, 0.3803922, 1, 1,
0.270128, 0.4580384, -1.385654, 0, 0.3764706, 1, 1,
0.2780094, 0.9111395, 0.689814, 0, 0.3686275, 1, 1,
0.2798416, -0.1017452, 1.322096, 0, 0.3647059, 1, 1,
0.2849821, -1.18164, 2.169516, 0, 0.3568628, 1, 1,
0.2861749, 0.3358117, 0.5083786, 0, 0.3529412, 1, 1,
0.287706, -0.7773247, 2.608775, 0, 0.345098, 1, 1,
0.290433, -0.03658211, 1.27387, 0, 0.3411765, 1, 1,
0.2963438, -0.313986, 3.109945, 0, 0.3333333, 1, 1,
0.3033005, -0.1166513, 2.527249, 0, 0.3294118, 1, 1,
0.310275, 1.133787, -0.9190176, 0, 0.3215686, 1, 1,
0.3115191, 0.5951669, 0.9224331, 0, 0.3176471, 1, 1,
0.31276, -1.228992, 2.437654, 0, 0.3098039, 1, 1,
0.3132728, -1.371311, 2.7174, 0, 0.3058824, 1, 1,
0.3139991, -0.5009686, 1.696514, 0, 0.2980392, 1, 1,
0.3157389, -2.522649, 3.783746, 0, 0.2901961, 1, 1,
0.316592, -0.7436655, 2.934963, 0, 0.2862745, 1, 1,
0.3185295, 0.5851668, 1.590266, 0, 0.2784314, 1, 1,
0.3228365, 0.3228312, 2.651478, 0, 0.2745098, 1, 1,
0.3320307, -0.6969243, 3.666014, 0, 0.2666667, 1, 1,
0.3324715, -2.514231, 2.908089, 0, 0.2627451, 1, 1,
0.3331696, -0.9984941, 1.953476, 0, 0.254902, 1, 1,
0.3347789, 0.855269, 0.7234711, 0, 0.2509804, 1, 1,
0.3403765, -1.296026, 1.737301, 0, 0.2431373, 1, 1,
0.3416899, -0.1721805, 1.355546, 0, 0.2392157, 1, 1,
0.3418636, 1.557663, -0.7265108, 0, 0.2313726, 1, 1,
0.342288, -1.121021, 4.442429, 0, 0.227451, 1, 1,
0.3424507, -0.01042216, 2.265953, 0, 0.2196078, 1, 1,
0.3447026, 0.4325712, 0.2962478, 0, 0.2156863, 1, 1,
0.3455338, -0.539515, 2.486252, 0, 0.2078431, 1, 1,
0.3469977, 0.1970622, 2.164005, 0, 0.2039216, 1, 1,
0.3539741, -1.421317, 1.272755, 0, 0.1960784, 1, 1,
0.3550526, 0.9072493, -1.63606, 0, 0.1882353, 1, 1,
0.3562005, 0.06850167, 1.811592, 0, 0.1843137, 1, 1,
0.3582132, -0.5298134, 2.55476, 0, 0.1764706, 1, 1,
0.366307, 1.366991, -0.1078631, 0, 0.172549, 1, 1,
0.3663736, -0.5069302, 3.307559, 0, 0.1647059, 1, 1,
0.3684008, -1.026416, 4.203711, 0, 0.1607843, 1, 1,
0.3709483, 1.763844, -0.4423991, 0, 0.1529412, 1, 1,
0.3722073, -1.758347, 4.620009, 0, 0.1490196, 1, 1,
0.3723619, -1.641146, 0.7858171, 0, 0.1411765, 1, 1,
0.3812067, -0.8774356, 3.013561, 0, 0.1372549, 1, 1,
0.3848383, -0.532724, 1.845667, 0, 0.1294118, 1, 1,
0.3941476, -0.8692666, 1.744891, 0, 0.1254902, 1, 1,
0.3961608, -0.9788741, 2.627543, 0, 0.1176471, 1, 1,
0.3990648, 0.7001842, 0.1776315, 0, 0.1137255, 1, 1,
0.4025514, -0.2098091, 3.152407, 0, 0.1058824, 1, 1,
0.4095908, 0.5005229, 1.505008, 0, 0.09803922, 1, 1,
0.4099651, 0.6245517, 1.209408, 0, 0.09411765, 1, 1,
0.4151317, -0.3745931, 0.3742743, 0, 0.08627451, 1, 1,
0.4162341, 1.766984, 0.4371674, 0, 0.08235294, 1, 1,
0.4173721, 0.940011, 0.9663481, 0, 0.07450981, 1, 1,
0.4208462, -0.6951544, 3.169115, 0, 0.07058824, 1, 1,
0.4210857, -0.7756198, 4.233561, 0, 0.0627451, 1, 1,
0.4229628, 0.2475922, -0.03120734, 0, 0.05882353, 1, 1,
0.4331366, -1.296032, 2.167235, 0, 0.05098039, 1, 1,
0.4370205, -1.430419, 2.103205, 0, 0.04705882, 1, 1,
0.4403089, -0.1793891, 0.9953156, 0, 0.03921569, 1, 1,
0.4406691, -0.8067132, 2.400861, 0, 0.03529412, 1, 1,
0.442162, -0.338041, 2.65083, 0, 0.02745098, 1, 1,
0.4423259, -0.2268351, 0.8779334, 0, 0.02352941, 1, 1,
0.4435246, 0.7767101, -0.2073645, 0, 0.01568628, 1, 1,
0.4448668, 0.5860724, 1.79189, 0, 0.01176471, 1, 1,
0.4514703, -0.2693245, 3.109283, 0, 0.003921569, 1, 1,
0.453282, -0.3284035, 1.844157, 0.003921569, 0, 1, 1,
0.4540929, 0.3507682, 0.6668658, 0.007843138, 0, 1, 1,
0.4594168, -1.865604, 1.807071, 0.01568628, 0, 1, 1,
0.4625586, -1.937099, 2.997593, 0.01960784, 0, 1, 1,
0.4648623, 0.02171683, 1.448833, 0.02745098, 0, 1, 1,
0.4715095, -1.218739, 1.286451, 0.03137255, 0, 1, 1,
0.4780674, -1.032032, 2.815175, 0.03921569, 0, 1, 1,
0.4810408, -0.6475962, 3.754107, 0.04313726, 0, 1, 1,
0.4814306, 0.2829416, 1.066947, 0.05098039, 0, 1, 1,
0.4834325, 0.9311402, -1.911809, 0.05490196, 0, 1, 1,
0.4882679, 1.304952, -0.4508666, 0.0627451, 0, 1, 1,
0.4904031, 0.5708179, 1.53972, 0.06666667, 0, 1, 1,
0.4929102, -1.029498, 2.716448, 0.07450981, 0, 1, 1,
0.4948107, -0.432021, 2.401761, 0.07843138, 0, 1, 1,
0.4972031, -0.2540929, 2.887114, 0.08627451, 0, 1, 1,
0.4996992, -1.028885, 2.284197, 0.09019608, 0, 1, 1,
0.5014672, 0.0130272, 1.611137, 0.09803922, 0, 1, 1,
0.5037398, 0.1337005, 0.2600649, 0.1058824, 0, 1, 1,
0.5095043, 1.118355, 0.5803433, 0.1098039, 0, 1, 1,
0.5105985, -0.01382745, 1.199387, 0.1176471, 0, 1, 1,
0.5121766, -0.3517624, 1.005956, 0.1215686, 0, 1, 1,
0.5173858, -0.9427431, 3.934812, 0.1294118, 0, 1, 1,
0.5180346, 0.9215677, 0.3890954, 0.1333333, 0, 1, 1,
0.5195878, 0.3888049, 0.4081073, 0.1411765, 0, 1, 1,
0.5213861, 1.083819, -1.395594, 0.145098, 0, 1, 1,
0.5235771, -0.3896244, -0.6244073, 0.1529412, 0, 1, 1,
0.5268059, 2.523954, 0.5302747, 0.1568628, 0, 1, 1,
0.5269726, 0.1719872, 2.354412, 0.1647059, 0, 1, 1,
0.5285448, -0.2733669, 1.079704, 0.1686275, 0, 1, 1,
0.5348837, 0.6402655, 2.140879, 0.1764706, 0, 1, 1,
0.5362768, 0.08779538, 0.4765928, 0.1803922, 0, 1, 1,
0.5405195, -0.9670064, 3.232567, 0.1882353, 0, 1, 1,
0.5422619, -0.009551878, 1.763088, 0.1921569, 0, 1, 1,
0.5540551, -2.305766, 3.038487, 0.2, 0, 1, 1,
0.5584689, 0.5609343, 2.061389, 0.2078431, 0, 1, 1,
0.5613722, -1.39057, 3.831843, 0.2117647, 0, 1, 1,
0.5625509, 0.791059, -0.2217883, 0.2196078, 0, 1, 1,
0.5633684, 0.8692272, -0.07749838, 0.2235294, 0, 1, 1,
0.5647257, 0.266297, 1.494548, 0.2313726, 0, 1, 1,
0.5702412, 0.3237973, 1.53833, 0.2352941, 0, 1, 1,
0.5711271, 0.8866619, 1.300947, 0.2431373, 0, 1, 1,
0.5739868, -1.028468, 2.210974, 0.2470588, 0, 1, 1,
0.5807889, 0.5542741, 0.1584712, 0.254902, 0, 1, 1,
0.5847311, -1.30825, 2.663978, 0.2588235, 0, 1, 1,
0.585757, -0.6492743, 2.581626, 0.2666667, 0, 1, 1,
0.5897666, 0.4270749, 1.412046, 0.2705882, 0, 1, 1,
0.592292, -0.1041609, 0.2249709, 0.2784314, 0, 1, 1,
0.5966115, -0.5374948, 2.572694, 0.282353, 0, 1, 1,
0.6019069, -0.2060441, 2.761065, 0.2901961, 0, 1, 1,
0.6052891, -0.3123649, 1.611062, 0.2941177, 0, 1, 1,
0.6054992, -0.03214163, 2.005877, 0.3019608, 0, 1, 1,
0.6059749, 1.850411, -0.2066863, 0.3098039, 0, 1, 1,
0.6085496, -0.8561015, 2.052753, 0.3137255, 0, 1, 1,
0.6198213, -0.1235375, 2.17865, 0.3215686, 0, 1, 1,
0.6217598, 0.8613244, 1.067027, 0.3254902, 0, 1, 1,
0.6231182, 1.6785, 3.385736, 0.3333333, 0, 1, 1,
0.6252939, -1.820484, 1.752157, 0.3372549, 0, 1, 1,
0.6278054, -0.8851649, 4.338137, 0.345098, 0, 1, 1,
0.637457, 1.945918, 0.1503719, 0.3490196, 0, 1, 1,
0.6470358, -1.473281, 2.56522, 0.3568628, 0, 1, 1,
0.6493286, -1.34303, 2.65215, 0.3607843, 0, 1, 1,
0.6494505, 0.9945787, -0.4204485, 0.3686275, 0, 1, 1,
0.6506281, -0.4886439, 1.671776, 0.372549, 0, 1, 1,
0.6519495, -0.08500622, 0.1229126, 0.3803922, 0, 1, 1,
0.6554318, 1.41844, 0.6711906, 0.3843137, 0, 1, 1,
0.6568224, -0.008815141, -0.1572631, 0.3921569, 0, 1, 1,
0.657831, 0.4294561, 2.787874, 0.3960784, 0, 1, 1,
0.659134, 0.4338485, -0.623231, 0.4039216, 0, 1, 1,
0.6636871, 0.4876065, 2.121421, 0.4117647, 0, 1, 1,
0.6637345, -0.7444317, 2.074795, 0.4156863, 0, 1, 1,
0.6646032, 1.031564, -0.0484379, 0.4235294, 0, 1, 1,
0.667004, -0.5060548, 3.156638, 0.427451, 0, 1, 1,
0.6676197, -0.4198222, 3.003241, 0.4352941, 0, 1, 1,
0.6710069, -1.215529, 3.668242, 0.4392157, 0, 1, 1,
0.6729165, -0.945107, 2.132462, 0.4470588, 0, 1, 1,
0.6761268, -0.5353061, 2.549074, 0.4509804, 0, 1, 1,
0.6855884, -1.390118, 1.065531, 0.4588235, 0, 1, 1,
0.6926646, -0.04713117, 2.537765, 0.4627451, 0, 1, 1,
0.6928452, 0.8182414, 0.8792089, 0.4705882, 0, 1, 1,
0.6960152, 1.068223, -1.888776, 0.4745098, 0, 1, 1,
0.6978248, 0.2701987, 0.3267401, 0.4823529, 0, 1, 1,
0.7012346, -0.3387953, 2.334649, 0.4862745, 0, 1, 1,
0.702145, 1.569538, 0.1603534, 0.4941176, 0, 1, 1,
0.7025741, -0.329067, 3.114912, 0.5019608, 0, 1, 1,
0.7083779, -0.6420097, 2.794007, 0.5058824, 0, 1, 1,
0.7109697, -0.9906893, 1.340411, 0.5137255, 0, 1, 1,
0.7138664, 0.02983716, 1.417485, 0.5176471, 0, 1, 1,
0.7154984, 1.61861, 0.6474331, 0.5254902, 0, 1, 1,
0.7181284, -0.50825, 2.44428, 0.5294118, 0, 1, 1,
0.721909, 1.768142, 0.5517226, 0.5372549, 0, 1, 1,
0.7245227, 2.249753, 0.5172634, 0.5411765, 0, 1, 1,
0.7253085, 0.2456185, 1.131694, 0.5490196, 0, 1, 1,
0.7254305, 1.147828, -1.270553, 0.5529412, 0, 1, 1,
0.7292204, 1.268983, 0.1063553, 0.5607843, 0, 1, 1,
0.7300233, -0.3260395, 2.577786, 0.5647059, 0, 1, 1,
0.7322791, 0.2700837, 2.060997, 0.572549, 0, 1, 1,
0.7337879, 0.1586456, 1.501508, 0.5764706, 0, 1, 1,
0.7359167, -0.4001899, 1.372722, 0.5843138, 0, 1, 1,
0.7370536, 0.9879874, 1.948103, 0.5882353, 0, 1, 1,
0.7384423, -0.8595592, 1.937747, 0.5960785, 0, 1, 1,
0.7390524, -1.601891, 3.547578, 0.6039216, 0, 1, 1,
0.7391688, -1.117028, 1.823101, 0.6078432, 0, 1, 1,
0.7393603, 0.6498756, 0.5746819, 0.6156863, 0, 1, 1,
0.7400646, 0.6817738, 0.1656936, 0.6196079, 0, 1, 1,
0.7408526, 1.627322, -0.5965718, 0.627451, 0, 1, 1,
0.7427613, 0.7073396, 0.1006906, 0.6313726, 0, 1, 1,
0.749441, 0.459558, 0.4630058, 0.6392157, 0, 1, 1,
0.7522554, 0.453, 0.1974516, 0.6431373, 0, 1, 1,
0.7542284, 0.8836989, -0.6730387, 0.6509804, 0, 1, 1,
0.7561624, -0.5146652, 1.19485, 0.654902, 0, 1, 1,
0.7576326, 0.4396756, 1.669119, 0.6627451, 0, 1, 1,
0.7648452, -1.929324, 3.74317, 0.6666667, 0, 1, 1,
0.770654, 1.237104, 0.5172091, 0.6745098, 0, 1, 1,
0.7746388, -0.5344802, 1.323825, 0.6784314, 0, 1, 1,
0.7845357, -1.690483, 3.255724, 0.6862745, 0, 1, 1,
0.7917106, 0.858874, 2.118652, 0.6901961, 0, 1, 1,
0.79439, 0.7871074, 0.7029188, 0.6980392, 0, 1, 1,
0.8054735, -1.537975, 2.712432, 0.7058824, 0, 1, 1,
0.807536, -0.7304036, 0.7662991, 0.7098039, 0, 1, 1,
0.8078478, -0.3893107, 2.81585, 0.7176471, 0, 1, 1,
0.8122609, -0.5791774, 1.31519, 0.7215686, 0, 1, 1,
0.8213018, -0.6033374, 3.818145, 0.7294118, 0, 1, 1,
0.8251137, -1.010486, 2.11236, 0.7333333, 0, 1, 1,
0.8272987, -0.8367277, 5.03733, 0.7411765, 0, 1, 1,
0.8355426, 0.6921427, 1.893718, 0.7450981, 0, 1, 1,
0.837622, -1.976881, 1.374558, 0.7529412, 0, 1, 1,
0.8411011, 0.2838489, 1.125875, 0.7568628, 0, 1, 1,
0.8484527, -0.8522832, 2.992044, 0.7647059, 0, 1, 1,
0.8523375, 0.4552008, 0.8772285, 0.7686275, 0, 1, 1,
0.8552796, -0.4284344, 3.27434, 0.7764706, 0, 1, 1,
0.8589559, 0.9153296, 0.6377646, 0.7803922, 0, 1, 1,
0.8628542, 0.6779998, -0.114497, 0.7882353, 0, 1, 1,
0.8647676, 0.1307723, 1.271855, 0.7921569, 0, 1, 1,
0.8711312, 1.792468, 0.8365704, 0.8, 0, 1, 1,
0.8740128, 0.821536, 0.8673698, 0.8078431, 0, 1, 1,
0.8756737, 0.2975353, 1.756084, 0.8117647, 0, 1, 1,
0.8799904, -0.1965755, 1.736138, 0.8196079, 0, 1, 1,
0.8879421, 1.438195, -0.8805138, 0.8235294, 0, 1, 1,
0.9000379, -0.5269989, 2.710187, 0.8313726, 0, 1, 1,
0.9025762, -1.516163, 2.257803, 0.8352941, 0, 1, 1,
0.9130692, -0.2272496, 1.55022, 0.8431373, 0, 1, 1,
0.9140508, -0.3664439, 2.335151, 0.8470588, 0, 1, 1,
0.9160675, -0.5242536, 2.253752, 0.854902, 0, 1, 1,
0.9173293, 0.1126093, 1.66065, 0.8588235, 0, 1, 1,
0.9175453, 0.3604521, 2.377309, 0.8666667, 0, 1, 1,
0.9228902, 1.413566, 0.642824, 0.8705882, 0, 1, 1,
0.9243427, 0.8275391, 1.845523, 0.8784314, 0, 1, 1,
0.9265995, -0.7847491, 1.551152, 0.8823529, 0, 1, 1,
0.9298343, -0.2416681, 2.845145, 0.8901961, 0, 1, 1,
0.931114, 1.112282, -0.7781933, 0.8941177, 0, 1, 1,
0.9347298, -0.7474882, 2.810909, 0.9019608, 0, 1, 1,
0.9421613, -0.7000597, 2.42732, 0.9098039, 0, 1, 1,
0.9438962, -0.3055449, -0.1078102, 0.9137255, 0, 1, 1,
0.9452195, -2.398582, 3.4504, 0.9215686, 0, 1, 1,
0.9472368, 0.002318338, -0.5582073, 0.9254902, 0, 1, 1,
0.9504205, 0.04001093, 0.607005, 0.9333333, 0, 1, 1,
0.9532914, -0.5045648, 3.416135, 0.9372549, 0, 1, 1,
0.9549333, 0.4122643, 0.007205743, 0.945098, 0, 1, 1,
0.9551759, 1.483841, -2.242038, 0.9490196, 0, 1, 1,
0.956291, 0.9336915, 0.4014343, 0.9568627, 0, 1, 1,
0.959065, 0.5404048, 1.075461, 0.9607843, 0, 1, 1,
0.9597806, -0.2732804, 1.264782, 0.9686275, 0, 1, 1,
0.9607629, 0.03173228, 0.967239, 0.972549, 0, 1, 1,
0.9608904, -1.058988, 2.185674, 0.9803922, 0, 1, 1,
0.9681587, -1.144934, 2.370571, 0.9843137, 0, 1, 1,
0.972967, -1.07484, 2.211981, 0.9921569, 0, 1, 1,
0.9778298, -2.8801, 2.368357, 0.9960784, 0, 1, 1,
0.9870222, 0.410302, 1.710452, 1, 0, 0.9960784, 1,
0.9882469, 0.3140988, 1.987824, 1, 0, 0.9882353, 1,
0.9956258, 0.1343125, 0.8882506, 1, 0, 0.9843137, 1,
0.9958102, -1.201668, 1.425631, 1, 0, 0.9764706, 1,
1.001323, -0.4369754, 3.034896, 1, 0, 0.972549, 1,
1.001583, 0.103315, 3.484683, 1, 0, 0.9647059, 1,
1.005227, -0.1848111, 0.8323247, 1, 0, 0.9607843, 1,
1.005568, 1.107375, 1.157933, 1, 0, 0.9529412, 1,
1.010003, -0.5767287, 2.268986, 1, 0, 0.9490196, 1,
1.010669, -0.3512485, 2.464148, 1, 0, 0.9411765, 1,
1.011405, 0.535744, 1.567821, 1, 0, 0.9372549, 1,
1.022982, -0.9463263, 3.369268, 1, 0, 0.9294118, 1,
1.03049, 0.12925, 2.025903, 1, 0, 0.9254902, 1,
1.044182, -0.4990578, 1.648399, 1, 0, 0.9176471, 1,
1.047894, -0.5061787, 1.093812, 1, 0, 0.9137255, 1,
1.057972, -0.6129216, 0.3951486, 1, 0, 0.9058824, 1,
1.05826, 2.891799, -0.3552206, 1, 0, 0.9019608, 1,
1.069403, 0.9086879, 0.5955443, 1, 0, 0.8941177, 1,
1.07805, -0.4274722, 3.199145, 1, 0, 0.8862745, 1,
1.078982, -0.9435022, -0.3186809, 1, 0, 0.8823529, 1,
1.081427, 0.2289415, 1.352263, 1, 0, 0.8745098, 1,
1.082505, 1.121912, -0.9521961, 1, 0, 0.8705882, 1,
1.085463, 0.6818905, -0.3977344, 1, 0, 0.8627451, 1,
1.094317, -1.243304, 2.266587, 1, 0, 0.8588235, 1,
1.097528, 0.08610434, 2.565126, 1, 0, 0.8509804, 1,
1.102221, 1.280487, -0.5802783, 1, 0, 0.8470588, 1,
1.102692, -0.05509669, 1.443021, 1, 0, 0.8392157, 1,
1.104696, -2.055137, 1.359017, 1, 0, 0.8352941, 1,
1.107277, -0.9929138, 4.011138, 1, 0, 0.827451, 1,
1.110464, 0.1877416, 2.107646, 1, 0, 0.8235294, 1,
1.118133, -0.4750137, 2.04676, 1, 0, 0.8156863, 1,
1.12006, -0.0386711, 1.106344, 1, 0, 0.8117647, 1,
1.123656, 0.3369395, 1.480382, 1, 0, 0.8039216, 1,
1.125894, 0.3744699, 1.29804, 1, 0, 0.7960784, 1,
1.130471, 0.4024232, 0.253131, 1, 0, 0.7921569, 1,
1.138603, -1.271228, 1.655225, 1, 0, 0.7843137, 1,
1.143493, 1.605471, 0.3542007, 1, 0, 0.7803922, 1,
1.152784, -0.09133213, 0.8090854, 1, 0, 0.772549, 1,
1.154415, -1.210043, 1.597014, 1, 0, 0.7686275, 1,
1.161419, -0.2738163, 0.6949787, 1, 0, 0.7607843, 1,
1.168301, -0.6772354, -0.3761992, 1, 0, 0.7568628, 1,
1.174841, 0.1813903, 2.134158, 1, 0, 0.7490196, 1,
1.178002, 1.01562, 2.458574, 1, 0, 0.7450981, 1,
1.183524, 0.9826645, -0.4951929, 1, 0, 0.7372549, 1,
1.185317, -1.321219, 1.594055, 1, 0, 0.7333333, 1,
1.187032, 0.1138682, 0.3653075, 1, 0, 0.7254902, 1,
1.194312, -0.6902441, 1.377345, 1, 0, 0.7215686, 1,
1.198739, -1.208641, 2.286617, 1, 0, 0.7137255, 1,
1.201013, 0.7120739, 1.653571, 1, 0, 0.7098039, 1,
1.205528, 0.8081914, 0.6775365, 1, 0, 0.7019608, 1,
1.210226, 1.924826, 2.919056, 1, 0, 0.6941177, 1,
1.210864, -1.267161, 2.77148, 1, 0, 0.6901961, 1,
1.214206, 0.2097433, 3.29003, 1, 0, 0.682353, 1,
1.215282, -0.8000594, 1.080141, 1, 0, 0.6784314, 1,
1.228544, -0.1453724, 0.5046297, 1, 0, 0.6705883, 1,
1.233424, -0.5199229, 0.8861301, 1, 0, 0.6666667, 1,
1.236718, 0.9081314, 1.808288, 1, 0, 0.6588235, 1,
1.246662, 0.05456671, 1.681795, 1, 0, 0.654902, 1,
1.251665, 0.06923954, 1.662376, 1, 0, 0.6470588, 1,
1.259115, 1.113033, 0.5333294, 1, 0, 0.6431373, 1,
1.261991, 0.5976139, 0.1481544, 1, 0, 0.6352941, 1,
1.262586, -0.7122979, 2.213667, 1, 0, 0.6313726, 1,
1.263412, -0.08430957, 2.081534, 1, 0, 0.6235294, 1,
1.282185, -0.5050641, 1.67313, 1, 0, 0.6196079, 1,
1.2831, 1.300053, 2.509134, 1, 0, 0.6117647, 1,
1.287306, -0.8407471, 3.726971, 1, 0, 0.6078432, 1,
1.288739, -0.7559173, 3.355891, 1, 0, 0.6, 1,
1.295384, -1.664896, 1.728985, 1, 0, 0.5921569, 1,
1.306778, 1.325582, 1.582113, 1, 0, 0.5882353, 1,
1.318903, 0.2297948, -0.2502902, 1, 0, 0.5803922, 1,
1.321557, -1.42607, 2.815662, 1, 0, 0.5764706, 1,
1.329615, 0.9102173, 1.76795, 1, 0, 0.5686275, 1,
1.330023, 0.9100537, 1.647022, 1, 0, 0.5647059, 1,
1.340326, 0.4574367, 0.8092173, 1, 0, 0.5568628, 1,
1.343121, 0.8423806, -0.08885443, 1, 0, 0.5529412, 1,
1.343609, -0.07994243, 1.694991, 1, 0, 0.5450981, 1,
1.355762, -1.209276, 1.252862, 1, 0, 0.5411765, 1,
1.363252, -0.3039539, 1.77639, 1, 0, 0.5333334, 1,
1.369578, -0.2030756, 2.275438, 1, 0, 0.5294118, 1,
1.37451, 0.8422766, -0.03954291, 1, 0, 0.5215687, 1,
1.379425, 1.519694, 1.677343, 1, 0, 0.5176471, 1,
1.383278, 1.154294, 1.860171, 1, 0, 0.509804, 1,
1.385123, -0.04506991, 1.197909, 1, 0, 0.5058824, 1,
1.392674, 1.609373, 1.306026, 1, 0, 0.4980392, 1,
1.393265, -0.1191991, 1.134155, 1, 0, 0.4901961, 1,
1.409172, 0.6861057, 1.980869, 1, 0, 0.4862745, 1,
1.413203, -0.2452528, 2.262125, 1, 0, 0.4784314, 1,
1.413479, 0.6271922, 3.470289, 1, 0, 0.4745098, 1,
1.421535, 0.894435, -0.1142705, 1, 0, 0.4666667, 1,
1.427519, -0.4851145, 1.393178, 1, 0, 0.4627451, 1,
1.431394, -1.286517, 1.671389, 1, 0, 0.454902, 1,
1.432804, -0.06864622, 1.66417, 1, 0, 0.4509804, 1,
1.433671, 1.158302, 1.219275, 1, 0, 0.4431373, 1,
1.452921, -0.4290958, 2.048493, 1, 0, 0.4392157, 1,
1.454447, 1.095389, 0.9216185, 1, 0, 0.4313726, 1,
1.458462, -1.659434, 1.230838, 1, 0, 0.427451, 1,
1.468781, 0.3423332, -0.8838143, 1, 0, 0.4196078, 1,
1.478084, 0.6169122, 1.986561, 1, 0, 0.4156863, 1,
1.486941, -1.738164, 1.370118, 1, 0, 0.4078431, 1,
1.517758, -2.558399, 3.740591, 1, 0, 0.4039216, 1,
1.520824, -0.8019491, 2.814216, 1, 0, 0.3960784, 1,
1.522293, -1.113819, 2.78517, 1, 0, 0.3882353, 1,
1.547285, 1.70624, 0.9047798, 1, 0, 0.3843137, 1,
1.568513, -0.161824, 0.9288727, 1, 0, 0.3764706, 1,
1.57346, 1.130806, 0.7443627, 1, 0, 0.372549, 1,
1.577055, 0.1753114, -0.1652746, 1, 0, 0.3647059, 1,
1.583953, 1.775045, 1.191507, 1, 0, 0.3607843, 1,
1.58435, -1.394555, 2.547125, 1, 0, 0.3529412, 1,
1.584803, -0.9531782, 1.54612, 1, 0, 0.3490196, 1,
1.588994, -0.9017863, 2.071731, 1, 0, 0.3411765, 1,
1.62729, 1.772366, 0.8921093, 1, 0, 0.3372549, 1,
1.645473, -0.868407, 2.733828, 1, 0, 0.3294118, 1,
1.65346, 1.032885, 3.355722, 1, 0, 0.3254902, 1,
1.657774, -1.045459, 4.388534, 1, 0, 0.3176471, 1,
1.670594, 0.9649522, 2.785724, 1, 0, 0.3137255, 1,
1.678269, -1.908988, 1.991083, 1, 0, 0.3058824, 1,
1.691903, 0.1335359, -0.2623345, 1, 0, 0.2980392, 1,
1.695003, -0.20951, 1.05817, 1, 0, 0.2941177, 1,
1.705863, 2.40319, 0.2902864, 1, 0, 0.2862745, 1,
1.709657, 0.2295949, 1.948515, 1, 0, 0.282353, 1,
1.717154, 1.241933, 1.76822, 1, 0, 0.2745098, 1,
1.717986, 0.6405223, 1.248166, 1, 0, 0.2705882, 1,
1.723256, 0.3740873, 3.704185, 1, 0, 0.2627451, 1,
1.744979, 0.227438, 0.4081641, 1, 0, 0.2588235, 1,
1.745103, 0.4730051, 1.500619, 1, 0, 0.2509804, 1,
1.752909, 0.8297551, 1.36032, 1, 0, 0.2470588, 1,
1.753481, -1.534992, 2.907075, 1, 0, 0.2392157, 1,
1.756314, -0.08386905, 2.744496, 1, 0, 0.2352941, 1,
1.756877, -0.7797647, 2.43504, 1, 0, 0.227451, 1,
1.762137, -1.185368, 2.468433, 1, 0, 0.2235294, 1,
1.781396, -1.614359, 4.159465, 1, 0, 0.2156863, 1,
1.781648, -0.3900496, 1.664876, 1, 0, 0.2117647, 1,
1.799118, 0.04150491, 2.148783, 1, 0, 0.2039216, 1,
1.80467, -0.3645727, 0.9263265, 1, 0, 0.1960784, 1,
1.814859, 0.06465082, 0.9396984, 1, 0, 0.1921569, 1,
1.816043, -0.9237285, 1.152375, 1, 0, 0.1843137, 1,
1.818666, 0.1576115, 0.2289377, 1, 0, 0.1803922, 1,
1.827274, -0.5957906, 0.6884359, 1, 0, 0.172549, 1,
1.829223, 1.271337, 0.9490861, 1, 0, 0.1686275, 1,
1.878979, -1.405946, 3.620755, 1, 0, 0.1607843, 1,
1.886194, -1.654791, 2.556797, 1, 0, 0.1568628, 1,
1.889529, -1.032245, 3.553203, 1, 0, 0.1490196, 1,
1.892977, -1.067823, 1.400988, 1, 0, 0.145098, 1,
1.909793, 0.7620212, 1.576289, 1, 0, 0.1372549, 1,
1.92359, -0.3600829, 0.5159941, 1, 0, 0.1333333, 1,
1.949595, -1.618176, 2.515051, 1, 0, 0.1254902, 1,
1.989004, -0.3008083, 2.333258, 1, 0, 0.1215686, 1,
2.033074, -1.75376, 2.704119, 1, 0, 0.1137255, 1,
2.048007, 1.883185, -1.041282, 1, 0, 0.1098039, 1,
2.049808, 1.994349, 0.6574661, 1, 0, 0.1019608, 1,
2.054068, 0.09428857, 2.282309, 1, 0, 0.09411765, 1,
2.071666, -0.6419601, 0.8303983, 1, 0, 0.09019608, 1,
2.088374, 1.21928, -0.4814082, 1, 0, 0.08235294, 1,
2.094892, -0.1256533, 2.264335, 1, 0, 0.07843138, 1,
2.210368, -1.30887, 2.318858, 1, 0, 0.07058824, 1,
2.223864, -0.0487722, 2.016316, 1, 0, 0.06666667, 1,
2.269669, -1.110745, 1.318453, 1, 0, 0.05882353, 1,
2.324265, -0.6999274, 2.0481, 1, 0, 0.05490196, 1,
2.404917, -0.651509, 2.788245, 1, 0, 0.04705882, 1,
2.481364, 0.6879283, 1.606512, 1, 0, 0.04313726, 1,
2.535358, 0.6497287, 3.279117, 1, 0, 0.03529412, 1,
2.558411, 1.748288, 2.123673, 1, 0, 0.03137255, 1,
2.669557, -0.7452105, -0.7165882, 1, 0, 0.02352941, 1,
2.899072, -0.5215453, 0.6285818, 1, 0, 0.01960784, 1,
3.60136, -0.7601745, 1.608104, 1, 0, 0.01176471, 1,
3.7738, -1.348655, 1.647738, 1, 0, 0.007843138, 1
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
0.3905734, -4.607645, -7.081693, 0, -0.5, 0.5, 0.5,
0.3905734, -4.607645, -7.081693, 1, -0.5, 0.5, 0.5,
0.3905734, -4.607645, -7.081693, 1, 1.5, 0.5, 0.5,
0.3905734, -4.607645, -7.081693, 0, 1.5, 0.5, 0.5
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
-4.139567, -0.1741312, -7.081693, 0, -0.5, 0.5, 0.5,
-4.139567, -0.1741312, -7.081693, 1, -0.5, 0.5, 0.5,
-4.139567, -0.1741312, -7.081693, 1, 1.5, 0.5, 0.5,
-4.139567, -0.1741312, -7.081693, 0, 1.5, 0.5, 0.5
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
-4.139567, -4.607645, 0.4055274, 0, -0.5, 0.5, 0.5,
-4.139567, -4.607645, 0.4055274, 1, -0.5, 0.5, 0.5,
-4.139567, -4.607645, 0.4055274, 1, 1.5, 0.5, 0.5,
-4.139567, -4.607645, 0.4055274, 0, 1.5, 0.5, 0.5
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
-2, -3.584526, -5.353873,
3, -3.584526, -5.353873,
-2, -3.584526, -5.353873,
-2, -3.755046, -5.641843,
-1, -3.584526, -5.353873,
-1, -3.755046, -5.641843,
0, -3.584526, -5.353873,
0, -3.755046, -5.641843,
1, -3.584526, -5.353873,
1, -3.755046, -5.641843,
2, -3.584526, -5.353873,
2, -3.755046, -5.641843,
3, -3.584526, -5.353873,
3, -3.755046, -5.641843
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
-2, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
-2, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
-2, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
-2, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5,
-1, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
-1, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
-1, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
-1, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5,
0, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
0, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
0, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
0, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5,
1, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
1, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
1, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
1, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5,
2, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
2, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
2, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
2, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5,
3, -4.096086, -6.217783, 0, -0.5, 0.5, 0.5,
3, -4.096086, -6.217783, 1, -0.5, 0.5, 0.5,
3, -4.096086, -6.217783, 1, 1.5, 0.5, 0.5,
3, -4.096086, -6.217783, 0, 1.5, 0.5, 0.5
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
-3.09415, -3, -5.353873,
-3.09415, 3, -5.353873,
-3.09415, -3, -5.353873,
-3.268387, -3, -5.641843,
-3.09415, -2, -5.353873,
-3.268387, -2, -5.641843,
-3.09415, -1, -5.353873,
-3.268387, -1, -5.641843,
-3.09415, 0, -5.353873,
-3.268387, 0, -5.641843,
-3.09415, 1, -5.353873,
-3.268387, 1, -5.641843,
-3.09415, 2, -5.353873,
-3.268387, 2, -5.641843,
-3.09415, 3, -5.353873,
-3.268387, 3, -5.641843
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
-3.616859, -3, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, -3, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, -3, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, -3, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, -2, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, -2, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, -2, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, -2, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, -1, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, -1, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, -1, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, -1, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, 0, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, 0, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, 0, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, 0, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, 1, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, 1, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, 1, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, 1, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, 2, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, 2, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, 2, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, 2, -6.217783, 0, 1.5, 0.5, 0.5,
-3.616859, 3, -6.217783, 0, -0.5, 0.5, 0.5,
-3.616859, 3, -6.217783, 1, -0.5, 0.5, 0.5,
-3.616859, 3, -6.217783, 1, 1.5, 0.5, 0.5,
-3.616859, 3, -6.217783, 0, 1.5, 0.5, 0.5
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
-3.09415, -3.584526, -4,
-3.09415, -3.584526, 4,
-3.09415, -3.584526, -4,
-3.268387, -3.755046, -4,
-3.09415, -3.584526, -2,
-3.268387, -3.755046, -2,
-3.09415, -3.584526, 0,
-3.268387, -3.755046, 0,
-3.09415, -3.584526, 2,
-3.268387, -3.755046, 2,
-3.09415, -3.584526, 4,
-3.268387, -3.755046, 4
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
-3.616859, -4.096086, -4, 0, -0.5, 0.5, 0.5,
-3.616859, -4.096086, -4, 1, -0.5, 0.5, 0.5,
-3.616859, -4.096086, -4, 1, 1.5, 0.5, 0.5,
-3.616859, -4.096086, -4, 0, 1.5, 0.5, 0.5,
-3.616859, -4.096086, -2, 0, -0.5, 0.5, 0.5,
-3.616859, -4.096086, -2, 1, -0.5, 0.5, 0.5,
-3.616859, -4.096086, -2, 1, 1.5, 0.5, 0.5,
-3.616859, -4.096086, -2, 0, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 0, 0, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 0, 1, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 0, 1, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 0, 0, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 2, 0, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 2, 1, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 2, 1, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 2, 0, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 4, 0, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 4, 1, -0.5, 0.5, 0.5,
-3.616859, -4.096086, 4, 1, 1.5, 0.5, 0.5,
-3.616859, -4.096086, 4, 0, 1.5, 0.5, 0.5
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
-3.09415, -3.584526, -5.353873,
-3.09415, 3.236264, -5.353873,
-3.09415, -3.584526, 6.164927,
-3.09415, 3.236264, 6.164927,
-3.09415, -3.584526, -5.353873,
-3.09415, -3.584526, 6.164927,
-3.09415, 3.236264, -5.353873,
-3.09415, 3.236264, 6.164927,
-3.09415, -3.584526, -5.353873,
3.875297, -3.584526, -5.353873,
-3.09415, -3.584526, 6.164927,
3.875297, -3.584526, 6.164927,
-3.09415, 3.236264, -5.353873,
3.875297, 3.236264, -5.353873,
-3.09415, 3.236264, 6.164927,
3.875297, 3.236264, 6.164927,
3.875297, -3.584526, -5.353873,
3.875297, 3.236264, -5.353873,
3.875297, -3.584526, 6.164927,
3.875297, 3.236264, 6.164927,
3.875297, -3.584526, -5.353873,
3.875297, -3.584526, 6.164927,
3.875297, 3.236264, -5.353873,
3.875297, 3.236264, 6.164927
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
var radius = 8.059024;
var distance = 35.85551;
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
mvMatrix.translate( -0.3905734, 0.1741312, -0.4055274 );
mvMatrix.scale( 1.250253, 1.277502, 0.7564654 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.85551);
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
Azocyclotin<-read.table("Azocyclotin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Azocyclotin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Azocyclotin' not found
```

```r
y<-Azocyclotin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Azocyclotin' not found
```

```r
z<-Azocyclotin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Azocyclotin' not found
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
-2.992654, -0.3436882, -1.966802, 0, 0, 1, 1, 1,
-2.983189, -1.339895, -2.322837, 1, 0, 0, 1, 1,
-2.889646, -1.758932, -2.508677, 1, 0, 0, 1, 1,
-2.760848, 0.772119, -1.333493, 1, 0, 0, 1, 1,
-2.747192, -0.1719762, 0.4631188, 1, 0, 0, 1, 1,
-2.730195, -1.066763, -2.87097, 1, 0, 0, 1, 1,
-2.609018, 1.694118, -0.7868921, 0, 0, 0, 1, 1,
-2.603928, -0.7721725, -1.263506, 0, 0, 0, 1, 1,
-2.578117, 0.2964304, -0.1283689, 0, 0, 0, 1, 1,
-2.493928, 0.01225557, -0.8231894, 0, 0, 0, 1, 1,
-2.444864, 1.237109, -1.231245, 0, 0, 0, 1, 1,
-2.401353, -0.4539487, -2.317452, 0, 0, 0, 1, 1,
-2.325023, -0.7602046, -2.523929, 0, 0, 0, 1, 1,
-2.321487, 0.3066958, -1.66637, 1, 1, 1, 1, 1,
-2.318463, -0.3057553, -1.046181, 1, 1, 1, 1, 1,
-2.283064, 0.5710313, -1.502298, 1, 1, 1, 1, 1,
-2.244347, -0.01852788, -1.816387, 1, 1, 1, 1, 1,
-2.178814, -0.03278985, -2.194119, 1, 1, 1, 1, 1,
-2.166137, 2.061661, -2.016363, 1, 1, 1, 1, 1,
-2.136309, -0.8115582, -2.607249, 1, 1, 1, 1, 1,
-2.095716, -0.3542554, -0.4599422, 1, 1, 1, 1, 1,
-2.092288, 0.2739408, -2.325551, 1, 1, 1, 1, 1,
-2.082103, -0.6449423, -1.374073, 1, 1, 1, 1, 1,
-1.996327, -0.2373877, -1.854788, 1, 1, 1, 1, 1,
-1.986815, -1.385625, -2.713702, 1, 1, 1, 1, 1,
-1.985625, 1.187197, 0.006969104, 1, 1, 1, 1, 1,
-1.977816, -0.1178439, -2.42154, 1, 1, 1, 1, 1,
-1.976591, 0.4666091, -3.978731, 1, 1, 1, 1, 1,
-1.969263, -1.642266, -0.9166327, 0, 0, 1, 1, 1,
-1.967695, 0.9585919, 0.05380591, 1, 0, 0, 1, 1,
-1.927743, -0.611775, -1.76087, 1, 0, 0, 1, 1,
-1.90319, 0.3353359, -0.367889, 1, 0, 0, 1, 1,
-1.831426, 0.3106205, -0.8208123, 1, 0, 0, 1, 1,
-1.82075, -0.8757505, -0.6413746, 1, 0, 0, 1, 1,
-1.814133, 0.5239639, -1.959054, 0, 0, 0, 1, 1,
-1.793398, 0.2086163, -2.752347, 0, 0, 0, 1, 1,
-1.784135, -1.412852, -3.250917, 0, 0, 0, 1, 1,
-1.77457, -1.646342, -1.843524, 0, 0, 0, 1, 1,
-1.759988, 1.199817, 0.4423312, 0, 0, 0, 1, 1,
-1.727158, -1.294264, -3.650043, 0, 0, 0, 1, 1,
-1.725551, -0.865843, -1.900121, 0, 0, 0, 1, 1,
-1.717261, 0.4456, -1.291897, 1, 1, 1, 1, 1,
-1.708797, -1.160341, -1.678798, 1, 1, 1, 1, 1,
-1.699032, -0.328089, -3.255304, 1, 1, 1, 1, 1,
-1.682985, 0.3822416, -0.6675386, 1, 1, 1, 1, 1,
-1.675309, -0.4614562, -2.572777, 1, 1, 1, 1, 1,
-1.67189, 0.5822701, -0.3223011, 1, 1, 1, 1, 1,
-1.667058, -1.463198, -1.297128, 1, 1, 1, 1, 1,
-1.665774, -0.4904399, -1.847824, 1, 1, 1, 1, 1,
-1.665047, -0.9133901, -1.311267, 1, 1, 1, 1, 1,
-1.661077, -1.380433, -1.862538, 1, 1, 1, 1, 1,
-1.647789, 0.1519853, -2.234509, 1, 1, 1, 1, 1,
-1.640468, -0.05342963, -0.1403373, 1, 1, 1, 1, 1,
-1.639599, 1.949877, -2.306785, 1, 1, 1, 1, 1,
-1.597422, -0.2432155, -0.4351548, 1, 1, 1, 1, 1,
-1.575231, -0.6168186, -3.310412, 1, 1, 1, 1, 1,
-1.551993, -1.074229, -3.284204, 0, 0, 1, 1, 1,
-1.542964, 1.728833, -1.030654, 1, 0, 0, 1, 1,
-1.541165, 1.359284, 0.7564873, 1, 0, 0, 1, 1,
-1.527036, -1.587239, -0.6086249, 1, 0, 0, 1, 1,
-1.507532, -1.891065, -2.335485, 1, 0, 0, 1, 1,
-1.50423, 0.5716903, -2.829201, 1, 0, 0, 1, 1,
-1.500055, -0.3668946, 0.8295949, 0, 0, 0, 1, 1,
-1.473538, 0.5644856, -0.2447809, 0, 0, 0, 1, 1,
-1.472689, -0.5008006, -1.402496, 0, 0, 0, 1, 1,
-1.469316, 0.9444354, -0.194793, 0, 0, 0, 1, 1,
-1.460191, -0.02331066, -1.192099, 0, 0, 0, 1, 1,
-1.451981, 1.040381, -3.00736, 0, 0, 0, 1, 1,
-1.446054, 0.04744179, -0.5699846, 0, 0, 0, 1, 1,
-1.429087, 0.474507, -0.9549407, 1, 1, 1, 1, 1,
-1.417878, -0.9997457, -3.547967, 1, 1, 1, 1, 1,
-1.416478, 0.3705965, -4.812413, 1, 1, 1, 1, 1,
-1.412409, -0.9918478, -2.229162, 1, 1, 1, 1, 1,
-1.412099, -0.3501359, -0.9101735, 1, 1, 1, 1, 1,
-1.395353, -1.086513, -1.373991, 1, 1, 1, 1, 1,
-1.392007, -0.5737275, -0.3013168, 1, 1, 1, 1, 1,
-1.381087, 1.100792, -0.4605091, 1, 1, 1, 1, 1,
-1.372209, 1.56274, -0.06841029, 1, 1, 1, 1, 1,
-1.357724, 0.6800052, -1.510163, 1, 1, 1, 1, 1,
-1.350151, 0.6021703, -2.095695, 1, 1, 1, 1, 1,
-1.343188, 0.3659565, -3.505238, 1, 1, 1, 1, 1,
-1.337837, -0.4273439, -2.44821, 1, 1, 1, 1, 1,
-1.324829, -0.2704166, -1.909138, 1, 1, 1, 1, 1,
-1.324107, 0.5072354, -0.6362359, 1, 1, 1, 1, 1,
-1.319008, -0.9944069, -1.40984, 0, 0, 1, 1, 1,
-1.311401, 0.3113077, -1.449033, 1, 0, 0, 1, 1,
-1.30837, -0.6162758, -1.570554, 1, 0, 0, 1, 1,
-1.307394, -0.7366118, -1.572693, 1, 0, 0, 1, 1,
-1.304141, -1.284246, -2.688924, 1, 0, 0, 1, 1,
-1.2959, -0.5045335, -1.422541, 1, 0, 0, 1, 1,
-1.286821, -0.2484847, -1.289147, 0, 0, 0, 1, 1,
-1.281624, 0.2251835, -1.341657, 0, 0, 0, 1, 1,
-1.280443, 1.296492, -1.088258, 0, 0, 0, 1, 1,
-1.278262, 0.8207272, -0.6673805, 0, 0, 0, 1, 1,
-1.269956, 0.4023268, -1.180967, 0, 0, 0, 1, 1,
-1.267971, -1.092837, -2.673146, 0, 0, 0, 1, 1,
-1.266193, 0.8317347, -0.3770534, 0, 0, 0, 1, 1,
-1.256834, -0.610961, -2.547084, 1, 1, 1, 1, 1,
-1.256291, 0.9279175, -0.8924644, 1, 1, 1, 1, 1,
-1.249661, 0.6412814, -2.101973, 1, 1, 1, 1, 1,
-1.241906, 1.024687, -0.4212869, 1, 1, 1, 1, 1,
-1.239098, 2.504979, 0.173694, 1, 1, 1, 1, 1,
-1.230971, -1.264708, -2.533631, 1, 1, 1, 1, 1,
-1.224864, -0.2827963, -1.250769, 1, 1, 1, 1, 1,
-1.224531, 1.871188, 0.1865017, 1, 1, 1, 1, 1,
-1.212569, 1.384037, -0.6884821, 1, 1, 1, 1, 1,
-1.209783, 1.417613, -0.4515308, 1, 1, 1, 1, 1,
-1.204854, -0.9605082, -1.930528, 1, 1, 1, 1, 1,
-1.203062, 0.1101539, -1.557034, 1, 1, 1, 1, 1,
-1.192128, -1.083626, -0.2882272, 1, 1, 1, 1, 1,
-1.188118, -0.4866326, -0.7320078, 1, 1, 1, 1, 1,
-1.184506, -0.6584383, -1.419485, 1, 1, 1, 1, 1,
-1.183094, 1.179842, -2.508459, 0, 0, 1, 1, 1,
-1.181752, -0.9687879, -2.29582, 1, 0, 0, 1, 1,
-1.176486, 0.7498014, -1.100025, 1, 0, 0, 1, 1,
-1.173121, -0.1612068, -2.978225, 1, 0, 0, 1, 1,
-1.171713, -0.009619597, -3.24783, 1, 0, 0, 1, 1,
-1.165641, 0.6826857, -1.346832, 1, 0, 0, 1, 1,
-1.152229, 0.03401179, -0.9502752, 0, 0, 0, 1, 1,
-1.149732, -2.306577, -2.204452, 0, 0, 0, 1, 1,
-1.13931, 0.9469465, -1.278096, 0, 0, 0, 1, 1,
-1.13832, 0.5636238, -2.107398, 0, 0, 0, 1, 1,
-1.13516, 0.797437, -0.9701976, 0, 0, 0, 1, 1,
-1.131301, -1.041807, -4.02472, 0, 0, 0, 1, 1,
-1.120137, 1.227726, -1.668224, 0, 0, 0, 1, 1,
-1.117395, 0.6285222, 0.5362932, 1, 1, 1, 1, 1,
-1.117044, 0.3339036, 0.1772702, 1, 1, 1, 1, 1,
-1.105957, -1.594951, -4.335063, 1, 1, 1, 1, 1,
-1.099463, -0.4165039, -1.198856, 1, 1, 1, 1, 1,
-1.091216, -0.4725274, -1.951883, 1, 1, 1, 1, 1,
-1.088241, 1.136321, -0.1412544, 1, 1, 1, 1, 1,
-1.071031, -1.198957, -3.09261, 1, 1, 1, 1, 1,
-1.064205, 1.622372, -0.4858602, 1, 1, 1, 1, 1,
-1.061319, -1.520625, -2.883229, 1, 1, 1, 1, 1,
-1.05967, 0.7017136, -0.5163623, 1, 1, 1, 1, 1,
-1.048382, -0.3909233, -2.258563, 1, 1, 1, 1, 1,
-1.046108, -0.2181694, -2.164138, 1, 1, 1, 1, 1,
-1.038588, 1.185343, 0.7518623, 1, 1, 1, 1, 1,
-1.038236, 1.041371, -0.05295014, 1, 1, 1, 1, 1,
-1.03016, 0.7633267, 1.151585, 1, 1, 1, 1, 1,
-1.028806, -0.5410361, -2.742402, 0, 0, 1, 1, 1,
-1.028638, 0.1628525, -0.9207026, 1, 0, 0, 1, 1,
-1.026339, -1.021061, -0.9981174, 1, 0, 0, 1, 1,
-1.024219, -0.080735, -1.480323, 1, 0, 0, 1, 1,
-1.023548, 0.9666317, -0.4354998, 1, 0, 0, 1, 1,
-1.019142, 3.136932, -0.2607306, 1, 0, 0, 1, 1,
-1.011943, -1.135567, -2.471684, 0, 0, 0, 1, 1,
-1.011344, 1.277878, -2.262236, 0, 0, 0, 1, 1,
-1.011103, 1.509825, -0.3569592, 0, 0, 0, 1, 1,
-1.010584, -0.03557306, -2.524442, 0, 0, 0, 1, 1,
-0.998262, -0.3524664, -0.4437734, 0, 0, 0, 1, 1,
-0.9967827, 1.062268, 0.01530938, 0, 0, 0, 1, 1,
-0.9899201, 0.5483471, 1.722501, 0, 0, 0, 1, 1,
-0.9789895, -1.059091, -1.709984, 1, 1, 1, 1, 1,
-0.975411, 1.971385, 0.5941833, 1, 1, 1, 1, 1,
-0.9753156, -0.4316131, -2.499064, 1, 1, 1, 1, 1,
-0.9748283, -1.900404, -3.42942, 1, 1, 1, 1, 1,
-0.9736139, 1.104269, -0.6731082, 1, 1, 1, 1, 1,
-0.9700173, -0.119618, -2.278542, 1, 1, 1, 1, 1,
-0.9678695, -1.393105, -1.91317, 1, 1, 1, 1, 1,
-0.9633465, -1.255238, -1.795122, 1, 1, 1, 1, 1,
-0.9616582, -0.2077814, -2.899368, 1, 1, 1, 1, 1,
-0.959279, 0.1382052, -1.029971, 1, 1, 1, 1, 1,
-0.9544289, 0.0161169, -2.095316, 1, 1, 1, 1, 1,
-0.950524, -1.927944, -2.888227, 1, 1, 1, 1, 1,
-0.9494308, -2.134889, -2.077115, 1, 1, 1, 1, 1,
-0.9475523, -0.1729383, -3.179584, 1, 1, 1, 1, 1,
-0.9438431, 0.04671735, 0.2630738, 1, 1, 1, 1, 1,
-0.9405999, 0.23511, 0.9723428, 0, 0, 1, 1, 1,
-0.9393889, -0.2782239, -0.1930906, 1, 0, 0, 1, 1,
-0.9367726, -1.53368, -3.254831, 1, 0, 0, 1, 1,
-0.9363206, -0.2478322, -0.5323174, 1, 0, 0, 1, 1,
-0.9310085, 1.090485, -0.08473791, 1, 0, 0, 1, 1,
-0.9282927, -0.8681996, -2.818338, 1, 0, 0, 1, 1,
-0.9239301, 1.575165, -0.9455449, 0, 0, 0, 1, 1,
-0.920266, 0.6689397, -0.2977011, 0, 0, 0, 1, 1,
-0.9163949, 0.2969074, -2.299287, 0, 0, 0, 1, 1,
-0.9068348, 0.1107206, -2.821347, 0, 0, 0, 1, 1,
-0.9002495, -1.970884, -1.847613, 0, 0, 0, 1, 1,
-0.8992836, 1.623229, 0.2492866, 0, 0, 0, 1, 1,
-0.8899503, 0.4828074, -1.330492, 0, 0, 0, 1, 1,
-0.8805048, -0.9493173, -2.953021, 1, 1, 1, 1, 1,
-0.8802065, -0.3447373, -1.561229, 1, 1, 1, 1, 1,
-0.878138, -0.1144156, -0.311098, 1, 1, 1, 1, 1,
-0.8739766, -1.061043, -1.842579, 1, 1, 1, 1, 1,
-0.8684325, -0.9595314, -2.968575, 1, 1, 1, 1, 1,
-0.8678157, -0.3986695, 0.09778773, 1, 1, 1, 1, 1,
-0.8677781, 0.539849, -1.200163, 1, 1, 1, 1, 1,
-0.8666276, 1.277756, -1.724989, 1, 1, 1, 1, 1,
-0.8665144, 1.060265, -1.838522, 1, 1, 1, 1, 1,
-0.8635021, -0.5501742, -1.713912, 1, 1, 1, 1, 1,
-0.8623694, 1.132818, -0.3982979, 1, 1, 1, 1, 1,
-0.8557117, -1.444511, -2.484854, 1, 1, 1, 1, 1,
-0.8487425, 0.2685752, -0.6220281, 1, 1, 1, 1, 1,
-0.847257, 0.3433616, -2.071873, 1, 1, 1, 1, 1,
-0.8369161, 0.9796456, -2.620961, 1, 1, 1, 1, 1,
-0.8353851, 2.489317, 0.428746, 0, 0, 1, 1, 1,
-0.8326579, 1.757104, 1.157803, 1, 0, 0, 1, 1,
-0.8312129, 0.5446719, 0.602809, 1, 0, 0, 1, 1,
-0.8272894, -0.8904232, -3.05595, 1, 0, 0, 1, 1,
-0.8237581, 1.725406, -0.8511819, 1, 0, 0, 1, 1,
-0.8178819, -1.403674, -2.146073, 1, 0, 0, 1, 1,
-0.8087758, 0.5365823, -0.5908245, 0, 0, 0, 1, 1,
-0.8087463, 0.2175381, -1.330973, 0, 0, 0, 1, 1,
-0.8051128, -0.8360077, -3.50896, 0, 0, 0, 1, 1,
-0.8036737, 1.034985, -0.6351823, 0, 0, 0, 1, 1,
-0.7984922, -0.4093701, -3.839093, 0, 0, 0, 1, 1,
-0.7955054, -0.2441005, -1.759906, 0, 0, 0, 1, 1,
-0.7896553, 0.2079911, -0.3552895, 0, 0, 0, 1, 1,
-0.7836656, -0.4196196, -3.185038, 1, 1, 1, 1, 1,
-0.7770203, 0.1420277, -0.301145, 1, 1, 1, 1, 1,
-0.7764427, -2.047599, -0.9559534, 1, 1, 1, 1, 1,
-0.7759063, -0.6786638, -1.253492, 1, 1, 1, 1, 1,
-0.7757261, 1.182879, -1.240336, 1, 1, 1, 1, 1,
-0.7727509, 0.1748145, -1.091634, 1, 1, 1, 1, 1,
-0.7714756, 1.826525, -1.316647, 1, 1, 1, 1, 1,
-0.7692829, -1.619265, -3.599867, 1, 1, 1, 1, 1,
-0.7678782, -1.981995, -2.988428, 1, 1, 1, 1, 1,
-0.7651605, -1.918678, -1.555946, 1, 1, 1, 1, 1,
-0.7646863, -0.2047711, -4.420738, 1, 1, 1, 1, 1,
-0.7628194, 0.8751073, -0.1166567, 1, 1, 1, 1, 1,
-0.757318, -0.4220842, -1.773652, 1, 1, 1, 1, 1,
-0.7537, 0.1217378, -1.020215, 1, 1, 1, 1, 1,
-0.7459053, 1.058816, 0.5748205, 1, 1, 1, 1, 1,
-0.7409094, -0.1109776, -1.990108, 0, 0, 1, 1, 1,
-0.737901, -0.7689368, -2.870567, 1, 0, 0, 1, 1,
-0.7370655, -0.02626061, 1.236207, 1, 0, 0, 1, 1,
-0.7339175, -0.8434012, -3.485109, 1, 0, 0, 1, 1,
-0.7253118, -0.02781715, -2.707646, 1, 0, 0, 1, 1,
-0.7243612, 0.5948122, -0.1181444, 1, 0, 0, 1, 1,
-0.7211159, 0.8312649, -2.872344, 0, 0, 0, 1, 1,
-0.7193927, 0.5216807, -1.114572, 0, 0, 0, 1, 1,
-0.7146772, -0.05521514, -1.860559, 0, 0, 0, 1, 1,
-0.7118028, -1.5702, -4.519821, 0, 0, 0, 1, 1,
-0.7091545, 1.324188, 0.6434925, 0, 0, 0, 1, 1,
-0.7066496, -0.2816791, -2.790627, 0, 0, 0, 1, 1,
-0.7052316, 0.6391371, -0.2452419, 0, 0, 0, 1, 1,
-0.7049885, -1.887572, -2.326992, 1, 1, 1, 1, 1,
-0.6998664, -0.3679017, -1.692333, 1, 1, 1, 1, 1,
-0.6990746, -0.4491189, -4.210204, 1, 1, 1, 1, 1,
-0.6918642, 0.4816923, -1.013982, 1, 1, 1, 1, 1,
-0.6859452, -0.6629982, -2.343132, 1, 1, 1, 1, 1,
-0.685289, 0.08133844, -2.977288, 1, 1, 1, 1, 1,
-0.6805129, 0.0209957, 0.07079775, 1, 1, 1, 1, 1,
-0.6741921, -1.048421, -1.543146, 1, 1, 1, 1, 1,
-0.6737462, 1.789758, -1.413575, 1, 1, 1, 1, 1,
-0.6697239, 0.7347196, -0.9878486, 1, 1, 1, 1, 1,
-0.6681854, -1.081688, -1.919173, 1, 1, 1, 1, 1,
-0.6610878, -0.5799928, -0.8902872, 1, 1, 1, 1, 1,
-0.6604185, -0.1532965, -1.283582, 1, 1, 1, 1, 1,
-0.6590969, -0.7795461, -1.135244, 1, 1, 1, 1, 1,
-0.6547766, 0.3671498, 0.1662468, 1, 1, 1, 1, 1,
-0.6539592, 1.341618, -1.674453, 0, 0, 1, 1, 1,
-0.6511185, -0.3927989, -0.8104333, 1, 0, 0, 1, 1,
-0.6472333, -0.4048671, -1.435769, 1, 0, 0, 1, 1,
-0.6398193, -1.072426, -1.842822, 1, 0, 0, 1, 1,
-0.638285, -0.3818288, -2.281929, 1, 0, 0, 1, 1,
-0.6372582, -0.8575249, -1.656623, 1, 0, 0, 1, 1,
-0.6372094, -0.146882, 0.1721925, 0, 0, 0, 1, 1,
-0.6339788, -1.380747, -2.379324, 0, 0, 0, 1, 1,
-0.6281915, -0.02511066, -2.031328, 0, 0, 0, 1, 1,
-0.6272784, -1.551331, -3.666011, 0, 0, 0, 1, 1,
-0.6215508, -0.9808039, -1.619184, 0, 0, 0, 1, 1,
-0.6206903, -0.4144757, -0.5705004, 0, 0, 0, 1, 1,
-0.6160895, 0.1193855, -1.999117, 0, 0, 0, 1, 1,
-0.6140099, -1.314787, -3.50491, 1, 1, 1, 1, 1,
-0.6127623, -1.264575, -1.857412, 1, 1, 1, 1, 1,
-0.6103789, -1.02655, -2.003573, 1, 1, 1, 1, 1,
-0.6056593, -1.331016, -3.230064, 1, 1, 1, 1, 1,
-0.6043144, 0.3349265, -3.40874, 1, 1, 1, 1, 1,
-0.5990774, 1.38379, -1.431036, 1, 1, 1, 1, 1,
-0.5818775, 0.3255253, -2.417877, 1, 1, 1, 1, 1,
-0.5788273, 0.3249729, -0.759537, 1, 1, 1, 1, 1,
-0.5774345, -0.7044459, -1.756322, 1, 1, 1, 1, 1,
-0.5772154, 0.1952898, -1.420029, 1, 1, 1, 1, 1,
-0.5667921, 0.1953129, -3.000404, 1, 1, 1, 1, 1,
-0.5534691, 0.3434628, -2.803213, 1, 1, 1, 1, 1,
-0.551764, -1.125893, -2.477823, 1, 1, 1, 1, 1,
-0.5503566, -0.460605, -0.7065468, 1, 1, 1, 1, 1,
-0.5495543, -1.098743, -2.13162, 1, 1, 1, 1, 1,
-0.5492405, -0.7881061, -2.40805, 0, 0, 1, 1, 1,
-0.5416103, 1.228934, -0.2914644, 1, 0, 0, 1, 1,
-0.5379831, 0.3667003, -1.331121, 1, 0, 0, 1, 1,
-0.5337538, 0.5008639, -1.137075, 1, 0, 0, 1, 1,
-0.526054, -0.4932169, -2.54535, 1, 0, 0, 1, 1,
-0.5247645, -1.146182, -3.049842, 1, 0, 0, 1, 1,
-0.5191459, 0.1343084, -1.119947, 0, 0, 0, 1, 1,
-0.5175691, -1.147834, 0.2782564, 0, 0, 0, 1, 1,
-0.5131574, 0.06956017, -1.831789, 0, 0, 0, 1, 1,
-0.5121364, 0.1698846, -1.187409, 0, 0, 0, 1, 1,
-0.50801, 0.042325, -2.43061, 0, 0, 0, 1, 1,
-0.5036346, 0.1212097, -0.23176, 0, 0, 0, 1, 1,
-0.5016637, 0.9207531, -0.2238819, 0, 0, 0, 1, 1,
-0.4931902, -0.6120412, -1.546017, 1, 1, 1, 1, 1,
-0.4920808, -2.720618, -1.919146, 1, 1, 1, 1, 1,
-0.4847822, -0.2691984, -2.916, 1, 1, 1, 1, 1,
-0.48322, -1.056311, -1.33351, 1, 1, 1, 1, 1,
-0.4758777, 0.7535334, 0.08354943, 1, 1, 1, 1, 1,
-0.4753395, -0.2164565, -3.034914, 1, 1, 1, 1, 1,
-0.4739876, -0.546684, -2.102586, 1, 1, 1, 1, 1,
-0.4718074, 1.1183, 0.07336467, 1, 1, 1, 1, 1,
-0.4698768, -0.7931324, -4.282472, 1, 1, 1, 1, 1,
-0.4685835, -1.477067, -2.665634, 1, 1, 1, 1, 1,
-0.4635766, 0.5792948, -1.400973, 1, 1, 1, 1, 1,
-0.4634905, -2.035097, -4.350715, 1, 1, 1, 1, 1,
-0.4617625, -0.8675398, -3.690835, 1, 1, 1, 1, 1,
-0.4602282, -0.8814995, -1.232427, 1, 1, 1, 1, 1,
-0.4592769, 0.7671398, -2.303541, 1, 1, 1, 1, 1,
-0.4543996, 1.323342, -0.992931, 0, 0, 1, 1, 1,
-0.4524797, -0.5758468, -3.662164, 1, 0, 0, 1, 1,
-0.443415, -0.27942, -1.459612, 1, 0, 0, 1, 1,
-0.4431464, -1.011461, -1.894982, 1, 0, 0, 1, 1,
-0.4428213, 1.692153, 0.1779117, 1, 0, 0, 1, 1,
-0.4418554, 0.1452839, -0.4013401, 1, 0, 0, 1, 1,
-0.4358776, -0.6251701, -2.328855, 0, 0, 0, 1, 1,
-0.4315265, -1.048151, -2.337908, 0, 0, 0, 1, 1,
-0.4250361, 0.5214015, -1.141567, 0, 0, 0, 1, 1,
-0.4214025, 0.9142394, -0.4112917, 0, 0, 0, 1, 1,
-0.4201413, -1.010274, -4.347795, 0, 0, 0, 1, 1,
-0.4166631, 0.9148601, -0.09862762, 0, 0, 0, 1, 1,
-0.4136972, -0.04933752, -1.191558, 0, 0, 0, 1, 1,
-0.4118767, -0.9284301, -2.30533, 1, 1, 1, 1, 1,
-0.4105951, 0.7179068, -1.080135, 1, 1, 1, 1, 1,
-0.408212, 0.5565836, 1.033598, 1, 1, 1, 1, 1,
-0.4071118, 2.101966, -0.4266438, 1, 1, 1, 1, 1,
-0.3986895, 0.9204218, -0.5014801, 1, 1, 1, 1, 1,
-0.3982016, -1.571316, -4.076475, 1, 1, 1, 1, 1,
-0.3978401, -0.2489891, -3.45077, 1, 1, 1, 1, 1,
-0.3970197, 1.528726, -0.8944997, 1, 1, 1, 1, 1,
-0.3964104, 0.2014546, -0.8202653, 1, 1, 1, 1, 1,
-0.3947346, -0.853762, -3.213875, 1, 1, 1, 1, 1,
-0.3827414, 1.102781, 0.1435388, 1, 1, 1, 1, 1,
-0.3807693, 0.2472063, -0.3175244, 1, 1, 1, 1, 1,
-0.3786159, -0.9139737, -0.9273635, 1, 1, 1, 1, 1,
-0.3784945, 1.922359, -0.5278388, 1, 1, 1, 1, 1,
-0.3754759, 1.669329, -1.078489, 1, 1, 1, 1, 1,
-0.3745937, -0.4037226, -3.106997, 0, 0, 1, 1, 1,
-0.3743902, -0.8411958, -3.1045, 1, 0, 0, 1, 1,
-0.3690118, -1.056353, -2.756663, 1, 0, 0, 1, 1,
-0.3618615, -1.857514, -2.422175, 1, 0, 0, 1, 1,
-0.3593356, 0.917841, -0.1177105, 1, 0, 0, 1, 1,
-0.3427734, 0.085455, -1.361404, 1, 0, 0, 1, 1,
-0.3361962, -0.9112859, -3.70774, 0, 0, 0, 1, 1,
-0.3336879, -1.361842, -3.396189, 0, 0, 0, 1, 1,
-0.331008, 1.00411, -1.074386, 0, 0, 0, 1, 1,
-0.3309621, 1.423794, 1.326297, 0, 0, 0, 1, 1,
-0.3306418, 1.633929, 1.005128, 0, 0, 0, 1, 1,
-0.3280533, -0.5982528, -1.593386, 0, 0, 0, 1, 1,
-0.3280179, -0.8609117, -2.382591, 0, 0, 0, 1, 1,
-0.3255445, 2.95101, 0.1029491, 1, 1, 1, 1, 1,
-0.3216315, 0.3537648, 1.218127, 1, 1, 1, 1, 1,
-0.3171017, 0.08806149, -0.03993555, 1, 1, 1, 1, 1,
-0.3158422, -0.1413013, -1.768323, 1, 1, 1, 1, 1,
-0.3157324, 0.571717, -0.8773841, 1, 1, 1, 1, 1,
-0.3156857, -1.276577, -1.840726, 1, 1, 1, 1, 1,
-0.3027436, 2.488737, -0.3535202, 1, 1, 1, 1, 1,
-0.3006626, 2.055521, -0.03641035, 1, 1, 1, 1, 1,
-0.2908732, 2.269399, 0.6951159, 1, 1, 1, 1, 1,
-0.2820163, 0.2907799, -1.66153, 1, 1, 1, 1, 1,
-0.2796435, 0.2904333, -0.2674236, 1, 1, 1, 1, 1,
-0.2781729, -2.429049, -2.58488, 1, 1, 1, 1, 1,
-0.2735734, -1.653852, -1.767596, 1, 1, 1, 1, 1,
-0.2732627, 0.7646499, -0.847689, 1, 1, 1, 1, 1,
-0.2632912, 0.4937265, -1.118253, 1, 1, 1, 1, 1,
-0.2631258, -0.5038915, -0.4998839, 0, 0, 1, 1, 1,
-0.2573678, -0.6636609, -1.561756, 1, 0, 0, 1, 1,
-0.255301, -1.375182, -2.359622, 1, 0, 0, 1, 1,
-0.2537037, -0.6423244, -1.644455, 1, 0, 0, 1, 1,
-0.2513864, 1.025066, -1.144553, 1, 0, 0, 1, 1,
-0.2452254, 0.1712475, -0.8053184, 1, 0, 0, 1, 1,
-0.245198, 1.36228, -1.858538, 0, 0, 0, 1, 1,
-0.2428471, -0.4808323, -0.2202302, 0, 0, 0, 1, 1,
-0.2422004, 0.5957488, 0.6335713, 0, 0, 0, 1, 1,
-0.2419805, 1.380894, 1.566328, 0, 0, 0, 1, 1,
-0.2407389, 0.6966601, -1.248159, 0, 0, 0, 1, 1,
-0.2387464, -0.941645, -0.8132059, 0, 0, 0, 1, 1,
-0.2386796, -0.02875283, -1.940278, 0, 0, 0, 1, 1,
-0.2343275, -0.1844967, -2.24197, 1, 1, 1, 1, 1,
-0.2341033, 0.605135, 0.4821846, 1, 1, 1, 1, 1,
-0.2308883, 0.03484336, -1.130223, 1, 1, 1, 1, 1,
-0.2307477, -0.4764755, -3.247868, 1, 1, 1, 1, 1,
-0.2286682, 0.3746641, -0.3279001, 1, 1, 1, 1, 1,
-0.2237031, -0.5362245, -0.6192123, 1, 1, 1, 1, 1,
-0.2165678, 0.02355943, -2.787402, 1, 1, 1, 1, 1,
-0.2159559, -1.713294, -3.199644, 1, 1, 1, 1, 1,
-0.2158286, 0.2388379, -1.643157, 1, 1, 1, 1, 1,
-0.2142927, 0.4694627, -3.121051, 1, 1, 1, 1, 1,
-0.2108931, -0.3695898, -2.058183, 1, 1, 1, 1, 1,
-0.2103691, 0.7413328, -2.534422, 1, 1, 1, 1, 1,
-0.2064941, -1.259075, -4.046825, 1, 1, 1, 1, 1,
-0.2049687, -0.862078, -4.235603, 1, 1, 1, 1, 1,
-0.2029208, -0.07271449, -1.516765, 1, 1, 1, 1, 1,
-0.1994224, -0.2591286, -2.196743, 0, 0, 1, 1, 1,
-0.1984467, 0.8661186, 0.9784434, 1, 0, 0, 1, 1,
-0.1978593, -0.5665947, -2.600444, 1, 0, 0, 1, 1,
-0.1971143, 0.5329705, 2.391755, 1, 0, 0, 1, 1,
-0.1965589, -0.1649939, -3.013646, 1, 0, 0, 1, 1,
-0.1944338, 0.2572452, -1.820706, 1, 0, 0, 1, 1,
-0.1935127, 1.493149, -0.2631125, 0, 0, 0, 1, 1,
-0.1927279, 0.4907445, -1.159688, 0, 0, 0, 1, 1,
-0.1926965, -0.9625689, -2.723819, 0, 0, 0, 1, 1,
-0.1895038, -0.4394588, -2.92671, 0, 0, 0, 1, 1,
-0.1894812, -1.390761, -1.237521, 0, 0, 0, 1, 1,
-0.1848658, -1.443843, -5.186123, 0, 0, 0, 1, 1,
-0.184141, -0.4405446, -4.270399, 0, 0, 0, 1, 1,
-0.1836741, -0.2914864, -1.031178, 1, 1, 1, 1, 1,
-0.1787622, 1.41745, -0.2651884, 1, 1, 1, 1, 1,
-0.1785555, -0.8272318, -2.54606, 1, 1, 1, 1, 1,
-0.1763226, -0.7167222, -3.980872, 1, 1, 1, 1, 1,
-0.176153, 0.9677343, -0.1158587, 1, 1, 1, 1, 1,
-0.1691757, -0.04526967, -1.862255, 1, 1, 1, 1, 1,
-0.1649564, -1.677948, -3.650948, 1, 1, 1, 1, 1,
-0.1631357, 0.108511, -0.9176036, 1, 1, 1, 1, 1,
-0.1588265, 0.530099, -0.9002369, 1, 1, 1, 1, 1,
-0.1566207, -0.174309, -3.292274, 1, 1, 1, 1, 1,
-0.1530265, 0.58216, -2.474024, 1, 1, 1, 1, 1,
-0.1472232, 0.4267195, -0.3974797, 1, 1, 1, 1, 1,
-0.1445096, 0.6283821, -0.6373255, 1, 1, 1, 1, 1,
-0.1388996, 1.963143, -0.4681328, 1, 1, 1, 1, 1,
-0.1360925, -1.417074, -2.14831, 1, 1, 1, 1, 1,
-0.1350785, 1.004301, -1.909585, 0, 0, 1, 1, 1,
-0.1296039, -0.01471788, -2.400202, 1, 0, 0, 1, 1,
-0.1270756, -0.6357778, -3.900076, 1, 0, 0, 1, 1,
-0.1263541, 0.153859, -0.3802379, 1, 0, 0, 1, 1,
-0.12215, -0.996617, -2.216324, 1, 0, 0, 1, 1,
-0.1220221, -1.458511, -1.918364, 1, 0, 0, 1, 1,
-0.1206367, -1.391699, -2.01189, 0, 0, 0, 1, 1,
-0.1185549, 0.4523369, 0.7942361, 0, 0, 0, 1, 1,
-0.1154526, 0.8686891, -1.036426, 0, 0, 0, 1, 1,
-0.1094321, 0.35271, -1.114471, 0, 0, 0, 1, 1,
-0.108608, -0.6696658, -2.135168, 0, 0, 0, 1, 1,
-0.1015003, -0.2962058, -3.81872, 0, 0, 0, 1, 1,
-0.1009893, -0.01238099, -1.335203, 0, 0, 0, 1, 1,
-0.1006165, 0.5205288, -0.224742, 1, 1, 1, 1, 1,
-0.09892382, -1.326304, -3.938499, 1, 1, 1, 1, 1,
-0.09705151, -0.1335863, -1.813542, 1, 1, 1, 1, 1,
-0.09621542, -0.7634038, -1.54264, 1, 1, 1, 1, 1,
-0.09322202, 0.6528345, 0.1293775, 1, 1, 1, 1, 1,
-0.08737336, -0.3853903, -4.210292, 1, 1, 1, 1, 1,
-0.0871326, -0.02512066, -1.93221, 1, 1, 1, 1, 1,
-0.08653745, -1.27327, -1.527384, 1, 1, 1, 1, 1,
-0.08270451, 0.4465115, 0.1876544, 1, 1, 1, 1, 1,
-0.08250892, 1.032475, 0.3484863, 1, 1, 1, 1, 1,
-0.0822438, -0.2449913, -2.476647, 1, 1, 1, 1, 1,
-0.08001216, 0.4808483, 0.3902169, 1, 1, 1, 1, 1,
-0.0795281, 0.06269588, 0.8579476, 1, 1, 1, 1, 1,
-0.07750222, -2.374065, -4.084713, 1, 1, 1, 1, 1,
-0.07414277, 0.9445781, 0.691349, 1, 1, 1, 1, 1,
-0.07210407, -0.1588659, -2.954078, 0, 0, 1, 1, 1,
-0.07203291, -0.5592064, -3.525115, 1, 0, 0, 1, 1,
-0.06303083, 0.5389993, -0.8304574, 1, 0, 0, 1, 1,
-0.05690785, -0.3372459, -1.957117, 1, 0, 0, 1, 1,
-0.05187067, -1.215624, -2.782698, 1, 0, 0, 1, 1,
-0.05151061, -2.09502, -4.085517, 1, 0, 0, 1, 1,
-0.05042097, -1.165551, -3.438331, 0, 0, 0, 1, 1,
-0.04953777, 0.7254505, -0.1381203, 0, 0, 0, 1, 1,
-0.0492276, -0.03162578, -2.160789, 0, 0, 0, 1, 1,
-0.04916655, 0.1081345, -0.2639887, 0, 0, 0, 1, 1,
-0.04896491, 0.7448021, -0.2296812, 0, 0, 0, 1, 1,
-0.04785213, 0.8071593, -0.3648238, 0, 0, 0, 1, 1,
-0.04753374, -1.772608, -3.877182, 0, 0, 0, 1, 1,
-0.04550437, 1.85392, 1.300932, 1, 1, 1, 1, 1,
-0.04316041, -0.9987516, -4.816352, 1, 1, 1, 1, 1,
-0.04240912, 0.6485979, -1.376473, 1, 1, 1, 1, 1,
-0.04235895, 0.3774801, 0.4052958, 1, 1, 1, 1, 1,
-0.03593143, -0.3276356, -2.328549, 1, 1, 1, 1, 1,
-0.03538496, -0.9056995, -3.548287, 1, 1, 1, 1, 1,
-0.03380161, 0.4933282, 1.557252, 1, 1, 1, 1, 1,
-0.03285303, 0.7128981, 0.4831007, 1, 1, 1, 1, 1,
-0.03187025, -0.1805453, -3.775987, 1, 1, 1, 1, 1,
-0.02947406, 1.358155, 0.67916, 1, 1, 1, 1, 1,
-0.02927582, -0.8303602, -1.742826, 1, 1, 1, 1, 1,
-0.02891826, -1.519939, -2.801226, 1, 1, 1, 1, 1,
-0.02814701, 0.3043246, -0.2985002, 1, 1, 1, 1, 1,
-0.02609976, 0.06297603, 0.8414196, 1, 1, 1, 1, 1,
-0.02515739, 0.1855688, 0.3288392, 1, 1, 1, 1, 1,
-0.02381448, -1.071048, -3.673404, 0, 0, 1, 1, 1,
-0.02061194, -0.5854081, -1.692181, 1, 0, 0, 1, 1,
-0.02002184, -1.119823, -4.136643, 1, 0, 0, 1, 1,
-0.01990945, -0.4401951, -3.559642, 1, 0, 0, 1, 1,
-0.01093937, 0.6015105, 0.04139147, 1, 0, 0, 1, 1,
-0.009863008, 1.661332, 0.4722459, 1, 0, 0, 1, 1,
-0.002993876, 0.4697251, 0.7915503, 0, 0, 0, 1, 1,
0.0021033, -1.105893, 2.53901, 0, 0, 0, 1, 1,
0.002466207, 0.9387007, -0.6027114, 0, 0, 0, 1, 1,
0.007266892, -0.1925629, 4.087394, 0, 0, 0, 1, 1,
0.01320539, -1.583519, 3.130403, 0, 0, 0, 1, 1,
0.01648216, 0.2231529, 0.7461091, 0, 0, 0, 1, 1,
0.01727341, -0.8022232, 4.029335, 0, 0, 0, 1, 1,
0.02244308, 0.7631103, -0.44632, 1, 1, 1, 1, 1,
0.024801, 0.7416561, -2.149029, 1, 1, 1, 1, 1,
0.02766862, 0.4618475, -1.233975, 1, 1, 1, 1, 1,
0.0280238, 0.5424033, 0.6258681, 1, 1, 1, 1, 1,
0.03245965, 0.4244559, -1.246219, 1, 1, 1, 1, 1,
0.03612399, -0.268501, 2.133623, 1, 1, 1, 1, 1,
0.03678349, 0.08448783, -0.6445796, 1, 1, 1, 1, 1,
0.03978054, -0.3007455, 1.031569, 1, 1, 1, 1, 1,
0.04489597, -0.1463863, 2.618035, 1, 1, 1, 1, 1,
0.04535172, -1.379135, 3.352488, 1, 1, 1, 1, 1,
0.0465066, -0.6958521, 3.153077, 1, 1, 1, 1, 1,
0.05203835, -0.146866, 3.092061, 1, 1, 1, 1, 1,
0.05295982, 0.6607686, 0.2141127, 1, 1, 1, 1, 1,
0.05713025, 0.8136045, 1.088825, 1, 1, 1, 1, 1,
0.05939831, -1.910743, 3.630644, 1, 1, 1, 1, 1,
0.06258589, -0.1032903, 3.564501, 0, 0, 1, 1, 1,
0.07045947, 0.08995945, -0.1160014, 1, 0, 0, 1, 1,
0.07152615, -0.8730153, 2.637917, 1, 0, 0, 1, 1,
0.07255965, -0.5087308, 3.447985, 1, 0, 0, 1, 1,
0.07480142, 1.06191, -0.2600075, 1, 0, 0, 1, 1,
0.07604885, -0.3297114, 3.038901, 1, 0, 0, 1, 1,
0.07969102, -0.3050812, 3.522213, 0, 0, 0, 1, 1,
0.08221538, 1.485482, -0.236748, 0, 0, 0, 1, 1,
0.08277084, 0.787441, 0.0389954, 0, 0, 0, 1, 1,
0.08444219, -0.8161043, 2.2222, 0, 0, 0, 1, 1,
0.08547793, -0.7825654, 4.053856, 0, 0, 0, 1, 1,
0.08719491, 0.8582668, 0.188181, 0, 0, 0, 1, 1,
0.08896775, 0.01849515, 1.170403, 0, 0, 0, 1, 1,
0.09553254, 0.03423819, 0.5878131, 1, 1, 1, 1, 1,
0.098438, 1.298144, 0.4595584, 1, 1, 1, 1, 1,
0.0985565, -0.778826, 3.971721, 1, 1, 1, 1, 1,
0.100155, -0.5001645, 3.513417, 1, 1, 1, 1, 1,
0.1011008, 0.3239605, -0.3923566, 1, 1, 1, 1, 1,
0.1029685, -0.3761369, 3.288424, 1, 1, 1, 1, 1,
0.1112534, 0.6094537, 1.063512, 1, 1, 1, 1, 1,
0.114565, -0.2658512, 2.874609, 1, 1, 1, 1, 1,
0.1146784, 0.4175736, 0.8055583, 1, 1, 1, 1, 1,
0.1183202, -0.6285543, 4.451829, 1, 1, 1, 1, 1,
0.123871, 0.1817945, 1.583484, 1, 1, 1, 1, 1,
0.127807, 1.66432, 1.272833, 1, 1, 1, 1, 1,
0.1300784, 0.2977739, 1.114296, 1, 1, 1, 1, 1,
0.131328, 1.027626, 0.7303284, 1, 1, 1, 1, 1,
0.1318174, -0.742513, 2.909415, 1, 1, 1, 1, 1,
0.13431, 1.275198, -1.499616, 0, 0, 1, 1, 1,
0.1356729, -0.7638962, 4.079624, 1, 0, 0, 1, 1,
0.1394811, -1.453168, 2.939939, 1, 0, 0, 1, 1,
0.148503, 1.459447, -0.6005595, 1, 0, 0, 1, 1,
0.1495245, -0.1381941, 2.121121, 1, 0, 0, 1, 1,
0.1522186, 1.730591, 1.845914, 1, 0, 0, 1, 1,
0.1527329, -3.485194, 4.000934, 0, 0, 0, 1, 1,
0.1537645, -1.370266, 2.78088, 0, 0, 0, 1, 1,
0.1538012, -1.331925, 5.997178, 0, 0, 0, 1, 1,
0.1606634, 0.3207543, 0.4130009, 0, 0, 0, 1, 1,
0.1616003, 1.389497, 1.698276, 0, 0, 0, 1, 1,
0.1682983, 0.9059023, 1.682614, 0, 0, 0, 1, 1,
0.17061, 1.688099, -0.8296984, 0, 0, 0, 1, 1,
0.1729073, -1.373579, 2.146864, 1, 1, 1, 1, 1,
0.1744201, -0.2493877, 3.086865, 1, 1, 1, 1, 1,
0.1744924, 0.06258099, 4.130935, 1, 1, 1, 1, 1,
0.1794229, -1.416811, 5.952076, 1, 1, 1, 1, 1,
0.1794671, 0.4502882, -0.3162721, 1, 1, 1, 1, 1,
0.1815284, 0.0838256, 0.3574667, 1, 1, 1, 1, 1,
0.1832298, -0.238594, 4.667006, 1, 1, 1, 1, 1,
0.1841114, -1.106946, 1.861343, 1, 1, 1, 1, 1,
0.1842306, -1.940531, 2.20862, 1, 1, 1, 1, 1,
0.184732, 0.2048164, 0.5897126, 1, 1, 1, 1, 1,
0.1859647, -1.009645, 3.443528, 1, 1, 1, 1, 1,
0.1899904, 2.251692, 0.5635315, 1, 1, 1, 1, 1,
0.1901484, -1.059924, 1.717692, 1, 1, 1, 1, 1,
0.1915282, 1.819975, 1.578791, 1, 1, 1, 1, 1,
0.1944139, -1.32575, 3.927809, 1, 1, 1, 1, 1,
0.1980455, 0.2003218, 1.84576, 0, 0, 1, 1, 1,
0.1983024, 0.4231218, 1.56693, 1, 0, 0, 1, 1,
0.1988142, 1.620528, 0.7018204, 1, 0, 0, 1, 1,
0.2026979, -0.1024598, 4.30402, 1, 0, 0, 1, 1,
0.2032841, -1.413682, 2.387897, 1, 0, 0, 1, 1,
0.206948, 1.680665, 1.249326, 1, 0, 0, 1, 1,
0.2087302, -0.09256341, 2.313962, 0, 0, 0, 1, 1,
0.2096571, 1.275994, -0.007322877, 0, 0, 0, 1, 1,
0.2131714, -0.4399576, 3.424696, 0, 0, 0, 1, 1,
0.2138165, 0.2920705, -0.004892045, 0, 0, 0, 1, 1,
0.2173823, -0.07857983, 1.538239, 0, 0, 0, 1, 1,
0.2184413, 0.4040251, -0.3245577, 0, 0, 0, 1, 1,
0.2197971, -0.6362656, 2.1533, 0, 0, 0, 1, 1,
0.2214398, -0.8738984, 2.188725, 1, 1, 1, 1, 1,
0.2227016, 0.3200769, -0.8209284, 1, 1, 1, 1, 1,
0.2263423, 0.4386353, 0.3016456, 1, 1, 1, 1, 1,
0.2300162, -0.009122874, 2.156571, 1, 1, 1, 1, 1,
0.2304531, -1.048635, 2.053267, 1, 1, 1, 1, 1,
0.2306058, -0.9222082, 1.824497, 1, 1, 1, 1, 1,
0.2332053, -0.7944407, 1.237079, 1, 1, 1, 1, 1,
0.233692, -0.1515018, 3.999505, 1, 1, 1, 1, 1,
0.2364965, 1.691333, 2.230311, 1, 1, 1, 1, 1,
0.2411219, 1.406731, -0.2778634, 1, 1, 1, 1, 1,
0.2418812, 0.9853286, 1.8931, 1, 1, 1, 1, 1,
0.2424244, 0.4107479, 0.06008889, 1, 1, 1, 1, 1,
0.2444116, 0.8046386, -1.109904, 1, 1, 1, 1, 1,
0.2447309, 2.354411, 0.3417219, 1, 1, 1, 1, 1,
0.245424, -0.906793, 3.361923, 1, 1, 1, 1, 1,
0.2469173, 0.9165816, 0.1435174, 0, 0, 1, 1, 1,
0.2483833, 0.8632735, 1.219581, 1, 0, 0, 1, 1,
0.2485514, -0.431645, 3.237637, 1, 0, 0, 1, 1,
0.2507737, -0.6195375, 3.731287, 1, 0, 0, 1, 1,
0.2530601, -0.9344483, 3.985989, 1, 0, 0, 1, 1,
0.2531525, 2.068902, 0.07195953, 1, 0, 0, 1, 1,
0.2553005, 0.9919007, -0.310893, 0, 0, 0, 1, 1,
0.2557735, 2.457077, -0.7887559, 0, 0, 0, 1, 1,
0.2558874, -0.6929843, 2.475786, 0, 0, 0, 1, 1,
0.2573058, 1.187505, -0.2590235, 0, 0, 0, 1, 1,
0.2606015, 1.104956, 0.2084042, 0, 0, 0, 1, 1,
0.2630614, 0.5905802, -0.009930025, 0, 0, 0, 1, 1,
0.2644464, 1.034483, 0.6693802, 0, 0, 0, 1, 1,
0.26679, -0.50576, 3.290789, 1, 1, 1, 1, 1,
0.266957, 0.4551669, -1.059312, 1, 1, 1, 1, 1,
0.2678942, -1.25641, 1.847342, 1, 1, 1, 1, 1,
0.270128, 0.4580384, -1.385654, 1, 1, 1, 1, 1,
0.2780094, 0.9111395, 0.689814, 1, 1, 1, 1, 1,
0.2798416, -0.1017452, 1.322096, 1, 1, 1, 1, 1,
0.2849821, -1.18164, 2.169516, 1, 1, 1, 1, 1,
0.2861749, 0.3358117, 0.5083786, 1, 1, 1, 1, 1,
0.287706, -0.7773247, 2.608775, 1, 1, 1, 1, 1,
0.290433, -0.03658211, 1.27387, 1, 1, 1, 1, 1,
0.2963438, -0.313986, 3.109945, 1, 1, 1, 1, 1,
0.3033005, -0.1166513, 2.527249, 1, 1, 1, 1, 1,
0.310275, 1.133787, -0.9190176, 1, 1, 1, 1, 1,
0.3115191, 0.5951669, 0.9224331, 1, 1, 1, 1, 1,
0.31276, -1.228992, 2.437654, 1, 1, 1, 1, 1,
0.3132728, -1.371311, 2.7174, 0, 0, 1, 1, 1,
0.3139991, -0.5009686, 1.696514, 1, 0, 0, 1, 1,
0.3157389, -2.522649, 3.783746, 1, 0, 0, 1, 1,
0.316592, -0.7436655, 2.934963, 1, 0, 0, 1, 1,
0.3185295, 0.5851668, 1.590266, 1, 0, 0, 1, 1,
0.3228365, 0.3228312, 2.651478, 1, 0, 0, 1, 1,
0.3320307, -0.6969243, 3.666014, 0, 0, 0, 1, 1,
0.3324715, -2.514231, 2.908089, 0, 0, 0, 1, 1,
0.3331696, -0.9984941, 1.953476, 0, 0, 0, 1, 1,
0.3347789, 0.855269, 0.7234711, 0, 0, 0, 1, 1,
0.3403765, -1.296026, 1.737301, 0, 0, 0, 1, 1,
0.3416899, -0.1721805, 1.355546, 0, 0, 0, 1, 1,
0.3418636, 1.557663, -0.7265108, 0, 0, 0, 1, 1,
0.342288, -1.121021, 4.442429, 1, 1, 1, 1, 1,
0.3424507, -0.01042216, 2.265953, 1, 1, 1, 1, 1,
0.3447026, 0.4325712, 0.2962478, 1, 1, 1, 1, 1,
0.3455338, -0.539515, 2.486252, 1, 1, 1, 1, 1,
0.3469977, 0.1970622, 2.164005, 1, 1, 1, 1, 1,
0.3539741, -1.421317, 1.272755, 1, 1, 1, 1, 1,
0.3550526, 0.9072493, -1.63606, 1, 1, 1, 1, 1,
0.3562005, 0.06850167, 1.811592, 1, 1, 1, 1, 1,
0.3582132, -0.5298134, 2.55476, 1, 1, 1, 1, 1,
0.366307, 1.366991, -0.1078631, 1, 1, 1, 1, 1,
0.3663736, -0.5069302, 3.307559, 1, 1, 1, 1, 1,
0.3684008, -1.026416, 4.203711, 1, 1, 1, 1, 1,
0.3709483, 1.763844, -0.4423991, 1, 1, 1, 1, 1,
0.3722073, -1.758347, 4.620009, 1, 1, 1, 1, 1,
0.3723619, -1.641146, 0.7858171, 1, 1, 1, 1, 1,
0.3812067, -0.8774356, 3.013561, 0, 0, 1, 1, 1,
0.3848383, -0.532724, 1.845667, 1, 0, 0, 1, 1,
0.3941476, -0.8692666, 1.744891, 1, 0, 0, 1, 1,
0.3961608, -0.9788741, 2.627543, 1, 0, 0, 1, 1,
0.3990648, 0.7001842, 0.1776315, 1, 0, 0, 1, 1,
0.4025514, -0.2098091, 3.152407, 1, 0, 0, 1, 1,
0.4095908, 0.5005229, 1.505008, 0, 0, 0, 1, 1,
0.4099651, 0.6245517, 1.209408, 0, 0, 0, 1, 1,
0.4151317, -0.3745931, 0.3742743, 0, 0, 0, 1, 1,
0.4162341, 1.766984, 0.4371674, 0, 0, 0, 1, 1,
0.4173721, 0.940011, 0.9663481, 0, 0, 0, 1, 1,
0.4208462, -0.6951544, 3.169115, 0, 0, 0, 1, 1,
0.4210857, -0.7756198, 4.233561, 0, 0, 0, 1, 1,
0.4229628, 0.2475922, -0.03120734, 1, 1, 1, 1, 1,
0.4331366, -1.296032, 2.167235, 1, 1, 1, 1, 1,
0.4370205, -1.430419, 2.103205, 1, 1, 1, 1, 1,
0.4403089, -0.1793891, 0.9953156, 1, 1, 1, 1, 1,
0.4406691, -0.8067132, 2.400861, 1, 1, 1, 1, 1,
0.442162, -0.338041, 2.65083, 1, 1, 1, 1, 1,
0.4423259, -0.2268351, 0.8779334, 1, 1, 1, 1, 1,
0.4435246, 0.7767101, -0.2073645, 1, 1, 1, 1, 1,
0.4448668, 0.5860724, 1.79189, 1, 1, 1, 1, 1,
0.4514703, -0.2693245, 3.109283, 1, 1, 1, 1, 1,
0.453282, -0.3284035, 1.844157, 1, 1, 1, 1, 1,
0.4540929, 0.3507682, 0.6668658, 1, 1, 1, 1, 1,
0.4594168, -1.865604, 1.807071, 1, 1, 1, 1, 1,
0.4625586, -1.937099, 2.997593, 1, 1, 1, 1, 1,
0.4648623, 0.02171683, 1.448833, 1, 1, 1, 1, 1,
0.4715095, -1.218739, 1.286451, 0, 0, 1, 1, 1,
0.4780674, -1.032032, 2.815175, 1, 0, 0, 1, 1,
0.4810408, -0.6475962, 3.754107, 1, 0, 0, 1, 1,
0.4814306, 0.2829416, 1.066947, 1, 0, 0, 1, 1,
0.4834325, 0.9311402, -1.911809, 1, 0, 0, 1, 1,
0.4882679, 1.304952, -0.4508666, 1, 0, 0, 1, 1,
0.4904031, 0.5708179, 1.53972, 0, 0, 0, 1, 1,
0.4929102, -1.029498, 2.716448, 0, 0, 0, 1, 1,
0.4948107, -0.432021, 2.401761, 0, 0, 0, 1, 1,
0.4972031, -0.2540929, 2.887114, 0, 0, 0, 1, 1,
0.4996992, -1.028885, 2.284197, 0, 0, 0, 1, 1,
0.5014672, 0.0130272, 1.611137, 0, 0, 0, 1, 1,
0.5037398, 0.1337005, 0.2600649, 0, 0, 0, 1, 1,
0.5095043, 1.118355, 0.5803433, 1, 1, 1, 1, 1,
0.5105985, -0.01382745, 1.199387, 1, 1, 1, 1, 1,
0.5121766, -0.3517624, 1.005956, 1, 1, 1, 1, 1,
0.5173858, -0.9427431, 3.934812, 1, 1, 1, 1, 1,
0.5180346, 0.9215677, 0.3890954, 1, 1, 1, 1, 1,
0.5195878, 0.3888049, 0.4081073, 1, 1, 1, 1, 1,
0.5213861, 1.083819, -1.395594, 1, 1, 1, 1, 1,
0.5235771, -0.3896244, -0.6244073, 1, 1, 1, 1, 1,
0.5268059, 2.523954, 0.5302747, 1, 1, 1, 1, 1,
0.5269726, 0.1719872, 2.354412, 1, 1, 1, 1, 1,
0.5285448, -0.2733669, 1.079704, 1, 1, 1, 1, 1,
0.5348837, 0.6402655, 2.140879, 1, 1, 1, 1, 1,
0.5362768, 0.08779538, 0.4765928, 1, 1, 1, 1, 1,
0.5405195, -0.9670064, 3.232567, 1, 1, 1, 1, 1,
0.5422619, -0.009551878, 1.763088, 1, 1, 1, 1, 1,
0.5540551, -2.305766, 3.038487, 0, 0, 1, 1, 1,
0.5584689, 0.5609343, 2.061389, 1, 0, 0, 1, 1,
0.5613722, -1.39057, 3.831843, 1, 0, 0, 1, 1,
0.5625509, 0.791059, -0.2217883, 1, 0, 0, 1, 1,
0.5633684, 0.8692272, -0.07749838, 1, 0, 0, 1, 1,
0.5647257, 0.266297, 1.494548, 1, 0, 0, 1, 1,
0.5702412, 0.3237973, 1.53833, 0, 0, 0, 1, 1,
0.5711271, 0.8866619, 1.300947, 0, 0, 0, 1, 1,
0.5739868, -1.028468, 2.210974, 0, 0, 0, 1, 1,
0.5807889, 0.5542741, 0.1584712, 0, 0, 0, 1, 1,
0.5847311, -1.30825, 2.663978, 0, 0, 0, 1, 1,
0.585757, -0.6492743, 2.581626, 0, 0, 0, 1, 1,
0.5897666, 0.4270749, 1.412046, 0, 0, 0, 1, 1,
0.592292, -0.1041609, 0.2249709, 1, 1, 1, 1, 1,
0.5966115, -0.5374948, 2.572694, 1, 1, 1, 1, 1,
0.6019069, -0.2060441, 2.761065, 1, 1, 1, 1, 1,
0.6052891, -0.3123649, 1.611062, 1, 1, 1, 1, 1,
0.6054992, -0.03214163, 2.005877, 1, 1, 1, 1, 1,
0.6059749, 1.850411, -0.2066863, 1, 1, 1, 1, 1,
0.6085496, -0.8561015, 2.052753, 1, 1, 1, 1, 1,
0.6198213, -0.1235375, 2.17865, 1, 1, 1, 1, 1,
0.6217598, 0.8613244, 1.067027, 1, 1, 1, 1, 1,
0.6231182, 1.6785, 3.385736, 1, 1, 1, 1, 1,
0.6252939, -1.820484, 1.752157, 1, 1, 1, 1, 1,
0.6278054, -0.8851649, 4.338137, 1, 1, 1, 1, 1,
0.637457, 1.945918, 0.1503719, 1, 1, 1, 1, 1,
0.6470358, -1.473281, 2.56522, 1, 1, 1, 1, 1,
0.6493286, -1.34303, 2.65215, 1, 1, 1, 1, 1,
0.6494505, 0.9945787, -0.4204485, 0, 0, 1, 1, 1,
0.6506281, -0.4886439, 1.671776, 1, 0, 0, 1, 1,
0.6519495, -0.08500622, 0.1229126, 1, 0, 0, 1, 1,
0.6554318, 1.41844, 0.6711906, 1, 0, 0, 1, 1,
0.6568224, -0.008815141, -0.1572631, 1, 0, 0, 1, 1,
0.657831, 0.4294561, 2.787874, 1, 0, 0, 1, 1,
0.659134, 0.4338485, -0.623231, 0, 0, 0, 1, 1,
0.6636871, 0.4876065, 2.121421, 0, 0, 0, 1, 1,
0.6637345, -0.7444317, 2.074795, 0, 0, 0, 1, 1,
0.6646032, 1.031564, -0.0484379, 0, 0, 0, 1, 1,
0.667004, -0.5060548, 3.156638, 0, 0, 0, 1, 1,
0.6676197, -0.4198222, 3.003241, 0, 0, 0, 1, 1,
0.6710069, -1.215529, 3.668242, 0, 0, 0, 1, 1,
0.6729165, -0.945107, 2.132462, 1, 1, 1, 1, 1,
0.6761268, -0.5353061, 2.549074, 1, 1, 1, 1, 1,
0.6855884, -1.390118, 1.065531, 1, 1, 1, 1, 1,
0.6926646, -0.04713117, 2.537765, 1, 1, 1, 1, 1,
0.6928452, 0.8182414, 0.8792089, 1, 1, 1, 1, 1,
0.6960152, 1.068223, -1.888776, 1, 1, 1, 1, 1,
0.6978248, 0.2701987, 0.3267401, 1, 1, 1, 1, 1,
0.7012346, -0.3387953, 2.334649, 1, 1, 1, 1, 1,
0.702145, 1.569538, 0.1603534, 1, 1, 1, 1, 1,
0.7025741, -0.329067, 3.114912, 1, 1, 1, 1, 1,
0.7083779, -0.6420097, 2.794007, 1, 1, 1, 1, 1,
0.7109697, -0.9906893, 1.340411, 1, 1, 1, 1, 1,
0.7138664, 0.02983716, 1.417485, 1, 1, 1, 1, 1,
0.7154984, 1.61861, 0.6474331, 1, 1, 1, 1, 1,
0.7181284, -0.50825, 2.44428, 1, 1, 1, 1, 1,
0.721909, 1.768142, 0.5517226, 0, 0, 1, 1, 1,
0.7245227, 2.249753, 0.5172634, 1, 0, 0, 1, 1,
0.7253085, 0.2456185, 1.131694, 1, 0, 0, 1, 1,
0.7254305, 1.147828, -1.270553, 1, 0, 0, 1, 1,
0.7292204, 1.268983, 0.1063553, 1, 0, 0, 1, 1,
0.7300233, -0.3260395, 2.577786, 1, 0, 0, 1, 1,
0.7322791, 0.2700837, 2.060997, 0, 0, 0, 1, 1,
0.7337879, 0.1586456, 1.501508, 0, 0, 0, 1, 1,
0.7359167, -0.4001899, 1.372722, 0, 0, 0, 1, 1,
0.7370536, 0.9879874, 1.948103, 0, 0, 0, 1, 1,
0.7384423, -0.8595592, 1.937747, 0, 0, 0, 1, 1,
0.7390524, -1.601891, 3.547578, 0, 0, 0, 1, 1,
0.7391688, -1.117028, 1.823101, 0, 0, 0, 1, 1,
0.7393603, 0.6498756, 0.5746819, 1, 1, 1, 1, 1,
0.7400646, 0.6817738, 0.1656936, 1, 1, 1, 1, 1,
0.7408526, 1.627322, -0.5965718, 1, 1, 1, 1, 1,
0.7427613, 0.7073396, 0.1006906, 1, 1, 1, 1, 1,
0.749441, 0.459558, 0.4630058, 1, 1, 1, 1, 1,
0.7522554, 0.453, 0.1974516, 1, 1, 1, 1, 1,
0.7542284, 0.8836989, -0.6730387, 1, 1, 1, 1, 1,
0.7561624, -0.5146652, 1.19485, 1, 1, 1, 1, 1,
0.7576326, 0.4396756, 1.669119, 1, 1, 1, 1, 1,
0.7648452, -1.929324, 3.74317, 1, 1, 1, 1, 1,
0.770654, 1.237104, 0.5172091, 1, 1, 1, 1, 1,
0.7746388, -0.5344802, 1.323825, 1, 1, 1, 1, 1,
0.7845357, -1.690483, 3.255724, 1, 1, 1, 1, 1,
0.7917106, 0.858874, 2.118652, 1, 1, 1, 1, 1,
0.79439, 0.7871074, 0.7029188, 1, 1, 1, 1, 1,
0.8054735, -1.537975, 2.712432, 0, 0, 1, 1, 1,
0.807536, -0.7304036, 0.7662991, 1, 0, 0, 1, 1,
0.8078478, -0.3893107, 2.81585, 1, 0, 0, 1, 1,
0.8122609, -0.5791774, 1.31519, 1, 0, 0, 1, 1,
0.8213018, -0.6033374, 3.818145, 1, 0, 0, 1, 1,
0.8251137, -1.010486, 2.11236, 1, 0, 0, 1, 1,
0.8272987, -0.8367277, 5.03733, 0, 0, 0, 1, 1,
0.8355426, 0.6921427, 1.893718, 0, 0, 0, 1, 1,
0.837622, -1.976881, 1.374558, 0, 0, 0, 1, 1,
0.8411011, 0.2838489, 1.125875, 0, 0, 0, 1, 1,
0.8484527, -0.8522832, 2.992044, 0, 0, 0, 1, 1,
0.8523375, 0.4552008, 0.8772285, 0, 0, 0, 1, 1,
0.8552796, -0.4284344, 3.27434, 0, 0, 0, 1, 1,
0.8589559, 0.9153296, 0.6377646, 1, 1, 1, 1, 1,
0.8628542, 0.6779998, -0.114497, 1, 1, 1, 1, 1,
0.8647676, 0.1307723, 1.271855, 1, 1, 1, 1, 1,
0.8711312, 1.792468, 0.8365704, 1, 1, 1, 1, 1,
0.8740128, 0.821536, 0.8673698, 1, 1, 1, 1, 1,
0.8756737, 0.2975353, 1.756084, 1, 1, 1, 1, 1,
0.8799904, -0.1965755, 1.736138, 1, 1, 1, 1, 1,
0.8879421, 1.438195, -0.8805138, 1, 1, 1, 1, 1,
0.9000379, -0.5269989, 2.710187, 1, 1, 1, 1, 1,
0.9025762, -1.516163, 2.257803, 1, 1, 1, 1, 1,
0.9130692, -0.2272496, 1.55022, 1, 1, 1, 1, 1,
0.9140508, -0.3664439, 2.335151, 1, 1, 1, 1, 1,
0.9160675, -0.5242536, 2.253752, 1, 1, 1, 1, 1,
0.9173293, 0.1126093, 1.66065, 1, 1, 1, 1, 1,
0.9175453, 0.3604521, 2.377309, 1, 1, 1, 1, 1,
0.9228902, 1.413566, 0.642824, 0, 0, 1, 1, 1,
0.9243427, 0.8275391, 1.845523, 1, 0, 0, 1, 1,
0.9265995, -0.7847491, 1.551152, 1, 0, 0, 1, 1,
0.9298343, -0.2416681, 2.845145, 1, 0, 0, 1, 1,
0.931114, 1.112282, -0.7781933, 1, 0, 0, 1, 1,
0.9347298, -0.7474882, 2.810909, 1, 0, 0, 1, 1,
0.9421613, -0.7000597, 2.42732, 0, 0, 0, 1, 1,
0.9438962, -0.3055449, -0.1078102, 0, 0, 0, 1, 1,
0.9452195, -2.398582, 3.4504, 0, 0, 0, 1, 1,
0.9472368, 0.002318338, -0.5582073, 0, 0, 0, 1, 1,
0.9504205, 0.04001093, 0.607005, 0, 0, 0, 1, 1,
0.9532914, -0.5045648, 3.416135, 0, 0, 0, 1, 1,
0.9549333, 0.4122643, 0.007205743, 0, 0, 0, 1, 1,
0.9551759, 1.483841, -2.242038, 1, 1, 1, 1, 1,
0.956291, 0.9336915, 0.4014343, 1, 1, 1, 1, 1,
0.959065, 0.5404048, 1.075461, 1, 1, 1, 1, 1,
0.9597806, -0.2732804, 1.264782, 1, 1, 1, 1, 1,
0.9607629, 0.03173228, 0.967239, 1, 1, 1, 1, 1,
0.9608904, -1.058988, 2.185674, 1, 1, 1, 1, 1,
0.9681587, -1.144934, 2.370571, 1, 1, 1, 1, 1,
0.972967, -1.07484, 2.211981, 1, 1, 1, 1, 1,
0.9778298, -2.8801, 2.368357, 1, 1, 1, 1, 1,
0.9870222, 0.410302, 1.710452, 1, 1, 1, 1, 1,
0.9882469, 0.3140988, 1.987824, 1, 1, 1, 1, 1,
0.9956258, 0.1343125, 0.8882506, 1, 1, 1, 1, 1,
0.9958102, -1.201668, 1.425631, 1, 1, 1, 1, 1,
1.001323, -0.4369754, 3.034896, 1, 1, 1, 1, 1,
1.001583, 0.103315, 3.484683, 1, 1, 1, 1, 1,
1.005227, -0.1848111, 0.8323247, 0, 0, 1, 1, 1,
1.005568, 1.107375, 1.157933, 1, 0, 0, 1, 1,
1.010003, -0.5767287, 2.268986, 1, 0, 0, 1, 1,
1.010669, -0.3512485, 2.464148, 1, 0, 0, 1, 1,
1.011405, 0.535744, 1.567821, 1, 0, 0, 1, 1,
1.022982, -0.9463263, 3.369268, 1, 0, 0, 1, 1,
1.03049, 0.12925, 2.025903, 0, 0, 0, 1, 1,
1.044182, -0.4990578, 1.648399, 0, 0, 0, 1, 1,
1.047894, -0.5061787, 1.093812, 0, 0, 0, 1, 1,
1.057972, -0.6129216, 0.3951486, 0, 0, 0, 1, 1,
1.05826, 2.891799, -0.3552206, 0, 0, 0, 1, 1,
1.069403, 0.9086879, 0.5955443, 0, 0, 0, 1, 1,
1.07805, -0.4274722, 3.199145, 0, 0, 0, 1, 1,
1.078982, -0.9435022, -0.3186809, 1, 1, 1, 1, 1,
1.081427, 0.2289415, 1.352263, 1, 1, 1, 1, 1,
1.082505, 1.121912, -0.9521961, 1, 1, 1, 1, 1,
1.085463, 0.6818905, -0.3977344, 1, 1, 1, 1, 1,
1.094317, -1.243304, 2.266587, 1, 1, 1, 1, 1,
1.097528, 0.08610434, 2.565126, 1, 1, 1, 1, 1,
1.102221, 1.280487, -0.5802783, 1, 1, 1, 1, 1,
1.102692, -0.05509669, 1.443021, 1, 1, 1, 1, 1,
1.104696, -2.055137, 1.359017, 1, 1, 1, 1, 1,
1.107277, -0.9929138, 4.011138, 1, 1, 1, 1, 1,
1.110464, 0.1877416, 2.107646, 1, 1, 1, 1, 1,
1.118133, -0.4750137, 2.04676, 1, 1, 1, 1, 1,
1.12006, -0.0386711, 1.106344, 1, 1, 1, 1, 1,
1.123656, 0.3369395, 1.480382, 1, 1, 1, 1, 1,
1.125894, 0.3744699, 1.29804, 1, 1, 1, 1, 1,
1.130471, 0.4024232, 0.253131, 0, 0, 1, 1, 1,
1.138603, -1.271228, 1.655225, 1, 0, 0, 1, 1,
1.143493, 1.605471, 0.3542007, 1, 0, 0, 1, 1,
1.152784, -0.09133213, 0.8090854, 1, 0, 0, 1, 1,
1.154415, -1.210043, 1.597014, 1, 0, 0, 1, 1,
1.161419, -0.2738163, 0.6949787, 1, 0, 0, 1, 1,
1.168301, -0.6772354, -0.3761992, 0, 0, 0, 1, 1,
1.174841, 0.1813903, 2.134158, 0, 0, 0, 1, 1,
1.178002, 1.01562, 2.458574, 0, 0, 0, 1, 1,
1.183524, 0.9826645, -0.4951929, 0, 0, 0, 1, 1,
1.185317, -1.321219, 1.594055, 0, 0, 0, 1, 1,
1.187032, 0.1138682, 0.3653075, 0, 0, 0, 1, 1,
1.194312, -0.6902441, 1.377345, 0, 0, 0, 1, 1,
1.198739, -1.208641, 2.286617, 1, 1, 1, 1, 1,
1.201013, 0.7120739, 1.653571, 1, 1, 1, 1, 1,
1.205528, 0.8081914, 0.6775365, 1, 1, 1, 1, 1,
1.210226, 1.924826, 2.919056, 1, 1, 1, 1, 1,
1.210864, -1.267161, 2.77148, 1, 1, 1, 1, 1,
1.214206, 0.2097433, 3.29003, 1, 1, 1, 1, 1,
1.215282, -0.8000594, 1.080141, 1, 1, 1, 1, 1,
1.228544, -0.1453724, 0.5046297, 1, 1, 1, 1, 1,
1.233424, -0.5199229, 0.8861301, 1, 1, 1, 1, 1,
1.236718, 0.9081314, 1.808288, 1, 1, 1, 1, 1,
1.246662, 0.05456671, 1.681795, 1, 1, 1, 1, 1,
1.251665, 0.06923954, 1.662376, 1, 1, 1, 1, 1,
1.259115, 1.113033, 0.5333294, 1, 1, 1, 1, 1,
1.261991, 0.5976139, 0.1481544, 1, 1, 1, 1, 1,
1.262586, -0.7122979, 2.213667, 1, 1, 1, 1, 1,
1.263412, -0.08430957, 2.081534, 0, 0, 1, 1, 1,
1.282185, -0.5050641, 1.67313, 1, 0, 0, 1, 1,
1.2831, 1.300053, 2.509134, 1, 0, 0, 1, 1,
1.287306, -0.8407471, 3.726971, 1, 0, 0, 1, 1,
1.288739, -0.7559173, 3.355891, 1, 0, 0, 1, 1,
1.295384, -1.664896, 1.728985, 1, 0, 0, 1, 1,
1.306778, 1.325582, 1.582113, 0, 0, 0, 1, 1,
1.318903, 0.2297948, -0.2502902, 0, 0, 0, 1, 1,
1.321557, -1.42607, 2.815662, 0, 0, 0, 1, 1,
1.329615, 0.9102173, 1.76795, 0, 0, 0, 1, 1,
1.330023, 0.9100537, 1.647022, 0, 0, 0, 1, 1,
1.340326, 0.4574367, 0.8092173, 0, 0, 0, 1, 1,
1.343121, 0.8423806, -0.08885443, 0, 0, 0, 1, 1,
1.343609, -0.07994243, 1.694991, 1, 1, 1, 1, 1,
1.355762, -1.209276, 1.252862, 1, 1, 1, 1, 1,
1.363252, -0.3039539, 1.77639, 1, 1, 1, 1, 1,
1.369578, -0.2030756, 2.275438, 1, 1, 1, 1, 1,
1.37451, 0.8422766, -0.03954291, 1, 1, 1, 1, 1,
1.379425, 1.519694, 1.677343, 1, 1, 1, 1, 1,
1.383278, 1.154294, 1.860171, 1, 1, 1, 1, 1,
1.385123, -0.04506991, 1.197909, 1, 1, 1, 1, 1,
1.392674, 1.609373, 1.306026, 1, 1, 1, 1, 1,
1.393265, -0.1191991, 1.134155, 1, 1, 1, 1, 1,
1.409172, 0.6861057, 1.980869, 1, 1, 1, 1, 1,
1.413203, -0.2452528, 2.262125, 1, 1, 1, 1, 1,
1.413479, 0.6271922, 3.470289, 1, 1, 1, 1, 1,
1.421535, 0.894435, -0.1142705, 1, 1, 1, 1, 1,
1.427519, -0.4851145, 1.393178, 1, 1, 1, 1, 1,
1.431394, -1.286517, 1.671389, 0, 0, 1, 1, 1,
1.432804, -0.06864622, 1.66417, 1, 0, 0, 1, 1,
1.433671, 1.158302, 1.219275, 1, 0, 0, 1, 1,
1.452921, -0.4290958, 2.048493, 1, 0, 0, 1, 1,
1.454447, 1.095389, 0.9216185, 1, 0, 0, 1, 1,
1.458462, -1.659434, 1.230838, 1, 0, 0, 1, 1,
1.468781, 0.3423332, -0.8838143, 0, 0, 0, 1, 1,
1.478084, 0.6169122, 1.986561, 0, 0, 0, 1, 1,
1.486941, -1.738164, 1.370118, 0, 0, 0, 1, 1,
1.517758, -2.558399, 3.740591, 0, 0, 0, 1, 1,
1.520824, -0.8019491, 2.814216, 0, 0, 0, 1, 1,
1.522293, -1.113819, 2.78517, 0, 0, 0, 1, 1,
1.547285, 1.70624, 0.9047798, 0, 0, 0, 1, 1,
1.568513, -0.161824, 0.9288727, 1, 1, 1, 1, 1,
1.57346, 1.130806, 0.7443627, 1, 1, 1, 1, 1,
1.577055, 0.1753114, -0.1652746, 1, 1, 1, 1, 1,
1.583953, 1.775045, 1.191507, 1, 1, 1, 1, 1,
1.58435, -1.394555, 2.547125, 1, 1, 1, 1, 1,
1.584803, -0.9531782, 1.54612, 1, 1, 1, 1, 1,
1.588994, -0.9017863, 2.071731, 1, 1, 1, 1, 1,
1.62729, 1.772366, 0.8921093, 1, 1, 1, 1, 1,
1.645473, -0.868407, 2.733828, 1, 1, 1, 1, 1,
1.65346, 1.032885, 3.355722, 1, 1, 1, 1, 1,
1.657774, -1.045459, 4.388534, 1, 1, 1, 1, 1,
1.670594, 0.9649522, 2.785724, 1, 1, 1, 1, 1,
1.678269, -1.908988, 1.991083, 1, 1, 1, 1, 1,
1.691903, 0.1335359, -0.2623345, 1, 1, 1, 1, 1,
1.695003, -0.20951, 1.05817, 1, 1, 1, 1, 1,
1.705863, 2.40319, 0.2902864, 0, 0, 1, 1, 1,
1.709657, 0.2295949, 1.948515, 1, 0, 0, 1, 1,
1.717154, 1.241933, 1.76822, 1, 0, 0, 1, 1,
1.717986, 0.6405223, 1.248166, 1, 0, 0, 1, 1,
1.723256, 0.3740873, 3.704185, 1, 0, 0, 1, 1,
1.744979, 0.227438, 0.4081641, 1, 0, 0, 1, 1,
1.745103, 0.4730051, 1.500619, 0, 0, 0, 1, 1,
1.752909, 0.8297551, 1.36032, 0, 0, 0, 1, 1,
1.753481, -1.534992, 2.907075, 0, 0, 0, 1, 1,
1.756314, -0.08386905, 2.744496, 0, 0, 0, 1, 1,
1.756877, -0.7797647, 2.43504, 0, 0, 0, 1, 1,
1.762137, -1.185368, 2.468433, 0, 0, 0, 1, 1,
1.781396, -1.614359, 4.159465, 0, 0, 0, 1, 1,
1.781648, -0.3900496, 1.664876, 1, 1, 1, 1, 1,
1.799118, 0.04150491, 2.148783, 1, 1, 1, 1, 1,
1.80467, -0.3645727, 0.9263265, 1, 1, 1, 1, 1,
1.814859, 0.06465082, 0.9396984, 1, 1, 1, 1, 1,
1.816043, -0.9237285, 1.152375, 1, 1, 1, 1, 1,
1.818666, 0.1576115, 0.2289377, 1, 1, 1, 1, 1,
1.827274, -0.5957906, 0.6884359, 1, 1, 1, 1, 1,
1.829223, 1.271337, 0.9490861, 1, 1, 1, 1, 1,
1.878979, -1.405946, 3.620755, 1, 1, 1, 1, 1,
1.886194, -1.654791, 2.556797, 1, 1, 1, 1, 1,
1.889529, -1.032245, 3.553203, 1, 1, 1, 1, 1,
1.892977, -1.067823, 1.400988, 1, 1, 1, 1, 1,
1.909793, 0.7620212, 1.576289, 1, 1, 1, 1, 1,
1.92359, -0.3600829, 0.5159941, 1, 1, 1, 1, 1,
1.949595, -1.618176, 2.515051, 1, 1, 1, 1, 1,
1.989004, -0.3008083, 2.333258, 0, 0, 1, 1, 1,
2.033074, -1.75376, 2.704119, 1, 0, 0, 1, 1,
2.048007, 1.883185, -1.041282, 1, 0, 0, 1, 1,
2.049808, 1.994349, 0.6574661, 1, 0, 0, 1, 1,
2.054068, 0.09428857, 2.282309, 1, 0, 0, 1, 1,
2.071666, -0.6419601, 0.8303983, 1, 0, 0, 1, 1,
2.088374, 1.21928, -0.4814082, 0, 0, 0, 1, 1,
2.094892, -0.1256533, 2.264335, 0, 0, 0, 1, 1,
2.210368, -1.30887, 2.318858, 0, 0, 0, 1, 1,
2.223864, -0.0487722, 2.016316, 0, 0, 0, 1, 1,
2.269669, -1.110745, 1.318453, 0, 0, 0, 1, 1,
2.324265, -0.6999274, 2.0481, 0, 0, 0, 1, 1,
2.404917, -0.651509, 2.788245, 0, 0, 0, 1, 1,
2.481364, 0.6879283, 1.606512, 1, 1, 1, 1, 1,
2.535358, 0.6497287, 3.279117, 1, 1, 1, 1, 1,
2.558411, 1.748288, 2.123673, 1, 1, 1, 1, 1,
2.669557, -0.7452105, -0.7165882, 1, 1, 1, 1, 1,
2.899072, -0.5215453, 0.6285818, 1, 1, 1, 1, 1,
3.60136, -0.7601745, 1.608104, 1, 1, 1, 1, 1,
3.7738, -1.348655, 1.647738, 1, 1, 1, 1, 1
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
var radius = 9.915132;
var distance = 34.82648;
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
mvMatrix.translate( -0.3905734, 0.1741312, -0.4055274 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82648);
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