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
-2.784795, 0.1325208, -1.017167, 1, 0, 0, 1,
-2.63034, -0.3858802, -0.6176714, 1, 0.007843138, 0, 1,
-2.423783, 0.4014505, -1.60603, 1, 0.01176471, 0, 1,
-2.42327, 0.1995876, -3.062565, 1, 0.01960784, 0, 1,
-2.388953, -2.385436, -3.23499, 1, 0.02352941, 0, 1,
-2.337608, 0.6576234, -0.3160189, 1, 0.03137255, 0, 1,
-2.296487, 1.932512, 0.6823474, 1, 0.03529412, 0, 1,
-2.279405, 1.033943, -1.661088, 1, 0.04313726, 0, 1,
-2.266495, -0.3068058, -2.050976, 1, 0.04705882, 0, 1,
-2.229179, 0.3865349, -1.381971, 1, 0.05490196, 0, 1,
-2.02922, -0.710299, -4.442757, 1, 0.05882353, 0, 1,
-2.021705, 0.2430831, -0.9780032, 1, 0.06666667, 0, 1,
-2.01165, -0.08089242, -0.8114696, 1, 0.07058824, 0, 1,
-1.968968, -0.4734824, -1.385388, 1, 0.07843138, 0, 1,
-1.966282, 0.7208883, -0.5265114, 1, 0.08235294, 0, 1,
-1.962235, 0.1744075, -0.6542806, 1, 0.09019608, 0, 1,
-1.957954, -0.8571349, -1.162024, 1, 0.09411765, 0, 1,
-1.919141, -1.156002, -3.010708, 1, 0.1019608, 0, 1,
-1.881708, 0.8622454, -0.5263737, 1, 0.1098039, 0, 1,
-1.868953, 0.3144805, -3.083785, 1, 0.1137255, 0, 1,
-1.868462, -2.146999, -2.355367, 1, 0.1215686, 0, 1,
-1.824404, 0.1672994, -0.3770791, 1, 0.1254902, 0, 1,
-1.815015, -0.5645141, -2.161436, 1, 0.1333333, 0, 1,
-1.81372, 0.5144666, -0.8132591, 1, 0.1372549, 0, 1,
-1.80598, 0.2253485, -0.9141972, 1, 0.145098, 0, 1,
-1.784687, -0.3986671, -2.749396, 1, 0.1490196, 0, 1,
-1.762918, -0.7412862, -3.360473, 1, 0.1568628, 0, 1,
-1.732816, -0.6543422, -4.273473, 1, 0.1607843, 0, 1,
-1.732716, 2.107653, -1.508345, 1, 0.1686275, 0, 1,
-1.716838, 1.28596, -1.240088, 1, 0.172549, 0, 1,
-1.705817, -0.9034932, -3.802165, 1, 0.1803922, 0, 1,
-1.704455, 0.2639112, 0.2667981, 1, 0.1843137, 0, 1,
-1.691416, 0.1802735, 1.091523, 1, 0.1921569, 0, 1,
-1.679453, 0.1505588, -1.062121, 1, 0.1960784, 0, 1,
-1.671968, -0.3037428, -1.996345, 1, 0.2039216, 0, 1,
-1.669646, -1.509155, -1.610618, 1, 0.2117647, 0, 1,
-1.665284, -0.6802579, -2.134218, 1, 0.2156863, 0, 1,
-1.655081, 1.10734, -1.348716, 1, 0.2235294, 0, 1,
-1.654678, -0.4148101, -2.442266, 1, 0.227451, 0, 1,
-1.648901, -0.04827971, -2.386819, 1, 0.2352941, 0, 1,
-1.643499, -1.034414, -1.348258, 1, 0.2392157, 0, 1,
-1.636213, 0.7481197, -1.685879, 1, 0.2470588, 0, 1,
-1.634823, -2.016172, -3.033145, 1, 0.2509804, 0, 1,
-1.628851, -0.6671805, -0.6439222, 1, 0.2588235, 0, 1,
-1.586636, 0.02718574, -0.9689311, 1, 0.2627451, 0, 1,
-1.577133, -0.6427722, -2.253539, 1, 0.2705882, 0, 1,
-1.570666, 1.093426, -0.6206888, 1, 0.2745098, 0, 1,
-1.570638, -0.002396367, -1.562423, 1, 0.282353, 0, 1,
-1.552295, 0.3412986, -0.2901272, 1, 0.2862745, 0, 1,
-1.546348, -0.6757861, -2.590618, 1, 0.2941177, 0, 1,
-1.545771, -0.4448821, -1.579591, 1, 0.3019608, 0, 1,
-1.542783, 0.4972131, -0.3556321, 1, 0.3058824, 0, 1,
-1.538904, -1.980428, -1.84751, 1, 0.3137255, 0, 1,
-1.527309, 0.4194431, -0.9821548, 1, 0.3176471, 0, 1,
-1.509935, 0.3422829, -2.011942, 1, 0.3254902, 0, 1,
-1.509236, 1.43076, -2.132246, 1, 0.3294118, 0, 1,
-1.507972, -1.288559, -1.4132, 1, 0.3372549, 0, 1,
-1.49413, -0.5759858, -3.875988, 1, 0.3411765, 0, 1,
-1.493786, -0.7744986, -4.051778, 1, 0.3490196, 0, 1,
-1.491172, -0.5370101, -1.676802, 1, 0.3529412, 0, 1,
-1.487741, -0.783024, 0.5482, 1, 0.3607843, 0, 1,
-1.487218, -0.3927339, -1.873025, 1, 0.3647059, 0, 1,
-1.476715, -1.492058, -3.314998, 1, 0.372549, 0, 1,
-1.464692, 1.110636, -1.470922, 1, 0.3764706, 0, 1,
-1.455226, -2.066358, -2.428916, 1, 0.3843137, 0, 1,
-1.445626, -1.043054, -1.019315, 1, 0.3882353, 0, 1,
-1.444972, 0.6543897, -1.269385, 1, 0.3960784, 0, 1,
-1.444914, 0.4986005, -0.7590547, 1, 0.4039216, 0, 1,
-1.443807, 0.2389706, -1.551372, 1, 0.4078431, 0, 1,
-1.428759, -1.29349, -2.106966, 1, 0.4156863, 0, 1,
-1.420162, -0.9875308, -2.397942, 1, 0.4196078, 0, 1,
-1.418575, 0.1704922, -1.634703, 1, 0.427451, 0, 1,
-1.41515, -0.00506071, -1.267442, 1, 0.4313726, 0, 1,
-1.414367, 0.3069966, -3.371816, 1, 0.4392157, 0, 1,
-1.41419, 1.685164, -0.3864964, 1, 0.4431373, 0, 1,
-1.411908, 1.517362, -1.420271, 1, 0.4509804, 0, 1,
-1.39577, 0.6100822, -1.741157, 1, 0.454902, 0, 1,
-1.383657, -1.356473, -0.5325791, 1, 0.4627451, 0, 1,
-1.362676, 1.85986, -0.940653, 1, 0.4666667, 0, 1,
-1.362082, -0.1350627, -1.959944, 1, 0.4745098, 0, 1,
-1.341431, 0.09046006, -1.641357, 1, 0.4784314, 0, 1,
-1.340451, -0.3657786, -2.556698, 1, 0.4862745, 0, 1,
-1.332496, -0.2027161, -3.551253, 1, 0.4901961, 0, 1,
-1.330999, 1.149028, -0.9577063, 1, 0.4980392, 0, 1,
-1.326203, -0.4083785, -1.950009, 1, 0.5058824, 0, 1,
-1.323103, -0.28205, -1.264469, 1, 0.509804, 0, 1,
-1.311287, -1.146485, -0.8908209, 1, 0.5176471, 0, 1,
-1.310132, -0.2315788, -0.2848712, 1, 0.5215687, 0, 1,
-1.305099, 0.2086802, -2.013861, 1, 0.5294118, 0, 1,
-1.303208, 0.8599907, -0.7718275, 1, 0.5333334, 0, 1,
-1.299101, 0.2536779, -3.402064, 1, 0.5411765, 0, 1,
-1.290424, -0.6098631, -1.573145, 1, 0.5450981, 0, 1,
-1.280294, -1.082847, -1.360743, 1, 0.5529412, 0, 1,
-1.274828, -1.755208, -2.219158, 1, 0.5568628, 0, 1,
-1.27245, 0.5012418, -1.920982, 1, 0.5647059, 0, 1,
-1.272138, 0.9274259, -2.025249, 1, 0.5686275, 0, 1,
-1.265935, -2.581792, -4.480834, 1, 0.5764706, 0, 1,
-1.260793, 0.2297967, -1.345605, 1, 0.5803922, 0, 1,
-1.256824, 0.7317574, -1.641634, 1, 0.5882353, 0, 1,
-1.252264, 0.08656741, -1.094158, 1, 0.5921569, 0, 1,
-1.25203, -1.050745, -3.085329, 1, 0.6, 0, 1,
-1.250373, -0.6809708, -2.101351, 1, 0.6078432, 0, 1,
-1.231555, -0.5597184, -1.476859, 1, 0.6117647, 0, 1,
-1.230293, -1.5168, -3.94173, 1, 0.6196079, 0, 1,
-1.225296, -0.06869066, 0.6506348, 1, 0.6235294, 0, 1,
-1.218525, -0.6767732, -2.879826, 1, 0.6313726, 0, 1,
-1.217242, -0.9907016, -2.69359, 1, 0.6352941, 0, 1,
-1.214079, -0.9724658, -3.872824, 1, 0.6431373, 0, 1,
-1.20686, -2.563123, -1.710549, 1, 0.6470588, 0, 1,
-1.205322, -1.562851, -2.294606, 1, 0.654902, 0, 1,
-1.205044, -0.1648136, -2.626391, 1, 0.6588235, 0, 1,
-1.204516, 0.7588874, -0.426304, 1, 0.6666667, 0, 1,
-1.201254, 0.7548643, -1.928772, 1, 0.6705883, 0, 1,
-1.201114, 1.541901, -1.508383, 1, 0.6784314, 0, 1,
-1.197279, -0.4274117, -2.172845, 1, 0.682353, 0, 1,
-1.195827, 1.724263, -1.576689, 1, 0.6901961, 0, 1,
-1.183208, -1.029498, -1.675537, 1, 0.6941177, 0, 1,
-1.174611, 0.2687306, -0.2205197, 1, 0.7019608, 0, 1,
-1.173013, -0.6988683, -1.972291, 1, 0.7098039, 0, 1,
-1.166945, -1.381297, -1.186512, 1, 0.7137255, 0, 1,
-1.1585, -1.486921, -1.088789, 1, 0.7215686, 0, 1,
-1.153095, -0.7578825, -1.89956, 1, 0.7254902, 0, 1,
-1.144892, -1.284292, -2.223637, 1, 0.7333333, 0, 1,
-1.144235, 1.503831, -0.7281752, 1, 0.7372549, 0, 1,
-1.142461, -1.267144, -3.699278, 1, 0.7450981, 0, 1,
-1.140918, 0.9199594, -1.163013, 1, 0.7490196, 0, 1,
-1.139644, -0.2689065, -2.496864, 1, 0.7568628, 0, 1,
-1.139452, -0.2251301, -2.872114, 1, 0.7607843, 0, 1,
-1.138877, 0.1813728, -1.375437, 1, 0.7686275, 0, 1,
-1.119903, -0.3625234, -1.08048, 1, 0.772549, 0, 1,
-1.105634, 0.4135985, -0.4832195, 1, 0.7803922, 0, 1,
-1.104038, 0.1401017, -2.284681, 1, 0.7843137, 0, 1,
-1.098057, 0.1644887, -0.021446, 1, 0.7921569, 0, 1,
-1.095343, 0.4408707, -1.520266, 1, 0.7960784, 0, 1,
-1.088983, -0.4284742, -0.006366131, 1, 0.8039216, 0, 1,
-1.086237, -0.3387366, -0.9538127, 1, 0.8117647, 0, 1,
-1.083669, 1.233731, -0.7741615, 1, 0.8156863, 0, 1,
-1.081548, 1.684714, -1.293712, 1, 0.8235294, 0, 1,
-1.077011, 0.3336057, -1.572478, 1, 0.827451, 0, 1,
-1.070578, 0.1122904, -1.636581, 1, 0.8352941, 0, 1,
-1.069507, -0.9620576, -2.209705, 1, 0.8392157, 0, 1,
-1.056699, 1.279879, 0.9353973, 1, 0.8470588, 0, 1,
-1.053616, -0.1260499, -0.7143332, 1, 0.8509804, 0, 1,
-1.05039, 0.8203045, -0.9850283, 1, 0.8588235, 0, 1,
-1.039234, -0.3444825, -2.585425, 1, 0.8627451, 0, 1,
-1.036252, -0.2249192, 0.2707566, 1, 0.8705882, 0, 1,
-1.036102, -1.143831, -3.655112, 1, 0.8745098, 0, 1,
-1.027424, 0.4408641, -1.919362, 1, 0.8823529, 0, 1,
-1.025901, -0.7145891, -2.400967, 1, 0.8862745, 0, 1,
-1.022849, -0.4200048, -1.710636, 1, 0.8941177, 0, 1,
-1.014023, -0.2353311, -0.3968117, 1, 0.8980392, 0, 1,
-1.011523, -0.1165547, -0.6823611, 1, 0.9058824, 0, 1,
-1.010766, 0.001135136, -2.113621, 1, 0.9137255, 0, 1,
-1.004289, -0.2076774, 0.7389775, 1, 0.9176471, 0, 1,
-1.001216, -0.9353611, -3.745991, 1, 0.9254902, 0, 1,
-0.9846903, -0.6229743, -2.463307, 1, 0.9294118, 0, 1,
-0.9830144, 0.4948378, -0.6087536, 1, 0.9372549, 0, 1,
-0.9739648, -1.257416, -2.20406, 1, 0.9411765, 0, 1,
-0.9538081, 1.510394, -0.6187199, 1, 0.9490196, 0, 1,
-0.952661, 0.3004352, -1.808266, 1, 0.9529412, 0, 1,
-0.9366758, -0.06959938, -2.153436, 1, 0.9607843, 0, 1,
-0.9342557, 1.784916, 1.160899, 1, 0.9647059, 0, 1,
-0.9247362, 1.182941, -0.7049797, 1, 0.972549, 0, 1,
-0.9244199, -0.8298762, -1.763121, 1, 0.9764706, 0, 1,
-0.9239022, 1.282586, -1.252906, 1, 0.9843137, 0, 1,
-0.9222398, 0.5186176, -1.465834, 1, 0.9882353, 0, 1,
-0.9195676, 0.2453497, 0.2846046, 1, 0.9960784, 0, 1,
-0.9174343, 0.612615, -0.4220878, 0.9960784, 1, 0, 1,
-0.9150023, -0.04820218, -1.99133, 0.9921569, 1, 0, 1,
-0.9121739, -0.4805784, -1.916072, 0.9843137, 1, 0, 1,
-0.9082006, 0.87145, 0.5203788, 0.9803922, 1, 0, 1,
-0.9079933, 0.05091268, -2.575144, 0.972549, 1, 0, 1,
-0.9029697, 0.6076634, -2.573639, 0.9686275, 1, 0, 1,
-0.8991327, -0.691233, -0.8759826, 0.9607843, 1, 0, 1,
-0.892774, 0.2724514, -0.5726614, 0.9568627, 1, 0, 1,
-0.8828604, -0.8325933, -3.029708, 0.9490196, 1, 0, 1,
-0.8811746, -0.652624, -1.256438, 0.945098, 1, 0, 1,
-0.8799809, -0.1933477, -1.573547, 0.9372549, 1, 0, 1,
-0.8797225, -0.7145928, -2.49346, 0.9333333, 1, 0, 1,
-0.8766651, -0.943855, -3.74418, 0.9254902, 1, 0, 1,
-0.8752061, 0.8087097, -0.2956225, 0.9215686, 1, 0, 1,
-0.8746206, -0.5951734, -2.935017, 0.9137255, 1, 0, 1,
-0.8740837, 0.1929179, -2.100829, 0.9098039, 1, 0, 1,
-0.8688979, 0.3339597, -0.3974042, 0.9019608, 1, 0, 1,
-0.8673518, 1.583374, -0.6204386, 0.8941177, 1, 0, 1,
-0.8567653, 0.5504882, -0.310401, 0.8901961, 1, 0, 1,
-0.8516276, 1.902327, 0.3089413, 0.8823529, 1, 0, 1,
-0.8505449, -0.5948063, -3.018086, 0.8784314, 1, 0, 1,
-0.8453394, -0.4666956, -2.409147, 0.8705882, 1, 0, 1,
-0.8435048, -0.1818909, -1.675893, 0.8666667, 1, 0, 1,
-0.8409978, 0.9093153, -1.271009, 0.8588235, 1, 0, 1,
-0.8365363, -0.4088353, -3.955136, 0.854902, 1, 0, 1,
-0.835819, -0.1397738, -0.9451395, 0.8470588, 1, 0, 1,
-0.8354714, -0.7755746, -1.215461, 0.8431373, 1, 0, 1,
-0.8348617, -0.5784011, -2.503054, 0.8352941, 1, 0, 1,
-0.8332842, -0.5970981, -1.152271, 0.8313726, 1, 0, 1,
-0.8295706, -1.694061, -0.4754989, 0.8235294, 1, 0, 1,
-0.8288392, 3.318913, -0.2595498, 0.8196079, 1, 0, 1,
-0.8246443, 0.6623653, 0.5144284, 0.8117647, 1, 0, 1,
-0.8244246, -0.5840654, -1.848683, 0.8078431, 1, 0, 1,
-0.8218042, 0.1697047, -1.769682, 0.8, 1, 0, 1,
-0.8205745, 0.1998888, -1.200721, 0.7921569, 1, 0, 1,
-0.8188595, 0.598622, -1.502857, 0.7882353, 1, 0, 1,
-0.8100715, -0.3972441, -4.029496, 0.7803922, 1, 0, 1,
-0.8090599, 0.3457864, -0.4243164, 0.7764706, 1, 0, 1,
-0.8056815, 0.1395335, -1.151782, 0.7686275, 1, 0, 1,
-0.8054782, -0.3762992, -3.169248, 0.7647059, 1, 0, 1,
-0.8028465, -0.8623611, -2.831774, 0.7568628, 1, 0, 1,
-0.802712, -0.8837819, -1.531835, 0.7529412, 1, 0, 1,
-0.8002301, -1.999285, -2.731121, 0.7450981, 1, 0, 1,
-0.7976508, -0.5947926, -1.286991, 0.7411765, 1, 0, 1,
-0.7965111, -0.8922013, -1.578309, 0.7333333, 1, 0, 1,
-0.7888512, -0.6496012, -2.389504, 0.7294118, 1, 0, 1,
-0.7721307, -0.5055643, -2.200979, 0.7215686, 1, 0, 1,
-0.7643346, -1.006535, -3.042787, 0.7176471, 1, 0, 1,
-0.7628987, 1.505761, -2.701393, 0.7098039, 1, 0, 1,
-0.7603558, 1.023403, -1.789037, 0.7058824, 1, 0, 1,
-0.7594694, 1.582625, 0.1982141, 0.6980392, 1, 0, 1,
-0.7560662, -0.04391164, -1.338701, 0.6901961, 1, 0, 1,
-0.7492903, 0.3464324, -0.6111256, 0.6862745, 1, 0, 1,
-0.748313, 0.7596793, -0.976561, 0.6784314, 1, 0, 1,
-0.7468156, -0.2720256, -3.051605, 0.6745098, 1, 0, 1,
-0.7399474, 0.6851897, -2.39731, 0.6666667, 1, 0, 1,
-0.7370561, 0.7757705, -0.8789043, 0.6627451, 1, 0, 1,
-0.7366824, 0.2293332, -2.371335, 0.654902, 1, 0, 1,
-0.7360016, -0.976838, -3.684356, 0.6509804, 1, 0, 1,
-0.7326312, 0.5343623, -0.9248508, 0.6431373, 1, 0, 1,
-0.7316457, 0.4879766, -1.578673, 0.6392157, 1, 0, 1,
-0.7282083, -0.5017644, -2.116172, 0.6313726, 1, 0, 1,
-0.7242438, -0.2027925, -1.077521, 0.627451, 1, 0, 1,
-0.7227491, 0.447389, -0.104949, 0.6196079, 1, 0, 1,
-0.7222473, -0.8208178, -2.9092, 0.6156863, 1, 0, 1,
-0.7160625, -0.3207608, -1.634839, 0.6078432, 1, 0, 1,
-0.7130705, 1.089646, -0.5825025, 0.6039216, 1, 0, 1,
-0.7111365, -0.177561, -3.697448, 0.5960785, 1, 0, 1,
-0.7107167, 0.09921192, -1.510692, 0.5882353, 1, 0, 1,
-0.7013661, -0.9758624, -0.9885107, 0.5843138, 1, 0, 1,
-0.6992821, 0.2935944, -2.536363, 0.5764706, 1, 0, 1,
-0.6981148, 0.6091405, -1.41484, 0.572549, 1, 0, 1,
-0.6976876, -1.09257, -3.986573, 0.5647059, 1, 0, 1,
-0.6929927, 1.295269, -2.026444, 0.5607843, 1, 0, 1,
-0.6899394, -0.2359748, -0.5390406, 0.5529412, 1, 0, 1,
-0.6816494, 1.10935, -0.1829881, 0.5490196, 1, 0, 1,
-0.6766909, 0.9205796, -0.8890011, 0.5411765, 1, 0, 1,
-0.675804, 1.203521, -1.056556, 0.5372549, 1, 0, 1,
-0.6657708, 0.461232, -1.674047, 0.5294118, 1, 0, 1,
-0.6627825, 1.353896, 0.6877162, 0.5254902, 1, 0, 1,
-0.6618091, 1.081199, -0.4343208, 0.5176471, 1, 0, 1,
-0.6591858, -0.4391449, -1.546949, 0.5137255, 1, 0, 1,
-0.6579325, 0.3767611, -1.73444, 0.5058824, 1, 0, 1,
-0.6551074, -1.306558, -2.621365, 0.5019608, 1, 0, 1,
-0.650487, -0.7795794, -1.162283, 0.4941176, 1, 0, 1,
-0.6504572, -0.6312555, -0.7008787, 0.4862745, 1, 0, 1,
-0.6465914, -2.171496, -0.5996383, 0.4823529, 1, 0, 1,
-0.64621, -1.246894, -2.331629, 0.4745098, 1, 0, 1,
-0.6441635, -0.8627182, -2.514467, 0.4705882, 1, 0, 1,
-0.6430793, -0.793804, -3.29036, 0.4627451, 1, 0, 1,
-0.6381972, 0.0639656, -1.520069, 0.4588235, 1, 0, 1,
-0.6333824, 1.485328, 0.9606417, 0.4509804, 1, 0, 1,
-0.6238313, 0.5309418, -2.207191, 0.4470588, 1, 0, 1,
-0.6226519, 0.7564007, -0.1329871, 0.4392157, 1, 0, 1,
-0.614985, 0.06361538, -0.05055489, 0.4352941, 1, 0, 1,
-0.6140282, -0.1844589, -5.262257, 0.427451, 1, 0, 1,
-0.6115717, 1.69801, -0.008762531, 0.4235294, 1, 0, 1,
-0.6091022, -1.778449, -2.834274, 0.4156863, 1, 0, 1,
-0.6063777, -0.5264969, -1.44863, 0.4117647, 1, 0, 1,
-0.604468, -0.5573059, -1.732731, 0.4039216, 1, 0, 1,
-0.6018935, -0.453824, -1.220573, 0.3960784, 1, 0, 1,
-0.5999656, 0.9810123, -2.303087, 0.3921569, 1, 0, 1,
-0.5976793, 0.5774912, -2.086638, 0.3843137, 1, 0, 1,
-0.5956393, -1.840761, -3.456293, 0.3803922, 1, 0, 1,
-0.5938581, 2.365101, -0.8280799, 0.372549, 1, 0, 1,
-0.5862494, 2.192897, 0.5382529, 0.3686275, 1, 0, 1,
-0.5860654, 1.29379, -1.283221, 0.3607843, 1, 0, 1,
-0.5843164, -1.15608, -3.431281, 0.3568628, 1, 0, 1,
-0.5824533, -0.4758486, -1.931548, 0.3490196, 1, 0, 1,
-0.5800276, -0.9106082, -2.185643, 0.345098, 1, 0, 1,
-0.5777341, 1.539048, -0.9911584, 0.3372549, 1, 0, 1,
-0.5717261, -0.3906676, -2.691342, 0.3333333, 1, 0, 1,
-0.571289, -0.888184, -2.146232, 0.3254902, 1, 0, 1,
-0.5704963, -1.239896, -3.578134, 0.3215686, 1, 0, 1,
-0.5682056, 1.987003, -1.600667, 0.3137255, 1, 0, 1,
-0.5625092, 1.01242, 0.3860073, 0.3098039, 1, 0, 1,
-0.5572158, -1.00639, -2.37557, 0.3019608, 1, 0, 1,
-0.5543147, 0.1811297, -0.5433244, 0.2941177, 1, 0, 1,
-0.5540379, 0.08790065, -1.382648, 0.2901961, 1, 0, 1,
-0.553009, 1.084236, -0.7144185, 0.282353, 1, 0, 1,
-0.5408822, -0.7984164, -1.685893, 0.2784314, 1, 0, 1,
-0.5385995, -2.005007, -3.287696, 0.2705882, 1, 0, 1,
-0.5378476, 1.093065, -2.355189, 0.2666667, 1, 0, 1,
-0.5368714, -0.4182367, -3.609281, 0.2588235, 1, 0, 1,
-0.5368017, -0.5405954, -0.3449484, 0.254902, 1, 0, 1,
-0.5346763, -0.3585097, -0.9012342, 0.2470588, 1, 0, 1,
-0.5332842, -1.324355, -3.35375, 0.2431373, 1, 0, 1,
-0.5313866, 0.09536146, -1.857494, 0.2352941, 1, 0, 1,
-0.5289114, 0.534213, -1.132261, 0.2313726, 1, 0, 1,
-0.5272431, 0.02412127, -1.504187, 0.2235294, 1, 0, 1,
-0.5260563, 0.1313364, -2.383332, 0.2196078, 1, 0, 1,
-0.519578, -0.05603296, -3.346404, 0.2117647, 1, 0, 1,
-0.5160412, -0.1517029, -2.741831, 0.2078431, 1, 0, 1,
-0.5073357, 0.5081468, 0.06409772, 0.2, 1, 0, 1,
-0.5018194, -0.4035692, -2.571157, 0.1921569, 1, 0, 1,
-0.5015205, -0.964049, -1.390678, 0.1882353, 1, 0, 1,
-0.5000511, -0.2001223, -0.07941344, 0.1803922, 1, 0, 1,
-0.4873844, -1.718191, -3.460865, 0.1764706, 1, 0, 1,
-0.4862778, 1.601065, -0.9832777, 0.1686275, 1, 0, 1,
-0.4843103, 0.8864334, -0.02447959, 0.1647059, 1, 0, 1,
-0.4737344, -1.680691, -1.826784, 0.1568628, 1, 0, 1,
-0.4735258, 0.5260471, -0.1441188, 0.1529412, 1, 0, 1,
-0.4703791, 0.2626143, -2.43977, 0.145098, 1, 0, 1,
-0.4677642, -1.048295, -3.658291, 0.1411765, 1, 0, 1,
-0.4664249, -2.240776, -4.744211, 0.1333333, 1, 0, 1,
-0.4582248, 0.3890895, -0.13299, 0.1294118, 1, 0, 1,
-0.4452442, -0.6203986, -2.922119, 0.1215686, 1, 0, 1,
-0.4438193, -0.004476535, -0.1373073, 0.1176471, 1, 0, 1,
-0.4427218, -1.529918, -3.150461, 0.1098039, 1, 0, 1,
-0.440796, -0.3544554, -1.971494, 0.1058824, 1, 0, 1,
-0.4371144, 0.2133582, -1.418637, 0.09803922, 1, 0, 1,
-0.4351973, 0.3991515, -0.948014, 0.09019608, 1, 0, 1,
-0.4330745, -0.07668492, -1.984558, 0.08627451, 1, 0, 1,
-0.4319452, 0.6592227, 0.4020107, 0.07843138, 1, 0, 1,
-0.4305325, 0.2155732, 0.1965456, 0.07450981, 1, 0, 1,
-0.4285108, 1.262938, 0.4042212, 0.06666667, 1, 0, 1,
-0.4282793, 0.3234789, -0.4132156, 0.0627451, 1, 0, 1,
-0.4246926, 2.336047, -0.1889789, 0.05490196, 1, 0, 1,
-0.4245747, -0.8370504, -3.716196, 0.05098039, 1, 0, 1,
-0.4194772, 0.06587092, -2.06269, 0.04313726, 1, 0, 1,
-0.4189724, 0.5412688, -1.604812, 0.03921569, 1, 0, 1,
-0.4188679, 0.5186825, 0.07745291, 0.03137255, 1, 0, 1,
-0.4172451, -0.5887639, -2.686799, 0.02745098, 1, 0, 1,
-0.4166003, -0.3568969, -1.226337, 0.01960784, 1, 0, 1,
-0.4158013, 0.8716058, -1.204104, 0.01568628, 1, 0, 1,
-0.4138613, 0.9708877, -0.6678501, 0.007843138, 1, 0, 1,
-0.4111537, -1.417204, -1.732647, 0.003921569, 1, 0, 1,
-0.4095265, 1.364574, -1.205067, 0, 1, 0.003921569, 1,
-0.4088569, -0.4658862, -2.70048, 0, 1, 0.01176471, 1,
-0.4084831, -1.48645, -3.763129, 0, 1, 0.01568628, 1,
-0.4002255, 3.235054, 0.1945766, 0, 1, 0.02352941, 1,
-0.3995446, 0.8259506, -2.095798, 0, 1, 0.02745098, 1,
-0.3993406, 0.4197644, -1.985039, 0, 1, 0.03529412, 1,
-0.3968522, 0.658296, -0.2578008, 0, 1, 0.03921569, 1,
-0.3958775, 0.4846915, 0.4482487, 0, 1, 0.04705882, 1,
-0.3952496, 0.2521601, -0.3667428, 0, 1, 0.05098039, 1,
-0.3861459, -0.332901, -2.459215, 0, 1, 0.05882353, 1,
-0.3859914, -0.8555838, -3.240937, 0, 1, 0.0627451, 1,
-0.3841656, 1.25192, 0.8678596, 0, 1, 0.07058824, 1,
-0.3801208, -0.6834244, -0.8310503, 0, 1, 0.07450981, 1,
-0.3790831, 1.347821, -0.05108722, 0, 1, 0.08235294, 1,
-0.3770464, -0.3013579, -3.635091, 0, 1, 0.08627451, 1,
-0.3754885, 0.4340022, -1.075812, 0, 1, 0.09411765, 1,
-0.3680219, 1.499899, 0.300641, 0, 1, 0.1019608, 1,
-0.3655567, -0.3288877, -1.560245, 0, 1, 0.1058824, 1,
-0.3615316, 1.467213, 0.2932471, 0, 1, 0.1137255, 1,
-0.3569543, 0.6978434, 0.08324407, 0, 1, 0.1176471, 1,
-0.3565387, 0.01805105, -1.528741, 0, 1, 0.1254902, 1,
-0.3536312, 0.2866903, 1.36088, 0, 1, 0.1294118, 1,
-0.3532252, 0.01748523, -2.255501, 0, 1, 0.1372549, 1,
-0.3502202, -1.270106, -3.486307, 0, 1, 0.1411765, 1,
-0.3463962, 0.2295598, -0.6855561, 0, 1, 0.1490196, 1,
-0.3462041, 1.230916, -1.885535, 0, 1, 0.1529412, 1,
-0.3440273, -0.297678, -2.116606, 0, 1, 0.1607843, 1,
-0.3383799, 0.8490874, -1.23334, 0, 1, 0.1647059, 1,
-0.337159, -0.01503939, -0.9594048, 0, 1, 0.172549, 1,
-0.3312692, -0.5840468, -3.683994, 0, 1, 0.1764706, 1,
-0.3301792, 0.7977936, 0.8532423, 0, 1, 0.1843137, 1,
-0.3265315, 2.140159, 0.1222889, 0, 1, 0.1882353, 1,
-0.3251804, 0.7732825, 0.2812582, 0, 1, 0.1960784, 1,
-0.3245606, 1.810379, 1.564575, 0, 1, 0.2039216, 1,
-0.3240717, 1.451841, 0.116726, 0, 1, 0.2078431, 1,
-0.3154288, -0.646197, -2.163854, 0, 1, 0.2156863, 1,
-0.3126643, -0.6500224, -3.241439, 0, 1, 0.2196078, 1,
-0.3119454, -0.3377513, -2.632501, 0, 1, 0.227451, 1,
-0.3081815, 0.0283099, -2.040408, 0, 1, 0.2313726, 1,
-0.307289, -0.2569204, -2.397226, 0, 1, 0.2392157, 1,
-0.3041872, -0.4089195, -3.697039, 0, 1, 0.2431373, 1,
-0.3034101, 1.120127, 0.7660589, 0, 1, 0.2509804, 1,
-0.296594, 0.3856749, -0.1077931, 0, 1, 0.254902, 1,
-0.2944711, -0.02534983, -3.53268, 0, 1, 0.2627451, 1,
-0.2920191, -1.450154, -2.697595, 0, 1, 0.2666667, 1,
-0.2912169, 1.066407, 3.329712, 0, 1, 0.2745098, 1,
-0.2907706, -1.689954, -2.042067, 0, 1, 0.2784314, 1,
-0.2906391, -0.7218495, -3.710119, 0, 1, 0.2862745, 1,
-0.289146, 0.8927932, 0.3329118, 0, 1, 0.2901961, 1,
-0.2858272, -1.055411, -4.599247, 0, 1, 0.2980392, 1,
-0.2797976, -1.743749, -1.995904, 0, 1, 0.3058824, 1,
-0.2790374, 0.0469378, -0.3552129, 0, 1, 0.3098039, 1,
-0.2779128, -1.617977, -2.208209, 0, 1, 0.3176471, 1,
-0.2747231, 0.9262322, 0.446905, 0, 1, 0.3215686, 1,
-0.2746611, -0.3490159, -3.101919, 0, 1, 0.3294118, 1,
-0.2739965, 0.9671517, 0.4778517, 0, 1, 0.3333333, 1,
-0.2644391, -1.795109, -2.764899, 0, 1, 0.3411765, 1,
-0.2633102, -0.7118521, -2.681078, 0, 1, 0.345098, 1,
-0.2625579, -0.7947036, -2.689904, 0, 1, 0.3529412, 1,
-0.2613522, -0.5276268, -4.141448, 0, 1, 0.3568628, 1,
-0.2570319, -0.5281534, -2.161291, 0, 1, 0.3647059, 1,
-0.2554036, 1.737234, -1.083704, 0, 1, 0.3686275, 1,
-0.2553872, -0.5741224, -4.054909, 0, 1, 0.3764706, 1,
-0.2551016, 0.5387302, -1.268022, 0, 1, 0.3803922, 1,
-0.2539632, 0.386631, 0.1210692, 0, 1, 0.3882353, 1,
-0.2507007, -1.111681, -2.39008, 0, 1, 0.3921569, 1,
-0.2501394, -0.2912498, -2.315806, 0, 1, 0.4, 1,
-0.2387647, -0.06026708, -2.165314, 0, 1, 0.4078431, 1,
-0.2362189, -0.9765058, -1.258769, 0, 1, 0.4117647, 1,
-0.2296571, 0.8466158, -1.610754, 0, 1, 0.4196078, 1,
-0.2285626, 0.1594492, -2.806041, 0, 1, 0.4235294, 1,
-0.226954, 1.547093, -0.2827791, 0, 1, 0.4313726, 1,
-0.2269383, 0.3341798, -1.15658, 0, 1, 0.4352941, 1,
-0.2262515, 0.9436276, 0.3423312, 0, 1, 0.4431373, 1,
-0.2247494, 0.3550515, -0.3627296, 0, 1, 0.4470588, 1,
-0.2221517, -0.2124199, -0.2155377, 0, 1, 0.454902, 1,
-0.2212584, 0.4753271, -0.6038226, 0, 1, 0.4588235, 1,
-0.2188676, 2.141421, -1.398006, 0, 1, 0.4666667, 1,
-0.2180416, 0.3549597, 0.08227017, 0, 1, 0.4705882, 1,
-0.217189, -0.1826832, -3.380071, 0, 1, 0.4784314, 1,
-0.2142572, 1.51712, -1.724867, 0, 1, 0.4823529, 1,
-0.2073895, 0.5243129, 0.0665061, 0, 1, 0.4901961, 1,
-0.2055513, 1.579563, -0.01848926, 0, 1, 0.4941176, 1,
-0.2047428, 0.839771, -1.586258, 0, 1, 0.5019608, 1,
-0.2038134, -1.065242, -4.871122, 0, 1, 0.509804, 1,
-0.2003539, -1.181241, -3.911253, 0, 1, 0.5137255, 1,
-0.1969711, 0.9919851, 0.00230189, 0, 1, 0.5215687, 1,
-0.1932945, -0.684234, -3.084441, 0, 1, 0.5254902, 1,
-0.189337, -0.1833123, -1.688945, 0, 1, 0.5333334, 1,
-0.1892799, -0.6043949, -4.134945, 0, 1, 0.5372549, 1,
-0.1881394, 0.06396341, -1.47955, 0, 1, 0.5450981, 1,
-0.1864888, 0.5406317, -2.044892, 0, 1, 0.5490196, 1,
-0.1832937, 0.4208833, -0.7857779, 0, 1, 0.5568628, 1,
-0.1761631, -0.5117481, -3.41874, 0, 1, 0.5607843, 1,
-0.1753398, 1.611957, 1.300488, 0, 1, 0.5686275, 1,
-0.1738995, 0.778213, 0.06723288, 0, 1, 0.572549, 1,
-0.1723863, -0.1445733, -1.998899, 0, 1, 0.5803922, 1,
-0.1699835, 0.1610918, -1.756719, 0, 1, 0.5843138, 1,
-0.1673552, -0.256892, -1.956127, 0, 1, 0.5921569, 1,
-0.1643032, -1.166632, -3.136304, 0, 1, 0.5960785, 1,
-0.1628445, 0.2686856, -2.25253, 0, 1, 0.6039216, 1,
-0.1624561, 0.1777804, 0.3011519, 0, 1, 0.6117647, 1,
-0.1615734, -0.1197373, -0.3548671, 0, 1, 0.6156863, 1,
-0.1605956, 0.2627139, 0.5032142, 0, 1, 0.6235294, 1,
-0.1564658, 1.683211, 0.2238175, 0, 1, 0.627451, 1,
-0.1559777, -1.697749, -4.069315, 0, 1, 0.6352941, 1,
-0.1539003, 0.6945731, -0.865071, 0, 1, 0.6392157, 1,
-0.1477639, 0.6689171, -1.250177, 0, 1, 0.6470588, 1,
-0.1446654, -0.02140724, -1.411086, 0, 1, 0.6509804, 1,
-0.1421281, 0.8994968, -0.4372782, 0, 1, 0.6588235, 1,
-0.1395284, 1.339732, -1.090215, 0, 1, 0.6627451, 1,
-0.1385963, -0.3776524, -3.222654, 0, 1, 0.6705883, 1,
-0.136562, -0.4325158, -3.254546, 0, 1, 0.6745098, 1,
-0.1353493, -0.7775795, -2.56318, 0, 1, 0.682353, 1,
-0.1352344, -0.5138844, -3.465734, 0, 1, 0.6862745, 1,
-0.1266255, -0.5100079, -3.220112, 0, 1, 0.6941177, 1,
-0.1257208, -1.056221, -3.355047, 0, 1, 0.7019608, 1,
-0.1248535, -1.292721, -3.301477, 0, 1, 0.7058824, 1,
-0.124718, -0.06310212, -0.7822939, 0, 1, 0.7137255, 1,
-0.1244538, -0.6450015, -1.682572, 0, 1, 0.7176471, 1,
-0.1159591, -0.7233877, -2.774773, 0, 1, 0.7254902, 1,
-0.1097182, -0.947817, -4.983529, 0, 1, 0.7294118, 1,
-0.1090389, 0.9847525, 0.066082, 0, 1, 0.7372549, 1,
-0.1063637, -0.1704451, -1.24323, 0, 1, 0.7411765, 1,
-0.1061344, 1.133591, -1.361888, 0, 1, 0.7490196, 1,
-0.105438, 0.5414646, 0.2214644, 0, 1, 0.7529412, 1,
-0.1042428, 1.280773, 1.538694, 0, 1, 0.7607843, 1,
-0.1026756, -1.839138, -3.22449, 0, 1, 0.7647059, 1,
-0.1018547, -0.1803188, -2.244767, 0, 1, 0.772549, 1,
-0.09941304, -0.08547725, -4.503545, 0, 1, 0.7764706, 1,
-0.09328035, -0.6181378, -3.311419, 0, 1, 0.7843137, 1,
-0.08962017, 0.228845, 0.848225, 0, 1, 0.7882353, 1,
-0.08754049, -0.05749514, -1.511565, 0, 1, 0.7960784, 1,
-0.0831509, -0.4513482, -2.149614, 0, 1, 0.8039216, 1,
-0.08202785, 0.7557387, 0.5517171, 0, 1, 0.8078431, 1,
-0.07734461, -1.114421, -0.7398717, 0, 1, 0.8156863, 1,
-0.07641748, 0.1014694, 0.2045652, 0, 1, 0.8196079, 1,
-0.07550266, 0.9291525, -1.597125, 0, 1, 0.827451, 1,
-0.07349125, 0.6843168, -1.918609, 0, 1, 0.8313726, 1,
-0.07175914, 0.646828, -0.2596728, 0, 1, 0.8392157, 1,
-0.07032116, 2.273326, 0.5400801, 0, 1, 0.8431373, 1,
-0.06689469, -1.175209, -1.841859, 0, 1, 0.8509804, 1,
-0.06122634, 2.251168, -1.624774, 0, 1, 0.854902, 1,
-0.05821769, 0.003795981, -1.325149, 0, 1, 0.8627451, 1,
-0.05246988, 1.151818, 1.609444, 0, 1, 0.8666667, 1,
-0.05007336, -0.6768101, -5.035585, 0, 1, 0.8745098, 1,
-0.04986326, 0.5035732, 0.8263498, 0, 1, 0.8784314, 1,
-0.04665861, 0.4385785, -0.3306215, 0, 1, 0.8862745, 1,
-0.03803961, 1.456347, -0.1519512, 0, 1, 0.8901961, 1,
-0.0372379, -1.571075, -2.91777, 0, 1, 0.8980392, 1,
-0.03635905, 0.06213954, -1.239075, 0, 1, 0.9058824, 1,
-0.03443414, 1.696909, 0.5632645, 0, 1, 0.9098039, 1,
-0.0339801, -0.8875548, -1.281008, 0, 1, 0.9176471, 1,
-0.0315389, -1.840996, -3.095784, 0, 1, 0.9215686, 1,
-0.03114054, -1.960528, -3.48867, 0, 1, 0.9294118, 1,
-0.02418392, -0.01601398, -3.23162, 0, 1, 0.9333333, 1,
-0.02226369, -0.2043869, -2.450536, 0, 1, 0.9411765, 1,
-0.02193302, 0.1539129, -1.620006, 0, 1, 0.945098, 1,
-0.01968846, -0.6608766, -5.110449, 0, 1, 0.9529412, 1,
-0.01837269, 0.01083318, 0.0442744, 0, 1, 0.9568627, 1,
-0.01694173, 0.9064493, 0.843438, 0, 1, 0.9647059, 1,
-0.01610758, -0.06648754, -3.470425, 0, 1, 0.9686275, 1,
-0.01399726, 0.03500508, 1.0452, 0, 1, 0.9764706, 1,
-0.009234112, 0.1251468, -1.074139, 0, 1, 0.9803922, 1,
-0.006211377, 1.961095, 0.2828415, 0, 1, 0.9882353, 1,
-0.004149058, -0.6620925, -3.052689, 0, 1, 0.9921569, 1,
-0.0006099892, -0.03856901, -1.85162, 0, 1, 1, 1,
0.002988139, -0.3136362, 3.446751, 0, 0.9921569, 1, 1,
0.00452286, -0.5509828, 3.656284, 0, 0.9882353, 1, 1,
0.004588095, 0.5693684, -1.488677, 0, 0.9803922, 1, 1,
0.005528179, 2.313798, 1.320186, 0, 0.9764706, 1, 1,
0.005650634, -0.4251027, 2.217466, 0, 0.9686275, 1, 1,
0.008082929, -0.6038213, 3.577017, 0, 0.9647059, 1, 1,
0.01057259, -0.8777341, 4.477135, 0, 0.9568627, 1, 1,
0.01454912, -0.09978334, 2.406114, 0, 0.9529412, 1, 1,
0.01782999, -0.9309321, 4.023021, 0, 0.945098, 1, 1,
0.01946398, -2.528118, 4.544378, 0, 0.9411765, 1, 1,
0.02060018, -0.9429549, 1.812444, 0, 0.9333333, 1, 1,
0.02149914, -0.1887089, 2.880872, 0, 0.9294118, 1, 1,
0.0229433, 1.094378, 1.293432, 0, 0.9215686, 1, 1,
0.02651361, 0.2140357, 3.166147, 0, 0.9176471, 1, 1,
0.02728552, -0.4003248, 3.293865, 0, 0.9098039, 1, 1,
0.0277602, -1.767217, 1.927824, 0, 0.9058824, 1, 1,
0.02831263, 0.7085887, -0.39127, 0, 0.8980392, 1, 1,
0.03056929, -0.9647473, 2.306429, 0, 0.8901961, 1, 1,
0.03336455, -0.06868187, 3.713096, 0, 0.8862745, 1, 1,
0.03580119, -1.726701, 2.518522, 0, 0.8784314, 1, 1,
0.03654459, -1.985573, 2.834799, 0, 0.8745098, 1, 1,
0.03836857, -1.221213, 3.629076, 0, 0.8666667, 1, 1,
0.04062502, 0.8175587, 0.8065859, 0, 0.8627451, 1, 1,
0.04086425, -1.498808, 2.301449, 0, 0.854902, 1, 1,
0.04371994, 0.7444601, 0.3478239, 0, 0.8509804, 1, 1,
0.04553329, 0.7347579, -0.9277362, 0, 0.8431373, 1, 1,
0.04630794, -1.565766, 1.400286, 0, 0.8392157, 1, 1,
0.04754061, -2.357843, 1.400504, 0, 0.8313726, 1, 1,
0.05006375, 0.364086, 1.013245, 0, 0.827451, 1, 1,
0.0531928, 0.1529865, 2.941688, 0, 0.8196079, 1, 1,
0.05402733, -1.461359, 4.173832, 0, 0.8156863, 1, 1,
0.05522604, -0.6177381, 2.187996, 0, 0.8078431, 1, 1,
0.05541143, 0.4025188, 0.3063688, 0, 0.8039216, 1, 1,
0.05628775, -0.2006871, 2.736679, 0, 0.7960784, 1, 1,
0.07034919, -1.065107, 3.2112, 0, 0.7882353, 1, 1,
0.07055879, -0.7158579, 2.104119, 0, 0.7843137, 1, 1,
0.0708388, -0.5932165, 1.020692, 0, 0.7764706, 1, 1,
0.07173452, 1.212428, -0.9124508, 0, 0.772549, 1, 1,
0.0747069, -1.158272, 3.567157, 0, 0.7647059, 1, 1,
0.07572363, 0.05288713, 0.4288317, 0, 0.7607843, 1, 1,
0.07862114, -1.228508, 3.004105, 0, 0.7529412, 1, 1,
0.08030763, -0.9465591, 2.864562, 0, 0.7490196, 1, 1,
0.08039332, 1.734474, -0.543852, 0, 0.7411765, 1, 1,
0.08186287, -0.9033881, 4.241345, 0, 0.7372549, 1, 1,
0.08316149, 0.6703997, -0.8846627, 0, 0.7294118, 1, 1,
0.09403226, 0.07746664, 1.292128, 0, 0.7254902, 1, 1,
0.09442075, 0.3533579, -2.013742, 0, 0.7176471, 1, 1,
0.09613732, -0.7832772, 1.588876, 0, 0.7137255, 1, 1,
0.100554, -0.8210503, 2.788012, 0, 0.7058824, 1, 1,
0.1009353, -1.199522, 2.315506, 0, 0.6980392, 1, 1,
0.1026922, 0.6329687, 0.7063631, 0, 0.6941177, 1, 1,
0.1056909, 0.2794585, -1.751672, 0, 0.6862745, 1, 1,
0.1058286, -0.9776934, 3.28077, 0, 0.682353, 1, 1,
0.1058596, -1.077357, 2.714108, 0, 0.6745098, 1, 1,
0.1065467, -0.5136051, 3.057288, 0, 0.6705883, 1, 1,
0.1075308, 1.606533, 0.2829859, 0, 0.6627451, 1, 1,
0.1077175, 0.09438776, -0.2658332, 0, 0.6588235, 1, 1,
0.1097017, -1.405171, 4.113016, 0, 0.6509804, 1, 1,
0.1100939, -1.728363, 3.853127, 0, 0.6470588, 1, 1,
0.1124028, -0.9751695, 3.484125, 0, 0.6392157, 1, 1,
0.1132268, -0.2019595, 2.694918, 0, 0.6352941, 1, 1,
0.1150285, 1.407645, 1.236413, 0, 0.627451, 1, 1,
0.1215709, 3.626539, 1.128251, 0, 0.6235294, 1, 1,
0.123139, -0.3950263, 2.104979, 0, 0.6156863, 1, 1,
0.1246637, 0.4614948, -0.5593931, 0, 0.6117647, 1, 1,
0.1259265, -0.2342149, 2.388052, 0, 0.6039216, 1, 1,
0.127742, 1.147006, 0.7199101, 0, 0.5960785, 1, 1,
0.1367603, -0.8496532, 1.266639, 0, 0.5921569, 1, 1,
0.1384391, 0.2986508, -0.1085557, 0, 0.5843138, 1, 1,
0.1438005, 0.5248702, -1.155577, 0, 0.5803922, 1, 1,
0.1440647, 0.9340408, 0.485512, 0, 0.572549, 1, 1,
0.1463622, 0.6627024, -0.7622678, 0, 0.5686275, 1, 1,
0.1485854, -0.6777613, 3.645947, 0, 0.5607843, 1, 1,
0.1519869, -2.223675, 1.534167, 0, 0.5568628, 1, 1,
0.1528919, -0.4539595, 3.219839, 0, 0.5490196, 1, 1,
0.1535316, -0.1009553, 2.224961, 0, 0.5450981, 1, 1,
0.1537249, -0.7326249, 2.463573, 0, 0.5372549, 1, 1,
0.1539164, -0.7410733, 3.558424, 0, 0.5333334, 1, 1,
0.1540824, 1.787091, 0.6557069, 0, 0.5254902, 1, 1,
0.1558143, 0.8778144, 0.5403158, 0, 0.5215687, 1, 1,
0.1595615, -0.430277, 1.575407, 0, 0.5137255, 1, 1,
0.1644177, 0.5430781, 0.02017045, 0, 0.509804, 1, 1,
0.1648836, 1.498289, 0.6207592, 0, 0.5019608, 1, 1,
0.1659026, -1.845817, 5.210835, 0, 0.4941176, 1, 1,
0.1686966, -0.6821889, 2.424965, 0, 0.4901961, 1, 1,
0.1700871, -0.6589023, 3.342886, 0, 0.4823529, 1, 1,
0.1713218, -0.6641931, 1.684286, 0, 0.4784314, 1, 1,
0.1722228, 0.4662389, 0.2960372, 0, 0.4705882, 1, 1,
0.1724498, -0.2474579, 1.871092, 0, 0.4666667, 1, 1,
0.1754493, 1.068886, -0.6654443, 0, 0.4588235, 1, 1,
0.1848221, -1.406837, 4.033157, 0, 0.454902, 1, 1,
0.1921492, 1.230889, 2.037839, 0, 0.4470588, 1, 1,
0.1935236, -1.03733, 4.764657, 0, 0.4431373, 1, 1,
0.1939737, 0.8389458, -0.3556801, 0, 0.4352941, 1, 1,
0.197989, -0.6532352, 2.016167, 0, 0.4313726, 1, 1,
0.1990636, -0.003555014, 0.3429285, 0, 0.4235294, 1, 1,
0.2024505, 0.7688119, 2.386351, 0, 0.4196078, 1, 1,
0.2044857, -0.5885559, 4.652636, 0, 0.4117647, 1, 1,
0.2057089, 0.3066224, 0.4482197, 0, 0.4078431, 1, 1,
0.2064606, -0.3489392, 2.636306, 0, 0.4, 1, 1,
0.2081529, -1.174144, 3.45468, 0, 0.3921569, 1, 1,
0.2087168, -0.961098, 3.4001, 0, 0.3882353, 1, 1,
0.2159767, 0.5305952, 1.232625, 0, 0.3803922, 1, 1,
0.2163225, -1.685251, 1.018706, 0, 0.3764706, 1, 1,
0.2199475, -0.4752859, 3.169907, 0, 0.3686275, 1, 1,
0.222533, 1.079043, -0.1556233, 0, 0.3647059, 1, 1,
0.2266809, -0.3123623, 1.750209, 0, 0.3568628, 1, 1,
0.2279448, 0.9656804, -0.7981319, 0, 0.3529412, 1, 1,
0.2310095, -1.084898, 3.089189, 0, 0.345098, 1, 1,
0.2332623, 2.149341, 0.1182335, 0, 0.3411765, 1, 1,
0.2368631, -0.8681616, 2.856472, 0, 0.3333333, 1, 1,
0.2420541, 0.2113808, 1.283825, 0, 0.3294118, 1, 1,
0.2439208, -0.2252888, 1.967513, 0, 0.3215686, 1, 1,
0.2460057, -0.9578032, 4.955112, 0, 0.3176471, 1, 1,
0.2488577, -0.1311211, 2.486206, 0, 0.3098039, 1, 1,
0.2492447, -1.378064, 5.029232, 0, 0.3058824, 1, 1,
0.2576156, 2.560138, 0.4402324, 0, 0.2980392, 1, 1,
0.2578957, -0.5194395, 2.971039, 0, 0.2901961, 1, 1,
0.2648236, -0.03215684, 2.631432, 0, 0.2862745, 1, 1,
0.2750995, 2.188227, -0.175696, 0, 0.2784314, 1, 1,
0.283549, 0.4449428, -0.4470267, 0, 0.2745098, 1, 1,
0.2846609, -1.015128, 4.105199, 0, 0.2666667, 1, 1,
0.2871257, -0.1093731, 2.620927, 0, 0.2627451, 1, 1,
0.2931357, 0.1084228, 1.657674, 0, 0.254902, 1, 1,
0.2965414, 1.016804, -0.6707355, 0, 0.2509804, 1, 1,
0.2972774, -0.1120563, 3.094049, 0, 0.2431373, 1, 1,
0.3003793, -0.6752508, 3.987066, 0, 0.2392157, 1, 1,
0.3006287, 0.169619, 0.9284934, 0, 0.2313726, 1, 1,
0.3007738, -0.7324855, 2.184221, 0, 0.227451, 1, 1,
0.3017423, 0.8001246, -0.2789724, 0, 0.2196078, 1, 1,
0.3022577, -0.689963, 2.829154, 0, 0.2156863, 1, 1,
0.3024075, 0.115591, 0.8081, 0, 0.2078431, 1, 1,
0.3089839, -0.3286301, 3.394369, 0, 0.2039216, 1, 1,
0.3095115, -0.2248151, 2.583241, 0, 0.1960784, 1, 1,
0.3096188, -0.5270885, 3.173203, 0, 0.1882353, 1, 1,
0.3115157, -0.09418999, 1.058494, 0, 0.1843137, 1, 1,
0.3144588, -0.9233375, 2.202808, 0, 0.1764706, 1, 1,
0.3150543, -0.4328475, 2.308582, 0, 0.172549, 1, 1,
0.3172733, -0.01328865, 1.15874, 0, 0.1647059, 1, 1,
0.3189389, 1.525246, 0.6222653, 0, 0.1607843, 1, 1,
0.3193062, -0.4667661, 3.238965, 0, 0.1529412, 1, 1,
0.3223361, -0.5063351, 4.50102, 0, 0.1490196, 1, 1,
0.3227434, -0.7974472, 3.851077, 0, 0.1411765, 1, 1,
0.3233287, 0.1143781, 0.288905, 0, 0.1372549, 1, 1,
0.3259452, -0.2751583, 1.861397, 0, 0.1294118, 1, 1,
0.3282472, 1.45076, 0.9967024, 0, 0.1254902, 1, 1,
0.3289859, -0.1722614, 0.9938172, 0, 0.1176471, 1, 1,
0.3293934, -0.7893792, 2.010449, 0, 0.1137255, 1, 1,
0.3351727, 1.647715, 0.6837279, 0, 0.1058824, 1, 1,
0.3427136, -1.446402, 3.129318, 0, 0.09803922, 1, 1,
0.3458999, 1.398386, 0.1109498, 0, 0.09411765, 1, 1,
0.3474095, -0.5229803, 2.409917, 0, 0.08627451, 1, 1,
0.3586342, -1.050037, 1.667706, 0, 0.08235294, 1, 1,
0.3589059, -0.2461067, 1.084281, 0, 0.07450981, 1, 1,
0.3636649, 1.225846, 0.6738898, 0, 0.07058824, 1, 1,
0.3685072, 0.376553, 0.7116358, 0, 0.0627451, 1, 1,
0.3694858, 0.3088061, 3.100334, 0, 0.05882353, 1, 1,
0.3712052, -2.509521, 3.980283, 0, 0.05098039, 1, 1,
0.3730067, 0.7158422, -0.5091172, 0, 0.04705882, 1, 1,
0.3732705, -0.3051415, 1.018343, 0, 0.03921569, 1, 1,
0.3735286, 0.2109846, 0.3557689, 0, 0.03529412, 1, 1,
0.373646, -0.5078394, 3.060863, 0, 0.02745098, 1, 1,
0.3754521, -0.1392735, 0.3894858, 0, 0.02352941, 1, 1,
0.3764462, -0.008061037, 1.220304, 0, 0.01568628, 1, 1,
0.3775775, -1.020075, 2.78781, 0, 0.01176471, 1, 1,
0.3812701, 1.304199, -0.9879612, 0, 0.003921569, 1, 1,
0.3817682, -1.216751, 5.740281, 0.003921569, 0, 1, 1,
0.389186, 2.590106, 0.5694043, 0.007843138, 0, 1, 1,
0.3939422, -1.077147, 1.025692, 0.01568628, 0, 1, 1,
0.3941715, 0.2911083, 0.06140788, 0.01960784, 0, 1, 1,
0.3977911, -0.3747633, 1.956804, 0.02745098, 0, 1, 1,
0.4036172, -1.130172, 4.480897, 0.03137255, 0, 1, 1,
0.4039026, 0.4270737, 1.835776, 0.03921569, 0, 1, 1,
0.4050403, 2.154551, -1.154945, 0.04313726, 0, 1, 1,
0.405315, -1.394545, 3.312334, 0.05098039, 0, 1, 1,
0.4092507, -1.188918, 0.9351791, 0.05490196, 0, 1, 1,
0.4093213, 0.7722705, -0.1651189, 0.0627451, 0, 1, 1,
0.4104078, 0.9312746, 2.405456, 0.06666667, 0, 1, 1,
0.4142263, 0.03272259, 3.304657, 0.07450981, 0, 1, 1,
0.4143847, -0.4152727, 1.654695, 0.07843138, 0, 1, 1,
0.4164295, -0.6312847, 2.012405, 0.08627451, 0, 1, 1,
0.4196662, -0.596925, 1.92761, 0.09019608, 0, 1, 1,
0.429941, 0.3353993, 0.4133106, 0.09803922, 0, 1, 1,
0.4301738, -0.7624797, 2.972042, 0.1058824, 0, 1, 1,
0.4325048, -0.07501445, 2.748313, 0.1098039, 0, 1, 1,
0.4340992, 0.3032324, 2.317473, 0.1176471, 0, 1, 1,
0.4458151, -0.9692743, 1.495001, 0.1215686, 0, 1, 1,
0.4529833, -0.2013776, 1.457555, 0.1294118, 0, 1, 1,
0.4571426, 1.126257, 2.201366, 0.1333333, 0, 1, 1,
0.4610847, 0.3247418, 0.9621195, 0.1411765, 0, 1, 1,
0.4611178, 0.4734372, -0.2119603, 0.145098, 0, 1, 1,
0.4640257, 0.8440781, 2.808526, 0.1529412, 0, 1, 1,
0.4664751, 0.249745, 1.043988, 0.1568628, 0, 1, 1,
0.4842669, 0.3486874, -0.6097656, 0.1647059, 0, 1, 1,
0.4871983, 1.188057, 1.179067, 0.1686275, 0, 1, 1,
0.4908485, -0.5210376, 2.309747, 0.1764706, 0, 1, 1,
0.4916113, -1.015091, 2.219051, 0.1803922, 0, 1, 1,
0.4939303, 0.9189024, 0.2251427, 0.1882353, 0, 1, 1,
0.4940767, 0.3211651, 2.524543, 0.1921569, 0, 1, 1,
0.4967987, 1.140909, 2.403239, 0.2, 0, 1, 1,
0.4995239, 0.351203, 1.06848, 0.2078431, 0, 1, 1,
0.5050271, -0.3454402, 2.316541, 0.2117647, 0, 1, 1,
0.5058306, 0.03256072, 2.018298, 0.2196078, 0, 1, 1,
0.5088941, -0.9822787, 1.766538, 0.2235294, 0, 1, 1,
0.5102518, -0.5887976, 1.302042, 0.2313726, 0, 1, 1,
0.5124773, 0.1932808, 1.688044, 0.2352941, 0, 1, 1,
0.5172447, 0.5498779, 0.5786868, 0.2431373, 0, 1, 1,
0.5196239, 0.2023428, 1.208971, 0.2470588, 0, 1, 1,
0.5208706, 1.233609, 0.8664161, 0.254902, 0, 1, 1,
0.5246428, -1.501171, 0.9110017, 0.2588235, 0, 1, 1,
0.531838, -1.078533, 2.586224, 0.2666667, 0, 1, 1,
0.5320631, -1.238648, 3.063093, 0.2705882, 0, 1, 1,
0.5323631, 0.06765975, 2.963454, 0.2784314, 0, 1, 1,
0.5332583, -1.297463, 2.217134, 0.282353, 0, 1, 1,
0.5362324, -0.6460716, 3.000911, 0.2901961, 0, 1, 1,
0.5398542, 1.661796, -0.01821167, 0.2941177, 0, 1, 1,
0.5422868, -0.3120556, 0.5607327, 0.3019608, 0, 1, 1,
0.543984, 2.773106, -0.6024922, 0.3098039, 0, 1, 1,
0.5442584, 0.7446098, 1.949306, 0.3137255, 0, 1, 1,
0.5471573, 1.035535, 0.3445516, 0.3215686, 0, 1, 1,
0.5498236, -0.404037, 3.083388, 0.3254902, 0, 1, 1,
0.5500327, -1.543441, 2.921216, 0.3333333, 0, 1, 1,
0.5543371, 1.103075, 0.7542046, 0.3372549, 0, 1, 1,
0.560284, -0.8732264, 3.076006, 0.345098, 0, 1, 1,
0.5614622, 1.194361, -0.0411574, 0.3490196, 0, 1, 1,
0.5623729, -0.2263562, 0.7496946, 0.3568628, 0, 1, 1,
0.5642702, -0.2273391, 1.486244, 0.3607843, 0, 1, 1,
0.5682882, -0.385119, 1.063534, 0.3686275, 0, 1, 1,
0.5687459, -1.169499, 2.140464, 0.372549, 0, 1, 1,
0.5703687, 0.2461245, -0.4064974, 0.3803922, 0, 1, 1,
0.5785202, 0.3606145, -0.06905934, 0.3843137, 0, 1, 1,
0.5787315, 3.410342, 0.5381975, 0.3921569, 0, 1, 1,
0.5798126, 1.398971, -0.4855795, 0.3960784, 0, 1, 1,
0.5935994, -1.628944, 3.60423, 0.4039216, 0, 1, 1,
0.5939118, -0.02301323, 1.589281, 0.4117647, 0, 1, 1,
0.5988507, 0.9768957, 0.1624619, 0.4156863, 0, 1, 1,
0.6013858, 0.8393831, 0.7884422, 0.4235294, 0, 1, 1,
0.6020268, 1.427353, 0.9873515, 0.427451, 0, 1, 1,
0.6025968, -0.5228608, 2.289068, 0.4352941, 0, 1, 1,
0.6028956, 0.7248692, 1.151565, 0.4392157, 0, 1, 1,
0.6047146, -1.142992, 2.199617, 0.4470588, 0, 1, 1,
0.6061392, 0.4495902, 2.801709, 0.4509804, 0, 1, 1,
0.6065814, 0.307353, 0.9520827, 0.4588235, 0, 1, 1,
0.6087348, -1.93601, 2.138631, 0.4627451, 0, 1, 1,
0.609929, 1.225813, -1.187956, 0.4705882, 0, 1, 1,
0.610907, -0.06831679, 0.8073416, 0.4745098, 0, 1, 1,
0.6162937, -0.4620026, 2.529616, 0.4823529, 0, 1, 1,
0.6260455, 0.06395864, 1.21795, 0.4862745, 0, 1, 1,
0.6267805, 0.02370167, 1.568566, 0.4941176, 0, 1, 1,
0.6270466, -1.259981, 3.055171, 0.5019608, 0, 1, 1,
0.6303634, 0.2954251, 0.6084771, 0.5058824, 0, 1, 1,
0.6377416, 0.6465409, 0.7521979, 0.5137255, 0, 1, 1,
0.6446543, -1.168511, 0.9428354, 0.5176471, 0, 1, 1,
0.6471019, 0.3692829, 2.082416, 0.5254902, 0, 1, 1,
0.6500697, -0.5615127, 1.595785, 0.5294118, 0, 1, 1,
0.6560473, -0.4263588, 0.1131218, 0.5372549, 0, 1, 1,
0.6586574, -0.3170146, 3.809592, 0.5411765, 0, 1, 1,
0.6601344, 0.6875835, 0.6336163, 0.5490196, 0, 1, 1,
0.6654463, 0.02007598, 3.248868, 0.5529412, 0, 1, 1,
0.6655756, -0.08417313, 0.6391036, 0.5607843, 0, 1, 1,
0.6662928, 0.03240098, 1.254812, 0.5647059, 0, 1, 1,
0.6681677, 0.3072464, 1.226195, 0.572549, 0, 1, 1,
0.6693125, -0.2201687, 1.37002, 0.5764706, 0, 1, 1,
0.6708301, 1.291075, -0.2769936, 0.5843138, 0, 1, 1,
0.6748123, -2.344121, 3.223433, 0.5882353, 0, 1, 1,
0.6758707, -0.9192039, 2.38663, 0.5960785, 0, 1, 1,
0.6781421, -0.2976534, 1.663618, 0.6039216, 0, 1, 1,
0.6823925, 0.3087792, 0.3013048, 0.6078432, 0, 1, 1,
0.6828758, -0.1883821, 1.077631, 0.6156863, 0, 1, 1,
0.6916191, -1.161172, 1.709033, 0.6196079, 0, 1, 1,
0.6933812, -1.543143, 1.900203, 0.627451, 0, 1, 1,
0.6961766, 0.4846955, 0.359066, 0.6313726, 0, 1, 1,
0.6979689, -0.5647051, 1.684558, 0.6392157, 0, 1, 1,
0.7025128, -0.315801, 1.329966, 0.6431373, 0, 1, 1,
0.7034005, -0.6457068, 1.743948, 0.6509804, 0, 1, 1,
0.7037457, -0.2305722, 3.077719, 0.654902, 0, 1, 1,
0.7083554, -2.402759, 3.517932, 0.6627451, 0, 1, 1,
0.7087331, -0.2522288, 2.614695, 0.6666667, 0, 1, 1,
0.7120162, 0.363056, -0.218795, 0.6745098, 0, 1, 1,
0.7135896, -1.405029, 3.832307, 0.6784314, 0, 1, 1,
0.7207147, -1.196115, 3.140924, 0.6862745, 0, 1, 1,
0.7235382, -1.81579, 4.198046, 0.6901961, 0, 1, 1,
0.7235638, -1.404702, 2.760948, 0.6980392, 0, 1, 1,
0.7299023, 1.35987, 1.251964, 0.7058824, 0, 1, 1,
0.7382057, -0.8027424, 2.899974, 0.7098039, 0, 1, 1,
0.7393739, 0.658192, 0.7391039, 0.7176471, 0, 1, 1,
0.7404963, 0.5965783, 0.658754, 0.7215686, 0, 1, 1,
0.7422429, 2.696013, 0.6465253, 0.7294118, 0, 1, 1,
0.7469468, -0.1333005, 0.3561272, 0.7333333, 0, 1, 1,
0.7481338, -1.224391, 1.942599, 0.7411765, 0, 1, 1,
0.7484267, -2.601746, 3.072667, 0.7450981, 0, 1, 1,
0.7489997, 1.705509, -0.6079627, 0.7529412, 0, 1, 1,
0.7597961, 0.0351591, 1.73307, 0.7568628, 0, 1, 1,
0.7630447, -0.1574706, 3.136608, 0.7647059, 0, 1, 1,
0.7671969, 1.727299, 0.1487511, 0.7686275, 0, 1, 1,
0.7745129, -1.335015, 1.664875, 0.7764706, 0, 1, 1,
0.7750319, -0.7798757, 1.036295, 0.7803922, 0, 1, 1,
0.7752291, -0.5205629, 2.106511, 0.7882353, 0, 1, 1,
0.7763237, -0.3752676, 1.955124, 0.7921569, 0, 1, 1,
0.7781613, -0.5095538, 2.164267, 0.8, 0, 1, 1,
0.7782133, -0.3645101, 2.35444, 0.8078431, 0, 1, 1,
0.7805353, 0.3207733, 3.411312, 0.8117647, 0, 1, 1,
0.7810238, 0.8124284, 0.5323029, 0.8196079, 0, 1, 1,
0.7824243, 0.1283903, -0.180099, 0.8235294, 0, 1, 1,
0.7831491, -0.2272925, 3.226204, 0.8313726, 0, 1, 1,
0.7891737, -0.01446233, 1.421282, 0.8352941, 0, 1, 1,
0.7915589, 0.8362733, 1.391587, 0.8431373, 0, 1, 1,
0.7923431, 0.5370117, 0.4717307, 0.8470588, 0, 1, 1,
0.8007144, -0.7734206, 0.8005539, 0.854902, 0, 1, 1,
0.8015686, -1.066235, 1.641979, 0.8588235, 0, 1, 1,
0.806092, -0.01467632, 0.340823, 0.8666667, 0, 1, 1,
0.8087029, 1.733757, 0.3124776, 0.8705882, 0, 1, 1,
0.8134127, 0.3787994, 0.837024, 0.8784314, 0, 1, 1,
0.8168259, 0.6263009, -0.3106262, 0.8823529, 0, 1, 1,
0.8190151, 1.027423, 0.3813033, 0.8901961, 0, 1, 1,
0.836189, 0.1060945, 0.7717369, 0.8941177, 0, 1, 1,
0.8370984, 0.1691609, 1.623303, 0.9019608, 0, 1, 1,
0.8477081, -0.09028106, 3.481069, 0.9098039, 0, 1, 1,
0.8496568, 0.1372982, 2.209424, 0.9137255, 0, 1, 1,
0.8515446, 1.434242, 0.9239135, 0.9215686, 0, 1, 1,
0.8535436, -1.139683, 2.69421, 0.9254902, 0, 1, 1,
0.8639141, -1.531418, 2.494657, 0.9333333, 0, 1, 1,
0.8681929, 1.908271, 1.185788, 0.9372549, 0, 1, 1,
0.8784997, -2.933844, 3.417104, 0.945098, 0, 1, 1,
0.8831329, 0.07943972, 1.054067, 0.9490196, 0, 1, 1,
0.8856592, -2.755024, 2.161771, 0.9568627, 0, 1, 1,
0.8905581, 1.565465, -1.858456, 0.9607843, 0, 1, 1,
0.8979973, -3.003072, 2.927552, 0.9686275, 0, 1, 1,
0.9002624, 0.3801817, 2.980419, 0.972549, 0, 1, 1,
0.906316, -1.049564, 2.939226, 0.9803922, 0, 1, 1,
0.9066967, 0.4126197, 0.0945647, 0.9843137, 0, 1, 1,
0.9077402, 1.154677, 0.763526, 0.9921569, 0, 1, 1,
0.9216934, 0.3464037, 0.8230312, 0.9960784, 0, 1, 1,
0.9323276, -1.829436, 3.65874, 1, 0, 0.9960784, 1,
0.9332291, 0.993373, 0.6605907, 1, 0, 0.9882353, 1,
0.9340776, 1.402176, 0.08792197, 1, 0, 0.9843137, 1,
0.9345992, 0.02202711, 1.602368, 1, 0, 0.9764706, 1,
0.938395, -0.3267302, 1.847009, 1, 0, 0.972549, 1,
0.9384509, 2.813456, -1.370401, 1, 0, 0.9647059, 1,
0.9415173, 1.547894, 0.7980859, 1, 0, 0.9607843, 1,
0.9682333, 0.4786305, 2.277746, 1, 0, 0.9529412, 1,
0.9686393, -1.379689, 3.12309, 1, 0, 0.9490196, 1,
0.9722709, 0.8097343, -0.3209823, 1, 0, 0.9411765, 1,
0.9811007, -0.5144125, 2.01861, 1, 0, 0.9372549, 1,
0.9849283, 0.01843041, -1.18155, 1, 0, 0.9294118, 1,
0.9852552, -0.5990022, 0.2170167, 1, 0, 0.9254902, 1,
0.9886549, -0.5157829, 2.311167, 1, 0, 0.9176471, 1,
0.9918023, 1.886797, 0.15249, 1, 0, 0.9137255, 1,
1.001532, 0.2981533, -0.5802102, 1, 0, 0.9058824, 1,
1.012942, 1.167359, 0.418759, 1, 0, 0.9019608, 1,
1.016846, 0.1669732, 1.411277, 1, 0, 0.8941177, 1,
1.022845, 0.8419475, 1.622762, 1, 0, 0.8862745, 1,
1.033843, -0.1407515, 1.863352, 1, 0, 0.8823529, 1,
1.037966, -0.8186252, 4.384845, 1, 0, 0.8745098, 1,
1.046115, -0.1121107, 1.756274, 1, 0, 0.8705882, 1,
1.055467, 1.573523, -0.6574833, 1, 0, 0.8627451, 1,
1.056293, -1.259405, 2.335428, 1, 0, 0.8588235, 1,
1.05678, 0.3145932, 2.860669, 1, 0, 0.8509804, 1,
1.059373, 2.030351, -0.4671192, 1, 0, 0.8470588, 1,
1.061178, -1.47142, 2.362614, 1, 0, 0.8392157, 1,
1.062337, -0.8657659, 1.487925, 1, 0, 0.8352941, 1,
1.066886, -0.3201525, 1.858909, 1, 0, 0.827451, 1,
1.067038, -0.7814342, 2.713043, 1, 0, 0.8235294, 1,
1.081202, 0.4762193, 0.3498863, 1, 0, 0.8156863, 1,
1.083071, 1.137805, -0.05851872, 1, 0, 0.8117647, 1,
1.08709, -0.3260341, 0.9721815, 1, 0, 0.8039216, 1,
1.092675, -0.891794, 1.516805, 1, 0, 0.7960784, 1,
1.098843, -1.893686, 2.473406, 1, 0, 0.7921569, 1,
1.101565, -0.295167, 2.866462, 1, 0, 0.7843137, 1,
1.102225, -0.0406011, -0.3005712, 1, 0, 0.7803922, 1,
1.103766, -0.2804118, 2.59217, 1, 0, 0.772549, 1,
1.106772, -0.7359887, 1.833218, 1, 0, 0.7686275, 1,
1.112466, 0.5506186, 2.611388, 1, 0, 0.7607843, 1,
1.116803, 1.222014, 1.586706, 1, 0, 0.7568628, 1,
1.118644, -0.7425358, 3.194496, 1, 0, 0.7490196, 1,
1.132374, 1.51726, 3.233234, 1, 0, 0.7450981, 1,
1.133483, -0.06317708, 2.03506, 1, 0, 0.7372549, 1,
1.135612, -0.9510156, 2.336871, 1, 0, 0.7333333, 1,
1.13784, 0.4365221, -0.3768619, 1, 0, 0.7254902, 1,
1.139136, -0.6040198, 2.198851, 1, 0, 0.7215686, 1,
1.154361, 0.4729851, 1.52369, 1, 0, 0.7137255, 1,
1.159897, 0.3517201, 0.4833556, 1, 0, 0.7098039, 1,
1.163249, -0.9934557, 2.059356, 1, 0, 0.7019608, 1,
1.164865, 1.398853, -0.7294542, 1, 0, 0.6941177, 1,
1.170261, 0.526157, 2.527866, 1, 0, 0.6901961, 1,
1.1738, -0.3722681, 0.8357829, 1, 0, 0.682353, 1,
1.177169, -0.1820018, 2.391779, 1, 0, 0.6784314, 1,
1.180211, -0.00864819, 1.645843, 1, 0, 0.6705883, 1,
1.189349, 0.1048035, 3.391863, 1, 0, 0.6666667, 1,
1.192143, -0.341333, 0.9240921, 1, 0, 0.6588235, 1,
1.193134, 0.4834623, 1.494455, 1, 0, 0.654902, 1,
1.202822, 0.6046028, 2.540825, 1, 0, 0.6470588, 1,
1.206036, 0.4256271, 0.2211036, 1, 0, 0.6431373, 1,
1.216469, -0.7183009, 1.405294, 1, 0, 0.6352941, 1,
1.21731, -1.220409, 3.862541, 1, 0, 0.6313726, 1,
1.220603, 1.107492, 0.3605176, 1, 0, 0.6235294, 1,
1.23059, 0.03337968, 0.2675568, 1, 0, 0.6196079, 1,
1.236903, 0.1370364, -0.3806844, 1, 0, 0.6117647, 1,
1.244434, -0.4009837, 2.22645, 1, 0, 0.6078432, 1,
1.245177, -0.3250131, 1.814116, 1, 0, 0.6, 1,
1.246281, -0.5727017, 0.9442794, 1, 0, 0.5921569, 1,
1.260952, -0.6834213, 2.639963, 1, 0, 0.5882353, 1,
1.263919, -0.07348064, 1.186037, 1, 0, 0.5803922, 1,
1.28387, 0.8323793, 1.598838, 1, 0, 0.5764706, 1,
1.297511, -0.6758358, 3.804936, 1, 0, 0.5686275, 1,
1.29956, 0.5340725, 1.248336, 1, 0, 0.5647059, 1,
1.309937, 0.5815675, -0.2156817, 1, 0, 0.5568628, 1,
1.322788, -1.649259, 3.774755, 1, 0, 0.5529412, 1,
1.326423, 1.418863, 0.2882511, 1, 0, 0.5450981, 1,
1.327233, 0.9779802, 1.375957, 1, 0, 0.5411765, 1,
1.332212, 0.5882226, 0.05508211, 1, 0, 0.5333334, 1,
1.355879, -0.1076981, 2.571499, 1, 0, 0.5294118, 1,
1.360398, 0.1467216, 1.765973, 1, 0, 0.5215687, 1,
1.360498, 1.530827, -1.292085, 1, 0, 0.5176471, 1,
1.363483, 0.7557051, 1.085963, 1, 0, 0.509804, 1,
1.368486, 0.3000368, 2.127501, 1, 0, 0.5058824, 1,
1.371943, 0.08242684, 1.811231, 1, 0, 0.4980392, 1,
1.377179, -0.3817967, 2.025038, 1, 0, 0.4901961, 1,
1.378386, -0.1066619, 2.5883, 1, 0, 0.4862745, 1,
1.384339, 1.712602, 1.088215, 1, 0, 0.4784314, 1,
1.385334, -0.5091766, 1.064493, 1, 0, 0.4745098, 1,
1.392728, 1.253822, 1.68549, 1, 0, 0.4666667, 1,
1.397181, 0.07049558, 2.830967, 1, 0, 0.4627451, 1,
1.399898, 0.2817788, 1.350431, 1, 0, 0.454902, 1,
1.403758, -0.1982685, 1.919699, 1, 0, 0.4509804, 1,
1.441091, 0.5041255, 0.7902088, 1, 0, 0.4431373, 1,
1.441964, 0.5652891, 2.357503, 1, 0, 0.4392157, 1,
1.442396, -0.01101427, -0.5734999, 1, 0, 0.4313726, 1,
1.444342, -0.1292584, 3.386702, 1, 0, 0.427451, 1,
1.451303, -0.8902034, 2.656728, 1, 0, 0.4196078, 1,
1.462945, -0.8641758, 1.453539, 1, 0, 0.4156863, 1,
1.486875, -0.9706563, 2.921731, 1, 0, 0.4078431, 1,
1.490513, 1.867691, 1.51908, 1, 0, 0.4039216, 1,
1.492876, -0.5772785, 1.154123, 1, 0, 0.3960784, 1,
1.505221, 1.075901, -0.5320596, 1, 0, 0.3882353, 1,
1.511118, 0.7911965, 0.1812528, 1, 0, 0.3843137, 1,
1.513662, -1.434454, 1.866657, 1, 0, 0.3764706, 1,
1.522856, -0.2390748, 0.7278893, 1, 0, 0.372549, 1,
1.52595, 0.9729625, 2.781187, 1, 0, 0.3647059, 1,
1.544528, -1.443554, 0.7667792, 1, 0, 0.3607843, 1,
1.560768, 1.785646, 0.04397098, 1, 0, 0.3529412, 1,
1.567279, 0.6260298, 1.907116, 1, 0, 0.3490196, 1,
1.569989, 0.6851879, 1.039706, 1, 0, 0.3411765, 1,
1.576795, -0.706325, 0.5106324, 1, 0, 0.3372549, 1,
1.578043, 0.3265027, 0.7187111, 1, 0, 0.3294118, 1,
1.579004, 0.5861063, -0.08611505, 1, 0, 0.3254902, 1,
1.579702, -0.2966178, 1.860463, 1, 0, 0.3176471, 1,
1.579773, -1.172695, 2.647509, 1, 0, 0.3137255, 1,
1.583418, -0.07288495, 2.950647, 1, 0, 0.3058824, 1,
1.613479, -0.06201908, 1.865355, 1, 0, 0.2980392, 1,
1.613705, -0.2284122, 2.500247, 1, 0, 0.2941177, 1,
1.655771, -0.4931415, 2.134137, 1, 0, 0.2862745, 1,
1.660514, 0.6482381, 0.4811749, 1, 0, 0.282353, 1,
1.685581, 0.03571469, 1.038717, 1, 0, 0.2745098, 1,
1.705884, 0.6275855, 0.6846851, 1, 0, 0.2705882, 1,
1.714694, -1.339619, 3.649372, 1, 0, 0.2627451, 1,
1.716145, -0.1295077, 1.95006, 1, 0, 0.2588235, 1,
1.71644, 0.8547339, 1.923305, 1, 0, 0.2509804, 1,
1.758245, -0.4510148, 1.631014, 1, 0, 0.2470588, 1,
1.772495, -1.501258, 1.755698, 1, 0, 0.2392157, 1,
1.775221, -0.1186337, 0.2427571, 1, 0, 0.2352941, 1,
1.784354, 0.1213735, 1.800306, 1, 0, 0.227451, 1,
1.792651, 0.9288476, 1.990129, 1, 0, 0.2235294, 1,
1.802305, -0.6035836, 1.966913, 1, 0, 0.2156863, 1,
1.828387, -0.5097741, 1.38473, 1, 0, 0.2117647, 1,
1.835152, 1.10949, 1.938316, 1, 0, 0.2039216, 1,
1.85634, -1.116082, 1.748645, 1, 0, 0.1960784, 1,
1.858165, -1.039447, 2.694039, 1, 0, 0.1921569, 1,
1.877516, -1.547011, 3.259002, 1, 0, 0.1843137, 1,
1.910305, 0.3343381, 0.3593815, 1, 0, 0.1803922, 1,
1.91744, -0.7707371, 2.439996, 1, 0, 0.172549, 1,
1.917752, -1.569287, 2.132051, 1, 0, 0.1686275, 1,
1.917937, 0.9624591, 1.120416, 1, 0, 0.1607843, 1,
1.9541, 0.7546402, 0.4064158, 1, 0, 0.1568628, 1,
1.966784, 0.3990336, 0.772124, 1, 0, 0.1490196, 1,
1.972812, -0.4405477, 3.422909, 1, 0, 0.145098, 1,
1.977168, -0.8526081, 1.845512, 1, 0, 0.1372549, 1,
1.990283, -1.811768, 1.929639, 1, 0, 0.1333333, 1,
2.018316, -0.9667091, 1.236489, 1, 0, 0.1254902, 1,
2.033582, -2.996175, 3.414526, 1, 0, 0.1215686, 1,
2.068555, 1.04405, -0.03874616, 1, 0, 0.1137255, 1,
2.072552, -0.3946329, 2.153376, 1, 0, 0.1098039, 1,
2.078215, 1.132816, 1.740387, 1, 0, 0.1019608, 1,
2.079664, 2.116264, 0.7137863, 1, 0, 0.09411765, 1,
2.171937, 0.7939032, 1.001665, 1, 0, 0.09019608, 1,
2.186156, 2.943157, -0.1351695, 1, 0, 0.08235294, 1,
2.237398, -0.09154829, 2.283825, 1, 0, 0.07843138, 1,
2.260868, -0.3845071, 2.592252, 1, 0, 0.07058824, 1,
2.304847, 2.592595, 2.302605, 1, 0, 0.06666667, 1,
2.33986, 0.7002546, 2.688437, 1, 0, 0.05882353, 1,
2.507011, -0.4274892, 0.7489014, 1, 0, 0.05490196, 1,
2.557315, -0.02036831, 1.812713, 1, 0, 0.04705882, 1,
2.568681, -0.9883218, 2.755824, 1, 0, 0.04313726, 1,
2.620019, 2.101466, 2.032652, 1, 0, 0.03529412, 1,
2.7013, -0.5820436, 0.4222008, 1, 0, 0.03137255, 1,
2.760198, -0.04035837, 2.164683, 1, 0, 0.02352941, 1,
2.81282, -1.463247, 0.5193753, 1, 0, 0.01960784, 1,
3.29718, -2.332124, 1.176043, 1, 0, 0.01176471, 1,
3.431434, 1.205367, 2.117151, 1, 0, 0.007843138, 1
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
0.3233198, -4.126791, -7.127187, 0, -0.5, 0.5, 0.5,
0.3233198, -4.126791, -7.127187, 1, -0.5, 0.5, 0.5,
0.3233198, -4.126791, -7.127187, 1, 1.5, 0.5, 0.5,
0.3233198, -4.126791, -7.127187, 0, 1.5, 0.5, 0.5
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
-3.838445, 0.3117336, -7.127187, 0, -0.5, 0.5, 0.5,
-3.838445, 0.3117336, -7.127187, 1, -0.5, 0.5, 0.5,
-3.838445, 0.3117336, -7.127187, 1, 1.5, 0.5, 0.5,
-3.838445, 0.3117336, -7.127187, 0, 1.5, 0.5, 0.5
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
-3.838445, -4.126791, 0.2390118, 0, -0.5, 0.5, 0.5,
-3.838445, -4.126791, 0.2390118, 1, -0.5, 0.5, 0.5,
-3.838445, -4.126791, 0.2390118, 1, 1.5, 0.5, 0.5,
-3.838445, -4.126791, 0.2390118, 0, 1.5, 0.5, 0.5
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
-2, -3.102516, -5.427295,
3, -3.102516, -5.427295,
-2, -3.102516, -5.427295,
-2, -3.273228, -5.71061,
-1, -3.102516, -5.427295,
-1, -3.273228, -5.71061,
0, -3.102516, -5.427295,
0, -3.273228, -5.71061,
1, -3.102516, -5.427295,
1, -3.273228, -5.71061,
2, -3.102516, -5.427295,
2, -3.273228, -5.71061,
3, -3.102516, -5.427295,
3, -3.273228, -5.71061
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
-2, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
-2, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
-2, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
-2, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5,
-1, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
-1, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
-1, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
-1, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5,
0, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
0, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
0, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
0, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5,
1, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
1, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
1, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
1, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5,
2, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
2, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
2, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
2, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5,
3, -3.614653, -6.277241, 0, -0.5, 0.5, 0.5,
3, -3.614653, -6.277241, 1, -0.5, 0.5, 0.5,
3, -3.614653, -6.277241, 1, 1.5, 0.5, 0.5,
3, -3.614653, -6.277241, 0, 1.5, 0.5, 0.5
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
-2.878038, -3, -5.427295,
-2.878038, 3, -5.427295,
-2.878038, -3, -5.427295,
-3.038106, -3, -5.71061,
-2.878038, -2, -5.427295,
-3.038106, -2, -5.71061,
-2.878038, -1, -5.427295,
-3.038106, -1, -5.71061,
-2.878038, 0, -5.427295,
-3.038106, 0, -5.71061,
-2.878038, 1, -5.427295,
-3.038106, 1, -5.71061,
-2.878038, 2, -5.427295,
-3.038106, 2, -5.71061,
-2.878038, 3, -5.427295,
-3.038106, 3, -5.71061
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
-3.358242, -3, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, -3, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, -3, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, -3, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, -2, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, -2, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, -2, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, -2, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, -1, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, -1, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, -1, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, -1, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, 0, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, 0, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, 0, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, 0, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, 1, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, 1, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, 1, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, 1, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, 2, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, 2, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, 2, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, 2, -6.277241, 0, 1.5, 0.5, 0.5,
-3.358242, 3, -6.277241, 0, -0.5, 0.5, 0.5,
-3.358242, 3, -6.277241, 1, -0.5, 0.5, 0.5,
-3.358242, 3, -6.277241, 1, 1.5, 0.5, 0.5,
-3.358242, 3, -6.277241, 0, 1.5, 0.5, 0.5
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
-2.878038, -3.102516, -4,
-2.878038, -3.102516, 4,
-2.878038, -3.102516, -4,
-3.038106, -3.273228, -4,
-2.878038, -3.102516, -2,
-3.038106, -3.273228, -2,
-2.878038, -3.102516, 0,
-3.038106, -3.273228, 0,
-2.878038, -3.102516, 2,
-3.038106, -3.273228, 2,
-2.878038, -3.102516, 4,
-3.038106, -3.273228, 4
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
-3.358242, -3.614653, -4, 0, -0.5, 0.5, 0.5,
-3.358242, -3.614653, -4, 1, -0.5, 0.5, 0.5,
-3.358242, -3.614653, -4, 1, 1.5, 0.5, 0.5,
-3.358242, -3.614653, -4, 0, 1.5, 0.5, 0.5,
-3.358242, -3.614653, -2, 0, -0.5, 0.5, 0.5,
-3.358242, -3.614653, -2, 1, -0.5, 0.5, 0.5,
-3.358242, -3.614653, -2, 1, 1.5, 0.5, 0.5,
-3.358242, -3.614653, -2, 0, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 0, 0, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 0, 1, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 0, 1, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 0, 0, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 2, 0, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 2, 1, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 2, 1, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 2, 0, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 4, 0, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 4, 1, -0.5, 0.5, 0.5,
-3.358242, -3.614653, 4, 1, 1.5, 0.5, 0.5,
-3.358242, -3.614653, 4, 0, 1.5, 0.5, 0.5
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
-2.878038, -3.102516, -5.427295,
-2.878038, 3.725983, -5.427295,
-2.878038, -3.102516, 5.905319,
-2.878038, 3.725983, 5.905319,
-2.878038, -3.102516, -5.427295,
-2.878038, -3.102516, 5.905319,
-2.878038, 3.725983, -5.427295,
-2.878038, 3.725983, 5.905319,
-2.878038, -3.102516, -5.427295,
3.524678, -3.102516, -5.427295,
-2.878038, -3.102516, 5.905319,
3.524678, -3.102516, 5.905319,
-2.878038, 3.725983, -5.427295,
3.524678, 3.725983, -5.427295,
-2.878038, 3.725983, 5.905319,
3.524678, 3.725983, 5.905319,
3.524678, -3.102516, -5.427295,
3.524678, 3.725983, -5.427295,
3.524678, -3.102516, 5.905319,
3.524678, 3.725983, 5.905319,
3.524678, -3.102516, -5.427295,
3.524678, -3.102516, 5.905319,
3.524678, 3.725983, -5.427295,
3.524678, 3.725983, 5.905319
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
var radius = 7.848811;
var distance = 34.92025;
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
mvMatrix.translate( -0.3233198, -0.3117336, -0.2390118 );
mvMatrix.scale( 1.32542, 1.242775, 0.7488377 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92025);
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
BENZAMIDE<-read.table("BENZAMIDE.xyz")
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
-2.784795, 0.1325208, -1.017167, 0, 0, 1, 1, 1,
-2.63034, -0.3858802, -0.6176714, 1, 0, 0, 1, 1,
-2.423783, 0.4014505, -1.60603, 1, 0, 0, 1, 1,
-2.42327, 0.1995876, -3.062565, 1, 0, 0, 1, 1,
-2.388953, -2.385436, -3.23499, 1, 0, 0, 1, 1,
-2.337608, 0.6576234, -0.3160189, 1, 0, 0, 1, 1,
-2.296487, 1.932512, 0.6823474, 0, 0, 0, 1, 1,
-2.279405, 1.033943, -1.661088, 0, 0, 0, 1, 1,
-2.266495, -0.3068058, -2.050976, 0, 0, 0, 1, 1,
-2.229179, 0.3865349, -1.381971, 0, 0, 0, 1, 1,
-2.02922, -0.710299, -4.442757, 0, 0, 0, 1, 1,
-2.021705, 0.2430831, -0.9780032, 0, 0, 0, 1, 1,
-2.01165, -0.08089242, -0.8114696, 0, 0, 0, 1, 1,
-1.968968, -0.4734824, -1.385388, 1, 1, 1, 1, 1,
-1.966282, 0.7208883, -0.5265114, 1, 1, 1, 1, 1,
-1.962235, 0.1744075, -0.6542806, 1, 1, 1, 1, 1,
-1.957954, -0.8571349, -1.162024, 1, 1, 1, 1, 1,
-1.919141, -1.156002, -3.010708, 1, 1, 1, 1, 1,
-1.881708, 0.8622454, -0.5263737, 1, 1, 1, 1, 1,
-1.868953, 0.3144805, -3.083785, 1, 1, 1, 1, 1,
-1.868462, -2.146999, -2.355367, 1, 1, 1, 1, 1,
-1.824404, 0.1672994, -0.3770791, 1, 1, 1, 1, 1,
-1.815015, -0.5645141, -2.161436, 1, 1, 1, 1, 1,
-1.81372, 0.5144666, -0.8132591, 1, 1, 1, 1, 1,
-1.80598, 0.2253485, -0.9141972, 1, 1, 1, 1, 1,
-1.784687, -0.3986671, -2.749396, 1, 1, 1, 1, 1,
-1.762918, -0.7412862, -3.360473, 1, 1, 1, 1, 1,
-1.732816, -0.6543422, -4.273473, 1, 1, 1, 1, 1,
-1.732716, 2.107653, -1.508345, 0, 0, 1, 1, 1,
-1.716838, 1.28596, -1.240088, 1, 0, 0, 1, 1,
-1.705817, -0.9034932, -3.802165, 1, 0, 0, 1, 1,
-1.704455, 0.2639112, 0.2667981, 1, 0, 0, 1, 1,
-1.691416, 0.1802735, 1.091523, 1, 0, 0, 1, 1,
-1.679453, 0.1505588, -1.062121, 1, 0, 0, 1, 1,
-1.671968, -0.3037428, -1.996345, 0, 0, 0, 1, 1,
-1.669646, -1.509155, -1.610618, 0, 0, 0, 1, 1,
-1.665284, -0.6802579, -2.134218, 0, 0, 0, 1, 1,
-1.655081, 1.10734, -1.348716, 0, 0, 0, 1, 1,
-1.654678, -0.4148101, -2.442266, 0, 0, 0, 1, 1,
-1.648901, -0.04827971, -2.386819, 0, 0, 0, 1, 1,
-1.643499, -1.034414, -1.348258, 0, 0, 0, 1, 1,
-1.636213, 0.7481197, -1.685879, 1, 1, 1, 1, 1,
-1.634823, -2.016172, -3.033145, 1, 1, 1, 1, 1,
-1.628851, -0.6671805, -0.6439222, 1, 1, 1, 1, 1,
-1.586636, 0.02718574, -0.9689311, 1, 1, 1, 1, 1,
-1.577133, -0.6427722, -2.253539, 1, 1, 1, 1, 1,
-1.570666, 1.093426, -0.6206888, 1, 1, 1, 1, 1,
-1.570638, -0.002396367, -1.562423, 1, 1, 1, 1, 1,
-1.552295, 0.3412986, -0.2901272, 1, 1, 1, 1, 1,
-1.546348, -0.6757861, -2.590618, 1, 1, 1, 1, 1,
-1.545771, -0.4448821, -1.579591, 1, 1, 1, 1, 1,
-1.542783, 0.4972131, -0.3556321, 1, 1, 1, 1, 1,
-1.538904, -1.980428, -1.84751, 1, 1, 1, 1, 1,
-1.527309, 0.4194431, -0.9821548, 1, 1, 1, 1, 1,
-1.509935, 0.3422829, -2.011942, 1, 1, 1, 1, 1,
-1.509236, 1.43076, -2.132246, 1, 1, 1, 1, 1,
-1.507972, -1.288559, -1.4132, 0, 0, 1, 1, 1,
-1.49413, -0.5759858, -3.875988, 1, 0, 0, 1, 1,
-1.493786, -0.7744986, -4.051778, 1, 0, 0, 1, 1,
-1.491172, -0.5370101, -1.676802, 1, 0, 0, 1, 1,
-1.487741, -0.783024, 0.5482, 1, 0, 0, 1, 1,
-1.487218, -0.3927339, -1.873025, 1, 0, 0, 1, 1,
-1.476715, -1.492058, -3.314998, 0, 0, 0, 1, 1,
-1.464692, 1.110636, -1.470922, 0, 0, 0, 1, 1,
-1.455226, -2.066358, -2.428916, 0, 0, 0, 1, 1,
-1.445626, -1.043054, -1.019315, 0, 0, 0, 1, 1,
-1.444972, 0.6543897, -1.269385, 0, 0, 0, 1, 1,
-1.444914, 0.4986005, -0.7590547, 0, 0, 0, 1, 1,
-1.443807, 0.2389706, -1.551372, 0, 0, 0, 1, 1,
-1.428759, -1.29349, -2.106966, 1, 1, 1, 1, 1,
-1.420162, -0.9875308, -2.397942, 1, 1, 1, 1, 1,
-1.418575, 0.1704922, -1.634703, 1, 1, 1, 1, 1,
-1.41515, -0.00506071, -1.267442, 1, 1, 1, 1, 1,
-1.414367, 0.3069966, -3.371816, 1, 1, 1, 1, 1,
-1.41419, 1.685164, -0.3864964, 1, 1, 1, 1, 1,
-1.411908, 1.517362, -1.420271, 1, 1, 1, 1, 1,
-1.39577, 0.6100822, -1.741157, 1, 1, 1, 1, 1,
-1.383657, -1.356473, -0.5325791, 1, 1, 1, 1, 1,
-1.362676, 1.85986, -0.940653, 1, 1, 1, 1, 1,
-1.362082, -0.1350627, -1.959944, 1, 1, 1, 1, 1,
-1.341431, 0.09046006, -1.641357, 1, 1, 1, 1, 1,
-1.340451, -0.3657786, -2.556698, 1, 1, 1, 1, 1,
-1.332496, -0.2027161, -3.551253, 1, 1, 1, 1, 1,
-1.330999, 1.149028, -0.9577063, 1, 1, 1, 1, 1,
-1.326203, -0.4083785, -1.950009, 0, 0, 1, 1, 1,
-1.323103, -0.28205, -1.264469, 1, 0, 0, 1, 1,
-1.311287, -1.146485, -0.8908209, 1, 0, 0, 1, 1,
-1.310132, -0.2315788, -0.2848712, 1, 0, 0, 1, 1,
-1.305099, 0.2086802, -2.013861, 1, 0, 0, 1, 1,
-1.303208, 0.8599907, -0.7718275, 1, 0, 0, 1, 1,
-1.299101, 0.2536779, -3.402064, 0, 0, 0, 1, 1,
-1.290424, -0.6098631, -1.573145, 0, 0, 0, 1, 1,
-1.280294, -1.082847, -1.360743, 0, 0, 0, 1, 1,
-1.274828, -1.755208, -2.219158, 0, 0, 0, 1, 1,
-1.27245, 0.5012418, -1.920982, 0, 0, 0, 1, 1,
-1.272138, 0.9274259, -2.025249, 0, 0, 0, 1, 1,
-1.265935, -2.581792, -4.480834, 0, 0, 0, 1, 1,
-1.260793, 0.2297967, -1.345605, 1, 1, 1, 1, 1,
-1.256824, 0.7317574, -1.641634, 1, 1, 1, 1, 1,
-1.252264, 0.08656741, -1.094158, 1, 1, 1, 1, 1,
-1.25203, -1.050745, -3.085329, 1, 1, 1, 1, 1,
-1.250373, -0.6809708, -2.101351, 1, 1, 1, 1, 1,
-1.231555, -0.5597184, -1.476859, 1, 1, 1, 1, 1,
-1.230293, -1.5168, -3.94173, 1, 1, 1, 1, 1,
-1.225296, -0.06869066, 0.6506348, 1, 1, 1, 1, 1,
-1.218525, -0.6767732, -2.879826, 1, 1, 1, 1, 1,
-1.217242, -0.9907016, -2.69359, 1, 1, 1, 1, 1,
-1.214079, -0.9724658, -3.872824, 1, 1, 1, 1, 1,
-1.20686, -2.563123, -1.710549, 1, 1, 1, 1, 1,
-1.205322, -1.562851, -2.294606, 1, 1, 1, 1, 1,
-1.205044, -0.1648136, -2.626391, 1, 1, 1, 1, 1,
-1.204516, 0.7588874, -0.426304, 1, 1, 1, 1, 1,
-1.201254, 0.7548643, -1.928772, 0, 0, 1, 1, 1,
-1.201114, 1.541901, -1.508383, 1, 0, 0, 1, 1,
-1.197279, -0.4274117, -2.172845, 1, 0, 0, 1, 1,
-1.195827, 1.724263, -1.576689, 1, 0, 0, 1, 1,
-1.183208, -1.029498, -1.675537, 1, 0, 0, 1, 1,
-1.174611, 0.2687306, -0.2205197, 1, 0, 0, 1, 1,
-1.173013, -0.6988683, -1.972291, 0, 0, 0, 1, 1,
-1.166945, -1.381297, -1.186512, 0, 0, 0, 1, 1,
-1.1585, -1.486921, -1.088789, 0, 0, 0, 1, 1,
-1.153095, -0.7578825, -1.89956, 0, 0, 0, 1, 1,
-1.144892, -1.284292, -2.223637, 0, 0, 0, 1, 1,
-1.144235, 1.503831, -0.7281752, 0, 0, 0, 1, 1,
-1.142461, -1.267144, -3.699278, 0, 0, 0, 1, 1,
-1.140918, 0.9199594, -1.163013, 1, 1, 1, 1, 1,
-1.139644, -0.2689065, -2.496864, 1, 1, 1, 1, 1,
-1.139452, -0.2251301, -2.872114, 1, 1, 1, 1, 1,
-1.138877, 0.1813728, -1.375437, 1, 1, 1, 1, 1,
-1.119903, -0.3625234, -1.08048, 1, 1, 1, 1, 1,
-1.105634, 0.4135985, -0.4832195, 1, 1, 1, 1, 1,
-1.104038, 0.1401017, -2.284681, 1, 1, 1, 1, 1,
-1.098057, 0.1644887, -0.021446, 1, 1, 1, 1, 1,
-1.095343, 0.4408707, -1.520266, 1, 1, 1, 1, 1,
-1.088983, -0.4284742, -0.006366131, 1, 1, 1, 1, 1,
-1.086237, -0.3387366, -0.9538127, 1, 1, 1, 1, 1,
-1.083669, 1.233731, -0.7741615, 1, 1, 1, 1, 1,
-1.081548, 1.684714, -1.293712, 1, 1, 1, 1, 1,
-1.077011, 0.3336057, -1.572478, 1, 1, 1, 1, 1,
-1.070578, 0.1122904, -1.636581, 1, 1, 1, 1, 1,
-1.069507, -0.9620576, -2.209705, 0, 0, 1, 1, 1,
-1.056699, 1.279879, 0.9353973, 1, 0, 0, 1, 1,
-1.053616, -0.1260499, -0.7143332, 1, 0, 0, 1, 1,
-1.05039, 0.8203045, -0.9850283, 1, 0, 0, 1, 1,
-1.039234, -0.3444825, -2.585425, 1, 0, 0, 1, 1,
-1.036252, -0.2249192, 0.2707566, 1, 0, 0, 1, 1,
-1.036102, -1.143831, -3.655112, 0, 0, 0, 1, 1,
-1.027424, 0.4408641, -1.919362, 0, 0, 0, 1, 1,
-1.025901, -0.7145891, -2.400967, 0, 0, 0, 1, 1,
-1.022849, -0.4200048, -1.710636, 0, 0, 0, 1, 1,
-1.014023, -0.2353311, -0.3968117, 0, 0, 0, 1, 1,
-1.011523, -0.1165547, -0.6823611, 0, 0, 0, 1, 1,
-1.010766, 0.001135136, -2.113621, 0, 0, 0, 1, 1,
-1.004289, -0.2076774, 0.7389775, 1, 1, 1, 1, 1,
-1.001216, -0.9353611, -3.745991, 1, 1, 1, 1, 1,
-0.9846903, -0.6229743, -2.463307, 1, 1, 1, 1, 1,
-0.9830144, 0.4948378, -0.6087536, 1, 1, 1, 1, 1,
-0.9739648, -1.257416, -2.20406, 1, 1, 1, 1, 1,
-0.9538081, 1.510394, -0.6187199, 1, 1, 1, 1, 1,
-0.952661, 0.3004352, -1.808266, 1, 1, 1, 1, 1,
-0.9366758, -0.06959938, -2.153436, 1, 1, 1, 1, 1,
-0.9342557, 1.784916, 1.160899, 1, 1, 1, 1, 1,
-0.9247362, 1.182941, -0.7049797, 1, 1, 1, 1, 1,
-0.9244199, -0.8298762, -1.763121, 1, 1, 1, 1, 1,
-0.9239022, 1.282586, -1.252906, 1, 1, 1, 1, 1,
-0.9222398, 0.5186176, -1.465834, 1, 1, 1, 1, 1,
-0.9195676, 0.2453497, 0.2846046, 1, 1, 1, 1, 1,
-0.9174343, 0.612615, -0.4220878, 1, 1, 1, 1, 1,
-0.9150023, -0.04820218, -1.99133, 0, 0, 1, 1, 1,
-0.9121739, -0.4805784, -1.916072, 1, 0, 0, 1, 1,
-0.9082006, 0.87145, 0.5203788, 1, 0, 0, 1, 1,
-0.9079933, 0.05091268, -2.575144, 1, 0, 0, 1, 1,
-0.9029697, 0.6076634, -2.573639, 1, 0, 0, 1, 1,
-0.8991327, -0.691233, -0.8759826, 1, 0, 0, 1, 1,
-0.892774, 0.2724514, -0.5726614, 0, 0, 0, 1, 1,
-0.8828604, -0.8325933, -3.029708, 0, 0, 0, 1, 1,
-0.8811746, -0.652624, -1.256438, 0, 0, 0, 1, 1,
-0.8799809, -0.1933477, -1.573547, 0, 0, 0, 1, 1,
-0.8797225, -0.7145928, -2.49346, 0, 0, 0, 1, 1,
-0.8766651, -0.943855, -3.74418, 0, 0, 0, 1, 1,
-0.8752061, 0.8087097, -0.2956225, 0, 0, 0, 1, 1,
-0.8746206, -0.5951734, -2.935017, 1, 1, 1, 1, 1,
-0.8740837, 0.1929179, -2.100829, 1, 1, 1, 1, 1,
-0.8688979, 0.3339597, -0.3974042, 1, 1, 1, 1, 1,
-0.8673518, 1.583374, -0.6204386, 1, 1, 1, 1, 1,
-0.8567653, 0.5504882, -0.310401, 1, 1, 1, 1, 1,
-0.8516276, 1.902327, 0.3089413, 1, 1, 1, 1, 1,
-0.8505449, -0.5948063, -3.018086, 1, 1, 1, 1, 1,
-0.8453394, -0.4666956, -2.409147, 1, 1, 1, 1, 1,
-0.8435048, -0.1818909, -1.675893, 1, 1, 1, 1, 1,
-0.8409978, 0.9093153, -1.271009, 1, 1, 1, 1, 1,
-0.8365363, -0.4088353, -3.955136, 1, 1, 1, 1, 1,
-0.835819, -0.1397738, -0.9451395, 1, 1, 1, 1, 1,
-0.8354714, -0.7755746, -1.215461, 1, 1, 1, 1, 1,
-0.8348617, -0.5784011, -2.503054, 1, 1, 1, 1, 1,
-0.8332842, -0.5970981, -1.152271, 1, 1, 1, 1, 1,
-0.8295706, -1.694061, -0.4754989, 0, 0, 1, 1, 1,
-0.8288392, 3.318913, -0.2595498, 1, 0, 0, 1, 1,
-0.8246443, 0.6623653, 0.5144284, 1, 0, 0, 1, 1,
-0.8244246, -0.5840654, -1.848683, 1, 0, 0, 1, 1,
-0.8218042, 0.1697047, -1.769682, 1, 0, 0, 1, 1,
-0.8205745, 0.1998888, -1.200721, 1, 0, 0, 1, 1,
-0.8188595, 0.598622, -1.502857, 0, 0, 0, 1, 1,
-0.8100715, -0.3972441, -4.029496, 0, 0, 0, 1, 1,
-0.8090599, 0.3457864, -0.4243164, 0, 0, 0, 1, 1,
-0.8056815, 0.1395335, -1.151782, 0, 0, 0, 1, 1,
-0.8054782, -0.3762992, -3.169248, 0, 0, 0, 1, 1,
-0.8028465, -0.8623611, -2.831774, 0, 0, 0, 1, 1,
-0.802712, -0.8837819, -1.531835, 0, 0, 0, 1, 1,
-0.8002301, -1.999285, -2.731121, 1, 1, 1, 1, 1,
-0.7976508, -0.5947926, -1.286991, 1, 1, 1, 1, 1,
-0.7965111, -0.8922013, -1.578309, 1, 1, 1, 1, 1,
-0.7888512, -0.6496012, -2.389504, 1, 1, 1, 1, 1,
-0.7721307, -0.5055643, -2.200979, 1, 1, 1, 1, 1,
-0.7643346, -1.006535, -3.042787, 1, 1, 1, 1, 1,
-0.7628987, 1.505761, -2.701393, 1, 1, 1, 1, 1,
-0.7603558, 1.023403, -1.789037, 1, 1, 1, 1, 1,
-0.7594694, 1.582625, 0.1982141, 1, 1, 1, 1, 1,
-0.7560662, -0.04391164, -1.338701, 1, 1, 1, 1, 1,
-0.7492903, 0.3464324, -0.6111256, 1, 1, 1, 1, 1,
-0.748313, 0.7596793, -0.976561, 1, 1, 1, 1, 1,
-0.7468156, -0.2720256, -3.051605, 1, 1, 1, 1, 1,
-0.7399474, 0.6851897, -2.39731, 1, 1, 1, 1, 1,
-0.7370561, 0.7757705, -0.8789043, 1, 1, 1, 1, 1,
-0.7366824, 0.2293332, -2.371335, 0, 0, 1, 1, 1,
-0.7360016, -0.976838, -3.684356, 1, 0, 0, 1, 1,
-0.7326312, 0.5343623, -0.9248508, 1, 0, 0, 1, 1,
-0.7316457, 0.4879766, -1.578673, 1, 0, 0, 1, 1,
-0.7282083, -0.5017644, -2.116172, 1, 0, 0, 1, 1,
-0.7242438, -0.2027925, -1.077521, 1, 0, 0, 1, 1,
-0.7227491, 0.447389, -0.104949, 0, 0, 0, 1, 1,
-0.7222473, -0.8208178, -2.9092, 0, 0, 0, 1, 1,
-0.7160625, -0.3207608, -1.634839, 0, 0, 0, 1, 1,
-0.7130705, 1.089646, -0.5825025, 0, 0, 0, 1, 1,
-0.7111365, -0.177561, -3.697448, 0, 0, 0, 1, 1,
-0.7107167, 0.09921192, -1.510692, 0, 0, 0, 1, 1,
-0.7013661, -0.9758624, -0.9885107, 0, 0, 0, 1, 1,
-0.6992821, 0.2935944, -2.536363, 1, 1, 1, 1, 1,
-0.6981148, 0.6091405, -1.41484, 1, 1, 1, 1, 1,
-0.6976876, -1.09257, -3.986573, 1, 1, 1, 1, 1,
-0.6929927, 1.295269, -2.026444, 1, 1, 1, 1, 1,
-0.6899394, -0.2359748, -0.5390406, 1, 1, 1, 1, 1,
-0.6816494, 1.10935, -0.1829881, 1, 1, 1, 1, 1,
-0.6766909, 0.9205796, -0.8890011, 1, 1, 1, 1, 1,
-0.675804, 1.203521, -1.056556, 1, 1, 1, 1, 1,
-0.6657708, 0.461232, -1.674047, 1, 1, 1, 1, 1,
-0.6627825, 1.353896, 0.6877162, 1, 1, 1, 1, 1,
-0.6618091, 1.081199, -0.4343208, 1, 1, 1, 1, 1,
-0.6591858, -0.4391449, -1.546949, 1, 1, 1, 1, 1,
-0.6579325, 0.3767611, -1.73444, 1, 1, 1, 1, 1,
-0.6551074, -1.306558, -2.621365, 1, 1, 1, 1, 1,
-0.650487, -0.7795794, -1.162283, 1, 1, 1, 1, 1,
-0.6504572, -0.6312555, -0.7008787, 0, 0, 1, 1, 1,
-0.6465914, -2.171496, -0.5996383, 1, 0, 0, 1, 1,
-0.64621, -1.246894, -2.331629, 1, 0, 0, 1, 1,
-0.6441635, -0.8627182, -2.514467, 1, 0, 0, 1, 1,
-0.6430793, -0.793804, -3.29036, 1, 0, 0, 1, 1,
-0.6381972, 0.0639656, -1.520069, 1, 0, 0, 1, 1,
-0.6333824, 1.485328, 0.9606417, 0, 0, 0, 1, 1,
-0.6238313, 0.5309418, -2.207191, 0, 0, 0, 1, 1,
-0.6226519, 0.7564007, -0.1329871, 0, 0, 0, 1, 1,
-0.614985, 0.06361538, -0.05055489, 0, 0, 0, 1, 1,
-0.6140282, -0.1844589, -5.262257, 0, 0, 0, 1, 1,
-0.6115717, 1.69801, -0.008762531, 0, 0, 0, 1, 1,
-0.6091022, -1.778449, -2.834274, 0, 0, 0, 1, 1,
-0.6063777, -0.5264969, -1.44863, 1, 1, 1, 1, 1,
-0.604468, -0.5573059, -1.732731, 1, 1, 1, 1, 1,
-0.6018935, -0.453824, -1.220573, 1, 1, 1, 1, 1,
-0.5999656, 0.9810123, -2.303087, 1, 1, 1, 1, 1,
-0.5976793, 0.5774912, -2.086638, 1, 1, 1, 1, 1,
-0.5956393, -1.840761, -3.456293, 1, 1, 1, 1, 1,
-0.5938581, 2.365101, -0.8280799, 1, 1, 1, 1, 1,
-0.5862494, 2.192897, 0.5382529, 1, 1, 1, 1, 1,
-0.5860654, 1.29379, -1.283221, 1, 1, 1, 1, 1,
-0.5843164, -1.15608, -3.431281, 1, 1, 1, 1, 1,
-0.5824533, -0.4758486, -1.931548, 1, 1, 1, 1, 1,
-0.5800276, -0.9106082, -2.185643, 1, 1, 1, 1, 1,
-0.5777341, 1.539048, -0.9911584, 1, 1, 1, 1, 1,
-0.5717261, -0.3906676, -2.691342, 1, 1, 1, 1, 1,
-0.571289, -0.888184, -2.146232, 1, 1, 1, 1, 1,
-0.5704963, -1.239896, -3.578134, 0, 0, 1, 1, 1,
-0.5682056, 1.987003, -1.600667, 1, 0, 0, 1, 1,
-0.5625092, 1.01242, 0.3860073, 1, 0, 0, 1, 1,
-0.5572158, -1.00639, -2.37557, 1, 0, 0, 1, 1,
-0.5543147, 0.1811297, -0.5433244, 1, 0, 0, 1, 1,
-0.5540379, 0.08790065, -1.382648, 1, 0, 0, 1, 1,
-0.553009, 1.084236, -0.7144185, 0, 0, 0, 1, 1,
-0.5408822, -0.7984164, -1.685893, 0, 0, 0, 1, 1,
-0.5385995, -2.005007, -3.287696, 0, 0, 0, 1, 1,
-0.5378476, 1.093065, -2.355189, 0, 0, 0, 1, 1,
-0.5368714, -0.4182367, -3.609281, 0, 0, 0, 1, 1,
-0.5368017, -0.5405954, -0.3449484, 0, 0, 0, 1, 1,
-0.5346763, -0.3585097, -0.9012342, 0, 0, 0, 1, 1,
-0.5332842, -1.324355, -3.35375, 1, 1, 1, 1, 1,
-0.5313866, 0.09536146, -1.857494, 1, 1, 1, 1, 1,
-0.5289114, 0.534213, -1.132261, 1, 1, 1, 1, 1,
-0.5272431, 0.02412127, -1.504187, 1, 1, 1, 1, 1,
-0.5260563, 0.1313364, -2.383332, 1, 1, 1, 1, 1,
-0.519578, -0.05603296, -3.346404, 1, 1, 1, 1, 1,
-0.5160412, -0.1517029, -2.741831, 1, 1, 1, 1, 1,
-0.5073357, 0.5081468, 0.06409772, 1, 1, 1, 1, 1,
-0.5018194, -0.4035692, -2.571157, 1, 1, 1, 1, 1,
-0.5015205, -0.964049, -1.390678, 1, 1, 1, 1, 1,
-0.5000511, -0.2001223, -0.07941344, 1, 1, 1, 1, 1,
-0.4873844, -1.718191, -3.460865, 1, 1, 1, 1, 1,
-0.4862778, 1.601065, -0.9832777, 1, 1, 1, 1, 1,
-0.4843103, 0.8864334, -0.02447959, 1, 1, 1, 1, 1,
-0.4737344, -1.680691, -1.826784, 1, 1, 1, 1, 1,
-0.4735258, 0.5260471, -0.1441188, 0, 0, 1, 1, 1,
-0.4703791, 0.2626143, -2.43977, 1, 0, 0, 1, 1,
-0.4677642, -1.048295, -3.658291, 1, 0, 0, 1, 1,
-0.4664249, -2.240776, -4.744211, 1, 0, 0, 1, 1,
-0.4582248, 0.3890895, -0.13299, 1, 0, 0, 1, 1,
-0.4452442, -0.6203986, -2.922119, 1, 0, 0, 1, 1,
-0.4438193, -0.004476535, -0.1373073, 0, 0, 0, 1, 1,
-0.4427218, -1.529918, -3.150461, 0, 0, 0, 1, 1,
-0.440796, -0.3544554, -1.971494, 0, 0, 0, 1, 1,
-0.4371144, 0.2133582, -1.418637, 0, 0, 0, 1, 1,
-0.4351973, 0.3991515, -0.948014, 0, 0, 0, 1, 1,
-0.4330745, -0.07668492, -1.984558, 0, 0, 0, 1, 1,
-0.4319452, 0.6592227, 0.4020107, 0, 0, 0, 1, 1,
-0.4305325, 0.2155732, 0.1965456, 1, 1, 1, 1, 1,
-0.4285108, 1.262938, 0.4042212, 1, 1, 1, 1, 1,
-0.4282793, 0.3234789, -0.4132156, 1, 1, 1, 1, 1,
-0.4246926, 2.336047, -0.1889789, 1, 1, 1, 1, 1,
-0.4245747, -0.8370504, -3.716196, 1, 1, 1, 1, 1,
-0.4194772, 0.06587092, -2.06269, 1, 1, 1, 1, 1,
-0.4189724, 0.5412688, -1.604812, 1, 1, 1, 1, 1,
-0.4188679, 0.5186825, 0.07745291, 1, 1, 1, 1, 1,
-0.4172451, -0.5887639, -2.686799, 1, 1, 1, 1, 1,
-0.4166003, -0.3568969, -1.226337, 1, 1, 1, 1, 1,
-0.4158013, 0.8716058, -1.204104, 1, 1, 1, 1, 1,
-0.4138613, 0.9708877, -0.6678501, 1, 1, 1, 1, 1,
-0.4111537, -1.417204, -1.732647, 1, 1, 1, 1, 1,
-0.4095265, 1.364574, -1.205067, 1, 1, 1, 1, 1,
-0.4088569, -0.4658862, -2.70048, 1, 1, 1, 1, 1,
-0.4084831, -1.48645, -3.763129, 0, 0, 1, 1, 1,
-0.4002255, 3.235054, 0.1945766, 1, 0, 0, 1, 1,
-0.3995446, 0.8259506, -2.095798, 1, 0, 0, 1, 1,
-0.3993406, 0.4197644, -1.985039, 1, 0, 0, 1, 1,
-0.3968522, 0.658296, -0.2578008, 1, 0, 0, 1, 1,
-0.3958775, 0.4846915, 0.4482487, 1, 0, 0, 1, 1,
-0.3952496, 0.2521601, -0.3667428, 0, 0, 0, 1, 1,
-0.3861459, -0.332901, -2.459215, 0, 0, 0, 1, 1,
-0.3859914, -0.8555838, -3.240937, 0, 0, 0, 1, 1,
-0.3841656, 1.25192, 0.8678596, 0, 0, 0, 1, 1,
-0.3801208, -0.6834244, -0.8310503, 0, 0, 0, 1, 1,
-0.3790831, 1.347821, -0.05108722, 0, 0, 0, 1, 1,
-0.3770464, -0.3013579, -3.635091, 0, 0, 0, 1, 1,
-0.3754885, 0.4340022, -1.075812, 1, 1, 1, 1, 1,
-0.3680219, 1.499899, 0.300641, 1, 1, 1, 1, 1,
-0.3655567, -0.3288877, -1.560245, 1, 1, 1, 1, 1,
-0.3615316, 1.467213, 0.2932471, 1, 1, 1, 1, 1,
-0.3569543, 0.6978434, 0.08324407, 1, 1, 1, 1, 1,
-0.3565387, 0.01805105, -1.528741, 1, 1, 1, 1, 1,
-0.3536312, 0.2866903, 1.36088, 1, 1, 1, 1, 1,
-0.3532252, 0.01748523, -2.255501, 1, 1, 1, 1, 1,
-0.3502202, -1.270106, -3.486307, 1, 1, 1, 1, 1,
-0.3463962, 0.2295598, -0.6855561, 1, 1, 1, 1, 1,
-0.3462041, 1.230916, -1.885535, 1, 1, 1, 1, 1,
-0.3440273, -0.297678, -2.116606, 1, 1, 1, 1, 1,
-0.3383799, 0.8490874, -1.23334, 1, 1, 1, 1, 1,
-0.337159, -0.01503939, -0.9594048, 1, 1, 1, 1, 1,
-0.3312692, -0.5840468, -3.683994, 1, 1, 1, 1, 1,
-0.3301792, 0.7977936, 0.8532423, 0, 0, 1, 1, 1,
-0.3265315, 2.140159, 0.1222889, 1, 0, 0, 1, 1,
-0.3251804, 0.7732825, 0.2812582, 1, 0, 0, 1, 1,
-0.3245606, 1.810379, 1.564575, 1, 0, 0, 1, 1,
-0.3240717, 1.451841, 0.116726, 1, 0, 0, 1, 1,
-0.3154288, -0.646197, -2.163854, 1, 0, 0, 1, 1,
-0.3126643, -0.6500224, -3.241439, 0, 0, 0, 1, 1,
-0.3119454, -0.3377513, -2.632501, 0, 0, 0, 1, 1,
-0.3081815, 0.0283099, -2.040408, 0, 0, 0, 1, 1,
-0.307289, -0.2569204, -2.397226, 0, 0, 0, 1, 1,
-0.3041872, -0.4089195, -3.697039, 0, 0, 0, 1, 1,
-0.3034101, 1.120127, 0.7660589, 0, 0, 0, 1, 1,
-0.296594, 0.3856749, -0.1077931, 0, 0, 0, 1, 1,
-0.2944711, -0.02534983, -3.53268, 1, 1, 1, 1, 1,
-0.2920191, -1.450154, -2.697595, 1, 1, 1, 1, 1,
-0.2912169, 1.066407, 3.329712, 1, 1, 1, 1, 1,
-0.2907706, -1.689954, -2.042067, 1, 1, 1, 1, 1,
-0.2906391, -0.7218495, -3.710119, 1, 1, 1, 1, 1,
-0.289146, 0.8927932, 0.3329118, 1, 1, 1, 1, 1,
-0.2858272, -1.055411, -4.599247, 1, 1, 1, 1, 1,
-0.2797976, -1.743749, -1.995904, 1, 1, 1, 1, 1,
-0.2790374, 0.0469378, -0.3552129, 1, 1, 1, 1, 1,
-0.2779128, -1.617977, -2.208209, 1, 1, 1, 1, 1,
-0.2747231, 0.9262322, 0.446905, 1, 1, 1, 1, 1,
-0.2746611, -0.3490159, -3.101919, 1, 1, 1, 1, 1,
-0.2739965, 0.9671517, 0.4778517, 1, 1, 1, 1, 1,
-0.2644391, -1.795109, -2.764899, 1, 1, 1, 1, 1,
-0.2633102, -0.7118521, -2.681078, 1, 1, 1, 1, 1,
-0.2625579, -0.7947036, -2.689904, 0, 0, 1, 1, 1,
-0.2613522, -0.5276268, -4.141448, 1, 0, 0, 1, 1,
-0.2570319, -0.5281534, -2.161291, 1, 0, 0, 1, 1,
-0.2554036, 1.737234, -1.083704, 1, 0, 0, 1, 1,
-0.2553872, -0.5741224, -4.054909, 1, 0, 0, 1, 1,
-0.2551016, 0.5387302, -1.268022, 1, 0, 0, 1, 1,
-0.2539632, 0.386631, 0.1210692, 0, 0, 0, 1, 1,
-0.2507007, -1.111681, -2.39008, 0, 0, 0, 1, 1,
-0.2501394, -0.2912498, -2.315806, 0, 0, 0, 1, 1,
-0.2387647, -0.06026708, -2.165314, 0, 0, 0, 1, 1,
-0.2362189, -0.9765058, -1.258769, 0, 0, 0, 1, 1,
-0.2296571, 0.8466158, -1.610754, 0, 0, 0, 1, 1,
-0.2285626, 0.1594492, -2.806041, 0, 0, 0, 1, 1,
-0.226954, 1.547093, -0.2827791, 1, 1, 1, 1, 1,
-0.2269383, 0.3341798, -1.15658, 1, 1, 1, 1, 1,
-0.2262515, 0.9436276, 0.3423312, 1, 1, 1, 1, 1,
-0.2247494, 0.3550515, -0.3627296, 1, 1, 1, 1, 1,
-0.2221517, -0.2124199, -0.2155377, 1, 1, 1, 1, 1,
-0.2212584, 0.4753271, -0.6038226, 1, 1, 1, 1, 1,
-0.2188676, 2.141421, -1.398006, 1, 1, 1, 1, 1,
-0.2180416, 0.3549597, 0.08227017, 1, 1, 1, 1, 1,
-0.217189, -0.1826832, -3.380071, 1, 1, 1, 1, 1,
-0.2142572, 1.51712, -1.724867, 1, 1, 1, 1, 1,
-0.2073895, 0.5243129, 0.0665061, 1, 1, 1, 1, 1,
-0.2055513, 1.579563, -0.01848926, 1, 1, 1, 1, 1,
-0.2047428, 0.839771, -1.586258, 1, 1, 1, 1, 1,
-0.2038134, -1.065242, -4.871122, 1, 1, 1, 1, 1,
-0.2003539, -1.181241, -3.911253, 1, 1, 1, 1, 1,
-0.1969711, 0.9919851, 0.00230189, 0, 0, 1, 1, 1,
-0.1932945, -0.684234, -3.084441, 1, 0, 0, 1, 1,
-0.189337, -0.1833123, -1.688945, 1, 0, 0, 1, 1,
-0.1892799, -0.6043949, -4.134945, 1, 0, 0, 1, 1,
-0.1881394, 0.06396341, -1.47955, 1, 0, 0, 1, 1,
-0.1864888, 0.5406317, -2.044892, 1, 0, 0, 1, 1,
-0.1832937, 0.4208833, -0.7857779, 0, 0, 0, 1, 1,
-0.1761631, -0.5117481, -3.41874, 0, 0, 0, 1, 1,
-0.1753398, 1.611957, 1.300488, 0, 0, 0, 1, 1,
-0.1738995, 0.778213, 0.06723288, 0, 0, 0, 1, 1,
-0.1723863, -0.1445733, -1.998899, 0, 0, 0, 1, 1,
-0.1699835, 0.1610918, -1.756719, 0, 0, 0, 1, 1,
-0.1673552, -0.256892, -1.956127, 0, 0, 0, 1, 1,
-0.1643032, -1.166632, -3.136304, 1, 1, 1, 1, 1,
-0.1628445, 0.2686856, -2.25253, 1, 1, 1, 1, 1,
-0.1624561, 0.1777804, 0.3011519, 1, 1, 1, 1, 1,
-0.1615734, -0.1197373, -0.3548671, 1, 1, 1, 1, 1,
-0.1605956, 0.2627139, 0.5032142, 1, 1, 1, 1, 1,
-0.1564658, 1.683211, 0.2238175, 1, 1, 1, 1, 1,
-0.1559777, -1.697749, -4.069315, 1, 1, 1, 1, 1,
-0.1539003, 0.6945731, -0.865071, 1, 1, 1, 1, 1,
-0.1477639, 0.6689171, -1.250177, 1, 1, 1, 1, 1,
-0.1446654, -0.02140724, -1.411086, 1, 1, 1, 1, 1,
-0.1421281, 0.8994968, -0.4372782, 1, 1, 1, 1, 1,
-0.1395284, 1.339732, -1.090215, 1, 1, 1, 1, 1,
-0.1385963, -0.3776524, -3.222654, 1, 1, 1, 1, 1,
-0.136562, -0.4325158, -3.254546, 1, 1, 1, 1, 1,
-0.1353493, -0.7775795, -2.56318, 1, 1, 1, 1, 1,
-0.1352344, -0.5138844, -3.465734, 0, 0, 1, 1, 1,
-0.1266255, -0.5100079, -3.220112, 1, 0, 0, 1, 1,
-0.1257208, -1.056221, -3.355047, 1, 0, 0, 1, 1,
-0.1248535, -1.292721, -3.301477, 1, 0, 0, 1, 1,
-0.124718, -0.06310212, -0.7822939, 1, 0, 0, 1, 1,
-0.1244538, -0.6450015, -1.682572, 1, 0, 0, 1, 1,
-0.1159591, -0.7233877, -2.774773, 0, 0, 0, 1, 1,
-0.1097182, -0.947817, -4.983529, 0, 0, 0, 1, 1,
-0.1090389, 0.9847525, 0.066082, 0, 0, 0, 1, 1,
-0.1063637, -0.1704451, -1.24323, 0, 0, 0, 1, 1,
-0.1061344, 1.133591, -1.361888, 0, 0, 0, 1, 1,
-0.105438, 0.5414646, 0.2214644, 0, 0, 0, 1, 1,
-0.1042428, 1.280773, 1.538694, 0, 0, 0, 1, 1,
-0.1026756, -1.839138, -3.22449, 1, 1, 1, 1, 1,
-0.1018547, -0.1803188, -2.244767, 1, 1, 1, 1, 1,
-0.09941304, -0.08547725, -4.503545, 1, 1, 1, 1, 1,
-0.09328035, -0.6181378, -3.311419, 1, 1, 1, 1, 1,
-0.08962017, 0.228845, 0.848225, 1, 1, 1, 1, 1,
-0.08754049, -0.05749514, -1.511565, 1, 1, 1, 1, 1,
-0.0831509, -0.4513482, -2.149614, 1, 1, 1, 1, 1,
-0.08202785, 0.7557387, 0.5517171, 1, 1, 1, 1, 1,
-0.07734461, -1.114421, -0.7398717, 1, 1, 1, 1, 1,
-0.07641748, 0.1014694, 0.2045652, 1, 1, 1, 1, 1,
-0.07550266, 0.9291525, -1.597125, 1, 1, 1, 1, 1,
-0.07349125, 0.6843168, -1.918609, 1, 1, 1, 1, 1,
-0.07175914, 0.646828, -0.2596728, 1, 1, 1, 1, 1,
-0.07032116, 2.273326, 0.5400801, 1, 1, 1, 1, 1,
-0.06689469, -1.175209, -1.841859, 1, 1, 1, 1, 1,
-0.06122634, 2.251168, -1.624774, 0, 0, 1, 1, 1,
-0.05821769, 0.003795981, -1.325149, 1, 0, 0, 1, 1,
-0.05246988, 1.151818, 1.609444, 1, 0, 0, 1, 1,
-0.05007336, -0.6768101, -5.035585, 1, 0, 0, 1, 1,
-0.04986326, 0.5035732, 0.8263498, 1, 0, 0, 1, 1,
-0.04665861, 0.4385785, -0.3306215, 1, 0, 0, 1, 1,
-0.03803961, 1.456347, -0.1519512, 0, 0, 0, 1, 1,
-0.0372379, -1.571075, -2.91777, 0, 0, 0, 1, 1,
-0.03635905, 0.06213954, -1.239075, 0, 0, 0, 1, 1,
-0.03443414, 1.696909, 0.5632645, 0, 0, 0, 1, 1,
-0.0339801, -0.8875548, -1.281008, 0, 0, 0, 1, 1,
-0.0315389, -1.840996, -3.095784, 0, 0, 0, 1, 1,
-0.03114054, -1.960528, -3.48867, 0, 0, 0, 1, 1,
-0.02418392, -0.01601398, -3.23162, 1, 1, 1, 1, 1,
-0.02226369, -0.2043869, -2.450536, 1, 1, 1, 1, 1,
-0.02193302, 0.1539129, -1.620006, 1, 1, 1, 1, 1,
-0.01968846, -0.6608766, -5.110449, 1, 1, 1, 1, 1,
-0.01837269, 0.01083318, 0.0442744, 1, 1, 1, 1, 1,
-0.01694173, 0.9064493, 0.843438, 1, 1, 1, 1, 1,
-0.01610758, -0.06648754, -3.470425, 1, 1, 1, 1, 1,
-0.01399726, 0.03500508, 1.0452, 1, 1, 1, 1, 1,
-0.009234112, 0.1251468, -1.074139, 1, 1, 1, 1, 1,
-0.006211377, 1.961095, 0.2828415, 1, 1, 1, 1, 1,
-0.004149058, -0.6620925, -3.052689, 1, 1, 1, 1, 1,
-0.0006099892, -0.03856901, -1.85162, 1, 1, 1, 1, 1,
0.002988139, -0.3136362, 3.446751, 1, 1, 1, 1, 1,
0.00452286, -0.5509828, 3.656284, 1, 1, 1, 1, 1,
0.004588095, 0.5693684, -1.488677, 1, 1, 1, 1, 1,
0.005528179, 2.313798, 1.320186, 0, 0, 1, 1, 1,
0.005650634, -0.4251027, 2.217466, 1, 0, 0, 1, 1,
0.008082929, -0.6038213, 3.577017, 1, 0, 0, 1, 1,
0.01057259, -0.8777341, 4.477135, 1, 0, 0, 1, 1,
0.01454912, -0.09978334, 2.406114, 1, 0, 0, 1, 1,
0.01782999, -0.9309321, 4.023021, 1, 0, 0, 1, 1,
0.01946398, -2.528118, 4.544378, 0, 0, 0, 1, 1,
0.02060018, -0.9429549, 1.812444, 0, 0, 0, 1, 1,
0.02149914, -0.1887089, 2.880872, 0, 0, 0, 1, 1,
0.0229433, 1.094378, 1.293432, 0, 0, 0, 1, 1,
0.02651361, 0.2140357, 3.166147, 0, 0, 0, 1, 1,
0.02728552, -0.4003248, 3.293865, 0, 0, 0, 1, 1,
0.0277602, -1.767217, 1.927824, 0, 0, 0, 1, 1,
0.02831263, 0.7085887, -0.39127, 1, 1, 1, 1, 1,
0.03056929, -0.9647473, 2.306429, 1, 1, 1, 1, 1,
0.03336455, -0.06868187, 3.713096, 1, 1, 1, 1, 1,
0.03580119, -1.726701, 2.518522, 1, 1, 1, 1, 1,
0.03654459, -1.985573, 2.834799, 1, 1, 1, 1, 1,
0.03836857, -1.221213, 3.629076, 1, 1, 1, 1, 1,
0.04062502, 0.8175587, 0.8065859, 1, 1, 1, 1, 1,
0.04086425, -1.498808, 2.301449, 1, 1, 1, 1, 1,
0.04371994, 0.7444601, 0.3478239, 1, 1, 1, 1, 1,
0.04553329, 0.7347579, -0.9277362, 1, 1, 1, 1, 1,
0.04630794, -1.565766, 1.400286, 1, 1, 1, 1, 1,
0.04754061, -2.357843, 1.400504, 1, 1, 1, 1, 1,
0.05006375, 0.364086, 1.013245, 1, 1, 1, 1, 1,
0.0531928, 0.1529865, 2.941688, 1, 1, 1, 1, 1,
0.05402733, -1.461359, 4.173832, 1, 1, 1, 1, 1,
0.05522604, -0.6177381, 2.187996, 0, 0, 1, 1, 1,
0.05541143, 0.4025188, 0.3063688, 1, 0, 0, 1, 1,
0.05628775, -0.2006871, 2.736679, 1, 0, 0, 1, 1,
0.07034919, -1.065107, 3.2112, 1, 0, 0, 1, 1,
0.07055879, -0.7158579, 2.104119, 1, 0, 0, 1, 1,
0.0708388, -0.5932165, 1.020692, 1, 0, 0, 1, 1,
0.07173452, 1.212428, -0.9124508, 0, 0, 0, 1, 1,
0.0747069, -1.158272, 3.567157, 0, 0, 0, 1, 1,
0.07572363, 0.05288713, 0.4288317, 0, 0, 0, 1, 1,
0.07862114, -1.228508, 3.004105, 0, 0, 0, 1, 1,
0.08030763, -0.9465591, 2.864562, 0, 0, 0, 1, 1,
0.08039332, 1.734474, -0.543852, 0, 0, 0, 1, 1,
0.08186287, -0.9033881, 4.241345, 0, 0, 0, 1, 1,
0.08316149, 0.6703997, -0.8846627, 1, 1, 1, 1, 1,
0.09403226, 0.07746664, 1.292128, 1, 1, 1, 1, 1,
0.09442075, 0.3533579, -2.013742, 1, 1, 1, 1, 1,
0.09613732, -0.7832772, 1.588876, 1, 1, 1, 1, 1,
0.100554, -0.8210503, 2.788012, 1, 1, 1, 1, 1,
0.1009353, -1.199522, 2.315506, 1, 1, 1, 1, 1,
0.1026922, 0.6329687, 0.7063631, 1, 1, 1, 1, 1,
0.1056909, 0.2794585, -1.751672, 1, 1, 1, 1, 1,
0.1058286, -0.9776934, 3.28077, 1, 1, 1, 1, 1,
0.1058596, -1.077357, 2.714108, 1, 1, 1, 1, 1,
0.1065467, -0.5136051, 3.057288, 1, 1, 1, 1, 1,
0.1075308, 1.606533, 0.2829859, 1, 1, 1, 1, 1,
0.1077175, 0.09438776, -0.2658332, 1, 1, 1, 1, 1,
0.1097017, -1.405171, 4.113016, 1, 1, 1, 1, 1,
0.1100939, -1.728363, 3.853127, 1, 1, 1, 1, 1,
0.1124028, -0.9751695, 3.484125, 0, 0, 1, 1, 1,
0.1132268, -0.2019595, 2.694918, 1, 0, 0, 1, 1,
0.1150285, 1.407645, 1.236413, 1, 0, 0, 1, 1,
0.1215709, 3.626539, 1.128251, 1, 0, 0, 1, 1,
0.123139, -0.3950263, 2.104979, 1, 0, 0, 1, 1,
0.1246637, 0.4614948, -0.5593931, 1, 0, 0, 1, 1,
0.1259265, -0.2342149, 2.388052, 0, 0, 0, 1, 1,
0.127742, 1.147006, 0.7199101, 0, 0, 0, 1, 1,
0.1367603, -0.8496532, 1.266639, 0, 0, 0, 1, 1,
0.1384391, 0.2986508, -0.1085557, 0, 0, 0, 1, 1,
0.1438005, 0.5248702, -1.155577, 0, 0, 0, 1, 1,
0.1440647, 0.9340408, 0.485512, 0, 0, 0, 1, 1,
0.1463622, 0.6627024, -0.7622678, 0, 0, 0, 1, 1,
0.1485854, -0.6777613, 3.645947, 1, 1, 1, 1, 1,
0.1519869, -2.223675, 1.534167, 1, 1, 1, 1, 1,
0.1528919, -0.4539595, 3.219839, 1, 1, 1, 1, 1,
0.1535316, -0.1009553, 2.224961, 1, 1, 1, 1, 1,
0.1537249, -0.7326249, 2.463573, 1, 1, 1, 1, 1,
0.1539164, -0.7410733, 3.558424, 1, 1, 1, 1, 1,
0.1540824, 1.787091, 0.6557069, 1, 1, 1, 1, 1,
0.1558143, 0.8778144, 0.5403158, 1, 1, 1, 1, 1,
0.1595615, -0.430277, 1.575407, 1, 1, 1, 1, 1,
0.1644177, 0.5430781, 0.02017045, 1, 1, 1, 1, 1,
0.1648836, 1.498289, 0.6207592, 1, 1, 1, 1, 1,
0.1659026, -1.845817, 5.210835, 1, 1, 1, 1, 1,
0.1686966, -0.6821889, 2.424965, 1, 1, 1, 1, 1,
0.1700871, -0.6589023, 3.342886, 1, 1, 1, 1, 1,
0.1713218, -0.6641931, 1.684286, 1, 1, 1, 1, 1,
0.1722228, 0.4662389, 0.2960372, 0, 0, 1, 1, 1,
0.1724498, -0.2474579, 1.871092, 1, 0, 0, 1, 1,
0.1754493, 1.068886, -0.6654443, 1, 0, 0, 1, 1,
0.1848221, -1.406837, 4.033157, 1, 0, 0, 1, 1,
0.1921492, 1.230889, 2.037839, 1, 0, 0, 1, 1,
0.1935236, -1.03733, 4.764657, 1, 0, 0, 1, 1,
0.1939737, 0.8389458, -0.3556801, 0, 0, 0, 1, 1,
0.197989, -0.6532352, 2.016167, 0, 0, 0, 1, 1,
0.1990636, -0.003555014, 0.3429285, 0, 0, 0, 1, 1,
0.2024505, 0.7688119, 2.386351, 0, 0, 0, 1, 1,
0.2044857, -0.5885559, 4.652636, 0, 0, 0, 1, 1,
0.2057089, 0.3066224, 0.4482197, 0, 0, 0, 1, 1,
0.2064606, -0.3489392, 2.636306, 0, 0, 0, 1, 1,
0.2081529, -1.174144, 3.45468, 1, 1, 1, 1, 1,
0.2087168, -0.961098, 3.4001, 1, 1, 1, 1, 1,
0.2159767, 0.5305952, 1.232625, 1, 1, 1, 1, 1,
0.2163225, -1.685251, 1.018706, 1, 1, 1, 1, 1,
0.2199475, -0.4752859, 3.169907, 1, 1, 1, 1, 1,
0.222533, 1.079043, -0.1556233, 1, 1, 1, 1, 1,
0.2266809, -0.3123623, 1.750209, 1, 1, 1, 1, 1,
0.2279448, 0.9656804, -0.7981319, 1, 1, 1, 1, 1,
0.2310095, -1.084898, 3.089189, 1, 1, 1, 1, 1,
0.2332623, 2.149341, 0.1182335, 1, 1, 1, 1, 1,
0.2368631, -0.8681616, 2.856472, 1, 1, 1, 1, 1,
0.2420541, 0.2113808, 1.283825, 1, 1, 1, 1, 1,
0.2439208, -0.2252888, 1.967513, 1, 1, 1, 1, 1,
0.2460057, -0.9578032, 4.955112, 1, 1, 1, 1, 1,
0.2488577, -0.1311211, 2.486206, 1, 1, 1, 1, 1,
0.2492447, -1.378064, 5.029232, 0, 0, 1, 1, 1,
0.2576156, 2.560138, 0.4402324, 1, 0, 0, 1, 1,
0.2578957, -0.5194395, 2.971039, 1, 0, 0, 1, 1,
0.2648236, -0.03215684, 2.631432, 1, 0, 0, 1, 1,
0.2750995, 2.188227, -0.175696, 1, 0, 0, 1, 1,
0.283549, 0.4449428, -0.4470267, 1, 0, 0, 1, 1,
0.2846609, -1.015128, 4.105199, 0, 0, 0, 1, 1,
0.2871257, -0.1093731, 2.620927, 0, 0, 0, 1, 1,
0.2931357, 0.1084228, 1.657674, 0, 0, 0, 1, 1,
0.2965414, 1.016804, -0.6707355, 0, 0, 0, 1, 1,
0.2972774, -0.1120563, 3.094049, 0, 0, 0, 1, 1,
0.3003793, -0.6752508, 3.987066, 0, 0, 0, 1, 1,
0.3006287, 0.169619, 0.9284934, 0, 0, 0, 1, 1,
0.3007738, -0.7324855, 2.184221, 1, 1, 1, 1, 1,
0.3017423, 0.8001246, -0.2789724, 1, 1, 1, 1, 1,
0.3022577, -0.689963, 2.829154, 1, 1, 1, 1, 1,
0.3024075, 0.115591, 0.8081, 1, 1, 1, 1, 1,
0.3089839, -0.3286301, 3.394369, 1, 1, 1, 1, 1,
0.3095115, -0.2248151, 2.583241, 1, 1, 1, 1, 1,
0.3096188, -0.5270885, 3.173203, 1, 1, 1, 1, 1,
0.3115157, -0.09418999, 1.058494, 1, 1, 1, 1, 1,
0.3144588, -0.9233375, 2.202808, 1, 1, 1, 1, 1,
0.3150543, -0.4328475, 2.308582, 1, 1, 1, 1, 1,
0.3172733, -0.01328865, 1.15874, 1, 1, 1, 1, 1,
0.3189389, 1.525246, 0.6222653, 1, 1, 1, 1, 1,
0.3193062, -0.4667661, 3.238965, 1, 1, 1, 1, 1,
0.3223361, -0.5063351, 4.50102, 1, 1, 1, 1, 1,
0.3227434, -0.7974472, 3.851077, 1, 1, 1, 1, 1,
0.3233287, 0.1143781, 0.288905, 0, 0, 1, 1, 1,
0.3259452, -0.2751583, 1.861397, 1, 0, 0, 1, 1,
0.3282472, 1.45076, 0.9967024, 1, 0, 0, 1, 1,
0.3289859, -0.1722614, 0.9938172, 1, 0, 0, 1, 1,
0.3293934, -0.7893792, 2.010449, 1, 0, 0, 1, 1,
0.3351727, 1.647715, 0.6837279, 1, 0, 0, 1, 1,
0.3427136, -1.446402, 3.129318, 0, 0, 0, 1, 1,
0.3458999, 1.398386, 0.1109498, 0, 0, 0, 1, 1,
0.3474095, -0.5229803, 2.409917, 0, 0, 0, 1, 1,
0.3586342, -1.050037, 1.667706, 0, 0, 0, 1, 1,
0.3589059, -0.2461067, 1.084281, 0, 0, 0, 1, 1,
0.3636649, 1.225846, 0.6738898, 0, 0, 0, 1, 1,
0.3685072, 0.376553, 0.7116358, 0, 0, 0, 1, 1,
0.3694858, 0.3088061, 3.100334, 1, 1, 1, 1, 1,
0.3712052, -2.509521, 3.980283, 1, 1, 1, 1, 1,
0.3730067, 0.7158422, -0.5091172, 1, 1, 1, 1, 1,
0.3732705, -0.3051415, 1.018343, 1, 1, 1, 1, 1,
0.3735286, 0.2109846, 0.3557689, 1, 1, 1, 1, 1,
0.373646, -0.5078394, 3.060863, 1, 1, 1, 1, 1,
0.3754521, -0.1392735, 0.3894858, 1, 1, 1, 1, 1,
0.3764462, -0.008061037, 1.220304, 1, 1, 1, 1, 1,
0.3775775, -1.020075, 2.78781, 1, 1, 1, 1, 1,
0.3812701, 1.304199, -0.9879612, 1, 1, 1, 1, 1,
0.3817682, -1.216751, 5.740281, 1, 1, 1, 1, 1,
0.389186, 2.590106, 0.5694043, 1, 1, 1, 1, 1,
0.3939422, -1.077147, 1.025692, 1, 1, 1, 1, 1,
0.3941715, 0.2911083, 0.06140788, 1, 1, 1, 1, 1,
0.3977911, -0.3747633, 1.956804, 1, 1, 1, 1, 1,
0.4036172, -1.130172, 4.480897, 0, 0, 1, 1, 1,
0.4039026, 0.4270737, 1.835776, 1, 0, 0, 1, 1,
0.4050403, 2.154551, -1.154945, 1, 0, 0, 1, 1,
0.405315, -1.394545, 3.312334, 1, 0, 0, 1, 1,
0.4092507, -1.188918, 0.9351791, 1, 0, 0, 1, 1,
0.4093213, 0.7722705, -0.1651189, 1, 0, 0, 1, 1,
0.4104078, 0.9312746, 2.405456, 0, 0, 0, 1, 1,
0.4142263, 0.03272259, 3.304657, 0, 0, 0, 1, 1,
0.4143847, -0.4152727, 1.654695, 0, 0, 0, 1, 1,
0.4164295, -0.6312847, 2.012405, 0, 0, 0, 1, 1,
0.4196662, -0.596925, 1.92761, 0, 0, 0, 1, 1,
0.429941, 0.3353993, 0.4133106, 0, 0, 0, 1, 1,
0.4301738, -0.7624797, 2.972042, 0, 0, 0, 1, 1,
0.4325048, -0.07501445, 2.748313, 1, 1, 1, 1, 1,
0.4340992, 0.3032324, 2.317473, 1, 1, 1, 1, 1,
0.4458151, -0.9692743, 1.495001, 1, 1, 1, 1, 1,
0.4529833, -0.2013776, 1.457555, 1, 1, 1, 1, 1,
0.4571426, 1.126257, 2.201366, 1, 1, 1, 1, 1,
0.4610847, 0.3247418, 0.9621195, 1, 1, 1, 1, 1,
0.4611178, 0.4734372, -0.2119603, 1, 1, 1, 1, 1,
0.4640257, 0.8440781, 2.808526, 1, 1, 1, 1, 1,
0.4664751, 0.249745, 1.043988, 1, 1, 1, 1, 1,
0.4842669, 0.3486874, -0.6097656, 1, 1, 1, 1, 1,
0.4871983, 1.188057, 1.179067, 1, 1, 1, 1, 1,
0.4908485, -0.5210376, 2.309747, 1, 1, 1, 1, 1,
0.4916113, -1.015091, 2.219051, 1, 1, 1, 1, 1,
0.4939303, 0.9189024, 0.2251427, 1, 1, 1, 1, 1,
0.4940767, 0.3211651, 2.524543, 1, 1, 1, 1, 1,
0.4967987, 1.140909, 2.403239, 0, 0, 1, 1, 1,
0.4995239, 0.351203, 1.06848, 1, 0, 0, 1, 1,
0.5050271, -0.3454402, 2.316541, 1, 0, 0, 1, 1,
0.5058306, 0.03256072, 2.018298, 1, 0, 0, 1, 1,
0.5088941, -0.9822787, 1.766538, 1, 0, 0, 1, 1,
0.5102518, -0.5887976, 1.302042, 1, 0, 0, 1, 1,
0.5124773, 0.1932808, 1.688044, 0, 0, 0, 1, 1,
0.5172447, 0.5498779, 0.5786868, 0, 0, 0, 1, 1,
0.5196239, 0.2023428, 1.208971, 0, 0, 0, 1, 1,
0.5208706, 1.233609, 0.8664161, 0, 0, 0, 1, 1,
0.5246428, -1.501171, 0.9110017, 0, 0, 0, 1, 1,
0.531838, -1.078533, 2.586224, 0, 0, 0, 1, 1,
0.5320631, -1.238648, 3.063093, 0, 0, 0, 1, 1,
0.5323631, 0.06765975, 2.963454, 1, 1, 1, 1, 1,
0.5332583, -1.297463, 2.217134, 1, 1, 1, 1, 1,
0.5362324, -0.6460716, 3.000911, 1, 1, 1, 1, 1,
0.5398542, 1.661796, -0.01821167, 1, 1, 1, 1, 1,
0.5422868, -0.3120556, 0.5607327, 1, 1, 1, 1, 1,
0.543984, 2.773106, -0.6024922, 1, 1, 1, 1, 1,
0.5442584, 0.7446098, 1.949306, 1, 1, 1, 1, 1,
0.5471573, 1.035535, 0.3445516, 1, 1, 1, 1, 1,
0.5498236, -0.404037, 3.083388, 1, 1, 1, 1, 1,
0.5500327, -1.543441, 2.921216, 1, 1, 1, 1, 1,
0.5543371, 1.103075, 0.7542046, 1, 1, 1, 1, 1,
0.560284, -0.8732264, 3.076006, 1, 1, 1, 1, 1,
0.5614622, 1.194361, -0.0411574, 1, 1, 1, 1, 1,
0.5623729, -0.2263562, 0.7496946, 1, 1, 1, 1, 1,
0.5642702, -0.2273391, 1.486244, 1, 1, 1, 1, 1,
0.5682882, -0.385119, 1.063534, 0, 0, 1, 1, 1,
0.5687459, -1.169499, 2.140464, 1, 0, 0, 1, 1,
0.5703687, 0.2461245, -0.4064974, 1, 0, 0, 1, 1,
0.5785202, 0.3606145, -0.06905934, 1, 0, 0, 1, 1,
0.5787315, 3.410342, 0.5381975, 1, 0, 0, 1, 1,
0.5798126, 1.398971, -0.4855795, 1, 0, 0, 1, 1,
0.5935994, -1.628944, 3.60423, 0, 0, 0, 1, 1,
0.5939118, -0.02301323, 1.589281, 0, 0, 0, 1, 1,
0.5988507, 0.9768957, 0.1624619, 0, 0, 0, 1, 1,
0.6013858, 0.8393831, 0.7884422, 0, 0, 0, 1, 1,
0.6020268, 1.427353, 0.9873515, 0, 0, 0, 1, 1,
0.6025968, -0.5228608, 2.289068, 0, 0, 0, 1, 1,
0.6028956, 0.7248692, 1.151565, 0, 0, 0, 1, 1,
0.6047146, -1.142992, 2.199617, 1, 1, 1, 1, 1,
0.6061392, 0.4495902, 2.801709, 1, 1, 1, 1, 1,
0.6065814, 0.307353, 0.9520827, 1, 1, 1, 1, 1,
0.6087348, -1.93601, 2.138631, 1, 1, 1, 1, 1,
0.609929, 1.225813, -1.187956, 1, 1, 1, 1, 1,
0.610907, -0.06831679, 0.8073416, 1, 1, 1, 1, 1,
0.6162937, -0.4620026, 2.529616, 1, 1, 1, 1, 1,
0.6260455, 0.06395864, 1.21795, 1, 1, 1, 1, 1,
0.6267805, 0.02370167, 1.568566, 1, 1, 1, 1, 1,
0.6270466, -1.259981, 3.055171, 1, 1, 1, 1, 1,
0.6303634, 0.2954251, 0.6084771, 1, 1, 1, 1, 1,
0.6377416, 0.6465409, 0.7521979, 1, 1, 1, 1, 1,
0.6446543, -1.168511, 0.9428354, 1, 1, 1, 1, 1,
0.6471019, 0.3692829, 2.082416, 1, 1, 1, 1, 1,
0.6500697, -0.5615127, 1.595785, 1, 1, 1, 1, 1,
0.6560473, -0.4263588, 0.1131218, 0, 0, 1, 1, 1,
0.6586574, -0.3170146, 3.809592, 1, 0, 0, 1, 1,
0.6601344, 0.6875835, 0.6336163, 1, 0, 0, 1, 1,
0.6654463, 0.02007598, 3.248868, 1, 0, 0, 1, 1,
0.6655756, -0.08417313, 0.6391036, 1, 0, 0, 1, 1,
0.6662928, 0.03240098, 1.254812, 1, 0, 0, 1, 1,
0.6681677, 0.3072464, 1.226195, 0, 0, 0, 1, 1,
0.6693125, -0.2201687, 1.37002, 0, 0, 0, 1, 1,
0.6708301, 1.291075, -0.2769936, 0, 0, 0, 1, 1,
0.6748123, -2.344121, 3.223433, 0, 0, 0, 1, 1,
0.6758707, -0.9192039, 2.38663, 0, 0, 0, 1, 1,
0.6781421, -0.2976534, 1.663618, 0, 0, 0, 1, 1,
0.6823925, 0.3087792, 0.3013048, 0, 0, 0, 1, 1,
0.6828758, -0.1883821, 1.077631, 1, 1, 1, 1, 1,
0.6916191, -1.161172, 1.709033, 1, 1, 1, 1, 1,
0.6933812, -1.543143, 1.900203, 1, 1, 1, 1, 1,
0.6961766, 0.4846955, 0.359066, 1, 1, 1, 1, 1,
0.6979689, -0.5647051, 1.684558, 1, 1, 1, 1, 1,
0.7025128, -0.315801, 1.329966, 1, 1, 1, 1, 1,
0.7034005, -0.6457068, 1.743948, 1, 1, 1, 1, 1,
0.7037457, -0.2305722, 3.077719, 1, 1, 1, 1, 1,
0.7083554, -2.402759, 3.517932, 1, 1, 1, 1, 1,
0.7087331, -0.2522288, 2.614695, 1, 1, 1, 1, 1,
0.7120162, 0.363056, -0.218795, 1, 1, 1, 1, 1,
0.7135896, -1.405029, 3.832307, 1, 1, 1, 1, 1,
0.7207147, -1.196115, 3.140924, 1, 1, 1, 1, 1,
0.7235382, -1.81579, 4.198046, 1, 1, 1, 1, 1,
0.7235638, -1.404702, 2.760948, 1, 1, 1, 1, 1,
0.7299023, 1.35987, 1.251964, 0, 0, 1, 1, 1,
0.7382057, -0.8027424, 2.899974, 1, 0, 0, 1, 1,
0.7393739, 0.658192, 0.7391039, 1, 0, 0, 1, 1,
0.7404963, 0.5965783, 0.658754, 1, 0, 0, 1, 1,
0.7422429, 2.696013, 0.6465253, 1, 0, 0, 1, 1,
0.7469468, -0.1333005, 0.3561272, 1, 0, 0, 1, 1,
0.7481338, -1.224391, 1.942599, 0, 0, 0, 1, 1,
0.7484267, -2.601746, 3.072667, 0, 0, 0, 1, 1,
0.7489997, 1.705509, -0.6079627, 0, 0, 0, 1, 1,
0.7597961, 0.0351591, 1.73307, 0, 0, 0, 1, 1,
0.7630447, -0.1574706, 3.136608, 0, 0, 0, 1, 1,
0.7671969, 1.727299, 0.1487511, 0, 0, 0, 1, 1,
0.7745129, -1.335015, 1.664875, 0, 0, 0, 1, 1,
0.7750319, -0.7798757, 1.036295, 1, 1, 1, 1, 1,
0.7752291, -0.5205629, 2.106511, 1, 1, 1, 1, 1,
0.7763237, -0.3752676, 1.955124, 1, 1, 1, 1, 1,
0.7781613, -0.5095538, 2.164267, 1, 1, 1, 1, 1,
0.7782133, -0.3645101, 2.35444, 1, 1, 1, 1, 1,
0.7805353, 0.3207733, 3.411312, 1, 1, 1, 1, 1,
0.7810238, 0.8124284, 0.5323029, 1, 1, 1, 1, 1,
0.7824243, 0.1283903, -0.180099, 1, 1, 1, 1, 1,
0.7831491, -0.2272925, 3.226204, 1, 1, 1, 1, 1,
0.7891737, -0.01446233, 1.421282, 1, 1, 1, 1, 1,
0.7915589, 0.8362733, 1.391587, 1, 1, 1, 1, 1,
0.7923431, 0.5370117, 0.4717307, 1, 1, 1, 1, 1,
0.8007144, -0.7734206, 0.8005539, 1, 1, 1, 1, 1,
0.8015686, -1.066235, 1.641979, 1, 1, 1, 1, 1,
0.806092, -0.01467632, 0.340823, 1, 1, 1, 1, 1,
0.8087029, 1.733757, 0.3124776, 0, 0, 1, 1, 1,
0.8134127, 0.3787994, 0.837024, 1, 0, 0, 1, 1,
0.8168259, 0.6263009, -0.3106262, 1, 0, 0, 1, 1,
0.8190151, 1.027423, 0.3813033, 1, 0, 0, 1, 1,
0.836189, 0.1060945, 0.7717369, 1, 0, 0, 1, 1,
0.8370984, 0.1691609, 1.623303, 1, 0, 0, 1, 1,
0.8477081, -0.09028106, 3.481069, 0, 0, 0, 1, 1,
0.8496568, 0.1372982, 2.209424, 0, 0, 0, 1, 1,
0.8515446, 1.434242, 0.9239135, 0, 0, 0, 1, 1,
0.8535436, -1.139683, 2.69421, 0, 0, 0, 1, 1,
0.8639141, -1.531418, 2.494657, 0, 0, 0, 1, 1,
0.8681929, 1.908271, 1.185788, 0, 0, 0, 1, 1,
0.8784997, -2.933844, 3.417104, 0, 0, 0, 1, 1,
0.8831329, 0.07943972, 1.054067, 1, 1, 1, 1, 1,
0.8856592, -2.755024, 2.161771, 1, 1, 1, 1, 1,
0.8905581, 1.565465, -1.858456, 1, 1, 1, 1, 1,
0.8979973, -3.003072, 2.927552, 1, 1, 1, 1, 1,
0.9002624, 0.3801817, 2.980419, 1, 1, 1, 1, 1,
0.906316, -1.049564, 2.939226, 1, 1, 1, 1, 1,
0.9066967, 0.4126197, 0.0945647, 1, 1, 1, 1, 1,
0.9077402, 1.154677, 0.763526, 1, 1, 1, 1, 1,
0.9216934, 0.3464037, 0.8230312, 1, 1, 1, 1, 1,
0.9323276, -1.829436, 3.65874, 1, 1, 1, 1, 1,
0.9332291, 0.993373, 0.6605907, 1, 1, 1, 1, 1,
0.9340776, 1.402176, 0.08792197, 1, 1, 1, 1, 1,
0.9345992, 0.02202711, 1.602368, 1, 1, 1, 1, 1,
0.938395, -0.3267302, 1.847009, 1, 1, 1, 1, 1,
0.9384509, 2.813456, -1.370401, 1, 1, 1, 1, 1,
0.9415173, 1.547894, 0.7980859, 0, 0, 1, 1, 1,
0.9682333, 0.4786305, 2.277746, 1, 0, 0, 1, 1,
0.9686393, -1.379689, 3.12309, 1, 0, 0, 1, 1,
0.9722709, 0.8097343, -0.3209823, 1, 0, 0, 1, 1,
0.9811007, -0.5144125, 2.01861, 1, 0, 0, 1, 1,
0.9849283, 0.01843041, -1.18155, 1, 0, 0, 1, 1,
0.9852552, -0.5990022, 0.2170167, 0, 0, 0, 1, 1,
0.9886549, -0.5157829, 2.311167, 0, 0, 0, 1, 1,
0.9918023, 1.886797, 0.15249, 0, 0, 0, 1, 1,
1.001532, 0.2981533, -0.5802102, 0, 0, 0, 1, 1,
1.012942, 1.167359, 0.418759, 0, 0, 0, 1, 1,
1.016846, 0.1669732, 1.411277, 0, 0, 0, 1, 1,
1.022845, 0.8419475, 1.622762, 0, 0, 0, 1, 1,
1.033843, -0.1407515, 1.863352, 1, 1, 1, 1, 1,
1.037966, -0.8186252, 4.384845, 1, 1, 1, 1, 1,
1.046115, -0.1121107, 1.756274, 1, 1, 1, 1, 1,
1.055467, 1.573523, -0.6574833, 1, 1, 1, 1, 1,
1.056293, -1.259405, 2.335428, 1, 1, 1, 1, 1,
1.05678, 0.3145932, 2.860669, 1, 1, 1, 1, 1,
1.059373, 2.030351, -0.4671192, 1, 1, 1, 1, 1,
1.061178, -1.47142, 2.362614, 1, 1, 1, 1, 1,
1.062337, -0.8657659, 1.487925, 1, 1, 1, 1, 1,
1.066886, -0.3201525, 1.858909, 1, 1, 1, 1, 1,
1.067038, -0.7814342, 2.713043, 1, 1, 1, 1, 1,
1.081202, 0.4762193, 0.3498863, 1, 1, 1, 1, 1,
1.083071, 1.137805, -0.05851872, 1, 1, 1, 1, 1,
1.08709, -0.3260341, 0.9721815, 1, 1, 1, 1, 1,
1.092675, -0.891794, 1.516805, 1, 1, 1, 1, 1,
1.098843, -1.893686, 2.473406, 0, 0, 1, 1, 1,
1.101565, -0.295167, 2.866462, 1, 0, 0, 1, 1,
1.102225, -0.0406011, -0.3005712, 1, 0, 0, 1, 1,
1.103766, -0.2804118, 2.59217, 1, 0, 0, 1, 1,
1.106772, -0.7359887, 1.833218, 1, 0, 0, 1, 1,
1.112466, 0.5506186, 2.611388, 1, 0, 0, 1, 1,
1.116803, 1.222014, 1.586706, 0, 0, 0, 1, 1,
1.118644, -0.7425358, 3.194496, 0, 0, 0, 1, 1,
1.132374, 1.51726, 3.233234, 0, 0, 0, 1, 1,
1.133483, -0.06317708, 2.03506, 0, 0, 0, 1, 1,
1.135612, -0.9510156, 2.336871, 0, 0, 0, 1, 1,
1.13784, 0.4365221, -0.3768619, 0, 0, 0, 1, 1,
1.139136, -0.6040198, 2.198851, 0, 0, 0, 1, 1,
1.154361, 0.4729851, 1.52369, 1, 1, 1, 1, 1,
1.159897, 0.3517201, 0.4833556, 1, 1, 1, 1, 1,
1.163249, -0.9934557, 2.059356, 1, 1, 1, 1, 1,
1.164865, 1.398853, -0.7294542, 1, 1, 1, 1, 1,
1.170261, 0.526157, 2.527866, 1, 1, 1, 1, 1,
1.1738, -0.3722681, 0.8357829, 1, 1, 1, 1, 1,
1.177169, -0.1820018, 2.391779, 1, 1, 1, 1, 1,
1.180211, -0.00864819, 1.645843, 1, 1, 1, 1, 1,
1.189349, 0.1048035, 3.391863, 1, 1, 1, 1, 1,
1.192143, -0.341333, 0.9240921, 1, 1, 1, 1, 1,
1.193134, 0.4834623, 1.494455, 1, 1, 1, 1, 1,
1.202822, 0.6046028, 2.540825, 1, 1, 1, 1, 1,
1.206036, 0.4256271, 0.2211036, 1, 1, 1, 1, 1,
1.216469, -0.7183009, 1.405294, 1, 1, 1, 1, 1,
1.21731, -1.220409, 3.862541, 1, 1, 1, 1, 1,
1.220603, 1.107492, 0.3605176, 0, 0, 1, 1, 1,
1.23059, 0.03337968, 0.2675568, 1, 0, 0, 1, 1,
1.236903, 0.1370364, -0.3806844, 1, 0, 0, 1, 1,
1.244434, -0.4009837, 2.22645, 1, 0, 0, 1, 1,
1.245177, -0.3250131, 1.814116, 1, 0, 0, 1, 1,
1.246281, -0.5727017, 0.9442794, 1, 0, 0, 1, 1,
1.260952, -0.6834213, 2.639963, 0, 0, 0, 1, 1,
1.263919, -0.07348064, 1.186037, 0, 0, 0, 1, 1,
1.28387, 0.8323793, 1.598838, 0, 0, 0, 1, 1,
1.297511, -0.6758358, 3.804936, 0, 0, 0, 1, 1,
1.29956, 0.5340725, 1.248336, 0, 0, 0, 1, 1,
1.309937, 0.5815675, -0.2156817, 0, 0, 0, 1, 1,
1.322788, -1.649259, 3.774755, 0, 0, 0, 1, 1,
1.326423, 1.418863, 0.2882511, 1, 1, 1, 1, 1,
1.327233, 0.9779802, 1.375957, 1, 1, 1, 1, 1,
1.332212, 0.5882226, 0.05508211, 1, 1, 1, 1, 1,
1.355879, -0.1076981, 2.571499, 1, 1, 1, 1, 1,
1.360398, 0.1467216, 1.765973, 1, 1, 1, 1, 1,
1.360498, 1.530827, -1.292085, 1, 1, 1, 1, 1,
1.363483, 0.7557051, 1.085963, 1, 1, 1, 1, 1,
1.368486, 0.3000368, 2.127501, 1, 1, 1, 1, 1,
1.371943, 0.08242684, 1.811231, 1, 1, 1, 1, 1,
1.377179, -0.3817967, 2.025038, 1, 1, 1, 1, 1,
1.378386, -0.1066619, 2.5883, 1, 1, 1, 1, 1,
1.384339, 1.712602, 1.088215, 1, 1, 1, 1, 1,
1.385334, -0.5091766, 1.064493, 1, 1, 1, 1, 1,
1.392728, 1.253822, 1.68549, 1, 1, 1, 1, 1,
1.397181, 0.07049558, 2.830967, 1, 1, 1, 1, 1,
1.399898, 0.2817788, 1.350431, 0, 0, 1, 1, 1,
1.403758, -0.1982685, 1.919699, 1, 0, 0, 1, 1,
1.441091, 0.5041255, 0.7902088, 1, 0, 0, 1, 1,
1.441964, 0.5652891, 2.357503, 1, 0, 0, 1, 1,
1.442396, -0.01101427, -0.5734999, 1, 0, 0, 1, 1,
1.444342, -0.1292584, 3.386702, 1, 0, 0, 1, 1,
1.451303, -0.8902034, 2.656728, 0, 0, 0, 1, 1,
1.462945, -0.8641758, 1.453539, 0, 0, 0, 1, 1,
1.486875, -0.9706563, 2.921731, 0, 0, 0, 1, 1,
1.490513, 1.867691, 1.51908, 0, 0, 0, 1, 1,
1.492876, -0.5772785, 1.154123, 0, 0, 0, 1, 1,
1.505221, 1.075901, -0.5320596, 0, 0, 0, 1, 1,
1.511118, 0.7911965, 0.1812528, 0, 0, 0, 1, 1,
1.513662, -1.434454, 1.866657, 1, 1, 1, 1, 1,
1.522856, -0.2390748, 0.7278893, 1, 1, 1, 1, 1,
1.52595, 0.9729625, 2.781187, 1, 1, 1, 1, 1,
1.544528, -1.443554, 0.7667792, 1, 1, 1, 1, 1,
1.560768, 1.785646, 0.04397098, 1, 1, 1, 1, 1,
1.567279, 0.6260298, 1.907116, 1, 1, 1, 1, 1,
1.569989, 0.6851879, 1.039706, 1, 1, 1, 1, 1,
1.576795, -0.706325, 0.5106324, 1, 1, 1, 1, 1,
1.578043, 0.3265027, 0.7187111, 1, 1, 1, 1, 1,
1.579004, 0.5861063, -0.08611505, 1, 1, 1, 1, 1,
1.579702, -0.2966178, 1.860463, 1, 1, 1, 1, 1,
1.579773, -1.172695, 2.647509, 1, 1, 1, 1, 1,
1.583418, -0.07288495, 2.950647, 1, 1, 1, 1, 1,
1.613479, -0.06201908, 1.865355, 1, 1, 1, 1, 1,
1.613705, -0.2284122, 2.500247, 1, 1, 1, 1, 1,
1.655771, -0.4931415, 2.134137, 0, 0, 1, 1, 1,
1.660514, 0.6482381, 0.4811749, 1, 0, 0, 1, 1,
1.685581, 0.03571469, 1.038717, 1, 0, 0, 1, 1,
1.705884, 0.6275855, 0.6846851, 1, 0, 0, 1, 1,
1.714694, -1.339619, 3.649372, 1, 0, 0, 1, 1,
1.716145, -0.1295077, 1.95006, 1, 0, 0, 1, 1,
1.71644, 0.8547339, 1.923305, 0, 0, 0, 1, 1,
1.758245, -0.4510148, 1.631014, 0, 0, 0, 1, 1,
1.772495, -1.501258, 1.755698, 0, 0, 0, 1, 1,
1.775221, -0.1186337, 0.2427571, 0, 0, 0, 1, 1,
1.784354, 0.1213735, 1.800306, 0, 0, 0, 1, 1,
1.792651, 0.9288476, 1.990129, 0, 0, 0, 1, 1,
1.802305, -0.6035836, 1.966913, 0, 0, 0, 1, 1,
1.828387, -0.5097741, 1.38473, 1, 1, 1, 1, 1,
1.835152, 1.10949, 1.938316, 1, 1, 1, 1, 1,
1.85634, -1.116082, 1.748645, 1, 1, 1, 1, 1,
1.858165, -1.039447, 2.694039, 1, 1, 1, 1, 1,
1.877516, -1.547011, 3.259002, 1, 1, 1, 1, 1,
1.910305, 0.3343381, 0.3593815, 1, 1, 1, 1, 1,
1.91744, -0.7707371, 2.439996, 1, 1, 1, 1, 1,
1.917752, -1.569287, 2.132051, 1, 1, 1, 1, 1,
1.917937, 0.9624591, 1.120416, 1, 1, 1, 1, 1,
1.9541, 0.7546402, 0.4064158, 1, 1, 1, 1, 1,
1.966784, 0.3990336, 0.772124, 1, 1, 1, 1, 1,
1.972812, -0.4405477, 3.422909, 1, 1, 1, 1, 1,
1.977168, -0.8526081, 1.845512, 1, 1, 1, 1, 1,
1.990283, -1.811768, 1.929639, 1, 1, 1, 1, 1,
2.018316, -0.9667091, 1.236489, 1, 1, 1, 1, 1,
2.033582, -2.996175, 3.414526, 0, 0, 1, 1, 1,
2.068555, 1.04405, -0.03874616, 1, 0, 0, 1, 1,
2.072552, -0.3946329, 2.153376, 1, 0, 0, 1, 1,
2.078215, 1.132816, 1.740387, 1, 0, 0, 1, 1,
2.079664, 2.116264, 0.7137863, 1, 0, 0, 1, 1,
2.171937, 0.7939032, 1.001665, 1, 0, 0, 1, 1,
2.186156, 2.943157, -0.1351695, 0, 0, 0, 1, 1,
2.237398, -0.09154829, 2.283825, 0, 0, 0, 1, 1,
2.260868, -0.3845071, 2.592252, 0, 0, 0, 1, 1,
2.304847, 2.592595, 2.302605, 0, 0, 0, 1, 1,
2.33986, 0.7002546, 2.688437, 0, 0, 0, 1, 1,
2.507011, -0.4274892, 0.7489014, 0, 0, 0, 1, 1,
2.557315, -0.02036831, 1.812713, 0, 0, 0, 1, 1,
2.568681, -0.9883218, 2.755824, 1, 1, 1, 1, 1,
2.620019, 2.101466, 2.032652, 1, 1, 1, 1, 1,
2.7013, -0.5820436, 0.4222008, 1, 1, 1, 1, 1,
2.760198, -0.04035837, 2.164683, 1, 1, 1, 1, 1,
2.81282, -1.463247, 0.5193753, 1, 1, 1, 1, 1,
3.29718, -2.332124, 1.176043, 1, 1, 1, 1, 1,
3.431434, 1.205367, 2.117151, 1, 1, 1, 1, 1
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
var radius = 9.70002;
var distance = 34.0709;
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
mvMatrix.translate( -0.3233198, -0.3117335, -0.2390118 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0709);
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
