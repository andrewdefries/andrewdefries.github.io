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
-3.465908, -0.4067314, -2.377891, 1, 0, 0, 1,
-3.298015, 0.9715019, 0.351614, 1, 0.007843138, 0, 1,
-2.667859, -2.72001, -3.26468, 1, 0.01176471, 0, 1,
-2.570842, -0.6865523, -1.693081, 1, 0.01960784, 0, 1,
-2.483541, 1.061163, 1.14529, 1, 0.02352941, 0, 1,
-2.430151, -0.5777897, -0.4210112, 1, 0.03137255, 0, 1,
-2.422805, 0.2209964, -0.3661479, 1, 0.03529412, 0, 1,
-2.243639, 0.373953, -2.121809, 1, 0.04313726, 0, 1,
-2.218937, 0.9216959, -0.7796515, 1, 0.04705882, 0, 1,
-2.197453, 0.882404, -1.405822, 1, 0.05490196, 0, 1,
-2.154098, 1.322949, -1.957563, 1, 0.05882353, 0, 1,
-2.070657, 0.1742242, -1.410992, 1, 0.06666667, 0, 1,
-2.070102, 1.202565, -0.5975897, 1, 0.07058824, 0, 1,
-1.994087, 0.5517152, -1.420263, 1, 0.07843138, 0, 1,
-1.989887, -0.8287278, -0.1024586, 1, 0.08235294, 0, 1,
-1.951144, 1.849959, -0.1778833, 1, 0.09019608, 0, 1,
-1.935957, 0.4482385, -0.2844209, 1, 0.09411765, 0, 1,
-1.915765, -1.656296, -1.962183, 1, 0.1019608, 0, 1,
-1.909095, 0.4417735, -0.1533654, 1, 0.1098039, 0, 1,
-1.909008, 0.3046769, -1.428287, 1, 0.1137255, 0, 1,
-1.908691, 0.1674757, -2.1343, 1, 0.1215686, 0, 1,
-1.902, -0.1509112, -2.465543, 1, 0.1254902, 0, 1,
-1.891577, 0.3362849, -0.0429125, 1, 0.1333333, 0, 1,
-1.871094, -0.2930876, -1.41007, 1, 0.1372549, 0, 1,
-1.851091, -0.4487949, -0.4925952, 1, 0.145098, 0, 1,
-1.822033, -2.094352, -3.487364, 1, 0.1490196, 0, 1,
-1.815943, 1.391649, -0.8794582, 1, 0.1568628, 0, 1,
-1.812424, 1.25274, -1.217759, 1, 0.1607843, 0, 1,
-1.803412, -1.557848, -2.680974, 1, 0.1686275, 0, 1,
-1.785928, -0.3608451, -0.02229484, 1, 0.172549, 0, 1,
-1.765249, -1.429939, -2.498117, 1, 0.1803922, 0, 1,
-1.741016, -0.9593832, -2.011637, 1, 0.1843137, 0, 1,
-1.722246, 0.1599983, -1.59781, 1, 0.1921569, 0, 1,
-1.712624, 0.7751841, -1.25141, 1, 0.1960784, 0, 1,
-1.712406, 0.2984798, -0.7153369, 1, 0.2039216, 0, 1,
-1.711344, 1.137114, -0.6916897, 1, 0.2117647, 0, 1,
-1.706153, 0.6199923, -0.5008795, 1, 0.2156863, 0, 1,
-1.663681, -1.488465, -2.468104, 1, 0.2235294, 0, 1,
-1.644291, -1.81131, -2.562442, 1, 0.227451, 0, 1,
-1.623703, -0.129419, -2.872097, 1, 0.2352941, 0, 1,
-1.608518, -0.3355264, -2.204202, 1, 0.2392157, 0, 1,
-1.599785, -0.5556921, -0.8547806, 1, 0.2470588, 0, 1,
-1.599769, 0.7450437, -1.487224, 1, 0.2509804, 0, 1,
-1.590688, 0.2197488, -1.754953, 1, 0.2588235, 0, 1,
-1.550505, 0.05066849, -1.536939, 1, 0.2627451, 0, 1,
-1.549451, -0.7015572, -2.025247, 1, 0.2705882, 0, 1,
-1.539992, 1.120426, -0.2423285, 1, 0.2745098, 0, 1,
-1.536965, 0.08112342, -3.479172, 1, 0.282353, 0, 1,
-1.536298, 1.440221, -0.6049165, 1, 0.2862745, 0, 1,
-1.526872, 0.5040426, -1.645061, 1, 0.2941177, 0, 1,
-1.515612, 0.02173401, -1.929048, 1, 0.3019608, 0, 1,
-1.509243, -1.145654, -2.250542, 1, 0.3058824, 0, 1,
-1.488714, 1.83052, -2.565667, 1, 0.3137255, 0, 1,
-1.483451, 0.1134729, -1.991095, 1, 0.3176471, 0, 1,
-1.48208, 1.833736, -1.32121, 1, 0.3254902, 0, 1,
-1.480787, -0.5501125, -1.27866, 1, 0.3294118, 0, 1,
-1.468971, -2.228675, -4.015229, 1, 0.3372549, 0, 1,
-1.461285, -1.400846, -1.432792, 1, 0.3411765, 0, 1,
-1.460487, 1.380933, -1.345718, 1, 0.3490196, 0, 1,
-1.458467, 0.5765691, -1.894065, 1, 0.3529412, 0, 1,
-1.452697, 0.5766762, -3.556257, 1, 0.3607843, 0, 1,
-1.451069, -0.2352291, -1.411651, 1, 0.3647059, 0, 1,
-1.450694, 0.7044326, -1.576192, 1, 0.372549, 0, 1,
-1.447442, 1.029902, -1.746451, 1, 0.3764706, 0, 1,
-1.443499, -0.3895626, -1.493881, 1, 0.3843137, 0, 1,
-1.44205, -1.077303, -0.6081929, 1, 0.3882353, 0, 1,
-1.437996, 0.6241287, -0.1832642, 1, 0.3960784, 0, 1,
-1.419623, 1.070183, -2.142453, 1, 0.4039216, 0, 1,
-1.414867, 0.1878812, -2.088896, 1, 0.4078431, 0, 1,
-1.411878, 0.2793737, 1.277089, 1, 0.4156863, 0, 1,
-1.407032, 0.121645, -1.287636, 1, 0.4196078, 0, 1,
-1.399973, -1.132234, -1.303343, 1, 0.427451, 0, 1,
-1.385, 0.4788597, -1.66383, 1, 0.4313726, 0, 1,
-1.384899, 1.677637, -1.069647, 1, 0.4392157, 0, 1,
-1.378099, -0.4126392, -1.612952, 1, 0.4431373, 0, 1,
-1.376619, -0.03550478, -0.2039932, 1, 0.4509804, 0, 1,
-1.3652, 0.9179266, -0.7502261, 1, 0.454902, 0, 1,
-1.348375, 2.089244, -0.1913127, 1, 0.4627451, 0, 1,
-1.347409, -2.76434, -2.518408, 1, 0.4666667, 0, 1,
-1.328851, -1.415565, -2.045936, 1, 0.4745098, 0, 1,
-1.328438, -1.229224, -2.412991, 1, 0.4784314, 0, 1,
-1.316267, -0.7084056, -2.262395, 1, 0.4862745, 0, 1,
-1.312406, -0.7708468, -2.587219, 1, 0.4901961, 0, 1,
-1.310389, -0.3434938, -2.864465, 1, 0.4980392, 0, 1,
-1.306068, -0.6266896, -1.708291, 1, 0.5058824, 0, 1,
-1.286083, 1.269365, 0.8292582, 1, 0.509804, 0, 1,
-1.280537, -0.4912033, -2.20216, 1, 0.5176471, 0, 1,
-1.274917, 0.2260448, -0.4488094, 1, 0.5215687, 0, 1,
-1.271612, -0.352223, -1.370939, 1, 0.5294118, 0, 1,
-1.270561, -1.391688, -2.013974, 1, 0.5333334, 0, 1,
-1.268422, -0.006165728, -2.133866, 1, 0.5411765, 0, 1,
-1.262902, 0.1990969, -0.2623185, 1, 0.5450981, 0, 1,
-1.249654, -0.4778225, -0.1305882, 1, 0.5529412, 0, 1,
-1.246843, -1.215004, -0.8383429, 1, 0.5568628, 0, 1,
-1.239511, -1.108364, -2.205806, 1, 0.5647059, 0, 1,
-1.228847, 0.716386, -1.390444, 1, 0.5686275, 0, 1,
-1.227725, 1.027094, -3.053551, 1, 0.5764706, 0, 1,
-1.22369, -1.459492, -1.878542, 1, 0.5803922, 0, 1,
-1.215464, 1.06951, -1.835992, 1, 0.5882353, 0, 1,
-1.209782, -0.09937465, -0.9544921, 1, 0.5921569, 0, 1,
-1.206107, 1.720791, -1.03969, 1, 0.6, 0, 1,
-1.199522, 0.4053207, -2.120821, 1, 0.6078432, 0, 1,
-1.189031, 1.561381, 1.000584, 1, 0.6117647, 0, 1,
-1.183424, 0.9876521, -0.6105437, 1, 0.6196079, 0, 1,
-1.183309, -0.4920619, -0.5212725, 1, 0.6235294, 0, 1,
-1.182407, -1.73377, -3.30411, 1, 0.6313726, 0, 1,
-1.170929, -0.4697796, -0.7750536, 1, 0.6352941, 0, 1,
-1.163321, -0.3797772, -1.601649, 1, 0.6431373, 0, 1,
-1.156838, -1.903038, -3.646288, 1, 0.6470588, 0, 1,
-1.156268, 0.3669749, -1.167551, 1, 0.654902, 0, 1,
-1.146398, -0.01072109, -0.6669879, 1, 0.6588235, 0, 1,
-1.141227, -0.8636271, -1.43488, 1, 0.6666667, 0, 1,
-1.138419, -0.270308, -2.567997, 1, 0.6705883, 0, 1,
-1.138303, 0.9171939, -0.7797285, 1, 0.6784314, 0, 1,
-1.137843, -0.7602589, -1.285161, 1, 0.682353, 0, 1,
-1.130955, -0.2634822, -3.00703, 1, 0.6901961, 0, 1,
-1.13007, 0.2521952, -1.726875, 1, 0.6941177, 0, 1,
-1.128342, 0.1934503, -1.485339, 1, 0.7019608, 0, 1,
-1.123452, 0.7162254, -1.233432, 1, 0.7098039, 0, 1,
-1.121191, -0.7125605, -2.824674, 1, 0.7137255, 0, 1,
-1.114733, 0.1119464, -0.4277499, 1, 0.7215686, 0, 1,
-1.112981, -0.6765522, -1.454071, 1, 0.7254902, 0, 1,
-1.106081, -0.5737967, -1.054545, 1, 0.7333333, 0, 1,
-1.10138, -1.431053, -2.855543, 1, 0.7372549, 0, 1,
-1.099493, -0.7096238, -1.986532, 1, 0.7450981, 0, 1,
-1.09612, -0.1450594, -0.05470841, 1, 0.7490196, 0, 1,
-1.093739, -0.6334666, -2.178525, 1, 0.7568628, 0, 1,
-1.070716, 0.2594338, -1.813992, 1, 0.7607843, 0, 1,
-1.065673, 0.5635006, -1.673107, 1, 0.7686275, 0, 1,
-1.05777, 0.7893463, -0.4762612, 1, 0.772549, 0, 1,
-1.057738, 0.2613264, -1.498819, 1, 0.7803922, 0, 1,
-1.052924, -0.7292821, -2.772901, 1, 0.7843137, 0, 1,
-1.05278, -0.4559857, -2.316952, 1, 0.7921569, 0, 1,
-1.048323, 0.4930505, -1.000683, 1, 0.7960784, 0, 1,
-1.040702, 0.03542258, -0.8714541, 1, 0.8039216, 0, 1,
-1.035905, 0.1850931, -1.9197, 1, 0.8117647, 0, 1,
-1.033756, -0.9944308, -3.414949, 1, 0.8156863, 0, 1,
-1.032582, 0.09383716, -1.819724, 1, 0.8235294, 0, 1,
-1.030424, 0.07938927, -0.9783925, 1, 0.827451, 0, 1,
-1.027449, 0.04923491, -3.899869, 1, 0.8352941, 0, 1,
-1.020116, 0.088388, -0.1810672, 1, 0.8392157, 0, 1,
-1.01439, 0.4552367, -1.874151, 1, 0.8470588, 0, 1,
-1.003269, 1.004996, -0.5330983, 1, 0.8509804, 0, 1,
-1.000305, 0.8825601, -0.4661034, 1, 0.8588235, 0, 1,
-0.9972501, 0.06564921, -0.3652194, 1, 0.8627451, 0, 1,
-0.9941257, -0.7685039, -1.142496, 1, 0.8705882, 0, 1,
-0.9836354, 0.5864583, -0.5717809, 1, 0.8745098, 0, 1,
-0.9829221, 0.4547166, -1.503176, 1, 0.8823529, 0, 1,
-0.9815037, 0.02988901, -0.5601358, 1, 0.8862745, 0, 1,
-0.9813099, -0.6735607, -1.739705, 1, 0.8941177, 0, 1,
-0.9706848, 0.05503516, -0.5120901, 1, 0.8980392, 0, 1,
-0.9603587, -0.3333886, -0.83812, 1, 0.9058824, 0, 1,
-0.9599104, -0.4196231, -0.4555749, 1, 0.9137255, 0, 1,
-0.9584416, -0.4695191, -2.152179, 1, 0.9176471, 0, 1,
-0.9580655, 0.6605928, -0.7296435, 1, 0.9254902, 0, 1,
-0.9530104, -0.536315, -1.79124, 1, 0.9294118, 0, 1,
-0.9504887, 0.3148739, -4.212693, 1, 0.9372549, 0, 1,
-0.9405899, 0.4748588, -1.06705, 1, 0.9411765, 0, 1,
-0.939319, -0.6989222, -1.88134, 1, 0.9490196, 0, 1,
-0.9380359, 0.3443047, -0.1041471, 1, 0.9529412, 0, 1,
-0.924731, -0.02517472, -1.454987, 1, 0.9607843, 0, 1,
-0.9241105, -0.03054569, -1.494231, 1, 0.9647059, 0, 1,
-0.915743, 1.534297, -1.045123, 1, 0.972549, 0, 1,
-0.9129069, -0.1492706, -1.451612, 1, 0.9764706, 0, 1,
-0.9108346, -1.534999, -3.657072, 1, 0.9843137, 0, 1,
-0.9088581, -1.012029, -2.585438, 1, 0.9882353, 0, 1,
-0.9068702, -0.1445432, -1.049035, 1, 0.9960784, 0, 1,
-0.9052929, -0.9232229, -0.2202113, 0.9960784, 1, 0, 1,
-0.8986616, -1.141685, -1.361371, 0.9921569, 1, 0, 1,
-0.8973268, -0.2754949, -2.417439, 0.9843137, 1, 0, 1,
-0.8961034, -0.9115854, -1.923306, 0.9803922, 1, 0, 1,
-0.8873926, 0.6925178, -0.9002991, 0.972549, 1, 0, 1,
-0.8848996, -0.675539, -0.3601633, 0.9686275, 1, 0, 1,
-0.8835125, 0.4476104, 0.5340609, 0.9607843, 1, 0, 1,
-0.8720903, -0.1114533, -1.12377, 0.9568627, 1, 0, 1,
-0.8645959, -0.6802123, -3.374753, 0.9490196, 1, 0, 1,
-0.8644211, -0.1108283, -0.7927462, 0.945098, 1, 0, 1,
-0.8609859, 1.269999, -0.9085789, 0.9372549, 1, 0, 1,
-0.8607562, -1.232407, -3.162165, 0.9333333, 1, 0, 1,
-0.8602313, 0.8902181, -0.6049808, 0.9254902, 1, 0, 1,
-0.8554323, -0.1275431, -1.595707, 0.9215686, 1, 0, 1,
-0.8455842, 0.717033, -0.4091253, 0.9137255, 1, 0, 1,
-0.8418593, -1.23141, -2.24037, 0.9098039, 1, 0, 1,
-0.8401723, 0.8846619, -0.7924709, 0.9019608, 1, 0, 1,
-0.8390223, -1.791121, -2.785798, 0.8941177, 1, 0, 1,
-0.8371994, 1.432961, -0.03584361, 0.8901961, 1, 0, 1,
-0.8341023, 0.6203272, -0.4376827, 0.8823529, 1, 0, 1,
-0.8317474, 0.2069256, -0.8753429, 0.8784314, 1, 0, 1,
-0.8294382, -0.09374072, -2.0233, 0.8705882, 1, 0, 1,
-0.8168561, 0.02987152, -2.910721, 0.8666667, 1, 0, 1,
-0.806801, -0.3832461, -1.89421, 0.8588235, 1, 0, 1,
-0.8036626, 0.3192458, -1.834798, 0.854902, 1, 0, 1,
-0.803497, -0.5913559, -1.418569, 0.8470588, 1, 0, 1,
-0.7992206, 1.053003, -2.276931, 0.8431373, 1, 0, 1,
-0.7915398, 1.453978, -1.411393, 0.8352941, 1, 0, 1,
-0.7885635, -0.9794584, -1.511253, 0.8313726, 1, 0, 1,
-0.7880273, -0.2121927, -2.664947, 0.8235294, 1, 0, 1,
-0.7869499, 2.205984, 0.2478698, 0.8196079, 1, 0, 1,
-0.7867203, 0.9429217, 0.6001446, 0.8117647, 1, 0, 1,
-0.7861888, 1.220505, 0.6365828, 0.8078431, 1, 0, 1,
-0.7767097, -0.7294347, -3.132623, 0.8, 1, 0, 1,
-0.7731324, 1.007406, -0.1775689, 0.7921569, 1, 0, 1,
-0.7625619, 0.09111907, 0.04502695, 0.7882353, 1, 0, 1,
-0.7580922, -0.7215697, -2.801071, 0.7803922, 1, 0, 1,
-0.7578728, -0.6975566, -2.814982, 0.7764706, 1, 0, 1,
-0.7509819, 0.3483068, 1.025706, 0.7686275, 1, 0, 1,
-0.7506364, 0.01272537, -1.223503, 0.7647059, 1, 0, 1,
-0.7498137, 0.005454717, -1.868896, 0.7568628, 1, 0, 1,
-0.7451636, -1.868695, -3.682571, 0.7529412, 1, 0, 1,
-0.7451241, -0.2517681, -3.132506, 0.7450981, 1, 0, 1,
-0.7439522, -0.521723, -3.781232, 0.7411765, 1, 0, 1,
-0.7395848, -1.249777, 0.04755792, 0.7333333, 1, 0, 1,
-0.7298666, 0.1704034, -0.8424528, 0.7294118, 1, 0, 1,
-0.7281235, 0.2572466, 0.43061, 0.7215686, 1, 0, 1,
-0.7255791, -0.379487, -3.276164, 0.7176471, 1, 0, 1,
-0.7251657, 2.610882, -0.2238355, 0.7098039, 1, 0, 1,
-0.7197323, -0.8127524, -2.489655, 0.7058824, 1, 0, 1,
-0.7186708, 0.1393597, -1.606851, 0.6980392, 1, 0, 1,
-0.7185392, -0.8885244, -2.743356, 0.6901961, 1, 0, 1,
-0.7157627, 0.6163039, 0.7318239, 0.6862745, 1, 0, 1,
-0.7125283, 2.380442, -1.458324, 0.6784314, 1, 0, 1,
-0.7114689, 2.017903, 0.7510709, 0.6745098, 1, 0, 1,
-0.7084996, -1.918224, -3.635628, 0.6666667, 1, 0, 1,
-0.7053375, 0.04848838, -0.2517562, 0.6627451, 1, 0, 1,
-0.6989786, 0.4708548, -3.290902, 0.654902, 1, 0, 1,
-0.6948138, 0.3312666, -2.45388, 0.6509804, 1, 0, 1,
-0.6940882, 0.2383743, -1.700408, 0.6431373, 1, 0, 1,
-0.6932383, -1.11507, -1.360861, 0.6392157, 1, 0, 1,
-0.6857951, -0.2152291, -1.846669, 0.6313726, 1, 0, 1,
-0.684958, -0.3892792, -0.929231, 0.627451, 1, 0, 1,
-0.6793852, 1.536042, -0.09760036, 0.6196079, 1, 0, 1,
-0.6791006, 0.5557137, -0.3794598, 0.6156863, 1, 0, 1,
-0.6765547, -1.504694, -2.33762, 0.6078432, 1, 0, 1,
-0.6755323, -0.680175, -2.483701, 0.6039216, 1, 0, 1,
-0.6732524, 0.3735717, 0.2029262, 0.5960785, 1, 0, 1,
-0.6711247, 0.1771055, -1.341552, 0.5882353, 1, 0, 1,
-0.6665055, -0.111509, -0.9935424, 0.5843138, 1, 0, 1,
-0.6611339, 0.8514942, -0.2793103, 0.5764706, 1, 0, 1,
-0.6522384, 0.6254453, -1.890983, 0.572549, 1, 0, 1,
-0.651027, 1.758665, -0.2183869, 0.5647059, 1, 0, 1,
-0.65007, 0.06247438, -0.2818014, 0.5607843, 1, 0, 1,
-0.649618, 2.142463, 0.7123149, 0.5529412, 1, 0, 1,
-0.6456708, 0.4968363, -1.65997, 0.5490196, 1, 0, 1,
-0.6404658, 0.9932755, 1.506647, 0.5411765, 1, 0, 1,
-0.6389759, 0.585641, -1.400461, 0.5372549, 1, 0, 1,
-0.6389057, 0.4383061, -3.124849, 0.5294118, 1, 0, 1,
-0.626596, 2.790061, -1.508959, 0.5254902, 1, 0, 1,
-0.626152, -1.505667, -3.320457, 0.5176471, 1, 0, 1,
-0.6222125, 0.7931401, -0.8469686, 0.5137255, 1, 0, 1,
-0.6215035, -0.2027494, 0.2336279, 0.5058824, 1, 0, 1,
-0.6147052, 0.0276721, -1.270344, 0.5019608, 1, 0, 1,
-0.6131564, 0.3920005, -0.7703561, 0.4941176, 1, 0, 1,
-0.602949, 0.5357472, -0.5323179, 0.4862745, 1, 0, 1,
-0.6016029, -0.2147306, -2.688014, 0.4823529, 1, 0, 1,
-0.6008859, 1.588596, 1.154074, 0.4745098, 1, 0, 1,
-0.6005576, -0.7018371, -2.891789, 0.4705882, 1, 0, 1,
-0.5981719, -0.03857152, -1.92101, 0.4627451, 1, 0, 1,
-0.5945362, -2.366428, -4.815147, 0.4588235, 1, 0, 1,
-0.5868397, -0.4073174, -2.130034, 0.4509804, 1, 0, 1,
-0.5850739, -0.6607952, -2.322496, 0.4470588, 1, 0, 1,
-0.5803603, -0.0635976, -2.309997, 0.4392157, 1, 0, 1,
-0.5803006, 0.5003243, -0.9544732, 0.4352941, 1, 0, 1,
-0.5772161, -1.054577, -5.093644, 0.427451, 1, 0, 1,
-0.5757478, 0.1174974, -0.4998076, 0.4235294, 1, 0, 1,
-0.5740923, -0.1504367, -2.925159, 0.4156863, 1, 0, 1,
-0.5658563, -0.8107143, -1.132494, 0.4117647, 1, 0, 1,
-0.5542969, 1.317333, 0.2986049, 0.4039216, 1, 0, 1,
-0.5501757, -1.245543, -3.563877, 0.3960784, 1, 0, 1,
-0.5494179, -0.8423817, -3.591267, 0.3921569, 1, 0, 1,
-0.5466603, -0.8302717, -0.7454989, 0.3843137, 1, 0, 1,
-0.5456544, -0.01008596, -2.481047, 0.3803922, 1, 0, 1,
-0.5409895, -1.662458, -4.596029, 0.372549, 1, 0, 1,
-0.5394982, -0.6994851, -3.435712, 0.3686275, 1, 0, 1,
-0.5376792, -0.5386029, -2.86254, 0.3607843, 1, 0, 1,
-0.5372999, 0.5101095, -2.71671, 0.3568628, 1, 0, 1,
-0.5318072, 0.001090058, -2.479063, 0.3490196, 1, 0, 1,
-0.531243, -1.032697, -2.175119, 0.345098, 1, 0, 1,
-0.5281578, -0.0599263, -0.4270748, 0.3372549, 1, 0, 1,
-0.52716, -1.051528, -1.925079, 0.3333333, 1, 0, 1,
-0.5262272, 0.5542709, 0.5715432, 0.3254902, 1, 0, 1,
-0.5252927, 0.2362483, 0.3735229, 0.3215686, 1, 0, 1,
-0.5218675, -0.7886672, -3.117751, 0.3137255, 1, 0, 1,
-0.5205814, -0.8021823, -2.287304, 0.3098039, 1, 0, 1,
-0.5165604, 0.3876693, -0.4848036, 0.3019608, 1, 0, 1,
-0.5165115, 0.9447692, 1.445917, 0.2941177, 1, 0, 1,
-0.5153309, 1.260536, 0.4844069, 0.2901961, 1, 0, 1,
-0.5141352, 0.3970483, -2.329571, 0.282353, 1, 0, 1,
-0.513095, -0.3928072, -4.38607, 0.2784314, 1, 0, 1,
-0.5102899, -0.7868834, -2.40506, 0.2705882, 1, 0, 1,
-0.5089725, -0.6405283, -1.783812, 0.2666667, 1, 0, 1,
-0.5088398, 0.2601388, -1.140369, 0.2588235, 1, 0, 1,
-0.5087445, -0.4194988, -4.360831, 0.254902, 1, 0, 1,
-0.5076166, -0.4014472, -1.625712, 0.2470588, 1, 0, 1,
-0.507275, -0.9160831, -2.569686, 0.2431373, 1, 0, 1,
-0.5065817, -0.9728518, -2.258504, 0.2352941, 1, 0, 1,
-0.5026169, -0.4967377, -2.123422, 0.2313726, 1, 0, 1,
-0.5019825, -2.863605, -1.704594, 0.2235294, 1, 0, 1,
-0.5007647, -0.1794611, -2.451805, 0.2196078, 1, 0, 1,
-0.4941224, -0.4852708, -1.299788, 0.2117647, 1, 0, 1,
-0.490422, -0.5016497, -2.249145, 0.2078431, 1, 0, 1,
-0.4898915, 0.6356306, -0.7001207, 0.2, 1, 0, 1,
-0.4864527, -0.2281115, -1.806822, 0.1921569, 1, 0, 1,
-0.480897, 2.184382, -0.64623, 0.1882353, 1, 0, 1,
-0.4780786, -0.2817296, -1.172483, 0.1803922, 1, 0, 1,
-0.4747645, 2.564174, -0.3044915, 0.1764706, 1, 0, 1,
-0.4746301, 1.907955, -0.05958246, 0.1686275, 1, 0, 1,
-0.4736317, 1.068241, -1.482247, 0.1647059, 1, 0, 1,
-0.4731102, -0.1759509, -2.491524, 0.1568628, 1, 0, 1,
-0.4712204, 0.3255906, 0.2762133, 0.1529412, 1, 0, 1,
-0.4677393, 1.140956, 1.768802, 0.145098, 1, 0, 1,
-0.4673355, 0.8892935, -1.423424, 0.1411765, 1, 0, 1,
-0.4665467, -0.5650465, -2.016949, 0.1333333, 1, 0, 1,
-0.4664541, 0.7833486, -0.219823, 0.1294118, 1, 0, 1,
-0.4638858, -1.465726, -3.293552, 0.1215686, 1, 0, 1,
-0.4607467, 0.2464851, 0.389834, 0.1176471, 1, 0, 1,
-0.4605078, 0.8288114, 0.6540316, 0.1098039, 1, 0, 1,
-0.4560143, 0.2234044, -0.02654202, 0.1058824, 1, 0, 1,
-0.4495913, -0.3834364, -2.096714, 0.09803922, 1, 0, 1,
-0.4476885, -1.803582, -2.433897, 0.09019608, 1, 0, 1,
-0.4449355, 0.7597679, -2.884419, 0.08627451, 1, 0, 1,
-0.4358614, -1.475999, -1.308823, 0.07843138, 1, 0, 1,
-0.4312421, 0.5160342, 0.7255256, 0.07450981, 1, 0, 1,
-0.4280853, 0.6860226, 0.9095824, 0.06666667, 1, 0, 1,
-0.4268746, -0.5718402, -3.034828, 0.0627451, 1, 0, 1,
-0.4239902, -0.1838253, -0.7537448, 0.05490196, 1, 0, 1,
-0.4228677, 0.943252, -2.810645, 0.05098039, 1, 0, 1,
-0.4184676, -0.118148, -1.185869, 0.04313726, 1, 0, 1,
-0.4179421, -0.06491847, -1.791979, 0.03921569, 1, 0, 1,
-0.4153145, 1.636984, -1.963224, 0.03137255, 1, 0, 1,
-0.4148133, 0.04076992, -1.883308, 0.02745098, 1, 0, 1,
-0.4136104, -0.8848548, -2.055828, 0.01960784, 1, 0, 1,
-0.4096251, -0.1161907, -0.8168572, 0.01568628, 1, 0, 1,
-0.4087185, -1.215389, -3.092267, 0.007843138, 1, 0, 1,
-0.4067887, -0.5772803, -2.283043, 0.003921569, 1, 0, 1,
-0.4066894, 0.6629055, -0.341393, 0, 1, 0.003921569, 1,
-0.4032586, -1.111436, -2.633714, 0, 1, 0.01176471, 1,
-0.4025896, 1.051276, 0.4330721, 0, 1, 0.01568628, 1,
-0.3991382, -0.06783185, -1.210517, 0, 1, 0.02352941, 1,
-0.3929243, 2.314949, -0.2987701, 0, 1, 0.02745098, 1,
-0.3907906, -1.142041, -3.03448, 0, 1, 0.03529412, 1,
-0.3793604, 0.284921, -1.319497, 0, 1, 0.03921569, 1,
-0.3759651, 0.271206, -1.851727, 0, 1, 0.04705882, 1,
-0.3728531, 0.9503259, 0.09853395, 0, 1, 0.05098039, 1,
-0.3706073, -2.097129, -1.193955, 0, 1, 0.05882353, 1,
-0.3667904, 0.9226646, -2.218223, 0, 1, 0.0627451, 1,
-0.3565828, -0.3588534, -1.120689, 0, 1, 0.07058824, 1,
-0.3551362, 0.4583177, -0.2928462, 0, 1, 0.07450981, 1,
-0.3521631, 1.93425, -0.3682778, 0, 1, 0.08235294, 1,
-0.349176, 2.087124, 0.4332874, 0, 1, 0.08627451, 1,
-0.3449879, 2.393906, 2.306864, 0, 1, 0.09411765, 1,
-0.342573, -0.3580965, -4.466033, 0, 1, 0.1019608, 1,
-0.3381231, -0.1511534, -2.107425, 0, 1, 0.1058824, 1,
-0.3366148, -1.5694, -3.35108, 0, 1, 0.1137255, 1,
-0.3336597, -0.8210374, -3.810395, 0, 1, 0.1176471, 1,
-0.3320746, -0.7972442, -3.320998, 0, 1, 0.1254902, 1,
-0.325999, -0.5189591, -1.43971, 0, 1, 0.1294118, 1,
-0.3252955, 0.1722194, -1.512501, 0, 1, 0.1372549, 1,
-0.3235855, 1.178311, 0.4775851, 0, 1, 0.1411765, 1,
-0.3200514, -0.9307666, -4.093144, 0, 1, 0.1490196, 1,
-0.3079062, -0.03009669, -0.4569878, 0, 1, 0.1529412, 1,
-0.3050188, -1.173552, -4.093591, 0, 1, 0.1607843, 1,
-0.2963454, 0.2336517, -0.231508, 0, 1, 0.1647059, 1,
-0.2961521, -0.9126531, -0.7890258, 0, 1, 0.172549, 1,
-0.2929889, -0.8468965, -3.174923, 0, 1, 0.1764706, 1,
-0.2894191, -0.533426, -2.575989, 0, 1, 0.1843137, 1,
-0.2870615, -1.280679, -4.728296, 0, 1, 0.1882353, 1,
-0.2856998, -0.5298982, -2.691216, 0, 1, 0.1960784, 1,
-0.2846804, -0.1325452, -2.925143, 0, 1, 0.2039216, 1,
-0.281032, -0.3847774, -1.302876, 0, 1, 0.2078431, 1,
-0.2784767, 0.002786121, -3.804621, 0, 1, 0.2156863, 1,
-0.2762118, -0.3956105, -1.941438, 0, 1, 0.2196078, 1,
-0.2722439, 0.7950087, 0.8154709, 0, 1, 0.227451, 1,
-0.2719977, 1.20726, -0.03498614, 0, 1, 0.2313726, 1,
-0.2700918, -0.8388023, -3.083655, 0, 1, 0.2392157, 1,
-0.2700659, -0.9125836, -2.212564, 0, 1, 0.2431373, 1,
-0.2619947, 0.6467335, -1.794757, 0, 1, 0.2509804, 1,
-0.2609581, -0.5604651, -1.995506, 0, 1, 0.254902, 1,
-0.2601392, 0.005028191, -0.7741154, 0, 1, 0.2627451, 1,
-0.2576145, -0.3569106, -2.209578, 0, 1, 0.2666667, 1,
-0.2552617, 1.106938, 0.389018, 0, 1, 0.2745098, 1,
-0.252463, -2.233606, -3.568314, 0, 1, 0.2784314, 1,
-0.2497746, 0.6640529, 0.2352831, 0, 1, 0.2862745, 1,
-0.2489879, 0.8619067, 0.2417961, 0, 1, 0.2901961, 1,
-0.248529, 0.8915237, 0.2632601, 0, 1, 0.2980392, 1,
-0.2462719, -0.4404089, -2.808489, 0, 1, 0.3058824, 1,
-0.2412239, -0.7642228, -3.832446, 0, 1, 0.3098039, 1,
-0.2124253, -0.3567325, -3.155762, 0, 1, 0.3176471, 1,
-0.2121629, -1.696774, -3.689422, 0, 1, 0.3215686, 1,
-0.2069886, 0.04849726, -2.116102, 0, 1, 0.3294118, 1,
-0.2043969, -0.8793908, -2.65478, 0, 1, 0.3333333, 1,
-0.1967662, 0.09688216, -0.503208, 0, 1, 0.3411765, 1,
-0.1956602, 0.3729624, 0.06109535, 0, 1, 0.345098, 1,
-0.1949632, 1.665537, -0.8479242, 0, 1, 0.3529412, 1,
-0.193592, -0.7166473, -3.747389, 0, 1, 0.3568628, 1,
-0.1913062, 0.9477242, 1.861058, 0, 1, 0.3647059, 1,
-0.1892698, -1.633309, -2.937146, 0, 1, 0.3686275, 1,
-0.1829482, -0.8541936, -2.222887, 0, 1, 0.3764706, 1,
-0.1812227, 0.4742961, -0.5550004, 0, 1, 0.3803922, 1,
-0.1810709, 0.3190176, 0.3282116, 0, 1, 0.3882353, 1,
-0.1793778, -0.19728, -1.527678, 0, 1, 0.3921569, 1,
-0.1788932, 0.06092309, -1.770301, 0, 1, 0.4, 1,
-0.1774024, -0.201485, -1.380485, 0, 1, 0.4078431, 1,
-0.1703095, -1.121225, -2.21957, 0, 1, 0.4117647, 1,
-0.1689572, 0.4149985, -0.3448418, 0, 1, 0.4196078, 1,
-0.167251, 0.7741839, 0.4486039, 0, 1, 0.4235294, 1,
-0.1661932, 1.671529, -0.7225389, 0, 1, 0.4313726, 1,
-0.1646995, 0.9234961, -0.4587865, 0, 1, 0.4352941, 1,
-0.1550888, 0.6757914, 0.6192265, 0, 1, 0.4431373, 1,
-0.1550826, 0.7786193, -0.5714996, 0, 1, 0.4470588, 1,
-0.15431, -0.3858183, -2.183999, 0, 1, 0.454902, 1,
-0.153614, 0.6194761, -0.3991895, 0, 1, 0.4588235, 1,
-0.1513754, -0.958338, -2.572854, 0, 1, 0.4666667, 1,
-0.1500319, -0.1832727, -0.9709628, 0, 1, 0.4705882, 1,
-0.1475744, 0.6207191, 0.2207428, 0, 1, 0.4784314, 1,
-0.1441265, -1.307777, -2.800534, 0, 1, 0.4823529, 1,
-0.1426967, -0.3066003, -3.709585, 0, 1, 0.4901961, 1,
-0.1403288, -0.8704469, -4.656328, 0, 1, 0.4941176, 1,
-0.1379486, -0.9329195, -1.459478, 0, 1, 0.5019608, 1,
-0.1354271, 1.395496, -1.723979, 0, 1, 0.509804, 1,
-0.1346782, 0.4391836, -1.732548, 0, 1, 0.5137255, 1,
-0.1320595, 0.448866, -1.853007, 0, 1, 0.5215687, 1,
-0.129859, 0.07705673, 0.171221, 0, 1, 0.5254902, 1,
-0.1271216, 1.052955, -1.520044, 0, 1, 0.5333334, 1,
-0.1262453, 0.4498723, 0.5124418, 0, 1, 0.5372549, 1,
-0.1256738, 0.4700567, 0.4982084, 0, 1, 0.5450981, 1,
-0.1255323, 2.818732, -0.213069, 0, 1, 0.5490196, 1,
-0.1253284, -0.165055, -0.5283802, 0, 1, 0.5568628, 1,
-0.1226562, -1.244696, -4.462103, 0, 1, 0.5607843, 1,
-0.1192499, -1.422091, -3.283503, 0, 1, 0.5686275, 1,
-0.1182242, 0.6509597, -1.061514, 0, 1, 0.572549, 1,
-0.1151729, -1.490998, -2.948309, 0, 1, 0.5803922, 1,
-0.1130968, -0.2416108, -2.290887, 0, 1, 0.5843138, 1,
-0.1128854, -0.8394611, -4.292135, 0, 1, 0.5921569, 1,
-0.1067853, 0.2235468, -1.128842, 0, 1, 0.5960785, 1,
-0.09797546, 1.34412, -1.843527, 0, 1, 0.6039216, 1,
-0.09722435, -1.397315, -1.114623, 0, 1, 0.6117647, 1,
-0.09157533, 0.8407334, -1.619253, 0, 1, 0.6156863, 1,
-0.08780514, -0.3557807, -3.38585, 0, 1, 0.6235294, 1,
-0.08707836, -0.82996, -2.57994, 0, 1, 0.627451, 1,
-0.08324861, 0.4322827, -1.817646, 0, 1, 0.6352941, 1,
-0.08229704, 1.227225, 0.5284727, 0, 1, 0.6392157, 1,
-0.0810542, 0.02316396, -0.6914135, 0, 1, 0.6470588, 1,
-0.07202758, -1.402842, -4.090207, 0, 1, 0.6509804, 1,
-0.0716194, -0.6461031, -3.877887, 0, 1, 0.6588235, 1,
-0.07062262, -0.2791381, -4.606514, 0, 1, 0.6627451, 1,
-0.06948727, -0.7130657, -2.947196, 0, 1, 0.6705883, 1,
-0.06936604, 1.824493, 2.10578, 0, 1, 0.6745098, 1,
-0.06572424, 0.7271294, 0.8393772, 0, 1, 0.682353, 1,
-0.06371572, 0.8424467, -0.7195194, 0, 1, 0.6862745, 1,
-0.04981042, 1.692552, -0.8181, 0, 1, 0.6941177, 1,
-0.04320132, -0.7393196, -4.167382, 0, 1, 0.7019608, 1,
-0.0429364, -0.4120837, -2.097053, 0, 1, 0.7058824, 1,
-0.03930053, -0.3576215, -4.9255, 0, 1, 0.7137255, 1,
-0.03859372, 0.6368968, -1.523264, 0, 1, 0.7176471, 1,
-0.03802543, -2.902358, -3.020768, 0, 1, 0.7254902, 1,
-0.03763176, 0.3824134, -0.02940506, 0, 1, 0.7294118, 1,
-0.0325937, -0.7674892, -3.027452, 0, 1, 0.7372549, 1,
-0.03224616, 0.2291999, -0.9336915, 0, 1, 0.7411765, 1,
-0.02641785, 0.5459743, -1.636334, 0, 1, 0.7490196, 1,
-0.02559032, -0.8194501, -3.902477, 0, 1, 0.7529412, 1,
-0.01912618, -0.595592, -2.249985, 0, 1, 0.7607843, 1,
-0.01782553, -0.8236928, -4.144586, 0, 1, 0.7647059, 1,
-0.01762857, 0.6937366, 0.4518191, 0, 1, 0.772549, 1,
-0.01639924, 0.05337306, -0.163554, 0, 1, 0.7764706, 1,
-0.01579826, 0.4520357, -0.8491107, 0, 1, 0.7843137, 1,
-0.01507054, 1.320981, -0.1669398, 0, 1, 0.7882353, 1,
-0.01428707, -3.404864, -5.489311, 0, 1, 0.7960784, 1,
-0.01313416, -0.3737535, -4.31552, 0, 1, 0.8039216, 1,
-0.01084837, -0.04591211, -3.78129, 0, 1, 0.8078431, 1,
-0.009651594, 1.192161, 0.310838, 0, 1, 0.8156863, 1,
-0.009364989, 2.758696, -0.8991449, 0, 1, 0.8196079, 1,
-0.007895574, -0.07168463, -5.166066, 0, 1, 0.827451, 1,
-0.00413642, 0.190082, 1.663412, 0, 1, 0.8313726, 1,
-0.002149303, -0.1716265, -3.504782, 0, 1, 0.8392157, 1,
0.001115432, -1.199062, 3.177266, 0, 1, 0.8431373, 1,
0.003761636, -0.364935, 2.483457, 0, 1, 0.8509804, 1,
0.009311509, -1.096788, 3.11181, 0, 1, 0.854902, 1,
0.01437831, 1.760233, 1.473231, 0, 1, 0.8627451, 1,
0.01580877, 1.353557, -0.04808959, 0, 1, 0.8666667, 1,
0.01842182, 0.3504356, 0.1058637, 0, 1, 0.8745098, 1,
0.01938883, -0.3403337, 3.155942, 0, 1, 0.8784314, 1,
0.02082678, 0.9347471, -0.9127628, 0, 1, 0.8862745, 1,
0.02362587, 1.234656, -0.1723592, 0, 1, 0.8901961, 1,
0.02391805, 1.096632, -1.578187, 0, 1, 0.8980392, 1,
0.02426675, -1.304984, 4.090142, 0, 1, 0.9058824, 1,
0.02767842, -1.27051, 2.23655, 0, 1, 0.9098039, 1,
0.02933976, -0.31907, 2.990812, 0, 1, 0.9176471, 1,
0.03136403, 1.713304, -0.5401927, 0, 1, 0.9215686, 1,
0.0316508, 0.03165331, 1.960783, 0, 1, 0.9294118, 1,
0.03171018, -1.80217, 2.634818, 0, 1, 0.9333333, 1,
0.03500954, -0.3722695, 1.782292, 0, 1, 0.9411765, 1,
0.03706108, -0.5097307, 2.950533, 0, 1, 0.945098, 1,
0.0390153, 0.5185872, -1.010265, 0, 1, 0.9529412, 1,
0.04008505, -0.8822589, 4.921259, 0, 1, 0.9568627, 1,
0.04117504, 0.8615594, 1.209249, 0, 1, 0.9647059, 1,
0.0423109, 0.7076368, 0.4719914, 0, 1, 0.9686275, 1,
0.04344914, -0.5464323, 2.529137, 0, 1, 0.9764706, 1,
0.04374507, -0.5378542, 2.010764, 0, 1, 0.9803922, 1,
0.04446918, 0.1330854, -0.9510884, 0, 1, 0.9882353, 1,
0.04454436, 2.092407, -0.8582757, 0, 1, 0.9921569, 1,
0.05044037, -1.048883, 1.803514, 0, 1, 1, 1,
0.0528184, 0.2387239, 0.5933095, 0, 0.9921569, 1, 1,
0.05363944, 0.08149808, -0.1858202, 0, 0.9882353, 1, 1,
0.0599816, 2.276466, 0.3449785, 0, 0.9803922, 1, 1,
0.06030099, -0.4277574, 2.520611, 0, 0.9764706, 1, 1,
0.0604627, -0.775861, 3.024714, 0, 0.9686275, 1, 1,
0.06286788, 2.161773, -0.2458318, 0, 0.9647059, 1, 1,
0.06546268, 0.02166426, 1.707377, 0, 0.9568627, 1, 1,
0.07337157, 0.7914793, 0.4743643, 0, 0.9529412, 1, 1,
0.07522975, 0.6245142, 1.966381, 0, 0.945098, 1, 1,
0.07900322, 0.1432037, -0.3280974, 0, 0.9411765, 1, 1,
0.07945049, 0.7820577, -0.8125464, 0, 0.9333333, 1, 1,
0.07969848, 0.1537788, 2.286616, 0, 0.9294118, 1, 1,
0.07970164, -1.381876, 2.844975, 0, 0.9215686, 1, 1,
0.08242293, -0.5177641, 2.148884, 0, 0.9176471, 1, 1,
0.09315939, 0.4520949, -1.189366, 0, 0.9098039, 1, 1,
0.09478585, -0.3515604, 3.053818, 0, 0.9058824, 1, 1,
0.09538682, -0.09384724, 1.21281, 0, 0.8980392, 1, 1,
0.09633378, -1.02643, 3.397678, 0, 0.8901961, 1, 1,
0.1021411, 1.524699, -0.7845548, 0, 0.8862745, 1, 1,
0.1023653, -1.458063, 4.598089, 0, 0.8784314, 1, 1,
0.1097774, 0.3145509, -1.040251, 0, 0.8745098, 1, 1,
0.1102874, 0.3150249, 0.2439615, 0, 0.8666667, 1, 1,
0.111187, 0.1692236, -0.09410435, 0, 0.8627451, 1, 1,
0.1116615, -0.6259778, 4.022798, 0, 0.854902, 1, 1,
0.113352, -0.8258539, 2.606776, 0, 0.8509804, 1, 1,
0.1136995, -0.2664348, 2.812097, 0, 0.8431373, 1, 1,
0.1147042, 0.1074648, 1.112419, 0, 0.8392157, 1, 1,
0.1158476, -0.03904121, 3.054734, 0, 0.8313726, 1, 1,
0.1159599, 0.2937577, -0.4557379, 0, 0.827451, 1, 1,
0.116145, 0.4142279, -0.756023, 0, 0.8196079, 1, 1,
0.1176694, 0.9423286, -1.12832, 0, 0.8156863, 1, 1,
0.1180144, -0.8994387, 3.320471, 0, 0.8078431, 1, 1,
0.1194348, -0.28078, 3.74998, 0, 0.8039216, 1, 1,
0.1207198, -1.638733, 0.8854151, 0, 0.7960784, 1, 1,
0.1211114, -0.04620992, 2.593, 0, 0.7882353, 1, 1,
0.1237704, 0.3687117, 1.013545, 0, 0.7843137, 1, 1,
0.1259394, -1.286316, 4.733582, 0, 0.7764706, 1, 1,
0.1265941, 0.255722, 1.755929, 0, 0.772549, 1, 1,
0.1271649, 0.2120749, 0.02720154, 0, 0.7647059, 1, 1,
0.1281814, -0.2129334, 2.242409, 0, 0.7607843, 1, 1,
0.1288098, 1.05978, -1.523242, 0, 0.7529412, 1, 1,
0.1341218, -1.12653, 3.037743, 0, 0.7490196, 1, 1,
0.1343799, -1.239591, 3.357426, 0, 0.7411765, 1, 1,
0.1351512, 0.7961757, -0.282998, 0, 0.7372549, 1, 1,
0.1447414, -1.125515, 3.877264, 0, 0.7294118, 1, 1,
0.1492925, 0.08395159, 2.663312, 0, 0.7254902, 1, 1,
0.1548493, 0.03383593, 0.2128788, 0, 0.7176471, 1, 1,
0.1563154, -0.348953, 3.807139, 0, 0.7137255, 1, 1,
0.1636566, -0.1547935, 1.35128, 0, 0.7058824, 1, 1,
0.1684965, -0.9921635, 3.460413, 0, 0.6980392, 1, 1,
0.1691178, 0.3310472, 0.6783251, 0, 0.6941177, 1, 1,
0.1750835, -0.2003822, 3.546194, 0, 0.6862745, 1, 1,
0.1776282, 0.9418623, -1.555045, 0, 0.682353, 1, 1,
0.1777346, 1.217378, 1.15557, 0, 0.6745098, 1, 1,
0.1791676, 0.3183089, 2.005368, 0, 0.6705883, 1, 1,
0.1803349, -0.04986032, 3.398206, 0, 0.6627451, 1, 1,
0.1814539, 0.765297, -0.6697988, 0, 0.6588235, 1, 1,
0.1835882, 1.19139, -0.3238429, 0, 0.6509804, 1, 1,
0.1861075, -1.01766, 6.10416, 0, 0.6470588, 1, 1,
0.1990629, -0.1485846, 0.4205225, 0, 0.6392157, 1, 1,
0.2003462, 0.1354777, 2.494259, 0, 0.6352941, 1, 1,
0.2045911, -0.009468782, 0.1642374, 0, 0.627451, 1, 1,
0.2075427, 0.6236232, 0.2231879, 0, 0.6235294, 1, 1,
0.2164383, -1.544447, 4.39671, 0, 0.6156863, 1, 1,
0.2184019, -0.4169572, 2.59469, 0, 0.6117647, 1, 1,
0.2194753, -0.6620161, 3.224613, 0, 0.6039216, 1, 1,
0.220142, -0.6082762, 2.653992, 0, 0.5960785, 1, 1,
0.2204746, 1.727621, 0.8686555, 0, 0.5921569, 1, 1,
0.2222659, 1.445056, -0.8835548, 0, 0.5843138, 1, 1,
0.2251503, -2.583675, 3.016951, 0, 0.5803922, 1, 1,
0.2273171, 1.02987, -0.8485738, 0, 0.572549, 1, 1,
0.2309529, -1.987765, 2.010691, 0, 0.5686275, 1, 1,
0.2318718, -1.166802, 3.621297, 0, 0.5607843, 1, 1,
0.2347239, -0.2597865, 2.430897, 0, 0.5568628, 1, 1,
0.2353985, -2.122634, 1.206829, 0, 0.5490196, 1, 1,
0.2382337, -1.153419, 4.091032, 0, 0.5450981, 1, 1,
0.2427473, 0.8492747, 0.4725262, 0, 0.5372549, 1, 1,
0.2450468, 0.6452628, 0.3345655, 0, 0.5333334, 1, 1,
0.2469323, 0.8892257, 0.4602737, 0, 0.5254902, 1, 1,
0.2529207, 0.309947, 1.801715, 0, 0.5215687, 1, 1,
0.2539153, 0.2047788, 0.688314, 0, 0.5137255, 1, 1,
0.2552273, -0.1989057, 1.938114, 0, 0.509804, 1, 1,
0.2556079, -0.8454496, 2.66405, 0, 0.5019608, 1, 1,
0.2606692, -1.181271, 4.25526, 0, 0.4941176, 1, 1,
0.2700473, -1.155586, 2.474308, 0, 0.4901961, 1, 1,
0.2713622, 0.2722805, 0.1397552, 0, 0.4823529, 1, 1,
0.2728363, -0.62363, 3.816914, 0, 0.4784314, 1, 1,
0.2731095, 0.5113958, 0.1372846, 0, 0.4705882, 1, 1,
0.2747878, -1.665915, 0.888104, 0, 0.4666667, 1, 1,
0.2776861, 1.597349, 2.423905, 0, 0.4588235, 1, 1,
0.2790835, 0.1333989, -0.4313685, 0, 0.454902, 1, 1,
0.2794949, -2.014459, 2.349737, 0, 0.4470588, 1, 1,
0.2893542, 1.712467, -0.2212738, 0, 0.4431373, 1, 1,
0.2901073, 1.116621, 1.86149, 0, 0.4352941, 1, 1,
0.2930215, 0.6554617, -1.321962, 0, 0.4313726, 1, 1,
0.2934569, 0.4056239, -1.49779, 0, 0.4235294, 1, 1,
0.295009, -0.2973133, 1.650606, 0, 0.4196078, 1, 1,
0.2952537, 0.4563653, -0.01370265, 0, 0.4117647, 1, 1,
0.295836, 0.223563, -0.7910255, 0, 0.4078431, 1, 1,
0.2987492, 0.548604, -0.1714148, 0, 0.4, 1, 1,
0.2989158, -1.120132, 2.11514, 0, 0.3921569, 1, 1,
0.3055494, -1.789759, 2.55143, 0, 0.3882353, 1, 1,
0.3060764, -2.355713, 3.590034, 0, 0.3803922, 1, 1,
0.3091701, 0.6696936, 0.9408095, 0, 0.3764706, 1, 1,
0.3128947, 1.631853, 0.6757718, 0, 0.3686275, 1, 1,
0.313301, 0.8398249, 0.3785314, 0, 0.3647059, 1, 1,
0.3167188, 0.0003157157, 2.677808, 0, 0.3568628, 1, 1,
0.3185087, -1.643428, 3.290935, 0, 0.3529412, 1, 1,
0.320214, -1.045503, 5.166678, 0, 0.345098, 1, 1,
0.3214896, 1.141937, 0.233644, 0, 0.3411765, 1, 1,
0.327147, 0.8892725, 0.03488369, 0, 0.3333333, 1, 1,
0.3276038, 1.412042, 0.1507127, 0, 0.3294118, 1, 1,
0.3280642, 0.2703019, 2.158931, 0, 0.3215686, 1, 1,
0.3288955, -1.019165, 2.914298, 0, 0.3176471, 1, 1,
0.3305768, 0.2698292, 0.9914547, 0, 0.3098039, 1, 1,
0.3356668, 0.3205517, -1.817104, 0, 0.3058824, 1, 1,
0.3358545, -0.624674, 1.820035, 0, 0.2980392, 1, 1,
0.336233, 0.5300912, 0.6823829, 0, 0.2901961, 1, 1,
0.3363385, -1.82509, 1.923417, 0, 0.2862745, 1, 1,
0.336486, 0.5493536, 2.040805, 0, 0.2784314, 1, 1,
0.3395637, 1.718054, -1.134348, 0, 0.2745098, 1, 1,
0.3404252, 0.3442545, 1.30285, 0, 0.2666667, 1, 1,
0.3412601, -0.5608686, 1.665468, 0, 0.2627451, 1, 1,
0.3440647, 2.713444, 1.06289, 0, 0.254902, 1, 1,
0.348817, -2.297773, 2.191581, 0, 0.2509804, 1, 1,
0.3515907, 0.1206125, 1.801151, 0, 0.2431373, 1, 1,
0.3592556, 0.6941374, 1.952978, 0, 0.2392157, 1, 1,
0.3623392, 2.269771, 0.2562381, 0, 0.2313726, 1, 1,
0.3645232, -1.248874, 3.090984, 0, 0.227451, 1, 1,
0.365016, 0.7707148, 1.443321, 0, 0.2196078, 1, 1,
0.3657404, -0.2373888, 1.736929, 0, 0.2156863, 1, 1,
0.3668445, 1.267732, 0.8325382, 0, 0.2078431, 1, 1,
0.3697201, 0.8738175, 1.557472, 0, 0.2039216, 1, 1,
0.371929, 0.3270533, 0.7996156, 0, 0.1960784, 1, 1,
0.3722123, -0.2147277, 1.462909, 0, 0.1882353, 1, 1,
0.3743288, 0.324036, 1.677004, 0, 0.1843137, 1, 1,
0.3747199, 1.673777, -0.9970753, 0, 0.1764706, 1, 1,
0.3748052, 0.9113845, 1.936809, 0, 0.172549, 1, 1,
0.3833066, 0.5364833, 1.293864, 0, 0.1647059, 1, 1,
0.3868944, 0.5344749, 0.04683491, 0, 0.1607843, 1, 1,
0.3964462, -1.064749, 3.10287, 0, 0.1529412, 1, 1,
0.3965386, 0.4788736, 1.768504, 0, 0.1490196, 1, 1,
0.400762, 0.3419135, 0.2363816, 0, 0.1411765, 1, 1,
0.4023952, 0.8269192, -1.947668, 0, 0.1372549, 1, 1,
0.4030358, -0.6858031, 2.317316, 0, 0.1294118, 1, 1,
0.4058864, 0.7414737, 1.256968, 0, 0.1254902, 1, 1,
0.414071, -0.8739135, 3.107021, 0, 0.1176471, 1, 1,
0.4148313, -0.7449759, 1.845568, 0, 0.1137255, 1, 1,
0.4157311, -0.9735101, 1.613781, 0, 0.1058824, 1, 1,
0.4179878, -1.797251, 2.451477, 0, 0.09803922, 1, 1,
0.4193649, 1.039622, 1.0267, 0, 0.09411765, 1, 1,
0.4212122, -2.317658, 3.087262, 0, 0.08627451, 1, 1,
0.4234751, -0.04434089, 3.007599, 0, 0.08235294, 1, 1,
0.4258532, -0.04430752, 1.535674, 0, 0.07450981, 1, 1,
0.4261677, -0.4439513, 3.433996, 0, 0.07058824, 1, 1,
0.4298381, 1.874634, 0.06763714, 0, 0.0627451, 1, 1,
0.4342326, 0.5057107, 0.1800124, 0, 0.05882353, 1, 1,
0.4346968, 1.358978, 0.4657985, 0, 0.05098039, 1, 1,
0.4359018, 1.168218, 1.233266, 0, 0.04705882, 1, 1,
0.4371323, -0.6980413, 1.810472, 0, 0.03921569, 1, 1,
0.4427694, 0.6406952, 3.468044, 0, 0.03529412, 1, 1,
0.4502727, -1.208646, 2.734228, 0, 0.02745098, 1, 1,
0.450656, 0.2698421, 0.2553574, 0, 0.02352941, 1, 1,
0.4536562, -1.00975, 4.027592, 0, 0.01568628, 1, 1,
0.4548755, 0.6509048, -1.227062, 0, 0.01176471, 1, 1,
0.4566439, 0.9713135, 0.5164047, 0, 0.003921569, 1, 1,
0.4622309, -1.6187, 2.806075, 0.003921569, 0, 1, 1,
0.464287, 0.8594534, -0.1481713, 0.007843138, 0, 1, 1,
0.4647102, -0.8991176, 3.713294, 0.01568628, 0, 1, 1,
0.4687285, 0.1843444, -0.74361, 0.01960784, 0, 1, 1,
0.4699472, -1.457786, 3.55662, 0.02745098, 0, 1, 1,
0.4726123, -0.3843437, 1.637196, 0.03137255, 0, 1, 1,
0.4773435, -0.1840015, 0.1431298, 0.03921569, 0, 1, 1,
0.4777368, 1.717589, -0.3752874, 0.04313726, 0, 1, 1,
0.4787627, -1.205618, 3.814797, 0.05098039, 0, 1, 1,
0.4821376, -0.8043458, 3.835694, 0.05490196, 0, 1, 1,
0.4855153, 0.1583416, -0.5150563, 0.0627451, 0, 1, 1,
0.4866562, 1.291084, -0.8936497, 0.06666667, 0, 1, 1,
0.4881466, -0.4500713, 2.984178, 0.07450981, 0, 1, 1,
0.4896456, 1.74386, 1.224283, 0.07843138, 0, 1, 1,
0.4922129, 1.805746, -1.281055, 0.08627451, 0, 1, 1,
0.4935342, -0.3593184, 1.008648, 0.09019608, 0, 1, 1,
0.4964198, 0.7520961, -0.6452034, 0.09803922, 0, 1, 1,
0.4988791, -0.1486026, 1.206584, 0.1058824, 0, 1, 1,
0.5009834, 0.1191452, -0.5982061, 0.1098039, 0, 1, 1,
0.5023841, 1.667382, 0.8137794, 0.1176471, 0, 1, 1,
0.5034199, -0.1783689, 2.073057, 0.1215686, 0, 1, 1,
0.504006, 1.123915, 0.5231873, 0.1294118, 0, 1, 1,
0.507426, 3.350756, -0.8324062, 0.1333333, 0, 1, 1,
0.5082757, -0.7661006, 1.00026, 0.1411765, 0, 1, 1,
0.5097266, 0.6190122, 1.734876, 0.145098, 0, 1, 1,
0.5121021, -1.478251, 1.722935, 0.1529412, 0, 1, 1,
0.5215717, -0.4143357, 2.016895, 0.1568628, 0, 1, 1,
0.5248684, -1.200983, 4.148825, 0.1647059, 0, 1, 1,
0.5249931, -0.3714631, 2.74359, 0.1686275, 0, 1, 1,
0.5266812, -0.2140826, 2.156796, 0.1764706, 0, 1, 1,
0.5302998, 1.053818, 1.584659, 0.1803922, 0, 1, 1,
0.5311295, 1.036358, 0.2888386, 0.1882353, 0, 1, 1,
0.5365218, 1.380796, -0.8612713, 0.1921569, 0, 1, 1,
0.5376897, -0.166277, 2.797147, 0.2, 0, 1, 1,
0.5404112, -0.08753271, 4.197195, 0.2078431, 0, 1, 1,
0.5410835, -0.4896777, 1.446878, 0.2117647, 0, 1, 1,
0.5454198, -2.070395, 4.153138, 0.2196078, 0, 1, 1,
0.5526945, 0.4382506, 2.857605, 0.2235294, 0, 1, 1,
0.5576624, 0.6193942, 0.6151849, 0.2313726, 0, 1, 1,
0.5601876, -0.3822251, 1.634611, 0.2352941, 0, 1, 1,
0.5659148, -0.6387098, 1.388838, 0.2431373, 0, 1, 1,
0.5713723, -0.5565766, 3.032008, 0.2470588, 0, 1, 1,
0.571965, 0.598271, 0.9138786, 0.254902, 0, 1, 1,
0.5736944, -1.34457, 3.697926, 0.2588235, 0, 1, 1,
0.5767723, 0.1902256, 3.528436, 0.2666667, 0, 1, 1,
0.5768598, -0.64989, 1.958132, 0.2705882, 0, 1, 1,
0.5829166, -0.3507915, 1.304335, 0.2784314, 0, 1, 1,
0.5835884, -0.008575917, 0.8955213, 0.282353, 0, 1, 1,
0.5967599, -0.544526, 2.599893, 0.2901961, 0, 1, 1,
0.6052417, -0.9676765, 3.560143, 0.2941177, 0, 1, 1,
0.6078378, 0.5050405, 1.466134, 0.3019608, 0, 1, 1,
0.6132807, 1.764104, -0.2718527, 0.3098039, 0, 1, 1,
0.6150776, 1.217673, -0.2922669, 0.3137255, 0, 1, 1,
0.6183832, 0.7984498, 0.1189661, 0.3215686, 0, 1, 1,
0.6240125, 1.301515, 0.4668642, 0.3254902, 0, 1, 1,
0.624374, -0.6368994, 2.021442, 0.3333333, 0, 1, 1,
0.6256498, -0.4552351, 3.280287, 0.3372549, 0, 1, 1,
0.6267938, 0.5270851, 1.79831, 0.345098, 0, 1, 1,
0.6285759, -0.04408787, 0.9274849, 0.3490196, 0, 1, 1,
0.6292977, -1.030354, 3.234313, 0.3568628, 0, 1, 1,
0.6388429, -0.251772, 2.359208, 0.3607843, 0, 1, 1,
0.6395476, -1.727024, 1.845127, 0.3686275, 0, 1, 1,
0.6406775, -1.579675, 2.78744, 0.372549, 0, 1, 1,
0.6433153, -1.048578, 3.919696, 0.3803922, 0, 1, 1,
0.6503969, -0.3768488, 3.074156, 0.3843137, 0, 1, 1,
0.6522964, 0.4165707, 0.1142825, 0.3921569, 0, 1, 1,
0.6567292, 0.4398712, 2.870893, 0.3960784, 0, 1, 1,
0.6704465, 0.7125083, -0.2051836, 0.4039216, 0, 1, 1,
0.6707551, -0.9397053, 2.849632, 0.4117647, 0, 1, 1,
0.6709521, -1.58874, 3.693836, 0.4156863, 0, 1, 1,
0.672579, 1.012252, -0.6264806, 0.4235294, 0, 1, 1,
0.6725906, 1.053367, 0.7989638, 0.427451, 0, 1, 1,
0.6743304, 1.922207, 1.016287, 0.4352941, 0, 1, 1,
0.6755371, -0.3917251, 0.6734321, 0.4392157, 0, 1, 1,
0.6799809, -0.08459199, 2.89842, 0.4470588, 0, 1, 1,
0.6830359, 0.3983437, 0.9934156, 0.4509804, 0, 1, 1,
0.683625, -1.119425, 2.458213, 0.4588235, 0, 1, 1,
0.6903867, 0.6385269, 0.864447, 0.4627451, 0, 1, 1,
0.6939473, 0.01593636, 0.4254453, 0.4705882, 0, 1, 1,
0.7028071, 1.386974, -0.3358723, 0.4745098, 0, 1, 1,
0.7067184, -1.485346, 3.52644, 0.4823529, 0, 1, 1,
0.7192405, 0.6974025, 1.606719, 0.4862745, 0, 1, 1,
0.7199136, -1.573855, 2.772511, 0.4941176, 0, 1, 1,
0.7217372, -0.2563346, -0.4439991, 0.5019608, 0, 1, 1,
0.7250935, 2.21352, 0.1115462, 0.5058824, 0, 1, 1,
0.7253087, -0.6687822, 0.9675266, 0.5137255, 0, 1, 1,
0.7264871, 0.2027362, 1.477943, 0.5176471, 0, 1, 1,
0.7277855, -1.981774, 3.32128, 0.5254902, 0, 1, 1,
0.7283123, 1.609581, -0.03119478, 0.5294118, 0, 1, 1,
0.7309224, 0.6235455, -1.176975, 0.5372549, 0, 1, 1,
0.7327908, 0.878855, 1.939185, 0.5411765, 0, 1, 1,
0.7363029, -0.7337511, 2.567597, 0.5490196, 0, 1, 1,
0.7379639, 0.08075088, 2.657549, 0.5529412, 0, 1, 1,
0.7479645, -0.5429258, 2.287181, 0.5607843, 0, 1, 1,
0.7534124, 0.1146994, 1.699902, 0.5647059, 0, 1, 1,
0.7546295, -1.726025, 1.653642, 0.572549, 0, 1, 1,
0.757848, 1.510731, 2.776012, 0.5764706, 0, 1, 1,
0.7587784, 1.326643, -1.133636, 0.5843138, 0, 1, 1,
0.7591477, 1.73486, -0.7324859, 0.5882353, 0, 1, 1,
0.7645995, -1.327609, 2.43091, 0.5960785, 0, 1, 1,
0.7674414, -0.7613079, 1.691288, 0.6039216, 0, 1, 1,
0.7681988, 1.258191, 1.308649, 0.6078432, 0, 1, 1,
0.7690008, -0.2093616, 1.346437, 0.6156863, 0, 1, 1,
0.7720412, 1.371349, 1.317187, 0.6196079, 0, 1, 1,
0.7721996, 0.6423733, 0.4702738, 0.627451, 0, 1, 1,
0.7754814, 0.3674729, 0.5925978, 0.6313726, 0, 1, 1,
0.7755138, -0.1505601, 1.85862, 0.6392157, 0, 1, 1,
0.7769969, -0.8035663, 2.377172, 0.6431373, 0, 1, 1,
0.786217, 1.468105, 1.85461, 0.6509804, 0, 1, 1,
0.7906541, -0.1222892, 3.105145, 0.654902, 0, 1, 1,
0.7906558, 1.093615, 1.81877, 0.6627451, 0, 1, 1,
0.7958421, -1.470664, 3.345003, 0.6666667, 0, 1, 1,
0.795903, 1.076248, 1.312329, 0.6745098, 0, 1, 1,
0.7973427, -1.33115, 0.9943961, 0.6784314, 0, 1, 1,
0.7981177, 0.01056262, -0.1184771, 0.6862745, 0, 1, 1,
0.7984349, 0.5968304, 0.5962781, 0.6901961, 0, 1, 1,
0.8039589, -0.9590623, 2.002565, 0.6980392, 0, 1, 1,
0.8124611, -0.4252714, 2.686399, 0.7058824, 0, 1, 1,
0.8203813, 0.3119853, 0.3399498, 0.7098039, 0, 1, 1,
0.8238264, -0.04986889, 1.404711, 0.7176471, 0, 1, 1,
0.8257559, 0.7443219, 1.188977, 0.7215686, 0, 1, 1,
0.8306354, 0.04041493, 2.927031, 0.7294118, 0, 1, 1,
0.8328971, -0.5154832, 3.492612, 0.7333333, 0, 1, 1,
0.8342679, -0.7491461, 1.856556, 0.7411765, 0, 1, 1,
0.8359664, -0.3473794, -0.4908449, 0.7450981, 0, 1, 1,
0.8457556, -1.177783, 3.372419, 0.7529412, 0, 1, 1,
0.8481055, 0.2448443, 0.7355814, 0.7568628, 0, 1, 1,
0.8505607, 0.7182038, 1.714225, 0.7647059, 0, 1, 1,
0.8543873, -0.2581302, 2.262496, 0.7686275, 0, 1, 1,
0.8547649, -0.340289, 1.489413, 0.7764706, 0, 1, 1,
0.8559687, -0.7853031, 2.24444, 0.7803922, 0, 1, 1,
0.8583154, -0.07216824, 2.963392, 0.7882353, 0, 1, 1,
0.859587, -0.0002463797, 1.167712, 0.7921569, 0, 1, 1,
0.864903, 0.6470553, 1.679356, 0.8, 0, 1, 1,
0.8658888, 1.410952, 1.808507, 0.8078431, 0, 1, 1,
0.8683999, -2.254606, 4.333689, 0.8117647, 0, 1, 1,
0.8694514, 0.02923601, 0.3667887, 0.8196079, 0, 1, 1,
0.8718229, -0.1335807, 0.4329168, 0.8235294, 0, 1, 1,
0.8737398, 1.090487, 1.845674, 0.8313726, 0, 1, 1,
0.8788592, -0.5551606, 3.162468, 0.8352941, 0, 1, 1,
0.8864615, 0.1551092, 1.683123, 0.8431373, 0, 1, 1,
0.8910716, 0.5632592, 1.396928, 0.8470588, 0, 1, 1,
0.8927166, 1.05621, 0.02071088, 0.854902, 0, 1, 1,
0.8941779, -0.03718963, 1.75157, 0.8588235, 0, 1, 1,
0.8949401, 1.889215, -0.6512258, 0.8666667, 0, 1, 1,
0.8956398, 0.1148151, -0.1247931, 0.8705882, 0, 1, 1,
0.9018264, -0.8635945, 3.034378, 0.8784314, 0, 1, 1,
0.903655, 0.1015861, 2.292689, 0.8823529, 0, 1, 1,
0.90478, -0.5001212, 2.471107, 0.8901961, 0, 1, 1,
0.9083865, -0.6893496, 2.453506, 0.8941177, 0, 1, 1,
0.9147726, -0.1142775, 2.031826, 0.9019608, 0, 1, 1,
0.9211059, 0.251372, 1.74268, 0.9098039, 0, 1, 1,
0.9243125, 0.695505, 1.050074, 0.9137255, 0, 1, 1,
0.9260327, -0.2228188, 3.875855, 0.9215686, 0, 1, 1,
0.9266103, -0.4677491, 1.895308, 0.9254902, 0, 1, 1,
0.9302062, 0.2258305, 0.8494115, 0.9333333, 0, 1, 1,
0.930878, 0.1450896, 2.302387, 0.9372549, 0, 1, 1,
0.9319823, -1.039348, 2.14268, 0.945098, 0, 1, 1,
0.9374155, -0.6027323, 3.324794, 0.9490196, 0, 1, 1,
0.9389682, 1.232176, 2.126292, 0.9568627, 0, 1, 1,
0.9397846, 0.01234434, 0.5057077, 0.9607843, 0, 1, 1,
0.9402897, 1.284375, 0.002844276, 0.9686275, 0, 1, 1,
0.9430739, 0.1565515, 0.1855431, 0.972549, 0, 1, 1,
0.9432, -1.356961, 1.99184, 0.9803922, 0, 1, 1,
0.9440999, -0.3065507, 1.818967, 0.9843137, 0, 1, 1,
0.9464599, -0.4042808, 1.014884, 0.9921569, 0, 1, 1,
0.9494412, 1.438169, 1.938535, 0.9960784, 0, 1, 1,
0.9496164, -2.190076, 3.225227, 1, 0, 0.9960784, 1,
0.9503846, 0.9945822, -1.254312, 1, 0, 0.9882353, 1,
0.9534978, 0.4726556, 1.725886, 1, 0, 0.9843137, 1,
0.9540377, -0.2308913, 3.838855, 1, 0, 0.9764706, 1,
0.9549246, -2.167149, 1.98985, 1, 0, 0.972549, 1,
0.9565837, -0.1432463, 1.846456, 1, 0, 0.9647059, 1,
0.9693241, 1.446411, -0.2071797, 1, 0, 0.9607843, 1,
0.9804385, -1.189929, 3.285861, 1, 0, 0.9529412, 1,
0.9848413, -0.9816645, 1.056765, 1, 0, 0.9490196, 1,
0.9892007, -1.282391, 2.377633, 1, 0, 0.9411765, 1,
0.9964235, 0.07228835, 2.395293, 1, 0, 0.9372549, 1,
0.9993386, -0.2333714, 1.760516, 1, 0, 0.9294118, 1,
1.001678, 2.163758, 2.565677, 1, 0, 0.9254902, 1,
1.006626, 1.82088, -0.2533562, 1, 0, 0.9176471, 1,
1.014122, 0.124232, -0.348746, 1, 0, 0.9137255, 1,
1.014184, 0.7069288, 0.9316056, 1, 0, 0.9058824, 1,
1.023103, -1.339575, 2.477038, 1, 0, 0.9019608, 1,
1.027303, -1.297942, 3.262574, 1, 0, 0.8941177, 1,
1.035064, 0.01870375, 0.7426614, 1, 0, 0.8862745, 1,
1.036395, -0.6979344, 1.736636, 1, 0, 0.8823529, 1,
1.041483, 1.810582, 0.8230612, 1, 0, 0.8745098, 1,
1.044543, 1.026817, 0.04582815, 1, 0, 0.8705882, 1,
1.047349, 1.503935, 0.4048643, 1, 0, 0.8627451, 1,
1.051809, -0.8200268, 1.965865, 1, 0, 0.8588235, 1,
1.052404, -0.3546228, 3.231882, 1, 0, 0.8509804, 1,
1.053459, 0.5775467, 1.216397, 1, 0, 0.8470588, 1,
1.054554, -1.437763, 4.360687, 1, 0, 0.8392157, 1,
1.063657, -1.074258, 2.115319, 1, 0, 0.8352941, 1,
1.064177, 1.266445, 0.9032104, 1, 0, 0.827451, 1,
1.065932, 0.5734514, 1.980667, 1, 0, 0.8235294, 1,
1.068989, 2.125156, 0.7767874, 1, 0, 0.8156863, 1,
1.079131, -0.4724346, 2.763246, 1, 0, 0.8117647, 1,
1.080049, 1.289996, 1.375335, 1, 0, 0.8039216, 1,
1.085974, -0.1847518, 2.156527, 1, 0, 0.7960784, 1,
1.088633, -0.1063505, 1.245454, 1, 0, 0.7921569, 1,
1.09391, -0.6700135, 3.340686, 1, 0, 0.7843137, 1,
1.094778, 1.046903, 1.08293, 1, 0, 0.7803922, 1,
1.100757, 0.1698083, 0.3493868, 1, 0, 0.772549, 1,
1.106719, 0.07454678, 1.057943, 1, 0, 0.7686275, 1,
1.106738, -1.600281, 3.405861, 1, 0, 0.7607843, 1,
1.108918, -1.157396, 2.766592, 1, 0, 0.7568628, 1,
1.120968, 0.09527872, 0.2636617, 1, 0, 0.7490196, 1,
1.12295, -0.6274416, 3.134694, 1, 0, 0.7450981, 1,
1.13201, -0.6632373, 3.13331, 1, 0, 0.7372549, 1,
1.149162, -1.084018, 3.271837, 1, 0, 0.7333333, 1,
1.167593, 0.1251543, 3.056848, 1, 0, 0.7254902, 1,
1.170295, -0.07516236, 1.132197, 1, 0, 0.7215686, 1,
1.173782, 0.6004195, 1.879539, 1, 0, 0.7137255, 1,
1.175781, -0.5388126, 1.953563, 1, 0, 0.7098039, 1,
1.180808, 0.6340814, -0.5466914, 1, 0, 0.7019608, 1,
1.190269, -0.9775023, 1.849088, 1, 0, 0.6941177, 1,
1.191033, -0.8039898, 0.6522313, 1, 0, 0.6901961, 1,
1.213124, -0.08929193, 0.9912999, 1, 0, 0.682353, 1,
1.213984, -0.5587812, 3.035518, 1, 0, 0.6784314, 1,
1.216221, -0.4347493, 1.894734, 1, 0, 0.6705883, 1,
1.219535, 0.4517228, 1.586755, 1, 0, 0.6666667, 1,
1.220291, -1.09209, 2.3023, 1, 0, 0.6588235, 1,
1.220846, 0.6962562, 0.7157404, 1, 0, 0.654902, 1,
1.229453, -1.088856, 3.23797, 1, 0, 0.6470588, 1,
1.232807, 0.1333422, 1.664268, 1, 0, 0.6431373, 1,
1.236131, -1.577897, 2.159099, 1, 0, 0.6352941, 1,
1.248068, 0.3175388, 3.488896, 1, 0, 0.6313726, 1,
1.26321, -1.124717, 4.005151, 1, 0, 0.6235294, 1,
1.267719, 1.65709, 2.1972, 1, 0, 0.6196079, 1,
1.269215, -0.9840816, 1.306357, 1, 0, 0.6117647, 1,
1.274451, -1.089163, 3.013684, 1, 0, 0.6078432, 1,
1.275945, 0.2904429, 0.4655707, 1, 0, 0.6, 1,
1.279732, 0.842847, -0.575883, 1, 0, 0.5921569, 1,
1.294266, 0.7536066, -0.2153752, 1, 0, 0.5882353, 1,
1.300499, -0.9304438, 3.496498, 1, 0, 0.5803922, 1,
1.305502, 0.9297798, 0.7041174, 1, 0, 0.5764706, 1,
1.309293, 1.768297, 1.850192, 1, 0, 0.5686275, 1,
1.309513, -0.9464166, 0.006819528, 1, 0, 0.5647059, 1,
1.321047, 0.776346, 2.578442, 1, 0, 0.5568628, 1,
1.323491, 0.6085154, 1.192944, 1, 0, 0.5529412, 1,
1.325315, -0.02540366, -0.4104029, 1, 0, 0.5450981, 1,
1.328057, -0.558193, 1.980795, 1, 0, 0.5411765, 1,
1.350169, -1.649155, 3.344265, 1, 0, 0.5333334, 1,
1.350413, -0.6533878, 3.567584, 1, 0, 0.5294118, 1,
1.353119, 0.05074786, 1.333035, 1, 0, 0.5215687, 1,
1.355123, -1.120073, 2.317257, 1, 0, 0.5176471, 1,
1.358426, 0.5965763, 2.322974, 1, 0, 0.509804, 1,
1.368556, -1.163461, 1.192342, 1, 0, 0.5058824, 1,
1.373568, -0.3006179, 2.415754, 1, 0, 0.4980392, 1,
1.374782, 0.8977672, 0.3629316, 1, 0, 0.4901961, 1,
1.381723, 1.014814, 0.1933122, 1, 0, 0.4862745, 1,
1.385687, 1.244007, 1.069463, 1, 0, 0.4784314, 1,
1.391831, -0.7305335, 1.749373, 1, 0, 0.4745098, 1,
1.401614, -0.1167085, 2.537998, 1, 0, 0.4666667, 1,
1.401974, 0.7843012, 0.05928569, 1, 0, 0.4627451, 1,
1.408054, 0.6194878, -0.2296969, 1, 0, 0.454902, 1,
1.41171, 0.8273569, 1.050969, 1, 0, 0.4509804, 1,
1.430009, 0.08619694, 1.37673, 1, 0, 0.4431373, 1,
1.430626, 2.097061, -1.028309, 1, 0, 0.4392157, 1,
1.4321, -0.7718847, 2.142125, 1, 0, 0.4313726, 1,
1.443788, -1.129861, 3.747092, 1, 0, 0.427451, 1,
1.444715, -1.253566, 1.313845, 1, 0, 0.4196078, 1,
1.462549, 0.9872762, 1.858409, 1, 0, 0.4156863, 1,
1.464993, 0.6865048, 2.930258, 1, 0, 0.4078431, 1,
1.477992, 0.2741774, 1.527792, 1, 0, 0.4039216, 1,
1.486752, -1.511005, 2.431592, 1, 0, 0.3960784, 1,
1.491086, 0.4731132, 0.9647774, 1, 0, 0.3882353, 1,
1.51143, 1.595142, 1.179185, 1, 0, 0.3843137, 1,
1.530401, -2.570399, 3.019971, 1, 0, 0.3764706, 1,
1.533096, 0.203561, 0.5546684, 1, 0, 0.372549, 1,
1.544262, 1.718108, 0.3646943, 1, 0, 0.3647059, 1,
1.552597, 0.1489531, 0.9385511, 1, 0, 0.3607843, 1,
1.555118, 1.457986, 1.055014, 1, 0, 0.3529412, 1,
1.556025, -0.5146034, 0.1909263, 1, 0, 0.3490196, 1,
1.560455, -0.3914386, 0.24417, 1, 0, 0.3411765, 1,
1.575484, 0.9137134, 1.700291, 1, 0, 0.3372549, 1,
1.576182, -0.310761, 2.545446, 1, 0, 0.3294118, 1,
1.595528, -0.2226687, 2.348571, 1, 0, 0.3254902, 1,
1.607418, 1.123584, -0.2161234, 1, 0, 0.3176471, 1,
1.607434, -1.040719, 1.835733, 1, 0, 0.3137255, 1,
1.664002, 0.178822, 1.595217, 1, 0, 0.3058824, 1,
1.668455, -0.3620339, 0.7497602, 1, 0, 0.2980392, 1,
1.676473, 0.1457001, 0.7412025, 1, 0, 0.2941177, 1,
1.687561, 0.09881884, 1.31444, 1, 0, 0.2862745, 1,
1.693749, 1.349232, 0.917646, 1, 0, 0.282353, 1,
1.718849, 0.2986789, 1.21931, 1, 0, 0.2745098, 1,
1.736998, -1.725889, 0.379794, 1, 0, 0.2705882, 1,
1.737005, 2.573349, 0.01325568, 1, 0, 0.2627451, 1,
1.743223, 1.842194, 1.294557, 1, 0, 0.2588235, 1,
1.744239, 0.6363977, 1.368037, 1, 0, 0.2509804, 1,
1.745494, 1.142831, 1.836154, 1, 0, 0.2470588, 1,
1.746113, -2.02368, 3.243421, 1, 0, 0.2392157, 1,
1.74898, 0.5108939, -0.4159581, 1, 0, 0.2352941, 1,
1.760454, 2.045726, -0.7215131, 1, 0, 0.227451, 1,
1.773498, -0.06756788, 0.4929725, 1, 0, 0.2235294, 1,
1.776161, 3.448947, -0.1583123, 1, 0, 0.2156863, 1,
1.78816, -0.4208497, 1.777138, 1, 0, 0.2117647, 1,
1.791117, 0.7145337, 2.360968, 1, 0, 0.2039216, 1,
1.816029, -0.4773889, 2.113157, 1, 0, 0.1960784, 1,
1.826237, -1.018902, 0.3809388, 1, 0, 0.1921569, 1,
1.827248, 1.255156, 0.2843358, 1, 0, 0.1843137, 1,
1.842951, -0.787073, 1.074012, 1, 0, 0.1803922, 1,
1.845617, -0.5635259, 1.644621, 1, 0, 0.172549, 1,
1.856531, -0.02047833, 1.424999, 1, 0, 0.1686275, 1,
1.874282, -1.983214, 2.389073, 1, 0, 0.1607843, 1,
1.874607, -0.6228901, 1.689227, 1, 0, 0.1568628, 1,
1.886464, 0.5541939, 1.332075, 1, 0, 0.1490196, 1,
1.907049, 0.1210557, 2.130459, 1, 0, 0.145098, 1,
1.915727, 0.4110682, 1.479832, 1, 0, 0.1372549, 1,
1.920149, 1.795792, 0.7927719, 1, 0, 0.1333333, 1,
1.929629, 0.6327246, 2.320656, 1, 0, 0.1254902, 1,
1.930036, 0.4540105, 1.856013, 1, 0, 0.1215686, 1,
1.958408, 0.2786882, 1.421041, 1, 0, 0.1137255, 1,
1.966409, -0.9487155, 3.042342, 1, 0, 0.1098039, 1,
1.979229, 0.5145233, 2.406762, 1, 0, 0.1019608, 1,
1.993988, -0.4604277, 1.966977, 1, 0, 0.09411765, 1,
2.037367, -2.072289, 2.383375, 1, 0, 0.09019608, 1,
2.061825, -0.3834208, 0.820136, 1, 0, 0.08235294, 1,
2.189046, -0.435698, -0.1893943, 1, 0, 0.07843138, 1,
2.25961, 0.7184697, 2.140536, 1, 0, 0.07058824, 1,
2.361412, -0.3609426, 1.264058, 1, 0, 0.06666667, 1,
2.368473, -0.4707051, 1.662474, 1, 0, 0.05882353, 1,
2.37623, 1.157945, 1.046772, 1, 0, 0.05490196, 1,
2.395126, -0.4974174, 2.014763, 1, 0, 0.04705882, 1,
2.447302, -0.8192437, 2.435801, 1, 0, 0.04313726, 1,
2.634878, 0.3496207, 0.1745174, 1, 0, 0.03529412, 1,
2.637199, 0.06158118, 3.163076, 1, 0, 0.03137255, 1,
2.675984, 0.8252164, 1.194787, 1, 0, 0.02352941, 1,
2.706711, -0.08383992, 1.432644, 1, 0, 0.01960784, 1,
2.806726, -1.376794, 2.018507, 1, 0, 0.01176471, 1,
2.865001, 1.224463, 1.052682, 1, 0, 0.007843138, 1
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
-0.3004535, -4.566586, -7.454404, 0, -0.5, 0.5, 0.5,
-0.3004535, -4.566586, -7.454404, 1, -0.5, 0.5, 0.5,
-0.3004535, -4.566586, -7.454404, 1, 1.5, 0.5, 0.5,
-0.3004535, -4.566586, -7.454404, 0, 1.5, 0.5, 0.5
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
-4.538997, 0.02204156, -7.454404, 0, -0.5, 0.5, 0.5,
-4.538997, 0.02204156, -7.454404, 1, -0.5, 0.5, 0.5,
-4.538997, 0.02204156, -7.454404, 1, 1.5, 0.5, 0.5,
-4.538997, 0.02204156, -7.454404, 0, 1.5, 0.5, 0.5
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
-4.538997, -4.566586, 0.3074243, 0, -0.5, 0.5, 0.5,
-4.538997, -4.566586, 0.3074243, 1, -0.5, 0.5, 0.5,
-4.538997, -4.566586, 0.3074243, 1, 1.5, 0.5, 0.5,
-4.538997, -4.566586, 0.3074243, 0, 1.5, 0.5, 0.5
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
-3, -3.507672, -5.663213,
2, -3.507672, -5.663213,
-3, -3.507672, -5.663213,
-3, -3.684157, -5.961745,
-2, -3.507672, -5.663213,
-2, -3.684157, -5.961745,
-1, -3.507672, -5.663213,
-1, -3.684157, -5.961745,
0, -3.507672, -5.663213,
0, -3.684157, -5.961745,
1, -3.507672, -5.663213,
1, -3.684157, -5.961745,
2, -3.507672, -5.663213,
2, -3.684157, -5.961745
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
-3, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
-3, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
-3, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
-3, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5,
-2, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
-2, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
-2, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
-2, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5,
-1, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
-1, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
-1, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
-1, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5,
0, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
0, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
0, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
0, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5,
1, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
1, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
1, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
1, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5,
2, -4.037128, -6.558809, 0, -0.5, 0.5, 0.5,
2, -4.037128, -6.558809, 1, -0.5, 0.5, 0.5,
2, -4.037128, -6.558809, 1, 1.5, 0.5, 0.5,
2, -4.037128, -6.558809, 0, 1.5, 0.5, 0.5
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
-3.560871, -3, -5.663213,
-3.560871, 3, -5.663213,
-3.560871, -3, -5.663213,
-3.723892, -3, -5.961745,
-3.560871, -2, -5.663213,
-3.723892, -2, -5.961745,
-3.560871, -1, -5.663213,
-3.723892, -1, -5.961745,
-3.560871, 0, -5.663213,
-3.723892, 0, -5.961745,
-3.560871, 1, -5.663213,
-3.723892, 1, -5.961745,
-3.560871, 2, -5.663213,
-3.723892, 2, -5.961745,
-3.560871, 3, -5.663213,
-3.723892, 3, -5.961745
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
-4.049934, -3, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, -3, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, -3, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, -3, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, -2, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, -2, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, -2, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, -2, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, -1, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, -1, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, -1, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, -1, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, 0, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, 0, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, 0, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, 0, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, 1, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, 1, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, 1, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, 1, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, 2, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, 2, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, 2, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, 2, -6.558809, 0, 1.5, 0.5, 0.5,
-4.049934, 3, -6.558809, 0, -0.5, 0.5, 0.5,
-4.049934, 3, -6.558809, 1, -0.5, 0.5, 0.5,
-4.049934, 3, -6.558809, 1, 1.5, 0.5, 0.5,
-4.049934, 3, -6.558809, 0, 1.5, 0.5, 0.5
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
-3.560871, -3.507672, -4,
-3.560871, -3.507672, 6,
-3.560871, -3.507672, -4,
-3.723892, -3.684157, -4,
-3.560871, -3.507672, -2,
-3.723892, -3.684157, -2,
-3.560871, -3.507672, 0,
-3.723892, -3.684157, 0,
-3.560871, -3.507672, 2,
-3.723892, -3.684157, 2,
-3.560871, -3.507672, 4,
-3.723892, -3.684157, 4,
-3.560871, -3.507672, 6,
-3.723892, -3.684157, 6
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
-4.049934, -4.037128, -4, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, -4, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, -4, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, -4, 0, 1.5, 0.5, 0.5,
-4.049934, -4.037128, -2, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, -2, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, -2, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, -2, 0, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 0, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 0, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 0, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 0, 0, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 2, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 2, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 2, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 2, 0, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 4, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 4, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 4, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 4, 0, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 6, 0, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 6, 1, -0.5, 0.5, 0.5,
-4.049934, -4.037128, 6, 1, 1.5, 0.5, 0.5,
-4.049934, -4.037128, 6, 0, 1.5, 0.5, 0.5
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
-3.560871, -3.507672, -5.663213,
-3.560871, 3.551755, -5.663213,
-3.560871, -3.507672, 6.278062,
-3.560871, 3.551755, 6.278062,
-3.560871, -3.507672, -5.663213,
-3.560871, -3.507672, 6.278062,
-3.560871, 3.551755, -5.663213,
-3.560871, 3.551755, 6.278062,
-3.560871, -3.507672, -5.663213,
2.959964, -3.507672, -5.663213,
-3.560871, -3.507672, 6.278062,
2.959964, -3.507672, 6.278062,
-3.560871, 3.551755, -5.663213,
2.959964, 3.551755, -5.663213,
-3.560871, 3.551755, 6.278062,
2.959964, 3.551755, 6.278062,
2.959964, -3.507672, -5.663213,
2.959964, 3.551755, -5.663213,
2.959964, -3.507672, 6.278062,
2.959964, 3.551755, 6.278062,
2.959964, -3.507672, -5.663213,
2.959964, -3.507672, 6.278062,
2.959964, 3.551755, -5.663213,
2.959964, 3.551755, 6.278062
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
var radius = 8.184911;
var distance = 36.4156;
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
mvMatrix.translate( 0.3004535, -0.02204156, -0.3074243 );
mvMatrix.scale( 1.35714, 1.253599, 0.7411006 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.4156);
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
Bendiocarb<-read.table("Bendiocarb.xyz")
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
-3.465908, -0.4067314, -2.377891, 0, 0, 1, 1, 1,
-3.298015, 0.9715019, 0.351614, 1, 0, 0, 1, 1,
-2.667859, -2.72001, -3.26468, 1, 0, 0, 1, 1,
-2.570842, -0.6865523, -1.693081, 1, 0, 0, 1, 1,
-2.483541, 1.061163, 1.14529, 1, 0, 0, 1, 1,
-2.430151, -0.5777897, -0.4210112, 1, 0, 0, 1, 1,
-2.422805, 0.2209964, -0.3661479, 0, 0, 0, 1, 1,
-2.243639, 0.373953, -2.121809, 0, 0, 0, 1, 1,
-2.218937, 0.9216959, -0.7796515, 0, 0, 0, 1, 1,
-2.197453, 0.882404, -1.405822, 0, 0, 0, 1, 1,
-2.154098, 1.322949, -1.957563, 0, 0, 0, 1, 1,
-2.070657, 0.1742242, -1.410992, 0, 0, 0, 1, 1,
-2.070102, 1.202565, -0.5975897, 0, 0, 0, 1, 1,
-1.994087, 0.5517152, -1.420263, 1, 1, 1, 1, 1,
-1.989887, -0.8287278, -0.1024586, 1, 1, 1, 1, 1,
-1.951144, 1.849959, -0.1778833, 1, 1, 1, 1, 1,
-1.935957, 0.4482385, -0.2844209, 1, 1, 1, 1, 1,
-1.915765, -1.656296, -1.962183, 1, 1, 1, 1, 1,
-1.909095, 0.4417735, -0.1533654, 1, 1, 1, 1, 1,
-1.909008, 0.3046769, -1.428287, 1, 1, 1, 1, 1,
-1.908691, 0.1674757, -2.1343, 1, 1, 1, 1, 1,
-1.902, -0.1509112, -2.465543, 1, 1, 1, 1, 1,
-1.891577, 0.3362849, -0.0429125, 1, 1, 1, 1, 1,
-1.871094, -0.2930876, -1.41007, 1, 1, 1, 1, 1,
-1.851091, -0.4487949, -0.4925952, 1, 1, 1, 1, 1,
-1.822033, -2.094352, -3.487364, 1, 1, 1, 1, 1,
-1.815943, 1.391649, -0.8794582, 1, 1, 1, 1, 1,
-1.812424, 1.25274, -1.217759, 1, 1, 1, 1, 1,
-1.803412, -1.557848, -2.680974, 0, 0, 1, 1, 1,
-1.785928, -0.3608451, -0.02229484, 1, 0, 0, 1, 1,
-1.765249, -1.429939, -2.498117, 1, 0, 0, 1, 1,
-1.741016, -0.9593832, -2.011637, 1, 0, 0, 1, 1,
-1.722246, 0.1599983, -1.59781, 1, 0, 0, 1, 1,
-1.712624, 0.7751841, -1.25141, 1, 0, 0, 1, 1,
-1.712406, 0.2984798, -0.7153369, 0, 0, 0, 1, 1,
-1.711344, 1.137114, -0.6916897, 0, 0, 0, 1, 1,
-1.706153, 0.6199923, -0.5008795, 0, 0, 0, 1, 1,
-1.663681, -1.488465, -2.468104, 0, 0, 0, 1, 1,
-1.644291, -1.81131, -2.562442, 0, 0, 0, 1, 1,
-1.623703, -0.129419, -2.872097, 0, 0, 0, 1, 1,
-1.608518, -0.3355264, -2.204202, 0, 0, 0, 1, 1,
-1.599785, -0.5556921, -0.8547806, 1, 1, 1, 1, 1,
-1.599769, 0.7450437, -1.487224, 1, 1, 1, 1, 1,
-1.590688, 0.2197488, -1.754953, 1, 1, 1, 1, 1,
-1.550505, 0.05066849, -1.536939, 1, 1, 1, 1, 1,
-1.549451, -0.7015572, -2.025247, 1, 1, 1, 1, 1,
-1.539992, 1.120426, -0.2423285, 1, 1, 1, 1, 1,
-1.536965, 0.08112342, -3.479172, 1, 1, 1, 1, 1,
-1.536298, 1.440221, -0.6049165, 1, 1, 1, 1, 1,
-1.526872, 0.5040426, -1.645061, 1, 1, 1, 1, 1,
-1.515612, 0.02173401, -1.929048, 1, 1, 1, 1, 1,
-1.509243, -1.145654, -2.250542, 1, 1, 1, 1, 1,
-1.488714, 1.83052, -2.565667, 1, 1, 1, 1, 1,
-1.483451, 0.1134729, -1.991095, 1, 1, 1, 1, 1,
-1.48208, 1.833736, -1.32121, 1, 1, 1, 1, 1,
-1.480787, -0.5501125, -1.27866, 1, 1, 1, 1, 1,
-1.468971, -2.228675, -4.015229, 0, 0, 1, 1, 1,
-1.461285, -1.400846, -1.432792, 1, 0, 0, 1, 1,
-1.460487, 1.380933, -1.345718, 1, 0, 0, 1, 1,
-1.458467, 0.5765691, -1.894065, 1, 0, 0, 1, 1,
-1.452697, 0.5766762, -3.556257, 1, 0, 0, 1, 1,
-1.451069, -0.2352291, -1.411651, 1, 0, 0, 1, 1,
-1.450694, 0.7044326, -1.576192, 0, 0, 0, 1, 1,
-1.447442, 1.029902, -1.746451, 0, 0, 0, 1, 1,
-1.443499, -0.3895626, -1.493881, 0, 0, 0, 1, 1,
-1.44205, -1.077303, -0.6081929, 0, 0, 0, 1, 1,
-1.437996, 0.6241287, -0.1832642, 0, 0, 0, 1, 1,
-1.419623, 1.070183, -2.142453, 0, 0, 0, 1, 1,
-1.414867, 0.1878812, -2.088896, 0, 0, 0, 1, 1,
-1.411878, 0.2793737, 1.277089, 1, 1, 1, 1, 1,
-1.407032, 0.121645, -1.287636, 1, 1, 1, 1, 1,
-1.399973, -1.132234, -1.303343, 1, 1, 1, 1, 1,
-1.385, 0.4788597, -1.66383, 1, 1, 1, 1, 1,
-1.384899, 1.677637, -1.069647, 1, 1, 1, 1, 1,
-1.378099, -0.4126392, -1.612952, 1, 1, 1, 1, 1,
-1.376619, -0.03550478, -0.2039932, 1, 1, 1, 1, 1,
-1.3652, 0.9179266, -0.7502261, 1, 1, 1, 1, 1,
-1.348375, 2.089244, -0.1913127, 1, 1, 1, 1, 1,
-1.347409, -2.76434, -2.518408, 1, 1, 1, 1, 1,
-1.328851, -1.415565, -2.045936, 1, 1, 1, 1, 1,
-1.328438, -1.229224, -2.412991, 1, 1, 1, 1, 1,
-1.316267, -0.7084056, -2.262395, 1, 1, 1, 1, 1,
-1.312406, -0.7708468, -2.587219, 1, 1, 1, 1, 1,
-1.310389, -0.3434938, -2.864465, 1, 1, 1, 1, 1,
-1.306068, -0.6266896, -1.708291, 0, 0, 1, 1, 1,
-1.286083, 1.269365, 0.8292582, 1, 0, 0, 1, 1,
-1.280537, -0.4912033, -2.20216, 1, 0, 0, 1, 1,
-1.274917, 0.2260448, -0.4488094, 1, 0, 0, 1, 1,
-1.271612, -0.352223, -1.370939, 1, 0, 0, 1, 1,
-1.270561, -1.391688, -2.013974, 1, 0, 0, 1, 1,
-1.268422, -0.006165728, -2.133866, 0, 0, 0, 1, 1,
-1.262902, 0.1990969, -0.2623185, 0, 0, 0, 1, 1,
-1.249654, -0.4778225, -0.1305882, 0, 0, 0, 1, 1,
-1.246843, -1.215004, -0.8383429, 0, 0, 0, 1, 1,
-1.239511, -1.108364, -2.205806, 0, 0, 0, 1, 1,
-1.228847, 0.716386, -1.390444, 0, 0, 0, 1, 1,
-1.227725, 1.027094, -3.053551, 0, 0, 0, 1, 1,
-1.22369, -1.459492, -1.878542, 1, 1, 1, 1, 1,
-1.215464, 1.06951, -1.835992, 1, 1, 1, 1, 1,
-1.209782, -0.09937465, -0.9544921, 1, 1, 1, 1, 1,
-1.206107, 1.720791, -1.03969, 1, 1, 1, 1, 1,
-1.199522, 0.4053207, -2.120821, 1, 1, 1, 1, 1,
-1.189031, 1.561381, 1.000584, 1, 1, 1, 1, 1,
-1.183424, 0.9876521, -0.6105437, 1, 1, 1, 1, 1,
-1.183309, -0.4920619, -0.5212725, 1, 1, 1, 1, 1,
-1.182407, -1.73377, -3.30411, 1, 1, 1, 1, 1,
-1.170929, -0.4697796, -0.7750536, 1, 1, 1, 1, 1,
-1.163321, -0.3797772, -1.601649, 1, 1, 1, 1, 1,
-1.156838, -1.903038, -3.646288, 1, 1, 1, 1, 1,
-1.156268, 0.3669749, -1.167551, 1, 1, 1, 1, 1,
-1.146398, -0.01072109, -0.6669879, 1, 1, 1, 1, 1,
-1.141227, -0.8636271, -1.43488, 1, 1, 1, 1, 1,
-1.138419, -0.270308, -2.567997, 0, 0, 1, 1, 1,
-1.138303, 0.9171939, -0.7797285, 1, 0, 0, 1, 1,
-1.137843, -0.7602589, -1.285161, 1, 0, 0, 1, 1,
-1.130955, -0.2634822, -3.00703, 1, 0, 0, 1, 1,
-1.13007, 0.2521952, -1.726875, 1, 0, 0, 1, 1,
-1.128342, 0.1934503, -1.485339, 1, 0, 0, 1, 1,
-1.123452, 0.7162254, -1.233432, 0, 0, 0, 1, 1,
-1.121191, -0.7125605, -2.824674, 0, 0, 0, 1, 1,
-1.114733, 0.1119464, -0.4277499, 0, 0, 0, 1, 1,
-1.112981, -0.6765522, -1.454071, 0, 0, 0, 1, 1,
-1.106081, -0.5737967, -1.054545, 0, 0, 0, 1, 1,
-1.10138, -1.431053, -2.855543, 0, 0, 0, 1, 1,
-1.099493, -0.7096238, -1.986532, 0, 0, 0, 1, 1,
-1.09612, -0.1450594, -0.05470841, 1, 1, 1, 1, 1,
-1.093739, -0.6334666, -2.178525, 1, 1, 1, 1, 1,
-1.070716, 0.2594338, -1.813992, 1, 1, 1, 1, 1,
-1.065673, 0.5635006, -1.673107, 1, 1, 1, 1, 1,
-1.05777, 0.7893463, -0.4762612, 1, 1, 1, 1, 1,
-1.057738, 0.2613264, -1.498819, 1, 1, 1, 1, 1,
-1.052924, -0.7292821, -2.772901, 1, 1, 1, 1, 1,
-1.05278, -0.4559857, -2.316952, 1, 1, 1, 1, 1,
-1.048323, 0.4930505, -1.000683, 1, 1, 1, 1, 1,
-1.040702, 0.03542258, -0.8714541, 1, 1, 1, 1, 1,
-1.035905, 0.1850931, -1.9197, 1, 1, 1, 1, 1,
-1.033756, -0.9944308, -3.414949, 1, 1, 1, 1, 1,
-1.032582, 0.09383716, -1.819724, 1, 1, 1, 1, 1,
-1.030424, 0.07938927, -0.9783925, 1, 1, 1, 1, 1,
-1.027449, 0.04923491, -3.899869, 1, 1, 1, 1, 1,
-1.020116, 0.088388, -0.1810672, 0, 0, 1, 1, 1,
-1.01439, 0.4552367, -1.874151, 1, 0, 0, 1, 1,
-1.003269, 1.004996, -0.5330983, 1, 0, 0, 1, 1,
-1.000305, 0.8825601, -0.4661034, 1, 0, 0, 1, 1,
-0.9972501, 0.06564921, -0.3652194, 1, 0, 0, 1, 1,
-0.9941257, -0.7685039, -1.142496, 1, 0, 0, 1, 1,
-0.9836354, 0.5864583, -0.5717809, 0, 0, 0, 1, 1,
-0.9829221, 0.4547166, -1.503176, 0, 0, 0, 1, 1,
-0.9815037, 0.02988901, -0.5601358, 0, 0, 0, 1, 1,
-0.9813099, -0.6735607, -1.739705, 0, 0, 0, 1, 1,
-0.9706848, 0.05503516, -0.5120901, 0, 0, 0, 1, 1,
-0.9603587, -0.3333886, -0.83812, 0, 0, 0, 1, 1,
-0.9599104, -0.4196231, -0.4555749, 0, 0, 0, 1, 1,
-0.9584416, -0.4695191, -2.152179, 1, 1, 1, 1, 1,
-0.9580655, 0.6605928, -0.7296435, 1, 1, 1, 1, 1,
-0.9530104, -0.536315, -1.79124, 1, 1, 1, 1, 1,
-0.9504887, 0.3148739, -4.212693, 1, 1, 1, 1, 1,
-0.9405899, 0.4748588, -1.06705, 1, 1, 1, 1, 1,
-0.939319, -0.6989222, -1.88134, 1, 1, 1, 1, 1,
-0.9380359, 0.3443047, -0.1041471, 1, 1, 1, 1, 1,
-0.924731, -0.02517472, -1.454987, 1, 1, 1, 1, 1,
-0.9241105, -0.03054569, -1.494231, 1, 1, 1, 1, 1,
-0.915743, 1.534297, -1.045123, 1, 1, 1, 1, 1,
-0.9129069, -0.1492706, -1.451612, 1, 1, 1, 1, 1,
-0.9108346, -1.534999, -3.657072, 1, 1, 1, 1, 1,
-0.9088581, -1.012029, -2.585438, 1, 1, 1, 1, 1,
-0.9068702, -0.1445432, -1.049035, 1, 1, 1, 1, 1,
-0.9052929, -0.9232229, -0.2202113, 1, 1, 1, 1, 1,
-0.8986616, -1.141685, -1.361371, 0, 0, 1, 1, 1,
-0.8973268, -0.2754949, -2.417439, 1, 0, 0, 1, 1,
-0.8961034, -0.9115854, -1.923306, 1, 0, 0, 1, 1,
-0.8873926, 0.6925178, -0.9002991, 1, 0, 0, 1, 1,
-0.8848996, -0.675539, -0.3601633, 1, 0, 0, 1, 1,
-0.8835125, 0.4476104, 0.5340609, 1, 0, 0, 1, 1,
-0.8720903, -0.1114533, -1.12377, 0, 0, 0, 1, 1,
-0.8645959, -0.6802123, -3.374753, 0, 0, 0, 1, 1,
-0.8644211, -0.1108283, -0.7927462, 0, 0, 0, 1, 1,
-0.8609859, 1.269999, -0.9085789, 0, 0, 0, 1, 1,
-0.8607562, -1.232407, -3.162165, 0, 0, 0, 1, 1,
-0.8602313, 0.8902181, -0.6049808, 0, 0, 0, 1, 1,
-0.8554323, -0.1275431, -1.595707, 0, 0, 0, 1, 1,
-0.8455842, 0.717033, -0.4091253, 1, 1, 1, 1, 1,
-0.8418593, -1.23141, -2.24037, 1, 1, 1, 1, 1,
-0.8401723, 0.8846619, -0.7924709, 1, 1, 1, 1, 1,
-0.8390223, -1.791121, -2.785798, 1, 1, 1, 1, 1,
-0.8371994, 1.432961, -0.03584361, 1, 1, 1, 1, 1,
-0.8341023, 0.6203272, -0.4376827, 1, 1, 1, 1, 1,
-0.8317474, 0.2069256, -0.8753429, 1, 1, 1, 1, 1,
-0.8294382, -0.09374072, -2.0233, 1, 1, 1, 1, 1,
-0.8168561, 0.02987152, -2.910721, 1, 1, 1, 1, 1,
-0.806801, -0.3832461, -1.89421, 1, 1, 1, 1, 1,
-0.8036626, 0.3192458, -1.834798, 1, 1, 1, 1, 1,
-0.803497, -0.5913559, -1.418569, 1, 1, 1, 1, 1,
-0.7992206, 1.053003, -2.276931, 1, 1, 1, 1, 1,
-0.7915398, 1.453978, -1.411393, 1, 1, 1, 1, 1,
-0.7885635, -0.9794584, -1.511253, 1, 1, 1, 1, 1,
-0.7880273, -0.2121927, -2.664947, 0, 0, 1, 1, 1,
-0.7869499, 2.205984, 0.2478698, 1, 0, 0, 1, 1,
-0.7867203, 0.9429217, 0.6001446, 1, 0, 0, 1, 1,
-0.7861888, 1.220505, 0.6365828, 1, 0, 0, 1, 1,
-0.7767097, -0.7294347, -3.132623, 1, 0, 0, 1, 1,
-0.7731324, 1.007406, -0.1775689, 1, 0, 0, 1, 1,
-0.7625619, 0.09111907, 0.04502695, 0, 0, 0, 1, 1,
-0.7580922, -0.7215697, -2.801071, 0, 0, 0, 1, 1,
-0.7578728, -0.6975566, -2.814982, 0, 0, 0, 1, 1,
-0.7509819, 0.3483068, 1.025706, 0, 0, 0, 1, 1,
-0.7506364, 0.01272537, -1.223503, 0, 0, 0, 1, 1,
-0.7498137, 0.005454717, -1.868896, 0, 0, 0, 1, 1,
-0.7451636, -1.868695, -3.682571, 0, 0, 0, 1, 1,
-0.7451241, -0.2517681, -3.132506, 1, 1, 1, 1, 1,
-0.7439522, -0.521723, -3.781232, 1, 1, 1, 1, 1,
-0.7395848, -1.249777, 0.04755792, 1, 1, 1, 1, 1,
-0.7298666, 0.1704034, -0.8424528, 1, 1, 1, 1, 1,
-0.7281235, 0.2572466, 0.43061, 1, 1, 1, 1, 1,
-0.7255791, -0.379487, -3.276164, 1, 1, 1, 1, 1,
-0.7251657, 2.610882, -0.2238355, 1, 1, 1, 1, 1,
-0.7197323, -0.8127524, -2.489655, 1, 1, 1, 1, 1,
-0.7186708, 0.1393597, -1.606851, 1, 1, 1, 1, 1,
-0.7185392, -0.8885244, -2.743356, 1, 1, 1, 1, 1,
-0.7157627, 0.6163039, 0.7318239, 1, 1, 1, 1, 1,
-0.7125283, 2.380442, -1.458324, 1, 1, 1, 1, 1,
-0.7114689, 2.017903, 0.7510709, 1, 1, 1, 1, 1,
-0.7084996, -1.918224, -3.635628, 1, 1, 1, 1, 1,
-0.7053375, 0.04848838, -0.2517562, 1, 1, 1, 1, 1,
-0.6989786, 0.4708548, -3.290902, 0, 0, 1, 1, 1,
-0.6948138, 0.3312666, -2.45388, 1, 0, 0, 1, 1,
-0.6940882, 0.2383743, -1.700408, 1, 0, 0, 1, 1,
-0.6932383, -1.11507, -1.360861, 1, 0, 0, 1, 1,
-0.6857951, -0.2152291, -1.846669, 1, 0, 0, 1, 1,
-0.684958, -0.3892792, -0.929231, 1, 0, 0, 1, 1,
-0.6793852, 1.536042, -0.09760036, 0, 0, 0, 1, 1,
-0.6791006, 0.5557137, -0.3794598, 0, 0, 0, 1, 1,
-0.6765547, -1.504694, -2.33762, 0, 0, 0, 1, 1,
-0.6755323, -0.680175, -2.483701, 0, 0, 0, 1, 1,
-0.6732524, 0.3735717, 0.2029262, 0, 0, 0, 1, 1,
-0.6711247, 0.1771055, -1.341552, 0, 0, 0, 1, 1,
-0.6665055, -0.111509, -0.9935424, 0, 0, 0, 1, 1,
-0.6611339, 0.8514942, -0.2793103, 1, 1, 1, 1, 1,
-0.6522384, 0.6254453, -1.890983, 1, 1, 1, 1, 1,
-0.651027, 1.758665, -0.2183869, 1, 1, 1, 1, 1,
-0.65007, 0.06247438, -0.2818014, 1, 1, 1, 1, 1,
-0.649618, 2.142463, 0.7123149, 1, 1, 1, 1, 1,
-0.6456708, 0.4968363, -1.65997, 1, 1, 1, 1, 1,
-0.6404658, 0.9932755, 1.506647, 1, 1, 1, 1, 1,
-0.6389759, 0.585641, -1.400461, 1, 1, 1, 1, 1,
-0.6389057, 0.4383061, -3.124849, 1, 1, 1, 1, 1,
-0.626596, 2.790061, -1.508959, 1, 1, 1, 1, 1,
-0.626152, -1.505667, -3.320457, 1, 1, 1, 1, 1,
-0.6222125, 0.7931401, -0.8469686, 1, 1, 1, 1, 1,
-0.6215035, -0.2027494, 0.2336279, 1, 1, 1, 1, 1,
-0.6147052, 0.0276721, -1.270344, 1, 1, 1, 1, 1,
-0.6131564, 0.3920005, -0.7703561, 1, 1, 1, 1, 1,
-0.602949, 0.5357472, -0.5323179, 0, 0, 1, 1, 1,
-0.6016029, -0.2147306, -2.688014, 1, 0, 0, 1, 1,
-0.6008859, 1.588596, 1.154074, 1, 0, 0, 1, 1,
-0.6005576, -0.7018371, -2.891789, 1, 0, 0, 1, 1,
-0.5981719, -0.03857152, -1.92101, 1, 0, 0, 1, 1,
-0.5945362, -2.366428, -4.815147, 1, 0, 0, 1, 1,
-0.5868397, -0.4073174, -2.130034, 0, 0, 0, 1, 1,
-0.5850739, -0.6607952, -2.322496, 0, 0, 0, 1, 1,
-0.5803603, -0.0635976, -2.309997, 0, 0, 0, 1, 1,
-0.5803006, 0.5003243, -0.9544732, 0, 0, 0, 1, 1,
-0.5772161, -1.054577, -5.093644, 0, 0, 0, 1, 1,
-0.5757478, 0.1174974, -0.4998076, 0, 0, 0, 1, 1,
-0.5740923, -0.1504367, -2.925159, 0, 0, 0, 1, 1,
-0.5658563, -0.8107143, -1.132494, 1, 1, 1, 1, 1,
-0.5542969, 1.317333, 0.2986049, 1, 1, 1, 1, 1,
-0.5501757, -1.245543, -3.563877, 1, 1, 1, 1, 1,
-0.5494179, -0.8423817, -3.591267, 1, 1, 1, 1, 1,
-0.5466603, -0.8302717, -0.7454989, 1, 1, 1, 1, 1,
-0.5456544, -0.01008596, -2.481047, 1, 1, 1, 1, 1,
-0.5409895, -1.662458, -4.596029, 1, 1, 1, 1, 1,
-0.5394982, -0.6994851, -3.435712, 1, 1, 1, 1, 1,
-0.5376792, -0.5386029, -2.86254, 1, 1, 1, 1, 1,
-0.5372999, 0.5101095, -2.71671, 1, 1, 1, 1, 1,
-0.5318072, 0.001090058, -2.479063, 1, 1, 1, 1, 1,
-0.531243, -1.032697, -2.175119, 1, 1, 1, 1, 1,
-0.5281578, -0.0599263, -0.4270748, 1, 1, 1, 1, 1,
-0.52716, -1.051528, -1.925079, 1, 1, 1, 1, 1,
-0.5262272, 0.5542709, 0.5715432, 1, 1, 1, 1, 1,
-0.5252927, 0.2362483, 0.3735229, 0, 0, 1, 1, 1,
-0.5218675, -0.7886672, -3.117751, 1, 0, 0, 1, 1,
-0.5205814, -0.8021823, -2.287304, 1, 0, 0, 1, 1,
-0.5165604, 0.3876693, -0.4848036, 1, 0, 0, 1, 1,
-0.5165115, 0.9447692, 1.445917, 1, 0, 0, 1, 1,
-0.5153309, 1.260536, 0.4844069, 1, 0, 0, 1, 1,
-0.5141352, 0.3970483, -2.329571, 0, 0, 0, 1, 1,
-0.513095, -0.3928072, -4.38607, 0, 0, 0, 1, 1,
-0.5102899, -0.7868834, -2.40506, 0, 0, 0, 1, 1,
-0.5089725, -0.6405283, -1.783812, 0, 0, 0, 1, 1,
-0.5088398, 0.2601388, -1.140369, 0, 0, 0, 1, 1,
-0.5087445, -0.4194988, -4.360831, 0, 0, 0, 1, 1,
-0.5076166, -0.4014472, -1.625712, 0, 0, 0, 1, 1,
-0.507275, -0.9160831, -2.569686, 1, 1, 1, 1, 1,
-0.5065817, -0.9728518, -2.258504, 1, 1, 1, 1, 1,
-0.5026169, -0.4967377, -2.123422, 1, 1, 1, 1, 1,
-0.5019825, -2.863605, -1.704594, 1, 1, 1, 1, 1,
-0.5007647, -0.1794611, -2.451805, 1, 1, 1, 1, 1,
-0.4941224, -0.4852708, -1.299788, 1, 1, 1, 1, 1,
-0.490422, -0.5016497, -2.249145, 1, 1, 1, 1, 1,
-0.4898915, 0.6356306, -0.7001207, 1, 1, 1, 1, 1,
-0.4864527, -0.2281115, -1.806822, 1, 1, 1, 1, 1,
-0.480897, 2.184382, -0.64623, 1, 1, 1, 1, 1,
-0.4780786, -0.2817296, -1.172483, 1, 1, 1, 1, 1,
-0.4747645, 2.564174, -0.3044915, 1, 1, 1, 1, 1,
-0.4746301, 1.907955, -0.05958246, 1, 1, 1, 1, 1,
-0.4736317, 1.068241, -1.482247, 1, 1, 1, 1, 1,
-0.4731102, -0.1759509, -2.491524, 1, 1, 1, 1, 1,
-0.4712204, 0.3255906, 0.2762133, 0, 0, 1, 1, 1,
-0.4677393, 1.140956, 1.768802, 1, 0, 0, 1, 1,
-0.4673355, 0.8892935, -1.423424, 1, 0, 0, 1, 1,
-0.4665467, -0.5650465, -2.016949, 1, 0, 0, 1, 1,
-0.4664541, 0.7833486, -0.219823, 1, 0, 0, 1, 1,
-0.4638858, -1.465726, -3.293552, 1, 0, 0, 1, 1,
-0.4607467, 0.2464851, 0.389834, 0, 0, 0, 1, 1,
-0.4605078, 0.8288114, 0.6540316, 0, 0, 0, 1, 1,
-0.4560143, 0.2234044, -0.02654202, 0, 0, 0, 1, 1,
-0.4495913, -0.3834364, -2.096714, 0, 0, 0, 1, 1,
-0.4476885, -1.803582, -2.433897, 0, 0, 0, 1, 1,
-0.4449355, 0.7597679, -2.884419, 0, 0, 0, 1, 1,
-0.4358614, -1.475999, -1.308823, 0, 0, 0, 1, 1,
-0.4312421, 0.5160342, 0.7255256, 1, 1, 1, 1, 1,
-0.4280853, 0.6860226, 0.9095824, 1, 1, 1, 1, 1,
-0.4268746, -0.5718402, -3.034828, 1, 1, 1, 1, 1,
-0.4239902, -0.1838253, -0.7537448, 1, 1, 1, 1, 1,
-0.4228677, 0.943252, -2.810645, 1, 1, 1, 1, 1,
-0.4184676, -0.118148, -1.185869, 1, 1, 1, 1, 1,
-0.4179421, -0.06491847, -1.791979, 1, 1, 1, 1, 1,
-0.4153145, 1.636984, -1.963224, 1, 1, 1, 1, 1,
-0.4148133, 0.04076992, -1.883308, 1, 1, 1, 1, 1,
-0.4136104, -0.8848548, -2.055828, 1, 1, 1, 1, 1,
-0.4096251, -0.1161907, -0.8168572, 1, 1, 1, 1, 1,
-0.4087185, -1.215389, -3.092267, 1, 1, 1, 1, 1,
-0.4067887, -0.5772803, -2.283043, 1, 1, 1, 1, 1,
-0.4066894, 0.6629055, -0.341393, 1, 1, 1, 1, 1,
-0.4032586, -1.111436, -2.633714, 1, 1, 1, 1, 1,
-0.4025896, 1.051276, 0.4330721, 0, 0, 1, 1, 1,
-0.3991382, -0.06783185, -1.210517, 1, 0, 0, 1, 1,
-0.3929243, 2.314949, -0.2987701, 1, 0, 0, 1, 1,
-0.3907906, -1.142041, -3.03448, 1, 0, 0, 1, 1,
-0.3793604, 0.284921, -1.319497, 1, 0, 0, 1, 1,
-0.3759651, 0.271206, -1.851727, 1, 0, 0, 1, 1,
-0.3728531, 0.9503259, 0.09853395, 0, 0, 0, 1, 1,
-0.3706073, -2.097129, -1.193955, 0, 0, 0, 1, 1,
-0.3667904, 0.9226646, -2.218223, 0, 0, 0, 1, 1,
-0.3565828, -0.3588534, -1.120689, 0, 0, 0, 1, 1,
-0.3551362, 0.4583177, -0.2928462, 0, 0, 0, 1, 1,
-0.3521631, 1.93425, -0.3682778, 0, 0, 0, 1, 1,
-0.349176, 2.087124, 0.4332874, 0, 0, 0, 1, 1,
-0.3449879, 2.393906, 2.306864, 1, 1, 1, 1, 1,
-0.342573, -0.3580965, -4.466033, 1, 1, 1, 1, 1,
-0.3381231, -0.1511534, -2.107425, 1, 1, 1, 1, 1,
-0.3366148, -1.5694, -3.35108, 1, 1, 1, 1, 1,
-0.3336597, -0.8210374, -3.810395, 1, 1, 1, 1, 1,
-0.3320746, -0.7972442, -3.320998, 1, 1, 1, 1, 1,
-0.325999, -0.5189591, -1.43971, 1, 1, 1, 1, 1,
-0.3252955, 0.1722194, -1.512501, 1, 1, 1, 1, 1,
-0.3235855, 1.178311, 0.4775851, 1, 1, 1, 1, 1,
-0.3200514, -0.9307666, -4.093144, 1, 1, 1, 1, 1,
-0.3079062, -0.03009669, -0.4569878, 1, 1, 1, 1, 1,
-0.3050188, -1.173552, -4.093591, 1, 1, 1, 1, 1,
-0.2963454, 0.2336517, -0.231508, 1, 1, 1, 1, 1,
-0.2961521, -0.9126531, -0.7890258, 1, 1, 1, 1, 1,
-0.2929889, -0.8468965, -3.174923, 1, 1, 1, 1, 1,
-0.2894191, -0.533426, -2.575989, 0, 0, 1, 1, 1,
-0.2870615, -1.280679, -4.728296, 1, 0, 0, 1, 1,
-0.2856998, -0.5298982, -2.691216, 1, 0, 0, 1, 1,
-0.2846804, -0.1325452, -2.925143, 1, 0, 0, 1, 1,
-0.281032, -0.3847774, -1.302876, 1, 0, 0, 1, 1,
-0.2784767, 0.002786121, -3.804621, 1, 0, 0, 1, 1,
-0.2762118, -0.3956105, -1.941438, 0, 0, 0, 1, 1,
-0.2722439, 0.7950087, 0.8154709, 0, 0, 0, 1, 1,
-0.2719977, 1.20726, -0.03498614, 0, 0, 0, 1, 1,
-0.2700918, -0.8388023, -3.083655, 0, 0, 0, 1, 1,
-0.2700659, -0.9125836, -2.212564, 0, 0, 0, 1, 1,
-0.2619947, 0.6467335, -1.794757, 0, 0, 0, 1, 1,
-0.2609581, -0.5604651, -1.995506, 0, 0, 0, 1, 1,
-0.2601392, 0.005028191, -0.7741154, 1, 1, 1, 1, 1,
-0.2576145, -0.3569106, -2.209578, 1, 1, 1, 1, 1,
-0.2552617, 1.106938, 0.389018, 1, 1, 1, 1, 1,
-0.252463, -2.233606, -3.568314, 1, 1, 1, 1, 1,
-0.2497746, 0.6640529, 0.2352831, 1, 1, 1, 1, 1,
-0.2489879, 0.8619067, 0.2417961, 1, 1, 1, 1, 1,
-0.248529, 0.8915237, 0.2632601, 1, 1, 1, 1, 1,
-0.2462719, -0.4404089, -2.808489, 1, 1, 1, 1, 1,
-0.2412239, -0.7642228, -3.832446, 1, 1, 1, 1, 1,
-0.2124253, -0.3567325, -3.155762, 1, 1, 1, 1, 1,
-0.2121629, -1.696774, -3.689422, 1, 1, 1, 1, 1,
-0.2069886, 0.04849726, -2.116102, 1, 1, 1, 1, 1,
-0.2043969, -0.8793908, -2.65478, 1, 1, 1, 1, 1,
-0.1967662, 0.09688216, -0.503208, 1, 1, 1, 1, 1,
-0.1956602, 0.3729624, 0.06109535, 1, 1, 1, 1, 1,
-0.1949632, 1.665537, -0.8479242, 0, 0, 1, 1, 1,
-0.193592, -0.7166473, -3.747389, 1, 0, 0, 1, 1,
-0.1913062, 0.9477242, 1.861058, 1, 0, 0, 1, 1,
-0.1892698, -1.633309, -2.937146, 1, 0, 0, 1, 1,
-0.1829482, -0.8541936, -2.222887, 1, 0, 0, 1, 1,
-0.1812227, 0.4742961, -0.5550004, 1, 0, 0, 1, 1,
-0.1810709, 0.3190176, 0.3282116, 0, 0, 0, 1, 1,
-0.1793778, -0.19728, -1.527678, 0, 0, 0, 1, 1,
-0.1788932, 0.06092309, -1.770301, 0, 0, 0, 1, 1,
-0.1774024, -0.201485, -1.380485, 0, 0, 0, 1, 1,
-0.1703095, -1.121225, -2.21957, 0, 0, 0, 1, 1,
-0.1689572, 0.4149985, -0.3448418, 0, 0, 0, 1, 1,
-0.167251, 0.7741839, 0.4486039, 0, 0, 0, 1, 1,
-0.1661932, 1.671529, -0.7225389, 1, 1, 1, 1, 1,
-0.1646995, 0.9234961, -0.4587865, 1, 1, 1, 1, 1,
-0.1550888, 0.6757914, 0.6192265, 1, 1, 1, 1, 1,
-0.1550826, 0.7786193, -0.5714996, 1, 1, 1, 1, 1,
-0.15431, -0.3858183, -2.183999, 1, 1, 1, 1, 1,
-0.153614, 0.6194761, -0.3991895, 1, 1, 1, 1, 1,
-0.1513754, -0.958338, -2.572854, 1, 1, 1, 1, 1,
-0.1500319, -0.1832727, -0.9709628, 1, 1, 1, 1, 1,
-0.1475744, 0.6207191, 0.2207428, 1, 1, 1, 1, 1,
-0.1441265, -1.307777, -2.800534, 1, 1, 1, 1, 1,
-0.1426967, -0.3066003, -3.709585, 1, 1, 1, 1, 1,
-0.1403288, -0.8704469, -4.656328, 1, 1, 1, 1, 1,
-0.1379486, -0.9329195, -1.459478, 1, 1, 1, 1, 1,
-0.1354271, 1.395496, -1.723979, 1, 1, 1, 1, 1,
-0.1346782, 0.4391836, -1.732548, 1, 1, 1, 1, 1,
-0.1320595, 0.448866, -1.853007, 0, 0, 1, 1, 1,
-0.129859, 0.07705673, 0.171221, 1, 0, 0, 1, 1,
-0.1271216, 1.052955, -1.520044, 1, 0, 0, 1, 1,
-0.1262453, 0.4498723, 0.5124418, 1, 0, 0, 1, 1,
-0.1256738, 0.4700567, 0.4982084, 1, 0, 0, 1, 1,
-0.1255323, 2.818732, -0.213069, 1, 0, 0, 1, 1,
-0.1253284, -0.165055, -0.5283802, 0, 0, 0, 1, 1,
-0.1226562, -1.244696, -4.462103, 0, 0, 0, 1, 1,
-0.1192499, -1.422091, -3.283503, 0, 0, 0, 1, 1,
-0.1182242, 0.6509597, -1.061514, 0, 0, 0, 1, 1,
-0.1151729, -1.490998, -2.948309, 0, 0, 0, 1, 1,
-0.1130968, -0.2416108, -2.290887, 0, 0, 0, 1, 1,
-0.1128854, -0.8394611, -4.292135, 0, 0, 0, 1, 1,
-0.1067853, 0.2235468, -1.128842, 1, 1, 1, 1, 1,
-0.09797546, 1.34412, -1.843527, 1, 1, 1, 1, 1,
-0.09722435, -1.397315, -1.114623, 1, 1, 1, 1, 1,
-0.09157533, 0.8407334, -1.619253, 1, 1, 1, 1, 1,
-0.08780514, -0.3557807, -3.38585, 1, 1, 1, 1, 1,
-0.08707836, -0.82996, -2.57994, 1, 1, 1, 1, 1,
-0.08324861, 0.4322827, -1.817646, 1, 1, 1, 1, 1,
-0.08229704, 1.227225, 0.5284727, 1, 1, 1, 1, 1,
-0.0810542, 0.02316396, -0.6914135, 1, 1, 1, 1, 1,
-0.07202758, -1.402842, -4.090207, 1, 1, 1, 1, 1,
-0.0716194, -0.6461031, -3.877887, 1, 1, 1, 1, 1,
-0.07062262, -0.2791381, -4.606514, 1, 1, 1, 1, 1,
-0.06948727, -0.7130657, -2.947196, 1, 1, 1, 1, 1,
-0.06936604, 1.824493, 2.10578, 1, 1, 1, 1, 1,
-0.06572424, 0.7271294, 0.8393772, 1, 1, 1, 1, 1,
-0.06371572, 0.8424467, -0.7195194, 0, 0, 1, 1, 1,
-0.04981042, 1.692552, -0.8181, 1, 0, 0, 1, 1,
-0.04320132, -0.7393196, -4.167382, 1, 0, 0, 1, 1,
-0.0429364, -0.4120837, -2.097053, 1, 0, 0, 1, 1,
-0.03930053, -0.3576215, -4.9255, 1, 0, 0, 1, 1,
-0.03859372, 0.6368968, -1.523264, 1, 0, 0, 1, 1,
-0.03802543, -2.902358, -3.020768, 0, 0, 0, 1, 1,
-0.03763176, 0.3824134, -0.02940506, 0, 0, 0, 1, 1,
-0.0325937, -0.7674892, -3.027452, 0, 0, 0, 1, 1,
-0.03224616, 0.2291999, -0.9336915, 0, 0, 0, 1, 1,
-0.02641785, 0.5459743, -1.636334, 0, 0, 0, 1, 1,
-0.02559032, -0.8194501, -3.902477, 0, 0, 0, 1, 1,
-0.01912618, -0.595592, -2.249985, 0, 0, 0, 1, 1,
-0.01782553, -0.8236928, -4.144586, 1, 1, 1, 1, 1,
-0.01762857, 0.6937366, 0.4518191, 1, 1, 1, 1, 1,
-0.01639924, 0.05337306, -0.163554, 1, 1, 1, 1, 1,
-0.01579826, 0.4520357, -0.8491107, 1, 1, 1, 1, 1,
-0.01507054, 1.320981, -0.1669398, 1, 1, 1, 1, 1,
-0.01428707, -3.404864, -5.489311, 1, 1, 1, 1, 1,
-0.01313416, -0.3737535, -4.31552, 1, 1, 1, 1, 1,
-0.01084837, -0.04591211, -3.78129, 1, 1, 1, 1, 1,
-0.009651594, 1.192161, 0.310838, 1, 1, 1, 1, 1,
-0.009364989, 2.758696, -0.8991449, 1, 1, 1, 1, 1,
-0.007895574, -0.07168463, -5.166066, 1, 1, 1, 1, 1,
-0.00413642, 0.190082, 1.663412, 1, 1, 1, 1, 1,
-0.002149303, -0.1716265, -3.504782, 1, 1, 1, 1, 1,
0.001115432, -1.199062, 3.177266, 1, 1, 1, 1, 1,
0.003761636, -0.364935, 2.483457, 1, 1, 1, 1, 1,
0.009311509, -1.096788, 3.11181, 0, 0, 1, 1, 1,
0.01437831, 1.760233, 1.473231, 1, 0, 0, 1, 1,
0.01580877, 1.353557, -0.04808959, 1, 0, 0, 1, 1,
0.01842182, 0.3504356, 0.1058637, 1, 0, 0, 1, 1,
0.01938883, -0.3403337, 3.155942, 1, 0, 0, 1, 1,
0.02082678, 0.9347471, -0.9127628, 1, 0, 0, 1, 1,
0.02362587, 1.234656, -0.1723592, 0, 0, 0, 1, 1,
0.02391805, 1.096632, -1.578187, 0, 0, 0, 1, 1,
0.02426675, -1.304984, 4.090142, 0, 0, 0, 1, 1,
0.02767842, -1.27051, 2.23655, 0, 0, 0, 1, 1,
0.02933976, -0.31907, 2.990812, 0, 0, 0, 1, 1,
0.03136403, 1.713304, -0.5401927, 0, 0, 0, 1, 1,
0.0316508, 0.03165331, 1.960783, 0, 0, 0, 1, 1,
0.03171018, -1.80217, 2.634818, 1, 1, 1, 1, 1,
0.03500954, -0.3722695, 1.782292, 1, 1, 1, 1, 1,
0.03706108, -0.5097307, 2.950533, 1, 1, 1, 1, 1,
0.0390153, 0.5185872, -1.010265, 1, 1, 1, 1, 1,
0.04008505, -0.8822589, 4.921259, 1, 1, 1, 1, 1,
0.04117504, 0.8615594, 1.209249, 1, 1, 1, 1, 1,
0.0423109, 0.7076368, 0.4719914, 1, 1, 1, 1, 1,
0.04344914, -0.5464323, 2.529137, 1, 1, 1, 1, 1,
0.04374507, -0.5378542, 2.010764, 1, 1, 1, 1, 1,
0.04446918, 0.1330854, -0.9510884, 1, 1, 1, 1, 1,
0.04454436, 2.092407, -0.8582757, 1, 1, 1, 1, 1,
0.05044037, -1.048883, 1.803514, 1, 1, 1, 1, 1,
0.0528184, 0.2387239, 0.5933095, 1, 1, 1, 1, 1,
0.05363944, 0.08149808, -0.1858202, 1, 1, 1, 1, 1,
0.0599816, 2.276466, 0.3449785, 1, 1, 1, 1, 1,
0.06030099, -0.4277574, 2.520611, 0, 0, 1, 1, 1,
0.0604627, -0.775861, 3.024714, 1, 0, 0, 1, 1,
0.06286788, 2.161773, -0.2458318, 1, 0, 0, 1, 1,
0.06546268, 0.02166426, 1.707377, 1, 0, 0, 1, 1,
0.07337157, 0.7914793, 0.4743643, 1, 0, 0, 1, 1,
0.07522975, 0.6245142, 1.966381, 1, 0, 0, 1, 1,
0.07900322, 0.1432037, -0.3280974, 0, 0, 0, 1, 1,
0.07945049, 0.7820577, -0.8125464, 0, 0, 0, 1, 1,
0.07969848, 0.1537788, 2.286616, 0, 0, 0, 1, 1,
0.07970164, -1.381876, 2.844975, 0, 0, 0, 1, 1,
0.08242293, -0.5177641, 2.148884, 0, 0, 0, 1, 1,
0.09315939, 0.4520949, -1.189366, 0, 0, 0, 1, 1,
0.09478585, -0.3515604, 3.053818, 0, 0, 0, 1, 1,
0.09538682, -0.09384724, 1.21281, 1, 1, 1, 1, 1,
0.09633378, -1.02643, 3.397678, 1, 1, 1, 1, 1,
0.1021411, 1.524699, -0.7845548, 1, 1, 1, 1, 1,
0.1023653, -1.458063, 4.598089, 1, 1, 1, 1, 1,
0.1097774, 0.3145509, -1.040251, 1, 1, 1, 1, 1,
0.1102874, 0.3150249, 0.2439615, 1, 1, 1, 1, 1,
0.111187, 0.1692236, -0.09410435, 1, 1, 1, 1, 1,
0.1116615, -0.6259778, 4.022798, 1, 1, 1, 1, 1,
0.113352, -0.8258539, 2.606776, 1, 1, 1, 1, 1,
0.1136995, -0.2664348, 2.812097, 1, 1, 1, 1, 1,
0.1147042, 0.1074648, 1.112419, 1, 1, 1, 1, 1,
0.1158476, -0.03904121, 3.054734, 1, 1, 1, 1, 1,
0.1159599, 0.2937577, -0.4557379, 1, 1, 1, 1, 1,
0.116145, 0.4142279, -0.756023, 1, 1, 1, 1, 1,
0.1176694, 0.9423286, -1.12832, 1, 1, 1, 1, 1,
0.1180144, -0.8994387, 3.320471, 0, 0, 1, 1, 1,
0.1194348, -0.28078, 3.74998, 1, 0, 0, 1, 1,
0.1207198, -1.638733, 0.8854151, 1, 0, 0, 1, 1,
0.1211114, -0.04620992, 2.593, 1, 0, 0, 1, 1,
0.1237704, 0.3687117, 1.013545, 1, 0, 0, 1, 1,
0.1259394, -1.286316, 4.733582, 1, 0, 0, 1, 1,
0.1265941, 0.255722, 1.755929, 0, 0, 0, 1, 1,
0.1271649, 0.2120749, 0.02720154, 0, 0, 0, 1, 1,
0.1281814, -0.2129334, 2.242409, 0, 0, 0, 1, 1,
0.1288098, 1.05978, -1.523242, 0, 0, 0, 1, 1,
0.1341218, -1.12653, 3.037743, 0, 0, 0, 1, 1,
0.1343799, -1.239591, 3.357426, 0, 0, 0, 1, 1,
0.1351512, 0.7961757, -0.282998, 0, 0, 0, 1, 1,
0.1447414, -1.125515, 3.877264, 1, 1, 1, 1, 1,
0.1492925, 0.08395159, 2.663312, 1, 1, 1, 1, 1,
0.1548493, 0.03383593, 0.2128788, 1, 1, 1, 1, 1,
0.1563154, -0.348953, 3.807139, 1, 1, 1, 1, 1,
0.1636566, -0.1547935, 1.35128, 1, 1, 1, 1, 1,
0.1684965, -0.9921635, 3.460413, 1, 1, 1, 1, 1,
0.1691178, 0.3310472, 0.6783251, 1, 1, 1, 1, 1,
0.1750835, -0.2003822, 3.546194, 1, 1, 1, 1, 1,
0.1776282, 0.9418623, -1.555045, 1, 1, 1, 1, 1,
0.1777346, 1.217378, 1.15557, 1, 1, 1, 1, 1,
0.1791676, 0.3183089, 2.005368, 1, 1, 1, 1, 1,
0.1803349, -0.04986032, 3.398206, 1, 1, 1, 1, 1,
0.1814539, 0.765297, -0.6697988, 1, 1, 1, 1, 1,
0.1835882, 1.19139, -0.3238429, 1, 1, 1, 1, 1,
0.1861075, -1.01766, 6.10416, 1, 1, 1, 1, 1,
0.1990629, -0.1485846, 0.4205225, 0, 0, 1, 1, 1,
0.2003462, 0.1354777, 2.494259, 1, 0, 0, 1, 1,
0.2045911, -0.009468782, 0.1642374, 1, 0, 0, 1, 1,
0.2075427, 0.6236232, 0.2231879, 1, 0, 0, 1, 1,
0.2164383, -1.544447, 4.39671, 1, 0, 0, 1, 1,
0.2184019, -0.4169572, 2.59469, 1, 0, 0, 1, 1,
0.2194753, -0.6620161, 3.224613, 0, 0, 0, 1, 1,
0.220142, -0.6082762, 2.653992, 0, 0, 0, 1, 1,
0.2204746, 1.727621, 0.8686555, 0, 0, 0, 1, 1,
0.2222659, 1.445056, -0.8835548, 0, 0, 0, 1, 1,
0.2251503, -2.583675, 3.016951, 0, 0, 0, 1, 1,
0.2273171, 1.02987, -0.8485738, 0, 0, 0, 1, 1,
0.2309529, -1.987765, 2.010691, 0, 0, 0, 1, 1,
0.2318718, -1.166802, 3.621297, 1, 1, 1, 1, 1,
0.2347239, -0.2597865, 2.430897, 1, 1, 1, 1, 1,
0.2353985, -2.122634, 1.206829, 1, 1, 1, 1, 1,
0.2382337, -1.153419, 4.091032, 1, 1, 1, 1, 1,
0.2427473, 0.8492747, 0.4725262, 1, 1, 1, 1, 1,
0.2450468, 0.6452628, 0.3345655, 1, 1, 1, 1, 1,
0.2469323, 0.8892257, 0.4602737, 1, 1, 1, 1, 1,
0.2529207, 0.309947, 1.801715, 1, 1, 1, 1, 1,
0.2539153, 0.2047788, 0.688314, 1, 1, 1, 1, 1,
0.2552273, -0.1989057, 1.938114, 1, 1, 1, 1, 1,
0.2556079, -0.8454496, 2.66405, 1, 1, 1, 1, 1,
0.2606692, -1.181271, 4.25526, 1, 1, 1, 1, 1,
0.2700473, -1.155586, 2.474308, 1, 1, 1, 1, 1,
0.2713622, 0.2722805, 0.1397552, 1, 1, 1, 1, 1,
0.2728363, -0.62363, 3.816914, 1, 1, 1, 1, 1,
0.2731095, 0.5113958, 0.1372846, 0, 0, 1, 1, 1,
0.2747878, -1.665915, 0.888104, 1, 0, 0, 1, 1,
0.2776861, 1.597349, 2.423905, 1, 0, 0, 1, 1,
0.2790835, 0.1333989, -0.4313685, 1, 0, 0, 1, 1,
0.2794949, -2.014459, 2.349737, 1, 0, 0, 1, 1,
0.2893542, 1.712467, -0.2212738, 1, 0, 0, 1, 1,
0.2901073, 1.116621, 1.86149, 0, 0, 0, 1, 1,
0.2930215, 0.6554617, -1.321962, 0, 0, 0, 1, 1,
0.2934569, 0.4056239, -1.49779, 0, 0, 0, 1, 1,
0.295009, -0.2973133, 1.650606, 0, 0, 0, 1, 1,
0.2952537, 0.4563653, -0.01370265, 0, 0, 0, 1, 1,
0.295836, 0.223563, -0.7910255, 0, 0, 0, 1, 1,
0.2987492, 0.548604, -0.1714148, 0, 0, 0, 1, 1,
0.2989158, -1.120132, 2.11514, 1, 1, 1, 1, 1,
0.3055494, -1.789759, 2.55143, 1, 1, 1, 1, 1,
0.3060764, -2.355713, 3.590034, 1, 1, 1, 1, 1,
0.3091701, 0.6696936, 0.9408095, 1, 1, 1, 1, 1,
0.3128947, 1.631853, 0.6757718, 1, 1, 1, 1, 1,
0.313301, 0.8398249, 0.3785314, 1, 1, 1, 1, 1,
0.3167188, 0.0003157157, 2.677808, 1, 1, 1, 1, 1,
0.3185087, -1.643428, 3.290935, 1, 1, 1, 1, 1,
0.320214, -1.045503, 5.166678, 1, 1, 1, 1, 1,
0.3214896, 1.141937, 0.233644, 1, 1, 1, 1, 1,
0.327147, 0.8892725, 0.03488369, 1, 1, 1, 1, 1,
0.3276038, 1.412042, 0.1507127, 1, 1, 1, 1, 1,
0.3280642, 0.2703019, 2.158931, 1, 1, 1, 1, 1,
0.3288955, -1.019165, 2.914298, 1, 1, 1, 1, 1,
0.3305768, 0.2698292, 0.9914547, 1, 1, 1, 1, 1,
0.3356668, 0.3205517, -1.817104, 0, 0, 1, 1, 1,
0.3358545, -0.624674, 1.820035, 1, 0, 0, 1, 1,
0.336233, 0.5300912, 0.6823829, 1, 0, 0, 1, 1,
0.3363385, -1.82509, 1.923417, 1, 0, 0, 1, 1,
0.336486, 0.5493536, 2.040805, 1, 0, 0, 1, 1,
0.3395637, 1.718054, -1.134348, 1, 0, 0, 1, 1,
0.3404252, 0.3442545, 1.30285, 0, 0, 0, 1, 1,
0.3412601, -0.5608686, 1.665468, 0, 0, 0, 1, 1,
0.3440647, 2.713444, 1.06289, 0, 0, 0, 1, 1,
0.348817, -2.297773, 2.191581, 0, 0, 0, 1, 1,
0.3515907, 0.1206125, 1.801151, 0, 0, 0, 1, 1,
0.3592556, 0.6941374, 1.952978, 0, 0, 0, 1, 1,
0.3623392, 2.269771, 0.2562381, 0, 0, 0, 1, 1,
0.3645232, -1.248874, 3.090984, 1, 1, 1, 1, 1,
0.365016, 0.7707148, 1.443321, 1, 1, 1, 1, 1,
0.3657404, -0.2373888, 1.736929, 1, 1, 1, 1, 1,
0.3668445, 1.267732, 0.8325382, 1, 1, 1, 1, 1,
0.3697201, 0.8738175, 1.557472, 1, 1, 1, 1, 1,
0.371929, 0.3270533, 0.7996156, 1, 1, 1, 1, 1,
0.3722123, -0.2147277, 1.462909, 1, 1, 1, 1, 1,
0.3743288, 0.324036, 1.677004, 1, 1, 1, 1, 1,
0.3747199, 1.673777, -0.9970753, 1, 1, 1, 1, 1,
0.3748052, 0.9113845, 1.936809, 1, 1, 1, 1, 1,
0.3833066, 0.5364833, 1.293864, 1, 1, 1, 1, 1,
0.3868944, 0.5344749, 0.04683491, 1, 1, 1, 1, 1,
0.3964462, -1.064749, 3.10287, 1, 1, 1, 1, 1,
0.3965386, 0.4788736, 1.768504, 1, 1, 1, 1, 1,
0.400762, 0.3419135, 0.2363816, 1, 1, 1, 1, 1,
0.4023952, 0.8269192, -1.947668, 0, 0, 1, 1, 1,
0.4030358, -0.6858031, 2.317316, 1, 0, 0, 1, 1,
0.4058864, 0.7414737, 1.256968, 1, 0, 0, 1, 1,
0.414071, -0.8739135, 3.107021, 1, 0, 0, 1, 1,
0.4148313, -0.7449759, 1.845568, 1, 0, 0, 1, 1,
0.4157311, -0.9735101, 1.613781, 1, 0, 0, 1, 1,
0.4179878, -1.797251, 2.451477, 0, 0, 0, 1, 1,
0.4193649, 1.039622, 1.0267, 0, 0, 0, 1, 1,
0.4212122, -2.317658, 3.087262, 0, 0, 0, 1, 1,
0.4234751, -0.04434089, 3.007599, 0, 0, 0, 1, 1,
0.4258532, -0.04430752, 1.535674, 0, 0, 0, 1, 1,
0.4261677, -0.4439513, 3.433996, 0, 0, 0, 1, 1,
0.4298381, 1.874634, 0.06763714, 0, 0, 0, 1, 1,
0.4342326, 0.5057107, 0.1800124, 1, 1, 1, 1, 1,
0.4346968, 1.358978, 0.4657985, 1, 1, 1, 1, 1,
0.4359018, 1.168218, 1.233266, 1, 1, 1, 1, 1,
0.4371323, -0.6980413, 1.810472, 1, 1, 1, 1, 1,
0.4427694, 0.6406952, 3.468044, 1, 1, 1, 1, 1,
0.4502727, -1.208646, 2.734228, 1, 1, 1, 1, 1,
0.450656, 0.2698421, 0.2553574, 1, 1, 1, 1, 1,
0.4536562, -1.00975, 4.027592, 1, 1, 1, 1, 1,
0.4548755, 0.6509048, -1.227062, 1, 1, 1, 1, 1,
0.4566439, 0.9713135, 0.5164047, 1, 1, 1, 1, 1,
0.4622309, -1.6187, 2.806075, 1, 1, 1, 1, 1,
0.464287, 0.8594534, -0.1481713, 1, 1, 1, 1, 1,
0.4647102, -0.8991176, 3.713294, 1, 1, 1, 1, 1,
0.4687285, 0.1843444, -0.74361, 1, 1, 1, 1, 1,
0.4699472, -1.457786, 3.55662, 1, 1, 1, 1, 1,
0.4726123, -0.3843437, 1.637196, 0, 0, 1, 1, 1,
0.4773435, -0.1840015, 0.1431298, 1, 0, 0, 1, 1,
0.4777368, 1.717589, -0.3752874, 1, 0, 0, 1, 1,
0.4787627, -1.205618, 3.814797, 1, 0, 0, 1, 1,
0.4821376, -0.8043458, 3.835694, 1, 0, 0, 1, 1,
0.4855153, 0.1583416, -0.5150563, 1, 0, 0, 1, 1,
0.4866562, 1.291084, -0.8936497, 0, 0, 0, 1, 1,
0.4881466, -0.4500713, 2.984178, 0, 0, 0, 1, 1,
0.4896456, 1.74386, 1.224283, 0, 0, 0, 1, 1,
0.4922129, 1.805746, -1.281055, 0, 0, 0, 1, 1,
0.4935342, -0.3593184, 1.008648, 0, 0, 0, 1, 1,
0.4964198, 0.7520961, -0.6452034, 0, 0, 0, 1, 1,
0.4988791, -0.1486026, 1.206584, 0, 0, 0, 1, 1,
0.5009834, 0.1191452, -0.5982061, 1, 1, 1, 1, 1,
0.5023841, 1.667382, 0.8137794, 1, 1, 1, 1, 1,
0.5034199, -0.1783689, 2.073057, 1, 1, 1, 1, 1,
0.504006, 1.123915, 0.5231873, 1, 1, 1, 1, 1,
0.507426, 3.350756, -0.8324062, 1, 1, 1, 1, 1,
0.5082757, -0.7661006, 1.00026, 1, 1, 1, 1, 1,
0.5097266, 0.6190122, 1.734876, 1, 1, 1, 1, 1,
0.5121021, -1.478251, 1.722935, 1, 1, 1, 1, 1,
0.5215717, -0.4143357, 2.016895, 1, 1, 1, 1, 1,
0.5248684, -1.200983, 4.148825, 1, 1, 1, 1, 1,
0.5249931, -0.3714631, 2.74359, 1, 1, 1, 1, 1,
0.5266812, -0.2140826, 2.156796, 1, 1, 1, 1, 1,
0.5302998, 1.053818, 1.584659, 1, 1, 1, 1, 1,
0.5311295, 1.036358, 0.2888386, 1, 1, 1, 1, 1,
0.5365218, 1.380796, -0.8612713, 1, 1, 1, 1, 1,
0.5376897, -0.166277, 2.797147, 0, 0, 1, 1, 1,
0.5404112, -0.08753271, 4.197195, 1, 0, 0, 1, 1,
0.5410835, -0.4896777, 1.446878, 1, 0, 0, 1, 1,
0.5454198, -2.070395, 4.153138, 1, 0, 0, 1, 1,
0.5526945, 0.4382506, 2.857605, 1, 0, 0, 1, 1,
0.5576624, 0.6193942, 0.6151849, 1, 0, 0, 1, 1,
0.5601876, -0.3822251, 1.634611, 0, 0, 0, 1, 1,
0.5659148, -0.6387098, 1.388838, 0, 0, 0, 1, 1,
0.5713723, -0.5565766, 3.032008, 0, 0, 0, 1, 1,
0.571965, 0.598271, 0.9138786, 0, 0, 0, 1, 1,
0.5736944, -1.34457, 3.697926, 0, 0, 0, 1, 1,
0.5767723, 0.1902256, 3.528436, 0, 0, 0, 1, 1,
0.5768598, -0.64989, 1.958132, 0, 0, 0, 1, 1,
0.5829166, -0.3507915, 1.304335, 1, 1, 1, 1, 1,
0.5835884, -0.008575917, 0.8955213, 1, 1, 1, 1, 1,
0.5967599, -0.544526, 2.599893, 1, 1, 1, 1, 1,
0.6052417, -0.9676765, 3.560143, 1, 1, 1, 1, 1,
0.6078378, 0.5050405, 1.466134, 1, 1, 1, 1, 1,
0.6132807, 1.764104, -0.2718527, 1, 1, 1, 1, 1,
0.6150776, 1.217673, -0.2922669, 1, 1, 1, 1, 1,
0.6183832, 0.7984498, 0.1189661, 1, 1, 1, 1, 1,
0.6240125, 1.301515, 0.4668642, 1, 1, 1, 1, 1,
0.624374, -0.6368994, 2.021442, 1, 1, 1, 1, 1,
0.6256498, -0.4552351, 3.280287, 1, 1, 1, 1, 1,
0.6267938, 0.5270851, 1.79831, 1, 1, 1, 1, 1,
0.6285759, -0.04408787, 0.9274849, 1, 1, 1, 1, 1,
0.6292977, -1.030354, 3.234313, 1, 1, 1, 1, 1,
0.6388429, -0.251772, 2.359208, 1, 1, 1, 1, 1,
0.6395476, -1.727024, 1.845127, 0, 0, 1, 1, 1,
0.6406775, -1.579675, 2.78744, 1, 0, 0, 1, 1,
0.6433153, -1.048578, 3.919696, 1, 0, 0, 1, 1,
0.6503969, -0.3768488, 3.074156, 1, 0, 0, 1, 1,
0.6522964, 0.4165707, 0.1142825, 1, 0, 0, 1, 1,
0.6567292, 0.4398712, 2.870893, 1, 0, 0, 1, 1,
0.6704465, 0.7125083, -0.2051836, 0, 0, 0, 1, 1,
0.6707551, -0.9397053, 2.849632, 0, 0, 0, 1, 1,
0.6709521, -1.58874, 3.693836, 0, 0, 0, 1, 1,
0.672579, 1.012252, -0.6264806, 0, 0, 0, 1, 1,
0.6725906, 1.053367, 0.7989638, 0, 0, 0, 1, 1,
0.6743304, 1.922207, 1.016287, 0, 0, 0, 1, 1,
0.6755371, -0.3917251, 0.6734321, 0, 0, 0, 1, 1,
0.6799809, -0.08459199, 2.89842, 1, 1, 1, 1, 1,
0.6830359, 0.3983437, 0.9934156, 1, 1, 1, 1, 1,
0.683625, -1.119425, 2.458213, 1, 1, 1, 1, 1,
0.6903867, 0.6385269, 0.864447, 1, 1, 1, 1, 1,
0.6939473, 0.01593636, 0.4254453, 1, 1, 1, 1, 1,
0.7028071, 1.386974, -0.3358723, 1, 1, 1, 1, 1,
0.7067184, -1.485346, 3.52644, 1, 1, 1, 1, 1,
0.7192405, 0.6974025, 1.606719, 1, 1, 1, 1, 1,
0.7199136, -1.573855, 2.772511, 1, 1, 1, 1, 1,
0.7217372, -0.2563346, -0.4439991, 1, 1, 1, 1, 1,
0.7250935, 2.21352, 0.1115462, 1, 1, 1, 1, 1,
0.7253087, -0.6687822, 0.9675266, 1, 1, 1, 1, 1,
0.7264871, 0.2027362, 1.477943, 1, 1, 1, 1, 1,
0.7277855, -1.981774, 3.32128, 1, 1, 1, 1, 1,
0.7283123, 1.609581, -0.03119478, 1, 1, 1, 1, 1,
0.7309224, 0.6235455, -1.176975, 0, 0, 1, 1, 1,
0.7327908, 0.878855, 1.939185, 1, 0, 0, 1, 1,
0.7363029, -0.7337511, 2.567597, 1, 0, 0, 1, 1,
0.7379639, 0.08075088, 2.657549, 1, 0, 0, 1, 1,
0.7479645, -0.5429258, 2.287181, 1, 0, 0, 1, 1,
0.7534124, 0.1146994, 1.699902, 1, 0, 0, 1, 1,
0.7546295, -1.726025, 1.653642, 0, 0, 0, 1, 1,
0.757848, 1.510731, 2.776012, 0, 0, 0, 1, 1,
0.7587784, 1.326643, -1.133636, 0, 0, 0, 1, 1,
0.7591477, 1.73486, -0.7324859, 0, 0, 0, 1, 1,
0.7645995, -1.327609, 2.43091, 0, 0, 0, 1, 1,
0.7674414, -0.7613079, 1.691288, 0, 0, 0, 1, 1,
0.7681988, 1.258191, 1.308649, 0, 0, 0, 1, 1,
0.7690008, -0.2093616, 1.346437, 1, 1, 1, 1, 1,
0.7720412, 1.371349, 1.317187, 1, 1, 1, 1, 1,
0.7721996, 0.6423733, 0.4702738, 1, 1, 1, 1, 1,
0.7754814, 0.3674729, 0.5925978, 1, 1, 1, 1, 1,
0.7755138, -0.1505601, 1.85862, 1, 1, 1, 1, 1,
0.7769969, -0.8035663, 2.377172, 1, 1, 1, 1, 1,
0.786217, 1.468105, 1.85461, 1, 1, 1, 1, 1,
0.7906541, -0.1222892, 3.105145, 1, 1, 1, 1, 1,
0.7906558, 1.093615, 1.81877, 1, 1, 1, 1, 1,
0.7958421, -1.470664, 3.345003, 1, 1, 1, 1, 1,
0.795903, 1.076248, 1.312329, 1, 1, 1, 1, 1,
0.7973427, -1.33115, 0.9943961, 1, 1, 1, 1, 1,
0.7981177, 0.01056262, -0.1184771, 1, 1, 1, 1, 1,
0.7984349, 0.5968304, 0.5962781, 1, 1, 1, 1, 1,
0.8039589, -0.9590623, 2.002565, 1, 1, 1, 1, 1,
0.8124611, -0.4252714, 2.686399, 0, 0, 1, 1, 1,
0.8203813, 0.3119853, 0.3399498, 1, 0, 0, 1, 1,
0.8238264, -0.04986889, 1.404711, 1, 0, 0, 1, 1,
0.8257559, 0.7443219, 1.188977, 1, 0, 0, 1, 1,
0.8306354, 0.04041493, 2.927031, 1, 0, 0, 1, 1,
0.8328971, -0.5154832, 3.492612, 1, 0, 0, 1, 1,
0.8342679, -0.7491461, 1.856556, 0, 0, 0, 1, 1,
0.8359664, -0.3473794, -0.4908449, 0, 0, 0, 1, 1,
0.8457556, -1.177783, 3.372419, 0, 0, 0, 1, 1,
0.8481055, 0.2448443, 0.7355814, 0, 0, 0, 1, 1,
0.8505607, 0.7182038, 1.714225, 0, 0, 0, 1, 1,
0.8543873, -0.2581302, 2.262496, 0, 0, 0, 1, 1,
0.8547649, -0.340289, 1.489413, 0, 0, 0, 1, 1,
0.8559687, -0.7853031, 2.24444, 1, 1, 1, 1, 1,
0.8583154, -0.07216824, 2.963392, 1, 1, 1, 1, 1,
0.859587, -0.0002463797, 1.167712, 1, 1, 1, 1, 1,
0.864903, 0.6470553, 1.679356, 1, 1, 1, 1, 1,
0.8658888, 1.410952, 1.808507, 1, 1, 1, 1, 1,
0.8683999, -2.254606, 4.333689, 1, 1, 1, 1, 1,
0.8694514, 0.02923601, 0.3667887, 1, 1, 1, 1, 1,
0.8718229, -0.1335807, 0.4329168, 1, 1, 1, 1, 1,
0.8737398, 1.090487, 1.845674, 1, 1, 1, 1, 1,
0.8788592, -0.5551606, 3.162468, 1, 1, 1, 1, 1,
0.8864615, 0.1551092, 1.683123, 1, 1, 1, 1, 1,
0.8910716, 0.5632592, 1.396928, 1, 1, 1, 1, 1,
0.8927166, 1.05621, 0.02071088, 1, 1, 1, 1, 1,
0.8941779, -0.03718963, 1.75157, 1, 1, 1, 1, 1,
0.8949401, 1.889215, -0.6512258, 1, 1, 1, 1, 1,
0.8956398, 0.1148151, -0.1247931, 0, 0, 1, 1, 1,
0.9018264, -0.8635945, 3.034378, 1, 0, 0, 1, 1,
0.903655, 0.1015861, 2.292689, 1, 0, 0, 1, 1,
0.90478, -0.5001212, 2.471107, 1, 0, 0, 1, 1,
0.9083865, -0.6893496, 2.453506, 1, 0, 0, 1, 1,
0.9147726, -0.1142775, 2.031826, 1, 0, 0, 1, 1,
0.9211059, 0.251372, 1.74268, 0, 0, 0, 1, 1,
0.9243125, 0.695505, 1.050074, 0, 0, 0, 1, 1,
0.9260327, -0.2228188, 3.875855, 0, 0, 0, 1, 1,
0.9266103, -0.4677491, 1.895308, 0, 0, 0, 1, 1,
0.9302062, 0.2258305, 0.8494115, 0, 0, 0, 1, 1,
0.930878, 0.1450896, 2.302387, 0, 0, 0, 1, 1,
0.9319823, -1.039348, 2.14268, 0, 0, 0, 1, 1,
0.9374155, -0.6027323, 3.324794, 1, 1, 1, 1, 1,
0.9389682, 1.232176, 2.126292, 1, 1, 1, 1, 1,
0.9397846, 0.01234434, 0.5057077, 1, 1, 1, 1, 1,
0.9402897, 1.284375, 0.002844276, 1, 1, 1, 1, 1,
0.9430739, 0.1565515, 0.1855431, 1, 1, 1, 1, 1,
0.9432, -1.356961, 1.99184, 1, 1, 1, 1, 1,
0.9440999, -0.3065507, 1.818967, 1, 1, 1, 1, 1,
0.9464599, -0.4042808, 1.014884, 1, 1, 1, 1, 1,
0.9494412, 1.438169, 1.938535, 1, 1, 1, 1, 1,
0.9496164, -2.190076, 3.225227, 1, 1, 1, 1, 1,
0.9503846, 0.9945822, -1.254312, 1, 1, 1, 1, 1,
0.9534978, 0.4726556, 1.725886, 1, 1, 1, 1, 1,
0.9540377, -0.2308913, 3.838855, 1, 1, 1, 1, 1,
0.9549246, -2.167149, 1.98985, 1, 1, 1, 1, 1,
0.9565837, -0.1432463, 1.846456, 1, 1, 1, 1, 1,
0.9693241, 1.446411, -0.2071797, 0, 0, 1, 1, 1,
0.9804385, -1.189929, 3.285861, 1, 0, 0, 1, 1,
0.9848413, -0.9816645, 1.056765, 1, 0, 0, 1, 1,
0.9892007, -1.282391, 2.377633, 1, 0, 0, 1, 1,
0.9964235, 0.07228835, 2.395293, 1, 0, 0, 1, 1,
0.9993386, -0.2333714, 1.760516, 1, 0, 0, 1, 1,
1.001678, 2.163758, 2.565677, 0, 0, 0, 1, 1,
1.006626, 1.82088, -0.2533562, 0, 0, 0, 1, 1,
1.014122, 0.124232, -0.348746, 0, 0, 0, 1, 1,
1.014184, 0.7069288, 0.9316056, 0, 0, 0, 1, 1,
1.023103, -1.339575, 2.477038, 0, 0, 0, 1, 1,
1.027303, -1.297942, 3.262574, 0, 0, 0, 1, 1,
1.035064, 0.01870375, 0.7426614, 0, 0, 0, 1, 1,
1.036395, -0.6979344, 1.736636, 1, 1, 1, 1, 1,
1.041483, 1.810582, 0.8230612, 1, 1, 1, 1, 1,
1.044543, 1.026817, 0.04582815, 1, 1, 1, 1, 1,
1.047349, 1.503935, 0.4048643, 1, 1, 1, 1, 1,
1.051809, -0.8200268, 1.965865, 1, 1, 1, 1, 1,
1.052404, -0.3546228, 3.231882, 1, 1, 1, 1, 1,
1.053459, 0.5775467, 1.216397, 1, 1, 1, 1, 1,
1.054554, -1.437763, 4.360687, 1, 1, 1, 1, 1,
1.063657, -1.074258, 2.115319, 1, 1, 1, 1, 1,
1.064177, 1.266445, 0.9032104, 1, 1, 1, 1, 1,
1.065932, 0.5734514, 1.980667, 1, 1, 1, 1, 1,
1.068989, 2.125156, 0.7767874, 1, 1, 1, 1, 1,
1.079131, -0.4724346, 2.763246, 1, 1, 1, 1, 1,
1.080049, 1.289996, 1.375335, 1, 1, 1, 1, 1,
1.085974, -0.1847518, 2.156527, 1, 1, 1, 1, 1,
1.088633, -0.1063505, 1.245454, 0, 0, 1, 1, 1,
1.09391, -0.6700135, 3.340686, 1, 0, 0, 1, 1,
1.094778, 1.046903, 1.08293, 1, 0, 0, 1, 1,
1.100757, 0.1698083, 0.3493868, 1, 0, 0, 1, 1,
1.106719, 0.07454678, 1.057943, 1, 0, 0, 1, 1,
1.106738, -1.600281, 3.405861, 1, 0, 0, 1, 1,
1.108918, -1.157396, 2.766592, 0, 0, 0, 1, 1,
1.120968, 0.09527872, 0.2636617, 0, 0, 0, 1, 1,
1.12295, -0.6274416, 3.134694, 0, 0, 0, 1, 1,
1.13201, -0.6632373, 3.13331, 0, 0, 0, 1, 1,
1.149162, -1.084018, 3.271837, 0, 0, 0, 1, 1,
1.167593, 0.1251543, 3.056848, 0, 0, 0, 1, 1,
1.170295, -0.07516236, 1.132197, 0, 0, 0, 1, 1,
1.173782, 0.6004195, 1.879539, 1, 1, 1, 1, 1,
1.175781, -0.5388126, 1.953563, 1, 1, 1, 1, 1,
1.180808, 0.6340814, -0.5466914, 1, 1, 1, 1, 1,
1.190269, -0.9775023, 1.849088, 1, 1, 1, 1, 1,
1.191033, -0.8039898, 0.6522313, 1, 1, 1, 1, 1,
1.213124, -0.08929193, 0.9912999, 1, 1, 1, 1, 1,
1.213984, -0.5587812, 3.035518, 1, 1, 1, 1, 1,
1.216221, -0.4347493, 1.894734, 1, 1, 1, 1, 1,
1.219535, 0.4517228, 1.586755, 1, 1, 1, 1, 1,
1.220291, -1.09209, 2.3023, 1, 1, 1, 1, 1,
1.220846, 0.6962562, 0.7157404, 1, 1, 1, 1, 1,
1.229453, -1.088856, 3.23797, 1, 1, 1, 1, 1,
1.232807, 0.1333422, 1.664268, 1, 1, 1, 1, 1,
1.236131, -1.577897, 2.159099, 1, 1, 1, 1, 1,
1.248068, 0.3175388, 3.488896, 1, 1, 1, 1, 1,
1.26321, -1.124717, 4.005151, 0, 0, 1, 1, 1,
1.267719, 1.65709, 2.1972, 1, 0, 0, 1, 1,
1.269215, -0.9840816, 1.306357, 1, 0, 0, 1, 1,
1.274451, -1.089163, 3.013684, 1, 0, 0, 1, 1,
1.275945, 0.2904429, 0.4655707, 1, 0, 0, 1, 1,
1.279732, 0.842847, -0.575883, 1, 0, 0, 1, 1,
1.294266, 0.7536066, -0.2153752, 0, 0, 0, 1, 1,
1.300499, -0.9304438, 3.496498, 0, 0, 0, 1, 1,
1.305502, 0.9297798, 0.7041174, 0, 0, 0, 1, 1,
1.309293, 1.768297, 1.850192, 0, 0, 0, 1, 1,
1.309513, -0.9464166, 0.006819528, 0, 0, 0, 1, 1,
1.321047, 0.776346, 2.578442, 0, 0, 0, 1, 1,
1.323491, 0.6085154, 1.192944, 0, 0, 0, 1, 1,
1.325315, -0.02540366, -0.4104029, 1, 1, 1, 1, 1,
1.328057, -0.558193, 1.980795, 1, 1, 1, 1, 1,
1.350169, -1.649155, 3.344265, 1, 1, 1, 1, 1,
1.350413, -0.6533878, 3.567584, 1, 1, 1, 1, 1,
1.353119, 0.05074786, 1.333035, 1, 1, 1, 1, 1,
1.355123, -1.120073, 2.317257, 1, 1, 1, 1, 1,
1.358426, 0.5965763, 2.322974, 1, 1, 1, 1, 1,
1.368556, -1.163461, 1.192342, 1, 1, 1, 1, 1,
1.373568, -0.3006179, 2.415754, 1, 1, 1, 1, 1,
1.374782, 0.8977672, 0.3629316, 1, 1, 1, 1, 1,
1.381723, 1.014814, 0.1933122, 1, 1, 1, 1, 1,
1.385687, 1.244007, 1.069463, 1, 1, 1, 1, 1,
1.391831, -0.7305335, 1.749373, 1, 1, 1, 1, 1,
1.401614, -0.1167085, 2.537998, 1, 1, 1, 1, 1,
1.401974, 0.7843012, 0.05928569, 1, 1, 1, 1, 1,
1.408054, 0.6194878, -0.2296969, 0, 0, 1, 1, 1,
1.41171, 0.8273569, 1.050969, 1, 0, 0, 1, 1,
1.430009, 0.08619694, 1.37673, 1, 0, 0, 1, 1,
1.430626, 2.097061, -1.028309, 1, 0, 0, 1, 1,
1.4321, -0.7718847, 2.142125, 1, 0, 0, 1, 1,
1.443788, -1.129861, 3.747092, 1, 0, 0, 1, 1,
1.444715, -1.253566, 1.313845, 0, 0, 0, 1, 1,
1.462549, 0.9872762, 1.858409, 0, 0, 0, 1, 1,
1.464993, 0.6865048, 2.930258, 0, 0, 0, 1, 1,
1.477992, 0.2741774, 1.527792, 0, 0, 0, 1, 1,
1.486752, -1.511005, 2.431592, 0, 0, 0, 1, 1,
1.491086, 0.4731132, 0.9647774, 0, 0, 0, 1, 1,
1.51143, 1.595142, 1.179185, 0, 0, 0, 1, 1,
1.530401, -2.570399, 3.019971, 1, 1, 1, 1, 1,
1.533096, 0.203561, 0.5546684, 1, 1, 1, 1, 1,
1.544262, 1.718108, 0.3646943, 1, 1, 1, 1, 1,
1.552597, 0.1489531, 0.9385511, 1, 1, 1, 1, 1,
1.555118, 1.457986, 1.055014, 1, 1, 1, 1, 1,
1.556025, -0.5146034, 0.1909263, 1, 1, 1, 1, 1,
1.560455, -0.3914386, 0.24417, 1, 1, 1, 1, 1,
1.575484, 0.9137134, 1.700291, 1, 1, 1, 1, 1,
1.576182, -0.310761, 2.545446, 1, 1, 1, 1, 1,
1.595528, -0.2226687, 2.348571, 1, 1, 1, 1, 1,
1.607418, 1.123584, -0.2161234, 1, 1, 1, 1, 1,
1.607434, -1.040719, 1.835733, 1, 1, 1, 1, 1,
1.664002, 0.178822, 1.595217, 1, 1, 1, 1, 1,
1.668455, -0.3620339, 0.7497602, 1, 1, 1, 1, 1,
1.676473, 0.1457001, 0.7412025, 1, 1, 1, 1, 1,
1.687561, 0.09881884, 1.31444, 0, 0, 1, 1, 1,
1.693749, 1.349232, 0.917646, 1, 0, 0, 1, 1,
1.718849, 0.2986789, 1.21931, 1, 0, 0, 1, 1,
1.736998, -1.725889, 0.379794, 1, 0, 0, 1, 1,
1.737005, 2.573349, 0.01325568, 1, 0, 0, 1, 1,
1.743223, 1.842194, 1.294557, 1, 0, 0, 1, 1,
1.744239, 0.6363977, 1.368037, 0, 0, 0, 1, 1,
1.745494, 1.142831, 1.836154, 0, 0, 0, 1, 1,
1.746113, -2.02368, 3.243421, 0, 0, 0, 1, 1,
1.74898, 0.5108939, -0.4159581, 0, 0, 0, 1, 1,
1.760454, 2.045726, -0.7215131, 0, 0, 0, 1, 1,
1.773498, -0.06756788, 0.4929725, 0, 0, 0, 1, 1,
1.776161, 3.448947, -0.1583123, 0, 0, 0, 1, 1,
1.78816, -0.4208497, 1.777138, 1, 1, 1, 1, 1,
1.791117, 0.7145337, 2.360968, 1, 1, 1, 1, 1,
1.816029, -0.4773889, 2.113157, 1, 1, 1, 1, 1,
1.826237, -1.018902, 0.3809388, 1, 1, 1, 1, 1,
1.827248, 1.255156, 0.2843358, 1, 1, 1, 1, 1,
1.842951, -0.787073, 1.074012, 1, 1, 1, 1, 1,
1.845617, -0.5635259, 1.644621, 1, 1, 1, 1, 1,
1.856531, -0.02047833, 1.424999, 1, 1, 1, 1, 1,
1.874282, -1.983214, 2.389073, 1, 1, 1, 1, 1,
1.874607, -0.6228901, 1.689227, 1, 1, 1, 1, 1,
1.886464, 0.5541939, 1.332075, 1, 1, 1, 1, 1,
1.907049, 0.1210557, 2.130459, 1, 1, 1, 1, 1,
1.915727, 0.4110682, 1.479832, 1, 1, 1, 1, 1,
1.920149, 1.795792, 0.7927719, 1, 1, 1, 1, 1,
1.929629, 0.6327246, 2.320656, 1, 1, 1, 1, 1,
1.930036, 0.4540105, 1.856013, 0, 0, 1, 1, 1,
1.958408, 0.2786882, 1.421041, 1, 0, 0, 1, 1,
1.966409, -0.9487155, 3.042342, 1, 0, 0, 1, 1,
1.979229, 0.5145233, 2.406762, 1, 0, 0, 1, 1,
1.993988, -0.4604277, 1.966977, 1, 0, 0, 1, 1,
2.037367, -2.072289, 2.383375, 1, 0, 0, 1, 1,
2.061825, -0.3834208, 0.820136, 0, 0, 0, 1, 1,
2.189046, -0.435698, -0.1893943, 0, 0, 0, 1, 1,
2.25961, 0.7184697, 2.140536, 0, 0, 0, 1, 1,
2.361412, -0.3609426, 1.264058, 0, 0, 0, 1, 1,
2.368473, -0.4707051, 1.662474, 0, 0, 0, 1, 1,
2.37623, 1.157945, 1.046772, 0, 0, 0, 1, 1,
2.395126, -0.4974174, 2.014763, 0, 0, 0, 1, 1,
2.447302, -0.8192437, 2.435801, 1, 1, 1, 1, 1,
2.634878, 0.3496207, 0.1745174, 1, 1, 1, 1, 1,
2.637199, 0.06158118, 3.163076, 1, 1, 1, 1, 1,
2.675984, 0.8252164, 1.194787, 1, 1, 1, 1, 1,
2.706711, -0.08383992, 1.432644, 1, 1, 1, 1, 1,
2.806726, -1.376794, 2.018507, 1, 1, 1, 1, 1,
2.865001, 1.224463, 1.052682, 1, 1, 1, 1, 1
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
var radius = 10.03017;
var distance = 35.23056;
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
mvMatrix.translate( 0.3004537, -0.02204156, -0.3074243 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.23056);
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
