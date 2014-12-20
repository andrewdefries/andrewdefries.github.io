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
-2.924211, -0.3016793, -0.7916714, 1, 0, 0, 1,
-2.884325, -0.6924543, -0.9417916, 1, 0.007843138, 0, 1,
-2.676496, -0.04884468, 0.471235, 1, 0.01176471, 0, 1,
-2.669387, -0.5753701, -0.9258396, 1, 0.01960784, 0, 1,
-2.659477, 1.337877, -1.288833, 1, 0.02352941, 0, 1,
-2.590958, 1.821763, -0.1220486, 1, 0.03137255, 0, 1,
-2.584334, -0.5688248, -3.260782, 1, 0.03529412, 0, 1,
-2.546542, 1.916159, 0.8185119, 1, 0.04313726, 0, 1,
-2.447958, -0.2647688, -2.450081, 1, 0.04705882, 0, 1,
-2.383989, -2.092877, -1.419592, 1, 0.05490196, 0, 1,
-2.350458, 1.784196, -0.4277774, 1, 0.05882353, 0, 1,
-2.331228, -0.1959695, -0.9738196, 1, 0.06666667, 0, 1,
-2.323743, -0.6292031, -2.413055, 1, 0.07058824, 0, 1,
-2.264576, -0.625908, -3.790503, 1, 0.07843138, 0, 1,
-2.248708, 0.9597006, 0.0482886, 1, 0.08235294, 0, 1,
-2.160465, -0.8995262, -1.05987, 1, 0.09019608, 0, 1,
-2.148527, -1.082407, -2.68146, 1, 0.09411765, 0, 1,
-2.147556, -0.1207907, -0.2212906, 1, 0.1019608, 0, 1,
-2.090384, 0.1214312, -2.974332, 1, 0.1098039, 0, 1,
-2.06978, -1.867873, -2.945781, 1, 0.1137255, 0, 1,
-2.045948, 0.5986393, -1.698564, 1, 0.1215686, 0, 1,
-2.044018, -0.9803488, -3.479078, 1, 0.1254902, 0, 1,
-2.010174, -0.5210778, -2.537692, 1, 0.1333333, 0, 1,
-1.995813, 0.1354487, -0.8058638, 1, 0.1372549, 0, 1,
-1.990302, 1.745719, -0.6051517, 1, 0.145098, 0, 1,
-1.985096, -0.2383232, -2.705071, 1, 0.1490196, 0, 1,
-1.968499, 0.2329257, -2.229035, 1, 0.1568628, 0, 1,
-1.917034, 1.930596, -2.616003, 1, 0.1607843, 0, 1,
-1.904304, -1.021944, -2.003086, 1, 0.1686275, 0, 1,
-1.899922, 1.20312, 0.652649, 1, 0.172549, 0, 1,
-1.898822, -0.2420376, 0.224948, 1, 0.1803922, 0, 1,
-1.887689, -0.2164558, -1.783189, 1, 0.1843137, 0, 1,
-1.873835, -0.4115585, -0.7019442, 1, 0.1921569, 0, 1,
-1.867979, -1.158729, -1.405412, 1, 0.1960784, 0, 1,
-1.866486, 1.004327, -1.828736, 1, 0.2039216, 0, 1,
-1.848453, -1.141703, -1.733341, 1, 0.2117647, 0, 1,
-1.830457, -1.34061, -2.107675, 1, 0.2156863, 0, 1,
-1.815404, 0.3786278, -1.037843, 1, 0.2235294, 0, 1,
-1.814062, -0.6534466, -2.062179, 1, 0.227451, 0, 1,
-1.811769, -1.72865, -2.733459, 1, 0.2352941, 0, 1,
-1.810153, -0.6130809, -0.04283738, 1, 0.2392157, 0, 1,
-1.803068, -0.1862365, -1.282807, 1, 0.2470588, 0, 1,
-1.772106, 1.153315, -1.865287, 1, 0.2509804, 0, 1,
-1.765862, 0.774821, -1.013834, 1, 0.2588235, 0, 1,
-1.757538, 1.305796, -1.484136, 1, 0.2627451, 0, 1,
-1.741943, 1.870636, -2.366708, 1, 0.2705882, 0, 1,
-1.741285, -0.01940239, 1.252963, 1, 0.2745098, 0, 1,
-1.735373, -0.5499112, -3.188501, 1, 0.282353, 0, 1,
-1.734454, -1.83751, -1.217307, 1, 0.2862745, 0, 1,
-1.732423, -1.630705, -2.199635, 1, 0.2941177, 0, 1,
-1.72327, -1.347571, -2.497576, 1, 0.3019608, 0, 1,
-1.707458, -0.7391686, -1.450247, 1, 0.3058824, 0, 1,
-1.701937, -1.378841, -0.8652627, 1, 0.3137255, 0, 1,
-1.672602, -0.3741923, -1.283791, 1, 0.3176471, 0, 1,
-1.670728, -1.187971, -3.458934, 1, 0.3254902, 0, 1,
-1.661174, -0.2855967, -0.6987582, 1, 0.3294118, 0, 1,
-1.660884, -0.7311046, -3.44818, 1, 0.3372549, 0, 1,
-1.617099, -0.7490052, -3.218992, 1, 0.3411765, 0, 1,
-1.602667, -0.5273342, -4.292436, 1, 0.3490196, 0, 1,
-1.583918, 0.03175048, -2.948501, 1, 0.3529412, 0, 1,
-1.572557, 0.7163791, -0.5406989, 1, 0.3607843, 0, 1,
-1.568766, -0.1647586, -2.455043, 1, 0.3647059, 0, 1,
-1.547368, 0.5898386, -0.4659795, 1, 0.372549, 0, 1,
-1.543526, -0.1933266, -1.680195, 1, 0.3764706, 0, 1,
-1.530056, -1.498847, -2.328895, 1, 0.3843137, 0, 1,
-1.5195, -1.010903, -2.745194, 1, 0.3882353, 0, 1,
-1.510371, -0.7886496, -3.87957, 1, 0.3960784, 0, 1,
-1.506928, 0.5398068, -2.520247, 1, 0.4039216, 0, 1,
-1.500995, -1.372114, 0.02707334, 1, 0.4078431, 0, 1,
-1.500313, 0.5048586, -2.396304, 1, 0.4156863, 0, 1,
-1.489282, 1.194047, -1.066501, 1, 0.4196078, 0, 1,
-1.486144, 1.138172, -0.9791527, 1, 0.427451, 0, 1,
-1.465296, 0.0844019, -1.392651, 1, 0.4313726, 0, 1,
-1.449231, 1.712233, 0.3042446, 1, 0.4392157, 0, 1,
-1.448524, 1.15888, -0.6534685, 1, 0.4431373, 0, 1,
-1.447058, -0.5652347, -3.129705, 1, 0.4509804, 0, 1,
-1.444922, 0.5564197, -2.872335, 1, 0.454902, 0, 1,
-1.435511, -0.8511453, -0.344837, 1, 0.4627451, 0, 1,
-1.417238, -1.61498, -1.82948, 1, 0.4666667, 0, 1,
-1.415546, -0.1719453, -1.298252, 1, 0.4745098, 0, 1,
-1.414301, -0.6989211, -3.586601, 1, 0.4784314, 0, 1,
-1.413963, 0.341135, -1.191429, 1, 0.4862745, 0, 1,
-1.409662, -0.8560539, -1.312221, 1, 0.4901961, 0, 1,
-1.386167, 1.438604, 0.5205715, 1, 0.4980392, 0, 1,
-1.372914, -0.05979643, -2.018863, 1, 0.5058824, 0, 1,
-1.36886, -0.3188299, -1.274697, 1, 0.509804, 0, 1,
-1.361535, 0.2512196, -0.1089633, 1, 0.5176471, 0, 1,
-1.349638, -0.7518488, -2.812256, 1, 0.5215687, 0, 1,
-1.344182, 1.546876, -1.193575, 1, 0.5294118, 0, 1,
-1.340332, 0.9256313, -0.7433138, 1, 0.5333334, 0, 1,
-1.33439, 0.3919364, 0.9861743, 1, 0.5411765, 0, 1,
-1.326749, -0.6659684, -1.718112, 1, 0.5450981, 0, 1,
-1.323532, 0.7747701, 0.089873, 1, 0.5529412, 0, 1,
-1.318716, -1.093021, -0.6492392, 1, 0.5568628, 0, 1,
-1.31694, -0.07814945, -1.536345, 1, 0.5647059, 0, 1,
-1.313605, -0.8540389, -1.976836, 1, 0.5686275, 0, 1,
-1.307608, -0.1255397, -2.699679, 1, 0.5764706, 0, 1,
-1.306013, -0.184037, -1.05703, 1, 0.5803922, 0, 1,
-1.286811, -1.495984, -1.403234, 1, 0.5882353, 0, 1,
-1.282656, -0.8414775, -2.517789, 1, 0.5921569, 0, 1,
-1.278336, 0.00175024, -0.1465917, 1, 0.6, 0, 1,
-1.278256, 1.105109, 0.01407784, 1, 0.6078432, 0, 1,
-1.278018, -2.144154, -3.454817, 1, 0.6117647, 0, 1,
-1.271256, -1.182018, -2.762538, 1, 0.6196079, 0, 1,
-1.259225, -0.3211996, -2.345837, 1, 0.6235294, 0, 1,
-1.25617, 0.6200036, -0.09243832, 1, 0.6313726, 0, 1,
-1.253527, -0.8139167, -2.285996, 1, 0.6352941, 0, 1,
-1.253182, 0.2685302, -0.7331139, 1, 0.6431373, 0, 1,
-1.240681, 0.2731646, -1.100251, 1, 0.6470588, 0, 1,
-1.238019, 0.7563562, -0.8385139, 1, 0.654902, 0, 1,
-1.23717, 0.7290156, -1.43184, 1, 0.6588235, 0, 1,
-1.222071, -1.226451, -1.098048, 1, 0.6666667, 0, 1,
-1.212585, -0.9557092, -2.082144, 1, 0.6705883, 0, 1,
-1.208435, -0.1646902, -1.87983, 1, 0.6784314, 0, 1,
-1.200466, 1.69544, -2.375596, 1, 0.682353, 0, 1,
-1.196602, -1.630493, -1.374739, 1, 0.6901961, 0, 1,
-1.195003, -0.3347647, -0.2063468, 1, 0.6941177, 0, 1,
-1.191161, -1.186222, -2.486068, 1, 0.7019608, 0, 1,
-1.179549, 0.5169521, -1.777006, 1, 0.7098039, 0, 1,
-1.17217, 0.3250543, 0.3056688, 1, 0.7137255, 0, 1,
-1.169897, -0.9339533, -3.360001, 1, 0.7215686, 0, 1,
-1.159302, 1.263814, -0.597628, 1, 0.7254902, 0, 1,
-1.155985, -0.08470577, -1.860102, 1, 0.7333333, 0, 1,
-1.152162, -0.7188971, -2.858564, 1, 0.7372549, 0, 1,
-1.151029, 0.740822, -2.408719, 1, 0.7450981, 0, 1,
-1.145354, -1.333063, -1.543657, 1, 0.7490196, 0, 1,
-1.127662, -1.448818, -2.426831, 1, 0.7568628, 0, 1,
-1.125478, -0.8507236, -4.269044, 1, 0.7607843, 0, 1,
-1.125223, -1.046727, -2.608215, 1, 0.7686275, 0, 1,
-1.113385, -0.5489893, -0.83232, 1, 0.772549, 0, 1,
-1.110879, -0.2347389, -1.969935, 1, 0.7803922, 0, 1,
-1.108309, -0.3069468, -1.792862, 1, 0.7843137, 0, 1,
-1.108115, -1.819794, -3.067951, 1, 0.7921569, 0, 1,
-1.106181, -0.3384859, -0.8243623, 1, 0.7960784, 0, 1,
-1.09717, -0.3712785, -2.368866, 1, 0.8039216, 0, 1,
-1.093706, -2.223897, -1.468033, 1, 0.8117647, 0, 1,
-1.089468, 1.201126, -1.412768, 1, 0.8156863, 0, 1,
-1.086872, -0.5997649, -2.279915, 1, 0.8235294, 0, 1,
-1.081306, -1.876897, -1.932814, 1, 0.827451, 0, 1,
-1.068648, 1.817858, 1.696228, 1, 0.8352941, 0, 1,
-1.065792, -0.7600596, -2.217139, 1, 0.8392157, 0, 1,
-1.048557, -0.2938425, -0.8272472, 1, 0.8470588, 0, 1,
-1.045785, 0.8637041, -1.651301, 1, 0.8509804, 0, 1,
-1.045166, 0.6491382, -1.427673, 1, 0.8588235, 0, 1,
-1.042175, 0.08504473, -1.273169, 1, 0.8627451, 0, 1,
-1.038834, 1.326577, -0.1970539, 1, 0.8705882, 0, 1,
-1.036577, 0.6728401, -1.034264, 1, 0.8745098, 0, 1,
-1.033261, -2.296845, -1.025247, 1, 0.8823529, 0, 1,
-1.030431, 1.445924, -0.5968596, 1, 0.8862745, 0, 1,
-1.029267, -0.60047, -2.301841, 1, 0.8941177, 0, 1,
-1.02125, 0.2787288, -1.983381, 1, 0.8980392, 0, 1,
-1.005775, 1.119823, -0.7936018, 1, 0.9058824, 0, 1,
-1.001166, -0.8593827, -2.918064, 1, 0.9137255, 0, 1,
-1.000235, -0.8917079, -1.673514, 1, 0.9176471, 0, 1,
-0.9949554, 0.6568544, -2.398521, 1, 0.9254902, 0, 1,
-0.9900249, 1.917149, -0.6578103, 1, 0.9294118, 0, 1,
-0.9879262, 0.395156, -1.057853, 1, 0.9372549, 0, 1,
-0.9866983, 2.498059, 0.9954414, 1, 0.9411765, 0, 1,
-0.9796534, 0.5088947, -2.505402, 1, 0.9490196, 0, 1,
-0.9727059, -0.4542723, -1.938438, 1, 0.9529412, 0, 1,
-0.9722744, -1.41198, -3.268582, 1, 0.9607843, 0, 1,
-0.9702549, 0.03442258, -2.097323, 1, 0.9647059, 0, 1,
-0.9681988, 0.9894115, 0.6677842, 1, 0.972549, 0, 1,
-0.9674997, 0.7010258, -0.8851268, 1, 0.9764706, 0, 1,
-0.9674956, -1.536882, -3.351265, 1, 0.9843137, 0, 1,
-0.9628655, -1.278949, -2.366463, 1, 0.9882353, 0, 1,
-0.9574312, 1.140469, -0.09172776, 1, 0.9960784, 0, 1,
-0.9512028, -0.2113974, -2.329103, 0.9960784, 1, 0, 1,
-0.9507293, 0.1576666, -0.6630384, 0.9921569, 1, 0, 1,
-0.9500451, 0.1372091, -1.043809, 0.9843137, 1, 0, 1,
-0.943956, -0.3419609, -1.112051, 0.9803922, 1, 0, 1,
-0.9400809, -1.874818, -2.876772, 0.972549, 1, 0, 1,
-0.9397894, 0.4500313, -1.334863, 0.9686275, 1, 0, 1,
-0.9341546, -1.18092, -2.358205, 0.9607843, 1, 0, 1,
-0.9328838, -0.8648964, -0.7573388, 0.9568627, 1, 0, 1,
-0.9294822, -0.2169176, -3.428224, 0.9490196, 1, 0, 1,
-0.9284554, 1.758187, -1.354048, 0.945098, 1, 0, 1,
-0.9243364, -0.6016731, -1.43617, 0.9372549, 1, 0, 1,
-0.923254, 0.07323921, -1.017382, 0.9333333, 1, 0, 1,
-0.9226477, -0.6395634, -1.597492, 0.9254902, 1, 0, 1,
-0.9189926, -0.9226741, -1.101973, 0.9215686, 1, 0, 1,
-0.9154469, -0.08872018, -1.189083, 0.9137255, 1, 0, 1,
-0.910509, -1.560332, -2.133327, 0.9098039, 1, 0, 1,
-0.9103303, -0.4271436, -1.419348, 0.9019608, 1, 0, 1,
-0.9059228, -0.05442331, -1.161777, 0.8941177, 1, 0, 1,
-0.905669, -1.047189, -2.616741, 0.8901961, 1, 0, 1,
-0.8992777, -1.892648, -2.256115, 0.8823529, 1, 0, 1,
-0.8942818, -0.7438377, -1.209953, 0.8784314, 1, 0, 1,
-0.8910587, 3.283022, -0.698512, 0.8705882, 1, 0, 1,
-0.8893014, -0.4572492, -2.866933, 0.8666667, 1, 0, 1,
-0.8807744, 1.931485, -1.32435, 0.8588235, 1, 0, 1,
-0.8736224, -0.0531306, -0.8743972, 0.854902, 1, 0, 1,
-0.8682489, -0.9657808, -1.172773, 0.8470588, 1, 0, 1,
-0.8574881, -1.192273, -2.177824, 0.8431373, 1, 0, 1,
-0.8423936, 1.151374, -0.2758567, 0.8352941, 1, 0, 1,
-0.8418376, -1.291515, -3.347716, 0.8313726, 1, 0, 1,
-0.8403422, -0.7589856, -1.477674, 0.8235294, 1, 0, 1,
-0.8374688, -0.3066939, -3.657563, 0.8196079, 1, 0, 1,
-0.8372676, -0.1509862, -1.674359, 0.8117647, 1, 0, 1,
-0.8314378, 0.6506433, -2.323332, 0.8078431, 1, 0, 1,
-0.8290146, -0.5760814, -3.335463, 0.8, 1, 0, 1,
-0.8287717, 0.7917663, 0.3232533, 0.7921569, 1, 0, 1,
-0.8284468, -1.042188, -3.090822, 0.7882353, 1, 0, 1,
-0.8281297, -1.472619, -3.040142, 0.7803922, 1, 0, 1,
-0.8235068, -0.8400075, -3.162918, 0.7764706, 1, 0, 1,
-0.8184137, 1.379044, -0.8801421, 0.7686275, 1, 0, 1,
-0.8179615, -0.1074716, -1.22923, 0.7647059, 1, 0, 1,
-0.8170803, -0.628482, -1.877909, 0.7568628, 1, 0, 1,
-0.8125789, -0.3675617, -4.203396, 0.7529412, 1, 0, 1,
-0.8118802, 0.5250929, -1.015828, 0.7450981, 1, 0, 1,
-0.8114592, -1.006399, -2.441754, 0.7411765, 1, 0, 1,
-0.8085513, -0.091444, -3.10102, 0.7333333, 1, 0, 1,
-0.8075895, -1.027834, -1.104695, 0.7294118, 1, 0, 1,
-0.8048043, -0.2966315, -2.147477, 0.7215686, 1, 0, 1,
-0.8017363, -0.4082709, -1.893416, 0.7176471, 1, 0, 1,
-0.8015109, 1.56671, 0.4364013, 0.7098039, 1, 0, 1,
-0.8007516, -0.5717369, -2.258249, 0.7058824, 1, 0, 1,
-0.793761, -1.258333, -3.726001, 0.6980392, 1, 0, 1,
-0.785911, 0.7923424, -0.7403456, 0.6901961, 1, 0, 1,
-0.7822366, 1.30977, 0.5791441, 0.6862745, 1, 0, 1,
-0.7813996, -0.1894257, -0.8665242, 0.6784314, 1, 0, 1,
-0.7809911, 0.4059354, -1.686965, 0.6745098, 1, 0, 1,
-0.7696083, -0.7184753, -1.553062, 0.6666667, 1, 0, 1,
-0.7656681, 0.8574541, -1.559368, 0.6627451, 1, 0, 1,
-0.763096, 0.5293555, -0.1671437, 0.654902, 1, 0, 1,
-0.7535208, 0.3870923, -1.355142, 0.6509804, 1, 0, 1,
-0.7532411, 0.7313861, -1.852996, 0.6431373, 1, 0, 1,
-0.7430012, 0.109624, 0.3048913, 0.6392157, 1, 0, 1,
-0.7390433, 0.280426, -1.637502, 0.6313726, 1, 0, 1,
-0.7381692, 0.2417019, -2.395483, 0.627451, 1, 0, 1,
-0.7344079, -0.828845, -1.348892, 0.6196079, 1, 0, 1,
-0.7319852, 1.303184, -1.71481, 0.6156863, 1, 0, 1,
-0.7135054, -0.1250552, -1.537112, 0.6078432, 1, 0, 1,
-0.7106251, 0.07484606, -1.583969, 0.6039216, 1, 0, 1,
-0.7095498, 0.3486036, -1.646366, 0.5960785, 1, 0, 1,
-0.7086283, 1.168831, -1.292737, 0.5882353, 1, 0, 1,
-0.7045147, -0.01567305, -1.815829, 0.5843138, 1, 0, 1,
-0.6989145, 0.07958364, -2.195251, 0.5764706, 1, 0, 1,
-0.6950763, 1.846539, 1.273424, 0.572549, 1, 0, 1,
-0.694425, 0.9857906, -1.511909, 0.5647059, 1, 0, 1,
-0.6928165, -1.137056, -3.780442, 0.5607843, 1, 0, 1,
-0.6906817, 0.1674021, -1.188889, 0.5529412, 1, 0, 1,
-0.6867051, -1.213724, -2.383376, 0.5490196, 1, 0, 1,
-0.685104, 0.09030026, -0.5418848, 0.5411765, 1, 0, 1,
-0.6773933, 0.429431, -1.015084, 0.5372549, 1, 0, 1,
-0.6734771, -0.6686166, -4.787798, 0.5294118, 1, 0, 1,
-0.6731209, 0.2376991, -0.5505842, 0.5254902, 1, 0, 1,
-0.6730649, -0.5022207, -1.93682, 0.5176471, 1, 0, 1,
-0.6725815, -1.810551, -1.802714, 0.5137255, 1, 0, 1,
-0.6713769, 1.529083, -0.9278055, 0.5058824, 1, 0, 1,
-0.6705893, -0.7702896, -1.974662, 0.5019608, 1, 0, 1,
-0.6691192, -0.1571613, -2.736567, 0.4941176, 1, 0, 1,
-0.6667323, 0.6219198, -2.274547, 0.4862745, 1, 0, 1,
-0.6643972, -0.4907658, -0.8136767, 0.4823529, 1, 0, 1,
-0.663831, 0.2959929, -0.5486186, 0.4745098, 1, 0, 1,
-0.6624974, 0.3214798, 0.3660966, 0.4705882, 1, 0, 1,
-0.661032, 1.015289, 0.1078925, 0.4627451, 1, 0, 1,
-0.660404, -0.4387704, -0.70332, 0.4588235, 1, 0, 1,
-0.6575013, 1.206932, -0.1368581, 0.4509804, 1, 0, 1,
-0.6547253, 1.969673, -1.604857, 0.4470588, 1, 0, 1,
-0.6543651, -0.8010684, -2.653194, 0.4392157, 1, 0, 1,
-0.654097, -2.18901, -1.938471, 0.4352941, 1, 0, 1,
-0.6498005, 1.86954, -0.329072, 0.427451, 1, 0, 1,
-0.6460115, 1.255785, -0.04702683, 0.4235294, 1, 0, 1,
-0.6392853, -0.2776727, -2.14997, 0.4156863, 1, 0, 1,
-0.6379606, 1.947458, 0.4550833, 0.4117647, 1, 0, 1,
-0.6365871, 0.1338473, -1.380042, 0.4039216, 1, 0, 1,
-0.6345198, 0.1328954, -3.277644, 0.3960784, 1, 0, 1,
-0.6332771, 1.364793, 1.424744, 0.3921569, 1, 0, 1,
-0.6306008, -0.2088277, -2.08626, 0.3843137, 1, 0, 1,
-0.6271554, 0.7251809, -0.3767153, 0.3803922, 1, 0, 1,
-0.6211666, 2.572085, -1.863752, 0.372549, 1, 0, 1,
-0.6208119, -0.08049686, -3.445349, 0.3686275, 1, 0, 1,
-0.6201529, -0.9162, -4.382154, 0.3607843, 1, 0, 1,
-0.6155225, 0.3448731, -2.483957, 0.3568628, 1, 0, 1,
-0.6143414, -0.3410105, -2.007255, 0.3490196, 1, 0, 1,
-0.6080981, 0.1795533, -1.063368, 0.345098, 1, 0, 1,
-0.6052056, -0.5622432, -1.111389, 0.3372549, 1, 0, 1,
-0.592464, 0.1720372, -0.8102399, 0.3333333, 1, 0, 1,
-0.5918221, -1.229647, -2.436687, 0.3254902, 1, 0, 1,
-0.5905737, 0.4696996, -0.1099202, 0.3215686, 1, 0, 1,
-0.5898885, 0.6939167, 0.01331463, 0.3137255, 1, 0, 1,
-0.585619, -1.012933, -2.946562, 0.3098039, 1, 0, 1,
-0.5835903, -0.4292225, -2.414673, 0.3019608, 1, 0, 1,
-0.5814627, 0.4633679, -2.586384, 0.2941177, 1, 0, 1,
-0.5767204, 1.03705, -1.371225, 0.2901961, 1, 0, 1,
-0.5751306, 0.4041756, -1.588562, 0.282353, 1, 0, 1,
-0.5677073, 0.3028975, -1.440119, 0.2784314, 1, 0, 1,
-0.5657815, -0.4966689, -2.497195, 0.2705882, 1, 0, 1,
-0.5618897, -0.5522607, -3.677562, 0.2666667, 1, 0, 1,
-0.552641, -1.323558, -2.44799, 0.2588235, 1, 0, 1,
-0.5490987, 0.2174945, -3.354222, 0.254902, 1, 0, 1,
-0.5463528, 1.071697, 1.1682, 0.2470588, 1, 0, 1,
-0.5450983, 1.049834, -0.8212448, 0.2431373, 1, 0, 1,
-0.5388041, -2.376375, -2.496169, 0.2352941, 1, 0, 1,
-0.5359443, 0.6037958, -1.404901, 0.2313726, 1, 0, 1,
-0.5352113, 1.10231, -0.5725409, 0.2235294, 1, 0, 1,
-0.5346654, -1.443258, -3.550499, 0.2196078, 1, 0, 1,
-0.533383, 0.3691205, 0.06717832, 0.2117647, 1, 0, 1,
-0.5308853, -0.5768746, -2.482292, 0.2078431, 1, 0, 1,
-0.5258634, -0.1734408, -2.427687, 0.2, 1, 0, 1,
-0.5242392, -1.440214, -2.441137, 0.1921569, 1, 0, 1,
-0.5200903, -0.9445215, -1.763079, 0.1882353, 1, 0, 1,
-0.5114534, -0.499375, -2.317467, 0.1803922, 1, 0, 1,
-0.4990762, -1.321714, -4.142344, 0.1764706, 1, 0, 1,
-0.4990044, -0.8507021, -3.335719, 0.1686275, 1, 0, 1,
-0.4959935, 0.3922067, -0.3587738, 0.1647059, 1, 0, 1,
-0.4875637, -0.3978437, -2.251839, 0.1568628, 1, 0, 1,
-0.4870148, -1.222486, -2.866198, 0.1529412, 1, 0, 1,
-0.4828105, -2.231938, -2.793526, 0.145098, 1, 0, 1,
-0.4825843, -1.710814, -2.345055, 0.1411765, 1, 0, 1,
-0.4804963, -1.279895, -2.313232, 0.1333333, 1, 0, 1,
-0.4778246, 0.2385858, -4.004372, 0.1294118, 1, 0, 1,
-0.4774716, 0.5807866, -1.694266, 0.1215686, 1, 0, 1,
-0.4735499, -0.4559136, -1.529754, 0.1176471, 1, 0, 1,
-0.4735498, -1.794006, -2.723704, 0.1098039, 1, 0, 1,
-0.4695965, 0.9151244, 0.6015414, 0.1058824, 1, 0, 1,
-0.4674691, 0.3226579, -1.471035, 0.09803922, 1, 0, 1,
-0.4666376, 0.7360867, -0.1183207, 0.09019608, 1, 0, 1,
-0.4647321, 1.982925, -0.2516019, 0.08627451, 1, 0, 1,
-0.4630074, 2.812648, 1.00613, 0.07843138, 1, 0, 1,
-0.4622368, 0.7089838, -2.280442, 0.07450981, 1, 0, 1,
-0.4621054, -0.5204518, -3.385593, 0.06666667, 1, 0, 1,
-0.4620871, -0.1820755, -1.233552, 0.0627451, 1, 0, 1,
-0.4593323, -0.3271413, -0.8017749, 0.05490196, 1, 0, 1,
-0.459141, 0.6613455, -0.8581713, 0.05098039, 1, 0, 1,
-0.4495167, 0.8441236, -1.163467, 0.04313726, 1, 0, 1,
-0.447074, -1.266818, -1.271502, 0.03921569, 1, 0, 1,
-0.4440158, -0.6259902, -2.523008, 0.03137255, 1, 0, 1,
-0.4410599, 1.891044, 1.08629, 0.02745098, 1, 0, 1,
-0.4404705, 0.7243485, -1.152525, 0.01960784, 1, 0, 1,
-0.43799, 1.682262, -0.9152815, 0.01568628, 1, 0, 1,
-0.4372768, -0.9395087, -2.779532, 0.007843138, 1, 0, 1,
-0.4371336, 0.5562396, -2.004353, 0.003921569, 1, 0, 1,
-0.4359044, 0.7513925, -0.6003696, 0, 1, 0.003921569, 1,
-0.4356126, -0.4751871, -2.873168, 0, 1, 0.01176471, 1,
-0.4310861, 0.952965, 0.3597924, 0, 1, 0.01568628, 1,
-0.426003, 0.4963414, -0.7732267, 0, 1, 0.02352941, 1,
-0.4252186, 1.222852, 2.294543, 0, 1, 0.02745098, 1,
-0.4247561, 1.322816, -0.3422326, 0, 1, 0.03529412, 1,
-0.4243069, -0.1052229, -0.8744964, 0, 1, 0.03921569, 1,
-0.4233157, -1.659225, -3.463867, 0, 1, 0.04705882, 1,
-0.4214212, 0.8180349, -0.4905895, 0, 1, 0.05098039, 1,
-0.4155512, 1.344936, -0.9693426, 0, 1, 0.05882353, 1,
-0.4153323, -0.2731932, -1.297068, 0, 1, 0.0627451, 1,
-0.4143393, -1.805751, -4.041829, 0, 1, 0.07058824, 1,
-0.4125458, -0.5493433, -2.505742, 0, 1, 0.07450981, 1,
-0.4095716, 0.494279, -0.05608696, 0, 1, 0.08235294, 1,
-0.4073889, -0.1109055, -2.876775, 0, 1, 0.08627451, 1,
-0.4066402, -1.289254, -1.500961, 0, 1, 0.09411765, 1,
-0.4047159, -0.01686037, -1.815171, 0, 1, 0.1019608, 1,
-0.3997207, 1.085535, 0.08162709, 0, 1, 0.1058824, 1,
-0.3921466, -0.7860527, -2.356605, 0, 1, 0.1137255, 1,
-0.390134, -1.351514, -3.403491, 0, 1, 0.1176471, 1,
-0.3867545, -0.3508936, -2.569521, 0, 1, 0.1254902, 1,
-0.3863693, -0.2215433, -0.3219484, 0, 1, 0.1294118, 1,
-0.3861044, 0.00478322, -0.7928953, 0, 1, 0.1372549, 1,
-0.3792189, -0.388384, -1.000309, 0, 1, 0.1411765, 1,
-0.3748754, 0.6641563, -1.25169, 0, 1, 0.1490196, 1,
-0.3528989, 0.5041935, -1.140831, 0, 1, 0.1529412, 1,
-0.3525764, -0.8777403, -2.805614, 0, 1, 0.1607843, 1,
-0.3499506, 0.1129434, 0.6022283, 0, 1, 0.1647059, 1,
-0.3499306, 1.664338, 0.08780205, 0, 1, 0.172549, 1,
-0.3495984, -0.206236, -1.923006, 0, 1, 0.1764706, 1,
-0.3459924, -0.6015583, -2.037153, 0, 1, 0.1843137, 1,
-0.3344081, 0.2707755, 0.9184904, 0, 1, 0.1882353, 1,
-0.3248026, 0.2808447, -1.019387, 0, 1, 0.1960784, 1,
-0.3216677, -0.6773861, -2.942775, 0, 1, 0.2039216, 1,
-0.3181367, -1.310331, -2.856848, 0, 1, 0.2078431, 1,
-0.3138325, -0.9024745, -3.113171, 0, 1, 0.2156863, 1,
-0.3015668, -0.6564647, -4.142445, 0, 1, 0.2196078, 1,
-0.3011913, -0.04173189, -1.797913, 0, 1, 0.227451, 1,
-0.3000174, 0.4013991, -0.6326638, 0, 1, 0.2313726, 1,
-0.2964186, -1.005276, -2.28516, 0, 1, 0.2392157, 1,
-0.2953791, 0.6799036, -0.2045099, 0, 1, 0.2431373, 1,
-0.2931281, 0.3528549, 0.8837317, 0, 1, 0.2509804, 1,
-0.2929784, -0.6163309, -0.349795, 0, 1, 0.254902, 1,
-0.2910308, -1.134215, -3.115541, 0, 1, 0.2627451, 1,
-0.2892073, -0.5562165, -1.985067, 0, 1, 0.2666667, 1,
-0.2829738, 1.188156, -2.68889, 0, 1, 0.2745098, 1,
-0.2817045, 1.098246, 0.2015851, 0, 1, 0.2784314, 1,
-0.2812264, 1.136787, -0.1981303, 0, 1, 0.2862745, 1,
-0.2761579, 0.3069214, -0.2136669, 0, 1, 0.2901961, 1,
-0.2738753, -1.143478, -2.073982, 0, 1, 0.2980392, 1,
-0.2647477, 0.3834839, -0.6111308, 0, 1, 0.3058824, 1,
-0.2635868, -0.6091741, -2.484282, 0, 1, 0.3098039, 1,
-0.2594973, -0.007340751, -2.403433, 0, 1, 0.3176471, 1,
-0.2560462, 1.144619, 0.7814783, 0, 1, 0.3215686, 1,
-0.255422, -1.408515, -2.461509, 0, 1, 0.3294118, 1,
-0.2540695, 1.54101, -1.563196, 0, 1, 0.3333333, 1,
-0.2540151, 0.1420386, -0.830249, 0, 1, 0.3411765, 1,
-0.2418493, -0.7360406, -0.6942919, 0, 1, 0.345098, 1,
-0.2376388, -0.6257371, -2.601817, 0, 1, 0.3529412, 1,
-0.2370495, 0.6772413, -1.509732, 0, 1, 0.3568628, 1,
-0.2342963, -1.899315, -2.301343, 0, 1, 0.3647059, 1,
-0.2314335, -1.697352, -3.125221, 0, 1, 0.3686275, 1,
-0.2309355, -0.9751346, -2.803507, 0, 1, 0.3764706, 1,
-0.2302512, -2.327181, -5.41359, 0, 1, 0.3803922, 1,
-0.2301493, 1.637626, 0.05560896, 0, 1, 0.3882353, 1,
-0.2276088, -0.3801714, -3.309097, 0, 1, 0.3921569, 1,
-0.2241983, -1.169247, -4.999543, 0, 1, 0.4, 1,
-0.2238723, -0.008573357, -1.15127, 0, 1, 0.4078431, 1,
-0.2219852, 0.7474544, -0.2963732, 0, 1, 0.4117647, 1,
-0.220094, 0.3879502, -0.4328583, 0, 1, 0.4196078, 1,
-0.218277, -1.228756, -2.826519, 0, 1, 0.4235294, 1,
-0.2171074, -0.04860701, -1.445527, 0, 1, 0.4313726, 1,
-0.215952, 0.4779995, -1.268051, 0, 1, 0.4352941, 1,
-0.2137102, -0.4404982, -2.863223, 0, 1, 0.4431373, 1,
-0.2099672, -1.200042, -2.055368, 0, 1, 0.4470588, 1,
-0.2069206, 1.322969, -0.797062, 0, 1, 0.454902, 1,
-0.2032504, -1.588586, -3.769164, 0, 1, 0.4588235, 1,
-0.2025261, -0.5299873, -3.67485, 0, 1, 0.4666667, 1,
-0.2012846, -1.243887, -3.628745, 0, 1, 0.4705882, 1,
-0.1997545, -0.7191287, -4.269804, 0, 1, 0.4784314, 1,
-0.1989135, -1.072585, -3.473731, 0, 1, 0.4823529, 1,
-0.1974079, -0.165595, -3.64167, 0, 1, 0.4901961, 1,
-0.1965054, -0.8347774, -2.983439, 0, 1, 0.4941176, 1,
-0.1964601, 1.124017, 0.01415705, 0, 1, 0.5019608, 1,
-0.1964266, -0.2035127, -1.998683, 0, 1, 0.509804, 1,
-0.1939251, 0.5203235, -1.217701, 0, 1, 0.5137255, 1,
-0.1912125, 0.0852455, -1.395071, 0, 1, 0.5215687, 1,
-0.1824246, -1.910973, -3.010369, 0, 1, 0.5254902, 1,
-0.182019, -0.6799772, -2.018603, 0, 1, 0.5333334, 1,
-0.1805866, -2.017975, -2.19743, 0, 1, 0.5372549, 1,
-0.1760775, -0.8763759, -3.582844, 0, 1, 0.5450981, 1,
-0.1731621, -1.2555, -4.015448, 0, 1, 0.5490196, 1,
-0.1703734, -0.4977876, -2.519186, 0, 1, 0.5568628, 1,
-0.1631314, -1.981233, -2.889468, 0, 1, 0.5607843, 1,
-0.1564645, 1.797871, 1.128215, 0, 1, 0.5686275, 1,
-0.1546294, 0.03265639, -1.509127, 0, 1, 0.572549, 1,
-0.1530467, -0.5796195, -0.8240373, 0, 1, 0.5803922, 1,
-0.152375, 0.4460817, -0.0455185, 0, 1, 0.5843138, 1,
-0.1503666, -0.9745538, -1.90859, 0, 1, 0.5921569, 1,
-0.1458393, 0.2408388, -1.114185, 0, 1, 0.5960785, 1,
-0.1452129, 0.6742944, 0.2884536, 0, 1, 0.6039216, 1,
-0.1426916, -0.8696126, -3.58788, 0, 1, 0.6117647, 1,
-0.1425773, 0.2767646, 0.5958933, 0, 1, 0.6156863, 1,
-0.1395439, 0.2346773, -0.8513548, 0, 1, 0.6235294, 1,
-0.1345481, -0.03004242, -0.08762641, 0, 1, 0.627451, 1,
-0.1343622, -1.485859, -4.336159, 0, 1, 0.6352941, 1,
-0.1310446, 0.2427588, -1.32793, 0, 1, 0.6392157, 1,
-0.1288242, -1.069693, -3.315006, 0, 1, 0.6470588, 1,
-0.1275382, 1.024256, -0.2474464, 0, 1, 0.6509804, 1,
-0.1242541, 1.321033, -0.4295966, 0, 1, 0.6588235, 1,
-0.1235514, -0.06496935, -1.602503, 0, 1, 0.6627451, 1,
-0.1119345, -0.3905677, -4.872731, 0, 1, 0.6705883, 1,
-0.1057616, -0.4588849, -3.527164, 0, 1, 0.6745098, 1,
-0.1022146, 0.3634391, -1.501305, 0, 1, 0.682353, 1,
-0.1021149, -1.087783, -2.086644, 0, 1, 0.6862745, 1,
-0.0997887, 1.041969, 0.9399996, 0, 1, 0.6941177, 1,
-0.09911899, -0.1792963, -1.484809, 0, 1, 0.7019608, 1,
-0.09743163, -1.268696, -3.448696, 0, 1, 0.7058824, 1,
-0.09437057, 2.810866, 0.1193177, 0, 1, 0.7137255, 1,
-0.09374867, 0.1931588, -2.185261, 0, 1, 0.7176471, 1,
-0.09240773, -0.2158545, -3.397597, 0, 1, 0.7254902, 1,
-0.0920894, 0.4150404, -0.9916151, 0, 1, 0.7294118, 1,
-0.09004951, 1.196162, 0.1919584, 0, 1, 0.7372549, 1,
-0.08530213, 0.8235536, 0.7597234, 0, 1, 0.7411765, 1,
-0.08509705, -1.560126, -3.937393, 0, 1, 0.7490196, 1,
-0.0846689, 0.1778906, 0.6378438, 0, 1, 0.7529412, 1,
-0.08396957, 0.8056731, -0.9131458, 0, 1, 0.7607843, 1,
-0.08374627, 0.004887053, -1.535702, 0, 1, 0.7647059, 1,
-0.08361105, 0.2358385, 1.06698, 0, 1, 0.772549, 1,
-0.07939808, 1.016533, 1.621081, 0, 1, 0.7764706, 1,
-0.07875873, -0.3438461, -3.246973, 0, 1, 0.7843137, 1,
-0.07613106, -0.08472305, -2.174969, 0, 1, 0.7882353, 1,
-0.07557481, -0.002821296, -1.384059, 0, 1, 0.7960784, 1,
-0.06672669, -0.3486854, -3.6598, 0, 1, 0.8039216, 1,
-0.06425036, 0.5717325, -1.055998, 0, 1, 0.8078431, 1,
-0.06363424, -1.413546, -4.571749, 0, 1, 0.8156863, 1,
-0.06197998, 0.9164934, 0.5345846, 0, 1, 0.8196079, 1,
-0.06117499, 1.144115, -0.8579436, 0, 1, 0.827451, 1,
-0.06001713, -0.04237211, -1.212592, 0, 1, 0.8313726, 1,
-0.05889153, 0.6779716, -0.7403885, 0, 1, 0.8392157, 1,
-0.05689862, 0.38937, -0.653673, 0, 1, 0.8431373, 1,
-0.05624855, 1.318478, -0.575314, 0, 1, 0.8509804, 1,
-0.05530789, 1.00565, -1.962994, 0, 1, 0.854902, 1,
-0.05364691, 0.3016511, 1.39743, 0, 1, 0.8627451, 1,
-0.05358958, 0.8219579, 0.8471848, 0, 1, 0.8666667, 1,
-0.05097595, -1.399733, -3.016396, 0, 1, 0.8745098, 1,
-0.0498606, -0.3577375, -3.2916, 0, 1, 0.8784314, 1,
-0.04405872, -0.346406, -2.282498, 0, 1, 0.8862745, 1,
-0.04105642, 0.3474149, 0.9863549, 0, 1, 0.8901961, 1,
-0.03928115, 1.486614, 2.632368, 0, 1, 0.8980392, 1,
-0.0389859, -0.08486645, -3.442175, 0, 1, 0.9058824, 1,
-0.03770969, 0.6918085, 1.873608, 0, 1, 0.9098039, 1,
-0.03454932, 0.5729185, -0.1684321, 0, 1, 0.9176471, 1,
-0.03206203, 0.7866742, -0.07452273, 0, 1, 0.9215686, 1,
-0.02780769, -0.0326732, -2.039804, 0, 1, 0.9294118, 1,
-0.02678359, 0.491758, -0.1839568, 0, 1, 0.9333333, 1,
-0.02538005, -0.278011, -4.795956, 0, 1, 0.9411765, 1,
-0.02465791, -0.2797048, -4.207347, 0, 1, 0.945098, 1,
-0.02292289, -0.7967602, -4.460884, 0, 1, 0.9529412, 1,
-0.0173453, 0.5385509, 0.2266615, 0, 1, 0.9568627, 1,
-0.01547924, 0.2236717, -1.296116, 0, 1, 0.9647059, 1,
-0.01463173, 0.03253508, -1.007082, 0, 1, 0.9686275, 1,
-0.0145694, 0.4057738, -0.1572879, 0, 1, 0.9764706, 1,
-0.01415088, -0.4710841, -4.097649, 0, 1, 0.9803922, 1,
-0.01394935, 0.4269015, 0.991922, 0, 1, 0.9882353, 1,
-0.0132487, -1.041072, -4.028779, 0, 1, 0.9921569, 1,
-0.01220149, 0.06372429, -0.07616488, 0, 1, 1, 1,
-0.01167445, 0.2240483, -0.9120792, 0, 0.9921569, 1, 1,
-0.009189363, 0.6019368, 1.167559, 0, 0.9882353, 1, 1,
-0.008938844, 0.4446786, 0.7013756, 0, 0.9803922, 1, 1,
-0.008600276, -0.00414166, -2.88558, 0, 0.9764706, 1, 1,
-0.001141238, -0.8550442, -3.543213, 0, 0.9686275, 1, 1,
-0.0009266209, 1.822437, -0.610639, 0, 0.9647059, 1, 1,
0.002089552, 1.069803, 1.558012, 0, 0.9568627, 1, 1,
0.008075204, -0.1776406, 2.653497, 0, 0.9529412, 1, 1,
0.01095757, -1.095458, 4.45203, 0, 0.945098, 1, 1,
0.01301847, 0.2672995, 2.057624, 0, 0.9411765, 1, 1,
0.01314878, -0.2942011, 2.067383, 0, 0.9333333, 1, 1,
0.01457493, 1.904801, 0.01910783, 0, 0.9294118, 1, 1,
0.01775109, -0.2158263, 1.706327, 0, 0.9215686, 1, 1,
0.0177552, -0.7027794, 3.335919, 0, 0.9176471, 1, 1,
0.0185904, -0.565356, 4.857363, 0, 0.9098039, 1, 1,
0.019097, -1.546738, 2.770267, 0, 0.9058824, 1, 1,
0.02012602, -0.03946408, 3.758887, 0, 0.8980392, 1, 1,
0.02340513, -0.5369205, 4.90968, 0, 0.8901961, 1, 1,
0.02445984, 0.4232723, 1.123022, 0, 0.8862745, 1, 1,
0.02570192, -0.3852328, 4.067504, 0, 0.8784314, 1, 1,
0.02794722, -1.183656, 2.843579, 0, 0.8745098, 1, 1,
0.02803062, -1.297087, 2.972956, 0, 0.8666667, 1, 1,
0.03096171, -1.374622, 5.260824, 0, 0.8627451, 1, 1,
0.03243457, -0.2682455, 4.26993, 0, 0.854902, 1, 1,
0.04065119, -0.009684276, 1.517888, 0, 0.8509804, 1, 1,
0.0447407, 0.3047781, 1.269895, 0, 0.8431373, 1, 1,
0.0455345, 1.860794, -0.8739119, 0, 0.8392157, 1, 1,
0.05140398, 0.8550681, 1.412405, 0, 0.8313726, 1, 1,
0.05335299, 0.7244011, -0.4862201, 0, 0.827451, 1, 1,
0.05566823, -0.5212032, 5.010182, 0, 0.8196079, 1, 1,
0.05661037, -0.6305377, 3.084076, 0, 0.8156863, 1, 1,
0.0584985, -0.9682218, 2.626426, 0, 0.8078431, 1, 1,
0.06881638, -0.2505638, 4.379078, 0, 0.8039216, 1, 1,
0.07018218, 0.7200092, 0.6156424, 0, 0.7960784, 1, 1,
0.07217178, 1.416255, -0.7957124, 0, 0.7882353, 1, 1,
0.07812326, 1.510584, -0.3908612, 0, 0.7843137, 1, 1,
0.08152317, 1.22781, 0.9247745, 0, 0.7764706, 1, 1,
0.08200527, -0.8927855, 1.179658, 0, 0.772549, 1, 1,
0.08240609, -0.7569386, 1.914593, 0, 0.7647059, 1, 1,
0.08268952, -0.3340654, 1.891029, 0, 0.7607843, 1, 1,
0.08275194, -0.003523086, 1.797062, 0, 0.7529412, 1, 1,
0.08935545, 0.2607198, 0.3643138, 0, 0.7490196, 1, 1,
0.09380094, -0.6257602, 3.552659, 0, 0.7411765, 1, 1,
0.0945205, 0.4600082, 0.939613, 0, 0.7372549, 1, 1,
0.09587892, 1.035783, 1.473163, 0, 0.7294118, 1, 1,
0.102756, -0.8210993, 2.701035, 0, 0.7254902, 1, 1,
0.1073081, 0.1782946, 2.897784, 0, 0.7176471, 1, 1,
0.1081984, 0.2458608, 0.7121383, 0, 0.7137255, 1, 1,
0.114564, 0.8268431, 1.161482, 0, 0.7058824, 1, 1,
0.1190943, -0.3668462, 4.110519, 0, 0.6980392, 1, 1,
0.1193137, 0.4580775, 0.4292934, 0, 0.6941177, 1, 1,
0.120218, -1.051277, 1.315307, 0, 0.6862745, 1, 1,
0.1228955, 1.496857, 0.04202538, 0, 0.682353, 1, 1,
0.1239809, 0.6323718, -0.4122328, 0, 0.6745098, 1, 1,
0.1244525, 1.079552, 0.8368593, 0, 0.6705883, 1, 1,
0.1276239, -0.7802746, 4.035208, 0, 0.6627451, 1, 1,
0.1281542, 0.203709, 0.4936093, 0, 0.6588235, 1, 1,
0.1282882, 0.2158162, 0.5409132, 0, 0.6509804, 1, 1,
0.1288602, -0.7939831, 5.843282, 0, 0.6470588, 1, 1,
0.1291641, 0.1509299, -0.04306951, 0, 0.6392157, 1, 1,
0.1339784, 0.9942257, 0.8790649, 0, 0.6352941, 1, 1,
0.1363855, -0.008965112, 2.64777, 0, 0.627451, 1, 1,
0.1376819, 2.011128, -0.4456524, 0, 0.6235294, 1, 1,
0.1413919, 0.5018704, 1.030243, 0, 0.6156863, 1, 1,
0.1422312, 0.4547415, 1.158464, 0, 0.6117647, 1, 1,
0.1460373, 0.1677418, 2.489363, 0, 0.6039216, 1, 1,
0.1493369, -0.00322762, 3.171044, 0, 0.5960785, 1, 1,
0.1522609, 1.843647, -0.850238, 0, 0.5921569, 1, 1,
0.1546732, -0.7800919, 2.614609, 0, 0.5843138, 1, 1,
0.1572261, 0.8563268, 0.1372377, 0, 0.5803922, 1, 1,
0.1592232, -0.856571, 3.72695, 0, 0.572549, 1, 1,
0.1651534, -1.540203, 3.991624, 0, 0.5686275, 1, 1,
0.1657057, -2.300593, 3.509088, 0, 0.5607843, 1, 1,
0.1671912, 0.1803803, 0.9110275, 0, 0.5568628, 1, 1,
0.1696105, -0.5280479, 1.332189, 0, 0.5490196, 1, 1,
0.1803984, 0.6142056, 1.082042, 0, 0.5450981, 1, 1,
0.1820267, 1.251622, 2.11016, 0, 0.5372549, 1, 1,
0.1853365, -2.219506, 2.109389, 0, 0.5333334, 1, 1,
0.1906648, -0.1895848, 2.104225, 0, 0.5254902, 1, 1,
0.1982376, -0.5725459, 3.018053, 0, 0.5215687, 1, 1,
0.2009897, -0.3719032, 1.565892, 0, 0.5137255, 1, 1,
0.2104075, 0.795258, 0.4909375, 0, 0.509804, 1, 1,
0.2125332, 0.3340723, 1.258914, 0, 0.5019608, 1, 1,
0.2128484, -1.151504, 2.561831, 0, 0.4941176, 1, 1,
0.213234, -2.175992, 2.770578, 0, 0.4901961, 1, 1,
0.2159354, 1.271008, 0.03570335, 0, 0.4823529, 1, 1,
0.2167178, 0.8057133, 0.1187835, 0, 0.4784314, 1, 1,
0.2305361, 0.925115, -1.381349, 0, 0.4705882, 1, 1,
0.2372562, 0.3758884, 1.267627, 0, 0.4666667, 1, 1,
0.2399273, 0.8923833, -0.06512983, 0, 0.4588235, 1, 1,
0.2414446, -1.88188, 3.206555, 0, 0.454902, 1, 1,
0.2424999, -1.701686, 2.030053, 0, 0.4470588, 1, 1,
0.250856, 1.659665, 0.06248992, 0, 0.4431373, 1, 1,
0.2513039, -0.4302885, 1.743903, 0, 0.4352941, 1, 1,
0.2558711, 0.6567547, 0.6700602, 0, 0.4313726, 1, 1,
0.2564984, 0.5200308, -0.006825879, 0, 0.4235294, 1, 1,
0.2567916, -0.50172, 1.559582, 0, 0.4196078, 1, 1,
0.2586142, 1.194781, -0.3677533, 0, 0.4117647, 1, 1,
0.2594099, -1.149585, 4.009831, 0, 0.4078431, 1, 1,
0.2610224, -1.434322, 4.125312, 0, 0.4, 1, 1,
0.2625854, -0.8098592, 2.376805, 0, 0.3921569, 1, 1,
0.266343, -0.1847776, 2.424002, 0, 0.3882353, 1, 1,
0.2697351, 1.477981, 1.653549, 0, 0.3803922, 1, 1,
0.2757457, 0.4888839, -0.7064315, 0, 0.3764706, 1, 1,
0.2773935, -1.852477, 3.338668, 0, 0.3686275, 1, 1,
0.2794382, -0.8495455, 4.81713, 0, 0.3647059, 1, 1,
0.2877279, 0.1749312, 1.468823, 0, 0.3568628, 1, 1,
0.2892841, 0.2968656, 2.150386, 0, 0.3529412, 1, 1,
0.2905025, -0.2868293, 3.477424, 0, 0.345098, 1, 1,
0.2949669, 0.4208705, 0.01711999, 0, 0.3411765, 1, 1,
0.3004864, -0.1791268, 2.67231, 0, 0.3333333, 1, 1,
0.3070025, 0.8488026, -0.4655349, 0, 0.3294118, 1, 1,
0.3118455, 0.01683795, 1.366127, 0, 0.3215686, 1, 1,
0.3146855, 0.5982531, 0.9924045, 0, 0.3176471, 1, 1,
0.3241547, -0.3206756, 1.322965, 0, 0.3098039, 1, 1,
0.3242262, 0.8234763, 0.9756783, 0, 0.3058824, 1, 1,
0.3303897, 1.515652, -0.5679396, 0, 0.2980392, 1, 1,
0.3337707, 1.05966, -0.04510289, 0, 0.2901961, 1, 1,
0.3342719, 1.067131, 0.2531312, 0, 0.2862745, 1, 1,
0.3383935, 1.387435, 0.0340615, 0, 0.2784314, 1, 1,
0.3386012, -0.4993163, 2.193215, 0, 0.2745098, 1, 1,
0.350522, 0.9069179, 1.303596, 0, 0.2666667, 1, 1,
0.3514712, 0.8633925, 0.511942, 0, 0.2627451, 1, 1,
0.3524764, -1.357124, 1.914713, 0, 0.254902, 1, 1,
0.3610457, -0.7745109, 2.670863, 0, 0.2509804, 1, 1,
0.3695251, 1.624572, -0.2784974, 0, 0.2431373, 1, 1,
0.370033, 0.05271869, 1.169589, 0, 0.2392157, 1, 1,
0.3772085, 0.5487671, -0.1350794, 0, 0.2313726, 1, 1,
0.3792888, 0.447478, 2.137486, 0, 0.227451, 1, 1,
0.3839563, -0.7675067, 0.6211916, 0, 0.2196078, 1, 1,
0.3852338, 0.1858812, 3.063103, 0, 0.2156863, 1, 1,
0.3882733, 1.412702, 0.1268936, 0, 0.2078431, 1, 1,
0.3906995, 0.2322712, 1.72704, 0, 0.2039216, 1, 1,
0.3909879, -0.9047835, 1.890321, 0, 0.1960784, 1, 1,
0.3947076, -0.1325345, 0.5141383, 0, 0.1882353, 1, 1,
0.3965808, -0.0628048, 1.544415, 0, 0.1843137, 1, 1,
0.3988002, 0.129717, 0.6294334, 0, 0.1764706, 1, 1,
0.3995817, -1.371302, 3.741138, 0, 0.172549, 1, 1,
0.401211, -2.167217, 2.62078, 0, 0.1647059, 1, 1,
0.401412, -1.036188, 2.298346, 0, 0.1607843, 1, 1,
0.4024603, -0.4030136, 2.151683, 0, 0.1529412, 1, 1,
0.403802, 0.7111663, 0.7422157, 0, 0.1490196, 1, 1,
0.4048245, -0.2493418, 2.600921, 0, 0.1411765, 1, 1,
0.4187691, -1.047618, 3.187557, 0, 0.1372549, 1, 1,
0.4199528, 0.05435603, 1.950493, 0, 0.1294118, 1, 1,
0.4202479, -0.6028739, 2.545044, 0, 0.1254902, 1, 1,
0.4206349, -0.2504327, 2.219614, 0, 0.1176471, 1, 1,
0.4282075, 1.450013, 1.278443, 0, 0.1137255, 1, 1,
0.4282964, -0.8451033, 1.596919, 0, 0.1058824, 1, 1,
0.4295101, -0.4915981, 1.738995, 0, 0.09803922, 1, 1,
0.429617, -1.020222, 1.460706, 0, 0.09411765, 1, 1,
0.430431, -0.6109089, 1.404108, 0, 0.08627451, 1, 1,
0.4305969, 1.404162, 2.409463, 0, 0.08235294, 1, 1,
0.4326146, 0.5492887, 1.200112, 0, 0.07450981, 1, 1,
0.4401883, 0.1050133, 0.8157491, 0, 0.07058824, 1, 1,
0.4422273, 0.06469574, -0.1534654, 0, 0.0627451, 1, 1,
0.4484772, -1.203847, 2.638787, 0, 0.05882353, 1, 1,
0.4492794, -1.130205, 1.819307, 0, 0.05098039, 1, 1,
0.4502232, -0.3218305, 3.57418, 0, 0.04705882, 1, 1,
0.451611, -0.06929864, 2.760269, 0, 0.03921569, 1, 1,
0.4538252, 0.1847761, 0.6289311, 0, 0.03529412, 1, 1,
0.4540455, -0.0754906, 2.182132, 0, 0.02745098, 1, 1,
0.4544309, -3.022389, 3.86662, 0, 0.02352941, 1, 1,
0.4550092, -1.140061, 3.206289, 0, 0.01568628, 1, 1,
0.4551205, 0.1485626, -0.5844467, 0, 0.01176471, 1, 1,
0.4584394, -0.1541452, 1.711766, 0, 0.003921569, 1, 1,
0.4632855, 0.8491151, -1.237157, 0.003921569, 0, 1, 1,
0.4653224, 0.5042669, 0.9084436, 0.007843138, 0, 1, 1,
0.465992, -0.6162713, 1.839032, 0.01568628, 0, 1, 1,
0.4674412, -0.03860592, 2.057721, 0.01960784, 0, 1, 1,
0.4700163, 0.4653705, 0.4063662, 0.02745098, 0, 1, 1,
0.4736043, 0.1037554, 2.517796, 0.03137255, 0, 1, 1,
0.4831698, -0.6894987, 0.6573039, 0.03921569, 0, 1, 1,
0.4832606, 0.01016011, 2.032585, 0.04313726, 0, 1, 1,
0.4898947, -0.01273498, -0.1666511, 0.05098039, 0, 1, 1,
0.490238, 0.1618193, 3.376722, 0.05490196, 0, 1, 1,
0.4920128, -2.662994, 3.256026, 0.0627451, 0, 1, 1,
0.4929346, 1.625105, -0.80491, 0.06666667, 0, 1, 1,
0.4930172, -0.4806535, 3.248228, 0.07450981, 0, 1, 1,
0.4935991, -0.323073, 1.891363, 0.07843138, 0, 1, 1,
0.4955461, -0.1507834, 1.403781, 0.08627451, 0, 1, 1,
0.5012012, -1.184978, 2.520133, 0.09019608, 0, 1, 1,
0.5042759, -1.014195, 4.417892, 0.09803922, 0, 1, 1,
0.504994, 1.118621, 0.08128518, 0.1058824, 0, 1, 1,
0.5079561, 1.398377, 0.05237252, 0.1098039, 0, 1, 1,
0.5084142, -0.4289041, 2.296664, 0.1176471, 0, 1, 1,
0.5116375, -0.04223881, 0.4855112, 0.1215686, 0, 1, 1,
0.5131553, 0.8629243, 1.054347, 0.1294118, 0, 1, 1,
0.5138364, -0.6125522, 3.866962, 0.1333333, 0, 1, 1,
0.5218344, 0.1871952, 0.6933971, 0.1411765, 0, 1, 1,
0.5218675, 0.3095611, 0.5655333, 0.145098, 0, 1, 1,
0.5224434, 1.238875, -0.7984922, 0.1529412, 0, 1, 1,
0.5226001, 0.9516398, 2.307355, 0.1568628, 0, 1, 1,
0.5267221, -0.739063, 3.180122, 0.1647059, 0, 1, 1,
0.5272421, -0.6159452, 2.53931, 0.1686275, 0, 1, 1,
0.5322527, -0.483935, 0.6382393, 0.1764706, 0, 1, 1,
0.5466823, 0.884641, 2.130389, 0.1803922, 0, 1, 1,
0.5467567, 0.4547934, 2.037009, 0.1882353, 0, 1, 1,
0.5468211, -0.8472868, 0.3819073, 0.1921569, 0, 1, 1,
0.5480234, 1.98234, 0.0009529638, 0.2, 0, 1, 1,
0.5484192, -0.1398473, 3.360738, 0.2078431, 0, 1, 1,
0.5495652, -0.2246888, 0.9692184, 0.2117647, 0, 1, 1,
0.5560804, -0.9906511, 3.305712, 0.2196078, 0, 1, 1,
0.5584437, -0.8052217, 4.288723, 0.2235294, 0, 1, 1,
0.5619251, 0.1234357, -0.1132293, 0.2313726, 0, 1, 1,
0.5646642, -1.402512, 4.401242, 0.2352941, 0, 1, 1,
0.5656507, -0.8712808, 1.939535, 0.2431373, 0, 1, 1,
0.5690492, 0.8777882, -0.7083871, 0.2470588, 0, 1, 1,
0.5762197, -0.6211631, 1.775892, 0.254902, 0, 1, 1,
0.5764685, 1.319409, 1.195129, 0.2588235, 0, 1, 1,
0.5765625, 0.1398323, 2.976486, 0.2666667, 0, 1, 1,
0.5778922, -0.1627866, 3.559723, 0.2705882, 0, 1, 1,
0.5860484, -2.082087, 2.124373, 0.2784314, 0, 1, 1,
0.5881209, 0.1429385, -0.2249146, 0.282353, 0, 1, 1,
0.5894576, 1.253031, -0.1823957, 0.2901961, 0, 1, 1,
0.595106, 0.17909, 0.8666834, 0.2941177, 0, 1, 1,
0.5964748, -0.3632939, 2.85264, 0.3019608, 0, 1, 1,
0.5965448, -0.9713987, 2.854342, 0.3098039, 0, 1, 1,
0.598132, -1.487585, 1.381495, 0.3137255, 0, 1, 1,
0.6009709, 0.09281369, 3.84925, 0.3215686, 0, 1, 1,
0.6037443, -2.259446, 3.990196, 0.3254902, 0, 1, 1,
0.6081247, -1.374183, 1.16581, 0.3333333, 0, 1, 1,
0.6134216, -0.2084831, 2.082653, 0.3372549, 0, 1, 1,
0.6140692, 0.6507653, 0.1583482, 0.345098, 0, 1, 1,
0.6223351, -0.3858499, 4.178383, 0.3490196, 0, 1, 1,
0.6237119, -1.591267, 1.428452, 0.3568628, 0, 1, 1,
0.6260483, -0.6824677, 3.014205, 0.3607843, 0, 1, 1,
0.6267129, 0.5533102, -0.06581862, 0.3686275, 0, 1, 1,
0.6287146, 0.1631729, -0.4103435, 0.372549, 0, 1, 1,
0.629016, -1.967256, 3.562614, 0.3803922, 0, 1, 1,
0.6303385, 0.2949591, 0.9038199, 0.3843137, 0, 1, 1,
0.6318495, -1.043621, 2.304683, 0.3921569, 0, 1, 1,
0.6357961, -0.8540462, 3.413572, 0.3960784, 0, 1, 1,
0.6369799, 0.2755362, -0.04393899, 0.4039216, 0, 1, 1,
0.6432036, -2.493659, 2.984102, 0.4117647, 0, 1, 1,
0.6452657, -0.007612245, 2.618301, 0.4156863, 0, 1, 1,
0.6480483, 1.125296, -0.4922737, 0.4235294, 0, 1, 1,
0.6533428, -0.9629614, 2.563287, 0.427451, 0, 1, 1,
0.6542358, -0.02257836, 1.388492, 0.4352941, 0, 1, 1,
0.6554928, 1.210791, 0.7541615, 0.4392157, 0, 1, 1,
0.6593131, 1.385209, -0.7126613, 0.4470588, 0, 1, 1,
0.6622761, 0.05727481, 0.6889056, 0.4509804, 0, 1, 1,
0.6649776, 1.303345, -0.4652666, 0.4588235, 0, 1, 1,
0.6710261, -0.6958596, 0.9460884, 0.4627451, 0, 1, 1,
0.6720111, -0.03532974, 0.09973105, 0.4705882, 0, 1, 1,
0.6727514, 0.94295, 1.417102, 0.4745098, 0, 1, 1,
0.6742976, 1.633129, 0.9015533, 0.4823529, 0, 1, 1,
0.6765133, 0.0784613, 1.211427, 0.4862745, 0, 1, 1,
0.6798492, -1.860813, 3.503699, 0.4941176, 0, 1, 1,
0.683334, -0.6577161, 3.052966, 0.5019608, 0, 1, 1,
0.6849008, -0.9008861, 4.832819, 0.5058824, 0, 1, 1,
0.6850559, 0.798637, 0.4468791, 0.5137255, 0, 1, 1,
0.6854082, -1.006724, 1.325558, 0.5176471, 0, 1, 1,
0.6855177, 1.264966, 0.9307784, 0.5254902, 0, 1, 1,
0.6943718, 0.4834605, 0.1695222, 0.5294118, 0, 1, 1,
0.6978599, -1.486097, 1.825857, 0.5372549, 0, 1, 1,
0.7015526, 0.09774549, -0.5117828, 0.5411765, 0, 1, 1,
0.7016445, 1.78536, 1.571029, 0.5490196, 0, 1, 1,
0.702132, 1.163848, -0.2309373, 0.5529412, 0, 1, 1,
0.7030764, -1.101799, 2.144176, 0.5607843, 0, 1, 1,
0.7042061, 1.491544, 1.08174, 0.5647059, 0, 1, 1,
0.707284, -0.07069214, 0.1366981, 0.572549, 0, 1, 1,
0.7160609, 1.738168, -0.5836655, 0.5764706, 0, 1, 1,
0.7204596, -0.1542002, 0.4125602, 0.5843138, 0, 1, 1,
0.7240661, -0.006155419, 2.634676, 0.5882353, 0, 1, 1,
0.7279117, -0.761141, 2.035344, 0.5960785, 0, 1, 1,
0.7300873, 0.1656827, 2.246729, 0.6039216, 0, 1, 1,
0.7315583, 0.450417, 1.019988, 0.6078432, 0, 1, 1,
0.7384332, 0.3884455, 2.537237, 0.6156863, 0, 1, 1,
0.7400609, 0.2125791, 1.139005, 0.6196079, 0, 1, 1,
0.7424916, -0.8842511, 2.196827, 0.627451, 0, 1, 1,
0.7429265, -1.409143, 2.08453, 0.6313726, 0, 1, 1,
0.7442459, 1.128361, 1.885444, 0.6392157, 0, 1, 1,
0.750325, -2.52057, 3.789653, 0.6431373, 0, 1, 1,
0.7522158, 2.3792, 0.15291, 0.6509804, 0, 1, 1,
0.7532628, -2.706604, 4.474051, 0.654902, 0, 1, 1,
0.7539156, -0.5625845, 3.272822, 0.6627451, 0, 1, 1,
0.7554748, 1.001417, -0.4824283, 0.6666667, 0, 1, 1,
0.7569181, -1.57425, 2.85583, 0.6745098, 0, 1, 1,
0.7626674, 2.200292, 1.72401, 0.6784314, 0, 1, 1,
0.7636619, -0.4085312, 2.656315, 0.6862745, 0, 1, 1,
0.7664055, 0.2949451, 2.890156, 0.6901961, 0, 1, 1,
0.7763042, 2.495477, -0.7377194, 0.6980392, 0, 1, 1,
0.7848248, -0.320179, 1.488947, 0.7058824, 0, 1, 1,
0.7867561, -0.7414868, 1.758483, 0.7098039, 0, 1, 1,
0.7894469, -2.294362, 2.287646, 0.7176471, 0, 1, 1,
0.7904001, -0.8613141, 2.578178, 0.7215686, 0, 1, 1,
0.7908745, -0.3881371, 3.992782, 0.7294118, 0, 1, 1,
0.7943838, -1.533794, 3.407145, 0.7333333, 0, 1, 1,
0.7947738, 0.4455973, 0.8787794, 0.7411765, 0, 1, 1,
0.7964036, -1.068136, 3.316969, 0.7450981, 0, 1, 1,
0.7976862, -0.5220873, 1.492803, 0.7529412, 0, 1, 1,
0.801029, -1.117522, 1.188617, 0.7568628, 0, 1, 1,
0.8055375, -1.404606, 2.718358, 0.7647059, 0, 1, 1,
0.8064403, -0.7743098, 4.406635, 0.7686275, 0, 1, 1,
0.8148363, 0.6925862, 2.457627, 0.7764706, 0, 1, 1,
0.8150855, -1.632297, 2.461774, 0.7803922, 0, 1, 1,
0.8271036, 1.335922, 0.4959502, 0.7882353, 0, 1, 1,
0.8289821, 0.668021, -0.5056617, 0.7921569, 0, 1, 1,
0.8329339, -0.2103231, 1.528989, 0.8, 0, 1, 1,
0.8364196, -2.496713, 2.432399, 0.8078431, 0, 1, 1,
0.8376371, 0.4126962, -0.2042093, 0.8117647, 0, 1, 1,
0.8426254, -0.5390024, 2.334439, 0.8196079, 0, 1, 1,
0.8526268, -0.1995782, 1.915862, 0.8235294, 0, 1, 1,
0.8600076, 0.9410939, 1.498634, 0.8313726, 0, 1, 1,
0.8625618, -1.914026, 3.584821, 0.8352941, 0, 1, 1,
0.8629583, 1.655712, 2.650595, 0.8431373, 0, 1, 1,
0.863365, -0.153391, 2.680637, 0.8470588, 0, 1, 1,
0.8679751, 0.4120781, 1.895183, 0.854902, 0, 1, 1,
0.8700987, -2.228296, 2.581153, 0.8588235, 0, 1, 1,
0.8716199, -0.1465585, 2.159222, 0.8666667, 0, 1, 1,
0.8724684, -2.00255, 2.710166, 0.8705882, 0, 1, 1,
0.8808967, -1.813358, 2.936144, 0.8784314, 0, 1, 1,
0.8825654, 0.4483561, 0.5707322, 0.8823529, 0, 1, 1,
0.8837247, 0.6807487, 0.2995673, 0.8901961, 0, 1, 1,
0.8844789, 1.096627, 2.128108, 0.8941177, 0, 1, 1,
0.8876237, 0.639208, 0.7977351, 0.9019608, 0, 1, 1,
0.8884287, -0.05553579, 1.664661, 0.9098039, 0, 1, 1,
0.8950616, -0.3844391, 1.413908, 0.9137255, 0, 1, 1,
0.9028068, -1.520867, 3.711038, 0.9215686, 0, 1, 1,
0.9038507, 1.551918, -0.04624674, 0.9254902, 0, 1, 1,
0.9084966, -2.333182, 2.597328, 0.9333333, 0, 1, 1,
0.9092197, -0.6215214, 2.106298, 0.9372549, 0, 1, 1,
0.9095407, 0.1798331, 2.860145, 0.945098, 0, 1, 1,
0.9110389, 0.9031492, 0.8125548, 0.9490196, 0, 1, 1,
0.9162919, -0.2568482, 3.725662, 0.9568627, 0, 1, 1,
0.9203792, -0.9659455, 4.094759, 0.9607843, 0, 1, 1,
0.9214011, 1.327895, 1.279008, 0.9686275, 0, 1, 1,
0.927518, 0.8219304, 1.640676, 0.972549, 0, 1, 1,
0.9310904, -0.7952638, 1.439688, 0.9803922, 0, 1, 1,
0.951749, 1.061772, 0.5826582, 0.9843137, 0, 1, 1,
0.955892, 0.6661729, 0.3152754, 0.9921569, 0, 1, 1,
0.9594266, -0.2305657, 2.753883, 0.9960784, 0, 1, 1,
0.9628816, -0.8859812, 1.750411, 1, 0, 0.9960784, 1,
0.9631212, -1.29545, 2.260931, 1, 0, 0.9882353, 1,
0.965211, -0.7809268, 2.964942, 1, 0, 0.9843137, 1,
0.9672091, 1.550282, -0.7171057, 1, 0, 0.9764706, 1,
0.9824963, -0.0890945, 2.283614, 1, 0, 0.972549, 1,
0.9905438, -0.4489474, 1.523948, 1, 0, 0.9647059, 1,
0.9912382, 0.1079204, 1.870413, 1, 0, 0.9607843, 1,
0.9964278, -0.6173488, 2.513061, 1, 0, 0.9529412, 1,
1.004797, 1.444124, 0.8665074, 1, 0, 0.9490196, 1,
1.007997, 1.237099, 1.636378, 1, 0, 0.9411765, 1,
1.008807, -0.1284701, 3.120629, 1, 0, 0.9372549, 1,
1.019379, -1.408768, 0.3749546, 1, 0, 0.9294118, 1,
1.019565, -0.8977911, 2.573346, 1, 0, 0.9254902, 1,
1.027763, -1.0548, 3.082706, 1, 0, 0.9176471, 1,
1.029283, -0.2572916, 2.362953, 1, 0, 0.9137255, 1,
1.031589, 0.1060432, 1.436268, 1, 0, 0.9058824, 1,
1.032957, -0.7141415, 2.237044, 1, 0, 0.9019608, 1,
1.038679, 0.02187864, -0.07087816, 1, 0, 0.8941177, 1,
1.038752, 1.940105, 2.713043, 1, 0, 0.8862745, 1,
1.048345, 1.631315, 0.4029345, 1, 0, 0.8823529, 1,
1.055642, -0.3936828, 2.20909, 1, 0, 0.8745098, 1,
1.056856, -0.5804508, 1.722348, 1, 0, 0.8705882, 1,
1.076316, 2.204402, 1.395157, 1, 0, 0.8627451, 1,
1.083647, 0.5482329, -0.006701994, 1, 0, 0.8588235, 1,
1.096739, -1.132149, 4.271984, 1, 0, 0.8509804, 1,
1.096906, -1.129065, 1.883291, 1, 0, 0.8470588, 1,
1.099187, 0.5435674, 1.036599, 1, 0, 0.8392157, 1,
1.100537, 0.9627357, 0.6855631, 1, 0, 0.8352941, 1,
1.102906, -0.4791234, 2.85051, 1, 0, 0.827451, 1,
1.104661, -0.7758591, 1.072465, 1, 0, 0.8235294, 1,
1.110514, -1.240492, 1.579391, 1, 0, 0.8156863, 1,
1.110679, -0.4124552, 2.8398, 1, 0, 0.8117647, 1,
1.11385, 0.9733377, 2.465902, 1, 0, 0.8039216, 1,
1.12609, 1.321912, 1.573074, 1, 0, 0.7960784, 1,
1.128188, 0.6451075, 0.05739419, 1, 0, 0.7921569, 1,
1.142542, 0.4783809, 0.3186677, 1, 0, 0.7843137, 1,
1.160614, 0.333118, 1.545463, 1, 0, 0.7803922, 1,
1.161816, 0.507545, 0.894549, 1, 0, 0.772549, 1,
1.16688, 0.0584923, 3.479232, 1, 0, 0.7686275, 1,
1.173473, 0.3527708, 0.4242517, 1, 0, 0.7607843, 1,
1.17469, -0.0531096, 2.249341, 1, 0, 0.7568628, 1,
1.179193, 0.01843059, 0.9963364, 1, 0, 0.7490196, 1,
1.180488, 0.4712951, 2.398688, 1, 0, 0.7450981, 1,
1.183245, 0.04304142, 1.057708, 1, 0, 0.7372549, 1,
1.183371, 0.783807, 1.243811, 1, 0, 0.7333333, 1,
1.186258, -0.4918324, 1.590325, 1, 0, 0.7254902, 1,
1.19385, -0.7213507, 0.8860377, 1, 0, 0.7215686, 1,
1.209614, 0.09466667, 3.952617, 1, 0, 0.7137255, 1,
1.21278, 1.255086, 0.5518845, 1, 0, 0.7098039, 1,
1.219056, -0.4087065, 2.064561, 1, 0, 0.7019608, 1,
1.222954, 0.2412553, 0.5824093, 1, 0, 0.6941177, 1,
1.22766, -0.3957092, 2.770811, 1, 0, 0.6901961, 1,
1.230912, -2.016526, 2.746625, 1, 0, 0.682353, 1,
1.231722, -0.9623218, 1.098818, 1, 0, 0.6784314, 1,
1.236199, -0.1010112, 0.7466733, 1, 0, 0.6705883, 1,
1.239325, 0.8015552, 0.3439217, 1, 0, 0.6666667, 1,
1.244377, 0.2400063, 0.8960759, 1, 0, 0.6588235, 1,
1.246802, 0.4223929, 0.4678092, 1, 0, 0.654902, 1,
1.255563, -0.141322, 2.35964, 1, 0, 0.6470588, 1,
1.268515, 2.362647, 0.1704967, 1, 0, 0.6431373, 1,
1.27623, 0.3871979, 1.009712, 1, 0, 0.6352941, 1,
1.276841, -1.210944, 3.520447, 1, 0, 0.6313726, 1,
1.278761, 0.5609496, -1.132175, 1, 0, 0.6235294, 1,
1.280061, 0.1224703, 0.8284775, 1, 0, 0.6196079, 1,
1.284074, -1.444529, 2.833878, 1, 0, 0.6117647, 1,
1.284097, -1.095009, 1.648537, 1, 0, 0.6078432, 1,
1.285319, -0.4781033, 1.091901, 1, 0, 0.6, 1,
1.29216, -0.4136011, 1.421329, 1, 0, 0.5921569, 1,
1.298647, -0.7246045, 3.582557, 1, 0, 0.5882353, 1,
1.301331, 0.5185059, 0.6206763, 1, 0, 0.5803922, 1,
1.303966, 0.3071556, 1.686337, 1, 0, 0.5764706, 1,
1.305622, 0.141741, 1.843845, 1, 0, 0.5686275, 1,
1.308859, 0.05332364, 3.609746, 1, 0, 0.5647059, 1,
1.310331, 0.6177558, 1.922149, 1, 0, 0.5568628, 1,
1.311678, 0.8471259, 0.749859, 1, 0, 0.5529412, 1,
1.321386, -0.839559, 2.45011, 1, 0, 0.5450981, 1,
1.325434, -0.1364531, 2.22332, 1, 0, 0.5411765, 1,
1.338526, -0.8803337, 3.81062, 1, 0, 0.5333334, 1,
1.342114, -0.07888737, 2.705096, 1, 0, 0.5294118, 1,
1.357351, 0.5663409, 2.045058, 1, 0, 0.5215687, 1,
1.357474, 0.6429368, -1.808972, 1, 0, 0.5176471, 1,
1.359703, -0.08821049, 1.809551, 1, 0, 0.509804, 1,
1.362336, 0.290306, 0.2300123, 1, 0, 0.5058824, 1,
1.36708, 0.4689343, 0.6770326, 1, 0, 0.4980392, 1,
1.368114, 0.223351, 2.405692, 1, 0, 0.4901961, 1,
1.372256, 1.381088, 0.4406792, 1, 0, 0.4862745, 1,
1.382626, -1.34566, 1.700937, 1, 0, 0.4784314, 1,
1.399132, -0.7725596, 1.212439, 1, 0, 0.4745098, 1,
1.400952, 0.6417131, -0.3676288, 1, 0, 0.4666667, 1,
1.40824, -1.160773, 2.499976, 1, 0, 0.4627451, 1,
1.409713, -1.374583, 3.448035, 1, 0, 0.454902, 1,
1.429914, -0.3594316, 1.341222, 1, 0, 0.4509804, 1,
1.442444, -2.459621, 2.081405, 1, 0, 0.4431373, 1,
1.455719, -1.141695, 3.115201, 1, 0, 0.4392157, 1,
1.461841, -0.7547306, 0.9938987, 1, 0, 0.4313726, 1,
1.468329, -0.7579656, 1.618875, 1, 0, 0.427451, 1,
1.468789, 0.5154771, 2.581267, 1, 0, 0.4196078, 1,
1.509068, 0.8449069, 1.066638, 1, 0, 0.4156863, 1,
1.520282, 0.1288519, 0.8891106, 1, 0, 0.4078431, 1,
1.528183, 0.2637294, 0.3624555, 1, 0, 0.4039216, 1,
1.529628, 0.6821347, 2.146057, 1, 0, 0.3960784, 1,
1.530147, -0.009050857, 1.423797, 1, 0, 0.3882353, 1,
1.535805, 0.7742628, 1.406443, 1, 0, 0.3843137, 1,
1.538414, -0.3586713, 1.249834, 1, 0, 0.3764706, 1,
1.538504, -1.240578, 2.191687, 1, 0, 0.372549, 1,
1.548624, 0.7300872, -1.149401, 1, 0, 0.3647059, 1,
1.565434, 1.012713, 0.5735108, 1, 0, 0.3607843, 1,
1.566851, 0.2145431, 1.282637, 1, 0, 0.3529412, 1,
1.570518, 0.2712733, 2.287127, 1, 0, 0.3490196, 1,
1.575118, -0.4336707, 0.1260516, 1, 0, 0.3411765, 1,
1.585923, 2.112787, -0.6658232, 1, 0, 0.3372549, 1,
1.606919, 1.5187, -0.4003491, 1, 0, 0.3294118, 1,
1.628847, 0.4674754, 0.3651593, 1, 0, 0.3254902, 1,
1.630029, -3.057691, 1.717413, 1, 0, 0.3176471, 1,
1.633404, -0.3979736, 0.9056117, 1, 0, 0.3137255, 1,
1.649485, -0.2585092, 1.982358, 1, 0, 0.3058824, 1,
1.668867, -1.094744, 2.442786, 1, 0, 0.2980392, 1,
1.670498, 0.8411821, 0.8457515, 1, 0, 0.2941177, 1,
1.673319, -0.5198098, 0.7377828, 1, 0, 0.2862745, 1,
1.677358, 1.111619, 1.553064, 1, 0, 0.282353, 1,
1.695795, 0.2267211, 1.645643, 1, 0, 0.2745098, 1,
1.709814, 0.6441317, 1.239464, 1, 0, 0.2705882, 1,
1.714414, -0.4128163, 2.371799, 1, 0, 0.2627451, 1,
1.74245, -1.112294, 1.506115, 1, 0, 0.2588235, 1,
1.74338, 2.393314, 0.5286998, 1, 0, 0.2509804, 1,
1.746817, -2.223428, 1.919466, 1, 0, 0.2470588, 1,
1.748027, -1.130552, 0.7171267, 1, 0, 0.2392157, 1,
1.754251, 0.1358878, 2.254116, 1, 0, 0.2352941, 1,
1.764446, -0.5438012, 0.1830689, 1, 0, 0.227451, 1,
1.772641, 0.02544162, 1.023264, 1, 0, 0.2235294, 1,
1.784259, -1.536929, 2.995191, 1, 0, 0.2156863, 1,
1.786646, 0.6710247, 1.557662, 1, 0, 0.2117647, 1,
1.795411, -0.4709669, 1.917391, 1, 0, 0.2039216, 1,
1.82768, 2.014146, 1.787059, 1, 0, 0.1960784, 1,
1.830702, 0.5444624, 1.04824, 1, 0, 0.1921569, 1,
1.85374, 0.1657457, 3.803158, 1, 0, 0.1843137, 1,
1.888499, 0.516973, 2.423432, 1, 0, 0.1803922, 1,
1.891006, 0.09780538, 1.732837, 1, 0, 0.172549, 1,
1.893927, -0.9691014, 2.956989, 1, 0, 0.1686275, 1,
1.899345, 1.733733, 0.4788154, 1, 0, 0.1607843, 1,
1.910487, 0.1467988, 2.542227, 1, 0, 0.1568628, 1,
1.997882, -0.8742833, -0.898937, 1, 0, 0.1490196, 1,
2.01884, 0.6630018, 0.3827688, 1, 0, 0.145098, 1,
2.079319, -0.2179394, 1.746509, 1, 0, 0.1372549, 1,
2.099483, -1.08545, -0.1135763, 1, 0, 0.1333333, 1,
2.10151, -0.5358312, 0.9938744, 1, 0, 0.1254902, 1,
2.139626, -0.3988162, 0.894949, 1, 0, 0.1215686, 1,
2.144178, -2.099233, 2.388223, 1, 0, 0.1137255, 1,
2.162205, 0.7589796, 0.8690032, 1, 0, 0.1098039, 1,
2.166714, 0.0974713, 1.047356, 1, 0, 0.1019608, 1,
2.172567, -0.7552881, 0.9896718, 1, 0, 0.09411765, 1,
2.180679, -0.4587995, 0.998229, 1, 0, 0.09019608, 1,
2.181353, -0.6740382, 1.50999, 1, 0, 0.08235294, 1,
2.208399, 0.8437998, 0.7055935, 1, 0, 0.07843138, 1,
2.239743, 1.404042, 1.308174, 1, 0, 0.07058824, 1,
2.267552, 0.5504054, 2.657836, 1, 0, 0.06666667, 1,
2.370076, -1.458336, -0.02142698, 1, 0, 0.05882353, 1,
2.373887, -1.481711, 2.329844, 1, 0, 0.05490196, 1,
2.520857, 1.336902, 0.7178207, 1, 0, 0.04705882, 1,
2.562509, -0.4214586, 0.2217718, 1, 0, 0.04313726, 1,
2.567379, -0.7796243, 1.930715, 1, 0, 0.03529412, 1,
2.61499, -0.2743354, 0.6277974, 1, 0, 0.03137255, 1,
2.617762, -1.014073, 1.886913, 1, 0, 0.02352941, 1,
2.693116, 0.3070708, 1.892817, 1, 0, 0.01960784, 1,
2.754071, -1.101378, 1.512033, 1, 0, 0.01176471, 1,
2.826162, -0.525921, 2.241541, 1, 0, 0.007843138, 1
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
-0.0490247, -4.132442, -7.32163, 0, -0.5, 0.5, 0.5,
-0.0490247, -4.132442, -7.32163, 1, -0.5, 0.5, 0.5,
-0.0490247, -4.132442, -7.32163, 1, 1.5, 0.5, 0.5,
-0.0490247, -4.132442, -7.32163, 0, 1.5, 0.5, 0.5
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
-3.8989, 0.1126658, -7.32163, 0, -0.5, 0.5, 0.5,
-3.8989, 0.1126658, -7.32163, 1, -0.5, 0.5, 0.5,
-3.8989, 0.1126658, -7.32163, 1, 1.5, 0.5, 0.5,
-3.8989, 0.1126658, -7.32163, 0, 1.5, 0.5, 0.5
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
-3.8989, -4.132442, 0.2148461, 0, -0.5, 0.5, 0.5,
-3.8989, -4.132442, 0.2148461, 1, -0.5, 0.5, 0.5,
-3.8989, -4.132442, 0.2148461, 1, 1.5, 0.5, 0.5,
-3.8989, -4.132442, 0.2148461, 0, 1.5, 0.5, 0.5
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
-2, -3.152801, -5.582443,
2, -3.152801, -5.582443,
-2, -3.152801, -5.582443,
-2, -3.316075, -5.872307,
-1, -3.152801, -5.582443,
-1, -3.316075, -5.872307,
0, -3.152801, -5.582443,
0, -3.316075, -5.872307,
1, -3.152801, -5.582443,
1, -3.316075, -5.872307,
2, -3.152801, -5.582443,
2, -3.316075, -5.872307
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
-2, -3.642621, -6.452036, 0, -0.5, 0.5, 0.5,
-2, -3.642621, -6.452036, 1, -0.5, 0.5, 0.5,
-2, -3.642621, -6.452036, 1, 1.5, 0.5, 0.5,
-2, -3.642621, -6.452036, 0, 1.5, 0.5, 0.5,
-1, -3.642621, -6.452036, 0, -0.5, 0.5, 0.5,
-1, -3.642621, -6.452036, 1, -0.5, 0.5, 0.5,
-1, -3.642621, -6.452036, 1, 1.5, 0.5, 0.5,
-1, -3.642621, -6.452036, 0, 1.5, 0.5, 0.5,
0, -3.642621, -6.452036, 0, -0.5, 0.5, 0.5,
0, -3.642621, -6.452036, 1, -0.5, 0.5, 0.5,
0, -3.642621, -6.452036, 1, 1.5, 0.5, 0.5,
0, -3.642621, -6.452036, 0, 1.5, 0.5, 0.5,
1, -3.642621, -6.452036, 0, -0.5, 0.5, 0.5,
1, -3.642621, -6.452036, 1, -0.5, 0.5, 0.5,
1, -3.642621, -6.452036, 1, 1.5, 0.5, 0.5,
1, -3.642621, -6.452036, 0, 1.5, 0.5, 0.5,
2, -3.642621, -6.452036, 0, -0.5, 0.5, 0.5,
2, -3.642621, -6.452036, 1, -0.5, 0.5, 0.5,
2, -3.642621, -6.452036, 1, 1.5, 0.5, 0.5,
2, -3.642621, -6.452036, 0, 1.5, 0.5, 0.5
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
-3.010467, -3, -5.582443,
-3.010467, 3, -5.582443,
-3.010467, -3, -5.582443,
-3.158539, -3, -5.872307,
-3.010467, -2, -5.582443,
-3.158539, -2, -5.872307,
-3.010467, -1, -5.582443,
-3.158539, -1, -5.872307,
-3.010467, 0, -5.582443,
-3.158539, 0, -5.872307,
-3.010467, 1, -5.582443,
-3.158539, 1, -5.872307,
-3.010467, 2, -5.582443,
-3.158539, 2, -5.872307,
-3.010467, 3, -5.582443,
-3.158539, 3, -5.872307
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
-3.454683, -3, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, -3, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, -3, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, -3, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, -2, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, -2, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, -2, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, -2, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, -1, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, -1, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, -1, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, -1, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, 0, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, 0, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, 0, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, 0, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, 1, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, 1, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, 1, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, 1, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, 2, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, 2, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, 2, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, 2, -6.452036, 0, 1.5, 0.5, 0.5,
-3.454683, 3, -6.452036, 0, -0.5, 0.5, 0.5,
-3.454683, 3, -6.452036, 1, -0.5, 0.5, 0.5,
-3.454683, 3, -6.452036, 1, 1.5, 0.5, 0.5,
-3.454683, 3, -6.452036, 0, 1.5, 0.5, 0.5
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
-3.010467, -3.152801, -4,
-3.010467, -3.152801, 4,
-3.010467, -3.152801, -4,
-3.158539, -3.316075, -4,
-3.010467, -3.152801, -2,
-3.158539, -3.316075, -2,
-3.010467, -3.152801, 0,
-3.158539, -3.316075, 0,
-3.010467, -3.152801, 2,
-3.158539, -3.316075, 2,
-3.010467, -3.152801, 4,
-3.158539, -3.316075, 4
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
-3.454683, -3.642621, -4, 0, -0.5, 0.5, 0.5,
-3.454683, -3.642621, -4, 1, -0.5, 0.5, 0.5,
-3.454683, -3.642621, -4, 1, 1.5, 0.5, 0.5,
-3.454683, -3.642621, -4, 0, 1.5, 0.5, 0.5,
-3.454683, -3.642621, -2, 0, -0.5, 0.5, 0.5,
-3.454683, -3.642621, -2, 1, -0.5, 0.5, 0.5,
-3.454683, -3.642621, -2, 1, 1.5, 0.5, 0.5,
-3.454683, -3.642621, -2, 0, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 0, 0, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 0, 1, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 0, 1, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 0, 0, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 2, 0, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 2, 1, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 2, 1, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 2, 0, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 4, 0, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 4, 1, -0.5, 0.5, 0.5,
-3.454683, -3.642621, 4, 1, 1.5, 0.5, 0.5,
-3.454683, -3.642621, 4, 0, 1.5, 0.5, 0.5
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
-3.010467, -3.152801, -5.582443,
-3.010467, 3.378133, -5.582443,
-3.010467, -3.152801, 6.012136,
-3.010467, 3.378133, 6.012136,
-3.010467, -3.152801, -5.582443,
-3.010467, -3.152801, 6.012136,
-3.010467, 3.378133, -5.582443,
-3.010467, 3.378133, 6.012136,
-3.010467, -3.152801, -5.582443,
2.912417, -3.152801, -5.582443,
-3.010467, -3.152801, 6.012136,
2.912417, -3.152801, 6.012136,
-3.010467, 3.378133, -5.582443,
2.912417, 3.378133, -5.582443,
-3.010467, 3.378133, 6.012136,
2.912417, 3.378133, 6.012136,
2.912417, -3.152801, -5.582443,
2.912417, 3.378133, -5.582443,
2.912417, -3.152801, 6.012136,
2.912417, 3.378133, 6.012136,
2.912417, -3.152801, -5.582443,
2.912417, -3.152801, 6.012136,
2.912417, 3.378133, -5.582443,
2.912417, 3.378133, 6.012136
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
var radius = 7.777953;
var distance = 34.60499;
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
mvMatrix.translate( 0.0490247, -0.1126658, -0.2148461 );
mvMatrix.scale( 1.419861, 1.287668, 0.725311 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60499);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
BHC<-read.table("BHC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-BHC$V2
```

```
## Error in eval(expr, envir, enclos): object 'BHC' not found
```

```r
y<-BHC$V3
```

```
## Error in eval(expr, envir, enclos): object 'BHC' not found
```

```r
z<-BHC$V4
```

```
## Error in eval(expr, envir, enclos): object 'BHC' not found
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
-2.924211, -0.3016793, -0.7916714, 0, 0, 1, 1, 1,
-2.884325, -0.6924543, -0.9417916, 1, 0, 0, 1, 1,
-2.676496, -0.04884468, 0.471235, 1, 0, 0, 1, 1,
-2.669387, -0.5753701, -0.9258396, 1, 0, 0, 1, 1,
-2.659477, 1.337877, -1.288833, 1, 0, 0, 1, 1,
-2.590958, 1.821763, -0.1220486, 1, 0, 0, 1, 1,
-2.584334, -0.5688248, -3.260782, 0, 0, 0, 1, 1,
-2.546542, 1.916159, 0.8185119, 0, 0, 0, 1, 1,
-2.447958, -0.2647688, -2.450081, 0, 0, 0, 1, 1,
-2.383989, -2.092877, -1.419592, 0, 0, 0, 1, 1,
-2.350458, 1.784196, -0.4277774, 0, 0, 0, 1, 1,
-2.331228, -0.1959695, -0.9738196, 0, 0, 0, 1, 1,
-2.323743, -0.6292031, -2.413055, 0, 0, 0, 1, 1,
-2.264576, -0.625908, -3.790503, 1, 1, 1, 1, 1,
-2.248708, 0.9597006, 0.0482886, 1, 1, 1, 1, 1,
-2.160465, -0.8995262, -1.05987, 1, 1, 1, 1, 1,
-2.148527, -1.082407, -2.68146, 1, 1, 1, 1, 1,
-2.147556, -0.1207907, -0.2212906, 1, 1, 1, 1, 1,
-2.090384, 0.1214312, -2.974332, 1, 1, 1, 1, 1,
-2.06978, -1.867873, -2.945781, 1, 1, 1, 1, 1,
-2.045948, 0.5986393, -1.698564, 1, 1, 1, 1, 1,
-2.044018, -0.9803488, -3.479078, 1, 1, 1, 1, 1,
-2.010174, -0.5210778, -2.537692, 1, 1, 1, 1, 1,
-1.995813, 0.1354487, -0.8058638, 1, 1, 1, 1, 1,
-1.990302, 1.745719, -0.6051517, 1, 1, 1, 1, 1,
-1.985096, -0.2383232, -2.705071, 1, 1, 1, 1, 1,
-1.968499, 0.2329257, -2.229035, 1, 1, 1, 1, 1,
-1.917034, 1.930596, -2.616003, 1, 1, 1, 1, 1,
-1.904304, -1.021944, -2.003086, 0, 0, 1, 1, 1,
-1.899922, 1.20312, 0.652649, 1, 0, 0, 1, 1,
-1.898822, -0.2420376, 0.224948, 1, 0, 0, 1, 1,
-1.887689, -0.2164558, -1.783189, 1, 0, 0, 1, 1,
-1.873835, -0.4115585, -0.7019442, 1, 0, 0, 1, 1,
-1.867979, -1.158729, -1.405412, 1, 0, 0, 1, 1,
-1.866486, 1.004327, -1.828736, 0, 0, 0, 1, 1,
-1.848453, -1.141703, -1.733341, 0, 0, 0, 1, 1,
-1.830457, -1.34061, -2.107675, 0, 0, 0, 1, 1,
-1.815404, 0.3786278, -1.037843, 0, 0, 0, 1, 1,
-1.814062, -0.6534466, -2.062179, 0, 0, 0, 1, 1,
-1.811769, -1.72865, -2.733459, 0, 0, 0, 1, 1,
-1.810153, -0.6130809, -0.04283738, 0, 0, 0, 1, 1,
-1.803068, -0.1862365, -1.282807, 1, 1, 1, 1, 1,
-1.772106, 1.153315, -1.865287, 1, 1, 1, 1, 1,
-1.765862, 0.774821, -1.013834, 1, 1, 1, 1, 1,
-1.757538, 1.305796, -1.484136, 1, 1, 1, 1, 1,
-1.741943, 1.870636, -2.366708, 1, 1, 1, 1, 1,
-1.741285, -0.01940239, 1.252963, 1, 1, 1, 1, 1,
-1.735373, -0.5499112, -3.188501, 1, 1, 1, 1, 1,
-1.734454, -1.83751, -1.217307, 1, 1, 1, 1, 1,
-1.732423, -1.630705, -2.199635, 1, 1, 1, 1, 1,
-1.72327, -1.347571, -2.497576, 1, 1, 1, 1, 1,
-1.707458, -0.7391686, -1.450247, 1, 1, 1, 1, 1,
-1.701937, -1.378841, -0.8652627, 1, 1, 1, 1, 1,
-1.672602, -0.3741923, -1.283791, 1, 1, 1, 1, 1,
-1.670728, -1.187971, -3.458934, 1, 1, 1, 1, 1,
-1.661174, -0.2855967, -0.6987582, 1, 1, 1, 1, 1,
-1.660884, -0.7311046, -3.44818, 0, 0, 1, 1, 1,
-1.617099, -0.7490052, -3.218992, 1, 0, 0, 1, 1,
-1.602667, -0.5273342, -4.292436, 1, 0, 0, 1, 1,
-1.583918, 0.03175048, -2.948501, 1, 0, 0, 1, 1,
-1.572557, 0.7163791, -0.5406989, 1, 0, 0, 1, 1,
-1.568766, -0.1647586, -2.455043, 1, 0, 0, 1, 1,
-1.547368, 0.5898386, -0.4659795, 0, 0, 0, 1, 1,
-1.543526, -0.1933266, -1.680195, 0, 0, 0, 1, 1,
-1.530056, -1.498847, -2.328895, 0, 0, 0, 1, 1,
-1.5195, -1.010903, -2.745194, 0, 0, 0, 1, 1,
-1.510371, -0.7886496, -3.87957, 0, 0, 0, 1, 1,
-1.506928, 0.5398068, -2.520247, 0, 0, 0, 1, 1,
-1.500995, -1.372114, 0.02707334, 0, 0, 0, 1, 1,
-1.500313, 0.5048586, -2.396304, 1, 1, 1, 1, 1,
-1.489282, 1.194047, -1.066501, 1, 1, 1, 1, 1,
-1.486144, 1.138172, -0.9791527, 1, 1, 1, 1, 1,
-1.465296, 0.0844019, -1.392651, 1, 1, 1, 1, 1,
-1.449231, 1.712233, 0.3042446, 1, 1, 1, 1, 1,
-1.448524, 1.15888, -0.6534685, 1, 1, 1, 1, 1,
-1.447058, -0.5652347, -3.129705, 1, 1, 1, 1, 1,
-1.444922, 0.5564197, -2.872335, 1, 1, 1, 1, 1,
-1.435511, -0.8511453, -0.344837, 1, 1, 1, 1, 1,
-1.417238, -1.61498, -1.82948, 1, 1, 1, 1, 1,
-1.415546, -0.1719453, -1.298252, 1, 1, 1, 1, 1,
-1.414301, -0.6989211, -3.586601, 1, 1, 1, 1, 1,
-1.413963, 0.341135, -1.191429, 1, 1, 1, 1, 1,
-1.409662, -0.8560539, -1.312221, 1, 1, 1, 1, 1,
-1.386167, 1.438604, 0.5205715, 1, 1, 1, 1, 1,
-1.372914, -0.05979643, -2.018863, 0, 0, 1, 1, 1,
-1.36886, -0.3188299, -1.274697, 1, 0, 0, 1, 1,
-1.361535, 0.2512196, -0.1089633, 1, 0, 0, 1, 1,
-1.349638, -0.7518488, -2.812256, 1, 0, 0, 1, 1,
-1.344182, 1.546876, -1.193575, 1, 0, 0, 1, 1,
-1.340332, 0.9256313, -0.7433138, 1, 0, 0, 1, 1,
-1.33439, 0.3919364, 0.9861743, 0, 0, 0, 1, 1,
-1.326749, -0.6659684, -1.718112, 0, 0, 0, 1, 1,
-1.323532, 0.7747701, 0.089873, 0, 0, 0, 1, 1,
-1.318716, -1.093021, -0.6492392, 0, 0, 0, 1, 1,
-1.31694, -0.07814945, -1.536345, 0, 0, 0, 1, 1,
-1.313605, -0.8540389, -1.976836, 0, 0, 0, 1, 1,
-1.307608, -0.1255397, -2.699679, 0, 0, 0, 1, 1,
-1.306013, -0.184037, -1.05703, 1, 1, 1, 1, 1,
-1.286811, -1.495984, -1.403234, 1, 1, 1, 1, 1,
-1.282656, -0.8414775, -2.517789, 1, 1, 1, 1, 1,
-1.278336, 0.00175024, -0.1465917, 1, 1, 1, 1, 1,
-1.278256, 1.105109, 0.01407784, 1, 1, 1, 1, 1,
-1.278018, -2.144154, -3.454817, 1, 1, 1, 1, 1,
-1.271256, -1.182018, -2.762538, 1, 1, 1, 1, 1,
-1.259225, -0.3211996, -2.345837, 1, 1, 1, 1, 1,
-1.25617, 0.6200036, -0.09243832, 1, 1, 1, 1, 1,
-1.253527, -0.8139167, -2.285996, 1, 1, 1, 1, 1,
-1.253182, 0.2685302, -0.7331139, 1, 1, 1, 1, 1,
-1.240681, 0.2731646, -1.100251, 1, 1, 1, 1, 1,
-1.238019, 0.7563562, -0.8385139, 1, 1, 1, 1, 1,
-1.23717, 0.7290156, -1.43184, 1, 1, 1, 1, 1,
-1.222071, -1.226451, -1.098048, 1, 1, 1, 1, 1,
-1.212585, -0.9557092, -2.082144, 0, 0, 1, 1, 1,
-1.208435, -0.1646902, -1.87983, 1, 0, 0, 1, 1,
-1.200466, 1.69544, -2.375596, 1, 0, 0, 1, 1,
-1.196602, -1.630493, -1.374739, 1, 0, 0, 1, 1,
-1.195003, -0.3347647, -0.2063468, 1, 0, 0, 1, 1,
-1.191161, -1.186222, -2.486068, 1, 0, 0, 1, 1,
-1.179549, 0.5169521, -1.777006, 0, 0, 0, 1, 1,
-1.17217, 0.3250543, 0.3056688, 0, 0, 0, 1, 1,
-1.169897, -0.9339533, -3.360001, 0, 0, 0, 1, 1,
-1.159302, 1.263814, -0.597628, 0, 0, 0, 1, 1,
-1.155985, -0.08470577, -1.860102, 0, 0, 0, 1, 1,
-1.152162, -0.7188971, -2.858564, 0, 0, 0, 1, 1,
-1.151029, 0.740822, -2.408719, 0, 0, 0, 1, 1,
-1.145354, -1.333063, -1.543657, 1, 1, 1, 1, 1,
-1.127662, -1.448818, -2.426831, 1, 1, 1, 1, 1,
-1.125478, -0.8507236, -4.269044, 1, 1, 1, 1, 1,
-1.125223, -1.046727, -2.608215, 1, 1, 1, 1, 1,
-1.113385, -0.5489893, -0.83232, 1, 1, 1, 1, 1,
-1.110879, -0.2347389, -1.969935, 1, 1, 1, 1, 1,
-1.108309, -0.3069468, -1.792862, 1, 1, 1, 1, 1,
-1.108115, -1.819794, -3.067951, 1, 1, 1, 1, 1,
-1.106181, -0.3384859, -0.8243623, 1, 1, 1, 1, 1,
-1.09717, -0.3712785, -2.368866, 1, 1, 1, 1, 1,
-1.093706, -2.223897, -1.468033, 1, 1, 1, 1, 1,
-1.089468, 1.201126, -1.412768, 1, 1, 1, 1, 1,
-1.086872, -0.5997649, -2.279915, 1, 1, 1, 1, 1,
-1.081306, -1.876897, -1.932814, 1, 1, 1, 1, 1,
-1.068648, 1.817858, 1.696228, 1, 1, 1, 1, 1,
-1.065792, -0.7600596, -2.217139, 0, 0, 1, 1, 1,
-1.048557, -0.2938425, -0.8272472, 1, 0, 0, 1, 1,
-1.045785, 0.8637041, -1.651301, 1, 0, 0, 1, 1,
-1.045166, 0.6491382, -1.427673, 1, 0, 0, 1, 1,
-1.042175, 0.08504473, -1.273169, 1, 0, 0, 1, 1,
-1.038834, 1.326577, -0.1970539, 1, 0, 0, 1, 1,
-1.036577, 0.6728401, -1.034264, 0, 0, 0, 1, 1,
-1.033261, -2.296845, -1.025247, 0, 0, 0, 1, 1,
-1.030431, 1.445924, -0.5968596, 0, 0, 0, 1, 1,
-1.029267, -0.60047, -2.301841, 0, 0, 0, 1, 1,
-1.02125, 0.2787288, -1.983381, 0, 0, 0, 1, 1,
-1.005775, 1.119823, -0.7936018, 0, 0, 0, 1, 1,
-1.001166, -0.8593827, -2.918064, 0, 0, 0, 1, 1,
-1.000235, -0.8917079, -1.673514, 1, 1, 1, 1, 1,
-0.9949554, 0.6568544, -2.398521, 1, 1, 1, 1, 1,
-0.9900249, 1.917149, -0.6578103, 1, 1, 1, 1, 1,
-0.9879262, 0.395156, -1.057853, 1, 1, 1, 1, 1,
-0.9866983, 2.498059, 0.9954414, 1, 1, 1, 1, 1,
-0.9796534, 0.5088947, -2.505402, 1, 1, 1, 1, 1,
-0.9727059, -0.4542723, -1.938438, 1, 1, 1, 1, 1,
-0.9722744, -1.41198, -3.268582, 1, 1, 1, 1, 1,
-0.9702549, 0.03442258, -2.097323, 1, 1, 1, 1, 1,
-0.9681988, 0.9894115, 0.6677842, 1, 1, 1, 1, 1,
-0.9674997, 0.7010258, -0.8851268, 1, 1, 1, 1, 1,
-0.9674956, -1.536882, -3.351265, 1, 1, 1, 1, 1,
-0.9628655, -1.278949, -2.366463, 1, 1, 1, 1, 1,
-0.9574312, 1.140469, -0.09172776, 1, 1, 1, 1, 1,
-0.9512028, -0.2113974, -2.329103, 1, 1, 1, 1, 1,
-0.9507293, 0.1576666, -0.6630384, 0, 0, 1, 1, 1,
-0.9500451, 0.1372091, -1.043809, 1, 0, 0, 1, 1,
-0.943956, -0.3419609, -1.112051, 1, 0, 0, 1, 1,
-0.9400809, -1.874818, -2.876772, 1, 0, 0, 1, 1,
-0.9397894, 0.4500313, -1.334863, 1, 0, 0, 1, 1,
-0.9341546, -1.18092, -2.358205, 1, 0, 0, 1, 1,
-0.9328838, -0.8648964, -0.7573388, 0, 0, 0, 1, 1,
-0.9294822, -0.2169176, -3.428224, 0, 0, 0, 1, 1,
-0.9284554, 1.758187, -1.354048, 0, 0, 0, 1, 1,
-0.9243364, -0.6016731, -1.43617, 0, 0, 0, 1, 1,
-0.923254, 0.07323921, -1.017382, 0, 0, 0, 1, 1,
-0.9226477, -0.6395634, -1.597492, 0, 0, 0, 1, 1,
-0.9189926, -0.9226741, -1.101973, 0, 0, 0, 1, 1,
-0.9154469, -0.08872018, -1.189083, 1, 1, 1, 1, 1,
-0.910509, -1.560332, -2.133327, 1, 1, 1, 1, 1,
-0.9103303, -0.4271436, -1.419348, 1, 1, 1, 1, 1,
-0.9059228, -0.05442331, -1.161777, 1, 1, 1, 1, 1,
-0.905669, -1.047189, -2.616741, 1, 1, 1, 1, 1,
-0.8992777, -1.892648, -2.256115, 1, 1, 1, 1, 1,
-0.8942818, -0.7438377, -1.209953, 1, 1, 1, 1, 1,
-0.8910587, 3.283022, -0.698512, 1, 1, 1, 1, 1,
-0.8893014, -0.4572492, -2.866933, 1, 1, 1, 1, 1,
-0.8807744, 1.931485, -1.32435, 1, 1, 1, 1, 1,
-0.8736224, -0.0531306, -0.8743972, 1, 1, 1, 1, 1,
-0.8682489, -0.9657808, -1.172773, 1, 1, 1, 1, 1,
-0.8574881, -1.192273, -2.177824, 1, 1, 1, 1, 1,
-0.8423936, 1.151374, -0.2758567, 1, 1, 1, 1, 1,
-0.8418376, -1.291515, -3.347716, 1, 1, 1, 1, 1,
-0.8403422, -0.7589856, -1.477674, 0, 0, 1, 1, 1,
-0.8374688, -0.3066939, -3.657563, 1, 0, 0, 1, 1,
-0.8372676, -0.1509862, -1.674359, 1, 0, 0, 1, 1,
-0.8314378, 0.6506433, -2.323332, 1, 0, 0, 1, 1,
-0.8290146, -0.5760814, -3.335463, 1, 0, 0, 1, 1,
-0.8287717, 0.7917663, 0.3232533, 1, 0, 0, 1, 1,
-0.8284468, -1.042188, -3.090822, 0, 0, 0, 1, 1,
-0.8281297, -1.472619, -3.040142, 0, 0, 0, 1, 1,
-0.8235068, -0.8400075, -3.162918, 0, 0, 0, 1, 1,
-0.8184137, 1.379044, -0.8801421, 0, 0, 0, 1, 1,
-0.8179615, -0.1074716, -1.22923, 0, 0, 0, 1, 1,
-0.8170803, -0.628482, -1.877909, 0, 0, 0, 1, 1,
-0.8125789, -0.3675617, -4.203396, 0, 0, 0, 1, 1,
-0.8118802, 0.5250929, -1.015828, 1, 1, 1, 1, 1,
-0.8114592, -1.006399, -2.441754, 1, 1, 1, 1, 1,
-0.8085513, -0.091444, -3.10102, 1, 1, 1, 1, 1,
-0.8075895, -1.027834, -1.104695, 1, 1, 1, 1, 1,
-0.8048043, -0.2966315, -2.147477, 1, 1, 1, 1, 1,
-0.8017363, -0.4082709, -1.893416, 1, 1, 1, 1, 1,
-0.8015109, 1.56671, 0.4364013, 1, 1, 1, 1, 1,
-0.8007516, -0.5717369, -2.258249, 1, 1, 1, 1, 1,
-0.793761, -1.258333, -3.726001, 1, 1, 1, 1, 1,
-0.785911, 0.7923424, -0.7403456, 1, 1, 1, 1, 1,
-0.7822366, 1.30977, 0.5791441, 1, 1, 1, 1, 1,
-0.7813996, -0.1894257, -0.8665242, 1, 1, 1, 1, 1,
-0.7809911, 0.4059354, -1.686965, 1, 1, 1, 1, 1,
-0.7696083, -0.7184753, -1.553062, 1, 1, 1, 1, 1,
-0.7656681, 0.8574541, -1.559368, 1, 1, 1, 1, 1,
-0.763096, 0.5293555, -0.1671437, 0, 0, 1, 1, 1,
-0.7535208, 0.3870923, -1.355142, 1, 0, 0, 1, 1,
-0.7532411, 0.7313861, -1.852996, 1, 0, 0, 1, 1,
-0.7430012, 0.109624, 0.3048913, 1, 0, 0, 1, 1,
-0.7390433, 0.280426, -1.637502, 1, 0, 0, 1, 1,
-0.7381692, 0.2417019, -2.395483, 1, 0, 0, 1, 1,
-0.7344079, -0.828845, -1.348892, 0, 0, 0, 1, 1,
-0.7319852, 1.303184, -1.71481, 0, 0, 0, 1, 1,
-0.7135054, -0.1250552, -1.537112, 0, 0, 0, 1, 1,
-0.7106251, 0.07484606, -1.583969, 0, 0, 0, 1, 1,
-0.7095498, 0.3486036, -1.646366, 0, 0, 0, 1, 1,
-0.7086283, 1.168831, -1.292737, 0, 0, 0, 1, 1,
-0.7045147, -0.01567305, -1.815829, 0, 0, 0, 1, 1,
-0.6989145, 0.07958364, -2.195251, 1, 1, 1, 1, 1,
-0.6950763, 1.846539, 1.273424, 1, 1, 1, 1, 1,
-0.694425, 0.9857906, -1.511909, 1, 1, 1, 1, 1,
-0.6928165, -1.137056, -3.780442, 1, 1, 1, 1, 1,
-0.6906817, 0.1674021, -1.188889, 1, 1, 1, 1, 1,
-0.6867051, -1.213724, -2.383376, 1, 1, 1, 1, 1,
-0.685104, 0.09030026, -0.5418848, 1, 1, 1, 1, 1,
-0.6773933, 0.429431, -1.015084, 1, 1, 1, 1, 1,
-0.6734771, -0.6686166, -4.787798, 1, 1, 1, 1, 1,
-0.6731209, 0.2376991, -0.5505842, 1, 1, 1, 1, 1,
-0.6730649, -0.5022207, -1.93682, 1, 1, 1, 1, 1,
-0.6725815, -1.810551, -1.802714, 1, 1, 1, 1, 1,
-0.6713769, 1.529083, -0.9278055, 1, 1, 1, 1, 1,
-0.6705893, -0.7702896, -1.974662, 1, 1, 1, 1, 1,
-0.6691192, -0.1571613, -2.736567, 1, 1, 1, 1, 1,
-0.6667323, 0.6219198, -2.274547, 0, 0, 1, 1, 1,
-0.6643972, -0.4907658, -0.8136767, 1, 0, 0, 1, 1,
-0.663831, 0.2959929, -0.5486186, 1, 0, 0, 1, 1,
-0.6624974, 0.3214798, 0.3660966, 1, 0, 0, 1, 1,
-0.661032, 1.015289, 0.1078925, 1, 0, 0, 1, 1,
-0.660404, -0.4387704, -0.70332, 1, 0, 0, 1, 1,
-0.6575013, 1.206932, -0.1368581, 0, 0, 0, 1, 1,
-0.6547253, 1.969673, -1.604857, 0, 0, 0, 1, 1,
-0.6543651, -0.8010684, -2.653194, 0, 0, 0, 1, 1,
-0.654097, -2.18901, -1.938471, 0, 0, 0, 1, 1,
-0.6498005, 1.86954, -0.329072, 0, 0, 0, 1, 1,
-0.6460115, 1.255785, -0.04702683, 0, 0, 0, 1, 1,
-0.6392853, -0.2776727, -2.14997, 0, 0, 0, 1, 1,
-0.6379606, 1.947458, 0.4550833, 1, 1, 1, 1, 1,
-0.6365871, 0.1338473, -1.380042, 1, 1, 1, 1, 1,
-0.6345198, 0.1328954, -3.277644, 1, 1, 1, 1, 1,
-0.6332771, 1.364793, 1.424744, 1, 1, 1, 1, 1,
-0.6306008, -0.2088277, -2.08626, 1, 1, 1, 1, 1,
-0.6271554, 0.7251809, -0.3767153, 1, 1, 1, 1, 1,
-0.6211666, 2.572085, -1.863752, 1, 1, 1, 1, 1,
-0.6208119, -0.08049686, -3.445349, 1, 1, 1, 1, 1,
-0.6201529, -0.9162, -4.382154, 1, 1, 1, 1, 1,
-0.6155225, 0.3448731, -2.483957, 1, 1, 1, 1, 1,
-0.6143414, -0.3410105, -2.007255, 1, 1, 1, 1, 1,
-0.6080981, 0.1795533, -1.063368, 1, 1, 1, 1, 1,
-0.6052056, -0.5622432, -1.111389, 1, 1, 1, 1, 1,
-0.592464, 0.1720372, -0.8102399, 1, 1, 1, 1, 1,
-0.5918221, -1.229647, -2.436687, 1, 1, 1, 1, 1,
-0.5905737, 0.4696996, -0.1099202, 0, 0, 1, 1, 1,
-0.5898885, 0.6939167, 0.01331463, 1, 0, 0, 1, 1,
-0.585619, -1.012933, -2.946562, 1, 0, 0, 1, 1,
-0.5835903, -0.4292225, -2.414673, 1, 0, 0, 1, 1,
-0.5814627, 0.4633679, -2.586384, 1, 0, 0, 1, 1,
-0.5767204, 1.03705, -1.371225, 1, 0, 0, 1, 1,
-0.5751306, 0.4041756, -1.588562, 0, 0, 0, 1, 1,
-0.5677073, 0.3028975, -1.440119, 0, 0, 0, 1, 1,
-0.5657815, -0.4966689, -2.497195, 0, 0, 0, 1, 1,
-0.5618897, -0.5522607, -3.677562, 0, 0, 0, 1, 1,
-0.552641, -1.323558, -2.44799, 0, 0, 0, 1, 1,
-0.5490987, 0.2174945, -3.354222, 0, 0, 0, 1, 1,
-0.5463528, 1.071697, 1.1682, 0, 0, 0, 1, 1,
-0.5450983, 1.049834, -0.8212448, 1, 1, 1, 1, 1,
-0.5388041, -2.376375, -2.496169, 1, 1, 1, 1, 1,
-0.5359443, 0.6037958, -1.404901, 1, 1, 1, 1, 1,
-0.5352113, 1.10231, -0.5725409, 1, 1, 1, 1, 1,
-0.5346654, -1.443258, -3.550499, 1, 1, 1, 1, 1,
-0.533383, 0.3691205, 0.06717832, 1, 1, 1, 1, 1,
-0.5308853, -0.5768746, -2.482292, 1, 1, 1, 1, 1,
-0.5258634, -0.1734408, -2.427687, 1, 1, 1, 1, 1,
-0.5242392, -1.440214, -2.441137, 1, 1, 1, 1, 1,
-0.5200903, -0.9445215, -1.763079, 1, 1, 1, 1, 1,
-0.5114534, -0.499375, -2.317467, 1, 1, 1, 1, 1,
-0.4990762, -1.321714, -4.142344, 1, 1, 1, 1, 1,
-0.4990044, -0.8507021, -3.335719, 1, 1, 1, 1, 1,
-0.4959935, 0.3922067, -0.3587738, 1, 1, 1, 1, 1,
-0.4875637, -0.3978437, -2.251839, 1, 1, 1, 1, 1,
-0.4870148, -1.222486, -2.866198, 0, 0, 1, 1, 1,
-0.4828105, -2.231938, -2.793526, 1, 0, 0, 1, 1,
-0.4825843, -1.710814, -2.345055, 1, 0, 0, 1, 1,
-0.4804963, -1.279895, -2.313232, 1, 0, 0, 1, 1,
-0.4778246, 0.2385858, -4.004372, 1, 0, 0, 1, 1,
-0.4774716, 0.5807866, -1.694266, 1, 0, 0, 1, 1,
-0.4735499, -0.4559136, -1.529754, 0, 0, 0, 1, 1,
-0.4735498, -1.794006, -2.723704, 0, 0, 0, 1, 1,
-0.4695965, 0.9151244, 0.6015414, 0, 0, 0, 1, 1,
-0.4674691, 0.3226579, -1.471035, 0, 0, 0, 1, 1,
-0.4666376, 0.7360867, -0.1183207, 0, 0, 0, 1, 1,
-0.4647321, 1.982925, -0.2516019, 0, 0, 0, 1, 1,
-0.4630074, 2.812648, 1.00613, 0, 0, 0, 1, 1,
-0.4622368, 0.7089838, -2.280442, 1, 1, 1, 1, 1,
-0.4621054, -0.5204518, -3.385593, 1, 1, 1, 1, 1,
-0.4620871, -0.1820755, -1.233552, 1, 1, 1, 1, 1,
-0.4593323, -0.3271413, -0.8017749, 1, 1, 1, 1, 1,
-0.459141, 0.6613455, -0.8581713, 1, 1, 1, 1, 1,
-0.4495167, 0.8441236, -1.163467, 1, 1, 1, 1, 1,
-0.447074, -1.266818, -1.271502, 1, 1, 1, 1, 1,
-0.4440158, -0.6259902, -2.523008, 1, 1, 1, 1, 1,
-0.4410599, 1.891044, 1.08629, 1, 1, 1, 1, 1,
-0.4404705, 0.7243485, -1.152525, 1, 1, 1, 1, 1,
-0.43799, 1.682262, -0.9152815, 1, 1, 1, 1, 1,
-0.4372768, -0.9395087, -2.779532, 1, 1, 1, 1, 1,
-0.4371336, 0.5562396, -2.004353, 1, 1, 1, 1, 1,
-0.4359044, 0.7513925, -0.6003696, 1, 1, 1, 1, 1,
-0.4356126, -0.4751871, -2.873168, 1, 1, 1, 1, 1,
-0.4310861, 0.952965, 0.3597924, 0, 0, 1, 1, 1,
-0.426003, 0.4963414, -0.7732267, 1, 0, 0, 1, 1,
-0.4252186, 1.222852, 2.294543, 1, 0, 0, 1, 1,
-0.4247561, 1.322816, -0.3422326, 1, 0, 0, 1, 1,
-0.4243069, -0.1052229, -0.8744964, 1, 0, 0, 1, 1,
-0.4233157, -1.659225, -3.463867, 1, 0, 0, 1, 1,
-0.4214212, 0.8180349, -0.4905895, 0, 0, 0, 1, 1,
-0.4155512, 1.344936, -0.9693426, 0, 0, 0, 1, 1,
-0.4153323, -0.2731932, -1.297068, 0, 0, 0, 1, 1,
-0.4143393, -1.805751, -4.041829, 0, 0, 0, 1, 1,
-0.4125458, -0.5493433, -2.505742, 0, 0, 0, 1, 1,
-0.4095716, 0.494279, -0.05608696, 0, 0, 0, 1, 1,
-0.4073889, -0.1109055, -2.876775, 0, 0, 0, 1, 1,
-0.4066402, -1.289254, -1.500961, 1, 1, 1, 1, 1,
-0.4047159, -0.01686037, -1.815171, 1, 1, 1, 1, 1,
-0.3997207, 1.085535, 0.08162709, 1, 1, 1, 1, 1,
-0.3921466, -0.7860527, -2.356605, 1, 1, 1, 1, 1,
-0.390134, -1.351514, -3.403491, 1, 1, 1, 1, 1,
-0.3867545, -0.3508936, -2.569521, 1, 1, 1, 1, 1,
-0.3863693, -0.2215433, -0.3219484, 1, 1, 1, 1, 1,
-0.3861044, 0.00478322, -0.7928953, 1, 1, 1, 1, 1,
-0.3792189, -0.388384, -1.000309, 1, 1, 1, 1, 1,
-0.3748754, 0.6641563, -1.25169, 1, 1, 1, 1, 1,
-0.3528989, 0.5041935, -1.140831, 1, 1, 1, 1, 1,
-0.3525764, -0.8777403, -2.805614, 1, 1, 1, 1, 1,
-0.3499506, 0.1129434, 0.6022283, 1, 1, 1, 1, 1,
-0.3499306, 1.664338, 0.08780205, 1, 1, 1, 1, 1,
-0.3495984, -0.206236, -1.923006, 1, 1, 1, 1, 1,
-0.3459924, -0.6015583, -2.037153, 0, 0, 1, 1, 1,
-0.3344081, 0.2707755, 0.9184904, 1, 0, 0, 1, 1,
-0.3248026, 0.2808447, -1.019387, 1, 0, 0, 1, 1,
-0.3216677, -0.6773861, -2.942775, 1, 0, 0, 1, 1,
-0.3181367, -1.310331, -2.856848, 1, 0, 0, 1, 1,
-0.3138325, -0.9024745, -3.113171, 1, 0, 0, 1, 1,
-0.3015668, -0.6564647, -4.142445, 0, 0, 0, 1, 1,
-0.3011913, -0.04173189, -1.797913, 0, 0, 0, 1, 1,
-0.3000174, 0.4013991, -0.6326638, 0, 0, 0, 1, 1,
-0.2964186, -1.005276, -2.28516, 0, 0, 0, 1, 1,
-0.2953791, 0.6799036, -0.2045099, 0, 0, 0, 1, 1,
-0.2931281, 0.3528549, 0.8837317, 0, 0, 0, 1, 1,
-0.2929784, -0.6163309, -0.349795, 0, 0, 0, 1, 1,
-0.2910308, -1.134215, -3.115541, 1, 1, 1, 1, 1,
-0.2892073, -0.5562165, -1.985067, 1, 1, 1, 1, 1,
-0.2829738, 1.188156, -2.68889, 1, 1, 1, 1, 1,
-0.2817045, 1.098246, 0.2015851, 1, 1, 1, 1, 1,
-0.2812264, 1.136787, -0.1981303, 1, 1, 1, 1, 1,
-0.2761579, 0.3069214, -0.2136669, 1, 1, 1, 1, 1,
-0.2738753, -1.143478, -2.073982, 1, 1, 1, 1, 1,
-0.2647477, 0.3834839, -0.6111308, 1, 1, 1, 1, 1,
-0.2635868, -0.6091741, -2.484282, 1, 1, 1, 1, 1,
-0.2594973, -0.007340751, -2.403433, 1, 1, 1, 1, 1,
-0.2560462, 1.144619, 0.7814783, 1, 1, 1, 1, 1,
-0.255422, -1.408515, -2.461509, 1, 1, 1, 1, 1,
-0.2540695, 1.54101, -1.563196, 1, 1, 1, 1, 1,
-0.2540151, 0.1420386, -0.830249, 1, 1, 1, 1, 1,
-0.2418493, -0.7360406, -0.6942919, 1, 1, 1, 1, 1,
-0.2376388, -0.6257371, -2.601817, 0, 0, 1, 1, 1,
-0.2370495, 0.6772413, -1.509732, 1, 0, 0, 1, 1,
-0.2342963, -1.899315, -2.301343, 1, 0, 0, 1, 1,
-0.2314335, -1.697352, -3.125221, 1, 0, 0, 1, 1,
-0.2309355, -0.9751346, -2.803507, 1, 0, 0, 1, 1,
-0.2302512, -2.327181, -5.41359, 1, 0, 0, 1, 1,
-0.2301493, 1.637626, 0.05560896, 0, 0, 0, 1, 1,
-0.2276088, -0.3801714, -3.309097, 0, 0, 0, 1, 1,
-0.2241983, -1.169247, -4.999543, 0, 0, 0, 1, 1,
-0.2238723, -0.008573357, -1.15127, 0, 0, 0, 1, 1,
-0.2219852, 0.7474544, -0.2963732, 0, 0, 0, 1, 1,
-0.220094, 0.3879502, -0.4328583, 0, 0, 0, 1, 1,
-0.218277, -1.228756, -2.826519, 0, 0, 0, 1, 1,
-0.2171074, -0.04860701, -1.445527, 1, 1, 1, 1, 1,
-0.215952, 0.4779995, -1.268051, 1, 1, 1, 1, 1,
-0.2137102, -0.4404982, -2.863223, 1, 1, 1, 1, 1,
-0.2099672, -1.200042, -2.055368, 1, 1, 1, 1, 1,
-0.2069206, 1.322969, -0.797062, 1, 1, 1, 1, 1,
-0.2032504, -1.588586, -3.769164, 1, 1, 1, 1, 1,
-0.2025261, -0.5299873, -3.67485, 1, 1, 1, 1, 1,
-0.2012846, -1.243887, -3.628745, 1, 1, 1, 1, 1,
-0.1997545, -0.7191287, -4.269804, 1, 1, 1, 1, 1,
-0.1989135, -1.072585, -3.473731, 1, 1, 1, 1, 1,
-0.1974079, -0.165595, -3.64167, 1, 1, 1, 1, 1,
-0.1965054, -0.8347774, -2.983439, 1, 1, 1, 1, 1,
-0.1964601, 1.124017, 0.01415705, 1, 1, 1, 1, 1,
-0.1964266, -0.2035127, -1.998683, 1, 1, 1, 1, 1,
-0.1939251, 0.5203235, -1.217701, 1, 1, 1, 1, 1,
-0.1912125, 0.0852455, -1.395071, 0, 0, 1, 1, 1,
-0.1824246, -1.910973, -3.010369, 1, 0, 0, 1, 1,
-0.182019, -0.6799772, -2.018603, 1, 0, 0, 1, 1,
-0.1805866, -2.017975, -2.19743, 1, 0, 0, 1, 1,
-0.1760775, -0.8763759, -3.582844, 1, 0, 0, 1, 1,
-0.1731621, -1.2555, -4.015448, 1, 0, 0, 1, 1,
-0.1703734, -0.4977876, -2.519186, 0, 0, 0, 1, 1,
-0.1631314, -1.981233, -2.889468, 0, 0, 0, 1, 1,
-0.1564645, 1.797871, 1.128215, 0, 0, 0, 1, 1,
-0.1546294, 0.03265639, -1.509127, 0, 0, 0, 1, 1,
-0.1530467, -0.5796195, -0.8240373, 0, 0, 0, 1, 1,
-0.152375, 0.4460817, -0.0455185, 0, 0, 0, 1, 1,
-0.1503666, -0.9745538, -1.90859, 0, 0, 0, 1, 1,
-0.1458393, 0.2408388, -1.114185, 1, 1, 1, 1, 1,
-0.1452129, 0.6742944, 0.2884536, 1, 1, 1, 1, 1,
-0.1426916, -0.8696126, -3.58788, 1, 1, 1, 1, 1,
-0.1425773, 0.2767646, 0.5958933, 1, 1, 1, 1, 1,
-0.1395439, 0.2346773, -0.8513548, 1, 1, 1, 1, 1,
-0.1345481, -0.03004242, -0.08762641, 1, 1, 1, 1, 1,
-0.1343622, -1.485859, -4.336159, 1, 1, 1, 1, 1,
-0.1310446, 0.2427588, -1.32793, 1, 1, 1, 1, 1,
-0.1288242, -1.069693, -3.315006, 1, 1, 1, 1, 1,
-0.1275382, 1.024256, -0.2474464, 1, 1, 1, 1, 1,
-0.1242541, 1.321033, -0.4295966, 1, 1, 1, 1, 1,
-0.1235514, -0.06496935, -1.602503, 1, 1, 1, 1, 1,
-0.1119345, -0.3905677, -4.872731, 1, 1, 1, 1, 1,
-0.1057616, -0.4588849, -3.527164, 1, 1, 1, 1, 1,
-0.1022146, 0.3634391, -1.501305, 1, 1, 1, 1, 1,
-0.1021149, -1.087783, -2.086644, 0, 0, 1, 1, 1,
-0.0997887, 1.041969, 0.9399996, 1, 0, 0, 1, 1,
-0.09911899, -0.1792963, -1.484809, 1, 0, 0, 1, 1,
-0.09743163, -1.268696, -3.448696, 1, 0, 0, 1, 1,
-0.09437057, 2.810866, 0.1193177, 1, 0, 0, 1, 1,
-0.09374867, 0.1931588, -2.185261, 1, 0, 0, 1, 1,
-0.09240773, -0.2158545, -3.397597, 0, 0, 0, 1, 1,
-0.0920894, 0.4150404, -0.9916151, 0, 0, 0, 1, 1,
-0.09004951, 1.196162, 0.1919584, 0, 0, 0, 1, 1,
-0.08530213, 0.8235536, 0.7597234, 0, 0, 0, 1, 1,
-0.08509705, -1.560126, -3.937393, 0, 0, 0, 1, 1,
-0.0846689, 0.1778906, 0.6378438, 0, 0, 0, 1, 1,
-0.08396957, 0.8056731, -0.9131458, 0, 0, 0, 1, 1,
-0.08374627, 0.004887053, -1.535702, 1, 1, 1, 1, 1,
-0.08361105, 0.2358385, 1.06698, 1, 1, 1, 1, 1,
-0.07939808, 1.016533, 1.621081, 1, 1, 1, 1, 1,
-0.07875873, -0.3438461, -3.246973, 1, 1, 1, 1, 1,
-0.07613106, -0.08472305, -2.174969, 1, 1, 1, 1, 1,
-0.07557481, -0.002821296, -1.384059, 1, 1, 1, 1, 1,
-0.06672669, -0.3486854, -3.6598, 1, 1, 1, 1, 1,
-0.06425036, 0.5717325, -1.055998, 1, 1, 1, 1, 1,
-0.06363424, -1.413546, -4.571749, 1, 1, 1, 1, 1,
-0.06197998, 0.9164934, 0.5345846, 1, 1, 1, 1, 1,
-0.06117499, 1.144115, -0.8579436, 1, 1, 1, 1, 1,
-0.06001713, -0.04237211, -1.212592, 1, 1, 1, 1, 1,
-0.05889153, 0.6779716, -0.7403885, 1, 1, 1, 1, 1,
-0.05689862, 0.38937, -0.653673, 1, 1, 1, 1, 1,
-0.05624855, 1.318478, -0.575314, 1, 1, 1, 1, 1,
-0.05530789, 1.00565, -1.962994, 0, 0, 1, 1, 1,
-0.05364691, 0.3016511, 1.39743, 1, 0, 0, 1, 1,
-0.05358958, 0.8219579, 0.8471848, 1, 0, 0, 1, 1,
-0.05097595, -1.399733, -3.016396, 1, 0, 0, 1, 1,
-0.0498606, -0.3577375, -3.2916, 1, 0, 0, 1, 1,
-0.04405872, -0.346406, -2.282498, 1, 0, 0, 1, 1,
-0.04105642, 0.3474149, 0.9863549, 0, 0, 0, 1, 1,
-0.03928115, 1.486614, 2.632368, 0, 0, 0, 1, 1,
-0.0389859, -0.08486645, -3.442175, 0, 0, 0, 1, 1,
-0.03770969, 0.6918085, 1.873608, 0, 0, 0, 1, 1,
-0.03454932, 0.5729185, -0.1684321, 0, 0, 0, 1, 1,
-0.03206203, 0.7866742, -0.07452273, 0, 0, 0, 1, 1,
-0.02780769, -0.0326732, -2.039804, 0, 0, 0, 1, 1,
-0.02678359, 0.491758, -0.1839568, 1, 1, 1, 1, 1,
-0.02538005, -0.278011, -4.795956, 1, 1, 1, 1, 1,
-0.02465791, -0.2797048, -4.207347, 1, 1, 1, 1, 1,
-0.02292289, -0.7967602, -4.460884, 1, 1, 1, 1, 1,
-0.0173453, 0.5385509, 0.2266615, 1, 1, 1, 1, 1,
-0.01547924, 0.2236717, -1.296116, 1, 1, 1, 1, 1,
-0.01463173, 0.03253508, -1.007082, 1, 1, 1, 1, 1,
-0.0145694, 0.4057738, -0.1572879, 1, 1, 1, 1, 1,
-0.01415088, -0.4710841, -4.097649, 1, 1, 1, 1, 1,
-0.01394935, 0.4269015, 0.991922, 1, 1, 1, 1, 1,
-0.0132487, -1.041072, -4.028779, 1, 1, 1, 1, 1,
-0.01220149, 0.06372429, -0.07616488, 1, 1, 1, 1, 1,
-0.01167445, 0.2240483, -0.9120792, 1, 1, 1, 1, 1,
-0.009189363, 0.6019368, 1.167559, 1, 1, 1, 1, 1,
-0.008938844, 0.4446786, 0.7013756, 1, 1, 1, 1, 1,
-0.008600276, -0.00414166, -2.88558, 0, 0, 1, 1, 1,
-0.001141238, -0.8550442, -3.543213, 1, 0, 0, 1, 1,
-0.0009266209, 1.822437, -0.610639, 1, 0, 0, 1, 1,
0.002089552, 1.069803, 1.558012, 1, 0, 0, 1, 1,
0.008075204, -0.1776406, 2.653497, 1, 0, 0, 1, 1,
0.01095757, -1.095458, 4.45203, 1, 0, 0, 1, 1,
0.01301847, 0.2672995, 2.057624, 0, 0, 0, 1, 1,
0.01314878, -0.2942011, 2.067383, 0, 0, 0, 1, 1,
0.01457493, 1.904801, 0.01910783, 0, 0, 0, 1, 1,
0.01775109, -0.2158263, 1.706327, 0, 0, 0, 1, 1,
0.0177552, -0.7027794, 3.335919, 0, 0, 0, 1, 1,
0.0185904, -0.565356, 4.857363, 0, 0, 0, 1, 1,
0.019097, -1.546738, 2.770267, 0, 0, 0, 1, 1,
0.02012602, -0.03946408, 3.758887, 1, 1, 1, 1, 1,
0.02340513, -0.5369205, 4.90968, 1, 1, 1, 1, 1,
0.02445984, 0.4232723, 1.123022, 1, 1, 1, 1, 1,
0.02570192, -0.3852328, 4.067504, 1, 1, 1, 1, 1,
0.02794722, -1.183656, 2.843579, 1, 1, 1, 1, 1,
0.02803062, -1.297087, 2.972956, 1, 1, 1, 1, 1,
0.03096171, -1.374622, 5.260824, 1, 1, 1, 1, 1,
0.03243457, -0.2682455, 4.26993, 1, 1, 1, 1, 1,
0.04065119, -0.009684276, 1.517888, 1, 1, 1, 1, 1,
0.0447407, 0.3047781, 1.269895, 1, 1, 1, 1, 1,
0.0455345, 1.860794, -0.8739119, 1, 1, 1, 1, 1,
0.05140398, 0.8550681, 1.412405, 1, 1, 1, 1, 1,
0.05335299, 0.7244011, -0.4862201, 1, 1, 1, 1, 1,
0.05566823, -0.5212032, 5.010182, 1, 1, 1, 1, 1,
0.05661037, -0.6305377, 3.084076, 1, 1, 1, 1, 1,
0.0584985, -0.9682218, 2.626426, 0, 0, 1, 1, 1,
0.06881638, -0.2505638, 4.379078, 1, 0, 0, 1, 1,
0.07018218, 0.7200092, 0.6156424, 1, 0, 0, 1, 1,
0.07217178, 1.416255, -0.7957124, 1, 0, 0, 1, 1,
0.07812326, 1.510584, -0.3908612, 1, 0, 0, 1, 1,
0.08152317, 1.22781, 0.9247745, 1, 0, 0, 1, 1,
0.08200527, -0.8927855, 1.179658, 0, 0, 0, 1, 1,
0.08240609, -0.7569386, 1.914593, 0, 0, 0, 1, 1,
0.08268952, -0.3340654, 1.891029, 0, 0, 0, 1, 1,
0.08275194, -0.003523086, 1.797062, 0, 0, 0, 1, 1,
0.08935545, 0.2607198, 0.3643138, 0, 0, 0, 1, 1,
0.09380094, -0.6257602, 3.552659, 0, 0, 0, 1, 1,
0.0945205, 0.4600082, 0.939613, 0, 0, 0, 1, 1,
0.09587892, 1.035783, 1.473163, 1, 1, 1, 1, 1,
0.102756, -0.8210993, 2.701035, 1, 1, 1, 1, 1,
0.1073081, 0.1782946, 2.897784, 1, 1, 1, 1, 1,
0.1081984, 0.2458608, 0.7121383, 1, 1, 1, 1, 1,
0.114564, 0.8268431, 1.161482, 1, 1, 1, 1, 1,
0.1190943, -0.3668462, 4.110519, 1, 1, 1, 1, 1,
0.1193137, 0.4580775, 0.4292934, 1, 1, 1, 1, 1,
0.120218, -1.051277, 1.315307, 1, 1, 1, 1, 1,
0.1228955, 1.496857, 0.04202538, 1, 1, 1, 1, 1,
0.1239809, 0.6323718, -0.4122328, 1, 1, 1, 1, 1,
0.1244525, 1.079552, 0.8368593, 1, 1, 1, 1, 1,
0.1276239, -0.7802746, 4.035208, 1, 1, 1, 1, 1,
0.1281542, 0.203709, 0.4936093, 1, 1, 1, 1, 1,
0.1282882, 0.2158162, 0.5409132, 1, 1, 1, 1, 1,
0.1288602, -0.7939831, 5.843282, 1, 1, 1, 1, 1,
0.1291641, 0.1509299, -0.04306951, 0, 0, 1, 1, 1,
0.1339784, 0.9942257, 0.8790649, 1, 0, 0, 1, 1,
0.1363855, -0.008965112, 2.64777, 1, 0, 0, 1, 1,
0.1376819, 2.011128, -0.4456524, 1, 0, 0, 1, 1,
0.1413919, 0.5018704, 1.030243, 1, 0, 0, 1, 1,
0.1422312, 0.4547415, 1.158464, 1, 0, 0, 1, 1,
0.1460373, 0.1677418, 2.489363, 0, 0, 0, 1, 1,
0.1493369, -0.00322762, 3.171044, 0, 0, 0, 1, 1,
0.1522609, 1.843647, -0.850238, 0, 0, 0, 1, 1,
0.1546732, -0.7800919, 2.614609, 0, 0, 0, 1, 1,
0.1572261, 0.8563268, 0.1372377, 0, 0, 0, 1, 1,
0.1592232, -0.856571, 3.72695, 0, 0, 0, 1, 1,
0.1651534, -1.540203, 3.991624, 0, 0, 0, 1, 1,
0.1657057, -2.300593, 3.509088, 1, 1, 1, 1, 1,
0.1671912, 0.1803803, 0.9110275, 1, 1, 1, 1, 1,
0.1696105, -0.5280479, 1.332189, 1, 1, 1, 1, 1,
0.1803984, 0.6142056, 1.082042, 1, 1, 1, 1, 1,
0.1820267, 1.251622, 2.11016, 1, 1, 1, 1, 1,
0.1853365, -2.219506, 2.109389, 1, 1, 1, 1, 1,
0.1906648, -0.1895848, 2.104225, 1, 1, 1, 1, 1,
0.1982376, -0.5725459, 3.018053, 1, 1, 1, 1, 1,
0.2009897, -0.3719032, 1.565892, 1, 1, 1, 1, 1,
0.2104075, 0.795258, 0.4909375, 1, 1, 1, 1, 1,
0.2125332, 0.3340723, 1.258914, 1, 1, 1, 1, 1,
0.2128484, -1.151504, 2.561831, 1, 1, 1, 1, 1,
0.213234, -2.175992, 2.770578, 1, 1, 1, 1, 1,
0.2159354, 1.271008, 0.03570335, 1, 1, 1, 1, 1,
0.2167178, 0.8057133, 0.1187835, 1, 1, 1, 1, 1,
0.2305361, 0.925115, -1.381349, 0, 0, 1, 1, 1,
0.2372562, 0.3758884, 1.267627, 1, 0, 0, 1, 1,
0.2399273, 0.8923833, -0.06512983, 1, 0, 0, 1, 1,
0.2414446, -1.88188, 3.206555, 1, 0, 0, 1, 1,
0.2424999, -1.701686, 2.030053, 1, 0, 0, 1, 1,
0.250856, 1.659665, 0.06248992, 1, 0, 0, 1, 1,
0.2513039, -0.4302885, 1.743903, 0, 0, 0, 1, 1,
0.2558711, 0.6567547, 0.6700602, 0, 0, 0, 1, 1,
0.2564984, 0.5200308, -0.006825879, 0, 0, 0, 1, 1,
0.2567916, -0.50172, 1.559582, 0, 0, 0, 1, 1,
0.2586142, 1.194781, -0.3677533, 0, 0, 0, 1, 1,
0.2594099, -1.149585, 4.009831, 0, 0, 0, 1, 1,
0.2610224, -1.434322, 4.125312, 0, 0, 0, 1, 1,
0.2625854, -0.8098592, 2.376805, 1, 1, 1, 1, 1,
0.266343, -0.1847776, 2.424002, 1, 1, 1, 1, 1,
0.2697351, 1.477981, 1.653549, 1, 1, 1, 1, 1,
0.2757457, 0.4888839, -0.7064315, 1, 1, 1, 1, 1,
0.2773935, -1.852477, 3.338668, 1, 1, 1, 1, 1,
0.2794382, -0.8495455, 4.81713, 1, 1, 1, 1, 1,
0.2877279, 0.1749312, 1.468823, 1, 1, 1, 1, 1,
0.2892841, 0.2968656, 2.150386, 1, 1, 1, 1, 1,
0.2905025, -0.2868293, 3.477424, 1, 1, 1, 1, 1,
0.2949669, 0.4208705, 0.01711999, 1, 1, 1, 1, 1,
0.3004864, -0.1791268, 2.67231, 1, 1, 1, 1, 1,
0.3070025, 0.8488026, -0.4655349, 1, 1, 1, 1, 1,
0.3118455, 0.01683795, 1.366127, 1, 1, 1, 1, 1,
0.3146855, 0.5982531, 0.9924045, 1, 1, 1, 1, 1,
0.3241547, -0.3206756, 1.322965, 1, 1, 1, 1, 1,
0.3242262, 0.8234763, 0.9756783, 0, 0, 1, 1, 1,
0.3303897, 1.515652, -0.5679396, 1, 0, 0, 1, 1,
0.3337707, 1.05966, -0.04510289, 1, 0, 0, 1, 1,
0.3342719, 1.067131, 0.2531312, 1, 0, 0, 1, 1,
0.3383935, 1.387435, 0.0340615, 1, 0, 0, 1, 1,
0.3386012, -0.4993163, 2.193215, 1, 0, 0, 1, 1,
0.350522, 0.9069179, 1.303596, 0, 0, 0, 1, 1,
0.3514712, 0.8633925, 0.511942, 0, 0, 0, 1, 1,
0.3524764, -1.357124, 1.914713, 0, 0, 0, 1, 1,
0.3610457, -0.7745109, 2.670863, 0, 0, 0, 1, 1,
0.3695251, 1.624572, -0.2784974, 0, 0, 0, 1, 1,
0.370033, 0.05271869, 1.169589, 0, 0, 0, 1, 1,
0.3772085, 0.5487671, -0.1350794, 0, 0, 0, 1, 1,
0.3792888, 0.447478, 2.137486, 1, 1, 1, 1, 1,
0.3839563, -0.7675067, 0.6211916, 1, 1, 1, 1, 1,
0.3852338, 0.1858812, 3.063103, 1, 1, 1, 1, 1,
0.3882733, 1.412702, 0.1268936, 1, 1, 1, 1, 1,
0.3906995, 0.2322712, 1.72704, 1, 1, 1, 1, 1,
0.3909879, -0.9047835, 1.890321, 1, 1, 1, 1, 1,
0.3947076, -0.1325345, 0.5141383, 1, 1, 1, 1, 1,
0.3965808, -0.0628048, 1.544415, 1, 1, 1, 1, 1,
0.3988002, 0.129717, 0.6294334, 1, 1, 1, 1, 1,
0.3995817, -1.371302, 3.741138, 1, 1, 1, 1, 1,
0.401211, -2.167217, 2.62078, 1, 1, 1, 1, 1,
0.401412, -1.036188, 2.298346, 1, 1, 1, 1, 1,
0.4024603, -0.4030136, 2.151683, 1, 1, 1, 1, 1,
0.403802, 0.7111663, 0.7422157, 1, 1, 1, 1, 1,
0.4048245, -0.2493418, 2.600921, 1, 1, 1, 1, 1,
0.4187691, -1.047618, 3.187557, 0, 0, 1, 1, 1,
0.4199528, 0.05435603, 1.950493, 1, 0, 0, 1, 1,
0.4202479, -0.6028739, 2.545044, 1, 0, 0, 1, 1,
0.4206349, -0.2504327, 2.219614, 1, 0, 0, 1, 1,
0.4282075, 1.450013, 1.278443, 1, 0, 0, 1, 1,
0.4282964, -0.8451033, 1.596919, 1, 0, 0, 1, 1,
0.4295101, -0.4915981, 1.738995, 0, 0, 0, 1, 1,
0.429617, -1.020222, 1.460706, 0, 0, 0, 1, 1,
0.430431, -0.6109089, 1.404108, 0, 0, 0, 1, 1,
0.4305969, 1.404162, 2.409463, 0, 0, 0, 1, 1,
0.4326146, 0.5492887, 1.200112, 0, 0, 0, 1, 1,
0.4401883, 0.1050133, 0.8157491, 0, 0, 0, 1, 1,
0.4422273, 0.06469574, -0.1534654, 0, 0, 0, 1, 1,
0.4484772, -1.203847, 2.638787, 1, 1, 1, 1, 1,
0.4492794, -1.130205, 1.819307, 1, 1, 1, 1, 1,
0.4502232, -0.3218305, 3.57418, 1, 1, 1, 1, 1,
0.451611, -0.06929864, 2.760269, 1, 1, 1, 1, 1,
0.4538252, 0.1847761, 0.6289311, 1, 1, 1, 1, 1,
0.4540455, -0.0754906, 2.182132, 1, 1, 1, 1, 1,
0.4544309, -3.022389, 3.86662, 1, 1, 1, 1, 1,
0.4550092, -1.140061, 3.206289, 1, 1, 1, 1, 1,
0.4551205, 0.1485626, -0.5844467, 1, 1, 1, 1, 1,
0.4584394, -0.1541452, 1.711766, 1, 1, 1, 1, 1,
0.4632855, 0.8491151, -1.237157, 1, 1, 1, 1, 1,
0.4653224, 0.5042669, 0.9084436, 1, 1, 1, 1, 1,
0.465992, -0.6162713, 1.839032, 1, 1, 1, 1, 1,
0.4674412, -0.03860592, 2.057721, 1, 1, 1, 1, 1,
0.4700163, 0.4653705, 0.4063662, 1, 1, 1, 1, 1,
0.4736043, 0.1037554, 2.517796, 0, 0, 1, 1, 1,
0.4831698, -0.6894987, 0.6573039, 1, 0, 0, 1, 1,
0.4832606, 0.01016011, 2.032585, 1, 0, 0, 1, 1,
0.4898947, -0.01273498, -0.1666511, 1, 0, 0, 1, 1,
0.490238, 0.1618193, 3.376722, 1, 0, 0, 1, 1,
0.4920128, -2.662994, 3.256026, 1, 0, 0, 1, 1,
0.4929346, 1.625105, -0.80491, 0, 0, 0, 1, 1,
0.4930172, -0.4806535, 3.248228, 0, 0, 0, 1, 1,
0.4935991, -0.323073, 1.891363, 0, 0, 0, 1, 1,
0.4955461, -0.1507834, 1.403781, 0, 0, 0, 1, 1,
0.5012012, -1.184978, 2.520133, 0, 0, 0, 1, 1,
0.5042759, -1.014195, 4.417892, 0, 0, 0, 1, 1,
0.504994, 1.118621, 0.08128518, 0, 0, 0, 1, 1,
0.5079561, 1.398377, 0.05237252, 1, 1, 1, 1, 1,
0.5084142, -0.4289041, 2.296664, 1, 1, 1, 1, 1,
0.5116375, -0.04223881, 0.4855112, 1, 1, 1, 1, 1,
0.5131553, 0.8629243, 1.054347, 1, 1, 1, 1, 1,
0.5138364, -0.6125522, 3.866962, 1, 1, 1, 1, 1,
0.5218344, 0.1871952, 0.6933971, 1, 1, 1, 1, 1,
0.5218675, 0.3095611, 0.5655333, 1, 1, 1, 1, 1,
0.5224434, 1.238875, -0.7984922, 1, 1, 1, 1, 1,
0.5226001, 0.9516398, 2.307355, 1, 1, 1, 1, 1,
0.5267221, -0.739063, 3.180122, 1, 1, 1, 1, 1,
0.5272421, -0.6159452, 2.53931, 1, 1, 1, 1, 1,
0.5322527, -0.483935, 0.6382393, 1, 1, 1, 1, 1,
0.5466823, 0.884641, 2.130389, 1, 1, 1, 1, 1,
0.5467567, 0.4547934, 2.037009, 1, 1, 1, 1, 1,
0.5468211, -0.8472868, 0.3819073, 1, 1, 1, 1, 1,
0.5480234, 1.98234, 0.0009529638, 0, 0, 1, 1, 1,
0.5484192, -0.1398473, 3.360738, 1, 0, 0, 1, 1,
0.5495652, -0.2246888, 0.9692184, 1, 0, 0, 1, 1,
0.5560804, -0.9906511, 3.305712, 1, 0, 0, 1, 1,
0.5584437, -0.8052217, 4.288723, 1, 0, 0, 1, 1,
0.5619251, 0.1234357, -0.1132293, 1, 0, 0, 1, 1,
0.5646642, -1.402512, 4.401242, 0, 0, 0, 1, 1,
0.5656507, -0.8712808, 1.939535, 0, 0, 0, 1, 1,
0.5690492, 0.8777882, -0.7083871, 0, 0, 0, 1, 1,
0.5762197, -0.6211631, 1.775892, 0, 0, 0, 1, 1,
0.5764685, 1.319409, 1.195129, 0, 0, 0, 1, 1,
0.5765625, 0.1398323, 2.976486, 0, 0, 0, 1, 1,
0.5778922, -0.1627866, 3.559723, 0, 0, 0, 1, 1,
0.5860484, -2.082087, 2.124373, 1, 1, 1, 1, 1,
0.5881209, 0.1429385, -0.2249146, 1, 1, 1, 1, 1,
0.5894576, 1.253031, -0.1823957, 1, 1, 1, 1, 1,
0.595106, 0.17909, 0.8666834, 1, 1, 1, 1, 1,
0.5964748, -0.3632939, 2.85264, 1, 1, 1, 1, 1,
0.5965448, -0.9713987, 2.854342, 1, 1, 1, 1, 1,
0.598132, -1.487585, 1.381495, 1, 1, 1, 1, 1,
0.6009709, 0.09281369, 3.84925, 1, 1, 1, 1, 1,
0.6037443, -2.259446, 3.990196, 1, 1, 1, 1, 1,
0.6081247, -1.374183, 1.16581, 1, 1, 1, 1, 1,
0.6134216, -0.2084831, 2.082653, 1, 1, 1, 1, 1,
0.6140692, 0.6507653, 0.1583482, 1, 1, 1, 1, 1,
0.6223351, -0.3858499, 4.178383, 1, 1, 1, 1, 1,
0.6237119, -1.591267, 1.428452, 1, 1, 1, 1, 1,
0.6260483, -0.6824677, 3.014205, 1, 1, 1, 1, 1,
0.6267129, 0.5533102, -0.06581862, 0, 0, 1, 1, 1,
0.6287146, 0.1631729, -0.4103435, 1, 0, 0, 1, 1,
0.629016, -1.967256, 3.562614, 1, 0, 0, 1, 1,
0.6303385, 0.2949591, 0.9038199, 1, 0, 0, 1, 1,
0.6318495, -1.043621, 2.304683, 1, 0, 0, 1, 1,
0.6357961, -0.8540462, 3.413572, 1, 0, 0, 1, 1,
0.6369799, 0.2755362, -0.04393899, 0, 0, 0, 1, 1,
0.6432036, -2.493659, 2.984102, 0, 0, 0, 1, 1,
0.6452657, -0.007612245, 2.618301, 0, 0, 0, 1, 1,
0.6480483, 1.125296, -0.4922737, 0, 0, 0, 1, 1,
0.6533428, -0.9629614, 2.563287, 0, 0, 0, 1, 1,
0.6542358, -0.02257836, 1.388492, 0, 0, 0, 1, 1,
0.6554928, 1.210791, 0.7541615, 0, 0, 0, 1, 1,
0.6593131, 1.385209, -0.7126613, 1, 1, 1, 1, 1,
0.6622761, 0.05727481, 0.6889056, 1, 1, 1, 1, 1,
0.6649776, 1.303345, -0.4652666, 1, 1, 1, 1, 1,
0.6710261, -0.6958596, 0.9460884, 1, 1, 1, 1, 1,
0.6720111, -0.03532974, 0.09973105, 1, 1, 1, 1, 1,
0.6727514, 0.94295, 1.417102, 1, 1, 1, 1, 1,
0.6742976, 1.633129, 0.9015533, 1, 1, 1, 1, 1,
0.6765133, 0.0784613, 1.211427, 1, 1, 1, 1, 1,
0.6798492, -1.860813, 3.503699, 1, 1, 1, 1, 1,
0.683334, -0.6577161, 3.052966, 1, 1, 1, 1, 1,
0.6849008, -0.9008861, 4.832819, 1, 1, 1, 1, 1,
0.6850559, 0.798637, 0.4468791, 1, 1, 1, 1, 1,
0.6854082, -1.006724, 1.325558, 1, 1, 1, 1, 1,
0.6855177, 1.264966, 0.9307784, 1, 1, 1, 1, 1,
0.6943718, 0.4834605, 0.1695222, 1, 1, 1, 1, 1,
0.6978599, -1.486097, 1.825857, 0, 0, 1, 1, 1,
0.7015526, 0.09774549, -0.5117828, 1, 0, 0, 1, 1,
0.7016445, 1.78536, 1.571029, 1, 0, 0, 1, 1,
0.702132, 1.163848, -0.2309373, 1, 0, 0, 1, 1,
0.7030764, -1.101799, 2.144176, 1, 0, 0, 1, 1,
0.7042061, 1.491544, 1.08174, 1, 0, 0, 1, 1,
0.707284, -0.07069214, 0.1366981, 0, 0, 0, 1, 1,
0.7160609, 1.738168, -0.5836655, 0, 0, 0, 1, 1,
0.7204596, -0.1542002, 0.4125602, 0, 0, 0, 1, 1,
0.7240661, -0.006155419, 2.634676, 0, 0, 0, 1, 1,
0.7279117, -0.761141, 2.035344, 0, 0, 0, 1, 1,
0.7300873, 0.1656827, 2.246729, 0, 0, 0, 1, 1,
0.7315583, 0.450417, 1.019988, 0, 0, 0, 1, 1,
0.7384332, 0.3884455, 2.537237, 1, 1, 1, 1, 1,
0.7400609, 0.2125791, 1.139005, 1, 1, 1, 1, 1,
0.7424916, -0.8842511, 2.196827, 1, 1, 1, 1, 1,
0.7429265, -1.409143, 2.08453, 1, 1, 1, 1, 1,
0.7442459, 1.128361, 1.885444, 1, 1, 1, 1, 1,
0.750325, -2.52057, 3.789653, 1, 1, 1, 1, 1,
0.7522158, 2.3792, 0.15291, 1, 1, 1, 1, 1,
0.7532628, -2.706604, 4.474051, 1, 1, 1, 1, 1,
0.7539156, -0.5625845, 3.272822, 1, 1, 1, 1, 1,
0.7554748, 1.001417, -0.4824283, 1, 1, 1, 1, 1,
0.7569181, -1.57425, 2.85583, 1, 1, 1, 1, 1,
0.7626674, 2.200292, 1.72401, 1, 1, 1, 1, 1,
0.7636619, -0.4085312, 2.656315, 1, 1, 1, 1, 1,
0.7664055, 0.2949451, 2.890156, 1, 1, 1, 1, 1,
0.7763042, 2.495477, -0.7377194, 1, 1, 1, 1, 1,
0.7848248, -0.320179, 1.488947, 0, 0, 1, 1, 1,
0.7867561, -0.7414868, 1.758483, 1, 0, 0, 1, 1,
0.7894469, -2.294362, 2.287646, 1, 0, 0, 1, 1,
0.7904001, -0.8613141, 2.578178, 1, 0, 0, 1, 1,
0.7908745, -0.3881371, 3.992782, 1, 0, 0, 1, 1,
0.7943838, -1.533794, 3.407145, 1, 0, 0, 1, 1,
0.7947738, 0.4455973, 0.8787794, 0, 0, 0, 1, 1,
0.7964036, -1.068136, 3.316969, 0, 0, 0, 1, 1,
0.7976862, -0.5220873, 1.492803, 0, 0, 0, 1, 1,
0.801029, -1.117522, 1.188617, 0, 0, 0, 1, 1,
0.8055375, -1.404606, 2.718358, 0, 0, 0, 1, 1,
0.8064403, -0.7743098, 4.406635, 0, 0, 0, 1, 1,
0.8148363, 0.6925862, 2.457627, 0, 0, 0, 1, 1,
0.8150855, -1.632297, 2.461774, 1, 1, 1, 1, 1,
0.8271036, 1.335922, 0.4959502, 1, 1, 1, 1, 1,
0.8289821, 0.668021, -0.5056617, 1, 1, 1, 1, 1,
0.8329339, -0.2103231, 1.528989, 1, 1, 1, 1, 1,
0.8364196, -2.496713, 2.432399, 1, 1, 1, 1, 1,
0.8376371, 0.4126962, -0.2042093, 1, 1, 1, 1, 1,
0.8426254, -0.5390024, 2.334439, 1, 1, 1, 1, 1,
0.8526268, -0.1995782, 1.915862, 1, 1, 1, 1, 1,
0.8600076, 0.9410939, 1.498634, 1, 1, 1, 1, 1,
0.8625618, -1.914026, 3.584821, 1, 1, 1, 1, 1,
0.8629583, 1.655712, 2.650595, 1, 1, 1, 1, 1,
0.863365, -0.153391, 2.680637, 1, 1, 1, 1, 1,
0.8679751, 0.4120781, 1.895183, 1, 1, 1, 1, 1,
0.8700987, -2.228296, 2.581153, 1, 1, 1, 1, 1,
0.8716199, -0.1465585, 2.159222, 1, 1, 1, 1, 1,
0.8724684, -2.00255, 2.710166, 0, 0, 1, 1, 1,
0.8808967, -1.813358, 2.936144, 1, 0, 0, 1, 1,
0.8825654, 0.4483561, 0.5707322, 1, 0, 0, 1, 1,
0.8837247, 0.6807487, 0.2995673, 1, 0, 0, 1, 1,
0.8844789, 1.096627, 2.128108, 1, 0, 0, 1, 1,
0.8876237, 0.639208, 0.7977351, 1, 0, 0, 1, 1,
0.8884287, -0.05553579, 1.664661, 0, 0, 0, 1, 1,
0.8950616, -0.3844391, 1.413908, 0, 0, 0, 1, 1,
0.9028068, -1.520867, 3.711038, 0, 0, 0, 1, 1,
0.9038507, 1.551918, -0.04624674, 0, 0, 0, 1, 1,
0.9084966, -2.333182, 2.597328, 0, 0, 0, 1, 1,
0.9092197, -0.6215214, 2.106298, 0, 0, 0, 1, 1,
0.9095407, 0.1798331, 2.860145, 0, 0, 0, 1, 1,
0.9110389, 0.9031492, 0.8125548, 1, 1, 1, 1, 1,
0.9162919, -0.2568482, 3.725662, 1, 1, 1, 1, 1,
0.9203792, -0.9659455, 4.094759, 1, 1, 1, 1, 1,
0.9214011, 1.327895, 1.279008, 1, 1, 1, 1, 1,
0.927518, 0.8219304, 1.640676, 1, 1, 1, 1, 1,
0.9310904, -0.7952638, 1.439688, 1, 1, 1, 1, 1,
0.951749, 1.061772, 0.5826582, 1, 1, 1, 1, 1,
0.955892, 0.6661729, 0.3152754, 1, 1, 1, 1, 1,
0.9594266, -0.2305657, 2.753883, 1, 1, 1, 1, 1,
0.9628816, -0.8859812, 1.750411, 1, 1, 1, 1, 1,
0.9631212, -1.29545, 2.260931, 1, 1, 1, 1, 1,
0.965211, -0.7809268, 2.964942, 1, 1, 1, 1, 1,
0.9672091, 1.550282, -0.7171057, 1, 1, 1, 1, 1,
0.9824963, -0.0890945, 2.283614, 1, 1, 1, 1, 1,
0.9905438, -0.4489474, 1.523948, 1, 1, 1, 1, 1,
0.9912382, 0.1079204, 1.870413, 0, 0, 1, 1, 1,
0.9964278, -0.6173488, 2.513061, 1, 0, 0, 1, 1,
1.004797, 1.444124, 0.8665074, 1, 0, 0, 1, 1,
1.007997, 1.237099, 1.636378, 1, 0, 0, 1, 1,
1.008807, -0.1284701, 3.120629, 1, 0, 0, 1, 1,
1.019379, -1.408768, 0.3749546, 1, 0, 0, 1, 1,
1.019565, -0.8977911, 2.573346, 0, 0, 0, 1, 1,
1.027763, -1.0548, 3.082706, 0, 0, 0, 1, 1,
1.029283, -0.2572916, 2.362953, 0, 0, 0, 1, 1,
1.031589, 0.1060432, 1.436268, 0, 0, 0, 1, 1,
1.032957, -0.7141415, 2.237044, 0, 0, 0, 1, 1,
1.038679, 0.02187864, -0.07087816, 0, 0, 0, 1, 1,
1.038752, 1.940105, 2.713043, 0, 0, 0, 1, 1,
1.048345, 1.631315, 0.4029345, 1, 1, 1, 1, 1,
1.055642, -0.3936828, 2.20909, 1, 1, 1, 1, 1,
1.056856, -0.5804508, 1.722348, 1, 1, 1, 1, 1,
1.076316, 2.204402, 1.395157, 1, 1, 1, 1, 1,
1.083647, 0.5482329, -0.006701994, 1, 1, 1, 1, 1,
1.096739, -1.132149, 4.271984, 1, 1, 1, 1, 1,
1.096906, -1.129065, 1.883291, 1, 1, 1, 1, 1,
1.099187, 0.5435674, 1.036599, 1, 1, 1, 1, 1,
1.100537, 0.9627357, 0.6855631, 1, 1, 1, 1, 1,
1.102906, -0.4791234, 2.85051, 1, 1, 1, 1, 1,
1.104661, -0.7758591, 1.072465, 1, 1, 1, 1, 1,
1.110514, -1.240492, 1.579391, 1, 1, 1, 1, 1,
1.110679, -0.4124552, 2.8398, 1, 1, 1, 1, 1,
1.11385, 0.9733377, 2.465902, 1, 1, 1, 1, 1,
1.12609, 1.321912, 1.573074, 1, 1, 1, 1, 1,
1.128188, 0.6451075, 0.05739419, 0, 0, 1, 1, 1,
1.142542, 0.4783809, 0.3186677, 1, 0, 0, 1, 1,
1.160614, 0.333118, 1.545463, 1, 0, 0, 1, 1,
1.161816, 0.507545, 0.894549, 1, 0, 0, 1, 1,
1.16688, 0.0584923, 3.479232, 1, 0, 0, 1, 1,
1.173473, 0.3527708, 0.4242517, 1, 0, 0, 1, 1,
1.17469, -0.0531096, 2.249341, 0, 0, 0, 1, 1,
1.179193, 0.01843059, 0.9963364, 0, 0, 0, 1, 1,
1.180488, 0.4712951, 2.398688, 0, 0, 0, 1, 1,
1.183245, 0.04304142, 1.057708, 0, 0, 0, 1, 1,
1.183371, 0.783807, 1.243811, 0, 0, 0, 1, 1,
1.186258, -0.4918324, 1.590325, 0, 0, 0, 1, 1,
1.19385, -0.7213507, 0.8860377, 0, 0, 0, 1, 1,
1.209614, 0.09466667, 3.952617, 1, 1, 1, 1, 1,
1.21278, 1.255086, 0.5518845, 1, 1, 1, 1, 1,
1.219056, -0.4087065, 2.064561, 1, 1, 1, 1, 1,
1.222954, 0.2412553, 0.5824093, 1, 1, 1, 1, 1,
1.22766, -0.3957092, 2.770811, 1, 1, 1, 1, 1,
1.230912, -2.016526, 2.746625, 1, 1, 1, 1, 1,
1.231722, -0.9623218, 1.098818, 1, 1, 1, 1, 1,
1.236199, -0.1010112, 0.7466733, 1, 1, 1, 1, 1,
1.239325, 0.8015552, 0.3439217, 1, 1, 1, 1, 1,
1.244377, 0.2400063, 0.8960759, 1, 1, 1, 1, 1,
1.246802, 0.4223929, 0.4678092, 1, 1, 1, 1, 1,
1.255563, -0.141322, 2.35964, 1, 1, 1, 1, 1,
1.268515, 2.362647, 0.1704967, 1, 1, 1, 1, 1,
1.27623, 0.3871979, 1.009712, 1, 1, 1, 1, 1,
1.276841, -1.210944, 3.520447, 1, 1, 1, 1, 1,
1.278761, 0.5609496, -1.132175, 0, 0, 1, 1, 1,
1.280061, 0.1224703, 0.8284775, 1, 0, 0, 1, 1,
1.284074, -1.444529, 2.833878, 1, 0, 0, 1, 1,
1.284097, -1.095009, 1.648537, 1, 0, 0, 1, 1,
1.285319, -0.4781033, 1.091901, 1, 0, 0, 1, 1,
1.29216, -0.4136011, 1.421329, 1, 0, 0, 1, 1,
1.298647, -0.7246045, 3.582557, 0, 0, 0, 1, 1,
1.301331, 0.5185059, 0.6206763, 0, 0, 0, 1, 1,
1.303966, 0.3071556, 1.686337, 0, 0, 0, 1, 1,
1.305622, 0.141741, 1.843845, 0, 0, 0, 1, 1,
1.308859, 0.05332364, 3.609746, 0, 0, 0, 1, 1,
1.310331, 0.6177558, 1.922149, 0, 0, 0, 1, 1,
1.311678, 0.8471259, 0.749859, 0, 0, 0, 1, 1,
1.321386, -0.839559, 2.45011, 1, 1, 1, 1, 1,
1.325434, -0.1364531, 2.22332, 1, 1, 1, 1, 1,
1.338526, -0.8803337, 3.81062, 1, 1, 1, 1, 1,
1.342114, -0.07888737, 2.705096, 1, 1, 1, 1, 1,
1.357351, 0.5663409, 2.045058, 1, 1, 1, 1, 1,
1.357474, 0.6429368, -1.808972, 1, 1, 1, 1, 1,
1.359703, -0.08821049, 1.809551, 1, 1, 1, 1, 1,
1.362336, 0.290306, 0.2300123, 1, 1, 1, 1, 1,
1.36708, 0.4689343, 0.6770326, 1, 1, 1, 1, 1,
1.368114, 0.223351, 2.405692, 1, 1, 1, 1, 1,
1.372256, 1.381088, 0.4406792, 1, 1, 1, 1, 1,
1.382626, -1.34566, 1.700937, 1, 1, 1, 1, 1,
1.399132, -0.7725596, 1.212439, 1, 1, 1, 1, 1,
1.400952, 0.6417131, -0.3676288, 1, 1, 1, 1, 1,
1.40824, -1.160773, 2.499976, 1, 1, 1, 1, 1,
1.409713, -1.374583, 3.448035, 0, 0, 1, 1, 1,
1.429914, -0.3594316, 1.341222, 1, 0, 0, 1, 1,
1.442444, -2.459621, 2.081405, 1, 0, 0, 1, 1,
1.455719, -1.141695, 3.115201, 1, 0, 0, 1, 1,
1.461841, -0.7547306, 0.9938987, 1, 0, 0, 1, 1,
1.468329, -0.7579656, 1.618875, 1, 0, 0, 1, 1,
1.468789, 0.5154771, 2.581267, 0, 0, 0, 1, 1,
1.509068, 0.8449069, 1.066638, 0, 0, 0, 1, 1,
1.520282, 0.1288519, 0.8891106, 0, 0, 0, 1, 1,
1.528183, 0.2637294, 0.3624555, 0, 0, 0, 1, 1,
1.529628, 0.6821347, 2.146057, 0, 0, 0, 1, 1,
1.530147, -0.009050857, 1.423797, 0, 0, 0, 1, 1,
1.535805, 0.7742628, 1.406443, 0, 0, 0, 1, 1,
1.538414, -0.3586713, 1.249834, 1, 1, 1, 1, 1,
1.538504, -1.240578, 2.191687, 1, 1, 1, 1, 1,
1.548624, 0.7300872, -1.149401, 1, 1, 1, 1, 1,
1.565434, 1.012713, 0.5735108, 1, 1, 1, 1, 1,
1.566851, 0.2145431, 1.282637, 1, 1, 1, 1, 1,
1.570518, 0.2712733, 2.287127, 1, 1, 1, 1, 1,
1.575118, -0.4336707, 0.1260516, 1, 1, 1, 1, 1,
1.585923, 2.112787, -0.6658232, 1, 1, 1, 1, 1,
1.606919, 1.5187, -0.4003491, 1, 1, 1, 1, 1,
1.628847, 0.4674754, 0.3651593, 1, 1, 1, 1, 1,
1.630029, -3.057691, 1.717413, 1, 1, 1, 1, 1,
1.633404, -0.3979736, 0.9056117, 1, 1, 1, 1, 1,
1.649485, -0.2585092, 1.982358, 1, 1, 1, 1, 1,
1.668867, -1.094744, 2.442786, 1, 1, 1, 1, 1,
1.670498, 0.8411821, 0.8457515, 1, 1, 1, 1, 1,
1.673319, -0.5198098, 0.7377828, 0, 0, 1, 1, 1,
1.677358, 1.111619, 1.553064, 1, 0, 0, 1, 1,
1.695795, 0.2267211, 1.645643, 1, 0, 0, 1, 1,
1.709814, 0.6441317, 1.239464, 1, 0, 0, 1, 1,
1.714414, -0.4128163, 2.371799, 1, 0, 0, 1, 1,
1.74245, -1.112294, 1.506115, 1, 0, 0, 1, 1,
1.74338, 2.393314, 0.5286998, 0, 0, 0, 1, 1,
1.746817, -2.223428, 1.919466, 0, 0, 0, 1, 1,
1.748027, -1.130552, 0.7171267, 0, 0, 0, 1, 1,
1.754251, 0.1358878, 2.254116, 0, 0, 0, 1, 1,
1.764446, -0.5438012, 0.1830689, 0, 0, 0, 1, 1,
1.772641, 0.02544162, 1.023264, 0, 0, 0, 1, 1,
1.784259, -1.536929, 2.995191, 0, 0, 0, 1, 1,
1.786646, 0.6710247, 1.557662, 1, 1, 1, 1, 1,
1.795411, -0.4709669, 1.917391, 1, 1, 1, 1, 1,
1.82768, 2.014146, 1.787059, 1, 1, 1, 1, 1,
1.830702, 0.5444624, 1.04824, 1, 1, 1, 1, 1,
1.85374, 0.1657457, 3.803158, 1, 1, 1, 1, 1,
1.888499, 0.516973, 2.423432, 1, 1, 1, 1, 1,
1.891006, 0.09780538, 1.732837, 1, 1, 1, 1, 1,
1.893927, -0.9691014, 2.956989, 1, 1, 1, 1, 1,
1.899345, 1.733733, 0.4788154, 1, 1, 1, 1, 1,
1.910487, 0.1467988, 2.542227, 1, 1, 1, 1, 1,
1.997882, -0.8742833, -0.898937, 1, 1, 1, 1, 1,
2.01884, 0.6630018, 0.3827688, 1, 1, 1, 1, 1,
2.079319, -0.2179394, 1.746509, 1, 1, 1, 1, 1,
2.099483, -1.08545, -0.1135763, 1, 1, 1, 1, 1,
2.10151, -0.5358312, 0.9938744, 1, 1, 1, 1, 1,
2.139626, -0.3988162, 0.894949, 0, 0, 1, 1, 1,
2.144178, -2.099233, 2.388223, 1, 0, 0, 1, 1,
2.162205, 0.7589796, 0.8690032, 1, 0, 0, 1, 1,
2.166714, 0.0974713, 1.047356, 1, 0, 0, 1, 1,
2.172567, -0.7552881, 0.9896718, 1, 0, 0, 1, 1,
2.180679, -0.4587995, 0.998229, 1, 0, 0, 1, 1,
2.181353, -0.6740382, 1.50999, 0, 0, 0, 1, 1,
2.208399, 0.8437998, 0.7055935, 0, 0, 0, 1, 1,
2.239743, 1.404042, 1.308174, 0, 0, 0, 1, 1,
2.267552, 0.5504054, 2.657836, 0, 0, 0, 1, 1,
2.370076, -1.458336, -0.02142698, 0, 0, 0, 1, 1,
2.373887, -1.481711, 2.329844, 0, 0, 0, 1, 1,
2.520857, 1.336902, 0.7178207, 0, 0, 0, 1, 1,
2.562509, -0.4214586, 0.2217718, 1, 1, 1, 1, 1,
2.567379, -0.7796243, 1.930715, 1, 1, 1, 1, 1,
2.61499, -0.2743354, 0.6277974, 1, 1, 1, 1, 1,
2.617762, -1.014073, 1.886913, 1, 1, 1, 1, 1,
2.693116, 0.3070708, 1.892817, 1, 1, 1, 1, 1,
2.754071, -1.101378, 1.512033, 1, 1, 1, 1, 1,
2.826162, -0.525921, 2.241541, 1, 1, 1, 1, 1
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
var radius = 9.611326;
var distance = 33.75937;
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
mvMatrix.translate( 0.0490247, -0.1126657, -0.2148461 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75937);
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
