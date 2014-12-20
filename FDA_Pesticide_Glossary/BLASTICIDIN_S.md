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
-2.822599, 0.2658173, -0.06404036, 1, 0, 0, 1,
-2.636915, -1.063297, -0.8739275, 1, 0.007843138, 0, 1,
-2.611309, 0.01715663, -1.702501, 1, 0.01176471, 0, 1,
-2.426231, 0.4252442, -3.073184, 1, 0.01960784, 0, 1,
-2.363682, -1.136184, -2.833914, 1, 0.02352941, 0, 1,
-2.352631, -1.135177, -1.357146, 1, 0.03137255, 0, 1,
-2.341825, 1.325331, -1.618019, 1, 0.03529412, 0, 1,
-2.285662, -1.033095, -2.354342, 1, 0.04313726, 0, 1,
-2.213163, -0.7509885, -1.497437, 1, 0.04705882, 0, 1,
-2.207376, -1.530276, -3.062084, 1, 0.05490196, 0, 1,
-2.189826, -0.4985593, -1.286267, 1, 0.05882353, 0, 1,
-2.18731, -0.4672778, -1.329998, 1, 0.06666667, 0, 1,
-2.17835, -1.108422, -3.078144, 1, 0.07058824, 0, 1,
-2.151315, -0.2407141, -1.690127, 1, 0.07843138, 0, 1,
-2.069648, 0.6607386, -2.151808, 1, 0.08235294, 0, 1,
-2.039021, -1.04859, -1.882187, 1, 0.09019608, 0, 1,
-2.025705, 0.9065637, -1.428492, 1, 0.09411765, 0, 1,
-2.001504, -1.640388, -3.922134, 1, 0.1019608, 0, 1,
-1.986938, -0.5298185, -1.08574, 1, 0.1098039, 0, 1,
-1.976091, -1.092055, -2.360246, 1, 0.1137255, 0, 1,
-1.96247, -1.053324, -1.010847, 1, 0.1215686, 0, 1,
-1.945414, -0.4311123, -3.054919, 1, 0.1254902, 0, 1,
-1.893773, 1.272932, -1.275783, 1, 0.1333333, 0, 1,
-1.889582, 0.6772964, -1.203122, 1, 0.1372549, 0, 1,
-1.878309, -1.706616, -1.42597, 1, 0.145098, 0, 1,
-1.852987, -2.002175, -1.853442, 1, 0.1490196, 0, 1,
-1.846513, 1.814115, -2.605262, 1, 0.1568628, 0, 1,
-1.844735, 0.5911286, -2.47547, 1, 0.1607843, 0, 1,
-1.830014, -2.143134, -3.064366, 1, 0.1686275, 0, 1,
-1.818654, -0.6084261, -1.358624, 1, 0.172549, 0, 1,
-1.807255, -0.3248885, 0.2746237, 1, 0.1803922, 0, 1,
-1.804219, 0.213865, -1.084815, 1, 0.1843137, 0, 1,
-1.802624, -0.7911847, -2.439605, 1, 0.1921569, 0, 1,
-1.795413, 0.6852942, 0.5268086, 1, 0.1960784, 0, 1,
-1.794088, -0.2478838, -3.817617, 1, 0.2039216, 0, 1,
-1.790673, -0.7369246, -1.676558, 1, 0.2117647, 0, 1,
-1.787816, 0.07298396, -2.853132, 1, 0.2156863, 0, 1,
-1.767308, -1.247264, -2.119965, 1, 0.2235294, 0, 1,
-1.748671, 0.2661549, -2.920184, 1, 0.227451, 0, 1,
-1.745002, -1.166485, 0.5446163, 1, 0.2352941, 0, 1,
-1.740853, 0.7907148, -1.419761, 1, 0.2392157, 0, 1,
-1.730214, 1.19822, -2.521722, 1, 0.2470588, 0, 1,
-1.726166, 1.25277, -2.235482, 1, 0.2509804, 0, 1,
-1.722359, 0.003056514, -1.361847, 1, 0.2588235, 0, 1,
-1.700074, 1.456582, -2.425454, 1, 0.2627451, 0, 1,
-1.694161, -0.894017, -2.188215, 1, 0.2705882, 0, 1,
-1.682017, 0.3786503, 0.7087386, 1, 0.2745098, 0, 1,
-1.675102, 0.6883757, -0.8458177, 1, 0.282353, 0, 1,
-1.67268, 0.5602278, -2.04706, 1, 0.2862745, 0, 1,
-1.658072, 2.047181, 0.2489385, 1, 0.2941177, 0, 1,
-1.634311, -0.6155584, -1.83815, 1, 0.3019608, 0, 1,
-1.629143, -0.5270782, -1.528578, 1, 0.3058824, 0, 1,
-1.609088, -1.241968, -0.920013, 1, 0.3137255, 0, 1,
-1.607206, 2.362976, -0.4709685, 1, 0.3176471, 0, 1,
-1.585774, -0.7737421, -0.8747875, 1, 0.3254902, 0, 1,
-1.583519, -1.117221, -1.058432, 1, 0.3294118, 0, 1,
-1.570836, 0.2634882, -1.316275, 1, 0.3372549, 0, 1,
-1.564091, 0.8344341, -1.224211, 1, 0.3411765, 0, 1,
-1.561625, -0.07393616, -1.211004, 1, 0.3490196, 0, 1,
-1.545596, 1.379144, -1.224141, 1, 0.3529412, 0, 1,
-1.529323, 0.8791668, -0.9397938, 1, 0.3607843, 0, 1,
-1.523474, 1.849331, -0.2193836, 1, 0.3647059, 0, 1,
-1.516861, 0.02519471, -1.939681, 1, 0.372549, 0, 1,
-1.514548, 0.4923141, -2.212957, 1, 0.3764706, 0, 1,
-1.51095, -1.655093, -2.833152, 1, 0.3843137, 0, 1,
-1.496265, -0.526009, -2.247406, 1, 0.3882353, 0, 1,
-1.484168, 1.44221, 0.1171341, 1, 0.3960784, 0, 1,
-1.483184, -0.7580954, -1.588661, 1, 0.4039216, 0, 1,
-1.477664, 1.093733, -0.4197061, 1, 0.4078431, 0, 1,
-1.456654, -0.2055936, -1.831721, 1, 0.4156863, 0, 1,
-1.451627, 0.8157306, 1.067666, 1, 0.4196078, 0, 1,
-1.451542, -0.798821, -0.4131125, 1, 0.427451, 0, 1,
-1.448877, -0.6612851, -2.051972, 1, 0.4313726, 0, 1,
-1.428442, -0.5203617, -0.5022018, 1, 0.4392157, 0, 1,
-1.415684, 0.1473856, -0.06179737, 1, 0.4431373, 0, 1,
-1.414248, -1.026147, -3.317038, 1, 0.4509804, 0, 1,
-1.407317, -0.7457414, -2.054242, 1, 0.454902, 0, 1,
-1.392256, 0.02975413, -1.202728, 1, 0.4627451, 0, 1,
-1.392202, -0.7530984, -2.100674, 1, 0.4666667, 0, 1,
-1.379739, -0.2974977, -1.04609, 1, 0.4745098, 0, 1,
-1.378664, 0.16876, -0.4995998, 1, 0.4784314, 0, 1,
-1.359396, -0.8105971, -0.2076887, 1, 0.4862745, 0, 1,
-1.3586, -1.105255, -2.810973, 1, 0.4901961, 0, 1,
-1.338407, -1.799705, -1.394672, 1, 0.4980392, 0, 1,
-1.333917, 1.161484, -2.274578, 1, 0.5058824, 0, 1,
-1.326705, -0.4206001, -1.39212, 1, 0.509804, 0, 1,
-1.316424, -2.000083, -1.820549, 1, 0.5176471, 0, 1,
-1.30638, 2.173056, 0.07395113, 1, 0.5215687, 0, 1,
-1.294151, -1.438313, -0.6905352, 1, 0.5294118, 0, 1,
-1.291896, 0.3523247, -1.227665, 1, 0.5333334, 0, 1,
-1.284992, 1.656874, -1.822675, 1, 0.5411765, 0, 1,
-1.276147, 2.404676, -0.3487022, 1, 0.5450981, 0, 1,
-1.263265, 0.1185898, -1.676751, 1, 0.5529412, 0, 1,
-1.257253, 1.226272, -0.4493543, 1, 0.5568628, 0, 1,
-1.253198, -1.734886, -0.9375252, 1, 0.5647059, 0, 1,
-1.244031, -0.9886612, -3.457374, 1, 0.5686275, 0, 1,
-1.23975, 0.2595212, -1.947011, 1, 0.5764706, 0, 1,
-1.233016, 0.5855234, 0.725401, 1, 0.5803922, 0, 1,
-1.223477, -0.277306, -2.534256, 1, 0.5882353, 0, 1,
-1.219971, -1.727733, -1.417369, 1, 0.5921569, 0, 1,
-1.214832, 2.854676, -0.8966824, 1, 0.6, 0, 1,
-1.212822, -0.4975865, -3.245319, 1, 0.6078432, 0, 1,
-1.211114, -1.38981, -3.029674, 1, 0.6117647, 0, 1,
-1.203058, -1.082731, -0.9555032, 1, 0.6196079, 0, 1,
-1.181384, -0.5359893, -2.78113, 1, 0.6235294, 0, 1,
-1.175577, -1.263324, -2.791057, 1, 0.6313726, 0, 1,
-1.174184, -0.1211216, -1.704248, 1, 0.6352941, 0, 1,
-1.165805, 0.2237017, -2.672691, 1, 0.6431373, 0, 1,
-1.1618, -0.1454577, -2.586093, 1, 0.6470588, 0, 1,
-1.154589, -0.1162917, -0.5545226, 1, 0.654902, 0, 1,
-1.149862, -0.5727507, -0.7502264, 1, 0.6588235, 0, 1,
-1.146434, 0.2404569, -3.488207, 1, 0.6666667, 0, 1,
-1.136184, 0.3698891, -0.4262719, 1, 0.6705883, 0, 1,
-1.115859, -0.10088, -2.636596, 1, 0.6784314, 0, 1,
-1.103571, -0.05243231, -1.949078, 1, 0.682353, 0, 1,
-1.101844, -0.8214893, -0.6010329, 1, 0.6901961, 0, 1,
-1.094868, -2.232316, -1.586203, 1, 0.6941177, 0, 1,
-1.091552, 0.7088097, -0.3795198, 1, 0.7019608, 0, 1,
-1.089894, -0.325835, -3.160077, 1, 0.7098039, 0, 1,
-1.084657, 1.084552, -0.9477836, 1, 0.7137255, 0, 1,
-1.076127, 0.6762874, -2.955627, 1, 0.7215686, 0, 1,
-1.075626, -0.9325753, -0.8856491, 1, 0.7254902, 0, 1,
-1.074482, 0.4680489, -1.425305, 1, 0.7333333, 0, 1,
-1.072979, 0.2479919, -0.4351303, 1, 0.7372549, 0, 1,
-1.070122, 0.2455662, -1.591716, 1, 0.7450981, 0, 1,
-1.068893, 0.4506282, -0.5873941, 1, 0.7490196, 0, 1,
-1.067882, 2.02938, -1.336681, 1, 0.7568628, 0, 1,
-1.066292, -0.3434221, -1.814333, 1, 0.7607843, 0, 1,
-1.062891, 1.743926, -1.410185, 1, 0.7686275, 0, 1,
-1.061794, 0.3537581, -2.611066, 1, 0.772549, 0, 1,
-1.053099, 0.1033454, -2.587229, 1, 0.7803922, 0, 1,
-1.052471, -0.5411732, -2.691696, 1, 0.7843137, 0, 1,
-1.050078, -1.372535, -2.60365, 1, 0.7921569, 0, 1,
-1.047343, 0.03624886, -1.094565, 1, 0.7960784, 0, 1,
-1.036949, 2.479801, 0.1713917, 1, 0.8039216, 0, 1,
-1.034312, 0.3029529, 0.2712677, 1, 0.8117647, 0, 1,
-1.013482, 0.7328227, -2.048022, 1, 0.8156863, 0, 1,
-1.012058, 1.662801, -2.651371, 1, 0.8235294, 0, 1,
-1.00691, 0.4007327, 0.1986842, 1, 0.827451, 0, 1,
-1.004969, 0.2134192, 1.056534, 1, 0.8352941, 0, 1,
-0.9943375, 0.09583448, -1.000491, 1, 0.8392157, 0, 1,
-0.9870639, 1.774208, -0.5008222, 1, 0.8470588, 0, 1,
-0.9833419, -0.7463924, -1.808098, 1, 0.8509804, 0, 1,
-0.9788759, 0.4476865, -3.206151, 1, 0.8588235, 0, 1,
-0.977605, 0.155991, -2.17063, 1, 0.8627451, 0, 1,
-0.9766682, 0.03280015, -3.099962, 1, 0.8705882, 0, 1,
-0.9744307, -0.4945876, -1.793692, 1, 0.8745098, 0, 1,
-0.9722024, -0.009410284, -1.92006, 1, 0.8823529, 0, 1,
-0.9685777, -1.681293, -3.981588, 1, 0.8862745, 0, 1,
-0.9613339, 0.5138608, -1.792698, 1, 0.8941177, 0, 1,
-0.9608093, -0.05186265, -1.26128, 1, 0.8980392, 0, 1,
-0.9593952, 2.622533, 0.4910356, 1, 0.9058824, 0, 1,
-0.9519825, -0.2272406, -0.05601411, 1, 0.9137255, 0, 1,
-0.9487498, 0.9615504, -0.01049532, 1, 0.9176471, 0, 1,
-0.9459088, -1.448203, -1.731956, 1, 0.9254902, 0, 1,
-0.9445687, -1.04611, -3.677906, 1, 0.9294118, 0, 1,
-0.9424312, -1.229627, -2.032979, 1, 0.9372549, 0, 1,
-0.937744, 0.6279195, -2.451552, 1, 0.9411765, 0, 1,
-0.9344561, 0.8801467, 0.437515, 1, 0.9490196, 0, 1,
-0.9329766, -1.482865, -2.791889, 1, 0.9529412, 0, 1,
-0.9264044, -0.08653222, -2.499461, 1, 0.9607843, 0, 1,
-0.9219208, -0.103447, -1.241213, 1, 0.9647059, 0, 1,
-0.9149666, 1.246534, -0.8029129, 1, 0.972549, 0, 1,
-0.9126744, -0.7686326, -2.891587, 1, 0.9764706, 0, 1,
-0.9113118, 0.05911507, -1.468493, 1, 0.9843137, 0, 1,
-0.910743, 1.862296, -1.207634, 1, 0.9882353, 0, 1,
-0.9041424, -0.263543, -2.999753, 1, 0.9960784, 0, 1,
-0.9016108, 0.9621944, -0.1730737, 0.9960784, 1, 0, 1,
-0.8989169, -0.9482969, -2.74395, 0.9921569, 1, 0, 1,
-0.8968373, -0.8910502, -2.520384, 0.9843137, 1, 0, 1,
-0.8965937, -1.140884, -2.791462, 0.9803922, 1, 0, 1,
-0.8935235, 0.7501699, -0.2026218, 0.972549, 1, 0, 1,
-0.8918663, 1.565007, -0.4102599, 0.9686275, 1, 0, 1,
-0.8913831, 0.8066159, 0.8778962, 0.9607843, 1, 0, 1,
-0.8850252, -0.245897, -1.280835, 0.9568627, 1, 0, 1,
-0.8849365, -2.112361, -1.011338, 0.9490196, 1, 0, 1,
-0.8818298, -0.771475, -2.350649, 0.945098, 1, 0, 1,
-0.8814542, 0.2937301, -0.2662016, 0.9372549, 1, 0, 1,
-0.8781683, 1.053961, 0.04417181, 0.9333333, 1, 0, 1,
-0.8752782, 0.4665794, -0.9239987, 0.9254902, 1, 0, 1,
-0.8708651, 1.27241, -1.518764, 0.9215686, 1, 0, 1,
-0.8703001, 1.469751, 0.5296365, 0.9137255, 1, 0, 1,
-0.8686646, 0.6805217, 0.09459352, 0.9098039, 1, 0, 1,
-0.8667579, 0.2710527, -2.209887, 0.9019608, 1, 0, 1,
-0.8665931, 0.5230281, 0.2651328, 0.8941177, 1, 0, 1,
-0.8653026, -1.862403, -2.088955, 0.8901961, 1, 0, 1,
-0.8642482, 1.720825, 0.03142583, 0.8823529, 1, 0, 1,
-0.864033, -2.246789, -1.67378, 0.8784314, 1, 0, 1,
-0.858516, -1.3372, -3.596346, 0.8705882, 1, 0, 1,
-0.8557237, -2.451075, -4.199385, 0.8666667, 1, 0, 1,
-0.8555421, 0.1184131, -1.831784, 0.8588235, 1, 0, 1,
-0.854886, -0.5599151, -2.151982, 0.854902, 1, 0, 1,
-0.8468045, -0.4814181, -0.4906216, 0.8470588, 1, 0, 1,
-0.8432097, 0.7011725, 0.3625908, 0.8431373, 1, 0, 1,
-0.8396258, -0.4055941, -1.923013, 0.8352941, 1, 0, 1,
-0.8314371, -1.282977, -2.100724, 0.8313726, 1, 0, 1,
-0.8306257, -1.106793, -1.221904, 0.8235294, 1, 0, 1,
-0.8201686, -1.775169, -2.734204, 0.8196079, 1, 0, 1,
-0.8148597, 1.376696, 0.8394175, 0.8117647, 1, 0, 1,
-0.8099047, 0.9949824, -0.4364217, 0.8078431, 1, 0, 1,
-0.8080797, -1.054603, -1.878873, 0.8, 1, 0, 1,
-0.8037024, 0.4281415, -1.469039, 0.7921569, 1, 0, 1,
-0.8022444, -0.6123547, -1.832916, 0.7882353, 1, 0, 1,
-0.8018633, 2.153152, -1.691043, 0.7803922, 1, 0, 1,
-0.7992054, 0.04878683, -0.9198905, 0.7764706, 1, 0, 1,
-0.7965491, -1.659979, -2.515226, 0.7686275, 1, 0, 1,
-0.7935587, -0.9698055, -1.184189, 0.7647059, 1, 0, 1,
-0.7911528, -0.6273075, -3.136889, 0.7568628, 1, 0, 1,
-0.7887025, 0.4294348, -0.7715153, 0.7529412, 1, 0, 1,
-0.7872645, 0.39706, -0.3774245, 0.7450981, 1, 0, 1,
-0.7854486, -1.306535, -1.831542, 0.7411765, 1, 0, 1,
-0.7838573, -2.08998, -3.921302, 0.7333333, 1, 0, 1,
-0.782244, -0.2824737, -1.515637, 0.7294118, 1, 0, 1,
-0.7749171, -0.04984405, -0.8780366, 0.7215686, 1, 0, 1,
-0.7634562, -0.5418723, -1.201316, 0.7176471, 1, 0, 1,
-0.7602504, -1.046243, -0.5189314, 0.7098039, 1, 0, 1,
-0.757414, 1.646656, -0.6475577, 0.7058824, 1, 0, 1,
-0.750927, 1.68856, -1.104098, 0.6980392, 1, 0, 1,
-0.7485812, 1.006034, -0.67426, 0.6901961, 1, 0, 1,
-0.7468428, 2.684983, -1.331883, 0.6862745, 1, 0, 1,
-0.7457413, 0.06165019, -1.465127, 0.6784314, 1, 0, 1,
-0.7398062, 0.4318882, -1.213987, 0.6745098, 1, 0, 1,
-0.7336593, -0.02579517, -2.182684, 0.6666667, 1, 0, 1,
-0.733372, -2.386028, -2.130127, 0.6627451, 1, 0, 1,
-0.7327073, -0.0795655, -1.531555, 0.654902, 1, 0, 1,
-0.7220263, 0.632894, -1.546933, 0.6509804, 1, 0, 1,
-0.718629, -1.768406, -2.418307, 0.6431373, 1, 0, 1,
-0.7151982, -2.562098, -2.830174, 0.6392157, 1, 0, 1,
-0.7072556, 0.2740515, -1.436428, 0.6313726, 1, 0, 1,
-0.7050809, -0.7045267, -3.001009, 0.627451, 1, 0, 1,
-0.704862, -1.403118, -4.373492, 0.6196079, 1, 0, 1,
-0.7024848, 1.213666, -1.000337, 0.6156863, 1, 0, 1,
-0.7010825, -0.673508, -1.082075, 0.6078432, 1, 0, 1,
-0.686829, 0.5727813, -1.254122, 0.6039216, 1, 0, 1,
-0.6865153, -0.1108584, -4.606476, 0.5960785, 1, 0, 1,
-0.6853334, -0.8919637, -0.3787594, 0.5882353, 1, 0, 1,
-0.6829743, -0.8079334, -1.299294, 0.5843138, 1, 0, 1,
-0.6796178, 1.132436, -1.086232, 0.5764706, 1, 0, 1,
-0.6792077, -0.3007797, -0.8496723, 0.572549, 1, 0, 1,
-0.6788485, 0.4929693, -1.434638, 0.5647059, 1, 0, 1,
-0.6780814, 0.3776067, -1.521634, 0.5607843, 1, 0, 1,
-0.6734519, -1.152873, -3.28703, 0.5529412, 1, 0, 1,
-0.6730195, 0.5101404, -0.7835373, 0.5490196, 1, 0, 1,
-0.6715917, -0.4213333, -1.276075, 0.5411765, 1, 0, 1,
-0.6620458, 0.3699905, -1.417201, 0.5372549, 1, 0, 1,
-0.6612185, -0.9200809, -1.507978, 0.5294118, 1, 0, 1,
-0.6610728, 0.5616825, 2.515066, 0.5254902, 1, 0, 1,
-0.6581556, 0.2346874, -2.572807, 0.5176471, 1, 0, 1,
-0.6536564, -1.130557, -1.409883, 0.5137255, 1, 0, 1,
-0.6528788, -1.742548, -1.848366, 0.5058824, 1, 0, 1,
-0.6490726, 0.2007875, -0.9227322, 0.5019608, 1, 0, 1,
-0.6488091, 1.309505, 0.5450071, 0.4941176, 1, 0, 1,
-0.6395553, 0.3575383, -2.249914, 0.4862745, 1, 0, 1,
-0.6358223, -0.6282445, -3.384331, 0.4823529, 1, 0, 1,
-0.621017, 0.6181697, 0.06489485, 0.4745098, 1, 0, 1,
-0.6176007, -1.214274, -1.321257, 0.4705882, 1, 0, 1,
-0.6134968, 0.8571492, 0.1580858, 0.4627451, 1, 0, 1,
-0.6134236, -0.13011, -2.826756, 0.4588235, 1, 0, 1,
-0.6122812, -1.02963, -1.815819, 0.4509804, 1, 0, 1,
-0.6103567, -0.06467465, -2.405944, 0.4470588, 1, 0, 1,
-0.6082633, 1.585248, -0.2926549, 0.4392157, 1, 0, 1,
-0.6047656, -0.5376909, -1.997586, 0.4352941, 1, 0, 1,
-0.6027126, 0.4236582, -1.439037, 0.427451, 1, 0, 1,
-0.6026114, -0.5185133, -1.659317, 0.4235294, 1, 0, 1,
-0.5999202, -0.4658612, -1.802117, 0.4156863, 1, 0, 1,
-0.597782, 0.9587513, 0.1678481, 0.4117647, 1, 0, 1,
-0.5970957, 0.02583843, 0.3497385, 0.4039216, 1, 0, 1,
-0.5945693, 0.3206685, -2.19066, 0.3960784, 1, 0, 1,
-0.5928169, 0.1932186, -1.061089, 0.3921569, 1, 0, 1,
-0.5910193, 0.7221204, -2.520953, 0.3843137, 1, 0, 1,
-0.5833084, -1.470063, -1.852943, 0.3803922, 1, 0, 1,
-0.5810694, -0.5988521, -2.071661, 0.372549, 1, 0, 1,
-0.571353, -0.8275676, -4.114937, 0.3686275, 1, 0, 1,
-0.5711028, 1.031671, 0.1622031, 0.3607843, 1, 0, 1,
-0.5688241, -0.9288899, -3.402886, 0.3568628, 1, 0, 1,
-0.5686696, 1.497472, -0.2699569, 0.3490196, 1, 0, 1,
-0.5669521, -0.8881361, -2.481089, 0.345098, 1, 0, 1,
-0.5667979, 0.20653, -0.6302668, 0.3372549, 1, 0, 1,
-0.5655789, -1.225765, -2.340128, 0.3333333, 1, 0, 1,
-0.5545493, 0.6570835, -0.8391867, 0.3254902, 1, 0, 1,
-0.5541492, -0.7606197, -2.365261, 0.3215686, 1, 0, 1,
-0.5508628, -1.330867, -3.208276, 0.3137255, 1, 0, 1,
-0.5506904, 0.4506411, -3.582115, 0.3098039, 1, 0, 1,
-0.5450332, 0.9134503, 0.02576885, 0.3019608, 1, 0, 1,
-0.5421414, 0.6965496, 0.5016336, 0.2941177, 1, 0, 1,
-0.5387318, 0.02862791, -1.977803, 0.2901961, 1, 0, 1,
-0.5379245, -1.382317, -2.451324, 0.282353, 1, 0, 1,
-0.5375999, -0.7069885, -1.908177, 0.2784314, 1, 0, 1,
-0.5357807, -1.23778, -4.251051, 0.2705882, 1, 0, 1,
-0.5354042, -0.265925, -2.25248, 0.2666667, 1, 0, 1,
-0.534768, 0.7062826, -1.747177, 0.2588235, 1, 0, 1,
-0.5308771, 0.6192575, -1.378838, 0.254902, 1, 0, 1,
-0.5288749, 0.5845479, -1.03537, 0.2470588, 1, 0, 1,
-0.5281063, -1.877798, -1.679385, 0.2431373, 1, 0, 1,
-0.5253417, -0.9578568, -2.249653, 0.2352941, 1, 0, 1,
-0.5202705, -0.2236079, -3.60265, 0.2313726, 1, 0, 1,
-0.5186858, -1.210457, -3.48721, 0.2235294, 1, 0, 1,
-0.5172367, 0.8265378, -1.137583, 0.2196078, 1, 0, 1,
-0.5085309, -1.439069, -1.874524, 0.2117647, 1, 0, 1,
-0.5070081, -0.3261567, -0.9389427, 0.2078431, 1, 0, 1,
-0.5066847, -1.059391, -2.231466, 0.2, 1, 0, 1,
-0.5065369, 0.4831691, -0.4166102, 0.1921569, 1, 0, 1,
-0.5059513, 0.9655315, -0.3798677, 0.1882353, 1, 0, 1,
-0.5057504, 0.2520801, -2.234718, 0.1803922, 1, 0, 1,
-0.5056701, 1.668887, 0.01068229, 0.1764706, 1, 0, 1,
-0.5047839, 0.3735301, -2.378379, 0.1686275, 1, 0, 1,
-0.504151, -0.639425, -1.990471, 0.1647059, 1, 0, 1,
-0.5033141, -0.5723447, -3.425395, 0.1568628, 1, 0, 1,
-0.5001319, -0.6521146, -2.876386, 0.1529412, 1, 0, 1,
-0.4990105, 0.03878079, -2.466966, 0.145098, 1, 0, 1,
-0.4937424, -0.5559157, -3.868177, 0.1411765, 1, 0, 1,
-0.4929608, -0.0754371, -2.90799, 0.1333333, 1, 0, 1,
-0.4900356, 0.7637217, -1.641178, 0.1294118, 1, 0, 1,
-0.4899046, 1.097887, -1.517796, 0.1215686, 1, 0, 1,
-0.4889476, 0.1940574, -0.9405465, 0.1176471, 1, 0, 1,
-0.4884745, -0.07890061, -2.800401, 0.1098039, 1, 0, 1,
-0.4855702, 0.1403011, 0.03042025, 0.1058824, 1, 0, 1,
-0.4783363, 0.1673237, -1.066722, 0.09803922, 1, 0, 1,
-0.4704041, 0.4901835, -2.546157, 0.09019608, 1, 0, 1,
-0.4703756, 0.01123524, -2.641896, 0.08627451, 1, 0, 1,
-0.4651634, 1.457825, 1.417085, 0.07843138, 1, 0, 1,
-0.4642622, -0.9996849, -3.397559, 0.07450981, 1, 0, 1,
-0.4516073, 0.8624988, -1.969406, 0.06666667, 1, 0, 1,
-0.4457138, -1.042522, -1.831393, 0.0627451, 1, 0, 1,
-0.4439034, 0.20738, 0.4210598, 0.05490196, 1, 0, 1,
-0.4429597, -0.536566, -2.616304, 0.05098039, 1, 0, 1,
-0.437005, 2.399825, 0.616991, 0.04313726, 1, 0, 1,
-0.4321457, -0.454937, -2.095105, 0.03921569, 1, 0, 1,
-0.4308204, 0.5905608, -0.2634222, 0.03137255, 1, 0, 1,
-0.4239787, 0.3020246, -1.169999, 0.02745098, 1, 0, 1,
-0.4183066, 0.2429853, -1.455669, 0.01960784, 1, 0, 1,
-0.4125294, 0.8499465, -1.230078, 0.01568628, 1, 0, 1,
-0.4098265, -0.499574, -3.643518, 0.007843138, 1, 0, 1,
-0.4087932, 0.2754253, -2.183155, 0.003921569, 1, 0, 1,
-0.4034441, 0.3780524, -0.740003, 0, 1, 0.003921569, 1,
-0.4009137, -0.8129221, -2.918577, 0, 1, 0.01176471, 1,
-0.3992876, 0.3361615, -2.619542, 0, 1, 0.01568628, 1,
-0.3984572, 1.916007, -0.6578072, 0, 1, 0.02352941, 1,
-0.3976036, -1.112056, -1.363126, 0, 1, 0.02745098, 1,
-0.3955046, -1.104783, -2.200617, 0, 1, 0.03529412, 1,
-0.3949968, -0.2108652, -3.537131, 0, 1, 0.03921569, 1,
-0.3915276, -1.305162, -1.843772, 0, 1, 0.04705882, 1,
-0.3880722, -0.659182, -1.990681, 0, 1, 0.05098039, 1,
-0.3799889, 0.7598363, -1.761151, 0, 1, 0.05882353, 1,
-0.3776904, 1.127181, -1.789868, 0, 1, 0.0627451, 1,
-0.3773549, 0.4454502, -0.2933703, 0, 1, 0.07058824, 1,
-0.374478, -1.221042, -2.823583, 0, 1, 0.07450981, 1,
-0.3706191, -0.8685127, -3.731545, 0, 1, 0.08235294, 1,
-0.3685463, -1.121594, -1.696146, 0, 1, 0.08627451, 1,
-0.3684659, 1.086016, -0.581989, 0, 1, 0.09411765, 1,
-0.3681304, 2.815826, 0.1325794, 0, 1, 0.1019608, 1,
-0.3659664, -0.06461252, -2.066971, 0, 1, 0.1058824, 1,
-0.3613132, 1.70287, 0.2707192, 0, 1, 0.1137255, 1,
-0.3503311, 1.375822, 0.4971125, 0, 1, 0.1176471, 1,
-0.3497747, -0.02526781, -3.436773, 0, 1, 0.1254902, 1,
-0.3481011, 1.651097, 0.001387512, 0, 1, 0.1294118, 1,
-0.3417931, 0.4981038, -2.310949, 0, 1, 0.1372549, 1,
-0.3400011, 0.3086125, -2.654607, 0, 1, 0.1411765, 1,
-0.3384872, 0.6627437, -1.488489, 0, 1, 0.1490196, 1,
-0.3375186, -0.7278013, -2.942742, 0, 1, 0.1529412, 1,
-0.3369476, 1.224419, 0.1614143, 0, 1, 0.1607843, 1,
-0.3308037, -0.3962922, -3.35567, 0, 1, 0.1647059, 1,
-0.330645, 1.396031, -1.069449, 0, 1, 0.172549, 1,
-0.3283858, -0.8741295, -4.700828, 0, 1, 0.1764706, 1,
-0.3277412, 2.326377, -2.211245, 0, 1, 0.1843137, 1,
-0.3252867, 0.244164, -0.0635334, 0, 1, 0.1882353, 1,
-0.3239591, 0.2960992, -1.465013, 0, 1, 0.1960784, 1,
-0.3196634, 1.14991, -0.08813626, 0, 1, 0.2039216, 1,
-0.319014, -0.676372, -2.014938, 0, 1, 0.2078431, 1,
-0.3179135, 1.310731, -1.736112, 0, 1, 0.2156863, 1,
-0.3171444, 2.622455, -0.1431736, 0, 1, 0.2196078, 1,
-0.3168512, 0.5313514, -0.6430065, 0, 1, 0.227451, 1,
-0.3137703, -0.2490539, -3.374621, 0, 1, 0.2313726, 1,
-0.3122326, -0.2537103, -3.2702, 0, 1, 0.2392157, 1,
-0.3068796, -0.01593732, -0.7641076, 0, 1, 0.2431373, 1,
-0.3046019, -0.3076475, -1.66257, 0, 1, 0.2509804, 1,
-0.295663, -0.6917076, -2.961164, 0, 1, 0.254902, 1,
-0.2952584, 0.2166577, -0.1892275, 0, 1, 0.2627451, 1,
-0.2902523, -0.2242702, -3.083245, 0, 1, 0.2666667, 1,
-0.288973, -1.992379, -2.573012, 0, 1, 0.2745098, 1,
-0.2830294, 0.7087294, -0.9983259, 0, 1, 0.2784314, 1,
-0.281467, 2.443905, -0.9771183, 0, 1, 0.2862745, 1,
-0.2800021, -0.5212983, -3.006408, 0, 1, 0.2901961, 1,
-0.279621, 1.427407, -0.1265766, 0, 1, 0.2980392, 1,
-0.2704861, 0.2849881, -0.5047953, 0, 1, 0.3058824, 1,
-0.2693772, -1.900325, -4.629721, 0, 1, 0.3098039, 1,
-0.2687424, 0.007943536, -1.677426, 0, 1, 0.3176471, 1,
-0.2684835, -0.3788464, -2.671013, 0, 1, 0.3215686, 1,
-0.2626413, -0.3864157, -2.648885, 0, 1, 0.3294118, 1,
-0.262409, 0.5327283, -1.668432, 0, 1, 0.3333333, 1,
-0.2610982, 0.6657353, 0.288608, 0, 1, 0.3411765, 1,
-0.2588736, -0.7071321, -2.330819, 0, 1, 0.345098, 1,
-0.2561571, -1.593631, -2.222143, 0, 1, 0.3529412, 1,
-0.2544957, -1.085945, -2.370359, 0, 1, 0.3568628, 1,
-0.2541084, 1.82375, -3.030912, 0, 1, 0.3647059, 1,
-0.2536599, 0.7467725, -0.3347314, 0, 1, 0.3686275, 1,
-0.2524292, -0.9475362, -3.309349, 0, 1, 0.3764706, 1,
-0.248959, 0.5982494, 1.036917, 0, 1, 0.3803922, 1,
-0.2479731, 0.2689914, 0.3072876, 0, 1, 0.3882353, 1,
-0.2448687, -0.1664965, -3.566939, 0, 1, 0.3921569, 1,
-0.2419499, -0.4235413, -2.426309, 0, 1, 0.4, 1,
-0.2413625, -1.19765, -2.768494, 0, 1, 0.4078431, 1,
-0.2379554, 0.5425895, -2.132849, 0, 1, 0.4117647, 1,
-0.2352635, 1.113827, -1.739933, 0, 1, 0.4196078, 1,
-0.2296648, -1.818222, -2.041231, 0, 1, 0.4235294, 1,
-0.2282979, 1.405188, 1.229611, 0, 1, 0.4313726, 1,
-0.2251617, -1.884112, -3.005391, 0, 1, 0.4352941, 1,
-0.2213526, 0.2074193, 0.4742376, 0, 1, 0.4431373, 1,
-0.2185392, -0.1852913, -2.242579, 0, 1, 0.4470588, 1,
-0.2147227, 0.1782358, -0.595872, 0, 1, 0.454902, 1,
-0.2103916, 0.6330428, -1.04058, 0, 1, 0.4588235, 1,
-0.2095913, 0.1936335, -0.3830127, 0, 1, 0.4666667, 1,
-0.2082846, 0.02598113, -2.627946, 0, 1, 0.4705882, 1,
-0.2075616, 1.270429, 0.5881209, 0, 1, 0.4784314, 1,
-0.2029329, -0.2930159, -3.365883, 0, 1, 0.4823529, 1,
-0.2007559, 0.3900139, -0.7501163, 0, 1, 0.4901961, 1,
-0.1992425, 0.8584618, -0.7645574, 0, 1, 0.4941176, 1,
-0.196695, 0.6769353, -0.2205456, 0, 1, 0.5019608, 1,
-0.1961545, 0.7253433, 1.277951, 0, 1, 0.509804, 1,
-0.1957568, 0.9090527, -2.088648, 0, 1, 0.5137255, 1,
-0.1924558, -0.3399331, -1.620656, 0, 1, 0.5215687, 1,
-0.1878764, 0.4824793, -1.734876, 0, 1, 0.5254902, 1,
-0.1866105, 0.4234477, -1.389845, 0, 1, 0.5333334, 1,
-0.1819882, -1.489201, -3.098722, 0, 1, 0.5372549, 1,
-0.1757825, 1.124895, 0.3213653, 0, 1, 0.5450981, 1,
-0.1751116, 0.6810518, 0.1055975, 0, 1, 0.5490196, 1,
-0.1748074, 0.08220199, -1.466671, 0, 1, 0.5568628, 1,
-0.1734115, -0.8512651, -3.522073, 0, 1, 0.5607843, 1,
-0.1732988, -1.011034, -2.440657, 0, 1, 0.5686275, 1,
-0.1724733, -0.1022275, -0.9410548, 0, 1, 0.572549, 1,
-0.1692767, 0.7511267, 0.8768442, 0, 1, 0.5803922, 1,
-0.1678077, -0.4236417, -2.575987, 0, 1, 0.5843138, 1,
-0.1663206, 0.9977297, -1.303604, 0, 1, 0.5921569, 1,
-0.1606749, -0.7586762, -2.414314, 0, 1, 0.5960785, 1,
-0.156857, -0.5646762, -2.6562, 0, 1, 0.6039216, 1,
-0.1555288, 0.9233081, 0.1753727, 0, 1, 0.6117647, 1,
-0.1533678, 0.6615588, 0.1555833, 0, 1, 0.6156863, 1,
-0.151061, -0.7374651, -2.452563, 0, 1, 0.6235294, 1,
-0.1484079, 0.4963372, -1.263893, 0, 1, 0.627451, 1,
-0.1480035, -0.5017086, -2.566638, 0, 1, 0.6352941, 1,
-0.1461805, -0.4858714, -3.054093, 0, 1, 0.6392157, 1,
-0.145797, 0.2130656, 0.9429126, 0, 1, 0.6470588, 1,
-0.1446321, 0.7472638, -0.4682477, 0, 1, 0.6509804, 1,
-0.143176, -0.4489352, -3.128628, 0, 1, 0.6588235, 1,
-0.1427467, -0.9637868, -2.737683, 0, 1, 0.6627451, 1,
-0.1413937, 0.4867053, 0.20806, 0, 1, 0.6705883, 1,
-0.1387347, -0.39161, -3.725438, 0, 1, 0.6745098, 1,
-0.138633, 0.9108922, 0.08530586, 0, 1, 0.682353, 1,
-0.1378767, 0.5131427, -0.5519702, 0, 1, 0.6862745, 1,
-0.1374544, 1.247942, -1.014869, 0, 1, 0.6941177, 1,
-0.1367385, 0.5946915, 0.01397249, 0, 1, 0.7019608, 1,
-0.1354766, -1.115991, -2.776758, 0, 1, 0.7058824, 1,
-0.1313479, -0.48547, -2.188528, 0, 1, 0.7137255, 1,
-0.1299081, 0.4559476, 1.181091, 0, 1, 0.7176471, 1,
-0.1285235, -0.04818673, 0.1376903, 0, 1, 0.7254902, 1,
-0.1241138, 1.197355, 0.09306506, 0, 1, 0.7294118, 1,
-0.1218624, -0.3017297, -2.198975, 0, 1, 0.7372549, 1,
-0.121053, -0.08008435, -3.739844, 0, 1, 0.7411765, 1,
-0.1193269, 1.515953, 1.189637, 0, 1, 0.7490196, 1,
-0.1148086, 0.257964, -0.8776683, 0, 1, 0.7529412, 1,
-0.1145755, 1.365925, 0.8084124, 0, 1, 0.7607843, 1,
-0.1138354, -0.2859297, -2.892224, 0, 1, 0.7647059, 1,
-0.1038524, -1.683813, -3.271426, 0, 1, 0.772549, 1,
-0.1008635, 0.1269701, -1.058477, 0, 1, 0.7764706, 1,
-0.09984828, 0.363357, 0.6148615, 0, 1, 0.7843137, 1,
-0.09885691, 0.4232169, -2.168674, 0, 1, 0.7882353, 1,
-0.09779366, -1.492635, -3.501564, 0, 1, 0.7960784, 1,
-0.09524105, 0.6256822, -1.121279, 0, 1, 0.8039216, 1,
-0.09423795, 0.7183262, 0.6792204, 0, 1, 0.8078431, 1,
-0.09395804, 0.6342167, 0.0986212, 0, 1, 0.8156863, 1,
-0.09238791, 0.8253017, -0.3022633, 0, 1, 0.8196079, 1,
-0.09213707, -0.5151311, -2.882094, 0, 1, 0.827451, 1,
-0.09084502, -1.327772, -3.520838, 0, 1, 0.8313726, 1,
-0.08688473, -1.178225, -2.377823, 0, 1, 0.8392157, 1,
-0.08556197, -0.404994, -3.766804, 0, 1, 0.8431373, 1,
-0.08151366, 0.7155268, 0.6208964, 0, 1, 0.8509804, 1,
-0.08105665, 0.5800145, -0.5214957, 0, 1, 0.854902, 1,
-0.08102036, -0.2521906, -3.496814, 0, 1, 0.8627451, 1,
-0.08056193, -0.5291455, -3.190684, 0, 1, 0.8666667, 1,
-0.07854699, 0.8640558, -0.8598055, 0, 1, 0.8745098, 1,
-0.07854652, 1.064842, -0.2097614, 0, 1, 0.8784314, 1,
-0.07703426, 1.595721, -0.1449011, 0, 1, 0.8862745, 1,
-0.07686695, -0.7022164, -1.176206, 0, 1, 0.8901961, 1,
-0.07514845, 0.9624342, 0.8456933, 0, 1, 0.8980392, 1,
-0.07463495, -0.122689, -0.9210034, 0, 1, 0.9058824, 1,
-0.07389122, -0.632229, -2.746638, 0, 1, 0.9098039, 1,
-0.06236865, -0.3313892, -2.224715, 0, 1, 0.9176471, 1,
-0.06075832, 0.3356354, 0.6334114, 0, 1, 0.9215686, 1,
-0.06010887, -0.5570272, -3.552467, 0, 1, 0.9294118, 1,
-0.05701752, 0.542645, 1.000309, 0, 1, 0.9333333, 1,
-0.0553962, 0.7247277, -0.7300873, 0, 1, 0.9411765, 1,
-0.05453856, 1.022768, -0.757898, 0, 1, 0.945098, 1,
-0.05399301, 1.942592, -0.7358957, 0, 1, 0.9529412, 1,
-0.04245698, -0.1141547, -2.258975, 0, 1, 0.9568627, 1,
-0.03890205, 1.655882, -0.324498, 0, 1, 0.9647059, 1,
-0.03794305, 0.6629031, 0.531273, 0, 1, 0.9686275, 1,
-0.03713142, 0.6678998, 0.8537331, 0, 1, 0.9764706, 1,
-0.03674946, 0.5066428, 0.08354764, 0, 1, 0.9803922, 1,
-0.02838613, 1.111163, 0.2872993, 0, 1, 0.9882353, 1,
-0.01779997, -0.4375011, -3.013143, 0, 1, 0.9921569, 1,
-0.01522877, 0.2812074, 0.6821487, 0, 1, 1, 1,
-0.01444456, -0.3578905, -3.430143, 0, 0.9921569, 1, 1,
-0.01084279, -0.1600639, -3.545915, 0, 0.9882353, 1, 1,
-0.009625996, -0.4726638, -3.224334, 0, 0.9803922, 1, 1,
-0.009232723, -0.5441306, -1.954209, 0, 0.9764706, 1, 1,
-0.003812689, 0.3163921, 0.1544146, 0, 0.9686275, 1, 1,
0.003217848, 0.2585005, 0.6665137, 0, 0.9647059, 1, 1,
0.004523884, -1.834012, 3.240027, 0, 0.9568627, 1, 1,
0.008019223, 0.8385119, -0.1476274, 0, 0.9529412, 1, 1,
0.009231455, 1.569559, -1.209995, 0, 0.945098, 1, 1,
0.03309, 1.270358, -0.1780358, 0, 0.9411765, 1, 1,
0.03315336, 0.7769169, 0.2550429, 0, 0.9333333, 1, 1,
0.03360899, 0.6792114, 0.05952059, 0, 0.9294118, 1, 1,
0.03480223, -0.2558536, 3.791301, 0, 0.9215686, 1, 1,
0.03670376, 2.301077, -0.07332619, 0, 0.9176471, 1, 1,
0.03936839, -1.215698, 2.108109, 0, 0.9098039, 1, 1,
0.03983818, 0.5974162, 0.6759165, 0, 0.9058824, 1, 1,
0.04458741, 0.3917971, 0.4719746, 0, 0.8980392, 1, 1,
0.05247675, 0.120825, -0.2255872, 0, 0.8901961, 1, 1,
0.05327689, 0.3498844, 1.439078, 0, 0.8862745, 1, 1,
0.056414, 0.350835, -0.3563654, 0, 0.8784314, 1, 1,
0.05811907, 0.1848938, -0.2942556, 0, 0.8745098, 1, 1,
0.06247675, 0.5609737, -0.5157129, 0, 0.8666667, 1, 1,
0.06354892, 1.542423, 0.8306218, 0, 0.8627451, 1, 1,
0.06401939, 0.373148, 0.7784904, 0, 0.854902, 1, 1,
0.06539323, 2.139965, -0.2547257, 0, 0.8509804, 1, 1,
0.06965245, -0.02728017, 1.203033, 0, 0.8431373, 1, 1,
0.07022841, -0.8090845, 2.288608, 0, 0.8392157, 1, 1,
0.07722577, 0.1693134, 0.5072325, 0, 0.8313726, 1, 1,
0.07813179, -0.2260107, 4.178593, 0, 0.827451, 1, 1,
0.08182931, -0.5897806, 1.294909, 0, 0.8196079, 1, 1,
0.08389714, -0.1700391, 1.156643, 0, 0.8156863, 1, 1,
0.08593057, 1.378959, -0.2097801, 0, 0.8078431, 1, 1,
0.08617721, -0.5190697, 4.029651, 0, 0.8039216, 1, 1,
0.08627561, 0.6246216, 0.02420958, 0, 0.7960784, 1, 1,
0.08924458, 0.7458674, 0.02174657, 0, 0.7882353, 1, 1,
0.0938889, 1.28745, -0.09664293, 0, 0.7843137, 1, 1,
0.09725624, -0.7667851, 4.233125, 0, 0.7764706, 1, 1,
0.1029677, 0.1598499, 2.400098, 0, 0.772549, 1, 1,
0.1039559, -0.8886481, 4.737628, 0, 0.7647059, 1, 1,
0.1048338, -0.3561153, 2.730205, 0, 0.7607843, 1, 1,
0.1054669, -0.3312262, 3.432791, 0, 0.7529412, 1, 1,
0.1064096, -0.3564829, 3.641681, 0, 0.7490196, 1, 1,
0.1097977, -1.949059, 2.860309, 0, 0.7411765, 1, 1,
0.11713, -0.8835835, 3.447214, 0, 0.7372549, 1, 1,
0.1189721, -0.7706997, 3.245658, 0, 0.7294118, 1, 1,
0.1219904, -0.1030154, 0.6742557, 0, 0.7254902, 1, 1,
0.122663, -0.9828848, 2.713056, 0, 0.7176471, 1, 1,
0.123205, 1.31941, 1.316425, 0, 0.7137255, 1, 1,
0.1242238, 0.01450459, 2.319209, 0, 0.7058824, 1, 1,
0.1265174, 1.471465, 0.7689863, 0, 0.6980392, 1, 1,
0.1323528, 0.03268208, 1.584829, 0, 0.6941177, 1, 1,
0.1387067, 1.003524, -0.8564153, 0, 0.6862745, 1, 1,
0.1421656, -0.1416304, 3.515272, 0, 0.682353, 1, 1,
0.1502159, -0.618811, 2.465609, 0, 0.6745098, 1, 1,
0.1535694, 2.053331, 0.6055498, 0, 0.6705883, 1, 1,
0.1552498, -0.9836742, 4.548093, 0, 0.6627451, 1, 1,
0.1552805, -1.180801, 2.214957, 0, 0.6588235, 1, 1,
0.1584481, -0.5142384, 1.726755, 0, 0.6509804, 1, 1,
0.1608879, -1.377979, 2.503305, 0, 0.6470588, 1, 1,
0.1694651, 0.8438765, 1.012048, 0, 0.6392157, 1, 1,
0.1715906, 0.3072023, 0.7954478, 0, 0.6352941, 1, 1,
0.1733932, 0.9245801, -2.16728, 0, 0.627451, 1, 1,
0.1736051, -1.416384, 4.493708, 0, 0.6235294, 1, 1,
0.1836872, -2.450784, 4.556579, 0, 0.6156863, 1, 1,
0.1875069, -0.4969521, 3.264745, 0, 0.6117647, 1, 1,
0.1898802, 1.108768, 0.6415339, 0, 0.6039216, 1, 1,
0.1911893, -0.9163553, 2.418423, 0, 0.5960785, 1, 1,
0.1939206, -0.8211986, 2.670027, 0, 0.5921569, 1, 1,
0.1987814, 0.06392793, 0.8933291, 0, 0.5843138, 1, 1,
0.1991151, 0.3602147, 1.491892, 0, 0.5803922, 1, 1,
0.1994372, 1.066006, 0.5583286, 0, 0.572549, 1, 1,
0.1997585, -0.7175674, 3.186477, 0, 0.5686275, 1, 1,
0.2048806, 1.153431, 1.874011, 0, 0.5607843, 1, 1,
0.2093025, -0.3957807, 3.284631, 0, 0.5568628, 1, 1,
0.2183831, 0.4066598, -1.462317, 0, 0.5490196, 1, 1,
0.2222802, -1.693726, 1.149516, 0, 0.5450981, 1, 1,
0.2237363, -0.4593844, 2.117817, 0, 0.5372549, 1, 1,
0.2263146, -1.176387, 3.228792, 0, 0.5333334, 1, 1,
0.2270037, 0.5335143, 0.9589639, 0, 0.5254902, 1, 1,
0.2279059, -1.952701, 1.761894, 0, 0.5215687, 1, 1,
0.2288887, 0.1619434, 0.5262209, 0, 0.5137255, 1, 1,
0.2313997, -0.2618891, 3.624848, 0, 0.509804, 1, 1,
0.2411087, 0.5077913, 0.1581774, 0, 0.5019608, 1, 1,
0.2411979, -0.08048411, 0.4066363, 0, 0.4941176, 1, 1,
0.242965, 0.3256449, -0.3609289, 0, 0.4901961, 1, 1,
0.2430354, -1.570833, 3.461092, 0, 0.4823529, 1, 1,
0.2493136, 0.4134022, -0.2001008, 0, 0.4784314, 1, 1,
0.2496408, 1.147308, 1.451933, 0, 0.4705882, 1, 1,
0.2505663, 0.7721903, 0.5734539, 0, 0.4666667, 1, 1,
0.2513776, -0.6613594, 3.747843, 0, 0.4588235, 1, 1,
0.2514381, 1.219751, 0.6482862, 0, 0.454902, 1, 1,
0.2516413, -1.534053, 3.664691, 0, 0.4470588, 1, 1,
0.2537645, 0.7631237, -0.3262632, 0, 0.4431373, 1, 1,
0.2547789, -0.4508428, -0.2406562, 0, 0.4352941, 1, 1,
0.2595503, -0.382586, 3.222402, 0, 0.4313726, 1, 1,
0.2617563, 0.3450867, -0.7746497, 0, 0.4235294, 1, 1,
0.2646362, -1.588769, 1.765278, 0, 0.4196078, 1, 1,
0.2659017, 0.6712811, 1.319231, 0, 0.4117647, 1, 1,
0.2659165, -1.96182, 3.424973, 0, 0.4078431, 1, 1,
0.266203, 0.2321988, 1.616483, 0, 0.4, 1, 1,
0.271067, -0.6037271, 2.779927, 0, 0.3921569, 1, 1,
0.2723241, -1.080733, 2.958311, 0, 0.3882353, 1, 1,
0.2766915, 0.3934571, 0.8026897, 0, 0.3803922, 1, 1,
0.2798161, -1.689085, 3.507895, 0, 0.3764706, 1, 1,
0.2804911, -0.03006698, 1.293358, 0, 0.3686275, 1, 1,
0.2811958, -0.4175814, 0.9091042, 0, 0.3647059, 1, 1,
0.2832273, -0.8405402, 2.225098, 0, 0.3568628, 1, 1,
0.2834221, 1.865911, -0.9226504, 0, 0.3529412, 1, 1,
0.2840176, 0.7647064, 0.703289, 0, 0.345098, 1, 1,
0.2857737, 1.153632, 1.70561, 0, 0.3411765, 1, 1,
0.2893058, -0.5742499, 2.422354, 0, 0.3333333, 1, 1,
0.2900777, -0.3261273, 1.858574, 0, 0.3294118, 1, 1,
0.2944862, 0.04124698, 3.327789, 0, 0.3215686, 1, 1,
0.2966179, -0.1565845, 3.29425, 0, 0.3176471, 1, 1,
0.3009754, 0.8473607, 1.443464, 0, 0.3098039, 1, 1,
0.3015998, 0.3182066, 0.2466408, 0, 0.3058824, 1, 1,
0.3016057, -0.005700107, 2.42534, 0, 0.2980392, 1, 1,
0.3018248, -0.3044854, 0.9556868, 0, 0.2901961, 1, 1,
0.3056343, 0.1037374, 3.338568, 0, 0.2862745, 1, 1,
0.307278, 1.185539, -0.06409686, 0, 0.2784314, 1, 1,
0.3113396, 0.01597752, 0.3405119, 0, 0.2745098, 1, 1,
0.3141228, -0.2217684, 1.54521, 0, 0.2666667, 1, 1,
0.3155262, -0.543989, 2.100714, 0, 0.2627451, 1, 1,
0.3199694, -0.01018132, 2.547568, 0, 0.254902, 1, 1,
0.3213273, 0.5303309, 0.8540865, 0, 0.2509804, 1, 1,
0.3224742, -0.7884713, 2.935296, 0, 0.2431373, 1, 1,
0.3224752, -0.8802142, 1.676272, 0, 0.2392157, 1, 1,
0.3245507, 0.1097463, -0.7588869, 0, 0.2313726, 1, 1,
0.3248135, 0.2055006, 1.044719, 0, 0.227451, 1, 1,
0.324947, -1.707247, 1.583635, 0, 0.2196078, 1, 1,
0.3273182, 0.2066006, 0.2593171, 0, 0.2156863, 1, 1,
0.3297394, -0.2704869, 0.8117756, 0, 0.2078431, 1, 1,
0.3313437, -0.3992273, 1.838396, 0, 0.2039216, 1, 1,
0.3321336, -1.7129, 2.212169, 0, 0.1960784, 1, 1,
0.3423091, 0.9939381, 0.8120968, 0, 0.1882353, 1, 1,
0.3426494, 0.5099863, 0.2348827, 0, 0.1843137, 1, 1,
0.3516515, 1.333965, 1.024298, 0, 0.1764706, 1, 1,
0.3686711, -0.5371826, 1.438805, 0, 0.172549, 1, 1,
0.3692157, -1.177882, 2.953844, 0, 0.1647059, 1, 1,
0.3694631, -1.059663, 2.574343, 0, 0.1607843, 1, 1,
0.3716452, -0.229385, 3.791022, 0, 0.1529412, 1, 1,
0.3730194, -0.5845049, 3.309024, 0, 0.1490196, 1, 1,
0.3779259, 0.3689352, 0.8579125, 0, 0.1411765, 1, 1,
0.3826978, -0.7192128, 1.907561, 0, 0.1372549, 1, 1,
0.3832888, -0.2324654, 0.7084716, 0, 0.1294118, 1, 1,
0.3888405, -0.08089629, 3.494337, 0, 0.1254902, 1, 1,
0.3908311, 0.3957081, 0.1163274, 0, 0.1176471, 1, 1,
0.3976333, -0.04267697, 1.483803, 0, 0.1137255, 1, 1,
0.3983293, -0.6147946, 1.58189, 0, 0.1058824, 1, 1,
0.4026217, -0.6949719, 3.545929, 0, 0.09803922, 1, 1,
0.4026904, 1.028765, 1.722633, 0, 0.09411765, 1, 1,
0.4066518, 1.044865, -0.2165845, 0, 0.08627451, 1, 1,
0.410835, -0.7179498, 3.072883, 0, 0.08235294, 1, 1,
0.4117583, -0.295387, 1.58422, 0, 0.07450981, 1, 1,
0.4172851, -1.13397, 2.687388, 0, 0.07058824, 1, 1,
0.4194528, -0.2401452, 3.153257, 0, 0.0627451, 1, 1,
0.4196575, -0.9259439, 1.897463, 0, 0.05882353, 1, 1,
0.4230174, 1.643702, 1.706808, 0, 0.05098039, 1, 1,
0.42454, -1.670215, 2.92008, 0, 0.04705882, 1, 1,
0.4256966, 1.651825, 2.204646, 0, 0.03921569, 1, 1,
0.4361315, 1.074128, -0.1330345, 0, 0.03529412, 1, 1,
0.4382718, 0.5135115, 2.064831, 0, 0.02745098, 1, 1,
0.4436928, 0.5691085, -0.2753376, 0, 0.02352941, 1, 1,
0.4531629, 1.562389, 0.3477825, 0, 0.01568628, 1, 1,
0.4533986, 1.716357, -0.981142, 0, 0.01176471, 1, 1,
0.4545927, 0.4731528, 0.119238, 0, 0.003921569, 1, 1,
0.4546837, -0.4387416, 0.376757, 0.003921569, 0, 1, 1,
0.4555029, -1.096785, 3.029779, 0.007843138, 0, 1, 1,
0.4571376, -0.1731757, 0.9250428, 0.01568628, 0, 1, 1,
0.4577233, -0.9208418, 3.827418, 0.01960784, 0, 1, 1,
0.4588885, -2.050604, 3.33487, 0.02745098, 0, 1, 1,
0.4690567, -0.09308551, 1.975152, 0.03137255, 0, 1, 1,
0.4693861, 1.193513, -0.7449511, 0.03921569, 0, 1, 1,
0.4753308, 1.807495, 1.65195, 0.04313726, 0, 1, 1,
0.4756845, -0.3913225, 2.007428, 0.05098039, 0, 1, 1,
0.4758171, -0.8911518, 3.678636, 0.05490196, 0, 1, 1,
0.4851604, 0.3835481, 1.837044, 0.0627451, 0, 1, 1,
0.4881435, 0.2235362, 2.901523, 0.06666667, 0, 1, 1,
0.4889615, -0.8965238, 1.972582, 0.07450981, 0, 1, 1,
0.4920975, -3.300689, 2.680853, 0.07843138, 0, 1, 1,
0.4935361, -0.4359282, 1.864237, 0.08627451, 0, 1, 1,
0.4978541, 0.4040728, 2.036443, 0.09019608, 0, 1, 1,
0.4982794, -1.688314, 2.341343, 0.09803922, 0, 1, 1,
0.4983836, -0.08406752, 2.193984, 0.1058824, 0, 1, 1,
0.5002151, 2.384589, -0.2852503, 0.1098039, 0, 1, 1,
0.504845, 0.0774988, 2.64419, 0.1176471, 0, 1, 1,
0.5059564, -0.4248915, 3.266838, 0.1215686, 0, 1, 1,
0.5136717, -1.452704, 2.937954, 0.1294118, 0, 1, 1,
0.5148745, -0.5026701, 0.8114716, 0.1333333, 0, 1, 1,
0.518347, 0.3619306, 1.057761, 0.1411765, 0, 1, 1,
0.520617, -0.6964587, 3.163945, 0.145098, 0, 1, 1,
0.5222623, -0.04125885, 1.551778, 0.1529412, 0, 1, 1,
0.5237387, -1.08411, 4.433285, 0.1568628, 0, 1, 1,
0.5245194, 0.7035697, 0.8855942, 0.1647059, 0, 1, 1,
0.5271595, -0.7809716, 3.534933, 0.1686275, 0, 1, 1,
0.5288274, 3.142977, -1.26129, 0.1764706, 0, 1, 1,
0.5326448, -0.05415374, 1.091547, 0.1803922, 0, 1, 1,
0.5326948, -2.001802, 3.124703, 0.1882353, 0, 1, 1,
0.5350379, 1.021274, 0.3512477, 0.1921569, 0, 1, 1,
0.5361779, -1.005791, 3.860514, 0.2, 0, 1, 1,
0.5391951, -1.145042, 0.464836, 0.2078431, 0, 1, 1,
0.5398253, -0.4265267, 2.993492, 0.2117647, 0, 1, 1,
0.5437519, -0.3761585, 2.824419, 0.2196078, 0, 1, 1,
0.5441127, 0.6027232, 1.587976, 0.2235294, 0, 1, 1,
0.5462844, -1.112192, 1.548902, 0.2313726, 0, 1, 1,
0.5474604, 0.5078465, -1.45029, 0.2352941, 0, 1, 1,
0.5623285, -0.1139527, -0.2224905, 0.2431373, 0, 1, 1,
0.569317, 0.368722, 0.623422, 0.2470588, 0, 1, 1,
0.570855, 0.5080814, 1.092009, 0.254902, 0, 1, 1,
0.5708618, 1.033186, 1.396447, 0.2588235, 0, 1, 1,
0.5729261, 0.6871176, 1.088599, 0.2666667, 0, 1, 1,
0.5828496, -0.7215777, 1.642761, 0.2705882, 0, 1, 1,
0.5853971, -0.00139682, 1.484683, 0.2784314, 0, 1, 1,
0.5882692, -0.07897215, 2.974034, 0.282353, 0, 1, 1,
0.5900481, -0.7255453, 2.47426, 0.2901961, 0, 1, 1,
0.5908622, -1.015699, 0.9004336, 0.2941177, 0, 1, 1,
0.5927955, 0.5633224, 0.1487121, 0.3019608, 0, 1, 1,
0.5933623, -0.4583863, 2.272977, 0.3098039, 0, 1, 1,
0.5938438, 1.594406, 1.887619, 0.3137255, 0, 1, 1,
0.5980423, -1.002113, 2.55393, 0.3215686, 0, 1, 1,
0.6003812, -0.9073494, 3.459625, 0.3254902, 0, 1, 1,
0.6010133, -0.8556072, 1.717443, 0.3333333, 0, 1, 1,
0.6031762, -0.2366133, 3.610977, 0.3372549, 0, 1, 1,
0.605592, 0.1120783, 0.6188995, 0.345098, 0, 1, 1,
0.6057041, -1.25788, 3.303174, 0.3490196, 0, 1, 1,
0.6138875, 0.02496533, 1.828505, 0.3568628, 0, 1, 1,
0.6219029, 0.8246996, 1.095299, 0.3607843, 0, 1, 1,
0.6247194, 1.576248, 0.7766375, 0.3686275, 0, 1, 1,
0.6247399, 1.237259, 1.230162, 0.372549, 0, 1, 1,
0.6256484, 1.014918, 0.5015288, 0.3803922, 0, 1, 1,
0.6293802, -0.1837955, 2.937196, 0.3843137, 0, 1, 1,
0.6357089, 0.847656, 1.716237, 0.3921569, 0, 1, 1,
0.639993, 0.351224, 2.828518, 0.3960784, 0, 1, 1,
0.64304, 0.198076, 1.799497, 0.4039216, 0, 1, 1,
0.6431795, -1.152136, 4.196038, 0.4117647, 0, 1, 1,
0.6557005, 1.881996, -0.1177247, 0.4156863, 0, 1, 1,
0.6565609, -0.1155883, 1.87402, 0.4235294, 0, 1, 1,
0.6583683, 1.638994, -0.5399821, 0.427451, 0, 1, 1,
0.6607241, -0.7075302, 2.567924, 0.4352941, 0, 1, 1,
0.6619773, -1.589881, 1.656698, 0.4392157, 0, 1, 1,
0.6627918, 0.7642337, 2.406837, 0.4470588, 0, 1, 1,
0.6629522, 0.04035458, -0.04967027, 0.4509804, 0, 1, 1,
0.6629895, -0.8844718, 3.512166, 0.4588235, 0, 1, 1,
0.6664373, 0.2510943, 1.366268, 0.4627451, 0, 1, 1,
0.6691728, 0.6485165, 1.146076, 0.4705882, 0, 1, 1,
0.6694666, -0.7072182, 1.735344, 0.4745098, 0, 1, 1,
0.6708043, 0.05469459, 1.480106, 0.4823529, 0, 1, 1,
0.6711282, 0.3571853, -0.1581748, 0.4862745, 0, 1, 1,
0.6720845, 0.2794843, -0.1246063, 0.4941176, 0, 1, 1,
0.6736335, -1.053517, 3.95014, 0.5019608, 0, 1, 1,
0.6826187, 0.3710661, -0.4326542, 0.5058824, 0, 1, 1,
0.6832342, -0.8656554, 1.474782, 0.5137255, 0, 1, 1,
0.6846639, 1.167262, 0.529615, 0.5176471, 0, 1, 1,
0.6862835, -1.221827, 4.034604, 0.5254902, 0, 1, 1,
0.6971807, 1.590438, 1.301663, 0.5294118, 0, 1, 1,
0.6987582, 0.6140821, 1.53584, 0.5372549, 0, 1, 1,
0.7016157, 0.07014302, 1.674262, 0.5411765, 0, 1, 1,
0.7035111, 0.06874225, 3.407573, 0.5490196, 0, 1, 1,
0.7050377, -0.3483789, -0.3109576, 0.5529412, 0, 1, 1,
0.7064955, -2.6865, 4.489649, 0.5607843, 0, 1, 1,
0.707271, -0.02354943, 1.967395, 0.5647059, 0, 1, 1,
0.7077388, 0.5891671, 2.157576, 0.572549, 0, 1, 1,
0.7101594, 0.3961762, 0.8769416, 0.5764706, 0, 1, 1,
0.7117352, 0.9992893, 0.7805404, 0.5843138, 0, 1, 1,
0.712472, 1.115909, 0.9657479, 0.5882353, 0, 1, 1,
0.7142848, 2.073764, 0.1729206, 0.5960785, 0, 1, 1,
0.7168233, 0.2688661, 1.418752, 0.6039216, 0, 1, 1,
0.7191725, 0.5441778, 1.10198, 0.6078432, 0, 1, 1,
0.721118, -0.797616, 1.175301, 0.6156863, 0, 1, 1,
0.7215548, -1.896709, 2.426877, 0.6196079, 0, 1, 1,
0.7223654, -1.351294, 2.821607, 0.627451, 0, 1, 1,
0.7225075, -1.729107, 4.344878, 0.6313726, 0, 1, 1,
0.7296795, -0.07624394, 3.124694, 0.6392157, 0, 1, 1,
0.7306172, 0.07138298, 1.887342, 0.6431373, 0, 1, 1,
0.7357852, 2.859879, 0.6026205, 0.6509804, 0, 1, 1,
0.7362492, -0.1165587, 1.098331, 0.654902, 0, 1, 1,
0.7368799, -0.3392963, 4.147894, 0.6627451, 0, 1, 1,
0.7472764, 0.560555, 0.5639272, 0.6666667, 0, 1, 1,
0.7485044, 0.2665495, 1.636044, 0.6745098, 0, 1, 1,
0.7548382, -0.4365624, 2.722672, 0.6784314, 0, 1, 1,
0.755055, 2.638091, 1.204056, 0.6862745, 0, 1, 1,
0.7582112, -0.1159831, 2.045993, 0.6901961, 0, 1, 1,
0.759535, 0.1714059, 4.33743, 0.6980392, 0, 1, 1,
0.7602872, -0.263654, 3.400516, 0.7058824, 0, 1, 1,
0.7706633, 0.4834487, 1.041218, 0.7098039, 0, 1, 1,
0.7710907, -0.1066987, 0.4470578, 0.7176471, 0, 1, 1,
0.7722538, 0.8851529, 1.910619, 0.7215686, 0, 1, 1,
0.7728266, 0.02941337, 3.392823, 0.7294118, 0, 1, 1,
0.7754514, -0.611734, 0.4603181, 0.7333333, 0, 1, 1,
0.7780877, 1.008277, -0.4019039, 0.7411765, 0, 1, 1,
0.7948993, 0.6272089, -0.08414304, 0.7450981, 0, 1, 1,
0.7949918, -1.312887, 2.961323, 0.7529412, 0, 1, 1,
0.79544, 0.7045318, 0.5486515, 0.7568628, 0, 1, 1,
0.7961192, 0.478429, 1.386232, 0.7647059, 0, 1, 1,
0.8019232, 0.3677272, -0.3615233, 0.7686275, 0, 1, 1,
0.802151, 0.9283969, 1.049313, 0.7764706, 0, 1, 1,
0.8026928, -1.743743, 3.129627, 0.7803922, 0, 1, 1,
0.8058295, 0.5015705, 1.427595, 0.7882353, 0, 1, 1,
0.8138481, -0.9264453, 2.929189, 0.7921569, 0, 1, 1,
0.8173378, 0.5977266, 0.1937909, 0.8, 0, 1, 1,
0.8263974, -0.08034187, 1.706552, 0.8078431, 0, 1, 1,
0.8329207, 0.005102804, 0.75238, 0.8117647, 0, 1, 1,
0.8394414, 0.9611198, 0.07718378, 0.8196079, 0, 1, 1,
0.8524342, 0.5586476, 0.6926969, 0.8235294, 0, 1, 1,
0.8536767, -0.5035977, 0.4174613, 0.8313726, 0, 1, 1,
0.8544164, 0.6742939, 2.939836, 0.8352941, 0, 1, 1,
0.8567893, -0.06231672, 0.4800902, 0.8431373, 0, 1, 1,
0.8585267, -0.2422478, -0.05396193, 0.8470588, 0, 1, 1,
0.8610318, 0.1931496, 2.389983, 0.854902, 0, 1, 1,
0.8636271, 1.171812, -0.6939185, 0.8588235, 0, 1, 1,
0.8672819, -1.181819, 2.118995, 0.8666667, 0, 1, 1,
0.8708889, 1.167951, 1.229387, 0.8705882, 0, 1, 1,
0.8741723, -0.004629488, 1.55149, 0.8784314, 0, 1, 1,
0.8792396, 0.02683784, 0.5237443, 0.8823529, 0, 1, 1,
0.883254, 0.4902284, 0.4219316, 0.8901961, 0, 1, 1,
0.8870641, 0.6918511, 1.148613, 0.8941177, 0, 1, 1,
0.888221, 0.9386293, 2.597435, 0.9019608, 0, 1, 1,
0.8908787, 0.9437848, 2.041757, 0.9098039, 0, 1, 1,
0.8939017, 0.8881773, 0.2629241, 0.9137255, 0, 1, 1,
0.8978767, -0.7836364, 3.597847, 0.9215686, 0, 1, 1,
0.9120086, 0.2885981, -0.3014279, 0.9254902, 0, 1, 1,
0.9120107, -0.3680913, 3.832948, 0.9333333, 0, 1, 1,
0.9140308, -1.003193, 3.071684, 0.9372549, 0, 1, 1,
0.9215805, 2.110015, 1.522751, 0.945098, 0, 1, 1,
0.92173, 0.727845, 0.8641188, 0.9490196, 0, 1, 1,
0.9258561, -0.8848493, 0.2060766, 0.9568627, 0, 1, 1,
0.9327803, 1.145207, 0.9662817, 0.9607843, 0, 1, 1,
0.9388832, 0.7423826, 1.011608, 0.9686275, 0, 1, 1,
0.9402891, -0.9686751, 3.195943, 0.972549, 0, 1, 1,
0.9410022, 0.6965158, 0.7204782, 0.9803922, 0, 1, 1,
0.9450848, 0.5156254, 1.615622, 0.9843137, 0, 1, 1,
0.9453222, -0.6514435, 4.010881, 0.9921569, 0, 1, 1,
0.9554074, 1.692271, 0.5145931, 0.9960784, 0, 1, 1,
0.9564842, 0.8317189, 0.6816769, 1, 0, 0.9960784, 1,
0.9586182, 0.4540986, 0.5745856, 1, 0, 0.9882353, 1,
0.9594809, 0.6571472, -0.07263556, 1, 0, 0.9843137, 1,
0.9598734, -0.5579719, 0.9490652, 1, 0, 0.9764706, 1,
0.9650413, -0.5293995, 1.133393, 1, 0, 0.972549, 1,
0.9674886, -0.7293135, 2.099331, 1, 0, 0.9647059, 1,
0.9768404, -0.8131325, 1.461717, 1, 0, 0.9607843, 1,
0.9781293, 1.460272, 2.43126, 1, 0, 0.9529412, 1,
0.9816886, 0.3341207, 1.13667, 1, 0, 0.9490196, 1,
0.9874946, 1.235216, -0.186174, 1, 0, 0.9411765, 1,
0.9897511, 0.6091818, 0.5841365, 1, 0, 0.9372549, 1,
0.9907804, 0.9048327, 1.570526, 1, 0, 0.9294118, 1,
0.9921116, 1.025721, 1.221447, 1, 0, 0.9254902, 1,
0.9952944, -1.42416, 3.575744, 1, 0, 0.9176471, 1,
0.9973397, 0.09123494, 2.342977, 1, 0, 0.9137255, 1,
0.999357, 1.827402, 0.7375344, 1, 0, 0.9058824, 1,
1.001463, -0.2978269, 3.235086, 1, 0, 0.9019608, 1,
1.01057, -0.3996164, 1.957977, 1, 0, 0.8941177, 1,
1.010774, 0.1570553, 0.7182232, 1, 0, 0.8862745, 1,
1.015291, 0.6457871, 2.071138, 1, 0, 0.8823529, 1,
1.016572, 0.6510877, 0.3254177, 1, 0, 0.8745098, 1,
1.016891, 0.3283667, 1.228416, 1, 0, 0.8705882, 1,
1.017415, 0.1236199, 2.847855, 1, 0, 0.8627451, 1,
1.020379, -1.208842, 1.129452, 1, 0, 0.8588235, 1,
1.034058, 0.816656, 1.532457, 1, 0, 0.8509804, 1,
1.045034, 0.08569905, 0.01510176, 1, 0, 0.8470588, 1,
1.045836, 1.261595, -0.2749892, 1, 0, 0.8392157, 1,
1.047913, -0.0109991, 1.019327, 1, 0, 0.8352941, 1,
1.054208, -0.5675306, 0.8129696, 1, 0, 0.827451, 1,
1.055598, 1.515634, 2.77405, 1, 0, 0.8235294, 1,
1.060738, 1.852825, 0.06135387, 1, 0, 0.8156863, 1,
1.069953, 2.742803, 0.551813, 1, 0, 0.8117647, 1,
1.071048, 0.7667109, 0.1938724, 1, 0, 0.8039216, 1,
1.077563, 0.730183, 1.74965, 1, 0, 0.7960784, 1,
1.090292, 0.4933391, 0.8291051, 1, 0, 0.7921569, 1,
1.092376, 0.09478026, 1.755141, 1, 0, 0.7843137, 1,
1.093048, -0.1305046, 1.570649, 1, 0, 0.7803922, 1,
1.096585, -0.9702904, 1.536061, 1, 0, 0.772549, 1,
1.0989, 0.4462137, 1.516954, 1, 0, 0.7686275, 1,
1.099994, 0.4538037, 1.066079, 1, 0, 0.7607843, 1,
1.102851, -0.2922496, 1.545343, 1, 0, 0.7568628, 1,
1.115769, -1.603206, 3.918635, 1, 0, 0.7490196, 1,
1.117306, 0.4630479, 0.5662684, 1, 0, 0.7450981, 1,
1.124848, -0.5109448, 2.021615, 1, 0, 0.7372549, 1,
1.126499, -1.24727, 0.821227, 1, 0, 0.7333333, 1,
1.138176, -0.4354894, 1.466699, 1, 0, 0.7254902, 1,
1.14064, -1.406971, 3.880697, 1, 0, 0.7215686, 1,
1.15097, -0.2268357, 2.157029, 1, 0, 0.7137255, 1,
1.151969, 0.393235, 1.993043, 1, 0, 0.7098039, 1,
1.169018, -0.5156585, 2.347593, 1, 0, 0.7019608, 1,
1.170358, 0.1015056, 2.413642, 1, 0, 0.6941177, 1,
1.170588, 0.3779142, -0.088041, 1, 0, 0.6901961, 1,
1.173847, 1.695983, 0.318372, 1, 0, 0.682353, 1,
1.17466, -0.1622747, 1.915993, 1, 0, 0.6784314, 1,
1.186331, -1.29446, 3.453836, 1, 0, 0.6705883, 1,
1.18667, -1.102933, 2.09741, 1, 0, 0.6666667, 1,
1.188101, -0.9016813, 2.224276, 1, 0, 0.6588235, 1,
1.193408, -0.6699896, 2.081926, 1, 0, 0.654902, 1,
1.201261, -0.1896069, 1.468494, 1, 0, 0.6470588, 1,
1.206378, -0.6918368, -0.0628309, 1, 0, 0.6431373, 1,
1.21471, 0.5987375, 1.228047, 1, 0, 0.6352941, 1,
1.217174, 0.9814613, 1.156134, 1, 0, 0.6313726, 1,
1.219508, 1.803502, 0.8467536, 1, 0, 0.6235294, 1,
1.234649, 0.6736724, 1.602881, 1, 0, 0.6196079, 1,
1.237602, -1.005592, 3.039956, 1, 0, 0.6117647, 1,
1.23849, 1.018392, -0.6680268, 1, 0, 0.6078432, 1,
1.241646, -0.5726328, 2.863442, 1, 0, 0.6, 1,
1.248695, 0.189433, -0.1898833, 1, 0, 0.5921569, 1,
1.257248, -1.092344, 2.227942, 1, 0, 0.5882353, 1,
1.262956, 0.3341185, 0.009267601, 1, 0, 0.5803922, 1,
1.265907, 0.567581, 0.6645504, 1, 0, 0.5764706, 1,
1.27039, 1.664464, -0.3178668, 1, 0, 0.5686275, 1,
1.278938, 0.4622456, 1.537499, 1, 0, 0.5647059, 1,
1.290227, -0.3639417, 1.580816, 1, 0, 0.5568628, 1,
1.292562, 0.2651959, 1.0304, 1, 0, 0.5529412, 1,
1.295853, -1.947917, 3.862989, 1, 0, 0.5450981, 1,
1.298694, -0.591033, 2.813874, 1, 0, 0.5411765, 1,
1.310001, 0.953437, 1.928517, 1, 0, 0.5333334, 1,
1.322452, 0.3723056, -1.52427, 1, 0, 0.5294118, 1,
1.32296, -2.20542, 2.497759, 1, 0, 0.5215687, 1,
1.32569, -0.9013547, 3.100685, 1, 0, 0.5176471, 1,
1.334476, -1.11049, 3.294027, 1, 0, 0.509804, 1,
1.338189, -0.3827928, 1.945472, 1, 0, 0.5058824, 1,
1.339175, -0.2292737, 1.973773, 1, 0, 0.4980392, 1,
1.362133, 1.789858, 2.435403, 1, 0, 0.4901961, 1,
1.378339, -0.5047369, 1.143226, 1, 0, 0.4862745, 1,
1.38826, 0.273089, 0.3550472, 1, 0, 0.4784314, 1,
1.411918, 0.3929133, 2.978133, 1, 0, 0.4745098, 1,
1.412206, 0.9962199, 0.5712671, 1, 0, 0.4666667, 1,
1.436963, -1.427649, 1.769683, 1, 0, 0.4627451, 1,
1.439967, -0.9483698, 2.539374, 1, 0, 0.454902, 1,
1.448411, -1.002768, 1.849608, 1, 0, 0.4509804, 1,
1.463154, 1.233093, 0.2767044, 1, 0, 0.4431373, 1,
1.484296, -0.7656459, 1.800643, 1, 0, 0.4392157, 1,
1.488931, -0.4952967, 0.6760015, 1, 0, 0.4313726, 1,
1.490312, -0.07068842, 1.086634, 1, 0, 0.427451, 1,
1.490703, -0.1174449, 2.414168, 1, 0, 0.4196078, 1,
1.497826, -0.3150278, 0.1030283, 1, 0, 0.4156863, 1,
1.506849, 0.2610137, 1.735572, 1, 0, 0.4078431, 1,
1.517827, -0.06335948, 2.304938, 1, 0, 0.4039216, 1,
1.518525, 1.077798, -0.1021491, 1, 0, 0.3960784, 1,
1.523484, -1.507434, 0.4483387, 1, 0, 0.3882353, 1,
1.535707, 0.01826338, 3.119609, 1, 0, 0.3843137, 1,
1.553264, 0.5064434, -0.1220136, 1, 0, 0.3764706, 1,
1.559575, 0.4172787, 1.119869, 1, 0, 0.372549, 1,
1.569281, -0.6721948, 3.566675, 1, 0, 0.3647059, 1,
1.58078, 0.09995957, 0.6313064, 1, 0, 0.3607843, 1,
1.583213, 0.3461663, 0.4857871, 1, 0, 0.3529412, 1,
1.584067, 0.2739969, 0.2142076, 1, 0, 0.3490196, 1,
1.588787, -0.2256918, 0.7089521, 1, 0, 0.3411765, 1,
1.59264, -0.9602572, 1.55297, 1, 0, 0.3372549, 1,
1.599048, -1.222446, 2.459491, 1, 0, 0.3294118, 1,
1.62594, -0.4643729, 1.74913, 1, 0, 0.3254902, 1,
1.626405, 0.0678772, 1.917093, 1, 0, 0.3176471, 1,
1.632935, -0.7890447, 1.56905, 1, 0, 0.3137255, 1,
1.635715, 0.03824021, 0.7713456, 1, 0, 0.3058824, 1,
1.656798, 0.6089743, 1.795172, 1, 0, 0.2980392, 1,
1.692262, 0.2470686, 1.693415, 1, 0, 0.2941177, 1,
1.704464, -0.4226637, 0.7213079, 1, 0, 0.2862745, 1,
1.718496, -2.573516, 2.754416, 1, 0, 0.282353, 1,
1.759015, -0.1050635, 2.016994, 1, 0, 0.2745098, 1,
1.77844, 0.8931141, 2.375203, 1, 0, 0.2705882, 1,
1.790689, -0.8365144, 0.7736404, 1, 0, 0.2627451, 1,
1.792012, -0.3685408, 2.379599, 1, 0, 0.2588235, 1,
1.799527, 0.8973244, 2.998782, 1, 0, 0.2509804, 1,
1.809726, 2.466146, -0.9526523, 1, 0, 0.2470588, 1,
1.810405, 2.045565, 0.532483, 1, 0, 0.2392157, 1,
1.813744, 0.6813508, 1.205991, 1, 0, 0.2352941, 1,
1.819166, -0.1938404, 2.115744, 1, 0, 0.227451, 1,
1.830168, 1.34602, 1.962638, 1, 0, 0.2235294, 1,
1.839267, -0.5625677, 1.001179, 1, 0, 0.2156863, 1,
1.861248, 1.606125, -0.6847227, 1, 0, 0.2117647, 1,
1.867771, 0.01146628, 1.266671, 1, 0, 0.2039216, 1,
1.879796, 0.3306878, 0.4587584, 1, 0, 0.1960784, 1,
1.887275, -1.185333, 0.8617032, 1, 0, 0.1921569, 1,
1.889155, -0.3990792, 1.238166, 1, 0, 0.1843137, 1,
1.908254, 1.659817, 2.221729, 1, 0, 0.1803922, 1,
1.919576, 1.262747, 0.4705056, 1, 0, 0.172549, 1,
1.950567, -0.9419742, 2.071545, 1, 0, 0.1686275, 1,
1.951302, -0.6099011, 3.697678, 1, 0, 0.1607843, 1,
1.965469, -0.6455739, 3.661032, 1, 0, 0.1568628, 1,
1.968035, 0.4828049, 1.065505, 1, 0, 0.1490196, 1,
1.968875, -0.609244, 2.732401, 1, 0, 0.145098, 1,
1.996939, 0.1491391, 2.34902, 1, 0, 0.1372549, 1,
1.998505, 0.415806, 2.695375, 1, 0, 0.1333333, 1,
2.009123, 0.2912908, 0.5172853, 1, 0, 0.1254902, 1,
2.011217, 0.03483683, 1.593804, 1, 0, 0.1215686, 1,
2.011533, -1.625704, 1.565091, 1, 0, 0.1137255, 1,
2.02123, -0.3710693, 2.608272, 1, 0, 0.1098039, 1,
2.029333, 0.5632432, 1.504375, 1, 0, 0.1019608, 1,
2.110507, -1.334681, 2.723636, 1, 0, 0.09411765, 1,
2.167903, 1.141119, 0.1590377, 1, 0, 0.09019608, 1,
2.195371, -0.6450693, 2.520572, 1, 0, 0.08235294, 1,
2.220561, 0.07090794, 1.711011, 1, 0, 0.07843138, 1,
2.237274, 2.291514, 0.6348501, 1, 0, 0.07058824, 1,
2.282426, 1.393861, 0.7183419, 1, 0, 0.06666667, 1,
2.309407, 1.085894, 2.140123, 1, 0, 0.05882353, 1,
2.322861, -2.941406, 3.811473, 1, 0, 0.05490196, 1,
2.331974, 0.05681366, 1.280653, 1, 0, 0.04705882, 1,
2.407196, 0.1404916, 1.10853, 1, 0, 0.04313726, 1,
2.478173, -0.2976003, 1.876738, 1, 0, 0.03529412, 1,
2.610749, -0.3130094, 1.377441, 1, 0, 0.03137255, 1,
2.681258, 1.029077, 0.2296315, 1, 0, 0.02352941, 1,
2.715844, -0.09349068, 2.161946, 1, 0, 0.01960784, 1,
3.084285, -0.6615622, 2.277507, 1, 0, 0.01176471, 1,
3.178829, 0.3339137, -0.6168835, 1, 0, 0.007843138, 1
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
0.1781147, -4.39289, -6.300646, 0, -0.5, 0.5, 0.5,
0.1781147, -4.39289, -6.300646, 1, -0.5, 0.5, 0.5,
0.1781147, -4.39289, -6.300646, 1, 1.5, 0.5, 0.5,
0.1781147, -4.39289, -6.300646, 0, 1.5, 0.5, 0.5
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
-3.839841, -0.07885599, -6.300646, 0, -0.5, 0.5, 0.5,
-3.839841, -0.07885599, -6.300646, 1, -0.5, 0.5, 0.5,
-3.839841, -0.07885599, -6.300646, 1, 1.5, 0.5, 0.5,
-3.839841, -0.07885599, -6.300646, 0, 1.5, 0.5, 0.5
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
-3.839841, -4.39289, 0.01840019, 0, -0.5, 0.5, 0.5,
-3.839841, -4.39289, 0.01840019, 1, -0.5, 0.5, 0.5,
-3.839841, -4.39289, 0.01840019, 1, 1.5, 0.5, 0.5,
-3.839841, -4.39289, 0.01840019, 0, 1.5, 0.5, 0.5
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
-2, -3.397344, -4.842405,
3, -3.397344, -4.842405,
-2, -3.397344, -4.842405,
-2, -3.563268, -5.085445,
-1, -3.397344, -4.842405,
-1, -3.563268, -5.085445,
0, -3.397344, -4.842405,
0, -3.563268, -5.085445,
1, -3.397344, -4.842405,
1, -3.563268, -5.085445,
2, -3.397344, -4.842405,
2, -3.563268, -5.085445,
3, -3.397344, -4.842405,
3, -3.563268, -5.085445
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
-2, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
-2, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
-2, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
-2, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5,
-1, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
-1, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
-1, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
-1, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5,
0, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
0, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
0, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
0, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5,
1, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
1, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
1, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
1, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5,
2, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
2, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
2, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
2, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5,
3, -3.895117, -5.571526, 0, -0.5, 0.5, 0.5,
3, -3.895117, -5.571526, 1, -0.5, 0.5, 0.5,
3, -3.895117, -5.571526, 1, 1.5, 0.5, 0.5,
3, -3.895117, -5.571526, 0, 1.5, 0.5, 0.5
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
-2.912621, -3, -4.842405,
-2.912621, 3, -4.842405,
-2.912621, -3, -4.842405,
-3.067158, -3, -5.085445,
-2.912621, -2, -4.842405,
-3.067158, -2, -5.085445,
-2.912621, -1, -4.842405,
-3.067158, -1, -5.085445,
-2.912621, 0, -4.842405,
-3.067158, 0, -5.085445,
-2.912621, 1, -4.842405,
-3.067158, 1, -5.085445,
-2.912621, 2, -4.842405,
-3.067158, 2, -5.085445,
-2.912621, 3, -4.842405,
-3.067158, 3, -5.085445
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
-3.376231, -3, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, -3, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, -3, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, -3, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, -2, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, -2, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, -2, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, -2, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, -1, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, -1, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, -1, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, -1, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, 0, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, 0, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, 0, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, 0, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, 1, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, 1, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, 1, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, 1, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, 2, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, 2, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, 2, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, 2, -5.571526, 0, 1.5, 0.5, 0.5,
-3.376231, 3, -5.571526, 0, -0.5, 0.5, 0.5,
-3.376231, 3, -5.571526, 1, -0.5, 0.5, 0.5,
-3.376231, 3, -5.571526, 1, 1.5, 0.5, 0.5,
-3.376231, 3, -5.571526, 0, 1.5, 0.5, 0.5
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
-2.912621, -3.397344, -4,
-2.912621, -3.397344, 4,
-2.912621, -3.397344, -4,
-3.067158, -3.563268, -4,
-2.912621, -3.397344, -2,
-3.067158, -3.563268, -2,
-2.912621, -3.397344, 0,
-3.067158, -3.563268, 0,
-2.912621, -3.397344, 2,
-3.067158, -3.563268, 2,
-2.912621, -3.397344, 4,
-3.067158, -3.563268, 4
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
-3.376231, -3.895117, -4, 0, -0.5, 0.5, 0.5,
-3.376231, -3.895117, -4, 1, -0.5, 0.5, 0.5,
-3.376231, -3.895117, -4, 1, 1.5, 0.5, 0.5,
-3.376231, -3.895117, -4, 0, 1.5, 0.5, 0.5,
-3.376231, -3.895117, -2, 0, -0.5, 0.5, 0.5,
-3.376231, -3.895117, -2, 1, -0.5, 0.5, 0.5,
-3.376231, -3.895117, -2, 1, 1.5, 0.5, 0.5,
-3.376231, -3.895117, -2, 0, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 0, 0, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 0, 1, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 0, 1, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 0, 0, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 2, 0, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 2, 1, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 2, 1, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 2, 0, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 4, 0, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 4, 1, -0.5, 0.5, 0.5,
-3.376231, -3.895117, 4, 1, 1.5, 0.5, 0.5,
-3.376231, -3.895117, 4, 0, 1.5, 0.5, 0.5
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
-2.912621, -3.397344, -4.842405,
-2.912621, 3.239632, -4.842405,
-2.912621, -3.397344, 4.879205,
-2.912621, 3.239632, 4.879205,
-2.912621, -3.397344, -4.842405,
-2.912621, -3.397344, 4.879205,
-2.912621, 3.239632, -4.842405,
-2.912621, 3.239632, 4.879205,
-2.912621, -3.397344, -4.842405,
3.26885, -3.397344, -4.842405,
-2.912621, -3.397344, 4.879205,
3.26885, -3.397344, 4.879205,
-2.912621, 3.239632, -4.842405,
3.26885, 3.239632, -4.842405,
-2.912621, 3.239632, 4.879205,
3.26885, 3.239632, 4.879205,
3.26885, -3.397344, -4.842405,
3.26885, 3.239632, -4.842405,
3.26885, -3.397344, 4.879205,
3.26885, 3.239632, 4.879205,
3.26885, -3.397344, -4.842405,
3.26885, -3.397344, 4.879205,
3.26885, 3.239632, -4.842405,
3.26885, 3.239632, 4.879205
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
var radius = 7.099527;
var distance = 31.5866;
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
mvMatrix.translate( -0.1781147, 0.07885599, -0.01840019 );
mvMatrix.scale( 1.2418, 1.156573, 0.7895963 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.5866);
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
BLASTICIDIN_S<-read.table("BLASTICIDIN_S.xyz", skip=1)
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
-2.822599, 0.2658173, -0.06404036, 0, 0, 1, 1, 1,
-2.636915, -1.063297, -0.8739275, 1, 0, 0, 1, 1,
-2.611309, 0.01715663, -1.702501, 1, 0, 0, 1, 1,
-2.426231, 0.4252442, -3.073184, 1, 0, 0, 1, 1,
-2.363682, -1.136184, -2.833914, 1, 0, 0, 1, 1,
-2.352631, -1.135177, -1.357146, 1, 0, 0, 1, 1,
-2.341825, 1.325331, -1.618019, 0, 0, 0, 1, 1,
-2.285662, -1.033095, -2.354342, 0, 0, 0, 1, 1,
-2.213163, -0.7509885, -1.497437, 0, 0, 0, 1, 1,
-2.207376, -1.530276, -3.062084, 0, 0, 0, 1, 1,
-2.189826, -0.4985593, -1.286267, 0, 0, 0, 1, 1,
-2.18731, -0.4672778, -1.329998, 0, 0, 0, 1, 1,
-2.17835, -1.108422, -3.078144, 0, 0, 0, 1, 1,
-2.151315, -0.2407141, -1.690127, 1, 1, 1, 1, 1,
-2.069648, 0.6607386, -2.151808, 1, 1, 1, 1, 1,
-2.039021, -1.04859, -1.882187, 1, 1, 1, 1, 1,
-2.025705, 0.9065637, -1.428492, 1, 1, 1, 1, 1,
-2.001504, -1.640388, -3.922134, 1, 1, 1, 1, 1,
-1.986938, -0.5298185, -1.08574, 1, 1, 1, 1, 1,
-1.976091, -1.092055, -2.360246, 1, 1, 1, 1, 1,
-1.96247, -1.053324, -1.010847, 1, 1, 1, 1, 1,
-1.945414, -0.4311123, -3.054919, 1, 1, 1, 1, 1,
-1.893773, 1.272932, -1.275783, 1, 1, 1, 1, 1,
-1.889582, 0.6772964, -1.203122, 1, 1, 1, 1, 1,
-1.878309, -1.706616, -1.42597, 1, 1, 1, 1, 1,
-1.852987, -2.002175, -1.853442, 1, 1, 1, 1, 1,
-1.846513, 1.814115, -2.605262, 1, 1, 1, 1, 1,
-1.844735, 0.5911286, -2.47547, 1, 1, 1, 1, 1,
-1.830014, -2.143134, -3.064366, 0, 0, 1, 1, 1,
-1.818654, -0.6084261, -1.358624, 1, 0, 0, 1, 1,
-1.807255, -0.3248885, 0.2746237, 1, 0, 0, 1, 1,
-1.804219, 0.213865, -1.084815, 1, 0, 0, 1, 1,
-1.802624, -0.7911847, -2.439605, 1, 0, 0, 1, 1,
-1.795413, 0.6852942, 0.5268086, 1, 0, 0, 1, 1,
-1.794088, -0.2478838, -3.817617, 0, 0, 0, 1, 1,
-1.790673, -0.7369246, -1.676558, 0, 0, 0, 1, 1,
-1.787816, 0.07298396, -2.853132, 0, 0, 0, 1, 1,
-1.767308, -1.247264, -2.119965, 0, 0, 0, 1, 1,
-1.748671, 0.2661549, -2.920184, 0, 0, 0, 1, 1,
-1.745002, -1.166485, 0.5446163, 0, 0, 0, 1, 1,
-1.740853, 0.7907148, -1.419761, 0, 0, 0, 1, 1,
-1.730214, 1.19822, -2.521722, 1, 1, 1, 1, 1,
-1.726166, 1.25277, -2.235482, 1, 1, 1, 1, 1,
-1.722359, 0.003056514, -1.361847, 1, 1, 1, 1, 1,
-1.700074, 1.456582, -2.425454, 1, 1, 1, 1, 1,
-1.694161, -0.894017, -2.188215, 1, 1, 1, 1, 1,
-1.682017, 0.3786503, 0.7087386, 1, 1, 1, 1, 1,
-1.675102, 0.6883757, -0.8458177, 1, 1, 1, 1, 1,
-1.67268, 0.5602278, -2.04706, 1, 1, 1, 1, 1,
-1.658072, 2.047181, 0.2489385, 1, 1, 1, 1, 1,
-1.634311, -0.6155584, -1.83815, 1, 1, 1, 1, 1,
-1.629143, -0.5270782, -1.528578, 1, 1, 1, 1, 1,
-1.609088, -1.241968, -0.920013, 1, 1, 1, 1, 1,
-1.607206, 2.362976, -0.4709685, 1, 1, 1, 1, 1,
-1.585774, -0.7737421, -0.8747875, 1, 1, 1, 1, 1,
-1.583519, -1.117221, -1.058432, 1, 1, 1, 1, 1,
-1.570836, 0.2634882, -1.316275, 0, 0, 1, 1, 1,
-1.564091, 0.8344341, -1.224211, 1, 0, 0, 1, 1,
-1.561625, -0.07393616, -1.211004, 1, 0, 0, 1, 1,
-1.545596, 1.379144, -1.224141, 1, 0, 0, 1, 1,
-1.529323, 0.8791668, -0.9397938, 1, 0, 0, 1, 1,
-1.523474, 1.849331, -0.2193836, 1, 0, 0, 1, 1,
-1.516861, 0.02519471, -1.939681, 0, 0, 0, 1, 1,
-1.514548, 0.4923141, -2.212957, 0, 0, 0, 1, 1,
-1.51095, -1.655093, -2.833152, 0, 0, 0, 1, 1,
-1.496265, -0.526009, -2.247406, 0, 0, 0, 1, 1,
-1.484168, 1.44221, 0.1171341, 0, 0, 0, 1, 1,
-1.483184, -0.7580954, -1.588661, 0, 0, 0, 1, 1,
-1.477664, 1.093733, -0.4197061, 0, 0, 0, 1, 1,
-1.456654, -0.2055936, -1.831721, 1, 1, 1, 1, 1,
-1.451627, 0.8157306, 1.067666, 1, 1, 1, 1, 1,
-1.451542, -0.798821, -0.4131125, 1, 1, 1, 1, 1,
-1.448877, -0.6612851, -2.051972, 1, 1, 1, 1, 1,
-1.428442, -0.5203617, -0.5022018, 1, 1, 1, 1, 1,
-1.415684, 0.1473856, -0.06179737, 1, 1, 1, 1, 1,
-1.414248, -1.026147, -3.317038, 1, 1, 1, 1, 1,
-1.407317, -0.7457414, -2.054242, 1, 1, 1, 1, 1,
-1.392256, 0.02975413, -1.202728, 1, 1, 1, 1, 1,
-1.392202, -0.7530984, -2.100674, 1, 1, 1, 1, 1,
-1.379739, -0.2974977, -1.04609, 1, 1, 1, 1, 1,
-1.378664, 0.16876, -0.4995998, 1, 1, 1, 1, 1,
-1.359396, -0.8105971, -0.2076887, 1, 1, 1, 1, 1,
-1.3586, -1.105255, -2.810973, 1, 1, 1, 1, 1,
-1.338407, -1.799705, -1.394672, 1, 1, 1, 1, 1,
-1.333917, 1.161484, -2.274578, 0, 0, 1, 1, 1,
-1.326705, -0.4206001, -1.39212, 1, 0, 0, 1, 1,
-1.316424, -2.000083, -1.820549, 1, 0, 0, 1, 1,
-1.30638, 2.173056, 0.07395113, 1, 0, 0, 1, 1,
-1.294151, -1.438313, -0.6905352, 1, 0, 0, 1, 1,
-1.291896, 0.3523247, -1.227665, 1, 0, 0, 1, 1,
-1.284992, 1.656874, -1.822675, 0, 0, 0, 1, 1,
-1.276147, 2.404676, -0.3487022, 0, 0, 0, 1, 1,
-1.263265, 0.1185898, -1.676751, 0, 0, 0, 1, 1,
-1.257253, 1.226272, -0.4493543, 0, 0, 0, 1, 1,
-1.253198, -1.734886, -0.9375252, 0, 0, 0, 1, 1,
-1.244031, -0.9886612, -3.457374, 0, 0, 0, 1, 1,
-1.23975, 0.2595212, -1.947011, 0, 0, 0, 1, 1,
-1.233016, 0.5855234, 0.725401, 1, 1, 1, 1, 1,
-1.223477, -0.277306, -2.534256, 1, 1, 1, 1, 1,
-1.219971, -1.727733, -1.417369, 1, 1, 1, 1, 1,
-1.214832, 2.854676, -0.8966824, 1, 1, 1, 1, 1,
-1.212822, -0.4975865, -3.245319, 1, 1, 1, 1, 1,
-1.211114, -1.38981, -3.029674, 1, 1, 1, 1, 1,
-1.203058, -1.082731, -0.9555032, 1, 1, 1, 1, 1,
-1.181384, -0.5359893, -2.78113, 1, 1, 1, 1, 1,
-1.175577, -1.263324, -2.791057, 1, 1, 1, 1, 1,
-1.174184, -0.1211216, -1.704248, 1, 1, 1, 1, 1,
-1.165805, 0.2237017, -2.672691, 1, 1, 1, 1, 1,
-1.1618, -0.1454577, -2.586093, 1, 1, 1, 1, 1,
-1.154589, -0.1162917, -0.5545226, 1, 1, 1, 1, 1,
-1.149862, -0.5727507, -0.7502264, 1, 1, 1, 1, 1,
-1.146434, 0.2404569, -3.488207, 1, 1, 1, 1, 1,
-1.136184, 0.3698891, -0.4262719, 0, 0, 1, 1, 1,
-1.115859, -0.10088, -2.636596, 1, 0, 0, 1, 1,
-1.103571, -0.05243231, -1.949078, 1, 0, 0, 1, 1,
-1.101844, -0.8214893, -0.6010329, 1, 0, 0, 1, 1,
-1.094868, -2.232316, -1.586203, 1, 0, 0, 1, 1,
-1.091552, 0.7088097, -0.3795198, 1, 0, 0, 1, 1,
-1.089894, -0.325835, -3.160077, 0, 0, 0, 1, 1,
-1.084657, 1.084552, -0.9477836, 0, 0, 0, 1, 1,
-1.076127, 0.6762874, -2.955627, 0, 0, 0, 1, 1,
-1.075626, -0.9325753, -0.8856491, 0, 0, 0, 1, 1,
-1.074482, 0.4680489, -1.425305, 0, 0, 0, 1, 1,
-1.072979, 0.2479919, -0.4351303, 0, 0, 0, 1, 1,
-1.070122, 0.2455662, -1.591716, 0, 0, 0, 1, 1,
-1.068893, 0.4506282, -0.5873941, 1, 1, 1, 1, 1,
-1.067882, 2.02938, -1.336681, 1, 1, 1, 1, 1,
-1.066292, -0.3434221, -1.814333, 1, 1, 1, 1, 1,
-1.062891, 1.743926, -1.410185, 1, 1, 1, 1, 1,
-1.061794, 0.3537581, -2.611066, 1, 1, 1, 1, 1,
-1.053099, 0.1033454, -2.587229, 1, 1, 1, 1, 1,
-1.052471, -0.5411732, -2.691696, 1, 1, 1, 1, 1,
-1.050078, -1.372535, -2.60365, 1, 1, 1, 1, 1,
-1.047343, 0.03624886, -1.094565, 1, 1, 1, 1, 1,
-1.036949, 2.479801, 0.1713917, 1, 1, 1, 1, 1,
-1.034312, 0.3029529, 0.2712677, 1, 1, 1, 1, 1,
-1.013482, 0.7328227, -2.048022, 1, 1, 1, 1, 1,
-1.012058, 1.662801, -2.651371, 1, 1, 1, 1, 1,
-1.00691, 0.4007327, 0.1986842, 1, 1, 1, 1, 1,
-1.004969, 0.2134192, 1.056534, 1, 1, 1, 1, 1,
-0.9943375, 0.09583448, -1.000491, 0, 0, 1, 1, 1,
-0.9870639, 1.774208, -0.5008222, 1, 0, 0, 1, 1,
-0.9833419, -0.7463924, -1.808098, 1, 0, 0, 1, 1,
-0.9788759, 0.4476865, -3.206151, 1, 0, 0, 1, 1,
-0.977605, 0.155991, -2.17063, 1, 0, 0, 1, 1,
-0.9766682, 0.03280015, -3.099962, 1, 0, 0, 1, 1,
-0.9744307, -0.4945876, -1.793692, 0, 0, 0, 1, 1,
-0.9722024, -0.009410284, -1.92006, 0, 0, 0, 1, 1,
-0.9685777, -1.681293, -3.981588, 0, 0, 0, 1, 1,
-0.9613339, 0.5138608, -1.792698, 0, 0, 0, 1, 1,
-0.9608093, -0.05186265, -1.26128, 0, 0, 0, 1, 1,
-0.9593952, 2.622533, 0.4910356, 0, 0, 0, 1, 1,
-0.9519825, -0.2272406, -0.05601411, 0, 0, 0, 1, 1,
-0.9487498, 0.9615504, -0.01049532, 1, 1, 1, 1, 1,
-0.9459088, -1.448203, -1.731956, 1, 1, 1, 1, 1,
-0.9445687, -1.04611, -3.677906, 1, 1, 1, 1, 1,
-0.9424312, -1.229627, -2.032979, 1, 1, 1, 1, 1,
-0.937744, 0.6279195, -2.451552, 1, 1, 1, 1, 1,
-0.9344561, 0.8801467, 0.437515, 1, 1, 1, 1, 1,
-0.9329766, -1.482865, -2.791889, 1, 1, 1, 1, 1,
-0.9264044, -0.08653222, -2.499461, 1, 1, 1, 1, 1,
-0.9219208, -0.103447, -1.241213, 1, 1, 1, 1, 1,
-0.9149666, 1.246534, -0.8029129, 1, 1, 1, 1, 1,
-0.9126744, -0.7686326, -2.891587, 1, 1, 1, 1, 1,
-0.9113118, 0.05911507, -1.468493, 1, 1, 1, 1, 1,
-0.910743, 1.862296, -1.207634, 1, 1, 1, 1, 1,
-0.9041424, -0.263543, -2.999753, 1, 1, 1, 1, 1,
-0.9016108, 0.9621944, -0.1730737, 1, 1, 1, 1, 1,
-0.8989169, -0.9482969, -2.74395, 0, 0, 1, 1, 1,
-0.8968373, -0.8910502, -2.520384, 1, 0, 0, 1, 1,
-0.8965937, -1.140884, -2.791462, 1, 0, 0, 1, 1,
-0.8935235, 0.7501699, -0.2026218, 1, 0, 0, 1, 1,
-0.8918663, 1.565007, -0.4102599, 1, 0, 0, 1, 1,
-0.8913831, 0.8066159, 0.8778962, 1, 0, 0, 1, 1,
-0.8850252, -0.245897, -1.280835, 0, 0, 0, 1, 1,
-0.8849365, -2.112361, -1.011338, 0, 0, 0, 1, 1,
-0.8818298, -0.771475, -2.350649, 0, 0, 0, 1, 1,
-0.8814542, 0.2937301, -0.2662016, 0, 0, 0, 1, 1,
-0.8781683, 1.053961, 0.04417181, 0, 0, 0, 1, 1,
-0.8752782, 0.4665794, -0.9239987, 0, 0, 0, 1, 1,
-0.8708651, 1.27241, -1.518764, 0, 0, 0, 1, 1,
-0.8703001, 1.469751, 0.5296365, 1, 1, 1, 1, 1,
-0.8686646, 0.6805217, 0.09459352, 1, 1, 1, 1, 1,
-0.8667579, 0.2710527, -2.209887, 1, 1, 1, 1, 1,
-0.8665931, 0.5230281, 0.2651328, 1, 1, 1, 1, 1,
-0.8653026, -1.862403, -2.088955, 1, 1, 1, 1, 1,
-0.8642482, 1.720825, 0.03142583, 1, 1, 1, 1, 1,
-0.864033, -2.246789, -1.67378, 1, 1, 1, 1, 1,
-0.858516, -1.3372, -3.596346, 1, 1, 1, 1, 1,
-0.8557237, -2.451075, -4.199385, 1, 1, 1, 1, 1,
-0.8555421, 0.1184131, -1.831784, 1, 1, 1, 1, 1,
-0.854886, -0.5599151, -2.151982, 1, 1, 1, 1, 1,
-0.8468045, -0.4814181, -0.4906216, 1, 1, 1, 1, 1,
-0.8432097, 0.7011725, 0.3625908, 1, 1, 1, 1, 1,
-0.8396258, -0.4055941, -1.923013, 1, 1, 1, 1, 1,
-0.8314371, -1.282977, -2.100724, 1, 1, 1, 1, 1,
-0.8306257, -1.106793, -1.221904, 0, 0, 1, 1, 1,
-0.8201686, -1.775169, -2.734204, 1, 0, 0, 1, 1,
-0.8148597, 1.376696, 0.8394175, 1, 0, 0, 1, 1,
-0.8099047, 0.9949824, -0.4364217, 1, 0, 0, 1, 1,
-0.8080797, -1.054603, -1.878873, 1, 0, 0, 1, 1,
-0.8037024, 0.4281415, -1.469039, 1, 0, 0, 1, 1,
-0.8022444, -0.6123547, -1.832916, 0, 0, 0, 1, 1,
-0.8018633, 2.153152, -1.691043, 0, 0, 0, 1, 1,
-0.7992054, 0.04878683, -0.9198905, 0, 0, 0, 1, 1,
-0.7965491, -1.659979, -2.515226, 0, 0, 0, 1, 1,
-0.7935587, -0.9698055, -1.184189, 0, 0, 0, 1, 1,
-0.7911528, -0.6273075, -3.136889, 0, 0, 0, 1, 1,
-0.7887025, 0.4294348, -0.7715153, 0, 0, 0, 1, 1,
-0.7872645, 0.39706, -0.3774245, 1, 1, 1, 1, 1,
-0.7854486, -1.306535, -1.831542, 1, 1, 1, 1, 1,
-0.7838573, -2.08998, -3.921302, 1, 1, 1, 1, 1,
-0.782244, -0.2824737, -1.515637, 1, 1, 1, 1, 1,
-0.7749171, -0.04984405, -0.8780366, 1, 1, 1, 1, 1,
-0.7634562, -0.5418723, -1.201316, 1, 1, 1, 1, 1,
-0.7602504, -1.046243, -0.5189314, 1, 1, 1, 1, 1,
-0.757414, 1.646656, -0.6475577, 1, 1, 1, 1, 1,
-0.750927, 1.68856, -1.104098, 1, 1, 1, 1, 1,
-0.7485812, 1.006034, -0.67426, 1, 1, 1, 1, 1,
-0.7468428, 2.684983, -1.331883, 1, 1, 1, 1, 1,
-0.7457413, 0.06165019, -1.465127, 1, 1, 1, 1, 1,
-0.7398062, 0.4318882, -1.213987, 1, 1, 1, 1, 1,
-0.7336593, -0.02579517, -2.182684, 1, 1, 1, 1, 1,
-0.733372, -2.386028, -2.130127, 1, 1, 1, 1, 1,
-0.7327073, -0.0795655, -1.531555, 0, 0, 1, 1, 1,
-0.7220263, 0.632894, -1.546933, 1, 0, 0, 1, 1,
-0.718629, -1.768406, -2.418307, 1, 0, 0, 1, 1,
-0.7151982, -2.562098, -2.830174, 1, 0, 0, 1, 1,
-0.7072556, 0.2740515, -1.436428, 1, 0, 0, 1, 1,
-0.7050809, -0.7045267, -3.001009, 1, 0, 0, 1, 1,
-0.704862, -1.403118, -4.373492, 0, 0, 0, 1, 1,
-0.7024848, 1.213666, -1.000337, 0, 0, 0, 1, 1,
-0.7010825, -0.673508, -1.082075, 0, 0, 0, 1, 1,
-0.686829, 0.5727813, -1.254122, 0, 0, 0, 1, 1,
-0.6865153, -0.1108584, -4.606476, 0, 0, 0, 1, 1,
-0.6853334, -0.8919637, -0.3787594, 0, 0, 0, 1, 1,
-0.6829743, -0.8079334, -1.299294, 0, 0, 0, 1, 1,
-0.6796178, 1.132436, -1.086232, 1, 1, 1, 1, 1,
-0.6792077, -0.3007797, -0.8496723, 1, 1, 1, 1, 1,
-0.6788485, 0.4929693, -1.434638, 1, 1, 1, 1, 1,
-0.6780814, 0.3776067, -1.521634, 1, 1, 1, 1, 1,
-0.6734519, -1.152873, -3.28703, 1, 1, 1, 1, 1,
-0.6730195, 0.5101404, -0.7835373, 1, 1, 1, 1, 1,
-0.6715917, -0.4213333, -1.276075, 1, 1, 1, 1, 1,
-0.6620458, 0.3699905, -1.417201, 1, 1, 1, 1, 1,
-0.6612185, -0.9200809, -1.507978, 1, 1, 1, 1, 1,
-0.6610728, 0.5616825, 2.515066, 1, 1, 1, 1, 1,
-0.6581556, 0.2346874, -2.572807, 1, 1, 1, 1, 1,
-0.6536564, -1.130557, -1.409883, 1, 1, 1, 1, 1,
-0.6528788, -1.742548, -1.848366, 1, 1, 1, 1, 1,
-0.6490726, 0.2007875, -0.9227322, 1, 1, 1, 1, 1,
-0.6488091, 1.309505, 0.5450071, 1, 1, 1, 1, 1,
-0.6395553, 0.3575383, -2.249914, 0, 0, 1, 1, 1,
-0.6358223, -0.6282445, -3.384331, 1, 0, 0, 1, 1,
-0.621017, 0.6181697, 0.06489485, 1, 0, 0, 1, 1,
-0.6176007, -1.214274, -1.321257, 1, 0, 0, 1, 1,
-0.6134968, 0.8571492, 0.1580858, 1, 0, 0, 1, 1,
-0.6134236, -0.13011, -2.826756, 1, 0, 0, 1, 1,
-0.6122812, -1.02963, -1.815819, 0, 0, 0, 1, 1,
-0.6103567, -0.06467465, -2.405944, 0, 0, 0, 1, 1,
-0.6082633, 1.585248, -0.2926549, 0, 0, 0, 1, 1,
-0.6047656, -0.5376909, -1.997586, 0, 0, 0, 1, 1,
-0.6027126, 0.4236582, -1.439037, 0, 0, 0, 1, 1,
-0.6026114, -0.5185133, -1.659317, 0, 0, 0, 1, 1,
-0.5999202, -0.4658612, -1.802117, 0, 0, 0, 1, 1,
-0.597782, 0.9587513, 0.1678481, 1, 1, 1, 1, 1,
-0.5970957, 0.02583843, 0.3497385, 1, 1, 1, 1, 1,
-0.5945693, 0.3206685, -2.19066, 1, 1, 1, 1, 1,
-0.5928169, 0.1932186, -1.061089, 1, 1, 1, 1, 1,
-0.5910193, 0.7221204, -2.520953, 1, 1, 1, 1, 1,
-0.5833084, -1.470063, -1.852943, 1, 1, 1, 1, 1,
-0.5810694, -0.5988521, -2.071661, 1, 1, 1, 1, 1,
-0.571353, -0.8275676, -4.114937, 1, 1, 1, 1, 1,
-0.5711028, 1.031671, 0.1622031, 1, 1, 1, 1, 1,
-0.5688241, -0.9288899, -3.402886, 1, 1, 1, 1, 1,
-0.5686696, 1.497472, -0.2699569, 1, 1, 1, 1, 1,
-0.5669521, -0.8881361, -2.481089, 1, 1, 1, 1, 1,
-0.5667979, 0.20653, -0.6302668, 1, 1, 1, 1, 1,
-0.5655789, -1.225765, -2.340128, 1, 1, 1, 1, 1,
-0.5545493, 0.6570835, -0.8391867, 1, 1, 1, 1, 1,
-0.5541492, -0.7606197, -2.365261, 0, 0, 1, 1, 1,
-0.5508628, -1.330867, -3.208276, 1, 0, 0, 1, 1,
-0.5506904, 0.4506411, -3.582115, 1, 0, 0, 1, 1,
-0.5450332, 0.9134503, 0.02576885, 1, 0, 0, 1, 1,
-0.5421414, 0.6965496, 0.5016336, 1, 0, 0, 1, 1,
-0.5387318, 0.02862791, -1.977803, 1, 0, 0, 1, 1,
-0.5379245, -1.382317, -2.451324, 0, 0, 0, 1, 1,
-0.5375999, -0.7069885, -1.908177, 0, 0, 0, 1, 1,
-0.5357807, -1.23778, -4.251051, 0, 0, 0, 1, 1,
-0.5354042, -0.265925, -2.25248, 0, 0, 0, 1, 1,
-0.534768, 0.7062826, -1.747177, 0, 0, 0, 1, 1,
-0.5308771, 0.6192575, -1.378838, 0, 0, 0, 1, 1,
-0.5288749, 0.5845479, -1.03537, 0, 0, 0, 1, 1,
-0.5281063, -1.877798, -1.679385, 1, 1, 1, 1, 1,
-0.5253417, -0.9578568, -2.249653, 1, 1, 1, 1, 1,
-0.5202705, -0.2236079, -3.60265, 1, 1, 1, 1, 1,
-0.5186858, -1.210457, -3.48721, 1, 1, 1, 1, 1,
-0.5172367, 0.8265378, -1.137583, 1, 1, 1, 1, 1,
-0.5085309, -1.439069, -1.874524, 1, 1, 1, 1, 1,
-0.5070081, -0.3261567, -0.9389427, 1, 1, 1, 1, 1,
-0.5066847, -1.059391, -2.231466, 1, 1, 1, 1, 1,
-0.5065369, 0.4831691, -0.4166102, 1, 1, 1, 1, 1,
-0.5059513, 0.9655315, -0.3798677, 1, 1, 1, 1, 1,
-0.5057504, 0.2520801, -2.234718, 1, 1, 1, 1, 1,
-0.5056701, 1.668887, 0.01068229, 1, 1, 1, 1, 1,
-0.5047839, 0.3735301, -2.378379, 1, 1, 1, 1, 1,
-0.504151, -0.639425, -1.990471, 1, 1, 1, 1, 1,
-0.5033141, -0.5723447, -3.425395, 1, 1, 1, 1, 1,
-0.5001319, -0.6521146, -2.876386, 0, 0, 1, 1, 1,
-0.4990105, 0.03878079, -2.466966, 1, 0, 0, 1, 1,
-0.4937424, -0.5559157, -3.868177, 1, 0, 0, 1, 1,
-0.4929608, -0.0754371, -2.90799, 1, 0, 0, 1, 1,
-0.4900356, 0.7637217, -1.641178, 1, 0, 0, 1, 1,
-0.4899046, 1.097887, -1.517796, 1, 0, 0, 1, 1,
-0.4889476, 0.1940574, -0.9405465, 0, 0, 0, 1, 1,
-0.4884745, -0.07890061, -2.800401, 0, 0, 0, 1, 1,
-0.4855702, 0.1403011, 0.03042025, 0, 0, 0, 1, 1,
-0.4783363, 0.1673237, -1.066722, 0, 0, 0, 1, 1,
-0.4704041, 0.4901835, -2.546157, 0, 0, 0, 1, 1,
-0.4703756, 0.01123524, -2.641896, 0, 0, 0, 1, 1,
-0.4651634, 1.457825, 1.417085, 0, 0, 0, 1, 1,
-0.4642622, -0.9996849, -3.397559, 1, 1, 1, 1, 1,
-0.4516073, 0.8624988, -1.969406, 1, 1, 1, 1, 1,
-0.4457138, -1.042522, -1.831393, 1, 1, 1, 1, 1,
-0.4439034, 0.20738, 0.4210598, 1, 1, 1, 1, 1,
-0.4429597, -0.536566, -2.616304, 1, 1, 1, 1, 1,
-0.437005, 2.399825, 0.616991, 1, 1, 1, 1, 1,
-0.4321457, -0.454937, -2.095105, 1, 1, 1, 1, 1,
-0.4308204, 0.5905608, -0.2634222, 1, 1, 1, 1, 1,
-0.4239787, 0.3020246, -1.169999, 1, 1, 1, 1, 1,
-0.4183066, 0.2429853, -1.455669, 1, 1, 1, 1, 1,
-0.4125294, 0.8499465, -1.230078, 1, 1, 1, 1, 1,
-0.4098265, -0.499574, -3.643518, 1, 1, 1, 1, 1,
-0.4087932, 0.2754253, -2.183155, 1, 1, 1, 1, 1,
-0.4034441, 0.3780524, -0.740003, 1, 1, 1, 1, 1,
-0.4009137, -0.8129221, -2.918577, 1, 1, 1, 1, 1,
-0.3992876, 0.3361615, -2.619542, 0, 0, 1, 1, 1,
-0.3984572, 1.916007, -0.6578072, 1, 0, 0, 1, 1,
-0.3976036, -1.112056, -1.363126, 1, 0, 0, 1, 1,
-0.3955046, -1.104783, -2.200617, 1, 0, 0, 1, 1,
-0.3949968, -0.2108652, -3.537131, 1, 0, 0, 1, 1,
-0.3915276, -1.305162, -1.843772, 1, 0, 0, 1, 1,
-0.3880722, -0.659182, -1.990681, 0, 0, 0, 1, 1,
-0.3799889, 0.7598363, -1.761151, 0, 0, 0, 1, 1,
-0.3776904, 1.127181, -1.789868, 0, 0, 0, 1, 1,
-0.3773549, 0.4454502, -0.2933703, 0, 0, 0, 1, 1,
-0.374478, -1.221042, -2.823583, 0, 0, 0, 1, 1,
-0.3706191, -0.8685127, -3.731545, 0, 0, 0, 1, 1,
-0.3685463, -1.121594, -1.696146, 0, 0, 0, 1, 1,
-0.3684659, 1.086016, -0.581989, 1, 1, 1, 1, 1,
-0.3681304, 2.815826, 0.1325794, 1, 1, 1, 1, 1,
-0.3659664, -0.06461252, -2.066971, 1, 1, 1, 1, 1,
-0.3613132, 1.70287, 0.2707192, 1, 1, 1, 1, 1,
-0.3503311, 1.375822, 0.4971125, 1, 1, 1, 1, 1,
-0.3497747, -0.02526781, -3.436773, 1, 1, 1, 1, 1,
-0.3481011, 1.651097, 0.001387512, 1, 1, 1, 1, 1,
-0.3417931, 0.4981038, -2.310949, 1, 1, 1, 1, 1,
-0.3400011, 0.3086125, -2.654607, 1, 1, 1, 1, 1,
-0.3384872, 0.6627437, -1.488489, 1, 1, 1, 1, 1,
-0.3375186, -0.7278013, -2.942742, 1, 1, 1, 1, 1,
-0.3369476, 1.224419, 0.1614143, 1, 1, 1, 1, 1,
-0.3308037, -0.3962922, -3.35567, 1, 1, 1, 1, 1,
-0.330645, 1.396031, -1.069449, 1, 1, 1, 1, 1,
-0.3283858, -0.8741295, -4.700828, 1, 1, 1, 1, 1,
-0.3277412, 2.326377, -2.211245, 0, 0, 1, 1, 1,
-0.3252867, 0.244164, -0.0635334, 1, 0, 0, 1, 1,
-0.3239591, 0.2960992, -1.465013, 1, 0, 0, 1, 1,
-0.3196634, 1.14991, -0.08813626, 1, 0, 0, 1, 1,
-0.319014, -0.676372, -2.014938, 1, 0, 0, 1, 1,
-0.3179135, 1.310731, -1.736112, 1, 0, 0, 1, 1,
-0.3171444, 2.622455, -0.1431736, 0, 0, 0, 1, 1,
-0.3168512, 0.5313514, -0.6430065, 0, 0, 0, 1, 1,
-0.3137703, -0.2490539, -3.374621, 0, 0, 0, 1, 1,
-0.3122326, -0.2537103, -3.2702, 0, 0, 0, 1, 1,
-0.3068796, -0.01593732, -0.7641076, 0, 0, 0, 1, 1,
-0.3046019, -0.3076475, -1.66257, 0, 0, 0, 1, 1,
-0.295663, -0.6917076, -2.961164, 0, 0, 0, 1, 1,
-0.2952584, 0.2166577, -0.1892275, 1, 1, 1, 1, 1,
-0.2902523, -0.2242702, -3.083245, 1, 1, 1, 1, 1,
-0.288973, -1.992379, -2.573012, 1, 1, 1, 1, 1,
-0.2830294, 0.7087294, -0.9983259, 1, 1, 1, 1, 1,
-0.281467, 2.443905, -0.9771183, 1, 1, 1, 1, 1,
-0.2800021, -0.5212983, -3.006408, 1, 1, 1, 1, 1,
-0.279621, 1.427407, -0.1265766, 1, 1, 1, 1, 1,
-0.2704861, 0.2849881, -0.5047953, 1, 1, 1, 1, 1,
-0.2693772, -1.900325, -4.629721, 1, 1, 1, 1, 1,
-0.2687424, 0.007943536, -1.677426, 1, 1, 1, 1, 1,
-0.2684835, -0.3788464, -2.671013, 1, 1, 1, 1, 1,
-0.2626413, -0.3864157, -2.648885, 1, 1, 1, 1, 1,
-0.262409, 0.5327283, -1.668432, 1, 1, 1, 1, 1,
-0.2610982, 0.6657353, 0.288608, 1, 1, 1, 1, 1,
-0.2588736, -0.7071321, -2.330819, 1, 1, 1, 1, 1,
-0.2561571, -1.593631, -2.222143, 0, 0, 1, 1, 1,
-0.2544957, -1.085945, -2.370359, 1, 0, 0, 1, 1,
-0.2541084, 1.82375, -3.030912, 1, 0, 0, 1, 1,
-0.2536599, 0.7467725, -0.3347314, 1, 0, 0, 1, 1,
-0.2524292, -0.9475362, -3.309349, 1, 0, 0, 1, 1,
-0.248959, 0.5982494, 1.036917, 1, 0, 0, 1, 1,
-0.2479731, 0.2689914, 0.3072876, 0, 0, 0, 1, 1,
-0.2448687, -0.1664965, -3.566939, 0, 0, 0, 1, 1,
-0.2419499, -0.4235413, -2.426309, 0, 0, 0, 1, 1,
-0.2413625, -1.19765, -2.768494, 0, 0, 0, 1, 1,
-0.2379554, 0.5425895, -2.132849, 0, 0, 0, 1, 1,
-0.2352635, 1.113827, -1.739933, 0, 0, 0, 1, 1,
-0.2296648, -1.818222, -2.041231, 0, 0, 0, 1, 1,
-0.2282979, 1.405188, 1.229611, 1, 1, 1, 1, 1,
-0.2251617, -1.884112, -3.005391, 1, 1, 1, 1, 1,
-0.2213526, 0.2074193, 0.4742376, 1, 1, 1, 1, 1,
-0.2185392, -0.1852913, -2.242579, 1, 1, 1, 1, 1,
-0.2147227, 0.1782358, -0.595872, 1, 1, 1, 1, 1,
-0.2103916, 0.6330428, -1.04058, 1, 1, 1, 1, 1,
-0.2095913, 0.1936335, -0.3830127, 1, 1, 1, 1, 1,
-0.2082846, 0.02598113, -2.627946, 1, 1, 1, 1, 1,
-0.2075616, 1.270429, 0.5881209, 1, 1, 1, 1, 1,
-0.2029329, -0.2930159, -3.365883, 1, 1, 1, 1, 1,
-0.2007559, 0.3900139, -0.7501163, 1, 1, 1, 1, 1,
-0.1992425, 0.8584618, -0.7645574, 1, 1, 1, 1, 1,
-0.196695, 0.6769353, -0.2205456, 1, 1, 1, 1, 1,
-0.1961545, 0.7253433, 1.277951, 1, 1, 1, 1, 1,
-0.1957568, 0.9090527, -2.088648, 1, 1, 1, 1, 1,
-0.1924558, -0.3399331, -1.620656, 0, 0, 1, 1, 1,
-0.1878764, 0.4824793, -1.734876, 1, 0, 0, 1, 1,
-0.1866105, 0.4234477, -1.389845, 1, 0, 0, 1, 1,
-0.1819882, -1.489201, -3.098722, 1, 0, 0, 1, 1,
-0.1757825, 1.124895, 0.3213653, 1, 0, 0, 1, 1,
-0.1751116, 0.6810518, 0.1055975, 1, 0, 0, 1, 1,
-0.1748074, 0.08220199, -1.466671, 0, 0, 0, 1, 1,
-0.1734115, -0.8512651, -3.522073, 0, 0, 0, 1, 1,
-0.1732988, -1.011034, -2.440657, 0, 0, 0, 1, 1,
-0.1724733, -0.1022275, -0.9410548, 0, 0, 0, 1, 1,
-0.1692767, 0.7511267, 0.8768442, 0, 0, 0, 1, 1,
-0.1678077, -0.4236417, -2.575987, 0, 0, 0, 1, 1,
-0.1663206, 0.9977297, -1.303604, 0, 0, 0, 1, 1,
-0.1606749, -0.7586762, -2.414314, 1, 1, 1, 1, 1,
-0.156857, -0.5646762, -2.6562, 1, 1, 1, 1, 1,
-0.1555288, 0.9233081, 0.1753727, 1, 1, 1, 1, 1,
-0.1533678, 0.6615588, 0.1555833, 1, 1, 1, 1, 1,
-0.151061, -0.7374651, -2.452563, 1, 1, 1, 1, 1,
-0.1484079, 0.4963372, -1.263893, 1, 1, 1, 1, 1,
-0.1480035, -0.5017086, -2.566638, 1, 1, 1, 1, 1,
-0.1461805, -0.4858714, -3.054093, 1, 1, 1, 1, 1,
-0.145797, 0.2130656, 0.9429126, 1, 1, 1, 1, 1,
-0.1446321, 0.7472638, -0.4682477, 1, 1, 1, 1, 1,
-0.143176, -0.4489352, -3.128628, 1, 1, 1, 1, 1,
-0.1427467, -0.9637868, -2.737683, 1, 1, 1, 1, 1,
-0.1413937, 0.4867053, 0.20806, 1, 1, 1, 1, 1,
-0.1387347, -0.39161, -3.725438, 1, 1, 1, 1, 1,
-0.138633, 0.9108922, 0.08530586, 1, 1, 1, 1, 1,
-0.1378767, 0.5131427, -0.5519702, 0, 0, 1, 1, 1,
-0.1374544, 1.247942, -1.014869, 1, 0, 0, 1, 1,
-0.1367385, 0.5946915, 0.01397249, 1, 0, 0, 1, 1,
-0.1354766, -1.115991, -2.776758, 1, 0, 0, 1, 1,
-0.1313479, -0.48547, -2.188528, 1, 0, 0, 1, 1,
-0.1299081, 0.4559476, 1.181091, 1, 0, 0, 1, 1,
-0.1285235, -0.04818673, 0.1376903, 0, 0, 0, 1, 1,
-0.1241138, 1.197355, 0.09306506, 0, 0, 0, 1, 1,
-0.1218624, -0.3017297, -2.198975, 0, 0, 0, 1, 1,
-0.121053, -0.08008435, -3.739844, 0, 0, 0, 1, 1,
-0.1193269, 1.515953, 1.189637, 0, 0, 0, 1, 1,
-0.1148086, 0.257964, -0.8776683, 0, 0, 0, 1, 1,
-0.1145755, 1.365925, 0.8084124, 0, 0, 0, 1, 1,
-0.1138354, -0.2859297, -2.892224, 1, 1, 1, 1, 1,
-0.1038524, -1.683813, -3.271426, 1, 1, 1, 1, 1,
-0.1008635, 0.1269701, -1.058477, 1, 1, 1, 1, 1,
-0.09984828, 0.363357, 0.6148615, 1, 1, 1, 1, 1,
-0.09885691, 0.4232169, -2.168674, 1, 1, 1, 1, 1,
-0.09779366, -1.492635, -3.501564, 1, 1, 1, 1, 1,
-0.09524105, 0.6256822, -1.121279, 1, 1, 1, 1, 1,
-0.09423795, 0.7183262, 0.6792204, 1, 1, 1, 1, 1,
-0.09395804, 0.6342167, 0.0986212, 1, 1, 1, 1, 1,
-0.09238791, 0.8253017, -0.3022633, 1, 1, 1, 1, 1,
-0.09213707, -0.5151311, -2.882094, 1, 1, 1, 1, 1,
-0.09084502, -1.327772, -3.520838, 1, 1, 1, 1, 1,
-0.08688473, -1.178225, -2.377823, 1, 1, 1, 1, 1,
-0.08556197, -0.404994, -3.766804, 1, 1, 1, 1, 1,
-0.08151366, 0.7155268, 0.6208964, 1, 1, 1, 1, 1,
-0.08105665, 0.5800145, -0.5214957, 0, 0, 1, 1, 1,
-0.08102036, -0.2521906, -3.496814, 1, 0, 0, 1, 1,
-0.08056193, -0.5291455, -3.190684, 1, 0, 0, 1, 1,
-0.07854699, 0.8640558, -0.8598055, 1, 0, 0, 1, 1,
-0.07854652, 1.064842, -0.2097614, 1, 0, 0, 1, 1,
-0.07703426, 1.595721, -0.1449011, 1, 0, 0, 1, 1,
-0.07686695, -0.7022164, -1.176206, 0, 0, 0, 1, 1,
-0.07514845, 0.9624342, 0.8456933, 0, 0, 0, 1, 1,
-0.07463495, -0.122689, -0.9210034, 0, 0, 0, 1, 1,
-0.07389122, -0.632229, -2.746638, 0, 0, 0, 1, 1,
-0.06236865, -0.3313892, -2.224715, 0, 0, 0, 1, 1,
-0.06075832, 0.3356354, 0.6334114, 0, 0, 0, 1, 1,
-0.06010887, -0.5570272, -3.552467, 0, 0, 0, 1, 1,
-0.05701752, 0.542645, 1.000309, 1, 1, 1, 1, 1,
-0.0553962, 0.7247277, -0.7300873, 1, 1, 1, 1, 1,
-0.05453856, 1.022768, -0.757898, 1, 1, 1, 1, 1,
-0.05399301, 1.942592, -0.7358957, 1, 1, 1, 1, 1,
-0.04245698, -0.1141547, -2.258975, 1, 1, 1, 1, 1,
-0.03890205, 1.655882, -0.324498, 1, 1, 1, 1, 1,
-0.03794305, 0.6629031, 0.531273, 1, 1, 1, 1, 1,
-0.03713142, 0.6678998, 0.8537331, 1, 1, 1, 1, 1,
-0.03674946, 0.5066428, 0.08354764, 1, 1, 1, 1, 1,
-0.02838613, 1.111163, 0.2872993, 1, 1, 1, 1, 1,
-0.01779997, -0.4375011, -3.013143, 1, 1, 1, 1, 1,
-0.01522877, 0.2812074, 0.6821487, 1, 1, 1, 1, 1,
-0.01444456, -0.3578905, -3.430143, 1, 1, 1, 1, 1,
-0.01084279, -0.1600639, -3.545915, 1, 1, 1, 1, 1,
-0.009625996, -0.4726638, -3.224334, 1, 1, 1, 1, 1,
-0.009232723, -0.5441306, -1.954209, 0, 0, 1, 1, 1,
-0.003812689, 0.3163921, 0.1544146, 1, 0, 0, 1, 1,
0.003217848, 0.2585005, 0.6665137, 1, 0, 0, 1, 1,
0.004523884, -1.834012, 3.240027, 1, 0, 0, 1, 1,
0.008019223, 0.8385119, -0.1476274, 1, 0, 0, 1, 1,
0.009231455, 1.569559, -1.209995, 1, 0, 0, 1, 1,
0.03309, 1.270358, -0.1780358, 0, 0, 0, 1, 1,
0.03315336, 0.7769169, 0.2550429, 0, 0, 0, 1, 1,
0.03360899, 0.6792114, 0.05952059, 0, 0, 0, 1, 1,
0.03480223, -0.2558536, 3.791301, 0, 0, 0, 1, 1,
0.03670376, 2.301077, -0.07332619, 0, 0, 0, 1, 1,
0.03936839, -1.215698, 2.108109, 0, 0, 0, 1, 1,
0.03983818, 0.5974162, 0.6759165, 0, 0, 0, 1, 1,
0.04458741, 0.3917971, 0.4719746, 1, 1, 1, 1, 1,
0.05247675, 0.120825, -0.2255872, 1, 1, 1, 1, 1,
0.05327689, 0.3498844, 1.439078, 1, 1, 1, 1, 1,
0.056414, 0.350835, -0.3563654, 1, 1, 1, 1, 1,
0.05811907, 0.1848938, -0.2942556, 1, 1, 1, 1, 1,
0.06247675, 0.5609737, -0.5157129, 1, 1, 1, 1, 1,
0.06354892, 1.542423, 0.8306218, 1, 1, 1, 1, 1,
0.06401939, 0.373148, 0.7784904, 1, 1, 1, 1, 1,
0.06539323, 2.139965, -0.2547257, 1, 1, 1, 1, 1,
0.06965245, -0.02728017, 1.203033, 1, 1, 1, 1, 1,
0.07022841, -0.8090845, 2.288608, 1, 1, 1, 1, 1,
0.07722577, 0.1693134, 0.5072325, 1, 1, 1, 1, 1,
0.07813179, -0.2260107, 4.178593, 1, 1, 1, 1, 1,
0.08182931, -0.5897806, 1.294909, 1, 1, 1, 1, 1,
0.08389714, -0.1700391, 1.156643, 1, 1, 1, 1, 1,
0.08593057, 1.378959, -0.2097801, 0, 0, 1, 1, 1,
0.08617721, -0.5190697, 4.029651, 1, 0, 0, 1, 1,
0.08627561, 0.6246216, 0.02420958, 1, 0, 0, 1, 1,
0.08924458, 0.7458674, 0.02174657, 1, 0, 0, 1, 1,
0.0938889, 1.28745, -0.09664293, 1, 0, 0, 1, 1,
0.09725624, -0.7667851, 4.233125, 1, 0, 0, 1, 1,
0.1029677, 0.1598499, 2.400098, 0, 0, 0, 1, 1,
0.1039559, -0.8886481, 4.737628, 0, 0, 0, 1, 1,
0.1048338, -0.3561153, 2.730205, 0, 0, 0, 1, 1,
0.1054669, -0.3312262, 3.432791, 0, 0, 0, 1, 1,
0.1064096, -0.3564829, 3.641681, 0, 0, 0, 1, 1,
0.1097977, -1.949059, 2.860309, 0, 0, 0, 1, 1,
0.11713, -0.8835835, 3.447214, 0, 0, 0, 1, 1,
0.1189721, -0.7706997, 3.245658, 1, 1, 1, 1, 1,
0.1219904, -0.1030154, 0.6742557, 1, 1, 1, 1, 1,
0.122663, -0.9828848, 2.713056, 1, 1, 1, 1, 1,
0.123205, 1.31941, 1.316425, 1, 1, 1, 1, 1,
0.1242238, 0.01450459, 2.319209, 1, 1, 1, 1, 1,
0.1265174, 1.471465, 0.7689863, 1, 1, 1, 1, 1,
0.1323528, 0.03268208, 1.584829, 1, 1, 1, 1, 1,
0.1387067, 1.003524, -0.8564153, 1, 1, 1, 1, 1,
0.1421656, -0.1416304, 3.515272, 1, 1, 1, 1, 1,
0.1502159, -0.618811, 2.465609, 1, 1, 1, 1, 1,
0.1535694, 2.053331, 0.6055498, 1, 1, 1, 1, 1,
0.1552498, -0.9836742, 4.548093, 1, 1, 1, 1, 1,
0.1552805, -1.180801, 2.214957, 1, 1, 1, 1, 1,
0.1584481, -0.5142384, 1.726755, 1, 1, 1, 1, 1,
0.1608879, -1.377979, 2.503305, 1, 1, 1, 1, 1,
0.1694651, 0.8438765, 1.012048, 0, 0, 1, 1, 1,
0.1715906, 0.3072023, 0.7954478, 1, 0, 0, 1, 1,
0.1733932, 0.9245801, -2.16728, 1, 0, 0, 1, 1,
0.1736051, -1.416384, 4.493708, 1, 0, 0, 1, 1,
0.1836872, -2.450784, 4.556579, 1, 0, 0, 1, 1,
0.1875069, -0.4969521, 3.264745, 1, 0, 0, 1, 1,
0.1898802, 1.108768, 0.6415339, 0, 0, 0, 1, 1,
0.1911893, -0.9163553, 2.418423, 0, 0, 0, 1, 1,
0.1939206, -0.8211986, 2.670027, 0, 0, 0, 1, 1,
0.1987814, 0.06392793, 0.8933291, 0, 0, 0, 1, 1,
0.1991151, 0.3602147, 1.491892, 0, 0, 0, 1, 1,
0.1994372, 1.066006, 0.5583286, 0, 0, 0, 1, 1,
0.1997585, -0.7175674, 3.186477, 0, 0, 0, 1, 1,
0.2048806, 1.153431, 1.874011, 1, 1, 1, 1, 1,
0.2093025, -0.3957807, 3.284631, 1, 1, 1, 1, 1,
0.2183831, 0.4066598, -1.462317, 1, 1, 1, 1, 1,
0.2222802, -1.693726, 1.149516, 1, 1, 1, 1, 1,
0.2237363, -0.4593844, 2.117817, 1, 1, 1, 1, 1,
0.2263146, -1.176387, 3.228792, 1, 1, 1, 1, 1,
0.2270037, 0.5335143, 0.9589639, 1, 1, 1, 1, 1,
0.2279059, -1.952701, 1.761894, 1, 1, 1, 1, 1,
0.2288887, 0.1619434, 0.5262209, 1, 1, 1, 1, 1,
0.2313997, -0.2618891, 3.624848, 1, 1, 1, 1, 1,
0.2411087, 0.5077913, 0.1581774, 1, 1, 1, 1, 1,
0.2411979, -0.08048411, 0.4066363, 1, 1, 1, 1, 1,
0.242965, 0.3256449, -0.3609289, 1, 1, 1, 1, 1,
0.2430354, -1.570833, 3.461092, 1, 1, 1, 1, 1,
0.2493136, 0.4134022, -0.2001008, 1, 1, 1, 1, 1,
0.2496408, 1.147308, 1.451933, 0, 0, 1, 1, 1,
0.2505663, 0.7721903, 0.5734539, 1, 0, 0, 1, 1,
0.2513776, -0.6613594, 3.747843, 1, 0, 0, 1, 1,
0.2514381, 1.219751, 0.6482862, 1, 0, 0, 1, 1,
0.2516413, -1.534053, 3.664691, 1, 0, 0, 1, 1,
0.2537645, 0.7631237, -0.3262632, 1, 0, 0, 1, 1,
0.2547789, -0.4508428, -0.2406562, 0, 0, 0, 1, 1,
0.2595503, -0.382586, 3.222402, 0, 0, 0, 1, 1,
0.2617563, 0.3450867, -0.7746497, 0, 0, 0, 1, 1,
0.2646362, -1.588769, 1.765278, 0, 0, 0, 1, 1,
0.2659017, 0.6712811, 1.319231, 0, 0, 0, 1, 1,
0.2659165, -1.96182, 3.424973, 0, 0, 0, 1, 1,
0.266203, 0.2321988, 1.616483, 0, 0, 0, 1, 1,
0.271067, -0.6037271, 2.779927, 1, 1, 1, 1, 1,
0.2723241, -1.080733, 2.958311, 1, 1, 1, 1, 1,
0.2766915, 0.3934571, 0.8026897, 1, 1, 1, 1, 1,
0.2798161, -1.689085, 3.507895, 1, 1, 1, 1, 1,
0.2804911, -0.03006698, 1.293358, 1, 1, 1, 1, 1,
0.2811958, -0.4175814, 0.9091042, 1, 1, 1, 1, 1,
0.2832273, -0.8405402, 2.225098, 1, 1, 1, 1, 1,
0.2834221, 1.865911, -0.9226504, 1, 1, 1, 1, 1,
0.2840176, 0.7647064, 0.703289, 1, 1, 1, 1, 1,
0.2857737, 1.153632, 1.70561, 1, 1, 1, 1, 1,
0.2893058, -0.5742499, 2.422354, 1, 1, 1, 1, 1,
0.2900777, -0.3261273, 1.858574, 1, 1, 1, 1, 1,
0.2944862, 0.04124698, 3.327789, 1, 1, 1, 1, 1,
0.2966179, -0.1565845, 3.29425, 1, 1, 1, 1, 1,
0.3009754, 0.8473607, 1.443464, 1, 1, 1, 1, 1,
0.3015998, 0.3182066, 0.2466408, 0, 0, 1, 1, 1,
0.3016057, -0.005700107, 2.42534, 1, 0, 0, 1, 1,
0.3018248, -0.3044854, 0.9556868, 1, 0, 0, 1, 1,
0.3056343, 0.1037374, 3.338568, 1, 0, 0, 1, 1,
0.307278, 1.185539, -0.06409686, 1, 0, 0, 1, 1,
0.3113396, 0.01597752, 0.3405119, 1, 0, 0, 1, 1,
0.3141228, -0.2217684, 1.54521, 0, 0, 0, 1, 1,
0.3155262, -0.543989, 2.100714, 0, 0, 0, 1, 1,
0.3199694, -0.01018132, 2.547568, 0, 0, 0, 1, 1,
0.3213273, 0.5303309, 0.8540865, 0, 0, 0, 1, 1,
0.3224742, -0.7884713, 2.935296, 0, 0, 0, 1, 1,
0.3224752, -0.8802142, 1.676272, 0, 0, 0, 1, 1,
0.3245507, 0.1097463, -0.7588869, 0, 0, 0, 1, 1,
0.3248135, 0.2055006, 1.044719, 1, 1, 1, 1, 1,
0.324947, -1.707247, 1.583635, 1, 1, 1, 1, 1,
0.3273182, 0.2066006, 0.2593171, 1, 1, 1, 1, 1,
0.3297394, -0.2704869, 0.8117756, 1, 1, 1, 1, 1,
0.3313437, -0.3992273, 1.838396, 1, 1, 1, 1, 1,
0.3321336, -1.7129, 2.212169, 1, 1, 1, 1, 1,
0.3423091, 0.9939381, 0.8120968, 1, 1, 1, 1, 1,
0.3426494, 0.5099863, 0.2348827, 1, 1, 1, 1, 1,
0.3516515, 1.333965, 1.024298, 1, 1, 1, 1, 1,
0.3686711, -0.5371826, 1.438805, 1, 1, 1, 1, 1,
0.3692157, -1.177882, 2.953844, 1, 1, 1, 1, 1,
0.3694631, -1.059663, 2.574343, 1, 1, 1, 1, 1,
0.3716452, -0.229385, 3.791022, 1, 1, 1, 1, 1,
0.3730194, -0.5845049, 3.309024, 1, 1, 1, 1, 1,
0.3779259, 0.3689352, 0.8579125, 1, 1, 1, 1, 1,
0.3826978, -0.7192128, 1.907561, 0, 0, 1, 1, 1,
0.3832888, -0.2324654, 0.7084716, 1, 0, 0, 1, 1,
0.3888405, -0.08089629, 3.494337, 1, 0, 0, 1, 1,
0.3908311, 0.3957081, 0.1163274, 1, 0, 0, 1, 1,
0.3976333, -0.04267697, 1.483803, 1, 0, 0, 1, 1,
0.3983293, -0.6147946, 1.58189, 1, 0, 0, 1, 1,
0.4026217, -0.6949719, 3.545929, 0, 0, 0, 1, 1,
0.4026904, 1.028765, 1.722633, 0, 0, 0, 1, 1,
0.4066518, 1.044865, -0.2165845, 0, 0, 0, 1, 1,
0.410835, -0.7179498, 3.072883, 0, 0, 0, 1, 1,
0.4117583, -0.295387, 1.58422, 0, 0, 0, 1, 1,
0.4172851, -1.13397, 2.687388, 0, 0, 0, 1, 1,
0.4194528, -0.2401452, 3.153257, 0, 0, 0, 1, 1,
0.4196575, -0.9259439, 1.897463, 1, 1, 1, 1, 1,
0.4230174, 1.643702, 1.706808, 1, 1, 1, 1, 1,
0.42454, -1.670215, 2.92008, 1, 1, 1, 1, 1,
0.4256966, 1.651825, 2.204646, 1, 1, 1, 1, 1,
0.4361315, 1.074128, -0.1330345, 1, 1, 1, 1, 1,
0.4382718, 0.5135115, 2.064831, 1, 1, 1, 1, 1,
0.4436928, 0.5691085, -0.2753376, 1, 1, 1, 1, 1,
0.4531629, 1.562389, 0.3477825, 1, 1, 1, 1, 1,
0.4533986, 1.716357, -0.981142, 1, 1, 1, 1, 1,
0.4545927, 0.4731528, 0.119238, 1, 1, 1, 1, 1,
0.4546837, -0.4387416, 0.376757, 1, 1, 1, 1, 1,
0.4555029, -1.096785, 3.029779, 1, 1, 1, 1, 1,
0.4571376, -0.1731757, 0.9250428, 1, 1, 1, 1, 1,
0.4577233, -0.9208418, 3.827418, 1, 1, 1, 1, 1,
0.4588885, -2.050604, 3.33487, 1, 1, 1, 1, 1,
0.4690567, -0.09308551, 1.975152, 0, 0, 1, 1, 1,
0.4693861, 1.193513, -0.7449511, 1, 0, 0, 1, 1,
0.4753308, 1.807495, 1.65195, 1, 0, 0, 1, 1,
0.4756845, -0.3913225, 2.007428, 1, 0, 0, 1, 1,
0.4758171, -0.8911518, 3.678636, 1, 0, 0, 1, 1,
0.4851604, 0.3835481, 1.837044, 1, 0, 0, 1, 1,
0.4881435, 0.2235362, 2.901523, 0, 0, 0, 1, 1,
0.4889615, -0.8965238, 1.972582, 0, 0, 0, 1, 1,
0.4920975, -3.300689, 2.680853, 0, 0, 0, 1, 1,
0.4935361, -0.4359282, 1.864237, 0, 0, 0, 1, 1,
0.4978541, 0.4040728, 2.036443, 0, 0, 0, 1, 1,
0.4982794, -1.688314, 2.341343, 0, 0, 0, 1, 1,
0.4983836, -0.08406752, 2.193984, 0, 0, 0, 1, 1,
0.5002151, 2.384589, -0.2852503, 1, 1, 1, 1, 1,
0.504845, 0.0774988, 2.64419, 1, 1, 1, 1, 1,
0.5059564, -0.4248915, 3.266838, 1, 1, 1, 1, 1,
0.5136717, -1.452704, 2.937954, 1, 1, 1, 1, 1,
0.5148745, -0.5026701, 0.8114716, 1, 1, 1, 1, 1,
0.518347, 0.3619306, 1.057761, 1, 1, 1, 1, 1,
0.520617, -0.6964587, 3.163945, 1, 1, 1, 1, 1,
0.5222623, -0.04125885, 1.551778, 1, 1, 1, 1, 1,
0.5237387, -1.08411, 4.433285, 1, 1, 1, 1, 1,
0.5245194, 0.7035697, 0.8855942, 1, 1, 1, 1, 1,
0.5271595, -0.7809716, 3.534933, 1, 1, 1, 1, 1,
0.5288274, 3.142977, -1.26129, 1, 1, 1, 1, 1,
0.5326448, -0.05415374, 1.091547, 1, 1, 1, 1, 1,
0.5326948, -2.001802, 3.124703, 1, 1, 1, 1, 1,
0.5350379, 1.021274, 0.3512477, 1, 1, 1, 1, 1,
0.5361779, -1.005791, 3.860514, 0, 0, 1, 1, 1,
0.5391951, -1.145042, 0.464836, 1, 0, 0, 1, 1,
0.5398253, -0.4265267, 2.993492, 1, 0, 0, 1, 1,
0.5437519, -0.3761585, 2.824419, 1, 0, 0, 1, 1,
0.5441127, 0.6027232, 1.587976, 1, 0, 0, 1, 1,
0.5462844, -1.112192, 1.548902, 1, 0, 0, 1, 1,
0.5474604, 0.5078465, -1.45029, 0, 0, 0, 1, 1,
0.5623285, -0.1139527, -0.2224905, 0, 0, 0, 1, 1,
0.569317, 0.368722, 0.623422, 0, 0, 0, 1, 1,
0.570855, 0.5080814, 1.092009, 0, 0, 0, 1, 1,
0.5708618, 1.033186, 1.396447, 0, 0, 0, 1, 1,
0.5729261, 0.6871176, 1.088599, 0, 0, 0, 1, 1,
0.5828496, -0.7215777, 1.642761, 0, 0, 0, 1, 1,
0.5853971, -0.00139682, 1.484683, 1, 1, 1, 1, 1,
0.5882692, -0.07897215, 2.974034, 1, 1, 1, 1, 1,
0.5900481, -0.7255453, 2.47426, 1, 1, 1, 1, 1,
0.5908622, -1.015699, 0.9004336, 1, 1, 1, 1, 1,
0.5927955, 0.5633224, 0.1487121, 1, 1, 1, 1, 1,
0.5933623, -0.4583863, 2.272977, 1, 1, 1, 1, 1,
0.5938438, 1.594406, 1.887619, 1, 1, 1, 1, 1,
0.5980423, -1.002113, 2.55393, 1, 1, 1, 1, 1,
0.6003812, -0.9073494, 3.459625, 1, 1, 1, 1, 1,
0.6010133, -0.8556072, 1.717443, 1, 1, 1, 1, 1,
0.6031762, -0.2366133, 3.610977, 1, 1, 1, 1, 1,
0.605592, 0.1120783, 0.6188995, 1, 1, 1, 1, 1,
0.6057041, -1.25788, 3.303174, 1, 1, 1, 1, 1,
0.6138875, 0.02496533, 1.828505, 1, 1, 1, 1, 1,
0.6219029, 0.8246996, 1.095299, 1, 1, 1, 1, 1,
0.6247194, 1.576248, 0.7766375, 0, 0, 1, 1, 1,
0.6247399, 1.237259, 1.230162, 1, 0, 0, 1, 1,
0.6256484, 1.014918, 0.5015288, 1, 0, 0, 1, 1,
0.6293802, -0.1837955, 2.937196, 1, 0, 0, 1, 1,
0.6357089, 0.847656, 1.716237, 1, 0, 0, 1, 1,
0.639993, 0.351224, 2.828518, 1, 0, 0, 1, 1,
0.64304, 0.198076, 1.799497, 0, 0, 0, 1, 1,
0.6431795, -1.152136, 4.196038, 0, 0, 0, 1, 1,
0.6557005, 1.881996, -0.1177247, 0, 0, 0, 1, 1,
0.6565609, -0.1155883, 1.87402, 0, 0, 0, 1, 1,
0.6583683, 1.638994, -0.5399821, 0, 0, 0, 1, 1,
0.6607241, -0.7075302, 2.567924, 0, 0, 0, 1, 1,
0.6619773, -1.589881, 1.656698, 0, 0, 0, 1, 1,
0.6627918, 0.7642337, 2.406837, 1, 1, 1, 1, 1,
0.6629522, 0.04035458, -0.04967027, 1, 1, 1, 1, 1,
0.6629895, -0.8844718, 3.512166, 1, 1, 1, 1, 1,
0.6664373, 0.2510943, 1.366268, 1, 1, 1, 1, 1,
0.6691728, 0.6485165, 1.146076, 1, 1, 1, 1, 1,
0.6694666, -0.7072182, 1.735344, 1, 1, 1, 1, 1,
0.6708043, 0.05469459, 1.480106, 1, 1, 1, 1, 1,
0.6711282, 0.3571853, -0.1581748, 1, 1, 1, 1, 1,
0.6720845, 0.2794843, -0.1246063, 1, 1, 1, 1, 1,
0.6736335, -1.053517, 3.95014, 1, 1, 1, 1, 1,
0.6826187, 0.3710661, -0.4326542, 1, 1, 1, 1, 1,
0.6832342, -0.8656554, 1.474782, 1, 1, 1, 1, 1,
0.6846639, 1.167262, 0.529615, 1, 1, 1, 1, 1,
0.6862835, -1.221827, 4.034604, 1, 1, 1, 1, 1,
0.6971807, 1.590438, 1.301663, 1, 1, 1, 1, 1,
0.6987582, 0.6140821, 1.53584, 0, 0, 1, 1, 1,
0.7016157, 0.07014302, 1.674262, 1, 0, 0, 1, 1,
0.7035111, 0.06874225, 3.407573, 1, 0, 0, 1, 1,
0.7050377, -0.3483789, -0.3109576, 1, 0, 0, 1, 1,
0.7064955, -2.6865, 4.489649, 1, 0, 0, 1, 1,
0.707271, -0.02354943, 1.967395, 1, 0, 0, 1, 1,
0.7077388, 0.5891671, 2.157576, 0, 0, 0, 1, 1,
0.7101594, 0.3961762, 0.8769416, 0, 0, 0, 1, 1,
0.7117352, 0.9992893, 0.7805404, 0, 0, 0, 1, 1,
0.712472, 1.115909, 0.9657479, 0, 0, 0, 1, 1,
0.7142848, 2.073764, 0.1729206, 0, 0, 0, 1, 1,
0.7168233, 0.2688661, 1.418752, 0, 0, 0, 1, 1,
0.7191725, 0.5441778, 1.10198, 0, 0, 0, 1, 1,
0.721118, -0.797616, 1.175301, 1, 1, 1, 1, 1,
0.7215548, -1.896709, 2.426877, 1, 1, 1, 1, 1,
0.7223654, -1.351294, 2.821607, 1, 1, 1, 1, 1,
0.7225075, -1.729107, 4.344878, 1, 1, 1, 1, 1,
0.7296795, -0.07624394, 3.124694, 1, 1, 1, 1, 1,
0.7306172, 0.07138298, 1.887342, 1, 1, 1, 1, 1,
0.7357852, 2.859879, 0.6026205, 1, 1, 1, 1, 1,
0.7362492, -0.1165587, 1.098331, 1, 1, 1, 1, 1,
0.7368799, -0.3392963, 4.147894, 1, 1, 1, 1, 1,
0.7472764, 0.560555, 0.5639272, 1, 1, 1, 1, 1,
0.7485044, 0.2665495, 1.636044, 1, 1, 1, 1, 1,
0.7548382, -0.4365624, 2.722672, 1, 1, 1, 1, 1,
0.755055, 2.638091, 1.204056, 1, 1, 1, 1, 1,
0.7582112, -0.1159831, 2.045993, 1, 1, 1, 1, 1,
0.759535, 0.1714059, 4.33743, 1, 1, 1, 1, 1,
0.7602872, -0.263654, 3.400516, 0, 0, 1, 1, 1,
0.7706633, 0.4834487, 1.041218, 1, 0, 0, 1, 1,
0.7710907, -0.1066987, 0.4470578, 1, 0, 0, 1, 1,
0.7722538, 0.8851529, 1.910619, 1, 0, 0, 1, 1,
0.7728266, 0.02941337, 3.392823, 1, 0, 0, 1, 1,
0.7754514, -0.611734, 0.4603181, 1, 0, 0, 1, 1,
0.7780877, 1.008277, -0.4019039, 0, 0, 0, 1, 1,
0.7948993, 0.6272089, -0.08414304, 0, 0, 0, 1, 1,
0.7949918, -1.312887, 2.961323, 0, 0, 0, 1, 1,
0.79544, 0.7045318, 0.5486515, 0, 0, 0, 1, 1,
0.7961192, 0.478429, 1.386232, 0, 0, 0, 1, 1,
0.8019232, 0.3677272, -0.3615233, 0, 0, 0, 1, 1,
0.802151, 0.9283969, 1.049313, 0, 0, 0, 1, 1,
0.8026928, -1.743743, 3.129627, 1, 1, 1, 1, 1,
0.8058295, 0.5015705, 1.427595, 1, 1, 1, 1, 1,
0.8138481, -0.9264453, 2.929189, 1, 1, 1, 1, 1,
0.8173378, 0.5977266, 0.1937909, 1, 1, 1, 1, 1,
0.8263974, -0.08034187, 1.706552, 1, 1, 1, 1, 1,
0.8329207, 0.005102804, 0.75238, 1, 1, 1, 1, 1,
0.8394414, 0.9611198, 0.07718378, 1, 1, 1, 1, 1,
0.8524342, 0.5586476, 0.6926969, 1, 1, 1, 1, 1,
0.8536767, -0.5035977, 0.4174613, 1, 1, 1, 1, 1,
0.8544164, 0.6742939, 2.939836, 1, 1, 1, 1, 1,
0.8567893, -0.06231672, 0.4800902, 1, 1, 1, 1, 1,
0.8585267, -0.2422478, -0.05396193, 1, 1, 1, 1, 1,
0.8610318, 0.1931496, 2.389983, 1, 1, 1, 1, 1,
0.8636271, 1.171812, -0.6939185, 1, 1, 1, 1, 1,
0.8672819, -1.181819, 2.118995, 1, 1, 1, 1, 1,
0.8708889, 1.167951, 1.229387, 0, 0, 1, 1, 1,
0.8741723, -0.004629488, 1.55149, 1, 0, 0, 1, 1,
0.8792396, 0.02683784, 0.5237443, 1, 0, 0, 1, 1,
0.883254, 0.4902284, 0.4219316, 1, 0, 0, 1, 1,
0.8870641, 0.6918511, 1.148613, 1, 0, 0, 1, 1,
0.888221, 0.9386293, 2.597435, 1, 0, 0, 1, 1,
0.8908787, 0.9437848, 2.041757, 0, 0, 0, 1, 1,
0.8939017, 0.8881773, 0.2629241, 0, 0, 0, 1, 1,
0.8978767, -0.7836364, 3.597847, 0, 0, 0, 1, 1,
0.9120086, 0.2885981, -0.3014279, 0, 0, 0, 1, 1,
0.9120107, -0.3680913, 3.832948, 0, 0, 0, 1, 1,
0.9140308, -1.003193, 3.071684, 0, 0, 0, 1, 1,
0.9215805, 2.110015, 1.522751, 0, 0, 0, 1, 1,
0.92173, 0.727845, 0.8641188, 1, 1, 1, 1, 1,
0.9258561, -0.8848493, 0.2060766, 1, 1, 1, 1, 1,
0.9327803, 1.145207, 0.9662817, 1, 1, 1, 1, 1,
0.9388832, 0.7423826, 1.011608, 1, 1, 1, 1, 1,
0.9402891, -0.9686751, 3.195943, 1, 1, 1, 1, 1,
0.9410022, 0.6965158, 0.7204782, 1, 1, 1, 1, 1,
0.9450848, 0.5156254, 1.615622, 1, 1, 1, 1, 1,
0.9453222, -0.6514435, 4.010881, 1, 1, 1, 1, 1,
0.9554074, 1.692271, 0.5145931, 1, 1, 1, 1, 1,
0.9564842, 0.8317189, 0.6816769, 1, 1, 1, 1, 1,
0.9586182, 0.4540986, 0.5745856, 1, 1, 1, 1, 1,
0.9594809, 0.6571472, -0.07263556, 1, 1, 1, 1, 1,
0.9598734, -0.5579719, 0.9490652, 1, 1, 1, 1, 1,
0.9650413, -0.5293995, 1.133393, 1, 1, 1, 1, 1,
0.9674886, -0.7293135, 2.099331, 1, 1, 1, 1, 1,
0.9768404, -0.8131325, 1.461717, 0, 0, 1, 1, 1,
0.9781293, 1.460272, 2.43126, 1, 0, 0, 1, 1,
0.9816886, 0.3341207, 1.13667, 1, 0, 0, 1, 1,
0.9874946, 1.235216, -0.186174, 1, 0, 0, 1, 1,
0.9897511, 0.6091818, 0.5841365, 1, 0, 0, 1, 1,
0.9907804, 0.9048327, 1.570526, 1, 0, 0, 1, 1,
0.9921116, 1.025721, 1.221447, 0, 0, 0, 1, 1,
0.9952944, -1.42416, 3.575744, 0, 0, 0, 1, 1,
0.9973397, 0.09123494, 2.342977, 0, 0, 0, 1, 1,
0.999357, 1.827402, 0.7375344, 0, 0, 0, 1, 1,
1.001463, -0.2978269, 3.235086, 0, 0, 0, 1, 1,
1.01057, -0.3996164, 1.957977, 0, 0, 0, 1, 1,
1.010774, 0.1570553, 0.7182232, 0, 0, 0, 1, 1,
1.015291, 0.6457871, 2.071138, 1, 1, 1, 1, 1,
1.016572, 0.6510877, 0.3254177, 1, 1, 1, 1, 1,
1.016891, 0.3283667, 1.228416, 1, 1, 1, 1, 1,
1.017415, 0.1236199, 2.847855, 1, 1, 1, 1, 1,
1.020379, -1.208842, 1.129452, 1, 1, 1, 1, 1,
1.034058, 0.816656, 1.532457, 1, 1, 1, 1, 1,
1.045034, 0.08569905, 0.01510176, 1, 1, 1, 1, 1,
1.045836, 1.261595, -0.2749892, 1, 1, 1, 1, 1,
1.047913, -0.0109991, 1.019327, 1, 1, 1, 1, 1,
1.054208, -0.5675306, 0.8129696, 1, 1, 1, 1, 1,
1.055598, 1.515634, 2.77405, 1, 1, 1, 1, 1,
1.060738, 1.852825, 0.06135387, 1, 1, 1, 1, 1,
1.069953, 2.742803, 0.551813, 1, 1, 1, 1, 1,
1.071048, 0.7667109, 0.1938724, 1, 1, 1, 1, 1,
1.077563, 0.730183, 1.74965, 1, 1, 1, 1, 1,
1.090292, 0.4933391, 0.8291051, 0, 0, 1, 1, 1,
1.092376, 0.09478026, 1.755141, 1, 0, 0, 1, 1,
1.093048, -0.1305046, 1.570649, 1, 0, 0, 1, 1,
1.096585, -0.9702904, 1.536061, 1, 0, 0, 1, 1,
1.0989, 0.4462137, 1.516954, 1, 0, 0, 1, 1,
1.099994, 0.4538037, 1.066079, 1, 0, 0, 1, 1,
1.102851, -0.2922496, 1.545343, 0, 0, 0, 1, 1,
1.115769, -1.603206, 3.918635, 0, 0, 0, 1, 1,
1.117306, 0.4630479, 0.5662684, 0, 0, 0, 1, 1,
1.124848, -0.5109448, 2.021615, 0, 0, 0, 1, 1,
1.126499, -1.24727, 0.821227, 0, 0, 0, 1, 1,
1.138176, -0.4354894, 1.466699, 0, 0, 0, 1, 1,
1.14064, -1.406971, 3.880697, 0, 0, 0, 1, 1,
1.15097, -0.2268357, 2.157029, 1, 1, 1, 1, 1,
1.151969, 0.393235, 1.993043, 1, 1, 1, 1, 1,
1.169018, -0.5156585, 2.347593, 1, 1, 1, 1, 1,
1.170358, 0.1015056, 2.413642, 1, 1, 1, 1, 1,
1.170588, 0.3779142, -0.088041, 1, 1, 1, 1, 1,
1.173847, 1.695983, 0.318372, 1, 1, 1, 1, 1,
1.17466, -0.1622747, 1.915993, 1, 1, 1, 1, 1,
1.186331, -1.29446, 3.453836, 1, 1, 1, 1, 1,
1.18667, -1.102933, 2.09741, 1, 1, 1, 1, 1,
1.188101, -0.9016813, 2.224276, 1, 1, 1, 1, 1,
1.193408, -0.6699896, 2.081926, 1, 1, 1, 1, 1,
1.201261, -0.1896069, 1.468494, 1, 1, 1, 1, 1,
1.206378, -0.6918368, -0.0628309, 1, 1, 1, 1, 1,
1.21471, 0.5987375, 1.228047, 1, 1, 1, 1, 1,
1.217174, 0.9814613, 1.156134, 1, 1, 1, 1, 1,
1.219508, 1.803502, 0.8467536, 0, 0, 1, 1, 1,
1.234649, 0.6736724, 1.602881, 1, 0, 0, 1, 1,
1.237602, -1.005592, 3.039956, 1, 0, 0, 1, 1,
1.23849, 1.018392, -0.6680268, 1, 0, 0, 1, 1,
1.241646, -0.5726328, 2.863442, 1, 0, 0, 1, 1,
1.248695, 0.189433, -0.1898833, 1, 0, 0, 1, 1,
1.257248, -1.092344, 2.227942, 0, 0, 0, 1, 1,
1.262956, 0.3341185, 0.009267601, 0, 0, 0, 1, 1,
1.265907, 0.567581, 0.6645504, 0, 0, 0, 1, 1,
1.27039, 1.664464, -0.3178668, 0, 0, 0, 1, 1,
1.278938, 0.4622456, 1.537499, 0, 0, 0, 1, 1,
1.290227, -0.3639417, 1.580816, 0, 0, 0, 1, 1,
1.292562, 0.2651959, 1.0304, 0, 0, 0, 1, 1,
1.295853, -1.947917, 3.862989, 1, 1, 1, 1, 1,
1.298694, -0.591033, 2.813874, 1, 1, 1, 1, 1,
1.310001, 0.953437, 1.928517, 1, 1, 1, 1, 1,
1.322452, 0.3723056, -1.52427, 1, 1, 1, 1, 1,
1.32296, -2.20542, 2.497759, 1, 1, 1, 1, 1,
1.32569, -0.9013547, 3.100685, 1, 1, 1, 1, 1,
1.334476, -1.11049, 3.294027, 1, 1, 1, 1, 1,
1.338189, -0.3827928, 1.945472, 1, 1, 1, 1, 1,
1.339175, -0.2292737, 1.973773, 1, 1, 1, 1, 1,
1.362133, 1.789858, 2.435403, 1, 1, 1, 1, 1,
1.378339, -0.5047369, 1.143226, 1, 1, 1, 1, 1,
1.38826, 0.273089, 0.3550472, 1, 1, 1, 1, 1,
1.411918, 0.3929133, 2.978133, 1, 1, 1, 1, 1,
1.412206, 0.9962199, 0.5712671, 1, 1, 1, 1, 1,
1.436963, -1.427649, 1.769683, 1, 1, 1, 1, 1,
1.439967, -0.9483698, 2.539374, 0, 0, 1, 1, 1,
1.448411, -1.002768, 1.849608, 1, 0, 0, 1, 1,
1.463154, 1.233093, 0.2767044, 1, 0, 0, 1, 1,
1.484296, -0.7656459, 1.800643, 1, 0, 0, 1, 1,
1.488931, -0.4952967, 0.6760015, 1, 0, 0, 1, 1,
1.490312, -0.07068842, 1.086634, 1, 0, 0, 1, 1,
1.490703, -0.1174449, 2.414168, 0, 0, 0, 1, 1,
1.497826, -0.3150278, 0.1030283, 0, 0, 0, 1, 1,
1.506849, 0.2610137, 1.735572, 0, 0, 0, 1, 1,
1.517827, -0.06335948, 2.304938, 0, 0, 0, 1, 1,
1.518525, 1.077798, -0.1021491, 0, 0, 0, 1, 1,
1.523484, -1.507434, 0.4483387, 0, 0, 0, 1, 1,
1.535707, 0.01826338, 3.119609, 0, 0, 0, 1, 1,
1.553264, 0.5064434, -0.1220136, 1, 1, 1, 1, 1,
1.559575, 0.4172787, 1.119869, 1, 1, 1, 1, 1,
1.569281, -0.6721948, 3.566675, 1, 1, 1, 1, 1,
1.58078, 0.09995957, 0.6313064, 1, 1, 1, 1, 1,
1.583213, 0.3461663, 0.4857871, 1, 1, 1, 1, 1,
1.584067, 0.2739969, 0.2142076, 1, 1, 1, 1, 1,
1.588787, -0.2256918, 0.7089521, 1, 1, 1, 1, 1,
1.59264, -0.9602572, 1.55297, 1, 1, 1, 1, 1,
1.599048, -1.222446, 2.459491, 1, 1, 1, 1, 1,
1.62594, -0.4643729, 1.74913, 1, 1, 1, 1, 1,
1.626405, 0.0678772, 1.917093, 1, 1, 1, 1, 1,
1.632935, -0.7890447, 1.56905, 1, 1, 1, 1, 1,
1.635715, 0.03824021, 0.7713456, 1, 1, 1, 1, 1,
1.656798, 0.6089743, 1.795172, 1, 1, 1, 1, 1,
1.692262, 0.2470686, 1.693415, 1, 1, 1, 1, 1,
1.704464, -0.4226637, 0.7213079, 0, 0, 1, 1, 1,
1.718496, -2.573516, 2.754416, 1, 0, 0, 1, 1,
1.759015, -0.1050635, 2.016994, 1, 0, 0, 1, 1,
1.77844, 0.8931141, 2.375203, 1, 0, 0, 1, 1,
1.790689, -0.8365144, 0.7736404, 1, 0, 0, 1, 1,
1.792012, -0.3685408, 2.379599, 1, 0, 0, 1, 1,
1.799527, 0.8973244, 2.998782, 0, 0, 0, 1, 1,
1.809726, 2.466146, -0.9526523, 0, 0, 0, 1, 1,
1.810405, 2.045565, 0.532483, 0, 0, 0, 1, 1,
1.813744, 0.6813508, 1.205991, 0, 0, 0, 1, 1,
1.819166, -0.1938404, 2.115744, 0, 0, 0, 1, 1,
1.830168, 1.34602, 1.962638, 0, 0, 0, 1, 1,
1.839267, -0.5625677, 1.001179, 0, 0, 0, 1, 1,
1.861248, 1.606125, -0.6847227, 1, 1, 1, 1, 1,
1.867771, 0.01146628, 1.266671, 1, 1, 1, 1, 1,
1.879796, 0.3306878, 0.4587584, 1, 1, 1, 1, 1,
1.887275, -1.185333, 0.8617032, 1, 1, 1, 1, 1,
1.889155, -0.3990792, 1.238166, 1, 1, 1, 1, 1,
1.908254, 1.659817, 2.221729, 1, 1, 1, 1, 1,
1.919576, 1.262747, 0.4705056, 1, 1, 1, 1, 1,
1.950567, -0.9419742, 2.071545, 1, 1, 1, 1, 1,
1.951302, -0.6099011, 3.697678, 1, 1, 1, 1, 1,
1.965469, -0.6455739, 3.661032, 1, 1, 1, 1, 1,
1.968035, 0.4828049, 1.065505, 1, 1, 1, 1, 1,
1.968875, -0.609244, 2.732401, 1, 1, 1, 1, 1,
1.996939, 0.1491391, 2.34902, 1, 1, 1, 1, 1,
1.998505, 0.415806, 2.695375, 1, 1, 1, 1, 1,
2.009123, 0.2912908, 0.5172853, 1, 1, 1, 1, 1,
2.011217, 0.03483683, 1.593804, 0, 0, 1, 1, 1,
2.011533, -1.625704, 1.565091, 1, 0, 0, 1, 1,
2.02123, -0.3710693, 2.608272, 1, 0, 0, 1, 1,
2.029333, 0.5632432, 1.504375, 1, 0, 0, 1, 1,
2.110507, -1.334681, 2.723636, 1, 0, 0, 1, 1,
2.167903, 1.141119, 0.1590377, 1, 0, 0, 1, 1,
2.195371, -0.6450693, 2.520572, 0, 0, 0, 1, 1,
2.220561, 0.07090794, 1.711011, 0, 0, 0, 1, 1,
2.237274, 2.291514, 0.6348501, 0, 0, 0, 1, 1,
2.282426, 1.393861, 0.7183419, 0, 0, 0, 1, 1,
2.309407, 1.085894, 2.140123, 0, 0, 0, 1, 1,
2.322861, -2.941406, 3.811473, 0, 0, 0, 1, 1,
2.331974, 0.05681366, 1.280653, 0, 0, 0, 1, 1,
2.407196, 0.1404916, 1.10853, 1, 1, 1, 1, 1,
2.478173, -0.2976003, 1.876738, 1, 1, 1, 1, 1,
2.610749, -0.3130094, 1.377441, 1, 1, 1, 1, 1,
2.681258, 1.029077, 0.2296315, 1, 1, 1, 1, 1,
2.715844, -0.09349068, 2.161946, 1, 1, 1, 1, 1,
3.084285, -0.6615622, 2.277507, 1, 1, 1, 1, 1,
3.178829, 0.3339137, -0.6168835, 1, 1, 1, 1, 1
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
var radius = 8.972869;
var distance = 31.51682;
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
mvMatrix.translate( -0.1781147, 0.07885599, -0.01840019 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.51682);
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
