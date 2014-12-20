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
-3.254682, 1.219784, -1.104115, 1, 0, 0, 1,
-3.191062, 0.6865517, 0.3772198, 1, 0.007843138, 0, 1,
-3.02235, -0.5196029, -1.915224, 1, 0.01176471, 0, 1,
-2.895401, 0.9779783, 1.037371, 1, 0.01960784, 0, 1,
-2.384279, -2.237684, -2.157789, 1, 0.02352941, 0, 1,
-2.326844, -2.395028, -1.077886, 1, 0.03137255, 0, 1,
-2.298453, -0.821515, -3.117322, 1, 0.03529412, 0, 1,
-2.207029, -0.2848552, -1.065496, 1, 0.04313726, 0, 1,
-2.135221, -0.4321902, -1.329758, 1, 0.04705882, 0, 1,
-2.118765, -1.592308, -4.239316, 1, 0.05490196, 0, 1,
-2.071302, 0.7900973, -0.6846694, 1, 0.05882353, 0, 1,
-2.04059, -1.144349, -1.579942, 1, 0.06666667, 0, 1,
-2.004835, -0.1197882, -1.801349, 1, 0.07058824, 0, 1,
-2.003088, 0.4995107, -1.243063, 1, 0.07843138, 0, 1,
-1.994143, -0.3170474, -1.842598, 1, 0.08235294, 0, 1,
-1.953889, -0.3512149, -1.853265, 1, 0.09019608, 0, 1,
-1.947845, -0.124031, -1.236167, 1, 0.09411765, 0, 1,
-1.941844, 0.2081837, -0.5580736, 1, 0.1019608, 0, 1,
-1.924814, -0.06010609, -1.967731, 1, 0.1098039, 0, 1,
-1.903576, 0.6124591, 0.3998023, 1, 0.1137255, 0, 1,
-1.878331, 0.1904301, -2.786623, 1, 0.1215686, 0, 1,
-1.866424, -0.4522397, -0.8058132, 1, 0.1254902, 0, 1,
-1.83383, 0.2683843, -1.134054, 1, 0.1333333, 0, 1,
-1.829232, 0.4302837, -2.140981, 1, 0.1372549, 0, 1,
-1.801792, 0.6548996, -1.791475, 1, 0.145098, 0, 1,
-1.786254, 0.9323963, -0.225639, 1, 0.1490196, 0, 1,
-1.781361, 0.4027425, -1.289069, 1, 0.1568628, 0, 1,
-1.778055, -0.8128259, -1.260252, 1, 0.1607843, 0, 1,
-1.774972, 1.172521, -1.132809, 1, 0.1686275, 0, 1,
-1.760387, 0.4809707, -2.091526, 1, 0.172549, 0, 1,
-1.742897, -0.7728064, -1.914019, 1, 0.1803922, 0, 1,
-1.739088, -0.2039125, -1.121338, 1, 0.1843137, 0, 1,
-1.735548, -0.07263221, -1.41598, 1, 0.1921569, 0, 1,
-1.733567, 0.3390344, -2.603462, 1, 0.1960784, 0, 1,
-1.732836, 0.5834023, -0.7853974, 1, 0.2039216, 0, 1,
-1.725102, 0.6939182, -0.8956414, 1, 0.2117647, 0, 1,
-1.707597, 0.8181831, -0.05517248, 1, 0.2156863, 0, 1,
-1.705383, 1.175665, -2.336896, 1, 0.2235294, 0, 1,
-1.693113, -0.01583884, 1.469719, 1, 0.227451, 0, 1,
-1.673874, -0.4098657, -1.353878, 1, 0.2352941, 0, 1,
-1.67375, -0.8881399, -1.829298, 1, 0.2392157, 0, 1,
-1.673734, -0.4281251, -1.653686, 1, 0.2470588, 0, 1,
-1.650814, -0.4218267, -2.208964, 1, 0.2509804, 0, 1,
-1.63389, -0.3933564, -2.254966, 1, 0.2588235, 0, 1,
-1.63242, -0.6390188, -2.40861, 1, 0.2627451, 0, 1,
-1.618956, -0.9856222, -3.706714, 1, 0.2705882, 0, 1,
-1.612378, 0.3893634, -1.044648, 1, 0.2745098, 0, 1,
-1.607002, 0.5641361, 0.5154999, 1, 0.282353, 0, 1,
-1.606226, 0.1214609, -2.755735, 1, 0.2862745, 0, 1,
-1.601811, -1.688961, -1.594013, 1, 0.2941177, 0, 1,
-1.59199, 1.428512, 0.6040185, 1, 0.3019608, 0, 1,
-1.590894, -1.25082, -2.14776, 1, 0.3058824, 0, 1,
-1.573721, 0.7598216, -2.052063, 1, 0.3137255, 0, 1,
-1.567617, -1.124387, -0.3034327, 1, 0.3176471, 0, 1,
-1.551482, 1.385876, -2.372779, 1, 0.3254902, 0, 1,
-1.54021, -0.6084042, -2.186482, 1, 0.3294118, 0, 1,
-1.535746, 0.5144776, -2.482211, 1, 0.3372549, 0, 1,
-1.525685, -1.388911, -2.872881, 1, 0.3411765, 0, 1,
-1.517174, -1.213681, -1.421165, 1, 0.3490196, 0, 1,
-1.510129, -0.7070456, -3.344308, 1, 0.3529412, 0, 1,
-1.490138, -0.4891802, -2.882044, 1, 0.3607843, 0, 1,
-1.487528, 0.3622687, -1.772892, 1, 0.3647059, 0, 1,
-1.484888, -0.902427, -2.21765, 1, 0.372549, 0, 1,
-1.484106, 0.2025653, 0.121804, 1, 0.3764706, 0, 1,
-1.4635, 0.1423898, -1.458912, 1, 0.3843137, 0, 1,
-1.445034, 0.3115603, 0.3367678, 1, 0.3882353, 0, 1,
-1.438808, 0.386203, -1.285764, 1, 0.3960784, 0, 1,
-1.406235, -0.07913014, -1.727595, 1, 0.4039216, 0, 1,
-1.403424, -0.1758253, -2.792041, 1, 0.4078431, 0, 1,
-1.403081, -0.4694556, -1.929745, 1, 0.4156863, 0, 1,
-1.402113, -2.302613, -2.146628, 1, 0.4196078, 0, 1,
-1.393574, 0.09301418, -1.556503, 1, 0.427451, 0, 1,
-1.383926, -0.2874471, -0.1327143, 1, 0.4313726, 0, 1,
-1.37822, -0.4572537, -2.927751, 1, 0.4392157, 0, 1,
-1.371037, -1.097346, -1.481061, 1, 0.4431373, 0, 1,
-1.366563, 0.5956793, -0.03204156, 1, 0.4509804, 0, 1,
-1.354035, 0.5163126, -0.4654804, 1, 0.454902, 0, 1,
-1.352609, 1.356918, 0.383188, 1, 0.4627451, 0, 1,
-1.352532, -1.029297, -2.141893, 1, 0.4666667, 0, 1,
-1.348148, 0.1681839, -0.8914763, 1, 0.4745098, 0, 1,
-1.347764, 0.4381729, -1.45279, 1, 0.4784314, 0, 1,
-1.344779, 1.426854, -0.3368784, 1, 0.4862745, 0, 1,
-1.338929, -1.17997, -1.212621, 1, 0.4901961, 0, 1,
-1.336855, -0.5469859, -1.346644, 1, 0.4980392, 0, 1,
-1.335718, -0.1858841, -2.616312, 1, 0.5058824, 0, 1,
-1.311898, -0.6781927, -2.877694, 1, 0.509804, 0, 1,
-1.308281, -1.359317, -5.653265, 1, 0.5176471, 0, 1,
-1.298655, 0.6684009, -1.391343, 1, 0.5215687, 0, 1,
-1.297711, 0.4362557, -1.670249, 1, 0.5294118, 0, 1,
-1.293821, -0.2856889, -1.778041, 1, 0.5333334, 0, 1,
-1.292188, 0.3776283, -1.059585, 1, 0.5411765, 0, 1,
-1.291365, 0.144343, -2.74924, 1, 0.5450981, 0, 1,
-1.290809, 1.52968, 0.2118155, 1, 0.5529412, 0, 1,
-1.285218, 0.3743372, -1.223026, 1, 0.5568628, 0, 1,
-1.280906, 2.286521, -0.2141156, 1, 0.5647059, 0, 1,
-1.27818, 0.02420894, -2.192456, 1, 0.5686275, 0, 1,
-1.26605, 1.250847, -0.7303903, 1, 0.5764706, 0, 1,
-1.265385, -1.987258, -2.081833, 1, 0.5803922, 0, 1,
-1.258791, 0.7806419, -1.204262, 1, 0.5882353, 0, 1,
-1.257121, -0.06304309, -1.496559, 1, 0.5921569, 0, 1,
-1.250295, -0.3069549, -2.540838, 1, 0.6, 0, 1,
-1.250229, -1.376442, -6.238375, 1, 0.6078432, 0, 1,
-1.244469, 1.399395, 1.96947, 1, 0.6117647, 0, 1,
-1.235758, -0.0212198, -2.511938, 1, 0.6196079, 0, 1,
-1.226311, 0.9259404, -0.7799598, 1, 0.6235294, 0, 1,
-1.220803, 1.10127, -0.6117734, 1, 0.6313726, 0, 1,
-1.219415, -0.8334373, -2.841138, 1, 0.6352941, 0, 1,
-1.219082, 0.02008474, -2.611609, 1, 0.6431373, 0, 1,
-1.217211, 0.7614132, -1.310501, 1, 0.6470588, 0, 1,
-1.198448, 1.550905, -0.7048327, 1, 0.654902, 0, 1,
-1.186776, -0.1200293, -2.409154, 1, 0.6588235, 0, 1,
-1.186503, 1.049663, -1.851638, 1, 0.6666667, 0, 1,
-1.18396, -0.8007751, -3.437636, 1, 0.6705883, 0, 1,
-1.178953, 1.310351, -1.496403, 1, 0.6784314, 0, 1,
-1.175024, -1.281012, -2.040869, 1, 0.682353, 0, 1,
-1.170869, -0.9613247, -0.9207677, 1, 0.6901961, 0, 1,
-1.17029, -0.1452489, -2.488256, 1, 0.6941177, 0, 1,
-1.165789, -0.4448518, -1.240928, 1, 0.7019608, 0, 1,
-1.165645, 0.4143728, -1.822613, 1, 0.7098039, 0, 1,
-1.158441, 0.1251933, -2.506799, 1, 0.7137255, 0, 1,
-1.158216, -1.390052, -1.219011, 1, 0.7215686, 0, 1,
-1.156045, -0.2581316, -1.601039, 1, 0.7254902, 0, 1,
-1.142281, -0.6462469, -1.221122, 1, 0.7333333, 0, 1,
-1.136593, -1.019595, -3.982679, 1, 0.7372549, 0, 1,
-1.132441, 0.6835231, -1.575629, 1, 0.7450981, 0, 1,
-1.131534, -0.2948894, -2.093503, 1, 0.7490196, 0, 1,
-1.131299, -1.818454, -1.653873, 1, 0.7568628, 0, 1,
-1.129047, 0.5334883, -0.03264643, 1, 0.7607843, 0, 1,
-1.123677, 1.473237, -1.56003, 1, 0.7686275, 0, 1,
-1.12049, 1.154042, -1.174341, 1, 0.772549, 0, 1,
-1.11086, 1.296048, -0.9258068, 1, 0.7803922, 0, 1,
-1.103526, -0.7946308, -1.679422, 1, 0.7843137, 0, 1,
-1.102999, 0.1335637, -1.814828, 1, 0.7921569, 0, 1,
-1.102533, -1.153831, -3.848138, 1, 0.7960784, 0, 1,
-1.092442, 0.1084634, -1.842491, 1, 0.8039216, 0, 1,
-1.090501, -0.7174586, -2.81409, 1, 0.8117647, 0, 1,
-1.087749, -0.1583363, -3.959831, 1, 0.8156863, 0, 1,
-1.087271, 0.9024432, 0.6203982, 1, 0.8235294, 0, 1,
-1.085359, 2.38235, -0.4422357, 1, 0.827451, 0, 1,
-1.082041, -1.046371, -2.887257, 1, 0.8352941, 0, 1,
-1.074962, 0.2963276, -1.758713, 1, 0.8392157, 0, 1,
-1.067502, 1.000921, 0.540278, 1, 0.8470588, 0, 1,
-1.061827, 0.4547358, -1.056774, 1, 0.8509804, 0, 1,
-1.061651, -0.449724, -2.602017, 1, 0.8588235, 0, 1,
-1.042534, -0.02132063, -0.9043729, 1, 0.8627451, 0, 1,
-1.03712, -0.8860111, -1.913719, 1, 0.8705882, 0, 1,
-1.035837, -0.615787, -1.711492, 1, 0.8745098, 0, 1,
-1.031433, -2.576924, -2.660825, 1, 0.8823529, 0, 1,
-1.030153, 0.7054783, -0.2823884, 1, 0.8862745, 0, 1,
-1.025593, -0.5387101, -1.449273, 1, 0.8941177, 0, 1,
-1.022642, 0.5124518, -2.35342, 1, 0.8980392, 0, 1,
-1.022329, 2.436581, 0.07492933, 1, 0.9058824, 0, 1,
-1.022222, -1.055684, -2.375583, 1, 0.9137255, 0, 1,
-1.019179, -0.3575628, -1.943026, 1, 0.9176471, 0, 1,
-1.016657, -0.1468189, -0.5775731, 1, 0.9254902, 0, 1,
-1.010898, 1.211243, -0.3217144, 1, 0.9294118, 0, 1,
-1.006328, -0.5184819, -3.531136, 1, 0.9372549, 0, 1,
-0.9961661, 1.041144, -1.315022, 1, 0.9411765, 0, 1,
-0.9957896, 1.43337, -1.442906, 1, 0.9490196, 0, 1,
-0.9952083, 0.6779396, -1.406772, 1, 0.9529412, 0, 1,
-0.9935361, 3.015952, -0.06140695, 1, 0.9607843, 0, 1,
-0.993017, -2.374642, -4.355796, 1, 0.9647059, 0, 1,
-0.9907413, -0.7833933, -2.651692, 1, 0.972549, 0, 1,
-0.9888224, -1.612299, -3.297413, 1, 0.9764706, 0, 1,
-0.9867045, -0.01179631, -2.42855, 1, 0.9843137, 0, 1,
-0.9834322, -0.9301933, -2.170467, 1, 0.9882353, 0, 1,
-0.9805803, -1.945922, -1.935611, 1, 0.9960784, 0, 1,
-0.9799661, -0.4038099, -1.232211, 0.9960784, 1, 0, 1,
-0.9717487, 0.945341, -3.149662, 0.9921569, 1, 0, 1,
-0.9661931, 1.748429, -1.036646, 0.9843137, 1, 0, 1,
-0.9645795, -2.253468, -2.36328, 0.9803922, 1, 0, 1,
-0.9639076, 0.2700895, -2.410331, 0.972549, 1, 0, 1,
-0.9619879, 0.09129959, -1.278211, 0.9686275, 1, 0, 1,
-0.9602216, 0.07974496, -2.195402, 0.9607843, 1, 0, 1,
-0.9570161, -0.9185197, -1.8626, 0.9568627, 1, 0, 1,
-0.9552826, -0.7729798, -2.375859, 0.9490196, 1, 0, 1,
-0.9409406, 0.06602083, -1.940261, 0.945098, 1, 0, 1,
-0.9386872, 0.2547277, -1.767668, 0.9372549, 1, 0, 1,
-0.9327294, 0.7508662, -0.06985742, 0.9333333, 1, 0, 1,
-0.9319124, 0.5847877, 1.131401, 0.9254902, 1, 0, 1,
-0.9298286, 0.3350883, -1.203132, 0.9215686, 1, 0, 1,
-0.9182227, -0.03302853, -2.109932, 0.9137255, 1, 0, 1,
-0.9158072, -0.758182, -4.726971, 0.9098039, 1, 0, 1,
-0.9141993, 0.5251306, -2.221769, 0.9019608, 1, 0, 1,
-0.9116902, -0.1265794, -2.195403, 0.8941177, 1, 0, 1,
-0.9061398, 0.8566086, -0.4749593, 0.8901961, 1, 0, 1,
-0.9004171, -0.7392482, -1.579155, 0.8823529, 1, 0, 1,
-0.8988164, 0.6701323, 0.2407611, 0.8784314, 1, 0, 1,
-0.8949431, 0.1975221, -1.851831, 0.8705882, 1, 0, 1,
-0.891695, 0.3774653, -2.816454, 0.8666667, 1, 0, 1,
-0.8894823, 1.469954, 1.253391, 0.8588235, 1, 0, 1,
-0.8561273, 0.9593844, -0.333032, 0.854902, 1, 0, 1,
-0.849296, 0.5673575, 0.3201908, 0.8470588, 1, 0, 1,
-0.8427911, -0.5782841, -2.99845, 0.8431373, 1, 0, 1,
-0.837047, -1.932393, -2.268639, 0.8352941, 1, 0, 1,
-0.8346051, -0.3393846, -1.001389, 0.8313726, 1, 0, 1,
-0.831084, -1.850549, -0.8695065, 0.8235294, 1, 0, 1,
-0.8298117, -1.420158, -1.128721, 0.8196079, 1, 0, 1,
-0.8273362, -0.05900858, -1.873085, 0.8117647, 1, 0, 1,
-0.8224945, -2.301578, -4.608634, 0.8078431, 1, 0, 1,
-0.8200551, -3.046385, -1.846567, 0.8, 1, 0, 1,
-0.8172452, 0.5416564, 0.4425981, 0.7921569, 1, 0, 1,
-0.8146703, -0.8209067, -2.866141, 0.7882353, 1, 0, 1,
-0.8126325, 0.299539, -3.551145, 0.7803922, 1, 0, 1,
-0.8045462, 0.1800026, 0.6880028, 0.7764706, 1, 0, 1,
-0.8027309, 0.3101106, -1.692307, 0.7686275, 1, 0, 1,
-0.7778859, -0.4347323, -1.110618, 0.7647059, 1, 0, 1,
-0.7762743, -0.738165, -2.134232, 0.7568628, 1, 0, 1,
-0.7762446, -0.644246, -3.231485, 0.7529412, 1, 0, 1,
-0.7742697, -0.5164994, -3.59458, 0.7450981, 1, 0, 1,
-0.7653192, -0.3863254, -3.126404, 0.7411765, 1, 0, 1,
-0.7649055, -1.377217, -2.683737, 0.7333333, 1, 0, 1,
-0.764723, 1.338756, -1.304298, 0.7294118, 1, 0, 1,
-0.7573252, -0.8282008, -4.016347, 0.7215686, 1, 0, 1,
-0.7506798, -0.3163615, -1.358674, 0.7176471, 1, 0, 1,
-0.7492718, 1.004838, 1.671985, 0.7098039, 1, 0, 1,
-0.7411312, 0.3026911, -1.43333, 0.7058824, 1, 0, 1,
-0.737362, -1.494934, -2.528659, 0.6980392, 1, 0, 1,
-0.7347618, -1.007617, -1.91945, 0.6901961, 1, 0, 1,
-0.7326465, -0.02995007, -2.039223, 0.6862745, 1, 0, 1,
-0.7318055, -1.582696, -0.3332714, 0.6784314, 1, 0, 1,
-0.726607, 0.1864935, -1.466066, 0.6745098, 1, 0, 1,
-0.7262804, 1.99628, -1.069816, 0.6666667, 1, 0, 1,
-0.7262641, -1.639023, -3.088911, 0.6627451, 1, 0, 1,
-0.7257445, 1.849616, -1.136132, 0.654902, 1, 0, 1,
-0.7241614, 0.4468262, 0.1708777, 0.6509804, 1, 0, 1,
-0.7231503, -0.1155904, -0.8316927, 0.6431373, 1, 0, 1,
-0.7207665, -0.144847, -1.009945, 0.6392157, 1, 0, 1,
-0.7182516, -1.347538, -3.779328, 0.6313726, 1, 0, 1,
-0.717055, -0.5709246, -2.947503, 0.627451, 1, 0, 1,
-0.7159342, -1.424616, -3.977545, 0.6196079, 1, 0, 1,
-0.7120872, 0.3353711, -1.497323, 0.6156863, 1, 0, 1,
-0.7090276, -1.150651, -2.879969, 0.6078432, 1, 0, 1,
-0.7042224, 1.171168, -0.1362491, 0.6039216, 1, 0, 1,
-0.6997961, -0.3419394, -1.023232, 0.5960785, 1, 0, 1,
-0.6996303, -1.128043, -4.444482, 0.5882353, 1, 0, 1,
-0.6941963, -0.3950229, -0.09448689, 0.5843138, 1, 0, 1,
-0.6891855, 1.409412, -1.748467, 0.5764706, 1, 0, 1,
-0.6883073, -0.751425, -0.5934297, 0.572549, 1, 0, 1,
-0.6871426, 0.6020107, -1.0945, 0.5647059, 1, 0, 1,
-0.6860566, 0.2360421, -0.6893566, 0.5607843, 1, 0, 1,
-0.6717001, 0.3551384, -1.501574, 0.5529412, 1, 0, 1,
-0.6680357, -1.426055, -3.522122, 0.5490196, 1, 0, 1,
-0.6646302, 1.512512, -1.38528, 0.5411765, 1, 0, 1,
-0.6624067, 1.328447, 0.1015821, 0.5372549, 1, 0, 1,
-0.6610959, 0.2214111, -1.628264, 0.5294118, 1, 0, 1,
-0.6596878, 0.3592981, -1.411669, 0.5254902, 1, 0, 1,
-0.6524147, -0.3930499, -1.865821, 0.5176471, 1, 0, 1,
-0.650919, -0.8649577, 0.3063712, 0.5137255, 1, 0, 1,
-0.6495149, 0.465167, -2.577508, 0.5058824, 1, 0, 1,
-0.6428443, -1.175501, -2.616393, 0.5019608, 1, 0, 1,
-0.6318046, 0.746075, -0.8743023, 0.4941176, 1, 0, 1,
-0.6306238, 0.7476084, 0.239255, 0.4862745, 1, 0, 1,
-0.6297716, -0.08424506, -3.23073, 0.4823529, 1, 0, 1,
-0.6285612, 0.4900905, -1.124378, 0.4745098, 1, 0, 1,
-0.6264679, 0.1585381, -1.855016, 0.4705882, 1, 0, 1,
-0.6216688, 0.2276292, -2.266461, 0.4627451, 1, 0, 1,
-0.6213801, 0.1136658, -0.1594394, 0.4588235, 1, 0, 1,
-0.6210347, -0.08375639, -2.100226, 0.4509804, 1, 0, 1,
-0.6150289, -0.2395124, -1.108758, 0.4470588, 1, 0, 1,
-0.609159, -1.055981, -2.215248, 0.4392157, 1, 0, 1,
-0.6065747, 0.2809314, -1.019475, 0.4352941, 1, 0, 1,
-0.6054506, 0.3565482, -0.3919406, 0.427451, 1, 0, 1,
-0.604319, 0.1597606, -1.109447, 0.4235294, 1, 0, 1,
-0.6040345, 0.1092261, -1.802114, 0.4156863, 1, 0, 1,
-0.5993867, 0.9494331, -1.044486, 0.4117647, 1, 0, 1,
-0.5962472, -1.234937, -2.767749, 0.4039216, 1, 0, 1,
-0.595228, 1.15954, -0.7221532, 0.3960784, 1, 0, 1,
-0.5939209, 0.5062995, -0.2807453, 0.3921569, 1, 0, 1,
-0.5924331, 0.6899143, -0.2313392, 0.3843137, 1, 0, 1,
-0.5916487, -0.3667482, -2.997438, 0.3803922, 1, 0, 1,
-0.5806755, -0.258369, -4.277907, 0.372549, 1, 0, 1,
-0.5748362, 0.2306453, 0.01452505, 0.3686275, 1, 0, 1,
-0.5713893, 3.267278, -1.70912, 0.3607843, 1, 0, 1,
-0.567046, -0.8709275, -1.875891, 0.3568628, 1, 0, 1,
-0.5666013, -0.5452191, -3.175931, 0.3490196, 1, 0, 1,
-0.5601678, -0.8758366, -2.243003, 0.345098, 1, 0, 1,
-0.5579634, 0.5400822, 1.448856, 0.3372549, 1, 0, 1,
-0.5578424, 0.8791674, 0.5891271, 0.3333333, 1, 0, 1,
-0.5546169, 0.2548884, -1.327462, 0.3254902, 1, 0, 1,
-0.5520039, -1.254933, -3.413072, 0.3215686, 1, 0, 1,
-0.5497924, -0.9279599, -3.402005, 0.3137255, 1, 0, 1,
-0.5489633, -1.130459, -1.929886, 0.3098039, 1, 0, 1,
-0.5473883, -1.340078, -0.1231236, 0.3019608, 1, 0, 1,
-0.546492, -0.7576039, -3.022404, 0.2941177, 1, 0, 1,
-0.5446758, -0.8423464, -0.8894008, 0.2901961, 1, 0, 1,
-0.5445417, 0.1329377, -1.724848, 0.282353, 1, 0, 1,
-0.5421061, 1.382262, 0.9720867, 0.2784314, 1, 0, 1,
-0.5419978, -0.5045913, -1.068763, 0.2705882, 1, 0, 1,
-0.5417648, 0.652945, 0.6318365, 0.2666667, 1, 0, 1,
-0.540494, 0.06926769, -1.183909, 0.2588235, 1, 0, 1,
-0.5398447, 1.751948, -1.162405, 0.254902, 1, 0, 1,
-0.5368632, 0.088516, -0.2387393, 0.2470588, 1, 0, 1,
-0.5330949, -0.1297683, -3.782137, 0.2431373, 1, 0, 1,
-0.5316143, 1.072116, 2.873725, 0.2352941, 1, 0, 1,
-0.5311977, 1.450081, 0.5963042, 0.2313726, 1, 0, 1,
-0.5247885, 0.07065093, -1.774038, 0.2235294, 1, 0, 1,
-0.5209621, -2.718162, -4.20589, 0.2196078, 1, 0, 1,
-0.5146435, -0.6519809, -3.569741, 0.2117647, 1, 0, 1,
-0.5106409, -0.7074267, -0.86054, 0.2078431, 1, 0, 1,
-0.5089336, 0.7679843, -0.7079534, 0.2, 1, 0, 1,
-0.5036132, 1.048532, -0.5526833, 0.1921569, 1, 0, 1,
-0.5031432, -2.34401, -3.288807, 0.1882353, 1, 0, 1,
-0.5031338, 0.5186898, -2.158231, 0.1803922, 1, 0, 1,
-0.5013415, -0.5279301, -1.495049, 0.1764706, 1, 0, 1,
-0.5003263, 1.052393, -0.6043295, 0.1686275, 1, 0, 1,
-0.490688, -0.1908056, -1.650023, 0.1647059, 1, 0, 1,
-0.4898148, -0.2794674, -3.547745, 0.1568628, 1, 0, 1,
-0.4877675, -0.9843395, -2.407685, 0.1529412, 1, 0, 1,
-0.4859264, 1.420699, 0.04028401, 0.145098, 1, 0, 1,
-0.4743808, -0.9285909, -4.539052, 0.1411765, 1, 0, 1,
-0.4724818, -0.5066228, -4.222363, 0.1333333, 1, 0, 1,
-0.4675144, 1.045789, -0.7336249, 0.1294118, 1, 0, 1,
-0.4664238, -0.5902282, -2.674141, 0.1215686, 1, 0, 1,
-0.4660817, 0.1466813, -1.496218, 0.1176471, 1, 0, 1,
-0.4644392, 0.8163975, 2.600068, 0.1098039, 1, 0, 1,
-0.4570931, 1.139855, 1.164533, 0.1058824, 1, 0, 1,
-0.4554758, 0.5216924, 0.1198785, 0.09803922, 1, 0, 1,
-0.4553825, -1.212467, -2.379424, 0.09019608, 1, 0, 1,
-0.4541403, 0.7349321, 0.09391385, 0.08627451, 1, 0, 1,
-0.453859, 0.3286766, 0.2945022, 0.07843138, 1, 0, 1,
-0.4508267, -0.09323773, -0.2273048, 0.07450981, 1, 0, 1,
-0.4493869, 1.14054, -1.412662, 0.06666667, 1, 0, 1,
-0.4483119, 0.9545037, -1.816631, 0.0627451, 1, 0, 1,
-0.4464858, 0.8673632, 0.4332139, 0.05490196, 1, 0, 1,
-0.4413711, 0.744574, 1.079389, 0.05098039, 1, 0, 1,
-0.4405048, 1.216831, -0.01317207, 0.04313726, 1, 0, 1,
-0.4394459, -1.932071, -4.212893, 0.03921569, 1, 0, 1,
-0.4387431, 1.171168, -0.7055382, 0.03137255, 1, 0, 1,
-0.4372038, -0.1630582, -1.389987, 0.02745098, 1, 0, 1,
-0.4355742, 0.7114778, -1.253519, 0.01960784, 1, 0, 1,
-0.4292868, -1.653063, -4.215956, 0.01568628, 1, 0, 1,
-0.419675, -0.815078, -2.895849, 0.007843138, 1, 0, 1,
-0.4189417, -0.1951809, -3.499287, 0.003921569, 1, 0, 1,
-0.417971, 0.961455, -2.512887, 0, 1, 0.003921569, 1,
-0.4163482, 0.02726441, -2.484998, 0, 1, 0.01176471, 1,
-0.4111857, 0.4579036, -0.63921, 0, 1, 0.01568628, 1,
-0.40383, -0.8870072, -3.310731, 0, 1, 0.02352941, 1,
-0.4032346, 0.3140439, -0.7574642, 0, 1, 0.02745098, 1,
-0.40264, -0.1385957, -1.428979, 0, 1, 0.03529412, 1,
-0.3986188, -0.2062182, -2.871417, 0, 1, 0.03921569, 1,
-0.3985529, -0.4062349, -2.49497, 0, 1, 0.04705882, 1,
-0.3980331, 0.1875519, -1.42058, 0, 1, 0.05098039, 1,
-0.3973776, -0.5412156, -1.861447, 0, 1, 0.05882353, 1,
-0.3964195, -0.4458, -2.792507, 0, 1, 0.0627451, 1,
-0.3963551, 0.2966034, -1.76875, 0, 1, 0.07058824, 1,
-0.392197, -0.2625944, -2.201677, 0, 1, 0.07450981, 1,
-0.3916669, -0.835717, -1.536465, 0, 1, 0.08235294, 1,
-0.390073, -1.46095, -3.084102, 0, 1, 0.08627451, 1,
-0.3893927, -0.9256976, -1.909334, 0, 1, 0.09411765, 1,
-0.3884802, 1.002892, -0.5715548, 0, 1, 0.1019608, 1,
-0.3881631, 0.1998827, -0.1212566, 0, 1, 0.1058824, 1,
-0.3875714, 0.6186454, -0.3552283, 0, 1, 0.1137255, 1,
-0.3873838, 1.079139, 0.5646331, 0, 1, 0.1176471, 1,
-0.3867815, -0.3544239, -2.727426, 0, 1, 0.1254902, 1,
-0.3849543, 0.180358, -1.314633, 0, 1, 0.1294118, 1,
-0.3833845, -1.404633, -2.424883, 0, 1, 0.1372549, 1,
-0.3823853, -0.1059352, -2.348143, 0, 1, 0.1411765, 1,
-0.3745674, 0.5824364, -1.996141, 0, 1, 0.1490196, 1,
-0.3728532, -0.6359901, -3.815264, 0, 1, 0.1529412, 1,
-0.3728388, 0.2748138, -0.3168668, 0, 1, 0.1607843, 1,
-0.3704402, 0.5723468, -0.7069762, 0, 1, 0.1647059, 1,
-0.3672678, 1.847727, 1.907617, 0, 1, 0.172549, 1,
-0.3666615, -1.239789, -2.820513, 0, 1, 0.1764706, 1,
-0.3638829, 0.4056142, -0.932549, 0, 1, 0.1843137, 1,
-0.3504064, -1.69442, -0.2310847, 0, 1, 0.1882353, 1,
-0.3499358, 1.83855, -1.978347, 0, 1, 0.1960784, 1,
-0.3495584, 0.1555448, 0.1820557, 0, 1, 0.2039216, 1,
-0.3473118, -0.4257658, -3.491351, 0, 1, 0.2078431, 1,
-0.344198, 0.8314862, -1.01589, 0, 1, 0.2156863, 1,
-0.339212, -0.4285618, -2.94457, 0, 1, 0.2196078, 1,
-0.3231232, 0.8795391, -0.7399574, 0, 1, 0.227451, 1,
-0.315984, 2.015529, 0.7067249, 0, 1, 0.2313726, 1,
-0.3112891, 0.8278431, -1.393907, 0, 1, 0.2392157, 1,
-0.3106751, -0.8777571, -2.087215, 0, 1, 0.2431373, 1,
-0.303057, -1.539808, -3.688947, 0, 1, 0.2509804, 1,
-0.295263, -0.4657162, -1.544335, 0, 1, 0.254902, 1,
-0.2946661, 0.09272148, -2.063171, 0, 1, 0.2627451, 1,
-0.2934888, -0.8417492, -3.73057, 0, 1, 0.2666667, 1,
-0.2919205, 1.381759, -0.9451921, 0, 1, 0.2745098, 1,
-0.2917663, -0.8062817, -2.65407, 0, 1, 0.2784314, 1,
-0.2910722, 2.166374, 0.1841036, 0, 1, 0.2862745, 1,
-0.2903769, 1.420985, 1.250956, 0, 1, 0.2901961, 1,
-0.2899246, -0.1898856, -3.120763, 0, 1, 0.2980392, 1,
-0.2886391, 1.406801, -0.3108217, 0, 1, 0.3058824, 1,
-0.2874707, -0.1178023, -0.9836984, 0, 1, 0.3098039, 1,
-0.2866087, 0.2923922, -0.9250834, 0, 1, 0.3176471, 1,
-0.28592, 1.041769, 0.05999454, 0, 1, 0.3215686, 1,
-0.2856056, -1.363291, -4.784204, 0, 1, 0.3294118, 1,
-0.2827296, -1.619492, -2.278736, 0, 1, 0.3333333, 1,
-0.2795327, -0.05762451, -2.088866, 0, 1, 0.3411765, 1,
-0.2791801, 0.05721552, -1.779365, 0, 1, 0.345098, 1,
-0.2769397, -0.3000296, -2.405681, 0, 1, 0.3529412, 1,
-0.2762585, -1.465891, -2.856476, 0, 1, 0.3568628, 1,
-0.2760647, -0.6064426, -2.125489, 0, 1, 0.3647059, 1,
-0.2751132, -0.9184583, -3.601591, 0, 1, 0.3686275, 1,
-0.2737253, -0.3791723, -2.321963, 0, 1, 0.3764706, 1,
-0.2628601, 0.4486834, -1.453927, 0, 1, 0.3803922, 1,
-0.2615241, 0.9884745, 0.1540095, 0, 1, 0.3882353, 1,
-0.2589589, 0.7012197, -0.6511002, 0, 1, 0.3921569, 1,
-0.2585874, -0.018785, -2.374334, 0, 1, 0.4, 1,
-0.248925, 1.235053, 0.3889199, 0, 1, 0.4078431, 1,
-0.2469724, -1.329371, -1.803195, 0, 1, 0.4117647, 1,
-0.2466819, 1.806695, 0.733281, 0, 1, 0.4196078, 1,
-0.2449675, -0.285497, -3.000672, 0, 1, 0.4235294, 1,
-0.2437517, -1.933349, -3.508553, 0, 1, 0.4313726, 1,
-0.2431684, -0.8983525, -2.857815, 0, 1, 0.4352941, 1,
-0.2365209, 2.150558, 1.733441, 0, 1, 0.4431373, 1,
-0.2361007, 1.309142, -1.313212, 0, 1, 0.4470588, 1,
-0.2325213, 1.309204, -0.2100182, 0, 1, 0.454902, 1,
-0.2295097, 0.9691858, 1.342555, 0, 1, 0.4588235, 1,
-0.2280992, -0.03714251, -2.110925, 0, 1, 0.4666667, 1,
-0.221924, 1.636269, 0.9356812, 0, 1, 0.4705882, 1,
-0.2177776, -1.292652, -1.948122, 0, 1, 0.4784314, 1,
-0.2157378, -0.4464122, -3.697068, 0, 1, 0.4823529, 1,
-0.2100762, 0.3487428, -1.942725, 0, 1, 0.4901961, 1,
-0.2066731, 0.976251, -0.4085979, 0, 1, 0.4941176, 1,
-0.20549, 0.1436535, -1.646212, 0, 1, 0.5019608, 1,
-0.2045836, 1.51743, -0.9822928, 0, 1, 0.509804, 1,
-0.2017533, -0.3846484, -2.168251, 0, 1, 0.5137255, 1,
-0.201061, -1.436727, -2.985795, 0, 1, 0.5215687, 1,
-0.2004445, -0.7818487, -3.906137, 0, 1, 0.5254902, 1,
-0.1999093, 0.6040556, 1.140793, 0, 1, 0.5333334, 1,
-0.1971056, -0.94986, -3.220479, 0, 1, 0.5372549, 1,
-0.1965909, 1.985636, 0.1905125, 0, 1, 0.5450981, 1,
-0.1960485, 0.9731247, -0.901275, 0, 1, 0.5490196, 1,
-0.1917146, -0.2477594, -2.536911, 0, 1, 0.5568628, 1,
-0.1910979, -1.32787, -1.709929, 0, 1, 0.5607843, 1,
-0.1862097, 0.4999854, -0.3301636, 0, 1, 0.5686275, 1,
-0.1828495, -0.3049932, -4.180663, 0, 1, 0.572549, 1,
-0.1823901, 0.4817032, -1.035743, 0, 1, 0.5803922, 1,
-0.1818755, 1.289845, -0.1101673, 0, 1, 0.5843138, 1,
-0.1816661, -0.395804, -1.553485, 0, 1, 0.5921569, 1,
-0.1813617, 0.9834171, -1.550716, 0, 1, 0.5960785, 1,
-0.1808266, -0.645614, -2.645476, 0, 1, 0.6039216, 1,
-0.1791767, 0.08218022, -1.217943, 0, 1, 0.6117647, 1,
-0.1779817, -0.8792323, -3.920924, 0, 1, 0.6156863, 1,
-0.1778039, -0.4302011, -2.845185, 0, 1, 0.6235294, 1,
-0.1770791, 0.5143375, -0.4786053, 0, 1, 0.627451, 1,
-0.1738741, -1.574887, -5.039034, 0, 1, 0.6352941, 1,
-0.1698364, -1.116497, -4.003844, 0, 1, 0.6392157, 1,
-0.1655663, -0.04181392, -2.024807, 0, 1, 0.6470588, 1,
-0.1647778, -0.7798812, -3.091561, 0, 1, 0.6509804, 1,
-0.159659, 0.5315754, -1.589377, 0, 1, 0.6588235, 1,
-0.1540221, 0.4626634, -0.4477524, 0, 1, 0.6627451, 1,
-0.153477, 0.7844893, 0.5097083, 0, 1, 0.6705883, 1,
-0.153263, -0.3134142, -1.737218, 0, 1, 0.6745098, 1,
-0.1478366, -0.7816963, -3.073046, 0, 1, 0.682353, 1,
-0.1458882, 0.1913586, -1.469896, 0, 1, 0.6862745, 1,
-0.1437447, 1.51728, -0.2474875, 0, 1, 0.6941177, 1,
-0.1426682, -0.006230019, -2.553647, 0, 1, 0.7019608, 1,
-0.1373324, -0.8288845, -3.816731, 0, 1, 0.7058824, 1,
-0.1373009, -0.7740904, -3.440817, 0, 1, 0.7137255, 1,
-0.1357555, -0.835776, -3.027472, 0, 1, 0.7176471, 1,
-0.132573, -1.321342, -2.392351, 0, 1, 0.7254902, 1,
-0.1270072, -1.302499, -2.518398, 0, 1, 0.7294118, 1,
-0.124078, -1.492525, -2.466277, 0, 1, 0.7372549, 1,
-0.1231757, 0.04157207, -0.5257831, 0, 1, 0.7411765, 1,
-0.1231216, -0.09213071, -2.461536, 0, 1, 0.7490196, 1,
-0.1168152, 0.8290654, -2.441937, 0, 1, 0.7529412, 1,
-0.1163402, 0.2450683, -0.8270482, 0, 1, 0.7607843, 1,
-0.1159617, 0.05270842, -2.365518, 0, 1, 0.7647059, 1,
-0.1124951, 0.9455181, -0.6580569, 0, 1, 0.772549, 1,
-0.1059626, 0.07735401, -1.56555, 0, 1, 0.7764706, 1,
-0.1049524, -1.875082, -0.7140076, 0, 1, 0.7843137, 1,
-0.1025821, 1.887126, -0.128517, 0, 1, 0.7882353, 1,
-0.09924335, 0.4916354, -0.712655, 0, 1, 0.7960784, 1,
-0.09858362, 0.3676353, -0.9135249, 0, 1, 0.8039216, 1,
-0.09555948, -0.1053779, -1.678387, 0, 1, 0.8078431, 1,
-0.0948826, -0.2591029, -1.882636, 0, 1, 0.8156863, 1,
-0.09028357, -1.788409, -5.283294, 0, 1, 0.8196079, 1,
-0.08631284, -0.800436, -2.537023, 0, 1, 0.827451, 1,
-0.08546474, 0.387069, 0.3317119, 0, 1, 0.8313726, 1,
-0.08422685, 1.351526, -0.07423903, 0, 1, 0.8392157, 1,
-0.08231613, 1.922345, -1.083368, 0, 1, 0.8431373, 1,
-0.07710339, 0.3562217, -0.8854202, 0, 1, 0.8509804, 1,
-0.06907571, 0.1277393, -0.4471507, 0, 1, 0.854902, 1,
-0.06566185, -1.46173, -4.658041, 0, 1, 0.8627451, 1,
-0.06511873, -0.6904744, -3.617191, 0, 1, 0.8666667, 1,
-0.06365553, -0.048707, -3.802911, 0, 1, 0.8745098, 1,
-0.05957787, 0.009494561, -0.07478274, 0, 1, 0.8784314, 1,
-0.05744037, -0.5075794, -3.24605, 0, 1, 0.8862745, 1,
-0.05485511, 2.458941, -0.7533181, 0, 1, 0.8901961, 1,
-0.05384504, -0.4596823, -4.178837, 0, 1, 0.8980392, 1,
-0.05378911, -0.5169796, -3.021054, 0, 1, 0.9058824, 1,
-0.05221009, 0.2673243, -2.91411, 0, 1, 0.9098039, 1,
-0.05067421, -0.4108888, -3.888662, 0, 1, 0.9176471, 1,
-0.04743143, 0.5404466, -1.480997, 0, 1, 0.9215686, 1,
-0.04398558, 0.09406663, -0.29851, 0, 1, 0.9294118, 1,
-0.04164372, -0.3415317, -1.546221, 0, 1, 0.9333333, 1,
-0.04025503, -0.5018867, -3.338598, 0, 1, 0.9411765, 1,
-0.03960094, 0.4236567, -0.6698493, 0, 1, 0.945098, 1,
-0.03930388, -0.4629872, -3.780844, 0, 1, 0.9529412, 1,
-0.03915069, -0.004581596, -3.558757, 0, 1, 0.9568627, 1,
-0.03739336, 1.688099, 0.4852265, 0, 1, 0.9647059, 1,
-0.0362457, -0.8415185, -3.143392, 0, 1, 0.9686275, 1,
-0.03544615, 0.5631943, -0.056763, 0, 1, 0.9764706, 1,
-0.03162676, 0.4070661, -0.375593, 0, 1, 0.9803922, 1,
-0.0286695, -0.002843504, -2.576776, 0, 1, 0.9882353, 1,
-0.02725111, -2.062073, -3.444697, 0, 1, 0.9921569, 1,
-0.02197273, 0.8009987, -0.2725021, 0, 1, 1, 1,
-0.01754273, 0.5222135, -0.08302969, 0, 0.9921569, 1, 1,
-0.01717803, 0.5785832, 0.5939713, 0, 0.9882353, 1, 1,
-0.01308613, -0.4478357, -3.438166, 0, 0.9803922, 1, 1,
-0.008712285, 0.1874334, 1.079232, 0, 0.9764706, 1, 1,
-0.003865949, -1.433721, -2.891201, 0, 0.9686275, 1, 1,
-0.003506975, 0.6288399, -0.3884961, 0, 0.9647059, 1, 1,
0.001753529, -0.9455776, 1.842171, 0, 0.9568627, 1, 1,
0.005515207, 0.7698414, 0.2832156, 0, 0.9529412, 1, 1,
0.006405513, -0.5430147, 2.615275, 0, 0.945098, 1, 1,
0.009727275, 0.1255747, -0.2852915, 0, 0.9411765, 1, 1,
0.01007422, -2.646677, 3.645578, 0, 0.9333333, 1, 1,
0.01592515, -0.262295, 3.394598, 0, 0.9294118, 1, 1,
0.01708042, -2.773188, 3.686753, 0, 0.9215686, 1, 1,
0.01801811, -1.441261, 4.129567, 0, 0.9176471, 1, 1,
0.01833366, -0.605939, 3.624876, 0, 0.9098039, 1, 1,
0.01898104, -0.07939532, 2.784382, 0, 0.9058824, 1, 1,
0.01994843, 1.759489, 0.356678, 0, 0.8980392, 1, 1,
0.02214647, 0.4361258, -0.2485391, 0, 0.8901961, 1, 1,
0.02455645, 1.440402, 0.8707221, 0, 0.8862745, 1, 1,
0.02474543, 0.8634672, -0.2429415, 0, 0.8784314, 1, 1,
0.02763571, -0.234359, 3.408202, 0, 0.8745098, 1, 1,
0.03311757, -0.4463856, 3.329086, 0, 0.8666667, 1, 1,
0.03366716, 1.736485, 1.916934, 0, 0.8627451, 1, 1,
0.03799896, 0.8466057, 1.09462, 0, 0.854902, 1, 1,
0.04483129, 0.1358118, -0.1653378, 0, 0.8509804, 1, 1,
0.04486595, 0.1818271, -0.5816809, 0, 0.8431373, 1, 1,
0.04523355, 0.1983918, -0.04735122, 0, 0.8392157, 1, 1,
0.04711806, -0.6129167, 3.156713, 0, 0.8313726, 1, 1,
0.05112776, -0.09663083, 2.71513, 0, 0.827451, 1, 1,
0.05193891, 1.23221, -0.04491299, 0, 0.8196079, 1, 1,
0.05490323, 0.3391956, 2.097136, 0, 0.8156863, 1, 1,
0.06246249, 0.8994488, -0.06708302, 0, 0.8078431, 1, 1,
0.06354275, 0.8677511, 1.439672, 0, 0.8039216, 1, 1,
0.06623372, 0.8945295, 0.4426408, 0, 0.7960784, 1, 1,
0.06779089, -1.015983, 1.607844, 0, 0.7882353, 1, 1,
0.06845951, 0.3742926, 0.888011, 0, 0.7843137, 1, 1,
0.07277834, -0.5540776, 3.737483, 0, 0.7764706, 1, 1,
0.07658532, -0.5319765, 3.329274, 0, 0.772549, 1, 1,
0.0796625, -0.3167557, 2.399789, 0, 0.7647059, 1, 1,
0.0802042, -1.652416, 1.773437, 0, 0.7607843, 1, 1,
0.08385112, -0.2819153, 2.116671, 0, 0.7529412, 1, 1,
0.09175855, 1.539119, 0.8325586, 0, 0.7490196, 1, 1,
0.09771504, -0.7525495, 2.459064, 0, 0.7411765, 1, 1,
0.1042024, 0.4678857, 0.6154561, 0, 0.7372549, 1, 1,
0.104403, -1.108377, 2.787488, 0, 0.7294118, 1, 1,
0.1051877, -0.5604219, 2.683821, 0, 0.7254902, 1, 1,
0.1056374, -0.849171, 2.858612, 0, 0.7176471, 1, 1,
0.1076587, 0.9774055, 0.5621149, 0, 0.7137255, 1, 1,
0.1078338, -0.4075977, 3.492138, 0, 0.7058824, 1, 1,
0.1141059, -2.896097, 3.000596, 0, 0.6980392, 1, 1,
0.1146259, -0.09258461, 0.9837819, 0, 0.6941177, 1, 1,
0.1154985, 0.8970454, -1.192496, 0, 0.6862745, 1, 1,
0.1209432, -0.1701661, 2.318625, 0, 0.682353, 1, 1,
0.1226441, -1.042858, 4.222728, 0, 0.6745098, 1, 1,
0.1227829, 0.4495028, 1.224415, 0, 0.6705883, 1, 1,
0.1262439, -1.053129, 2.541126, 0, 0.6627451, 1, 1,
0.1269401, -2.425914, 2.995863, 0, 0.6588235, 1, 1,
0.1312488, -0.3734383, 2.612657, 0, 0.6509804, 1, 1,
0.131473, -0.9299396, 2.914365, 0, 0.6470588, 1, 1,
0.1335391, 1.362001, 3.268147, 0, 0.6392157, 1, 1,
0.1388227, -1.283594, 1.323654, 0, 0.6352941, 1, 1,
0.1470798, -1.252441, 3.415494, 0, 0.627451, 1, 1,
0.1481123, -0.102827, 3.217082, 0, 0.6235294, 1, 1,
0.1533927, 1.247378, 1.422904, 0, 0.6156863, 1, 1,
0.1541044, -0.7654005, 3.878269, 0, 0.6117647, 1, 1,
0.1616011, 1.458928, -0.7797304, 0, 0.6039216, 1, 1,
0.1624187, -0.702876, 2.873552, 0, 0.5960785, 1, 1,
0.1632409, -1.160402, 3.170824, 0, 0.5921569, 1, 1,
0.1643263, 1.342223, -0.342186, 0, 0.5843138, 1, 1,
0.1673633, -0.2783519, 2.246569, 0, 0.5803922, 1, 1,
0.1705202, 0.2075071, -0.1197529, 0, 0.572549, 1, 1,
0.1755936, -1.4933, 3.79791, 0, 0.5686275, 1, 1,
0.1847638, -1.282402, 3.357084, 0, 0.5607843, 1, 1,
0.1870846, 0.4759685, 1.484131, 0, 0.5568628, 1, 1,
0.1903656, -0.4626538, 1.841827, 0, 0.5490196, 1, 1,
0.1906502, -1.392876, 3.137376, 0, 0.5450981, 1, 1,
0.1921698, 0.3801862, -0.1634719, 0, 0.5372549, 1, 1,
0.1926361, -1.116571, 3.064291, 0, 0.5333334, 1, 1,
0.1934564, 0.7323024, 1.710588, 0, 0.5254902, 1, 1,
0.1945204, 0.910468, -1.031765, 0, 0.5215687, 1, 1,
0.197129, 0.29201, 0.650014, 0, 0.5137255, 1, 1,
0.1982649, -1.311936, 5.372879, 0, 0.509804, 1, 1,
0.2051654, -1.543761, 2.146591, 0, 0.5019608, 1, 1,
0.2052176, 0.9461845, 0.445009, 0, 0.4941176, 1, 1,
0.2099813, -0.9794534, 1.566509, 0, 0.4901961, 1, 1,
0.2100489, -1.688216, 2.783711, 0, 0.4823529, 1, 1,
0.2106211, -0.4386993, 4.752797, 0, 0.4784314, 1, 1,
0.2110362, -0.4090308, 1.932597, 0, 0.4705882, 1, 1,
0.2123449, 0.993636, 0.8608536, 0, 0.4666667, 1, 1,
0.2126406, 0.1259447, 0.253947, 0, 0.4588235, 1, 1,
0.2137233, -0.6295754, 2.069248, 0, 0.454902, 1, 1,
0.2158668, -1.00466, 2.808428, 0, 0.4470588, 1, 1,
0.2178306, 2.205521, 2.381582, 0, 0.4431373, 1, 1,
0.2180148, -0.7904552, 2.54835, 0, 0.4352941, 1, 1,
0.2187796, 1.509833, 1.690907, 0, 0.4313726, 1, 1,
0.221208, -0.4460853, 0.9826674, 0, 0.4235294, 1, 1,
0.2258151, 2.309495, -0.904852, 0, 0.4196078, 1, 1,
0.226917, -1.324942, 4.341924, 0, 0.4117647, 1, 1,
0.2285617, 0.7615312, 0.4498227, 0, 0.4078431, 1, 1,
0.233435, 0.9434333, 0.6749575, 0, 0.4, 1, 1,
0.2376423, 0.4408058, -0.5471748, 0, 0.3921569, 1, 1,
0.2386842, -0.2846021, 1.392414, 0, 0.3882353, 1, 1,
0.2545356, -0.01333908, 1.779945, 0, 0.3803922, 1, 1,
0.2551232, 0.2427136, -0.6200781, 0, 0.3764706, 1, 1,
0.2647713, 1.783787, -0.5320805, 0, 0.3686275, 1, 1,
0.2655397, 0.5481405, 2.032941, 0, 0.3647059, 1, 1,
0.2689781, 0.9102952, 0.6045725, 0, 0.3568628, 1, 1,
0.2710477, 0.3909145, 0.2315664, 0, 0.3529412, 1, 1,
0.2731233, -0.8448549, 2.630878, 0, 0.345098, 1, 1,
0.2737501, 0.3145725, 0.492441, 0, 0.3411765, 1, 1,
0.2751614, -0.03918733, -0.3882613, 0, 0.3333333, 1, 1,
0.2762046, 0.07276785, 2.331531, 0, 0.3294118, 1, 1,
0.2835025, 0.4390514, 0.1046947, 0, 0.3215686, 1, 1,
0.286561, 0.8921747, -1.106599, 0, 0.3176471, 1, 1,
0.288539, -1.024021, 3.116251, 0, 0.3098039, 1, 1,
0.2948819, -0.2929711, 1.890543, 0, 0.3058824, 1, 1,
0.2965507, -1.493226, 2.578349, 0, 0.2980392, 1, 1,
0.2969744, 0.0641522, 1.711965, 0, 0.2901961, 1, 1,
0.2972964, 0.7564161, 0.4866948, 0, 0.2862745, 1, 1,
0.2981443, -1.462825, 1.39573, 0, 0.2784314, 1, 1,
0.2992873, -0.1793533, 2.660769, 0, 0.2745098, 1, 1,
0.3003049, 0.4640818, -1.222013, 0, 0.2666667, 1, 1,
0.3049156, -0.01000225, 0.9946072, 0, 0.2627451, 1, 1,
0.3052745, 1.66675, 0.02097084, 0, 0.254902, 1, 1,
0.3076922, -1.390341, 3.013613, 0, 0.2509804, 1, 1,
0.3077269, -0.3697103, 3.065975, 0, 0.2431373, 1, 1,
0.311762, -1.598677, 2.657691, 0, 0.2392157, 1, 1,
0.3133664, 0.4303294, -0.04908026, 0, 0.2313726, 1, 1,
0.3161901, -0.1881341, 2.629024, 0, 0.227451, 1, 1,
0.3188324, 0.5049848, 0.9869707, 0, 0.2196078, 1, 1,
0.3219695, 0.3296236, 0.9882134, 0, 0.2156863, 1, 1,
0.3236589, 1.145018, 2.565405, 0, 0.2078431, 1, 1,
0.3255044, 0.2835371, 0.3219727, 0, 0.2039216, 1, 1,
0.3271923, -0.1498983, 3.15482, 0, 0.1960784, 1, 1,
0.3346307, -0.729511, 1.590189, 0, 0.1882353, 1, 1,
0.3375682, 0.3488787, 0.8758873, 0, 0.1843137, 1, 1,
0.3392651, 0.7534886, 1.286114, 0, 0.1764706, 1, 1,
0.3424911, -0.08927087, 4.930911, 0, 0.172549, 1, 1,
0.3436173, -2.738683, 3.528775, 0, 0.1647059, 1, 1,
0.3484151, 1.419633, -0.7155121, 0, 0.1607843, 1, 1,
0.3499968, 0.4983103, 1.756307, 0, 0.1529412, 1, 1,
0.3514003, 0.2080318, 0.4673632, 0, 0.1490196, 1, 1,
0.3592303, 1.061689, -0.766353, 0, 0.1411765, 1, 1,
0.3619552, 1.070143, -0.3174194, 0, 0.1372549, 1, 1,
0.3620427, -0.904487, 2.810905, 0, 0.1294118, 1, 1,
0.3641071, 0.4261613, 0.6315582, 0, 0.1254902, 1, 1,
0.3646649, -2.531402, 3.353033, 0, 0.1176471, 1, 1,
0.3764559, -0.6690378, 1.64096, 0, 0.1137255, 1, 1,
0.379189, -0.8287236, 3.226986, 0, 0.1058824, 1, 1,
0.3809879, -0.1796826, 1.456082, 0, 0.09803922, 1, 1,
0.3817366, 1.915723, 1.329879, 0, 0.09411765, 1, 1,
0.3821452, 0.861618, 0.4984683, 0, 0.08627451, 1, 1,
0.3831306, -0.6951801, 2.074928, 0, 0.08235294, 1, 1,
0.3884509, 0.2560987, 1.366888, 0, 0.07450981, 1, 1,
0.3936415, -1.090881, 3.251282, 0, 0.07058824, 1, 1,
0.3971652, -0.9355831, 3.292841, 0, 0.0627451, 1, 1,
0.3999991, 0.2357792, 0.06480667, 0, 0.05882353, 1, 1,
0.400442, -1.895823, 2.151146, 0, 0.05098039, 1, 1,
0.400875, -0.796019, 1.855626, 0, 0.04705882, 1, 1,
0.4119906, -2.217996, 3.874928, 0, 0.03921569, 1, 1,
0.4162525, -1.514131, 2.102712, 0, 0.03529412, 1, 1,
0.4200736, -0.841147, 2.782582, 0, 0.02745098, 1, 1,
0.4218201, 0.6862875, -0.07967076, 0, 0.02352941, 1, 1,
0.4218709, -1.112067, 1.513259, 0, 0.01568628, 1, 1,
0.4253787, -1.347094, 3.593152, 0, 0.01176471, 1, 1,
0.4255594, 0.9613803, -0.5847702, 0, 0.003921569, 1, 1,
0.4459141, 1.308496, 0.4923389, 0.003921569, 0, 1, 1,
0.4468993, -1.732449, 2.366018, 0.007843138, 0, 1, 1,
0.4513076, 1.006547, 0.8020967, 0.01568628, 0, 1, 1,
0.4524624, 0.2759005, 1.163864, 0.01960784, 0, 1, 1,
0.4525841, -1.169591, 3.766266, 0.02745098, 0, 1, 1,
0.4531246, -2.11637, 3.215395, 0.03137255, 0, 1, 1,
0.4565875, 0.7158013, 0.04029961, 0.03921569, 0, 1, 1,
0.4567028, -1.242512, 2.721183, 0.04313726, 0, 1, 1,
0.4600243, -0.04942783, 1.765839, 0.05098039, 0, 1, 1,
0.470695, 1.79648, -0.2711622, 0.05490196, 0, 1, 1,
0.4731973, 0.400863, 1.098211, 0.0627451, 0, 1, 1,
0.4736966, 0.3289095, 1.748416, 0.06666667, 0, 1, 1,
0.4743865, -1.170401, 4.112739, 0.07450981, 0, 1, 1,
0.4760786, 0.1659456, 2.708132, 0.07843138, 0, 1, 1,
0.4826543, -0.8310954, 3.050224, 0.08627451, 0, 1, 1,
0.4937963, -1.112552, 1.857621, 0.09019608, 0, 1, 1,
0.4980616, 0.09605554, -0.4386905, 0.09803922, 0, 1, 1,
0.5019417, 0.7202362, 0.3265246, 0.1058824, 0, 1, 1,
0.5084403, -0.3332113, 1.496007, 0.1098039, 0, 1, 1,
0.5116998, -0.02933684, 1.430656, 0.1176471, 0, 1, 1,
0.5120061, -0.9995227, 2.132729, 0.1215686, 0, 1, 1,
0.5159801, 0.3695467, 1.760163, 0.1294118, 0, 1, 1,
0.5183113, 0.04985969, 2.387751, 0.1333333, 0, 1, 1,
0.5203905, -1.45294, 3.70336, 0.1411765, 0, 1, 1,
0.521654, -0.4740132, 3.186826, 0.145098, 0, 1, 1,
0.5268191, 1.074235, -1.045464, 0.1529412, 0, 1, 1,
0.5289198, -0.227151, 2.67646, 0.1568628, 0, 1, 1,
0.5339532, 0.8429915, 1.556042, 0.1647059, 0, 1, 1,
0.5405384, 0.3234494, 0.5723037, 0.1686275, 0, 1, 1,
0.5421005, -0.6673906, 2.123179, 0.1764706, 0, 1, 1,
0.5422412, 0.4887155, 1.756214, 0.1803922, 0, 1, 1,
0.545027, 0.1362205, 1.320749, 0.1882353, 0, 1, 1,
0.5455098, 1.292275, 0.4036504, 0.1921569, 0, 1, 1,
0.5473058, -0.679732, 2.46361, 0.2, 0, 1, 1,
0.5473523, -0.5799239, 2.566475, 0.2078431, 0, 1, 1,
0.5506958, -1.387453, 4.839, 0.2117647, 0, 1, 1,
0.5512444, -1.133703, 1.66967, 0.2196078, 0, 1, 1,
0.5521736, -0.1753297, 3.411027, 0.2235294, 0, 1, 1,
0.5573075, -2.218883, 4.23621, 0.2313726, 0, 1, 1,
0.5650222, 0.2726729, 1.699418, 0.2352941, 0, 1, 1,
0.5771831, -0.05641878, 0.7665198, 0.2431373, 0, 1, 1,
0.5810739, 0.4610665, -0.1232545, 0.2470588, 0, 1, 1,
0.5822306, -0.4378197, 4.152132, 0.254902, 0, 1, 1,
0.5868844, -0.9486927, 2.534961, 0.2588235, 0, 1, 1,
0.5882396, -0.3924227, 2.153329, 0.2666667, 0, 1, 1,
0.5896004, 0.1033419, 1.202756, 0.2705882, 0, 1, 1,
0.5966592, 0.5752015, 0.3365201, 0.2784314, 0, 1, 1,
0.5966674, -0.479667, 2.017972, 0.282353, 0, 1, 1,
0.5972601, 0.1454764, 1.796324, 0.2901961, 0, 1, 1,
0.60119, 0.4720713, 0.5058982, 0.2941177, 0, 1, 1,
0.6048073, -1.988426, 1.907647, 0.3019608, 0, 1, 1,
0.6110045, 0.2490521, 1.550795, 0.3098039, 0, 1, 1,
0.6112289, 0.3095646, -0.1220329, 0.3137255, 0, 1, 1,
0.6125203, 0.1694684, 0.5549517, 0.3215686, 0, 1, 1,
0.6158159, 0.3487987, -0.2656864, 0.3254902, 0, 1, 1,
0.6162076, 0.7395174, 0.9016657, 0.3333333, 0, 1, 1,
0.6166603, -0.7521635, 4.493684, 0.3372549, 0, 1, 1,
0.6224136, 0.5667203, 1.308077, 0.345098, 0, 1, 1,
0.6252556, -0.9994671, 1.053128, 0.3490196, 0, 1, 1,
0.6314026, 0.8326399, -0.3193644, 0.3568628, 0, 1, 1,
0.6322094, 0.7682304, 1.230353, 0.3607843, 0, 1, 1,
0.6344683, 0.09678543, 1.386006, 0.3686275, 0, 1, 1,
0.6384315, 0.1409561, 2.390574, 0.372549, 0, 1, 1,
0.6384322, 0.5790308, -0.4069481, 0.3803922, 0, 1, 1,
0.6403947, 1.396533, 0.4328651, 0.3843137, 0, 1, 1,
0.6410725, -1.821492, 3.085385, 0.3921569, 0, 1, 1,
0.6418035, -0.9638361, 1.453489, 0.3960784, 0, 1, 1,
0.6442986, 0.2670404, 1.890105, 0.4039216, 0, 1, 1,
0.6444594, 0.5384517, 1.334172, 0.4117647, 0, 1, 1,
0.6474507, -0.07110334, 2.625305, 0.4156863, 0, 1, 1,
0.6544334, 0.6084403, 0.2852319, 0.4235294, 0, 1, 1,
0.6547914, -0.6659933, 2.794953, 0.427451, 0, 1, 1,
0.6624656, 1.726851, -0.3164943, 0.4352941, 0, 1, 1,
0.6635026, -1.188078, 1.193439, 0.4392157, 0, 1, 1,
0.6665497, -1.486174, 2.07967, 0.4470588, 0, 1, 1,
0.668413, -0.8481077, 1.142252, 0.4509804, 0, 1, 1,
0.676851, 0.5323399, 1.155969, 0.4588235, 0, 1, 1,
0.6872389, -1.020069, 2.332905, 0.4627451, 0, 1, 1,
0.6873704, -1.088992, 2.536596, 0.4705882, 0, 1, 1,
0.6888046, -0.3691534, 2.9268, 0.4745098, 0, 1, 1,
0.6934342, 0.4503754, 1.662133, 0.4823529, 0, 1, 1,
0.6948929, -0.4665434, 3.991106, 0.4862745, 0, 1, 1,
0.6951148, -0.01837919, 0.04058601, 0.4941176, 0, 1, 1,
0.6958599, 0.7183806, 0.01422095, 0.5019608, 0, 1, 1,
0.6966132, -0.6305124, 2.110431, 0.5058824, 0, 1, 1,
0.6991186, 0.7318211, 1.376552, 0.5137255, 0, 1, 1,
0.7042247, 0.909501, 1.360702, 0.5176471, 0, 1, 1,
0.7072203, 0.7885631, -0.2823412, 0.5254902, 0, 1, 1,
0.7118375, 0.8414946, 1.747159, 0.5294118, 0, 1, 1,
0.7138153, 0.01963696, 1.522046, 0.5372549, 0, 1, 1,
0.7141548, -0.08341319, 0.3387699, 0.5411765, 0, 1, 1,
0.7149035, 0.1639423, 0.3530115, 0.5490196, 0, 1, 1,
0.7151474, 1.798673, -0.7789985, 0.5529412, 0, 1, 1,
0.7195364, 1.973102, -0.0562579, 0.5607843, 0, 1, 1,
0.7203609, -1.481593, 2.991782, 0.5647059, 0, 1, 1,
0.724845, -0.736515, 0.5229865, 0.572549, 0, 1, 1,
0.7267514, 0.2616278, 0.7034959, 0.5764706, 0, 1, 1,
0.7333105, 1.060499, 2.071733, 0.5843138, 0, 1, 1,
0.7381933, 0.233539, 0.4545122, 0.5882353, 0, 1, 1,
0.744743, -0.2391722, 1.921749, 0.5960785, 0, 1, 1,
0.7454729, -1.256283, 1.551001, 0.6039216, 0, 1, 1,
0.7456105, -0.1126646, 1.906611, 0.6078432, 0, 1, 1,
0.7476016, -0.7895563, 0.5786704, 0.6156863, 0, 1, 1,
0.7583856, -1.843279, 3.422534, 0.6196079, 0, 1, 1,
0.7603275, -1.487367, 3.911589, 0.627451, 0, 1, 1,
0.7642063, -1.076997, 2.231903, 0.6313726, 0, 1, 1,
0.7669747, -1.54571, 1.505748, 0.6392157, 0, 1, 1,
0.7716443, 2.252231, 1.437877, 0.6431373, 0, 1, 1,
0.7739703, -0.409752, 2.380826, 0.6509804, 0, 1, 1,
0.7768678, 0.7625467, 1.002445, 0.654902, 0, 1, 1,
0.7794051, 0.2644551, -0.3448234, 0.6627451, 0, 1, 1,
0.7867242, 0.8361825, 1.977098, 0.6666667, 0, 1, 1,
0.7891158, 0.4894312, 1.28562, 0.6745098, 0, 1, 1,
0.7904164, -2.330998, 1.21753, 0.6784314, 0, 1, 1,
0.7919299, 1.151919, -1.20956, 0.6862745, 0, 1, 1,
0.7983588, 1.392255, -1.281921, 0.6901961, 0, 1, 1,
0.8029307, 0.6816506, 0.3675095, 0.6980392, 0, 1, 1,
0.8032146, -1.116334, 1.806424, 0.7058824, 0, 1, 1,
0.8052403, -0.2422667, 0.7860193, 0.7098039, 0, 1, 1,
0.8063904, -0.2900853, 2.286651, 0.7176471, 0, 1, 1,
0.8117614, 1.645726, -0.3632209, 0.7215686, 0, 1, 1,
0.8120067, -0.9589945, 1.976086, 0.7294118, 0, 1, 1,
0.8163764, 1.041307, 1.124331, 0.7333333, 0, 1, 1,
0.8174664, -2.162086, 2.64361, 0.7411765, 0, 1, 1,
0.8207159, -0.5135189, 1.863471, 0.7450981, 0, 1, 1,
0.8246878, -1.027344, 4.217586, 0.7529412, 0, 1, 1,
0.8266242, 0.3877079, 0.8701438, 0.7568628, 0, 1, 1,
0.8329256, 1.05155, 0.1127962, 0.7647059, 0, 1, 1,
0.8361626, -0.4776427, 1.44578, 0.7686275, 0, 1, 1,
0.8385395, -0.4969591, 1.534602, 0.7764706, 0, 1, 1,
0.8402519, 1.442728, 0.2720767, 0.7803922, 0, 1, 1,
0.8423797, -0.1317309, 1.066493, 0.7882353, 0, 1, 1,
0.8425109, -0.405009, 2.108166, 0.7921569, 0, 1, 1,
0.8480421, 0.9776223, 1.640125, 0.8, 0, 1, 1,
0.8555794, -0.3014746, 3.138672, 0.8078431, 0, 1, 1,
0.8594094, 0.9157666, 0.706091, 0.8117647, 0, 1, 1,
0.86009, 0.4462151, 1.197918, 0.8196079, 0, 1, 1,
0.8604836, -0.1831476, 2.100682, 0.8235294, 0, 1, 1,
0.8641359, -1.447758, 2.422918, 0.8313726, 0, 1, 1,
0.8646339, -0.4648858, 2.000914, 0.8352941, 0, 1, 1,
0.8685691, 0.2147525, 1.510385, 0.8431373, 0, 1, 1,
0.8721598, 0.9503491, 2.444636, 0.8470588, 0, 1, 1,
0.8795971, 0.09875894, 0.5960988, 0.854902, 0, 1, 1,
0.8858765, 1.449782, 0.4645419, 0.8588235, 0, 1, 1,
0.8915634, -0.5317318, 1.488897, 0.8666667, 0, 1, 1,
0.8939084, -0.497401, 1.455095, 0.8705882, 0, 1, 1,
0.8951887, 0.1116424, 0.1540965, 0.8784314, 0, 1, 1,
0.8986964, -0.4898017, 3.086925, 0.8823529, 0, 1, 1,
0.900347, 0.8867211, 1.312126, 0.8901961, 0, 1, 1,
0.9011348, 1.1488, 1.366561, 0.8941177, 0, 1, 1,
0.9021487, 0.9411573, 1.261573, 0.9019608, 0, 1, 1,
0.9095991, -0.1489976, 0.3692722, 0.9098039, 0, 1, 1,
0.9109619, 1.824474, -1.700746, 0.9137255, 0, 1, 1,
0.9201375, -0.3879361, 0.4565554, 0.9215686, 0, 1, 1,
0.9205297, 0.9380565, 0.469726, 0.9254902, 0, 1, 1,
0.9215222, 0.6825131, 1.533786, 0.9333333, 0, 1, 1,
0.9225467, -2.177529, 1.91564, 0.9372549, 0, 1, 1,
0.9270476, -0.4606495, 3.215703, 0.945098, 0, 1, 1,
0.9442539, -1.152764, 4.046901, 0.9490196, 0, 1, 1,
0.952354, 1.47405, 0.1324328, 0.9568627, 0, 1, 1,
0.9527913, -2.101318, 2.11193, 0.9607843, 0, 1, 1,
0.9558354, 2.003795, 0.8610201, 0.9686275, 0, 1, 1,
0.9613518, 0.6292792, 0.06317746, 0.972549, 0, 1, 1,
0.9643083, -0.1140474, 2.918847, 0.9803922, 0, 1, 1,
0.966424, 0.8901321, 0.9775895, 0.9843137, 0, 1, 1,
0.9679897, -1.560614, 1.496203, 0.9921569, 0, 1, 1,
0.9681285, 0.5208153, 0.4035027, 0.9960784, 0, 1, 1,
0.970959, -0.06197439, 0.9573539, 1, 0, 0.9960784, 1,
0.9758078, 0.7581986, 0.3642631, 1, 0, 0.9882353, 1,
0.9821298, 1.059419, 1.308746, 1, 0, 0.9843137, 1,
0.9832565, 1.581535, -0.2273676, 1, 0, 0.9764706, 1,
0.9842502, -0.1909296, 3.629687, 1, 0, 0.972549, 1,
0.9843272, 0.2708064, 1.227285, 1, 0, 0.9647059, 1,
0.9932148, -0.8892983, 2.67022, 1, 0, 0.9607843, 1,
0.9956637, 0.5003335, 1.371801, 1, 0, 0.9529412, 1,
0.9958655, -0.1978944, 1.950869, 1, 0, 0.9490196, 1,
0.9979438, -0.1259951, 2.616639, 1, 0, 0.9411765, 1,
1.000384, 0.5215342, 1.746615, 1, 0, 0.9372549, 1,
1.01214, 0.670615, 0.002686866, 1, 0, 0.9294118, 1,
1.020618, 1.449111, -0.3754778, 1, 0, 0.9254902, 1,
1.02368, -1.05291, 1.254961, 1, 0, 0.9176471, 1,
1.024213, -0.2247923, 1.35694, 1, 0, 0.9137255, 1,
1.03404, -0.2704931, 0.9364118, 1, 0, 0.9058824, 1,
1.034056, -0.2042829, -0.1196904, 1, 0, 0.9019608, 1,
1.040887, -0.5214131, 2.973567, 1, 0, 0.8941177, 1,
1.050282, -0.5695111, 1.541288, 1, 0, 0.8862745, 1,
1.050573, -0.1935545, 1.656401, 1, 0, 0.8823529, 1,
1.055486, -0.3033229, 1.861883, 1, 0, 0.8745098, 1,
1.060654, -0.8221571, 2.58783, 1, 0, 0.8705882, 1,
1.062762, 1.536051, 1.171997, 1, 0, 0.8627451, 1,
1.064491, -0.1526483, 0.7439035, 1, 0, 0.8588235, 1,
1.06864, 0.6245661, 1.872481, 1, 0, 0.8509804, 1,
1.068931, -1.547119, 1.012589, 1, 0, 0.8470588, 1,
1.072874, -1.596334, 1.909301, 1, 0, 0.8392157, 1,
1.074153, 0.5073384, 2.465058, 1, 0, 0.8352941, 1,
1.074684, 0.201825, 0.7972692, 1, 0, 0.827451, 1,
1.079217, 0.6152345, 3.203061, 1, 0, 0.8235294, 1,
1.087217, -0.5489702, 1.58412, 1, 0, 0.8156863, 1,
1.101081, 1.84329, -0.3392923, 1, 0, 0.8117647, 1,
1.102432, -1.045397, 2.239092, 1, 0, 0.8039216, 1,
1.107963, -0.4437548, 3.052788, 1, 0, 0.7960784, 1,
1.10973, -0.4968855, 2.319345, 1, 0, 0.7921569, 1,
1.112841, -0.1270426, 1.377376, 1, 0, 0.7843137, 1,
1.113251, 0.3788132, -0.3588994, 1, 0, 0.7803922, 1,
1.113264, -0.84841, 2.591122, 1, 0, 0.772549, 1,
1.116652, -0.4522913, 2.133563, 1, 0, 0.7686275, 1,
1.129832, 0.2416496, 0.8509631, 1, 0, 0.7607843, 1,
1.144694, -0.2794664, 1.973129, 1, 0, 0.7568628, 1,
1.157776, 0.1829654, 1.56711, 1, 0, 0.7490196, 1,
1.163274, -1.196113, 2.572061, 1, 0, 0.7450981, 1,
1.170062, -0.8136988, 2.754641, 1, 0, 0.7372549, 1,
1.187597, 0.270176, 1.591539, 1, 0, 0.7333333, 1,
1.191781, 1.262775, 0.4698894, 1, 0, 0.7254902, 1,
1.198189, 0.6452227, -0.004663185, 1, 0, 0.7215686, 1,
1.198714, 1.33977, 0.6536933, 1, 0, 0.7137255, 1,
1.199215, -0.3948576, 1.479448, 1, 0, 0.7098039, 1,
1.202164, -0.4254225, 1.637152, 1, 0, 0.7019608, 1,
1.20252, -0.8736146, 0.7876401, 1, 0, 0.6941177, 1,
1.202526, 1.367701, 0.2706638, 1, 0, 0.6901961, 1,
1.202646, 0.2763788, 1.039485, 1, 0, 0.682353, 1,
1.205942, -0.6150772, 0.1978019, 1, 0, 0.6784314, 1,
1.210547, -1.048472, 1.932002, 1, 0, 0.6705883, 1,
1.213129, 1.351186, 0.5009319, 1, 0, 0.6666667, 1,
1.22343, 1.182802, 0.8187671, 1, 0, 0.6588235, 1,
1.226811, -1.08961, 0.8303456, 1, 0, 0.654902, 1,
1.228047, 1.264938, 0.7751068, 1, 0, 0.6470588, 1,
1.24067, -0.06854853, 0.4708128, 1, 0, 0.6431373, 1,
1.246212, 0.5753478, -0.121441, 1, 0, 0.6352941, 1,
1.246418, -1.827173, 1.475065, 1, 0, 0.6313726, 1,
1.246453, 0.6939825, 1.728718, 1, 0, 0.6235294, 1,
1.252152, -0.4852128, 2.075062, 1, 0, 0.6196079, 1,
1.258059, 1.349663, 2.068052, 1, 0, 0.6117647, 1,
1.258839, -0.9873766, 0.7577696, 1, 0, 0.6078432, 1,
1.269342, 0.8547833, -0.2470022, 1, 0, 0.6, 1,
1.27202, 1.081966, 1.361788, 1, 0, 0.5921569, 1,
1.281179, -1.365741, 1.662797, 1, 0, 0.5882353, 1,
1.282862, -0.2705258, 1.18847, 1, 0, 0.5803922, 1,
1.283527, -0.6066638, 2.794013, 1, 0, 0.5764706, 1,
1.293492, -1.224925, 1.446236, 1, 0, 0.5686275, 1,
1.320657, 1.535455, -0.2458664, 1, 0, 0.5647059, 1,
1.324127, -0.8455577, 4.263107, 1, 0, 0.5568628, 1,
1.325759, -0.347202, 0.5537682, 1, 0, 0.5529412, 1,
1.331168, 0.8798942, 0.650207, 1, 0, 0.5450981, 1,
1.332855, 0.52422, 0.1507546, 1, 0, 0.5411765, 1,
1.340879, 0.5043519, 0.4217142, 1, 0, 0.5333334, 1,
1.340907, 0.4808639, 3.160281, 1, 0, 0.5294118, 1,
1.343581, -0.8036497, 1.720269, 1, 0, 0.5215687, 1,
1.353518, 0.4032852, 1.344666, 1, 0, 0.5176471, 1,
1.368383, 0.9921101, 2.131397, 1, 0, 0.509804, 1,
1.385034, -0.7503898, 3.076122, 1, 0, 0.5058824, 1,
1.389753, 0.977266, 0.6346003, 1, 0, 0.4980392, 1,
1.394373, -1.076942, 3.611215, 1, 0, 0.4901961, 1,
1.396654, -1.327972, -0.3195829, 1, 0, 0.4862745, 1,
1.405176, -0.2023738, 3.316292, 1, 0, 0.4784314, 1,
1.411334, 0.1401074, 0.9887824, 1, 0, 0.4745098, 1,
1.412608, 0.2012947, 2.912686, 1, 0, 0.4666667, 1,
1.415493, -0.773014, 1.440499, 1, 0, 0.4627451, 1,
1.419441, 0.3999525, 0.9685726, 1, 0, 0.454902, 1,
1.427718, -0.2699312, 2.070645, 1, 0, 0.4509804, 1,
1.428944, -0.2191852, 1.277145, 1, 0, 0.4431373, 1,
1.4328, -0.6121157, 2.089792, 1, 0, 0.4392157, 1,
1.43303, 0.2873129, 1.551107, 1, 0, 0.4313726, 1,
1.435601, -0.4577492, 3.458351, 1, 0, 0.427451, 1,
1.449491, -3.114348, 2.091892, 1, 0, 0.4196078, 1,
1.462189, 0.201178, 0.9115339, 1, 0, 0.4156863, 1,
1.470809, -0.7039647, 0.1755248, 1, 0, 0.4078431, 1,
1.481423, 0.46088, 3.07305, 1, 0, 0.4039216, 1,
1.481472, -0.2483979, 0.1095595, 1, 0, 0.3960784, 1,
1.483819, 0.8232946, -0.3693194, 1, 0, 0.3882353, 1,
1.515617, 0.7963238, 0.3990818, 1, 0, 0.3843137, 1,
1.52935, 0.0632652, 1.232761, 1, 0, 0.3764706, 1,
1.53047, 2.845087, 0.6481365, 1, 0, 0.372549, 1,
1.532781, -0.282041, 1.809367, 1, 0, 0.3647059, 1,
1.547244, -0.3325526, 1.818819, 1, 0, 0.3607843, 1,
1.552916, 0.5654824, 0.4110362, 1, 0, 0.3529412, 1,
1.559711, -1.068855, 1.363476, 1, 0, 0.3490196, 1,
1.561769, 1.963547, 0.5201543, 1, 0, 0.3411765, 1,
1.577476, -0.3996685, 1.367144, 1, 0, 0.3372549, 1,
1.58039, 0.3209104, 0.9266254, 1, 0, 0.3294118, 1,
1.595487, 0.1936774, 0.4088854, 1, 0, 0.3254902, 1,
1.609745, -0.426685, 1.482188, 1, 0, 0.3176471, 1,
1.629633, 0.7574852, 0.6008542, 1, 0, 0.3137255, 1,
1.639549, -0.4276749, 3.335965, 1, 0, 0.3058824, 1,
1.641414, -0.7924543, 0.464852, 1, 0, 0.2980392, 1,
1.65166, 0.030198, 2.646858, 1, 0, 0.2941177, 1,
1.661308, -0.4929772, 0.5701712, 1, 0, 0.2862745, 1,
1.694639, -0.4494011, 2.519245, 1, 0, 0.282353, 1,
1.698087, 0.4775309, 2.258159, 1, 0, 0.2745098, 1,
1.704977, -0.2828993, 0.4855177, 1, 0, 0.2705882, 1,
1.714212, -0.5923283, 2.521121, 1, 0, 0.2627451, 1,
1.719896, 0.6098415, 1.631219, 1, 0, 0.2588235, 1,
1.725454, 0.1847436, 0.6810572, 1, 0, 0.2509804, 1,
1.735433, -0.5753867, 2.155662, 1, 0, 0.2470588, 1,
1.747056, 0.6122926, -1.074006, 1, 0, 0.2392157, 1,
1.749363, -0.5055272, 0.4929727, 1, 0, 0.2352941, 1,
1.787092, -0.5223318, 3.173649, 1, 0, 0.227451, 1,
1.794567, 0.756116, 0.2041962, 1, 0, 0.2235294, 1,
1.796561, 1.237414, 0.3751377, 1, 0, 0.2156863, 1,
1.809543, 0.2566997, 0.2902985, 1, 0, 0.2117647, 1,
1.816712, -0.9656635, 0.5402101, 1, 0, 0.2039216, 1,
1.820828, 0.5940765, 2.149269, 1, 0, 0.1960784, 1,
1.860245, -0.7445785, 2.343999, 1, 0, 0.1921569, 1,
1.876871, 0.9322, 1.362377, 1, 0, 0.1843137, 1,
1.882497, -0.4035816, 1.656102, 1, 0, 0.1803922, 1,
1.91439, -0.07642861, 1.436699, 1, 0, 0.172549, 1,
1.925219, -1.785903, 2.052588, 1, 0, 0.1686275, 1,
1.925875, 1.902082, 0.9387401, 1, 0, 0.1607843, 1,
1.938871, -0.2327615, 1.684623, 1, 0, 0.1568628, 1,
1.939796, -1.12327, 3.062879, 1, 0, 0.1490196, 1,
1.974003, -0.3679801, 2.54524, 1, 0, 0.145098, 1,
1.987922, 1.095078, -1.81298, 1, 0, 0.1372549, 1,
2.017885, 0.5751528, 1.366144, 1, 0, 0.1333333, 1,
2.019125, -0.9406491, 3.281235, 1, 0, 0.1254902, 1,
2.034758, 0.1255818, 2.780855, 1, 0, 0.1215686, 1,
2.041321, -0.07738788, 1.763318, 1, 0, 0.1137255, 1,
2.057431, -1.354495, 2.061522, 1, 0, 0.1098039, 1,
2.06517, -0.6049303, 0.9130675, 1, 0, 0.1019608, 1,
2.086213, -0.9726591, 1.680093, 1, 0, 0.09411765, 1,
2.094579, -0.8310978, 2.207593, 1, 0, 0.09019608, 1,
2.103605, 0.8370364, 0.4681649, 1, 0, 0.08235294, 1,
2.122438, -1.581444, 1.85409, 1, 0, 0.07843138, 1,
2.185379, -0.5360604, 0.7015725, 1, 0, 0.07058824, 1,
2.189443, 2.7009, -0.788718, 1, 0, 0.06666667, 1,
2.227558, 1.61844, 1.067131, 1, 0, 0.05882353, 1,
2.231313, 0.9556071, 1.216434, 1, 0, 0.05490196, 1,
2.288699, 0.8743269, -0.156032, 1, 0, 0.04705882, 1,
2.369862, -0.3670656, 1.790462, 1, 0, 0.04313726, 1,
2.40718, -1.350933, 3.139234, 1, 0, 0.03529412, 1,
2.489182, -0.2218848, 0.9609789, 1, 0, 0.03137255, 1,
2.510122, -1.158435, 0.9278309, 1, 0, 0.02352941, 1,
2.526083, 2.156873, 0.5495129, 1, 0, 0.01960784, 1,
2.840419, -0.7703473, 1.604422, 1, 0, 0.01176471, 1,
3.076634, 0.06787483, 1.337402, 1, 0, 0.007843138, 1
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
-0.08902371, -4.196034, -8.206482, 0, -0.5, 0.5, 0.5,
-0.08902371, -4.196034, -8.206482, 1, -0.5, 0.5, 0.5,
-0.08902371, -4.196034, -8.206482, 1, 1.5, 0.5, 0.5,
-0.08902371, -4.196034, -8.206482, 0, 1.5, 0.5, 0.5
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
-4.327839, 0.07646501, -8.206482, 0, -0.5, 0.5, 0.5,
-4.327839, 0.07646501, -8.206482, 1, -0.5, 0.5, 0.5,
-4.327839, 0.07646501, -8.206482, 1, 1.5, 0.5, 0.5,
-4.327839, 0.07646501, -8.206482, 0, 1.5, 0.5, 0.5
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
-4.327839, -4.196034, -0.4327478, 0, -0.5, 0.5, 0.5,
-4.327839, -4.196034, -0.4327478, 1, -0.5, 0.5, 0.5,
-4.327839, -4.196034, -0.4327478, 1, 1.5, 0.5, 0.5,
-4.327839, -4.196034, -0.4327478, 0, 1.5, 0.5, 0.5
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
-3, -3.210073, -6.412543,
3, -3.210073, -6.412543,
-3, -3.210073, -6.412543,
-3, -3.374399, -6.711533,
-2, -3.210073, -6.412543,
-2, -3.374399, -6.711533,
-1, -3.210073, -6.412543,
-1, -3.374399, -6.711533,
0, -3.210073, -6.412543,
0, -3.374399, -6.711533,
1, -3.210073, -6.412543,
1, -3.374399, -6.711533,
2, -3.210073, -6.412543,
2, -3.374399, -6.711533,
3, -3.210073, -6.412543,
3, -3.374399, -6.711533
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
-3, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
-3, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
-3, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
-3, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
-2, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
-2, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
-2, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
-2, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
-1, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
-1, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
-1, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
-1, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
0, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
0, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
0, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
0, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
1, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
1, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
1, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
1, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
2, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
2, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
2, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
2, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5,
3, -3.703053, -7.309513, 0, -0.5, 0.5, 0.5,
3, -3.703053, -7.309513, 1, -0.5, 0.5, 0.5,
3, -3.703053, -7.309513, 1, 1.5, 0.5, 0.5,
3, -3.703053, -7.309513, 0, 1.5, 0.5, 0.5
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
-3.349651, -3, -6.412543,
-3.349651, 3, -6.412543,
-3.349651, -3, -6.412543,
-3.512683, -3, -6.711533,
-3.349651, -2, -6.412543,
-3.512683, -2, -6.711533,
-3.349651, -1, -6.412543,
-3.512683, -1, -6.711533,
-3.349651, 0, -6.412543,
-3.512683, 0, -6.711533,
-3.349651, 1, -6.412543,
-3.512683, 1, -6.711533,
-3.349651, 2, -6.412543,
-3.512683, 2, -6.711533,
-3.349651, 3, -6.412543,
-3.512683, 3, -6.711533
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
-3.838745, -3, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, -3, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, -3, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, -3, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, -2, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, -2, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, -2, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, -2, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, -1, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, -1, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, -1, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, -1, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, 0, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, 0, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, 0, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, 0, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, 1, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, 1, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, 1, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, 1, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, 2, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, 2, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, 2, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, 2, -7.309513, 0, 1.5, 0.5, 0.5,
-3.838745, 3, -7.309513, 0, -0.5, 0.5, 0.5,
-3.838745, 3, -7.309513, 1, -0.5, 0.5, 0.5,
-3.838745, 3, -7.309513, 1, 1.5, 0.5, 0.5,
-3.838745, 3, -7.309513, 0, 1.5, 0.5, 0.5
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
-3.349651, -3.210073, -6,
-3.349651, -3.210073, 4,
-3.349651, -3.210073, -6,
-3.512683, -3.374399, -6,
-3.349651, -3.210073, -4,
-3.512683, -3.374399, -4,
-3.349651, -3.210073, -2,
-3.512683, -3.374399, -2,
-3.349651, -3.210073, 0,
-3.512683, -3.374399, 0,
-3.349651, -3.210073, 2,
-3.512683, -3.374399, 2,
-3.349651, -3.210073, 4,
-3.512683, -3.374399, 4
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
"-6",
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
-3.838745, -3.703053, -6, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -6, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -6, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, -6, 0, 1.5, 0.5, 0.5,
-3.838745, -3.703053, -4, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -4, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -4, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, -4, 0, 1.5, 0.5, 0.5,
-3.838745, -3.703053, -2, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -2, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, -2, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, -2, 0, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 0, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 0, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 0, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 0, 0, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 2, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 2, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 2, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 2, 0, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 4, 0, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 4, 1, -0.5, 0.5, 0.5,
-3.838745, -3.703053, 4, 1, 1.5, 0.5, 0.5,
-3.838745, -3.703053, 4, 0, 1.5, 0.5, 0.5
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
-3.349651, -3.210073, -6.412543,
-3.349651, 3.363003, -6.412543,
-3.349651, -3.210073, 5.547048,
-3.349651, 3.363003, 5.547048,
-3.349651, -3.210073, -6.412543,
-3.349651, -3.210073, 5.547048,
-3.349651, 3.363003, -6.412543,
-3.349651, 3.363003, 5.547048,
-3.349651, -3.210073, -6.412543,
3.171604, -3.210073, -6.412543,
-3.349651, -3.210073, 5.547048,
3.171604, -3.210073, 5.547048,
-3.349651, 3.363003, -6.412543,
3.171604, 3.363003, -6.412543,
-3.349651, 3.363003, 5.547048,
3.171604, 3.363003, 5.547048,
3.171604, -3.210073, -6.412543,
3.171604, 3.363003, -6.412543,
3.171604, -3.210073, 5.547048,
3.171604, 3.363003, 5.547048,
3.171604, -3.210073, -6.412543,
3.171604, -3.210073, 5.547048,
3.171604, 3.363003, -6.412543,
3.171604, 3.363003, 5.547048
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
var radius = 8.076426;
var distance = 35.93293;
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
mvMatrix.translate( 0.08902371, -0.07646501, 0.4327478 );
mvMatrix.scale( 1.339066, 1.328509, 0.7301579 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.93293);
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
BENZAMIDE<-read.table("BENZAMIDE.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-BENZAMIDE$V2
```

```
## Error in eval(expr, envir, enclos): object 'BENZAMIDE' not found
```

```r
y<-BENZAMIDE$V3
```

```
## Error in eval(expr, envir, enclos): object 'BENZAMIDE' not found
```

```r
z<-BENZAMIDE$V4
```

```
## Error in eval(expr, envir, enclos): object 'BENZAMIDE' not found
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
-3.254682, 1.219784, -1.104115, 0, 0, 1, 1, 1,
-3.191062, 0.6865517, 0.3772198, 1, 0, 0, 1, 1,
-3.02235, -0.5196029, -1.915224, 1, 0, 0, 1, 1,
-2.895401, 0.9779783, 1.037371, 1, 0, 0, 1, 1,
-2.384279, -2.237684, -2.157789, 1, 0, 0, 1, 1,
-2.326844, -2.395028, -1.077886, 1, 0, 0, 1, 1,
-2.298453, -0.821515, -3.117322, 0, 0, 0, 1, 1,
-2.207029, -0.2848552, -1.065496, 0, 0, 0, 1, 1,
-2.135221, -0.4321902, -1.329758, 0, 0, 0, 1, 1,
-2.118765, -1.592308, -4.239316, 0, 0, 0, 1, 1,
-2.071302, 0.7900973, -0.6846694, 0, 0, 0, 1, 1,
-2.04059, -1.144349, -1.579942, 0, 0, 0, 1, 1,
-2.004835, -0.1197882, -1.801349, 0, 0, 0, 1, 1,
-2.003088, 0.4995107, -1.243063, 1, 1, 1, 1, 1,
-1.994143, -0.3170474, -1.842598, 1, 1, 1, 1, 1,
-1.953889, -0.3512149, -1.853265, 1, 1, 1, 1, 1,
-1.947845, -0.124031, -1.236167, 1, 1, 1, 1, 1,
-1.941844, 0.2081837, -0.5580736, 1, 1, 1, 1, 1,
-1.924814, -0.06010609, -1.967731, 1, 1, 1, 1, 1,
-1.903576, 0.6124591, 0.3998023, 1, 1, 1, 1, 1,
-1.878331, 0.1904301, -2.786623, 1, 1, 1, 1, 1,
-1.866424, -0.4522397, -0.8058132, 1, 1, 1, 1, 1,
-1.83383, 0.2683843, -1.134054, 1, 1, 1, 1, 1,
-1.829232, 0.4302837, -2.140981, 1, 1, 1, 1, 1,
-1.801792, 0.6548996, -1.791475, 1, 1, 1, 1, 1,
-1.786254, 0.9323963, -0.225639, 1, 1, 1, 1, 1,
-1.781361, 0.4027425, -1.289069, 1, 1, 1, 1, 1,
-1.778055, -0.8128259, -1.260252, 1, 1, 1, 1, 1,
-1.774972, 1.172521, -1.132809, 0, 0, 1, 1, 1,
-1.760387, 0.4809707, -2.091526, 1, 0, 0, 1, 1,
-1.742897, -0.7728064, -1.914019, 1, 0, 0, 1, 1,
-1.739088, -0.2039125, -1.121338, 1, 0, 0, 1, 1,
-1.735548, -0.07263221, -1.41598, 1, 0, 0, 1, 1,
-1.733567, 0.3390344, -2.603462, 1, 0, 0, 1, 1,
-1.732836, 0.5834023, -0.7853974, 0, 0, 0, 1, 1,
-1.725102, 0.6939182, -0.8956414, 0, 0, 0, 1, 1,
-1.707597, 0.8181831, -0.05517248, 0, 0, 0, 1, 1,
-1.705383, 1.175665, -2.336896, 0, 0, 0, 1, 1,
-1.693113, -0.01583884, 1.469719, 0, 0, 0, 1, 1,
-1.673874, -0.4098657, -1.353878, 0, 0, 0, 1, 1,
-1.67375, -0.8881399, -1.829298, 0, 0, 0, 1, 1,
-1.673734, -0.4281251, -1.653686, 1, 1, 1, 1, 1,
-1.650814, -0.4218267, -2.208964, 1, 1, 1, 1, 1,
-1.63389, -0.3933564, -2.254966, 1, 1, 1, 1, 1,
-1.63242, -0.6390188, -2.40861, 1, 1, 1, 1, 1,
-1.618956, -0.9856222, -3.706714, 1, 1, 1, 1, 1,
-1.612378, 0.3893634, -1.044648, 1, 1, 1, 1, 1,
-1.607002, 0.5641361, 0.5154999, 1, 1, 1, 1, 1,
-1.606226, 0.1214609, -2.755735, 1, 1, 1, 1, 1,
-1.601811, -1.688961, -1.594013, 1, 1, 1, 1, 1,
-1.59199, 1.428512, 0.6040185, 1, 1, 1, 1, 1,
-1.590894, -1.25082, -2.14776, 1, 1, 1, 1, 1,
-1.573721, 0.7598216, -2.052063, 1, 1, 1, 1, 1,
-1.567617, -1.124387, -0.3034327, 1, 1, 1, 1, 1,
-1.551482, 1.385876, -2.372779, 1, 1, 1, 1, 1,
-1.54021, -0.6084042, -2.186482, 1, 1, 1, 1, 1,
-1.535746, 0.5144776, -2.482211, 0, 0, 1, 1, 1,
-1.525685, -1.388911, -2.872881, 1, 0, 0, 1, 1,
-1.517174, -1.213681, -1.421165, 1, 0, 0, 1, 1,
-1.510129, -0.7070456, -3.344308, 1, 0, 0, 1, 1,
-1.490138, -0.4891802, -2.882044, 1, 0, 0, 1, 1,
-1.487528, 0.3622687, -1.772892, 1, 0, 0, 1, 1,
-1.484888, -0.902427, -2.21765, 0, 0, 0, 1, 1,
-1.484106, 0.2025653, 0.121804, 0, 0, 0, 1, 1,
-1.4635, 0.1423898, -1.458912, 0, 0, 0, 1, 1,
-1.445034, 0.3115603, 0.3367678, 0, 0, 0, 1, 1,
-1.438808, 0.386203, -1.285764, 0, 0, 0, 1, 1,
-1.406235, -0.07913014, -1.727595, 0, 0, 0, 1, 1,
-1.403424, -0.1758253, -2.792041, 0, 0, 0, 1, 1,
-1.403081, -0.4694556, -1.929745, 1, 1, 1, 1, 1,
-1.402113, -2.302613, -2.146628, 1, 1, 1, 1, 1,
-1.393574, 0.09301418, -1.556503, 1, 1, 1, 1, 1,
-1.383926, -0.2874471, -0.1327143, 1, 1, 1, 1, 1,
-1.37822, -0.4572537, -2.927751, 1, 1, 1, 1, 1,
-1.371037, -1.097346, -1.481061, 1, 1, 1, 1, 1,
-1.366563, 0.5956793, -0.03204156, 1, 1, 1, 1, 1,
-1.354035, 0.5163126, -0.4654804, 1, 1, 1, 1, 1,
-1.352609, 1.356918, 0.383188, 1, 1, 1, 1, 1,
-1.352532, -1.029297, -2.141893, 1, 1, 1, 1, 1,
-1.348148, 0.1681839, -0.8914763, 1, 1, 1, 1, 1,
-1.347764, 0.4381729, -1.45279, 1, 1, 1, 1, 1,
-1.344779, 1.426854, -0.3368784, 1, 1, 1, 1, 1,
-1.338929, -1.17997, -1.212621, 1, 1, 1, 1, 1,
-1.336855, -0.5469859, -1.346644, 1, 1, 1, 1, 1,
-1.335718, -0.1858841, -2.616312, 0, 0, 1, 1, 1,
-1.311898, -0.6781927, -2.877694, 1, 0, 0, 1, 1,
-1.308281, -1.359317, -5.653265, 1, 0, 0, 1, 1,
-1.298655, 0.6684009, -1.391343, 1, 0, 0, 1, 1,
-1.297711, 0.4362557, -1.670249, 1, 0, 0, 1, 1,
-1.293821, -0.2856889, -1.778041, 1, 0, 0, 1, 1,
-1.292188, 0.3776283, -1.059585, 0, 0, 0, 1, 1,
-1.291365, 0.144343, -2.74924, 0, 0, 0, 1, 1,
-1.290809, 1.52968, 0.2118155, 0, 0, 0, 1, 1,
-1.285218, 0.3743372, -1.223026, 0, 0, 0, 1, 1,
-1.280906, 2.286521, -0.2141156, 0, 0, 0, 1, 1,
-1.27818, 0.02420894, -2.192456, 0, 0, 0, 1, 1,
-1.26605, 1.250847, -0.7303903, 0, 0, 0, 1, 1,
-1.265385, -1.987258, -2.081833, 1, 1, 1, 1, 1,
-1.258791, 0.7806419, -1.204262, 1, 1, 1, 1, 1,
-1.257121, -0.06304309, -1.496559, 1, 1, 1, 1, 1,
-1.250295, -0.3069549, -2.540838, 1, 1, 1, 1, 1,
-1.250229, -1.376442, -6.238375, 1, 1, 1, 1, 1,
-1.244469, 1.399395, 1.96947, 1, 1, 1, 1, 1,
-1.235758, -0.0212198, -2.511938, 1, 1, 1, 1, 1,
-1.226311, 0.9259404, -0.7799598, 1, 1, 1, 1, 1,
-1.220803, 1.10127, -0.6117734, 1, 1, 1, 1, 1,
-1.219415, -0.8334373, -2.841138, 1, 1, 1, 1, 1,
-1.219082, 0.02008474, -2.611609, 1, 1, 1, 1, 1,
-1.217211, 0.7614132, -1.310501, 1, 1, 1, 1, 1,
-1.198448, 1.550905, -0.7048327, 1, 1, 1, 1, 1,
-1.186776, -0.1200293, -2.409154, 1, 1, 1, 1, 1,
-1.186503, 1.049663, -1.851638, 1, 1, 1, 1, 1,
-1.18396, -0.8007751, -3.437636, 0, 0, 1, 1, 1,
-1.178953, 1.310351, -1.496403, 1, 0, 0, 1, 1,
-1.175024, -1.281012, -2.040869, 1, 0, 0, 1, 1,
-1.170869, -0.9613247, -0.9207677, 1, 0, 0, 1, 1,
-1.17029, -0.1452489, -2.488256, 1, 0, 0, 1, 1,
-1.165789, -0.4448518, -1.240928, 1, 0, 0, 1, 1,
-1.165645, 0.4143728, -1.822613, 0, 0, 0, 1, 1,
-1.158441, 0.1251933, -2.506799, 0, 0, 0, 1, 1,
-1.158216, -1.390052, -1.219011, 0, 0, 0, 1, 1,
-1.156045, -0.2581316, -1.601039, 0, 0, 0, 1, 1,
-1.142281, -0.6462469, -1.221122, 0, 0, 0, 1, 1,
-1.136593, -1.019595, -3.982679, 0, 0, 0, 1, 1,
-1.132441, 0.6835231, -1.575629, 0, 0, 0, 1, 1,
-1.131534, -0.2948894, -2.093503, 1, 1, 1, 1, 1,
-1.131299, -1.818454, -1.653873, 1, 1, 1, 1, 1,
-1.129047, 0.5334883, -0.03264643, 1, 1, 1, 1, 1,
-1.123677, 1.473237, -1.56003, 1, 1, 1, 1, 1,
-1.12049, 1.154042, -1.174341, 1, 1, 1, 1, 1,
-1.11086, 1.296048, -0.9258068, 1, 1, 1, 1, 1,
-1.103526, -0.7946308, -1.679422, 1, 1, 1, 1, 1,
-1.102999, 0.1335637, -1.814828, 1, 1, 1, 1, 1,
-1.102533, -1.153831, -3.848138, 1, 1, 1, 1, 1,
-1.092442, 0.1084634, -1.842491, 1, 1, 1, 1, 1,
-1.090501, -0.7174586, -2.81409, 1, 1, 1, 1, 1,
-1.087749, -0.1583363, -3.959831, 1, 1, 1, 1, 1,
-1.087271, 0.9024432, 0.6203982, 1, 1, 1, 1, 1,
-1.085359, 2.38235, -0.4422357, 1, 1, 1, 1, 1,
-1.082041, -1.046371, -2.887257, 1, 1, 1, 1, 1,
-1.074962, 0.2963276, -1.758713, 0, 0, 1, 1, 1,
-1.067502, 1.000921, 0.540278, 1, 0, 0, 1, 1,
-1.061827, 0.4547358, -1.056774, 1, 0, 0, 1, 1,
-1.061651, -0.449724, -2.602017, 1, 0, 0, 1, 1,
-1.042534, -0.02132063, -0.9043729, 1, 0, 0, 1, 1,
-1.03712, -0.8860111, -1.913719, 1, 0, 0, 1, 1,
-1.035837, -0.615787, -1.711492, 0, 0, 0, 1, 1,
-1.031433, -2.576924, -2.660825, 0, 0, 0, 1, 1,
-1.030153, 0.7054783, -0.2823884, 0, 0, 0, 1, 1,
-1.025593, -0.5387101, -1.449273, 0, 0, 0, 1, 1,
-1.022642, 0.5124518, -2.35342, 0, 0, 0, 1, 1,
-1.022329, 2.436581, 0.07492933, 0, 0, 0, 1, 1,
-1.022222, -1.055684, -2.375583, 0, 0, 0, 1, 1,
-1.019179, -0.3575628, -1.943026, 1, 1, 1, 1, 1,
-1.016657, -0.1468189, -0.5775731, 1, 1, 1, 1, 1,
-1.010898, 1.211243, -0.3217144, 1, 1, 1, 1, 1,
-1.006328, -0.5184819, -3.531136, 1, 1, 1, 1, 1,
-0.9961661, 1.041144, -1.315022, 1, 1, 1, 1, 1,
-0.9957896, 1.43337, -1.442906, 1, 1, 1, 1, 1,
-0.9952083, 0.6779396, -1.406772, 1, 1, 1, 1, 1,
-0.9935361, 3.015952, -0.06140695, 1, 1, 1, 1, 1,
-0.993017, -2.374642, -4.355796, 1, 1, 1, 1, 1,
-0.9907413, -0.7833933, -2.651692, 1, 1, 1, 1, 1,
-0.9888224, -1.612299, -3.297413, 1, 1, 1, 1, 1,
-0.9867045, -0.01179631, -2.42855, 1, 1, 1, 1, 1,
-0.9834322, -0.9301933, -2.170467, 1, 1, 1, 1, 1,
-0.9805803, -1.945922, -1.935611, 1, 1, 1, 1, 1,
-0.9799661, -0.4038099, -1.232211, 1, 1, 1, 1, 1,
-0.9717487, 0.945341, -3.149662, 0, 0, 1, 1, 1,
-0.9661931, 1.748429, -1.036646, 1, 0, 0, 1, 1,
-0.9645795, -2.253468, -2.36328, 1, 0, 0, 1, 1,
-0.9639076, 0.2700895, -2.410331, 1, 0, 0, 1, 1,
-0.9619879, 0.09129959, -1.278211, 1, 0, 0, 1, 1,
-0.9602216, 0.07974496, -2.195402, 1, 0, 0, 1, 1,
-0.9570161, -0.9185197, -1.8626, 0, 0, 0, 1, 1,
-0.9552826, -0.7729798, -2.375859, 0, 0, 0, 1, 1,
-0.9409406, 0.06602083, -1.940261, 0, 0, 0, 1, 1,
-0.9386872, 0.2547277, -1.767668, 0, 0, 0, 1, 1,
-0.9327294, 0.7508662, -0.06985742, 0, 0, 0, 1, 1,
-0.9319124, 0.5847877, 1.131401, 0, 0, 0, 1, 1,
-0.9298286, 0.3350883, -1.203132, 0, 0, 0, 1, 1,
-0.9182227, -0.03302853, -2.109932, 1, 1, 1, 1, 1,
-0.9158072, -0.758182, -4.726971, 1, 1, 1, 1, 1,
-0.9141993, 0.5251306, -2.221769, 1, 1, 1, 1, 1,
-0.9116902, -0.1265794, -2.195403, 1, 1, 1, 1, 1,
-0.9061398, 0.8566086, -0.4749593, 1, 1, 1, 1, 1,
-0.9004171, -0.7392482, -1.579155, 1, 1, 1, 1, 1,
-0.8988164, 0.6701323, 0.2407611, 1, 1, 1, 1, 1,
-0.8949431, 0.1975221, -1.851831, 1, 1, 1, 1, 1,
-0.891695, 0.3774653, -2.816454, 1, 1, 1, 1, 1,
-0.8894823, 1.469954, 1.253391, 1, 1, 1, 1, 1,
-0.8561273, 0.9593844, -0.333032, 1, 1, 1, 1, 1,
-0.849296, 0.5673575, 0.3201908, 1, 1, 1, 1, 1,
-0.8427911, -0.5782841, -2.99845, 1, 1, 1, 1, 1,
-0.837047, -1.932393, -2.268639, 1, 1, 1, 1, 1,
-0.8346051, -0.3393846, -1.001389, 1, 1, 1, 1, 1,
-0.831084, -1.850549, -0.8695065, 0, 0, 1, 1, 1,
-0.8298117, -1.420158, -1.128721, 1, 0, 0, 1, 1,
-0.8273362, -0.05900858, -1.873085, 1, 0, 0, 1, 1,
-0.8224945, -2.301578, -4.608634, 1, 0, 0, 1, 1,
-0.8200551, -3.046385, -1.846567, 1, 0, 0, 1, 1,
-0.8172452, 0.5416564, 0.4425981, 1, 0, 0, 1, 1,
-0.8146703, -0.8209067, -2.866141, 0, 0, 0, 1, 1,
-0.8126325, 0.299539, -3.551145, 0, 0, 0, 1, 1,
-0.8045462, 0.1800026, 0.6880028, 0, 0, 0, 1, 1,
-0.8027309, 0.3101106, -1.692307, 0, 0, 0, 1, 1,
-0.7778859, -0.4347323, -1.110618, 0, 0, 0, 1, 1,
-0.7762743, -0.738165, -2.134232, 0, 0, 0, 1, 1,
-0.7762446, -0.644246, -3.231485, 0, 0, 0, 1, 1,
-0.7742697, -0.5164994, -3.59458, 1, 1, 1, 1, 1,
-0.7653192, -0.3863254, -3.126404, 1, 1, 1, 1, 1,
-0.7649055, -1.377217, -2.683737, 1, 1, 1, 1, 1,
-0.764723, 1.338756, -1.304298, 1, 1, 1, 1, 1,
-0.7573252, -0.8282008, -4.016347, 1, 1, 1, 1, 1,
-0.7506798, -0.3163615, -1.358674, 1, 1, 1, 1, 1,
-0.7492718, 1.004838, 1.671985, 1, 1, 1, 1, 1,
-0.7411312, 0.3026911, -1.43333, 1, 1, 1, 1, 1,
-0.737362, -1.494934, -2.528659, 1, 1, 1, 1, 1,
-0.7347618, -1.007617, -1.91945, 1, 1, 1, 1, 1,
-0.7326465, -0.02995007, -2.039223, 1, 1, 1, 1, 1,
-0.7318055, -1.582696, -0.3332714, 1, 1, 1, 1, 1,
-0.726607, 0.1864935, -1.466066, 1, 1, 1, 1, 1,
-0.7262804, 1.99628, -1.069816, 1, 1, 1, 1, 1,
-0.7262641, -1.639023, -3.088911, 1, 1, 1, 1, 1,
-0.7257445, 1.849616, -1.136132, 0, 0, 1, 1, 1,
-0.7241614, 0.4468262, 0.1708777, 1, 0, 0, 1, 1,
-0.7231503, -0.1155904, -0.8316927, 1, 0, 0, 1, 1,
-0.7207665, -0.144847, -1.009945, 1, 0, 0, 1, 1,
-0.7182516, -1.347538, -3.779328, 1, 0, 0, 1, 1,
-0.717055, -0.5709246, -2.947503, 1, 0, 0, 1, 1,
-0.7159342, -1.424616, -3.977545, 0, 0, 0, 1, 1,
-0.7120872, 0.3353711, -1.497323, 0, 0, 0, 1, 1,
-0.7090276, -1.150651, -2.879969, 0, 0, 0, 1, 1,
-0.7042224, 1.171168, -0.1362491, 0, 0, 0, 1, 1,
-0.6997961, -0.3419394, -1.023232, 0, 0, 0, 1, 1,
-0.6996303, -1.128043, -4.444482, 0, 0, 0, 1, 1,
-0.6941963, -0.3950229, -0.09448689, 0, 0, 0, 1, 1,
-0.6891855, 1.409412, -1.748467, 1, 1, 1, 1, 1,
-0.6883073, -0.751425, -0.5934297, 1, 1, 1, 1, 1,
-0.6871426, 0.6020107, -1.0945, 1, 1, 1, 1, 1,
-0.6860566, 0.2360421, -0.6893566, 1, 1, 1, 1, 1,
-0.6717001, 0.3551384, -1.501574, 1, 1, 1, 1, 1,
-0.6680357, -1.426055, -3.522122, 1, 1, 1, 1, 1,
-0.6646302, 1.512512, -1.38528, 1, 1, 1, 1, 1,
-0.6624067, 1.328447, 0.1015821, 1, 1, 1, 1, 1,
-0.6610959, 0.2214111, -1.628264, 1, 1, 1, 1, 1,
-0.6596878, 0.3592981, -1.411669, 1, 1, 1, 1, 1,
-0.6524147, -0.3930499, -1.865821, 1, 1, 1, 1, 1,
-0.650919, -0.8649577, 0.3063712, 1, 1, 1, 1, 1,
-0.6495149, 0.465167, -2.577508, 1, 1, 1, 1, 1,
-0.6428443, -1.175501, -2.616393, 1, 1, 1, 1, 1,
-0.6318046, 0.746075, -0.8743023, 1, 1, 1, 1, 1,
-0.6306238, 0.7476084, 0.239255, 0, 0, 1, 1, 1,
-0.6297716, -0.08424506, -3.23073, 1, 0, 0, 1, 1,
-0.6285612, 0.4900905, -1.124378, 1, 0, 0, 1, 1,
-0.6264679, 0.1585381, -1.855016, 1, 0, 0, 1, 1,
-0.6216688, 0.2276292, -2.266461, 1, 0, 0, 1, 1,
-0.6213801, 0.1136658, -0.1594394, 1, 0, 0, 1, 1,
-0.6210347, -0.08375639, -2.100226, 0, 0, 0, 1, 1,
-0.6150289, -0.2395124, -1.108758, 0, 0, 0, 1, 1,
-0.609159, -1.055981, -2.215248, 0, 0, 0, 1, 1,
-0.6065747, 0.2809314, -1.019475, 0, 0, 0, 1, 1,
-0.6054506, 0.3565482, -0.3919406, 0, 0, 0, 1, 1,
-0.604319, 0.1597606, -1.109447, 0, 0, 0, 1, 1,
-0.6040345, 0.1092261, -1.802114, 0, 0, 0, 1, 1,
-0.5993867, 0.9494331, -1.044486, 1, 1, 1, 1, 1,
-0.5962472, -1.234937, -2.767749, 1, 1, 1, 1, 1,
-0.595228, 1.15954, -0.7221532, 1, 1, 1, 1, 1,
-0.5939209, 0.5062995, -0.2807453, 1, 1, 1, 1, 1,
-0.5924331, 0.6899143, -0.2313392, 1, 1, 1, 1, 1,
-0.5916487, -0.3667482, -2.997438, 1, 1, 1, 1, 1,
-0.5806755, -0.258369, -4.277907, 1, 1, 1, 1, 1,
-0.5748362, 0.2306453, 0.01452505, 1, 1, 1, 1, 1,
-0.5713893, 3.267278, -1.70912, 1, 1, 1, 1, 1,
-0.567046, -0.8709275, -1.875891, 1, 1, 1, 1, 1,
-0.5666013, -0.5452191, -3.175931, 1, 1, 1, 1, 1,
-0.5601678, -0.8758366, -2.243003, 1, 1, 1, 1, 1,
-0.5579634, 0.5400822, 1.448856, 1, 1, 1, 1, 1,
-0.5578424, 0.8791674, 0.5891271, 1, 1, 1, 1, 1,
-0.5546169, 0.2548884, -1.327462, 1, 1, 1, 1, 1,
-0.5520039, -1.254933, -3.413072, 0, 0, 1, 1, 1,
-0.5497924, -0.9279599, -3.402005, 1, 0, 0, 1, 1,
-0.5489633, -1.130459, -1.929886, 1, 0, 0, 1, 1,
-0.5473883, -1.340078, -0.1231236, 1, 0, 0, 1, 1,
-0.546492, -0.7576039, -3.022404, 1, 0, 0, 1, 1,
-0.5446758, -0.8423464, -0.8894008, 1, 0, 0, 1, 1,
-0.5445417, 0.1329377, -1.724848, 0, 0, 0, 1, 1,
-0.5421061, 1.382262, 0.9720867, 0, 0, 0, 1, 1,
-0.5419978, -0.5045913, -1.068763, 0, 0, 0, 1, 1,
-0.5417648, 0.652945, 0.6318365, 0, 0, 0, 1, 1,
-0.540494, 0.06926769, -1.183909, 0, 0, 0, 1, 1,
-0.5398447, 1.751948, -1.162405, 0, 0, 0, 1, 1,
-0.5368632, 0.088516, -0.2387393, 0, 0, 0, 1, 1,
-0.5330949, -0.1297683, -3.782137, 1, 1, 1, 1, 1,
-0.5316143, 1.072116, 2.873725, 1, 1, 1, 1, 1,
-0.5311977, 1.450081, 0.5963042, 1, 1, 1, 1, 1,
-0.5247885, 0.07065093, -1.774038, 1, 1, 1, 1, 1,
-0.5209621, -2.718162, -4.20589, 1, 1, 1, 1, 1,
-0.5146435, -0.6519809, -3.569741, 1, 1, 1, 1, 1,
-0.5106409, -0.7074267, -0.86054, 1, 1, 1, 1, 1,
-0.5089336, 0.7679843, -0.7079534, 1, 1, 1, 1, 1,
-0.5036132, 1.048532, -0.5526833, 1, 1, 1, 1, 1,
-0.5031432, -2.34401, -3.288807, 1, 1, 1, 1, 1,
-0.5031338, 0.5186898, -2.158231, 1, 1, 1, 1, 1,
-0.5013415, -0.5279301, -1.495049, 1, 1, 1, 1, 1,
-0.5003263, 1.052393, -0.6043295, 1, 1, 1, 1, 1,
-0.490688, -0.1908056, -1.650023, 1, 1, 1, 1, 1,
-0.4898148, -0.2794674, -3.547745, 1, 1, 1, 1, 1,
-0.4877675, -0.9843395, -2.407685, 0, 0, 1, 1, 1,
-0.4859264, 1.420699, 0.04028401, 1, 0, 0, 1, 1,
-0.4743808, -0.9285909, -4.539052, 1, 0, 0, 1, 1,
-0.4724818, -0.5066228, -4.222363, 1, 0, 0, 1, 1,
-0.4675144, 1.045789, -0.7336249, 1, 0, 0, 1, 1,
-0.4664238, -0.5902282, -2.674141, 1, 0, 0, 1, 1,
-0.4660817, 0.1466813, -1.496218, 0, 0, 0, 1, 1,
-0.4644392, 0.8163975, 2.600068, 0, 0, 0, 1, 1,
-0.4570931, 1.139855, 1.164533, 0, 0, 0, 1, 1,
-0.4554758, 0.5216924, 0.1198785, 0, 0, 0, 1, 1,
-0.4553825, -1.212467, -2.379424, 0, 0, 0, 1, 1,
-0.4541403, 0.7349321, 0.09391385, 0, 0, 0, 1, 1,
-0.453859, 0.3286766, 0.2945022, 0, 0, 0, 1, 1,
-0.4508267, -0.09323773, -0.2273048, 1, 1, 1, 1, 1,
-0.4493869, 1.14054, -1.412662, 1, 1, 1, 1, 1,
-0.4483119, 0.9545037, -1.816631, 1, 1, 1, 1, 1,
-0.4464858, 0.8673632, 0.4332139, 1, 1, 1, 1, 1,
-0.4413711, 0.744574, 1.079389, 1, 1, 1, 1, 1,
-0.4405048, 1.216831, -0.01317207, 1, 1, 1, 1, 1,
-0.4394459, -1.932071, -4.212893, 1, 1, 1, 1, 1,
-0.4387431, 1.171168, -0.7055382, 1, 1, 1, 1, 1,
-0.4372038, -0.1630582, -1.389987, 1, 1, 1, 1, 1,
-0.4355742, 0.7114778, -1.253519, 1, 1, 1, 1, 1,
-0.4292868, -1.653063, -4.215956, 1, 1, 1, 1, 1,
-0.419675, -0.815078, -2.895849, 1, 1, 1, 1, 1,
-0.4189417, -0.1951809, -3.499287, 1, 1, 1, 1, 1,
-0.417971, 0.961455, -2.512887, 1, 1, 1, 1, 1,
-0.4163482, 0.02726441, -2.484998, 1, 1, 1, 1, 1,
-0.4111857, 0.4579036, -0.63921, 0, 0, 1, 1, 1,
-0.40383, -0.8870072, -3.310731, 1, 0, 0, 1, 1,
-0.4032346, 0.3140439, -0.7574642, 1, 0, 0, 1, 1,
-0.40264, -0.1385957, -1.428979, 1, 0, 0, 1, 1,
-0.3986188, -0.2062182, -2.871417, 1, 0, 0, 1, 1,
-0.3985529, -0.4062349, -2.49497, 1, 0, 0, 1, 1,
-0.3980331, 0.1875519, -1.42058, 0, 0, 0, 1, 1,
-0.3973776, -0.5412156, -1.861447, 0, 0, 0, 1, 1,
-0.3964195, -0.4458, -2.792507, 0, 0, 0, 1, 1,
-0.3963551, 0.2966034, -1.76875, 0, 0, 0, 1, 1,
-0.392197, -0.2625944, -2.201677, 0, 0, 0, 1, 1,
-0.3916669, -0.835717, -1.536465, 0, 0, 0, 1, 1,
-0.390073, -1.46095, -3.084102, 0, 0, 0, 1, 1,
-0.3893927, -0.9256976, -1.909334, 1, 1, 1, 1, 1,
-0.3884802, 1.002892, -0.5715548, 1, 1, 1, 1, 1,
-0.3881631, 0.1998827, -0.1212566, 1, 1, 1, 1, 1,
-0.3875714, 0.6186454, -0.3552283, 1, 1, 1, 1, 1,
-0.3873838, 1.079139, 0.5646331, 1, 1, 1, 1, 1,
-0.3867815, -0.3544239, -2.727426, 1, 1, 1, 1, 1,
-0.3849543, 0.180358, -1.314633, 1, 1, 1, 1, 1,
-0.3833845, -1.404633, -2.424883, 1, 1, 1, 1, 1,
-0.3823853, -0.1059352, -2.348143, 1, 1, 1, 1, 1,
-0.3745674, 0.5824364, -1.996141, 1, 1, 1, 1, 1,
-0.3728532, -0.6359901, -3.815264, 1, 1, 1, 1, 1,
-0.3728388, 0.2748138, -0.3168668, 1, 1, 1, 1, 1,
-0.3704402, 0.5723468, -0.7069762, 1, 1, 1, 1, 1,
-0.3672678, 1.847727, 1.907617, 1, 1, 1, 1, 1,
-0.3666615, -1.239789, -2.820513, 1, 1, 1, 1, 1,
-0.3638829, 0.4056142, -0.932549, 0, 0, 1, 1, 1,
-0.3504064, -1.69442, -0.2310847, 1, 0, 0, 1, 1,
-0.3499358, 1.83855, -1.978347, 1, 0, 0, 1, 1,
-0.3495584, 0.1555448, 0.1820557, 1, 0, 0, 1, 1,
-0.3473118, -0.4257658, -3.491351, 1, 0, 0, 1, 1,
-0.344198, 0.8314862, -1.01589, 1, 0, 0, 1, 1,
-0.339212, -0.4285618, -2.94457, 0, 0, 0, 1, 1,
-0.3231232, 0.8795391, -0.7399574, 0, 0, 0, 1, 1,
-0.315984, 2.015529, 0.7067249, 0, 0, 0, 1, 1,
-0.3112891, 0.8278431, -1.393907, 0, 0, 0, 1, 1,
-0.3106751, -0.8777571, -2.087215, 0, 0, 0, 1, 1,
-0.303057, -1.539808, -3.688947, 0, 0, 0, 1, 1,
-0.295263, -0.4657162, -1.544335, 0, 0, 0, 1, 1,
-0.2946661, 0.09272148, -2.063171, 1, 1, 1, 1, 1,
-0.2934888, -0.8417492, -3.73057, 1, 1, 1, 1, 1,
-0.2919205, 1.381759, -0.9451921, 1, 1, 1, 1, 1,
-0.2917663, -0.8062817, -2.65407, 1, 1, 1, 1, 1,
-0.2910722, 2.166374, 0.1841036, 1, 1, 1, 1, 1,
-0.2903769, 1.420985, 1.250956, 1, 1, 1, 1, 1,
-0.2899246, -0.1898856, -3.120763, 1, 1, 1, 1, 1,
-0.2886391, 1.406801, -0.3108217, 1, 1, 1, 1, 1,
-0.2874707, -0.1178023, -0.9836984, 1, 1, 1, 1, 1,
-0.2866087, 0.2923922, -0.9250834, 1, 1, 1, 1, 1,
-0.28592, 1.041769, 0.05999454, 1, 1, 1, 1, 1,
-0.2856056, -1.363291, -4.784204, 1, 1, 1, 1, 1,
-0.2827296, -1.619492, -2.278736, 1, 1, 1, 1, 1,
-0.2795327, -0.05762451, -2.088866, 1, 1, 1, 1, 1,
-0.2791801, 0.05721552, -1.779365, 1, 1, 1, 1, 1,
-0.2769397, -0.3000296, -2.405681, 0, 0, 1, 1, 1,
-0.2762585, -1.465891, -2.856476, 1, 0, 0, 1, 1,
-0.2760647, -0.6064426, -2.125489, 1, 0, 0, 1, 1,
-0.2751132, -0.9184583, -3.601591, 1, 0, 0, 1, 1,
-0.2737253, -0.3791723, -2.321963, 1, 0, 0, 1, 1,
-0.2628601, 0.4486834, -1.453927, 1, 0, 0, 1, 1,
-0.2615241, 0.9884745, 0.1540095, 0, 0, 0, 1, 1,
-0.2589589, 0.7012197, -0.6511002, 0, 0, 0, 1, 1,
-0.2585874, -0.018785, -2.374334, 0, 0, 0, 1, 1,
-0.248925, 1.235053, 0.3889199, 0, 0, 0, 1, 1,
-0.2469724, -1.329371, -1.803195, 0, 0, 0, 1, 1,
-0.2466819, 1.806695, 0.733281, 0, 0, 0, 1, 1,
-0.2449675, -0.285497, -3.000672, 0, 0, 0, 1, 1,
-0.2437517, -1.933349, -3.508553, 1, 1, 1, 1, 1,
-0.2431684, -0.8983525, -2.857815, 1, 1, 1, 1, 1,
-0.2365209, 2.150558, 1.733441, 1, 1, 1, 1, 1,
-0.2361007, 1.309142, -1.313212, 1, 1, 1, 1, 1,
-0.2325213, 1.309204, -0.2100182, 1, 1, 1, 1, 1,
-0.2295097, 0.9691858, 1.342555, 1, 1, 1, 1, 1,
-0.2280992, -0.03714251, -2.110925, 1, 1, 1, 1, 1,
-0.221924, 1.636269, 0.9356812, 1, 1, 1, 1, 1,
-0.2177776, -1.292652, -1.948122, 1, 1, 1, 1, 1,
-0.2157378, -0.4464122, -3.697068, 1, 1, 1, 1, 1,
-0.2100762, 0.3487428, -1.942725, 1, 1, 1, 1, 1,
-0.2066731, 0.976251, -0.4085979, 1, 1, 1, 1, 1,
-0.20549, 0.1436535, -1.646212, 1, 1, 1, 1, 1,
-0.2045836, 1.51743, -0.9822928, 1, 1, 1, 1, 1,
-0.2017533, -0.3846484, -2.168251, 1, 1, 1, 1, 1,
-0.201061, -1.436727, -2.985795, 0, 0, 1, 1, 1,
-0.2004445, -0.7818487, -3.906137, 1, 0, 0, 1, 1,
-0.1999093, 0.6040556, 1.140793, 1, 0, 0, 1, 1,
-0.1971056, -0.94986, -3.220479, 1, 0, 0, 1, 1,
-0.1965909, 1.985636, 0.1905125, 1, 0, 0, 1, 1,
-0.1960485, 0.9731247, -0.901275, 1, 0, 0, 1, 1,
-0.1917146, -0.2477594, -2.536911, 0, 0, 0, 1, 1,
-0.1910979, -1.32787, -1.709929, 0, 0, 0, 1, 1,
-0.1862097, 0.4999854, -0.3301636, 0, 0, 0, 1, 1,
-0.1828495, -0.3049932, -4.180663, 0, 0, 0, 1, 1,
-0.1823901, 0.4817032, -1.035743, 0, 0, 0, 1, 1,
-0.1818755, 1.289845, -0.1101673, 0, 0, 0, 1, 1,
-0.1816661, -0.395804, -1.553485, 0, 0, 0, 1, 1,
-0.1813617, 0.9834171, -1.550716, 1, 1, 1, 1, 1,
-0.1808266, -0.645614, -2.645476, 1, 1, 1, 1, 1,
-0.1791767, 0.08218022, -1.217943, 1, 1, 1, 1, 1,
-0.1779817, -0.8792323, -3.920924, 1, 1, 1, 1, 1,
-0.1778039, -0.4302011, -2.845185, 1, 1, 1, 1, 1,
-0.1770791, 0.5143375, -0.4786053, 1, 1, 1, 1, 1,
-0.1738741, -1.574887, -5.039034, 1, 1, 1, 1, 1,
-0.1698364, -1.116497, -4.003844, 1, 1, 1, 1, 1,
-0.1655663, -0.04181392, -2.024807, 1, 1, 1, 1, 1,
-0.1647778, -0.7798812, -3.091561, 1, 1, 1, 1, 1,
-0.159659, 0.5315754, -1.589377, 1, 1, 1, 1, 1,
-0.1540221, 0.4626634, -0.4477524, 1, 1, 1, 1, 1,
-0.153477, 0.7844893, 0.5097083, 1, 1, 1, 1, 1,
-0.153263, -0.3134142, -1.737218, 1, 1, 1, 1, 1,
-0.1478366, -0.7816963, -3.073046, 1, 1, 1, 1, 1,
-0.1458882, 0.1913586, -1.469896, 0, 0, 1, 1, 1,
-0.1437447, 1.51728, -0.2474875, 1, 0, 0, 1, 1,
-0.1426682, -0.006230019, -2.553647, 1, 0, 0, 1, 1,
-0.1373324, -0.8288845, -3.816731, 1, 0, 0, 1, 1,
-0.1373009, -0.7740904, -3.440817, 1, 0, 0, 1, 1,
-0.1357555, -0.835776, -3.027472, 1, 0, 0, 1, 1,
-0.132573, -1.321342, -2.392351, 0, 0, 0, 1, 1,
-0.1270072, -1.302499, -2.518398, 0, 0, 0, 1, 1,
-0.124078, -1.492525, -2.466277, 0, 0, 0, 1, 1,
-0.1231757, 0.04157207, -0.5257831, 0, 0, 0, 1, 1,
-0.1231216, -0.09213071, -2.461536, 0, 0, 0, 1, 1,
-0.1168152, 0.8290654, -2.441937, 0, 0, 0, 1, 1,
-0.1163402, 0.2450683, -0.8270482, 0, 0, 0, 1, 1,
-0.1159617, 0.05270842, -2.365518, 1, 1, 1, 1, 1,
-0.1124951, 0.9455181, -0.6580569, 1, 1, 1, 1, 1,
-0.1059626, 0.07735401, -1.56555, 1, 1, 1, 1, 1,
-0.1049524, -1.875082, -0.7140076, 1, 1, 1, 1, 1,
-0.1025821, 1.887126, -0.128517, 1, 1, 1, 1, 1,
-0.09924335, 0.4916354, -0.712655, 1, 1, 1, 1, 1,
-0.09858362, 0.3676353, -0.9135249, 1, 1, 1, 1, 1,
-0.09555948, -0.1053779, -1.678387, 1, 1, 1, 1, 1,
-0.0948826, -0.2591029, -1.882636, 1, 1, 1, 1, 1,
-0.09028357, -1.788409, -5.283294, 1, 1, 1, 1, 1,
-0.08631284, -0.800436, -2.537023, 1, 1, 1, 1, 1,
-0.08546474, 0.387069, 0.3317119, 1, 1, 1, 1, 1,
-0.08422685, 1.351526, -0.07423903, 1, 1, 1, 1, 1,
-0.08231613, 1.922345, -1.083368, 1, 1, 1, 1, 1,
-0.07710339, 0.3562217, -0.8854202, 1, 1, 1, 1, 1,
-0.06907571, 0.1277393, -0.4471507, 0, 0, 1, 1, 1,
-0.06566185, -1.46173, -4.658041, 1, 0, 0, 1, 1,
-0.06511873, -0.6904744, -3.617191, 1, 0, 0, 1, 1,
-0.06365553, -0.048707, -3.802911, 1, 0, 0, 1, 1,
-0.05957787, 0.009494561, -0.07478274, 1, 0, 0, 1, 1,
-0.05744037, -0.5075794, -3.24605, 1, 0, 0, 1, 1,
-0.05485511, 2.458941, -0.7533181, 0, 0, 0, 1, 1,
-0.05384504, -0.4596823, -4.178837, 0, 0, 0, 1, 1,
-0.05378911, -0.5169796, -3.021054, 0, 0, 0, 1, 1,
-0.05221009, 0.2673243, -2.91411, 0, 0, 0, 1, 1,
-0.05067421, -0.4108888, -3.888662, 0, 0, 0, 1, 1,
-0.04743143, 0.5404466, -1.480997, 0, 0, 0, 1, 1,
-0.04398558, 0.09406663, -0.29851, 0, 0, 0, 1, 1,
-0.04164372, -0.3415317, -1.546221, 1, 1, 1, 1, 1,
-0.04025503, -0.5018867, -3.338598, 1, 1, 1, 1, 1,
-0.03960094, 0.4236567, -0.6698493, 1, 1, 1, 1, 1,
-0.03930388, -0.4629872, -3.780844, 1, 1, 1, 1, 1,
-0.03915069, -0.004581596, -3.558757, 1, 1, 1, 1, 1,
-0.03739336, 1.688099, 0.4852265, 1, 1, 1, 1, 1,
-0.0362457, -0.8415185, -3.143392, 1, 1, 1, 1, 1,
-0.03544615, 0.5631943, -0.056763, 1, 1, 1, 1, 1,
-0.03162676, 0.4070661, -0.375593, 1, 1, 1, 1, 1,
-0.0286695, -0.002843504, -2.576776, 1, 1, 1, 1, 1,
-0.02725111, -2.062073, -3.444697, 1, 1, 1, 1, 1,
-0.02197273, 0.8009987, -0.2725021, 1, 1, 1, 1, 1,
-0.01754273, 0.5222135, -0.08302969, 1, 1, 1, 1, 1,
-0.01717803, 0.5785832, 0.5939713, 1, 1, 1, 1, 1,
-0.01308613, -0.4478357, -3.438166, 1, 1, 1, 1, 1,
-0.008712285, 0.1874334, 1.079232, 0, 0, 1, 1, 1,
-0.003865949, -1.433721, -2.891201, 1, 0, 0, 1, 1,
-0.003506975, 0.6288399, -0.3884961, 1, 0, 0, 1, 1,
0.001753529, -0.9455776, 1.842171, 1, 0, 0, 1, 1,
0.005515207, 0.7698414, 0.2832156, 1, 0, 0, 1, 1,
0.006405513, -0.5430147, 2.615275, 1, 0, 0, 1, 1,
0.009727275, 0.1255747, -0.2852915, 0, 0, 0, 1, 1,
0.01007422, -2.646677, 3.645578, 0, 0, 0, 1, 1,
0.01592515, -0.262295, 3.394598, 0, 0, 0, 1, 1,
0.01708042, -2.773188, 3.686753, 0, 0, 0, 1, 1,
0.01801811, -1.441261, 4.129567, 0, 0, 0, 1, 1,
0.01833366, -0.605939, 3.624876, 0, 0, 0, 1, 1,
0.01898104, -0.07939532, 2.784382, 0, 0, 0, 1, 1,
0.01994843, 1.759489, 0.356678, 1, 1, 1, 1, 1,
0.02214647, 0.4361258, -0.2485391, 1, 1, 1, 1, 1,
0.02455645, 1.440402, 0.8707221, 1, 1, 1, 1, 1,
0.02474543, 0.8634672, -0.2429415, 1, 1, 1, 1, 1,
0.02763571, -0.234359, 3.408202, 1, 1, 1, 1, 1,
0.03311757, -0.4463856, 3.329086, 1, 1, 1, 1, 1,
0.03366716, 1.736485, 1.916934, 1, 1, 1, 1, 1,
0.03799896, 0.8466057, 1.09462, 1, 1, 1, 1, 1,
0.04483129, 0.1358118, -0.1653378, 1, 1, 1, 1, 1,
0.04486595, 0.1818271, -0.5816809, 1, 1, 1, 1, 1,
0.04523355, 0.1983918, -0.04735122, 1, 1, 1, 1, 1,
0.04711806, -0.6129167, 3.156713, 1, 1, 1, 1, 1,
0.05112776, -0.09663083, 2.71513, 1, 1, 1, 1, 1,
0.05193891, 1.23221, -0.04491299, 1, 1, 1, 1, 1,
0.05490323, 0.3391956, 2.097136, 1, 1, 1, 1, 1,
0.06246249, 0.8994488, -0.06708302, 0, 0, 1, 1, 1,
0.06354275, 0.8677511, 1.439672, 1, 0, 0, 1, 1,
0.06623372, 0.8945295, 0.4426408, 1, 0, 0, 1, 1,
0.06779089, -1.015983, 1.607844, 1, 0, 0, 1, 1,
0.06845951, 0.3742926, 0.888011, 1, 0, 0, 1, 1,
0.07277834, -0.5540776, 3.737483, 1, 0, 0, 1, 1,
0.07658532, -0.5319765, 3.329274, 0, 0, 0, 1, 1,
0.0796625, -0.3167557, 2.399789, 0, 0, 0, 1, 1,
0.0802042, -1.652416, 1.773437, 0, 0, 0, 1, 1,
0.08385112, -0.2819153, 2.116671, 0, 0, 0, 1, 1,
0.09175855, 1.539119, 0.8325586, 0, 0, 0, 1, 1,
0.09771504, -0.7525495, 2.459064, 0, 0, 0, 1, 1,
0.1042024, 0.4678857, 0.6154561, 0, 0, 0, 1, 1,
0.104403, -1.108377, 2.787488, 1, 1, 1, 1, 1,
0.1051877, -0.5604219, 2.683821, 1, 1, 1, 1, 1,
0.1056374, -0.849171, 2.858612, 1, 1, 1, 1, 1,
0.1076587, 0.9774055, 0.5621149, 1, 1, 1, 1, 1,
0.1078338, -0.4075977, 3.492138, 1, 1, 1, 1, 1,
0.1141059, -2.896097, 3.000596, 1, 1, 1, 1, 1,
0.1146259, -0.09258461, 0.9837819, 1, 1, 1, 1, 1,
0.1154985, 0.8970454, -1.192496, 1, 1, 1, 1, 1,
0.1209432, -0.1701661, 2.318625, 1, 1, 1, 1, 1,
0.1226441, -1.042858, 4.222728, 1, 1, 1, 1, 1,
0.1227829, 0.4495028, 1.224415, 1, 1, 1, 1, 1,
0.1262439, -1.053129, 2.541126, 1, 1, 1, 1, 1,
0.1269401, -2.425914, 2.995863, 1, 1, 1, 1, 1,
0.1312488, -0.3734383, 2.612657, 1, 1, 1, 1, 1,
0.131473, -0.9299396, 2.914365, 1, 1, 1, 1, 1,
0.1335391, 1.362001, 3.268147, 0, 0, 1, 1, 1,
0.1388227, -1.283594, 1.323654, 1, 0, 0, 1, 1,
0.1470798, -1.252441, 3.415494, 1, 0, 0, 1, 1,
0.1481123, -0.102827, 3.217082, 1, 0, 0, 1, 1,
0.1533927, 1.247378, 1.422904, 1, 0, 0, 1, 1,
0.1541044, -0.7654005, 3.878269, 1, 0, 0, 1, 1,
0.1616011, 1.458928, -0.7797304, 0, 0, 0, 1, 1,
0.1624187, -0.702876, 2.873552, 0, 0, 0, 1, 1,
0.1632409, -1.160402, 3.170824, 0, 0, 0, 1, 1,
0.1643263, 1.342223, -0.342186, 0, 0, 0, 1, 1,
0.1673633, -0.2783519, 2.246569, 0, 0, 0, 1, 1,
0.1705202, 0.2075071, -0.1197529, 0, 0, 0, 1, 1,
0.1755936, -1.4933, 3.79791, 0, 0, 0, 1, 1,
0.1847638, -1.282402, 3.357084, 1, 1, 1, 1, 1,
0.1870846, 0.4759685, 1.484131, 1, 1, 1, 1, 1,
0.1903656, -0.4626538, 1.841827, 1, 1, 1, 1, 1,
0.1906502, -1.392876, 3.137376, 1, 1, 1, 1, 1,
0.1921698, 0.3801862, -0.1634719, 1, 1, 1, 1, 1,
0.1926361, -1.116571, 3.064291, 1, 1, 1, 1, 1,
0.1934564, 0.7323024, 1.710588, 1, 1, 1, 1, 1,
0.1945204, 0.910468, -1.031765, 1, 1, 1, 1, 1,
0.197129, 0.29201, 0.650014, 1, 1, 1, 1, 1,
0.1982649, -1.311936, 5.372879, 1, 1, 1, 1, 1,
0.2051654, -1.543761, 2.146591, 1, 1, 1, 1, 1,
0.2052176, 0.9461845, 0.445009, 1, 1, 1, 1, 1,
0.2099813, -0.9794534, 1.566509, 1, 1, 1, 1, 1,
0.2100489, -1.688216, 2.783711, 1, 1, 1, 1, 1,
0.2106211, -0.4386993, 4.752797, 1, 1, 1, 1, 1,
0.2110362, -0.4090308, 1.932597, 0, 0, 1, 1, 1,
0.2123449, 0.993636, 0.8608536, 1, 0, 0, 1, 1,
0.2126406, 0.1259447, 0.253947, 1, 0, 0, 1, 1,
0.2137233, -0.6295754, 2.069248, 1, 0, 0, 1, 1,
0.2158668, -1.00466, 2.808428, 1, 0, 0, 1, 1,
0.2178306, 2.205521, 2.381582, 1, 0, 0, 1, 1,
0.2180148, -0.7904552, 2.54835, 0, 0, 0, 1, 1,
0.2187796, 1.509833, 1.690907, 0, 0, 0, 1, 1,
0.221208, -0.4460853, 0.9826674, 0, 0, 0, 1, 1,
0.2258151, 2.309495, -0.904852, 0, 0, 0, 1, 1,
0.226917, -1.324942, 4.341924, 0, 0, 0, 1, 1,
0.2285617, 0.7615312, 0.4498227, 0, 0, 0, 1, 1,
0.233435, 0.9434333, 0.6749575, 0, 0, 0, 1, 1,
0.2376423, 0.4408058, -0.5471748, 1, 1, 1, 1, 1,
0.2386842, -0.2846021, 1.392414, 1, 1, 1, 1, 1,
0.2545356, -0.01333908, 1.779945, 1, 1, 1, 1, 1,
0.2551232, 0.2427136, -0.6200781, 1, 1, 1, 1, 1,
0.2647713, 1.783787, -0.5320805, 1, 1, 1, 1, 1,
0.2655397, 0.5481405, 2.032941, 1, 1, 1, 1, 1,
0.2689781, 0.9102952, 0.6045725, 1, 1, 1, 1, 1,
0.2710477, 0.3909145, 0.2315664, 1, 1, 1, 1, 1,
0.2731233, -0.8448549, 2.630878, 1, 1, 1, 1, 1,
0.2737501, 0.3145725, 0.492441, 1, 1, 1, 1, 1,
0.2751614, -0.03918733, -0.3882613, 1, 1, 1, 1, 1,
0.2762046, 0.07276785, 2.331531, 1, 1, 1, 1, 1,
0.2835025, 0.4390514, 0.1046947, 1, 1, 1, 1, 1,
0.286561, 0.8921747, -1.106599, 1, 1, 1, 1, 1,
0.288539, -1.024021, 3.116251, 1, 1, 1, 1, 1,
0.2948819, -0.2929711, 1.890543, 0, 0, 1, 1, 1,
0.2965507, -1.493226, 2.578349, 1, 0, 0, 1, 1,
0.2969744, 0.0641522, 1.711965, 1, 0, 0, 1, 1,
0.2972964, 0.7564161, 0.4866948, 1, 0, 0, 1, 1,
0.2981443, -1.462825, 1.39573, 1, 0, 0, 1, 1,
0.2992873, -0.1793533, 2.660769, 1, 0, 0, 1, 1,
0.3003049, 0.4640818, -1.222013, 0, 0, 0, 1, 1,
0.3049156, -0.01000225, 0.9946072, 0, 0, 0, 1, 1,
0.3052745, 1.66675, 0.02097084, 0, 0, 0, 1, 1,
0.3076922, -1.390341, 3.013613, 0, 0, 0, 1, 1,
0.3077269, -0.3697103, 3.065975, 0, 0, 0, 1, 1,
0.311762, -1.598677, 2.657691, 0, 0, 0, 1, 1,
0.3133664, 0.4303294, -0.04908026, 0, 0, 0, 1, 1,
0.3161901, -0.1881341, 2.629024, 1, 1, 1, 1, 1,
0.3188324, 0.5049848, 0.9869707, 1, 1, 1, 1, 1,
0.3219695, 0.3296236, 0.9882134, 1, 1, 1, 1, 1,
0.3236589, 1.145018, 2.565405, 1, 1, 1, 1, 1,
0.3255044, 0.2835371, 0.3219727, 1, 1, 1, 1, 1,
0.3271923, -0.1498983, 3.15482, 1, 1, 1, 1, 1,
0.3346307, -0.729511, 1.590189, 1, 1, 1, 1, 1,
0.3375682, 0.3488787, 0.8758873, 1, 1, 1, 1, 1,
0.3392651, 0.7534886, 1.286114, 1, 1, 1, 1, 1,
0.3424911, -0.08927087, 4.930911, 1, 1, 1, 1, 1,
0.3436173, -2.738683, 3.528775, 1, 1, 1, 1, 1,
0.3484151, 1.419633, -0.7155121, 1, 1, 1, 1, 1,
0.3499968, 0.4983103, 1.756307, 1, 1, 1, 1, 1,
0.3514003, 0.2080318, 0.4673632, 1, 1, 1, 1, 1,
0.3592303, 1.061689, -0.766353, 1, 1, 1, 1, 1,
0.3619552, 1.070143, -0.3174194, 0, 0, 1, 1, 1,
0.3620427, -0.904487, 2.810905, 1, 0, 0, 1, 1,
0.3641071, 0.4261613, 0.6315582, 1, 0, 0, 1, 1,
0.3646649, -2.531402, 3.353033, 1, 0, 0, 1, 1,
0.3764559, -0.6690378, 1.64096, 1, 0, 0, 1, 1,
0.379189, -0.8287236, 3.226986, 1, 0, 0, 1, 1,
0.3809879, -0.1796826, 1.456082, 0, 0, 0, 1, 1,
0.3817366, 1.915723, 1.329879, 0, 0, 0, 1, 1,
0.3821452, 0.861618, 0.4984683, 0, 0, 0, 1, 1,
0.3831306, -0.6951801, 2.074928, 0, 0, 0, 1, 1,
0.3884509, 0.2560987, 1.366888, 0, 0, 0, 1, 1,
0.3936415, -1.090881, 3.251282, 0, 0, 0, 1, 1,
0.3971652, -0.9355831, 3.292841, 0, 0, 0, 1, 1,
0.3999991, 0.2357792, 0.06480667, 1, 1, 1, 1, 1,
0.400442, -1.895823, 2.151146, 1, 1, 1, 1, 1,
0.400875, -0.796019, 1.855626, 1, 1, 1, 1, 1,
0.4119906, -2.217996, 3.874928, 1, 1, 1, 1, 1,
0.4162525, -1.514131, 2.102712, 1, 1, 1, 1, 1,
0.4200736, -0.841147, 2.782582, 1, 1, 1, 1, 1,
0.4218201, 0.6862875, -0.07967076, 1, 1, 1, 1, 1,
0.4218709, -1.112067, 1.513259, 1, 1, 1, 1, 1,
0.4253787, -1.347094, 3.593152, 1, 1, 1, 1, 1,
0.4255594, 0.9613803, -0.5847702, 1, 1, 1, 1, 1,
0.4459141, 1.308496, 0.4923389, 1, 1, 1, 1, 1,
0.4468993, -1.732449, 2.366018, 1, 1, 1, 1, 1,
0.4513076, 1.006547, 0.8020967, 1, 1, 1, 1, 1,
0.4524624, 0.2759005, 1.163864, 1, 1, 1, 1, 1,
0.4525841, -1.169591, 3.766266, 1, 1, 1, 1, 1,
0.4531246, -2.11637, 3.215395, 0, 0, 1, 1, 1,
0.4565875, 0.7158013, 0.04029961, 1, 0, 0, 1, 1,
0.4567028, -1.242512, 2.721183, 1, 0, 0, 1, 1,
0.4600243, -0.04942783, 1.765839, 1, 0, 0, 1, 1,
0.470695, 1.79648, -0.2711622, 1, 0, 0, 1, 1,
0.4731973, 0.400863, 1.098211, 1, 0, 0, 1, 1,
0.4736966, 0.3289095, 1.748416, 0, 0, 0, 1, 1,
0.4743865, -1.170401, 4.112739, 0, 0, 0, 1, 1,
0.4760786, 0.1659456, 2.708132, 0, 0, 0, 1, 1,
0.4826543, -0.8310954, 3.050224, 0, 0, 0, 1, 1,
0.4937963, -1.112552, 1.857621, 0, 0, 0, 1, 1,
0.4980616, 0.09605554, -0.4386905, 0, 0, 0, 1, 1,
0.5019417, 0.7202362, 0.3265246, 0, 0, 0, 1, 1,
0.5084403, -0.3332113, 1.496007, 1, 1, 1, 1, 1,
0.5116998, -0.02933684, 1.430656, 1, 1, 1, 1, 1,
0.5120061, -0.9995227, 2.132729, 1, 1, 1, 1, 1,
0.5159801, 0.3695467, 1.760163, 1, 1, 1, 1, 1,
0.5183113, 0.04985969, 2.387751, 1, 1, 1, 1, 1,
0.5203905, -1.45294, 3.70336, 1, 1, 1, 1, 1,
0.521654, -0.4740132, 3.186826, 1, 1, 1, 1, 1,
0.5268191, 1.074235, -1.045464, 1, 1, 1, 1, 1,
0.5289198, -0.227151, 2.67646, 1, 1, 1, 1, 1,
0.5339532, 0.8429915, 1.556042, 1, 1, 1, 1, 1,
0.5405384, 0.3234494, 0.5723037, 1, 1, 1, 1, 1,
0.5421005, -0.6673906, 2.123179, 1, 1, 1, 1, 1,
0.5422412, 0.4887155, 1.756214, 1, 1, 1, 1, 1,
0.545027, 0.1362205, 1.320749, 1, 1, 1, 1, 1,
0.5455098, 1.292275, 0.4036504, 1, 1, 1, 1, 1,
0.5473058, -0.679732, 2.46361, 0, 0, 1, 1, 1,
0.5473523, -0.5799239, 2.566475, 1, 0, 0, 1, 1,
0.5506958, -1.387453, 4.839, 1, 0, 0, 1, 1,
0.5512444, -1.133703, 1.66967, 1, 0, 0, 1, 1,
0.5521736, -0.1753297, 3.411027, 1, 0, 0, 1, 1,
0.5573075, -2.218883, 4.23621, 1, 0, 0, 1, 1,
0.5650222, 0.2726729, 1.699418, 0, 0, 0, 1, 1,
0.5771831, -0.05641878, 0.7665198, 0, 0, 0, 1, 1,
0.5810739, 0.4610665, -0.1232545, 0, 0, 0, 1, 1,
0.5822306, -0.4378197, 4.152132, 0, 0, 0, 1, 1,
0.5868844, -0.9486927, 2.534961, 0, 0, 0, 1, 1,
0.5882396, -0.3924227, 2.153329, 0, 0, 0, 1, 1,
0.5896004, 0.1033419, 1.202756, 0, 0, 0, 1, 1,
0.5966592, 0.5752015, 0.3365201, 1, 1, 1, 1, 1,
0.5966674, -0.479667, 2.017972, 1, 1, 1, 1, 1,
0.5972601, 0.1454764, 1.796324, 1, 1, 1, 1, 1,
0.60119, 0.4720713, 0.5058982, 1, 1, 1, 1, 1,
0.6048073, -1.988426, 1.907647, 1, 1, 1, 1, 1,
0.6110045, 0.2490521, 1.550795, 1, 1, 1, 1, 1,
0.6112289, 0.3095646, -0.1220329, 1, 1, 1, 1, 1,
0.6125203, 0.1694684, 0.5549517, 1, 1, 1, 1, 1,
0.6158159, 0.3487987, -0.2656864, 1, 1, 1, 1, 1,
0.6162076, 0.7395174, 0.9016657, 1, 1, 1, 1, 1,
0.6166603, -0.7521635, 4.493684, 1, 1, 1, 1, 1,
0.6224136, 0.5667203, 1.308077, 1, 1, 1, 1, 1,
0.6252556, -0.9994671, 1.053128, 1, 1, 1, 1, 1,
0.6314026, 0.8326399, -0.3193644, 1, 1, 1, 1, 1,
0.6322094, 0.7682304, 1.230353, 1, 1, 1, 1, 1,
0.6344683, 0.09678543, 1.386006, 0, 0, 1, 1, 1,
0.6384315, 0.1409561, 2.390574, 1, 0, 0, 1, 1,
0.6384322, 0.5790308, -0.4069481, 1, 0, 0, 1, 1,
0.6403947, 1.396533, 0.4328651, 1, 0, 0, 1, 1,
0.6410725, -1.821492, 3.085385, 1, 0, 0, 1, 1,
0.6418035, -0.9638361, 1.453489, 1, 0, 0, 1, 1,
0.6442986, 0.2670404, 1.890105, 0, 0, 0, 1, 1,
0.6444594, 0.5384517, 1.334172, 0, 0, 0, 1, 1,
0.6474507, -0.07110334, 2.625305, 0, 0, 0, 1, 1,
0.6544334, 0.6084403, 0.2852319, 0, 0, 0, 1, 1,
0.6547914, -0.6659933, 2.794953, 0, 0, 0, 1, 1,
0.6624656, 1.726851, -0.3164943, 0, 0, 0, 1, 1,
0.6635026, -1.188078, 1.193439, 0, 0, 0, 1, 1,
0.6665497, -1.486174, 2.07967, 1, 1, 1, 1, 1,
0.668413, -0.8481077, 1.142252, 1, 1, 1, 1, 1,
0.676851, 0.5323399, 1.155969, 1, 1, 1, 1, 1,
0.6872389, -1.020069, 2.332905, 1, 1, 1, 1, 1,
0.6873704, -1.088992, 2.536596, 1, 1, 1, 1, 1,
0.6888046, -0.3691534, 2.9268, 1, 1, 1, 1, 1,
0.6934342, 0.4503754, 1.662133, 1, 1, 1, 1, 1,
0.6948929, -0.4665434, 3.991106, 1, 1, 1, 1, 1,
0.6951148, -0.01837919, 0.04058601, 1, 1, 1, 1, 1,
0.6958599, 0.7183806, 0.01422095, 1, 1, 1, 1, 1,
0.6966132, -0.6305124, 2.110431, 1, 1, 1, 1, 1,
0.6991186, 0.7318211, 1.376552, 1, 1, 1, 1, 1,
0.7042247, 0.909501, 1.360702, 1, 1, 1, 1, 1,
0.7072203, 0.7885631, -0.2823412, 1, 1, 1, 1, 1,
0.7118375, 0.8414946, 1.747159, 1, 1, 1, 1, 1,
0.7138153, 0.01963696, 1.522046, 0, 0, 1, 1, 1,
0.7141548, -0.08341319, 0.3387699, 1, 0, 0, 1, 1,
0.7149035, 0.1639423, 0.3530115, 1, 0, 0, 1, 1,
0.7151474, 1.798673, -0.7789985, 1, 0, 0, 1, 1,
0.7195364, 1.973102, -0.0562579, 1, 0, 0, 1, 1,
0.7203609, -1.481593, 2.991782, 1, 0, 0, 1, 1,
0.724845, -0.736515, 0.5229865, 0, 0, 0, 1, 1,
0.7267514, 0.2616278, 0.7034959, 0, 0, 0, 1, 1,
0.7333105, 1.060499, 2.071733, 0, 0, 0, 1, 1,
0.7381933, 0.233539, 0.4545122, 0, 0, 0, 1, 1,
0.744743, -0.2391722, 1.921749, 0, 0, 0, 1, 1,
0.7454729, -1.256283, 1.551001, 0, 0, 0, 1, 1,
0.7456105, -0.1126646, 1.906611, 0, 0, 0, 1, 1,
0.7476016, -0.7895563, 0.5786704, 1, 1, 1, 1, 1,
0.7583856, -1.843279, 3.422534, 1, 1, 1, 1, 1,
0.7603275, -1.487367, 3.911589, 1, 1, 1, 1, 1,
0.7642063, -1.076997, 2.231903, 1, 1, 1, 1, 1,
0.7669747, -1.54571, 1.505748, 1, 1, 1, 1, 1,
0.7716443, 2.252231, 1.437877, 1, 1, 1, 1, 1,
0.7739703, -0.409752, 2.380826, 1, 1, 1, 1, 1,
0.7768678, 0.7625467, 1.002445, 1, 1, 1, 1, 1,
0.7794051, 0.2644551, -0.3448234, 1, 1, 1, 1, 1,
0.7867242, 0.8361825, 1.977098, 1, 1, 1, 1, 1,
0.7891158, 0.4894312, 1.28562, 1, 1, 1, 1, 1,
0.7904164, -2.330998, 1.21753, 1, 1, 1, 1, 1,
0.7919299, 1.151919, -1.20956, 1, 1, 1, 1, 1,
0.7983588, 1.392255, -1.281921, 1, 1, 1, 1, 1,
0.8029307, 0.6816506, 0.3675095, 1, 1, 1, 1, 1,
0.8032146, -1.116334, 1.806424, 0, 0, 1, 1, 1,
0.8052403, -0.2422667, 0.7860193, 1, 0, 0, 1, 1,
0.8063904, -0.2900853, 2.286651, 1, 0, 0, 1, 1,
0.8117614, 1.645726, -0.3632209, 1, 0, 0, 1, 1,
0.8120067, -0.9589945, 1.976086, 1, 0, 0, 1, 1,
0.8163764, 1.041307, 1.124331, 1, 0, 0, 1, 1,
0.8174664, -2.162086, 2.64361, 0, 0, 0, 1, 1,
0.8207159, -0.5135189, 1.863471, 0, 0, 0, 1, 1,
0.8246878, -1.027344, 4.217586, 0, 0, 0, 1, 1,
0.8266242, 0.3877079, 0.8701438, 0, 0, 0, 1, 1,
0.8329256, 1.05155, 0.1127962, 0, 0, 0, 1, 1,
0.8361626, -0.4776427, 1.44578, 0, 0, 0, 1, 1,
0.8385395, -0.4969591, 1.534602, 0, 0, 0, 1, 1,
0.8402519, 1.442728, 0.2720767, 1, 1, 1, 1, 1,
0.8423797, -0.1317309, 1.066493, 1, 1, 1, 1, 1,
0.8425109, -0.405009, 2.108166, 1, 1, 1, 1, 1,
0.8480421, 0.9776223, 1.640125, 1, 1, 1, 1, 1,
0.8555794, -0.3014746, 3.138672, 1, 1, 1, 1, 1,
0.8594094, 0.9157666, 0.706091, 1, 1, 1, 1, 1,
0.86009, 0.4462151, 1.197918, 1, 1, 1, 1, 1,
0.8604836, -0.1831476, 2.100682, 1, 1, 1, 1, 1,
0.8641359, -1.447758, 2.422918, 1, 1, 1, 1, 1,
0.8646339, -0.4648858, 2.000914, 1, 1, 1, 1, 1,
0.8685691, 0.2147525, 1.510385, 1, 1, 1, 1, 1,
0.8721598, 0.9503491, 2.444636, 1, 1, 1, 1, 1,
0.8795971, 0.09875894, 0.5960988, 1, 1, 1, 1, 1,
0.8858765, 1.449782, 0.4645419, 1, 1, 1, 1, 1,
0.8915634, -0.5317318, 1.488897, 1, 1, 1, 1, 1,
0.8939084, -0.497401, 1.455095, 0, 0, 1, 1, 1,
0.8951887, 0.1116424, 0.1540965, 1, 0, 0, 1, 1,
0.8986964, -0.4898017, 3.086925, 1, 0, 0, 1, 1,
0.900347, 0.8867211, 1.312126, 1, 0, 0, 1, 1,
0.9011348, 1.1488, 1.366561, 1, 0, 0, 1, 1,
0.9021487, 0.9411573, 1.261573, 1, 0, 0, 1, 1,
0.9095991, -0.1489976, 0.3692722, 0, 0, 0, 1, 1,
0.9109619, 1.824474, -1.700746, 0, 0, 0, 1, 1,
0.9201375, -0.3879361, 0.4565554, 0, 0, 0, 1, 1,
0.9205297, 0.9380565, 0.469726, 0, 0, 0, 1, 1,
0.9215222, 0.6825131, 1.533786, 0, 0, 0, 1, 1,
0.9225467, -2.177529, 1.91564, 0, 0, 0, 1, 1,
0.9270476, -0.4606495, 3.215703, 0, 0, 0, 1, 1,
0.9442539, -1.152764, 4.046901, 1, 1, 1, 1, 1,
0.952354, 1.47405, 0.1324328, 1, 1, 1, 1, 1,
0.9527913, -2.101318, 2.11193, 1, 1, 1, 1, 1,
0.9558354, 2.003795, 0.8610201, 1, 1, 1, 1, 1,
0.9613518, 0.6292792, 0.06317746, 1, 1, 1, 1, 1,
0.9643083, -0.1140474, 2.918847, 1, 1, 1, 1, 1,
0.966424, 0.8901321, 0.9775895, 1, 1, 1, 1, 1,
0.9679897, -1.560614, 1.496203, 1, 1, 1, 1, 1,
0.9681285, 0.5208153, 0.4035027, 1, 1, 1, 1, 1,
0.970959, -0.06197439, 0.9573539, 1, 1, 1, 1, 1,
0.9758078, 0.7581986, 0.3642631, 1, 1, 1, 1, 1,
0.9821298, 1.059419, 1.308746, 1, 1, 1, 1, 1,
0.9832565, 1.581535, -0.2273676, 1, 1, 1, 1, 1,
0.9842502, -0.1909296, 3.629687, 1, 1, 1, 1, 1,
0.9843272, 0.2708064, 1.227285, 1, 1, 1, 1, 1,
0.9932148, -0.8892983, 2.67022, 0, 0, 1, 1, 1,
0.9956637, 0.5003335, 1.371801, 1, 0, 0, 1, 1,
0.9958655, -0.1978944, 1.950869, 1, 0, 0, 1, 1,
0.9979438, -0.1259951, 2.616639, 1, 0, 0, 1, 1,
1.000384, 0.5215342, 1.746615, 1, 0, 0, 1, 1,
1.01214, 0.670615, 0.002686866, 1, 0, 0, 1, 1,
1.020618, 1.449111, -0.3754778, 0, 0, 0, 1, 1,
1.02368, -1.05291, 1.254961, 0, 0, 0, 1, 1,
1.024213, -0.2247923, 1.35694, 0, 0, 0, 1, 1,
1.03404, -0.2704931, 0.9364118, 0, 0, 0, 1, 1,
1.034056, -0.2042829, -0.1196904, 0, 0, 0, 1, 1,
1.040887, -0.5214131, 2.973567, 0, 0, 0, 1, 1,
1.050282, -0.5695111, 1.541288, 0, 0, 0, 1, 1,
1.050573, -0.1935545, 1.656401, 1, 1, 1, 1, 1,
1.055486, -0.3033229, 1.861883, 1, 1, 1, 1, 1,
1.060654, -0.8221571, 2.58783, 1, 1, 1, 1, 1,
1.062762, 1.536051, 1.171997, 1, 1, 1, 1, 1,
1.064491, -0.1526483, 0.7439035, 1, 1, 1, 1, 1,
1.06864, 0.6245661, 1.872481, 1, 1, 1, 1, 1,
1.068931, -1.547119, 1.012589, 1, 1, 1, 1, 1,
1.072874, -1.596334, 1.909301, 1, 1, 1, 1, 1,
1.074153, 0.5073384, 2.465058, 1, 1, 1, 1, 1,
1.074684, 0.201825, 0.7972692, 1, 1, 1, 1, 1,
1.079217, 0.6152345, 3.203061, 1, 1, 1, 1, 1,
1.087217, -0.5489702, 1.58412, 1, 1, 1, 1, 1,
1.101081, 1.84329, -0.3392923, 1, 1, 1, 1, 1,
1.102432, -1.045397, 2.239092, 1, 1, 1, 1, 1,
1.107963, -0.4437548, 3.052788, 1, 1, 1, 1, 1,
1.10973, -0.4968855, 2.319345, 0, 0, 1, 1, 1,
1.112841, -0.1270426, 1.377376, 1, 0, 0, 1, 1,
1.113251, 0.3788132, -0.3588994, 1, 0, 0, 1, 1,
1.113264, -0.84841, 2.591122, 1, 0, 0, 1, 1,
1.116652, -0.4522913, 2.133563, 1, 0, 0, 1, 1,
1.129832, 0.2416496, 0.8509631, 1, 0, 0, 1, 1,
1.144694, -0.2794664, 1.973129, 0, 0, 0, 1, 1,
1.157776, 0.1829654, 1.56711, 0, 0, 0, 1, 1,
1.163274, -1.196113, 2.572061, 0, 0, 0, 1, 1,
1.170062, -0.8136988, 2.754641, 0, 0, 0, 1, 1,
1.187597, 0.270176, 1.591539, 0, 0, 0, 1, 1,
1.191781, 1.262775, 0.4698894, 0, 0, 0, 1, 1,
1.198189, 0.6452227, -0.004663185, 0, 0, 0, 1, 1,
1.198714, 1.33977, 0.6536933, 1, 1, 1, 1, 1,
1.199215, -0.3948576, 1.479448, 1, 1, 1, 1, 1,
1.202164, -0.4254225, 1.637152, 1, 1, 1, 1, 1,
1.20252, -0.8736146, 0.7876401, 1, 1, 1, 1, 1,
1.202526, 1.367701, 0.2706638, 1, 1, 1, 1, 1,
1.202646, 0.2763788, 1.039485, 1, 1, 1, 1, 1,
1.205942, -0.6150772, 0.1978019, 1, 1, 1, 1, 1,
1.210547, -1.048472, 1.932002, 1, 1, 1, 1, 1,
1.213129, 1.351186, 0.5009319, 1, 1, 1, 1, 1,
1.22343, 1.182802, 0.8187671, 1, 1, 1, 1, 1,
1.226811, -1.08961, 0.8303456, 1, 1, 1, 1, 1,
1.228047, 1.264938, 0.7751068, 1, 1, 1, 1, 1,
1.24067, -0.06854853, 0.4708128, 1, 1, 1, 1, 1,
1.246212, 0.5753478, -0.121441, 1, 1, 1, 1, 1,
1.246418, -1.827173, 1.475065, 1, 1, 1, 1, 1,
1.246453, 0.6939825, 1.728718, 0, 0, 1, 1, 1,
1.252152, -0.4852128, 2.075062, 1, 0, 0, 1, 1,
1.258059, 1.349663, 2.068052, 1, 0, 0, 1, 1,
1.258839, -0.9873766, 0.7577696, 1, 0, 0, 1, 1,
1.269342, 0.8547833, -0.2470022, 1, 0, 0, 1, 1,
1.27202, 1.081966, 1.361788, 1, 0, 0, 1, 1,
1.281179, -1.365741, 1.662797, 0, 0, 0, 1, 1,
1.282862, -0.2705258, 1.18847, 0, 0, 0, 1, 1,
1.283527, -0.6066638, 2.794013, 0, 0, 0, 1, 1,
1.293492, -1.224925, 1.446236, 0, 0, 0, 1, 1,
1.320657, 1.535455, -0.2458664, 0, 0, 0, 1, 1,
1.324127, -0.8455577, 4.263107, 0, 0, 0, 1, 1,
1.325759, -0.347202, 0.5537682, 0, 0, 0, 1, 1,
1.331168, 0.8798942, 0.650207, 1, 1, 1, 1, 1,
1.332855, 0.52422, 0.1507546, 1, 1, 1, 1, 1,
1.340879, 0.5043519, 0.4217142, 1, 1, 1, 1, 1,
1.340907, 0.4808639, 3.160281, 1, 1, 1, 1, 1,
1.343581, -0.8036497, 1.720269, 1, 1, 1, 1, 1,
1.353518, 0.4032852, 1.344666, 1, 1, 1, 1, 1,
1.368383, 0.9921101, 2.131397, 1, 1, 1, 1, 1,
1.385034, -0.7503898, 3.076122, 1, 1, 1, 1, 1,
1.389753, 0.977266, 0.6346003, 1, 1, 1, 1, 1,
1.394373, -1.076942, 3.611215, 1, 1, 1, 1, 1,
1.396654, -1.327972, -0.3195829, 1, 1, 1, 1, 1,
1.405176, -0.2023738, 3.316292, 1, 1, 1, 1, 1,
1.411334, 0.1401074, 0.9887824, 1, 1, 1, 1, 1,
1.412608, 0.2012947, 2.912686, 1, 1, 1, 1, 1,
1.415493, -0.773014, 1.440499, 1, 1, 1, 1, 1,
1.419441, 0.3999525, 0.9685726, 0, 0, 1, 1, 1,
1.427718, -0.2699312, 2.070645, 1, 0, 0, 1, 1,
1.428944, -0.2191852, 1.277145, 1, 0, 0, 1, 1,
1.4328, -0.6121157, 2.089792, 1, 0, 0, 1, 1,
1.43303, 0.2873129, 1.551107, 1, 0, 0, 1, 1,
1.435601, -0.4577492, 3.458351, 1, 0, 0, 1, 1,
1.449491, -3.114348, 2.091892, 0, 0, 0, 1, 1,
1.462189, 0.201178, 0.9115339, 0, 0, 0, 1, 1,
1.470809, -0.7039647, 0.1755248, 0, 0, 0, 1, 1,
1.481423, 0.46088, 3.07305, 0, 0, 0, 1, 1,
1.481472, -0.2483979, 0.1095595, 0, 0, 0, 1, 1,
1.483819, 0.8232946, -0.3693194, 0, 0, 0, 1, 1,
1.515617, 0.7963238, 0.3990818, 0, 0, 0, 1, 1,
1.52935, 0.0632652, 1.232761, 1, 1, 1, 1, 1,
1.53047, 2.845087, 0.6481365, 1, 1, 1, 1, 1,
1.532781, -0.282041, 1.809367, 1, 1, 1, 1, 1,
1.547244, -0.3325526, 1.818819, 1, 1, 1, 1, 1,
1.552916, 0.5654824, 0.4110362, 1, 1, 1, 1, 1,
1.559711, -1.068855, 1.363476, 1, 1, 1, 1, 1,
1.561769, 1.963547, 0.5201543, 1, 1, 1, 1, 1,
1.577476, -0.3996685, 1.367144, 1, 1, 1, 1, 1,
1.58039, 0.3209104, 0.9266254, 1, 1, 1, 1, 1,
1.595487, 0.1936774, 0.4088854, 1, 1, 1, 1, 1,
1.609745, -0.426685, 1.482188, 1, 1, 1, 1, 1,
1.629633, 0.7574852, 0.6008542, 1, 1, 1, 1, 1,
1.639549, -0.4276749, 3.335965, 1, 1, 1, 1, 1,
1.641414, -0.7924543, 0.464852, 1, 1, 1, 1, 1,
1.65166, 0.030198, 2.646858, 1, 1, 1, 1, 1,
1.661308, -0.4929772, 0.5701712, 0, 0, 1, 1, 1,
1.694639, -0.4494011, 2.519245, 1, 0, 0, 1, 1,
1.698087, 0.4775309, 2.258159, 1, 0, 0, 1, 1,
1.704977, -0.2828993, 0.4855177, 1, 0, 0, 1, 1,
1.714212, -0.5923283, 2.521121, 1, 0, 0, 1, 1,
1.719896, 0.6098415, 1.631219, 1, 0, 0, 1, 1,
1.725454, 0.1847436, 0.6810572, 0, 0, 0, 1, 1,
1.735433, -0.5753867, 2.155662, 0, 0, 0, 1, 1,
1.747056, 0.6122926, -1.074006, 0, 0, 0, 1, 1,
1.749363, -0.5055272, 0.4929727, 0, 0, 0, 1, 1,
1.787092, -0.5223318, 3.173649, 0, 0, 0, 1, 1,
1.794567, 0.756116, 0.2041962, 0, 0, 0, 1, 1,
1.796561, 1.237414, 0.3751377, 0, 0, 0, 1, 1,
1.809543, 0.2566997, 0.2902985, 1, 1, 1, 1, 1,
1.816712, -0.9656635, 0.5402101, 1, 1, 1, 1, 1,
1.820828, 0.5940765, 2.149269, 1, 1, 1, 1, 1,
1.860245, -0.7445785, 2.343999, 1, 1, 1, 1, 1,
1.876871, 0.9322, 1.362377, 1, 1, 1, 1, 1,
1.882497, -0.4035816, 1.656102, 1, 1, 1, 1, 1,
1.91439, -0.07642861, 1.436699, 1, 1, 1, 1, 1,
1.925219, -1.785903, 2.052588, 1, 1, 1, 1, 1,
1.925875, 1.902082, 0.9387401, 1, 1, 1, 1, 1,
1.938871, -0.2327615, 1.684623, 1, 1, 1, 1, 1,
1.939796, -1.12327, 3.062879, 1, 1, 1, 1, 1,
1.974003, -0.3679801, 2.54524, 1, 1, 1, 1, 1,
1.987922, 1.095078, -1.81298, 1, 1, 1, 1, 1,
2.017885, 0.5751528, 1.366144, 1, 1, 1, 1, 1,
2.019125, -0.9406491, 3.281235, 1, 1, 1, 1, 1,
2.034758, 0.1255818, 2.780855, 0, 0, 1, 1, 1,
2.041321, -0.07738788, 1.763318, 1, 0, 0, 1, 1,
2.057431, -1.354495, 2.061522, 1, 0, 0, 1, 1,
2.06517, -0.6049303, 0.9130675, 1, 0, 0, 1, 1,
2.086213, -0.9726591, 1.680093, 1, 0, 0, 1, 1,
2.094579, -0.8310978, 2.207593, 1, 0, 0, 1, 1,
2.103605, 0.8370364, 0.4681649, 0, 0, 0, 1, 1,
2.122438, -1.581444, 1.85409, 0, 0, 0, 1, 1,
2.185379, -0.5360604, 0.7015725, 0, 0, 0, 1, 1,
2.189443, 2.7009, -0.788718, 0, 0, 0, 1, 1,
2.227558, 1.61844, 1.067131, 0, 0, 0, 1, 1,
2.231313, 0.9556071, 1.216434, 0, 0, 0, 1, 1,
2.288699, 0.8743269, -0.156032, 0, 0, 0, 1, 1,
2.369862, -0.3670656, 1.790462, 1, 1, 1, 1, 1,
2.40718, -1.350933, 3.139234, 1, 1, 1, 1, 1,
2.489182, -0.2218848, 0.9609789, 1, 1, 1, 1, 1,
2.510122, -1.158435, 0.9278309, 1, 1, 1, 1, 1,
2.526083, 2.156873, 0.5495129, 1, 1, 1, 1, 1,
2.840419, -0.7703473, 1.604422, 1, 1, 1, 1, 1,
3.076634, 0.06787483, 1.337402, 1, 1, 1, 1, 1
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
var radius = 9.914179;
var distance = 34.82313;
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
mvMatrix.translate( 0.08902359, -0.07646489, 0.4327478 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82313);
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
