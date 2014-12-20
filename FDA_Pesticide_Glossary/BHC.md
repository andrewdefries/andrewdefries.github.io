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
-3.113817, -0.5291537, -3.340255, 1, 0, 0, 1,
-2.909163, 0.3914456, -1.985368, 1, 0.007843138, 0, 1,
-2.837182, 0.3396822, -0.879796, 1, 0.01176471, 0, 1,
-2.834767, 0.3644675, -1.2211, 1, 0.01960784, 0, 1,
-2.73796, -0.667665, -2.481337, 1, 0.02352941, 0, 1,
-2.735073, -0.1180502, -2.245069, 1, 0.03137255, 0, 1,
-2.701431, -1.06956, -2.047101, 1, 0.03529412, 0, 1,
-2.636388, -0.6753232, -0.9137515, 1, 0.04313726, 0, 1,
-2.625434, -0.8654723, -3.270643, 1, 0.04705882, 0, 1,
-2.610956, -0.5493203, -2.599928, 1, 0.05490196, 0, 1,
-2.565045, -0.2331602, -0.7898061, 1, 0.05882353, 0, 1,
-2.429515, 0.5975693, -2.9596, 1, 0.06666667, 0, 1,
-2.297426, -0.1717892, -1.537222, 1, 0.07058824, 0, 1,
-2.296959, -0.826364, -1.047094, 1, 0.07843138, 0, 1,
-2.259099, -0.6257362, -1.165959, 1, 0.08235294, 0, 1,
-2.226673, -0.1167046, 0.05716104, 1, 0.09019608, 0, 1,
-2.221092, 0.9570434, -2.01058, 1, 0.09411765, 0, 1,
-2.20859, -0.4394681, -2.499328, 1, 0.1019608, 0, 1,
-2.205853, 1.033451, -1.472911, 1, 0.1098039, 0, 1,
-2.119076, 0.6479509, -1.257464, 1, 0.1137255, 0, 1,
-2.114202, 1.644908, -1.485491, 1, 0.1215686, 0, 1,
-2.089318, -0.4317241, -1.046845, 1, 0.1254902, 0, 1,
-2.074391, -0.308176, -2.329565, 1, 0.1333333, 0, 1,
-1.991012, -2.591047, -3.67821, 1, 0.1372549, 0, 1,
-1.988475, -1.19578, -2.408878, 1, 0.145098, 0, 1,
-1.968844, 0.4342825, -2.106804, 1, 0.1490196, 0, 1,
-1.950134, -0.6211282, -1.560986, 1, 0.1568628, 0, 1,
-1.930124, 0.0479516, -1.711657, 1, 0.1607843, 0, 1,
-1.925827, 0.09140904, -1.376287, 1, 0.1686275, 0, 1,
-1.917747, 0.1199127, -0.9902312, 1, 0.172549, 0, 1,
-1.906927, 0.1733034, -0.8758783, 1, 0.1803922, 0, 1,
-1.903632, -0.7003778, -1.600204, 1, 0.1843137, 0, 1,
-1.896966, 0.6002952, -1.901404, 1, 0.1921569, 0, 1,
-1.890286, -0.2394377, -2.23153, 1, 0.1960784, 0, 1,
-1.873415, 1.308432, -2.277773, 1, 0.2039216, 0, 1,
-1.803928, -0.9347312, -2.075638, 1, 0.2117647, 0, 1,
-1.799605, -0.3110744, -2.000354, 1, 0.2156863, 0, 1,
-1.792015, -0.9425984, -3.252441, 1, 0.2235294, 0, 1,
-1.79151, -1.695522, -1.689539, 1, 0.227451, 0, 1,
-1.789897, 0.3535339, -2.611017, 1, 0.2352941, 0, 1,
-1.788934, -1.422708, -1.659713, 1, 0.2392157, 0, 1,
-1.78792, -2.493306, -2.493439, 1, 0.2470588, 0, 1,
-1.7876, -0.3416299, -0.4972526, 1, 0.2509804, 0, 1,
-1.744451, -1.48404, -1.778807, 1, 0.2588235, 0, 1,
-1.732337, -1.272859, -3.051367, 1, 0.2627451, 0, 1,
-1.729116, -1.56288, -3.243212, 1, 0.2705882, 0, 1,
-1.718582, -0.2173581, -1.687074, 1, 0.2745098, 0, 1,
-1.716235, 0.06214565, -2.803755, 1, 0.282353, 0, 1,
-1.708472, 1.074878, -0.2665156, 1, 0.2862745, 0, 1,
-1.690928, -0.959139, -1.544878, 1, 0.2941177, 0, 1,
-1.686228, -0.4539853, -1.815071, 1, 0.3019608, 0, 1,
-1.676867, 1.676367, 0.04746978, 1, 0.3058824, 0, 1,
-1.674389, -0.5324405, -2.228828, 1, 0.3137255, 0, 1,
-1.633509, -0.4351355, -1.627856, 1, 0.3176471, 0, 1,
-1.629132, -0.06257514, -2.245513, 1, 0.3254902, 0, 1,
-1.629101, -0.5756884, -1.277369, 1, 0.3294118, 0, 1,
-1.561683, -0.4149705, -1.673038, 1, 0.3372549, 0, 1,
-1.558486, 0.6412221, 1.604573, 1, 0.3411765, 0, 1,
-1.551287, -0.136572, -0.992025, 1, 0.3490196, 0, 1,
-1.551122, -1.701172, -2.976032, 1, 0.3529412, 0, 1,
-1.547625, 1.202984, -1.91426, 1, 0.3607843, 0, 1,
-1.546004, -0.2544631, -2.702768, 1, 0.3647059, 0, 1,
-1.54379, 0.594176, -0.2767514, 1, 0.372549, 0, 1,
-1.535532, 0.4375907, 0.1052808, 1, 0.3764706, 0, 1,
-1.508061, 0.04482603, -1.147262, 1, 0.3843137, 0, 1,
-1.498817, -1.917478, -1.26301, 1, 0.3882353, 0, 1,
-1.493645, 0.2237736, -1.766138, 1, 0.3960784, 0, 1,
-1.492032, 1.375824, -1.499326, 1, 0.4039216, 0, 1,
-1.491838, -0.9555349, -3.210683, 1, 0.4078431, 0, 1,
-1.467296, 1.236597, -1.440339, 1, 0.4156863, 0, 1,
-1.466326, -0.8463674, -2.018064, 1, 0.4196078, 0, 1,
-1.462495, 0.1580021, -1.386876, 1, 0.427451, 0, 1,
-1.457758, -0.6395191, -1.778742, 1, 0.4313726, 0, 1,
-1.456516, -0.6086915, -2.659371, 1, 0.4392157, 0, 1,
-1.455198, -0.7303588, -2.77534, 1, 0.4431373, 0, 1,
-1.422186, -1.291334, -1.931691, 1, 0.4509804, 0, 1,
-1.400224, 0.3068449, -1.456252, 1, 0.454902, 0, 1,
-1.396961, -0.2135188, -2.4359, 1, 0.4627451, 0, 1,
-1.386563, -0.923229, -1.858159, 1, 0.4666667, 0, 1,
-1.386525, -1.277493, -3.017064, 1, 0.4745098, 0, 1,
-1.386174, -0.9941692, -1.891546, 1, 0.4784314, 0, 1,
-1.379657, 0.1045263, -1.998301, 1, 0.4862745, 0, 1,
-1.370561, 1.912209, -1.195613, 1, 0.4901961, 0, 1,
-1.36705, 0.1486717, -0.2259127, 1, 0.4980392, 0, 1,
-1.359298, 0.653697, -2.238448, 1, 0.5058824, 0, 1,
-1.347222, 0.6867337, -1.291402, 1, 0.509804, 0, 1,
-1.34471, 0.4009158, -1.00967, 1, 0.5176471, 0, 1,
-1.340987, -0.00582209, -0.2483535, 1, 0.5215687, 0, 1,
-1.330734, -0.1007764, -0.3034566, 1, 0.5294118, 0, 1,
-1.32702, 0.7088093, -1.372143, 1, 0.5333334, 0, 1,
-1.326806, 1.105172, -1.672744, 1, 0.5411765, 0, 1,
-1.321472, -0.8961918, -2.416393, 1, 0.5450981, 0, 1,
-1.321164, 1.658243, -0.1628909, 1, 0.5529412, 0, 1,
-1.320386, -0.3499304, -1.291989, 1, 0.5568628, 0, 1,
-1.316173, 0.3297286, -1.010315, 1, 0.5647059, 0, 1,
-1.301494, -1.043553, -3.351171, 1, 0.5686275, 0, 1,
-1.291762, 1.319371, -1.642432, 1, 0.5764706, 0, 1,
-1.287809, 1.228174, -0.8176633, 1, 0.5803922, 0, 1,
-1.273872, 0.8868301, -1.656733, 1, 0.5882353, 0, 1,
-1.261941, -0.7655784, -3.304278, 1, 0.5921569, 0, 1,
-1.25395, -0.2924246, -2.608453, 1, 0.6, 0, 1,
-1.252742, 0.04027483, -0.4186648, 1, 0.6078432, 0, 1,
-1.232559, -0.2098791, -2.529391, 1, 0.6117647, 0, 1,
-1.231453, 0.2171226, 1.194301, 1, 0.6196079, 0, 1,
-1.213084, 0.5997089, 0.08926572, 1, 0.6235294, 0, 1,
-1.213049, 1.516573, -0.2865356, 1, 0.6313726, 0, 1,
-1.206971, -0.8433982, -1.541844, 1, 0.6352941, 0, 1,
-1.205389, -0.6076039, -3.577946, 1, 0.6431373, 0, 1,
-1.205184, -0.6771386, -2.846262, 1, 0.6470588, 0, 1,
-1.204803, 0.9316822, 0.9237946, 1, 0.654902, 0, 1,
-1.197916, -0.3074394, -3.168108, 1, 0.6588235, 0, 1,
-1.197528, -0.03962296, -2.862278, 1, 0.6666667, 0, 1,
-1.195494, -0.5859228, -0.5650526, 1, 0.6705883, 0, 1,
-1.19197, -0.8741173, -0.5768024, 1, 0.6784314, 0, 1,
-1.191891, -1.024913, -1.726604, 1, 0.682353, 0, 1,
-1.188559, 0.9012496, -1.748394, 1, 0.6901961, 0, 1,
-1.186845, 0.4168549, -0.3342839, 1, 0.6941177, 0, 1,
-1.178018, -0.5632668, -2.007524, 1, 0.7019608, 0, 1,
-1.175841, 1.05387, -1.337909, 1, 0.7098039, 0, 1,
-1.158716, -0.07560851, -2.355503, 1, 0.7137255, 0, 1,
-1.157239, -0.3881251, -1.702999, 1, 0.7215686, 0, 1,
-1.151092, 0.878347, 0.4726638, 1, 0.7254902, 0, 1,
-1.147374, -1.096279, -2.101235, 1, 0.7333333, 0, 1,
-1.14317, 1.670027, -0.01772979, 1, 0.7372549, 0, 1,
-1.136848, -0.1415889, -2.267281, 1, 0.7450981, 0, 1,
-1.136521, -0.5371327, -4.897192, 1, 0.7490196, 0, 1,
-1.133983, 0.1862708, -1.498045, 1, 0.7568628, 0, 1,
-1.116901, 1.25665, -0.5564029, 1, 0.7607843, 0, 1,
-1.11563, -0.08958358, -1.3382, 1, 0.7686275, 0, 1,
-1.106945, -0.6452967, -1.362701, 1, 0.772549, 0, 1,
-1.105479, 0.6633641, -0.2489038, 1, 0.7803922, 0, 1,
-1.105427, -0.4248711, -0.4144713, 1, 0.7843137, 0, 1,
-1.097875, -0.04038103, -1.857761, 1, 0.7921569, 0, 1,
-1.097517, 0.1124257, -4.125059, 1, 0.7960784, 0, 1,
-1.092996, -0.2742046, -3.307868, 1, 0.8039216, 0, 1,
-1.092686, -1.670803, -4.587789, 1, 0.8117647, 0, 1,
-1.091341, 0.3380024, -1.825782, 1, 0.8156863, 0, 1,
-1.087369, 0.7646049, -0.4443267, 1, 0.8235294, 0, 1,
-1.085119, -0.1831808, -1.938901, 1, 0.827451, 0, 1,
-1.081921, -0.5508775, -2.446782, 1, 0.8352941, 0, 1,
-1.081354, -0.900733, -1.089702, 1, 0.8392157, 0, 1,
-1.075527, -0.5367695, -1.236484, 1, 0.8470588, 0, 1,
-1.073508, -1.824088, -3.634269, 1, 0.8509804, 0, 1,
-1.06579, 0.3174052, -1.281515, 1, 0.8588235, 0, 1,
-1.062615, 1.109757, -1.741142, 1, 0.8627451, 0, 1,
-1.060977, -0.9959424, -1.623055, 1, 0.8705882, 0, 1,
-1.055039, -1.925983, -2.079759, 1, 0.8745098, 0, 1,
-1.054523, 0.2001586, -1.112532, 1, 0.8823529, 0, 1,
-1.048281, -0.3487839, -3.06424, 1, 0.8862745, 0, 1,
-1.043151, -0.04773269, -2.410528, 1, 0.8941177, 0, 1,
-1.041843, -0.1049028, -0.6539389, 1, 0.8980392, 0, 1,
-1.040022, 0.07378801, -1.029054, 1, 0.9058824, 0, 1,
-1.035613, -0.0276985, -0.6406385, 1, 0.9137255, 0, 1,
-1.035491, -0.306679, -1.847903, 1, 0.9176471, 0, 1,
-1.02997, 0.3501205, -3.661334, 1, 0.9254902, 0, 1,
-1.028534, 0.9082807, -1.53306, 1, 0.9294118, 0, 1,
-1.023127, 0.4582292, -0.1307668, 1, 0.9372549, 0, 1,
-1.02185, 1.118688, -1.174049, 1, 0.9411765, 0, 1,
-1.021739, -0.7615377, -1.31578, 1, 0.9490196, 0, 1,
-1.021039, -0.007250754, -0.8204651, 1, 0.9529412, 0, 1,
-1.006362, 0.3054571, -1.357096, 1, 0.9607843, 0, 1,
-1.002137, 0.1231408, -1.399503, 1, 0.9647059, 0, 1,
-1.002093, -0.01886633, 0.1857015, 1, 0.972549, 0, 1,
-0.9898685, -0.5122151, -1.792855, 1, 0.9764706, 0, 1,
-0.9767417, 0.08730017, -0.5760219, 1, 0.9843137, 0, 1,
-0.9766441, 0.5535266, 0.07214908, 1, 0.9882353, 0, 1,
-0.9633127, 0.3141257, -0.9876838, 1, 0.9960784, 0, 1,
-0.9606561, 0.3944145, -0.5451526, 0.9960784, 1, 0, 1,
-0.9539843, 1.723313, -1.096889, 0.9921569, 1, 0, 1,
-0.9523456, 1.217178, -1.65918, 0.9843137, 1, 0, 1,
-0.9515425, -1.524974, -3.015894, 0.9803922, 1, 0, 1,
-0.950193, -0.9248737, -1.424616, 0.972549, 1, 0, 1,
-0.9495977, -0.1787931, -1.14203, 0.9686275, 1, 0, 1,
-0.9475789, -0.5659804, -2.13939, 0.9607843, 1, 0, 1,
-0.9427477, 0.3609347, -1.343431, 0.9568627, 1, 0, 1,
-0.9424481, -1.398427, -2.530922, 0.9490196, 1, 0, 1,
-0.9400675, -1.981198, -2.527833, 0.945098, 1, 0, 1,
-0.9374884, -1.395156, -4.560995, 0.9372549, 1, 0, 1,
-0.9362496, -0.1184544, -1.241985, 0.9333333, 1, 0, 1,
-0.9245657, 0.206858, -0.4763619, 0.9254902, 1, 0, 1,
-0.9215752, 0.5575269, -1.423235, 0.9215686, 1, 0, 1,
-0.9181149, -1.606869, -1.517438, 0.9137255, 1, 0, 1,
-0.9151085, 0.2358889, -0.9105471, 0.9098039, 1, 0, 1,
-0.9127786, 0.5040554, 0.9685957, 0.9019608, 1, 0, 1,
-0.9119192, 0.6646466, -1.479286, 0.8941177, 1, 0, 1,
-0.910957, 0.9211001, -0.8205885, 0.8901961, 1, 0, 1,
-0.9091761, -0.7635581, -1.174154, 0.8823529, 1, 0, 1,
-0.9080569, 0.3034413, -1.486817, 0.8784314, 1, 0, 1,
-0.9011735, 0.5436494, -0.474637, 0.8705882, 1, 0, 1,
-0.8986838, -0.2282776, -2.57685, 0.8666667, 1, 0, 1,
-0.8964671, 0.4135765, -1.463333, 0.8588235, 1, 0, 1,
-0.8940799, -1.032141, -1.237539, 0.854902, 1, 0, 1,
-0.8872626, -0.3282213, -2.004224, 0.8470588, 1, 0, 1,
-0.8837392, -0.4974546, -0.6682014, 0.8431373, 1, 0, 1,
-0.8792232, -0.2357423, -1.468541, 0.8352941, 1, 0, 1,
-0.8725244, 1.914391, -2.677366, 0.8313726, 1, 0, 1,
-0.8708176, -1.359794, -1.998821, 0.8235294, 1, 0, 1,
-0.8680791, -1.01412, -2.525046, 0.8196079, 1, 0, 1,
-0.8649284, -0.7999108, -1.381627, 0.8117647, 1, 0, 1,
-0.8611761, -0.5624447, -1.085964, 0.8078431, 1, 0, 1,
-0.8582977, 0.02543046, -4.837623, 0.8, 1, 0, 1,
-0.8552449, 2.510139, -0.7973306, 0.7921569, 1, 0, 1,
-0.8518774, 0.9945167, -1.632885, 0.7882353, 1, 0, 1,
-0.8465315, 1.722101, -1.308036, 0.7803922, 1, 0, 1,
-0.8355762, 1.044566, -0.2890583, 0.7764706, 1, 0, 1,
-0.8310738, 0.5097883, -0.4950392, 0.7686275, 1, 0, 1,
-0.8301741, -0.2981248, -0.5620157, 0.7647059, 1, 0, 1,
-0.8297726, 0.2300747, 0.5900741, 0.7568628, 1, 0, 1,
-0.8273784, 1.009656, -0.1019536, 0.7529412, 1, 0, 1,
-0.8229662, -0.9838713, -1.772242, 0.7450981, 1, 0, 1,
-0.8202249, 2.255201, 0.3780697, 0.7411765, 1, 0, 1,
-0.816322, 0.184403, -1.962519, 0.7333333, 1, 0, 1,
-0.8148992, 0.3881896, -1.129883, 0.7294118, 1, 0, 1,
-0.8137397, -0.5972245, -1.519861, 0.7215686, 1, 0, 1,
-0.8128811, 0.07785969, -2.387171, 0.7176471, 1, 0, 1,
-0.8086385, -0.3534629, -2.160944, 0.7098039, 1, 0, 1,
-0.8066536, -0.09560475, -0.5644389, 0.7058824, 1, 0, 1,
-0.8060991, 0.2634003, -1.29241, 0.6980392, 1, 0, 1,
-0.8051829, -0.5619896, -1.571613, 0.6901961, 1, 0, 1,
-0.8046803, 1.207506, -1.544386, 0.6862745, 1, 0, 1,
-0.8028558, 0.2496361, -1.014422, 0.6784314, 1, 0, 1,
-0.7899698, -1.893761, -4.492788, 0.6745098, 1, 0, 1,
-0.7881879, 0.596296, -0.9713414, 0.6666667, 1, 0, 1,
-0.7875115, 0.9705576, -0.9816586, 0.6627451, 1, 0, 1,
-0.7729338, 0.9814959, -0.8151834, 0.654902, 1, 0, 1,
-0.7722254, 1.223304, -0.08709829, 0.6509804, 1, 0, 1,
-0.7621914, -2.936168, -4.155184, 0.6431373, 1, 0, 1,
-0.7612087, 1.657926, 0.8107495, 0.6392157, 1, 0, 1,
-0.7524624, -0.4653859, -2.269143, 0.6313726, 1, 0, 1,
-0.749764, -0.05647901, -1.886386, 0.627451, 1, 0, 1,
-0.7492739, 1.085048, -1.670038, 0.6196079, 1, 0, 1,
-0.7471061, -0.8846707, -1.607549, 0.6156863, 1, 0, 1,
-0.745581, -0.8321025, -2.367848, 0.6078432, 1, 0, 1,
-0.743974, 1.313756, 1.25595, 0.6039216, 1, 0, 1,
-0.7413508, -0.4992488, -2.768385, 0.5960785, 1, 0, 1,
-0.7400162, 0.3239624, -0.8344047, 0.5882353, 1, 0, 1,
-0.7370679, -0.904604, -4.46819, 0.5843138, 1, 0, 1,
-0.7339017, -0.1997469, -2.414619, 0.5764706, 1, 0, 1,
-0.7298974, 0.4168905, -1.341037, 0.572549, 1, 0, 1,
-0.729109, -1.430149, -2.375498, 0.5647059, 1, 0, 1,
-0.7196718, 0.3913329, -2.384251, 0.5607843, 1, 0, 1,
-0.718507, -1.757285, -1.617831, 0.5529412, 1, 0, 1,
-0.7089755, 2.233156, -1.218755, 0.5490196, 1, 0, 1,
-0.7062587, -0.2083114, -1.700359, 0.5411765, 1, 0, 1,
-0.6983356, -1.65166, -5.210189, 0.5372549, 1, 0, 1,
-0.6978595, -0.7788773, -2.710653, 0.5294118, 1, 0, 1,
-0.6920052, 0.2229024, -2.003886, 0.5254902, 1, 0, 1,
-0.6919094, -0.9819896, -0.8429114, 0.5176471, 1, 0, 1,
-0.6860306, 0.4905015, -1.534153, 0.5137255, 1, 0, 1,
-0.6789797, -1.217572, -1.158958, 0.5058824, 1, 0, 1,
-0.6741769, -0.2347636, -1.508596, 0.5019608, 1, 0, 1,
-0.6716537, 0.8138897, 0.9313654, 0.4941176, 1, 0, 1,
-0.6709775, -0.7885658, -1.954345, 0.4862745, 1, 0, 1,
-0.6699188, 0.9641773, -0.9166313, 0.4823529, 1, 0, 1,
-0.6682854, -0.8847249, -2.44434, 0.4745098, 1, 0, 1,
-0.6672459, -0.1094975, -1.484868, 0.4705882, 1, 0, 1,
-0.6669797, -1.467246, -3.211042, 0.4627451, 1, 0, 1,
-0.6609253, -1.708887, -1.230374, 0.4588235, 1, 0, 1,
-0.6607744, 0.9974813, -2.474042, 0.4509804, 1, 0, 1,
-0.6604743, 0.9301752, -0.5920115, 0.4470588, 1, 0, 1,
-0.653657, -0.632686, -3.578527, 0.4392157, 1, 0, 1,
-0.6490707, -0.01741463, -1.610896, 0.4352941, 1, 0, 1,
-0.6421336, -2.986453, -3.792377, 0.427451, 1, 0, 1,
-0.6420258, 2.050967, 1.099612, 0.4235294, 1, 0, 1,
-0.6412332, 1.898351, -0.3092041, 0.4156863, 1, 0, 1,
-0.6408063, -0.3431992, -0.6083703, 0.4117647, 1, 0, 1,
-0.6378342, -0.6242613, -0.5328858, 0.4039216, 1, 0, 1,
-0.6358992, -0.02044825, -2.04454, 0.3960784, 1, 0, 1,
-0.6285585, 1.299897, -1.512825, 0.3921569, 1, 0, 1,
-0.6257533, -0.8963491, -3.02069, 0.3843137, 1, 0, 1,
-0.6194658, -0.6754864, -4.222649, 0.3803922, 1, 0, 1,
-0.6169295, 0.2487998, -2.472801, 0.372549, 1, 0, 1,
-0.6168027, -0.2963338, -0.8231481, 0.3686275, 1, 0, 1,
-0.6165742, 1.057696, -0.6692263, 0.3607843, 1, 0, 1,
-0.6142186, 0.408675, -1.167704, 0.3568628, 1, 0, 1,
-0.6121247, 0.7497095, -1.204295, 0.3490196, 1, 0, 1,
-0.6074033, 0.6956872, -2.073087, 0.345098, 1, 0, 1,
-0.604556, 0.7112831, -1.066669, 0.3372549, 1, 0, 1,
-0.6015319, -0.5588444, -3.012594, 0.3333333, 1, 0, 1,
-0.5947911, 1.412069, 0.6795239, 0.3254902, 1, 0, 1,
-0.5828724, 0.1664874, -0.2549727, 0.3215686, 1, 0, 1,
-0.5823308, -0.03790777, -0.7651489, 0.3137255, 1, 0, 1,
-0.5751169, 1.343522, 0.02404755, 0.3098039, 1, 0, 1,
-0.5715154, -0.1923778, -1.311476, 0.3019608, 1, 0, 1,
-0.5672572, 0.004032982, -1.1377, 0.2941177, 1, 0, 1,
-0.5671188, -0.4809732, -1.768692, 0.2901961, 1, 0, 1,
-0.5651744, 0.3698631, -1.95437, 0.282353, 1, 0, 1,
-0.5628517, -0.9694617, -3.869813, 0.2784314, 1, 0, 1,
-0.5599782, 0.1504748, -2.288833, 0.2705882, 1, 0, 1,
-0.5578095, -0.4147712, -2.162361, 0.2666667, 1, 0, 1,
-0.5561646, 2.030756, -0.2657245, 0.2588235, 1, 0, 1,
-0.5543448, 0.2258945, -3.227979, 0.254902, 1, 0, 1,
-0.5506896, -1.725687, -3.311325, 0.2470588, 1, 0, 1,
-0.5476928, 1.365044, -0.9430382, 0.2431373, 1, 0, 1,
-0.5444968, 0.02759026, -0.4190886, 0.2352941, 1, 0, 1,
-0.5430724, -0.4970791, -1.092508, 0.2313726, 1, 0, 1,
-0.530946, 0.6801297, -1.798599, 0.2235294, 1, 0, 1,
-0.5302017, 0.6038982, 0.1887414, 0.2196078, 1, 0, 1,
-0.5274397, 0.8498005, 0.5866031, 0.2117647, 1, 0, 1,
-0.5232345, -1.742789, -3.505965, 0.2078431, 1, 0, 1,
-0.5227813, 1.327338, -1.329019, 0.2, 1, 0, 1,
-0.5214401, 2.201218, 0.6545821, 0.1921569, 1, 0, 1,
-0.5214158, -1.78974, -2.879292, 0.1882353, 1, 0, 1,
-0.5187838, 0.9489758, -1.200484, 0.1803922, 1, 0, 1,
-0.5187094, 0.1091072, -1.065344, 0.1764706, 1, 0, 1,
-0.5171568, -0.6958905, -2.230259, 0.1686275, 1, 0, 1,
-0.5159835, -0.864787, -1.419119, 0.1647059, 1, 0, 1,
-0.5139055, 0.3481104, -1.166611, 0.1568628, 1, 0, 1,
-0.5133436, 0.5597982, 0.3065974, 0.1529412, 1, 0, 1,
-0.5115075, 1.450709, 0.1833876, 0.145098, 1, 0, 1,
-0.5107164, 0.3651613, -1.630697, 0.1411765, 1, 0, 1,
-0.5101296, 1.609499, -0.7866547, 0.1333333, 1, 0, 1,
-0.507938, -0.8729022, -0.7205815, 0.1294118, 1, 0, 1,
-0.4988531, 0.1348235, -2.330927, 0.1215686, 1, 0, 1,
-0.4940607, -0.2677881, -1.237903, 0.1176471, 1, 0, 1,
-0.4913562, -0.352739, -2.8823, 0.1098039, 1, 0, 1,
-0.490701, -0.602594, -3.67453, 0.1058824, 1, 0, 1,
-0.490482, 0.3808505, -0.06767733, 0.09803922, 1, 0, 1,
-0.4846399, -0.3431377, -0.8266853, 0.09019608, 1, 0, 1,
-0.4840857, -0.868515, -2.222239, 0.08627451, 1, 0, 1,
-0.4801551, 0.3077006, -1.13004, 0.07843138, 1, 0, 1,
-0.4756455, 1.117946, -0.7913123, 0.07450981, 1, 0, 1,
-0.4706583, 0.1478233, -2.658442, 0.06666667, 1, 0, 1,
-0.4650165, 0.1173528, -1.707263, 0.0627451, 1, 0, 1,
-0.4646079, 1.501446, 2.103915, 0.05490196, 1, 0, 1,
-0.4645116, -0.0105722, -2.483505, 0.05098039, 1, 0, 1,
-0.4626642, -0.7678502, -1.808311, 0.04313726, 1, 0, 1,
-0.4590479, 0.1605852, -1.496934, 0.03921569, 1, 0, 1,
-0.4589767, 0.506019, -0.9292484, 0.03137255, 1, 0, 1,
-0.4554345, -0.8471091, -1.131128, 0.02745098, 1, 0, 1,
-0.450798, 0.293478, -0.2404514, 0.01960784, 1, 0, 1,
-0.4506235, -0.02587039, -2.097377, 0.01568628, 1, 0, 1,
-0.4495944, -0.438019, -2.238073, 0.007843138, 1, 0, 1,
-0.4440132, 1.197807, -0.4381274, 0.003921569, 1, 0, 1,
-0.443765, -0.2460564, -1.755555, 0, 1, 0.003921569, 1,
-0.4395398, 1.189131, -0.4887485, 0, 1, 0.01176471, 1,
-0.4393264, -0.2833158, -1.414709, 0, 1, 0.01568628, 1,
-0.4310651, 0.5099078, 0.3161633, 0, 1, 0.02352941, 1,
-0.4232931, -0.2753317, -2.289623, 0, 1, 0.02745098, 1,
-0.4198106, 0.754321, -0.8914548, 0, 1, 0.03529412, 1,
-0.4137609, -0.1304617, -1.49835, 0, 1, 0.03921569, 1,
-0.4094563, 0.9631579, -0.6277613, 0, 1, 0.04705882, 1,
-0.4066012, 0.4860321, 0.3163426, 0, 1, 0.05098039, 1,
-0.4056022, 0.067064, -2.834625, 0, 1, 0.05882353, 1,
-0.4031964, 1.472951, -0.4858015, 0, 1, 0.0627451, 1,
-0.3990746, 2.441589, -1.520758, 0, 1, 0.07058824, 1,
-0.3973498, -1.28071, -1.252137, 0, 1, 0.07450981, 1,
-0.3958606, -0.07599326, -0.04202672, 0, 1, 0.08235294, 1,
-0.3907095, -1.165122, -4.911582, 0, 1, 0.08627451, 1,
-0.3805853, -0.8463612, -2.520741, 0, 1, 0.09411765, 1,
-0.3755066, -0.2778623, -1.73298, 0, 1, 0.1019608, 1,
-0.3716824, 0.2890383, 0.1694669, 0, 1, 0.1058824, 1,
-0.3653575, 0.06013433, -1.111175, 0, 1, 0.1137255, 1,
-0.3646477, 0.1084064, -1.256347, 0, 1, 0.1176471, 1,
-0.3644569, 1.283404, 0.3902753, 0, 1, 0.1254902, 1,
-0.3640464, -1.639188, -3.35959, 0, 1, 0.1294118, 1,
-0.363761, 0.2138649, -1.679956, 0, 1, 0.1372549, 1,
-0.3628967, 1.244069, 1.172813, 0, 1, 0.1411765, 1,
-0.3626778, -0.364704, -2.603204, 0, 1, 0.1490196, 1,
-0.3571199, 0.3976839, 1.339646, 0, 1, 0.1529412, 1,
-0.3564972, -0.7540228, -4.016469, 0, 1, 0.1607843, 1,
-0.3557518, 0.3233517, 0.664321, 0, 1, 0.1647059, 1,
-0.3530139, -0.9562105, -2.963295, 0, 1, 0.172549, 1,
-0.3515182, -1.31094, -3.986388, 0, 1, 0.1764706, 1,
-0.3505594, -2.760256, -4.328643, 0, 1, 0.1843137, 1,
-0.3495871, -0.5642611, -1.535365, 0, 1, 0.1882353, 1,
-0.349509, -0.4751298, -1.643075, 0, 1, 0.1960784, 1,
-0.3485674, -0.2117498, -0.7907626, 0, 1, 0.2039216, 1,
-0.3468431, 0.4141718, -0.008880656, 0, 1, 0.2078431, 1,
-0.3432603, 0.2581209, -1.951342, 0, 1, 0.2156863, 1,
-0.3406448, -0.1900271, -2.818123, 0, 1, 0.2196078, 1,
-0.3306934, 0.8061618, -0.1886954, 0, 1, 0.227451, 1,
-0.320997, 0.9889491, 0.9091758, 0, 1, 0.2313726, 1,
-0.3205036, 0.9996435, -0.3757402, 0, 1, 0.2392157, 1,
-0.3159199, 0.003366984, -0.0332907, 0, 1, 0.2431373, 1,
-0.3108025, 0.1564368, -1.78856, 0, 1, 0.2509804, 1,
-0.3098028, -0.5643809, -3.281482, 0, 1, 0.254902, 1,
-0.306951, -2.292097, -2.340082, 0, 1, 0.2627451, 1,
-0.306206, -0.8701656, -5.148617, 0, 1, 0.2666667, 1,
-0.3056309, -0.081311, -2.576548, 0, 1, 0.2745098, 1,
-0.3030169, -2.157585, -2.732407, 0, 1, 0.2784314, 1,
-0.2969955, -1.167677, -1.939652, 0, 1, 0.2862745, 1,
-0.2968534, 0.7669279, -0.03935694, 0, 1, 0.2901961, 1,
-0.2952686, -0.6619943, -1.623494, 0, 1, 0.2980392, 1,
-0.2923875, -0.3559488, -3.65191, 0, 1, 0.3058824, 1,
-0.2918991, 1.073309, 0.4620067, 0, 1, 0.3098039, 1,
-0.2903568, 1.367811, 1.182696, 0, 1, 0.3176471, 1,
-0.2895901, -0.4772381, -1.07109, 0, 1, 0.3215686, 1,
-0.2835027, 0.2567872, -2.437814, 0, 1, 0.3294118, 1,
-0.2810653, 0.8185133, -1.064397, 0, 1, 0.3333333, 1,
-0.2805989, 0.5574771, 0.1692733, 0, 1, 0.3411765, 1,
-0.2794901, -1.345655, -2.947148, 0, 1, 0.345098, 1,
-0.2786047, 0.473597, -1.339048, 0, 1, 0.3529412, 1,
-0.2756103, 0.5588494, -0.7833532, 0, 1, 0.3568628, 1,
-0.2712826, -2.696046, -3.61321, 0, 1, 0.3647059, 1,
-0.2688062, 0.5609006, 0.7361167, 0, 1, 0.3686275, 1,
-0.2606799, -0.9841042, -1.599348, 0, 1, 0.3764706, 1,
-0.2574293, -0.6722547, -2.872457, 0, 1, 0.3803922, 1,
-0.2562056, -2.515074, -0.3806179, 0, 1, 0.3882353, 1,
-0.2535498, 1.277138, 0.01387914, 0, 1, 0.3921569, 1,
-0.2500544, -1.147439, -3.776535, 0, 1, 0.4, 1,
-0.2499263, 0.2517636, -3.19093, 0, 1, 0.4078431, 1,
-0.248384, -0.2266353, -2.49328, 0, 1, 0.4117647, 1,
-0.2478494, -1.89971, -4.36318, 0, 1, 0.4196078, 1,
-0.2458474, 0.4539765, 0.2316022, 0, 1, 0.4235294, 1,
-0.2457965, -0.4014381, -2.667572, 0, 1, 0.4313726, 1,
-0.2432882, 0.2329024, -1.923773, 0, 1, 0.4352941, 1,
-0.2382718, -1.172497, -2.503544, 0, 1, 0.4431373, 1,
-0.2364353, 0.2736978, -3.101733, 0, 1, 0.4470588, 1,
-0.234141, -1.49822, -2.270714, 0, 1, 0.454902, 1,
-0.2333399, 0.5950423, 0.8813564, 0, 1, 0.4588235, 1,
-0.2261736, -0.8928227, -3.203754, 0, 1, 0.4666667, 1,
-0.2185647, -0.5558135, -3.138657, 0, 1, 0.4705882, 1,
-0.2154017, 0.2721574, -0.442085, 0, 1, 0.4784314, 1,
-0.2131853, -1.145294, -1.661854, 0, 1, 0.4823529, 1,
-0.211659, -0.7294518, -1.463762, 0, 1, 0.4901961, 1,
-0.2082664, -0.4052926, -2.698913, 0, 1, 0.4941176, 1,
-0.207965, 0.3810406, -0.1871302, 0, 1, 0.5019608, 1,
-0.2026768, 1.828721, 0.9147466, 0, 1, 0.509804, 1,
-0.2000453, 0.3058338, -0.7868451, 0, 1, 0.5137255, 1,
-0.1992117, 0.7038849, -1.012811, 0, 1, 0.5215687, 1,
-0.1974428, -0.05660671, -3.464258, 0, 1, 0.5254902, 1,
-0.1971512, -1.530233, -2.968027, 0, 1, 0.5333334, 1,
-0.1951322, 0.2420962, 0.01588242, 0, 1, 0.5372549, 1,
-0.1907131, -1.111861, -3.778251, 0, 1, 0.5450981, 1,
-0.1881436, -0.3713419, -1.58041, 0, 1, 0.5490196, 1,
-0.187988, -0.4015038, -1.565642, 0, 1, 0.5568628, 1,
-0.1869757, 1.649215, -0.3569612, 0, 1, 0.5607843, 1,
-0.1852368, 0.7615059, 1.229598, 0, 1, 0.5686275, 1,
-0.1820406, 1.342619, -0.3079642, 0, 1, 0.572549, 1,
-0.1802722, -1.627128, -3.471598, 0, 1, 0.5803922, 1,
-0.1787003, -1.275201, -1.46725, 0, 1, 0.5843138, 1,
-0.176143, 1.499997, -0.9274494, 0, 1, 0.5921569, 1,
-0.1750236, 0.7743109, -0.05714458, 0, 1, 0.5960785, 1,
-0.1742836, -0.5114812, -2.290121, 0, 1, 0.6039216, 1,
-0.1686417, 0.1376438, 0.5684164, 0, 1, 0.6117647, 1,
-0.1658342, -0.1162749, -2.419322, 0, 1, 0.6156863, 1,
-0.1628922, -1.487551, -1.153431, 0, 1, 0.6235294, 1,
-0.1598349, 0.4240133, 0.001994451, 0, 1, 0.627451, 1,
-0.1596003, 1.137024, -0.4855199, 0, 1, 0.6352941, 1,
-0.1595134, 1.482831, 0.3770261, 0, 1, 0.6392157, 1,
-0.1583326, -0.002846718, -1.213143, 0, 1, 0.6470588, 1,
-0.155632, 0.2508106, -1.423337, 0, 1, 0.6509804, 1,
-0.1554249, 0.3579959, 0.06927869, 0, 1, 0.6588235, 1,
-0.154965, 0.3930151, 0.2785278, 0, 1, 0.6627451, 1,
-0.1536384, 0.6125, -0.8002924, 0, 1, 0.6705883, 1,
-0.1507548, 0.9859294, -2.47149, 0, 1, 0.6745098, 1,
-0.144912, -0.7320736, -3.238777, 0, 1, 0.682353, 1,
-0.1427993, -2.294229, -1.576898, 0, 1, 0.6862745, 1,
-0.1349778, -0.1830362, -1.130772, 0, 1, 0.6941177, 1,
-0.1348728, -0.5534485, -3.342299, 0, 1, 0.7019608, 1,
-0.1316261, 0.6157137, -0.8334554, 0, 1, 0.7058824, 1,
-0.1313912, -0.5671656, -3.0201, 0, 1, 0.7137255, 1,
-0.1230342, 0.1879091, -0.492509, 0, 1, 0.7176471, 1,
-0.1214834, 0.4492792, -0.6988474, 0, 1, 0.7254902, 1,
-0.1169501, -0.8447264, -3.919913, 0, 1, 0.7294118, 1,
-0.1124232, -0.7637179, -3.526695, 0, 1, 0.7372549, 1,
-0.1099959, 0.06543969, -0.1197735, 0, 1, 0.7411765, 1,
-0.1045103, -0.1863634, -3.157085, 0, 1, 0.7490196, 1,
-0.1027119, 0.009444632, -1.866862, 0, 1, 0.7529412, 1,
-0.101872, -0.3416415, -3.546841, 0, 1, 0.7607843, 1,
-0.09746607, 1.268912, -0.5638092, 0, 1, 0.7647059, 1,
-0.09737872, -0.05829304, -1.804185, 0, 1, 0.772549, 1,
-0.09609717, -1.404753, -6.35465, 0, 1, 0.7764706, 1,
-0.09242892, 1.226324, -0.9189245, 0, 1, 0.7843137, 1,
-0.09122486, -0.8186813, -3.448997, 0, 1, 0.7882353, 1,
-0.08736803, -1.262215, -3.703281, 0, 1, 0.7960784, 1,
-0.08488017, -0.3043467, -2.193333, 0, 1, 0.8039216, 1,
-0.0834993, -1.242302, -2.21259, 0, 1, 0.8078431, 1,
-0.08328369, -0.6489047, -2.953064, 0, 1, 0.8156863, 1,
-0.08168051, 1.123573, -2.402977, 0, 1, 0.8196079, 1,
-0.08056029, -0.001815462, -1.032855, 0, 1, 0.827451, 1,
-0.0799292, -0.4907005, -2.428624, 0, 1, 0.8313726, 1,
-0.07937695, -1.671034, -2.267347, 0, 1, 0.8392157, 1,
-0.07903601, -0.5401269, -3.076463, 0, 1, 0.8431373, 1,
-0.07703309, 1.402175, 0.7045533, 0, 1, 0.8509804, 1,
-0.07475185, 1.33574, 0.5321376, 0, 1, 0.854902, 1,
-0.07297394, -0.7221053, -1.216815, 0, 1, 0.8627451, 1,
-0.06790287, 2.16702, 0.9144785, 0, 1, 0.8666667, 1,
-0.06362674, 1.582453, -1.071264, 0, 1, 0.8745098, 1,
-0.06247603, -1.173798, -2.124106, 0, 1, 0.8784314, 1,
-0.06245413, 0.9680802, -0.2056815, 0, 1, 0.8862745, 1,
-0.06237556, -1.479504, -3.991064, 0, 1, 0.8901961, 1,
-0.05609978, 1.255563, -1.529344, 0, 1, 0.8980392, 1,
-0.04826117, 0.4640448, -0.35376, 0, 1, 0.9058824, 1,
-0.04666697, 0.9978831, -0.2539013, 0, 1, 0.9098039, 1,
-0.04505832, -0.4130499, -1.457904, 0, 1, 0.9176471, 1,
-0.04471935, 1.478307, -0.1966809, 0, 1, 0.9215686, 1,
-0.0417405, -0.4359548, -3.600885, 0, 1, 0.9294118, 1,
-0.03366869, 1.038741, -0.7487611, 0, 1, 0.9333333, 1,
-0.03325565, -0.5308079, -3.188581, 0, 1, 0.9411765, 1,
-0.02705969, 1.124935, -1.778457, 0, 1, 0.945098, 1,
-0.02581446, 0.9941235, -1.209508, 0, 1, 0.9529412, 1,
-0.02439636, 1.028082, -2.133677, 0, 1, 0.9568627, 1,
-0.0231172, 0.7634044, -0.6047971, 0, 1, 0.9647059, 1,
-0.02018894, -1.828465, -3.576644, 0, 1, 0.9686275, 1,
-0.01731731, -0.1354351, -2.79302, 0, 1, 0.9764706, 1,
-0.01543547, -0.4559487, -3.561892, 0, 1, 0.9803922, 1,
-0.01346213, -0.8830978, -3.186288, 0, 1, 0.9882353, 1,
-0.01279984, -0.2648095, -2.323484, 0, 1, 0.9921569, 1,
-0.009078968, 1.068343, 2.947815, 0, 1, 1, 1,
-0.008314366, -0.07842225, -2.877558, 0, 0.9921569, 1, 1,
-0.007574548, -2.727632, -2.18021, 0, 0.9882353, 1, 1,
-0.00741309, 0.08534305, 2.301753, 0, 0.9803922, 1, 1,
-0.005599287, -0.3814303, -4.056643, 0, 0.9764706, 1, 1,
0.002895447, -0.08433685, 3.719898, 0, 0.9686275, 1, 1,
0.003540447, -0.9048412, 2.389453, 0, 0.9647059, 1, 1,
0.005531345, 0.1090392, -0.8271662, 0, 0.9568627, 1, 1,
0.006088147, -0.09608265, 2.635561, 0, 0.9529412, 1, 1,
0.008801896, -0.2779401, 3.931404, 0, 0.945098, 1, 1,
0.0117648, 1.086432, -1.601422, 0, 0.9411765, 1, 1,
0.01496105, -1.272074, 2.260258, 0, 0.9333333, 1, 1,
0.01878767, 0.5753809, -0.9830589, 0, 0.9294118, 1, 1,
0.01947641, -0.5535197, 3.522249, 0, 0.9215686, 1, 1,
0.02261147, -0.1886177, 3.020918, 0, 0.9176471, 1, 1,
0.02591901, -0.3029284, 3.130781, 0, 0.9098039, 1, 1,
0.02839426, 0.7357533, 1.69486, 0, 0.9058824, 1, 1,
0.02925666, -0.897662, 3.363769, 0, 0.8980392, 1, 1,
0.03172433, -2.245551, 1.811178, 0, 0.8901961, 1, 1,
0.0352656, 0.2472361, -1.017752, 0, 0.8862745, 1, 1,
0.0386578, -2.148904, 3.067947, 0, 0.8784314, 1, 1,
0.05162149, 1.304749, -0.6574872, 0, 0.8745098, 1, 1,
0.05389661, -0.3543423, 4.87543, 0, 0.8666667, 1, 1,
0.05412725, -0.5497893, 4.275573, 0, 0.8627451, 1, 1,
0.05637284, 2.933088, -0.2673764, 0, 0.854902, 1, 1,
0.05751312, -1.162516, 4.208851, 0, 0.8509804, 1, 1,
0.05765009, 0.5514765, 0.1972295, 0, 0.8431373, 1, 1,
0.05775458, 0.8878514, 0.7014273, 0, 0.8392157, 1, 1,
0.06993423, -0.5899583, 3.587877, 0, 0.8313726, 1, 1,
0.07071584, -1.87618, 3.318568, 0, 0.827451, 1, 1,
0.07355352, -0.1334556, 3.008303, 0, 0.8196079, 1, 1,
0.07493477, 0.8862985, 0.4453416, 0, 0.8156863, 1, 1,
0.07524889, 0.3675446, 0.6174177, 0, 0.8078431, 1, 1,
0.07556915, 1.583975, 0.6517515, 0, 0.8039216, 1, 1,
0.07597306, -0.0614466, 1.070099, 0, 0.7960784, 1, 1,
0.07949811, -1.172094, 2.36675, 0, 0.7882353, 1, 1,
0.0800148, -0.04107596, 2.688128, 0, 0.7843137, 1, 1,
0.08217401, 1.954199, 0.6513454, 0, 0.7764706, 1, 1,
0.08649033, 0.3639924, -0.009068889, 0, 0.772549, 1, 1,
0.08709229, -1.008467, 1.986167, 0, 0.7647059, 1, 1,
0.08719546, -0.4966932, 2.760396, 0, 0.7607843, 1, 1,
0.08727261, -0.04405195, 2.022827, 0, 0.7529412, 1, 1,
0.08931756, 0.2899634, -0.2333432, 0, 0.7490196, 1, 1,
0.09051508, -0.05043714, 0.9058641, 0, 0.7411765, 1, 1,
0.09464107, -1.640749, 3.794475, 0, 0.7372549, 1, 1,
0.09800989, -0.7087241, 3.41574, 0, 0.7294118, 1, 1,
0.1020568, 1.113873, -1.116975, 0, 0.7254902, 1, 1,
0.1029021, 1.205371, 1.68689, 0, 0.7176471, 1, 1,
0.1029693, 0.8444737, -0.01197822, 0, 0.7137255, 1, 1,
0.1060421, -1.121799, 2.730465, 0, 0.7058824, 1, 1,
0.106329, -1.855507, 3.372454, 0, 0.6980392, 1, 1,
0.1099296, -0.586576, 2.602731, 0, 0.6941177, 1, 1,
0.113638, -0.7995699, 3.854156, 0, 0.6862745, 1, 1,
0.116511, 1.020231, -0.480314, 0, 0.682353, 1, 1,
0.1216878, 0.1442892, -0.8663195, 0, 0.6745098, 1, 1,
0.1227462, -0.9709502, 2.448488, 0, 0.6705883, 1, 1,
0.1235431, -1.285538, 2.800033, 0, 0.6627451, 1, 1,
0.126975, 1.35864, -0.8601625, 0, 0.6588235, 1, 1,
0.1286439, -0.06914998, 0.7991356, 0, 0.6509804, 1, 1,
0.1286533, -0.8272712, 3.109736, 0, 0.6470588, 1, 1,
0.1397362, 0.8703672, -0.5294401, 0, 0.6392157, 1, 1,
0.1410218, -1.047806, 2.182547, 0, 0.6352941, 1, 1,
0.1476, -1.207859, 1.572252, 0, 0.627451, 1, 1,
0.1533014, 0.2246376, 0.006786386, 0, 0.6235294, 1, 1,
0.1534299, 0.8888835, -0.2715372, 0, 0.6156863, 1, 1,
0.1591801, -1.218534, 3.395747, 0, 0.6117647, 1, 1,
0.1606547, 0.4344771, -0.3212509, 0, 0.6039216, 1, 1,
0.1611698, -2.913344, 3.927024, 0, 0.5960785, 1, 1,
0.1628925, -1.590954, 3.164446, 0, 0.5921569, 1, 1,
0.1670887, -0.3809308, 1.889337, 0, 0.5843138, 1, 1,
0.1688038, -1.654513, 2.356256, 0, 0.5803922, 1, 1,
0.1728311, 0.5311879, 0.1131968, 0, 0.572549, 1, 1,
0.1751181, 1.246838, -1.024565, 0, 0.5686275, 1, 1,
0.1764471, -0.4830638, 2.768574, 0, 0.5607843, 1, 1,
0.1766107, -0.9344265, 3.217327, 0, 0.5568628, 1, 1,
0.1792892, 1.516563, 0.1875415, 0, 0.5490196, 1, 1,
0.1811368, 0.3358813, 1.899953, 0, 0.5450981, 1, 1,
0.1824466, -2.113433, 1.984091, 0, 0.5372549, 1, 1,
0.1843045, 0.6324387, -0.3167115, 0, 0.5333334, 1, 1,
0.1847225, 0.7143735, 1.584526, 0, 0.5254902, 1, 1,
0.1849866, -0.2680233, 3.019185, 0, 0.5215687, 1, 1,
0.1871845, -0.1091899, 2.454403, 0, 0.5137255, 1, 1,
0.1921043, -0.2604485, 2.156771, 0, 0.509804, 1, 1,
0.1982823, 0.7007659, -0.3660216, 0, 0.5019608, 1, 1,
0.1992064, 1.975271, -0.8075028, 0, 0.4941176, 1, 1,
0.2019077, 1.020557, 0.9155532, 0, 0.4901961, 1, 1,
0.2051355, -0.1773782, 1.461153, 0, 0.4823529, 1, 1,
0.2058909, 0.5165571, -1.894158, 0, 0.4784314, 1, 1,
0.2081058, -1.934515, 3.809355, 0, 0.4705882, 1, 1,
0.208916, 1.016421, -0.3589288, 0, 0.4666667, 1, 1,
0.2129823, -2.078357, 2.286528, 0, 0.4588235, 1, 1,
0.2139725, -0.3361359, 2.870268, 0, 0.454902, 1, 1,
0.2166639, 0.8557919, 0.1591983, 0, 0.4470588, 1, 1,
0.2224653, -0.4909267, 0.4744875, 0, 0.4431373, 1, 1,
0.2226431, -1.208482, 3.315295, 0, 0.4352941, 1, 1,
0.2226522, 2.123271, -1.752357, 0, 0.4313726, 1, 1,
0.2265002, 0.6385328, -2.125759, 0, 0.4235294, 1, 1,
0.2265354, -0.5226157, 4.666512, 0, 0.4196078, 1, 1,
0.2280853, -0.7032178, 4.571241, 0, 0.4117647, 1, 1,
0.2342296, -0.3681828, 2.941637, 0, 0.4078431, 1, 1,
0.2368028, 1.577079, 1.741591, 0, 0.4, 1, 1,
0.2404411, -1.509198, 4.630679, 0, 0.3921569, 1, 1,
0.2426235, 0.3678681, -0.2005626, 0, 0.3882353, 1, 1,
0.2428294, -0.8235214, 1.460456, 0, 0.3803922, 1, 1,
0.2465, -0.3308391, 1.743659, 0, 0.3764706, 1, 1,
0.2527918, -0.1457845, 0.7426434, 0, 0.3686275, 1, 1,
0.2557773, -0.9543687, 3.581634, 0, 0.3647059, 1, 1,
0.2561992, 0.5910628, 0.6251241, 0, 0.3568628, 1, 1,
0.2570427, -0.8209406, 2.138451, 0, 0.3529412, 1, 1,
0.258088, -0.2009221, 4.610011, 0, 0.345098, 1, 1,
0.261015, -1.233682, 4.034265, 0, 0.3411765, 1, 1,
0.2626262, -1.459112, 1.893764, 0, 0.3333333, 1, 1,
0.2635192, 1.425368, 0.01074202, 0, 0.3294118, 1, 1,
0.2661135, -0.62435, 3.499902, 0, 0.3215686, 1, 1,
0.2666011, -0.07082968, 1.060259, 0, 0.3176471, 1, 1,
0.2702192, 0.3934404, -0.3888505, 0, 0.3098039, 1, 1,
0.2733238, 0.0570081, 0.4423452, 0, 0.3058824, 1, 1,
0.2734773, 0.4827461, 0.2863396, 0, 0.2980392, 1, 1,
0.2742814, 0.2020632, 0.341518, 0, 0.2901961, 1, 1,
0.2781792, -0.1119948, -0.4485234, 0, 0.2862745, 1, 1,
0.2812833, 0.4511038, 0.6149614, 0, 0.2784314, 1, 1,
0.2854644, -0.5951907, 2.281089, 0, 0.2745098, 1, 1,
0.2858297, -0.4085858, 4.847928, 0, 0.2666667, 1, 1,
0.2899715, -1.184922, 3.222415, 0, 0.2627451, 1, 1,
0.2917942, 1.045517, -0.2883282, 0, 0.254902, 1, 1,
0.292921, -0.87179, 2.497919, 0, 0.2509804, 1, 1,
0.2930728, -1.758052, 3.290679, 0, 0.2431373, 1, 1,
0.293119, 0.1603609, 0.1343967, 0, 0.2392157, 1, 1,
0.2939354, -0.8978137, 2.378045, 0, 0.2313726, 1, 1,
0.3015884, 0.1624041, 1.398133, 0, 0.227451, 1, 1,
0.3030777, -2.152216, 3.568651, 0, 0.2196078, 1, 1,
0.3068209, 1.355387, -0.9765965, 0, 0.2156863, 1, 1,
0.3176382, 2.050397, -1.208566, 0, 0.2078431, 1, 1,
0.327988, 0.04467174, 2.20012, 0, 0.2039216, 1, 1,
0.3316868, 0.4550072, 0.4580967, 0, 0.1960784, 1, 1,
0.3321562, 0.2359006, 0.5521827, 0, 0.1882353, 1, 1,
0.3324559, 0.01572762, 2.172722, 0, 0.1843137, 1, 1,
0.3343208, -0.04195745, 1.356748, 0, 0.1764706, 1, 1,
0.3367839, 0.3149784, 1.024958, 0, 0.172549, 1, 1,
0.3374195, -0.4135525, 3.01105, 0, 0.1647059, 1, 1,
0.3406913, 0.1534557, -0.3714, 0, 0.1607843, 1, 1,
0.3433975, 0.4179966, 0.5482106, 0, 0.1529412, 1, 1,
0.346543, -0.5895464, 1.446683, 0, 0.1490196, 1, 1,
0.3502412, -1.739824, 2.148287, 0, 0.1411765, 1, 1,
0.3532895, -0.857479, 2.026311, 0, 0.1372549, 1, 1,
0.3560944, 1.359004, 0.6438652, 0, 0.1294118, 1, 1,
0.3573061, -1.388383, 3.454776, 0, 0.1254902, 1, 1,
0.3586221, 0.4007577, 0.7534604, 0, 0.1176471, 1, 1,
0.3599011, -0.3286512, 2.048761, 0, 0.1137255, 1, 1,
0.3619884, -0.05236228, 2.881805, 0, 0.1058824, 1, 1,
0.3635512, 0.1300105, 0.3759575, 0, 0.09803922, 1, 1,
0.3666367, -0.7855186, 3.631002, 0, 0.09411765, 1, 1,
0.3691677, -0.4268002, 3.141701, 0, 0.08627451, 1, 1,
0.3721979, 0.08766483, 1.482476, 0, 0.08235294, 1, 1,
0.3752243, 1.417588, 0.1263092, 0, 0.07450981, 1, 1,
0.3772617, -0.1728187, 2.362098, 0, 0.07058824, 1, 1,
0.3826631, 1.570926, 0.1603048, 0, 0.0627451, 1, 1,
0.382714, -0.645489, 1.503762, 0, 0.05882353, 1, 1,
0.383495, 0.1569155, 2.213542, 0, 0.05098039, 1, 1,
0.3852305, -1.331714, 5.405415, 0, 0.04705882, 1, 1,
0.3900353, 0.6513414, 0.2065608, 0, 0.03921569, 1, 1,
0.390166, 1.032024, -0.9014508, 0, 0.03529412, 1, 1,
0.3912347, 0.1726254, 0.9714573, 0, 0.02745098, 1, 1,
0.3916186, 0.2173468, 1.620586, 0, 0.02352941, 1, 1,
0.3952212, -1.568535, 2.80152, 0, 0.01568628, 1, 1,
0.3985447, -1.485817, 1.940259, 0, 0.01176471, 1, 1,
0.4023671, -2.300612, 2.512127, 0, 0.003921569, 1, 1,
0.4109555, -1.119419, 4.197753, 0.003921569, 0, 1, 1,
0.4125563, 0.1187201, 1.852931, 0.007843138, 0, 1, 1,
0.414707, -0.5330544, 2.338754, 0.01568628, 0, 1, 1,
0.4154848, 0.7252141, 0.3855569, 0.01960784, 0, 1, 1,
0.4179369, -0.06528703, 2.400738, 0.02745098, 0, 1, 1,
0.4191103, 0.9710423, -0.4121869, 0.03137255, 0, 1, 1,
0.4205431, -0.2543218, 1.505654, 0.03921569, 0, 1, 1,
0.4249746, 0.7214088, -0.04134158, 0.04313726, 0, 1, 1,
0.4268994, -0.164974, 2.782004, 0.05098039, 0, 1, 1,
0.4276572, 0.5586361, 1.712601, 0.05490196, 0, 1, 1,
0.428364, -0.4895514, 1.554795, 0.0627451, 0, 1, 1,
0.4343034, -0.6593386, 4.09069, 0.06666667, 0, 1, 1,
0.4350773, 0.05853593, 2.536287, 0.07450981, 0, 1, 1,
0.4384165, 1.844221, 0.2156538, 0.07843138, 0, 1, 1,
0.4455862, -0.01264724, 0.092697, 0.08627451, 0, 1, 1,
0.4469775, 0.04492373, 2.424704, 0.09019608, 0, 1, 1,
0.4470124, -0.290742, 2.60377, 0.09803922, 0, 1, 1,
0.4473631, -1.43849, 1.002102, 0.1058824, 0, 1, 1,
0.4482234, 0.8066964, 0.5157812, 0.1098039, 0, 1, 1,
0.4498562, 0.05149736, 0.4319003, 0.1176471, 0, 1, 1,
0.4511204, 0.07813826, 0.9429458, 0.1215686, 0, 1, 1,
0.4511628, -1.294452, 2.375468, 0.1294118, 0, 1, 1,
0.4581172, -0.5374911, 0.7413008, 0.1333333, 0, 1, 1,
0.460442, -0.0891255, 0.6245258, 0.1411765, 0, 1, 1,
0.4618263, 0.4812696, 0.3865971, 0.145098, 0, 1, 1,
0.4621993, 0.4328972, 0.413961, 0.1529412, 0, 1, 1,
0.4639679, -0.4053287, -0.6941547, 0.1568628, 0, 1, 1,
0.4659836, 0.3030093, 2.33486, 0.1647059, 0, 1, 1,
0.4758675, -0.2055776, 0.9779668, 0.1686275, 0, 1, 1,
0.476943, 1.260521, 1.039442, 0.1764706, 0, 1, 1,
0.4789913, 0.3995161, -1.112866, 0.1803922, 0, 1, 1,
0.4816653, 2.200617, 0.4207538, 0.1882353, 0, 1, 1,
0.4824507, -1.739634, 4.564583, 0.1921569, 0, 1, 1,
0.48427, 0.9146391, 0.8081241, 0.2, 0, 1, 1,
0.4867444, -0.5212444, 3.404787, 0.2078431, 0, 1, 1,
0.4902546, -0.6102549, 2.041455, 0.2117647, 0, 1, 1,
0.4927636, 0.4487818, 1.692966, 0.2196078, 0, 1, 1,
0.4927909, -1.387867, 3.292616, 0.2235294, 0, 1, 1,
0.4935671, -1.194297, 4.204425, 0.2313726, 0, 1, 1,
0.5087622, -0.8766762, 2.413328, 0.2352941, 0, 1, 1,
0.5091577, 0.9513828, 0.2538381, 0.2431373, 0, 1, 1,
0.5126079, -0.7235017, 3.377924, 0.2470588, 0, 1, 1,
0.5164365, -0.659284, 1.934585, 0.254902, 0, 1, 1,
0.5192624, -0.6255206, 0.5231471, 0.2588235, 0, 1, 1,
0.5262969, 0.4646571, -0.335427, 0.2666667, 0, 1, 1,
0.5348141, 0.03961825, 0.9921178, 0.2705882, 0, 1, 1,
0.5362781, -0.1591986, 3.29987, 0.2784314, 0, 1, 1,
0.5400586, -0.1838295, 2.820802, 0.282353, 0, 1, 1,
0.5411313, 1.713145, -0.3600324, 0.2901961, 0, 1, 1,
0.5416569, -0.1307906, -0.4238931, 0.2941177, 0, 1, 1,
0.5417487, 0.7053645, 0.03589158, 0.3019608, 0, 1, 1,
0.5450488, -0.5535189, 2.419019, 0.3098039, 0, 1, 1,
0.5531899, 1.669102, -0.05480983, 0.3137255, 0, 1, 1,
0.5610609, 0.1708983, 0.730197, 0.3215686, 0, 1, 1,
0.5611939, 0.6120957, 0.8905614, 0.3254902, 0, 1, 1,
0.5617953, -0.2749656, 2.944933, 0.3333333, 0, 1, 1,
0.5636806, -0.2381336, 0.1487824, 0.3372549, 0, 1, 1,
0.5694897, -1.511196, 2.854942, 0.345098, 0, 1, 1,
0.5712342, 0.4184822, -0.03942518, 0.3490196, 0, 1, 1,
0.5737311, -0.289944, 2.793973, 0.3568628, 0, 1, 1,
0.5752652, 1.814182, 0.830502, 0.3607843, 0, 1, 1,
0.5775488, 0.2444146, 0.1745533, 0.3686275, 0, 1, 1,
0.5794514, -1.296068, 1.134621, 0.372549, 0, 1, 1,
0.5865916, -0.3786145, 0.3679669, 0.3803922, 0, 1, 1,
0.5875974, -0.8678409, 2.049887, 0.3843137, 0, 1, 1,
0.5880914, -0.8507829, 4.534615, 0.3921569, 0, 1, 1,
0.6023393, 1.149318, -0.3742643, 0.3960784, 0, 1, 1,
0.6063953, -1.803573, 1.60211, 0.4039216, 0, 1, 1,
0.6082173, -0.09602321, 1.950124, 0.4117647, 0, 1, 1,
0.6144679, -0.3144009, 2.353441, 0.4156863, 0, 1, 1,
0.6160734, -2.190655, 2.827774, 0.4235294, 0, 1, 1,
0.6199845, -0.2917982, 0.7230536, 0.427451, 0, 1, 1,
0.6204285, -1.74873, 2.140101, 0.4352941, 0, 1, 1,
0.6237861, -1.022059, 0.4834017, 0.4392157, 0, 1, 1,
0.6254179, 0.62248, 0.3379064, 0.4470588, 0, 1, 1,
0.6310967, 0.297236, 2.606684, 0.4509804, 0, 1, 1,
0.6357452, 0.7908994, 0.05382336, 0.4588235, 0, 1, 1,
0.641439, -0.6085601, 0.9537529, 0.4627451, 0, 1, 1,
0.6447931, -1.296738, 2.522854, 0.4705882, 0, 1, 1,
0.6478731, -1.152631, 3.614056, 0.4745098, 0, 1, 1,
0.6503313, 0.5987378, -0.4805284, 0.4823529, 0, 1, 1,
0.6532214, -1.837571, 3.089423, 0.4862745, 0, 1, 1,
0.6646361, 0.1790489, 1.488895, 0.4941176, 0, 1, 1,
0.6759264, 0.1324133, 2.148603, 0.5019608, 0, 1, 1,
0.6759559, 0.007234302, 0.9866579, 0.5058824, 0, 1, 1,
0.6766685, -0.3252375, 1.561794, 0.5137255, 0, 1, 1,
0.6793268, -1.423323, 1.779616, 0.5176471, 0, 1, 1,
0.6803544, -0.8216588, 3.189991, 0.5254902, 0, 1, 1,
0.6875648, -0.333157, 0.1779514, 0.5294118, 0, 1, 1,
0.6892041, 0.9743565, -1.398337, 0.5372549, 0, 1, 1,
0.6899678, -0.8943431, 2.986442, 0.5411765, 0, 1, 1,
0.6906305, 0.6571141, 0.9434289, 0.5490196, 0, 1, 1,
0.6911354, 1.423996, 1.067182, 0.5529412, 0, 1, 1,
0.6977054, -0.2622273, 2.540958, 0.5607843, 0, 1, 1,
0.7022999, 0.5554823, 0.04221373, 0.5647059, 0, 1, 1,
0.7027727, -1.391493, 4.922059, 0.572549, 0, 1, 1,
0.7055477, -0.9059272, 3.769614, 0.5764706, 0, 1, 1,
0.7058136, 0.402067, 1.372167, 0.5843138, 0, 1, 1,
0.7070363, 0.875118, 0.3969605, 0.5882353, 0, 1, 1,
0.707289, 1.209906, -0.194552, 0.5960785, 0, 1, 1,
0.713622, -2.193128, 1.146403, 0.6039216, 0, 1, 1,
0.7223527, 0.04550545, 2.926189, 0.6078432, 0, 1, 1,
0.7238054, 0.9224116, 1.250714, 0.6156863, 0, 1, 1,
0.7279896, -1.068422, 3.113352, 0.6196079, 0, 1, 1,
0.733413, 1.683923, -0.429368, 0.627451, 0, 1, 1,
0.7402701, 0.8399003, 2.591244, 0.6313726, 0, 1, 1,
0.7410397, 1.114849, 2.131551, 0.6392157, 0, 1, 1,
0.7410834, 1.639667, 0.3767854, 0.6431373, 0, 1, 1,
0.7437283, -0.9709287, 1.797382, 0.6509804, 0, 1, 1,
0.7438859, 0.4383645, 1.393748, 0.654902, 0, 1, 1,
0.7472721, 1.366003, 0.4542295, 0.6627451, 0, 1, 1,
0.7493209, 0.06218985, 0.6124743, 0.6666667, 0, 1, 1,
0.7498215, -0.3153778, 1.91687, 0.6745098, 0, 1, 1,
0.7574063, 1.072998, 1.058635, 0.6784314, 0, 1, 1,
0.7607342, 0.305201, 2.677001, 0.6862745, 0, 1, 1,
0.7658908, 1.050291, 1.469584, 0.6901961, 0, 1, 1,
0.7677425, 0.6145445, 2.340864, 0.6980392, 0, 1, 1,
0.7684934, -0.4903967, 1.396457, 0.7058824, 0, 1, 1,
0.7692359, 0.4160781, -0.3305201, 0.7098039, 0, 1, 1,
0.7707981, 0.8326818, -0.2553027, 0.7176471, 0, 1, 1,
0.7714229, 0.2262169, 0.6327329, 0.7215686, 0, 1, 1,
0.7794173, 1.396996, 0.652514, 0.7294118, 0, 1, 1,
0.7839706, 0.3450864, -1.230172, 0.7333333, 0, 1, 1,
0.7905021, -1.026909, 3.990533, 0.7411765, 0, 1, 1,
0.7934565, -0.9148306, 0.9107262, 0.7450981, 0, 1, 1,
0.795128, 0.6150439, 0.5775748, 0.7529412, 0, 1, 1,
0.7958722, 1.086407, 1.55162, 0.7568628, 0, 1, 1,
0.7960135, -0.4596394, 0.8160703, 0.7647059, 0, 1, 1,
0.796071, 1.18728, 2.002089, 0.7686275, 0, 1, 1,
0.797958, -1.173751, 3.819223, 0.7764706, 0, 1, 1,
0.803263, 0.7997721, 1.477897, 0.7803922, 0, 1, 1,
0.8034239, 0.5633271, 0.0976778, 0.7882353, 0, 1, 1,
0.8039433, -0.503226, 2.769907, 0.7921569, 0, 1, 1,
0.805877, 0.2275261, 1.704743, 0.8, 0, 1, 1,
0.8188326, 0.7059005, 0.2500459, 0.8078431, 0, 1, 1,
0.822696, -0.54095, 1.570984, 0.8117647, 0, 1, 1,
0.8452768, 0.5202612, 2.012717, 0.8196079, 0, 1, 1,
0.8504172, 1.943624, 0.214529, 0.8235294, 0, 1, 1,
0.8554447, 1.098374, 1.19472, 0.8313726, 0, 1, 1,
0.8564533, -0.2112765, 2.194656, 0.8352941, 0, 1, 1,
0.8578336, -0.1112341, 1.024547, 0.8431373, 0, 1, 1,
0.8620321, -1.406003, 2.773659, 0.8470588, 0, 1, 1,
0.8629884, -0.1568646, 1.820359, 0.854902, 0, 1, 1,
0.8658318, 0.9735939, 0.4672195, 0.8588235, 0, 1, 1,
0.8707151, -0.2278764, 3.734637, 0.8666667, 0, 1, 1,
0.8776784, -0.5607784, 0.6499662, 0.8705882, 0, 1, 1,
0.8786724, 1.650564, 0.2401135, 0.8784314, 0, 1, 1,
0.8808189, 0.4575413, 1.27661, 0.8823529, 0, 1, 1,
0.8834269, -0.2865653, 2.478292, 0.8901961, 0, 1, 1,
0.8965288, -0.2629195, 0.8733963, 0.8941177, 0, 1, 1,
0.898697, 0.1558279, 0.2724129, 0.9019608, 0, 1, 1,
0.90618, 1.347341, 2.688702, 0.9098039, 0, 1, 1,
0.9080351, 0.1390278, 2.766067, 0.9137255, 0, 1, 1,
0.9081538, -2.115203, 3.617304, 0.9215686, 0, 1, 1,
0.9089593, 0.4419139, 1.425705, 0.9254902, 0, 1, 1,
0.9094908, 1.138977, 0.2948222, 0.9333333, 0, 1, 1,
0.9150915, -0.02781313, 0.9676159, 0.9372549, 0, 1, 1,
0.915865, -0.316604, 1.185076, 0.945098, 0, 1, 1,
0.9161884, 0.6834088, 3.419933, 0.9490196, 0, 1, 1,
0.9184393, 0.9072534, -1.002542, 0.9568627, 0, 1, 1,
0.9210784, 0.7376788, 1.589664, 0.9607843, 0, 1, 1,
0.9288214, -2.157152, 3.726737, 0.9686275, 0, 1, 1,
0.9326144, 0.03800043, 1.96696, 0.972549, 0, 1, 1,
0.9369564, -0.9701234, 3.713027, 0.9803922, 0, 1, 1,
0.9383414, 0.5113857, 0.007699889, 0.9843137, 0, 1, 1,
0.9526184, 1.380199, 0.3892716, 0.9921569, 0, 1, 1,
0.9637642, -0.3604723, 1.571649, 0.9960784, 0, 1, 1,
0.966321, 2.666379, 0.5476491, 1, 0, 0.9960784, 1,
0.9681311, 1.697321, 1.447605, 1, 0, 0.9882353, 1,
0.9714345, 0.7603128, 2.371132, 1, 0, 0.9843137, 1,
0.9769236, -0.8077053, 4.891722, 1, 0, 0.9764706, 1,
0.9782833, -0.3800781, 2.018624, 1, 0, 0.972549, 1,
0.9813243, 0.2139601, 2.254086, 1, 0, 0.9647059, 1,
0.9917064, -1.567476, 3.727451, 1, 0, 0.9607843, 1,
0.9996992, -1.463731, 2.607979, 1, 0, 0.9529412, 1,
1.00637, 1.026923, 1.630858, 1, 0, 0.9490196, 1,
1.009131, -1.297845, 1.746356, 1, 0, 0.9411765, 1,
1.012855, -0.05054753, 2.224649, 1, 0, 0.9372549, 1,
1.017544, -1.307062, 0.8777826, 1, 0, 0.9294118, 1,
1.019572, 2.253896, -1.103876, 1, 0, 0.9254902, 1,
1.020608, 0.07340771, 2.671383, 1, 0, 0.9176471, 1,
1.021986, 0.5634674, 0.8621152, 1, 0, 0.9137255, 1,
1.02422, -0.6331832, 0.7565055, 1, 0, 0.9058824, 1,
1.027313, 1.885098, 0.8778841, 1, 0, 0.9019608, 1,
1.033074, 0.2003337, 2.948275, 1, 0, 0.8941177, 1,
1.033348, 0.2200658, 1.545816, 1, 0, 0.8862745, 1,
1.033755, 0.1472611, 0.7956405, 1, 0, 0.8823529, 1,
1.039064, -0.4201403, 1.81266, 1, 0, 0.8745098, 1,
1.042141, 0.4202405, 2.031672, 1, 0, 0.8705882, 1,
1.045046, -1.464009, 2.774464, 1, 0, 0.8627451, 1,
1.04745, 0.1811475, 2.195138, 1, 0, 0.8588235, 1,
1.049481, 0.3601972, 0.8148379, 1, 0, 0.8509804, 1,
1.052823, 0.5106851, 2.291868, 1, 0, 0.8470588, 1,
1.052927, -0.1754228, 3.33611, 1, 0, 0.8392157, 1,
1.053891, 2.190619, -1.21386, 1, 0, 0.8352941, 1,
1.055143, 1.002998, 1.1082, 1, 0, 0.827451, 1,
1.055627, -1.708425, 1.858823, 1, 0, 0.8235294, 1,
1.056479, -1.383799, 3.097976, 1, 0, 0.8156863, 1,
1.060719, -0.0370222, 0.2917142, 1, 0, 0.8117647, 1,
1.069095, -0.6226884, 2.944326, 1, 0, 0.8039216, 1,
1.094866, 0.6137112, 1.225389, 1, 0, 0.7960784, 1,
1.096583, -1.914744, 2.803477, 1, 0, 0.7921569, 1,
1.100635, 0.5343527, 0.2989951, 1, 0, 0.7843137, 1,
1.101515, -0.1619042, 2.25949, 1, 0, 0.7803922, 1,
1.101546, 0.2543417, 0.9510021, 1, 0, 0.772549, 1,
1.109034, -0.2497768, 0.9088725, 1, 0, 0.7686275, 1,
1.110045, 0.2570981, 1.344312, 1, 0, 0.7607843, 1,
1.111021, 0.7016354, 1.953813, 1, 0, 0.7568628, 1,
1.111821, -1.612094, 1.610221, 1, 0, 0.7490196, 1,
1.119746, 0.1340366, 0.409779, 1, 0, 0.7450981, 1,
1.122023, -0.2601713, 1.305644, 1, 0, 0.7372549, 1,
1.12827, 1.46126, 1.270153, 1, 0, 0.7333333, 1,
1.128993, 0.235679, 0.7143257, 1, 0, 0.7254902, 1,
1.138886, -1.038065, 1.570359, 1, 0, 0.7215686, 1,
1.147445, 1.702164, -0.1790735, 1, 0, 0.7137255, 1,
1.148512, -0.4179952, 1.875354, 1, 0, 0.7098039, 1,
1.150067, -2.936954, 2.821668, 1, 0, 0.7019608, 1,
1.155001, -0.2880031, 0.9569988, 1, 0, 0.6941177, 1,
1.155887, 0.3435308, 1.104167, 1, 0, 0.6901961, 1,
1.159843, -0.537138, 2.769072, 1, 0, 0.682353, 1,
1.174914, 0.6986134, -1.374756, 1, 0, 0.6784314, 1,
1.180849, 1.769139, -0.426122, 1, 0, 0.6705883, 1,
1.180924, 0.8406835, 1.455613, 1, 0, 0.6666667, 1,
1.181904, 1.32444, -1.955485, 1, 0, 0.6588235, 1,
1.188177, -2.426608, 2.25518, 1, 0, 0.654902, 1,
1.2017, -0.8742546, 2.992568, 1, 0, 0.6470588, 1,
1.202071, -0.9488103, 2.521072, 1, 0, 0.6431373, 1,
1.202422, -0.5831514, 2.692513, 1, 0, 0.6352941, 1,
1.202514, 1.256256, 0.2462604, 1, 0, 0.6313726, 1,
1.20347, 0.328952, 0.01393294, 1, 0, 0.6235294, 1,
1.205541, -0.03886572, 2.469375, 1, 0, 0.6196079, 1,
1.209615, -0.2952326, 2.429902, 1, 0, 0.6117647, 1,
1.210727, -0.9995386, 2.102191, 1, 0, 0.6078432, 1,
1.211359, 2.258798, -0.007364308, 1, 0, 0.6, 1,
1.214408, 0.2962525, -0.2428467, 1, 0, 0.5921569, 1,
1.215514, 1.330136, -1.98994, 1, 0, 0.5882353, 1,
1.21562, 0.9183087, 0.5713094, 1, 0, 0.5803922, 1,
1.216543, 0.5753092, 1.675102, 1, 0, 0.5764706, 1,
1.219952, 1.913427, 1.105455, 1, 0, 0.5686275, 1,
1.224267, 0.001531811, 1.955385, 1, 0, 0.5647059, 1,
1.226114, 0.2113332, 2.713848, 1, 0, 0.5568628, 1,
1.228475, 0.006277966, 0.5642424, 1, 0, 0.5529412, 1,
1.234598, 0.2824601, 1.651634, 1, 0, 0.5450981, 1,
1.237338, -1.142335, 1.512617, 1, 0, 0.5411765, 1,
1.239408, -0.1729707, 1.449331, 1, 0, 0.5333334, 1,
1.240383, 0.7694744, 2.288667, 1, 0, 0.5294118, 1,
1.247897, -0.08605593, 2.248599, 1, 0, 0.5215687, 1,
1.259901, 0.5457912, 0.07252621, 1, 0, 0.5176471, 1,
1.281973, 0.7420934, 1.483457, 1, 0, 0.509804, 1,
1.288673, -0.5172481, 3.073392, 1, 0, 0.5058824, 1,
1.299605, -0.6198095, 0.6352051, 1, 0, 0.4980392, 1,
1.308532, 0.1799475, 2.22321, 1, 0, 0.4901961, 1,
1.341467, 0.9902228, 1.265517, 1, 0, 0.4862745, 1,
1.342799, -2.806452, 2.921046, 1, 0, 0.4784314, 1,
1.35639, 0.355405, 2.601504, 1, 0, 0.4745098, 1,
1.360769, 0.6898867, 1.200442, 1, 0, 0.4666667, 1,
1.364753, -1.719695, 1.122758, 1, 0, 0.4627451, 1,
1.368312, 2.215358, 3.26163, 1, 0, 0.454902, 1,
1.370351, 0.2498006, 2.778446, 1, 0, 0.4509804, 1,
1.37097, 0.4180899, 0.8400691, 1, 0, 0.4431373, 1,
1.378271, 1.021101, -1.426797, 1, 0, 0.4392157, 1,
1.410542, -0.3260432, 0.4027947, 1, 0, 0.4313726, 1,
1.414248, 0.09628873, 2.898888, 1, 0, 0.427451, 1,
1.415684, -1.133903, 3.11834, 1, 0, 0.4196078, 1,
1.422204, 0.4912421, 1.45707, 1, 0, 0.4156863, 1,
1.430371, 1.631049, 0.25532, 1, 0, 0.4078431, 1,
1.433917, 0.7215915, 1.342282, 1, 0, 0.4039216, 1,
1.436331, 2.336797, 1.59218, 1, 0, 0.3960784, 1,
1.470057, 1.107164, 0.1725233, 1, 0, 0.3882353, 1,
1.477124, -0.6162967, 1.028828, 1, 0, 0.3843137, 1,
1.490856, -1.351355, 0.5779703, 1, 0, 0.3764706, 1,
1.506541, 0.6941484, 1.743639, 1, 0, 0.372549, 1,
1.508781, -0.3590844, 1.88282, 1, 0, 0.3647059, 1,
1.51353, -0.9222082, 0.3496604, 1, 0, 0.3607843, 1,
1.514726, 1.430848, -1.574163, 1, 0, 0.3529412, 1,
1.531938, -1.348569, 2.467688, 1, 0, 0.3490196, 1,
1.54648, -0.5452515, -0.1373666, 1, 0, 0.3411765, 1,
1.547196, 1.569381, -0.7111257, 1, 0, 0.3372549, 1,
1.549059, 1.856843, 0.245067, 1, 0, 0.3294118, 1,
1.552544, -1.125367, 1.191766, 1, 0, 0.3254902, 1,
1.571459, -0.9490037, 2.983482, 1, 0, 0.3176471, 1,
1.577995, 0.9737124, 3.02572, 1, 0, 0.3137255, 1,
1.613131, 1.206377, -0.3413756, 1, 0, 0.3058824, 1,
1.621418, -0.006438366, 1.332651, 1, 0, 0.2980392, 1,
1.624643, 1.368166, 1.4693, 1, 0, 0.2941177, 1,
1.636329, -3.287688, 3.742142, 1, 0, 0.2862745, 1,
1.640368, -0.4083801, 1.933668, 1, 0, 0.282353, 1,
1.652305, -0.8385905, 2.288097, 1, 0, 0.2745098, 1,
1.652605, 0.1115443, 3.179813, 1, 0, 0.2705882, 1,
1.658805, 1.089276, 0.15792, 1, 0, 0.2627451, 1,
1.663023, 1.963528, 0.06892624, 1, 0, 0.2588235, 1,
1.666163, 1.320925, 1.480381, 1, 0, 0.2509804, 1,
1.668292, 1.665826, 0.850543, 1, 0, 0.2470588, 1,
1.684792, -0.07201373, 1.041662, 1, 0, 0.2392157, 1,
1.711585, -0.7778944, 2.751951, 1, 0, 0.2352941, 1,
1.71333, 0.9558827, 1.093925, 1, 0, 0.227451, 1,
1.738706, 0.5301772, 2.942168, 1, 0, 0.2235294, 1,
1.762403, 2.081501, 1.299216, 1, 0, 0.2156863, 1,
1.762962, -0.7263888, -0.3138863, 1, 0, 0.2117647, 1,
1.766592, 0.3020695, 2.775862, 1, 0, 0.2039216, 1,
1.771604, -2.158504, 4.115525, 1, 0, 0.1960784, 1,
1.775363, 1.228727, -0.9617, 1, 0, 0.1921569, 1,
1.782477, 1.337057, 0.9032297, 1, 0, 0.1843137, 1,
1.792636, 0.9295811, 0.410201, 1, 0, 0.1803922, 1,
1.812455, 0.518654, 1.823444, 1, 0, 0.172549, 1,
1.832039, -0.7524265, 3.043937, 1, 0, 0.1686275, 1,
1.838285, 0.1458725, 1.370047, 1, 0, 0.1607843, 1,
1.851358, 1.193435, 0.7388507, 1, 0, 0.1568628, 1,
1.963635, 0.04686959, 1.251143, 1, 0, 0.1490196, 1,
1.992815, -0.009396258, 2.118005, 1, 0, 0.145098, 1,
1.998446, -1.239261, 1.788542, 1, 0, 0.1372549, 1,
2.047628, -0.2414618, 1.700505, 1, 0, 0.1333333, 1,
2.049608, 2.126347, 1.15121, 1, 0, 0.1254902, 1,
2.09001, 0.9034849, 0.8631246, 1, 0, 0.1215686, 1,
2.202635, -0.5533208, 3.254223, 1, 0, 0.1137255, 1,
2.217776, -0.8880696, 1.097809, 1, 0, 0.1098039, 1,
2.232218, -0.100702, 1.779625, 1, 0, 0.1019608, 1,
2.246322, 0.3068053, 2.806992, 1, 0, 0.09411765, 1,
2.279809, -0.4751713, -0.3157332, 1, 0, 0.09019608, 1,
2.291171, 0.1640039, 2.417133, 1, 0, 0.08235294, 1,
2.320546, 1.025962, -0.1930866, 1, 0, 0.07843138, 1,
2.347539, 0.2726384, 1.128592, 1, 0, 0.07058824, 1,
2.362343, 0.005324349, 2.340786, 1, 0, 0.06666667, 1,
2.373978, 0.1047475, 1.556704, 1, 0, 0.05882353, 1,
2.423212, 0.7958474, 1.116477, 1, 0, 0.05490196, 1,
2.435286, -1.418628, 2.37613, 1, 0, 0.04705882, 1,
2.598078, 1.561143, 2.507222, 1, 0, 0.04313726, 1,
2.62539, -0.487972, 1.311653, 1, 0, 0.03529412, 1,
2.654945, -0.2760616, 0.03511988, 1, 0, 0.03137255, 1,
2.732735, 0.8741063, 2.312415, 1, 0, 0.02352941, 1,
2.827322, -0.1911983, 1.297532, 1, 0, 0.01960784, 1,
2.876257, 0.1903441, 0.3791835, 1, 0, 0.01176471, 1,
3.096901, 0.3714686, 2.415942, 1, 0, 0.007843138, 1
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
-0.008457899, -4.342109, -8.34798, 0, -0.5, 0.5, 0.5,
-0.008457899, -4.342109, -8.34798, 1, -0.5, 0.5, 0.5,
-0.008457899, -4.342109, -8.34798, 1, 1.5, 0.5, 0.5,
-0.008457899, -4.342109, -8.34798, 0, 1.5, 0.5, 0.5
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
-4.166533, -0.1773001, -8.34798, 0, -0.5, 0.5, 0.5,
-4.166533, -0.1773001, -8.34798, 1, -0.5, 0.5, 0.5,
-4.166533, -0.1773001, -8.34798, 1, 1.5, 0.5, 0.5,
-4.166533, -0.1773001, -8.34798, 0, 1.5, 0.5, 0.5
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
-4.166533, -4.342109, -0.4746172, 0, -0.5, 0.5, 0.5,
-4.166533, -4.342109, -0.4746172, 1, -0.5, 0.5, 0.5,
-4.166533, -4.342109, -0.4746172, 1, 1.5, 0.5, 0.5,
-4.166533, -4.342109, -0.4746172, 0, 1.5, 0.5, 0.5
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
-3, -3.380999, -6.531051,
3, -3.380999, -6.531051,
-3, -3.380999, -6.531051,
-3, -3.541184, -6.833872,
-2, -3.380999, -6.531051,
-2, -3.541184, -6.833872,
-1, -3.380999, -6.531051,
-1, -3.541184, -6.833872,
0, -3.380999, -6.531051,
0, -3.541184, -6.833872,
1, -3.380999, -6.531051,
1, -3.541184, -6.833872,
2, -3.380999, -6.531051,
2, -3.541184, -6.833872,
3, -3.380999, -6.531051,
3, -3.541184, -6.833872
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
-3, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
-3, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
-3, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
-3, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
-2, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
-2, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
-2, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
-2, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
-1, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
-1, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
-1, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
-1, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
0, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
0, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
0, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
0, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
1, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
1, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
1, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
1, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
2, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
2, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
2, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
2, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5,
3, -3.861554, -7.439516, 0, -0.5, 0.5, 0.5,
3, -3.861554, -7.439516, 1, -0.5, 0.5, 0.5,
3, -3.861554, -7.439516, 1, 1.5, 0.5, 0.5,
3, -3.861554, -7.439516, 0, 1.5, 0.5, 0.5
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
-3.206978, -3, -6.531051,
-3.206978, 2, -6.531051,
-3.206978, -3, -6.531051,
-3.366904, -3, -6.833872,
-3.206978, -2, -6.531051,
-3.366904, -2, -6.833872,
-3.206978, -1, -6.531051,
-3.366904, -1, -6.833872,
-3.206978, 0, -6.531051,
-3.366904, 0, -6.833872,
-3.206978, 1, -6.531051,
-3.366904, 1, -6.833872,
-3.206978, 2, -6.531051,
-3.366904, 2, -6.833872
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
-3.686755, -3, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, -3, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, -3, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, -3, -7.439516, 0, 1.5, 0.5, 0.5,
-3.686755, -2, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, -2, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, -2, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, -2, -7.439516, 0, 1.5, 0.5, 0.5,
-3.686755, -1, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, -1, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, -1, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, -1, -7.439516, 0, 1.5, 0.5, 0.5,
-3.686755, 0, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, 0, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, 0, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, 0, -7.439516, 0, 1.5, 0.5, 0.5,
-3.686755, 1, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, 1, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, 1, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, 1, -7.439516, 0, 1.5, 0.5, 0.5,
-3.686755, 2, -7.439516, 0, -0.5, 0.5, 0.5,
-3.686755, 2, -7.439516, 1, -0.5, 0.5, 0.5,
-3.686755, 2, -7.439516, 1, 1.5, 0.5, 0.5,
-3.686755, 2, -7.439516, 0, 1.5, 0.5, 0.5
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
-3.206978, -3.380999, -6,
-3.206978, -3.380999, 4,
-3.206978, -3.380999, -6,
-3.366904, -3.541184, -6,
-3.206978, -3.380999, -4,
-3.366904, -3.541184, -4,
-3.206978, -3.380999, -2,
-3.366904, -3.541184, -2,
-3.206978, -3.380999, 0,
-3.366904, -3.541184, 0,
-3.206978, -3.380999, 2,
-3.366904, -3.541184, 2,
-3.206978, -3.380999, 4,
-3.366904, -3.541184, 4
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
-3.686755, -3.861554, -6, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -6, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -6, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, -6, 0, 1.5, 0.5, 0.5,
-3.686755, -3.861554, -4, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -4, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -4, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, -4, 0, 1.5, 0.5, 0.5,
-3.686755, -3.861554, -2, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -2, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, -2, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, -2, 0, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 0, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 0, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 0, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 0, 0, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 2, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 2, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 2, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 2, 0, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 4, 0, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 4, 1, -0.5, 0.5, 0.5,
-3.686755, -3.861554, 4, 1, 1.5, 0.5, 0.5,
-3.686755, -3.861554, 4, 0, 1.5, 0.5, 0.5
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
-3.206978, -3.380999, -6.531051,
-3.206978, 3.026399, -6.531051,
-3.206978, -3.380999, 5.581816,
-3.206978, 3.026399, 5.581816,
-3.206978, -3.380999, -6.531051,
-3.206978, -3.380999, 5.581816,
-3.206978, 3.026399, -6.531051,
-3.206978, 3.026399, 5.581816,
-3.206978, -3.380999, -6.531051,
3.190062, -3.380999, -6.531051,
-3.206978, -3.380999, 5.581816,
3.190062, -3.380999, 5.581816,
-3.206978, 3.026399, -6.531051,
3.190062, 3.026399, -6.531051,
-3.206978, 3.026399, 5.581816,
3.190062, 3.026399, 5.581816,
3.190062, -3.380999, -6.531051,
3.190062, 3.026399, -6.531051,
3.190062, -3.380999, 5.581816,
3.190062, 3.026399, 5.581816,
3.190062, -3.380999, -6.531051,
3.190062, -3.380999, 5.581816,
3.190062, 3.026399, -6.531051,
3.190062, 3.026399, 5.581816
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
var radius = 8.075269;
var distance = 35.92779;
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
mvMatrix.translate( 0.008457899, 0.1773001, 0.4746172 );
mvMatrix.scale( 1.364872, 1.362665, 0.7208153 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.92779);
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
BHC<-read.table("BHC.xyz")
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
-3.113817, -0.5291537, -3.340255, 0, 0, 1, 1, 1,
-2.909163, 0.3914456, -1.985368, 1, 0, 0, 1, 1,
-2.837182, 0.3396822, -0.879796, 1, 0, 0, 1, 1,
-2.834767, 0.3644675, -1.2211, 1, 0, 0, 1, 1,
-2.73796, -0.667665, -2.481337, 1, 0, 0, 1, 1,
-2.735073, -0.1180502, -2.245069, 1, 0, 0, 1, 1,
-2.701431, -1.06956, -2.047101, 0, 0, 0, 1, 1,
-2.636388, -0.6753232, -0.9137515, 0, 0, 0, 1, 1,
-2.625434, -0.8654723, -3.270643, 0, 0, 0, 1, 1,
-2.610956, -0.5493203, -2.599928, 0, 0, 0, 1, 1,
-2.565045, -0.2331602, -0.7898061, 0, 0, 0, 1, 1,
-2.429515, 0.5975693, -2.9596, 0, 0, 0, 1, 1,
-2.297426, -0.1717892, -1.537222, 0, 0, 0, 1, 1,
-2.296959, -0.826364, -1.047094, 1, 1, 1, 1, 1,
-2.259099, -0.6257362, -1.165959, 1, 1, 1, 1, 1,
-2.226673, -0.1167046, 0.05716104, 1, 1, 1, 1, 1,
-2.221092, 0.9570434, -2.01058, 1, 1, 1, 1, 1,
-2.20859, -0.4394681, -2.499328, 1, 1, 1, 1, 1,
-2.205853, 1.033451, -1.472911, 1, 1, 1, 1, 1,
-2.119076, 0.6479509, -1.257464, 1, 1, 1, 1, 1,
-2.114202, 1.644908, -1.485491, 1, 1, 1, 1, 1,
-2.089318, -0.4317241, -1.046845, 1, 1, 1, 1, 1,
-2.074391, -0.308176, -2.329565, 1, 1, 1, 1, 1,
-1.991012, -2.591047, -3.67821, 1, 1, 1, 1, 1,
-1.988475, -1.19578, -2.408878, 1, 1, 1, 1, 1,
-1.968844, 0.4342825, -2.106804, 1, 1, 1, 1, 1,
-1.950134, -0.6211282, -1.560986, 1, 1, 1, 1, 1,
-1.930124, 0.0479516, -1.711657, 1, 1, 1, 1, 1,
-1.925827, 0.09140904, -1.376287, 0, 0, 1, 1, 1,
-1.917747, 0.1199127, -0.9902312, 1, 0, 0, 1, 1,
-1.906927, 0.1733034, -0.8758783, 1, 0, 0, 1, 1,
-1.903632, -0.7003778, -1.600204, 1, 0, 0, 1, 1,
-1.896966, 0.6002952, -1.901404, 1, 0, 0, 1, 1,
-1.890286, -0.2394377, -2.23153, 1, 0, 0, 1, 1,
-1.873415, 1.308432, -2.277773, 0, 0, 0, 1, 1,
-1.803928, -0.9347312, -2.075638, 0, 0, 0, 1, 1,
-1.799605, -0.3110744, -2.000354, 0, 0, 0, 1, 1,
-1.792015, -0.9425984, -3.252441, 0, 0, 0, 1, 1,
-1.79151, -1.695522, -1.689539, 0, 0, 0, 1, 1,
-1.789897, 0.3535339, -2.611017, 0, 0, 0, 1, 1,
-1.788934, -1.422708, -1.659713, 0, 0, 0, 1, 1,
-1.78792, -2.493306, -2.493439, 1, 1, 1, 1, 1,
-1.7876, -0.3416299, -0.4972526, 1, 1, 1, 1, 1,
-1.744451, -1.48404, -1.778807, 1, 1, 1, 1, 1,
-1.732337, -1.272859, -3.051367, 1, 1, 1, 1, 1,
-1.729116, -1.56288, -3.243212, 1, 1, 1, 1, 1,
-1.718582, -0.2173581, -1.687074, 1, 1, 1, 1, 1,
-1.716235, 0.06214565, -2.803755, 1, 1, 1, 1, 1,
-1.708472, 1.074878, -0.2665156, 1, 1, 1, 1, 1,
-1.690928, -0.959139, -1.544878, 1, 1, 1, 1, 1,
-1.686228, -0.4539853, -1.815071, 1, 1, 1, 1, 1,
-1.676867, 1.676367, 0.04746978, 1, 1, 1, 1, 1,
-1.674389, -0.5324405, -2.228828, 1, 1, 1, 1, 1,
-1.633509, -0.4351355, -1.627856, 1, 1, 1, 1, 1,
-1.629132, -0.06257514, -2.245513, 1, 1, 1, 1, 1,
-1.629101, -0.5756884, -1.277369, 1, 1, 1, 1, 1,
-1.561683, -0.4149705, -1.673038, 0, 0, 1, 1, 1,
-1.558486, 0.6412221, 1.604573, 1, 0, 0, 1, 1,
-1.551287, -0.136572, -0.992025, 1, 0, 0, 1, 1,
-1.551122, -1.701172, -2.976032, 1, 0, 0, 1, 1,
-1.547625, 1.202984, -1.91426, 1, 0, 0, 1, 1,
-1.546004, -0.2544631, -2.702768, 1, 0, 0, 1, 1,
-1.54379, 0.594176, -0.2767514, 0, 0, 0, 1, 1,
-1.535532, 0.4375907, 0.1052808, 0, 0, 0, 1, 1,
-1.508061, 0.04482603, -1.147262, 0, 0, 0, 1, 1,
-1.498817, -1.917478, -1.26301, 0, 0, 0, 1, 1,
-1.493645, 0.2237736, -1.766138, 0, 0, 0, 1, 1,
-1.492032, 1.375824, -1.499326, 0, 0, 0, 1, 1,
-1.491838, -0.9555349, -3.210683, 0, 0, 0, 1, 1,
-1.467296, 1.236597, -1.440339, 1, 1, 1, 1, 1,
-1.466326, -0.8463674, -2.018064, 1, 1, 1, 1, 1,
-1.462495, 0.1580021, -1.386876, 1, 1, 1, 1, 1,
-1.457758, -0.6395191, -1.778742, 1, 1, 1, 1, 1,
-1.456516, -0.6086915, -2.659371, 1, 1, 1, 1, 1,
-1.455198, -0.7303588, -2.77534, 1, 1, 1, 1, 1,
-1.422186, -1.291334, -1.931691, 1, 1, 1, 1, 1,
-1.400224, 0.3068449, -1.456252, 1, 1, 1, 1, 1,
-1.396961, -0.2135188, -2.4359, 1, 1, 1, 1, 1,
-1.386563, -0.923229, -1.858159, 1, 1, 1, 1, 1,
-1.386525, -1.277493, -3.017064, 1, 1, 1, 1, 1,
-1.386174, -0.9941692, -1.891546, 1, 1, 1, 1, 1,
-1.379657, 0.1045263, -1.998301, 1, 1, 1, 1, 1,
-1.370561, 1.912209, -1.195613, 1, 1, 1, 1, 1,
-1.36705, 0.1486717, -0.2259127, 1, 1, 1, 1, 1,
-1.359298, 0.653697, -2.238448, 0, 0, 1, 1, 1,
-1.347222, 0.6867337, -1.291402, 1, 0, 0, 1, 1,
-1.34471, 0.4009158, -1.00967, 1, 0, 0, 1, 1,
-1.340987, -0.00582209, -0.2483535, 1, 0, 0, 1, 1,
-1.330734, -0.1007764, -0.3034566, 1, 0, 0, 1, 1,
-1.32702, 0.7088093, -1.372143, 1, 0, 0, 1, 1,
-1.326806, 1.105172, -1.672744, 0, 0, 0, 1, 1,
-1.321472, -0.8961918, -2.416393, 0, 0, 0, 1, 1,
-1.321164, 1.658243, -0.1628909, 0, 0, 0, 1, 1,
-1.320386, -0.3499304, -1.291989, 0, 0, 0, 1, 1,
-1.316173, 0.3297286, -1.010315, 0, 0, 0, 1, 1,
-1.301494, -1.043553, -3.351171, 0, 0, 0, 1, 1,
-1.291762, 1.319371, -1.642432, 0, 0, 0, 1, 1,
-1.287809, 1.228174, -0.8176633, 1, 1, 1, 1, 1,
-1.273872, 0.8868301, -1.656733, 1, 1, 1, 1, 1,
-1.261941, -0.7655784, -3.304278, 1, 1, 1, 1, 1,
-1.25395, -0.2924246, -2.608453, 1, 1, 1, 1, 1,
-1.252742, 0.04027483, -0.4186648, 1, 1, 1, 1, 1,
-1.232559, -0.2098791, -2.529391, 1, 1, 1, 1, 1,
-1.231453, 0.2171226, 1.194301, 1, 1, 1, 1, 1,
-1.213084, 0.5997089, 0.08926572, 1, 1, 1, 1, 1,
-1.213049, 1.516573, -0.2865356, 1, 1, 1, 1, 1,
-1.206971, -0.8433982, -1.541844, 1, 1, 1, 1, 1,
-1.205389, -0.6076039, -3.577946, 1, 1, 1, 1, 1,
-1.205184, -0.6771386, -2.846262, 1, 1, 1, 1, 1,
-1.204803, 0.9316822, 0.9237946, 1, 1, 1, 1, 1,
-1.197916, -0.3074394, -3.168108, 1, 1, 1, 1, 1,
-1.197528, -0.03962296, -2.862278, 1, 1, 1, 1, 1,
-1.195494, -0.5859228, -0.5650526, 0, 0, 1, 1, 1,
-1.19197, -0.8741173, -0.5768024, 1, 0, 0, 1, 1,
-1.191891, -1.024913, -1.726604, 1, 0, 0, 1, 1,
-1.188559, 0.9012496, -1.748394, 1, 0, 0, 1, 1,
-1.186845, 0.4168549, -0.3342839, 1, 0, 0, 1, 1,
-1.178018, -0.5632668, -2.007524, 1, 0, 0, 1, 1,
-1.175841, 1.05387, -1.337909, 0, 0, 0, 1, 1,
-1.158716, -0.07560851, -2.355503, 0, 0, 0, 1, 1,
-1.157239, -0.3881251, -1.702999, 0, 0, 0, 1, 1,
-1.151092, 0.878347, 0.4726638, 0, 0, 0, 1, 1,
-1.147374, -1.096279, -2.101235, 0, 0, 0, 1, 1,
-1.14317, 1.670027, -0.01772979, 0, 0, 0, 1, 1,
-1.136848, -0.1415889, -2.267281, 0, 0, 0, 1, 1,
-1.136521, -0.5371327, -4.897192, 1, 1, 1, 1, 1,
-1.133983, 0.1862708, -1.498045, 1, 1, 1, 1, 1,
-1.116901, 1.25665, -0.5564029, 1, 1, 1, 1, 1,
-1.11563, -0.08958358, -1.3382, 1, 1, 1, 1, 1,
-1.106945, -0.6452967, -1.362701, 1, 1, 1, 1, 1,
-1.105479, 0.6633641, -0.2489038, 1, 1, 1, 1, 1,
-1.105427, -0.4248711, -0.4144713, 1, 1, 1, 1, 1,
-1.097875, -0.04038103, -1.857761, 1, 1, 1, 1, 1,
-1.097517, 0.1124257, -4.125059, 1, 1, 1, 1, 1,
-1.092996, -0.2742046, -3.307868, 1, 1, 1, 1, 1,
-1.092686, -1.670803, -4.587789, 1, 1, 1, 1, 1,
-1.091341, 0.3380024, -1.825782, 1, 1, 1, 1, 1,
-1.087369, 0.7646049, -0.4443267, 1, 1, 1, 1, 1,
-1.085119, -0.1831808, -1.938901, 1, 1, 1, 1, 1,
-1.081921, -0.5508775, -2.446782, 1, 1, 1, 1, 1,
-1.081354, -0.900733, -1.089702, 0, 0, 1, 1, 1,
-1.075527, -0.5367695, -1.236484, 1, 0, 0, 1, 1,
-1.073508, -1.824088, -3.634269, 1, 0, 0, 1, 1,
-1.06579, 0.3174052, -1.281515, 1, 0, 0, 1, 1,
-1.062615, 1.109757, -1.741142, 1, 0, 0, 1, 1,
-1.060977, -0.9959424, -1.623055, 1, 0, 0, 1, 1,
-1.055039, -1.925983, -2.079759, 0, 0, 0, 1, 1,
-1.054523, 0.2001586, -1.112532, 0, 0, 0, 1, 1,
-1.048281, -0.3487839, -3.06424, 0, 0, 0, 1, 1,
-1.043151, -0.04773269, -2.410528, 0, 0, 0, 1, 1,
-1.041843, -0.1049028, -0.6539389, 0, 0, 0, 1, 1,
-1.040022, 0.07378801, -1.029054, 0, 0, 0, 1, 1,
-1.035613, -0.0276985, -0.6406385, 0, 0, 0, 1, 1,
-1.035491, -0.306679, -1.847903, 1, 1, 1, 1, 1,
-1.02997, 0.3501205, -3.661334, 1, 1, 1, 1, 1,
-1.028534, 0.9082807, -1.53306, 1, 1, 1, 1, 1,
-1.023127, 0.4582292, -0.1307668, 1, 1, 1, 1, 1,
-1.02185, 1.118688, -1.174049, 1, 1, 1, 1, 1,
-1.021739, -0.7615377, -1.31578, 1, 1, 1, 1, 1,
-1.021039, -0.007250754, -0.8204651, 1, 1, 1, 1, 1,
-1.006362, 0.3054571, -1.357096, 1, 1, 1, 1, 1,
-1.002137, 0.1231408, -1.399503, 1, 1, 1, 1, 1,
-1.002093, -0.01886633, 0.1857015, 1, 1, 1, 1, 1,
-0.9898685, -0.5122151, -1.792855, 1, 1, 1, 1, 1,
-0.9767417, 0.08730017, -0.5760219, 1, 1, 1, 1, 1,
-0.9766441, 0.5535266, 0.07214908, 1, 1, 1, 1, 1,
-0.9633127, 0.3141257, -0.9876838, 1, 1, 1, 1, 1,
-0.9606561, 0.3944145, -0.5451526, 1, 1, 1, 1, 1,
-0.9539843, 1.723313, -1.096889, 0, 0, 1, 1, 1,
-0.9523456, 1.217178, -1.65918, 1, 0, 0, 1, 1,
-0.9515425, -1.524974, -3.015894, 1, 0, 0, 1, 1,
-0.950193, -0.9248737, -1.424616, 1, 0, 0, 1, 1,
-0.9495977, -0.1787931, -1.14203, 1, 0, 0, 1, 1,
-0.9475789, -0.5659804, -2.13939, 1, 0, 0, 1, 1,
-0.9427477, 0.3609347, -1.343431, 0, 0, 0, 1, 1,
-0.9424481, -1.398427, -2.530922, 0, 0, 0, 1, 1,
-0.9400675, -1.981198, -2.527833, 0, 0, 0, 1, 1,
-0.9374884, -1.395156, -4.560995, 0, 0, 0, 1, 1,
-0.9362496, -0.1184544, -1.241985, 0, 0, 0, 1, 1,
-0.9245657, 0.206858, -0.4763619, 0, 0, 0, 1, 1,
-0.9215752, 0.5575269, -1.423235, 0, 0, 0, 1, 1,
-0.9181149, -1.606869, -1.517438, 1, 1, 1, 1, 1,
-0.9151085, 0.2358889, -0.9105471, 1, 1, 1, 1, 1,
-0.9127786, 0.5040554, 0.9685957, 1, 1, 1, 1, 1,
-0.9119192, 0.6646466, -1.479286, 1, 1, 1, 1, 1,
-0.910957, 0.9211001, -0.8205885, 1, 1, 1, 1, 1,
-0.9091761, -0.7635581, -1.174154, 1, 1, 1, 1, 1,
-0.9080569, 0.3034413, -1.486817, 1, 1, 1, 1, 1,
-0.9011735, 0.5436494, -0.474637, 1, 1, 1, 1, 1,
-0.8986838, -0.2282776, -2.57685, 1, 1, 1, 1, 1,
-0.8964671, 0.4135765, -1.463333, 1, 1, 1, 1, 1,
-0.8940799, -1.032141, -1.237539, 1, 1, 1, 1, 1,
-0.8872626, -0.3282213, -2.004224, 1, 1, 1, 1, 1,
-0.8837392, -0.4974546, -0.6682014, 1, 1, 1, 1, 1,
-0.8792232, -0.2357423, -1.468541, 1, 1, 1, 1, 1,
-0.8725244, 1.914391, -2.677366, 1, 1, 1, 1, 1,
-0.8708176, -1.359794, -1.998821, 0, 0, 1, 1, 1,
-0.8680791, -1.01412, -2.525046, 1, 0, 0, 1, 1,
-0.8649284, -0.7999108, -1.381627, 1, 0, 0, 1, 1,
-0.8611761, -0.5624447, -1.085964, 1, 0, 0, 1, 1,
-0.8582977, 0.02543046, -4.837623, 1, 0, 0, 1, 1,
-0.8552449, 2.510139, -0.7973306, 1, 0, 0, 1, 1,
-0.8518774, 0.9945167, -1.632885, 0, 0, 0, 1, 1,
-0.8465315, 1.722101, -1.308036, 0, 0, 0, 1, 1,
-0.8355762, 1.044566, -0.2890583, 0, 0, 0, 1, 1,
-0.8310738, 0.5097883, -0.4950392, 0, 0, 0, 1, 1,
-0.8301741, -0.2981248, -0.5620157, 0, 0, 0, 1, 1,
-0.8297726, 0.2300747, 0.5900741, 0, 0, 0, 1, 1,
-0.8273784, 1.009656, -0.1019536, 0, 0, 0, 1, 1,
-0.8229662, -0.9838713, -1.772242, 1, 1, 1, 1, 1,
-0.8202249, 2.255201, 0.3780697, 1, 1, 1, 1, 1,
-0.816322, 0.184403, -1.962519, 1, 1, 1, 1, 1,
-0.8148992, 0.3881896, -1.129883, 1, 1, 1, 1, 1,
-0.8137397, -0.5972245, -1.519861, 1, 1, 1, 1, 1,
-0.8128811, 0.07785969, -2.387171, 1, 1, 1, 1, 1,
-0.8086385, -0.3534629, -2.160944, 1, 1, 1, 1, 1,
-0.8066536, -0.09560475, -0.5644389, 1, 1, 1, 1, 1,
-0.8060991, 0.2634003, -1.29241, 1, 1, 1, 1, 1,
-0.8051829, -0.5619896, -1.571613, 1, 1, 1, 1, 1,
-0.8046803, 1.207506, -1.544386, 1, 1, 1, 1, 1,
-0.8028558, 0.2496361, -1.014422, 1, 1, 1, 1, 1,
-0.7899698, -1.893761, -4.492788, 1, 1, 1, 1, 1,
-0.7881879, 0.596296, -0.9713414, 1, 1, 1, 1, 1,
-0.7875115, 0.9705576, -0.9816586, 1, 1, 1, 1, 1,
-0.7729338, 0.9814959, -0.8151834, 0, 0, 1, 1, 1,
-0.7722254, 1.223304, -0.08709829, 1, 0, 0, 1, 1,
-0.7621914, -2.936168, -4.155184, 1, 0, 0, 1, 1,
-0.7612087, 1.657926, 0.8107495, 1, 0, 0, 1, 1,
-0.7524624, -0.4653859, -2.269143, 1, 0, 0, 1, 1,
-0.749764, -0.05647901, -1.886386, 1, 0, 0, 1, 1,
-0.7492739, 1.085048, -1.670038, 0, 0, 0, 1, 1,
-0.7471061, -0.8846707, -1.607549, 0, 0, 0, 1, 1,
-0.745581, -0.8321025, -2.367848, 0, 0, 0, 1, 1,
-0.743974, 1.313756, 1.25595, 0, 0, 0, 1, 1,
-0.7413508, -0.4992488, -2.768385, 0, 0, 0, 1, 1,
-0.7400162, 0.3239624, -0.8344047, 0, 0, 0, 1, 1,
-0.7370679, -0.904604, -4.46819, 0, 0, 0, 1, 1,
-0.7339017, -0.1997469, -2.414619, 1, 1, 1, 1, 1,
-0.7298974, 0.4168905, -1.341037, 1, 1, 1, 1, 1,
-0.729109, -1.430149, -2.375498, 1, 1, 1, 1, 1,
-0.7196718, 0.3913329, -2.384251, 1, 1, 1, 1, 1,
-0.718507, -1.757285, -1.617831, 1, 1, 1, 1, 1,
-0.7089755, 2.233156, -1.218755, 1, 1, 1, 1, 1,
-0.7062587, -0.2083114, -1.700359, 1, 1, 1, 1, 1,
-0.6983356, -1.65166, -5.210189, 1, 1, 1, 1, 1,
-0.6978595, -0.7788773, -2.710653, 1, 1, 1, 1, 1,
-0.6920052, 0.2229024, -2.003886, 1, 1, 1, 1, 1,
-0.6919094, -0.9819896, -0.8429114, 1, 1, 1, 1, 1,
-0.6860306, 0.4905015, -1.534153, 1, 1, 1, 1, 1,
-0.6789797, -1.217572, -1.158958, 1, 1, 1, 1, 1,
-0.6741769, -0.2347636, -1.508596, 1, 1, 1, 1, 1,
-0.6716537, 0.8138897, 0.9313654, 1, 1, 1, 1, 1,
-0.6709775, -0.7885658, -1.954345, 0, 0, 1, 1, 1,
-0.6699188, 0.9641773, -0.9166313, 1, 0, 0, 1, 1,
-0.6682854, -0.8847249, -2.44434, 1, 0, 0, 1, 1,
-0.6672459, -0.1094975, -1.484868, 1, 0, 0, 1, 1,
-0.6669797, -1.467246, -3.211042, 1, 0, 0, 1, 1,
-0.6609253, -1.708887, -1.230374, 1, 0, 0, 1, 1,
-0.6607744, 0.9974813, -2.474042, 0, 0, 0, 1, 1,
-0.6604743, 0.9301752, -0.5920115, 0, 0, 0, 1, 1,
-0.653657, -0.632686, -3.578527, 0, 0, 0, 1, 1,
-0.6490707, -0.01741463, -1.610896, 0, 0, 0, 1, 1,
-0.6421336, -2.986453, -3.792377, 0, 0, 0, 1, 1,
-0.6420258, 2.050967, 1.099612, 0, 0, 0, 1, 1,
-0.6412332, 1.898351, -0.3092041, 0, 0, 0, 1, 1,
-0.6408063, -0.3431992, -0.6083703, 1, 1, 1, 1, 1,
-0.6378342, -0.6242613, -0.5328858, 1, 1, 1, 1, 1,
-0.6358992, -0.02044825, -2.04454, 1, 1, 1, 1, 1,
-0.6285585, 1.299897, -1.512825, 1, 1, 1, 1, 1,
-0.6257533, -0.8963491, -3.02069, 1, 1, 1, 1, 1,
-0.6194658, -0.6754864, -4.222649, 1, 1, 1, 1, 1,
-0.6169295, 0.2487998, -2.472801, 1, 1, 1, 1, 1,
-0.6168027, -0.2963338, -0.8231481, 1, 1, 1, 1, 1,
-0.6165742, 1.057696, -0.6692263, 1, 1, 1, 1, 1,
-0.6142186, 0.408675, -1.167704, 1, 1, 1, 1, 1,
-0.6121247, 0.7497095, -1.204295, 1, 1, 1, 1, 1,
-0.6074033, 0.6956872, -2.073087, 1, 1, 1, 1, 1,
-0.604556, 0.7112831, -1.066669, 1, 1, 1, 1, 1,
-0.6015319, -0.5588444, -3.012594, 1, 1, 1, 1, 1,
-0.5947911, 1.412069, 0.6795239, 1, 1, 1, 1, 1,
-0.5828724, 0.1664874, -0.2549727, 0, 0, 1, 1, 1,
-0.5823308, -0.03790777, -0.7651489, 1, 0, 0, 1, 1,
-0.5751169, 1.343522, 0.02404755, 1, 0, 0, 1, 1,
-0.5715154, -0.1923778, -1.311476, 1, 0, 0, 1, 1,
-0.5672572, 0.004032982, -1.1377, 1, 0, 0, 1, 1,
-0.5671188, -0.4809732, -1.768692, 1, 0, 0, 1, 1,
-0.5651744, 0.3698631, -1.95437, 0, 0, 0, 1, 1,
-0.5628517, -0.9694617, -3.869813, 0, 0, 0, 1, 1,
-0.5599782, 0.1504748, -2.288833, 0, 0, 0, 1, 1,
-0.5578095, -0.4147712, -2.162361, 0, 0, 0, 1, 1,
-0.5561646, 2.030756, -0.2657245, 0, 0, 0, 1, 1,
-0.5543448, 0.2258945, -3.227979, 0, 0, 0, 1, 1,
-0.5506896, -1.725687, -3.311325, 0, 0, 0, 1, 1,
-0.5476928, 1.365044, -0.9430382, 1, 1, 1, 1, 1,
-0.5444968, 0.02759026, -0.4190886, 1, 1, 1, 1, 1,
-0.5430724, -0.4970791, -1.092508, 1, 1, 1, 1, 1,
-0.530946, 0.6801297, -1.798599, 1, 1, 1, 1, 1,
-0.5302017, 0.6038982, 0.1887414, 1, 1, 1, 1, 1,
-0.5274397, 0.8498005, 0.5866031, 1, 1, 1, 1, 1,
-0.5232345, -1.742789, -3.505965, 1, 1, 1, 1, 1,
-0.5227813, 1.327338, -1.329019, 1, 1, 1, 1, 1,
-0.5214401, 2.201218, 0.6545821, 1, 1, 1, 1, 1,
-0.5214158, -1.78974, -2.879292, 1, 1, 1, 1, 1,
-0.5187838, 0.9489758, -1.200484, 1, 1, 1, 1, 1,
-0.5187094, 0.1091072, -1.065344, 1, 1, 1, 1, 1,
-0.5171568, -0.6958905, -2.230259, 1, 1, 1, 1, 1,
-0.5159835, -0.864787, -1.419119, 1, 1, 1, 1, 1,
-0.5139055, 0.3481104, -1.166611, 1, 1, 1, 1, 1,
-0.5133436, 0.5597982, 0.3065974, 0, 0, 1, 1, 1,
-0.5115075, 1.450709, 0.1833876, 1, 0, 0, 1, 1,
-0.5107164, 0.3651613, -1.630697, 1, 0, 0, 1, 1,
-0.5101296, 1.609499, -0.7866547, 1, 0, 0, 1, 1,
-0.507938, -0.8729022, -0.7205815, 1, 0, 0, 1, 1,
-0.4988531, 0.1348235, -2.330927, 1, 0, 0, 1, 1,
-0.4940607, -0.2677881, -1.237903, 0, 0, 0, 1, 1,
-0.4913562, -0.352739, -2.8823, 0, 0, 0, 1, 1,
-0.490701, -0.602594, -3.67453, 0, 0, 0, 1, 1,
-0.490482, 0.3808505, -0.06767733, 0, 0, 0, 1, 1,
-0.4846399, -0.3431377, -0.8266853, 0, 0, 0, 1, 1,
-0.4840857, -0.868515, -2.222239, 0, 0, 0, 1, 1,
-0.4801551, 0.3077006, -1.13004, 0, 0, 0, 1, 1,
-0.4756455, 1.117946, -0.7913123, 1, 1, 1, 1, 1,
-0.4706583, 0.1478233, -2.658442, 1, 1, 1, 1, 1,
-0.4650165, 0.1173528, -1.707263, 1, 1, 1, 1, 1,
-0.4646079, 1.501446, 2.103915, 1, 1, 1, 1, 1,
-0.4645116, -0.0105722, -2.483505, 1, 1, 1, 1, 1,
-0.4626642, -0.7678502, -1.808311, 1, 1, 1, 1, 1,
-0.4590479, 0.1605852, -1.496934, 1, 1, 1, 1, 1,
-0.4589767, 0.506019, -0.9292484, 1, 1, 1, 1, 1,
-0.4554345, -0.8471091, -1.131128, 1, 1, 1, 1, 1,
-0.450798, 0.293478, -0.2404514, 1, 1, 1, 1, 1,
-0.4506235, -0.02587039, -2.097377, 1, 1, 1, 1, 1,
-0.4495944, -0.438019, -2.238073, 1, 1, 1, 1, 1,
-0.4440132, 1.197807, -0.4381274, 1, 1, 1, 1, 1,
-0.443765, -0.2460564, -1.755555, 1, 1, 1, 1, 1,
-0.4395398, 1.189131, -0.4887485, 1, 1, 1, 1, 1,
-0.4393264, -0.2833158, -1.414709, 0, 0, 1, 1, 1,
-0.4310651, 0.5099078, 0.3161633, 1, 0, 0, 1, 1,
-0.4232931, -0.2753317, -2.289623, 1, 0, 0, 1, 1,
-0.4198106, 0.754321, -0.8914548, 1, 0, 0, 1, 1,
-0.4137609, -0.1304617, -1.49835, 1, 0, 0, 1, 1,
-0.4094563, 0.9631579, -0.6277613, 1, 0, 0, 1, 1,
-0.4066012, 0.4860321, 0.3163426, 0, 0, 0, 1, 1,
-0.4056022, 0.067064, -2.834625, 0, 0, 0, 1, 1,
-0.4031964, 1.472951, -0.4858015, 0, 0, 0, 1, 1,
-0.3990746, 2.441589, -1.520758, 0, 0, 0, 1, 1,
-0.3973498, -1.28071, -1.252137, 0, 0, 0, 1, 1,
-0.3958606, -0.07599326, -0.04202672, 0, 0, 0, 1, 1,
-0.3907095, -1.165122, -4.911582, 0, 0, 0, 1, 1,
-0.3805853, -0.8463612, -2.520741, 1, 1, 1, 1, 1,
-0.3755066, -0.2778623, -1.73298, 1, 1, 1, 1, 1,
-0.3716824, 0.2890383, 0.1694669, 1, 1, 1, 1, 1,
-0.3653575, 0.06013433, -1.111175, 1, 1, 1, 1, 1,
-0.3646477, 0.1084064, -1.256347, 1, 1, 1, 1, 1,
-0.3644569, 1.283404, 0.3902753, 1, 1, 1, 1, 1,
-0.3640464, -1.639188, -3.35959, 1, 1, 1, 1, 1,
-0.363761, 0.2138649, -1.679956, 1, 1, 1, 1, 1,
-0.3628967, 1.244069, 1.172813, 1, 1, 1, 1, 1,
-0.3626778, -0.364704, -2.603204, 1, 1, 1, 1, 1,
-0.3571199, 0.3976839, 1.339646, 1, 1, 1, 1, 1,
-0.3564972, -0.7540228, -4.016469, 1, 1, 1, 1, 1,
-0.3557518, 0.3233517, 0.664321, 1, 1, 1, 1, 1,
-0.3530139, -0.9562105, -2.963295, 1, 1, 1, 1, 1,
-0.3515182, -1.31094, -3.986388, 1, 1, 1, 1, 1,
-0.3505594, -2.760256, -4.328643, 0, 0, 1, 1, 1,
-0.3495871, -0.5642611, -1.535365, 1, 0, 0, 1, 1,
-0.349509, -0.4751298, -1.643075, 1, 0, 0, 1, 1,
-0.3485674, -0.2117498, -0.7907626, 1, 0, 0, 1, 1,
-0.3468431, 0.4141718, -0.008880656, 1, 0, 0, 1, 1,
-0.3432603, 0.2581209, -1.951342, 1, 0, 0, 1, 1,
-0.3406448, -0.1900271, -2.818123, 0, 0, 0, 1, 1,
-0.3306934, 0.8061618, -0.1886954, 0, 0, 0, 1, 1,
-0.320997, 0.9889491, 0.9091758, 0, 0, 0, 1, 1,
-0.3205036, 0.9996435, -0.3757402, 0, 0, 0, 1, 1,
-0.3159199, 0.003366984, -0.0332907, 0, 0, 0, 1, 1,
-0.3108025, 0.1564368, -1.78856, 0, 0, 0, 1, 1,
-0.3098028, -0.5643809, -3.281482, 0, 0, 0, 1, 1,
-0.306951, -2.292097, -2.340082, 1, 1, 1, 1, 1,
-0.306206, -0.8701656, -5.148617, 1, 1, 1, 1, 1,
-0.3056309, -0.081311, -2.576548, 1, 1, 1, 1, 1,
-0.3030169, -2.157585, -2.732407, 1, 1, 1, 1, 1,
-0.2969955, -1.167677, -1.939652, 1, 1, 1, 1, 1,
-0.2968534, 0.7669279, -0.03935694, 1, 1, 1, 1, 1,
-0.2952686, -0.6619943, -1.623494, 1, 1, 1, 1, 1,
-0.2923875, -0.3559488, -3.65191, 1, 1, 1, 1, 1,
-0.2918991, 1.073309, 0.4620067, 1, 1, 1, 1, 1,
-0.2903568, 1.367811, 1.182696, 1, 1, 1, 1, 1,
-0.2895901, -0.4772381, -1.07109, 1, 1, 1, 1, 1,
-0.2835027, 0.2567872, -2.437814, 1, 1, 1, 1, 1,
-0.2810653, 0.8185133, -1.064397, 1, 1, 1, 1, 1,
-0.2805989, 0.5574771, 0.1692733, 1, 1, 1, 1, 1,
-0.2794901, -1.345655, -2.947148, 1, 1, 1, 1, 1,
-0.2786047, 0.473597, -1.339048, 0, 0, 1, 1, 1,
-0.2756103, 0.5588494, -0.7833532, 1, 0, 0, 1, 1,
-0.2712826, -2.696046, -3.61321, 1, 0, 0, 1, 1,
-0.2688062, 0.5609006, 0.7361167, 1, 0, 0, 1, 1,
-0.2606799, -0.9841042, -1.599348, 1, 0, 0, 1, 1,
-0.2574293, -0.6722547, -2.872457, 1, 0, 0, 1, 1,
-0.2562056, -2.515074, -0.3806179, 0, 0, 0, 1, 1,
-0.2535498, 1.277138, 0.01387914, 0, 0, 0, 1, 1,
-0.2500544, -1.147439, -3.776535, 0, 0, 0, 1, 1,
-0.2499263, 0.2517636, -3.19093, 0, 0, 0, 1, 1,
-0.248384, -0.2266353, -2.49328, 0, 0, 0, 1, 1,
-0.2478494, -1.89971, -4.36318, 0, 0, 0, 1, 1,
-0.2458474, 0.4539765, 0.2316022, 0, 0, 0, 1, 1,
-0.2457965, -0.4014381, -2.667572, 1, 1, 1, 1, 1,
-0.2432882, 0.2329024, -1.923773, 1, 1, 1, 1, 1,
-0.2382718, -1.172497, -2.503544, 1, 1, 1, 1, 1,
-0.2364353, 0.2736978, -3.101733, 1, 1, 1, 1, 1,
-0.234141, -1.49822, -2.270714, 1, 1, 1, 1, 1,
-0.2333399, 0.5950423, 0.8813564, 1, 1, 1, 1, 1,
-0.2261736, -0.8928227, -3.203754, 1, 1, 1, 1, 1,
-0.2185647, -0.5558135, -3.138657, 1, 1, 1, 1, 1,
-0.2154017, 0.2721574, -0.442085, 1, 1, 1, 1, 1,
-0.2131853, -1.145294, -1.661854, 1, 1, 1, 1, 1,
-0.211659, -0.7294518, -1.463762, 1, 1, 1, 1, 1,
-0.2082664, -0.4052926, -2.698913, 1, 1, 1, 1, 1,
-0.207965, 0.3810406, -0.1871302, 1, 1, 1, 1, 1,
-0.2026768, 1.828721, 0.9147466, 1, 1, 1, 1, 1,
-0.2000453, 0.3058338, -0.7868451, 1, 1, 1, 1, 1,
-0.1992117, 0.7038849, -1.012811, 0, 0, 1, 1, 1,
-0.1974428, -0.05660671, -3.464258, 1, 0, 0, 1, 1,
-0.1971512, -1.530233, -2.968027, 1, 0, 0, 1, 1,
-0.1951322, 0.2420962, 0.01588242, 1, 0, 0, 1, 1,
-0.1907131, -1.111861, -3.778251, 1, 0, 0, 1, 1,
-0.1881436, -0.3713419, -1.58041, 1, 0, 0, 1, 1,
-0.187988, -0.4015038, -1.565642, 0, 0, 0, 1, 1,
-0.1869757, 1.649215, -0.3569612, 0, 0, 0, 1, 1,
-0.1852368, 0.7615059, 1.229598, 0, 0, 0, 1, 1,
-0.1820406, 1.342619, -0.3079642, 0, 0, 0, 1, 1,
-0.1802722, -1.627128, -3.471598, 0, 0, 0, 1, 1,
-0.1787003, -1.275201, -1.46725, 0, 0, 0, 1, 1,
-0.176143, 1.499997, -0.9274494, 0, 0, 0, 1, 1,
-0.1750236, 0.7743109, -0.05714458, 1, 1, 1, 1, 1,
-0.1742836, -0.5114812, -2.290121, 1, 1, 1, 1, 1,
-0.1686417, 0.1376438, 0.5684164, 1, 1, 1, 1, 1,
-0.1658342, -0.1162749, -2.419322, 1, 1, 1, 1, 1,
-0.1628922, -1.487551, -1.153431, 1, 1, 1, 1, 1,
-0.1598349, 0.4240133, 0.001994451, 1, 1, 1, 1, 1,
-0.1596003, 1.137024, -0.4855199, 1, 1, 1, 1, 1,
-0.1595134, 1.482831, 0.3770261, 1, 1, 1, 1, 1,
-0.1583326, -0.002846718, -1.213143, 1, 1, 1, 1, 1,
-0.155632, 0.2508106, -1.423337, 1, 1, 1, 1, 1,
-0.1554249, 0.3579959, 0.06927869, 1, 1, 1, 1, 1,
-0.154965, 0.3930151, 0.2785278, 1, 1, 1, 1, 1,
-0.1536384, 0.6125, -0.8002924, 1, 1, 1, 1, 1,
-0.1507548, 0.9859294, -2.47149, 1, 1, 1, 1, 1,
-0.144912, -0.7320736, -3.238777, 1, 1, 1, 1, 1,
-0.1427993, -2.294229, -1.576898, 0, 0, 1, 1, 1,
-0.1349778, -0.1830362, -1.130772, 1, 0, 0, 1, 1,
-0.1348728, -0.5534485, -3.342299, 1, 0, 0, 1, 1,
-0.1316261, 0.6157137, -0.8334554, 1, 0, 0, 1, 1,
-0.1313912, -0.5671656, -3.0201, 1, 0, 0, 1, 1,
-0.1230342, 0.1879091, -0.492509, 1, 0, 0, 1, 1,
-0.1214834, 0.4492792, -0.6988474, 0, 0, 0, 1, 1,
-0.1169501, -0.8447264, -3.919913, 0, 0, 0, 1, 1,
-0.1124232, -0.7637179, -3.526695, 0, 0, 0, 1, 1,
-0.1099959, 0.06543969, -0.1197735, 0, 0, 0, 1, 1,
-0.1045103, -0.1863634, -3.157085, 0, 0, 0, 1, 1,
-0.1027119, 0.009444632, -1.866862, 0, 0, 0, 1, 1,
-0.101872, -0.3416415, -3.546841, 0, 0, 0, 1, 1,
-0.09746607, 1.268912, -0.5638092, 1, 1, 1, 1, 1,
-0.09737872, -0.05829304, -1.804185, 1, 1, 1, 1, 1,
-0.09609717, -1.404753, -6.35465, 1, 1, 1, 1, 1,
-0.09242892, 1.226324, -0.9189245, 1, 1, 1, 1, 1,
-0.09122486, -0.8186813, -3.448997, 1, 1, 1, 1, 1,
-0.08736803, -1.262215, -3.703281, 1, 1, 1, 1, 1,
-0.08488017, -0.3043467, -2.193333, 1, 1, 1, 1, 1,
-0.0834993, -1.242302, -2.21259, 1, 1, 1, 1, 1,
-0.08328369, -0.6489047, -2.953064, 1, 1, 1, 1, 1,
-0.08168051, 1.123573, -2.402977, 1, 1, 1, 1, 1,
-0.08056029, -0.001815462, -1.032855, 1, 1, 1, 1, 1,
-0.0799292, -0.4907005, -2.428624, 1, 1, 1, 1, 1,
-0.07937695, -1.671034, -2.267347, 1, 1, 1, 1, 1,
-0.07903601, -0.5401269, -3.076463, 1, 1, 1, 1, 1,
-0.07703309, 1.402175, 0.7045533, 1, 1, 1, 1, 1,
-0.07475185, 1.33574, 0.5321376, 0, 0, 1, 1, 1,
-0.07297394, -0.7221053, -1.216815, 1, 0, 0, 1, 1,
-0.06790287, 2.16702, 0.9144785, 1, 0, 0, 1, 1,
-0.06362674, 1.582453, -1.071264, 1, 0, 0, 1, 1,
-0.06247603, -1.173798, -2.124106, 1, 0, 0, 1, 1,
-0.06245413, 0.9680802, -0.2056815, 1, 0, 0, 1, 1,
-0.06237556, -1.479504, -3.991064, 0, 0, 0, 1, 1,
-0.05609978, 1.255563, -1.529344, 0, 0, 0, 1, 1,
-0.04826117, 0.4640448, -0.35376, 0, 0, 0, 1, 1,
-0.04666697, 0.9978831, -0.2539013, 0, 0, 0, 1, 1,
-0.04505832, -0.4130499, -1.457904, 0, 0, 0, 1, 1,
-0.04471935, 1.478307, -0.1966809, 0, 0, 0, 1, 1,
-0.0417405, -0.4359548, -3.600885, 0, 0, 0, 1, 1,
-0.03366869, 1.038741, -0.7487611, 1, 1, 1, 1, 1,
-0.03325565, -0.5308079, -3.188581, 1, 1, 1, 1, 1,
-0.02705969, 1.124935, -1.778457, 1, 1, 1, 1, 1,
-0.02581446, 0.9941235, -1.209508, 1, 1, 1, 1, 1,
-0.02439636, 1.028082, -2.133677, 1, 1, 1, 1, 1,
-0.0231172, 0.7634044, -0.6047971, 1, 1, 1, 1, 1,
-0.02018894, -1.828465, -3.576644, 1, 1, 1, 1, 1,
-0.01731731, -0.1354351, -2.79302, 1, 1, 1, 1, 1,
-0.01543547, -0.4559487, -3.561892, 1, 1, 1, 1, 1,
-0.01346213, -0.8830978, -3.186288, 1, 1, 1, 1, 1,
-0.01279984, -0.2648095, -2.323484, 1, 1, 1, 1, 1,
-0.009078968, 1.068343, 2.947815, 1, 1, 1, 1, 1,
-0.008314366, -0.07842225, -2.877558, 1, 1, 1, 1, 1,
-0.007574548, -2.727632, -2.18021, 1, 1, 1, 1, 1,
-0.00741309, 0.08534305, 2.301753, 1, 1, 1, 1, 1,
-0.005599287, -0.3814303, -4.056643, 0, 0, 1, 1, 1,
0.002895447, -0.08433685, 3.719898, 1, 0, 0, 1, 1,
0.003540447, -0.9048412, 2.389453, 1, 0, 0, 1, 1,
0.005531345, 0.1090392, -0.8271662, 1, 0, 0, 1, 1,
0.006088147, -0.09608265, 2.635561, 1, 0, 0, 1, 1,
0.008801896, -0.2779401, 3.931404, 1, 0, 0, 1, 1,
0.0117648, 1.086432, -1.601422, 0, 0, 0, 1, 1,
0.01496105, -1.272074, 2.260258, 0, 0, 0, 1, 1,
0.01878767, 0.5753809, -0.9830589, 0, 0, 0, 1, 1,
0.01947641, -0.5535197, 3.522249, 0, 0, 0, 1, 1,
0.02261147, -0.1886177, 3.020918, 0, 0, 0, 1, 1,
0.02591901, -0.3029284, 3.130781, 0, 0, 0, 1, 1,
0.02839426, 0.7357533, 1.69486, 0, 0, 0, 1, 1,
0.02925666, -0.897662, 3.363769, 1, 1, 1, 1, 1,
0.03172433, -2.245551, 1.811178, 1, 1, 1, 1, 1,
0.0352656, 0.2472361, -1.017752, 1, 1, 1, 1, 1,
0.0386578, -2.148904, 3.067947, 1, 1, 1, 1, 1,
0.05162149, 1.304749, -0.6574872, 1, 1, 1, 1, 1,
0.05389661, -0.3543423, 4.87543, 1, 1, 1, 1, 1,
0.05412725, -0.5497893, 4.275573, 1, 1, 1, 1, 1,
0.05637284, 2.933088, -0.2673764, 1, 1, 1, 1, 1,
0.05751312, -1.162516, 4.208851, 1, 1, 1, 1, 1,
0.05765009, 0.5514765, 0.1972295, 1, 1, 1, 1, 1,
0.05775458, 0.8878514, 0.7014273, 1, 1, 1, 1, 1,
0.06993423, -0.5899583, 3.587877, 1, 1, 1, 1, 1,
0.07071584, -1.87618, 3.318568, 1, 1, 1, 1, 1,
0.07355352, -0.1334556, 3.008303, 1, 1, 1, 1, 1,
0.07493477, 0.8862985, 0.4453416, 1, 1, 1, 1, 1,
0.07524889, 0.3675446, 0.6174177, 0, 0, 1, 1, 1,
0.07556915, 1.583975, 0.6517515, 1, 0, 0, 1, 1,
0.07597306, -0.0614466, 1.070099, 1, 0, 0, 1, 1,
0.07949811, -1.172094, 2.36675, 1, 0, 0, 1, 1,
0.0800148, -0.04107596, 2.688128, 1, 0, 0, 1, 1,
0.08217401, 1.954199, 0.6513454, 1, 0, 0, 1, 1,
0.08649033, 0.3639924, -0.009068889, 0, 0, 0, 1, 1,
0.08709229, -1.008467, 1.986167, 0, 0, 0, 1, 1,
0.08719546, -0.4966932, 2.760396, 0, 0, 0, 1, 1,
0.08727261, -0.04405195, 2.022827, 0, 0, 0, 1, 1,
0.08931756, 0.2899634, -0.2333432, 0, 0, 0, 1, 1,
0.09051508, -0.05043714, 0.9058641, 0, 0, 0, 1, 1,
0.09464107, -1.640749, 3.794475, 0, 0, 0, 1, 1,
0.09800989, -0.7087241, 3.41574, 1, 1, 1, 1, 1,
0.1020568, 1.113873, -1.116975, 1, 1, 1, 1, 1,
0.1029021, 1.205371, 1.68689, 1, 1, 1, 1, 1,
0.1029693, 0.8444737, -0.01197822, 1, 1, 1, 1, 1,
0.1060421, -1.121799, 2.730465, 1, 1, 1, 1, 1,
0.106329, -1.855507, 3.372454, 1, 1, 1, 1, 1,
0.1099296, -0.586576, 2.602731, 1, 1, 1, 1, 1,
0.113638, -0.7995699, 3.854156, 1, 1, 1, 1, 1,
0.116511, 1.020231, -0.480314, 1, 1, 1, 1, 1,
0.1216878, 0.1442892, -0.8663195, 1, 1, 1, 1, 1,
0.1227462, -0.9709502, 2.448488, 1, 1, 1, 1, 1,
0.1235431, -1.285538, 2.800033, 1, 1, 1, 1, 1,
0.126975, 1.35864, -0.8601625, 1, 1, 1, 1, 1,
0.1286439, -0.06914998, 0.7991356, 1, 1, 1, 1, 1,
0.1286533, -0.8272712, 3.109736, 1, 1, 1, 1, 1,
0.1397362, 0.8703672, -0.5294401, 0, 0, 1, 1, 1,
0.1410218, -1.047806, 2.182547, 1, 0, 0, 1, 1,
0.1476, -1.207859, 1.572252, 1, 0, 0, 1, 1,
0.1533014, 0.2246376, 0.006786386, 1, 0, 0, 1, 1,
0.1534299, 0.8888835, -0.2715372, 1, 0, 0, 1, 1,
0.1591801, -1.218534, 3.395747, 1, 0, 0, 1, 1,
0.1606547, 0.4344771, -0.3212509, 0, 0, 0, 1, 1,
0.1611698, -2.913344, 3.927024, 0, 0, 0, 1, 1,
0.1628925, -1.590954, 3.164446, 0, 0, 0, 1, 1,
0.1670887, -0.3809308, 1.889337, 0, 0, 0, 1, 1,
0.1688038, -1.654513, 2.356256, 0, 0, 0, 1, 1,
0.1728311, 0.5311879, 0.1131968, 0, 0, 0, 1, 1,
0.1751181, 1.246838, -1.024565, 0, 0, 0, 1, 1,
0.1764471, -0.4830638, 2.768574, 1, 1, 1, 1, 1,
0.1766107, -0.9344265, 3.217327, 1, 1, 1, 1, 1,
0.1792892, 1.516563, 0.1875415, 1, 1, 1, 1, 1,
0.1811368, 0.3358813, 1.899953, 1, 1, 1, 1, 1,
0.1824466, -2.113433, 1.984091, 1, 1, 1, 1, 1,
0.1843045, 0.6324387, -0.3167115, 1, 1, 1, 1, 1,
0.1847225, 0.7143735, 1.584526, 1, 1, 1, 1, 1,
0.1849866, -0.2680233, 3.019185, 1, 1, 1, 1, 1,
0.1871845, -0.1091899, 2.454403, 1, 1, 1, 1, 1,
0.1921043, -0.2604485, 2.156771, 1, 1, 1, 1, 1,
0.1982823, 0.7007659, -0.3660216, 1, 1, 1, 1, 1,
0.1992064, 1.975271, -0.8075028, 1, 1, 1, 1, 1,
0.2019077, 1.020557, 0.9155532, 1, 1, 1, 1, 1,
0.2051355, -0.1773782, 1.461153, 1, 1, 1, 1, 1,
0.2058909, 0.5165571, -1.894158, 1, 1, 1, 1, 1,
0.2081058, -1.934515, 3.809355, 0, 0, 1, 1, 1,
0.208916, 1.016421, -0.3589288, 1, 0, 0, 1, 1,
0.2129823, -2.078357, 2.286528, 1, 0, 0, 1, 1,
0.2139725, -0.3361359, 2.870268, 1, 0, 0, 1, 1,
0.2166639, 0.8557919, 0.1591983, 1, 0, 0, 1, 1,
0.2224653, -0.4909267, 0.4744875, 1, 0, 0, 1, 1,
0.2226431, -1.208482, 3.315295, 0, 0, 0, 1, 1,
0.2226522, 2.123271, -1.752357, 0, 0, 0, 1, 1,
0.2265002, 0.6385328, -2.125759, 0, 0, 0, 1, 1,
0.2265354, -0.5226157, 4.666512, 0, 0, 0, 1, 1,
0.2280853, -0.7032178, 4.571241, 0, 0, 0, 1, 1,
0.2342296, -0.3681828, 2.941637, 0, 0, 0, 1, 1,
0.2368028, 1.577079, 1.741591, 0, 0, 0, 1, 1,
0.2404411, -1.509198, 4.630679, 1, 1, 1, 1, 1,
0.2426235, 0.3678681, -0.2005626, 1, 1, 1, 1, 1,
0.2428294, -0.8235214, 1.460456, 1, 1, 1, 1, 1,
0.2465, -0.3308391, 1.743659, 1, 1, 1, 1, 1,
0.2527918, -0.1457845, 0.7426434, 1, 1, 1, 1, 1,
0.2557773, -0.9543687, 3.581634, 1, 1, 1, 1, 1,
0.2561992, 0.5910628, 0.6251241, 1, 1, 1, 1, 1,
0.2570427, -0.8209406, 2.138451, 1, 1, 1, 1, 1,
0.258088, -0.2009221, 4.610011, 1, 1, 1, 1, 1,
0.261015, -1.233682, 4.034265, 1, 1, 1, 1, 1,
0.2626262, -1.459112, 1.893764, 1, 1, 1, 1, 1,
0.2635192, 1.425368, 0.01074202, 1, 1, 1, 1, 1,
0.2661135, -0.62435, 3.499902, 1, 1, 1, 1, 1,
0.2666011, -0.07082968, 1.060259, 1, 1, 1, 1, 1,
0.2702192, 0.3934404, -0.3888505, 1, 1, 1, 1, 1,
0.2733238, 0.0570081, 0.4423452, 0, 0, 1, 1, 1,
0.2734773, 0.4827461, 0.2863396, 1, 0, 0, 1, 1,
0.2742814, 0.2020632, 0.341518, 1, 0, 0, 1, 1,
0.2781792, -0.1119948, -0.4485234, 1, 0, 0, 1, 1,
0.2812833, 0.4511038, 0.6149614, 1, 0, 0, 1, 1,
0.2854644, -0.5951907, 2.281089, 1, 0, 0, 1, 1,
0.2858297, -0.4085858, 4.847928, 0, 0, 0, 1, 1,
0.2899715, -1.184922, 3.222415, 0, 0, 0, 1, 1,
0.2917942, 1.045517, -0.2883282, 0, 0, 0, 1, 1,
0.292921, -0.87179, 2.497919, 0, 0, 0, 1, 1,
0.2930728, -1.758052, 3.290679, 0, 0, 0, 1, 1,
0.293119, 0.1603609, 0.1343967, 0, 0, 0, 1, 1,
0.2939354, -0.8978137, 2.378045, 0, 0, 0, 1, 1,
0.3015884, 0.1624041, 1.398133, 1, 1, 1, 1, 1,
0.3030777, -2.152216, 3.568651, 1, 1, 1, 1, 1,
0.3068209, 1.355387, -0.9765965, 1, 1, 1, 1, 1,
0.3176382, 2.050397, -1.208566, 1, 1, 1, 1, 1,
0.327988, 0.04467174, 2.20012, 1, 1, 1, 1, 1,
0.3316868, 0.4550072, 0.4580967, 1, 1, 1, 1, 1,
0.3321562, 0.2359006, 0.5521827, 1, 1, 1, 1, 1,
0.3324559, 0.01572762, 2.172722, 1, 1, 1, 1, 1,
0.3343208, -0.04195745, 1.356748, 1, 1, 1, 1, 1,
0.3367839, 0.3149784, 1.024958, 1, 1, 1, 1, 1,
0.3374195, -0.4135525, 3.01105, 1, 1, 1, 1, 1,
0.3406913, 0.1534557, -0.3714, 1, 1, 1, 1, 1,
0.3433975, 0.4179966, 0.5482106, 1, 1, 1, 1, 1,
0.346543, -0.5895464, 1.446683, 1, 1, 1, 1, 1,
0.3502412, -1.739824, 2.148287, 1, 1, 1, 1, 1,
0.3532895, -0.857479, 2.026311, 0, 0, 1, 1, 1,
0.3560944, 1.359004, 0.6438652, 1, 0, 0, 1, 1,
0.3573061, -1.388383, 3.454776, 1, 0, 0, 1, 1,
0.3586221, 0.4007577, 0.7534604, 1, 0, 0, 1, 1,
0.3599011, -0.3286512, 2.048761, 1, 0, 0, 1, 1,
0.3619884, -0.05236228, 2.881805, 1, 0, 0, 1, 1,
0.3635512, 0.1300105, 0.3759575, 0, 0, 0, 1, 1,
0.3666367, -0.7855186, 3.631002, 0, 0, 0, 1, 1,
0.3691677, -0.4268002, 3.141701, 0, 0, 0, 1, 1,
0.3721979, 0.08766483, 1.482476, 0, 0, 0, 1, 1,
0.3752243, 1.417588, 0.1263092, 0, 0, 0, 1, 1,
0.3772617, -0.1728187, 2.362098, 0, 0, 0, 1, 1,
0.3826631, 1.570926, 0.1603048, 0, 0, 0, 1, 1,
0.382714, -0.645489, 1.503762, 1, 1, 1, 1, 1,
0.383495, 0.1569155, 2.213542, 1, 1, 1, 1, 1,
0.3852305, -1.331714, 5.405415, 1, 1, 1, 1, 1,
0.3900353, 0.6513414, 0.2065608, 1, 1, 1, 1, 1,
0.390166, 1.032024, -0.9014508, 1, 1, 1, 1, 1,
0.3912347, 0.1726254, 0.9714573, 1, 1, 1, 1, 1,
0.3916186, 0.2173468, 1.620586, 1, 1, 1, 1, 1,
0.3952212, -1.568535, 2.80152, 1, 1, 1, 1, 1,
0.3985447, -1.485817, 1.940259, 1, 1, 1, 1, 1,
0.4023671, -2.300612, 2.512127, 1, 1, 1, 1, 1,
0.4109555, -1.119419, 4.197753, 1, 1, 1, 1, 1,
0.4125563, 0.1187201, 1.852931, 1, 1, 1, 1, 1,
0.414707, -0.5330544, 2.338754, 1, 1, 1, 1, 1,
0.4154848, 0.7252141, 0.3855569, 1, 1, 1, 1, 1,
0.4179369, -0.06528703, 2.400738, 1, 1, 1, 1, 1,
0.4191103, 0.9710423, -0.4121869, 0, 0, 1, 1, 1,
0.4205431, -0.2543218, 1.505654, 1, 0, 0, 1, 1,
0.4249746, 0.7214088, -0.04134158, 1, 0, 0, 1, 1,
0.4268994, -0.164974, 2.782004, 1, 0, 0, 1, 1,
0.4276572, 0.5586361, 1.712601, 1, 0, 0, 1, 1,
0.428364, -0.4895514, 1.554795, 1, 0, 0, 1, 1,
0.4343034, -0.6593386, 4.09069, 0, 0, 0, 1, 1,
0.4350773, 0.05853593, 2.536287, 0, 0, 0, 1, 1,
0.4384165, 1.844221, 0.2156538, 0, 0, 0, 1, 1,
0.4455862, -0.01264724, 0.092697, 0, 0, 0, 1, 1,
0.4469775, 0.04492373, 2.424704, 0, 0, 0, 1, 1,
0.4470124, -0.290742, 2.60377, 0, 0, 0, 1, 1,
0.4473631, -1.43849, 1.002102, 0, 0, 0, 1, 1,
0.4482234, 0.8066964, 0.5157812, 1, 1, 1, 1, 1,
0.4498562, 0.05149736, 0.4319003, 1, 1, 1, 1, 1,
0.4511204, 0.07813826, 0.9429458, 1, 1, 1, 1, 1,
0.4511628, -1.294452, 2.375468, 1, 1, 1, 1, 1,
0.4581172, -0.5374911, 0.7413008, 1, 1, 1, 1, 1,
0.460442, -0.0891255, 0.6245258, 1, 1, 1, 1, 1,
0.4618263, 0.4812696, 0.3865971, 1, 1, 1, 1, 1,
0.4621993, 0.4328972, 0.413961, 1, 1, 1, 1, 1,
0.4639679, -0.4053287, -0.6941547, 1, 1, 1, 1, 1,
0.4659836, 0.3030093, 2.33486, 1, 1, 1, 1, 1,
0.4758675, -0.2055776, 0.9779668, 1, 1, 1, 1, 1,
0.476943, 1.260521, 1.039442, 1, 1, 1, 1, 1,
0.4789913, 0.3995161, -1.112866, 1, 1, 1, 1, 1,
0.4816653, 2.200617, 0.4207538, 1, 1, 1, 1, 1,
0.4824507, -1.739634, 4.564583, 1, 1, 1, 1, 1,
0.48427, 0.9146391, 0.8081241, 0, 0, 1, 1, 1,
0.4867444, -0.5212444, 3.404787, 1, 0, 0, 1, 1,
0.4902546, -0.6102549, 2.041455, 1, 0, 0, 1, 1,
0.4927636, 0.4487818, 1.692966, 1, 0, 0, 1, 1,
0.4927909, -1.387867, 3.292616, 1, 0, 0, 1, 1,
0.4935671, -1.194297, 4.204425, 1, 0, 0, 1, 1,
0.5087622, -0.8766762, 2.413328, 0, 0, 0, 1, 1,
0.5091577, 0.9513828, 0.2538381, 0, 0, 0, 1, 1,
0.5126079, -0.7235017, 3.377924, 0, 0, 0, 1, 1,
0.5164365, -0.659284, 1.934585, 0, 0, 0, 1, 1,
0.5192624, -0.6255206, 0.5231471, 0, 0, 0, 1, 1,
0.5262969, 0.4646571, -0.335427, 0, 0, 0, 1, 1,
0.5348141, 0.03961825, 0.9921178, 0, 0, 0, 1, 1,
0.5362781, -0.1591986, 3.29987, 1, 1, 1, 1, 1,
0.5400586, -0.1838295, 2.820802, 1, 1, 1, 1, 1,
0.5411313, 1.713145, -0.3600324, 1, 1, 1, 1, 1,
0.5416569, -0.1307906, -0.4238931, 1, 1, 1, 1, 1,
0.5417487, 0.7053645, 0.03589158, 1, 1, 1, 1, 1,
0.5450488, -0.5535189, 2.419019, 1, 1, 1, 1, 1,
0.5531899, 1.669102, -0.05480983, 1, 1, 1, 1, 1,
0.5610609, 0.1708983, 0.730197, 1, 1, 1, 1, 1,
0.5611939, 0.6120957, 0.8905614, 1, 1, 1, 1, 1,
0.5617953, -0.2749656, 2.944933, 1, 1, 1, 1, 1,
0.5636806, -0.2381336, 0.1487824, 1, 1, 1, 1, 1,
0.5694897, -1.511196, 2.854942, 1, 1, 1, 1, 1,
0.5712342, 0.4184822, -0.03942518, 1, 1, 1, 1, 1,
0.5737311, -0.289944, 2.793973, 1, 1, 1, 1, 1,
0.5752652, 1.814182, 0.830502, 1, 1, 1, 1, 1,
0.5775488, 0.2444146, 0.1745533, 0, 0, 1, 1, 1,
0.5794514, -1.296068, 1.134621, 1, 0, 0, 1, 1,
0.5865916, -0.3786145, 0.3679669, 1, 0, 0, 1, 1,
0.5875974, -0.8678409, 2.049887, 1, 0, 0, 1, 1,
0.5880914, -0.8507829, 4.534615, 1, 0, 0, 1, 1,
0.6023393, 1.149318, -0.3742643, 1, 0, 0, 1, 1,
0.6063953, -1.803573, 1.60211, 0, 0, 0, 1, 1,
0.6082173, -0.09602321, 1.950124, 0, 0, 0, 1, 1,
0.6144679, -0.3144009, 2.353441, 0, 0, 0, 1, 1,
0.6160734, -2.190655, 2.827774, 0, 0, 0, 1, 1,
0.6199845, -0.2917982, 0.7230536, 0, 0, 0, 1, 1,
0.6204285, -1.74873, 2.140101, 0, 0, 0, 1, 1,
0.6237861, -1.022059, 0.4834017, 0, 0, 0, 1, 1,
0.6254179, 0.62248, 0.3379064, 1, 1, 1, 1, 1,
0.6310967, 0.297236, 2.606684, 1, 1, 1, 1, 1,
0.6357452, 0.7908994, 0.05382336, 1, 1, 1, 1, 1,
0.641439, -0.6085601, 0.9537529, 1, 1, 1, 1, 1,
0.6447931, -1.296738, 2.522854, 1, 1, 1, 1, 1,
0.6478731, -1.152631, 3.614056, 1, 1, 1, 1, 1,
0.6503313, 0.5987378, -0.4805284, 1, 1, 1, 1, 1,
0.6532214, -1.837571, 3.089423, 1, 1, 1, 1, 1,
0.6646361, 0.1790489, 1.488895, 1, 1, 1, 1, 1,
0.6759264, 0.1324133, 2.148603, 1, 1, 1, 1, 1,
0.6759559, 0.007234302, 0.9866579, 1, 1, 1, 1, 1,
0.6766685, -0.3252375, 1.561794, 1, 1, 1, 1, 1,
0.6793268, -1.423323, 1.779616, 1, 1, 1, 1, 1,
0.6803544, -0.8216588, 3.189991, 1, 1, 1, 1, 1,
0.6875648, -0.333157, 0.1779514, 1, 1, 1, 1, 1,
0.6892041, 0.9743565, -1.398337, 0, 0, 1, 1, 1,
0.6899678, -0.8943431, 2.986442, 1, 0, 0, 1, 1,
0.6906305, 0.6571141, 0.9434289, 1, 0, 0, 1, 1,
0.6911354, 1.423996, 1.067182, 1, 0, 0, 1, 1,
0.6977054, -0.2622273, 2.540958, 1, 0, 0, 1, 1,
0.7022999, 0.5554823, 0.04221373, 1, 0, 0, 1, 1,
0.7027727, -1.391493, 4.922059, 0, 0, 0, 1, 1,
0.7055477, -0.9059272, 3.769614, 0, 0, 0, 1, 1,
0.7058136, 0.402067, 1.372167, 0, 0, 0, 1, 1,
0.7070363, 0.875118, 0.3969605, 0, 0, 0, 1, 1,
0.707289, 1.209906, -0.194552, 0, 0, 0, 1, 1,
0.713622, -2.193128, 1.146403, 0, 0, 0, 1, 1,
0.7223527, 0.04550545, 2.926189, 0, 0, 0, 1, 1,
0.7238054, 0.9224116, 1.250714, 1, 1, 1, 1, 1,
0.7279896, -1.068422, 3.113352, 1, 1, 1, 1, 1,
0.733413, 1.683923, -0.429368, 1, 1, 1, 1, 1,
0.7402701, 0.8399003, 2.591244, 1, 1, 1, 1, 1,
0.7410397, 1.114849, 2.131551, 1, 1, 1, 1, 1,
0.7410834, 1.639667, 0.3767854, 1, 1, 1, 1, 1,
0.7437283, -0.9709287, 1.797382, 1, 1, 1, 1, 1,
0.7438859, 0.4383645, 1.393748, 1, 1, 1, 1, 1,
0.7472721, 1.366003, 0.4542295, 1, 1, 1, 1, 1,
0.7493209, 0.06218985, 0.6124743, 1, 1, 1, 1, 1,
0.7498215, -0.3153778, 1.91687, 1, 1, 1, 1, 1,
0.7574063, 1.072998, 1.058635, 1, 1, 1, 1, 1,
0.7607342, 0.305201, 2.677001, 1, 1, 1, 1, 1,
0.7658908, 1.050291, 1.469584, 1, 1, 1, 1, 1,
0.7677425, 0.6145445, 2.340864, 1, 1, 1, 1, 1,
0.7684934, -0.4903967, 1.396457, 0, 0, 1, 1, 1,
0.7692359, 0.4160781, -0.3305201, 1, 0, 0, 1, 1,
0.7707981, 0.8326818, -0.2553027, 1, 0, 0, 1, 1,
0.7714229, 0.2262169, 0.6327329, 1, 0, 0, 1, 1,
0.7794173, 1.396996, 0.652514, 1, 0, 0, 1, 1,
0.7839706, 0.3450864, -1.230172, 1, 0, 0, 1, 1,
0.7905021, -1.026909, 3.990533, 0, 0, 0, 1, 1,
0.7934565, -0.9148306, 0.9107262, 0, 0, 0, 1, 1,
0.795128, 0.6150439, 0.5775748, 0, 0, 0, 1, 1,
0.7958722, 1.086407, 1.55162, 0, 0, 0, 1, 1,
0.7960135, -0.4596394, 0.8160703, 0, 0, 0, 1, 1,
0.796071, 1.18728, 2.002089, 0, 0, 0, 1, 1,
0.797958, -1.173751, 3.819223, 0, 0, 0, 1, 1,
0.803263, 0.7997721, 1.477897, 1, 1, 1, 1, 1,
0.8034239, 0.5633271, 0.0976778, 1, 1, 1, 1, 1,
0.8039433, -0.503226, 2.769907, 1, 1, 1, 1, 1,
0.805877, 0.2275261, 1.704743, 1, 1, 1, 1, 1,
0.8188326, 0.7059005, 0.2500459, 1, 1, 1, 1, 1,
0.822696, -0.54095, 1.570984, 1, 1, 1, 1, 1,
0.8452768, 0.5202612, 2.012717, 1, 1, 1, 1, 1,
0.8504172, 1.943624, 0.214529, 1, 1, 1, 1, 1,
0.8554447, 1.098374, 1.19472, 1, 1, 1, 1, 1,
0.8564533, -0.2112765, 2.194656, 1, 1, 1, 1, 1,
0.8578336, -0.1112341, 1.024547, 1, 1, 1, 1, 1,
0.8620321, -1.406003, 2.773659, 1, 1, 1, 1, 1,
0.8629884, -0.1568646, 1.820359, 1, 1, 1, 1, 1,
0.8658318, 0.9735939, 0.4672195, 1, 1, 1, 1, 1,
0.8707151, -0.2278764, 3.734637, 1, 1, 1, 1, 1,
0.8776784, -0.5607784, 0.6499662, 0, 0, 1, 1, 1,
0.8786724, 1.650564, 0.2401135, 1, 0, 0, 1, 1,
0.8808189, 0.4575413, 1.27661, 1, 0, 0, 1, 1,
0.8834269, -0.2865653, 2.478292, 1, 0, 0, 1, 1,
0.8965288, -0.2629195, 0.8733963, 1, 0, 0, 1, 1,
0.898697, 0.1558279, 0.2724129, 1, 0, 0, 1, 1,
0.90618, 1.347341, 2.688702, 0, 0, 0, 1, 1,
0.9080351, 0.1390278, 2.766067, 0, 0, 0, 1, 1,
0.9081538, -2.115203, 3.617304, 0, 0, 0, 1, 1,
0.9089593, 0.4419139, 1.425705, 0, 0, 0, 1, 1,
0.9094908, 1.138977, 0.2948222, 0, 0, 0, 1, 1,
0.9150915, -0.02781313, 0.9676159, 0, 0, 0, 1, 1,
0.915865, -0.316604, 1.185076, 0, 0, 0, 1, 1,
0.9161884, 0.6834088, 3.419933, 1, 1, 1, 1, 1,
0.9184393, 0.9072534, -1.002542, 1, 1, 1, 1, 1,
0.9210784, 0.7376788, 1.589664, 1, 1, 1, 1, 1,
0.9288214, -2.157152, 3.726737, 1, 1, 1, 1, 1,
0.9326144, 0.03800043, 1.96696, 1, 1, 1, 1, 1,
0.9369564, -0.9701234, 3.713027, 1, 1, 1, 1, 1,
0.9383414, 0.5113857, 0.007699889, 1, 1, 1, 1, 1,
0.9526184, 1.380199, 0.3892716, 1, 1, 1, 1, 1,
0.9637642, -0.3604723, 1.571649, 1, 1, 1, 1, 1,
0.966321, 2.666379, 0.5476491, 1, 1, 1, 1, 1,
0.9681311, 1.697321, 1.447605, 1, 1, 1, 1, 1,
0.9714345, 0.7603128, 2.371132, 1, 1, 1, 1, 1,
0.9769236, -0.8077053, 4.891722, 1, 1, 1, 1, 1,
0.9782833, -0.3800781, 2.018624, 1, 1, 1, 1, 1,
0.9813243, 0.2139601, 2.254086, 1, 1, 1, 1, 1,
0.9917064, -1.567476, 3.727451, 0, 0, 1, 1, 1,
0.9996992, -1.463731, 2.607979, 1, 0, 0, 1, 1,
1.00637, 1.026923, 1.630858, 1, 0, 0, 1, 1,
1.009131, -1.297845, 1.746356, 1, 0, 0, 1, 1,
1.012855, -0.05054753, 2.224649, 1, 0, 0, 1, 1,
1.017544, -1.307062, 0.8777826, 1, 0, 0, 1, 1,
1.019572, 2.253896, -1.103876, 0, 0, 0, 1, 1,
1.020608, 0.07340771, 2.671383, 0, 0, 0, 1, 1,
1.021986, 0.5634674, 0.8621152, 0, 0, 0, 1, 1,
1.02422, -0.6331832, 0.7565055, 0, 0, 0, 1, 1,
1.027313, 1.885098, 0.8778841, 0, 0, 0, 1, 1,
1.033074, 0.2003337, 2.948275, 0, 0, 0, 1, 1,
1.033348, 0.2200658, 1.545816, 0, 0, 0, 1, 1,
1.033755, 0.1472611, 0.7956405, 1, 1, 1, 1, 1,
1.039064, -0.4201403, 1.81266, 1, 1, 1, 1, 1,
1.042141, 0.4202405, 2.031672, 1, 1, 1, 1, 1,
1.045046, -1.464009, 2.774464, 1, 1, 1, 1, 1,
1.04745, 0.1811475, 2.195138, 1, 1, 1, 1, 1,
1.049481, 0.3601972, 0.8148379, 1, 1, 1, 1, 1,
1.052823, 0.5106851, 2.291868, 1, 1, 1, 1, 1,
1.052927, -0.1754228, 3.33611, 1, 1, 1, 1, 1,
1.053891, 2.190619, -1.21386, 1, 1, 1, 1, 1,
1.055143, 1.002998, 1.1082, 1, 1, 1, 1, 1,
1.055627, -1.708425, 1.858823, 1, 1, 1, 1, 1,
1.056479, -1.383799, 3.097976, 1, 1, 1, 1, 1,
1.060719, -0.0370222, 0.2917142, 1, 1, 1, 1, 1,
1.069095, -0.6226884, 2.944326, 1, 1, 1, 1, 1,
1.094866, 0.6137112, 1.225389, 1, 1, 1, 1, 1,
1.096583, -1.914744, 2.803477, 0, 0, 1, 1, 1,
1.100635, 0.5343527, 0.2989951, 1, 0, 0, 1, 1,
1.101515, -0.1619042, 2.25949, 1, 0, 0, 1, 1,
1.101546, 0.2543417, 0.9510021, 1, 0, 0, 1, 1,
1.109034, -0.2497768, 0.9088725, 1, 0, 0, 1, 1,
1.110045, 0.2570981, 1.344312, 1, 0, 0, 1, 1,
1.111021, 0.7016354, 1.953813, 0, 0, 0, 1, 1,
1.111821, -1.612094, 1.610221, 0, 0, 0, 1, 1,
1.119746, 0.1340366, 0.409779, 0, 0, 0, 1, 1,
1.122023, -0.2601713, 1.305644, 0, 0, 0, 1, 1,
1.12827, 1.46126, 1.270153, 0, 0, 0, 1, 1,
1.128993, 0.235679, 0.7143257, 0, 0, 0, 1, 1,
1.138886, -1.038065, 1.570359, 0, 0, 0, 1, 1,
1.147445, 1.702164, -0.1790735, 1, 1, 1, 1, 1,
1.148512, -0.4179952, 1.875354, 1, 1, 1, 1, 1,
1.150067, -2.936954, 2.821668, 1, 1, 1, 1, 1,
1.155001, -0.2880031, 0.9569988, 1, 1, 1, 1, 1,
1.155887, 0.3435308, 1.104167, 1, 1, 1, 1, 1,
1.159843, -0.537138, 2.769072, 1, 1, 1, 1, 1,
1.174914, 0.6986134, -1.374756, 1, 1, 1, 1, 1,
1.180849, 1.769139, -0.426122, 1, 1, 1, 1, 1,
1.180924, 0.8406835, 1.455613, 1, 1, 1, 1, 1,
1.181904, 1.32444, -1.955485, 1, 1, 1, 1, 1,
1.188177, -2.426608, 2.25518, 1, 1, 1, 1, 1,
1.2017, -0.8742546, 2.992568, 1, 1, 1, 1, 1,
1.202071, -0.9488103, 2.521072, 1, 1, 1, 1, 1,
1.202422, -0.5831514, 2.692513, 1, 1, 1, 1, 1,
1.202514, 1.256256, 0.2462604, 1, 1, 1, 1, 1,
1.20347, 0.328952, 0.01393294, 0, 0, 1, 1, 1,
1.205541, -0.03886572, 2.469375, 1, 0, 0, 1, 1,
1.209615, -0.2952326, 2.429902, 1, 0, 0, 1, 1,
1.210727, -0.9995386, 2.102191, 1, 0, 0, 1, 1,
1.211359, 2.258798, -0.007364308, 1, 0, 0, 1, 1,
1.214408, 0.2962525, -0.2428467, 1, 0, 0, 1, 1,
1.215514, 1.330136, -1.98994, 0, 0, 0, 1, 1,
1.21562, 0.9183087, 0.5713094, 0, 0, 0, 1, 1,
1.216543, 0.5753092, 1.675102, 0, 0, 0, 1, 1,
1.219952, 1.913427, 1.105455, 0, 0, 0, 1, 1,
1.224267, 0.001531811, 1.955385, 0, 0, 0, 1, 1,
1.226114, 0.2113332, 2.713848, 0, 0, 0, 1, 1,
1.228475, 0.006277966, 0.5642424, 0, 0, 0, 1, 1,
1.234598, 0.2824601, 1.651634, 1, 1, 1, 1, 1,
1.237338, -1.142335, 1.512617, 1, 1, 1, 1, 1,
1.239408, -0.1729707, 1.449331, 1, 1, 1, 1, 1,
1.240383, 0.7694744, 2.288667, 1, 1, 1, 1, 1,
1.247897, -0.08605593, 2.248599, 1, 1, 1, 1, 1,
1.259901, 0.5457912, 0.07252621, 1, 1, 1, 1, 1,
1.281973, 0.7420934, 1.483457, 1, 1, 1, 1, 1,
1.288673, -0.5172481, 3.073392, 1, 1, 1, 1, 1,
1.299605, -0.6198095, 0.6352051, 1, 1, 1, 1, 1,
1.308532, 0.1799475, 2.22321, 1, 1, 1, 1, 1,
1.341467, 0.9902228, 1.265517, 1, 1, 1, 1, 1,
1.342799, -2.806452, 2.921046, 1, 1, 1, 1, 1,
1.35639, 0.355405, 2.601504, 1, 1, 1, 1, 1,
1.360769, 0.6898867, 1.200442, 1, 1, 1, 1, 1,
1.364753, -1.719695, 1.122758, 1, 1, 1, 1, 1,
1.368312, 2.215358, 3.26163, 0, 0, 1, 1, 1,
1.370351, 0.2498006, 2.778446, 1, 0, 0, 1, 1,
1.37097, 0.4180899, 0.8400691, 1, 0, 0, 1, 1,
1.378271, 1.021101, -1.426797, 1, 0, 0, 1, 1,
1.410542, -0.3260432, 0.4027947, 1, 0, 0, 1, 1,
1.414248, 0.09628873, 2.898888, 1, 0, 0, 1, 1,
1.415684, -1.133903, 3.11834, 0, 0, 0, 1, 1,
1.422204, 0.4912421, 1.45707, 0, 0, 0, 1, 1,
1.430371, 1.631049, 0.25532, 0, 0, 0, 1, 1,
1.433917, 0.7215915, 1.342282, 0, 0, 0, 1, 1,
1.436331, 2.336797, 1.59218, 0, 0, 0, 1, 1,
1.470057, 1.107164, 0.1725233, 0, 0, 0, 1, 1,
1.477124, -0.6162967, 1.028828, 0, 0, 0, 1, 1,
1.490856, -1.351355, 0.5779703, 1, 1, 1, 1, 1,
1.506541, 0.6941484, 1.743639, 1, 1, 1, 1, 1,
1.508781, -0.3590844, 1.88282, 1, 1, 1, 1, 1,
1.51353, -0.9222082, 0.3496604, 1, 1, 1, 1, 1,
1.514726, 1.430848, -1.574163, 1, 1, 1, 1, 1,
1.531938, -1.348569, 2.467688, 1, 1, 1, 1, 1,
1.54648, -0.5452515, -0.1373666, 1, 1, 1, 1, 1,
1.547196, 1.569381, -0.7111257, 1, 1, 1, 1, 1,
1.549059, 1.856843, 0.245067, 1, 1, 1, 1, 1,
1.552544, -1.125367, 1.191766, 1, 1, 1, 1, 1,
1.571459, -0.9490037, 2.983482, 1, 1, 1, 1, 1,
1.577995, 0.9737124, 3.02572, 1, 1, 1, 1, 1,
1.613131, 1.206377, -0.3413756, 1, 1, 1, 1, 1,
1.621418, -0.006438366, 1.332651, 1, 1, 1, 1, 1,
1.624643, 1.368166, 1.4693, 1, 1, 1, 1, 1,
1.636329, -3.287688, 3.742142, 0, 0, 1, 1, 1,
1.640368, -0.4083801, 1.933668, 1, 0, 0, 1, 1,
1.652305, -0.8385905, 2.288097, 1, 0, 0, 1, 1,
1.652605, 0.1115443, 3.179813, 1, 0, 0, 1, 1,
1.658805, 1.089276, 0.15792, 1, 0, 0, 1, 1,
1.663023, 1.963528, 0.06892624, 1, 0, 0, 1, 1,
1.666163, 1.320925, 1.480381, 0, 0, 0, 1, 1,
1.668292, 1.665826, 0.850543, 0, 0, 0, 1, 1,
1.684792, -0.07201373, 1.041662, 0, 0, 0, 1, 1,
1.711585, -0.7778944, 2.751951, 0, 0, 0, 1, 1,
1.71333, 0.9558827, 1.093925, 0, 0, 0, 1, 1,
1.738706, 0.5301772, 2.942168, 0, 0, 0, 1, 1,
1.762403, 2.081501, 1.299216, 0, 0, 0, 1, 1,
1.762962, -0.7263888, -0.3138863, 1, 1, 1, 1, 1,
1.766592, 0.3020695, 2.775862, 1, 1, 1, 1, 1,
1.771604, -2.158504, 4.115525, 1, 1, 1, 1, 1,
1.775363, 1.228727, -0.9617, 1, 1, 1, 1, 1,
1.782477, 1.337057, 0.9032297, 1, 1, 1, 1, 1,
1.792636, 0.9295811, 0.410201, 1, 1, 1, 1, 1,
1.812455, 0.518654, 1.823444, 1, 1, 1, 1, 1,
1.832039, -0.7524265, 3.043937, 1, 1, 1, 1, 1,
1.838285, 0.1458725, 1.370047, 1, 1, 1, 1, 1,
1.851358, 1.193435, 0.7388507, 1, 1, 1, 1, 1,
1.963635, 0.04686959, 1.251143, 1, 1, 1, 1, 1,
1.992815, -0.009396258, 2.118005, 1, 1, 1, 1, 1,
1.998446, -1.239261, 1.788542, 1, 1, 1, 1, 1,
2.047628, -0.2414618, 1.700505, 1, 1, 1, 1, 1,
2.049608, 2.126347, 1.15121, 1, 1, 1, 1, 1,
2.09001, 0.9034849, 0.8631246, 0, 0, 1, 1, 1,
2.202635, -0.5533208, 3.254223, 1, 0, 0, 1, 1,
2.217776, -0.8880696, 1.097809, 1, 0, 0, 1, 1,
2.232218, -0.100702, 1.779625, 1, 0, 0, 1, 1,
2.246322, 0.3068053, 2.806992, 1, 0, 0, 1, 1,
2.279809, -0.4751713, -0.3157332, 1, 0, 0, 1, 1,
2.291171, 0.1640039, 2.417133, 0, 0, 0, 1, 1,
2.320546, 1.025962, -0.1930866, 0, 0, 0, 1, 1,
2.347539, 0.2726384, 1.128592, 0, 0, 0, 1, 1,
2.362343, 0.005324349, 2.340786, 0, 0, 0, 1, 1,
2.373978, 0.1047475, 1.556704, 0, 0, 0, 1, 1,
2.423212, 0.7958474, 1.116477, 0, 0, 0, 1, 1,
2.435286, -1.418628, 2.37613, 0, 0, 0, 1, 1,
2.598078, 1.561143, 2.507222, 1, 1, 1, 1, 1,
2.62539, -0.487972, 1.311653, 1, 1, 1, 1, 1,
2.654945, -0.2760616, 0.03511988, 1, 1, 1, 1, 1,
2.732735, 0.8741063, 2.312415, 1, 1, 1, 1, 1,
2.827322, -0.1911983, 1.297532, 1, 1, 1, 1, 1,
2.876257, 0.1903441, 0.3791835, 1, 1, 1, 1, 1,
3.096901, 0.3714686, 2.415942, 1, 1, 1, 1, 1
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
var radius = 9.905138;
var distance = 34.79138;
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
mvMatrix.translate( 0.008457899, 0.1773001, 0.4746172 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79138);
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
