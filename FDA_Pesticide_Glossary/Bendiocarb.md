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
-3.390822, -0.05608068, -1.201622, 1, 0, 0, 1,
-3.334783, -1.920917, -3.015294, 1, 0.007843138, 0, 1,
-3.296271, -0.2880273, -0.9526256, 1, 0.01176471, 0, 1,
-3.17379, 0.1945884, -3.145816, 1, 0.01960784, 0, 1,
-2.855592, 0.431032, -0.2113281, 1, 0.02352941, 0, 1,
-2.801095, -1.077068, -5.076676, 1, 0.03137255, 0, 1,
-2.748311, -0.8553228, -0.4852174, 1, 0.03529412, 0, 1,
-2.675996, 0.04438419, -0.7396131, 1, 0.04313726, 0, 1,
-2.637165, -0.2285851, -1.582564, 1, 0.04705882, 0, 1,
-2.617638, 0.3438087, -0.4648871, 1, 0.05490196, 0, 1,
-2.599091, 1.261978, 0.7121235, 1, 0.05882353, 0, 1,
-2.531597, 1.483087, 0.0897223, 1, 0.06666667, 0, 1,
-2.490213, -0.6920826, -0.1350448, 1, 0.07058824, 0, 1,
-2.469797, 0.957539, 0.4142027, 1, 0.07843138, 0, 1,
-2.462889, -0.02467049, -2.460749, 1, 0.08235294, 0, 1,
-2.338486, -0.02712126, -1.039671, 1, 0.09019608, 0, 1,
-2.274837, 0.9256083, -1.646711, 1, 0.09411765, 0, 1,
-2.269112, 0.05552571, -1.877262, 1, 0.1019608, 0, 1,
-2.267443, -0.9302217, -3.184309, 1, 0.1098039, 0, 1,
-2.249883, -0.5613232, -2.081841, 1, 0.1137255, 0, 1,
-2.234076, 0.7271997, 0.8847246, 1, 0.1215686, 0, 1,
-2.21937, 0.1590351, -1.707464, 1, 0.1254902, 0, 1,
-2.207747, 1.897565, 0.1768858, 1, 0.1333333, 0, 1,
-2.180189, 0.8389783, -0.2600906, 1, 0.1372549, 0, 1,
-2.174551, 0.4537647, -1.57076, 1, 0.145098, 0, 1,
-2.168532, -2.471725, -4.271293, 1, 0.1490196, 0, 1,
-2.137377, -0.6682912, -1.461486, 1, 0.1568628, 0, 1,
-2.130263, 0.4093787, -2.345347, 1, 0.1607843, 0, 1,
-2.07951, -0.3066251, -1.696004, 1, 0.1686275, 0, 1,
-2.071245, -0.3833166, -1.516188, 1, 0.172549, 0, 1,
-2.055452, 1.657531, -0.8333487, 1, 0.1803922, 0, 1,
-2.042913, -0.4869298, -1.789264, 1, 0.1843137, 0, 1,
-2.016144, -1.484926, -2.505069, 1, 0.1921569, 0, 1,
-2.006163, -0.5478635, -2.5402, 1, 0.1960784, 0, 1,
-2.004198, -1.969689, -1.521334, 1, 0.2039216, 0, 1,
-2.0026, 0.1142084, -2.48079, 1, 0.2117647, 0, 1,
-1.983416, -0.1414379, -1.638195, 1, 0.2156863, 0, 1,
-1.970893, -0.6070557, -2.031316, 1, 0.2235294, 0, 1,
-1.938303, 0.02326492, -1.804958, 1, 0.227451, 0, 1,
-1.925726, -2.329899, -2.206439, 1, 0.2352941, 0, 1,
-1.898815, -1.068983, -1.272678, 1, 0.2392157, 0, 1,
-1.892636, -0.979454, -2.463007, 1, 0.2470588, 0, 1,
-1.881083, -0.5872529, -2.181029, 1, 0.2509804, 0, 1,
-1.879217, 0.4002895, -0.4237925, 1, 0.2588235, 0, 1,
-1.866739, 0.7299781, -1.563798, 1, 0.2627451, 0, 1,
-1.856294, 1.702149, -0.04415087, 1, 0.2705882, 0, 1,
-1.850872, -2.592804, -1.337053, 1, 0.2745098, 0, 1,
-1.840249, -0.08611165, -1.824883, 1, 0.282353, 0, 1,
-1.833713, 0.0053644, -1.130863, 1, 0.2862745, 0, 1,
-1.794733, 2.052947, -0.7763579, 1, 0.2941177, 0, 1,
-1.781541, -0.8046329, -1.324215, 1, 0.3019608, 0, 1,
-1.779199, -0.6462722, -1.415413, 1, 0.3058824, 0, 1,
-1.7782, -0.3982388, -0.9879347, 1, 0.3137255, 0, 1,
-1.765765, 0.7217345, -0.009265294, 1, 0.3176471, 0, 1,
-1.75218, 0.5589944, -2.003277, 1, 0.3254902, 0, 1,
-1.74447, 0.1978681, -2.048301, 1, 0.3294118, 0, 1,
-1.71764, -1.116287, -3.294799, 1, 0.3372549, 0, 1,
-1.707953, 1.064992, -0.3449754, 1, 0.3411765, 0, 1,
-1.692165, 0.5310201, -1.868986, 1, 0.3490196, 0, 1,
-1.688492, -0.04056206, -2.138335, 1, 0.3529412, 0, 1,
-1.680498, -0.01748674, -2.780921, 1, 0.3607843, 0, 1,
-1.675634, -0.3884844, -2.02712, 1, 0.3647059, 0, 1,
-1.663092, -1.864414, -2.169447, 1, 0.372549, 0, 1,
-1.637489, -0.5972388, -3.216595, 1, 0.3764706, 0, 1,
-1.62066, -0.6799998, -0.9982361, 1, 0.3843137, 0, 1,
-1.595325, 1.065612, -0.03078898, 1, 0.3882353, 0, 1,
-1.587674, 2.46734, -0.7613754, 1, 0.3960784, 0, 1,
-1.577113, 0.6850041, -2.436307, 1, 0.4039216, 0, 1,
-1.576912, -0.6442206, -2.746477, 1, 0.4078431, 0, 1,
-1.564799, 1.64528, 0.3536695, 1, 0.4156863, 0, 1,
-1.560559, 0.5989776, 0.5253967, 1, 0.4196078, 0, 1,
-1.554306, 0.7994246, -0.9778013, 1, 0.427451, 0, 1,
-1.536455, 0.406176, -0.4329667, 1, 0.4313726, 0, 1,
-1.51089, -0.1258153, -3.631135, 1, 0.4392157, 0, 1,
-1.505766, 0.5705582, -1.039164, 1, 0.4431373, 0, 1,
-1.50225, -0.2772796, -3.070278, 1, 0.4509804, 0, 1,
-1.490023, -0.3511373, -0.5550074, 1, 0.454902, 0, 1,
-1.487754, -0.5938596, -0.9553562, 1, 0.4627451, 0, 1,
-1.486632, 0.5350612, -0.4590296, 1, 0.4666667, 0, 1,
-1.486081, 0.1972885, -1.371968, 1, 0.4745098, 0, 1,
-1.460759, -0.1027409, -1.194628, 1, 0.4784314, 0, 1,
-1.459186, 2.339141, -0.3700266, 1, 0.4862745, 0, 1,
-1.450306, -1.142722, -1.245814, 1, 0.4901961, 0, 1,
-1.445635, -0.5884103, -3.268024, 1, 0.4980392, 0, 1,
-1.444104, -0.04651795, -2.623529, 1, 0.5058824, 0, 1,
-1.430915, -0.4185365, -1.649454, 1, 0.509804, 0, 1,
-1.428112, -1.057322, -2.181784, 1, 0.5176471, 0, 1,
-1.424703, -0.1266172, -2.070783, 1, 0.5215687, 0, 1,
-1.422496, -0.1806682, -2.584625, 1, 0.5294118, 0, 1,
-1.42046, -0.3333434, -1.34617, 1, 0.5333334, 0, 1,
-1.420194, -0.6372992, -3.108851, 1, 0.5411765, 0, 1,
-1.414739, 0.2858634, -2.216909, 1, 0.5450981, 0, 1,
-1.406593, 2.992302, 0.8294211, 1, 0.5529412, 0, 1,
-1.404652, -1.120954, -1.262322, 1, 0.5568628, 0, 1,
-1.398376, 1.256635, -0.6635648, 1, 0.5647059, 0, 1,
-1.390956, -1.846718, -2.647237, 1, 0.5686275, 0, 1,
-1.381038, 0.9725027, -0.9363816, 1, 0.5764706, 0, 1,
-1.378038, -2.509483, -2.968908, 1, 0.5803922, 0, 1,
-1.364975, 0.3495024, -1.228161, 1, 0.5882353, 0, 1,
-1.35985, -1.218199, -3.326717, 1, 0.5921569, 0, 1,
-1.359529, -0.6960266, -1.132035, 1, 0.6, 0, 1,
-1.349358, 0.8181115, -0.7838828, 1, 0.6078432, 0, 1,
-1.345595, -0.7962463, -2.787762, 1, 0.6117647, 0, 1,
-1.343714, 2.752153, -0.6746803, 1, 0.6196079, 0, 1,
-1.340034, -2.602121, -3.438036, 1, 0.6235294, 0, 1,
-1.336165, 0.570967, -0.2844241, 1, 0.6313726, 0, 1,
-1.333562, 0.8851923, -3.14129, 1, 0.6352941, 0, 1,
-1.318301, -0.0180618, -0.9676313, 1, 0.6431373, 0, 1,
-1.316086, 1.024022, -1.294979, 1, 0.6470588, 0, 1,
-1.314643, 0.2603928, -2.219199, 1, 0.654902, 0, 1,
-1.312223, 0.2759657, -2.253611, 1, 0.6588235, 0, 1,
-1.309481, -1.315258, -2.311086, 1, 0.6666667, 0, 1,
-1.288547, 0.6062829, 1.809044, 1, 0.6705883, 0, 1,
-1.27825, 0.3296122, 0.05581735, 1, 0.6784314, 0, 1,
-1.277002, 0.7850965, -2.05778, 1, 0.682353, 0, 1,
-1.274358, 0.133788, -3.010196, 1, 0.6901961, 0, 1,
-1.268134, 0.6023158, -1.408291, 1, 0.6941177, 0, 1,
-1.259642, 0.3687721, -0.6328777, 1, 0.7019608, 0, 1,
-1.253615, 0.7627573, -0.3429419, 1, 0.7098039, 0, 1,
-1.250657, 0.2681059, -2.076053, 1, 0.7137255, 0, 1,
-1.232794, -1.432058, -2.684055, 1, 0.7215686, 0, 1,
-1.223532, -0.8217652, -1.729593, 1, 0.7254902, 0, 1,
-1.222459, 0.07319067, -1.133294, 1, 0.7333333, 0, 1,
-1.217715, -0.4931578, -2.816089, 1, 0.7372549, 0, 1,
-1.217115, 0.5156376, -1.660686, 1, 0.7450981, 0, 1,
-1.213806, -0.7110211, -2.060435, 1, 0.7490196, 0, 1,
-1.212655, 1.082987, -0.5439403, 1, 0.7568628, 0, 1,
-1.206136, 0.5744425, -0.7478008, 1, 0.7607843, 0, 1,
-1.204072, -0.8758127, -4.305122, 1, 0.7686275, 0, 1,
-1.202883, 0.3014519, -1.166493, 1, 0.772549, 0, 1,
-1.198533, 0.04149285, -0.4288039, 1, 0.7803922, 0, 1,
-1.194407, -1.212371, -0.7301722, 1, 0.7843137, 0, 1,
-1.193293, -0.3002297, -0.4658172, 1, 0.7921569, 0, 1,
-1.176627, 1.188535, -0.9795491, 1, 0.7960784, 0, 1,
-1.175674, 0.0544355, -1.728514, 1, 0.8039216, 0, 1,
-1.162637, -0.2345323, -1.787917, 1, 0.8117647, 0, 1,
-1.155601, 0.7650269, -2.577563, 1, 0.8156863, 0, 1,
-1.152134, 0.6470177, -1.369495, 1, 0.8235294, 0, 1,
-1.135778, 0.747876, 0.07618603, 1, 0.827451, 0, 1,
-1.134659, 0.07775251, -0.4711082, 1, 0.8352941, 0, 1,
-1.131916, 0.2995298, 0.1445935, 1, 0.8392157, 0, 1,
-1.121707, -0.7602558, -2.747724, 1, 0.8470588, 0, 1,
-1.118548, -0.2966441, -3.613145, 1, 0.8509804, 0, 1,
-1.10659, 0.8553665, -0.6092885, 1, 0.8588235, 0, 1,
-1.105168, -1.359867, -2.889396, 1, 0.8627451, 0, 1,
-1.096094, 1.006429, -0.6604843, 1, 0.8705882, 0, 1,
-1.090988, 0.4214889, -0.2567287, 1, 0.8745098, 0, 1,
-1.089256, 0.90575, 1.085477, 1, 0.8823529, 0, 1,
-1.084041, -0.6617427, -0.2249175, 1, 0.8862745, 0, 1,
-1.083282, 1.667079, -1.166829, 1, 0.8941177, 0, 1,
-1.075385, -1.969983, -0.9063112, 1, 0.8980392, 0, 1,
-1.075368, -0.6143442, -3.776665, 1, 0.9058824, 0, 1,
-1.073395, -2.504531, -1.309048, 1, 0.9137255, 0, 1,
-1.058661, -0.3747981, -3.048803, 1, 0.9176471, 0, 1,
-1.049123, 0.2170053, -1.005747, 1, 0.9254902, 0, 1,
-1.045712, -1.210347, -2.446503, 1, 0.9294118, 0, 1,
-1.033931, 1.427785, -0.5450701, 1, 0.9372549, 0, 1,
-1.027015, -0.9747915, -0.2991737, 1, 0.9411765, 0, 1,
-1.02297, 0.04659561, -1.81609, 1, 0.9490196, 0, 1,
-1.015227, -0.2055899, 0.318146, 1, 0.9529412, 0, 1,
-1.012678, 0.5451458, -0.8382343, 1, 0.9607843, 0, 1,
-1.01183, -0.5707018, -2.912055, 1, 0.9647059, 0, 1,
-1.010961, 1.689286, 1.085971, 1, 0.972549, 0, 1,
-1.006457, -0.3381674, -1.907324, 1, 0.9764706, 0, 1,
-0.9851412, -0.09566574, 0.06872099, 1, 0.9843137, 0, 1,
-0.984159, -0.1440698, -0.2889906, 1, 0.9882353, 0, 1,
-0.9813069, 1.057873, -0.9005163, 1, 0.9960784, 0, 1,
-0.9637727, 1.029242, 0.7620624, 0.9960784, 1, 0, 1,
-0.9520176, 0.2988691, -1.784995, 0.9921569, 1, 0, 1,
-0.950954, -0.2709157, -2.32938, 0.9843137, 1, 0, 1,
-0.9508127, 0.6180642, -0.6501065, 0.9803922, 1, 0, 1,
-0.9451976, 0.9999254, -0.7719364, 0.972549, 1, 0, 1,
-0.9451066, 0.5717492, -1.884075, 0.9686275, 1, 0, 1,
-0.9399472, 1.274867, -1.263865, 0.9607843, 1, 0, 1,
-0.9399281, -0.4009656, -1.03213, 0.9568627, 1, 0, 1,
-0.9362543, -0.8713335, -2.202472, 0.9490196, 1, 0, 1,
-0.936082, -0.7765074, -2.17311, 0.945098, 1, 0, 1,
-0.919001, -0.4553274, -1.122051, 0.9372549, 1, 0, 1,
-0.9185838, 0.9422181, 1.229107, 0.9333333, 1, 0, 1,
-0.9151232, -2.833213, -2.036741, 0.9254902, 1, 0, 1,
-0.9136872, -0.3663426, -3.542707, 0.9215686, 1, 0, 1,
-0.9129685, 0.2963092, -1.588952, 0.9137255, 1, 0, 1,
-0.9118558, -0.9995046, -4.510704, 0.9098039, 1, 0, 1,
-0.905019, -2.680381, -3.05428, 0.9019608, 1, 0, 1,
-0.9040438, -0.846936, -3.550926, 0.8941177, 1, 0, 1,
-0.8906882, 0.5393484, -0.7313286, 0.8901961, 1, 0, 1,
-0.8871154, -0.1602416, -1.243747, 0.8823529, 1, 0, 1,
-0.8846197, -0.6511326, -2.542321, 0.8784314, 1, 0, 1,
-0.8839799, -1.08548, -2.927043, 0.8705882, 1, 0, 1,
-0.8812335, 0.6968908, -0.07528938, 0.8666667, 1, 0, 1,
-0.8718883, 1.350809, -1.122018, 0.8588235, 1, 0, 1,
-0.871555, 1.130194, -0.001728948, 0.854902, 1, 0, 1,
-0.8689211, 1.123036, -1.184427, 0.8470588, 1, 0, 1,
-0.8658967, 0.4571324, -2.580863, 0.8431373, 1, 0, 1,
-0.8657504, -0.8149565, -2.498944, 0.8352941, 1, 0, 1,
-0.8622923, 0.9809245, -0.2987294, 0.8313726, 1, 0, 1,
-0.8463945, -0.735256, -1.796253, 0.8235294, 1, 0, 1,
-0.8422621, 0.007965938, -2.507208, 0.8196079, 1, 0, 1,
-0.8354439, 1.809955, -1.182593, 0.8117647, 1, 0, 1,
-0.8313316, -0.6249896, -2.705484, 0.8078431, 1, 0, 1,
-0.8295802, -0.7909337, -3.049891, 0.8, 1, 0, 1,
-0.8250793, -0.332598, -1.048254, 0.7921569, 1, 0, 1,
-0.8235288, 0.572592, -1.090039, 0.7882353, 1, 0, 1,
-0.8231431, -0.8666427, -0.8848709, 0.7803922, 1, 0, 1,
-0.8213468, 0.1448037, -0.7098854, 0.7764706, 1, 0, 1,
-0.8189567, 1.275173, -1.132741, 0.7686275, 1, 0, 1,
-0.8171505, 0.6935676, 0.1643458, 0.7647059, 1, 0, 1,
-0.8151957, 0.6795931, -1.033541, 0.7568628, 1, 0, 1,
-0.8145207, 1.055712, -1.255358, 0.7529412, 1, 0, 1,
-0.8133376, -1.322798, -2.931816, 0.7450981, 1, 0, 1,
-0.8119273, -1.284574, -4.35473, 0.7411765, 1, 0, 1,
-0.8112845, -0.9827024, -1.260642, 0.7333333, 1, 0, 1,
-0.809105, -1.416345, -4.311331, 0.7294118, 1, 0, 1,
-0.8061948, 0.6907402, -0.7554241, 0.7215686, 1, 0, 1,
-0.8059849, -0.1762221, -1.416516, 0.7176471, 1, 0, 1,
-0.8023306, 0.4500824, -3.101185, 0.7098039, 1, 0, 1,
-0.7990748, -0.3728523, -0.555271, 0.7058824, 1, 0, 1,
-0.7974738, 0.2166576, -0.787281, 0.6980392, 1, 0, 1,
-0.7945873, -0.7877098, -2.832392, 0.6901961, 1, 0, 1,
-0.7933558, -0.2366855, -3.368748, 0.6862745, 1, 0, 1,
-0.7925279, -1.169763, -3.12776, 0.6784314, 1, 0, 1,
-0.7920825, -1.008996, -1.490164, 0.6745098, 1, 0, 1,
-0.7904409, -0.5509607, -2.780767, 0.6666667, 1, 0, 1,
-0.780643, 0.6253179, -1.512268, 0.6627451, 1, 0, 1,
-0.7781457, -1.070422, -2.603152, 0.654902, 1, 0, 1,
-0.7750725, -0.1447421, -2.586367, 0.6509804, 1, 0, 1,
-0.7748309, 0.3739212, -0.5677545, 0.6431373, 1, 0, 1,
-0.7741449, 0.1943655, -1.761509, 0.6392157, 1, 0, 1,
-0.774061, 1.127888, -1.194792, 0.6313726, 1, 0, 1,
-0.7719851, 0.2796593, -1.981843, 0.627451, 1, 0, 1,
-0.7716909, -0.2041538, -1.711979, 0.6196079, 1, 0, 1,
-0.7715752, -1.304704, -4.099515, 0.6156863, 1, 0, 1,
-0.7614053, -1.626857, -2.622628, 0.6078432, 1, 0, 1,
-0.7571949, -0.06515063, -1.483587, 0.6039216, 1, 0, 1,
-0.7562644, -0.5925468, -0.7473248, 0.5960785, 1, 0, 1,
-0.7548069, -0.8201203, -0.6134201, 0.5882353, 1, 0, 1,
-0.7426633, -1.189793, -3.198843, 0.5843138, 1, 0, 1,
-0.742029, -0.502894, -2.887402, 0.5764706, 1, 0, 1,
-0.7407535, -0.5469918, -1.887132, 0.572549, 1, 0, 1,
-0.7381464, -1.30852, -2.812536, 0.5647059, 1, 0, 1,
-0.7339792, 1.170234, 1.439335, 0.5607843, 1, 0, 1,
-0.7307442, -1.699112, -3.406833, 0.5529412, 1, 0, 1,
-0.7294044, 0.7715764, -0.283682, 0.5490196, 1, 0, 1,
-0.7289847, -0.8755409, -0.4259273, 0.5411765, 1, 0, 1,
-0.7273211, -0.3248209, -1.233592, 0.5372549, 1, 0, 1,
-0.7224164, -0.2708024, -3.199667, 0.5294118, 1, 0, 1,
-0.7195643, 0.7728097, -1.431532, 0.5254902, 1, 0, 1,
-0.7171671, 1.326785, -1.80278, 0.5176471, 1, 0, 1,
-0.7146461, 0.3838072, -4.119472, 0.5137255, 1, 0, 1,
-0.7122409, -0.8026167, -2.70949, 0.5058824, 1, 0, 1,
-0.7103256, 0.9381037, -0.9168577, 0.5019608, 1, 0, 1,
-0.7039792, -1.667627, -2.885534, 0.4941176, 1, 0, 1,
-0.7038588, -0.2504959, -1.3099, 0.4862745, 1, 0, 1,
-0.6959672, 0.07219811, -1.874203, 0.4823529, 1, 0, 1,
-0.6907231, 1.81851, -0.1139183, 0.4745098, 1, 0, 1,
-0.6900016, 0.4726319, 0.6335292, 0.4705882, 1, 0, 1,
-0.68976, -0.6825049, -4.598025, 0.4627451, 1, 0, 1,
-0.6777938, 1.141011, -0.01822999, 0.4588235, 1, 0, 1,
-0.6670514, 1.391033, -0.9952129, 0.4509804, 1, 0, 1,
-0.6646723, 0.5918818, -2.138225, 0.4470588, 1, 0, 1,
-0.6603581, 0.8297734, 1.597449, 0.4392157, 1, 0, 1,
-0.6600458, -0.3833952, -2.276826, 0.4352941, 1, 0, 1,
-0.6582695, 0.3880091, -1.269747, 0.427451, 1, 0, 1,
-0.656884, -1.06037, -2.399205, 0.4235294, 1, 0, 1,
-0.6562856, -0.5127209, -2.876254, 0.4156863, 1, 0, 1,
-0.6541169, 0.4690966, -0.3622496, 0.4117647, 1, 0, 1,
-0.6504545, 0.01649131, -2.18973, 0.4039216, 1, 0, 1,
-0.6462675, -0.5844415, -3.352553, 0.3960784, 1, 0, 1,
-0.6399546, 1.059585, -2.134284, 0.3921569, 1, 0, 1,
-0.6382787, -0.6437467, -1.458062, 0.3843137, 1, 0, 1,
-0.6161491, -0.9965589, -1.598594, 0.3803922, 1, 0, 1,
-0.6132376, 1.565764, -0.7813996, 0.372549, 1, 0, 1,
-0.6116828, -1.758221, -2.846914, 0.3686275, 1, 0, 1,
-0.6070612, -1.236748, -2.544166, 0.3607843, 1, 0, 1,
-0.5973086, 0.02399492, -1.849047, 0.3568628, 1, 0, 1,
-0.5899276, -0.7116928, -2.036432, 0.3490196, 1, 0, 1,
-0.5771171, -1.341317, -4.357227, 0.345098, 1, 0, 1,
-0.5765674, -2.357143, -2.407762, 0.3372549, 1, 0, 1,
-0.5724207, -0.2809827, -2.503737, 0.3333333, 1, 0, 1,
-0.5693904, 1.685289, -1.216505, 0.3254902, 1, 0, 1,
-0.5677981, 0.08017926, -0.6048868, 0.3215686, 1, 0, 1,
-0.5639986, 1.075029, -0.984319, 0.3137255, 1, 0, 1,
-0.5588819, 1.102368, -1.540796, 0.3098039, 1, 0, 1,
-0.5545265, 0.2958494, -1.40685, 0.3019608, 1, 0, 1,
-0.5505704, 0.5867645, 0.5895879, 0.2941177, 1, 0, 1,
-0.548674, 1.635661, -0.8030806, 0.2901961, 1, 0, 1,
-0.5483199, -0.04875508, -1.856675, 0.282353, 1, 0, 1,
-0.5476278, -0.1822321, -0.874317, 0.2784314, 1, 0, 1,
-0.5475332, 0.4744269, 0.7461771, 0.2705882, 1, 0, 1,
-0.5467576, 2.333899, 1.157634, 0.2666667, 1, 0, 1,
-0.542146, -1.55037, -4.6783, 0.2588235, 1, 0, 1,
-0.5415575, -0.4585031, -1.859715, 0.254902, 1, 0, 1,
-0.5382997, 0.9553496, -0.4338019, 0.2470588, 1, 0, 1,
-0.5293861, 0.241325, -1.094967, 0.2431373, 1, 0, 1,
-0.5256729, 1.51213, 0.5281096, 0.2352941, 1, 0, 1,
-0.5250912, -0.8638178, -2.374767, 0.2313726, 1, 0, 1,
-0.5223768, 1.280749, 0.4462389, 0.2235294, 1, 0, 1,
-0.5220037, 1.922717, -0.4322924, 0.2196078, 1, 0, 1,
-0.5157061, -1.304621, -2.392544, 0.2117647, 1, 0, 1,
-0.5155655, -0.1634568, 0.5574652, 0.2078431, 1, 0, 1,
-0.5126064, -1.578445, -3.409453, 0.2, 1, 0, 1,
-0.5079677, 0.927254, -0.005891023, 0.1921569, 1, 0, 1,
-0.5078162, 0.3528102, -0.1281722, 0.1882353, 1, 0, 1,
-0.5035332, 1.675933, 0.8081037, 0.1803922, 1, 0, 1,
-0.4968886, 0.8847208, -1.366826, 0.1764706, 1, 0, 1,
-0.4949726, 0.9569657, -0.9244132, 0.1686275, 1, 0, 1,
-0.4942651, 0.9699418, 0.2877606, 0.1647059, 1, 0, 1,
-0.4940343, 0.8450482, -0.3124847, 0.1568628, 1, 0, 1,
-0.4859097, 0.09626222, -1.071653, 0.1529412, 1, 0, 1,
-0.4848899, 0.4550671, -1.671132, 0.145098, 1, 0, 1,
-0.471429, -0.2380179, -1.753838, 0.1411765, 1, 0, 1,
-0.4711052, -0.3604123, -2.592042, 0.1333333, 1, 0, 1,
-0.4627827, 0.4189058, -2.072572, 0.1294118, 1, 0, 1,
-0.4584607, -1.987125, -2.048969, 0.1215686, 1, 0, 1,
-0.458172, -0.2006568, -3.315532, 0.1176471, 1, 0, 1,
-0.4578192, -0.4337024, -1.201308, 0.1098039, 1, 0, 1,
-0.4560141, -0.3999833, -1.217601, 0.1058824, 1, 0, 1,
-0.4514589, 0.5378331, -0.6232685, 0.09803922, 1, 0, 1,
-0.4505039, 0.6683064, -1.116855, 0.09019608, 1, 0, 1,
-0.4482217, 1.774165, -1.001429, 0.08627451, 1, 0, 1,
-0.4445861, -0.06855028, -1.469341, 0.07843138, 1, 0, 1,
-0.4445681, -1.225608, -5.081949, 0.07450981, 1, 0, 1,
-0.444179, -0.01311961, -1.470326, 0.06666667, 1, 0, 1,
-0.4390004, 0.2282855, -1.156683, 0.0627451, 1, 0, 1,
-0.4377916, -0.4855128, -1.642618, 0.05490196, 1, 0, 1,
-0.4359086, -0.6330383, -1.2265, 0.05098039, 1, 0, 1,
-0.4310982, -1.771953, -3.473498, 0.04313726, 1, 0, 1,
-0.4298919, -0.05566686, -2.303522, 0.03921569, 1, 0, 1,
-0.4275298, -0.4328786, -1.354345, 0.03137255, 1, 0, 1,
-0.4262209, -0.9390738, -3.853014, 0.02745098, 1, 0, 1,
-0.4247977, -0.3785794, -4.073651, 0.01960784, 1, 0, 1,
-0.4210535, 1.217602, 0.8859566, 0.01568628, 1, 0, 1,
-0.4205959, 0.3609747, -0.5223949, 0.007843138, 1, 0, 1,
-0.4202181, 2.049886, -0.9182905, 0.003921569, 1, 0, 1,
-0.4169939, -0.01999035, -2.272761, 0, 1, 0.003921569, 1,
-0.4149676, 0.7875056, -1.233274, 0, 1, 0.01176471, 1,
-0.4123268, -1.148953, -2.07495, 0, 1, 0.01568628, 1,
-0.412232, -0.3952926, -2.529499, 0, 1, 0.02352941, 1,
-0.4050984, -0.594962, -2.330821, 0, 1, 0.02745098, 1,
-0.4031832, 0.6797081, -2.00262, 0, 1, 0.03529412, 1,
-0.3939208, 0.4735453, -3.059202, 0, 1, 0.03921569, 1,
-0.3867671, -0.9978806, -3.940813, 0, 1, 0.04705882, 1,
-0.3824399, -2.36313, -3.824848, 0, 1, 0.05098039, 1,
-0.3809581, 0.08672449, -1.257419, 0, 1, 0.05882353, 1,
-0.380464, -0.2845258, -2.58688, 0, 1, 0.0627451, 1,
-0.3802423, 0.36429, 0.8291105, 0, 1, 0.07058824, 1,
-0.3782949, 0.5138836, -1.18954, 0, 1, 0.07450981, 1,
-0.3735245, -2.13197, -2.836, 0, 1, 0.08235294, 1,
-0.3614417, 0.7378545, -2.505705, 0, 1, 0.08627451, 1,
-0.3605815, 0.4357358, 0.4134825, 0, 1, 0.09411765, 1,
-0.3603107, -0.7121511, -3.473448, 0, 1, 0.1019608, 1,
-0.3598527, -0.1409557, -2.782689, 0, 1, 0.1058824, 1,
-0.3543073, 0.517384, 0.3087088, 0, 1, 0.1137255, 1,
-0.3497713, -0.594076, -2.192896, 0, 1, 0.1176471, 1,
-0.3470613, -0.3285578, -0.7316197, 0, 1, 0.1254902, 1,
-0.3456352, 0.1167989, -0.7430475, 0, 1, 0.1294118, 1,
-0.3427257, 0.9812289, -1.418828, 0, 1, 0.1372549, 1,
-0.3410558, 0.7355714, 0.5056214, 0, 1, 0.1411765, 1,
-0.3369485, -1.240961, -2.800821, 0, 1, 0.1490196, 1,
-0.3365089, -0.9892738, -3.725358, 0, 1, 0.1529412, 1,
-0.3358034, 0.7100748, -2.127249, 0, 1, 0.1607843, 1,
-0.332324, 0.9922638, -0.169913, 0, 1, 0.1647059, 1,
-0.3309995, -0.6068776, -2.145001, 0, 1, 0.172549, 1,
-0.3298651, 1.017298, -1.524488, 0, 1, 0.1764706, 1,
-0.3292345, 0.00727899, -0.9429321, 0, 1, 0.1843137, 1,
-0.3290291, 1.785432, -0.9605395, 0, 1, 0.1882353, 1,
-0.3288313, -1.079423, -2.256464, 0, 1, 0.1960784, 1,
-0.324936, 1.447113, -1.085127, 0, 1, 0.2039216, 1,
-0.3247107, 0.026859, -1.520144, 0, 1, 0.2078431, 1,
-0.322585, 0.06939767, -2.029777, 0, 1, 0.2156863, 1,
-0.3221724, -0.6251185, -1.52475, 0, 1, 0.2196078, 1,
-0.3165157, -1.749064, -3.261271, 0, 1, 0.227451, 1,
-0.3000213, -1.120565, -1.928383, 0, 1, 0.2313726, 1,
-0.2975293, 0.4749325, 1.232344, 0, 1, 0.2392157, 1,
-0.2933027, 0.8084348, 0.3994695, 0, 1, 0.2431373, 1,
-0.2919072, 1.129079, 0.8196437, 0, 1, 0.2509804, 1,
-0.2904609, -0.6910763, -3.25755, 0, 1, 0.254902, 1,
-0.2890956, 1.340731, 0.07116017, 0, 1, 0.2627451, 1,
-0.2886082, 0.9827984, 1.175411, 0, 1, 0.2666667, 1,
-0.2860187, -0.9874029, -2.330314, 0, 1, 0.2745098, 1,
-0.2829005, 0.9994337, -1.159053, 0, 1, 0.2784314, 1,
-0.2811028, -0.2500745, -0.3278811, 0, 1, 0.2862745, 1,
-0.2758406, 0.1419261, 0.8376977, 0, 1, 0.2901961, 1,
-0.2745577, -0.8624771, -4.070958, 0, 1, 0.2980392, 1,
-0.2743512, -0.06818888, -4.240368, 0, 1, 0.3058824, 1,
-0.2726, 0.4959961, 0.1093199, 0, 1, 0.3098039, 1,
-0.2709856, 0.1917667, -1.43869, 0, 1, 0.3176471, 1,
-0.269925, 0.4260927, -1.878464, 0, 1, 0.3215686, 1,
-0.2686401, 1.084099, -0.4122932, 0, 1, 0.3294118, 1,
-0.2677256, 1.043242, -0.6198696, 0, 1, 0.3333333, 1,
-0.2646969, 1.193058, 0.2675405, 0, 1, 0.3411765, 1,
-0.2646937, -1.348247, -2.184711, 0, 1, 0.345098, 1,
-0.2641099, 0.3363099, -0.3238897, 0, 1, 0.3529412, 1,
-0.2601296, 0.2042051, -0.1111815, 0, 1, 0.3568628, 1,
-0.2584602, 0.6124153, -1.786012, 0, 1, 0.3647059, 1,
-0.2571027, -0.2260265, -3.891328, 0, 1, 0.3686275, 1,
-0.249468, -0.6508, -2.221755, 0, 1, 0.3764706, 1,
-0.2488059, 0.4991176, -1.53117, 0, 1, 0.3803922, 1,
-0.2468973, -1.615785, -3.725252, 0, 1, 0.3882353, 1,
-0.2444464, -0.1391486, -2.396399, 0, 1, 0.3921569, 1,
-0.2441499, -0.530521, -1.922401, 0, 1, 0.4, 1,
-0.2434347, -1.261822, -3.844855, 0, 1, 0.4078431, 1,
-0.2406976, 2.325866, -1.255323, 0, 1, 0.4117647, 1,
-0.2316632, 0.8926889, 0.191462, 0, 1, 0.4196078, 1,
-0.2277282, 0.8884641, -0.11033, 0, 1, 0.4235294, 1,
-0.2270687, -1.322439, -3.175545, 0, 1, 0.4313726, 1,
-0.226773, 0.1923019, -1.146526, 0, 1, 0.4352941, 1,
-0.225994, -0.4964739, -3.699537, 0, 1, 0.4431373, 1,
-0.2245001, 0.7052205, 1.274204, 0, 1, 0.4470588, 1,
-0.2177132, 0.7941356, -0.3339806, 0, 1, 0.454902, 1,
-0.2172995, -0.6113308, -2.839167, 0, 1, 0.4588235, 1,
-0.2155849, -2.007916, -3.039644, 0, 1, 0.4666667, 1,
-0.2141501, -1.150292, -3.387002, 0, 1, 0.4705882, 1,
-0.2114956, -1.61739, -3.518527, 0, 1, 0.4784314, 1,
-0.2114743, 0.5033369, 0.5664988, 0, 1, 0.4823529, 1,
-0.209704, -1.504555, -2.92872, 0, 1, 0.4901961, 1,
-0.2094212, 1.016564, 1.171023, 0, 1, 0.4941176, 1,
-0.2091609, 1.140036, -1.727363, 0, 1, 0.5019608, 1,
-0.2072519, 0.1270293, -1.321718, 0, 1, 0.509804, 1,
-0.2063471, 0.8861934, 1.568309, 0, 1, 0.5137255, 1,
-0.2038843, 0.955779, -0.2165945, 0, 1, 0.5215687, 1,
-0.2011438, -0.8131729, -4.970332, 0, 1, 0.5254902, 1,
-0.1992814, -1.129026, -3.597153, 0, 1, 0.5333334, 1,
-0.1968889, -1.535365, -3.20487, 0, 1, 0.5372549, 1,
-0.1965561, -0.2741087, -1.151172, 0, 1, 0.5450981, 1,
-0.1954119, -1.159267, -4.411665, 0, 1, 0.5490196, 1,
-0.1889188, -0.1325938, 0.09578112, 0, 1, 0.5568628, 1,
-0.1872742, 0.8089588, 0.04399407, 0, 1, 0.5607843, 1,
-0.1845025, 0.2887596, -0.3443289, 0, 1, 0.5686275, 1,
-0.1840698, -2.44821, -5.088517, 0, 1, 0.572549, 1,
-0.1812899, 0.8229038, -1.451425, 0, 1, 0.5803922, 1,
-0.1793751, 0.5405598, -1.052728, 0, 1, 0.5843138, 1,
-0.170676, 0.4633328, 1.112485, 0, 1, 0.5921569, 1,
-0.1634963, -0.8323393, -2.795596, 0, 1, 0.5960785, 1,
-0.1608061, -1.181025, -2.597997, 0, 1, 0.6039216, 1,
-0.160334, 0.2710003, -0.08509636, 0, 1, 0.6117647, 1,
-0.1575738, 1.734576, -0.05504775, 0, 1, 0.6156863, 1,
-0.155383, 0.3473198, -0.9903135, 0, 1, 0.6235294, 1,
-0.1549773, 0.5046464, -1.519632, 0, 1, 0.627451, 1,
-0.1544481, -0.5985103, -1.884317, 0, 1, 0.6352941, 1,
-0.1507731, -0.1704701, -3.602124, 0, 1, 0.6392157, 1,
-0.1504517, 0.9502293, 0.9810516, 0, 1, 0.6470588, 1,
-0.1492091, 0.3193184, 0.4268156, 0, 1, 0.6509804, 1,
-0.1390929, -0.1149088, -3.458573, 0, 1, 0.6588235, 1,
-0.1320764, 0.9711689, -0.03125893, 0, 1, 0.6627451, 1,
-0.1309733, 0.9859449, -0.3298391, 0, 1, 0.6705883, 1,
-0.1277085, 1.146601, 0.7052041, 0, 1, 0.6745098, 1,
-0.1269917, -0.237565, -3.253706, 0, 1, 0.682353, 1,
-0.1256841, 0.3226669, -0.08726188, 0, 1, 0.6862745, 1,
-0.1118104, -1.892238, -3.729379, 0, 1, 0.6941177, 1,
-0.1117005, -1.005141, -3.281492, 0, 1, 0.7019608, 1,
-0.1084281, 0.7884409, -0.5739684, 0, 1, 0.7058824, 1,
-0.1058172, 0.1263888, -1.583536, 0, 1, 0.7137255, 1,
-0.1048151, -0.652877, -3.447683, 0, 1, 0.7176471, 1,
-0.1043985, -0.09114366, -2.799782, 0, 1, 0.7254902, 1,
-0.1035135, 0.595607, -0.4086851, 0, 1, 0.7294118, 1,
-0.101078, 0.174996, -0.1930721, 0, 1, 0.7372549, 1,
-0.09984276, -1.253033, -4.314798, 0, 1, 0.7411765, 1,
-0.0991636, -1.862319, -3.505527, 0, 1, 0.7490196, 1,
-0.09914481, 1.442072, -0.3978413, 0, 1, 0.7529412, 1,
-0.09890044, -1.001988, -2.53218, 0, 1, 0.7607843, 1,
-0.09305321, 1.435444, -0.5639774, 0, 1, 0.7647059, 1,
-0.09275734, 1.159154, -0.2697756, 0, 1, 0.772549, 1,
-0.09238313, -0.6250414, -1.927696, 0, 1, 0.7764706, 1,
-0.09199072, -0.2913561, -1.964617, 0, 1, 0.7843137, 1,
-0.09128031, -0.5195279, 0.07015095, 0, 1, 0.7882353, 1,
-0.08604208, 0.4709009, -0.5328898, 0, 1, 0.7960784, 1,
-0.08426278, -0.4711415, -2.386601, 0, 1, 0.8039216, 1,
-0.08347314, 0.9903315, -0.7609171, 0, 1, 0.8078431, 1,
-0.08326876, -0.2379646, -2.749635, 0, 1, 0.8156863, 1,
-0.08108708, 0.3776438, 0.1184848, 0, 1, 0.8196079, 1,
-0.07518234, 0.5965708, 1.147716, 0, 1, 0.827451, 1,
-0.0744286, -1.507133, -2.640781, 0, 1, 0.8313726, 1,
-0.07327474, -0.2825235, -2.985901, 0, 1, 0.8392157, 1,
-0.07124073, 0.1293987, -0.4920499, 0, 1, 0.8431373, 1,
-0.06688984, -0.5955594, -1.527975, 0, 1, 0.8509804, 1,
-0.06396381, -0.387993, -3.811488, 0, 1, 0.854902, 1,
-0.06289025, -1.981813, -1.096417, 0, 1, 0.8627451, 1,
-0.06263231, 0.2839152, 1.429324, 0, 1, 0.8666667, 1,
-0.06197378, -0.7940127, -4.126803, 0, 1, 0.8745098, 1,
-0.06153493, 2.01843, 0.6940823, 0, 1, 0.8784314, 1,
-0.06056534, 0.9664772, -0.3074032, 0, 1, 0.8862745, 1,
-0.05937337, 0.2204734, -0.5940168, 0, 1, 0.8901961, 1,
-0.05648458, 0.5596346, -0.9527574, 0, 1, 0.8980392, 1,
-0.04526848, -0.4386758, -2.5918, 0, 1, 0.9058824, 1,
-0.04503905, -0.4597679, -2.886355, 0, 1, 0.9098039, 1,
-0.04393519, 0.3452356, -1.433453, 0, 1, 0.9176471, 1,
-0.04056117, -0.4531614, -3.963632, 0, 1, 0.9215686, 1,
-0.03908717, -0.04404294, -3.833114, 0, 1, 0.9294118, 1,
-0.03830338, -0.8511637, -2.028014, 0, 1, 0.9333333, 1,
-0.03594655, -1.1154, -1.985073, 0, 1, 0.9411765, 1,
-0.03499005, 0.3249465, 0.05008465, 0, 1, 0.945098, 1,
-0.02705629, -0.3496538, -2.945015, 0, 1, 0.9529412, 1,
-0.02342808, -1.210421, -1.25487, 0, 1, 0.9568627, 1,
-0.02214943, 0.5344809, -0.05009904, 0, 1, 0.9647059, 1,
-0.02175524, 0.4587641, -0.9846763, 0, 1, 0.9686275, 1,
-0.02017894, -1.147511, -1.936686, 0, 1, 0.9764706, 1,
-0.01682347, -0.8177609, -1.337841, 0, 1, 0.9803922, 1,
-0.01018366, 0.7834952, 0.0136615, 0, 1, 0.9882353, 1,
-0.008639144, -0.3288936, -4.177498, 0, 1, 0.9921569, 1,
-0.008332634, -0.644803, -3.707749, 0, 1, 1, 1,
-0.008191637, -0.779851, -2.953573, 0, 0.9921569, 1, 1,
-0.00730193, 0.3261829, 1.460848, 0, 0.9882353, 1, 1,
-0.006082125, -0.833988, -3.209117, 0, 0.9803922, 1, 1,
-0.002717382, -1.298331, -2.190191, 0, 0.9764706, 1, 1,
0.0008315257, -0.4615718, 2.263559, 0, 0.9686275, 1, 1,
0.007054834, -0.0877062, 2.145723, 0, 0.9647059, 1, 1,
0.007544875, -1.786106, 1.334841, 0, 0.9568627, 1, 1,
0.01577871, 1.034223, -0.4288232, 0, 0.9529412, 1, 1,
0.01830983, -2.221443, 3.953302, 0, 0.945098, 1, 1,
0.01886914, 0.2389109, 0.7654949, 0, 0.9411765, 1, 1,
0.0202553, -0.3739268, 1.845331, 0, 0.9333333, 1, 1,
0.02050756, -1.625529, 1.79757, 0, 0.9294118, 1, 1,
0.02829987, -0.3501964, 2.88158, 0, 0.9215686, 1, 1,
0.03049022, -0.5290545, 4.191805, 0, 0.9176471, 1, 1,
0.03411534, 0.6514463, 1.38413, 0, 0.9098039, 1, 1,
0.04140514, 0.6338044, 1.158255, 0, 0.9058824, 1, 1,
0.04279119, 0.8261596, 2.08649, 0, 0.8980392, 1, 1,
0.04381876, 1.111976, 0.3404914, 0, 0.8901961, 1, 1,
0.04457313, -0.437867, 2.238613, 0, 0.8862745, 1, 1,
0.0451263, 0.3961244, 1.785492, 0, 0.8784314, 1, 1,
0.04622775, -0.4418514, 2.227791, 0, 0.8745098, 1, 1,
0.04893485, 1.33454, 1.175942, 0, 0.8666667, 1, 1,
0.05217557, 0.132321, 0.547776, 0, 0.8627451, 1, 1,
0.05223325, 0.4544, 1.531589, 0, 0.854902, 1, 1,
0.05278913, 0.213615, 2.160306, 0, 0.8509804, 1, 1,
0.05603214, 1.081721, -0.7307306, 0, 0.8431373, 1, 1,
0.05715789, 0.4017364, -0.3706931, 0, 0.8392157, 1, 1,
0.06513612, 1.88701, 0.7462489, 0, 0.8313726, 1, 1,
0.06523921, -0.6097862, 2.609338, 0, 0.827451, 1, 1,
0.06687012, 0.9725477, -0.006897021, 0, 0.8196079, 1, 1,
0.07098045, -0.7475185, 2.598477, 0, 0.8156863, 1, 1,
0.07217336, -0.3849932, 4.008296, 0, 0.8078431, 1, 1,
0.07248847, 0.6070442, 0.2600112, 0, 0.8039216, 1, 1,
0.07367647, -1.08858, 2.126025, 0, 0.7960784, 1, 1,
0.07598042, 0.5911059, 0.8975337, 0, 0.7882353, 1, 1,
0.07728259, -0.2103047, 1.866651, 0, 0.7843137, 1, 1,
0.07865184, -0.5987616, 5.090721, 0, 0.7764706, 1, 1,
0.08216497, -0.0307851, 1.816534, 0, 0.772549, 1, 1,
0.08236773, -0.9113913, 2.249898, 0, 0.7647059, 1, 1,
0.09099699, -0.3432907, 2.110646, 0, 0.7607843, 1, 1,
0.09313031, -0.1886262, 4.126736, 0, 0.7529412, 1, 1,
0.09337749, 0.1719825, -1.534318, 0, 0.7490196, 1, 1,
0.0936463, 1.706138, -1.006957, 0, 0.7411765, 1, 1,
0.09549834, 0.4651957, -1.407528, 0, 0.7372549, 1, 1,
0.09735788, 1.259907, 0.9441592, 0, 0.7294118, 1, 1,
0.1004039, 0.1644329, 0.2058023, 0, 0.7254902, 1, 1,
0.1030907, 1.234622, -0.6599644, 0, 0.7176471, 1, 1,
0.1058531, 0.06006037, -0.06638628, 0, 0.7137255, 1, 1,
0.1091936, 0.3692808, -0.2823691, 0, 0.7058824, 1, 1,
0.1198129, -1.005536, 3.141, 0, 0.6980392, 1, 1,
0.1228369, -0.5075036, 2.542598, 0, 0.6941177, 1, 1,
0.1258726, 1.248661, -1.374477, 0, 0.6862745, 1, 1,
0.1323277, 0.322942, 1.548362, 0, 0.682353, 1, 1,
0.1332176, -0.3133819, 4.685335, 0, 0.6745098, 1, 1,
0.1345701, 0.2471681, -0.1874691, 0, 0.6705883, 1, 1,
0.1346481, -0.1101867, 1.65263, 0, 0.6627451, 1, 1,
0.137329, -0.2991153, 2.823864, 0, 0.6588235, 1, 1,
0.1453887, 0.891808, -1.375003, 0, 0.6509804, 1, 1,
0.1509883, 0.2499744, -0.3363158, 0, 0.6470588, 1, 1,
0.1527302, 0.9495476, 0.2266207, 0, 0.6392157, 1, 1,
0.1599903, -0.02281846, 0.5674703, 0, 0.6352941, 1, 1,
0.1606316, -1.245781, 2.034238, 0, 0.627451, 1, 1,
0.1616271, 0.06027607, 1.166559, 0, 0.6235294, 1, 1,
0.1620267, 0.02332847, 1.712617, 0, 0.6156863, 1, 1,
0.1634829, 0.7539622, 0.5646331, 0, 0.6117647, 1, 1,
0.1638125, 0.3412356, 0.7123517, 0, 0.6039216, 1, 1,
0.1669014, 0.7004135, -0.561899, 0, 0.5960785, 1, 1,
0.167925, -0.749636, 2.792217, 0, 0.5921569, 1, 1,
0.170263, -1.800544, 2.779337, 0, 0.5843138, 1, 1,
0.1728282, 0.1526272, 0.6748551, 0, 0.5803922, 1, 1,
0.1772146, -1.022153, 3.107534, 0, 0.572549, 1, 1,
0.1802866, 1.321297, -0.1890285, 0, 0.5686275, 1, 1,
0.1810847, 0.1996996, 1.730233, 0, 0.5607843, 1, 1,
0.1827555, -1.38797, 4.830037, 0, 0.5568628, 1, 1,
0.1832926, -0.2500573, 2.107153, 0, 0.5490196, 1, 1,
0.1841414, 0.6677405, 1.23828, 0, 0.5450981, 1, 1,
0.1846489, 0.7436646, -0.6037056, 0, 0.5372549, 1, 1,
0.1858141, 0.238102, 0.6603165, 0, 0.5333334, 1, 1,
0.1911001, 0.5635949, -0.8972276, 0, 0.5254902, 1, 1,
0.1926185, 0.6019555, -0.7203415, 0, 0.5215687, 1, 1,
0.1962871, 0.9591589, 1.96657, 0, 0.5137255, 1, 1,
0.198828, 0.8732674, 1.522174, 0, 0.509804, 1, 1,
0.1998923, -0.155857, 1.27872, 0, 0.5019608, 1, 1,
0.2086317, -1.898383, 4.219865, 0, 0.4941176, 1, 1,
0.2092375, -2.74367, 2.943326, 0, 0.4901961, 1, 1,
0.2141081, 0.3011938, 0.8817236, 0, 0.4823529, 1, 1,
0.2143918, -0.5431459, 3.357162, 0, 0.4784314, 1, 1,
0.2189548, -0.3022749, 1.044243, 0, 0.4705882, 1, 1,
0.2190853, 0.6811407, 2.153085, 0, 0.4666667, 1, 1,
0.2199573, 0.2360643, 0.2619019, 0, 0.4588235, 1, 1,
0.2211299, 0.09841013, 0.8082527, 0, 0.454902, 1, 1,
0.2212891, -0.349506, 1.313686, 0, 0.4470588, 1, 1,
0.2270567, 1.216888, 0.3029836, 0, 0.4431373, 1, 1,
0.229602, 1.050957, 0.3542248, 0, 0.4352941, 1, 1,
0.2347717, 0.4668407, 2.254659, 0, 0.4313726, 1, 1,
0.2376209, -1.531833, 3.614706, 0, 0.4235294, 1, 1,
0.2398924, 1.125304, 0.3963186, 0, 0.4196078, 1, 1,
0.240233, -0.4717317, 3.530989, 0, 0.4117647, 1, 1,
0.2423736, 0.2556446, 1.329745, 0, 0.4078431, 1, 1,
0.2445579, 2.207388, -1.540434, 0, 0.4, 1, 1,
0.2545134, -0.9188676, 1.900553, 0, 0.3921569, 1, 1,
0.2551877, 1.524003, -1.000679, 0, 0.3882353, 1, 1,
0.261488, 0.01755696, 1.328966, 0, 0.3803922, 1, 1,
0.2641281, -0.3523633, 2.348776, 0, 0.3764706, 1, 1,
0.2652168, -0.8295017, 1.857377, 0, 0.3686275, 1, 1,
0.2656172, -0.06331719, 1.801136, 0, 0.3647059, 1, 1,
0.2659952, 0.3960625, 1.647521, 0, 0.3568628, 1, 1,
0.2678535, -0.9233755, 3.149499, 0, 0.3529412, 1, 1,
0.2699351, 1.109549, 1.502401, 0, 0.345098, 1, 1,
0.2710973, 0.6141751, 1.151284, 0, 0.3411765, 1, 1,
0.2785777, -0.6139888, 3.402033, 0, 0.3333333, 1, 1,
0.2786983, -0.3263916, 1.20858, 0, 0.3294118, 1, 1,
0.2801451, 0.539849, -0.4228944, 0, 0.3215686, 1, 1,
0.2827561, 2.077076, 0.09906644, 0, 0.3176471, 1, 1,
0.2971168, -0.101447, 2.159957, 0, 0.3098039, 1, 1,
0.2981564, 0.3532931, 1.471722, 0, 0.3058824, 1, 1,
0.3000278, -1.069215, 3.261554, 0, 0.2980392, 1, 1,
0.3022748, -0.0273157, 0.8314064, 0, 0.2901961, 1, 1,
0.3042302, -1.081207, 2.414068, 0, 0.2862745, 1, 1,
0.3062122, -2.687613, 2.69942, 0, 0.2784314, 1, 1,
0.3096738, 2.039905, 0.3771286, 0, 0.2745098, 1, 1,
0.3099631, -0.7976567, 3.832639, 0, 0.2666667, 1, 1,
0.3142759, -0.6315998, 1.965202, 0, 0.2627451, 1, 1,
0.3307475, -2.26386, 3.075287, 0, 0.254902, 1, 1,
0.3307483, 1.173858, 0.3814187, 0, 0.2509804, 1, 1,
0.331661, 0.5219963, -1.231536, 0, 0.2431373, 1, 1,
0.332333, -1.276496, 1.993352, 0, 0.2392157, 1, 1,
0.3446375, 0.6342735, 1.38177, 0, 0.2313726, 1, 1,
0.3455348, 0.511098, 0.1185614, 0, 0.227451, 1, 1,
0.349769, 0.5450011, 0.02162894, 0, 0.2196078, 1, 1,
0.3548186, -0.09537137, 2.64688, 0, 0.2156863, 1, 1,
0.3554426, -0.8119434, 2.469978, 0, 0.2078431, 1, 1,
0.3561285, 1.333643, -1.114157, 0, 0.2039216, 1, 1,
0.3593313, 0.6213184, 0.8488309, 0, 0.1960784, 1, 1,
0.3595804, -0.2196393, 4.610045, 0, 0.1882353, 1, 1,
0.3614112, 0.1811846, 1.401826, 0, 0.1843137, 1, 1,
0.3663503, -0.07408615, 2.142718, 0, 0.1764706, 1, 1,
0.3692446, -0.04914559, 0.3890989, 0, 0.172549, 1, 1,
0.3699324, -0.7013884, 1.485389, 0, 0.1647059, 1, 1,
0.3726012, 0.4345059, 2.02856, 0, 0.1607843, 1, 1,
0.3731546, 0.6344357, 0.9466448, 0, 0.1529412, 1, 1,
0.3766896, 0.08603624, -0.2049048, 0, 0.1490196, 1, 1,
0.3778296, 0.3912817, 2.220488, 0, 0.1411765, 1, 1,
0.3858213, 0.8262333, 1.498685, 0, 0.1372549, 1, 1,
0.3879084, 0.8515919, -0.2996907, 0, 0.1294118, 1, 1,
0.3898928, -0.8629158, 1.707498, 0, 0.1254902, 1, 1,
0.3914154, -0.6170613, 1.7211, 0, 0.1176471, 1, 1,
0.3930981, -0.1574059, 0.7667131, 0, 0.1137255, 1, 1,
0.3933135, 1.243775, 1.48256, 0, 0.1058824, 1, 1,
0.3936774, -0.4265865, 2.486809, 0, 0.09803922, 1, 1,
0.3960286, -2.137284, 3.603786, 0, 0.09411765, 1, 1,
0.3981203, -0.3560075, 2.096934, 0, 0.08627451, 1, 1,
0.3995831, -1.044981, 4.462636, 0, 0.08235294, 1, 1,
0.4046485, 1.239914, 1.365621, 0, 0.07450981, 1, 1,
0.4062732, -1.572941, 3.167691, 0, 0.07058824, 1, 1,
0.4099818, 1.104901, -0.1623545, 0, 0.0627451, 1, 1,
0.4121931, 0.7705585, -0.4471578, 0, 0.05882353, 1, 1,
0.4235137, -0.7453834, 0.5532187, 0, 0.05098039, 1, 1,
0.4269753, -0.2037279, 1.85829, 0, 0.04705882, 1, 1,
0.427678, 0.4978904, 0.7103541, 0, 0.03921569, 1, 1,
0.428426, 0.5559391, 2.88455, 0, 0.03529412, 1, 1,
0.4310616, 0.4868185, 1.078673, 0, 0.02745098, 1, 1,
0.4319645, -1.330934, 3.422488, 0, 0.02352941, 1, 1,
0.4323173, -0.5626588, 1.40047, 0, 0.01568628, 1, 1,
0.4379361, -1.450361, 3.614887, 0, 0.01176471, 1, 1,
0.4420875, -0.842501, 1.524746, 0, 0.003921569, 1, 1,
0.4487393, -0.8101117, 2.694925, 0.003921569, 0, 1, 1,
0.4493829, -0.7618617, 1.016378, 0.007843138, 0, 1, 1,
0.4532295, 0.01686764, 2.255369, 0.01568628, 0, 1, 1,
0.4561301, 1.460331, -0.7689461, 0.01960784, 0, 1, 1,
0.4584277, 0.7917418, 1.338318, 0.02745098, 0, 1, 1,
0.4657182, -0.9951972, 0.7855476, 0.03137255, 0, 1, 1,
0.4703033, -0.9208171, 3.875358, 0.03921569, 0, 1, 1,
0.4704466, 1.613309, 1.122507, 0.04313726, 0, 1, 1,
0.4757153, 1.1451, 1.345907, 0.05098039, 0, 1, 1,
0.476208, -1.715584, 2.432378, 0.05490196, 0, 1, 1,
0.4767767, 0.6777799, -0.5587054, 0.0627451, 0, 1, 1,
0.4791841, 0.8573536, 0.05724998, 0.06666667, 0, 1, 1,
0.4806448, 0.3888805, -0.7015392, 0.07450981, 0, 1, 1,
0.4817909, -0.4612787, 3.121238, 0.07843138, 0, 1, 1,
0.4817923, 0.2405774, 2.158486, 0.08627451, 0, 1, 1,
0.4842876, -1.763723, 1.719369, 0.09019608, 0, 1, 1,
0.4885481, 0.5732126, 1.652921, 0.09803922, 0, 1, 1,
0.490918, 1.715087, 0.6276083, 0.1058824, 0, 1, 1,
0.4947983, -1.073633, 3.77425, 0.1098039, 0, 1, 1,
0.4962096, -0.09866638, 2.487457, 0.1176471, 0, 1, 1,
0.4982259, 1.399594, -0.3558171, 0.1215686, 0, 1, 1,
0.500064, -0.9268624, 2.553188, 0.1294118, 0, 1, 1,
0.5008744, 1.866659, -0.2982379, 0.1333333, 0, 1, 1,
0.501293, -0.6113493, 2.579014, 0.1411765, 0, 1, 1,
0.5033586, -1.812989, 1.476274, 0.145098, 0, 1, 1,
0.5085692, 1.201125, -0.1896663, 0.1529412, 0, 1, 1,
0.5090654, 0.001222781, 0.1652889, 0.1568628, 0, 1, 1,
0.5096996, -0.8343043, 1.162015, 0.1647059, 0, 1, 1,
0.5127372, 0.6800675, 1.985609, 0.1686275, 0, 1, 1,
0.5218982, -0.7192246, 2.606624, 0.1764706, 0, 1, 1,
0.5352284, 0.2402614, 0.722432, 0.1803922, 0, 1, 1,
0.5389421, -0.9238301, 3.47657, 0.1882353, 0, 1, 1,
0.540465, -0.2424388, 1.626007, 0.1921569, 0, 1, 1,
0.5416473, 0.06901997, 0.4642198, 0.2, 0, 1, 1,
0.5434347, -0.4567903, 2.998023, 0.2078431, 0, 1, 1,
0.5506912, 0.9446333, 0.05990273, 0.2117647, 0, 1, 1,
0.5531927, -2.251804, 4.225498, 0.2196078, 0, 1, 1,
0.5553705, 0.171044, 1.994985, 0.2235294, 0, 1, 1,
0.5578721, -0.6654273, 2.455752, 0.2313726, 0, 1, 1,
0.5627577, -0.5223187, 1.53845, 0.2352941, 0, 1, 1,
0.5646741, -0.1039587, 2.984077, 0.2431373, 0, 1, 1,
0.5659527, -0.68753, 1.422203, 0.2470588, 0, 1, 1,
0.5667151, -1.851264, 1.692227, 0.254902, 0, 1, 1,
0.568029, 0.3045212, 0.1396669, 0.2588235, 0, 1, 1,
0.5697972, 0.8386963, 0.341038, 0.2666667, 0, 1, 1,
0.570092, 1.440148, 1.133324, 0.2705882, 0, 1, 1,
0.5715917, 0.8205392, 0.01852921, 0.2784314, 0, 1, 1,
0.5752496, 1.049355, -0.3730858, 0.282353, 0, 1, 1,
0.5785227, 1.08097, 1.458968, 0.2901961, 0, 1, 1,
0.5793515, 0.6461587, -0.3242351, 0.2941177, 0, 1, 1,
0.579489, 0.05740172, 0.1899754, 0.3019608, 0, 1, 1,
0.5800206, 1.541159, -1.058056, 0.3098039, 0, 1, 1,
0.5814438, -1.654985, 1.629366, 0.3137255, 0, 1, 1,
0.5935839, 0.6214809, 0.491558, 0.3215686, 0, 1, 1,
0.5950224, 1.890568, -0.8036097, 0.3254902, 0, 1, 1,
0.5955904, -0.1806181, 2.881586, 0.3333333, 0, 1, 1,
0.6020393, -1.047403, 1.770921, 0.3372549, 0, 1, 1,
0.602083, -1.185171, 3.222889, 0.345098, 0, 1, 1,
0.6025226, -0.4444445, 2.218848, 0.3490196, 0, 1, 1,
0.6055397, 1.243736, 1.81088, 0.3568628, 0, 1, 1,
0.6118482, -0.5554398, 0.9041848, 0.3607843, 0, 1, 1,
0.6173244, 0.09888846, 1.827443, 0.3686275, 0, 1, 1,
0.6181569, -0.2729487, 4.000287, 0.372549, 0, 1, 1,
0.6186892, -0.6603035, 1.743938, 0.3803922, 0, 1, 1,
0.6193564, 0.2348868, -0.398369, 0.3843137, 0, 1, 1,
0.6231353, -1.573284, 4.578118, 0.3921569, 0, 1, 1,
0.6234683, 1.454301, 0.7185941, 0.3960784, 0, 1, 1,
0.6267962, 0.5440177, 0.8267723, 0.4039216, 0, 1, 1,
0.6278199, 0.3888292, 0.9187612, 0.4117647, 0, 1, 1,
0.6286251, -0.1851317, 2.973493, 0.4156863, 0, 1, 1,
0.632431, 0.2017082, 2.21082, 0.4235294, 0, 1, 1,
0.6331465, 0.4820497, 0.3159839, 0.427451, 0, 1, 1,
0.6354028, 0.3337013, 2.883367, 0.4352941, 0, 1, 1,
0.6355429, -2.086622, 2.966807, 0.4392157, 0, 1, 1,
0.638871, -0.2930007, 2.178213, 0.4470588, 0, 1, 1,
0.6416467, 0.263609, -0.9738691, 0.4509804, 0, 1, 1,
0.650069, 0.0214786, 0.9002586, 0.4588235, 0, 1, 1,
0.6553205, 0.1839028, -0.1368487, 0.4627451, 0, 1, 1,
0.6603419, -0.2578829, 2.557095, 0.4705882, 0, 1, 1,
0.6632841, 1.353406, 0.5347423, 0.4745098, 0, 1, 1,
0.670006, 1.143689, 2.024227, 0.4823529, 0, 1, 1,
0.6702955, 1.360308, -0.004646744, 0.4862745, 0, 1, 1,
0.6705679, 0.4975071, -0.1087815, 0.4941176, 0, 1, 1,
0.6720188, 0.7883244, 0.6723185, 0.5019608, 0, 1, 1,
0.6720984, 1.722301, -1.100126, 0.5058824, 0, 1, 1,
0.6827464, 0.3201676, 1.967959, 0.5137255, 0, 1, 1,
0.6922879, 0.2458292, -0.3213919, 0.5176471, 0, 1, 1,
0.6935538, -0.3273693, 4.071496, 0.5254902, 0, 1, 1,
0.6985795, 1.01382, 1.440783, 0.5294118, 0, 1, 1,
0.698751, -0.5092149, 1.930146, 0.5372549, 0, 1, 1,
0.7000341, -1.472663, 1.845219, 0.5411765, 0, 1, 1,
0.7001166, 0.5215985, 1.476902, 0.5490196, 0, 1, 1,
0.7053875, 0.2318976, 1.278355, 0.5529412, 0, 1, 1,
0.7062551, 0.488384, 0.3582473, 0.5607843, 0, 1, 1,
0.7085402, 1.18355, 1.828292, 0.5647059, 0, 1, 1,
0.7114303, 0.6848819, 0.2176927, 0.572549, 0, 1, 1,
0.7131915, 0.85158, 0.4482607, 0.5764706, 0, 1, 1,
0.7218965, 0.206098, 2.786504, 0.5843138, 0, 1, 1,
0.7224395, 0.2643214, 1.445157, 0.5882353, 0, 1, 1,
0.7232431, -0.6807184, 3.313529, 0.5960785, 0, 1, 1,
0.7242234, -1.39385, 2.205515, 0.6039216, 0, 1, 1,
0.7270648, 0.8419559, 0.004711769, 0.6078432, 0, 1, 1,
0.7271382, -0.1507471, 2.781277, 0.6156863, 0, 1, 1,
0.7329099, 0.5244663, 1.456418, 0.6196079, 0, 1, 1,
0.7334314, -0.3203799, 0.9937805, 0.627451, 0, 1, 1,
0.7390306, 0.6129325, 0.8107687, 0.6313726, 0, 1, 1,
0.746421, -0.2742945, 1.470691, 0.6392157, 0, 1, 1,
0.7565647, 1.419328, -0.5794399, 0.6431373, 0, 1, 1,
0.7578101, -1.278666, 2.731266, 0.6509804, 0, 1, 1,
0.7594278, -0.2870601, 0.6616694, 0.654902, 0, 1, 1,
0.76058, -1.242706, 1.68108, 0.6627451, 0, 1, 1,
0.7630312, -0.8345115, 0.3231602, 0.6666667, 0, 1, 1,
0.7643577, -0.5864022, 3.203076, 0.6745098, 0, 1, 1,
0.7670295, -0.2549435, 1.807311, 0.6784314, 0, 1, 1,
0.7768438, -0.3592862, 0.6563386, 0.6862745, 0, 1, 1,
0.7790258, 1.484832, 0.4629478, 0.6901961, 0, 1, 1,
0.7815562, 2.143029, -0.2416025, 0.6980392, 0, 1, 1,
0.7857239, -0.5040581, 1.563642, 0.7058824, 0, 1, 1,
0.7923881, -0.7026081, 2.86685, 0.7098039, 0, 1, 1,
0.7998265, 0.332237, 1.766524, 0.7176471, 0, 1, 1,
0.800215, 1.321744, 1.661264, 0.7215686, 0, 1, 1,
0.8021967, -0.443134, 2.38154, 0.7294118, 0, 1, 1,
0.8038157, -0.9336131, 2.157152, 0.7333333, 0, 1, 1,
0.8098338, -0.3975357, 3.182492, 0.7411765, 0, 1, 1,
0.8192171, 1.123492, -0.6827142, 0.7450981, 0, 1, 1,
0.8234294, 1.557066, 2.588093, 0.7529412, 0, 1, 1,
0.8332361, -1.665795, 2.377811, 0.7568628, 0, 1, 1,
0.8357277, -0.6221241, 3.387501, 0.7647059, 0, 1, 1,
0.8386111, 1.001999, -0.7683012, 0.7686275, 0, 1, 1,
0.8436651, 0.770105, 0.2882281, 0.7764706, 0, 1, 1,
0.8446065, 1.211361, -0.9796283, 0.7803922, 0, 1, 1,
0.8448432, 2.196086, -0.4954394, 0.7882353, 0, 1, 1,
0.8457888, 0.3614648, 1.27519, 0.7921569, 0, 1, 1,
0.854163, 1.040408, 0.4198101, 0.8, 0, 1, 1,
0.8727273, 0.5434948, 0.3606507, 0.8078431, 0, 1, 1,
0.8784929, 0.3468719, 0.02076947, 0.8117647, 0, 1, 1,
0.8895763, -0.2395525, 2.60807, 0.8196079, 0, 1, 1,
0.8968204, -0.4536211, 2.83509, 0.8235294, 0, 1, 1,
0.8978427, 0.4105794, 1.493766, 0.8313726, 0, 1, 1,
0.9011347, 0.4418583, 2.339907, 0.8352941, 0, 1, 1,
0.9015416, 0.1619795, 0.6556993, 0.8431373, 0, 1, 1,
0.909153, -1.302333, 2.9722, 0.8470588, 0, 1, 1,
0.9112574, -0.2263277, 1.541434, 0.854902, 0, 1, 1,
0.9213576, 0.5510966, 0.3111942, 0.8588235, 0, 1, 1,
0.9323301, 0.09006146, 0.4841722, 0.8666667, 0, 1, 1,
0.9333081, 1.325765, 1.626526, 0.8705882, 0, 1, 1,
0.9379159, -0.9043754, 2.687426, 0.8784314, 0, 1, 1,
0.938638, 1.907279, 0.2881323, 0.8823529, 0, 1, 1,
0.9438432, 0.9563131, 1.269895, 0.8901961, 0, 1, 1,
0.9519469, 0.3636491, 0.9049614, 0.8941177, 0, 1, 1,
0.9578393, -1.095835, 3.063196, 0.9019608, 0, 1, 1,
0.9630204, -0.3758007, 1.490985, 0.9098039, 0, 1, 1,
0.9631422, 1.241329, 0.8201118, 0.9137255, 0, 1, 1,
0.9678014, -0.9012985, 1.702876, 0.9215686, 0, 1, 1,
0.970446, -0.6608457, 4.719017, 0.9254902, 0, 1, 1,
0.9749334, -0.3350092, 2.617903, 0.9333333, 0, 1, 1,
0.9856676, -0.154349, 2.047112, 0.9372549, 0, 1, 1,
0.989706, 2.054327, 1.548293, 0.945098, 0, 1, 1,
1.001668, 1.34301, 0.2324582, 0.9490196, 0, 1, 1,
1.002424, -0.7306315, 2.947481, 0.9568627, 0, 1, 1,
1.005253, 0.1144273, 1.328525, 0.9607843, 0, 1, 1,
1.01369, -1.026797, 1.853752, 0.9686275, 0, 1, 1,
1.014612, 0.6115961, 0.05701573, 0.972549, 0, 1, 1,
1.024977, 0.7830231, 1.710213, 0.9803922, 0, 1, 1,
1.025608, 0.8722575, 0.3125875, 0.9843137, 0, 1, 1,
1.026156, 0.5299591, 1.207642, 0.9921569, 0, 1, 1,
1.02626, -0.5574427, 2.192782, 0.9960784, 0, 1, 1,
1.028822, 2.18561, 1.760312, 1, 0, 0.9960784, 1,
1.054243, 0.180764, 0.2977412, 1, 0, 0.9882353, 1,
1.061219, 0.3234672, 0.4663969, 1, 0, 0.9843137, 1,
1.065569, 1.524057, 1.438781, 1, 0, 0.9764706, 1,
1.066895, -0.2767276, 1.17839, 1, 0, 0.972549, 1,
1.07058, 1.325456, 1.200579, 1, 0, 0.9647059, 1,
1.080195, 0.4967605, 0.7205918, 1, 0, 0.9607843, 1,
1.09438, -1.30378, 2.116995, 1, 0, 0.9529412, 1,
1.0953, -0.8465632, 2.801908, 1, 0, 0.9490196, 1,
1.097705, 0.6972233, 1.426146, 1, 0, 0.9411765, 1,
1.105446, 0.4352414, 0.367189, 1, 0, 0.9372549, 1,
1.113886, 1.740928, -0.1221161, 1, 0, 0.9294118, 1,
1.115493, 0.7855227, 1.186557, 1, 0, 0.9254902, 1,
1.120359, -0.2081755, 1.71981, 1, 0, 0.9176471, 1,
1.121471, 0.1779866, -0.2503113, 1, 0, 0.9137255, 1,
1.128591, -0.5940123, 2.619638, 1, 0, 0.9058824, 1,
1.132179, -0.3357037, 2.075753, 1, 0, 0.9019608, 1,
1.142327, 0.8461502, 2.173027, 1, 0, 0.8941177, 1,
1.147324, -0.6598261, 3.146096, 1, 0, 0.8862745, 1,
1.149554, 0.01735206, 2.634586, 1, 0, 0.8823529, 1,
1.153505, -2.29377, 1.601797, 1, 0, 0.8745098, 1,
1.161741, -0.2655354, 1.862755, 1, 0, 0.8705882, 1,
1.165733, 0.1413147, 0.4266931, 1, 0, 0.8627451, 1,
1.169989, -0.08563223, 1.240396, 1, 0, 0.8588235, 1,
1.183258, 0.2358051, -0.3954484, 1, 0, 0.8509804, 1,
1.190533, 0.255365, -0.1040362, 1, 0, 0.8470588, 1,
1.201973, 0.5529477, 0.5068923, 1, 0, 0.8392157, 1,
1.204524, -1.43077, 3.299961, 1, 0, 0.8352941, 1,
1.208239, -0.5044768, 2.527518, 1, 0, 0.827451, 1,
1.212815, 0.6719755, 0.3939182, 1, 0, 0.8235294, 1,
1.213321, -0.8598774, 1.505141, 1, 0, 0.8156863, 1,
1.213706, -0.3720168, 2.026063, 1, 0, 0.8117647, 1,
1.2171, 1.269349, 1.989995, 1, 0, 0.8039216, 1,
1.222576, 1.504033, 1.377216, 1, 0, 0.7960784, 1,
1.236695, -1.540788, 2.167272, 1, 0, 0.7921569, 1,
1.238017, -0.5178713, 2.201413, 1, 0, 0.7843137, 1,
1.238322, -0.9317758, 3.555955, 1, 0, 0.7803922, 1,
1.24007, -1.22933, 2.2818, 1, 0, 0.772549, 1,
1.240184, -0.7088031, 2.447562, 1, 0, 0.7686275, 1,
1.24511, -1.394834, 2.083416, 1, 0, 0.7607843, 1,
1.249762, 0.9700371, 1.412073, 1, 0, 0.7568628, 1,
1.253363, -0.5730832, 1.993965, 1, 0, 0.7490196, 1,
1.256782, 0.5099586, -0.01276389, 1, 0, 0.7450981, 1,
1.263863, -0.7927194, 1.93235, 1, 0, 0.7372549, 1,
1.272704, -1.402131, 2.868993, 1, 0, 0.7333333, 1,
1.273528, -0.9430045, 2.799883, 1, 0, 0.7254902, 1,
1.274174, -0.2533396, 1.118202, 1, 0, 0.7215686, 1,
1.298156, 1.248535, 0.4265281, 1, 0, 0.7137255, 1,
1.303249, -1.123314, 1.022241, 1, 0, 0.7098039, 1,
1.307635, 1.599576, 2.151045, 1, 0, 0.7019608, 1,
1.307638, 0.09868728, 1.497113, 1, 0, 0.6941177, 1,
1.310825, 0.08629379, 0.5377359, 1, 0, 0.6901961, 1,
1.334377, -0.1929117, 3.197827, 1, 0, 0.682353, 1,
1.344582, 0.2282048, 1.235884, 1, 0, 0.6784314, 1,
1.351043, 0.930109, 1.518624, 1, 0, 0.6705883, 1,
1.374839, -0.2430088, 0.101423, 1, 0, 0.6666667, 1,
1.376271, 1.354501, 0.7072028, 1, 0, 0.6588235, 1,
1.387392, 1.058912, 1.032928, 1, 0, 0.654902, 1,
1.389063, 0.8948566, 1.34198, 1, 0, 0.6470588, 1,
1.389937, 0.486446, 2.572161, 1, 0, 0.6431373, 1,
1.391517, 0.03801667, 2.731122, 1, 0, 0.6352941, 1,
1.393373, 1.312403, 0.6135983, 1, 0, 0.6313726, 1,
1.394821, -0.6775359, 3.372669, 1, 0, 0.6235294, 1,
1.395982, -1.846959, 2.114422, 1, 0, 0.6196079, 1,
1.39668, -0.2251436, 2.140614, 1, 0, 0.6117647, 1,
1.397983, -0.5081394, 2.700429, 1, 0, 0.6078432, 1,
1.403844, -0.9748821, 3.245989, 1, 0, 0.6, 1,
1.413857, -0.1714198, 1.209964, 1, 0, 0.5921569, 1,
1.414272, -1.10034, 1.379323, 1, 0, 0.5882353, 1,
1.415588, 0.01952376, 1.629116, 1, 0, 0.5803922, 1,
1.430375, -1.090094, 1.161627, 1, 0, 0.5764706, 1,
1.433661, 0.8158292, 1.754454, 1, 0, 0.5686275, 1,
1.438069, 0.2129255, -0.2079944, 1, 0, 0.5647059, 1,
1.450012, -1.196634, 3.994748, 1, 0, 0.5568628, 1,
1.456625, 1.020552, 0.9817235, 1, 0, 0.5529412, 1,
1.459225, 0.7757098, 1.639965, 1, 0, 0.5450981, 1,
1.466109, 0.2787378, 2.221845, 1, 0, 0.5411765, 1,
1.46798, -1.230272, 0.3597966, 1, 0, 0.5333334, 1,
1.474234, 1.029707, 1.395337, 1, 0, 0.5294118, 1,
1.489997, 0.5839351, -0.3869645, 1, 0, 0.5215687, 1,
1.505485, -0.240334, 2.293443, 1, 0, 0.5176471, 1,
1.520435, -0.4119352, 0.3203603, 1, 0, 0.509804, 1,
1.54148, -0.3948866, 2.081568, 1, 0, 0.5058824, 1,
1.545581, -0.1625403, 1.00972, 1, 0, 0.4980392, 1,
1.561458, -0.5497765, 0.6544635, 1, 0, 0.4901961, 1,
1.566419, 1.637735, 1.098759, 1, 0, 0.4862745, 1,
1.573967, 0.4351122, 2.103359, 1, 0, 0.4784314, 1,
1.578874, -0.6456555, 1.979643, 1, 0, 0.4745098, 1,
1.595364, -1.298605, 2.608128, 1, 0, 0.4666667, 1,
1.611108, 0.07581653, 2.461524, 1, 0, 0.4627451, 1,
1.629811, -0.8208446, 1.694939, 1, 0, 0.454902, 1,
1.630894, -0.3657276, 3.53136, 1, 0, 0.4509804, 1,
1.631177, -0.2249606, 2.135834, 1, 0, 0.4431373, 1,
1.631574, -0.1913633, 2.368562, 1, 0, 0.4392157, 1,
1.632541, 0.866984, 0.5149704, 1, 0, 0.4313726, 1,
1.639016, 1.054473, 2.154921, 1, 0, 0.427451, 1,
1.646635, 1.788376, 1.944576, 1, 0, 0.4196078, 1,
1.655677, -1.567811, 3.443609, 1, 0, 0.4156863, 1,
1.65602, -0.418043, 1.839124, 1, 0, 0.4078431, 1,
1.66604, -0.8553999, 2.565629, 1, 0, 0.4039216, 1,
1.674621, 1.101285, 0.4373703, 1, 0, 0.3960784, 1,
1.68849, -1.66578, 2.353887, 1, 0, 0.3882353, 1,
1.695823, -1.072065, 3.203997, 1, 0, 0.3843137, 1,
1.698864, -0.5138981, 2.142462, 1, 0, 0.3764706, 1,
1.705891, -1.611887, 4.287428, 1, 0, 0.372549, 1,
1.711337, 0.03705172, 3.333981, 1, 0, 0.3647059, 1,
1.713436, -0.0434103, 2.161718, 1, 0, 0.3607843, 1,
1.713684, 1.560664, 2.41446, 1, 0, 0.3529412, 1,
1.729271, -0.03127124, 0.3712142, 1, 0, 0.3490196, 1,
1.732868, -0.7077657, 1.707601, 1, 0, 0.3411765, 1,
1.745478, -1.372943, 2.903868, 1, 0, 0.3372549, 1,
1.750581, 1.028479, 1.348112, 1, 0, 0.3294118, 1,
1.753086, 1.159466, -0.1211012, 1, 0, 0.3254902, 1,
1.754505, -0.8926709, 1.855366, 1, 0, 0.3176471, 1,
1.762801, 0.1521766, 0.3907117, 1, 0, 0.3137255, 1,
1.770914, 1.138885, 1.799577, 1, 0, 0.3058824, 1,
1.772794, 0.5819647, 0.02307852, 1, 0, 0.2980392, 1,
1.783702, -0.3242552, 1.798132, 1, 0, 0.2941177, 1,
1.78422, 0.4225339, 1.441852, 1, 0, 0.2862745, 1,
1.787199, -0.3475905, 0.6890082, 1, 0, 0.282353, 1,
1.793503, -0.8424612, 0.9911358, 1, 0, 0.2745098, 1,
1.802676, 1.263986, 0.1162652, 1, 0, 0.2705882, 1,
1.817151, -1.063919, 2.55112, 1, 0, 0.2627451, 1,
1.824557, 1.014499, 0.04669423, 1, 0, 0.2588235, 1,
1.850841, 1.984335, -1.574274, 1, 0, 0.2509804, 1,
1.8603, 0.06756599, 0.4586567, 1, 0, 0.2470588, 1,
1.869401, -0.3892463, 1.82649, 1, 0, 0.2392157, 1,
1.877848, 0.7282882, 1.150711, 1, 0, 0.2352941, 1,
1.884761, 2.037707, -0.4414559, 1, 0, 0.227451, 1,
1.887604, 0.4578148, 1.674418, 1, 0, 0.2235294, 1,
1.922177, 1.451505, -1.281303, 1, 0, 0.2156863, 1,
1.947384, 1.489842, 1.629704, 1, 0, 0.2117647, 1,
1.953338, -0.7783374, 0.5171663, 1, 0, 0.2039216, 1,
1.962876, 2.033053, 0.7902157, 1, 0, 0.1960784, 1,
2.001579, -0.9469162, 0.6242815, 1, 0, 0.1921569, 1,
2.021326, 0.07446672, -0.1206669, 1, 0, 0.1843137, 1,
2.029068, -0.06730855, 0.6010896, 1, 0, 0.1803922, 1,
2.031185, 0.9417533, 1.283661, 1, 0, 0.172549, 1,
2.044435, -0.7425356, 3.29358, 1, 0, 0.1686275, 1,
2.051449, 0.1317709, 3.515571, 1, 0, 0.1607843, 1,
2.074592, -0.8180323, 1.902463, 1, 0, 0.1568628, 1,
2.076909, 0.2363046, -0.8217032, 1, 0, 0.1490196, 1,
2.085897, 0.6136537, 2.574119, 1, 0, 0.145098, 1,
2.121168, 1.24974, 2.033942, 1, 0, 0.1372549, 1,
2.125026, 0.1092827, 3.229094, 1, 0, 0.1333333, 1,
2.206214, -0.2584349, 1.275242, 1, 0, 0.1254902, 1,
2.226916, -0.6560508, -0.5541793, 1, 0, 0.1215686, 1,
2.350804, -0.6717328, 0.647131, 1, 0, 0.1137255, 1,
2.353061, 1.027042, -0.7887092, 1, 0, 0.1098039, 1,
2.373011, 1.47059, 0.7357255, 1, 0, 0.1019608, 1,
2.407866, -0.1372334, 0.1483858, 1, 0, 0.09411765, 1,
2.415911, -2.84374, 1.713182, 1, 0, 0.09019608, 1,
2.428851, -0.9034137, 2.166642, 1, 0, 0.08235294, 1,
2.450666, 0.8797677, 0.3393052, 1, 0, 0.07843138, 1,
2.470104, 0.01034304, 2.030533, 1, 0, 0.07058824, 1,
2.477175, -0.4031717, 1.232253, 1, 0, 0.06666667, 1,
2.512824, -0.628552, 2.850317, 1, 0, 0.05882353, 1,
2.542425, -1.150726, 2.342426, 1, 0, 0.05490196, 1,
2.551689, -0.455166, 1.109765, 1, 0, 0.04705882, 1,
2.566853, -0.3526272, 2.319027, 1, 0, 0.04313726, 1,
2.712957, 0.162748, 0.04285252, 1, 0, 0.03529412, 1,
2.74456, 0.07464693, 2.487179, 1, 0, 0.03137255, 1,
2.780652, -0.5499223, 2.49633, 1, 0, 0.02352941, 1,
2.873593, -0.1908413, 1.482017, 1, 0, 0.01960784, 1,
3.006214, -0.2098197, 1.514843, 1, 0, 0.01176471, 1,
3.488089, -0.02228786, 0.1086212, 1, 0, 0.007843138, 1
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
0.04863346, -3.832949, -6.813898, 0, -0.5, 0.5, 0.5,
0.04863346, -3.832949, -6.813898, 1, -0.5, 0.5, 0.5,
0.04863346, -3.832949, -6.813898, 1, 1.5, 0.5, 0.5,
0.04863346, -3.832949, -6.813898, 0, 1.5, 0.5, 0.5
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
-4.556797, 0.07428098, -6.813898, 0, -0.5, 0.5, 0.5,
-4.556797, 0.07428098, -6.813898, 1, -0.5, 0.5, 0.5,
-4.556797, 0.07428098, -6.813898, 1, 1.5, 0.5, 0.5,
-4.556797, 0.07428098, -6.813898, 0, 1.5, 0.5, 0.5
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
-4.556797, -3.832949, 0.001101971, 0, -0.5, 0.5, 0.5,
-4.556797, -3.832949, 0.001101971, 1, -0.5, 0.5, 0.5,
-4.556797, -3.832949, 0.001101971, 1, 1.5, 0.5, 0.5,
-4.556797, -3.832949, 0.001101971, 0, 1.5, 0.5, 0.5
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
-3, -2.93128, -5.241206,
3, -2.93128, -5.241206,
-3, -2.93128, -5.241206,
-3, -3.081558, -5.503321,
-2, -2.93128, -5.241206,
-2, -3.081558, -5.503321,
-1, -2.93128, -5.241206,
-1, -3.081558, -5.503321,
0, -2.93128, -5.241206,
0, -3.081558, -5.503321,
1, -2.93128, -5.241206,
1, -3.081558, -5.503321,
2, -2.93128, -5.241206,
2, -3.081558, -5.503321,
3, -2.93128, -5.241206,
3, -3.081558, -5.503321
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
-3, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
-3, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
-3, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
-3, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
-2, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
-2, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
-2, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
-2, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
-1, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
-1, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
-1, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
-1, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
0, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
0, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
0, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
0, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
1, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
1, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
1, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
1, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
2, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
2, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
2, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
2, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5,
3, -3.382115, -6.027552, 0, -0.5, 0.5, 0.5,
3, -3.382115, -6.027552, 1, -0.5, 0.5, 0.5,
3, -3.382115, -6.027552, 1, 1.5, 0.5, 0.5,
3, -3.382115, -6.027552, 0, 1.5, 0.5, 0.5
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
-3.494005, -2, -5.241206,
-3.494005, 2, -5.241206,
-3.494005, -2, -5.241206,
-3.671137, -2, -5.503321,
-3.494005, -1, -5.241206,
-3.671137, -1, -5.503321,
-3.494005, 0, -5.241206,
-3.671137, 0, -5.503321,
-3.494005, 1, -5.241206,
-3.671137, 1, -5.503321,
-3.494005, 2, -5.241206,
-3.671137, 2, -5.503321
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
-4.025401, -2, -6.027552, 0, -0.5, 0.5, 0.5,
-4.025401, -2, -6.027552, 1, -0.5, 0.5, 0.5,
-4.025401, -2, -6.027552, 1, 1.5, 0.5, 0.5,
-4.025401, -2, -6.027552, 0, 1.5, 0.5, 0.5,
-4.025401, -1, -6.027552, 0, -0.5, 0.5, 0.5,
-4.025401, -1, -6.027552, 1, -0.5, 0.5, 0.5,
-4.025401, -1, -6.027552, 1, 1.5, 0.5, 0.5,
-4.025401, -1, -6.027552, 0, 1.5, 0.5, 0.5,
-4.025401, 0, -6.027552, 0, -0.5, 0.5, 0.5,
-4.025401, 0, -6.027552, 1, -0.5, 0.5, 0.5,
-4.025401, 0, -6.027552, 1, 1.5, 0.5, 0.5,
-4.025401, 0, -6.027552, 0, 1.5, 0.5, 0.5,
-4.025401, 1, -6.027552, 0, -0.5, 0.5, 0.5,
-4.025401, 1, -6.027552, 1, -0.5, 0.5, 0.5,
-4.025401, 1, -6.027552, 1, 1.5, 0.5, 0.5,
-4.025401, 1, -6.027552, 0, 1.5, 0.5, 0.5,
-4.025401, 2, -6.027552, 0, -0.5, 0.5, 0.5,
-4.025401, 2, -6.027552, 1, -0.5, 0.5, 0.5,
-4.025401, 2, -6.027552, 1, 1.5, 0.5, 0.5,
-4.025401, 2, -6.027552, 0, 1.5, 0.5, 0.5
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
-3.494005, -2.93128, -4,
-3.494005, -2.93128, 4,
-3.494005, -2.93128, -4,
-3.671137, -3.081558, -4,
-3.494005, -2.93128, -2,
-3.671137, -3.081558, -2,
-3.494005, -2.93128, 0,
-3.671137, -3.081558, 0,
-3.494005, -2.93128, 2,
-3.671137, -3.081558, 2,
-3.494005, -2.93128, 4,
-3.671137, -3.081558, 4
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
-4.025401, -3.382115, -4, 0, -0.5, 0.5, 0.5,
-4.025401, -3.382115, -4, 1, -0.5, 0.5, 0.5,
-4.025401, -3.382115, -4, 1, 1.5, 0.5, 0.5,
-4.025401, -3.382115, -4, 0, 1.5, 0.5, 0.5,
-4.025401, -3.382115, -2, 0, -0.5, 0.5, 0.5,
-4.025401, -3.382115, -2, 1, -0.5, 0.5, 0.5,
-4.025401, -3.382115, -2, 1, 1.5, 0.5, 0.5,
-4.025401, -3.382115, -2, 0, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 0, 0, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 0, 1, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 0, 1, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 0, 0, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 2, 0, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 2, 1, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 2, 1, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 2, 0, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 4, 0, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 4, 1, -0.5, 0.5, 0.5,
-4.025401, -3.382115, 4, 1, 1.5, 0.5, 0.5,
-4.025401, -3.382115, 4, 0, 1.5, 0.5, 0.5
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
-3.494005, -2.93128, -5.241206,
-3.494005, 3.079842, -5.241206,
-3.494005, -2.93128, 5.24341,
-3.494005, 3.079842, 5.24341,
-3.494005, -2.93128, -5.241206,
-3.494005, -2.93128, 5.24341,
-3.494005, 3.079842, -5.241206,
-3.494005, 3.079842, 5.24341,
-3.494005, -2.93128, -5.241206,
3.591272, -2.93128, -5.241206,
-3.494005, -2.93128, 5.24341,
3.591272, -2.93128, 5.24341,
-3.494005, 3.079842, -5.241206,
3.591272, 3.079842, -5.241206,
-3.494005, 3.079842, 5.24341,
3.591272, 3.079842, 5.24341,
3.591272, -2.93128, -5.241206,
3.591272, 3.079842, -5.241206,
3.591272, -2.93128, 5.24341,
3.591272, 3.079842, 5.24341,
3.591272, -2.93128, -5.241206,
3.591272, -2.93128, 5.24341,
3.591272, 3.079842, -5.241206,
3.591272, 3.079842, 5.24341
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
var radius = 7.480722;
var distance = 33.28257;
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
mvMatrix.translate( -0.04863346, -0.07428098, -0.001101971 );
mvMatrix.scale( 1.141565, 1.345556, 0.7714449 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.28257);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Bendiocarb<-read.table("Bendiocarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Bendiocarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Bendiocarb' not found
```

```r
y<-Bendiocarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Bendiocarb' not found
```

```r
z<-Bendiocarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Bendiocarb' not found
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
-3.390822, -0.05608068, -1.201622, 0, 0, 1, 1, 1,
-3.334783, -1.920917, -3.015294, 1, 0, 0, 1, 1,
-3.296271, -0.2880273, -0.9526256, 1, 0, 0, 1, 1,
-3.17379, 0.1945884, -3.145816, 1, 0, 0, 1, 1,
-2.855592, 0.431032, -0.2113281, 1, 0, 0, 1, 1,
-2.801095, -1.077068, -5.076676, 1, 0, 0, 1, 1,
-2.748311, -0.8553228, -0.4852174, 0, 0, 0, 1, 1,
-2.675996, 0.04438419, -0.7396131, 0, 0, 0, 1, 1,
-2.637165, -0.2285851, -1.582564, 0, 0, 0, 1, 1,
-2.617638, 0.3438087, -0.4648871, 0, 0, 0, 1, 1,
-2.599091, 1.261978, 0.7121235, 0, 0, 0, 1, 1,
-2.531597, 1.483087, 0.0897223, 0, 0, 0, 1, 1,
-2.490213, -0.6920826, -0.1350448, 0, 0, 0, 1, 1,
-2.469797, 0.957539, 0.4142027, 1, 1, 1, 1, 1,
-2.462889, -0.02467049, -2.460749, 1, 1, 1, 1, 1,
-2.338486, -0.02712126, -1.039671, 1, 1, 1, 1, 1,
-2.274837, 0.9256083, -1.646711, 1, 1, 1, 1, 1,
-2.269112, 0.05552571, -1.877262, 1, 1, 1, 1, 1,
-2.267443, -0.9302217, -3.184309, 1, 1, 1, 1, 1,
-2.249883, -0.5613232, -2.081841, 1, 1, 1, 1, 1,
-2.234076, 0.7271997, 0.8847246, 1, 1, 1, 1, 1,
-2.21937, 0.1590351, -1.707464, 1, 1, 1, 1, 1,
-2.207747, 1.897565, 0.1768858, 1, 1, 1, 1, 1,
-2.180189, 0.8389783, -0.2600906, 1, 1, 1, 1, 1,
-2.174551, 0.4537647, -1.57076, 1, 1, 1, 1, 1,
-2.168532, -2.471725, -4.271293, 1, 1, 1, 1, 1,
-2.137377, -0.6682912, -1.461486, 1, 1, 1, 1, 1,
-2.130263, 0.4093787, -2.345347, 1, 1, 1, 1, 1,
-2.07951, -0.3066251, -1.696004, 0, 0, 1, 1, 1,
-2.071245, -0.3833166, -1.516188, 1, 0, 0, 1, 1,
-2.055452, 1.657531, -0.8333487, 1, 0, 0, 1, 1,
-2.042913, -0.4869298, -1.789264, 1, 0, 0, 1, 1,
-2.016144, -1.484926, -2.505069, 1, 0, 0, 1, 1,
-2.006163, -0.5478635, -2.5402, 1, 0, 0, 1, 1,
-2.004198, -1.969689, -1.521334, 0, 0, 0, 1, 1,
-2.0026, 0.1142084, -2.48079, 0, 0, 0, 1, 1,
-1.983416, -0.1414379, -1.638195, 0, 0, 0, 1, 1,
-1.970893, -0.6070557, -2.031316, 0, 0, 0, 1, 1,
-1.938303, 0.02326492, -1.804958, 0, 0, 0, 1, 1,
-1.925726, -2.329899, -2.206439, 0, 0, 0, 1, 1,
-1.898815, -1.068983, -1.272678, 0, 0, 0, 1, 1,
-1.892636, -0.979454, -2.463007, 1, 1, 1, 1, 1,
-1.881083, -0.5872529, -2.181029, 1, 1, 1, 1, 1,
-1.879217, 0.4002895, -0.4237925, 1, 1, 1, 1, 1,
-1.866739, 0.7299781, -1.563798, 1, 1, 1, 1, 1,
-1.856294, 1.702149, -0.04415087, 1, 1, 1, 1, 1,
-1.850872, -2.592804, -1.337053, 1, 1, 1, 1, 1,
-1.840249, -0.08611165, -1.824883, 1, 1, 1, 1, 1,
-1.833713, 0.0053644, -1.130863, 1, 1, 1, 1, 1,
-1.794733, 2.052947, -0.7763579, 1, 1, 1, 1, 1,
-1.781541, -0.8046329, -1.324215, 1, 1, 1, 1, 1,
-1.779199, -0.6462722, -1.415413, 1, 1, 1, 1, 1,
-1.7782, -0.3982388, -0.9879347, 1, 1, 1, 1, 1,
-1.765765, 0.7217345, -0.009265294, 1, 1, 1, 1, 1,
-1.75218, 0.5589944, -2.003277, 1, 1, 1, 1, 1,
-1.74447, 0.1978681, -2.048301, 1, 1, 1, 1, 1,
-1.71764, -1.116287, -3.294799, 0, 0, 1, 1, 1,
-1.707953, 1.064992, -0.3449754, 1, 0, 0, 1, 1,
-1.692165, 0.5310201, -1.868986, 1, 0, 0, 1, 1,
-1.688492, -0.04056206, -2.138335, 1, 0, 0, 1, 1,
-1.680498, -0.01748674, -2.780921, 1, 0, 0, 1, 1,
-1.675634, -0.3884844, -2.02712, 1, 0, 0, 1, 1,
-1.663092, -1.864414, -2.169447, 0, 0, 0, 1, 1,
-1.637489, -0.5972388, -3.216595, 0, 0, 0, 1, 1,
-1.62066, -0.6799998, -0.9982361, 0, 0, 0, 1, 1,
-1.595325, 1.065612, -0.03078898, 0, 0, 0, 1, 1,
-1.587674, 2.46734, -0.7613754, 0, 0, 0, 1, 1,
-1.577113, 0.6850041, -2.436307, 0, 0, 0, 1, 1,
-1.576912, -0.6442206, -2.746477, 0, 0, 0, 1, 1,
-1.564799, 1.64528, 0.3536695, 1, 1, 1, 1, 1,
-1.560559, 0.5989776, 0.5253967, 1, 1, 1, 1, 1,
-1.554306, 0.7994246, -0.9778013, 1, 1, 1, 1, 1,
-1.536455, 0.406176, -0.4329667, 1, 1, 1, 1, 1,
-1.51089, -0.1258153, -3.631135, 1, 1, 1, 1, 1,
-1.505766, 0.5705582, -1.039164, 1, 1, 1, 1, 1,
-1.50225, -0.2772796, -3.070278, 1, 1, 1, 1, 1,
-1.490023, -0.3511373, -0.5550074, 1, 1, 1, 1, 1,
-1.487754, -0.5938596, -0.9553562, 1, 1, 1, 1, 1,
-1.486632, 0.5350612, -0.4590296, 1, 1, 1, 1, 1,
-1.486081, 0.1972885, -1.371968, 1, 1, 1, 1, 1,
-1.460759, -0.1027409, -1.194628, 1, 1, 1, 1, 1,
-1.459186, 2.339141, -0.3700266, 1, 1, 1, 1, 1,
-1.450306, -1.142722, -1.245814, 1, 1, 1, 1, 1,
-1.445635, -0.5884103, -3.268024, 1, 1, 1, 1, 1,
-1.444104, -0.04651795, -2.623529, 0, 0, 1, 1, 1,
-1.430915, -0.4185365, -1.649454, 1, 0, 0, 1, 1,
-1.428112, -1.057322, -2.181784, 1, 0, 0, 1, 1,
-1.424703, -0.1266172, -2.070783, 1, 0, 0, 1, 1,
-1.422496, -0.1806682, -2.584625, 1, 0, 0, 1, 1,
-1.42046, -0.3333434, -1.34617, 1, 0, 0, 1, 1,
-1.420194, -0.6372992, -3.108851, 0, 0, 0, 1, 1,
-1.414739, 0.2858634, -2.216909, 0, 0, 0, 1, 1,
-1.406593, 2.992302, 0.8294211, 0, 0, 0, 1, 1,
-1.404652, -1.120954, -1.262322, 0, 0, 0, 1, 1,
-1.398376, 1.256635, -0.6635648, 0, 0, 0, 1, 1,
-1.390956, -1.846718, -2.647237, 0, 0, 0, 1, 1,
-1.381038, 0.9725027, -0.9363816, 0, 0, 0, 1, 1,
-1.378038, -2.509483, -2.968908, 1, 1, 1, 1, 1,
-1.364975, 0.3495024, -1.228161, 1, 1, 1, 1, 1,
-1.35985, -1.218199, -3.326717, 1, 1, 1, 1, 1,
-1.359529, -0.6960266, -1.132035, 1, 1, 1, 1, 1,
-1.349358, 0.8181115, -0.7838828, 1, 1, 1, 1, 1,
-1.345595, -0.7962463, -2.787762, 1, 1, 1, 1, 1,
-1.343714, 2.752153, -0.6746803, 1, 1, 1, 1, 1,
-1.340034, -2.602121, -3.438036, 1, 1, 1, 1, 1,
-1.336165, 0.570967, -0.2844241, 1, 1, 1, 1, 1,
-1.333562, 0.8851923, -3.14129, 1, 1, 1, 1, 1,
-1.318301, -0.0180618, -0.9676313, 1, 1, 1, 1, 1,
-1.316086, 1.024022, -1.294979, 1, 1, 1, 1, 1,
-1.314643, 0.2603928, -2.219199, 1, 1, 1, 1, 1,
-1.312223, 0.2759657, -2.253611, 1, 1, 1, 1, 1,
-1.309481, -1.315258, -2.311086, 1, 1, 1, 1, 1,
-1.288547, 0.6062829, 1.809044, 0, 0, 1, 1, 1,
-1.27825, 0.3296122, 0.05581735, 1, 0, 0, 1, 1,
-1.277002, 0.7850965, -2.05778, 1, 0, 0, 1, 1,
-1.274358, 0.133788, -3.010196, 1, 0, 0, 1, 1,
-1.268134, 0.6023158, -1.408291, 1, 0, 0, 1, 1,
-1.259642, 0.3687721, -0.6328777, 1, 0, 0, 1, 1,
-1.253615, 0.7627573, -0.3429419, 0, 0, 0, 1, 1,
-1.250657, 0.2681059, -2.076053, 0, 0, 0, 1, 1,
-1.232794, -1.432058, -2.684055, 0, 0, 0, 1, 1,
-1.223532, -0.8217652, -1.729593, 0, 0, 0, 1, 1,
-1.222459, 0.07319067, -1.133294, 0, 0, 0, 1, 1,
-1.217715, -0.4931578, -2.816089, 0, 0, 0, 1, 1,
-1.217115, 0.5156376, -1.660686, 0, 0, 0, 1, 1,
-1.213806, -0.7110211, -2.060435, 1, 1, 1, 1, 1,
-1.212655, 1.082987, -0.5439403, 1, 1, 1, 1, 1,
-1.206136, 0.5744425, -0.7478008, 1, 1, 1, 1, 1,
-1.204072, -0.8758127, -4.305122, 1, 1, 1, 1, 1,
-1.202883, 0.3014519, -1.166493, 1, 1, 1, 1, 1,
-1.198533, 0.04149285, -0.4288039, 1, 1, 1, 1, 1,
-1.194407, -1.212371, -0.7301722, 1, 1, 1, 1, 1,
-1.193293, -0.3002297, -0.4658172, 1, 1, 1, 1, 1,
-1.176627, 1.188535, -0.9795491, 1, 1, 1, 1, 1,
-1.175674, 0.0544355, -1.728514, 1, 1, 1, 1, 1,
-1.162637, -0.2345323, -1.787917, 1, 1, 1, 1, 1,
-1.155601, 0.7650269, -2.577563, 1, 1, 1, 1, 1,
-1.152134, 0.6470177, -1.369495, 1, 1, 1, 1, 1,
-1.135778, 0.747876, 0.07618603, 1, 1, 1, 1, 1,
-1.134659, 0.07775251, -0.4711082, 1, 1, 1, 1, 1,
-1.131916, 0.2995298, 0.1445935, 0, 0, 1, 1, 1,
-1.121707, -0.7602558, -2.747724, 1, 0, 0, 1, 1,
-1.118548, -0.2966441, -3.613145, 1, 0, 0, 1, 1,
-1.10659, 0.8553665, -0.6092885, 1, 0, 0, 1, 1,
-1.105168, -1.359867, -2.889396, 1, 0, 0, 1, 1,
-1.096094, 1.006429, -0.6604843, 1, 0, 0, 1, 1,
-1.090988, 0.4214889, -0.2567287, 0, 0, 0, 1, 1,
-1.089256, 0.90575, 1.085477, 0, 0, 0, 1, 1,
-1.084041, -0.6617427, -0.2249175, 0, 0, 0, 1, 1,
-1.083282, 1.667079, -1.166829, 0, 0, 0, 1, 1,
-1.075385, -1.969983, -0.9063112, 0, 0, 0, 1, 1,
-1.075368, -0.6143442, -3.776665, 0, 0, 0, 1, 1,
-1.073395, -2.504531, -1.309048, 0, 0, 0, 1, 1,
-1.058661, -0.3747981, -3.048803, 1, 1, 1, 1, 1,
-1.049123, 0.2170053, -1.005747, 1, 1, 1, 1, 1,
-1.045712, -1.210347, -2.446503, 1, 1, 1, 1, 1,
-1.033931, 1.427785, -0.5450701, 1, 1, 1, 1, 1,
-1.027015, -0.9747915, -0.2991737, 1, 1, 1, 1, 1,
-1.02297, 0.04659561, -1.81609, 1, 1, 1, 1, 1,
-1.015227, -0.2055899, 0.318146, 1, 1, 1, 1, 1,
-1.012678, 0.5451458, -0.8382343, 1, 1, 1, 1, 1,
-1.01183, -0.5707018, -2.912055, 1, 1, 1, 1, 1,
-1.010961, 1.689286, 1.085971, 1, 1, 1, 1, 1,
-1.006457, -0.3381674, -1.907324, 1, 1, 1, 1, 1,
-0.9851412, -0.09566574, 0.06872099, 1, 1, 1, 1, 1,
-0.984159, -0.1440698, -0.2889906, 1, 1, 1, 1, 1,
-0.9813069, 1.057873, -0.9005163, 1, 1, 1, 1, 1,
-0.9637727, 1.029242, 0.7620624, 1, 1, 1, 1, 1,
-0.9520176, 0.2988691, -1.784995, 0, 0, 1, 1, 1,
-0.950954, -0.2709157, -2.32938, 1, 0, 0, 1, 1,
-0.9508127, 0.6180642, -0.6501065, 1, 0, 0, 1, 1,
-0.9451976, 0.9999254, -0.7719364, 1, 0, 0, 1, 1,
-0.9451066, 0.5717492, -1.884075, 1, 0, 0, 1, 1,
-0.9399472, 1.274867, -1.263865, 1, 0, 0, 1, 1,
-0.9399281, -0.4009656, -1.03213, 0, 0, 0, 1, 1,
-0.9362543, -0.8713335, -2.202472, 0, 0, 0, 1, 1,
-0.936082, -0.7765074, -2.17311, 0, 0, 0, 1, 1,
-0.919001, -0.4553274, -1.122051, 0, 0, 0, 1, 1,
-0.9185838, 0.9422181, 1.229107, 0, 0, 0, 1, 1,
-0.9151232, -2.833213, -2.036741, 0, 0, 0, 1, 1,
-0.9136872, -0.3663426, -3.542707, 0, 0, 0, 1, 1,
-0.9129685, 0.2963092, -1.588952, 1, 1, 1, 1, 1,
-0.9118558, -0.9995046, -4.510704, 1, 1, 1, 1, 1,
-0.905019, -2.680381, -3.05428, 1, 1, 1, 1, 1,
-0.9040438, -0.846936, -3.550926, 1, 1, 1, 1, 1,
-0.8906882, 0.5393484, -0.7313286, 1, 1, 1, 1, 1,
-0.8871154, -0.1602416, -1.243747, 1, 1, 1, 1, 1,
-0.8846197, -0.6511326, -2.542321, 1, 1, 1, 1, 1,
-0.8839799, -1.08548, -2.927043, 1, 1, 1, 1, 1,
-0.8812335, 0.6968908, -0.07528938, 1, 1, 1, 1, 1,
-0.8718883, 1.350809, -1.122018, 1, 1, 1, 1, 1,
-0.871555, 1.130194, -0.001728948, 1, 1, 1, 1, 1,
-0.8689211, 1.123036, -1.184427, 1, 1, 1, 1, 1,
-0.8658967, 0.4571324, -2.580863, 1, 1, 1, 1, 1,
-0.8657504, -0.8149565, -2.498944, 1, 1, 1, 1, 1,
-0.8622923, 0.9809245, -0.2987294, 1, 1, 1, 1, 1,
-0.8463945, -0.735256, -1.796253, 0, 0, 1, 1, 1,
-0.8422621, 0.007965938, -2.507208, 1, 0, 0, 1, 1,
-0.8354439, 1.809955, -1.182593, 1, 0, 0, 1, 1,
-0.8313316, -0.6249896, -2.705484, 1, 0, 0, 1, 1,
-0.8295802, -0.7909337, -3.049891, 1, 0, 0, 1, 1,
-0.8250793, -0.332598, -1.048254, 1, 0, 0, 1, 1,
-0.8235288, 0.572592, -1.090039, 0, 0, 0, 1, 1,
-0.8231431, -0.8666427, -0.8848709, 0, 0, 0, 1, 1,
-0.8213468, 0.1448037, -0.7098854, 0, 0, 0, 1, 1,
-0.8189567, 1.275173, -1.132741, 0, 0, 0, 1, 1,
-0.8171505, 0.6935676, 0.1643458, 0, 0, 0, 1, 1,
-0.8151957, 0.6795931, -1.033541, 0, 0, 0, 1, 1,
-0.8145207, 1.055712, -1.255358, 0, 0, 0, 1, 1,
-0.8133376, -1.322798, -2.931816, 1, 1, 1, 1, 1,
-0.8119273, -1.284574, -4.35473, 1, 1, 1, 1, 1,
-0.8112845, -0.9827024, -1.260642, 1, 1, 1, 1, 1,
-0.809105, -1.416345, -4.311331, 1, 1, 1, 1, 1,
-0.8061948, 0.6907402, -0.7554241, 1, 1, 1, 1, 1,
-0.8059849, -0.1762221, -1.416516, 1, 1, 1, 1, 1,
-0.8023306, 0.4500824, -3.101185, 1, 1, 1, 1, 1,
-0.7990748, -0.3728523, -0.555271, 1, 1, 1, 1, 1,
-0.7974738, 0.2166576, -0.787281, 1, 1, 1, 1, 1,
-0.7945873, -0.7877098, -2.832392, 1, 1, 1, 1, 1,
-0.7933558, -0.2366855, -3.368748, 1, 1, 1, 1, 1,
-0.7925279, -1.169763, -3.12776, 1, 1, 1, 1, 1,
-0.7920825, -1.008996, -1.490164, 1, 1, 1, 1, 1,
-0.7904409, -0.5509607, -2.780767, 1, 1, 1, 1, 1,
-0.780643, 0.6253179, -1.512268, 1, 1, 1, 1, 1,
-0.7781457, -1.070422, -2.603152, 0, 0, 1, 1, 1,
-0.7750725, -0.1447421, -2.586367, 1, 0, 0, 1, 1,
-0.7748309, 0.3739212, -0.5677545, 1, 0, 0, 1, 1,
-0.7741449, 0.1943655, -1.761509, 1, 0, 0, 1, 1,
-0.774061, 1.127888, -1.194792, 1, 0, 0, 1, 1,
-0.7719851, 0.2796593, -1.981843, 1, 0, 0, 1, 1,
-0.7716909, -0.2041538, -1.711979, 0, 0, 0, 1, 1,
-0.7715752, -1.304704, -4.099515, 0, 0, 0, 1, 1,
-0.7614053, -1.626857, -2.622628, 0, 0, 0, 1, 1,
-0.7571949, -0.06515063, -1.483587, 0, 0, 0, 1, 1,
-0.7562644, -0.5925468, -0.7473248, 0, 0, 0, 1, 1,
-0.7548069, -0.8201203, -0.6134201, 0, 0, 0, 1, 1,
-0.7426633, -1.189793, -3.198843, 0, 0, 0, 1, 1,
-0.742029, -0.502894, -2.887402, 1, 1, 1, 1, 1,
-0.7407535, -0.5469918, -1.887132, 1, 1, 1, 1, 1,
-0.7381464, -1.30852, -2.812536, 1, 1, 1, 1, 1,
-0.7339792, 1.170234, 1.439335, 1, 1, 1, 1, 1,
-0.7307442, -1.699112, -3.406833, 1, 1, 1, 1, 1,
-0.7294044, 0.7715764, -0.283682, 1, 1, 1, 1, 1,
-0.7289847, -0.8755409, -0.4259273, 1, 1, 1, 1, 1,
-0.7273211, -0.3248209, -1.233592, 1, 1, 1, 1, 1,
-0.7224164, -0.2708024, -3.199667, 1, 1, 1, 1, 1,
-0.7195643, 0.7728097, -1.431532, 1, 1, 1, 1, 1,
-0.7171671, 1.326785, -1.80278, 1, 1, 1, 1, 1,
-0.7146461, 0.3838072, -4.119472, 1, 1, 1, 1, 1,
-0.7122409, -0.8026167, -2.70949, 1, 1, 1, 1, 1,
-0.7103256, 0.9381037, -0.9168577, 1, 1, 1, 1, 1,
-0.7039792, -1.667627, -2.885534, 1, 1, 1, 1, 1,
-0.7038588, -0.2504959, -1.3099, 0, 0, 1, 1, 1,
-0.6959672, 0.07219811, -1.874203, 1, 0, 0, 1, 1,
-0.6907231, 1.81851, -0.1139183, 1, 0, 0, 1, 1,
-0.6900016, 0.4726319, 0.6335292, 1, 0, 0, 1, 1,
-0.68976, -0.6825049, -4.598025, 1, 0, 0, 1, 1,
-0.6777938, 1.141011, -0.01822999, 1, 0, 0, 1, 1,
-0.6670514, 1.391033, -0.9952129, 0, 0, 0, 1, 1,
-0.6646723, 0.5918818, -2.138225, 0, 0, 0, 1, 1,
-0.6603581, 0.8297734, 1.597449, 0, 0, 0, 1, 1,
-0.6600458, -0.3833952, -2.276826, 0, 0, 0, 1, 1,
-0.6582695, 0.3880091, -1.269747, 0, 0, 0, 1, 1,
-0.656884, -1.06037, -2.399205, 0, 0, 0, 1, 1,
-0.6562856, -0.5127209, -2.876254, 0, 0, 0, 1, 1,
-0.6541169, 0.4690966, -0.3622496, 1, 1, 1, 1, 1,
-0.6504545, 0.01649131, -2.18973, 1, 1, 1, 1, 1,
-0.6462675, -0.5844415, -3.352553, 1, 1, 1, 1, 1,
-0.6399546, 1.059585, -2.134284, 1, 1, 1, 1, 1,
-0.6382787, -0.6437467, -1.458062, 1, 1, 1, 1, 1,
-0.6161491, -0.9965589, -1.598594, 1, 1, 1, 1, 1,
-0.6132376, 1.565764, -0.7813996, 1, 1, 1, 1, 1,
-0.6116828, -1.758221, -2.846914, 1, 1, 1, 1, 1,
-0.6070612, -1.236748, -2.544166, 1, 1, 1, 1, 1,
-0.5973086, 0.02399492, -1.849047, 1, 1, 1, 1, 1,
-0.5899276, -0.7116928, -2.036432, 1, 1, 1, 1, 1,
-0.5771171, -1.341317, -4.357227, 1, 1, 1, 1, 1,
-0.5765674, -2.357143, -2.407762, 1, 1, 1, 1, 1,
-0.5724207, -0.2809827, -2.503737, 1, 1, 1, 1, 1,
-0.5693904, 1.685289, -1.216505, 1, 1, 1, 1, 1,
-0.5677981, 0.08017926, -0.6048868, 0, 0, 1, 1, 1,
-0.5639986, 1.075029, -0.984319, 1, 0, 0, 1, 1,
-0.5588819, 1.102368, -1.540796, 1, 0, 0, 1, 1,
-0.5545265, 0.2958494, -1.40685, 1, 0, 0, 1, 1,
-0.5505704, 0.5867645, 0.5895879, 1, 0, 0, 1, 1,
-0.548674, 1.635661, -0.8030806, 1, 0, 0, 1, 1,
-0.5483199, -0.04875508, -1.856675, 0, 0, 0, 1, 1,
-0.5476278, -0.1822321, -0.874317, 0, 0, 0, 1, 1,
-0.5475332, 0.4744269, 0.7461771, 0, 0, 0, 1, 1,
-0.5467576, 2.333899, 1.157634, 0, 0, 0, 1, 1,
-0.542146, -1.55037, -4.6783, 0, 0, 0, 1, 1,
-0.5415575, -0.4585031, -1.859715, 0, 0, 0, 1, 1,
-0.5382997, 0.9553496, -0.4338019, 0, 0, 0, 1, 1,
-0.5293861, 0.241325, -1.094967, 1, 1, 1, 1, 1,
-0.5256729, 1.51213, 0.5281096, 1, 1, 1, 1, 1,
-0.5250912, -0.8638178, -2.374767, 1, 1, 1, 1, 1,
-0.5223768, 1.280749, 0.4462389, 1, 1, 1, 1, 1,
-0.5220037, 1.922717, -0.4322924, 1, 1, 1, 1, 1,
-0.5157061, -1.304621, -2.392544, 1, 1, 1, 1, 1,
-0.5155655, -0.1634568, 0.5574652, 1, 1, 1, 1, 1,
-0.5126064, -1.578445, -3.409453, 1, 1, 1, 1, 1,
-0.5079677, 0.927254, -0.005891023, 1, 1, 1, 1, 1,
-0.5078162, 0.3528102, -0.1281722, 1, 1, 1, 1, 1,
-0.5035332, 1.675933, 0.8081037, 1, 1, 1, 1, 1,
-0.4968886, 0.8847208, -1.366826, 1, 1, 1, 1, 1,
-0.4949726, 0.9569657, -0.9244132, 1, 1, 1, 1, 1,
-0.4942651, 0.9699418, 0.2877606, 1, 1, 1, 1, 1,
-0.4940343, 0.8450482, -0.3124847, 1, 1, 1, 1, 1,
-0.4859097, 0.09626222, -1.071653, 0, 0, 1, 1, 1,
-0.4848899, 0.4550671, -1.671132, 1, 0, 0, 1, 1,
-0.471429, -0.2380179, -1.753838, 1, 0, 0, 1, 1,
-0.4711052, -0.3604123, -2.592042, 1, 0, 0, 1, 1,
-0.4627827, 0.4189058, -2.072572, 1, 0, 0, 1, 1,
-0.4584607, -1.987125, -2.048969, 1, 0, 0, 1, 1,
-0.458172, -0.2006568, -3.315532, 0, 0, 0, 1, 1,
-0.4578192, -0.4337024, -1.201308, 0, 0, 0, 1, 1,
-0.4560141, -0.3999833, -1.217601, 0, 0, 0, 1, 1,
-0.4514589, 0.5378331, -0.6232685, 0, 0, 0, 1, 1,
-0.4505039, 0.6683064, -1.116855, 0, 0, 0, 1, 1,
-0.4482217, 1.774165, -1.001429, 0, 0, 0, 1, 1,
-0.4445861, -0.06855028, -1.469341, 0, 0, 0, 1, 1,
-0.4445681, -1.225608, -5.081949, 1, 1, 1, 1, 1,
-0.444179, -0.01311961, -1.470326, 1, 1, 1, 1, 1,
-0.4390004, 0.2282855, -1.156683, 1, 1, 1, 1, 1,
-0.4377916, -0.4855128, -1.642618, 1, 1, 1, 1, 1,
-0.4359086, -0.6330383, -1.2265, 1, 1, 1, 1, 1,
-0.4310982, -1.771953, -3.473498, 1, 1, 1, 1, 1,
-0.4298919, -0.05566686, -2.303522, 1, 1, 1, 1, 1,
-0.4275298, -0.4328786, -1.354345, 1, 1, 1, 1, 1,
-0.4262209, -0.9390738, -3.853014, 1, 1, 1, 1, 1,
-0.4247977, -0.3785794, -4.073651, 1, 1, 1, 1, 1,
-0.4210535, 1.217602, 0.8859566, 1, 1, 1, 1, 1,
-0.4205959, 0.3609747, -0.5223949, 1, 1, 1, 1, 1,
-0.4202181, 2.049886, -0.9182905, 1, 1, 1, 1, 1,
-0.4169939, -0.01999035, -2.272761, 1, 1, 1, 1, 1,
-0.4149676, 0.7875056, -1.233274, 1, 1, 1, 1, 1,
-0.4123268, -1.148953, -2.07495, 0, 0, 1, 1, 1,
-0.412232, -0.3952926, -2.529499, 1, 0, 0, 1, 1,
-0.4050984, -0.594962, -2.330821, 1, 0, 0, 1, 1,
-0.4031832, 0.6797081, -2.00262, 1, 0, 0, 1, 1,
-0.3939208, 0.4735453, -3.059202, 1, 0, 0, 1, 1,
-0.3867671, -0.9978806, -3.940813, 1, 0, 0, 1, 1,
-0.3824399, -2.36313, -3.824848, 0, 0, 0, 1, 1,
-0.3809581, 0.08672449, -1.257419, 0, 0, 0, 1, 1,
-0.380464, -0.2845258, -2.58688, 0, 0, 0, 1, 1,
-0.3802423, 0.36429, 0.8291105, 0, 0, 0, 1, 1,
-0.3782949, 0.5138836, -1.18954, 0, 0, 0, 1, 1,
-0.3735245, -2.13197, -2.836, 0, 0, 0, 1, 1,
-0.3614417, 0.7378545, -2.505705, 0, 0, 0, 1, 1,
-0.3605815, 0.4357358, 0.4134825, 1, 1, 1, 1, 1,
-0.3603107, -0.7121511, -3.473448, 1, 1, 1, 1, 1,
-0.3598527, -0.1409557, -2.782689, 1, 1, 1, 1, 1,
-0.3543073, 0.517384, 0.3087088, 1, 1, 1, 1, 1,
-0.3497713, -0.594076, -2.192896, 1, 1, 1, 1, 1,
-0.3470613, -0.3285578, -0.7316197, 1, 1, 1, 1, 1,
-0.3456352, 0.1167989, -0.7430475, 1, 1, 1, 1, 1,
-0.3427257, 0.9812289, -1.418828, 1, 1, 1, 1, 1,
-0.3410558, 0.7355714, 0.5056214, 1, 1, 1, 1, 1,
-0.3369485, -1.240961, -2.800821, 1, 1, 1, 1, 1,
-0.3365089, -0.9892738, -3.725358, 1, 1, 1, 1, 1,
-0.3358034, 0.7100748, -2.127249, 1, 1, 1, 1, 1,
-0.332324, 0.9922638, -0.169913, 1, 1, 1, 1, 1,
-0.3309995, -0.6068776, -2.145001, 1, 1, 1, 1, 1,
-0.3298651, 1.017298, -1.524488, 1, 1, 1, 1, 1,
-0.3292345, 0.00727899, -0.9429321, 0, 0, 1, 1, 1,
-0.3290291, 1.785432, -0.9605395, 1, 0, 0, 1, 1,
-0.3288313, -1.079423, -2.256464, 1, 0, 0, 1, 1,
-0.324936, 1.447113, -1.085127, 1, 0, 0, 1, 1,
-0.3247107, 0.026859, -1.520144, 1, 0, 0, 1, 1,
-0.322585, 0.06939767, -2.029777, 1, 0, 0, 1, 1,
-0.3221724, -0.6251185, -1.52475, 0, 0, 0, 1, 1,
-0.3165157, -1.749064, -3.261271, 0, 0, 0, 1, 1,
-0.3000213, -1.120565, -1.928383, 0, 0, 0, 1, 1,
-0.2975293, 0.4749325, 1.232344, 0, 0, 0, 1, 1,
-0.2933027, 0.8084348, 0.3994695, 0, 0, 0, 1, 1,
-0.2919072, 1.129079, 0.8196437, 0, 0, 0, 1, 1,
-0.2904609, -0.6910763, -3.25755, 0, 0, 0, 1, 1,
-0.2890956, 1.340731, 0.07116017, 1, 1, 1, 1, 1,
-0.2886082, 0.9827984, 1.175411, 1, 1, 1, 1, 1,
-0.2860187, -0.9874029, -2.330314, 1, 1, 1, 1, 1,
-0.2829005, 0.9994337, -1.159053, 1, 1, 1, 1, 1,
-0.2811028, -0.2500745, -0.3278811, 1, 1, 1, 1, 1,
-0.2758406, 0.1419261, 0.8376977, 1, 1, 1, 1, 1,
-0.2745577, -0.8624771, -4.070958, 1, 1, 1, 1, 1,
-0.2743512, -0.06818888, -4.240368, 1, 1, 1, 1, 1,
-0.2726, 0.4959961, 0.1093199, 1, 1, 1, 1, 1,
-0.2709856, 0.1917667, -1.43869, 1, 1, 1, 1, 1,
-0.269925, 0.4260927, -1.878464, 1, 1, 1, 1, 1,
-0.2686401, 1.084099, -0.4122932, 1, 1, 1, 1, 1,
-0.2677256, 1.043242, -0.6198696, 1, 1, 1, 1, 1,
-0.2646969, 1.193058, 0.2675405, 1, 1, 1, 1, 1,
-0.2646937, -1.348247, -2.184711, 1, 1, 1, 1, 1,
-0.2641099, 0.3363099, -0.3238897, 0, 0, 1, 1, 1,
-0.2601296, 0.2042051, -0.1111815, 1, 0, 0, 1, 1,
-0.2584602, 0.6124153, -1.786012, 1, 0, 0, 1, 1,
-0.2571027, -0.2260265, -3.891328, 1, 0, 0, 1, 1,
-0.249468, -0.6508, -2.221755, 1, 0, 0, 1, 1,
-0.2488059, 0.4991176, -1.53117, 1, 0, 0, 1, 1,
-0.2468973, -1.615785, -3.725252, 0, 0, 0, 1, 1,
-0.2444464, -0.1391486, -2.396399, 0, 0, 0, 1, 1,
-0.2441499, -0.530521, -1.922401, 0, 0, 0, 1, 1,
-0.2434347, -1.261822, -3.844855, 0, 0, 0, 1, 1,
-0.2406976, 2.325866, -1.255323, 0, 0, 0, 1, 1,
-0.2316632, 0.8926889, 0.191462, 0, 0, 0, 1, 1,
-0.2277282, 0.8884641, -0.11033, 0, 0, 0, 1, 1,
-0.2270687, -1.322439, -3.175545, 1, 1, 1, 1, 1,
-0.226773, 0.1923019, -1.146526, 1, 1, 1, 1, 1,
-0.225994, -0.4964739, -3.699537, 1, 1, 1, 1, 1,
-0.2245001, 0.7052205, 1.274204, 1, 1, 1, 1, 1,
-0.2177132, 0.7941356, -0.3339806, 1, 1, 1, 1, 1,
-0.2172995, -0.6113308, -2.839167, 1, 1, 1, 1, 1,
-0.2155849, -2.007916, -3.039644, 1, 1, 1, 1, 1,
-0.2141501, -1.150292, -3.387002, 1, 1, 1, 1, 1,
-0.2114956, -1.61739, -3.518527, 1, 1, 1, 1, 1,
-0.2114743, 0.5033369, 0.5664988, 1, 1, 1, 1, 1,
-0.209704, -1.504555, -2.92872, 1, 1, 1, 1, 1,
-0.2094212, 1.016564, 1.171023, 1, 1, 1, 1, 1,
-0.2091609, 1.140036, -1.727363, 1, 1, 1, 1, 1,
-0.2072519, 0.1270293, -1.321718, 1, 1, 1, 1, 1,
-0.2063471, 0.8861934, 1.568309, 1, 1, 1, 1, 1,
-0.2038843, 0.955779, -0.2165945, 0, 0, 1, 1, 1,
-0.2011438, -0.8131729, -4.970332, 1, 0, 0, 1, 1,
-0.1992814, -1.129026, -3.597153, 1, 0, 0, 1, 1,
-0.1968889, -1.535365, -3.20487, 1, 0, 0, 1, 1,
-0.1965561, -0.2741087, -1.151172, 1, 0, 0, 1, 1,
-0.1954119, -1.159267, -4.411665, 1, 0, 0, 1, 1,
-0.1889188, -0.1325938, 0.09578112, 0, 0, 0, 1, 1,
-0.1872742, 0.8089588, 0.04399407, 0, 0, 0, 1, 1,
-0.1845025, 0.2887596, -0.3443289, 0, 0, 0, 1, 1,
-0.1840698, -2.44821, -5.088517, 0, 0, 0, 1, 1,
-0.1812899, 0.8229038, -1.451425, 0, 0, 0, 1, 1,
-0.1793751, 0.5405598, -1.052728, 0, 0, 0, 1, 1,
-0.170676, 0.4633328, 1.112485, 0, 0, 0, 1, 1,
-0.1634963, -0.8323393, -2.795596, 1, 1, 1, 1, 1,
-0.1608061, -1.181025, -2.597997, 1, 1, 1, 1, 1,
-0.160334, 0.2710003, -0.08509636, 1, 1, 1, 1, 1,
-0.1575738, 1.734576, -0.05504775, 1, 1, 1, 1, 1,
-0.155383, 0.3473198, -0.9903135, 1, 1, 1, 1, 1,
-0.1549773, 0.5046464, -1.519632, 1, 1, 1, 1, 1,
-0.1544481, -0.5985103, -1.884317, 1, 1, 1, 1, 1,
-0.1507731, -0.1704701, -3.602124, 1, 1, 1, 1, 1,
-0.1504517, 0.9502293, 0.9810516, 1, 1, 1, 1, 1,
-0.1492091, 0.3193184, 0.4268156, 1, 1, 1, 1, 1,
-0.1390929, -0.1149088, -3.458573, 1, 1, 1, 1, 1,
-0.1320764, 0.9711689, -0.03125893, 1, 1, 1, 1, 1,
-0.1309733, 0.9859449, -0.3298391, 1, 1, 1, 1, 1,
-0.1277085, 1.146601, 0.7052041, 1, 1, 1, 1, 1,
-0.1269917, -0.237565, -3.253706, 1, 1, 1, 1, 1,
-0.1256841, 0.3226669, -0.08726188, 0, 0, 1, 1, 1,
-0.1118104, -1.892238, -3.729379, 1, 0, 0, 1, 1,
-0.1117005, -1.005141, -3.281492, 1, 0, 0, 1, 1,
-0.1084281, 0.7884409, -0.5739684, 1, 0, 0, 1, 1,
-0.1058172, 0.1263888, -1.583536, 1, 0, 0, 1, 1,
-0.1048151, -0.652877, -3.447683, 1, 0, 0, 1, 1,
-0.1043985, -0.09114366, -2.799782, 0, 0, 0, 1, 1,
-0.1035135, 0.595607, -0.4086851, 0, 0, 0, 1, 1,
-0.101078, 0.174996, -0.1930721, 0, 0, 0, 1, 1,
-0.09984276, -1.253033, -4.314798, 0, 0, 0, 1, 1,
-0.0991636, -1.862319, -3.505527, 0, 0, 0, 1, 1,
-0.09914481, 1.442072, -0.3978413, 0, 0, 0, 1, 1,
-0.09890044, -1.001988, -2.53218, 0, 0, 0, 1, 1,
-0.09305321, 1.435444, -0.5639774, 1, 1, 1, 1, 1,
-0.09275734, 1.159154, -0.2697756, 1, 1, 1, 1, 1,
-0.09238313, -0.6250414, -1.927696, 1, 1, 1, 1, 1,
-0.09199072, -0.2913561, -1.964617, 1, 1, 1, 1, 1,
-0.09128031, -0.5195279, 0.07015095, 1, 1, 1, 1, 1,
-0.08604208, 0.4709009, -0.5328898, 1, 1, 1, 1, 1,
-0.08426278, -0.4711415, -2.386601, 1, 1, 1, 1, 1,
-0.08347314, 0.9903315, -0.7609171, 1, 1, 1, 1, 1,
-0.08326876, -0.2379646, -2.749635, 1, 1, 1, 1, 1,
-0.08108708, 0.3776438, 0.1184848, 1, 1, 1, 1, 1,
-0.07518234, 0.5965708, 1.147716, 1, 1, 1, 1, 1,
-0.0744286, -1.507133, -2.640781, 1, 1, 1, 1, 1,
-0.07327474, -0.2825235, -2.985901, 1, 1, 1, 1, 1,
-0.07124073, 0.1293987, -0.4920499, 1, 1, 1, 1, 1,
-0.06688984, -0.5955594, -1.527975, 1, 1, 1, 1, 1,
-0.06396381, -0.387993, -3.811488, 0, 0, 1, 1, 1,
-0.06289025, -1.981813, -1.096417, 1, 0, 0, 1, 1,
-0.06263231, 0.2839152, 1.429324, 1, 0, 0, 1, 1,
-0.06197378, -0.7940127, -4.126803, 1, 0, 0, 1, 1,
-0.06153493, 2.01843, 0.6940823, 1, 0, 0, 1, 1,
-0.06056534, 0.9664772, -0.3074032, 1, 0, 0, 1, 1,
-0.05937337, 0.2204734, -0.5940168, 0, 0, 0, 1, 1,
-0.05648458, 0.5596346, -0.9527574, 0, 0, 0, 1, 1,
-0.04526848, -0.4386758, -2.5918, 0, 0, 0, 1, 1,
-0.04503905, -0.4597679, -2.886355, 0, 0, 0, 1, 1,
-0.04393519, 0.3452356, -1.433453, 0, 0, 0, 1, 1,
-0.04056117, -0.4531614, -3.963632, 0, 0, 0, 1, 1,
-0.03908717, -0.04404294, -3.833114, 0, 0, 0, 1, 1,
-0.03830338, -0.8511637, -2.028014, 1, 1, 1, 1, 1,
-0.03594655, -1.1154, -1.985073, 1, 1, 1, 1, 1,
-0.03499005, 0.3249465, 0.05008465, 1, 1, 1, 1, 1,
-0.02705629, -0.3496538, -2.945015, 1, 1, 1, 1, 1,
-0.02342808, -1.210421, -1.25487, 1, 1, 1, 1, 1,
-0.02214943, 0.5344809, -0.05009904, 1, 1, 1, 1, 1,
-0.02175524, 0.4587641, -0.9846763, 1, 1, 1, 1, 1,
-0.02017894, -1.147511, -1.936686, 1, 1, 1, 1, 1,
-0.01682347, -0.8177609, -1.337841, 1, 1, 1, 1, 1,
-0.01018366, 0.7834952, 0.0136615, 1, 1, 1, 1, 1,
-0.008639144, -0.3288936, -4.177498, 1, 1, 1, 1, 1,
-0.008332634, -0.644803, -3.707749, 1, 1, 1, 1, 1,
-0.008191637, -0.779851, -2.953573, 1, 1, 1, 1, 1,
-0.00730193, 0.3261829, 1.460848, 1, 1, 1, 1, 1,
-0.006082125, -0.833988, -3.209117, 1, 1, 1, 1, 1,
-0.002717382, -1.298331, -2.190191, 0, 0, 1, 1, 1,
0.0008315257, -0.4615718, 2.263559, 1, 0, 0, 1, 1,
0.007054834, -0.0877062, 2.145723, 1, 0, 0, 1, 1,
0.007544875, -1.786106, 1.334841, 1, 0, 0, 1, 1,
0.01577871, 1.034223, -0.4288232, 1, 0, 0, 1, 1,
0.01830983, -2.221443, 3.953302, 1, 0, 0, 1, 1,
0.01886914, 0.2389109, 0.7654949, 0, 0, 0, 1, 1,
0.0202553, -0.3739268, 1.845331, 0, 0, 0, 1, 1,
0.02050756, -1.625529, 1.79757, 0, 0, 0, 1, 1,
0.02829987, -0.3501964, 2.88158, 0, 0, 0, 1, 1,
0.03049022, -0.5290545, 4.191805, 0, 0, 0, 1, 1,
0.03411534, 0.6514463, 1.38413, 0, 0, 0, 1, 1,
0.04140514, 0.6338044, 1.158255, 0, 0, 0, 1, 1,
0.04279119, 0.8261596, 2.08649, 1, 1, 1, 1, 1,
0.04381876, 1.111976, 0.3404914, 1, 1, 1, 1, 1,
0.04457313, -0.437867, 2.238613, 1, 1, 1, 1, 1,
0.0451263, 0.3961244, 1.785492, 1, 1, 1, 1, 1,
0.04622775, -0.4418514, 2.227791, 1, 1, 1, 1, 1,
0.04893485, 1.33454, 1.175942, 1, 1, 1, 1, 1,
0.05217557, 0.132321, 0.547776, 1, 1, 1, 1, 1,
0.05223325, 0.4544, 1.531589, 1, 1, 1, 1, 1,
0.05278913, 0.213615, 2.160306, 1, 1, 1, 1, 1,
0.05603214, 1.081721, -0.7307306, 1, 1, 1, 1, 1,
0.05715789, 0.4017364, -0.3706931, 1, 1, 1, 1, 1,
0.06513612, 1.88701, 0.7462489, 1, 1, 1, 1, 1,
0.06523921, -0.6097862, 2.609338, 1, 1, 1, 1, 1,
0.06687012, 0.9725477, -0.006897021, 1, 1, 1, 1, 1,
0.07098045, -0.7475185, 2.598477, 1, 1, 1, 1, 1,
0.07217336, -0.3849932, 4.008296, 0, 0, 1, 1, 1,
0.07248847, 0.6070442, 0.2600112, 1, 0, 0, 1, 1,
0.07367647, -1.08858, 2.126025, 1, 0, 0, 1, 1,
0.07598042, 0.5911059, 0.8975337, 1, 0, 0, 1, 1,
0.07728259, -0.2103047, 1.866651, 1, 0, 0, 1, 1,
0.07865184, -0.5987616, 5.090721, 1, 0, 0, 1, 1,
0.08216497, -0.0307851, 1.816534, 0, 0, 0, 1, 1,
0.08236773, -0.9113913, 2.249898, 0, 0, 0, 1, 1,
0.09099699, -0.3432907, 2.110646, 0, 0, 0, 1, 1,
0.09313031, -0.1886262, 4.126736, 0, 0, 0, 1, 1,
0.09337749, 0.1719825, -1.534318, 0, 0, 0, 1, 1,
0.0936463, 1.706138, -1.006957, 0, 0, 0, 1, 1,
0.09549834, 0.4651957, -1.407528, 0, 0, 0, 1, 1,
0.09735788, 1.259907, 0.9441592, 1, 1, 1, 1, 1,
0.1004039, 0.1644329, 0.2058023, 1, 1, 1, 1, 1,
0.1030907, 1.234622, -0.6599644, 1, 1, 1, 1, 1,
0.1058531, 0.06006037, -0.06638628, 1, 1, 1, 1, 1,
0.1091936, 0.3692808, -0.2823691, 1, 1, 1, 1, 1,
0.1198129, -1.005536, 3.141, 1, 1, 1, 1, 1,
0.1228369, -0.5075036, 2.542598, 1, 1, 1, 1, 1,
0.1258726, 1.248661, -1.374477, 1, 1, 1, 1, 1,
0.1323277, 0.322942, 1.548362, 1, 1, 1, 1, 1,
0.1332176, -0.3133819, 4.685335, 1, 1, 1, 1, 1,
0.1345701, 0.2471681, -0.1874691, 1, 1, 1, 1, 1,
0.1346481, -0.1101867, 1.65263, 1, 1, 1, 1, 1,
0.137329, -0.2991153, 2.823864, 1, 1, 1, 1, 1,
0.1453887, 0.891808, -1.375003, 1, 1, 1, 1, 1,
0.1509883, 0.2499744, -0.3363158, 1, 1, 1, 1, 1,
0.1527302, 0.9495476, 0.2266207, 0, 0, 1, 1, 1,
0.1599903, -0.02281846, 0.5674703, 1, 0, 0, 1, 1,
0.1606316, -1.245781, 2.034238, 1, 0, 0, 1, 1,
0.1616271, 0.06027607, 1.166559, 1, 0, 0, 1, 1,
0.1620267, 0.02332847, 1.712617, 1, 0, 0, 1, 1,
0.1634829, 0.7539622, 0.5646331, 1, 0, 0, 1, 1,
0.1638125, 0.3412356, 0.7123517, 0, 0, 0, 1, 1,
0.1669014, 0.7004135, -0.561899, 0, 0, 0, 1, 1,
0.167925, -0.749636, 2.792217, 0, 0, 0, 1, 1,
0.170263, -1.800544, 2.779337, 0, 0, 0, 1, 1,
0.1728282, 0.1526272, 0.6748551, 0, 0, 0, 1, 1,
0.1772146, -1.022153, 3.107534, 0, 0, 0, 1, 1,
0.1802866, 1.321297, -0.1890285, 0, 0, 0, 1, 1,
0.1810847, 0.1996996, 1.730233, 1, 1, 1, 1, 1,
0.1827555, -1.38797, 4.830037, 1, 1, 1, 1, 1,
0.1832926, -0.2500573, 2.107153, 1, 1, 1, 1, 1,
0.1841414, 0.6677405, 1.23828, 1, 1, 1, 1, 1,
0.1846489, 0.7436646, -0.6037056, 1, 1, 1, 1, 1,
0.1858141, 0.238102, 0.6603165, 1, 1, 1, 1, 1,
0.1911001, 0.5635949, -0.8972276, 1, 1, 1, 1, 1,
0.1926185, 0.6019555, -0.7203415, 1, 1, 1, 1, 1,
0.1962871, 0.9591589, 1.96657, 1, 1, 1, 1, 1,
0.198828, 0.8732674, 1.522174, 1, 1, 1, 1, 1,
0.1998923, -0.155857, 1.27872, 1, 1, 1, 1, 1,
0.2086317, -1.898383, 4.219865, 1, 1, 1, 1, 1,
0.2092375, -2.74367, 2.943326, 1, 1, 1, 1, 1,
0.2141081, 0.3011938, 0.8817236, 1, 1, 1, 1, 1,
0.2143918, -0.5431459, 3.357162, 1, 1, 1, 1, 1,
0.2189548, -0.3022749, 1.044243, 0, 0, 1, 1, 1,
0.2190853, 0.6811407, 2.153085, 1, 0, 0, 1, 1,
0.2199573, 0.2360643, 0.2619019, 1, 0, 0, 1, 1,
0.2211299, 0.09841013, 0.8082527, 1, 0, 0, 1, 1,
0.2212891, -0.349506, 1.313686, 1, 0, 0, 1, 1,
0.2270567, 1.216888, 0.3029836, 1, 0, 0, 1, 1,
0.229602, 1.050957, 0.3542248, 0, 0, 0, 1, 1,
0.2347717, 0.4668407, 2.254659, 0, 0, 0, 1, 1,
0.2376209, -1.531833, 3.614706, 0, 0, 0, 1, 1,
0.2398924, 1.125304, 0.3963186, 0, 0, 0, 1, 1,
0.240233, -0.4717317, 3.530989, 0, 0, 0, 1, 1,
0.2423736, 0.2556446, 1.329745, 0, 0, 0, 1, 1,
0.2445579, 2.207388, -1.540434, 0, 0, 0, 1, 1,
0.2545134, -0.9188676, 1.900553, 1, 1, 1, 1, 1,
0.2551877, 1.524003, -1.000679, 1, 1, 1, 1, 1,
0.261488, 0.01755696, 1.328966, 1, 1, 1, 1, 1,
0.2641281, -0.3523633, 2.348776, 1, 1, 1, 1, 1,
0.2652168, -0.8295017, 1.857377, 1, 1, 1, 1, 1,
0.2656172, -0.06331719, 1.801136, 1, 1, 1, 1, 1,
0.2659952, 0.3960625, 1.647521, 1, 1, 1, 1, 1,
0.2678535, -0.9233755, 3.149499, 1, 1, 1, 1, 1,
0.2699351, 1.109549, 1.502401, 1, 1, 1, 1, 1,
0.2710973, 0.6141751, 1.151284, 1, 1, 1, 1, 1,
0.2785777, -0.6139888, 3.402033, 1, 1, 1, 1, 1,
0.2786983, -0.3263916, 1.20858, 1, 1, 1, 1, 1,
0.2801451, 0.539849, -0.4228944, 1, 1, 1, 1, 1,
0.2827561, 2.077076, 0.09906644, 1, 1, 1, 1, 1,
0.2971168, -0.101447, 2.159957, 1, 1, 1, 1, 1,
0.2981564, 0.3532931, 1.471722, 0, 0, 1, 1, 1,
0.3000278, -1.069215, 3.261554, 1, 0, 0, 1, 1,
0.3022748, -0.0273157, 0.8314064, 1, 0, 0, 1, 1,
0.3042302, -1.081207, 2.414068, 1, 0, 0, 1, 1,
0.3062122, -2.687613, 2.69942, 1, 0, 0, 1, 1,
0.3096738, 2.039905, 0.3771286, 1, 0, 0, 1, 1,
0.3099631, -0.7976567, 3.832639, 0, 0, 0, 1, 1,
0.3142759, -0.6315998, 1.965202, 0, 0, 0, 1, 1,
0.3307475, -2.26386, 3.075287, 0, 0, 0, 1, 1,
0.3307483, 1.173858, 0.3814187, 0, 0, 0, 1, 1,
0.331661, 0.5219963, -1.231536, 0, 0, 0, 1, 1,
0.332333, -1.276496, 1.993352, 0, 0, 0, 1, 1,
0.3446375, 0.6342735, 1.38177, 0, 0, 0, 1, 1,
0.3455348, 0.511098, 0.1185614, 1, 1, 1, 1, 1,
0.349769, 0.5450011, 0.02162894, 1, 1, 1, 1, 1,
0.3548186, -0.09537137, 2.64688, 1, 1, 1, 1, 1,
0.3554426, -0.8119434, 2.469978, 1, 1, 1, 1, 1,
0.3561285, 1.333643, -1.114157, 1, 1, 1, 1, 1,
0.3593313, 0.6213184, 0.8488309, 1, 1, 1, 1, 1,
0.3595804, -0.2196393, 4.610045, 1, 1, 1, 1, 1,
0.3614112, 0.1811846, 1.401826, 1, 1, 1, 1, 1,
0.3663503, -0.07408615, 2.142718, 1, 1, 1, 1, 1,
0.3692446, -0.04914559, 0.3890989, 1, 1, 1, 1, 1,
0.3699324, -0.7013884, 1.485389, 1, 1, 1, 1, 1,
0.3726012, 0.4345059, 2.02856, 1, 1, 1, 1, 1,
0.3731546, 0.6344357, 0.9466448, 1, 1, 1, 1, 1,
0.3766896, 0.08603624, -0.2049048, 1, 1, 1, 1, 1,
0.3778296, 0.3912817, 2.220488, 1, 1, 1, 1, 1,
0.3858213, 0.8262333, 1.498685, 0, 0, 1, 1, 1,
0.3879084, 0.8515919, -0.2996907, 1, 0, 0, 1, 1,
0.3898928, -0.8629158, 1.707498, 1, 0, 0, 1, 1,
0.3914154, -0.6170613, 1.7211, 1, 0, 0, 1, 1,
0.3930981, -0.1574059, 0.7667131, 1, 0, 0, 1, 1,
0.3933135, 1.243775, 1.48256, 1, 0, 0, 1, 1,
0.3936774, -0.4265865, 2.486809, 0, 0, 0, 1, 1,
0.3960286, -2.137284, 3.603786, 0, 0, 0, 1, 1,
0.3981203, -0.3560075, 2.096934, 0, 0, 0, 1, 1,
0.3995831, -1.044981, 4.462636, 0, 0, 0, 1, 1,
0.4046485, 1.239914, 1.365621, 0, 0, 0, 1, 1,
0.4062732, -1.572941, 3.167691, 0, 0, 0, 1, 1,
0.4099818, 1.104901, -0.1623545, 0, 0, 0, 1, 1,
0.4121931, 0.7705585, -0.4471578, 1, 1, 1, 1, 1,
0.4235137, -0.7453834, 0.5532187, 1, 1, 1, 1, 1,
0.4269753, -0.2037279, 1.85829, 1, 1, 1, 1, 1,
0.427678, 0.4978904, 0.7103541, 1, 1, 1, 1, 1,
0.428426, 0.5559391, 2.88455, 1, 1, 1, 1, 1,
0.4310616, 0.4868185, 1.078673, 1, 1, 1, 1, 1,
0.4319645, -1.330934, 3.422488, 1, 1, 1, 1, 1,
0.4323173, -0.5626588, 1.40047, 1, 1, 1, 1, 1,
0.4379361, -1.450361, 3.614887, 1, 1, 1, 1, 1,
0.4420875, -0.842501, 1.524746, 1, 1, 1, 1, 1,
0.4487393, -0.8101117, 2.694925, 1, 1, 1, 1, 1,
0.4493829, -0.7618617, 1.016378, 1, 1, 1, 1, 1,
0.4532295, 0.01686764, 2.255369, 1, 1, 1, 1, 1,
0.4561301, 1.460331, -0.7689461, 1, 1, 1, 1, 1,
0.4584277, 0.7917418, 1.338318, 1, 1, 1, 1, 1,
0.4657182, -0.9951972, 0.7855476, 0, 0, 1, 1, 1,
0.4703033, -0.9208171, 3.875358, 1, 0, 0, 1, 1,
0.4704466, 1.613309, 1.122507, 1, 0, 0, 1, 1,
0.4757153, 1.1451, 1.345907, 1, 0, 0, 1, 1,
0.476208, -1.715584, 2.432378, 1, 0, 0, 1, 1,
0.4767767, 0.6777799, -0.5587054, 1, 0, 0, 1, 1,
0.4791841, 0.8573536, 0.05724998, 0, 0, 0, 1, 1,
0.4806448, 0.3888805, -0.7015392, 0, 0, 0, 1, 1,
0.4817909, -0.4612787, 3.121238, 0, 0, 0, 1, 1,
0.4817923, 0.2405774, 2.158486, 0, 0, 0, 1, 1,
0.4842876, -1.763723, 1.719369, 0, 0, 0, 1, 1,
0.4885481, 0.5732126, 1.652921, 0, 0, 0, 1, 1,
0.490918, 1.715087, 0.6276083, 0, 0, 0, 1, 1,
0.4947983, -1.073633, 3.77425, 1, 1, 1, 1, 1,
0.4962096, -0.09866638, 2.487457, 1, 1, 1, 1, 1,
0.4982259, 1.399594, -0.3558171, 1, 1, 1, 1, 1,
0.500064, -0.9268624, 2.553188, 1, 1, 1, 1, 1,
0.5008744, 1.866659, -0.2982379, 1, 1, 1, 1, 1,
0.501293, -0.6113493, 2.579014, 1, 1, 1, 1, 1,
0.5033586, -1.812989, 1.476274, 1, 1, 1, 1, 1,
0.5085692, 1.201125, -0.1896663, 1, 1, 1, 1, 1,
0.5090654, 0.001222781, 0.1652889, 1, 1, 1, 1, 1,
0.5096996, -0.8343043, 1.162015, 1, 1, 1, 1, 1,
0.5127372, 0.6800675, 1.985609, 1, 1, 1, 1, 1,
0.5218982, -0.7192246, 2.606624, 1, 1, 1, 1, 1,
0.5352284, 0.2402614, 0.722432, 1, 1, 1, 1, 1,
0.5389421, -0.9238301, 3.47657, 1, 1, 1, 1, 1,
0.540465, -0.2424388, 1.626007, 1, 1, 1, 1, 1,
0.5416473, 0.06901997, 0.4642198, 0, 0, 1, 1, 1,
0.5434347, -0.4567903, 2.998023, 1, 0, 0, 1, 1,
0.5506912, 0.9446333, 0.05990273, 1, 0, 0, 1, 1,
0.5531927, -2.251804, 4.225498, 1, 0, 0, 1, 1,
0.5553705, 0.171044, 1.994985, 1, 0, 0, 1, 1,
0.5578721, -0.6654273, 2.455752, 1, 0, 0, 1, 1,
0.5627577, -0.5223187, 1.53845, 0, 0, 0, 1, 1,
0.5646741, -0.1039587, 2.984077, 0, 0, 0, 1, 1,
0.5659527, -0.68753, 1.422203, 0, 0, 0, 1, 1,
0.5667151, -1.851264, 1.692227, 0, 0, 0, 1, 1,
0.568029, 0.3045212, 0.1396669, 0, 0, 0, 1, 1,
0.5697972, 0.8386963, 0.341038, 0, 0, 0, 1, 1,
0.570092, 1.440148, 1.133324, 0, 0, 0, 1, 1,
0.5715917, 0.8205392, 0.01852921, 1, 1, 1, 1, 1,
0.5752496, 1.049355, -0.3730858, 1, 1, 1, 1, 1,
0.5785227, 1.08097, 1.458968, 1, 1, 1, 1, 1,
0.5793515, 0.6461587, -0.3242351, 1, 1, 1, 1, 1,
0.579489, 0.05740172, 0.1899754, 1, 1, 1, 1, 1,
0.5800206, 1.541159, -1.058056, 1, 1, 1, 1, 1,
0.5814438, -1.654985, 1.629366, 1, 1, 1, 1, 1,
0.5935839, 0.6214809, 0.491558, 1, 1, 1, 1, 1,
0.5950224, 1.890568, -0.8036097, 1, 1, 1, 1, 1,
0.5955904, -0.1806181, 2.881586, 1, 1, 1, 1, 1,
0.6020393, -1.047403, 1.770921, 1, 1, 1, 1, 1,
0.602083, -1.185171, 3.222889, 1, 1, 1, 1, 1,
0.6025226, -0.4444445, 2.218848, 1, 1, 1, 1, 1,
0.6055397, 1.243736, 1.81088, 1, 1, 1, 1, 1,
0.6118482, -0.5554398, 0.9041848, 1, 1, 1, 1, 1,
0.6173244, 0.09888846, 1.827443, 0, 0, 1, 1, 1,
0.6181569, -0.2729487, 4.000287, 1, 0, 0, 1, 1,
0.6186892, -0.6603035, 1.743938, 1, 0, 0, 1, 1,
0.6193564, 0.2348868, -0.398369, 1, 0, 0, 1, 1,
0.6231353, -1.573284, 4.578118, 1, 0, 0, 1, 1,
0.6234683, 1.454301, 0.7185941, 1, 0, 0, 1, 1,
0.6267962, 0.5440177, 0.8267723, 0, 0, 0, 1, 1,
0.6278199, 0.3888292, 0.9187612, 0, 0, 0, 1, 1,
0.6286251, -0.1851317, 2.973493, 0, 0, 0, 1, 1,
0.632431, 0.2017082, 2.21082, 0, 0, 0, 1, 1,
0.6331465, 0.4820497, 0.3159839, 0, 0, 0, 1, 1,
0.6354028, 0.3337013, 2.883367, 0, 0, 0, 1, 1,
0.6355429, -2.086622, 2.966807, 0, 0, 0, 1, 1,
0.638871, -0.2930007, 2.178213, 1, 1, 1, 1, 1,
0.6416467, 0.263609, -0.9738691, 1, 1, 1, 1, 1,
0.650069, 0.0214786, 0.9002586, 1, 1, 1, 1, 1,
0.6553205, 0.1839028, -0.1368487, 1, 1, 1, 1, 1,
0.6603419, -0.2578829, 2.557095, 1, 1, 1, 1, 1,
0.6632841, 1.353406, 0.5347423, 1, 1, 1, 1, 1,
0.670006, 1.143689, 2.024227, 1, 1, 1, 1, 1,
0.6702955, 1.360308, -0.004646744, 1, 1, 1, 1, 1,
0.6705679, 0.4975071, -0.1087815, 1, 1, 1, 1, 1,
0.6720188, 0.7883244, 0.6723185, 1, 1, 1, 1, 1,
0.6720984, 1.722301, -1.100126, 1, 1, 1, 1, 1,
0.6827464, 0.3201676, 1.967959, 1, 1, 1, 1, 1,
0.6922879, 0.2458292, -0.3213919, 1, 1, 1, 1, 1,
0.6935538, -0.3273693, 4.071496, 1, 1, 1, 1, 1,
0.6985795, 1.01382, 1.440783, 1, 1, 1, 1, 1,
0.698751, -0.5092149, 1.930146, 0, 0, 1, 1, 1,
0.7000341, -1.472663, 1.845219, 1, 0, 0, 1, 1,
0.7001166, 0.5215985, 1.476902, 1, 0, 0, 1, 1,
0.7053875, 0.2318976, 1.278355, 1, 0, 0, 1, 1,
0.7062551, 0.488384, 0.3582473, 1, 0, 0, 1, 1,
0.7085402, 1.18355, 1.828292, 1, 0, 0, 1, 1,
0.7114303, 0.6848819, 0.2176927, 0, 0, 0, 1, 1,
0.7131915, 0.85158, 0.4482607, 0, 0, 0, 1, 1,
0.7218965, 0.206098, 2.786504, 0, 0, 0, 1, 1,
0.7224395, 0.2643214, 1.445157, 0, 0, 0, 1, 1,
0.7232431, -0.6807184, 3.313529, 0, 0, 0, 1, 1,
0.7242234, -1.39385, 2.205515, 0, 0, 0, 1, 1,
0.7270648, 0.8419559, 0.004711769, 0, 0, 0, 1, 1,
0.7271382, -0.1507471, 2.781277, 1, 1, 1, 1, 1,
0.7329099, 0.5244663, 1.456418, 1, 1, 1, 1, 1,
0.7334314, -0.3203799, 0.9937805, 1, 1, 1, 1, 1,
0.7390306, 0.6129325, 0.8107687, 1, 1, 1, 1, 1,
0.746421, -0.2742945, 1.470691, 1, 1, 1, 1, 1,
0.7565647, 1.419328, -0.5794399, 1, 1, 1, 1, 1,
0.7578101, -1.278666, 2.731266, 1, 1, 1, 1, 1,
0.7594278, -0.2870601, 0.6616694, 1, 1, 1, 1, 1,
0.76058, -1.242706, 1.68108, 1, 1, 1, 1, 1,
0.7630312, -0.8345115, 0.3231602, 1, 1, 1, 1, 1,
0.7643577, -0.5864022, 3.203076, 1, 1, 1, 1, 1,
0.7670295, -0.2549435, 1.807311, 1, 1, 1, 1, 1,
0.7768438, -0.3592862, 0.6563386, 1, 1, 1, 1, 1,
0.7790258, 1.484832, 0.4629478, 1, 1, 1, 1, 1,
0.7815562, 2.143029, -0.2416025, 1, 1, 1, 1, 1,
0.7857239, -0.5040581, 1.563642, 0, 0, 1, 1, 1,
0.7923881, -0.7026081, 2.86685, 1, 0, 0, 1, 1,
0.7998265, 0.332237, 1.766524, 1, 0, 0, 1, 1,
0.800215, 1.321744, 1.661264, 1, 0, 0, 1, 1,
0.8021967, -0.443134, 2.38154, 1, 0, 0, 1, 1,
0.8038157, -0.9336131, 2.157152, 1, 0, 0, 1, 1,
0.8098338, -0.3975357, 3.182492, 0, 0, 0, 1, 1,
0.8192171, 1.123492, -0.6827142, 0, 0, 0, 1, 1,
0.8234294, 1.557066, 2.588093, 0, 0, 0, 1, 1,
0.8332361, -1.665795, 2.377811, 0, 0, 0, 1, 1,
0.8357277, -0.6221241, 3.387501, 0, 0, 0, 1, 1,
0.8386111, 1.001999, -0.7683012, 0, 0, 0, 1, 1,
0.8436651, 0.770105, 0.2882281, 0, 0, 0, 1, 1,
0.8446065, 1.211361, -0.9796283, 1, 1, 1, 1, 1,
0.8448432, 2.196086, -0.4954394, 1, 1, 1, 1, 1,
0.8457888, 0.3614648, 1.27519, 1, 1, 1, 1, 1,
0.854163, 1.040408, 0.4198101, 1, 1, 1, 1, 1,
0.8727273, 0.5434948, 0.3606507, 1, 1, 1, 1, 1,
0.8784929, 0.3468719, 0.02076947, 1, 1, 1, 1, 1,
0.8895763, -0.2395525, 2.60807, 1, 1, 1, 1, 1,
0.8968204, -0.4536211, 2.83509, 1, 1, 1, 1, 1,
0.8978427, 0.4105794, 1.493766, 1, 1, 1, 1, 1,
0.9011347, 0.4418583, 2.339907, 1, 1, 1, 1, 1,
0.9015416, 0.1619795, 0.6556993, 1, 1, 1, 1, 1,
0.909153, -1.302333, 2.9722, 1, 1, 1, 1, 1,
0.9112574, -0.2263277, 1.541434, 1, 1, 1, 1, 1,
0.9213576, 0.5510966, 0.3111942, 1, 1, 1, 1, 1,
0.9323301, 0.09006146, 0.4841722, 1, 1, 1, 1, 1,
0.9333081, 1.325765, 1.626526, 0, 0, 1, 1, 1,
0.9379159, -0.9043754, 2.687426, 1, 0, 0, 1, 1,
0.938638, 1.907279, 0.2881323, 1, 0, 0, 1, 1,
0.9438432, 0.9563131, 1.269895, 1, 0, 0, 1, 1,
0.9519469, 0.3636491, 0.9049614, 1, 0, 0, 1, 1,
0.9578393, -1.095835, 3.063196, 1, 0, 0, 1, 1,
0.9630204, -0.3758007, 1.490985, 0, 0, 0, 1, 1,
0.9631422, 1.241329, 0.8201118, 0, 0, 0, 1, 1,
0.9678014, -0.9012985, 1.702876, 0, 0, 0, 1, 1,
0.970446, -0.6608457, 4.719017, 0, 0, 0, 1, 1,
0.9749334, -0.3350092, 2.617903, 0, 0, 0, 1, 1,
0.9856676, -0.154349, 2.047112, 0, 0, 0, 1, 1,
0.989706, 2.054327, 1.548293, 0, 0, 0, 1, 1,
1.001668, 1.34301, 0.2324582, 1, 1, 1, 1, 1,
1.002424, -0.7306315, 2.947481, 1, 1, 1, 1, 1,
1.005253, 0.1144273, 1.328525, 1, 1, 1, 1, 1,
1.01369, -1.026797, 1.853752, 1, 1, 1, 1, 1,
1.014612, 0.6115961, 0.05701573, 1, 1, 1, 1, 1,
1.024977, 0.7830231, 1.710213, 1, 1, 1, 1, 1,
1.025608, 0.8722575, 0.3125875, 1, 1, 1, 1, 1,
1.026156, 0.5299591, 1.207642, 1, 1, 1, 1, 1,
1.02626, -0.5574427, 2.192782, 1, 1, 1, 1, 1,
1.028822, 2.18561, 1.760312, 1, 1, 1, 1, 1,
1.054243, 0.180764, 0.2977412, 1, 1, 1, 1, 1,
1.061219, 0.3234672, 0.4663969, 1, 1, 1, 1, 1,
1.065569, 1.524057, 1.438781, 1, 1, 1, 1, 1,
1.066895, -0.2767276, 1.17839, 1, 1, 1, 1, 1,
1.07058, 1.325456, 1.200579, 1, 1, 1, 1, 1,
1.080195, 0.4967605, 0.7205918, 0, 0, 1, 1, 1,
1.09438, -1.30378, 2.116995, 1, 0, 0, 1, 1,
1.0953, -0.8465632, 2.801908, 1, 0, 0, 1, 1,
1.097705, 0.6972233, 1.426146, 1, 0, 0, 1, 1,
1.105446, 0.4352414, 0.367189, 1, 0, 0, 1, 1,
1.113886, 1.740928, -0.1221161, 1, 0, 0, 1, 1,
1.115493, 0.7855227, 1.186557, 0, 0, 0, 1, 1,
1.120359, -0.2081755, 1.71981, 0, 0, 0, 1, 1,
1.121471, 0.1779866, -0.2503113, 0, 0, 0, 1, 1,
1.128591, -0.5940123, 2.619638, 0, 0, 0, 1, 1,
1.132179, -0.3357037, 2.075753, 0, 0, 0, 1, 1,
1.142327, 0.8461502, 2.173027, 0, 0, 0, 1, 1,
1.147324, -0.6598261, 3.146096, 0, 0, 0, 1, 1,
1.149554, 0.01735206, 2.634586, 1, 1, 1, 1, 1,
1.153505, -2.29377, 1.601797, 1, 1, 1, 1, 1,
1.161741, -0.2655354, 1.862755, 1, 1, 1, 1, 1,
1.165733, 0.1413147, 0.4266931, 1, 1, 1, 1, 1,
1.169989, -0.08563223, 1.240396, 1, 1, 1, 1, 1,
1.183258, 0.2358051, -0.3954484, 1, 1, 1, 1, 1,
1.190533, 0.255365, -0.1040362, 1, 1, 1, 1, 1,
1.201973, 0.5529477, 0.5068923, 1, 1, 1, 1, 1,
1.204524, -1.43077, 3.299961, 1, 1, 1, 1, 1,
1.208239, -0.5044768, 2.527518, 1, 1, 1, 1, 1,
1.212815, 0.6719755, 0.3939182, 1, 1, 1, 1, 1,
1.213321, -0.8598774, 1.505141, 1, 1, 1, 1, 1,
1.213706, -0.3720168, 2.026063, 1, 1, 1, 1, 1,
1.2171, 1.269349, 1.989995, 1, 1, 1, 1, 1,
1.222576, 1.504033, 1.377216, 1, 1, 1, 1, 1,
1.236695, -1.540788, 2.167272, 0, 0, 1, 1, 1,
1.238017, -0.5178713, 2.201413, 1, 0, 0, 1, 1,
1.238322, -0.9317758, 3.555955, 1, 0, 0, 1, 1,
1.24007, -1.22933, 2.2818, 1, 0, 0, 1, 1,
1.240184, -0.7088031, 2.447562, 1, 0, 0, 1, 1,
1.24511, -1.394834, 2.083416, 1, 0, 0, 1, 1,
1.249762, 0.9700371, 1.412073, 0, 0, 0, 1, 1,
1.253363, -0.5730832, 1.993965, 0, 0, 0, 1, 1,
1.256782, 0.5099586, -0.01276389, 0, 0, 0, 1, 1,
1.263863, -0.7927194, 1.93235, 0, 0, 0, 1, 1,
1.272704, -1.402131, 2.868993, 0, 0, 0, 1, 1,
1.273528, -0.9430045, 2.799883, 0, 0, 0, 1, 1,
1.274174, -0.2533396, 1.118202, 0, 0, 0, 1, 1,
1.298156, 1.248535, 0.4265281, 1, 1, 1, 1, 1,
1.303249, -1.123314, 1.022241, 1, 1, 1, 1, 1,
1.307635, 1.599576, 2.151045, 1, 1, 1, 1, 1,
1.307638, 0.09868728, 1.497113, 1, 1, 1, 1, 1,
1.310825, 0.08629379, 0.5377359, 1, 1, 1, 1, 1,
1.334377, -0.1929117, 3.197827, 1, 1, 1, 1, 1,
1.344582, 0.2282048, 1.235884, 1, 1, 1, 1, 1,
1.351043, 0.930109, 1.518624, 1, 1, 1, 1, 1,
1.374839, -0.2430088, 0.101423, 1, 1, 1, 1, 1,
1.376271, 1.354501, 0.7072028, 1, 1, 1, 1, 1,
1.387392, 1.058912, 1.032928, 1, 1, 1, 1, 1,
1.389063, 0.8948566, 1.34198, 1, 1, 1, 1, 1,
1.389937, 0.486446, 2.572161, 1, 1, 1, 1, 1,
1.391517, 0.03801667, 2.731122, 1, 1, 1, 1, 1,
1.393373, 1.312403, 0.6135983, 1, 1, 1, 1, 1,
1.394821, -0.6775359, 3.372669, 0, 0, 1, 1, 1,
1.395982, -1.846959, 2.114422, 1, 0, 0, 1, 1,
1.39668, -0.2251436, 2.140614, 1, 0, 0, 1, 1,
1.397983, -0.5081394, 2.700429, 1, 0, 0, 1, 1,
1.403844, -0.9748821, 3.245989, 1, 0, 0, 1, 1,
1.413857, -0.1714198, 1.209964, 1, 0, 0, 1, 1,
1.414272, -1.10034, 1.379323, 0, 0, 0, 1, 1,
1.415588, 0.01952376, 1.629116, 0, 0, 0, 1, 1,
1.430375, -1.090094, 1.161627, 0, 0, 0, 1, 1,
1.433661, 0.8158292, 1.754454, 0, 0, 0, 1, 1,
1.438069, 0.2129255, -0.2079944, 0, 0, 0, 1, 1,
1.450012, -1.196634, 3.994748, 0, 0, 0, 1, 1,
1.456625, 1.020552, 0.9817235, 0, 0, 0, 1, 1,
1.459225, 0.7757098, 1.639965, 1, 1, 1, 1, 1,
1.466109, 0.2787378, 2.221845, 1, 1, 1, 1, 1,
1.46798, -1.230272, 0.3597966, 1, 1, 1, 1, 1,
1.474234, 1.029707, 1.395337, 1, 1, 1, 1, 1,
1.489997, 0.5839351, -0.3869645, 1, 1, 1, 1, 1,
1.505485, -0.240334, 2.293443, 1, 1, 1, 1, 1,
1.520435, -0.4119352, 0.3203603, 1, 1, 1, 1, 1,
1.54148, -0.3948866, 2.081568, 1, 1, 1, 1, 1,
1.545581, -0.1625403, 1.00972, 1, 1, 1, 1, 1,
1.561458, -0.5497765, 0.6544635, 1, 1, 1, 1, 1,
1.566419, 1.637735, 1.098759, 1, 1, 1, 1, 1,
1.573967, 0.4351122, 2.103359, 1, 1, 1, 1, 1,
1.578874, -0.6456555, 1.979643, 1, 1, 1, 1, 1,
1.595364, -1.298605, 2.608128, 1, 1, 1, 1, 1,
1.611108, 0.07581653, 2.461524, 1, 1, 1, 1, 1,
1.629811, -0.8208446, 1.694939, 0, 0, 1, 1, 1,
1.630894, -0.3657276, 3.53136, 1, 0, 0, 1, 1,
1.631177, -0.2249606, 2.135834, 1, 0, 0, 1, 1,
1.631574, -0.1913633, 2.368562, 1, 0, 0, 1, 1,
1.632541, 0.866984, 0.5149704, 1, 0, 0, 1, 1,
1.639016, 1.054473, 2.154921, 1, 0, 0, 1, 1,
1.646635, 1.788376, 1.944576, 0, 0, 0, 1, 1,
1.655677, -1.567811, 3.443609, 0, 0, 0, 1, 1,
1.65602, -0.418043, 1.839124, 0, 0, 0, 1, 1,
1.66604, -0.8553999, 2.565629, 0, 0, 0, 1, 1,
1.674621, 1.101285, 0.4373703, 0, 0, 0, 1, 1,
1.68849, -1.66578, 2.353887, 0, 0, 0, 1, 1,
1.695823, -1.072065, 3.203997, 0, 0, 0, 1, 1,
1.698864, -0.5138981, 2.142462, 1, 1, 1, 1, 1,
1.705891, -1.611887, 4.287428, 1, 1, 1, 1, 1,
1.711337, 0.03705172, 3.333981, 1, 1, 1, 1, 1,
1.713436, -0.0434103, 2.161718, 1, 1, 1, 1, 1,
1.713684, 1.560664, 2.41446, 1, 1, 1, 1, 1,
1.729271, -0.03127124, 0.3712142, 1, 1, 1, 1, 1,
1.732868, -0.7077657, 1.707601, 1, 1, 1, 1, 1,
1.745478, -1.372943, 2.903868, 1, 1, 1, 1, 1,
1.750581, 1.028479, 1.348112, 1, 1, 1, 1, 1,
1.753086, 1.159466, -0.1211012, 1, 1, 1, 1, 1,
1.754505, -0.8926709, 1.855366, 1, 1, 1, 1, 1,
1.762801, 0.1521766, 0.3907117, 1, 1, 1, 1, 1,
1.770914, 1.138885, 1.799577, 1, 1, 1, 1, 1,
1.772794, 0.5819647, 0.02307852, 1, 1, 1, 1, 1,
1.783702, -0.3242552, 1.798132, 1, 1, 1, 1, 1,
1.78422, 0.4225339, 1.441852, 0, 0, 1, 1, 1,
1.787199, -0.3475905, 0.6890082, 1, 0, 0, 1, 1,
1.793503, -0.8424612, 0.9911358, 1, 0, 0, 1, 1,
1.802676, 1.263986, 0.1162652, 1, 0, 0, 1, 1,
1.817151, -1.063919, 2.55112, 1, 0, 0, 1, 1,
1.824557, 1.014499, 0.04669423, 1, 0, 0, 1, 1,
1.850841, 1.984335, -1.574274, 0, 0, 0, 1, 1,
1.8603, 0.06756599, 0.4586567, 0, 0, 0, 1, 1,
1.869401, -0.3892463, 1.82649, 0, 0, 0, 1, 1,
1.877848, 0.7282882, 1.150711, 0, 0, 0, 1, 1,
1.884761, 2.037707, -0.4414559, 0, 0, 0, 1, 1,
1.887604, 0.4578148, 1.674418, 0, 0, 0, 1, 1,
1.922177, 1.451505, -1.281303, 0, 0, 0, 1, 1,
1.947384, 1.489842, 1.629704, 1, 1, 1, 1, 1,
1.953338, -0.7783374, 0.5171663, 1, 1, 1, 1, 1,
1.962876, 2.033053, 0.7902157, 1, 1, 1, 1, 1,
2.001579, -0.9469162, 0.6242815, 1, 1, 1, 1, 1,
2.021326, 0.07446672, -0.1206669, 1, 1, 1, 1, 1,
2.029068, -0.06730855, 0.6010896, 1, 1, 1, 1, 1,
2.031185, 0.9417533, 1.283661, 1, 1, 1, 1, 1,
2.044435, -0.7425356, 3.29358, 1, 1, 1, 1, 1,
2.051449, 0.1317709, 3.515571, 1, 1, 1, 1, 1,
2.074592, -0.8180323, 1.902463, 1, 1, 1, 1, 1,
2.076909, 0.2363046, -0.8217032, 1, 1, 1, 1, 1,
2.085897, 0.6136537, 2.574119, 1, 1, 1, 1, 1,
2.121168, 1.24974, 2.033942, 1, 1, 1, 1, 1,
2.125026, 0.1092827, 3.229094, 1, 1, 1, 1, 1,
2.206214, -0.2584349, 1.275242, 1, 1, 1, 1, 1,
2.226916, -0.6560508, -0.5541793, 0, 0, 1, 1, 1,
2.350804, -0.6717328, 0.647131, 1, 0, 0, 1, 1,
2.353061, 1.027042, -0.7887092, 1, 0, 0, 1, 1,
2.373011, 1.47059, 0.7357255, 1, 0, 0, 1, 1,
2.407866, -0.1372334, 0.1483858, 1, 0, 0, 1, 1,
2.415911, -2.84374, 1.713182, 1, 0, 0, 1, 1,
2.428851, -0.9034137, 2.166642, 0, 0, 0, 1, 1,
2.450666, 0.8797677, 0.3393052, 0, 0, 0, 1, 1,
2.470104, 0.01034304, 2.030533, 0, 0, 0, 1, 1,
2.477175, -0.4031717, 1.232253, 0, 0, 0, 1, 1,
2.512824, -0.628552, 2.850317, 0, 0, 0, 1, 1,
2.542425, -1.150726, 2.342426, 0, 0, 0, 1, 1,
2.551689, -0.455166, 1.109765, 0, 0, 0, 1, 1,
2.566853, -0.3526272, 2.319027, 1, 1, 1, 1, 1,
2.712957, 0.162748, 0.04285252, 1, 1, 1, 1, 1,
2.74456, 0.07464693, 2.487179, 1, 1, 1, 1, 1,
2.780652, -0.5499223, 2.49633, 1, 1, 1, 1, 1,
2.873593, -0.1908413, 1.482017, 1, 1, 1, 1, 1,
3.006214, -0.2098197, 1.514843, 1, 1, 1, 1, 1,
3.488089, -0.02228786, 0.1086212, 1, 1, 1, 1, 1
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
var radius = 9.343081;
var distance = 32.81718;
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
mvMatrix.translate( -0.04863358, -0.07428098, -0.001101971 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81718);
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