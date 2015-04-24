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
-2.59162, -0.3308671, -1.445365, 1, 0, 0, 1,
-2.563693, -1.450382, 0.5782583, 1, 0.007843138, 0, 1,
-2.562732, 0.3806966, -0.8969517, 1, 0.01176471, 0, 1,
-2.557756, 0.9273282, -1.131708, 1, 0.01960784, 0, 1,
-2.552856, -1.031145, -0.5944527, 1, 0.02352941, 0, 1,
-2.450143, 0.7694069, 0.3907538, 1, 0.03137255, 0, 1,
-2.418091, -1.116831, -2.607234, 1, 0.03529412, 0, 1,
-2.400108, 0.4487976, -1.361441, 1, 0.04313726, 0, 1,
-2.303708, -0.5413612, -0.9185006, 1, 0.04705882, 0, 1,
-2.302528, -0.3754091, -2.410858, 1, 0.05490196, 0, 1,
-2.288631, -0.5092389, -2.18359, 1, 0.05882353, 0, 1,
-2.27021, 0.5208601, -1.025366, 1, 0.06666667, 0, 1,
-2.240518, 0.3705633, 0.1398968, 1, 0.07058824, 0, 1,
-2.239923, -0.8311508, -3.047838, 1, 0.07843138, 0, 1,
-2.217209, -1.477062, -1.793221, 1, 0.08235294, 0, 1,
-2.206186, -0.6071194, -0.5682212, 1, 0.09019608, 0, 1,
-2.184197, 1.78613, -0.2720931, 1, 0.09411765, 0, 1,
-2.129847, 1.383229, 0.1758087, 1, 0.1019608, 0, 1,
-2.127514, -1.376851, -2.569648, 1, 0.1098039, 0, 1,
-2.121626, 0.9168335, -1.490972, 1, 0.1137255, 0, 1,
-2.105572, 1.038495, -2.220861, 1, 0.1215686, 0, 1,
-2.093572, -0.358673, -1.050145, 1, 0.1254902, 0, 1,
-2.085485, 0.03463087, -0.8412078, 1, 0.1333333, 0, 1,
-2.025641, -0.2260337, -2.654501, 1, 0.1372549, 0, 1,
-2.016365, 0.06087731, -1.315811, 1, 0.145098, 0, 1,
-2.010429, 0.4019339, -4.240655, 1, 0.1490196, 0, 1,
-2.004027, 0.5589283, -1.751187, 1, 0.1568628, 0, 1,
-1.97761, 1.622836, -1.798898, 1, 0.1607843, 0, 1,
-1.941319, 2.112543, -1.632543, 1, 0.1686275, 0, 1,
-1.933422, -1.585492, -3.55703, 1, 0.172549, 0, 1,
-1.92642, 1.996158, 0.2584958, 1, 0.1803922, 0, 1,
-1.919827, 0.2119462, -1.130614, 1, 0.1843137, 0, 1,
-1.887936, -0.1008588, -3.5423, 1, 0.1921569, 0, 1,
-1.876749, -0.7206876, -0.4902278, 1, 0.1960784, 0, 1,
-1.876422, -1.097964, -1.906436, 1, 0.2039216, 0, 1,
-1.870597, 0.9181215, -0.970772, 1, 0.2117647, 0, 1,
-1.86759, -0.2205037, -1.608373, 1, 0.2156863, 0, 1,
-1.847992, -0.06573156, -0.9239067, 1, 0.2235294, 0, 1,
-1.83978, 1.153303, -0.907285, 1, 0.227451, 0, 1,
-1.833822, 2.436687, -2.148365, 1, 0.2352941, 0, 1,
-1.831695, -0.1901134, -3.340476, 1, 0.2392157, 0, 1,
-1.830791, 2.148389, -2.903333, 1, 0.2470588, 0, 1,
-1.83019, -0.5102834, -1.366587, 1, 0.2509804, 0, 1,
-1.807895, -0.1626896, -2.447765, 1, 0.2588235, 0, 1,
-1.80449, 0.2970122, -2.503645, 1, 0.2627451, 0, 1,
-1.800269, -0.9343843, -0.4458659, 1, 0.2705882, 0, 1,
-1.781199, -0.6437205, 0.3206649, 1, 0.2745098, 0, 1,
-1.766046, 1.347689, -2.97474, 1, 0.282353, 0, 1,
-1.765099, -0.5183828, -1.4518, 1, 0.2862745, 0, 1,
-1.739184, 0.36338, -0.4272512, 1, 0.2941177, 0, 1,
-1.718505, -0.2099221, -0.9937875, 1, 0.3019608, 0, 1,
-1.70763, -0.07615841, -0.9950189, 1, 0.3058824, 0, 1,
-1.705826, -1.56056, -2.174814, 1, 0.3137255, 0, 1,
-1.689806, 0.9353368, -0.4930424, 1, 0.3176471, 0, 1,
-1.688582, -0.8208986, -2.138887, 1, 0.3254902, 0, 1,
-1.677772, 1.361244, -0.137916, 1, 0.3294118, 0, 1,
-1.638621, -1.249543, -2.03798, 1, 0.3372549, 0, 1,
-1.633955, -0.5098419, -2.624495, 1, 0.3411765, 0, 1,
-1.629751, 0.5814853, -0.2163211, 1, 0.3490196, 0, 1,
-1.625984, 0.4142939, -0.3876681, 1, 0.3529412, 0, 1,
-1.624974, 0.09511125, -2.349939, 1, 0.3607843, 0, 1,
-1.613016, -0.7012712, -2.774149, 1, 0.3647059, 0, 1,
-1.600206, 1.101578, 1.028948, 1, 0.372549, 0, 1,
-1.591063, -0.477336, -1.02821, 1, 0.3764706, 0, 1,
-1.587176, -0.5234571, -0.5483197, 1, 0.3843137, 0, 1,
-1.584893, -0.2652221, -1.695637, 1, 0.3882353, 0, 1,
-1.575335, -0.4786527, -2.444962, 1, 0.3960784, 0, 1,
-1.566309, 1.652013, -1.47051, 1, 0.4039216, 0, 1,
-1.562283, -2.107033, -2.129505, 1, 0.4078431, 0, 1,
-1.559325, 0.2056343, -1.002389, 1, 0.4156863, 0, 1,
-1.555136, 0.8281897, -1.364379, 1, 0.4196078, 0, 1,
-1.552365, -0.03158867, -0.8668319, 1, 0.427451, 0, 1,
-1.551695, -0.5343213, -1.929863, 1, 0.4313726, 0, 1,
-1.536569, 0.4914821, -4.155489, 1, 0.4392157, 0, 1,
-1.534179, -0.1558602, -1.804964, 1, 0.4431373, 0, 1,
-1.529174, -0.09195286, -2.362417, 1, 0.4509804, 0, 1,
-1.52194, 0.5463895, -0.8112012, 1, 0.454902, 0, 1,
-1.489017, -0.7587084, -1.772226, 1, 0.4627451, 0, 1,
-1.488833, -0.3106611, -1.603758, 1, 0.4666667, 0, 1,
-1.46698, -0.9490954, -1.81476, 1, 0.4745098, 0, 1,
-1.455108, -1.179797, -2.207291, 1, 0.4784314, 0, 1,
-1.449864, -1.11066, -1.4058, 1, 0.4862745, 0, 1,
-1.445784, -0.8995544, -2.26347, 1, 0.4901961, 0, 1,
-1.443232, -0.04099255, -2.242348, 1, 0.4980392, 0, 1,
-1.440189, -0.7386417, -2.504505, 1, 0.5058824, 0, 1,
-1.439819, 0.5056781, -1.425567, 1, 0.509804, 0, 1,
-1.437719, -0.4400329, -0.1292275, 1, 0.5176471, 0, 1,
-1.435447, -0.1090993, -2.70426, 1, 0.5215687, 0, 1,
-1.423798, 2.329125, -0.7339379, 1, 0.5294118, 0, 1,
-1.415856, -0.2668011, -1.17683, 1, 0.5333334, 0, 1,
-1.415817, -0.4317879, -2.268759, 1, 0.5411765, 0, 1,
-1.401761, 0.7547191, 0.6337585, 1, 0.5450981, 0, 1,
-1.401107, 0.5354742, -0.8724667, 1, 0.5529412, 0, 1,
-1.400869, 0.844285, -2.103725, 1, 0.5568628, 0, 1,
-1.38731, 1.175376, 0.5703182, 1, 0.5647059, 0, 1,
-1.365836, -1.042556, -2.309598, 1, 0.5686275, 0, 1,
-1.365368, -0.912882, -2.582773, 1, 0.5764706, 0, 1,
-1.3652, -0.5824082, -0.8314545, 1, 0.5803922, 0, 1,
-1.357295, -0.008163116, 0.08743983, 1, 0.5882353, 0, 1,
-1.351929, -1.877132, -4.39252, 1, 0.5921569, 0, 1,
-1.335727, 0.1188671, -1.781554, 1, 0.6, 0, 1,
-1.333931, -1.776016, -2.519909, 1, 0.6078432, 0, 1,
-1.333671, 0.1853029, -0.335044, 1, 0.6117647, 0, 1,
-1.332651, 0.8601116, -2.116157, 1, 0.6196079, 0, 1,
-1.312042, 1.3127, 0.5614067, 1, 0.6235294, 0, 1,
-1.310678, 1.734321, 0.7524604, 1, 0.6313726, 0, 1,
-1.308582, 0.3346554, -0.5103021, 1, 0.6352941, 0, 1,
-1.307918, -0.2588509, -1.273776, 1, 0.6431373, 0, 1,
-1.306304, -0.2705097, 0.6695503, 1, 0.6470588, 0, 1,
-1.300772, 2.020777, -1.138479, 1, 0.654902, 0, 1,
-1.290386, 0.2645966, -0.341529, 1, 0.6588235, 0, 1,
-1.284764, 1.471403, -0.2309866, 1, 0.6666667, 0, 1,
-1.278123, -0.1275073, -0.81385, 1, 0.6705883, 0, 1,
-1.276695, 0.950877, -0.2885226, 1, 0.6784314, 0, 1,
-1.264571, -0.4698006, -1.858786, 1, 0.682353, 0, 1,
-1.257252, -1.753613, -2.086527, 1, 0.6901961, 0, 1,
-1.256279, -1.551533, -2.078234, 1, 0.6941177, 0, 1,
-1.255748, 0.2894352, -0.03672929, 1, 0.7019608, 0, 1,
-1.255513, 0.8735312, -0.5291758, 1, 0.7098039, 0, 1,
-1.250054, -0.5124224, -1.841001, 1, 0.7137255, 0, 1,
-1.245707, 1.140043, -1.518058, 1, 0.7215686, 0, 1,
-1.245067, 1.328215, -1.496182, 1, 0.7254902, 0, 1,
-1.244652, 1.125365, -0.5386319, 1, 0.7333333, 0, 1,
-1.244005, 1.477539, -1.348382, 1, 0.7372549, 0, 1,
-1.242293, -0.6387039, -1.773106, 1, 0.7450981, 0, 1,
-1.241691, 0.7654875, -0.05261891, 1, 0.7490196, 0, 1,
-1.234862, 1.23866, -0.6919873, 1, 0.7568628, 0, 1,
-1.234208, 0.346745, -0.6661732, 1, 0.7607843, 0, 1,
-1.230156, 0.01687577, -2.527115, 1, 0.7686275, 0, 1,
-1.215501, 0.8893557, -0.3236722, 1, 0.772549, 0, 1,
-1.21064, 0.3445601, 0.1068969, 1, 0.7803922, 0, 1,
-1.204032, -0.4373439, -1.939936, 1, 0.7843137, 0, 1,
-1.202192, 0.2369542, -2.737066, 1, 0.7921569, 0, 1,
-1.201964, -0.5655915, -1.389578, 1, 0.7960784, 0, 1,
-1.200701, -1.081053, -1.498636, 1, 0.8039216, 0, 1,
-1.1961, -1.047337, -1.606268, 1, 0.8117647, 0, 1,
-1.192251, -1.156695, -3.410506, 1, 0.8156863, 0, 1,
-1.18503, 0.3451225, -0.4252912, 1, 0.8235294, 0, 1,
-1.183164, 0.1813539, 0.7076588, 1, 0.827451, 0, 1,
-1.16473, 0.9633033, 0.1777354, 1, 0.8352941, 0, 1,
-1.164585, 0.007115385, -1.275931, 1, 0.8392157, 0, 1,
-1.163286, -1.066879, -2.515398, 1, 0.8470588, 0, 1,
-1.160883, -2.171374, -2.326323, 1, 0.8509804, 0, 1,
-1.158708, 0.6137698, -1.000299, 1, 0.8588235, 0, 1,
-1.158324, 0.3004324, -3.272971, 1, 0.8627451, 0, 1,
-1.157653, 0.2538251, -2.313269, 1, 0.8705882, 0, 1,
-1.152908, 1.307398, -2.145951, 1, 0.8745098, 0, 1,
-1.137853, -0.2959366, -1.100801, 1, 0.8823529, 0, 1,
-1.136702, 0.2860251, -1.191679, 1, 0.8862745, 0, 1,
-1.133204, -0.06417035, -2.295807, 1, 0.8941177, 0, 1,
-1.124993, -0.7806638, -1.143022, 1, 0.8980392, 0, 1,
-1.118662, -0.5747153, -1.004541, 1, 0.9058824, 0, 1,
-1.116512, -0.2534972, -2.314605, 1, 0.9137255, 0, 1,
-1.115498, -1.523199, -2.785946, 1, 0.9176471, 0, 1,
-1.113215, 0.8117067, -1.5919, 1, 0.9254902, 0, 1,
-1.112739, -0.4164058, -2.968549, 1, 0.9294118, 0, 1,
-1.105456, -0.3186854, -2.799937, 1, 0.9372549, 0, 1,
-1.101648, 0.4075945, -1.78806, 1, 0.9411765, 0, 1,
-1.099977, -0.6272182, -0.5052812, 1, 0.9490196, 0, 1,
-1.097481, 0.193434, -0.4618284, 1, 0.9529412, 0, 1,
-1.095038, -0.0465304, -2.420148, 1, 0.9607843, 0, 1,
-1.087216, 0.08320618, -1.955174, 1, 0.9647059, 0, 1,
-1.070355, -0.01787652, -1.155992, 1, 0.972549, 0, 1,
-1.068656, -2.152732, -2.80054, 1, 0.9764706, 0, 1,
-1.065922, 0.2604823, -1.123634, 1, 0.9843137, 0, 1,
-1.065675, -0.6910368, -0.9437235, 1, 0.9882353, 0, 1,
-1.057246, -2.96154, -4.617298, 1, 0.9960784, 0, 1,
-1.047088, 0.6535054, -0.7456207, 0.9960784, 1, 0, 1,
-1.047038, -0.1152253, -1.179358, 0.9921569, 1, 0, 1,
-1.037545, -0.3167768, -2.189753, 0.9843137, 1, 0, 1,
-1.033377, 2.701563, -0.2145974, 0.9803922, 1, 0, 1,
-1.027244, 1.875674, -1.439884, 0.972549, 1, 0, 1,
-1.026898, 0.3425026, -0.3363353, 0.9686275, 1, 0, 1,
-1.015439, -0.3872167, -1.436203, 0.9607843, 1, 0, 1,
-1.012866, -0.9008576, -2.683654, 0.9568627, 1, 0, 1,
-1.011739, -0.839908, -2.458779, 0.9490196, 1, 0, 1,
-1.002452, 0.3768337, -1.991799, 0.945098, 1, 0, 1,
-0.9947079, -0.7896112, -2.928735, 0.9372549, 1, 0, 1,
-0.9896135, 0.4645064, -0.4709969, 0.9333333, 1, 0, 1,
-0.9872309, -1.515597, -1.649522, 0.9254902, 1, 0, 1,
-0.9858112, -0.8355702, -2.847331, 0.9215686, 1, 0, 1,
-0.985548, -0.929773, -1.935747, 0.9137255, 1, 0, 1,
-0.984605, 0.6693226, -0.8398774, 0.9098039, 1, 0, 1,
-0.9826967, -0.6780952, -0.8882961, 0.9019608, 1, 0, 1,
-0.9813076, 0.1234029, -0.8021494, 0.8941177, 1, 0, 1,
-0.9800088, -1.011371, -1.206392, 0.8901961, 1, 0, 1,
-0.9779091, 1.950576, 0.3527758, 0.8823529, 1, 0, 1,
-0.9750725, 0.5436906, -1.386989, 0.8784314, 1, 0, 1,
-0.9722719, 0.6642523, -1.636729, 0.8705882, 1, 0, 1,
-0.9663031, 0.1940404, -1.18574, 0.8666667, 1, 0, 1,
-0.9656067, 2.175879, 0.3833396, 0.8588235, 1, 0, 1,
-0.9655902, -1.304883, -1.643631, 0.854902, 1, 0, 1,
-0.9634393, 0.8651958, -2.196523, 0.8470588, 1, 0, 1,
-0.9536338, 0.4928631, -2.050039, 0.8431373, 1, 0, 1,
-0.953055, 0.373909, -0.9544509, 0.8352941, 1, 0, 1,
-0.949098, -1.287034, -2.750123, 0.8313726, 1, 0, 1,
-0.9428171, 1.269082, -0.9629481, 0.8235294, 1, 0, 1,
-0.9393919, 1.209764, 0.1395803, 0.8196079, 1, 0, 1,
-0.9388053, -0.0437273, -1.297619, 0.8117647, 1, 0, 1,
-0.936882, 0.903804, -0.8790041, 0.8078431, 1, 0, 1,
-0.936645, 0.997123, 0.02099506, 0.8, 1, 0, 1,
-0.9357488, -0.7769856, -2.192356, 0.7921569, 1, 0, 1,
-0.9344017, -0.2165193, -0.8028119, 0.7882353, 1, 0, 1,
-0.9342487, -0.207297, -1.494268, 0.7803922, 1, 0, 1,
-0.9232288, 0.3988073, -1.852677, 0.7764706, 1, 0, 1,
-0.9216627, -1.135158, -3.45643, 0.7686275, 1, 0, 1,
-0.9179034, 0.2961075, -0.9735102, 0.7647059, 1, 0, 1,
-0.9133016, -0.384031, -0.2244258, 0.7568628, 1, 0, 1,
-0.9061874, -0.01616324, -2.943455, 0.7529412, 1, 0, 1,
-0.9060974, -1.62709, -1.305838, 0.7450981, 1, 0, 1,
-0.9036092, -1.873461, -2.576726, 0.7411765, 1, 0, 1,
-0.9032057, -1.364405, -3.585503, 0.7333333, 1, 0, 1,
-0.8975574, 0.3677227, 0.821614, 0.7294118, 1, 0, 1,
-0.8933904, 0.7131368, 0.5325185, 0.7215686, 1, 0, 1,
-0.8931679, -0.1111569, -1.915421, 0.7176471, 1, 0, 1,
-0.8930984, 2.928208, -0.8794482, 0.7098039, 1, 0, 1,
-0.8812169, 1.376149, -2.096826, 0.7058824, 1, 0, 1,
-0.8804638, 1.272758, -1.299665, 0.6980392, 1, 0, 1,
-0.8753743, 0.643222, -1.439014, 0.6901961, 1, 0, 1,
-0.8728814, -1.289263, -1.793474, 0.6862745, 1, 0, 1,
-0.8703495, 0.01978637, -2.352509, 0.6784314, 1, 0, 1,
-0.8697527, 0.8808044, -0.2020281, 0.6745098, 1, 0, 1,
-0.8694956, 1.170483, 0.3379757, 0.6666667, 1, 0, 1,
-0.8628933, -0.6082528, -3.36447, 0.6627451, 1, 0, 1,
-0.8608839, 0.4996682, -2.71325, 0.654902, 1, 0, 1,
-0.8601829, -0.2339846, -1.199553, 0.6509804, 1, 0, 1,
-0.8590034, 0.5689521, 0.1610754, 0.6431373, 1, 0, 1,
-0.8499331, 0.6111232, 0.1834615, 0.6392157, 1, 0, 1,
-0.8460464, -0.5395081, -1.341536, 0.6313726, 1, 0, 1,
-0.8440523, -0.01885968, -1.083837, 0.627451, 1, 0, 1,
-0.8425283, -1.278239, -4.687406, 0.6196079, 1, 0, 1,
-0.8400773, 0.4813464, -1.34542, 0.6156863, 1, 0, 1,
-0.8360232, -0.588665, -4.483261, 0.6078432, 1, 0, 1,
-0.833928, -0.2502493, -2.008503, 0.6039216, 1, 0, 1,
-0.8294493, 0.3081408, -1.646356, 0.5960785, 1, 0, 1,
-0.8252645, -1.77505, -3.369807, 0.5882353, 1, 0, 1,
-0.8212867, -0.4876947, -1.908181, 0.5843138, 1, 0, 1,
-0.8086225, -0.3397911, -2.011772, 0.5764706, 1, 0, 1,
-0.8073852, 0.3129767, -0.1423622, 0.572549, 1, 0, 1,
-0.80203, 0.06025008, -3.980515, 0.5647059, 1, 0, 1,
-0.80005, -1.393047, -2.691297, 0.5607843, 1, 0, 1,
-0.7965706, 0.5203122, -0.4225831, 0.5529412, 1, 0, 1,
-0.7938312, -0.2101513, -1.73758, 0.5490196, 1, 0, 1,
-0.7900143, 1.301593, -0.3014105, 0.5411765, 1, 0, 1,
-0.7890481, 0.3794104, -1.104457, 0.5372549, 1, 0, 1,
-0.7859671, -0.01920426, -2.013556, 0.5294118, 1, 0, 1,
-0.7854788, -1.590042, -2.875777, 0.5254902, 1, 0, 1,
-0.7842559, -0.6198664, -2.309339, 0.5176471, 1, 0, 1,
-0.7793543, -0.05296048, -0.04213816, 0.5137255, 1, 0, 1,
-0.7786859, 1.1659, -1.909224, 0.5058824, 1, 0, 1,
-0.7755997, 1.158823, 0.509677, 0.5019608, 1, 0, 1,
-0.7743899, 1.170998, -0.2873816, 0.4941176, 1, 0, 1,
-0.7665918, -0.001621999, -0.5799026, 0.4862745, 1, 0, 1,
-0.7631388, -0.2599449, -2.147283, 0.4823529, 1, 0, 1,
-0.7616578, -1.741441, -3.821389, 0.4745098, 1, 0, 1,
-0.7603794, 2.549007, 0.561196, 0.4705882, 1, 0, 1,
-0.7594799, -0.4147141, -3.927655, 0.4627451, 1, 0, 1,
-0.7594305, 1.547953, -0.3286246, 0.4588235, 1, 0, 1,
-0.7576529, 0.2823413, -1.439204, 0.4509804, 1, 0, 1,
-0.753476, -0.2730933, -1.272057, 0.4470588, 1, 0, 1,
-0.7503915, -0.03534147, 0.09732078, 0.4392157, 1, 0, 1,
-0.746564, 0.3759674, -1.341523, 0.4352941, 1, 0, 1,
-0.7447755, -0.1941343, -1.187385, 0.427451, 1, 0, 1,
-0.7405177, -0.7510452, -3.049653, 0.4235294, 1, 0, 1,
-0.7379281, 0.6622765, -0.8041647, 0.4156863, 1, 0, 1,
-0.7372318, 1.100593, -0.8792658, 0.4117647, 1, 0, 1,
-0.7319946, -1.439428, -3.33429, 0.4039216, 1, 0, 1,
-0.7268933, -0.5377219, -2.265488, 0.3960784, 1, 0, 1,
-0.7254223, 0.6946054, -0.7004624, 0.3921569, 1, 0, 1,
-0.7223414, 0.3453473, -1.19608, 0.3843137, 1, 0, 1,
-0.7174909, -0.4315384, -3.650547, 0.3803922, 1, 0, 1,
-0.7129089, -0.1217065, -0.7156541, 0.372549, 1, 0, 1,
-0.7114239, 2.44464, 0.03203982, 0.3686275, 1, 0, 1,
-0.703855, -0.490484, -3.424192, 0.3607843, 1, 0, 1,
-0.7006061, -1.003857, -3.667473, 0.3568628, 1, 0, 1,
-0.6985693, -0.8794912, -2.83882, 0.3490196, 1, 0, 1,
-0.6969048, 0.6945267, -1.137959, 0.345098, 1, 0, 1,
-0.6961512, 1.291646, -0.3272635, 0.3372549, 1, 0, 1,
-0.6866916, 0.6485894, -1.157045, 0.3333333, 1, 0, 1,
-0.6841323, -0.1749425, -1.381721, 0.3254902, 1, 0, 1,
-0.683067, 1.189526, 0.2627692, 0.3215686, 1, 0, 1,
-0.6828964, -0.9711394, -2.374043, 0.3137255, 1, 0, 1,
-0.6816865, -1.014162, -2.346658, 0.3098039, 1, 0, 1,
-0.6814909, 0.4869688, -0.4289972, 0.3019608, 1, 0, 1,
-0.681187, 0.09210515, 0.1956953, 0.2941177, 1, 0, 1,
-0.6810716, -2.617589, -3.222864, 0.2901961, 1, 0, 1,
-0.6760255, -0.2690169, -1.588028, 0.282353, 1, 0, 1,
-0.6750982, -0.2774284, -3.756751, 0.2784314, 1, 0, 1,
-0.6748288, 0.2050337, -1.93294, 0.2705882, 1, 0, 1,
-0.6745337, 0.1676882, -1.991216, 0.2666667, 1, 0, 1,
-0.6697621, -2.115942, -3.597375, 0.2588235, 1, 0, 1,
-0.6684007, -0.5441178, -1.931101, 0.254902, 1, 0, 1,
-0.6652184, -0.01713707, -2.864945, 0.2470588, 1, 0, 1,
-0.6635334, -0.5261738, 0.4549412, 0.2431373, 1, 0, 1,
-0.661696, -0.03437001, -2.334757, 0.2352941, 1, 0, 1,
-0.66059, 0.4322327, -0.4653419, 0.2313726, 1, 0, 1,
-0.6596978, 1.012636, -0.8650413, 0.2235294, 1, 0, 1,
-0.6457239, -0.2022588, -2.781452, 0.2196078, 1, 0, 1,
-0.6451624, -0.4240579, -1.744707, 0.2117647, 1, 0, 1,
-0.6408604, 0.03127157, -0.3321498, 0.2078431, 1, 0, 1,
-0.6373726, -1.200559, -1.357191, 0.2, 1, 0, 1,
-0.6302661, 0.007596261, -0.9796973, 0.1921569, 1, 0, 1,
-0.6299459, -0.4294086, -3.48848, 0.1882353, 1, 0, 1,
-0.6253585, 0.3652045, 0.009937861, 0.1803922, 1, 0, 1,
-0.6225613, -0.6845918, -4.265318, 0.1764706, 1, 0, 1,
-0.6162629, 0.473293, -1.583237, 0.1686275, 1, 0, 1,
-0.6116403, -0.2203154, -1.328745, 0.1647059, 1, 0, 1,
-0.6109269, -1.138484, -1.805642, 0.1568628, 1, 0, 1,
-0.6086399, 0.2971245, -1.202729, 0.1529412, 1, 0, 1,
-0.6076605, 0.7532104, -1.638744, 0.145098, 1, 0, 1,
-0.6016834, 0.1365825, -1.931562, 0.1411765, 1, 0, 1,
-0.6001763, -0.9389589, -1.119744, 0.1333333, 1, 0, 1,
-0.5996119, -0.9013084, -2.219076, 0.1294118, 1, 0, 1,
-0.5942555, 0.09860411, -1.137664, 0.1215686, 1, 0, 1,
-0.5905186, -0.6542136, -2.13696, 0.1176471, 1, 0, 1,
-0.5876673, -1.62023, -3.138468, 0.1098039, 1, 0, 1,
-0.5870354, -0.5724729, -1.221674, 0.1058824, 1, 0, 1,
-0.5869425, -0.471474, -2.43667, 0.09803922, 1, 0, 1,
-0.5854207, 0.1321772, 0.8374164, 0.09019608, 1, 0, 1,
-0.5846956, 0.9136167, -0.3567467, 0.08627451, 1, 0, 1,
-0.5833805, -0.08811504, -2.01823, 0.07843138, 1, 0, 1,
-0.5830748, 1.529699, 0.8158728, 0.07450981, 1, 0, 1,
-0.5761757, -0.4730094, -2.244823, 0.06666667, 1, 0, 1,
-0.5760375, -0.1930024, -1.966848, 0.0627451, 1, 0, 1,
-0.5754315, -1.772289, -1.891961, 0.05490196, 1, 0, 1,
-0.5753793, 1.114296, -0.4831384, 0.05098039, 1, 0, 1,
-0.5746409, 0.974973, -1.777197, 0.04313726, 1, 0, 1,
-0.5727603, -0.829757, -2.97104, 0.03921569, 1, 0, 1,
-0.5709329, 0.3437366, -1.024563, 0.03137255, 1, 0, 1,
-0.5680621, 0.5125555, -0.1282691, 0.02745098, 1, 0, 1,
-0.563545, 1.537659, -0.272046, 0.01960784, 1, 0, 1,
-0.5585489, -0.4596648, -0.08181223, 0.01568628, 1, 0, 1,
-0.549659, 0.6963199, -1.957486, 0.007843138, 1, 0, 1,
-0.5486344, 0.7937287, -1.204065, 0.003921569, 1, 0, 1,
-0.5479643, 0.1480913, 0.7052066, 0, 1, 0.003921569, 1,
-0.5463124, 2.105304, -0.5713739, 0, 1, 0.01176471, 1,
-0.546074, 1.507933, 0.7102531, 0, 1, 0.01568628, 1,
-0.5405652, 0.3667234, -0.913144, 0, 1, 0.02352941, 1,
-0.5392635, 0.4474619, -1.295545, 0, 1, 0.02745098, 1,
-0.5351759, -0.19664, -2.155698, 0, 1, 0.03529412, 1,
-0.5324057, -1.519362, -1.672578, 0, 1, 0.03921569, 1,
-0.5312215, 1.436588, -0.1850213, 0, 1, 0.04705882, 1,
-0.526907, 0.6535849, -0.255613, 0, 1, 0.05098039, 1,
-0.5229834, 0.6068101, 0.6919543, 0, 1, 0.05882353, 1,
-0.5214391, -1.035847, -0.0003117884, 0, 1, 0.0627451, 1,
-0.5191945, -0.4396605, -2.983473, 0, 1, 0.07058824, 1,
-0.5186186, 0.7214175, 0.6724918, 0, 1, 0.07450981, 1,
-0.5141488, -0.7773185, -3.096114, 0, 1, 0.08235294, 1,
-0.5136914, -1.52863, -3.573262, 0, 1, 0.08627451, 1,
-0.5109569, 0.5848487, -1.411318, 0, 1, 0.09411765, 1,
-0.5075749, -2.407476, -1.259374, 0, 1, 0.1019608, 1,
-0.5073394, 0.9967206, -1.234138, 0, 1, 0.1058824, 1,
-0.5065237, 0.6047633, -0.2610985, 0, 1, 0.1137255, 1,
-0.5049779, 0.9405702, -0.4484492, 0, 1, 0.1176471, 1,
-0.5024739, -0.5299449, -2.540974, 0, 1, 0.1254902, 1,
-0.4989091, -1.04374, -1.961672, 0, 1, 0.1294118, 1,
-0.4959065, -0.3565426, -3.774342, 0, 1, 0.1372549, 1,
-0.4948921, 0.09394613, -1.049319, 0, 1, 0.1411765, 1,
-0.494636, -0.9040796, -4.751461, 0, 1, 0.1490196, 1,
-0.4858935, -0.05758551, -1.829276, 0, 1, 0.1529412, 1,
-0.4856328, -0.695003, -3.746061, 0, 1, 0.1607843, 1,
-0.4831793, 0.2658189, -1.377649, 0, 1, 0.1647059, 1,
-0.4788954, -0.04108857, -1.760405, 0, 1, 0.172549, 1,
-0.4766462, -0.2235764, -2.952571, 0, 1, 0.1764706, 1,
-0.4763475, 0.359343, -1.684562, 0, 1, 0.1843137, 1,
-0.4754749, -0.06747014, -3.04224, 0, 1, 0.1882353, 1,
-0.4750061, -0.6979946, -1.701951, 0, 1, 0.1960784, 1,
-0.470915, 0.3148835, -0.414884, 0, 1, 0.2039216, 1,
-0.4703383, -2.166091, -4.074736, 0, 1, 0.2078431, 1,
-0.4697776, -1.026016, -2.655513, 0, 1, 0.2156863, 1,
-0.4650579, 0.1217993, -0.1821691, 0, 1, 0.2196078, 1,
-0.4588733, 0.1795971, -1.758359, 0, 1, 0.227451, 1,
-0.4572915, -0.04032624, -0.2249668, 0, 1, 0.2313726, 1,
-0.4507613, 1.560758, 1.93137, 0, 1, 0.2392157, 1,
-0.4498786, -0.6132967, -1.997601, 0, 1, 0.2431373, 1,
-0.4460514, 0.2620724, 0.2328348, 0, 1, 0.2509804, 1,
-0.4442152, -0.6438377, -1.234463, 0, 1, 0.254902, 1,
-0.4414636, 0.4017509, -0.8642349, 0, 1, 0.2627451, 1,
-0.4366255, -2.111349, -1.60297, 0, 1, 0.2666667, 1,
-0.435463, -0.5174436, -0.2633507, 0, 1, 0.2745098, 1,
-0.4312309, -2.061176, -4.009696, 0, 1, 0.2784314, 1,
-0.4295149, 0.6327905, -0.1963349, 0, 1, 0.2862745, 1,
-0.4179969, 0.9726768, -1.284487, 0, 1, 0.2901961, 1,
-0.416898, 1.387016, -0.9535671, 0, 1, 0.2980392, 1,
-0.4160622, -0.1206978, -1.808215, 0, 1, 0.3058824, 1,
-0.4155127, 0.8536357, 1.059132, 0, 1, 0.3098039, 1,
-0.4081498, -0.1505261, -0.6474569, 0, 1, 0.3176471, 1,
-0.4049465, 1.667752, -0.9845693, 0, 1, 0.3215686, 1,
-0.402448, 1.592589, 0.3022642, 0, 1, 0.3294118, 1,
-0.3988169, -1.864528, -1.401885, 0, 1, 0.3333333, 1,
-0.3940629, -1.478293, -4.19653, 0, 1, 0.3411765, 1,
-0.387971, -0.7078112, -4.414568, 0, 1, 0.345098, 1,
-0.3863351, -1.069502, -2.276196, 0, 1, 0.3529412, 1,
-0.3849868, 0.8924416, -1.127801, 0, 1, 0.3568628, 1,
-0.3840306, 1.039506, 1.195499, 0, 1, 0.3647059, 1,
-0.3806479, -0.1380527, -1.432232, 0, 1, 0.3686275, 1,
-0.3805152, -0.7641354, -2.710215, 0, 1, 0.3764706, 1,
-0.3755452, 0.1763215, -2.028553, 0, 1, 0.3803922, 1,
-0.374405, -0.5003545, -4.598956, 0, 1, 0.3882353, 1,
-0.3707547, 0.4409673, -0.5749348, 0, 1, 0.3921569, 1,
-0.3691939, -0.5173474, -2.285752, 0, 1, 0.4, 1,
-0.3629703, 0.4014212, -1.324269, 0, 1, 0.4078431, 1,
-0.3598044, -0.2979059, -1.075837, 0, 1, 0.4117647, 1,
-0.359474, -0.7416416, -1.962089, 0, 1, 0.4196078, 1,
-0.3586518, -2.035547, -3.331076, 0, 1, 0.4235294, 1,
-0.3427965, 1.997496, -1.230776, 0, 1, 0.4313726, 1,
-0.3384743, -1.802137, -3.11337, 0, 1, 0.4352941, 1,
-0.3380734, 2.313463, -1.091394, 0, 1, 0.4431373, 1,
-0.3351351, 2.238142, -0.3835931, 0, 1, 0.4470588, 1,
-0.3301163, -0.5257213, -3.092611, 0, 1, 0.454902, 1,
-0.3288899, 0.1243071, -2.979143, 0, 1, 0.4588235, 1,
-0.3266984, 0.6267291, -0.7375658, 0, 1, 0.4666667, 1,
-0.3248491, -0.2396269, -3.391585, 0, 1, 0.4705882, 1,
-0.3209386, -0.3083339, -1.377842, 0, 1, 0.4784314, 1,
-0.3200117, 0.9241896, -3.017649, 0, 1, 0.4823529, 1,
-0.3185668, 1.158448, -0.9193196, 0, 1, 0.4901961, 1,
-0.3161372, 0.4764915, -1.706213, 0, 1, 0.4941176, 1,
-0.3160847, -2.319838, -2.255976, 0, 1, 0.5019608, 1,
-0.3120123, -0.5209745, -2.943411, 0, 1, 0.509804, 1,
-0.3096629, 0.4214223, 0.1558316, 0, 1, 0.5137255, 1,
-0.3076591, 1.924281, 0.5044385, 0, 1, 0.5215687, 1,
-0.305719, -0.1748874, -1.274994, 0, 1, 0.5254902, 1,
-0.3039122, -1.07077, -3.652617, 0, 1, 0.5333334, 1,
-0.303816, 2.545771, -0.6438857, 0, 1, 0.5372549, 1,
-0.3022607, -0.04954002, -1.725312, 0, 1, 0.5450981, 1,
-0.3011639, -0.1207047, -1.62363, 0, 1, 0.5490196, 1,
-0.3007448, -0.6094387, -4.962057, 0, 1, 0.5568628, 1,
-0.2994578, -2.304704, -3.36, 0, 1, 0.5607843, 1,
-0.2987334, -0.4157491, -3.459068, 0, 1, 0.5686275, 1,
-0.2984397, -0.145834, -0.6448629, 0, 1, 0.572549, 1,
-0.2976258, -0.7298701, -2.250748, 0, 1, 0.5803922, 1,
-0.2956703, -0.0974673, -0.2628594, 0, 1, 0.5843138, 1,
-0.2819132, -1.319114, -3.224479, 0, 1, 0.5921569, 1,
-0.2766729, -0.2419158, -2.373801, 0, 1, 0.5960785, 1,
-0.275953, 0.09154809, -2.026821, 0, 1, 0.6039216, 1,
-0.2728696, -0.5615495, -3.204758, 0, 1, 0.6117647, 1,
-0.2637151, -1.092723, -1.635455, 0, 1, 0.6156863, 1,
-0.249678, 0.5426067, -1.677497, 0, 1, 0.6235294, 1,
-0.2459075, 0.6940305, -1.815754, 0, 1, 0.627451, 1,
-0.2427256, 1.05486, -1.402888, 0, 1, 0.6352941, 1,
-0.2382817, 0.4586571, 0.1979886, 0, 1, 0.6392157, 1,
-0.2338321, 2.018972, 0.4410988, 0, 1, 0.6470588, 1,
-0.2278752, 1.683572, -1.213678, 0, 1, 0.6509804, 1,
-0.2276934, -1.57767, -2.554458, 0, 1, 0.6588235, 1,
-0.2265482, 0.9758295, 0.8401251, 0, 1, 0.6627451, 1,
-0.2250794, 0.9319707, 0.001496029, 0, 1, 0.6705883, 1,
-0.2242274, 1.160907, -0.6908476, 0, 1, 0.6745098, 1,
-0.2238631, 0.248095, -0.9327317, 0, 1, 0.682353, 1,
-0.2224756, -0.3194701, -2.995262, 0, 1, 0.6862745, 1,
-0.2189929, 0.9874019, -0.3397736, 0, 1, 0.6941177, 1,
-0.2169944, 1.308884, -1.0681, 0, 1, 0.7019608, 1,
-0.2168316, -0.2206752, -3.138046, 0, 1, 0.7058824, 1,
-0.2105553, -0.9074212, -4.208919, 0, 1, 0.7137255, 1,
-0.2076353, 0.06493969, -1.933685, 0, 1, 0.7176471, 1,
-0.207101, -1.355561, -1.114077, 0, 1, 0.7254902, 1,
-0.2068116, -1.657438, -4.97014, 0, 1, 0.7294118, 1,
-0.2068022, -0.4679239, -3.144927, 0, 1, 0.7372549, 1,
-0.2059713, 0.6599721, 0.576969, 0, 1, 0.7411765, 1,
-0.2052157, -1.914524, -2.925332, 0, 1, 0.7490196, 1,
-0.2025573, 1.112206, -0.6162202, 0, 1, 0.7529412, 1,
-0.2022999, -1.134607, -3.337471, 0, 1, 0.7607843, 1,
-0.1952669, 0.8400695, -0.4442636, 0, 1, 0.7647059, 1,
-0.1950996, -1.058897, -3.485271, 0, 1, 0.772549, 1,
-0.19102, -1.462393, -1.973092, 0, 1, 0.7764706, 1,
-0.1859999, 2.443171, -0.2587933, 0, 1, 0.7843137, 1,
-0.1856897, -0.9692928, -3.906996, 0, 1, 0.7882353, 1,
-0.1811694, 0.02433548, -0.8466499, 0, 1, 0.7960784, 1,
-0.1732362, -0.2791013, -2.934673, 0, 1, 0.8039216, 1,
-0.167927, 1.540101, -0.5961247, 0, 1, 0.8078431, 1,
-0.1659404, -1.940996, -3.594489, 0, 1, 0.8156863, 1,
-0.1655292, 1.054726, -1.284256, 0, 1, 0.8196079, 1,
-0.1642169, -0.02265911, -0.9653869, 0, 1, 0.827451, 1,
-0.162745, -0.03421771, -2.861366, 0, 1, 0.8313726, 1,
-0.1567291, 0.4236137, -0.4629377, 0, 1, 0.8392157, 1,
-0.1563033, -0.8418089, -3.365766, 0, 1, 0.8431373, 1,
-0.1510664, 1.290709, 0.1841215, 0, 1, 0.8509804, 1,
-0.1498286, 0.3666105, -3.050768, 0, 1, 0.854902, 1,
-0.145648, 0.1101171, 0.9347715, 0, 1, 0.8627451, 1,
-0.1435518, -0.4377586, -3.439616, 0, 1, 0.8666667, 1,
-0.1417743, 0.5808734, 0.6507417, 0, 1, 0.8745098, 1,
-0.1346665, 1.337408, 1.031112, 0, 1, 0.8784314, 1,
-0.1330474, 0.6044572, 0.6896234, 0, 1, 0.8862745, 1,
-0.1309875, 0.5339954, -0.1057167, 0, 1, 0.8901961, 1,
-0.1288027, -0.4038953, -2.076931, 0, 1, 0.8980392, 1,
-0.1244371, -0.06629615, -1.964129, 0, 1, 0.9058824, 1,
-0.1232996, 0.7064376, 0.1648327, 0, 1, 0.9098039, 1,
-0.1148723, 0.6461862, -0.7395697, 0, 1, 0.9176471, 1,
-0.1115794, -0.315043, -2.055891, 0, 1, 0.9215686, 1,
-0.1104618, 1.117643, -0.8856866, 0, 1, 0.9294118, 1,
-0.1050264, -0.7930738, -2.081426, 0, 1, 0.9333333, 1,
-0.1037458, 0.5404829, 0.8445528, 0, 1, 0.9411765, 1,
-0.1010107, -0.5594355, -1.867787, 0, 1, 0.945098, 1,
-0.1009824, 0.09938136, -0.6483829, 0, 1, 0.9529412, 1,
-0.09988355, -0.4814363, -4.600066, 0, 1, 0.9568627, 1,
-0.09698705, -0.01971148, -1.801954, 0, 1, 0.9647059, 1,
-0.09579638, -1.90679, -2.494897, 0, 1, 0.9686275, 1,
-0.0931647, -0.622472, -3.297988, 0, 1, 0.9764706, 1,
-0.08616687, -0.1217135, -3.543788, 0, 1, 0.9803922, 1,
-0.08186568, -0.8024796, -2.951913, 0, 1, 0.9882353, 1,
-0.08174739, -2.210313, -3.179718, 0, 1, 0.9921569, 1,
-0.08082383, -0.6748447, -5.195677, 0, 1, 1, 1,
-0.07919613, -0.2005181, -0.462887, 0, 0.9921569, 1, 1,
-0.07586046, -0.9850011, -2.183367, 0, 0.9882353, 1, 1,
-0.07446967, -0.2773426, -3.343865, 0, 0.9803922, 1, 1,
-0.07323377, 1.530417, -0.6529541, 0, 0.9764706, 1, 1,
-0.07156285, 0.2097585, -0.5134426, 0, 0.9686275, 1, 1,
-0.07124945, 0.716785, -1.750679, 0, 0.9647059, 1, 1,
-0.06973556, 0.8498991, 0.3923229, 0, 0.9568627, 1, 1,
-0.06626083, 1.075409, -1.945133, 0, 0.9529412, 1, 1,
-0.06286822, 0.1807586, -1.253649, 0, 0.945098, 1, 1,
-0.05893777, 0.3366851, 0.3951083, 0, 0.9411765, 1, 1,
-0.04447522, -0.2311225, -2.764704, 0, 0.9333333, 1, 1,
-0.04335137, 0.1518243, -0.500377, 0, 0.9294118, 1, 1,
-0.03736432, -0.1809446, -2.066574, 0, 0.9215686, 1, 1,
-0.03000477, -1.506707, -2.72776, 0, 0.9176471, 1, 1,
-0.02977503, 0.5103247, 0.9366562, 0, 0.9098039, 1, 1,
-0.02680925, 1.42915, 0.2631472, 0, 0.9058824, 1, 1,
-0.02635727, -2.249926, -2.013983, 0, 0.8980392, 1, 1,
-0.02395057, 2.358494, 0.5058316, 0, 0.8901961, 1, 1,
-0.02379167, -0.6475521, -3.636289, 0, 0.8862745, 1, 1,
-0.02254449, 1.106026, 0.6375892, 0, 0.8784314, 1, 1,
-0.01214994, -0.9839305, -2.696813, 0, 0.8745098, 1, 1,
-0.01113551, 1.555423, 1.786674, 0, 0.8666667, 1, 1,
-0.01068472, -0.9642181, -4.617649, 0, 0.8627451, 1, 1,
-0.005298735, -0.1355538, -3.556631, 0, 0.854902, 1, 1,
-0.001750177, 0.4094831, 0.5929813, 0, 0.8509804, 1, 1,
0.0006797854, -0.008275266, 3.221712, 0, 0.8431373, 1, 1,
0.001389295, -1.667577, 4.487314, 0, 0.8392157, 1, 1,
0.002527473, 0.1231039, -0.08682705, 0, 0.8313726, 1, 1,
0.005498809, 0.3899992, 0.9151052, 0, 0.827451, 1, 1,
0.007530413, -0.5787495, 3.36996, 0, 0.8196079, 1, 1,
0.01048563, 0.3299242, 0.825997, 0, 0.8156863, 1, 1,
0.0105631, 1.614229, -0.2380335, 0, 0.8078431, 1, 1,
0.01494516, -1.012716, 5.043274, 0, 0.8039216, 1, 1,
0.01969502, -0.8764635, 2.21564, 0, 0.7960784, 1, 1,
0.01974347, -0.1160747, 0.9205753, 0, 0.7882353, 1, 1,
0.02024995, -0.6556509, 2.778374, 0, 0.7843137, 1, 1,
0.02225489, -0.01035815, 1.986665, 0, 0.7764706, 1, 1,
0.02281296, 0.7226454, -1.12344, 0, 0.772549, 1, 1,
0.02343667, 2.096083, -0.9574834, 0, 0.7647059, 1, 1,
0.02982074, -0.4551703, 1.829241, 0, 0.7607843, 1, 1,
0.0306776, 1.01285, -0.5647269, 0, 0.7529412, 1, 1,
0.03366661, -0.2186755, 2.711465, 0, 0.7490196, 1, 1,
0.04141258, -1.30768, 3.846372, 0, 0.7411765, 1, 1,
0.04265908, 0.6666217, -0.07939596, 0, 0.7372549, 1, 1,
0.04405345, 0.679217, -0.7027283, 0, 0.7294118, 1, 1,
0.04800399, -0.894372, 2.101637, 0, 0.7254902, 1, 1,
0.05230187, -0.8521168, 3.670366, 0, 0.7176471, 1, 1,
0.0529315, 0.6206912, 1.091675, 0, 0.7137255, 1, 1,
0.05738533, 0.6821801, 0.8976559, 0, 0.7058824, 1, 1,
0.05815124, -0.7508197, 1.527048, 0, 0.6980392, 1, 1,
0.06267921, 0.5451377, -0.5273182, 0, 0.6941177, 1, 1,
0.06412753, 0.4371396, -0.5098296, 0, 0.6862745, 1, 1,
0.06420921, 2.510076, -1.17138, 0, 0.682353, 1, 1,
0.06935391, -0.09303435, 1.424781, 0, 0.6745098, 1, 1,
0.07368694, -0.8268864, 4.43303, 0, 0.6705883, 1, 1,
0.07394951, -0.04612504, 1.782281, 0, 0.6627451, 1, 1,
0.07573171, 0.08435874, 1.736923, 0, 0.6588235, 1, 1,
0.07584208, 0.1130926, -2.163126, 0, 0.6509804, 1, 1,
0.07627056, 0.5523047, -1.842265, 0, 0.6470588, 1, 1,
0.07655612, -0.08908355, 3.127679, 0, 0.6392157, 1, 1,
0.07666892, 1.476987, 0.5316424, 0, 0.6352941, 1, 1,
0.07704131, -1.136456, 1.743889, 0, 0.627451, 1, 1,
0.07793425, -0.1279946, 1.177391, 0, 0.6235294, 1, 1,
0.08118975, 0.9959942, 0.6912622, 0, 0.6156863, 1, 1,
0.08500819, -0.09542217, 0.9468877, 0, 0.6117647, 1, 1,
0.09122748, -0.3587405, 3.101929, 0, 0.6039216, 1, 1,
0.09962092, 1.231729, -0.09676353, 0, 0.5960785, 1, 1,
0.1046585, -0.1819332, 2.412137, 0, 0.5921569, 1, 1,
0.1111009, 0.2000933, 1.594922, 0, 0.5843138, 1, 1,
0.11891, -0.5169773, 3.146481, 0, 0.5803922, 1, 1,
0.1194176, 1.088351, 0.6683351, 0, 0.572549, 1, 1,
0.122137, 0.4249497, 0.2817913, 0, 0.5686275, 1, 1,
0.1232763, -0.8585941, 2.929296, 0, 0.5607843, 1, 1,
0.1279459, 2.26586, -1.294145, 0, 0.5568628, 1, 1,
0.1283094, 0.1607984, 0.5286077, 0, 0.5490196, 1, 1,
0.1300702, -0.1225762, 2.639493, 0, 0.5450981, 1, 1,
0.1331032, 0.08581071, 0.7637051, 0, 0.5372549, 1, 1,
0.1364449, 0.9479548, 0.1508862, 0, 0.5333334, 1, 1,
0.1375713, -1.191328, 3.66594, 0, 0.5254902, 1, 1,
0.1402504, 0.02165612, 1.558241, 0, 0.5215687, 1, 1,
0.1412359, 0.9950988, 0.3145294, 0, 0.5137255, 1, 1,
0.1436779, -0.3596287, 2.384213, 0, 0.509804, 1, 1,
0.1453015, 0.3406057, 1.111951, 0, 0.5019608, 1, 1,
0.1495017, -1.128087, 2.281878, 0, 0.4941176, 1, 1,
0.1498248, -1.597716, 3.381232, 0, 0.4901961, 1, 1,
0.150888, 1.8477, -0.5405697, 0, 0.4823529, 1, 1,
0.1553463, 0.4054464, 1.016196, 0, 0.4784314, 1, 1,
0.1587567, 0.6205545, -0.3885754, 0, 0.4705882, 1, 1,
0.1588047, -0.01133708, -0.5932986, 0, 0.4666667, 1, 1,
0.1621149, -0.5541955, 3.39776, 0, 0.4588235, 1, 1,
0.1623535, 0.6875697, -0.2427885, 0, 0.454902, 1, 1,
0.1656791, 0.9085103, -1.090813, 0, 0.4470588, 1, 1,
0.1686204, 1.058566, 0.5150704, 0, 0.4431373, 1, 1,
0.170526, -1.122157, 2.521981, 0, 0.4352941, 1, 1,
0.176439, -0.2323118, 2.17131, 0, 0.4313726, 1, 1,
0.1781105, -0.1453397, 2.061787, 0, 0.4235294, 1, 1,
0.1786209, -1.344443, -0.04021651, 0, 0.4196078, 1, 1,
0.1789138, 0.3094128, 0.6636763, 0, 0.4117647, 1, 1,
0.1789708, 0.9631354, 0.7737366, 0, 0.4078431, 1, 1,
0.1814461, 0.1167399, 1.026067, 0, 0.4, 1, 1,
0.183117, 0.5611084, -1.34392, 0, 0.3921569, 1, 1,
0.1835226, -0.7889212, 3.034561, 0, 0.3882353, 1, 1,
0.1845418, 0.6267732, 1.585817, 0, 0.3803922, 1, 1,
0.1871031, -0.8294573, 2.82844, 0, 0.3764706, 1, 1,
0.1875655, 0.2304541, -2.078271, 0, 0.3686275, 1, 1,
0.1885134, 1.787726, 1.437955, 0, 0.3647059, 1, 1,
0.188586, 2.0442, 0.726061, 0, 0.3568628, 1, 1,
0.1908367, -0.0198891, 0.7294726, 0, 0.3529412, 1, 1,
0.1934708, -1.642271, 3.211607, 0, 0.345098, 1, 1,
0.2054289, 1.881329, 0.9043141, 0, 0.3411765, 1, 1,
0.2134194, 0.7754384, 0.8116256, 0, 0.3333333, 1, 1,
0.2141576, -1.928028, 3.017758, 0, 0.3294118, 1, 1,
0.2202453, 0.3815472, 1.199451, 0, 0.3215686, 1, 1,
0.2226613, 0.5213971, 1.000386, 0, 0.3176471, 1, 1,
0.2250775, -0.3880636, 2.554985, 0, 0.3098039, 1, 1,
0.2316613, 0.7399087, 0.02994437, 0, 0.3058824, 1, 1,
0.2321798, -0.2780085, 1.606206, 0, 0.2980392, 1, 1,
0.2348475, 0.3233229, 0.7650044, 0, 0.2901961, 1, 1,
0.2354376, 1.532738, -0.8004148, 0, 0.2862745, 1, 1,
0.2372166, 0.793179, 0.1825771, 0, 0.2784314, 1, 1,
0.243448, -0.947637, 4.044658, 0, 0.2745098, 1, 1,
0.2453733, 1.711256, -1.588772, 0, 0.2666667, 1, 1,
0.2463871, -0.09841844, 0.3745209, 0, 0.2627451, 1, 1,
0.2479014, -1.092303, 2.520287, 0, 0.254902, 1, 1,
0.2482266, 1.220932, 1.282307, 0, 0.2509804, 1, 1,
0.2588634, 0.3354414, 1.055342, 0, 0.2431373, 1, 1,
0.2597253, -0.5887001, 2.974656, 0, 0.2392157, 1, 1,
0.2618695, 0.469552, 1.184085, 0, 0.2313726, 1, 1,
0.2665504, -0.01221736, 0.5814386, 0, 0.227451, 1, 1,
0.2679959, -0.9798971, 3.115271, 0, 0.2196078, 1, 1,
0.2723971, 1.082102, -1.275915, 0, 0.2156863, 1, 1,
0.2788111, 1.136768, -0.1864585, 0, 0.2078431, 1, 1,
0.2811148, -0.2255312, 1.9138, 0, 0.2039216, 1, 1,
0.2838278, 1.122399, 1.077795, 0, 0.1960784, 1, 1,
0.2849903, 0.5101824, 1.265706, 0, 0.1882353, 1, 1,
0.2866612, -1.299156, 1.549483, 0, 0.1843137, 1, 1,
0.2917772, 0.5148591, 1.379776, 0, 0.1764706, 1, 1,
0.2942506, 0.4092914, -0.193919, 0, 0.172549, 1, 1,
0.294768, 0.700548, 1.056257, 0, 0.1647059, 1, 1,
0.297633, -0.5151507, 3.807622, 0, 0.1607843, 1, 1,
0.2999195, -0.2261493, 3.318066, 0, 0.1529412, 1, 1,
0.3076267, 1.196835, -0.07014912, 0, 0.1490196, 1, 1,
0.3109697, -0.7321982, 3.232932, 0, 0.1411765, 1, 1,
0.3139006, -2.035074, 3.853079, 0, 0.1372549, 1, 1,
0.3139296, 0.6409803, 1.187143, 0, 0.1294118, 1, 1,
0.3173463, 0.02953055, 1.30956, 0, 0.1254902, 1, 1,
0.3193378, 0.3037131, 0.5425952, 0, 0.1176471, 1, 1,
0.322894, -0.01674016, 2.366056, 0, 0.1137255, 1, 1,
0.3268, 0.1108018, 1.984705, 0, 0.1058824, 1, 1,
0.3306724, -1.311074, 3.326192, 0, 0.09803922, 1, 1,
0.3338936, 0.6031407, 2.101947, 0, 0.09411765, 1, 1,
0.3359898, -0.3807099, 2.517108, 0, 0.08627451, 1, 1,
0.3388655, -0.2943407, 2.81152, 0, 0.08235294, 1, 1,
0.3389762, -1.957286, 3.140507, 0, 0.07450981, 1, 1,
0.3404503, 0.2163699, 2.014812, 0, 0.07058824, 1, 1,
0.3439705, 1.104496, -0.0368885, 0, 0.0627451, 1, 1,
0.3441767, -2.475649, 2.477417, 0, 0.05882353, 1, 1,
0.3489145, 0.5800352, 0.2721986, 0, 0.05098039, 1, 1,
0.3500598, -0.4256183, 2.457693, 0, 0.04705882, 1, 1,
0.3521654, -0.01082995, 1.791214, 0, 0.03921569, 1, 1,
0.3538754, -1.428495, 3.610033, 0, 0.03529412, 1, 1,
0.3585126, 0.1115633, 1.064101, 0, 0.02745098, 1, 1,
0.3621144, -0.6629466, 2.358563, 0, 0.02352941, 1, 1,
0.3628113, 0.04446734, -0.7691134, 0, 0.01568628, 1, 1,
0.3645352, -0.1338553, 0.8074828, 0, 0.01176471, 1, 1,
0.364828, -0.5430232, 0.6934542, 0, 0.003921569, 1, 1,
0.3660114, -0.04618425, 1.789002, 0.003921569, 0, 1, 1,
0.3741762, 0.1140019, 0.9189959, 0.007843138, 0, 1, 1,
0.3748095, -1.796662, 4.146801, 0.01568628, 0, 1, 1,
0.3823799, -0.01755351, 3.194791, 0.01960784, 0, 1, 1,
0.383895, 1.55829, 0.244991, 0.02745098, 0, 1, 1,
0.398505, 0.06818515, 2.563308, 0.03137255, 0, 1, 1,
0.3989647, 0.668615, 0.01803604, 0.03921569, 0, 1, 1,
0.4032593, -0.3753534, 3.172436, 0.04313726, 0, 1, 1,
0.4058537, -0.5065963, 0.2809395, 0.05098039, 0, 1, 1,
0.4078808, -0.5447206, 3.108278, 0.05490196, 0, 1, 1,
0.4080218, -0.6930796, 4.351626, 0.0627451, 0, 1, 1,
0.4092841, -0.4541934, 1.601113, 0.06666667, 0, 1, 1,
0.4122588, -0.9281561, 2.898712, 0.07450981, 0, 1, 1,
0.4125407, -1.04081, 3.205182, 0.07843138, 0, 1, 1,
0.4171042, 0.3287042, 1.820105, 0.08627451, 0, 1, 1,
0.4200308, -1.003641, 1.668622, 0.09019608, 0, 1, 1,
0.4203344, 0.7556558, 1.180731, 0.09803922, 0, 1, 1,
0.426126, -0.3480943, 0.8095335, 0.1058824, 0, 1, 1,
0.4289513, -3.333023, 4.24206, 0.1098039, 0, 1, 1,
0.4293599, 1.977567, -1.052707, 0.1176471, 0, 1, 1,
0.4314212, -1.215862, 0.7023841, 0.1215686, 0, 1, 1,
0.4327002, -0.1979783, 2.490135, 0.1294118, 0, 1, 1,
0.4378327, -1.841911, 3.980266, 0.1333333, 0, 1, 1,
0.439232, -0.09723455, 0.2876559, 0.1411765, 0, 1, 1,
0.4402806, -0.2266042, 2.734754, 0.145098, 0, 1, 1,
0.4564776, 0.06559638, 2.491026, 0.1529412, 0, 1, 1,
0.4578247, -2.321298, 1.628562, 0.1568628, 0, 1, 1,
0.4588136, -1.440874, 3.402639, 0.1647059, 0, 1, 1,
0.4654084, -0.3090224, 1.474251, 0.1686275, 0, 1, 1,
0.4657379, 1.133515, 0.9745283, 0.1764706, 0, 1, 1,
0.4698915, 1.101014, 0.4002607, 0.1803922, 0, 1, 1,
0.470255, -1.079005, 3.973073, 0.1882353, 0, 1, 1,
0.4709892, -0.954711, 4.053065, 0.1921569, 0, 1, 1,
0.4778756, 0.5682704, 1.959576, 0.2, 0, 1, 1,
0.48262, -0.3595823, 1.549959, 0.2078431, 0, 1, 1,
0.4857608, 1.777508, 1.499008, 0.2117647, 0, 1, 1,
0.4867591, -0.8382051, 1.588832, 0.2196078, 0, 1, 1,
0.4970949, 0.2794217, 1.149213, 0.2235294, 0, 1, 1,
0.5024261, 0.3532975, 1.726372, 0.2313726, 0, 1, 1,
0.5043622, -0.3813357, 3.268429, 0.2352941, 0, 1, 1,
0.5055409, -0.744982, 3.337877, 0.2431373, 0, 1, 1,
0.5099757, 0.9839406, 0.7726869, 0.2470588, 0, 1, 1,
0.513155, -0.5947099, 3.137681, 0.254902, 0, 1, 1,
0.5215662, 0.4476921, 1.589769, 0.2588235, 0, 1, 1,
0.5234183, 1.164651, -0.6118591, 0.2666667, 0, 1, 1,
0.528039, 0.9147723, -0.4790355, 0.2705882, 0, 1, 1,
0.5306119, -1.522515, 3.414138, 0.2784314, 0, 1, 1,
0.5403296, -0.1166869, 2.358392, 0.282353, 0, 1, 1,
0.5404736, -0.05449308, 2.248104, 0.2901961, 0, 1, 1,
0.5430408, -0.325602, 0.9443269, 0.2941177, 0, 1, 1,
0.5459306, 2.122099, 0.7902796, 0.3019608, 0, 1, 1,
0.5462134, -0.8784704, 1.621803, 0.3098039, 0, 1, 1,
0.5509298, -0.5591652, 3.238788, 0.3137255, 0, 1, 1,
0.552263, -0.5935464, 3.082456, 0.3215686, 0, 1, 1,
0.5541769, -0.07985726, 0.52797, 0.3254902, 0, 1, 1,
0.556528, 1.314285, -0.3700151, 0.3333333, 0, 1, 1,
0.5606285, -0.3563773, 2.227207, 0.3372549, 0, 1, 1,
0.5650925, -0.03421779, 2.356014, 0.345098, 0, 1, 1,
0.5665135, -0.1298567, 3.050047, 0.3490196, 0, 1, 1,
0.5726548, 0.5838691, 0.9489958, 0.3568628, 0, 1, 1,
0.5738841, 1.385955, 1.24596, 0.3607843, 0, 1, 1,
0.574421, 0.3030748, 1.246706, 0.3686275, 0, 1, 1,
0.5788816, -0.6303679, 0.8651984, 0.372549, 0, 1, 1,
0.5790125, -1.294866, 1.23841, 0.3803922, 0, 1, 1,
0.5921469, -1.702083, 1.970752, 0.3843137, 0, 1, 1,
0.593573, 0.3574173, 0.5394197, 0.3921569, 0, 1, 1,
0.5950482, 0.7458334, 2.84841, 0.3960784, 0, 1, 1,
0.596467, -0.0650874, 1.087464, 0.4039216, 0, 1, 1,
0.6011385, -0.6286335, 2.122426, 0.4117647, 0, 1, 1,
0.602749, 0.1526192, 1.3182, 0.4156863, 0, 1, 1,
0.6038203, 0.4038016, 1.026155, 0.4235294, 0, 1, 1,
0.6088027, -0.4220056, 0.4199802, 0.427451, 0, 1, 1,
0.6114648, -0.6839274, 3.015019, 0.4352941, 0, 1, 1,
0.6159865, 1.628289, -0.2165655, 0.4392157, 0, 1, 1,
0.616155, -1.103729, 3.137842, 0.4470588, 0, 1, 1,
0.616899, 0.559935, 1.47959, 0.4509804, 0, 1, 1,
0.6184127, -1.244522, 2.789291, 0.4588235, 0, 1, 1,
0.6202204, -0.3387215, 2.839096, 0.4627451, 0, 1, 1,
0.6221328, -0.5531802, 2.561386, 0.4705882, 0, 1, 1,
0.6223909, -1.781295, 2.025182, 0.4745098, 0, 1, 1,
0.6275637, -1.424269, 5.406219, 0.4823529, 0, 1, 1,
0.6285579, 1.951657, 1.781035, 0.4862745, 0, 1, 1,
0.6288504, 0.3991204, -0.1185148, 0.4941176, 0, 1, 1,
0.6307775, 0.6699359, -0.1493001, 0.5019608, 0, 1, 1,
0.634736, -0.08110536, 1.833239, 0.5058824, 0, 1, 1,
0.6386712, 0.2231656, 1.10621, 0.5137255, 0, 1, 1,
0.6401498, 0.7825679, 1.789598, 0.5176471, 0, 1, 1,
0.6410894, 0.6448588, 0.2366695, 0.5254902, 0, 1, 1,
0.6463016, 0.1955019, -0.1168308, 0.5294118, 0, 1, 1,
0.6511019, 0.3219597, 0.7405527, 0.5372549, 0, 1, 1,
0.6519591, 0.4099239, 3.453212, 0.5411765, 0, 1, 1,
0.652139, 0.1773156, 0.125376, 0.5490196, 0, 1, 1,
0.6539795, 0.0451045, 0.6814335, 0.5529412, 0, 1, 1,
0.654581, 1.151275, -0.2246267, 0.5607843, 0, 1, 1,
0.6601633, 0.7430164, 0.9525455, 0.5647059, 0, 1, 1,
0.6657918, -0.009968348, 1.97798, 0.572549, 0, 1, 1,
0.667075, 1.414066, -0.7597905, 0.5764706, 0, 1, 1,
0.6767152, 0.0610968, 1.028418, 0.5843138, 0, 1, 1,
0.6826954, -1.030654, 1.994105, 0.5882353, 0, 1, 1,
0.6870945, -0.6591879, 2.680454, 0.5960785, 0, 1, 1,
0.6884291, 0.885731, -0.2022153, 0.6039216, 0, 1, 1,
0.6890616, 0.07420769, 0.8680169, 0.6078432, 0, 1, 1,
0.6903263, -0.7197314, 3.696683, 0.6156863, 0, 1, 1,
0.6926158, -2.19642, 3.333735, 0.6196079, 0, 1, 1,
0.6987944, 0.6510609, 1.795221, 0.627451, 0, 1, 1,
0.6993122, 0.01333406, 1.668879, 0.6313726, 0, 1, 1,
0.7031067, -0.5934892, 2.532799, 0.6392157, 0, 1, 1,
0.7037246, -1.937512, 3.373236, 0.6431373, 0, 1, 1,
0.7062182, 0.7248747, 1.257834, 0.6509804, 0, 1, 1,
0.7083442, -1.46728, 3.455415, 0.654902, 0, 1, 1,
0.7112931, -0.514441, 0.9299155, 0.6627451, 0, 1, 1,
0.7149215, -1.108346, 0.6511722, 0.6666667, 0, 1, 1,
0.732623, 1.239548, 0.3273204, 0.6745098, 0, 1, 1,
0.7329653, -1.363469, 1.696897, 0.6784314, 0, 1, 1,
0.7330813, -0.1076004, 3.964637, 0.6862745, 0, 1, 1,
0.7394865, -2.316473, 4.041773, 0.6901961, 0, 1, 1,
0.7413039, 0.7755278, -0.6258171, 0.6980392, 0, 1, 1,
0.7417526, -0.02693355, 1.607768, 0.7058824, 0, 1, 1,
0.7443015, -0.06862954, -0.01797416, 0.7098039, 0, 1, 1,
0.7462183, 0.06282309, 3.067746, 0.7176471, 0, 1, 1,
0.7483268, 1.57181, -0.8283109, 0.7215686, 0, 1, 1,
0.7485462, 0.2499069, 1.320102, 0.7294118, 0, 1, 1,
0.7487357, 0.808973, 0.3649223, 0.7333333, 0, 1, 1,
0.7520345, -0.4902267, 3.507447, 0.7411765, 0, 1, 1,
0.7527878, 0.5327247, 1.63744, 0.7450981, 0, 1, 1,
0.7541432, 0.2450894, 2.130054, 0.7529412, 0, 1, 1,
0.7542012, -0.6230237, 0.3222751, 0.7568628, 0, 1, 1,
0.7647789, 1.248405, -0.3925575, 0.7647059, 0, 1, 1,
0.769269, -1.517092, 2.664575, 0.7686275, 0, 1, 1,
0.7764701, 0.4539673, 0.6698383, 0.7764706, 0, 1, 1,
0.7778583, 0.2592247, 0.8569099, 0.7803922, 0, 1, 1,
0.7871706, -0.3692737, 3.11372, 0.7882353, 0, 1, 1,
0.7906778, -0.03238435, 0.4995647, 0.7921569, 0, 1, 1,
0.7917358, 0.9469714, 0.3136082, 0.8, 0, 1, 1,
0.7947647, 1.302392, -0.9092998, 0.8078431, 0, 1, 1,
0.8078169, 0.9331345, 1.912742, 0.8117647, 0, 1, 1,
0.8102177, -1.014215, 2.502104, 0.8196079, 0, 1, 1,
0.8124014, 1.135087, 0.7438399, 0.8235294, 0, 1, 1,
0.8132004, -0.09186033, 2.883334, 0.8313726, 0, 1, 1,
0.8136636, -0.8370279, 2.621796, 0.8352941, 0, 1, 1,
0.8189703, -1.250486, 3.227288, 0.8431373, 0, 1, 1,
0.8206742, -1.880456, 2.476275, 0.8470588, 0, 1, 1,
0.822733, -0.05302461, 0.3935533, 0.854902, 0, 1, 1,
0.832009, -1.517292, 2.433597, 0.8588235, 0, 1, 1,
0.8334237, -0.4892769, 2.240319, 0.8666667, 0, 1, 1,
0.8359376, 0.6500545, 0.9082283, 0.8705882, 0, 1, 1,
0.83949, -1.45137, 1.048049, 0.8784314, 0, 1, 1,
0.8496886, 0.5232673, -1.066332, 0.8823529, 0, 1, 1,
0.8532252, -0.5615681, 2.590979, 0.8901961, 0, 1, 1,
0.8606669, -1.120749, 1.795246, 0.8941177, 0, 1, 1,
0.8675523, -0.1086675, 1.2234, 0.9019608, 0, 1, 1,
0.875716, -1.079109, 4.816045, 0.9098039, 0, 1, 1,
0.8822473, 0.1360654, 2.350226, 0.9137255, 0, 1, 1,
0.8891654, -0.5833625, 0.7329052, 0.9215686, 0, 1, 1,
0.8907269, -0.7001109, 3.590719, 0.9254902, 0, 1, 1,
0.8916477, -0.7909749, 1.769547, 0.9333333, 0, 1, 1,
0.8921444, -0.1499087, 2.146083, 0.9372549, 0, 1, 1,
0.8969601, -0.5475151, 2.612096, 0.945098, 0, 1, 1,
0.899825, -0.429208, 2.480871, 0.9490196, 0, 1, 1,
0.9015146, -0.8640233, 2.448105, 0.9568627, 0, 1, 1,
0.9086195, 0.8668844, -0.5450982, 0.9607843, 0, 1, 1,
0.9135924, 0.4792565, -0.3057157, 0.9686275, 0, 1, 1,
0.9186051, 0.4260481, 1.070639, 0.972549, 0, 1, 1,
0.9193332, -0.6938251, 1.476386, 0.9803922, 0, 1, 1,
0.920577, 0.7359694, 0.3870094, 0.9843137, 0, 1, 1,
0.9245425, 1.285236, 0.7913463, 0.9921569, 0, 1, 1,
0.9267295, 0.5907314, 2.174562, 0.9960784, 0, 1, 1,
0.9283418, 0.2294434, 0.6572956, 1, 0, 0.9960784, 1,
0.9290659, 0.4345539, 1.658044, 1, 0, 0.9882353, 1,
0.9299642, 1.420596, 1.426379, 1, 0, 0.9843137, 1,
0.9383179, -1.023112, 2.716145, 1, 0, 0.9764706, 1,
0.938903, -1.92158, 1.679219, 1, 0, 0.972549, 1,
0.9401091, 0.358267, 0.2927822, 1, 0, 0.9647059, 1,
0.9416782, -0.3507322, 1.257638, 1, 0, 0.9607843, 1,
0.9446122, 0.6220183, 0.4254869, 1, 0, 0.9529412, 1,
0.9464881, 1.682948, -0.1606611, 1, 0, 0.9490196, 1,
0.9543788, 0.2290307, 0.9738677, 1, 0, 0.9411765, 1,
0.9558046, -1.007268, 2.751739, 1, 0, 0.9372549, 1,
0.9586896, -0.09792849, 2.607363, 1, 0, 0.9294118, 1,
0.9631224, 1.751589, 2.768677, 1, 0, 0.9254902, 1,
0.967492, -0.9338073, 2.192075, 1, 0, 0.9176471, 1,
0.9727356, 0.4119937, 0.9141987, 1, 0, 0.9137255, 1,
0.9814429, -0.3103816, 3.295328, 1, 0, 0.9058824, 1,
0.9879515, -1.140248, 2.870849, 1, 0, 0.9019608, 1,
0.9882787, -0.4733632, 1.710366, 1, 0, 0.8941177, 1,
1.005404, -0.6901377, 1.966514, 1, 0, 0.8862745, 1,
1.006009, 0.3837619, 1.293948, 1, 0, 0.8823529, 1,
1.006036, 0.1642534, 0.8849984, 1, 0, 0.8745098, 1,
1.011195, 0.8615483, 3.289361, 1, 0, 0.8705882, 1,
1.020471, 0.7429143, 0.4466941, 1, 0, 0.8627451, 1,
1.022448, -0.422962, 1.935886, 1, 0, 0.8588235, 1,
1.027539, 0.2652107, 1.851344, 1, 0, 0.8509804, 1,
1.028845, 0.307136, 1.231363, 1, 0, 0.8470588, 1,
1.03138, -0.8904103, 1.008583, 1, 0, 0.8392157, 1,
1.03381, -0.7019615, 1.006598, 1, 0, 0.8352941, 1,
1.034602, 1.788114, 1.873662, 1, 0, 0.827451, 1,
1.03536, 0.7327573, -0.402506, 1, 0, 0.8235294, 1,
1.035788, 0.1263678, 0.7117972, 1, 0, 0.8156863, 1,
1.040322, 0.9706429, -0.6838735, 1, 0, 0.8117647, 1,
1.046963, -1.063912, 1.842376, 1, 0, 0.8039216, 1,
1.053991, -0.7059419, -0.389252, 1, 0, 0.7960784, 1,
1.054607, 0.4321908, 1.53865, 1, 0, 0.7921569, 1,
1.05549, -0.6760593, 1.369621, 1, 0, 0.7843137, 1,
1.058258, 0.1843652, 1.708094, 1, 0, 0.7803922, 1,
1.062966, -1.332225, 1.909015, 1, 0, 0.772549, 1,
1.066644, 0.76091, 0.9268938, 1, 0, 0.7686275, 1,
1.067881, 1.25058, -0.3284531, 1, 0, 0.7607843, 1,
1.075022, 1.857903, 1.206308, 1, 0, 0.7568628, 1,
1.07718, 0.1699122, 0.3878081, 1, 0, 0.7490196, 1,
1.08296, -0.04696029, 0.6018942, 1, 0, 0.7450981, 1,
1.088668, 1.39286, 0.0347302, 1, 0, 0.7372549, 1,
1.089666, -0.9168369, 2.031419, 1, 0, 0.7333333, 1,
1.105793, 0.8497486, 1.570307, 1, 0, 0.7254902, 1,
1.112701, -1.602297, 1.339826, 1, 0, 0.7215686, 1,
1.116228, -0.9143291, 3.336165, 1, 0, 0.7137255, 1,
1.118464, 0.3942503, 2.345009, 1, 0, 0.7098039, 1,
1.122973, 0.7653698, -0.2523846, 1, 0, 0.7019608, 1,
1.125456, -0.7438705, 1.456787, 1, 0, 0.6941177, 1,
1.131386, -1.929871, 3.128327, 1, 0, 0.6901961, 1,
1.144718, -0.8979213, 0.2310607, 1, 0, 0.682353, 1,
1.148135, -0.879018, 3.408817, 1, 0, 0.6784314, 1,
1.151975, -1.15453, 0.784538, 1, 0, 0.6705883, 1,
1.161299, 0.7029448, 1.491484, 1, 0, 0.6666667, 1,
1.167823, -0.09930853, 1.824221, 1, 0, 0.6588235, 1,
1.178148, -1.476839, 3.197598, 1, 0, 0.654902, 1,
1.192064, -1.025921, 3.747712, 1, 0, 0.6470588, 1,
1.194797, 1.111855, 0.1216956, 1, 0, 0.6431373, 1,
1.232711, 1.747216, 2.354033, 1, 0, 0.6352941, 1,
1.238966, -0.05451429, 1.778255, 1, 0, 0.6313726, 1,
1.245026, 0.3426027, 1.023212, 1, 0, 0.6235294, 1,
1.258104, -0.7368561, 2.092704, 1, 0, 0.6196079, 1,
1.259118, 0.05519922, 2.675814, 1, 0, 0.6117647, 1,
1.260052, 0.5039977, 0.2513425, 1, 0, 0.6078432, 1,
1.265349, 0.04826891, 1.486861, 1, 0, 0.6, 1,
1.26858, -0.7236122, 1.589958, 1, 0, 0.5921569, 1,
1.276016, 0.2507849, 1.372972, 1, 0, 0.5882353, 1,
1.278177, 0.6138442, 0.2285315, 1, 0, 0.5803922, 1,
1.280772, -0.3648171, 3.205602, 1, 0, 0.5764706, 1,
1.291723, -0.1513538, 2.1354, 1, 0, 0.5686275, 1,
1.299811, -0.4039057, 3.077824, 1, 0, 0.5647059, 1,
1.30836, -1.928832, 1.307939, 1, 0, 0.5568628, 1,
1.322242, 1.164468, -0.1020554, 1, 0, 0.5529412, 1,
1.324986, 0.603555, 1.654092, 1, 0, 0.5450981, 1,
1.34926, -0.03527285, -0.186937, 1, 0, 0.5411765, 1,
1.35711, -0.6264772, 2.769243, 1, 0, 0.5333334, 1,
1.359121, 0.3940678, 0.03909079, 1, 0, 0.5294118, 1,
1.361056, -0.5101919, 2.236096, 1, 0, 0.5215687, 1,
1.367555, -0.8103789, 1.171531, 1, 0, 0.5176471, 1,
1.37076, -1.343689, 0.2733684, 1, 0, 0.509804, 1,
1.375205, 0.2005036, 2.43981, 1, 0, 0.5058824, 1,
1.382152, -0.334651, -0.1862848, 1, 0, 0.4980392, 1,
1.424747, -0.09277618, 2.607218, 1, 0, 0.4901961, 1,
1.429043, 0.786821, 2.07439, 1, 0, 0.4862745, 1,
1.434741, 0.314735, 2.193509, 1, 0, 0.4784314, 1,
1.434937, 0.513866, 2.239721, 1, 0, 0.4745098, 1,
1.451704, 0.3577124, -0.06995543, 1, 0, 0.4666667, 1,
1.453698, 0.2750552, 2.431451, 1, 0, 0.4627451, 1,
1.457053, 0.1623011, -0.4578335, 1, 0, 0.454902, 1,
1.459013, -2.105458, 2.643797, 1, 0, 0.4509804, 1,
1.460509, -0.4656729, 1.376876, 1, 0, 0.4431373, 1,
1.467148, -1.097693, 0.5005535, 1, 0, 0.4392157, 1,
1.471567, -1.036627, 1.761699, 1, 0, 0.4313726, 1,
1.478739, -0.4791262, 2.00433, 1, 0, 0.427451, 1,
1.484677, 1.177534, 0.9686824, 1, 0, 0.4196078, 1,
1.486123, 0.0730421, 1.742062, 1, 0, 0.4156863, 1,
1.486201, 0.09957864, 2.534602, 1, 0, 0.4078431, 1,
1.489255, 0.3614663, 2.13994, 1, 0, 0.4039216, 1,
1.495651, -0.1298093, 0.2848498, 1, 0, 0.3960784, 1,
1.496006, 1.134781, 0.4773431, 1, 0, 0.3882353, 1,
1.496264, 0.08304231, 2.61084, 1, 0, 0.3843137, 1,
1.496961, -1.032276, 2.468592, 1, 0, 0.3764706, 1,
1.508615, -0.9560691, 1.961995, 1, 0, 0.372549, 1,
1.517172, 0.1311153, 6.074585, 1, 0, 0.3647059, 1,
1.517872, -0.3507548, 1.986893, 1, 0, 0.3607843, 1,
1.522267, 0.5159678, 0.8158937, 1, 0, 0.3529412, 1,
1.541248, 0.1842005, 1.810724, 1, 0, 0.3490196, 1,
1.54353, 1.946507, 0.8116289, 1, 0, 0.3411765, 1,
1.544036, 0.6555212, 0.2880575, 1, 0, 0.3372549, 1,
1.546286, -0.7398965, 0.5914532, 1, 0, 0.3294118, 1,
1.572859, -1.105031, 0.4689722, 1, 0, 0.3254902, 1,
1.575031, -1.287535, 1.255751, 1, 0, 0.3176471, 1,
1.578106, -0.9047721, 0.9874471, 1, 0, 0.3137255, 1,
1.582146, -0.4835881, 1.927536, 1, 0, 0.3058824, 1,
1.586393, -0.01695515, 0.7621478, 1, 0, 0.2980392, 1,
1.59462, 1.197563, 0.8248996, 1, 0, 0.2941177, 1,
1.611227, 0.1529685, 1.302274, 1, 0, 0.2862745, 1,
1.612079, -0.4436333, 1.739952, 1, 0, 0.282353, 1,
1.616991, 0.1314062, 1.466211, 1, 0, 0.2745098, 1,
1.653185, -1.535658, 1.625649, 1, 0, 0.2705882, 1,
1.665817, 1.197568, 0.06061198, 1, 0, 0.2627451, 1,
1.693246, -1.164063, 2.683583, 1, 0, 0.2588235, 1,
1.707457, 0.3979386, 0.607287, 1, 0, 0.2509804, 1,
1.714788, 2.60907, -1.42357, 1, 0, 0.2470588, 1,
1.719108, -1.255071, 1.37857, 1, 0, 0.2392157, 1,
1.726949, -1.045334, 3.270246, 1, 0, 0.2352941, 1,
1.737717, 1.81613, 1.400233, 1, 0, 0.227451, 1,
1.744052, -0.4171628, 2.92132, 1, 0, 0.2235294, 1,
1.78067, 0.9204866, 1.109566, 1, 0, 0.2156863, 1,
1.79541, -0.2781284, 0.6685781, 1, 0, 0.2117647, 1,
1.795963, -0.4783536, 2.336658, 1, 0, 0.2039216, 1,
1.797249, -0.3660723, 2.181069, 1, 0, 0.1960784, 1,
1.854418, 1.098841, 2.120561, 1, 0, 0.1921569, 1,
1.880539, 1.467295, 0.7946125, 1, 0, 0.1843137, 1,
1.893517, -0.8562865, 1.661258, 1, 0, 0.1803922, 1,
1.899668, -0.105711, 0.7270805, 1, 0, 0.172549, 1,
1.920175, 2.259618, -0.1415707, 1, 0, 0.1686275, 1,
1.930094, 0.02118224, 1.206031, 1, 0, 0.1607843, 1,
1.93682, -0.7121375, 2.526823, 1, 0, 0.1568628, 1,
1.944428, -1.350808, 2.435982, 1, 0, 0.1490196, 1,
1.947374, 0.5697954, 1.661314, 1, 0, 0.145098, 1,
1.964131, -0.07465883, 2.51868, 1, 0, 0.1372549, 1,
1.969102, -0.1025945, 2.492682, 1, 0, 0.1333333, 1,
1.978928, 0.05470012, 2.967089, 1, 0, 0.1254902, 1,
1.988043, 0.2582821, -0.06603388, 1, 0, 0.1215686, 1,
2.013688, -2.557597, 2.09093, 1, 0, 0.1137255, 1,
2.040464, 0.5296568, -0.5432054, 1, 0, 0.1098039, 1,
2.061235, -0.1199686, 2.132064, 1, 0, 0.1019608, 1,
2.099023, 0.6167487, 1.077324, 1, 0, 0.09411765, 1,
2.156653, 0.3165502, 1.861249, 1, 0, 0.09019608, 1,
2.18851, -0.7107916, 2.725455, 1, 0, 0.08235294, 1,
2.270462, -0.02269715, 2.896714, 1, 0, 0.07843138, 1,
2.288161, -1.433021, 1.717836, 1, 0, 0.07058824, 1,
2.299148, 0.04596455, 2.723421, 1, 0, 0.06666667, 1,
2.365564, -0.7328364, 2.486506, 1, 0, 0.05882353, 1,
2.403233, 0.7404896, 0.4940799, 1, 0, 0.05490196, 1,
2.487939, 0.9530897, 0.2750433, 1, 0, 0.04705882, 1,
2.568453, -1.309514, 0.8886954, 1, 0, 0.04313726, 1,
2.60186, 0.3860769, 2.54969, 1, 0, 0.03529412, 1,
2.604012, -0.04901759, 1.569613, 1, 0, 0.03137255, 1,
2.621306, -0.9662092, 2.14226, 1, 0, 0.02352941, 1,
2.888842, 0.4345946, 2.695776, 1, 0, 0.01960784, 1,
2.987063, -1.215334, 1.020258, 1, 0, 0.01176471, 1,
3.083476, -0.3221883, 2.489148, 1, 0, 0.007843138, 1
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
0.2459279, -4.394301, -7.105987, 0, -0.5, 0.5, 0.5,
0.2459279, -4.394301, -7.105987, 1, -0.5, 0.5, 0.5,
0.2459279, -4.394301, -7.105987, 1, 1.5, 0.5, 0.5,
0.2459279, -4.394301, -7.105987, 0, 1.5, 0.5, 0.5
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
-3.553549, -0.2024072, -7.105987, 0, -0.5, 0.5, 0.5,
-3.553549, -0.2024072, -7.105987, 1, -0.5, 0.5, 0.5,
-3.553549, -0.2024072, -7.105987, 1, 1.5, 0.5, 0.5,
-3.553549, -0.2024072, -7.105987, 0, 1.5, 0.5, 0.5
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
-3.553549, -4.394301, 0.4394541, 0, -0.5, 0.5, 0.5,
-3.553549, -4.394301, 0.4394541, 1, -0.5, 0.5, 0.5,
-3.553549, -4.394301, 0.4394541, 1, 1.5, 0.5, 0.5,
-3.553549, -4.394301, 0.4394541, 0, 1.5, 0.5, 0.5
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
-2, -3.426941, -5.364731,
3, -3.426941, -5.364731,
-2, -3.426941, -5.364731,
-2, -3.588168, -5.654941,
-1, -3.426941, -5.364731,
-1, -3.588168, -5.654941,
0, -3.426941, -5.364731,
0, -3.588168, -5.654941,
1, -3.426941, -5.364731,
1, -3.588168, -5.654941,
2, -3.426941, -5.364731,
2, -3.588168, -5.654941,
3, -3.426941, -5.364731,
3, -3.588168, -5.654941
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
-2, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
-2, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
-2, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
-2, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5,
-1, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
-1, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
-1, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
-1, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5,
0, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
0, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
0, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
0, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5,
1, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
1, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
1, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
1, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5,
2, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
2, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
2, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
2, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5,
3, -3.910621, -6.235359, 0, -0.5, 0.5, 0.5,
3, -3.910621, -6.235359, 1, -0.5, 0.5, 0.5,
3, -3.910621, -6.235359, 1, 1.5, 0.5, 0.5,
3, -3.910621, -6.235359, 0, 1.5, 0.5, 0.5
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
-2.676746, -3, -5.364731,
-2.676746, 2, -5.364731,
-2.676746, -3, -5.364731,
-2.82288, -3, -5.654941,
-2.676746, -2, -5.364731,
-2.82288, -2, -5.654941,
-2.676746, -1, -5.364731,
-2.82288, -1, -5.654941,
-2.676746, 0, -5.364731,
-2.82288, 0, -5.654941,
-2.676746, 1, -5.364731,
-2.82288, 1, -5.654941,
-2.676746, 2, -5.364731,
-2.82288, 2, -5.654941
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
-3.115148, -3, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, -3, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, -3, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, -3, -6.235359, 0, 1.5, 0.5, 0.5,
-3.115148, -2, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, -2, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, -2, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, -2, -6.235359, 0, 1.5, 0.5, 0.5,
-3.115148, -1, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, -1, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, -1, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, -1, -6.235359, 0, 1.5, 0.5, 0.5,
-3.115148, 0, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, 0, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, 0, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, 0, -6.235359, 0, 1.5, 0.5, 0.5,
-3.115148, 1, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, 1, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, 1, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, 1, -6.235359, 0, 1.5, 0.5, 0.5,
-3.115148, 2, -6.235359, 0, -0.5, 0.5, 0.5,
-3.115148, 2, -6.235359, 1, -0.5, 0.5, 0.5,
-3.115148, 2, -6.235359, 1, 1.5, 0.5, 0.5,
-3.115148, 2, -6.235359, 0, 1.5, 0.5, 0.5
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
-2.676746, -3.426941, -4,
-2.676746, -3.426941, 6,
-2.676746, -3.426941, -4,
-2.82288, -3.588168, -4,
-2.676746, -3.426941, -2,
-2.82288, -3.588168, -2,
-2.676746, -3.426941, 0,
-2.82288, -3.588168, 0,
-2.676746, -3.426941, 2,
-2.82288, -3.588168, 2,
-2.676746, -3.426941, 4,
-2.82288, -3.588168, 4,
-2.676746, -3.426941, 6,
-2.82288, -3.588168, 6
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
-3.115148, -3.910621, -4, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, -4, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, -4, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, -4, 0, 1.5, 0.5, 0.5,
-3.115148, -3.910621, -2, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, -2, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, -2, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, -2, 0, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 0, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 0, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 0, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 0, 0, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 2, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 2, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 2, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 2, 0, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 4, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 4, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 4, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 4, 0, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 6, 0, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 6, 1, -0.5, 0.5, 0.5,
-3.115148, -3.910621, 6, 1, 1.5, 0.5, 0.5,
-3.115148, -3.910621, 6, 0, 1.5, 0.5, 0.5
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
-2.676746, -3.426941, -5.364731,
-2.676746, 3.022127, -5.364731,
-2.676746, -3.426941, 6.243639,
-2.676746, 3.022127, 6.243639,
-2.676746, -3.426941, -5.364731,
-2.676746, -3.426941, 6.243639,
-2.676746, 3.022127, -5.364731,
-2.676746, 3.022127, 6.243639,
-2.676746, -3.426941, -5.364731,
3.168602, -3.426941, -5.364731,
-2.676746, -3.426941, 6.243639,
3.168602, -3.426941, 6.243639,
-2.676746, 3.022127, -5.364731,
3.168602, 3.022127, -5.364731,
-2.676746, 3.022127, 6.243639,
3.168602, 3.022127, 6.243639,
3.168602, -3.426941, -5.364731,
3.168602, 3.022127, -5.364731,
3.168602, -3.426941, 6.243639,
3.168602, 3.022127, 6.243639,
3.168602, -3.426941, -5.364731,
3.168602, -3.426941, 6.243639,
3.168602, 3.022127, -5.364731,
3.168602, 3.022127, 6.243639
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
var radius = 7.747557;
var distance = 34.46975;
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
mvMatrix.translate( -0.2459279, 0.2024072, -0.4394541 );
mvMatrix.scale( 1.433073, 1.298918, 0.7216181 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.46975);
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
BAP<-read.table("BAP.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-BAP$V2
```

```
## Error in eval(expr, envir, enclos): object 'BAP' not found
```

```r
y<-BAP$V3
```

```
## Error in eval(expr, envir, enclos): object 'BAP' not found
```

```r
z<-BAP$V4
```

```
## Error in eval(expr, envir, enclos): object 'BAP' not found
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
-2.59162, -0.3308671, -1.445365, 0, 0, 1, 1, 1,
-2.563693, -1.450382, 0.5782583, 1, 0, 0, 1, 1,
-2.562732, 0.3806966, -0.8969517, 1, 0, 0, 1, 1,
-2.557756, 0.9273282, -1.131708, 1, 0, 0, 1, 1,
-2.552856, -1.031145, -0.5944527, 1, 0, 0, 1, 1,
-2.450143, 0.7694069, 0.3907538, 1, 0, 0, 1, 1,
-2.418091, -1.116831, -2.607234, 0, 0, 0, 1, 1,
-2.400108, 0.4487976, -1.361441, 0, 0, 0, 1, 1,
-2.303708, -0.5413612, -0.9185006, 0, 0, 0, 1, 1,
-2.302528, -0.3754091, -2.410858, 0, 0, 0, 1, 1,
-2.288631, -0.5092389, -2.18359, 0, 0, 0, 1, 1,
-2.27021, 0.5208601, -1.025366, 0, 0, 0, 1, 1,
-2.240518, 0.3705633, 0.1398968, 0, 0, 0, 1, 1,
-2.239923, -0.8311508, -3.047838, 1, 1, 1, 1, 1,
-2.217209, -1.477062, -1.793221, 1, 1, 1, 1, 1,
-2.206186, -0.6071194, -0.5682212, 1, 1, 1, 1, 1,
-2.184197, 1.78613, -0.2720931, 1, 1, 1, 1, 1,
-2.129847, 1.383229, 0.1758087, 1, 1, 1, 1, 1,
-2.127514, -1.376851, -2.569648, 1, 1, 1, 1, 1,
-2.121626, 0.9168335, -1.490972, 1, 1, 1, 1, 1,
-2.105572, 1.038495, -2.220861, 1, 1, 1, 1, 1,
-2.093572, -0.358673, -1.050145, 1, 1, 1, 1, 1,
-2.085485, 0.03463087, -0.8412078, 1, 1, 1, 1, 1,
-2.025641, -0.2260337, -2.654501, 1, 1, 1, 1, 1,
-2.016365, 0.06087731, -1.315811, 1, 1, 1, 1, 1,
-2.010429, 0.4019339, -4.240655, 1, 1, 1, 1, 1,
-2.004027, 0.5589283, -1.751187, 1, 1, 1, 1, 1,
-1.97761, 1.622836, -1.798898, 1, 1, 1, 1, 1,
-1.941319, 2.112543, -1.632543, 0, 0, 1, 1, 1,
-1.933422, -1.585492, -3.55703, 1, 0, 0, 1, 1,
-1.92642, 1.996158, 0.2584958, 1, 0, 0, 1, 1,
-1.919827, 0.2119462, -1.130614, 1, 0, 0, 1, 1,
-1.887936, -0.1008588, -3.5423, 1, 0, 0, 1, 1,
-1.876749, -0.7206876, -0.4902278, 1, 0, 0, 1, 1,
-1.876422, -1.097964, -1.906436, 0, 0, 0, 1, 1,
-1.870597, 0.9181215, -0.970772, 0, 0, 0, 1, 1,
-1.86759, -0.2205037, -1.608373, 0, 0, 0, 1, 1,
-1.847992, -0.06573156, -0.9239067, 0, 0, 0, 1, 1,
-1.83978, 1.153303, -0.907285, 0, 0, 0, 1, 1,
-1.833822, 2.436687, -2.148365, 0, 0, 0, 1, 1,
-1.831695, -0.1901134, -3.340476, 0, 0, 0, 1, 1,
-1.830791, 2.148389, -2.903333, 1, 1, 1, 1, 1,
-1.83019, -0.5102834, -1.366587, 1, 1, 1, 1, 1,
-1.807895, -0.1626896, -2.447765, 1, 1, 1, 1, 1,
-1.80449, 0.2970122, -2.503645, 1, 1, 1, 1, 1,
-1.800269, -0.9343843, -0.4458659, 1, 1, 1, 1, 1,
-1.781199, -0.6437205, 0.3206649, 1, 1, 1, 1, 1,
-1.766046, 1.347689, -2.97474, 1, 1, 1, 1, 1,
-1.765099, -0.5183828, -1.4518, 1, 1, 1, 1, 1,
-1.739184, 0.36338, -0.4272512, 1, 1, 1, 1, 1,
-1.718505, -0.2099221, -0.9937875, 1, 1, 1, 1, 1,
-1.70763, -0.07615841, -0.9950189, 1, 1, 1, 1, 1,
-1.705826, -1.56056, -2.174814, 1, 1, 1, 1, 1,
-1.689806, 0.9353368, -0.4930424, 1, 1, 1, 1, 1,
-1.688582, -0.8208986, -2.138887, 1, 1, 1, 1, 1,
-1.677772, 1.361244, -0.137916, 1, 1, 1, 1, 1,
-1.638621, -1.249543, -2.03798, 0, 0, 1, 1, 1,
-1.633955, -0.5098419, -2.624495, 1, 0, 0, 1, 1,
-1.629751, 0.5814853, -0.2163211, 1, 0, 0, 1, 1,
-1.625984, 0.4142939, -0.3876681, 1, 0, 0, 1, 1,
-1.624974, 0.09511125, -2.349939, 1, 0, 0, 1, 1,
-1.613016, -0.7012712, -2.774149, 1, 0, 0, 1, 1,
-1.600206, 1.101578, 1.028948, 0, 0, 0, 1, 1,
-1.591063, -0.477336, -1.02821, 0, 0, 0, 1, 1,
-1.587176, -0.5234571, -0.5483197, 0, 0, 0, 1, 1,
-1.584893, -0.2652221, -1.695637, 0, 0, 0, 1, 1,
-1.575335, -0.4786527, -2.444962, 0, 0, 0, 1, 1,
-1.566309, 1.652013, -1.47051, 0, 0, 0, 1, 1,
-1.562283, -2.107033, -2.129505, 0, 0, 0, 1, 1,
-1.559325, 0.2056343, -1.002389, 1, 1, 1, 1, 1,
-1.555136, 0.8281897, -1.364379, 1, 1, 1, 1, 1,
-1.552365, -0.03158867, -0.8668319, 1, 1, 1, 1, 1,
-1.551695, -0.5343213, -1.929863, 1, 1, 1, 1, 1,
-1.536569, 0.4914821, -4.155489, 1, 1, 1, 1, 1,
-1.534179, -0.1558602, -1.804964, 1, 1, 1, 1, 1,
-1.529174, -0.09195286, -2.362417, 1, 1, 1, 1, 1,
-1.52194, 0.5463895, -0.8112012, 1, 1, 1, 1, 1,
-1.489017, -0.7587084, -1.772226, 1, 1, 1, 1, 1,
-1.488833, -0.3106611, -1.603758, 1, 1, 1, 1, 1,
-1.46698, -0.9490954, -1.81476, 1, 1, 1, 1, 1,
-1.455108, -1.179797, -2.207291, 1, 1, 1, 1, 1,
-1.449864, -1.11066, -1.4058, 1, 1, 1, 1, 1,
-1.445784, -0.8995544, -2.26347, 1, 1, 1, 1, 1,
-1.443232, -0.04099255, -2.242348, 1, 1, 1, 1, 1,
-1.440189, -0.7386417, -2.504505, 0, 0, 1, 1, 1,
-1.439819, 0.5056781, -1.425567, 1, 0, 0, 1, 1,
-1.437719, -0.4400329, -0.1292275, 1, 0, 0, 1, 1,
-1.435447, -0.1090993, -2.70426, 1, 0, 0, 1, 1,
-1.423798, 2.329125, -0.7339379, 1, 0, 0, 1, 1,
-1.415856, -0.2668011, -1.17683, 1, 0, 0, 1, 1,
-1.415817, -0.4317879, -2.268759, 0, 0, 0, 1, 1,
-1.401761, 0.7547191, 0.6337585, 0, 0, 0, 1, 1,
-1.401107, 0.5354742, -0.8724667, 0, 0, 0, 1, 1,
-1.400869, 0.844285, -2.103725, 0, 0, 0, 1, 1,
-1.38731, 1.175376, 0.5703182, 0, 0, 0, 1, 1,
-1.365836, -1.042556, -2.309598, 0, 0, 0, 1, 1,
-1.365368, -0.912882, -2.582773, 0, 0, 0, 1, 1,
-1.3652, -0.5824082, -0.8314545, 1, 1, 1, 1, 1,
-1.357295, -0.008163116, 0.08743983, 1, 1, 1, 1, 1,
-1.351929, -1.877132, -4.39252, 1, 1, 1, 1, 1,
-1.335727, 0.1188671, -1.781554, 1, 1, 1, 1, 1,
-1.333931, -1.776016, -2.519909, 1, 1, 1, 1, 1,
-1.333671, 0.1853029, -0.335044, 1, 1, 1, 1, 1,
-1.332651, 0.8601116, -2.116157, 1, 1, 1, 1, 1,
-1.312042, 1.3127, 0.5614067, 1, 1, 1, 1, 1,
-1.310678, 1.734321, 0.7524604, 1, 1, 1, 1, 1,
-1.308582, 0.3346554, -0.5103021, 1, 1, 1, 1, 1,
-1.307918, -0.2588509, -1.273776, 1, 1, 1, 1, 1,
-1.306304, -0.2705097, 0.6695503, 1, 1, 1, 1, 1,
-1.300772, 2.020777, -1.138479, 1, 1, 1, 1, 1,
-1.290386, 0.2645966, -0.341529, 1, 1, 1, 1, 1,
-1.284764, 1.471403, -0.2309866, 1, 1, 1, 1, 1,
-1.278123, -0.1275073, -0.81385, 0, 0, 1, 1, 1,
-1.276695, 0.950877, -0.2885226, 1, 0, 0, 1, 1,
-1.264571, -0.4698006, -1.858786, 1, 0, 0, 1, 1,
-1.257252, -1.753613, -2.086527, 1, 0, 0, 1, 1,
-1.256279, -1.551533, -2.078234, 1, 0, 0, 1, 1,
-1.255748, 0.2894352, -0.03672929, 1, 0, 0, 1, 1,
-1.255513, 0.8735312, -0.5291758, 0, 0, 0, 1, 1,
-1.250054, -0.5124224, -1.841001, 0, 0, 0, 1, 1,
-1.245707, 1.140043, -1.518058, 0, 0, 0, 1, 1,
-1.245067, 1.328215, -1.496182, 0, 0, 0, 1, 1,
-1.244652, 1.125365, -0.5386319, 0, 0, 0, 1, 1,
-1.244005, 1.477539, -1.348382, 0, 0, 0, 1, 1,
-1.242293, -0.6387039, -1.773106, 0, 0, 0, 1, 1,
-1.241691, 0.7654875, -0.05261891, 1, 1, 1, 1, 1,
-1.234862, 1.23866, -0.6919873, 1, 1, 1, 1, 1,
-1.234208, 0.346745, -0.6661732, 1, 1, 1, 1, 1,
-1.230156, 0.01687577, -2.527115, 1, 1, 1, 1, 1,
-1.215501, 0.8893557, -0.3236722, 1, 1, 1, 1, 1,
-1.21064, 0.3445601, 0.1068969, 1, 1, 1, 1, 1,
-1.204032, -0.4373439, -1.939936, 1, 1, 1, 1, 1,
-1.202192, 0.2369542, -2.737066, 1, 1, 1, 1, 1,
-1.201964, -0.5655915, -1.389578, 1, 1, 1, 1, 1,
-1.200701, -1.081053, -1.498636, 1, 1, 1, 1, 1,
-1.1961, -1.047337, -1.606268, 1, 1, 1, 1, 1,
-1.192251, -1.156695, -3.410506, 1, 1, 1, 1, 1,
-1.18503, 0.3451225, -0.4252912, 1, 1, 1, 1, 1,
-1.183164, 0.1813539, 0.7076588, 1, 1, 1, 1, 1,
-1.16473, 0.9633033, 0.1777354, 1, 1, 1, 1, 1,
-1.164585, 0.007115385, -1.275931, 0, 0, 1, 1, 1,
-1.163286, -1.066879, -2.515398, 1, 0, 0, 1, 1,
-1.160883, -2.171374, -2.326323, 1, 0, 0, 1, 1,
-1.158708, 0.6137698, -1.000299, 1, 0, 0, 1, 1,
-1.158324, 0.3004324, -3.272971, 1, 0, 0, 1, 1,
-1.157653, 0.2538251, -2.313269, 1, 0, 0, 1, 1,
-1.152908, 1.307398, -2.145951, 0, 0, 0, 1, 1,
-1.137853, -0.2959366, -1.100801, 0, 0, 0, 1, 1,
-1.136702, 0.2860251, -1.191679, 0, 0, 0, 1, 1,
-1.133204, -0.06417035, -2.295807, 0, 0, 0, 1, 1,
-1.124993, -0.7806638, -1.143022, 0, 0, 0, 1, 1,
-1.118662, -0.5747153, -1.004541, 0, 0, 0, 1, 1,
-1.116512, -0.2534972, -2.314605, 0, 0, 0, 1, 1,
-1.115498, -1.523199, -2.785946, 1, 1, 1, 1, 1,
-1.113215, 0.8117067, -1.5919, 1, 1, 1, 1, 1,
-1.112739, -0.4164058, -2.968549, 1, 1, 1, 1, 1,
-1.105456, -0.3186854, -2.799937, 1, 1, 1, 1, 1,
-1.101648, 0.4075945, -1.78806, 1, 1, 1, 1, 1,
-1.099977, -0.6272182, -0.5052812, 1, 1, 1, 1, 1,
-1.097481, 0.193434, -0.4618284, 1, 1, 1, 1, 1,
-1.095038, -0.0465304, -2.420148, 1, 1, 1, 1, 1,
-1.087216, 0.08320618, -1.955174, 1, 1, 1, 1, 1,
-1.070355, -0.01787652, -1.155992, 1, 1, 1, 1, 1,
-1.068656, -2.152732, -2.80054, 1, 1, 1, 1, 1,
-1.065922, 0.2604823, -1.123634, 1, 1, 1, 1, 1,
-1.065675, -0.6910368, -0.9437235, 1, 1, 1, 1, 1,
-1.057246, -2.96154, -4.617298, 1, 1, 1, 1, 1,
-1.047088, 0.6535054, -0.7456207, 1, 1, 1, 1, 1,
-1.047038, -0.1152253, -1.179358, 0, 0, 1, 1, 1,
-1.037545, -0.3167768, -2.189753, 1, 0, 0, 1, 1,
-1.033377, 2.701563, -0.2145974, 1, 0, 0, 1, 1,
-1.027244, 1.875674, -1.439884, 1, 0, 0, 1, 1,
-1.026898, 0.3425026, -0.3363353, 1, 0, 0, 1, 1,
-1.015439, -0.3872167, -1.436203, 1, 0, 0, 1, 1,
-1.012866, -0.9008576, -2.683654, 0, 0, 0, 1, 1,
-1.011739, -0.839908, -2.458779, 0, 0, 0, 1, 1,
-1.002452, 0.3768337, -1.991799, 0, 0, 0, 1, 1,
-0.9947079, -0.7896112, -2.928735, 0, 0, 0, 1, 1,
-0.9896135, 0.4645064, -0.4709969, 0, 0, 0, 1, 1,
-0.9872309, -1.515597, -1.649522, 0, 0, 0, 1, 1,
-0.9858112, -0.8355702, -2.847331, 0, 0, 0, 1, 1,
-0.985548, -0.929773, -1.935747, 1, 1, 1, 1, 1,
-0.984605, 0.6693226, -0.8398774, 1, 1, 1, 1, 1,
-0.9826967, -0.6780952, -0.8882961, 1, 1, 1, 1, 1,
-0.9813076, 0.1234029, -0.8021494, 1, 1, 1, 1, 1,
-0.9800088, -1.011371, -1.206392, 1, 1, 1, 1, 1,
-0.9779091, 1.950576, 0.3527758, 1, 1, 1, 1, 1,
-0.9750725, 0.5436906, -1.386989, 1, 1, 1, 1, 1,
-0.9722719, 0.6642523, -1.636729, 1, 1, 1, 1, 1,
-0.9663031, 0.1940404, -1.18574, 1, 1, 1, 1, 1,
-0.9656067, 2.175879, 0.3833396, 1, 1, 1, 1, 1,
-0.9655902, -1.304883, -1.643631, 1, 1, 1, 1, 1,
-0.9634393, 0.8651958, -2.196523, 1, 1, 1, 1, 1,
-0.9536338, 0.4928631, -2.050039, 1, 1, 1, 1, 1,
-0.953055, 0.373909, -0.9544509, 1, 1, 1, 1, 1,
-0.949098, -1.287034, -2.750123, 1, 1, 1, 1, 1,
-0.9428171, 1.269082, -0.9629481, 0, 0, 1, 1, 1,
-0.9393919, 1.209764, 0.1395803, 1, 0, 0, 1, 1,
-0.9388053, -0.0437273, -1.297619, 1, 0, 0, 1, 1,
-0.936882, 0.903804, -0.8790041, 1, 0, 0, 1, 1,
-0.936645, 0.997123, 0.02099506, 1, 0, 0, 1, 1,
-0.9357488, -0.7769856, -2.192356, 1, 0, 0, 1, 1,
-0.9344017, -0.2165193, -0.8028119, 0, 0, 0, 1, 1,
-0.9342487, -0.207297, -1.494268, 0, 0, 0, 1, 1,
-0.9232288, 0.3988073, -1.852677, 0, 0, 0, 1, 1,
-0.9216627, -1.135158, -3.45643, 0, 0, 0, 1, 1,
-0.9179034, 0.2961075, -0.9735102, 0, 0, 0, 1, 1,
-0.9133016, -0.384031, -0.2244258, 0, 0, 0, 1, 1,
-0.9061874, -0.01616324, -2.943455, 0, 0, 0, 1, 1,
-0.9060974, -1.62709, -1.305838, 1, 1, 1, 1, 1,
-0.9036092, -1.873461, -2.576726, 1, 1, 1, 1, 1,
-0.9032057, -1.364405, -3.585503, 1, 1, 1, 1, 1,
-0.8975574, 0.3677227, 0.821614, 1, 1, 1, 1, 1,
-0.8933904, 0.7131368, 0.5325185, 1, 1, 1, 1, 1,
-0.8931679, -0.1111569, -1.915421, 1, 1, 1, 1, 1,
-0.8930984, 2.928208, -0.8794482, 1, 1, 1, 1, 1,
-0.8812169, 1.376149, -2.096826, 1, 1, 1, 1, 1,
-0.8804638, 1.272758, -1.299665, 1, 1, 1, 1, 1,
-0.8753743, 0.643222, -1.439014, 1, 1, 1, 1, 1,
-0.8728814, -1.289263, -1.793474, 1, 1, 1, 1, 1,
-0.8703495, 0.01978637, -2.352509, 1, 1, 1, 1, 1,
-0.8697527, 0.8808044, -0.2020281, 1, 1, 1, 1, 1,
-0.8694956, 1.170483, 0.3379757, 1, 1, 1, 1, 1,
-0.8628933, -0.6082528, -3.36447, 1, 1, 1, 1, 1,
-0.8608839, 0.4996682, -2.71325, 0, 0, 1, 1, 1,
-0.8601829, -0.2339846, -1.199553, 1, 0, 0, 1, 1,
-0.8590034, 0.5689521, 0.1610754, 1, 0, 0, 1, 1,
-0.8499331, 0.6111232, 0.1834615, 1, 0, 0, 1, 1,
-0.8460464, -0.5395081, -1.341536, 1, 0, 0, 1, 1,
-0.8440523, -0.01885968, -1.083837, 1, 0, 0, 1, 1,
-0.8425283, -1.278239, -4.687406, 0, 0, 0, 1, 1,
-0.8400773, 0.4813464, -1.34542, 0, 0, 0, 1, 1,
-0.8360232, -0.588665, -4.483261, 0, 0, 0, 1, 1,
-0.833928, -0.2502493, -2.008503, 0, 0, 0, 1, 1,
-0.8294493, 0.3081408, -1.646356, 0, 0, 0, 1, 1,
-0.8252645, -1.77505, -3.369807, 0, 0, 0, 1, 1,
-0.8212867, -0.4876947, -1.908181, 0, 0, 0, 1, 1,
-0.8086225, -0.3397911, -2.011772, 1, 1, 1, 1, 1,
-0.8073852, 0.3129767, -0.1423622, 1, 1, 1, 1, 1,
-0.80203, 0.06025008, -3.980515, 1, 1, 1, 1, 1,
-0.80005, -1.393047, -2.691297, 1, 1, 1, 1, 1,
-0.7965706, 0.5203122, -0.4225831, 1, 1, 1, 1, 1,
-0.7938312, -0.2101513, -1.73758, 1, 1, 1, 1, 1,
-0.7900143, 1.301593, -0.3014105, 1, 1, 1, 1, 1,
-0.7890481, 0.3794104, -1.104457, 1, 1, 1, 1, 1,
-0.7859671, -0.01920426, -2.013556, 1, 1, 1, 1, 1,
-0.7854788, -1.590042, -2.875777, 1, 1, 1, 1, 1,
-0.7842559, -0.6198664, -2.309339, 1, 1, 1, 1, 1,
-0.7793543, -0.05296048, -0.04213816, 1, 1, 1, 1, 1,
-0.7786859, 1.1659, -1.909224, 1, 1, 1, 1, 1,
-0.7755997, 1.158823, 0.509677, 1, 1, 1, 1, 1,
-0.7743899, 1.170998, -0.2873816, 1, 1, 1, 1, 1,
-0.7665918, -0.001621999, -0.5799026, 0, 0, 1, 1, 1,
-0.7631388, -0.2599449, -2.147283, 1, 0, 0, 1, 1,
-0.7616578, -1.741441, -3.821389, 1, 0, 0, 1, 1,
-0.7603794, 2.549007, 0.561196, 1, 0, 0, 1, 1,
-0.7594799, -0.4147141, -3.927655, 1, 0, 0, 1, 1,
-0.7594305, 1.547953, -0.3286246, 1, 0, 0, 1, 1,
-0.7576529, 0.2823413, -1.439204, 0, 0, 0, 1, 1,
-0.753476, -0.2730933, -1.272057, 0, 0, 0, 1, 1,
-0.7503915, -0.03534147, 0.09732078, 0, 0, 0, 1, 1,
-0.746564, 0.3759674, -1.341523, 0, 0, 0, 1, 1,
-0.7447755, -0.1941343, -1.187385, 0, 0, 0, 1, 1,
-0.7405177, -0.7510452, -3.049653, 0, 0, 0, 1, 1,
-0.7379281, 0.6622765, -0.8041647, 0, 0, 0, 1, 1,
-0.7372318, 1.100593, -0.8792658, 1, 1, 1, 1, 1,
-0.7319946, -1.439428, -3.33429, 1, 1, 1, 1, 1,
-0.7268933, -0.5377219, -2.265488, 1, 1, 1, 1, 1,
-0.7254223, 0.6946054, -0.7004624, 1, 1, 1, 1, 1,
-0.7223414, 0.3453473, -1.19608, 1, 1, 1, 1, 1,
-0.7174909, -0.4315384, -3.650547, 1, 1, 1, 1, 1,
-0.7129089, -0.1217065, -0.7156541, 1, 1, 1, 1, 1,
-0.7114239, 2.44464, 0.03203982, 1, 1, 1, 1, 1,
-0.703855, -0.490484, -3.424192, 1, 1, 1, 1, 1,
-0.7006061, -1.003857, -3.667473, 1, 1, 1, 1, 1,
-0.6985693, -0.8794912, -2.83882, 1, 1, 1, 1, 1,
-0.6969048, 0.6945267, -1.137959, 1, 1, 1, 1, 1,
-0.6961512, 1.291646, -0.3272635, 1, 1, 1, 1, 1,
-0.6866916, 0.6485894, -1.157045, 1, 1, 1, 1, 1,
-0.6841323, -0.1749425, -1.381721, 1, 1, 1, 1, 1,
-0.683067, 1.189526, 0.2627692, 0, 0, 1, 1, 1,
-0.6828964, -0.9711394, -2.374043, 1, 0, 0, 1, 1,
-0.6816865, -1.014162, -2.346658, 1, 0, 0, 1, 1,
-0.6814909, 0.4869688, -0.4289972, 1, 0, 0, 1, 1,
-0.681187, 0.09210515, 0.1956953, 1, 0, 0, 1, 1,
-0.6810716, -2.617589, -3.222864, 1, 0, 0, 1, 1,
-0.6760255, -0.2690169, -1.588028, 0, 0, 0, 1, 1,
-0.6750982, -0.2774284, -3.756751, 0, 0, 0, 1, 1,
-0.6748288, 0.2050337, -1.93294, 0, 0, 0, 1, 1,
-0.6745337, 0.1676882, -1.991216, 0, 0, 0, 1, 1,
-0.6697621, -2.115942, -3.597375, 0, 0, 0, 1, 1,
-0.6684007, -0.5441178, -1.931101, 0, 0, 0, 1, 1,
-0.6652184, -0.01713707, -2.864945, 0, 0, 0, 1, 1,
-0.6635334, -0.5261738, 0.4549412, 1, 1, 1, 1, 1,
-0.661696, -0.03437001, -2.334757, 1, 1, 1, 1, 1,
-0.66059, 0.4322327, -0.4653419, 1, 1, 1, 1, 1,
-0.6596978, 1.012636, -0.8650413, 1, 1, 1, 1, 1,
-0.6457239, -0.2022588, -2.781452, 1, 1, 1, 1, 1,
-0.6451624, -0.4240579, -1.744707, 1, 1, 1, 1, 1,
-0.6408604, 0.03127157, -0.3321498, 1, 1, 1, 1, 1,
-0.6373726, -1.200559, -1.357191, 1, 1, 1, 1, 1,
-0.6302661, 0.007596261, -0.9796973, 1, 1, 1, 1, 1,
-0.6299459, -0.4294086, -3.48848, 1, 1, 1, 1, 1,
-0.6253585, 0.3652045, 0.009937861, 1, 1, 1, 1, 1,
-0.6225613, -0.6845918, -4.265318, 1, 1, 1, 1, 1,
-0.6162629, 0.473293, -1.583237, 1, 1, 1, 1, 1,
-0.6116403, -0.2203154, -1.328745, 1, 1, 1, 1, 1,
-0.6109269, -1.138484, -1.805642, 1, 1, 1, 1, 1,
-0.6086399, 0.2971245, -1.202729, 0, 0, 1, 1, 1,
-0.6076605, 0.7532104, -1.638744, 1, 0, 0, 1, 1,
-0.6016834, 0.1365825, -1.931562, 1, 0, 0, 1, 1,
-0.6001763, -0.9389589, -1.119744, 1, 0, 0, 1, 1,
-0.5996119, -0.9013084, -2.219076, 1, 0, 0, 1, 1,
-0.5942555, 0.09860411, -1.137664, 1, 0, 0, 1, 1,
-0.5905186, -0.6542136, -2.13696, 0, 0, 0, 1, 1,
-0.5876673, -1.62023, -3.138468, 0, 0, 0, 1, 1,
-0.5870354, -0.5724729, -1.221674, 0, 0, 0, 1, 1,
-0.5869425, -0.471474, -2.43667, 0, 0, 0, 1, 1,
-0.5854207, 0.1321772, 0.8374164, 0, 0, 0, 1, 1,
-0.5846956, 0.9136167, -0.3567467, 0, 0, 0, 1, 1,
-0.5833805, -0.08811504, -2.01823, 0, 0, 0, 1, 1,
-0.5830748, 1.529699, 0.8158728, 1, 1, 1, 1, 1,
-0.5761757, -0.4730094, -2.244823, 1, 1, 1, 1, 1,
-0.5760375, -0.1930024, -1.966848, 1, 1, 1, 1, 1,
-0.5754315, -1.772289, -1.891961, 1, 1, 1, 1, 1,
-0.5753793, 1.114296, -0.4831384, 1, 1, 1, 1, 1,
-0.5746409, 0.974973, -1.777197, 1, 1, 1, 1, 1,
-0.5727603, -0.829757, -2.97104, 1, 1, 1, 1, 1,
-0.5709329, 0.3437366, -1.024563, 1, 1, 1, 1, 1,
-0.5680621, 0.5125555, -0.1282691, 1, 1, 1, 1, 1,
-0.563545, 1.537659, -0.272046, 1, 1, 1, 1, 1,
-0.5585489, -0.4596648, -0.08181223, 1, 1, 1, 1, 1,
-0.549659, 0.6963199, -1.957486, 1, 1, 1, 1, 1,
-0.5486344, 0.7937287, -1.204065, 1, 1, 1, 1, 1,
-0.5479643, 0.1480913, 0.7052066, 1, 1, 1, 1, 1,
-0.5463124, 2.105304, -0.5713739, 1, 1, 1, 1, 1,
-0.546074, 1.507933, 0.7102531, 0, 0, 1, 1, 1,
-0.5405652, 0.3667234, -0.913144, 1, 0, 0, 1, 1,
-0.5392635, 0.4474619, -1.295545, 1, 0, 0, 1, 1,
-0.5351759, -0.19664, -2.155698, 1, 0, 0, 1, 1,
-0.5324057, -1.519362, -1.672578, 1, 0, 0, 1, 1,
-0.5312215, 1.436588, -0.1850213, 1, 0, 0, 1, 1,
-0.526907, 0.6535849, -0.255613, 0, 0, 0, 1, 1,
-0.5229834, 0.6068101, 0.6919543, 0, 0, 0, 1, 1,
-0.5214391, -1.035847, -0.0003117884, 0, 0, 0, 1, 1,
-0.5191945, -0.4396605, -2.983473, 0, 0, 0, 1, 1,
-0.5186186, 0.7214175, 0.6724918, 0, 0, 0, 1, 1,
-0.5141488, -0.7773185, -3.096114, 0, 0, 0, 1, 1,
-0.5136914, -1.52863, -3.573262, 0, 0, 0, 1, 1,
-0.5109569, 0.5848487, -1.411318, 1, 1, 1, 1, 1,
-0.5075749, -2.407476, -1.259374, 1, 1, 1, 1, 1,
-0.5073394, 0.9967206, -1.234138, 1, 1, 1, 1, 1,
-0.5065237, 0.6047633, -0.2610985, 1, 1, 1, 1, 1,
-0.5049779, 0.9405702, -0.4484492, 1, 1, 1, 1, 1,
-0.5024739, -0.5299449, -2.540974, 1, 1, 1, 1, 1,
-0.4989091, -1.04374, -1.961672, 1, 1, 1, 1, 1,
-0.4959065, -0.3565426, -3.774342, 1, 1, 1, 1, 1,
-0.4948921, 0.09394613, -1.049319, 1, 1, 1, 1, 1,
-0.494636, -0.9040796, -4.751461, 1, 1, 1, 1, 1,
-0.4858935, -0.05758551, -1.829276, 1, 1, 1, 1, 1,
-0.4856328, -0.695003, -3.746061, 1, 1, 1, 1, 1,
-0.4831793, 0.2658189, -1.377649, 1, 1, 1, 1, 1,
-0.4788954, -0.04108857, -1.760405, 1, 1, 1, 1, 1,
-0.4766462, -0.2235764, -2.952571, 1, 1, 1, 1, 1,
-0.4763475, 0.359343, -1.684562, 0, 0, 1, 1, 1,
-0.4754749, -0.06747014, -3.04224, 1, 0, 0, 1, 1,
-0.4750061, -0.6979946, -1.701951, 1, 0, 0, 1, 1,
-0.470915, 0.3148835, -0.414884, 1, 0, 0, 1, 1,
-0.4703383, -2.166091, -4.074736, 1, 0, 0, 1, 1,
-0.4697776, -1.026016, -2.655513, 1, 0, 0, 1, 1,
-0.4650579, 0.1217993, -0.1821691, 0, 0, 0, 1, 1,
-0.4588733, 0.1795971, -1.758359, 0, 0, 0, 1, 1,
-0.4572915, -0.04032624, -0.2249668, 0, 0, 0, 1, 1,
-0.4507613, 1.560758, 1.93137, 0, 0, 0, 1, 1,
-0.4498786, -0.6132967, -1.997601, 0, 0, 0, 1, 1,
-0.4460514, 0.2620724, 0.2328348, 0, 0, 0, 1, 1,
-0.4442152, -0.6438377, -1.234463, 0, 0, 0, 1, 1,
-0.4414636, 0.4017509, -0.8642349, 1, 1, 1, 1, 1,
-0.4366255, -2.111349, -1.60297, 1, 1, 1, 1, 1,
-0.435463, -0.5174436, -0.2633507, 1, 1, 1, 1, 1,
-0.4312309, -2.061176, -4.009696, 1, 1, 1, 1, 1,
-0.4295149, 0.6327905, -0.1963349, 1, 1, 1, 1, 1,
-0.4179969, 0.9726768, -1.284487, 1, 1, 1, 1, 1,
-0.416898, 1.387016, -0.9535671, 1, 1, 1, 1, 1,
-0.4160622, -0.1206978, -1.808215, 1, 1, 1, 1, 1,
-0.4155127, 0.8536357, 1.059132, 1, 1, 1, 1, 1,
-0.4081498, -0.1505261, -0.6474569, 1, 1, 1, 1, 1,
-0.4049465, 1.667752, -0.9845693, 1, 1, 1, 1, 1,
-0.402448, 1.592589, 0.3022642, 1, 1, 1, 1, 1,
-0.3988169, -1.864528, -1.401885, 1, 1, 1, 1, 1,
-0.3940629, -1.478293, -4.19653, 1, 1, 1, 1, 1,
-0.387971, -0.7078112, -4.414568, 1, 1, 1, 1, 1,
-0.3863351, -1.069502, -2.276196, 0, 0, 1, 1, 1,
-0.3849868, 0.8924416, -1.127801, 1, 0, 0, 1, 1,
-0.3840306, 1.039506, 1.195499, 1, 0, 0, 1, 1,
-0.3806479, -0.1380527, -1.432232, 1, 0, 0, 1, 1,
-0.3805152, -0.7641354, -2.710215, 1, 0, 0, 1, 1,
-0.3755452, 0.1763215, -2.028553, 1, 0, 0, 1, 1,
-0.374405, -0.5003545, -4.598956, 0, 0, 0, 1, 1,
-0.3707547, 0.4409673, -0.5749348, 0, 0, 0, 1, 1,
-0.3691939, -0.5173474, -2.285752, 0, 0, 0, 1, 1,
-0.3629703, 0.4014212, -1.324269, 0, 0, 0, 1, 1,
-0.3598044, -0.2979059, -1.075837, 0, 0, 0, 1, 1,
-0.359474, -0.7416416, -1.962089, 0, 0, 0, 1, 1,
-0.3586518, -2.035547, -3.331076, 0, 0, 0, 1, 1,
-0.3427965, 1.997496, -1.230776, 1, 1, 1, 1, 1,
-0.3384743, -1.802137, -3.11337, 1, 1, 1, 1, 1,
-0.3380734, 2.313463, -1.091394, 1, 1, 1, 1, 1,
-0.3351351, 2.238142, -0.3835931, 1, 1, 1, 1, 1,
-0.3301163, -0.5257213, -3.092611, 1, 1, 1, 1, 1,
-0.3288899, 0.1243071, -2.979143, 1, 1, 1, 1, 1,
-0.3266984, 0.6267291, -0.7375658, 1, 1, 1, 1, 1,
-0.3248491, -0.2396269, -3.391585, 1, 1, 1, 1, 1,
-0.3209386, -0.3083339, -1.377842, 1, 1, 1, 1, 1,
-0.3200117, 0.9241896, -3.017649, 1, 1, 1, 1, 1,
-0.3185668, 1.158448, -0.9193196, 1, 1, 1, 1, 1,
-0.3161372, 0.4764915, -1.706213, 1, 1, 1, 1, 1,
-0.3160847, -2.319838, -2.255976, 1, 1, 1, 1, 1,
-0.3120123, -0.5209745, -2.943411, 1, 1, 1, 1, 1,
-0.3096629, 0.4214223, 0.1558316, 1, 1, 1, 1, 1,
-0.3076591, 1.924281, 0.5044385, 0, 0, 1, 1, 1,
-0.305719, -0.1748874, -1.274994, 1, 0, 0, 1, 1,
-0.3039122, -1.07077, -3.652617, 1, 0, 0, 1, 1,
-0.303816, 2.545771, -0.6438857, 1, 0, 0, 1, 1,
-0.3022607, -0.04954002, -1.725312, 1, 0, 0, 1, 1,
-0.3011639, -0.1207047, -1.62363, 1, 0, 0, 1, 1,
-0.3007448, -0.6094387, -4.962057, 0, 0, 0, 1, 1,
-0.2994578, -2.304704, -3.36, 0, 0, 0, 1, 1,
-0.2987334, -0.4157491, -3.459068, 0, 0, 0, 1, 1,
-0.2984397, -0.145834, -0.6448629, 0, 0, 0, 1, 1,
-0.2976258, -0.7298701, -2.250748, 0, 0, 0, 1, 1,
-0.2956703, -0.0974673, -0.2628594, 0, 0, 0, 1, 1,
-0.2819132, -1.319114, -3.224479, 0, 0, 0, 1, 1,
-0.2766729, -0.2419158, -2.373801, 1, 1, 1, 1, 1,
-0.275953, 0.09154809, -2.026821, 1, 1, 1, 1, 1,
-0.2728696, -0.5615495, -3.204758, 1, 1, 1, 1, 1,
-0.2637151, -1.092723, -1.635455, 1, 1, 1, 1, 1,
-0.249678, 0.5426067, -1.677497, 1, 1, 1, 1, 1,
-0.2459075, 0.6940305, -1.815754, 1, 1, 1, 1, 1,
-0.2427256, 1.05486, -1.402888, 1, 1, 1, 1, 1,
-0.2382817, 0.4586571, 0.1979886, 1, 1, 1, 1, 1,
-0.2338321, 2.018972, 0.4410988, 1, 1, 1, 1, 1,
-0.2278752, 1.683572, -1.213678, 1, 1, 1, 1, 1,
-0.2276934, -1.57767, -2.554458, 1, 1, 1, 1, 1,
-0.2265482, 0.9758295, 0.8401251, 1, 1, 1, 1, 1,
-0.2250794, 0.9319707, 0.001496029, 1, 1, 1, 1, 1,
-0.2242274, 1.160907, -0.6908476, 1, 1, 1, 1, 1,
-0.2238631, 0.248095, -0.9327317, 1, 1, 1, 1, 1,
-0.2224756, -0.3194701, -2.995262, 0, 0, 1, 1, 1,
-0.2189929, 0.9874019, -0.3397736, 1, 0, 0, 1, 1,
-0.2169944, 1.308884, -1.0681, 1, 0, 0, 1, 1,
-0.2168316, -0.2206752, -3.138046, 1, 0, 0, 1, 1,
-0.2105553, -0.9074212, -4.208919, 1, 0, 0, 1, 1,
-0.2076353, 0.06493969, -1.933685, 1, 0, 0, 1, 1,
-0.207101, -1.355561, -1.114077, 0, 0, 0, 1, 1,
-0.2068116, -1.657438, -4.97014, 0, 0, 0, 1, 1,
-0.2068022, -0.4679239, -3.144927, 0, 0, 0, 1, 1,
-0.2059713, 0.6599721, 0.576969, 0, 0, 0, 1, 1,
-0.2052157, -1.914524, -2.925332, 0, 0, 0, 1, 1,
-0.2025573, 1.112206, -0.6162202, 0, 0, 0, 1, 1,
-0.2022999, -1.134607, -3.337471, 0, 0, 0, 1, 1,
-0.1952669, 0.8400695, -0.4442636, 1, 1, 1, 1, 1,
-0.1950996, -1.058897, -3.485271, 1, 1, 1, 1, 1,
-0.19102, -1.462393, -1.973092, 1, 1, 1, 1, 1,
-0.1859999, 2.443171, -0.2587933, 1, 1, 1, 1, 1,
-0.1856897, -0.9692928, -3.906996, 1, 1, 1, 1, 1,
-0.1811694, 0.02433548, -0.8466499, 1, 1, 1, 1, 1,
-0.1732362, -0.2791013, -2.934673, 1, 1, 1, 1, 1,
-0.167927, 1.540101, -0.5961247, 1, 1, 1, 1, 1,
-0.1659404, -1.940996, -3.594489, 1, 1, 1, 1, 1,
-0.1655292, 1.054726, -1.284256, 1, 1, 1, 1, 1,
-0.1642169, -0.02265911, -0.9653869, 1, 1, 1, 1, 1,
-0.162745, -0.03421771, -2.861366, 1, 1, 1, 1, 1,
-0.1567291, 0.4236137, -0.4629377, 1, 1, 1, 1, 1,
-0.1563033, -0.8418089, -3.365766, 1, 1, 1, 1, 1,
-0.1510664, 1.290709, 0.1841215, 1, 1, 1, 1, 1,
-0.1498286, 0.3666105, -3.050768, 0, 0, 1, 1, 1,
-0.145648, 0.1101171, 0.9347715, 1, 0, 0, 1, 1,
-0.1435518, -0.4377586, -3.439616, 1, 0, 0, 1, 1,
-0.1417743, 0.5808734, 0.6507417, 1, 0, 0, 1, 1,
-0.1346665, 1.337408, 1.031112, 1, 0, 0, 1, 1,
-0.1330474, 0.6044572, 0.6896234, 1, 0, 0, 1, 1,
-0.1309875, 0.5339954, -0.1057167, 0, 0, 0, 1, 1,
-0.1288027, -0.4038953, -2.076931, 0, 0, 0, 1, 1,
-0.1244371, -0.06629615, -1.964129, 0, 0, 0, 1, 1,
-0.1232996, 0.7064376, 0.1648327, 0, 0, 0, 1, 1,
-0.1148723, 0.6461862, -0.7395697, 0, 0, 0, 1, 1,
-0.1115794, -0.315043, -2.055891, 0, 0, 0, 1, 1,
-0.1104618, 1.117643, -0.8856866, 0, 0, 0, 1, 1,
-0.1050264, -0.7930738, -2.081426, 1, 1, 1, 1, 1,
-0.1037458, 0.5404829, 0.8445528, 1, 1, 1, 1, 1,
-0.1010107, -0.5594355, -1.867787, 1, 1, 1, 1, 1,
-0.1009824, 0.09938136, -0.6483829, 1, 1, 1, 1, 1,
-0.09988355, -0.4814363, -4.600066, 1, 1, 1, 1, 1,
-0.09698705, -0.01971148, -1.801954, 1, 1, 1, 1, 1,
-0.09579638, -1.90679, -2.494897, 1, 1, 1, 1, 1,
-0.0931647, -0.622472, -3.297988, 1, 1, 1, 1, 1,
-0.08616687, -0.1217135, -3.543788, 1, 1, 1, 1, 1,
-0.08186568, -0.8024796, -2.951913, 1, 1, 1, 1, 1,
-0.08174739, -2.210313, -3.179718, 1, 1, 1, 1, 1,
-0.08082383, -0.6748447, -5.195677, 1, 1, 1, 1, 1,
-0.07919613, -0.2005181, -0.462887, 1, 1, 1, 1, 1,
-0.07586046, -0.9850011, -2.183367, 1, 1, 1, 1, 1,
-0.07446967, -0.2773426, -3.343865, 1, 1, 1, 1, 1,
-0.07323377, 1.530417, -0.6529541, 0, 0, 1, 1, 1,
-0.07156285, 0.2097585, -0.5134426, 1, 0, 0, 1, 1,
-0.07124945, 0.716785, -1.750679, 1, 0, 0, 1, 1,
-0.06973556, 0.8498991, 0.3923229, 1, 0, 0, 1, 1,
-0.06626083, 1.075409, -1.945133, 1, 0, 0, 1, 1,
-0.06286822, 0.1807586, -1.253649, 1, 0, 0, 1, 1,
-0.05893777, 0.3366851, 0.3951083, 0, 0, 0, 1, 1,
-0.04447522, -0.2311225, -2.764704, 0, 0, 0, 1, 1,
-0.04335137, 0.1518243, -0.500377, 0, 0, 0, 1, 1,
-0.03736432, -0.1809446, -2.066574, 0, 0, 0, 1, 1,
-0.03000477, -1.506707, -2.72776, 0, 0, 0, 1, 1,
-0.02977503, 0.5103247, 0.9366562, 0, 0, 0, 1, 1,
-0.02680925, 1.42915, 0.2631472, 0, 0, 0, 1, 1,
-0.02635727, -2.249926, -2.013983, 1, 1, 1, 1, 1,
-0.02395057, 2.358494, 0.5058316, 1, 1, 1, 1, 1,
-0.02379167, -0.6475521, -3.636289, 1, 1, 1, 1, 1,
-0.02254449, 1.106026, 0.6375892, 1, 1, 1, 1, 1,
-0.01214994, -0.9839305, -2.696813, 1, 1, 1, 1, 1,
-0.01113551, 1.555423, 1.786674, 1, 1, 1, 1, 1,
-0.01068472, -0.9642181, -4.617649, 1, 1, 1, 1, 1,
-0.005298735, -0.1355538, -3.556631, 1, 1, 1, 1, 1,
-0.001750177, 0.4094831, 0.5929813, 1, 1, 1, 1, 1,
0.0006797854, -0.008275266, 3.221712, 1, 1, 1, 1, 1,
0.001389295, -1.667577, 4.487314, 1, 1, 1, 1, 1,
0.002527473, 0.1231039, -0.08682705, 1, 1, 1, 1, 1,
0.005498809, 0.3899992, 0.9151052, 1, 1, 1, 1, 1,
0.007530413, -0.5787495, 3.36996, 1, 1, 1, 1, 1,
0.01048563, 0.3299242, 0.825997, 1, 1, 1, 1, 1,
0.0105631, 1.614229, -0.2380335, 0, 0, 1, 1, 1,
0.01494516, -1.012716, 5.043274, 1, 0, 0, 1, 1,
0.01969502, -0.8764635, 2.21564, 1, 0, 0, 1, 1,
0.01974347, -0.1160747, 0.9205753, 1, 0, 0, 1, 1,
0.02024995, -0.6556509, 2.778374, 1, 0, 0, 1, 1,
0.02225489, -0.01035815, 1.986665, 1, 0, 0, 1, 1,
0.02281296, 0.7226454, -1.12344, 0, 0, 0, 1, 1,
0.02343667, 2.096083, -0.9574834, 0, 0, 0, 1, 1,
0.02982074, -0.4551703, 1.829241, 0, 0, 0, 1, 1,
0.0306776, 1.01285, -0.5647269, 0, 0, 0, 1, 1,
0.03366661, -0.2186755, 2.711465, 0, 0, 0, 1, 1,
0.04141258, -1.30768, 3.846372, 0, 0, 0, 1, 1,
0.04265908, 0.6666217, -0.07939596, 0, 0, 0, 1, 1,
0.04405345, 0.679217, -0.7027283, 1, 1, 1, 1, 1,
0.04800399, -0.894372, 2.101637, 1, 1, 1, 1, 1,
0.05230187, -0.8521168, 3.670366, 1, 1, 1, 1, 1,
0.0529315, 0.6206912, 1.091675, 1, 1, 1, 1, 1,
0.05738533, 0.6821801, 0.8976559, 1, 1, 1, 1, 1,
0.05815124, -0.7508197, 1.527048, 1, 1, 1, 1, 1,
0.06267921, 0.5451377, -0.5273182, 1, 1, 1, 1, 1,
0.06412753, 0.4371396, -0.5098296, 1, 1, 1, 1, 1,
0.06420921, 2.510076, -1.17138, 1, 1, 1, 1, 1,
0.06935391, -0.09303435, 1.424781, 1, 1, 1, 1, 1,
0.07368694, -0.8268864, 4.43303, 1, 1, 1, 1, 1,
0.07394951, -0.04612504, 1.782281, 1, 1, 1, 1, 1,
0.07573171, 0.08435874, 1.736923, 1, 1, 1, 1, 1,
0.07584208, 0.1130926, -2.163126, 1, 1, 1, 1, 1,
0.07627056, 0.5523047, -1.842265, 1, 1, 1, 1, 1,
0.07655612, -0.08908355, 3.127679, 0, 0, 1, 1, 1,
0.07666892, 1.476987, 0.5316424, 1, 0, 0, 1, 1,
0.07704131, -1.136456, 1.743889, 1, 0, 0, 1, 1,
0.07793425, -0.1279946, 1.177391, 1, 0, 0, 1, 1,
0.08118975, 0.9959942, 0.6912622, 1, 0, 0, 1, 1,
0.08500819, -0.09542217, 0.9468877, 1, 0, 0, 1, 1,
0.09122748, -0.3587405, 3.101929, 0, 0, 0, 1, 1,
0.09962092, 1.231729, -0.09676353, 0, 0, 0, 1, 1,
0.1046585, -0.1819332, 2.412137, 0, 0, 0, 1, 1,
0.1111009, 0.2000933, 1.594922, 0, 0, 0, 1, 1,
0.11891, -0.5169773, 3.146481, 0, 0, 0, 1, 1,
0.1194176, 1.088351, 0.6683351, 0, 0, 0, 1, 1,
0.122137, 0.4249497, 0.2817913, 0, 0, 0, 1, 1,
0.1232763, -0.8585941, 2.929296, 1, 1, 1, 1, 1,
0.1279459, 2.26586, -1.294145, 1, 1, 1, 1, 1,
0.1283094, 0.1607984, 0.5286077, 1, 1, 1, 1, 1,
0.1300702, -0.1225762, 2.639493, 1, 1, 1, 1, 1,
0.1331032, 0.08581071, 0.7637051, 1, 1, 1, 1, 1,
0.1364449, 0.9479548, 0.1508862, 1, 1, 1, 1, 1,
0.1375713, -1.191328, 3.66594, 1, 1, 1, 1, 1,
0.1402504, 0.02165612, 1.558241, 1, 1, 1, 1, 1,
0.1412359, 0.9950988, 0.3145294, 1, 1, 1, 1, 1,
0.1436779, -0.3596287, 2.384213, 1, 1, 1, 1, 1,
0.1453015, 0.3406057, 1.111951, 1, 1, 1, 1, 1,
0.1495017, -1.128087, 2.281878, 1, 1, 1, 1, 1,
0.1498248, -1.597716, 3.381232, 1, 1, 1, 1, 1,
0.150888, 1.8477, -0.5405697, 1, 1, 1, 1, 1,
0.1553463, 0.4054464, 1.016196, 1, 1, 1, 1, 1,
0.1587567, 0.6205545, -0.3885754, 0, 0, 1, 1, 1,
0.1588047, -0.01133708, -0.5932986, 1, 0, 0, 1, 1,
0.1621149, -0.5541955, 3.39776, 1, 0, 0, 1, 1,
0.1623535, 0.6875697, -0.2427885, 1, 0, 0, 1, 1,
0.1656791, 0.9085103, -1.090813, 1, 0, 0, 1, 1,
0.1686204, 1.058566, 0.5150704, 1, 0, 0, 1, 1,
0.170526, -1.122157, 2.521981, 0, 0, 0, 1, 1,
0.176439, -0.2323118, 2.17131, 0, 0, 0, 1, 1,
0.1781105, -0.1453397, 2.061787, 0, 0, 0, 1, 1,
0.1786209, -1.344443, -0.04021651, 0, 0, 0, 1, 1,
0.1789138, 0.3094128, 0.6636763, 0, 0, 0, 1, 1,
0.1789708, 0.9631354, 0.7737366, 0, 0, 0, 1, 1,
0.1814461, 0.1167399, 1.026067, 0, 0, 0, 1, 1,
0.183117, 0.5611084, -1.34392, 1, 1, 1, 1, 1,
0.1835226, -0.7889212, 3.034561, 1, 1, 1, 1, 1,
0.1845418, 0.6267732, 1.585817, 1, 1, 1, 1, 1,
0.1871031, -0.8294573, 2.82844, 1, 1, 1, 1, 1,
0.1875655, 0.2304541, -2.078271, 1, 1, 1, 1, 1,
0.1885134, 1.787726, 1.437955, 1, 1, 1, 1, 1,
0.188586, 2.0442, 0.726061, 1, 1, 1, 1, 1,
0.1908367, -0.0198891, 0.7294726, 1, 1, 1, 1, 1,
0.1934708, -1.642271, 3.211607, 1, 1, 1, 1, 1,
0.2054289, 1.881329, 0.9043141, 1, 1, 1, 1, 1,
0.2134194, 0.7754384, 0.8116256, 1, 1, 1, 1, 1,
0.2141576, -1.928028, 3.017758, 1, 1, 1, 1, 1,
0.2202453, 0.3815472, 1.199451, 1, 1, 1, 1, 1,
0.2226613, 0.5213971, 1.000386, 1, 1, 1, 1, 1,
0.2250775, -0.3880636, 2.554985, 1, 1, 1, 1, 1,
0.2316613, 0.7399087, 0.02994437, 0, 0, 1, 1, 1,
0.2321798, -0.2780085, 1.606206, 1, 0, 0, 1, 1,
0.2348475, 0.3233229, 0.7650044, 1, 0, 0, 1, 1,
0.2354376, 1.532738, -0.8004148, 1, 0, 0, 1, 1,
0.2372166, 0.793179, 0.1825771, 1, 0, 0, 1, 1,
0.243448, -0.947637, 4.044658, 1, 0, 0, 1, 1,
0.2453733, 1.711256, -1.588772, 0, 0, 0, 1, 1,
0.2463871, -0.09841844, 0.3745209, 0, 0, 0, 1, 1,
0.2479014, -1.092303, 2.520287, 0, 0, 0, 1, 1,
0.2482266, 1.220932, 1.282307, 0, 0, 0, 1, 1,
0.2588634, 0.3354414, 1.055342, 0, 0, 0, 1, 1,
0.2597253, -0.5887001, 2.974656, 0, 0, 0, 1, 1,
0.2618695, 0.469552, 1.184085, 0, 0, 0, 1, 1,
0.2665504, -0.01221736, 0.5814386, 1, 1, 1, 1, 1,
0.2679959, -0.9798971, 3.115271, 1, 1, 1, 1, 1,
0.2723971, 1.082102, -1.275915, 1, 1, 1, 1, 1,
0.2788111, 1.136768, -0.1864585, 1, 1, 1, 1, 1,
0.2811148, -0.2255312, 1.9138, 1, 1, 1, 1, 1,
0.2838278, 1.122399, 1.077795, 1, 1, 1, 1, 1,
0.2849903, 0.5101824, 1.265706, 1, 1, 1, 1, 1,
0.2866612, -1.299156, 1.549483, 1, 1, 1, 1, 1,
0.2917772, 0.5148591, 1.379776, 1, 1, 1, 1, 1,
0.2942506, 0.4092914, -0.193919, 1, 1, 1, 1, 1,
0.294768, 0.700548, 1.056257, 1, 1, 1, 1, 1,
0.297633, -0.5151507, 3.807622, 1, 1, 1, 1, 1,
0.2999195, -0.2261493, 3.318066, 1, 1, 1, 1, 1,
0.3076267, 1.196835, -0.07014912, 1, 1, 1, 1, 1,
0.3109697, -0.7321982, 3.232932, 1, 1, 1, 1, 1,
0.3139006, -2.035074, 3.853079, 0, 0, 1, 1, 1,
0.3139296, 0.6409803, 1.187143, 1, 0, 0, 1, 1,
0.3173463, 0.02953055, 1.30956, 1, 0, 0, 1, 1,
0.3193378, 0.3037131, 0.5425952, 1, 0, 0, 1, 1,
0.322894, -0.01674016, 2.366056, 1, 0, 0, 1, 1,
0.3268, 0.1108018, 1.984705, 1, 0, 0, 1, 1,
0.3306724, -1.311074, 3.326192, 0, 0, 0, 1, 1,
0.3338936, 0.6031407, 2.101947, 0, 0, 0, 1, 1,
0.3359898, -0.3807099, 2.517108, 0, 0, 0, 1, 1,
0.3388655, -0.2943407, 2.81152, 0, 0, 0, 1, 1,
0.3389762, -1.957286, 3.140507, 0, 0, 0, 1, 1,
0.3404503, 0.2163699, 2.014812, 0, 0, 0, 1, 1,
0.3439705, 1.104496, -0.0368885, 0, 0, 0, 1, 1,
0.3441767, -2.475649, 2.477417, 1, 1, 1, 1, 1,
0.3489145, 0.5800352, 0.2721986, 1, 1, 1, 1, 1,
0.3500598, -0.4256183, 2.457693, 1, 1, 1, 1, 1,
0.3521654, -0.01082995, 1.791214, 1, 1, 1, 1, 1,
0.3538754, -1.428495, 3.610033, 1, 1, 1, 1, 1,
0.3585126, 0.1115633, 1.064101, 1, 1, 1, 1, 1,
0.3621144, -0.6629466, 2.358563, 1, 1, 1, 1, 1,
0.3628113, 0.04446734, -0.7691134, 1, 1, 1, 1, 1,
0.3645352, -0.1338553, 0.8074828, 1, 1, 1, 1, 1,
0.364828, -0.5430232, 0.6934542, 1, 1, 1, 1, 1,
0.3660114, -0.04618425, 1.789002, 1, 1, 1, 1, 1,
0.3741762, 0.1140019, 0.9189959, 1, 1, 1, 1, 1,
0.3748095, -1.796662, 4.146801, 1, 1, 1, 1, 1,
0.3823799, -0.01755351, 3.194791, 1, 1, 1, 1, 1,
0.383895, 1.55829, 0.244991, 1, 1, 1, 1, 1,
0.398505, 0.06818515, 2.563308, 0, 0, 1, 1, 1,
0.3989647, 0.668615, 0.01803604, 1, 0, 0, 1, 1,
0.4032593, -0.3753534, 3.172436, 1, 0, 0, 1, 1,
0.4058537, -0.5065963, 0.2809395, 1, 0, 0, 1, 1,
0.4078808, -0.5447206, 3.108278, 1, 0, 0, 1, 1,
0.4080218, -0.6930796, 4.351626, 1, 0, 0, 1, 1,
0.4092841, -0.4541934, 1.601113, 0, 0, 0, 1, 1,
0.4122588, -0.9281561, 2.898712, 0, 0, 0, 1, 1,
0.4125407, -1.04081, 3.205182, 0, 0, 0, 1, 1,
0.4171042, 0.3287042, 1.820105, 0, 0, 0, 1, 1,
0.4200308, -1.003641, 1.668622, 0, 0, 0, 1, 1,
0.4203344, 0.7556558, 1.180731, 0, 0, 0, 1, 1,
0.426126, -0.3480943, 0.8095335, 0, 0, 0, 1, 1,
0.4289513, -3.333023, 4.24206, 1, 1, 1, 1, 1,
0.4293599, 1.977567, -1.052707, 1, 1, 1, 1, 1,
0.4314212, -1.215862, 0.7023841, 1, 1, 1, 1, 1,
0.4327002, -0.1979783, 2.490135, 1, 1, 1, 1, 1,
0.4378327, -1.841911, 3.980266, 1, 1, 1, 1, 1,
0.439232, -0.09723455, 0.2876559, 1, 1, 1, 1, 1,
0.4402806, -0.2266042, 2.734754, 1, 1, 1, 1, 1,
0.4564776, 0.06559638, 2.491026, 1, 1, 1, 1, 1,
0.4578247, -2.321298, 1.628562, 1, 1, 1, 1, 1,
0.4588136, -1.440874, 3.402639, 1, 1, 1, 1, 1,
0.4654084, -0.3090224, 1.474251, 1, 1, 1, 1, 1,
0.4657379, 1.133515, 0.9745283, 1, 1, 1, 1, 1,
0.4698915, 1.101014, 0.4002607, 1, 1, 1, 1, 1,
0.470255, -1.079005, 3.973073, 1, 1, 1, 1, 1,
0.4709892, -0.954711, 4.053065, 1, 1, 1, 1, 1,
0.4778756, 0.5682704, 1.959576, 0, 0, 1, 1, 1,
0.48262, -0.3595823, 1.549959, 1, 0, 0, 1, 1,
0.4857608, 1.777508, 1.499008, 1, 0, 0, 1, 1,
0.4867591, -0.8382051, 1.588832, 1, 0, 0, 1, 1,
0.4970949, 0.2794217, 1.149213, 1, 0, 0, 1, 1,
0.5024261, 0.3532975, 1.726372, 1, 0, 0, 1, 1,
0.5043622, -0.3813357, 3.268429, 0, 0, 0, 1, 1,
0.5055409, -0.744982, 3.337877, 0, 0, 0, 1, 1,
0.5099757, 0.9839406, 0.7726869, 0, 0, 0, 1, 1,
0.513155, -0.5947099, 3.137681, 0, 0, 0, 1, 1,
0.5215662, 0.4476921, 1.589769, 0, 0, 0, 1, 1,
0.5234183, 1.164651, -0.6118591, 0, 0, 0, 1, 1,
0.528039, 0.9147723, -0.4790355, 0, 0, 0, 1, 1,
0.5306119, -1.522515, 3.414138, 1, 1, 1, 1, 1,
0.5403296, -0.1166869, 2.358392, 1, 1, 1, 1, 1,
0.5404736, -0.05449308, 2.248104, 1, 1, 1, 1, 1,
0.5430408, -0.325602, 0.9443269, 1, 1, 1, 1, 1,
0.5459306, 2.122099, 0.7902796, 1, 1, 1, 1, 1,
0.5462134, -0.8784704, 1.621803, 1, 1, 1, 1, 1,
0.5509298, -0.5591652, 3.238788, 1, 1, 1, 1, 1,
0.552263, -0.5935464, 3.082456, 1, 1, 1, 1, 1,
0.5541769, -0.07985726, 0.52797, 1, 1, 1, 1, 1,
0.556528, 1.314285, -0.3700151, 1, 1, 1, 1, 1,
0.5606285, -0.3563773, 2.227207, 1, 1, 1, 1, 1,
0.5650925, -0.03421779, 2.356014, 1, 1, 1, 1, 1,
0.5665135, -0.1298567, 3.050047, 1, 1, 1, 1, 1,
0.5726548, 0.5838691, 0.9489958, 1, 1, 1, 1, 1,
0.5738841, 1.385955, 1.24596, 1, 1, 1, 1, 1,
0.574421, 0.3030748, 1.246706, 0, 0, 1, 1, 1,
0.5788816, -0.6303679, 0.8651984, 1, 0, 0, 1, 1,
0.5790125, -1.294866, 1.23841, 1, 0, 0, 1, 1,
0.5921469, -1.702083, 1.970752, 1, 0, 0, 1, 1,
0.593573, 0.3574173, 0.5394197, 1, 0, 0, 1, 1,
0.5950482, 0.7458334, 2.84841, 1, 0, 0, 1, 1,
0.596467, -0.0650874, 1.087464, 0, 0, 0, 1, 1,
0.6011385, -0.6286335, 2.122426, 0, 0, 0, 1, 1,
0.602749, 0.1526192, 1.3182, 0, 0, 0, 1, 1,
0.6038203, 0.4038016, 1.026155, 0, 0, 0, 1, 1,
0.6088027, -0.4220056, 0.4199802, 0, 0, 0, 1, 1,
0.6114648, -0.6839274, 3.015019, 0, 0, 0, 1, 1,
0.6159865, 1.628289, -0.2165655, 0, 0, 0, 1, 1,
0.616155, -1.103729, 3.137842, 1, 1, 1, 1, 1,
0.616899, 0.559935, 1.47959, 1, 1, 1, 1, 1,
0.6184127, -1.244522, 2.789291, 1, 1, 1, 1, 1,
0.6202204, -0.3387215, 2.839096, 1, 1, 1, 1, 1,
0.6221328, -0.5531802, 2.561386, 1, 1, 1, 1, 1,
0.6223909, -1.781295, 2.025182, 1, 1, 1, 1, 1,
0.6275637, -1.424269, 5.406219, 1, 1, 1, 1, 1,
0.6285579, 1.951657, 1.781035, 1, 1, 1, 1, 1,
0.6288504, 0.3991204, -0.1185148, 1, 1, 1, 1, 1,
0.6307775, 0.6699359, -0.1493001, 1, 1, 1, 1, 1,
0.634736, -0.08110536, 1.833239, 1, 1, 1, 1, 1,
0.6386712, 0.2231656, 1.10621, 1, 1, 1, 1, 1,
0.6401498, 0.7825679, 1.789598, 1, 1, 1, 1, 1,
0.6410894, 0.6448588, 0.2366695, 1, 1, 1, 1, 1,
0.6463016, 0.1955019, -0.1168308, 1, 1, 1, 1, 1,
0.6511019, 0.3219597, 0.7405527, 0, 0, 1, 1, 1,
0.6519591, 0.4099239, 3.453212, 1, 0, 0, 1, 1,
0.652139, 0.1773156, 0.125376, 1, 0, 0, 1, 1,
0.6539795, 0.0451045, 0.6814335, 1, 0, 0, 1, 1,
0.654581, 1.151275, -0.2246267, 1, 0, 0, 1, 1,
0.6601633, 0.7430164, 0.9525455, 1, 0, 0, 1, 1,
0.6657918, -0.009968348, 1.97798, 0, 0, 0, 1, 1,
0.667075, 1.414066, -0.7597905, 0, 0, 0, 1, 1,
0.6767152, 0.0610968, 1.028418, 0, 0, 0, 1, 1,
0.6826954, -1.030654, 1.994105, 0, 0, 0, 1, 1,
0.6870945, -0.6591879, 2.680454, 0, 0, 0, 1, 1,
0.6884291, 0.885731, -0.2022153, 0, 0, 0, 1, 1,
0.6890616, 0.07420769, 0.8680169, 0, 0, 0, 1, 1,
0.6903263, -0.7197314, 3.696683, 1, 1, 1, 1, 1,
0.6926158, -2.19642, 3.333735, 1, 1, 1, 1, 1,
0.6987944, 0.6510609, 1.795221, 1, 1, 1, 1, 1,
0.6993122, 0.01333406, 1.668879, 1, 1, 1, 1, 1,
0.7031067, -0.5934892, 2.532799, 1, 1, 1, 1, 1,
0.7037246, -1.937512, 3.373236, 1, 1, 1, 1, 1,
0.7062182, 0.7248747, 1.257834, 1, 1, 1, 1, 1,
0.7083442, -1.46728, 3.455415, 1, 1, 1, 1, 1,
0.7112931, -0.514441, 0.9299155, 1, 1, 1, 1, 1,
0.7149215, -1.108346, 0.6511722, 1, 1, 1, 1, 1,
0.732623, 1.239548, 0.3273204, 1, 1, 1, 1, 1,
0.7329653, -1.363469, 1.696897, 1, 1, 1, 1, 1,
0.7330813, -0.1076004, 3.964637, 1, 1, 1, 1, 1,
0.7394865, -2.316473, 4.041773, 1, 1, 1, 1, 1,
0.7413039, 0.7755278, -0.6258171, 1, 1, 1, 1, 1,
0.7417526, -0.02693355, 1.607768, 0, 0, 1, 1, 1,
0.7443015, -0.06862954, -0.01797416, 1, 0, 0, 1, 1,
0.7462183, 0.06282309, 3.067746, 1, 0, 0, 1, 1,
0.7483268, 1.57181, -0.8283109, 1, 0, 0, 1, 1,
0.7485462, 0.2499069, 1.320102, 1, 0, 0, 1, 1,
0.7487357, 0.808973, 0.3649223, 1, 0, 0, 1, 1,
0.7520345, -0.4902267, 3.507447, 0, 0, 0, 1, 1,
0.7527878, 0.5327247, 1.63744, 0, 0, 0, 1, 1,
0.7541432, 0.2450894, 2.130054, 0, 0, 0, 1, 1,
0.7542012, -0.6230237, 0.3222751, 0, 0, 0, 1, 1,
0.7647789, 1.248405, -0.3925575, 0, 0, 0, 1, 1,
0.769269, -1.517092, 2.664575, 0, 0, 0, 1, 1,
0.7764701, 0.4539673, 0.6698383, 0, 0, 0, 1, 1,
0.7778583, 0.2592247, 0.8569099, 1, 1, 1, 1, 1,
0.7871706, -0.3692737, 3.11372, 1, 1, 1, 1, 1,
0.7906778, -0.03238435, 0.4995647, 1, 1, 1, 1, 1,
0.7917358, 0.9469714, 0.3136082, 1, 1, 1, 1, 1,
0.7947647, 1.302392, -0.9092998, 1, 1, 1, 1, 1,
0.8078169, 0.9331345, 1.912742, 1, 1, 1, 1, 1,
0.8102177, -1.014215, 2.502104, 1, 1, 1, 1, 1,
0.8124014, 1.135087, 0.7438399, 1, 1, 1, 1, 1,
0.8132004, -0.09186033, 2.883334, 1, 1, 1, 1, 1,
0.8136636, -0.8370279, 2.621796, 1, 1, 1, 1, 1,
0.8189703, -1.250486, 3.227288, 1, 1, 1, 1, 1,
0.8206742, -1.880456, 2.476275, 1, 1, 1, 1, 1,
0.822733, -0.05302461, 0.3935533, 1, 1, 1, 1, 1,
0.832009, -1.517292, 2.433597, 1, 1, 1, 1, 1,
0.8334237, -0.4892769, 2.240319, 1, 1, 1, 1, 1,
0.8359376, 0.6500545, 0.9082283, 0, 0, 1, 1, 1,
0.83949, -1.45137, 1.048049, 1, 0, 0, 1, 1,
0.8496886, 0.5232673, -1.066332, 1, 0, 0, 1, 1,
0.8532252, -0.5615681, 2.590979, 1, 0, 0, 1, 1,
0.8606669, -1.120749, 1.795246, 1, 0, 0, 1, 1,
0.8675523, -0.1086675, 1.2234, 1, 0, 0, 1, 1,
0.875716, -1.079109, 4.816045, 0, 0, 0, 1, 1,
0.8822473, 0.1360654, 2.350226, 0, 0, 0, 1, 1,
0.8891654, -0.5833625, 0.7329052, 0, 0, 0, 1, 1,
0.8907269, -0.7001109, 3.590719, 0, 0, 0, 1, 1,
0.8916477, -0.7909749, 1.769547, 0, 0, 0, 1, 1,
0.8921444, -0.1499087, 2.146083, 0, 0, 0, 1, 1,
0.8969601, -0.5475151, 2.612096, 0, 0, 0, 1, 1,
0.899825, -0.429208, 2.480871, 1, 1, 1, 1, 1,
0.9015146, -0.8640233, 2.448105, 1, 1, 1, 1, 1,
0.9086195, 0.8668844, -0.5450982, 1, 1, 1, 1, 1,
0.9135924, 0.4792565, -0.3057157, 1, 1, 1, 1, 1,
0.9186051, 0.4260481, 1.070639, 1, 1, 1, 1, 1,
0.9193332, -0.6938251, 1.476386, 1, 1, 1, 1, 1,
0.920577, 0.7359694, 0.3870094, 1, 1, 1, 1, 1,
0.9245425, 1.285236, 0.7913463, 1, 1, 1, 1, 1,
0.9267295, 0.5907314, 2.174562, 1, 1, 1, 1, 1,
0.9283418, 0.2294434, 0.6572956, 1, 1, 1, 1, 1,
0.9290659, 0.4345539, 1.658044, 1, 1, 1, 1, 1,
0.9299642, 1.420596, 1.426379, 1, 1, 1, 1, 1,
0.9383179, -1.023112, 2.716145, 1, 1, 1, 1, 1,
0.938903, -1.92158, 1.679219, 1, 1, 1, 1, 1,
0.9401091, 0.358267, 0.2927822, 1, 1, 1, 1, 1,
0.9416782, -0.3507322, 1.257638, 0, 0, 1, 1, 1,
0.9446122, 0.6220183, 0.4254869, 1, 0, 0, 1, 1,
0.9464881, 1.682948, -0.1606611, 1, 0, 0, 1, 1,
0.9543788, 0.2290307, 0.9738677, 1, 0, 0, 1, 1,
0.9558046, -1.007268, 2.751739, 1, 0, 0, 1, 1,
0.9586896, -0.09792849, 2.607363, 1, 0, 0, 1, 1,
0.9631224, 1.751589, 2.768677, 0, 0, 0, 1, 1,
0.967492, -0.9338073, 2.192075, 0, 0, 0, 1, 1,
0.9727356, 0.4119937, 0.9141987, 0, 0, 0, 1, 1,
0.9814429, -0.3103816, 3.295328, 0, 0, 0, 1, 1,
0.9879515, -1.140248, 2.870849, 0, 0, 0, 1, 1,
0.9882787, -0.4733632, 1.710366, 0, 0, 0, 1, 1,
1.005404, -0.6901377, 1.966514, 0, 0, 0, 1, 1,
1.006009, 0.3837619, 1.293948, 1, 1, 1, 1, 1,
1.006036, 0.1642534, 0.8849984, 1, 1, 1, 1, 1,
1.011195, 0.8615483, 3.289361, 1, 1, 1, 1, 1,
1.020471, 0.7429143, 0.4466941, 1, 1, 1, 1, 1,
1.022448, -0.422962, 1.935886, 1, 1, 1, 1, 1,
1.027539, 0.2652107, 1.851344, 1, 1, 1, 1, 1,
1.028845, 0.307136, 1.231363, 1, 1, 1, 1, 1,
1.03138, -0.8904103, 1.008583, 1, 1, 1, 1, 1,
1.03381, -0.7019615, 1.006598, 1, 1, 1, 1, 1,
1.034602, 1.788114, 1.873662, 1, 1, 1, 1, 1,
1.03536, 0.7327573, -0.402506, 1, 1, 1, 1, 1,
1.035788, 0.1263678, 0.7117972, 1, 1, 1, 1, 1,
1.040322, 0.9706429, -0.6838735, 1, 1, 1, 1, 1,
1.046963, -1.063912, 1.842376, 1, 1, 1, 1, 1,
1.053991, -0.7059419, -0.389252, 1, 1, 1, 1, 1,
1.054607, 0.4321908, 1.53865, 0, 0, 1, 1, 1,
1.05549, -0.6760593, 1.369621, 1, 0, 0, 1, 1,
1.058258, 0.1843652, 1.708094, 1, 0, 0, 1, 1,
1.062966, -1.332225, 1.909015, 1, 0, 0, 1, 1,
1.066644, 0.76091, 0.9268938, 1, 0, 0, 1, 1,
1.067881, 1.25058, -0.3284531, 1, 0, 0, 1, 1,
1.075022, 1.857903, 1.206308, 0, 0, 0, 1, 1,
1.07718, 0.1699122, 0.3878081, 0, 0, 0, 1, 1,
1.08296, -0.04696029, 0.6018942, 0, 0, 0, 1, 1,
1.088668, 1.39286, 0.0347302, 0, 0, 0, 1, 1,
1.089666, -0.9168369, 2.031419, 0, 0, 0, 1, 1,
1.105793, 0.8497486, 1.570307, 0, 0, 0, 1, 1,
1.112701, -1.602297, 1.339826, 0, 0, 0, 1, 1,
1.116228, -0.9143291, 3.336165, 1, 1, 1, 1, 1,
1.118464, 0.3942503, 2.345009, 1, 1, 1, 1, 1,
1.122973, 0.7653698, -0.2523846, 1, 1, 1, 1, 1,
1.125456, -0.7438705, 1.456787, 1, 1, 1, 1, 1,
1.131386, -1.929871, 3.128327, 1, 1, 1, 1, 1,
1.144718, -0.8979213, 0.2310607, 1, 1, 1, 1, 1,
1.148135, -0.879018, 3.408817, 1, 1, 1, 1, 1,
1.151975, -1.15453, 0.784538, 1, 1, 1, 1, 1,
1.161299, 0.7029448, 1.491484, 1, 1, 1, 1, 1,
1.167823, -0.09930853, 1.824221, 1, 1, 1, 1, 1,
1.178148, -1.476839, 3.197598, 1, 1, 1, 1, 1,
1.192064, -1.025921, 3.747712, 1, 1, 1, 1, 1,
1.194797, 1.111855, 0.1216956, 1, 1, 1, 1, 1,
1.232711, 1.747216, 2.354033, 1, 1, 1, 1, 1,
1.238966, -0.05451429, 1.778255, 1, 1, 1, 1, 1,
1.245026, 0.3426027, 1.023212, 0, 0, 1, 1, 1,
1.258104, -0.7368561, 2.092704, 1, 0, 0, 1, 1,
1.259118, 0.05519922, 2.675814, 1, 0, 0, 1, 1,
1.260052, 0.5039977, 0.2513425, 1, 0, 0, 1, 1,
1.265349, 0.04826891, 1.486861, 1, 0, 0, 1, 1,
1.26858, -0.7236122, 1.589958, 1, 0, 0, 1, 1,
1.276016, 0.2507849, 1.372972, 0, 0, 0, 1, 1,
1.278177, 0.6138442, 0.2285315, 0, 0, 0, 1, 1,
1.280772, -0.3648171, 3.205602, 0, 0, 0, 1, 1,
1.291723, -0.1513538, 2.1354, 0, 0, 0, 1, 1,
1.299811, -0.4039057, 3.077824, 0, 0, 0, 1, 1,
1.30836, -1.928832, 1.307939, 0, 0, 0, 1, 1,
1.322242, 1.164468, -0.1020554, 0, 0, 0, 1, 1,
1.324986, 0.603555, 1.654092, 1, 1, 1, 1, 1,
1.34926, -0.03527285, -0.186937, 1, 1, 1, 1, 1,
1.35711, -0.6264772, 2.769243, 1, 1, 1, 1, 1,
1.359121, 0.3940678, 0.03909079, 1, 1, 1, 1, 1,
1.361056, -0.5101919, 2.236096, 1, 1, 1, 1, 1,
1.367555, -0.8103789, 1.171531, 1, 1, 1, 1, 1,
1.37076, -1.343689, 0.2733684, 1, 1, 1, 1, 1,
1.375205, 0.2005036, 2.43981, 1, 1, 1, 1, 1,
1.382152, -0.334651, -0.1862848, 1, 1, 1, 1, 1,
1.424747, -0.09277618, 2.607218, 1, 1, 1, 1, 1,
1.429043, 0.786821, 2.07439, 1, 1, 1, 1, 1,
1.434741, 0.314735, 2.193509, 1, 1, 1, 1, 1,
1.434937, 0.513866, 2.239721, 1, 1, 1, 1, 1,
1.451704, 0.3577124, -0.06995543, 1, 1, 1, 1, 1,
1.453698, 0.2750552, 2.431451, 1, 1, 1, 1, 1,
1.457053, 0.1623011, -0.4578335, 0, 0, 1, 1, 1,
1.459013, -2.105458, 2.643797, 1, 0, 0, 1, 1,
1.460509, -0.4656729, 1.376876, 1, 0, 0, 1, 1,
1.467148, -1.097693, 0.5005535, 1, 0, 0, 1, 1,
1.471567, -1.036627, 1.761699, 1, 0, 0, 1, 1,
1.478739, -0.4791262, 2.00433, 1, 0, 0, 1, 1,
1.484677, 1.177534, 0.9686824, 0, 0, 0, 1, 1,
1.486123, 0.0730421, 1.742062, 0, 0, 0, 1, 1,
1.486201, 0.09957864, 2.534602, 0, 0, 0, 1, 1,
1.489255, 0.3614663, 2.13994, 0, 0, 0, 1, 1,
1.495651, -0.1298093, 0.2848498, 0, 0, 0, 1, 1,
1.496006, 1.134781, 0.4773431, 0, 0, 0, 1, 1,
1.496264, 0.08304231, 2.61084, 0, 0, 0, 1, 1,
1.496961, -1.032276, 2.468592, 1, 1, 1, 1, 1,
1.508615, -0.9560691, 1.961995, 1, 1, 1, 1, 1,
1.517172, 0.1311153, 6.074585, 1, 1, 1, 1, 1,
1.517872, -0.3507548, 1.986893, 1, 1, 1, 1, 1,
1.522267, 0.5159678, 0.8158937, 1, 1, 1, 1, 1,
1.541248, 0.1842005, 1.810724, 1, 1, 1, 1, 1,
1.54353, 1.946507, 0.8116289, 1, 1, 1, 1, 1,
1.544036, 0.6555212, 0.2880575, 1, 1, 1, 1, 1,
1.546286, -0.7398965, 0.5914532, 1, 1, 1, 1, 1,
1.572859, -1.105031, 0.4689722, 1, 1, 1, 1, 1,
1.575031, -1.287535, 1.255751, 1, 1, 1, 1, 1,
1.578106, -0.9047721, 0.9874471, 1, 1, 1, 1, 1,
1.582146, -0.4835881, 1.927536, 1, 1, 1, 1, 1,
1.586393, -0.01695515, 0.7621478, 1, 1, 1, 1, 1,
1.59462, 1.197563, 0.8248996, 1, 1, 1, 1, 1,
1.611227, 0.1529685, 1.302274, 0, 0, 1, 1, 1,
1.612079, -0.4436333, 1.739952, 1, 0, 0, 1, 1,
1.616991, 0.1314062, 1.466211, 1, 0, 0, 1, 1,
1.653185, -1.535658, 1.625649, 1, 0, 0, 1, 1,
1.665817, 1.197568, 0.06061198, 1, 0, 0, 1, 1,
1.693246, -1.164063, 2.683583, 1, 0, 0, 1, 1,
1.707457, 0.3979386, 0.607287, 0, 0, 0, 1, 1,
1.714788, 2.60907, -1.42357, 0, 0, 0, 1, 1,
1.719108, -1.255071, 1.37857, 0, 0, 0, 1, 1,
1.726949, -1.045334, 3.270246, 0, 0, 0, 1, 1,
1.737717, 1.81613, 1.400233, 0, 0, 0, 1, 1,
1.744052, -0.4171628, 2.92132, 0, 0, 0, 1, 1,
1.78067, 0.9204866, 1.109566, 0, 0, 0, 1, 1,
1.79541, -0.2781284, 0.6685781, 1, 1, 1, 1, 1,
1.795963, -0.4783536, 2.336658, 1, 1, 1, 1, 1,
1.797249, -0.3660723, 2.181069, 1, 1, 1, 1, 1,
1.854418, 1.098841, 2.120561, 1, 1, 1, 1, 1,
1.880539, 1.467295, 0.7946125, 1, 1, 1, 1, 1,
1.893517, -0.8562865, 1.661258, 1, 1, 1, 1, 1,
1.899668, -0.105711, 0.7270805, 1, 1, 1, 1, 1,
1.920175, 2.259618, -0.1415707, 1, 1, 1, 1, 1,
1.930094, 0.02118224, 1.206031, 1, 1, 1, 1, 1,
1.93682, -0.7121375, 2.526823, 1, 1, 1, 1, 1,
1.944428, -1.350808, 2.435982, 1, 1, 1, 1, 1,
1.947374, 0.5697954, 1.661314, 1, 1, 1, 1, 1,
1.964131, -0.07465883, 2.51868, 1, 1, 1, 1, 1,
1.969102, -0.1025945, 2.492682, 1, 1, 1, 1, 1,
1.978928, 0.05470012, 2.967089, 1, 1, 1, 1, 1,
1.988043, 0.2582821, -0.06603388, 0, 0, 1, 1, 1,
2.013688, -2.557597, 2.09093, 1, 0, 0, 1, 1,
2.040464, 0.5296568, -0.5432054, 1, 0, 0, 1, 1,
2.061235, -0.1199686, 2.132064, 1, 0, 0, 1, 1,
2.099023, 0.6167487, 1.077324, 1, 0, 0, 1, 1,
2.156653, 0.3165502, 1.861249, 1, 0, 0, 1, 1,
2.18851, -0.7107916, 2.725455, 0, 0, 0, 1, 1,
2.270462, -0.02269715, 2.896714, 0, 0, 0, 1, 1,
2.288161, -1.433021, 1.717836, 0, 0, 0, 1, 1,
2.299148, 0.04596455, 2.723421, 0, 0, 0, 1, 1,
2.365564, -0.7328364, 2.486506, 0, 0, 0, 1, 1,
2.403233, 0.7404896, 0.4940799, 0, 0, 0, 1, 1,
2.487939, 0.9530897, 0.2750433, 0, 0, 0, 1, 1,
2.568453, -1.309514, 0.8886954, 1, 1, 1, 1, 1,
2.60186, 0.3860769, 2.54969, 1, 1, 1, 1, 1,
2.604012, -0.04901759, 1.569613, 1, 1, 1, 1, 1,
2.621306, -0.9662092, 2.14226, 1, 1, 1, 1, 1,
2.888842, 0.4345946, 2.695776, 1, 1, 1, 1, 1,
2.987063, -1.215334, 1.020258, 1, 1, 1, 1, 1,
3.083476, -0.3221883, 2.489148, 1, 1, 1, 1, 1
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
var radius = 9.577819;
var distance = 33.64168;
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
mvMatrix.translate( -0.245928, 0.2024074, -0.4394541 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.64168);
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