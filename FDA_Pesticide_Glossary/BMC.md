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
-3.271898, 0.01428719, -0.8192993, 1, 0, 0, 1,
-2.888017, 1.067316, -1.202752, 1, 0.007843138, 0, 1,
-2.852536, 0.0912706, -2.810051, 1, 0.01176471, 0, 1,
-2.82565, -0.05662367, -1.896634, 1, 0.01960784, 0, 1,
-2.772671, 1.04643, -1.234342, 1, 0.02352941, 0, 1,
-2.681726, 0.3097449, -0.9536853, 1, 0.03137255, 0, 1,
-2.618094, -1.444599, -2.068234, 1, 0.03529412, 0, 1,
-2.504199, 0.1616795, -2.112463, 1, 0.04313726, 0, 1,
-2.476356, 1.022993, -0.5821278, 1, 0.04705882, 0, 1,
-2.470819, 0.4234113, -1.505258, 1, 0.05490196, 0, 1,
-2.330298, 0.6340191, -2.760787, 1, 0.05882353, 0, 1,
-2.318922, 0.9625074, -0.1211873, 1, 0.06666667, 0, 1,
-2.301275, 0.8493798, -0.02250097, 1, 0.07058824, 0, 1,
-2.294619, 2.141886, -0.9031338, 1, 0.07843138, 0, 1,
-2.270358, 0.06969247, -1.043193, 1, 0.08235294, 0, 1,
-2.242199, -0.9464163, -1.978073, 1, 0.09019608, 0, 1,
-2.239236, -0.18748, -4.026175, 1, 0.09411765, 0, 1,
-2.210393, -0.7417057, -1.457479, 1, 0.1019608, 0, 1,
-2.204807, -2.028807, -3.101269, 1, 0.1098039, 0, 1,
-2.203413, 0.9693007, -0.6164562, 1, 0.1137255, 0, 1,
-2.183841, 1.254975, -0.4900456, 1, 0.1215686, 0, 1,
-2.128108, 0.8809964, -1.36384, 1, 0.1254902, 0, 1,
-2.106674, -1.668299, -2.790131, 1, 0.1333333, 0, 1,
-2.076373, -0.003272166, -3.451213, 1, 0.1372549, 0, 1,
-2.073574, 0.5645431, -0.6551206, 1, 0.145098, 0, 1,
-2.006015, 0.4781576, -1.957401, 1, 0.1490196, 0, 1,
-2.005301, -0.4171441, -2.910844, 1, 0.1568628, 0, 1,
-1.986704, 0.9331285, -0.1896195, 1, 0.1607843, 0, 1,
-1.95127, 0.3929707, -1.248533, 1, 0.1686275, 0, 1,
-1.948139, -0.1571493, -1.824529, 1, 0.172549, 0, 1,
-1.944479, -0.4247605, -3.209142, 1, 0.1803922, 0, 1,
-1.912068, 0.5450836, -1.570741, 1, 0.1843137, 0, 1,
-1.897611, 1.059356, -0.3294651, 1, 0.1921569, 0, 1,
-1.889495, -0.1925111, -3.549695, 1, 0.1960784, 0, 1,
-1.876234, -0.3755124, -2.6143, 1, 0.2039216, 0, 1,
-1.864361, -0.2446487, -0.3651684, 1, 0.2117647, 0, 1,
-1.862601, -0.8346299, -3.286031, 1, 0.2156863, 0, 1,
-1.840531, -1.923883, -0.01479046, 1, 0.2235294, 0, 1,
-1.820932, -1.444291, -2.379687, 1, 0.227451, 0, 1,
-1.801998, 1.187624, -0.06262318, 1, 0.2352941, 0, 1,
-1.798353, -0.1789809, -4.637029, 1, 0.2392157, 0, 1,
-1.791089, 0.324586, 0.4554525, 1, 0.2470588, 0, 1,
-1.767726, 0.8425828, -3.319678, 1, 0.2509804, 0, 1,
-1.736135, 0.4119993, 0.1583727, 1, 0.2588235, 0, 1,
-1.73407, -0.02184392, -1.725292, 1, 0.2627451, 0, 1,
-1.728407, 2.155367, -0.8287817, 1, 0.2705882, 0, 1,
-1.714745, -2.51164, -1.142837, 1, 0.2745098, 0, 1,
-1.710481, 1.459666, -2.052879, 1, 0.282353, 0, 1,
-1.706406, -1.581897, -3.084796, 1, 0.2862745, 0, 1,
-1.701623, 1.725992, -2.812347, 1, 0.2941177, 0, 1,
-1.696126, -0.4894502, -0.4007848, 1, 0.3019608, 0, 1,
-1.686995, -1.696544, -3.229199, 1, 0.3058824, 0, 1,
-1.685845, 0.6580343, -0.6500245, 1, 0.3137255, 0, 1,
-1.684569, -0.2593835, -0.7524951, 1, 0.3176471, 0, 1,
-1.673143, -1.099999, -3.66764, 1, 0.3254902, 0, 1,
-1.671585, 0.7522904, -0.5816138, 1, 0.3294118, 0, 1,
-1.660006, 0.5521291, 0.04043074, 1, 0.3372549, 0, 1,
-1.652687, 1.147191, -1.148944, 1, 0.3411765, 0, 1,
-1.648505, 0.6829067, -1.426149, 1, 0.3490196, 0, 1,
-1.648445, 0.09053449, -2.031602, 1, 0.3529412, 0, 1,
-1.644189, -0.2466747, -1.963504, 1, 0.3607843, 0, 1,
-1.579452, -0.03908403, -1.932362, 1, 0.3647059, 0, 1,
-1.578056, -1.181808, -2.600409, 1, 0.372549, 0, 1,
-1.57002, -0.5560643, -1.613679, 1, 0.3764706, 0, 1,
-1.567817, 0.4355044, -2.326655, 1, 0.3843137, 0, 1,
-1.562637, 1.065448, -1.245565, 1, 0.3882353, 0, 1,
-1.553268, 1.074531, -1.671085, 1, 0.3960784, 0, 1,
-1.55286, 0.2132678, -1.950977, 1, 0.4039216, 0, 1,
-1.545415, 0.2726371, -1.091571, 1, 0.4078431, 0, 1,
-1.534763, 0.06643, -1.927546, 1, 0.4156863, 0, 1,
-1.528658, -0.5215326, -2.717991, 1, 0.4196078, 0, 1,
-1.521468, 1.222958, -1.12055, 1, 0.427451, 0, 1,
-1.51526, -0.2558046, -1.547225, 1, 0.4313726, 0, 1,
-1.511302, 0.2470476, -1.570757, 1, 0.4392157, 0, 1,
-1.501707, -1.159774, -2.82091, 1, 0.4431373, 0, 1,
-1.491692, -1.214585, -3.15798, 1, 0.4509804, 0, 1,
-1.490367, -0.6008636, -2.478527, 1, 0.454902, 0, 1,
-1.488945, 0.8870294, -2.065389, 1, 0.4627451, 0, 1,
-1.486349, -0.5756731, -3.510241, 1, 0.4666667, 0, 1,
-1.475005, 0.04060538, -2.72198, 1, 0.4745098, 0, 1,
-1.463543, -0.7152411, -3.436449, 1, 0.4784314, 0, 1,
-1.446553, -0.4502309, -0.4091803, 1, 0.4862745, 0, 1,
-1.443113, -1.163482, -3.79543, 1, 0.4901961, 0, 1,
-1.436933, -0.8542477, -2.358629, 1, 0.4980392, 0, 1,
-1.436568, 1.972201, -1.423762, 1, 0.5058824, 0, 1,
-1.43556, 0.02324614, -1.342427, 1, 0.509804, 0, 1,
-1.434513, -0.426711, -1.865397, 1, 0.5176471, 0, 1,
-1.429795, -0.3518831, -1.579808, 1, 0.5215687, 0, 1,
-1.410707, -1.331002, -1.507399, 1, 0.5294118, 0, 1,
-1.408402, 0.4843682, -2.569288, 1, 0.5333334, 0, 1,
-1.401821, -0.4981028, -1.239498, 1, 0.5411765, 0, 1,
-1.397278, 1.054965, -0.8346336, 1, 0.5450981, 0, 1,
-1.395482, -1.544593, -3.002881, 1, 0.5529412, 0, 1,
-1.392323, -1.210246, -3.252262, 1, 0.5568628, 0, 1,
-1.388766, -1.697901, -3.531997, 1, 0.5647059, 0, 1,
-1.38222, 0.6447512, -2.621042, 1, 0.5686275, 0, 1,
-1.379363, 1.204559, -1.838751, 1, 0.5764706, 0, 1,
-1.362899, 0.3832251, -1.484482, 1, 0.5803922, 0, 1,
-1.362626, 0.7556267, -1.525003, 1, 0.5882353, 0, 1,
-1.356902, 0.1874795, 0.2292684, 1, 0.5921569, 0, 1,
-1.355356, 1.932396, -1.09148, 1, 0.6, 0, 1,
-1.349849, 0.4693958, -0.6073276, 1, 0.6078432, 0, 1,
-1.345127, -1.281395, -3.193442, 1, 0.6117647, 0, 1,
-1.341706, -1.201373, -2.412917, 1, 0.6196079, 0, 1,
-1.333514, -0.4467795, -2.561609, 1, 0.6235294, 0, 1,
-1.327665, -2.028083, -1.179794, 1, 0.6313726, 0, 1,
-1.323128, -1.287553, -2.572066, 1, 0.6352941, 0, 1,
-1.322036, 0.05511625, -0.4721512, 1, 0.6431373, 0, 1,
-1.316808, -0.09382482, -0.9011718, 1, 0.6470588, 0, 1,
-1.310692, 0.03156857, -2.115484, 1, 0.654902, 0, 1,
-1.30543, 0.03389407, -1.855947, 1, 0.6588235, 0, 1,
-1.299641, 0.719348, -0.9332357, 1, 0.6666667, 0, 1,
-1.298882, -1.054418, -2.806723, 1, 0.6705883, 0, 1,
-1.297057, -2.336244, -2.001441, 1, 0.6784314, 0, 1,
-1.294701, 1.495621, -0.897797, 1, 0.682353, 0, 1,
-1.29302, 0.1937992, -0.8839526, 1, 0.6901961, 0, 1,
-1.290691, -0.7015094, -2.659018, 1, 0.6941177, 0, 1,
-1.284955, 0.3280963, -3.138162, 1, 0.7019608, 0, 1,
-1.282881, -1.781431, -1.721331, 1, 0.7098039, 0, 1,
-1.276071, -0.9360926, -2.031873, 1, 0.7137255, 0, 1,
-1.273433, 0.08443639, -2.729196, 1, 0.7215686, 0, 1,
-1.269228, 0.1816276, -0.5195914, 1, 0.7254902, 0, 1,
-1.268889, 1.110971, -0.08622233, 1, 0.7333333, 0, 1,
-1.261004, -0.9358355, -1.906565, 1, 0.7372549, 0, 1,
-1.25152, -0.05669063, -2.649925, 1, 0.7450981, 0, 1,
-1.248224, 1.098884, 0.2803065, 1, 0.7490196, 0, 1,
-1.23904, 0.1913899, -1.540017, 1, 0.7568628, 0, 1,
-1.237279, -0.3103394, -0.9578481, 1, 0.7607843, 0, 1,
-1.233107, -0.5409904, -2.193002, 1, 0.7686275, 0, 1,
-1.226282, -1.075685, -1.883761, 1, 0.772549, 0, 1,
-1.222821, -0.5796601, -2.531578, 1, 0.7803922, 0, 1,
-1.213325, 0.5993739, -0.5195999, 1, 0.7843137, 0, 1,
-1.206903, -0.4875173, -2.262063, 1, 0.7921569, 0, 1,
-1.206826, 0.1158696, -1.270856, 1, 0.7960784, 0, 1,
-1.201722, 0.04799147, -1.494426, 1, 0.8039216, 0, 1,
-1.199072, 0.07616176, -0.3624161, 1, 0.8117647, 0, 1,
-1.197997, 0.3310146, -2.702626, 1, 0.8156863, 0, 1,
-1.197711, -0.001239753, -1.400309, 1, 0.8235294, 0, 1,
-1.193251, 0.06765493, -2.684176, 1, 0.827451, 0, 1,
-1.186824, -0.4079772, -1.64709, 1, 0.8352941, 0, 1,
-1.183187, -0.01840663, -1.229677, 1, 0.8392157, 0, 1,
-1.179061, 1.741698, -1.374807, 1, 0.8470588, 0, 1,
-1.162924, -0.712404, -0.8298782, 1, 0.8509804, 0, 1,
-1.162145, 0.4086744, -0.468401, 1, 0.8588235, 0, 1,
-1.158909, 0.8706933, -0.1774336, 1, 0.8627451, 0, 1,
-1.156945, 2.588965, -1.420341, 1, 0.8705882, 0, 1,
-1.148632, -0.7456605, -1.563586, 1, 0.8745098, 0, 1,
-1.147762, 0.1039164, 0.8664633, 1, 0.8823529, 0, 1,
-1.138735, 2.234374, -0.5722651, 1, 0.8862745, 0, 1,
-1.132389, 0.6853275, -1.771977, 1, 0.8941177, 0, 1,
-1.13081, 0.006336692, -1.453515, 1, 0.8980392, 0, 1,
-1.130094, -0.6850068, -2.09281, 1, 0.9058824, 0, 1,
-1.127204, -0.1494036, -1.036554, 1, 0.9137255, 0, 1,
-1.102025, -1.144443, -1.735267, 1, 0.9176471, 0, 1,
-1.101581, -1.531294, -3.768547, 1, 0.9254902, 0, 1,
-1.089725, -1.255925, -0.3051034, 1, 0.9294118, 0, 1,
-1.085497, -0.777153, -2.385566, 1, 0.9372549, 0, 1,
-1.081891, -0.1570489, -1.679317, 1, 0.9411765, 0, 1,
-1.080306, 0.553857, -1.215458, 1, 0.9490196, 0, 1,
-1.079392, -0.166807, -1.287491, 1, 0.9529412, 0, 1,
-1.076834, 0.1579971, -0.7536999, 1, 0.9607843, 0, 1,
-1.073312, 1.772613, -0.666194, 1, 0.9647059, 0, 1,
-1.069128, -0.9353704, -0.9703531, 1, 0.972549, 0, 1,
-1.068934, -0.2125576, -2.370656, 1, 0.9764706, 0, 1,
-1.060359, -0.09197777, -0.3119647, 1, 0.9843137, 0, 1,
-1.054166, -0.8528082, -1.323971, 1, 0.9882353, 0, 1,
-1.050676, 0.8980058, -3.0405, 1, 0.9960784, 0, 1,
-1.046995, -0.3813811, -3.518739, 0.9960784, 1, 0, 1,
-1.041416, 1.151707, -0.1665391, 0.9921569, 1, 0, 1,
-1.039479, -0.2991548, -2.769619, 0.9843137, 1, 0, 1,
-1.037351, 0.3874795, -1.969378, 0.9803922, 1, 0, 1,
-1.032932, 0.5912593, -1.458832, 0.972549, 1, 0, 1,
-1.024745, 0.1707833, -0.9992013, 0.9686275, 1, 0, 1,
-1.022696, 0.2122755, -2.859106, 0.9607843, 1, 0, 1,
-1.022603, -0.5402788, -1.537885, 0.9568627, 1, 0, 1,
-1.020974, 0.2953655, -0.6576895, 0.9490196, 1, 0, 1,
-1.016787, -0.6567937, -1.891838, 0.945098, 1, 0, 1,
-1.007481, 0.6263172, 0.2307067, 0.9372549, 1, 0, 1,
-1.004595, 0.227138, -2.478903, 0.9333333, 1, 0, 1,
-1.003734, 1.397924, -0.111595, 0.9254902, 1, 0, 1,
-1.001767, -0.8332888, -3.046319, 0.9215686, 1, 0, 1,
-0.9892737, 0.925729, -0.9418639, 0.9137255, 1, 0, 1,
-0.9872811, -0.1213285, -2.252918, 0.9098039, 1, 0, 1,
-0.9854742, -1.038619, -1.209916, 0.9019608, 1, 0, 1,
-0.9812012, -0.1869967, -0.2244296, 0.8941177, 1, 0, 1,
-0.9668159, 0.0993195, -1.349731, 0.8901961, 1, 0, 1,
-0.9631014, 1.997414, -1.149773, 0.8823529, 1, 0, 1,
-0.9628462, -0.04982544, -2.157882, 0.8784314, 1, 0, 1,
-0.9602863, -0.08865401, -2.094615, 0.8705882, 1, 0, 1,
-0.9593635, 0.5426307, -2.417297, 0.8666667, 1, 0, 1,
-0.9576791, -0.09205547, -1.657091, 0.8588235, 1, 0, 1,
-0.9554483, -1.159029, -3.975132, 0.854902, 1, 0, 1,
-0.9455436, -0.6763461, -1.711228, 0.8470588, 1, 0, 1,
-0.9430866, -0.07134106, -2.608679, 0.8431373, 1, 0, 1,
-0.9414889, 0.9654146, -1.124885, 0.8352941, 1, 0, 1,
-0.9407487, 1.901603, -0.1141842, 0.8313726, 1, 0, 1,
-0.9365895, 0.005467849, -0.4761725, 0.8235294, 1, 0, 1,
-0.9316736, 1.52376, -0.9433185, 0.8196079, 1, 0, 1,
-0.9274544, -1.891022, -4.115747, 0.8117647, 1, 0, 1,
-0.9265745, -1.554735, -2.7711, 0.8078431, 1, 0, 1,
-0.9181797, 1.016529, -0.6176938, 0.8, 1, 0, 1,
-0.9110681, -0.93616, -2.154615, 0.7921569, 1, 0, 1,
-0.908904, 0.9835352, -1.287443, 0.7882353, 1, 0, 1,
-0.9068455, -0.3378729, -0.741158, 0.7803922, 1, 0, 1,
-0.8905668, -0.1646213, -0.6351166, 0.7764706, 1, 0, 1,
-0.8905342, -0.194346, -1.165896, 0.7686275, 1, 0, 1,
-0.8884766, -1.060355, -2.355935, 0.7647059, 1, 0, 1,
-0.88612, 1.515353, 0.09990141, 0.7568628, 1, 0, 1,
-0.8804178, -0.901363, -1.357944, 0.7529412, 1, 0, 1,
-0.8701357, -0.5967124, -1.876284, 0.7450981, 1, 0, 1,
-0.8691408, -1.325228, -1.98546, 0.7411765, 1, 0, 1,
-0.8671943, -0.5193453, -3.574958, 0.7333333, 1, 0, 1,
-0.8623354, -0.02230008, 0.7108175, 0.7294118, 1, 0, 1,
-0.8601035, 0.4887783, -0.7863711, 0.7215686, 1, 0, 1,
-0.8589628, -0.3333517, -2.55042, 0.7176471, 1, 0, 1,
-0.8585131, -0.7732092, -1.959576, 0.7098039, 1, 0, 1,
-0.8577584, 1.358832, 0.7054651, 0.7058824, 1, 0, 1,
-0.8570191, 0.6833017, -1.210064, 0.6980392, 1, 0, 1,
-0.8476217, 0.577651, -2.342287, 0.6901961, 1, 0, 1,
-0.842375, 0.5243627, -2.025596, 0.6862745, 1, 0, 1,
-0.8414849, -0.9694746, -2.617929, 0.6784314, 1, 0, 1,
-0.8401207, -0.7279626, -2.667672, 0.6745098, 1, 0, 1,
-0.8368031, 1.90998, -1.142702, 0.6666667, 1, 0, 1,
-0.8354862, -1.101125, -2.572483, 0.6627451, 1, 0, 1,
-0.8332412, 1.451667, -2.12131, 0.654902, 1, 0, 1,
-0.83131, 0.4032862, -2.070136, 0.6509804, 1, 0, 1,
-0.822228, 0.06840771, 0.6969252, 0.6431373, 1, 0, 1,
-0.8202592, 0.2815509, -2.027454, 0.6392157, 1, 0, 1,
-0.818469, -0.452649, -2.523519, 0.6313726, 1, 0, 1,
-0.8137385, -0.7867743, -1.882149, 0.627451, 1, 0, 1,
-0.8053768, 0.5615712, -0.8398202, 0.6196079, 1, 0, 1,
-0.7907799, 0.4774355, -2.833557, 0.6156863, 1, 0, 1,
-0.7891058, -1.545618, -3.207309, 0.6078432, 1, 0, 1,
-0.7877627, 1.221181, -3.368201, 0.6039216, 1, 0, 1,
-0.7869365, 1.259564, -0.9680446, 0.5960785, 1, 0, 1,
-0.7846783, -0.9300092, -2.910295, 0.5882353, 1, 0, 1,
-0.7845603, 1.314225, -3.517987, 0.5843138, 1, 0, 1,
-0.7844971, -0.8174566, -3.02494, 0.5764706, 1, 0, 1,
-0.7829831, -0.7034343, -1.704693, 0.572549, 1, 0, 1,
-0.7812628, 0.2446438, -0.06434701, 0.5647059, 1, 0, 1,
-0.7739201, 1.116752, -1.293989, 0.5607843, 1, 0, 1,
-0.7735403, 0.5967291, -0.6201115, 0.5529412, 1, 0, 1,
-0.7718145, -0.2372759, -2.360479, 0.5490196, 1, 0, 1,
-0.7696146, 0.3247411, -0.2303942, 0.5411765, 1, 0, 1,
-0.7642605, -0.623574, -4.442735, 0.5372549, 1, 0, 1,
-0.7583637, 1.512434, -1.762309, 0.5294118, 1, 0, 1,
-0.7447228, 0.07509192, -0.9331728, 0.5254902, 1, 0, 1,
-0.7407855, -1.228668, -2.94214, 0.5176471, 1, 0, 1,
-0.7373749, 1.911426, -1.267444, 0.5137255, 1, 0, 1,
-0.7356111, 0.2154075, -2.519149, 0.5058824, 1, 0, 1,
-0.7348371, 0.3440882, -0.1042333, 0.5019608, 1, 0, 1,
-0.7333181, 0.4248505, -2.144968, 0.4941176, 1, 0, 1,
-0.7201445, 0.7904934, -0.3713629, 0.4862745, 1, 0, 1,
-0.716659, 0.2683375, -1.525309, 0.4823529, 1, 0, 1,
-0.7092695, 1.533005, -0.5966153, 0.4745098, 1, 0, 1,
-0.7052853, 0.05322846, -2.82714, 0.4705882, 1, 0, 1,
-0.703934, -0.2559826, -3.951111, 0.4627451, 1, 0, 1,
-0.7013113, -0.1649636, -1.623554, 0.4588235, 1, 0, 1,
-0.6994847, 1.122652, -0.6649798, 0.4509804, 1, 0, 1,
-0.6985047, -0.5322009, -4.71945, 0.4470588, 1, 0, 1,
-0.6966622, 0.2712712, -2.136022, 0.4392157, 1, 0, 1,
-0.6947643, -0.1756574, -2.423659, 0.4352941, 1, 0, 1,
-0.6919104, -1.10726, -2.125132, 0.427451, 1, 0, 1,
-0.683234, -0.9253696, -2.960023, 0.4235294, 1, 0, 1,
-0.6808839, 0.8527076, -1.009528, 0.4156863, 1, 0, 1,
-0.679524, -1.871352, -2.162633, 0.4117647, 1, 0, 1,
-0.6776221, 1.223346, -0.4637829, 0.4039216, 1, 0, 1,
-0.6711683, -1.302094, -4.37076, 0.3960784, 1, 0, 1,
-0.670988, -0.6762431, -2.095615, 0.3921569, 1, 0, 1,
-0.6693028, 0.03023849, -1.258123, 0.3843137, 1, 0, 1,
-0.6669231, -1.49211, -2.335636, 0.3803922, 1, 0, 1,
-0.664962, 1.01063, -0.4506527, 0.372549, 1, 0, 1,
-0.6614965, 0.007145666, -2.20585, 0.3686275, 1, 0, 1,
-0.6578996, 1.337739, -1.485347, 0.3607843, 1, 0, 1,
-0.6540443, 0.2488661, -2.685698, 0.3568628, 1, 0, 1,
-0.6539748, -0.5294349, -2.99, 0.3490196, 1, 0, 1,
-0.6518233, 1.176329, -0.9753745, 0.345098, 1, 0, 1,
-0.6507531, -1.642537, -3.463272, 0.3372549, 1, 0, 1,
-0.6485165, -0.3850852, -2.406435, 0.3333333, 1, 0, 1,
-0.6476693, -0.2038205, -2.949082, 0.3254902, 1, 0, 1,
-0.6436431, 0.05259767, 0.1707304, 0.3215686, 1, 0, 1,
-0.6424994, 0.685454, -1.422979, 0.3137255, 1, 0, 1,
-0.6424979, 0.8328734, -1.494295, 0.3098039, 1, 0, 1,
-0.6421295, 0.1935058, -1.079999, 0.3019608, 1, 0, 1,
-0.6407939, 0.4769363, -2.113538, 0.2941177, 1, 0, 1,
-0.638175, 1.334548, -0.2857132, 0.2901961, 1, 0, 1,
-0.6323314, -1.446592, -3.76109, 0.282353, 1, 0, 1,
-0.6266571, 0.2336322, -1.116965, 0.2784314, 1, 0, 1,
-0.6165873, 0.8188231, 0.08595201, 0.2705882, 1, 0, 1,
-0.6154117, 0.457488, -1.104176, 0.2666667, 1, 0, 1,
-0.6133446, 0.0363773, -0.7403468, 0.2588235, 1, 0, 1,
-0.6076601, 1.697798, -0.9708228, 0.254902, 1, 0, 1,
-0.6023348, 1.755626, 1.32912, 0.2470588, 1, 0, 1,
-0.5941339, 0.1262912, -0.8466225, 0.2431373, 1, 0, 1,
-0.5907536, -0.7308433, -4.000013, 0.2352941, 1, 0, 1,
-0.5889653, 1.996936, -1.028356, 0.2313726, 1, 0, 1,
-0.587358, -0.6104617, -1.740366, 0.2235294, 1, 0, 1,
-0.5828493, 0.9381365, -1.351097, 0.2196078, 1, 0, 1,
-0.5805341, 2.371436, 0.5274063, 0.2117647, 1, 0, 1,
-0.5764617, 2.046301, -0.8183743, 0.2078431, 1, 0, 1,
-0.5730002, 1.413874, -0.7899259, 0.2, 1, 0, 1,
-0.5724908, 0.2939303, -2.304034, 0.1921569, 1, 0, 1,
-0.5698987, 0.4751401, 0.404573, 0.1882353, 1, 0, 1,
-0.5687689, 1.838091, 0.1180955, 0.1803922, 1, 0, 1,
-0.5650845, -0.3934726, -3.615078, 0.1764706, 1, 0, 1,
-0.5633146, 1.144742, -0.3929138, 0.1686275, 1, 0, 1,
-0.5603278, -0.03214055, -0.9633201, 0.1647059, 1, 0, 1,
-0.5578482, 0.7720585, -0.8724421, 0.1568628, 1, 0, 1,
-0.5578241, 1.082781, 1.33305, 0.1529412, 1, 0, 1,
-0.5571539, -1.536362, -1.112456, 0.145098, 1, 0, 1,
-0.5530336, 0.538874, -1.716859, 0.1411765, 1, 0, 1,
-0.5523388, -0.972506, -2.01614, 0.1333333, 1, 0, 1,
-0.5513226, -0.1713087, -0.5827388, 0.1294118, 1, 0, 1,
-0.5503712, 0.2348802, 0.2385166, 0.1215686, 1, 0, 1,
-0.5486628, 0.4668691, 1.32923, 0.1176471, 1, 0, 1,
-0.5450078, 0.4308721, -0.8498427, 0.1098039, 1, 0, 1,
-0.5442472, -1.877569, -4.1506, 0.1058824, 1, 0, 1,
-0.5433147, 2.199935, -0.2603772, 0.09803922, 1, 0, 1,
-0.5427852, 0.3292432, -2.007046, 0.09019608, 1, 0, 1,
-0.5412958, -0.7486079, -2.68459, 0.08627451, 1, 0, 1,
-0.5388499, -0.07176948, -2.262163, 0.07843138, 1, 0, 1,
-0.5362018, -1.765976, -4.180309, 0.07450981, 1, 0, 1,
-0.5312138, -0.6842365, -3.69961, 0.06666667, 1, 0, 1,
-0.5245094, 0.2870473, -2.841676, 0.0627451, 1, 0, 1,
-0.522751, -0.5287349, -2.64197, 0.05490196, 1, 0, 1,
-0.5226799, -0.4073127, -3.36702, 0.05098039, 1, 0, 1,
-0.5209712, 0.5225754, -1.102832, 0.04313726, 1, 0, 1,
-0.520161, 0.07062501, -1.281197, 0.03921569, 1, 0, 1,
-0.519644, -1.256521, -2.652426, 0.03137255, 1, 0, 1,
-0.5193685, -0.3109288, -2.225627, 0.02745098, 1, 0, 1,
-0.5180791, 0.8910309, 0.09976859, 0.01960784, 1, 0, 1,
-0.5142682, -0.7692422, -0.6720151, 0.01568628, 1, 0, 1,
-0.5111178, -0.1861053, -3.284137, 0.007843138, 1, 0, 1,
-0.5032856, -2.139925, -1.5791, 0.003921569, 1, 0, 1,
-0.5021497, -0.6772721, -2.15862, 0, 1, 0.003921569, 1,
-0.4993375, -0.4161366, -1.394444, 0, 1, 0.01176471, 1,
-0.4992347, 2.734738, -0.5731118, 0, 1, 0.01568628, 1,
-0.4915604, -0.3975059, -1.33594, 0, 1, 0.02352941, 1,
-0.4891713, -0.784144, -2.385324, 0, 1, 0.02745098, 1,
-0.4882903, -0.167438, -3.00672, 0, 1, 0.03529412, 1,
-0.4815466, 0.7838606, -1.151732, 0, 1, 0.03921569, 1,
-0.4806204, 0.5426962, -0.06741237, 0, 1, 0.04705882, 1,
-0.4771267, -1.736709, -0.9669384, 0, 1, 0.05098039, 1,
-0.4517853, -1.376273, -3.243705, 0, 1, 0.05882353, 1,
-0.4507323, -0.5818252, -3.050818, 0, 1, 0.0627451, 1,
-0.4495719, -0.9502504, -3.726836, 0, 1, 0.07058824, 1,
-0.4442739, 1.558864, -2.55614, 0, 1, 0.07450981, 1,
-0.4440168, -1.127548, -1.757922, 0, 1, 0.08235294, 1,
-0.441338, -0.6600066, -4.297302, 0, 1, 0.08627451, 1,
-0.4271933, -0.2297029, -2.762428, 0, 1, 0.09411765, 1,
-0.4252811, -0.3084225, -4.039933, 0, 1, 0.1019608, 1,
-0.4241055, -1.334195, -3.460544, 0, 1, 0.1058824, 1,
-0.4239359, 0.3576666, 0.6702954, 0, 1, 0.1137255, 1,
-0.4237774, -1.818805, -3.037183, 0, 1, 0.1176471, 1,
-0.4199297, -2.140699, -2.901932, 0, 1, 0.1254902, 1,
-0.418997, 1.139861, 0.4658079, 0, 1, 0.1294118, 1,
-0.418465, 0.1167747, -0.826858, 0, 1, 0.1372549, 1,
-0.4184447, 0.857488, -2.005626, 0, 1, 0.1411765, 1,
-0.4170833, 2.245496, -0.1596417, 0, 1, 0.1490196, 1,
-0.4168518, -1.065141, -4.236452, 0, 1, 0.1529412, 1,
-0.4156154, 0.09748815, -1.881101, 0, 1, 0.1607843, 1,
-0.4142214, -0.4918145, -3.647677, 0, 1, 0.1647059, 1,
-0.4117719, -1.780161, -2.565191, 0, 1, 0.172549, 1,
-0.4089843, -2.194799, -1.38045, 0, 1, 0.1764706, 1,
-0.4087291, -0.03270093, -0.3446682, 0, 1, 0.1843137, 1,
-0.4056506, 0.1740218, -1.218065, 0, 1, 0.1882353, 1,
-0.4011604, -0.04856345, -1.692981, 0, 1, 0.1960784, 1,
-0.3936167, -0.1379434, -1.676748, 0, 1, 0.2039216, 1,
-0.3833781, 0.01306369, -0.2650961, 0, 1, 0.2078431, 1,
-0.3819774, -2.023468, -3.793979, 0, 1, 0.2156863, 1,
-0.3788288, 0.4873717, 0.9375716, 0, 1, 0.2196078, 1,
-0.377771, 0.1150262, -2.579612, 0, 1, 0.227451, 1,
-0.3760857, -0.400068, -1.791409, 0, 1, 0.2313726, 1,
-0.376039, -1.299155, -3.557046, 0, 1, 0.2392157, 1,
-0.3757965, -1.992621, -2.968291, 0, 1, 0.2431373, 1,
-0.3746776, -0.8571095, -2.540737, 0, 1, 0.2509804, 1,
-0.3697082, -1.022679, -3.127986, 0, 1, 0.254902, 1,
-0.3668097, -0.9550346, -2.153205, 0, 1, 0.2627451, 1,
-0.3619407, 0.8498569, 0.05174034, 0, 1, 0.2666667, 1,
-0.3545109, -1.204919, -4.398655, 0, 1, 0.2745098, 1,
-0.3538315, 0.7598733, -0.6370385, 0, 1, 0.2784314, 1,
-0.3537949, -0.2794994, -1.086899, 0, 1, 0.2862745, 1,
-0.3485055, 0.08366443, -2.660932, 0, 1, 0.2901961, 1,
-0.3461963, -0.02233153, -2.835643, 0, 1, 0.2980392, 1,
-0.3443373, -1.362983, -3.032693, 0, 1, 0.3058824, 1,
-0.3392935, 1.132912, 0.3863912, 0, 1, 0.3098039, 1,
-0.3372177, 1.084728, 0.2557924, 0, 1, 0.3176471, 1,
-0.3362146, -0.7434825, -1.196585, 0, 1, 0.3215686, 1,
-0.3329776, -0.8642401, -2.129541, 0, 1, 0.3294118, 1,
-0.3286462, -0.06192428, -2.054777, 0, 1, 0.3333333, 1,
-0.3279281, -1.734522, -3.40704, 0, 1, 0.3411765, 1,
-0.323239, 0.8779092, -0.3197978, 0, 1, 0.345098, 1,
-0.3219922, -1.883354, -3.397344, 0, 1, 0.3529412, 1,
-0.3100855, 0.2076049, -0.4495154, 0, 1, 0.3568628, 1,
-0.3060176, -1.340912, -1.764636, 0, 1, 0.3647059, 1,
-0.3058942, -0.8627655, -2.186005, 0, 1, 0.3686275, 1,
-0.3002952, -0.6871303, -1.458006, 0, 1, 0.3764706, 1,
-0.3002941, 0.8208795, 0.98689, 0, 1, 0.3803922, 1,
-0.30029, 0.2603045, -2.295398, 0, 1, 0.3882353, 1,
-0.2959999, 0.6001906, -0.2983687, 0, 1, 0.3921569, 1,
-0.2937162, -0.5355211, -2.002649, 0, 1, 0.4, 1,
-0.2932108, -0.5198601, -2.075774, 0, 1, 0.4078431, 1,
-0.2881849, -0.199448, -2.399412, 0, 1, 0.4117647, 1,
-0.2864981, 0.2338993, -0.3163961, 0, 1, 0.4196078, 1,
-0.2834397, 1.529438, -0.6486205, 0, 1, 0.4235294, 1,
-0.2826686, 1.589412, -1.76691, 0, 1, 0.4313726, 1,
-0.2804437, -1.594247, -4.871084, 0, 1, 0.4352941, 1,
-0.2788005, -0.8345977, -3.567929, 0, 1, 0.4431373, 1,
-0.2738653, -0.2388869, -0.6633582, 0, 1, 0.4470588, 1,
-0.2727484, -0.981517, -3.116165, 0, 1, 0.454902, 1,
-0.270694, 2.176727, -0.3545269, 0, 1, 0.4588235, 1,
-0.2696237, 0.9598659, 0.1893718, 0, 1, 0.4666667, 1,
-0.2694349, 0.9076979, -0.8992987, 0, 1, 0.4705882, 1,
-0.2658571, 0.2901744, -1.391773, 0, 1, 0.4784314, 1,
-0.2613766, 0.7268302, -0.2491165, 0, 1, 0.4823529, 1,
-0.2587616, 0.7390559, -1.051725, 0, 1, 0.4901961, 1,
-0.2545778, 1.054978, -0.06744342, 0, 1, 0.4941176, 1,
-0.2515295, 0.7776583, -0.9238338, 0, 1, 0.5019608, 1,
-0.2514521, 0.6280413, -1.918065, 0, 1, 0.509804, 1,
-0.2462208, 0.2509272, 0.1096773, 0, 1, 0.5137255, 1,
-0.2445786, -1.301874, -2.677317, 0, 1, 0.5215687, 1,
-0.243857, 0.01257814, -2.212276, 0, 1, 0.5254902, 1,
-0.2407837, -2.390462, -4.235913, 0, 1, 0.5333334, 1,
-0.2391952, 0.7292088, 0.6634874, 0, 1, 0.5372549, 1,
-0.237832, 0.3465261, -0.3824766, 0, 1, 0.5450981, 1,
-0.2377634, -1.629541, -3.371842, 0, 1, 0.5490196, 1,
-0.2359015, -0.8493324, -1.404733, 0, 1, 0.5568628, 1,
-0.2337217, -0.5768352, -2.655911, 0, 1, 0.5607843, 1,
-0.2302201, 1.668222, -0.6684316, 0, 1, 0.5686275, 1,
-0.2275977, -0.7243987, -5.692634, 0, 1, 0.572549, 1,
-0.2275198, 0.03230765, -2.212665, 0, 1, 0.5803922, 1,
-0.2275008, 1.108702, 1.931378, 0, 1, 0.5843138, 1,
-0.2200736, -0.0472406, -1.44259, 0, 1, 0.5921569, 1,
-0.2189008, -0.4389219, -2.371701, 0, 1, 0.5960785, 1,
-0.2158705, -0.5908151, -1.482358, 0, 1, 0.6039216, 1,
-0.2152563, -0.2677507, -1.796029, 0, 1, 0.6117647, 1,
-0.2087931, -2.050697, -1.002225, 0, 1, 0.6156863, 1,
-0.2064628, -1.723553, -1.855206, 0, 1, 0.6235294, 1,
-0.2052511, -0.8875748, -4.002865, 0, 1, 0.627451, 1,
-0.2040201, -1.081814, -2.827816, 0, 1, 0.6352941, 1,
-0.1977654, 0.08178605, 0.10817, 0, 1, 0.6392157, 1,
-0.1974543, -0.2172554, -3.309591, 0, 1, 0.6470588, 1,
-0.1967085, 0.09099389, -0.9146035, 0, 1, 0.6509804, 1,
-0.1819959, -1.28006, -2.983662, 0, 1, 0.6588235, 1,
-0.1819394, 1.898534, 0.6505476, 0, 1, 0.6627451, 1,
-0.1815501, -1.704862, -2.698619, 0, 1, 0.6705883, 1,
-0.1644963, -0.7330009, -0.8590916, 0, 1, 0.6745098, 1,
-0.1623108, -0.7951331, -2.0151, 0, 1, 0.682353, 1,
-0.161352, 0.5849299, -0.2450246, 0, 1, 0.6862745, 1,
-0.1605207, 1.473348, -2.135794, 0, 1, 0.6941177, 1,
-0.1600462, 0.3636942, -0.3526334, 0, 1, 0.7019608, 1,
-0.1568174, -0.7741414, -1.547634, 0, 1, 0.7058824, 1,
-0.1517003, -0.1016598, -0.4596795, 0, 1, 0.7137255, 1,
-0.1473168, 0.4807017, 1.031631, 0, 1, 0.7176471, 1,
-0.1471354, 1.077072, -0.02766329, 0, 1, 0.7254902, 1,
-0.1425637, 0.23563, -0.8158641, 0, 1, 0.7294118, 1,
-0.1423901, -0.8437932, -2.501038, 0, 1, 0.7372549, 1,
-0.1410476, 0.5835628, -0.2706421, 0, 1, 0.7411765, 1,
-0.140733, -1.389041, -4.86403, 0, 1, 0.7490196, 1,
-0.1381472, -0.3166586, -2.24768, 0, 1, 0.7529412, 1,
-0.1365301, 1.955649, 0.07015291, 0, 1, 0.7607843, 1,
-0.1290211, -0.03827511, -1.769215, 0, 1, 0.7647059, 1,
-0.1258851, -0.1619267, -2.56012, 0, 1, 0.772549, 1,
-0.1239334, 0.2116551, -2.152841, 0, 1, 0.7764706, 1,
-0.122983, -1.365809, -2.080998, 0, 1, 0.7843137, 1,
-0.1205075, -1.739917, -4.109972, 0, 1, 0.7882353, 1,
-0.1191537, 0.4399519, 0.5410582, 0, 1, 0.7960784, 1,
-0.1105365, 1.146265, -0.5121877, 0, 1, 0.8039216, 1,
-0.1105317, 0.6566776, -1.733046, 0, 1, 0.8078431, 1,
-0.105535, 2.920104, 1.941203, 0, 1, 0.8156863, 1,
-0.105136, 0.5561627, -0.5628169, 0, 1, 0.8196079, 1,
-0.1049266, -0.5849323, -4.613584, 0, 1, 0.827451, 1,
-0.1049157, 1.352168, -2.439774, 0, 1, 0.8313726, 1,
-0.1042875, 0.3421573, 0.5151222, 0, 1, 0.8392157, 1,
-0.09694741, 0.8326825, -0.04271109, 0, 1, 0.8431373, 1,
-0.09658891, -1.249904, -1.602887, 0, 1, 0.8509804, 1,
-0.09144315, 0.3503209, 0.08547735, 0, 1, 0.854902, 1,
-0.09032639, -0.1165456, -1.88538, 0, 1, 0.8627451, 1,
-0.08142105, -0.4752053, -2.318868, 0, 1, 0.8666667, 1,
-0.08095216, 1.526021, -0.3718182, 0, 1, 0.8745098, 1,
-0.07877806, -0.9792425, -3.949251, 0, 1, 0.8784314, 1,
-0.07798672, 1.559338, 0.9434378, 0, 1, 0.8862745, 1,
-0.07359304, 1.702532, 0.2375105, 0, 1, 0.8901961, 1,
-0.0668858, 0.3618395, 0.3263189, 0, 1, 0.8980392, 1,
-0.06464367, -1.069255, -2.476396, 0, 1, 0.9058824, 1,
-0.06096413, 2.31231, -0.8950394, 0, 1, 0.9098039, 1,
-0.06001862, 1.516224, 1.001884, 0, 1, 0.9176471, 1,
-0.05395643, -0.8946137, -1.918527, 0, 1, 0.9215686, 1,
-0.04334182, 1.703775, -1.328061, 0, 1, 0.9294118, 1,
-0.03736237, 0.8619412, -1.258315, 0, 1, 0.9333333, 1,
-0.03722572, 1.457391, 2.184375, 0, 1, 0.9411765, 1,
-0.03459189, 0.2376125, -0.06200665, 0, 1, 0.945098, 1,
-0.03412282, 0.6313379, -1.074202, 0, 1, 0.9529412, 1,
-0.01897515, -0.8392304, -4.725167, 0, 1, 0.9568627, 1,
-0.01358863, 1.286902, -0.1810033, 0, 1, 0.9647059, 1,
-0.01302066, -0.4250547, -4.244919, 0, 1, 0.9686275, 1,
-0.01300828, 0.6495235, 0.8844759, 0, 1, 0.9764706, 1,
-0.01213214, 0.04742675, -0.4111407, 0, 1, 0.9803922, 1,
-0.005297837, -0.578465, -2.998005, 0, 1, 0.9882353, 1,
-0.003713051, -0.7728073, -3.065119, 0, 1, 0.9921569, 1,
-0.001582626, 0.7852322, -0.8759197, 0, 1, 1, 1,
0.004594588, -0.4759511, 4.113867, 0, 0.9921569, 1, 1,
0.007439482, 0.7940924, -0.2350301, 0, 0.9882353, 1, 1,
0.009693009, -0.999772, 2.100819, 0, 0.9803922, 1, 1,
0.01438338, -0.07518963, 4.233438, 0, 0.9764706, 1, 1,
0.01487636, 0.454109, -2.045411, 0, 0.9686275, 1, 1,
0.01645209, 0.01996446, 1.209628, 0, 0.9647059, 1, 1,
0.02557781, -0.1898003, 3.588296, 0, 0.9568627, 1, 1,
0.02696363, -0.9684033, 2.775737, 0, 0.9529412, 1, 1,
0.03213995, -0.5188889, 3.788207, 0, 0.945098, 1, 1,
0.0381587, 0.1169428, -0.9118173, 0, 0.9411765, 1, 1,
0.04433275, -0.9255949, 3.34392, 0, 0.9333333, 1, 1,
0.05458273, 0.6131312, 1.616867, 0, 0.9294118, 1, 1,
0.0545836, -0.5771075, 3.82659, 0, 0.9215686, 1, 1,
0.05994222, 0.5600696, 0.7385982, 0, 0.9176471, 1, 1,
0.06308556, 0.2457049, 1.869825, 0, 0.9098039, 1, 1,
0.06479406, 0.7862015, -1.059441, 0, 0.9058824, 1, 1,
0.0651141, -0.2029946, 2.724672, 0, 0.8980392, 1, 1,
0.06653799, 1.838908, -0.9419299, 0, 0.8901961, 1, 1,
0.06840765, -0.1837494, 1.994142, 0, 0.8862745, 1, 1,
0.07033697, -1.51803, 3.607685, 0, 0.8784314, 1, 1,
0.07081489, 0.7196246, -0.7409962, 0, 0.8745098, 1, 1,
0.07350704, 2.775265, 0.5336091, 0, 0.8666667, 1, 1,
0.07371592, 0.1173709, 0.8355469, 0, 0.8627451, 1, 1,
0.07496202, 1.84273, -0.05670234, 0, 0.854902, 1, 1,
0.07590627, -0.6119979, 2.841606, 0, 0.8509804, 1, 1,
0.0790845, -0.1256077, 3.115222, 0, 0.8431373, 1, 1,
0.08503914, -0.929917, 3.480633, 0, 0.8392157, 1, 1,
0.08665228, -0.005349967, 2.494917, 0, 0.8313726, 1, 1,
0.08967217, 0.6526969, 0.2753359, 0, 0.827451, 1, 1,
0.09231459, 1.281891, 0.8255013, 0, 0.8196079, 1, 1,
0.09500106, -0.00842536, 2.582806, 0, 0.8156863, 1, 1,
0.1063289, 0.01804685, 1.735824, 0, 0.8078431, 1, 1,
0.1093847, 0.006380056, 1.815709, 0, 0.8039216, 1, 1,
0.1164531, 0.6098179, -0.06549034, 0, 0.7960784, 1, 1,
0.1176777, 1.588852, 0.4054645, 0, 0.7882353, 1, 1,
0.1191238, -0.3054586, 2.569161, 0, 0.7843137, 1, 1,
0.1232631, 0.8160772, -0.290289, 0, 0.7764706, 1, 1,
0.1300196, 0.2033167, -0.03933659, 0, 0.772549, 1, 1,
0.1302782, 0.7858512, -0.2973035, 0, 0.7647059, 1, 1,
0.1313036, 0.2620189, -2.669724, 0, 0.7607843, 1, 1,
0.1313569, 0.2330303, -0.2433811, 0, 0.7529412, 1, 1,
0.1335292, 1.487581, -0.9138709, 0, 0.7490196, 1, 1,
0.1407834, -0.8351645, 2.928888, 0, 0.7411765, 1, 1,
0.1435845, -0.4192414, 2.777022, 0, 0.7372549, 1, 1,
0.1479353, -0.4280685, 3.936188, 0, 0.7294118, 1, 1,
0.1515603, -1.134711, 3.251502, 0, 0.7254902, 1, 1,
0.1549203, -1.759441, 3.830818, 0, 0.7176471, 1, 1,
0.1637322, 0.358648, -1.674551, 0, 0.7137255, 1, 1,
0.1641406, -0.5101078, 3.119647, 0, 0.7058824, 1, 1,
0.1744744, -0.451272, 0.9400064, 0, 0.6980392, 1, 1,
0.176295, -0.108299, 1.093877, 0, 0.6941177, 1, 1,
0.180437, 0.1010353, -0.1516639, 0, 0.6862745, 1, 1,
0.1815209, -0.9164706, 2.637057, 0, 0.682353, 1, 1,
0.1825953, 0.9706535, 1.533579, 0, 0.6745098, 1, 1,
0.186644, 1.099699, 0.4239101, 0, 0.6705883, 1, 1,
0.1871411, 0.8871055, -0.3747457, 0, 0.6627451, 1, 1,
0.1972365, -1.216204, 2.806154, 0, 0.6588235, 1, 1,
0.1984487, -0.002619413, 1.507376, 0, 0.6509804, 1, 1,
0.1991294, -0.5674673, 1.446827, 0, 0.6470588, 1, 1,
0.199437, -1.220484, 1.838501, 0, 0.6392157, 1, 1,
0.2010763, 0.2489164, 0.7803909, 0, 0.6352941, 1, 1,
0.2021974, -0.1372044, 1.252, 0, 0.627451, 1, 1,
0.2023517, -1.231635, 1.180174, 0, 0.6235294, 1, 1,
0.2039657, -1.432341, 4.986391, 0, 0.6156863, 1, 1,
0.2104345, 0.05483658, 2.270195, 0, 0.6117647, 1, 1,
0.2178335, 0.561618, -0.1073527, 0, 0.6039216, 1, 1,
0.2204478, -1.994662, 3.753268, 0, 0.5960785, 1, 1,
0.2219961, 0.9873072, 0.5120426, 0, 0.5921569, 1, 1,
0.2276487, -0.9852527, 3.360162, 0, 0.5843138, 1, 1,
0.2303085, -0.5876113, 2.137482, 0, 0.5803922, 1, 1,
0.2338738, -0.2978639, 2.301391, 0, 0.572549, 1, 1,
0.2352474, 1.614079, 0.5664042, 0, 0.5686275, 1, 1,
0.2507029, -1.029372, 3.559189, 0, 0.5607843, 1, 1,
0.2539881, 1.84696, -0.3912869, 0, 0.5568628, 1, 1,
0.2561557, -1.128681, 2.951721, 0, 0.5490196, 1, 1,
0.2608907, -0.4342563, 3.871544, 0, 0.5450981, 1, 1,
0.2615352, -0.8398166, 4.232162, 0, 0.5372549, 1, 1,
0.262228, -0.6960939, 2.938624, 0, 0.5333334, 1, 1,
0.2692433, -1.049509, 3.489147, 0, 0.5254902, 1, 1,
0.2727469, -1.583267, 3.01003, 0, 0.5215687, 1, 1,
0.2746809, 0.2368346, 0.3125319, 0, 0.5137255, 1, 1,
0.2751541, -1.22068, 2.324577, 0, 0.509804, 1, 1,
0.2763573, -1.902755, 3.118196, 0, 0.5019608, 1, 1,
0.2782202, 2.079182, -2.025384, 0, 0.4941176, 1, 1,
0.2788919, 0.5650778, -0.1588265, 0, 0.4901961, 1, 1,
0.2794184, 0.8536679, 0.6649844, 0, 0.4823529, 1, 1,
0.2798685, 1.490397, -0.5168591, 0, 0.4784314, 1, 1,
0.2802926, -0.585879, 1.538407, 0, 0.4705882, 1, 1,
0.282442, 0.04287121, 2.02844, 0, 0.4666667, 1, 1,
0.2846243, -1.051198, 1.720652, 0, 0.4588235, 1, 1,
0.2912299, -0.458562, 1.399871, 0, 0.454902, 1, 1,
0.2924065, 0.9493721, 0.6532173, 0, 0.4470588, 1, 1,
0.2958701, 0.4898655, 1.270194, 0, 0.4431373, 1, 1,
0.2970053, -0.05475494, 1.66323, 0, 0.4352941, 1, 1,
0.2984991, -0.3987426, 4.580058, 0, 0.4313726, 1, 1,
0.3046802, -1.514172, 1.977102, 0, 0.4235294, 1, 1,
0.3071222, 0.1086974, -1.024341, 0, 0.4196078, 1, 1,
0.3114885, -1.652204, 3.472848, 0, 0.4117647, 1, 1,
0.3118489, -1.744567, 1.930151, 0, 0.4078431, 1, 1,
0.3161421, 0.144499, 1.769973, 0, 0.4, 1, 1,
0.31806, -0.2847031, 2.977926, 0, 0.3921569, 1, 1,
0.3188964, 0.04734348, 1.985599, 0, 0.3882353, 1, 1,
0.320485, 1.56604, -0.8032919, 0, 0.3803922, 1, 1,
0.3235464, 0.1797758, 0.4593664, 0, 0.3764706, 1, 1,
0.3277346, 0.935369, 1.401003, 0, 0.3686275, 1, 1,
0.3307026, 0.04845207, 4.01281, 0, 0.3647059, 1, 1,
0.3348063, -0.5517786, 4.070196, 0, 0.3568628, 1, 1,
0.3362635, -0.2913504, 2.101758, 0, 0.3529412, 1, 1,
0.3388183, -0.008101817, 1.3336, 0, 0.345098, 1, 1,
0.3389398, 0.3673081, 1.431695, 0, 0.3411765, 1, 1,
0.3390851, 0.1648749, 3.460748, 0, 0.3333333, 1, 1,
0.3400642, -0.06175, 0.7491423, 0, 0.3294118, 1, 1,
0.3557251, -0.01312029, 3.766738, 0, 0.3215686, 1, 1,
0.3589573, -0.2762732, 1.289293, 0, 0.3176471, 1, 1,
0.3623391, 0.3747838, 0.971559, 0, 0.3098039, 1, 1,
0.363568, 1.197255, -1.017283, 0, 0.3058824, 1, 1,
0.3647935, -0.005849932, 3.053593, 0, 0.2980392, 1, 1,
0.3818786, 1.025374, 1.14784, 0, 0.2901961, 1, 1,
0.3850732, 0.5305245, 0.7426264, 0, 0.2862745, 1, 1,
0.3854195, 0.994827, -0.2024083, 0, 0.2784314, 1, 1,
0.3857844, -0.1209413, 1.205295, 0, 0.2745098, 1, 1,
0.3866093, 1.110724, -1.415785, 0, 0.2666667, 1, 1,
0.396796, -1.782114, 2.902203, 0, 0.2627451, 1, 1,
0.3970601, -0.1807958, 1.009955, 0, 0.254902, 1, 1,
0.3985215, -1.8707, 2.813761, 0, 0.2509804, 1, 1,
0.3993545, 0.937271, -1.34662, 0, 0.2431373, 1, 1,
0.4060916, -0.4458535, 2.953595, 0, 0.2392157, 1, 1,
0.4082986, -0.4179505, 2.2388, 0, 0.2313726, 1, 1,
0.4152854, 0.1414331, 0.3945953, 0, 0.227451, 1, 1,
0.4178529, -1.4907, 4.609682, 0, 0.2196078, 1, 1,
0.418538, -1.717636, 4.418271, 0, 0.2156863, 1, 1,
0.4215373, -1.19641, 4.769766, 0, 0.2078431, 1, 1,
0.4222222, 2.30468, -0.3256575, 0, 0.2039216, 1, 1,
0.4225905, -0.2230794, 3.472632, 0, 0.1960784, 1, 1,
0.4242366, -0.4686035, 3.455779, 0, 0.1882353, 1, 1,
0.4275713, -3.281654, 2.268932, 0, 0.1843137, 1, 1,
0.4278935, -1.667723, 3.17663, 0, 0.1764706, 1, 1,
0.4292522, -1.230672, 2.714616, 0, 0.172549, 1, 1,
0.4294191, -0.502404, 1.380935, 0, 0.1647059, 1, 1,
0.4346526, 1.891386, 1.481869, 0, 0.1607843, 1, 1,
0.4379627, 0.3513552, 0.9625543, 0, 0.1529412, 1, 1,
0.4458637, 1.245837, 0.8647112, 0, 0.1490196, 1, 1,
0.4478913, 1.574442, 1.191953, 0, 0.1411765, 1, 1,
0.4504529, -1.008582, 2.703795, 0, 0.1372549, 1, 1,
0.452406, -0.0007067533, 0.9067663, 0, 0.1294118, 1, 1,
0.4529437, 0.3903289, 1.551889, 0, 0.1254902, 1, 1,
0.4539607, 1.245179, -0.4369368, 0, 0.1176471, 1, 1,
0.4601343, 1.08936, 1.708721, 0, 0.1137255, 1, 1,
0.4639989, 1.034036, 0.003409263, 0, 0.1058824, 1, 1,
0.4659511, -1.272419, 2.806574, 0, 0.09803922, 1, 1,
0.4693789, -1.444473, 2.071203, 0, 0.09411765, 1, 1,
0.474087, 0.2944238, 1.394761, 0, 0.08627451, 1, 1,
0.4775758, -0.9451466, 0.212256, 0, 0.08235294, 1, 1,
0.4813965, -0.2525178, 0.9925945, 0, 0.07450981, 1, 1,
0.4817464, 0.6349351, 1.8634, 0, 0.07058824, 1, 1,
0.4836524, 0.04674974, 1.762217, 0, 0.0627451, 1, 1,
0.4876984, -1.337616, 3.315243, 0, 0.05882353, 1, 1,
0.4911564, -1.610321, 2.522938, 0, 0.05098039, 1, 1,
0.4972898, -2.061379, 3.887459, 0, 0.04705882, 1, 1,
0.500991, 0.598631, 1.285741, 0, 0.03921569, 1, 1,
0.5080819, -0.367843, 3.205879, 0, 0.03529412, 1, 1,
0.5083584, -0.3724622, 1.936634, 0, 0.02745098, 1, 1,
0.5096787, 0.6688376, 0.9664325, 0, 0.02352941, 1, 1,
0.5102754, 0.07569082, 2.529947, 0, 0.01568628, 1, 1,
0.5130412, -0.4840531, 2.274982, 0, 0.01176471, 1, 1,
0.5148033, -0.4054395, 2.249957, 0, 0.003921569, 1, 1,
0.5160887, -0.6941047, 3.959399, 0.003921569, 0, 1, 1,
0.5198447, 1.655784, 0.915651, 0.007843138, 0, 1, 1,
0.5223903, -0.6001996, 3.209963, 0.01568628, 0, 1, 1,
0.5224642, 0.3038672, 0.3683915, 0.01960784, 0, 1, 1,
0.524823, -0.4296549, 3.962112, 0.02745098, 0, 1, 1,
0.5249575, -0.4568459, 2.005751, 0.03137255, 0, 1, 1,
0.5265372, 0.4826413, 0.5635937, 0.03921569, 0, 1, 1,
0.5319659, -1.007592, 2.379831, 0.04313726, 0, 1, 1,
0.5353311, -0.4452328, 0.4830242, 0.05098039, 0, 1, 1,
0.5357993, 1.515594, 1.880407, 0.05490196, 0, 1, 1,
0.5395739, -0.008806899, 1.201034, 0.0627451, 0, 1, 1,
0.5470782, 0.3859687, 3.460289, 0.06666667, 0, 1, 1,
0.5480933, -1.102675, 2.668326, 0.07450981, 0, 1, 1,
0.5508488, 1.801665, -0.003253153, 0.07843138, 0, 1, 1,
0.5575267, -0.292536, -0.2739685, 0.08627451, 0, 1, 1,
0.5624544, -1.34496, 3.709236, 0.09019608, 0, 1, 1,
0.5632448, 0.3504142, -0.7300091, 0.09803922, 0, 1, 1,
0.5657918, -1.4177, 3.72506, 0.1058824, 0, 1, 1,
0.5664771, 0.05351465, 1.778254, 0.1098039, 0, 1, 1,
0.5684657, -0.1045637, 2.84799, 0.1176471, 0, 1, 1,
0.571268, 2.048602, 1.402349, 0.1215686, 0, 1, 1,
0.5776111, 1.866787, 1.410782, 0.1294118, 0, 1, 1,
0.578793, 0.5629356, 2.372625, 0.1333333, 0, 1, 1,
0.5810656, -0.7741283, 2.299515, 0.1411765, 0, 1, 1,
0.5822532, 2.021282, -0.1225443, 0.145098, 0, 1, 1,
0.583086, 0.944916, 1.424199, 0.1529412, 0, 1, 1,
0.5839665, -0.7369949, 2.941997, 0.1568628, 0, 1, 1,
0.5868457, -0.7862152, 2.69127, 0.1647059, 0, 1, 1,
0.5925445, 0.6225024, 0.9739226, 0.1686275, 0, 1, 1,
0.5928001, 0.7744051, -0.3637718, 0.1764706, 0, 1, 1,
0.5944793, 0.2987803, 0.9186258, 0.1803922, 0, 1, 1,
0.5979027, 0.04643347, 0.7396609, 0.1882353, 0, 1, 1,
0.6036307, 0.7467676, -0.2998677, 0.1921569, 0, 1, 1,
0.6049154, 0.2112897, 1.619553, 0.2, 0, 1, 1,
0.6051673, -0.940677, 2.75647, 0.2078431, 0, 1, 1,
0.6096656, -2.266474, 2.914907, 0.2117647, 0, 1, 1,
0.6113901, 0.6829968, -0.2662121, 0.2196078, 0, 1, 1,
0.6152303, -0.8638469, 1.841705, 0.2235294, 0, 1, 1,
0.6208029, 0.4641321, 0.1875275, 0.2313726, 0, 1, 1,
0.6219484, 1.258908, 0.8380231, 0.2352941, 0, 1, 1,
0.6227717, 0.8795128, 0.6501538, 0.2431373, 0, 1, 1,
0.6271185, -0.3725196, 1.757327, 0.2470588, 0, 1, 1,
0.6340204, 0.8682832, -0.3810211, 0.254902, 0, 1, 1,
0.6349931, 1.702896, -1.159285, 0.2588235, 0, 1, 1,
0.6364524, -0.4755608, 0.21794, 0.2666667, 0, 1, 1,
0.6441931, 1.2241, 1.337077, 0.2705882, 0, 1, 1,
0.645569, -0.3782394, 3.286051, 0.2784314, 0, 1, 1,
0.6463208, 1.420365, 0.2071393, 0.282353, 0, 1, 1,
0.6464872, 0.2889113, 1.520537, 0.2901961, 0, 1, 1,
0.6505964, 0.4859369, 0.09625354, 0.2941177, 0, 1, 1,
0.6526559, 0.8738407, -0.1734954, 0.3019608, 0, 1, 1,
0.6574743, 2.265018, 0.06180398, 0.3098039, 0, 1, 1,
0.658488, 0.4008622, 2.948974, 0.3137255, 0, 1, 1,
0.6620387, -0.4328949, 4.295887, 0.3215686, 0, 1, 1,
0.6632426, -0.9702514, 1.420792, 0.3254902, 0, 1, 1,
0.6668966, 0.6295003, -0.4793341, 0.3333333, 0, 1, 1,
0.6696911, 0.601656, 0.3275752, 0.3372549, 0, 1, 1,
0.6706967, 1.207756, 0.4077542, 0.345098, 0, 1, 1,
0.672197, 0.4187896, 1.324892, 0.3490196, 0, 1, 1,
0.6733686, -1.164255, 3.58581, 0.3568628, 0, 1, 1,
0.6753127, 1.33622, 0.7466689, 0.3607843, 0, 1, 1,
0.6785749, 1.593556, 2.150662, 0.3686275, 0, 1, 1,
0.6837295, 1.350475, 1.001794, 0.372549, 0, 1, 1,
0.6842754, -0.7834874, 2.308185, 0.3803922, 0, 1, 1,
0.6874995, -0.4769715, 0.5908477, 0.3843137, 0, 1, 1,
0.6890318, -2.431403, 2.577135, 0.3921569, 0, 1, 1,
0.691594, -1.390283, 2.190928, 0.3960784, 0, 1, 1,
0.6937992, -1.942362, 2.757408, 0.4039216, 0, 1, 1,
0.6962577, 1.016488, 0.6109665, 0.4117647, 0, 1, 1,
0.7005101, 0.7984269, -0.8234593, 0.4156863, 0, 1, 1,
0.7006536, 0.3473073, 1.335406, 0.4235294, 0, 1, 1,
0.7039875, 0.2342377, 0.7075989, 0.427451, 0, 1, 1,
0.7054007, 1.509346, -1.058856, 0.4352941, 0, 1, 1,
0.7133018, 1.857078, 2.190668, 0.4392157, 0, 1, 1,
0.7146792, -0.9329178, 0.417729, 0.4470588, 0, 1, 1,
0.7165504, -0.8496817, 1.882391, 0.4509804, 0, 1, 1,
0.7170925, -0.4760048, 3.06737, 0.4588235, 0, 1, 1,
0.7193952, -0.6476694, 1.669373, 0.4627451, 0, 1, 1,
0.7231393, -0.9411872, 1.619836, 0.4705882, 0, 1, 1,
0.724368, 0.1475794, 0.5313051, 0.4745098, 0, 1, 1,
0.7249086, -1.014593, 0.8008603, 0.4823529, 0, 1, 1,
0.7271812, 0.2854784, -0.132125, 0.4862745, 0, 1, 1,
0.7281326, 1.464314, 0.2283673, 0.4941176, 0, 1, 1,
0.7285566, 0.4225835, 0.1410967, 0.5019608, 0, 1, 1,
0.7287742, 0.5596134, 0.3194425, 0.5058824, 0, 1, 1,
0.7328558, -0.701037, 2.045287, 0.5137255, 0, 1, 1,
0.7371219, 0.2575097, 0.6775616, 0.5176471, 0, 1, 1,
0.7400804, -0.4848676, 0.6827906, 0.5254902, 0, 1, 1,
0.7403868, 0.360237, 0.827711, 0.5294118, 0, 1, 1,
0.7432252, -0.2223374, 0.7171023, 0.5372549, 0, 1, 1,
0.746136, -0.1493, 2.317965, 0.5411765, 0, 1, 1,
0.7503418, -0.5047679, 3.196685, 0.5490196, 0, 1, 1,
0.754258, -1.138197, 2.089707, 0.5529412, 0, 1, 1,
0.7576687, 1.790919, -0.2740122, 0.5607843, 0, 1, 1,
0.7587714, -1.35799, 1.700936, 0.5647059, 0, 1, 1,
0.761677, 0.5833185, 0.4107146, 0.572549, 0, 1, 1,
0.7761342, 0.3546224, 0.7160931, 0.5764706, 0, 1, 1,
0.781876, 0.5503325, 1.325786, 0.5843138, 0, 1, 1,
0.7828951, 1.07509, 0.1538472, 0.5882353, 0, 1, 1,
0.7836077, 0.5880247, 1.309304, 0.5960785, 0, 1, 1,
0.7836686, 1.929063, 1.016609, 0.6039216, 0, 1, 1,
0.7842832, -0.5648527, 3.305117, 0.6078432, 0, 1, 1,
0.7843155, -1.18397, 1.797737, 0.6156863, 0, 1, 1,
0.7848203, -0.7957526, 2.512195, 0.6196079, 0, 1, 1,
0.791928, -0.9973302, 2.45008, 0.627451, 0, 1, 1,
0.7927621, -2.025396, 4.651918, 0.6313726, 0, 1, 1,
0.7964862, -0.2591111, 1.100151, 0.6392157, 0, 1, 1,
0.7975476, 0.6726024, 0.5944215, 0.6431373, 0, 1, 1,
0.7987756, -0.6348302, 3.071469, 0.6509804, 0, 1, 1,
0.7999223, -0.7882885, 4.300287, 0.654902, 0, 1, 1,
0.8026134, 0.1812282, 1.402077, 0.6627451, 0, 1, 1,
0.809222, -1.016859, 1.875153, 0.6666667, 0, 1, 1,
0.8156189, -1.097038, 0.6396857, 0.6745098, 0, 1, 1,
0.8170658, -0.9590021, 1.941107, 0.6784314, 0, 1, 1,
0.8196052, 2.559414, 1.026105, 0.6862745, 0, 1, 1,
0.8398635, -0.2584232, 0.6955362, 0.6901961, 0, 1, 1,
0.8431982, -0.5750952, 1.583529, 0.6980392, 0, 1, 1,
0.8432804, -0.1260276, 2.4504, 0.7058824, 0, 1, 1,
0.845809, -1.137371, 3.275404, 0.7098039, 0, 1, 1,
0.8501025, 1.918811, -0.1074555, 0.7176471, 0, 1, 1,
0.8547815, 0.4067092, 0.9694508, 0.7215686, 0, 1, 1,
0.8553148, -0.6994507, 2.817826, 0.7294118, 0, 1, 1,
0.8556331, -1.535088, 2.191268, 0.7333333, 0, 1, 1,
0.8562897, -0.08390171, 0.03946323, 0.7411765, 0, 1, 1,
0.8568186, -0.11635, 1.852397, 0.7450981, 0, 1, 1,
0.8580835, 0.9191691, 0.6184961, 0.7529412, 0, 1, 1,
0.8599794, 0.06896684, 1.404607, 0.7568628, 0, 1, 1,
0.8612679, -0.06945207, 1.604685, 0.7647059, 0, 1, 1,
0.8690785, -1.503836, 2.950835, 0.7686275, 0, 1, 1,
0.8705138, 1.737321, 0.2578387, 0.7764706, 0, 1, 1,
0.8720316, -0.6182314, 2.639381, 0.7803922, 0, 1, 1,
0.8736005, 0.6791609, 2.685892, 0.7882353, 0, 1, 1,
0.8774247, 0.5617906, -0.1545901, 0.7921569, 0, 1, 1,
0.8778115, -1.004429, 3.674905, 0.8, 0, 1, 1,
0.8785021, -0.917605, 1.400671, 0.8078431, 0, 1, 1,
0.8835359, 0.08265597, 0.6097612, 0.8117647, 0, 1, 1,
0.889277, -0.01831497, 2.243289, 0.8196079, 0, 1, 1,
0.8896539, 0.1315715, 1.605009, 0.8235294, 0, 1, 1,
0.8954132, -0.01401978, 2.127239, 0.8313726, 0, 1, 1,
0.8960478, -0.7945739, 4.02642, 0.8352941, 0, 1, 1,
0.8982666, 0.5419275, 0.8444831, 0.8431373, 0, 1, 1,
0.8989748, -0.3584142, 1.358259, 0.8470588, 0, 1, 1,
0.8989753, -1.282631, 1.972062, 0.854902, 0, 1, 1,
0.9060923, 1.806947, 0.6553817, 0.8588235, 0, 1, 1,
0.9065658, -0.8544109, 3.08746, 0.8666667, 0, 1, 1,
0.9070041, -1.731424, 2.229676, 0.8705882, 0, 1, 1,
0.9111939, -0.389369, 2.324708, 0.8784314, 0, 1, 1,
0.9143624, -0.001399466, 2.193825, 0.8823529, 0, 1, 1,
0.9151645, -0.05701164, 2.504976, 0.8901961, 0, 1, 1,
0.9181526, -0.2743951, 1.773813, 0.8941177, 0, 1, 1,
0.91914, -0.06292944, 2.529313, 0.9019608, 0, 1, 1,
0.9235725, 0.203328, 0.9934092, 0.9098039, 0, 1, 1,
0.9257281, -0.6330861, 2.392142, 0.9137255, 0, 1, 1,
0.9261703, -1.022095, 1.462286, 0.9215686, 0, 1, 1,
0.9266636, 0.3352527, -0.2181144, 0.9254902, 0, 1, 1,
0.9286745, 1.329615, 2.289737, 0.9333333, 0, 1, 1,
0.9292454, 0.3181918, 1.656766, 0.9372549, 0, 1, 1,
0.9319649, -0.9127989, 1.045999, 0.945098, 0, 1, 1,
0.9320636, -0.8320275, 3.225214, 0.9490196, 0, 1, 1,
0.9350042, -1.06071, 4.135713, 0.9568627, 0, 1, 1,
0.9367455, -0.5474796, 2.309987, 0.9607843, 0, 1, 1,
0.9423956, 1.88685, 0.09506499, 0.9686275, 0, 1, 1,
0.9432105, 1.055613, 1.463452, 0.972549, 0, 1, 1,
0.9483351, 2.570687, -1.334422, 0.9803922, 0, 1, 1,
0.9495906, -0.6899234, 0.07934503, 0.9843137, 0, 1, 1,
0.9514454, -0.7925653, 2.076923, 0.9921569, 0, 1, 1,
0.9530769, 0.1117973, 2.050293, 0.9960784, 0, 1, 1,
0.9571835, -0.7498108, 2.518087, 1, 0, 0.9960784, 1,
0.9590808, -0.4028274, 0.7907102, 1, 0, 0.9882353, 1,
0.9639381, -0.7060285, 2.590733, 1, 0, 0.9843137, 1,
0.9667915, -0.5633113, 1.174501, 1, 0, 0.9764706, 1,
0.9716027, -0.7179871, 2.045794, 1, 0, 0.972549, 1,
0.9746489, -0.3636533, 2.994524, 1, 0, 0.9647059, 1,
0.9768589, -0.4170442, 2.117539, 1, 0, 0.9607843, 1,
0.9778024, 0.3176968, 2.104092, 1, 0, 0.9529412, 1,
0.9806121, 1.408565, 0.9036884, 1, 0, 0.9490196, 1,
0.9829702, -2.600071, 3.3571, 1, 0, 0.9411765, 1,
0.9835403, -1.469163, 2.829751, 1, 0, 0.9372549, 1,
0.9938514, -1.222811, 1.934544, 1, 0, 0.9294118, 1,
0.9948783, -0.2382129, 2.415956, 1, 0, 0.9254902, 1,
1.007061, 1.128927, 1.660867, 1, 0, 0.9176471, 1,
1.013768, -0.2054284, 1.571345, 1, 0, 0.9137255, 1,
1.017944, 0.7077423, 0.1239778, 1, 0, 0.9058824, 1,
1.023188, -0.824554, 2.827387, 1, 0, 0.9019608, 1,
1.02605, 0.1977744, 0.9153699, 1, 0, 0.8941177, 1,
1.030143, 0.5763076, 1.658666, 1, 0, 0.8862745, 1,
1.030963, -1.930404, 2.792533, 1, 0, 0.8823529, 1,
1.041945, 0.9214246, 1.368048, 1, 0, 0.8745098, 1,
1.042057, 0.6781272, 0.952433, 1, 0, 0.8705882, 1,
1.043431, -0.9782286, 2.485653, 1, 0, 0.8627451, 1,
1.04458, 1.335843, 0.4412303, 1, 0, 0.8588235, 1,
1.045063, -0.3479502, 1.917332, 1, 0, 0.8509804, 1,
1.055147, 0.397292, 2.232704, 1, 0, 0.8470588, 1,
1.059448, 0.5781605, 2.076047, 1, 0, 0.8392157, 1,
1.06201, -0.09993406, 2.157384, 1, 0, 0.8352941, 1,
1.066305, -0.3687477, 1.33454, 1, 0, 0.827451, 1,
1.066918, -0.329292, 2.748194, 1, 0, 0.8235294, 1,
1.072409, 0.4089946, -1.233281, 1, 0, 0.8156863, 1,
1.072699, -1.12345, 1.463991, 1, 0, 0.8117647, 1,
1.07769, 0.5890113, 2.498074, 1, 0, 0.8039216, 1,
1.078616, 0.4979663, 0.6752247, 1, 0, 0.7960784, 1,
1.091787, -0.2553928, 2.278315, 1, 0, 0.7921569, 1,
1.093729, 0.3201856, 0.5762764, 1, 0, 0.7843137, 1,
1.094642, 0.8361615, 1.199462, 1, 0, 0.7803922, 1,
1.102221, -1.93868, 0.5098216, 1, 0, 0.772549, 1,
1.124122, -0.7613283, 2.863712, 1, 0, 0.7686275, 1,
1.126654, 0.08792872, 2.952449, 1, 0, 0.7607843, 1,
1.131365, 0.6365447, 0.0514751, 1, 0, 0.7568628, 1,
1.132985, 0.7853508, -0.2322686, 1, 0, 0.7490196, 1,
1.139555, -1.662795, 1.454898, 1, 0, 0.7450981, 1,
1.14025, -1.227499, 2.016094, 1, 0, 0.7372549, 1,
1.143069, 0.3682705, 0.1564628, 1, 0, 0.7333333, 1,
1.150637, 0.4891566, 2.259857, 1, 0, 0.7254902, 1,
1.159173, 1.269901, 1.570249, 1, 0, 0.7215686, 1,
1.159824, 0.6954572, 2.763783, 1, 0, 0.7137255, 1,
1.173112, 0.7153613, 2.335277, 1, 0, 0.7098039, 1,
1.174584, -0.4902008, 2.643587, 1, 0, 0.7019608, 1,
1.175179, 0.6986188, 2.256056, 1, 0, 0.6941177, 1,
1.182696, -0.9448006, 2.504108, 1, 0, 0.6901961, 1,
1.184555, 0.3496037, 1.706046, 1, 0, 0.682353, 1,
1.195822, 0.1401585, 1.101484, 1, 0, 0.6784314, 1,
1.197802, 0.6177933, 2.993213, 1, 0, 0.6705883, 1,
1.20236, -1.007285, 2.097216, 1, 0, 0.6666667, 1,
1.210652, 1.627038, 0.7977447, 1, 0, 0.6588235, 1,
1.213018, -0.7439278, 1.737426, 1, 0, 0.654902, 1,
1.213841, 1.315652, 0.5597506, 1, 0, 0.6470588, 1,
1.222395, 0.4332561, 2.208485, 1, 0, 0.6431373, 1,
1.225893, -1.130006, 4.031024, 1, 0, 0.6352941, 1,
1.230275, 0.2554686, 0.408465, 1, 0, 0.6313726, 1,
1.239777, -0.2749693, 2.958484, 1, 0, 0.6235294, 1,
1.24079, -0.2122551, 1.849662, 1, 0, 0.6196079, 1,
1.242193, 1.105414, 1.862889, 1, 0, 0.6117647, 1,
1.249077, 1.970936, 1.955829, 1, 0, 0.6078432, 1,
1.25746, -0.1937544, 2.189933, 1, 0, 0.6, 1,
1.262167, 0.2165126, 0.2485562, 1, 0, 0.5921569, 1,
1.271983, -0.5547118, 2.422347, 1, 0, 0.5882353, 1,
1.278499, 1.382451, -0.04981098, 1, 0, 0.5803922, 1,
1.286775, 0.7891809, 1.767257, 1, 0, 0.5764706, 1,
1.290111, -0.6960291, 3.43738, 1, 0, 0.5686275, 1,
1.294357, -1.847743, 1.731891, 1, 0, 0.5647059, 1,
1.320143, 0.02102828, 4.081031, 1, 0, 0.5568628, 1,
1.320271, -1.76474, 3.356919, 1, 0, 0.5529412, 1,
1.320632, 1.370684, 0.7236272, 1, 0, 0.5450981, 1,
1.329067, -2.383842, 2.136128, 1, 0, 0.5411765, 1,
1.331322, 0.6274324, 0.4431591, 1, 0, 0.5333334, 1,
1.338215, 0.1925008, 1.133603, 1, 0, 0.5294118, 1,
1.339718, 1.790593, 2.307809, 1, 0, 0.5215687, 1,
1.347378, -0.8556091, 4.075284, 1, 0, 0.5176471, 1,
1.360744, 2.282975, 0.5628422, 1, 0, 0.509804, 1,
1.376087, 0.1720523, 0.1644906, 1, 0, 0.5058824, 1,
1.381666, -2.331768, 1.519447, 1, 0, 0.4980392, 1,
1.389913, 0.195786, 0.9610466, 1, 0, 0.4901961, 1,
1.390252, 1.225198, -0.7570601, 1, 0, 0.4862745, 1,
1.39128, -0.07693963, 0.8840846, 1, 0, 0.4784314, 1,
1.393488, -0.05462385, 2.632012, 1, 0, 0.4745098, 1,
1.405642, -0.610485, 1.882069, 1, 0, 0.4666667, 1,
1.411504, 1.620303, 1.197314, 1, 0, 0.4627451, 1,
1.441963, -0.5463326, 3.347081, 1, 0, 0.454902, 1,
1.464776, -0.856119, 3.285366, 1, 0, 0.4509804, 1,
1.466214, 1.697407, 0.4872835, 1, 0, 0.4431373, 1,
1.469758, -0.6725268, 1.987881, 1, 0, 0.4392157, 1,
1.484578, -1.459405, 2.217513, 1, 0, 0.4313726, 1,
1.51251, -1.008656, -0.2414785, 1, 0, 0.427451, 1,
1.51402, -0.4212013, 0.5339133, 1, 0, 0.4196078, 1,
1.529835, -0.4520493, -0.209594, 1, 0, 0.4156863, 1,
1.534606, -0.2551888, 2.142428, 1, 0, 0.4078431, 1,
1.550856, -1.517082, 1.653502, 1, 0, 0.4039216, 1,
1.575664, -1.789707, 4.411931, 1, 0, 0.3960784, 1,
1.595821, 0.008014747, 2.428724, 1, 0, 0.3882353, 1,
1.603644, -1.235995, 3.785015, 1, 0, 0.3843137, 1,
1.639893, -0.7253208, 1.389892, 1, 0, 0.3764706, 1,
1.647196, -0.2674851, 2.258472, 1, 0, 0.372549, 1,
1.649553, -0.7546939, 2.195818, 1, 0, 0.3647059, 1,
1.653499, -0.8149607, 2.805447, 1, 0, 0.3607843, 1,
1.660875, -0.5569457, 2.050477, 1, 0, 0.3529412, 1,
1.688141, -0.2739911, 1.711905, 1, 0, 0.3490196, 1,
1.69114, -0.5122352, 1.701735, 1, 0, 0.3411765, 1,
1.699559, -0.3264252, 2.407184, 1, 0, 0.3372549, 1,
1.703047, 2.055779, 1.533221, 1, 0, 0.3294118, 1,
1.712094, 0.7034546, 1.25408, 1, 0, 0.3254902, 1,
1.717503, -0.631557, 1.955431, 1, 0, 0.3176471, 1,
1.730764, 0.1234149, 0.9165423, 1, 0, 0.3137255, 1,
1.737369, -0.9565811, 4.016829, 1, 0, 0.3058824, 1,
1.739771, 1.767448, 0.8602297, 1, 0, 0.2980392, 1,
1.746478, -1.692746, 3.191899, 1, 0, 0.2941177, 1,
1.758125, 0.8933578, 0.5667317, 1, 0, 0.2862745, 1,
1.758763, 0.7679969, 0.7095332, 1, 0, 0.282353, 1,
1.765797, 0.1626967, -0.1659308, 1, 0, 0.2745098, 1,
1.769153, -1.012739, 1.327727, 1, 0, 0.2705882, 1,
1.775997, 0.2133511, 0.619856, 1, 0, 0.2627451, 1,
1.784653, 0.06145845, 0.9061409, 1, 0, 0.2588235, 1,
1.796795, 2.282632, 0.5062868, 1, 0, 0.2509804, 1,
1.821547, -1.08042, 2.117, 1, 0, 0.2470588, 1,
1.830457, 0.6231071, 1.766618, 1, 0, 0.2392157, 1,
1.835715, 0.4119013, 1.323546, 1, 0, 0.2352941, 1,
1.840477, -2.292825, 2.427782, 1, 0, 0.227451, 1,
1.856595, 0.514782, 1.61504, 1, 0, 0.2235294, 1,
1.883038, 0.2512736, 2.260872, 1, 0, 0.2156863, 1,
1.888578, 0.241298, 1.183585, 1, 0, 0.2117647, 1,
1.889478, -0.2965429, 0.9831398, 1, 0, 0.2039216, 1,
1.890783, -0.8971631, 0.3111618, 1, 0, 0.1960784, 1,
1.896808, 0.78069, 2.514164, 1, 0, 0.1921569, 1,
1.903269, 0.1652092, 1.197166, 1, 0, 0.1843137, 1,
1.911626, -1.179074, 0.7927128, 1, 0, 0.1803922, 1,
1.917776, -0.2986089, 0.8372846, 1, 0, 0.172549, 1,
1.958183, 1.59579, 0.2606142, 1, 0, 0.1686275, 1,
1.964294, 2.602524, 1.339858, 1, 0, 0.1607843, 1,
1.977938, 1.608895, 1.877215, 1, 0, 0.1568628, 1,
1.993476, 0.3554111, 1.20897, 1, 0, 0.1490196, 1,
1.994488, -0.9771975, 1.868676, 1, 0, 0.145098, 1,
2.003149, 0.304548, 0.6547691, 1, 0, 0.1372549, 1,
2.012339, 1.114984, 0.9570987, 1, 0, 0.1333333, 1,
2.038486, 1.013368, 0.4633568, 1, 0, 0.1254902, 1,
2.040196, -0.1680404, 1.911868, 1, 0, 0.1215686, 1,
2.05355, 0.0976066, 2.373756, 1, 0, 0.1137255, 1,
2.065771, -0.4078886, 0.3968901, 1, 0, 0.1098039, 1,
2.07619, 1.299197, 2.60358, 1, 0, 0.1019608, 1,
2.137079, -0.07754849, 3.315879, 1, 0, 0.09411765, 1,
2.147331, 1.048336, 2.24106, 1, 0, 0.09019608, 1,
2.15889, -0.373771, 1.20364, 1, 0, 0.08235294, 1,
2.170135, -1.967299, 1.498161, 1, 0, 0.07843138, 1,
2.202449, 0.571512, 2.26434, 1, 0, 0.07058824, 1,
2.290736, -0.3844528, -0.3337874, 1, 0, 0.06666667, 1,
2.312479, 0.3106422, 1.274956, 1, 0, 0.05882353, 1,
2.322769, 1.216361, 2.159428, 1, 0, 0.05490196, 1,
2.326643, -1.921064, 4.675502, 1, 0, 0.04705882, 1,
2.357225, 0.5589994, 1.004751, 1, 0, 0.04313726, 1,
2.454399, -1.520752, 3.880945, 1, 0, 0.03529412, 1,
2.58503, 0.5309808, -0.6473575, 1, 0, 0.03137255, 1,
2.624803, -0.756658, 1.773111, 1, 0, 0.02352941, 1,
2.680556, 1.677906, 0.6211463, 1, 0, 0.01960784, 1,
2.775174, -0.7325203, 0.211824, 1, 0, 0.01176471, 1,
2.855257, 1.830688, -0.9577749, 1, 0, 0.007843138, 1
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
-0.2083206, -4.332852, -7.502729, 0, -0.5, 0.5, 0.5,
-0.2083206, -4.332852, -7.502729, 1, -0.5, 0.5, 0.5,
-0.2083206, -4.332852, -7.502729, 1, 1.5, 0.5, 0.5,
-0.2083206, -4.332852, -7.502729, 0, 1.5, 0.5, 0.5
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
-4.310451, -0.1807752, -7.502729, 0, -0.5, 0.5, 0.5,
-4.310451, -0.1807752, -7.502729, 1, -0.5, 0.5, 0.5,
-4.310451, -0.1807752, -7.502729, 1, 1.5, 0.5, 0.5,
-4.310451, -0.1807752, -7.502729, 0, 1.5, 0.5, 0.5
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
-4.310451, -4.332852, -0.3531215, 0, -0.5, 0.5, 0.5,
-4.310451, -4.332852, -0.3531215, 1, -0.5, 0.5, 0.5,
-4.310451, -4.332852, -0.3531215, 1, 1.5, 0.5, 0.5,
-4.310451, -4.332852, -0.3531215, 0, 1.5, 0.5, 0.5
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
-3, -3.374681, -5.852819,
2, -3.374681, -5.852819,
-3, -3.374681, -5.852819,
-3, -3.534376, -6.127804,
-2, -3.374681, -5.852819,
-2, -3.534376, -6.127804,
-1, -3.374681, -5.852819,
-1, -3.534376, -6.127804,
0, -3.374681, -5.852819,
0, -3.534376, -6.127804,
1, -3.374681, -5.852819,
1, -3.534376, -6.127804,
2, -3.374681, -5.852819,
2, -3.534376, -6.127804
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
-3, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
-3, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
-3, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
-3, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5,
-2, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
-2, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
-2, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
-2, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5,
-1, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
-1, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
-1, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
-1, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5,
0, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
0, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
0, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
0, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5,
1, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
1, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
1, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
1, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5,
2, -3.853767, -6.677774, 0, -0.5, 0.5, 0.5,
2, -3.853767, -6.677774, 1, -0.5, 0.5, 0.5,
2, -3.853767, -6.677774, 1, 1.5, 0.5, 0.5,
2, -3.853767, -6.677774, 0, 1.5, 0.5, 0.5
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
-3.363805, -3, -5.852819,
-3.363805, 2, -5.852819,
-3.363805, -3, -5.852819,
-3.52158, -3, -6.127804,
-3.363805, -2, -5.852819,
-3.52158, -2, -6.127804,
-3.363805, -1, -5.852819,
-3.52158, -1, -6.127804,
-3.363805, 0, -5.852819,
-3.52158, 0, -6.127804,
-3.363805, 1, -5.852819,
-3.52158, 1, -6.127804,
-3.363805, 2, -5.852819,
-3.52158, 2, -6.127804
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
-3.837128, -3, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, -3, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, -3, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, -3, -6.677774, 0, 1.5, 0.5, 0.5,
-3.837128, -2, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, -2, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, -2, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, -2, -6.677774, 0, 1.5, 0.5, 0.5,
-3.837128, -1, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, -1, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, -1, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, -1, -6.677774, 0, 1.5, 0.5, 0.5,
-3.837128, 0, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, 0, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, 0, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, 0, -6.677774, 0, 1.5, 0.5, 0.5,
-3.837128, 1, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, 1, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, 1, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, 1, -6.677774, 0, 1.5, 0.5, 0.5,
-3.837128, 2, -6.677774, 0, -0.5, 0.5, 0.5,
-3.837128, 2, -6.677774, 1, -0.5, 0.5, 0.5,
-3.837128, 2, -6.677774, 1, 1.5, 0.5, 0.5,
-3.837128, 2, -6.677774, 0, 1.5, 0.5, 0.5
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
-3.363805, -3.374681, -4,
-3.363805, -3.374681, 4,
-3.363805, -3.374681, -4,
-3.52158, -3.534376, -4,
-3.363805, -3.374681, -2,
-3.52158, -3.534376, -2,
-3.363805, -3.374681, 0,
-3.52158, -3.534376, 0,
-3.363805, -3.374681, 2,
-3.52158, -3.534376, 2,
-3.363805, -3.374681, 4,
-3.52158, -3.534376, 4
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
-3.837128, -3.853767, -4, 0, -0.5, 0.5, 0.5,
-3.837128, -3.853767, -4, 1, -0.5, 0.5, 0.5,
-3.837128, -3.853767, -4, 1, 1.5, 0.5, 0.5,
-3.837128, -3.853767, -4, 0, 1.5, 0.5, 0.5,
-3.837128, -3.853767, -2, 0, -0.5, 0.5, 0.5,
-3.837128, -3.853767, -2, 1, -0.5, 0.5, 0.5,
-3.837128, -3.853767, -2, 1, 1.5, 0.5, 0.5,
-3.837128, -3.853767, -2, 0, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 0, 0, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 0, 1, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 0, 1, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 0, 0, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 2, 0, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 2, 1, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 2, 1, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 2, 0, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 4, 0, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 4, 1, -0.5, 0.5, 0.5,
-3.837128, -3.853767, 4, 1, 1.5, 0.5, 0.5,
-3.837128, -3.853767, 4, 0, 1.5, 0.5, 0.5
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
-3.363805, -3.374681, -5.852819,
-3.363805, 3.01313, -5.852819,
-3.363805, -3.374681, 5.146576,
-3.363805, 3.01313, 5.146576,
-3.363805, -3.374681, -5.852819,
-3.363805, -3.374681, 5.146576,
-3.363805, 3.01313, -5.852819,
-3.363805, 3.01313, 5.146576,
-3.363805, -3.374681, -5.852819,
2.947164, -3.374681, -5.852819,
-3.363805, -3.374681, 5.146576,
2.947164, -3.374681, 5.146576,
-3.363805, 3.01313, -5.852819,
2.947164, 3.01313, -5.852819,
-3.363805, 3.01313, 5.146576,
2.947164, 3.01313, 5.146576,
2.947164, -3.374681, -5.852819,
2.947164, 3.01313, -5.852819,
2.947164, -3.374681, 5.146576,
2.947164, 3.01313, 5.146576,
2.947164, -3.374681, -5.852819,
2.947164, -3.374681, 5.146576,
2.947164, 3.01313, -5.852819,
2.947164, 3.01313, 5.146576
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
var radius = 7.582133;
var distance = 33.73376;
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
mvMatrix.translate( 0.2083206, 0.1807752, 0.3531215 );
mvMatrix.scale( 1.299, 1.283374, 0.7453092 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.73376);
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
BMC<-read.table("BMC.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-BMC$V2
```

```
## Error in eval(expr, envir, enclos): object 'BMC' not found
```

```r
y<-BMC$V3
```

```
## Error in eval(expr, envir, enclos): object 'BMC' not found
```

```r
z<-BMC$V4
```

```
## Error in eval(expr, envir, enclos): object 'BMC' not found
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
-3.271898, 0.01428719, -0.8192993, 0, 0, 1, 1, 1,
-2.888017, 1.067316, -1.202752, 1, 0, 0, 1, 1,
-2.852536, 0.0912706, -2.810051, 1, 0, 0, 1, 1,
-2.82565, -0.05662367, -1.896634, 1, 0, 0, 1, 1,
-2.772671, 1.04643, -1.234342, 1, 0, 0, 1, 1,
-2.681726, 0.3097449, -0.9536853, 1, 0, 0, 1, 1,
-2.618094, -1.444599, -2.068234, 0, 0, 0, 1, 1,
-2.504199, 0.1616795, -2.112463, 0, 0, 0, 1, 1,
-2.476356, 1.022993, -0.5821278, 0, 0, 0, 1, 1,
-2.470819, 0.4234113, -1.505258, 0, 0, 0, 1, 1,
-2.330298, 0.6340191, -2.760787, 0, 0, 0, 1, 1,
-2.318922, 0.9625074, -0.1211873, 0, 0, 0, 1, 1,
-2.301275, 0.8493798, -0.02250097, 0, 0, 0, 1, 1,
-2.294619, 2.141886, -0.9031338, 1, 1, 1, 1, 1,
-2.270358, 0.06969247, -1.043193, 1, 1, 1, 1, 1,
-2.242199, -0.9464163, -1.978073, 1, 1, 1, 1, 1,
-2.239236, -0.18748, -4.026175, 1, 1, 1, 1, 1,
-2.210393, -0.7417057, -1.457479, 1, 1, 1, 1, 1,
-2.204807, -2.028807, -3.101269, 1, 1, 1, 1, 1,
-2.203413, 0.9693007, -0.6164562, 1, 1, 1, 1, 1,
-2.183841, 1.254975, -0.4900456, 1, 1, 1, 1, 1,
-2.128108, 0.8809964, -1.36384, 1, 1, 1, 1, 1,
-2.106674, -1.668299, -2.790131, 1, 1, 1, 1, 1,
-2.076373, -0.003272166, -3.451213, 1, 1, 1, 1, 1,
-2.073574, 0.5645431, -0.6551206, 1, 1, 1, 1, 1,
-2.006015, 0.4781576, -1.957401, 1, 1, 1, 1, 1,
-2.005301, -0.4171441, -2.910844, 1, 1, 1, 1, 1,
-1.986704, 0.9331285, -0.1896195, 1, 1, 1, 1, 1,
-1.95127, 0.3929707, -1.248533, 0, 0, 1, 1, 1,
-1.948139, -0.1571493, -1.824529, 1, 0, 0, 1, 1,
-1.944479, -0.4247605, -3.209142, 1, 0, 0, 1, 1,
-1.912068, 0.5450836, -1.570741, 1, 0, 0, 1, 1,
-1.897611, 1.059356, -0.3294651, 1, 0, 0, 1, 1,
-1.889495, -0.1925111, -3.549695, 1, 0, 0, 1, 1,
-1.876234, -0.3755124, -2.6143, 0, 0, 0, 1, 1,
-1.864361, -0.2446487, -0.3651684, 0, 0, 0, 1, 1,
-1.862601, -0.8346299, -3.286031, 0, 0, 0, 1, 1,
-1.840531, -1.923883, -0.01479046, 0, 0, 0, 1, 1,
-1.820932, -1.444291, -2.379687, 0, 0, 0, 1, 1,
-1.801998, 1.187624, -0.06262318, 0, 0, 0, 1, 1,
-1.798353, -0.1789809, -4.637029, 0, 0, 0, 1, 1,
-1.791089, 0.324586, 0.4554525, 1, 1, 1, 1, 1,
-1.767726, 0.8425828, -3.319678, 1, 1, 1, 1, 1,
-1.736135, 0.4119993, 0.1583727, 1, 1, 1, 1, 1,
-1.73407, -0.02184392, -1.725292, 1, 1, 1, 1, 1,
-1.728407, 2.155367, -0.8287817, 1, 1, 1, 1, 1,
-1.714745, -2.51164, -1.142837, 1, 1, 1, 1, 1,
-1.710481, 1.459666, -2.052879, 1, 1, 1, 1, 1,
-1.706406, -1.581897, -3.084796, 1, 1, 1, 1, 1,
-1.701623, 1.725992, -2.812347, 1, 1, 1, 1, 1,
-1.696126, -0.4894502, -0.4007848, 1, 1, 1, 1, 1,
-1.686995, -1.696544, -3.229199, 1, 1, 1, 1, 1,
-1.685845, 0.6580343, -0.6500245, 1, 1, 1, 1, 1,
-1.684569, -0.2593835, -0.7524951, 1, 1, 1, 1, 1,
-1.673143, -1.099999, -3.66764, 1, 1, 1, 1, 1,
-1.671585, 0.7522904, -0.5816138, 1, 1, 1, 1, 1,
-1.660006, 0.5521291, 0.04043074, 0, 0, 1, 1, 1,
-1.652687, 1.147191, -1.148944, 1, 0, 0, 1, 1,
-1.648505, 0.6829067, -1.426149, 1, 0, 0, 1, 1,
-1.648445, 0.09053449, -2.031602, 1, 0, 0, 1, 1,
-1.644189, -0.2466747, -1.963504, 1, 0, 0, 1, 1,
-1.579452, -0.03908403, -1.932362, 1, 0, 0, 1, 1,
-1.578056, -1.181808, -2.600409, 0, 0, 0, 1, 1,
-1.57002, -0.5560643, -1.613679, 0, 0, 0, 1, 1,
-1.567817, 0.4355044, -2.326655, 0, 0, 0, 1, 1,
-1.562637, 1.065448, -1.245565, 0, 0, 0, 1, 1,
-1.553268, 1.074531, -1.671085, 0, 0, 0, 1, 1,
-1.55286, 0.2132678, -1.950977, 0, 0, 0, 1, 1,
-1.545415, 0.2726371, -1.091571, 0, 0, 0, 1, 1,
-1.534763, 0.06643, -1.927546, 1, 1, 1, 1, 1,
-1.528658, -0.5215326, -2.717991, 1, 1, 1, 1, 1,
-1.521468, 1.222958, -1.12055, 1, 1, 1, 1, 1,
-1.51526, -0.2558046, -1.547225, 1, 1, 1, 1, 1,
-1.511302, 0.2470476, -1.570757, 1, 1, 1, 1, 1,
-1.501707, -1.159774, -2.82091, 1, 1, 1, 1, 1,
-1.491692, -1.214585, -3.15798, 1, 1, 1, 1, 1,
-1.490367, -0.6008636, -2.478527, 1, 1, 1, 1, 1,
-1.488945, 0.8870294, -2.065389, 1, 1, 1, 1, 1,
-1.486349, -0.5756731, -3.510241, 1, 1, 1, 1, 1,
-1.475005, 0.04060538, -2.72198, 1, 1, 1, 1, 1,
-1.463543, -0.7152411, -3.436449, 1, 1, 1, 1, 1,
-1.446553, -0.4502309, -0.4091803, 1, 1, 1, 1, 1,
-1.443113, -1.163482, -3.79543, 1, 1, 1, 1, 1,
-1.436933, -0.8542477, -2.358629, 1, 1, 1, 1, 1,
-1.436568, 1.972201, -1.423762, 0, 0, 1, 1, 1,
-1.43556, 0.02324614, -1.342427, 1, 0, 0, 1, 1,
-1.434513, -0.426711, -1.865397, 1, 0, 0, 1, 1,
-1.429795, -0.3518831, -1.579808, 1, 0, 0, 1, 1,
-1.410707, -1.331002, -1.507399, 1, 0, 0, 1, 1,
-1.408402, 0.4843682, -2.569288, 1, 0, 0, 1, 1,
-1.401821, -0.4981028, -1.239498, 0, 0, 0, 1, 1,
-1.397278, 1.054965, -0.8346336, 0, 0, 0, 1, 1,
-1.395482, -1.544593, -3.002881, 0, 0, 0, 1, 1,
-1.392323, -1.210246, -3.252262, 0, 0, 0, 1, 1,
-1.388766, -1.697901, -3.531997, 0, 0, 0, 1, 1,
-1.38222, 0.6447512, -2.621042, 0, 0, 0, 1, 1,
-1.379363, 1.204559, -1.838751, 0, 0, 0, 1, 1,
-1.362899, 0.3832251, -1.484482, 1, 1, 1, 1, 1,
-1.362626, 0.7556267, -1.525003, 1, 1, 1, 1, 1,
-1.356902, 0.1874795, 0.2292684, 1, 1, 1, 1, 1,
-1.355356, 1.932396, -1.09148, 1, 1, 1, 1, 1,
-1.349849, 0.4693958, -0.6073276, 1, 1, 1, 1, 1,
-1.345127, -1.281395, -3.193442, 1, 1, 1, 1, 1,
-1.341706, -1.201373, -2.412917, 1, 1, 1, 1, 1,
-1.333514, -0.4467795, -2.561609, 1, 1, 1, 1, 1,
-1.327665, -2.028083, -1.179794, 1, 1, 1, 1, 1,
-1.323128, -1.287553, -2.572066, 1, 1, 1, 1, 1,
-1.322036, 0.05511625, -0.4721512, 1, 1, 1, 1, 1,
-1.316808, -0.09382482, -0.9011718, 1, 1, 1, 1, 1,
-1.310692, 0.03156857, -2.115484, 1, 1, 1, 1, 1,
-1.30543, 0.03389407, -1.855947, 1, 1, 1, 1, 1,
-1.299641, 0.719348, -0.9332357, 1, 1, 1, 1, 1,
-1.298882, -1.054418, -2.806723, 0, 0, 1, 1, 1,
-1.297057, -2.336244, -2.001441, 1, 0, 0, 1, 1,
-1.294701, 1.495621, -0.897797, 1, 0, 0, 1, 1,
-1.29302, 0.1937992, -0.8839526, 1, 0, 0, 1, 1,
-1.290691, -0.7015094, -2.659018, 1, 0, 0, 1, 1,
-1.284955, 0.3280963, -3.138162, 1, 0, 0, 1, 1,
-1.282881, -1.781431, -1.721331, 0, 0, 0, 1, 1,
-1.276071, -0.9360926, -2.031873, 0, 0, 0, 1, 1,
-1.273433, 0.08443639, -2.729196, 0, 0, 0, 1, 1,
-1.269228, 0.1816276, -0.5195914, 0, 0, 0, 1, 1,
-1.268889, 1.110971, -0.08622233, 0, 0, 0, 1, 1,
-1.261004, -0.9358355, -1.906565, 0, 0, 0, 1, 1,
-1.25152, -0.05669063, -2.649925, 0, 0, 0, 1, 1,
-1.248224, 1.098884, 0.2803065, 1, 1, 1, 1, 1,
-1.23904, 0.1913899, -1.540017, 1, 1, 1, 1, 1,
-1.237279, -0.3103394, -0.9578481, 1, 1, 1, 1, 1,
-1.233107, -0.5409904, -2.193002, 1, 1, 1, 1, 1,
-1.226282, -1.075685, -1.883761, 1, 1, 1, 1, 1,
-1.222821, -0.5796601, -2.531578, 1, 1, 1, 1, 1,
-1.213325, 0.5993739, -0.5195999, 1, 1, 1, 1, 1,
-1.206903, -0.4875173, -2.262063, 1, 1, 1, 1, 1,
-1.206826, 0.1158696, -1.270856, 1, 1, 1, 1, 1,
-1.201722, 0.04799147, -1.494426, 1, 1, 1, 1, 1,
-1.199072, 0.07616176, -0.3624161, 1, 1, 1, 1, 1,
-1.197997, 0.3310146, -2.702626, 1, 1, 1, 1, 1,
-1.197711, -0.001239753, -1.400309, 1, 1, 1, 1, 1,
-1.193251, 0.06765493, -2.684176, 1, 1, 1, 1, 1,
-1.186824, -0.4079772, -1.64709, 1, 1, 1, 1, 1,
-1.183187, -0.01840663, -1.229677, 0, 0, 1, 1, 1,
-1.179061, 1.741698, -1.374807, 1, 0, 0, 1, 1,
-1.162924, -0.712404, -0.8298782, 1, 0, 0, 1, 1,
-1.162145, 0.4086744, -0.468401, 1, 0, 0, 1, 1,
-1.158909, 0.8706933, -0.1774336, 1, 0, 0, 1, 1,
-1.156945, 2.588965, -1.420341, 1, 0, 0, 1, 1,
-1.148632, -0.7456605, -1.563586, 0, 0, 0, 1, 1,
-1.147762, 0.1039164, 0.8664633, 0, 0, 0, 1, 1,
-1.138735, 2.234374, -0.5722651, 0, 0, 0, 1, 1,
-1.132389, 0.6853275, -1.771977, 0, 0, 0, 1, 1,
-1.13081, 0.006336692, -1.453515, 0, 0, 0, 1, 1,
-1.130094, -0.6850068, -2.09281, 0, 0, 0, 1, 1,
-1.127204, -0.1494036, -1.036554, 0, 0, 0, 1, 1,
-1.102025, -1.144443, -1.735267, 1, 1, 1, 1, 1,
-1.101581, -1.531294, -3.768547, 1, 1, 1, 1, 1,
-1.089725, -1.255925, -0.3051034, 1, 1, 1, 1, 1,
-1.085497, -0.777153, -2.385566, 1, 1, 1, 1, 1,
-1.081891, -0.1570489, -1.679317, 1, 1, 1, 1, 1,
-1.080306, 0.553857, -1.215458, 1, 1, 1, 1, 1,
-1.079392, -0.166807, -1.287491, 1, 1, 1, 1, 1,
-1.076834, 0.1579971, -0.7536999, 1, 1, 1, 1, 1,
-1.073312, 1.772613, -0.666194, 1, 1, 1, 1, 1,
-1.069128, -0.9353704, -0.9703531, 1, 1, 1, 1, 1,
-1.068934, -0.2125576, -2.370656, 1, 1, 1, 1, 1,
-1.060359, -0.09197777, -0.3119647, 1, 1, 1, 1, 1,
-1.054166, -0.8528082, -1.323971, 1, 1, 1, 1, 1,
-1.050676, 0.8980058, -3.0405, 1, 1, 1, 1, 1,
-1.046995, -0.3813811, -3.518739, 1, 1, 1, 1, 1,
-1.041416, 1.151707, -0.1665391, 0, 0, 1, 1, 1,
-1.039479, -0.2991548, -2.769619, 1, 0, 0, 1, 1,
-1.037351, 0.3874795, -1.969378, 1, 0, 0, 1, 1,
-1.032932, 0.5912593, -1.458832, 1, 0, 0, 1, 1,
-1.024745, 0.1707833, -0.9992013, 1, 0, 0, 1, 1,
-1.022696, 0.2122755, -2.859106, 1, 0, 0, 1, 1,
-1.022603, -0.5402788, -1.537885, 0, 0, 0, 1, 1,
-1.020974, 0.2953655, -0.6576895, 0, 0, 0, 1, 1,
-1.016787, -0.6567937, -1.891838, 0, 0, 0, 1, 1,
-1.007481, 0.6263172, 0.2307067, 0, 0, 0, 1, 1,
-1.004595, 0.227138, -2.478903, 0, 0, 0, 1, 1,
-1.003734, 1.397924, -0.111595, 0, 0, 0, 1, 1,
-1.001767, -0.8332888, -3.046319, 0, 0, 0, 1, 1,
-0.9892737, 0.925729, -0.9418639, 1, 1, 1, 1, 1,
-0.9872811, -0.1213285, -2.252918, 1, 1, 1, 1, 1,
-0.9854742, -1.038619, -1.209916, 1, 1, 1, 1, 1,
-0.9812012, -0.1869967, -0.2244296, 1, 1, 1, 1, 1,
-0.9668159, 0.0993195, -1.349731, 1, 1, 1, 1, 1,
-0.9631014, 1.997414, -1.149773, 1, 1, 1, 1, 1,
-0.9628462, -0.04982544, -2.157882, 1, 1, 1, 1, 1,
-0.9602863, -0.08865401, -2.094615, 1, 1, 1, 1, 1,
-0.9593635, 0.5426307, -2.417297, 1, 1, 1, 1, 1,
-0.9576791, -0.09205547, -1.657091, 1, 1, 1, 1, 1,
-0.9554483, -1.159029, -3.975132, 1, 1, 1, 1, 1,
-0.9455436, -0.6763461, -1.711228, 1, 1, 1, 1, 1,
-0.9430866, -0.07134106, -2.608679, 1, 1, 1, 1, 1,
-0.9414889, 0.9654146, -1.124885, 1, 1, 1, 1, 1,
-0.9407487, 1.901603, -0.1141842, 1, 1, 1, 1, 1,
-0.9365895, 0.005467849, -0.4761725, 0, 0, 1, 1, 1,
-0.9316736, 1.52376, -0.9433185, 1, 0, 0, 1, 1,
-0.9274544, -1.891022, -4.115747, 1, 0, 0, 1, 1,
-0.9265745, -1.554735, -2.7711, 1, 0, 0, 1, 1,
-0.9181797, 1.016529, -0.6176938, 1, 0, 0, 1, 1,
-0.9110681, -0.93616, -2.154615, 1, 0, 0, 1, 1,
-0.908904, 0.9835352, -1.287443, 0, 0, 0, 1, 1,
-0.9068455, -0.3378729, -0.741158, 0, 0, 0, 1, 1,
-0.8905668, -0.1646213, -0.6351166, 0, 0, 0, 1, 1,
-0.8905342, -0.194346, -1.165896, 0, 0, 0, 1, 1,
-0.8884766, -1.060355, -2.355935, 0, 0, 0, 1, 1,
-0.88612, 1.515353, 0.09990141, 0, 0, 0, 1, 1,
-0.8804178, -0.901363, -1.357944, 0, 0, 0, 1, 1,
-0.8701357, -0.5967124, -1.876284, 1, 1, 1, 1, 1,
-0.8691408, -1.325228, -1.98546, 1, 1, 1, 1, 1,
-0.8671943, -0.5193453, -3.574958, 1, 1, 1, 1, 1,
-0.8623354, -0.02230008, 0.7108175, 1, 1, 1, 1, 1,
-0.8601035, 0.4887783, -0.7863711, 1, 1, 1, 1, 1,
-0.8589628, -0.3333517, -2.55042, 1, 1, 1, 1, 1,
-0.8585131, -0.7732092, -1.959576, 1, 1, 1, 1, 1,
-0.8577584, 1.358832, 0.7054651, 1, 1, 1, 1, 1,
-0.8570191, 0.6833017, -1.210064, 1, 1, 1, 1, 1,
-0.8476217, 0.577651, -2.342287, 1, 1, 1, 1, 1,
-0.842375, 0.5243627, -2.025596, 1, 1, 1, 1, 1,
-0.8414849, -0.9694746, -2.617929, 1, 1, 1, 1, 1,
-0.8401207, -0.7279626, -2.667672, 1, 1, 1, 1, 1,
-0.8368031, 1.90998, -1.142702, 1, 1, 1, 1, 1,
-0.8354862, -1.101125, -2.572483, 1, 1, 1, 1, 1,
-0.8332412, 1.451667, -2.12131, 0, 0, 1, 1, 1,
-0.83131, 0.4032862, -2.070136, 1, 0, 0, 1, 1,
-0.822228, 0.06840771, 0.6969252, 1, 0, 0, 1, 1,
-0.8202592, 0.2815509, -2.027454, 1, 0, 0, 1, 1,
-0.818469, -0.452649, -2.523519, 1, 0, 0, 1, 1,
-0.8137385, -0.7867743, -1.882149, 1, 0, 0, 1, 1,
-0.8053768, 0.5615712, -0.8398202, 0, 0, 0, 1, 1,
-0.7907799, 0.4774355, -2.833557, 0, 0, 0, 1, 1,
-0.7891058, -1.545618, -3.207309, 0, 0, 0, 1, 1,
-0.7877627, 1.221181, -3.368201, 0, 0, 0, 1, 1,
-0.7869365, 1.259564, -0.9680446, 0, 0, 0, 1, 1,
-0.7846783, -0.9300092, -2.910295, 0, 0, 0, 1, 1,
-0.7845603, 1.314225, -3.517987, 0, 0, 0, 1, 1,
-0.7844971, -0.8174566, -3.02494, 1, 1, 1, 1, 1,
-0.7829831, -0.7034343, -1.704693, 1, 1, 1, 1, 1,
-0.7812628, 0.2446438, -0.06434701, 1, 1, 1, 1, 1,
-0.7739201, 1.116752, -1.293989, 1, 1, 1, 1, 1,
-0.7735403, 0.5967291, -0.6201115, 1, 1, 1, 1, 1,
-0.7718145, -0.2372759, -2.360479, 1, 1, 1, 1, 1,
-0.7696146, 0.3247411, -0.2303942, 1, 1, 1, 1, 1,
-0.7642605, -0.623574, -4.442735, 1, 1, 1, 1, 1,
-0.7583637, 1.512434, -1.762309, 1, 1, 1, 1, 1,
-0.7447228, 0.07509192, -0.9331728, 1, 1, 1, 1, 1,
-0.7407855, -1.228668, -2.94214, 1, 1, 1, 1, 1,
-0.7373749, 1.911426, -1.267444, 1, 1, 1, 1, 1,
-0.7356111, 0.2154075, -2.519149, 1, 1, 1, 1, 1,
-0.7348371, 0.3440882, -0.1042333, 1, 1, 1, 1, 1,
-0.7333181, 0.4248505, -2.144968, 1, 1, 1, 1, 1,
-0.7201445, 0.7904934, -0.3713629, 0, 0, 1, 1, 1,
-0.716659, 0.2683375, -1.525309, 1, 0, 0, 1, 1,
-0.7092695, 1.533005, -0.5966153, 1, 0, 0, 1, 1,
-0.7052853, 0.05322846, -2.82714, 1, 0, 0, 1, 1,
-0.703934, -0.2559826, -3.951111, 1, 0, 0, 1, 1,
-0.7013113, -0.1649636, -1.623554, 1, 0, 0, 1, 1,
-0.6994847, 1.122652, -0.6649798, 0, 0, 0, 1, 1,
-0.6985047, -0.5322009, -4.71945, 0, 0, 0, 1, 1,
-0.6966622, 0.2712712, -2.136022, 0, 0, 0, 1, 1,
-0.6947643, -0.1756574, -2.423659, 0, 0, 0, 1, 1,
-0.6919104, -1.10726, -2.125132, 0, 0, 0, 1, 1,
-0.683234, -0.9253696, -2.960023, 0, 0, 0, 1, 1,
-0.6808839, 0.8527076, -1.009528, 0, 0, 0, 1, 1,
-0.679524, -1.871352, -2.162633, 1, 1, 1, 1, 1,
-0.6776221, 1.223346, -0.4637829, 1, 1, 1, 1, 1,
-0.6711683, -1.302094, -4.37076, 1, 1, 1, 1, 1,
-0.670988, -0.6762431, -2.095615, 1, 1, 1, 1, 1,
-0.6693028, 0.03023849, -1.258123, 1, 1, 1, 1, 1,
-0.6669231, -1.49211, -2.335636, 1, 1, 1, 1, 1,
-0.664962, 1.01063, -0.4506527, 1, 1, 1, 1, 1,
-0.6614965, 0.007145666, -2.20585, 1, 1, 1, 1, 1,
-0.6578996, 1.337739, -1.485347, 1, 1, 1, 1, 1,
-0.6540443, 0.2488661, -2.685698, 1, 1, 1, 1, 1,
-0.6539748, -0.5294349, -2.99, 1, 1, 1, 1, 1,
-0.6518233, 1.176329, -0.9753745, 1, 1, 1, 1, 1,
-0.6507531, -1.642537, -3.463272, 1, 1, 1, 1, 1,
-0.6485165, -0.3850852, -2.406435, 1, 1, 1, 1, 1,
-0.6476693, -0.2038205, -2.949082, 1, 1, 1, 1, 1,
-0.6436431, 0.05259767, 0.1707304, 0, 0, 1, 1, 1,
-0.6424994, 0.685454, -1.422979, 1, 0, 0, 1, 1,
-0.6424979, 0.8328734, -1.494295, 1, 0, 0, 1, 1,
-0.6421295, 0.1935058, -1.079999, 1, 0, 0, 1, 1,
-0.6407939, 0.4769363, -2.113538, 1, 0, 0, 1, 1,
-0.638175, 1.334548, -0.2857132, 1, 0, 0, 1, 1,
-0.6323314, -1.446592, -3.76109, 0, 0, 0, 1, 1,
-0.6266571, 0.2336322, -1.116965, 0, 0, 0, 1, 1,
-0.6165873, 0.8188231, 0.08595201, 0, 0, 0, 1, 1,
-0.6154117, 0.457488, -1.104176, 0, 0, 0, 1, 1,
-0.6133446, 0.0363773, -0.7403468, 0, 0, 0, 1, 1,
-0.6076601, 1.697798, -0.9708228, 0, 0, 0, 1, 1,
-0.6023348, 1.755626, 1.32912, 0, 0, 0, 1, 1,
-0.5941339, 0.1262912, -0.8466225, 1, 1, 1, 1, 1,
-0.5907536, -0.7308433, -4.000013, 1, 1, 1, 1, 1,
-0.5889653, 1.996936, -1.028356, 1, 1, 1, 1, 1,
-0.587358, -0.6104617, -1.740366, 1, 1, 1, 1, 1,
-0.5828493, 0.9381365, -1.351097, 1, 1, 1, 1, 1,
-0.5805341, 2.371436, 0.5274063, 1, 1, 1, 1, 1,
-0.5764617, 2.046301, -0.8183743, 1, 1, 1, 1, 1,
-0.5730002, 1.413874, -0.7899259, 1, 1, 1, 1, 1,
-0.5724908, 0.2939303, -2.304034, 1, 1, 1, 1, 1,
-0.5698987, 0.4751401, 0.404573, 1, 1, 1, 1, 1,
-0.5687689, 1.838091, 0.1180955, 1, 1, 1, 1, 1,
-0.5650845, -0.3934726, -3.615078, 1, 1, 1, 1, 1,
-0.5633146, 1.144742, -0.3929138, 1, 1, 1, 1, 1,
-0.5603278, -0.03214055, -0.9633201, 1, 1, 1, 1, 1,
-0.5578482, 0.7720585, -0.8724421, 1, 1, 1, 1, 1,
-0.5578241, 1.082781, 1.33305, 0, 0, 1, 1, 1,
-0.5571539, -1.536362, -1.112456, 1, 0, 0, 1, 1,
-0.5530336, 0.538874, -1.716859, 1, 0, 0, 1, 1,
-0.5523388, -0.972506, -2.01614, 1, 0, 0, 1, 1,
-0.5513226, -0.1713087, -0.5827388, 1, 0, 0, 1, 1,
-0.5503712, 0.2348802, 0.2385166, 1, 0, 0, 1, 1,
-0.5486628, 0.4668691, 1.32923, 0, 0, 0, 1, 1,
-0.5450078, 0.4308721, -0.8498427, 0, 0, 0, 1, 1,
-0.5442472, -1.877569, -4.1506, 0, 0, 0, 1, 1,
-0.5433147, 2.199935, -0.2603772, 0, 0, 0, 1, 1,
-0.5427852, 0.3292432, -2.007046, 0, 0, 0, 1, 1,
-0.5412958, -0.7486079, -2.68459, 0, 0, 0, 1, 1,
-0.5388499, -0.07176948, -2.262163, 0, 0, 0, 1, 1,
-0.5362018, -1.765976, -4.180309, 1, 1, 1, 1, 1,
-0.5312138, -0.6842365, -3.69961, 1, 1, 1, 1, 1,
-0.5245094, 0.2870473, -2.841676, 1, 1, 1, 1, 1,
-0.522751, -0.5287349, -2.64197, 1, 1, 1, 1, 1,
-0.5226799, -0.4073127, -3.36702, 1, 1, 1, 1, 1,
-0.5209712, 0.5225754, -1.102832, 1, 1, 1, 1, 1,
-0.520161, 0.07062501, -1.281197, 1, 1, 1, 1, 1,
-0.519644, -1.256521, -2.652426, 1, 1, 1, 1, 1,
-0.5193685, -0.3109288, -2.225627, 1, 1, 1, 1, 1,
-0.5180791, 0.8910309, 0.09976859, 1, 1, 1, 1, 1,
-0.5142682, -0.7692422, -0.6720151, 1, 1, 1, 1, 1,
-0.5111178, -0.1861053, -3.284137, 1, 1, 1, 1, 1,
-0.5032856, -2.139925, -1.5791, 1, 1, 1, 1, 1,
-0.5021497, -0.6772721, -2.15862, 1, 1, 1, 1, 1,
-0.4993375, -0.4161366, -1.394444, 1, 1, 1, 1, 1,
-0.4992347, 2.734738, -0.5731118, 0, 0, 1, 1, 1,
-0.4915604, -0.3975059, -1.33594, 1, 0, 0, 1, 1,
-0.4891713, -0.784144, -2.385324, 1, 0, 0, 1, 1,
-0.4882903, -0.167438, -3.00672, 1, 0, 0, 1, 1,
-0.4815466, 0.7838606, -1.151732, 1, 0, 0, 1, 1,
-0.4806204, 0.5426962, -0.06741237, 1, 0, 0, 1, 1,
-0.4771267, -1.736709, -0.9669384, 0, 0, 0, 1, 1,
-0.4517853, -1.376273, -3.243705, 0, 0, 0, 1, 1,
-0.4507323, -0.5818252, -3.050818, 0, 0, 0, 1, 1,
-0.4495719, -0.9502504, -3.726836, 0, 0, 0, 1, 1,
-0.4442739, 1.558864, -2.55614, 0, 0, 0, 1, 1,
-0.4440168, -1.127548, -1.757922, 0, 0, 0, 1, 1,
-0.441338, -0.6600066, -4.297302, 0, 0, 0, 1, 1,
-0.4271933, -0.2297029, -2.762428, 1, 1, 1, 1, 1,
-0.4252811, -0.3084225, -4.039933, 1, 1, 1, 1, 1,
-0.4241055, -1.334195, -3.460544, 1, 1, 1, 1, 1,
-0.4239359, 0.3576666, 0.6702954, 1, 1, 1, 1, 1,
-0.4237774, -1.818805, -3.037183, 1, 1, 1, 1, 1,
-0.4199297, -2.140699, -2.901932, 1, 1, 1, 1, 1,
-0.418997, 1.139861, 0.4658079, 1, 1, 1, 1, 1,
-0.418465, 0.1167747, -0.826858, 1, 1, 1, 1, 1,
-0.4184447, 0.857488, -2.005626, 1, 1, 1, 1, 1,
-0.4170833, 2.245496, -0.1596417, 1, 1, 1, 1, 1,
-0.4168518, -1.065141, -4.236452, 1, 1, 1, 1, 1,
-0.4156154, 0.09748815, -1.881101, 1, 1, 1, 1, 1,
-0.4142214, -0.4918145, -3.647677, 1, 1, 1, 1, 1,
-0.4117719, -1.780161, -2.565191, 1, 1, 1, 1, 1,
-0.4089843, -2.194799, -1.38045, 1, 1, 1, 1, 1,
-0.4087291, -0.03270093, -0.3446682, 0, 0, 1, 1, 1,
-0.4056506, 0.1740218, -1.218065, 1, 0, 0, 1, 1,
-0.4011604, -0.04856345, -1.692981, 1, 0, 0, 1, 1,
-0.3936167, -0.1379434, -1.676748, 1, 0, 0, 1, 1,
-0.3833781, 0.01306369, -0.2650961, 1, 0, 0, 1, 1,
-0.3819774, -2.023468, -3.793979, 1, 0, 0, 1, 1,
-0.3788288, 0.4873717, 0.9375716, 0, 0, 0, 1, 1,
-0.377771, 0.1150262, -2.579612, 0, 0, 0, 1, 1,
-0.3760857, -0.400068, -1.791409, 0, 0, 0, 1, 1,
-0.376039, -1.299155, -3.557046, 0, 0, 0, 1, 1,
-0.3757965, -1.992621, -2.968291, 0, 0, 0, 1, 1,
-0.3746776, -0.8571095, -2.540737, 0, 0, 0, 1, 1,
-0.3697082, -1.022679, -3.127986, 0, 0, 0, 1, 1,
-0.3668097, -0.9550346, -2.153205, 1, 1, 1, 1, 1,
-0.3619407, 0.8498569, 0.05174034, 1, 1, 1, 1, 1,
-0.3545109, -1.204919, -4.398655, 1, 1, 1, 1, 1,
-0.3538315, 0.7598733, -0.6370385, 1, 1, 1, 1, 1,
-0.3537949, -0.2794994, -1.086899, 1, 1, 1, 1, 1,
-0.3485055, 0.08366443, -2.660932, 1, 1, 1, 1, 1,
-0.3461963, -0.02233153, -2.835643, 1, 1, 1, 1, 1,
-0.3443373, -1.362983, -3.032693, 1, 1, 1, 1, 1,
-0.3392935, 1.132912, 0.3863912, 1, 1, 1, 1, 1,
-0.3372177, 1.084728, 0.2557924, 1, 1, 1, 1, 1,
-0.3362146, -0.7434825, -1.196585, 1, 1, 1, 1, 1,
-0.3329776, -0.8642401, -2.129541, 1, 1, 1, 1, 1,
-0.3286462, -0.06192428, -2.054777, 1, 1, 1, 1, 1,
-0.3279281, -1.734522, -3.40704, 1, 1, 1, 1, 1,
-0.323239, 0.8779092, -0.3197978, 1, 1, 1, 1, 1,
-0.3219922, -1.883354, -3.397344, 0, 0, 1, 1, 1,
-0.3100855, 0.2076049, -0.4495154, 1, 0, 0, 1, 1,
-0.3060176, -1.340912, -1.764636, 1, 0, 0, 1, 1,
-0.3058942, -0.8627655, -2.186005, 1, 0, 0, 1, 1,
-0.3002952, -0.6871303, -1.458006, 1, 0, 0, 1, 1,
-0.3002941, 0.8208795, 0.98689, 1, 0, 0, 1, 1,
-0.30029, 0.2603045, -2.295398, 0, 0, 0, 1, 1,
-0.2959999, 0.6001906, -0.2983687, 0, 0, 0, 1, 1,
-0.2937162, -0.5355211, -2.002649, 0, 0, 0, 1, 1,
-0.2932108, -0.5198601, -2.075774, 0, 0, 0, 1, 1,
-0.2881849, -0.199448, -2.399412, 0, 0, 0, 1, 1,
-0.2864981, 0.2338993, -0.3163961, 0, 0, 0, 1, 1,
-0.2834397, 1.529438, -0.6486205, 0, 0, 0, 1, 1,
-0.2826686, 1.589412, -1.76691, 1, 1, 1, 1, 1,
-0.2804437, -1.594247, -4.871084, 1, 1, 1, 1, 1,
-0.2788005, -0.8345977, -3.567929, 1, 1, 1, 1, 1,
-0.2738653, -0.2388869, -0.6633582, 1, 1, 1, 1, 1,
-0.2727484, -0.981517, -3.116165, 1, 1, 1, 1, 1,
-0.270694, 2.176727, -0.3545269, 1, 1, 1, 1, 1,
-0.2696237, 0.9598659, 0.1893718, 1, 1, 1, 1, 1,
-0.2694349, 0.9076979, -0.8992987, 1, 1, 1, 1, 1,
-0.2658571, 0.2901744, -1.391773, 1, 1, 1, 1, 1,
-0.2613766, 0.7268302, -0.2491165, 1, 1, 1, 1, 1,
-0.2587616, 0.7390559, -1.051725, 1, 1, 1, 1, 1,
-0.2545778, 1.054978, -0.06744342, 1, 1, 1, 1, 1,
-0.2515295, 0.7776583, -0.9238338, 1, 1, 1, 1, 1,
-0.2514521, 0.6280413, -1.918065, 1, 1, 1, 1, 1,
-0.2462208, 0.2509272, 0.1096773, 1, 1, 1, 1, 1,
-0.2445786, -1.301874, -2.677317, 0, 0, 1, 1, 1,
-0.243857, 0.01257814, -2.212276, 1, 0, 0, 1, 1,
-0.2407837, -2.390462, -4.235913, 1, 0, 0, 1, 1,
-0.2391952, 0.7292088, 0.6634874, 1, 0, 0, 1, 1,
-0.237832, 0.3465261, -0.3824766, 1, 0, 0, 1, 1,
-0.2377634, -1.629541, -3.371842, 1, 0, 0, 1, 1,
-0.2359015, -0.8493324, -1.404733, 0, 0, 0, 1, 1,
-0.2337217, -0.5768352, -2.655911, 0, 0, 0, 1, 1,
-0.2302201, 1.668222, -0.6684316, 0, 0, 0, 1, 1,
-0.2275977, -0.7243987, -5.692634, 0, 0, 0, 1, 1,
-0.2275198, 0.03230765, -2.212665, 0, 0, 0, 1, 1,
-0.2275008, 1.108702, 1.931378, 0, 0, 0, 1, 1,
-0.2200736, -0.0472406, -1.44259, 0, 0, 0, 1, 1,
-0.2189008, -0.4389219, -2.371701, 1, 1, 1, 1, 1,
-0.2158705, -0.5908151, -1.482358, 1, 1, 1, 1, 1,
-0.2152563, -0.2677507, -1.796029, 1, 1, 1, 1, 1,
-0.2087931, -2.050697, -1.002225, 1, 1, 1, 1, 1,
-0.2064628, -1.723553, -1.855206, 1, 1, 1, 1, 1,
-0.2052511, -0.8875748, -4.002865, 1, 1, 1, 1, 1,
-0.2040201, -1.081814, -2.827816, 1, 1, 1, 1, 1,
-0.1977654, 0.08178605, 0.10817, 1, 1, 1, 1, 1,
-0.1974543, -0.2172554, -3.309591, 1, 1, 1, 1, 1,
-0.1967085, 0.09099389, -0.9146035, 1, 1, 1, 1, 1,
-0.1819959, -1.28006, -2.983662, 1, 1, 1, 1, 1,
-0.1819394, 1.898534, 0.6505476, 1, 1, 1, 1, 1,
-0.1815501, -1.704862, -2.698619, 1, 1, 1, 1, 1,
-0.1644963, -0.7330009, -0.8590916, 1, 1, 1, 1, 1,
-0.1623108, -0.7951331, -2.0151, 1, 1, 1, 1, 1,
-0.161352, 0.5849299, -0.2450246, 0, 0, 1, 1, 1,
-0.1605207, 1.473348, -2.135794, 1, 0, 0, 1, 1,
-0.1600462, 0.3636942, -0.3526334, 1, 0, 0, 1, 1,
-0.1568174, -0.7741414, -1.547634, 1, 0, 0, 1, 1,
-0.1517003, -0.1016598, -0.4596795, 1, 0, 0, 1, 1,
-0.1473168, 0.4807017, 1.031631, 1, 0, 0, 1, 1,
-0.1471354, 1.077072, -0.02766329, 0, 0, 0, 1, 1,
-0.1425637, 0.23563, -0.8158641, 0, 0, 0, 1, 1,
-0.1423901, -0.8437932, -2.501038, 0, 0, 0, 1, 1,
-0.1410476, 0.5835628, -0.2706421, 0, 0, 0, 1, 1,
-0.140733, -1.389041, -4.86403, 0, 0, 0, 1, 1,
-0.1381472, -0.3166586, -2.24768, 0, 0, 0, 1, 1,
-0.1365301, 1.955649, 0.07015291, 0, 0, 0, 1, 1,
-0.1290211, -0.03827511, -1.769215, 1, 1, 1, 1, 1,
-0.1258851, -0.1619267, -2.56012, 1, 1, 1, 1, 1,
-0.1239334, 0.2116551, -2.152841, 1, 1, 1, 1, 1,
-0.122983, -1.365809, -2.080998, 1, 1, 1, 1, 1,
-0.1205075, -1.739917, -4.109972, 1, 1, 1, 1, 1,
-0.1191537, 0.4399519, 0.5410582, 1, 1, 1, 1, 1,
-0.1105365, 1.146265, -0.5121877, 1, 1, 1, 1, 1,
-0.1105317, 0.6566776, -1.733046, 1, 1, 1, 1, 1,
-0.105535, 2.920104, 1.941203, 1, 1, 1, 1, 1,
-0.105136, 0.5561627, -0.5628169, 1, 1, 1, 1, 1,
-0.1049266, -0.5849323, -4.613584, 1, 1, 1, 1, 1,
-0.1049157, 1.352168, -2.439774, 1, 1, 1, 1, 1,
-0.1042875, 0.3421573, 0.5151222, 1, 1, 1, 1, 1,
-0.09694741, 0.8326825, -0.04271109, 1, 1, 1, 1, 1,
-0.09658891, -1.249904, -1.602887, 1, 1, 1, 1, 1,
-0.09144315, 0.3503209, 0.08547735, 0, 0, 1, 1, 1,
-0.09032639, -0.1165456, -1.88538, 1, 0, 0, 1, 1,
-0.08142105, -0.4752053, -2.318868, 1, 0, 0, 1, 1,
-0.08095216, 1.526021, -0.3718182, 1, 0, 0, 1, 1,
-0.07877806, -0.9792425, -3.949251, 1, 0, 0, 1, 1,
-0.07798672, 1.559338, 0.9434378, 1, 0, 0, 1, 1,
-0.07359304, 1.702532, 0.2375105, 0, 0, 0, 1, 1,
-0.0668858, 0.3618395, 0.3263189, 0, 0, 0, 1, 1,
-0.06464367, -1.069255, -2.476396, 0, 0, 0, 1, 1,
-0.06096413, 2.31231, -0.8950394, 0, 0, 0, 1, 1,
-0.06001862, 1.516224, 1.001884, 0, 0, 0, 1, 1,
-0.05395643, -0.8946137, -1.918527, 0, 0, 0, 1, 1,
-0.04334182, 1.703775, -1.328061, 0, 0, 0, 1, 1,
-0.03736237, 0.8619412, -1.258315, 1, 1, 1, 1, 1,
-0.03722572, 1.457391, 2.184375, 1, 1, 1, 1, 1,
-0.03459189, 0.2376125, -0.06200665, 1, 1, 1, 1, 1,
-0.03412282, 0.6313379, -1.074202, 1, 1, 1, 1, 1,
-0.01897515, -0.8392304, -4.725167, 1, 1, 1, 1, 1,
-0.01358863, 1.286902, -0.1810033, 1, 1, 1, 1, 1,
-0.01302066, -0.4250547, -4.244919, 1, 1, 1, 1, 1,
-0.01300828, 0.6495235, 0.8844759, 1, 1, 1, 1, 1,
-0.01213214, 0.04742675, -0.4111407, 1, 1, 1, 1, 1,
-0.005297837, -0.578465, -2.998005, 1, 1, 1, 1, 1,
-0.003713051, -0.7728073, -3.065119, 1, 1, 1, 1, 1,
-0.001582626, 0.7852322, -0.8759197, 1, 1, 1, 1, 1,
0.004594588, -0.4759511, 4.113867, 1, 1, 1, 1, 1,
0.007439482, 0.7940924, -0.2350301, 1, 1, 1, 1, 1,
0.009693009, -0.999772, 2.100819, 1, 1, 1, 1, 1,
0.01438338, -0.07518963, 4.233438, 0, 0, 1, 1, 1,
0.01487636, 0.454109, -2.045411, 1, 0, 0, 1, 1,
0.01645209, 0.01996446, 1.209628, 1, 0, 0, 1, 1,
0.02557781, -0.1898003, 3.588296, 1, 0, 0, 1, 1,
0.02696363, -0.9684033, 2.775737, 1, 0, 0, 1, 1,
0.03213995, -0.5188889, 3.788207, 1, 0, 0, 1, 1,
0.0381587, 0.1169428, -0.9118173, 0, 0, 0, 1, 1,
0.04433275, -0.9255949, 3.34392, 0, 0, 0, 1, 1,
0.05458273, 0.6131312, 1.616867, 0, 0, 0, 1, 1,
0.0545836, -0.5771075, 3.82659, 0, 0, 0, 1, 1,
0.05994222, 0.5600696, 0.7385982, 0, 0, 0, 1, 1,
0.06308556, 0.2457049, 1.869825, 0, 0, 0, 1, 1,
0.06479406, 0.7862015, -1.059441, 0, 0, 0, 1, 1,
0.0651141, -0.2029946, 2.724672, 1, 1, 1, 1, 1,
0.06653799, 1.838908, -0.9419299, 1, 1, 1, 1, 1,
0.06840765, -0.1837494, 1.994142, 1, 1, 1, 1, 1,
0.07033697, -1.51803, 3.607685, 1, 1, 1, 1, 1,
0.07081489, 0.7196246, -0.7409962, 1, 1, 1, 1, 1,
0.07350704, 2.775265, 0.5336091, 1, 1, 1, 1, 1,
0.07371592, 0.1173709, 0.8355469, 1, 1, 1, 1, 1,
0.07496202, 1.84273, -0.05670234, 1, 1, 1, 1, 1,
0.07590627, -0.6119979, 2.841606, 1, 1, 1, 1, 1,
0.0790845, -0.1256077, 3.115222, 1, 1, 1, 1, 1,
0.08503914, -0.929917, 3.480633, 1, 1, 1, 1, 1,
0.08665228, -0.005349967, 2.494917, 1, 1, 1, 1, 1,
0.08967217, 0.6526969, 0.2753359, 1, 1, 1, 1, 1,
0.09231459, 1.281891, 0.8255013, 1, 1, 1, 1, 1,
0.09500106, -0.00842536, 2.582806, 1, 1, 1, 1, 1,
0.1063289, 0.01804685, 1.735824, 0, 0, 1, 1, 1,
0.1093847, 0.006380056, 1.815709, 1, 0, 0, 1, 1,
0.1164531, 0.6098179, -0.06549034, 1, 0, 0, 1, 1,
0.1176777, 1.588852, 0.4054645, 1, 0, 0, 1, 1,
0.1191238, -0.3054586, 2.569161, 1, 0, 0, 1, 1,
0.1232631, 0.8160772, -0.290289, 1, 0, 0, 1, 1,
0.1300196, 0.2033167, -0.03933659, 0, 0, 0, 1, 1,
0.1302782, 0.7858512, -0.2973035, 0, 0, 0, 1, 1,
0.1313036, 0.2620189, -2.669724, 0, 0, 0, 1, 1,
0.1313569, 0.2330303, -0.2433811, 0, 0, 0, 1, 1,
0.1335292, 1.487581, -0.9138709, 0, 0, 0, 1, 1,
0.1407834, -0.8351645, 2.928888, 0, 0, 0, 1, 1,
0.1435845, -0.4192414, 2.777022, 0, 0, 0, 1, 1,
0.1479353, -0.4280685, 3.936188, 1, 1, 1, 1, 1,
0.1515603, -1.134711, 3.251502, 1, 1, 1, 1, 1,
0.1549203, -1.759441, 3.830818, 1, 1, 1, 1, 1,
0.1637322, 0.358648, -1.674551, 1, 1, 1, 1, 1,
0.1641406, -0.5101078, 3.119647, 1, 1, 1, 1, 1,
0.1744744, -0.451272, 0.9400064, 1, 1, 1, 1, 1,
0.176295, -0.108299, 1.093877, 1, 1, 1, 1, 1,
0.180437, 0.1010353, -0.1516639, 1, 1, 1, 1, 1,
0.1815209, -0.9164706, 2.637057, 1, 1, 1, 1, 1,
0.1825953, 0.9706535, 1.533579, 1, 1, 1, 1, 1,
0.186644, 1.099699, 0.4239101, 1, 1, 1, 1, 1,
0.1871411, 0.8871055, -0.3747457, 1, 1, 1, 1, 1,
0.1972365, -1.216204, 2.806154, 1, 1, 1, 1, 1,
0.1984487, -0.002619413, 1.507376, 1, 1, 1, 1, 1,
0.1991294, -0.5674673, 1.446827, 1, 1, 1, 1, 1,
0.199437, -1.220484, 1.838501, 0, 0, 1, 1, 1,
0.2010763, 0.2489164, 0.7803909, 1, 0, 0, 1, 1,
0.2021974, -0.1372044, 1.252, 1, 0, 0, 1, 1,
0.2023517, -1.231635, 1.180174, 1, 0, 0, 1, 1,
0.2039657, -1.432341, 4.986391, 1, 0, 0, 1, 1,
0.2104345, 0.05483658, 2.270195, 1, 0, 0, 1, 1,
0.2178335, 0.561618, -0.1073527, 0, 0, 0, 1, 1,
0.2204478, -1.994662, 3.753268, 0, 0, 0, 1, 1,
0.2219961, 0.9873072, 0.5120426, 0, 0, 0, 1, 1,
0.2276487, -0.9852527, 3.360162, 0, 0, 0, 1, 1,
0.2303085, -0.5876113, 2.137482, 0, 0, 0, 1, 1,
0.2338738, -0.2978639, 2.301391, 0, 0, 0, 1, 1,
0.2352474, 1.614079, 0.5664042, 0, 0, 0, 1, 1,
0.2507029, -1.029372, 3.559189, 1, 1, 1, 1, 1,
0.2539881, 1.84696, -0.3912869, 1, 1, 1, 1, 1,
0.2561557, -1.128681, 2.951721, 1, 1, 1, 1, 1,
0.2608907, -0.4342563, 3.871544, 1, 1, 1, 1, 1,
0.2615352, -0.8398166, 4.232162, 1, 1, 1, 1, 1,
0.262228, -0.6960939, 2.938624, 1, 1, 1, 1, 1,
0.2692433, -1.049509, 3.489147, 1, 1, 1, 1, 1,
0.2727469, -1.583267, 3.01003, 1, 1, 1, 1, 1,
0.2746809, 0.2368346, 0.3125319, 1, 1, 1, 1, 1,
0.2751541, -1.22068, 2.324577, 1, 1, 1, 1, 1,
0.2763573, -1.902755, 3.118196, 1, 1, 1, 1, 1,
0.2782202, 2.079182, -2.025384, 1, 1, 1, 1, 1,
0.2788919, 0.5650778, -0.1588265, 1, 1, 1, 1, 1,
0.2794184, 0.8536679, 0.6649844, 1, 1, 1, 1, 1,
0.2798685, 1.490397, -0.5168591, 1, 1, 1, 1, 1,
0.2802926, -0.585879, 1.538407, 0, 0, 1, 1, 1,
0.282442, 0.04287121, 2.02844, 1, 0, 0, 1, 1,
0.2846243, -1.051198, 1.720652, 1, 0, 0, 1, 1,
0.2912299, -0.458562, 1.399871, 1, 0, 0, 1, 1,
0.2924065, 0.9493721, 0.6532173, 1, 0, 0, 1, 1,
0.2958701, 0.4898655, 1.270194, 1, 0, 0, 1, 1,
0.2970053, -0.05475494, 1.66323, 0, 0, 0, 1, 1,
0.2984991, -0.3987426, 4.580058, 0, 0, 0, 1, 1,
0.3046802, -1.514172, 1.977102, 0, 0, 0, 1, 1,
0.3071222, 0.1086974, -1.024341, 0, 0, 0, 1, 1,
0.3114885, -1.652204, 3.472848, 0, 0, 0, 1, 1,
0.3118489, -1.744567, 1.930151, 0, 0, 0, 1, 1,
0.3161421, 0.144499, 1.769973, 0, 0, 0, 1, 1,
0.31806, -0.2847031, 2.977926, 1, 1, 1, 1, 1,
0.3188964, 0.04734348, 1.985599, 1, 1, 1, 1, 1,
0.320485, 1.56604, -0.8032919, 1, 1, 1, 1, 1,
0.3235464, 0.1797758, 0.4593664, 1, 1, 1, 1, 1,
0.3277346, 0.935369, 1.401003, 1, 1, 1, 1, 1,
0.3307026, 0.04845207, 4.01281, 1, 1, 1, 1, 1,
0.3348063, -0.5517786, 4.070196, 1, 1, 1, 1, 1,
0.3362635, -0.2913504, 2.101758, 1, 1, 1, 1, 1,
0.3388183, -0.008101817, 1.3336, 1, 1, 1, 1, 1,
0.3389398, 0.3673081, 1.431695, 1, 1, 1, 1, 1,
0.3390851, 0.1648749, 3.460748, 1, 1, 1, 1, 1,
0.3400642, -0.06175, 0.7491423, 1, 1, 1, 1, 1,
0.3557251, -0.01312029, 3.766738, 1, 1, 1, 1, 1,
0.3589573, -0.2762732, 1.289293, 1, 1, 1, 1, 1,
0.3623391, 0.3747838, 0.971559, 1, 1, 1, 1, 1,
0.363568, 1.197255, -1.017283, 0, 0, 1, 1, 1,
0.3647935, -0.005849932, 3.053593, 1, 0, 0, 1, 1,
0.3818786, 1.025374, 1.14784, 1, 0, 0, 1, 1,
0.3850732, 0.5305245, 0.7426264, 1, 0, 0, 1, 1,
0.3854195, 0.994827, -0.2024083, 1, 0, 0, 1, 1,
0.3857844, -0.1209413, 1.205295, 1, 0, 0, 1, 1,
0.3866093, 1.110724, -1.415785, 0, 0, 0, 1, 1,
0.396796, -1.782114, 2.902203, 0, 0, 0, 1, 1,
0.3970601, -0.1807958, 1.009955, 0, 0, 0, 1, 1,
0.3985215, -1.8707, 2.813761, 0, 0, 0, 1, 1,
0.3993545, 0.937271, -1.34662, 0, 0, 0, 1, 1,
0.4060916, -0.4458535, 2.953595, 0, 0, 0, 1, 1,
0.4082986, -0.4179505, 2.2388, 0, 0, 0, 1, 1,
0.4152854, 0.1414331, 0.3945953, 1, 1, 1, 1, 1,
0.4178529, -1.4907, 4.609682, 1, 1, 1, 1, 1,
0.418538, -1.717636, 4.418271, 1, 1, 1, 1, 1,
0.4215373, -1.19641, 4.769766, 1, 1, 1, 1, 1,
0.4222222, 2.30468, -0.3256575, 1, 1, 1, 1, 1,
0.4225905, -0.2230794, 3.472632, 1, 1, 1, 1, 1,
0.4242366, -0.4686035, 3.455779, 1, 1, 1, 1, 1,
0.4275713, -3.281654, 2.268932, 1, 1, 1, 1, 1,
0.4278935, -1.667723, 3.17663, 1, 1, 1, 1, 1,
0.4292522, -1.230672, 2.714616, 1, 1, 1, 1, 1,
0.4294191, -0.502404, 1.380935, 1, 1, 1, 1, 1,
0.4346526, 1.891386, 1.481869, 1, 1, 1, 1, 1,
0.4379627, 0.3513552, 0.9625543, 1, 1, 1, 1, 1,
0.4458637, 1.245837, 0.8647112, 1, 1, 1, 1, 1,
0.4478913, 1.574442, 1.191953, 1, 1, 1, 1, 1,
0.4504529, -1.008582, 2.703795, 0, 0, 1, 1, 1,
0.452406, -0.0007067533, 0.9067663, 1, 0, 0, 1, 1,
0.4529437, 0.3903289, 1.551889, 1, 0, 0, 1, 1,
0.4539607, 1.245179, -0.4369368, 1, 0, 0, 1, 1,
0.4601343, 1.08936, 1.708721, 1, 0, 0, 1, 1,
0.4639989, 1.034036, 0.003409263, 1, 0, 0, 1, 1,
0.4659511, -1.272419, 2.806574, 0, 0, 0, 1, 1,
0.4693789, -1.444473, 2.071203, 0, 0, 0, 1, 1,
0.474087, 0.2944238, 1.394761, 0, 0, 0, 1, 1,
0.4775758, -0.9451466, 0.212256, 0, 0, 0, 1, 1,
0.4813965, -0.2525178, 0.9925945, 0, 0, 0, 1, 1,
0.4817464, 0.6349351, 1.8634, 0, 0, 0, 1, 1,
0.4836524, 0.04674974, 1.762217, 0, 0, 0, 1, 1,
0.4876984, -1.337616, 3.315243, 1, 1, 1, 1, 1,
0.4911564, -1.610321, 2.522938, 1, 1, 1, 1, 1,
0.4972898, -2.061379, 3.887459, 1, 1, 1, 1, 1,
0.500991, 0.598631, 1.285741, 1, 1, 1, 1, 1,
0.5080819, -0.367843, 3.205879, 1, 1, 1, 1, 1,
0.5083584, -0.3724622, 1.936634, 1, 1, 1, 1, 1,
0.5096787, 0.6688376, 0.9664325, 1, 1, 1, 1, 1,
0.5102754, 0.07569082, 2.529947, 1, 1, 1, 1, 1,
0.5130412, -0.4840531, 2.274982, 1, 1, 1, 1, 1,
0.5148033, -0.4054395, 2.249957, 1, 1, 1, 1, 1,
0.5160887, -0.6941047, 3.959399, 1, 1, 1, 1, 1,
0.5198447, 1.655784, 0.915651, 1, 1, 1, 1, 1,
0.5223903, -0.6001996, 3.209963, 1, 1, 1, 1, 1,
0.5224642, 0.3038672, 0.3683915, 1, 1, 1, 1, 1,
0.524823, -0.4296549, 3.962112, 1, 1, 1, 1, 1,
0.5249575, -0.4568459, 2.005751, 0, 0, 1, 1, 1,
0.5265372, 0.4826413, 0.5635937, 1, 0, 0, 1, 1,
0.5319659, -1.007592, 2.379831, 1, 0, 0, 1, 1,
0.5353311, -0.4452328, 0.4830242, 1, 0, 0, 1, 1,
0.5357993, 1.515594, 1.880407, 1, 0, 0, 1, 1,
0.5395739, -0.008806899, 1.201034, 1, 0, 0, 1, 1,
0.5470782, 0.3859687, 3.460289, 0, 0, 0, 1, 1,
0.5480933, -1.102675, 2.668326, 0, 0, 0, 1, 1,
0.5508488, 1.801665, -0.003253153, 0, 0, 0, 1, 1,
0.5575267, -0.292536, -0.2739685, 0, 0, 0, 1, 1,
0.5624544, -1.34496, 3.709236, 0, 0, 0, 1, 1,
0.5632448, 0.3504142, -0.7300091, 0, 0, 0, 1, 1,
0.5657918, -1.4177, 3.72506, 0, 0, 0, 1, 1,
0.5664771, 0.05351465, 1.778254, 1, 1, 1, 1, 1,
0.5684657, -0.1045637, 2.84799, 1, 1, 1, 1, 1,
0.571268, 2.048602, 1.402349, 1, 1, 1, 1, 1,
0.5776111, 1.866787, 1.410782, 1, 1, 1, 1, 1,
0.578793, 0.5629356, 2.372625, 1, 1, 1, 1, 1,
0.5810656, -0.7741283, 2.299515, 1, 1, 1, 1, 1,
0.5822532, 2.021282, -0.1225443, 1, 1, 1, 1, 1,
0.583086, 0.944916, 1.424199, 1, 1, 1, 1, 1,
0.5839665, -0.7369949, 2.941997, 1, 1, 1, 1, 1,
0.5868457, -0.7862152, 2.69127, 1, 1, 1, 1, 1,
0.5925445, 0.6225024, 0.9739226, 1, 1, 1, 1, 1,
0.5928001, 0.7744051, -0.3637718, 1, 1, 1, 1, 1,
0.5944793, 0.2987803, 0.9186258, 1, 1, 1, 1, 1,
0.5979027, 0.04643347, 0.7396609, 1, 1, 1, 1, 1,
0.6036307, 0.7467676, -0.2998677, 1, 1, 1, 1, 1,
0.6049154, 0.2112897, 1.619553, 0, 0, 1, 1, 1,
0.6051673, -0.940677, 2.75647, 1, 0, 0, 1, 1,
0.6096656, -2.266474, 2.914907, 1, 0, 0, 1, 1,
0.6113901, 0.6829968, -0.2662121, 1, 0, 0, 1, 1,
0.6152303, -0.8638469, 1.841705, 1, 0, 0, 1, 1,
0.6208029, 0.4641321, 0.1875275, 1, 0, 0, 1, 1,
0.6219484, 1.258908, 0.8380231, 0, 0, 0, 1, 1,
0.6227717, 0.8795128, 0.6501538, 0, 0, 0, 1, 1,
0.6271185, -0.3725196, 1.757327, 0, 0, 0, 1, 1,
0.6340204, 0.8682832, -0.3810211, 0, 0, 0, 1, 1,
0.6349931, 1.702896, -1.159285, 0, 0, 0, 1, 1,
0.6364524, -0.4755608, 0.21794, 0, 0, 0, 1, 1,
0.6441931, 1.2241, 1.337077, 0, 0, 0, 1, 1,
0.645569, -0.3782394, 3.286051, 1, 1, 1, 1, 1,
0.6463208, 1.420365, 0.2071393, 1, 1, 1, 1, 1,
0.6464872, 0.2889113, 1.520537, 1, 1, 1, 1, 1,
0.6505964, 0.4859369, 0.09625354, 1, 1, 1, 1, 1,
0.6526559, 0.8738407, -0.1734954, 1, 1, 1, 1, 1,
0.6574743, 2.265018, 0.06180398, 1, 1, 1, 1, 1,
0.658488, 0.4008622, 2.948974, 1, 1, 1, 1, 1,
0.6620387, -0.4328949, 4.295887, 1, 1, 1, 1, 1,
0.6632426, -0.9702514, 1.420792, 1, 1, 1, 1, 1,
0.6668966, 0.6295003, -0.4793341, 1, 1, 1, 1, 1,
0.6696911, 0.601656, 0.3275752, 1, 1, 1, 1, 1,
0.6706967, 1.207756, 0.4077542, 1, 1, 1, 1, 1,
0.672197, 0.4187896, 1.324892, 1, 1, 1, 1, 1,
0.6733686, -1.164255, 3.58581, 1, 1, 1, 1, 1,
0.6753127, 1.33622, 0.7466689, 1, 1, 1, 1, 1,
0.6785749, 1.593556, 2.150662, 0, 0, 1, 1, 1,
0.6837295, 1.350475, 1.001794, 1, 0, 0, 1, 1,
0.6842754, -0.7834874, 2.308185, 1, 0, 0, 1, 1,
0.6874995, -0.4769715, 0.5908477, 1, 0, 0, 1, 1,
0.6890318, -2.431403, 2.577135, 1, 0, 0, 1, 1,
0.691594, -1.390283, 2.190928, 1, 0, 0, 1, 1,
0.6937992, -1.942362, 2.757408, 0, 0, 0, 1, 1,
0.6962577, 1.016488, 0.6109665, 0, 0, 0, 1, 1,
0.7005101, 0.7984269, -0.8234593, 0, 0, 0, 1, 1,
0.7006536, 0.3473073, 1.335406, 0, 0, 0, 1, 1,
0.7039875, 0.2342377, 0.7075989, 0, 0, 0, 1, 1,
0.7054007, 1.509346, -1.058856, 0, 0, 0, 1, 1,
0.7133018, 1.857078, 2.190668, 0, 0, 0, 1, 1,
0.7146792, -0.9329178, 0.417729, 1, 1, 1, 1, 1,
0.7165504, -0.8496817, 1.882391, 1, 1, 1, 1, 1,
0.7170925, -0.4760048, 3.06737, 1, 1, 1, 1, 1,
0.7193952, -0.6476694, 1.669373, 1, 1, 1, 1, 1,
0.7231393, -0.9411872, 1.619836, 1, 1, 1, 1, 1,
0.724368, 0.1475794, 0.5313051, 1, 1, 1, 1, 1,
0.7249086, -1.014593, 0.8008603, 1, 1, 1, 1, 1,
0.7271812, 0.2854784, -0.132125, 1, 1, 1, 1, 1,
0.7281326, 1.464314, 0.2283673, 1, 1, 1, 1, 1,
0.7285566, 0.4225835, 0.1410967, 1, 1, 1, 1, 1,
0.7287742, 0.5596134, 0.3194425, 1, 1, 1, 1, 1,
0.7328558, -0.701037, 2.045287, 1, 1, 1, 1, 1,
0.7371219, 0.2575097, 0.6775616, 1, 1, 1, 1, 1,
0.7400804, -0.4848676, 0.6827906, 1, 1, 1, 1, 1,
0.7403868, 0.360237, 0.827711, 1, 1, 1, 1, 1,
0.7432252, -0.2223374, 0.7171023, 0, 0, 1, 1, 1,
0.746136, -0.1493, 2.317965, 1, 0, 0, 1, 1,
0.7503418, -0.5047679, 3.196685, 1, 0, 0, 1, 1,
0.754258, -1.138197, 2.089707, 1, 0, 0, 1, 1,
0.7576687, 1.790919, -0.2740122, 1, 0, 0, 1, 1,
0.7587714, -1.35799, 1.700936, 1, 0, 0, 1, 1,
0.761677, 0.5833185, 0.4107146, 0, 0, 0, 1, 1,
0.7761342, 0.3546224, 0.7160931, 0, 0, 0, 1, 1,
0.781876, 0.5503325, 1.325786, 0, 0, 0, 1, 1,
0.7828951, 1.07509, 0.1538472, 0, 0, 0, 1, 1,
0.7836077, 0.5880247, 1.309304, 0, 0, 0, 1, 1,
0.7836686, 1.929063, 1.016609, 0, 0, 0, 1, 1,
0.7842832, -0.5648527, 3.305117, 0, 0, 0, 1, 1,
0.7843155, -1.18397, 1.797737, 1, 1, 1, 1, 1,
0.7848203, -0.7957526, 2.512195, 1, 1, 1, 1, 1,
0.791928, -0.9973302, 2.45008, 1, 1, 1, 1, 1,
0.7927621, -2.025396, 4.651918, 1, 1, 1, 1, 1,
0.7964862, -0.2591111, 1.100151, 1, 1, 1, 1, 1,
0.7975476, 0.6726024, 0.5944215, 1, 1, 1, 1, 1,
0.7987756, -0.6348302, 3.071469, 1, 1, 1, 1, 1,
0.7999223, -0.7882885, 4.300287, 1, 1, 1, 1, 1,
0.8026134, 0.1812282, 1.402077, 1, 1, 1, 1, 1,
0.809222, -1.016859, 1.875153, 1, 1, 1, 1, 1,
0.8156189, -1.097038, 0.6396857, 1, 1, 1, 1, 1,
0.8170658, -0.9590021, 1.941107, 1, 1, 1, 1, 1,
0.8196052, 2.559414, 1.026105, 1, 1, 1, 1, 1,
0.8398635, -0.2584232, 0.6955362, 1, 1, 1, 1, 1,
0.8431982, -0.5750952, 1.583529, 1, 1, 1, 1, 1,
0.8432804, -0.1260276, 2.4504, 0, 0, 1, 1, 1,
0.845809, -1.137371, 3.275404, 1, 0, 0, 1, 1,
0.8501025, 1.918811, -0.1074555, 1, 0, 0, 1, 1,
0.8547815, 0.4067092, 0.9694508, 1, 0, 0, 1, 1,
0.8553148, -0.6994507, 2.817826, 1, 0, 0, 1, 1,
0.8556331, -1.535088, 2.191268, 1, 0, 0, 1, 1,
0.8562897, -0.08390171, 0.03946323, 0, 0, 0, 1, 1,
0.8568186, -0.11635, 1.852397, 0, 0, 0, 1, 1,
0.8580835, 0.9191691, 0.6184961, 0, 0, 0, 1, 1,
0.8599794, 0.06896684, 1.404607, 0, 0, 0, 1, 1,
0.8612679, -0.06945207, 1.604685, 0, 0, 0, 1, 1,
0.8690785, -1.503836, 2.950835, 0, 0, 0, 1, 1,
0.8705138, 1.737321, 0.2578387, 0, 0, 0, 1, 1,
0.8720316, -0.6182314, 2.639381, 1, 1, 1, 1, 1,
0.8736005, 0.6791609, 2.685892, 1, 1, 1, 1, 1,
0.8774247, 0.5617906, -0.1545901, 1, 1, 1, 1, 1,
0.8778115, -1.004429, 3.674905, 1, 1, 1, 1, 1,
0.8785021, -0.917605, 1.400671, 1, 1, 1, 1, 1,
0.8835359, 0.08265597, 0.6097612, 1, 1, 1, 1, 1,
0.889277, -0.01831497, 2.243289, 1, 1, 1, 1, 1,
0.8896539, 0.1315715, 1.605009, 1, 1, 1, 1, 1,
0.8954132, -0.01401978, 2.127239, 1, 1, 1, 1, 1,
0.8960478, -0.7945739, 4.02642, 1, 1, 1, 1, 1,
0.8982666, 0.5419275, 0.8444831, 1, 1, 1, 1, 1,
0.8989748, -0.3584142, 1.358259, 1, 1, 1, 1, 1,
0.8989753, -1.282631, 1.972062, 1, 1, 1, 1, 1,
0.9060923, 1.806947, 0.6553817, 1, 1, 1, 1, 1,
0.9065658, -0.8544109, 3.08746, 1, 1, 1, 1, 1,
0.9070041, -1.731424, 2.229676, 0, 0, 1, 1, 1,
0.9111939, -0.389369, 2.324708, 1, 0, 0, 1, 1,
0.9143624, -0.001399466, 2.193825, 1, 0, 0, 1, 1,
0.9151645, -0.05701164, 2.504976, 1, 0, 0, 1, 1,
0.9181526, -0.2743951, 1.773813, 1, 0, 0, 1, 1,
0.91914, -0.06292944, 2.529313, 1, 0, 0, 1, 1,
0.9235725, 0.203328, 0.9934092, 0, 0, 0, 1, 1,
0.9257281, -0.6330861, 2.392142, 0, 0, 0, 1, 1,
0.9261703, -1.022095, 1.462286, 0, 0, 0, 1, 1,
0.9266636, 0.3352527, -0.2181144, 0, 0, 0, 1, 1,
0.9286745, 1.329615, 2.289737, 0, 0, 0, 1, 1,
0.9292454, 0.3181918, 1.656766, 0, 0, 0, 1, 1,
0.9319649, -0.9127989, 1.045999, 0, 0, 0, 1, 1,
0.9320636, -0.8320275, 3.225214, 1, 1, 1, 1, 1,
0.9350042, -1.06071, 4.135713, 1, 1, 1, 1, 1,
0.9367455, -0.5474796, 2.309987, 1, 1, 1, 1, 1,
0.9423956, 1.88685, 0.09506499, 1, 1, 1, 1, 1,
0.9432105, 1.055613, 1.463452, 1, 1, 1, 1, 1,
0.9483351, 2.570687, -1.334422, 1, 1, 1, 1, 1,
0.9495906, -0.6899234, 0.07934503, 1, 1, 1, 1, 1,
0.9514454, -0.7925653, 2.076923, 1, 1, 1, 1, 1,
0.9530769, 0.1117973, 2.050293, 1, 1, 1, 1, 1,
0.9571835, -0.7498108, 2.518087, 1, 1, 1, 1, 1,
0.9590808, -0.4028274, 0.7907102, 1, 1, 1, 1, 1,
0.9639381, -0.7060285, 2.590733, 1, 1, 1, 1, 1,
0.9667915, -0.5633113, 1.174501, 1, 1, 1, 1, 1,
0.9716027, -0.7179871, 2.045794, 1, 1, 1, 1, 1,
0.9746489, -0.3636533, 2.994524, 1, 1, 1, 1, 1,
0.9768589, -0.4170442, 2.117539, 0, 0, 1, 1, 1,
0.9778024, 0.3176968, 2.104092, 1, 0, 0, 1, 1,
0.9806121, 1.408565, 0.9036884, 1, 0, 0, 1, 1,
0.9829702, -2.600071, 3.3571, 1, 0, 0, 1, 1,
0.9835403, -1.469163, 2.829751, 1, 0, 0, 1, 1,
0.9938514, -1.222811, 1.934544, 1, 0, 0, 1, 1,
0.9948783, -0.2382129, 2.415956, 0, 0, 0, 1, 1,
1.007061, 1.128927, 1.660867, 0, 0, 0, 1, 1,
1.013768, -0.2054284, 1.571345, 0, 0, 0, 1, 1,
1.017944, 0.7077423, 0.1239778, 0, 0, 0, 1, 1,
1.023188, -0.824554, 2.827387, 0, 0, 0, 1, 1,
1.02605, 0.1977744, 0.9153699, 0, 0, 0, 1, 1,
1.030143, 0.5763076, 1.658666, 0, 0, 0, 1, 1,
1.030963, -1.930404, 2.792533, 1, 1, 1, 1, 1,
1.041945, 0.9214246, 1.368048, 1, 1, 1, 1, 1,
1.042057, 0.6781272, 0.952433, 1, 1, 1, 1, 1,
1.043431, -0.9782286, 2.485653, 1, 1, 1, 1, 1,
1.04458, 1.335843, 0.4412303, 1, 1, 1, 1, 1,
1.045063, -0.3479502, 1.917332, 1, 1, 1, 1, 1,
1.055147, 0.397292, 2.232704, 1, 1, 1, 1, 1,
1.059448, 0.5781605, 2.076047, 1, 1, 1, 1, 1,
1.06201, -0.09993406, 2.157384, 1, 1, 1, 1, 1,
1.066305, -0.3687477, 1.33454, 1, 1, 1, 1, 1,
1.066918, -0.329292, 2.748194, 1, 1, 1, 1, 1,
1.072409, 0.4089946, -1.233281, 1, 1, 1, 1, 1,
1.072699, -1.12345, 1.463991, 1, 1, 1, 1, 1,
1.07769, 0.5890113, 2.498074, 1, 1, 1, 1, 1,
1.078616, 0.4979663, 0.6752247, 1, 1, 1, 1, 1,
1.091787, -0.2553928, 2.278315, 0, 0, 1, 1, 1,
1.093729, 0.3201856, 0.5762764, 1, 0, 0, 1, 1,
1.094642, 0.8361615, 1.199462, 1, 0, 0, 1, 1,
1.102221, -1.93868, 0.5098216, 1, 0, 0, 1, 1,
1.124122, -0.7613283, 2.863712, 1, 0, 0, 1, 1,
1.126654, 0.08792872, 2.952449, 1, 0, 0, 1, 1,
1.131365, 0.6365447, 0.0514751, 0, 0, 0, 1, 1,
1.132985, 0.7853508, -0.2322686, 0, 0, 0, 1, 1,
1.139555, -1.662795, 1.454898, 0, 0, 0, 1, 1,
1.14025, -1.227499, 2.016094, 0, 0, 0, 1, 1,
1.143069, 0.3682705, 0.1564628, 0, 0, 0, 1, 1,
1.150637, 0.4891566, 2.259857, 0, 0, 0, 1, 1,
1.159173, 1.269901, 1.570249, 0, 0, 0, 1, 1,
1.159824, 0.6954572, 2.763783, 1, 1, 1, 1, 1,
1.173112, 0.7153613, 2.335277, 1, 1, 1, 1, 1,
1.174584, -0.4902008, 2.643587, 1, 1, 1, 1, 1,
1.175179, 0.6986188, 2.256056, 1, 1, 1, 1, 1,
1.182696, -0.9448006, 2.504108, 1, 1, 1, 1, 1,
1.184555, 0.3496037, 1.706046, 1, 1, 1, 1, 1,
1.195822, 0.1401585, 1.101484, 1, 1, 1, 1, 1,
1.197802, 0.6177933, 2.993213, 1, 1, 1, 1, 1,
1.20236, -1.007285, 2.097216, 1, 1, 1, 1, 1,
1.210652, 1.627038, 0.7977447, 1, 1, 1, 1, 1,
1.213018, -0.7439278, 1.737426, 1, 1, 1, 1, 1,
1.213841, 1.315652, 0.5597506, 1, 1, 1, 1, 1,
1.222395, 0.4332561, 2.208485, 1, 1, 1, 1, 1,
1.225893, -1.130006, 4.031024, 1, 1, 1, 1, 1,
1.230275, 0.2554686, 0.408465, 1, 1, 1, 1, 1,
1.239777, -0.2749693, 2.958484, 0, 0, 1, 1, 1,
1.24079, -0.2122551, 1.849662, 1, 0, 0, 1, 1,
1.242193, 1.105414, 1.862889, 1, 0, 0, 1, 1,
1.249077, 1.970936, 1.955829, 1, 0, 0, 1, 1,
1.25746, -0.1937544, 2.189933, 1, 0, 0, 1, 1,
1.262167, 0.2165126, 0.2485562, 1, 0, 0, 1, 1,
1.271983, -0.5547118, 2.422347, 0, 0, 0, 1, 1,
1.278499, 1.382451, -0.04981098, 0, 0, 0, 1, 1,
1.286775, 0.7891809, 1.767257, 0, 0, 0, 1, 1,
1.290111, -0.6960291, 3.43738, 0, 0, 0, 1, 1,
1.294357, -1.847743, 1.731891, 0, 0, 0, 1, 1,
1.320143, 0.02102828, 4.081031, 0, 0, 0, 1, 1,
1.320271, -1.76474, 3.356919, 0, 0, 0, 1, 1,
1.320632, 1.370684, 0.7236272, 1, 1, 1, 1, 1,
1.329067, -2.383842, 2.136128, 1, 1, 1, 1, 1,
1.331322, 0.6274324, 0.4431591, 1, 1, 1, 1, 1,
1.338215, 0.1925008, 1.133603, 1, 1, 1, 1, 1,
1.339718, 1.790593, 2.307809, 1, 1, 1, 1, 1,
1.347378, -0.8556091, 4.075284, 1, 1, 1, 1, 1,
1.360744, 2.282975, 0.5628422, 1, 1, 1, 1, 1,
1.376087, 0.1720523, 0.1644906, 1, 1, 1, 1, 1,
1.381666, -2.331768, 1.519447, 1, 1, 1, 1, 1,
1.389913, 0.195786, 0.9610466, 1, 1, 1, 1, 1,
1.390252, 1.225198, -0.7570601, 1, 1, 1, 1, 1,
1.39128, -0.07693963, 0.8840846, 1, 1, 1, 1, 1,
1.393488, -0.05462385, 2.632012, 1, 1, 1, 1, 1,
1.405642, -0.610485, 1.882069, 1, 1, 1, 1, 1,
1.411504, 1.620303, 1.197314, 1, 1, 1, 1, 1,
1.441963, -0.5463326, 3.347081, 0, 0, 1, 1, 1,
1.464776, -0.856119, 3.285366, 1, 0, 0, 1, 1,
1.466214, 1.697407, 0.4872835, 1, 0, 0, 1, 1,
1.469758, -0.6725268, 1.987881, 1, 0, 0, 1, 1,
1.484578, -1.459405, 2.217513, 1, 0, 0, 1, 1,
1.51251, -1.008656, -0.2414785, 1, 0, 0, 1, 1,
1.51402, -0.4212013, 0.5339133, 0, 0, 0, 1, 1,
1.529835, -0.4520493, -0.209594, 0, 0, 0, 1, 1,
1.534606, -0.2551888, 2.142428, 0, 0, 0, 1, 1,
1.550856, -1.517082, 1.653502, 0, 0, 0, 1, 1,
1.575664, -1.789707, 4.411931, 0, 0, 0, 1, 1,
1.595821, 0.008014747, 2.428724, 0, 0, 0, 1, 1,
1.603644, -1.235995, 3.785015, 0, 0, 0, 1, 1,
1.639893, -0.7253208, 1.389892, 1, 1, 1, 1, 1,
1.647196, -0.2674851, 2.258472, 1, 1, 1, 1, 1,
1.649553, -0.7546939, 2.195818, 1, 1, 1, 1, 1,
1.653499, -0.8149607, 2.805447, 1, 1, 1, 1, 1,
1.660875, -0.5569457, 2.050477, 1, 1, 1, 1, 1,
1.688141, -0.2739911, 1.711905, 1, 1, 1, 1, 1,
1.69114, -0.5122352, 1.701735, 1, 1, 1, 1, 1,
1.699559, -0.3264252, 2.407184, 1, 1, 1, 1, 1,
1.703047, 2.055779, 1.533221, 1, 1, 1, 1, 1,
1.712094, 0.7034546, 1.25408, 1, 1, 1, 1, 1,
1.717503, -0.631557, 1.955431, 1, 1, 1, 1, 1,
1.730764, 0.1234149, 0.9165423, 1, 1, 1, 1, 1,
1.737369, -0.9565811, 4.016829, 1, 1, 1, 1, 1,
1.739771, 1.767448, 0.8602297, 1, 1, 1, 1, 1,
1.746478, -1.692746, 3.191899, 1, 1, 1, 1, 1,
1.758125, 0.8933578, 0.5667317, 0, 0, 1, 1, 1,
1.758763, 0.7679969, 0.7095332, 1, 0, 0, 1, 1,
1.765797, 0.1626967, -0.1659308, 1, 0, 0, 1, 1,
1.769153, -1.012739, 1.327727, 1, 0, 0, 1, 1,
1.775997, 0.2133511, 0.619856, 1, 0, 0, 1, 1,
1.784653, 0.06145845, 0.9061409, 1, 0, 0, 1, 1,
1.796795, 2.282632, 0.5062868, 0, 0, 0, 1, 1,
1.821547, -1.08042, 2.117, 0, 0, 0, 1, 1,
1.830457, 0.6231071, 1.766618, 0, 0, 0, 1, 1,
1.835715, 0.4119013, 1.323546, 0, 0, 0, 1, 1,
1.840477, -2.292825, 2.427782, 0, 0, 0, 1, 1,
1.856595, 0.514782, 1.61504, 0, 0, 0, 1, 1,
1.883038, 0.2512736, 2.260872, 0, 0, 0, 1, 1,
1.888578, 0.241298, 1.183585, 1, 1, 1, 1, 1,
1.889478, -0.2965429, 0.9831398, 1, 1, 1, 1, 1,
1.890783, -0.8971631, 0.3111618, 1, 1, 1, 1, 1,
1.896808, 0.78069, 2.514164, 1, 1, 1, 1, 1,
1.903269, 0.1652092, 1.197166, 1, 1, 1, 1, 1,
1.911626, -1.179074, 0.7927128, 1, 1, 1, 1, 1,
1.917776, -0.2986089, 0.8372846, 1, 1, 1, 1, 1,
1.958183, 1.59579, 0.2606142, 1, 1, 1, 1, 1,
1.964294, 2.602524, 1.339858, 1, 1, 1, 1, 1,
1.977938, 1.608895, 1.877215, 1, 1, 1, 1, 1,
1.993476, 0.3554111, 1.20897, 1, 1, 1, 1, 1,
1.994488, -0.9771975, 1.868676, 1, 1, 1, 1, 1,
2.003149, 0.304548, 0.6547691, 1, 1, 1, 1, 1,
2.012339, 1.114984, 0.9570987, 1, 1, 1, 1, 1,
2.038486, 1.013368, 0.4633568, 1, 1, 1, 1, 1,
2.040196, -0.1680404, 1.911868, 0, 0, 1, 1, 1,
2.05355, 0.0976066, 2.373756, 1, 0, 0, 1, 1,
2.065771, -0.4078886, 0.3968901, 1, 0, 0, 1, 1,
2.07619, 1.299197, 2.60358, 1, 0, 0, 1, 1,
2.137079, -0.07754849, 3.315879, 1, 0, 0, 1, 1,
2.147331, 1.048336, 2.24106, 1, 0, 0, 1, 1,
2.15889, -0.373771, 1.20364, 0, 0, 0, 1, 1,
2.170135, -1.967299, 1.498161, 0, 0, 0, 1, 1,
2.202449, 0.571512, 2.26434, 0, 0, 0, 1, 1,
2.290736, -0.3844528, -0.3337874, 0, 0, 0, 1, 1,
2.312479, 0.3106422, 1.274956, 0, 0, 0, 1, 1,
2.322769, 1.216361, 2.159428, 0, 0, 0, 1, 1,
2.326643, -1.921064, 4.675502, 0, 0, 0, 1, 1,
2.357225, 0.5589994, 1.004751, 1, 1, 1, 1, 1,
2.454399, -1.520752, 3.880945, 1, 1, 1, 1, 1,
2.58503, 0.5309808, -0.6473575, 1, 1, 1, 1, 1,
2.624803, -0.756658, 1.773111, 1, 1, 1, 1, 1,
2.680556, 1.677906, 0.6211463, 1, 1, 1, 1, 1,
2.775174, -0.7325203, 0.211824, 1, 1, 1, 1, 1,
2.855257, 1.830688, -0.9577749, 1, 1, 1, 1, 1
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
var radius = 9.431773;
var distance = 33.1287;
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
mvMatrix.translate( 0.2083207, 0.1807752, 0.3531215 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.1287);
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
