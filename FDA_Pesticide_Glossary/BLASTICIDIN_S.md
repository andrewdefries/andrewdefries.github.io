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
-3.272937, 2.047842, -2.045801, 1, 0, 0, 1,
-3.258719, 0.6242014, 0.1782492, 1, 0.007843138, 0, 1,
-2.722368, -0.308913, -3.017727, 1, 0.01176471, 0, 1,
-2.624783, 1.058247, -1.462033, 1, 0.01960784, 0, 1,
-2.601741, -0.9288768, 0.1003456, 1, 0.02352941, 0, 1,
-2.508151, 0.200257, -1.873163, 1, 0.03137255, 0, 1,
-2.495703, -0.2782885, -0.5594956, 1, 0.03529412, 0, 1,
-2.48041, 0.3276134, -0.2434627, 1, 0.04313726, 0, 1,
-2.439544, -0.6863621, -3.471287, 1, 0.04705882, 0, 1,
-2.347281, 0.4460836, -2.907442, 1, 0.05490196, 0, 1,
-2.343579, 0.3864104, -0.8103044, 1, 0.05882353, 0, 1,
-2.316169, 1.044966, -0.7338847, 1, 0.06666667, 0, 1,
-2.302392, 1.311304, -0.7667803, 1, 0.07058824, 0, 1,
-2.302307, -0.2838155, -1.304981, 1, 0.07843138, 0, 1,
-2.289674, -0.3784257, -2.168099, 1, 0.08235294, 0, 1,
-2.218083, 1.230754, -0.6709331, 1, 0.09019608, 0, 1,
-2.205259, 0.5143307, -0.1318644, 1, 0.09411765, 0, 1,
-2.145153, -0.4371025, -1.141141, 1, 0.1019608, 0, 1,
-2.14368, 0.9487929, -0.2941479, 1, 0.1098039, 0, 1,
-2.125077, 0.8970221, -1.329808, 1, 0.1137255, 0, 1,
-2.087551, 0.104446, -1.548732, 1, 0.1215686, 0, 1,
-2.077789, -0.08627465, -2.725149, 1, 0.1254902, 0, 1,
-2.064087, 0.4257501, -2.000584, 1, 0.1333333, 0, 1,
-2.041788, 0.3803519, -0.4409845, 1, 0.1372549, 0, 1,
-1.959, -0.324824, -2.150224, 1, 0.145098, 0, 1,
-1.945992, -0.2757877, -2.657797, 1, 0.1490196, 0, 1,
-1.897042, 1.515517, -1.813809, 1, 0.1568628, 0, 1,
-1.874525, -1.303082, -3.139149, 1, 0.1607843, 0, 1,
-1.864012, 1.090981, -2.394511, 1, 0.1686275, 0, 1,
-1.860123, 0.5444199, -3.675079, 1, 0.172549, 0, 1,
-1.831259, 0.1186651, -0.9927809, 1, 0.1803922, 0, 1,
-1.823155, -0.2849394, -1.860497, 1, 0.1843137, 0, 1,
-1.822004, 1.093636, -1.43088, 1, 0.1921569, 0, 1,
-1.820409, 0.7432818, -0.6226947, 1, 0.1960784, 0, 1,
-1.814216, -0.2556863, -1.172052, 1, 0.2039216, 0, 1,
-1.805941, -0.3169077, -2.080662, 1, 0.2117647, 0, 1,
-1.788291, 1.177027, -1.427996, 1, 0.2156863, 0, 1,
-1.780495, -1.143517, -1.001519, 1, 0.2235294, 0, 1,
-1.779084, 0.7520084, 0.02646544, 1, 0.227451, 0, 1,
-1.776753, 1.169258, -0.6959985, 1, 0.2352941, 0, 1,
-1.755883, 0.4371075, 0.1363607, 1, 0.2392157, 0, 1,
-1.753428, 0.5069668, -2.632077, 1, 0.2470588, 0, 1,
-1.743909, -0.919876, -3.400061, 1, 0.2509804, 0, 1,
-1.723139, -0.9583647, -0.6393403, 1, 0.2588235, 0, 1,
-1.718469, 1.26609, -1.397586, 1, 0.2627451, 0, 1,
-1.704664, -0.2785383, -1.543248, 1, 0.2705882, 0, 1,
-1.697968, 0.03342274, -1.636614, 1, 0.2745098, 0, 1,
-1.696779, 0.8139295, -2.172373, 1, 0.282353, 0, 1,
-1.694379, 0.2076665, -1.672483, 1, 0.2862745, 0, 1,
-1.679281, 0.1158981, -1.171105, 1, 0.2941177, 0, 1,
-1.677692, 0.7208738, -1.767954, 1, 0.3019608, 0, 1,
-1.675083, 0.9599367, -0.7593912, 1, 0.3058824, 0, 1,
-1.671343, -0.9227215, -1.298274, 1, 0.3137255, 0, 1,
-1.671329, 0.7062309, -1.046755, 1, 0.3176471, 0, 1,
-1.660814, -0.2025278, -1.73623, 1, 0.3254902, 0, 1,
-1.650508, 0.3219238, -0.2148237, 1, 0.3294118, 0, 1,
-1.645664, 0.8564804, -1.732987, 1, 0.3372549, 0, 1,
-1.633688, -1.147052, -0.9272633, 1, 0.3411765, 0, 1,
-1.629152, -0.1809548, -0.5211618, 1, 0.3490196, 0, 1,
-1.621782, -1.1675, -1.958428, 1, 0.3529412, 0, 1,
-1.606082, -0.1793386, -1.109313, 1, 0.3607843, 0, 1,
-1.599188, 0.5201793, -1.658909, 1, 0.3647059, 0, 1,
-1.5914, -1.768724, -1.074956, 1, 0.372549, 0, 1,
-1.57846, -0.2484327, -0.3419152, 1, 0.3764706, 0, 1,
-1.576839, 1.427939, -1.150931, 1, 0.3843137, 0, 1,
-1.575041, -0.6525239, -2.432979, 1, 0.3882353, 0, 1,
-1.56689, 0.008837111, -1.622488, 1, 0.3960784, 0, 1,
-1.566761, 0.5814222, -1.479658, 1, 0.4039216, 0, 1,
-1.560682, -0.0987537, -1.519129, 1, 0.4078431, 0, 1,
-1.555548, 0.2597711, 0.1008264, 1, 0.4156863, 0, 1,
-1.553348, 0.2640326, -1.52493, 1, 0.4196078, 0, 1,
-1.549539, -0.6559774, -1.529297, 1, 0.427451, 0, 1,
-1.546977, 0.8981011, -1.757574, 1, 0.4313726, 0, 1,
-1.543827, -1.299719, -1.386018, 1, 0.4392157, 0, 1,
-1.536826, -1.373917, -3.479993, 1, 0.4431373, 0, 1,
-1.532466, -0.0495353, -1.1541, 1, 0.4509804, 0, 1,
-1.508988, -0.4059187, -2.396458, 1, 0.454902, 0, 1,
-1.492683, 0.6196829, -1.422145, 1, 0.4627451, 0, 1,
-1.463053, -0.9857015, -2.145401, 1, 0.4666667, 0, 1,
-1.462807, 1.179357, -0.8030764, 1, 0.4745098, 0, 1,
-1.461881, -0.3727507, -1.764264, 1, 0.4784314, 0, 1,
-1.460614, -1.143395, -2.66343, 1, 0.4862745, 0, 1,
-1.448177, 0.5723116, -0.2021659, 1, 0.4901961, 0, 1,
-1.437683, -0.2968115, -1.049019, 1, 0.4980392, 0, 1,
-1.431992, 1.003873, -2.043368, 1, 0.5058824, 0, 1,
-1.419692, 0.8708775, -0.09893145, 1, 0.509804, 0, 1,
-1.407213, 1.738035, -0.9771684, 1, 0.5176471, 0, 1,
-1.386043, -1.031473, -2.703478, 1, 0.5215687, 0, 1,
-1.385836, -0.245298, -0.7568247, 1, 0.5294118, 0, 1,
-1.378577, -0.8297183, -0.9524865, 1, 0.5333334, 0, 1,
-1.376073, 1.655639, 0.8340654, 1, 0.5411765, 0, 1,
-1.371075, 0.9298965, -1.006614, 1, 0.5450981, 0, 1,
-1.358028, 0.1664312, -1.880732, 1, 0.5529412, 0, 1,
-1.350844, -0.6338698, -1.467836, 1, 0.5568628, 0, 1,
-1.349317, 0.187876, -0.8142018, 1, 0.5647059, 0, 1,
-1.346884, -0.9237167, -2.802678, 1, 0.5686275, 0, 1,
-1.338513, -1.318572, -1.295141, 1, 0.5764706, 0, 1,
-1.336603, 1.245291, -0.03585316, 1, 0.5803922, 0, 1,
-1.332062, -0.05383221, -1.125056, 1, 0.5882353, 0, 1,
-1.328214, -0.579375, -3.079328, 1, 0.5921569, 0, 1,
-1.318226, -0.6760623, -1.570082, 1, 0.6, 0, 1,
-1.316971, 0.4905267, -1.776464, 1, 0.6078432, 0, 1,
-1.316259, 0.3351846, -1.882241, 1, 0.6117647, 0, 1,
-1.315328, 0.01579112, -2.119341, 1, 0.6196079, 0, 1,
-1.3018, -1.330923, -3.207075, 1, 0.6235294, 0, 1,
-1.301032, -0.8969516, -2.901986, 1, 0.6313726, 0, 1,
-1.298248, 0.4946621, -2.873663, 1, 0.6352941, 0, 1,
-1.297437, -1.001999, -1.820399, 1, 0.6431373, 0, 1,
-1.286651, -0.90416, -1.773137, 1, 0.6470588, 0, 1,
-1.27587, -1.188471, -2.491647, 1, 0.654902, 0, 1,
-1.275298, -0.9670035, -0.5933014, 1, 0.6588235, 0, 1,
-1.266522, 0.5226573, -0.8946553, 1, 0.6666667, 0, 1,
-1.266119, 0.08037981, -2.003617, 1, 0.6705883, 0, 1,
-1.265686, -0.04638894, -0.7781996, 1, 0.6784314, 0, 1,
-1.257127, 1.508944, -1.864761, 1, 0.682353, 0, 1,
-1.24845, 0.4173237, 0.2151036, 1, 0.6901961, 0, 1,
-1.231696, 0.7711483, -1.601653, 1, 0.6941177, 0, 1,
-1.225634, 0.4752932, 0.363903, 1, 0.7019608, 0, 1,
-1.200515, -2.269496, -1.993784, 1, 0.7098039, 0, 1,
-1.199488, 2.413455, 1.114695, 1, 0.7137255, 0, 1,
-1.198329, -0.02524676, 0.3458349, 1, 0.7215686, 0, 1,
-1.187223, -0.9989618, -1.562005, 1, 0.7254902, 0, 1,
-1.185516, 0.06545265, -2.026344, 1, 0.7333333, 0, 1,
-1.182088, 0.200464, -2.395012, 1, 0.7372549, 0, 1,
-1.174661, 0.5375459, -1.92952, 1, 0.7450981, 0, 1,
-1.169608, -0.451657, -4.565722, 1, 0.7490196, 0, 1,
-1.167842, 2.27528, -2.364777, 1, 0.7568628, 0, 1,
-1.165319, -1.686984, -4.112229, 1, 0.7607843, 0, 1,
-1.159721, 0.3855898, -0.2761935, 1, 0.7686275, 0, 1,
-1.158573, 0.3547409, -0.07014055, 1, 0.772549, 0, 1,
-1.144049, -0.8211108, -2.760946, 1, 0.7803922, 0, 1,
-1.136935, 0.6640034, -0.7057056, 1, 0.7843137, 0, 1,
-1.132352, 0.218034, 0.02557348, 1, 0.7921569, 0, 1,
-1.129234, -0.3083543, -1.2406, 1, 0.7960784, 0, 1,
-1.127111, -0.5498934, -2.351814, 1, 0.8039216, 0, 1,
-1.119275, 1.031436, 1.074941, 1, 0.8117647, 0, 1,
-1.118207, 2.18519, -0.3029698, 1, 0.8156863, 0, 1,
-1.109633, -0.6114941, -1.095452, 1, 0.8235294, 0, 1,
-1.10198, -0.3677758, -2.886656, 1, 0.827451, 0, 1,
-1.098773, 0.765087, -3.407056, 1, 0.8352941, 0, 1,
-1.096185, 0.2533608, -0.7531767, 1, 0.8392157, 0, 1,
-1.094175, -0.007832413, -2.551047, 1, 0.8470588, 0, 1,
-1.09411, 0.8923905, -2.865861, 1, 0.8509804, 0, 1,
-1.091179, -1.897763, -2.719763, 1, 0.8588235, 0, 1,
-1.089904, 1.118987, -1.980651, 1, 0.8627451, 0, 1,
-1.089792, 0.5126244, -0.9840971, 1, 0.8705882, 0, 1,
-1.082576, -0.4906901, -2.580074, 1, 0.8745098, 0, 1,
-1.073103, -0.8089619, -1.712799, 1, 0.8823529, 0, 1,
-1.072851, 0.7425116, -0.863485, 1, 0.8862745, 0, 1,
-1.06091, 0.6159391, -1.846444, 1, 0.8941177, 0, 1,
-1.057214, 0.3746904, -1.35019, 1, 0.8980392, 0, 1,
-1.05715, -0.3921442, -1.081725, 1, 0.9058824, 0, 1,
-1.057022, 0.6333772, -0.1295437, 1, 0.9137255, 0, 1,
-1.055712, 1.254487, 1.204713, 1, 0.9176471, 0, 1,
-1.054755, -0.2884429, -1.862211, 1, 0.9254902, 0, 1,
-1.051416, 1.497276, -0.9146531, 1, 0.9294118, 0, 1,
-1.04333, 0.1725472, -0.6491416, 1, 0.9372549, 0, 1,
-1.042277, 0.4243179, -1.79003, 1, 0.9411765, 0, 1,
-1.040313, 0.970954, -2.128993, 1, 0.9490196, 0, 1,
-1.034817, -0.9966268, -2.813408, 1, 0.9529412, 0, 1,
-1.022778, 1.051459, 0.4959916, 1, 0.9607843, 0, 1,
-1.019824, 0.6875295, -0.1620893, 1, 0.9647059, 0, 1,
-1.018496, -0.411056, -3.167842, 1, 0.972549, 0, 1,
-1.01838, 0.2216767, -1.024213, 1, 0.9764706, 0, 1,
-1.008728, 1.160501, 1.512149, 1, 0.9843137, 0, 1,
-1.002354, 0.8281853, -0.9338573, 1, 0.9882353, 0, 1,
-0.9957616, 0.4818318, -0.6341598, 1, 0.9960784, 0, 1,
-0.9925669, -0.2466944, -0.2832772, 0.9960784, 1, 0, 1,
-0.963896, 0.07940991, -1.082725, 0.9921569, 1, 0, 1,
-0.9634438, -0.2395472, -3.022869, 0.9843137, 1, 0, 1,
-0.9566583, -0.2774394, -3.294445, 0.9803922, 1, 0, 1,
-0.949871, -0.8702232, -3.435756, 0.972549, 1, 0, 1,
-0.9479812, -0.1126749, -0.5984088, 0.9686275, 1, 0, 1,
-0.9299406, 0.374514, -1.183181, 0.9607843, 1, 0, 1,
-0.927891, -0.6685742, -1.156464, 0.9568627, 1, 0, 1,
-0.9258994, -0.4625474, -1.479081, 0.9490196, 1, 0, 1,
-0.9252415, 1.356825, -1.351585, 0.945098, 1, 0, 1,
-0.9224814, 1.752458, -0.6883197, 0.9372549, 1, 0, 1,
-0.9135297, -2.779263, -2.439882, 0.9333333, 1, 0, 1,
-0.9105684, -1.588799, -3.797495, 0.9254902, 1, 0, 1,
-0.9091151, 1.668719, -1.545776, 0.9215686, 1, 0, 1,
-0.9048051, -0.4755192, -2.077445, 0.9137255, 1, 0, 1,
-0.9039732, 1.522459, -2.469854, 0.9098039, 1, 0, 1,
-0.8941224, -1.319905, -1.646821, 0.9019608, 1, 0, 1,
-0.8926973, 0.7378323, -0.5902238, 0.8941177, 1, 0, 1,
-0.8924397, -1.130895, -4.0659, 0.8901961, 1, 0, 1,
-0.8833583, 0.6362026, -1.226413, 0.8823529, 1, 0, 1,
-0.8717575, 1.007098, 0.07688908, 0.8784314, 1, 0, 1,
-0.8707548, -0.5123746, -2.547107, 0.8705882, 1, 0, 1,
-0.867385, -1.298671, -4.049839, 0.8666667, 1, 0, 1,
-0.8665283, 0.8877932, -0.1981657, 0.8588235, 1, 0, 1,
-0.8615712, 0.6005035, -0.9434422, 0.854902, 1, 0, 1,
-0.8568467, 1.349226, -0.3057719, 0.8470588, 1, 0, 1,
-0.85642, 1.554789, 1.130177, 0.8431373, 1, 0, 1,
-0.8557297, -1.128733, -1.796591, 0.8352941, 1, 0, 1,
-0.8526152, 1.901637, 0.4855846, 0.8313726, 1, 0, 1,
-0.8520797, 1.609658, -0.5651805, 0.8235294, 1, 0, 1,
-0.849555, 1.192773, -0.507172, 0.8196079, 1, 0, 1,
-0.8482839, -0.2083618, -2.654752, 0.8117647, 1, 0, 1,
-0.8482593, 1.177431, -0.1116932, 0.8078431, 1, 0, 1,
-0.8383428, 0.8458213, -3.041054, 0.8, 1, 0, 1,
-0.8357571, -0.9350728, -1.601403, 0.7921569, 1, 0, 1,
-0.833105, 1.987992, 0.6816084, 0.7882353, 1, 0, 1,
-0.8315488, -0.05110366, -1.594542, 0.7803922, 1, 0, 1,
-0.8304815, 0.1124883, -1.691482, 0.7764706, 1, 0, 1,
-0.829424, 0.01352681, -0.6884159, 0.7686275, 1, 0, 1,
-0.8292276, 1.587053, -0.5837784, 0.7647059, 1, 0, 1,
-0.8290046, -2.179716, -1.898221, 0.7568628, 1, 0, 1,
-0.827691, 1.080733, -1.957826, 0.7529412, 1, 0, 1,
-0.823332, 0.4840789, -1.703046, 0.7450981, 1, 0, 1,
-0.8226764, -1.878517, -3.208013, 0.7411765, 1, 0, 1,
-0.8226448, 0.340546, -0.40672, 0.7333333, 1, 0, 1,
-0.8217339, 0.2958347, -0.6433981, 0.7294118, 1, 0, 1,
-0.820348, -0.6098443, -2.292779, 0.7215686, 1, 0, 1,
-0.8069171, -2.14294, -3.599349, 0.7176471, 1, 0, 1,
-0.7944456, 0.3513906, 0.23558, 0.7098039, 1, 0, 1,
-0.7940977, -0.7061483, -1.448927, 0.7058824, 1, 0, 1,
-0.7765667, -1.156151, -3.027491, 0.6980392, 1, 0, 1,
-0.7751772, -0.5270125, -3.306847, 0.6901961, 1, 0, 1,
-0.7745039, -0.002549572, -0.9107502, 0.6862745, 1, 0, 1,
-0.7736902, -0.3923779, -2.517886, 0.6784314, 1, 0, 1,
-0.7723886, 0.7887813, -0.8939421, 0.6745098, 1, 0, 1,
-0.7714585, 0.4340384, -2.187741, 0.6666667, 1, 0, 1,
-0.7675819, 0.05571049, -3.577049, 0.6627451, 1, 0, 1,
-0.7675287, -0.01091008, -2.04272, 0.654902, 1, 0, 1,
-0.7591347, 0.07900766, -2.846258, 0.6509804, 1, 0, 1,
-0.7591251, 0.359825, -3.283679, 0.6431373, 1, 0, 1,
-0.7576518, -1.265943, -1.32974, 0.6392157, 1, 0, 1,
-0.7473365, -1.416377, -1.606271, 0.6313726, 1, 0, 1,
-0.7431181, 1.572702, -1.04131, 0.627451, 1, 0, 1,
-0.7408873, -0.08850522, -1.482508, 0.6196079, 1, 0, 1,
-0.7387781, 0.2862851, -2.915122, 0.6156863, 1, 0, 1,
-0.7343896, -0.925572, -1.547478, 0.6078432, 1, 0, 1,
-0.7338517, -0.2651125, -1.981995, 0.6039216, 1, 0, 1,
-0.7338508, -0.6068078, -2.604761, 0.5960785, 1, 0, 1,
-0.7330917, 0.5203686, -0.3792773, 0.5882353, 1, 0, 1,
-0.7322913, -1.254127, -2.152289, 0.5843138, 1, 0, 1,
-0.7315154, -0.9650847, -2.547007, 0.5764706, 1, 0, 1,
-0.7276015, 0.5493491, -3.590856, 0.572549, 1, 0, 1,
-0.7175416, -0.8963038, -1.446655, 0.5647059, 1, 0, 1,
-0.7171392, 0.5714347, -2.112287, 0.5607843, 1, 0, 1,
-0.7158628, 0.561276, -0.8040972, 0.5529412, 1, 0, 1,
-0.7138168, 1.998935, -0.5299394, 0.5490196, 1, 0, 1,
-0.7110856, 0.8386934, -1.112032, 0.5411765, 1, 0, 1,
-0.7085989, -0.9856979, -2.136327, 0.5372549, 1, 0, 1,
-0.7066553, 1.697515, -0.9634452, 0.5294118, 1, 0, 1,
-0.7056375, 0.0870905, 0.1615745, 0.5254902, 1, 0, 1,
-0.7049903, 0.5647751, 0.260795, 0.5176471, 1, 0, 1,
-0.6988183, -0.2250121, -2.663726, 0.5137255, 1, 0, 1,
-0.6971669, -0.8785779, -3.552615, 0.5058824, 1, 0, 1,
-0.6950753, -1.658375, -5.143734, 0.5019608, 1, 0, 1,
-0.6949462, 0.03634904, -1.640723, 0.4941176, 1, 0, 1,
-0.6931915, 0.04789355, -2.748138, 0.4862745, 1, 0, 1,
-0.6906158, 0.3277623, -2.521344, 0.4823529, 1, 0, 1,
-0.6901842, 1.191228, 0.2330932, 0.4745098, 1, 0, 1,
-0.6863928, -0.4205003, 0.374823, 0.4705882, 1, 0, 1,
-0.6861582, -1.354164, -5.184849, 0.4627451, 1, 0, 1,
-0.6825247, 0.7848865, -0.03461727, 0.4588235, 1, 0, 1,
-0.6802397, -0.7392579, -2.564596, 0.4509804, 1, 0, 1,
-0.6726553, -1.122542, -3.871774, 0.4470588, 1, 0, 1,
-0.6660485, 0.3667257, -1.533484, 0.4392157, 1, 0, 1,
-0.6649053, 0.0907606, -2.751683, 0.4352941, 1, 0, 1,
-0.6625141, -0.4979446, -3.469418, 0.427451, 1, 0, 1,
-0.6622903, 0.2034307, -1.363497, 0.4235294, 1, 0, 1,
-0.6594836, 0.5854956, -1.600279, 0.4156863, 1, 0, 1,
-0.6540554, 0.817661, -1.35784, 0.4117647, 1, 0, 1,
-0.64978, -0.8192205, -2.788193, 0.4039216, 1, 0, 1,
-0.6481538, -0.2587816, -0.6925302, 0.3960784, 1, 0, 1,
-0.6481349, -0.3578716, -2.822177, 0.3921569, 1, 0, 1,
-0.6455975, 1.638743, 0.9700493, 0.3843137, 1, 0, 1,
-0.6436408, 1.10861, -0.4177776, 0.3803922, 1, 0, 1,
-0.6420416, 1.413554, -1.482218, 0.372549, 1, 0, 1,
-0.6404369, 0.002590554, -1.686367, 0.3686275, 1, 0, 1,
-0.6362753, 0.2315343, -2.807534, 0.3607843, 1, 0, 1,
-0.6308619, -0.846827, -1.73836, 0.3568628, 1, 0, 1,
-0.6303563, -0.1602757, -1.042733, 0.3490196, 1, 0, 1,
-0.6239891, 0.3188969, -0.9189128, 0.345098, 1, 0, 1,
-0.6236379, 0.1466306, -1.067557, 0.3372549, 1, 0, 1,
-0.62181, 0.4901889, 0.2162996, 0.3333333, 1, 0, 1,
-0.6213175, -0.1649959, -2.528159, 0.3254902, 1, 0, 1,
-0.6199445, 0.01094905, -0.1984292, 0.3215686, 1, 0, 1,
-0.6194798, 2.314679, -0.09022036, 0.3137255, 1, 0, 1,
-0.6159101, 1.366469, -0.3502107, 0.3098039, 1, 0, 1,
-0.6110383, -2.142219, -3.20881, 0.3019608, 1, 0, 1,
-0.6087253, -0.9134614, -3.706639, 0.2941177, 1, 0, 1,
-0.608391, 0.2258693, -0.3875827, 0.2901961, 1, 0, 1,
-0.6077547, -0.2542214, -3.928799, 0.282353, 1, 0, 1,
-0.6028911, 1.670248, 1.355784, 0.2784314, 1, 0, 1,
-0.5992556, 0.731386, -0.06134852, 0.2705882, 1, 0, 1,
-0.5940668, -1.147673, -2.240824, 0.2666667, 1, 0, 1,
-0.5927084, -0.196601, -1.663225, 0.2588235, 1, 0, 1,
-0.5902169, 0.7362606, -1.089581, 0.254902, 1, 0, 1,
-0.5875354, 0.0220003, 0.9184953, 0.2470588, 1, 0, 1,
-0.5832993, 0.4158008, -0.9135227, 0.2431373, 1, 0, 1,
-0.5809494, -0.480137, -2.132824, 0.2352941, 1, 0, 1,
-0.5802234, -0.4486533, -1.482476, 0.2313726, 1, 0, 1,
-0.574918, 0.08333241, -1.815077, 0.2235294, 1, 0, 1,
-0.5729679, -1.359035, -1.607648, 0.2196078, 1, 0, 1,
-0.5728895, -0.8818567, -2.480015, 0.2117647, 1, 0, 1,
-0.5723505, 0.05266055, -0.4331449, 0.2078431, 1, 0, 1,
-0.5698932, -1.112095, -3.644741, 0.2, 1, 0, 1,
-0.5689143, 0.09032679, -1.664067, 0.1921569, 1, 0, 1,
-0.5681946, -0.9962813, -1.235931, 0.1882353, 1, 0, 1,
-0.5636698, -1.444258, -3.209333, 0.1803922, 1, 0, 1,
-0.5626116, 2.533544, 0.2222137, 0.1764706, 1, 0, 1,
-0.5614466, -1.443296, -0.7814021, 0.1686275, 1, 0, 1,
-0.5494418, 0.3501805, -1.584728, 0.1647059, 1, 0, 1,
-0.5449426, -0.6570057, -3.341617, 0.1568628, 1, 0, 1,
-0.5447707, 0.2016792, -0.4565272, 0.1529412, 1, 0, 1,
-0.5424258, -0.1732298, -2.735086, 0.145098, 1, 0, 1,
-0.536221, -0.472288, -3.159671, 0.1411765, 1, 0, 1,
-0.5361495, 1.356014, 0.6396149, 0.1333333, 1, 0, 1,
-0.5356715, -0.8904115, -2.345783, 0.1294118, 1, 0, 1,
-0.5356476, -0.5935249, -1.100128, 0.1215686, 1, 0, 1,
-0.5333684, 0.7344494, -0.1144681, 0.1176471, 1, 0, 1,
-0.5277228, -0.1819945, -3.159416, 0.1098039, 1, 0, 1,
-0.525817, 0.7129247, -0.2392021, 0.1058824, 1, 0, 1,
-0.5140942, 0.158842, -0.05596452, 0.09803922, 1, 0, 1,
-0.5122121, 0.2566666, -1.900337, 0.09019608, 1, 0, 1,
-0.5075973, -0.9673473, -2.79279, 0.08627451, 1, 0, 1,
-0.507228, 0.1492587, -1.614752, 0.07843138, 1, 0, 1,
-0.5039345, -0.8212106, -5.10641, 0.07450981, 1, 0, 1,
-0.5005322, 2.171173, 1.095183, 0.06666667, 1, 0, 1,
-0.4995514, 0.2695724, -1.019151, 0.0627451, 1, 0, 1,
-0.4958657, 0.5897209, -0.3202245, 0.05490196, 1, 0, 1,
-0.4900644, 0.931344, -1.644446, 0.05098039, 1, 0, 1,
-0.489509, -0.3456066, -1.922253, 0.04313726, 1, 0, 1,
-0.4809126, 0.5166702, -0.7370605, 0.03921569, 1, 0, 1,
-0.4806744, -0.4613534, -0.3418008, 0.03137255, 1, 0, 1,
-0.4791968, -0.9556668, -2.716663, 0.02745098, 1, 0, 1,
-0.4780174, -0.1752149, -2.700302, 0.01960784, 1, 0, 1,
-0.4740334, -0.6218346, -2.769637, 0.01568628, 1, 0, 1,
-0.4703605, 0.9116927, 1.166587, 0.007843138, 1, 0, 1,
-0.4673113, 2.499448, -1.466292, 0.003921569, 1, 0, 1,
-0.4656281, 0.04100734, -3.352215, 0, 1, 0.003921569, 1,
-0.4655583, 1.370789, -0.8991989, 0, 1, 0.01176471, 1,
-0.4564246, 0.9173736, 0.4049368, 0, 1, 0.01568628, 1,
-0.4518212, 0.6387474, -1.054768, 0, 1, 0.02352941, 1,
-0.4510729, -0.1585394, -4.437597, 0, 1, 0.02745098, 1,
-0.4484283, 0.7418867, -1.071004, 0, 1, 0.03529412, 1,
-0.4451573, -0.5149716, -2.237766, 0, 1, 0.03921569, 1,
-0.4450245, 1.948944, -0.338166, 0, 1, 0.04705882, 1,
-0.4446198, -0.3023518, 0.3291201, 0, 1, 0.05098039, 1,
-0.4440736, -1.154243, -1.523345, 0, 1, 0.05882353, 1,
-0.4410204, 0.2886859, 0.3537833, 0, 1, 0.0627451, 1,
-0.4388352, -1.309742, -3.407786, 0, 1, 0.07058824, 1,
-0.4352522, -1.687496, -3.482587, 0, 1, 0.07450981, 1,
-0.4328025, 1.230741, 0.9742777, 0, 1, 0.08235294, 1,
-0.4291068, 0.4896915, -0.907147, 0, 1, 0.08627451, 1,
-0.4283508, -1.87118, -3.609136, 0, 1, 0.09411765, 1,
-0.4240196, -1.420658, -3.584584, 0, 1, 0.1019608, 1,
-0.4183887, 0.8507801, -0.9598314, 0, 1, 0.1058824, 1,
-0.4132418, 0.6577268, 1.188982, 0, 1, 0.1137255, 1,
-0.4116639, -0.6518602, -1.973224, 0, 1, 0.1176471, 1,
-0.4103893, 0.9789549, -0.8070883, 0, 1, 0.1254902, 1,
-0.4068003, 0.2469863, -0.1763485, 0, 1, 0.1294118, 1,
-0.4017239, -0.7189196, -1.726128, 0, 1, 0.1372549, 1,
-0.3970747, -0.02593489, 0.01130169, 0, 1, 0.1411765, 1,
-0.3888446, 1.292905, -0.00404013, 0, 1, 0.1490196, 1,
-0.3882968, -0.8665562, -3.545323, 0, 1, 0.1529412, 1,
-0.3842787, 1.292923, 0.4101746, 0, 1, 0.1607843, 1,
-0.3824809, 0.8236513, -0.3402402, 0, 1, 0.1647059, 1,
-0.3791153, -0.8558433, -2.781506, 0, 1, 0.172549, 1,
-0.3769037, 1.575831, -2.147112, 0, 1, 0.1764706, 1,
-0.376323, 1.708757, -1.292376, 0, 1, 0.1843137, 1,
-0.3724105, 0.1504308, 0.7669111, 0, 1, 0.1882353, 1,
-0.3722884, 0.7219627, 0.2031021, 0, 1, 0.1960784, 1,
-0.3634102, -1.187742, -2.587222, 0, 1, 0.2039216, 1,
-0.3605401, -0.1101983, -2.184861, 0, 1, 0.2078431, 1,
-0.3595479, -0.840385, -2.023499, 0, 1, 0.2156863, 1,
-0.3592503, -0.7149349, -2.51076, 0, 1, 0.2196078, 1,
-0.3555846, 0.8108724, -1.043231, 0, 1, 0.227451, 1,
-0.3540798, -1.105796, -3.78962, 0, 1, 0.2313726, 1,
-0.338588, -0.4890913, -3.232815, 0, 1, 0.2392157, 1,
-0.33607, 0.1809424, -1.112445, 0, 1, 0.2431373, 1,
-0.3336585, 0.8406069, 1.040619, 0, 1, 0.2509804, 1,
-0.3328612, 2.156013, 0.6582953, 0, 1, 0.254902, 1,
-0.3283858, -0.2690946, -3.188607, 0, 1, 0.2627451, 1,
-0.3273421, 1.37095, -0.4239171, 0, 1, 0.2666667, 1,
-0.3239383, -1.586033, -3.135476, 0, 1, 0.2745098, 1,
-0.3235156, -0.4522368, -2.322503, 0, 1, 0.2784314, 1,
-0.3109567, 0.5981308, -1.317079, 0, 1, 0.2862745, 1,
-0.2910489, 0.8529791, 1.107402, 0, 1, 0.2901961, 1,
-0.2790918, 1.042676, -0.1111611, 0, 1, 0.2980392, 1,
-0.2787074, -0.2666275, -1.323222, 0, 1, 0.3058824, 1,
-0.2786555, -0.05701185, -1.693412, 0, 1, 0.3098039, 1,
-0.2785884, -1.121693, -2.76812, 0, 1, 0.3176471, 1,
-0.2769091, -0.1245305, -3.058957, 0, 1, 0.3215686, 1,
-0.2756167, 1.126698, -0.3254013, 0, 1, 0.3294118, 1,
-0.2755128, 1.362263, 0.8879596, 0, 1, 0.3333333, 1,
-0.2710419, -0.1366122, -3.212363, 0, 1, 0.3411765, 1,
-0.2681003, -0.2569661, -2.660678, 0, 1, 0.345098, 1,
-0.2664618, 1.412935, -0.6017566, 0, 1, 0.3529412, 1,
-0.2651233, 0.8181051, -0.8413745, 0, 1, 0.3568628, 1,
-0.2644621, 0.1704871, 0.910121, 0, 1, 0.3647059, 1,
-0.2634692, -0.3787414, -1.259303, 0, 1, 0.3686275, 1,
-0.2618595, -0.942179, -1.931522, 0, 1, 0.3764706, 1,
-0.2595072, -0.147483, -1.876923, 0, 1, 0.3803922, 1,
-0.2536775, -0.9864953, -1.599068, 0, 1, 0.3882353, 1,
-0.2530772, -1.046985, -2.047717, 0, 1, 0.3921569, 1,
-0.2486036, -0.1105095, -0.9550976, 0, 1, 0.4, 1,
-0.2430304, -0.5375138, -4.746769, 0, 1, 0.4078431, 1,
-0.2427646, -0.1877799, -2.405738, 0, 1, 0.4117647, 1,
-0.2416148, -1.094487, -2.565489, 0, 1, 0.4196078, 1,
-0.237707, 0.07381468, -1.031738, 0, 1, 0.4235294, 1,
-0.2241628, 1.246389, -0.7217813, 0, 1, 0.4313726, 1,
-0.223655, -0.2047028, -2.412042, 0, 1, 0.4352941, 1,
-0.2192047, -1.495717, -2.787832, 0, 1, 0.4431373, 1,
-0.2169515, 0.04176117, -1.497977, 0, 1, 0.4470588, 1,
-0.2164673, -0.01449112, -0.8401719, 0, 1, 0.454902, 1,
-0.2159042, -0.4399543, -2.312301, 0, 1, 0.4588235, 1,
-0.213473, -0.4181556, -3.260263, 0, 1, 0.4666667, 1,
-0.2109357, -1.253265, -2.232163, 0, 1, 0.4705882, 1,
-0.2078774, 0.3222879, -0.5990227, 0, 1, 0.4784314, 1,
-0.1993789, 0.5023661, -0.4084623, 0, 1, 0.4823529, 1,
-0.1991316, -0.02372278, -2.652199, 0, 1, 0.4901961, 1,
-0.1970629, -1.007989, -3.319954, 0, 1, 0.4941176, 1,
-0.1929995, -0.3602355, -2.49547, 0, 1, 0.5019608, 1,
-0.1918749, -0.8257792, -4.226279, 0, 1, 0.509804, 1,
-0.1860505, -0.6429374, -3.578419, 0, 1, 0.5137255, 1,
-0.1851944, 1.025781, 0.09532891, 0, 1, 0.5215687, 1,
-0.1838412, 0.3035627, 0.09471678, 0, 1, 0.5254902, 1,
-0.1748033, 1.055874, 0.5866257, 0, 1, 0.5333334, 1,
-0.1700115, -0.3533746, -2.609757, 0, 1, 0.5372549, 1,
-0.168879, -1.140732, -2.645107, 0, 1, 0.5450981, 1,
-0.1646468, 1.001492, 0.8006037, 0, 1, 0.5490196, 1,
-0.1613271, 0.2059487, -0.7957022, 0, 1, 0.5568628, 1,
-0.1611533, -1.515897, -3.108917, 0, 1, 0.5607843, 1,
-0.1525638, 0.4914708, 0.9753627, 0, 1, 0.5686275, 1,
-0.1508785, -0.2874245, -2.881262, 0, 1, 0.572549, 1,
-0.1503818, -0.7981663, -3.045776, 0, 1, 0.5803922, 1,
-0.1470159, -0.1828765, -1.950326, 0, 1, 0.5843138, 1,
-0.1452867, 1.148198, -0.1773681, 0, 1, 0.5921569, 1,
-0.1342036, 1.198089, 0.09729199, 0, 1, 0.5960785, 1,
-0.1333821, 1.244102, 1.674088, 0, 1, 0.6039216, 1,
-0.127057, -0.04621279, -0.6971855, 0, 1, 0.6117647, 1,
-0.1258432, 0.415765, 1.062963, 0, 1, 0.6156863, 1,
-0.1244819, -0.695376, -3.72069, 0, 1, 0.6235294, 1,
-0.1219644, 0.4343562, 0.338044, 0, 1, 0.627451, 1,
-0.1192108, -1.841176, -2.256434, 0, 1, 0.6352941, 1,
-0.1126488, -0.3013128, -2.745935, 0, 1, 0.6392157, 1,
-0.1126107, -0.1110207, -1.272103, 0, 1, 0.6470588, 1,
-0.1098346, -0.6246414, -4.96675, 0, 1, 0.6509804, 1,
-0.1048916, -0.621286, -2.626478, 0, 1, 0.6588235, 1,
-0.1038101, -2.360577, -1.780836, 0, 1, 0.6627451, 1,
-0.1003989, 0.07058038, 0.748553, 0, 1, 0.6705883, 1,
-0.0970695, 0.1146917, -1.395998, 0, 1, 0.6745098, 1,
-0.09644906, 0.8330961, 2.713122, 0, 1, 0.682353, 1,
-0.09190758, -0.8756039, -3.733964, 0, 1, 0.6862745, 1,
-0.08846174, -1.755162, -0.1906253, 0, 1, 0.6941177, 1,
-0.0824855, -0.840637, -3.570248, 0, 1, 0.7019608, 1,
-0.0766848, 1.343379, -0.0008028738, 0, 1, 0.7058824, 1,
-0.07663935, 0.6466236, 0.4401536, 0, 1, 0.7137255, 1,
-0.07637651, -0.9152005, -2.25601, 0, 1, 0.7176471, 1,
-0.07354632, -0.2034857, -3.545489, 0, 1, 0.7254902, 1,
-0.06870366, -0.9898601, -1.97663, 0, 1, 0.7294118, 1,
-0.06848594, 0.06168375, -0.7282097, 0, 1, 0.7372549, 1,
-0.06838671, 0.9195548, -0.1896133, 0, 1, 0.7411765, 1,
-0.06625885, 0.9258417, -0.6714167, 0, 1, 0.7490196, 1,
-0.06519181, -1.891524, -4.410223, 0, 1, 0.7529412, 1,
-0.06401922, -0.389112, -3.506376, 0, 1, 0.7607843, 1,
-0.06193439, -0.8427691, -3.428015, 0, 1, 0.7647059, 1,
-0.06051888, -0.1704947, -1.784166, 0, 1, 0.772549, 1,
-0.05206066, 0.4699723, 0.4517589, 0, 1, 0.7764706, 1,
-0.04743506, 2.322029, -0.1661692, 0, 1, 0.7843137, 1,
-0.04652414, -0.1358196, -4.026286, 0, 1, 0.7882353, 1,
-0.04530607, -0.6167169, -4.374632, 0, 1, 0.7960784, 1,
-0.0444613, 0.3087826, 0.286588, 0, 1, 0.8039216, 1,
-0.04363709, 0.643919, 0.1559463, 0, 1, 0.8078431, 1,
-0.038815, 1.296795, 1.037425, 0, 1, 0.8156863, 1,
-0.03603703, -0.1659234, -2.953726, 0, 1, 0.8196079, 1,
-0.03021358, -0.3858838, -3.986021, 0, 1, 0.827451, 1,
-0.02562837, -0.8064271, -3.895153, 0, 1, 0.8313726, 1,
-0.02289351, -1.290884, -3.287892, 0, 1, 0.8392157, 1,
-0.02190412, 0.09266682, 0.8075093, 0, 1, 0.8431373, 1,
-0.01634031, 0.5580058, -0.6183258, 0, 1, 0.8509804, 1,
-0.01563874, -0.09190163, -3.615483, 0, 1, 0.854902, 1,
-0.01552476, 0.9525636, 1.605023, 0, 1, 0.8627451, 1,
-0.01447367, 0.1952821, -0.2833068, 0, 1, 0.8666667, 1,
-0.01143002, -0.5738312, -3.608284, 0, 1, 0.8745098, 1,
-0.008756284, 1.143673, -0.3728212, 0, 1, 0.8784314, 1,
-0.007650343, -0.2660196, -2.785914, 0, 1, 0.8862745, 1,
-0.002526105, -0.06897196, -3.108392, 0, 1, 0.8901961, 1,
-0.0004208347, 1.111145, -0.3728612, 0, 1, 0.8980392, 1,
0.001823058, 0.4647309, -0.2798889, 0, 1, 0.9058824, 1,
0.005961078, -0.01559055, 3.529678, 0, 1, 0.9098039, 1,
0.009591204, -0.09303314, 3.36761, 0, 1, 0.9176471, 1,
0.009948223, -0.4473951, 2.451543, 0, 1, 0.9215686, 1,
0.01459202, 0.1626652, -0.09601141, 0, 1, 0.9294118, 1,
0.01519067, -2.406916, 2.86137, 0, 1, 0.9333333, 1,
0.01638037, -0.7993414, 1.713446, 0, 1, 0.9411765, 1,
0.01876258, 2.024075, 1.690267, 0, 1, 0.945098, 1,
0.01937826, -0.283118, 2.766511, 0, 1, 0.9529412, 1,
0.02330401, -1.131659, 1.476285, 0, 1, 0.9568627, 1,
0.02379023, 0.6852673, 1.59626, 0, 1, 0.9647059, 1,
0.02666247, -0.3725541, 2.503298, 0, 1, 0.9686275, 1,
0.02671429, 0.5834999, -0.4515245, 0, 1, 0.9764706, 1,
0.03838987, -1.048163, 2.650343, 0, 1, 0.9803922, 1,
0.03850865, 0.5546159, -0.523501, 0, 1, 0.9882353, 1,
0.04163517, -1.608572, 1.988666, 0, 1, 0.9921569, 1,
0.04259761, 1.851034, -0.6583998, 0, 1, 1, 1,
0.04267055, 1.561036, -0.003738519, 0, 0.9921569, 1, 1,
0.04272554, 0.6540502, -0.9068418, 0, 0.9882353, 1, 1,
0.04585692, -1.340198, 2.190026, 0, 0.9803922, 1, 1,
0.04724934, -1.164096, 3.482621, 0, 0.9764706, 1, 1,
0.04974222, 1.283905, -1.275558, 0, 0.9686275, 1, 1,
0.05009726, 0.4413116, 0.6882882, 0, 0.9647059, 1, 1,
0.05209417, 1.297798, -0.02098007, 0, 0.9568627, 1, 1,
0.05696847, -0.9687275, 3.251596, 0, 0.9529412, 1, 1,
0.05794255, 1.704815, 0.3714174, 0, 0.945098, 1, 1,
0.05832063, 1.234243, -1.018472, 0, 0.9411765, 1, 1,
0.06306492, 0.5720201, -0.04165524, 0, 0.9333333, 1, 1,
0.06321919, 0.8735947, 0.3528931, 0, 0.9294118, 1, 1,
0.06440109, 0.5542356, -0.3435049, 0, 0.9215686, 1, 1,
0.06506564, -0.04236726, 2.091431, 0, 0.9176471, 1, 1,
0.06535535, -0.8006501, 1.555137, 0, 0.9098039, 1, 1,
0.06764232, 2.58258, 0.9669127, 0, 0.9058824, 1, 1,
0.06768238, -0.7429689, 2.930361, 0, 0.8980392, 1, 1,
0.06898316, -0.5963274, 2.763152, 0, 0.8901961, 1, 1,
0.06908264, 0.8961593, 0.2301649, 0, 0.8862745, 1, 1,
0.0732872, 1.022813, -0.2511381, 0, 0.8784314, 1, 1,
0.07388262, 0.5871278, -0.4534974, 0, 0.8745098, 1, 1,
0.07747137, -1.174356, 4.840685, 0, 0.8666667, 1, 1,
0.07848177, -1.124342, 2.860218, 0, 0.8627451, 1, 1,
0.07907112, 0.4169956, -1.024135, 0, 0.854902, 1, 1,
0.07942154, 1.428223, -0.8106422, 0, 0.8509804, 1, 1,
0.08027032, -0.87358, 3.142097, 0, 0.8431373, 1, 1,
0.08753386, 0.9674703, 0.8191485, 0, 0.8392157, 1, 1,
0.08941938, -0.8769651, 4.552042, 0, 0.8313726, 1, 1,
0.09005895, -0.4829787, 2.810013, 0, 0.827451, 1, 1,
0.09488877, 0.1845787, -0.5679542, 0, 0.8196079, 1, 1,
0.09531772, -1.197476, 4.577582, 0, 0.8156863, 1, 1,
0.09781827, -1.294017, 2.40328, 0, 0.8078431, 1, 1,
0.1010934, -0.08209715, 1.590377, 0, 0.8039216, 1, 1,
0.1060675, 2.167673, 0.301514, 0, 0.7960784, 1, 1,
0.1063972, -0.3590822, 5.09781, 0, 0.7882353, 1, 1,
0.1187825, -0.8327996, 2.449883, 0, 0.7843137, 1, 1,
0.1188564, 0.6170551, -0.06170769, 0, 0.7764706, 1, 1,
0.1190405, -0.9093774, 1.805366, 0, 0.772549, 1, 1,
0.1225498, 0.7942958, 0.8747561, 0, 0.7647059, 1, 1,
0.1242155, 0.9151621, 0.02055206, 0, 0.7607843, 1, 1,
0.124636, -0.02888437, 2.555804, 0, 0.7529412, 1, 1,
0.125177, 0.2830309, 2.566857, 0, 0.7490196, 1, 1,
0.1282733, 0.9030495, 0.8628461, 0, 0.7411765, 1, 1,
0.1295793, 0.7556421, -0.475515, 0, 0.7372549, 1, 1,
0.1302468, -0.4437201, 2.397966, 0, 0.7294118, 1, 1,
0.1308422, -0.6350138, 1.979938, 0, 0.7254902, 1, 1,
0.1389809, -0.5219307, 1.664477, 0, 0.7176471, 1, 1,
0.140975, 0.1162233, 1.638773, 0, 0.7137255, 1, 1,
0.1416254, -0.8233672, 3.116261, 0, 0.7058824, 1, 1,
0.1418352, 0.8267011, 0.0996831, 0, 0.6980392, 1, 1,
0.1427406, 0.5365595, 1.869714, 0, 0.6941177, 1, 1,
0.1461202, 0.8378092, 1.456475, 0, 0.6862745, 1, 1,
0.1461886, 0.5867891, -0.8179409, 0, 0.682353, 1, 1,
0.1498307, 2.073155, 0.737607, 0, 0.6745098, 1, 1,
0.1524138, 0.2694835, 1.33224, 0, 0.6705883, 1, 1,
0.1574575, -2.536088, 3.898355, 0, 0.6627451, 1, 1,
0.1609051, -0.6444401, 6.019296, 0, 0.6588235, 1, 1,
0.1640683, -1.020248, 5.243075, 0, 0.6509804, 1, 1,
0.1647223, 0.2572215, 1.449165, 0, 0.6470588, 1, 1,
0.1659958, 1.596288, 0.4314496, 0, 0.6392157, 1, 1,
0.1738737, 0.8749836, 1.255053, 0, 0.6352941, 1, 1,
0.1751618, -0.2486116, 2.149667, 0, 0.627451, 1, 1,
0.1753706, -0.4935353, 3.813965, 0, 0.6235294, 1, 1,
0.1786563, 0.8505962, -0.4195012, 0, 0.6156863, 1, 1,
0.180451, -0.6852171, 3.654467, 0, 0.6117647, 1, 1,
0.1817067, 0.5541509, -0.2181685, 0, 0.6039216, 1, 1,
0.1827785, 0.1471061, 0.6052867, 0, 0.5960785, 1, 1,
0.1837453, 0.6053343, -0.3817999, 0, 0.5921569, 1, 1,
0.1864001, -0.04316422, 2.018595, 0, 0.5843138, 1, 1,
0.1865947, -1.078649, 3.792371, 0, 0.5803922, 1, 1,
0.1875167, -0.658896, 3.969784, 0, 0.572549, 1, 1,
0.1897662, 0.1975969, 0.9999105, 0, 0.5686275, 1, 1,
0.1918752, -0.4322527, 2.94095, 0, 0.5607843, 1, 1,
0.1919679, -0.8123071, 0.8019195, 0, 0.5568628, 1, 1,
0.1943648, 0.09227867, 0.7543154, 0, 0.5490196, 1, 1,
0.1959545, -1.304683, 5.910087, 0, 0.5450981, 1, 1,
0.1982226, 0.5509866, -1.615865, 0, 0.5372549, 1, 1,
0.2003617, -1.240282, 3.419917, 0, 0.5333334, 1, 1,
0.2021004, 0.742336, 1.186671, 0, 0.5254902, 1, 1,
0.2054628, 0.653527, 1.089388, 0, 0.5215687, 1, 1,
0.2142623, -0.2026469, 1.668933, 0, 0.5137255, 1, 1,
0.217498, 1.310419, -2.045435, 0, 0.509804, 1, 1,
0.2184729, -1.408271, 2.41126, 0, 0.5019608, 1, 1,
0.2203462, -1.366398, 4.533453, 0, 0.4941176, 1, 1,
0.2277543, 1.419108, 1.509308, 0, 0.4901961, 1, 1,
0.2283353, -1.408865, 2.338564, 0, 0.4823529, 1, 1,
0.2307444, -0.2790729, 2.871768, 0, 0.4784314, 1, 1,
0.2373938, -0.02561859, 1.834133, 0, 0.4705882, 1, 1,
0.2374373, -0.06671605, 1.930531, 0, 0.4666667, 1, 1,
0.238238, -1.038842, 2.901785, 0, 0.4588235, 1, 1,
0.2441609, -1.676543, 2.735612, 0, 0.454902, 1, 1,
0.2443323, 0.6134585, 1.174631, 0, 0.4470588, 1, 1,
0.2461977, 1.364852, 0.4917432, 0, 0.4431373, 1, 1,
0.2466047, 1.574538, 0.8542226, 0, 0.4352941, 1, 1,
0.2527323, -0.07104614, 0.3233241, 0, 0.4313726, 1, 1,
0.2548844, -1.09993, 2.837605, 0, 0.4235294, 1, 1,
0.2569762, 0.4135343, -0.1966138, 0, 0.4196078, 1, 1,
0.263886, -0.7259046, 3.497002, 0, 0.4117647, 1, 1,
0.2640111, 0.05581814, 2.667583, 0, 0.4078431, 1, 1,
0.2653097, 0.2528297, 0.6986096, 0, 0.4, 1, 1,
0.2660994, -0.1078873, 1.388954, 0, 0.3921569, 1, 1,
0.2688865, 0.4906191, -0.2738802, 0, 0.3882353, 1, 1,
0.2730581, -0.1459452, 0.89765, 0, 0.3803922, 1, 1,
0.2748047, -0.7097104, 2.633893, 0, 0.3764706, 1, 1,
0.2758952, 0.5239747, -1.556848, 0, 0.3686275, 1, 1,
0.2776181, 0.005360794, 1.957919, 0, 0.3647059, 1, 1,
0.2805853, -1.115828, 4.063807, 0, 0.3568628, 1, 1,
0.2824682, 0.1229281, 0.4747548, 0, 0.3529412, 1, 1,
0.2863619, 0.09577088, 1.765663, 0, 0.345098, 1, 1,
0.2879367, 0.7180203, 0.7065323, 0, 0.3411765, 1, 1,
0.2897087, 0.9365112, 1.353655, 0, 0.3333333, 1, 1,
0.2912799, 1.101408, 0.9160456, 0, 0.3294118, 1, 1,
0.2950565, 0.1487934, 2.107728, 0, 0.3215686, 1, 1,
0.2960293, -0.6875618, 3.624489, 0, 0.3176471, 1, 1,
0.29838, -0.4619145, 2.077889, 0, 0.3098039, 1, 1,
0.2989254, -0.3449725, 0.9766434, 0, 0.3058824, 1, 1,
0.3050195, -1.898699, 1.692278, 0, 0.2980392, 1, 1,
0.3078498, 1.758397, 1.439685, 0, 0.2901961, 1, 1,
0.3094969, 0.3492349, 0.1763745, 0, 0.2862745, 1, 1,
0.3170723, -0.3433416, 4.600574, 0, 0.2784314, 1, 1,
0.317229, -0.6282278, 2.624636, 0, 0.2745098, 1, 1,
0.3178527, 0.4024323, 1.724618, 0, 0.2666667, 1, 1,
0.3180895, 1.112695, 0.5610146, 0, 0.2627451, 1, 1,
0.3194295, 0.6364769, 2.148204, 0, 0.254902, 1, 1,
0.320772, -0.2968767, 2.694408, 0, 0.2509804, 1, 1,
0.327312, 0.686954, 0.01520834, 0, 0.2431373, 1, 1,
0.3300415, 1.172232, 0.9717512, 0, 0.2392157, 1, 1,
0.3336234, -1.536923, 2.172404, 0, 0.2313726, 1, 1,
0.3366042, 0.6574512, 1.098065, 0, 0.227451, 1, 1,
0.3475538, 0.1032399, 1.203091, 0, 0.2196078, 1, 1,
0.3540092, -0.3048888, 2.699736, 0, 0.2156863, 1, 1,
0.3555727, 1.215645, 0.5238376, 0, 0.2078431, 1, 1,
0.3576353, 1.144403, 0.767212, 0, 0.2039216, 1, 1,
0.359614, -0.7254254, 2.928242, 0, 0.1960784, 1, 1,
0.3615411, 2.423007, -0.6996816, 0, 0.1882353, 1, 1,
0.3682536, -0.2965434, 1.809853, 0, 0.1843137, 1, 1,
0.3694627, 0.3834217, -0.05520692, 0, 0.1764706, 1, 1,
0.3694861, 0.4549879, 1.500737, 0, 0.172549, 1, 1,
0.3719929, 1.328493, -0.2756932, 0, 0.1647059, 1, 1,
0.3722352, -0.236658, 1.943836, 0, 0.1607843, 1, 1,
0.373019, -2.119518, 0.4572448, 0, 0.1529412, 1, 1,
0.3806621, 2.114147, -1.453333, 0, 0.1490196, 1, 1,
0.3852971, 0.8893445, 0.323152, 0, 0.1411765, 1, 1,
0.3861457, 0.08089966, 2.491462, 0, 0.1372549, 1, 1,
0.3883665, 1.135328, 0.01382605, 0, 0.1294118, 1, 1,
0.3888609, -1.103883, 2.350197, 0, 0.1254902, 1, 1,
0.3902045, 0.166299, 0.8182393, 0, 0.1176471, 1, 1,
0.3944024, -0.8863702, 2.831219, 0, 0.1137255, 1, 1,
0.3945591, -1.306035, 1.554339, 0, 0.1058824, 1, 1,
0.3979313, -1.336968, 2.60891, 0, 0.09803922, 1, 1,
0.4064544, 2.276137, -0.05411856, 0, 0.09411765, 1, 1,
0.4121265, -0.3005721, 1.763658, 0, 0.08627451, 1, 1,
0.4151032, 2.698721, -0.3943737, 0, 0.08235294, 1, 1,
0.4152999, 0.3878067, 0.830012, 0, 0.07450981, 1, 1,
0.4164748, -0.3086561, 1.92856, 0, 0.07058824, 1, 1,
0.417349, 0.5462846, -0.07230991, 0, 0.0627451, 1, 1,
0.4231845, 1.129099, 1.349814, 0, 0.05882353, 1, 1,
0.4245386, 0.123581, 3.13869, 0, 0.05098039, 1, 1,
0.42589, -0.8183927, 1.79854, 0, 0.04705882, 1, 1,
0.4271908, -0.337147, 1.692073, 0, 0.03921569, 1, 1,
0.4289547, 1.410683, 1.54577, 0, 0.03529412, 1, 1,
0.4295465, 1.851918, 1.984403, 0, 0.02745098, 1, 1,
0.4310612, -1.000212, 2.456481, 0, 0.02352941, 1, 1,
0.4310681, 1.418945, -0.331632, 0, 0.01568628, 1, 1,
0.4348444, -0.6301931, 2.673175, 0, 0.01176471, 1, 1,
0.4357467, 0.6151422, -0.1151112, 0, 0.003921569, 1, 1,
0.4373718, 1.557079, -0.6493863, 0.003921569, 0, 1, 1,
0.4384704, -2.106765, 4.339432, 0.007843138, 0, 1, 1,
0.4394664, -0.257852, 1.177036, 0.01568628, 0, 1, 1,
0.4462816, 0.3800093, -0.7504786, 0.01960784, 0, 1, 1,
0.4538667, 0.5277495, 0.2114147, 0.02745098, 0, 1, 1,
0.4547954, 0.6611103, 0.2185123, 0.03137255, 0, 1, 1,
0.4554153, 0.2759009, 1.438454, 0.03921569, 0, 1, 1,
0.4562611, -1.00135, 1.393119, 0.04313726, 0, 1, 1,
0.4619116, -0.3968275, 2.466333, 0.05098039, 0, 1, 1,
0.4625967, -0.533281, 0.6737055, 0.05490196, 0, 1, 1,
0.4660128, -1.369695, 1.90538, 0.0627451, 0, 1, 1,
0.4702514, -0.3768258, 1.803125, 0.06666667, 0, 1, 1,
0.4756753, 0.02583473, 0.8641453, 0.07450981, 0, 1, 1,
0.4768411, -0.3257411, 4.496988, 0.07843138, 0, 1, 1,
0.4783172, 0.422418, 0.9837822, 0.08627451, 0, 1, 1,
0.4784412, 1.072503, 0.529016, 0.09019608, 0, 1, 1,
0.4786415, -2.18471, 3.104824, 0.09803922, 0, 1, 1,
0.4791178, 0.9549034, 1.509094, 0.1058824, 0, 1, 1,
0.4812177, 1.271603, 0.7627628, 0.1098039, 0, 1, 1,
0.484851, 1.356893, -0.686752, 0.1176471, 0, 1, 1,
0.487413, -0.3101645, 1.961938, 0.1215686, 0, 1, 1,
0.4882362, -0.3125958, 3.380643, 0.1294118, 0, 1, 1,
0.4890431, -1.884026, 1.373214, 0.1333333, 0, 1, 1,
0.4905667, -0.6181678, 2.481507, 0.1411765, 0, 1, 1,
0.4937963, 0.9245536, -1.415243, 0.145098, 0, 1, 1,
0.4990164, 2.125919, -0.3052687, 0.1529412, 0, 1, 1,
0.5042385, 0.3038923, 1.147118, 0.1568628, 0, 1, 1,
0.5061542, 1.38296, 1.326907, 0.1647059, 0, 1, 1,
0.5138404, 2.430431, 1.643464, 0.1686275, 0, 1, 1,
0.5146638, 1.170777, -1.131451, 0.1764706, 0, 1, 1,
0.5150625, 0.7448202, 1.56973, 0.1803922, 0, 1, 1,
0.5249693, 0.02749671, 2.197454, 0.1882353, 0, 1, 1,
0.5275531, 0.9623721, 1.098461, 0.1921569, 0, 1, 1,
0.5345016, -1.79364, 3.62894, 0.2, 0, 1, 1,
0.5394477, 0.4923754, -0.8237532, 0.2078431, 0, 1, 1,
0.540709, -0.7254943, 4.345414, 0.2117647, 0, 1, 1,
0.5411621, -1.220776, 1.969191, 0.2196078, 0, 1, 1,
0.5415693, -0.3717803, 2.393078, 0.2235294, 0, 1, 1,
0.5424372, 0.9117233, 0.3085179, 0.2313726, 0, 1, 1,
0.5431184, -1.028532, 3.15543, 0.2352941, 0, 1, 1,
0.5437404, -1.051777, 3.869572, 0.2431373, 0, 1, 1,
0.5469008, -0.3487901, 1.74658, 0.2470588, 0, 1, 1,
0.5527748, -0.8271285, 1.878021, 0.254902, 0, 1, 1,
0.5651631, 0.7393343, 0.2592827, 0.2588235, 0, 1, 1,
0.5660251, 1.175451, 0.762101, 0.2666667, 0, 1, 1,
0.5664412, -0.01131009, 2.590999, 0.2705882, 0, 1, 1,
0.5668537, -0.2667094, -0.01888555, 0.2784314, 0, 1, 1,
0.5698045, 0.664631, 0.9577483, 0.282353, 0, 1, 1,
0.5703208, 1.378575, 0.07732014, 0.2901961, 0, 1, 1,
0.5733253, 2.28071, -0.9097303, 0.2941177, 0, 1, 1,
0.5800033, -0.000385009, 4.740992, 0.3019608, 0, 1, 1,
0.5840358, -1.295634, 2.808653, 0.3098039, 0, 1, 1,
0.5869237, -1.294847, 2.77541, 0.3137255, 0, 1, 1,
0.5880733, -0.1185061, 2.642494, 0.3215686, 0, 1, 1,
0.5882665, 0.9800701, 1.648268, 0.3254902, 0, 1, 1,
0.5888074, -2.029087, 2.414031, 0.3333333, 0, 1, 1,
0.5936379, -0.6320292, 2.819199, 0.3372549, 0, 1, 1,
0.5980074, 0.3277302, -1.402707, 0.345098, 0, 1, 1,
0.6006445, 1.475982, 1.360072, 0.3490196, 0, 1, 1,
0.600715, -0.5159936, 2.298743, 0.3568628, 0, 1, 1,
0.6030182, 0.9094984, 0.1641153, 0.3607843, 0, 1, 1,
0.6040677, -0.6741907, 3.003228, 0.3686275, 0, 1, 1,
0.6074899, 0.02543332, 0.2907538, 0.372549, 0, 1, 1,
0.6104456, 0.2011715, -0.3088016, 0.3803922, 0, 1, 1,
0.6106127, 0.844071, 1.762738, 0.3843137, 0, 1, 1,
0.6126325, -1.823404, 3.122707, 0.3921569, 0, 1, 1,
0.6151246, 1.251821, -0.7292053, 0.3960784, 0, 1, 1,
0.6186532, -1.18256, 3.380925, 0.4039216, 0, 1, 1,
0.6189455, -0.6378647, 3.184575, 0.4117647, 0, 1, 1,
0.622086, 2.366054, -2.721168, 0.4156863, 0, 1, 1,
0.6235455, 0.9018337, 0.6078094, 0.4235294, 0, 1, 1,
0.6265332, -0.4266184, 2.738115, 0.427451, 0, 1, 1,
0.6268321, -0.02909854, -0.03313226, 0.4352941, 0, 1, 1,
0.6287521, 0.7315405, 0.8686548, 0.4392157, 0, 1, 1,
0.6299137, -0.4104276, 2.479707, 0.4470588, 0, 1, 1,
0.6415815, 0.1979944, 1.299525, 0.4509804, 0, 1, 1,
0.648783, -0.173073, 1.588206, 0.4588235, 0, 1, 1,
0.6522115, -0.3094399, 1.580288, 0.4627451, 0, 1, 1,
0.6562812, -2.465042, 4.609853, 0.4705882, 0, 1, 1,
0.665679, -0.05847032, 1.122783, 0.4745098, 0, 1, 1,
0.6668208, -1.668298, 3.00405, 0.4823529, 0, 1, 1,
0.6675952, 1.440357, -0.01817864, 0.4862745, 0, 1, 1,
0.6703659, 1.156194, 0.4659124, 0.4941176, 0, 1, 1,
0.6759869, -0.9764192, 3.368724, 0.5019608, 0, 1, 1,
0.6776853, 2.259845, 0.1951362, 0.5058824, 0, 1, 1,
0.67905, -1.921088, 4.157892, 0.5137255, 0, 1, 1,
0.6808182, -0.2121233, 2.126671, 0.5176471, 0, 1, 1,
0.6831129, -0.2125799, 0.7221975, 0.5254902, 0, 1, 1,
0.6831372, 1.291139, -1.884411, 0.5294118, 0, 1, 1,
0.6973432, -1.803147, 1.181713, 0.5372549, 0, 1, 1,
0.6979664, 0.5243697, 1.922446, 0.5411765, 0, 1, 1,
0.6992229, -0.3989114, 0.8721356, 0.5490196, 0, 1, 1,
0.7048439, 0.3168941, -0.3448465, 0.5529412, 0, 1, 1,
0.7054043, 0.7496331, -0.0807272, 0.5607843, 0, 1, 1,
0.7076206, -0.524603, 0.496648, 0.5647059, 0, 1, 1,
0.7141175, -0.1861473, 2.189131, 0.572549, 0, 1, 1,
0.7186041, 0.1969192, 1.741097, 0.5764706, 0, 1, 1,
0.7207103, -0.8727285, 1.639516, 0.5843138, 0, 1, 1,
0.7209337, -0.3147008, 0.4004236, 0.5882353, 0, 1, 1,
0.7269178, 0.4525486, 0.135064, 0.5960785, 0, 1, 1,
0.7317727, 0.3709908, 1.278157, 0.6039216, 0, 1, 1,
0.7339483, -0.2126972, 0.7711248, 0.6078432, 0, 1, 1,
0.7398144, 1.523791, 0.8995069, 0.6156863, 0, 1, 1,
0.740805, -0.4100244, 2.696878, 0.6196079, 0, 1, 1,
0.7484436, -1.365173, 4.146267, 0.627451, 0, 1, 1,
0.7493035, 1.488163, 0.3776872, 0.6313726, 0, 1, 1,
0.7502841, 0.03151769, -0.287015, 0.6392157, 0, 1, 1,
0.7534077, 1.488431, 0.4592939, 0.6431373, 0, 1, 1,
0.7545243, 0.7681005, 0.8060809, 0.6509804, 0, 1, 1,
0.76163, 0.03671515, 0.9773794, 0.654902, 0, 1, 1,
0.7622301, 0.4007677, 0.6450151, 0.6627451, 0, 1, 1,
0.7639328, 0.06958744, -0.8518413, 0.6666667, 0, 1, 1,
0.7663854, 1.548786, 1.216962, 0.6745098, 0, 1, 1,
0.7693523, -0.1812225, 3.130701, 0.6784314, 0, 1, 1,
0.7706786, -0.6242128, 2.760849, 0.6862745, 0, 1, 1,
0.7756179, -1.385448, 3.164469, 0.6901961, 0, 1, 1,
0.77843, -0.02242431, 3.726278, 0.6980392, 0, 1, 1,
0.8012233, 1.520057, 0.001502532, 0.7058824, 0, 1, 1,
0.8022195, -0.1754374, 1.830758, 0.7098039, 0, 1, 1,
0.8058617, -0.3267612, 2.491847, 0.7176471, 0, 1, 1,
0.8123089, 0.8092217, 1.756962, 0.7215686, 0, 1, 1,
0.8134281, -2.554113, 3.886737, 0.7294118, 0, 1, 1,
0.8146785, 1.021703, 2.016502, 0.7333333, 0, 1, 1,
0.8164808, -0.3533725, 3.251302, 0.7411765, 0, 1, 1,
0.8250049, 1.162923, 0.2262152, 0.7450981, 0, 1, 1,
0.825383, 0.7278415, 0.6309256, 0.7529412, 0, 1, 1,
0.8286849, 0.1459138, 0.7198018, 0.7568628, 0, 1, 1,
0.8322493, -1.826926, 4.094187, 0.7647059, 0, 1, 1,
0.8325076, 1.07137, -0.1608132, 0.7686275, 0, 1, 1,
0.8326246, -0.07969926, 1.432805, 0.7764706, 0, 1, 1,
0.8331213, 0.420632, 0.1235816, 0.7803922, 0, 1, 1,
0.8332401, -2.791827, 2.72619, 0.7882353, 0, 1, 1,
0.8350526, -0.1067599, 1.322301, 0.7921569, 0, 1, 1,
0.8358694, 0.3057355, 0.7883309, 0.8, 0, 1, 1,
0.8364705, 1.041854, 0.3525205, 0.8078431, 0, 1, 1,
0.8368818, 0.1893492, 1.023312, 0.8117647, 0, 1, 1,
0.8388549, 0.1007387, -1.600082, 0.8196079, 0, 1, 1,
0.8433895, -1.142495, 1.845991, 0.8235294, 0, 1, 1,
0.844501, 0.1399283, 0.9406042, 0.8313726, 0, 1, 1,
0.8538347, 0.7169903, 0.8648714, 0.8352941, 0, 1, 1,
0.8621721, -1.00138, 2.160214, 0.8431373, 0, 1, 1,
0.8626179, 2.157871, 0.8403569, 0.8470588, 0, 1, 1,
0.8635669, 0.3626929, 1.144744, 0.854902, 0, 1, 1,
0.8695002, -0.2959855, 3.474264, 0.8588235, 0, 1, 1,
0.8705902, -0.6770648, 4.224758, 0.8666667, 0, 1, 1,
0.8766888, -0.6031335, 1.18535, 0.8705882, 0, 1, 1,
0.8782127, -1.398645, 1.985136, 0.8784314, 0, 1, 1,
0.8811722, -1.580902, 1.877182, 0.8823529, 0, 1, 1,
0.8826038, -0.2187771, 1.289862, 0.8901961, 0, 1, 1,
0.8830742, -0.7082441, 3.46924, 0.8941177, 0, 1, 1,
0.8899847, 0.6233248, 1.892725, 0.9019608, 0, 1, 1,
0.8901761, 0.9621627, 1.533061, 0.9098039, 0, 1, 1,
0.8934136, 0.5829969, -1.434436, 0.9137255, 0, 1, 1,
0.8979475, -0.4630759, 1.532904, 0.9215686, 0, 1, 1,
0.8999475, 2.114869, 1.594082, 0.9254902, 0, 1, 1,
0.9011936, -1.413999, 3.175591, 0.9333333, 0, 1, 1,
0.90194, 0.9121019, 3.658538, 0.9372549, 0, 1, 1,
0.9040568, -0.6917586, 1.444858, 0.945098, 0, 1, 1,
0.9174551, -1.543492, 2.278415, 0.9490196, 0, 1, 1,
0.9212363, 0.7123761, 0.7687945, 0.9568627, 0, 1, 1,
0.9213333, 1.879748, -0.8789124, 0.9607843, 0, 1, 1,
0.9216446, -1.46491, 2.50567, 0.9686275, 0, 1, 1,
0.9289394, 0.5036302, 0.8076677, 0.972549, 0, 1, 1,
0.9431981, -0.5423676, 3.809527, 0.9803922, 0, 1, 1,
0.9486286, -0.9619046, 3.338039, 0.9843137, 0, 1, 1,
0.9539858, -0.5188308, 2.374505, 0.9921569, 0, 1, 1,
0.9587678, -0.6215979, 2.880998, 0.9960784, 0, 1, 1,
0.9609843, -0.9642968, 2.843987, 1, 0, 0.9960784, 1,
0.9629517, -0.8102025, 2.475719, 1, 0, 0.9882353, 1,
0.9640706, -1.35713, 5.130569, 1, 0, 0.9843137, 1,
0.9647275, -0.02160562, 3.134135, 1, 0, 0.9764706, 1,
0.9658266, 0.2823663, 2.847135, 1, 0, 0.972549, 1,
0.9765569, -1.908464, 3.609865, 1, 0, 0.9647059, 1,
0.9810889, -0.6234997, 2.174145, 1, 0, 0.9607843, 1,
0.9859802, -0.6194603, 2.247407, 1, 0, 0.9529412, 1,
0.9886822, -0.08776651, 1.91574, 1, 0, 0.9490196, 1,
0.9916326, -0.1602217, 2.530401, 1, 0, 0.9411765, 1,
0.9924683, -0.5401917, 2.006843, 1, 0, 0.9372549, 1,
0.9951052, -1.731852, 2.518499, 1, 0, 0.9294118, 1,
0.9977022, 0.2514535, 2.148093, 1, 0, 0.9254902, 1,
0.9996231, -2.443272, 2.955472, 1, 0, 0.9176471, 1,
1.000586, 0.5158908, 2.650204, 1, 0, 0.9137255, 1,
1.006055, -1.620511, 1.741008, 1, 0, 0.9058824, 1,
1.014524, 1.259406, -0.5509689, 1, 0, 0.9019608, 1,
1.016268, 0.4060359, -1.3244, 1, 0, 0.8941177, 1,
1.018665, 0.5596961, 0.6380396, 1, 0, 0.8862745, 1,
1.022624, -1.333129, 2.916267, 1, 0, 0.8823529, 1,
1.024895, 0.7962471, -0.06915456, 1, 0, 0.8745098, 1,
1.026498, -0.8547159, 0.9115114, 1, 0, 0.8705882, 1,
1.030838, -0.8083598, 1.526756, 1, 0, 0.8627451, 1,
1.031573, -1.058368, 4.020333, 1, 0, 0.8588235, 1,
1.033109, 1.822647, -0.1437859, 1, 0, 0.8509804, 1,
1.035802, -0.482493, -0.2950519, 1, 0, 0.8470588, 1,
1.035871, -0.5861167, -0.3474376, 1, 0, 0.8392157, 1,
1.039999, 0.2036639, 1.332975, 1, 0, 0.8352941, 1,
1.042127, 1.015614, 0.9857832, 1, 0, 0.827451, 1,
1.044111, -0.2105821, 2.158517, 1, 0, 0.8235294, 1,
1.065743, -0.879719, 3.28621, 1, 0, 0.8156863, 1,
1.068448, 0.3631611, 0.4332147, 1, 0, 0.8117647, 1,
1.07757, 1.160694, 0.6801051, 1, 0, 0.8039216, 1,
1.0823, -0.06409528, 1.009941, 1, 0, 0.7960784, 1,
1.086497, -1.605997, 3.576441, 1, 0, 0.7921569, 1,
1.087649, -0.8490948, 1.862418, 1, 0, 0.7843137, 1,
1.08857, 2.18294, 0.1630556, 1, 0, 0.7803922, 1,
1.106171, 0.2962738, 1.712567, 1, 0, 0.772549, 1,
1.108433, 0.3847653, 2.332171, 1, 0, 0.7686275, 1,
1.108894, -0.06144787, 2.776704, 1, 0, 0.7607843, 1,
1.116744, 0.9883082, 0.1417531, 1, 0, 0.7568628, 1,
1.120767, -0.8196474, 1.778248, 1, 0, 0.7490196, 1,
1.121167, -1.550906, 1.716724, 1, 0, 0.7450981, 1,
1.123565, -0.6650435, 2.069153, 1, 0, 0.7372549, 1,
1.124831, -0.8471565, 1.39348, 1, 0, 0.7333333, 1,
1.129717, -0.9799999, 2.504647, 1, 0, 0.7254902, 1,
1.136932, 0.3408703, 2.735283, 1, 0, 0.7215686, 1,
1.152146, 0.02030003, 1.467375, 1, 0, 0.7137255, 1,
1.158859, -0.1075734, 2.070456, 1, 0, 0.7098039, 1,
1.158882, -0.4039978, 2.656758, 1, 0, 0.7019608, 1,
1.171033, -2.61678, 3.724264, 1, 0, 0.6941177, 1,
1.183448, -1.41049, 2.890887, 1, 0, 0.6901961, 1,
1.187609, 1.11483, 0.2907324, 1, 0, 0.682353, 1,
1.198864, -0.4899322, 1.718571, 1, 0, 0.6784314, 1,
1.213874, 1.5513, -0.620583, 1, 0, 0.6705883, 1,
1.220365, 0.2218993, 2.666323, 1, 0, 0.6666667, 1,
1.224013, -1.646307, 1.868909, 1, 0, 0.6588235, 1,
1.224667, 0.09094329, 1.344677, 1, 0, 0.654902, 1,
1.228125, 0.645678, 1.592686, 1, 0, 0.6470588, 1,
1.23534, -0.787725, 3.118436, 1, 0, 0.6431373, 1,
1.249991, 0.1604027, 2.429176, 1, 0, 0.6352941, 1,
1.251381, 0.103347, 0.5034603, 1, 0, 0.6313726, 1,
1.254978, 0.6547164, 1.181494, 1, 0, 0.6235294, 1,
1.255766, 0.3058437, 1.029059, 1, 0, 0.6196079, 1,
1.260905, 0.3277664, 0.5119554, 1, 0, 0.6117647, 1,
1.263109, 0.01030067, 2.440513, 1, 0, 0.6078432, 1,
1.275269, -0.105234, 2.140392, 1, 0, 0.6, 1,
1.275973, -1.290781, -0.2301021, 1, 0, 0.5921569, 1,
1.276996, 2.203481, -0.9078856, 1, 0, 0.5882353, 1,
1.28252, -0.4427447, 3.144521, 1, 0, 0.5803922, 1,
1.288958, -0.1301017, 0.9659737, 1, 0, 0.5764706, 1,
1.291468, -0.7187898, 3.551979, 1, 0, 0.5686275, 1,
1.312984, -1.304429, 3.513103, 1, 0, 0.5647059, 1,
1.320143, -0.2455728, 2.416951, 1, 0, 0.5568628, 1,
1.324018, -0.3058577, 2.918403, 1, 0, 0.5529412, 1,
1.32696, 0.1158592, 1.561606, 1, 0, 0.5450981, 1,
1.335813, 0.4216727, 1.030924, 1, 0, 0.5411765, 1,
1.340659, -1.26208, 3.240875, 1, 0, 0.5333334, 1,
1.353983, 1.390082, 1.289897, 1, 0, 0.5294118, 1,
1.358512, 0.1376981, 3.132768, 1, 0, 0.5215687, 1,
1.358648, -2.403783, 1.379579, 1, 0, 0.5176471, 1,
1.358979, -0.3754314, 1.210139, 1, 0, 0.509804, 1,
1.369027, 0.4323966, 2.185729, 1, 0, 0.5058824, 1,
1.369159, -0.301549, 0.1027575, 1, 0, 0.4980392, 1,
1.379768, 0.5735856, 1.549067, 1, 0, 0.4901961, 1,
1.384021, -0.3641717, 1.432705, 1, 0, 0.4862745, 1,
1.390753, -1.192758, -0.3380339, 1, 0, 0.4784314, 1,
1.391494, 0.006135723, 1.391395, 1, 0, 0.4745098, 1,
1.391694, 0.002834936, 1.350985, 1, 0, 0.4666667, 1,
1.396428, 1.124316, 0.8036903, 1, 0, 0.4627451, 1,
1.398048, 0.8503903, -0.5165374, 1, 0, 0.454902, 1,
1.41655, -1.151851, 2.500252, 1, 0, 0.4509804, 1,
1.419868, -1.352899, -0.0955264, 1, 0, 0.4431373, 1,
1.433912, -1.626109, 2.928738, 1, 0, 0.4392157, 1,
1.435245, 2.028232, 0.1128135, 1, 0, 0.4313726, 1,
1.447621, 0.9184972, 1.370035, 1, 0, 0.427451, 1,
1.455353, 0.0589264, 2.499601, 1, 0, 0.4196078, 1,
1.461985, 0.3431973, -0.8034221, 1, 0, 0.4156863, 1,
1.462078, 0.3965474, 2.169534, 1, 0, 0.4078431, 1,
1.467263, -0.4332946, 1.666886, 1, 0, 0.4039216, 1,
1.486365, -0.4831118, 2.406044, 1, 0, 0.3960784, 1,
1.490817, 0.5498246, 0.05967875, 1, 0, 0.3882353, 1,
1.512826, 0.9015421, 1.11008, 1, 0, 0.3843137, 1,
1.513134, -0.380374, 1.098917, 1, 0, 0.3764706, 1,
1.52889, -0.9756458, 1.648408, 1, 0, 0.372549, 1,
1.532797, -1.643069, 1.142677, 1, 0, 0.3647059, 1,
1.554209, -1.78421, 2.180883, 1, 0, 0.3607843, 1,
1.557115, 0.3850977, 0.6691582, 1, 0, 0.3529412, 1,
1.563873, -0.9446936, 1.684326, 1, 0, 0.3490196, 1,
1.565464, 1.246588, 0.5470767, 1, 0, 0.3411765, 1,
1.591893, -0.4496998, 4.000103, 1, 0, 0.3372549, 1,
1.598781, -0.5051783, 2.26538, 1, 0, 0.3294118, 1,
1.619127, 0.9520417, 0.580802, 1, 0, 0.3254902, 1,
1.619144, -0.3418255, 1.496499, 1, 0, 0.3176471, 1,
1.622229, -0.7199205, 3.061369, 1, 0, 0.3137255, 1,
1.629961, 1.233, 1.288369, 1, 0, 0.3058824, 1,
1.630811, -0.4836974, 0.9015205, 1, 0, 0.2980392, 1,
1.647393, -0.1872459, 1.782877, 1, 0, 0.2941177, 1,
1.661557, 1.255436, 1.45069, 1, 0, 0.2862745, 1,
1.668658, 0.3032136, 1.659802, 1, 0, 0.282353, 1,
1.682301, -2.012712, 2.578662, 1, 0, 0.2745098, 1,
1.68723, 1.59365, 2.554775, 1, 0, 0.2705882, 1,
1.697381, 0.6651282, 0.7553377, 1, 0, 0.2627451, 1,
1.698152, 1.292799, 1.051833, 1, 0, 0.2588235, 1,
1.730443, 0.6326066, 0.1160186, 1, 0, 0.2509804, 1,
1.737428, 0.2581777, 1.236041, 1, 0, 0.2470588, 1,
1.750581, 1.101967, 0.8346856, 1, 0, 0.2392157, 1,
1.75581, -0.6216507, 2.482505, 1, 0, 0.2352941, 1,
1.759439, 2.176587, -1.288687, 1, 0, 0.227451, 1,
1.769665, -0.5250088, 0.8622596, 1, 0, 0.2235294, 1,
1.77552, -1.208752, 1.317031, 1, 0, 0.2156863, 1,
1.776673, 0.3316858, 0.907957, 1, 0, 0.2117647, 1,
1.802229, -1.018362, 1.691836, 1, 0, 0.2039216, 1,
1.815456, -0.2989477, 2.360715, 1, 0, 0.1960784, 1,
1.819741, -0.3221641, 2.018858, 1, 0, 0.1921569, 1,
1.83623, -0.7614505, 1.122493, 1, 0, 0.1843137, 1,
1.837711, -0.4282975, -0.3713156, 1, 0, 0.1803922, 1,
1.83841, 0.1486553, 2.059675, 1, 0, 0.172549, 1,
1.854847, 1.521539, -0.5148284, 1, 0, 0.1686275, 1,
1.857937, 1.064565, 0.1613099, 1, 0, 0.1607843, 1,
1.863262, -3.242889, 2.78311, 1, 0, 0.1568628, 1,
1.872397, 0.8086929, 1.797966, 1, 0, 0.1490196, 1,
1.872874, -0.3254444, 2.035623, 1, 0, 0.145098, 1,
1.896896, -0.9074439, 2.00386, 1, 0, 0.1372549, 1,
1.90857, -0.8776071, 2.84984, 1, 0, 0.1333333, 1,
1.915495, 1.22371, 1.705194, 1, 0, 0.1254902, 1,
1.964517, 0.4586595, 1.586885, 1, 0, 0.1215686, 1,
1.970417, 0.3428217, 0.7579463, 1, 0, 0.1137255, 1,
1.985402, 0.3671177, 2.404773, 1, 0, 0.1098039, 1,
2.014857, -0.3278381, 2.318627, 1, 0, 0.1019608, 1,
2.034379, 0.06234038, 1.162385, 1, 0, 0.09411765, 1,
2.086707, 0.6503664, 0.7563506, 1, 0, 0.09019608, 1,
2.105742, 0.8710057, 1.701631, 1, 0, 0.08235294, 1,
2.118814, -0.9665154, 3.28827, 1, 0, 0.07843138, 1,
2.140635, -0.05119836, 1.595592, 1, 0, 0.07058824, 1,
2.141613, 0.3156646, 0.04278773, 1, 0, 0.06666667, 1,
2.182055, -0.5151069, 1.072641, 1, 0, 0.05882353, 1,
2.212133, -0.7250956, 0.2889596, 1, 0, 0.05490196, 1,
2.236422, 1.009397, 1.261457, 1, 0, 0.04705882, 1,
2.363869, -0.3978151, 2.80011, 1, 0, 0.04313726, 1,
2.391112, -2.789554, 3.339912, 1, 0, 0.03529412, 1,
2.407709, -1.120771, 1.335987, 1, 0, 0.03137255, 1,
2.501635, 1.748322, 1.137803, 1, 0, 0.02352941, 1,
2.526958, 0.3106585, 1.825688, 1, 0, 0.01960784, 1,
2.656497, -0.8142389, 1.776988, 1, 0, 0.01176471, 1,
2.711679, 0.2468055, 1.193372, 1, 0, 0.007843138, 1
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
-0.2806293, -4.249992, -7.083952, 0, -0.5, 0.5, 0.5,
-0.2806293, -4.249992, -7.083952, 1, -0.5, 0.5, 0.5,
-0.2806293, -4.249992, -7.083952, 1, 1.5, 0.5, 0.5,
-0.2806293, -4.249992, -7.083952, 0, 1.5, 0.5, 0.5
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
-4.28733, -0.2720842, -7.083952, 0, -0.5, 0.5, 0.5,
-4.28733, -0.2720842, -7.083952, 1, -0.5, 0.5, 0.5,
-4.28733, -0.2720842, -7.083952, 1, 1.5, 0.5, 0.5,
-4.28733, -0.2720842, -7.083952, 0, 1.5, 0.5, 0.5
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
-4.28733, -4.249992, 0.4172232, 0, -0.5, 0.5, 0.5,
-4.28733, -4.249992, 0.4172232, 1, -0.5, 0.5, 0.5,
-4.28733, -4.249992, 0.4172232, 1, 1.5, 0.5, 0.5,
-4.28733, -4.249992, 0.4172232, 0, 1.5, 0.5, 0.5
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
-3, -3.332014, -5.352911,
2, -3.332014, -5.352911,
-3, -3.332014, -5.352911,
-3, -3.48501, -5.641418,
-2, -3.332014, -5.352911,
-2, -3.48501, -5.641418,
-1, -3.332014, -5.352911,
-1, -3.48501, -5.641418,
0, -3.332014, -5.352911,
0, -3.48501, -5.641418,
1, -3.332014, -5.352911,
1, -3.48501, -5.641418,
2, -3.332014, -5.352911,
2, -3.48501, -5.641418
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
-3, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
-3, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
-3, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
-3, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5,
-2, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
-2, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
-2, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
-2, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5,
-1, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
-1, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
-1, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
-1, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5,
0, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
0, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
0, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
0, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5,
1, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
1, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
1, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
1, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5,
2, -3.791003, -6.218431, 0, -0.5, 0.5, 0.5,
2, -3.791003, -6.218431, 1, -0.5, 0.5, 0.5,
2, -3.791003, -6.218431, 1, 1.5, 0.5, 0.5,
2, -3.791003, -6.218431, 0, 1.5, 0.5, 0.5
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
-3.362706, -3, -5.352911,
-3.362706, 2, -5.352911,
-3.362706, -3, -5.352911,
-3.51681, -3, -5.641418,
-3.362706, -2, -5.352911,
-3.51681, -2, -5.641418,
-3.362706, -1, -5.352911,
-3.51681, -1, -5.641418,
-3.362706, 0, -5.352911,
-3.51681, 0, -5.641418,
-3.362706, 1, -5.352911,
-3.51681, 1, -5.641418,
-3.362706, 2, -5.352911,
-3.51681, 2, -5.641418
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
-3.825018, -3, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, -3, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, -3, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, -3, -6.218431, 0, 1.5, 0.5, 0.5,
-3.825018, -2, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, -2, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, -2, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, -2, -6.218431, 0, 1.5, 0.5, 0.5,
-3.825018, -1, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, -1, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, -1, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, -1, -6.218431, 0, 1.5, 0.5, 0.5,
-3.825018, 0, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, 0, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, 0, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, 0, -6.218431, 0, 1.5, 0.5, 0.5,
-3.825018, 1, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, 1, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, 1, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, 1, -6.218431, 0, 1.5, 0.5, 0.5,
-3.825018, 2, -6.218431, 0, -0.5, 0.5, 0.5,
-3.825018, 2, -6.218431, 1, -0.5, 0.5, 0.5,
-3.825018, 2, -6.218431, 1, 1.5, 0.5, 0.5,
-3.825018, 2, -6.218431, 0, 1.5, 0.5, 0.5
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
-3.362706, -3.332014, -4,
-3.362706, -3.332014, 6,
-3.362706, -3.332014, -4,
-3.51681, -3.48501, -4,
-3.362706, -3.332014, -2,
-3.51681, -3.48501, -2,
-3.362706, -3.332014, 0,
-3.51681, -3.48501, 0,
-3.362706, -3.332014, 2,
-3.51681, -3.48501, 2,
-3.362706, -3.332014, 4,
-3.51681, -3.48501, 4,
-3.362706, -3.332014, 6,
-3.51681, -3.48501, 6
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
-3.825018, -3.791003, -4, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, -4, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, -4, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, -4, 0, 1.5, 0.5, 0.5,
-3.825018, -3.791003, -2, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, -2, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, -2, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, -2, 0, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 0, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 0, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 0, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 0, 0, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 2, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 2, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 2, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 2, 0, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 4, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 4, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 4, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 4, 0, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 6, 0, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 6, 1, -0.5, 0.5, 0.5,
-3.825018, -3.791003, 6, 1, 1.5, 0.5, 0.5,
-3.825018, -3.791003, 6, 0, 1.5, 0.5, 0.5
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
-3.362706, -3.332014, -5.352911,
-3.362706, 2.787845, -5.352911,
-3.362706, -3.332014, 6.187358,
-3.362706, 2.787845, 6.187358,
-3.362706, -3.332014, -5.352911,
-3.362706, -3.332014, 6.187358,
-3.362706, 2.787845, -5.352911,
-3.362706, 2.787845, 6.187358,
-3.362706, -3.332014, -5.352911,
2.801448, -3.332014, -5.352911,
-3.362706, -3.332014, 6.187358,
2.801448, -3.332014, 6.187358,
-3.362706, 2.787845, -5.352911,
2.801448, 2.787845, -5.352911,
-3.362706, 2.787845, 6.187358,
2.801448, 2.787845, 6.187358,
2.801448, -3.332014, -5.352911,
2.801448, 2.787845, -5.352911,
2.801448, -3.332014, 6.187358,
2.801448, 2.787845, 6.187358,
2.801448, -3.332014, -5.352911,
2.801448, -3.332014, 6.187358,
2.801448, 2.787845, -5.352911,
2.801448, 2.787845, 6.187358
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
var radius = 7.712781;
var distance = 34.31504;
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
mvMatrix.translate( 0.2806293, 0.2720842, -0.4172232 );
mvMatrix.scale( 1.352855, 1.362648, 0.7226183 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.31504);
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
BLASTICIDIN_S<-read.table("BLASTICIDIN_S.xyz")
```

```
## Error in read.table("BLASTICIDIN_S.xyz"): no lines available in input
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
-3.272937, 2.047842, -2.045801, 0, 0, 1, 1, 1,
-3.258719, 0.6242014, 0.1782492, 1, 0, 0, 1, 1,
-2.722368, -0.308913, -3.017727, 1, 0, 0, 1, 1,
-2.624783, 1.058247, -1.462033, 1, 0, 0, 1, 1,
-2.601741, -0.9288768, 0.1003456, 1, 0, 0, 1, 1,
-2.508151, 0.200257, -1.873163, 1, 0, 0, 1, 1,
-2.495703, -0.2782885, -0.5594956, 0, 0, 0, 1, 1,
-2.48041, 0.3276134, -0.2434627, 0, 0, 0, 1, 1,
-2.439544, -0.6863621, -3.471287, 0, 0, 0, 1, 1,
-2.347281, 0.4460836, -2.907442, 0, 0, 0, 1, 1,
-2.343579, 0.3864104, -0.8103044, 0, 0, 0, 1, 1,
-2.316169, 1.044966, -0.7338847, 0, 0, 0, 1, 1,
-2.302392, 1.311304, -0.7667803, 0, 0, 0, 1, 1,
-2.302307, -0.2838155, -1.304981, 1, 1, 1, 1, 1,
-2.289674, -0.3784257, -2.168099, 1, 1, 1, 1, 1,
-2.218083, 1.230754, -0.6709331, 1, 1, 1, 1, 1,
-2.205259, 0.5143307, -0.1318644, 1, 1, 1, 1, 1,
-2.145153, -0.4371025, -1.141141, 1, 1, 1, 1, 1,
-2.14368, 0.9487929, -0.2941479, 1, 1, 1, 1, 1,
-2.125077, 0.8970221, -1.329808, 1, 1, 1, 1, 1,
-2.087551, 0.104446, -1.548732, 1, 1, 1, 1, 1,
-2.077789, -0.08627465, -2.725149, 1, 1, 1, 1, 1,
-2.064087, 0.4257501, -2.000584, 1, 1, 1, 1, 1,
-2.041788, 0.3803519, -0.4409845, 1, 1, 1, 1, 1,
-1.959, -0.324824, -2.150224, 1, 1, 1, 1, 1,
-1.945992, -0.2757877, -2.657797, 1, 1, 1, 1, 1,
-1.897042, 1.515517, -1.813809, 1, 1, 1, 1, 1,
-1.874525, -1.303082, -3.139149, 1, 1, 1, 1, 1,
-1.864012, 1.090981, -2.394511, 0, 0, 1, 1, 1,
-1.860123, 0.5444199, -3.675079, 1, 0, 0, 1, 1,
-1.831259, 0.1186651, -0.9927809, 1, 0, 0, 1, 1,
-1.823155, -0.2849394, -1.860497, 1, 0, 0, 1, 1,
-1.822004, 1.093636, -1.43088, 1, 0, 0, 1, 1,
-1.820409, 0.7432818, -0.6226947, 1, 0, 0, 1, 1,
-1.814216, -0.2556863, -1.172052, 0, 0, 0, 1, 1,
-1.805941, -0.3169077, -2.080662, 0, 0, 0, 1, 1,
-1.788291, 1.177027, -1.427996, 0, 0, 0, 1, 1,
-1.780495, -1.143517, -1.001519, 0, 0, 0, 1, 1,
-1.779084, 0.7520084, 0.02646544, 0, 0, 0, 1, 1,
-1.776753, 1.169258, -0.6959985, 0, 0, 0, 1, 1,
-1.755883, 0.4371075, 0.1363607, 0, 0, 0, 1, 1,
-1.753428, 0.5069668, -2.632077, 1, 1, 1, 1, 1,
-1.743909, -0.919876, -3.400061, 1, 1, 1, 1, 1,
-1.723139, -0.9583647, -0.6393403, 1, 1, 1, 1, 1,
-1.718469, 1.26609, -1.397586, 1, 1, 1, 1, 1,
-1.704664, -0.2785383, -1.543248, 1, 1, 1, 1, 1,
-1.697968, 0.03342274, -1.636614, 1, 1, 1, 1, 1,
-1.696779, 0.8139295, -2.172373, 1, 1, 1, 1, 1,
-1.694379, 0.2076665, -1.672483, 1, 1, 1, 1, 1,
-1.679281, 0.1158981, -1.171105, 1, 1, 1, 1, 1,
-1.677692, 0.7208738, -1.767954, 1, 1, 1, 1, 1,
-1.675083, 0.9599367, -0.7593912, 1, 1, 1, 1, 1,
-1.671343, -0.9227215, -1.298274, 1, 1, 1, 1, 1,
-1.671329, 0.7062309, -1.046755, 1, 1, 1, 1, 1,
-1.660814, -0.2025278, -1.73623, 1, 1, 1, 1, 1,
-1.650508, 0.3219238, -0.2148237, 1, 1, 1, 1, 1,
-1.645664, 0.8564804, -1.732987, 0, 0, 1, 1, 1,
-1.633688, -1.147052, -0.9272633, 1, 0, 0, 1, 1,
-1.629152, -0.1809548, -0.5211618, 1, 0, 0, 1, 1,
-1.621782, -1.1675, -1.958428, 1, 0, 0, 1, 1,
-1.606082, -0.1793386, -1.109313, 1, 0, 0, 1, 1,
-1.599188, 0.5201793, -1.658909, 1, 0, 0, 1, 1,
-1.5914, -1.768724, -1.074956, 0, 0, 0, 1, 1,
-1.57846, -0.2484327, -0.3419152, 0, 0, 0, 1, 1,
-1.576839, 1.427939, -1.150931, 0, 0, 0, 1, 1,
-1.575041, -0.6525239, -2.432979, 0, 0, 0, 1, 1,
-1.56689, 0.008837111, -1.622488, 0, 0, 0, 1, 1,
-1.566761, 0.5814222, -1.479658, 0, 0, 0, 1, 1,
-1.560682, -0.0987537, -1.519129, 0, 0, 0, 1, 1,
-1.555548, 0.2597711, 0.1008264, 1, 1, 1, 1, 1,
-1.553348, 0.2640326, -1.52493, 1, 1, 1, 1, 1,
-1.549539, -0.6559774, -1.529297, 1, 1, 1, 1, 1,
-1.546977, 0.8981011, -1.757574, 1, 1, 1, 1, 1,
-1.543827, -1.299719, -1.386018, 1, 1, 1, 1, 1,
-1.536826, -1.373917, -3.479993, 1, 1, 1, 1, 1,
-1.532466, -0.0495353, -1.1541, 1, 1, 1, 1, 1,
-1.508988, -0.4059187, -2.396458, 1, 1, 1, 1, 1,
-1.492683, 0.6196829, -1.422145, 1, 1, 1, 1, 1,
-1.463053, -0.9857015, -2.145401, 1, 1, 1, 1, 1,
-1.462807, 1.179357, -0.8030764, 1, 1, 1, 1, 1,
-1.461881, -0.3727507, -1.764264, 1, 1, 1, 1, 1,
-1.460614, -1.143395, -2.66343, 1, 1, 1, 1, 1,
-1.448177, 0.5723116, -0.2021659, 1, 1, 1, 1, 1,
-1.437683, -0.2968115, -1.049019, 1, 1, 1, 1, 1,
-1.431992, 1.003873, -2.043368, 0, 0, 1, 1, 1,
-1.419692, 0.8708775, -0.09893145, 1, 0, 0, 1, 1,
-1.407213, 1.738035, -0.9771684, 1, 0, 0, 1, 1,
-1.386043, -1.031473, -2.703478, 1, 0, 0, 1, 1,
-1.385836, -0.245298, -0.7568247, 1, 0, 0, 1, 1,
-1.378577, -0.8297183, -0.9524865, 1, 0, 0, 1, 1,
-1.376073, 1.655639, 0.8340654, 0, 0, 0, 1, 1,
-1.371075, 0.9298965, -1.006614, 0, 0, 0, 1, 1,
-1.358028, 0.1664312, -1.880732, 0, 0, 0, 1, 1,
-1.350844, -0.6338698, -1.467836, 0, 0, 0, 1, 1,
-1.349317, 0.187876, -0.8142018, 0, 0, 0, 1, 1,
-1.346884, -0.9237167, -2.802678, 0, 0, 0, 1, 1,
-1.338513, -1.318572, -1.295141, 0, 0, 0, 1, 1,
-1.336603, 1.245291, -0.03585316, 1, 1, 1, 1, 1,
-1.332062, -0.05383221, -1.125056, 1, 1, 1, 1, 1,
-1.328214, -0.579375, -3.079328, 1, 1, 1, 1, 1,
-1.318226, -0.6760623, -1.570082, 1, 1, 1, 1, 1,
-1.316971, 0.4905267, -1.776464, 1, 1, 1, 1, 1,
-1.316259, 0.3351846, -1.882241, 1, 1, 1, 1, 1,
-1.315328, 0.01579112, -2.119341, 1, 1, 1, 1, 1,
-1.3018, -1.330923, -3.207075, 1, 1, 1, 1, 1,
-1.301032, -0.8969516, -2.901986, 1, 1, 1, 1, 1,
-1.298248, 0.4946621, -2.873663, 1, 1, 1, 1, 1,
-1.297437, -1.001999, -1.820399, 1, 1, 1, 1, 1,
-1.286651, -0.90416, -1.773137, 1, 1, 1, 1, 1,
-1.27587, -1.188471, -2.491647, 1, 1, 1, 1, 1,
-1.275298, -0.9670035, -0.5933014, 1, 1, 1, 1, 1,
-1.266522, 0.5226573, -0.8946553, 1, 1, 1, 1, 1,
-1.266119, 0.08037981, -2.003617, 0, 0, 1, 1, 1,
-1.265686, -0.04638894, -0.7781996, 1, 0, 0, 1, 1,
-1.257127, 1.508944, -1.864761, 1, 0, 0, 1, 1,
-1.24845, 0.4173237, 0.2151036, 1, 0, 0, 1, 1,
-1.231696, 0.7711483, -1.601653, 1, 0, 0, 1, 1,
-1.225634, 0.4752932, 0.363903, 1, 0, 0, 1, 1,
-1.200515, -2.269496, -1.993784, 0, 0, 0, 1, 1,
-1.199488, 2.413455, 1.114695, 0, 0, 0, 1, 1,
-1.198329, -0.02524676, 0.3458349, 0, 0, 0, 1, 1,
-1.187223, -0.9989618, -1.562005, 0, 0, 0, 1, 1,
-1.185516, 0.06545265, -2.026344, 0, 0, 0, 1, 1,
-1.182088, 0.200464, -2.395012, 0, 0, 0, 1, 1,
-1.174661, 0.5375459, -1.92952, 0, 0, 0, 1, 1,
-1.169608, -0.451657, -4.565722, 1, 1, 1, 1, 1,
-1.167842, 2.27528, -2.364777, 1, 1, 1, 1, 1,
-1.165319, -1.686984, -4.112229, 1, 1, 1, 1, 1,
-1.159721, 0.3855898, -0.2761935, 1, 1, 1, 1, 1,
-1.158573, 0.3547409, -0.07014055, 1, 1, 1, 1, 1,
-1.144049, -0.8211108, -2.760946, 1, 1, 1, 1, 1,
-1.136935, 0.6640034, -0.7057056, 1, 1, 1, 1, 1,
-1.132352, 0.218034, 0.02557348, 1, 1, 1, 1, 1,
-1.129234, -0.3083543, -1.2406, 1, 1, 1, 1, 1,
-1.127111, -0.5498934, -2.351814, 1, 1, 1, 1, 1,
-1.119275, 1.031436, 1.074941, 1, 1, 1, 1, 1,
-1.118207, 2.18519, -0.3029698, 1, 1, 1, 1, 1,
-1.109633, -0.6114941, -1.095452, 1, 1, 1, 1, 1,
-1.10198, -0.3677758, -2.886656, 1, 1, 1, 1, 1,
-1.098773, 0.765087, -3.407056, 1, 1, 1, 1, 1,
-1.096185, 0.2533608, -0.7531767, 0, 0, 1, 1, 1,
-1.094175, -0.007832413, -2.551047, 1, 0, 0, 1, 1,
-1.09411, 0.8923905, -2.865861, 1, 0, 0, 1, 1,
-1.091179, -1.897763, -2.719763, 1, 0, 0, 1, 1,
-1.089904, 1.118987, -1.980651, 1, 0, 0, 1, 1,
-1.089792, 0.5126244, -0.9840971, 1, 0, 0, 1, 1,
-1.082576, -0.4906901, -2.580074, 0, 0, 0, 1, 1,
-1.073103, -0.8089619, -1.712799, 0, 0, 0, 1, 1,
-1.072851, 0.7425116, -0.863485, 0, 0, 0, 1, 1,
-1.06091, 0.6159391, -1.846444, 0, 0, 0, 1, 1,
-1.057214, 0.3746904, -1.35019, 0, 0, 0, 1, 1,
-1.05715, -0.3921442, -1.081725, 0, 0, 0, 1, 1,
-1.057022, 0.6333772, -0.1295437, 0, 0, 0, 1, 1,
-1.055712, 1.254487, 1.204713, 1, 1, 1, 1, 1,
-1.054755, -0.2884429, -1.862211, 1, 1, 1, 1, 1,
-1.051416, 1.497276, -0.9146531, 1, 1, 1, 1, 1,
-1.04333, 0.1725472, -0.6491416, 1, 1, 1, 1, 1,
-1.042277, 0.4243179, -1.79003, 1, 1, 1, 1, 1,
-1.040313, 0.970954, -2.128993, 1, 1, 1, 1, 1,
-1.034817, -0.9966268, -2.813408, 1, 1, 1, 1, 1,
-1.022778, 1.051459, 0.4959916, 1, 1, 1, 1, 1,
-1.019824, 0.6875295, -0.1620893, 1, 1, 1, 1, 1,
-1.018496, -0.411056, -3.167842, 1, 1, 1, 1, 1,
-1.01838, 0.2216767, -1.024213, 1, 1, 1, 1, 1,
-1.008728, 1.160501, 1.512149, 1, 1, 1, 1, 1,
-1.002354, 0.8281853, -0.9338573, 1, 1, 1, 1, 1,
-0.9957616, 0.4818318, -0.6341598, 1, 1, 1, 1, 1,
-0.9925669, -0.2466944, -0.2832772, 1, 1, 1, 1, 1,
-0.963896, 0.07940991, -1.082725, 0, 0, 1, 1, 1,
-0.9634438, -0.2395472, -3.022869, 1, 0, 0, 1, 1,
-0.9566583, -0.2774394, -3.294445, 1, 0, 0, 1, 1,
-0.949871, -0.8702232, -3.435756, 1, 0, 0, 1, 1,
-0.9479812, -0.1126749, -0.5984088, 1, 0, 0, 1, 1,
-0.9299406, 0.374514, -1.183181, 1, 0, 0, 1, 1,
-0.927891, -0.6685742, -1.156464, 0, 0, 0, 1, 1,
-0.9258994, -0.4625474, -1.479081, 0, 0, 0, 1, 1,
-0.9252415, 1.356825, -1.351585, 0, 0, 0, 1, 1,
-0.9224814, 1.752458, -0.6883197, 0, 0, 0, 1, 1,
-0.9135297, -2.779263, -2.439882, 0, 0, 0, 1, 1,
-0.9105684, -1.588799, -3.797495, 0, 0, 0, 1, 1,
-0.9091151, 1.668719, -1.545776, 0, 0, 0, 1, 1,
-0.9048051, -0.4755192, -2.077445, 1, 1, 1, 1, 1,
-0.9039732, 1.522459, -2.469854, 1, 1, 1, 1, 1,
-0.8941224, -1.319905, -1.646821, 1, 1, 1, 1, 1,
-0.8926973, 0.7378323, -0.5902238, 1, 1, 1, 1, 1,
-0.8924397, -1.130895, -4.0659, 1, 1, 1, 1, 1,
-0.8833583, 0.6362026, -1.226413, 1, 1, 1, 1, 1,
-0.8717575, 1.007098, 0.07688908, 1, 1, 1, 1, 1,
-0.8707548, -0.5123746, -2.547107, 1, 1, 1, 1, 1,
-0.867385, -1.298671, -4.049839, 1, 1, 1, 1, 1,
-0.8665283, 0.8877932, -0.1981657, 1, 1, 1, 1, 1,
-0.8615712, 0.6005035, -0.9434422, 1, 1, 1, 1, 1,
-0.8568467, 1.349226, -0.3057719, 1, 1, 1, 1, 1,
-0.85642, 1.554789, 1.130177, 1, 1, 1, 1, 1,
-0.8557297, -1.128733, -1.796591, 1, 1, 1, 1, 1,
-0.8526152, 1.901637, 0.4855846, 1, 1, 1, 1, 1,
-0.8520797, 1.609658, -0.5651805, 0, 0, 1, 1, 1,
-0.849555, 1.192773, -0.507172, 1, 0, 0, 1, 1,
-0.8482839, -0.2083618, -2.654752, 1, 0, 0, 1, 1,
-0.8482593, 1.177431, -0.1116932, 1, 0, 0, 1, 1,
-0.8383428, 0.8458213, -3.041054, 1, 0, 0, 1, 1,
-0.8357571, -0.9350728, -1.601403, 1, 0, 0, 1, 1,
-0.833105, 1.987992, 0.6816084, 0, 0, 0, 1, 1,
-0.8315488, -0.05110366, -1.594542, 0, 0, 0, 1, 1,
-0.8304815, 0.1124883, -1.691482, 0, 0, 0, 1, 1,
-0.829424, 0.01352681, -0.6884159, 0, 0, 0, 1, 1,
-0.8292276, 1.587053, -0.5837784, 0, 0, 0, 1, 1,
-0.8290046, -2.179716, -1.898221, 0, 0, 0, 1, 1,
-0.827691, 1.080733, -1.957826, 0, 0, 0, 1, 1,
-0.823332, 0.4840789, -1.703046, 1, 1, 1, 1, 1,
-0.8226764, -1.878517, -3.208013, 1, 1, 1, 1, 1,
-0.8226448, 0.340546, -0.40672, 1, 1, 1, 1, 1,
-0.8217339, 0.2958347, -0.6433981, 1, 1, 1, 1, 1,
-0.820348, -0.6098443, -2.292779, 1, 1, 1, 1, 1,
-0.8069171, -2.14294, -3.599349, 1, 1, 1, 1, 1,
-0.7944456, 0.3513906, 0.23558, 1, 1, 1, 1, 1,
-0.7940977, -0.7061483, -1.448927, 1, 1, 1, 1, 1,
-0.7765667, -1.156151, -3.027491, 1, 1, 1, 1, 1,
-0.7751772, -0.5270125, -3.306847, 1, 1, 1, 1, 1,
-0.7745039, -0.002549572, -0.9107502, 1, 1, 1, 1, 1,
-0.7736902, -0.3923779, -2.517886, 1, 1, 1, 1, 1,
-0.7723886, 0.7887813, -0.8939421, 1, 1, 1, 1, 1,
-0.7714585, 0.4340384, -2.187741, 1, 1, 1, 1, 1,
-0.7675819, 0.05571049, -3.577049, 1, 1, 1, 1, 1,
-0.7675287, -0.01091008, -2.04272, 0, 0, 1, 1, 1,
-0.7591347, 0.07900766, -2.846258, 1, 0, 0, 1, 1,
-0.7591251, 0.359825, -3.283679, 1, 0, 0, 1, 1,
-0.7576518, -1.265943, -1.32974, 1, 0, 0, 1, 1,
-0.7473365, -1.416377, -1.606271, 1, 0, 0, 1, 1,
-0.7431181, 1.572702, -1.04131, 1, 0, 0, 1, 1,
-0.7408873, -0.08850522, -1.482508, 0, 0, 0, 1, 1,
-0.7387781, 0.2862851, -2.915122, 0, 0, 0, 1, 1,
-0.7343896, -0.925572, -1.547478, 0, 0, 0, 1, 1,
-0.7338517, -0.2651125, -1.981995, 0, 0, 0, 1, 1,
-0.7338508, -0.6068078, -2.604761, 0, 0, 0, 1, 1,
-0.7330917, 0.5203686, -0.3792773, 0, 0, 0, 1, 1,
-0.7322913, -1.254127, -2.152289, 0, 0, 0, 1, 1,
-0.7315154, -0.9650847, -2.547007, 1, 1, 1, 1, 1,
-0.7276015, 0.5493491, -3.590856, 1, 1, 1, 1, 1,
-0.7175416, -0.8963038, -1.446655, 1, 1, 1, 1, 1,
-0.7171392, 0.5714347, -2.112287, 1, 1, 1, 1, 1,
-0.7158628, 0.561276, -0.8040972, 1, 1, 1, 1, 1,
-0.7138168, 1.998935, -0.5299394, 1, 1, 1, 1, 1,
-0.7110856, 0.8386934, -1.112032, 1, 1, 1, 1, 1,
-0.7085989, -0.9856979, -2.136327, 1, 1, 1, 1, 1,
-0.7066553, 1.697515, -0.9634452, 1, 1, 1, 1, 1,
-0.7056375, 0.0870905, 0.1615745, 1, 1, 1, 1, 1,
-0.7049903, 0.5647751, 0.260795, 1, 1, 1, 1, 1,
-0.6988183, -0.2250121, -2.663726, 1, 1, 1, 1, 1,
-0.6971669, -0.8785779, -3.552615, 1, 1, 1, 1, 1,
-0.6950753, -1.658375, -5.143734, 1, 1, 1, 1, 1,
-0.6949462, 0.03634904, -1.640723, 1, 1, 1, 1, 1,
-0.6931915, 0.04789355, -2.748138, 0, 0, 1, 1, 1,
-0.6906158, 0.3277623, -2.521344, 1, 0, 0, 1, 1,
-0.6901842, 1.191228, 0.2330932, 1, 0, 0, 1, 1,
-0.6863928, -0.4205003, 0.374823, 1, 0, 0, 1, 1,
-0.6861582, -1.354164, -5.184849, 1, 0, 0, 1, 1,
-0.6825247, 0.7848865, -0.03461727, 1, 0, 0, 1, 1,
-0.6802397, -0.7392579, -2.564596, 0, 0, 0, 1, 1,
-0.6726553, -1.122542, -3.871774, 0, 0, 0, 1, 1,
-0.6660485, 0.3667257, -1.533484, 0, 0, 0, 1, 1,
-0.6649053, 0.0907606, -2.751683, 0, 0, 0, 1, 1,
-0.6625141, -0.4979446, -3.469418, 0, 0, 0, 1, 1,
-0.6622903, 0.2034307, -1.363497, 0, 0, 0, 1, 1,
-0.6594836, 0.5854956, -1.600279, 0, 0, 0, 1, 1,
-0.6540554, 0.817661, -1.35784, 1, 1, 1, 1, 1,
-0.64978, -0.8192205, -2.788193, 1, 1, 1, 1, 1,
-0.6481538, -0.2587816, -0.6925302, 1, 1, 1, 1, 1,
-0.6481349, -0.3578716, -2.822177, 1, 1, 1, 1, 1,
-0.6455975, 1.638743, 0.9700493, 1, 1, 1, 1, 1,
-0.6436408, 1.10861, -0.4177776, 1, 1, 1, 1, 1,
-0.6420416, 1.413554, -1.482218, 1, 1, 1, 1, 1,
-0.6404369, 0.002590554, -1.686367, 1, 1, 1, 1, 1,
-0.6362753, 0.2315343, -2.807534, 1, 1, 1, 1, 1,
-0.6308619, -0.846827, -1.73836, 1, 1, 1, 1, 1,
-0.6303563, -0.1602757, -1.042733, 1, 1, 1, 1, 1,
-0.6239891, 0.3188969, -0.9189128, 1, 1, 1, 1, 1,
-0.6236379, 0.1466306, -1.067557, 1, 1, 1, 1, 1,
-0.62181, 0.4901889, 0.2162996, 1, 1, 1, 1, 1,
-0.6213175, -0.1649959, -2.528159, 1, 1, 1, 1, 1,
-0.6199445, 0.01094905, -0.1984292, 0, 0, 1, 1, 1,
-0.6194798, 2.314679, -0.09022036, 1, 0, 0, 1, 1,
-0.6159101, 1.366469, -0.3502107, 1, 0, 0, 1, 1,
-0.6110383, -2.142219, -3.20881, 1, 0, 0, 1, 1,
-0.6087253, -0.9134614, -3.706639, 1, 0, 0, 1, 1,
-0.608391, 0.2258693, -0.3875827, 1, 0, 0, 1, 1,
-0.6077547, -0.2542214, -3.928799, 0, 0, 0, 1, 1,
-0.6028911, 1.670248, 1.355784, 0, 0, 0, 1, 1,
-0.5992556, 0.731386, -0.06134852, 0, 0, 0, 1, 1,
-0.5940668, -1.147673, -2.240824, 0, 0, 0, 1, 1,
-0.5927084, -0.196601, -1.663225, 0, 0, 0, 1, 1,
-0.5902169, 0.7362606, -1.089581, 0, 0, 0, 1, 1,
-0.5875354, 0.0220003, 0.9184953, 0, 0, 0, 1, 1,
-0.5832993, 0.4158008, -0.9135227, 1, 1, 1, 1, 1,
-0.5809494, -0.480137, -2.132824, 1, 1, 1, 1, 1,
-0.5802234, -0.4486533, -1.482476, 1, 1, 1, 1, 1,
-0.574918, 0.08333241, -1.815077, 1, 1, 1, 1, 1,
-0.5729679, -1.359035, -1.607648, 1, 1, 1, 1, 1,
-0.5728895, -0.8818567, -2.480015, 1, 1, 1, 1, 1,
-0.5723505, 0.05266055, -0.4331449, 1, 1, 1, 1, 1,
-0.5698932, -1.112095, -3.644741, 1, 1, 1, 1, 1,
-0.5689143, 0.09032679, -1.664067, 1, 1, 1, 1, 1,
-0.5681946, -0.9962813, -1.235931, 1, 1, 1, 1, 1,
-0.5636698, -1.444258, -3.209333, 1, 1, 1, 1, 1,
-0.5626116, 2.533544, 0.2222137, 1, 1, 1, 1, 1,
-0.5614466, -1.443296, -0.7814021, 1, 1, 1, 1, 1,
-0.5494418, 0.3501805, -1.584728, 1, 1, 1, 1, 1,
-0.5449426, -0.6570057, -3.341617, 1, 1, 1, 1, 1,
-0.5447707, 0.2016792, -0.4565272, 0, 0, 1, 1, 1,
-0.5424258, -0.1732298, -2.735086, 1, 0, 0, 1, 1,
-0.536221, -0.472288, -3.159671, 1, 0, 0, 1, 1,
-0.5361495, 1.356014, 0.6396149, 1, 0, 0, 1, 1,
-0.5356715, -0.8904115, -2.345783, 1, 0, 0, 1, 1,
-0.5356476, -0.5935249, -1.100128, 1, 0, 0, 1, 1,
-0.5333684, 0.7344494, -0.1144681, 0, 0, 0, 1, 1,
-0.5277228, -0.1819945, -3.159416, 0, 0, 0, 1, 1,
-0.525817, 0.7129247, -0.2392021, 0, 0, 0, 1, 1,
-0.5140942, 0.158842, -0.05596452, 0, 0, 0, 1, 1,
-0.5122121, 0.2566666, -1.900337, 0, 0, 0, 1, 1,
-0.5075973, -0.9673473, -2.79279, 0, 0, 0, 1, 1,
-0.507228, 0.1492587, -1.614752, 0, 0, 0, 1, 1,
-0.5039345, -0.8212106, -5.10641, 1, 1, 1, 1, 1,
-0.5005322, 2.171173, 1.095183, 1, 1, 1, 1, 1,
-0.4995514, 0.2695724, -1.019151, 1, 1, 1, 1, 1,
-0.4958657, 0.5897209, -0.3202245, 1, 1, 1, 1, 1,
-0.4900644, 0.931344, -1.644446, 1, 1, 1, 1, 1,
-0.489509, -0.3456066, -1.922253, 1, 1, 1, 1, 1,
-0.4809126, 0.5166702, -0.7370605, 1, 1, 1, 1, 1,
-0.4806744, -0.4613534, -0.3418008, 1, 1, 1, 1, 1,
-0.4791968, -0.9556668, -2.716663, 1, 1, 1, 1, 1,
-0.4780174, -0.1752149, -2.700302, 1, 1, 1, 1, 1,
-0.4740334, -0.6218346, -2.769637, 1, 1, 1, 1, 1,
-0.4703605, 0.9116927, 1.166587, 1, 1, 1, 1, 1,
-0.4673113, 2.499448, -1.466292, 1, 1, 1, 1, 1,
-0.4656281, 0.04100734, -3.352215, 1, 1, 1, 1, 1,
-0.4655583, 1.370789, -0.8991989, 1, 1, 1, 1, 1,
-0.4564246, 0.9173736, 0.4049368, 0, 0, 1, 1, 1,
-0.4518212, 0.6387474, -1.054768, 1, 0, 0, 1, 1,
-0.4510729, -0.1585394, -4.437597, 1, 0, 0, 1, 1,
-0.4484283, 0.7418867, -1.071004, 1, 0, 0, 1, 1,
-0.4451573, -0.5149716, -2.237766, 1, 0, 0, 1, 1,
-0.4450245, 1.948944, -0.338166, 1, 0, 0, 1, 1,
-0.4446198, -0.3023518, 0.3291201, 0, 0, 0, 1, 1,
-0.4440736, -1.154243, -1.523345, 0, 0, 0, 1, 1,
-0.4410204, 0.2886859, 0.3537833, 0, 0, 0, 1, 1,
-0.4388352, -1.309742, -3.407786, 0, 0, 0, 1, 1,
-0.4352522, -1.687496, -3.482587, 0, 0, 0, 1, 1,
-0.4328025, 1.230741, 0.9742777, 0, 0, 0, 1, 1,
-0.4291068, 0.4896915, -0.907147, 0, 0, 0, 1, 1,
-0.4283508, -1.87118, -3.609136, 1, 1, 1, 1, 1,
-0.4240196, -1.420658, -3.584584, 1, 1, 1, 1, 1,
-0.4183887, 0.8507801, -0.9598314, 1, 1, 1, 1, 1,
-0.4132418, 0.6577268, 1.188982, 1, 1, 1, 1, 1,
-0.4116639, -0.6518602, -1.973224, 1, 1, 1, 1, 1,
-0.4103893, 0.9789549, -0.8070883, 1, 1, 1, 1, 1,
-0.4068003, 0.2469863, -0.1763485, 1, 1, 1, 1, 1,
-0.4017239, -0.7189196, -1.726128, 1, 1, 1, 1, 1,
-0.3970747, -0.02593489, 0.01130169, 1, 1, 1, 1, 1,
-0.3888446, 1.292905, -0.00404013, 1, 1, 1, 1, 1,
-0.3882968, -0.8665562, -3.545323, 1, 1, 1, 1, 1,
-0.3842787, 1.292923, 0.4101746, 1, 1, 1, 1, 1,
-0.3824809, 0.8236513, -0.3402402, 1, 1, 1, 1, 1,
-0.3791153, -0.8558433, -2.781506, 1, 1, 1, 1, 1,
-0.3769037, 1.575831, -2.147112, 1, 1, 1, 1, 1,
-0.376323, 1.708757, -1.292376, 0, 0, 1, 1, 1,
-0.3724105, 0.1504308, 0.7669111, 1, 0, 0, 1, 1,
-0.3722884, 0.7219627, 0.2031021, 1, 0, 0, 1, 1,
-0.3634102, -1.187742, -2.587222, 1, 0, 0, 1, 1,
-0.3605401, -0.1101983, -2.184861, 1, 0, 0, 1, 1,
-0.3595479, -0.840385, -2.023499, 1, 0, 0, 1, 1,
-0.3592503, -0.7149349, -2.51076, 0, 0, 0, 1, 1,
-0.3555846, 0.8108724, -1.043231, 0, 0, 0, 1, 1,
-0.3540798, -1.105796, -3.78962, 0, 0, 0, 1, 1,
-0.338588, -0.4890913, -3.232815, 0, 0, 0, 1, 1,
-0.33607, 0.1809424, -1.112445, 0, 0, 0, 1, 1,
-0.3336585, 0.8406069, 1.040619, 0, 0, 0, 1, 1,
-0.3328612, 2.156013, 0.6582953, 0, 0, 0, 1, 1,
-0.3283858, -0.2690946, -3.188607, 1, 1, 1, 1, 1,
-0.3273421, 1.37095, -0.4239171, 1, 1, 1, 1, 1,
-0.3239383, -1.586033, -3.135476, 1, 1, 1, 1, 1,
-0.3235156, -0.4522368, -2.322503, 1, 1, 1, 1, 1,
-0.3109567, 0.5981308, -1.317079, 1, 1, 1, 1, 1,
-0.2910489, 0.8529791, 1.107402, 1, 1, 1, 1, 1,
-0.2790918, 1.042676, -0.1111611, 1, 1, 1, 1, 1,
-0.2787074, -0.2666275, -1.323222, 1, 1, 1, 1, 1,
-0.2786555, -0.05701185, -1.693412, 1, 1, 1, 1, 1,
-0.2785884, -1.121693, -2.76812, 1, 1, 1, 1, 1,
-0.2769091, -0.1245305, -3.058957, 1, 1, 1, 1, 1,
-0.2756167, 1.126698, -0.3254013, 1, 1, 1, 1, 1,
-0.2755128, 1.362263, 0.8879596, 1, 1, 1, 1, 1,
-0.2710419, -0.1366122, -3.212363, 1, 1, 1, 1, 1,
-0.2681003, -0.2569661, -2.660678, 1, 1, 1, 1, 1,
-0.2664618, 1.412935, -0.6017566, 0, 0, 1, 1, 1,
-0.2651233, 0.8181051, -0.8413745, 1, 0, 0, 1, 1,
-0.2644621, 0.1704871, 0.910121, 1, 0, 0, 1, 1,
-0.2634692, -0.3787414, -1.259303, 1, 0, 0, 1, 1,
-0.2618595, -0.942179, -1.931522, 1, 0, 0, 1, 1,
-0.2595072, -0.147483, -1.876923, 1, 0, 0, 1, 1,
-0.2536775, -0.9864953, -1.599068, 0, 0, 0, 1, 1,
-0.2530772, -1.046985, -2.047717, 0, 0, 0, 1, 1,
-0.2486036, -0.1105095, -0.9550976, 0, 0, 0, 1, 1,
-0.2430304, -0.5375138, -4.746769, 0, 0, 0, 1, 1,
-0.2427646, -0.1877799, -2.405738, 0, 0, 0, 1, 1,
-0.2416148, -1.094487, -2.565489, 0, 0, 0, 1, 1,
-0.237707, 0.07381468, -1.031738, 0, 0, 0, 1, 1,
-0.2241628, 1.246389, -0.7217813, 1, 1, 1, 1, 1,
-0.223655, -0.2047028, -2.412042, 1, 1, 1, 1, 1,
-0.2192047, -1.495717, -2.787832, 1, 1, 1, 1, 1,
-0.2169515, 0.04176117, -1.497977, 1, 1, 1, 1, 1,
-0.2164673, -0.01449112, -0.8401719, 1, 1, 1, 1, 1,
-0.2159042, -0.4399543, -2.312301, 1, 1, 1, 1, 1,
-0.213473, -0.4181556, -3.260263, 1, 1, 1, 1, 1,
-0.2109357, -1.253265, -2.232163, 1, 1, 1, 1, 1,
-0.2078774, 0.3222879, -0.5990227, 1, 1, 1, 1, 1,
-0.1993789, 0.5023661, -0.4084623, 1, 1, 1, 1, 1,
-0.1991316, -0.02372278, -2.652199, 1, 1, 1, 1, 1,
-0.1970629, -1.007989, -3.319954, 1, 1, 1, 1, 1,
-0.1929995, -0.3602355, -2.49547, 1, 1, 1, 1, 1,
-0.1918749, -0.8257792, -4.226279, 1, 1, 1, 1, 1,
-0.1860505, -0.6429374, -3.578419, 1, 1, 1, 1, 1,
-0.1851944, 1.025781, 0.09532891, 0, 0, 1, 1, 1,
-0.1838412, 0.3035627, 0.09471678, 1, 0, 0, 1, 1,
-0.1748033, 1.055874, 0.5866257, 1, 0, 0, 1, 1,
-0.1700115, -0.3533746, -2.609757, 1, 0, 0, 1, 1,
-0.168879, -1.140732, -2.645107, 1, 0, 0, 1, 1,
-0.1646468, 1.001492, 0.8006037, 1, 0, 0, 1, 1,
-0.1613271, 0.2059487, -0.7957022, 0, 0, 0, 1, 1,
-0.1611533, -1.515897, -3.108917, 0, 0, 0, 1, 1,
-0.1525638, 0.4914708, 0.9753627, 0, 0, 0, 1, 1,
-0.1508785, -0.2874245, -2.881262, 0, 0, 0, 1, 1,
-0.1503818, -0.7981663, -3.045776, 0, 0, 0, 1, 1,
-0.1470159, -0.1828765, -1.950326, 0, 0, 0, 1, 1,
-0.1452867, 1.148198, -0.1773681, 0, 0, 0, 1, 1,
-0.1342036, 1.198089, 0.09729199, 1, 1, 1, 1, 1,
-0.1333821, 1.244102, 1.674088, 1, 1, 1, 1, 1,
-0.127057, -0.04621279, -0.6971855, 1, 1, 1, 1, 1,
-0.1258432, 0.415765, 1.062963, 1, 1, 1, 1, 1,
-0.1244819, -0.695376, -3.72069, 1, 1, 1, 1, 1,
-0.1219644, 0.4343562, 0.338044, 1, 1, 1, 1, 1,
-0.1192108, -1.841176, -2.256434, 1, 1, 1, 1, 1,
-0.1126488, -0.3013128, -2.745935, 1, 1, 1, 1, 1,
-0.1126107, -0.1110207, -1.272103, 1, 1, 1, 1, 1,
-0.1098346, -0.6246414, -4.96675, 1, 1, 1, 1, 1,
-0.1048916, -0.621286, -2.626478, 1, 1, 1, 1, 1,
-0.1038101, -2.360577, -1.780836, 1, 1, 1, 1, 1,
-0.1003989, 0.07058038, 0.748553, 1, 1, 1, 1, 1,
-0.0970695, 0.1146917, -1.395998, 1, 1, 1, 1, 1,
-0.09644906, 0.8330961, 2.713122, 1, 1, 1, 1, 1,
-0.09190758, -0.8756039, -3.733964, 0, 0, 1, 1, 1,
-0.08846174, -1.755162, -0.1906253, 1, 0, 0, 1, 1,
-0.0824855, -0.840637, -3.570248, 1, 0, 0, 1, 1,
-0.0766848, 1.343379, -0.0008028738, 1, 0, 0, 1, 1,
-0.07663935, 0.6466236, 0.4401536, 1, 0, 0, 1, 1,
-0.07637651, -0.9152005, -2.25601, 1, 0, 0, 1, 1,
-0.07354632, -0.2034857, -3.545489, 0, 0, 0, 1, 1,
-0.06870366, -0.9898601, -1.97663, 0, 0, 0, 1, 1,
-0.06848594, 0.06168375, -0.7282097, 0, 0, 0, 1, 1,
-0.06838671, 0.9195548, -0.1896133, 0, 0, 0, 1, 1,
-0.06625885, 0.9258417, -0.6714167, 0, 0, 0, 1, 1,
-0.06519181, -1.891524, -4.410223, 0, 0, 0, 1, 1,
-0.06401922, -0.389112, -3.506376, 0, 0, 0, 1, 1,
-0.06193439, -0.8427691, -3.428015, 1, 1, 1, 1, 1,
-0.06051888, -0.1704947, -1.784166, 1, 1, 1, 1, 1,
-0.05206066, 0.4699723, 0.4517589, 1, 1, 1, 1, 1,
-0.04743506, 2.322029, -0.1661692, 1, 1, 1, 1, 1,
-0.04652414, -0.1358196, -4.026286, 1, 1, 1, 1, 1,
-0.04530607, -0.6167169, -4.374632, 1, 1, 1, 1, 1,
-0.0444613, 0.3087826, 0.286588, 1, 1, 1, 1, 1,
-0.04363709, 0.643919, 0.1559463, 1, 1, 1, 1, 1,
-0.038815, 1.296795, 1.037425, 1, 1, 1, 1, 1,
-0.03603703, -0.1659234, -2.953726, 1, 1, 1, 1, 1,
-0.03021358, -0.3858838, -3.986021, 1, 1, 1, 1, 1,
-0.02562837, -0.8064271, -3.895153, 1, 1, 1, 1, 1,
-0.02289351, -1.290884, -3.287892, 1, 1, 1, 1, 1,
-0.02190412, 0.09266682, 0.8075093, 1, 1, 1, 1, 1,
-0.01634031, 0.5580058, -0.6183258, 1, 1, 1, 1, 1,
-0.01563874, -0.09190163, -3.615483, 0, 0, 1, 1, 1,
-0.01552476, 0.9525636, 1.605023, 1, 0, 0, 1, 1,
-0.01447367, 0.1952821, -0.2833068, 1, 0, 0, 1, 1,
-0.01143002, -0.5738312, -3.608284, 1, 0, 0, 1, 1,
-0.008756284, 1.143673, -0.3728212, 1, 0, 0, 1, 1,
-0.007650343, -0.2660196, -2.785914, 1, 0, 0, 1, 1,
-0.002526105, -0.06897196, -3.108392, 0, 0, 0, 1, 1,
-0.0004208347, 1.111145, -0.3728612, 0, 0, 0, 1, 1,
0.001823058, 0.4647309, -0.2798889, 0, 0, 0, 1, 1,
0.005961078, -0.01559055, 3.529678, 0, 0, 0, 1, 1,
0.009591204, -0.09303314, 3.36761, 0, 0, 0, 1, 1,
0.009948223, -0.4473951, 2.451543, 0, 0, 0, 1, 1,
0.01459202, 0.1626652, -0.09601141, 0, 0, 0, 1, 1,
0.01519067, -2.406916, 2.86137, 1, 1, 1, 1, 1,
0.01638037, -0.7993414, 1.713446, 1, 1, 1, 1, 1,
0.01876258, 2.024075, 1.690267, 1, 1, 1, 1, 1,
0.01937826, -0.283118, 2.766511, 1, 1, 1, 1, 1,
0.02330401, -1.131659, 1.476285, 1, 1, 1, 1, 1,
0.02379023, 0.6852673, 1.59626, 1, 1, 1, 1, 1,
0.02666247, -0.3725541, 2.503298, 1, 1, 1, 1, 1,
0.02671429, 0.5834999, -0.4515245, 1, 1, 1, 1, 1,
0.03838987, -1.048163, 2.650343, 1, 1, 1, 1, 1,
0.03850865, 0.5546159, -0.523501, 1, 1, 1, 1, 1,
0.04163517, -1.608572, 1.988666, 1, 1, 1, 1, 1,
0.04259761, 1.851034, -0.6583998, 1, 1, 1, 1, 1,
0.04267055, 1.561036, -0.003738519, 1, 1, 1, 1, 1,
0.04272554, 0.6540502, -0.9068418, 1, 1, 1, 1, 1,
0.04585692, -1.340198, 2.190026, 1, 1, 1, 1, 1,
0.04724934, -1.164096, 3.482621, 0, 0, 1, 1, 1,
0.04974222, 1.283905, -1.275558, 1, 0, 0, 1, 1,
0.05009726, 0.4413116, 0.6882882, 1, 0, 0, 1, 1,
0.05209417, 1.297798, -0.02098007, 1, 0, 0, 1, 1,
0.05696847, -0.9687275, 3.251596, 1, 0, 0, 1, 1,
0.05794255, 1.704815, 0.3714174, 1, 0, 0, 1, 1,
0.05832063, 1.234243, -1.018472, 0, 0, 0, 1, 1,
0.06306492, 0.5720201, -0.04165524, 0, 0, 0, 1, 1,
0.06321919, 0.8735947, 0.3528931, 0, 0, 0, 1, 1,
0.06440109, 0.5542356, -0.3435049, 0, 0, 0, 1, 1,
0.06506564, -0.04236726, 2.091431, 0, 0, 0, 1, 1,
0.06535535, -0.8006501, 1.555137, 0, 0, 0, 1, 1,
0.06764232, 2.58258, 0.9669127, 0, 0, 0, 1, 1,
0.06768238, -0.7429689, 2.930361, 1, 1, 1, 1, 1,
0.06898316, -0.5963274, 2.763152, 1, 1, 1, 1, 1,
0.06908264, 0.8961593, 0.2301649, 1, 1, 1, 1, 1,
0.0732872, 1.022813, -0.2511381, 1, 1, 1, 1, 1,
0.07388262, 0.5871278, -0.4534974, 1, 1, 1, 1, 1,
0.07747137, -1.174356, 4.840685, 1, 1, 1, 1, 1,
0.07848177, -1.124342, 2.860218, 1, 1, 1, 1, 1,
0.07907112, 0.4169956, -1.024135, 1, 1, 1, 1, 1,
0.07942154, 1.428223, -0.8106422, 1, 1, 1, 1, 1,
0.08027032, -0.87358, 3.142097, 1, 1, 1, 1, 1,
0.08753386, 0.9674703, 0.8191485, 1, 1, 1, 1, 1,
0.08941938, -0.8769651, 4.552042, 1, 1, 1, 1, 1,
0.09005895, -0.4829787, 2.810013, 1, 1, 1, 1, 1,
0.09488877, 0.1845787, -0.5679542, 1, 1, 1, 1, 1,
0.09531772, -1.197476, 4.577582, 1, 1, 1, 1, 1,
0.09781827, -1.294017, 2.40328, 0, 0, 1, 1, 1,
0.1010934, -0.08209715, 1.590377, 1, 0, 0, 1, 1,
0.1060675, 2.167673, 0.301514, 1, 0, 0, 1, 1,
0.1063972, -0.3590822, 5.09781, 1, 0, 0, 1, 1,
0.1187825, -0.8327996, 2.449883, 1, 0, 0, 1, 1,
0.1188564, 0.6170551, -0.06170769, 1, 0, 0, 1, 1,
0.1190405, -0.9093774, 1.805366, 0, 0, 0, 1, 1,
0.1225498, 0.7942958, 0.8747561, 0, 0, 0, 1, 1,
0.1242155, 0.9151621, 0.02055206, 0, 0, 0, 1, 1,
0.124636, -0.02888437, 2.555804, 0, 0, 0, 1, 1,
0.125177, 0.2830309, 2.566857, 0, 0, 0, 1, 1,
0.1282733, 0.9030495, 0.8628461, 0, 0, 0, 1, 1,
0.1295793, 0.7556421, -0.475515, 0, 0, 0, 1, 1,
0.1302468, -0.4437201, 2.397966, 1, 1, 1, 1, 1,
0.1308422, -0.6350138, 1.979938, 1, 1, 1, 1, 1,
0.1389809, -0.5219307, 1.664477, 1, 1, 1, 1, 1,
0.140975, 0.1162233, 1.638773, 1, 1, 1, 1, 1,
0.1416254, -0.8233672, 3.116261, 1, 1, 1, 1, 1,
0.1418352, 0.8267011, 0.0996831, 1, 1, 1, 1, 1,
0.1427406, 0.5365595, 1.869714, 1, 1, 1, 1, 1,
0.1461202, 0.8378092, 1.456475, 1, 1, 1, 1, 1,
0.1461886, 0.5867891, -0.8179409, 1, 1, 1, 1, 1,
0.1498307, 2.073155, 0.737607, 1, 1, 1, 1, 1,
0.1524138, 0.2694835, 1.33224, 1, 1, 1, 1, 1,
0.1574575, -2.536088, 3.898355, 1, 1, 1, 1, 1,
0.1609051, -0.6444401, 6.019296, 1, 1, 1, 1, 1,
0.1640683, -1.020248, 5.243075, 1, 1, 1, 1, 1,
0.1647223, 0.2572215, 1.449165, 1, 1, 1, 1, 1,
0.1659958, 1.596288, 0.4314496, 0, 0, 1, 1, 1,
0.1738737, 0.8749836, 1.255053, 1, 0, 0, 1, 1,
0.1751618, -0.2486116, 2.149667, 1, 0, 0, 1, 1,
0.1753706, -0.4935353, 3.813965, 1, 0, 0, 1, 1,
0.1786563, 0.8505962, -0.4195012, 1, 0, 0, 1, 1,
0.180451, -0.6852171, 3.654467, 1, 0, 0, 1, 1,
0.1817067, 0.5541509, -0.2181685, 0, 0, 0, 1, 1,
0.1827785, 0.1471061, 0.6052867, 0, 0, 0, 1, 1,
0.1837453, 0.6053343, -0.3817999, 0, 0, 0, 1, 1,
0.1864001, -0.04316422, 2.018595, 0, 0, 0, 1, 1,
0.1865947, -1.078649, 3.792371, 0, 0, 0, 1, 1,
0.1875167, -0.658896, 3.969784, 0, 0, 0, 1, 1,
0.1897662, 0.1975969, 0.9999105, 0, 0, 0, 1, 1,
0.1918752, -0.4322527, 2.94095, 1, 1, 1, 1, 1,
0.1919679, -0.8123071, 0.8019195, 1, 1, 1, 1, 1,
0.1943648, 0.09227867, 0.7543154, 1, 1, 1, 1, 1,
0.1959545, -1.304683, 5.910087, 1, 1, 1, 1, 1,
0.1982226, 0.5509866, -1.615865, 1, 1, 1, 1, 1,
0.2003617, -1.240282, 3.419917, 1, 1, 1, 1, 1,
0.2021004, 0.742336, 1.186671, 1, 1, 1, 1, 1,
0.2054628, 0.653527, 1.089388, 1, 1, 1, 1, 1,
0.2142623, -0.2026469, 1.668933, 1, 1, 1, 1, 1,
0.217498, 1.310419, -2.045435, 1, 1, 1, 1, 1,
0.2184729, -1.408271, 2.41126, 1, 1, 1, 1, 1,
0.2203462, -1.366398, 4.533453, 1, 1, 1, 1, 1,
0.2277543, 1.419108, 1.509308, 1, 1, 1, 1, 1,
0.2283353, -1.408865, 2.338564, 1, 1, 1, 1, 1,
0.2307444, -0.2790729, 2.871768, 1, 1, 1, 1, 1,
0.2373938, -0.02561859, 1.834133, 0, 0, 1, 1, 1,
0.2374373, -0.06671605, 1.930531, 1, 0, 0, 1, 1,
0.238238, -1.038842, 2.901785, 1, 0, 0, 1, 1,
0.2441609, -1.676543, 2.735612, 1, 0, 0, 1, 1,
0.2443323, 0.6134585, 1.174631, 1, 0, 0, 1, 1,
0.2461977, 1.364852, 0.4917432, 1, 0, 0, 1, 1,
0.2466047, 1.574538, 0.8542226, 0, 0, 0, 1, 1,
0.2527323, -0.07104614, 0.3233241, 0, 0, 0, 1, 1,
0.2548844, -1.09993, 2.837605, 0, 0, 0, 1, 1,
0.2569762, 0.4135343, -0.1966138, 0, 0, 0, 1, 1,
0.263886, -0.7259046, 3.497002, 0, 0, 0, 1, 1,
0.2640111, 0.05581814, 2.667583, 0, 0, 0, 1, 1,
0.2653097, 0.2528297, 0.6986096, 0, 0, 0, 1, 1,
0.2660994, -0.1078873, 1.388954, 1, 1, 1, 1, 1,
0.2688865, 0.4906191, -0.2738802, 1, 1, 1, 1, 1,
0.2730581, -0.1459452, 0.89765, 1, 1, 1, 1, 1,
0.2748047, -0.7097104, 2.633893, 1, 1, 1, 1, 1,
0.2758952, 0.5239747, -1.556848, 1, 1, 1, 1, 1,
0.2776181, 0.005360794, 1.957919, 1, 1, 1, 1, 1,
0.2805853, -1.115828, 4.063807, 1, 1, 1, 1, 1,
0.2824682, 0.1229281, 0.4747548, 1, 1, 1, 1, 1,
0.2863619, 0.09577088, 1.765663, 1, 1, 1, 1, 1,
0.2879367, 0.7180203, 0.7065323, 1, 1, 1, 1, 1,
0.2897087, 0.9365112, 1.353655, 1, 1, 1, 1, 1,
0.2912799, 1.101408, 0.9160456, 1, 1, 1, 1, 1,
0.2950565, 0.1487934, 2.107728, 1, 1, 1, 1, 1,
0.2960293, -0.6875618, 3.624489, 1, 1, 1, 1, 1,
0.29838, -0.4619145, 2.077889, 1, 1, 1, 1, 1,
0.2989254, -0.3449725, 0.9766434, 0, 0, 1, 1, 1,
0.3050195, -1.898699, 1.692278, 1, 0, 0, 1, 1,
0.3078498, 1.758397, 1.439685, 1, 0, 0, 1, 1,
0.3094969, 0.3492349, 0.1763745, 1, 0, 0, 1, 1,
0.3170723, -0.3433416, 4.600574, 1, 0, 0, 1, 1,
0.317229, -0.6282278, 2.624636, 1, 0, 0, 1, 1,
0.3178527, 0.4024323, 1.724618, 0, 0, 0, 1, 1,
0.3180895, 1.112695, 0.5610146, 0, 0, 0, 1, 1,
0.3194295, 0.6364769, 2.148204, 0, 0, 0, 1, 1,
0.320772, -0.2968767, 2.694408, 0, 0, 0, 1, 1,
0.327312, 0.686954, 0.01520834, 0, 0, 0, 1, 1,
0.3300415, 1.172232, 0.9717512, 0, 0, 0, 1, 1,
0.3336234, -1.536923, 2.172404, 0, 0, 0, 1, 1,
0.3366042, 0.6574512, 1.098065, 1, 1, 1, 1, 1,
0.3475538, 0.1032399, 1.203091, 1, 1, 1, 1, 1,
0.3540092, -0.3048888, 2.699736, 1, 1, 1, 1, 1,
0.3555727, 1.215645, 0.5238376, 1, 1, 1, 1, 1,
0.3576353, 1.144403, 0.767212, 1, 1, 1, 1, 1,
0.359614, -0.7254254, 2.928242, 1, 1, 1, 1, 1,
0.3615411, 2.423007, -0.6996816, 1, 1, 1, 1, 1,
0.3682536, -0.2965434, 1.809853, 1, 1, 1, 1, 1,
0.3694627, 0.3834217, -0.05520692, 1, 1, 1, 1, 1,
0.3694861, 0.4549879, 1.500737, 1, 1, 1, 1, 1,
0.3719929, 1.328493, -0.2756932, 1, 1, 1, 1, 1,
0.3722352, -0.236658, 1.943836, 1, 1, 1, 1, 1,
0.373019, -2.119518, 0.4572448, 1, 1, 1, 1, 1,
0.3806621, 2.114147, -1.453333, 1, 1, 1, 1, 1,
0.3852971, 0.8893445, 0.323152, 1, 1, 1, 1, 1,
0.3861457, 0.08089966, 2.491462, 0, 0, 1, 1, 1,
0.3883665, 1.135328, 0.01382605, 1, 0, 0, 1, 1,
0.3888609, -1.103883, 2.350197, 1, 0, 0, 1, 1,
0.3902045, 0.166299, 0.8182393, 1, 0, 0, 1, 1,
0.3944024, -0.8863702, 2.831219, 1, 0, 0, 1, 1,
0.3945591, -1.306035, 1.554339, 1, 0, 0, 1, 1,
0.3979313, -1.336968, 2.60891, 0, 0, 0, 1, 1,
0.4064544, 2.276137, -0.05411856, 0, 0, 0, 1, 1,
0.4121265, -0.3005721, 1.763658, 0, 0, 0, 1, 1,
0.4151032, 2.698721, -0.3943737, 0, 0, 0, 1, 1,
0.4152999, 0.3878067, 0.830012, 0, 0, 0, 1, 1,
0.4164748, -0.3086561, 1.92856, 0, 0, 0, 1, 1,
0.417349, 0.5462846, -0.07230991, 0, 0, 0, 1, 1,
0.4231845, 1.129099, 1.349814, 1, 1, 1, 1, 1,
0.4245386, 0.123581, 3.13869, 1, 1, 1, 1, 1,
0.42589, -0.8183927, 1.79854, 1, 1, 1, 1, 1,
0.4271908, -0.337147, 1.692073, 1, 1, 1, 1, 1,
0.4289547, 1.410683, 1.54577, 1, 1, 1, 1, 1,
0.4295465, 1.851918, 1.984403, 1, 1, 1, 1, 1,
0.4310612, -1.000212, 2.456481, 1, 1, 1, 1, 1,
0.4310681, 1.418945, -0.331632, 1, 1, 1, 1, 1,
0.4348444, -0.6301931, 2.673175, 1, 1, 1, 1, 1,
0.4357467, 0.6151422, -0.1151112, 1, 1, 1, 1, 1,
0.4373718, 1.557079, -0.6493863, 1, 1, 1, 1, 1,
0.4384704, -2.106765, 4.339432, 1, 1, 1, 1, 1,
0.4394664, -0.257852, 1.177036, 1, 1, 1, 1, 1,
0.4462816, 0.3800093, -0.7504786, 1, 1, 1, 1, 1,
0.4538667, 0.5277495, 0.2114147, 1, 1, 1, 1, 1,
0.4547954, 0.6611103, 0.2185123, 0, 0, 1, 1, 1,
0.4554153, 0.2759009, 1.438454, 1, 0, 0, 1, 1,
0.4562611, -1.00135, 1.393119, 1, 0, 0, 1, 1,
0.4619116, -0.3968275, 2.466333, 1, 0, 0, 1, 1,
0.4625967, -0.533281, 0.6737055, 1, 0, 0, 1, 1,
0.4660128, -1.369695, 1.90538, 1, 0, 0, 1, 1,
0.4702514, -0.3768258, 1.803125, 0, 0, 0, 1, 1,
0.4756753, 0.02583473, 0.8641453, 0, 0, 0, 1, 1,
0.4768411, -0.3257411, 4.496988, 0, 0, 0, 1, 1,
0.4783172, 0.422418, 0.9837822, 0, 0, 0, 1, 1,
0.4784412, 1.072503, 0.529016, 0, 0, 0, 1, 1,
0.4786415, -2.18471, 3.104824, 0, 0, 0, 1, 1,
0.4791178, 0.9549034, 1.509094, 0, 0, 0, 1, 1,
0.4812177, 1.271603, 0.7627628, 1, 1, 1, 1, 1,
0.484851, 1.356893, -0.686752, 1, 1, 1, 1, 1,
0.487413, -0.3101645, 1.961938, 1, 1, 1, 1, 1,
0.4882362, -0.3125958, 3.380643, 1, 1, 1, 1, 1,
0.4890431, -1.884026, 1.373214, 1, 1, 1, 1, 1,
0.4905667, -0.6181678, 2.481507, 1, 1, 1, 1, 1,
0.4937963, 0.9245536, -1.415243, 1, 1, 1, 1, 1,
0.4990164, 2.125919, -0.3052687, 1, 1, 1, 1, 1,
0.5042385, 0.3038923, 1.147118, 1, 1, 1, 1, 1,
0.5061542, 1.38296, 1.326907, 1, 1, 1, 1, 1,
0.5138404, 2.430431, 1.643464, 1, 1, 1, 1, 1,
0.5146638, 1.170777, -1.131451, 1, 1, 1, 1, 1,
0.5150625, 0.7448202, 1.56973, 1, 1, 1, 1, 1,
0.5249693, 0.02749671, 2.197454, 1, 1, 1, 1, 1,
0.5275531, 0.9623721, 1.098461, 1, 1, 1, 1, 1,
0.5345016, -1.79364, 3.62894, 0, 0, 1, 1, 1,
0.5394477, 0.4923754, -0.8237532, 1, 0, 0, 1, 1,
0.540709, -0.7254943, 4.345414, 1, 0, 0, 1, 1,
0.5411621, -1.220776, 1.969191, 1, 0, 0, 1, 1,
0.5415693, -0.3717803, 2.393078, 1, 0, 0, 1, 1,
0.5424372, 0.9117233, 0.3085179, 1, 0, 0, 1, 1,
0.5431184, -1.028532, 3.15543, 0, 0, 0, 1, 1,
0.5437404, -1.051777, 3.869572, 0, 0, 0, 1, 1,
0.5469008, -0.3487901, 1.74658, 0, 0, 0, 1, 1,
0.5527748, -0.8271285, 1.878021, 0, 0, 0, 1, 1,
0.5651631, 0.7393343, 0.2592827, 0, 0, 0, 1, 1,
0.5660251, 1.175451, 0.762101, 0, 0, 0, 1, 1,
0.5664412, -0.01131009, 2.590999, 0, 0, 0, 1, 1,
0.5668537, -0.2667094, -0.01888555, 1, 1, 1, 1, 1,
0.5698045, 0.664631, 0.9577483, 1, 1, 1, 1, 1,
0.5703208, 1.378575, 0.07732014, 1, 1, 1, 1, 1,
0.5733253, 2.28071, -0.9097303, 1, 1, 1, 1, 1,
0.5800033, -0.000385009, 4.740992, 1, 1, 1, 1, 1,
0.5840358, -1.295634, 2.808653, 1, 1, 1, 1, 1,
0.5869237, -1.294847, 2.77541, 1, 1, 1, 1, 1,
0.5880733, -0.1185061, 2.642494, 1, 1, 1, 1, 1,
0.5882665, 0.9800701, 1.648268, 1, 1, 1, 1, 1,
0.5888074, -2.029087, 2.414031, 1, 1, 1, 1, 1,
0.5936379, -0.6320292, 2.819199, 1, 1, 1, 1, 1,
0.5980074, 0.3277302, -1.402707, 1, 1, 1, 1, 1,
0.6006445, 1.475982, 1.360072, 1, 1, 1, 1, 1,
0.600715, -0.5159936, 2.298743, 1, 1, 1, 1, 1,
0.6030182, 0.9094984, 0.1641153, 1, 1, 1, 1, 1,
0.6040677, -0.6741907, 3.003228, 0, 0, 1, 1, 1,
0.6074899, 0.02543332, 0.2907538, 1, 0, 0, 1, 1,
0.6104456, 0.2011715, -0.3088016, 1, 0, 0, 1, 1,
0.6106127, 0.844071, 1.762738, 1, 0, 0, 1, 1,
0.6126325, -1.823404, 3.122707, 1, 0, 0, 1, 1,
0.6151246, 1.251821, -0.7292053, 1, 0, 0, 1, 1,
0.6186532, -1.18256, 3.380925, 0, 0, 0, 1, 1,
0.6189455, -0.6378647, 3.184575, 0, 0, 0, 1, 1,
0.622086, 2.366054, -2.721168, 0, 0, 0, 1, 1,
0.6235455, 0.9018337, 0.6078094, 0, 0, 0, 1, 1,
0.6265332, -0.4266184, 2.738115, 0, 0, 0, 1, 1,
0.6268321, -0.02909854, -0.03313226, 0, 0, 0, 1, 1,
0.6287521, 0.7315405, 0.8686548, 0, 0, 0, 1, 1,
0.6299137, -0.4104276, 2.479707, 1, 1, 1, 1, 1,
0.6415815, 0.1979944, 1.299525, 1, 1, 1, 1, 1,
0.648783, -0.173073, 1.588206, 1, 1, 1, 1, 1,
0.6522115, -0.3094399, 1.580288, 1, 1, 1, 1, 1,
0.6562812, -2.465042, 4.609853, 1, 1, 1, 1, 1,
0.665679, -0.05847032, 1.122783, 1, 1, 1, 1, 1,
0.6668208, -1.668298, 3.00405, 1, 1, 1, 1, 1,
0.6675952, 1.440357, -0.01817864, 1, 1, 1, 1, 1,
0.6703659, 1.156194, 0.4659124, 1, 1, 1, 1, 1,
0.6759869, -0.9764192, 3.368724, 1, 1, 1, 1, 1,
0.6776853, 2.259845, 0.1951362, 1, 1, 1, 1, 1,
0.67905, -1.921088, 4.157892, 1, 1, 1, 1, 1,
0.6808182, -0.2121233, 2.126671, 1, 1, 1, 1, 1,
0.6831129, -0.2125799, 0.7221975, 1, 1, 1, 1, 1,
0.6831372, 1.291139, -1.884411, 1, 1, 1, 1, 1,
0.6973432, -1.803147, 1.181713, 0, 0, 1, 1, 1,
0.6979664, 0.5243697, 1.922446, 1, 0, 0, 1, 1,
0.6992229, -0.3989114, 0.8721356, 1, 0, 0, 1, 1,
0.7048439, 0.3168941, -0.3448465, 1, 0, 0, 1, 1,
0.7054043, 0.7496331, -0.0807272, 1, 0, 0, 1, 1,
0.7076206, -0.524603, 0.496648, 1, 0, 0, 1, 1,
0.7141175, -0.1861473, 2.189131, 0, 0, 0, 1, 1,
0.7186041, 0.1969192, 1.741097, 0, 0, 0, 1, 1,
0.7207103, -0.8727285, 1.639516, 0, 0, 0, 1, 1,
0.7209337, -0.3147008, 0.4004236, 0, 0, 0, 1, 1,
0.7269178, 0.4525486, 0.135064, 0, 0, 0, 1, 1,
0.7317727, 0.3709908, 1.278157, 0, 0, 0, 1, 1,
0.7339483, -0.2126972, 0.7711248, 0, 0, 0, 1, 1,
0.7398144, 1.523791, 0.8995069, 1, 1, 1, 1, 1,
0.740805, -0.4100244, 2.696878, 1, 1, 1, 1, 1,
0.7484436, -1.365173, 4.146267, 1, 1, 1, 1, 1,
0.7493035, 1.488163, 0.3776872, 1, 1, 1, 1, 1,
0.7502841, 0.03151769, -0.287015, 1, 1, 1, 1, 1,
0.7534077, 1.488431, 0.4592939, 1, 1, 1, 1, 1,
0.7545243, 0.7681005, 0.8060809, 1, 1, 1, 1, 1,
0.76163, 0.03671515, 0.9773794, 1, 1, 1, 1, 1,
0.7622301, 0.4007677, 0.6450151, 1, 1, 1, 1, 1,
0.7639328, 0.06958744, -0.8518413, 1, 1, 1, 1, 1,
0.7663854, 1.548786, 1.216962, 1, 1, 1, 1, 1,
0.7693523, -0.1812225, 3.130701, 1, 1, 1, 1, 1,
0.7706786, -0.6242128, 2.760849, 1, 1, 1, 1, 1,
0.7756179, -1.385448, 3.164469, 1, 1, 1, 1, 1,
0.77843, -0.02242431, 3.726278, 1, 1, 1, 1, 1,
0.8012233, 1.520057, 0.001502532, 0, 0, 1, 1, 1,
0.8022195, -0.1754374, 1.830758, 1, 0, 0, 1, 1,
0.8058617, -0.3267612, 2.491847, 1, 0, 0, 1, 1,
0.8123089, 0.8092217, 1.756962, 1, 0, 0, 1, 1,
0.8134281, -2.554113, 3.886737, 1, 0, 0, 1, 1,
0.8146785, 1.021703, 2.016502, 1, 0, 0, 1, 1,
0.8164808, -0.3533725, 3.251302, 0, 0, 0, 1, 1,
0.8250049, 1.162923, 0.2262152, 0, 0, 0, 1, 1,
0.825383, 0.7278415, 0.6309256, 0, 0, 0, 1, 1,
0.8286849, 0.1459138, 0.7198018, 0, 0, 0, 1, 1,
0.8322493, -1.826926, 4.094187, 0, 0, 0, 1, 1,
0.8325076, 1.07137, -0.1608132, 0, 0, 0, 1, 1,
0.8326246, -0.07969926, 1.432805, 0, 0, 0, 1, 1,
0.8331213, 0.420632, 0.1235816, 1, 1, 1, 1, 1,
0.8332401, -2.791827, 2.72619, 1, 1, 1, 1, 1,
0.8350526, -0.1067599, 1.322301, 1, 1, 1, 1, 1,
0.8358694, 0.3057355, 0.7883309, 1, 1, 1, 1, 1,
0.8364705, 1.041854, 0.3525205, 1, 1, 1, 1, 1,
0.8368818, 0.1893492, 1.023312, 1, 1, 1, 1, 1,
0.8388549, 0.1007387, -1.600082, 1, 1, 1, 1, 1,
0.8433895, -1.142495, 1.845991, 1, 1, 1, 1, 1,
0.844501, 0.1399283, 0.9406042, 1, 1, 1, 1, 1,
0.8538347, 0.7169903, 0.8648714, 1, 1, 1, 1, 1,
0.8621721, -1.00138, 2.160214, 1, 1, 1, 1, 1,
0.8626179, 2.157871, 0.8403569, 1, 1, 1, 1, 1,
0.8635669, 0.3626929, 1.144744, 1, 1, 1, 1, 1,
0.8695002, -0.2959855, 3.474264, 1, 1, 1, 1, 1,
0.8705902, -0.6770648, 4.224758, 1, 1, 1, 1, 1,
0.8766888, -0.6031335, 1.18535, 0, 0, 1, 1, 1,
0.8782127, -1.398645, 1.985136, 1, 0, 0, 1, 1,
0.8811722, -1.580902, 1.877182, 1, 0, 0, 1, 1,
0.8826038, -0.2187771, 1.289862, 1, 0, 0, 1, 1,
0.8830742, -0.7082441, 3.46924, 1, 0, 0, 1, 1,
0.8899847, 0.6233248, 1.892725, 1, 0, 0, 1, 1,
0.8901761, 0.9621627, 1.533061, 0, 0, 0, 1, 1,
0.8934136, 0.5829969, -1.434436, 0, 0, 0, 1, 1,
0.8979475, -0.4630759, 1.532904, 0, 0, 0, 1, 1,
0.8999475, 2.114869, 1.594082, 0, 0, 0, 1, 1,
0.9011936, -1.413999, 3.175591, 0, 0, 0, 1, 1,
0.90194, 0.9121019, 3.658538, 0, 0, 0, 1, 1,
0.9040568, -0.6917586, 1.444858, 0, 0, 0, 1, 1,
0.9174551, -1.543492, 2.278415, 1, 1, 1, 1, 1,
0.9212363, 0.7123761, 0.7687945, 1, 1, 1, 1, 1,
0.9213333, 1.879748, -0.8789124, 1, 1, 1, 1, 1,
0.9216446, -1.46491, 2.50567, 1, 1, 1, 1, 1,
0.9289394, 0.5036302, 0.8076677, 1, 1, 1, 1, 1,
0.9431981, -0.5423676, 3.809527, 1, 1, 1, 1, 1,
0.9486286, -0.9619046, 3.338039, 1, 1, 1, 1, 1,
0.9539858, -0.5188308, 2.374505, 1, 1, 1, 1, 1,
0.9587678, -0.6215979, 2.880998, 1, 1, 1, 1, 1,
0.9609843, -0.9642968, 2.843987, 1, 1, 1, 1, 1,
0.9629517, -0.8102025, 2.475719, 1, 1, 1, 1, 1,
0.9640706, -1.35713, 5.130569, 1, 1, 1, 1, 1,
0.9647275, -0.02160562, 3.134135, 1, 1, 1, 1, 1,
0.9658266, 0.2823663, 2.847135, 1, 1, 1, 1, 1,
0.9765569, -1.908464, 3.609865, 1, 1, 1, 1, 1,
0.9810889, -0.6234997, 2.174145, 0, 0, 1, 1, 1,
0.9859802, -0.6194603, 2.247407, 1, 0, 0, 1, 1,
0.9886822, -0.08776651, 1.91574, 1, 0, 0, 1, 1,
0.9916326, -0.1602217, 2.530401, 1, 0, 0, 1, 1,
0.9924683, -0.5401917, 2.006843, 1, 0, 0, 1, 1,
0.9951052, -1.731852, 2.518499, 1, 0, 0, 1, 1,
0.9977022, 0.2514535, 2.148093, 0, 0, 0, 1, 1,
0.9996231, -2.443272, 2.955472, 0, 0, 0, 1, 1,
1.000586, 0.5158908, 2.650204, 0, 0, 0, 1, 1,
1.006055, -1.620511, 1.741008, 0, 0, 0, 1, 1,
1.014524, 1.259406, -0.5509689, 0, 0, 0, 1, 1,
1.016268, 0.4060359, -1.3244, 0, 0, 0, 1, 1,
1.018665, 0.5596961, 0.6380396, 0, 0, 0, 1, 1,
1.022624, -1.333129, 2.916267, 1, 1, 1, 1, 1,
1.024895, 0.7962471, -0.06915456, 1, 1, 1, 1, 1,
1.026498, -0.8547159, 0.9115114, 1, 1, 1, 1, 1,
1.030838, -0.8083598, 1.526756, 1, 1, 1, 1, 1,
1.031573, -1.058368, 4.020333, 1, 1, 1, 1, 1,
1.033109, 1.822647, -0.1437859, 1, 1, 1, 1, 1,
1.035802, -0.482493, -0.2950519, 1, 1, 1, 1, 1,
1.035871, -0.5861167, -0.3474376, 1, 1, 1, 1, 1,
1.039999, 0.2036639, 1.332975, 1, 1, 1, 1, 1,
1.042127, 1.015614, 0.9857832, 1, 1, 1, 1, 1,
1.044111, -0.2105821, 2.158517, 1, 1, 1, 1, 1,
1.065743, -0.879719, 3.28621, 1, 1, 1, 1, 1,
1.068448, 0.3631611, 0.4332147, 1, 1, 1, 1, 1,
1.07757, 1.160694, 0.6801051, 1, 1, 1, 1, 1,
1.0823, -0.06409528, 1.009941, 1, 1, 1, 1, 1,
1.086497, -1.605997, 3.576441, 0, 0, 1, 1, 1,
1.087649, -0.8490948, 1.862418, 1, 0, 0, 1, 1,
1.08857, 2.18294, 0.1630556, 1, 0, 0, 1, 1,
1.106171, 0.2962738, 1.712567, 1, 0, 0, 1, 1,
1.108433, 0.3847653, 2.332171, 1, 0, 0, 1, 1,
1.108894, -0.06144787, 2.776704, 1, 0, 0, 1, 1,
1.116744, 0.9883082, 0.1417531, 0, 0, 0, 1, 1,
1.120767, -0.8196474, 1.778248, 0, 0, 0, 1, 1,
1.121167, -1.550906, 1.716724, 0, 0, 0, 1, 1,
1.123565, -0.6650435, 2.069153, 0, 0, 0, 1, 1,
1.124831, -0.8471565, 1.39348, 0, 0, 0, 1, 1,
1.129717, -0.9799999, 2.504647, 0, 0, 0, 1, 1,
1.136932, 0.3408703, 2.735283, 0, 0, 0, 1, 1,
1.152146, 0.02030003, 1.467375, 1, 1, 1, 1, 1,
1.158859, -0.1075734, 2.070456, 1, 1, 1, 1, 1,
1.158882, -0.4039978, 2.656758, 1, 1, 1, 1, 1,
1.171033, -2.61678, 3.724264, 1, 1, 1, 1, 1,
1.183448, -1.41049, 2.890887, 1, 1, 1, 1, 1,
1.187609, 1.11483, 0.2907324, 1, 1, 1, 1, 1,
1.198864, -0.4899322, 1.718571, 1, 1, 1, 1, 1,
1.213874, 1.5513, -0.620583, 1, 1, 1, 1, 1,
1.220365, 0.2218993, 2.666323, 1, 1, 1, 1, 1,
1.224013, -1.646307, 1.868909, 1, 1, 1, 1, 1,
1.224667, 0.09094329, 1.344677, 1, 1, 1, 1, 1,
1.228125, 0.645678, 1.592686, 1, 1, 1, 1, 1,
1.23534, -0.787725, 3.118436, 1, 1, 1, 1, 1,
1.249991, 0.1604027, 2.429176, 1, 1, 1, 1, 1,
1.251381, 0.103347, 0.5034603, 1, 1, 1, 1, 1,
1.254978, 0.6547164, 1.181494, 0, 0, 1, 1, 1,
1.255766, 0.3058437, 1.029059, 1, 0, 0, 1, 1,
1.260905, 0.3277664, 0.5119554, 1, 0, 0, 1, 1,
1.263109, 0.01030067, 2.440513, 1, 0, 0, 1, 1,
1.275269, -0.105234, 2.140392, 1, 0, 0, 1, 1,
1.275973, -1.290781, -0.2301021, 1, 0, 0, 1, 1,
1.276996, 2.203481, -0.9078856, 0, 0, 0, 1, 1,
1.28252, -0.4427447, 3.144521, 0, 0, 0, 1, 1,
1.288958, -0.1301017, 0.9659737, 0, 0, 0, 1, 1,
1.291468, -0.7187898, 3.551979, 0, 0, 0, 1, 1,
1.312984, -1.304429, 3.513103, 0, 0, 0, 1, 1,
1.320143, -0.2455728, 2.416951, 0, 0, 0, 1, 1,
1.324018, -0.3058577, 2.918403, 0, 0, 0, 1, 1,
1.32696, 0.1158592, 1.561606, 1, 1, 1, 1, 1,
1.335813, 0.4216727, 1.030924, 1, 1, 1, 1, 1,
1.340659, -1.26208, 3.240875, 1, 1, 1, 1, 1,
1.353983, 1.390082, 1.289897, 1, 1, 1, 1, 1,
1.358512, 0.1376981, 3.132768, 1, 1, 1, 1, 1,
1.358648, -2.403783, 1.379579, 1, 1, 1, 1, 1,
1.358979, -0.3754314, 1.210139, 1, 1, 1, 1, 1,
1.369027, 0.4323966, 2.185729, 1, 1, 1, 1, 1,
1.369159, -0.301549, 0.1027575, 1, 1, 1, 1, 1,
1.379768, 0.5735856, 1.549067, 1, 1, 1, 1, 1,
1.384021, -0.3641717, 1.432705, 1, 1, 1, 1, 1,
1.390753, -1.192758, -0.3380339, 1, 1, 1, 1, 1,
1.391494, 0.006135723, 1.391395, 1, 1, 1, 1, 1,
1.391694, 0.002834936, 1.350985, 1, 1, 1, 1, 1,
1.396428, 1.124316, 0.8036903, 1, 1, 1, 1, 1,
1.398048, 0.8503903, -0.5165374, 0, 0, 1, 1, 1,
1.41655, -1.151851, 2.500252, 1, 0, 0, 1, 1,
1.419868, -1.352899, -0.0955264, 1, 0, 0, 1, 1,
1.433912, -1.626109, 2.928738, 1, 0, 0, 1, 1,
1.435245, 2.028232, 0.1128135, 1, 0, 0, 1, 1,
1.447621, 0.9184972, 1.370035, 1, 0, 0, 1, 1,
1.455353, 0.0589264, 2.499601, 0, 0, 0, 1, 1,
1.461985, 0.3431973, -0.8034221, 0, 0, 0, 1, 1,
1.462078, 0.3965474, 2.169534, 0, 0, 0, 1, 1,
1.467263, -0.4332946, 1.666886, 0, 0, 0, 1, 1,
1.486365, -0.4831118, 2.406044, 0, 0, 0, 1, 1,
1.490817, 0.5498246, 0.05967875, 0, 0, 0, 1, 1,
1.512826, 0.9015421, 1.11008, 0, 0, 0, 1, 1,
1.513134, -0.380374, 1.098917, 1, 1, 1, 1, 1,
1.52889, -0.9756458, 1.648408, 1, 1, 1, 1, 1,
1.532797, -1.643069, 1.142677, 1, 1, 1, 1, 1,
1.554209, -1.78421, 2.180883, 1, 1, 1, 1, 1,
1.557115, 0.3850977, 0.6691582, 1, 1, 1, 1, 1,
1.563873, -0.9446936, 1.684326, 1, 1, 1, 1, 1,
1.565464, 1.246588, 0.5470767, 1, 1, 1, 1, 1,
1.591893, -0.4496998, 4.000103, 1, 1, 1, 1, 1,
1.598781, -0.5051783, 2.26538, 1, 1, 1, 1, 1,
1.619127, 0.9520417, 0.580802, 1, 1, 1, 1, 1,
1.619144, -0.3418255, 1.496499, 1, 1, 1, 1, 1,
1.622229, -0.7199205, 3.061369, 1, 1, 1, 1, 1,
1.629961, 1.233, 1.288369, 1, 1, 1, 1, 1,
1.630811, -0.4836974, 0.9015205, 1, 1, 1, 1, 1,
1.647393, -0.1872459, 1.782877, 1, 1, 1, 1, 1,
1.661557, 1.255436, 1.45069, 0, 0, 1, 1, 1,
1.668658, 0.3032136, 1.659802, 1, 0, 0, 1, 1,
1.682301, -2.012712, 2.578662, 1, 0, 0, 1, 1,
1.68723, 1.59365, 2.554775, 1, 0, 0, 1, 1,
1.697381, 0.6651282, 0.7553377, 1, 0, 0, 1, 1,
1.698152, 1.292799, 1.051833, 1, 0, 0, 1, 1,
1.730443, 0.6326066, 0.1160186, 0, 0, 0, 1, 1,
1.737428, 0.2581777, 1.236041, 0, 0, 0, 1, 1,
1.750581, 1.101967, 0.8346856, 0, 0, 0, 1, 1,
1.75581, -0.6216507, 2.482505, 0, 0, 0, 1, 1,
1.759439, 2.176587, -1.288687, 0, 0, 0, 1, 1,
1.769665, -0.5250088, 0.8622596, 0, 0, 0, 1, 1,
1.77552, -1.208752, 1.317031, 0, 0, 0, 1, 1,
1.776673, 0.3316858, 0.907957, 1, 1, 1, 1, 1,
1.802229, -1.018362, 1.691836, 1, 1, 1, 1, 1,
1.815456, -0.2989477, 2.360715, 1, 1, 1, 1, 1,
1.819741, -0.3221641, 2.018858, 1, 1, 1, 1, 1,
1.83623, -0.7614505, 1.122493, 1, 1, 1, 1, 1,
1.837711, -0.4282975, -0.3713156, 1, 1, 1, 1, 1,
1.83841, 0.1486553, 2.059675, 1, 1, 1, 1, 1,
1.854847, 1.521539, -0.5148284, 1, 1, 1, 1, 1,
1.857937, 1.064565, 0.1613099, 1, 1, 1, 1, 1,
1.863262, -3.242889, 2.78311, 1, 1, 1, 1, 1,
1.872397, 0.8086929, 1.797966, 1, 1, 1, 1, 1,
1.872874, -0.3254444, 2.035623, 1, 1, 1, 1, 1,
1.896896, -0.9074439, 2.00386, 1, 1, 1, 1, 1,
1.90857, -0.8776071, 2.84984, 1, 1, 1, 1, 1,
1.915495, 1.22371, 1.705194, 1, 1, 1, 1, 1,
1.964517, 0.4586595, 1.586885, 0, 0, 1, 1, 1,
1.970417, 0.3428217, 0.7579463, 1, 0, 0, 1, 1,
1.985402, 0.3671177, 2.404773, 1, 0, 0, 1, 1,
2.014857, -0.3278381, 2.318627, 1, 0, 0, 1, 1,
2.034379, 0.06234038, 1.162385, 1, 0, 0, 1, 1,
2.086707, 0.6503664, 0.7563506, 1, 0, 0, 1, 1,
2.105742, 0.8710057, 1.701631, 0, 0, 0, 1, 1,
2.118814, -0.9665154, 3.28827, 0, 0, 0, 1, 1,
2.140635, -0.05119836, 1.595592, 0, 0, 0, 1, 1,
2.141613, 0.3156646, 0.04278773, 0, 0, 0, 1, 1,
2.182055, -0.5151069, 1.072641, 0, 0, 0, 1, 1,
2.212133, -0.7250956, 0.2889596, 0, 0, 0, 1, 1,
2.236422, 1.009397, 1.261457, 0, 0, 0, 1, 1,
2.363869, -0.3978151, 2.80011, 1, 1, 1, 1, 1,
2.391112, -2.789554, 3.339912, 1, 1, 1, 1, 1,
2.407709, -1.120771, 1.335987, 1, 1, 1, 1, 1,
2.501635, 1.748322, 1.137803, 1, 1, 1, 1, 1,
2.526958, 0.3106585, 1.825688, 1, 1, 1, 1, 1,
2.656497, -0.8142389, 1.776988, 1, 1, 1, 1, 1,
2.711679, 0.2468055, 1.193372, 1, 1, 1, 1, 1
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
var radius = 9.544881;
var distance = 33.52599;
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
mvMatrix.translate( 0.2806293, 0.2720842, -0.4172232 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.52599);
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
