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
-3.176824, -0.864554, -2.309831, 1, 0, 0, 1,
-3.03026, 0.7665133, -0.8137854, 1, 0.007843138, 0, 1,
-2.774562, -0.1334609, 1.09858, 1, 0.01176471, 0, 1,
-2.764313, -0.3097569, -2.022337, 1, 0.01960784, 0, 1,
-2.741538, -0.5048551, -2.926701, 1, 0.02352941, 0, 1,
-2.718099, -1.346174, -1.967694, 1, 0.03137255, 0, 1,
-2.680899, -0.1305187, -1.755598, 1, 0.03529412, 0, 1,
-2.659249, 0.2897913, -0.7969928, 1, 0.04313726, 0, 1,
-2.568479, 0.6734968, -0.7741621, 1, 0.04705882, 0, 1,
-2.545125, 0.8226509, -2.612861, 1, 0.05490196, 0, 1,
-2.518091, -1.313386, -0.8682439, 1, 0.05882353, 0, 1,
-2.492141, 1.11288, -1.297121, 1, 0.06666667, 0, 1,
-2.47841, 1.098436, -0.0464664, 1, 0.07058824, 0, 1,
-2.471403, 0.1748475, -1.61627, 1, 0.07843138, 0, 1,
-2.446712, -0.8177193, -1.870071, 1, 0.08235294, 0, 1,
-2.429209, 1.116848, -1.931623, 1, 0.09019608, 0, 1,
-2.39831, 0.6596798, -1.737865, 1, 0.09411765, 0, 1,
-2.396163, 1.061056, 0.04865331, 1, 0.1019608, 0, 1,
-2.36585, 0.4816666, -1.06689, 1, 0.1098039, 0, 1,
-2.33459, -0.4913762, -2.305631, 1, 0.1137255, 0, 1,
-2.261262, -0.4714699, -1.459096, 1, 0.1215686, 0, 1,
-2.222557, 1.196582, -0.4755684, 1, 0.1254902, 0, 1,
-2.204942, 0.5551332, -1.509084, 1, 0.1333333, 0, 1,
-2.194762, -0.1555309, -1.590473, 1, 0.1372549, 0, 1,
-2.151973, 1.346171, -2.39584, 1, 0.145098, 0, 1,
-2.143475, -0.6105745, -1.472093, 1, 0.1490196, 0, 1,
-2.122593, 0.7900233, -2.64673, 1, 0.1568628, 0, 1,
-2.087517, -0.2260965, -0.5111572, 1, 0.1607843, 0, 1,
-2.078811, 0.2506609, -1.698519, 1, 0.1686275, 0, 1,
-2.074277, -0.4874242, -0.4407847, 1, 0.172549, 0, 1,
-2.008151, 0.2652345, -2.096914, 1, 0.1803922, 0, 1,
-1.973499, 0.8453681, -1.888051, 1, 0.1843137, 0, 1,
-1.963554, -1.547714, 0.4785789, 1, 0.1921569, 0, 1,
-1.926375, -0.662325, -2.072939, 1, 0.1960784, 0, 1,
-1.887356, -0.9620412, -3.054533, 1, 0.2039216, 0, 1,
-1.87766, -0.4705153, -3.409873, 1, 0.2117647, 0, 1,
-1.873159, 0.4501186, -1.24201, 1, 0.2156863, 0, 1,
-1.865756, -0.7333972, -0.6251054, 1, 0.2235294, 0, 1,
-1.864766, 1.264584, 0.4124136, 1, 0.227451, 0, 1,
-1.83338, -1.197219, -4.141666, 1, 0.2352941, 0, 1,
-1.833347, -0.8872818, -1.725451, 1, 0.2392157, 0, 1,
-1.824421, -0.7490122, -4.20973, 1, 0.2470588, 0, 1,
-1.822231, 0.3921267, -0.7685202, 1, 0.2509804, 0, 1,
-1.815862, -2.32915, -0.7128434, 1, 0.2588235, 0, 1,
-1.813332, -2.23015, -2.675616, 1, 0.2627451, 0, 1,
-1.810181, -1.334937, -2.304854, 1, 0.2705882, 0, 1,
-1.807145, 2.43861, -0.5548062, 1, 0.2745098, 0, 1,
-1.805639, 0.8609179, -0.4853158, 1, 0.282353, 0, 1,
-1.797593, -0.5712774, -1.903158, 1, 0.2862745, 0, 1,
-1.790097, 0.3703701, -2.722516, 1, 0.2941177, 0, 1,
-1.737483, 0.3698122, -2.216009, 1, 0.3019608, 0, 1,
-1.731004, -0.2221425, -1.869767, 1, 0.3058824, 0, 1,
-1.724013, -2.653901, -1.881989, 1, 0.3137255, 0, 1,
-1.710426, 0.3279459, -1.477194, 1, 0.3176471, 0, 1,
-1.663629, -0.05992826, -1.635016, 1, 0.3254902, 0, 1,
-1.662234, 1.177896, -1.10813, 1, 0.3294118, 0, 1,
-1.659416, -0.9962157, -1.558123, 1, 0.3372549, 0, 1,
-1.645976, -0.736938, -2.868022, 1, 0.3411765, 0, 1,
-1.608813, 0.932251, -0.5064849, 1, 0.3490196, 0, 1,
-1.598692, -0.3012194, -1.238312, 1, 0.3529412, 0, 1,
-1.594597, 1.679956, -1.27916, 1, 0.3607843, 0, 1,
-1.559961, -1.849932, -4.088062, 1, 0.3647059, 0, 1,
-1.556182, -1.019116, -1.482598, 1, 0.372549, 0, 1,
-1.544479, -0.9594933, -3.229231, 1, 0.3764706, 0, 1,
-1.520524, -0.614733, -2.546986, 1, 0.3843137, 0, 1,
-1.518901, 1.561883, -1.846019, 1, 0.3882353, 0, 1,
-1.518797, 0.2719216, -2.227636, 1, 0.3960784, 0, 1,
-1.504829, 2.505332, -0.2793124, 1, 0.4039216, 0, 1,
-1.476036, -0.2078467, -1.69498, 1, 0.4078431, 0, 1,
-1.475012, -1.439161, -1.223456, 1, 0.4156863, 0, 1,
-1.470192, 0.003769466, -0.4146957, 1, 0.4196078, 0, 1,
-1.469534, -0.8887197, -2.128093, 1, 0.427451, 0, 1,
-1.460763, 0.7242519, -2.61471, 1, 0.4313726, 0, 1,
-1.454486, 0.5649697, -1.37392, 1, 0.4392157, 0, 1,
-1.454419, 0.4370025, -1.727716, 1, 0.4431373, 0, 1,
-1.451905, 1.573902, -1.863359, 1, 0.4509804, 0, 1,
-1.444028, -1.48806, -1.348521, 1, 0.454902, 0, 1,
-1.44133, -0.1962826, -3.547582, 1, 0.4627451, 0, 1,
-1.438733, -0.602841, -2.182148, 1, 0.4666667, 0, 1,
-1.436595, -0.5317996, -2.559748, 1, 0.4745098, 0, 1,
-1.400594, -0.1500119, -1.125177, 1, 0.4784314, 0, 1,
-1.399055, 0.3420594, -1.273157, 1, 0.4862745, 0, 1,
-1.382946, -0.8989105, -1.70261, 1, 0.4901961, 0, 1,
-1.37253, 0.4249905, -2.332881, 1, 0.4980392, 0, 1,
-1.371073, -0.5674499, -4.871517, 1, 0.5058824, 0, 1,
-1.37099, 0.02995161, -1.152551, 1, 0.509804, 0, 1,
-1.353971, -0.5668022, -1.621266, 1, 0.5176471, 0, 1,
-1.349581, 1.188673, -0.3859281, 1, 0.5215687, 0, 1,
-1.346204, -0.008788405, -1.648938, 1, 0.5294118, 0, 1,
-1.342619, -1.139346, -2.034138, 1, 0.5333334, 0, 1,
-1.341321, -1.048349, -2.064914, 1, 0.5411765, 0, 1,
-1.339232, 0.7322949, -0.9691068, 1, 0.5450981, 0, 1,
-1.338285, 0.6338013, -1.472841, 1, 0.5529412, 0, 1,
-1.328895, -1.744356, -2.080074, 1, 0.5568628, 0, 1,
-1.312581, 0.269315, -2.951789, 1, 0.5647059, 0, 1,
-1.31195, 0.6588293, -0.320334, 1, 0.5686275, 0, 1,
-1.309719, -0.6388173, -1.812924, 1, 0.5764706, 0, 1,
-1.306266, -0.9268188, -2.918339, 1, 0.5803922, 0, 1,
-1.304364, -0.9841182, -1.696612, 1, 0.5882353, 0, 1,
-1.295852, -0.4706932, -1.329502, 1, 0.5921569, 0, 1,
-1.283725, 1.141335, 0.09591805, 1, 0.6, 0, 1,
-1.269863, -1.543167, -1.691455, 1, 0.6078432, 0, 1,
-1.264125, -0.2809782, -2.329582, 1, 0.6117647, 0, 1,
-1.261247, 0.5831582, -1.342439, 1, 0.6196079, 0, 1,
-1.259013, 0.7283565, -0.9047004, 1, 0.6235294, 0, 1,
-1.256444, 0.1795495, -2.465972, 1, 0.6313726, 0, 1,
-1.245485, 1.060029, -0.8829048, 1, 0.6352941, 0, 1,
-1.242579, 0.493111, -1.003142, 1, 0.6431373, 0, 1,
-1.237723, 0.8318796, -0.4036981, 1, 0.6470588, 0, 1,
-1.236113, 1.093801, 0.4563516, 1, 0.654902, 0, 1,
-1.227822, 0.8872259, -2.812507, 1, 0.6588235, 0, 1,
-1.227116, -0.8505296, -0.3936018, 1, 0.6666667, 0, 1,
-1.221235, 0.3764947, -1.764963, 1, 0.6705883, 0, 1,
-1.220016, 0.5015073, -1.851547, 1, 0.6784314, 0, 1,
-1.216943, 1.550831, -1.448659, 1, 0.682353, 0, 1,
-1.205896, 0.4832257, -3.301745, 1, 0.6901961, 0, 1,
-1.205241, 0.3958747, -1.302261, 1, 0.6941177, 0, 1,
-1.197894, -0.3582613, -3.21606, 1, 0.7019608, 0, 1,
-1.18784, 0.432708, 0.2911374, 1, 0.7098039, 0, 1,
-1.185952, 0.1934785, -1.730345, 1, 0.7137255, 0, 1,
-1.184681, 1.078089, -0.5069376, 1, 0.7215686, 0, 1,
-1.176896, 1.748873, -0.4154843, 1, 0.7254902, 0, 1,
-1.171371, -0.972643, -5.000135, 1, 0.7333333, 0, 1,
-1.166291, -1.383635, -2.340553, 1, 0.7372549, 0, 1,
-1.159864, -0.357964, -3.596933, 1, 0.7450981, 0, 1,
-1.159699, -1.333262, -2.144578, 1, 0.7490196, 0, 1,
-1.153304, 0.9144204, -2.183005, 1, 0.7568628, 0, 1,
-1.147465, 0.1639209, -1.252492, 1, 0.7607843, 0, 1,
-1.147357, 0.5980764, -1.008999, 1, 0.7686275, 0, 1,
-1.145106, -0.8879822, -2.467519, 1, 0.772549, 0, 1,
-1.145012, -0.2046082, -1.681921, 1, 0.7803922, 0, 1,
-1.143707, 0.8236932, 0.8252595, 1, 0.7843137, 0, 1,
-1.138388, -0.8132271, -3.819493, 1, 0.7921569, 0, 1,
-1.136453, -0.19763, -2.028442, 1, 0.7960784, 0, 1,
-1.13638, -1.108393, -2.406193, 1, 0.8039216, 0, 1,
-1.129753, -0.7043307, -3.64853, 1, 0.8117647, 0, 1,
-1.123723, 0.1452925, -0.7112336, 1, 0.8156863, 0, 1,
-1.115309, -0.8978279, -1.553129, 1, 0.8235294, 0, 1,
-1.104352, -0.530708, -2.282207, 1, 0.827451, 0, 1,
-1.102139, -0.5032958, -0.8552321, 1, 0.8352941, 0, 1,
-1.098, -1.117196, -1.231174, 1, 0.8392157, 0, 1,
-1.097148, -1.294319, -3.85568, 1, 0.8470588, 0, 1,
-1.090849, -1.133058, -2.683699, 1, 0.8509804, 0, 1,
-1.088903, -1.555894, -0.6745352, 1, 0.8588235, 0, 1,
-1.088006, 0.1655554, -2.558223, 1, 0.8627451, 0, 1,
-1.081505, -1.634692, -1.500914, 1, 0.8705882, 0, 1,
-1.079857, 0.4249235, -1.104062, 1, 0.8745098, 0, 1,
-1.079453, -1.572215, -1.770382, 1, 0.8823529, 0, 1,
-1.078442, 0.9684925, 0.07891803, 1, 0.8862745, 0, 1,
-1.078261, -0.3615432, -1.890562, 1, 0.8941177, 0, 1,
-1.074979, -1.97668, -1.167793, 1, 0.8980392, 0, 1,
-1.070276, -1.078043, -2.772936, 1, 0.9058824, 0, 1,
-1.069983, 1.422785, -1.048954, 1, 0.9137255, 0, 1,
-1.069028, -0.1732089, -0.6383148, 1, 0.9176471, 0, 1,
-1.064324, -0.7511854, -2.851312, 1, 0.9254902, 0, 1,
-1.053153, -0.0255543, -0.9218925, 1, 0.9294118, 0, 1,
-1.05097, 0.5724058, -1.158386, 1, 0.9372549, 0, 1,
-1.049695, -0.08603769, -1.739471, 1, 0.9411765, 0, 1,
-1.045765, 1.411229, -1.816202, 1, 0.9490196, 0, 1,
-1.044264, -1.397647, -3.082627, 1, 0.9529412, 0, 1,
-1.037917, 0.3570203, -1.12416, 1, 0.9607843, 0, 1,
-1.035758, 0.1383974, -2.094663, 1, 0.9647059, 0, 1,
-1.035093, -0.1600119, -0.3798747, 1, 0.972549, 0, 1,
-1.032985, 0.1302843, -2.908455, 1, 0.9764706, 0, 1,
-1.03199, 0.1709418, -0.3141677, 1, 0.9843137, 0, 1,
-1.028913, -0.01514709, -2.49656, 1, 0.9882353, 0, 1,
-1.027431, 1.131958, 1.114594, 1, 0.9960784, 0, 1,
-1.024738, -0.2795047, -1.107673, 0.9960784, 1, 0, 1,
-1.021153, 0.5167266, -0.7036881, 0.9921569, 1, 0, 1,
-1.020082, 1.318532, -0.7747871, 0.9843137, 1, 0, 1,
-1.019957, 0.3923284, -0.6464248, 0.9803922, 1, 0, 1,
-1.010778, 0.1033048, -0.670594, 0.972549, 1, 0, 1,
-1.00891, 1.547857, -1.301378, 0.9686275, 1, 0, 1,
-1.004509, 0.5627563, -0.2997527, 0.9607843, 1, 0, 1,
-1.002511, -0.4571001, -1.020861, 0.9568627, 1, 0, 1,
-1.000062, -0.9352783, -2.177247, 0.9490196, 1, 0, 1,
-0.999, -0.2593338, 0.243316, 0.945098, 1, 0, 1,
-0.9961326, -0.8665168, -1.34372, 0.9372549, 1, 0, 1,
-0.9954201, 0.9499168, -0.7628721, 0.9333333, 1, 0, 1,
-0.9944421, 0.6795021, -0.6292036, 0.9254902, 1, 0, 1,
-0.9929788, -0.6116158, -3.836169, 0.9215686, 1, 0, 1,
-0.9910531, 0.2440714, 0.3899217, 0.9137255, 1, 0, 1,
-0.9877436, -1.89641, -3.857106, 0.9098039, 1, 0, 1,
-0.9856003, -0.7255713, -3.305779, 0.9019608, 1, 0, 1,
-0.9847432, 0.1992123, -0.6520752, 0.8941177, 1, 0, 1,
-0.9804333, 1.248834, -2.819406, 0.8901961, 1, 0, 1,
-0.9800838, -0.822219, -2.637378, 0.8823529, 1, 0, 1,
-0.9677874, 0.2795176, -3.095941, 0.8784314, 1, 0, 1,
-0.9657058, 0.9075351, -1.452442, 0.8705882, 1, 0, 1,
-0.9639466, -0.2027517, -3.825835, 0.8666667, 1, 0, 1,
-0.9580631, -0.2281974, -2.520485, 0.8588235, 1, 0, 1,
-0.9564998, -2.187868, -2.054741, 0.854902, 1, 0, 1,
-0.9548907, 0.3969501, -1.428355, 0.8470588, 1, 0, 1,
-0.9466308, -0.9905278, -0.2517304, 0.8431373, 1, 0, 1,
-0.9444602, 1.17703, -1.617824, 0.8352941, 1, 0, 1,
-0.9399333, -1.082288, -1.014626, 0.8313726, 1, 0, 1,
-0.9369769, -0.1900455, -1.200725, 0.8235294, 1, 0, 1,
-0.9314793, 2.307259, -0.519142, 0.8196079, 1, 0, 1,
-0.9312173, -0.545792, -1.356322, 0.8117647, 1, 0, 1,
-0.9280859, -0.6394177, -2.170972, 0.8078431, 1, 0, 1,
-0.9277973, 0.9209101, 1.37948, 0.8, 1, 0, 1,
-0.9261619, 1.880439, -1.395009, 0.7921569, 1, 0, 1,
-0.9243655, 0.2417845, -2.139234, 0.7882353, 1, 0, 1,
-0.9213766, 1.990543, 0.1619148, 0.7803922, 1, 0, 1,
-0.9149765, -1.234969, -2.87354, 0.7764706, 1, 0, 1,
-0.9093974, -0.01435422, -1.365957, 0.7686275, 1, 0, 1,
-0.9074557, -0.5643603, -0.4481343, 0.7647059, 1, 0, 1,
-0.9068126, -0.08223414, -1.936238, 0.7568628, 1, 0, 1,
-0.9040356, -0.7887043, -3.743618, 0.7529412, 1, 0, 1,
-0.8994648, 0.7669704, -0.3645451, 0.7450981, 1, 0, 1,
-0.8938347, 0.4522549, -1.694074, 0.7411765, 1, 0, 1,
-0.8841671, -0.07983524, -1.594503, 0.7333333, 1, 0, 1,
-0.8782635, 0.5577303, 0.8168839, 0.7294118, 1, 0, 1,
-0.8766868, 1.131754, -0.2701254, 0.7215686, 1, 0, 1,
-0.8648187, 0.6264343, -0.1205186, 0.7176471, 1, 0, 1,
-0.8618128, -0.4621132, -2.060819, 0.7098039, 1, 0, 1,
-0.8570483, 0.8423213, -1.243867, 0.7058824, 1, 0, 1,
-0.8564235, -1.44597, -1.117871, 0.6980392, 1, 0, 1,
-0.8547992, -0.5817708, -1.481167, 0.6901961, 1, 0, 1,
-0.850816, 0.3680419, -0.7649488, 0.6862745, 1, 0, 1,
-0.8506055, 0.09645294, -1.415511, 0.6784314, 1, 0, 1,
-0.8464888, -1.098797, -3.594197, 0.6745098, 1, 0, 1,
-0.8394545, 0.8903526, 0.05973259, 0.6666667, 1, 0, 1,
-0.8392636, -0.1776943, -2.193504, 0.6627451, 1, 0, 1,
-0.8367838, -1.045211, -3.542613, 0.654902, 1, 0, 1,
-0.8363858, -1.467561, -1.160369, 0.6509804, 1, 0, 1,
-0.8362329, -0.2484985, -1.452439, 0.6431373, 1, 0, 1,
-0.8354058, -1.167755, -2.312164, 0.6392157, 1, 0, 1,
-0.8339924, 0.2895759, -0.377161, 0.6313726, 1, 0, 1,
-0.8277662, 0.8282263, -1.983404, 0.627451, 1, 0, 1,
-0.8226008, 0.4571366, 1.85906, 0.6196079, 1, 0, 1,
-0.8197695, 0.6807103, -1.787912, 0.6156863, 1, 0, 1,
-0.8108785, 0.2141355, -2.585145, 0.6078432, 1, 0, 1,
-0.8102926, -1.309061, -1.943356, 0.6039216, 1, 0, 1,
-0.8065299, 0.319916, -2.918036, 0.5960785, 1, 0, 1,
-0.8045515, -0.610635, -2.616502, 0.5882353, 1, 0, 1,
-0.8036993, -0.6152869, -1.381763, 0.5843138, 1, 0, 1,
-0.8001603, 0.9515312, 0.5270916, 0.5764706, 1, 0, 1,
-0.7984041, -0.1358046, -1.303937, 0.572549, 1, 0, 1,
-0.7955343, -0.1618234, -1.362931, 0.5647059, 1, 0, 1,
-0.7940281, 1.865208, 0.05126454, 0.5607843, 1, 0, 1,
-0.791235, 0.20402, -0.9193729, 0.5529412, 1, 0, 1,
-0.7806273, 0.4248945, -2.016748, 0.5490196, 1, 0, 1,
-0.7741014, -0.07545575, -1.323497, 0.5411765, 1, 0, 1,
-0.773904, -1.569982, -1.5807, 0.5372549, 1, 0, 1,
-0.7705562, -0.7155496, -3.018803, 0.5294118, 1, 0, 1,
-0.767259, 0.2056106, -0.9327026, 0.5254902, 1, 0, 1,
-0.7646204, 0.03802523, -1.63255, 0.5176471, 1, 0, 1,
-0.7641262, 0.3988763, 0.1022806, 0.5137255, 1, 0, 1,
-0.7622637, -0.7370218, -3.619961, 0.5058824, 1, 0, 1,
-0.7620149, 0.2896461, -0.9457246, 0.5019608, 1, 0, 1,
-0.7589999, 1.226808, -1.853391, 0.4941176, 1, 0, 1,
-0.7564274, -0.5936297, -1.018914, 0.4862745, 1, 0, 1,
-0.7522311, 2.193001, 1.329141, 0.4823529, 1, 0, 1,
-0.7474375, -0.9645902, -3.401508, 0.4745098, 1, 0, 1,
-0.7464359, -0.2253126, -2.760685, 0.4705882, 1, 0, 1,
-0.7438211, 1.081544, -0.6049641, 0.4627451, 1, 0, 1,
-0.7429535, -0.4779632, -1.693483, 0.4588235, 1, 0, 1,
-0.7404151, 1.265911, 0.59826, 0.4509804, 1, 0, 1,
-0.7383579, 1.391372, -0.3403029, 0.4470588, 1, 0, 1,
-0.7335408, -0.5873929, -2.083539, 0.4392157, 1, 0, 1,
-0.7238566, 0.8973101, 0.3281171, 0.4352941, 1, 0, 1,
-0.7232957, -0.3947909, -2.460445, 0.427451, 1, 0, 1,
-0.7207611, -2.140444, -2.735792, 0.4235294, 1, 0, 1,
-0.7199397, 0.6409385, -0.1691687, 0.4156863, 1, 0, 1,
-0.7177127, -0.3802454, -1.646792, 0.4117647, 1, 0, 1,
-0.7154314, -1.041178, -3.035422, 0.4039216, 1, 0, 1,
-0.7104944, 0.8523729, -0.06097637, 0.3960784, 1, 0, 1,
-0.7079206, 1.718504, -0.7969781, 0.3921569, 1, 0, 1,
-0.7061018, 0.08856621, -1.531899, 0.3843137, 1, 0, 1,
-0.7023582, -1.629271, -5.048086, 0.3803922, 1, 0, 1,
-0.6906511, 0.5343011, -1.256881, 0.372549, 1, 0, 1,
-0.688439, -0.4141645, -1.272616, 0.3686275, 1, 0, 1,
-0.6869531, 0.7862577, -0.4575712, 0.3607843, 1, 0, 1,
-0.6817272, 1.524515, -0.9217501, 0.3568628, 1, 0, 1,
-0.6785142, -0.5229326, -3.056909, 0.3490196, 1, 0, 1,
-0.6765719, -1.109534, -3.735447, 0.345098, 1, 0, 1,
-0.6731081, -0.4654365, -2.666423, 0.3372549, 1, 0, 1,
-0.6702113, -1.159445, -3.064925, 0.3333333, 1, 0, 1,
-0.6658037, 0.7938357, -1.206268, 0.3254902, 1, 0, 1,
-0.6636551, 0.3578254, -0.8538257, 0.3215686, 1, 0, 1,
-0.6614845, 2.35855, -0.6223428, 0.3137255, 1, 0, 1,
-0.6605202, -0.4626966, -0.5196705, 0.3098039, 1, 0, 1,
-0.6495379, -0.7807917, -2.048549, 0.3019608, 1, 0, 1,
-0.6458679, -0.9630548, -3.759799, 0.2941177, 1, 0, 1,
-0.6444474, 1.381145, -0.7706207, 0.2901961, 1, 0, 1,
-0.6432486, -2.033985, -2.400261, 0.282353, 1, 0, 1,
-0.633482, -0.8664825, -2.115799, 0.2784314, 1, 0, 1,
-0.6247508, 0.4291895, -0.8203031, 0.2705882, 1, 0, 1,
-0.6176827, -0.6017694, -1.335281, 0.2666667, 1, 0, 1,
-0.6142157, 0.4662243, -1.02561, 0.2588235, 1, 0, 1,
-0.612537, 1.256927, -1.197525, 0.254902, 1, 0, 1,
-0.6124409, 0.1741024, -1.828276, 0.2470588, 1, 0, 1,
-0.6121094, -1.613422, -2.291633, 0.2431373, 1, 0, 1,
-0.6056566, 0.3417071, -2.483088, 0.2352941, 1, 0, 1,
-0.5985345, 0.2738739, -0.7172878, 0.2313726, 1, 0, 1,
-0.59727, 0.2757984, -1.414212, 0.2235294, 1, 0, 1,
-0.5931605, 1.451975, -2.382227, 0.2196078, 1, 0, 1,
-0.5912053, -0.1652797, -1.927264, 0.2117647, 1, 0, 1,
-0.5905172, 0.5956856, -2.465257, 0.2078431, 1, 0, 1,
-0.5863115, 0.5490265, -0.02651487, 0.2, 1, 0, 1,
-0.5838134, -0.07332083, -3.877401, 0.1921569, 1, 0, 1,
-0.5827675, -1.281242, -0.8378892, 0.1882353, 1, 0, 1,
-0.5791798, -0.3861166, -2.389078, 0.1803922, 1, 0, 1,
-0.5672956, 1.03689, -1.318445, 0.1764706, 1, 0, 1,
-0.5561562, -0.1281099, -2.560062, 0.1686275, 1, 0, 1,
-0.5494205, 0.9196243, -0.7939087, 0.1647059, 1, 0, 1,
-0.5485125, 0.1065238, -2.60749, 0.1568628, 1, 0, 1,
-0.5370929, 0.1054733, -2.219423, 0.1529412, 1, 0, 1,
-0.5369452, -0.1810347, -2.719864, 0.145098, 1, 0, 1,
-0.5364035, 0.5633407, -0.3666389, 0.1411765, 1, 0, 1,
-0.5322414, -1.192777, -2.260302, 0.1333333, 1, 0, 1,
-0.5313225, -1.15397, -1.584266, 0.1294118, 1, 0, 1,
-0.5305802, -0.5807292, -1.636203, 0.1215686, 1, 0, 1,
-0.5301386, 0.8900481, -0.0923486, 0.1176471, 1, 0, 1,
-0.5287408, -0.6952862, -1.698477, 0.1098039, 1, 0, 1,
-0.5267483, -0.1617545, -0.8026052, 0.1058824, 1, 0, 1,
-0.5249704, 1.834484, -0.05642064, 0.09803922, 1, 0, 1,
-0.5220027, -0.5769788, -0.8969284, 0.09019608, 1, 0, 1,
-0.5217415, 1.665862, -1.079418, 0.08627451, 1, 0, 1,
-0.5203692, 1.107304, -0.7575546, 0.07843138, 1, 0, 1,
-0.5118635, 0.03462941, -3.551468, 0.07450981, 1, 0, 1,
-0.5097615, -1.2915, -3.315631, 0.06666667, 1, 0, 1,
-0.5090466, -0.472375, -1.190544, 0.0627451, 1, 0, 1,
-0.50229, -1.388867, -3.867154, 0.05490196, 1, 0, 1,
-0.4982095, -0.6363043, -1.91109, 0.05098039, 1, 0, 1,
-0.4973424, -1.505462, -2.439153, 0.04313726, 1, 0, 1,
-0.492561, 0.03450367, -1.405348, 0.03921569, 1, 0, 1,
-0.4921466, -1.596197, -3.021793, 0.03137255, 1, 0, 1,
-0.4908277, 1.361918, -2.25943, 0.02745098, 1, 0, 1,
-0.4905284, -0.1718541, -2.37713, 0.01960784, 1, 0, 1,
-0.4897915, -0.3600243, -3.170292, 0.01568628, 1, 0, 1,
-0.4880149, -0.4236401, -2.281103, 0.007843138, 1, 0, 1,
-0.4856063, -0.7622902, -2.293965, 0.003921569, 1, 0, 1,
-0.4851511, 0.05920271, -2.279215, 0, 1, 0.003921569, 1,
-0.4841892, -1.932382, -4.87784, 0, 1, 0.01176471, 1,
-0.4820564, -0.7513464, -3.650319, 0, 1, 0.01568628, 1,
-0.4811362, -0.178756, -1.240861, 0, 1, 0.02352941, 1,
-0.4714983, 0.1967833, -0.4511353, 0, 1, 0.02745098, 1,
-0.4689116, 0.706628, -1.165859, 0, 1, 0.03529412, 1,
-0.4648224, -0.6373637, -2.201223, 0, 1, 0.03921569, 1,
-0.4643915, -0.9143034, -2.636916, 0, 1, 0.04705882, 1,
-0.4630042, -0.3794435, -2.135423, 0, 1, 0.05098039, 1,
-0.4563952, 0.249066, -1.017315, 0, 1, 0.05882353, 1,
-0.4556625, 0.159489, -1.489855, 0, 1, 0.0627451, 1,
-0.4545218, 1.223685, -1.44868, 0, 1, 0.07058824, 1,
-0.4531506, -0.6367616, -2.33522, 0, 1, 0.07450981, 1,
-0.4491904, -0.2526276, -2.641344, 0, 1, 0.08235294, 1,
-0.4455292, 0.7078496, -0.4104271, 0, 1, 0.08627451, 1,
-0.4419529, -0.6381353, -2.248228, 0, 1, 0.09411765, 1,
-0.4393659, -1.089056, -2.60149, 0, 1, 0.1019608, 1,
-0.435052, 1.029979, -2.175011, 0, 1, 0.1058824, 1,
-0.4342577, -0.8426811, -3.20079, 0, 1, 0.1137255, 1,
-0.4332881, 0.05360638, -1.51208, 0, 1, 0.1176471, 1,
-0.4239335, 0.909743, 1.568376, 0, 1, 0.1254902, 1,
-0.4194577, 0.3998405, -0.2590793, 0, 1, 0.1294118, 1,
-0.4193739, 0.7590829, -0.9056062, 0, 1, 0.1372549, 1,
-0.4133177, 0.9614766, -0.4137585, 0, 1, 0.1411765, 1,
-0.4130598, -1.053965, -2.99898, 0, 1, 0.1490196, 1,
-0.4114377, 1.120003, 0.2855726, 0, 1, 0.1529412, 1,
-0.4104776, -0.0680006, -1.461944, 0, 1, 0.1607843, 1,
-0.406716, -0.6885925, -3.119005, 0, 1, 0.1647059, 1,
-0.4056081, 0.9726356, 0.3635862, 0, 1, 0.172549, 1,
-0.404681, 1.600782, -1.707324, 0, 1, 0.1764706, 1,
-0.4024506, 0.4213704, -0.003343159, 0, 1, 0.1843137, 1,
-0.4007664, 1.939582, -0.06015747, 0, 1, 0.1882353, 1,
-0.3989335, 0.7874078, 1.161703, 0, 1, 0.1960784, 1,
-0.395858, 1.281969, -1.364593, 0, 1, 0.2039216, 1,
-0.3941792, 0.8547472, -1.382157, 0, 1, 0.2078431, 1,
-0.3909225, -1.428075, -3.737474, 0, 1, 0.2156863, 1,
-0.3906349, -1.624296, -3.313895, 0, 1, 0.2196078, 1,
-0.3867619, -0.5056159, -4.369985, 0, 1, 0.227451, 1,
-0.3790904, -0.06771377, -3.896686, 0, 1, 0.2313726, 1,
-0.3720031, 0.4347353, 0.5690913, 0, 1, 0.2392157, 1,
-0.3702991, 0.421548, -0.02933459, 0, 1, 0.2431373, 1,
-0.370264, 1.433144, 0.1211683, 0, 1, 0.2509804, 1,
-0.3695045, 0.1582728, -1.066576, 0, 1, 0.254902, 1,
-0.3682719, -1.537464, -4.641461, 0, 1, 0.2627451, 1,
-0.3668362, -1.187275, -3.02063, 0, 1, 0.2666667, 1,
-0.3665822, 0.4816181, -1.032092, 0, 1, 0.2745098, 1,
-0.3633148, -0.00897282, -3.114518, 0, 1, 0.2784314, 1,
-0.3627919, -1.762343, -2.400159, 0, 1, 0.2862745, 1,
-0.3627896, 0.4250177, -1.917489, 0, 1, 0.2901961, 1,
-0.3618445, 0.9620668, -0.09833814, 0, 1, 0.2980392, 1,
-0.3606144, -1.555061, -3.085388, 0, 1, 0.3058824, 1,
-0.3579347, 0.7207419, -1.50241, 0, 1, 0.3098039, 1,
-0.3568928, -0.4895073, -1.981987, 0, 1, 0.3176471, 1,
-0.3481658, -0.4600779, -2.997062, 0, 1, 0.3215686, 1,
-0.3456896, 1.090504, -0.7816823, 0, 1, 0.3294118, 1,
-0.3456458, 0.01542393, -2.151904, 0, 1, 0.3333333, 1,
-0.3417438, -0.2005789, -2.494334, 0, 1, 0.3411765, 1,
-0.3413775, 0.4524794, -1.716208, 0, 1, 0.345098, 1,
-0.338669, -0.370466, -2.878085, 0, 1, 0.3529412, 1,
-0.337631, -0.6330332, -2.379456, 0, 1, 0.3568628, 1,
-0.3320369, 2.389906, -1.587845, 0, 1, 0.3647059, 1,
-0.3301728, 0.2878262, 0.2595254, 0, 1, 0.3686275, 1,
-0.3269033, -0.08336409, -3.531185, 0, 1, 0.3764706, 1,
-0.3269021, 0.2736019, -0.1136816, 0, 1, 0.3803922, 1,
-0.3199869, -1.156742, -1.28796, 0, 1, 0.3882353, 1,
-0.3139275, 0.0243095, -1.832839, 0, 1, 0.3921569, 1,
-0.3122774, -0.1788036, -2.085784, 0, 1, 0.4, 1,
-0.3107006, -0.322658, -4.274923, 0, 1, 0.4078431, 1,
-0.2951572, 0.4849561, 0.6221944, 0, 1, 0.4117647, 1,
-0.2921401, 0.2210357, -1.314042, 0, 1, 0.4196078, 1,
-0.2915115, -0.2902294, -3.486028, 0, 1, 0.4235294, 1,
-0.2900929, 0.3332793, -2.137985, 0, 1, 0.4313726, 1,
-0.2868336, 0.5821823, -0.8376295, 0, 1, 0.4352941, 1,
-0.2831184, 0.2581987, -1.610578, 0, 1, 0.4431373, 1,
-0.2798875, 1.567592, 0.2273916, 0, 1, 0.4470588, 1,
-0.2786026, -0.701757, -3.572824, 0, 1, 0.454902, 1,
-0.2762607, -0.04820796, -0.3460017, 0, 1, 0.4588235, 1,
-0.2737814, 0.1893668, -0.8537899, 0, 1, 0.4666667, 1,
-0.2716862, 1.128395, -0.04941864, 0, 1, 0.4705882, 1,
-0.2605917, -0.01160101, -2.550435, 0, 1, 0.4784314, 1,
-0.2596237, 0.5349921, -1.691515, 0, 1, 0.4823529, 1,
-0.2553925, 0.7074701, 0.5345466, 0, 1, 0.4901961, 1,
-0.252319, 0.7457467, -2.815389, 0, 1, 0.4941176, 1,
-0.2508185, 0.2408069, 0.2347224, 0, 1, 0.5019608, 1,
-0.2466333, -1.210226, -3.806968, 0, 1, 0.509804, 1,
-0.2402632, -0.2402809, -3.037825, 0, 1, 0.5137255, 1,
-0.2394874, -3.391109, -3.283989, 0, 1, 0.5215687, 1,
-0.237876, 0.8336688, 0.2052224, 0, 1, 0.5254902, 1,
-0.2275966, -0.4159306, -1.877049, 0, 1, 0.5333334, 1,
-0.2240299, 1.230493, -0.7321905, 0, 1, 0.5372549, 1,
-0.2172624, 0.8186958, 0.1873456, 0, 1, 0.5450981, 1,
-0.2143925, -1.295575, -1.611157, 0, 1, 0.5490196, 1,
-0.2137234, 1.929065, 0.6858481, 0, 1, 0.5568628, 1,
-0.2127139, -0.3985224, -3.535256, 0, 1, 0.5607843, 1,
-0.2105813, 0.5515617, -0.3942133, 0, 1, 0.5686275, 1,
-0.2046391, -0.9933074, -3.052822, 0, 1, 0.572549, 1,
-0.2030887, -0.334629, -2.14833, 0, 1, 0.5803922, 1,
-0.1992459, -1.113735, -1.433863, 0, 1, 0.5843138, 1,
-0.1977579, 0.4201794, -0.4658836, 0, 1, 0.5921569, 1,
-0.1977104, -0.2362566, -2.63532, 0, 1, 0.5960785, 1,
-0.1958393, 0.1736406, -1.724519, 0, 1, 0.6039216, 1,
-0.1939406, -1.249726, -3.827875, 0, 1, 0.6117647, 1,
-0.1931907, -1.536159, -3.52457, 0, 1, 0.6156863, 1,
-0.1845734, 0.6847623, 1.177201, 0, 1, 0.6235294, 1,
-0.1836246, 1.762905, -0.6094906, 0, 1, 0.627451, 1,
-0.180611, 0.02465464, -2.579018, 0, 1, 0.6352941, 1,
-0.1789811, -1.155489, -3.428264, 0, 1, 0.6392157, 1,
-0.1783632, 0.3095787, 1.262084, 0, 1, 0.6470588, 1,
-0.1742775, -1.692368, -2.3621, 0, 1, 0.6509804, 1,
-0.1733174, 0.8776708, -0.3677184, 0, 1, 0.6588235, 1,
-0.1711884, 0.4563872, -1.410359, 0, 1, 0.6627451, 1,
-0.1687415, -0.04836639, -1.103756, 0, 1, 0.6705883, 1,
-0.1681961, -0.8621026, -4.688621, 0, 1, 0.6745098, 1,
-0.1664295, -0.9569539, -1.970168, 0, 1, 0.682353, 1,
-0.1646275, 0.04641033, 0.1094921, 0, 1, 0.6862745, 1,
-0.1643549, 0.1272314, -1.243169, 0, 1, 0.6941177, 1,
-0.1642232, -1.007064, -3.572158, 0, 1, 0.7019608, 1,
-0.1630037, 0.1198299, -1.962648, 0, 1, 0.7058824, 1,
-0.1555468, -1.095598, -3.538765, 0, 1, 0.7137255, 1,
-0.1513613, -0.9636742, -2.959062, 0, 1, 0.7176471, 1,
-0.1512783, -0.3044472, -2.792287, 0, 1, 0.7254902, 1,
-0.1434518, -0.1554829, -2.224691, 0, 1, 0.7294118, 1,
-0.1412457, -0.5912499, -1.424517, 0, 1, 0.7372549, 1,
-0.1362823, -0.9078121, -3.481459, 0, 1, 0.7411765, 1,
-0.1343236, -1.308516, -2.66986, 0, 1, 0.7490196, 1,
-0.1312015, 0.7554201, 0.8724027, 0, 1, 0.7529412, 1,
-0.1278022, -1.037569, -2.187942, 0, 1, 0.7607843, 1,
-0.1257488, -1.156398, -3.402061, 0, 1, 0.7647059, 1,
-0.125367, 0.9800249, 1.253799, 0, 1, 0.772549, 1,
-0.120443, 0.8824178, -0.6890237, 0, 1, 0.7764706, 1,
-0.1198588, 0.1348093, 1.000443, 0, 1, 0.7843137, 1,
-0.1197531, -0.0009790416, -1.867508, 0, 1, 0.7882353, 1,
-0.1156765, 0.2309269, -0.9835413, 0, 1, 0.7960784, 1,
-0.1155393, -0.7740781, -3.330898, 0, 1, 0.8039216, 1,
-0.114953, 1.346039, -0.1175605, 0, 1, 0.8078431, 1,
-0.1144922, 0.4609029, 0.1708477, 0, 1, 0.8156863, 1,
-0.1114274, -0.8801087, -3.434332, 0, 1, 0.8196079, 1,
-0.1054047, -0.219317, -2.696347, 0, 1, 0.827451, 1,
-0.1053965, 0.4571325, 0.9400318, 0, 1, 0.8313726, 1,
-0.104686, 1.588846, -1.509346, 0, 1, 0.8392157, 1,
-0.1036125, 1.456834, 1.063169, 0, 1, 0.8431373, 1,
-0.09875273, 0.4345544, -0.1465839, 0, 1, 0.8509804, 1,
-0.08693194, 0.3204876, -1.608978, 0, 1, 0.854902, 1,
-0.08519711, 1.085758, -0.5401553, 0, 1, 0.8627451, 1,
-0.08454854, -1.454639, -4.80014, 0, 1, 0.8666667, 1,
-0.08433437, 0.4507255, -1.107728, 0, 1, 0.8745098, 1,
-0.08388325, 0.1926563, 1.422611, 0, 1, 0.8784314, 1,
-0.0813106, -0.2450291, -1.304996, 0, 1, 0.8862745, 1,
-0.08071657, 0.4320376, -0.4338752, 0, 1, 0.8901961, 1,
-0.07377962, 0.2167863, 0.1373412, 0, 1, 0.8980392, 1,
-0.07287119, 0.1640792, 1.206146, 0, 1, 0.9058824, 1,
-0.0645036, 2.206091, 0.05516456, 0, 1, 0.9098039, 1,
-0.06185094, 0.3675949, 0.4637623, 0, 1, 0.9176471, 1,
-0.05622875, 0.5504154, 0.4273968, 0, 1, 0.9215686, 1,
-0.05038939, 0.1434731, 0.3679744, 0, 1, 0.9294118, 1,
-0.04902099, -1.114777, -1.646416, 0, 1, 0.9333333, 1,
-0.04872121, -1.227231, -5.311729, 0, 1, 0.9411765, 1,
-0.04520969, -0.99728, -2.747991, 0, 1, 0.945098, 1,
-0.04065883, 0.1587084, 0.655165, 0, 1, 0.9529412, 1,
-0.03870308, -0.7272386, -3.175707, 0, 1, 0.9568627, 1,
-0.03737095, 0.4619404, -0.6442969, 0, 1, 0.9647059, 1,
-0.03684943, 0.2426182, 1.77505, 0, 1, 0.9686275, 1,
-0.03305507, -0.7644026, -3.089211, 0, 1, 0.9764706, 1,
-0.03208384, -1.687853, -2.253981, 0, 1, 0.9803922, 1,
-0.03187594, 0.1895775, -1.268972, 0, 1, 0.9882353, 1,
-0.02484731, -0.5256788, -4.926367, 0, 1, 0.9921569, 1,
-0.02288988, -0.6446536, -2.036326, 0, 1, 1, 1,
-0.01979104, -0.5415995, -3.834838, 0, 0.9921569, 1, 1,
-0.0193523, -0.2976359, -3.619162, 0, 0.9882353, 1, 1,
-0.01621561, 0.8510255, -0.4942234, 0, 0.9803922, 1, 1,
-0.01556676, -0.345234, -2.889303, 0, 0.9764706, 1, 1,
-0.01018285, 0.01532655, -2.082709, 0, 0.9686275, 1, 1,
-0.008849725, 0.0346411, -0.3843964, 0, 0.9647059, 1, 1,
-0.007139816, -0.2990113, -2.932873, 0, 0.9568627, 1, 1,
-0.005237857, 0.7787955, -1.004755, 0, 0.9529412, 1, 1,
-0.003043364, -0.7371331, -3.108229, 0, 0.945098, 1, 1,
-0.001909123, 0.03118143, -1.67336, 0, 0.9411765, 1, 1,
-0.001238947, -0.920395, -3.738031, 0, 0.9333333, 1, 1,
0.0008606384, -0.4885657, 4.106125, 0, 0.9294118, 1, 1,
0.002527594, -1.044726, 5.157968, 0, 0.9215686, 1, 1,
0.003088076, 0.8438697, 0.2799371, 0, 0.9176471, 1, 1,
0.0108241, -0.1510503, 2.525723, 0, 0.9098039, 1, 1,
0.01098385, 1.672193, 0.3330814, 0, 0.9058824, 1, 1,
0.01142388, -2.003336, 2.60047, 0, 0.8980392, 1, 1,
0.0136899, 0.7951267, 1.080461, 0, 0.8901961, 1, 1,
0.0139634, -0.8575187, 3.66816, 0, 0.8862745, 1, 1,
0.01579095, 0.1944985, 0.7156103, 0, 0.8784314, 1, 1,
0.02302205, -0.2253603, 0.9258879, 0, 0.8745098, 1, 1,
0.02313378, -0.6737062, 2.51077, 0, 0.8666667, 1, 1,
0.02880214, 1.752232, 0.6909939, 0, 0.8627451, 1, 1,
0.03618062, -0.5572855, 2.381594, 0, 0.854902, 1, 1,
0.03877186, 0.7077589, 0.7728011, 0, 0.8509804, 1, 1,
0.03890266, -0.5375445, 3.526204, 0, 0.8431373, 1, 1,
0.03989952, 0.3035064, 0.7748174, 0, 0.8392157, 1, 1,
0.044393, -1.407308, 2.350708, 0, 0.8313726, 1, 1,
0.04490986, -0.9005259, 4.167502, 0, 0.827451, 1, 1,
0.04641539, 0.3475533, -0.2258499, 0, 0.8196079, 1, 1,
0.04737936, -0.631696, 2.672464, 0, 0.8156863, 1, 1,
0.05064594, -0.05071786, 1.719717, 0, 0.8078431, 1, 1,
0.05080963, 0.6968467, -1.539336, 0, 0.8039216, 1, 1,
0.06075258, 1.431455, -1.014231, 0, 0.7960784, 1, 1,
0.06147752, 0.2905523, -0.9341762, 0, 0.7882353, 1, 1,
0.06342273, -0.08906428, 1.719276, 0, 0.7843137, 1, 1,
0.0668396, -2.236433, 2.439134, 0, 0.7764706, 1, 1,
0.06737015, -1.036668, 3.275519, 0, 0.772549, 1, 1,
0.06747758, -0.1216396, 1.642236, 0, 0.7647059, 1, 1,
0.06878042, -1.285597, 3.079458, 0, 0.7607843, 1, 1,
0.07122669, 0.7553683, -0.4047472, 0, 0.7529412, 1, 1,
0.0721649, 0.1178185, 1.690999, 0, 0.7490196, 1, 1,
0.07804657, -0.4156331, 2.766618, 0, 0.7411765, 1, 1,
0.07834436, -0.938116, 2.989044, 0, 0.7372549, 1, 1,
0.0856599, -0.8688284, 3.487584, 0, 0.7294118, 1, 1,
0.08992323, -1.536108, 3.033226, 0, 0.7254902, 1, 1,
0.09008379, 1.240702, 1.149423, 0, 0.7176471, 1, 1,
0.09203354, -1.161874, 3.835075, 0, 0.7137255, 1, 1,
0.09815563, -0.8335101, 3.281009, 0, 0.7058824, 1, 1,
0.100162, 0.8249974, 2.522787, 0, 0.6980392, 1, 1,
0.1019306, 1.605972, -0.7833079, 0, 0.6941177, 1, 1,
0.1028392, -0.04746905, 2.424237, 0, 0.6862745, 1, 1,
0.1029609, 0.2453882, -2.87827, 0, 0.682353, 1, 1,
0.1058188, 0.5831246, -0.4917514, 0, 0.6745098, 1, 1,
0.1089053, -1.696077, 3.127811, 0, 0.6705883, 1, 1,
0.1112353, -1.00256, 3.027673, 0, 0.6627451, 1, 1,
0.1117267, 1.816161, 0.1831199, 0, 0.6588235, 1, 1,
0.1129302, 1.230676, -0.006009048, 0, 0.6509804, 1, 1,
0.115677, -0.3818983, 2.619417, 0, 0.6470588, 1, 1,
0.1168911, 0.2282185, 1.570584, 0, 0.6392157, 1, 1,
0.1186924, -1.678346, 4.533066, 0, 0.6352941, 1, 1,
0.1297601, 0.3333245, 0.1189071, 0, 0.627451, 1, 1,
0.1309454, 0.8127278, 0.9235678, 0, 0.6235294, 1, 1,
0.1350531, 0.650776, 0.1516398, 0, 0.6156863, 1, 1,
0.1353177, -0.1269865, 3.054616, 0, 0.6117647, 1, 1,
0.1361805, -0.9313144, 3.472396, 0, 0.6039216, 1, 1,
0.1375426, 0.4197859, -0.4988851, 0, 0.5960785, 1, 1,
0.1379748, -1.848928, 2.811662, 0, 0.5921569, 1, 1,
0.1401567, -2.076086, 3.253972, 0, 0.5843138, 1, 1,
0.1431229, 0.4869604, -0.5878978, 0, 0.5803922, 1, 1,
0.144371, -0.3315581, 1.56995, 0, 0.572549, 1, 1,
0.144494, -0.05804534, 1.568816, 0, 0.5686275, 1, 1,
0.1467082, 1.78136, 0.07646765, 0, 0.5607843, 1, 1,
0.1487002, 0.2745184, 0.2285224, 0, 0.5568628, 1, 1,
0.1515915, 0.1371472, 2.159965, 0, 0.5490196, 1, 1,
0.1535449, 0.5277803, 1.380174, 0, 0.5450981, 1, 1,
0.1599442, -0.08087979, 2.702494, 0, 0.5372549, 1, 1,
0.1653078, 0.6067344, -1.001549, 0, 0.5333334, 1, 1,
0.1662965, -0.03226992, 2.503544, 0, 0.5254902, 1, 1,
0.1677031, -2.025489, 1.750113, 0, 0.5215687, 1, 1,
0.1695146, -0.3259061, 1.309436, 0, 0.5137255, 1, 1,
0.1702055, -0.3226458, 2.773247, 0, 0.509804, 1, 1,
0.1745132, 0.1030075, 0.1902529, 0, 0.5019608, 1, 1,
0.1746667, 0.7393775, -0.1903423, 0, 0.4941176, 1, 1,
0.1754713, 0.7130631, 1.199915, 0, 0.4901961, 1, 1,
0.1811772, 0.6590235, 1.352894, 0, 0.4823529, 1, 1,
0.1820243, 0.7520672, 0.2894669, 0, 0.4784314, 1, 1,
0.1881866, 0.2593545, -0.249402, 0, 0.4705882, 1, 1,
0.1923228, 0.7424178, 0.8537838, 0, 0.4666667, 1, 1,
0.1951573, -1.323557, 3.439451, 0, 0.4588235, 1, 1,
0.1958464, -1.251056, 4.015603, 0, 0.454902, 1, 1,
0.1980279, -0.1052127, 0.299104, 0, 0.4470588, 1, 1,
0.2006215, 0.254911, 0.6823024, 0, 0.4431373, 1, 1,
0.2030379, -0.04711547, 3.222357, 0, 0.4352941, 1, 1,
0.2039, -0.008183224, 3.015668, 0, 0.4313726, 1, 1,
0.206427, -1.101003, 1.973026, 0, 0.4235294, 1, 1,
0.2080251, 0.08412753, 1.435684, 0, 0.4196078, 1, 1,
0.2193491, 0.1599783, 3.453327, 0, 0.4117647, 1, 1,
0.2212135, -2.796735, 3.801879, 0, 0.4078431, 1, 1,
0.2236172, -1.015035, 3.161435, 0, 0.4, 1, 1,
0.2243809, 0.5603888, 1.259539, 0, 0.3921569, 1, 1,
0.2248293, 0.1744225, 2.373939, 0, 0.3882353, 1, 1,
0.2249915, -1.807236, 3.51333, 0, 0.3803922, 1, 1,
0.2257799, -1.753663, 2.379984, 0, 0.3764706, 1, 1,
0.2274344, -0.9632128, 3.213972, 0, 0.3686275, 1, 1,
0.2296491, 0.7116098, -0.2576722, 0, 0.3647059, 1, 1,
0.2301865, -0.7909796, 2.681263, 0, 0.3568628, 1, 1,
0.2343998, 0.8990597, 1.572155, 0, 0.3529412, 1, 1,
0.234443, 1.339599, -0.7133767, 0, 0.345098, 1, 1,
0.2363588, 0.8710777, 0.1064074, 0, 0.3411765, 1, 1,
0.2381549, 0.9278244, -0.1982775, 0, 0.3333333, 1, 1,
0.2409663, -2.141929, 4.247198, 0, 0.3294118, 1, 1,
0.2432248, -0.8495736, 2.598379, 0, 0.3215686, 1, 1,
0.2525597, 0.2837079, 1.846924, 0, 0.3176471, 1, 1,
0.2576011, 1.210743, 0.7908556, 0, 0.3098039, 1, 1,
0.2584193, -0.09979883, 3.122888, 0, 0.3058824, 1, 1,
0.2637576, 0.6406451, -0.4236059, 0, 0.2980392, 1, 1,
0.2686364, 0.5342858, 0.8016843, 0, 0.2901961, 1, 1,
0.2796654, -0.3708821, 3.758129, 0, 0.2862745, 1, 1,
0.2812944, 0.4797674, 1.218141, 0, 0.2784314, 1, 1,
0.286294, 1.509892, 0.3380467, 0, 0.2745098, 1, 1,
0.2872145, -0.5879864, 2.125122, 0, 0.2666667, 1, 1,
0.2876432, 0.397287, 0.1541435, 0, 0.2627451, 1, 1,
0.2938771, 0.9373561, 0.4792648, 0, 0.254902, 1, 1,
0.2951985, 1.602429, -0.6196259, 0, 0.2509804, 1, 1,
0.2965232, -0.258343, 1.310901, 0, 0.2431373, 1, 1,
0.3075773, -0.2171699, 3.954566, 0, 0.2392157, 1, 1,
0.3080795, -0.8909207, 3.377517, 0, 0.2313726, 1, 1,
0.3118021, -1.387273, 3.035777, 0, 0.227451, 1, 1,
0.3142745, -1.967082, 3.581824, 0, 0.2196078, 1, 1,
0.3152282, -1.655871, 2.938308, 0, 0.2156863, 1, 1,
0.3153233, -0.3090109, 3.524923, 0, 0.2078431, 1, 1,
0.3178966, 1.587235, 0.5212491, 0, 0.2039216, 1, 1,
0.3203659, 0.1762365, 1.37017, 0, 0.1960784, 1, 1,
0.3256221, 1.356625, 1.061225, 0, 0.1882353, 1, 1,
0.3307803, -1.203725, 0.8549032, 0, 0.1843137, 1, 1,
0.3310914, -2.097638, 2.853966, 0, 0.1764706, 1, 1,
0.3314028, -1.001228, 3.164205, 0, 0.172549, 1, 1,
0.3375525, 0.3327702, 0.1077587, 0, 0.1647059, 1, 1,
0.3381109, 0.3550481, 0.2289555, 0, 0.1607843, 1, 1,
0.3390353, -0.6352528, 1.972662, 0, 0.1529412, 1, 1,
0.3401825, 1.063811, -1.101182, 0, 0.1490196, 1, 1,
0.3407142, 1.128526, -1.287878, 0, 0.1411765, 1, 1,
0.3443485, -1.159798, 3.235045, 0, 0.1372549, 1, 1,
0.3451377, -0.4956019, 1.678831, 0, 0.1294118, 1, 1,
0.3465835, 1.326682, 1.029905, 0, 0.1254902, 1, 1,
0.3479925, -0.6842092, 1.265032, 0, 0.1176471, 1, 1,
0.3482763, -1.076725, 2.988088, 0, 0.1137255, 1, 1,
0.348311, 0.2127862, 3.103583, 0, 0.1058824, 1, 1,
0.357058, 1.477751, 1.492284, 0, 0.09803922, 1, 1,
0.3587426, -0.6578732, 3.915643, 0, 0.09411765, 1, 1,
0.362056, 0.434013, 0.4706124, 0, 0.08627451, 1, 1,
0.3625349, -1.040861, 2.932404, 0, 0.08235294, 1, 1,
0.3634819, -2.458508, 3.830071, 0, 0.07450981, 1, 1,
0.3663923, 0.1794088, 1.337072, 0, 0.07058824, 1, 1,
0.3674944, 0.3548148, 2.342649, 0, 0.0627451, 1, 1,
0.3686429, -1.056244, 1.508221, 0, 0.05882353, 1, 1,
0.3707134, 0.1378572, -0.05665863, 0, 0.05098039, 1, 1,
0.3714794, -1.025505, 2.963105, 0, 0.04705882, 1, 1,
0.3727708, 0.4255692, 0.3589499, 0, 0.03921569, 1, 1,
0.3733203, 1.274612, 2.086881, 0, 0.03529412, 1, 1,
0.3784682, -0.8515923, 1.72511, 0, 0.02745098, 1, 1,
0.3800565, -0.2808862, 1.409047, 0, 0.02352941, 1, 1,
0.3807339, 0.07396723, 1.449086, 0, 0.01568628, 1, 1,
0.3813872, -1.908871, 2.133777, 0, 0.01176471, 1, 1,
0.3823434, 1.50193, -0.8606667, 0, 0.003921569, 1, 1,
0.3826776, 2.231193, 0.419379, 0.003921569, 0, 1, 1,
0.3916871, 0.2200684, 0.4018664, 0.007843138, 0, 1, 1,
0.3972689, 1.414607, 1.628785, 0.01568628, 0, 1, 1,
0.3974602, -0.009985446, 1.789922, 0.01960784, 0, 1, 1,
0.3976791, -0.5870188, 1.934626, 0.02745098, 0, 1, 1,
0.4036966, -0.7230874, 3.101228, 0.03137255, 0, 1, 1,
0.4074994, -0.8737306, 3.086993, 0.03921569, 0, 1, 1,
0.4098566, -0.5502011, 2.49748, 0.04313726, 0, 1, 1,
0.4103335, -0.4075895, 1.718633, 0.05098039, 0, 1, 1,
0.4113332, -0.4120739, 3.903798, 0.05490196, 0, 1, 1,
0.4185542, -0.8437126, 5.633924, 0.0627451, 0, 1, 1,
0.4201281, -0.9124317, 3.899135, 0.06666667, 0, 1, 1,
0.4205737, 0.2234361, 0.8883832, 0.07450981, 0, 1, 1,
0.4235359, 2.314474, -1.239504, 0.07843138, 0, 1, 1,
0.4245043, 1.681926, -0.8129101, 0.08627451, 0, 1, 1,
0.4248219, 0.1565863, 0.2744411, 0.09019608, 0, 1, 1,
0.4301632, -0.07041577, 1.736724, 0.09803922, 0, 1, 1,
0.4334626, -1.529855, 2.744425, 0.1058824, 0, 1, 1,
0.4350301, -0.4486627, 3.078509, 0.1098039, 0, 1, 1,
0.4369234, -0.7934385, 1.153008, 0.1176471, 0, 1, 1,
0.4404972, -0.3297828, 1.728679, 0.1215686, 0, 1, 1,
0.4424177, 0.1660784, 0.1503212, 0.1294118, 0, 1, 1,
0.4432248, 1.397432, -1.430699, 0.1333333, 0, 1, 1,
0.4476248, -0.570962, 2.90636, 0.1411765, 0, 1, 1,
0.449286, 0.3807291, 0.4985513, 0.145098, 0, 1, 1,
0.4498073, 0.04260844, 1.188544, 0.1529412, 0, 1, 1,
0.4517054, 1.77393, 1.451753, 0.1568628, 0, 1, 1,
0.4519677, -0.2648102, 0.9405345, 0.1647059, 0, 1, 1,
0.4542696, 0.01586048, -0.9278134, 0.1686275, 0, 1, 1,
0.454365, 1.025259, -1.500956, 0.1764706, 0, 1, 1,
0.4589975, -0.6875142, 1.701278, 0.1803922, 0, 1, 1,
0.460839, 0.2644225, 0.7515545, 0.1882353, 0, 1, 1,
0.4620031, 0.8949689, -0.3337167, 0.1921569, 0, 1, 1,
0.4693904, -0.9929655, 3.137748, 0.2, 0, 1, 1,
0.4695995, -0.05738591, 1.450594, 0.2078431, 0, 1, 1,
0.4790667, 0.6598676, 1.370079, 0.2117647, 0, 1, 1,
0.4826323, 0.05602689, 1.117399, 0.2196078, 0, 1, 1,
0.4853906, 0.7381927, 0.5599654, 0.2235294, 0, 1, 1,
0.490062, -1.464279, 2.173231, 0.2313726, 0, 1, 1,
0.4912968, -0.687378, 1.085515, 0.2352941, 0, 1, 1,
0.4929157, 0.2479769, 0.190077, 0.2431373, 0, 1, 1,
0.4930171, -0.6610079, 2.907879, 0.2470588, 0, 1, 1,
0.4958149, -0.3822606, 2.373417, 0.254902, 0, 1, 1,
0.4972137, 0.6404111, 0.07654327, 0.2588235, 0, 1, 1,
0.497846, 0.7065296, 1.339343, 0.2666667, 0, 1, 1,
0.503598, 0.3457694, 2.132187, 0.2705882, 0, 1, 1,
0.507816, 0.3825941, 0.3447386, 0.2784314, 0, 1, 1,
0.5101496, -0.4479155, 1.618605, 0.282353, 0, 1, 1,
0.5106378, 1.143615, 0.6884894, 0.2901961, 0, 1, 1,
0.5158442, -0.5348868, 1.355676, 0.2941177, 0, 1, 1,
0.5161906, 0.495614, 1.784731, 0.3019608, 0, 1, 1,
0.5190842, -0.04077155, 0.401183, 0.3098039, 0, 1, 1,
0.5228335, 0.02592231, 2.620663, 0.3137255, 0, 1, 1,
0.5292107, 1.177304, -0.6367021, 0.3215686, 0, 1, 1,
0.52937, 1.267643, -1.638898, 0.3254902, 0, 1, 1,
0.5308142, -2.917354, 3.295144, 0.3333333, 0, 1, 1,
0.5352741, -0.06952555, 2.489392, 0.3372549, 0, 1, 1,
0.5371142, 0.1813312, 2.415003, 0.345098, 0, 1, 1,
0.55031, -0.6555548, 1.730015, 0.3490196, 0, 1, 1,
0.5525575, -0.6599742, 0.9923368, 0.3568628, 0, 1, 1,
0.5615174, 0.8220048, 0.5778771, 0.3607843, 0, 1, 1,
0.5622965, 0.6179003, 0.122157, 0.3686275, 0, 1, 1,
0.5632548, -0.3614762, 0.9681689, 0.372549, 0, 1, 1,
0.5665285, 0.8397933, 0.4602985, 0.3803922, 0, 1, 1,
0.5670613, 0.9216391, 0.0842233, 0.3843137, 0, 1, 1,
0.5710158, -0.4185454, 2.5124, 0.3921569, 0, 1, 1,
0.5772405, -0.5649675, 2.23617, 0.3960784, 0, 1, 1,
0.5829917, 1.709423, 1.652833, 0.4039216, 0, 1, 1,
0.5900377, 0.1350219, 2.3796, 0.4117647, 0, 1, 1,
0.5928087, 1.136219, -0.5147036, 0.4156863, 0, 1, 1,
0.593412, 0.1118279, 0.7345214, 0.4235294, 0, 1, 1,
0.5948263, 0.3832065, 0.7662303, 0.427451, 0, 1, 1,
0.5979798, 1.237686, 0.1591955, 0.4352941, 0, 1, 1,
0.598287, -0.03110807, 1.935101, 0.4392157, 0, 1, 1,
0.5997646, -0.2790211, 1.934126, 0.4470588, 0, 1, 1,
0.6047089, 0.8512954, 1.28341, 0.4509804, 0, 1, 1,
0.6055865, 0.7137422, 1.375403, 0.4588235, 0, 1, 1,
0.6094023, 0.6644447, 0.6709898, 0.4627451, 0, 1, 1,
0.6098532, -1.00199, 3.130742, 0.4705882, 0, 1, 1,
0.6107563, 0.5942594, 2.931939, 0.4745098, 0, 1, 1,
0.6190027, -1.678955, 2.661096, 0.4823529, 0, 1, 1,
0.6193833, 0.2106412, 0.9199256, 0.4862745, 0, 1, 1,
0.6328204, -0.1993897, 2.445425, 0.4941176, 0, 1, 1,
0.6379974, -0.8234839, 2.351574, 0.5019608, 0, 1, 1,
0.6592848, -1.206827, 1.895963, 0.5058824, 0, 1, 1,
0.6648204, 0.08003663, 1.361669, 0.5137255, 0, 1, 1,
0.6656838, -0.8110311, 1.503305, 0.5176471, 0, 1, 1,
0.6701415, 1.047502, 1.668393, 0.5254902, 0, 1, 1,
0.6788934, 1.27459, 2.126466, 0.5294118, 0, 1, 1,
0.6793498, 0.5048646, -0.1105863, 0.5372549, 0, 1, 1,
0.6835858, -0.564102, 0.4741894, 0.5411765, 0, 1, 1,
0.6884242, 0.2794388, 0.9285396, 0.5490196, 0, 1, 1,
0.6894681, 0.9114746, 1.069039, 0.5529412, 0, 1, 1,
0.6964397, -2.767818, 2.830082, 0.5607843, 0, 1, 1,
0.6995897, -1.009778, 3.617293, 0.5647059, 0, 1, 1,
0.7002831, -1.250166, 1.953077, 0.572549, 0, 1, 1,
0.7016944, -0.2884967, 2.020313, 0.5764706, 0, 1, 1,
0.7062917, 0.3438565, 0.4272085, 0.5843138, 0, 1, 1,
0.7097118, 1.520038, 0.4729404, 0.5882353, 0, 1, 1,
0.7098535, 0.261455, -1.173563, 0.5960785, 0, 1, 1,
0.7169752, 0.09210262, 1.23876, 0.6039216, 0, 1, 1,
0.7174797, -0.8797138, 1.875782, 0.6078432, 0, 1, 1,
0.7208206, -0.1456282, 2.080101, 0.6156863, 0, 1, 1,
0.7267271, 0.7269991, 1.47811, 0.6196079, 0, 1, 1,
0.7293067, -0.1123931, 3.079026, 0.627451, 0, 1, 1,
0.7293211, 1.387571, 0.05970954, 0.6313726, 0, 1, 1,
0.7341306, 1.278404, 0.07812762, 0.6392157, 0, 1, 1,
0.7390793, -1.031008, 4.478158, 0.6431373, 0, 1, 1,
0.7455384, -1.08823, 1.04849, 0.6509804, 0, 1, 1,
0.7481485, -0.07419558, 1.639122, 0.654902, 0, 1, 1,
0.7487946, -1.84693, 0.9408493, 0.6627451, 0, 1, 1,
0.752086, -1.250914, 3.797011, 0.6666667, 0, 1, 1,
0.7528526, -0.6329353, 2.073934, 0.6745098, 0, 1, 1,
0.7535538, -0.9724056, 2.3862, 0.6784314, 0, 1, 1,
0.7539693, -0.9390929, 1.515925, 0.6862745, 0, 1, 1,
0.7583922, 0.3885891, 0.1573868, 0.6901961, 0, 1, 1,
0.7597519, 0.6959094, 0.4457318, 0.6980392, 0, 1, 1,
0.7706996, -0.4617358, 2.861912, 0.7058824, 0, 1, 1,
0.7755483, -0.2006397, 1.557671, 0.7098039, 0, 1, 1,
0.7763041, -0.995648, 3.34369, 0.7176471, 0, 1, 1,
0.7787045, 0.430701, 0.8829454, 0.7215686, 0, 1, 1,
0.7787083, 0.9851171, 1.879934, 0.7294118, 0, 1, 1,
0.7828004, -0.6874298, 2.533979, 0.7333333, 0, 1, 1,
0.7878428, -0.191575, 2.754962, 0.7411765, 0, 1, 1,
0.7895994, 1.616287, 1.234358, 0.7450981, 0, 1, 1,
0.7903972, -1.812416, 3.702805, 0.7529412, 0, 1, 1,
0.7955257, -0.188967, 1.128571, 0.7568628, 0, 1, 1,
0.7988076, 0.5475201, 2.61663, 0.7647059, 0, 1, 1,
0.7989251, -0.2361076, 2.540645, 0.7686275, 0, 1, 1,
0.8021901, 0.7905775, 1.094252, 0.7764706, 0, 1, 1,
0.8069652, -0.226407, 0.2939104, 0.7803922, 0, 1, 1,
0.8073411, -0.6044126, 1.055175, 0.7882353, 0, 1, 1,
0.8159317, 2.19645, 1.455637, 0.7921569, 0, 1, 1,
0.8214677, 0.4402638, -1.845934, 0.8, 0, 1, 1,
0.8248358, -0.3659999, 1.48048, 0.8078431, 0, 1, 1,
0.8277465, -0.4126543, 2.949909, 0.8117647, 0, 1, 1,
0.8347379, -1.103054, 1.965779, 0.8196079, 0, 1, 1,
0.8387511, -0.5188958, 3.489199, 0.8235294, 0, 1, 1,
0.8464421, -0.3747202, 2.558613, 0.8313726, 0, 1, 1,
0.8473583, 0.2578569, 1.163288, 0.8352941, 0, 1, 1,
0.8507339, 1.283558, 0.4463194, 0.8431373, 0, 1, 1,
0.8569111, -0.1320629, 1.764389, 0.8470588, 0, 1, 1,
0.8682951, -0.2356207, 2.624462, 0.854902, 0, 1, 1,
0.8744892, 0.9911458, 0.5906753, 0.8588235, 0, 1, 1,
0.8751338, 0.08545866, 2.573763, 0.8666667, 0, 1, 1,
0.8760142, -0.5495011, -0.2375127, 0.8705882, 0, 1, 1,
0.8792125, 1.176204, -0.1708816, 0.8784314, 0, 1, 1,
0.8806876, 0.7055694, 1.848348, 0.8823529, 0, 1, 1,
0.8814501, -1.658829, 2.938381, 0.8901961, 0, 1, 1,
0.8890803, 0.9140753, -0.4368437, 0.8941177, 0, 1, 1,
0.889883, 1.045288, 1.873571, 0.9019608, 0, 1, 1,
0.8926676, -1.100003, 2.813535, 0.9098039, 0, 1, 1,
0.8929546, 1.095709, 1.25468, 0.9137255, 0, 1, 1,
0.9014603, -0.166011, 1.612004, 0.9215686, 0, 1, 1,
0.907954, 1.298522, 1.975758, 0.9254902, 0, 1, 1,
0.9088201, 1.250011, -0.696322, 0.9333333, 0, 1, 1,
0.9167907, 1.036404, -1.125636, 0.9372549, 0, 1, 1,
0.9293639, -1.558294, 2.507828, 0.945098, 0, 1, 1,
0.9318106, 0.1926361, -0.3500646, 0.9490196, 0, 1, 1,
0.9392922, 0.3109473, 2.512087, 0.9568627, 0, 1, 1,
0.9442848, -1.082951, 3.64065, 0.9607843, 0, 1, 1,
0.9554811, 1.524676, 0.2827763, 0.9686275, 0, 1, 1,
0.9608142, -0.8954501, 1.979048, 0.972549, 0, 1, 1,
0.9615413, 1.554536, 2.392316, 0.9803922, 0, 1, 1,
0.9626002, -0.7421548, 0.3667974, 0.9843137, 0, 1, 1,
0.9658952, -0.1096643, 2.259512, 0.9921569, 0, 1, 1,
0.9666095, -1.624528, 2.984483, 0.9960784, 0, 1, 1,
0.9677883, -0.1453107, 2.49855, 1, 0, 0.9960784, 1,
0.96962, 1.331874, 1.46979, 1, 0, 0.9882353, 1,
0.9699968, 1.766247, 0.8671436, 1, 0, 0.9843137, 1,
0.9727243, -1.083077, 1.698783, 1, 0, 0.9764706, 1,
0.996396, -0.2736261, 1.524987, 1, 0, 0.972549, 1,
0.9966007, -0.1841003, 1.327339, 1, 0, 0.9647059, 1,
0.9991287, -1.346368, 2.369104, 1, 0, 0.9607843, 1,
0.9993805, -0.4195246, 1.915512, 1, 0, 0.9529412, 1,
1.006281, 0.1373495, 1.277818, 1, 0, 0.9490196, 1,
1.010288, -0.8324867, 0.2620974, 1, 0, 0.9411765, 1,
1.012789, 1.107043, 0.07319214, 1, 0, 0.9372549, 1,
1.027025, -0.1241506, 3.685268, 1, 0, 0.9294118, 1,
1.029052, -0.455194, 0.6608662, 1, 0, 0.9254902, 1,
1.03131, -1.724527, 2.515832, 1, 0, 0.9176471, 1,
1.033903, 0.6151352, 2.12943, 1, 0, 0.9137255, 1,
1.038033, 1.344266, -0.5513827, 1, 0, 0.9058824, 1,
1.038842, -0.3204426, 1.889055, 1, 0, 0.9019608, 1,
1.042015, 1.157953, 1.400199, 1, 0, 0.8941177, 1,
1.043408, 0.5590926, 1.128681, 1, 0, 0.8862745, 1,
1.051892, 0.4618745, 0.5759282, 1, 0, 0.8823529, 1,
1.06053, -0.1223852, 1.261934, 1, 0, 0.8745098, 1,
1.061609, 0.7376128, 1.939346, 1, 0, 0.8705882, 1,
1.063302, -2.643851, 1.78418, 1, 0, 0.8627451, 1,
1.064577, -0.5824173, 1.117148, 1, 0, 0.8588235, 1,
1.070251, 0.5104564, 0.4640942, 1, 0, 0.8509804, 1,
1.07077, -0.8409123, 2.642938, 1, 0, 0.8470588, 1,
1.076275, 0.2538238, 1.889843, 1, 0, 0.8392157, 1,
1.076378, -1.608658, 2.301136, 1, 0, 0.8352941, 1,
1.078046, -0.9856624, 1.791777, 1, 0, 0.827451, 1,
1.080231, 0.5252514, -0.6337962, 1, 0, 0.8235294, 1,
1.084265, 0.7068563, 0.08594734, 1, 0, 0.8156863, 1,
1.085158, -0.4296664, 1.240816, 1, 0, 0.8117647, 1,
1.089634, -0.00376008, 1.025962, 1, 0, 0.8039216, 1,
1.096087, 0.7309645, 1.327155, 1, 0, 0.7960784, 1,
1.104058, -0.1014112, 0.7601588, 1, 0, 0.7921569, 1,
1.104474, 1.139741, 1.376789, 1, 0, 0.7843137, 1,
1.104685, 1.812032, 1.251266, 1, 0, 0.7803922, 1,
1.105173, 1.692508, 0.6625438, 1, 0, 0.772549, 1,
1.108569, 0.8562876, 0.8041397, 1, 0, 0.7686275, 1,
1.112611, 1.729018, -0.698095, 1, 0, 0.7607843, 1,
1.116058, -1.49633, 1.752696, 1, 0, 0.7568628, 1,
1.122505, 1.584127, -0.2415683, 1, 0, 0.7490196, 1,
1.131589, -0.03825168, 1.334299, 1, 0, 0.7450981, 1,
1.13519, 0.1686049, 1.159792, 1, 0, 0.7372549, 1,
1.137613, 0.828378, 0.8110885, 1, 0, 0.7333333, 1,
1.137791, -0.7235337, 0.523579, 1, 0, 0.7254902, 1,
1.138991, -0.386484, 1.162325, 1, 0, 0.7215686, 1,
1.144182, 0.2688536, 2.114927, 1, 0, 0.7137255, 1,
1.1533, -0.259581, 2.527365, 1, 0, 0.7098039, 1,
1.166773, -0.1279294, 3.148767, 1, 0, 0.7019608, 1,
1.170412, -1.755605, 2.39281, 1, 0, 0.6941177, 1,
1.175431, -0.4251425, 1.313826, 1, 0, 0.6901961, 1,
1.181528, -1.133804, 2.218169, 1, 0, 0.682353, 1,
1.184401, -2.187982, 2.524826, 1, 0, 0.6784314, 1,
1.186363, 0.4416489, 0.04233714, 1, 0, 0.6705883, 1,
1.210852, -0.1573198, 1.406208, 1, 0, 0.6666667, 1,
1.211581, 0.3290192, 1.735382, 1, 0, 0.6588235, 1,
1.211708, 0.9257312, 0.180359, 1, 0, 0.654902, 1,
1.216405, -0.211545, 3.090724, 1, 0, 0.6470588, 1,
1.218774, -0.07643187, 1.574484, 1, 0, 0.6431373, 1,
1.228421, -2.522533, 3.447209, 1, 0, 0.6352941, 1,
1.231474, 1.298422, 2.046854, 1, 0, 0.6313726, 1,
1.232961, -0.4950148, 2.488528, 1, 0, 0.6235294, 1,
1.237177, -0.5727107, 3.418935, 1, 0, 0.6196079, 1,
1.23793, -0.8664121, 2.269202, 1, 0, 0.6117647, 1,
1.244488, -1.474765, 2.329484, 1, 0, 0.6078432, 1,
1.255926, 0.7894801, 1.819949, 1, 0, 0.6, 1,
1.259113, -0.3479, 4.075634, 1, 0, 0.5921569, 1,
1.259923, -0.4360949, 0.6568479, 1, 0, 0.5882353, 1,
1.260793, 0.3293952, 1.488844, 1, 0, 0.5803922, 1,
1.261255, -0.6290816, 1.380348, 1, 0, 0.5764706, 1,
1.267434, -0.4618145, 3.230349, 1, 0, 0.5686275, 1,
1.270707, 0.9353008, -0.6437749, 1, 0, 0.5647059, 1,
1.274384, 2.300195, 2.893786, 1, 0, 0.5568628, 1,
1.281406, -1.132392, 1.815988, 1, 0, 0.5529412, 1,
1.282119, 1.058537, 0.5079116, 1, 0, 0.5450981, 1,
1.313894, -0.7678543, 1.230702, 1, 0, 0.5411765, 1,
1.317975, 1.393054, 0.3960406, 1, 0, 0.5333334, 1,
1.325468, 1.064404, -0.9394929, 1, 0, 0.5294118, 1,
1.327858, 0.1324484, 1.215853, 1, 0, 0.5215687, 1,
1.332792, -0.0736188, 3.050258, 1, 0, 0.5176471, 1,
1.355576, -0.2189721, -0.09191037, 1, 0, 0.509804, 1,
1.359464, 0.5705918, 1.914233, 1, 0, 0.5058824, 1,
1.360229, 0.1890411, 2.142028, 1, 0, 0.4980392, 1,
1.364818, 0.6970469, 0.331482, 1, 0, 0.4901961, 1,
1.372153, 0.4642441, 1.666958, 1, 0, 0.4862745, 1,
1.38036, 1.216259, -0.5711178, 1, 0, 0.4784314, 1,
1.398503, -1.012556, 1.961967, 1, 0, 0.4745098, 1,
1.410356, -0.1331952, 0.8316542, 1, 0, 0.4666667, 1,
1.412809, -0.5084248, 2.754601, 1, 0, 0.4627451, 1,
1.43607, 0.8533118, 1.120903, 1, 0, 0.454902, 1,
1.441732, 0.7845951, 1.686218, 1, 0, 0.4509804, 1,
1.450884, 0.7121909, 2.561934, 1, 0, 0.4431373, 1,
1.457874, -0.7228277, 3.281554, 1, 0, 0.4392157, 1,
1.467032, 1.270464, 0.6614186, 1, 0, 0.4313726, 1,
1.473486, 2.728571, -0.4673456, 1, 0, 0.427451, 1,
1.495439, 1.352012, 1.419822, 1, 0, 0.4196078, 1,
1.497491, -0.4360059, 1.879836, 1, 0, 0.4156863, 1,
1.50603, 0.553624, 0.2083732, 1, 0, 0.4078431, 1,
1.511093, 1.523712, 1.685488, 1, 0, 0.4039216, 1,
1.513978, 0.5979675, -0.3721063, 1, 0, 0.3960784, 1,
1.523167, 0.6521364, 1.082174, 1, 0, 0.3882353, 1,
1.523777, -1.394791, 4.010821, 1, 0, 0.3843137, 1,
1.527023, 1.443796, 0.5387644, 1, 0, 0.3764706, 1,
1.528819, -0.455638, 1.46809, 1, 0, 0.372549, 1,
1.53284, 1.301485, 1.016224, 1, 0, 0.3647059, 1,
1.540088, 0.1165739, 1.792942, 1, 0, 0.3607843, 1,
1.545215, 0.0215683, 1.036148, 1, 0, 0.3529412, 1,
1.547778, -1.227713, 2.486156, 1, 0, 0.3490196, 1,
1.568905, -0.4088239, 1.582401, 1, 0, 0.3411765, 1,
1.570915, 0.02390699, 0.4778754, 1, 0, 0.3372549, 1,
1.576565, -0.7394913, 2.011254, 1, 0, 0.3294118, 1,
1.580905, 0.3567017, 2.296195, 1, 0, 0.3254902, 1,
1.601108, -1.642743, 4.342212, 1, 0, 0.3176471, 1,
1.662541, -1.888968, 2.774104, 1, 0, 0.3137255, 1,
1.665953, -0.293168, 2.6918, 1, 0, 0.3058824, 1,
1.689519, -1.561871, 0.8258977, 1, 0, 0.2980392, 1,
1.690617, -0.7876809, 0.1527614, 1, 0, 0.2941177, 1,
1.69978, -0.3558189, 1.636848, 1, 0, 0.2862745, 1,
1.710314, 0.880407, -0.7962924, 1, 0, 0.282353, 1,
1.72861, 0.3823198, 1.740043, 1, 0, 0.2745098, 1,
1.731763, 1.050391, 0.4485905, 1, 0, 0.2705882, 1,
1.7433, 0.6849152, -0.04862982, 1, 0, 0.2627451, 1,
1.745256, -1.428042, 1.179887, 1, 0, 0.2588235, 1,
1.76693, -0.4077809, -0.4116583, 1, 0, 0.2509804, 1,
1.769885, 1.142712, 0.7746979, 1, 0, 0.2470588, 1,
1.772816, 0.5893896, 1.259339, 1, 0, 0.2392157, 1,
1.779892, 1.991728, 1.995476, 1, 0, 0.2352941, 1,
1.783273, 0.5848082, 2.260628, 1, 0, 0.227451, 1,
1.801166, 1.267763, 0.1865816, 1, 0, 0.2235294, 1,
1.819529, -0.07033359, 1.872764, 1, 0, 0.2156863, 1,
1.84493, 1.129284, 0.9660287, 1, 0, 0.2117647, 1,
1.849601, -0.4077229, 2.143383, 1, 0, 0.2039216, 1,
1.854404, 0.2699142, 0.0389051, 1, 0, 0.1960784, 1,
1.8601, 1.238652, -0.5515089, 1, 0, 0.1921569, 1,
1.88695, -0.03851424, 2.554404, 1, 0, 0.1843137, 1,
1.907227, 0.700321, 1.952282, 1, 0, 0.1803922, 1,
1.912575, -0.245036, 1.568247, 1, 0, 0.172549, 1,
1.921476, 1.138509, 1.798813, 1, 0, 0.1686275, 1,
1.931008, 1.968889, 0.7367647, 1, 0, 0.1607843, 1,
1.934053, 0.199533, 1.1692, 1, 0, 0.1568628, 1,
1.936335, 0.2297914, 1.2303, 1, 0, 0.1490196, 1,
1.937764, 0.9139302, 1.564465, 1, 0, 0.145098, 1,
1.958073, -0.5197251, -0.8048015, 1, 0, 0.1372549, 1,
1.982565, 0.856918, 1.533109, 1, 0, 0.1333333, 1,
1.998614, -0.6276121, 1.404379, 1, 0, 0.1254902, 1,
2.045138, -0.4704734, 1.429418, 1, 0, 0.1215686, 1,
2.050247, 1.287815, 1.552927, 1, 0, 0.1137255, 1,
2.06356, -0.6162863, 2.690794, 1, 0, 0.1098039, 1,
2.079646, 0.4000669, 1.590904, 1, 0, 0.1019608, 1,
2.094048, 0.01630355, 1.312398, 1, 0, 0.09411765, 1,
2.132134, 0.9275525, -1.307188, 1, 0, 0.09019608, 1,
2.199799, -0.2291209, 2.281561, 1, 0, 0.08235294, 1,
2.234394, 1.227729, 0.2876278, 1, 0, 0.07843138, 1,
2.356464, 0.2530869, 2.163166, 1, 0, 0.07058824, 1,
2.373303, -0.9445583, 2.732992, 1, 0, 0.06666667, 1,
2.377645, -0.4843403, 0.9928185, 1, 0, 0.05882353, 1,
2.397646, -0.4551627, 2.383427, 1, 0, 0.05490196, 1,
2.428945, -0.217805, 1.909962, 1, 0, 0.04705882, 1,
2.493966, -0.0753522, 2.189891, 1, 0, 0.04313726, 1,
2.512359, -1.731444, 1.375568, 1, 0, 0.03529412, 1,
2.574556, -0.07706124, 2.058718, 1, 0, 0.03137255, 1,
2.605439, -0.7101731, 1.04618, 1, 0, 0.02352941, 1,
2.999008, -0.1337325, 1.864272, 1, 0, 0.01960784, 1,
3.493884, -0.2474055, 2.951406, 1, 0, 0.01176471, 1,
3.524888, 0.6666068, 1.00712, 1, 0, 0.007843138, 1
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
0.1740321, -4.428395, -7.167017, 0, -0.5, 0.5, 0.5,
0.1740321, -4.428395, -7.167017, 1, -0.5, 0.5, 0.5,
0.1740321, -4.428395, -7.167017, 1, 1.5, 0.5, 0.5,
0.1740321, -4.428395, -7.167017, 0, 1.5, 0.5, 0.5
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
-4.312764, -0.3312693, -7.167017, 0, -0.5, 0.5, 0.5,
-4.312764, -0.3312693, -7.167017, 1, -0.5, 0.5, 0.5,
-4.312764, -0.3312693, -7.167017, 1, 1.5, 0.5, 0.5,
-4.312764, -0.3312693, -7.167017, 0, 1.5, 0.5, 0.5
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
-4.312764, -4.428395, 0.1610973, 0, -0.5, 0.5, 0.5,
-4.312764, -4.428395, 0.1610973, 1, -0.5, 0.5, 0.5,
-4.312764, -4.428395, 0.1610973, 1, 1.5, 0.5, 0.5,
-4.312764, -4.428395, 0.1610973, 0, 1.5, 0.5, 0.5
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
-3, -3.482905, -5.475914,
3, -3.482905, -5.475914,
-3, -3.482905, -5.475914,
-3, -3.640486, -5.757764,
-2, -3.482905, -5.475914,
-2, -3.640486, -5.757764,
-1, -3.482905, -5.475914,
-1, -3.640486, -5.757764,
0, -3.482905, -5.475914,
0, -3.640486, -5.757764,
1, -3.482905, -5.475914,
1, -3.640486, -5.757764,
2, -3.482905, -5.475914,
2, -3.640486, -5.757764,
3, -3.482905, -5.475914,
3, -3.640486, -5.757764
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
-3, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
-3, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
-3, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
-3, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
-2, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
-2, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
-2, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
-2, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
-1, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
-1, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
-1, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
-1, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
0, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
0, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
0, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
0, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
1, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
1, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
1, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
1, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
2, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
2, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
2, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
2, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5,
3, -3.95565, -6.321465, 0, -0.5, 0.5, 0.5,
3, -3.95565, -6.321465, 1, -0.5, 0.5, 0.5,
3, -3.95565, -6.321465, 1, 1.5, 0.5, 0.5,
3, -3.95565, -6.321465, 0, 1.5, 0.5, 0.5
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
-3.277349, -3, -5.475914,
-3.277349, 2, -5.475914,
-3.277349, -3, -5.475914,
-3.449919, -3, -5.757764,
-3.277349, -2, -5.475914,
-3.449919, -2, -5.757764,
-3.277349, -1, -5.475914,
-3.449919, -1, -5.757764,
-3.277349, 0, -5.475914,
-3.449919, 0, -5.757764,
-3.277349, 1, -5.475914,
-3.449919, 1, -5.757764,
-3.277349, 2, -5.475914,
-3.449919, 2, -5.757764
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
-3.795057, -3, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, -3, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, -3, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, -3, -6.321465, 0, 1.5, 0.5, 0.5,
-3.795057, -2, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, -2, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, -2, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, -2, -6.321465, 0, 1.5, 0.5, 0.5,
-3.795057, -1, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, -1, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, -1, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, -1, -6.321465, 0, 1.5, 0.5, 0.5,
-3.795057, 0, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, 0, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, 0, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, 0, -6.321465, 0, 1.5, 0.5, 0.5,
-3.795057, 1, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, 1, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, 1, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, 1, -6.321465, 0, 1.5, 0.5, 0.5,
-3.795057, 2, -6.321465, 0, -0.5, 0.5, 0.5,
-3.795057, 2, -6.321465, 1, -0.5, 0.5, 0.5,
-3.795057, 2, -6.321465, 1, 1.5, 0.5, 0.5,
-3.795057, 2, -6.321465, 0, 1.5, 0.5, 0.5
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
-3.277349, -3.482905, -4,
-3.277349, -3.482905, 4,
-3.277349, -3.482905, -4,
-3.449919, -3.640486, -4,
-3.277349, -3.482905, -2,
-3.449919, -3.640486, -2,
-3.277349, -3.482905, 0,
-3.449919, -3.640486, 0,
-3.277349, -3.482905, 2,
-3.449919, -3.640486, 2,
-3.277349, -3.482905, 4,
-3.449919, -3.640486, 4
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
-3.795057, -3.95565, -4, 0, -0.5, 0.5, 0.5,
-3.795057, -3.95565, -4, 1, -0.5, 0.5, 0.5,
-3.795057, -3.95565, -4, 1, 1.5, 0.5, 0.5,
-3.795057, -3.95565, -4, 0, 1.5, 0.5, 0.5,
-3.795057, -3.95565, -2, 0, -0.5, 0.5, 0.5,
-3.795057, -3.95565, -2, 1, -0.5, 0.5, 0.5,
-3.795057, -3.95565, -2, 1, 1.5, 0.5, 0.5,
-3.795057, -3.95565, -2, 0, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 0, 0, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 0, 1, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 0, 1, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 0, 0, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 2, 0, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 2, 1, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 2, 1, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 2, 0, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 4, 0, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 4, 1, -0.5, 0.5, 0.5,
-3.795057, -3.95565, 4, 1, 1.5, 0.5, 0.5,
-3.795057, -3.95565, 4, 0, 1.5, 0.5, 0.5
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
-3.277349, -3.482905, -5.475914,
-3.277349, 2.820366, -5.475914,
-3.277349, -3.482905, 5.798108,
-3.277349, 2.820366, 5.798108,
-3.277349, -3.482905, -5.475914,
-3.277349, -3.482905, 5.798108,
-3.277349, 2.820366, -5.475914,
-3.277349, 2.820366, 5.798108,
-3.277349, -3.482905, -5.475914,
3.625414, -3.482905, -5.475914,
-3.277349, -3.482905, 5.798108,
3.625414, -3.482905, 5.798108,
-3.277349, 2.820366, -5.475914,
3.625414, 2.820366, -5.475914,
-3.277349, 2.820366, 5.798108,
3.625414, 2.820366, 5.798108,
3.625414, -3.482905, -5.475914,
3.625414, 2.820366, -5.475914,
3.625414, -3.482905, 5.798108,
3.625414, 2.820366, 5.798108,
3.625414, -3.482905, -5.475914,
3.625414, -3.482905, 5.798108,
3.625414, 2.820366, -5.475914,
3.625414, 2.820366, 5.798108
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
var radius = 7.820272;
var distance = 34.79327;
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
mvMatrix.translate( -0.1740321, 0.3312693, -0.1610973 );
mvMatrix.scale( 1.224934, 1.341435, 0.7499924 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79327);
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
BLASTICIDIN_S<-read.table("BLASTICIDIN_S.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-BLASTICIDIN_S$V2
```

```
## Error in eval(expr, envir, enclos): object 'BLASTICIDIN_S' not found
```

```r
y<-BLASTICIDIN_S$V3
```

```
## Error in eval(expr, envir, enclos): object 'BLASTICIDIN_S' not found
```

```r
z<-BLASTICIDIN_S$V4
```

```
## Error in eval(expr, envir, enclos): object 'BLASTICIDIN_S' not found
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
-3.176824, -0.864554, -2.309831, 0, 0, 1, 1, 1,
-3.03026, 0.7665133, -0.8137854, 1, 0, 0, 1, 1,
-2.774562, -0.1334609, 1.09858, 1, 0, 0, 1, 1,
-2.764313, -0.3097569, -2.022337, 1, 0, 0, 1, 1,
-2.741538, -0.5048551, -2.926701, 1, 0, 0, 1, 1,
-2.718099, -1.346174, -1.967694, 1, 0, 0, 1, 1,
-2.680899, -0.1305187, -1.755598, 0, 0, 0, 1, 1,
-2.659249, 0.2897913, -0.7969928, 0, 0, 0, 1, 1,
-2.568479, 0.6734968, -0.7741621, 0, 0, 0, 1, 1,
-2.545125, 0.8226509, -2.612861, 0, 0, 0, 1, 1,
-2.518091, -1.313386, -0.8682439, 0, 0, 0, 1, 1,
-2.492141, 1.11288, -1.297121, 0, 0, 0, 1, 1,
-2.47841, 1.098436, -0.0464664, 0, 0, 0, 1, 1,
-2.471403, 0.1748475, -1.61627, 1, 1, 1, 1, 1,
-2.446712, -0.8177193, -1.870071, 1, 1, 1, 1, 1,
-2.429209, 1.116848, -1.931623, 1, 1, 1, 1, 1,
-2.39831, 0.6596798, -1.737865, 1, 1, 1, 1, 1,
-2.396163, 1.061056, 0.04865331, 1, 1, 1, 1, 1,
-2.36585, 0.4816666, -1.06689, 1, 1, 1, 1, 1,
-2.33459, -0.4913762, -2.305631, 1, 1, 1, 1, 1,
-2.261262, -0.4714699, -1.459096, 1, 1, 1, 1, 1,
-2.222557, 1.196582, -0.4755684, 1, 1, 1, 1, 1,
-2.204942, 0.5551332, -1.509084, 1, 1, 1, 1, 1,
-2.194762, -0.1555309, -1.590473, 1, 1, 1, 1, 1,
-2.151973, 1.346171, -2.39584, 1, 1, 1, 1, 1,
-2.143475, -0.6105745, -1.472093, 1, 1, 1, 1, 1,
-2.122593, 0.7900233, -2.64673, 1, 1, 1, 1, 1,
-2.087517, -0.2260965, -0.5111572, 1, 1, 1, 1, 1,
-2.078811, 0.2506609, -1.698519, 0, 0, 1, 1, 1,
-2.074277, -0.4874242, -0.4407847, 1, 0, 0, 1, 1,
-2.008151, 0.2652345, -2.096914, 1, 0, 0, 1, 1,
-1.973499, 0.8453681, -1.888051, 1, 0, 0, 1, 1,
-1.963554, -1.547714, 0.4785789, 1, 0, 0, 1, 1,
-1.926375, -0.662325, -2.072939, 1, 0, 0, 1, 1,
-1.887356, -0.9620412, -3.054533, 0, 0, 0, 1, 1,
-1.87766, -0.4705153, -3.409873, 0, 0, 0, 1, 1,
-1.873159, 0.4501186, -1.24201, 0, 0, 0, 1, 1,
-1.865756, -0.7333972, -0.6251054, 0, 0, 0, 1, 1,
-1.864766, 1.264584, 0.4124136, 0, 0, 0, 1, 1,
-1.83338, -1.197219, -4.141666, 0, 0, 0, 1, 1,
-1.833347, -0.8872818, -1.725451, 0, 0, 0, 1, 1,
-1.824421, -0.7490122, -4.20973, 1, 1, 1, 1, 1,
-1.822231, 0.3921267, -0.7685202, 1, 1, 1, 1, 1,
-1.815862, -2.32915, -0.7128434, 1, 1, 1, 1, 1,
-1.813332, -2.23015, -2.675616, 1, 1, 1, 1, 1,
-1.810181, -1.334937, -2.304854, 1, 1, 1, 1, 1,
-1.807145, 2.43861, -0.5548062, 1, 1, 1, 1, 1,
-1.805639, 0.8609179, -0.4853158, 1, 1, 1, 1, 1,
-1.797593, -0.5712774, -1.903158, 1, 1, 1, 1, 1,
-1.790097, 0.3703701, -2.722516, 1, 1, 1, 1, 1,
-1.737483, 0.3698122, -2.216009, 1, 1, 1, 1, 1,
-1.731004, -0.2221425, -1.869767, 1, 1, 1, 1, 1,
-1.724013, -2.653901, -1.881989, 1, 1, 1, 1, 1,
-1.710426, 0.3279459, -1.477194, 1, 1, 1, 1, 1,
-1.663629, -0.05992826, -1.635016, 1, 1, 1, 1, 1,
-1.662234, 1.177896, -1.10813, 1, 1, 1, 1, 1,
-1.659416, -0.9962157, -1.558123, 0, 0, 1, 1, 1,
-1.645976, -0.736938, -2.868022, 1, 0, 0, 1, 1,
-1.608813, 0.932251, -0.5064849, 1, 0, 0, 1, 1,
-1.598692, -0.3012194, -1.238312, 1, 0, 0, 1, 1,
-1.594597, 1.679956, -1.27916, 1, 0, 0, 1, 1,
-1.559961, -1.849932, -4.088062, 1, 0, 0, 1, 1,
-1.556182, -1.019116, -1.482598, 0, 0, 0, 1, 1,
-1.544479, -0.9594933, -3.229231, 0, 0, 0, 1, 1,
-1.520524, -0.614733, -2.546986, 0, 0, 0, 1, 1,
-1.518901, 1.561883, -1.846019, 0, 0, 0, 1, 1,
-1.518797, 0.2719216, -2.227636, 0, 0, 0, 1, 1,
-1.504829, 2.505332, -0.2793124, 0, 0, 0, 1, 1,
-1.476036, -0.2078467, -1.69498, 0, 0, 0, 1, 1,
-1.475012, -1.439161, -1.223456, 1, 1, 1, 1, 1,
-1.470192, 0.003769466, -0.4146957, 1, 1, 1, 1, 1,
-1.469534, -0.8887197, -2.128093, 1, 1, 1, 1, 1,
-1.460763, 0.7242519, -2.61471, 1, 1, 1, 1, 1,
-1.454486, 0.5649697, -1.37392, 1, 1, 1, 1, 1,
-1.454419, 0.4370025, -1.727716, 1, 1, 1, 1, 1,
-1.451905, 1.573902, -1.863359, 1, 1, 1, 1, 1,
-1.444028, -1.48806, -1.348521, 1, 1, 1, 1, 1,
-1.44133, -0.1962826, -3.547582, 1, 1, 1, 1, 1,
-1.438733, -0.602841, -2.182148, 1, 1, 1, 1, 1,
-1.436595, -0.5317996, -2.559748, 1, 1, 1, 1, 1,
-1.400594, -0.1500119, -1.125177, 1, 1, 1, 1, 1,
-1.399055, 0.3420594, -1.273157, 1, 1, 1, 1, 1,
-1.382946, -0.8989105, -1.70261, 1, 1, 1, 1, 1,
-1.37253, 0.4249905, -2.332881, 1, 1, 1, 1, 1,
-1.371073, -0.5674499, -4.871517, 0, 0, 1, 1, 1,
-1.37099, 0.02995161, -1.152551, 1, 0, 0, 1, 1,
-1.353971, -0.5668022, -1.621266, 1, 0, 0, 1, 1,
-1.349581, 1.188673, -0.3859281, 1, 0, 0, 1, 1,
-1.346204, -0.008788405, -1.648938, 1, 0, 0, 1, 1,
-1.342619, -1.139346, -2.034138, 1, 0, 0, 1, 1,
-1.341321, -1.048349, -2.064914, 0, 0, 0, 1, 1,
-1.339232, 0.7322949, -0.9691068, 0, 0, 0, 1, 1,
-1.338285, 0.6338013, -1.472841, 0, 0, 0, 1, 1,
-1.328895, -1.744356, -2.080074, 0, 0, 0, 1, 1,
-1.312581, 0.269315, -2.951789, 0, 0, 0, 1, 1,
-1.31195, 0.6588293, -0.320334, 0, 0, 0, 1, 1,
-1.309719, -0.6388173, -1.812924, 0, 0, 0, 1, 1,
-1.306266, -0.9268188, -2.918339, 1, 1, 1, 1, 1,
-1.304364, -0.9841182, -1.696612, 1, 1, 1, 1, 1,
-1.295852, -0.4706932, -1.329502, 1, 1, 1, 1, 1,
-1.283725, 1.141335, 0.09591805, 1, 1, 1, 1, 1,
-1.269863, -1.543167, -1.691455, 1, 1, 1, 1, 1,
-1.264125, -0.2809782, -2.329582, 1, 1, 1, 1, 1,
-1.261247, 0.5831582, -1.342439, 1, 1, 1, 1, 1,
-1.259013, 0.7283565, -0.9047004, 1, 1, 1, 1, 1,
-1.256444, 0.1795495, -2.465972, 1, 1, 1, 1, 1,
-1.245485, 1.060029, -0.8829048, 1, 1, 1, 1, 1,
-1.242579, 0.493111, -1.003142, 1, 1, 1, 1, 1,
-1.237723, 0.8318796, -0.4036981, 1, 1, 1, 1, 1,
-1.236113, 1.093801, 0.4563516, 1, 1, 1, 1, 1,
-1.227822, 0.8872259, -2.812507, 1, 1, 1, 1, 1,
-1.227116, -0.8505296, -0.3936018, 1, 1, 1, 1, 1,
-1.221235, 0.3764947, -1.764963, 0, 0, 1, 1, 1,
-1.220016, 0.5015073, -1.851547, 1, 0, 0, 1, 1,
-1.216943, 1.550831, -1.448659, 1, 0, 0, 1, 1,
-1.205896, 0.4832257, -3.301745, 1, 0, 0, 1, 1,
-1.205241, 0.3958747, -1.302261, 1, 0, 0, 1, 1,
-1.197894, -0.3582613, -3.21606, 1, 0, 0, 1, 1,
-1.18784, 0.432708, 0.2911374, 0, 0, 0, 1, 1,
-1.185952, 0.1934785, -1.730345, 0, 0, 0, 1, 1,
-1.184681, 1.078089, -0.5069376, 0, 0, 0, 1, 1,
-1.176896, 1.748873, -0.4154843, 0, 0, 0, 1, 1,
-1.171371, -0.972643, -5.000135, 0, 0, 0, 1, 1,
-1.166291, -1.383635, -2.340553, 0, 0, 0, 1, 1,
-1.159864, -0.357964, -3.596933, 0, 0, 0, 1, 1,
-1.159699, -1.333262, -2.144578, 1, 1, 1, 1, 1,
-1.153304, 0.9144204, -2.183005, 1, 1, 1, 1, 1,
-1.147465, 0.1639209, -1.252492, 1, 1, 1, 1, 1,
-1.147357, 0.5980764, -1.008999, 1, 1, 1, 1, 1,
-1.145106, -0.8879822, -2.467519, 1, 1, 1, 1, 1,
-1.145012, -0.2046082, -1.681921, 1, 1, 1, 1, 1,
-1.143707, 0.8236932, 0.8252595, 1, 1, 1, 1, 1,
-1.138388, -0.8132271, -3.819493, 1, 1, 1, 1, 1,
-1.136453, -0.19763, -2.028442, 1, 1, 1, 1, 1,
-1.13638, -1.108393, -2.406193, 1, 1, 1, 1, 1,
-1.129753, -0.7043307, -3.64853, 1, 1, 1, 1, 1,
-1.123723, 0.1452925, -0.7112336, 1, 1, 1, 1, 1,
-1.115309, -0.8978279, -1.553129, 1, 1, 1, 1, 1,
-1.104352, -0.530708, -2.282207, 1, 1, 1, 1, 1,
-1.102139, -0.5032958, -0.8552321, 1, 1, 1, 1, 1,
-1.098, -1.117196, -1.231174, 0, 0, 1, 1, 1,
-1.097148, -1.294319, -3.85568, 1, 0, 0, 1, 1,
-1.090849, -1.133058, -2.683699, 1, 0, 0, 1, 1,
-1.088903, -1.555894, -0.6745352, 1, 0, 0, 1, 1,
-1.088006, 0.1655554, -2.558223, 1, 0, 0, 1, 1,
-1.081505, -1.634692, -1.500914, 1, 0, 0, 1, 1,
-1.079857, 0.4249235, -1.104062, 0, 0, 0, 1, 1,
-1.079453, -1.572215, -1.770382, 0, 0, 0, 1, 1,
-1.078442, 0.9684925, 0.07891803, 0, 0, 0, 1, 1,
-1.078261, -0.3615432, -1.890562, 0, 0, 0, 1, 1,
-1.074979, -1.97668, -1.167793, 0, 0, 0, 1, 1,
-1.070276, -1.078043, -2.772936, 0, 0, 0, 1, 1,
-1.069983, 1.422785, -1.048954, 0, 0, 0, 1, 1,
-1.069028, -0.1732089, -0.6383148, 1, 1, 1, 1, 1,
-1.064324, -0.7511854, -2.851312, 1, 1, 1, 1, 1,
-1.053153, -0.0255543, -0.9218925, 1, 1, 1, 1, 1,
-1.05097, 0.5724058, -1.158386, 1, 1, 1, 1, 1,
-1.049695, -0.08603769, -1.739471, 1, 1, 1, 1, 1,
-1.045765, 1.411229, -1.816202, 1, 1, 1, 1, 1,
-1.044264, -1.397647, -3.082627, 1, 1, 1, 1, 1,
-1.037917, 0.3570203, -1.12416, 1, 1, 1, 1, 1,
-1.035758, 0.1383974, -2.094663, 1, 1, 1, 1, 1,
-1.035093, -0.1600119, -0.3798747, 1, 1, 1, 1, 1,
-1.032985, 0.1302843, -2.908455, 1, 1, 1, 1, 1,
-1.03199, 0.1709418, -0.3141677, 1, 1, 1, 1, 1,
-1.028913, -0.01514709, -2.49656, 1, 1, 1, 1, 1,
-1.027431, 1.131958, 1.114594, 1, 1, 1, 1, 1,
-1.024738, -0.2795047, -1.107673, 1, 1, 1, 1, 1,
-1.021153, 0.5167266, -0.7036881, 0, 0, 1, 1, 1,
-1.020082, 1.318532, -0.7747871, 1, 0, 0, 1, 1,
-1.019957, 0.3923284, -0.6464248, 1, 0, 0, 1, 1,
-1.010778, 0.1033048, -0.670594, 1, 0, 0, 1, 1,
-1.00891, 1.547857, -1.301378, 1, 0, 0, 1, 1,
-1.004509, 0.5627563, -0.2997527, 1, 0, 0, 1, 1,
-1.002511, -0.4571001, -1.020861, 0, 0, 0, 1, 1,
-1.000062, -0.9352783, -2.177247, 0, 0, 0, 1, 1,
-0.999, -0.2593338, 0.243316, 0, 0, 0, 1, 1,
-0.9961326, -0.8665168, -1.34372, 0, 0, 0, 1, 1,
-0.9954201, 0.9499168, -0.7628721, 0, 0, 0, 1, 1,
-0.9944421, 0.6795021, -0.6292036, 0, 0, 0, 1, 1,
-0.9929788, -0.6116158, -3.836169, 0, 0, 0, 1, 1,
-0.9910531, 0.2440714, 0.3899217, 1, 1, 1, 1, 1,
-0.9877436, -1.89641, -3.857106, 1, 1, 1, 1, 1,
-0.9856003, -0.7255713, -3.305779, 1, 1, 1, 1, 1,
-0.9847432, 0.1992123, -0.6520752, 1, 1, 1, 1, 1,
-0.9804333, 1.248834, -2.819406, 1, 1, 1, 1, 1,
-0.9800838, -0.822219, -2.637378, 1, 1, 1, 1, 1,
-0.9677874, 0.2795176, -3.095941, 1, 1, 1, 1, 1,
-0.9657058, 0.9075351, -1.452442, 1, 1, 1, 1, 1,
-0.9639466, -0.2027517, -3.825835, 1, 1, 1, 1, 1,
-0.9580631, -0.2281974, -2.520485, 1, 1, 1, 1, 1,
-0.9564998, -2.187868, -2.054741, 1, 1, 1, 1, 1,
-0.9548907, 0.3969501, -1.428355, 1, 1, 1, 1, 1,
-0.9466308, -0.9905278, -0.2517304, 1, 1, 1, 1, 1,
-0.9444602, 1.17703, -1.617824, 1, 1, 1, 1, 1,
-0.9399333, -1.082288, -1.014626, 1, 1, 1, 1, 1,
-0.9369769, -0.1900455, -1.200725, 0, 0, 1, 1, 1,
-0.9314793, 2.307259, -0.519142, 1, 0, 0, 1, 1,
-0.9312173, -0.545792, -1.356322, 1, 0, 0, 1, 1,
-0.9280859, -0.6394177, -2.170972, 1, 0, 0, 1, 1,
-0.9277973, 0.9209101, 1.37948, 1, 0, 0, 1, 1,
-0.9261619, 1.880439, -1.395009, 1, 0, 0, 1, 1,
-0.9243655, 0.2417845, -2.139234, 0, 0, 0, 1, 1,
-0.9213766, 1.990543, 0.1619148, 0, 0, 0, 1, 1,
-0.9149765, -1.234969, -2.87354, 0, 0, 0, 1, 1,
-0.9093974, -0.01435422, -1.365957, 0, 0, 0, 1, 1,
-0.9074557, -0.5643603, -0.4481343, 0, 0, 0, 1, 1,
-0.9068126, -0.08223414, -1.936238, 0, 0, 0, 1, 1,
-0.9040356, -0.7887043, -3.743618, 0, 0, 0, 1, 1,
-0.8994648, 0.7669704, -0.3645451, 1, 1, 1, 1, 1,
-0.8938347, 0.4522549, -1.694074, 1, 1, 1, 1, 1,
-0.8841671, -0.07983524, -1.594503, 1, 1, 1, 1, 1,
-0.8782635, 0.5577303, 0.8168839, 1, 1, 1, 1, 1,
-0.8766868, 1.131754, -0.2701254, 1, 1, 1, 1, 1,
-0.8648187, 0.6264343, -0.1205186, 1, 1, 1, 1, 1,
-0.8618128, -0.4621132, -2.060819, 1, 1, 1, 1, 1,
-0.8570483, 0.8423213, -1.243867, 1, 1, 1, 1, 1,
-0.8564235, -1.44597, -1.117871, 1, 1, 1, 1, 1,
-0.8547992, -0.5817708, -1.481167, 1, 1, 1, 1, 1,
-0.850816, 0.3680419, -0.7649488, 1, 1, 1, 1, 1,
-0.8506055, 0.09645294, -1.415511, 1, 1, 1, 1, 1,
-0.8464888, -1.098797, -3.594197, 1, 1, 1, 1, 1,
-0.8394545, 0.8903526, 0.05973259, 1, 1, 1, 1, 1,
-0.8392636, -0.1776943, -2.193504, 1, 1, 1, 1, 1,
-0.8367838, -1.045211, -3.542613, 0, 0, 1, 1, 1,
-0.8363858, -1.467561, -1.160369, 1, 0, 0, 1, 1,
-0.8362329, -0.2484985, -1.452439, 1, 0, 0, 1, 1,
-0.8354058, -1.167755, -2.312164, 1, 0, 0, 1, 1,
-0.8339924, 0.2895759, -0.377161, 1, 0, 0, 1, 1,
-0.8277662, 0.8282263, -1.983404, 1, 0, 0, 1, 1,
-0.8226008, 0.4571366, 1.85906, 0, 0, 0, 1, 1,
-0.8197695, 0.6807103, -1.787912, 0, 0, 0, 1, 1,
-0.8108785, 0.2141355, -2.585145, 0, 0, 0, 1, 1,
-0.8102926, -1.309061, -1.943356, 0, 0, 0, 1, 1,
-0.8065299, 0.319916, -2.918036, 0, 0, 0, 1, 1,
-0.8045515, -0.610635, -2.616502, 0, 0, 0, 1, 1,
-0.8036993, -0.6152869, -1.381763, 0, 0, 0, 1, 1,
-0.8001603, 0.9515312, 0.5270916, 1, 1, 1, 1, 1,
-0.7984041, -0.1358046, -1.303937, 1, 1, 1, 1, 1,
-0.7955343, -0.1618234, -1.362931, 1, 1, 1, 1, 1,
-0.7940281, 1.865208, 0.05126454, 1, 1, 1, 1, 1,
-0.791235, 0.20402, -0.9193729, 1, 1, 1, 1, 1,
-0.7806273, 0.4248945, -2.016748, 1, 1, 1, 1, 1,
-0.7741014, -0.07545575, -1.323497, 1, 1, 1, 1, 1,
-0.773904, -1.569982, -1.5807, 1, 1, 1, 1, 1,
-0.7705562, -0.7155496, -3.018803, 1, 1, 1, 1, 1,
-0.767259, 0.2056106, -0.9327026, 1, 1, 1, 1, 1,
-0.7646204, 0.03802523, -1.63255, 1, 1, 1, 1, 1,
-0.7641262, 0.3988763, 0.1022806, 1, 1, 1, 1, 1,
-0.7622637, -0.7370218, -3.619961, 1, 1, 1, 1, 1,
-0.7620149, 0.2896461, -0.9457246, 1, 1, 1, 1, 1,
-0.7589999, 1.226808, -1.853391, 1, 1, 1, 1, 1,
-0.7564274, -0.5936297, -1.018914, 0, 0, 1, 1, 1,
-0.7522311, 2.193001, 1.329141, 1, 0, 0, 1, 1,
-0.7474375, -0.9645902, -3.401508, 1, 0, 0, 1, 1,
-0.7464359, -0.2253126, -2.760685, 1, 0, 0, 1, 1,
-0.7438211, 1.081544, -0.6049641, 1, 0, 0, 1, 1,
-0.7429535, -0.4779632, -1.693483, 1, 0, 0, 1, 1,
-0.7404151, 1.265911, 0.59826, 0, 0, 0, 1, 1,
-0.7383579, 1.391372, -0.3403029, 0, 0, 0, 1, 1,
-0.7335408, -0.5873929, -2.083539, 0, 0, 0, 1, 1,
-0.7238566, 0.8973101, 0.3281171, 0, 0, 0, 1, 1,
-0.7232957, -0.3947909, -2.460445, 0, 0, 0, 1, 1,
-0.7207611, -2.140444, -2.735792, 0, 0, 0, 1, 1,
-0.7199397, 0.6409385, -0.1691687, 0, 0, 0, 1, 1,
-0.7177127, -0.3802454, -1.646792, 1, 1, 1, 1, 1,
-0.7154314, -1.041178, -3.035422, 1, 1, 1, 1, 1,
-0.7104944, 0.8523729, -0.06097637, 1, 1, 1, 1, 1,
-0.7079206, 1.718504, -0.7969781, 1, 1, 1, 1, 1,
-0.7061018, 0.08856621, -1.531899, 1, 1, 1, 1, 1,
-0.7023582, -1.629271, -5.048086, 1, 1, 1, 1, 1,
-0.6906511, 0.5343011, -1.256881, 1, 1, 1, 1, 1,
-0.688439, -0.4141645, -1.272616, 1, 1, 1, 1, 1,
-0.6869531, 0.7862577, -0.4575712, 1, 1, 1, 1, 1,
-0.6817272, 1.524515, -0.9217501, 1, 1, 1, 1, 1,
-0.6785142, -0.5229326, -3.056909, 1, 1, 1, 1, 1,
-0.6765719, -1.109534, -3.735447, 1, 1, 1, 1, 1,
-0.6731081, -0.4654365, -2.666423, 1, 1, 1, 1, 1,
-0.6702113, -1.159445, -3.064925, 1, 1, 1, 1, 1,
-0.6658037, 0.7938357, -1.206268, 1, 1, 1, 1, 1,
-0.6636551, 0.3578254, -0.8538257, 0, 0, 1, 1, 1,
-0.6614845, 2.35855, -0.6223428, 1, 0, 0, 1, 1,
-0.6605202, -0.4626966, -0.5196705, 1, 0, 0, 1, 1,
-0.6495379, -0.7807917, -2.048549, 1, 0, 0, 1, 1,
-0.6458679, -0.9630548, -3.759799, 1, 0, 0, 1, 1,
-0.6444474, 1.381145, -0.7706207, 1, 0, 0, 1, 1,
-0.6432486, -2.033985, -2.400261, 0, 0, 0, 1, 1,
-0.633482, -0.8664825, -2.115799, 0, 0, 0, 1, 1,
-0.6247508, 0.4291895, -0.8203031, 0, 0, 0, 1, 1,
-0.6176827, -0.6017694, -1.335281, 0, 0, 0, 1, 1,
-0.6142157, 0.4662243, -1.02561, 0, 0, 0, 1, 1,
-0.612537, 1.256927, -1.197525, 0, 0, 0, 1, 1,
-0.6124409, 0.1741024, -1.828276, 0, 0, 0, 1, 1,
-0.6121094, -1.613422, -2.291633, 1, 1, 1, 1, 1,
-0.6056566, 0.3417071, -2.483088, 1, 1, 1, 1, 1,
-0.5985345, 0.2738739, -0.7172878, 1, 1, 1, 1, 1,
-0.59727, 0.2757984, -1.414212, 1, 1, 1, 1, 1,
-0.5931605, 1.451975, -2.382227, 1, 1, 1, 1, 1,
-0.5912053, -0.1652797, -1.927264, 1, 1, 1, 1, 1,
-0.5905172, 0.5956856, -2.465257, 1, 1, 1, 1, 1,
-0.5863115, 0.5490265, -0.02651487, 1, 1, 1, 1, 1,
-0.5838134, -0.07332083, -3.877401, 1, 1, 1, 1, 1,
-0.5827675, -1.281242, -0.8378892, 1, 1, 1, 1, 1,
-0.5791798, -0.3861166, -2.389078, 1, 1, 1, 1, 1,
-0.5672956, 1.03689, -1.318445, 1, 1, 1, 1, 1,
-0.5561562, -0.1281099, -2.560062, 1, 1, 1, 1, 1,
-0.5494205, 0.9196243, -0.7939087, 1, 1, 1, 1, 1,
-0.5485125, 0.1065238, -2.60749, 1, 1, 1, 1, 1,
-0.5370929, 0.1054733, -2.219423, 0, 0, 1, 1, 1,
-0.5369452, -0.1810347, -2.719864, 1, 0, 0, 1, 1,
-0.5364035, 0.5633407, -0.3666389, 1, 0, 0, 1, 1,
-0.5322414, -1.192777, -2.260302, 1, 0, 0, 1, 1,
-0.5313225, -1.15397, -1.584266, 1, 0, 0, 1, 1,
-0.5305802, -0.5807292, -1.636203, 1, 0, 0, 1, 1,
-0.5301386, 0.8900481, -0.0923486, 0, 0, 0, 1, 1,
-0.5287408, -0.6952862, -1.698477, 0, 0, 0, 1, 1,
-0.5267483, -0.1617545, -0.8026052, 0, 0, 0, 1, 1,
-0.5249704, 1.834484, -0.05642064, 0, 0, 0, 1, 1,
-0.5220027, -0.5769788, -0.8969284, 0, 0, 0, 1, 1,
-0.5217415, 1.665862, -1.079418, 0, 0, 0, 1, 1,
-0.5203692, 1.107304, -0.7575546, 0, 0, 0, 1, 1,
-0.5118635, 0.03462941, -3.551468, 1, 1, 1, 1, 1,
-0.5097615, -1.2915, -3.315631, 1, 1, 1, 1, 1,
-0.5090466, -0.472375, -1.190544, 1, 1, 1, 1, 1,
-0.50229, -1.388867, -3.867154, 1, 1, 1, 1, 1,
-0.4982095, -0.6363043, -1.91109, 1, 1, 1, 1, 1,
-0.4973424, -1.505462, -2.439153, 1, 1, 1, 1, 1,
-0.492561, 0.03450367, -1.405348, 1, 1, 1, 1, 1,
-0.4921466, -1.596197, -3.021793, 1, 1, 1, 1, 1,
-0.4908277, 1.361918, -2.25943, 1, 1, 1, 1, 1,
-0.4905284, -0.1718541, -2.37713, 1, 1, 1, 1, 1,
-0.4897915, -0.3600243, -3.170292, 1, 1, 1, 1, 1,
-0.4880149, -0.4236401, -2.281103, 1, 1, 1, 1, 1,
-0.4856063, -0.7622902, -2.293965, 1, 1, 1, 1, 1,
-0.4851511, 0.05920271, -2.279215, 1, 1, 1, 1, 1,
-0.4841892, -1.932382, -4.87784, 1, 1, 1, 1, 1,
-0.4820564, -0.7513464, -3.650319, 0, 0, 1, 1, 1,
-0.4811362, -0.178756, -1.240861, 1, 0, 0, 1, 1,
-0.4714983, 0.1967833, -0.4511353, 1, 0, 0, 1, 1,
-0.4689116, 0.706628, -1.165859, 1, 0, 0, 1, 1,
-0.4648224, -0.6373637, -2.201223, 1, 0, 0, 1, 1,
-0.4643915, -0.9143034, -2.636916, 1, 0, 0, 1, 1,
-0.4630042, -0.3794435, -2.135423, 0, 0, 0, 1, 1,
-0.4563952, 0.249066, -1.017315, 0, 0, 0, 1, 1,
-0.4556625, 0.159489, -1.489855, 0, 0, 0, 1, 1,
-0.4545218, 1.223685, -1.44868, 0, 0, 0, 1, 1,
-0.4531506, -0.6367616, -2.33522, 0, 0, 0, 1, 1,
-0.4491904, -0.2526276, -2.641344, 0, 0, 0, 1, 1,
-0.4455292, 0.7078496, -0.4104271, 0, 0, 0, 1, 1,
-0.4419529, -0.6381353, -2.248228, 1, 1, 1, 1, 1,
-0.4393659, -1.089056, -2.60149, 1, 1, 1, 1, 1,
-0.435052, 1.029979, -2.175011, 1, 1, 1, 1, 1,
-0.4342577, -0.8426811, -3.20079, 1, 1, 1, 1, 1,
-0.4332881, 0.05360638, -1.51208, 1, 1, 1, 1, 1,
-0.4239335, 0.909743, 1.568376, 1, 1, 1, 1, 1,
-0.4194577, 0.3998405, -0.2590793, 1, 1, 1, 1, 1,
-0.4193739, 0.7590829, -0.9056062, 1, 1, 1, 1, 1,
-0.4133177, 0.9614766, -0.4137585, 1, 1, 1, 1, 1,
-0.4130598, -1.053965, -2.99898, 1, 1, 1, 1, 1,
-0.4114377, 1.120003, 0.2855726, 1, 1, 1, 1, 1,
-0.4104776, -0.0680006, -1.461944, 1, 1, 1, 1, 1,
-0.406716, -0.6885925, -3.119005, 1, 1, 1, 1, 1,
-0.4056081, 0.9726356, 0.3635862, 1, 1, 1, 1, 1,
-0.404681, 1.600782, -1.707324, 1, 1, 1, 1, 1,
-0.4024506, 0.4213704, -0.003343159, 0, 0, 1, 1, 1,
-0.4007664, 1.939582, -0.06015747, 1, 0, 0, 1, 1,
-0.3989335, 0.7874078, 1.161703, 1, 0, 0, 1, 1,
-0.395858, 1.281969, -1.364593, 1, 0, 0, 1, 1,
-0.3941792, 0.8547472, -1.382157, 1, 0, 0, 1, 1,
-0.3909225, -1.428075, -3.737474, 1, 0, 0, 1, 1,
-0.3906349, -1.624296, -3.313895, 0, 0, 0, 1, 1,
-0.3867619, -0.5056159, -4.369985, 0, 0, 0, 1, 1,
-0.3790904, -0.06771377, -3.896686, 0, 0, 0, 1, 1,
-0.3720031, 0.4347353, 0.5690913, 0, 0, 0, 1, 1,
-0.3702991, 0.421548, -0.02933459, 0, 0, 0, 1, 1,
-0.370264, 1.433144, 0.1211683, 0, 0, 0, 1, 1,
-0.3695045, 0.1582728, -1.066576, 0, 0, 0, 1, 1,
-0.3682719, -1.537464, -4.641461, 1, 1, 1, 1, 1,
-0.3668362, -1.187275, -3.02063, 1, 1, 1, 1, 1,
-0.3665822, 0.4816181, -1.032092, 1, 1, 1, 1, 1,
-0.3633148, -0.00897282, -3.114518, 1, 1, 1, 1, 1,
-0.3627919, -1.762343, -2.400159, 1, 1, 1, 1, 1,
-0.3627896, 0.4250177, -1.917489, 1, 1, 1, 1, 1,
-0.3618445, 0.9620668, -0.09833814, 1, 1, 1, 1, 1,
-0.3606144, -1.555061, -3.085388, 1, 1, 1, 1, 1,
-0.3579347, 0.7207419, -1.50241, 1, 1, 1, 1, 1,
-0.3568928, -0.4895073, -1.981987, 1, 1, 1, 1, 1,
-0.3481658, -0.4600779, -2.997062, 1, 1, 1, 1, 1,
-0.3456896, 1.090504, -0.7816823, 1, 1, 1, 1, 1,
-0.3456458, 0.01542393, -2.151904, 1, 1, 1, 1, 1,
-0.3417438, -0.2005789, -2.494334, 1, 1, 1, 1, 1,
-0.3413775, 0.4524794, -1.716208, 1, 1, 1, 1, 1,
-0.338669, -0.370466, -2.878085, 0, 0, 1, 1, 1,
-0.337631, -0.6330332, -2.379456, 1, 0, 0, 1, 1,
-0.3320369, 2.389906, -1.587845, 1, 0, 0, 1, 1,
-0.3301728, 0.2878262, 0.2595254, 1, 0, 0, 1, 1,
-0.3269033, -0.08336409, -3.531185, 1, 0, 0, 1, 1,
-0.3269021, 0.2736019, -0.1136816, 1, 0, 0, 1, 1,
-0.3199869, -1.156742, -1.28796, 0, 0, 0, 1, 1,
-0.3139275, 0.0243095, -1.832839, 0, 0, 0, 1, 1,
-0.3122774, -0.1788036, -2.085784, 0, 0, 0, 1, 1,
-0.3107006, -0.322658, -4.274923, 0, 0, 0, 1, 1,
-0.2951572, 0.4849561, 0.6221944, 0, 0, 0, 1, 1,
-0.2921401, 0.2210357, -1.314042, 0, 0, 0, 1, 1,
-0.2915115, -0.2902294, -3.486028, 0, 0, 0, 1, 1,
-0.2900929, 0.3332793, -2.137985, 1, 1, 1, 1, 1,
-0.2868336, 0.5821823, -0.8376295, 1, 1, 1, 1, 1,
-0.2831184, 0.2581987, -1.610578, 1, 1, 1, 1, 1,
-0.2798875, 1.567592, 0.2273916, 1, 1, 1, 1, 1,
-0.2786026, -0.701757, -3.572824, 1, 1, 1, 1, 1,
-0.2762607, -0.04820796, -0.3460017, 1, 1, 1, 1, 1,
-0.2737814, 0.1893668, -0.8537899, 1, 1, 1, 1, 1,
-0.2716862, 1.128395, -0.04941864, 1, 1, 1, 1, 1,
-0.2605917, -0.01160101, -2.550435, 1, 1, 1, 1, 1,
-0.2596237, 0.5349921, -1.691515, 1, 1, 1, 1, 1,
-0.2553925, 0.7074701, 0.5345466, 1, 1, 1, 1, 1,
-0.252319, 0.7457467, -2.815389, 1, 1, 1, 1, 1,
-0.2508185, 0.2408069, 0.2347224, 1, 1, 1, 1, 1,
-0.2466333, -1.210226, -3.806968, 1, 1, 1, 1, 1,
-0.2402632, -0.2402809, -3.037825, 1, 1, 1, 1, 1,
-0.2394874, -3.391109, -3.283989, 0, 0, 1, 1, 1,
-0.237876, 0.8336688, 0.2052224, 1, 0, 0, 1, 1,
-0.2275966, -0.4159306, -1.877049, 1, 0, 0, 1, 1,
-0.2240299, 1.230493, -0.7321905, 1, 0, 0, 1, 1,
-0.2172624, 0.8186958, 0.1873456, 1, 0, 0, 1, 1,
-0.2143925, -1.295575, -1.611157, 1, 0, 0, 1, 1,
-0.2137234, 1.929065, 0.6858481, 0, 0, 0, 1, 1,
-0.2127139, -0.3985224, -3.535256, 0, 0, 0, 1, 1,
-0.2105813, 0.5515617, -0.3942133, 0, 0, 0, 1, 1,
-0.2046391, -0.9933074, -3.052822, 0, 0, 0, 1, 1,
-0.2030887, -0.334629, -2.14833, 0, 0, 0, 1, 1,
-0.1992459, -1.113735, -1.433863, 0, 0, 0, 1, 1,
-0.1977579, 0.4201794, -0.4658836, 0, 0, 0, 1, 1,
-0.1977104, -0.2362566, -2.63532, 1, 1, 1, 1, 1,
-0.1958393, 0.1736406, -1.724519, 1, 1, 1, 1, 1,
-0.1939406, -1.249726, -3.827875, 1, 1, 1, 1, 1,
-0.1931907, -1.536159, -3.52457, 1, 1, 1, 1, 1,
-0.1845734, 0.6847623, 1.177201, 1, 1, 1, 1, 1,
-0.1836246, 1.762905, -0.6094906, 1, 1, 1, 1, 1,
-0.180611, 0.02465464, -2.579018, 1, 1, 1, 1, 1,
-0.1789811, -1.155489, -3.428264, 1, 1, 1, 1, 1,
-0.1783632, 0.3095787, 1.262084, 1, 1, 1, 1, 1,
-0.1742775, -1.692368, -2.3621, 1, 1, 1, 1, 1,
-0.1733174, 0.8776708, -0.3677184, 1, 1, 1, 1, 1,
-0.1711884, 0.4563872, -1.410359, 1, 1, 1, 1, 1,
-0.1687415, -0.04836639, -1.103756, 1, 1, 1, 1, 1,
-0.1681961, -0.8621026, -4.688621, 1, 1, 1, 1, 1,
-0.1664295, -0.9569539, -1.970168, 1, 1, 1, 1, 1,
-0.1646275, 0.04641033, 0.1094921, 0, 0, 1, 1, 1,
-0.1643549, 0.1272314, -1.243169, 1, 0, 0, 1, 1,
-0.1642232, -1.007064, -3.572158, 1, 0, 0, 1, 1,
-0.1630037, 0.1198299, -1.962648, 1, 0, 0, 1, 1,
-0.1555468, -1.095598, -3.538765, 1, 0, 0, 1, 1,
-0.1513613, -0.9636742, -2.959062, 1, 0, 0, 1, 1,
-0.1512783, -0.3044472, -2.792287, 0, 0, 0, 1, 1,
-0.1434518, -0.1554829, -2.224691, 0, 0, 0, 1, 1,
-0.1412457, -0.5912499, -1.424517, 0, 0, 0, 1, 1,
-0.1362823, -0.9078121, -3.481459, 0, 0, 0, 1, 1,
-0.1343236, -1.308516, -2.66986, 0, 0, 0, 1, 1,
-0.1312015, 0.7554201, 0.8724027, 0, 0, 0, 1, 1,
-0.1278022, -1.037569, -2.187942, 0, 0, 0, 1, 1,
-0.1257488, -1.156398, -3.402061, 1, 1, 1, 1, 1,
-0.125367, 0.9800249, 1.253799, 1, 1, 1, 1, 1,
-0.120443, 0.8824178, -0.6890237, 1, 1, 1, 1, 1,
-0.1198588, 0.1348093, 1.000443, 1, 1, 1, 1, 1,
-0.1197531, -0.0009790416, -1.867508, 1, 1, 1, 1, 1,
-0.1156765, 0.2309269, -0.9835413, 1, 1, 1, 1, 1,
-0.1155393, -0.7740781, -3.330898, 1, 1, 1, 1, 1,
-0.114953, 1.346039, -0.1175605, 1, 1, 1, 1, 1,
-0.1144922, 0.4609029, 0.1708477, 1, 1, 1, 1, 1,
-0.1114274, -0.8801087, -3.434332, 1, 1, 1, 1, 1,
-0.1054047, -0.219317, -2.696347, 1, 1, 1, 1, 1,
-0.1053965, 0.4571325, 0.9400318, 1, 1, 1, 1, 1,
-0.104686, 1.588846, -1.509346, 1, 1, 1, 1, 1,
-0.1036125, 1.456834, 1.063169, 1, 1, 1, 1, 1,
-0.09875273, 0.4345544, -0.1465839, 1, 1, 1, 1, 1,
-0.08693194, 0.3204876, -1.608978, 0, 0, 1, 1, 1,
-0.08519711, 1.085758, -0.5401553, 1, 0, 0, 1, 1,
-0.08454854, -1.454639, -4.80014, 1, 0, 0, 1, 1,
-0.08433437, 0.4507255, -1.107728, 1, 0, 0, 1, 1,
-0.08388325, 0.1926563, 1.422611, 1, 0, 0, 1, 1,
-0.0813106, -0.2450291, -1.304996, 1, 0, 0, 1, 1,
-0.08071657, 0.4320376, -0.4338752, 0, 0, 0, 1, 1,
-0.07377962, 0.2167863, 0.1373412, 0, 0, 0, 1, 1,
-0.07287119, 0.1640792, 1.206146, 0, 0, 0, 1, 1,
-0.0645036, 2.206091, 0.05516456, 0, 0, 0, 1, 1,
-0.06185094, 0.3675949, 0.4637623, 0, 0, 0, 1, 1,
-0.05622875, 0.5504154, 0.4273968, 0, 0, 0, 1, 1,
-0.05038939, 0.1434731, 0.3679744, 0, 0, 0, 1, 1,
-0.04902099, -1.114777, -1.646416, 1, 1, 1, 1, 1,
-0.04872121, -1.227231, -5.311729, 1, 1, 1, 1, 1,
-0.04520969, -0.99728, -2.747991, 1, 1, 1, 1, 1,
-0.04065883, 0.1587084, 0.655165, 1, 1, 1, 1, 1,
-0.03870308, -0.7272386, -3.175707, 1, 1, 1, 1, 1,
-0.03737095, 0.4619404, -0.6442969, 1, 1, 1, 1, 1,
-0.03684943, 0.2426182, 1.77505, 1, 1, 1, 1, 1,
-0.03305507, -0.7644026, -3.089211, 1, 1, 1, 1, 1,
-0.03208384, -1.687853, -2.253981, 1, 1, 1, 1, 1,
-0.03187594, 0.1895775, -1.268972, 1, 1, 1, 1, 1,
-0.02484731, -0.5256788, -4.926367, 1, 1, 1, 1, 1,
-0.02288988, -0.6446536, -2.036326, 1, 1, 1, 1, 1,
-0.01979104, -0.5415995, -3.834838, 1, 1, 1, 1, 1,
-0.0193523, -0.2976359, -3.619162, 1, 1, 1, 1, 1,
-0.01621561, 0.8510255, -0.4942234, 1, 1, 1, 1, 1,
-0.01556676, -0.345234, -2.889303, 0, 0, 1, 1, 1,
-0.01018285, 0.01532655, -2.082709, 1, 0, 0, 1, 1,
-0.008849725, 0.0346411, -0.3843964, 1, 0, 0, 1, 1,
-0.007139816, -0.2990113, -2.932873, 1, 0, 0, 1, 1,
-0.005237857, 0.7787955, -1.004755, 1, 0, 0, 1, 1,
-0.003043364, -0.7371331, -3.108229, 1, 0, 0, 1, 1,
-0.001909123, 0.03118143, -1.67336, 0, 0, 0, 1, 1,
-0.001238947, -0.920395, -3.738031, 0, 0, 0, 1, 1,
0.0008606384, -0.4885657, 4.106125, 0, 0, 0, 1, 1,
0.002527594, -1.044726, 5.157968, 0, 0, 0, 1, 1,
0.003088076, 0.8438697, 0.2799371, 0, 0, 0, 1, 1,
0.0108241, -0.1510503, 2.525723, 0, 0, 0, 1, 1,
0.01098385, 1.672193, 0.3330814, 0, 0, 0, 1, 1,
0.01142388, -2.003336, 2.60047, 1, 1, 1, 1, 1,
0.0136899, 0.7951267, 1.080461, 1, 1, 1, 1, 1,
0.0139634, -0.8575187, 3.66816, 1, 1, 1, 1, 1,
0.01579095, 0.1944985, 0.7156103, 1, 1, 1, 1, 1,
0.02302205, -0.2253603, 0.9258879, 1, 1, 1, 1, 1,
0.02313378, -0.6737062, 2.51077, 1, 1, 1, 1, 1,
0.02880214, 1.752232, 0.6909939, 1, 1, 1, 1, 1,
0.03618062, -0.5572855, 2.381594, 1, 1, 1, 1, 1,
0.03877186, 0.7077589, 0.7728011, 1, 1, 1, 1, 1,
0.03890266, -0.5375445, 3.526204, 1, 1, 1, 1, 1,
0.03989952, 0.3035064, 0.7748174, 1, 1, 1, 1, 1,
0.044393, -1.407308, 2.350708, 1, 1, 1, 1, 1,
0.04490986, -0.9005259, 4.167502, 1, 1, 1, 1, 1,
0.04641539, 0.3475533, -0.2258499, 1, 1, 1, 1, 1,
0.04737936, -0.631696, 2.672464, 1, 1, 1, 1, 1,
0.05064594, -0.05071786, 1.719717, 0, 0, 1, 1, 1,
0.05080963, 0.6968467, -1.539336, 1, 0, 0, 1, 1,
0.06075258, 1.431455, -1.014231, 1, 0, 0, 1, 1,
0.06147752, 0.2905523, -0.9341762, 1, 0, 0, 1, 1,
0.06342273, -0.08906428, 1.719276, 1, 0, 0, 1, 1,
0.0668396, -2.236433, 2.439134, 1, 0, 0, 1, 1,
0.06737015, -1.036668, 3.275519, 0, 0, 0, 1, 1,
0.06747758, -0.1216396, 1.642236, 0, 0, 0, 1, 1,
0.06878042, -1.285597, 3.079458, 0, 0, 0, 1, 1,
0.07122669, 0.7553683, -0.4047472, 0, 0, 0, 1, 1,
0.0721649, 0.1178185, 1.690999, 0, 0, 0, 1, 1,
0.07804657, -0.4156331, 2.766618, 0, 0, 0, 1, 1,
0.07834436, -0.938116, 2.989044, 0, 0, 0, 1, 1,
0.0856599, -0.8688284, 3.487584, 1, 1, 1, 1, 1,
0.08992323, -1.536108, 3.033226, 1, 1, 1, 1, 1,
0.09008379, 1.240702, 1.149423, 1, 1, 1, 1, 1,
0.09203354, -1.161874, 3.835075, 1, 1, 1, 1, 1,
0.09815563, -0.8335101, 3.281009, 1, 1, 1, 1, 1,
0.100162, 0.8249974, 2.522787, 1, 1, 1, 1, 1,
0.1019306, 1.605972, -0.7833079, 1, 1, 1, 1, 1,
0.1028392, -0.04746905, 2.424237, 1, 1, 1, 1, 1,
0.1029609, 0.2453882, -2.87827, 1, 1, 1, 1, 1,
0.1058188, 0.5831246, -0.4917514, 1, 1, 1, 1, 1,
0.1089053, -1.696077, 3.127811, 1, 1, 1, 1, 1,
0.1112353, -1.00256, 3.027673, 1, 1, 1, 1, 1,
0.1117267, 1.816161, 0.1831199, 1, 1, 1, 1, 1,
0.1129302, 1.230676, -0.006009048, 1, 1, 1, 1, 1,
0.115677, -0.3818983, 2.619417, 1, 1, 1, 1, 1,
0.1168911, 0.2282185, 1.570584, 0, 0, 1, 1, 1,
0.1186924, -1.678346, 4.533066, 1, 0, 0, 1, 1,
0.1297601, 0.3333245, 0.1189071, 1, 0, 0, 1, 1,
0.1309454, 0.8127278, 0.9235678, 1, 0, 0, 1, 1,
0.1350531, 0.650776, 0.1516398, 1, 0, 0, 1, 1,
0.1353177, -0.1269865, 3.054616, 1, 0, 0, 1, 1,
0.1361805, -0.9313144, 3.472396, 0, 0, 0, 1, 1,
0.1375426, 0.4197859, -0.4988851, 0, 0, 0, 1, 1,
0.1379748, -1.848928, 2.811662, 0, 0, 0, 1, 1,
0.1401567, -2.076086, 3.253972, 0, 0, 0, 1, 1,
0.1431229, 0.4869604, -0.5878978, 0, 0, 0, 1, 1,
0.144371, -0.3315581, 1.56995, 0, 0, 0, 1, 1,
0.144494, -0.05804534, 1.568816, 0, 0, 0, 1, 1,
0.1467082, 1.78136, 0.07646765, 1, 1, 1, 1, 1,
0.1487002, 0.2745184, 0.2285224, 1, 1, 1, 1, 1,
0.1515915, 0.1371472, 2.159965, 1, 1, 1, 1, 1,
0.1535449, 0.5277803, 1.380174, 1, 1, 1, 1, 1,
0.1599442, -0.08087979, 2.702494, 1, 1, 1, 1, 1,
0.1653078, 0.6067344, -1.001549, 1, 1, 1, 1, 1,
0.1662965, -0.03226992, 2.503544, 1, 1, 1, 1, 1,
0.1677031, -2.025489, 1.750113, 1, 1, 1, 1, 1,
0.1695146, -0.3259061, 1.309436, 1, 1, 1, 1, 1,
0.1702055, -0.3226458, 2.773247, 1, 1, 1, 1, 1,
0.1745132, 0.1030075, 0.1902529, 1, 1, 1, 1, 1,
0.1746667, 0.7393775, -0.1903423, 1, 1, 1, 1, 1,
0.1754713, 0.7130631, 1.199915, 1, 1, 1, 1, 1,
0.1811772, 0.6590235, 1.352894, 1, 1, 1, 1, 1,
0.1820243, 0.7520672, 0.2894669, 1, 1, 1, 1, 1,
0.1881866, 0.2593545, -0.249402, 0, 0, 1, 1, 1,
0.1923228, 0.7424178, 0.8537838, 1, 0, 0, 1, 1,
0.1951573, -1.323557, 3.439451, 1, 0, 0, 1, 1,
0.1958464, -1.251056, 4.015603, 1, 0, 0, 1, 1,
0.1980279, -0.1052127, 0.299104, 1, 0, 0, 1, 1,
0.2006215, 0.254911, 0.6823024, 1, 0, 0, 1, 1,
0.2030379, -0.04711547, 3.222357, 0, 0, 0, 1, 1,
0.2039, -0.008183224, 3.015668, 0, 0, 0, 1, 1,
0.206427, -1.101003, 1.973026, 0, 0, 0, 1, 1,
0.2080251, 0.08412753, 1.435684, 0, 0, 0, 1, 1,
0.2193491, 0.1599783, 3.453327, 0, 0, 0, 1, 1,
0.2212135, -2.796735, 3.801879, 0, 0, 0, 1, 1,
0.2236172, -1.015035, 3.161435, 0, 0, 0, 1, 1,
0.2243809, 0.5603888, 1.259539, 1, 1, 1, 1, 1,
0.2248293, 0.1744225, 2.373939, 1, 1, 1, 1, 1,
0.2249915, -1.807236, 3.51333, 1, 1, 1, 1, 1,
0.2257799, -1.753663, 2.379984, 1, 1, 1, 1, 1,
0.2274344, -0.9632128, 3.213972, 1, 1, 1, 1, 1,
0.2296491, 0.7116098, -0.2576722, 1, 1, 1, 1, 1,
0.2301865, -0.7909796, 2.681263, 1, 1, 1, 1, 1,
0.2343998, 0.8990597, 1.572155, 1, 1, 1, 1, 1,
0.234443, 1.339599, -0.7133767, 1, 1, 1, 1, 1,
0.2363588, 0.8710777, 0.1064074, 1, 1, 1, 1, 1,
0.2381549, 0.9278244, -0.1982775, 1, 1, 1, 1, 1,
0.2409663, -2.141929, 4.247198, 1, 1, 1, 1, 1,
0.2432248, -0.8495736, 2.598379, 1, 1, 1, 1, 1,
0.2525597, 0.2837079, 1.846924, 1, 1, 1, 1, 1,
0.2576011, 1.210743, 0.7908556, 1, 1, 1, 1, 1,
0.2584193, -0.09979883, 3.122888, 0, 0, 1, 1, 1,
0.2637576, 0.6406451, -0.4236059, 1, 0, 0, 1, 1,
0.2686364, 0.5342858, 0.8016843, 1, 0, 0, 1, 1,
0.2796654, -0.3708821, 3.758129, 1, 0, 0, 1, 1,
0.2812944, 0.4797674, 1.218141, 1, 0, 0, 1, 1,
0.286294, 1.509892, 0.3380467, 1, 0, 0, 1, 1,
0.2872145, -0.5879864, 2.125122, 0, 0, 0, 1, 1,
0.2876432, 0.397287, 0.1541435, 0, 0, 0, 1, 1,
0.2938771, 0.9373561, 0.4792648, 0, 0, 0, 1, 1,
0.2951985, 1.602429, -0.6196259, 0, 0, 0, 1, 1,
0.2965232, -0.258343, 1.310901, 0, 0, 0, 1, 1,
0.3075773, -0.2171699, 3.954566, 0, 0, 0, 1, 1,
0.3080795, -0.8909207, 3.377517, 0, 0, 0, 1, 1,
0.3118021, -1.387273, 3.035777, 1, 1, 1, 1, 1,
0.3142745, -1.967082, 3.581824, 1, 1, 1, 1, 1,
0.3152282, -1.655871, 2.938308, 1, 1, 1, 1, 1,
0.3153233, -0.3090109, 3.524923, 1, 1, 1, 1, 1,
0.3178966, 1.587235, 0.5212491, 1, 1, 1, 1, 1,
0.3203659, 0.1762365, 1.37017, 1, 1, 1, 1, 1,
0.3256221, 1.356625, 1.061225, 1, 1, 1, 1, 1,
0.3307803, -1.203725, 0.8549032, 1, 1, 1, 1, 1,
0.3310914, -2.097638, 2.853966, 1, 1, 1, 1, 1,
0.3314028, -1.001228, 3.164205, 1, 1, 1, 1, 1,
0.3375525, 0.3327702, 0.1077587, 1, 1, 1, 1, 1,
0.3381109, 0.3550481, 0.2289555, 1, 1, 1, 1, 1,
0.3390353, -0.6352528, 1.972662, 1, 1, 1, 1, 1,
0.3401825, 1.063811, -1.101182, 1, 1, 1, 1, 1,
0.3407142, 1.128526, -1.287878, 1, 1, 1, 1, 1,
0.3443485, -1.159798, 3.235045, 0, 0, 1, 1, 1,
0.3451377, -0.4956019, 1.678831, 1, 0, 0, 1, 1,
0.3465835, 1.326682, 1.029905, 1, 0, 0, 1, 1,
0.3479925, -0.6842092, 1.265032, 1, 0, 0, 1, 1,
0.3482763, -1.076725, 2.988088, 1, 0, 0, 1, 1,
0.348311, 0.2127862, 3.103583, 1, 0, 0, 1, 1,
0.357058, 1.477751, 1.492284, 0, 0, 0, 1, 1,
0.3587426, -0.6578732, 3.915643, 0, 0, 0, 1, 1,
0.362056, 0.434013, 0.4706124, 0, 0, 0, 1, 1,
0.3625349, -1.040861, 2.932404, 0, 0, 0, 1, 1,
0.3634819, -2.458508, 3.830071, 0, 0, 0, 1, 1,
0.3663923, 0.1794088, 1.337072, 0, 0, 0, 1, 1,
0.3674944, 0.3548148, 2.342649, 0, 0, 0, 1, 1,
0.3686429, -1.056244, 1.508221, 1, 1, 1, 1, 1,
0.3707134, 0.1378572, -0.05665863, 1, 1, 1, 1, 1,
0.3714794, -1.025505, 2.963105, 1, 1, 1, 1, 1,
0.3727708, 0.4255692, 0.3589499, 1, 1, 1, 1, 1,
0.3733203, 1.274612, 2.086881, 1, 1, 1, 1, 1,
0.3784682, -0.8515923, 1.72511, 1, 1, 1, 1, 1,
0.3800565, -0.2808862, 1.409047, 1, 1, 1, 1, 1,
0.3807339, 0.07396723, 1.449086, 1, 1, 1, 1, 1,
0.3813872, -1.908871, 2.133777, 1, 1, 1, 1, 1,
0.3823434, 1.50193, -0.8606667, 1, 1, 1, 1, 1,
0.3826776, 2.231193, 0.419379, 1, 1, 1, 1, 1,
0.3916871, 0.2200684, 0.4018664, 1, 1, 1, 1, 1,
0.3972689, 1.414607, 1.628785, 1, 1, 1, 1, 1,
0.3974602, -0.009985446, 1.789922, 1, 1, 1, 1, 1,
0.3976791, -0.5870188, 1.934626, 1, 1, 1, 1, 1,
0.4036966, -0.7230874, 3.101228, 0, 0, 1, 1, 1,
0.4074994, -0.8737306, 3.086993, 1, 0, 0, 1, 1,
0.4098566, -0.5502011, 2.49748, 1, 0, 0, 1, 1,
0.4103335, -0.4075895, 1.718633, 1, 0, 0, 1, 1,
0.4113332, -0.4120739, 3.903798, 1, 0, 0, 1, 1,
0.4185542, -0.8437126, 5.633924, 1, 0, 0, 1, 1,
0.4201281, -0.9124317, 3.899135, 0, 0, 0, 1, 1,
0.4205737, 0.2234361, 0.8883832, 0, 0, 0, 1, 1,
0.4235359, 2.314474, -1.239504, 0, 0, 0, 1, 1,
0.4245043, 1.681926, -0.8129101, 0, 0, 0, 1, 1,
0.4248219, 0.1565863, 0.2744411, 0, 0, 0, 1, 1,
0.4301632, -0.07041577, 1.736724, 0, 0, 0, 1, 1,
0.4334626, -1.529855, 2.744425, 0, 0, 0, 1, 1,
0.4350301, -0.4486627, 3.078509, 1, 1, 1, 1, 1,
0.4369234, -0.7934385, 1.153008, 1, 1, 1, 1, 1,
0.4404972, -0.3297828, 1.728679, 1, 1, 1, 1, 1,
0.4424177, 0.1660784, 0.1503212, 1, 1, 1, 1, 1,
0.4432248, 1.397432, -1.430699, 1, 1, 1, 1, 1,
0.4476248, -0.570962, 2.90636, 1, 1, 1, 1, 1,
0.449286, 0.3807291, 0.4985513, 1, 1, 1, 1, 1,
0.4498073, 0.04260844, 1.188544, 1, 1, 1, 1, 1,
0.4517054, 1.77393, 1.451753, 1, 1, 1, 1, 1,
0.4519677, -0.2648102, 0.9405345, 1, 1, 1, 1, 1,
0.4542696, 0.01586048, -0.9278134, 1, 1, 1, 1, 1,
0.454365, 1.025259, -1.500956, 1, 1, 1, 1, 1,
0.4589975, -0.6875142, 1.701278, 1, 1, 1, 1, 1,
0.460839, 0.2644225, 0.7515545, 1, 1, 1, 1, 1,
0.4620031, 0.8949689, -0.3337167, 1, 1, 1, 1, 1,
0.4693904, -0.9929655, 3.137748, 0, 0, 1, 1, 1,
0.4695995, -0.05738591, 1.450594, 1, 0, 0, 1, 1,
0.4790667, 0.6598676, 1.370079, 1, 0, 0, 1, 1,
0.4826323, 0.05602689, 1.117399, 1, 0, 0, 1, 1,
0.4853906, 0.7381927, 0.5599654, 1, 0, 0, 1, 1,
0.490062, -1.464279, 2.173231, 1, 0, 0, 1, 1,
0.4912968, -0.687378, 1.085515, 0, 0, 0, 1, 1,
0.4929157, 0.2479769, 0.190077, 0, 0, 0, 1, 1,
0.4930171, -0.6610079, 2.907879, 0, 0, 0, 1, 1,
0.4958149, -0.3822606, 2.373417, 0, 0, 0, 1, 1,
0.4972137, 0.6404111, 0.07654327, 0, 0, 0, 1, 1,
0.497846, 0.7065296, 1.339343, 0, 0, 0, 1, 1,
0.503598, 0.3457694, 2.132187, 0, 0, 0, 1, 1,
0.507816, 0.3825941, 0.3447386, 1, 1, 1, 1, 1,
0.5101496, -0.4479155, 1.618605, 1, 1, 1, 1, 1,
0.5106378, 1.143615, 0.6884894, 1, 1, 1, 1, 1,
0.5158442, -0.5348868, 1.355676, 1, 1, 1, 1, 1,
0.5161906, 0.495614, 1.784731, 1, 1, 1, 1, 1,
0.5190842, -0.04077155, 0.401183, 1, 1, 1, 1, 1,
0.5228335, 0.02592231, 2.620663, 1, 1, 1, 1, 1,
0.5292107, 1.177304, -0.6367021, 1, 1, 1, 1, 1,
0.52937, 1.267643, -1.638898, 1, 1, 1, 1, 1,
0.5308142, -2.917354, 3.295144, 1, 1, 1, 1, 1,
0.5352741, -0.06952555, 2.489392, 1, 1, 1, 1, 1,
0.5371142, 0.1813312, 2.415003, 1, 1, 1, 1, 1,
0.55031, -0.6555548, 1.730015, 1, 1, 1, 1, 1,
0.5525575, -0.6599742, 0.9923368, 1, 1, 1, 1, 1,
0.5615174, 0.8220048, 0.5778771, 1, 1, 1, 1, 1,
0.5622965, 0.6179003, 0.122157, 0, 0, 1, 1, 1,
0.5632548, -0.3614762, 0.9681689, 1, 0, 0, 1, 1,
0.5665285, 0.8397933, 0.4602985, 1, 0, 0, 1, 1,
0.5670613, 0.9216391, 0.0842233, 1, 0, 0, 1, 1,
0.5710158, -0.4185454, 2.5124, 1, 0, 0, 1, 1,
0.5772405, -0.5649675, 2.23617, 1, 0, 0, 1, 1,
0.5829917, 1.709423, 1.652833, 0, 0, 0, 1, 1,
0.5900377, 0.1350219, 2.3796, 0, 0, 0, 1, 1,
0.5928087, 1.136219, -0.5147036, 0, 0, 0, 1, 1,
0.593412, 0.1118279, 0.7345214, 0, 0, 0, 1, 1,
0.5948263, 0.3832065, 0.7662303, 0, 0, 0, 1, 1,
0.5979798, 1.237686, 0.1591955, 0, 0, 0, 1, 1,
0.598287, -0.03110807, 1.935101, 0, 0, 0, 1, 1,
0.5997646, -0.2790211, 1.934126, 1, 1, 1, 1, 1,
0.6047089, 0.8512954, 1.28341, 1, 1, 1, 1, 1,
0.6055865, 0.7137422, 1.375403, 1, 1, 1, 1, 1,
0.6094023, 0.6644447, 0.6709898, 1, 1, 1, 1, 1,
0.6098532, -1.00199, 3.130742, 1, 1, 1, 1, 1,
0.6107563, 0.5942594, 2.931939, 1, 1, 1, 1, 1,
0.6190027, -1.678955, 2.661096, 1, 1, 1, 1, 1,
0.6193833, 0.2106412, 0.9199256, 1, 1, 1, 1, 1,
0.6328204, -0.1993897, 2.445425, 1, 1, 1, 1, 1,
0.6379974, -0.8234839, 2.351574, 1, 1, 1, 1, 1,
0.6592848, -1.206827, 1.895963, 1, 1, 1, 1, 1,
0.6648204, 0.08003663, 1.361669, 1, 1, 1, 1, 1,
0.6656838, -0.8110311, 1.503305, 1, 1, 1, 1, 1,
0.6701415, 1.047502, 1.668393, 1, 1, 1, 1, 1,
0.6788934, 1.27459, 2.126466, 1, 1, 1, 1, 1,
0.6793498, 0.5048646, -0.1105863, 0, 0, 1, 1, 1,
0.6835858, -0.564102, 0.4741894, 1, 0, 0, 1, 1,
0.6884242, 0.2794388, 0.9285396, 1, 0, 0, 1, 1,
0.6894681, 0.9114746, 1.069039, 1, 0, 0, 1, 1,
0.6964397, -2.767818, 2.830082, 1, 0, 0, 1, 1,
0.6995897, -1.009778, 3.617293, 1, 0, 0, 1, 1,
0.7002831, -1.250166, 1.953077, 0, 0, 0, 1, 1,
0.7016944, -0.2884967, 2.020313, 0, 0, 0, 1, 1,
0.7062917, 0.3438565, 0.4272085, 0, 0, 0, 1, 1,
0.7097118, 1.520038, 0.4729404, 0, 0, 0, 1, 1,
0.7098535, 0.261455, -1.173563, 0, 0, 0, 1, 1,
0.7169752, 0.09210262, 1.23876, 0, 0, 0, 1, 1,
0.7174797, -0.8797138, 1.875782, 0, 0, 0, 1, 1,
0.7208206, -0.1456282, 2.080101, 1, 1, 1, 1, 1,
0.7267271, 0.7269991, 1.47811, 1, 1, 1, 1, 1,
0.7293067, -0.1123931, 3.079026, 1, 1, 1, 1, 1,
0.7293211, 1.387571, 0.05970954, 1, 1, 1, 1, 1,
0.7341306, 1.278404, 0.07812762, 1, 1, 1, 1, 1,
0.7390793, -1.031008, 4.478158, 1, 1, 1, 1, 1,
0.7455384, -1.08823, 1.04849, 1, 1, 1, 1, 1,
0.7481485, -0.07419558, 1.639122, 1, 1, 1, 1, 1,
0.7487946, -1.84693, 0.9408493, 1, 1, 1, 1, 1,
0.752086, -1.250914, 3.797011, 1, 1, 1, 1, 1,
0.7528526, -0.6329353, 2.073934, 1, 1, 1, 1, 1,
0.7535538, -0.9724056, 2.3862, 1, 1, 1, 1, 1,
0.7539693, -0.9390929, 1.515925, 1, 1, 1, 1, 1,
0.7583922, 0.3885891, 0.1573868, 1, 1, 1, 1, 1,
0.7597519, 0.6959094, 0.4457318, 1, 1, 1, 1, 1,
0.7706996, -0.4617358, 2.861912, 0, 0, 1, 1, 1,
0.7755483, -0.2006397, 1.557671, 1, 0, 0, 1, 1,
0.7763041, -0.995648, 3.34369, 1, 0, 0, 1, 1,
0.7787045, 0.430701, 0.8829454, 1, 0, 0, 1, 1,
0.7787083, 0.9851171, 1.879934, 1, 0, 0, 1, 1,
0.7828004, -0.6874298, 2.533979, 1, 0, 0, 1, 1,
0.7878428, -0.191575, 2.754962, 0, 0, 0, 1, 1,
0.7895994, 1.616287, 1.234358, 0, 0, 0, 1, 1,
0.7903972, -1.812416, 3.702805, 0, 0, 0, 1, 1,
0.7955257, -0.188967, 1.128571, 0, 0, 0, 1, 1,
0.7988076, 0.5475201, 2.61663, 0, 0, 0, 1, 1,
0.7989251, -0.2361076, 2.540645, 0, 0, 0, 1, 1,
0.8021901, 0.7905775, 1.094252, 0, 0, 0, 1, 1,
0.8069652, -0.226407, 0.2939104, 1, 1, 1, 1, 1,
0.8073411, -0.6044126, 1.055175, 1, 1, 1, 1, 1,
0.8159317, 2.19645, 1.455637, 1, 1, 1, 1, 1,
0.8214677, 0.4402638, -1.845934, 1, 1, 1, 1, 1,
0.8248358, -0.3659999, 1.48048, 1, 1, 1, 1, 1,
0.8277465, -0.4126543, 2.949909, 1, 1, 1, 1, 1,
0.8347379, -1.103054, 1.965779, 1, 1, 1, 1, 1,
0.8387511, -0.5188958, 3.489199, 1, 1, 1, 1, 1,
0.8464421, -0.3747202, 2.558613, 1, 1, 1, 1, 1,
0.8473583, 0.2578569, 1.163288, 1, 1, 1, 1, 1,
0.8507339, 1.283558, 0.4463194, 1, 1, 1, 1, 1,
0.8569111, -0.1320629, 1.764389, 1, 1, 1, 1, 1,
0.8682951, -0.2356207, 2.624462, 1, 1, 1, 1, 1,
0.8744892, 0.9911458, 0.5906753, 1, 1, 1, 1, 1,
0.8751338, 0.08545866, 2.573763, 1, 1, 1, 1, 1,
0.8760142, -0.5495011, -0.2375127, 0, 0, 1, 1, 1,
0.8792125, 1.176204, -0.1708816, 1, 0, 0, 1, 1,
0.8806876, 0.7055694, 1.848348, 1, 0, 0, 1, 1,
0.8814501, -1.658829, 2.938381, 1, 0, 0, 1, 1,
0.8890803, 0.9140753, -0.4368437, 1, 0, 0, 1, 1,
0.889883, 1.045288, 1.873571, 1, 0, 0, 1, 1,
0.8926676, -1.100003, 2.813535, 0, 0, 0, 1, 1,
0.8929546, 1.095709, 1.25468, 0, 0, 0, 1, 1,
0.9014603, -0.166011, 1.612004, 0, 0, 0, 1, 1,
0.907954, 1.298522, 1.975758, 0, 0, 0, 1, 1,
0.9088201, 1.250011, -0.696322, 0, 0, 0, 1, 1,
0.9167907, 1.036404, -1.125636, 0, 0, 0, 1, 1,
0.9293639, -1.558294, 2.507828, 0, 0, 0, 1, 1,
0.9318106, 0.1926361, -0.3500646, 1, 1, 1, 1, 1,
0.9392922, 0.3109473, 2.512087, 1, 1, 1, 1, 1,
0.9442848, -1.082951, 3.64065, 1, 1, 1, 1, 1,
0.9554811, 1.524676, 0.2827763, 1, 1, 1, 1, 1,
0.9608142, -0.8954501, 1.979048, 1, 1, 1, 1, 1,
0.9615413, 1.554536, 2.392316, 1, 1, 1, 1, 1,
0.9626002, -0.7421548, 0.3667974, 1, 1, 1, 1, 1,
0.9658952, -0.1096643, 2.259512, 1, 1, 1, 1, 1,
0.9666095, -1.624528, 2.984483, 1, 1, 1, 1, 1,
0.9677883, -0.1453107, 2.49855, 1, 1, 1, 1, 1,
0.96962, 1.331874, 1.46979, 1, 1, 1, 1, 1,
0.9699968, 1.766247, 0.8671436, 1, 1, 1, 1, 1,
0.9727243, -1.083077, 1.698783, 1, 1, 1, 1, 1,
0.996396, -0.2736261, 1.524987, 1, 1, 1, 1, 1,
0.9966007, -0.1841003, 1.327339, 1, 1, 1, 1, 1,
0.9991287, -1.346368, 2.369104, 0, 0, 1, 1, 1,
0.9993805, -0.4195246, 1.915512, 1, 0, 0, 1, 1,
1.006281, 0.1373495, 1.277818, 1, 0, 0, 1, 1,
1.010288, -0.8324867, 0.2620974, 1, 0, 0, 1, 1,
1.012789, 1.107043, 0.07319214, 1, 0, 0, 1, 1,
1.027025, -0.1241506, 3.685268, 1, 0, 0, 1, 1,
1.029052, -0.455194, 0.6608662, 0, 0, 0, 1, 1,
1.03131, -1.724527, 2.515832, 0, 0, 0, 1, 1,
1.033903, 0.6151352, 2.12943, 0, 0, 0, 1, 1,
1.038033, 1.344266, -0.5513827, 0, 0, 0, 1, 1,
1.038842, -0.3204426, 1.889055, 0, 0, 0, 1, 1,
1.042015, 1.157953, 1.400199, 0, 0, 0, 1, 1,
1.043408, 0.5590926, 1.128681, 0, 0, 0, 1, 1,
1.051892, 0.4618745, 0.5759282, 1, 1, 1, 1, 1,
1.06053, -0.1223852, 1.261934, 1, 1, 1, 1, 1,
1.061609, 0.7376128, 1.939346, 1, 1, 1, 1, 1,
1.063302, -2.643851, 1.78418, 1, 1, 1, 1, 1,
1.064577, -0.5824173, 1.117148, 1, 1, 1, 1, 1,
1.070251, 0.5104564, 0.4640942, 1, 1, 1, 1, 1,
1.07077, -0.8409123, 2.642938, 1, 1, 1, 1, 1,
1.076275, 0.2538238, 1.889843, 1, 1, 1, 1, 1,
1.076378, -1.608658, 2.301136, 1, 1, 1, 1, 1,
1.078046, -0.9856624, 1.791777, 1, 1, 1, 1, 1,
1.080231, 0.5252514, -0.6337962, 1, 1, 1, 1, 1,
1.084265, 0.7068563, 0.08594734, 1, 1, 1, 1, 1,
1.085158, -0.4296664, 1.240816, 1, 1, 1, 1, 1,
1.089634, -0.00376008, 1.025962, 1, 1, 1, 1, 1,
1.096087, 0.7309645, 1.327155, 1, 1, 1, 1, 1,
1.104058, -0.1014112, 0.7601588, 0, 0, 1, 1, 1,
1.104474, 1.139741, 1.376789, 1, 0, 0, 1, 1,
1.104685, 1.812032, 1.251266, 1, 0, 0, 1, 1,
1.105173, 1.692508, 0.6625438, 1, 0, 0, 1, 1,
1.108569, 0.8562876, 0.8041397, 1, 0, 0, 1, 1,
1.112611, 1.729018, -0.698095, 1, 0, 0, 1, 1,
1.116058, -1.49633, 1.752696, 0, 0, 0, 1, 1,
1.122505, 1.584127, -0.2415683, 0, 0, 0, 1, 1,
1.131589, -0.03825168, 1.334299, 0, 0, 0, 1, 1,
1.13519, 0.1686049, 1.159792, 0, 0, 0, 1, 1,
1.137613, 0.828378, 0.8110885, 0, 0, 0, 1, 1,
1.137791, -0.7235337, 0.523579, 0, 0, 0, 1, 1,
1.138991, -0.386484, 1.162325, 0, 0, 0, 1, 1,
1.144182, 0.2688536, 2.114927, 1, 1, 1, 1, 1,
1.1533, -0.259581, 2.527365, 1, 1, 1, 1, 1,
1.166773, -0.1279294, 3.148767, 1, 1, 1, 1, 1,
1.170412, -1.755605, 2.39281, 1, 1, 1, 1, 1,
1.175431, -0.4251425, 1.313826, 1, 1, 1, 1, 1,
1.181528, -1.133804, 2.218169, 1, 1, 1, 1, 1,
1.184401, -2.187982, 2.524826, 1, 1, 1, 1, 1,
1.186363, 0.4416489, 0.04233714, 1, 1, 1, 1, 1,
1.210852, -0.1573198, 1.406208, 1, 1, 1, 1, 1,
1.211581, 0.3290192, 1.735382, 1, 1, 1, 1, 1,
1.211708, 0.9257312, 0.180359, 1, 1, 1, 1, 1,
1.216405, -0.211545, 3.090724, 1, 1, 1, 1, 1,
1.218774, -0.07643187, 1.574484, 1, 1, 1, 1, 1,
1.228421, -2.522533, 3.447209, 1, 1, 1, 1, 1,
1.231474, 1.298422, 2.046854, 1, 1, 1, 1, 1,
1.232961, -0.4950148, 2.488528, 0, 0, 1, 1, 1,
1.237177, -0.5727107, 3.418935, 1, 0, 0, 1, 1,
1.23793, -0.8664121, 2.269202, 1, 0, 0, 1, 1,
1.244488, -1.474765, 2.329484, 1, 0, 0, 1, 1,
1.255926, 0.7894801, 1.819949, 1, 0, 0, 1, 1,
1.259113, -0.3479, 4.075634, 1, 0, 0, 1, 1,
1.259923, -0.4360949, 0.6568479, 0, 0, 0, 1, 1,
1.260793, 0.3293952, 1.488844, 0, 0, 0, 1, 1,
1.261255, -0.6290816, 1.380348, 0, 0, 0, 1, 1,
1.267434, -0.4618145, 3.230349, 0, 0, 0, 1, 1,
1.270707, 0.9353008, -0.6437749, 0, 0, 0, 1, 1,
1.274384, 2.300195, 2.893786, 0, 0, 0, 1, 1,
1.281406, -1.132392, 1.815988, 0, 0, 0, 1, 1,
1.282119, 1.058537, 0.5079116, 1, 1, 1, 1, 1,
1.313894, -0.7678543, 1.230702, 1, 1, 1, 1, 1,
1.317975, 1.393054, 0.3960406, 1, 1, 1, 1, 1,
1.325468, 1.064404, -0.9394929, 1, 1, 1, 1, 1,
1.327858, 0.1324484, 1.215853, 1, 1, 1, 1, 1,
1.332792, -0.0736188, 3.050258, 1, 1, 1, 1, 1,
1.355576, -0.2189721, -0.09191037, 1, 1, 1, 1, 1,
1.359464, 0.5705918, 1.914233, 1, 1, 1, 1, 1,
1.360229, 0.1890411, 2.142028, 1, 1, 1, 1, 1,
1.364818, 0.6970469, 0.331482, 1, 1, 1, 1, 1,
1.372153, 0.4642441, 1.666958, 1, 1, 1, 1, 1,
1.38036, 1.216259, -0.5711178, 1, 1, 1, 1, 1,
1.398503, -1.012556, 1.961967, 1, 1, 1, 1, 1,
1.410356, -0.1331952, 0.8316542, 1, 1, 1, 1, 1,
1.412809, -0.5084248, 2.754601, 1, 1, 1, 1, 1,
1.43607, 0.8533118, 1.120903, 0, 0, 1, 1, 1,
1.441732, 0.7845951, 1.686218, 1, 0, 0, 1, 1,
1.450884, 0.7121909, 2.561934, 1, 0, 0, 1, 1,
1.457874, -0.7228277, 3.281554, 1, 0, 0, 1, 1,
1.467032, 1.270464, 0.6614186, 1, 0, 0, 1, 1,
1.473486, 2.728571, -0.4673456, 1, 0, 0, 1, 1,
1.495439, 1.352012, 1.419822, 0, 0, 0, 1, 1,
1.497491, -0.4360059, 1.879836, 0, 0, 0, 1, 1,
1.50603, 0.553624, 0.2083732, 0, 0, 0, 1, 1,
1.511093, 1.523712, 1.685488, 0, 0, 0, 1, 1,
1.513978, 0.5979675, -0.3721063, 0, 0, 0, 1, 1,
1.523167, 0.6521364, 1.082174, 0, 0, 0, 1, 1,
1.523777, -1.394791, 4.010821, 0, 0, 0, 1, 1,
1.527023, 1.443796, 0.5387644, 1, 1, 1, 1, 1,
1.528819, -0.455638, 1.46809, 1, 1, 1, 1, 1,
1.53284, 1.301485, 1.016224, 1, 1, 1, 1, 1,
1.540088, 0.1165739, 1.792942, 1, 1, 1, 1, 1,
1.545215, 0.0215683, 1.036148, 1, 1, 1, 1, 1,
1.547778, -1.227713, 2.486156, 1, 1, 1, 1, 1,
1.568905, -0.4088239, 1.582401, 1, 1, 1, 1, 1,
1.570915, 0.02390699, 0.4778754, 1, 1, 1, 1, 1,
1.576565, -0.7394913, 2.011254, 1, 1, 1, 1, 1,
1.580905, 0.3567017, 2.296195, 1, 1, 1, 1, 1,
1.601108, -1.642743, 4.342212, 1, 1, 1, 1, 1,
1.662541, -1.888968, 2.774104, 1, 1, 1, 1, 1,
1.665953, -0.293168, 2.6918, 1, 1, 1, 1, 1,
1.689519, -1.561871, 0.8258977, 1, 1, 1, 1, 1,
1.690617, -0.7876809, 0.1527614, 1, 1, 1, 1, 1,
1.69978, -0.3558189, 1.636848, 0, 0, 1, 1, 1,
1.710314, 0.880407, -0.7962924, 1, 0, 0, 1, 1,
1.72861, 0.3823198, 1.740043, 1, 0, 0, 1, 1,
1.731763, 1.050391, 0.4485905, 1, 0, 0, 1, 1,
1.7433, 0.6849152, -0.04862982, 1, 0, 0, 1, 1,
1.745256, -1.428042, 1.179887, 1, 0, 0, 1, 1,
1.76693, -0.4077809, -0.4116583, 0, 0, 0, 1, 1,
1.769885, 1.142712, 0.7746979, 0, 0, 0, 1, 1,
1.772816, 0.5893896, 1.259339, 0, 0, 0, 1, 1,
1.779892, 1.991728, 1.995476, 0, 0, 0, 1, 1,
1.783273, 0.5848082, 2.260628, 0, 0, 0, 1, 1,
1.801166, 1.267763, 0.1865816, 0, 0, 0, 1, 1,
1.819529, -0.07033359, 1.872764, 0, 0, 0, 1, 1,
1.84493, 1.129284, 0.9660287, 1, 1, 1, 1, 1,
1.849601, -0.4077229, 2.143383, 1, 1, 1, 1, 1,
1.854404, 0.2699142, 0.0389051, 1, 1, 1, 1, 1,
1.8601, 1.238652, -0.5515089, 1, 1, 1, 1, 1,
1.88695, -0.03851424, 2.554404, 1, 1, 1, 1, 1,
1.907227, 0.700321, 1.952282, 1, 1, 1, 1, 1,
1.912575, -0.245036, 1.568247, 1, 1, 1, 1, 1,
1.921476, 1.138509, 1.798813, 1, 1, 1, 1, 1,
1.931008, 1.968889, 0.7367647, 1, 1, 1, 1, 1,
1.934053, 0.199533, 1.1692, 1, 1, 1, 1, 1,
1.936335, 0.2297914, 1.2303, 1, 1, 1, 1, 1,
1.937764, 0.9139302, 1.564465, 1, 1, 1, 1, 1,
1.958073, -0.5197251, -0.8048015, 1, 1, 1, 1, 1,
1.982565, 0.856918, 1.533109, 1, 1, 1, 1, 1,
1.998614, -0.6276121, 1.404379, 1, 1, 1, 1, 1,
2.045138, -0.4704734, 1.429418, 0, 0, 1, 1, 1,
2.050247, 1.287815, 1.552927, 1, 0, 0, 1, 1,
2.06356, -0.6162863, 2.690794, 1, 0, 0, 1, 1,
2.079646, 0.4000669, 1.590904, 1, 0, 0, 1, 1,
2.094048, 0.01630355, 1.312398, 1, 0, 0, 1, 1,
2.132134, 0.9275525, -1.307188, 1, 0, 0, 1, 1,
2.199799, -0.2291209, 2.281561, 0, 0, 0, 1, 1,
2.234394, 1.227729, 0.2876278, 0, 0, 0, 1, 1,
2.356464, 0.2530869, 2.163166, 0, 0, 0, 1, 1,
2.373303, -0.9445583, 2.732992, 0, 0, 0, 1, 1,
2.377645, -0.4843403, 0.9928185, 0, 0, 0, 1, 1,
2.397646, -0.4551627, 2.383427, 0, 0, 0, 1, 1,
2.428945, -0.217805, 1.909962, 0, 0, 0, 1, 1,
2.493966, -0.0753522, 2.189891, 1, 1, 1, 1, 1,
2.512359, -1.731444, 1.375568, 1, 1, 1, 1, 1,
2.574556, -0.07706124, 2.058718, 1, 1, 1, 1, 1,
2.605439, -0.7101731, 1.04618, 1, 1, 1, 1, 1,
2.999008, -0.1337325, 1.864272, 1, 1, 1, 1, 1,
3.493884, -0.2474055, 2.951406, 1, 1, 1, 1, 1,
3.524888, 0.6666068, 1.00712, 1, 1, 1, 1, 1
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
var radius = 9.671855;
var distance = 33.97198;
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
mvMatrix.translate( -0.1740322, 0.3312693, -0.1610973 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97198);
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
