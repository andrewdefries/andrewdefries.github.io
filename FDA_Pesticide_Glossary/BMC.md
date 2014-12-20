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
-3.541871, -0.6402986, -1.087436, 1, 0, 0, 1,
-2.879966, 0.122491, -1.692237, 1, 0.007843138, 0, 1,
-2.782713, -0.2717843, 0.6056924, 1, 0.01176471, 0, 1,
-2.610165, -0.6542801, -3.189686, 1, 0.01960784, 0, 1,
-2.585701, -0.5785293, -1.900286, 1, 0.02352941, 0, 1,
-2.490893, -0.09882688, -2.275674, 1, 0.03137255, 0, 1,
-2.467971, -1.295299, -1.738595, 1, 0.03529412, 0, 1,
-2.346488, -0.2727316, -1.3255, 1, 0.04313726, 0, 1,
-2.328405, 1.113467, -1.09201, 1, 0.04705882, 0, 1,
-2.326125, -1.484958, -2.763267, 1, 0.05490196, 0, 1,
-2.288539, -0.4265916, -2.94219, 1, 0.05882353, 0, 1,
-2.278518, -0.6103671, -2.998051, 1, 0.06666667, 0, 1,
-2.26954, 3.506554, 1.255358, 1, 0.07058824, 0, 1,
-2.251834, -1.120946, -2.090395, 1, 0.07843138, 0, 1,
-2.155096, -0.01942779, -1.134162, 1, 0.08235294, 0, 1,
-2.146713, -0.3351844, -1.412216, 1, 0.09019608, 0, 1,
-2.133029, 0.8698854, -1.750681, 1, 0.09411765, 0, 1,
-2.122172, -0.06266116, -1.592906, 1, 0.1019608, 0, 1,
-2.11643, 0.03703183, -2.596592, 1, 0.1098039, 0, 1,
-2.083364, 0.3624316, -0.8512573, 1, 0.1137255, 0, 1,
-2.007231, -1.318273, -1.087728, 1, 0.1215686, 0, 1,
-1.994503, -0.7091125, -1.96728, 1, 0.1254902, 0, 1,
-1.983986, -0.8775553, -2.106721, 1, 0.1333333, 0, 1,
-1.978257, -0.7214397, -2.482099, 1, 0.1372549, 0, 1,
-1.96886, 0.02118849, -0.7715459, 1, 0.145098, 0, 1,
-1.968282, -0.3650833, -2.879084, 1, 0.1490196, 0, 1,
-1.963983, -0.2491317, -1.449905, 1, 0.1568628, 0, 1,
-1.961552, 0.08103826, -2.852754, 1, 0.1607843, 0, 1,
-1.958681, 1.719433, 0.51912, 1, 0.1686275, 0, 1,
-1.945408, 1.865275, -1.658034, 1, 0.172549, 0, 1,
-1.93147, -0.7745461, -1.196547, 1, 0.1803922, 0, 1,
-1.929891, -1.107891, -2.74962, 1, 0.1843137, 0, 1,
-1.896156, -1.455252, -2.937652, 1, 0.1921569, 0, 1,
-1.881038, 0.3753468, 1.425455, 1, 0.1960784, 0, 1,
-1.87441, -1.539931, -1.415104, 1, 0.2039216, 0, 1,
-1.867477, 0.8583886, -0.2601956, 1, 0.2117647, 0, 1,
-1.867146, -1.274073, -3.001838, 1, 0.2156863, 0, 1,
-1.847867, -1.237295, -1.169023, 1, 0.2235294, 0, 1,
-1.834672, -0.550256, -1.384012, 1, 0.227451, 0, 1,
-1.829307, 2.367012, 0.1379998, 1, 0.2352941, 0, 1,
-1.808555, 0.3623563, 0.03244124, 1, 0.2392157, 0, 1,
-1.785184, 0.5354275, -2.55519, 1, 0.2470588, 0, 1,
-1.775067, -1.089141, -1.097652, 1, 0.2509804, 0, 1,
-1.773423, -0.5403267, -1.575366, 1, 0.2588235, 0, 1,
-1.745659, 1.301447, -1.139135, 1, 0.2627451, 0, 1,
-1.743283, -0.9719024, -0.9671301, 1, 0.2705882, 0, 1,
-1.736046, -1.594866, -2.867347, 1, 0.2745098, 0, 1,
-1.722079, 0.334589, -1.272811, 1, 0.282353, 0, 1,
-1.720783, 2.271998, -2.425919, 1, 0.2862745, 0, 1,
-1.702234, 0.9149716, -2.092639, 1, 0.2941177, 0, 1,
-1.676355, 0.9310222, -0.2406691, 1, 0.3019608, 0, 1,
-1.674637, 0.0450627, -1.611013, 1, 0.3058824, 0, 1,
-1.672972, 0.6538787, -1.39903, 1, 0.3137255, 0, 1,
-1.666864, 1.479922, -2.881249, 1, 0.3176471, 0, 1,
-1.649677, 0.04421398, -0.8918276, 1, 0.3254902, 0, 1,
-1.640633, -0.5170422, -1.464786, 1, 0.3294118, 0, 1,
-1.635665, -1.344876, -0.81057, 1, 0.3372549, 0, 1,
-1.63454, -0.3357926, -0.1556802, 1, 0.3411765, 0, 1,
-1.633427, -1.431109, -2.332446, 1, 0.3490196, 0, 1,
-1.630096, -0.8899834, -1.438555, 1, 0.3529412, 0, 1,
-1.624843, -0.2564634, -1.350848, 1, 0.3607843, 0, 1,
-1.597395, -1.346105, -3.322947, 1, 0.3647059, 0, 1,
-1.595574, -1.3976, -0.7694939, 1, 0.372549, 0, 1,
-1.578339, 0.885492, -1.75156, 1, 0.3764706, 0, 1,
-1.576559, -1.128234, -2.319501, 1, 0.3843137, 0, 1,
-1.568105, -0.9822015, -1.677661, 1, 0.3882353, 0, 1,
-1.567851, 0.9308569, -1.107841, 1, 0.3960784, 0, 1,
-1.563259, -0.3030697, -1.713434, 1, 0.4039216, 0, 1,
-1.555944, 0.1045053, -0.9592156, 1, 0.4078431, 0, 1,
-1.555034, -0.454241, -2.737886, 1, 0.4156863, 0, 1,
-1.537643, 1.255805, -1.310576, 1, 0.4196078, 0, 1,
-1.532405, -0.2132369, -1.981868, 1, 0.427451, 0, 1,
-1.528953, 1.795916, -0.9268913, 1, 0.4313726, 0, 1,
-1.514786, -0.02190562, -1.522132, 1, 0.4392157, 0, 1,
-1.508958, -0.6748856, -1.71799, 1, 0.4431373, 0, 1,
-1.504393, -0.06288207, -1.181348, 1, 0.4509804, 0, 1,
-1.49408, 0.2610864, -2.759681, 1, 0.454902, 0, 1,
-1.491923, 1.946777, -1.023257, 1, 0.4627451, 0, 1,
-1.490389, 1.518123, -0.06330018, 1, 0.4666667, 0, 1,
-1.489176, 0.1915071, -0.8628155, 1, 0.4745098, 0, 1,
-1.474144, -1.362956, -3.097277, 1, 0.4784314, 0, 1,
-1.462108, -0.75033, -1.998932, 1, 0.4862745, 0, 1,
-1.45984, 0.3553179, 0.8677906, 1, 0.4901961, 0, 1,
-1.457282, 1.823192, -0.7859902, 1, 0.4980392, 0, 1,
-1.453423, 0.8483961, -1.87235, 1, 0.5058824, 0, 1,
-1.441647, 0.314405, -0.4464607, 1, 0.509804, 0, 1,
-1.441123, 1.303467, -1.350354, 1, 0.5176471, 0, 1,
-1.432119, 1.216087, -1.487862, 1, 0.5215687, 0, 1,
-1.430357, 0.5364849, -0.7948402, 1, 0.5294118, 0, 1,
-1.425541, -1.534498, -2.312015, 1, 0.5333334, 0, 1,
-1.42449, 0.462663, -1.124004, 1, 0.5411765, 0, 1,
-1.415787, -0.2174024, -0.3172159, 1, 0.5450981, 0, 1,
-1.411787, -2.026826, -1.714916, 1, 0.5529412, 0, 1,
-1.411018, -0.7352052, -1.581105, 1, 0.5568628, 0, 1,
-1.393558, 0.932541, -1.764092, 1, 0.5647059, 0, 1,
-1.388741, -1.07876, -1.954075, 1, 0.5686275, 0, 1,
-1.381165, -1.688484, -3.752039, 1, 0.5764706, 0, 1,
-1.376455, 0.1740742, -1.591027, 1, 0.5803922, 0, 1,
-1.366394, -0.548235, -2.674997, 1, 0.5882353, 0, 1,
-1.365318, 0.3118402, -2.789317, 1, 0.5921569, 0, 1,
-1.352121, 0.9852467, -1.668802, 1, 0.6, 0, 1,
-1.346087, 1.371286, -1.495289, 1, 0.6078432, 0, 1,
-1.341818, -1.647115, -4.160575, 1, 0.6117647, 0, 1,
-1.339558, -0.2089893, 1.355531, 1, 0.6196079, 0, 1,
-1.331061, -0.1854679, -1.002819, 1, 0.6235294, 0, 1,
-1.331023, -0.6111183, -2.820515, 1, 0.6313726, 0, 1,
-1.327489, 0.5510606, -3.014477, 1, 0.6352941, 0, 1,
-1.325305, -1.52175, -2.501254, 1, 0.6431373, 0, 1,
-1.322772, -0.9038758, -2.709672, 1, 0.6470588, 0, 1,
-1.305263, -0.929397, -5.297393, 1, 0.654902, 0, 1,
-1.301147, -1.83259, -2.427977, 1, 0.6588235, 0, 1,
-1.295029, -0.6187103, -2.066042, 1, 0.6666667, 0, 1,
-1.281908, -2.428449, -3.573615, 1, 0.6705883, 0, 1,
-1.275868, 0.6961709, -0.9860612, 1, 0.6784314, 0, 1,
-1.270689, 0.2247441, -1.399375, 1, 0.682353, 0, 1,
-1.266599, 0.3263911, -2.7703, 1, 0.6901961, 0, 1,
-1.259281, 0.4763855, -2.21782, 1, 0.6941177, 0, 1,
-1.255276, -0.1622971, -1.352947, 1, 0.7019608, 0, 1,
-1.254307, -0.6713195, -2.144171, 1, 0.7098039, 0, 1,
-1.252671, 1.47111, -1.868154, 1, 0.7137255, 0, 1,
-1.245514, 0.1233274, -1.330594, 1, 0.7215686, 0, 1,
-1.20764, 2.242691, -1.833873, 1, 0.7254902, 0, 1,
-1.196534, -0.861842, -2.449563, 1, 0.7333333, 0, 1,
-1.193703, 0.4636943, -1.445962, 1, 0.7372549, 0, 1,
-1.180215, -0.3072557, -2.204333, 1, 0.7450981, 0, 1,
-1.178403, 1.169561, -0.9634991, 1, 0.7490196, 0, 1,
-1.175623, 0.4382837, -0.8190429, 1, 0.7568628, 0, 1,
-1.174721, -1.055374, -1.567994, 1, 0.7607843, 0, 1,
-1.169587, -0.448366, -2.632514, 1, 0.7686275, 0, 1,
-1.169375, 0.48793, -1.721931, 1, 0.772549, 0, 1,
-1.162843, -1.601117, -2.380729, 1, 0.7803922, 0, 1,
-1.161772, -0.4597111, -3.139636, 1, 0.7843137, 0, 1,
-1.159366, -1.326027, -4.852256, 1, 0.7921569, 0, 1,
-1.15663, -1.366131, -2.901739, 1, 0.7960784, 0, 1,
-1.149426, 0.1018739, 0.7365364, 1, 0.8039216, 0, 1,
-1.14727, -0.4965808, -1.977755, 1, 0.8117647, 0, 1,
-1.139365, 1.542405, 0.4773959, 1, 0.8156863, 0, 1,
-1.137935, 0.1587706, -2.45421, 1, 0.8235294, 0, 1,
-1.137464, 0.06889499, -1.117777, 1, 0.827451, 0, 1,
-1.132672, 1.479802, -0.1344583, 1, 0.8352941, 0, 1,
-1.129434, 0.1542472, -1.349435, 1, 0.8392157, 0, 1,
-1.124142, 0.4919379, -0.6575155, 1, 0.8470588, 0, 1,
-1.120142, -1.700544, -2.5778, 1, 0.8509804, 0, 1,
-1.118839, -0.4335384, -1.330774, 1, 0.8588235, 0, 1,
-1.114103, 1.103788, 0.5789306, 1, 0.8627451, 0, 1,
-1.110511, 0.5757657, -2.357711, 1, 0.8705882, 0, 1,
-1.110348, -2.185592, -3.622753, 1, 0.8745098, 0, 1,
-1.103611, -0.7281712, -3.138428, 1, 0.8823529, 0, 1,
-1.103257, -0.5859126, -2.178678, 1, 0.8862745, 0, 1,
-1.101275, 1.138625, -1.06641, 1, 0.8941177, 0, 1,
-1.090868, 0.6102732, 0.9484639, 1, 0.8980392, 0, 1,
-1.088215, 0.7158332, 0.08239331, 1, 0.9058824, 0, 1,
-1.083882, -1.172238, -1.223652, 1, 0.9137255, 0, 1,
-1.082541, -2.294774, -5.557221, 1, 0.9176471, 0, 1,
-1.074337, -0.0745147, -0.9906062, 1, 0.9254902, 0, 1,
-1.074251, 0.538404, -1.980389, 1, 0.9294118, 0, 1,
-1.071066, 0.9862689, -2.075998, 1, 0.9372549, 0, 1,
-1.065994, -0.1978489, -2.204424, 1, 0.9411765, 0, 1,
-1.064996, 0.5862193, -0.5532939, 1, 0.9490196, 0, 1,
-1.064851, 0.8814381, -0.2175555, 1, 0.9529412, 0, 1,
-1.062128, 1.649016, -1.731375, 1, 0.9607843, 0, 1,
-1.059406, 0.05891477, -2.380033, 1, 0.9647059, 0, 1,
-1.055942, 0.2893209, -0.9944377, 1, 0.972549, 0, 1,
-1.055474, 0.7059959, -0.9053325, 1, 0.9764706, 0, 1,
-1.046689, 0.5513956, -1.047724, 1, 0.9843137, 0, 1,
-1.04176, 1.032759, -0.2770474, 1, 0.9882353, 0, 1,
-1.039715, 0.4034106, -1.088241, 1, 0.9960784, 0, 1,
-1.033714, 0.02610678, -0.4592072, 0.9960784, 1, 0, 1,
-1.032043, -0.1312558, -0.9354846, 0.9921569, 1, 0, 1,
-1.023384, 0.5695937, -0.1795831, 0.9843137, 1, 0, 1,
-1.016107, -1.023868, -2.883519, 0.9803922, 1, 0, 1,
-1.01353, 0.7661335, -2.024832, 0.972549, 1, 0, 1,
-1.01127, 0.4359404, -0.8508818, 0.9686275, 1, 0, 1,
-1.009538, 0.9620008, 0.3427463, 0.9607843, 1, 0, 1,
-1.005085, -0.2182145, -2.015848, 0.9568627, 1, 0, 1,
-1.004057, -0.2815782, -1.1932, 0.9490196, 1, 0, 1,
-0.9986817, -0.4666278, -0.8542095, 0.945098, 1, 0, 1,
-0.9975352, -0.1029547, -2.416499, 0.9372549, 1, 0, 1,
-0.9868654, 1.11293, -0.7766062, 0.9333333, 1, 0, 1,
-0.9855115, -1.749958, -1.514436, 0.9254902, 1, 0, 1,
-0.9839565, 0.1149181, -0.02587506, 0.9215686, 1, 0, 1,
-0.9699836, -1.024692, -1.798746, 0.9137255, 1, 0, 1,
-0.965431, 1.404914, -0.9046402, 0.9098039, 1, 0, 1,
-0.955694, -0.6885844, -1.019056, 0.9019608, 1, 0, 1,
-0.9533857, 0.5790083, -1.438496, 0.8941177, 1, 0, 1,
-0.9515994, 0.6364003, -2.135853, 0.8901961, 1, 0, 1,
-0.9420449, -0.357678, -0.2412879, 0.8823529, 1, 0, 1,
-0.9345273, -1.617367, -3.955957, 0.8784314, 1, 0, 1,
-0.9312112, 0.2737451, -0.3569978, 0.8705882, 1, 0, 1,
-0.9275876, 2.683532, 0.6090727, 0.8666667, 1, 0, 1,
-0.9252692, -0.5198403, -2.349227, 0.8588235, 1, 0, 1,
-0.9245809, -1.275212, -1.401069, 0.854902, 1, 0, 1,
-0.9212658, 0.09649789, -1.320639, 0.8470588, 1, 0, 1,
-0.9194118, -0.1237577, -2.519069, 0.8431373, 1, 0, 1,
-0.9165, -0.2497707, -1.264391, 0.8352941, 1, 0, 1,
-0.911359, 1.478565, 0.4158504, 0.8313726, 1, 0, 1,
-0.9109961, 0.1780796, -2.037366, 0.8235294, 1, 0, 1,
-0.9106697, -1.056442, -3.560013, 0.8196079, 1, 0, 1,
-0.9021057, -0.2115603, -0.8917653, 0.8117647, 1, 0, 1,
-0.9009019, 0.5289867, -1.220822, 0.8078431, 1, 0, 1,
-0.8980125, -1.351112, -2.609533, 0.8, 1, 0, 1,
-0.8968787, 1.525738, -1.898524, 0.7921569, 1, 0, 1,
-0.884841, 1.005632, -0.450616, 0.7882353, 1, 0, 1,
-0.8817243, 0.6197693, -0.8859279, 0.7803922, 1, 0, 1,
-0.8794327, 0.9269621, -0.6735671, 0.7764706, 1, 0, 1,
-0.8784243, 2.524973, -0.9061567, 0.7686275, 1, 0, 1,
-0.875912, -2.283977, -2.898597, 0.7647059, 1, 0, 1,
-0.871594, 1.102266, -2.175165, 0.7568628, 1, 0, 1,
-0.8715786, -0.1905714, -1.674517, 0.7529412, 1, 0, 1,
-0.8645807, 0.5866802, -0.137385, 0.7450981, 1, 0, 1,
-0.8637677, -0.2183914, -2.038592, 0.7411765, 1, 0, 1,
-0.8626996, -1.203975, -5.478027, 0.7333333, 1, 0, 1,
-0.8574474, -1.457158, -1.677226, 0.7294118, 1, 0, 1,
-0.8536084, -2.544525, -3.024681, 0.7215686, 1, 0, 1,
-0.8530775, 0.7233685, -1.605494, 0.7176471, 1, 0, 1,
-0.8492467, -1.795325, -2.019053, 0.7098039, 1, 0, 1,
-0.8436069, -0.2584848, -1.764582, 0.7058824, 1, 0, 1,
-0.8321344, 1.358246, -0.6402634, 0.6980392, 1, 0, 1,
-0.8247729, 0.2737893, 0.4156921, 0.6901961, 1, 0, 1,
-0.8199688, 0.0799582, -1.859, 0.6862745, 1, 0, 1,
-0.8173863, -0.9152671, -1.488216, 0.6784314, 1, 0, 1,
-0.8155963, -0.173591, -1.57055, 0.6745098, 1, 0, 1,
-0.8130378, 0.05110936, -0.7789201, 0.6666667, 1, 0, 1,
-0.8090649, 0.8012572, -0.6061594, 0.6627451, 1, 0, 1,
-0.8087537, -0.7273943, -1.465959, 0.654902, 1, 0, 1,
-0.8045669, 1.464254, -0.2323421, 0.6509804, 1, 0, 1,
-0.8042217, -2.077582, -3.408567, 0.6431373, 1, 0, 1,
-0.8016492, -1.487233, -4.486327, 0.6392157, 1, 0, 1,
-0.7962973, -0.6541641, -2.073378, 0.6313726, 1, 0, 1,
-0.787315, 0.03336177, -3.096594, 0.627451, 1, 0, 1,
-0.7833837, -1.834371, -2.193895, 0.6196079, 1, 0, 1,
-0.7822971, -0.472946, -2.232685, 0.6156863, 1, 0, 1,
-0.7752926, 0.5734875, -2.765034, 0.6078432, 1, 0, 1,
-0.77305, 1.264101, 0.4060126, 0.6039216, 1, 0, 1,
-0.7713691, 1.614939, 0.2347257, 0.5960785, 1, 0, 1,
-0.7700865, -0.1741383, -0.8370528, 0.5882353, 1, 0, 1,
-0.7657012, -1.133254, -3.39427, 0.5843138, 1, 0, 1,
-0.7582512, 0.3496361, -1.54029, 0.5764706, 1, 0, 1,
-0.7498572, -0.9274733, -1.27623, 0.572549, 1, 0, 1,
-0.7432879, -0.691663, -3.431179, 0.5647059, 1, 0, 1,
-0.7424282, -1.392578, -1.962767, 0.5607843, 1, 0, 1,
-0.7423286, -0.138427, -1.534165, 0.5529412, 1, 0, 1,
-0.7385079, -0.5709585, -1.557225, 0.5490196, 1, 0, 1,
-0.7370582, -0.2771336, -0.006498249, 0.5411765, 1, 0, 1,
-0.7321299, -0.3437178, -0.9069581, 0.5372549, 1, 0, 1,
-0.7287963, 1.487832, -1.319891, 0.5294118, 1, 0, 1,
-0.7151188, 0.311708, -2.057454, 0.5254902, 1, 0, 1,
-0.7107161, 0.7843126, -1.724751, 0.5176471, 1, 0, 1,
-0.7081068, -1.227157, -2.945136, 0.5137255, 1, 0, 1,
-0.7059169, 1.2474, -1.574116, 0.5058824, 1, 0, 1,
-0.7018551, -2.485012, -3.438631, 0.5019608, 1, 0, 1,
-0.6946005, -1.980359, -4.418917, 0.4941176, 1, 0, 1,
-0.6928242, 0.7045488, 0.1663981, 0.4862745, 1, 0, 1,
-0.6914449, -1.287204, -1.64598, 0.4823529, 1, 0, 1,
-0.6890028, 0.9361064, -2.743488, 0.4745098, 1, 0, 1,
-0.6885532, -0.560047, -3.523716, 0.4705882, 1, 0, 1,
-0.6881047, -0.6037358, -1.997385, 0.4627451, 1, 0, 1,
-0.6813281, 0.05844174, -1.269229, 0.4588235, 1, 0, 1,
-0.679123, -0.3015239, -1.423609, 0.4509804, 1, 0, 1,
-0.6732974, -0.741231, -1.241524, 0.4470588, 1, 0, 1,
-0.6701741, -0.5259909, -0.8924364, 0.4392157, 1, 0, 1,
-0.6683002, 0.7059824, -1.797149, 0.4352941, 1, 0, 1,
-0.6668614, -0.04535821, -0.03763264, 0.427451, 1, 0, 1,
-0.6639769, -1.114995, -4.37647, 0.4235294, 1, 0, 1,
-0.6547046, 0.09771372, -1.835847, 0.4156863, 1, 0, 1,
-0.6527118, -1.202859, -2.650455, 0.4117647, 1, 0, 1,
-0.6520532, -0.1048779, -0.9847351, 0.4039216, 1, 0, 1,
-0.6475565, 1.427502, 0.1440586, 0.3960784, 1, 0, 1,
-0.6471231, -1.103775, -2.107382, 0.3921569, 1, 0, 1,
-0.6471217, -0.5172591, -1.887208, 0.3843137, 1, 0, 1,
-0.6455408, 0.4461059, -0.1942575, 0.3803922, 1, 0, 1,
-0.6428284, 0.7458426, -2.279177, 0.372549, 1, 0, 1,
-0.6345619, 1.073847, 0.8569961, 0.3686275, 1, 0, 1,
-0.6327497, -0.01292014, -1.331955, 0.3607843, 1, 0, 1,
-0.6287053, -0.03167741, -1.303479, 0.3568628, 1, 0, 1,
-0.6268857, -0.4519508, -3.826689, 0.3490196, 1, 0, 1,
-0.6232905, -0.05023594, -2.027121, 0.345098, 1, 0, 1,
-0.6055992, 1.12849, -0.06816268, 0.3372549, 1, 0, 1,
-0.6042539, -1.748483, -3.590872, 0.3333333, 1, 0, 1,
-0.5992629, -1.837178, -2.773069, 0.3254902, 1, 0, 1,
-0.5973942, 0.8062174, 0.3064516, 0.3215686, 1, 0, 1,
-0.596241, -0.4192918, -2.014544, 0.3137255, 1, 0, 1,
-0.5910798, -1.602777, -2.203034, 0.3098039, 1, 0, 1,
-0.5893549, -0.01407492, -0.8238483, 0.3019608, 1, 0, 1,
-0.5833622, 0.413439, -0.6790351, 0.2941177, 1, 0, 1,
-0.5831228, -0.02610687, -2.19542, 0.2901961, 1, 0, 1,
-0.5821043, -0.3723063, -0.618224, 0.282353, 1, 0, 1,
-0.5781209, -1.699158, -2.016205, 0.2784314, 1, 0, 1,
-0.5751929, -0.4973943, -2.120338, 0.2705882, 1, 0, 1,
-0.5748291, -0.9493575, -1.570377, 0.2666667, 1, 0, 1,
-0.5727127, -1.377846, -3.98316, 0.2588235, 1, 0, 1,
-0.5723112, -1.371806, -4.781479, 0.254902, 1, 0, 1,
-0.572139, 0.507031, -1.899034, 0.2470588, 1, 0, 1,
-0.5720205, -1.370007, -3.153308, 0.2431373, 1, 0, 1,
-0.5687076, 0.5497177, -0.5008779, 0.2352941, 1, 0, 1,
-0.5672319, -0.5857432, -1.379836, 0.2313726, 1, 0, 1,
-0.5642664, -0.1818346, -1.825253, 0.2235294, 1, 0, 1,
-0.5640516, -0.5904354, -0.7064879, 0.2196078, 1, 0, 1,
-0.55384, 0.9589543, 0.4739362, 0.2117647, 1, 0, 1,
-0.5491982, -0.1287696, -0.8061684, 0.2078431, 1, 0, 1,
-0.5461964, -0.7172043, -2.958123, 0.2, 1, 0, 1,
-0.5440288, -0.2142828, -1.73786, 0.1921569, 1, 0, 1,
-0.5433838, 1.542359, 0.4140917, 0.1882353, 1, 0, 1,
-0.5402184, -0.1498499, -0.4357945, 0.1803922, 1, 0, 1,
-0.5382845, 0.1759783, -0.4409421, 0.1764706, 1, 0, 1,
-0.5379977, -1.727323, -2.275707, 0.1686275, 1, 0, 1,
-0.5324083, 0.4006236, 0.3552279, 0.1647059, 1, 0, 1,
-0.5307057, -0.5310977, -0.3319199, 0.1568628, 1, 0, 1,
-0.5254018, 2.078575, -2.142308, 0.1529412, 1, 0, 1,
-0.523868, -0.5010251, -2.576729, 0.145098, 1, 0, 1,
-0.5226501, -1.161881, -1.946307, 0.1411765, 1, 0, 1,
-0.5191081, 1.290731, -0.4028155, 0.1333333, 1, 0, 1,
-0.5189625, -1.670982, -2.882389, 0.1294118, 1, 0, 1,
-0.5151063, -0.8100997, -4.147927, 0.1215686, 1, 0, 1,
-0.5123324, 1.86533, -1.230415, 0.1176471, 1, 0, 1,
-0.5052772, 0.3873934, -2.359758, 0.1098039, 1, 0, 1,
-0.5024513, -0.1630351, -3.319617, 0.1058824, 1, 0, 1,
-0.5011289, -0.1613129, -2.326582, 0.09803922, 1, 0, 1,
-0.5005602, 1.464784, -1.144137, 0.09019608, 1, 0, 1,
-0.4990031, 0.5338476, -1.700296, 0.08627451, 1, 0, 1,
-0.4971743, 0.6331809, 0.3770583, 0.07843138, 1, 0, 1,
-0.4940806, -0.8664701, -2.065142, 0.07450981, 1, 0, 1,
-0.4927287, -1.031069, -3.551231, 0.06666667, 1, 0, 1,
-0.4911583, 1.275869, -0.09070609, 0.0627451, 1, 0, 1,
-0.489954, -0.1229591, -1.093206, 0.05490196, 1, 0, 1,
-0.4884847, -0.9620496, -0.9943106, 0.05098039, 1, 0, 1,
-0.4868129, -0.3888738, -2.147463, 0.04313726, 1, 0, 1,
-0.483907, -0.5964226, -0.9500871, 0.03921569, 1, 0, 1,
-0.4832031, 1.974368, 0.5202991, 0.03137255, 1, 0, 1,
-0.4812776, -0.2039046, -2.227397, 0.02745098, 1, 0, 1,
-0.4802527, -0.8899259, -1.645674, 0.01960784, 1, 0, 1,
-0.4792573, 1.117885, 1.61116, 0.01568628, 1, 0, 1,
-0.4770915, -1.05792, -2.154019, 0.007843138, 1, 0, 1,
-0.4704136, 2.588219, 1.741214, 0.003921569, 1, 0, 1,
-0.470367, -0.8585114, -3.718343, 0, 1, 0.003921569, 1,
-0.4687658, 1.00957, 0.5915925, 0, 1, 0.01176471, 1,
-0.4629361, 0.225519, -2.082568, 0, 1, 0.01568628, 1,
-0.4602666, 0.5533745, -1.835185, 0, 1, 0.02352941, 1,
-0.4575036, -0.4285823, -0.6367975, 0, 1, 0.02745098, 1,
-0.4574859, -1.142542, -3.692858, 0, 1, 0.03529412, 1,
-0.449481, 0.6412222, 0.2210744, 0, 1, 0.03921569, 1,
-0.4448721, 0.2721615, -1.529175, 0, 1, 0.04705882, 1,
-0.4444707, 1.401485, -0.1964604, 0, 1, 0.05098039, 1,
-0.4442595, 1.431812, -1.353925, 0, 1, 0.05882353, 1,
-0.4424378, -1.715061, -1.810024, 0, 1, 0.0627451, 1,
-0.4391261, 0.3951589, -0.7098143, 0, 1, 0.07058824, 1,
-0.4362006, 1.007988, 0.2135921, 0, 1, 0.07450981, 1,
-0.4290182, -0.3131157, -2.735216, 0, 1, 0.08235294, 1,
-0.4275881, 1.92776, 0.8367971, 0, 1, 0.08627451, 1,
-0.4267513, -0.9033973, -1.433675, 0, 1, 0.09411765, 1,
-0.4262032, 0.7922264, 1.140927, 0, 1, 0.1019608, 1,
-0.4259215, -0.7604392, -1.895851, 0, 1, 0.1058824, 1,
-0.4214516, -2.416624, -4.023863, 0, 1, 0.1137255, 1,
-0.4208311, -1.049521, -3.489269, 0, 1, 0.1176471, 1,
-0.4183714, -0.6476837, -2.441795, 0, 1, 0.1254902, 1,
-0.4125543, 0.9934809, -0.4034421, 0, 1, 0.1294118, 1,
-0.4120364, 1.357903, 0.717846, 0, 1, 0.1372549, 1,
-0.4118508, 1.817853, 0.1619097, 0, 1, 0.1411765, 1,
-0.4046699, 0.2508442, -0.5278269, 0, 1, 0.1490196, 1,
-0.4016823, -0.354723, -2.842726, 0, 1, 0.1529412, 1,
-0.3971001, 0.07832774, -1.878407, 0, 1, 0.1607843, 1,
-0.3907453, 0.8275412, 1.04168, 0, 1, 0.1647059, 1,
-0.3900191, -0.2039429, -3.413189, 0, 1, 0.172549, 1,
-0.3858607, 0.4415912, -0.6614565, 0, 1, 0.1764706, 1,
-0.3851317, -0.765353, -1.336077, 0, 1, 0.1843137, 1,
-0.3842861, -0.5480734, -2.270369, 0, 1, 0.1882353, 1,
-0.371856, -0.572354, -2.427536, 0, 1, 0.1960784, 1,
-0.3709973, 1.750296, 0.4703631, 0, 1, 0.2039216, 1,
-0.3695014, 1.442884, 1.074826, 0, 1, 0.2078431, 1,
-0.3690021, -2.061951, -2.167567, 0, 1, 0.2156863, 1,
-0.3659497, -0.8078797, -4.405893, 0, 1, 0.2196078, 1,
-0.3637676, 0.4352155, 0.3097717, 0, 1, 0.227451, 1,
-0.3637248, 0.6123909, -0.06013763, 0, 1, 0.2313726, 1,
-0.3551654, -1.150456, -4.21236, 0, 1, 0.2392157, 1,
-0.3549331, 0.1494634, -0.6951394, 0, 1, 0.2431373, 1,
-0.3530352, -1.739598, -3.644416, 0, 1, 0.2509804, 1,
-0.3454543, 0.04635219, -2.35476, 0, 1, 0.254902, 1,
-0.3453785, 0.1036725, -1.863292, 0, 1, 0.2627451, 1,
-0.3327644, -0.3674073, -4.537978, 0, 1, 0.2666667, 1,
-0.3290708, -0.1326873, -3.339196, 0, 1, 0.2745098, 1,
-0.3284467, 0.8769044, -0.8927909, 0, 1, 0.2784314, 1,
-0.3282294, 0.947648, 0.1047029, 0, 1, 0.2862745, 1,
-0.3266895, -0.5721084, -3.2243, 0, 1, 0.2901961, 1,
-0.322088, -1.08855, -2.190494, 0, 1, 0.2980392, 1,
-0.3140933, -0.5934203, -2.551787, 0, 1, 0.3058824, 1,
-0.3124222, 0.955233, -0.4965122, 0, 1, 0.3098039, 1,
-0.3109097, 0.4773592, -0.6516511, 0, 1, 0.3176471, 1,
-0.3077216, 0.9405904, -2.31484, 0, 1, 0.3215686, 1,
-0.3070242, 0.191146, -0.04169653, 0, 1, 0.3294118, 1,
-0.3067836, 1.801903, -1.850519, 0, 1, 0.3333333, 1,
-0.2999111, 2.142986, -0.2212501, 0, 1, 0.3411765, 1,
-0.2973579, 0.1968566, -0.8533283, 0, 1, 0.345098, 1,
-0.29717, -0.6790006, -3.010641, 0, 1, 0.3529412, 1,
-0.2959267, 0.1122607, -1.377533, 0, 1, 0.3568628, 1,
-0.2941348, -2.523768, -2.372085, 0, 1, 0.3647059, 1,
-0.291251, -1.204851, -3.040323, 0, 1, 0.3686275, 1,
-0.2901023, -0.9041464, -1.958825, 0, 1, 0.3764706, 1,
-0.2892906, 2.439598, -0.4962138, 0, 1, 0.3803922, 1,
-0.2857007, -0.5530695, -2.685456, 0, 1, 0.3882353, 1,
-0.2854463, 1.120403, -0.1834531, 0, 1, 0.3921569, 1,
-0.2840178, 0.08985232, 0.000358664, 0, 1, 0.4, 1,
-0.2663164, 0.1164014, -1.343033, 0, 1, 0.4078431, 1,
-0.2641923, 1.645671, -2.512464, 0, 1, 0.4117647, 1,
-0.262051, -0.8138385, -3.543262, 0, 1, 0.4196078, 1,
-0.2577386, 0.2362884, 0.01129865, 0, 1, 0.4235294, 1,
-0.2530254, -0.6748962, -3.438647, 0, 1, 0.4313726, 1,
-0.2466005, -0.5099465, -0.577, 0, 1, 0.4352941, 1,
-0.2450206, -1.136095, -2.015266, 0, 1, 0.4431373, 1,
-0.2441298, 0.07087127, -1.394425, 0, 1, 0.4470588, 1,
-0.2434369, -0.3367433, -1.566833, 0, 1, 0.454902, 1,
-0.2371923, -1.019748, -1.761253, 0, 1, 0.4588235, 1,
-0.2331163, 0.195366, 0.03272523, 0, 1, 0.4666667, 1,
-0.2273299, -0.0355087, 0.5216878, 0, 1, 0.4705882, 1,
-0.2261786, 0.9193035, 0.7357776, 0, 1, 0.4784314, 1,
-0.2220758, -0.5183368, -1.50357, 0, 1, 0.4823529, 1,
-0.2218889, 0.7297934, 0.005828095, 0, 1, 0.4901961, 1,
-0.2200554, -1.051488, -3.475133, 0, 1, 0.4941176, 1,
-0.2186126, -0.3902897, -2.0228, 0, 1, 0.5019608, 1,
-0.2177086, 0.08405021, 0.1475212, 0, 1, 0.509804, 1,
-0.2172446, 1.094607, -0.6805515, 0, 1, 0.5137255, 1,
-0.2164898, -1.729284, -4.183776, 0, 1, 0.5215687, 1,
-0.2148272, 1.017956, 0.2350234, 0, 1, 0.5254902, 1,
-0.2120769, -0.6959946, -2.42595, 0, 1, 0.5333334, 1,
-0.211484, 0.03302374, -1.746902, 0, 1, 0.5372549, 1,
-0.2111068, -0.9448652, -3.18409, 0, 1, 0.5450981, 1,
-0.2100564, -0.9195122, -2.258828, 0, 1, 0.5490196, 1,
-0.2068813, -0.3959667, -3.737462, 0, 1, 0.5568628, 1,
-0.2060393, 0.4175296, -1.413123, 0, 1, 0.5607843, 1,
-0.2044145, 0.4174119, -0.4624084, 0, 1, 0.5686275, 1,
-0.2025369, -1.337563, -2.890812, 0, 1, 0.572549, 1,
-0.2015302, 0.07638884, -2.867834, 0, 1, 0.5803922, 1,
-0.2011129, 0.2071766, -1.503181, 0, 1, 0.5843138, 1,
-0.1997627, 0.8390765, 0.6488805, 0, 1, 0.5921569, 1,
-0.1997395, -1.152703, -2.95909, 0, 1, 0.5960785, 1,
-0.1976078, 1.558076, -0.9060374, 0, 1, 0.6039216, 1,
-0.1975785, 0.8708909, -0.9833205, 0, 1, 0.6117647, 1,
-0.1963404, -0.3435001, -1.927151, 0, 1, 0.6156863, 1,
-0.1948382, -0.9404649, -3.733075, 0, 1, 0.6235294, 1,
-0.1902265, -0.5878118, -3.350154, 0, 1, 0.627451, 1,
-0.1854918, 0.1452616, 0.4841049, 0, 1, 0.6352941, 1,
-0.1851583, -0.8446487, -3.215379, 0, 1, 0.6392157, 1,
-0.1849791, 0.6615226, 1.25128, 0, 1, 0.6470588, 1,
-0.1772097, -0.1839072, -1.790771, 0, 1, 0.6509804, 1,
-0.1721474, 0.1103387, -1.412748, 0, 1, 0.6588235, 1,
-0.1719364, 0.9798644, 0.130826, 0, 1, 0.6627451, 1,
-0.1585246, 0.2030446, -1.711747, 0, 1, 0.6705883, 1,
-0.1580082, -1.167853, -5.153661, 0, 1, 0.6745098, 1,
-0.1548118, -1.113289, -1.208907, 0, 1, 0.682353, 1,
-0.1522491, 0.5433685, 0.2843697, 0, 1, 0.6862745, 1,
-0.1425269, -0.6782415, -3.056533, 0, 1, 0.6941177, 1,
-0.1323563, 0.2537137, -1.04028, 0, 1, 0.7019608, 1,
-0.1294504, 0.4693797, 0.0904768, 0, 1, 0.7058824, 1,
-0.1259477, 1.755035, 0.9830488, 0, 1, 0.7137255, 1,
-0.1251783, 0.04871702, -0.1735984, 0, 1, 0.7176471, 1,
-0.1229449, 0.2487671, -0.5356513, 0, 1, 0.7254902, 1,
-0.1156715, -0.03012542, -0.4606414, 0, 1, 0.7294118, 1,
-0.1109917, -0.3951964, -2.83054, 0, 1, 0.7372549, 1,
-0.1091518, 0.3097845, -0.01377447, 0, 1, 0.7411765, 1,
-0.1034981, 0.9435928, 0.4880342, 0, 1, 0.7490196, 1,
-0.09993907, 0.1097828, -0.8559744, 0, 1, 0.7529412, 1,
-0.09472901, 1.707884, 0.5993235, 0, 1, 0.7607843, 1,
-0.09421999, -0.7342762, -3.979866, 0, 1, 0.7647059, 1,
-0.08965964, 2.275079, -0.4693238, 0, 1, 0.772549, 1,
-0.08934166, 0.1149246, -0.7487462, 0, 1, 0.7764706, 1,
-0.08811106, 0.418147, -0.8543881, 0, 1, 0.7843137, 1,
-0.08671211, -0.6043836, -2.71886, 0, 1, 0.7882353, 1,
-0.08621328, -1.313002, -1.636015, 0, 1, 0.7960784, 1,
-0.08357199, -0.5785493, -3.611929, 0, 1, 0.8039216, 1,
-0.08108817, 1.422671, 0.2881121, 0, 1, 0.8078431, 1,
-0.0770198, -1.045185, -3.62795, 0, 1, 0.8156863, 1,
-0.07675072, 0.959627, -1.212443, 0, 1, 0.8196079, 1,
-0.07303287, 0.6387806, -0.1639967, 0, 1, 0.827451, 1,
-0.07024783, 0.4705869, -2.360833, 0, 1, 0.8313726, 1,
-0.06959435, 0.3477837, 1.556564, 0, 1, 0.8392157, 1,
-0.06575193, -0.4588271, -3.891402, 0, 1, 0.8431373, 1,
-0.05904736, -0.9805486, -2.681239, 0, 1, 0.8509804, 1,
-0.05597127, 1.585222, -0.139443, 0, 1, 0.854902, 1,
-0.05559073, -0.3125317, -3.129976, 0, 1, 0.8627451, 1,
-0.05545071, 0.6521031, 0.1260463, 0, 1, 0.8666667, 1,
-0.05216282, 0.225776, 0.1866607, 0, 1, 0.8745098, 1,
-0.05180264, 0.2202955, 0.1256975, 0, 1, 0.8784314, 1,
-0.04896286, -0.4195404, -3.319633, 0, 1, 0.8862745, 1,
-0.04571543, -0.1611879, -3.262641, 0, 1, 0.8901961, 1,
-0.04335082, 0.2151648, 0.7083035, 0, 1, 0.8980392, 1,
-0.04319852, 1.240958, -0.708174, 0, 1, 0.9058824, 1,
-0.03926627, 0.5535605, -1.264962, 0, 1, 0.9098039, 1,
-0.03869577, 1.931042, 0.03859613, 0, 1, 0.9176471, 1,
-0.03627446, 0.08348545, -0.4362831, 0, 1, 0.9215686, 1,
-0.0361862, 1.031963, -1.265692, 0, 1, 0.9294118, 1,
-0.03321886, -0.3829575, -0.9586294, 0, 1, 0.9333333, 1,
-0.02456713, 1.856962, 0.3332297, 0, 1, 0.9411765, 1,
-0.02440964, -1.323311, -3.07008, 0, 1, 0.945098, 1,
-0.02144183, -0.7026035, -3.541883, 0, 1, 0.9529412, 1,
-0.01948145, 0.2483102, -1.190957, 0, 1, 0.9568627, 1,
-0.01922638, -2.481803, -3.161297, 0, 1, 0.9647059, 1,
-0.01754551, -0.3116826, -2.104201, 0, 1, 0.9686275, 1,
-0.01498508, 1.52924, -2.105137, 0, 1, 0.9764706, 1,
-0.01373672, -0.2473594, -3.274017, 0, 1, 0.9803922, 1,
-0.009656007, -0.1783471, -2.036465, 0, 1, 0.9882353, 1,
-0.00797852, 1.718211, 0.5973029, 0, 1, 0.9921569, 1,
-0.007644798, -0.7121694, -2.28384, 0, 1, 1, 1,
-0.007373944, -1.29405, -2.412372, 0, 0.9921569, 1, 1,
-0.006878535, -0.1449107, -2.417605, 0, 0.9882353, 1, 1,
-0.0007716567, 1.104754, 1.075784, 0, 0.9803922, 1, 1,
0.00104881, -0.5159072, 3.100865, 0, 0.9764706, 1, 1,
0.003099657, -2.709687, 5.813286, 0, 0.9686275, 1, 1,
0.005201821, -0.2946157, 2.576346, 0, 0.9647059, 1, 1,
0.006305214, 0.3168542, -1.126494, 0, 0.9568627, 1, 1,
0.00662868, -0.8897421, 4.02768, 0, 0.9529412, 1, 1,
0.009943071, -0.6549423, 3.822545, 0, 0.945098, 1, 1,
0.01096992, 1.028514, -0.4355189, 0, 0.9411765, 1, 1,
0.0114295, -0.5416048, 2.804576, 0, 0.9333333, 1, 1,
0.01867314, 0.08122922, -1.994603, 0, 0.9294118, 1, 1,
0.02446579, 0.6426603, -0.4059109, 0, 0.9215686, 1, 1,
0.02620591, -0.4881745, 1.620142, 0, 0.9176471, 1, 1,
0.02801607, -0.4123727, 1.748282, 0, 0.9098039, 1, 1,
0.02905646, 0.7369499, -0.6841129, 0, 0.9058824, 1, 1,
0.02990413, -0.4893449, 4.599083, 0, 0.8980392, 1, 1,
0.03242434, -1.769106, 2.512294, 0, 0.8901961, 1, 1,
0.03690879, 0.836305, 0.6002015, 0, 0.8862745, 1, 1,
0.03729651, 0.254049, -1.109198, 0, 0.8784314, 1, 1,
0.03818114, -0.5687461, 2.47983, 0, 0.8745098, 1, 1,
0.04947496, -0.3866735, 3.011392, 0, 0.8666667, 1, 1,
0.05111391, 0.735845, 0.6777629, 0, 0.8627451, 1, 1,
0.05161861, 0.3699689, -0.0325417, 0, 0.854902, 1, 1,
0.05224422, 0.2226799, 0.3003411, 0, 0.8509804, 1, 1,
0.05614887, -0.1521845, 1.487882, 0, 0.8431373, 1, 1,
0.05751048, -1.098006, 1.731912, 0, 0.8392157, 1, 1,
0.06078358, -1.247496, 1.414688, 0, 0.8313726, 1, 1,
0.06190356, -0.6477815, 4.413519, 0, 0.827451, 1, 1,
0.06427926, 0.5858849, -0.4094653, 0, 0.8196079, 1, 1,
0.06556097, -0.3284794, 2.77373, 0, 0.8156863, 1, 1,
0.06562214, -1.355963, 4.465405, 0, 0.8078431, 1, 1,
0.06626611, -1.014012, 2.475329, 0, 0.8039216, 1, 1,
0.06719788, 0.2851898, 0.3078119, 0, 0.7960784, 1, 1,
0.06885616, 0.4436767, 0.97062, 0, 0.7882353, 1, 1,
0.0689343, 1.062703, 0.2411301, 0, 0.7843137, 1, 1,
0.07076023, -0.07326088, 2.962059, 0, 0.7764706, 1, 1,
0.07154279, 1.085999, -0.6663843, 0, 0.772549, 1, 1,
0.07269522, -0.6976911, 3.22171, 0, 0.7647059, 1, 1,
0.07316156, -0.7308989, 2.274013, 0, 0.7607843, 1, 1,
0.07685132, -1.748052, 3.671654, 0, 0.7529412, 1, 1,
0.07807352, 0.2098312, -0.1212345, 0, 0.7490196, 1, 1,
0.08895143, -0.197244, 3.348413, 0, 0.7411765, 1, 1,
0.09060713, 0.8606728, -0.1224697, 0, 0.7372549, 1, 1,
0.09199025, 1.319411, 1.871258, 0, 0.7294118, 1, 1,
0.09241186, 2.494632, -0.1983404, 0, 0.7254902, 1, 1,
0.09493319, 0.3619571, 0.7238906, 0, 0.7176471, 1, 1,
0.09937186, -0.0248615, 3.680877, 0, 0.7137255, 1, 1,
0.1016161, 0.03756784, 1.16041, 0, 0.7058824, 1, 1,
0.102494, -0.4418929, 2.453073, 0, 0.6980392, 1, 1,
0.1069783, 2.018584, -0.2729633, 0, 0.6941177, 1, 1,
0.1130033, -0.8823516, 2.747255, 0, 0.6862745, 1, 1,
0.114573, 0.2468348, 0.3279025, 0, 0.682353, 1, 1,
0.1212866, 0.9263071, 1.418612, 0, 0.6745098, 1, 1,
0.1232521, -1.649233, 2.657386, 0, 0.6705883, 1, 1,
0.1283765, 2.726867, -0.7223332, 0, 0.6627451, 1, 1,
0.1346084, -0.2989183, 3.334465, 0, 0.6588235, 1, 1,
0.1363811, -0.2615609, 4.437768, 0, 0.6509804, 1, 1,
0.1416349, -1.009576, 3.214084, 0, 0.6470588, 1, 1,
0.1448946, -0.08203321, 1.972031, 0, 0.6392157, 1, 1,
0.1470063, 0.4878879, 1.967505, 0, 0.6352941, 1, 1,
0.1473732, 1.562996, -0.1201292, 0, 0.627451, 1, 1,
0.151654, 0.8648711, -0.7605006, 0, 0.6235294, 1, 1,
0.1529527, -0.6359437, 4.192324, 0, 0.6156863, 1, 1,
0.1530305, -1.418318, 2.852275, 0, 0.6117647, 1, 1,
0.1541238, 2.019804, -1.780479, 0, 0.6039216, 1, 1,
0.1552982, 0.3482141, 0.3135402, 0, 0.5960785, 1, 1,
0.1563735, 0.3386624, 0.5180546, 0, 0.5921569, 1, 1,
0.157521, -0.07677573, 1.013938, 0, 0.5843138, 1, 1,
0.1583067, -0.8473503, 4.310501, 0, 0.5803922, 1, 1,
0.1583633, -0.3495624, 2.394016, 0, 0.572549, 1, 1,
0.1586935, -1.145633, 3.420736, 0, 0.5686275, 1, 1,
0.1641816, 0.1091661, 3.277624, 0, 0.5607843, 1, 1,
0.1666022, -0.6826218, 2.769523, 0, 0.5568628, 1, 1,
0.1667025, 1.024603, -0.27157, 0, 0.5490196, 1, 1,
0.167467, -1.360609, -0.5388546, 0, 0.5450981, 1, 1,
0.1685385, 3.678531, 1.4157, 0, 0.5372549, 1, 1,
0.1687177, -3.170569, 3.600534, 0, 0.5333334, 1, 1,
0.1709182, 0.7407292, 2.441827, 0, 0.5254902, 1, 1,
0.1709308, 0.6078008, -0.4343495, 0, 0.5215687, 1, 1,
0.1737549, -0.7459533, 2.473406, 0, 0.5137255, 1, 1,
0.1761182, 1.129688, 0.3847226, 0, 0.509804, 1, 1,
0.1789509, -0.8954854, 1.68064, 0, 0.5019608, 1, 1,
0.1791394, -0.9238884, 0.3389857, 0, 0.4941176, 1, 1,
0.1798175, 1.624011, -2.114325, 0, 0.4901961, 1, 1,
0.1811466, -0.7366213, 3.23271, 0, 0.4823529, 1, 1,
0.1841639, 0.3541685, 1.814405, 0, 0.4784314, 1, 1,
0.1855537, -2.002063, 1.931657, 0, 0.4705882, 1, 1,
0.1860019, 0.3059401, -0.363424, 0, 0.4666667, 1, 1,
0.1888986, 0.3672668, 0.8650128, 0, 0.4588235, 1, 1,
0.1919019, -0.2623782, 3.035495, 0, 0.454902, 1, 1,
0.1940799, -1.279532, 1.778968, 0, 0.4470588, 1, 1,
0.1960886, -0.3814305, 2.41897, 0, 0.4431373, 1, 1,
0.1967619, -0.3766441, 1.616455, 0, 0.4352941, 1, 1,
0.1983825, 0.1522959, 0.2730212, 0, 0.4313726, 1, 1,
0.1990752, 0.1193306, 0.06595587, 0, 0.4235294, 1, 1,
0.2018659, -0.5179355, 4.220845, 0, 0.4196078, 1, 1,
0.2022169, 0.6445047, -0.3628604, 0, 0.4117647, 1, 1,
0.2044492, -0.3973582, 3.783453, 0, 0.4078431, 1, 1,
0.2054597, 1.653949, -2.690903, 0, 0.4, 1, 1,
0.207045, -0.2228089, 2.45198, 0, 0.3921569, 1, 1,
0.209221, -1.406476, 3.939072, 0, 0.3882353, 1, 1,
0.2109196, -0.8531829, 1.606009, 0, 0.3803922, 1, 1,
0.2157562, -0.2090096, 2.846979, 0, 0.3764706, 1, 1,
0.2192548, -2.055009, 4.042223, 0, 0.3686275, 1, 1,
0.2217913, -0.8595891, 5.244733, 0, 0.3647059, 1, 1,
0.2257003, -0.3271361, 3.399172, 0, 0.3568628, 1, 1,
0.2288065, 0.007738476, 2.259201, 0, 0.3529412, 1, 1,
0.2318742, -1.250356, 5.167706, 0, 0.345098, 1, 1,
0.2338755, 0.1597386, 2.405894, 0, 0.3411765, 1, 1,
0.2372985, 1.123019, -1.065541, 0, 0.3333333, 1, 1,
0.2397917, 0.9633048, 0.385824, 0, 0.3294118, 1, 1,
0.2453106, -0.9055431, 1.689348, 0, 0.3215686, 1, 1,
0.2463672, 0.2779526, -0.1729957, 0, 0.3176471, 1, 1,
0.2463912, 0.4986339, 1.228742, 0, 0.3098039, 1, 1,
0.2467353, -0.7974666, 2.039786, 0, 0.3058824, 1, 1,
0.2500181, 0.8786348, 0.4316229, 0, 0.2980392, 1, 1,
0.2579051, -0.2734102, 1.533765, 0, 0.2901961, 1, 1,
0.2591853, 0.4385968, -0.6461048, 0, 0.2862745, 1, 1,
0.2592619, 0.00520163, 2.740615, 0, 0.2784314, 1, 1,
0.266077, -0.1213121, 2.617416, 0, 0.2745098, 1, 1,
0.268117, -0.4450881, 2.765914, 0, 0.2666667, 1, 1,
0.2685511, -2.090761, 3.01481, 0, 0.2627451, 1, 1,
0.269944, 0.8578219, 1.863408, 0, 0.254902, 1, 1,
0.2722447, 0.4620989, 1.286411, 0, 0.2509804, 1, 1,
0.2728014, 1.510928, -0.4299983, 0, 0.2431373, 1, 1,
0.2770674, -0.9853969, 3.549671, 0, 0.2392157, 1, 1,
0.281021, -0.1790629, 0.8491463, 0, 0.2313726, 1, 1,
0.285602, -0.3152329, 1.182811, 0, 0.227451, 1, 1,
0.2875644, 0.8849476, 0.9117666, 0, 0.2196078, 1, 1,
0.2913266, 1.434021, -0.296889, 0, 0.2156863, 1, 1,
0.2936729, 1.535223, 0.9382247, 0, 0.2078431, 1, 1,
0.298194, -0.4034716, 4.178361, 0, 0.2039216, 1, 1,
0.2993787, 0.05662446, 1.159485, 0, 0.1960784, 1, 1,
0.2995805, 1.276055, -0.3308358, 0, 0.1882353, 1, 1,
0.300402, 0.2528695, 0.6979654, 0, 0.1843137, 1, 1,
0.3008814, -0.4289983, 3.185425, 0, 0.1764706, 1, 1,
0.3029498, 0.8343313, 0.4290012, 0, 0.172549, 1, 1,
0.3032692, 0.2721172, -0.5019105, 0, 0.1647059, 1, 1,
0.3041116, -0.5443913, -0.3603248, 0, 0.1607843, 1, 1,
0.3049875, 0.2747499, 0.9506506, 0, 0.1529412, 1, 1,
0.305172, 0.04522014, 0.458982, 0, 0.1490196, 1, 1,
0.3063512, 0.7638572, 0.9641321, 0, 0.1411765, 1, 1,
0.3076468, -1.331458, 3.0103, 0, 0.1372549, 1, 1,
0.3079373, -1.020318, 5.32307, 0, 0.1294118, 1, 1,
0.3141176, 0.8784729, 0.9363762, 0, 0.1254902, 1, 1,
0.3165273, -0.6587451, 2.332291, 0, 0.1176471, 1, 1,
0.3174378, -0.0003801463, 1.363134, 0, 0.1137255, 1, 1,
0.3184354, -1.287765, 3.569092, 0, 0.1058824, 1, 1,
0.3232187, -1.041104, 2.573008, 0, 0.09803922, 1, 1,
0.3235022, -0.946991, 2.740139, 0, 0.09411765, 1, 1,
0.3238263, -0.3681438, 1.379685, 0, 0.08627451, 1, 1,
0.3246414, -0.969746, 1.914818, 0, 0.08235294, 1, 1,
0.3247848, 0.007810729, 1.289789, 0, 0.07450981, 1, 1,
0.3270102, -0.5263301, 2.876054, 0, 0.07058824, 1, 1,
0.3298869, 1.282702, 1.356374, 0, 0.0627451, 1, 1,
0.3352661, -0.6038527, 0.8509881, 0, 0.05882353, 1, 1,
0.335415, 0.1847488, 1.448483, 0, 0.05098039, 1, 1,
0.336049, -0.007824631, 2.653659, 0, 0.04705882, 1, 1,
0.3434512, 1.852524, 1.770732, 0, 0.03921569, 1, 1,
0.3443034, 0.1565449, 1.212966, 0, 0.03529412, 1, 1,
0.3454521, 1.069308, 0.5037202, 0, 0.02745098, 1, 1,
0.3578716, -0.4077262, 3.724383, 0, 0.02352941, 1, 1,
0.3611895, -0.5803362, 1.303796, 0, 0.01568628, 1, 1,
0.361483, -2.207026, 5.614645, 0, 0.01176471, 1, 1,
0.3620282, -0.1966347, 4.682519, 0, 0.003921569, 1, 1,
0.3651702, -0.3199485, 2.301442, 0.003921569, 0, 1, 1,
0.3655944, -0.02670391, 3.710685, 0.007843138, 0, 1, 1,
0.3672846, 0.8971106, -0.1137512, 0.01568628, 0, 1, 1,
0.3685969, 0.1632272, 1.882799, 0.01960784, 0, 1, 1,
0.3710927, 0.4206531, 2.101996, 0.02745098, 0, 1, 1,
0.3720973, 0.3302085, 1.401028, 0.03137255, 0, 1, 1,
0.3743941, 0.3776188, 0.7728093, 0.03921569, 0, 1, 1,
0.374844, 0.01093671, -1.412165, 0.04313726, 0, 1, 1,
0.3771545, -1.334, 3.265378, 0.05098039, 0, 1, 1,
0.3925927, 0.2790899, 1.290697, 0.05490196, 0, 1, 1,
0.394486, -1.565073, 2.253515, 0.0627451, 0, 1, 1,
0.3964422, 1.2654, 0.2147243, 0.06666667, 0, 1, 1,
0.3973628, 0.6490639, 1.993248, 0.07450981, 0, 1, 1,
0.4020188, -0.01945125, -0.1643372, 0.07843138, 0, 1, 1,
0.4027937, 0.6291702, -0.5430111, 0.08627451, 0, 1, 1,
0.4117962, 0.4417658, 0.9199847, 0.09019608, 0, 1, 1,
0.4118916, 1.160175, -0.7817118, 0.09803922, 0, 1, 1,
0.4133554, 0.2055826, 0.4839018, 0.1058824, 0, 1, 1,
0.4150259, 0.7929509, 0.7019532, 0.1098039, 0, 1, 1,
0.4191595, -0.6767312, 2.682652, 0.1176471, 0, 1, 1,
0.4209803, -0.6206976, 1.753091, 0.1215686, 0, 1, 1,
0.426715, 0.561361, 1.622169, 0.1294118, 0, 1, 1,
0.4294133, -1.873819, 2.126373, 0.1333333, 0, 1, 1,
0.429463, -0.1400479, 0.4982863, 0.1411765, 0, 1, 1,
0.4301626, 0.2000083, 0.4550017, 0.145098, 0, 1, 1,
0.4319621, 0.9372185, 0.251047, 0.1529412, 0, 1, 1,
0.4355229, 0.7048336, -1.635253, 0.1568628, 0, 1, 1,
0.4397512, 0.6937503, 0.5877823, 0.1647059, 0, 1, 1,
0.4499852, -0.0235333, 1.859759, 0.1686275, 0, 1, 1,
0.4529289, -0.2291716, 1.487758, 0.1764706, 0, 1, 1,
0.4571017, -0.2248224, 0.440983, 0.1803922, 0, 1, 1,
0.4575782, 0.2508056, 2.055446, 0.1882353, 0, 1, 1,
0.4610149, 0.5277967, 1.235422, 0.1921569, 0, 1, 1,
0.4701214, -0.01147925, 2.424192, 0.2, 0, 1, 1,
0.4723048, -2.506466, 2.345079, 0.2078431, 0, 1, 1,
0.4760909, 1.272792, 0.9021457, 0.2117647, 0, 1, 1,
0.4788274, 0.2235808, 2.001907, 0.2196078, 0, 1, 1,
0.4840673, -1.730271, 2.61208, 0.2235294, 0, 1, 1,
0.4887579, 1.350582, -0.1423196, 0.2313726, 0, 1, 1,
0.4901514, -0.4502381, 1.547331, 0.2352941, 0, 1, 1,
0.4947262, 1.382116, -0.9393895, 0.2431373, 0, 1, 1,
0.4972333, 0.676617, 0.04225554, 0.2470588, 0, 1, 1,
0.5016996, -0.1517352, 3.020775, 0.254902, 0, 1, 1,
0.5022591, -1.319022, 3.449504, 0.2588235, 0, 1, 1,
0.5044369, -0.1254083, 1.947676, 0.2666667, 0, 1, 1,
0.5152901, -1.368924, 4.283991, 0.2705882, 0, 1, 1,
0.5208051, 1.691725, 0.5566492, 0.2784314, 0, 1, 1,
0.521153, 1.004237, -0.5425878, 0.282353, 0, 1, 1,
0.5259442, -1.945038, 4.715057, 0.2901961, 0, 1, 1,
0.528836, -0.05940246, 1.310429, 0.2941177, 0, 1, 1,
0.5290851, -0.7734703, 2.661409, 0.3019608, 0, 1, 1,
0.5370623, -0.2923433, 4.04536, 0.3098039, 0, 1, 1,
0.5401632, -0.2285127, 1.89685, 0.3137255, 0, 1, 1,
0.5422894, -0.5721908, 0.9997295, 0.3215686, 0, 1, 1,
0.5449312, -0.3906524, 0.4253529, 0.3254902, 0, 1, 1,
0.548749, -0.003958798, 0.4116429, 0.3333333, 0, 1, 1,
0.5494977, 0.3890343, 2.314742, 0.3372549, 0, 1, 1,
0.5528893, -0.7792501, 2.512193, 0.345098, 0, 1, 1,
0.5604495, -0.1745279, 3.716076, 0.3490196, 0, 1, 1,
0.5607989, 1.408531, -0.3743567, 0.3568628, 0, 1, 1,
0.5640425, -0.4146815, 1.834603, 0.3607843, 0, 1, 1,
0.5648155, 0.4647603, 2.602805, 0.3686275, 0, 1, 1,
0.566781, -0.3047443, 0.4875014, 0.372549, 0, 1, 1,
0.5740647, -0.2192548, 2.099792, 0.3803922, 0, 1, 1,
0.5816267, -1.170331, 2.63539, 0.3843137, 0, 1, 1,
0.5819387, -0.1509134, 2.540369, 0.3921569, 0, 1, 1,
0.5886222, -0.3007921, 0.3801918, 0.3960784, 0, 1, 1,
0.5911015, 0.6998, 1.319921, 0.4039216, 0, 1, 1,
0.5961134, -0.8251296, 2.310049, 0.4117647, 0, 1, 1,
0.5979659, -1.037242, 1.373654, 0.4156863, 0, 1, 1,
0.5988557, -0.1130499, 1.406658, 0.4235294, 0, 1, 1,
0.599829, 0.01501813, 1.847109, 0.427451, 0, 1, 1,
0.6044759, -0.2150555, 3.05907, 0.4352941, 0, 1, 1,
0.6085894, 0.582794, 1.596484, 0.4392157, 0, 1, 1,
0.6123335, -0.8024086, 2.121555, 0.4470588, 0, 1, 1,
0.6205183, 0.4054467, 2.302258, 0.4509804, 0, 1, 1,
0.6206217, 1.091422, 1.193788, 0.4588235, 0, 1, 1,
0.6233779, -0.6357151, 2.441858, 0.4627451, 0, 1, 1,
0.6234999, 1.924812, 0.8129526, 0.4705882, 0, 1, 1,
0.6253268, -0.1578771, 1.318217, 0.4745098, 0, 1, 1,
0.626021, 0.4608558, 1.968427, 0.4823529, 0, 1, 1,
0.6260303, -1.966297, 2.719902, 0.4862745, 0, 1, 1,
0.6264153, 0.7678149, 0.9920031, 0.4941176, 0, 1, 1,
0.6266741, -1.012098, 1.210835, 0.5019608, 0, 1, 1,
0.6398179, 0.8768765, -0.987993, 0.5058824, 0, 1, 1,
0.6442318, -0.5133078, 1.100427, 0.5137255, 0, 1, 1,
0.6478349, -0.549302, 2.935503, 0.5176471, 0, 1, 1,
0.6519035, 0.1216411, 0.8076078, 0.5254902, 0, 1, 1,
0.6533689, 0.23668, 1.727786, 0.5294118, 0, 1, 1,
0.662343, -0.6161693, 1.761338, 0.5372549, 0, 1, 1,
0.6760905, 1.917928, -0.1707569, 0.5411765, 0, 1, 1,
0.6804339, -1.309081, 2.535671, 0.5490196, 0, 1, 1,
0.6805934, 0.3968828, 0.5371829, 0.5529412, 0, 1, 1,
0.6810701, 0.9268011, 2.197257, 0.5607843, 0, 1, 1,
0.6843843, 0.3266985, 1.346056, 0.5647059, 0, 1, 1,
0.6914667, -0.1630722, 2.104511, 0.572549, 0, 1, 1,
0.6982706, -0.9159113, 4.468075, 0.5764706, 0, 1, 1,
0.7041804, -0.414053, 1.183672, 0.5843138, 0, 1, 1,
0.7054828, -0.4446558, 1.688721, 0.5882353, 0, 1, 1,
0.7066968, 0.4480964, 1.712385, 0.5960785, 0, 1, 1,
0.7071684, -1.251133, 1.945925, 0.6039216, 0, 1, 1,
0.7115524, -0.1039621, 2.147174, 0.6078432, 0, 1, 1,
0.7135649, -1.072395, 2.262638, 0.6156863, 0, 1, 1,
0.7136576, 1.264193, -0.9910028, 0.6196079, 0, 1, 1,
0.7136842, 0.05358521, 1.123026, 0.627451, 0, 1, 1,
0.7143711, -1.485228, 2.300272, 0.6313726, 0, 1, 1,
0.7176223, -0.5028039, 3.268164, 0.6392157, 0, 1, 1,
0.7202288, -1.394357, 1.233474, 0.6431373, 0, 1, 1,
0.7286779, -0.7234276, 1.246635, 0.6509804, 0, 1, 1,
0.7344984, 1.639853, 1.038786, 0.654902, 0, 1, 1,
0.7410386, -0.8260766, 2.437531, 0.6627451, 0, 1, 1,
0.7463858, -0.09304981, 0.3820778, 0.6666667, 0, 1, 1,
0.7496019, 0.3177228, 1.537202, 0.6745098, 0, 1, 1,
0.7514894, 0.5852708, 0.1972218, 0.6784314, 0, 1, 1,
0.7539899, -2.133323, 1.871585, 0.6862745, 0, 1, 1,
0.754309, 0.3778959, 0.602803, 0.6901961, 0, 1, 1,
0.7545696, 1.79203, 0.790903, 0.6980392, 0, 1, 1,
0.7549557, 0.1571705, 0.2529625, 0.7058824, 0, 1, 1,
0.7558334, -1.743607, 2.608034, 0.7098039, 0, 1, 1,
0.7566754, -0.9370414, 3.921715, 0.7176471, 0, 1, 1,
0.7633681, 0.1146501, 0.6373488, 0.7215686, 0, 1, 1,
0.7633834, 1.996809, -0.1147522, 0.7294118, 0, 1, 1,
0.7636219, 0.4660535, 0.5366862, 0.7333333, 0, 1, 1,
0.7647954, -0.7890165, 2.622613, 0.7411765, 0, 1, 1,
0.7651803, 0.2400844, 1.327045, 0.7450981, 0, 1, 1,
0.766919, -0.8873802, 1.400266, 0.7529412, 0, 1, 1,
0.7700663, -0.1377554, 2.08245, 0.7568628, 0, 1, 1,
0.7714068, 1.560577, 1.629429, 0.7647059, 0, 1, 1,
0.7727321, 0.8592876, -0.5080462, 0.7686275, 0, 1, 1,
0.7742513, -1.348268, 1.688432, 0.7764706, 0, 1, 1,
0.7761354, 1.626106, 0.9787131, 0.7803922, 0, 1, 1,
0.7855145, 2.083494, 1.279384, 0.7882353, 0, 1, 1,
0.7896581, -0.009199673, 3.168814, 0.7921569, 0, 1, 1,
0.7964639, -1.44777, 2.772779, 0.8, 0, 1, 1,
0.7970545, 1.487418, -0.1281046, 0.8078431, 0, 1, 1,
0.7977595, 1.561884, 0.9893315, 0.8117647, 0, 1, 1,
0.7978748, -1.391937, 3.382044, 0.8196079, 0, 1, 1,
0.7981014, 1.603307, 0.7408231, 0.8235294, 0, 1, 1,
0.8155842, -1.851172, 3.403337, 0.8313726, 0, 1, 1,
0.8164864, 1.03897, -0.307095, 0.8352941, 0, 1, 1,
0.8180565, -1.173564, 2.592246, 0.8431373, 0, 1, 1,
0.8220722, 0.1500138, 1.53017, 0.8470588, 0, 1, 1,
0.8232374, 0.1512297, 2.042507, 0.854902, 0, 1, 1,
0.8247901, 1.146074, -0.1016801, 0.8588235, 0, 1, 1,
0.8304439, 1.247838, -0.5046932, 0.8666667, 0, 1, 1,
0.847793, -0.4993607, 1.803384, 0.8705882, 0, 1, 1,
0.8501042, -0.419858, 3.576737, 0.8784314, 0, 1, 1,
0.8549802, -2.281689, 1.345884, 0.8823529, 0, 1, 1,
0.8566036, -0.9747931, 2.371196, 0.8901961, 0, 1, 1,
0.8595576, -1.471712, 2.479173, 0.8941177, 0, 1, 1,
0.8612292, -0.4469689, 3.525369, 0.9019608, 0, 1, 1,
0.8612559, -0.9384531, 1.798522, 0.9098039, 0, 1, 1,
0.8629786, 1.322421, 0.9698942, 0.9137255, 0, 1, 1,
0.8638557, 1.054182, 1.32245, 0.9215686, 0, 1, 1,
0.8643675, -1.078667, 2.90749, 0.9254902, 0, 1, 1,
0.8660331, 0.5359816, -0.01593152, 0.9333333, 0, 1, 1,
0.875654, 1.242785, -0.1331082, 0.9372549, 0, 1, 1,
0.8791777, -0.1012863, 2.918882, 0.945098, 0, 1, 1,
0.8813658, 0.1914865, 1.389889, 0.9490196, 0, 1, 1,
0.8908852, 1.113745, -0.272587, 0.9568627, 0, 1, 1,
0.8931035, 1.383156, -0.932864, 0.9607843, 0, 1, 1,
0.8992252, -0.2326987, 2.233746, 0.9686275, 0, 1, 1,
0.8992931, -1.805115, 2.216638, 0.972549, 0, 1, 1,
0.8999077, 1.090125, 1.197337, 0.9803922, 0, 1, 1,
0.9034945, 0.05028131, 3.147538, 0.9843137, 0, 1, 1,
0.9071793, -0.4963611, 1.985971, 0.9921569, 0, 1, 1,
0.9116192, -0.6294285, 1.188481, 0.9960784, 0, 1, 1,
0.9121267, 0.2500563, 1.617395, 1, 0, 0.9960784, 1,
0.9123382, 1.140137, 0.06931069, 1, 0, 0.9882353, 1,
0.920272, 0.2656067, 0.9538106, 1, 0, 0.9843137, 1,
0.9344406, 0.3336264, 1.565472, 1, 0, 0.9764706, 1,
0.9377113, 0.7985153, 0.3627567, 1, 0, 0.972549, 1,
0.9424469, -0.08763637, 0.7690251, 1, 0, 0.9647059, 1,
0.9470823, 0.4913915, 0.8295907, 1, 0, 0.9607843, 1,
0.9490659, -0.6282401, 0.8226238, 1, 0, 0.9529412, 1,
0.9493158, -0.8773777, 1.935017, 1, 0, 0.9490196, 1,
0.9524825, 0.5896425, 0.5699643, 1, 0, 0.9411765, 1,
0.957495, 0.6777962, 2.43025, 1, 0, 0.9372549, 1,
0.961331, 0.9457147, 0.414113, 1, 0, 0.9294118, 1,
0.9668173, -0.6341684, 2.252881, 1, 0, 0.9254902, 1,
0.9711667, -0.3845399, 2.883665, 1, 0, 0.9176471, 1,
0.9773415, -0.3353898, 1.62833, 1, 0, 0.9137255, 1,
0.9786925, -0.4367031, 1.504516, 1, 0, 0.9058824, 1,
0.9972117, -0.4919008, 2.537988, 1, 0, 0.9019608, 1,
1.001093, -0.7635626, 1.286486, 1, 0, 0.8941177, 1,
1.008842, -0.4957855, 1.135964, 1, 0, 0.8862745, 1,
1.01227, 0.7350413, 2.449435, 1, 0, 0.8823529, 1,
1.014533, 1.161442, 0.3233026, 1, 0, 0.8745098, 1,
1.029409, 0.2772269, 2.616464, 1, 0, 0.8705882, 1,
1.061244, 1.12227, 0.7713794, 1, 0, 0.8627451, 1,
1.065504, -0.5150583, 1.582006, 1, 0, 0.8588235, 1,
1.076728, 0.3687637, 1.464826, 1, 0, 0.8509804, 1,
1.079285, 0.07698476, 2.078966, 1, 0, 0.8470588, 1,
1.087475, -1.252749, 4.145927, 1, 0, 0.8392157, 1,
1.089489, 1.504993, 1.084689, 1, 0, 0.8352941, 1,
1.098184, 0.9295073, 0.6696455, 1, 0, 0.827451, 1,
1.100182, 0.4655317, 1.387041, 1, 0, 0.8235294, 1,
1.11063, -0.005440744, 1.046292, 1, 0, 0.8156863, 1,
1.118702, 0.5776018, 0.7814123, 1, 0, 0.8117647, 1,
1.128963, 0.3391581, 2.675296, 1, 0, 0.8039216, 1,
1.129782, 0.9103205, 0.2559556, 1, 0, 0.7960784, 1,
1.135336, 0.4807915, 1.556611, 1, 0, 0.7921569, 1,
1.139338, 0.8747877, 0.1190549, 1, 0, 0.7843137, 1,
1.14051, -0.4971589, 0.4050049, 1, 0, 0.7803922, 1,
1.142768, 1.787707, 1.028985, 1, 0, 0.772549, 1,
1.148108, -0.5891674, 1.536693, 1, 0, 0.7686275, 1,
1.148905, 0.05960669, -0.04895725, 1, 0, 0.7607843, 1,
1.152674, 0.5438186, 1.410779, 1, 0, 0.7568628, 1,
1.15272, 0.2876639, 0.9970973, 1, 0, 0.7490196, 1,
1.164127, 1.128932, 0.2816567, 1, 0, 0.7450981, 1,
1.178331, -1.240036, 2.212239, 1, 0, 0.7372549, 1,
1.182573, 1.653306, -0.7496945, 1, 0, 0.7333333, 1,
1.182655, 1.371989, 0.3912279, 1, 0, 0.7254902, 1,
1.194933, -2.593413, 2.867722, 1, 0, 0.7215686, 1,
1.197114, -0.9466997, 1.018315, 1, 0, 0.7137255, 1,
1.203936, -0.3601727, 2.210627, 1, 0, 0.7098039, 1,
1.209343, 0.8853467, -0.2217183, 1, 0, 0.7019608, 1,
1.209368, -1.282145, 1.596118, 1, 0, 0.6941177, 1,
1.213086, -0.4810573, 0.9392739, 1, 0, 0.6901961, 1,
1.220087, 0.9502886, 0.4104777, 1, 0, 0.682353, 1,
1.225077, -0.2604532, 1.201008, 1, 0, 0.6784314, 1,
1.227898, -1.030818, 3.20435, 1, 0, 0.6705883, 1,
1.229937, 0.9469661, 1.898645, 1, 0, 0.6666667, 1,
1.237338, -0.2149992, 1.85564, 1, 0, 0.6588235, 1,
1.243532, -0.9406537, 3.322957, 1, 0, 0.654902, 1,
1.247757, -1.090778, 2.581554, 1, 0, 0.6470588, 1,
1.248291, 0.5056975, -0.1043652, 1, 0, 0.6431373, 1,
1.249104, 0.5520182, 0.5540686, 1, 0, 0.6352941, 1,
1.249394, 0.6688589, 1.550938, 1, 0, 0.6313726, 1,
1.25139, -0.2921186, 2.392959, 1, 0, 0.6235294, 1,
1.25779, -1.42656, 2.459244, 1, 0, 0.6196079, 1,
1.273283, 0.1951582, 0.886855, 1, 0, 0.6117647, 1,
1.274128, 1.07902, 0.005686716, 1, 0, 0.6078432, 1,
1.291072, -0.5082313, 3.271778, 1, 0, 0.6, 1,
1.301117, -2.158887, 3.86044, 1, 0, 0.5921569, 1,
1.306415, -0.2817562, 1.176315, 1, 0, 0.5882353, 1,
1.313578, 0.6789538, -0.09694403, 1, 0, 0.5803922, 1,
1.319202, 0.2831342, 2.144829, 1, 0, 0.5764706, 1,
1.324772, -1.061536, 0.8071342, 1, 0, 0.5686275, 1,
1.326725, 0.9527262, 1.637075, 1, 0, 0.5647059, 1,
1.332123, 0.8798867, 1.621068, 1, 0, 0.5568628, 1,
1.337397, -0.3771715, 2.033265, 1, 0, 0.5529412, 1,
1.349441, 0.8563888, 2.767782, 1, 0, 0.5450981, 1,
1.354399, -2.515216, 2.468407, 1, 0, 0.5411765, 1,
1.357018, 0.6223585, 1.493594, 1, 0, 0.5333334, 1,
1.371109, -0.04632149, 0.9456042, 1, 0, 0.5294118, 1,
1.372353, -0.2096687, 1.382188, 1, 0, 0.5215687, 1,
1.381821, -0.6203987, 2.16554, 1, 0, 0.5176471, 1,
1.384152, 1.028441, 0.7721902, 1, 0, 0.509804, 1,
1.386002, 1.130579, 0.7598342, 1, 0, 0.5058824, 1,
1.401854, 0.4675474, -1.029674, 1, 0, 0.4980392, 1,
1.411143, 0.9605388, -0.7020002, 1, 0, 0.4901961, 1,
1.416488, -0.89529, 2.578642, 1, 0, 0.4862745, 1,
1.440123, 0.5727466, 0.4086203, 1, 0, 0.4784314, 1,
1.445876, 0.4736487, 1.628391, 1, 0, 0.4745098, 1,
1.448571, 1.456798, -1.351937, 1, 0, 0.4666667, 1,
1.450973, 0.3186345, 2.38352, 1, 0, 0.4627451, 1,
1.45214, 1.747851, -0.08393648, 1, 0, 0.454902, 1,
1.464926, 1.308237, 0.3193113, 1, 0, 0.4509804, 1,
1.476614, 0.910253, -0.461633, 1, 0, 0.4431373, 1,
1.478441, -0.4785446, 0.5802923, 1, 0, 0.4392157, 1,
1.482044, 1.298564, -0.06942974, 1, 0, 0.4313726, 1,
1.488454, -2.374802, 3.448302, 1, 0, 0.427451, 1,
1.493509, -1.013652, 2.760069, 1, 0, 0.4196078, 1,
1.500254, 1.366295, -0.8414673, 1, 0, 0.4156863, 1,
1.521588, -1.363053, 2.156785, 1, 0, 0.4078431, 1,
1.524778, 1.295828, 1.60029, 1, 0, 0.4039216, 1,
1.525403, -1.151134, 0.9843088, 1, 0, 0.3960784, 1,
1.531346, 0.7650819, 2.506914, 1, 0, 0.3882353, 1,
1.534581, 2.013008, 1.131202, 1, 0, 0.3843137, 1,
1.549981, 1.085957, 0.9166527, 1, 0, 0.3764706, 1,
1.595497, -1.328827, 1.213766, 1, 0, 0.372549, 1,
1.596124, -0.2893626, 4.156908, 1, 0, 0.3647059, 1,
1.599319, 0.2093906, 0.857125, 1, 0, 0.3607843, 1,
1.620204, -1.108942, 2.632896, 1, 0, 0.3529412, 1,
1.629304, 0.5601465, 2.125705, 1, 0, 0.3490196, 1,
1.630571, -0.6571134, 1.970051, 1, 0, 0.3411765, 1,
1.632904, 0.01064275, 2.210565, 1, 0, 0.3372549, 1,
1.636831, 0.0189715, 1.38351, 1, 0, 0.3294118, 1,
1.649122, -0.6163952, 2.066427, 1, 0, 0.3254902, 1,
1.652749, -1.166886, 1.68206, 1, 0, 0.3176471, 1,
1.653155, 0.6029818, 0.4862109, 1, 0, 0.3137255, 1,
1.681031, 1.394295, 2.520174, 1, 0, 0.3058824, 1,
1.683551, -0.7715719, 2.469949, 1, 0, 0.2980392, 1,
1.686103, -0.1170332, 1.983836, 1, 0, 0.2941177, 1,
1.687584, -0.3435026, 2.39099, 1, 0, 0.2862745, 1,
1.688588, 1.648413, 1.911095, 1, 0, 0.282353, 1,
1.695169, 1.181687, 0.4746543, 1, 0, 0.2745098, 1,
1.70011, -1.775225, 2.068331, 1, 0, 0.2705882, 1,
1.715238, -1.563438, 3.481564, 1, 0, 0.2627451, 1,
1.721581, -0.3217286, 2.532941, 1, 0, 0.2588235, 1,
1.734915, -0.4057649, 2.277483, 1, 0, 0.2509804, 1,
1.737965, -0.4313128, 1.284714, 1, 0, 0.2470588, 1,
1.772258, -0.4057557, 2.28596, 1, 0, 0.2392157, 1,
1.788941, 2.535701, 1.690139, 1, 0, 0.2352941, 1,
1.803155, -1.306071, 1.586142, 1, 0, 0.227451, 1,
1.815272, -1.643526, 2.810168, 1, 0, 0.2235294, 1,
1.816308, -0.6876735, 2.171209, 1, 0, 0.2156863, 1,
1.828795, -1.92462, 2.058595, 1, 0, 0.2117647, 1,
1.829174, -1.129759, 1.367213, 1, 0, 0.2039216, 1,
1.841139, 1.160207, -0.1343949, 1, 0, 0.1960784, 1,
1.844372, -0.1630639, 1.029003, 1, 0, 0.1921569, 1,
1.84595, 0.8398428, -0.1527752, 1, 0, 0.1843137, 1,
1.855873, -1.238824, 1.987899, 1, 0, 0.1803922, 1,
1.877294, -0.285266, 1.734707, 1, 0, 0.172549, 1,
1.888376, -1.083272, 1.253269, 1, 0, 0.1686275, 1,
1.903657, 2.188027, 1.341146, 1, 0, 0.1607843, 1,
1.949383, 0.6291743, -1.02165, 1, 0, 0.1568628, 1,
1.953416, 0.3693986, 0.1538192, 1, 0, 0.1490196, 1,
1.995136, 0.09521946, 2.816458, 1, 0, 0.145098, 1,
2.001285, -0.03399343, 0.4739946, 1, 0, 0.1372549, 1,
2.017263, -1.527966, 0.6683184, 1, 0, 0.1333333, 1,
2.024302, -1.905716, 2.602316, 1, 0, 0.1254902, 1,
2.028227, 0.9181588, 2.357913, 1, 0, 0.1215686, 1,
2.042873, 0.09863617, 0.78137, 1, 0, 0.1137255, 1,
2.091243, -0.1779959, 3.719059, 1, 0, 0.1098039, 1,
2.092034, 0.7307002, 3.302342, 1, 0, 0.1019608, 1,
2.09411, 0.4458775, 0.7390713, 1, 0, 0.09411765, 1,
2.114649, 1.279312, 0.4548749, 1, 0, 0.09019608, 1,
2.120475, 0.6875287, 1.169603, 1, 0, 0.08235294, 1,
2.122521, 0.108076, 1.569768, 1, 0, 0.07843138, 1,
2.143076, 2.483713, 0.5726732, 1, 0, 0.07058824, 1,
2.166935, -0.9035183, 2.988666, 1, 0, 0.06666667, 1,
2.194836, -0.826964, 2.579376, 1, 0, 0.05882353, 1,
2.2052, 0.5732064, 0.2206316, 1, 0, 0.05490196, 1,
2.271365, 0.4195507, 3.079574, 1, 0, 0.04705882, 1,
2.294615, 0.4722463, 1.381947, 1, 0, 0.04313726, 1,
2.326146, 1.154571, 1.948596, 1, 0, 0.03529412, 1,
2.407788, -0.5761147, 1.921026, 1, 0, 0.03137255, 1,
2.608576, 0.4883961, 1.379754, 1, 0, 0.02352941, 1,
2.821344, 1.989235, 1.198752, 1, 0, 0.01960784, 1,
2.947964, -1.445418, 1.527594, 1, 0, 0.01176471, 1,
3.008728, 0.2741735, 0.008594862, 1, 0, 0.007843138, 1
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
-0.2665715, -4.331491, -7.484522, 0, -0.5, 0.5, 0.5,
-0.2665715, -4.331491, -7.484522, 1, -0.5, 0.5, 0.5,
-0.2665715, -4.331491, -7.484522, 1, 1.5, 0.5, 0.5,
-0.2665715, -4.331491, -7.484522, 0, 1.5, 0.5, 0.5
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
-4.652198, 0.2539812, -7.484522, 0, -0.5, 0.5, 0.5,
-4.652198, 0.2539812, -7.484522, 1, -0.5, 0.5, 0.5,
-4.652198, 0.2539812, -7.484522, 1, 1.5, 0.5, 0.5,
-4.652198, 0.2539812, -7.484522, 0, 1.5, 0.5, 0.5
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
-4.652198, -4.331491, 0.1280322, 0, -0.5, 0.5, 0.5,
-4.652198, -4.331491, 0.1280322, 1, -0.5, 0.5, 0.5,
-4.652198, -4.331491, 0.1280322, 1, 1.5, 0.5, 0.5,
-4.652198, -4.331491, 0.1280322, 0, 1.5, 0.5, 0.5
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
-3, -3.273305, -5.727779,
3, -3.273305, -5.727779,
-3, -3.273305, -5.727779,
-3, -3.44967, -6.02057,
-2, -3.273305, -5.727779,
-2, -3.44967, -6.02057,
-1, -3.273305, -5.727779,
-1, -3.44967, -6.02057,
0, -3.273305, -5.727779,
0, -3.44967, -6.02057,
1, -3.273305, -5.727779,
1, -3.44967, -6.02057,
2, -3.273305, -5.727779,
2, -3.44967, -6.02057,
3, -3.273305, -5.727779,
3, -3.44967, -6.02057
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
-3, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
-3, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
-3, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
-3, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
-2, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
-2, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
-2, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
-2, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
-1, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
-1, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
-1, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
-1, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
0, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
0, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
0, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
0, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
1, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
1, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
1, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
1, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
2, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
2, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
2, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
2, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5,
3, -3.802398, -6.606151, 0, -0.5, 0.5, 0.5,
3, -3.802398, -6.606151, 1, -0.5, 0.5, 0.5,
3, -3.802398, -6.606151, 1, 1.5, 0.5, 0.5,
3, -3.802398, -6.606151, 0, 1.5, 0.5, 0.5
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
-3.64013, -3, -5.727779,
-3.64013, 3, -5.727779,
-3.64013, -3, -5.727779,
-3.808808, -3, -6.02057,
-3.64013, -2, -5.727779,
-3.808808, -2, -6.02057,
-3.64013, -1, -5.727779,
-3.808808, -1, -6.02057,
-3.64013, 0, -5.727779,
-3.808808, 0, -6.02057,
-3.64013, 1, -5.727779,
-3.808808, 1, -6.02057,
-3.64013, 2, -5.727779,
-3.808808, 2, -6.02057,
-3.64013, 3, -5.727779,
-3.808808, 3, -6.02057
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
-4.146164, -3, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, -3, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, -3, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, -3, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, -2, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, -2, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, -2, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, -2, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, -1, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, -1, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, -1, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, -1, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, 0, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, 0, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, 0, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, 0, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, 1, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, 1, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, 1, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, 1, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, 2, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, 2, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, 2, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, 2, -6.606151, 0, 1.5, 0.5, 0.5,
-4.146164, 3, -6.606151, 0, -0.5, 0.5, 0.5,
-4.146164, 3, -6.606151, 1, -0.5, 0.5, 0.5,
-4.146164, 3, -6.606151, 1, 1.5, 0.5, 0.5,
-4.146164, 3, -6.606151, 0, 1.5, 0.5, 0.5
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
-3.64013, -3.273305, -4,
-3.64013, -3.273305, 4,
-3.64013, -3.273305, -4,
-3.808808, -3.44967, -4,
-3.64013, -3.273305, -2,
-3.808808, -3.44967, -2,
-3.64013, -3.273305, 0,
-3.808808, -3.44967, 0,
-3.64013, -3.273305, 2,
-3.808808, -3.44967, 2,
-3.64013, -3.273305, 4,
-3.808808, -3.44967, 4
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
-4.146164, -3.802398, -4, 0, -0.5, 0.5, 0.5,
-4.146164, -3.802398, -4, 1, -0.5, 0.5, 0.5,
-4.146164, -3.802398, -4, 1, 1.5, 0.5, 0.5,
-4.146164, -3.802398, -4, 0, 1.5, 0.5, 0.5,
-4.146164, -3.802398, -2, 0, -0.5, 0.5, 0.5,
-4.146164, -3.802398, -2, 1, -0.5, 0.5, 0.5,
-4.146164, -3.802398, -2, 1, 1.5, 0.5, 0.5,
-4.146164, -3.802398, -2, 0, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 0, 0, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 0, 1, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 0, 1, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 0, 0, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 2, 0, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 2, 1, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 2, 1, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 2, 0, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 4, 0, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 4, 1, -0.5, 0.5, 0.5,
-4.146164, -3.802398, 4, 1, 1.5, 0.5, 0.5,
-4.146164, -3.802398, 4, 0, 1.5, 0.5, 0.5
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
-3.64013, -3.273305, -5.727779,
-3.64013, 3.781268, -5.727779,
-3.64013, -3.273305, 5.983843,
-3.64013, 3.781268, 5.983843,
-3.64013, -3.273305, -5.727779,
-3.64013, -3.273305, 5.983843,
-3.64013, 3.781268, -5.727779,
-3.64013, 3.781268, 5.983843,
-3.64013, -3.273305, -5.727779,
3.106987, -3.273305, -5.727779,
-3.64013, -3.273305, 5.983843,
3.106987, -3.273305, 5.983843,
-3.64013, 3.781268, -5.727779,
3.106987, 3.781268, -5.727779,
-3.64013, 3.781268, 5.983843,
3.106987, 3.781268, 5.983843,
3.106987, -3.273305, -5.727779,
3.106987, 3.781268, -5.727779,
3.106987, -3.273305, 5.983843,
3.106987, 3.781268, 5.983843,
3.106987, -3.273305, -5.727779,
3.106987, -3.273305, 5.983843,
3.106987, 3.781268, -5.727779,
3.106987, 3.781268, 5.983843
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
var radius = 8.141281;
var distance = 36.22148;
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
mvMatrix.translate( 0.2665715, -0.2539812, -0.1280322 );
mvMatrix.scale( 1.304633, 1.247774, 0.7516049 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.22148);
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
BMC<-read.table("BMC.xyz")
```

```
## Error in read.table("BMC.xyz"): no lines available in input
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
-3.541871, -0.6402986, -1.087436, 0, 0, 1, 1, 1,
-2.879966, 0.122491, -1.692237, 1, 0, 0, 1, 1,
-2.782713, -0.2717843, 0.6056924, 1, 0, 0, 1, 1,
-2.610165, -0.6542801, -3.189686, 1, 0, 0, 1, 1,
-2.585701, -0.5785293, -1.900286, 1, 0, 0, 1, 1,
-2.490893, -0.09882688, -2.275674, 1, 0, 0, 1, 1,
-2.467971, -1.295299, -1.738595, 0, 0, 0, 1, 1,
-2.346488, -0.2727316, -1.3255, 0, 0, 0, 1, 1,
-2.328405, 1.113467, -1.09201, 0, 0, 0, 1, 1,
-2.326125, -1.484958, -2.763267, 0, 0, 0, 1, 1,
-2.288539, -0.4265916, -2.94219, 0, 0, 0, 1, 1,
-2.278518, -0.6103671, -2.998051, 0, 0, 0, 1, 1,
-2.26954, 3.506554, 1.255358, 0, 0, 0, 1, 1,
-2.251834, -1.120946, -2.090395, 1, 1, 1, 1, 1,
-2.155096, -0.01942779, -1.134162, 1, 1, 1, 1, 1,
-2.146713, -0.3351844, -1.412216, 1, 1, 1, 1, 1,
-2.133029, 0.8698854, -1.750681, 1, 1, 1, 1, 1,
-2.122172, -0.06266116, -1.592906, 1, 1, 1, 1, 1,
-2.11643, 0.03703183, -2.596592, 1, 1, 1, 1, 1,
-2.083364, 0.3624316, -0.8512573, 1, 1, 1, 1, 1,
-2.007231, -1.318273, -1.087728, 1, 1, 1, 1, 1,
-1.994503, -0.7091125, -1.96728, 1, 1, 1, 1, 1,
-1.983986, -0.8775553, -2.106721, 1, 1, 1, 1, 1,
-1.978257, -0.7214397, -2.482099, 1, 1, 1, 1, 1,
-1.96886, 0.02118849, -0.7715459, 1, 1, 1, 1, 1,
-1.968282, -0.3650833, -2.879084, 1, 1, 1, 1, 1,
-1.963983, -0.2491317, -1.449905, 1, 1, 1, 1, 1,
-1.961552, 0.08103826, -2.852754, 1, 1, 1, 1, 1,
-1.958681, 1.719433, 0.51912, 0, 0, 1, 1, 1,
-1.945408, 1.865275, -1.658034, 1, 0, 0, 1, 1,
-1.93147, -0.7745461, -1.196547, 1, 0, 0, 1, 1,
-1.929891, -1.107891, -2.74962, 1, 0, 0, 1, 1,
-1.896156, -1.455252, -2.937652, 1, 0, 0, 1, 1,
-1.881038, 0.3753468, 1.425455, 1, 0, 0, 1, 1,
-1.87441, -1.539931, -1.415104, 0, 0, 0, 1, 1,
-1.867477, 0.8583886, -0.2601956, 0, 0, 0, 1, 1,
-1.867146, -1.274073, -3.001838, 0, 0, 0, 1, 1,
-1.847867, -1.237295, -1.169023, 0, 0, 0, 1, 1,
-1.834672, -0.550256, -1.384012, 0, 0, 0, 1, 1,
-1.829307, 2.367012, 0.1379998, 0, 0, 0, 1, 1,
-1.808555, 0.3623563, 0.03244124, 0, 0, 0, 1, 1,
-1.785184, 0.5354275, -2.55519, 1, 1, 1, 1, 1,
-1.775067, -1.089141, -1.097652, 1, 1, 1, 1, 1,
-1.773423, -0.5403267, -1.575366, 1, 1, 1, 1, 1,
-1.745659, 1.301447, -1.139135, 1, 1, 1, 1, 1,
-1.743283, -0.9719024, -0.9671301, 1, 1, 1, 1, 1,
-1.736046, -1.594866, -2.867347, 1, 1, 1, 1, 1,
-1.722079, 0.334589, -1.272811, 1, 1, 1, 1, 1,
-1.720783, 2.271998, -2.425919, 1, 1, 1, 1, 1,
-1.702234, 0.9149716, -2.092639, 1, 1, 1, 1, 1,
-1.676355, 0.9310222, -0.2406691, 1, 1, 1, 1, 1,
-1.674637, 0.0450627, -1.611013, 1, 1, 1, 1, 1,
-1.672972, 0.6538787, -1.39903, 1, 1, 1, 1, 1,
-1.666864, 1.479922, -2.881249, 1, 1, 1, 1, 1,
-1.649677, 0.04421398, -0.8918276, 1, 1, 1, 1, 1,
-1.640633, -0.5170422, -1.464786, 1, 1, 1, 1, 1,
-1.635665, -1.344876, -0.81057, 0, 0, 1, 1, 1,
-1.63454, -0.3357926, -0.1556802, 1, 0, 0, 1, 1,
-1.633427, -1.431109, -2.332446, 1, 0, 0, 1, 1,
-1.630096, -0.8899834, -1.438555, 1, 0, 0, 1, 1,
-1.624843, -0.2564634, -1.350848, 1, 0, 0, 1, 1,
-1.597395, -1.346105, -3.322947, 1, 0, 0, 1, 1,
-1.595574, -1.3976, -0.7694939, 0, 0, 0, 1, 1,
-1.578339, 0.885492, -1.75156, 0, 0, 0, 1, 1,
-1.576559, -1.128234, -2.319501, 0, 0, 0, 1, 1,
-1.568105, -0.9822015, -1.677661, 0, 0, 0, 1, 1,
-1.567851, 0.9308569, -1.107841, 0, 0, 0, 1, 1,
-1.563259, -0.3030697, -1.713434, 0, 0, 0, 1, 1,
-1.555944, 0.1045053, -0.9592156, 0, 0, 0, 1, 1,
-1.555034, -0.454241, -2.737886, 1, 1, 1, 1, 1,
-1.537643, 1.255805, -1.310576, 1, 1, 1, 1, 1,
-1.532405, -0.2132369, -1.981868, 1, 1, 1, 1, 1,
-1.528953, 1.795916, -0.9268913, 1, 1, 1, 1, 1,
-1.514786, -0.02190562, -1.522132, 1, 1, 1, 1, 1,
-1.508958, -0.6748856, -1.71799, 1, 1, 1, 1, 1,
-1.504393, -0.06288207, -1.181348, 1, 1, 1, 1, 1,
-1.49408, 0.2610864, -2.759681, 1, 1, 1, 1, 1,
-1.491923, 1.946777, -1.023257, 1, 1, 1, 1, 1,
-1.490389, 1.518123, -0.06330018, 1, 1, 1, 1, 1,
-1.489176, 0.1915071, -0.8628155, 1, 1, 1, 1, 1,
-1.474144, -1.362956, -3.097277, 1, 1, 1, 1, 1,
-1.462108, -0.75033, -1.998932, 1, 1, 1, 1, 1,
-1.45984, 0.3553179, 0.8677906, 1, 1, 1, 1, 1,
-1.457282, 1.823192, -0.7859902, 1, 1, 1, 1, 1,
-1.453423, 0.8483961, -1.87235, 0, 0, 1, 1, 1,
-1.441647, 0.314405, -0.4464607, 1, 0, 0, 1, 1,
-1.441123, 1.303467, -1.350354, 1, 0, 0, 1, 1,
-1.432119, 1.216087, -1.487862, 1, 0, 0, 1, 1,
-1.430357, 0.5364849, -0.7948402, 1, 0, 0, 1, 1,
-1.425541, -1.534498, -2.312015, 1, 0, 0, 1, 1,
-1.42449, 0.462663, -1.124004, 0, 0, 0, 1, 1,
-1.415787, -0.2174024, -0.3172159, 0, 0, 0, 1, 1,
-1.411787, -2.026826, -1.714916, 0, 0, 0, 1, 1,
-1.411018, -0.7352052, -1.581105, 0, 0, 0, 1, 1,
-1.393558, 0.932541, -1.764092, 0, 0, 0, 1, 1,
-1.388741, -1.07876, -1.954075, 0, 0, 0, 1, 1,
-1.381165, -1.688484, -3.752039, 0, 0, 0, 1, 1,
-1.376455, 0.1740742, -1.591027, 1, 1, 1, 1, 1,
-1.366394, -0.548235, -2.674997, 1, 1, 1, 1, 1,
-1.365318, 0.3118402, -2.789317, 1, 1, 1, 1, 1,
-1.352121, 0.9852467, -1.668802, 1, 1, 1, 1, 1,
-1.346087, 1.371286, -1.495289, 1, 1, 1, 1, 1,
-1.341818, -1.647115, -4.160575, 1, 1, 1, 1, 1,
-1.339558, -0.2089893, 1.355531, 1, 1, 1, 1, 1,
-1.331061, -0.1854679, -1.002819, 1, 1, 1, 1, 1,
-1.331023, -0.6111183, -2.820515, 1, 1, 1, 1, 1,
-1.327489, 0.5510606, -3.014477, 1, 1, 1, 1, 1,
-1.325305, -1.52175, -2.501254, 1, 1, 1, 1, 1,
-1.322772, -0.9038758, -2.709672, 1, 1, 1, 1, 1,
-1.305263, -0.929397, -5.297393, 1, 1, 1, 1, 1,
-1.301147, -1.83259, -2.427977, 1, 1, 1, 1, 1,
-1.295029, -0.6187103, -2.066042, 1, 1, 1, 1, 1,
-1.281908, -2.428449, -3.573615, 0, 0, 1, 1, 1,
-1.275868, 0.6961709, -0.9860612, 1, 0, 0, 1, 1,
-1.270689, 0.2247441, -1.399375, 1, 0, 0, 1, 1,
-1.266599, 0.3263911, -2.7703, 1, 0, 0, 1, 1,
-1.259281, 0.4763855, -2.21782, 1, 0, 0, 1, 1,
-1.255276, -0.1622971, -1.352947, 1, 0, 0, 1, 1,
-1.254307, -0.6713195, -2.144171, 0, 0, 0, 1, 1,
-1.252671, 1.47111, -1.868154, 0, 0, 0, 1, 1,
-1.245514, 0.1233274, -1.330594, 0, 0, 0, 1, 1,
-1.20764, 2.242691, -1.833873, 0, 0, 0, 1, 1,
-1.196534, -0.861842, -2.449563, 0, 0, 0, 1, 1,
-1.193703, 0.4636943, -1.445962, 0, 0, 0, 1, 1,
-1.180215, -0.3072557, -2.204333, 0, 0, 0, 1, 1,
-1.178403, 1.169561, -0.9634991, 1, 1, 1, 1, 1,
-1.175623, 0.4382837, -0.8190429, 1, 1, 1, 1, 1,
-1.174721, -1.055374, -1.567994, 1, 1, 1, 1, 1,
-1.169587, -0.448366, -2.632514, 1, 1, 1, 1, 1,
-1.169375, 0.48793, -1.721931, 1, 1, 1, 1, 1,
-1.162843, -1.601117, -2.380729, 1, 1, 1, 1, 1,
-1.161772, -0.4597111, -3.139636, 1, 1, 1, 1, 1,
-1.159366, -1.326027, -4.852256, 1, 1, 1, 1, 1,
-1.15663, -1.366131, -2.901739, 1, 1, 1, 1, 1,
-1.149426, 0.1018739, 0.7365364, 1, 1, 1, 1, 1,
-1.14727, -0.4965808, -1.977755, 1, 1, 1, 1, 1,
-1.139365, 1.542405, 0.4773959, 1, 1, 1, 1, 1,
-1.137935, 0.1587706, -2.45421, 1, 1, 1, 1, 1,
-1.137464, 0.06889499, -1.117777, 1, 1, 1, 1, 1,
-1.132672, 1.479802, -0.1344583, 1, 1, 1, 1, 1,
-1.129434, 0.1542472, -1.349435, 0, 0, 1, 1, 1,
-1.124142, 0.4919379, -0.6575155, 1, 0, 0, 1, 1,
-1.120142, -1.700544, -2.5778, 1, 0, 0, 1, 1,
-1.118839, -0.4335384, -1.330774, 1, 0, 0, 1, 1,
-1.114103, 1.103788, 0.5789306, 1, 0, 0, 1, 1,
-1.110511, 0.5757657, -2.357711, 1, 0, 0, 1, 1,
-1.110348, -2.185592, -3.622753, 0, 0, 0, 1, 1,
-1.103611, -0.7281712, -3.138428, 0, 0, 0, 1, 1,
-1.103257, -0.5859126, -2.178678, 0, 0, 0, 1, 1,
-1.101275, 1.138625, -1.06641, 0, 0, 0, 1, 1,
-1.090868, 0.6102732, 0.9484639, 0, 0, 0, 1, 1,
-1.088215, 0.7158332, 0.08239331, 0, 0, 0, 1, 1,
-1.083882, -1.172238, -1.223652, 0, 0, 0, 1, 1,
-1.082541, -2.294774, -5.557221, 1, 1, 1, 1, 1,
-1.074337, -0.0745147, -0.9906062, 1, 1, 1, 1, 1,
-1.074251, 0.538404, -1.980389, 1, 1, 1, 1, 1,
-1.071066, 0.9862689, -2.075998, 1, 1, 1, 1, 1,
-1.065994, -0.1978489, -2.204424, 1, 1, 1, 1, 1,
-1.064996, 0.5862193, -0.5532939, 1, 1, 1, 1, 1,
-1.064851, 0.8814381, -0.2175555, 1, 1, 1, 1, 1,
-1.062128, 1.649016, -1.731375, 1, 1, 1, 1, 1,
-1.059406, 0.05891477, -2.380033, 1, 1, 1, 1, 1,
-1.055942, 0.2893209, -0.9944377, 1, 1, 1, 1, 1,
-1.055474, 0.7059959, -0.9053325, 1, 1, 1, 1, 1,
-1.046689, 0.5513956, -1.047724, 1, 1, 1, 1, 1,
-1.04176, 1.032759, -0.2770474, 1, 1, 1, 1, 1,
-1.039715, 0.4034106, -1.088241, 1, 1, 1, 1, 1,
-1.033714, 0.02610678, -0.4592072, 1, 1, 1, 1, 1,
-1.032043, -0.1312558, -0.9354846, 0, 0, 1, 1, 1,
-1.023384, 0.5695937, -0.1795831, 1, 0, 0, 1, 1,
-1.016107, -1.023868, -2.883519, 1, 0, 0, 1, 1,
-1.01353, 0.7661335, -2.024832, 1, 0, 0, 1, 1,
-1.01127, 0.4359404, -0.8508818, 1, 0, 0, 1, 1,
-1.009538, 0.9620008, 0.3427463, 1, 0, 0, 1, 1,
-1.005085, -0.2182145, -2.015848, 0, 0, 0, 1, 1,
-1.004057, -0.2815782, -1.1932, 0, 0, 0, 1, 1,
-0.9986817, -0.4666278, -0.8542095, 0, 0, 0, 1, 1,
-0.9975352, -0.1029547, -2.416499, 0, 0, 0, 1, 1,
-0.9868654, 1.11293, -0.7766062, 0, 0, 0, 1, 1,
-0.9855115, -1.749958, -1.514436, 0, 0, 0, 1, 1,
-0.9839565, 0.1149181, -0.02587506, 0, 0, 0, 1, 1,
-0.9699836, -1.024692, -1.798746, 1, 1, 1, 1, 1,
-0.965431, 1.404914, -0.9046402, 1, 1, 1, 1, 1,
-0.955694, -0.6885844, -1.019056, 1, 1, 1, 1, 1,
-0.9533857, 0.5790083, -1.438496, 1, 1, 1, 1, 1,
-0.9515994, 0.6364003, -2.135853, 1, 1, 1, 1, 1,
-0.9420449, -0.357678, -0.2412879, 1, 1, 1, 1, 1,
-0.9345273, -1.617367, -3.955957, 1, 1, 1, 1, 1,
-0.9312112, 0.2737451, -0.3569978, 1, 1, 1, 1, 1,
-0.9275876, 2.683532, 0.6090727, 1, 1, 1, 1, 1,
-0.9252692, -0.5198403, -2.349227, 1, 1, 1, 1, 1,
-0.9245809, -1.275212, -1.401069, 1, 1, 1, 1, 1,
-0.9212658, 0.09649789, -1.320639, 1, 1, 1, 1, 1,
-0.9194118, -0.1237577, -2.519069, 1, 1, 1, 1, 1,
-0.9165, -0.2497707, -1.264391, 1, 1, 1, 1, 1,
-0.911359, 1.478565, 0.4158504, 1, 1, 1, 1, 1,
-0.9109961, 0.1780796, -2.037366, 0, 0, 1, 1, 1,
-0.9106697, -1.056442, -3.560013, 1, 0, 0, 1, 1,
-0.9021057, -0.2115603, -0.8917653, 1, 0, 0, 1, 1,
-0.9009019, 0.5289867, -1.220822, 1, 0, 0, 1, 1,
-0.8980125, -1.351112, -2.609533, 1, 0, 0, 1, 1,
-0.8968787, 1.525738, -1.898524, 1, 0, 0, 1, 1,
-0.884841, 1.005632, -0.450616, 0, 0, 0, 1, 1,
-0.8817243, 0.6197693, -0.8859279, 0, 0, 0, 1, 1,
-0.8794327, 0.9269621, -0.6735671, 0, 0, 0, 1, 1,
-0.8784243, 2.524973, -0.9061567, 0, 0, 0, 1, 1,
-0.875912, -2.283977, -2.898597, 0, 0, 0, 1, 1,
-0.871594, 1.102266, -2.175165, 0, 0, 0, 1, 1,
-0.8715786, -0.1905714, -1.674517, 0, 0, 0, 1, 1,
-0.8645807, 0.5866802, -0.137385, 1, 1, 1, 1, 1,
-0.8637677, -0.2183914, -2.038592, 1, 1, 1, 1, 1,
-0.8626996, -1.203975, -5.478027, 1, 1, 1, 1, 1,
-0.8574474, -1.457158, -1.677226, 1, 1, 1, 1, 1,
-0.8536084, -2.544525, -3.024681, 1, 1, 1, 1, 1,
-0.8530775, 0.7233685, -1.605494, 1, 1, 1, 1, 1,
-0.8492467, -1.795325, -2.019053, 1, 1, 1, 1, 1,
-0.8436069, -0.2584848, -1.764582, 1, 1, 1, 1, 1,
-0.8321344, 1.358246, -0.6402634, 1, 1, 1, 1, 1,
-0.8247729, 0.2737893, 0.4156921, 1, 1, 1, 1, 1,
-0.8199688, 0.0799582, -1.859, 1, 1, 1, 1, 1,
-0.8173863, -0.9152671, -1.488216, 1, 1, 1, 1, 1,
-0.8155963, -0.173591, -1.57055, 1, 1, 1, 1, 1,
-0.8130378, 0.05110936, -0.7789201, 1, 1, 1, 1, 1,
-0.8090649, 0.8012572, -0.6061594, 1, 1, 1, 1, 1,
-0.8087537, -0.7273943, -1.465959, 0, 0, 1, 1, 1,
-0.8045669, 1.464254, -0.2323421, 1, 0, 0, 1, 1,
-0.8042217, -2.077582, -3.408567, 1, 0, 0, 1, 1,
-0.8016492, -1.487233, -4.486327, 1, 0, 0, 1, 1,
-0.7962973, -0.6541641, -2.073378, 1, 0, 0, 1, 1,
-0.787315, 0.03336177, -3.096594, 1, 0, 0, 1, 1,
-0.7833837, -1.834371, -2.193895, 0, 0, 0, 1, 1,
-0.7822971, -0.472946, -2.232685, 0, 0, 0, 1, 1,
-0.7752926, 0.5734875, -2.765034, 0, 0, 0, 1, 1,
-0.77305, 1.264101, 0.4060126, 0, 0, 0, 1, 1,
-0.7713691, 1.614939, 0.2347257, 0, 0, 0, 1, 1,
-0.7700865, -0.1741383, -0.8370528, 0, 0, 0, 1, 1,
-0.7657012, -1.133254, -3.39427, 0, 0, 0, 1, 1,
-0.7582512, 0.3496361, -1.54029, 1, 1, 1, 1, 1,
-0.7498572, -0.9274733, -1.27623, 1, 1, 1, 1, 1,
-0.7432879, -0.691663, -3.431179, 1, 1, 1, 1, 1,
-0.7424282, -1.392578, -1.962767, 1, 1, 1, 1, 1,
-0.7423286, -0.138427, -1.534165, 1, 1, 1, 1, 1,
-0.7385079, -0.5709585, -1.557225, 1, 1, 1, 1, 1,
-0.7370582, -0.2771336, -0.006498249, 1, 1, 1, 1, 1,
-0.7321299, -0.3437178, -0.9069581, 1, 1, 1, 1, 1,
-0.7287963, 1.487832, -1.319891, 1, 1, 1, 1, 1,
-0.7151188, 0.311708, -2.057454, 1, 1, 1, 1, 1,
-0.7107161, 0.7843126, -1.724751, 1, 1, 1, 1, 1,
-0.7081068, -1.227157, -2.945136, 1, 1, 1, 1, 1,
-0.7059169, 1.2474, -1.574116, 1, 1, 1, 1, 1,
-0.7018551, -2.485012, -3.438631, 1, 1, 1, 1, 1,
-0.6946005, -1.980359, -4.418917, 1, 1, 1, 1, 1,
-0.6928242, 0.7045488, 0.1663981, 0, 0, 1, 1, 1,
-0.6914449, -1.287204, -1.64598, 1, 0, 0, 1, 1,
-0.6890028, 0.9361064, -2.743488, 1, 0, 0, 1, 1,
-0.6885532, -0.560047, -3.523716, 1, 0, 0, 1, 1,
-0.6881047, -0.6037358, -1.997385, 1, 0, 0, 1, 1,
-0.6813281, 0.05844174, -1.269229, 1, 0, 0, 1, 1,
-0.679123, -0.3015239, -1.423609, 0, 0, 0, 1, 1,
-0.6732974, -0.741231, -1.241524, 0, 0, 0, 1, 1,
-0.6701741, -0.5259909, -0.8924364, 0, 0, 0, 1, 1,
-0.6683002, 0.7059824, -1.797149, 0, 0, 0, 1, 1,
-0.6668614, -0.04535821, -0.03763264, 0, 0, 0, 1, 1,
-0.6639769, -1.114995, -4.37647, 0, 0, 0, 1, 1,
-0.6547046, 0.09771372, -1.835847, 0, 0, 0, 1, 1,
-0.6527118, -1.202859, -2.650455, 1, 1, 1, 1, 1,
-0.6520532, -0.1048779, -0.9847351, 1, 1, 1, 1, 1,
-0.6475565, 1.427502, 0.1440586, 1, 1, 1, 1, 1,
-0.6471231, -1.103775, -2.107382, 1, 1, 1, 1, 1,
-0.6471217, -0.5172591, -1.887208, 1, 1, 1, 1, 1,
-0.6455408, 0.4461059, -0.1942575, 1, 1, 1, 1, 1,
-0.6428284, 0.7458426, -2.279177, 1, 1, 1, 1, 1,
-0.6345619, 1.073847, 0.8569961, 1, 1, 1, 1, 1,
-0.6327497, -0.01292014, -1.331955, 1, 1, 1, 1, 1,
-0.6287053, -0.03167741, -1.303479, 1, 1, 1, 1, 1,
-0.6268857, -0.4519508, -3.826689, 1, 1, 1, 1, 1,
-0.6232905, -0.05023594, -2.027121, 1, 1, 1, 1, 1,
-0.6055992, 1.12849, -0.06816268, 1, 1, 1, 1, 1,
-0.6042539, -1.748483, -3.590872, 1, 1, 1, 1, 1,
-0.5992629, -1.837178, -2.773069, 1, 1, 1, 1, 1,
-0.5973942, 0.8062174, 0.3064516, 0, 0, 1, 1, 1,
-0.596241, -0.4192918, -2.014544, 1, 0, 0, 1, 1,
-0.5910798, -1.602777, -2.203034, 1, 0, 0, 1, 1,
-0.5893549, -0.01407492, -0.8238483, 1, 0, 0, 1, 1,
-0.5833622, 0.413439, -0.6790351, 1, 0, 0, 1, 1,
-0.5831228, -0.02610687, -2.19542, 1, 0, 0, 1, 1,
-0.5821043, -0.3723063, -0.618224, 0, 0, 0, 1, 1,
-0.5781209, -1.699158, -2.016205, 0, 0, 0, 1, 1,
-0.5751929, -0.4973943, -2.120338, 0, 0, 0, 1, 1,
-0.5748291, -0.9493575, -1.570377, 0, 0, 0, 1, 1,
-0.5727127, -1.377846, -3.98316, 0, 0, 0, 1, 1,
-0.5723112, -1.371806, -4.781479, 0, 0, 0, 1, 1,
-0.572139, 0.507031, -1.899034, 0, 0, 0, 1, 1,
-0.5720205, -1.370007, -3.153308, 1, 1, 1, 1, 1,
-0.5687076, 0.5497177, -0.5008779, 1, 1, 1, 1, 1,
-0.5672319, -0.5857432, -1.379836, 1, 1, 1, 1, 1,
-0.5642664, -0.1818346, -1.825253, 1, 1, 1, 1, 1,
-0.5640516, -0.5904354, -0.7064879, 1, 1, 1, 1, 1,
-0.55384, 0.9589543, 0.4739362, 1, 1, 1, 1, 1,
-0.5491982, -0.1287696, -0.8061684, 1, 1, 1, 1, 1,
-0.5461964, -0.7172043, -2.958123, 1, 1, 1, 1, 1,
-0.5440288, -0.2142828, -1.73786, 1, 1, 1, 1, 1,
-0.5433838, 1.542359, 0.4140917, 1, 1, 1, 1, 1,
-0.5402184, -0.1498499, -0.4357945, 1, 1, 1, 1, 1,
-0.5382845, 0.1759783, -0.4409421, 1, 1, 1, 1, 1,
-0.5379977, -1.727323, -2.275707, 1, 1, 1, 1, 1,
-0.5324083, 0.4006236, 0.3552279, 1, 1, 1, 1, 1,
-0.5307057, -0.5310977, -0.3319199, 1, 1, 1, 1, 1,
-0.5254018, 2.078575, -2.142308, 0, 0, 1, 1, 1,
-0.523868, -0.5010251, -2.576729, 1, 0, 0, 1, 1,
-0.5226501, -1.161881, -1.946307, 1, 0, 0, 1, 1,
-0.5191081, 1.290731, -0.4028155, 1, 0, 0, 1, 1,
-0.5189625, -1.670982, -2.882389, 1, 0, 0, 1, 1,
-0.5151063, -0.8100997, -4.147927, 1, 0, 0, 1, 1,
-0.5123324, 1.86533, -1.230415, 0, 0, 0, 1, 1,
-0.5052772, 0.3873934, -2.359758, 0, 0, 0, 1, 1,
-0.5024513, -0.1630351, -3.319617, 0, 0, 0, 1, 1,
-0.5011289, -0.1613129, -2.326582, 0, 0, 0, 1, 1,
-0.5005602, 1.464784, -1.144137, 0, 0, 0, 1, 1,
-0.4990031, 0.5338476, -1.700296, 0, 0, 0, 1, 1,
-0.4971743, 0.6331809, 0.3770583, 0, 0, 0, 1, 1,
-0.4940806, -0.8664701, -2.065142, 1, 1, 1, 1, 1,
-0.4927287, -1.031069, -3.551231, 1, 1, 1, 1, 1,
-0.4911583, 1.275869, -0.09070609, 1, 1, 1, 1, 1,
-0.489954, -0.1229591, -1.093206, 1, 1, 1, 1, 1,
-0.4884847, -0.9620496, -0.9943106, 1, 1, 1, 1, 1,
-0.4868129, -0.3888738, -2.147463, 1, 1, 1, 1, 1,
-0.483907, -0.5964226, -0.9500871, 1, 1, 1, 1, 1,
-0.4832031, 1.974368, 0.5202991, 1, 1, 1, 1, 1,
-0.4812776, -0.2039046, -2.227397, 1, 1, 1, 1, 1,
-0.4802527, -0.8899259, -1.645674, 1, 1, 1, 1, 1,
-0.4792573, 1.117885, 1.61116, 1, 1, 1, 1, 1,
-0.4770915, -1.05792, -2.154019, 1, 1, 1, 1, 1,
-0.4704136, 2.588219, 1.741214, 1, 1, 1, 1, 1,
-0.470367, -0.8585114, -3.718343, 1, 1, 1, 1, 1,
-0.4687658, 1.00957, 0.5915925, 1, 1, 1, 1, 1,
-0.4629361, 0.225519, -2.082568, 0, 0, 1, 1, 1,
-0.4602666, 0.5533745, -1.835185, 1, 0, 0, 1, 1,
-0.4575036, -0.4285823, -0.6367975, 1, 0, 0, 1, 1,
-0.4574859, -1.142542, -3.692858, 1, 0, 0, 1, 1,
-0.449481, 0.6412222, 0.2210744, 1, 0, 0, 1, 1,
-0.4448721, 0.2721615, -1.529175, 1, 0, 0, 1, 1,
-0.4444707, 1.401485, -0.1964604, 0, 0, 0, 1, 1,
-0.4442595, 1.431812, -1.353925, 0, 0, 0, 1, 1,
-0.4424378, -1.715061, -1.810024, 0, 0, 0, 1, 1,
-0.4391261, 0.3951589, -0.7098143, 0, 0, 0, 1, 1,
-0.4362006, 1.007988, 0.2135921, 0, 0, 0, 1, 1,
-0.4290182, -0.3131157, -2.735216, 0, 0, 0, 1, 1,
-0.4275881, 1.92776, 0.8367971, 0, 0, 0, 1, 1,
-0.4267513, -0.9033973, -1.433675, 1, 1, 1, 1, 1,
-0.4262032, 0.7922264, 1.140927, 1, 1, 1, 1, 1,
-0.4259215, -0.7604392, -1.895851, 1, 1, 1, 1, 1,
-0.4214516, -2.416624, -4.023863, 1, 1, 1, 1, 1,
-0.4208311, -1.049521, -3.489269, 1, 1, 1, 1, 1,
-0.4183714, -0.6476837, -2.441795, 1, 1, 1, 1, 1,
-0.4125543, 0.9934809, -0.4034421, 1, 1, 1, 1, 1,
-0.4120364, 1.357903, 0.717846, 1, 1, 1, 1, 1,
-0.4118508, 1.817853, 0.1619097, 1, 1, 1, 1, 1,
-0.4046699, 0.2508442, -0.5278269, 1, 1, 1, 1, 1,
-0.4016823, -0.354723, -2.842726, 1, 1, 1, 1, 1,
-0.3971001, 0.07832774, -1.878407, 1, 1, 1, 1, 1,
-0.3907453, 0.8275412, 1.04168, 1, 1, 1, 1, 1,
-0.3900191, -0.2039429, -3.413189, 1, 1, 1, 1, 1,
-0.3858607, 0.4415912, -0.6614565, 1, 1, 1, 1, 1,
-0.3851317, -0.765353, -1.336077, 0, 0, 1, 1, 1,
-0.3842861, -0.5480734, -2.270369, 1, 0, 0, 1, 1,
-0.371856, -0.572354, -2.427536, 1, 0, 0, 1, 1,
-0.3709973, 1.750296, 0.4703631, 1, 0, 0, 1, 1,
-0.3695014, 1.442884, 1.074826, 1, 0, 0, 1, 1,
-0.3690021, -2.061951, -2.167567, 1, 0, 0, 1, 1,
-0.3659497, -0.8078797, -4.405893, 0, 0, 0, 1, 1,
-0.3637676, 0.4352155, 0.3097717, 0, 0, 0, 1, 1,
-0.3637248, 0.6123909, -0.06013763, 0, 0, 0, 1, 1,
-0.3551654, -1.150456, -4.21236, 0, 0, 0, 1, 1,
-0.3549331, 0.1494634, -0.6951394, 0, 0, 0, 1, 1,
-0.3530352, -1.739598, -3.644416, 0, 0, 0, 1, 1,
-0.3454543, 0.04635219, -2.35476, 0, 0, 0, 1, 1,
-0.3453785, 0.1036725, -1.863292, 1, 1, 1, 1, 1,
-0.3327644, -0.3674073, -4.537978, 1, 1, 1, 1, 1,
-0.3290708, -0.1326873, -3.339196, 1, 1, 1, 1, 1,
-0.3284467, 0.8769044, -0.8927909, 1, 1, 1, 1, 1,
-0.3282294, 0.947648, 0.1047029, 1, 1, 1, 1, 1,
-0.3266895, -0.5721084, -3.2243, 1, 1, 1, 1, 1,
-0.322088, -1.08855, -2.190494, 1, 1, 1, 1, 1,
-0.3140933, -0.5934203, -2.551787, 1, 1, 1, 1, 1,
-0.3124222, 0.955233, -0.4965122, 1, 1, 1, 1, 1,
-0.3109097, 0.4773592, -0.6516511, 1, 1, 1, 1, 1,
-0.3077216, 0.9405904, -2.31484, 1, 1, 1, 1, 1,
-0.3070242, 0.191146, -0.04169653, 1, 1, 1, 1, 1,
-0.3067836, 1.801903, -1.850519, 1, 1, 1, 1, 1,
-0.2999111, 2.142986, -0.2212501, 1, 1, 1, 1, 1,
-0.2973579, 0.1968566, -0.8533283, 1, 1, 1, 1, 1,
-0.29717, -0.6790006, -3.010641, 0, 0, 1, 1, 1,
-0.2959267, 0.1122607, -1.377533, 1, 0, 0, 1, 1,
-0.2941348, -2.523768, -2.372085, 1, 0, 0, 1, 1,
-0.291251, -1.204851, -3.040323, 1, 0, 0, 1, 1,
-0.2901023, -0.9041464, -1.958825, 1, 0, 0, 1, 1,
-0.2892906, 2.439598, -0.4962138, 1, 0, 0, 1, 1,
-0.2857007, -0.5530695, -2.685456, 0, 0, 0, 1, 1,
-0.2854463, 1.120403, -0.1834531, 0, 0, 0, 1, 1,
-0.2840178, 0.08985232, 0.000358664, 0, 0, 0, 1, 1,
-0.2663164, 0.1164014, -1.343033, 0, 0, 0, 1, 1,
-0.2641923, 1.645671, -2.512464, 0, 0, 0, 1, 1,
-0.262051, -0.8138385, -3.543262, 0, 0, 0, 1, 1,
-0.2577386, 0.2362884, 0.01129865, 0, 0, 0, 1, 1,
-0.2530254, -0.6748962, -3.438647, 1, 1, 1, 1, 1,
-0.2466005, -0.5099465, -0.577, 1, 1, 1, 1, 1,
-0.2450206, -1.136095, -2.015266, 1, 1, 1, 1, 1,
-0.2441298, 0.07087127, -1.394425, 1, 1, 1, 1, 1,
-0.2434369, -0.3367433, -1.566833, 1, 1, 1, 1, 1,
-0.2371923, -1.019748, -1.761253, 1, 1, 1, 1, 1,
-0.2331163, 0.195366, 0.03272523, 1, 1, 1, 1, 1,
-0.2273299, -0.0355087, 0.5216878, 1, 1, 1, 1, 1,
-0.2261786, 0.9193035, 0.7357776, 1, 1, 1, 1, 1,
-0.2220758, -0.5183368, -1.50357, 1, 1, 1, 1, 1,
-0.2218889, 0.7297934, 0.005828095, 1, 1, 1, 1, 1,
-0.2200554, -1.051488, -3.475133, 1, 1, 1, 1, 1,
-0.2186126, -0.3902897, -2.0228, 1, 1, 1, 1, 1,
-0.2177086, 0.08405021, 0.1475212, 1, 1, 1, 1, 1,
-0.2172446, 1.094607, -0.6805515, 1, 1, 1, 1, 1,
-0.2164898, -1.729284, -4.183776, 0, 0, 1, 1, 1,
-0.2148272, 1.017956, 0.2350234, 1, 0, 0, 1, 1,
-0.2120769, -0.6959946, -2.42595, 1, 0, 0, 1, 1,
-0.211484, 0.03302374, -1.746902, 1, 0, 0, 1, 1,
-0.2111068, -0.9448652, -3.18409, 1, 0, 0, 1, 1,
-0.2100564, -0.9195122, -2.258828, 1, 0, 0, 1, 1,
-0.2068813, -0.3959667, -3.737462, 0, 0, 0, 1, 1,
-0.2060393, 0.4175296, -1.413123, 0, 0, 0, 1, 1,
-0.2044145, 0.4174119, -0.4624084, 0, 0, 0, 1, 1,
-0.2025369, -1.337563, -2.890812, 0, 0, 0, 1, 1,
-0.2015302, 0.07638884, -2.867834, 0, 0, 0, 1, 1,
-0.2011129, 0.2071766, -1.503181, 0, 0, 0, 1, 1,
-0.1997627, 0.8390765, 0.6488805, 0, 0, 0, 1, 1,
-0.1997395, -1.152703, -2.95909, 1, 1, 1, 1, 1,
-0.1976078, 1.558076, -0.9060374, 1, 1, 1, 1, 1,
-0.1975785, 0.8708909, -0.9833205, 1, 1, 1, 1, 1,
-0.1963404, -0.3435001, -1.927151, 1, 1, 1, 1, 1,
-0.1948382, -0.9404649, -3.733075, 1, 1, 1, 1, 1,
-0.1902265, -0.5878118, -3.350154, 1, 1, 1, 1, 1,
-0.1854918, 0.1452616, 0.4841049, 1, 1, 1, 1, 1,
-0.1851583, -0.8446487, -3.215379, 1, 1, 1, 1, 1,
-0.1849791, 0.6615226, 1.25128, 1, 1, 1, 1, 1,
-0.1772097, -0.1839072, -1.790771, 1, 1, 1, 1, 1,
-0.1721474, 0.1103387, -1.412748, 1, 1, 1, 1, 1,
-0.1719364, 0.9798644, 0.130826, 1, 1, 1, 1, 1,
-0.1585246, 0.2030446, -1.711747, 1, 1, 1, 1, 1,
-0.1580082, -1.167853, -5.153661, 1, 1, 1, 1, 1,
-0.1548118, -1.113289, -1.208907, 1, 1, 1, 1, 1,
-0.1522491, 0.5433685, 0.2843697, 0, 0, 1, 1, 1,
-0.1425269, -0.6782415, -3.056533, 1, 0, 0, 1, 1,
-0.1323563, 0.2537137, -1.04028, 1, 0, 0, 1, 1,
-0.1294504, 0.4693797, 0.0904768, 1, 0, 0, 1, 1,
-0.1259477, 1.755035, 0.9830488, 1, 0, 0, 1, 1,
-0.1251783, 0.04871702, -0.1735984, 1, 0, 0, 1, 1,
-0.1229449, 0.2487671, -0.5356513, 0, 0, 0, 1, 1,
-0.1156715, -0.03012542, -0.4606414, 0, 0, 0, 1, 1,
-0.1109917, -0.3951964, -2.83054, 0, 0, 0, 1, 1,
-0.1091518, 0.3097845, -0.01377447, 0, 0, 0, 1, 1,
-0.1034981, 0.9435928, 0.4880342, 0, 0, 0, 1, 1,
-0.09993907, 0.1097828, -0.8559744, 0, 0, 0, 1, 1,
-0.09472901, 1.707884, 0.5993235, 0, 0, 0, 1, 1,
-0.09421999, -0.7342762, -3.979866, 1, 1, 1, 1, 1,
-0.08965964, 2.275079, -0.4693238, 1, 1, 1, 1, 1,
-0.08934166, 0.1149246, -0.7487462, 1, 1, 1, 1, 1,
-0.08811106, 0.418147, -0.8543881, 1, 1, 1, 1, 1,
-0.08671211, -0.6043836, -2.71886, 1, 1, 1, 1, 1,
-0.08621328, -1.313002, -1.636015, 1, 1, 1, 1, 1,
-0.08357199, -0.5785493, -3.611929, 1, 1, 1, 1, 1,
-0.08108817, 1.422671, 0.2881121, 1, 1, 1, 1, 1,
-0.0770198, -1.045185, -3.62795, 1, 1, 1, 1, 1,
-0.07675072, 0.959627, -1.212443, 1, 1, 1, 1, 1,
-0.07303287, 0.6387806, -0.1639967, 1, 1, 1, 1, 1,
-0.07024783, 0.4705869, -2.360833, 1, 1, 1, 1, 1,
-0.06959435, 0.3477837, 1.556564, 1, 1, 1, 1, 1,
-0.06575193, -0.4588271, -3.891402, 1, 1, 1, 1, 1,
-0.05904736, -0.9805486, -2.681239, 1, 1, 1, 1, 1,
-0.05597127, 1.585222, -0.139443, 0, 0, 1, 1, 1,
-0.05559073, -0.3125317, -3.129976, 1, 0, 0, 1, 1,
-0.05545071, 0.6521031, 0.1260463, 1, 0, 0, 1, 1,
-0.05216282, 0.225776, 0.1866607, 1, 0, 0, 1, 1,
-0.05180264, 0.2202955, 0.1256975, 1, 0, 0, 1, 1,
-0.04896286, -0.4195404, -3.319633, 1, 0, 0, 1, 1,
-0.04571543, -0.1611879, -3.262641, 0, 0, 0, 1, 1,
-0.04335082, 0.2151648, 0.7083035, 0, 0, 0, 1, 1,
-0.04319852, 1.240958, -0.708174, 0, 0, 0, 1, 1,
-0.03926627, 0.5535605, -1.264962, 0, 0, 0, 1, 1,
-0.03869577, 1.931042, 0.03859613, 0, 0, 0, 1, 1,
-0.03627446, 0.08348545, -0.4362831, 0, 0, 0, 1, 1,
-0.0361862, 1.031963, -1.265692, 0, 0, 0, 1, 1,
-0.03321886, -0.3829575, -0.9586294, 1, 1, 1, 1, 1,
-0.02456713, 1.856962, 0.3332297, 1, 1, 1, 1, 1,
-0.02440964, -1.323311, -3.07008, 1, 1, 1, 1, 1,
-0.02144183, -0.7026035, -3.541883, 1, 1, 1, 1, 1,
-0.01948145, 0.2483102, -1.190957, 1, 1, 1, 1, 1,
-0.01922638, -2.481803, -3.161297, 1, 1, 1, 1, 1,
-0.01754551, -0.3116826, -2.104201, 1, 1, 1, 1, 1,
-0.01498508, 1.52924, -2.105137, 1, 1, 1, 1, 1,
-0.01373672, -0.2473594, -3.274017, 1, 1, 1, 1, 1,
-0.009656007, -0.1783471, -2.036465, 1, 1, 1, 1, 1,
-0.00797852, 1.718211, 0.5973029, 1, 1, 1, 1, 1,
-0.007644798, -0.7121694, -2.28384, 1, 1, 1, 1, 1,
-0.007373944, -1.29405, -2.412372, 1, 1, 1, 1, 1,
-0.006878535, -0.1449107, -2.417605, 1, 1, 1, 1, 1,
-0.0007716567, 1.104754, 1.075784, 1, 1, 1, 1, 1,
0.00104881, -0.5159072, 3.100865, 0, 0, 1, 1, 1,
0.003099657, -2.709687, 5.813286, 1, 0, 0, 1, 1,
0.005201821, -0.2946157, 2.576346, 1, 0, 0, 1, 1,
0.006305214, 0.3168542, -1.126494, 1, 0, 0, 1, 1,
0.00662868, -0.8897421, 4.02768, 1, 0, 0, 1, 1,
0.009943071, -0.6549423, 3.822545, 1, 0, 0, 1, 1,
0.01096992, 1.028514, -0.4355189, 0, 0, 0, 1, 1,
0.0114295, -0.5416048, 2.804576, 0, 0, 0, 1, 1,
0.01867314, 0.08122922, -1.994603, 0, 0, 0, 1, 1,
0.02446579, 0.6426603, -0.4059109, 0, 0, 0, 1, 1,
0.02620591, -0.4881745, 1.620142, 0, 0, 0, 1, 1,
0.02801607, -0.4123727, 1.748282, 0, 0, 0, 1, 1,
0.02905646, 0.7369499, -0.6841129, 0, 0, 0, 1, 1,
0.02990413, -0.4893449, 4.599083, 1, 1, 1, 1, 1,
0.03242434, -1.769106, 2.512294, 1, 1, 1, 1, 1,
0.03690879, 0.836305, 0.6002015, 1, 1, 1, 1, 1,
0.03729651, 0.254049, -1.109198, 1, 1, 1, 1, 1,
0.03818114, -0.5687461, 2.47983, 1, 1, 1, 1, 1,
0.04947496, -0.3866735, 3.011392, 1, 1, 1, 1, 1,
0.05111391, 0.735845, 0.6777629, 1, 1, 1, 1, 1,
0.05161861, 0.3699689, -0.0325417, 1, 1, 1, 1, 1,
0.05224422, 0.2226799, 0.3003411, 1, 1, 1, 1, 1,
0.05614887, -0.1521845, 1.487882, 1, 1, 1, 1, 1,
0.05751048, -1.098006, 1.731912, 1, 1, 1, 1, 1,
0.06078358, -1.247496, 1.414688, 1, 1, 1, 1, 1,
0.06190356, -0.6477815, 4.413519, 1, 1, 1, 1, 1,
0.06427926, 0.5858849, -0.4094653, 1, 1, 1, 1, 1,
0.06556097, -0.3284794, 2.77373, 1, 1, 1, 1, 1,
0.06562214, -1.355963, 4.465405, 0, 0, 1, 1, 1,
0.06626611, -1.014012, 2.475329, 1, 0, 0, 1, 1,
0.06719788, 0.2851898, 0.3078119, 1, 0, 0, 1, 1,
0.06885616, 0.4436767, 0.97062, 1, 0, 0, 1, 1,
0.0689343, 1.062703, 0.2411301, 1, 0, 0, 1, 1,
0.07076023, -0.07326088, 2.962059, 1, 0, 0, 1, 1,
0.07154279, 1.085999, -0.6663843, 0, 0, 0, 1, 1,
0.07269522, -0.6976911, 3.22171, 0, 0, 0, 1, 1,
0.07316156, -0.7308989, 2.274013, 0, 0, 0, 1, 1,
0.07685132, -1.748052, 3.671654, 0, 0, 0, 1, 1,
0.07807352, 0.2098312, -0.1212345, 0, 0, 0, 1, 1,
0.08895143, -0.197244, 3.348413, 0, 0, 0, 1, 1,
0.09060713, 0.8606728, -0.1224697, 0, 0, 0, 1, 1,
0.09199025, 1.319411, 1.871258, 1, 1, 1, 1, 1,
0.09241186, 2.494632, -0.1983404, 1, 1, 1, 1, 1,
0.09493319, 0.3619571, 0.7238906, 1, 1, 1, 1, 1,
0.09937186, -0.0248615, 3.680877, 1, 1, 1, 1, 1,
0.1016161, 0.03756784, 1.16041, 1, 1, 1, 1, 1,
0.102494, -0.4418929, 2.453073, 1, 1, 1, 1, 1,
0.1069783, 2.018584, -0.2729633, 1, 1, 1, 1, 1,
0.1130033, -0.8823516, 2.747255, 1, 1, 1, 1, 1,
0.114573, 0.2468348, 0.3279025, 1, 1, 1, 1, 1,
0.1212866, 0.9263071, 1.418612, 1, 1, 1, 1, 1,
0.1232521, -1.649233, 2.657386, 1, 1, 1, 1, 1,
0.1283765, 2.726867, -0.7223332, 1, 1, 1, 1, 1,
0.1346084, -0.2989183, 3.334465, 1, 1, 1, 1, 1,
0.1363811, -0.2615609, 4.437768, 1, 1, 1, 1, 1,
0.1416349, -1.009576, 3.214084, 1, 1, 1, 1, 1,
0.1448946, -0.08203321, 1.972031, 0, 0, 1, 1, 1,
0.1470063, 0.4878879, 1.967505, 1, 0, 0, 1, 1,
0.1473732, 1.562996, -0.1201292, 1, 0, 0, 1, 1,
0.151654, 0.8648711, -0.7605006, 1, 0, 0, 1, 1,
0.1529527, -0.6359437, 4.192324, 1, 0, 0, 1, 1,
0.1530305, -1.418318, 2.852275, 1, 0, 0, 1, 1,
0.1541238, 2.019804, -1.780479, 0, 0, 0, 1, 1,
0.1552982, 0.3482141, 0.3135402, 0, 0, 0, 1, 1,
0.1563735, 0.3386624, 0.5180546, 0, 0, 0, 1, 1,
0.157521, -0.07677573, 1.013938, 0, 0, 0, 1, 1,
0.1583067, -0.8473503, 4.310501, 0, 0, 0, 1, 1,
0.1583633, -0.3495624, 2.394016, 0, 0, 0, 1, 1,
0.1586935, -1.145633, 3.420736, 0, 0, 0, 1, 1,
0.1641816, 0.1091661, 3.277624, 1, 1, 1, 1, 1,
0.1666022, -0.6826218, 2.769523, 1, 1, 1, 1, 1,
0.1667025, 1.024603, -0.27157, 1, 1, 1, 1, 1,
0.167467, -1.360609, -0.5388546, 1, 1, 1, 1, 1,
0.1685385, 3.678531, 1.4157, 1, 1, 1, 1, 1,
0.1687177, -3.170569, 3.600534, 1, 1, 1, 1, 1,
0.1709182, 0.7407292, 2.441827, 1, 1, 1, 1, 1,
0.1709308, 0.6078008, -0.4343495, 1, 1, 1, 1, 1,
0.1737549, -0.7459533, 2.473406, 1, 1, 1, 1, 1,
0.1761182, 1.129688, 0.3847226, 1, 1, 1, 1, 1,
0.1789509, -0.8954854, 1.68064, 1, 1, 1, 1, 1,
0.1791394, -0.9238884, 0.3389857, 1, 1, 1, 1, 1,
0.1798175, 1.624011, -2.114325, 1, 1, 1, 1, 1,
0.1811466, -0.7366213, 3.23271, 1, 1, 1, 1, 1,
0.1841639, 0.3541685, 1.814405, 1, 1, 1, 1, 1,
0.1855537, -2.002063, 1.931657, 0, 0, 1, 1, 1,
0.1860019, 0.3059401, -0.363424, 1, 0, 0, 1, 1,
0.1888986, 0.3672668, 0.8650128, 1, 0, 0, 1, 1,
0.1919019, -0.2623782, 3.035495, 1, 0, 0, 1, 1,
0.1940799, -1.279532, 1.778968, 1, 0, 0, 1, 1,
0.1960886, -0.3814305, 2.41897, 1, 0, 0, 1, 1,
0.1967619, -0.3766441, 1.616455, 0, 0, 0, 1, 1,
0.1983825, 0.1522959, 0.2730212, 0, 0, 0, 1, 1,
0.1990752, 0.1193306, 0.06595587, 0, 0, 0, 1, 1,
0.2018659, -0.5179355, 4.220845, 0, 0, 0, 1, 1,
0.2022169, 0.6445047, -0.3628604, 0, 0, 0, 1, 1,
0.2044492, -0.3973582, 3.783453, 0, 0, 0, 1, 1,
0.2054597, 1.653949, -2.690903, 0, 0, 0, 1, 1,
0.207045, -0.2228089, 2.45198, 1, 1, 1, 1, 1,
0.209221, -1.406476, 3.939072, 1, 1, 1, 1, 1,
0.2109196, -0.8531829, 1.606009, 1, 1, 1, 1, 1,
0.2157562, -0.2090096, 2.846979, 1, 1, 1, 1, 1,
0.2192548, -2.055009, 4.042223, 1, 1, 1, 1, 1,
0.2217913, -0.8595891, 5.244733, 1, 1, 1, 1, 1,
0.2257003, -0.3271361, 3.399172, 1, 1, 1, 1, 1,
0.2288065, 0.007738476, 2.259201, 1, 1, 1, 1, 1,
0.2318742, -1.250356, 5.167706, 1, 1, 1, 1, 1,
0.2338755, 0.1597386, 2.405894, 1, 1, 1, 1, 1,
0.2372985, 1.123019, -1.065541, 1, 1, 1, 1, 1,
0.2397917, 0.9633048, 0.385824, 1, 1, 1, 1, 1,
0.2453106, -0.9055431, 1.689348, 1, 1, 1, 1, 1,
0.2463672, 0.2779526, -0.1729957, 1, 1, 1, 1, 1,
0.2463912, 0.4986339, 1.228742, 1, 1, 1, 1, 1,
0.2467353, -0.7974666, 2.039786, 0, 0, 1, 1, 1,
0.2500181, 0.8786348, 0.4316229, 1, 0, 0, 1, 1,
0.2579051, -0.2734102, 1.533765, 1, 0, 0, 1, 1,
0.2591853, 0.4385968, -0.6461048, 1, 0, 0, 1, 1,
0.2592619, 0.00520163, 2.740615, 1, 0, 0, 1, 1,
0.266077, -0.1213121, 2.617416, 1, 0, 0, 1, 1,
0.268117, -0.4450881, 2.765914, 0, 0, 0, 1, 1,
0.2685511, -2.090761, 3.01481, 0, 0, 0, 1, 1,
0.269944, 0.8578219, 1.863408, 0, 0, 0, 1, 1,
0.2722447, 0.4620989, 1.286411, 0, 0, 0, 1, 1,
0.2728014, 1.510928, -0.4299983, 0, 0, 0, 1, 1,
0.2770674, -0.9853969, 3.549671, 0, 0, 0, 1, 1,
0.281021, -0.1790629, 0.8491463, 0, 0, 0, 1, 1,
0.285602, -0.3152329, 1.182811, 1, 1, 1, 1, 1,
0.2875644, 0.8849476, 0.9117666, 1, 1, 1, 1, 1,
0.2913266, 1.434021, -0.296889, 1, 1, 1, 1, 1,
0.2936729, 1.535223, 0.9382247, 1, 1, 1, 1, 1,
0.298194, -0.4034716, 4.178361, 1, 1, 1, 1, 1,
0.2993787, 0.05662446, 1.159485, 1, 1, 1, 1, 1,
0.2995805, 1.276055, -0.3308358, 1, 1, 1, 1, 1,
0.300402, 0.2528695, 0.6979654, 1, 1, 1, 1, 1,
0.3008814, -0.4289983, 3.185425, 1, 1, 1, 1, 1,
0.3029498, 0.8343313, 0.4290012, 1, 1, 1, 1, 1,
0.3032692, 0.2721172, -0.5019105, 1, 1, 1, 1, 1,
0.3041116, -0.5443913, -0.3603248, 1, 1, 1, 1, 1,
0.3049875, 0.2747499, 0.9506506, 1, 1, 1, 1, 1,
0.305172, 0.04522014, 0.458982, 1, 1, 1, 1, 1,
0.3063512, 0.7638572, 0.9641321, 1, 1, 1, 1, 1,
0.3076468, -1.331458, 3.0103, 0, 0, 1, 1, 1,
0.3079373, -1.020318, 5.32307, 1, 0, 0, 1, 1,
0.3141176, 0.8784729, 0.9363762, 1, 0, 0, 1, 1,
0.3165273, -0.6587451, 2.332291, 1, 0, 0, 1, 1,
0.3174378, -0.0003801463, 1.363134, 1, 0, 0, 1, 1,
0.3184354, -1.287765, 3.569092, 1, 0, 0, 1, 1,
0.3232187, -1.041104, 2.573008, 0, 0, 0, 1, 1,
0.3235022, -0.946991, 2.740139, 0, 0, 0, 1, 1,
0.3238263, -0.3681438, 1.379685, 0, 0, 0, 1, 1,
0.3246414, -0.969746, 1.914818, 0, 0, 0, 1, 1,
0.3247848, 0.007810729, 1.289789, 0, 0, 0, 1, 1,
0.3270102, -0.5263301, 2.876054, 0, 0, 0, 1, 1,
0.3298869, 1.282702, 1.356374, 0, 0, 0, 1, 1,
0.3352661, -0.6038527, 0.8509881, 1, 1, 1, 1, 1,
0.335415, 0.1847488, 1.448483, 1, 1, 1, 1, 1,
0.336049, -0.007824631, 2.653659, 1, 1, 1, 1, 1,
0.3434512, 1.852524, 1.770732, 1, 1, 1, 1, 1,
0.3443034, 0.1565449, 1.212966, 1, 1, 1, 1, 1,
0.3454521, 1.069308, 0.5037202, 1, 1, 1, 1, 1,
0.3578716, -0.4077262, 3.724383, 1, 1, 1, 1, 1,
0.3611895, -0.5803362, 1.303796, 1, 1, 1, 1, 1,
0.361483, -2.207026, 5.614645, 1, 1, 1, 1, 1,
0.3620282, -0.1966347, 4.682519, 1, 1, 1, 1, 1,
0.3651702, -0.3199485, 2.301442, 1, 1, 1, 1, 1,
0.3655944, -0.02670391, 3.710685, 1, 1, 1, 1, 1,
0.3672846, 0.8971106, -0.1137512, 1, 1, 1, 1, 1,
0.3685969, 0.1632272, 1.882799, 1, 1, 1, 1, 1,
0.3710927, 0.4206531, 2.101996, 1, 1, 1, 1, 1,
0.3720973, 0.3302085, 1.401028, 0, 0, 1, 1, 1,
0.3743941, 0.3776188, 0.7728093, 1, 0, 0, 1, 1,
0.374844, 0.01093671, -1.412165, 1, 0, 0, 1, 1,
0.3771545, -1.334, 3.265378, 1, 0, 0, 1, 1,
0.3925927, 0.2790899, 1.290697, 1, 0, 0, 1, 1,
0.394486, -1.565073, 2.253515, 1, 0, 0, 1, 1,
0.3964422, 1.2654, 0.2147243, 0, 0, 0, 1, 1,
0.3973628, 0.6490639, 1.993248, 0, 0, 0, 1, 1,
0.4020188, -0.01945125, -0.1643372, 0, 0, 0, 1, 1,
0.4027937, 0.6291702, -0.5430111, 0, 0, 0, 1, 1,
0.4117962, 0.4417658, 0.9199847, 0, 0, 0, 1, 1,
0.4118916, 1.160175, -0.7817118, 0, 0, 0, 1, 1,
0.4133554, 0.2055826, 0.4839018, 0, 0, 0, 1, 1,
0.4150259, 0.7929509, 0.7019532, 1, 1, 1, 1, 1,
0.4191595, -0.6767312, 2.682652, 1, 1, 1, 1, 1,
0.4209803, -0.6206976, 1.753091, 1, 1, 1, 1, 1,
0.426715, 0.561361, 1.622169, 1, 1, 1, 1, 1,
0.4294133, -1.873819, 2.126373, 1, 1, 1, 1, 1,
0.429463, -0.1400479, 0.4982863, 1, 1, 1, 1, 1,
0.4301626, 0.2000083, 0.4550017, 1, 1, 1, 1, 1,
0.4319621, 0.9372185, 0.251047, 1, 1, 1, 1, 1,
0.4355229, 0.7048336, -1.635253, 1, 1, 1, 1, 1,
0.4397512, 0.6937503, 0.5877823, 1, 1, 1, 1, 1,
0.4499852, -0.0235333, 1.859759, 1, 1, 1, 1, 1,
0.4529289, -0.2291716, 1.487758, 1, 1, 1, 1, 1,
0.4571017, -0.2248224, 0.440983, 1, 1, 1, 1, 1,
0.4575782, 0.2508056, 2.055446, 1, 1, 1, 1, 1,
0.4610149, 0.5277967, 1.235422, 1, 1, 1, 1, 1,
0.4701214, -0.01147925, 2.424192, 0, 0, 1, 1, 1,
0.4723048, -2.506466, 2.345079, 1, 0, 0, 1, 1,
0.4760909, 1.272792, 0.9021457, 1, 0, 0, 1, 1,
0.4788274, 0.2235808, 2.001907, 1, 0, 0, 1, 1,
0.4840673, -1.730271, 2.61208, 1, 0, 0, 1, 1,
0.4887579, 1.350582, -0.1423196, 1, 0, 0, 1, 1,
0.4901514, -0.4502381, 1.547331, 0, 0, 0, 1, 1,
0.4947262, 1.382116, -0.9393895, 0, 0, 0, 1, 1,
0.4972333, 0.676617, 0.04225554, 0, 0, 0, 1, 1,
0.5016996, -0.1517352, 3.020775, 0, 0, 0, 1, 1,
0.5022591, -1.319022, 3.449504, 0, 0, 0, 1, 1,
0.5044369, -0.1254083, 1.947676, 0, 0, 0, 1, 1,
0.5152901, -1.368924, 4.283991, 0, 0, 0, 1, 1,
0.5208051, 1.691725, 0.5566492, 1, 1, 1, 1, 1,
0.521153, 1.004237, -0.5425878, 1, 1, 1, 1, 1,
0.5259442, -1.945038, 4.715057, 1, 1, 1, 1, 1,
0.528836, -0.05940246, 1.310429, 1, 1, 1, 1, 1,
0.5290851, -0.7734703, 2.661409, 1, 1, 1, 1, 1,
0.5370623, -0.2923433, 4.04536, 1, 1, 1, 1, 1,
0.5401632, -0.2285127, 1.89685, 1, 1, 1, 1, 1,
0.5422894, -0.5721908, 0.9997295, 1, 1, 1, 1, 1,
0.5449312, -0.3906524, 0.4253529, 1, 1, 1, 1, 1,
0.548749, -0.003958798, 0.4116429, 1, 1, 1, 1, 1,
0.5494977, 0.3890343, 2.314742, 1, 1, 1, 1, 1,
0.5528893, -0.7792501, 2.512193, 1, 1, 1, 1, 1,
0.5604495, -0.1745279, 3.716076, 1, 1, 1, 1, 1,
0.5607989, 1.408531, -0.3743567, 1, 1, 1, 1, 1,
0.5640425, -0.4146815, 1.834603, 1, 1, 1, 1, 1,
0.5648155, 0.4647603, 2.602805, 0, 0, 1, 1, 1,
0.566781, -0.3047443, 0.4875014, 1, 0, 0, 1, 1,
0.5740647, -0.2192548, 2.099792, 1, 0, 0, 1, 1,
0.5816267, -1.170331, 2.63539, 1, 0, 0, 1, 1,
0.5819387, -0.1509134, 2.540369, 1, 0, 0, 1, 1,
0.5886222, -0.3007921, 0.3801918, 1, 0, 0, 1, 1,
0.5911015, 0.6998, 1.319921, 0, 0, 0, 1, 1,
0.5961134, -0.8251296, 2.310049, 0, 0, 0, 1, 1,
0.5979659, -1.037242, 1.373654, 0, 0, 0, 1, 1,
0.5988557, -0.1130499, 1.406658, 0, 0, 0, 1, 1,
0.599829, 0.01501813, 1.847109, 0, 0, 0, 1, 1,
0.6044759, -0.2150555, 3.05907, 0, 0, 0, 1, 1,
0.6085894, 0.582794, 1.596484, 0, 0, 0, 1, 1,
0.6123335, -0.8024086, 2.121555, 1, 1, 1, 1, 1,
0.6205183, 0.4054467, 2.302258, 1, 1, 1, 1, 1,
0.6206217, 1.091422, 1.193788, 1, 1, 1, 1, 1,
0.6233779, -0.6357151, 2.441858, 1, 1, 1, 1, 1,
0.6234999, 1.924812, 0.8129526, 1, 1, 1, 1, 1,
0.6253268, -0.1578771, 1.318217, 1, 1, 1, 1, 1,
0.626021, 0.4608558, 1.968427, 1, 1, 1, 1, 1,
0.6260303, -1.966297, 2.719902, 1, 1, 1, 1, 1,
0.6264153, 0.7678149, 0.9920031, 1, 1, 1, 1, 1,
0.6266741, -1.012098, 1.210835, 1, 1, 1, 1, 1,
0.6398179, 0.8768765, -0.987993, 1, 1, 1, 1, 1,
0.6442318, -0.5133078, 1.100427, 1, 1, 1, 1, 1,
0.6478349, -0.549302, 2.935503, 1, 1, 1, 1, 1,
0.6519035, 0.1216411, 0.8076078, 1, 1, 1, 1, 1,
0.6533689, 0.23668, 1.727786, 1, 1, 1, 1, 1,
0.662343, -0.6161693, 1.761338, 0, 0, 1, 1, 1,
0.6760905, 1.917928, -0.1707569, 1, 0, 0, 1, 1,
0.6804339, -1.309081, 2.535671, 1, 0, 0, 1, 1,
0.6805934, 0.3968828, 0.5371829, 1, 0, 0, 1, 1,
0.6810701, 0.9268011, 2.197257, 1, 0, 0, 1, 1,
0.6843843, 0.3266985, 1.346056, 1, 0, 0, 1, 1,
0.6914667, -0.1630722, 2.104511, 0, 0, 0, 1, 1,
0.6982706, -0.9159113, 4.468075, 0, 0, 0, 1, 1,
0.7041804, -0.414053, 1.183672, 0, 0, 0, 1, 1,
0.7054828, -0.4446558, 1.688721, 0, 0, 0, 1, 1,
0.7066968, 0.4480964, 1.712385, 0, 0, 0, 1, 1,
0.7071684, -1.251133, 1.945925, 0, 0, 0, 1, 1,
0.7115524, -0.1039621, 2.147174, 0, 0, 0, 1, 1,
0.7135649, -1.072395, 2.262638, 1, 1, 1, 1, 1,
0.7136576, 1.264193, -0.9910028, 1, 1, 1, 1, 1,
0.7136842, 0.05358521, 1.123026, 1, 1, 1, 1, 1,
0.7143711, -1.485228, 2.300272, 1, 1, 1, 1, 1,
0.7176223, -0.5028039, 3.268164, 1, 1, 1, 1, 1,
0.7202288, -1.394357, 1.233474, 1, 1, 1, 1, 1,
0.7286779, -0.7234276, 1.246635, 1, 1, 1, 1, 1,
0.7344984, 1.639853, 1.038786, 1, 1, 1, 1, 1,
0.7410386, -0.8260766, 2.437531, 1, 1, 1, 1, 1,
0.7463858, -0.09304981, 0.3820778, 1, 1, 1, 1, 1,
0.7496019, 0.3177228, 1.537202, 1, 1, 1, 1, 1,
0.7514894, 0.5852708, 0.1972218, 1, 1, 1, 1, 1,
0.7539899, -2.133323, 1.871585, 1, 1, 1, 1, 1,
0.754309, 0.3778959, 0.602803, 1, 1, 1, 1, 1,
0.7545696, 1.79203, 0.790903, 1, 1, 1, 1, 1,
0.7549557, 0.1571705, 0.2529625, 0, 0, 1, 1, 1,
0.7558334, -1.743607, 2.608034, 1, 0, 0, 1, 1,
0.7566754, -0.9370414, 3.921715, 1, 0, 0, 1, 1,
0.7633681, 0.1146501, 0.6373488, 1, 0, 0, 1, 1,
0.7633834, 1.996809, -0.1147522, 1, 0, 0, 1, 1,
0.7636219, 0.4660535, 0.5366862, 1, 0, 0, 1, 1,
0.7647954, -0.7890165, 2.622613, 0, 0, 0, 1, 1,
0.7651803, 0.2400844, 1.327045, 0, 0, 0, 1, 1,
0.766919, -0.8873802, 1.400266, 0, 0, 0, 1, 1,
0.7700663, -0.1377554, 2.08245, 0, 0, 0, 1, 1,
0.7714068, 1.560577, 1.629429, 0, 0, 0, 1, 1,
0.7727321, 0.8592876, -0.5080462, 0, 0, 0, 1, 1,
0.7742513, -1.348268, 1.688432, 0, 0, 0, 1, 1,
0.7761354, 1.626106, 0.9787131, 1, 1, 1, 1, 1,
0.7855145, 2.083494, 1.279384, 1, 1, 1, 1, 1,
0.7896581, -0.009199673, 3.168814, 1, 1, 1, 1, 1,
0.7964639, -1.44777, 2.772779, 1, 1, 1, 1, 1,
0.7970545, 1.487418, -0.1281046, 1, 1, 1, 1, 1,
0.7977595, 1.561884, 0.9893315, 1, 1, 1, 1, 1,
0.7978748, -1.391937, 3.382044, 1, 1, 1, 1, 1,
0.7981014, 1.603307, 0.7408231, 1, 1, 1, 1, 1,
0.8155842, -1.851172, 3.403337, 1, 1, 1, 1, 1,
0.8164864, 1.03897, -0.307095, 1, 1, 1, 1, 1,
0.8180565, -1.173564, 2.592246, 1, 1, 1, 1, 1,
0.8220722, 0.1500138, 1.53017, 1, 1, 1, 1, 1,
0.8232374, 0.1512297, 2.042507, 1, 1, 1, 1, 1,
0.8247901, 1.146074, -0.1016801, 1, 1, 1, 1, 1,
0.8304439, 1.247838, -0.5046932, 1, 1, 1, 1, 1,
0.847793, -0.4993607, 1.803384, 0, 0, 1, 1, 1,
0.8501042, -0.419858, 3.576737, 1, 0, 0, 1, 1,
0.8549802, -2.281689, 1.345884, 1, 0, 0, 1, 1,
0.8566036, -0.9747931, 2.371196, 1, 0, 0, 1, 1,
0.8595576, -1.471712, 2.479173, 1, 0, 0, 1, 1,
0.8612292, -0.4469689, 3.525369, 1, 0, 0, 1, 1,
0.8612559, -0.9384531, 1.798522, 0, 0, 0, 1, 1,
0.8629786, 1.322421, 0.9698942, 0, 0, 0, 1, 1,
0.8638557, 1.054182, 1.32245, 0, 0, 0, 1, 1,
0.8643675, -1.078667, 2.90749, 0, 0, 0, 1, 1,
0.8660331, 0.5359816, -0.01593152, 0, 0, 0, 1, 1,
0.875654, 1.242785, -0.1331082, 0, 0, 0, 1, 1,
0.8791777, -0.1012863, 2.918882, 0, 0, 0, 1, 1,
0.8813658, 0.1914865, 1.389889, 1, 1, 1, 1, 1,
0.8908852, 1.113745, -0.272587, 1, 1, 1, 1, 1,
0.8931035, 1.383156, -0.932864, 1, 1, 1, 1, 1,
0.8992252, -0.2326987, 2.233746, 1, 1, 1, 1, 1,
0.8992931, -1.805115, 2.216638, 1, 1, 1, 1, 1,
0.8999077, 1.090125, 1.197337, 1, 1, 1, 1, 1,
0.9034945, 0.05028131, 3.147538, 1, 1, 1, 1, 1,
0.9071793, -0.4963611, 1.985971, 1, 1, 1, 1, 1,
0.9116192, -0.6294285, 1.188481, 1, 1, 1, 1, 1,
0.9121267, 0.2500563, 1.617395, 1, 1, 1, 1, 1,
0.9123382, 1.140137, 0.06931069, 1, 1, 1, 1, 1,
0.920272, 0.2656067, 0.9538106, 1, 1, 1, 1, 1,
0.9344406, 0.3336264, 1.565472, 1, 1, 1, 1, 1,
0.9377113, 0.7985153, 0.3627567, 1, 1, 1, 1, 1,
0.9424469, -0.08763637, 0.7690251, 1, 1, 1, 1, 1,
0.9470823, 0.4913915, 0.8295907, 0, 0, 1, 1, 1,
0.9490659, -0.6282401, 0.8226238, 1, 0, 0, 1, 1,
0.9493158, -0.8773777, 1.935017, 1, 0, 0, 1, 1,
0.9524825, 0.5896425, 0.5699643, 1, 0, 0, 1, 1,
0.957495, 0.6777962, 2.43025, 1, 0, 0, 1, 1,
0.961331, 0.9457147, 0.414113, 1, 0, 0, 1, 1,
0.9668173, -0.6341684, 2.252881, 0, 0, 0, 1, 1,
0.9711667, -0.3845399, 2.883665, 0, 0, 0, 1, 1,
0.9773415, -0.3353898, 1.62833, 0, 0, 0, 1, 1,
0.9786925, -0.4367031, 1.504516, 0, 0, 0, 1, 1,
0.9972117, -0.4919008, 2.537988, 0, 0, 0, 1, 1,
1.001093, -0.7635626, 1.286486, 0, 0, 0, 1, 1,
1.008842, -0.4957855, 1.135964, 0, 0, 0, 1, 1,
1.01227, 0.7350413, 2.449435, 1, 1, 1, 1, 1,
1.014533, 1.161442, 0.3233026, 1, 1, 1, 1, 1,
1.029409, 0.2772269, 2.616464, 1, 1, 1, 1, 1,
1.061244, 1.12227, 0.7713794, 1, 1, 1, 1, 1,
1.065504, -0.5150583, 1.582006, 1, 1, 1, 1, 1,
1.076728, 0.3687637, 1.464826, 1, 1, 1, 1, 1,
1.079285, 0.07698476, 2.078966, 1, 1, 1, 1, 1,
1.087475, -1.252749, 4.145927, 1, 1, 1, 1, 1,
1.089489, 1.504993, 1.084689, 1, 1, 1, 1, 1,
1.098184, 0.9295073, 0.6696455, 1, 1, 1, 1, 1,
1.100182, 0.4655317, 1.387041, 1, 1, 1, 1, 1,
1.11063, -0.005440744, 1.046292, 1, 1, 1, 1, 1,
1.118702, 0.5776018, 0.7814123, 1, 1, 1, 1, 1,
1.128963, 0.3391581, 2.675296, 1, 1, 1, 1, 1,
1.129782, 0.9103205, 0.2559556, 1, 1, 1, 1, 1,
1.135336, 0.4807915, 1.556611, 0, 0, 1, 1, 1,
1.139338, 0.8747877, 0.1190549, 1, 0, 0, 1, 1,
1.14051, -0.4971589, 0.4050049, 1, 0, 0, 1, 1,
1.142768, 1.787707, 1.028985, 1, 0, 0, 1, 1,
1.148108, -0.5891674, 1.536693, 1, 0, 0, 1, 1,
1.148905, 0.05960669, -0.04895725, 1, 0, 0, 1, 1,
1.152674, 0.5438186, 1.410779, 0, 0, 0, 1, 1,
1.15272, 0.2876639, 0.9970973, 0, 0, 0, 1, 1,
1.164127, 1.128932, 0.2816567, 0, 0, 0, 1, 1,
1.178331, -1.240036, 2.212239, 0, 0, 0, 1, 1,
1.182573, 1.653306, -0.7496945, 0, 0, 0, 1, 1,
1.182655, 1.371989, 0.3912279, 0, 0, 0, 1, 1,
1.194933, -2.593413, 2.867722, 0, 0, 0, 1, 1,
1.197114, -0.9466997, 1.018315, 1, 1, 1, 1, 1,
1.203936, -0.3601727, 2.210627, 1, 1, 1, 1, 1,
1.209343, 0.8853467, -0.2217183, 1, 1, 1, 1, 1,
1.209368, -1.282145, 1.596118, 1, 1, 1, 1, 1,
1.213086, -0.4810573, 0.9392739, 1, 1, 1, 1, 1,
1.220087, 0.9502886, 0.4104777, 1, 1, 1, 1, 1,
1.225077, -0.2604532, 1.201008, 1, 1, 1, 1, 1,
1.227898, -1.030818, 3.20435, 1, 1, 1, 1, 1,
1.229937, 0.9469661, 1.898645, 1, 1, 1, 1, 1,
1.237338, -0.2149992, 1.85564, 1, 1, 1, 1, 1,
1.243532, -0.9406537, 3.322957, 1, 1, 1, 1, 1,
1.247757, -1.090778, 2.581554, 1, 1, 1, 1, 1,
1.248291, 0.5056975, -0.1043652, 1, 1, 1, 1, 1,
1.249104, 0.5520182, 0.5540686, 1, 1, 1, 1, 1,
1.249394, 0.6688589, 1.550938, 1, 1, 1, 1, 1,
1.25139, -0.2921186, 2.392959, 0, 0, 1, 1, 1,
1.25779, -1.42656, 2.459244, 1, 0, 0, 1, 1,
1.273283, 0.1951582, 0.886855, 1, 0, 0, 1, 1,
1.274128, 1.07902, 0.005686716, 1, 0, 0, 1, 1,
1.291072, -0.5082313, 3.271778, 1, 0, 0, 1, 1,
1.301117, -2.158887, 3.86044, 1, 0, 0, 1, 1,
1.306415, -0.2817562, 1.176315, 0, 0, 0, 1, 1,
1.313578, 0.6789538, -0.09694403, 0, 0, 0, 1, 1,
1.319202, 0.2831342, 2.144829, 0, 0, 0, 1, 1,
1.324772, -1.061536, 0.8071342, 0, 0, 0, 1, 1,
1.326725, 0.9527262, 1.637075, 0, 0, 0, 1, 1,
1.332123, 0.8798867, 1.621068, 0, 0, 0, 1, 1,
1.337397, -0.3771715, 2.033265, 0, 0, 0, 1, 1,
1.349441, 0.8563888, 2.767782, 1, 1, 1, 1, 1,
1.354399, -2.515216, 2.468407, 1, 1, 1, 1, 1,
1.357018, 0.6223585, 1.493594, 1, 1, 1, 1, 1,
1.371109, -0.04632149, 0.9456042, 1, 1, 1, 1, 1,
1.372353, -0.2096687, 1.382188, 1, 1, 1, 1, 1,
1.381821, -0.6203987, 2.16554, 1, 1, 1, 1, 1,
1.384152, 1.028441, 0.7721902, 1, 1, 1, 1, 1,
1.386002, 1.130579, 0.7598342, 1, 1, 1, 1, 1,
1.401854, 0.4675474, -1.029674, 1, 1, 1, 1, 1,
1.411143, 0.9605388, -0.7020002, 1, 1, 1, 1, 1,
1.416488, -0.89529, 2.578642, 1, 1, 1, 1, 1,
1.440123, 0.5727466, 0.4086203, 1, 1, 1, 1, 1,
1.445876, 0.4736487, 1.628391, 1, 1, 1, 1, 1,
1.448571, 1.456798, -1.351937, 1, 1, 1, 1, 1,
1.450973, 0.3186345, 2.38352, 1, 1, 1, 1, 1,
1.45214, 1.747851, -0.08393648, 0, 0, 1, 1, 1,
1.464926, 1.308237, 0.3193113, 1, 0, 0, 1, 1,
1.476614, 0.910253, -0.461633, 1, 0, 0, 1, 1,
1.478441, -0.4785446, 0.5802923, 1, 0, 0, 1, 1,
1.482044, 1.298564, -0.06942974, 1, 0, 0, 1, 1,
1.488454, -2.374802, 3.448302, 1, 0, 0, 1, 1,
1.493509, -1.013652, 2.760069, 0, 0, 0, 1, 1,
1.500254, 1.366295, -0.8414673, 0, 0, 0, 1, 1,
1.521588, -1.363053, 2.156785, 0, 0, 0, 1, 1,
1.524778, 1.295828, 1.60029, 0, 0, 0, 1, 1,
1.525403, -1.151134, 0.9843088, 0, 0, 0, 1, 1,
1.531346, 0.7650819, 2.506914, 0, 0, 0, 1, 1,
1.534581, 2.013008, 1.131202, 0, 0, 0, 1, 1,
1.549981, 1.085957, 0.9166527, 1, 1, 1, 1, 1,
1.595497, -1.328827, 1.213766, 1, 1, 1, 1, 1,
1.596124, -0.2893626, 4.156908, 1, 1, 1, 1, 1,
1.599319, 0.2093906, 0.857125, 1, 1, 1, 1, 1,
1.620204, -1.108942, 2.632896, 1, 1, 1, 1, 1,
1.629304, 0.5601465, 2.125705, 1, 1, 1, 1, 1,
1.630571, -0.6571134, 1.970051, 1, 1, 1, 1, 1,
1.632904, 0.01064275, 2.210565, 1, 1, 1, 1, 1,
1.636831, 0.0189715, 1.38351, 1, 1, 1, 1, 1,
1.649122, -0.6163952, 2.066427, 1, 1, 1, 1, 1,
1.652749, -1.166886, 1.68206, 1, 1, 1, 1, 1,
1.653155, 0.6029818, 0.4862109, 1, 1, 1, 1, 1,
1.681031, 1.394295, 2.520174, 1, 1, 1, 1, 1,
1.683551, -0.7715719, 2.469949, 1, 1, 1, 1, 1,
1.686103, -0.1170332, 1.983836, 1, 1, 1, 1, 1,
1.687584, -0.3435026, 2.39099, 0, 0, 1, 1, 1,
1.688588, 1.648413, 1.911095, 1, 0, 0, 1, 1,
1.695169, 1.181687, 0.4746543, 1, 0, 0, 1, 1,
1.70011, -1.775225, 2.068331, 1, 0, 0, 1, 1,
1.715238, -1.563438, 3.481564, 1, 0, 0, 1, 1,
1.721581, -0.3217286, 2.532941, 1, 0, 0, 1, 1,
1.734915, -0.4057649, 2.277483, 0, 0, 0, 1, 1,
1.737965, -0.4313128, 1.284714, 0, 0, 0, 1, 1,
1.772258, -0.4057557, 2.28596, 0, 0, 0, 1, 1,
1.788941, 2.535701, 1.690139, 0, 0, 0, 1, 1,
1.803155, -1.306071, 1.586142, 0, 0, 0, 1, 1,
1.815272, -1.643526, 2.810168, 0, 0, 0, 1, 1,
1.816308, -0.6876735, 2.171209, 0, 0, 0, 1, 1,
1.828795, -1.92462, 2.058595, 1, 1, 1, 1, 1,
1.829174, -1.129759, 1.367213, 1, 1, 1, 1, 1,
1.841139, 1.160207, -0.1343949, 1, 1, 1, 1, 1,
1.844372, -0.1630639, 1.029003, 1, 1, 1, 1, 1,
1.84595, 0.8398428, -0.1527752, 1, 1, 1, 1, 1,
1.855873, -1.238824, 1.987899, 1, 1, 1, 1, 1,
1.877294, -0.285266, 1.734707, 1, 1, 1, 1, 1,
1.888376, -1.083272, 1.253269, 1, 1, 1, 1, 1,
1.903657, 2.188027, 1.341146, 1, 1, 1, 1, 1,
1.949383, 0.6291743, -1.02165, 1, 1, 1, 1, 1,
1.953416, 0.3693986, 0.1538192, 1, 1, 1, 1, 1,
1.995136, 0.09521946, 2.816458, 1, 1, 1, 1, 1,
2.001285, -0.03399343, 0.4739946, 1, 1, 1, 1, 1,
2.017263, -1.527966, 0.6683184, 1, 1, 1, 1, 1,
2.024302, -1.905716, 2.602316, 1, 1, 1, 1, 1,
2.028227, 0.9181588, 2.357913, 0, 0, 1, 1, 1,
2.042873, 0.09863617, 0.78137, 1, 0, 0, 1, 1,
2.091243, -0.1779959, 3.719059, 1, 0, 0, 1, 1,
2.092034, 0.7307002, 3.302342, 1, 0, 0, 1, 1,
2.09411, 0.4458775, 0.7390713, 1, 0, 0, 1, 1,
2.114649, 1.279312, 0.4548749, 1, 0, 0, 1, 1,
2.120475, 0.6875287, 1.169603, 0, 0, 0, 1, 1,
2.122521, 0.108076, 1.569768, 0, 0, 0, 1, 1,
2.143076, 2.483713, 0.5726732, 0, 0, 0, 1, 1,
2.166935, -0.9035183, 2.988666, 0, 0, 0, 1, 1,
2.194836, -0.826964, 2.579376, 0, 0, 0, 1, 1,
2.2052, 0.5732064, 0.2206316, 0, 0, 0, 1, 1,
2.271365, 0.4195507, 3.079574, 0, 0, 0, 1, 1,
2.294615, 0.4722463, 1.381947, 1, 1, 1, 1, 1,
2.326146, 1.154571, 1.948596, 1, 1, 1, 1, 1,
2.407788, -0.5761147, 1.921026, 1, 1, 1, 1, 1,
2.608576, 0.4883961, 1.379754, 1, 1, 1, 1, 1,
2.821344, 1.989235, 1.198752, 1, 1, 1, 1, 1,
2.947964, -1.445418, 1.527594, 1, 1, 1, 1, 1,
3.008728, 0.2741735, 0.008594862, 1, 1, 1, 1, 1
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
var radius = 9.994119;
var distance = 35.10392;
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
mvMatrix.translate( 0.2665715, -0.2539814, -0.1280322 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.10392);
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
