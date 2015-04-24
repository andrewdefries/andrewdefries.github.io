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
-3.106937, -1.97599, -3.187769, 1, 0, 0, 1,
-2.906164, 1.001813, 0.8704347, 1, 0.007843138, 0, 1,
-2.817154, 0.1363298, -2.319796, 1, 0.01176471, 0, 1,
-2.772993, 0.4602565, -1.841071, 1, 0.01960784, 0, 1,
-2.654592, -1.615657, -2.649104, 1, 0.02352941, 0, 1,
-2.60884, 0.3244558, 0.2190457, 1, 0.03137255, 0, 1,
-2.413217, -1.330083, -3.30876, 1, 0.03529412, 0, 1,
-2.396754, 0.1599628, -2.391385, 1, 0.04313726, 0, 1,
-2.381133, -0.5901083, -1.768533, 1, 0.04705882, 0, 1,
-2.37873, 0.4343668, -0.4324435, 1, 0.05490196, 0, 1,
-2.368639, -0.9276404, 0.1029927, 1, 0.05882353, 0, 1,
-2.361067, -0.6394351, -2.056743, 1, 0.06666667, 0, 1,
-2.300088, -0.1831789, -2.375598, 1, 0.07058824, 0, 1,
-2.246592, -0.02754336, -2.377072, 1, 0.07843138, 0, 1,
-2.207789, 0.1898242, -1.115021, 1, 0.08235294, 0, 1,
-2.164058, -1.143971, -1.168137, 1, 0.09019608, 0, 1,
-2.15356, 0.6065591, -0.3904998, 1, 0.09411765, 0, 1,
-2.013181, 0.043221, -3.412673, 1, 0.1019608, 0, 1,
-1.998439, 0.202857, -3.230354, 1, 0.1098039, 0, 1,
-1.983336, 0.03109247, -2.593086, 1, 0.1137255, 0, 1,
-1.963072, -0.7597534, -1.514103, 1, 0.1215686, 0, 1,
-1.961096, -0.313134, -2.904417, 1, 0.1254902, 0, 1,
-1.95308, -0.812194, -1.097881, 1, 0.1333333, 0, 1,
-1.949594, 0.8463034, -2.022911, 1, 0.1372549, 0, 1,
-1.923295, 0.8945557, -1.244752, 1, 0.145098, 0, 1,
-1.917008, -0.7999555, -1.577667, 1, 0.1490196, 0, 1,
-1.908502, 0.7156565, -0.7693381, 1, 0.1568628, 0, 1,
-1.897502, 1.116046, -1.262519, 1, 0.1607843, 0, 1,
-1.892457, -0.5620396, -2.840466, 1, 0.1686275, 0, 1,
-1.89166, -0.4801018, -2.982543, 1, 0.172549, 0, 1,
-1.889346, -0.5812044, -0.1170297, 1, 0.1803922, 0, 1,
-1.873458, -0.009582456, -0.9394131, 1, 0.1843137, 0, 1,
-1.873235, -2.028951, -1.813622, 1, 0.1921569, 0, 1,
-1.872553, -0.5668861, -1.275206, 1, 0.1960784, 0, 1,
-1.852432, 0.157045, -1.614126, 1, 0.2039216, 0, 1,
-1.842277, 0.9317548, -0.1083125, 1, 0.2117647, 0, 1,
-1.84018, -1.367314, -1.97814, 1, 0.2156863, 0, 1,
-1.832587, -1.115698, -0.9117252, 1, 0.2235294, 0, 1,
-1.827323, 0.2169805, -1.80665, 1, 0.227451, 0, 1,
-1.825068, 1.63051, -1.468053, 1, 0.2352941, 0, 1,
-1.816573, -0.2673184, -1.464113, 1, 0.2392157, 0, 1,
-1.799233, -1.786549, -1.068333, 1, 0.2470588, 0, 1,
-1.779325, 0.9166697, -3.292556, 1, 0.2509804, 0, 1,
-1.768782, 0.4199429, -1.308481, 1, 0.2588235, 0, 1,
-1.767105, 0.009183279, -0.988321, 1, 0.2627451, 0, 1,
-1.765898, 0.2221872, -0.3618175, 1, 0.2705882, 0, 1,
-1.751029, 0.6857034, -1.781862, 1, 0.2745098, 0, 1,
-1.747887, -0.2449466, -3.382673, 1, 0.282353, 0, 1,
-1.747386, 2.136617, -0.7570145, 1, 0.2862745, 0, 1,
-1.739442, 1.651516, -1.03049, 1, 0.2941177, 0, 1,
-1.725014, -1.593422, -2.20331, 1, 0.3019608, 0, 1,
-1.723961, 1.404178, -1.081003, 1, 0.3058824, 0, 1,
-1.722287, 1.117882, -1.627288, 1, 0.3137255, 0, 1,
-1.708759, 0.9605356, -1.577253, 1, 0.3176471, 0, 1,
-1.707876, -1.350419, -2.348113, 1, 0.3254902, 0, 1,
-1.695421, 0.2997682, -2.865733, 1, 0.3294118, 0, 1,
-1.671891, 0.3149234, -1.489738, 1, 0.3372549, 0, 1,
-1.669591, 0.8146124, -1.762853, 1, 0.3411765, 0, 1,
-1.665998, -0.1800009, -2.749876, 1, 0.3490196, 0, 1,
-1.651499, 2.162948, -1.785286, 1, 0.3529412, 0, 1,
-1.648545, -0.8148573, -4.002271, 1, 0.3607843, 0, 1,
-1.646853, -0.4401059, -2.44075, 1, 0.3647059, 0, 1,
-1.630959, -0.5567206, -2.218735, 1, 0.372549, 0, 1,
-1.626905, 0.8915441, -1.577091, 1, 0.3764706, 0, 1,
-1.624489, 0.3234162, -0.879034, 1, 0.3843137, 0, 1,
-1.62367, -0.7479181, -2.176615, 1, 0.3882353, 0, 1,
-1.589297, -0.07575107, -0.8242306, 1, 0.3960784, 0, 1,
-1.582488, 0.2601329, 0.5525989, 1, 0.4039216, 0, 1,
-1.581952, -1.635581, -2.557389, 1, 0.4078431, 0, 1,
-1.570713, 1.203383, 0.4951278, 1, 0.4156863, 0, 1,
-1.566388, 0.01098917, -1.362896, 1, 0.4196078, 0, 1,
-1.555579, -0.9895107, -0.2910465, 1, 0.427451, 0, 1,
-1.542359, -0.8035299, 0.4864531, 1, 0.4313726, 0, 1,
-1.539809, -1.588266, -2.587844, 1, 0.4392157, 0, 1,
-1.532509, 0.9059105, -2.058995, 1, 0.4431373, 0, 1,
-1.526094, -1.894341, -2.89816, 1, 0.4509804, 0, 1,
-1.511506, 0.09598029, 0.04757319, 1, 0.454902, 0, 1,
-1.508666, -1.032046, -3.68255, 1, 0.4627451, 0, 1,
-1.505096, 0.3234364, -1.471075, 1, 0.4666667, 0, 1,
-1.496875, 2.773987, 0.125136, 1, 0.4745098, 0, 1,
-1.495833, -1.386145, -3.554794, 1, 0.4784314, 0, 1,
-1.491988, 1.538076, -0.7397998, 1, 0.4862745, 0, 1,
-1.471063, -0.03342064, -1.52172, 1, 0.4901961, 0, 1,
-1.4702, 0.3414863, 0.4897932, 1, 0.4980392, 0, 1,
-1.468174, 1.572884, 0.8350939, 1, 0.5058824, 0, 1,
-1.464059, -0.5973353, -0.6224576, 1, 0.509804, 0, 1,
-1.448567, 0.1057309, -3.452075, 1, 0.5176471, 0, 1,
-1.444798, 0.8371316, 0.1603198, 1, 0.5215687, 0, 1,
-1.443701, 0.1023377, -0.6038945, 1, 0.5294118, 0, 1,
-1.443679, -0.04904383, -1.996663, 1, 0.5333334, 0, 1,
-1.440617, -1.323794, -3.270005, 1, 0.5411765, 0, 1,
-1.436405, -0.2627029, -0.2277942, 1, 0.5450981, 0, 1,
-1.426396, 0.1704841, -0.5124329, 1, 0.5529412, 0, 1,
-1.425807, -0.5065179, -0.4755993, 1, 0.5568628, 0, 1,
-1.419495, -1.139866, -2.716265, 1, 0.5647059, 0, 1,
-1.413233, -1.677494, -2.352876, 1, 0.5686275, 0, 1,
-1.395345, 1.405606, -1.328924, 1, 0.5764706, 0, 1,
-1.390254, 1.822847, -0.6883579, 1, 0.5803922, 0, 1,
-1.382975, -0.8447589, -2.257014, 1, 0.5882353, 0, 1,
-1.380978, 0.4965378, 1.107947, 1, 0.5921569, 0, 1,
-1.378105, 1.37082, -1.358883, 1, 0.6, 0, 1,
-1.37435, 0.6629179, -1.86852, 1, 0.6078432, 0, 1,
-1.365549, 1.892462, -0.6467464, 1, 0.6117647, 0, 1,
-1.364087, 0.9973499, -0.7826789, 1, 0.6196079, 0, 1,
-1.357442, 1.193121, -0.623926, 1, 0.6235294, 0, 1,
-1.353357, -1.788433, -4.563729, 1, 0.6313726, 0, 1,
-1.352276, -0.5075271, -2.663861, 1, 0.6352941, 0, 1,
-1.351325, -2.872996, -3.230528, 1, 0.6431373, 0, 1,
-1.338119, -0.1808746, -1.54704, 1, 0.6470588, 0, 1,
-1.334474, 0.7308699, -0.8673933, 1, 0.654902, 0, 1,
-1.324251, -0.1932083, -2.062602, 1, 0.6588235, 0, 1,
-1.31775, 0.4824847, -0.7065976, 1, 0.6666667, 0, 1,
-1.314446, -1.066992, -1.460564, 1, 0.6705883, 0, 1,
-1.313785, 0.29974, -2.871612, 1, 0.6784314, 0, 1,
-1.310387, 0.2820879, -2.411329, 1, 0.682353, 0, 1,
-1.30718, 0.2483163, -2.765342, 1, 0.6901961, 0, 1,
-1.302023, -1.691883, -0.3600782, 1, 0.6941177, 0, 1,
-1.297618, -0.619553, -0.9376124, 1, 0.7019608, 0, 1,
-1.29652, 0.1718709, -1.814631, 1, 0.7098039, 0, 1,
-1.296402, 0.8534821, -1.545194, 1, 0.7137255, 0, 1,
-1.281286, 0.8808672, -1.239914, 1, 0.7215686, 0, 1,
-1.266322, 0.3148193, -0.8253079, 1, 0.7254902, 0, 1,
-1.264338, -0.2820079, -3.138937, 1, 0.7333333, 0, 1,
-1.2608, 1.134295, -1.933911, 1, 0.7372549, 0, 1,
-1.244473, -1.683036, -3.84787, 1, 0.7450981, 0, 1,
-1.240397, 0.07819859, -2.39452, 1, 0.7490196, 0, 1,
-1.235422, 1.978379, -0.0289898, 1, 0.7568628, 0, 1,
-1.225179, 1.469903, -1.962531, 1, 0.7607843, 0, 1,
-1.223021, 0.451219, -2.597436, 1, 0.7686275, 0, 1,
-1.218969, 0.3329772, -0.6337142, 1, 0.772549, 0, 1,
-1.215375, 0.7349155, 0.08201415, 1, 0.7803922, 0, 1,
-1.201962, 0.07238163, -1.570483, 1, 0.7843137, 0, 1,
-1.201722, 0.409362, -0.2008038, 1, 0.7921569, 0, 1,
-1.197434, -2.282533, -2.55351, 1, 0.7960784, 0, 1,
-1.193775, 0.9826181, -1.051806, 1, 0.8039216, 0, 1,
-1.187467, 0.961193, -0.1937088, 1, 0.8117647, 0, 1,
-1.181621, 0.04439333, -1.517773, 1, 0.8156863, 0, 1,
-1.176504, 0.2360612, -2.921891, 1, 0.8235294, 0, 1,
-1.175479, 0.9388607, -0.4846972, 1, 0.827451, 0, 1,
-1.173533, 0.1455777, -1.554202, 1, 0.8352941, 0, 1,
-1.168111, -0.2402853, -3.016127, 1, 0.8392157, 0, 1,
-1.167942, 0.07405598, -1.881009, 1, 0.8470588, 0, 1,
-1.163428, 0.04685109, -1.537054, 1, 0.8509804, 0, 1,
-1.160664, -0.8912699, -4.116919, 1, 0.8588235, 0, 1,
-1.152823, 0.2368683, -3.301297, 1, 0.8627451, 0, 1,
-1.14701, 0.6952083, -0.160365, 1, 0.8705882, 0, 1,
-1.145326, 1.789733, -1.165504, 1, 0.8745098, 0, 1,
-1.133867, 0.7967825, -1.786396, 1, 0.8823529, 0, 1,
-1.125534, -0.5044201, -1.94982, 1, 0.8862745, 0, 1,
-1.117323, 1.600566, -0.09230913, 1, 0.8941177, 0, 1,
-1.105308, 1.650208, -1.957919, 1, 0.8980392, 0, 1,
-1.100348, 1.932327, -0.3839373, 1, 0.9058824, 0, 1,
-1.093726, 0.08619911, -1.621712, 1, 0.9137255, 0, 1,
-1.08896, -1.837778, -4.221034, 1, 0.9176471, 0, 1,
-1.08846, 0.46088, -1.214395, 1, 0.9254902, 0, 1,
-1.08563, 1.002929, -0.002274529, 1, 0.9294118, 0, 1,
-1.084902, 0.08552933, -1.227009, 1, 0.9372549, 0, 1,
-1.081705, -0.9343221, -3.366196, 1, 0.9411765, 0, 1,
-1.080713, -1.028412, -2.042264, 1, 0.9490196, 0, 1,
-1.072231, 2.194147, -0.3773789, 1, 0.9529412, 0, 1,
-1.066579, -0.04187985, -1.932365, 1, 0.9607843, 0, 1,
-1.063041, 2.108981, -1.266321, 1, 0.9647059, 0, 1,
-1.061474, 0.5861874, -1.032801, 1, 0.972549, 0, 1,
-1.051496, 0.4377517, -1.213574, 1, 0.9764706, 0, 1,
-1.048865, 2.334183, -0.8085952, 1, 0.9843137, 0, 1,
-1.048618, 0.8651929, -1.310519, 1, 0.9882353, 0, 1,
-1.046457, 2.422118, -0.07757616, 1, 0.9960784, 0, 1,
-1.045327, -1.976435, -3.369599, 0.9960784, 1, 0, 1,
-1.042495, -0.4702336, -1.752443, 0.9921569, 1, 0, 1,
-1.036492, 1.09895, -2.231816, 0.9843137, 1, 0, 1,
-1.02674, -0.1165256, -0.434207, 0.9803922, 1, 0, 1,
-1.025747, -0.5485554, -4.321807, 0.972549, 1, 0, 1,
-1.025622, -0.8042857, -2.432823, 0.9686275, 1, 0, 1,
-1.024452, 0.9702997, -1.148688, 0.9607843, 1, 0, 1,
-1.024207, 0.5229661, -3.243706, 0.9568627, 1, 0, 1,
-1.017024, 1.415887, -1.631746, 0.9490196, 1, 0, 1,
-1.011061, 0.2201661, 0.03959979, 0.945098, 1, 0, 1,
-1.008471, 0.9315964, -2.235548, 0.9372549, 1, 0, 1,
-1.008282, -1.004423, -2.58637, 0.9333333, 1, 0, 1,
-1.002985, -0.7752348, -1.799794, 0.9254902, 1, 0, 1,
-0.9944814, -0.1844018, -2.79017, 0.9215686, 1, 0, 1,
-0.9927825, -0.2505349, -2.575092, 0.9137255, 1, 0, 1,
-0.9832383, -0.5391834, -2.531348, 0.9098039, 1, 0, 1,
-0.9816213, -1.144484, 0.2833431, 0.9019608, 1, 0, 1,
-0.9803638, -0.1159731, -1.07246, 0.8941177, 1, 0, 1,
-0.9732132, 0.3726862, -1.378592, 0.8901961, 1, 0, 1,
-0.9590993, 0.665125, -0.4754314, 0.8823529, 1, 0, 1,
-0.9584784, 0.5471224, -0.2489335, 0.8784314, 1, 0, 1,
-0.947706, -0.526352, -1.369541, 0.8705882, 1, 0, 1,
-0.9433368, 1.757757, -0.6095819, 0.8666667, 1, 0, 1,
-0.939463, -0.7191357, -2.175619, 0.8588235, 1, 0, 1,
-0.9384924, 0.6000733, -0.9387816, 0.854902, 1, 0, 1,
-0.9335887, 0.7158492, -1.693228, 0.8470588, 1, 0, 1,
-0.9318641, 0.1168981, -2.255846, 0.8431373, 1, 0, 1,
-0.9313477, -2.192416, -2.952307, 0.8352941, 1, 0, 1,
-0.930581, -1.565165, -0.9128956, 0.8313726, 1, 0, 1,
-0.9305549, 1.252434, -2.04119, 0.8235294, 1, 0, 1,
-0.9285886, -2.01126, -3.24171, 0.8196079, 1, 0, 1,
-0.925974, -0.6586963, -3.132287, 0.8117647, 1, 0, 1,
-0.9180228, -0.3556623, -2.296679, 0.8078431, 1, 0, 1,
-0.9143845, 0.01120725, -0.2488655, 0.8, 1, 0, 1,
-0.9129825, 0.5856736, -1.389127, 0.7921569, 1, 0, 1,
-0.9113036, -0.2390014, -2.864685, 0.7882353, 1, 0, 1,
-0.9100763, -1.054987, -3.648752, 0.7803922, 1, 0, 1,
-0.9024911, -0.5544827, -2.352161, 0.7764706, 1, 0, 1,
-0.9020432, 0.8967477, -2.734622, 0.7686275, 1, 0, 1,
-0.9010882, -1.850852, -3.249048, 0.7647059, 1, 0, 1,
-0.8899691, 1.030779, 0.09444948, 0.7568628, 1, 0, 1,
-0.8886606, 0.8681073, -1.580043, 0.7529412, 1, 0, 1,
-0.8859623, -1.327466, -2.649947, 0.7450981, 1, 0, 1,
-0.8847498, -0.1683922, -2.902672, 0.7411765, 1, 0, 1,
-0.8845806, 0.3643905, -2.200958, 0.7333333, 1, 0, 1,
-0.8842106, 0.857093, -2.160761, 0.7294118, 1, 0, 1,
-0.8804198, -0.1096388, -2.841486, 0.7215686, 1, 0, 1,
-0.8774007, 1.134189, 0.5864665, 0.7176471, 1, 0, 1,
-0.8749543, 0.7139976, -0.8807352, 0.7098039, 1, 0, 1,
-0.8703839, -1.491682, -3.456491, 0.7058824, 1, 0, 1,
-0.8685198, 0.9379774, -1.145453, 0.6980392, 1, 0, 1,
-0.8673201, 0.003634469, -2.058882, 0.6901961, 1, 0, 1,
-0.8665835, -0.2727935, -3.102773, 0.6862745, 1, 0, 1,
-0.8632681, 0.994668, -0.5280821, 0.6784314, 1, 0, 1,
-0.8630031, 1.780082, 0.7349608, 0.6745098, 1, 0, 1,
-0.8619571, 0.9141265, 1.452137, 0.6666667, 1, 0, 1,
-0.8608962, 0.2196704, -0.3438697, 0.6627451, 1, 0, 1,
-0.8582849, 1.294872, 0.6894595, 0.654902, 1, 0, 1,
-0.8541275, 0.900053, -1.999999, 0.6509804, 1, 0, 1,
-0.8434265, -2.494525, -3.300479, 0.6431373, 1, 0, 1,
-0.8405928, -0.2851318, -0.6239832, 0.6392157, 1, 0, 1,
-0.8378097, 0.03085896, -1.472897, 0.6313726, 1, 0, 1,
-0.8325631, 1.63359, -0.554961, 0.627451, 1, 0, 1,
-0.8310738, -1.42572, -1.864614, 0.6196079, 1, 0, 1,
-0.8283527, 1.224136, -1.000702, 0.6156863, 1, 0, 1,
-0.8208836, 0.7791278, -0.5474049, 0.6078432, 1, 0, 1,
-0.8201111, 0.6669171, -1.843712, 0.6039216, 1, 0, 1,
-0.8170386, -0.3166645, -1.210933, 0.5960785, 1, 0, 1,
-0.8169895, 0.374006, -0.9459431, 0.5882353, 1, 0, 1,
-0.8116452, -0.4062187, -1.560025, 0.5843138, 1, 0, 1,
-0.8015583, 0.5639279, -1.026425, 0.5764706, 1, 0, 1,
-0.8001455, 0.4445407, -3.85288, 0.572549, 1, 0, 1,
-0.7942535, -1.066605, -2.439876, 0.5647059, 1, 0, 1,
-0.7909985, -0.8342236, -4.451539, 0.5607843, 1, 0, 1,
-0.7889572, -2.050746, -4.002478, 0.5529412, 1, 0, 1,
-0.7868984, -0.37812, -2.623223, 0.5490196, 1, 0, 1,
-0.778977, 1.53148, -1.234329, 0.5411765, 1, 0, 1,
-0.7757253, 0.4775724, -0.3212594, 0.5372549, 1, 0, 1,
-0.76977, 1.693763, -0.5760371, 0.5294118, 1, 0, 1,
-0.7691647, -0.4784776, -1.656289, 0.5254902, 1, 0, 1,
-0.7654723, -0.3222453, -3.156722, 0.5176471, 1, 0, 1,
-0.7649598, 2.309213, 1.139648, 0.5137255, 1, 0, 1,
-0.7645595, -0.5414191, -3.62294, 0.5058824, 1, 0, 1,
-0.7644912, -0.3547025, -2.101581, 0.5019608, 1, 0, 1,
-0.7612225, -0.2022564, -3.49447, 0.4941176, 1, 0, 1,
-0.7601288, 0.1912539, -0.08851197, 0.4862745, 1, 0, 1,
-0.7542117, 1.223489, -1.609838, 0.4823529, 1, 0, 1,
-0.7501907, -0.1768351, -2.986124, 0.4745098, 1, 0, 1,
-0.7437027, 1.607163, 0.3082873, 0.4705882, 1, 0, 1,
-0.7387156, 0.7343821, 0.6281973, 0.4627451, 1, 0, 1,
-0.73426, 1.033962, -0.4833894, 0.4588235, 1, 0, 1,
-0.7336464, 0.09816373, -2.533458, 0.4509804, 1, 0, 1,
-0.7303829, -0.9837369, -3.093458, 0.4470588, 1, 0, 1,
-0.7302625, -0.6552562, -1.925723, 0.4392157, 1, 0, 1,
-0.7245983, -1.556536, -3.38121, 0.4352941, 1, 0, 1,
-0.7241659, -1.03544, -3.769159, 0.427451, 1, 0, 1,
-0.7143977, -0.21175, -1.089626, 0.4235294, 1, 0, 1,
-0.7120229, -0.4044125, -1.04161, 0.4156863, 1, 0, 1,
-0.7115671, 0.7064022, -2.423259, 0.4117647, 1, 0, 1,
-0.7113301, 0.1393442, -3.037984, 0.4039216, 1, 0, 1,
-0.7034928, -1.040308, -1.201658, 0.3960784, 1, 0, 1,
-0.7032206, -0.4953547, -4.111495, 0.3921569, 1, 0, 1,
-0.7008641, -1.126907, -3.08489, 0.3843137, 1, 0, 1,
-0.6909372, 0.9301841, -2.064161, 0.3803922, 1, 0, 1,
-0.6906553, -1.697477, -0.381494, 0.372549, 1, 0, 1,
-0.6891834, -0.9101559, -1.025483, 0.3686275, 1, 0, 1,
-0.6834088, 0.2193791, -1.049058, 0.3607843, 1, 0, 1,
-0.6757116, -1.964409, -2.427784, 0.3568628, 1, 0, 1,
-0.6727291, 0.7768781, -1.431441, 0.3490196, 1, 0, 1,
-0.6707653, -0.2381656, -1.695485, 0.345098, 1, 0, 1,
-0.6704394, -1.552489, -1.603788, 0.3372549, 1, 0, 1,
-0.6672672, -0.9461983, -0.7937337, 0.3333333, 1, 0, 1,
-0.667182, 1.331299, -0.2174211, 0.3254902, 1, 0, 1,
-0.6626735, 0.5190553, -0.8453164, 0.3215686, 1, 0, 1,
-0.6584045, 0.3611499, 0.4084436, 0.3137255, 1, 0, 1,
-0.6556504, 0.02052027, -1.385252, 0.3098039, 1, 0, 1,
-0.6491396, -0.3018276, -0.2709567, 0.3019608, 1, 0, 1,
-0.6483805, 0.2808931, -0.2319511, 0.2941177, 1, 0, 1,
-0.6460456, -1.419174, -3.00522, 0.2901961, 1, 0, 1,
-0.6421322, 1.1503, -0.5022647, 0.282353, 1, 0, 1,
-0.633502, -0.329761, -2.342072, 0.2784314, 1, 0, 1,
-0.6295589, -1.712636, -1.990385, 0.2705882, 1, 0, 1,
-0.6277606, -0.474028, -3.097701, 0.2666667, 1, 0, 1,
-0.6277503, -2.215568, -2.841107, 0.2588235, 1, 0, 1,
-0.6186568, 0.1303752, 0.4286404, 0.254902, 1, 0, 1,
-0.618214, 0.05897219, -1.68432, 0.2470588, 1, 0, 1,
-0.616096, 2.038191, -0.9612106, 0.2431373, 1, 0, 1,
-0.6129351, 1.030278, -0.5505481, 0.2352941, 1, 0, 1,
-0.607555, 0.8255128, 0.9030775, 0.2313726, 1, 0, 1,
-0.6036404, -0.8119853, -1.520409, 0.2235294, 1, 0, 1,
-0.599728, 0.7969229, -0.8103971, 0.2196078, 1, 0, 1,
-0.5993319, 0.2134702, 0.3410055, 0.2117647, 1, 0, 1,
-0.5991611, -2.070148, -2.89242, 0.2078431, 1, 0, 1,
-0.5991581, -0.3233901, -1.99245, 0.2, 1, 0, 1,
-0.5950636, -0.8236525, -2.966703, 0.1921569, 1, 0, 1,
-0.5950307, -0.2174242, -2.032659, 0.1882353, 1, 0, 1,
-0.5915856, 0.6200714, -1.655472, 0.1803922, 1, 0, 1,
-0.5910987, 2.011844, 0.3300501, 0.1764706, 1, 0, 1,
-0.5904329, -0.4948688, -2.471406, 0.1686275, 1, 0, 1,
-0.5819747, 1.882105, -0.05980643, 0.1647059, 1, 0, 1,
-0.5769416, -0.8475392, -2.282595, 0.1568628, 1, 0, 1,
-0.5754616, -1.786918, -3.354128, 0.1529412, 1, 0, 1,
-0.5721146, -0.8645959, -2.883689, 0.145098, 1, 0, 1,
-0.5702666, 0.8544472, -1.080789, 0.1411765, 1, 0, 1,
-0.5653521, 0.5947572, -2.298499, 0.1333333, 1, 0, 1,
-0.5493951, -1.27126, -2.151527, 0.1294118, 1, 0, 1,
-0.5427601, -0.6801031, -3.719089, 0.1215686, 1, 0, 1,
-0.5424361, -0.4564529, -0.8080906, 0.1176471, 1, 0, 1,
-0.5382356, 0.952662, 0.2783462, 0.1098039, 1, 0, 1,
-0.5296869, 0.9566913, 0.2166834, 0.1058824, 1, 0, 1,
-0.5285231, 0.4187624, -1.439245, 0.09803922, 1, 0, 1,
-0.5109476, 0.3316425, -0.1068132, 0.09019608, 1, 0, 1,
-0.4981045, -0.5687962, -1.565372, 0.08627451, 1, 0, 1,
-0.4937548, -0.2562338, -1.727556, 0.07843138, 1, 0, 1,
-0.4916804, -0.4392865, -1.704201, 0.07450981, 1, 0, 1,
-0.4913045, 0.2470903, -0.875349, 0.06666667, 1, 0, 1,
-0.4819049, -0.1905929, -2.337914, 0.0627451, 1, 0, 1,
-0.4732451, 1.770386, 1.195121, 0.05490196, 1, 0, 1,
-0.4720709, -0.2423716, -1.48902, 0.05098039, 1, 0, 1,
-0.4696769, 0.3473657, -0.01413741, 0.04313726, 1, 0, 1,
-0.4674207, -1.123179, -3.145816, 0.03921569, 1, 0, 1,
-0.4657914, 0.8847438, -0.3653734, 0.03137255, 1, 0, 1,
-0.4650844, 2.299495, -0.521973, 0.02745098, 1, 0, 1,
-0.4638279, 0.2525124, -2.909948, 0.01960784, 1, 0, 1,
-0.463327, -0.9908428, -4.328532, 0.01568628, 1, 0, 1,
-0.4625214, 0.1790364, -1.809044, 0.007843138, 1, 0, 1,
-0.461253, 0.4715718, 1.066329, 0.003921569, 1, 0, 1,
-0.4602755, -0.9560583, -5.272671, 0, 1, 0.003921569, 1,
-0.4578832, 1.870505, -0.2659316, 0, 1, 0.01176471, 1,
-0.4573412, -1.608793, -2.721366, 0, 1, 0.01568628, 1,
-0.4565105, -2.153118, -1.315385, 0, 1, 0.02352941, 1,
-0.4535139, -2.13544, -2.725219, 0, 1, 0.02745098, 1,
-0.4503246, -0.09452601, -1.328437, 0, 1, 0.03529412, 1,
-0.4421299, 1.274344, 0.5318156, 0, 1, 0.03921569, 1,
-0.433448, -1.03013, -1.50229, 0, 1, 0.04705882, 1,
-0.4312921, -0.2119872, -2.796985, 0, 1, 0.05098039, 1,
-0.4312157, -0.3421604, -3.149708, 0, 1, 0.05882353, 1,
-0.4303281, -0.6624354, -2.455422, 0, 1, 0.0627451, 1,
-0.426455, 0.3894307, -0.6971691, 0, 1, 0.07058824, 1,
-0.4245403, 0.08712494, -1.262672, 0, 1, 0.07450981, 1,
-0.4233868, 0.3658581, 0.02910946, 0, 1, 0.08235294, 1,
-0.4226675, 1.001302, -0.9724703, 0, 1, 0.08627451, 1,
-0.4225806, 1.271881, 0.6942793, 0, 1, 0.09411765, 1,
-0.4217635, 2.031086, -0.4452787, 0, 1, 0.1019608, 1,
-0.4181347, -0.3046068, -3.956024, 0, 1, 0.1058824, 1,
-0.409468, -1.652916, -3.582716, 0, 1, 0.1137255, 1,
-0.4085822, -2.227089, -4.370026, 0, 1, 0.1176471, 1,
-0.404409, -0.385025, -2.688306, 0, 1, 0.1254902, 1,
-0.3988628, -0.9101611, -1.684086, 0, 1, 0.1294118, 1,
-0.3980827, -1.044227, -1.44277, 0, 1, 0.1372549, 1,
-0.3917435, -0.02375117, -1.346309, 0, 1, 0.1411765, 1,
-0.3897518, 1.098263, 0.3642223, 0, 1, 0.1490196, 1,
-0.3883787, 0.06612516, 0.2629873, 0, 1, 0.1529412, 1,
-0.3870845, -1.238152, -2.619246, 0, 1, 0.1607843, 1,
-0.3844322, 0.5812325, -0.3910689, 0, 1, 0.1647059, 1,
-0.3774283, -0.3938959, -2.968594, 0, 1, 0.172549, 1,
-0.3672245, -0.00254061, -1.256715, 0, 1, 0.1764706, 1,
-0.3642024, -0.6231765, -2.394217, 0, 1, 0.1843137, 1,
-0.3635382, 1.590083, -1.127903, 0, 1, 0.1882353, 1,
-0.3632261, -1.559256, -2.097956, 0, 1, 0.1960784, 1,
-0.3625928, 0.6166624, -0.154575, 0, 1, 0.2039216, 1,
-0.3581264, -1.13994, -3.689672, 0, 1, 0.2078431, 1,
-0.3554391, -0.5840739, -2.0962, 0, 1, 0.2156863, 1,
-0.3542896, -0.4515628, -2.650383, 0, 1, 0.2196078, 1,
-0.3515539, 1.134683, 0.1996436, 0, 1, 0.227451, 1,
-0.342785, -0.02940567, -1.059516, 0, 1, 0.2313726, 1,
-0.3385898, -1.275988, -3.503427, 0, 1, 0.2392157, 1,
-0.3369172, 0.4936557, 0.6251299, 0, 1, 0.2431373, 1,
-0.3367944, 0.2245826, -1.080867, 0, 1, 0.2509804, 1,
-0.3320022, 0.950373, -1.646306, 0, 1, 0.254902, 1,
-0.3292817, -0.7388489, -1.625588, 0, 1, 0.2627451, 1,
-0.327848, 0.7777182, -0.702107, 0, 1, 0.2666667, 1,
-0.3158096, -0.3298639, -1.647696, 0, 1, 0.2745098, 1,
-0.3120763, 0.7609891, -0.4326669, 0, 1, 0.2784314, 1,
-0.3105292, -2.607737, -2.759051, 0, 1, 0.2862745, 1,
-0.3103812, -1.062151, -3.000368, 0, 1, 0.2901961, 1,
-0.3098041, 1.251727, -0.6259153, 0, 1, 0.2980392, 1,
-0.3072906, -1.061825, -4.247018, 0, 1, 0.3058824, 1,
-0.3050306, 1.44242, 0.3817851, 0, 1, 0.3098039, 1,
-0.3037216, 0.820099, 0.3348643, 0, 1, 0.3176471, 1,
-0.3035441, -0.6816959, -4.48688, 0, 1, 0.3215686, 1,
-0.296419, 0.9026913, 0.3570233, 0, 1, 0.3294118, 1,
-0.2960717, 0.9023384, 0.7564172, 0, 1, 0.3333333, 1,
-0.2954763, 0.4786385, -0.4293992, 0, 1, 0.3411765, 1,
-0.2944236, 1.590515, 0.6345173, 0, 1, 0.345098, 1,
-0.2921433, 1.031262, -0.492338, 0, 1, 0.3529412, 1,
-0.2896906, -0.2306386, -2.501334, 0, 1, 0.3568628, 1,
-0.2895955, -1.534866, -2.761085, 0, 1, 0.3647059, 1,
-0.2876657, 0.9898767, -0.06460175, 0, 1, 0.3686275, 1,
-0.2865016, 0.1731988, 0.008526415, 0, 1, 0.3764706, 1,
-0.2864297, 0.9657338, -0.1071348, 0, 1, 0.3803922, 1,
-0.2846205, 0.1512369, -2.060229, 0, 1, 0.3882353, 1,
-0.2812981, 0.1453149, -2.422065, 0, 1, 0.3921569, 1,
-0.2805125, -0.8056553, -1.939197, 0, 1, 0.4, 1,
-0.2793678, 0.3444959, -0.5270662, 0, 1, 0.4078431, 1,
-0.2763466, -0.770372, -2.619132, 0, 1, 0.4117647, 1,
-0.2758932, 0.7551757, -0.7357351, 0, 1, 0.4196078, 1,
-0.2744825, 0.4377617, -2.62745, 0, 1, 0.4235294, 1,
-0.2719207, 0.9483415, -0.01875942, 0, 1, 0.4313726, 1,
-0.2701039, -0.2658996, -1.005275, 0, 1, 0.4352941, 1,
-0.2690923, -0.01704191, -2.350439, 0, 1, 0.4431373, 1,
-0.2675354, 0.1885612, -2.704114, 0, 1, 0.4470588, 1,
-0.2672923, -0.7081657, -3.513079, 0, 1, 0.454902, 1,
-0.2669619, -0.9276273, -3.766014, 0, 1, 0.4588235, 1,
-0.2566204, 0.2604944, 0.5828413, 0, 1, 0.4666667, 1,
-0.253096, 0.5399761, 0.3881578, 0, 1, 0.4705882, 1,
-0.2409838, 0.4988889, -1.211581, 0, 1, 0.4784314, 1,
-0.2344398, 0.913716, -0.4998046, 0, 1, 0.4823529, 1,
-0.2338295, -0.4118136, -2.943825, 0, 1, 0.4901961, 1,
-0.2311799, 0.4016641, -0.2997065, 0, 1, 0.4941176, 1,
-0.2283247, 0.2736261, 0.1585903, 0, 1, 0.5019608, 1,
-0.2265396, -0.0894507, -3.706483, 0, 1, 0.509804, 1,
-0.2157406, -0.07714383, -1.951532, 0, 1, 0.5137255, 1,
-0.2148603, 0.6216368, -1.240887, 0, 1, 0.5215687, 1,
-0.2140636, -0.0340839, -3.902516, 0, 1, 0.5254902, 1,
-0.2089675, 0.4851998, 1.462301, 0, 1, 0.5333334, 1,
-0.2080535, -0.02926471, -2.604828, 0, 1, 0.5372549, 1,
-0.2061277, 0.3530878, -0.9760134, 0, 1, 0.5450981, 1,
-0.2034855, 0.2516843, 0.1897974, 0, 1, 0.5490196, 1,
-0.2024568, 0.9528605, 0.1807478, 0, 1, 0.5568628, 1,
-0.1986377, 1.875332, -0.04256519, 0, 1, 0.5607843, 1,
-0.1986013, 0.3321866, -0.9695356, 0, 1, 0.5686275, 1,
-0.1928432, -1.292148, -2.267166, 0, 1, 0.572549, 1,
-0.1928024, 0.1715522, -0.9072737, 0, 1, 0.5803922, 1,
-0.1914903, 1.332126, -0.07089223, 0, 1, 0.5843138, 1,
-0.1909612, 0.411692, -1.343282, 0, 1, 0.5921569, 1,
-0.1900442, -2.081779, -1.595774, 0, 1, 0.5960785, 1,
-0.1892947, -0.3885323, -2.762342, 0, 1, 0.6039216, 1,
-0.1858497, 2.573475, 1.054316, 0, 1, 0.6117647, 1,
-0.1834549, 1.270443, 0.7308372, 0, 1, 0.6156863, 1,
-0.1823941, -0.6554624, -2.842604, 0, 1, 0.6235294, 1,
-0.181912, -0.8240474, -2.656642, 0, 1, 0.627451, 1,
-0.1806562, 0.3779442, 0.7359502, 0, 1, 0.6352941, 1,
-0.179848, 0.143886, 0.3183572, 0, 1, 0.6392157, 1,
-0.1745562, 1.486347, 0.8889334, 0, 1, 0.6470588, 1,
-0.1716691, -0.03581236, -2.72658, 0, 1, 0.6509804, 1,
-0.1659457, 0.03181542, -2.718978, 0, 1, 0.6588235, 1,
-0.1641625, -0.5520843, -4.743962, 0, 1, 0.6627451, 1,
-0.1633697, 0.3627377, -0.08399737, 0, 1, 0.6705883, 1,
-0.1620947, -0.4693011, -3.744665, 0, 1, 0.6745098, 1,
-0.1614507, 0.499362, -0.4843589, 0, 1, 0.682353, 1,
-0.1590658, 0.4035857, -0.8955825, 0, 1, 0.6862745, 1,
-0.1579363, 0.3990979, -0.7277284, 0, 1, 0.6941177, 1,
-0.1563106, 0.1430328, -0.3840002, 0, 1, 0.7019608, 1,
-0.1560158, -0.1836406, -3.831412, 0, 1, 0.7058824, 1,
-0.1558779, 0.7525163, -1.640962, 0, 1, 0.7137255, 1,
-0.1539457, 1.291353, -0.6297394, 0, 1, 0.7176471, 1,
-0.1515919, -0.0008078854, -2.033293, 0, 1, 0.7254902, 1,
-0.149408, -0.4335305, -2.550546, 0, 1, 0.7294118, 1,
-0.1479912, -0.5636958, -1.817495, 0, 1, 0.7372549, 1,
-0.1471233, 1.478982, -0.8379884, 0, 1, 0.7411765, 1,
-0.1443839, 0.4571256, -0.7275811, 0, 1, 0.7490196, 1,
-0.1371356, 0.4310958, -1.165871, 0, 1, 0.7529412, 1,
-0.1366612, -0.8627393, -3.995019, 0, 1, 0.7607843, 1,
-0.133299, 0.03775699, -0.4857615, 0, 1, 0.7647059, 1,
-0.1313451, 0.1941772, -1.715138, 0, 1, 0.772549, 1,
-0.1285468, 1.555644, 1.244097, 0, 1, 0.7764706, 1,
-0.1227205, -0.7570598, -3.797671, 0, 1, 0.7843137, 1,
-0.1219922, 2.218411, 0.009125635, 0, 1, 0.7882353, 1,
-0.1219666, -1.352413, -1.927906, 0, 1, 0.7960784, 1,
-0.1198235, -0.434314, -3.123206, 0, 1, 0.8039216, 1,
-0.1152651, 0.7618966, -0.2214191, 0, 1, 0.8078431, 1,
-0.1092175, -1.463911, -3.79305, 0, 1, 0.8156863, 1,
-0.1091285, 1.170927, -0.2024914, 0, 1, 0.8196079, 1,
-0.1079615, 1.456634, -1.4, 0, 1, 0.827451, 1,
-0.1057459, -0.4078877, -3.645198, 0, 1, 0.8313726, 1,
-0.105238, 0.2333695, -0.3021688, 0, 1, 0.8392157, 1,
-0.1045946, 0.3173011, -0.1890391, 0, 1, 0.8431373, 1,
-0.1031605, -0.08987365, -4.071484, 0, 1, 0.8509804, 1,
-0.1014731, 0.4064368, -1.502079, 0, 1, 0.854902, 1,
-0.09944351, -1.029927, -4.173085, 0, 1, 0.8627451, 1,
-0.09156507, -0.6752154, -3.341965, 0, 1, 0.8666667, 1,
-0.09156419, -0.9039189, -2.345495, 0, 1, 0.8745098, 1,
-0.08931512, 0.1478781, -0.1220952, 0, 1, 0.8784314, 1,
-0.08888203, 1.962274, -0.3259232, 0, 1, 0.8862745, 1,
-0.08786967, 0.001385956, 0.3660591, 0, 1, 0.8901961, 1,
-0.08245781, 0.01979254, -1.280399, 0, 1, 0.8980392, 1,
-0.07891175, 1.645396, -0.06152287, 0, 1, 0.9058824, 1,
-0.07841276, 1.081835, 0.094728, 0, 1, 0.9098039, 1,
-0.07552247, -0.07333031, -2.320322, 0, 1, 0.9176471, 1,
-0.07476263, -1.589884, -2.219675, 0, 1, 0.9215686, 1,
-0.06928617, 2.518933, -1.18158, 0, 1, 0.9294118, 1,
-0.06861547, 0.3057173, 0.5892068, 0, 1, 0.9333333, 1,
-0.06550533, -0.6391531, -4.816531, 0, 1, 0.9411765, 1,
-0.06535536, 0.1799881, -0.5179628, 0, 1, 0.945098, 1,
-0.05990895, 0.2556668, 0.3029096, 0, 1, 0.9529412, 1,
-0.05869385, -0.2300299, -2.906894, 0, 1, 0.9568627, 1,
-0.05812183, 1.147222, -0.2845083, 0, 1, 0.9647059, 1,
-0.05802566, -1.143503, -1.880351, 0, 1, 0.9686275, 1,
-0.05656463, -0.6563594, -2.249863, 0, 1, 0.9764706, 1,
-0.04970904, 0.4837186, -1.176189, 0, 1, 0.9803922, 1,
-0.03458009, -0.963925, -2.238025, 0, 1, 0.9882353, 1,
-0.03406409, -0.6411089, -2.071923, 0, 1, 0.9921569, 1,
-0.03376421, -0.128648, -2.989708, 0, 1, 1, 1,
-0.03256191, -0.3104488, -3.668328, 0, 0.9921569, 1, 1,
-0.02912721, -0.9192003, -3.930627, 0, 0.9882353, 1, 1,
-0.02899083, 1.348098, 0.2785769, 0, 0.9803922, 1, 1,
-0.02764718, 0.8867107, -0.7696324, 0, 0.9764706, 1, 1,
-0.02607415, 0.8898664, 0.1487749, 0, 0.9686275, 1, 1,
-0.02530273, -0.9249812, -1.449179, 0, 0.9647059, 1, 1,
-0.02199489, 1.40517, 0.9622545, 0, 0.9568627, 1, 1,
-0.02145656, 1.636825, -2.158679, 0, 0.9529412, 1, 1,
-0.01864212, 2.141544, -1.67712, 0, 0.945098, 1, 1,
-0.01470511, -0.06911126, -3.916694, 0, 0.9411765, 1, 1,
-0.01174399, 0.9312433, 0.917744, 0, 0.9333333, 1, 1,
-0.008884676, -0.5167369, -3.401651, 0, 0.9294118, 1, 1,
-0.007396746, 1.804698, 0.8531564, 0, 0.9215686, 1, 1,
-0.004685637, -0.4118562, -2.764647, 0, 0.9176471, 1, 1,
-0.004198491, 1.859442, -2.008529, 0, 0.9098039, 1, 1,
-0.003952576, -0.2770508, -2.989542, 0, 0.9058824, 1, 1,
-0.002607282, -0.9572816, -3.999528, 0, 0.8980392, 1, 1,
-0.002175245, -0.4812398, -2.766317, 0, 0.8901961, 1, 1,
-0.001583248, -2.383306, -4.853565, 0, 0.8862745, 1, 1,
0.008084341, 0.9493977, 0.5647981, 0, 0.8784314, 1, 1,
0.0158588, 0.05001557, 0.4209937, 0, 0.8745098, 1, 1,
0.01916897, -2.397544, 3.165996, 0, 0.8666667, 1, 1,
0.0201479, -0.3884954, 1.999628, 0, 0.8627451, 1, 1,
0.02143744, 0.7892689, 1.45414, 0, 0.854902, 1, 1,
0.02409225, 0.4116659, -1.198772, 0, 0.8509804, 1, 1,
0.0242758, 0.453642, -1.398701, 0, 0.8431373, 1, 1,
0.02585427, -0.445103, 3.392116, 0, 0.8392157, 1, 1,
0.02661253, -0.497997, 2.70908, 0, 0.8313726, 1, 1,
0.02827251, 0.06405215, -0.1442104, 0, 0.827451, 1, 1,
0.02901985, -0.9784715, 3.86044, 0, 0.8196079, 1, 1,
0.02963533, -0.9836675, 1.837862, 0, 0.8156863, 1, 1,
0.03022155, -2.027068, 3.225328, 0, 0.8078431, 1, 1,
0.03196322, 0.2801318, 0.6465707, 0, 0.8039216, 1, 1,
0.034181, -0.08974644, 2.030598, 0, 0.7960784, 1, 1,
0.03548297, -0.7552092, 3.667287, 0, 0.7882353, 1, 1,
0.03601148, -0.1559678, 1.627383, 0, 0.7843137, 1, 1,
0.03635637, 0.9053302, -0.309287, 0, 0.7764706, 1, 1,
0.0364452, 0.5304607, 1.361631, 0, 0.772549, 1, 1,
0.03650389, 0.397164, 0.9040961, 0, 0.7647059, 1, 1,
0.03742009, -0.04866929, 3.707578, 0, 0.7607843, 1, 1,
0.03990754, -0.9354266, 4.732564, 0, 0.7529412, 1, 1,
0.04166508, -1.794174, 1.375871, 0, 0.7490196, 1, 1,
0.04337384, 0.6874048, -1.063402, 0, 0.7411765, 1, 1,
0.04435274, 0.421481, 2.734154, 0, 0.7372549, 1, 1,
0.04732213, 1.087786, -1.314397, 0, 0.7294118, 1, 1,
0.05234592, 0.2998072, -2.002236, 0, 0.7254902, 1, 1,
0.05854572, -1.1358, 2.813979, 0, 0.7176471, 1, 1,
0.05960063, 1.589542, 0.7820619, 0, 0.7137255, 1, 1,
0.06259767, 2.236248, 0.6298388, 0, 0.7058824, 1, 1,
0.06891514, -1.040431, 3.747319, 0, 0.6980392, 1, 1,
0.06981602, 0.3195405, -0.1831443, 0, 0.6941177, 1, 1,
0.07177643, -1.326547, 4.199836, 0, 0.6862745, 1, 1,
0.07613367, -1.267539, 4.564587, 0, 0.682353, 1, 1,
0.07890975, 0.6507708, -0.9594769, 0, 0.6745098, 1, 1,
0.07933332, -1.042898, 2.57697, 0, 0.6705883, 1, 1,
0.0824371, 0.8324642, 0.5292393, 0, 0.6627451, 1, 1,
0.0858243, -0.2947644, 2.144424, 0, 0.6588235, 1, 1,
0.09017786, 0.8912101, -0.5753754, 0, 0.6509804, 1, 1,
0.09262438, 0.5228256, -1.04627, 0, 0.6470588, 1, 1,
0.09557319, -2.301428, 2.556576, 0, 0.6392157, 1, 1,
0.09568863, -0.88551, 1.319074, 0, 0.6352941, 1, 1,
0.0977476, 0.9433442, -0.4557981, 0, 0.627451, 1, 1,
0.1004052, 0.1844978, 0.6066886, 0, 0.6235294, 1, 1,
0.1021326, 3.181342, 2.0991, 0, 0.6156863, 1, 1,
0.102287, -0.2098936, 1.946243, 0, 0.6117647, 1, 1,
0.1027221, 0.991414, 0.2735671, 0, 0.6039216, 1, 1,
0.1065717, 0.9646645, -0.1073668, 0, 0.5960785, 1, 1,
0.1106697, 0.04121207, 0.7662553, 0, 0.5921569, 1, 1,
0.1117684, -0.07853696, 2.169405, 0, 0.5843138, 1, 1,
0.1151848, -1.4353, 2.417505, 0, 0.5803922, 1, 1,
0.1159109, -0.4969844, 3.316462, 0, 0.572549, 1, 1,
0.1187231, -1.617577, 3.192036, 0, 0.5686275, 1, 1,
0.1237053, 0.1754121, -0.2136291, 0, 0.5607843, 1, 1,
0.1256358, 0.151021, -0.5252901, 0, 0.5568628, 1, 1,
0.1324427, 1.069938, 1.635452, 0, 0.5490196, 1, 1,
0.1341816, -1.417274, 1.546282, 0, 0.5450981, 1, 1,
0.1342031, -1.389028, 3.92028, 0, 0.5372549, 1, 1,
0.1345256, -0.3790123, 2.595282, 0, 0.5333334, 1, 1,
0.1365893, 0.7559221, 0.5963181, 0, 0.5254902, 1, 1,
0.1371144, 0.428502, 0.04491924, 0, 0.5215687, 1, 1,
0.1384175, 0.390572, 0.03217318, 0, 0.5137255, 1, 1,
0.1386622, 2.304511, -1.720333, 0, 0.509804, 1, 1,
0.1393468, -0.893204, 2.92312, 0, 0.5019608, 1, 1,
0.1429325, -0.1900947, 2.360486, 0, 0.4941176, 1, 1,
0.151633, 0.4252231, 1.170819, 0, 0.4901961, 1, 1,
0.1596235, 0.5694176, -1.27231, 0, 0.4823529, 1, 1,
0.160689, -0.2518888, 3.563822, 0, 0.4784314, 1, 1,
0.1613637, -1.334945, 3.670566, 0, 0.4705882, 1, 1,
0.1633405, -1.004551, 5.80668, 0, 0.4666667, 1, 1,
0.1652071, -0.100064, 2.417936, 0, 0.4588235, 1, 1,
0.1663376, 1.277516, 0.4527067, 0, 0.454902, 1, 1,
0.1675244, -1.000284, 3.663977, 0, 0.4470588, 1, 1,
0.1678742, 1.538089, -0.1657329, 0, 0.4431373, 1, 1,
0.1732258, -0.4139456, 3.085951, 0, 0.4352941, 1, 1,
0.1736871, 1.492289, -0.96165, 0, 0.4313726, 1, 1,
0.1776816, -0.5165952, 2.244906, 0, 0.4235294, 1, 1,
0.1789414, 1.040969, 0.05268062, 0, 0.4196078, 1, 1,
0.1790862, -0.5933687, 2.389266, 0, 0.4117647, 1, 1,
0.1826077, -1.725698, 2.549059, 0, 0.4078431, 1, 1,
0.189257, -0.3411261, 1.743509, 0, 0.4, 1, 1,
0.1905294, -0.4721914, 3.035315, 0, 0.3921569, 1, 1,
0.191791, -1.036649, 3.389118, 0, 0.3882353, 1, 1,
0.1937284, 0.7758782, 1.677806, 0, 0.3803922, 1, 1,
0.1957516, -0.9701736, 4.139822, 0, 0.3764706, 1, 1,
0.20055, -1.253258, 1.737398, 0, 0.3686275, 1, 1,
0.203073, 0.3853801, 0.1461953, 0, 0.3647059, 1, 1,
0.2037548, -1.047636, 1.933731, 0, 0.3568628, 1, 1,
0.2072366, 0.4456229, 0.933631, 0, 0.3529412, 1, 1,
0.2089168, -0.1834804, 3.033046, 0, 0.345098, 1, 1,
0.2103462, 0.8545412, -0.2522582, 0, 0.3411765, 1, 1,
0.2104292, 0.2825035, -0.3841683, 0, 0.3333333, 1, 1,
0.2110486, -0.6494973, 4.10067, 0, 0.3294118, 1, 1,
0.2161884, 0.4903773, -1.345255, 0, 0.3215686, 1, 1,
0.217707, -0.3030173, 3.065669, 0, 0.3176471, 1, 1,
0.2181354, 0.1761723, 1.755813, 0, 0.3098039, 1, 1,
0.220217, -0.736543, 3.340526, 0, 0.3058824, 1, 1,
0.2249825, 0.7050148, -0.428362, 0, 0.2980392, 1, 1,
0.2268017, 1.573614, -0.3215407, 0, 0.2901961, 1, 1,
0.2281848, -0.4734236, 1.951991, 0, 0.2862745, 1, 1,
0.2401551, -1.23884, 3.005048, 0, 0.2784314, 1, 1,
0.2450787, 0.001975327, 0.2395189, 0, 0.2745098, 1, 1,
0.2479604, 0.6045768, 0.2681731, 0, 0.2666667, 1, 1,
0.2482784, -0.9738013, 1.905823, 0, 0.2627451, 1, 1,
0.2497823, 0.1654531, 0.1578711, 0, 0.254902, 1, 1,
0.2524862, -0.06560682, 0.09631106, 0, 0.2509804, 1, 1,
0.2546423, -0.9744354, 1.788299, 0, 0.2431373, 1, 1,
0.2617612, 0.7592583, 1.697921, 0, 0.2392157, 1, 1,
0.263737, -0.505417, 4.214479, 0, 0.2313726, 1, 1,
0.2645536, -0.1796969, 3.271726, 0, 0.227451, 1, 1,
0.2645593, 0.3203278, 0.680941, 0, 0.2196078, 1, 1,
0.2651792, -0.9918131, 2.779723, 0, 0.2156863, 1, 1,
0.2667252, 1.114671, -1.028518, 0, 0.2078431, 1, 1,
0.2668076, 0.07084966, 2.508168, 0, 0.2039216, 1, 1,
0.2769721, -0.8070698, 3.367348, 0, 0.1960784, 1, 1,
0.2777092, -0.8860524, 1.497667, 0, 0.1882353, 1, 1,
0.2785991, -0.7456576, 2.049387, 0, 0.1843137, 1, 1,
0.2830426, 2.065601, 0.7871586, 0, 0.1764706, 1, 1,
0.2860804, 0.08801562, 0.3899988, 0, 0.172549, 1, 1,
0.2861676, 0.7200521, 0.2240013, 0, 0.1647059, 1, 1,
0.2893979, 0.7124569, 1.383661, 0, 0.1607843, 1, 1,
0.2922608, -1.825012, 3.244393, 0, 0.1529412, 1, 1,
0.2927736, -1.191227, 3.908346, 0, 0.1490196, 1, 1,
0.2957713, 0.3057228, 2.09397, 0, 0.1411765, 1, 1,
0.3001861, 0.1706658, 1.869077, 0, 0.1372549, 1, 1,
0.3004355, 0.2340924, 0.5147629, 0, 0.1294118, 1, 1,
0.3005726, 0.8570356, -0.6983696, 0, 0.1254902, 1, 1,
0.3042459, 0.7700244, -0.1397625, 0, 0.1176471, 1, 1,
0.3061717, 1.913002, 0.6565912, 0, 0.1137255, 1, 1,
0.315484, 1.660177, -0.9689559, 0, 0.1058824, 1, 1,
0.3311513, -1.302298, 3.255727, 0, 0.09803922, 1, 1,
0.3317889, 0.9917999, -0.110602, 0, 0.09411765, 1, 1,
0.337446, -1.124827, 4.016793, 0, 0.08627451, 1, 1,
0.3386485, -0.6437246, 2.374759, 0, 0.08235294, 1, 1,
0.339026, -2.033643, 2.356993, 0, 0.07450981, 1, 1,
0.342147, -0.3188557, 3.017794, 0, 0.07058824, 1, 1,
0.3461519, -0.1240983, 0.9256694, 0, 0.0627451, 1, 1,
0.3496328, 0.5589995, 1.537609, 0, 0.05882353, 1, 1,
0.3500593, -1.315112, 1.240117, 0, 0.05098039, 1, 1,
0.353812, 2.834394, 0.8281243, 0, 0.04705882, 1, 1,
0.3571893, 0.9613942, 1.892953, 0, 0.03921569, 1, 1,
0.3573092, -0.7884295, 2.971911, 0, 0.03529412, 1, 1,
0.3621507, -2.111867, 2.83556, 0, 0.02745098, 1, 1,
0.3668861, -0.7195009, 4.268497, 0, 0.02352941, 1, 1,
0.3670901, 0.4059283, 1.001039, 0, 0.01568628, 1, 1,
0.3710296, 0.1529094, 1.624096, 0, 0.01176471, 1, 1,
0.3743926, 0.6080594, 2.021339, 0, 0.003921569, 1, 1,
0.376004, -1.590249, 3.421115, 0.003921569, 0, 1, 1,
0.3811959, -0.1297996, 0.3465142, 0.007843138, 0, 1, 1,
0.3816474, 2.191934, 2.129013, 0.01568628, 0, 1, 1,
0.3831024, -0.5803083, 2.04405, 0.01960784, 0, 1, 1,
0.3838908, -1.159839, 1.242297, 0.02745098, 0, 1, 1,
0.3904789, 0.08647792, 2.225534, 0.03137255, 0, 1, 1,
0.4018615, -0.1725686, 3.540075, 0.03921569, 0, 1, 1,
0.403971, 0.2482677, 0.07288427, 0.04313726, 0, 1, 1,
0.4055976, 0.9164036, 0.4178861, 0.05098039, 0, 1, 1,
0.4061339, 1.839966, 0.9205069, 0.05490196, 0, 1, 1,
0.4084358, 2.567121, -0.7462036, 0.0627451, 0, 1, 1,
0.4109412, 1.298954, 0.4471008, 0.06666667, 0, 1, 1,
0.4128427, -0.01484861, 1.015896, 0.07450981, 0, 1, 1,
0.4183377, 0.4792988, 1.812204, 0.07843138, 0, 1, 1,
0.4187166, 0.824841, 0.4628922, 0.08627451, 0, 1, 1,
0.4251863, 0.2926468, -0.08064584, 0.09019608, 0, 1, 1,
0.4263857, 1.178166, 0.04212051, 0.09803922, 0, 1, 1,
0.4305776, 0.6887828, 0.6232432, 0.1058824, 0, 1, 1,
0.4310913, -1.087563, 4.133316, 0.1098039, 0, 1, 1,
0.4354703, 1.192776, 1.845209, 0.1176471, 0, 1, 1,
0.4397624, -1.090204, 2.397688, 0.1215686, 0, 1, 1,
0.4499548, -0.7428949, 2.779241, 0.1294118, 0, 1, 1,
0.4540627, -1.941936, 2.484013, 0.1333333, 0, 1, 1,
0.4591078, -1.078743, 1.752246, 0.1411765, 0, 1, 1,
0.4625193, 1.406215, 0.5584984, 0.145098, 0, 1, 1,
0.46268, 1.247148, 0.909804, 0.1529412, 0, 1, 1,
0.4698051, -0.07235237, 0.9243428, 0.1568628, 0, 1, 1,
0.4705938, 0.9354795, 1.214505, 0.1647059, 0, 1, 1,
0.4756643, 0.2590022, 1.763065, 0.1686275, 0, 1, 1,
0.4762128, -0.1276751, 0.0005060676, 0.1764706, 0, 1, 1,
0.4794442, 1.486228, 0.5472647, 0.1803922, 0, 1, 1,
0.4852224, 0.5702815, 1.28505, 0.1882353, 0, 1, 1,
0.4857896, 0.8185238, 0.2763433, 0.1921569, 0, 1, 1,
0.4908204, -1.11513, 4.207971, 0.2, 0, 1, 1,
0.4922308, -0.9577172, 1.376642, 0.2078431, 0, 1, 1,
0.4946078, -1.935034, 2.538836, 0.2117647, 0, 1, 1,
0.5026765, 0.3652251, 2.704442, 0.2196078, 0, 1, 1,
0.5033668, -0.3582281, 2.815447, 0.2235294, 0, 1, 1,
0.5220894, -0.2079941, 2.383368, 0.2313726, 0, 1, 1,
0.5239658, -0.6461554, 2.07575, 0.2352941, 0, 1, 1,
0.5349163, 0.992714, 0.2420706, 0.2431373, 0, 1, 1,
0.5380962, -0.05590358, 3.345984, 0.2470588, 0, 1, 1,
0.5517265, -0.1394801, 4.186926, 0.254902, 0, 1, 1,
0.555989, 0.2671691, 1.100671, 0.2588235, 0, 1, 1,
0.5604007, -0.08475327, 3.034222, 0.2666667, 0, 1, 1,
0.5611921, 0.4726152, 1.209628, 0.2705882, 0, 1, 1,
0.5632067, 0.2764478, -0.2689469, 0.2784314, 0, 1, 1,
0.5658083, -2.007675, 3.118736, 0.282353, 0, 1, 1,
0.5668337, -0.09674232, 1.14414, 0.2901961, 0, 1, 1,
0.5696819, -0.4379551, 2.535271, 0.2941177, 0, 1, 1,
0.5697948, 1.56554, 1.691634, 0.3019608, 0, 1, 1,
0.5812815, -0.6872112, 3.655267, 0.3098039, 0, 1, 1,
0.5838819, -0.6596941, 3.49108, 0.3137255, 0, 1, 1,
0.5859859, -0.4629922, 2.206978, 0.3215686, 0, 1, 1,
0.5861306, -2.055085, 3.833548, 0.3254902, 0, 1, 1,
0.5863046, 0.5765847, 0.3394216, 0.3333333, 0, 1, 1,
0.5970529, -0.8383667, 4.753533, 0.3372549, 0, 1, 1,
0.6000825, 0.3644933, 1.350636, 0.345098, 0, 1, 1,
0.6042943, 0.5168242, 1.735797, 0.3490196, 0, 1, 1,
0.6083966, 0.9137993, 0.03019604, 0.3568628, 0, 1, 1,
0.6095757, 0.3570982, 0.6978859, 0.3607843, 0, 1, 1,
0.6128243, -0.4748692, 3.362684, 0.3686275, 0, 1, 1,
0.6160584, -1.563521, 3.316769, 0.372549, 0, 1, 1,
0.6172298, -0.3572788, 1.547626, 0.3803922, 0, 1, 1,
0.6172561, 0.8242073, -0.8276662, 0.3843137, 0, 1, 1,
0.62051, 2.943185, 0.1576566, 0.3921569, 0, 1, 1,
0.631595, -0.1809502, 0.7318827, 0.3960784, 0, 1, 1,
0.6321092, -0.9354348, 3.132271, 0.4039216, 0, 1, 1,
0.6339797, 0.2495001, 3.963443, 0.4117647, 0, 1, 1,
0.6382241, -1.817687, 1.695521, 0.4156863, 0, 1, 1,
0.6386722, 1.668016, 0.5925521, 0.4235294, 0, 1, 1,
0.6388123, -1.439268, 0.7879674, 0.427451, 0, 1, 1,
0.6498074, -1.022115, 1.236431, 0.4352941, 0, 1, 1,
0.6510879, 0.08931563, 1.63392, 0.4392157, 0, 1, 1,
0.6527507, -0.8294243, 4.395072, 0.4470588, 0, 1, 1,
0.6547079, -0.4091904, 1.509033, 0.4509804, 0, 1, 1,
0.654731, -0.7227895, 2.670295, 0.4588235, 0, 1, 1,
0.6598703, -0.4531941, 2.530393, 0.4627451, 0, 1, 1,
0.6622295, -1.771562, 1.141205, 0.4705882, 0, 1, 1,
0.6630898, -0.4371443, 2.192398, 0.4745098, 0, 1, 1,
0.6634644, 2.102378, 0.2761591, 0.4823529, 0, 1, 1,
0.6691598, -1.622066, 2.975829, 0.4862745, 0, 1, 1,
0.6716247, 1.93356, -0.1668095, 0.4941176, 0, 1, 1,
0.674049, -0.543955, 3.72154, 0.5019608, 0, 1, 1,
0.6748757, 2.593696, 0.3410816, 0.5058824, 0, 1, 1,
0.6756431, -0.4730953, 3.240645, 0.5137255, 0, 1, 1,
0.6756444, 1.010117, -0.05633358, 0.5176471, 0, 1, 1,
0.6759208, 0.4403198, 1.693017, 0.5254902, 0, 1, 1,
0.6818874, -0.3812166, 2.638361, 0.5294118, 0, 1, 1,
0.6881983, 1.78813, 2.478306, 0.5372549, 0, 1, 1,
0.697368, 0.825277, 1.025402, 0.5411765, 0, 1, 1,
0.7034203, -0.129297, 2.250061, 0.5490196, 0, 1, 1,
0.7043748, 0.4924239, -0.06991095, 0.5529412, 0, 1, 1,
0.7077096, -0.5222254, 2.063675, 0.5607843, 0, 1, 1,
0.7118001, -0.08498542, 1.882922, 0.5647059, 0, 1, 1,
0.7144662, -1.200406, 1.980778, 0.572549, 0, 1, 1,
0.7152959, 0.951592, 0.683946, 0.5764706, 0, 1, 1,
0.718551, -0.2781376, -0.5868313, 0.5843138, 0, 1, 1,
0.7197498, 0.2628566, 0.768256, 0.5882353, 0, 1, 1,
0.7240196, 1.211781, -0.1056312, 0.5960785, 0, 1, 1,
0.726217, -1.382283, 3.222004, 0.6039216, 0, 1, 1,
0.7265397, 0.2581351, -0.1807125, 0.6078432, 0, 1, 1,
0.7272254, -0.8552284, 1.727357, 0.6156863, 0, 1, 1,
0.7372906, 1.365081, 0.3120756, 0.6196079, 0, 1, 1,
0.7440546, 0.194444, 1.770248, 0.627451, 0, 1, 1,
0.7537757, -0.9813138, 1.021142, 0.6313726, 0, 1, 1,
0.7578752, 0.4444641, 2.242146, 0.6392157, 0, 1, 1,
0.7838187, 0.9660221, 2.136083, 0.6431373, 0, 1, 1,
0.7890068, -0.2147935, 3.92676, 0.6509804, 0, 1, 1,
0.7965081, -0.6552609, 3.1101, 0.654902, 0, 1, 1,
0.79669, 0.5983879, 0.7255763, 0.6627451, 0, 1, 1,
0.7980682, 1.395155, -1.396369, 0.6666667, 0, 1, 1,
0.7988079, 0.4935904, 1.629811, 0.6745098, 0, 1, 1,
0.7992807, 0.5135551, 2.54407, 0.6784314, 0, 1, 1,
0.821974, -0.7204706, 0.0516367, 0.6862745, 0, 1, 1,
0.8230523, -0.4833349, 1.453578, 0.6901961, 0, 1, 1,
0.8312514, 0.9807026, 1.189241, 0.6980392, 0, 1, 1,
0.8364988, -0.9095378, 1.877402, 0.7058824, 0, 1, 1,
0.8397202, 0.1192808, 1.14362, 0.7098039, 0, 1, 1,
0.8444404, -0.5698456, 0.5677872, 0.7176471, 0, 1, 1,
0.8561278, 0.3078854, 0.2311641, 0.7215686, 0, 1, 1,
0.856963, 0.7117256, 2.434645, 0.7294118, 0, 1, 1,
0.8581332, 1.035801, 0.3515566, 0.7333333, 0, 1, 1,
0.8613288, -1.035112, 2.689258, 0.7411765, 0, 1, 1,
0.8619754, -0.344267, 1.574132, 0.7450981, 0, 1, 1,
0.8638378, 0.3380362, 0.9021004, 0.7529412, 0, 1, 1,
0.8640701, -0.1530399, -1.018009, 0.7568628, 0, 1, 1,
0.8647681, -1.448345, 3.669889, 0.7647059, 0, 1, 1,
0.8698676, -0.5139803, 3.981234, 0.7686275, 0, 1, 1,
0.8715085, -0.2152737, 0.8904518, 0.7764706, 0, 1, 1,
0.875238, -0.3764767, 2.393474, 0.7803922, 0, 1, 1,
0.8822083, -1.409665, 2.689009, 0.7882353, 0, 1, 1,
0.8845521, 0.7086425, -0.1697796, 0.7921569, 0, 1, 1,
0.8856604, 0.0007922435, 1.269174, 0.8, 0, 1, 1,
0.895528, 0.2617183, 0.137258, 0.8078431, 0, 1, 1,
0.9018145, -0.7243901, 1.984156, 0.8117647, 0, 1, 1,
0.9109274, -0.7594255, 1.135248, 0.8196079, 0, 1, 1,
0.9137771, -0.3883101, -0.03092038, 0.8235294, 0, 1, 1,
0.9183749, -0.4457833, 0.1954976, 0.8313726, 0, 1, 1,
0.9202897, -1.013213, 3.410419, 0.8352941, 0, 1, 1,
0.9204807, -1.325222, 1.397793, 0.8431373, 0, 1, 1,
0.92168, -2.671455, 1.181186, 0.8470588, 0, 1, 1,
0.9264912, -0.352838, 1.182992, 0.854902, 0, 1, 1,
0.9265726, -1.644809, 1.663511, 0.8588235, 0, 1, 1,
0.9377539, 1.447578, 1.032509, 0.8666667, 0, 1, 1,
0.9389285, 1.099024, 0.1440142, 0.8705882, 0, 1, 1,
0.9408277, -0.2416029, 0.2854514, 0.8784314, 0, 1, 1,
0.9482756, 0.1732058, 2.21843, 0.8823529, 0, 1, 1,
0.9540865, 0.7855746, 1.142983, 0.8901961, 0, 1, 1,
0.9596479, 0.8369971, 0.7127631, 0.8941177, 0, 1, 1,
0.965378, 1.38451, 1.059258, 0.9019608, 0, 1, 1,
0.9747093, -1.64003, 4.339237, 0.9098039, 0, 1, 1,
0.9755948, -1.364379, 4.730677, 0.9137255, 0, 1, 1,
0.9859329, -1.069301, 1.532272, 0.9215686, 0, 1, 1,
0.9878957, 0.3422084, -1.209532, 0.9254902, 0, 1, 1,
0.9890329, -0.4537228, 3.60612, 0.9333333, 0, 1, 1,
0.9935052, -0.230073, 2.296268, 0.9372549, 0, 1, 1,
1.012329, -1.408885, 4.044428, 0.945098, 0, 1, 1,
1.013024, -1.330155, 1.087278, 0.9490196, 0, 1, 1,
1.015084, 1.025847, -0.07050177, 0.9568627, 0, 1, 1,
1.015588, -0.3252341, 1.051559, 0.9607843, 0, 1, 1,
1.017152, -0.2457198, 3.294141, 0.9686275, 0, 1, 1,
1.019689, -0.3894652, 3.561931, 0.972549, 0, 1, 1,
1.025485, 2.066368, -0.4061378, 0.9803922, 0, 1, 1,
1.026218, -0.3930221, 0.6083952, 0.9843137, 0, 1, 1,
1.026591, 0.1844206, 0.7863475, 0.9921569, 0, 1, 1,
1.035234, -1.640121, 3.67302, 0.9960784, 0, 1, 1,
1.036172, 1.462604, 2.46905, 1, 0, 0.9960784, 1,
1.03703, -0.459217, 1.558237, 1, 0, 0.9882353, 1,
1.039574, -0.1500475, 2.107652, 1, 0, 0.9843137, 1,
1.04086, 0.8454505, 0.9022842, 1, 0, 0.9764706, 1,
1.047116, 2.080233, -1.119493, 1, 0, 0.972549, 1,
1.048406, -2.162565, 2.093478, 1, 0, 0.9647059, 1,
1.049328, -1.792021, 3.180333, 1, 0, 0.9607843, 1,
1.054103, -0.133355, 0.802487, 1, 0, 0.9529412, 1,
1.059794, -0.3399611, 1.683295, 1, 0, 0.9490196, 1,
1.060793, 0.8344974, 2.019421, 1, 0, 0.9411765, 1,
1.066161, 0.2050816, 1.863962, 1, 0, 0.9372549, 1,
1.076085, 0.8835736, 0.2011014, 1, 0, 0.9294118, 1,
1.081277, -1.387686, 0.6320531, 1, 0, 0.9254902, 1,
1.082444, 0.3546373, 1.466563, 1, 0, 0.9176471, 1,
1.085209, -0.134161, 1.151289, 1, 0, 0.9137255, 1,
1.085916, -1.814358, 2.318662, 1, 0, 0.9058824, 1,
1.089645, 0.2183923, 1.893348, 1, 0, 0.9019608, 1,
1.089696, 1.263223, 1.177826, 1, 0, 0.8941177, 1,
1.092135, -0.3320809, 2.712254, 1, 0, 0.8862745, 1,
1.097553, -0.07360685, 1.426094, 1, 0, 0.8823529, 1,
1.09865, -1.006281, 2.007133, 1, 0, 0.8745098, 1,
1.108061, -0.4476112, -0.4056706, 1, 0, 0.8705882, 1,
1.113776, -1.481355, 2.236262, 1, 0, 0.8627451, 1,
1.114791, -0.2717191, 2.61496, 1, 0, 0.8588235, 1,
1.119041, 0.2132658, 1.764571, 1, 0, 0.8509804, 1,
1.134671, 0.5681918, 2.301756, 1, 0, 0.8470588, 1,
1.148645, -0.968764, 1.586598, 1, 0, 0.8392157, 1,
1.153349, 1.384157, 1.171956, 1, 0, 0.8352941, 1,
1.15998, 0.2008642, 2.639375, 1, 0, 0.827451, 1,
1.16447, 0.8429357, 1.510466, 1, 0, 0.8235294, 1,
1.176392, 0.6295756, 1.970857, 1, 0, 0.8156863, 1,
1.17741, 0.03838562, 1.948688, 1, 0, 0.8117647, 1,
1.178744, -0.7133527, 2.105431, 1, 0, 0.8039216, 1,
1.20101, -1.527974, 3.206074, 1, 0, 0.7960784, 1,
1.208157, -1.196507, 3.558158, 1, 0, 0.7921569, 1,
1.20869, -0.174184, 1.855776, 1, 0, 0.7843137, 1,
1.21339, 1.433304, -0.3324371, 1, 0, 0.7803922, 1,
1.217233, 1.666324, -0.5274425, 1, 0, 0.772549, 1,
1.219259, -0.761095, 1.930951, 1, 0, 0.7686275, 1,
1.236433, 0.4093858, 2.845125, 1, 0, 0.7607843, 1,
1.239185, 0.7016306, 0.9116614, 1, 0, 0.7568628, 1,
1.242788, -0.7169157, 1.365812, 1, 0, 0.7490196, 1,
1.24406, -0.3252192, 3.011303, 1, 0, 0.7450981, 1,
1.247839, -0.09171839, 1.547762, 1, 0, 0.7372549, 1,
1.250862, 0.334557, 1.144969, 1, 0, 0.7333333, 1,
1.251375, 0.2090358, 3.093354, 1, 0, 0.7254902, 1,
1.259535, 0.4247296, 1.379156, 1, 0, 0.7215686, 1,
1.263267, -1.66601, 1.998133, 1, 0, 0.7137255, 1,
1.268904, 1.481539, 1.708898, 1, 0, 0.7098039, 1,
1.274257, -0.1291495, 0.7837757, 1, 0, 0.7019608, 1,
1.275483, -1.000579, 3.137228, 1, 0, 0.6941177, 1,
1.281066, -0.5744052, 3.439069, 1, 0, 0.6901961, 1,
1.282787, -0.5002184, 1.639336, 1, 0, 0.682353, 1,
1.286347, 0.242771, 1.976699, 1, 0, 0.6784314, 1,
1.288519, -3.010971, 1.490661, 1, 0, 0.6705883, 1,
1.289411, 0.4548448, 1.510106, 1, 0, 0.6666667, 1,
1.304615, 0.7940938, 1.41006, 1, 0, 0.6588235, 1,
1.310159, -1.713573, 2.314101, 1, 0, 0.654902, 1,
1.312945, 0.809499, 1.753722, 1, 0, 0.6470588, 1,
1.317801, 0.9706563, 1.338897, 1, 0, 0.6431373, 1,
1.321081, -1.573636, 2.110361, 1, 0, 0.6352941, 1,
1.347908, 0.1880504, 1.78322, 1, 0, 0.6313726, 1,
1.348808, 0.2775287, 1.013539, 1, 0, 0.6235294, 1,
1.359233, 0.02602022, 1.711142, 1, 0, 0.6196079, 1,
1.364535, 0.7817783, 3.61503, 1, 0, 0.6117647, 1,
1.365308, -0.7916513, 1.70962, 1, 0, 0.6078432, 1,
1.371764, -2.030916, 1.653036, 1, 0, 0.6, 1,
1.372447, 0.004620795, 2.05215, 1, 0, 0.5921569, 1,
1.385935, -0.7347775, 2.291644, 1, 0, 0.5882353, 1,
1.389465, 0.8709351, -0.3599519, 1, 0, 0.5803922, 1,
1.396704, -2.124327, 4.146816, 1, 0, 0.5764706, 1,
1.409807, -0.6995428, 1.857933, 1, 0, 0.5686275, 1,
1.412897, 1.663885, 1.457948, 1, 0, 0.5647059, 1,
1.414108, 0.06445341, 2.044996, 1, 0, 0.5568628, 1,
1.424306, -0.1523037, 1.863269, 1, 0, 0.5529412, 1,
1.427897, -1.340978, 1.064689, 1, 0, 0.5450981, 1,
1.434063, -2.558231, 3.164536, 1, 0, 0.5411765, 1,
1.439702, 1.240567, 0.6700912, 1, 0, 0.5333334, 1,
1.440921, 1.912732, 0.09731279, 1, 0, 0.5294118, 1,
1.447067, -0.6710041, 1.953285, 1, 0, 0.5215687, 1,
1.448523, 1.140765, 0.4784363, 1, 0, 0.5176471, 1,
1.450943, 0.001647767, 2.537629, 1, 0, 0.509804, 1,
1.452926, -1.185955, 1.644856, 1, 0, 0.5058824, 1,
1.45461, -0.1188919, 2.684499, 1, 0, 0.4980392, 1,
1.456386, -0.3295336, 2.390395, 1, 0, 0.4901961, 1,
1.466622, 0.4881767, -0.1369179, 1, 0, 0.4862745, 1,
1.469377, -0.7806587, 2.058145, 1, 0, 0.4784314, 1,
1.471536, -1.420018, 1.048414, 1, 0, 0.4745098, 1,
1.474625, -1.832761, 1.929131, 1, 0, 0.4666667, 1,
1.478896, 0.5431054, 2.519715, 1, 0, 0.4627451, 1,
1.485333, 1.746189, 2.623776, 1, 0, 0.454902, 1,
1.490456, -0.3736284, 1.462842, 1, 0, 0.4509804, 1,
1.506471, -0.2914601, 1.483457, 1, 0, 0.4431373, 1,
1.510506, 1.523991, 0.4034688, 1, 0, 0.4392157, 1,
1.521076, -0.6385417, 1.27073, 1, 0, 0.4313726, 1,
1.546314, -0.255115, 2.539077, 1, 0, 0.427451, 1,
1.556308, -0.8194925, 1.194161, 1, 0, 0.4196078, 1,
1.561281, -0.6881726, 1.48069, 1, 0, 0.4156863, 1,
1.579571, 1.197502, -0.2613674, 1, 0, 0.4078431, 1,
1.582331, 0.2166636, 0.6476687, 1, 0, 0.4039216, 1,
1.630466, 0.7562869, 0.9788422, 1, 0, 0.3960784, 1,
1.631551, 0.3122571, 2.07771, 1, 0, 0.3882353, 1,
1.644448, 0.9146652, -0.09226733, 1, 0, 0.3843137, 1,
1.654344, 1.579943, 1.519693, 1, 0, 0.3764706, 1,
1.659949, 0.3902018, -0.09396324, 1, 0, 0.372549, 1,
1.675948, 0.6783791, 0.6936711, 1, 0, 0.3647059, 1,
1.687623, 0.5507233, 0.5989442, 1, 0, 0.3607843, 1,
1.723607, 0.6914973, -0.3533537, 1, 0, 0.3529412, 1,
1.724201, -0.7701806, 4.075455, 1, 0, 0.3490196, 1,
1.725312, -0.9833088, 2.699267, 1, 0, 0.3411765, 1,
1.725411, -0.09465528, 0.5683025, 1, 0, 0.3372549, 1,
1.730545, -0.1751918, 1.732911, 1, 0, 0.3294118, 1,
1.732661, 0.5221951, 1.011199, 1, 0, 0.3254902, 1,
1.733087, -0.4552817, 2.169939, 1, 0, 0.3176471, 1,
1.733328, 0.4059422, -0.4654955, 1, 0, 0.3137255, 1,
1.733346, -1.913861, 2.338273, 1, 0, 0.3058824, 1,
1.752949, -0.3714688, 1.544386, 1, 0, 0.2980392, 1,
1.759852, 2.702507, 0.8006198, 1, 0, 0.2941177, 1,
1.763386, -2.829352, 4.204338, 1, 0, 0.2862745, 1,
1.765307, -1.710138, 1.00364, 1, 0, 0.282353, 1,
1.782584, 1.304465, 0.6967366, 1, 0, 0.2745098, 1,
1.80404, -1.619564, 3.53149, 1, 0, 0.2705882, 1,
1.819543, 1.369604, 1.390333, 1, 0, 0.2627451, 1,
1.832178, 0.883295, 0.3513384, 1, 0, 0.2588235, 1,
1.837376, 2.073637, -0.3923022, 1, 0, 0.2509804, 1,
1.85335, 0.2239929, 1.205612, 1, 0, 0.2470588, 1,
1.855615, 0.799426, 2.4905, 1, 0, 0.2392157, 1,
1.862661, -1.145046, 2.806891, 1, 0, 0.2352941, 1,
1.884956, -0.02570118, 2.155456, 1, 0, 0.227451, 1,
1.890231, 0.09368402, 1.736025, 1, 0, 0.2235294, 1,
1.891142, 1.680099, 0.1277049, 1, 0, 0.2156863, 1,
1.907782, -1.58973, 3.354259, 1, 0, 0.2117647, 1,
1.91067, 0.6875283, 0.2292094, 1, 0, 0.2039216, 1,
1.912027, 0.1570625, 3.351991, 1, 0, 0.1960784, 1,
1.922567, -0.7135838, 3.159359, 1, 0, 0.1921569, 1,
1.939597, 1.13164, 1.46534, 1, 0, 0.1843137, 1,
1.948118, 0.6256163, 2.12537, 1, 0, 0.1803922, 1,
1.953023, -1.023715, 1.18476, 1, 0, 0.172549, 1,
1.968571, 1.62837, 1.987758, 1, 0, 0.1686275, 1,
1.969518, -2.104959, 3.504316, 1, 0, 0.1607843, 1,
1.988394, -1.853398, 2.147066, 1, 0, 0.1568628, 1,
2.001384, 0.5411976, 2.398764, 1, 0, 0.1490196, 1,
2.002907, -1.110392, 1.421798, 1, 0, 0.145098, 1,
2.003616, 1.045254, 0.9824771, 1, 0, 0.1372549, 1,
2.009317, -0.2023575, 1.023012, 1, 0, 0.1333333, 1,
2.027487, 0.8175626, 1.695713, 1, 0, 0.1254902, 1,
2.094793, 0.8876277, -0.9510493, 1, 0, 0.1215686, 1,
2.108202, -1.690304, 3.025975, 1, 0, 0.1137255, 1,
2.12435, 1.713817, 2.355954, 1, 0, 0.1098039, 1,
2.131406, 0.1397763, 0.5609484, 1, 0, 0.1019608, 1,
2.141881, 0.6042099, 1.782833, 1, 0, 0.09411765, 1,
2.142202, 0.7988188, 1.789074, 1, 0, 0.09019608, 1,
2.144834, 0.3762122, 0.291027, 1, 0, 0.08235294, 1,
2.181085, 0.6808603, -0.09332725, 1, 0, 0.07843138, 1,
2.199347, 0.4599695, -0.1146947, 1, 0, 0.07058824, 1,
2.274996, -0.5126409, 0.9966753, 1, 0, 0.06666667, 1,
2.280296, 0.1274722, 0.4256174, 1, 0, 0.05882353, 1,
2.334018, -0.3144163, 3.908235, 1, 0, 0.05490196, 1,
2.355664, 1.906356, 0.4861389, 1, 0, 0.04705882, 1,
2.404027, 0.6235721, 0.6217787, 1, 0, 0.04313726, 1,
2.425286, -0.01804046, 1.635097, 1, 0, 0.03529412, 1,
2.477712, 0.9596004, 0.9745867, 1, 0, 0.03137255, 1,
2.52183, 0.4251015, 1.545056, 1, 0, 0.02352941, 1,
2.64147, 1.43613, 1.1951, 1, 0, 0.01960784, 1,
2.687172, 1.778077, 0.1545049, 1, 0, 0.01176471, 1,
2.980429, -0.06687862, -0.5115392, 1, 0, 0.007843138, 1
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
-0.06325412, -4.060568, -7.150621, 0, -0.5, 0.5, 0.5,
-0.06325412, -4.060568, -7.150621, 1, -0.5, 0.5, 0.5,
-0.06325412, -4.060568, -7.150621, 1, 1.5, 0.5, 0.5,
-0.06325412, -4.060568, -7.150621, 0, 1.5, 0.5, 0.5
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
-4.138746, 0.08518529, -7.150621, 0, -0.5, 0.5, 0.5,
-4.138746, 0.08518529, -7.150621, 1, -0.5, 0.5, 0.5,
-4.138746, 0.08518529, -7.150621, 1, 1.5, 0.5, 0.5,
-4.138746, 0.08518529, -7.150621, 0, 1.5, 0.5, 0.5
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
-4.138746, -4.060568, 0.2670047, 0, -0.5, 0.5, 0.5,
-4.138746, -4.060568, 0.2670047, 1, -0.5, 0.5, 0.5,
-4.138746, -4.060568, 0.2670047, 1, 1.5, 0.5, 0.5,
-4.138746, -4.060568, 0.2670047, 0, 1.5, 0.5, 0.5
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
-3, -3.103856, -5.438861,
2, -3.103856, -5.438861,
-3, -3.103856, -5.438861,
-3, -3.263308, -5.724154,
-2, -3.103856, -5.438861,
-2, -3.263308, -5.724154,
-1, -3.103856, -5.438861,
-1, -3.263308, -5.724154,
0, -3.103856, -5.438861,
0, -3.263308, -5.724154,
1, -3.103856, -5.438861,
1, -3.263308, -5.724154,
2, -3.103856, -5.438861,
2, -3.263308, -5.724154
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
-3, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
-3, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
-3, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
-3, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5,
-2, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
-2, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
-2, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
-2, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5,
-1, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
-1, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
-1, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
-1, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5,
0, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
0, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
0, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
0, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5,
1, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
1, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
1, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
1, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5,
2, -3.582212, -6.294741, 0, -0.5, 0.5, 0.5,
2, -3.582212, -6.294741, 1, -0.5, 0.5, 0.5,
2, -3.582212, -6.294741, 1, 1.5, 0.5, 0.5,
2, -3.582212, -6.294741, 0, 1.5, 0.5, 0.5
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
-3.198248, -3, -5.438861,
-3.198248, 3, -5.438861,
-3.198248, -3, -5.438861,
-3.354998, -3, -5.724154,
-3.198248, -2, -5.438861,
-3.354998, -2, -5.724154,
-3.198248, -1, -5.438861,
-3.354998, -1, -5.724154,
-3.198248, 0, -5.438861,
-3.354998, 0, -5.724154,
-3.198248, 1, -5.438861,
-3.354998, 1, -5.724154,
-3.198248, 2, -5.438861,
-3.354998, 2, -5.724154,
-3.198248, 3, -5.438861,
-3.354998, 3, -5.724154
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
-3.668497, -3, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, -3, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, -3, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, -3, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, -2, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, -2, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, -2, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, -2, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, -1, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, -1, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, -1, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, -1, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, 0, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, 0, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, 0, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, 0, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, 1, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, 1, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, 1, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, 1, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, 2, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, 2, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, 2, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, 2, -6.294741, 0, 1.5, 0.5, 0.5,
-3.668497, 3, -6.294741, 0, -0.5, 0.5, 0.5,
-3.668497, 3, -6.294741, 1, -0.5, 0.5, 0.5,
-3.668497, 3, -6.294741, 1, 1.5, 0.5, 0.5,
-3.668497, 3, -6.294741, 0, 1.5, 0.5, 0.5
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
-3.198248, -3.103856, -4,
-3.198248, -3.103856, 4,
-3.198248, -3.103856, -4,
-3.354998, -3.263308, -4,
-3.198248, -3.103856, -2,
-3.354998, -3.263308, -2,
-3.198248, -3.103856, 0,
-3.354998, -3.263308, 0,
-3.198248, -3.103856, 2,
-3.354998, -3.263308, 2,
-3.198248, -3.103856, 4,
-3.354998, -3.263308, 4
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
-3.668497, -3.582212, -4, 0, -0.5, 0.5, 0.5,
-3.668497, -3.582212, -4, 1, -0.5, 0.5, 0.5,
-3.668497, -3.582212, -4, 1, 1.5, 0.5, 0.5,
-3.668497, -3.582212, -4, 0, 1.5, 0.5, 0.5,
-3.668497, -3.582212, -2, 0, -0.5, 0.5, 0.5,
-3.668497, -3.582212, -2, 1, -0.5, 0.5, 0.5,
-3.668497, -3.582212, -2, 1, 1.5, 0.5, 0.5,
-3.668497, -3.582212, -2, 0, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 0, 0, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 0, 1, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 0, 1, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 0, 0, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 2, 0, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 2, 1, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 2, 1, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 2, 0, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 4, 0, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 4, 1, -0.5, 0.5, 0.5,
-3.668497, -3.582212, 4, 1, 1.5, 0.5, 0.5,
-3.668497, -3.582212, 4, 0, 1.5, 0.5, 0.5
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
-3.198248, -3.103856, -5.438861,
-3.198248, 3.274227, -5.438861,
-3.198248, -3.103856, 5.97287,
-3.198248, 3.274227, 5.97287,
-3.198248, -3.103856, -5.438861,
-3.198248, -3.103856, 5.97287,
-3.198248, 3.274227, -5.438861,
-3.198248, 3.274227, 5.97287,
-3.198248, -3.103856, -5.438861,
3.07174, -3.103856, -5.438861,
-3.198248, -3.103856, 5.97287,
3.07174, -3.103856, 5.97287,
-3.198248, 3.274227, -5.438861,
3.07174, 3.274227, -5.438861,
-3.198248, 3.274227, 5.97287,
3.07174, 3.274227, 5.97287,
3.07174, -3.103856, -5.438861,
3.07174, 3.274227, -5.438861,
3.07174, -3.103856, 5.97287,
3.07174, 3.274227, 5.97287,
3.07174, -3.103856, -5.438861,
3.07174, -3.103856, 5.97287,
3.07174, 3.274227, -5.438861,
3.07174, 3.274227, 5.97287
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
var radius = 7.742172;
var distance = 34.4458;
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
mvMatrix.translate( 0.06325412, -0.08518529, -0.2670047 );
mvMatrix.scale( 1.335088, 1.312461, 0.7335423 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.4458);
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
Barban<-read.table("Barban.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Barban$V2
```

```
## Error in eval(expr, envir, enclos): object 'Barban' not found
```

```r
y<-Barban$V3
```

```
## Error in eval(expr, envir, enclos): object 'Barban' not found
```

```r
z<-Barban$V4
```

```
## Error in eval(expr, envir, enclos): object 'Barban' not found
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
-3.106937, -1.97599, -3.187769, 0, 0, 1, 1, 1,
-2.906164, 1.001813, 0.8704347, 1, 0, 0, 1, 1,
-2.817154, 0.1363298, -2.319796, 1, 0, 0, 1, 1,
-2.772993, 0.4602565, -1.841071, 1, 0, 0, 1, 1,
-2.654592, -1.615657, -2.649104, 1, 0, 0, 1, 1,
-2.60884, 0.3244558, 0.2190457, 1, 0, 0, 1, 1,
-2.413217, -1.330083, -3.30876, 0, 0, 0, 1, 1,
-2.396754, 0.1599628, -2.391385, 0, 0, 0, 1, 1,
-2.381133, -0.5901083, -1.768533, 0, 0, 0, 1, 1,
-2.37873, 0.4343668, -0.4324435, 0, 0, 0, 1, 1,
-2.368639, -0.9276404, 0.1029927, 0, 0, 0, 1, 1,
-2.361067, -0.6394351, -2.056743, 0, 0, 0, 1, 1,
-2.300088, -0.1831789, -2.375598, 0, 0, 0, 1, 1,
-2.246592, -0.02754336, -2.377072, 1, 1, 1, 1, 1,
-2.207789, 0.1898242, -1.115021, 1, 1, 1, 1, 1,
-2.164058, -1.143971, -1.168137, 1, 1, 1, 1, 1,
-2.15356, 0.6065591, -0.3904998, 1, 1, 1, 1, 1,
-2.013181, 0.043221, -3.412673, 1, 1, 1, 1, 1,
-1.998439, 0.202857, -3.230354, 1, 1, 1, 1, 1,
-1.983336, 0.03109247, -2.593086, 1, 1, 1, 1, 1,
-1.963072, -0.7597534, -1.514103, 1, 1, 1, 1, 1,
-1.961096, -0.313134, -2.904417, 1, 1, 1, 1, 1,
-1.95308, -0.812194, -1.097881, 1, 1, 1, 1, 1,
-1.949594, 0.8463034, -2.022911, 1, 1, 1, 1, 1,
-1.923295, 0.8945557, -1.244752, 1, 1, 1, 1, 1,
-1.917008, -0.7999555, -1.577667, 1, 1, 1, 1, 1,
-1.908502, 0.7156565, -0.7693381, 1, 1, 1, 1, 1,
-1.897502, 1.116046, -1.262519, 1, 1, 1, 1, 1,
-1.892457, -0.5620396, -2.840466, 0, 0, 1, 1, 1,
-1.89166, -0.4801018, -2.982543, 1, 0, 0, 1, 1,
-1.889346, -0.5812044, -0.1170297, 1, 0, 0, 1, 1,
-1.873458, -0.009582456, -0.9394131, 1, 0, 0, 1, 1,
-1.873235, -2.028951, -1.813622, 1, 0, 0, 1, 1,
-1.872553, -0.5668861, -1.275206, 1, 0, 0, 1, 1,
-1.852432, 0.157045, -1.614126, 0, 0, 0, 1, 1,
-1.842277, 0.9317548, -0.1083125, 0, 0, 0, 1, 1,
-1.84018, -1.367314, -1.97814, 0, 0, 0, 1, 1,
-1.832587, -1.115698, -0.9117252, 0, 0, 0, 1, 1,
-1.827323, 0.2169805, -1.80665, 0, 0, 0, 1, 1,
-1.825068, 1.63051, -1.468053, 0, 0, 0, 1, 1,
-1.816573, -0.2673184, -1.464113, 0, 0, 0, 1, 1,
-1.799233, -1.786549, -1.068333, 1, 1, 1, 1, 1,
-1.779325, 0.9166697, -3.292556, 1, 1, 1, 1, 1,
-1.768782, 0.4199429, -1.308481, 1, 1, 1, 1, 1,
-1.767105, 0.009183279, -0.988321, 1, 1, 1, 1, 1,
-1.765898, 0.2221872, -0.3618175, 1, 1, 1, 1, 1,
-1.751029, 0.6857034, -1.781862, 1, 1, 1, 1, 1,
-1.747887, -0.2449466, -3.382673, 1, 1, 1, 1, 1,
-1.747386, 2.136617, -0.7570145, 1, 1, 1, 1, 1,
-1.739442, 1.651516, -1.03049, 1, 1, 1, 1, 1,
-1.725014, -1.593422, -2.20331, 1, 1, 1, 1, 1,
-1.723961, 1.404178, -1.081003, 1, 1, 1, 1, 1,
-1.722287, 1.117882, -1.627288, 1, 1, 1, 1, 1,
-1.708759, 0.9605356, -1.577253, 1, 1, 1, 1, 1,
-1.707876, -1.350419, -2.348113, 1, 1, 1, 1, 1,
-1.695421, 0.2997682, -2.865733, 1, 1, 1, 1, 1,
-1.671891, 0.3149234, -1.489738, 0, 0, 1, 1, 1,
-1.669591, 0.8146124, -1.762853, 1, 0, 0, 1, 1,
-1.665998, -0.1800009, -2.749876, 1, 0, 0, 1, 1,
-1.651499, 2.162948, -1.785286, 1, 0, 0, 1, 1,
-1.648545, -0.8148573, -4.002271, 1, 0, 0, 1, 1,
-1.646853, -0.4401059, -2.44075, 1, 0, 0, 1, 1,
-1.630959, -0.5567206, -2.218735, 0, 0, 0, 1, 1,
-1.626905, 0.8915441, -1.577091, 0, 0, 0, 1, 1,
-1.624489, 0.3234162, -0.879034, 0, 0, 0, 1, 1,
-1.62367, -0.7479181, -2.176615, 0, 0, 0, 1, 1,
-1.589297, -0.07575107, -0.8242306, 0, 0, 0, 1, 1,
-1.582488, 0.2601329, 0.5525989, 0, 0, 0, 1, 1,
-1.581952, -1.635581, -2.557389, 0, 0, 0, 1, 1,
-1.570713, 1.203383, 0.4951278, 1, 1, 1, 1, 1,
-1.566388, 0.01098917, -1.362896, 1, 1, 1, 1, 1,
-1.555579, -0.9895107, -0.2910465, 1, 1, 1, 1, 1,
-1.542359, -0.8035299, 0.4864531, 1, 1, 1, 1, 1,
-1.539809, -1.588266, -2.587844, 1, 1, 1, 1, 1,
-1.532509, 0.9059105, -2.058995, 1, 1, 1, 1, 1,
-1.526094, -1.894341, -2.89816, 1, 1, 1, 1, 1,
-1.511506, 0.09598029, 0.04757319, 1, 1, 1, 1, 1,
-1.508666, -1.032046, -3.68255, 1, 1, 1, 1, 1,
-1.505096, 0.3234364, -1.471075, 1, 1, 1, 1, 1,
-1.496875, 2.773987, 0.125136, 1, 1, 1, 1, 1,
-1.495833, -1.386145, -3.554794, 1, 1, 1, 1, 1,
-1.491988, 1.538076, -0.7397998, 1, 1, 1, 1, 1,
-1.471063, -0.03342064, -1.52172, 1, 1, 1, 1, 1,
-1.4702, 0.3414863, 0.4897932, 1, 1, 1, 1, 1,
-1.468174, 1.572884, 0.8350939, 0, 0, 1, 1, 1,
-1.464059, -0.5973353, -0.6224576, 1, 0, 0, 1, 1,
-1.448567, 0.1057309, -3.452075, 1, 0, 0, 1, 1,
-1.444798, 0.8371316, 0.1603198, 1, 0, 0, 1, 1,
-1.443701, 0.1023377, -0.6038945, 1, 0, 0, 1, 1,
-1.443679, -0.04904383, -1.996663, 1, 0, 0, 1, 1,
-1.440617, -1.323794, -3.270005, 0, 0, 0, 1, 1,
-1.436405, -0.2627029, -0.2277942, 0, 0, 0, 1, 1,
-1.426396, 0.1704841, -0.5124329, 0, 0, 0, 1, 1,
-1.425807, -0.5065179, -0.4755993, 0, 0, 0, 1, 1,
-1.419495, -1.139866, -2.716265, 0, 0, 0, 1, 1,
-1.413233, -1.677494, -2.352876, 0, 0, 0, 1, 1,
-1.395345, 1.405606, -1.328924, 0, 0, 0, 1, 1,
-1.390254, 1.822847, -0.6883579, 1, 1, 1, 1, 1,
-1.382975, -0.8447589, -2.257014, 1, 1, 1, 1, 1,
-1.380978, 0.4965378, 1.107947, 1, 1, 1, 1, 1,
-1.378105, 1.37082, -1.358883, 1, 1, 1, 1, 1,
-1.37435, 0.6629179, -1.86852, 1, 1, 1, 1, 1,
-1.365549, 1.892462, -0.6467464, 1, 1, 1, 1, 1,
-1.364087, 0.9973499, -0.7826789, 1, 1, 1, 1, 1,
-1.357442, 1.193121, -0.623926, 1, 1, 1, 1, 1,
-1.353357, -1.788433, -4.563729, 1, 1, 1, 1, 1,
-1.352276, -0.5075271, -2.663861, 1, 1, 1, 1, 1,
-1.351325, -2.872996, -3.230528, 1, 1, 1, 1, 1,
-1.338119, -0.1808746, -1.54704, 1, 1, 1, 1, 1,
-1.334474, 0.7308699, -0.8673933, 1, 1, 1, 1, 1,
-1.324251, -0.1932083, -2.062602, 1, 1, 1, 1, 1,
-1.31775, 0.4824847, -0.7065976, 1, 1, 1, 1, 1,
-1.314446, -1.066992, -1.460564, 0, 0, 1, 1, 1,
-1.313785, 0.29974, -2.871612, 1, 0, 0, 1, 1,
-1.310387, 0.2820879, -2.411329, 1, 0, 0, 1, 1,
-1.30718, 0.2483163, -2.765342, 1, 0, 0, 1, 1,
-1.302023, -1.691883, -0.3600782, 1, 0, 0, 1, 1,
-1.297618, -0.619553, -0.9376124, 1, 0, 0, 1, 1,
-1.29652, 0.1718709, -1.814631, 0, 0, 0, 1, 1,
-1.296402, 0.8534821, -1.545194, 0, 0, 0, 1, 1,
-1.281286, 0.8808672, -1.239914, 0, 0, 0, 1, 1,
-1.266322, 0.3148193, -0.8253079, 0, 0, 0, 1, 1,
-1.264338, -0.2820079, -3.138937, 0, 0, 0, 1, 1,
-1.2608, 1.134295, -1.933911, 0, 0, 0, 1, 1,
-1.244473, -1.683036, -3.84787, 0, 0, 0, 1, 1,
-1.240397, 0.07819859, -2.39452, 1, 1, 1, 1, 1,
-1.235422, 1.978379, -0.0289898, 1, 1, 1, 1, 1,
-1.225179, 1.469903, -1.962531, 1, 1, 1, 1, 1,
-1.223021, 0.451219, -2.597436, 1, 1, 1, 1, 1,
-1.218969, 0.3329772, -0.6337142, 1, 1, 1, 1, 1,
-1.215375, 0.7349155, 0.08201415, 1, 1, 1, 1, 1,
-1.201962, 0.07238163, -1.570483, 1, 1, 1, 1, 1,
-1.201722, 0.409362, -0.2008038, 1, 1, 1, 1, 1,
-1.197434, -2.282533, -2.55351, 1, 1, 1, 1, 1,
-1.193775, 0.9826181, -1.051806, 1, 1, 1, 1, 1,
-1.187467, 0.961193, -0.1937088, 1, 1, 1, 1, 1,
-1.181621, 0.04439333, -1.517773, 1, 1, 1, 1, 1,
-1.176504, 0.2360612, -2.921891, 1, 1, 1, 1, 1,
-1.175479, 0.9388607, -0.4846972, 1, 1, 1, 1, 1,
-1.173533, 0.1455777, -1.554202, 1, 1, 1, 1, 1,
-1.168111, -0.2402853, -3.016127, 0, 0, 1, 1, 1,
-1.167942, 0.07405598, -1.881009, 1, 0, 0, 1, 1,
-1.163428, 0.04685109, -1.537054, 1, 0, 0, 1, 1,
-1.160664, -0.8912699, -4.116919, 1, 0, 0, 1, 1,
-1.152823, 0.2368683, -3.301297, 1, 0, 0, 1, 1,
-1.14701, 0.6952083, -0.160365, 1, 0, 0, 1, 1,
-1.145326, 1.789733, -1.165504, 0, 0, 0, 1, 1,
-1.133867, 0.7967825, -1.786396, 0, 0, 0, 1, 1,
-1.125534, -0.5044201, -1.94982, 0, 0, 0, 1, 1,
-1.117323, 1.600566, -0.09230913, 0, 0, 0, 1, 1,
-1.105308, 1.650208, -1.957919, 0, 0, 0, 1, 1,
-1.100348, 1.932327, -0.3839373, 0, 0, 0, 1, 1,
-1.093726, 0.08619911, -1.621712, 0, 0, 0, 1, 1,
-1.08896, -1.837778, -4.221034, 1, 1, 1, 1, 1,
-1.08846, 0.46088, -1.214395, 1, 1, 1, 1, 1,
-1.08563, 1.002929, -0.002274529, 1, 1, 1, 1, 1,
-1.084902, 0.08552933, -1.227009, 1, 1, 1, 1, 1,
-1.081705, -0.9343221, -3.366196, 1, 1, 1, 1, 1,
-1.080713, -1.028412, -2.042264, 1, 1, 1, 1, 1,
-1.072231, 2.194147, -0.3773789, 1, 1, 1, 1, 1,
-1.066579, -0.04187985, -1.932365, 1, 1, 1, 1, 1,
-1.063041, 2.108981, -1.266321, 1, 1, 1, 1, 1,
-1.061474, 0.5861874, -1.032801, 1, 1, 1, 1, 1,
-1.051496, 0.4377517, -1.213574, 1, 1, 1, 1, 1,
-1.048865, 2.334183, -0.8085952, 1, 1, 1, 1, 1,
-1.048618, 0.8651929, -1.310519, 1, 1, 1, 1, 1,
-1.046457, 2.422118, -0.07757616, 1, 1, 1, 1, 1,
-1.045327, -1.976435, -3.369599, 1, 1, 1, 1, 1,
-1.042495, -0.4702336, -1.752443, 0, 0, 1, 1, 1,
-1.036492, 1.09895, -2.231816, 1, 0, 0, 1, 1,
-1.02674, -0.1165256, -0.434207, 1, 0, 0, 1, 1,
-1.025747, -0.5485554, -4.321807, 1, 0, 0, 1, 1,
-1.025622, -0.8042857, -2.432823, 1, 0, 0, 1, 1,
-1.024452, 0.9702997, -1.148688, 1, 0, 0, 1, 1,
-1.024207, 0.5229661, -3.243706, 0, 0, 0, 1, 1,
-1.017024, 1.415887, -1.631746, 0, 0, 0, 1, 1,
-1.011061, 0.2201661, 0.03959979, 0, 0, 0, 1, 1,
-1.008471, 0.9315964, -2.235548, 0, 0, 0, 1, 1,
-1.008282, -1.004423, -2.58637, 0, 0, 0, 1, 1,
-1.002985, -0.7752348, -1.799794, 0, 0, 0, 1, 1,
-0.9944814, -0.1844018, -2.79017, 0, 0, 0, 1, 1,
-0.9927825, -0.2505349, -2.575092, 1, 1, 1, 1, 1,
-0.9832383, -0.5391834, -2.531348, 1, 1, 1, 1, 1,
-0.9816213, -1.144484, 0.2833431, 1, 1, 1, 1, 1,
-0.9803638, -0.1159731, -1.07246, 1, 1, 1, 1, 1,
-0.9732132, 0.3726862, -1.378592, 1, 1, 1, 1, 1,
-0.9590993, 0.665125, -0.4754314, 1, 1, 1, 1, 1,
-0.9584784, 0.5471224, -0.2489335, 1, 1, 1, 1, 1,
-0.947706, -0.526352, -1.369541, 1, 1, 1, 1, 1,
-0.9433368, 1.757757, -0.6095819, 1, 1, 1, 1, 1,
-0.939463, -0.7191357, -2.175619, 1, 1, 1, 1, 1,
-0.9384924, 0.6000733, -0.9387816, 1, 1, 1, 1, 1,
-0.9335887, 0.7158492, -1.693228, 1, 1, 1, 1, 1,
-0.9318641, 0.1168981, -2.255846, 1, 1, 1, 1, 1,
-0.9313477, -2.192416, -2.952307, 1, 1, 1, 1, 1,
-0.930581, -1.565165, -0.9128956, 1, 1, 1, 1, 1,
-0.9305549, 1.252434, -2.04119, 0, 0, 1, 1, 1,
-0.9285886, -2.01126, -3.24171, 1, 0, 0, 1, 1,
-0.925974, -0.6586963, -3.132287, 1, 0, 0, 1, 1,
-0.9180228, -0.3556623, -2.296679, 1, 0, 0, 1, 1,
-0.9143845, 0.01120725, -0.2488655, 1, 0, 0, 1, 1,
-0.9129825, 0.5856736, -1.389127, 1, 0, 0, 1, 1,
-0.9113036, -0.2390014, -2.864685, 0, 0, 0, 1, 1,
-0.9100763, -1.054987, -3.648752, 0, 0, 0, 1, 1,
-0.9024911, -0.5544827, -2.352161, 0, 0, 0, 1, 1,
-0.9020432, 0.8967477, -2.734622, 0, 0, 0, 1, 1,
-0.9010882, -1.850852, -3.249048, 0, 0, 0, 1, 1,
-0.8899691, 1.030779, 0.09444948, 0, 0, 0, 1, 1,
-0.8886606, 0.8681073, -1.580043, 0, 0, 0, 1, 1,
-0.8859623, -1.327466, -2.649947, 1, 1, 1, 1, 1,
-0.8847498, -0.1683922, -2.902672, 1, 1, 1, 1, 1,
-0.8845806, 0.3643905, -2.200958, 1, 1, 1, 1, 1,
-0.8842106, 0.857093, -2.160761, 1, 1, 1, 1, 1,
-0.8804198, -0.1096388, -2.841486, 1, 1, 1, 1, 1,
-0.8774007, 1.134189, 0.5864665, 1, 1, 1, 1, 1,
-0.8749543, 0.7139976, -0.8807352, 1, 1, 1, 1, 1,
-0.8703839, -1.491682, -3.456491, 1, 1, 1, 1, 1,
-0.8685198, 0.9379774, -1.145453, 1, 1, 1, 1, 1,
-0.8673201, 0.003634469, -2.058882, 1, 1, 1, 1, 1,
-0.8665835, -0.2727935, -3.102773, 1, 1, 1, 1, 1,
-0.8632681, 0.994668, -0.5280821, 1, 1, 1, 1, 1,
-0.8630031, 1.780082, 0.7349608, 1, 1, 1, 1, 1,
-0.8619571, 0.9141265, 1.452137, 1, 1, 1, 1, 1,
-0.8608962, 0.2196704, -0.3438697, 1, 1, 1, 1, 1,
-0.8582849, 1.294872, 0.6894595, 0, 0, 1, 1, 1,
-0.8541275, 0.900053, -1.999999, 1, 0, 0, 1, 1,
-0.8434265, -2.494525, -3.300479, 1, 0, 0, 1, 1,
-0.8405928, -0.2851318, -0.6239832, 1, 0, 0, 1, 1,
-0.8378097, 0.03085896, -1.472897, 1, 0, 0, 1, 1,
-0.8325631, 1.63359, -0.554961, 1, 0, 0, 1, 1,
-0.8310738, -1.42572, -1.864614, 0, 0, 0, 1, 1,
-0.8283527, 1.224136, -1.000702, 0, 0, 0, 1, 1,
-0.8208836, 0.7791278, -0.5474049, 0, 0, 0, 1, 1,
-0.8201111, 0.6669171, -1.843712, 0, 0, 0, 1, 1,
-0.8170386, -0.3166645, -1.210933, 0, 0, 0, 1, 1,
-0.8169895, 0.374006, -0.9459431, 0, 0, 0, 1, 1,
-0.8116452, -0.4062187, -1.560025, 0, 0, 0, 1, 1,
-0.8015583, 0.5639279, -1.026425, 1, 1, 1, 1, 1,
-0.8001455, 0.4445407, -3.85288, 1, 1, 1, 1, 1,
-0.7942535, -1.066605, -2.439876, 1, 1, 1, 1, 1,
-0.7909985, -0.8342236, -4.451539, 1, 1, 1, 1, 1,
-0.7889572, -2.050746, -4.002478, 1, 1, 1, 1, 1,
-0.7868984, -0.37812, -2.623223, 1, 1, 1, 1, 1,
-0.778977, 1.53148, -1.234329, 1, 1, 1, 1, 1,
-0.7757253, 0.4775724, -0.3212594, 1, 1, 1, 1, 1,
-0.76977, 1.693763, -0.5760371, 1, 1, 1, 1, 1,
-0.7691647, -0.4784776, -1.656289, 1, 1, 1, 1, 1,
-0.7654723, -0.3222453, -3.156722, 1, 1, 1, 1, 1,
-0.7649598, 2.309213, 1.139648, 1, 1, 1, 1, 1,
-0.7645595, -0.5414191, -3.62294, 1, 1, 1, 1, 1,
-0.7644912, -0.3547025, -2.101581, 1, 1, 1, 1, 1,
-0.7612225, -0.2022564, -3.49447, 1, 1, 1, 1, 1,
-0.7601288, 0.1912539, -0.08851197, 0, 0, 1, 1, 1,
-0.7542117, 1.223489, -1.609838, 1, 0, 0, 1, 1,
-0.7501907, -0.1768351, -2.986124, 1, 0, 0, 1, 1,
-0.7437027, 1.607163, 0.3082873, 1, 0, 0, 1, 1,
-0.7387156, 0.7343821, 0.6281973, 1, 0, 0, 1, 1,
-0.73426, 1.033962, -0.4833894, 1, 0, 0, 1, 1,
-0.7336464, 0.09816373, -2.533458, 0, 0, 0, 1, 1,
-0.7303829, -0.9837369, -3.093458, 0, 0, 0, 1, 1,
-0.7302625, -0.6552562, -1.925723, 0, 0, 0, 1, 1,
-0.7245983, -1.556536, -3.38121, 0, 0, 0, 1, 1,
-0.7241659, -1.03544, -3.769159, 0, 0, 0, 1, 1,
-0.7143977, -0.21175, -1.089626, 0, 0, 0, 1, 1,
-0.7120229, -0.4044125, -1.04161, 0, 0, 0, 1, 1,
-0.7115671, 0.7064022, -2.423259, 1, 1, 1, 1, 1,
-0.7113301, 0.1393442, -3.037984, 1, 1, 1, 1, 1,
-0.7034928, -1.040308, -1.201658, 1, 1, 1, 1, 1,
-0.7032206, -0.4953547, -4.111495, 1, 1, 1, 1, 1,
-0.7008641, -1.126907, -3.08489, 1, 1, 1, 1, 1,
-0.6909372, 0.9301841, -2.064161, 1, 1, 1, 1, 1,
-0.6906553, -1.697477, -0.381494, 1, 1, 1, 1, 1,
-0.6891834, -0.9101559, -1.025483, 1, 1, 1, 1, 1,
-0.6834088, 0.2193791, -1.049058, 1, 1, 1, 1, 1,
-0.6757116, -1.964409, -2.427784, 1, 1, 1, 1, 1,
-0.6727291, 0.7768781, -1.431441, 1, 1, 1, 1, 1,
-0.6707653, -0.2381656, -1.695485, 1, 1, 1, 1, 1,
-0.6704394, -1.552489, -1.603788, 1, 1, 1, 1, 1,
-0.6672672, -0.9461983, -0.7937337, 1, 1, 1, 1, 1,
-0.667182, 1.331299, -0.2174211, 1, 1, 1, 1, 1,
-0.6626735, 0.5190553, -0.8453164, 0, 0, 1, 1, 1,
-0.6584045, 0.3611499, 0.4084436, 1, 0, 0, 1, 1,
-0.6556504, 0.02052027, -1.385252, 1, 0, 0, 1, 1,
-0.6491396, -0.3018276, -0.2709567, 1, 0, 0, 1, 1,
-0.6483805, 0.2808931, -0.2319511, 1, 0, 0, 1, 1,
-0.6460456, -1.419174, -3.00522, 1, 0, 0, 1, 1,
-0.6421322, 1.1503, -0.5022647, 0, 0, 0, 1, 1,
-0.633502, -0.329761, -2.342072, 0, 0, 0, 1, 1,
-0.6295589, -1.712636, -1.990385, 0, 0, 0, 1, 1,
-0.6277606, -0.474028, -3.097701, 0, 0, 0, 1, 1,
-0.6277503, -2.215568, -2.841107, 0, 0, 0, 1, 1,
-0.6186568, 0.1303752, 0.4286404, 0, 0, 0, 1, 1,
-0.618214, 0.05897219, -1.68432, 0, 0, 0, 1, 1,
-0.616096, 2.038191, -0.9612106, 1, 1, 1, 1, 1,
-0.6129351, 1.030278, -0.5505481, 1, 1, 1, 1, 1,
-0.607555, 0.8255128, 0.9030775, 1, 1, 1, 1, 1,
-0.6036404, -0.8119853, -1.520409, 1, 1, 1, 1, 1,
-0.599728, 0.7969229, -0.8103971, 1, 1, 1, 1, 1,
-0.5993319, 0.2134702, 0.3410055, 1, 1, 1, 1, 1,
-0.5991611, -2.070148, -2.89242, 1, 1, 1, 1, 1,
-0.5991581, -0.3233901, -1.99245, 1, 1, 1, 1, 1,
-0.5950636, -0.8236525, -2.966703, 1, 1, 1, 1, 1,
-0.5950307, -0.2174242, -2.032659, 1, 1, 1, 1, 1,
-0.5915856, 0.6200714, -1.655472, 1, 1, 1, 1, 1,
-0.5910987, 2.011844, 0.3300501, 1, 1, 1, 1, 1,
-0.5904329, -0.4948688, -2.471406, 1, 1, 1, 1, 1,
-0.5819747, 1.882105, -0.05980643, 1, 1, 1, 1, 1,
-0.5769416, -0.8475392, -2.282595, 1, 1, 1, 1, 1,
-0.5754616, -1.786918, -3.354128, 0, 0, 1, 1, 1,
-0.5721146, -0.8645959, -2.883689, 1, 0, 0, 1, 1,
-0.5702666, 0.8544472, -1.080789, 1, 0, 0, 1, 1,
-0.5653521, 0.5947572, -2.298499, 1, 0, 0, 1, 1,
-0.5493951, -1.27126, -2.151527, 1, 0, 0, 1, 1,
-0.5427601, -0.6801031, -3.719089, 1, 0, 0, 1, 1,
-0.5424361, -0.4564529, -0.8080906, 0, 0, 0, 1, 1,
-0.5382356, 0.952662, 0.2783462, 0, 0, 0, 1, 1,
-0.5296869, 0.9566913, 0.2166834, 0, 0, 0, 1, 1,
-0.5285231, 0.4187624, -1.439245, 0, 0, 0, 1, 1,
-0.5109476, 0.3316425, -0.1068132, 0, 0, 0, 1, 1,
-0.4981045, -0.5687962, -1.565372, 0, 0, 0, 1, 1,
-0.4937548, -0.2562338, -1.727556, 0, 0, 0, 1, 1,
-0.4916804, -0.4392865, -1.704201, 1, 1, 1, 1, 1,
-0.4913045, 0.2470903, -0.875349, 1, 1, 1, 1, 1,
-0.4819049, -0.1905929, -2.337914, 1, 1, 1, 1, 1,
-0.4732451, 1.770386, 1.195121, 1, 1, 1, 1, 1,
-0.4720709, -0.2423716, -1.48902, 1, 1, 1, 1, 1,
-0.4696769, 0.3473657, -0.01413741, 1, 1, 1, 1, 1,
-0.4674207, -1.123179, -3.145816, 1, 1, 1, 1, 1,
-0.4657914, 0.8847438, -0.3653734, 1, 1, 1, 1, 1,
-0.4650844, 2.299495, -0.521973, 1, 1, 1, 1, 1,
-0.4638279, 0.2525124, -2.909948, 1, 1, 1, 1, 1,
-0.463327, -0.9908428, -4.328532, 1, 1, 1, 1, 1,
-0.4625214, 0.1790364, -1.809044, 1, 1, 1, 1, 1,
-0.461253, 0.4715718, 1.066329, 1, 1, 1, 1, 1,
-0.4602755, -0.9560583, -5.272671, 1, 1, 1, 1, 1,
-0.4578832, 1.870505, -0.2659316, 1, 1, 1, 1, 1,
-0.4573412, -1.608793, -2.721366, 0, 0, 1, 1, 1,
-0.4565105, -2.153118, -1.315385, 1, 0, 0, 1, 1,
-0.4535139, -2.13544, -2.725219, 1, 0, 0, 1, 1,
-0.4503246, -0.09452601, -1.328437, 1, 0, 0, 1, 1,
-0.4421299, 1.274344, 0.5318156, 1, 0, 0, 1, 1,
-0.433448, -1.03013, -1.50229, 1, 0, 0, 1, 1,
-0.4312921, -0.2119872, -2.796985, 0, 0, 0, 1, 1,
-0.4312157, -0.3421604, -3.149708, 0, 0, 0, 1, 1,
-0.4303281, -0.6624354, -2.455422, 0, 0, 0, 1, 1,
-0.426455, 0.3894307, -0.6971691, 0, 0, 0, 1, 1,
-0.4245403, 0.08712494, -1.262672, 0, 0, 0, 1, 1,
-0.4233868, 0.3658581, 0.02910946, 0, 0, 0, 1, 1,
-0.4226675, 1.001302, -0.9724703, 0, 0, 0, 1, 1,
-0.4225806, 1.271881, 0.6942793, 1, 1, 1, 1, 1,
-0.4217635, 2.031086, -0.4452787, 1, 1, 1, 1, 1,
-0.4181347, -0.3046068, -3.956024, 1, 1, 1, 1, 1,
-0.409468, -1.652916, -3.582716, 1, 1, 1, 1, 1,
-0.4085822, -2.227089, -4.370026, 1, 1, 1, 1, 1,
-0.404409, -0.385025, -2.688306, 1, 1, 1, 1, 1,
-0.3988628, -0.9101611, -1.684086, 1, 1, 1, 1, 1,
-0.3980827, -1.044227, -1.44277, 1, 1, 1, 1, 1,
-0.3917435, -0.02375117, -1.346309, 1, 1, 1, 1, 1,
-0.3897518, 1.098263, 0.3642223, 1, 1, 1, 1, 1,
-0.3883787, 0.06612516, 0.2629873, 1, 1, 1, 1, 1,
-0.3870845, -1.238152, -2.619246, 1, 1, 1, 1, 1,
-0.3844322, 0.5812325, -0.3910689, 1, 1, 1, 1, 1,
-0.3774283, -0.3938959, -2.968594, 1, 1, 1, 1, 1,
-0.3672245, -0.00254061, -1.256715, 1, 1, 1, 1, 1,
-0.3642024, -0.6231765, -2.394217, 0, 0, 1, 1, 1,
-0.3635382, 1.590083, -1.127903, 1, 0, 0, 1, 1,
-0.3632261, -1.559256, -2.097956, 1, 0, 0, 1, 1,
-0.3625928, 0.6166624, -0.154575, 1, 0, 0, 1, 1,
-0.3581264, -1.13994, -3.689672, 1, 0, 0, 1, 1,
-0.3554391, -0.5840739, -2.0962, 1, 0, 0, 1, 1,
-0.3542896, -0.4515628, -2.650383, 0, 0, 0, 1, 1,
-0.3515539, 1.134683, 0.1996436, 0, 0, 0, 1, 1,
-0.342785, -0.02940567, -1.059516, 0, 0, 0, 1, 1,
-0.3385898, -1.275988, -3.503427, 0, 0, 0, 1, 1,
-0.3369172, 0.4936557, 0.6251299, 0, 0, 0, 1, 1,
-0.3367944, 0.2245826, -1.080867, 0, 0, 0, 1, 1,
-0.3320022, 0.950373, -1.646306, 0, 0, 0, 1, 1,
-0.3292817, -0.7388489, -1.625588, 1, 1, 1, 1, 1,
-0.327848, 0.7777182, -0.702107, 1, 1, 1, 1, 1,
-0.3158096, -0.3298639, -1.647696, 1, 1, 1, 1, 1,
-0.3120763, 0.7609891, -0.4326669, 1, 1, 1, 1, 1,
-0.3105292, -2.607737, -2.759051, 1, 1, 1, 1, 1,
-0.3103812, -1.062151, -3.000368, 1, 1, 1, 1, 1,
-0.3098041, 1.251727, -0.6259153, 1, 1, 1, 1, 1,
-0.3072906, -1.061825, -4.247018, 1, 1, 1, 1, 1,
-0.3050306, 1.44242, 0.3817851, 1, 1, 1, 1, 1,
-0.3037216, 0.820099, 0.3348643, 1, 1, 1, 1, 1,
-0.3035441, -0.6816959, -4.48688, 1, 1, 1, 1, 1,
-0.296419, 0.9026913, 0.3570233, 1, 1, 1, 1, 1,
-0.2960717, 0.9023384, 0.7564172, 1, 1, 1, 1, 1,
-0.2954763, 0.4786385, -0.4293992, 1, 1, 1, 1, 1,
-0.2944236, 1.590515, 0.6345173, 1, 1, 1, 1, 1,
-0.2921433, 1.031262, -0.492338, 0, 0, 1, 1, 1,
-0.2896906, -0.2306386, -2.501334, 1, 0, 0, 1, 1,
-0.2895955, -1.534866, -2.761085, 1, 0, 0, 1, 1,
-0.2876657, 0.9898767, -0.06460175, 1, 0, 0, 1, 1,
-0.2865016, 0.1731988, 0.008526415, 1, 0, 0, 1, 1,
-0.2864297, 0.9657338, -0.1071348, 1, 0, 0, 1, 1,
-0.2846205, 0.1512369, -2.060229, 0, 0, 0, 1, 1,
-0.2812981, 0.1453149, -2.422065, 0, 0, 0, 1, 1,
-0.2805125, -0.8056553, -1.939197, 0, 0, 0, 1, 1,
-0.2793678, 0.3444959, -0.5270662, 0, 0, 0, 1, 1,
-0.2763466, -0.770372, -2.619132, 0, 0, 0, 1, 1,
-0.2758932, 0.7551757, -0.7357351, 0, 0, 0, 1, 1,
-0.2744825, 0.4377617, -2.62745, 0, 0, 0, 1, 1,
-0.2719207, 0.9483415, -0.01875942, 1, 1, 1, 1, 1,
-0.2701039, -0.2658996, -1.005275, 1, 1, 1, 1, 1,
-0.2690923, -0.01704191, -2.350439, 1, 1, 1, 1, 1,
-0.2675354, 0.1885612, -2.704114, 1, 1, 1, 1, 1,
-0.2672923, -0.7081657, -3.513079, 1, 1, 1, 1, 1,
-0.2669619, -0.9276273, -3.766014, 1, 1, 1, 1, 1,
-0.2566204, 0.2604944, 0.5828413, 1, 1, 1, 1, 1,
-0.253096, 0.5399761, 0.3881578, 1, 1, 1, 1, 1,
-0.2409838, 0.4988889, -1.211581, 1, 1, 1, 1, 1,
-0.2344398, 0.913716, -0.4998046, 1, 1, 1, 1, 1,
-0.2338295, -0.4118136, -2.943825, 1, 1, 1, 1, 1,
-0.2311799, 0.4016641, -0.2997065, 1, 1, 1, 1, 1,
-0.2283247, 0.2736261, 0.1585903, 1, 1, 1, 1, 1,
-0.2265396, -0.0894507, -3.706483, 1, 1, 1, 1, 1,
-0.2157406, -0.07714383, -1.951532, 1, 1, 1, 1, 1,
-0.2148603, 0.6216368, -1.240887, 0, 0, 1, 1, 1,
-0.2140636, -0.0340839, -3.902516, 1, 0, 0, 1, 1,
-0.2089675, 0.4851998, 1.462301, 1, 0, 0, 1, 1,
-0.2080535, -0.02926471, -2.604828, 1, 0, 0, 1, 1,
-0.2061277, 0.3530878, -0.9760134, 1, 0, 0, 1, 1,
-0.2034855, 0.2516843, 0.1897974, 1, 0, 0, 1, 1,
-0.2024568, 0.9528605, 0.1807478, 0, 0, 0, 1, 1,
-0.1986377, 1.875332, -0.04256519, 0, 0, 0, 1, 1,
-0.1986013, 0.3321866, -0.9695356, 0, 0, 0, 1, 1,
-0.1928432, -1.292148, -2.267166, 0, 0, 0, 1, 1,
-0.1928024, 0.1715522, -0.9072737, 0, 0, 0, 1, 1,
-0.1914903, 1.332126, -0.07089223, 0, 0, 0, 1, 1,
-0.1909612, 0.411692, -1.343282, 0, 0, 0, 1, 1,
-0.1900442, -2.081779, -1.595774, 1, 1, 1, 1, 1,
-0.1892947, -0.3885323, -2.762342, 1, 1, 1, 1, 1,
-0.1858497, 2.573475, 1.054316, 1, 1, 1, 1, 1,
-0.1834549, 1.270443, 0.7308372, 1, 1, 1, 1, 1,
-0.1823941, -0.6554624, -2.842604, 1, 1, 1, 1, 1,
-0.181912, -0.8240474, -2.656642, 1, 1, 1, 1, 1,
-0.1806562, 0.3779442, 0.7359502, 1, 1, 1, 1, 1,
-0.179848, 0.143886, 0.3183572, 1, 1, 1, 1, 1,
-0.1745562, 1.486347, 0.8889334, 1, 1, 1, 1, 1,
-0.1716691, -0.03581236, -2.72658, 1, 1, 1, 1, 1,
-0.1659457, 0.03181542, -2.718978, 1, 1, 1, 1, 1,
-0.1641625, -0.5520843, -4.743962, 1, 1, 1, 1, 1,
-0.1633697, 0.3627377, -0.08399737, 1, 1, 1, 1, 1,
-0.1620947, -0.4693011, -3.744665, 1, 1, 1, 1, 1,
-0.1614507, 0.499362, -0.4843589, 1, 1, 1, 1, 1,
-0.1590658, 0.4035857, -0.8955825, 0, 0, 1, 1, 1,
-0.1579363, 0.3990979, -0.7277284, 1, 0, 0, 1, 1,
-0.1563106, 0.1430328, -0.3840002, 1, 0, 0, 1, 1,
-0.1560158, -0.1836406, -3.831412, 1, 0, 0, 1, 1,
-0.1558779, 0.7525163, -1.640962, 1, 0, 0, 1, 1,
-0.1539457, 1.291353, -0.6297394, 1, 0, 0, 1, 1,
-0.1515919, -0.0008078854, -2.033293, 0, 0, 0, 1, 1,
-0.149408, -0.4335305, -2.550546, 0, 0, 0, 1, 1,
-0.1479912, -0.5636958, -1.817495, 0, 0, 0, 1, 1,
-0.1471233, 1.478982, -0.8379884, 0, 0, 0, 1, 1,
-0.1443839, 0.4571256, -0.7275811, 0, 0, 0, 1, 1,
-0.1371356, 0.4310958, -1.165871, 0, 0, 0, 1, 1,
-0.1366612, -0.8627393, -3.995019, 0, 0, 0, 1, 1,
-0.133299, 0.03775699, -0.4857615, 1, 1, 1, 1, 1,
-0.1313451, 0.1941772, -1.715138, 1, 1, 1, 1, 1,
-0.1285468, 1.555644, 1.244097, 1, 1, 1, 1, 1,
-0.1227205, -0.7570598, -3.797671, 1, 1, 1, 1, 1,
-0.1219922, 2.218411, 0.009125635, 1, 1, 1, 1, 1,
-0.1219666, -1.352413, -1.927906, 1, 1, 1, 1, 1,
-0.1198235, -0.434314, -3.123206, 1, 1, 1, 1, 1,
-0.1152651, 0.7618966, -0.2214191, 1, 1, 1, 1, 1,
-0.1092175, -1.463911, -3.79305, 1, 1, 1, 1, 1,
-0.1091285, 1.170927, -0.2024914, 1, 1, 1, 1, 1,
-0.1079615, 1.456634, -1.4, 1, 1, 1, 1, 1,
-0.1057459, -0.4078877, -3.645198, 1, 1, 1, 1, 1,
-0.105238, 0.2333695, -0.3021688, 1, 1, 1, 1, 1,
-0.1045946, 0.3173011, -0.1890391, 1, 1, 1, 1, 1,
-0.1031605, -0.08987365, -4.071484, 1, 1, 1, 1, 1,
-0.1014731, 0.4064368, -1.502079, 0, 0, 1, 1, 1,
-0.09944351, -1.029927, -4.173085, 1, 0, 0, 1, 1,
-0.09156507, -0.6752154, -3.341965, 1, 0, 0, 1, 1,
-0.09156419, -0.9039189, -2.345495, 1, 0, 0, 1, 1,
-0.08931512, 0.1478781, -0.1220952, 1, 0, 0, 1, 1,
-0.08888203, 1.962274, -0.3259232, 1, 0, 0, 1, 1,
-0.08786967, 0.001385956, 0.3660591, 0, 0, 0, 1, 1,
-0.08245781, 0.01979254, -1.280399, 0, 0, 0, 1, 1,
-0.07891175, 1.645396, -0.06152287, 0, 0, 0, 1, 1,
-0.07841276, 1.081835, 0.094728, 0, 0, 0, 1, 1,
-0.07552247, -0.07333031, -2.320322, 0, 0, 0, 1, 1,
-0.07476263, -1.589884, -2.219675, 0, 0, 0, 1, 1,
-0.06928617, 2.518933, -1.18158, 0, 0, 0, 1, 1,
-0.06861547, 0.3057173, 0.5892068, 1, 1, 1, 1, 1,
-0.06550533, -0.6391531, -4.816531, 1, 1, 1, 1, 1,
-0.06535536, 0.1799881, -0.5179628, 1, 1, 1, 1, 1,
-0.05990895, 0.2556668, 0.3029096, 1, 1, 1, 1, 1,
-0.05869385, -0.2300299, -2.906894, 1, 1, 1, 1, 1,
-0.05812183, 1.147222, -0.2845083, 1, 1, 1, 1, 1,
-0.05802566, -1.143503, -1.880351, 1, 1, 1, 1, 1,
-0.05656463, -0.6563594, -2.249863, 1, 1, 1, 1, 1,
-0.04970904, 0.4837186, -1.176189, 1, 1, 1, 1, 1,
-0.03458009, -0.963925, -2.238025, 1, 1, 1, 1, 1,
-0.03406409, -0.6411089, -2.071923, 1, 1, 1, 1, 1,
-0.03376421, -0.128648, -2.989708, 1, 1, 1, 1, 1,
-0.03256191, -0.3104488, -3.668328, 1, 1, 1, 1, 1,
-0.02912721, -0.9192003, -3.930627, 1, 1, 1, 1, 1,
-0.02899083, 1.348098, 0.2785769, 1, 1, 1, 1, 1,
-0.02764718, 0.8867107, -0.7696324, 0, 0, 1, 1, 1,
-0.02607415, 0.8898664, 0.1487749, 1, 0, 0, 1, 1,
-0.02530273, -0.9249812, -1.449179, 1, 0, 0, 1, 1,
-0.02199489, 1.40517, 0.9622545, 1, 0, 0, 1, 1,
-0.02145656, 1.636825, -2.158679, 1, 0, 0, 1, 1,
-0.01864212, 2.141544, -1.67712, 1, 0, 0, 1, 1,
-0.01470511, -0.06911126, -3.916694, 0, 0, 0, 1, 1,
-0.01174399, 0.9312433, 0.917744, 0, 0, 0, 1, 1,
-0.008884676, -0.5167369, -3.401651, 0, 0, 0, 1, 1,
-0.007396746, 1.804698, 0.8531564, 0, 0, 0, 1, 1,
-0.004685637, -0.4118562, -2.764647, 0, 0, 0, 1, 1,
-0.004198491, 1.859442, -2.008529, 0, 0, 0, 1, 1,
-0.003952576, -0.2770508, -2.989542, 0, 0, 0, 1, 1,
-0.002607282, -0.9572816, -3.999528, 1, 1, 1, 1, 1,
-0.002175245, -0.4812398, -2.766317, 1, 1, 1, 1, 1,
-0.001583248, -2.383306, -4.853565, 1, 1, 1, 1, 1,
0.008084341, 0.9493977, 0.5647981, 1, 1, 1, 1, 1,
0.0158588, 0.05001557, 0.4209937, 1, 1, 1, 1, 1,
0.01916897, -2.397544, 3.165996, 1, 1, 1, 1, 1,
0.0201479, -0.3884954, 1.999628, 1, 1, 1, 1, 1,
0.02143744, 0.7892689, 1.45414, 1, 1, 1, 1, 1,
0.02409225, 0.4116659, -1.198772, 1, 1, 1, 1, 1,
0.0242758, 0.453642, -1.398701, 1, 1, 1, 1, 1,
0.02585427, -0.445103, 3.392116, 1, 1, 1, 1, 1,
0.02661253, -0.497997, 2.70908, 1, 1, 1, 1, 1,
0.02827251, 0.06405215, -0.1442104, 1, 1, 1, 1, 1,
0.02901985, -0.9784715, 3.86044, 1, 1, 1, 1, 1,
0.02963533, -0.9836675, 1.837862, 1, 1, 1, 1, 1,
0.03022155, -2.027068, 3.225328, 0, 0, 1, 1, 1,
0.03196322, 0.2801318, 0.6465707, 1, 0, 0, 1, 1,
0.034181, -0.08974644, 2.030598, 1, 0, 0, 1, 1,
0.03548297, -0.7552092, 3.667287, 1, 0, 0, 1, 1,
0.03601148, -0.1559678, 1.627383, 1, 0, 0, 1, 1,
0.03635637, 0.9053302, -0.309287, 1, 0, 0, 1, 1,
0.0364452, 0.5304607, 1.361631, 0, 0, 0, 1, 1,
0.03650389, 0.397164, 0.9040961, 0, 0, 0, 1, 1,
0.03742009, -0.04866929, 3.707578, 0, 0, 0, 1, 1,
0.03990754, -0.9354266, 4.732564, 0, 0, 0, 1, 1,
0.04166508, -1.794174, 1.375871, 0, 0, 0, 1, 1,
0.04337384, 0.6874048, -1.063402, 0, 0, 0, 1, 1,
0.04435274, 0.421481, 2.734154, 0, 0, 0, 1, 1,
0.04732213, 1.087786, -1.314397, 1, 1, 1, 1, 1,
0.05234592, 0.2998072, -2.002236, 1, 1, 1, 1, 1,
0.05854572, -1.1358, 2.813979, 1, 1, 1, 1, 1,
0.05960063, 1.589542, 0.7820619, 1, 1, 1, 1, 1,
0.06259767, 2.236248, 0.6298388, 1, 1, 1, 1, 1,
0.06891514, -1.040431, 3.747319, 1, 1, 1, 1, 1,
0.06981602, 0.3195405, -0.1831443, 1, 1, 1, 1, 1,
0.07177643, -1.326547, 4.199836, 1, 1, 1, 1, 1,
0.07613367, -1.267539, 4.564587, 1, 1, 1, 1, 1,
0.07890975, 0.6507708, -0.9594769, 1, 1, 1, 1, 1,
0.07933332, -1.042898, 2.57697, 1, 1, 1, 1, 1,
0.0824371, 0.8324642, 0.5292393, 1, 1, 1, 1, 1,
0.0858243, -0.2947644, 2.144424, 1, 1, 1, 1, 1,
0.09017786, 0.8912101, -0.5753754, 1, 1, 1, 1, 1,
0.09262438, 0.5228256, -1.04627, 1, 1, 1, 1, 1,
0.09557319, -2.301428, 2.556576, 0, 0, 1, 1, 1,
0.09568863, -0.88551, 1.319074, 1, 0, 0, 1, 1,
0.0977476, 0.9433442, -0.4557981, 1, 0, 0, 1, 1,
0.1004052, 0.1844978, 0.6066886, 1, 0, 0, 1, 1,
0.1021326, 3.181342, 2.0991, 1, 0, 0, 1, 1,
0.102287, -0.2098936, 1.946243, 1, 0, 0, 1, 1,
0.1027221, 0.991414, 0.2735671, 0, 0, 0, 1, 1,
0.1065717, 0.9646645, -0.1073668, 0, 0, 0, 1, 1,
0.1106697, 0.04121207, 0.7662553, 0, 0, 0, 1, 1,
0.1117684, -0.07853696, 2.169405, 0, 0, 0, 1, 1,
0.1151848, -1.4353, 2.417505, 0, 0, 0, 1, 1,
0.1159109, -0.4969844, 3.316462, 0, 0, 0, 1, 1,
0.1187231, -1.617577, 3.192036, 0, 0, 0, 1, 1,
0.1237053, 0.1754121, -0.2136291, 1, 1, 1, 1, 1,
0.1256358, 0.151021, -0.5252901, 1, 1, 1, 1, 1,
0.1324427, 1.069938, 1.635452, 1, 1, 1, 1, 1,
0.1341816, -1.417274, 1.546282, 1, 1, 1, 1, 1,
0.1342031, -1.389028, 3.92028, 1, 1, 1, 1, 1,
0.1345256, -0.3790123, 2.595282, 1, 1, 1, 1, 1,
0.1365893, 0.7559221, 0.5963181, 1, 1, 1, 1, 1,
0.1371144, 0.428502, 0.04491924, 1, 1, 1, 1, 1,
0.1384175, 0.390572, 0.03217318, 1, 1, 1, 1, 1,
0.1386622, 2.304511, -1.720333, 1, 1, 1, 1, 1,
0.1393468, -0.893204, 2.92312, 1, 1, 1, 1, 1,
0.1429325, -0.1900947, 2.360486, 1, 1, 1, 1, 1,
0.151633, 0.4252231, 1.170819, 1, 1, 1, 1, 1,
0.1596235, 0.5694176, -1.27231, 1, 1, 1, 1, 1,
0.160689, -0.2518888, 3.563822, 1, 1, 1, 1, 1,
0.1613637, -1.334945, 3.670566, 0, 0, 1, 1, 1,
0.1633405, -1.004551, 5.80668, 1, 0, 0, 1, 1,
0.1652071, -0.100064, 2.417936, 1, 0, 0, 1, 1,
0.1663376, 1.277516, 0.4527067, 1, 0, 0, 1, 1,
0.1675244, -1.000284, 3.663977, 1, 0, 0, 1, 1,
0.1678742, 1.538089, -0.1657329, 1, 0, 0, 1, 1,
0.1732258, -0.4139456, 3.085951, 0, 0, 0, 1, 1,
0.1736871, 1.492289, -0.96165, 0, 0, 0, 1, 1,
0.1776816, -0.5165952, 2.244906, 0, 0, 0, 1, 1,
0.1789414, 1.040969, 0.05268062, 0, 0, 0, 1, 1,
0.1790862, -0.5933687, 2.389266, 0, 0, 0, 1, 1,
0.1826077, -1.725698, 2.549059, 0, 0, 0, 1, 1,
0.189257, -0.3411261, 1.743509, 0, 0, 0, 1, 1,
0.1905294, -0.4721914, 3.035315, 1, 1, 1, 1, 1,
0.191791, -1.036649, 3.389118, 1, 1, 1, 1, 1,
0.1937284, 0.7758782, 1.677806, 1, 1, 1, 1, 1,
0.1957516, -0.9701736, 4.139822, 1, 1, 1, 1, 1,
0.20055, -1.253258, 1.737398, 1, 1, 1, 1, 1,
0.203073, 0.3853801, 0.1461953, 1, 1, 1, 1, 1,
0.2037548, -1.047636, 1.933731, 1, 1, 1, 1, 1,
0.2072366, 0.4456229, 0.933631, 1, 1, 1, 1, 1,
0.2089168, -0.1834804, 3.033046, 1, 1, 1, 1, 1,
0.2103462, 0.8545412, -0.2522582, 1, 1, 1, 1, 1,
0.2104292, 0.2825035, -0.3841683, 1, 1, 1, 1, 1,
0.2110486, -0.6494973, 4.10067, 1, 1, 1, 1, 1,
0.2161884, 0.4903773, -1.345255, 1, 1, 1, 1, 1,
0.217707, -0.3030173, 3.065669, 1, 1, 1, 1, 1,
0.2181354, 0.1761723, 1.755813, 1, 1, 1, 1, 1,
0.220217, -0.736543, 3.340526, 0, 0, 1, 1, 1,
0.2249825, 0.7050148, -0.428362, 1, 0, 0, 1, 1,
0.2268017, 1.573614, -0.3215407, 1, 0, 0, 1, 1,
0.2281848, -0.4734236, 1.951991, 1, 0, 0, 1, 1,
0.2401551, -1.23884, 3.005048, 1, 0, 0, 1, 1,
0.2450787, 0.001975327, 0.2395189, 1, 0, 0, 1, 1,
0.2479604, 0.6045768, 0.2681731, 0, 0, 0, 1, 1,
0.2482784, -0.9738013, 1.905823, 0, 0, 0, 1, 1,
0.2497823, 0.1654531, 0.1578711, 0, 0, 0, 1, 1,
0.2524862, -0.06560682, 0.09631106, 0, 0, 0, 1, 1,
0.2546423, -0.9744354, 1.788299, 0, 0, 0, 1, 1,
0.2617612, 0.7592583, 1.697921, 0, 0, 0, 1, 1,
0.263737, -0.505417, 4.214479, 0, 0, 0, 1, 1,
0.2645536, -0.1796969, 3.271726, 1, 1, 1, 1, 1,
0.2645593, 0.3203278, 0.680941, 1, 1, 1, 1, 1,
0.2651792, -0.9918131, 2.779723, 1, 1, 1, 1, 1,
0.2667252, 1.114671, -1.028518, 1, 1, 1, 1, 1,
0.2668076, 0.07084966, 2.508168, 1, 1, 1, 1, 1,
0.2769721, -0.8070698, 3.367348, 1, 1, 1, 1, 1,
0.2777092, -0.8860524, 1.497667, 1, 1, 1, 1, 1,
0.2785991, -0.7456576, 2.049387, 1, 1, 1, 1, 1,
0.2830426, 2.065601, 0.7871586, 1, 1, 1, 1, 1,
0.2860804, 0.08801562, 0.3899988, 1, 1, 1, 1, 1,
0.2861676, 0.7200521, 0.2240013, 1, 1, 1, 1, 1,
0.2893979, 0.7124569, 1.383661, 1, 1, 1, 1, 1,
0.2922608, -1.825012, 3.244393, 1, 1, 1, 1, 1,
0.2927736, -1.191227, 3.908346, 1, 1, 1, 1, 1,
0.2957713, 0.3057228, 2.09397, 1, 1, 1, 1, 1,
0.3001861, 0.1706658, 1.869077, 0, 0, 1, 1, 1,
0.3004355, 0.2340924, 0.5147629, 1, 0, 0, 1, 1,
0.3005726, 0.8570356, -0.6983696, 1, 0, 0, 1, 1,
0.3042459, 0.7700244, -0.1397625, 1, 0, 0, 1, 1,
0.3061717, 1.913002, 0.6565912, 1, 0, 0, 1, 1,
0.315484, 1.660177, -0.9689559, 1, 0, 0, 1, 1,
0.3311513, -1.302298, 3.255727, 0, 0, 0, 1, 1,
0.3317889, 0.9917999, -0.110602, 0, 0, 0, 1, 1,
0.337446, -1.124827, 4.016793, 0, 0, 0, 1, 1,
0.3386485, -0.6437246, 2.374759, 0, 0, 0, 1, 1,
0.339026, -2.033643, 2.356993, 0, 0, 0, 1, 1,
0.342147, -0.3188557, 3.017794, 0, 0, 0, 1, 1,
0.3461519, -0.1240983, 0.9256694, 0, 0, 0, 1, 1,
0.3496328, 0.5589995, 1.537609, 1, 1, 1, 1, 1,
0.3500593, -1.315112, 1.240117, 1, 1, 1, 1, 1,
0.353812, 2.834394, 0.8281243, 1, 1, 1, 1, 1,
0.3571893, 0.9613942, 1.892953, 1, 1, 1, 1, 1,
0.3573092, -0.7884295, 2.971911, 1, 1, 1, 1, 1,
0.3621507, -2.111867, 2.83556, 1, 1, 1, 1, 1,
0.3668861, -0.7195009, 4.268497, 1, 1, 1, 1, 1,
0.3670901, 0.4059283, 1.001039, 1, 1, 1, 1, 1,
0.3710296, 0.1529094, 1.624096, 1, 1, 1, 1, 1,
0.3743926, 0.6080594, 2.021339, 1, 1, 1, 1, 1,
0.376004, -1.590249, 3.421115, 1, 1, 1, 1, 1,
0.3811959, -0.1297996, 0.3465142, 1, 1, 1, 1, 1,
0.3816474, 2.191934, 2.129013, 1, 1, 1, 1, 1,
0.3831024, -0.5803083, 2.04405, 1, 1, 1, 1, 1,
0.3838908, -1.159839, 1.242297, 1, 1, 1, 1, 1,
0.3904789, 0.08647792, 2.225534, 0, 0, 1, 1, 1,
0.4018615, -0.1725686, 3.540075, 1, 0, 0, 1, 1,
0.403971, 0.2482677, 0.07288427, 1, 0, 0, 1, 1,
0.4055976, 0.9164036, 0.4178861, 1, 0, 0, 1, 1,
0.4061339, 1.839966, 0.9205069, 1, 0, 0, 1, 1,
0.4084358, 2.567121, -0.7462036, 1, 0, 0, 1, 1,
0.4109412, 1.298954, 0.4471008, 0, 0, 0, 1, 1,
0.4128427, -0.01484861, 1.015896, 0, 0, 0, 1, 1,
0.4183377, 0.4792988, 1.812204, 0, 0, 0, 1, 1,
0.4187166, 0.824841, 0.4628922, 0, 0, 0, 1, 1,
0.4251863, 0.2926468, -0.08064584, 0, 0, 0, 1, 1,
0.4263857, 1.178166, 0.04212051, 0, 0, 0, 1, 1,
0.4305776, 0.6887828, 0.6232432, 0, 0, 0, 1, 1,
0.4310913, -1.087563, 4.133316, 1, 1, 1, 1, 1,
0.4354703, 1.192776, 1.845209, 1, 1, 1, 1, 1,
0.4397624, -1.090204, 2.397688, 1, 1, 1, 1, 1,
0.4499548, -0.7428949, 2.779241, 1, 1, 1, 1, 1,
0.4540627, -1.941936, 2.484013, 1, 1, 1, 1, 1,
0.4591078, -1.078743, 1.752246, 1, 1, 1, 1, 1,
0.4625193, 1.406215, 0.5584984, 1, 1, 1, 1, 1,
0.46268, 1.247148, 0.909804, 1, 1, 1, 1, 1,
0.4698051, -0.07235237, 0.9243428, 1, 1, 1, 1, 1,
0.4705938, 0.9354795, 1.214505, 1, 1, 1, 1, 1,
0.4756643, 0.2590022, 1.763065, 1, 1, 1, 1, 1,
0.4762128, -0.1276751, 0.0005060676, 1, 1, 1, 1, 1,
0.4794442, 1.486228, 0.5472647, 1, 1, 1, 1, 1,
0.4852224, 0.5702815, 1.28505, 1, 1, 1, 1, 1,
0.4857896, 0.8185238, 0.2763433, 1, 1, 1, 1, 1,
0.4908204, -1.11513, 4.207971, 0, 0, 1, 1, 1,
0.4922308, -0.9577172, 1.376642, 1, 0, 0, 1, 1,
0.4946078, -1.935034, 2.538836, 1, 0, 0, 1, 1,
0.5026765, 0.3652251, 2.704442, 1, 0, 0, 1, 1,
0.5033668, -0.3582281, 2.815447, 1, 0, 0, 1, 1,
0.5220894, -0.2079941, 2.383368, 1, 0, 0, 1, 1,
0.5239658, -0.6461554, 2.07575, 0, 0, 0, 1, 1,
0.5349163, 0.992714, 0.2420706, 0, 0, 0, 1, 1,
0.5380962, -0.05590358, 3.345984, 0, 0, 0, 1, 1,
0.5517265, -0.1394801, 4.186926, 0, 0, 0, 1, 1,
0.555989, 0.2671691, 1.100671, 0, 0, 0, 1, 1,
0.5604007, -0.08475327, 3.034222, 0, 0, 0, 1, 1,
0.5611921, 0.4726152, 1.209628, 0, 0, 0, 1, 1,
0.5632067, 0.2764478, -0.2689469, 1, 1, 1, 1, 1,
0.5658083, -2.007675, 3.118736, 1, 1, 1, 1, 1,
0.5668337, -0.09674232, 1.14414, 1, 1, 1, 1, 1,
0.5696819, -0.4379551, 2.535271, 1, 1, 1, 1, 1,
0.5697948, 1.56554, 1.691634, 1, 1, 1, 1, 1,
0.5812815, -0.6872112, 3.655267, 1, 1, 1, 1, 1,
0.5838819, -0.6596941, 3.49108, 1, 1, 1, 1, 1,
0.5859859, -0.4629922, 2.206978, 1, 1, 1, 1, 1,
0.5861306, -2.055085, 3.833548, 1, 1, 1, 1, 1,
0.5863046, 0.5765847, 0.3394216, 1, 1, 1, 1, 1,
0.5970529, -0.8383667, 4.753533, 1, 1, 1, 1, 1,
0.6000825, 0.3644933, 1.350636, 1, 1, 1, 1, 1,
0.6042943, 0.5168242, 1.735797, 1, 1, 1, 1, 1,
0.6083966, 0.9137993, 0.03019604, 1, 1, 1, 1, 1,
0.6095757, 0.3570982, 0.6978859, 1, 1, 1, 1, 1,
0.6128243, -0.4748692, 3.362684, 0, 0, 1, 1, 1,
0.6160584, -1.563521, 3.316769, 1, 0, 0, 1, 1,
0.6172298, -0.3572788, 1.547626, 1, 0, 0, 1, 1,
0.6172561, 0.8242073, -0.8276662, 1, 0, 0, 1, 1,
0.62051, 2.943185, 0.1576566, 1, 0, 0, 1, 1,
0.631595, -0.1809502, 0.7318827, 1, 0, 0, 1, 1,
0.6321092, -0.9354348, 3.132271, 0, 0, 0, 1, 1,
0.6339797, 0.2495001, 3.963443, 0, 0, 0, 1, 1,
0.6382241, -1.817687, 1.695521, 0, 0, 0, 1, 1,
0.6386722, 1.668016, 0.5925521, 0, 0, 0, 1, 1,
0.6388123, -1.439268, 0.7879674, 0, 0, 0, 1, 1,
0.6498074, -1.022115, 1.236431, 0, 0, 0, 1, 1,
0.6510879, 0.08931563, 1.63392, 0, 0, 0, 1, 1,
0.6527507, -0.8294243, 4.395072, 1, 1, 1, 1, 1,
0.6547079, -0.4091904, 1.509033, 1, 1, 1, 1, 1,
0.654731, -0.7227895, 2.670295, 1, 1, 1, 1, 1,
0.6598703, -0.4531941, 2.530393, 1, 1, 1, 1, 1,
0.6622295, -1.771562, 1.141205, 1, 1, 1, 1, 1,
0.6630898, -0.4371443, 2.192398, 1, 1, 1, 1, 1,
0.6634644, 2.102378, 0.2761591, 1, 1, 1, 1, 1,
0.6691598, -1.622066, 2.975829, 1, 1, 1, 1, 1,
0.6716247, 1.93356, -0.1668095, 1, 1, 1, 1, 1,
0.674049, -0.543955, 3.72154, 1, 1, 1, 1, 1,
0.6748757, 2.593696, 0.3410816, 1, 1, 1, 1, 1,
0.6756431, -0.4730953, 3.240645, 1, 1, 1, 1, 1,
0.6756444, 1.010117, -0.05633358, 1, 1, 1, 1, 1,
0.6759208, 0.4403198, 1.693017, 1, 1, 1, 1, 1,
0.6818874, -0.3812166, 2.638361, 1, 1, 1, 1, 1,
0.6881983, 1.78813, 2.478306, 0, 0, 1, 1, 1,
0.697368, 0.825277, 1.025402, 1, 0, 0, 1, 1,
0.7034203, -0.129297, 2.250061, 1, 0, 0, 1, 1,
0.7043748, 0.4924239, -0.06991095, 1, 0, 0, 1, 1,
0.7077096, -0.5222254, 2.063675, 1, 0, 0, 1, 1,
0.7118001, -0.08498542, 1.882922, 1, 0, 0, 1, 1,
0.7144662, -1.200406, 1.980778, 0, 0, 0, 1, 1,
0.7152959, 0.951592, 0.683946, 0, 0, 0, 1, 1,
0.718551, -0.2781376, -0.5868313, 0, 0, 0, 1, 1,
0.7197498, 0.2628566, 0.768256, 0, 0, 0, 1, 1,
0.7240196, 1.211781, -0.1056312, 0, 0, 0, 1, 1,
0.726217, -1.382283, 3.222004, 0, 0, 0, 1, 1,
0.7265397, 0.2581351, -0.1807125, 0, 0, 0, 1, 1,
0.7272254, -0.8552284, 1.727357, 1, 1, 1, 1, 1,
0.7372906, 1.365081, 0.3120756, 1, 1, 1, 1, 1,
0.7440546, 0.194444, 1.770248, 1, 1, 1, 1, 1,
0.7537757, -0.9813138, 1.021142, 1, 1, 1, 1, 1,
0.7578752, 0.4444641, 2.242146, 1, 1, 1, 1, 1,
0.7838187, 0.9660221, 2.136083, 1, 1, 1, 1, 1,
0.7890068, -0.2147935, 3.92676, 1, 1, 1, 1, 1,
0.7965081, -0.6552609, 3.1101, 1, 1, 1, 1, 1,
0.79669, 0.5983879, 0.7255763, 1, 1, 1, 1, 1,
0.7980682, 1.395155, -1.396369, 1, 1, 1, 1, 1,
0.7988079, 0.4935904, 1.629811, 1, 1, 1, 1, 1,
0.7992807, 0.5135551, 2.54407, 1, 1, 1, 1, 1,
0.821974, -0.7204706, 0.0516367, 1, 1, 1, 1, 1,
0.8230523, -0.4833349, 1.453578, 1, 1, 1, 1, 1,
0.8312514, 0.9807026, 1.189241, 1, 1, 1, 1, 1,
0.8364988, -0.9095378, 1.877402, 0, 0, 1, 1, 1,
0.8397202, 0.1192808, 1.14362, 1, 0, 0, 1, 1,
0.8444404, -0.5698456, 0.5677872, 1, 0, 0, 1, 1,
0.8561278, 0.3078854, 0.2311641, 1, 0, 0, 1, 1,
0.856963, 0.7117256, 2.434645, 1, 0, 0, 1, 1,
0.8581332, 1.035801, 0.3515566, 1, 0, 0, 1, 1,
0.8613288, -1.035112, 2.689258, 0, 0, 0, 1, 1,
0.8619754, -0.344267, 1.574132, 0, 0, 0, 1, 1,
0.8638378, 0.3380362, 0.9021004, 0, 0, 0, 1, 1,
0.8640701, -0.1530399, -1.018009, 0, 0, 0, 1, 1,
0.8647681, -1.448345, 3.669889, 0, 0, 0, 1, 1,
0.8698676, -0.5139803, 3.981234, 0, 0, 0, 1, 1,
0.8715085, -0.2152737, 0.8904518, 0, 0, 0, 1, 1,
0.875238, -0.3764767, 2.393474, 1, 1, 1, 1, 1,
0.8822083, -1.409665, 2.689009, 1, 1, 1, 1, 1,
0.8845521, 0.7086425, -0.1697796, 1, 1, 1, 1, 1,
0.8856604, 0.0007922435, 1.269174, 1, 1, 1, 1, 1,
0.895528, 0.2617183, 0.137258, 1, 1, 1, 1, 1,
0.9018145, -0.7243901, 1.984156, 1, 1, 1, 1, 1,
0.9109274, -0.7594255, 1.135248, 1, 1, 1, 1, 1,
0.9137771, -0.3883101, -0.03092038, 1, 1, 1, 1, 1,
0.9183749, -0.4457833, 0.1954976, 1, 1, 1, 1, 1,
0.9202897, -1.013213, 3.410419, 1, 1, 1, 1, 1,
0.9204807, -1.325222, 1.397793, 1, 1, 1, 1, 1,
0.92168, -2.671455, 1.181186, 1, 1, 1, 1, 1,
0.9264912, -0.352838, 1.182992, 1, 1, 1, 1, 1,
0.9265726, -1.644809, 1.663511, 1, 1, 1, 1, 1,
0.9377539, 1.447578, 1.032509, 1, 1, 1, 1, 1,
0.9389285, 1.099024, 0.1440142, 0, 0, 1, 1, 1,
0.9408277, -0.2416029, 0.2854514, 1, 0, 0, 1, 1,
0.9482756, 0.1732058, 2.21843, 1, 0, 0, 1, 1,
0.9540865, 0.7855746, 1.142983, 1, 0, 0, 1, 1,
0.9596479, 0.8369971, 0.7127631, 1, 0, 0, 1, 1,
0.965378, 1.38451, 1.059258, 1, 0, 0, 1, 1,
0.9747093, -1.64003, 4.339237, 0, 0, 0, 1, 1,
0.9755948, -1.364379, 4.730677, 0, 0, 0, 1, 1,
0.9859329, -1.069301, 1.532272, 0, 0, 0, 1, 1,
0.9878957, 0.3422084, -1.209532, 0, 0, 0, 1, 1,
0.9890329, -0.4537228, 3.60612, 0, 0, 0, 1, 1,
0.9935052, -0.230073, 2.296268, 0, 0, 0, 1, 1,
1.012329, -1.408885, 4.044428, 0, 0, 0, 1, 1,
1.013024, -1.330155, 1.087278, 1, 1, 1, 1, 1,
1.015084, 1.025847, -0.07050177, 1, 1, 1, 1, 1,
1.015588, -0.3252341, 1.051559, 1, 1, 1, 1, 1,
1.017152, -0.2457198, 3.294141, 1, 1, 1, 1, 1,
1.019689, -0.3894652, 3.561931, 1, 1, 1, 1, 1,
1.025485, 2.066368, -0.4061378, 1, 1, 1, 1, 1,
1.026218, -0.3930221, 0.6083952, 1, 1, 1, 1, 1,
1.026591, 0.1844206, 0.7863475, 1, 1, 1, 1, 1,
1.035234, -1.640121, 3.67302, 1, 1, 1, 1, 1,
1.036172, 1.462604, 2.46905, 1, 1, 1, 1, 1,
1.03703, -0.459217, 1.558237, 1, 1, 1, 1, 1,
1.039574, -0.1500475, 2.107652, 1, 1, 1, 1, 1,
1.04086, 0.8454505, 0.9022842, 1, 1, 1, 1, 1,
1.047116, 2.080233, -1.119493, 1, 1, 1, 1, 1,
1.048406, -2.162565, 2.093478, 1, 1, 1, 1, 1,
1.049328, -1.792021, 3.180333, 0, 0, 1, 1, 1,
1.054103, -0.133355, 0.802487, 1, 0, 0, 1, 1,
1.059794, -0.3399611, 1.683295, 1, 0, 0, 1, 1,
1.060793, 0.8344974, 2.019421, 1, 0, 0, 1, 1,
1.066161, 0.2050816, 1.863962, 1, 0, 0, 1, 1,
1.076085, 0.8835736, 0.2011014, 1, 0, 0, 1, 1,
1.081277, -1.387686, 0.6320531, 0, 0, 0, 1, 1,
1.082444, 0.3546373, 1.466563, 0, 0, 0, 1, 1,
1.085209, -0.134161, 1.151289, 0, 0, 0, 1, 1,
1.085916, -1.814358, 2.318662, 0, 0, 0, 1, 1,
1.089645, 0.2183923, 1.893348, 0, 0, 0, 1, 1,
1.089696, 1.263223, 1.177826, 0, 0, 0, 1, 1,
1.092135, -0.3320809, 2.712254, 0, 0, 0, 1, 1,
1.097553, -0.07360685, 1.426094, 1, 1, 1, 1, 1,
1.09865, -1.006281, 2.007133, 1, 1, 1, 1, 1,
1.108061, -0.4476112, -0.4056706, 1, 1, 1, 1, 1,
1.113776, -1.481355, 2.236262, 1, 1, 1, 1, 1,
1.114791, -0.2717191, 2.61496, 1, 1, 1, 1, 1,
1.119041, 0.2132658, 1.764571, 1, 1, 1, 1, 1,
1.134671, 0.5681918, 2.301756, 1, 1, 1, 1, 1,
1.148645, -0.968764, 1.586598, 1, 1, 1, 1, 1,
1.153349, 1.384157, 1.171956, 1, 1, 1, 1, 1,
1.15998, 0.2008642, 2.639375, 1, 1, 1, 1, 1,
1.16447, 0.8429357, 1.510466, 1, 1, 1, 1, 1,
1.176392, 0.6295756, 1.970857, 1, 1, 1, 1, 1,
1.17741, 0.03838562, 1.948688, 1, 1, 1, 1, 1,
1.178744, -0.7133527, 2.105431, 1, 1, 1, 1, 1,
1.20101, -1.527974, 3.206074, 1, 1, 1, 1, 1,
1.208157, -1.196507, 3.558158, 0, 0, 1, 1, 1,
1.20869, -0.174184, 1.855776, 1, 0, 0, 1, 1,
1.21339, 1.433304, -0.3324371, 1, 0, 0, 1, 1,
1.217233, 1.666324, -0.5274425, 1, 0, 0, 1, 1,
1.219259, -0.761095, 1.930951, 1, 0, 0, 1, 1,
1.236433, 0.4093858, 2.845125, 1, 0, 0, 1, 1,
1.239185, 0.7016306, 0.9116614, 0, 0, 0, 1, 1,
1.242788, -0.7169157, 1.365812, 0, 0, 0, 1, 1,
1.24406, -0.3252192, 3.011303, 0, 0, 0, 1, 1,
1.247839, -0.09171839, 1.547762, 0, 0, 0, 1, 1,
1.250862, 0.334557, 1.144969, 0, 0, 0, 1, 1,
1.251375, 0.2090358, 3.093354, 0, 0, 0, 1, 1,
1.259535, 0.4247296, 1.379156, 0, 0, 0, 1, 1,
1.263267, -1.66601, 1.998133, 1, 1, 1, 1, 1,
1.268904, 1.481539, 1.708898, 1, 1, 1, 1, 1,
1.274257, -0.1291495, 0.7837757, 1, 1, 1, 1, 1,
1.275483, -1.000579, 3.137228, 1, 1, 1, 1, 1,
1.281066, -0.5744052, 3.439069, 1, 1, 1, 1, 1,
1.282787, -0.5002184, 1.639336, 1, 1, 1, 1, 1,
1.286347, 0.242771, 1.976699, 1, 1, 1, 1, 1,
1.288519, -3.010971, 1.490661, 1, 1, 1, 1, 1,
1.289411, 0.4548448, 1.510106, 1, 1, 1, 1, 1,
1.304615, 0.7940938, 1.41006, 1, 1, 1, 1, 1,
1.310159, -1.713573, 2.314101, 1, 1, 1, 1, 1,
1.312945, 0.809499, 1.753722, 1, 1, 1, 1, 1,
1.317801, 0.9706563, 1.338897, 1, 1, 1, 1, 1,
1.321081, -1.573636, 2.110361, 1, 1, 1, 1, 1,
1.347908, 0.1880504, 1.78322, 1, 1, 1, 1, 1,
1.348808, 0.2775287, 1.013539, 0, 0, 1, 1, 1,
1.359233, 0.02602022, 1.711142, 1, 0, 0, 1, 1,
1.364535, 0.7817783, 3.61503, 1, 0, 0, 1, 1,
1.365308, -0.7916513, 1.70962, 1, 0, 0, 1, 1,
1.371764, -2.030916, 1.653036, 1, 0, 0, 1, 1,
1.372447, 0.004620795, 2.05215, 1, 0, 0, 1, 1,
1.385935, -0.7347775, 2.291644, 0, 0, 0, 1, 1,
1.389465, 0.8709351, -0.3599519, 0, 0, 0, 1, 1,
1.396704, -2.124327, 4.146816, 0, 0, 0, 1, 1,
1.409807, -0.6995428, 1.857933, 0, 0, 0, 1, 1,
1.412897, 1.663885, 1.457948, 0, 0, 0, 1, 1,
1.414108, 0.06445341, 2.044996, 0, 0, 0, 1, 1,
1.424306, -0.1523037, 1.863269, 0, 0, 0, 1, 1,
1.427897, -1.340978, 1.064689, 1, 1, 1, 1, 1,
1.434063, -2.558231, 3.164536, 1, 1, 1, 1, 1,
1.439702, 1.240567, 0.6700912, 1, 1, 1, 1, 1,
1.440921, 1.912732, 0.09731279, 1, 1, 1, 1, 1,
1.447067, -0.6710041, 1.953285, 1, 1, 1, 1, 1,
1.448523, 1.140765, 0.4784363, 1, 1, 1, 1, 1,
1.450943, 0.001647767, 2.537629, 1, 1, 1, 1, 1,
1.452926, -1.185955, 1.644856, 1, 1, 1, 1, 1,
1.45461, -0.1188919, 2.684499, 1, 1, 1, 1, 1,
1.456386, -0.3295336, 2.390395, 1, 1, 1, 1, 1,
1.466622, 0.4881767, -0.1369179, 1, 1, 1, 1, 1,
1.469377, -0.7806587, 2.058145, 1, 1, 1, 1, 1,
1.471536, -1.420018, 1.048414, 1, 1, 1, 1, 1,
1.474625, -1.832761, 1.929131, 1, 1, 1, 1, 1,
1.478896, 0.5431054, 2.519715, 1, 1, 1, 1, 1,
1.485333, 1.746189, 2.623776, 0, 0, 1, 1, 1,
1.490456, -0.3736284, 1.462842, 1, 0, 0, 1, 1,
1.506471, -0.2914601, 1.483457, 1, 0, 0, 1, 1,
1.510506, 1.523991, 0.4034688, 1, 0, 0, 1, 1,
1.521076, -0.6385417, 1.27073, 1, 0, 0, 1, 1,
1.546314, -0.255115, 2.539077, 1, 0, 0, 1, 1,
1.556308, -0.8194925, 1.194161, 0, 0, 0, 1, 1,
1.561281, -0.6881726, 1.48069, 0, 0, 0, 1, 1,
1.579571, 1.197502, -0.2613674, 0, 0, 0, 1, 1,
1.582331, 0.2166636, 0.6476687, 0, 0, 0, 1, 1,
1.630466, 0.7562869, 0.9788422, 0, 0, 0, 1, 1,
1.631551, 0.3122571, 2.07771, 0, 0, 0, 1, 1,
1.644448, 0.9146652, -0.09226733, 0, 0, 0, 1, 1,
1.654344, 1.579943, 1.519693, 1, 1, 1, 1, 1,
1.659949, 0.3902018, -0.09396324, 1, 1, 1, 1, 1,
1.675948, 0.6783791, 0.6936711, 1, 1, 1, 1, 1,
1.687623, 0.5507233, 0.5989442, 1, 1, 1, 1, 1,
1.723607, 0.6914973, -0.3533537, 1, 1, 1, 1, 1,
1.724201, -0.7701806, 4.075455, 1, 1, 1, 1, 1,
1.725312, -0.9833088, 2.699267, 1, 1, 1, 1, 1,
1.725411, -0.09465528, 0.5683025, 1, 1, 1, 1, 1,
1.730545, -0.1751918, 1.732911, 1, 1, 1, 1, 1,
1.732661, 0.5221951, 1.011199, 1, 1, 1, 1, 1,
1.733087, -0.4552817, 2.169939, 1, 1, 1, 1, 1,
1.733328, 0.4059422, -0.4654955, 1, 1, 1, 1, 1,
1.733346, -1.913861, 2.338273, 1, 1, 1, 1, 1,
1.752949, -0.3714688, 1.544386, 1, 1, 1, 1, 1,
1.759852, 2.702507, 0.8006198, 1, 1, 1, 1, 1,
1.763386, -2.829352, 4.204338, 0, 0, 1, 1, 1,
1.765307, -1.710138, 1.00364, 1, 0, 0, 1, 1,
1.782584, 1.304465, 0.6967366, 1, 0, 0, 1, 1,
1.80404, -1.619564, 3.53149, 1, 0, 0, 1, 1,
1.819543, 1.369604, 1.390333, 1, 0, 0, 1, 1,
1.832178, 0.883295, 0.3513384, 1, 0, 0, 1, 1,
1.837376, 2.073637, -0.3923022, 0, 0, 0, 1, 1,
1.85335, 0.2239929, 1.205612, 0, 0, 0, 1, 1,
1.855615, 0.799426, 2.4905, 0, 0, 0, 1, 1,
1.862661, -1.145046, 2.806891, 0, 0, 0, 1, 1,
1.884956, -0.02570118, 2.155456, 0, 0, 0, 1, 1,
1.890231, 0.09368402, 1.736025, 0, 0, 0, 1, 1,
1.891142, 1.680099, 0.1277049, 0, 0, 0, 1, 1,
1.907782, -1.58973, 3.354259, 1, 1, 1, 1, 1,
1.91067, 0.6875283, 0.2292094, 1, 1, 1, 1, 1,
1.912027, 0.1570625, 3.351991, 1, 1, 1, 1, 1,
1.922567, -0.7135838, 3.159359, 1, 1, 1, 1, 1,
1.939597, 1.13164, 1.46534, 1, 1, 1, 1, 1,
1.948118, 0.6256163, 2.12537, 1, 1, 1, 1, 1,
1.953023, -1.023715, 1.18476, 1, 1, 1, 1, 1,
1.968571, 1.62837, 1.987758, 1, 1, 1, 1, 1,
1.969518, -2.104959, 3.504316, 1, 1, 1, 1, 1,
1.988394, -1.853398, 2.147066, 1, 1, 1, 1, 1,
2.001384, 0.5411976, 2.398764, 1, 1, 1, 1, 1,
2.002907, -1.110392, 1.421798, 1, 1, 1, 1, 1,
2.003616, 1.045254, 0.9824771, 1, 1, 1, 1, 1,
2.009317, -0.2023575, 1.023012, 1, 1, 1, 1, 1,
2.027487, 0.8175626, 1.695713, 1, 1, 1, 1, 1,
2.094793, 0.8876277, -0.9510493, 0, 0, 1, 1, 1,
2.108202, -1.690304, 3.025975, 1, 0, 0, 1, 1,
2.12435, 1.713817, 2.355954, 1, 0, 0, 1, 1,
2.131406, 0.1397763, 0.5609484, 1, 0, 0, 1, 1,
2.141881, 0.6042099, 1.782833, 1, 0, 0, 1, 1,
2.142202, 0.7988188, 1.789074, 1, 0, 0, 1, 1,
2.144834, 0.3762122, 0.291027, 0, 0, 0, 1, 1,
2.181085, 0.6808603, -0.09332725, 0, 0, 0, 1, 1,
2.199347, 0.4599695, -0.1146947, 0, 0, 0, 1, 1,
2.274996, -0.5126409, 0.9966753, 0, 0, 0, 1, 1,
2.280296, 0.1274722, 0.4256174, 0, 0, 0, 1, 1,
2.334018, -0.3144163, 3.908235, 0, 0, 0, 1, 1,
2.355664, 1.906356, 0.4861389, 0, 0, 0, 1, 1,
2.404027, 0.6235721, 0.6217787, 1, 1, 1, 1, 1,
2.425286, -0.01804046, 1.635097, 1, 1, 1, 1, 1,
2.477712, 0.9596004, 0.9745867, 1, 1, 1, 1, 1,
2.52183, 0.4251015, 1.545056, 1, 1, 1, 1, 1,
2.64147, 1.43613, 1.1951, 1, 1, 1, 1, 1,
2.687172, 1.778077, 0.1545049, 1, 1, 1, 1, 1,
2.980429, -0.06687862, -0.5115392, 1, 1, 1, 1, 1
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
var radius = 9.583092;
var distance = 33.6602;
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
mvMatrix.translate( 0.06325412, -0.08518553, -0.2670047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6602);
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