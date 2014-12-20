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
-3.447035, -0.004820158, 0.1727379, 1, 0, 0, 1,
-2.817143, -0.8653405, -0.1926583, 1, 0.007843138, 0, 1,
-2.799791, 0.1507473, -1.728016, 1, 0.01176471, 0, 1,
-2.715593, 0.3705659, -1.48082, 1, 0.01960784, 0, 1,
-2.665429, -0.4189532, -2.171247, 1, 0.02352941, 0, 1,
-2.651619, -0.08674692, -2.878721, 1, 0.03137255, 0, 1,
-2.533265, 0.1073114, -0.8530151, 1, 0.03529412, 0, 1,
-2.50092, -0.3488646, -1.426097, 1, 0.04313726, 0, 1,
-2.499866, -0.0141729, -0.7173006, 1, 0.04705882, 0, 1,
-2.48565, -0.06901161, -2.140713, 1, 0.05490196, 0, 1,
-2.403709, -0.09506164, -0.9766971, 1, 0.05882353, 0, 1,
-2.394917, -0.1643904, -2.420365, 1, 0.06666667, 0, 1,
-2.373699, -0.9643968, -3.041593, 1, 0.07058824, 0, 1,
-2.368216, -0.4346197, -3.011212, 1, 0.07843138, 0, 1,
-2.303892, 1.12149, -1.182533, 1, 0.08235294, 0, 1,
-2.286333, 0.5434589, -1.785707, 1, 0.09019608, 0, 1,
-2.218146, 1.204721, -0.6762142, 1, 0.09411765, 0, 1,
-2.202351, 0.6827423, -0.8402544, 1, 0.1019608, 0, 1,
-2.197653, 1.009667, -0.5653118, 1, 0.1098039, 0, 1,
-2.168988, -0.8459305, -1.16278, 1, 0.1137255, 0, 1,
-2.127187, 0.4502726, -0.287262, 1, 0.1215686, 0, 1,
-2.124676, -0.8760728, -0.7257503, 1, 0.1254902, 0, 1,
-2.072776, 2.591038, 0.3034934, 1, 0.1333333, 0, 1,
-2.036758, 0.3205363, -1.204433, 1, 0.1372549, 0, 1,
-2.022578, 0.03449883, -0.4777623, 1, 0.145098, 0, 1,
-2.014683, 0.2062609, -1.321669, 1, 0.1490196, 0, 1,
-2.014498, 0.7183689, -0.2908078, 1, 0.1568628, 0, 1,
-1.96169, 0.6858073, -0.7403399, 1, 0.1607843, 0, 1,
-1.94715, 0.2090829, -3.134681, 1, 0.1686275, 0, 1,
-1.881588, 1.865451, -1.700216, 1, 0.172549, 0, 1,
-1.862234, 0.03720861, -1.914778, 1, 0.1803922, 0, 1,
-1.846642, 2.055185, -0.536265, 1, 0.1843137, 0, 1,
-1.811839, 0.962415, -0.9559772, 1, 0.1921569, 0, 1,
-1.795775, 0.3732365, -1.239932, 1, 0.1960784, 0, 1,
-1.783233, -1.590073, -3.521989, 1, 0.2039216, 0, 1,
-1.782003, 0.3752232, -1.956345, 1, 0.2117647, 0, 1,
-1.761091, 0.6690909, -0.3776833, 1, 0.2156863, 0, 1,
-1.756665, -0.3965319, -1.355268, 1, 0.2235294, 0, 1,
-1.753436, -1.707067, -2.56121, 1, 0.227451, 0, 1,
-1.737068, -0.3049606, -0.6837106, 1, 0.2352941, 0, 1,
-1.72948, -1.277157, -3.782026, 1, 0.2392157, 0, 1,
-1.723334, -1.054562, -3.559832, 1, 0.2470588, 0, 1,
-1.697328, -0.2325847, -2.287503, 1, 0.2509804, 0, 1,
-1.675891, -0.4935513, -2.859953, 1, 0.2588235, 0, 1,
-1.673378, 0.4306104, -2.099848, 1, 0.2627451, 0, 1,
-1.613125, 0.590715, 0.3904146, 1, 0.2705882, 0, 1,
-1.608961, -0.4108587, -2.259274, 1, 0.2745098, 0, 1,
-1.605956, -1.420878, -0.7745326, 1, 0.282353, 0, 1,
-1.602367, 0.5484872, -2.477891, 1, 0.2862745, 0, 1,
-1.596953, -0.5614846, -2.980093, 1, 0.2941177, 0, 1,
-1.596164, -0.3579902, -2.148325, 1, 0.3019608, 0, 1,
-1.586049, 0.3405703, -0.3888477, 1, 0.3058824, 0, 1,
-1.576538, 0.5981914, -1.380522, 1, 0.3137255, 0, 1,
-1.572861, 0.6922126, -0.5070258, 1, 0.3176471, 0, 1,
-1.565898, -0.1723209, -0.9045675, 1, 0.3254902, 0, 1,
-1.560837, -1.882377, -2.749399, 1, 0.3294118, 0, 1,
-1.552451, -0.3811698, -1.400327, 1, 0.3372549, 0, 1,
-1.530199, -2.162097, -2.249102, 1, 0.3411765, 0, 1,
-1.524703, 0.6360707, 0.2148809, 1, 0.3490196, 0, 1,
-1.518912, 0.04841328, -1.165781, 1, 0.3529412, 0, 1,
-1.514381, 0.03020437, -1.333678, 1, 0.3607843, 0, 1,
-1.486768, 1.028454, -2.625096, 1, 0.3647059, 0, 1,
-1.486433, 0.8447691, -0.2901263, 1, 0.372549, 0, 1,
-1.481643, 1.363306, -1.682341, 1, 0.3764706, 0, 1,
-1.47256, -0.3221852, -1.428758, 1, 0.3843137, 0, 1,
-1.470868, -1.007654, -1.730293, 1, 0.3882353, 0, 1,
-1.469666, 2.028007, 0.1133536, 1, 0.3960784, 0, 1,
-1.467266, -0.4549331, -3.573692, 1, 0.4039216, 0, 1,
-1.461509, 0.3233081, -1.829094, 1, 0.4078431, 0, 1,
-1.447958, -0.5911213, -1.93486, 1, 0.4156863, 0, 1,
-1.44055, 0.3573606, -1.143392, 1, 0.4196078, 0, 1,
-1.435742, 0.7227759, -1.698973, 1, 0.427451, 0, 1,
-1.430356, 0.4002072, -0.5544221, 1, 0.4313726, 0, 1,
-1.429861, 1.321523, 0.169517, 1, 0.4392157, 0, 1,
-1.419333, 0.100156, -2.170725, 1, 0.4431373, 0, 1,
-1.399255, 0.1864962, -0.7622362, 1, 0.4509804, 0, 1,
-1.390159, 1.426324, -1.310929, 1, 0.454902, 0, 1,
-1.388279, -0.2846101, -0.2809944, 1, 0.4627451, 0, 1,
-1.380802, 0.5851325, -0.8458301, 1, 0.4666667, 0, 1,
-1.375383, -0.5080715, 0.7160888, 1, 0.4745098, 0, 1,
-1.364534, 1.17881, -1.143897, 1, 0.4784314, 0, 1,
-1.363897, 0.786209, -0.5513519, 1, 0.4862745, 0, 1,
-1.36303, -0.1325058, -3.447009, 1, 0.4901961, 0, 1,
-1.333762, -0.1805031, -0.728089, 1, 0.4980392, 0, 1,
-1.325327, 0.51, -0.1248673, 1, 0.5058824, 0, 1,
-1.318578, -0.8170112, -1.492035, 1, 0.509804, 0, 1,
-1.309697, -0.8724472, -3.125529, 1, 0.5176471, 0, 1,
-1.298445, -0.6490965, -1.963916, 1, 0.5215687, 0, 1,
-1.294489, 1.805387, -0.09282762, 1, 0.5294118, 0, 1,
-1.286919, -0.1720017, -1.768052, 1, 0.5333334, 0, 1,
-1.282524, -0.2550601, -1.446626, 1, 0.5411765, 0, 1,
-1.282202, -0.9900455, -1.884228, 1, 0.5450981, 0, 1,
-1.276706, -0.4430766, -1.216314, 1, 0.5529412, 0, 1,
-1.273061, -1.88599, -3.241373, 1, 0.5568628, 0, 1,
-1.257414, 0.05428797, -2.45618, 1, 0.5647059, 0, 1,
-1.231895, -1.438459, -1.238159, 1, 0.5686275, 0, 1,
-1.220037, 1.77366, -0.6023943, 1, 0.5764706, 0, 1,
-1.215403, -1.10648, -1.585362, 1, 0.5803922, 0, 1,
-1.213171, 0.5267706, -0.6308861, 1, 0.5882353, 0, 1,
-1.212185, -0.5567997, -2.905884, 1, 0.5921569, 0, 1,
-1.211943, -0.2255178, -2.10381, 1, 0.6, 0, 1,
-1.204497, 0.5576011, -1.20106, 1, 0.6078432, 0, 1,
-1.198771, 0.6354448, -2.320317, 1, 0.6117647, 0, 1,
-1.191774, -0.7924347, -0.8283155, 1, 0.6196079, 0, 1,
-1.187646, 0.2406648, -2.3187, 1, 0.6235294, 0, 1,
-1.181865, -1.317849, -0.8795164, 1, 0.6313726, 0, 1,
-1.1813, -0.2031631, -1.871759, 1, 0.6352941, 0, 1,
-1.178871, -1.873014, -4.094489, 1, 0.6431373, 0, 1,
-1.174924, -0.9711035, -3.059606, 1, 0.6470588, 0, 1,
-1.174522, 0.8055679, -0.2155295, 1, 0.654902, 0, 1,
-1.171045, -0.02784521, -0.2401186, 1, 0.6588235, 0, 1,
-1.168327, -0.3180906, -3.75311, 1, 0.6666667, 0, 1,
-1.168038, 0.2578475, 0.8466685, 1, 0.6705883, 0, 1,
-1.166548, 0.04900985, -0.8282878, 1, 0.6784314, 0, 1,
-1.158487, 0.4903633, -1.651538, 1, 0.682353, 0, 1,
-1.153809, 0.6498423, -0.08130839, 1, 0.6901961, 0, 1,
-1.153698, -0.1564685, -2.064865, 1, 0.6941177, 0, 1,
-1.152801, -0.9742299, -2.785645, 1, 0.7019608, 0, 1,
-1.149887, 0.09106781, -0.3037449, 1, 0.7098039, 0, 1,
-1.145817, -1.343122, -2.068452, 1, 0.7137255, 0, 1,
-1.128495, 0.07921095, -2.088436, 1, 0.7215686, 0, 1,
-1.118713, -1.419391, -2.29522, 1, 0.7254902, 0, 1,
-1.108933, 0.7169284, -0.4906649, 1, 0.7333333, 0, 1,
-1.107719, -0.07646008, -2.788151, 1, 0.7372549, 0, 1,
-1.106095, 0.2790892, -2.175045, 1, 0.7450981, 0, 1,
-1.103663, -1.159919, -1.357313, 1, 0.7490196, 0, 1,
-1.100342, 0.6028041, -1.125324, 1, 0.7568628, 0, 1,
-1.097647, 1.676615, -1.635613, 1, 0.7607843, 0, 1,
-1.087046, 0.5537794, -2.137823, 1, 0.7686275, 0, 1,
-1.074437, -1.187835, -2.83466, 1, 0.772549, 0, 1,
-1.071946, -0.8338428, -1.611744, 1, 0.7803922, 0, 1,
-1.068165, -0.8407237, -1.792851, 1, 0.7843137, 0, 1,
-1.064265, -0.1929349, -2.773645, 1, 0.7921569, 0, 1,
-1.059867, -0.5289436, -2.805341, 1, 0.7960784, 0, 1,
-1.059446, -0.4008316, -2.185355, 1, 0.8039216, 0, 1,
-1.057804, 1.894078, -0.8989807, 1, 0.8117647, 0, 1,
-1.05281, 1.338175, -1.486867, 1, 0.8156863, 0, 1,
-1.051246, 1.701489, -0.3030437, 1, 0.8235294, 0, 1,
-1.051202, -1.480378, -2.195568, 1, 0.827451, 0, 1,
-1.04958, 0.3270954, -2.330081, 1, 0.8352941, 0, 1,
-1.043323, -0.1690249, -0.896546, 1, 0.8392157, 0, 1,
-1.041761, -1.467673, -1.787032, 1, 0.8470588, 0, 1,
-1.035471, 0.8425652, -0.9012576, 1, 0.8509804, 0, 1,
-1.033484, -0.6914734, -0.4527895, 1, 0.8588235, 0, 1,
-1.030419, 1.417125, -0.9305719, 1, 0.8627451, 0, 1,
-1.026403, 0.3292276, -1.499611, 1, 0.8705882, 0, 1,
-1.015445, 0.7559093, -2.821702, 1, 0.8745098, 0, 1,
-1.00464, -1.495708, -4.656744, 1, 0.8823529, 0, 1,
-1.004564, 0.2551162, -2.138619, 1, 0.8862745, 0, 1,
-1.000728, 0.6332829, -1.573809, 1, 0.8941177, 0, 1,
-0.9993919, 0.07789842, -2.536376, 1, 0.8980392, 0, 1,
-0.9929304, -0.1181569, -0.9578953, 1, 0.9058824, 0, 1,
-0.992714, -1.752498, -1.633044, 1, 0.9137255, 0, 1,
-0.9805293, -1.804438, -3.259009, 1, 0.9176471, 0, 1,
-0.9771908, 0.7742902, -1.598151, 1, 0.9254902, 0, 1,
-0.9728945, 0.08219349, -2.688859, 1, 0.9294118, 0, 1,
-0.9663641, 0.208865, -0.3295966, 1, 0.9372549, 0, 1,
-0.9655466, 0.8245075, -1.344596, 1, 0.9411765, 0, 1,
-0.9609431, 1.326895, 0.3436341, 1, 0.9490196, 0, 1,
-0.955582, 0.1312385, -1.797696, 1, 0.9529412, 0, 1,
-0.9537194, -0.3343587, -1.385783, 1, 0.9607843, 0, 1,
-0.9534501, -0.4135154, -3.139838, 1, 0.9647059, 0, 1,
-0.9502634, 0.1103207, -0.1980686, 1, 0.972549, 0, 1,
-0.9470201, 0.2325704, -1.382985, 1, 0.9764706, 0, 1,
-0.9381965, 1.426142, -1.60037, 1, 0.9843137, 0, 1,
-0.9377379, 1.483768, -0.822193, 1, 0.9882353, 0, 1,
-0.9300656, -0.8327782, -2.353896, 1, 0.9960784, 0, 1,
-0.9285733, -0.5459105, -1.36177, 0.9960784, 1, 0, 1,
-0.9221036, 0.7792552, -1.172914, 0.9921569, 1, 0, 1,
-0.9218953, -0.4548572, -1.294927, 0.9843137, 1, 0, 1,
-0.9213477, 1.846078, -2.419323, 0.9803922, 1, 0, 1,
-0.9172096, -0.03685262, 0.2057147, 0.972549, 1, 0, 1,
-0.9143742, -0.02756338, -0.9033732, 0.9686275, 1, 0, 1,
-0.914068, -0.9895822, -3.109588, 0.9607843, 1, 0, 1,
-0.9125264, -1.17457, -1.302311, 0.9568627, 1, 0, 1,
-0.9104171, -0.3778869, -3.166765, 0.9490196, 1, 0, 1,
-0.9076571, 1.697708, -1.695713, 0.945098, 1, 0, 1,
-0.9047511, -0.5311611, -3.622426, 0.9372549, 1, 0, 1,
-0.9044053, -1.153399, -2.174292, 0.9333333, 1, 0, 1,
-0.9013294, 0.8095983, -1.066127, 0.9254902, 1, 0, 1,
-0.9001755, 1.573972, -0.3947527, 0.9215686, 1, 0, 1,
-0.8957335, -1.077952, -2.148704, 0.9137255, 1, 0, 1,
-0.8954661, -1.049308, -1.196998, 0.9098039, 1, 0, 1,
-0.892672, -0.4240232, -2.128055, 0.9019608, 1, 0, 1,
-0.8913546, -0.728325, -2.144855, 0.8941177, 1, 0, 1,
-0.8899812, 0.05975766, -2.821644, 0.8901961, 1, 0, 1,
-0.8763673, -0.0481944, -0.9254785, 0.8823529, 1, 0, 1,
-0.8746625, 0.4009553, -1.953114, 0.8784314, 1, 0, 1,
-0.8745837, 0.3943958, -0.6840115, 0.8705882, 1, 0, 1,
-0.870369, -0.5081943, -1.283054, 0.8666667, 1, 0, 1,
-0.8669693, -1.301072, -0.5979187, 0.8588235, 1, 0, 1,
-0.8644713, -0.4596114, -0.4679605, 0.854902, 1, 0, 1,
-0.8614909, 0.4836012, -0.5331317, 0.8470588, 1, 0, 1,
-0.8598281, 0.1339519, -1.513641, 0.8431373, 1, 0, 1,
-0.8562762, 0.2640434, -1.974717, 0.8352941, 1, 0, 1,
-0.8509412, -0.6422216, -0.7616077, 0.8313726, 1, 0, 1,
-0.8453476, 0.3812604, -0.7861879, 0.8235294, 1, 0, 1,
-0.8408652, -0.7014323, -2.859413, 0.8196079, 1, 0, 1,
-0.8376543, 0.3044993, -1.048531, 0.8117647, 1, 0, 1,
-0.8223304, 0.102801, -1.578297, 0.8078431, 1, 0, 1,
-0.8206422, 1.157254, -1.796634, 0.8, 1, 0, 1,
-0.8178576, -0.5147992, -1.786033, 0.7921569, 1, 0, 1,
-0.8031177, -0.625938, -2.597498, 0.7882353, 1, 0, 1,
-0.8007703, 1.393975, 0.4746614, 0.7803922, 1, 0, 1,
-0.7928914, 0.5058401, -0.337231, 0.7764706, 1, 0, 1,
-0.7927375, -0.4711238, -2.704527, 0.7686275, 1, 0, 1,
-0.7913432, -1.603584, -3.211109, 0.7647059, 1, 0, 1,
-0.7868584, 0.05372141, -1.881793, 0.7568628, 1, 0, 1,
-0.7848949, -0.06147822, -2.618228, 0.7529412, 1, 0, 1,
-0.7799903, -0.132088, -3.775768, 0.7450981, 1, 0, 1,
-0.7766816, 0.7059068, -0.3670106, 0.7411765, 1, 0, 1,
-0.7755437, 2.317591, -0.03037569, 0.7333333, 1, 0, 1,
-0.7709597, 0.5750385, -1.231424, 0.7294118, 1, 0, 1,
-0.7706498, 1.69887, 0.7292528, 0.7215686, 1, 0, 1,
-0.7705595, -0.2673462, -1.013804, 0.7176471, 1, 0, 1,
-0.7685835, 0.5331701, -1.260829, 0.7098039, 1, 0, 1,
-0.7681187, -0.8166898, -2.038052, 0.7058824, 1, 0, 1,
-0.7673228, 0.4389866, -2.118925, 0.6980392, 1, 0, 1,
-0.7670053, 0.9748841, -0.3712465, 0.6901961, 1, 0, 1,
-0.7651086, -0.7780629, -2.825116, 0.6862745, 1, 0, 1,
-0.7650409, 0.4630902, -0.8230786, 0.6784314, 1, 0, 1,
-0.7645193, -0.3458656, -2.809057, 0.6745098, 1, 0, 1,
-0.7596043, -1.049082, -2.530212, 0.6666667, 1, 0, 1,
-0.7590412, 0.1698357, -1.179476, 0.6627451, 1, 0, 1,
-0.7581507, 0.509981, -0.451332, 0.654902, 1, 0, 1,
-0.7505105, -1.142132, -1.178251, 0.6509804, 1, 0, 1,
-0.7492132, 1.003902, -1.640204, 0.6431373, 1, 0, 1,
-0.7470121, -0.6613957, -2.382279, 0.6392157, 1, 0, 1,
-0.7443736, -0.268709, -3.330641, 0.6313726, 1, 0, 1,
-0.7409871, -0.9074543, -4.135028, 0.627451, 1, 0, 1,
-0.740418, 0.9936777, -0.9992579, 0.6196079, 1, 0, 1,
-0.7350053, -0.2648495, -2.554635, 0.6156863, 1, 0, 1,
-0.7320145, -0.298368, -0.2751395, 0.6078432, 1, 0, 1,
-0.7297507, 1.86454, -1.538511, 0.6039216, 1, 0, 1,
-0.7208717, 1.003623, -1.529387, 0.5960785, 1, 0, 1,
-0.7205782, 0.2519569, -1.991994, 0.5882353, 1, 0, 1,
-0.714173, -1.198452, -2.790181, 0.5843138, 1, 0, 1,
-0.7094792, 0.9088466, -0.5910297, 0.5764706, 1, 0, 1,
-0.7087961, -0.5106815, -0.6124824, 0.572549, 1, 0, 1,
-0.699173, 1.889144, 0.1102435, 0.5647059, 1, 0, 1,
-0.69728, 0.2963194, -0.2445902, 0.5607843, 1, 0, 1,
-0.695631, 1.329692, -0.4350802, 0.5529412, 1, 0, 1,
-0.6874078, -1.385798, -4.820093, 0.5490196, 1, 0, 1,
-0.6700776, -0.04336926, -2.784461, 0.5411765, 1, 0, 1,
-0.6601927, 2.144629, 0.6907957, 0.5372549, 1, 0, 1,
-0.6563096, -1.286508, -3.080214, 0.5294118, 1, 0, 1,
-0.6545727, 0.5667147, -1.060828, 0.5254902, 1, 0, 1,
-0.6524453, 1.054177, 2.159549, 0.5176471, 1, 0, 1,
-0.643158, 0.6607453, -1.522961, 0.5137255, 1, 0, 1,
-0.6355762, 0.1961602, -0.4155897, 0.5058824, 1, 0, 1,
-0.63428, -1.043345, -3.075925, 0.5019608, 1, 0, 1,
-0.6290556, -1.273242, -2.191952, 0.4941176, 1, 0, 1,
-0.6275513, 0.7398008, -1.812355, 0.4862745, 1, 0, 1,
-0.6238019, -1.069704, -3.960532, 0.4823529, 1, 0, 1,
-0.6203043, 0.4113804, 0.4321311, 0.4745098, 1, 0, 1,
-0.6197109, -2.335823, -3.392694, 0.4705882, 1, 0, 1,
-0.614124, -0.948706, -2.21066, 0.4627451, 1, 0, 1,
-0.6102536, -1.395205, -4.360643, 0.4588235, 1, 0, 1,
-0.6036871, -0.1148636, -1.44572, 0.4509804, 1, 0, 1,
-0.5983928, -1.208425, -2.255795, 0.4470588, 1, 0, 1,
-0.5973061, 1.279955, 1.757611, 0.4392157, 1, 0, 1,
-0.5962874, -0.4333974, -2.374346, 0.4352941, 1, 0, 1,
-0.5945451, 0.5322725, -3.941262, 0.427451, 1, 0, 1,
-0.5940922, 0.005254562, -1.016844, 0.4235294, 1, 0, 1,
-0.5905312, -0.344195, -1.764645, 0.4156863, 1, 0, 1,
-0.5898251, 0.03600254, -1.945646, 0.4117647, 1, 0, 1,
-0.589316, 1.309074, -0.1911238, 0.4039216, 1, 0, 1,
-0.5879166, 0.9478768, -2.546766, 0.3960784, 1, 0, 1,
-0.5876139, 0.01585022, -0.6646479, 0.3921569, 1, 0, 1,
-0.5856125, -0.7409121, -0.6275879, 0.3843137, 1, 0, 1,
-0.5854885, -1.078689, -1.516969, 0.3803922, 1, 0, 1,
-0.5819767, -0.7724797, -2.982403, 0.372549, 1, 0, 1,
-0.5759245, 0.1589366, 0.4636895, 0.3686275, 1, 0, 1,
-0.5756614, 0.2859788, -2.619165, 0.3607843, 1, 0, 1,
-0.574978, -2.735, -2.200465, 0.3568628, 1, 0, 1,
-0.5738388, 1.000949, 0.05076924, 0.3490196, 1, 0, 1,
-0.573656, -2.646399, -2.215047, 0.345098, 1, 0, 1,
-0.5733903, 0.7550503, -1.543813, 0.3372549, 1, 0, 1,
-0.5725753, -0.01260077, -0.5100438, 0.3333333, 1, 0, 1,
-0.5708861, -1.624459, -3.314753, 0.3254902, 1, 0, 1,
-0.5700116, -0.05354673, -2.396299, 0.3215686, 1, 0, 1,
-0.5686039, 1.606981, -0.1606982, 0.3137255, 1, 0, 1,
-0.5671158, -2.416242, -2.250166, 0.3098039, 1, 0, 1,
-0.56099, 0.3958821, 0.6956174, 0.3019608, 1, 0, 1,
-0.5581383, -0.6918727, -3.918144, 0.2941177, 1, 0, 1,
-0.5579773, -1.289107, -5.066726, 0.2901961, 1, 0, 1,
-0.5571399, -1.136865, -1.437038, 0.282353, 1, 0, 1,
-0.5508878, 0.5309238, 0.5079159, 0.2784314, 1, 0, 1,
-0.5409092, 0.3918425, -0.213985, 0.2705882, 1, 0, 1,
-0.5312154, 0.3375903, -1.044206, 0.2666667, 1, 0, 1,
-0.5273589, -1.592658, -2.404013, 0.2588235, 1, 0, 1,
-0.5201853, -0.2289024, -2.708722, 0.254902, 1, 0, 1,
-0.5201316, 0.1030171, -2.397933, 0.2470588, 1, 0, 1,
-0.5126945, 0.3287696, -1.171299, 0.2431373, 1, 0, 1,
-0.5096674, -0.4640782, -2.56894, 0.2352941, 1, 0, 1,
-0.5085404, -1.205429, -4.167162, 0.2313726, 1, 0, 1,
-0.507871, 2.819812, -1.944646, 0.2235294, 1, 0, 1,
-0.505326, -0.2008018, -1.071598, 0.2196078, 1, 0, 1,
-0.4991716, 1.149413, -1.230281, 0.2117647, 1, 0, 1,
-0.499137, -1.167597, -3.024553, 0.2078431, 1, 0, 1,
-0.4969794, -1.79777, -2.004771, 0.2, 1, 0, 1,
-0.4948365, -0.3076801, -4.39806, 0.1921569, 1, 0, 1,
-0.4939209, -3.086284, -2.639357, 0.1882353, 1, 0, 1,
-0.4899124, 0.8861235, -1.702348, 0.1803922, 1, 0, 1,
-0.4871315, -0.09744165, -2.118594, 0.1764706, 1, 0, 1,
-0.4819531, -1.315415, -3.14655, 0.1686275, 1, 0, 1,
-0.4738484, -0.3555078, -1.824531, 0.1647059, 1, 0, 1,
-0.4717075, 0.4323855, 0.5036229, 0.1568628, 1, 0, 1,
-0.4710406, -0.3768581, -2.720726, 0.1529412, 1, 0, 1,
-0.4707167, -1.148423, -1.596271, 0.145098, 1, 0, 1,
-0.470107, -1.030985, -2.592702, 0.1411765, 1, 0, 1,
-0.4657021, 0.5133732, -1.646086, 0.1333333, 1, 0, 1,
-0.4635417, -0.1911729, -2.279685, 0.1294118, 1, 0, 1,
-0.4633739, -0.2090699, -2.313097, 0.1215686, 1, 0, 1,
-0.4583438, -0.5523765, -2.163391, 0.1176471, 1, 0, 1,
-0.4583005, 1.042676, -0.8936791, 0.1098039, 1, 0, 1,
-0.4561501, -0.6799939, -2.704463, 0.1058824, 1, 0, 1,
-0.4555975, -0.7797618, -2.526723, 0.09803922, 1, 0, 1,
-0.4420779, -0.7443271, -2.774486, 0.09019608, 1, 0, 1,
-0.440777, -0.9043806, -3.062021, 0.08627451, 1, 0, 1,
-0.4389718, 0.3043906, -1.474622, 0.07843138, 1, 0, 1,
-0.4385853, 0.6614749, -1.093322, 0.07450981, 1, 0, 1,
-0.4379486, 1.869662, -1.951359, 0.06666667, 1, 0, 1,
-0.4291058, -1.617109, -2.983874, 0.0627451, 1, 0, 1,
-0.4263302, 0.8092547, 0.4769934, 0.05490196, 1, 0, 1,
-0.4255361, -1.669682, -2.055279, 0.05098039, 1, 0, 1,
-0.4247547, -0.7814804, -3.687892, 0.04313726, 1, 0, 1,
-0.421217, -0.01229304, -0.6880254, 0.03921569, 1, 0, 1,
-0.4178364, 0.9548481, 2.441721, 0.03137255, 1, 0, 1,
-0.4164185, 0.3418387, -1.62232, 0.02745098, 1, 0, 1,
-0.4115051, -0.09020537, -1.052847, 0.01960784, 1, 0, 1,
-0.4098494, 0.604185, -0.4268604, 0.01568628, 1, 0, 1,
-0.409194, -0.809593, -3.009758, 0.007843138, 1, 0, 1,
-0.4071363, 1.608605, -0.4222196, 0.003921569, 1, 0, 1,
-0.4067542, -0.260763, -2.956937, 0, 1, 0.003921569, 1,
-0.4066674, 0.01136656, -0.819943, 0, 1, 0.01176471, 1,
-0.3970452, -0.4183388, -3.822693, 0, 1, 0.01568628, 1,
-0.3936734, 1.861519, -0.4844441, 0, 1, 0.02352941, 1,
-0.3881299, -0.6468535, -3.358674, 0, 1, 0.02745098, 1,
-0.3844922, 1.715359, 0.6114553, 0, 1, 0.03529412, 1,
-0.3837043, -1.227993, -2.141106, 0, 1, 0.03921569, 1,
-0.3788418, -0.5459841, -4.716649, 0, 1, 0.04705882, 1,
-0.3747092, 1.131023, -0.8236536, 0, 1, 0.05098039, 1,
-0.3722815, 0.1431349, -1.222554, 0, 1, 0.05882353, 1,
-0.3678598, 0.5098288, 0.5170481, 0, 1, 0.0627451, 1,
-0.3643764, -0.3018912, -2.14232, 0, 1, 0.07058824, 1,
-0.3640111, -1.583614, -5.244852, 0, 1, 0.07450981, 1,
-0.3638392, 0.3257675, -1.621783, 0, 1, 0.08235294, 1,
-0.3631354, 1.227708, -1.570336, 0, 1, 0.08627451, 1,
-0.3609967, -0.4513491, -3.116365, 0, 1, 0.09411765, 1,
-0.3561675, -1.457966, -3.289771, 0, 1, 0.1019608, 1,
-0.3455388, -0.0001626571, -0.5831162, 0, 1, 0.1058824, 1,
-0.3441962, 0.03654183, 0.5418679, 0, 1, 0.1137255, 1,
-0.3425985, -1.698134, -2.252016, 0, 1, 0.1176471, 1,
-0.342392, 0.5099974, -1.117674, 0, 1, 0.1254902, 1,
-0.3416663, -0.2670631, -3.134344, 0, 1, 0.1294118, 1,
-0.3405683, -1.695825, -3.547359, 0, 1, 0.1372549, 1,
-0.340452, -0.6019363, -3.92761, 0, 1, 0.1411765, 1,
-0.3383818, -0.0272733, -0.9384179, 0, 1, 0.1490196, 1,
-0.3376204, -1.301456, -0.1980179, 0, 1, 0.1529412, 1,
-0.3365008, 1.092085, 0.194661, 0, 1, 0.1607843, 1,
-0.3362352, 0.7997922, -0.781273, 0, 1, 0.1647059, 1,
-0.3332527, 0.5090576, -0.8290316, 0, 1, 0.172549, 1,
-0.3301349, -0.8068717, -3.670712, 0, 1, 0.1764706, 1,
-0.3182303, -0.9538796, -0.9490161, 0, 1, 0.1843137, 1,
-0.3178372, 1.122682, 0.7581671, 0, 1, 0.1882353, 1,
-0.316457, 1.965947, -2.677234, 0, 1, 0.1960784, 1,
-0.3092962, 0.6096379, -0.6984069, 0, 1, 0.2039216, 1,
-0.3072003, 1.488614, 0.8931823, 0, 1, 0.2078431, 1,
-0.3002792, -1.382903, -3.494591, 0, 1, 0.2156863, 1,
-0.2995675, -1.076217, -2.748999, 0, 1, 0.2196078, 1,
-0.2985397, -0.934824, -4.149964, 0, 1, 0.227451, 1,
-0.295448, 0.08539914, -2.026913, 0, 1, 0.2313726, 1,
-0.2871238, -1.351724, -1.910056, 0, 1, 0.2392157, 1,
-0.2838325, -0.4285451, -5.143107, 0, 1, 0.2431373, 1,
-0.2755161, -0.1630549, -1.145895, 0, 1, 0.2509804, 1,
-0.2725301, -0.2296966, -1.612023, 0, 1, 0.254902, 1,
-0.2700716, 1.248282, -0.8177319, 0, 1, 0.2627451, 1,
-0.2694905, 1.916892, -0.3842779, 0, 1, 0.2666667, 1,
-0.2668859, -1.107384, -0.4720475, 0, 1, 0.2745098, 1,
-0.259133, 1.260546, 1.119441, 0, 1, 0.2784314, 1,
-0.2585579, -1.371197, -1.807959, 0, 1, 0.2862745, 1,
-0.258339, 0.1226109, -1.88509, 0, 1, 0.2901961, 1,
-0.2577483, 0.2046898, -0.2456666, 0, 1, 0.2980392, 1,
-0.2570427, -2.891348, -3.165365, 0, 1, 0.3058824, 1,
-0.2493666, 0.3190821, 0.005380621, 0, 1, 0.3098039, 1,
-0.2487685, -0.7196809, -2.787451, 0, 1, 0.3176471, 1,
-0.245, -1.17697, -2.641608, 0, 1, 0.3215686, 1,
-0.2448973, 1.194376, -0.6866741, 0, 1, 0.3294118, 1,
-0.2420111, 0.02926261, 0.2866292, 0, 1, 0.3333333, 1,
-0.2388647, -0.9657841, -4.10637, 0, 1, 0.3411765, 1,
-0.2377274, 2.09349, 1.130932, 0, 1, 0.345098, 1,
-0.2373283, -0.7370113, -1.024987, 0, 1, 0.3529412, 1,
-0.233756, 1.686224, 0.5184315, 0, 1, 0.3568628, 1,
-0.2313487, -2.914925, -3.502184, 0, 1, 0.3647059, 1,
-0.2301957, -0.6883284, -1.551612, 0, 1, 0.3686275, 1,
-0.2288645, -0.7962974, -2.383485, 0, 1, 0.3764706, 1,
-0.2282996, -1.078998, -2.783999, 0, 1, 0.3803922, 1,
-0.2277101, 0.02164123, -1.99302, 0, 1, 0.3882353, 1,
-0.2264117, -0.1704883, -3.966046, 0, 1, 0.3921569, 1,
-0.225094, 0.1798937, -1.259172, 0, 1, 0.4, 1,
-0.2225806, -0.1745912, -1.916649, 0, 1, 0.4078431, 1,
-0.220525, 2.360583, -1.404235, 0, 1, 0.4117647, 1,
-0.2191892, -0.6921942, -2.508117, 0, 1, 0.4196078, 1,
-0.2169233, -0.5031916, -2.312435, 0, 1, 0.4235294, 1,
-0.2081429, 2.311561, -2.380228, 0, 1, 0.4313726, 1,
-0.2074567, -0.2787769, -2.503813, 0, 1, 0.4352941, 1,
-0.2064541, -0.9656487, -3.646028, 0, 1, 0.4431373, 1,
-0.1986013, 1.11834, 0.4571144, 0, 1, 0.4470588, 1,
-0.1978849, -0.5660817, -2.193597, 0, 1, 0.454902, 1,
-0.1978716, 1.165896, 0.8489059, 0, 1, 0.4588235, 1,
-0.197248, 3.195643, -0.8535859, 0, 1, 0.4666667, 1,
-0.1958997, 0.430002, 0.1158508, 0, 1, 0.4705882, 1,
-0.1947863, 0.1895681, 1.34375, 0, 1, 0.4784314, 1,
-0.1918275, 1.429502, -1.325462, 0, 1, 0.4823529, 1,
-0.1903379, 0.7172323, 0.7303085, 0, 1, 0.4901961, 1,
-0.1900315, 1.326868, 0.6134323, 0, 1, 0.4941176, 1,
-0.189778, -1.229477, -3.294481, 0, 1, 0.5019608, 1,
-0.1870062, -0.05392265, -1.198243, 0, 1, 0.509804, 1,
-0.1851888, 0.4180802, 0.5254107, 0, 1, 0.5137255, 1,
-0.1818869, 0.1005066, 0.5111444, 0, 1, 0.5215687, 1,
-0.1785489, -0.6411757, -3.234241, 0, 1, 0.5254902, 1,
-0.1752557, -0.744524, -2.445841, 0, 1, 0.5333334, 1,
-0.1745585, -0.8250397, -2.402337, 0, 1, 0.5372549, 1,
-0.1744997, 1.451656, -0.7170879, 0, 1, 0.5450981, 1,
-0.1741719, -0.1449494, -1.671611, 0, 1, 0.5490196, 1,
-0.1712372, -0.0105391, -1.391606, 0, 1, 0.5568628, 1,
-0.171075, 1.065553, 0.501883, 0, 1, 0.5607843, 1,
-0.1657308, -0.3014197, -4.045768, 0, 1, 0.5686275, 1,
-0.1603516, -1.250165, -2.688713, 0, 1, 0.572549, 1,
-0.1597048, 0.3654679, -0.9118107, 0, 1, 0.5803922, 1,
-0.1586316, 2.246051, 0.6600481, 0, 1, 0.5843138, 1,
-0.1577118, -1.890221, -0.9480725, 0, 1, 0.5921569, 1,
-0.1550198, 0.6426473, -0.4472216, 0, 1, 0.5960785, 1,
-0.1515952, -0.2185158, -2.755751, 0, 1, 0.6039216, 1,
-0.15116, 0.9358289, 0.6054814, 0, 1, 0.6117647, 1,
-0.1463425, -0.2642429, -3.171502, 0, 1, 0.6156863, 1,
-0.1445962, -0.01269, -1.282391, 0, 1, 0.6235294, 1,
-0.1372873, -0.6608621, -2.65339, 0, 1, 0.627451, 1,
-0.1370637, 0.3116646, 1.696131, 0, 1, 0.6352941, 1,
-0.1364606, 1.108928, 0.7617776, 0, 1, 0.6392157, 1,
-0.1316081, -1.00471, -2.968132, 0, 1, 0.6470588, 1,
-0.1274477, -0.5001442, -1.095547, 0, 1, 0.6509804, 1,
-0.1259567, 0.457283, 0.3647085, 0, 1, 0.6588235, 1,
-0.1257201, -0.5565171, -2.148599, 0, 1, 0.6627451, 1,
-0.1176943, 0.07755395, -0.7630321, 0, 1, 0.6705883, 1,
-0.1097615, -0.241768, -3.018686, 0, 1, 0.6745098, 1,
-0.1053761, 1.0262, -0.9559319, 0, 1, 0.682353, 1,
-0.1003159, -0.8439935, -3.665204, 0, 1, 0.6862745, 1,
-0.09547035, -0.2224309, -4.65547, 0, 1, 0.6941177, 1,
-0.09403215, -1.397202, -3.642839, 0, 1, 0.7019608, 1,
-0.09286483, -0.1169629, -3.1815, 0, 1, 0.7058824, 1,
-0.08728206, -0.844516, -3.547444, 0, 1, 0.7137255, 1,
-0.0778265, -0.4097047, -2.619792, 0, 1, 0.7176471, 1,
-0.07568289, -0.3230237, -2.505397, 0, 1, 0.7254902, 1,
-0.07514159, 1.049049, 0.7377568, 0, 1, 0.7294118, 1,
-0.07296008, 0.7397448, 1.24722, 0, 1, 0.7372549, 1,
-0.0670476, 2.543576, 0.7342544, 0, 1, 0.7411765, 1,
-0.06166579, -1.733328, -2.84093, 0, 1, 0.7490196, 1,
-0.05908899, -0.7122271, -3.132788, 0, 1, 0.7529412, 1,
-0.05850876, -0.7489383, -2.093097, 0, 1, 0.7607843, 1,
-0.05686176, 1.570229, 1.501095, 0, 1, 0.7647059, 1,
-0.05626732, 0.3424981, 0.1162126, 0, 1, 0.772549, 1,
-0.05512426, -0.7493989, -3.957406, 0, 1, 0.7764706, 1,
-0.0514246, -0.4194442, -2.607562, 0, 1, 0.7843137, 1,
-0.05011893, 0.2190211, 0.508778, 0, 1, 0.7882353, 1,
-0.04958624, 1.092084, -1.088258, 0, 1, 0.7960784, 1,
-0.04790516, 1.634287, -0.5523625, 0, 1, 0.8039216, 1,
-0.0464735, -0.4258106, -3.599511, 0, 1, 0.8078431, 1,
-0.04605074, 1.967183, 2.444595, 0, 1, 0.8156863, 1,
-0.04512402, -1.524106, -3.104361, 0, 1, 0.8196079, 1,
-0.04101492, 0.01286985, -1.774009, 0, 1, 0.827451, 1,
-0.04085917, 1.432592, -1.121196, 0, 1, 0.8313726, 1,
-0.035049, -1.853855, -3.966654, 0, 1, 0.8392157, 1,
-0.03383269, -0.0552064, -1.401724, 0, 1, 0.8431373, 1,
-0.02863176, 0.6912197, -0.2044101, 0, 1, 0.8509804, 1,
-0.02749739, 2.790478, -0.8325559, 0, 1, 0.854902, 1,
-0.02683198, 1.109935, -0.6509302, 0, 1, 0.8627451, 1,
-0.02666657, -1.775999, -1.252678, 0, 1, 0.8666667, 1,
-0.02634584, -0.4257679, -2.519228, 0, 1, 0.8745098, 1,
-0.01755365, 1.724018, 0.3487861, 0, 1, 0.8784314, 1,
-0.01480881, 0.7860097, -1.31923, 0, 1, 0.8862745, 1,
-0.01243475, -0.1190212, -2.289404, 0, 1, 0.8901961, 1,
-0.01130196, -0.3950579, -2.566457, 0, 1, 0.8980392, 1,
-0.003485169, -0.4376855, -2.517934, 0, 1, 0.9058824, 1,
-0.002859565, 0.5261459, 0.06605548, 0, 1, 0.9098039, 1,
0.003736518, -1.261229, 1.978971, 0, 1, 0.9176471, 1,
0.00437458, -2.093463, 2.165692, 0, 1, 0.9215686, 1,
0.005798755, -0.2203187, 2.833967, 0, 1, 0.9294118, 1,
0.006862219, 0.7796305, -0.6083961, 0, 1, 0.9333333, 1,
0.006939724, 0.7843606, -1.046781, 0, 1, 0.9411765, 1,
0.008592122, 0.9744925, 1.145239, 0, 1, 0.945098, 1,
0.008774005, -1.159289, 4.341517, 0, 1, 0.9529412, 1,
0.01349015, 1.097786, -0.6130373, 0, 1, 0.9568627, 1,
0.01403223, -0.668709, 4.856508, 0, 1, 0.9647059, 1,
0.01501145, 0.1623165, 0.2425417, 0, 1, 0.9686275, 1,
0.02007069, -0.2085206, 2.42138, 0, 1, 0.9764706, 1,
0.02148805, 2.125306, 1.140601, 0, 1, 0.9803922, 1,
0.02525732, -0.1201762, 1.28924, 0, 1, 0.9882353, 1,
0.03122136, 0.114225, 0.1414893, 0, 1, 0.9921569, 1,
0.03243293, -0.7821648, 2.259789, 0, 1, 1, 1,
0.03270396, 0.1795034, -0.01594474, 0, 0.9921569, 1, 1,
0.03608843, 1.275896, 0.3888537, 0, 0.9882353, 1, 1,
0.03669273, 0.7662362, 0.4573664, 0, 0.9803922, 1, 1,
0.03926627, -0.9244833, 1.608021, 0, 0.9764706, 1, 1,
0.04245407, 0.06360023, 2.888229, 0, 0.9686275, 1, 1,
0.04320204, -0.2623578, 4.742347, 0, 0.9647059, 1, 1,
0.04395843, 0.1814929, 1.51551, 0, 0.9568627, 1, 1,
0.04964177, -1.495417, 4.192685, 0, 0.9529412, 1, 1,
0.04999936, -0.02081577, 1.914302, 0, 0.945098, 1, 1,
0.05084169, 0.07541691, 0.9910678, 0, 0.9411765, 1, 1,
0.05308485, -0.6556458, 5.011005, 0, 0.9333333, 1, 1,
0.05469659, 0.5819211, -0.6070956, 0, 0.9294118, 1, 1,
0.05551672, -0.4793392, 0.3706221, 0, 0.9215686, 1, 1,
0.05867948, -0.7422878, 0.7770332, 0, 0.9176471, 1, 1,
0.06040187, -1.653106, 2.393822, 0, 0.9098039, 1, 1,
0.06082633, -1.512782, 2.916514, 0, 0.9058824, 1, 1,
0.06352897, 1.263456, 0.7232099, 0, 0.8980392, 1, 1,
0.06492197, -1.342493, 3.503462, 0, 0.8901961, 1, 1,
0.06555597, -0.6176268, 2.042294, 0, 0.8862745, 1, 1,
0.06745892, -0.3416074, 5.514883, 0, 0.8784314, 1, 1,
0.06764371, 0.6877776, -0.8270922, 0, 0.8745098, 1, 1,
0.07198311, -0.9488387, 4.411202, 0, 0.8666667, 1, 1,
0.07283294, -0.5475308, 4.003142, 0, 0.8627451, 1, 1,
0.07513641, -0.1329816, 3.003633, 0, 0.854902, 1, 1,
0.07913122, -0.5521072, 2.206114, 0, 0.8509804, 1, 1,
0.07913613, -1.335962, 2.407664, 0, 0.8431373, 1, 1,
0.08056977, -1.613303, 2.005195, 0, 0.8392157, 1, 1,
0.08141771, -1.428054, 2.126986, 0, 0.8313726, 1, 1,
0.08150003, -0.4103399, 2.1957, 0, 0.827451, 1, 1,
0.08596284, -0.6649907, 3.908362, 0, 0.8196079, 1, 1,
0.08669928, -0.6421945, 3.304554, 0, 0.8156863, 1, 1,
0.08826127, 0.4086229, -0.1238836, 0, 0.8078431, 1, 1,
0.0889783, -1.056229, 2.721484, 0, 0.8039216, 1, 1,
0.08900079, -0.02668165, 2.132018, 0, 0.7960784, 1, 1,
0.09188353, 0.09126872, 0.6535627, 0, 0.7882353, 1, 1,
0.09219555, 0.3035323, -0.7981426, 0, 0.7843137, 1, 1,
0.09993619, -0.5767355, 3.516884, 0, 0.7764706, 1, 1,
0.1034695, -0.07154323, 2.390505, 0, 0.772549, 1, 1,
0.1035346, -0.4931149, 3.506316, 0, 0.7647059, 1, 1,
0.1091324, 0.5189868, -0.4007427, 0, 0.7607843, 1, 1,
0.1165643, 0.8391182, -0.6540629, 0, 0.7529412, 1, 1,
0.1207849, 0.4508379, -1.760736, 0, 0.7490196, 1, 1,
0.1228704, -0.9428636, 2.721403, 0, 0.7411765, 1, 1,
0.1257228, -0.4758165, 4.230515, 0, 0.7372549, 1, 1,
0.1257984, -0.240233, 1.06321, 0, 0.7294118, 1, 1,
0.1293141, -0.4602306, 2.582621, 0, 0.7254902, 1, 1,
0.1318986, -0.8665659, 3.674396, 0, 0.7176471, 1, 1,
0.1323935, 0.3197234, 0.4637131, 0, 0.7137255, 1, 1,
0.1327013, -1.385268, 2.426218, 0, 0.7058824, 1, 1,
0.1357474, -2.148649, 2.595385, 0, 0.6980392, 1, 1,
0.1409095, 1.348363, 1.040302, 0, 0.6941177, 1, 1,
0.1540635, 0.06938636, 0.5478595, 0, 0.6862745, 1, 1,
0.1550834, 1.1664, 0.6157454, 0, 0.682353, 1, 1,
0.1551095, 0.2755907, -0.7609772, 0, 0.6745098, 1, 1,
0.1603923, -0.6478235, 3.465682, 0, 0.6705883, 1, 1,
0.1604451, 0.8503298, 0.389264, 0, 0.6627451, 1, 1,
0.1631286, 0.360111, 0.4238938, 0, 0.6588235, 1, 1,
0.1635009, 2.220851, 0.4556565, 0, 0.6509804, 1, 1,
0.1696088, 0.8143848, 0.3598027, 0, 0.6470588, 1, 1,
0.1707969, 0.7429436, -0.3661096, 0, 0.6392157, 1, 1,
0.1711983, 0.8992292, 0.4507872, 0, 0.6352941, 1, 1,
0.1718418, 0.9967116, -0.2548362, 0, 0.627451, 1, 1,
0.1783238, -0.3255914, 3.026483, 0, 0.6235294, 1, 1,
0.1795956, 0.5899663, 0.08820219, 0, 0.6156863, 1, 1,
0.1816074, -1.601064, 1.49398, 0, 0.6117647, 1, 1,
0.1827774, 1.805115, -1.696485, 0, 0.6039216, 1, 1,
0.1843839, -0.2414051, 2.864686, 0, 0.5960785, 1, 1,
0.1845221, -0.1460031, 1.089869, 0, 0.5921569, 1, 1,
0.1893657, -0.5142856, 4.228324, 0, 0.5843138, 1, 1,
0.1895031, -0.4234402, 2.573798, 0, 0.5803922, 1, 1,
0.1900622, 1.216035, 1.032215, 0, 0.572549, 1, 1,
0.1905358, 0.7880328, -1.293091, 0, 0.5686275, 1, 1,
0.1916579, 0.5922466, 1.599274, 0, 0.5607843, 1, 1,
0.1921277, -0.1150567, 1.316725, 0, 0.5568628, 1, 1,
0.1934996, 0.7539184, 0.05638583, 0, 0.5490196, 1, 1,
0.193668, -0.4331316, 2.567262, 0, 0.5450981, 1, 1,
0.2024631, 0.1901894, 0.117513, 0, 0.5372549, 1, 1,
0.2038646, -0.7825114, 2.035806, 0, 0.5333334, 1, 1,
0.2065663, 1.391677, -0.02903241, 0, 0.5254902, 1, 1,
0.2069996, -0.1908881, 4.204921, 0, 0.5215687, 1, 1,
0.2087327, -0.4249156, 3.306469, 0, 0.5137255, 1, 1,
0.2123884, -0.8752313, 2.34024, 0, 0.509804, 1, 1,
0.2125052, -0.5048224, 2.395255, 0, 0.5019608, 1, 1,
0.2126075, 0.6279163, 0.9657481, 0, 0.4941176, 1, 1,
0.2138701, 0.6936339, 0.4166186, 0, 0.4901961, 1, 1,
0.2142012, 2.029204, 1.197936, 0, 0.4823529, 1, 1,
0.2148782, -1.336323, 2.578608, 0, 0.4784314, 1, 1,
0.2151862, 0.02954912, 2.025388, 0, 0.4705882, 1, 1,
0.2171762, -0.6211977, 2.205809, 0, 0.4666667, 1, 1,
0.2186243, 0.01377827, 0.864512, 0, 0.4588235, 1, 1,
0.2195852, -0.1465021, 1.793528, 0, 0.454902, 1, 1,
0.2250289, 0.4715814, 1.873579, 0, 0.4470588, 1, 1,
0.2342057, 1.230356, -0.5687811, 0, 0.4431373, 1, 1,
0.2349071, 2.435904, -0.3623899, 0, 0.4352941, 1, 1,
0.2352207, -1.117369, 1.598858, 0, 0.4313726, 1, 1,
0.2533914, -0.6961639, 1.972721, 0, 0.4235294, 1, 1,
0.2551663, -0.4348603, 1.518342, 0, 0.4196078, 1, 1,
0.2642402, -1.634696, 2.551109, 0, 0.4117647, 1, 1,
0.2663952, -1.649851, 3.263891, 0, 0.4078431, 1, 1,
0.2694811, 1.452343, -0.3489741, 0, 0.4, 1, 1,
0.2735232, -0.3372639, 2.371901, 0, 0.3921569, 1, 1,
0.2774943, -1.764888, 3.012731, 0, 0.3882353, 1, 1,
0.2802471, -1.177143, 1.680319, 0, 0.3803922, 1, 1,
0.2809929, -0.6088948, 2.433022, 0, 0.3764706, 1, 1,
0.2811331, 0.3163877, 0.4933343, 0, 0.3686275, 1, 1,
0.2827372, -0.4629795, 1.919077, 0, 0.3647059, 1, 1,
0.2833551, 0.2323725, 0.426553, 0, 0.3568628, 1, 1,
0.2898363, 0.2107302, 2.385339, 0, 0.3529412, 1, 1,
0.2916499, -0.1529822, 3.176274, 0, 0.345098, 1, 1,
0.2937966, -0.0769298, 1.983076, 0, 0.3411765, 1, 1,
0.2960954, -0.5842897, 2.653103, 0, 0.3333333, 1, 1,
0.2988448, -1.385931, 2.843195, 0, 0.3294118, 1, 1,
0.3035613, 0.7658105, -0.0202614, 0, 0.3215686, 1, 1,
0.307851, -0.3593832, 1.607938, 0, 0.3176471, 1, 1,
0.309117, -1.098592, 3.417645, 0, 0.3098039, 1, 1,
0.3106814, 0.2891241, 0.4031414, 0, 0.3058824, 1, 1,
0.3111543, 1.674546, -1.722435, 0, 0.2980392, 1, 1,
0.3160462, -0.3074825, 2.575529, 0, 0.2901961, 1, 1,
0.3180708, 1.571169, -0.085434, 0, 0.2862745, 1, 1,
0.324282, 1.674247, -0.6762223, 0, 0.2784314, 1, 1,
0.3248653, 1.155531, 0.09713735, 0, 0.2745098, 1, 1,
0.3289607, 0.4942007, -0.5701069, 0, 0.2666667, 1, 1,
0.3301674, -0.1618942, 3.664456, 0, 0.2627451, 1, 1,
0.3329685, -0.9637113, 3.020287, 0, 0.254902, 1, 1,
0.335384, 0.4574862, -1.163085, 0, 0.2509804, 1, 1,
0.3380264, 0.9865673, -0.1648217, 0, 0.2431373, 1, 1,
0.3387243, 1.017788, 2.060181, 0, 0.2392157, 1, 1,
0.3392351, 0.663164, -1.412998, 0, 0.2313726, 1, 1,
0.3394982, 2.584116, 0.1856324, 0, 0.227451, 1, 1,
0.3402904, -1.352483, 2.301796, 0, 0.2196078, 1, 1,
0.3445372, 0.6658163, 0.9085704, 0, 0.2156863, 1, 1,
0.3457504, -0.3664372, 3.426675, 0, 0.2078431, 1, 1,
0.346976, -0.8516119, 2.761043, 0, 0.2039216, 1, 1,
0.3525946, -0.3921024, 2.61449, 0, 0.1960784, 1, 1,
0.3603524, 0.5904175, 0.5202963, 0, 0.1882353, 1, 1,
0.3657416, -0.1091493, 3.138609, 0, 0.1843137, 1, 1,
0.3736109, 0.4526818, 0.6175792, 0, 0.1764706, 1, 1,
0.3771329, -0.5177035, 2.911243, 0, 0.172549, 1, 1,
0.3780216, -1.148892, 2.570003, 0, 0.1647059, 1, 1,
0.3801545, 0.05708319, 1.204417, 0, 0.1607843, 1, 1,
0.3814646, -2.10007, 0.4599235, 0, 0.1529412, 1, 1,
0.3827427, -0.7711284, 2.433407, 0, 0.1490196, 1, 1,
0.3890405, -1.571481, 3.11609, 0, 0.1411765, 1, 1,
0.390978, 0.4717623, 0.2460482, 0, 0.1372549, 1, 1,
0.392469, -0.3805485, 0.7922949, 0, 0.1294118, 1, 1,
0.3942576, -1.772728, 2.50844, 0, 0.1254902, 1, 1,
0.3944858, 0.6681761, -0.5499378, 0, 0.1176471, 1, 1,
0.4016249, -0.1289778, 3.417239, 0, 0.1137255, 1, 1,
0.4018486, -0.1901974, 0.8731581, 0, 0.1058824, 1, 1,
0.4051878, 1.19945, 0.8077126, 0, 0.09803922, 1, 1,
0.4120892, -0.934355, 3.219579, 0, 0.09411765, 1, 1,
0.420816, -0.4205972, 0.9665851, 0, 0.08627451, 1, 1,
0.4222232, -0.4413785, 0.994439, 0, 0.08235294, 1, 1,
0.4229674, 0.3130309, 1.049211, 0, 0.07450981, 1, 1,
0.4242084, -0.7392865, 1.903337, 0, 0.07058824, 1, 1,
0.4247822, 0.9531534, 0.3662432, 0, 0.0627451, 1, 1,
0.4273743, 0.7119647, -1.059238, 0, 0.05882353, 1, 1,
0.4300505, 0.7435927, 0.5594795, 0, 0.05098039, 1, 1,
0.4332985, 0.5118958, 1.185832, 0, 0.04705882, 1, 1,
0.433511, -0.5303088, 1.727866, 0, 0.03921569, 1, 1,
0.4364445, 2.509773, 0.1957016, 0, 0.03529412, 1, 1,
0.4377392, 0.8452526, 0.8106898, 0, 0.02745098, 1, 1,
0.4593159, -1.056548, 4.180918, 0, 0.02352941, 1, 1,
0.4650125, -0.7745834, 3.00055, 0, 0.01568628, 1, 1,
0.4665616, -0.1612414, 3.333138, 0, 0.01176471, 1, 1,
0.4689266, -0.501758, 3.358206, 0, 0.003921569, 1, 1,
0.4699852, -0.02997764, 0.1503724, 0.003921569, 0, 1, 1,
0.473223, -0.7903128, 3.249684, 0.007843138, 0, 1, 1,
0.4772919, 0.984131, -0.1692994, 0.01568628, 0, 1, 1,
0.4821533, 0.7282453, 2.649324, 0.01960784, 0, 1, 1,
0.4841809, 0.1240392, 0.2196758, 0.02745098, 0, 1, 1,
0.4874434, 0.6227206, 1.26982, 0.03137255, 0, 1, 1,
0.4874606, -0.09181987, 1.288157, 0.03921569, 0, 1, 1,
0.4909284, 1.87174, -1.708671, 0.04313726, 0, 1, 1,
0.492211, -0.9715974, 3.041801, 0.05098039, 0, 1, 1,
0.4956223, 0.2711432, -0.5303316, 0.05490196, 0, 1, 1,
0.5034125, 0.7323639, 0.6312081, 0.0627451, 0, 1, 1,
0.5045357, 0.04139917, 0.1345393, 0.06666667, 0, 1, 1,
0.5051216, 0.286617, -0.3115644, 0.07450981, 0, 1, 1,
0.5061879, -0.08812889, 1.124047, 0.07843138, 0, 1, 1,
0.5063995, -1.979715, 2.689539, 0.08627451, 0, 1, 1,
0.5065974, -0.1672718, 1.999381, 0.09019608, 0, 1, 1,
0.5071725, 0.5369481, 1.389247, 0.09803922, 0, 1, 1,
0.5078345, 0.576438, -1.196852, 0.1058824, 0, 1, 1,
0.5131599, -0.4095013, 3.005426, 0.1098039, 0, 1, 1,
0.5149429, 1.305243, 0.1803737, 0.1176471, 0, 1, 1,
0.5153943, 1.220578, 1.593498, 0.1215686, 0, 1, 1,
0.5175885, -0.1247499, 0.4693221, 0.1294118, 0, 1, 1,
0.5213441, 1.706198, 0.7215458, 0.1333333, 0, 1, 1,
0.5350078, 0.0988453, 1.516618, 0.1411765, 0, 1, 1,
0.5365251, 1.109635, 0.7920376, 0.145098, 0, 1, 1,
0.5423182, -0.7580751, 1.366603, 0.1529412, 0, 1, 1,
0.5448947, -0.5776573, 3.45137, 0.1568628, 0, 1, 1,
0.5478292, 1.682896, -0.6886711, 0.1647059, 0, 1, 1,
0.5527433, 0.4658173, 1.229493, 0.1686275, 0, 1, 1,
0.5538151, -0.7646239, 1.587717, 0.1764706, 0, 1, 1,
0.5568382, 0.9750714, -0.06257135, 0.1803922, 0, 1, 1,
0.5570623, 1.71013, -0.4312226, 0.1882353, 0, 1, 1,
0.5572207, -0.005001845, 1.60081, 0.1921569, 0, 1, 1,
0.5575391, -0.6149791, 2.692094, 0.2, 0, 1, 1,
0.5628055, 0.1475644, 1.840444, 0.2078431, 0, 1, 1,
0.5632099, 1.171925, -0.3310801, 0.2117647, 0, 1, 1,
0.5662486, -0.08627979, 2.070943, 0.2196078, 0, 1, 1,
0.5669053, 1.510291, 0.3233003, 0.2235294, 0, 1, 1,
0.5669534, -0.5093457, 1.272277, 0.2313726, 0, 1, 1,
0.5681409, -0.4308363, 2.060479, 0.2352941, 0, 1, 1,
0.5690698, -0.0166798, 2.735891, 0.2431373, 0, 1, 1,
0.5703405, -0.4536015, 1.819511, 0.2470588, 0, 1, 1,
0.572144, 0.7665879, 0.06861813, 0.254902, 0, 1, 1,
0.5811765, -0.4968857, 2.265524, 0.2588235, 0, 1, 1,
0.5818257, -0.9850895, 3.670513, 0.2666667, 0, 1, 1,
0.5858619, 0.6021255, 0.08687568, 0.2705882, 0, 1, 1,
0.5873398, -0.3659151, 2.959863, 0.2784314, 0, 1, 1,
0.5884219, 1.473553, 0.04570998, 0.282353, 0, 1, 1,
0.5978821, -0.2793508, 1.923743, 0.2901961, 0, 1, 1,
0.6002188, 0.9859748, -0.3162678, 0.2941177, 0, 1, 1,
0.6015547, -1.517125, 0.8098375, 0.3019608, 0, 1, 1,
0.6025496, -1.180367, 0.9769334, 0.3098039, 0, 1, 1,
0.6037993, 0.4259228, 2.200353, 0.3137255, 0, 1, 1,
0.6078104, 1.142316, 0.9426783, 0.3215686, 0, 1, 1,
0.6110111, -1.397599, 1.528619, 0.3254902, 0, 1, 1,
0.6139754, 1.081798, 1.652208, 0.3333333, 0, 1, 1,
0.6187445, 0.02160315, 1.649759, 0.3372549, 0, 1, 1,
0.6213728, 0.6939127, 1.103438, 0.345098, 0, 1, 1,
0.6225221, 0.5304457, 0.05651341, 0.3490196, 0, 1, 1,
0.6234096, 1.175293, 0.008753977, 0.3568628, 0, 1, 1,
0.6303746, -0.8435353, 2.124011, 0.3607843, 0, 1, 1,
0.6350831, -1.489875, 2.4857, 0.3686275, 0, 1, 1,
0.6389346, -0.1744687, 3.700817, 0.372549, 0, 1, 1,
0.6442897, 0.2132988, -1.166738, 0.3803922, 0, 1, 1,
0.6463224, 2.182334, -1.101801, 0.3843137, 0, 1, 1,
0.6521966, 0.918186, 1.253071, 0.3921569, 0, 1, 1,
0.654949, -0.1542014, 1.489256, 0.3960784, 0, 1, 1,
0.6557037, 1.704683, -0.6786474, 0.4039216, 0, 1, 1,
0.6586799, 1.842884, 0.9574191, 0.4117647, 0, 1, 1,
0.6601105, -0.4702945, 2.467908, 0.4156863, 0, 1, 1,
0.6635008, -1.298491, 2.953634, 0.4235294, 0, 1, 1,
0.6639109, 0.8052232, 0.5142084, 0.427451, 0, 1, 1,
0.6672938, 0.8342905, 1.583468, 0.4352941, 0, 1, 1,
0.6703716, -0.5849305, 3.168111, 0.4392157, 0, 1, 1,
0.6722137, 0.2707564, -0.1165854, 0.4470588, 0, 1, 1,
0.67335, -0.194615, 1.127008, 0.4509804, 0, 1, 1,
0.6802845, 1.053566, 1.621893, 0.4588235, 0, 1, 1,
0.6884714, -0.6129575, 4.656938, 0.4627451, 0, 1, 1,
0.6885902, 0.6045899, -0.2344744, 0.4705882, 0, 1, 1,
0.6892422, 0.1889275, -0.04319434, 0.4745098, 0, 1, 1,
0.6908062, 0.9484255, -0.3952875, 0.4823529, 0, 1, 1,
0.6924997, 0.5756656, 0.4355499, 0.4862745, 0, 1, 1,
0.6929783, -0.4052442, 3.037323, 0.4941176, 0, 1, 1,
0.6974391, -0.4383098, 2.068861, 0.5019608, 0, 1, 1,
0.699232, 0.07621906, 2.272877, 0.5058824, 0, 1, 1,
0.7029337, 0.9941258, -0.1537737, 0.5137255, 0, 1, 1,
0.7045541, 1.696605, -0.9915845, 0.5176471, 0, 1, 1,
0.7151392, 2.229937, 0.03025279, 0.5254902, 0, 1, 1,
0.7154146, 0.7332838, -0.4889154, 0.5294118, 0, 1, 1,
0.7226282, -0.7801521, 3.023216, 0.5372549, 0, 1, 1,
0.724413, 1.215107, -1.316725, 0.5411765, 0, 1, 1,
0.7251106, -0.190831, 2.869252, 0.5490196, 0, 1, 1,
0.7258918, -1.795985, 3.635121, 0.5529412, 0, 1, 1,
0.7284757, -1.24131, 3.926303, 0.5607843, 0, 1, 1,
0.7290025, 1.250726, 0.0143058, 0.5647059, 0, 1, 1,
0.7336211, -0.02379264, 1.165314, 0.572549, 0, 1, 1,
0.7418793, 1.139835, -0.3264809, 0.5764706, 0, 1, 1,
0.7428538, 1.212938, -1.558412, 0.5843138, 0, 1, 1,
0.7466792, -0.09650489, 2.69054, 0.5882353, 0, 1, 1,
0.7467349, 0.556865, 0.9780645, 0.5960785, 0, 1, 1,
0.7523503, 0.2263813, 2.012202, 0.6039216, 0, 1, 1,
0.7565269, -0.1202527, 2.397727, 0.6078432, 0, 1, 1,
0.7686135, 0.2372143, -0.1264451, 0.6156863, 0, 1, 1,
0.7774999, 1.175975, 0.04135204, 0.6196079, 0, 1, 1,
0.781226, 0.9315653, -1.65708, 0.627451, 0, 1, 1,
0.782276, 0.6169991, 0.4806848, 0.6313726, 0, 1, 1,
0.783941, -0.01046324, 1.149378, 0.6392157, 0, 1, 1,
0.7883928, -0.5686592, 2.660796, 0.6431373, 0, 1, 1,
0.7951176, 0.7126521, 2.057851, 0.6509804, 0, 1, 1,
0.7984889, -1.152243, 1.677969, 0.654902, 0, 1, 1,
0.8005061, -0.8494968, 1.793217, 0.6627451, 0, 1, 1,
0.8020576, 0.138053, 0.8929589, 0.6666667, 0, 1, 1,
0.8068615, 0.6537453, 1.853959, 0.6745098, 0, 1, 1,
0.8082261, 0.2919196, 1.614233, 0.6784314, 0, 1, 1,
0.8177807, 0.1977182, 2.751314, 0.6862745, 0, 1, 1,
0.8185766, 0.8925413, 0.3297746, 0.6901961, 0, 1, 1,
0.822996, 1.789555, 0.4494168, 0.6980392, 0, 1, 1,
0.8242092, -2.720628, 2.750844, 0.7058824, 0, 1, 1,
0.8242515, 0.5659081, 1.563782, 0.7098039, 0, 1, 1,
0.8263174, -0.8896073, 1.290513, 0.7176471, 0, 1, 1,
0.8330206, 1.192643, 0.9906803, 0.7215686, 0, 1, 1,
0.8352983, -0.8828038, 2.367375, 0.7294118, 0, 1, 1,
0.8391272, -1.112053, 3.652687, 0.7333333, 0, 1, 1,
0.8456101, 0.9059743, 0.4883092, 0.7411765, 0, 1, 1,
0.8467754, -0.7035745, 3.301376, 0.7450981, 0, 1, 1,
0.8508818, -1.265765, 4.711032, 0.7529412, 0, 1, 1,
0.8520979, 0.8570691, 0.5670564, 0.7568628, 0, 1, 1,
0.856247, 0.04657092, 1.100193, 0.7647059, 0, 1, 1,
0.8574326, -1.872132, 3.394965, 0.7686275, 0, 1, 1,
0.8577116, 0.2917675, 1.610108, 0.7764706, 0, 1, 1,
0.8597286, 0.5083188, 0.5875523, 0.7803922, 0, 1, 1,
0.8628293, -0.6223106, 3.040432, 0.7882353, 0, 1, 1,
0.8636119, -1.375759, 1.770317, 0.7921569, 0, 1, 1,
0.8667394, 0.5810698, 0.7326469, 0.8, 0, 1, 1,
0.8668997, 0.06783302, 0.7528092, 0.8078431, 0, 1, 1,
0.8674684, -0.5750655, 2.702291, 0.8117647, 0, 1, 1,
0.8692248, 0.6480716, -0.273108, 0.8196079, 0, 1, 1,
0.8699961, -1.010582, 5.18715, 0.8235294, 0, 1, 1,
0.8790276, -1.107295, 2.459746, 0.8313726, 0, 1, 1,
0.8916258, -0.5810514, 1.771511, 0.8352941, 0, 1, 1,
0.8919737, -0.7274711, 3.964182, 0.8431373, 0, 1, 1,
0.8949704, 0.8116549, 0.6881977, 0.8470588, 0, 1, 1,
0.8991789, -0.08816744, 2.883827, 0.854902, 0, 1, 1,
0.8994691, -0.9036314, 2.322654, 0.8588235, 0, 1, 1,
0.9002593, -0.3962149, 3.185911, 0.8666667, 0, 1, 1,
0.9013399, 0.6152318, 1.867005, 0.8705882, 0, 1, 1,
0.9039437, -0.3499692, 0.3274719, 0.8784314, 0, 1, 1,
0.9051886, -0.9894499, 2.021142, 0.8823529, 0, 1, 1,
0.9144514, -1.100459, 1.85761, 0.8901961, 0, 1, 1,
0.9253094, -0.2759964, 0.633634, 0.8941177, 0, 1, 1,
0.9255799, 0.4857495, 2.108202, 0.9019608, 0, 1, 1,
0.9298822, -0.5909187, 3.27865, 0.9098039, 0, 1, 1,
0.932537, 0.5944816, 2.71746, 0.9137255, 0, 1, 1,
0.9372402, -1.808786, 1.139213, 0.9215686, 0, 1, 1,
0.9413367, 1.666167, 0.9972882, 0.9254902, 0, 1, 1,
0.9434881, -0.5964812, 2.306159, 0.9333333, 0, 1, 1,
0.9435133, -1.623131, 1.546608, 0.9372549, 0, 1, 1,
0.9476557, 0.3992089, 1.859948, 0.945098, 0, 1, 1,
0.9483465, -0.7777088, 4.201958, 0.9490196, 0, 1, 1,
0.9574758, -0.1295386, 0.8470825, 0.9568627, 0, 1, 1,
0.9593671, -0.1461309, 1.920045, 0.9607843, 0, 1, 1,
0.9627512, -0.9761219, 0.6884705, 0.9686275, 0, 1, 1,
0.9639851, -0.9758329, 2.952538, 0.972549, 0, 1, 1,
0.9668847, 0.8095054, 1.881954, 0.9803922, 0, 1, 1,
0.9806018, -0.4975335, 1.142387, 0.9843137, 0, 1, 1,
0.9827852, 1.083737, 0.3856569, 0.9921569, 0, 1, 1,
0.9828461, -0.07187288, 1.276222, 0.9960784, 0, 1, 1,
0.9911137, -0.4806675, 2.681567, 1, 0, 0.9960784, 1,
0.9922124, 0.3802638, 0.5539215, 1, 0, 0.9882353, 1,
0.9922357, -0.4308666, 2.240338, 1, 0, 0.9843137, 1,
0.994446, 0.2063891, 1.277722, 1, 0, 0.9764706, 1,
1.011004, -0.6717295, 2.448387, 1, 0, 0.972549, 1,
1.013173, 0.1370063, 1.597902, 1, 0, 0.9647059, 1,
1.013516, -0.4500178, 2.813616, 1, 0, 0.9607843, 1,
1.018488, -0.4010258, 1.425954, 1, 0, 0.9529412, 1,
1.023549, -0.3806853, 1.516469, 1, 0, 0.9490196, 1,
1.032866, -0.2580054, 2.428319, 1, 0, 0.9411765, 1,
1.032934, -0.8225636, 2.65447, 1, 0, 0.9372549, 1,
1.034294, -0.3409047, 2.634693, 1, 0, 0.9294118, 1,
1.042102, 1.340424, -0.0530366, 1, 0, 0.9254902, 1,
1.042116, 0.6726002, 1.196583, 1, 0, 0.9176471, 1,
1.045022, -0.82028, 3.110348, 1, 0, 0.9137255, 1,
1.045343, 2.108389, 0.9915412, 1, 0, 0.9058824, 1,
1.051746, 0.7597627, -0.948733, 1, 0, 0.9019608, 1,
1.061631, 0.3497602, 0.4380557, 1, 0, 0.8941177, 1,
1.067469, -1.911469, 2.913103, 1, 0, 0.8862745, 1,
1.067512, 1.253969, -0.5311179, 1, 0, 0.8823529, 1,
1.071965, 1.037411, 0.2966222, 1, 0, 0.8745098, 1,
1.073841, 0.6908786, 1.109311, 1, 0, 0.8705882, 1,
1.074346, 1.533857, 1.840113, 1, 0, 0.8627451, 1,
1.0803, 0.05405869, 1.423946, 1, 0, 0.8588235, 1,
1.080578, -0.2511254, 0.3741231, 1, 0, 0.8509804, 1,
1.084005, -1.76692, 2.982079, 1, 0, 0.8470588, 1,
1.086396, 0.3161402, 0.8385945, 1, 0, 0.8392157, 1,
1.087975, 0.3549789, 2.917163, 1, 0, 0.8352941, 1,
1.089406, -0.4357425, 1.782587, 1, 0, 0.827451, 1,
1.090808, -0.04759144, 2.266128, 1, 0, 0.8235294, 1,
1.092538, -1.349098, 2.770441, 1, 0, 0.8156863, 1,
1.097696, -0.4523201, 2.516323, 1, 0, 0.8117647, 1,
1.098286, -0.6559525, 2.837458, 1, 0, 0.8039216, 1,
1.112967, -0.4460576, 2.381623, 1, 0, 0.7960784, 1,
1.120738, -0.3518111, 3.096891, 1, 0, 0.7921569, 1,
1.121879, 0.4901727, -0.4128163, 1, 0, 0.7843137, 1,
1.123749, 0.1649076, 1.468895, 1, 0, 0.7803922, 1,
1.131969, 0.6627003, 1.298562, 1, 0, 0.772549, 1,
1.133633, -0.2726759, 0.6718734, 1, 0, 0.7686275, 1,
1.135181, 0.9335391, 1.893206, 1, 0, 0.7607843, 1,
1.140415, -0.8471, 3.10711, 1, 0, 0.7568628, 1,
1.164273, -0.3314197, 3.702483, 1, 0, 0.7490196, 1,
1.169003, -0.3220855, 2.210914, 1, 0, 0.7450981, 1,
1.169438, -0.4052951, 1.891719, 1, 0, 0.7372549, 1,
1.17098, 2.247204, 0.3626954, 1, 0, 0.7333333, 1,
1.175508, 1.470658, 1.751452, 1, 0, 0.7254902, 1,
1.184436, 1.108982, 0.8650807, 1, 0, 0.7215686, 1,
1.192373, -0.9997644, 1.049523, 1, 0, 0.7137255, 1,
1.199565, 0.03717739, 0.03526447, 1, 0, 0.7098039, 1,
1.202, 0.2910634, 1.154984, 1, 0, 0.7019608, 1,
1.206209, 0.972715, 1.613623, 1, 0, 0.6941177, 1,
1.220098, -0.6092919, 2.745257, 1, 0, 0.6901961, 1,
1.220502, -1.783637, 3.136422, 1, 0, 0.682353, 1,
1.229247, -0.03538292, 1.826204, 1, 0, 0.6784314, 1,
1.236359, 0.06503677, 1.633201, 1, 0, 0.6705883, 1,
1.240753, 0.5565055, 2.400995, 1, 0, 0.6666667, 1,
1.248042, 0.19073, 0.4062554, 1, 0, 0.6588235, 1,
1.265313, -0.6045108, 1.636279, 1, 0, 0.654902, 1,
1.267516, 2.667989, 0.165903, 1, 0, 0.6470588, 1,
1.267811, -1.357201, 0.4946809, 1, 0, 0.6431373, 1,
1.269552, -0.1292034, 1.506962, 1, 0, 0.6352941, 1,
1.273416, -0.573006, 0.2630308, 1, 0, 0.6313726, 1,
1.274127, -0.5653203, 2.58858, 1, 0, 0.6235294, 1,
1.277612, -0.2953716, 1.78141, 1, 0, 0.6196079, 1,
1.279904, -0.7177303, 3.002309, 1, 0, 0.6117647, 1,
1.289642, 0.877912, 0.4780415, 1, 0, 0.6078432, 1,
1.295, -0.6082398, 1.870107, 1, 0, 0.6, 1,
1.29793, 0.9207147, 0.5584468, 1, 0, 0.5921569, 1,
1.306382, 0.1717792, 1.952286, 1, 0, 0.5882353, 1,
1.307099, 0.6457445, 0.3468525, 1, 0, 0.5803922, 1,
1.312751, 0.6272349, 3.501621, 1, 0, 0.5764706, 1,
1.316881, -0.5788469, 2.99821, 1, 0, 0.5686275, 1,
1.317887, 1.165435, -0.8880974, 1, 0, 0.5647059, 1,
1.326283, -0.4551765, 1.507163, 1, 0, 0.5568628, 1,
1.327524, 0.04470971, 1.129026, 1, 0, 0.5529412, 1,
1.332755, 0.1116483, 1.44061, 1, 0, 0.5450981, 1,
1.334657, -1.040399, 2.363797, 1, 0, 0.5411765, 1,
1.336522, 0.06356768, 2.260658, 1, 0, 0.5333334, 1,
1.342049, 0.1697919, 0.2672835, 1, 0, 0.5294118, 1,
1.342308, -1.348381, 2.761456, 1, 0, 0.5215687, 1,
1.342842, -0.9600331, 1.696792, 1, 0, 0.5176471, 1,
1.343311, -1.315147, 1.54066, 1, 0, 0.509804, 1,
1.347793, 0.6751435, 1.680088, 1, 0, 0.5058824, 1,
1.34953, -1.246718, 1.193452, 1, 0, 0.4980392, 1,
1.359014, -0.4900727, 0.262786, 1, 0, 0.4901961, 1,
1.362476, -0.7777694, 2.486081, 1, 0, 0.4862745, 1,
1.365564, 0.07725876, 0.005160068, 1, 0, 0.4784314, 1,
1.371923, -1.144713, 1.97111, 1, 0, 0.4745098, 1,
1.383893, -0.1906279, 2.095333, 1, 0, 0.4666667, 1,
1.385855, -1.10065, 0.591389, 1, 0, 0.4627451, 1,
1.387221, -0.4802819, 1.293002, 1, 0, 0.454902, 1,
1.387964, -0.04476794, 0.7224548, 1, 0, 0.4509804, 1,
1.393334, -1.086268, 1.306847, 1, 0, 0.4431373, 1,
1.394301, -0.6549375, 0.9225615, 1, 0, 0.4392157, 1,
1.400182, 1.673573, -0.4991865, 1, 0, 0.4313726, 1,
1.412255, -0.8782789, 2.965113, 1, 0, 0.427451, 1,
1.433283, -1.31614, 1.571576, 1, 0, 0.4196078, 1,
1.433981, -1.076603, 1.546921, 1, 0, 0.4156863, 1,
1.440566, 0.9153674, 2.185452, 1, 0, 0.4078431, 1,
1.448177, 1.077361, 0.1519825, 1, 0, 0.4039216, 1,
1.450294, -0.06426637, 2.242877, 1, 0, 0.3960784, 1,
1.462623, -1.579878, 3.611125, 1, 0, 0.3882353, 1,
1.467413, -0.2451878, 0.1058258, 1, 0, 0.3843137, 1,
1.468367, 2.466039, -1.713015, 1, 0, 0.3764706, 1,
1.484705, -0.0871648, 1.85743, 1, 0, 0.372549, 1,
1.50327, -1.33902, 1.531854, 1, 0, 0.3647059, 1,
1.512389, 0.3378378, 2.359249, 1, 0, 0.3607843, 1,
1.515051, 1.048514, 0.3549257, 1, 0, 0.3529412, 1,
1.520725, -0.6646817, 1.547533, 1, 0, 0.3490196, 1,
1.523878, 2.453466, -1.140476, 1, 0, 0.3411765, 1,
1.52791, 0.03503339, 2.310908, 1, 0, 0.3372549, 1,
1.54021, -0.09619886, 0.794758, 1, 0, 0.3294118, 1,
1.550708, 0.07119199, 0.9218664, 1, 0, 0.3254902, 1,
1.564204, 0.8074861, -0.2726732, 1, 0, 0.3176471, 1,
1.565255, -0.4596396, 1.459722, 1, 0, 0.3137255, 1,
1.568055, 0.6969954, 2.399895, 1, 0, 0.3058824, 1,
1.594691, -0.08530686, -0.1557658, 1, 0, 0.2980392, 1,
1.599334, -0.3045303, 1.514475, 1, 0, 0.2941177, 1,
1.619709, -0.316727, 1.106782, 1, 0, 0.2862745, 1,
1.62932, 0.3233428, 1.567354, 1, 0, 0.282353, 1,
1.63711, 1.387146, 3.98011, 1, 0, 0.2745098, 1,
1.646827, 0.2635015, -0.0301739, 1, 0, 0.2705882, 1,
1.667041, -0.9568187, 0.2329455, 1, 0, 0.2627451, 1,
1.672332, 0.7375577, 1.69318, 1, 0, 0.2588235, 1,
1.676515, 0.7592883, 1.49245, 1, 0, 0.2509804, 1,
1.680659, 0.08999261, 0.3737068, 1, 0, 0.2470588, 1,
1.683117, 0.1559807, 1.08639, 1, 0, 0.2392157, 1,
1.688862, -0.392337, 1.161701, 1, 0, 0.2352941, 1,
1.707358, -0.1116874, 1.819769, 1, 0, 0.227451, 1,
1.713701, 0.7671328, 1.059175, 1, 0, 0.2235294, 1,
1.7271, -0.4716684, 2.226195, 1, 0, 0.2156863, 1,
1.738952, 0.888396, 2.623434, 1, 0, 0.2117647, 1,
1.740502, -2.181557, 1.286214, 1, 0, 0.2039216, 1,
1.751655, 0.4537497, 2.219899, 1, 0, 0.1960784, 1,
1.757843, 0.3758233, 1.090719, 1, 0, 0.1921569, 1,
1.759279, 1.273628, 1.380924, 1, 0, 0.1843137, 1,
1.769618, 0.1156325, 2.152893, 1, 0, 0.1803922, 1,
1.78744, -0.443223, 0.6655165, 1, 0, 0.172549, 1,
1.812639, -0.5502734, 2.116668, 1, 0, 0.1686275, 1,
1.815115, -0.4062292, 2.097418, 1, 0, 0.1607843, 1,
1.821359, -0.461056, 2.047991, 1, 0, 0.1568628, 1,
1.828959, 0.5966601, 0.5031505, 1, 0, 0.1490196, 1,
1.833122, 0.1550127, 2.683861, 1, 0, 0.145098, 1,
1.85328, 0.8189548, -0.1834096, 1, 0, 0.1372549, 1,
1.874955, 0.2804719, 0.951986, 1, 0, 0.1333333, 1,
1.935434, 0.6791868, 2.65479, 1, 0, 0.1254902, 1,
1.948244, -0.4194623, 0.3505326, 1, 0, 0.1215686, 1,
1.951301, 0.07218897, 3.278875, 1, 0, 0.1137255, 1,
1.979774, 0.376295, 1.427937, 1, 0, 0.1098039, 1,
2.068613, -1.495672, 4.448263, 1, 0, 0.1019608, 1,
2.114312, -0.4151573, 1.906074, 1, 0, 0.09411765, 1,
2.13234, -0.9036733, 1.058551, 1, 0, 0.09019608, 1,
2.138209, -0.2393939, 1.022812, 1, 0, 0.08235294, 1,
2.143833, -0.004636317, 2.81767, 1, 0, 0.07843138, 1,
2.202998, 1.956854, 2.22678, 1, 0, 0.07058824, 1,
2.20676, -0.5104574, 3.93526, 1, 0, 0.06666667, 1,
2.240954, 0.3753463, 2.344436, 1, 0, 0.05882353, 1,
2.242913, 0.5161353, 3.566735, 1, 0, 0.05490196, 1,
2.268903, 0.5098313, 3.169853, 1, 0, 0.04705882, 1,
2.433086, 0.5099223, 1.269925, 1, 0, 0.04313726, 1,
2.492241, 2.363869, 0.5068706, 1, 0, 0.03529412, 1,
2.515863, 1.229817, 1.884172, 1, 0, 0.03137255, 1,
2.523279, -0.6471102, 0.5514145, 1, 0, 0.02352941, 1,
2.587989, 0.9288854, 1.326978, 1, 0, 0.01960784, 1,
2.621363, -0.3314284, 1.937732, 1, 0, 0.01176471, 1,
2.874289, -0.09812561, 0.6090332, 1, 0, 0.007843138, 1
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
-0.2863731, -4.151071, -7.068627, 0, -0.5, 0.5, 0.5,
-0.2863731, -4.151071, -7.068627, 1, -0.5, 0.5, 0.5,
-0.2863731, -4.151071, -7.068627, 1, 1.5, 0.5, 0.5,
-0.2863731, -4.151071, -7.068627, 0, 1.5, 0.5, 0.5
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
-4.518499, 0.05467916, -7.068627, 0, -0.5, 0.5, 0.5,
-4.518499, 0.05467916, -7.068627, 1, -0.5, 0.5, 0.5,
-4.518499, 0.05467916, -7.068627, 1, 1.5, 0.5, 0.5,
-4.518499, 0.05467916, -7.068627, 0, 1.5, 0.5, 0.5
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
-4.518499, -4.151071, 0.1350155, 0, -0.5, 0.5, 0.5,
-4.518499, -4.151071, 0.1350155, 1, -0.5, 0.5, 0.5,
-4.518499, -4.151071, 0.1350155, 1, 1.5, 0.5, 0.5,
-4.518499, -4.151071, 0.1350155, 0, 1.5, 0.5, 0.5
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
-3, -3.180513, -5.406248,
2, -3.180513, -5.406248,
-3, -3.180513, -5.406248,
-3, -3.342273, -5.683311,
-2, -3.180513, -5.406248,
-2, -3.342273, -5.683311,
-1, -3.180513, -5.406248,
-1, -3.342273, -5.683311,
0, -3.180513, -5.406248,
0, -3.342273, -5.683311,
1, -3.180513, -5.406248,
1, -3.342273, -5.683311,
2, -3.180513, -5.406248,
2, -3.342273, -5.683311
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
-3, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
-3, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
-3, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
-3, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5,
-2, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
-2, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
-2, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
-2, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5,
-1, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
-1, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
-1, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
-1, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5,
0, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
0, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
0, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
0, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5,
1, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
1, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
1, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
1, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5,
2, -3.665792, -6.237438, 0, -0.5, 0.5, 0.5,
2, -3.665792, -6.237438, 1, -0.5, 0.5, 0.5,
2, -3.665792, -6.237438, 1, 1.5, 0.5, 0.5,
2, -3.665792, -6.237438, 0, 1.5, 0.5, 0.5
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
-3.541855, -3, -5.406248,
-3.541855, 3, -5.406248,
-3.541855, -3, -5.406248,
-3.704629, -3, -5.683311,
-3.541855, -2, -5.406248,
-3.704629, -2, -5.683311,
-3.541855, -1, -5.406248,
-3.704629, -1, -5.683311,
-3.541855, 0, -5.406248,
-3.704629, 0, -5.683311,
-3.541855, 1, -5.406248,
-3.704629, 1, -5.683311,
-3.541855, 2, -5.406248,
-3.704629, 2, -5.683311,
-3.541855, 3, -5.406248,
-3.704629, 3, -5.683311
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
-4.030177, -3, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, -3, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, -3, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, -3, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, -2, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, -2, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, -2, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, -2, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, -1, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, -1, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, -1, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, -1, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, 0, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, 0, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, 0, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, 0, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, 1, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, 1, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, 1, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, 1, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, 2, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, 2, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, 2, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, 2, -6.237438, 0, 1.5, 0.5, 0.5,
-4.030177, 3, -6.237438, 0, -0.5, 0.5, 0.5,
-4.030177, 3, -6.237438, 1, -0.5, 0.5, 0.5,
-4.030177, 3, -6.237438, 1, 1.5, 0.5, 0.5,
-4.030177, 3, -6.237438, 0, 1.5, 0.5, 0.5
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
-3.541855, -3.180513, -4,
-3.541855, -3.180513, 4,
-3.541855, -3.180513, -4,
-3.704629, -3.342273, -4,
-3.541855, -3.180513, -2,
-3.704629, -3.342273, -2,
-3.541855, -3.180513, 0,
-3.704629, -3.342273, 0,
-3.541855, -3.180513, 2,
-3.704629, -3.342273, 2,
-3.541855, -3.180513, 4,
-3.704629, -3.342273, 4
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
-4.030177, -3.665792, -4, 0, -0.5, 0.5, 0.5,
-4.030177, -3.665792, -4, 1, -0.5, 0.5, 0.5,
-4.030177, -3.665792, -4, 1, 1.5, 0.5, 0.5,
-4.030177, -3.665792, -4, 0, 1.5, 0.5, 0.5,
-4.030177, -3.665792, -2, 0, -0.5, 0.5, 0.5,
-4.030177, -3.665792, -2, 1, -0.5, 0.5, 0.5,
-4.030177, -3.665792, -2, 1, 1.5, 0.5, 0.5,
-4.030177, -3.665792, -2, 0, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 0, 0, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 0, 1, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 0, 1, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 0, 0, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 2, 0, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 2, 1, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 2, 1, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 2, 0, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 4, 0, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 4, 1, -0.5, 0.5, 0.5,
-4.030177, -3.665792, 4, 1, 1.5, 0.5, 0.5,
-4.030177, -3.665792, 4, 0, 1.5, 0.5, 0.5
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
-3.541855, -3.180513, -5.406248,
-3.541855, 3.289872, -5.406248,
-3.541855, -3.180513, 5.676279,
-3.541855, 3.289872, 5.676279,
-3.541855, -3.180513, -5.406248,
-3.541855, -3.180513, 5.676279,
-3.541855, 3.289872, -5.406248,
-3.541855, 3.289872, 5.676279,
-3.541855, -3.180513, -5.406248,
2.969108, -3.180513, -5.406248,
-3.541855, -3.180513, 5.676279,
2.969108, -3.180513, 5.676279,
-3.541855, 3.289872, -5.406248,
2.969108, 3.289872, -5.406248,
-3.541855, 3.289872, 5.676279,
2.969108, 3.289872, 5.676279,
2.969108, -3.180513, -5.406248,
2.969108, 3.289872, -5.406248,
2.969108, -3.180513, 5.676279,
2.969108, 3.289872, 5.676279,
2.969108, -3.180513, -5.406248,
2.969108, -3.180513, 5.676279,
2.969108, 3.289872, -5.406248,
2.969108, 3.289872, 5.676279
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
var radius = 7.684144;
var distance = 34.18763;
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
mvMatrix.translate( 0.2863731, -0.05467916, -0.1350155 );
mvMatrix.scale( 1.27604, 1.284042, 0.7496709 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.18763);
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
BAP<-read.table("BAP.xyz")
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
-3.447035, -0.004820158, 0.1727379, 0, 0, 1, 1, 1,
-2.817143, -0.8653405, -0.1926583, 1, 0, 0, 1, 1,
-2.799791, 0.1507473, -1.728016, 1, 0, 0, 1, 1,
-2.715593, 0.3705659, -1.48082, 1, 0, 0, 1, 1,
-2.665429, -0.4189532, -2.171247, 1, 0, 0, 1, 1,
-2.651619, -0.08674692, -2.878721, 1, 0, 0, 1, 1,
-2.533265, 0.1073114, -0.8530151, 0, 0, 0, 1, 1,
-2.50092, -0.3488646, -1.426097, 0, 0, 0, 1, 1,
-2.499866, -0.0141729, -0.7173006, 0, 0, 0, 1, 1,
-2.48565, -0.06901161, -2.140713, 0, 0, 0, 1, 1,
-2.403709, -0.09506164, -0.9766971, 0, 0, 0, 1, 1,
-2.394917, -0.1643904, -2.420365, 0, 0, 0, 1, 1,
-2.373699, -0.9643968, -3.041593, 0, 0, 0, 1, 1,
-2.368216, -0.4346197, -3.011212, 1, 1, 1, 1, 1,
-2.303892, 1.12149, -1.182533, 1, 1, 1, 1, 1,
-2.286333, 0.5434589, -1.785707, 1, 1, 1, 1, 1,
-2.218146, 1.204721, -0.6762142, 1, 1, 1, 1, 1,
-2.202351, 0.6827423, -0.8402544, 1, 1, 1, 1, 1,
-2.197653, 1.009667, -0.5653118, 1, 1, 1, 1, 1,
-2.168988, -0.8459305, -1.16278, 1, 1, 1, 1, 1,
-2.127187, 0.4502726, -0.287262, 1, 1, 1, 1, 1,
-2.124676, -0.8760728, -0.7257503, 1, 1, 1, 1, 1,
-2.072776, 2.591038, 0.3034934, 1, 1, 1, 1, 1,
-2.036758, 0.3205363, -1.204433, 1, 1, 1, 1, 1,
-2.022578, 0.03449883, -0.4777623, 1, 1, 1, 1, 1,
-2.014683, 0.2062609, -1.321669, 1, 1, 1, 1, 1,
-2.014498, 0.7183689, -0.2908078, 1, 1, 1, 1, 1,
-1.96169, 0.6858073, -0.7403399, 1, 1, 1, 1, 1,
-1.94715, 0.2090829, -3.134681, 0, 0, 1, 1, 1,
-1.881588, 1.865451, -1.700216, 1, 0, 0, 1, 1,
-1.862234, 0.03720861, -1.914778, 1, 0, 0, 1, 1,
-1.846642, 2.055185, -0.536265, 1, 0, 0, 1, 1,
-1.811839, 0.962415, -0.9559772, 1, 0, 0, 1, 1,
-1.795775, 0.3732365, -1.239932, 1, 0, 0, 1, 1,
-1.783233, -1.590073, -3.521989, 0, 0, 0, 1, 1,
-1.782003, 0.3752232, -1.956345, 0, 0, 0, 1, 1,
-1.761091, 0.6690909, -0.3776833, 0, 0, 0, 1, 1,
-1.756665, -0.3965319, -1.355268, 0, 0, 0, 1, 1,
-1.753436, -1.707067, -2.56121, 0, 0, 0, 1, 1,
-1.737068, -0.3049606, -0.6837106, 0, 0, 0, 1, 1,
-1.72948, -1.277157, -3.782026, 0, 0, 0, 1, 1,
-1.723334, -1.054562, -3.559832, 1, 1, 1, 1, 1,
-1.697328, -0.2325847, -2.287503, 1, 1, 1, 1, 1,
-1.675891, -0.4935513, -2.859953, 1, 1, 1, 1, 1,
-1.673378, 0.4306104, -2.099848, 1, 1, 1, 1, 1,
-1.613125, 0.590715, 0.3904146, 1, 1, 1, 1, 1,
-1.608961, -0.4108587, -2.259274, 1, 1, 1, 1, 1,
-1.605956, -1.420878, -0.7745326, 1, 1, 1, 1, 1,
-1.602367, 0.5484872, -2.477891, 1, 1, 1, 1, 1,
-1.596953, -0.5614846, -2.980093, 1, 1, 1, 1, 1,
-1.596164, -0.3579902, -2.148325, 1, 1, 1, 1, 1,
-1.586049, 0.3405703, -0.3888477, 1, 1, 1, 1, 1,
-1.576538, 0.5981914, -1.380522, 1, 1, 1, 1, 1,
-1.572861, 0.6922126, -0.5070258, 1, 1, 1, 1, 1,
-1.565898, -0.1723209, -0.9045675, 1, 1, 1, 1, 1,
-1.560837, -1.882377, -2.749399, 1, 1, 1, 1, 1,
-1.552451, -0.3811698, -1.400327, 0, 0, 1, 1, 1,
-1.530199, -2.162097, -2.249102, 1, 0, 0, 1, 1,
-1.524703, 0.6360707, 0.2148809, 1, 0, 0, 1, 1,
-1.518912, 0.04841328, -1.165781, 1, 0, 0, 1, 1,
-1.514381, 0.03020437, -1.333678, 1, 0, 0, 1, 1,
-1.486768, 1.028454, -2.625096, 1, 0, 0, 1, 1,
-1.486433, 0.8447691, -0.2901263, 0, 0, 0, 1, 1,
-1.481643, 1.363306, -1.682341, 0, 0, 0, 1, 1,
-1.47256, -0.3221852, -1.428758, 0, 0, 0, 1, 1,
-1.470868, -1.007654, -1.730293, 0, 0, 0, 1, 1,
-1.469666, 2.028007, 0.1133536, 0, 0, 0, 1, 1,
-1.467266, -0.4549331, -3.573692, 0, 0, 0, 1, 1,
-1.461509, 0.3233081, -1.829094, 0, 0, 0, 1, 1,
-1.447958, -0.5911213, -1.93486, 1, 1, 1, 1, 1,
-1.44055, 0.3573606, -1.143392, 1, 1, 1, 1, 1,
-1.435742, 0.7227759, -1.698973, 1, 1, 1, 1, 1,
-1.430356, 0.4002072, -0.5544221, 1, 1, 1, 1, 1,
-1.429861, 1.321523, 0.169517, 1, 1, 1, 1, 1,
-1.419333, 0.100156, -2.170725, 1, 1, 1, 1, 1,
-1.399255, 0.1864962, -0.7622362, 1, 1, 1, 1, 1,
-1.390159, 1.426324, -1.310929, 1, 1, 1, 1, 1,
-1.388279, -0.2846101, -0.2809944, 1, 1, 1, 1, 1,
-1.380802, 0.5851325, -0.8458301, 1, 1, 1, 1, 1,
-1.375383, -0.5080715, 0.7160888, 1, 1, 1, 1, 1,
-1.364534, 1.17881, -1.143897, 1, 1, 1, 1, 1,
-1.363897, 0.786209, -0.5513519, 1, 1, 1, 1, 1,
-1.36303, -0.1325058, -3.447009, 1, 1, 1, 1, 1,
-1.333762, -0.1805031, -0.728089, 1, 1, 1, 1, 1,
-1.325327, 0.51, -0.1248673, 0, 0, 1, 1, 1,
-1.318578, -0.8170112, -1.492035, 1, 0, 0, 1, 1,
-1.309697, -0.8724472, -3.125529, 1, 0, 0, 1, 1,
-1.298445, -0.6490965, -1.963916, 1, 0, 0, 1, 1,
-1.294489, 1.805387, -0.09282762, 1, 0, 0, 1, 1,
-1.286919, -0.1720017, -1.768052, 1, 0, 0, 1, 1,
-1.282524, -0.2550601, -1.446626, 0, 0, 0, 1, 1,
-1.282202, -0.9900455, -1.884228, 0, 0, 0, 1, 1,
-1.276706, -0.4430766, -1.216314, 0, 0, 0, 1, 1,
-1.273061, -1.88599, -3.241373, 0, 0, 0, 1, 1,
-1.257414, 0.05428797, -2.45618, 0, 0, 0, 1, 1,
-1.231895, -1.438459, -1.238159, 0, 0, 0, 1, 1,
-1.220037, 1.77366, -0.6023943, 0, 0, 0, 1, 1,
-1.215403, -1.10648, -1.585362, 1, 1, 1, 1, 1,
-1.213171, 0.5267706, -0.6308861, 1, 1, 1, 1, 1,
-1.212185, -0.5567997, -2.905884, 1, 1, 1, 1, 1,
-1.211943, -0.2255178, -2.10381, 1, 1, 1, 1, 1,
-1.204497, 0.5576011, -1.20106, 1, 1, 1, 1, 1,
-1.198771, 0.6354448, -2.320317, 1, 1, 1, 1, 1,
-1.191774, -0.7924347, -0.8283155, 1, 1, 1, 1, 1,
-1.187646, 0.2406648, -2.3187, 1, 1, 1, 1, 1,
-1.181865, -1.317849, -0.8795164, 1, 1, 1, 1, 1,
-1.1813, -0.2031631, -1.871759, 1, 1, 1, 1, 1,
-1.178871, -1.873014, -4.094489, 1, 1, 1, 1, 1,
-1.174924, -0.9711035, -3.059606, 1, 1, 1, 1, 1,
-1.174522, 0.8055679, -0.2155295, 1, 1, 1, 1, 1,
-1.171045, -0.02784521, -0.2401186, 1, 1, 1, 1, 1,
-1.168327, -0.3180906, -3.75311, 1, 1, 1, 1, 1,
-1.168038, 0.2578475, 0.8466685, 0, 0, 1, 1, 1,
-1.166548, 0.04900985, -0.8282878, 1, 0, 0, 1, 1,
-1.158487, 0.4903633, -1.651538, 1, 0, 0, 1, 1,
-1.153809, 0.6498423, -0.08130839, 1, 0, 0, 1, 1,
-1.153698, -0.1564685, -2.064865, 1, 0, 0, 1, 1,
-1.152801, -0.9742299, -2.785645, 1, 0, 0, 1, 1,
-1.149887, 0.09106781, -0.3037449, 0, 0, 0, 1, 1,
-1.145817, -1.343122, -2.068452, 0, 0, 0, 1, 1,
-1.128495, 0.07921095, -2.088436, 0, 0, 0, 1, 1,
-1.118713, -1.419391, -2.29522, 0, 0, 0, 1, 1,
-1.108933, 0.7169284, -0.4906649, 0, 0, 0, 1, 1,
-1.107719, -0.07646008, -2.788151, 0, 0, 0, 1, 1,
-1.106095, 0.2790892, -2.175045, 0, 0, 0, 1, 1,
-1.103663, -1.159919, -1.357313, 1, 1, 1, 1, 1,
-1.100342, 0.6028041, -1.125324, 1, 1, 1, 1, 1,
-1.097647, 1.676615, -1.635613, 1, 1, 1, 1, 1,
-1.087046, 0.5537794, -2.137823, 1, 1, 1, 1, 1,
-1.074437, -1.187835, -2.83466, 1, 1, 1, 1, 1,
-1.071946, -0.8338428, -1.611744, 1, 1, 1, 1, 1,
-1.068165, -0.8407237, -1.792851, 1, 1, 1, 1, 1,
-1.064265, -0.1929349, -2.773645, 1, 1, 1, 1, 1,
-1.059867, -0.5289436, -2.805341, 1, 1, 1, 1, 1,
-1.059446, -0.4008316, -2.185355, 1, 1, 1, 1, 1,
-1.057804, 1.894078, -0.8989807, 1, 1, 1, 1, 1,
-1.05281, 1.338175, -1.486867, 1, 1, 1, 1, 1,
-1.051246, 1.701489, -0.3030437, 1, 1, 1, 1, 1,
-1.051202, -1.480378, -2.195568, 1, 1, 1, 1, 1,
-1.04958, 0.3270954, -2.330081, 1, 1, 1, 1, 1,
-1.043323, -0.1690249, -0.896546, 0, 0, 1, 1, 1,
-1.041761, -1.467673, -1.787032, 1, 0, 0, 1, 1,
-1.035471, 0.8425652, -0.9012576, 1, 0, 0, 1, 1,
-1.033484, -0.6914734, -0.4527895, 1, 0, 0, 1, 1,
-1.030419, 1.417125, -0.9305719, 1, 0, 0, 1, 1,
-1.026403, 0.3292276, -1.499611, 1, 0, 0, 1, 1,
-1.015445, 0.7559093, -2.821702, 0, 0, 0, 1, 1,
-1.00464, -1.495708, -4.656744, 0, 0, 0, 1, 1,
-1.004564, 0.2551162, -2.138619, 0, 0, 0, 1, 1,
-1.000728, 0.6332829, -1.573809, 0, 0, 0, 1, 1,
-0.9993919, 0.07789842, -2.536376, 0, 0, 0, 1, 1,
-0.9929304, -0.1181569, -0.9578953, 0, 0, 0, 1, 1,
-0.992714, -1.752498, -1.633044, 0, 0, 0, 1, 1,
-0.9805293, -1.804438, -3.259009, 1, 1, 1, 1, 1,
-0.9771908, 0.7742902, -1.598151, 1, 1, 1, 1, 1,
-0.9728945, 0.08219349, -2.688859, 1, 1, 1, 1, 1,
-0.9663641, 0.208865, -0.3295966, 1, 1, 1, 1, 1,
-0.9655466, 0.8245075, -1.344596, 1, 1, 1, 1, 1,
-0.9609431, 1.326895, 0.3436341, 1, 1, 1, 1, 1,
-0.955582, 0.1312385, -1.797696, 1, 1, 1, 1, 1,
-0.9537194, -0.3343587, -1.385783, 1, 1, 1, 1, 1,
-0.9534501, -0.4135154, -3.139838, 1, 1, 1, 1, 1,
-0.9502634, 0.1103207, -0.1980686, 1, 1, 1, 1, 1,
-0.9470201, 0.2325704, -1.382985, 1, 1, 1, 1, 1,
-0.9381965, 1.426142, -1.60037, 1, 1, 1, 1, 1,
-0.9377379, 1.483768, -0.822193, 1, 1, 1, 1, 1,
-0.9300656, -0.8327782, -2.353896, 1, 1, 1, 1, 1,
-0.9285733, -0.5459105, -1.36177, 1, 1, 1, 1, 1,
-0.9221036, 0.7792552, -1.172914, 0, 0, 1, 1, 1,
-0.9218953, -0.4548572, -1.294927, 1, 0, 0, 1, 1,
-0.9213477, 1.846078, -2.419323, 1, 0, 0, 1, 1,
-0.9172096, -0.03685262, 0.2057147, 1, 0, 0, 1, 1,
-0.9143742, -0.02756338, -0.9033732, 1, 0, 0, 1, 1,
-0.914068, -0.9895822, -3.109588, 1, 0, 0, 1, 1,
-0.9125264, -1.17457, -1.302311, 0, 0, 0, 1, 1,
-0.9104171, -0.3778869, -3.166765, 0, 0, 0, 1, 1,
-0.9076571, 1.697708, -1.695713, 0, 0, 0, 1, 1,
-0.9047511, -0.5311611, -3.622426, 0, 0, 0, 1, 1,
-0.9044053, -1.153399, -2.174292, 0, 0, 0, 1, 1,
-0.9013294, 0.8095983, -1.066127, 0, 0, 0, 1, 1,
-0.9001755, 1.573972, -0.3947527, 0, 0, 0, 1, 1,
-0.8957335, -1.077952, -2.148704, 1, 1, 1, 1, 1,
-0.8954661, -1.049308, -1.196998, 1, 1, 1, 1, 1,
-0.892672, -0.4240232, -2.128055, 1, 1, 1, 1, 1,
-0.8913546, -0.728325, -2.144855, 1, 1, 1, 1, 1,
-0.8899812, 0.05975766, -2.821644, 1, 1, 1, 1, 1,
-0.8763673, -0.0481944, -0.9254785, 1, 1, 1, 1, 1,
-0.8746625, 0.4009553, -1.953114, 1, 1, 1, 1, 1,
-0.8745837, 0.3943958, -0.6840115, 1, 1, 1, 1, 1,
-0.870369, -0.5081943, -1.283054, 1, 1, 1, 1, 1,
-0.8669693, -1.301072, -0.5979187, 1, 1, 1, 1, 1,
-0.8644713, -0.4596114, -0.4679605, 1, 1, 1, 1, 1,
-0.8614909, 0.4836012, -0.5331317, 1, 1, 1, 1, 1,
-0.8598281, 0.1339519, -1.513641, 1, 1, 1, 1, 1,
-0.8562762, 0.2640434, -1.974717, 1, 1, 1, 1, 1,
-0.8509412, -0.6422216, -0.7616077, 1, 1, 1, 1, 1,
-0.8453476, 0.3812604, -0.7861879, 0, 0, 1, 1, 1,
-0.8408652, -0.7014323, -2.859413, 1, 0, 0, 1, 1,
-0.8376543, 0.3044993, -1.048531, 1, 0, 0, 1, 1,
-0.8223304, 0.102801, -1.578297, 1, 0, 0, 1, 1,
-0.8206422, 1.157254, -1.796634, 1, 0, 0, 1, 1,
-0.8178576, -0.5147992, -1.786033, 1, 0, 0, 1, 1,
-0.8031177, -0.625938, -2.597498, 0, 0, 0, 1, 1,
-0.8007703, 1.393975, 0.4746614, 0, 0, 0, 1, 1,
-0.7928914, 0.5058401, -0.337231, 0, 0, 0, 1, 1,
-0.7927375, -0.4711238, -2.704527, 0, 0, 0, 1, 1,
-0.7913432, -1.603584, -3.211109, 0, 0, 0, 1, 1,
-0.7868584, 0.05372141, -1.881793, 0, 0, 0, 1, 1,
-0.7848949, -0.06147822, -2.618228, 0, 0, 0, 1, 1,
-0.7799903, -0.132088, -3.775768, 1, 1, 1, 1, 1,
-0.7766816, 0.7059068, -0.3670106, 1, 1, 1, 1, 1,
-0.7755437, 2.317591, -0.03037569, 1, 1, 1, 1, 1,
-0.7709597, 0.5750385, -1.231424, 1, 1, 1, 1, 1,
-0.7706498, 1.69887, 0.7292528, 1, 1, 1, 1, 1,
-0.7705595, -0.2673462, -1.013804, 1, 1, 1, 1, 1,
-0.7685835, 0.5331701, -1.260829, 1, 1, 1, 1, 1,
-0.7681187, -0.8166898, -2.038052, 1, 1, 1, 1, 1,
-0.7673228, 0.4389866, -2.118925, 1, 1, 1, 1, 1,
-0.7670053, 0.9748841, -0.3712465, 1, 1, 1, 1, 1,
-0.7651086, -0.7780629, -2.825116, 1, 1, 1, 1, 1,
-0.7650409, 0.4630902, -0.8230786, 1, 1, 1, 1, 1,
-0.7645193, -0.3458656, -2.809057, 1, 1, 1, 1, 1,
-0.7596043, -1.049082, -2.530212, 1, 1, 1, 1, 1,
-0.7590412, 0.1698357, -1.179476, 1, 1, 1, 1, 1,
-0.7581507, 0.509981, -0.451332, 0, 0, 1, 1, 1,
-0.7505105, -1.142132, -1.178251, 1, 0, 0, 1, 1,
-0.7492132, 1.003902, -1.640204, 1, 0, 0, 1, 1,
-0.7470121, -0.6613957, -2.382279, 1, 0, 0, 1, 1,
-0.7443736, -0.268709, -3.330641, 1, 0, 0, 1, 1,
-0.7409871, -0.9074543, -4.135028, 1, 0, 0, 1, 1,
-0.740418, 0.9936777, -0.9992579, 0, 0, 0, 1, 1,
-0.7350053, -0.2648495, -2.554635, 0, 0, 0, 1, 1,
-0.7320145, -0.298368, -0.2751395, 0, 0, 0, 1, 1,
-0.7297507, 1.86454, -1.538511, 0, 0, 0, 1, 1,
-0.7208717, 1.003623, -1.529387, 0, 0, 0, 1, 1,
-0.7205782, 0.2519569, -1.991994, 0, 0, 0, 1, 1,
-0.714173, -1.198452, -2.790181, 0, 0, 0, 1, 1,
-0.7094792, 0.9088466, -0.5910297, 1, 1, 1, 1, 1,
-0.7087961, -0.5106815, -0.6124824, 1, 1, 1, 1, 1,
-0.699173, 1.889144, 0.1102435, 1, 1, 1, 1, 1,
-0.69728, 0.2963194, -0.2445902, 1, 1, 1, 1, 1,
-0.695631, 1.329692, -0.4350802, 1, 1, 1, 1, 1,
-0.6874078, -1.385798, -4.820093, 1, 1, 1, 1, 1,
-0.6700776, -0.04336926, -2.784461, 1, 1, 1, 1, 1,
-0.6601927, 2.144629, 0.6907957, 1, 1, 1, 1, 1,
-0.6563096, -1.286508, -3.080214, 1, 1, 1, 1, 1,
-0.6545727, 0.5667147, -1.060828, 1, 1, 1, 1, 1,
-0.6524453, 1.054177, 2.159549, 1, 1, 1, 1, 1,
-0.643158, 0.6607453, -1.522961, 1, 1, 1, 1, 1,
-0.6355762, 0.1961602, -0.4155897, 1, 1, 1, 1, 1,
-0.63428, -1.043345, -3.075925, 1, 1, 1, 1, 1,
-0.6290556, -1.273242, -2.191952, 1, 1, 1, 1, 1,
-0.6275513, 0.7398008, -1.812355, 0, 0, 1, 1, 1,
-0.6238019, -1.069704, -3.960532, 1, 0, 0, 1, 1,
-0.6203043, 0.4113804, 0.4321311, 1, 0, 0, 1, 1,
-0.6197109, -2.335823, -3.392694, 1, 0, 0, 1, 1,
-0.614124, -0.948706, -2.21066, 1, 0, 0, 1, 1,
-0.6102536, -1.395205, -4.360643, 1, 0, 0, 1, 1,
-0.6036871, -0.1148636, -1.44572, 0, 0, 0, 1, 1,
-0.5983928, -1.208425, -2.255795, 0, 0, 0, 1, 1,
-0.5973061, 1.279955, 1.757611, 0, 0, 0, 1, 1,
-0.5962874, -0.4333974, -2.374346, 0, 0, 0, 1, 1,
-0.5945451, 0.5322725, -3.941262, 0, 0, 0, 1, 1,
-0.5940922, 0.005254562, -1.016844, 0, 0, 0, 1, 1,
-0.5905312, -0.344195, -1.764645, 0, 0, 0, 1, 1,
-0.5898251, 0.03600254, -1.945646, 1, 1, 1, 1, 1,
-0.589316, 1.309074, -0.1911238, 1, 1, 1, 1, 1,
-0.5879166, 0.9478768, -2.546766, 1, 1, 1, 1, 1,
-0.5876139, 0.01585022, -0.6646479, 1, 1, 1, 1, 1,
-0.5856125, -0.7409121, -0.6275879, 1, 1, 1, 1, 1,
-0.5854885, -1.078689, -1.516969, 1, 1, 1, 1, 1,
-0.5819767, -0.7724797, -2.982403, 1, 1, 1, 1, 1,
-0.5759245, 0.1589366, 0.4636895, 1, 1, 1, 1, 1,
-0.5756614, 0.2859788, -2.619165, 1, 1, 1, 1, 1,
-0.574978, -2.735, -2.200465, 1, 1, 1, 1, 1,
-0.5738388, 1.000949, 0.05076924, 1, 1, 1, 1, 1,
-0.573656, -2.646399, -2.215047, 1, 1, 1, 1, 1,
-0.5733903, 0.7550503, -1.543813, 1, 1, 1, 1, 1,
-0.5725753, -0.01260077, -0.5100438, 1, 1, 1, 1, 1,
-0.5708861, -1.624459, -3.314753, 1, 1, 1, 1, 1,
-0.5700116, -0.05354673, -2.396299, 0, 0, 1, 1, 1,
-0.5686039, 1.606981, -0.1606982, 1, 0, 0, 1, 1,
-0.5671158, -2.416242, -2.250166, 1, 0, 0, 1, 1,
-0.56099, 0.3958821, 0.6956174, 1, 0, 0, 1, 1,
-0.5581383, -0.6918727, -3.918144, 1, 0, 0, 1, 1,
-0.5579773, -1.289107, -5.066726, 1, 0, 0, 1, 1,
-0.5571399, -1.136865, -1.437038, 0, 0, 0, 1, 1,
-0.5508878, 0.5309238, 0.5079159, 0, 0, 0, 1, 1,
-0.5409092, 0.3918425, -0.213985, 0, 0, 0, 1, 1,
-0.5312154, 0.3375903, -1.044206, 0, 0, 0, 1, 1,
-0.5273589, -1.592658, -2.404013, 0, 0, 0, 1, 1,
-0.5201853, -0.2289024, -2.708722, 0, 0, 0, 1, 1,
-0.5201316, 0.1030171, -2.397933, 0, 0, 0, 1, 1,
-0.5126945, 0.3287696, -1.171299, 1, 1, 1, 1, 1,
-0.5096674, -0.4640782, -2.56894, 1, 1, 1, 1, 1,
-0.5085404, -1.205429, -4.167162, 1, 1, 1, 1, 1,
-0.507871, 2.819812, -1.944646, 1, 1, 1, 1, 1,
-0.505326, -0.2008018, -1.071598, 1, 1, 1, 1, 1,
-0.4991716, 1.149413, -1.230281, 1, 1, 1, 1, 1,
-0.499137, -1.167597, -3.024553, 1, 1, 1, 1, 1,
-0.4969794, -1.79777, -2.004771, 1, 1, 1, 1, 1,
-0.4948365, -0.3076801, -4.39806, 1, 1, 1, 1, 1,
-0.4939209, -3.086284, -2.639357, 1, 1, 1, 1, 1,
-0.4899124, 0.8861235, -1.702348, 1, 1, 1, 1, 1,
-0.4871315, -0.09744165, -2.118594, 1, 1, 1, 1, 1,
-0.4819531, -1.315415, -3.14655, 1, 1, 1, 1, 1,
-0.4738484, -0.3555078, -1.824531, 1, 1, 1, 1, 1,
-0.4717075, 0.4323855, 0.5036229, 1, 1, 1, 1, 1,
-0.4710406, -0.3768581, -2.720726, 0, 0, 1, 1, 1,
-0.4707167, -1.148423, -1.596271, 1, 0, 0, 1, 1,
-0.470107, -1.030985, -2.592702, 1, 0, 0, 1, 1,
-0.4657021, 0.5133732, -1.646086, 1, 0, 0, 1, 1,
-0.4635417, -0.1911729, -2.279685, 1, 0, 0, 1, 1,
-0.4633739, -0.2090699, -2.313097, 1, 0, 0, 1, 1,
-0.4583438, -0.5523765, -2.163391, 0, 0, 0, 1, 1,
-0.4583005, 1.042676, -0.8936791, 0, 0, 0, 1, 1,
-0.4561501, -0.6799939, -2.704463, 0, 0, 0, 1, 1,
-0.4555975, -0.7797618, -2.526723, 0, 0, 0, 1, 1,
-0.4420779, -0.7443271, -2.774486, 0, 0, 0, 1, 1,
-0.440777, -0.9043806, -3.062021, 0, 0, 0, 1, 1,
-0.4389718, 0.3043906, -1.474622, 0, 0, 0, 1, 1,
-0.4385853, 0.6614749, -1.093322, 1, 1, 1, 1, 1,
-0.4379486, 1.869662, -1.951359, 1, 1, 1, 1, 1,
-0.4291058, -1.617109, -2.983874, 1, 1, 1, 1, 1,
-0.4263302, 0.8092547, 0.4769934, 1, 1, 1, 1, 1,
-0.4255361, -1.669682, -2.055279, 1, 1, 1, 1, 1,
-0.4247547, -0.7814804, -3.687892, 1, 1, 1, 1, 1,
-0.421217, -0.01229304, -0.6880254, 1, 1, 1, 1, 1,
-0.4178364, 0.9548481, 2.441721, 1, 1, 1, 1, 1,
-0.4164185, 0.3418387, -1.62232, 1, 1, 1, 1, 1,
-0.4115051, -0.09020537, -1.052847, 1, 1, 1, 1, 1,
-0.4098494, 0.604185, -0.4268604, 1, 1, 1, 1, 1,
-0.409194, -0.809593, -3.009758, 1, 1, 1, 1, 1,
-0.4071363, 1.608605, -0.4222196, 1, 1, 1, 1, 1,
-0.4067542, -0.260763, -2.956937, 1, 1, 1, 1, 1,
-0.4066674, 0.01136656, -0.819943, 1, 1, 1, 1, 1,
-0.3970452, -0.4183388, -3.822693, 0, 0, 1, 1, 1,
-0.3936734, 1.861519, -0.4844441, 1, 0, 0, 1, 1,
-0.3881299, -0.6468535, -3.358674, 1, 0, 0, 1, 1,
-0.3844922, 1.715359, 0.6114553, 1, 0, 0, 1, 1,
-0.3837043, -1.227993, -2.141106, 1, 0, 0, 1, 1,
-0.3788418, -0.5459841, -4.716649, 1, 0, 0, 1, 1,
-0.3747092, 1.131023, -0.8236536, 0, 0, 0, 1, 1,
-0.3722815, 0.1431349, -1.222554, 0, 0, 0, 1, 1,
-0.3678598, 0.5098288, 0.5170481, 0, 0, 0, 1, 1,
-0.3643764, -0.3018912, -2.14232, 0, 0, 0, 1, 1,
-0.3640111, -1.583614, -5.244852, 0, 0, 0, 1, 1,
-0.3638392, 0.3257675, -1.621783, 0, 0, 0, 1, 1,
-0.3631354, 1.227708, -1.570336, 0, 0, 0, 1, 1,
-0.3609967, -0.4513491, -3.116365, 1, 1, 1, 1, 1,
-0.3561675, -1.457966, -3.289771, 1, 1, 1, 1, 1,
-0.3455388, -0.0001626571, -0.5831162, 1, 1, 1, 1, 1,
-0.3441962, 0.03654183, 0.5418679, 1, 1, 1, 1, 1,
-0.3425985, -1.698134, -2.252016, 1, 1, 1, 1, 1,
-0.342392, 0.5099974, -1.117674, 1, 1, 1, 1, 1,
-0.3416663, -0.2670631, -3.134344, 1, 1, 1, 1, 1,
-0.3405683, -1.695825, -3.547359, 1, 1, 1, 1, 1,
-0.340452, -0.6019363, -3.92761, 1, 1, 1, 1, 1,
-0.3383818, -0.0272733, -0.9384179, 1, 1, 1, 1, 1,
-0.3376204, -1.301456, -0.1980179, 1, 1, 1, 1, 1,
-0.3365008, 1.092085, 0.194661, 1, 1, 1, 1, 1,
-0.3362352, 0.7997922, -0.781273, 1, 1, 1, 1, 1,
-0.3332527, 0.5090576, -0.8290316, 1, 1, 1, 1, 1,
-0.3301349, -0.8068717, -3.670712, 1, 1, 1, 1, 1,
-0.3182303, -0.9538796, -0.9490161, 0, 0, 1, 1, 1,
-0.3178372, 1.122682, 0.7581671, 1, 0, 0, 1, 1,
-0.316457, 1.965947, -2.677234, 1, 0, 0, 1, 1,
-0.3092962, 0.6096379, -0.6984069, 1, 0, 0, 1, 1,
-0.3072003, 1.488614, 0.8931823, 1, 0, 0, 1, 1,
-0.3002792, -1.382903, -3.494591, 1, 0, 0, 1, 1,
-0.2995675, -1.076217, -2.748999, 0, 0, 0, 1, 1,
-0.2985397, -0.934824, -4.149964, 0, 0, 0, 1, 1,
-0.295448, 0.08539914, -2.026913, 0, 0, 0, 1, 1,
-0.2871238, -1.351724, -1.910056, 0, 0, 0, 1, 1,
-0.2838325, -0.4285451, -5.143107, 0, 0, 0, 1, 1,
-0.2755161, -0.1630549, -1.145895, 0, 0, 0, 1, 1,
-0.2725301, -0.2296966, -1.612023, 0, 0, 0, 1, 1,
-0.2700716, 1.248282, -0.8177319, 1, 1, 1, 1, 1,
-0.2694905, 1.916892, -0.3842779, 1, 1, 1, 1, 1,
-0.2668859, -1.107384, -0.4720475, 1, 1, 1, 1, 1,
-0.259133, 1.260546, 1.119441, 1, 1, 1, 1, 1,
-0.2585579, -1.371197, -1.807959, 1, 1, 1, 1, 1,
-0.258339, 0.1226109, -1.88509, 1, 1, 1, 1, 1,
-0.2577483, 0.2046898, -0.2456666, 1, 1, 1, 1, 1,
-0.2570427, -2.891348, -3.165365, 1, 1, 1, 1, 1,
-0.2493666, 0.3190821, 0.005380621, 1, 1, 1, 1, 1,
-0.2487685, -0.7196809, -2.787451, 1, 1, 1, 1, 1,
-0.245, -1.17697, -2.641608, 1, 1, 1, 1, 1,
-0.2448973, 1.194376, -0.6866741, 1, 1, 1, 1, 1,
-0.2420111, 0.02926261, 0.2866292, 1, 1, 1, 1, 1,
-0.2388647, -0.9657841, -4.10637, 1, 1, 1, 1, 1,
-0.2377274, 2.09349, 1.130932, 1, 1, 1, 1, 1,
-0.2373283, -0.7370113, -1.024987, 0, 0, 1, 1, 1,
-0.233756, 1.686224, 0.5184315, 1, 0, 0, 1, 1,
-0.2313487, -2.914925, -3.502184, 1, 0, 0, 1, 1,
-0.2301957, -0.6883284, -1.551612, 1, 0, 0, 1, 1,
-0.2288645, -0.7962974, -2.383485, 1, 0, 0, 1, 1,
-0.2282996, -1.078998, -2.783999, 1, 0, 0, 1, 1,
-0.2277101, 0.02164123, -1.99302, 0, 0, 0, 1, 1,
-0.2264117, -0.1704883, -3.966046, 0, 0, 0, 1, 1,
-0.225094, 0.1798937, -1.259172, 0, 0, 0, 1, 1,
-0.2225806, -0.1745912, -1.916649, 0, 0, 0, 1, 1,
-0.220525, 2.360583, -1.404235, 0, 0, 0, 1, 1,
-0.2191892, -0.6921942, -2.508117, 0, 0, 0, 1, 1,
-0.2169233, -0.5031916, -2.312435, 0, 0, 0, 1, 1,
-0.2081429, 2.311561, -2.380228, 1, 1, 1, 1, 1,
-0.2074567, -0.2787769, -2.503813, 1, 1, 1, 1, 1,
-0.2064541, -0.9656487, -3.646028, 1, 1, 1, 1, 1,
-0.1986013, 1.11834, 0.4571144, 1, 1, 1, 1, 1,
-0.1978849, -0.5660817, -2.193597, 1, 1, 1, 1, 1,
-0.1978716, 1.165896, 0.8489059, 1, 1, 1, 1, 1,
-0.197248, 3.195643, -0.8535859, 1, 1, 1, 1, 1,
-0.1958997, 0.430002, 0.1158508, 1, 1, 1, 1, 1,
-0.1947863, 0.1895681, 1.34375, 1, 1, 1, 1, 1,
-0.1918275, 1.429502, -1.325462, 1, 1, 1, 1, 1,
-0.1903379, 0.7172323, 0.7303085, 1, 1, 1, 1, 1,
-0.1900315, 1.326868, 0.6134323, 1, 1, 1, 1, 1,
-0.189778, -1.229477, -3.294481, 1, 1, 1, 1, 1,
-0.1870062, -0.05392265, -1.198243, 1, 1, 1, 1, 1,
-0.1851888, 0.4180802, 0.5254107, 1, 1, 1, 1, 1,
-0.1818869, 0.1005066, 0.5111444, 0, 0, 1, 1, 1,
-0.1785489, -0.6411757, -3.234241, 1, 0, 0, 1, 1,
-0.1752557, -0.744524, -2.445841, 1, 0, 0, 1, 1,
-0.1745585, -0.8250397, -2.402337, 1, 0, 0, 1, 1,
-0.1744997, 1.451656, -0.7170879, 1, 0, 0, 1, 1,
-0.1741719, -0.1449494, -1.671611, 1, 0, 0, 1, 1,
-0.1712372, -0.0105391, -1.391606, 0, 0, 0, 1, 1,
-0.171075, 1.065553, 0.501883, 0, 0, 0, 1, 1,
-0.1657308, -0.3014197, -4.045768, 0, 0, 0, 1, 1,
-0.1603516, -1.250165, -2.688713, 0, 0, 0, 1, 1,
-0.1597048, 0.3654679, -0.9118107, 0, 0, 0, 1, 1,
-0.1586316, 2.246051, 0.6600481, 0, 0, 0, 1, 1,
-0.1577118, -1.890221, -0.9480725, 0, 0, 0, 1, 1,
-0.1550198, 0.6426473, -0.4472216, 1, 1, 1, 1, 1,
-0.1515952, -0.2185158, -2.755751, 1, 1, 1, 1, 1,
-0.15116, 0.9358289, 0.6054814, 1, 1, 1, 1, 1,
-0.1463425, -0.2642429, -3.171502, 1, 1, 1, 1, 1,
-0.1445962, -0.01269, -1.282391, 1, 1, 1, 1, 1,
-0.1372873, -0.6608621, -2.65339, 1, 1, 1, 1, 1,
-0.1370637, 0.3116646, 1.696131, 1, 1, 1, 1, 1,
-0.1364606, 1.108928, 0.7617776, 1, 1, 1, 1, 1,
-0.1316081, -1.00471, -2.968132, 1, 1, 1, 1, 1,
-0.1274477, -0.5001442, -1.095547, 1, 1, 1, 1, 1,
-0.1259567, 0.457283, 0.3647085, 1, 1, 1, 1, 1,
-0.1257201, -0.5565171, -2.148599, 1, 1, 1, 1, 1,
-0.1176943, 0.07755395, -0.7630321, 1, 1, 1, 1, 1,
-0.1097615, -0.241768, -3.018686, 1, 1, 1, 1, 1,
-0.1053761, 1.0262, -0.9559319, 1, 1, 1, 1, 1,
-0.1003159, -0.8439935, -3.665204, 0, 0, 1, 1, 1,
-0.09547035, -0.2224309, -4.65547, 1, 0, 0, 1, 1,
-0.09403215, -1.397202, -3.642839, 1, 0, 0, 1, 1,
-0.09286483, -0.1169629, -3.1815, 1, 0, 0, 1, 1,
-0.08728206, -0.844516, -3.547444, 1, 0, 0, 1, 1,
-0.0778265, -0.4097047, -2.619792, 1, 0, 0, 1, 1,
-0.07568289, -0.3230237, -2.505397, 0, 0, 0, 1, 1,
-0.07514159, 1.049049, 0.7377568, 0, 0, 0, 1, 1,
-0.07296008, 0.7397448, 1.24722, 0, 0, 0, 1, 1,
-0.0670476, 2.543576, 0.7342544, 0, 0, 0, 1, 1,
-0.06166579, -1.733328, -2.84093, 0, 0, 0, 1, 1,
-0.05908899, -0.7122271, -3.132788, 0, 0, 0, 1, 1,
-0.05850876, -0.7489383, -2.093097, 0, 0, 0, 1, 1,
-0.05686176, 1.570229, 1.501095, 1, 1, 1, 1, 1,
-0.05626732, 0.3424981, 0.1162126, 1, 1, 1, 1, 1,
-0.05512426, -0.7493989, -3.957406, 1, 1, 1, 1, 1,
-0.0514246, -0.4194442, -2.607562, 1, 1, 1, 1, 1,
-0.05011893, 0.2190211, 0.508778, 1, 1, 1, 1, 1,
-0.04958624, 1.092084, -1.088258, 1, 1, 1, 1, 1,
-0.04790516, 1.634287, -0.5523625, 1, 1, 1, 1, 1,
-0.0464735, -0.4258106, -3.599511, 1, 1, 1, 1, 1,
-0.04605074, 1.967183, 2.444595, 1, 1, 1, 1, 1,
-0.04512402, -1.524106, -3.104361, 1, 1, 1, 1, 1,
-0.04101492, 0.01286985, -1.774009, 1, 1, 1, 1, 1,
-0.04085917, 1.432592, -1.121196, 1, 1, 1, 1, 1,
-0.035049, -1.853855, -3.966654, 1, 1, 1, 1, 1,
-0.03383269, -0.0552064, -1.401724, 1, 1, 1, 1, 1,
-0.02863176, 0.6912197, -0.2044101, 1, 1, 1, 1, 1,
-0.02749739, 2.790478, -0.8325559, 0, 0, 1, 1, 1,
-0.02683198, 1.109935, -0.6509302, 1, 0, 0, 1, 1,
-0.02666657, -1.775999, -1.252678, 1, 0, 0, 1, 1,
-0.02634584, -0.4257679, -2.519228, 1, 0, 0, 1, 1,
-0.01755365, 1.724018, 0.3487861, 1, 0, 0, 1, 1,
-0.01480881, 0.7860097, -1.31923, 1, 0, 0, 1, 1,
-0.01243475, -0.1190212, -2.289404, 0, 0, 0, 1, 1,
-0.01130196, -0.3950579, -2.566457, 0, 0, 0, 1, 1,
-0.003485169, -0.4376855, -2.517934, 0, 0, 0, 1, 1,
-0.002859565, 0.5261459, 0.06605548, 0, 0, 0, 1, 1,
0.003736518, -1.261229, 1.978971, 0, 0, 0, 1, 1,
0.00437458, -2.093463, 2.165692, 0, 0, 0, 1, 1,
0.005798755, -0.2203187, 2.833967, 0, 0, 0, 1, 1,
0.006862219, 0.7796305, -0.6083961, 1, 1, 1, 1, 1,
0.006939724, 0.7843606, -1.046781, 1, 1, 1, 1, 1,
0.008592122, 0.9744925, 1.145239, 1, 1, 1, 1, 1,
0.008774005, -1.159289, 4.341517, 1, 1, 1, 1, 1,
0.01349015, 1.097786, -0.6130373, 1, 1, 1, 1, 1,
0.01403223, -0.668709, 4.856508, 1, 1, 1, 1, 1,
0.01501145, 0.1623165, 0.2425417, 1, 1, 1, 1, 1,
0.02007069, -0.2085206, 2.42138, 1, 1, 1, 1, 1,
0.02148805, 2.125306, 1.140601, 1, 1, 1, 1, 1,
0.02525732, -0.1201762, 1.28924, 1, 1, 1, 1, 1,
0.03122136, 0.114225, 0.1414893, 1, 1, 1, 1, 1,
0.03243293, -0.7821648, 2.259789, 1, 1, 1, 1, 1,
0.03270396, 0.1795034, -0.01594474, 1, 1, 1, 1, 1,
0.03608843, 1.275896, 0.3888537, 1, 1, 1, 1, 1,
0.03669273, 0.7662362, 0.4573664, 1, 1, 1, 1, 1,
0.03926627, -0.9244833, 1.608021, 0, 0, 1, 1, 1,
0.04245407, 0.06360023, 2.888229, 1, 0, 0, 1, 1,
0.04320204, -0.2623578, 4.742347, 1, 0, 0, 1, 1,
0.04395843, 0.1814929, 1.51551, 1, 0, 0, 1, 1,
0.04964177, -1.495417, 4.192685, 1, 0, 0, 1, 1,
0.04999936, -0.02081577, 1.914302, 1, 0, 0, 1, 1,
0.05084169, 0.07541691, 0.9910678, 0, 0, 0, 1, 1,
0.05308485, -0.6556458, 5.011005, 0, 0, 0, 1, 1,
0.05469659, 0.5819211, -0.6070956, 0, 0, 0, 1, 1,
0.05551672, -0.4793392, 0.3706221, 0, 0, 0, 1, 1,
0.05867948, -0.7422878, 0.7770332, 0, 0, 0, 1, 1,
0.06040187, -1.653106, 2.393822, 0, 0, 0, 1, 1,
0.06082633, -1.512782, 2.916514, 0, 0, 0, 1, 1,
0.06352897, 1.263456, 0.7232099, 1, 1, 1, 1, 1,
0.06492197, -1.342493, 3.503462, 1, 1, 1, 1, 1,
0.06555597, -0.6176268, 2.042294, 1, 1, 1, 1, 1,
0.06745892, -0.3416074, 5.514883, 1, 1, 1, 1, 1,
0.06764371, 0.6877776, -0.8270922, 1, 1, 1, 1, 1,
0.07198311, -0.9488387, 4.411202, 1, 1, 1, 1, 1,
0.07283294, -0.5475308, 4.003142, 1, 1, 1, 1, 1,
0.07513641, -0.1329816, 3.003633, 1, 1, 1, 1, 1,
0.07913122, -0.5521072, 2.206114, 1, 1, 1, 1, 1,
0.07913613, -1.335962, 2.407664, 1, 1, 1, 1, 1,
0.08056977, -1.613303, 2.005195, 1, 1, 1, 1, 1,
0.08141771, -1.428054, 2.126986, 1, 1, 1, 1, 1,
0.08150003, -0.4103399, 2.1957, 1, 1, 1, 1, 1,
0.08596284, -0.6649907, 3.908362, 1, 1, 1, 1, 1,
0.08669928, -0.6421945, 3.304554, 1, 1, 1, 1, 1,
0.08826127, 0.4086229, -0.1238836, 0, 0, 1, 1, 1,
0.0889783, -1.056229, 2.721484, 1, 0, 0, 1, 1,
0.08900079, -0.02668165, 2.132018, 1, 0, 0, 1, 1,
0.09188353, 0.09126872, 0.6535627, 1, 0, 0, 1, 1,
0.09219555, 0.3035323, -0.7981426, 1, 0, 0, 1, 1,
0.09993619, -0.5767355, 3.516884, 1, 0, 0, 1, 1,
0.1034695, -0.07154323, 2.390505, 0, 0, 0, 1, 1,
0.1035346, -0.4931149, 3.506316, 0, 0, 0, 1, 1,
0.1091324, 0.5189868, -0.4007427, 0, 0, 0, 1, 1,
0.1165643, 0.8391182, -0.6540629, 0, 0, 0, 1, 1,
0.1207849, 0.4508379, -1.760736, 0, 0, 0, 1, 1,
0.1228704, -0.9428636, 2.721403, 0, 0, 0, 1, 1,
0.1257228, -0.4758165, 4.230515, 0, 0, 0, 1, 1,
0.1257984, -0.240233, 1.06321, 1, 1, 1, 1, 1,
0.1293141, -0.4602306, 2.582621, 1, 1, 1, 1, 1,
0.1318986, -0.8665659, 3.674396, 1, 1, 1, 1, 1,
0.1323935, 0.3197234, 0.4637131, 1, 1, 1, 1, 1,
0.1327013, -1.385268, 2.426218, 1, 1, 1, 1, 1,
0.1357474, -2.148649, 2.595385, 1, 1, 1, 1, 1,
0.1409095, 1.348363, 1.040302, 1, 1, 1, 1, 1,
0.1540635, 0.06938636, 0.5478595, 1, 1, 1, 1, 1,
0.1550834, 1.1664, 0.6157454, 1, 1, 1, 1, 1,
0.1551095, 0.2755907, -0.7609772, 1, 1, 1, 1, 1,
0.1603923, -0.6478235, 3.465682, 1, 1, 1, 1, 1,
0.1604451, 0.8503298, 0.389264, 1, 1, 1, 1, 1,
0.1631286, 0.360111, 0.4238938, 1, 1, 1, 1, 1,
0.1635009, 2.220851, 0.4556565, 1, 1, 1, 1, 1,
0.1696088, 0.8143848, 0.3598027, 1, 1, 1, 1, 1,
0.1707969, 0.7429436, -0.3661096, 0, 0, 1, 1, 1,
0.1711983, 0.8992292, 0.4507872, 1, 0, 0, 1, 1,
0.1718418, 0.9967116, -0.2548362, 1, 0, 0, 1, 1,
0.1783238, -0.3255914, 3.026483, 1, 0, 0, 1, 1,
0.1795956, 0.5899663, 0.08820219, 1, 0, 0, 1, 1,
0.1816074, -1.601064, 1.49398, 1, 0, 0, 1, 1,
0.1827774, 1.805115, -1.696485, 0, 0, 0, 1, 1,
0.1843839, -0.2414051, 2.864686, 0, 0, 0, 1, 1,
0.1845221, -0.1460031, 1.089869, 0, 0, 0, 1, 1,
0.1893657, -0.5142856, 4.228324, 0, 0, 0, 1, 1,
0.1895031, -0.4234402, 2.573798, 0, 0, 0, 1, 1,
0.1900622, 1.216035, 1.032215, 0, 0, 0, 1, 1,
0.1905358, 0.7880328, -1.293091, 0, 0, 0, 1, 1,
0.1916579, 0.5922466, 1.599274, 1, 1, 1, 1, 1,
0.1921277, -0.1150567, 1.316725, 1, 1, 1, 1, 1,
0.1934996, 0.7539184, 0.05638583, 1, 1, 1, 1, 1,
0.193668, -0.4331316, 2.567262, 1, 1, 1, 1, 1,
0.2024631, 0.1901894, 0.117513, 1, 1, 1, 1, 1,
0.2038646, -0.7825114, 2.035806, 1, 1, 1, 1, 1,
0.2065663, 1.391677, -0.02903241, 1, 1, 1, 1, 1,
0.2069996, -0.1908881, 4.204921, 1, 1, 1, 1, 1,
0.2087327, -0.4249156, 3.306469, 1, 1, 1, 1, 1,
0.2123884, -0.8752313, 2.34024, 1, 1, 1, 1, 1,
0.2125052, -0.5048224, 2.395255, 1, 1, 1, 1, 1,
0.2126075, 0.6279163, 0.9657481, 1, 1, 1, 1, 1,
0.2138701, 0.6936339, 0.4166186, 1, 1, 1, 1, 1,
0.2142012, 2.029204, 1.197936, 1, 1, 1, 1, 1,
0.2148782, -1.336323, 2.578608, 1, 1, 1, 1, 1,
0.2151862, 0.02954912, 2.025388, 0, 0, 1, 1, 1,
0.2171762, -0.6211977, 2.205809, 1, 0, 0, 1, 1,
0.2186243, 0.01377827, 0.864512, 1, 0, 0, 1, 1,
0.2195852, -0.1465021, 1.793528, 1, 0, 0, 1, 1,
0.2250289, 0.4715814, 1.873579, 1, 0, 0, 1, 1,
0.2342057, 1.230356, -0.5687811, 1, 0, 0, 1, 1,
0.2349071, 2.435904, -0.3623899, 0, 0, 0, 1, 1,
0.2352207, -1.117369, 1.598858, 0, 0, 0, 1, 1,
0.2533914, -0.6961639, 1.972721, 0, 0, 0, 1, 1,
0.2551663, -0.4348603, 1.518342, 0, 0, 0, 1, 1,
0.2642402, -1.634696, 2.551109, 0, 0, 0, 1, 1,
0.2663952, -1.649851, 3.263891, 0, 0, 0, 1, 1,
0.2694811, 1.452343, -0.3489741, 0, 0, 0, 1, 1,
0.2735232, -0.3372639, 2.371901, 1, 1, 1, 1, 1,
0.2774943, -1.764888, 3.012731, 1, 1, 1, 1, 1,
0.2802471, -1.177143, 1.680319, 1, 1, 1, 1, 1,
0.2809929, -0.6088948, 2.433022, 1, 1, 1, 1, 1,
0.2811331, 0.3163877, 0.4933343, 1, 1, 1, 1, 1,
0.2827372, -0.4629795, 1.919077, 1, 1, 1, 1, 1,
0.2833551, 0.2323725, 0.426553, 1, 1, 1, 1, 1,
0.2898363, 0.2107302, 2.385339, 1, 1, 1, 1, 1,
0.2916499, -0.1529822, 3.176274, 1, 1, 1, 1, 1,
0.2937966, -0.0769298, 1.983076, 1, 1, 1, 1, 1,
0.2960954, -0.5842897, 2.653103, 1, 1, 1, 1, 1,
0.2988448, -1.385931, 2.843195, 1, 1, 1, 1, 1,
0.3035613, 0.7658105, -0.0202614, 1, 1, 1, 1, 1,
0.307851, -0.3593832, 1.607938, 1, 1, 1, 1, 1,
0.309117, -1.098592, 3.417645, 1, 1, 1, 1, 1,
0.3106814, 0.2891241, 0.4031414, 0, 0, 1, 1, 1,
0.3111543, 1.674546, -1.722435, 1, 0, 0, 1, 1,
0.3160462, -0.3074825, 2.575529, 1, 0, 0, 1, 1,
0.3180708, 1.571169, -0.085434, 1, 0, 0, 1, 1,
0.324282, 1.674247, -0.6762223, 1, 0, 0, 1, 1,
0.3248653, 1.155531, 0.09713735, 1, 0, 0, 1, 1,
0.3289607, 0.4942007, -0.5701069, 0, 0, 0, 1, 1,
0.3301674, -0.1618942, 3.664456, 0, 0, 0, 1, 1,
0.3329685, -0.9637113, 3.020287, 0, 0, 0, 1, 1,
0.335384, 0.4574862, -1.163085, 0, 0, 0, 1, 1,
0.3380264, 0.9865673, -0.1648217, 0, 0, 0, 1, 1,
0.3387243, 1.017788, 2.060181, 0, 0, 0, 1, 1,
0.3392351, 0.663164, -1.412998, 0, 0, 0, 1, 1,
0.3394982, 2.584116, 0.1856324, 1, 1, 1, 1, 1,
0.3402904, -1.352483, 2.301796, 1, 1, 1, 1, 1,
0.3445372, 0.6658163, 0.9085704, 1, 1, 1, 1, 1,
0.3457504, -0.3664372, 3.426675, 1, 1, 1, 1, 1,
0.346976, -0.8516119, 2.761043, 1, 1, 1, 1, 1,
0.3525946, -0.3921024, 2.61449, 1, 1, 1, 1, 1,
0.3603524, 0.5904175, 0.5202963, 1, 1, 1, 1, 1,
0.3657416, -0.1091493, 3.138609, 1, 1, 1, 1, 1,
0.3736109, 0.4526818, 0.6175792, 1, 1, 1, 1, 1,
0.3771329, -0.5177035, 2.911243, 1, 1, 1, 1, 1,
0.3780216, -1.148892, 2.570003, 1, 1, 1, 1, 1,
0.3801545, 0.05708319, 1.204417, 1, 1, 1, 1, 1,
0.3814646, -2.10007, 0.4599235, 1, 1, 1, 1, 1,
0.3827427, -0.7711284, 2.433407, 1, 1, 1, 1, 1,
0.3890405, -1.571481, 3.11609, 1, 1, 1, 1, 1,
0.390978, 0.4717623, 0.2460482, 0, 0, 1, 1, 1,
0.392469, -0.3805485, 0.7922949, 1, 0, 0, 1, 1,
0.3942576, -1.772728, 2.50844, 1, 0, 0, 1, 1,
0.3944858, 0.6681761, -0.5499378, 1, 0, 0, 1, 1,
0.4016249, -0.1289778, 3.417239, 1, 0, 0, 1, 1,
0.4018486, -0.1901974, 0.8731581, 1, 0, 0, 1, 1,
0.4051878, 1.19945, 0.8077126, 0, 0, 0, 1, 1,
0.4120892, -0.934355, 3.219579, 0, 0, 0, 1, 1,
0.420816, -0.4205972, 0.9665851, 0, 0, 0, 1, 1,
0.4222232, -0.4413785, 0.994439, 0, 0, 0, 1, 1,
0.4229674, 0.3130309, 1.049211, 0, 0, 0, 1, 1,
0.4242084, -0.7392865, 1.903337, 0, 0, 0, 1, 1,
0.4247822, 0.9531534, 0.3662432, 0, 0, 0, 1, 1,
0.4273743, 0.7119647, -1.059238, 1, 1, 1, 1, 1,
0.4300505, 0.7435927, 0.5594795, 1, 1, 1, 1, 1,
0.4332985, 0.5118958, 1.185832, 1, 1, 1, 1, 1,
0.433511, -0.5303088, 1.727866, 1, 1, 1, 1, 1,
0.4364445, 2.509773, 0.1957016, 1, 1, 1, 1, 1,
0.4377392, 0.8452526, 0.8106898, 1, 1, 1, 1, 1,
0.4593159, -1.056548, 4.180918, 1, 1, 1, 1, 1,
0.4650125, -0.7745834, 3.00055, 1, 1, 1, 1, 1,
0.4665616, -0.1612414, 3.333138, 1, 1, 1, 1, 1,
0.4689266, -0.501758, 3.358206, 1, 1, 1, 1, 1,
0.4699852, -0.02997764, 0.1503724, 1, 1, 1, 1, 1,
0.473223, -0.7903128, 3.249684, 1, 1, 1, 1, 1,
0.4772919, 0.984131, -0.1692994, 1, 1, 1, 1, 1,
0.4821533, 0.7282453, 2.649324, 1, 1, 1, 1, 1,
0.4841809, 0.1240392, 0.2196758, 1, 1, 1, 1, 1,
0.4874434, 0.6227206, 1.26982, 0, 0, 1, 1, 1,
0.4874606, -0.09181987, 1.288157, 1, 0, 0, 1, 1,
0.4909284, 1.87174, -1.708671, 1, 0, 0, 1, 1,
0.492211, -0.9715974, 3.041801, 1, 0, 0, 1, 1,
0.4956223, 0.2711432, -0.5303316, 1, 0, 0, 1, 1,
0.5034125, 0.7323639, 0.6312081, 1, 0, 0, 1, 1,
0.5045357, 0.04139917, 0.1345393, 0, 0, 0, 1, 1,
0.5051216, 0.286617, -0.3115644, 0, 0, 0, 1, 1,
0.5061879, -0.08812889, 1.124047, 0, 0, 0, 1, 1,
0.5063995, -1.979715, 2.689539, 0, 0, 0, 1, 1,
0.5065974, -0.1672718, 1.999381, 0, 0, 0, 1, 1,
0.5071725, 0.5369481, 1.389247, 0, 0, 0, 1, 1,
0.5078345, 0.576438, -1.196852, 0, 0, 0, 1, 1,
0.5131599, -0.4095013, 3.005426, 1, 1, 1, 1, 1,
0.5149429, 1.305243, 0.1803737, 1, 1, 1, 1, 1,
0.5153943, 1.220578, 1.593498, 1, 1, 1, 1, 1,
0.5175885, -0.1247499, 0.4693221, 1, 1, 1, 1, 1,
0.5213441, 1.706198, 0.7215458, 1, 1, 1, 1, 1,
0.5350078, 0.0988453, 1.516618, 1, 1, 1, 1, 1,
0.5365251, 1.109635, 0.7920376, 1, 1, 1, 1, 1,
0.5423182, -0.7580751, 1.366603, 1, 1, 1, 1, 1,
0.5448947, -0.5776573, 3.45137, 1, 1, 1, 1, 1,
0.5478292, 1.682896, -0.6886711, 1, 1, 1, 1, 1,
0.5527433, 0.4658173, 1.229493, 1, 1, 1, 1, 1,
0.5538151, -0.7646239, 1.587717, 1, 1, 1, 1, 1,
0.5568382, 0.9750714, -0.06257135, 1, 1, 1, 1, 1,
0.5570623, 1.71013, -0.4312226, 1, 1, 1, 1, 1,
0.5572207, -0.005001845, 1.60081, 1, 1, 1, 1, 1,
0.5575391, -0.6149791, 2.692094, 0, 0, 1, 1, 1,
0.5628055, 0.1475644, 1.840444, 1, 0, 0, 1, 1,
0.5632099, 1.171925, -0.3310801, 1, 0, 0, 1, 1,
0.5662486, -0.08627979, 2.070943, 1, 0, 0, 1, 1,
0.5669053, 1.510291, 0.3233003, 1, 0, 0, 1, 1,
0.5669534, -0.5093457, 1.272277, 1, 0, 0, 1, 1,
0.5681409, -0.4308363, 2.060479, 0, 0, 0, 1, 1,
0.5690698, -0.0166798, 2.735891, 0, 0, 0, 1, 1,
0.5703405, -0.4536015, 1.819511, 0, 0, 0, 1, 1,
0.572144, 0.7665879, 0.06861813, 0, 0, 0, 1, 1,
0.5811765, -0.4968857, 2.265524, 0, 0, 0, 1, 1,
0.5818257, -0.9850895, 3.670513, 0, 0, 0, 1, 1,
0.5858619, 0.6021255, 0.08687568, 0, 0, 0, 1, 1,
0.5873398, -0.3659151, 2.959863, 1, 1, 1, 1, 1,
0.5884219, 1.473553, 0.04570998, 1, 1, 1, 1, 1,
0.5978821, -0.2793508, 1.923743, 1, 1, 1, 1, 1,
0.6002188, 0.9859748, -0.3162678, 1, 1, 1, 1, 1,
0.6015547, -1.517125, 0.8098375, 1, 1, 1, 1, 1,
0.6025496, -1.180367, 0.9769334, 1, 1, 1, 1, 1,
0.6037993, 0.4259228, 2.200353, 1, 1, 1, 1, 1,
0.6078104, 1.142316, 0.9426783, 1, 1, 1, 1, 1,
0.6110111, -1.397599, 1.528619, 1, 1, 1, 1, 1,
0.6139754, 1.081798, 1.652208, 1, 1, 1, 1, 1,
0.6187445, 0.02160315, 1.649759, 1, 1, 1, 1, 1,
0.6213728, 0.6939127, 1.103438, 1, 1, 1, 1, 1,
0.6225221, 0.5304457, 0.05651341, 1, 1, 1, 1, 1,
0.6234096, 1.175293, 0.008753977, 1, 1, 1, 1, 1,
0.6303746, -0.8435353, 2.124011, 1, 1, 1, 1, 1,
0.6350831, -1.489875, 2.4857, 0, 0, 1, 1, 1,
0.6389346, -0.1744687, 3.700817, 1, 0, 0, 1, 1,
0.6442897, 0.2132988, -1.166738, 1, 0, 0, 1, 1,
0.6463224, 2.182334, -1.101801, 1, 0, 0, 1, 1,
0.6521966, 0.918186, 1.253071, 1, 0, 0, 1, 1,
0.654949, -0.1542014, 1.489256, 1, 0, 0, 1, 1,
0.6557037, 1.704683, -0.6786474, 0, 0, 0, 1, 1,
0.6586799, 1.842884, 0.9574191, 0, 0, 0, 1, 1,
0.6601105, -0.4702945, 2.467908, 0, 0, 0, 1, 1,
0.6635008, -1.298491, 2.953634, 0, 0, 0, 1, 1,
0.6639109, 0.8052232, 0.5142084, 0, 0, 0, 1, 1,
0.6672938, 0.8342905, 1.583468, 0, 0, 0, 1, 1,
0.6703716, -0.5849305, 3.168111, 0, 0, 0, 1, 1,
0.6722137, 0.2707564, -0.1165854, 1, 1, 1, 1, 1,
0.67335, -0.194615, 1.127008, 1, 1, 1, 1, 1,
0.6802845, 1.053566, 1.621893, 1, 1, 1, 1, 1,
0.6884714, -0.6129575, 4.656938, 1, 1, 1, 1, 1,
0.6885902, 0.6045899, -0.2344744, 1, 1, 1, 1, 1,
0.6892422, 0.1889275, -0.04319434, 1, 1, 1, 1, 1,
0.6908062, 0.9484255, -0.3952875, 1, 1, 1, 1, 1,
0.6924997, 0.5756656, 0.4355499, 1, 1, 1, 1, 1,
0.6929783, -0.4052442, 3.037323, 1, 1, 1, 1, 1,
0.6974391, -0.4383098, 2.068861, 1, 1, 1, 1, 1,
0.699232, 0.07621906, 2.272877, 1, 1, 1, 1, 1,
0.7029337, 0.9941258, -0.1537737, 1, 1, 1, 1, 1,
0.7045541, 1.696605, -0.9915845, 1, 1, 1, 1, 1,
0.7151392, 2.229937, 0.03025279, 1, 1, 1, 1, 1,
0.7154146, 0.7332838, -0.4889154, 1, 1, 1, 1, 1,
0.7226282, -0.7801521, 3.023216, 0, 0, 1, 1, 1,
0.724413, 1.215107, -1.316725, 1, 0, 0, 1, 1,
0.7251106, -0.190831, 2.869252, 1, 0, 0, 1, 1,
0.7258918, -1.795985, 3.635121, 1, 0, 0, 1, 1,
0.7284757, -1.24131, 3.926303, 1, 0, 0, 1, 1,
0.7290025, 1.250726, 0.0143058, 1, 0, 0, 1, 1,
0.7336211, -0.02379264, 1.165314, 0, 0, 0, 1, 1,
0.7418793, 1.139835, -0.3264809, 0, 0, 0, 1, 1,
0.7428538, 1.212938, -1.558412, 0, 0, 0, 1, 1,
0.7466792, -0.09650489, 2.69054, 0, 0, 0, 1, 1,
0.7467349, 0.556865, 0.9780645, 0, 0, 0, 1, 1,
0.7523503, 0.2263813, 2.012202, 0, 0, 0, 1, 1,
0.7565269, -0.1202527, 2.397727, 0, 0, 0, 1, 1,
0.7686135, 0.2372143, -0.1264451, 1, 1, 1, 1, 1,
0.7774999, 1.175975, 0.04135204, 1, 1, 1, 1, 1,
0.781226, 0.9315653, -1.65708, 1, 1, 1, 1, 1,
0.782276, 0.6169991, 0.4806848, 1, 1, 1, 1, 1,
0.783941, -0.01046324, 1.149378, 1, 1, 1, 1, 1,
0.7883928, -0.5686592, 2.660796, 1, 1, 1, 1, 1,
0.7951176, 0.7126521, 2.057851, 1, 1, 1, 1, 1,
0.7984889, -1.152243, 1.677969, 1, 1, 1, 1, 1,
0.8005061, -0.8494968, 1.793217, 1, 1, 1, 1, 1,
0.8020576, 0.138053, 0.8929589, 1, 1, 1, 1, 1,
0.8068615, 0.6537453, 1.853959, 1, 1, 1, 1, 1,
0.8082261, 0.2919196, 1.614233, 1, 1, 1, 1, 1,
0.8177807, 0.1977182, 2.751314, 1, 1, 1, 1, 1,
0.8185766, 0.8925413, 0.3297746, 1, 1, 1, 1, 1,
0.822996, 1.789555, 0.4494168, 1, 1, 1, 1, 1,
0.8242092, -2.720628, 2.750844, 0, 0, 1, 1, 1,
0.8242515, 0.5659081, 1.563782, 1, 0, 0, 1, 1,
0.8263174, -0.8896073, 1.290513, 1, 0, 0, 1, 1,
0.8330206, 1.192643, 0.9906803, 1, 0, 0, 1, 1,
0.8352983, -0.8828038, 2.367375, 1, 0, 0, 1, 1,
0.8391272, -1.112053, 3.652687, 1, 0, 0, 1, 1,
0.8456101, 0.9059743, 0.4883092, 0, 0, 0, 1, 1,
0.8467754, -0.7035745, 3.301376, 0, 0, 0, 1, 1,
0.8508818, -1.265765, 4.711032, 0, 0, 0, 1, 1,
0.8520979, 0.8570691, 0.5670564, 0, 0, 0, 1, 1,
0.856247, 0.04657092, 1.100193, 0, 0, 0, 1, 1,
0.8574326, -1.872132, 3.394965, 0, 0, 0, 1, 1,
0.8577116, 0.2917675, 1.610108, 0, 0, 0, 1, 1,
0.8597286, 0.5083188, 0.5875523, 1, 1, 1, 1, 1,
0.8628293, -0.6223106, 3.040432, 1, 1, 1, 1, 1,
0.8636119, -1.375759, 1.770317, 1, 1, 1, 1, 1,
0.8667394, 0.5810698, 0.7326469, 1, 1, 1, 1, 1,
0.8668997, 0.06783302, 0.7528092, 1, 1, 1, 1, 1,
0.8674684, -0.5750655, 2.702291, 1, 1, 1, 1, 1,
0.8692248, 0.6480716, -0.273108, 1, 1, 1, 1, 1,
0.8699961, -1.010582, 5.18715, 1, 1, 1, 1, 1,
0.8790276, -1.107295, 2.459746, 1, 1, 1, 1, 1,
0.8916258, -0.5810514, 1.771511, 1, 1, 1, 1, 1,
0.8919737, -0.7274711, 3.964182, 1, 1, 1, 1, 1,
0.8949704, 0.8116549, 0.6881977, 1, 1, 1, 1, 1,
0.8991789, -0.08816744, 2.883827, 1, 1, 1, 1, 1,
0.8994691, -0.9036314, 2.322654, 1, 1, 1, 1, 1,
0.9002593, -0.3962149, 3.185911, 1, 1, 1, 1, 1,
0.9013399, 0.6152318, 1.867005, 0, 0, 1, 1, 1,
0.9039437, -0.3499692, 0.3274719, 1, 0, 0, 1, 1,
0.9051886, -0.9894499, 2.021142, 1, 0, 0, 1, 1,
0.9144514, -1.100459, 1.85761, 1, 0, 0, 1, 1,
0.9253094, -0.2759964, 0.633634, 1, 0, 0, 1, 1,
0.9255799, 0.4857495, 2.108202, 1, 0, 0, 1, 1,
0.9298822, -0.5909187, 3.27865, 0, 0, 0, 1, 1,
0.932537, 0.5944816, 2.71746, 0, 0, 0, 1, 1,
0.9372402, -1.808786, 1.139213, 0, 0, 0, 1, 1,
0.9413367, 1.666167, 0.9972882, 0, 0, 0, 1, 1,
0.9434881, -0.5964812, 2.306159, 0, 0, 0, 1, 1,
0.9435133, -1.623131, 1.546608, 0, 0, 0, 1, 1,
0.9476557, 0.3992089, 1.859948, 0, 0, 0, 1, 1,
0.9483465, -0.7777088, 4.201958, 1, 1, 1, 1, 1,
0.9574758, -0.1295386, 0.8470825, 1, 1, 1, 1, 1,
0.9593671, -0.1461309, 1.920045, 1, 1, 1, 1, 1,
0.9627512, -0.9761219, 0.6884705, 1, 1, 1, 1, 1,
0.9639851, -0.9758329, 2.952538, 1, 1, 1, 1, 1,
0.9668847, 0.8095054, 1.881954, 1, 1, 1, 1, 1,
0.9806018, -0.4975335, 1.142387, 1, 1, 1, 1, 1,
0.9827852, 1.083737, 0.3856569, 1, 1, 1, 1, 1,
0.9828461, -0.07187288, 1.276222, 1, 1, 1, 1, 1,
0.9911137, -0.4806675, 2.681567, 1, 1, 1, 1, 1,
0.9922124, 0.3802638, 0.5539215, 1, 1, 1, 1, 1,
0.9922357, -0.4308666, 2.240338, 1, 1, 1, 1, 1,
0.994446, 0.2063891, 1.277722, 1, 1, 1, 1, 1,
1.011004, -0.6717295, 2.448387, 1, 1, 1, 1, 1,
1.013173, 0.1370063, 1.597902, 1, 1, 1, 1, 1,
1.013516, -0.4500178, 2.813616, 0, 0, 1, 1, 1,
1.018488, -0.4010258, 1.425954, 1, 0, 0, 1, 1,
1.023549, -0.3806853, 1.516469, 1, 0, 0, 1, 1,
1.032866, -0.2580054, 2.428319, 1, 0, 0, 1, 1,
1.032934, -0.8225636, 2.65447, 1, 0, 0, 1, 1,
1.034294, -0.3409047, 2.634693, 1, 0, 0, 1, 1,
1.042102, 1.340424, -0.0530366, 0, 0, 0, 1, 1,
1.042116, 0.6726002, 1.196583, 0, 0, 0, 1, 1,
1.045022, -0.82028, 3.110348, 0, 0, 0, 1, 1,
1.045343, 2.108389, 0.9915412, 0, 0, 0, 1, 1,
1.051746, 0.7597627, -0.948733, 0, 0, 0, 1, 1,
1.061631, 0.3497602, 0.4380557, 0, 0, 0, 1, 1,
1.067469, -1.911469, 2.913103, 0, 0, 0, 1, 1,
1.067512, 1.253969, -0.5311179, 1, 1, 1, 1, 1,
1.071965, 1.037411, 0.2966222, 1, 1, 1, 1, 1,
1.073841, 0.6908786, 1.109311, 1, 1, 1, 1, 1,
1.074346, 1.533857, 1.840113, 1, 1, 1, 1, 1,
1.0803, 0.05405869, 1.423946, 1, 1, 1, 1, 1,
1.080578, -0.2511254, 0.3741231, 1, 1, 1, 1, 1,
1.084005, -1.76692, 2.982079, 1, 1, 1, 1, 1,
1.086396, 0.3161402, 0.8385945, 1, 1, 1, 1, 1,
1.087975, 0.3549789, 2.917163, 1, 1, 1, 1, 1,
1.089406, -0.4357425, 1.782587, 1, 1, 1, 1, 1,
1.090808, -0.04759144, 2.266128, 1, 1, 1, 1, 1,
1.092538, -1.349098, 2.770441, 1, 1, 1, 1, 1,
1.097696, -0.4523201, 2.516323, 1, 1, 1, 1, 1,
1.098286, -0.6559525, 2.837458, 1, 1, 1, 1, 1,
1.112967, -0.4460576, 2.381623, 1, 1, 1, 1, 1,
1.120738, -0.3518111, 3.096891, 0, 0, 1, 1, 1,
1.121879, 0.4901727, -0.4128163, 1, 0, 0, 1, 1,
1.123749, 0.1649076, 1.468895, 1, 0, 0, 1, 1,
1.131969, 0.6627003, 1.298562, 1, 0, 0, 1, 1,
1.133633, -0.2726759, 0.6718734, 1, 0, 0, 1, 1,
1.135181, 0.9335391, 1.893206, 1, 0, 0, 1, 1,
1.140415, -0.8471, 3.10711, 0, 0, 0, 1, 1,
1.164273, -0.3314197, 3.702483, 0, 0, 0, 1, 1,
1.169003, -0.3220855, 2.210914, 0, 0, 0, 1, 1,
1.169438, -0.4052951, 1.891719, 0, 0, 0, 1, 1,
1.17098, 2.247204, 0.3626954, 0, 0, 0, 1, 1,
1.175508, 1.470658, 1.751452, 0, 0, 0, 1, 1,
1.184436, 1.108982, 0.8650807, 0, 0, 0, 1, 1,
1.192373, -0.9997644, 1.049523, 1, 1, 1, 1, 1,
1.199565, 0.03717739, 0.03526447, 1, 1, 1, 1, 1,
1.202, 0.2910634, 1.154984, 1, 1, 1, 1, 1,
1.206209, 0.972715, 1.613623, 1, 1, 1, 1, 1,
1.220098, -0.6092919, 2.745257, 1, 1, 1, 1, 1,
1.220502, -1.783637, 3.136422, 1, 1, 1, 1, 1,
1.229247, -0.03538292, 1.826204, 1, 1, 1, 1, 1,
1.236359, 0.06503677, 1.633201, 1, 1, 1, 1, 1,
1.240753, 0.5565055, 2.400995, 1, 1, 1, 1, 1,
1.248042, 0.19073, 0.4062554, 1, 1, 1, 1, 1,
1.265313, -0.6045108, 1.636279, 1, 1, 1, 1, 1,
1.267516, 2.667989, 0.165903, 1, 1, 1, 1, 1,
1.267811, -1.357201, 0.4946809, 1, 1, 1, 1, 1,
1.269552, -0.1292034, 1.506962, 1, 1, 1, 1, 1,
1.273416, -0.573006, 0.2630308, 1, 1, 1, 1, 1,
1.274127, -0.5653203, 2.58858, 0, 0, 1, 1, 1,
1.277612, -0.2953716, 1.78141, 1, 0, 0, 1, 1,
1.279904, -0.7177303, 3.002309, 1, 0, 0, 1, 1,
1.289642, 0.877912, 0.4780415, 1, 0, 0, 1, 1,
1.295, -0.6082398, 1.870107, 1, 0, 0, 1, 1,
1.29793, 0.9207147, 0.5584468, 1, 0, 0, 1, 1,
1.306382, 0.1717792, 1.952286, 0, 0, 0, 1, 1,
1.307099, 0.6457445, 0.3468525, 0, 0, 0, 1, 1,
1.312751, 0.6272349, 3.501621, 0, 0, 0, 1, 1,
1.316881, -0.5788469, 2.99821, 0, 0, 0, 1, 1,
1.317887, 1.165435, -0.8880974, 0, 0, 0, 1, 1,
1.326283, -0.4551765, 1.507163, 0, 0, 0, 1, 1,
1.327524, 0.04470971, 1.129026, 0, 0, 0, 1, 1,
1.332755, 0.1116483, 1.44061, 1, 1, 1, 1, 1,
1.334657, -1.040399, 2.363797, 1, 1, 1, 1, 1,
1.336522, 0.06356768, 2.260658, 1, 1, 1, 1, 1,
1.342049, 0.1697919, 0.2672835, 1, 1, 1, 1, 1,
1.342308, -1.348381, 2.761456, 1, 1, 1, 1, 1,
1.342842, -0.9600331, 1.696792, 1, 1, 1, 1, 1,
1.343311, -1.315147, 1.54066, 1, 1, 1, 1, 1,
1.347793, 0.6751435, 1.680088, 1, 1, 1, 1, 1,
1.34953, -1.246718, 1.193452, 1, 1, 1, 1, 1,
1.359014, -0.4900727, 0.262786, 1, 1, 1, 1, 1,
1.362476, -0.7777694, 2.486081, 1, 1, 1, 1, 1,
1.365564, 0.07725876, 0.005160068, 1, 1, 1, 1, 1,
1.371923, -1.144713, 1.97111, 1, 1, 1, 1, 1,
1.383893, -0.1906279, 2.095333, 1, 1, 1, 1, 1,
1.385855, -1.10065, 0.591389, 1, 1, 1, 1, 1,
1.387221, -0.4802819, 1.293002, 0, 0, 1, 1, 1,
1.387964, -0.04476794, 0.7224548, 1, 0, 0, 1, 1,
1.393334, -1.086268, 1.306847, 1, 0, 0, 1, 1,
1.394301, -0.6549375, 0.9225615, 1, 0, 0, 1, 1,
1.400182, 1.673573, -0.4991865, 1, 0, 0, 1, 1,
1.412255, -0.8782789, 2.965113, 1, 0, 0, 1, 1,
1.433283, -1.31614, 1.571576, 0, 0, 0, 1, 1,
1.433981, -1.076603, 1.546921, 0, 0, 0, 1, 1,
1.440566, 0.9153674, 2.185452, 0, 0, 0, 1, 1,
1.448177, 1.077361, 0.1519825, 0, 0, 0, 1, 1,
1.450294, -0.06426637, 2.242877, 0, 0, 0, 1, 1,
1.462623, -1.579878, 3.611125, 0, 0, 0, 1, 1,
1.467413, -0.2451878, 0.1058258, 0, 0, 0, 1, 1,
1.468367, 2.466039, -1.713015, 1, 1, 1, 1, 1,
1.484705, -0.0871648, 1.85743, 1, 1, 1, 1, 1,
1.50327, -1.33902, 1.531854, 1, 1, 1, 1, 1,
1.512389, 0.3378378, 2.359249, 1, 1, 1, 1, 1,
1.515051, 1.048514, 0.3549257, 1, 1, 1, 1, 1,
1.520725, -0.6646817, 1.547533, 1, 1, 1, 1, 1,
1.523878, 2.453466, -1.140476, 1, 1, 1, 1, 1,
1.52791, 0.03503339, 2.310908, 1, 1, 1, 1, 1,
1.54021, -0.09619886, 0.794758, 1, 1, 1, 1, 1,
1.550708, 0.07119199, 0.9218664, 1, 1, 1, 1, 1,
1.564204, 0.8074861, -0.2726732, 1, 1, 1, 1, 1,
1.565255, -0.4596396, 1.459722, 1, 1, 1, 1, 1,
1.568055, 0.6969954, 2.399895, 1, 1, 1, 1, 1,
1.594691, -0.08530686, -0.1557658, 1, 1, 1, 1, 1,
1.599334, -0.3045303, 1.514475, 1, 1, 1, 1, 1,
1.619709, -0.316727, 1.106782, 0, 0, 1, 1, 1,
1.62932, 0.3233428, 1.567354, 1, 0, 0, 1, 1,
1.63711, 1.387146, 3.98011, 1, 0, 0, 1, 1,
1.646827, 0.2635015, -0.0301739, 1, 0, 0, 1, 1,
1.667041, -0.9568187, 0.2329455, 1, 0, 0, 1, 1,
1.672332, 0.7375577, 1.69318, 1, 0, 0, 1, 1,
1.676515, 0.7592883, 1.49245, 0, 0, 0, 1, 1,
1.680659, 0.08999261, 0.3737068, 0, 0, 0, 1, 1,
1.683117, 0.1559807, 1.08639, 0, 0, 0, 1, 1,
1.688862, -0.392337, 1.161701, 0, 0, 0, 1, 1,
1.707358, -0.1116874, 1.819769, 0, 0, 0, 1, 1,
1.713701, 0.7671328, 1.059175, 0, 0, 0, 1, 1,
1.7271, -0.4716684, 2.226195, 0, 0, 0, 1, 1,
1.738952, 0.888396, 2.623434, 1, 1, 1, 1, 1,
1.740502, -2.181557, 1.286214, 1, 1, 1, 1, 1,
1.751655, 0.4537497, 2.219899, 1, 1, 1, 1, 1,
1.757843, 0.3758233, 1.090719, 1, 1, 1, 1, 1,
1.759279, 1.273628, 1.380924, 1, 1, 1, 1, 1,
1.769618, 0.1156325, 2.152893, 1, 1, 1, 1, 1,
1.78744, -0.443223, 0.6655165, 1, 1, 1, 1, 1,
1.812639, -0.5502734, 2.116668, 1, 1, 1, 1, 1,
1.815115, -0.4062292, 2.097418, 1, 1, 1, 1, 1,
1.821359, -0.461056, 2.047991, 1, 1, 1, 1, 1,
1.828959, 0.5966601, 0.5031505, 1, 1, 1, 1, 1,
1.833122, 0.1550127, 2.683861, 1, 1, 1, 1, 1,
1.85328, 0.8189548, -0.1834096, 1, 1, 1, 1, 1,
1.874955, 0.2804719, 0.951986, 1, 1, 1, 1, 1,
1.935434, 0.6791868, 2.65479, 1, 1, 1, 1, 1,
1.948244, -0.4194623, 0.3505326, 0, 0, 1, 1, 1,
1.951301, 0.07218897, 3.278875, 1, 0, 0, 1, 1,
1.979774, 0.376295, 1.427937, 1, 0, 0, 1, 1,
2.068613, -1.495672, 4.448263, 1, 0, 0, 1, 1,
2.114312, -0.4151573, 1.906074, 1, 0, 0, 1, 1,
2.13234, -0.9036733, 1.058551, 1, 0, 0, 1, 1,
2.138209, -0.2393939, 1.022812, 0, 0, 0, 1, 1,
2.143833, -0.004636317, 2.81767, 0, 0, 0, 1, 1,
2.202998, 1.956854, 2.22678, 0, 0, 0, 1, 1,
2.20676, -0.5104574, 3.93526, 0, 0, 0, 1, 1,
2.240954, 0.3753463, 2.344436, 0, 0, 0, 1, 1,
2.242913, 0.5161353, 3.566735, 0, 0, 0, 1, 1,
2.268903, 0.5098313, 3.169853, 0, 0, 0, 1, 1,
2.433086, 0.5099223, 1.269925, 1, 1, 1, 1, 1,
2.492241, 2.363869, 0.5068706, 1, 1, 1, 1, 1,
2.515863, 1.229817, 1.884172, 1, 1, 1, 1, 1,
2.523279, -0.6471102, 0.5514145, 1, 1, 1, 1, 1,
2.587989, 0.9288854, 1.326978, 1, 1, 1, 1, 1,
2.621363, -0.3314284, 1.937732, 1, 1, 1, 1, 1,
2.874289, -0.09812561, 0.6090332, 1, 1, 1, 1, 1
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
var radius = 9.536524;
var distance = 33.49664;
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
mvMatrix.translate( 0.2863731, -0.05467892, -0.1350155 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49664);
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
